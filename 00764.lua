------------------------------------------------------------------------------------------------------------------------------------------------�׷Ҥ��Ψ禡��
function LuaFunc_HouseTrainHerblism(average)		--/*average�������ƧY�������
	local rand = rand( 4 )+1
	local a = average*1/3
	local b = average*2/3
	local c = average*3/3
	local d = average*4/3
	if rand == 1 then
	CastSpell(OwnerID(),OwnerID(),492441)
	ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_LEARN_1") , 0 )	--/*�A�b�\Ū���ɭԺεۤF�A�եծ��O�F�ɶ�
	local SayString = "[SC_HERBLISM][$SETVAR1 = [SC_ALITTLE] ]"
	ScriptMessage( OwnerID(), OwnerID(), 0, SayString , 0 )	--/*�A��o�H�I
	AddSkillValue( OwnerID() , EM_SkillValueType_Herblism, a );
	sleep(5)
	elseif rand == 2 then
	CastSpell(OwnerID(),OwnerID(),492442)
	ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_LEARN_2") , 0 )	--/*�A�^�^��Ū�F�@�M�A�����\�h�a��ݤ���
	local SayString = "[SC_HERBLISM][$SETVAR1 = [SC_FEW] ]"
	ScriptMessage( OwnerID(), OwnerID(), 0, SayString , 0 )	--/*�A��o�H�I
	AddSkillValue( OwnerID() , EM_SkillValueType_Herblism, b );
	sleep(5)
	elseif rand == 3 then
	CastSpell(OwnerID(),OwnerID(),492443)
	ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_LEARN_3") , 0 )	--/*�A���V�O���A���H��í�w����
	local SayString = "[SC_HERBLISM][$SETVAR1 = [SC_ALOT] ]"
	ScriptMessage( OwnerID(), OwnerID(), 0, SayString , 0 )	--/*�A��o�H�I
	AddSkillValue( OwnerID() , EM_SkillValueType_Herblism, c );
	sleep(5)
	elseif rand == 4 then
	CastSpell(OwnerID(),OwnerID(),492444)
	ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_LEARN_4") , 0 )	--/*�A���p�����鳻�AŪ�_�ѨӨƥb�\��
	local SayString = "[SC_HERBLISM][$SETVAR1 = [SC_MUCH] ]"
	ScriptMessage( OwnerID(), OwnerID(), 0, SayString , 0 )	--/*�A��o�H�I
	AddSkillValue( OwnerID() , EM_SkillValueType_Herblism, d );
	sleep(5)
	end
end
------------------------------------------------------------------------------------------------------------------------------------------------�׷Ҥ��Ψ禡��
function LuaFunc_HouseTrainLumbering(average)		--/*average�������ƧY�������
	local rand = rand( 4 )+1
	local a = average*1/3
	local b = average*2/3
	local c = average*3/3
	local d = average*4/3
	if rand == 1 then
	CastSpell(OwnerID(),OwnerID(),492441)
	ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_LEARN_1") , 0 )	--/*�A�b�\Ū���ɭԺεۤF�A�եծ��O�F�ɶ�
	local SayString = "[SC_LUMBERING][$SETVAR1 = [SC_ALITTLE] ]"
	ScriptMessage( OwnerID(), OwnerID(), 0, SayString , 0 )	--/*�A��o�H�I
	AddSkillValue( OwnerID() , EM_SkillValueType_Lumbering, a );
	sleep(5)
	elseif rand == 2 then
	CastSpell(OwnerID(),OwnerID(),492442)
	ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_LEARN_2") , 0 )	--/*�A�^�^��Ū�F�@�M�A�����\�h�a��ݤ���
	local SayString = "[SC_LUMBERING][$SETVAR1 = [SC_FEW] ]"
	ScriptMessage( OwnerID(), OwnerID(), 0, SayString , 0 )	--/*�A��o�H�I
	AddSkillValue( OwnerID() , EM_SkillValueType_Lumbering, b );
	sleep(5)
	elseif rand == 3 then
	CastSpell(OwnerID(),OwnerID(),492443)
	ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_LEARN_3") , 0 )	--/*�A���V�O���A���H��í�w����
	local SayString = "[SC_LUMBERING][$SETVAR1 = [SC_ALOT] ]"
	ScriptMessage( OwnerID(), OwnerID(), 0, SayString , 0 )	--/*�A��o�H�I
	AddSkillValue( OwnerID() , EM_SkillValueType_Lumbering, c );
	sleep(5)
	elseif rand == 4 then
	CastSpell(OwnerID(),OwnerID(),492444)
	ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_LEARN_4") , 0 )	--/*�A���p�����鳻�AŪ�_�ѨӨƥb�\��
	local SayString = "[SC_LUMBERING][$SETVAR1 = [SC_MUCH] ]"
	ScriptMessage( OwnerID(), OwnerID(), 0, SayString , 0 )	--/*�A��o�H�I
	AddSkillValue( OwnerID() , EM_SkillValueType_Lumbering, d );
	sleep(5)
	end
end
------------------------------------------------------------------------------------------------------------------------------------------------�׷Ҥ��Ψ禡�q
function LuaFunc_HouseTrainMining(average)		--/*average�������ƧY�������
	local rand = rand( 4 )+1
	local a = average*1/3
	local b = average*2/3
	local c = average*3/3
	local d = average*4/3
	if rand == 1 then
	CastSpell(OwnerID(),OwnerID(),492441)
	ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_LEARN_1") , 0 )	--/*�A�b�\Ū���ɭԺεۤF�A�եծ��O�F�ɶ�
	local SayString = "[SC_MINING][$SETVAR1 = [SC_ALITTLE] ]"
	ScriptMessage( OwnerID(), OwnerID(), 0, SayString , 0 )	--/*�A��o�H�I
	AddSkillValue( OwnerID() , EM_SkillValueType_Mining, a );
	sleep(5)
	elseif rand == 2 then
	CastSpell(OwnerID(),OwnerID(),492442)
	ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_LEARN_2") , 0 )	--/*�A�^�^��Ū�F�@�M�A�����\�h�a��ݤ���
	local SayString = "[SC_MINING][$SETVAR1 = [SC_FEW] ]"
	ScriptMessage( OwnerID(), OwnerID(), 0, SayString , 0 )	--/*�A��o�H�I
	AddSkillValue( OwnerID() , EM_SkillValueType_Mining, b );
	sleep(5)
	elseif rand == 3 then
	CastSpell(OwnerID(),OwnerID(),492443)
	ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_LEARN_3") , 0 )	--/*�A���V�O���A���H��í�w����
	local SayString = "[SC_MINING][$SETVAR1 = [SC_ALOT] ]"
	ScriptMessage( OwnerID(), OwnerID(), 0, SayString , 0 )	--/*�A��o�H�I
	AddSkillValue( OwnerID() , EM_SkillValueType_Mining, c );
	sleep(5)
	elseif rand == 4 then
	CastSpell(OwnerID(),OwnerID(),492444)
	ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_LEARN_4") , 0 )	--/*�A���p�����鳻�AŪ�_�ѨӨƥb�\��
	local SayString = "[SC_MINING][$SETVAR1 = [SC_MUCH] ]"
	ScriptMessage( OwnerID(), OwnerID(), 0, SayString , 0 )	--/*�A��o�H�I
	AddSkillValue( OwnerID() , EM_SkillValueType_Mining, d );
	sleep(5)
	end
end