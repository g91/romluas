--��¾�~���o

function LuaS_545159_QuestGet()
	local Obj = TargetID()--�`�N;�o�̬OTargetID
	ScriptMessage( Obj, Obj, 0, "[SC_545159_1]", C_YELLOW )	--�A�{�b�i�H����ɭ��̾ǲ�¾�~�ޥ��I
	if	CheckFlag(Obj,540820)==true then
		return
	end

end

function LuaS_545159_GetJob()
	local Obj = OwnerID()
	local Target = TargetID()
	LoadQuestOption(Obj)
	local PlayerRace = ReadRoleValue(Obj,EM_RoleValue_Race);
	local IsFirstSignJob = (CheckFlag(Obj,540804)==false);
	if	PlayerRace <=1 then
		if	IsFirstSignJob==true	then
			if ReadRoleValue(Obj,EM_RoleValue_VOC)<9 then
				SetFlag(Obj,ReadRoleValue(Obj,EM_RoleValue_VOC)+544753,1);
				SetFlag(Obj,540804,1);
			end
		end
	end
	--�e�m���ȧP�_--
	if	CheckFlag(Obj,545159)==false	then						--�P�_�O�_�������e�m����(�W�n�}�n)
		return
	end
	
	--�ر������P�_--
	local RaceOccupationList = {}
	RaceOccupationList[0] = {1,2,3,4,5,6};
	RaceOccupationList[1] = {1,2,3,4,[7]=7,[8]=8};
	RaceOccupationList[2] = {1,[3]=3,[4]=4,[5]=5,[9]=9,[10]=10};
	local JobIndex = math.floor(ReadRoleValue(Target,EM_RoleValue_PID)/10)	--�Q��PID���Q��ƥN��¾�~
	if	PlayerRace>=2 then
		return;--�رڤ��ŦX�N����
	else
		if	RaceOccupationList[PlayerRace][JobIndex]==nil	then
			return;--�رڤ��ŦX�N����
		end
	end
	--¾�~��ƦC��--
	local VocArray = {
							[1]={[1]=EM_RoleValue_VOCLV_Warrior	,[2]="SO_GETWARRIOR_1"},
							[2]={[1]=EM_RoleValue_VOCLV_Ranger	,[2]="SO_GETRANGER_1"},
							[3]={[1]=EM_RoleValue_VOCLV_Rogue		,[2]="SO_GETROGUE_1"},
							[4]={[1]=EM_RoleValue_VOCLV_Wizard	,[2]="SO_GETMAGE_1"},
							[5]={[1]=EM_RoleValue_VOCLV_Priest		,[2]="SO_GETPRIEST_1"},
							[6]={[1]=EM_RoleValue_VOCLV_Knight		,[2]="SO_GETKNIGHT_1"},
							[7]={[1]=EM_RoleValue_VOCLV_RuneDancer	,[2]="SO_GETWARDEN_1"},
							[8]={[1]=EM_RoleValue_VOCLV_Druid		,[2]="SO_GETDRUID_1"}

																			}
	local VocNum = 0
	for i=1,8,1 do
		if	ReadRoleValue(Obj,VocArray[i][1])~=0	then
			VocNum = VocNum +1
		end
	end
	
	--¾�~�W���P�_--
	local CheckVocNumPass = true				--¾�~�W���P�_
	if	ReadRoleValue( Obj , EM_RoleValue_VocCount )<=VocNum	then
		CheckVocNumPass = false
	end
	if	CheckVocNumPass == false	then		--�p�G¾�~��W���h����
		return
	end
	
	--�w��¾�~�P�_--
	local VocType = math.floor(ReadRoleValue(Target,EM_RoleValue_PID)/10)
	if	ReadRoleValue(Obj,VocArray[VocType][1])~=0	then	--�p�G�w�g����¾�~�h����
		return
	end
	
	
	AddSpeakOption(Obj,Obj,"["..VocArray[VocType][2].."]","LuaS_545159_GetJob_GoUp", 0 )
end

function LuaS_545159_GetJob_GoUp()
	local Obj = OwnerID()
	local Target = TargetID()
	CloseSpeak(Obj);
	local String = {
		[1]="SC_545159_2",
		[2]="SC_545159_3",
		[3]="SC_545159_4",
		[4]="SC_545159_5",
		[5]="SC_545159_6",
		[6]="SC_545159_7",
		[7]="SC_545159_8",
		[8]="SC_545159_9"
					}
	local VocType = math.floor(ReadRoleValue(Target,EM_RoleValue_PID)/10)
	WriteRoleValue(Obj,EM_RoleValue_VOC_SUB,VocType)		--����¾�~
	ScriptMessage( Obj, Obj, 0, "["..String[VocType].."]", C_YELLOW )
	SetFlag(Obj,540820,1)	--��¾�~���
	if CheckFlag( OwnerID() , 540190 ) == false then		--�ǰe�N
		SetFlag(OwnerID(),540190,1)
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_JOBGIVETRANSPORT][$SETVAR1=[491891]]" , C_SYSTEM )
	end
	if CheckFlag( OwnerID() , 540191 ) == false then		--�ǰe�N
		SetFlag(OwnerID(),540191,1)
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_JOBGIVETRANSPORT][$SETVAR1=[491913]]" , C_SYSTEM )
	end
end

--�i�ƪ��N���G�ӿ�
function LuaS_424346_ReturnQuestPlot()
	local Obj = TargetID()--�`�N;�o�̬OTargetID
	local VocAmount = ReadRoleValue( Obj , EM_RoleValue_VocCount )
	local NewVocAmount = VocAmount+1
	ScriptMessage( Obj, Obj, 0, "[SC_424346_06]", C_SYSTEM )
	AddRoleValue( Obj,EM_RoleValue_VocCount,1 )
	local MessageString = "[SC_202831_1][$SETVAR1="..NewVocAmount.."]"	--�r��զX
	ScriptMessage( Obj, Obj, 0 , MessageString , C_YELLOW )-- �A�ثe�i���o¾�~�ƼW�[�� [$VAR1] �ӡC
	SetFlag(Obj,545160,1)				--�ĤT¾�~���
end

function LuaS_118560_ConversationPlot()
	local Obj = OwnerID()
	if	CheckBuff(Obj,620013)==false	then			--���ȫD�i�椤
		LoadQuestOption(Obj);
		if	CheckAcceptQuest(Obj,424346)==true	and		--������
			CheckFlag(Obj,545157)==false		then	--������
			AddSpeakOption(Obj,Obj,"[SC_424346_04]","LuaS_118560_AcceptPlot", 0 );
			AddSpeakOption(Obj,Obj,"[SC_424346_05]","LuaS_118560_RejectPlot", 0 );
		end
	else
		CloseSpeak(Obj);								--���ȶi�椤;�������
	end
end

function LuaS_118560_AcceptPlot()
	local Obj = OwnerID();
	CloseSpeak(Obj);								--�������
	if	CheckAcceptQuest(Obj,424346)==true	then	--���Ȥ��b
		AddBuff(Obj,620013,1,10)
		BeginPlot(Obj,"LuaS_118560_Complete424346",0)
	end
end

function LuaS_118560_RejectPlot()
	local Obj = OwnerID();
	if	CheckAcceptQuest(Obj,424346)==true	then			--���Ȥ��b
		SetSpeakDetail( Obj,"[SC_424346_07]");
		AddSpeakOption(Obj,Obj,"[SC_424346_04]","LuaS_118560_AcceptPlot",0)
	else
		CloseSpeak(Obj)										--���Ȥ��b;�������
	end
end


function LuaS_118560_Complete424346()
	local Obj = OwnerID()
	ScriptMessage( Obj, Obj, 1, "[SC_424346_00]", C_YELLOW )
	ScriptMessage( Obj, Obj, 0, "[SC_424346_00]", C_YELLOW )
	sleep(20)
	ScriptMessage( Obj, Obj, 1, "[SC_424346_01]", C_YELLOW )
	ScriptMessage( Obj, Obj, 0, "[SC_424346_01]", C_YELLOW )
	sleep(30)
	ScriptMessage( Obj, Obj, 1, "[SC_424346_02]", C_YELLOW )
	ScriptMessage( Obj, Obj, 0, "[SC_424346_02]", C_YELLOW )
	sleep(30)
	ScriptMessage( Obj, Obj, 1, "[SC_424346_03]", C_YELLOW )
	ScriptMessage( Obj, Obj, 0, "[SC_424346_03]", C_YELLOW )
	sleep(20)
	SetFlag(Obj,545157,1)
	CancelBuff(Obj,620013)
end

--������ƶ�����A
--�����ɦ�17��
function LuaS_424018_ReturnQuestPlot()
	local Target = TargetID()
	AddEXP(Target,16000)
end

function LuaS_423867_ReturnQuestPlot()
	local Target = TargetID()
	AddEXP(Target,8500)
end

function LuaS_423860_ReturnQuestPlot()
	local Target = TargetID()
	AddEXP(Target,3500)
end

function LuaS_423783_ReturnQuestPlot()
	local Target = TargetID()
	AddEXP(Target,1100)
end



--�������w��
--�������A�A���A�|���[�T�تk�N���X
--�C�Ӫk�N���n���w�ϰ�ϥΩM�ؼ�
function LuaS_423854_GetQPlot()--�������Ȱ���
	local Obj = OwnerID()
	local Target = TargetID()
	AddBuff(Target ,509158,0,-1)
end

function LuaS_423854_OverQPlot()--�������Ȱ���
	local Obj = OwnerID()
	local Target = TargetID()
	CancelBuff(Target ,509158)
end


function LuaS_423854_SpellCheck(ToWho)--�k�N���X�ˬd
	local Obj = OwnerID()
	local Target = TargetID()
	local AllowMapID = 364
	if	DW_CheckMap(Obj,AllowMapID)==false	then
		ScriptMessage( Obj, Obj, 1, "[SC_101614_2]", 0 )--ĵ�i�T���G�A�{�b�٤���ϥΡI
		return false
	end
	local TargetType
	if	ToWho==nil	then
		TargetType = Obj
	else
		TargetType =ToWho
	end
	if	ReadRoleValue(Target,EM_RoleValue_OrgID)~=TargetType	then
		ScriptMessage( Obj, Obj, 1, "[EM_BAHU_3]", 0 )--ĵ�i�T���G�ؼп��~
		return false
	end
	return true
end

function LuaS_423854_InitialPlot()--���w�ԥX�ͼ@��
	local Obj = OwnerID()
	SetPlot(Obj,"dead","LuaS_423854_DeadPlot",0)
	local MaxHP = ReadRoleValue(Obj,EM_RoleValue_MaxHP)
	while true	do
		sleep(10)
		local HP = ReadRoleValue(Obj,EM_RoleValue_HP)
		if	(MaxHP - HP) > 10000	then
			AddRoleValue(Obj,EM_RoleValue_HP,20000)
		end
	end
end

function LuaS_423854_DeadPlot()--���w�Ԧ��`�@��
	local Obj = OwnerID()
	local Target = TargetID()
	local Killer = {}
	for i=0,HateListCount(Obj),1 do
		local TempID
		TempID = HateListInfo(Obj,i , EM_HateListInfoType_GItemID)
		if	ReadRoleValue(TempID,EM_RoleValue_IsPlayer)==1	then
			if	CheckAcceptQuest(TempID,423854)==true	then
				SetFlag(TempID,544746,1)
			end
			if	CheckCompleteQuest(TempID,423954)==false	and
				(CheckAcceptQuest(TempID,423854)==true or CheckCompleteQuest(TempID,423854)==true)	then
				GiveBodyItem(TempID,209211,1)
			end
		end
	end
	return true
end

function LuaS_423854_AcceptPlot()
	local Obj = TargetID()
	ScriptMessage( Obj, Obj, 0, "[SC_423954_4]", C_YELLOW )
	ScriptMessage( Obj, Obj, 2, "[SC_423954_4]", 0)
end

--�Ǫ��G�m��
--�s���B��
--�B����D�H�I�k
function DW_SlowPace_OutFight()
	local Obj = OwnerID()
	if	CheckBuff(Obj,509161)==false	then
		AddBuff(Obj,509161,0,-1)
	end
end


function LuaS_105184_SearchAll()
	local Obj = OwnerID()
	local NearNPC = {}
	NearNPC = SearchRangeNPC ( Obj , 120 )
	for i=0,table.getn(NearNPC),1 do
		local TempValue = NearNPC[i]
		if	ReadRoleValue(TempValue,EM_RoleValue_OrgID)==105178	and --�ؼХ��T
			ReadRoleValue(TempValue,EM_RoleValue_IsDead)==0		then--���s��
			if	HateListCount(TempValue)==0	and--�D�԰���
				ReadRoleValue(TempValue,EM_RoleValue_SpellMagicID)==0	then--�L�I�k
				BeginPlot(TempValue,"LuaS_105184_CheckEnterFight",0)
			end
		end
	end
end

function LuaS_105184_CheckEnterFight()
	local Obj = OwnerID()--�I�k��
	local Target = TargetID()--�B��
	if	CastSpell(Obj,Target,492184)==true	then --�`�J��q
		SetPlot(Obj,"range","LuaS_105184_RangePlot",100)
		while	HateListCount(Target)==0	and
			HateListCount(Obj)==0	and
			ReadRoleValue(Obj,EM_RoleValue_SpellMagicID)~=0	do
			sleep(5)
			if	HateListCount(Obj)~=0	then --�ۤv�b�԰���
				if	ReadRoleValue(Obj,EM_RoleValue_SpellMagicID)==492184	then
					MagicInterrupt(Obj)
				end
				return
			end
			if	HateListCount(Target)~=0	then -- �B���b�԰���
				local WillAttack = ReadRoleValue(Target,EM_RoleValue_AttackTargetID)
				SetAttack(Obj,WillAttack)
			end
		end
		MagicInterrupt(Obj)
		return
	else
		DeBugMSG(0,0,"Cast failed")
	end
end

function LuaS_105184_RangePlot()
	local Obj = OwnerID()
	local Target = TargetID()
	SetPlot(Target,"range","",0)
	MagicInterrupt(Target)
	SetAttack(Target,Obj)
end

--���\�@�y
--�\���ˬd
function LuaS_423781_0()
	local Obj = OwnerID()
	if	CountBodyItem(Obj,209014)>0	then
		return 1
	end
	return -1
end

--PE���y���~
--�ɥR�g���
--�����Ү�

function LuaS_209231_ExecutePlot()
	local Obj = OwnerID()
	AddRoleValue(Obj,EM_RoleValue_EXP,DW_Rand(999))
	AddRoleValue(Obj,EM_RoleValue_Money,DW_Rand(399))
	if	DW_CheckBackpage(Obj,1)==true	then
		local Main_Voc = ReadRoleValue(Obj,EM_RoleValue_VOC)
		local Sub_Voc = ReadRoleValue(Obj,EM_RoleValue_VOC_SUB)
		if	Sub_Voc >0	then --�Y����¾
			local Lv_Progress = DW_EliteSkill_CheckLv(Main_Voc,Sub_Voc)
			local Key_Progress = DW_EliteSkill_CheckProgress(Main_Voc,Sub_Voc)
			if	Key_Progress == 10000	then
DeBugMSG(0,0,"Had Learn All")
				return true
			end
			if	Lv_Progress >= Key_Progress	then --���Ťw��F���e
				local Prove_Book = DW_EliteSkill_ItemNum(Key_Progress)
				if	CountBodyItem(Obj,Prove_Book)==0	then --���W�٨S���Ү�
					GiveBodyItem(Obj,Prove_Book,1)
				end
			end
		else
DeBugMSG(0,0,"No Sub")
		end
	end
	return true
end


--�ժ����B
--���A�B��
--�����׶�

function LuaS_424016_CheckPlot()
	local Obj = OwnerID()
	local Target = TargetID()
	if	CheckDistance(Obj,Target, 100)==false	then													--�ؼФӻ�
		ScriptMessage( Obj, Obj, 1, "[SAY_420635_0]", 0 )--ĵ�i�T���Gĵ�i�I�A���o�ӻ��F�I
		return false
	end
	if	CheckRelation( Obj , Target , EM_CheckRelationType_Attackable  )==false	then					--�ؼЬO�͵���
		ScriptMessage( Obj, Obj, 1, "[SC_422202_5]", 0 )--ĵ�i�T���G�ؼп��~�I
		return false
	end
	if	CheckFlag(Obj,544973)	then																	--�w�g�ϥιL
		ScriptMessage( Obj, Obj, 1, "[SC_207464_0]", 0 )--ĵ�i�T���G�A����A�ϥΦ����~�I
		return false
	end
	if	ReadRoleValue(Target,EM_RoleValue_HP)<=0	then												--�ؼФw��
		ScriptMessage( Obj, Obj, 1, "[SC_493625_2]", 0 )--ĵ�i�T���G�ؼФw���`
		return false
	end
	return true
end
function LuaS_424016_ExecutePlot()
	local Obj = OwnerID()
	local Target = TargetID()
	SysCastSpellLv(Obj,Target,497484,0)
	SetFlag(Obj,544973,1)
end
function LuaS_424020_CheckPlot()
	local Obj = OwnerID()
	local Target = TargetID()
	local MaxHP = ReadRoleValue(Target,EM_RoleValue_MaxHP)
	if	CheckDistance(Obj,Target, 100)==false	then													--�ؼФӻ�
		ScriptMessage( Obj, Obj, 1, "[SAY_420635_0]", 0 )--ĵ�i�T���Gĵ�i�I�A���o�ӻ��F�I
		return false
	end
	if	ReadRoleValue(Target,EM_RoleValue_OrgID)~=105184	then										--�ؼп��~
		ScriptMessage( Obj, Obj, 1, "[SC_422202_5]", 0 )--ĵ�i�T���G�ؼп��~�I
		return false
	end
	if	ReadRoleValue(Target,EM_RoleValue_HP)>(MaxHP*0.7)	then										--�ؼЪ���q�٤Ӧh
		ScriptMessage( Obj, Obj, 1, "[SC_101614_2]", 0 )--ĵ�i�T���G�A�{�b�٤���ϥΡI
		return false
	end
	if	ReadRoleValue(Target,EM_RoleValue_HP)<=0	then												--�ؼФw��
		ScriptMessage( Obj, Obj, 1, "[SC_493625_2]", 0 )--ĵ�i�T���G�ؼФw���`
		return false
	end
	return true
end
function LuaS_424020_ExecutePlot()
	local Obj = OwnerID()
	local Target = TargetID()
	sleep(10)
	CallPlot(Target,"LuaFunc_ResetObj",Target)
	GiveBodyItem(Obj,209423,1)
end

function LuaS_424017_RangePlot()
	local Obj = OwnerID()
	SetPlot(Obj,"range","LuaS_424017_RangeExecute",200)
end
function LuaS_424017_RangeExecute()
	local Obj = OwnerID()
	if	CheckFlag(Obj,544974)==false	then
		SetFlag(Obj,544974,1)
	end
end

--�ֳt�ɯ�
function DW_LvUpUp(Lv,Me)--( �n���ɦܦh�֯�,��1�OTargetID()�ۤv���ζ� )
	local Obj
	if	Me==nil	then
		Obj=OwnerID()
	elseif	Me==1	then
		Obj=TargetID()
	else
		Obj=OwnerID()
	end
	local Temp=ReadRoleValue(Obj,EM_RoleValue_Lv)
	if	Temp<Lv	then
		WriteRoleValue(Obj,EM_RoleValue_Lv,Lv)
		SysCastSpellLv(Obj,Obj,497488,0)
	end
end


--��Ԫ��\��

function LuaS_423909_AcceQuePlot()
	local Obj = OwnerID()			--������
	local Target = TargetID()		--���a
	local Pet = DW_CreateObjEX("obj",105624,Target)
	WriteRoleValue(Pet ,EM_RoleValue_IsWalk,0)
	Hide(Pet )
	Show(Pet ,0)
	CallPlot(Pet,"LuaS_423909_ExecuteOnPet",Target)
end

function LuaS_423909_ExecuteOnPet(Target)
	local Obj = OwnerID()
	MoveToFlagEnabled(Obj, false)	--�������޼@��
	local ATarget = ReadRoleValue(Target,EM_RoleValue_AttackTargetID)
	while	true	do
		sleep(10)
----------------------------------------
--�P�_����
----------------------------------------
		if	Target~=nil	then
			if	ReadRoleValue(Target,EM_RoleValue_IsDead)==1 				or	--���a���F
				LuaS_111256_ZoneID(ReadRoleValue(Target,EM_RoleValue_ZoneID))~=13	or	--���b13
				CheckCompleteQuest(Target,423909)==true					or	--�w��������
				CheckAcceptQuest(Target,423909)==false					then	--������
				break
			end
		else
			break
		end
----------------------------------------
--��ʧP�_��
----------------------------------------
		ATarget = ReadRoleValue(Target,EM_RoleValue_AttackTargetID)
		local IsInFight = HateListCount(Obj)
		if	ATarget==0 and IsInFight==0	then					--�D�԰����A
			if	CheckDistance(Obj,Target, 50)==false	then
				DW_MoveRand(Obj,60,1,Target)
			else
				StopMove(Obj,false)			
			end
		else
			if	HateListCount(Obj)==0	then
				StopMove(Obj,false)
				if	CheckDistance(Obj,Target, 50)==false	then
					DW_ChangePosToObj(Obj,Target)
				end
				SetAttack(Obj,ATarget)
			end
		end
	end
	DeBugMSG(0,0,"Del!!")
	DelObj(Obj)
	return
end



--���ޮ�����
--��ŧ���s����
---------------------
--��l�@��;���w�a�I;�i�����ŧi
---------------------
function LuaS_423916_DatePointInit()
	local Obj = OwnerID()
	Zone14_423916_DatePoint = Obj
end

function LuaS_423916_ItemCheck()
	local Obj = OwnerID()
	local Target = TargetID()
	if	ReadRoleValue(Obj,EM_RoleValue_IsDead)==1	then
		return false
	end
	---------------------
	--���ޮ�����
	---------------------
	if	CheckAcceptQuest(Obj,423916)==true	then
		if	CheckFlag(Obj,545000)==true	then
			return false
		end
		if	DW_CheckDis(Obj,780085,1,100)==false	then
			ScriptMessage( Obj, Obj, 0, "[SC_423916_05]", C_Red )
			return false
		end
		return true
	---------------------
	--��ŧ���s����
	---------------------
	elseif	CheckAcceptQuest(Obj,423917)==true	then
		if	CheckFlag(Obj,545011)==true	then
			return false
		end
		if	DW_CheckDis(Obj,780898,12,150)==false	then
			ScriptMessage( Obj, Obj, 1, "[SC_102623_17]", 0 )--ĵ�i�T���G�ؼйL���I
			return false
		end
		if	CheckDistance(Obj,Target, 150)==false	then
			ScriptMessage( Obj, Obj, 2, "[SC_102623_17]", C_Red )		--�ؼйL��
			return false
		end
		if	ReadRoleValue(Target,EM_RoleValue_IsDead)==1	then
			ScriptMessage( Obj, Obj, 2, "[SC_422565_2]", C_Red )		--�ؼФw��
			return false
		end
		if	ReadRoleValue(Target,EM_RoleValue_OrgID)~=105285	then
			ScriptMessage( Obj, Obj, 2, "[SC_422203_4]", C_Red )		--�ؼп��~
			return false
		end
		if	HateListCount(Target)==0	then
			ScriptMessage( Obj, Obj, 2, "[SC_423916_10]", C_Red )		--�ؼлݭn�B��԰����A�U
			return false
		end
		return true
	end
	return false
end

function LuaS_423916_ItemExecute()
	local Obj = OwnerID()
	local Target = TargetID()
	---------------------
	--���ޮ�����
	---------------------
	if	CheckAcceptQuest(Obj,423916)==true	then	
		if	ReadRoleValue(Zone14_423916_DatePoint,EM_RoleValue_Register1)==99	then
			if	CheckDistance(Obj,ReadRoleValue(Zone14_423916_DatePoint,EM_RoleValue_Register2), 300)==false	then
				CallPlot(Obj,"DW_ChooseOneFromTwo",Obj,"[SC_QUESTEXECUTESURE_1]","LuaS_423916_WantGroupPlot","LuaS_423916_RejectGroupPlot")
			end
		else
			WriteRoleValue(Zone14_423916_DatePoint,EM_RoleValue_Register1,99)				--�аO���ȶ}�l
			local HigherVenLady = DW_CreateObjEX("flag",105361,780085,2)
			WriteRoleValue(Zone14_423916_DatePoint,EM_RoleValue_Register2,HigherVenLady)	--�O�������⪺id
			SetPlot(Obj,"dead","LuaS_423916_LadyDeadPlot",0)
			BeginPlot(HigherVenLady,"LuaS_423916_LadyFollowPlot",0)							--�����⪺�ˬd�@��
			Say(HigherVenLady,"[SC_423916_01]")												--�����⪺���
			ScriptMessage( Obj, Obj, 0, "[SC_423916_02]", 0 )								--����
		end
	---------------------
	--��ŧ���s����
	---------------------
	elseif	CheckAcceptQuest(Obj,423917)==true	then
		if	ReadRoleValue(Zone14_423916_DatePoint,EM_RoleValue_Register3)==0	then		--�ֹ�аO
			local FightLady = DW_CreateObjEX("obj",105361,obj,1,50)							--�ХX������
			DeBugMSG(0,0,"FightLady="..FightLady)
			WriteRoleValue(Zone14_423916_DatePoint,EM_RoleValue_Register3,FightLady)		--�аO��ŧ�}�l
			SetPlot(FightLady,"dead","LuaS_423916_IfFightLadyDead",0)						--�����⪺���`�@��
			CallPlot(FightLady,"LuaS_423916_PlotOfFightLady",Target)						--������԰��@��
			SysCastSpellLv(Target,FightLady,496266,1)										--�ܦ����
		end
	else
		return false
	end
end

function LuaS_423916_WantGroupPlot()
	local Obj = OwnerID()
	local Target = ReadRoleValue(Zone14_423916_DatePoint,EM_RoleValue_Register2)
	if	Target~=nil	then
		if	CheckID(Target)==true	then
			if	ReadRoleValue(Target,EM_RoleValue_IsDead)==0	then
				DW_ChangePosToObj(Obj,Target)
				return
			end
		end
	end
	ScriptMessage( Obj, Obj, 0, "[SC_423916_06]", C_Red )
end

function LuaS_423916_RejectGroupPlot()
	local Obj = OwnerID()
	ScriptMessage( Obj, Obj, 0, "[SC_423916_04]", C_Yellow )
end

function LuaS_423916_LadyFollowPlot()
	local Obj = OwnerID()
	local Target = TargetID()
	AddBuff(Obj,509554,0,240)		--�����⪺�@��
	MoveToFlagEnabled(Obj,false)	--�������޼@��
	local ATarget = ReadRoleValue(Target,EM_RoleValue_AttackTargetID)
	while	true	do
		sleep(10)
----------------------------------------
--�P�_����
----------------------------------------
		if	Target~=nil	then
			if	ReadRoleValue(Target,EM_RoleValue_IsDead)==1 				or			--���a���F
				LuaS_111256_ZoneID(ReadRoleValue(Target,EM_RoleValue_ZoneID))~=13	or	--���b13
				CheckAcceptQuest(Target,423916)==false					then			--������
				break
			end
		else
			break
		end
----------------------------------------
--��ʧP�_��
----------------------------------------
		ATarget = ReadRoleValue(Target,EM_RoleValue_AttackTargetID)
		local IsInFight = HateListCount(Obj)
		if	ATarget==0 and IsInFight==0	then								--�D�԰����A
			AttachObj( Obj , Target , 0 ,"p_hit_point01","p_hit_point02")	--���H
		else
			if	IsInFight==0	then										--�ۤv���i�J�԰�
				DetachObj(Obj)												--����
				DW_ChangePosToObj(Obj,Target)
				SetAttack(Obj,ATarget)										--����
			end
		end
----------------------------------------
--�@���P�_��
----------------------------------------
		if	IsInFight==0	then											--�D�԰����A
			if	DW_CheckDis(Obj,780086,1,100)==true		then
				SetModeEx(Obj,EM_SetModeType_Fight,false)
				DetachObj(Obj)
				Say(Obj,"[SC_423916_03]")									--�x��
				DW_MoveToFlag( Obj , 780086,1,0 )
				local Player = SearchRangePlayer ( Obj , 250 )
				for index,value in pairs(Player) do
					if	ReadRoleValue(value,EM_RoleValue_IsPlayer)==1	then
						if	CheckAcceptQuest(value,423916)==true	and	ReadRoleValue(Obj,EM_RoleValue_IsDead)==0	then
							SetFlag(value,545000,1)
						end
					end
				end
				break
			end
			if	CheckBuff(Obj,509554)==false	then						--�@�ߥΧ�
				ScriptMessage( Obj, 0, 2, "[SC_423916_09]", C_Yellow )
				ScriptMessage( Obj, 0, 0, "[SC_423916_09]", C_Yellow )
				break
			end
		end
	end
	WriteRoleValue(Zone14_423916_DatePoint,EM_RoleValue_Register1,0)		--���m�аO
	WriteRoleValue(Zone14_423916_DatePoint,EM_RoleValue_Register2,0)		--�M��id����
	LuaS_423916_ResetPlot()
	DelObj(Obj)
	return
end

function LuaS_423916_ResetPlot()
	local Player = SearchRangePlayer(Zone14_423916_DatePoint,300)
	for index,value in pairs(Player) do
		if	CheckAcceptQuest(value,423916)==true	then
			ScriptMessage( value, value, 0, "[SC_423916_12]", C_Yellow )
			ScriptMessage( value, value, 2, "[SC_423916_12]", C_Yellow )
		end
	end
end

function LuaS_423916_LadyDeadPlot()
	local Obj = OwnerID()
	WriteRoleValue(Zone14_423916_DatePoint,EM_RoleValue_Register1,0)		--���m�аO
	WriteRoleValue(Zone14_423916_DatePoint,EM_RoleValue_Register2,0)		--�M��id����
	LuaS_423916_ResetPlot()
end

function LuaS_423916_IfFightLadyDead()
	local Obj = OwnerID()
	WriteRoleValue(Zone14_423916_DatePoint,EM_RoleValue_Register3,0)		--�M��id����
	return true
end

function LuaS_423916_PlotOfFightLady(Target)
	local Obj = OwnerID()		--������
								--Target�O���s����
	while	true	do
		for i=1,2,1 do
			sleep(10)
			if	HateListCount(Obj)==0	then											--�԰�����
				local Player = SearchRangePlayer ( Obj , 350 )
				for index,value in pairs(Player) do
					if	CheckAcceptQuest(value,423917)==true	and
						ReadRoleValue(value,EM_RoleValue_IsDead)==0	then
						SetFlag(value,545011,1)
					end
				end
				Say(Obj,"[SC_423916_07]")												--�ܦn�I�u�O���\�������I�J�M�Ʊ��w�g�ѨM......
				sleep(30)
				Say(Obj,"[SC_423916_08]")												--���ڴN���^��a�A�A���ָ�ӡA�i�O�g���աI
				sleep(10)
				WriteRoleValue(Zone14_423916_DatePoint,EM_RoleValue_Register3,0)		--�M��id����
				DelObj(Obj)
			end
		end
		local HateListN = HateListCount(Target)
		for i=0,HateListN-1,1 do
			local TempID = HateListInfo(Target,i ,EM_HateListInfoType_GItemID)
			if	TempID~=nil	then
				if	ReadRoleValue(TempID,EM_RoleValue_IsPlayer)==1	then
					break
				end
			end
			if	i==HateListN-1	then
				WriteRoleValue(Zone14_423916_DatePoint,EM_RoleValue_Register3,0)		--�M��id����
				DelObj(Obj)																--�S���a;�h��
			end
		end
		sleep(10)
	end
end