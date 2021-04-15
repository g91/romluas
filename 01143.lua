--------------------------------------------------------------------�é]�}������
function Lua_EverNight_matrix()	

--		<<�y�� Matrix ��ƥN���m���ܷN��>>
-- [1]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
-- [2]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
-- [3]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
--               		                :
-- [Count]	[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
	local Obj = Role:new( OwnerID() )
	local ZoneID = Obj:ZoneID() -1000*math.floor(Obj:ZoneID() / 1000 )
	local count = 3 --�}�C���j�p�A��J3 �|�O 3*3 ���}�C�F���L�]����ƥ������_�ơA�ҥH��J 4 �|�O 5*4 ���}�C�C
	local checktime = 8 --�P�_���ɶ����Z�A�ƭȷU�C�A�P�_���W�v�U���A�U�۵M�A���Ӫ��귽�]�U�h
	local ReviveTime = 900 --��}�C����������������ɡA�i��}�C���m���ʧ@�A�p�G�� -1 �A�N�|���� OwnerID() �]�w�����ͮɶ����m
	local circle = 0 --�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��
	local dis = 8	--���Z

--�إ߳o�Ӱ}�C
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 

--�إߤ@�� table�A�b�Q���ͪ��󪺦�m�� LuaFunc_CreateNPCByMatrix(ObjID,Matrix,A,B ) ���ͪ���C �䤤�|�ӼƭȨ̧ǥN�� 1.�n�ͦ�������ID 2.�@����Ǫ��}�C 3.�C��m 4.���m
	local ObjMatrix ={}
	if ZoneID == 1 then
		ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(101478,Matrix,1, 0 )
	elseif ZoneID == 2 then
		ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(101478,Matrix,1, 0 )
		ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(101479,Matrix,2, 1 )
		ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(101479,Matrix,2, -1)
	elseif ZoneID == 4 then
		ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(101480,Matrix,1, 0 )
		ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(101481,Matrix,2, 1 )
		ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(101481,Matrix,2, -1)
		ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(101481,Matrix,2,0 )
	elseif ZoneID == 5 then
		ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(101480,Matrix,2, 0 )
		ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(101481,Matrix,1, 1 )
		ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(101481,Matrix,1, -1)
		ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(101481,Matrix,2, 1 )
		ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(101481,Matrix,2, -1 )
	end

--���� PID �H�� MONEY �N�@���@�}�l�x�s��ƩҥΡA�p�G�n�ܧ󤺳����ȡA�Цܤ� sleep( checktime )
--�Ѱj��禡Ū�J��ơA�ӱ���Ҧ��}�C�������󲾰�
	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	--���Ӽƭȶ��Ǭ� 1.�إߪ�����ҦbTABLE 2.�إߪ��}�C 3.���Z 4.�}�C���j�p 5.�P�_���ɶ� 6.�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��
	--PS.�p�G�]�w���� NPC ���W���� SCRIPT�A�h�g������ 0 �� �ANPC ���ͫ�N���|�۰ʱ� SCRIPT

--�N�ѦҪ���]�w�^��Ӫ��X���I
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
--�n�D���s�����l�@��
	BeginPlot( OwnerID() , "Lua_EverNight_matrix_Reset" , 0 )
end

function Lua_EverNight_matrix_Reset()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_EverNight_matrix" , 0 )
end


---------�}�Ҩ����_��
function Lua_EverNightKey()
	if EverNightKey == 0 then
		local FollowMonster = 101471
		local Count = SetSearchAllNPC(0)
		local NPC = {}
		local HowMany = 0
		for i = 1 , Count do
			NPC[i] = GetSearchResult()
		end
		for i = 1, Count do
			if ReadRoleValue(NPC[i] ,EM_RoleValue_OrgID) == FollowMonster then
				BeginPlot( NPC[i], "Lua_EverNight_matrix" , 5 )
			end
		end
	ClientSkyType( EM_ClientSkyProcType_Night ) --���ܹC���ɶ��� �]��
	EverNightKey = 1
	else
	Say(OwnerID(),"Patrol already ON")
	end
end

function Lua_EverNightKeyOneSetp()
	if EverNightKeyOneStep == 0 then
		local Obj = Role:new( OwnerID() )
		local ZoneID = Obj:ZoneID() -1000*math.floor(Obj:ZoneID() / 1000 )
		if ZoneID == 2 then
			local Monster = CreateObj ( 101417, -435 , 35 , 7788 ,20 , 1)      --�S��   �Ӯy��         
			local Ball = CreateObj ( 112060, -435 , 70 , 7788 ,20 , 1)      --�S��   �Ӯy��         
			SetModeEx( Monster , EM_SetModeType_Fight , false )--�i�������
			SetModeEx( Monster , EM_SetModeType_Strikback, false )--����
			SetModeEx( Monster , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
			SetModeEx( Monster , EM_SetModeType_Obstruct, true )--����
			SetModeEx( Monster   , EM_SetModeType_Mark, false )--�аO
			SetModeEx( Monster , EM_SetModeType_Move, false )--����
			SetModeEx( Monster , EM_SetModeType_Searchenemy, false )--����
			SetModeEx( Monster , EM_SetModeType_ShowRoleHead, false )--�Y����
			SetModeEx( Monster , EM_SetModeType_Gravity, false )--���O
			SetModeEx( Ball    , EM_SetModeType_Fight , false )--�i�������
			SetModeEx( Ball    , EM_SetModeType_Strikback, false )--����
			SetModeEx( Ball    , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
			SetModeEx( Ball    , EM_SetModeType_Obstruct, false )--����
			SetModeEx( Ball    , EM_SetModeType_Gravity, false )--���O
			SetModeEx( Ball    , EM_SetModeType_Move, false )--����
			SetModeEx( Ball    , EM_SetModeType_Searchenemy, false )--����
			SetModeEx( Ball , EM_SetModeType_ShowRoleHead, false )--�Y����
			SetPlot( Ball,"touch","Lua_EverNightKeyOneSetpClear", 50 )
			WriteRoleValue( Ball , EM_RoleValue_PID , Monster )   
			AddToPartition( Monster , 0)
			AddToPartition( Ball , 0)
			ClientSkyType( EM_ClientSkyProcType_Night ) --���ܹC���ɶ��� �]��
			EverNightKeyOneStep = 1
		else
			ScriptMessage( OwnerID() , -1 , 1 , "|cffff00ff" .."You are Not in Zone 2 !".. "|r" , 0 ) 
		end
	else
		Say(OwnerID(),"OneStep already ON")
	end
end

function Lua_EverNightKeyOneSetpClear()
	local KEY =  CountBodyItem( OwnerID() , 203582 )  --�S��@��Ĳ�o�_��
	local KeyMan = ReadRoleValue( TargetID() , EM_RoleValue_PID  )  
	if KEY >= 1 then
		if CheckID(KeyMan) == true then
			DelObj(KeyMan)
		end
		if CheckID(TargetID()) == true then
			DelObj(TargetID())
		end
		EverNightKeyOneStep = 0
	end
end
function Lua_ClientSkyType()
	Beginplot( OwnerID() ,"Lua_ClientSkyTypeChange", 0 )
end

function Lua_ClientSkyTypeChange()
	local PlayerID = OwnerID()
	local RoomID = ReadRoleValue( PlayerID ,EM_RoleValue_RoomID) 
	local CheckTime = 1
	local RunTime = 1
	local DialogStatus = 0
	local TransferSelect = {}
	TransferSelect[0] = { "Normal" }
	TransferSelect[1] = { "Day" }
	TransferSelect[2] = { "NightFall" }
	TransferSelect[3] = { "Night" }
	TransferSelect[4] = { "Dawn" }
	TransferSelect[5] = { "[SO_EXIT]" }				-- ���}���

	DialogCreate( OwnerID() , EM_LuaDialogType_Select , "What Weaver Do You Want ?" )
	for i = 0, table.getn( TransferSelect ) do
		DialogSelectStr( OwnerID() , TransferSelect[i][1] )
	end
	if( DialogSendOpen( OwnerID() ) == false ) then 
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 )	--��ưe�X�����D
		return 0
	end
	while true do
		Sleep( 5 )
		RunTime = RunTime + 1
		if RunTime  > 600 then -- ���L�a�j��A600 = �@����

			DebugMsg( 0, RoomID ,"Exit the MENU because IDLE a long Time !!")
			DialogClose( PlayerID )
			break
		end

		DialogStatus = DialogGetResult( PlayerID )
		--Say( PlayerID , DialogStatus )

		if DialogStatus == -2 then
			-- DO nothing
		elseif DialogStatus == 5 or DialogStatus == -1 then
			DialogClose( PlayerID )
			break
		elseif DialogStatus == 0 then
			ClientSkyType( EM_ClientSkyProcType_Normal ) --���ܹC���ɶ��� �@��
			DialogClose( PlayerID )
			break
		elseif DialogStatus == 1 then
			ClientSkyType( EM_ClientSkyProcType_Day ) --���ܹC���ɶ��� �դ�
			DialogClose( PlayerID )
			break
		elseif DialogStatus == 2 then
			ClientSkyType( EM_ClientSkyProcType_NightFall ) --���ܹC���ɶ��� ����
			DialogClose( PlayerID )
			break
		elseif DialogStatus == 3 then
			ClientSkyType( EM_ClientSkyProcType_Night ) --���ܹC���ɶ��� �]��
			DialogClose( PlayerID )
			break
		elseif DialogStatus == 4 then
			ClientSkyType( EM_ClientSkyProcType_Dawn ) --���ܹC���ɶ��� ����
			DialogClose( PlayerID )
			break
		end
	end

end