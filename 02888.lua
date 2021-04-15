--z26�G�m=======================================
--=======================================
--�ʵ�����--
function Lua_PG_Ant_Keep_Sight()
--		<<�y�� Matrix ��ƥN���m���ܷN��>>
-- [1]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
-- [2]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
-- [3]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
--               		                :
-- [Count]	[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
	local dis = 30
	local count = 3 --�}�C���j�p�A��J3 �|�O 3*3 ���}�C�F���L�]����ƥ������_�ơA�ҥH��J 4 �|�O 5*4 ���}�C�C
	local checktime = 10 --�P�_���ɶ����Z�A�ƭȷU�C�A�P�_���W�v�U���A�U�۵M�A���Ӫ��귽�]�U�h
	local ReviveTime = 100  --��}�C����������������ɡA�i��}�C���m���ʧ@�A�p�G�� -1 �A�N�|���� OwnerID() �]�w�����ͮɶ����m
	local circle = 6000  --�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��

--�إ߳o�Ӱ}�C
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 

--�إߤ@�� table�A�b�Q���ͪ��󪺦�m�� LuaFunc_CreateNPCByMatrix(ObjID,Matrix,A,B ) ���ͪ���C �䤤�|�ӼƭȨ̧ǥN�� 1.�n�ͦ�������ID 2.�@����Ǫ��}�C 3.�C��m 4.���m
	local ObjMatrix ={}
	local MonPID = ReadRoleValue(OwnerID(), EM_RoleValue_PID)
	if MonPID ==0		then
		ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(107721,Matrix,2,0 )
		ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(107724,Matrix,3,1 )
	elseif MonPID ==1	then
		ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(107726,Matrix,2,0 )
		ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(107724,Matrix,3,1 )
	elseif MonPID ==2	then
		ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(107730,Matrix,2,0 )
		ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(107729,Matrix,3,1 )
		ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(107729,Matrix,3,-1 )
	end


--�Ѱj��禡Ū�J��ơA�ӱ���Ҧ��}�C�������󲾰�
	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle ) 

--�N�ѦҪ���]�w�^��Ӫ��X���I
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
--�n�D���s�����l�@��
	BeginPlot( OwnerID() , "Lua_PG_Ant_Keep_Sight_02" , 0 );
end

function Lua_PG_Ant_Keep_Sight_02()
	BeginPlot( OwnerID() , "Lua_PG_Ant_Keep_Sight" , 2 );
end


--=======================================
--�ػA��--
function Lua_PG_Z26NPC_01()
	local Player = OwnerID()
	LuaP_117278_01()	
	NPCSAY(Player,"[SC_Z26_NPC_01]")
	Sleep(30)
end

--=======================================
--���Z�˧���--
function Lua_PG_ATTACK_UNARMED()
	local Player = OwnerID()
	PlayMotion(Player,ruFUSION_ACTORSTATE_ATTACK_UNARMED)
	Sleep(30)
end

--=======================================
--��a�̪��a�ܮ�����--
function Lua_PG_Z26_Gossip()
	SetPlot( OwnerID(),"range","Lua_PG_Z26_Gossip_01",40 )	
end

function Lua_PG_Z26_Gossip_01()
	Tell(OwnerID() ,TargetID() ,"[SC_Z26_GOSSIP_01]")
	Sleep(10)
	Tell(OwnerID() ,TargetID() ,"[SC_Z26_GOSSIP_02]")
end

function Lua_PG_Z26_Gossip_03()
	SetPlot( OwnerID(),"range","Lua_PG_Z26_Gossip_04",40 )
end

function Lua_PG_Z26_Gossip_04()
	Tell(OwnerID() ,TargetID() ,"[SC_Z26_GOSSIP_03]")
	Sleep(10)
	Tell(OwnerID() ,TargetID() ,"[SC_Z26_GOSSIP_04]")
end


--=======================================
--���H���U--
function Lua_PG_Bear_Sit()
	SetDefIdleMotion(OwnerID(),ruFUSION_MIME_KNOCKDOWN_END)
end

--=======================================
--�q§�D��--
Function Z26_PG_Keirei_00()
	local NPC=OwnerID()
	WriteRoleValue( NPC, EM_RoleValue_Register1, 0 )
	SetPlot( NPC, "range", "Z26_PG_Keirei_01", 50 )
End
Function Z26_PG_Keirei_01()
	local PID=OwnerID()
	local NPC=TargetID()
	local Num=DW_Rand(2)
	if ReadRoleValue( NPC, EM_RoleValue_Register1 )==0 and Num==1 then
		CallPlot( NPC, "Z26_PG_Keirei_02", NPC, PID )
	else 	return
	end
End
Function Z26_PG_Keirei_02( NPC, PID )
	WriteRoleValue( NPC, EM_RoleValue_Register1, 1 )
	local OBJ=SearchRangeNPC( NPC, 50 )
	for i=0, table.getn( OBJ ), 1 do
		if ReadRoleValue( OBJ[i], EM_RoleValue_OrgID )==122418 and
		ReadRoleValue( OBJ[i], EM_RoleValue_Register1 )==0 then
			CallPlot( OBJ[i], "Z26_PG_Keirei_03", NPC, PID, OBJ[i] )
		end
	end
End
Function Z26_PG_Keirei_03( NPC, PID, OBJ )
	WriteRoleValue( OBJ, EM_RoleValue_Register1, 1 )
	AdjustFaceDir( OBJ, PID, 0 )
	NpcSay( OBJ, "[SC_NPC122400_00]" )
	PlayMotion( OBJ, ruFUSION_ACTORSTATE_EMOTE_SALUTE )
	Sleep(20)
	AdjustFaceDir( OBJ, NPC, 0 )
	WriteRoleValue( OBJ, EM_RoleValue_Register1, 0 )
	WriteRoleValue( NPC, EM_RoleValue_Register1, 0 )
End

--=======================================
--���Ը���.�ӫ大���p���y--
function Lua_PG_Z26NPC_02()
	local Player = OwnerID()	
	NPCSAY(Player,"[SC_Z26_NPC_02]")
	Sleep(30)
	NPCSAY(Player,"[SC_Z26_NPC_03]")
	Sleep(35)
end

function Lua_PG_Z26NPC_03()
	local Player = OwnerID()	
	NPCSAY(Player,"[SC_Z26_NPC_04]")
	Sleep(30)
end
function Lua_PG_Z26NPC_04()
	local Player = OwnerID()	
	NPCSAY(Player,"[SC_Z26_NPC_05]")
	Sleep(50)
end

--=======================================
--���sBUFF�ץ�--
function LuaPG_BlackDragon_02()
	AddBuff( OwnerID(),624666,0,-1)
	AddBuff( OwnerID(),624667,0,-1)
end