
---------------------------------�԰����q���A
LuaS_103120_Phase_101 = {}
--���qA
--���A1�G�w�f�纸�}�Ҩ��m�O��
function LuaS_103120_Phase_101.enter(ThisObj)
	MoveToFlagEnabled(ThisObj.MonID, false)
--���ܫ��A
	SetDefIdleMotion(ThisObj.MonID,ruFUSION_MIME_SLEEP_LOOP)
	PlayMotion(ThisObj.MonID,ruFUSION_ACTORSTATE_SLEEP_BEGIN)
--�I�k�X���Ӫ񪺪��a
	local BValue_101 = FSM_GetState(ThisObj,101)
	BValue_101.Disperser = DW_CreateObjEX( "obj",104778,ThisObj.MonID,1, 0)--�ϥΨ����48���ȥN����
	DW_UnFight(BValue_101.Disperser)
	Lua_ObjDontTouch( BValue_101.Disperser )
	SysCastSpellLv(BValue_101.Disperser,BValue_101.Disperser,496277,1)
--�ԳN�վ�
	AI_Order_103120 = 995--�״_�Ҧ�
	ScriptMessage( ThisObj.MonID, -1, 0, "[SC_103120_CON_10100]", 0 )
end

function LuaS_103120_Phase_101.update(ThisObj)
	local BValue_101 = FSM_GetState(ThisObj,101)
--(�ƭȲ�)
	if	BValue_101.Lv496278==nil	then
		BValue_101.Lv496278 = 0--���h���[�ˮ`����ҡG496278
	end
	if	ReadRoleValue(BValue_101.Disperser,EM_RoleValue_SpellMagicID)==0	then
		SysCastSpellLv(BValue_101.Disperser,BValue_101.Disperser,496278,BValue_101.Lv496278)
	end
--�ˬd��e���q
	local PEindex = PE_GetActivePhaseIndex(1)
	if	PEindex ~=100	then
		return	PEindex
	end
	LuaS_103120_SanctionHandle() --����̱���
--�෽�������ͱ���
	Boss_103120_EnergyStore,Boss_103120_EnergyReSet = LuaS_116726_OutputControl(Boss_103120_EnergyStore, Boss_103120_EnergyReSet ,200,false)
--����O����
	BValue_101 = nil
	BValue_0 = nil
	PEindex = nil
end

function LuaS_103120_Phase_101.leave(ThisObj)
	MoveToFlagEnabled(ThisObj.MonID, false)
--�������@�O��
	local BValue_101 = FSM_GetState(ThisObj,101)
	DW_CheckThenDel(BValue_101.Disperser)
	BValue_101.Disperser = nil
	SetDefIdleMotion(ThisObj.MonID,ruFUSION_MIME_IDLE_STAND_02)
	PlayMotion(ThisObj.MonID,ruFUSION_ACTORSTATE_SLEEP_END)
end
----------------------------------------------------------------
LuaS_103120_Phase_102 = {}
--���qA
--���A2�G����̱Ķ��귽�W��
function LuaS_103120_Phase_102.enter(ThisObj)
	MoveToFlagEnabled(ThisObj.MonID, false)
--�ԳN�վ�
	AI_Order_103120 = 901--�Ķ��Ҧ�
--�վ�ԳN
	SanctionMark = 1--�Ķ��[�t�аO
--���ܤ��O��X�Ҧ�
	Boss_103120_FireTargetArray = LuaS_103120_TargetBuild(3,ThisObj.MonID)
	ScriptMessage( ThisObj.MonID, -1, 0, "[SC_103120_CON_10200]", 0 )
	ScriptMessage( ThisObj.MonID, -1, 0, "[SC_103120_CON_10201]", C_Red )
end

function LuaS_103120_Phase_102.update(ThisObj)
--�ˬd��e���q
	local PEindex = PE_GetActivePhaseIndex(1)
	if	PEindex ~=100	then
		return	PEindex
	end
	LuaS_103120_SanctionHandle() --����̱���
--���O�禡
	LuaS_103120_MuzzleBuild(Boss_103120_FireTargetArray,0,ThisObj.MonID)
--�෽�������ͱ���
	Boss_103120_EnergyStore,Boss_103120_EnergyReSet = LuaS_116726_OutputControl(Boss_103120_EnergyStore, Boss_103120_EnergyReSet ,200,false)

--����O����
	BValue_0 = nil
	PEindex = nil
end

function LuaS_103120_Phase_102.leave(ThisObj)
	LuaS_103120_AidBuild_2(Boss_103120_FireTargetArray)
	Boss_103120_FireTargetArray = {}
	MoveToFlagEnabled(ThisObj.MonID, false)
--�վ�ԳN
	SanctionMark = 0
end
----------------------------------------------------------------
LuaS_103120_Phase_103 = {}
--���qA
--���A3�G����̨g�ɧ����J�I��
function LuaS_103120_Phase_103.enter(ThisObj)
	MoveToFlagEnabled(ThisObj.MonID, false)
--�ԳN�վ�
	AI_Order_103120 = 902--�����Ҧ�
--�վ�ԳN
	SanctionMark = 2--�����[�j�аO
--���ܤ��O��X�Ҧ�
	Boss_103120_FireTargetArray = LuaS_103120_TargetBuild(3,ThisObj.MonID)
	ScriptMessage( ThisObj.MonID, -1, 0, "[SC_103120_CON_10300]", 0 )
end

function LuaS_103120_Phase_103.update(ThisObj)
--�ˬd��e���q
	local PEindex = PE_GetActivePhaseIndex(1)
	if	PEindex ~=100	then
		return	PEindex
	end
	LuaS_103120_SanctionHandle() --����̱���
--���O�禡

	LuaS_103120_MuzzleBuild(Boss_103120_FireTargetArray,0,ThisObj.MonID)
--�෽�������ͱ���
	Boss_103120_EnergyStore,Boss_103120_EnergyReSet = LuaS_116726_OutputControl(Boss_103120_EnergyStore, Boss_103120_EnergyReSet ,200,false)

--����O����
	BValue_0 = nil
	PEindex = nil
end

function LuaS_103120_Phase_103.leave(ThisObj)
	LuaS_103120_AidBuild_2(Boss_103120_FireTargetArray)
	Boss_103120_FireTargetArray = {}
	MoveToFlagEnabled(ThisObj.MonID, false)
--�վ�ԳN
	SanctionMark = 0
end
----------------------------------------------------------------
LuaS_103120_Phase_201 = {}
--���qB
--���A1�G�w�f�纸�ɪťH�̱j���O�����a��
function LuaS_103120_Phase_201.enter(ThisObj)
	MoveToFlagEnabled(ThisObj.MonID, false)
--�ԳN�վ�
	AI_Order_103120 = 902--�����Ҧ�
--�V�W����
	SetModeEx(ThisObj.MonID,EM_SetModeType_Gravity,false) 
	local x,y,z
	x = ReadRoleValue(ThisObj.MonID,EM_RoleValue_X)
	y = ReadRoleValue(ThisObj.MonID,EM_RoleValue_Y)
	z = ReadRoleValue(ThisObj.MonID,EM_RoleValue_Z)
	StopMove(ThisObj.MonID,false)
	MoveDirect( ThisObj.MonID, x , 200 , z )
--���ܤ��O��X�Ҧ�
	Boss_103120_FireTargetArray = LuaS_103120_TargetBuild(3,ThisObj.MonID)
--���ܫ��A
	SetDefIdleMotion(ThisObj.MonID,ruFUSION_MIME_CROUCH_LOOP)
	PlayMotion(ThisObj.MonID,ruFUSION_ACTORSTATE_CROUCH_BEGIN)
	ScriptMessage( ThisObj.MonID, -1, 0, "[SC_103120_CON_20100]", 0 )--�����a���T��
end

function LuaS_103120_Phase_201.update(ThisObj)
--�ˬd��e���q
	local PEindex = PE_GetActivePhaseIndex(1)
	if	PEindex ~=200	then
		return	PEindex
	end
	LuaS_103120_SanctionHandle() --����̱���
--���O�禡
	LuaS_103120_MuzzleBuild(Boss_103120_FireTargetArray,1,ThisObj.MonID)
--�෽�������ͱ���
	Boss_103120_EnergyStore,Boss_103120_EnergyReSet = LuaS_116726_OutputControl(Boss_103120_EnergyStore, Boss_103120_EnergyReSet ,200,false)

--����O����
	BValue_0 = nil
	PEindex = nil
end

function LuaS_103120_Phase_201.leave(ThisObj)
	LuaS_103120_AidBuild_2(Boss_103120_FireTargetArray)
	Boss_103120_FireTargetArray = {}
	local x,y,z
	x=ReadRoleValue(ThisObj.MonID,EM_RoleValue_X)
	y=ReadRoleValue(ThisObj.MonID,EM_RoleValue_Y)
	z=ReadRoleValue(ThisObj.MonID,EM_RoleValue_Z)
	SetModeEx(ThisObj.MonID,EM_SetModeType_Obstruct,false) 
--�V�U����
	StopMove(ThisObj.MonID,false)
	MoveDirect( ThisObj.MonID, x , GetHeight( x , y , z ) , z )
	sleep(25)
	SysCastSpellLv(ThisObj.MonID,ThisObj.MonID,496279,20)
--���ܫ��A�G�^���m�ʧ@
	SetDefIdleMotion(ThisObj.MonID,ruFUSION_MIME_IDLE_STAND_02)
	PlayMotion(ThisObj.MonID,ruFUSION_ACTORSTATE_CROUCH_END)
	sleep(15)
	SetModeEx(ThisObj.MonID,EM_SetModeType_Obstruct,true) 
	WriteRoleValue(ThisObj.MonID,EM_RoleValue_Register8,0)
end
----------------------------------------------------------------
LuaS_103120_Phase_202 = {}
--���qB
--���A2�G�w�f�纸�ɪůd�U�෽�l�� ����H���O����
function LuaS_103120_Phase_202.enter(ThisObj)
--�ԳN�վ�
	AI_Order_103120 = 902--�����Ҧ� �෽�ѯ෽�l���˸m�ɥR�w����
--���ͯ෽�l���˸m
	local BValue_202 = FSM_GetState(ThisObj,202)
	BValue_202.TakeEnergy = DW_CreateObjEX("obj",104761,ThisObj.MonID,1,0)
	SetPlot(BValue_202.TakeEnergy,"dead","LuaS_104761_Dead",0)--�ä����`
	SetModeEx(BValue_202.TakeEnergy,EM_SetModeType_Strikback,false) 
	AddBuff(BValue_202.TakeEnergy,507771,1,-1)
--�V�W����
	SetModeEx(ThisObj.MonID,EM_SetModeType_Gravity,false) 
	local x,y,z
	x = ReadRoleValue(ThisObj.MonID,EM_RoleValue_X)
	y = ReadRoleValue(ThisObj.MonID,EM_RoleValue_Y)
	z = ReadRoleValue(ThisObj.MonID,EM_RoleValue_Z)
--���ܫ��A
	SetDefIdleMotion(ThisObj.MonID,ruFUSION_MIME_CROUCH_LOOP)
	PlayMotion(ThisObj.MonID,ruFUSION_ACTORSTATE_CROUCH_BEGIN)

	StopMove(ThisObj.MonID,false)
	MoveDirect( ThisObj.MonID, x , 200 , z )
--���ܤ��O��X�Ҧ�
	Boss_103120_FireTargetArray = LuaS_103120_TargetBuild(3,ThisObj.MonID)
	ScriptMessage( ThisObj.MonID, -1, 0, "[SC_103120_CON_20200]", 0 )--�����a���T��
	ScriptMessage( ThisObj.MonID, -1, 0, "[SC_103120_CON_20201]", C_Red )--�����a���T��
	sleep(20)
--�෽�l���˸m�Ұ�:�n��mine
	BValue_202.Type = "Work"
	SetDefIdleMotion(BValue_202.TakeEnergy,ruFUSION_MIME_CROUCH_LOOP)
	PlayMotion(BValue_202.TakeEnergy,ruFUSION_ACTORSTATE_CROUCH_BEGIN)

end

function LuaS_103120_Phase_202.update(ThisObj)
--�ˬd��e���q
	local PEindex = PE_GetActivePhaseIndex(1)
	if	PEindex ~=200	then
		return	PEindex
	end
	LuaS_103120_SanctionHandle() --����̱���
--���O�禡
	LuaS_103120_MuzzleBuild(Boss_103120_FireTargetArray,0,ThisObj.MonID)
--�෽�l���˸m�B�@
	local BValue_202 = FSM_GetState(ThisObj,202)
	local Zmark = BValue_202.TakeEnergy
	local MaxHP = ReadRoleValue(Zmark,EM_RoleValue_MaxHP)
	local HP = ReadRoleValue(Zmark,EM_RoleValue_HP)
	if	HP/MaxHP > 0.7		and --�娬��
		BValue_202.Type == "Stop"	then -- ���Ұ�
		SetDefIdleMotion(Zmark,ruFUSION_MIME_CROUCH_LOOP)
		PlayMotion(Zmark,ruFUSION_ACTORSTATE_CROUCH_BEGIN)

		BValue_202.Type = "Work"  --�Ұʰ�!!
		AddBuff(Zmark,507771,1,-1)--���ͯS��
	elseif	HP/MaxHP < 0.2		and--�夣��
		BValue_202.Type == "Work"	then-- �w�Ұ�
		CancelBuff(Zmark,507771)--�����S��
		SetDefIdleMotion(Zmark,ruFUSION_MIME_IDLE_STAND)
		PlayMotion(Zmark,ruFUSION_ACTORSTATE_CROUCH_END)

		BValue_202.Type = "Stop" --����
--�w�w�^��
	elseif	HP/MaxHP <= 0.7		and -- �夣��
		BValue_202.Type == "Stop"	then -- ���Ұ�
		SysCastSpellLv(Zmark,Zmark,496284,999)--����̭״_(��M�S������̦b��)
	else
--�}�l�l���෽
		PE_AddVar("PastTime",-2000)
	end
--���I�෽��í�w����=>�d�����!!
--�෽�������ͱ���
	Boss_103120_EnergyStore,Boss_103120_EnergyReSet = LuaS_116726_OutputControl(Boss_103120_EnergyStore, Boss_103120_EnergyReSet ,200,false)

--����O����
	PEindex = nil
	BValue_202 = nil
	Zmark = nil
	HP = nil
	MaxHP = nil
end

function LuaS_103120_Phase_202.leave(ThisObj)
	LuaS_103120_AidBuild_2(Boss_103120_FireTargetArray)
	Boss_103120_FireTargetArray = {}

	MoveToFlagEnabled(ThisObj.MonID, false)
	local BValue_202 = FSM_GetState(ThisObj,202)
	if	BValue_202.Type == "Work"	then
		local Zmark = BValue_202.TakeEnergy
		SetDefIdleMotion(Zmark,ruFUSION_MIME_IDLE_STAND)
		PlayMotion(Zmark,ruFUSION_ACTORSTATE_CROUCH_END)

		BValue_202.Type = "Stop"
	end
--�V�U����
	local x,y,z
	x = ReadRoleValue(ThisObj.MonID,EM_RoleValue_X)
	y = ReadRoleValue(ThisObj.MonID,EM_RoleValue_Y)
	z = ReadRoleValue(ThisObj.MonID,EM_RoleValue_Z)
	StopMove(ThisObj.MonID,false)
	MoveDirect( ThisObj.MonID, x , GetHeight( x , y , z ) , z )
	SetModeEx(ThisObj.MonID,EM_SetModeType_Obstruct,false) 
	sleep(20)
--���ܫ��A�G�^���m�ʧ@
	SetDefIdleMotion(ThisObj.MonID,ruFUSION_MIME_IDLE_STAND_02)
	PlayMotion(ThisObj.MonID,ruFUSION_ACTORSTATE_CROUCH_END)


	SysCastSpellLv(ThisObj.MonID,ThisObj.MonID,496279,20)--���a���j�d��k�N
	sleep(15)
--�R���෽�l����
	DW_CheckThenDel(BValue_202.TakeEnergy)
	SetModeEx(ThisObj.MonID,EM_SetModeType_Obstruct,true) 

--����O����
	BValue_202 = nil
	Zmark = nil
	WriteRoleValue(ThisObj.MonID,EM_RoleValue_Register8,0)
end
----------------------------------------------------------------
LuaS_103120_Phase_203 = {}
--���qB
--���A3�G�w�f�纸�ɪŸ��U�W�c�ʧ@�չ������_�I��
function LuaS_103120_Phase_203.enter(ThisObj)
	MoveToFlagEnabled(ThisObj.MonID, false)
--�ԳN�վ�
	AI_Order_103120 = 902--�����Ҧ�  ���a�n����  ����̰t�X���y
	local BValue_203 = FSM_GetState(ThisObj,203)
	BValue_203.BossType = 0

--���ܫ��A
	SetDefIdleMotion(ThisObj.MonID,ruFUSION_MIME_CROUCH_LOOP)
	PlayMotion(ThisObj.MonID,ruFUSION_ACTORSTATE_CROUCH_BEGIN)


	ScriptMessage( ThisObj.MonID, -1, 0, "[SC_103120_CON_20300]", 0 )--�����a���T��
	ScriptMessage( ThisObj.MonID, -1, 0, "[SC_103120_CON_20301]", C_Red )--�����a���T��
end

function LuaS_103120_Phase_203.update(ThisObj)
	local BValue_203 = FSM_GetState(ThisObj,203)
--�ˬd��e���q
	local PEindex = PE_GetActivePhaseIndex(1)
	if	PEindex ~=200		and
		BValue_203.BossType==1	then
		return	PEindex
	end
	LuaS_103120_SanctionHandle() --����̱���
--��������Ť����A�άO�a�����A
	if	ReadRoleValue(ThisObj.MonID,EM_RoleValue_SpellMagicID)==0	then
		if	BValue_203.BossType == 0	then
--�ɪ�
--�V�W����
			SetModeEx(ThisObj.MonID,EM_SetModeType_Gravity,false) 
			local x,y,z
			x = ReadRoleValue(ThisObj.MonID,EM_RoleValue_X)
			y = ReadRoleValue(ThisObj.MonID,EM_RoleValue_Y)
			z = ReadRoleValue(ThisObj.MonID,EM_RoleValue_Z)
			StopMove(ThisObj.MonID,false)
			MoveDirect( ThisObj.MonID, x , 200 , z )
--���ܤ��O��X�Ҧ�
			sleep(20)
			BValue_203.BossType = 1
		elseif	BValue_203.BossType==1	then
			if	ReadRoleValue(ThisObj.MonID,EM_RoleValue_Y)>175	then
--�ǳƶǰe
				CastSpell(ThisObj.MonID,ThisObj.MonID,496283)
				BValue_203.BossType = 2
			end
		elseif	BValue_203.BossType == 2	then
			Boss_103120_FireTargetArray = LuaS_103120_TargetBuild(3,ThisObj.MonID)
			for i=1,3,1 do
				LuaS_103120_MuzzleBuild(Boss_103120_FireTargetArray,0,ThisObj.MonID)
				sleep(5)
			end
			LuaS_103120_AidBuild_2(Boss_103120_FireTargetArray)
			local x,y,z
--�ˬd�O�_�ǰe����
			if	ReadRoleValue(ThisObj.MonID,EM_RoleValue_SpellMagicID)==0	then
--�D��
				AddBuff(ThisObj.MonID,507914,1,2)
				local PlayerA = SearchRangePlayer ( ThisObj.MonID , 300 )
				local PlayerChoose
				if	table.getn(PlayerA)>3		and
					DW_CheckDis(ThisObj.MonID,780081,1,200)	then

					PlayerChoose = PlayerA[DW_Rand(table.getn(PlayerA))-1]
					x=ReadRoleValue(PlayerChoose,EM_RoleValue_X)
					y=200
					z=ReadRoleValue(PlayerChoose,EM_RoleValue_Z)
				else
					x=GetMoveFlagValue(780081,1,EM_RoleValue_X)-150+DW_Rand(300)
					y=200
					z=GetMoveFlagValue(780081,1,EM_RoleValue_Z)-150+DW_Rand(300)
				end
				SetPos( ThisObj.MonID, x, y, z , ReadRoleValue(ThisObj.MonID,EM_RoleValue_Dir))
				while	CheckBuff(ThisObj.MonID,507914)==true	do
					sleep(2)
				end
				SetDefIdleMotion(ThisObj.MonID,ruFUSION_MIME_CROUCH_LOOP)
				BValue_203.BossType=3
--���a���
				local x,y,z
				x = ReadRoleValue(ThisObj.MonID,EM_RoleValue_X)
				y = ReadRoleValue(ThisObj.MonID,EM_RoleValue_Y)
				z = ReadRoleValue(ThisObj.MonID,EM_RoleValue_Z)
				StopMove(ThisObj.MonID,false)
				MoveDirect( ThisObj.MonID, x , GetHeight( x , y , z ) , z )--�V�U����
			end
		elseif	BValue_203.BossType==3	then
			SetModeEx(ThisObj.MonID,EM_SetModeType_Obstruct,false) 
--�P�_�O�_��F�a��
			if	ReadRoleValue(ThisObj.MonID,EM_RoleValue_Y)<50	then
--���O�禡
				Boss_103120_FireTargetArray = LuaS_103120_TargetBuild(3,ThisObj.MonID)
				BValue_203.BossType=0--�аO�����aing
				SysCastSpellLv(ThisObj.MonID,ThisObj.MonID,496279,1)--���a���j�d��k�N
				for i=1,6,1 do
					sleep(5)
					LuaS_103120_MuzzleBuild(Boss_103120_FireTargetArray,0,ThisObj.MonID)
					LuaS_103120_SanctionHandle() --����̱���
				end
				LuaS_103120_AidBuild_2(Boss_103120_FireTargetArray)
				SetModeEx(ThisObj.MonID,EM_SetModeType_Obstruct,true) 
			end
		end
	end
--�෽�������ͱ���
	Boss_103120_EnergyStore,Boss_103120_EnergyReSet = LuaS_116726_OutputControl(Boss_103120_EnergyStore, Boss_103120_EnergyReSet ,200,false)

--����O����
	BValue_50 = nil
	PEindex = nil
	BValue_203 = nil
	PlayerA = nil
end

function LuaS_103120_Phase_203.leave(ThisObj)
	MoveToFlagEnabled(ThisObj.MonID, false)
--�������
	StopMove(ThisObj.MonID,false)
	local x,y,z
	local BValue_203 = FSM_GetState(ThisObj,203)
	if	BValue_203.BossType >0	then
--�ǳ��D�Ǧ^��l��m
		CastSpell(ThisObj.MonID,ThisObj.MonID,496283)
		sleep(5)
		while	ReadRoleValue(ThisObj.MonID,EM_RoleValue_SpellMagicID)~=0	do
			sleep(5)
		end
		x=GetMoveFlagValue(780081,0,EM_RoleValue_X)
		y=200
		z=GetMoveFlagValue(780081,0,EM_RoleValue_Z)
		AddBuff(ThisObj.MonID,507914,1,2)
		SetPos( ThisObj.MonID, x, y, z , ReadRoleValue(ThisObj.MonID,EM_RoleValue_Dir))
		SetDefIdleMotion(ThisObj.MonID,ruFUSION_MIME_CROUCH_LOOP)
		while	CheckBuff(ThisObj.MonID,507914)==true	do
			sleep(2)
		end
		SetDefIdleMotion(ThisObj.MonID,ruFUSION_MIME_CROUCH_LOOP)
		StopMove(ThisObj.MonID,false)
--�V�U����
		MoveDirect( ThisObj.MonID, x , GetHeight( x , y , z ) , z )
		SetModeEx(ThisObj.MonID,EM_SetModeType_Obstruct,false) 
		sleep(20)
	end

	LuaS_103120_AidBuild_2(Boss_103120_FireTargetArray)
	Boss_103120_FireTargetArray = {}

--���ܫ��A�G�^���m�ʧ@
	SetDefIdleMotion(ThisObj.MonID,ruFUSION_MIME_IDLE_STAND_02)
	PlayMotion(ThisObj.MonID,ruFUSION_ACTORSTATE_CROUCH_END)


	SysCastSpellLv(ThisObj.MonID,ThisObj.MonID,496279,20)--���a���j�d��k�N
	sleep(15)
	SetModeEx(ThisObj.MonID,EM_SetModeType_Obstruct,true) 

--����O����
	BValue_203 = nil
	WriteRoleValue(ThisObj.MonID,EM_RoleValue_Register8,0)
end

----------------------------------------------------------------
LuaS_103120_Phase_301 = {}
--���qC
--���A1�G�٪��Ұꪺ�ջ����W�Ҧ��H�i��L�t�O����(���w)
function LuaS_103120_Phase_301.enter(ThisObj)
	ScriptMessage( ThisObj.MonID, -1, 0, "[SC_103120_CON_30100]", 0 )--�����a���T��
	ScriptMessage( ThisObj.MonID, -1, 0, "[SC_103120_CON_30101]", C_Red )--�����a���T��
	MoveToFlagEnabled(ThisObj.MonID, false)
--�ջ�ŧi
	local State={}
	State["Execute"]=LuaS_103120_Ghost_Controler;
	State["Over"]=LuaS_103120_Ghost_Dispear
	local Anball = OwnerID()
	local BValue_301 = FSM_GetState(ThisObj,301)
	BValue_301.TeBall = FSM_Initial(Anball,State);
	FSM_DoTransion(BValue_301.TeBall,"Execute")--�qExecute�}�l����
--�ԳN�վ�
	AI_Order_103120 = 995--�״_�Ҧ�
--���ܤ��O��X�Ҧ�
	Boss_103120_FireTargetArray = LuaS_103120_TargetBuild(3,ThisObj.MonID)
--����O����
	State = nil
	Anball = nil
end

function LuaS_103120_Phase_301.update(ThisObj)
--�ˬd��e���q
	local PEindex = PE_GetActivePhaseIndex(1)
	if	PEindex ~=300	then
		return	PEindex
	end
	LuaS_103120_SanctionHandle() --����̱���
	local BValue_301 = FSM_GetState(ThisObj,301)
	FSM_Update(BValue_301.TeBall)
--���O�禡
	LuaS_103120_MuzzleBuild(Boss_103120_FireTargetArray,0,ThisObj.MonID)
--�෽�������ͱ���
	Boss_103120_EnergyStore,Boss_103120_EnergyReSet = LuaS_116726_OutputControl(Boss_103120_EnergyStore, Boss_103120_EnergyReSet ,200,false)

--����O����
	BValue_50 = nil
	PEindex = nil
	BValue_301 = nil
end

function LuaS_103120_Phase_301.leave(ThisObj)
	MoveToFlagEnabled(ThisObj.MonID, false)
	local BValue_301 = FSM_GetState(ThisObj,301)
	FSM_DoTransion(BValue_301.TeBall,"Over")
	local BValue_0 = FSM_GetState(ThisObj,0)
	for i=1,table.getn(BValue_0.Equipment),1 do
		SetPlot(BValue_0.Equipment[i][1],"range","LuaS_116726_CancelBuff_01",40)--�^���෽
	end

	LuaS_103120_AidBuild_2(Boss_103120_FireTargetArray)
	Boss_103120_FireTargetArray = {}
end
----------------------------------------------------------------
LuaS_103120_Phase_302 = {}
--���qC
--���A2�G�٪��Ұꪺ���ó]�ƥi�H�Ұ�(�}��)
function LuaS_103120_Phase_302.enter(ThisObj)
	MoveToFlagEnabled(ThisObj.MonID, false)
--�ԳN�վ�
	AI_Order_103120 = 901--�Ķ��Ҧ�
--���ܤ��O��X�Ҧ�
	Boss_103120_FireTargetArray = LuaS_103120_TargetBuild(3,ThisObj.MonID)
--�}�ҫҰ��������
	local BValue_0 = FSM_GetState(ThisObj,0)
	ScriptMessage( ThisObj.MonID, -1, 0, "[SC_103120_CON_30200]", 0 )--�����a���T��
end

function LuaS_103120_Phase_302.update(ThisObj)
--�ˬd��e���q
	local PEindex = PE_GetActivePhaseIndex(1)
	if	PEindex ~=300	then
		return	PEindex
	end
	local OldMachine
	local BValue_0 = FSM_GetState(ThisObj,0)
	for i=1,BValue_0.EquipmentNum,1 do
		OldMachine = BValue_0.Equipment[i][1]
		if	DW_CheckUse(OldMachine,496389)==0	then --�T�{�X�եd�Ť崲�g�i�H�ϥ�
			if	DW_Rand(999)%3==0	then --���@�w�|��
				CastSpellLv(OldMachine,OldMachine,496389,0) --�ƭȲ�  --�I�k
			end
		else
			if	ReadRoleValue(OldMachine,EM_RoleValue_PID)~=0	and
				ReadRoleValue(OldMachine,EM_RoleValue_SpellMagicID)==0	then
				CastSpell(OldMachine,ReadRoleValue(OldMachine,EM_RoleValue_PID),496286)
			end
		end
	end

	LuaS_103120_SanctionHandle() --����̱���
--���O�禡
	LuaS_103120_MuzzleBuild(Boss_103120_FireTargetArray,0,ThisObj.MonID)
--�෽�������ͱ���
	Boss_103120_EnergyStore,Boss_103120_EnergyReSet = LuaS_116726_OutputControl(Boss_103120_EnergyStore, Boss_103120_EnergyReSet ,200,false)

--����O����
	BValue_0 = nil
	PEindex = nil
	OldMachine = nil
end

function LuaS_103120_Phase_302.leave(ThisObj)
	MoveToFlagEnabled(ThisObj.MonID, false)
--�����Ұ��������
	local BValue_0 = FSM_GetState(ThisObj,0)
	for i=1,table.getn(BValue_0.Equipment),1 do
		SetPlot(BValue_0.Equipment[i][1],"range","LuaS_116726_CancelBuff_01",40)--�^���෽
		AddBuff(BValue_0.Equipment[i][1],504113,3,3) --�W����԰���buff
	end
--����O����
	BValue_0 = nil

	LuaS_103120_AidBuild_2(Boss_103120_FireTargetArray)
	Boss_103120_FireTargetArray = {}
end
----------------------------------------------------------------
LuaS_103120_Phase_303 = {}
--���qC
-- ���A3�G�٪��Ұꪺ�³]�ƿ��ö}�l���ͤ��P���d��O��(���w)
function LuaS_103120_Phase_303.enter(ThisObj)
	MoveToFlagEnabled(ThisObj.MonID, false)
--�ԳN�վ�
	AI_Order_103120 = 901--�Ķ��Ҧ�

	local BValue_0 = FSM_GetState(ThisObj,0)
	if	Boss_103120_PH303_Time==nil	then
		Boss_103120_PH303_Time = 15
		BValue_0.TempSpell = {}

		Boss_103120_PH303_BuffArray = {}
		Boss_103120_PH303_BuffArray[1] = 507776
		Boss_103120_PH303_BuffArray[2] = 507777
		Boss_103120_PH303_BuffArray[3] = 507778
		Boss_103120_PH303_BuffArray[4] = 507875


		Boss_103120_PH303_Spell = {}
		Boss_103120_PH303_Spell[1] = 496371
		Boss_103120_PH303_Spell[2] = 496372
		Boss_103120_PH303_Spell[3] = 496373
		Boss_103120_PH303_Spell[4] = 496374


		Boss_103120_PH303_FX = {}
		Boss_103120_PH303_FX[1] = 507884--��
		Boss_103120_PH303_FX[2] = 507883--��
		Boss_103120_PH303_FX[3] = 507924--��
		Boss_103120_PH303_FX[4] = 507925--��
	else
		Boss_103120_PH303_Time = 15
	end
--���ܤ��O��X�Ҧ�
	Boss_103120_FireTargetArray = LuaS_103120_TargetBuild(3,ThisObj.MonID)


	ScriptMessage( ThisObj.MonID, -1, 0, "[SC_103120_CON_30300]", 0 )--�����a���T��
	ScriptMessage( ThisObj.MonID, -1, 0, "[SC_103120_CON_30301]", C_Red )--�����a���T��
end

function LuaS_103120_Phase_303.update(ThisObj)
	local BValue_0 = FSM_GetState(ThisObj,0)

--�ˬd��e���q
	local PEindex = PE_GetActivePhaseIndex(1)
	if	PEindex ~=300	then
		return	PEindex
	end
	LuaS_103120_SanctionHandle() --����̱���
--�����O��:�j���j
	local RandSpell
	if	Boss_103120_PH303_Time >= 12	then
		Boss_103120_PH303_Time = 0--�p���k�s
		for i=1,table.getn(BValue_0.Equipment),1 do
			for k=1,table.getn(Boss_103120_PH303_Spell),1 do
				CancelBuff(BValue_0.Equipment[i][1],Boss_103120_PH303_FX[k])
			end
			RandSpell = DW_Rand(table.getn(Boss_103120_PH303_Spell))
			BValue_0.TempSpell[i] = Boss_103120_PH303_Spell[RandSpell]
			AddBuff(BValue_0.Equipment[i][1],Boss_103120_PH303_FX[RandSpell],1,-1)
		end
	else
		Boss_103120_PH303_Time = Boss_103120_PH303_Time + 1
		if	Boss_103120_PH303_Time%3==0	then--�w�ɸɥR�k�N
			for i=1,BValue_0.EquipmentNum,1 do
				SysCastSpellLv(BValue_0.Equipment[i][1],BValue_0.Equipment[i][1],BValue_0.TempSpell[i],1)
			end
		end
	end
--���O�禡
	LuaS_103120_MuzzleBuild(Boss_103120_FireTargetArray,0,ThisObj.MonID)
--�෽�������ͱ���
	Boss_103120_EnergyStore,Boss_103120_EnergyReSet = LuaS_116726_OutputControl(Boss_103120_EnergyStore, Boss_103120_EnergyReSet ,200,false)


--����O����
	BValue_0 = nil
	PEindex = nil
	RandSpell = nil
end

function LuaS_103120_Phase_303.leave(ThisObj)
	MoveToFlagEnabled(ThisObj.MonID, false)
--�����Ҧ��S��
	local BValue_0 = FSM_GetState(ThisObj,0)
	for i=1,table.getn(BValue_0.Equipment),1 do
		for k=1,table.getn(Boss_103120_PH303_Spell),1 do
			CancelBuff(BValue_0.Equipment[i][1],Boss_103120_PH303_FX[k])
		end
	end
	for i=1,table.getn(BValue_0.Equipment),1 do
		SetPlot(BValue_0.Equipment[i][1],"range","LuaS_116726_CancelBuff_01",40)--�^���෽
	end

--����O����
	Boss_103120_PH303_Time = nil
	BValue_0 = nil

	LuaS_103120_AidBuild_2(Boss_103120_FireTargetArray)
	Boss_103120_FireTargetArray = {}
end
----------------------------------------------------------------
LuaS_103120_Phase_401 = {}
--���qD
--���A1�G�¤g�s�Ӫ����J(�ĤT�}��Q��)
function LuaS_103120_Phase_401.enter(ThisObj)
	MoveToFlagEnabled(ThisObj.MonID, false)
--�ԳN�վ�
	AI_Order_103120 = 902--�����Ҧ�  ���_�Ӥ~���
--�إߺt��
	local BValue_0 = FSM_GetState(ThisObj,0)
	local BValue_401 = FSM_GetState(ThisObj,401)
	BValue_401.HeyTwo = {}
	BValue_401.HeyTwoNum=GetMoveFlagCount(780085)-1
	BValue_401.HeyTwoShowTime = 0

	BValue_401.Freezer={}

	for i=1,BValue_401.HeyTwoNum,1 do
		BValue_401.Freezer[i] = DW_CreateObjEX("flag",104618,780085,i,1,170)--���ͦ�O�J��s��
		SetPlot(BValue_401.Freezer[i],"dead","LuaS_104618_DontDie",0)
		SysCastSpellLv(BValue_401.Freezer[i],BValue_401.Freezer[i],495735,1)--�ǰe�S��
		MoveToFlagEnabled(BValue_401.Freezer[i], false)
		CallPlot(BValue_401.Freezer[i],"LuaS_103120_Freezer",BValue_0.Equipment[i][1],BValue_401.Freezer[i] )
	end
--���ܤ��O��X�Ҧ�
	Boss_103120_FireTargetArray = LuaS_103120_TargetBuild(3,ThisObj.MonID)

	ScriptMessage( ThisObj.MonID, -1, 0, "[SC_103120_CON_40100]", 0 )--�����a���T��
	ScriptMessage( ThisObj.MonID, -1, 0, "[SC_103120_CON_40101]", C_Red )--�����a���T��
end

function LuaS_103120_Phase_401.update(ThisObj)
--�ˬd��e���q
	local PEindex = PE_GetActivePhaseIndex(1)
	if	PEindex ~=400	then
		return	PEindex
	end
	LuaS_103120_SanctionHandle() --����̱���
--���O�禡
	LuaS_103120_MuzzleBuild(Boss_103120_FireTargetArray,0,ThisObj.MonID)
--����¤g�s�Ӫ̩M��O�J��s��
	local BValue_0 = FSM_GetState(ThisObj,0)
	local BValue_401 = FSM_GetState(ThisObj,401)
	if	BValue_401.HeyTwoShowTime<15	then
		if	DW_Rand(2)==1	then
			BValue_401.HeyTwoShowTime = BValue_401.HeyTwoShowTime +1--���T�w���n���ɾ�
		end

	elseif	BValue_401.HeyTwoShowTime==15	then
		BValue_401.HeyTwoShowTime = BValue_401.HeyTwoShowTime +1
--���Ͷ¤g
		for i=1,BValue_401.HeyTwoNum,1 do
			BValue_401.HeyTwo[i] = DW_CreateObjEX("flag",104758,780085,i,1,170)
			CallPlot(BValue_401.HeyTwo[i],"LuaS_103120_Thief",BValue_0.Equipment[i][1],BValue_401.HeyTwo[i])
			MoveToFlagEnabled(BValue_401.HeyTwo[i] , false)
		end
	end
--�෽�������ͱ���
	Boss_103120_EnergyStore,Boss_103120_EnergyReSet = LuaS_116726_OutputControl(Boss_103120_EnergyStore, Boss_103120_EnergyReSet ,200,false)

--����O����
	BValue_0 = nil
	BValue_401 = nil
	PEindex = nil
end

function LuaS_103120_Phase_401.leave(ThisObj)
	MoveToFlagEnabled(ThisObj.MonID, false)
	local BValue_401 = FSM_GetState(ThisObj,401)
--�R�����g�s�Ӫ�
	for i=1,BValue_401.HeyTwoNum,1 do
		LuaS_103120_SafeDelObj(BValue_401.HeyTwo[i])
	end
--��O�J�����e�n�q�@�U
	local Eric
	for i=1,BValue_401.HeyTwoNum,1 do
		Eric = BValue_401.Freezer[i]
		Say(Eric,"[SC_103120_CON_40106]")
		SysCastSpellLv(Eric,Eric,495735,1)
		WriteRoleValue(Eric,EM_RoleValue_LiveTime,1)
	end
	Eric = nil

	LuaS_103120_AidBuild_2(Boss_103120_FireTargetArray)
	Boss_103120_FireTargetArray = {}
end
----------------------------------------------------------------
LuaS_103120_Phase_402 = {}
--���qD
--���A2�G��O�J�|�}�ҳ������w���Ŷ��Ѹ���(�}��)
function LuaS_103120_Phase_402.enter(ThisObj)
	MoveToFlagEnabled(ThisObj.MonID, false)
--�ԳN�վ�
	AI_Order_103120 = 995--�״_�Ҧ� 
--�F���ǳư�
	local BValue_402 = FSM_GetState(ThisObj,402)
	BValue_402.Time = 25--�F�������j�ɶ�
	BValue_402.SafeSpace = {}
	BValue_402.SafeTime = 5--�w�}�Ҩ��@���ɶ�
--���ܤ��O��X�Ҧ�
	Boss_103120_FireTargetArray = LuaS_103120_TargetBuild(3,ThisObj.MonID)
	ScriptMessage( ThisObj.MonID, -1, 0, "[SC_103120_CON_40200]", 0 )--�����a���T��
end

function LuaS_103120_Phase_402.update(ThisObj)
	local BValue_402 = FSM_GetState(ThisObj,402)
--�ˬd��e���q
	local PEindex = PE_GetActivePhaseIndex(1)
	if	PEindex ~=400	then
		return	PEindex
	end
	LuaS_103120_SanctionHandle() --����̱���

--���T�{��ƬO�_�����}�Ҩ��@
	if	BValue_402.SafeTime==9	then
		LuaS_103120_MuzzleBuild(Boss_103120_FireTargetArray,0,ThisObj.MonID)
--�}�Ҩ��@�O���B�ð���script
		local Force
		BValue_402.SafeTime = BValue_402.SafeTime + 1--�����o�ӼƦr
		for i=1,GetMoveFlagCount(780086)-1,1 do
			BValue_402.SafeSpace[i] = LuaS_103120_Phase402_ForceSet(DW_CreateObjEX("flag",104760,780086,i,0,180)--�H���I�إߤO��
											) --���]�w �A���w��BValue_402.SafeSpace[i]
		end
	elseif	BValue_402.SafeTime==7	then
		LuaS_103120_MuzzleBuild(Boss_103120_FireTargetArray,0,ThisObj.MonID)
		ScriptMessage( ThisObj.MonID, -1, 0, "[SC_103120_CON_40201]",  "0xFF98E0E7" )--�����a���T��
		BValue_402.SafeTime = BValue_402.SafeTime + 1

	elseif	BValue_402.SafeTime==13	then
		LuaS_103120_MuzzleBuild(Boss_103120_FireTargetArray,0,ThisObj.MonID)
		BValue_402.SafeTime = BValue_402.SafeTime + 1--�ɶ��� �}�l�F��
		ScriptMessage( ThisObj.MonID, -1, 0, "[SC_103120_CON_40202]",  C_Red )--�����a���T��

	elseif	BValue_402.SafeTime >=20	then
		LuaS_103120_MuzzleBuild(Boss_103120_FireTargetArray,0,ThisObj.MonID)
--�M���ɨ�
		BValue_402.SafeTime = 0
		for i=1,GetMoveFlagCount(780086)-1,1 do
			DW_CheckThenDel(BValue_402.SafeSpace[i])--�����C�ӤO��
		end


	elseif	BValue_402.SafeTime >=17	then
		LuaS_103120_MuzzleBuild(Boss_103120_FireTargetArray,5,ThisObj.MonID,true)
		BValue_402.SafeTime = BValue_402.SafeTime + 1


	elseif	BValue_402.SafeTime>13	then
		LuaS_103120_MuzzleBuild(Boss_103120_FireTargetArray,5,ThisObj.MonID,true)
		BValue_402.SafeTime = BValue_402.SafeTime + 1--�ɶ��� �}�l�F��
	else
		LuaS_103120_MuzzleBuild(Boss_103120_FireTargetArray,0,ThisObj.MonID)
		if	DW_Rand(999)%2==0	then
			BValue_402.SafeTime = BValue_402.SafeTime + 1
		end
	end
--�෽�������ͱ���
	Boss_103120_EnergyStore,Boss_103120_EnergyReSet = LuaS_116726_OutputControl(Boss_103120_EnergyStore, Boss_103120_EnergyReSet ,200,false)
--����O����
	BValue_402 = nil
	PEindex = nil
end

function LuaS_103120_Phase_402.leave(ThisObj)
	MoveToFlagEnabled(ThisObj.MonID, false)
--�ˬd�çR���w���Ŷ�
	local BValue_402 = FSM_GetState(ThisObj,402)
	local Force
	for i=1,table.getn(BValue_402.SafeSpace),1 do
		Force = BValue_402.SafeSpace[i]--���w�O����
		if	Force~=nil	then
			DW_CheckThenDel(Force)
		end
	end
--����O����
	Force = nil
	BValue_402 = nil

	LuaS_103120_AidBuild_2(Boss_103120_FireTargetArray)
	Boss_103120_FireTargetArray = {}
end
----------------------------------------------------------------
--���qD
LuaS_103120_Phase_403 = {}
--���A3�G��O�J�ǰe�z�����Ķi�Ӭ�ŧ(���w)
function LuaS_103120_Phase_403.enter(ThisObj)
	MoveToFlagEnabled(ThisObj.MonID, false)
--�ԳN�վ�
	AI_Order_103120 = 901--�Ķ��Ҧ� 
--�إ��F�����ѦҦ�m
	local BValue_403 = FSM_GetState(ThisObj,403)
	BValue_403.Time = 25--�F�������j�ɶ�
	BValue_403.Bomb = {}
	BValue_403.BombNum = GetMoveFlagCount(780085)-1--�ƶq���P�X�l��
	local BOM
	for i=1,GetMoveFlagCount(780085)-1,1 do
		BValue_403.Bomb[i]={}
		BValue_403.Bomb[i][0] = 0--[0]�O�����ͮɶ�
		BOM= DW_CreateObjEX("flag",104759,780085,i,0,100)--[1]�O��ID
		DW_UnFight(BOM)--���ܤ��z�I�����A
		Lua_ObjDontTouch( BOM)--���ܤ��z�I�����A
		AddToPartition(BOM,0)
		AddBuff(BOM,507881,1,-1)--�V�U�b�Y��buff
		BValue_403.Bomb[i][1] = BOM --���w�O���骺��
	end
--���ܤ��O��X�Ҧ�
	Boss_103120_FireTargetArray = LuaS_103120_TargetBuild(3,ThisObj.MonID)

	ScriptMessage( ThisObj.MonID, -1, 0, "[SC_103120_CON_40300]",  "0xFF98E0E7" )--�����a���T��

	BOM = nil
end

function LuaS_103120_Phase_403.update(ThisObj)
	local BValue_403 = FSM_GetState(ThisObj,403)
--�ˬd��e���q
	local PEindex = PE_GetActivePhaseIndex(1)
	if	PEindex ~=400	then
		return	PEindex
	end
	LuaS_103120_SanctionHandle() --����̱���
--���O�禡
	LuaS_103120_MuzzleBuild(Boss_103120_FireTargetArray,0,ThisObj.MonID)
--�˼�
	for i=1,GetMoveFlagCount(780085)-1,1 do
		local BOM
		BOM = BValue_403.Bomb[i][1]
		if	BValue_403.Bomb[i][0]>=6	then
			WriteRoleValue(BOM,EM_RoleValue_LiveTime,1)
			BValue_403.Bomb[i][0] = 0--�k�sŪ��
--���z
			SysCastSpellLv(BOM,BOM,496282,89)
--�R���{�b�����z�I �B�إ߷s���B�k�sŪ��
			BOM = DW_CreateObjEX("flag",104759,780085,i,0,200)
			DW_UnFight(BOM)--���ܤ��z�I�����A
			Lua_ObjDontTouch( BOM)--���ܤ��z�I�����A
			AddToPartition(BOM,0)
			AddBuff(BOM,507881,1,-1)--�V�U�b�Y��buff
			BValue_403.Bomb[i][1] = BOM
		else
--���z ��ƼW�[
			if	DW_Rand(999)%2==0	then
				BValue_403.Bomb[i][0] = BValue_403.Bomb[i][0] + 1
			end
		end
	end
--�෽�������ͱ���
	Boss_103120_EnergyStore,Boss_103120_EnergyReSet = LuaS_116726_OutputControl(Boss_103120_EnergyStore, Boss_103120_EnergyReSet ,200,false)

--����O����
	BValue_403 = nil
	PEindex = nil
end

function LuaS_103120_Phase_403.leave(ThisObj)
	MoveToFlagEnabled(ThisObj.MonID, false)
	local BValue_403 = FSM_GetState(ThisObj,403)
--�R���Ҧ����z�I
	for i=1,BValue_403.BombNum,1 do
		DW_CheckThenDel(BValue_403.Bomb[i][1])
	end

	LuaS_103120_AidBuild_2(Boss_103120_FireTargetArray)
	Boss_103120_FireTargetArray = {}
end