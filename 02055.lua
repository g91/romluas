


----------------------------------------------------------------
--����̺޲z�禡&��ʤ�w
function LuaS_103120_SanctionHandle()
--------------------------------
	local TeamAmount = GetMoveFlagCount(780081)-1 --�����`��
	local LimitAmount = 16 --�涤�W��
--[0] �}�`�ƶq�p��
--LimitAmount+1  ���ζ����A [0�A�����Υ��X��]  [1�A�ݭn�Ͳ�] [2�A�S�ļ���]  [3,�Ͳ�����]
--LimitAmount+2  ���ͮɶ�
--LimitAmount+3  �S�Ĳ���ID
	local Duration = 20--�Ͳ����j
	local SuicideLimit = 9--���z����
	local LocalRand = 180 --�üƽd��
--(�ƭȲ�)�ޯ�����
--����̪����z�Ҳ��ͪ��ˮ`%�ơG496274
	local SkillLV_496274= 0

--������z&����
	for i=1,TeamAmount,1 do
		if	Sanctions[i] == nil	then
			Sanctions[i] = {}
		end
--����A&���ͮɶ�
		if	Sanctions[i][LimitAmount+1]==nil	then
			Sanctions[i][LimitAmount+1]=1
		elseif	Sanctions[i][LimitAmount+1]==0	then
			if	Sanctions[i][LimitAmount+2]==nil	then--�q�������L==>�إ߭��ͮɶ����
				Sanctions[i][LimitAmount+2]=1
			elseif	Sanctions[i][LimitAmount+2]<Duration	then--�p�G���ͮɶ��٨S��==>����֭p�ɶ�
				Sanctions[i][LimitAmount+2]=Sanctions[i][LimitAmount+2] + 1
			else
				Sanctions[i][LimitAmount+1]=1--�}�ҥͲ��ݨD
				Sanctions[i][LimitAmount+2]=0--���m���ͮɶ�
			end
		end
		if	Sanctions[i][LimitAmount+1]==1	then--�ݭn�Ͳ�
			Sanctions[i][LimitAmount+1]=2
--�T�{�Ͳ����O==>����S��
		elseif	Sanctions[i][LimitAmount+1]==2	then
			if	(Sanctions[i][0] == nil	or	Sanctions[i][0]==0)	then
				Sanctions[i][0] =1
				Sanctions[i][LimitAmount+3] =  DW_CreateObjEX("flag",104612,780081,i,0,LocalRand)
				Lua_ObjDontTouch( Sanctions[i][LimitAmount+3] )--�����@���ݩ�
				DW_UnFight(Sanctions[i][LimitAmount+3] )
				AddToPartition(Sanctions[i][LimitAmount+3],0)
				AddBuff(Sanctions[i][LimitAmount+3],507768,20,20)--�S��
				break --���X���U��
			elseif	Sanctions[i][0] <5	then
				Sanctions[i][0] = Sanctions[i][0]+1	
			elseif	Sanctions[i][0] >=5	then
--�}�l�Ͳ�(�üƲ��ͦ�m&����AI)
				for k=1,LimitAmount,1 do
					if	k==LimitAmount-2	then--�S�����̽s�����P
						Sanctions[i][k] = DW_CreateObjEX("obj",104614,Sanctions[i][LimitAmount+3],1,180)
					elseif	k==LimitAmount-4	then
						Sanctions[i][k] = DW_CreateObjEX("obj",104615,Sanctions[i][LimitAmount+3],1,180)
					elseif	k==LimitAmount-6	then
						Sanctions[i][k] = DW_CreateObjEX("obj",104616,Sanctions[i][LimitAmount+3],1,180)
					elseif	k==LimitAmount-10	then
						Sanctions[i][k] = DW_CreateObjEX("obj",104617,Sanctions[i][LimitAmount+3],1,180)
					else
						Sanctions[i][k] = DW_CreateObjEX("obj",104613,Sanctions[i][LimitAmount+3],1,180)--���q�����
					end

					SetPlot(Sanctions[i][k],"dead","LuaS_SanctionDeadCount",0)
					WriteRoleValue(Sanctions[i][k],EM_RoleValue_Register2,i)
					BeginPlot(Sanctions[i][k],"LuaS_103120_SanctionAI",0)--����AI
				end
				DW_CheckThenDel(Sanctions[i][LimitAmount+3])--�R���S��
				Sanctions[i][LimitAmount+1]=3--����Ͳ�
				break --���X���U��
			end
		elseif	Sanctions[i][LimitAmount+1]==3	then
			Sanctions[i][0]=0--�s�`�p���k�s
--�԰����A==>�p��==>��s���O
			for k=1,LimitAmount,1 do
				if	CheckID(Sanctions[i][k])==false	or
					ReadRoleValue(Sanctions[i][k],EM_RoleValue_IsDead)==1	then--�p��즺�`==>�W�[�p��
					Sanctions[i][0] = Sanctions[i][0]+1
					if	Sanctions[i][0] >= SuicideLimit	then--�Y�涤���`�ƶW�L���״N�������z
						for k=1,LimitAmount,1 do
							if	CheckID(Sanctions[i][k])==true	and
								ReadRoleValue(Sanctions[i][k],EM_RoleValue_IsDead)==0	then--�u�n�٦s�������
								SysCastSpellLv(Sanctions[i][k],Sanctions[i][k],496274,SkillLV_496274)--���z
								SetDefIdleMotion(Sanctions[i][k],ruFUSION_MIME_IDLE_DEAD)
								PlayMotion(Sanctions[i][k],ruFUSION_ACTORSTATE_DYING)

								WriteRoleValue(Sanctions[i][k],EM_RoleValue_LiveTime,1)
							elseif	CheckID(Sanctions[i][k])==true	and ReadRoleValue(Sanctions[i][k],EM_RoleValue_IsDead)==1	then
								DW_CheckThenDel(Sanctions[i][k])
							end
						end
						for k=1,LimitAmount,1 do
							LuaS_103120_Sanction[Sanctions[i][k]] = nil
						end
						Sanctions[i]=nil--�аO����=>����O����
						break --���X���U��
					end
					if	Sanctions[i][0] == LimitAmount	then--�p�G���`�� = �`��
						for k=1,LimitAmount,1 do
							LuaS_103120_Sanction[Sanctions[i][k]] = nil
						end
						Sanctions[i]=nil--�аO����=>����O����
						break --���X���U��
					end
				end
			end
		end
	end
	for i=1,3,1 do
		if	TankSanctions[i]==nil	then
			TankSanctions[i] = DW_CreateObjEX("flag",104809,(780090+i),1,1,500)
			SetPlot(TankSanctions[i],"dead","LuaS_SanctionDeadCount",0)
			WriteRoleValue(TankSanctions[i],EM_RoleValue_Register1,555)
		end
		if	CheckID(TankSanctions[i])==false	then
			TankSanctions[i] = DW_CreateObjEX("flag",104809,(780090+i),1,1,500)
			SetPlot(TankSanctions[i],"dead","LuaS_SanctionDeadCount",0)
			WriteRoleValue(TankSanctions[i],EM_RoleValue_Register1,555)
		end
		if	ReadRoleValue(TankSanctions[i],EM_RoleValue_Register1)==555	then--�w�����
			if	HateListCount( TankSanctions[i])==0	and
				ReadRoleValue(TankSanctions[i],EM_RoleValue_IsAttackMode)==0	then--�D�԰��~����
				if	i==1	then
					SetPlot(TankSanctions[i],"range","LuaS_103120_TankRangePlot",350)
				end
				CallPlot(TankSanctions[i],"LuaS_103120_TankSanctionAI",TankSanctions[i],780090+i)--����
			end
		end
	end
end
function LuaS_103120_TankSanctionAI(Obj,FlagID)
	WriteRoleValue(Obj,EM_RoleValue_Register1,0)
	for i=1,GetMoveFlagCount(FlagID)-1,1 do
		DW_MoveToFlag( Obj , FlagID, i,80,1 )--�j��=>����
		if	HateListCount( Obj)~=0	or
			ReadRoleValue(Obj,EM_RoleValue_IsAttackMode)==1	then--�Y�b�԰����N���X
			break
		end
	end
	WriteRoleValue(Obj,EM_RoleValue_Register1,555) --��ܲ����j��
end
function LuaS_103120_TankRangePlot()
	local Obj = OwnerID()--���a
	local Target = TargetID()--�Z�J
	SysCastSpellLv(Obj,Target,495751,1)
end
----------------------------------------------------------------
LuaS_103120_Sanction = {}
--���AI
function LuaS_103120_SanctionAI()
--�إߩҦ��ԳN�C��
	local State = {}
	State[900]=LuaS_SanctionTactical_Initial--��l��
	State[901]=LuaS_SanctionTactical_Normal--�Ķ��Ҧ�
	State[902]=LuaS_SanctionTactical_Hunt --�����Ҧ�
	State[995]=LuaS_SanctionTactical_FixAnberale--�״_�Ҧ�
	State[1000]=LuaS_SanctionTactical_Fight --�԰��Ҧ�
	local OwnerID=OwnerID()--�O��������̪�ID
	local ThisObj=FSM_Initial(OwnerID,State)--��l�ƶǭȰʧ@:ThisObj���@��table
	ThisObj.Creater = TargetID()
	LuaS_103120_Sanction[OwnerID]=ThisObj--�O���M�ݪ�AI����
	FSM_DoTransion(ThisObj,900)--��l�N�q���@�ӾԳN�}�l����
--�j�����ԳN
	while true do
		sleep(10)
		FSM_Update(ThisObj)
	end
end

----------------------------------------------------------------
function LuaS_SanctionTactical_InitialEnter(OrgID,Obj)
--(�ƭȲ�)�ޯ�����
--��w�ؼЧޯ�(�l�Ǭ��)�G496269
	if	SkillLV_496269==nil	then
		SkillLV_496269 = 10
	end

	if	OrgID==104614	then
		SetModeEx( Obj,EM_SetModeType_Searchenemy,false) --104614���|����
	elseif	OrgID==104615	then
		WriteRoleValue(Obj,EM_RoleValue_PID,SkillLV_496269)
		SetPlot(Obj,"dead","LuaS_104615_Dead",0)--104615���`�|�z���y���ˮ`�ë��w�ؼгQ���==>���`�@��
	elseif	OrgID==104616	then
		SetPlot(Obj,"dead","LuaS_104616_Dead",0)--104616���`�|��X�d��ˮ`dot==>���`�@��
	elseif	OrgID==104617	then
		SetPlot(Obj,"dead","LuaS_507765_Attach_02",0)--104617���`�n�Ѱ��s��
	end
end
----------------------------------------------------------------
LuaS_SanctionTactical_Initial = {}
--��l��
function LuaS_SanctionTactical_Initial.enter(ThisObj)
	LuaS_SanctionTactical_InitialEnter(	ReadRoleValue(ThisObj.MonID,EM_RoleValue_OrgID),
						ThisObj.MonID)
end

function LuaS_SanctionTactical_Initial.update(ThisObj)
	if	AI_Order_103120~= 900	then
		return AI_Order_103120
	end
end

function LuaS_SanctionTactical_Initial.leave(ThisObj)

end
----------------------------------------------------------------
function LuaS_SanctionTactical_NormalEnter(OrgID,Obj)
	if	OrgID ==104614	then
		AddBuff(Obj,507763,14,-1)--��H�����P104614��D==>���}�԰��N�ɥR���ƴ�ˬ�
	end
end

function LuaS_SanctionTactical_NormalUpdate(OrgID,Obj)
	if	OrgID ==104614	then
		if	DW_CheckUse(Obj,496276)<=0	and
			ReadRoleValue(Obj,EM_RoleValue_SpellMagicID)==0	then  --104614�C�T�����|���y�@������
			CastSpell(Obj,Obj,496276)
		end
	end
end

function LuaS_SanctionTactical_NormalLoop(Obj)
	MoveToFlagEnabled(Obj, false)
--�S��AI����
	LuaS_SanctionTactical_NormalUpdate(ReadRoleValue(Obj,EM_RoleValue_OrgID),Obj)
--�԰��~
	if	ReadRoleValue(Obj,EM_RoleValue_IsAttackMode)==0	and
		HateListCount( Obj)==0	then
--���P�w����O�_���q��
		if	CheckBuff(Obj,507879)	then--�Y���q�ۥ��X�Ӫ�Buff �N������q��
			local Rock = BuffInfo(Obj,Lua_BuffPosSearch( Obj , 507879 ),EM_BuffInfoType_OwnerID)--��X�O���@���q��
			if	CheckID(Rock)==false	then
				CancelBuff(Obj,507879)
				CancelBuff(Obj,507880)
			else
				if	CheckBuff(Obj,507880)	then --�w�g�b����
					SetDefIdleMotion(Obj,ruFUSION_MIME_SLEEP_LOOP)--���q�ʧ@
					WriteRoleValue(Obj,EM_RoleValue_Register1,1)
					if	SanctionMark==1	then
						PE_AddVar("TakeSource",-90)--�W�[PE���Ķ��I��
					else
						PE_AddVar("TakeSource",-30)--�W�[PE���Ķ��I��
					end
					if	DW_Rand(999)%7==0	then
						WriteRoleValue(Rock,EM_RoleValue_PID,ReadRoleValue(Rock,EM_RoleValue_PID)+1)
					end
				else
					FaceObj( Obj, Rock)--�e���q��
					AddBuff(Obj,507880,1,-1)--�аO�w�b�i����q
				end
			end
		else--���񪺯෽�H������
			if	ReadRoleValue(Obj,EM_RoleValue_Register1)==1	then
				WriteRoleValue(Obj,EM_RoleValue_Register1,0)
				SetDefIdleMotion(Obj,ruFUSION_MIME_IDLE_STAND) --�^�_���ɰʧ@
				CancelBuff(Obj,507880)--�������෽���ʧ@
			end
--�S�q�~�H������
			if	DW_Rand(999)%7==0	then
				if	DW_CheckDis(Obj,780081,ReadRoleValue(Obj,EM_RoleValue_Register2),300)	then
					if	DW_MoveRand(Obj,300)~=false	then
						sleep(20)
					end
				else
					if	DW_MoveRand(Obj,350,1,780081,ReadRoleValue(Obj,EM_RoleValue_Register2))~=false	then
						sleep(20)
					end
				end
			end
		end
	else
--�i�J�԰�
		sleep(5)
		return 1000
	end
end
----------------------------------------------------------------
LuaS_SanctionTactical_Normal = {}
--�Ķ��Ҧ�
function LuaS_SanctionTactical_Normal.enter(ThisObj)
	LuaS_SanctionTactical_NormalEnter(	ReadRoleValue(ThisObj.MonID,EM_RoleValue_OrgID),
						ThisObj.MonID	)
end

function LuaS_SanctionTactical_Normal.update(ThisObj)
--�T�{���q
	if	AI_Order_103120~=901		then
		return AI_Order_103120
	end
	if	LuaS_SanctionTactical_NormalLoop(ThisObj.MonID) == 1000	then
		return	1000
	end
end

function LuaS_SanctionTactical_Normal.leave(ThisObj)
	CancelBuff(ThisObj.MonID,507880)
	SetDefIdleMotion(ThisObj.MonID,ruFUSION_MIME_IDLE_STAND)
end
---------------------------------------------------------------------------
function LuaS_SanctionTactical_HuntLoop(Obj)
	MoveToFlagEnabled(Obj, false)--�������|����
--�Ϥ��O�_�n�i�J�԰��Ҧ�
	if	ReadRoleValue(Obj,EM_RoleValue_IsAttackMode)==0	and
		HateListCount(Obj)==0	then--�԰��~
--�D�԰����ԳN����
		LuaS_SanctionTactical_NormalUpdate(	ReadRoleValue(Obj,EM_RoleValue_OrgID),	
							Obj	)
--�i���H������
		if	DW_Rand(999)%7==0	then--�H���P�_�n����
			if	DW_CheckDis(Obj,780081,ReadRoleValue(Obj,EM_RoleValue_Register2),300)	then
				if	DW_MoveRand(Obj,200)~=false	then
					sleep(20)
				end
			else
				if	DW_MoveRand(Obj,350,1,780081,ReadRoleValue(Obj,EM_RoleValue_Register2))~=false	then
					sleep(20)
				end
			end
		end
	else
--�i�J�԰��N������԰��Ҧ�
		sleep(5)
		return 1000
	end
end
---------------------------------------------------------------------------
LuaS_SanctionTactical_Hunt = {}
--�����Ҧ�
function LuaS_SanctionTactical_Hunt.enter(ThisObj)
	LuaS_SanctionTactical_NormalEnter(	ReadRoleValue(ThisObj.MonID,EM_RoleValue_OrgID),
						ThisObj.MonID	)
end

function LuaS_SanctionTactical_Hunt.update(ThisObj)
--���P�_�{�b�����q�O�_���ܰ�
	if	AI_Order_103120~=902		then
		return AI_Order_103120
	end
	if	LuaS_SanctionTactical_HuntLoop(ThisObj.MonID)==1000	then
		return 1000
	end
end

function LuaS_SanctionTactical_Hunt.leave(ThisObj)
end
----------------------------------------------------------------
function LuaS_SanctionTactical_FightEnter(OrgID,Obj,Target)
	if	SkillLV_496267==nil	then
		SkillLV_496267 = 3--�ľW���˧ޯ�(���ˬ��)�G496267
	end
	if	OrgID == 104614	then
		SysCastSpellLv(Target,Obj,496266,1)--��w�ؼ�
		AddBuff(Obj,506984,7,10)--�[�t�췥��
		CastSpellLV(Obj,Target,496267,SkillLV_496267)--�ľW�ؼ�
	elseif	OrgID == 104613	then
		if	SanctionMark==2	then
			AddBuff(Obj,507929,1,-1)
		end
	end
end

function LuaS_SanctionTactical_FightUpdate(OrgID,Obj,Target,
LvSet1,--�S�����̶ˮ`�ޯ�(�ʤ���)�G496268
LvSet2,--�ľW���˧ޯ�(���ˬ��)�G496267
LvSet3,--��w�ؼЧޯ�(�l�Ǭ��)�G496269
LvSet4,--�Ť巴���O���ˮ`%�ơG496273
LvSet5)--����̾ள�N�����N�G496272
	if	OrgID == 104614	then--�����27��(�S������)
		if	CheckBuff(Target,507759)==false	then--�Y���Q����==>�ľW����
			CastSpellLV(Obj,Target,496267,LvSet2)	
		else--�p�G���w�g�Q����=>�������
			SysCastSpellLv(Obj,Target,496268,LvSet1)
		end

	elseif	OrgID == 104615	then--�����01��(�S��������)
		if	(DW_Rand(999)%7)==0		then--�H���ü�
			local Target = ReadRoleValue(Obj,EM_RoleValue_AttackTargetID)
			if	CheckBuff(Target,507181)==false	then--�D���٨S�Qbuff 
				if	DW_CheckUse(Obj,496270) <= 0	and
					ReadRoleValue(Obj,EM_RoleValue_SpellMagicID )==0	then--����CD�ɶ�
					CastSpellLV(Obj,Target,496270,1) --����wBuff
					SysCastSpellLv(Target,Target,496269,LvSet3)--�s�ؼЬI�i����k�N
					ScriptMessage( Target, Target, 2 , "[SC_103120_SANC_05]", C_Red ) --����
				end
			end
		end

	elseif	OrgID == 104616	then--�����48��(�S�������)
		if	DW_CheckUse(Obj,496271)==0	and
			ReadRoleValue(Obj,EM_RoleValue_SpellMagicID)==0	then--����CD�ɶ�
			CancelBuff(Obj,507762)--�Ѱ��H�����ʪ�buff
			WriteRoleValue(Obj,EM_RoleValue_PID,LvSet4) --�]�w�ޯ�j��
			CastSpellLV(Obj,Target,496271,1)
			ScriptMessage( Target, Target, 2 , "[SC_103120_SANC_06]", C_Red ) --����
		else
			if	CheckBuff(Obj,507762)==false	then--����ö]
				AddBuff(Obj,507762,100,-1)
			end
		end

	elseif	OrgID == 104617	then--�����21��(�S��������)
		if	DW_CheckUse(Obj,496272)==0	and
			ReadRoleValue(Obj,EM_RoleValue_SpellMagicID)==0	and
			ReadRoleValue(Target,EM_RoleValue_IsPlayer)==1	and --�u�缾�a��
			CheckBuff(Target,507766)==false	then--����CD�ɶ�&��設�W���ĪG�ɶ�����
			CancelBuff(Obj,507762)--�Ѱ��H�����ʪ�buff
			CastSpellLV(Obj,Target,496272,LvSet5)--�P�ɵ��ۤv�S���ʪ��A
			CallPlot(Target,"LuaS_507766_CheckCancel",Target,Obj)
			sleep(20)
		else
			if	CheckBuff(Obj,507762)==false	then
				AddBuff(Obj,507762,100,-1)
			end
		end

	end--����
end
----------------------------------------------------------------
LuaS_SanctionTactical_Fight = {}
--�԰��Ҧ�
--���P����즳���P���԰��覡
function LuaS_SanctionTactical_Fight.enter(ThisObj)
	LuaS_SanctionTactical_FightEnter(	ReadRoleValue(ThisObj.MonID,EM_RoleValue_OrgID),
						ThisObj.MonID,
						ReadRoleValue(ThisObj.MonID,EM_RoleValue_AttackTargetID)	)
end

function LuaS_SanctionTactical_Fight.update(ThisObj)
--�T�{�O�_�����԰�
	if	ReadRoleValue(ThisObj.MonID,EM_RoleValue_IsAttackMode)==0	or
		HateListCount( ThisObj.MonID)==0				then
		sleep(10)
		return AI_Order_103120
	end
	LuaS_SanctionTactical_FightUpdate(	ReadRoleValue(ThisObj.MonID,EM_RoleValue_OrgID),
						ThisObj.MonID,
						ReadRoleValue(ThisObj.MonID,EM_RoleValue_AttackTargetID),
						0,3,4,0,3	)--����԰�AI
end

function LuaS_SanctionTactical_Fight.leave(ThisObj)
--�M���H������buff
	if	CheckBuff(ThisObj.MonID,507762)	then
		CancelBuff(ThisObj.MonID,507762)
	end
	if	CheckBuff(ThisObj.MonID,506984)	then
		CancelBuff(ThisObj.MonID,506984)
	end
	WriteRoleValue(ThisObj.MonID,EM_RoleValue_IsWalk,1)
end
----------------------------------------------------------------
function LuaS_SanctionTactical_FixUpdate(Obj,OrgID,Creater)
--�԰��~�P�԰������������P
	if	ReadRoleValue(Obj,EM_RoleValue_IsAttackMode)==0	and
		HateListCount(Obj)	==0	then--�԰��~
--�״_�Ҧ����ԳN(�D�԰�)
		LuaS_SanctionTactical_NormalUpdate(OrgID,Obj)
--�H�Z���M�w�n�H�������٬O�i��״_
		if	CheckDistance(Obj,Creater, 200)	then--�Z���w�f�纸�ܪ�
			if	CheckBuff(Obj,507877)	then--�w�b�״_��
				SetDefIdleMotion(Obj,ruFUSION_MIME_CAST_LOOP)--�״_�ʧ@
				WriteRoleValue(Obj,EM_RoleValue_Register1,1)
				if	SanctionMark ==3	then
					SysCastSpellLv(Obj,Creater,496284,4999)--��5000�w��
				else
					SysCastSpellLv(Obj,Creater,496284,49)--��50�w��
				end
			else
				FaceObj( Obj,Creater)
				AddBuff(Obj,507877,1,-1)
			end
		else--���w�f�纸�ӻ�
			if	ReadRoleValue(Obj,EM_RoleValue_Register1)==1	then
				WriteRoleValue(Obj,EM_RoleValue_Register1,0)
				SetDefIdleMotion(Obj,ruFUSION_MIME_IDLE_STAND) --�^�_���ɰʧ@
			end
			if	DW_Rand(999)%7==1	then--�H������
				if	DW_CheckDis(Obj,780081,ReadRoleValue(Obj,EM_RoleValue_Register2),300)	then
					if	DW_MoveRand(Obj,180)~=false	then
						sleep(20)
					end
				else
					if	DW_MoveRand(Obj,350,1,780081,ReadRoleValue(Obj,EM_RoleValue_Register2))~=false	then
						sleep(20)
					end
				end
			end
		end
	else--�԰���
		sleep(5)
		return 1000
	end
end
-----------------------------------------------------------------
LuaS_SanctionTactical_FixAnberale = {}
--�״_�Ҧ�
function LuaS_SanctionTactical_FixAnberale.enter(ThisObj)
--�D�԰��Ҧ����ԳN�C��(�D�԰�)
	LuaS_SanctionTactical_NormalEnter(	ReadRoleValue(ThisObj.MonID,EM_RoleValue_OrgID),
						ThisObj.MonID	)
end

function LuaS_SanctionTactical_FixAnberale.update(ThisObj)
--���P�_�{�b�����q�O�_���ܰ�
	if	AI_Order_103120~=995		then
		return AI_Order_103120
	end
	if	LuaS_SanctionTactical_FixUpdate(	ThisObj.MonID,
							ReadRoleValue(ThisObj.MonID,EM_RoleValue_OrgID),
							ThisObj.Creater		) == 1000	then
		return 1000
	end
end

function LuaS_SanctionTactical_FixAnberale.leave(ThisObj)
	SetDefIdleMotion(ThisObj.MonID,ruFUSION_MIME_IDLE_STAND)
	CancelBuff(ThisObj.MonID,507877)
end

----------------------------------------------------------------
--104614�ΨӧP�w�O�_�i�J�԰����ˬd
function LuaS_507769_MagicCheck()
	local TargetPlayer = TargetID()
	local BuffLocation = Lua_BuffPosSearch( TargetPlayer , 507769 )
	if	BuffLocation ~= -1	then
		if	BuffInfo( TargetPlayer , BuffLocation , EM_BuffInfoType_Power )>=3	then
			ScriptMessage( TargetPlayer, TargetPlayer, 2 , "[SC_103120_SANC_05]", C_Red ) --����
--�����a��k�ū�����̬D�]
			SysCastSpellLv(TargetPlayer,OwnerID(),495751,3)
		end
	end
	return true
end
----------------------------------------------------------------

function LuaS_507764_Summer(Obj)
	local TID
	if	Obj ==nil	then
		TID = TargetID()
	else
		TID = Obj
	end
	local Summer = Lua_DW_CreateObj("obj",104611,TID,0,(DW_Rand(40)*2))
	DW_UnFight(Summer)--��������|�n�����ݩ�
	Lua_ObjDontTouch( Summer )
	AddToPartition(Summer,0)
	AddBuff(Summer,507770,1,-1)
--����@��
	CallPlot(Summer,"LuaS_507764_Summer_01",ReadRoleValue(OwnerID(),EM_RoleValue_PID),Summer)
--�٭�104616��PID
	WriteRoleValue(OwnerID(),EM_RoleValue_PID,0)
end
----------------------------------------------------------------
function LuaS_507764_Summer_01(SkillLV,Obj)
--�I�k�j������9��
	CastSpellLV(Obj,Obj,496273,SkillLV)
--�j��P�_
	while	true	do
		sleep(5)
		if	ReadRoleValue(Obj,EM_RoleValue_SpellMagicID)==0	then
			DW_CheckThenDel(Obj)
		end
	end
end
----------------------------------------------------------------
function LuaS_507765_Attach()
--��s�Ѧ��I
	AttachObj( OwnerID() , TargetID() ,1,"p_hit_point01","p_mouth")
	SysCastSpellLv(TargetID(),OwnerID(),496266,1)
	CallPlot(OwnerID(),"LuaS_507765_Attach_01",TargetID())
end
----------------------------------------------------------------
--���a���`��buff�����n�Ѱ��s��
function LuaS_507765_Attach_01(Target)
	while true do
		sleep(2)
--��ت��p�Ѱ��s��
--���aout
		if	CheckID(Target)==false		or
			ReadRoleValue(Target,EM_RoleValue_IsDead)==1	then
			DetachObj(OwnerID())
			return
		end
--���a��buff�w�g�Ѱ�w
		if	CheckBuff(Target,507766)==false	then
			DetachObj(OwnerID())
			return
		end
	end
end
----------------------------------------------------------------
--���`�@���Ѱ��s��
function LuaS_507765_Attach_02()
	local Target = TargetID()
	if	Boss_103120_BonusCheck ==0	then--����
		LuaPE_KS_GetBonus( 1, 1, 4 )
		if	Target ~= nil	then
			if	ReadRoleValue(Target,EM_RoleValue_IsPlayer)==1	then
				PE_AddVar("KillSanction",1)
				AddBuff(Target,508074,0,-1)
			end
		end
	end
	DetachObj(OwnerID())
	DW_CheckThenDel(OwnerID())
	return true
end

---------------------------------------------------------------
function LuaS_507766_CheckCancel(Me,Jacky)
	while	true	do
		if	CheckBuff(Me,507766)==false	then --buff�S�F
			return
		end
		if	CheckID(Jacky)==false	or	ReadRoleValue(Jacky,EM_RoleValue_IsDead)==1	then --Jacky���F
			CancelBuff(Me,507766)
			return
		end
		sleep(3)
	end
end
----------------------------------------------------------------
function LuaS_104615_Dead()

	local Owner = OwnerID()
	local Target = TargetID()
	if	Boss_103120_BonusCheck ==0	then--����
		LuaPE_KS_GetBonus( 1, 1, 4 )
		if	Target ~= nil	then
			if	ReadRoleValue(Target,EM_RoleValue_IsPlayer)==1	then
				PE_AddVar("KillSanction",1)
				AddBuff(Target,508074,0,-1)
			end
		end
	end
	SysCastSpellLv(Owner,Owner,496275,1)--�S��
	local RealPlayer = {}
--�i�վ��ܼ�
	local HowRange = 85

	local RangePlayer = SearchRangePlayer ( Owner , HowRange )
	for i=0,table.getn(RangePlayer),1 do
		if	ReadRoleValue(RangePlayer[i],EM_RoleValue_IsPlayer)==1	then
			if	ReadRoleValue(RangePlayer[i],EM_RoleValue_IsDead)==0	then
				table.insert(RealPlayer,RangePlayer[i])
			end
		end
	end
	for i=1,table.getn(RealPlayer),1 do
		if	i>2	then
			break
		end
		SysCastSpellLv(RealPlayer[i],RealPlayer[i],496269,ReadRoleValue(Owner,EM_RoleValue_PID))
	end
	DW_CheckThenDel(OwnerID())
	return true
end
----------------------------------------------------------------
function LuaS_104616_Dead()

	local Target = TargetID()
	local Owner = OwnerID()
	if	Boss_103120_BonusCheck ==0	then--����
		LuaPE_KS_GetBonus( 1, 1, 4 )
		if	Target ~= nil	then
			if	ReadRoleValue(Target,EM_RoleValue_IsPlayer)==1	then
				PE_AddVar("KillSanction",1)
				AddBuff(Target,508074,0,-1)
			end
		end
	end
--(�ƭȲ�)�ޯ�����
--�Ť巴���O���ˮ`%�ơG496273
	local SkillLV_496273 = 0

	WriteRoleValue(OwnerID(),EM_RoleValue_PID,SkillLV_496273)
	LuaS_507764_Summer(OwnerID())
	DW_CheckThenDel(OwnerID())
	return true
end
----------------------------------------------------------------�Ķ��H��
function LuaS_104613_Detect()
	local Array = {}
	Array[1] = 104613
	Array[2] = 104614
	Array[3] = 104615
	Array[4] = 104616
	Array[5] = 104617
	local Target = TargetID()
	local OrgID = ReadRoleValue(Target,EM_RoleValue_OrgID)
	for i=1,table.getn(Array),1 do
		if	OrgID==Array[i]	then
			return true
		end
	end
	return false
end

---------------------------------------------------------------104617  ��H��

function LuaS_104617_CallHelp()
	local Owner = OwnerID()
	local Target = TargetID()
	if	ReadRoleValue(Target,EM_RoleValue_IsPlayer)==1	then
		Say(Target,"[SC_103120_SANC_01]")
	end
end

function LuaS_104614_CallHelp()
	local Owner = OwnerID()
	local Target = TargetID()
	if	ReadRoleValue(Target,EM_RoleValue_IsPlayer)==1	then
		Say(Target,"[SC_103120_SANC_02]")
	end
end