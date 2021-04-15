--決定順序的函式
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
--控制表演的函式
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
			ScriptMessage( Party[i], Party[i], 0,GetString("SC_111368_7"), 1 ); --薩斯柯特的幻影喊到：除了通過試煉，只有死亡能帶你們離開這裡！
			PlayMotion(OwnerID() , ruFUSION_ACTORSTATE_EMOTE_IDLE0 )
			sleep( 10 )
			ScriptMessage( Party[i], Party[i], 0,GetString("SC_111368_8"), 1 ); --薩斯柯特的幻影喊到：鑲著寶石的門是最後的鎖，也是最後的鑰匙！
			sleep( 10 )
			ScriptMessage( Party[i], Party[i], 0,GetString("SC_111368_9"), 1 ); --薩斯柯特的幻影喊到：仔細看好那些門吧！
			PlayMotion(OwnerID() , ruFUSION_ACTORSTATE_EMOTE_IDLE0 )
		end
	else
		for i = 1 , Party[0] , 1 do
			ScriptMessage( Party[i], Party[i], 0,GetString("SC_111368_9"), 1 ); --薩斯柯特的幻影喊到：仔細看好那些門吧！
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
		ScriptMessage( Party[i], Party[i], 0,GetString("SC_111368_10"), 1 ); --薩斯柯特的幻影喊到：現在輪到你們了...讓遊戲開始吧！
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
			if Cache[input] ~= Password[input] then --超過時間或答錯
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

	if Result == "WRONG" then --如果答錯的話
		LuaS_TheThiefKing_Fail(Door)
	else --如果答對的話
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