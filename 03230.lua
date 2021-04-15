
local g_ZoneID = 400;	-- �p��ID
local g_ReadTime = 600;	-- �ϥΫ᪺�\Ū�ɶ�(��� 0.1 ��)�A�w�]�� 60 ��
local g_ReadSpeedUpBuffID = {  500150, 500151, 500152 }	-- 1�ѡB7�ѡB30�Ѥp�Φʬ�[�t�ľ�
local g_ReadSpeedUpRatio = 0.7;	-- �ϥδ����\Ū�t�׫�A���C���\Ū�ɶ����v

-- Tp ���ު�A�U�ŶZ�C������o����¦�g��ȡATable�����u¾�~�k�N�g��ȡv
local g_TpIndex = {};	-- ����Ѽ� = �N 1 �Ŵ����� 2 �Ū��ɶ��]�� 1 �����@����ƫ�վ㪺�����A�Ա��Ш���� - (6.4.0)�p�Φʬ��I�ƽվ�
g_TpIndex[1] = 7.27;	-- 1 - 30�A���� = 1 - 30�ũһ��`�g��� / ����Ѽ� / 1440(1��=1440����) / (1/3+2/3+3/3+4/3)/4 (�\Ū���G�����Ĳv )  = 7.27
g_TpIndex[31] = 16.12;	-- 31 - 40
g_TpIndex[41] = 170.79;	-- 41 - 60
g_TpIndex[61] = 428.42;	-- 61 - 70
g_TpIndex[71] = 548.43;	-- 71 - 80
g_TpIndex[81] = 602.74;	-- 81 - 90
g_TpIndex[91] = 638.99;	-- 91 - 100

local g_ReadBookMagicID = 502087;	-- ������y���S��

local g_ResultTpRatio = { 1/3, 2/3, 1, 4/3 };	-- ��o�� 4 ��Tp���v
local g_ResultMagicColID = { 492441, 492442, 492443, 492444 };	-- �S�ġA�����g��ȭ��v
local g_ResultString = { "[SC_LEARN_1]", "[SC_LEARN_2]", "[SC_LEARN_3]", "[SC_LEARN_4]" };
local g_ResultSum = #g_ResultTpRatio;
-- 1 = �A�b�\Ū���ɭԺεۤF�A�եծ��O�F�ɶ�
-- 2 = �A�^�^��Ū�F�@�M�A�����\�h�a��ݤ���
-- 3 = �A���V�O���A���H��í�w����
-- 4 = �A���p�����鳻�AŪ�_�ѨӨƥb�\��

local g_LvCap = {};
g_LvCap[242793] = { LowestLv = 1, HighestLv = 30 };	-- 1�ѧޯ�׷Ҧʬ�I
g_LvCap[242794] = { LowestLv = 31, HighestLv = 40 };	-- 1�ѧޯ�׷Ҧʬ�II
g_LvCap[242799] = { LowestLv = 41, HighestLv = 60 };	-- 1�ѧޯ�׷Ҧʬ�III
g_LvCap[242800] = { LowestLv = 61, HighestLv = 70 };	-- 1�ѧޯ�׷Ҧʬ�IV
g_LvCap[242801] = { LowestLv = 71, HighestLv = 80 };	-- 1�ѧޯ�׷Ҧʬ�V
g_LvCap[242802] = { LowestLv = 81, HighestLv = 90 };	-- 1�ѧޯ�׷Ҧʬ�VI
g_LvCap[242804] = { LowestLv = 91, HighestLv = 100 };	-- 1�ѧޯ�׷Ҧʬ�VII

g_LvCap[243311] = { LowestLv = 1, HighestLv = 30 };	-- 7�ѧޯ�׷Ҧʬ�I
g_LvCap[243312] = { LowestLv = 31, HighestLv = 40 };	-- 7�ѧޯ�׷Ҧʬ�II
g_LvCap[243313] = { LowestLv = 41, HighestLv = 60 };	-- 7�ѧޯ�׷Ҧʬ�III
g_LvCap[243314] = { LowestLv = 61, HighestLv = 70 };	-- 7�ѧޯ�׷Ҧʬ�IV
g_LvCap[243315] = { LowestLv = 71, HighestLv = 80 };	-- 7�ѧޯ�׷Ҧʬ�V
g_LvCap[243316] = { LowestLv = 81, HighestLv = 90 };	-- 7�ѧޯ�׷Ҧʬ�VI
g_LvCap[243317] = { LowestLv = 91, HighestLv = 100 };	-- 7�ѧޯ�׷Ҧʬ�VII

g_LvCap[202702] = { LowestLv = 1, HighestLv = 30 };	-- 30�ѧޯ�׷Ҧʬ�I
g_LvCap[202703] = { LowestLv = 31, HighestLv = 40 };	-- 30�ѧޯ�׷Ҧʬ�II
g_LvCap[202704] = { LowestLv = 41, HighestLv = 60 };	-- 30�ѧޯ�׷Ҧʬ�III
g_LvCap[240494] = { LowestLv = 61, HighestLv = 70 };	-- 30�ѧޯ�׷Ҧʬ�IV
g_LvCap[240495] = { LowestLv = 71, HighestLv = 80 };	-- 30�ѧޯ�׷Ҧʬ�V
g_LvCap[240496] = { LowestLv = 81, HighestLv = 90 };	-- 30�ѧޯ�׷Ҧʬ�VI
g_LvCap[240497] = { LowestLv = 91, HighestLv = 100 };	-- 30�ѧޯ�׷Ҧʬ�VII

-- �p�� Tp �ʬ� 
function Encyclopedia_RoleTp( BookID )	-- ���~ID

	local Owner = OwnerID();
	local LowestLv = 0;
	local HighestLv = 0;

	for Index, Value in pairs(g_LvCap) do
		if Index == BookID then
			LowestLv = Value.LowestLv;
			HighestLv = Value.HighestLv;
		end
	end
	CallPlot( Owner, "Encyclopedia_RoleTp_ReadBegin", Owner, BookID, LowestLv, HighestLv );
end

function Encyclopedia_RoleTp_ReadBegin( Owner, BookID, LowestLv, HighestLv )

	local RoomID = ReadRoleValue( Owner, EM_RoleValue_RoomID );
	local ZoneID = ReadRoleValue( Owner, EM_RoleValue_ZoneID );
--	DebugMsg( Owner, RoomID, "ZoneID = "..ZoneID );
	if ZoneID ~= g_ZoneID then
		ScriptMessage( Owner, Owner, 0, "[SC_NOTINHOUSE]", 0 );	-- �A���b�ЫΤ�
		ScriptMessage( Owner, Owner, 1, "[SC_NOTINHOUSE]", 0 );
		return;
	end

	local GainTp = 0;	-- �\Ū��W�[���g���
	for Index, Value in pairs(g_TpIndex) do
		if Index == LowestLv then
			GainTp = Value;
		--	DebugMsg( Owner, RoomID, "GainTp Basic = "..GainTp );
			break;
		end
	end

	local function CheckLv()
		local Lv = ReadRoleValue( Owner, EM_RoleValue_Lv );
	--	DebugMsg( Owner, RoomID, "LowestLv = "..LowestLv..", HighestLv = "..HighestLv );
		-- �P�_���šA�קK���a���Ŧb�\Ū�ɶ��������ܾ\Ū���ŤW���ɡA�̵M�i�H����\Ū�����D�C
		if Lv < LowestLv or Lv > HighestLv then
			ScriptMessage( Owner, Owner, 0, "[SC_NOTRIGHTLV_1]", 0 );	--�A�����Ŧ��G����\Ū����
			ScriptMessage( Owner, Owner, 1, "[SC_NOTRIGHTLV_1]", 0 );
			return false;
		end
		return true;
	end

	local function CheckBook()
	--	DebugMsg( Owner, RoomID, "ReadBookID = "..BookID );
		-- �P�_�ѬO�_�s�b�A�קK�ѥ��b�\Ū�ɶ��������ɡA�̵M�i�H����\Ū�����D�C
		if CountBodyItem( Owner, BookID ) == 0 then
			ScriptMessage( Owner, Owner, 0, "[SC_NOITEM]", 0 );	-- �A�S����
			ScriptMessage( Owner, Owner, 1, "[SC_NOITEM]", 0 );
			return false;
		end
		return true;
	end

	if ( not CheckLv() ) then
		return false;
	end

	while true do

		local Complete = false;	-- �C��Ū�Ѫ����G

	--	if ( not CheckLv() ) or ( not CheckBook() ) then	-- �\Ū�e�ˬd�G���Ť��ŦX�B���y���s�b
	--		break;
	--	end

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
		if ( not CheckLv() ) or ( not CheckBook() ) or ( not Complete ) then	-- �\Ū���ˬd�G���Ť��ŦX�B���y���s�b�B�\Ū���G����
			break;
		end

		-- �\Ū���\�ɰ���
		local Random = math.random( g_ResultSum );
		local ResultGainTp = GainTp*g_ResultTpRatio[Random];
	--	DebugMsg( Owner, RoomID, "["..BookID.."]"..", Basic Tp = "..GainTp..", Random Ratio = "..string.format( "%.2f", g_ResultTpRatio[Random] )..", Math Tp = "..math.floor(ResultGainTp) );

		SysCastSpellLv( Owner, Owner, g_ResultMagicColID[Random], 0 );
		ScriptMessage( Owner, Owner, 0, g_ResultString[Random], 0 );
		ScriptMessage( Owner, Owner, 0, "[SC_LEARNTP][$SETVAR1="..math.floor(ResultGainTp).."]", 0 );	-- �A��o [$VAR1] �ޯ��I��
		AddRoleValue( Owner, EM_RoleValue_TpExp, ResultGainTp );
		Sleep(2);	-- �����n��Sleep�A�ѥ��S�Ĥ~���|����
	end
	PlayMotion( Owner, ruFUSION_ACTORSTATE_READING_END );	-- �_��
	CancelBuff_NoEvent( Owner, g_ReadBookMagicID );
end