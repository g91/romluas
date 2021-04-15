--�M�w���Ǫ��禡
function Lua_TheThiefKing_Password()
	local Password = {}
	local RandNum

	Password[0] =  ReadRoleValue( OwnerID() , EM_RoleValue_Register + 9 ) 

	for i = 1 , Password[0] , 1 do
		RandNum = Rand(100)
		Password[i] = ( RandNum - math.floor( RandNum/10 )*10 ) 
		Password[i] = ( Password[i]  - math.floor( Password[i] /5 )*5 ) +1
	end
	return Password
end
--�����t���禡
function LuaS_TheThiefKing_Play()
	local Door = {}
	local Party = LuaFunc_PartyData(TargetID())  
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Password = Lua_TheThiefKing_Password()
	local CheckTime = 230

	for i = 1 , 7 , 1 do
		Door[i] = ReadRoleValue( OwnerID() , EM_RoleValue_Register + i )
	end

	for i = 1 , 5 , 1 do
		WriteRoleValue( Door[i] , EM_RoleValue_PID , i )
		WriteRoleValue( Door[i] , EM_RoleValue_Register , OwnerID() )
	end

	Show( Door[6] , RoomID ) 

	if Password[0] == 3 then
		for i = 1 , Party[0] , 1 do
			ScriptMessage( Party[i], Party[i], 0,GetString("SC_111368_7"), 1 ); --�Ĵ��_�S���ۼv�ۨ�G���F�q�L�շҡA�u�����`��a�A�����}�o�̡I
			PlayMotion(OwnerID() , ruFUSION_ACTORSTATE_EMOTE_IDLE0 )
			sleep( 10 )
			ScriptMessage( Party[i], Party[i], 0,GetString("SC_111368_8"), 1 ); --�Ĵ��_�S���ۼv�ۨ�G�^���_�۪����O�̫᪺��A�]�O�̫᪺�_�͡I
			sleep( 10 )
			ScriptMessage( Party[i], Party[i], 0,GetString("SC_111368_9"), 1 ); --�Ĵ��_�S���ۼv�ۨ�G�J�Ӭݦn���Ǫ��a�I
			PlayMotion(OwnerID() , ruFUSION_ACTORSTATE_EMOTE_IDLE0 )
		end
	else
		for i = 1 , Party[0] , 1 do
			ScriptMessage( Party[i], Party[i], 0,GetString("SC_111368_9"), 1 ); --�Ĵ��_�S���ۼv�ۨ�G�J�Ӭݦn���Ǫ��a�I
			PlayMotion(OwnerID() , ruFUSION_ACTORSTATE_EMOTE_IDLE0 )
		end
	end

	for i = 1 , 5 , 1 do
		Show( Door[i] , RoomID )
	end
	sleep( 30 )
	for i = 1 , Password[0] , 1 do
		Cache = Password[i]
		PlayMotionEX( Door[Cache] , ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP )
		sleep(15)
		PlayMotion( Door[Cache] , ruFUSION_ACTORSTATE_ACTIVATE_END )
		sleep(15)
	end

	for i = 1 , Party[0] , 1 do
		ScriptMessage( Party[i], Party[i], 0,GetString("SC_111368_10"), 1 ); --�Ĵ��_�S���ۼv�ۨ�G�{�b����A�̤F...���C���}�l�a�I
		PlayMotion(OwnerID() , ruFUSION_ACTORSTATE_EMOTE_IDLE0 )
	end

	local Cache = {}
	local input = 0
	local Result = "WAIT"
	local CountDown = 0
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 )
	sleep(10)

	for i = 1 , 5 , 1 do
		SetPlot( Door[i] ,"touch" ,"LuaFunc_TheThiefKing_Touch" , 20 )
	end
	Cache[input] = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
			
	while 1 do 
		sleep(1)

		if Cache[input] < ReadRoleValue( OwnerID() , EM_RoleValue_PID ) and input<= Password[0] then
			Cache[input+1] = ReadRoleValue( OwnerID() , EM_RoleValue_PID ) - Cache[input]
			input = input + 1
--			Say( OwnerID() , "Num="..input.." Answer=".. Cache[input] .." PW="..Password[input] )
			if Cache[input] ~= Password[input] then --�W�L�ɶ��ε���
				Result = "WRONG"
				break
			else
				Cache[input] = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
				CountDown = 0
			end
		end

--		if ( CheckTime - CountDown ) < 50 and ( (CheckTime -CountDown) - math.floor((CheckTime -CountDown)/10) ) == 0 then
--			Say( OwnerID() , "Count Down "..math.floor((CheckTime -CountDown)/10).." sec " )
--		end

		if  CountDown >= CheckTime then
			Result = "WRONG"
			for i = 1 , Party[0] , 1 do
				ScriptMessage( Party[i], Party[i], 0,GetString("SC_111368_18"), 1 ); 
				PlayMotion(OwnerID() , ruFUSION_ACTORSTATE_EMOTE_IDLE1 )
			end
			break
		end

		if input >= table.getn(Password) then
			Result = "BINGO"
			break
		end
		CountDown = CountDown + 1
	end

	sleep(31)
	for i = 1 , 5 , 1 do
		SetPlot( Door[i] ,"touch" ,"" , 0 )
	end

	if Result == "WRONG" then --�p�G��������
		LuaS_TheThiefKing_Fail(Door)
	else --�p�G���諸��
		LuaS_TheThiefKing_BossBattle(Door)

	end

end

function LuaFunc_TheThiefKing_Touch()
	SetPlot( TargetID() ,"touch" ,"" , 0 )
	BeginPlot(TargetID() , "LuaFunc_TheThiefKing_Touch_2" , 0 )
end

function LuaFunc_TheThiefKing_Touch_2()
	local Controler = ReadRoleValue( OwnerID() , EM_RoleValue_Register )
	local CheckID = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local Password = ReadRoleValue( Controler , EM_RoleValue_PID )
	Password = Password + CheckID
	WriteRoleValue( Controler , EM_RoleValue_PID ,  Password )

	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP )
	sleep(15)
	PlayMotion(OwnerID(), ruFUSION_ACTORSTATE_ACTIVATE_END )
	sleep(15)

	SetPlot( OwnerID() ,"touch" ,"LuaFunc_TheThiefKing_Touch" , 20 )
end		