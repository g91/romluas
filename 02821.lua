--z25�G�m=======================================
--=======================================
--�Τl�ð_��
---------------------------------------------------------------------------
function LuaPG_Hiding_Bug()
	local Bug = OwnerID()
	local HateorNot
	local Fightornot
	PlayMotionEX( Bug, ruFUSION_ACTORSTATE_SLEEP_BEGIN,ruFUSION_ACTORSTATE_SLEEP_LOOP)
	while 1 do		--�j��A�L�԰����A�N��ı
		Sleep(60)
		HateorNot = HateListCount(Bug)
		Fightornot = ReadRoleValue( Bug, EM_RoleValue_AttackTargetID )
		if HateorNot~=0	then
			SetDefIdleMotion(Bug, ruFUSION_MIME_NONE)
			if Fightornot ~=0	then
				SetDefIdleMotion(Bug, ruFUSION_MIME_ATTACK_1H)
			end
		end
		if HateorNot==0	then
			--PlayMotionEX( Bug, ruFUSION_ACTORSTATE_SLEEP_BEGIN,ruFUSION_ACTORSTATE_SLEEP_LOOP)
			SetDefIdleMotion(Bug, ruFUSION_MIME_IDLE_SLEEP)
		end
	end
end


function LuaPG_Gupu()
	PlayMotion(OwnerID(), ruFUSION_ACTORSTATE_CAST_SP01)
	Sleep(50)
end

function LuaPG_Gupu_02()
	PlayMotion(OwnerID(), ruFUSION_ACTORSTATE_BUFF_SP02)
	Sleep(50)
end

function LuaPG_Cat()
	PlayMotion(OwnerID(), ruFUSION_ACTORSTATE_EMOTE_THINK)
	Sleep(50)
end

function LuaPG_KillTheButterfly()
	local Monster_Weak = TargetID()
	local OrgID = ReadRoleValue(Monster_Weak, EM_RoleValue_OrgID)
	if OrgID ~= 107474	then
		return false
	end
end

function LuaPG_FEAR_02()   ----��{�X���߷P
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_emote_head_shake)
	sleep(30)
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_emote_CRY)
	sleep(30)
end

function LuaPG_KillTheButterfly_buff() --��o�����A���p�ʪ��|�Q���������׭��Ǭ��
	AddBuff ( OwnerID(),621301,0,-1)
end

function LuaPG_Dra()
	PlayMotion(OwnerID(), ruFUSION_ACTORSTATE_HURT_NORMAL)
	Sleep(30)
end

function LuaPG_CryingAllTheTime()
	SetDefIdleMotion(OwnerID(),ruFUSION_MIME_EMOTE_CRY)
	Sleep(30)
end

function LuaPG_SLUMBER()
	SetDefIdleMotion(OwnerID(), ruFUSION_MIME_SLUMBER)
end

---------------------------------------------------------------------------
--��桮���`�|����
---------------------------------------------------------------------------
function LuaS_PG_NowToHide()
	AddBuff( OwnerID() ,624171,1 ,-1)
end

---------------------------------------------------------------------------
--�N�୸�b�Ť�
---------------------------------------------------------------------------
function LuaS_PG_Gill_Fly()
	SetDefIdleMotion( OwnerID(), ruFUSION_MIME_JUMP_LOOP)
end

---------------------------------------------------------------------------
--�s�~
---------------------------------------------------------------------------
function LuaS_PG_Dra_01()
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_MINING_LOOP)
	Sleep(10)
end

---------------------------------------------------------------------------
--�Q�t
---------------------------------------------------------------------------
function LuaPG_Eat()
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_EAT)
	Sleep(10)
end

---------------------------------------------------------------------------
--���s�S��
---------------------------------------------------------------------------
function LuaPG_DarkDra_Buff()
	CastSpell(OwnerID(),OwnerID(),850755)
end

---------------------------------------------------------------------------
--�B�R�h�Ķ�
---------------------------------------------------------------------------
function LuaPG_Gupu_Get_Mushroom()
	local NPC = OwnerID()
	local OrgID 
	local Plant = SearchRangeNPC(NPC, 50)
	local Ball
	local x,y,z,dir
	for i = 0,#Plant do
		OrgID = ReadRoleValue(Plant[i], EM_RoleValue_OrgID)
		--Say(NPC,"00")
		if OrgID == 122151 then
			x,y,z,dir = DW_Location(Plant[i])
			Ball = CreateObj(119875, x, y+5, z , dir, 1 )		--�ͦ����βy���S�ĥ�
			SetModeEx(Ball, EM_SetModeType_Mark,FALSE)
			SetModeEx(Ball, EM_SetModeType_Move,FALSE)
			--SetModeEx(Ball, EM_SetModeType_Gravity, false);
			AddToPartition(Ball, 0)
			--Say(Ball,"33")
			--Say(NPC,"11")
			MoveToFlagEnabled( NPC, false )
			for K=1,5 do
				CastSpell(NPC, Ball,850756)
				Sleep(100)
			end
			DelObj(Ball)
			MoveToFlagEnabled( NPC, true )
			break
		end
		Sleep(10)
	end
end

function Lua_PG_GuPu_Follow()
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
	local circle = 6000  --�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��

--�إ߳o�Ӱ}�C
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 

--�إߤ@�� table�A�b�Q���ͪ��󪺦�m�� LuaFunc_CreateNPCByMatrix(ObjID,Matrix,A,B ) ���ͪ���C �䤤�|�ӼƭȨ̧ǥN�� 1.�n�ͦ�������ID 2.�@����Ǫ��}�C 3.�C��m 4.���m
	local ObjMatrix ={}
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(122152,Matrix,2,-1 )
--���� PID �H�� MONEY �N�@���@�}�l�x�s��ƩҥΡA�p�G�n�ܧ󤺳����ȡA�Цܤ� sleep( checktime )

--�Ѱj��禡Ū�J��ơA�ӱ���Ҧ��}�C�������󲾰�
	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	--���Ӽƭȶ��Ǭ� 1.�إߪ�����ҦbTABLE 2.�إߪ��}�C 3.���Z 4.�}�C���j�p 5.�P�_���ɶ� 6.�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��
	--PS.�p�G�]�w���� NPC ���W���� SCRIPT�A�h�g������ 0 �� �ANPC ���ͫ�N���|�۰ʱ� SCRIPT

--�N�ѦҪ���]�w�^��Ӫ��X���I
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
--�n�D���s�����l�@��
	BeginPlot( OwnerID() , "Lua_PG_GuPu_Follow_Reset" , 0 )
end

function Lua_PG_GuPu_Follow_Reset()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_PG_GuPu_Follow" , 0 )
end


---------------------------------------------------------------------------
--�¦�k�}
---------------------------------------------------------------------------
function LuaPG_DarkBuff()
	CastSpell(OwnerID(),OwnerID(),850758)
end

function LuaPG_DarkBuff_01()
	SetDefIdleMotion( OwnerID(), ruFUSION_MIME_RUN_CHARGE2)
	CastSpell(OwnerID(),OwnerID(),850759)
end