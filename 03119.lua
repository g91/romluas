--z30�G�m=======================================
--=======================================
--==============���H�a�p�H
function LuaPG_108424_Elephant()
--		<<�y�� Matrix ��ƥN���m���ܷN��>>
-- [1]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
-- [2]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
-- [3]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
--               		                :
-- [Count]	[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
	local dis = 40
	local count = 3 --�}�C���j�p�A��J3 �|�O 3*3 ���}�C�F���L�]����ƥ������_�ơA�ҥH��J 4 �|�O 5*4 ���}�C�C
	local checktime = 10 --�P�_���ɶ����Z�A�ƭȷU�C�A�P�_���W�v�U���A�U�۵M�A���Ӫ��귽�]�U�h
	local ReviveTime = 100  --��}�C����������������ɡA�i��}�C���m���ʧ@�A�p�G�� -1 �A�N�|���� OwnerID() �]�w�����ͮɶ����m
	local circle = 6000  --�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��

--�إ߳o�Ӱ}�C
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 

--�إߤ@�� table�A�b�Q���ͪ��󪺦�m�� LuaFunc_CreateNPCByMatrix(ObjID,Matrix,A,B ) ���ͪ���C �䤤�|�ӼƭȨ̧ǥN�� 1.�n�ͦ�������ID 2.�@����Ǫ��}�C 3.�C��m 4.���m
	local ObjMatrix ={}
		ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(108424,Matrix,2,0 )
		ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(108554,Matrix,3,1 )
		ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(108554,Matrix,3,-1 )

--�Ѱj��禡Ū�J��ơA�ӱ���Ҧ��}�C�������󲾰�
	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle ) 

--�N�ѦҪ���]�w�^��Ӫ��X���I
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
--�n�D���s�����l�@��
	BeginPlot( OwnerID() , "LuaPG_108424_Elephant_02" , 0 );
end

function LuaPG_108424_Elephant_02()
	BeginPlot( OwnerID() , "LuaPG_108424_Elephant" , 2 );
end

--==============�۪O�U���k�}
function LuaPG_123322_MagicCircle()
	local Board = OwnerID()
	local x,y,z,dir=DW_Location(Board)
	local MagicCircle01 = CreateObj(120303, x, y, z , dir, 1 )	--�ͦ�
	local MagicCircle02 = CreateObj(123357, x, y, z , dir, 1 )	--�ͦ�
	AddToPartition(MagicCircle01, 0)	
	AddToPartition(MagicCircle02, 0)	
end

--==============�ӫǶǰe��
function LuaPG_Grave_Down()		--�Ǩ�ӥޤU
	local Player = OwnerID()
	SetPlot( Player, "range" , "LuaPG_Grave_Down_02" , 60 )
end

function LuaPG_Grave_Down_02()
	local Player = OwnerID()
	if (DW_CheckQuestAccept("or",Player,426804)==true	or
	CheckCompleteQuest(Player, 426804)==true)		and
	CheckCompleteQuest(Player, 426900)==false		then
		ChangeZone( Player , 30 , 0 , 16317.4 , -425.0 , 41871.8 , 270.8 )
	elseif CheckCompleteQuest(Player, 426900)==true	then
		ChangeZone( Player , 30 , 0 , 16317.4 , -1655.3 , 41871.8 , 270.8 )
	end
end

function LuaPG_Grave_Up()		--�Ǩ�ӫǤW
	local Player = OwnerID()
	SetPlot( Player, "range" , "LuaPG_Grave_Up_02" , 60 )
end

function LuaPG_Grave_Up_02()
	ChangeZone( OwnerID() , 30 , 0 , 16333.0 , 757.3, 42189.3 , 262 )
end

--==============�Ʊ����d�F�ĦX��
function LuaPG_Z30_Talk1()
	local NPC = OwnerID()
	LuaP_Sitting()
	SetPlot(NPC,"touch","LuaPG_Z30_Talk1_1",30)
	SetCursorType( NPC , eCursor_Speak) 
end
function LuaPG_Z30_Talk1_1()
	local num = Rand(3)+1
	NpcSay(TargetID(),"[SC_Z30_TALK1_"..num.."]")
end

--==============�ۨ��ۻy
function LuaPG_Z30_Talk2_1()
	local num = Rand(3)+1
	NpcSay(OwnerID(),"[SC_Z30_TALK2_"..num.."]")
	Sleep(25)
end

--==============�v��J������
function LuaPG_Z30_Talk3_1()
	local NPC = OwnerID()
	SetPlot(NPC,"touch","LuaPG_Z30_Talk3_2",30)
	SetCursorType( NPC , eCursor_Speak) 
end
function LuaPG_Z30_Talk3_2()
	local num = Rand(3)+1
	NpcSay(TargetID(),"[SC_Z30_TALK3_"..num.."]")
end

--==============�@�s����
function LuaPG_108428_Bat()
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
		ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(108428,Matrix,2,0 )
		ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(108428,Matrix,3,1 )
		ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(108428,Matrix,3,-1 )

--�Ѱj��禡Ū�J��ơA�ӱ���Ҧ��}�C�������󲾰�
	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle ) 

--�N�ѦҪ���]�w�^��Ӫ��X���I
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
--�n�D���s�����l�@��
	BeginPlot( OwnerID() , "Lua_PG_108424_Elephant_02" , 0 );
end

function LuaPG_108428_Bat_02()
	BeginPlot( OwnerID() , "Lua_PG_108424_Elephant" , 2 );
end

--==============�Z�Ʃԩ��
function LuaPG_108504_Tan()
	PlayMotion(OwnerID(), ruFUSION_ACTORSTATE_CAST_SP01)
	CastSpell( OwnerID(), OwnerID(), 850752)
end

--==============�T�϶ǰe�I
function LuaPG_Z30_TransPos()
	local Player = OwnerID() 
	local TransPos = TargetID()
	local TransPID = ReadRoleValue( TransPos, EM_RoleValue_PID )
	LoadQuestOption(Player)
	if TransPID==1	then	--�����J
		AddSpeakOption(Player, TransPos, "[SC_Z30TRANSPOS_2]", "LuaPG_Z30_TransPos_01(2)", 0)
		AddSpeakOption(Player, TransPos, "[SC_Z30TRANSPOS_3]", "LuaPG_Z30_TransPos_01(3)", 0)
	elseif TransPID==2	then	--�ĺ��ڿ�
		AddSpeakOption(Player, TransPos, "[SC_Z30TRANSPOS_1]", "LuaPG_Z30_TransPos_01(1)", 0)
		AddSpeakOption(Player, TransPos, "[SC_Z30TRANSPOS_3]", "LuaPG_Z30_TransPos_01(3)", 0)
	elseif TransPID==3	then	--��������a
		AddSpeakOption(Player, TransPos, "[SC_Z30TRANSPOS_1]", "LuaPG_Z30_TransPos_01(1)", 0)
		AddSpeakOption(Player, TransPos, "[SC_Z30TRANSPOS_2]", "LuaPG_Z30_TransPos_01(2)", 0)	
	end
end

function LuaPG_Z30_TransPos_01(Pos)
	local Player = OwnerID()
	local obiect = TargetID()
	local x, y, z, dir=DW_Location( obiect ) 
    	local BallFx=CreateObj( 122133, x, y-10, z, dir, 1 ) 
	AddToPartition( BallFx, 0 ) 
	CastSpell( Player, Player, 490513 ) 
	Sleep( 20 )
	if CheckID( Player )==true	then
		DelObj(BallFx)
		if Pos==1		then
			SetPosByFlag( Player , 781381, 71 )
		elseif Pos==2		then
			SetPosByFlag(  Player , 781381, 72 )
		elseif Pos==3		then
			SetPosByFlag( Player , 781381, 73 )
		end
	else DelObj(BallFx)
	end
	if DW_CheckQuestAccept("or",Player,427304)==true	then
		SetFlag(Player, 549352, 1)
	end
end