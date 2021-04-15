
local g_ZoneID = 400;	-- �p��ID
local g_ReadTime = 60;	-- �ϥΫ᪺�\Ū�ɶ�(��� 0.1 ��)�A�w�]�� 6 ��
local g_ReadSpeedUpBuffID = {  500150, 500151, 500152 }	-- 1�ѡB7�ѡB30�Ѥp�Φʬ�[�t�ľ�
local g_ReadSpeedUpRatio = 0.7;	-- �ϥδ����\Ū�t�׫�A���C���\Ū�ɶ����v
local g_ReadBookMagicID = 502088;	-- ������y���S��

-- �Z�����m�ׯ��ު�A�U�ŶZ�C������o����¦�g��ȡATable�����u�Z�����m�g��ȡv
local g_WeaponSkillExpIndex = 0.851;
-- ����Ѽ� = �N 1 �Ŵ����� 2 �Ū��ɶ��]�� 1 �����@����ƫ�վ㪺�����A�Ա��Ш���� - (6.4.0)�p�Φʬ��I�ƽվ�
-- 1 - 300�A���� = 1 - 300�ũһ��`�g��� / ����Ѽ� / 1440(1��=1440����) * (60/60)(�C���\Ū���/�C�������) / (1/3+2/3+3/3+4/3)/4 (�\Ū���G�����Ĳv )  = ���G

local g_ResultWeaponSkillRatio = { 1/3, 2/3, 1, 4/3 };	-- �g��ȭ��v�A�@ 4 �خįq
local g_ResultMagicColID = { 492441, 492442, 492443, 492444 };	-- �S�ġA�����g��ȭ��v
local g_ResultString = { "[SC_LEARN_1]", "[SC_LEARN_2]", "[SC_LEARN_3]", "[SC_LEARN_4]" };
local g_ResultWeaponSkillRatioTotal = #g_ResultWeaponSkillRatio;
-- 1 = �A�b�\Ū���ɭԺεۤF�A�եծ��O�F�ɶ�
-- 2 = �A�^�^��Ū�F�@�M�A�����\�h�a��ݤ���
-- 3 = �A���V�O���A���H��í�w����
-- 4 = �A���p�����鳻�AŪ�_�ѨӨƥb�\��

local g_Define = {};	-- ���� 700016 ���� Define�ALv �ΥHŪ�����šBExp �ΥH�ק�g���

local function SetDefine()	-- �]�w Define

	g_Define[243401] = { Lv = EM_RoleValue_Skill_Unarmed, Exp = EM_SkillValueType_Unarmed };	-- �Ť� 1�ѪŤ�i���ޥ�
	g_Define[243416] = { Lv = EM_RoleValue_Skill_Unarmed, Exp = EM_SkillValueType_Unarmed };	-- �Ť� 7�ѪŤ�i���ޥ�
	g_Define[202733] = { Lv = EM_RoleValue_Skill_Unarmed, Exp = EM_SkillValueType_Unarmed };	-- �Ť� 30�ѪŤ�i���ޥ�
	g_Define[243402] = { Lv = EM_RoleValue_Skill_Blade, Exp = EM_SkillValueType_Blade };	-- ���C 1�ѳ��C�ǲ߱Ч�
	g_Define[243417] = { Lv = EM_RoleValue_Skill_Blade, Exp = EM_SkillValueType_Blade };	-- ���C 7�ѳ��C�ǲ߱Ч�
	g_Define[202734] = { Lv = EM_RoleValue_Skill_Blade, Exp = EM_SkillValueType_Blade };	-- ���C 30�ѳ��C�ǲ߱Ч�
	g_Define[243403] = { Lv = EM_RoleValue_Skill_Dagger, Exp = EM_SkillValueType_Dagger };	-- �P�� 1�ѤP���ǲ߱Ч�
	g_Define[243418] = { Lv = EM_RoleValue_Skill_Dagger, Exp = EM_SkillValueType_Dagger };	-- �P�� 7�ѤP���ǲ߱Ч�
	g_Define[202735] = { Lv = EM_RoleValue_Skill_Dagger, Exp = EM_SkillValueType_Dagger };	-- �P�� 30�ѤP���ǲ߱Ч�
	g_Define[243404] = { Lv = EM_RoleValue_Skill_Wand, Exp = EM_SkillValueType_Wand };	-- �v�� 1���v���ǲ߱Ч�
	g_Define[243419] = { Lv = EM_RoleValue_Skill_Wand, Exp = EM_SkillValueType_Wand };	-- �v�� 7���v���ǲ߱Ч�
	g_Define[202736] = { Lv = EM_RoleValue_Skill_Wand, Exp = EM_SkillValueType_Wand };	-- �v�� 30���v���ǲ߱Ч�
	g_Define[243405] = { Lv = EM_RoleValue_Skill_Axe, Exp = EM_SkillValueType_Axe };	-- ���� 1�ѳ���ǲ߱Ч�
	g_Define[243420] = { Lv = EM_RoleValue_Skill_Axe, Exp = EM_SkillValueType_Axe };	-- ���� 7�ѳ���ǲ߱Ч�
	g_Define[202737] = { Lv = EM_RoleValue_Skill_Axe, Exp = EM_SkillValueType_Axe };	-- ���� 30�ѳ���ǲ߱Ч�
	g_Define[243406] = { Lv = EM_RoleValue_Skill_Bludgeon, Exp = EM_SkillValueType_Bludgeon };	-- ����� 1�ѳ����ǲ߱Ч�
	g_Define[243421] = { Lv = EM_RoleValue_Skill_Bludgeon, Exp = EM_SkillValueType_Bludgeon };	-- ����� 7�ѳ����ǲ߱Ч�
	g_Define[202738] = { Lv = EM_RoleValue_Skill_Bludgeon, Exp = EM_SkillValueType_Bludgeon };	-- ����� 30�ѳ����ǲ߱Ч�
	g_Define[243407] = { Lv = EM_RoleValue_Skill_Claymore, Exp = EM_SkillValueType_Claymore };	-- ����C 1������C�ǲ߱Ч�
	g_Define[243422] = { Lv = EM_RoleValue_Skill_Claymore, Exp = EM_SkillValueType_Claymore };	-- ����C 7������C�ǲ߱Ч�
	g_Define[202739] = { Lv = EM_RoleValue_Skill_Claymore, Exp = EM_SkillValueType_Claymore };	-- ����C 30������C�ǲ߱Ч�
	g_Define[243408] = { Lv = EM_RoleValue_Skill_Staff, Exp = EM_SkillValueType_Staff };	-- ����� 1��������ǲ߱Ч�
	g_Define[243423] = { Lv = EM_RoleValue_Skill_Staff, Exp = EM_SkillValueType_Staff };	-- ����� 7��������ǲ߱Ч�
	g_Define[202740] = { Lv = EM_RoleValue_Skill_Staff, Exp = EM_SkillValueType_Staff };	-- ����� 30��������ǲ߱Ч�
	g_Define[243409] = { Lv = EM_RoleValue_Skill_2H_Axe, Exp = EM_SkillValueType_2H_Axe };	-- ����� 1�������ǲ߱Ч�
	g_Define[243424] = { Lv = EM_RoleValue_Skill_2H_Axe, Exp = EM_SkillValueType_2H_Axe };	-- ����� 7�������ǲ߱Ч�
	g_Define[202741] = { Lv = EM_RoleValue_Skill_2H_Axe, Exp = EM_SkillValueType_2H_Axe };	-- ����� 30�������ǲ߱Ч�
	g_Define[243410] = { Lv = EM_RoleValue_Skill_2H_Hammer, Exp = EM_SkillValueType_2H_Hammer };	-- ������ 1��������ǲ߱Ч�
	g_Define[243425] = { Lv = EM_RoleValue_Skill_2H_Hammer, Exp = EM_SkillValueType_2H_Hammer };	-- ������ 7��������ǲ߱Ч�
	g_Define[202742] = { Lv = EM_RoleValue_Skill_2H_Hammer, Exp = EM_SkillValueType_2H_Hammer };	-- ������ 30��������ǲ߱Ч�
	g_Define[243411] = { Lv = EM_RoleValue_Skill_Polearm, Exp = EM_SkillValueType_Polearm };	-- ���`�Z�� 1�Ѫ��`�Z���ʬ�
	g_Define[243426] = { Lv = EM_RoleValue_Skill_Polearm, Exp = EM_SkillValueType_Polearm };	-- ���`�Z�� 7�Ѫ��`�Z���ʬ�
	g_Define[202743] = { Lv = EM_RoleValue_Skill_Polearm, Exp = EM_SkillValueType_Polearm };	-- ���`�Z�� 30�Ѫ��`�Z���ʬ�
	g_Define[243412] = { Lv = EM_RoleValue_Skill_Bow, Exp = EM_SkillValueType_Bow };	-- �} 1�Ѥ}�ǲ߱Ч�
	g_Define[243427] = { Lv = EM_RoleValue_Skill_Bow, Exp = EM_SkillValueType_Bow };	-- �} 7�Ѥ}�ǲ߱Ч�
	g_Define[202744] = { Lv = EM_RoleValue_Skill_Bow, Exp = EM_SkillValueType_Bow };	-- �} 30�Ѥ}�ǲ߱Ч�
	g_Define[243413] = { Lv = EM_RoleValue_Skill_CossBow, Exp = EM_SkillValueType_CossBow };	-- �� 1�ѩ��ǲ߱Ч�
	g_Define[243428] = { Lv = EM_RoleValue_Skill_CossBow, Exp = EM_SkillValueType_CossBow };	-- �� 7�ѩ��ǲ߱Ч�
	g_Define[202745] = { Lv = EM_RoleValue_Skill_CossBow, Exp = EM_SkillValueType_CossBow };	-- �� 30�ѩ��ǲ߱Ч�
	--g_Define[202746] = { Lv = EM_RoleValue_Skill_Gun, Exp = EM_SkillValueType_Gun };	-- �j 30�Ѻj��ʬ�(���ϥ�)
	g_Define[243414] = { Lv = EM_RoleValue_Skill_Define, Exp = EM_SkillValueType_Define };	-- 1�Ѩ��m�߱o
	g_Define[243429] = { Lv = EM_RoleValue_Skill_Define, Exp = EM_SkillValueType_Define };	-- 7�Ѩ��m�߱o
	g_Define[202747] = { Lv = EM_RoleValue_Skill_Define, Exp = EM_SkillValueType_Define };	-- 30�Ѩ��m�߱o
	
	-- ��X(�H����@)
	--WeaponSkillExp �H�����C���\Ū�ɵ������g���
	local g_MixBookID = { 243400, 243415, 202732 };	-- 1�ѡB7�ѡB30�ѪZ�����γq��
	
	for i = 1, #g_MixBookID do
	
		g_Define[g_MixBookID[i]] = { WeaponSkillExp = 0.938 }; -- 30�ѪZ�����γq��
		g_Define[g_MixBookID[i]].Lv = {
					EM_RoleValue_Skill_Unarmed,
					EM_RoleValue_Skill_Blade,
					EM_RoleValue_Skill_Dagger,
					EM_RoleValue_Skill_Wand,
					EM_RoleValue_Skill_Axe,
					EM_RoleValue_Skill_Bludgeon,
					EM_RoleValue_Skill_Claymore,
					EM_RoleValue_Skill_Staff,
					EM_RoleValue_Skill_2H_Axe,
					EM_RoleValue_Skill_2H_Hammer,
					EM_RoleValue_Skill_Polearm,
					EM_RoleValue_Skill_Bow,
					EM_RoleValue_Skill_CossBow,
					EM_RoleValue_Skill_Define
									};
		g_Define[g_MixBookID[i]].Exp = {
					EM_SkillValueType_Unarmed,
					EM_SkillValueType_Blade,
					EM_SkillValueType_Dagger,
					EM_SkillValueType_Wand,
					EM_SkillValueType_Axe,
					EM_SkillValueType_Bludgeon,
					EM_SkillValueType_Claymore,
					EM_SkillValueType_Staff,
					EM_SkillValueType_2H_Axe,
					EM_SkillValueType_2H_Hammer,
					EM_SkillValueType_Polearm,
					EM_SkillValueType_Bow,
					EM_SkillValueType_CossBow,
					EM_SkillValueType_Define
									};
	end

end

-- �P�_�ѬO�_�s�b�A�קK�ѥ��b�\Ū�ɶ��������ɡA�̵M�i�H����\Ū�����D�C
local function CheckBook( Owner, RoomID, BookID )
--	DebugMsg( Owner, RoomID, "ReadBookID = "..BookID );
	if CountBodyItem( Owner, BookID ) == 0 then
		ScriptMessage( Owner, Owner, 0, "[SC_NOITEM]", 0 );	-- �A�S����
		ScriptMessage( Owner, Owner, 1, "[SC_NOITEM]", 0 );
		return false;
	end
	return true;
end

-- �p�� WeaponSkill �ʬ�
function Encyclopedia_WeaponSkillExp( BookID )	-- ���~ID

	if g_Define[BookID] == nil then
		SetDefine();
	end

	local Owner = OwnerID();
	local RoomID = ReadRoleValue( Owner, EM_RoleValue_RoomID );
	local ZoneID = ReadRoleValue( Owner, EM_RoleValue_ZoneID );
--	DebugMsg( Owner, RoomID, "ZoneID = "..ZoneID );

	if ZoneID ~= g_ZoneID then
		ScriptMessage( Owner, Owner, 0, "[SC_NOTINHOUSE]", 0 );	-- �A���b�ЫΤ�
		ScriptMessage( Owner, Owner, 1, "[SC_NOTINHOUSE]", 0 );
		return;
	end

	if g_Define[BookID].WeaponSkillExp then	-- ��X�������y�A�C���H����@
		CallPlot( Owner, "Encyclopedia_WeaponSkillExp_BeginRandom", Owner, RoomID, BookID );
	else
		CallPlot( Owner, "Encyclopedia_WeaponSkillExp_Begin", Owner, RoomID, BookID );
	end
end

function Encyclopedia_WeaponSkillExp_Begin( Owner, RoomID, BookID )

	local GainWeaponSkillExp = g_WeaponSkillExpIndex;	-- �\Ū��W�[���g���

	if ( not CheckBook( Owner, RoomID, BookID ) ) then
		return false;
	end

--	local Count = 0;
	while true do

		local Complete = false;	-- �C��Ū�Ѫ����G

	--	Count = Count + 1;
	--	DebugMsg( Owner, RoomID, "Count = "..Count );

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
		-- �\Ū���ˬd�G���y���s�b�B�\Ū���G����
		if ( not CheckBook( Owner, RoomID, BookID ) ) or ( not Complete ) then
			break;
		end

		-- �\Ū���\�ɰ���
		local Random = math.random( g_ResultWeaponSkillRatioTotal );
		local ResultWeaponSkillExp = GainWeaponSkillExp*g_ResultWeaponSkillRatio[Random];	-- ��¦�� * �Ĳv���v

	--	DebugMsg( Owner, RoomID, "["..BookID.."]".."Basic Exp = "..GainWeaponSkillExp..", Random Ratio = "..string.format( "%.2f", g_ResultWeaponSkillRatio[Random] )..", Math Exp = "..string.format( "%.3f", ResultWeaponSkillExp ) );
		SysCastSpellLv( Owner, Owner, g_ResultMagicColID[Random], 0 );
		ScriptMessage( Owner, Owner, 0, g_ResultString[Random], 0 );
		AddSkillValue( Owner, g_Define[BookID].Exp, ResultWeaponSkillExp );
		Sleep(2);
	end
	PlayMotion( Owner, ruFUSION_ACTORSTATE_READING_END );	-- �_��
	CancelBuff_NoEvent( Owner, g_ReadBookMagicID );
end

function Encyclopedia_WeaponSkillExp_BeginRandom( Owner, RoomID, BookID )	-- �B�z�����H����@�إͲ��g��Ȫ�����

	local GainWeaponSkillExp = g_Define[BookID].WeaponSkillExp;	-- �\Ū��W�[���g���
--	DebugMsg( Owner, RoomID, "GainWeaponSkillExp Basic = "..GainWeaponSkillExp );

	if ( not CheckBook( Owner, RoomID, BookID ) ) then
		return false;
	end

--	local Count = 0;

	while true do

		local Complete = false;	-- �C��Ū�Ѫ����G

	--	Count = Count + 1;
	--	DebugMsg( Owner, RoomID, "Count = "..Count );

		local Random = math.random(#g_Define[BookID].Lv);
		local Define = {};
		Define.Lv = g_Define[BookID].Lv[Random];
		Define.Exp = g_Define[BookID].Exp[Random];
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
		if ( not CheckBook( Owner, RoomID, BookID ) ) or ( not Complete ) then	-- �\Ū���ˬd�G���y���s�b�B�\Ū���G����
			break;
		end

		-- �\Ū���\�ɰ���
		local Random = math.random( g_ResultWeaponSkillRatioTotal );
		local ResultWeaponSkillExp = GainWeaponSkillExp*g_ResultWeaponSkillRatio[Random];	-- ��¦�g��� * �����\Ū�įq

	--	DebugMsg( Owner, RoomID, "["..BookID.."]".."Basic Exp = "..GainWeaponSkillExp..", Random Ratio = "..string.format( "%.2f", g_ResultWeaponSkillRatio[Random] )..", Math Exp = "..string.format( "%.3f", ResultWeaponSkillExp ) );
		SysCastSpellLv( Owner, Owner, g_ResultMagicColID[Random], 0 );
		ScriptMessage( Owner, Owner, 0, g_ResultString[Random], 0 );
		AddSkillValue( Owner, Define.Exp, ResultWeaponSkillExp );
		Sleep(2);	-- �����n��Sleep�A�ѥ��S�Ĥ~���|����
	end
	PlayMotion( Owner, ruFUSION_ACTORSTATE_READING_END );	-- �_��
	CancelBuff_NoEvent( Owner, g_ReadBookMagicID );
end