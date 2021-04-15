function LuaQ_Z22_bird()
	local bird = OwnerID()
	if CheckBuff(bird,621240)==false then
		Sleep(100)
		AddBuff(bird,621240,0,-1)
	end
	ic_MOB_BUFF_22()
end

function Luas_z22_paniro_npc()
	local OID = OwnerID()
	local OGUID = ReadRoleValue(OID,EM_RoleValue_OrgID)
	while true do
		ScriptMessage(OID,2,0,OGUID, 0 );
		Sleep(80)
	end
end

Function LuaP_dr_Z22_NPC() 
	local OID = OwnerID()
	local Z = 0
	while true do
		Sleep(55)
		if Z == 0 then
			PlayMotion( OID, ruFUSION_ACTORSTATE_EMOTE_ROFL)
			NPCSAY(OID,"[SC_119943_1]")
			Z = Z+1
		elseif Z == 1 then 
			PlayMotion( OID, ruFUSION_ACTORSTATE_EMOTE_ROFL)
			NPCSAY(OID,"[SC_119943_2]")
			Z = Z+1
		elseif Z == 2 then 
			PlayMotion( OID, ruFUSION_ACTORSTATE_EMOTE_ROFL)
			NPCSAY(OID,"[SC_119943_3]")
			Z = 0
		end
	end

end

function LuaM_Z22DRmilitary_matrix()			--�h�L

--		<<�y�� Matrix ��ƥN���m���ܷN��>>
-- [1]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
-- [2]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
-- [3]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
--               		                :
-- [Count]	[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
	local dis = 15
	local count = 3 --�}�C���j�p�A��J3 �|�O 3*3 ���}�C�F���L�]����ƥ������_�ơA�ҥH��J 4 �|�O 5*4 ���}�C�C
	local checktime = 10 --�P�_���ɶ����Z�A�ƭȷU�C�A�P�_���W�v�U���A�U�۵M�A���Ӫ��귽�]�U�h
	local ReviveTime = 600000  --��}�C����������������ɡA�i��}�C���m���ʧ@�A�p�G�� -1 �A�N�|���� OwnerID() �]�w�����ͮɶ����m
	local circle = 6000  --�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��

--�إ߳o�Ӱ}�C
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 

--�إߤ@�� table�A�b�Q���ͪ��󪺦�m�� LuaFunc_CreateNPCByMatrix(ObjID,Matrix,A,B ) ���ͪ���C �䤤�|�ӼƭȨ̧ǥN�� 1.�n�ͦ�������ID 2.�@����Ǫ��}�C 3.�C��m 4.���m
	local ObjMatrix ={}
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(106366,Matrix,2, 0 )
	Lua_SetRrSoldierMode(ObjMatrix[1])
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(106366,Matrix,2, -1 )
	Lua_SetRrSoldierMode(ObjMatrix[2])
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(106366,Matrix,1, 0 )
	Lua_SetRrSoldierMode(ObjMatrix[3])
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(106366,Matrix,1, -1 )
	Lua_SetRrSoldierMode(ObjMatrix[4])
--���� PID �H�� MONEY �N�@���@�}�l�x�s��ƩҥΡA�p�G�n�ܧ󤺳����ȡA�Цܤ� sleep( checktime )

--�Ѱj��禡Ū�J��ơA�ӱ���Ҧ��}�C�������󲾰�
	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	--���Ӽƭȶ��Ǭ� 1.�إߪ�����ҦbTABLE 2.�إߪ��}�C 3.���Z 4.�}�C���j�p 5.�P�_���ɶ� 6.�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��
	--PS.�p�G�]�w���� NPC ���W���� SCRIPT�A�h�g������ 0 �� �ANPC ���ͫ�N���|�۰ʱ� SCRIPT

--�N�ѦҪ���]�w�^��Ӫ��X���I
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
--�n�D���s�����l�@��
	BeginPlot( OwnerID() , "LuaM_Z22DRmilitary_matrix" , 0 )
end

function LuaM_Z22DRmilitary_matrix_Reset()
	sleep( 10 )
	BeginPlot( OwnerID() , "LuaM_Z22DRmilitary_matrix" , 0 )
end

function Lua_SetRrSoldierMode(obj)
	SetModeEx( obj   , EM_SetModeType_Fight , true )--�i�������
	SetModeEx( obj   , EM_SetModeType_Strikback, true )--����
	SetModeEx( obj   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( obj   , EM_SetModeType_Obstruct, false )--����
	SetModeEx( obj   , EM_SetModeType_Mark, false )--�аO
	SetModeEx( obj   , EM_SetModeType_Move, true )--����
	SetModeEx( obj  , EM_SetModeType_Searchenemy, true )--����
	SetModeEx( obj   , EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( obj   , EM_SetModeType_HideName, true )--�W��
end

function LuaS_424981_Change()
	local player = OwnerID()
	local Npc = TargetID()
	LoadQuestOption(player)
	if CheckCompleteQuest(player,424981)==true then
		AddSpeakOption(player,Npc,"[SC_424981_CHANGE][$SETVAR1=".."[".."240941".."]".."][$SETVAR2=".."[".."206874".."]".."]","LuaS_424981_ChangeItem(1)",0)	--+HP
		AddSpeakOption(player,Npc,"[SC_424981_CHANGE][$SETVAR1=".."[".."240942".."]".."][$SETVAR2=".."[".."206877".."]".."]","LuaS_424981_ChangeItem(2)",0)	--+HP
		AddSpeakOption(player,Npc,"[SC_424981_CHANGE][$SETVAR1=".."[".."240943".."]".."][$SETVAR2=".."[".."206890".."]".."]","LuaS_424981_ChangeItem(3)",0)	--+HP
	end
end

function LuaS_424981_ChangeItem(Num)
	local player = OwnerID()
	if Num == 1 and CountBodyItem(player,240941)>=1 then
		GiveBodyItem(player,206874,1)
		DelBodyItem(player,240941,1)
	elseif Num == 2 and CountBodyItem(player,240942)>=1 then
		GiveBodyItem(player,206877,1)
		DelBodyItem(player,240942,1)
	elseif Num == 3 and CountBodyItem(player,240943)>=1 then
		GiveBodyItem(player,206890,1)
		DelBodyItem(player,240943,1)
	else 
		ScriptMessage( player, player, 0,"[K_08MID_DIALOG7]", 0 )
	end
	CloseSpeak(player)
end