----------------------------------------------------��x����/gm�R�����O
function Lua_jiyi_0222test(item)
	local Player = OwnerID()
	if CountBodyItem ( Player , item ) > 0 then
		DelBodyItem( Player , item , 1 ) --�N���a���W��item���~�R��
	else
		ScriptMessage( Player , Player , 1 , "Without this item" , 0 )
	end
end
----------------------------------------------------�H�U���ʴ���
function Lua_jiyi_0305test()
	local Player = OwnerID() 
	PlayMotion( Player , 115 )
	Sleep(10)
	PlayMotion( Player , 110 )
 end

function Lua_jiyi_0308test01(Time,NowTime,type)		--�ɶ��˼ưO�ƾ�
	local Player = OwnerID() 
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )
	local Obj
	local Count = SetSearchAllPlayer(RoomID)
	if Count ~= 0 then
		for i = 1 , Count , 1 do
			local ID = GetSearchResult()
			Obj = Role:New( ID )
			if Obj:IsPlayer() == true then
				StartClientCountDown ( ID, Time, NowTime, 0, 0, type, "[SC_1V1PVP_COUNTDOWN]" )	--���aClient��ܭ˼�5��
				sleep(15)
			end
		end	
	end
end

function Lua_jiyi_0308test02()
	local Player = OwnerID()
	CallPlot( Player , "Lua_jiyi_0308test01" , 5 , 5 , 0 )
end
------------------------------------------------------------------
function jiyi_test0415(num)
	local Player = OwnerID()
	local CreateID = 121109 
	local CreateCount = { 16 , 20 , 1 }
	local Distance = { 80 , 150 , 0 }

	Lua_jiyi_Round_0415( Player , CreateID , CreateCount[num] , Distance[num] , 0 )
	-- �ѦҪ���B�إߪ���ID�B�إߪ��󪺼ƶq�B�ꪺ�b�|�B�إߪ���O�_����
end

function Lua_jiyi_Round_0415( ObjID , CreateID , CreateCount , Distance , Delay )
-- �ѦҪ���B�إߪ���ID�B�إߪ��󪺼ƶq�B�ꪺ�b�|�B�إߪ���O�_����
	local RoomID = ReadRoleValue( ObjID , EM_RoleValue_RoomID )
	local BaseX = ReadRoleValue( ObjID , EM_RoleValue_X )
	local BaseY = ReadRoleValue( ObjID , EM_RoleValue_Y )
	local BaseZ = ReadRoleValue( ObjID , EM_RoleValue_Z )
	local BaseDir = ReadRoleValue( ObjID , EM_RoleValue_Dir )
	local CreateWall
	local CreateID = CreateID -- ��
	local Polygon = CreateCount -- �X�䫬
	local dis = Distance -- �Z����ߪ��Z��
	local Count = 1

	for i = 1 , Polygon , 1 do
		CreateWall = CreateObj( CreateID , BaseX-dis*math.cos(math.pi*2*(i/Polygon)) , BaseY , BaseZ+dis*math.sin(math.pi*2*(i/Polygon)) , BaseDir , 1 )
		SetModeEx( CreateWall , EM_SetModeType_Strikback , true )--����
		SetModeEx( CreateWall , EM_SetModeType_SearchenemyIgnore , false )--�Q�j�M
		SetModeEx( CreateWall , EM_SetModeType_Obstruct , false )--����
		SetModeEx( CreateWall , EM_SetModeType_Mark , true )--�аO
		SetModeEx( CreateWall , EM_SetModeType_Move , true )--����
		SetModeEx( CreateWall , EM_SetModeType_Searchenemy , true )--����
		SetModeEx( CreateWall , EM_SetModeType_HideName , true )--�W��
		SetModeEx( CreateWall , EM_SetModeType_ShowRoleHead , true )--�Y����
		SetModeEx( CreateWall , EM_SetModeType_Fight , true )--�i�������
		SetModeEx( CreateWall , EM_SetModeType_Drag , false )--���O
		SetModeEx( CreateWall , EM_SetModeType_Show , true )--���
		AdjustFaceDir( CreateWall , ObjID , 0 ) 	-- ���إߪ��󭱦V�ѦҪ���
		AddToPartition( CreateWall , RoomID )
		if Delay ~= 0 or Delay ~= nil then
			Sleep(Delay)
		end
	end
end
-------------------------------------------------------------------------------------�����`+BUFF���ի��O
function Lua_jiyi_Z26_test0510(num)
	local Player = OwnerID()
	local buff = 623964
	local NPC = SearchRangeNPC( Player , 400 )
	local box = 103890
	for i = 0 , table.getn(NPC) do
		if ReadRoleValue( NPC[i] , EM_RoleValue_OrgID ) == box then
			AddBuff( NPC[i] , buff , num-1 , -1 )
		end
	end
end
function Lua_jiyi_game_test0510(num)
	local Player = OwnerID()
	local buff = 507824
	local NPC = SearchRangeNPC( Player , 400 )
	local box = 103890
	for i = 0 , table.getn(NPC) do
		if ReadRoleValue( NPC[i] , EM_RoleValue_OrgID ) == box then
			AddBuff( NPC[i] , buff , num-1 , -1 )
		end
	end
end

-------------------------------------------------------------------------------------------Z27�G�m��
function Lua_jiyi_Z27_NPC_Follow()
--		<<�y�� Matrix ��ƥN���m���ܷN��>>
-- [1]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
-- [2]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
-- [3]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
--               		                :
-- [Count]	[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
	local dis = 6
	local count = 2 --�}�C���j�p�A��J3 �|�O 3*3 ���}�C�F���L�]����ƥ������_�ơA�ҥH��J 4 �|�O 5*4 ���}�C�C
	local checktime = 10 --�P�_���ɶ����Z�A�ƭȷU�C�A�P�_���W�v�U���A�U�۵M�A���Ӫ��귽�]�U�h
	local ReviveTime = 600000  --��}�C����������������ɡA�i��}�C���m���ʧ@�A�p�G�� -1 �A�N�|���� OwnerID() �]�w�����ͮɶ����m
	local circle = 0  --�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��

--�إ߳o�Ӱ}�C
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 

--�إߤ@�� table�A�b�Q���ͪ��󪺦�m�� LuaFunc_CreateNPCByMatrix(ObjID,Matrix,A,B ) ���ͪ���C �䤤�|�ӼƭȨ̧ǥN�� 1.�n�ͦ�������ID 2.�@����Ǫ��}�C 3.�C��m 4.���m
	local ObjMatrix ={}
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(107917,Matrix,2,-1 )
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(107918,Matrix,1,-1 )
--���� PID �H�� MONEY �N�@���@�}�l�x�s��ƩҥΡA�p�G�n�ܧ󤺳����ȡA�Цܤ� sleep( checktime )

--�Ѱj��禡Ū�J��ơA�ӱ���Ҧ��}�C�������󲾰�
	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	--���Ӽƭȶ��Ǭ� 1.�إߪ�����ҦbTABLE 2.�إߪ��}�C 3.���Z 4.�}�C���j�p 5.�P�_���ɶ� 6.�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��
	--PS.�p�G�]�w���� NPC ���W���� SCRIPT�A�h�g������ 0 �� �ANPC ���ͫ�N���|�۰ʱ� SCRIPT

--�N�ѦҪ���]�w�^��Ӫ��X���I
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
--�n�D���s�����l�@��
	BeginPlot( OwnerID() , "Lua_jiyi_Z27_Follow_Reset" , 0 )
end

function Lua_jiyi_Z27_Follow_Reset()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_jiyi_Z27_NPC_Follow" , 0 )
end
-------------------------------------����s������
function Lua_jiyi_0729test()
	local Player = OwnerID()
	local Box = SearchRangeNPC( Player , 100 )
	local OrgID = 119403
	local Bushy = DW_CreateObjEX("obj", 120222 , Player ) ----�ͦ����äH��
		
	for i = 0 , table.getn( Box ) do
		if ReadRoleValue( Box[i] , EM_RoleValue_OrgID ) == OrgID then
			AttachObj( Box[i] , Player , 0 , "p_right_hand" , "p_right_weapon" ) 
			
		else
			Say( Player , "no box" )
		end
	end	
end
------------------------------------------�R������@��
function Lua_jiyi_Cancelobj(Item)	
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Count = SetSearchAllNPC( RoomID )
	local Obj
	local NPC = { Item }
	if Count ~= 0 then
		for i = 1 , Count , 1 do
			local ID = GetSearchResult()
			Obj = Role:New( ID )
			if Obj:IsNPC() == true then
				local Name = ReadRoleValue( ID , EM_RoleValue_OrgID )--�T�{�Ҧ�NPC���s��
				for j = 1 , table.getn( NPC ) , 1 do
					if Name == NPC[j] then  --�Y���}�C������
						DelObj( ID )
					end
				end
			end
		end
	end
end
---------------------------------------------------------------------Z30
function Lua_Z30_422656_test1119()	--���ȵ�����t�@��
	local Player = TargetID()
 	local NPC_Will = OwnerID()
	local PID = ReadRoleValue( NPC_Will , EM_RoleValue_PID )	--�����t�}�l=0�}�l��t�A=1��t��

	Setflag( Player , 548818 , 1 )
	if PID == 1 then
		ScriptMessage( Player , Player , 1 , "[SC_Z30_Q426862_01]" , 0 )	--��t�i�椤�K
	elseif PID == 0 then
		Callplot( NPC_Will , "Lua_jiyi_1030test" , NPC_Will )
		WriteRoleValue( NPC_Will , EM_RoleValue_PID , 1 )
	end
end

function Lua_jiyi_1030test(NPC_Will)	-- ���ͩ����Ԥh
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID) --�T�{���A�������y
	local Obj = Role:new( OwnerID() )
	local BaseX = Obj :X()
	local BaseY = Obj :Y()
	local BaseZ = Obj :Z()
	local BaseDir = Obj :Dir()
	local MonsterGroup = {}
	local MonsterID = 121774	--�����Ԥh
	local X = { 5 }	-- �X�䫬
	local dis = { 70 }	-- �Z����ߪ��Z��
	local Count = 1

	for i = 1 , table.getn(X) do
		for j = 1 , X[i] , 1 do
			MonsterGroup[Count] = CreateObj( MonsterID , BaseX-dis[i]*math.cos(math.pi*2*(j/X[i])) , BaseY , BaseZ+dis[i]*math.sin(math.pi*2*(j/X[i])) , BaseDir , 1 )
			WriteRoleValue( MonsterGroup[Count] , EM_RoleValue_PID , Count )
			Count = Count + 1
		end
	end
	for i = 1 , table.getn(MonsterGroup) do
		SetModeEx( MonsterGroup[i] , EM_SetModeType_Strikback , false )--����
		SetModeEx( MonsterGroup[i] , EM_SetModeType_SearchenemyIgnore , false )--�Q�j�M
		SetModeEx( MonsterGroup[i] , EM_SetModeType_Obstruct , false )--����
		SetModeEx( MonsterGroup[i] , EM_SetModeType_Mark , true )--�аO
		SetModeEx( MonsterGroup[i] , EM_SetModeType_Move , true )--����
		SetModeEx( MonsterGroup[i], EM_SetModeType_Gravity, true )--���O
		SetModeEx( MonsterGroup[i] , EM_SetModeType_Searchenemy , false )--����
		SetModeEx( MonsterGroup[i] , EM_SetModeType_HideName , true )--�W��
		SetModeEx( MonsterGroup[i] , EM_SetModeType_ShowRoleHead , true )--�Y����
		SetModeEx( MonsterGroup[i] , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( MonsterGroup[i] , EM_SetModeType_Drag , false )--���O
		SetModeEx( MonsterGroup[i] , EM_SetModeType_Show , true )--���
		AdjustFaceDir( MonsterGroup[i] , OwnerID() , 0 ) 
		AddToPartition( MonsterGroup[i] , RoomID )
		MoveToFlagEnabled( MonsterGroup[i] , false )-- �������޼@��
 --		local Reg1 = ReadRoleValue( MonsterGroup[i] , EM_RoleValue_Register1 )
--		WriteRoleValue( MonsterGroup[i] , EM_RoleValue_Register1 , NPC_Will )	--�N�º��O�J�����Ԥh��Reg1
	--	say( MonsterGroup[i] , "i remember Will="..Reg1 )	
		Beginplot( MonsterGroup[i] , "LuaWS_COMBAT_1H" , 0 )	--�ƾ԰ʧ@
		Callplot(MonsterGroup[i] , "Lua_jiyi_1030test2" , OwnerID() )
	end
end

function Lua_jiyi_1030test2(player)	-- �����Ԥh�e�i
	local Warrior = OwnerID()	
	Lua_MoveLine( Warrior , 30 )	--�ѦҪ���A�V�e���ʨ�Dis�Z������m(Dis��t�Ƭ��V�Ჾ��)
end
-----------------------------Z30 426869 �Z�Ʃԥ۹�------------------------------
function Lua_jiyi_Z30_123370_speak()
	local player = OwnerID()
	local PaPa = TargetID()
	local star = ReadRoleValue( PaPa , EM_RoleValue_Register1 )	--�����O�_�i�H�i�次�ʪ�REG�� 0��ܥi�H 1��ܪ��a�D�Ԥ� 
	LoadQuestOption( player )	
	if CheckAcceptQuest( player , 426869 ) == true and CheckFlag( player , 548817 ) == false then
		if Countbodyitem( player ,  241086 ) > 0 then
			if star == 1 then	--REG1��==1��ܦ����a���b�D�Ԥ�
				SetSpeakDetail( player , "Please wait" ) --���@��
			else
				SetSpeakDetail( player , "[SC_Z28Q426633_01]" )	--(�y�z�����˥[���G�P����A���W���´���)		
				AddSpeakOption( player , player ,"game start","Lua_jiyi_Z30_123370_speak2" , 0 )
			end
		else
			SetSpeakDetail( player , "[SC_Z28Q426633_03]" )	--(�����˥[�n�_�a�ݵۧA...)
		end			
	else
		LoadQuestOption( player )
	end	
end		

function Lua_jiyi_Z30_123370_speak2() --�X�D��
	local player = OwnerID() --���a
	local turkey = TargetID() --�b�k
	local star = ReadRoleValue( turkey , EM_RoleValue_Register1 )	--�����O�_�i�H�i�次�ʪ�REG�� 0��ܥi�H 1��ܪ��a�D�Ԥ� 
	local Reg9 = ReadRoleValue( turkey , EM_RoleValue_Register9 )	--��NPC�O���a
	WriteRoleValue( turkey , EM_RoleValue_Register1 , 1 )	--�����O�_�i�H�i�次�ʪ�REG�� 0��ܥi�H 1��ܪ��a�D�Ԥ�
	WriteRoleValue( turkey , EM_RoleValue_Register9 , player )	--��NPC�O���a
	DW_CancelMount( 68, player ) --�i�J�C�����i�M��
	CloseSpeak( player )
	BeginPlot( turkey , "Lua_Z30_test1114" , 0 ) --�����ˬd�����ɶ��B�Z���B���u�B���Ϯ����B����y
end
		
function Lua_Z30_test1114() --���b�k���氻�����a�P�b�k�������Z���çP�_�O�_�N�b�k��PID�ȼg�^0
	local turkey = OwnerID() --�b�k
	local Reg9 = ReadRoleValue( turkey , EM_RoleValue_Register9 ) --�O�b�b�k���W�����a 
	local star = ReadRoleValue( turkey , EM_RoleValue_Register1 )	--�����O�_�i�H�i�次�ʪ�REG�� 0��ܥi�H 1��ܪ��a�D�Ԥ� 
	local reward = 548817 --�������ȺX��
	local Dis
	local Time = 0
	local shinyball = { [1]=123366 ,
			 [2]=123367 ,
			 [3]=123368 ,
			 [4]=123369  } --�D�إ��y
	while true do	
		Dis = GetDistance( turkey , Reg9 ) --�ˬd�b�k�M���a�������Z��
		if CheckID( Reg9 ) == false then--�p�G���a���u�A���X�j��
			break
		end
		if Dis >= 100 and Dis < 150 then --�p�G�Z���ӻ��A���Xĵ�i�T��
			ScriptMessage( turkey , Reg9 , 2 , "[SC_2012THANKS_NPC_121493_SYSTEM_02]" , C_SYSTEM )--ĵ�i�T�� �G�Z���L��	
		elseif Dis >= 150 then
			ScriptMessage( turkey , Reg9 , 2 , "[SC_2012THANKS_NPC_121493_SYSTEM_03] " , C_SYSTEM )--ĵ�i�T�� �G�Z���ӻ��F		
			break
		end
	   	Time = Time + 1
		if Time == 30 then
	   		ScriptMessage( turkey , Reg9 , 2 , "[SC_2012THANKS_NPC_121493_SYSTEM_05]" , C_SYSTEM )--�ɶ�����X�j��	
			break
		elseif Time == 5 or Time == 10 or Time == 15 or Time == 20 or Time == 25 then
			local NewX , NewY , NewZ , NewDir = DW_Location( turkey )
			local RandNum= DW_Rand( table.getn ( shinyball ) )
			NpcOnBox = CreateObj( shinyball[RandNum] , NewX , NewY + 10 , NewZ , dir , 1 )
			SetModeEx( NpcOnBox , EM_SetModeType_Gravity , false )--�������O
			addToPartition( NpcOnBox , 0 )
			Beginplot( NpcOnBox , "Lua_Z30_BallDisappear" , 0 )
		end						
		if CheckFlag( Reg9 , reward ) == true then --�p�G���a���W���������ȺX�СA���X�j��
			break
		end
		Sleep( 10 )
	end
	WriteRoleValue( turkey , EM_RoleValue_Register1 , 0 )	--���X�j��N��REG�ȼg��0
	say( turkey , "game over" )
end

function Lua_Z30_BallDisappear()	--���y�����󲣥ͼ@��
	Sleep(50)
	DelObj(  OwnerID() )
end

function Lua_Z30_BallAppear()
	SetPlot( OwnerID() ,"range","Lua_Z30_BallAppear2", 30 ) 
end

function Lua_Z30_BallAppear2()	--�Ŧ�
	local Player = OwnerID()
	local Shinyball = TargetID()
	if CheckAcceptQuest( Player , 426869 ) == true and Checkflag( Player , 548817 ) == false then
		SetPlot( Shinyball , "range" , "" , 30 )
		Addbuff( Player , 506229 , 0 , 10 )
	end
end
