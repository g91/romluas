--�վ�ͬ��ޯ�
--/gm ? runplot Hao_Crafting_Set_Value

local g_ZoneID = 400;	-- �p��ID
local g_ReadTime = 600;	-- �ϥΫ᪺�\Ū�ɶ�(��� 0.1 ��)�A�w�]�� 60 ��A�H���������\Ū�ɶ��t�p�A�Ш��U�z Define ������... �~�ӭ���]�w�G�H���������C 6 �� 1 ���A��L���C 60 �� 1 ��...
local g_ReadSpeedUpBuffID = { 500150, 500151, 500152 }	-- 1�ѡB7�ѡB30�Ѥp�Φʬ�[�t�ľ�
local g_ReadSpeedUpRatio = 0.7;	-- �ϥδ����\Ū�t�׫�A���C���\Ū�ɶ����v
local g_ReadBookMagicID = 502086;	-- ������y���S��

-- �Ķ����ު�A�U�ŶZ�C������o����¦�g��ȡATable�����u�Ķ��g��ȡv
-- �A�Ω�D�H������
local g_GatherExpIndex = {};	-- ����Ѽ� = �N 1 �Ŵ����� 2 �Ū��ɶ��]�� 1 �����@����ƫ�վ㪺�����A�Ա��Ш���� - (6.4.0)�p�Φʬ��I�ƽվ�
g_GatherExpIndex[1] = 4.469;	-- 1 - 60�A���� = 1 - 60�ũһ��`�g��� / ����Ѽ� / 1440(1��=1440����) * (60/60)(�C���\Ū���/�C�������) /(1/3+2/3+3/3+4/3)/4 (�\Ū���G�����Ĳv ) / 10  = 4.992
g_GatherExpIndex[61] = 4.992;	-- 61 - 80
g_GatherExpIndex[81] = 5.375;	-- 81 - 100

local g_ResultGatherRatio = { 1/3, 2/3, 1, 4/3 };	-- �g��ȭ��v�A�@ 4 �خįq
local g_ResultMagicColID = { 492441, 492442, 492443, 492444 };	-- �S�ġA�����g��ȭ��v
local g_ResultString = { "[SC_LEARN_1]", "[SC_LEARN_2]", "[SC_LEARN_3]", "[SC_LEARN_4]" };
local g_ResultGatherRatioTotal = #g_ResultGatherRatio;
-- 1 = �A�b�\Ū���ɭԺεۤF�A�եծ��O�F�ɶ�
-- 2 = �A�^�^��Ū�F�@�M�A�����\�h�a��ݤ���
-- 3 = �A���V�O���A���H��í�w����
-- 4 = �A���p�����鳻�AŪ�_�ѨӨƥb�\��

local g_Define = {};	-- ���� 700016 ���� Define

local function SetDefine()	-- �]�w Define
	-- ���q
	g_Define[243319] = { Lv = EM_RoleValue_Skill_Mining, Exp = EM_SkillValueType_Mining, LowestLv = 1, HighestLv = 60 };	-- 1���q���j��
	g_Define[243320] = { Lv = EM_RoleValue_Skill_Mining, Exp = EM_SkillValueType_Mining, LowestLv = 61, HighestLv = 80 };	-- 1�Ѷi���q���j�ʬ�
	g_Define[243321] = { Lv = EM_RoleValue_Skill_Mining, Exp = EM_SkillValueType_Mining, LowestLv = 81, HighestLv = 100 };	-- 1���q���׷��ʬ����
	g_Define[243329] = { Lv = EM_RoleValue_Skill_Mining, Exp = EM_SkillValueType_Mining, LowestLv = 1, HighestLv = 60 };	-- 7���q���j��
	g_Define[243330] = { Lv = EM_RoleValue_Skill_Mining, Exp = EM_SkillValueType_Mining, LowestLv = 61, HighestLv = 80 };	-- 7�Ѷi���q���j�ʬ�
	g_Define[243331] = { Lv = EM_RoleValue_Skill_Mining, Exp = EM_SkillValueType_Mining, LowestLv = 81, HighestLv = 100 };	-- 7���q���׷��ʬ����
	g_Define[202708] = { Lv = EM_RoleValue_Skill_Mining, Exp = EM_SkillValueType_Mining, LowestLv = 1, HighestLv = 60 };	-- 30���q���j��
	g_Define[240488] = { Lv = EM_RoleValue_Skill_Mining, Exp = EM_SkillValueType_Mining, LowestLv = 61, HighestLv = 80 };	-- 30�Ѷi���q���j�ʬ�
	g_Define[240489] = { Lv = EM_RoleValue_Skill_Mining, Exp = EM_SkillValueType_Mining, LowestLv = 81, HighestLv = 100 };	-- 30���q���׷��ʬ����
	-- ���
	g_Define[243322] = { Lv = EM_RoleValue_Skill_Lumbering, Exp = EM_SkillValueType_Lumbering, LowestLv = 1, HighestLv = 60 };	-- 1�ѥ��j��
	g_Define[243323] = { Lv = EM_RoleValue_Skill_Lumbering, Exp = EM_SkillValueType_Lumbering, LowestLv = 61, HighestLv = 80 };	-- 1�Ѷi������j�ʬ�
	g_Define[243324] = { Lv = EM_RoleValue_Skill_Lumbering, Exp = EM_SkillValueType_Lumbering, LowestLv = 81, HighestLv = 100 };	-- 1�ѥ��׷��ʬ����
	g_Define[243332] = { Lv = EM_RoleValue_Skill_Lumbering, Exp = EM_SkillValueType_Lumbering, LowestLv = 1, HighestLv = 60 };	-- 7�ѥ��j��
	g_Define[243333] = { Lv = EM_RoleValue_Skill_Lumbering, Exp = EM_SkillValueType_Lumbering, LowestLv = 61, HighestLv = 80 };	-- 7�Ѷi������j�ʬ�
	g_Define[243334] = { Lv = EM_RoleValue_Skill_Lumbering, Exp = EM_SkillValueType_Lumbering, LowestLv = 81, HighestLv = 100 };	-- 7�ѥ��׷��ʬ����
	g_Define[202706] = { Lv = EM_RoleValue_Skill_Lumbering, Exp = EM_SkillValueType_Lumbering, LowestLv = 1, HighestLv = 60 };	-- 30�ѥ��j��
	g_Define[240484] = { Lv = EM_RoleValue_Skill_Lumbering, Exp = EM_SkillValueType_Lumbering, LowestLv = 61, HighestLv = 80 };	-- 30�Ѷi������j�ʬ�
	g_Define[240485] = { Lv = EM_RoleValue_Skill_Lumbering, Exp = EM_SkillValueType_Lumbering, LowestLv = 81, HighestLv = 100 };	-- 30�ѥ��׷��ʬ����
	-- ����
	g_Define[243325] = { Lv = EM_RoleValue_Skill_Herblism, Exp = EM_SkillValueType_Herblism, LowestLv = 1, HighestLv = 60 };	-- 1���į�j��
	g_Define[243326] = { Lv = EM_RoleValue_Skill_Herblism, Exp = EM_SkillValueType_Herblism, LowestLv = 61, HighestLv = 80 };	-- 1�Ѷi���į�j�ʬ�
	g_Define[243327] = { Lv = EM_RoleValue_Skill_Herblism, Exp = EM_SkillValueType_Herblism, LowestLv = 81, HighestLv = 100 };	-- 1���į�׷��ʬ����
	g_Define[243335] = { Lv = EM_RoleValue_Skill_Herblism, Exp = EM_SkillValueType_Herblism, LowestLv = 1, HighestLv = 60 };	-- 7���į�j��
	g_Define[243336] = { Lv = EM_RoleValue_Skill_Herblism, Exp = EM_SkillValueType_Herblism, LowestLv = 61, HighestLv = 80 };	-- 7�Ѷi���į�j�ʬ�
	g_Define[243337] = { Lv = EM_RoleValue_Skill_Herblism, Exp = EM_SkillValueType_Herblism, LowestLv = 81, HighestLv = 100 };	-- 7���į�׷��ʬ����
	g_Define[202707] = { Lv = EM_RoleValue_Skill_Herblism, Exp = EM_SkillValueType_Herblism, LowestLv = 1, HighestLv = 60 };	-- 30���į�j��
	g_Define[240486] = { Lv = EM_RoleValue_Skill_Herblism, Exp = EM_SkillValueType_Herblism, LowestLv = 61, HighestLv = 80 };	-- 30�Ѷi���į�j�ʬ�
	g_Define[240487] = { Lv = EM_RoleValue_Skill_Herblism, Exp = EM_SkillValueType_Herblism, LowestLv = 81, HighestLv = 100 };	-- 30���į�׷��ʬ����
	-- ��X(�H����@)
	g_Define[243318] = { LowestLv = 1, HighestLv = false, GatherExp = 4.693 };	--  1�ѱĶ���Ų
	g_Define[243328] = { LowestLv = 1, HighestLv = false, GatherExp = 4.693 };	-- 7�ѱĶ���Ų
	g_Define[202705] = { LowestLv = 1, HighestLv = false, GatherExp = 4.693 };	-- 30�ѱĶ���Ų
end

-- �P�_���šA�קK���a���Ŧb�\Ū�ɶ��������ܾ\Ū���ŤW���ɡA�̵M�i�H����\Ū�����D�C
local function CheckLv( Owner, RoomID, BookID, Define )

	local Lv = ReadRoleValue( Owner, Define );
--	DebugMsg( Owner, RoomID, "Skill Lv = "..Lv..", LowestLv = "..tostring(g_Define[BookID].LowestLv) );

	if ( not g_Define[BookID].HighestLv ) then
		if Lv < g_Define[BookID].LowestLv then
			ScriptMessage( Owner, Owner, 0, "[SC_NOTRIGHTLV_1]", 0 );	--�A�����Ŧ��G����\Ū����
			ScriptMessage( Owner, Owner, 1, "[SC_NOTRIGHTLV_1]", 0 );
			return false;
		end
	elseif Lv < g_Define[BookID].LowestLv or Lv > g_Define[BookID].HighestLv then
		ScriptMessage( Owner, Owner, 0, "[SC_NOTRIGHTLV_1]", 0 );	--�A�����Ŧ��G����\Ū����
		ScriptMessage( Owner, Owner, 1, "[SC_NOTRIGHTLV_1]", 0 );
		return false;
	end
	return true;
end

-- �P�_�ѬO�_�s�b�A�קK�ѥ��b�\Ū�ɶ��������ɡA�̵M�i�H����\Ū�����D�C
local function CheckBook( Owner, RoomID, BookID )

	if CountBodyItem( Owner, BookID ) == 0 then
		ScriptMessage( Owner, Owner, 0, "[SC_NOITEM]", 0 );	-- �A�S����
		ScriptMessage( Owner, Owner, 1, "[SC_NOITEM]", 0 );
		return false;
	end
	return true;
end

-- �p�� Gather �ʬ�
function Encyclopedia_GatherExp( BookID )	-- ���~ID

	if g_Define[BookID] == nil then
		SetDefine();
	end

	local Owner = OwnerID();
	local RoomID = ReadRoleValue( Owner, EM_RoleValue_RoomID );
	local ZoneID = ReadRoleValue( Owner, EM_RoleValue_ZoneID );
--	DebugMsg( Owner, RoomID, "BookID ="..BookID );

	if ZoneID ~= g_ZoneID then
		ScriptMessage( Owner, Owner, 0, "[SC_NOTINHOUSE]", 0 );	-- �A���b�ЫΤ�
		ScriptMessage( Owner, Owner, 1, "[SC_NOTINHOUSE]", 0 );
		return;
	end

	if not g_Define[BookID].HighestLv then	-- ��X�������y�A�C���H����@
		CallPlot( Owner, "Encyclopedia_GatherExp_BeginRandom", Owner, RoomID, BookID );
	else
		CallPlot( Owner, "Encyclopedia_GatherExp_Begin", Owner, RoomID, BookID );
	end
end

function Encyclopedia_GatherExp_Begin( Owner, RoomID, BookID )

	local GainGatherExp = 0;	-- �\Ū��W�[���g���
	for Index, Value in pairs(g_GatherExpIndex) do
		if Index == g_Define[BookID].LowestLv then
			GainGatherExp = Value;
		--	DebugMsg( Owner, RoomID, "GainGatherExp Basic = "..GainGatherExp );
			break;
		end
	end

	if ( not CheckLv( Owner, RoomID, BookID, g_Define[BookID].Lv ) ) then
		return false;
	end

	while true do

		local Complete = false;	-- �C��Ū�Ѫ����G

		local ReadTime = g_ReadTime;
		if Encyclopedia_CheckBuffResult( Owner, g_ReadSpeedUpBuffID ) then	-- �T�{���W�O�_���\Ū�[�t��Buff
			ReadTime = ReadTime * g_ReadSpeedUpRatio;
		end

		AddBuff( Owner, g_ReadBookMagicID, 0, -1 );		-- ������y���S��
		-- �L�k�H BeginCastBarEvent ���g����I�s�@�����禡
		if BeginCastBar( Owner, "[SC_BOOKCAST]".."["..BookID.."]", ReadTime, ruFUSION_ACTORSTATE_READING_LOOP, ruFUSION_ACTORSTATE_READING_LOOP, 0 ) == 1 then	-- �}�l�I�k
			while true do
				sleep(1);
				local CastBarStatus = CheckCastBar(Owner);
				if CastBarStatus ~= 0 then
					if CastBarStatus > 0 then	-- �\Ū���G���\��
						Complete = true;
					end
					EndCastBar( Owner, CastBarStatus );
					break;
				end
			end
		else
			break;
		end

	--	DebugMsg( Owner, RoomID, "Complete = "..tostring(Complete) );
		-- �\Ū���ˬd�G���Ť��ŦX�B���y���s�b�B�\Ū���G����
		if ( not CheckLv( Owner, RoomID, BookID, g_Define[BookID].Lv ) ) or ( not CheckBook( Owner, RoomID, BookID ) ) or ( not Complete ) then
			break;
		end

		-- �\Ū���\�ɰ���
		local Random = math.random( g_ResultGatherRatioTotal );
		local ResultGatherExp = GainGatherExp*g_ResultGatherRatio[Random];	-- ��¦�� * �Ĳv���v

	--	DebugMsg( Owner, RoomID, "["..BookID.."]".."Basic Exp = "..GainGatherExp..", Random Ratio = "..string.format( "%.2f", g_ResultGatherRatio[Random] )..", Math Exp = "..string.format( "%.2f", ResultGatherExp ) );
		SysCastSpellLv( Owner, Owner, g_ResultMagicColID[Random], 0 );
		ScriptMessage( Owner, Owner, 0, g_ResultString[Random], 0 );
		AddSkillValue( Owner, g_Define[BookID].Exp, ResultGatherExp );
		Sleep(2);
	end
	PlayMotion( Owner, ruFUSION_ACTORSTATE_READING_END );	-- �_��
	CancelBuff_NoEvent( Owner, g_ReadBookMagicID );
end

function Encyclopedia_GatherExp_BeginRandom( Owner, RoomID, BookID )	-- �B�z�����H����@�رĶ��g��Ȫ�����

	local SkillType = { EM_RoleValue_Skill_Mining, EM_RoleValue_Skill_Lumbering, EM_RoleValue_Skill_Herblism };
	local SkillExpType = { EM_SkillValueType_Mining, EM_SkillValueType_Lumbering, EM_SkillValueType_Herblism };

	for Index, value in pairs(SkillType) do	-- �T�{ 3 �رĶ��ޯ�O�_���w�g�ǲ�
		local Lv = ReadRoleValue( Owner, Value );
	--	DebugMsg( Owner, RoomID, "Lv = "..Lv );
		if Lv < 1 then
			ScriptMessage( Owner, Owner, 0, "[SC_NOTRIGHTLV_3]", 0 );	-- �A�����Ƿ|�T�رĶ��ޯ�~��\Ū����
			ScriptMessage( Owner, Owner, 1, "[SC_NOTRIGHTLV_3]", 0 );
			return false;
		end
	end

	local GainGatherExp = g_Define[BookID].GatherExp;	-- �\Ū��W�[���g���
--	DebugMsg( Owner, RoomID, "GainGatherExp Basic = "..GainGatherExp );

	while true do

		local Complete = false;	-- �C��Ū�Ѫ����G
		local Random = math.random( #SkillType );
		DebugMsg( Owner, RoomID, "Random = "..Random );
		local Define = {};
		Define.Lv = SkillType[Random];
		Define.Exp = SkillExpType[Random];
	--	DebugMsg( Owner, RoomID, "Select Random = "..Random );

		local ReadTime = g_ReadTime;
		if Encyclopedia_CheckBuffResult( Owner, g_ReadSpeedUpBuffID ) then	-- �T�{���W�O�_���\Ū�[�t��Buff
			ReadTime = ReadTime * g_ReadSpeedUpRatio;
		end

		AddBuff( Owner, g_ReadBookMagicID, 0, -1 );		-- ������y���S��
		-- �L�k�H BeginCastBarEvent ���g����I�s�@�����禡
		if BeginCastBar( Owner, "[SC_BOOKCAST]".."["..BookID.."]", ReadTime, ruFUSION_ACTORSTATE_READING_LOOP, ruFUSION_ACTORSTATE_READING_LOOP, 0 ) == 1 then	-- �}�l�I�k
			while true do
				sleep(1);
				local CastBarStatus = CheckCastBar(Owner);
				if CastBarStatus ~= 0 then
					if CastBarStatus > 0 then	-- �\Ū���G���\��
						Complete = true;
					end
					EndCastBar( Owner, CastBarStatus );
					break;
				end
			end
		else
			break;
		end

	--	DebugMsg( Owner, RoomID, "Complete = "..tostring(Complete) );
		if ( not CheckLv( Owner, RoomID, BookID, Define.Lv ) ) or ( not CheckBook( Owner, RoomID, BookID ) ) or ( not Complete ) then	-- �\Ū���ˬd�G���Ť��ŦX�B���y���s�b�B�\Ū���G����
			break;
		end

		-- �\Ū���\�ɰ���
		local Random = math.random( g_ResultGatherRatioTotal );
		local ResultGatherExp = GainGatherExp*g_ResultGatherRatio[Random];	-- ��¦�g��� * �����\Ū�įq

	--	DebugMsg( Owner, RoomID, "["..BookID.."]".."Basic Exp = "..GainGatherExp..", Random Ratio = "..string.format( "%.2f", g_ResultGatherRatio[Random] )..", Math Exp = "..string.format( "%.2f", ResultGatherExp ) );
		SysCastSpellLv( Owner, Owner, g_ResultMagicColID[Random], 0 );
		ScriptMessage( Owner, Owner, 0, g_ResultString[Random], 0 );
		AddSkillValue( Owner, Define.Exp, ResultGatherExp );
		Sleep(2);	-- �����n��Sleep�A�ѥ��S�Ĥ~���|����
	end
	PlayMotion( Owner, ruFUSION_ACTORSTATE_READING_END );	-- �_��
	CancelBuff_NoEvent( Owner, g_ReadBookMagicID );
end