--z23�S��G�m�ϥ�=======================================
function LuaPG_Get()		--���H���}�Ʊ_01
	local NPC= OwnerID()
	local NPCNum=ReadRoleValue(NPC, EM_RoleValue_Register1)
	Sleep(5)
	if NPCNum == 0	then
		SetPlot(NPC,"range","LuaPG_Out",150)	--�d��@��
	end
end

function LuaPG_Out()		--���H���}�Ʊ_02	
	local Player = OwnerID()
	local NPC = TargetID()
	local PlayerJob = ReadRoleValue( Player , EM_RoleValue_VOC)

	if PlayerJob==0		then			--�ư�GM
		return
	end
	WriteRoleValue(NPC, EM_RoleValue_Register1, 999)
	if CheckBuff(Player, 622181)==false	then
		ChangeZone(Player, 23, 0, -5281, 556.4, -15119.9, 166.6)
		ScriptMessage( Player, Player, 0,"[SC_OUT_OFF_HERE]", 0 )
	end
	WriteRoleValue(NPC, EM_RoleValue_Register1, 0)
end
---------------------------------------------------------------------------
function LuaPG_Cancel_Smell()		--���Ʀ���
	local NPC = OwnerID()
	local Player = TargetID()
	local PlayerList = SearchRangePlayer( Player, 50 )	--�����񪱮a
	local Num = table.getn(PlayerList)	
	
	for i=0,Num do
		CancelBuff(PlayerList[i], 622181)		--����buff
	end
end

---------------------------------------------------------------------------
function LuaPG_Smell_Catch()--�W���DBUFF
	local Player = OwnerID()
	local NPC = TargetID()

--�ˬd����
--�WBUFF
end
---------------------------------------------------------------------------
function LuaPG_Rock_Punch()
	SetIdleMotion(OwnerID(),ruFUSION_ACTORSTATE_CAST_SP01)
end
---------------------------------------------------------------------------

function Lua_PG_Ant_leader()
--		<<�y�� Matrix ��ƥN���m���ܷN��>>
-- [1]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
-- [2]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
-- [3]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
--               		                :
-- [Count]	[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
	local dis = 50
	local count = 3 --�}�C���j�p�A��J3 �|�O 3*3 ���}�C�F���L�]����ƥ������_�ơA�ҥH��J 4 �|�O 5*4 ���}�C�C
	local checktime = 10 --�P�_���ɶ����Z�A�ƭȷU�C�A�P�_���W�v�U���A�U�۵M�A���Ӫ��귽�]�U�h
	local ReviveTime = 100  --��}�C����������������ɡA�i��}�C���m���ʧ@�A�p�G�� -1 �A�N�|���� OwnerID() �]�w�����ͮɶ����m
	local circle = 6000  --�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��

--�إ߳o�Ӱ}�C
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 

--�إߤ@�� table�A�b�Q���ͪ��󪺦�m�� LuaFunc_CreateNPCByMatrix(ObjID,Matrix,A,B ) ���ͪ���C �䤤�|�ӼƭȨ̧ǥN�� 1.�n�ͦ�������ID 2.�@����Ǫ��}�C 3.�C��m 4.���m
	local ObjMatrix ={}
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(106727,Matrix,3,-1 )
	
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(106727,Matrix,3,1 )

	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(106720,Matrix,2,0 )

--�Ѱj��禡Ū�J��ơA�ӱ���Ҧ��}�C�������󲾰�
	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle ) 

--�N�ѦҪ���]�w�^��Ӫ��X���I
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
--�n�D���s�����l�@��
	BeginPlot( OwnerID() , "Lua_PG_LeadSwitch" , 0 );
end

function Lua_PG_LeadSwitch()
	BeginPlot( OwnerID() , "Lua_PG_Ant_leader" , 2 );
end
---------------------------------------------------------------------------
function Lua_PG_Carry()
	PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_CARRY_BEGIN)
	Sleep(30)
end
---------------------------------------------------------------------------
function Lua_PG_YaEat()	--���y���Y�����U
	local Ya = OwnerID()
	local Target = SearchRangeNPC( Ya, 70 )	
	local Num = table.getn(Target)		
	local OrgID =ReadRoleValue(TargetID(), EM_RoleValue_OrgID)
	local Percent = Rand(100)+1
	local j
--	NPCSay(Ya, Percent)

	if Percent <= 100 then 
		for i = 0,Num do
			OrgID = ReadRoleValue(Target[i], EM_RoleValue_OrgID)
				if OrgID == 120568 or OrgID ==120569 or OrgID ==120570  or OrgID ==120571 then
					j=i
					break
				end	
		end
	end

	if OrgID == 120568 or OrgID ==120569 or OrgID ==120570  or OrgID ==120571  then
		DW_GetClose_EX(Ya,Target[j], 10)
		CastSpell(Ya, Target[j], 850127)
		MoveToFlagEnabled(Ya, true)
	end
end

---------------------------------------------------------------------------
--function Lua_PG_AntCarry()	--���Ʒh�B�ʧ@
--	local Ant = OwnerID()
--	local RoomID = ReadRoleValue(Ant, EM_RoleValue_RoomID)
--	local X = ReadRoleValue( Ant, EM_RoleValue_X )
--	local Y = ReadRoleValue( Ant, EM_RoleValue_Y )
--	local Z = ReadRoleValue( Ant, EM_RoleValue_Z )
--	local Dir = ReadRoleValue( Ant, EM_RoleValue_Dir )	--�|��
--	local Flag = 781143	
--	local PID = ReadRoleValue( Ant , EM_RoleValue_PID )

--	local CarryMono = CreateObj( 120523, X, Y, Z , Dir, 1 )
--	SetDefIdleMotion(CarryMono,ruFUSION_MIME_DEATH_LOOP)
--	AddToPartition(CarryMono, RoomID )
--	WriteRoleValue(Ant,EM_RoleValue_Register10, CarryMono)
--	SetModeEx( CarryMono  ,EM_SetModeType_Mark , false ) 		--�аO
--	SetModeEx( CarryMono  ,EM_SetModeType_Move , false ) 	--����
--
--	sleep(5)
--	Addbuff ( Ant, 622690, 0, -1)
--	PlayMotionex ( Ant, ruFUSION_MIME_CARRY_BEGIN , ruFUSION_MIME_CARRY_LOOP )
--	sleep(5)
--	AttachObj( CarryMono, Ant, 1, "p_hit_point01" , "p_top"  ) 
--	SetDefIdleMotion( Ant, ruFUSION_MIME_CARRY_LOOP )
--	sleep (10)
--	LuaFunc_MoveToFlag( Ant, Flag , PID, 0)
--	sleep (10)
--	PlayMotion( Ant ,ruFUSION_ACTORSTATE_CARRY_END)
--	sleep (5)
--	CancelBuff( Ant, 622690)
--	DetachObj(CarryMono)
--	sleep (5)
--	DelObj(CarryMono)
--	SetDefIdleMotion( Ant , ruFUSION_MIME_IDLE_STAND )
--end

function Lua_PG_AntCarry()	--���Ʒh�B�ʧ@��
	Lua_425308_CarryMotion(120523)
	local Ant = OwnerID()
	local Flag = 781143	
	local PID = ReadRoleValue( Ant , EM_RoleValue_PID )
	sleep (10)
	if CheckBuff(Ant, 622690)==true	then
		LuaFunc_MoveToFlag( Ant, Flag , PID, 0)
	end
	sleep (10)
	Lua_425308_BuffDismiss("Drop")
end

function Lua_PG_AntCarry_02()	--���Ʒh�B�ʧ@��
	local Ant=OwnerID();
	local x,y,z,dir=DW_Location(Ant);
	local Corpse=CreateObj(120525,x,y,z,dir+90,1);
	SetDefIdleMotion(Corpse,ruFUSION_MIME_IDLE_DEAD);
	PlayMotionEX(Corpse, ruFUSION_ACTORSTATE_DEAD , ruFUSION_ACTORSTATE_DEAD);
	AddToPartition(Corpse,0);
	DW_UnFight(Corpse,true);
	SetModeEx(Corpse,EM_SetModeType_Mark,false);
	SetModeEx(Corpse,EM_SetModeType_ShowRoleHead,false);
	MoveToFlagEnabled(Corpse,false);
	sleep(10);
	WriteRoleValue(Ant,EM_RoleValue_Register10,Corpse);
	WriteRoleValue(Ant,EM_RoleValue_Register2,120525);
	AttachObj( Corpse , Ant ,1 ,"p_hit_point01","p_right_weapon");
	SetDir( Corpse, dir+180 )
	AddBuff(Ant,622690,0,-1);
	SetDefIdleMotion(Ant,ruFUSION_MIME_CARRY_LOOP);
--	Lua_425308_CarryMotion(120525)
	local Flag = 781143	
	local PID = ReadRoleValue( Ant , EM_RoleValue_PID )
	sleep (10)
	if CheckBuff(Ant, 622690)==true	then
		LuaFunc_MoveToFlag( Ant, Flag , PID, 0)
	end
	sleep (10)
	Lua_425308_BuffDismiss("Drop")
end

function Lua_PG_AntCarry_03()	--���Ʒh�B�ʧ@��(�H���a�I)
	Lua_425308_CarryMotion(120523)
	local Ant = OwnerID()
	local Flag = 781143	
	local PID = ReadRoleValue( Ant , EM_RoleValue_PID )
	sleep (10)
	local RandPlace = Rand(2)+PID
	if CheckBuff(Ant, 622690)==true	then
		LuaFunc_MoveToFlag( Ant, Flag , RandPlace, 0)
	end
	sleep (10)
	Lua_425308_BuffDismiss("Drop")
end

---------------------------------------------------------------------------
function Lua_PG_AntAttack()		--���Ƥ�������
	local Center = OwnerID()
	local RoomID = ReadRoleValue(Center, EM_RoleValue_RoomID)
	local X = ReadRoleValue( Center, EM_RoleValue_X )
	local Y = ReadRoleValue( Center, EM_RoleValue_Y )
	local Z = ReadRoleValue( Center, EM_RoleValue_Z )
	local Dir = ReadRoleValue( Center, EM_RoleValue_Dir )		--�|��

	local AntList = {}
	AntList[1] = CreateObj( 106727, X, Y, Z+20, Dir, 1)		--�u����
	AntList[2] = CreateObj( 106859, X, Y, Z-20, Dir, 1)		--�u����
--	AntList[3] = CreateObj( 106720, X-80, Y, Z , Dir, 1)		--�ʭx��

	for i =1,2 do	
		AddToPartition(AntList[i], RoomID )
		WriteRoleValue(Center,(EM_RoleValue_Register-1)+i, AntList[i])
		--���ͤ@�ө�m�I�M�@�ӧl���I�A�ñN���O�bCenter�W
		WriteRoleValue(AntList[i],EM_RoleValue_Register5,Center)	--�N�����O�b�Ǫ����W
		AdjustFaceDir( AntList[i], Center,0 )
--		Say(AntList[i], i)
	end
	AdjustFaceDir( AntList[1], AntList[2], 0 )
	AdjustFaceDir( AntList[2], AntList[1], 0 )
	SetAttack(AntList[1],AntList[2])

	WriteRoleValue(Center,EM_RoleValue_Register4, 2)
end

function Lua_PG_AntDead_EX()	--�����ˬd��(�ˬd�ۨ���q�P�_�O�_�٭n�i���m)
	local Ant = OwnerID()
	local Center = ReadRoleValue( Ant, EM_RoleValue_Register5 )
	local Ant1 = ReadRoleValue( Center, EM_RoleValue_Register1 )
	local Ant2 = ReadRoleValue( Center, EM_RoleValue_Register2 )
	local MaxHP1 = ReadRoleValue( Ant1, EM_RoleValue_MaxHP )
	local MaxHP2 = ReadRoleValue( Ant2, EM_RoleValue_MaxHP )

	
		--�ˬd��q�A��90�H����
	--�N���|�~��
	--�p�G����90�H�A�Ӥ���������a
	--�������a
end

function Lua_PG_AntDead()		--���Ʀ��`�@��
	local Ant = OwnerID()
	local Center = ReadRoleValue( Ant, EM_RoleValue_Register5 )
	local Ant1 = ReadRoleValue( Center, EM_RoleValue_Register1 )
	local Ant2 = ReadRoleValue( Center, EM_RoleValue_Register2 )

	BeginPlot(Ant , "Lua_PG_CancelAntBuff", 2)
	if Center~=0	then
		local SurvieNum = ReadRoleValue( Center, EM_RoleValue_Register4 )
		SurvieNum = SurvieNum-1
		WriteRoleValue(Center,EM_RoleValue_Register4, SurvieNum)

		if (ReadRoleValue(Ant,EM_RoleValue_OrgID) ==106727 or
		ReadRoleValue(Ant,EM_RoleValue_OrgID) ==106859)	and
		SurvieNum >0						then
			Sleep(180)
			CallPlot(Center,"Lua_PG_AntDead_02",Center,Ant1,Ant2,Ant,SurvieNum)
		end		

		if SurvieNum ==0	then
			Sleep(180)
			CallPlot(Center,"LuaFunc_ResetObj",Center)
		end
	end
end

function Lua_PG_AntDead_02(Center,Ant1,Ant2,Ant,SurvieNum)
	if (ReadRoleValue(Ant,EM_RoleValue_OrgID) ==106727 or
	ReadRoleValue(Ant,EM_RoleValue_OrgID) ==106859)	and
	SurvieNum >0						then
	--	Say(Center,"A")
		local AttackTarget1 = ReadRoleValue( Ant1 ,EM_RoleValue_IsAttackMode)
		local AttackTarget2 = ReadRoleValue( Ant2 ,EM_RoleValue_IsAttackMode)
		local AttackPerson = ReadRoleValue( Ant2 ,EM_RoleValue_IsAttackMode)
		local WrongList = {106719,106720,106721,106726,106728}
		local WrongNum = table.getn(WrongList)
	--	local Ant3 = ReadRoleValue(Center, EM_RoleValue_Register3)
	--	local AttackTarget3 = ReadRoleValue( Ant3 ,EM_RoleValue_IsAttackMode)
	--	Say(Center,"3")
			if AttackTarget1==0	and			--���s�������ƦӥB���ƨS���i�J�԰�
			AttackTarget2==0	then			--�P�_�O�_�i�J�԰� 1= �O 0= �_
	--			Say(Center,"B")
				for i=1,3 do
					DelObj(Ant1)
					DelObj(Ant2)
	--				DelObj(Ant3)
				end
				CallPlot(Center,"LuaFunc_ResetObj",Center)
			end

			for i=1,WrongNum do
				if AttackPerson==WrongList[i]	then	--�p�G���H�ç���
					CallPlot(Center,"LuaFunc_ResetObj",Center)
				end
			end
	end
end

function Lua_PG_FightPractice()
	AddBuff(OwnerID(),622618,1,-1)
	CallPlot( OwnerID(), "Cl_ZoneMonster_RandBuff", 0)
end

function Lua_PG_FightPractice_02()
	AddBuff(OwnerID(),622620,1,-1)
	AddBuff(OwnerID(),622894,1,-1)
	CallPlot( OwnerID(), "Cl_ZoneMonster_RandBuff", 0)
end

function Lua_PG_CheckDis()
	local Ant = OwnerID()
	local Center = ReadRoleValue( Ant, EM_RoleValue_Register5 )
	local Ant2 = ReadRoleValue( Center, EM_RoleValue_Register2 )
	local Distance = GetDistance( Center,Ant2 )
	if Distance>60	then
		SetRoleCamp( Ant2, "Monster" )
	end
end

---------------------------------------------------------------------------
function Lua_PG_SlowDown()
	AddBuff(OwnerID(),622643,1,-1)
	CallPlot( OwnerID(), "Cl_ZoneMonster_RandBuff", 0)
end

---------------------------------------------------------------------------
function Lua_PG_Light()
	local Center = OwnerID()
	local RoomID = ReadRoleValue(Center, EM_RoleValue_RoomID)
	local X = ReadRoleValue( Center, EM_RoleValue_X )
	local Y = ReadRoleValue( Center, EM_RoleValue_Y )
	local Z = ReadRoleValue( Center, EM_RoleValue_Z )
	local Dir = ReadRoleValue( Center, EM_RoleValue_Dir )		--�|��

	local MagicWand = CreateObj( 120754, X, Y, Z, Dir, 1)
	AddToPartition(MagicWand, RoomID )
	WriteRoleValue(Center,EM_RoleValue_Register1, MagicWand)

	AddBuff(Center,622644,1,-1)
end

function Lua_PG_MagicWand()
	CastSpell(OwnerID(),OwnerID(),850206)
end

---------------------------------------------------------------------------
function Lua_PG_AntWork()	--���ƱĶ�����
	local Ant = OwnerID()
	local Monster = SearchRangeNPC( Ant, 50 )
	local Num = table.getn(Monster)	
	local BodyOrgID = 0
	local BodyList={}
	BodyList[120846] = 850207
	BodyList[120850] = 850208
	BodyList[120848] = 850207
	BodyList[120849] = 850208

	for i = 0,Num do
--		Say(Ant, "I GOT IT")
		BodyOrgID= ReadRoleValue(Monster[i], EM_RoleValue_OrgID)
			if BodyOrgID == 120846 or BodyOrgID == 120850
			or BodyOrgID == 120848 or BodyOrgID == 120849	then
--				Say(Ant, "I DO IT")
				CastSpell(Ant, Monster[i], BodyList[BodyOrgID])
				break
			end
	end
end

---------------------------------------------------------------------------
function Lua_PG_23Talk_01()
	local NPC = OwnerID()
	local Num = 0
	local NPCList = {}
	NPCList[120852]= {"[SC_23TALK_01]","[SC_23TALK_02]","[SC_23TALK_03]"}
	NPCList[120853]="[SC_23TALK_05]"
	NPCList[120854]="[SC_23TALK_04]"
	local NPCID = ReadRoleValue(NPC, EM_RoleValue_OrgID)

	while true do
		if NPCID == 120852	then
			Num = Rand(3)+1
			Npcsay(NPC, NPCList[120852][Num])
			Sleep(100)
		else
			Npcsay(NPC, NPCList[NPCID])
		end
		Sleep(130)
	end
end

---------------------------------------------------------------------------
function Lua_PG_CancelAntBuff()
	Lua_ZonePE_3th_GetScore(1)
	local Ant = OwnerID()
	local PlayerList = SearchRangePlayer( Ant, 30)
	local Num = table.getn(PlayerList)
	local OrgID = ReadRoleValue(Ant, EM_RoleValue_OrgID)
	if OrgID==106728	then
		local CarryMono = ReadRoleValue(Ant,EM_RoleValue_Register10)
		DelObj(CarryMono)
	end
	for i = 0, Num do
		if CheckBuff(PlayerList[i],622181)==true	then
			CancelBuff(PlayerList[i], 622181)
		end
	end
end


---------------------------------------------------------------------------
--���@�̰��|�w�ǩ_�G�m-------------------------------------------------
function Lua_PG_RaiseAnt_Light()
	local Ant = OwnerID()
	local RoomID = ReadRoleValue(Ant, EM_RoleValue_RoomID)
	local X = ReadRoleValue( Ant, EM_RoleValue_X )
	local Y = ReadRoleValue( Ant, EM_RoleValue_Y )
	local Z = ReadRoleValue( Ant, EM_RoleValue_Z )
	local Dir = ReadRoleValue( Ant, EM_RoleValue_Dir )		--�|��		

	local MagicLight = CreateObj( 121029, X, Y, Z , Dir, 1 )
	AddToPartition(MagicLight, RoomID )
	SetModeEx( MagicLight  ,EM_SetModeType_Mark , false ) 	--�аO
	SetModeEx( MagicLight  ,EM_SetModeType_Move , false )	--����	
end

function Lua_PG_RaiseAnt()
	local Machine = OwnerID()
	local Egg = SearchRangeNPC(Machine, 70)
	local EggID = 0
	local Num = table.getn(Egg)	
	AddBuff(Machine, 622942, 0, -1)
	while true do
		for i = 1, Num do
			EggID = ReadRoleValue(Egg[i], EM_RoleValue_OrgID)
			if EggID == 121030 	then
				CastSpell(Machine, Egg[i], 850215)
			end
			Sleep(10)
		end
	end
end