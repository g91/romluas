
local g_ZoneID = 400;	-- �p��ID
local g_ReadTime = 600;	-- �ϥΫ᪺�\Ū�ɶ�(��� 0.1 ��)�A�w�]�� 60 ��
local g_ReadSpeedUpBuffID = {  500150, 500151, 500152 }	-- 1�ѡB7�ѡB30�Ѥp�Φʬ�[�t�ľ�
local g_ReadSpeedUpRatio = 0.7;	-- �ϥδ����\Ū�t�׫�A���C���\Ū�ɶ����v

-- Exp ���ު�A�U�ŶZ�C������o����¦�g��ȡATable�����u¾�~�g��ȡv*�u¾�~�g��ȵ��Ŧ����v�v = �ݨD�g���
local g_ExpIndex = {};	-- ����Ѽ� = �N 1 �Ŵ����� 2 �Ū��ɶ��]�� 1 �����@����ƫ�վ㪺�����A�Ա��Ш���� - (6.4.0)�p�Φʬ��I�ƽվ�
g_ExpIndex[1] = 53.12;	-- 1 - 30�A���� = 1 - 30�ũһ��`�g��� / ����Ѽ� / 1440(1��=1440����) / (1/3+2/3+3/3+4/3)/4 (�\Ū���G�����Ĳv )  = 72.19
g_ExpIndex[31] = 165.46;	-- 31 - 40
g_ExpIndex[41] = 2051.36;	-- 41 - 60
g_ExpIndex[61] = 5061.21;	-- 61 - 70
g_ExpIndex[71] = 5479.89;	-- 71 - 80
g_ExpIndex[81] = 6154.43;	-- 81 - 90�A80�ū�]¾�~�g��Ȱ��d�� 69508�A���B�~�l�[�Y�ơA�Ա��Ш����
g_ExpIndex[91] = 7152.23;	-- 91 - 100

local g_ReadBookMagicID = 501609;	-- ������y���S��

local g_ResultExpRatio = { 1/3, 2/3, 1, 4/3 };	-- ��o�� 4 �� Exp ���v
local g_ResultMagicColID = { 492441, 492442, 492443, 492444 };	-- �S�ġA�����g��ȭ��v
local g_ResultString = { "[SC_LEARN_1]", "[SC_LEARN_2]", "[SC_LEARN_3]", "[SC_LEARN_4]" };
local g_ResultSum = #g_ResultExpRatio;
-- 1 = �A�b�\Ū���ɭԺεۤF�A�եծ��O�F�ɶ�
-- 2 = �A�^�^��Ū�F�@�M�A�����\�h�a��ݤ���
-- 3 = �A���V�O���A���H��í�w����
-- 4 = �A���p�����鳻�AŪ�_�ѨӨƥb�\��

local g_LvCap = {};
g_LvCap[242791] = { LowestLv = 1, HighestLv = 30 };	-- 1�Ѿ԰��нm�ʬ�I
g_LvCap[242792] = { LowestLv = 31, HighestLv = 40 };	-- 1�Ѿ԰��нm�ʬ�II
g_LvCap[242795] = { LowestLv = 41, HighestLv = 60 };	-- 1�Ѿ԰��нm�ʬ�III
g_LvCap[242796] = { LowestLv = 61, HighestLv = 70 };	-- 1�Ѿ԰��нm�ʬ�IV
g_LvCap[242797] = { LowestLv = 71, HighestLv = 80 };	-- 1�Ѿ԰��нm�ʬ�V
g_LvCap[242798] = { LowestLv = 81, HighestLv = 90 };	-- 1�Ѿ԰��нm�ʬ�VI
g_LvCap[242803] = { LowestLv = 91, HighestLv = 100 };	-- 1�Ѿ԰��нm�ʬ�VII

g_LvCap[243304] = { LowestLv = 1, HighestLv = 30 };	-- 7�Ѿ԰��нm�ʬ�I
g_LvCap[243305] = { LowestLv = 31, HighestLv = 40 };	-- 7�Ѿ԰��нm�ʬ�II
g_LvCap[243306] = { LowestLv = 41, HighestLv = 60 };	-- 7�Ѿ԰��нm�ʬ�III
g_LvCap[243307] = { LowestLv = 61, HighestLv = 70 };	-- 7�Ѿ԰��нm�ʬ�IV
g_LvCap[243308] = { LowestLv = 71, HighestLv = 80 };	-- 7�Ѿ԰��нm�ʬ�V
g_LvCap[243309] = { LowestLv = 81, HighestLv = 90 };	-- 7�Ѿ԰��нm�ʬ�VI
g_LvCap[243310] = { LowestLv = 91, HighestLv = 100 };	-- 7�Ѿ԰��нm�ʬ�VII

g_LvCap[202699] = { LowestLv = 1, HighestLv = 30 };	-- 30�Ѿ԰��нm�ʬ�I
g_LvCap[202700] = { LowestLv = 31, HighestLv = 40 };	-- 30�Ѿ԰��нm�ʬ�II
g_LvCap[202701] = { LowestLv = 41, HighestLv = 60 };	-- 30�Ѿ԰��нm�ʬ�III
g_LvCap[240490] = { LowestLv = 61, HighestLv = 70 };	-- 30�Ѿ԰��нm�ʬ�IV
g_LvCap[240491] = { LowestLv = 71, HighestLv = 80 };	-- 30�Ѿ԰��нm�ʬ�V
g_LvCap[240492] = { LowestLv = 81, HighestLv = 90 };	-- 30�Ѿ԰��нm�ʬ�VI
g_LvCap[240493] = { LowestLv = 91, HighestLv = 100 };	-- 30�Ѿ԰��нm�ʬ�VII

-- �p�� Exp �ʬ� 
function Encyclopedia_RoleExp( BookID )	-- ���~ID

	local Owner = OwnerID();
	local LowestLv = 0;	-- �̧C����
	local HighestLv = 0;	-- �̰�����

	for Index, Value in pairs(g_LvCap) do
		if Index == BookID then
			LowestLv = Value.LowestLv;
			HighestLv = Value.HighestLv;
			break
		end
	end
	CallPlot( Owner, "Encyclopedia_RoleExp_ReadBegin", Owner, BookID, LowestLv, HighestLv );
end

function Encyclopedia_RoleExp_ReadBegin( Owner, BookID, LowestLv, HighestLv )

	local RoomID = ReadRoleValue( Owner, EM_RoleValue_RoomID );
	local ZoneID = ReadRoleValue( Owner, EM_RoleValue_ZoneID );
--	DebugMsg( Owner, RoomID, "ZoneID = "..ZoneID );
	if ZoneID ~= g_ZoneID then
		ScriptMessage( Owner, Owner, 0, "[SC_NOTINHOUSE]", 0 );	-- �A���b�ЫΤ�
		ScriptMessage( Owner, Owner, 1, "[SC_NOTINHOUSE]", 0 );
		return;
	end

	local GainExp = 0;	-- �\Ū��W�[���g���
	for Index, Value in pairs(g_ExpIndex) do
		if Index == LowestLv then
			GainExp = Value;
		--	DebugMsg( Owner, RoomID, "Basic GainExp = "..GainExp );
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
		local ResultGainExp = GainExp*g_ResultExpRatio[Random];

	--	DebugMsg( Owner, RoomID, "["..BookID.."]"..", Basic Exp = "..GainExp..", Random Ratio = "..string.format( "%.2f", g_ResultExpRatio[Random] )..", Math Exp = "..string.format( "%.2f", ResultGainExp ) );
		SysCastSpellLv( Owner, Owner, g_ResultMagicColID[Random], 0 );
		ScriptMessage( Owner, Owner, 0, g_ResultString[Random], 0 );
		AddEXP( Owner, ResultGainExp );
		Sleep(2);	-- �����n��Sleep�A�ѥ��S�Ĥ~���|����
	end
	PlayMotion( Owner, ruFUSION_ACTORSTATE_READING_END );	-- �_��
	CancelBuff_NoEvent( Owner, g_ReadBookMagicID );
end

function Encyclopedia_CheckBuff()	-- �ϥΪ��~�ɡA�T�{�ؼШ��W�O�_�� 1�ѡB7�ѡB30�Ѫ��p�Φʬ�[�t�ľ�

	local Owner = OwnerID();

	for Index, Value in pairs(g_ReadSpeedUpBuffID) do
		if CheckBuff( Owner, Value ) then
			ScriptMessage( Owner, Owner, 1, "[MSG_EFFECT_HAVE]", C_DEFAULT );  -- ���~�ϥΥ��ѡA���ĪG�w�s�b
			return false;
		end
	end
	return true;
end

function Encyclopedia_CheckBuffResult(Guid,BuffList)	-- �\Ū���\�ɡA�T�{�ؼШ��W�O�_���p�Φʬ�[�t�ľ�

	if not BuffList then
		return false;
	end

	local Guid = Guid or OwnerID();
	for Index, Value in pairs(BuffList) do
		if CheckBuff( Guid, Value ) then
			return true;
		end
	end
	return false;
end