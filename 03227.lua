
local g_SetMaxDurability = 12000;	-- �̤j�@�[�� ( 100 ���C������ 1�A�̤j�� 120 )
local g_SetDurability = 100;	-- �����@�[�׮ɪ��̤p��� ( 100 ���C������ 1 )

local g_SortDefine = {};	-- ���ުŶ��������ŧi����
g_SortDefine[0] = EM_ItemPacketType_Body;	-- 0 ~ 49 �ӫ��I�]�Ŷ��A50 ~ 59 �]���_���Ŷ��A60 ~ 239 ���a�I�]�Ŷ�
g_SortDefine[1] = EM_ItemPacketType_Bank;	-- �Ȧ�
g_SortDefine[2] = EM_ItemPacketType_EQ;	-- 0 ~ 21 ����e�˳�

local g_IndexID = {};	-- ���޸�Ʈw�����s������( Sort = 0 �ɬ��Z���B1 �ɬ����� )
g_IndexID[0] = { Sort = 0, Minimum = 210000, Maxmum = 219999 };	-- �Z��
g_IndexID[1] = { Sort = 1, Minimum = 220000, Maxmum = 239999 };	-- ����

local g_IndexPos = { };	-- ���޸�Ʈw�����u�˳Ƴ���v���
g_IndexPos[0] = {};
g_IndexPos[1] = {};
g_IndexPos[0][0] = { 0, 1, 2, 3, 5 };	-- �Z���G�D��B�Ƥ�B�D�Ƥ�B����B�}
g_IndexPos[1][0] = { 0, 1, 2, 3, 4, 5, 6, 7, 11 };	-- ����G�Y�B��M�B�c�l�B�W���B�U���B�ܭ��B�y�a�B�ӥҡB�޵P
g_IndexPos[1][1] = { 8, 9, 10 };	-- ����.���~�G����B�٫��B����
g_IndexPos[1][2] = { 13 };	-- ����.�˹��~�G�˹��~

function IncreaseDurability(Sort,Pos)	-- �������~�@�[�סA�ϥΫe�ˬd

	local Owner = OwnerID();
	local Room = ReadRoleValue( Owner, EM_RoleValue_RoomID );
	local ID = GetItemInfo( Owner, g_SortDefine[Sort], Pos, EM_ItemValueType_OrgObjID );
	local MaxDurable = GetItemInfo( Owner, g_SortDefine[Sort], Pos, EM_ItemValueType_MaxDurable );	-- �̤j�@�[��
	local SortResult = false;	-- ���~�����G�Z���B����B���~

--	DebugMsg( Owner, Room, "Sort = "..Sort..", Pos = "..Pos..", ID = "..ID..", MaxDurable = "..MaxDurable );

	if MaxDurable == 0 then	-- �@�[�׬� 0 �����~�L�k�ϥ�
		DebugMsg( Owner, Room, "�@�[�׬�0�A�L�k�ϥ�" );
		return false;
	end

	for Index, Value in pairs(g_IndexID) do
	--	DebugMsg( Owner, Room, "�̤p�� = "..tostring(Value.Minimum)..", �̤j�� = "..tostring(Value.Maxmum) );
		if ID >= Value.Minimum and ID <= Value.Maxmum then
			SortResult = Value.Sort;
		--	DebugMsg( Owner, Room, "SortResult = "..tostring(SortResult) );
			break;
		end
	end

	-- �ŦX�Z���B����䤤���@�������A�o�b����P�{�����޽s�����ŦX�ɧY�L�k�ϥΡA�קK����Ʈw�s���X�W�ɾɭP���~�����D�C
	if not SortResult then
		DebugMsg( Owner, Room, "ID���šA�L�k�ϥ�" );
		return false;
	end

	local EqPos

	if SortResult == 0 then	-- �Z��
		EqPos = GameObjInfo_Int( ID, "WeaponPos" );	-- �ΥH�P�w����تZ��
	elseif SortResult == 1 then	-- ����
		EqPos = GameObjInfo_Int( ID, "ArmorPos" );	-- �ΥH�P�w�O��ظ˳������G����B���~�B�˹��~
	end
	DebugMsg( Owner, Room, "SortResult = "..SortResult..", EqPos = "..EqPos.." , Totally = "..tostring(#g_IndexPos[SortResult]) );

	local SortResultSub = nil; -- �l���ؤ����A���� g_IndexPos

	for Index, Value in ipairs(g_IndexPos[SortResult]) do
		DebugMsg( Owner, Room, "64.Value = "..tostring(Value)..", Totally = "..#Value..", Index = "..Index );
		for i = 0, #Value do
			DebugMsg( Owner, Room, "SortResult = "..SortResult..", EqPos = "..EqPos.." , Value = "..Value[i] );
			if EqPos == Value[i] then
				SortResultSub = EqPos;
				break;
			end
		end
	--	if SortResultSub then
	--		break;
	--	end
	end
	DebugMsg( Owner, Room, "�l���� = "..tostring(SortResultSub) );
	if not SortResultSub then
		DebugMsg( Owner, Room, "�l���ؤ��šA�L�k�ϥ�" );	-- �����u�ġB�Ķ��u��B�k�_
		return false;
	end
	return;
end

	-- Armor ����
	-- Accessory ���~
	-- Weapon �Z��
	-- Back �˹��~