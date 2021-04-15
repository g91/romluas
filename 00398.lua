-----------------------------------------------------------------------------
function LuaFunc_MINING_Dialog() --���q
	local String = GetString("SD_MINING_DIALOG")
	local Result = LuaFunc_LivinSkill_Dialog(String)
	if Result == 1 then
		SetFlag( OwnerID(), 540269, 1 );	-- <�������n���~540269-���q�Ǯ{>
		GiveBodyItem( OwnerID() , 540376 , 1 )	-- <�������n���~540376-�t��-���ɬ�>
--		GiveBodyItem( OwnerID() , 540377 , 1 )	-- <�������n���~540377-�t��-����>							   
--		GiveBodyItem( OwnerID() , 530000 , 1 )	-- <�����ٸ�530000-���q�Ǯ{>

		SetFlag( OwnerID(), 540808, 1 )	-- <�s��ɤޥέ��n���~540808-�ǲ߫��q>

		ScriptMessage( OwnerID(), OwnerID(), 2, GetString("MSG_GET_MINE_1"), C_SYSTEM );--�e�������T���G�A�w���o���q�Ǯ{���
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("MSG_GET_MINE_1_D"), "0xFFFF8000");--�T�������T���G�A�w���o���q�Ǯ{���A���q���ŤW����20�šC
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("MSG_GET_FORMULA_MINE_1"), C_YELLOW);--�T�������T���G�A�w�߱o�u�t��-���ɬ�v�C
--		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("MSG_GET_FORMULA_MINE_2"), C_YELLOW);--�T�������T���G�A�w�߱o�u�t��-����v�C
--		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("MSG_GET_FORMULA_MINE_3"), C_YELLOW);--�T�������T���G�߱o���ۺ���C
	end
end
----------------------------------------------------------------------------------
function LuaFunc_LUMBERING_Dialog() --���
	local String = GetString("SD_LUMBERING_DIALOG")
	local Result = LuaFunc_LivinSkill_Dialog(String)
	if Result == 1 then
		SetFlag( OwnerID(), 540270, 1 );	-- <�������n���~540270-���Ǯ{>
		GiveBodyItem( OwnerID() , 540648 , 1 )	-- <�������n���~540648-�t��-�����>
--		GiveBodyItem( OwnerID() , 540649 , 1 )	-- <�������n���~540649-�t��-�h���>		
--		GiveBodyItem( OwnerID() , 530001 , 1 )	-- <�����ٸ�530001-���Ǯ{>

		SetFlag( OwnerID(), 540809, 1 )	-- <�s��ɤޥέ��n���~540809-�ǲߥ��>

		ScriptMessage( OwnerID(), OwnerID(), 2, GetString("MSG_GET_WOOD_1"), C_SYSTEM );--�e�������T���G�A�w���o��쪺�Ǯ{���
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("MSG_GET_WOOD_1_D"),"0xFFFF8000");--�T�������T���G�A�w���o��쪺�Ǯ{���A���q���ŤW����20�šC
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("MSG_GET_FORMULA_WOOD_1"), C_YELLOW);--�T�������T���G�A�w�߱o�u�t��-������v�C
--		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("MSG_GET_FORMULA_WOOD_2"), C_YELLOW);--�T�������T���G�A�w�߱o�u�t��-�h����v�C
	end
end
-----------------------------------------------------------------------------------
function LuaFunc_HERBLISM_Dialog() --����
	local String = GetString("SD_HERBLISM_DIALOG")
	local Result = LuaFunc_LivinSkill_Dialog(String)
	if Result == 1 then
		SetFlag( OwnerID(), 540333, 1 );	-- <�������n���~540333-���ľǮ{>
		GiveBodyItem( OwnerID() , 540661 , 1 )	-- <�������n���~540661-�t��-�s�]�����>
--		GiveBodyItem( OwnerID() , 540662 , 1 )	-- <�������n���~540662-�t��-���ߪG���G>		
--		GiveBodyItem( OwnerID() , 530002 , 1 )	-- <�����ٸ�530002-���ľǮ{>

		SetFlag( OwnerID(), 540810, 1 )	-- <�s��ɤޥέ��n���~540810-�ǲ߱į�>

		ScriptMessage( OwnerID(), OwnerID(), 2, GetString("MSG_GET_HERB_1"), C_SYSTEM );--�e�������T���G�A�w���o���Ī��Ǯ{���
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("MSG_GET_HERB_1_D"), "0xFFFF8000");--�T�������T���G�A�w���o���Ī��Ǯ{���A���ĵ��ŤW����20�šC
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("MSG_GET_FORMULA_HERB_1"), C_YELLOW);--�T�������T���G�A�w�߱o�u�t��-�s�]������v�C
--		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("MSG_GET_FORMULA_HERB_2"), C_YELLOW);--�T�������T���G�A�w�߱o�u�t��-���ߪG���G�v�C
	end
end
----------------------------------------------------------------------------------
function LuaFunc_ALCHEMY_Dialog() --�Ҫ�
	local String = GetString("SD_ALCHEMY_DIALOG")
	local Result = LuaFunc_LivinSkill_Dialog(String)
	if Result == 1 then
		SetFlag( OwnerID(), 540338, 1 );	-- ����540338�Ҫ��Ǯ{
		SetFlag( OwnerID(), 540606, 1 );	-- ����540606�t��-��¦������

--		GiveBodyItem( OwnerID() , 530008 , 1 )
		ScriptMessage( OwnerID(), OwnerID(), 2, GetString("MSG_GET_ALCHEMY_1"), C_SYSTEM );--�e�������T���G�A�w���o�Ҫ��Ǯ{���
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("MSG_GET_ALCHEMY_1_D"), "0xFFFF8000");--�T�������T���G�A�w���o�Ҫ��Ǯ{���A�Ҫ����ŤW����20�šC

		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("MSG_GET_ALCHEMY_FORMULA1"), C_YELLOW);--�T�������T���G�A�w�߱o�u�t��-��¦�����ġv�C
--		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("MSG_GET_ALCHEMY_FORMULA2"), C_YELLOW);--�T�������T���G�A�w�߱o�u��¦�����ġv���s�y�覡�C
	end
end
---------------------------------------------------------------------------------------
function LuaFunc_COOK_Dialog() --�i��
	local String = GetString("SD_COOK_DIALOG")
	local Result = LuaFunc_LivinSkill_Dialog(String)
	if Result == 1 then
		SetFlag( OwnerID(), 540337, 1 );	-- ����540337�i���Ǯ{
		SetFlag( OwnerID(), 540570, 1 );	-- ����540570�t��-�N��

--		GiveBodyItem( OwnerID() , 530007 , 1 )
		ScriptMessage( OwnerID(), OwnerID(), 2, GetString("MSG_GET_COOK_1"), C_SYSTEM );--�e�������T���G�A�w���o�i�����Ǯ{���
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("MSG_GET_COOK_1_D"), "0xFFFF8000");--�T�������T���G�A�w���o�i�����Ǯ{���A�i�����ŤW����20�šC

		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("MSG_GET_COOK_FORMULA1"), C_YELLOW);--�T�������T���G�A�w�߱o�u�t��-�N���v�C
--		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("MSG_GET_COOK_FORMULA2"), C_YELLOW);--�T�������T���G�A�w�߱o�u�G��v���s�y�覡�C
--		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("MSG_GET_COOK_FORMULA3"), C_YELLOW);--�T�������T���G�A�w�߱o�u�N���v���s�y�覡�C
	end
end
