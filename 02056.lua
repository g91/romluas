function LuaS_103120_HPpercent()
	local Owner = OwnerID()
	local MaxHP = ReadRoleValue(Owner,EM_RoleValue_MaxHP)
	local HP
	local PEPhase
	
	while	true	do
		sleep(10)
		HP = ReadRoleValue(Owner,EM_RoleValue_HP) --�p���q���ʤ���
		PEPhase = PE_GetActivePhaseIndex(1)
		HPpercent_103120 = math.floor((HP*100)/MaxHP) --�N��q�e�i�����ܼ�
		if	PEPhase >99	then
			PE_SetVar("ResidualHP",HPpercent_103120)
		elseif	PEPhase==500	and	CheckBuff(Owner,507407)==false	then
			AddBuff(Owner,507407,1,-1)
		end
	end
end
----------------------------------------------------------------
--�w�f�纸�D��j��
function LuaS_103120_AILoop_DW_00()
	local BossID = OwnerID()
	SetPlot(BossID,"dead","LuaS_104761_Dead",0)--�����@��

	AddBuff(BossID,507590,1,-1) --�L�k�Q���h
	BeginPlot(BossID,"LuaS_103120_HPpercent",0) --�H�ɳB�z��q



--�إߩҦ����q
	local State = {}
	State[0] = LuaS_103120_Phase_Fixing
	State[50] = LuaS_103120_Phase_Fixed
--�R�W�W�h�G
--�ʦ�Ƭ����q
--�Q��ƭӦ�ƬO���A�t��
--00 �����O�M�w���A�����q
	State[100] = LuaS_103120_Phase_100
	State[200] = LuaS_103120_Phase_200
	State[300] = LuaS_103120_Phase_300
	State[400] = LuaS_103120_Phase_400

	State[101] = LuaS_103120_Phase_101
	State[102] = LuaS_103120_Phase_102
	State[103] = LuaS_103120_Phase_103

	State[201] = LuaS_103120_Phase_201
	State[202] = LuaS_103120_Phase_202
	State[203] = LuaS_103120_Phase_203
                                          
	State[301] = LuaS_103120_Phase_301
	State[302] = LuaS_103120_Phase_302
	State[303] = LuaS_103120_Phase_303

	State[401] = LuaS_103120_Phase_401
	State[402] = LuaS_103120_Phase_402
	State[403] = LuaS_103120_Phase_403

	State[500] = LuaS_103120_Phase_500

--�����ܼư�
--�ŧi  �����ܼư�
	HPpercent_103120 = 100 --BOSS ��q�ʤ���
	Boss_103120_GetMemory = 0
	Boss_103120_ReferencePoint = {"p_right_foot","p_left_foot","p_right_hand","p_left_hand"}
	Boss_103120_KillerWeaponList = {496384,496385,496386,496387,496388}
	Boss_103120_FireTargetArray = {}
	Boss_103120_EnergyStore ={}
	Boss_103120_EnergyReSet = {}
	Boss_HP = ReadRoleValue(BossID,EM_RoleValue_MaxHP) --�O��Boss����q
	Sanctions = {} --����̺޲z�}�C
	TankSanctions = {}
	LuaS_103120_Array = {}
	SanctionMark = 0--1.�Ķ��[�t 2.�����[�j 3.�״_�[�j
	AI_Order_103120 = 0--��ʥN��
	Boss_103120_BonusCheck = 0
	--900 ��l��
	--901 �Ķ��Ҧ�
	--902 �����Ҧ�
	--995 �״_�Ҧ�

--�إ�PE
	LuaS_103120_PE_DW_00()
	BeginPlot(BossID,"LuaS_103120_PE_DW_04",0) --�������հj��

--��l�ƶǭȰʧ@
	local ThisObj=FSM_Initial(BossID,State);

--AI�̪�l�N�q���@�Ӷ��q�}�l����
	FSM_DoTransion(ThisObj,0)
	LuaS_103120_Array[BossID]=ThisObj
--�j�����AI
	while true do
		sleep(10)
		FSM_Update(ThisObj)
	end
end
----------------------------------------------------------------
LuaS_103120_Phase_Fixing = {}
function LuaS_103120_Phase_Fixing.enter(ThisObj)
	CancelBuff(ThisObj.MonID,508005)--�Ѱ����˥���
	SetPlot(ThisObj.MonID,"range","",0)

	if	ReadRoleValue(ThisObj.MonID,EM_RoleValue_HP)<ReadRoleValue(ThisObj.MonID,EM_RoleValue_MaxHP)*0.2	then
		LuaS_103120_BossDrop(ThisObj.MonID)
	end
	ScriptMessage( ThisObj.MonID, -1, 0, "[SC_103120_CON_00001]", 0 )--�����a���T��

	SetModeEx(ThisObj.MonID,EM_SetModeType_Fight,false) 
	SetModeEx(ThisObj.MonID,EM_SetModeType_Obstruct,true) 
	if	Sanctions ~= nil	then   --�R���ª������
		local Temp
		for i=1,table.getn(Sanctions),1 do
			for k=1,table.getn(Sanctions[i])-3,1 do
				Temp = Sanctions[i][k]
				if	CheckID(Temp)~=false	then
					DW_CheckThenDel(Temp)
				end
			end
		end
		for i=1,table.getn(TankSanctions),1 do
			if	CheckID(TankSanctions[i])~=false	then
				DW_CheckThenDel(TankSanctions[i])
			end
		end
		Sanctions = {}
		TankSanctions = {}
	end
--<<PE�_�l>>
--�ƭȫŧi
	local BValue_0 = FSM_GetState(ThisObj,0)
	BValue_0.EricMan = {} --�B�z��O�J��s����id
	BValue_0.EricManNum = GetMoveFlagCount(780082)-1 --��O�J��s�����`��=�X�l��h�s���X
	BValue_0.Sanctions = {}
	BValue_0.SanctionNum = GetMoveFlagCount(780083)-1 --���ר�����`�� = �X�l��h�s���X



--�p�G�����ܧR��==>�C������s�]�Ʀ�m
	if	BValue_0.Equipment~= nil	then--����ŭȳ���
		for i=1,BValue_0.EquipmentNum,1 do
			DW_CheckThenDel(BValue_0.Equipment[i][1])
		end
	end
--���ͷ٪��Ұꪺ�]��
	BValue_0.Equipment = {}
	BValue_0.EquipmentNum = GetMoveFlagCount(780085)-1 --780085
	local Temp--�Ȧs��
	for i=1,BValue_0.EquipmentNum,1 do
		Temp = DW_CreateObjEX("flag",104757,780085,i,1,0)
		SetPlot(Temp,"dead","LuaS_104761_Dead",0)--�ä����`
		SetModeEx(Temp,EM_SetModeType_Move,false) --��������
		DW_UnFight(Temp)--�����԰�
		Lua_ObjDontTouch( Temp )--���}���I��
		SetModeEx(Temp,EM_SetModeType_Mark,true) 
		AddBuff(Temp,507891,1,-1)--�˦�
		AddBuff(Temp,507899,1,-1)--���i���
		BValue_0.Equipment[i] = {}
		BValue_0.Equipment[i][1] = Temp --�O���s��

		SetPlot(BValue_0.Equipment[i][1],"range","LuaS_116726_CancelBuff_01",40)--�^���෽
	end
	Boss_103120_PH303_Time = nil


--����ʧ@
	SetDefIdleMotion(ThisObj.MonID,ruFUSION_MIME_SLEEP_LOOP)
	PlayMotion(ThisObj.MonID,ruFUSION_ACTORSTATE_SLEEP_BEGIN)

--�״_�ԳN���O
	AI_Order_103120 = 995
	SanctionMark = 3
--�����!!!!!!!!!!!!
	BValue_0.Fixer = {}
--���ͺ��ץΨ����
	local Sanc
	for i=1,BValue_0.SanctionNum,1 do
		Sanc= DW_CreateObjEX("flag",104613,780083,i,0,0)--���ץΪ������
		DW_UnFight(Sanc)--�ק��ݩ�
		Lua_ObjDontTouch( Sanc )--�ק��ݩ�
		AddToPartition(Sanc,0)

		BValue_0.Sanctions[i] = Sanc --�O��Sanc��ID  Sanc�|�Q�ΨӰO����L���
		BeginPlot(Sanc,"LuaS_103120_SanctionAI",0)
	end

	sleep(10)
--�b�o�@�ϲ��ͧG�m�Ϊ���O�J��s��&���ȥΪ�NPC
	for i=1,BValue_0.EricManNum,1 do
		BValue_0.EricMan[i] = DW_CreateObjEX("flag",104618,780082,i,1,0)
		SetPlot(BValue_0.EricMan[i],"dead","LuaS_104761_Dead",0)
	end

	BValue_0.QNPCData = {} --0�O�����L 1�O�����I 2�O���`�إX
	BValue_0.QNPCData[1] = {116698,1,"LuaS_DW_Crafting"}
	BValue_0.QNPCData[2] = {116589,2}
	BValue_0.QNPCData[3] = {116588,2}
	BValue_0.QNPCData[4] = {116702,1,"Lua_DW_Crouch"}
	BValue_0.QNPCData[5] = {116699,0}
	BValue_0.QNPCData[6] = {116592,2}
	BValue_0.QNPCData[7] = {116701,1}
	BValue_0.QNPCData[8] = {116701,1}
	BValue_0.QNPCData[9] = {116698,1}
	BValue_0.QNPCData[10] = {116699,1}
	BValue_0.QNPCData[11] = {116700,1}
	BValue_0.QNPCData[12] = {116702,1}
	BValue_0.QNPCData[13] = {116698,1}
	BValue_0.QNPCData[14] = {116772,1,"Lua_DW_Crouch"}

	local Data = {}
	Data = BValue_0.QNPCData --�аO�O����

	BValue_0.QuestNPC = {}
	for i=1,table.getn(Data),1 do
		BValue_0.QuestNPC[i] = DW_CreateObjEX("flag",Data[i][1],780088,i,1,0) --�ѷӸ�ƫإߥ���NPC
		Temp = BValue_0.QuestNPC[i]
		if	Data[i][2] == 0	then --�T���
			Lua_ObjDontTouch( Temp )
		elseif	Data[i][2] == 1	then --�����I��
			SetModeEx(Temp,EM_SetModeType_Mark,false) 
		end
		if	Data[i][3]~=nil	then --�����t�@��
			BeginPlot(Temp,Data[i][3],0)
		end
	end
	BValue_0.QNPCData = nil --����O����

--���ͥi�H�������Ǫ�
	if	BValue_0.QMonster == nil	then
		BValue_0.QMonster = {}
	end
	Temp = {} --�Ȯɦs�� ���ȭn�����Ǫ��� ���
	for i=1,GetMoveFlagCount(780089),1 do
		Temp[i] = DW_CreateObjEX("flag",104758,780089,i,1,0)
		SetModeEx(Temp[i],EM_SetModeType_Revive,true) 
		MoveToFlagEnabled(Temp[i], false)
		CallPlot(Temp[i],"DW_MobRandMove_outFight","flag",100,780089,i)
	end
	BValue_0.QMonster = Temp
 --����O����
	Temp = nil
	Data = nil
end

function LuaS_103120_Phase_Fixing.update(ThisObj)
--�P�_�O�_�����״_
	if	PE_GetActivePhaseIndex(1)~=0	then
		return PE_GetActivePhaseIndex(1)
	end
end

function LuaS_103120_Phase_Fixing.leave(ThisObj)
	local BValue_0 = FSM_GetState(ThisObj,0)
	for i=1,BValue_0.SanctionNum,1 do
		DW_CheckThenDel(BValue_0.Sanctions[i])--�R�����ץΪ������
	end
--���ܫ��A�G�^���m�ʧ@
	SetDefIdleMotion(ThisObj.MonID,ruFUSION_MIME_IDLE_STAND_02)
	PlayMotion(ThisObj.MonID,ruFUSION_ACTORSTATE_SLEEP_END)
--��^�ԳN���O
	AI_Order_103120 = 901
	SanctionMark = 0
	BValue_0 = nil
end
----------------------------------------------------------------
--���m���A(���i�J�԰�)
LuaS_103120_Phase_Fixed = {}
function LuaS_103120_Phase_Fixed.enter(ThisObj)
	WriteRoleValue(ThisObj.MonID,EM_RoleValue_HP,ReadRoleValue(ThisObj.MonID,EM_RoleValue_MaxHP))--�ɺ���
	ScriptMessage( ThisObj.MonID, -1, 2, "[SC_103120_CON_05000]", 0 )--�����a���T��
	ScriptMessage( ThisObj.MonID, -1, 0, "[SC_103120_CON_05001]", "0xFF98E0E7" )--�����a���T��

	AddBuff(ThisObj.MonID,507181,1,-1)--����Q�J��
	AddBuff(ThisObj.MonID,502707,1,-1)--�԰��~���^��

	local BValue_50 = FSM_GetState(ThisObj,50)
	BValue_50.EricTManNum = GetMoveFlagCount(780084)-1 -- �o�ê���O�J��s�� = �X�l��h�s���X
	BValue_50.EricTMan = {}
--�إXT��O�J��s��
	for i=1,BValue_50.EricTManNum,1 do
		local Eric = DW_CreateObjEX("flag",104618,780084,i,1,0)
		SetPlot(Eric,"dead","LuaS_104761_Dead",0)
		BValue_50.EricTMan[i] = Eric
		CallPlot(BValue_50.EricTMan[i],"LuaS_103120_EricTMan",ThisObj.MonID)
	end
	SetModeEx(ThisObj.MonID,EM_SetModeType_Fight,true) --�}�Ҿ԰�
end

function LuaS_103120_Phase_Fixed.update(ThisObj)
--���H�����N�i�J�U�Ӷ��q
	if	ReadRoleValue(ThisObj.MonID,EM_RoleValue_HP)<ReadRoleValue(ThisObj.MonID,EM_RoleValue_MaxHP)	then
		PE_SetVar("EricTouchAmount",100)
	end
--��O�J��s��Ĳ�o���Ȫ��ɭ�
	if	PE_GetActivePhaseIndex(1)~=50	then
		return PE_GetActivePhaseIndex(1)
	end
end

function LuaS_103120_Phase_Fixed.leave(ThisObj)
	AddBuff(ThisObj.MonID,507181,1,-1)--����Q�J��
	AddBuff(ThisObj.MonID,502707,1,-1)--�԰��~���^��
	ScriptMessage( ThisObj.MonID, -1, 0, "[SC_103120_CON_05002]", "0xFF98E0E7" )--�����a���T��
	ScriptMessage( ThisObj.MonID, -1, 2, "[SC_103120_CON_05003]", 0 )--��O�J���s���T��

	local BValue_0 = FSM_GetState(ThisObj,0)
	local BValue_50 = FSM_GetState(ThisObj,50)
	for i=1,BValue_50.EricTManNum,1 do
		SysCastSpellLv(BValue_50.EricTMan[i],BValue_50.EricTMan[i],495735,1)
		WriteRoleValue(BValue_50.EricTMan[i],EM_RoleValue_LiveTime,2)
	end
	for i=1,BValue_0.EricManNum,1 do
		SysCastSpellLv(BValue_0.EricMan[i],BValue_0.EricMan[i],495735,1)
		WriteRoleValue(BValue_0.EricMan[i],EM_RoleValue_LiveTime,2)
	end
--���Ͱ��K�ׯ෽����
	if	Boss_103120_EnergyStore ==nil	then
		Boss_103120_EnergyStore = {}
		Boss_103120_EnergyReSet = {}
	else
		LuaS_116726_AllClear(Boss_103120_EnergyStore)
	end
	Boss_103120_EnergyStore,Boss_103120_EnergyReSet = LuaS_116726_OutputControl(Boss_103120_EnergyStore, Boss_103120_EnergyReSet ,200,true)
--�D�����H���M��
	local Temp = BValue_0.QuestNPC --����
	for i=1,table.getn(Temp),1 do
		SysCastSpellLv(Temp[i],Temp[i],495735,1) --�ǰe�S��
		WriteRoleValue(Temp[i],EM_RoleValue_LiveTime,1) --�N���R��
	end
	BValue_0.QuestNPC = nil --����O����
	Temp = BValue_0.QMonster
	for i=1,table.getn(Temp),1 do
		DW_CheckThenDel(Temp[i])
	end
	BValue_0.QMonster = nil --����O����
	Temp = nil

	CallPlot(ThisObj.MonID,"LuaS_103120_LightCercle",ThisObj.MonID) --���˥���
end
----------------------------------------------------------------

--���qA
--�Ĥ@�B�G�üƨM�w���A
LuaS_103120_Phase_100 = {}
function LuaS_103120_Phase_100.enter(ThisObj)
end

function LuaS_103120_Phase_100.update(ThisObj)
	local RandToMode = DW_Rand(3)
--������3�ت��A�䤤1��
	return 100+RandToMode
end

function LuaS_103120_Phase_100.leave(ThisObj)

end
----------------------------------------------------------------
--���qB
--�Ĥ@�B�G�üƨM�w���A
LuaS_103120_Phase_200 = {}
function LuaS_103120_Phase_200.enter(ThisObj)
end

function LuaS_103120_Phase_200.update(ThisObj)
	local RandToMode = DW_Rand(3)
--������3�ت��A�䤤1��
	return 200+RandToMode
end

function LuaS_103120_Phase_200.leave(ThisObj)
	WriteRoleValue(ThisObj.MonID,EM_RoleValue_Register8,999)
end
----------------------------------------------------------------
--���qC
--�Ĥ@�B�G�üƨM�w���A
LuaS_103120_Phase_300 = {}
function LuaS_103120_Phase_300.enter(ThisObj)
	local BValue_0 = FSM_GetState(ThisObj,0)
	for i=1,table.getn(BValue_0.Equipment),1 do
		SetPlot(BValue_0.Equipment[i][1],"range","LuaS_116726_CancelBuff_02",40)--����^���෽
	end
end

function LuaS_103120_Phase_300.update(ThisObj)
	local RandToMode = DW_Rand(3)
--������3�ت��A�䤤1��
	return 300+RandToMode
end

function LuaS_103120_Phase_300.leave(ThisObj)

end
----------------------------------------------------------------
--���qD
--�Ĥ@�B�G�üƨM�w���A
LuaS_103120_Phase_400 = {}
function LuaS_103120_Phase_400.enter(ThisObj)
end

function LuaS_103120_Phase_400.update(ThisObj)
	local RandToMode = DW_Rand(3)
--������3�ت��A�䤤1��
	return 400+RandToMode
end

function LuaS_103120_Phase_400.leave(ThisObj)

end
----------------------------------------------------------------
--���qE
--����L��
LuaS_103120_Phase_500 = {}

function LuaS_103120_Phase_500.enter(ThisObj)
	ScriptMessage( ThisObj.MonID, -1, 0, "[SC_103120_CON_50000]", 0 )--�����a���T��
	ScriptMessage( ThisObj.MonID, -1, 0, "[SC_103120_CON_50001]", C_Red )--�����a���T��
	if	HPpercent_103120>74	then
		AddBuff(ThisObj.MonID,507407,0,-1)
	else
		AddBuff(ThisObj.MonID,507407,1,-1)
	end
	AI_Order_103120 = 901 --�״_�Ҧ�
	SetDefIdleMotion(ThisObj.MonID,ruFUSION_MIME_SLEEP_LOOP)
	PlayMotion(ThisObj.MonID,ruFUSION_ACTORSTATE_SLEEP_BEGIN)
end

function LuaS_103120_Phase_500.update(ThisObj)
--�ˬd��e���q
	local PEindex = PE_GetActivePhaseIndex(1)
	if	PEindex ~=500	then
		return	PEindex
	end
	LuaS_103120_SanctionHandle() --����̱���
--�෽�������ͱ���
	Boss_103120_EnergyStore,Boss_103120_EnergyReSet = LuaS_116726_OutputControl(Boss_103120_EnergyStore, Boss_103120_EnergyReSet ,200,false)
end

function LuaS_103120_Phase_500.leave(ThisObj)
	SetDefIdleMotion(ThisObj.MonID,ruFUSION_MIME_IDLE_STAND_02)
	PlayMotion(ThisObj.MonID,ruFUSION_ACTORSTATE_SLEEP_END)

	CancelBuff(ThisObj.MonID,507407)
end

-------------------------------------------------------------
function LuaS_103120_TouchWillDie()
	local Target = TargetID()
	local Owner = OwnerID()
	if	CheckDistance(Owner,Target, 115)	and
		ReadRoleValue(Target,EM_RoleValue_IsPlayer)==1	and
		ReadRoleValue(Target,EM_RoleValue_IsDead)==0	and
		ReadRoleValue(Owner,EM_RoleValue_Register8)==999	then
DeBugMSG(0,0,"You Got Killed!!")
		KillID(Target,Target)--�۱�
	end
end

--------------------------------------------------------------------------
function LuaS_103120_ForceTouch()
--�S��buff�����a�N�O���}�O�����;�
	if	CheckBuff(OwnerID(),507775)==false	then
--��i�Ӫ��H���L����@��
		AddBuff(OwnerID(),507775,1,3)
		CallPlot(OwnerID(),"LuaS_103120_ForceTouch_Execute",TargetID())
	end
end

function LuaS_103120_ForceTouch_Execute(Maker)
	while	true	do
		sleep(10)
--�p�G�O�����;����� ���X �Ѱ�buff
		if	CheckID(Maker)==false	then
			CancelBuff(OwnerID(),507775)
			break
		end
--�p�G���O�����;��ӻ� ���X �Ѱ�buff
--�b�d�򤺴N����Wbuff
		if	CheckDistance(OwnerID(),Maker, 35)	then
			AddBuff(OwnerID(),507775,1,3)
		else
			CancelBuff(OwnerID(),507775)
			break
		end
	end
end