--�վ�ͬ��ޯ�
--/gm ? runplot Hao_Crafting_Set_Value

local g_ZoneID = 400;	-- �p��ID
local g_ReadTime = 600;	-- �ϥΫ᪺�\Ū�ɶ�(��� 0.1 ��)�A�w�]�� 6 ��
local g_ReadSpeedUpBuffID = { 500150, 500151, 500152 }	-- 1�ѡB7�ѡB30�Ѥp�Φʬ�[�t�ľ�
local g_ReadSpeedUpRatio = 0.7;	-- �ϥδ����\Ū�t�׫�A���C���\Ū�ɶ����v
local g_ReadBookMagicID = 502088;	-- ������y���S��

-- �Ͳ����ު�A�U�ŶZ�C������o����¦�g��ȡATable�����u�Ͳ��g��ȡv
-- �A�Ω�D�H������
local g_CraftExpIndex = {};	-- ����Ѽ� = �N 1 �Ŵ����� 2 �Ū��ɶ��]�� 1 �����@����ƫ�վ㪺�����A�Ա��Ш���� - (6.4.0)�p�Φʬ��I�ƽվ�
g_CraftExpIndex[1] = 0.1392;	-- 1 - 20�A���� = 1 - 20�ũһ��`�g��� / ����Ѽ� / 1440(1��=1440����) * (60/60)(�C���\Ū���/�C�������) / (1/3+2/3+3/3+4/3)/4 (�\Ū���G�����Ĳv )  = 0.0139
g_CraftExpIndex[21] = 0.1325;	-- 21 - 40
g_CraftExpIndex[41] = 0.2555;	-- 41 - 60
g_CraftExpIndex[61] = 0.4111;	-- 61 - 80
g_CraftExpIndex[81] = 0.4775;	-- 81 - 100

local g_ResultCraftRatio = { 1/3, 2/3, 1, 4/3 };	-- �g��ȭ��v�A�@ 4 �خįq
local g_ResultMagicColID = { 492441, 492442, 492443, 492444 };	-- �S�ġA�����g��ȭ��v
local g_ResultString = { "[SC_LEARN_1]", "[SC_LEARN_2]", "[SC_LEARN_3]", "[SC_LEARN_4]" };
local g_ResultCraftRatioTotal = #g_ResultCraftRatio;
-- 1 = �A�b�\Ū���ɭԺεۤF�A�եծ��O�F�ɶ�
-- 2 = �A�^�^��Ū�F�@�M�A�����\�h�a��ݤ���
-- 3 = �A���V�O���A���H��í�w����
-- 4 = �A���p�����鳻�AŪ�_�ѨӨƥb�\��

local g_Define = {};	-- ���� 700016 ���� Define

local function SetDefine()	-- �]�w Define

	-- ���K
	g_Define[243339] = { Lv = EM_RoleValue_Skill_BlackSmith, Exp = EM_SkillValueType_BlackSmith, LowestLv = 1, HighestLv = 20 };	-- 1�ѧA�]�i�H�ǥ��K
	g_Define[243340] = { Lv = EM_RoleValue_Skill_BlackSmith, Exp = EM_SkillValueType_BlackSmith, LowestLv = 21, HighestLv = 40 };	-- 1�ѥv�K�����ͪ�����
	g_Define[243341] = { Lv = EM_RoleValue_Skill_BlackSmith, Exp = EM_SkillValueType_BlackSmith, LowestLv = 41, HighestLv = 60 };	-- 1�ѥ��K�ϥ@��
	g_Define[243342] = { Lv = EM_RoleValue_Skill_BlackSmith, Exp = EM_SkillValueType_BlackSmith, LowestLv = 61, HighestLv = 80 };	-- 1�Ѻ�K���K����
	g_Define[243343] = { Lv = EM_RoleValue_Skill_BlackSmith, Exp = EM_SkillValueType_BlackSmith, LowestLv = 81, HighestLv = 100 };	-- 1�Ѧܰ����K�ǩ�
	
	g_Define[243370] = { Lv = EM_RoleValue_Skill_BlackSmith, Exp = EM_SkillValueType_BlackSmith, LowestLv = 1, HighestLv = 20 };	-- 7�ѧA�]�i�H�ǥ��K
	g_Define[243371] = { Lv = EM_RoleValue_Skill_BlackSmith, Exp = EM_SkillValueType_BlackSmith, LowestLv = 21, HighestLv = 40 };	-- 7�ѥv�K�����ͪ�����
	g_Define[243372] = { Lv = EM_RoleValue_Skill_BlackSmith, Exp = EM_SkillValueType_BlackSmith, LowestLv = 41, HighestLv = 60 };	-- 7�ѥ��K�ϥ@��
	g_Define[243373] = { Lv = EM_RoleValue_Skill_BlackSmith, Exp = EM_SkillValueType_BlackSmith, LowestLv = 61, HighestLv = 80 };	-- 7�Ѻ�K���K����
	g_Define[243374] = { Lv = EM_RoleValue_Skill_BlackSmith, Exp = EM_SkillValueType_BlackSmith, LowestLv = 81, HighestLv = 100 };	-- 7�Ѧܰ����K�ǩ�
	
	g_Define[202714] = { Lv = EM_RoleValue_Skill_BlackSmith, Exp = EM_SkillValueType_BlackSmith, LowestLv = 1, HighestLv = 20 };	-- 30�ѧA�]�i�H�ǥ��K
	g_Define[202715] = { Lv = EM_RoleValue_Skill_BlackSmith, Exp = EM_SkillValueType_BlackSmith, LowestLv = 21, HighestLv = 40 };	-- 30�ѥv�K�����ͪ�����
	g_Define[202716] = { Lv = EM_RoleValue_Skill_BlackSmith, Exp = EM_SkillValueType_BlackSmith, LowestLv = 41, HighestLv = 60 };	-- 30�ѥ��K�ϥ@��
	g_Define[240474] = { Lv = EM_RoleValue_Skill_BlackSmith, Exp = EM_SkillValueType_BlackSmith, LowestLv = 61, HighestLv = 80 };	-- 30�Ѻ�K���K����
	g_Define[240475] = { Lv = EM_RoleValue_Skill_BlackSmith, Exp = EM_SkillValueType_BlackSmith, LowestLv = 81, HighestLv = 100 };	-- 30�Ѧܰ����K�ǩ�
	-- ��u
	g_Define[243344] = { Lv = EM_RoleValue_Skill_Carpenter, Exp = EM_SkillValueType_Carpenter, LowestLv = 1, HighestLv = 20 };	-- 1��²��Ǥ�u
	g_Define[243345] = { Lv = EM_RoleValue_Skill_Carpenter, Exp = EM_SkillValueType_Carpenter, LowestLv = 21, HighestLv = 40 };	-- 1�Ѥ�u�ޥ���s
	g_Define[243346] = { Lv = EM_RoleValue_Skill_Carpenter, Exp = EM_SkillValueType_Carpenter, LowestLv = 41, HighestLv = 60 };	-- 1�Ѳ`�J�A�Ѥ�u
	g_Define[243347] = { Lv = EM_RoleValue_Skill_Carpenter, Exp = EM_SkillValueType_Carpenter, LowestLv = 61, HighestLv = 80 };	-- 1�Ѥj�v�ͤ�u���N
	g_Define[243348] = { Lv = EM_RoleValue_Skill_Carpenter, Exp = EM_SkillValueType_Carpenter, LowestLv = 81, HighestLv = 100 };	-- 1�ѤW�j��u����
	
	g_Define[243375] = { Lv = EM_RoleValue_Skill_Carpenter, Exp = EM_SkillValueType_Carpenter, LowestLv = 1, HighestLv = 20 };	-- 7��²��Ǥ�u
	g_Define[243376] = { Lv = EM_RoleValue_Skill_Carpenter, Exp = EM_SkillValueType_Carpenter, LowestLv = 21, HighestLv = 40 };	-- 7�Ѥ�u�ޥ���s
	g_Define[243377] = { Lv = EM_RoleValue_Skill_Carpenter, Exp = EM_SkillValueType_Carpenter, LowestLv = 41, HighestLv = 60 };	-- 7�Ѳ`�J�A�Ѥ�u
	g_Define[243378] = { Lv = EM_RoleValue_Skill_Carpenter, Exp = EM_SkillValueType_Carpenter, LowestLv = 61, HighestLv = 80 };	-- 7�Ѥj�v�ͤ�u���N
	g_Define[243379] = { Lv = EM_RoleValue_Skill_Carpenter, Exp = EM_SkillValueType_Carpenter, LowestLv = 81, HighestLv = 100 };	-- 7�ѤW�j��u����
	
	g_Define[202711] = { Lv = EM_RoleValue_Skill_Carpenter, Exp = EM_SkillValueType_Carpenter, LowestLv = 1, HighestLv = 20 };	-- 30��²��Ǥ�u
	g_Define[202712] = { Lv = EM_RoleValue_Skill_Carpenter, Exp = EM_SkillValueType_Carpenter, LowestLv = 21, HighestLv = 40 };	-- 30�Ѥ�u�ޥ���s
	g_Define[202713] = { Lv = EM_RoleValue_Skill_Carpenter, Exp = EM_SkillValueType_Carpenter, LowestLv = 41, HighestLv = 60 };	-- 30�Ѳ`�J�A�Ѥ�u
	g_Define[240472] = { Lv = EM_RoleValue_Skill_Carpenter, Exp = EM_SkillValueType_Carpenter, LowestLv = 61, HighestLv = 80 };	-- 30�Ѥj�v�ͤ�u���N
	g_Define[240473] = { Lv = EM_RoleValue_Skill_Carpenter, Exp = EM_SkillValueType_Carpenter, LowestLv = 81, HighestLv = 100 };	-- 30�ѤW�j��u����
	-- �s��
	g_Define[243349] = { Lv = EM_RoleValue_Skill_MakeArmor, Exp = EM_SkillValueType_MakeArmor, LowestLv = 1, HighestLv = 20 };	-- 1�ѻs�ҾǷ��n
	g_Define[243350] = { Lv = EM_RoleValue_Skill_MakeArmor, Exp = EM_SkillValueType_MakeArmor, LowestLv = 21, HighestLv = 40 };	-- 1�Ѥ����s�Ҿ�
	g_Define[243351] = { Lv = EM_RoleValue_Skill_MakeArmor, Exp = EM_SkillValueType_MakeArmor, LowestLv = 41, HighestLv = 60 };	-- 1�Ѱ��Żs�Ҿ�
	g_Define[243352] = { Lv = EM_RoleValue_Skill_MakeArmor, Exp = EM_SkillValueType_MakeArmor, LowestLv = 61, HighestLv = 80 };	-- 1�����A�����s�Ҥj�v 
	g_Define[243353] = { Lv = EM_RoleValue_Skill_MakeArmor, Exp = EM_SkillValueType_MakeArmor, LowestLv = 81, HighestLv = 100 };	-- 1�ѵL���s�Ҿ�
	
	g_Define[243380] = { Lv = EM_RoleValue_Skill_MakeArmor, Exp = EM_SkillValueType_MakeArmor, LowestLv = 1, HighestLv = 20 };	-- 7�ѻs�ҾǷ��n
	g_Define[243381] = { Lv = EM_RoleValue_Skill_MakeArmor, Exp = EM_SkillValueType_MakeArmor, LowestLv = 21, HighestLv = 40 };	-- 7�Ѥ����s�Ҿ�
	g_Define[243382] = { Lv = EM_RoleValue_Skill_MakeArmor, Exp = EM_SkillValueType_MakeArmor, LowestLv = 41, HighestLv = 60 };	-- 7�Ѱ��Żs�Ҿ�
	g_Define[243383] = { Lv = EM_RoleValue_Skill_MakeArmor, Exp = EM_SkillValueType_MakeArmor, LowestLv = 61, HighestLv = 80 };	-- 7�����A�����s�Ҥj�v 
	g_Define[243384] = { Lv = EM_RoleValue_Skill_MakeArmor, Exp = EM_SkillValueType_MakeArmor, LowestLv = 81, HighestLv = 100 };	-- 7�ѵL���s�Ҿ�
	
	g_Define[202726] = { Lv = EM_RoleValue_Skill_MakeArmor, Exp = EM_SkillValueType_MakeArmor, LowestLv = 1, HighestLv = 20 };	-- 30�ѻs�ҾǷ��n
	g_Define[202727] = { Lv = EM_RoleValue_Skill_MakeArmor, Exp = EM_SkillValueType_MakeArmor, LowestLv = 21, HighestLv = 40 };	-- 30�Ѥ����s�Ҿ�
	g_Define[202728] = { Lv = EM_RoleValue_Skill_MakeArmor, Exp = EM_SkillValueType_MakeArmor, LowestLv = 41, HighestLv = 60 };	-- 30�Ѱ��Żs�Ҿ�
	g_Define[240482] = { Lv = EM_RoleValue_Skill_MakeArmor, Exp = EM_SkillValueType_MakeArmor, LowestLv = 61, HighestLv = 80 };	-- 30�����A�����s�Ҥj�v 
	g_Define[240481] = { Lv = EM_RoleValue_Skill_MakeArmor, Exp = EM_SkillValueType_MakeArmor, LowestLv = 81, HighestLv = 100 };	-- 30�ѵL���s�Ҿ�
	-- ���_
	g_Define[243354] = { Lv = EM_RoleValue_Skill_Tailor, Exp = EM_SkillValueType_Tailor, LowestLv = 1, HighestLv = 20 };	-- 1�Ѧp��Ǧn���_
	g_Define[243355] = { Lv = EM_RoleValue_Skill_Tailor, Exp = EM_SkillValueType_Tailor, LowestLv = 21, HighestLv = 40 };	-- 1�ѶQ�ڵ��_����
	g_Define[243356] = { Lv = EM_RoleValue_Skill_Tailor, Exp = EM_SkillValueType_Tailor, LowestLv = 41, HighestLv = 60 };	-- 1�ѬӮa���_����
	g_Define[243357] = { Lv = EM_RoleValue_Skill_Tailor, Exp = EM_SkillValueType_Tailor, LowestLv = 61, HighestLv = 80 };	-- 1�ѳ���´�~���P��
	g_Define[243358] = { Lv = EM_RoleValue_Skill_Tailor, Exp = EM_SkillValueType_Tailor, LowestLv = 81, HighestLv = 100 };	-- 1�ѭ��u���_����
	
	g_Define[243385] = { Lv = EM_RoleValue_Skill_Tailor, Exp = EM_SkillValueType_Tailor, LowestLv = 1, HighestLv = 20 };	-- 7�Ѧp��Ǧn���_
	g_Define[243386] = { Lv = EM_RoleValue_Skill_Tailor, Exp = EM_SkillValueType_Tailor, LowestLv = 21, HighestLv = 40 };	-- 7�ѶQ�ڵ��_����
	g_Define[243387] = { Lv = EM_RoleValue_Skill_Tailor, Exp = EM_SkillValueType_Tailor, LowestLv = 41, HighestLv = 60 };	-- 7�ѬӮa���_����
	g_Define[243388] = { Lv = EM_RoleValue_Skill_Tailor, Exp = EM_SkillValueType_Tailor, LowestLv = 61, HighestLv = 80 };	-- 7�ѳ���´�~���P��
	g_Define[243389] = { Lv = EM_RoleValue_Skill_Tailor, Exp = EM_SkillValueType_Tailor, LowestLv = 81, HighestLv = 100 };	-- 7�ѭ��u���_����
	
	g_Define[202720] = { Lv = EM_RoleValue_Skill_Tailor, Exp = EM_SkillValueType_Tailor, LowestLv = 1, HighestLv = 20 };	-- 30�Ѧp��Ǧn���_
	g_Define[202721] = { Lv = EM_RoleValue_Skill_Tailor, Exp = EM_SkillValueType_Tailor, LowestLv = 21, HighestLv = 40 };	-- 30�ѶQ�ڵ��_����
	g_Define[202722] = { Lv = EM_RoleValue_Skill_Tailor, Exp = EM_SkillValueType_Tailor, LowestLv = 41, HighestLv = 60 };	-- 30�ѬӮa���_����
	g_Define[240478] = { Lv = EM_RoleValue_Skill_Tailor, Exp = EM_SkillValueType_Tailor, LowestLv = 61, HighestLv = 80 };	-- 30�ѳ���´�~���P��
	g_Define[240479] = { Lv = EM_RoleValue_Skill_Tailor, Exp = EM_SkillValueType_Tailor, LowestLv = 81, HighestLv = 100 };	-- 30�ѭ��u���_����
	-- �i��
	g_Define[243359] = { Lv = EM_RoleValue_Skill_Cook, Exp = EM_SkillValueType_Cook, LowestLv = 1, HighestLv = 20 };	-- 1�ѷR�W�i�����Ĥ@�B
	g_Define[243360] = { Lv = EM_RoleValue_Skill_Cook, Exp = EM_SkillValueType_Cook, LowestLv = 21, HighestLv = 40 };	-- 1�ѧ��R�H���G
	g_Define[243361] = { Lv = EM_RoleValue_Skill_Cook, Exp = EM_SkillValueType_Cook, LowestLv = 41, HighestLv = 60 };	-- 1�Ѳi������
	g_Define[243362] = { Lv = EM_RoleValue_Skill_Cook, Exp = EM_SkillValueType_Cook, LowestLv = 61, HighestLv = 80 };	-- 1�ѮƲz�F�H���p�е�
	g_Define[243363] = { Lv = EM_RoleValue_Skill_Cook, Exp = EM_SkillValueType_Cook, LowestLv = 81, HighestLv = 100 };	-- 1�ѷ��P�Ʋz���O��
	
	g_Define[243390] = { Lv = EM_RoleValue_Skill_Cook, Exp = EM_SkillValueType_Cook, LowestLv = 1, HighestLv = 20 };	-- 7�ѷR�W�i�����Ĥ@�B
	g_Define[243391] = { Lv = EM_RoleValue_Skill_Cook, Exp = EM_SkillValueType_Cook, LowestLv = 21, HighestLv = 40 };	-- 7�ѧ��R�H���G
	g_Define[243392] = { Lv = EM_RoleValue_Skill_Cook, Exp = EM_SkillValueType_Cook, LowestLv = 41, HighestLv = 60 };	-- 7�Ѳi������
	g_Define[243393] = { Lv = EM_RoleValue_Skill_Cook, Exp = EM_SkillValueType_Cook, LowestLv = 61, HighestLv = 80 };	-- 7�ѮƲz�F�H���p�е�
	g_Define[243394] = { Lv = EM_RoleValue_Skill_Cook, Exp = EM_SkillValueType_Cook, LowestLv = 81, HighestLv = 100 };	-- 7�ѷ��P�Ʋz���O��
	
	g_Define[202717] = { Lv = EM_RoleValue_Skill_Cook, Exp = EM_SkillValueType_Cook, LowestLv = 1, HighestLv = 20 };	-- 30�ѷR�W�i�����Ĥ@�B
	g_Define[202718] = { Lv = EM_RoleValue_Skill_Cook, Exp = EM_SkillValueType_Cook, LowestLv = 21, HighestLv = 40 };	-- 30�ѧ��R�H���G
	g_Define[202719] = { Lv = EM_RoleValue_Skill_Cook, Exp = EM_SkillValueType_Cook, LowestLv = 41, HighestLv = 60 };	-- 30�Ѳi������
	g_Define[240476] = { Lv = EM_RoleValue_Skill_Cook, Exp = EM_SkillValueType_Cook, LowestLv = 61, HighestLv = 80 };	-- 30�ѮƲz�F�H���p�е�
	g_Define[240483] = { Lv = EM_RoleValue_Skill_Cook, Exp = EM_SkillValueType_Cook, LowestLv = 81, HighestLv = 100 };	-- 30�ѷ��P�Ʋz���O��
	-- �Ҫ�
	g_Define[243364] = { Lv = EM_RoleValue_Skill_Alchemy, Exp = EM_SkillValueType_Alchemy, LowestLv = 1, HighestLv = 20 };	-- 1�Ѱ�¦�Ҫ���
	g_Define[243365] = { Lv = EM_RoleValue_Skill_Alchemy, Exp = EM_SkillValueType_Alchemy, LowestLv = 21, HighestLv = 40 };	-- 1�Ѷi���Ҫ��N
	g_Define[243366] = { Lv = EM_RoleValue_Skill_Alchemy, Exp = EM_SkillValueType_Alchemy, LowestLv = 41, HighestLv = 60 };	-- 1�Ѳ`���Ҫ��N
	g_Define[243367] = { Lv = EM_RoleValue_Skill_Alchemy, Exp = EM_SkillValueType_Alchemy, LowestLv = 61, HighestLv = 80 };	-- 1�ѽ�̪�������N
	g_Define[243368] = { Lv = EM_RoleValue_Skill_Alchemy, Exp = EM_SkillValueType_Alchemy, LowestLv = 81, HighestLv = 100 };	-- 1�ѯE�v�Ҫ��⥾
	
	g_Define[243395] = { Lv = EM_RoleValue_Skill_Alchemy, Exp = EM_SkillValueType_Alchemy, LowestLv = 1, HighestLv = 20 };	-- 7�Ѱ�¦�Ҫ���
	g_Define[243396] = { Lv = EM_RoleValue_Skill_Alchemy, Exp = EM_SkillValueType_Alchemy, LowestLv = 21, HighestLv = 40 };	-- 7�Ѷi���Ҫ��N
	g_Define[243397] = { Lv = EM_RoleValue_Skill_Alchemy, Exp = EM_SkillValueType_Alchemy, LowestLv = 41, HighestLv = 60 };	-- 7�Ѳ`���Ҫ��N
	g_Define[243398] = { Lv = EM_RoleValue_Skill_Alchemy, Exp = EM_SkillValueType_Alchemy, LowestLv = 61, HighestLv = 80 };	-- 7�ѽ�̪�������N
	g_Define[243399] = { Lv = EM_RoleValue_Skill_Alchemy, Exp = EM_SkillValueType_Alchemy, LowestLv = 81, HighestLv = 100 };	-- 7�ѯE�v�Ҫ��⥾
	
	g_Define[202723] = { Lv = EM_RoleValue_Skill_Alchemy, Exp = EM_SkillValueType_Alchemy, LowestLv = 1, HighestLv = 20 };	-- 30�Ѱ�¦�Ҫ���
	g_Define[202724] = { Lv = EM_RoleValue_Skill_Alchemy, Exp = EM_SkillValueType_Alchemy, LowestLv = 21, HighestLv = 40 };	-- 30�Ѷi���Ҫ��N
	g_Define[202725] = { Lv = EM_RoleValue_Skill_Alchemy, Exp = EM_SkillValueType_Alchemy, LowestLv = 41, HighestLv = 60 };	-- 30�Ѳ`���Ҫ��N
	g_Define[240480] = { Lv = EM_RoleValue_Skill_Alchemy, Exp = EM_SkillValueType_Alchemy, LowestLv = 61, HighestLv = 80 };	-- 30�ѽ�̪�������N
	g_Define[240477] = { Lv = EM_RoleValue_Skill_Alchemy, Exp = EM_SkillValueType_Alchemy, LowestLv = 81, HighestLv = 100 };	-- 30�ѯE�v�Ҫ��⥾

	-- ��X(�H����@)
	--CraftExp �H�����C���\Ū�ɵ������g���
	local g_MixBookID = { 243338, 243369, 202729 };	-- 1�ѡB7�ѡB30�ѻs�y�j�ʬ�
	
	for i = 1, #g_MixBookID do
		g_Define[g_MixBookID[i]] = { LowestLv = 1, HighestLv = false, CraftExp = 0.1933 };
		g_Define[g_MixBookID[i]].Lv = {
					EM_RoleValue_Skill_BlackSmith,
					EM_RoleValue_Skill_Carpenter,
					EM_RoleValue_Skill_MakeArmor,
					EM_RoleValue_Skill_Tailor,
					EM_RoleValue_Skill_Cook,
					EM_RoleValue_Skill_Alchemy
									};
		g_Define[g_MixBookID[i]].Exp = {
					EM_SkillValueType_BlackSmith,
					EM_SkillValueType_Carpenter,
					EM_SkillValueType_MakeArmor,
					EM_SkillValueType_Tailor,
					EM_SkillValueType_Cook,
					EM_SkillValueType_Alchemy
									};
	end
end

-- �P�_���šA�קK���a���Ŧb�\Ū�ɶ��������ܾ\Ū���ŤW���ɡA�̵M�i�H����\Ū�����D�C
local function CheckLv( Owner, RoomID, BookID, Define )

	local Lv = ReadRoleValue( Owner, Define );
--	DebugMsg( Owner, RoomID, "Skill Lv = "..Lv..", LowestLv = "..g_Define[BookID].LowestLv..", HighestLv = "..g_Define[BookID].HighestLv );

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
--	DebugMsg( Owner, RoomID, "ReadBookID = "..BookID );
	if CountBodyItem( Owner, BookID ) == 0 then
		ScriptMessage( Owner, Owner, 0, "[SC_NOITEM]", 0 );	-- �A�S����
		ScriptMessage( Owner, Owner, 1, "[SC_NOITEM]", 0 );
		return false;
	end
	return true;
end

-- �p�� Craft �ʬ�
function Encyclopedia_CraftExp( BookID )	-- ���~ID

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

	if not g_Define[BookID].HighestLv then	-- ��X�������y�A�C���H����@
		CallPlot( Owner, "Encyclopedia_CraftExp_BeginRandom", Owner, RoomID, BookID );
	else
		CallPlot( Owner, "Encyclopedia_CraftExp_Begin", Owner, RoomID, BookID );
	end
end

function Encyclopedia_CraftExp_Begin( Owner, RoomID, BookID )

	local GainCraftExp = 0;	-- �\Ū��W�[���g���
	for Index, Value in pairs(g_CraftExpIndex) do
		if Index == g_Define[BookID].LowestLv then
			GainCraftExp = Value;
		--	DebugMsg( Owner, RoomID, "GainCraftExp Basic = "..GainCraftExp );
			break;
		end
	end

	if ( not CheckLv( Owner, RoomID, BookID, g_Define[BookID].Lv ) ) then
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
		-- �\Ū���ˬd�G���Ť��ŦX�B���y���s�b�B�\Ū���G����
		if ( not CheckLv( Owner, RoomID, BookID, g_Define[BookID].Lv ) ) or ( not CheckBook( Owner, RoomID, BookID ) ) or ( not Complete ) then
			break;
		end

		-- �\Ū���\�ɰ���
		local Random = math.random( g_ResultCraftRatioTotal );
		local ResultCraftExp = GainCraftExp*g_ResultCraftRatio[Random];	-- ��¦�� * �Ĳv���v

	--	DebugMsg( Owner, RoomID, "["..BookID.."]".."Basic Exp = "..GainCraftExp..", Random Ratio = "..string.format( "%.2f", g_ResultCraftRatio[Random] )..", Math Exp = "..string.format( "%.3f", ResultCraftExp ) );
		SysCastSpellLv( Owner, Owner, g_ResultMagicColID[Random], 0 );
		ScriptMessage( Owner, Owner, 0, g_ResultString[Random], 0 );
		AddSkillValue( Owner, g_Define[BookID].Exp, ResultCraftExp );
		Sleep(2);
	end
	PlayMotion( Owner, ruFUSION_ACTORSTATE_READING_END );	-- �_��
	CancelBuff_NoEvent( Owner, g_ReadBookMagicID );
end

function Encyclopedia_CraftExp_BeginRandom( Owner, RoomID, BookID )	-- �B�z�����H����@�إͲ��g��Ȫ�����

	for Index, value in pairs(g_Define[BookID].Lv) do	-- �T�{ 6 �إͲ��ޯ�O�_���w�g�ǲ�
		local Lv = ReadRoleValue( Owner, Value );
	--	DebugMsg( Owner, RoomID, "Lv = "..Lv );
		if Lv < 1 then
			ScriptMessage( Owner, Owner, 0, "[SC_NOTRIGHTLV_1]", 0 )	-- �A�����Ŧ��G����\Ū����
			ScriptMessage( Owner, Owner, 1, "[SC_NOTRIGHTLV_1]", 0 )
			return false;
		end
	end

	local GainCraftExp = g_Define[BookID].CraftExp;	-- �\Ū��W�[���g���
--	DebugMsg( Owner, RoomID, "GainCraftExp Basic = "..GainCraftExp );

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
		if ( not CheckLv( Owner, RoomID, BookID, Define.Lv ) ) or ( not CheckBook( Owner, RoomID, BookID ) ) or ( not Complete ) then	-- �\Ū���ˬd�G���Ť��ŦX�B���y���s�b�B�\Ū���G����
			break;
		end

		-- �\Ū���\�ɰ���
		local Random = math.random( g_ResultCraftRatioTotal );
		local ResultCraftExp = GainCraftExp*g_ResultCraftRatio[Random];	-- ��¦�g��� * �����\Ū�įq

	--	DebugMsg( Owner, RoomID, "["..BookID.."]".."Basic Exp = "..GainCraftExp..", Random Ratio = "..string.format( "%.2f", g_ResultCraftRatio[Random] )..", Math Exp = "..string.format( "%.3f", ResultCraftExp ) );
		SysCastSpellLv( Owner, Owner, g_ResultMagicColID[Random], 0 );
		ScriptMessage( Owner, Owner, 0, g_ResultString[Random], 0 );
		AddSkillValue( Owner, Define.Exp, ResultCraftExp );
		Sleep(2);	-- �����n��Sleep�A�ѥ��S�Ĥ~���|����
	end
	PlayMotion( Owner, ruFUSION_ACTORSTATE_READING_END );	-- �_��
	CancelBuff_NoEvent( Owner, g_ReadBookMagicID );
end