------------------------------------------------------------------------------------------------------------------------------------------------�׷Ҥ��Ψ禡���m��
function LuaFunc_HouseTrainWapenSkill(average,skill)		--/*average�������ƧY�������
	local ran = Rand( 4 )+1
	local a = average*1/3
	local b = average*2/3
	local c = average*3/3
	local d = average*4/3
	local e = ""
	if skill == EM_SkillValueType_Unarmed then
		e = "[SYS_SKILLNAME_700]"
	elseif skill == EM_SkillValueType_Blade then
		e = "[SYS_SKILLNAME_701]"
	elseif skill == EM_SkillValueType_Dagger then
		e = "[SYS_SKILLNAME_702]"
	elseif skill == EM_SkillValueType_Wand then
		e = "[SYS_SKILLNAME_703]"
	elseif skill == EM_SkillValueType_Axe then
		e = "[SYS_SKILLNAME_704]"
	elseif skill == EM_SkillValueType_Bludgeon then
		e = "[SYS_SKILLNAME_705]"
	elseif skill == EM_SkillValueType_Claymore then
		e = "[SYS_SKILLNAME_706]"
	elseif skill == EM_SkillValueType_Staff then
		e = "[SYS_SKILLNAME_707]"
	elseif skill == EM_SkillValueType_2H_Axe then
		e = "[SYS_SKILLNAME_708]"
	elseif skill == EM_SkillValueType_2H_Hammer then
		e = "[SYS_SKILLNAME_709]"
	elseif skill == EM_SkillValueType_Polearm then
		e = "[SYS_SKILLNAME_710]"
	elseif skill == EM_SkillValueType_Bow then
		e = "[SYS_SKILLNAME_711]"
	elseif skill == EM_SkillValueType_CossBow then
		e = "[SYS_SKILLNAME_712]"
	elseif skill == EM_SkillValueType_Gun then
		e = "[SYS_SKILLNAME_713]"
	elseif skill == EM_SkillValueType_Define then
		e = "[SYS_SKILLNAME_714]"
	end
	if ran == 1 then
	CastSpell(OwnerID(),OwnerID(),492441)
	ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_LEARN_1") , 0 )	--/*�A�b�\Ū���ɭԺεۤF�A�եծ��O�F�ɶ�
	local SayString = "[SC_SOLAN][$SETVAR1 = [SC_ALITTLE] ][$SETVAR2 = "..e.." ]"
	ScriptMessage( OwnerID(), OwnerID(), 0, SayString , 0 )	--/*�A��o�H�I
	AddSkillValue( OwnerID() , skill, a );
	sleep(5)
	elseif ran == 2 then
	CastSpell(OwnerID(),OwnerID(),492442)
	ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_LEARN_2") , 0 )	--/*�A�^�^��Ū�F�@�M�A�����\�h�a��ݤ���
	local SayString = "[SC_SOLAN][$SETVAR1 = [SC_FEW] ][$SETVAR2 = "..e.." ]"
	ScriptMessage( OwnerID(), OwnerID(), 0, SayString , 0 )	--/*�A��o�H�I
	AddSkillValue( OwnerID() , skill, b );
	sleep(5)
	elseif ran == 3 then
	CastSpell(OwnerID(),OwnerID(),492443)
	ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_LEARN_3") , 0 )	--/*�A���V�O���A���H��í�w����
	local SayString = "[SC_SOLAN][$SETVAR1 = [SC_ALOT] ][$SETVAR2 = "..e.." ]"
	ScriptMessage( OwnerID(), OwnerID(), 0, SayString , 0 )	--/*�A��o�H�I
	AddSkillValue( OwnerID() , skill, c );
	sleep(5)
	elseif ran == 4 then
	CastSpell(OwnerID(),OwnerID(),492444)
	ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_LEARN_4") , 0 )	--/*�A���p�����鳻�AŪ�_�ѨӨƥb�\��
	local SayString = "[SC_SOLAN][$SETVAR1 = [SC_MUCH] ][$SETVAR2 = "..e.." ]"
	ScriptMessage( OwnerID(), OwnerID(), 0, SayString , 0 )	--/*�A��o�H�I
	AddSkillValue( OwnerID() , skill, d );
	sleep(5)
	end
end
------------------------------------------------------------------------------------------------------------------------------------------------�׷Ҥ��Ψ禡�Ͳ���
function LuaFunc_HouseTrainLiveSkill(average,skill)		--/*average�������ƧY�������
	local ran = Rand( 4 )+1
	local a = average*1/3
	local b = average*2/3
	local c = average*3/3
	local d = average*4/3
	local e = ""
	if skill == EM_SkillValueType_BlackSmith then
		e = "[SYS_SKILLNAME_BLACKSMITH]"
	elseif skill == EM_SkillValueType_Carpenter then
		e = "[SYS_SKILLNAME_CARPENTER]"
	elseif skill == EM_SkillValueType_MakeArmor then
		e = "[SYS_SKILLNAME_MAKEARMOR]"
	elseif skill == EM_SkillValueType_Tailor then
		e = "[SYS_SKILLNAME_TAILOR]"
	elseif skill == EM_SkillValueType_Cook then
		e = "[SYS_SKILLNAME_COOK]"
	elseif skill == EM_SkillValueType_Alchemy then
		e = "[SYS_SKILLNAME_ALCHEMY]"
	end
	if ran == 1 then
	CastSpell(OwnerID(),OwnerID(),492441)
	ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_LEARN_1") , 0 )	--/*�A�b�\Ū���ɭԺεۤF�A�եծ��O�F�ɶ�
	local SayString = "[SC_LEARNGET][$SETVAR1 = [SC_ALITTLE] ][$SETVAR2 = "..e.." ]"
	ScriptMessage( OwnerID(), OwnerID(), 0, SayString , 0 )	--/*�A��o�H�I
	AddSkillValue( OwnerID() , skill, a );
	sleep(5)
	elseif ran == 2 then
	CastSpell(OwnerID(),OwnerID(),492442)
	ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_LEARN_2") , 0 )	--/*�A�^�^��Ū�F�@�M�A�����\�h�a��ݤ���
	local SayString = "[SC_LEARNGET][$SETVAR1 = [SC_FEW] ][$SETVAR2 = "..e.." ]"
	ScriptMessage( OwnerID(), OwnerID(), 0, SayString , 0 )	--/*�A��o�H�I
	AddSkillValue( OwnerID() , skill, b );
	sleep(5)
	elseif ran == 3 then
	CastSpell(OwnerID(),OwnerID(),492443)
	ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_LEARN_3") , 0 )	--/*�A���V�O���A���H��í�w����
	local SayString = "[SC_LEARNGET][$SETVAR1 = [SC_ALOT] ][$SETVAR2 = "..e.." ]"
	ScriptMessage( OwnerID(), OwnerID(), 0, SayString , 0 )	--/*�A��o�H�I
	AddSkillValue( OwnerID() , skill, c );
	sleep(5)
	elseif ran == 4 then
	CastSpell(OwnerID(),OwnerID(),492444)
	ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_LEARN_4") , 0 )	--/*�A���p�����鳻�AŪ�_�ѨӨƥb�\��
	local SayString = "[SC_LEARNGET][$SETVAR1 = [SC_MUCH] ][$SETVAR2 = "..e.." ]"
	ScriptMessage( OwnerID(), OwnerID(), 0, SayString , 0 )	--/*�A��o�H�I
	AddSkillValue( OwnerID() , skill, d );
	sleep(5)
	end
end