------------------------------------------------------------------------------------------------------------------------------------------------�׷Ҥ��Ψ禡exp
function LuaFunc_HouseTrainGetEXP(average)		--/*average�������ƧY�������
	local rand = rand( 4 )+1

	if rand == 1 then
		CastSpell(OwnerID(),OwnerID(),492441)
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_LEARN_1") , 0 )	--/*�A�b�\Ū���ɭԺεۤF�A�եծ��O�F�ɶ�
		local value = average*(1/3)
	--	say(OwnerID(), "VALUE ="..value)
		AddEXP( OwnerID() , value );
		sleep(5)
	elseif rand == 2 then

		CastSpell(OwnerID(),OwnerID(),492442)
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_LEARN_2") , 0 )	--/*�A�^�^��Ū�F�@�M�A�����\�h�a��ݤ���
		local value = average*(2/3)
	--	say(OwnerID(), "VALUE ="..value)
		AddEXP( OwnerID() , value );
		sleep(5)
	elseif rand == 3 then
		CastSpell(OwnerID(),OwnerID(),492443)
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_LEARN_3") , 0 )	--/*�A���V�O���A���H��í�w����

		local value = average*(3/3)
	--	say(OwnerID(), "VALUE ="..value)
		AddEXP( OwnerID() , value );
		sleep(5)
	elseif rand == 4 then
		CastSpell(OwnerID(),OwnerID(),492444)
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_LEARN_4") , 0 )	--/*�A���p�����鳻�AŪ�_�ѨӨƥb�\��

		local value = average*(4/3)
	--	say(OwnerID(), "VALUE ="..value)
		AddEXP( OwnerID() , value );

		sleep(5)
	end
end
------------------------------------------------------------------------------------------------------------------------------------------------�׷Ҥ��Ψ禡tp
function LuaFunc_HouseTrainGetTP(average)		--/*average�������ƧY�������
	local rand = rand( 4 )+1
	local a = average*1/3
	local b = average*2/3
	local c = average*3/3
	local d = average*4/3
	if rand == 1 then
	CastSpell(OwnerID(),OwnerID(),492441)
	ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_LEARN_1") , 0 )	--/*�A�b�\Ū���ɭԺεۤF�A�եծ��O�F�ɶ�
	local SayString = "[SC_LEARNTP][$SETVAR1 = "..a.."]"
	ScriptMessage( OwnerID(), OwnerID(), 0, SayString , 0 )	--/*�A��o�H�I
	AddRoleValue( OwnerID() , EM_RoleValue_TpExp, a );
	sleep(5)
	elseif rand == 2 then
	CastSpell(OwnerID(),OwnerID(),492442)
	ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_LEARN_2") , 0 )	--/*�A�^�^��Ū�F�@�M�A�����\�h�a��ݤ���
	local SayString = "[SC_LEARNTP][$SETVAR1 = "..b.."]"
	ScriptMessage( OwnerID(), OwnerID(), 0, SayString , 0 )	--/*�A��o�H�I
	AddRoleValue( OwnerID() , EM_RoleValue_TpExp, b );
	sleep(5)
	elseif rand == 3 then
	CastSpell(OwnerID(),OwnerID(),492443)
	ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_LEARN_3") , 0 )	--/*�A���V�O���A���H��í�w����
	local SayString = "[SC_LEARNTP][$SETVAR1 = "..c.."]"
	ScriptMessage( OwnerID(), OwnerID(), 0, SayString , 0 )	--/*�A��o�H�I
	AddRoleValue( OwnerID() , EM_RoleValue_TpExp, c );
	sleep(5)
	elseif rand == 4 then
	CastSpell(OwnerID(),OwnerID(),492444)
	ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_LEARN_4") , 0 )	--/*�A���p�����鳻�AŪ�_�ѨӨƥb�\��
	local SayString = "[SC_LEARNTP][$SETVAR1 = "..d.."]"
	ScriptMessage( OwnerID(), OwnerID(), 0, SayString , 0 )	--/*�A��o�H�I
	AddRoleValue( OwnerID() , EM_RoleValue_TpExp, d );
	sleep(5)
	end
end
------------------------------------------------------------------------------------------------------------------------------------------------�׷Ҥ��Ψ禡�Ķ��j��
function LuaFunc_HouseTrainRandMLH(average)		--/*average�������ƧY�������
	local ran = Rand( 4 )+1
	local a = average*1/3
	local b = average*2/3
	local c = average*3/3
	local d = average*4/3
	local e = Rand( 3 )+1
	local skill = ""
	if e == 1 then
		skill = EM_SkillValueType_Mining
		name = "[SYS_SKILLNAME_MINING]"
	elseif e == 2 then
		skill = EM_SkillValueType_Lumbering
		name = "[SYS_SKILLNAME_LUMBERING]"
	elseif e == 3 then
		skill = EM_SkillValueType_Herblism
		name = "[SYS_SKILLNAME_HERBLISM]"
	end
	if ran == 1 then
	CastSpell(OwnerID(),OwnerID(),492441)
	ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_LEARN_1") , 0 )	--/*�A�b�\Ū���ɭԺεۤF�A�եծ��O�F�ɶ�
	local SayString = "[SC_SOLAN][$SETVAR1 = [SC_ALITTLE] ][$SETVAR2 = "..name.." ]"
	ScriptMessage( OwnerID(), OwnerID(), 0, SayString , 0 )	--/*�A��o�H�I
	AddSkillValue( OwnerID() , skill, a );
	sleep(5)
	elseif ran == 2 then
	CastSpell(OwnerID(),OwnerID(),492442)
	ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_LEARN_2") , 0 )	--/*�A�^�^��Ū�F�@�M�A�����\�h�a��ݤ���
	local SayString = "[SC_SOLAN][$SETVAR1 = [SC_FEW] ][$SETVAR2 = "..name.." ]"
	ScriptMessage( OwnerID(), OwnerID(), 0, SayString , 0 )	--/*�A��o�H�I
	AddSkillValue( OwnerID() , skill, b );
	sleep(5)
	elseif ran == 3 then
	CastSpell(OwnerID(),OwnerID(),492443)
	ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_LEARN_3") , 0 )	--/*�A���V�O���A���H��í�w����
	local SayString = "[SC_SOLAN][$SETVAR1 = [SC_ALOT] ][$SETVAR2 = "..name.." ]"
	ScriptMessage( OwnerID(), OwnerID(), 0, SayString , 0 )	--/*�A��o�H�I
	AddSkillValue( OwnerID() , skill, c );
	sleep(5)
	elseif ran == 4 then
	CastSpell(OwnerID(),OwnerID(),492444)
	ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_LEARN_4") , 0 )	--/*�A���p�����鳻�AŪ�_�ѨӨƥb�\��
	local SayString = "[SC_SOLAN][$SETVAR1 = [SC_MUCH] ][$SETVAR2 = "..name.." ]"
	ScriptMessage( OwnerID(), OwnerID(), 0, SayString , 0 )	--/*�A��o�H�I
	AddSkillValue( OwnerID() , skill, d );

	sleep(5)
	end
end