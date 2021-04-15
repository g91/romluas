function LuaFunc_CARPENTER_Dialog() --��u
	local String = GetString("SD_CARPENTER_DIALOG")
	local Result = LuaFunc_LivinSkill_Dialog(String)
	if Result == 1 then
		SetFlag( OwnerID(), 540334, 1 );	-- ����540334��u�Ǯ{
		SetFlag( OwnerID(),540397, 1 );	-- <�������n���~540397-�t��-�Ӥ�}>
--		GiveBodyItem( OwnerID() , 530005 , 1 )
		ScriptMessage( OwnerID(), OwnerID(), 2, GetString("MSG_GET_WOODWORKER_1"), C_SYSTEM );--�e�������T���G�A�w���o��u�Ǯ{���
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("MSG_GET_WOODWORKER_1_D"), "0xFFFF8000");--�T�������T���G�A�w���o��u�Ǯ{���A��u���ŤW����20�šC

		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("MSG_GET_WOODWORKER_FORMULA1"), C_YELLOW);--�T�������T���G�A�w�߱o�u�t��-�Ӥ�}�v�C
	end
end
----------------------------------------------------------------------------------------------------------------------
function LuaFunc_TAILOR_Dialog() --���_
	local String = GetString("SD_TAILOR_DIALOG")
	local Result = LuaFunc_LivinSkill_Dialog(String)
	if Result == 1 then
		SetFlag( OwnerID(), 540336, 1 );	-- ����540336���_�Ǯ{���
		SetFlag( OwnerID(), 540526, 1 );	-- ����540526�t��-�ʥ���
--		GiveBodyItem( OwnerID() , 530006 , 1 )
		ScriptMessage( OwnerID(), OwnerID(), 2, GetString("MSG_GET_TAILOR_1"), C_SYSTEM );--�e�������T���G�A�w���o���_�Ǯ{���
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("MSG_GET_TAILOR_1_D"), "0xFFFF8000");--�T�������T���G�A�w���o���_�Ǯ{���A���_���ŤW����20�šC

		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("MSG_GET_TAILOR_FORMULA1"), C_YELLOW);--�T�������T���G�A�w�߱o�u�t��-�ʥ��ǡv�C
	end
end
---------------------------------------------------------------------------------------
function LuaFunc_MAKEARMOR_Dialog() --�s��
	local String = GetString("SD_MAKEARMOR_DIALOG")
	local Result = LuaFunc_LivinSkill_Dialog(String)
	if Result == 1 then
		SetFlag( OwnerID(), 540335, 1 );	-- ����540335�s�ҾǮ{
		SetFlag( OwnerID(),540984, 1 );	-- ����540504�t��-���O�ݥ�

--		GiveBodyItem( OwnerID() , 530004 , 1 )
		ScriptMessage( OwnerID(), OwnerID(), 2, GetString("MSG_GET_ARMOR_1"), C_SYSTEM );--�e�������T���G�A�w���o�s�ҾǮ{���
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("MSG_GET_ARMOR_1_D"), "0xFFFF8000");--�T�������T���G�A�w���o�s�ҾǮ{���A�s�ҵ��ŤW����20�šC
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("MSG_GET_ARMOR_FORMULA1"), C_YELLOW);--�T�������T���G�A�w�߱o�u�t��-���O�ݥҡv�C
--		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("MSG_GET_ARMOR_FORMULA2"), C_YELLOW);--�T�������T���G�A�w�߱o�u�ֱa�v���s�y�覡�C
	end
end
-------------------------------------------------------------------------------------
function LuaFunc_BLACKSMITH_Dialog() --���K
	local String = GetString("SD_BLACKSMITH_DIALOG")
	local Result = LuaFunc_LivinSkill_Dialog(String)
	if Result == 1 then
		SetFlag( OwnerID(), 540268, 1 );	-- ����540268���K�Ǯ{
		SetFlag( OwnerID(), 540278, 1 );	-- <�������n���~540278-�t��-�^�v���>
--		GiveBodyItem( OwnerID() , 530003 , 1 )
		ScriptMessage( OwnerID(), OwnerID(), 2, GetString("MSG_GET_BLACKSMITH_1"), C_SYSTEM );--�e�������T���G�A�w���o���K�Ǯ{���
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("MSG_GET_BLACKSMITH_1_D"), "0xFFFF8000");--�T�������T���G�A�w���o���K�Ǯ{���A���K���ŤW����20�šC
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("MSG_GET_BLACKSMITH_FORMULA1"), C_YELLOW);--�T�������T���G�A�w�߱o�u�t��-�^�v��ҡv�C
	end
end

-------------------------------------------------------------------------------------
function LuaFunc_DISSOLUTION_Dialog() --���ѳN
	local String = GetString("SD_DISSOLUTION_DIALOG")
	local Result = LuaFunc_LivinSkill_Dialog(String)
	if Result == 1 then
		SetFlag( OwnerID(), 540002, 1 );	-- ����540002���ѳN
		ScriptMessage( OwnerID(), OwnerID(), 2, GetString("MSG_GET_DISSOLUTION_1"), C_SYSTEM );--�e�������T���G�A�w�Ƿ|���ѳN				ScriptMessage( OwnerID(), OwnerID(), 0, GetString("MSG_GET_DISSOLUTION_1_D"), C_YELLOW);--�T�������T���G�A�w�Ƿ|���ѳN
	end
end