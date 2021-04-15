
function LuaS_117449_0()
	local Obj = OwnerID();
	local Race = ReadRoleValue(Obj,EM_RoleValue_Race);
	if	Race >1	then
		SetSpeakDetail(Obj,"[SC_120515_A]");
		return;
	end
	LoadQuestOption(Obj)
	AddSpeakOption ( Obj, TargetID( ), "[SC_111454_12]" , "LuaS_117449_2", 0 ) 	--�ګܾ�ߦۤv���e�~�A�ڱN�i�H�Ǩ줰��ޯ�H
	AddSpeakOption(Obj,Obj,"[SC_111454_3]","LuaS_117449_1", 0 )--�ڭn�ǲ߷s���ޯ�
	AddSpeakOption(Obj,Obj,"[SC_111454_10]","LuaS_117449_5", 0 ) --�ڷQ���D���o�ޯ�ǲ��ҮѪ���k�C
end

function LuaS_117449_1()
	local Obj = OwnerID()
	local Lv = ReadRoleValue(Obj,EM_RoleValue_Lv)
	local Main_Voc = ReadRoleValue(Obj,EM_RoleValue_VOC)
	local Sub_Voc = ReadRoleValue(Obj,EM_RoleValue_VOC_SUB)
	if	Sub_Voc ==-1	then
		SetSpeakDetail( Obj,"[SC_111454_17]")--��I�ѰڡI�ڳ��M�S�`�N��A�S����¾�I
		return
	end
	local CheckResult = DW_EliteSkill_CheckProgress(Main_Voc,Sub_Voc)  -- �������n���~(����)
	local CheckLevel = DW_EliteSkill_CheckLv(Main_Voc,Sub_Voc) --�����H������
	local BookCondition
	if	CheckResult > 50	then--�����Ƿ| ���ξ�
		SetSpeakDetail( Obj,"[SC_111454_7]")--�b�A�{�b��¾�~�W�ڤw�g�S����i�H�ЧA���F�A�۫H�A���ӥi�H�гy�X��h�O�H��Y�����ݧa�I
		return
	end

	if	CheckLevel<=CheckResult	then --���Ť��� �����
		SetSpeakDetail( Obj,"[SC_111454_22]")--�Q�Ǩ�o�ӧޯ઺�ܡA�A�ٱo�V�O���ɦۤv���D��¾��󰪪��@�Ӽh�Ť~��C
		return
	end

	BookCondition = DW_EliteSkill_ItemNum(CheckResult) --�ݭn�Үѽs��
	if	CountBodyItem(Obj,BookCondition)==0	then --�S���Ү� �����
		SetSpeakDetail( Obj,"[SC_111454_26]")
		return
	end

	if	CheckResult == 50	then --50�ŵ׭^�ޯ઺����
		if	DW_EliteSkill_CheckProgress(Sub_Voc,Main_Voc)~=50	then--�t�@��]�n�� �_�h�����
			SetSpeakDetail( Obj,"[SC_111454_27]")--�ݭn�N��¾���Ҭɤ]���ɨ�ۦP�����Ǥ~��C
			return
		else
			DW_EliteSkill_Get(CheckResult,"GiveSub50Skill")--���o�t�@�䪺�׭^�ޯ�
		end
	end
--�ǲ�
	CloseSpeak(Obj)
	DelBodyItem(Obj,BookCondition,1)--�R���Ү�
	DW_EliteSkill_Get(CheckResult)--���o�׭^�ޯ�
	CastSpell(Obj,Obj,491010 )
	ScriptMessage( Obj, Obj, 2, "[SC_111454_9]", 0 )--���ߧA�I�A�Ǩ�s���ޯ�I
	ScriptMessage( Obj, Obj, 0, "[SC_111454_9]", 0 )
	return
end

function LuaS_117449_2()
	local Obj = OwnerID()
	local Voc = ReadRoleValue (Obj , EM_RoleValue_VOC )
	local SubVoc = ReadRoleValue(Obj , EM_RoleValue_VOC_SUB )
	if SubVoc  ~= -1 then
		SetSpeakDetail ( Obj , "[SC_111454_15]" )
		for i=3,10,1 do
			local Temp = i*5
			AddSpeakOption(Obj,Obj,"[SC_111454_13_"..Temp.."]","LuaS_117449_4("..Temp..")", 0 )
		end
	else
		SetSpeakDetail ( Obj , "[SC_111454_17]" )
	end
end

function LuaS_117449_3()
end

function LuaS_117449_4(Lv)
	local Obj = OwnerID()
	local Voc = ReadRoleValue (Obj , EM_RoleValue_VOC )
	local SubVoc = ReadRoleValue(Obj , EM_RoleValue_VOC_SUB )
	local Level = Lv
	local String
	if	Level==50	then
		if	Voc > SubVoc	then
			String = "SC_SKILL_"..Voc..SubVoc..Level
		else
			String = "SC_SKILL_"..SubVoc..Voc..Level
		end
	else
		String = "SC_SKILL_"..Voc..SubVoc..Level
	end
	SetSpeakDetail ( Obj , "["..String.."]"  )
	AddSpeakOption( Obj , TargetID() , "[SO_110150_2]" , "LuaS_117449_2" , 0 )
end

function LuaS_117449_5()
	local Obj = OwnerID()
	SetSpeakDetail( Obj,"[SC_111454_15]")
	AddSpeakOption( Obj , TargetID() , "[SO_110150_2]" , "LuaS_117449_0" , 0 )
end