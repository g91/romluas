--control--104650
--�_�c�X--781455--ID--104529
--�Ǫ��X--781456
--BOSS--104472--104482--104526
--ID--104473--104474--104483--104484--104527--104528

--�� ���H���H�� ��--
function sasa_deadpp_attack01()
	local mob = OwnerID()
	local Room = ReadRoleValue( mob , EM_RoleValue_RoomID )		--Ū�b���@�h
	local EnterFight
	SetDefIdleMotion( mob, ruFUSION_MIME_IDLE_DEAD )
	while 1 do
		sleep(10)
		local AttackTarget = ReadRoleValue( mob , EM_RoleValue_AttackTargetID )
		if HateListCount( mob ) ~= 0 then			--Ū������ƶq(���H)
			SetDefIdleMotion( mob , ruFUSION_MIME_NONE )
			if EnterFight == 0 then
				EnterFight = 1
				Sleep(10)
				SetDefIdleMotion( mob , ruFUSION_MIME_ATTACK_1H )
			end
		elseif HateListCount( mob ) == 0 then		--Ū������ƶq(�S�H)
			Sleep(20)
			SetDefIdleMotion( mob, ruFUSION_MIME_IDLE_DEAD )
			if EnterFight == 1 then
				EnterFight = 0
			end
		end
	end
end

--�� �H��BOSS�_�c ��--
function sasa_Random_control215()
	local Count = OwnerID()
	local Room = ReadRoleValue( Count , EM_RoleValue_RoomID )
	local ZoneID = ReadRoleValue( Count , EM_RoleValue_ZoneID )
	local BossNum = { 104472 , 104482 , 104526 }
	local class
	if ZoneID == 215 then		--����1
		class = 1
	elseif ZoneID == 216 then	--����2
		class = 2
	elseif ZoneID == 217 then	--����3
		class = 3
	end
	local Flag = DW_CircleRand(20)	--�ݬ����X�ƶq����

--�� �H��BOSS ��--
	for a = 1 , 5 do
		local boss = CreateObjByFlag( BossNum[class] , 781456 , Flag()+0 , 1 )--����RAND���]�tflag0�A�ҥH�qflag4�}�l�ت���A�n�gFlag()+3�A���Lflag1~3
		AddToPartition( boss , Room )
	end
	sleep(10)

--�� �H���_�c ��--
	for b = 1 , 5 do
	local Treasure = CreateObjByFlag( 104529 , 781455 , Flag()+0 , 1 )
	SetModeEx( Treasure , EM_SetModeType_Searchenemy, false )   			--����
	SetModeEx( Treasure , EM_SetModeType_Fight, false ) 					--���
	SetModeEx( Treasure , EM_SetModeType_Move, false )						--����
	SetModeEx( Treasure , EM_SetModeType_Strikback, false )					--����
	AddToPartition( Treasure , Room )
	BeginPlot( Treasure , "sasa_104529_Treasure", 0 )
	end
end

--�� �_�cAI ��--
function sasa_104529_Treasure()
	SetPlot( OwnerID() ,"touch", "sasa_104529_Treasure_open" ,40 )
end

function sasa_104529_Treasure_open()
	SetPlot( TargetID() ,"touch", "" ,0 )
	Sleep(20)
	KillID( OwnerID() , TargetID() )
end

--�� �ǰe�� ��--
function ZONE_215_217_OUTDOOR_1()
	SetPlot( OwnerID() , "Collision" , "ZONE_215_217_OUTDOOR_2" , 0 )
end

function ZONE_215_217_OUTDOOR_2()	--�X�ƥ��᪺�y���I
	if ChangeZone( OwnerID() , 2 , 0 , 5795 , 50 , -2930 , 0 ) then	--ZONE,�h,X,Y,Z,Dir
	else
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
	end
end

--�� �p�ɾ� ��--�ɶ��������X�ƥ��h�L�k�b�����A�ݭ��Y�}�l�C
function sasa_mirrorworld_clockopen()
	local Player = OwnerID()
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local String = { "[SC_PHANTOM_TIME_START01]" , "[SC_PHANTOM_TIME_START02]" , "[SC_PHANTOM_TIME_END01]" }
	--�A��15�����i�H�n�n�B�ΡI
	--�A���ɶ����b�@���@��a�y�u���K�K
	--�ɶ���A�U���A�ӧa�I
	sleep(20)
	ScriptMessage( Player , -1 , 2 , String[1] , "0xff6fb7ff" )
	------------��H-------��@�ɱM�νs��------�}�l--�{�b--����-----���ϼ@��-----------�ɶ������@��
	ClockOpen( Player , EM_ClockCheckValue_33 , 900 , 900 , 0 , "Lua_Clockending" , "Lua_Clockending" )
	sleep(8990)--���W�ɶ��G15����, 15*60=900, 900-1=899=8990�@��
	ScriptMessage( Player , -1 , 2 , String[3] , "0xff6fb7ff" )
	sleep(20)
	ChangeZone( Player , 2 , 0 , 5795 , 50 , -2930 , 0 )	--�ɶ���ǥX�ƥ�
end

--------------------------------------------------------------------------------------------------------------

--[[�� �ª����p�ɾ� ��--�ɶ��������i�X�ƥ��|Ū���Ѿl�ɶ������C
function sasa_mirrorworld_clockopenkeep()
	local Player = OwnerID()
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local Pos					--���aBUFF��m
	local Time					--�ƥ��Ѿl�ɶ��ܼ�
	local TimeBuff = 626288		--�ƥ��ɶ��P�_��
	local String = { "[SC_PHANTOM_TIME_START01]" , "[SC_PHANTOM_TIME_START02]" , "[SC_PHANTOM_TIME_END01]" }
	--�A��15�����i�H�n�n�B�ΡI
	--�A���ɶ����b�@���@��a�y�u���K�K
	--�ɶ���A�U���A�ӧa�I
	
	if CheckBuff( Player , TimeBuff ) == true then
		Pos = Lua_BuffPosSearch( OwnerID() , TimeBuff )				--�T�{BUFF��m
		Time = BuffInfo( OwnerID() , Pos , EM_BuffInfoType_Time )	--Ū���ɶ�
		sleep(20)
		ScriptMessage( Player , -1 , 2 , String[2] , "0xff6fb7ff" )
		AddBuff( Player , TimeBuff , 0 , Time )						--�����ѤU���ɶ�
		------------��H-------��@�ɱM�νs��------�}�l--�{�b--����-----���ϼ@��-----------�ɶ������@��
		ClockOpen( Player , EM_ClockCheckValue_33 , Time , Time , 0 , "Lua_Clockending" , "Lua_Clockending" )
		sleep((Time-1)*10)--�Ѿl�ɶ�-1��*10=�@��
		ScriptMessage( Player , -1 , 2 , String[3] , "0xff6fb7ff" )
		sleep(20)
		ChangeZone( Player , 2 , 0 , 5795 , 50 , -2930 , 0 )	--�ɶ���ǥX�ƥ�
	else
		sleep(20)
		ScriptMessage( Player , -1 , 2 , String[1] , "0xff6fb7ff" )
		AddBuff( Player , TimeBuff , 0 , -1 )
		------------��H-------��@�ɱM�νs��------�}�l--�{�b--����-----���ϼ@��-----------�ɶ������@��
		ClockOpen( Player , EM_ClockCheckValue_33 , 900 , 900 , 0 , "Lua_Clockending" , "Lua_Clockending" )
		sleep(8990)--���W�ɶ��G15����, 15*60=900, 900-1=899=8990�@��
		ScriptMessage( Player , -1 , 2 , String[3] , "0xff6fb7ff" )
		sleep(20)
		ChangeZone( Player , 2 , 0 , 5795 , 50 , -2930 , 0 )	--�ɶ���ǥX�ƥ�
	end
end]]--