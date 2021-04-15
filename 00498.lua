function LuaFunc_CARPENTER_Dialog() --木工
	local String = GetString("SD_CARPENTER_DIALOG")
	local Result = LuaFunc_LivinSkill_Dialog(String)
	if Result == 1 then
		SetFlag( OwnerID(), 540334, 1 );	-- 給予540334木工學徒
		SetFlag( OwnerID(),540397, 1 );	-- <給予重要物品540397-配方-細木弓>
--		GiveBodyItem( OwnerID() , 530005 , 1 )
		ScriptMessage( OwnerID(), OwnerID(), 2, GetString("MSG_GET_WOODWORKER_1"), C_SYSTEM );--畫面中間訊息：你已取得木工學徒資格
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("MSG_GET_WOODWORKER_1_D"), "0xFFFF8000");--訊息視窗訊息：你已取得木工學徒資格，木工等級上限為20級。

		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("MSG_GET_WOODWORKER_FORMULA1"), C_YELLOW);--訊息視窗訊息：你已習得「配方-細木弓」。
	end
end
----------------------------------------------------------------------------------------------------------------------
function LuaFunc_TAILOR_Dialog() --裁縫
	local String = GetString("SD_TAILOR_DIALOG")
	local Result = LuaFunc_LivinSkill_Dialog(String)
	if Result == 1 then
		SetFlag( OwnerID(), 540336, 1 );	-- 給予540336裁縫學徒資格
		SetFlag( OwnerID(), 540526, 1 );	-- 給予540526配方-粗布褲
--		GiveBodyItem( OwnerID() , 530006 , 1 )
		ScriptMessage( OwnerID(), OwnerID(), 2, GetString("MSG_GET_TAILOR_1"), C_SYSTEM );--畫面中間訊息：你已取得裁縫學徒資格
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("MSG_GET_TAILOR_1_D"), "0xFFFF8000");--訊息視窗訊息：你已取得裁縫學徒資格，裁縫等級上限為20級。

		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("MSG_GET_TAILOR_FORMULA1"), C_YELLOW);--訊息視窗訊息：你已習得「配方-粗布褲」。
	end
end
---------------------------------------------------------------------------------------
function LuaFunc_MAKEARMOR_Dialog() --製甲
	local String = GetString("SD_MAKEARMOR_DIALOG")
	local Result = LuaFunc_LivinSkill_Dialog(String)
	if Result == 1 then
		SetFlag( OwnerID(), 540335, 1 );	-- 給予540335製甲學徒
		SetFlag( OwnerID(),540984, 1 );	-- 給予540504配方-薄板胸甲

--		GiveBodyItem( OwnerID() , 530004 , 1 )
		ScriptMessage( OwnerID(), OwnerID(), 2, GetString("MSG_GET_ARMOR_1"), C_SYSTEM );--畫面中間訊息：你已取得製甲學徒資格
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("MSG_GET_ARMOR_1_D"), "0xFFFF8000");--訊息視窗訊息：你已取得製甲學徒資格，製甲等級上限為20級。
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("MSG_GET_ARMOR_FORMULA1"), C_YELLOW);--訊息視窗訊息：你已習得「配方-薄板胸甲」。
--		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("MSG_GET_ARMOR_FORMULA2"), C_YELLOW);--訊息視窗訊息：你已習得「皮帶」的製造方式。
	end
end
-------------------------------------------------------------------------------------
function LuaFunc_BLACKSMITH_Dialog() --打鐵
	local String = GetString("SD_BLACKSMITH_DIALOG")
	local Result = LuaFunc_LivinSkill_Dialog(String)
	if Result == 1 then
		SetFlag( OwnerID(), 540268, 1 );	-- 給予540268打鐵學徒
		SetFlag( OwnerID(), 540278, 1 );	-- <給予重要物品540278-配方-鑲釘木棍>
--		GiveBodyItem( OwnerID() , 530003 , 1 )
		ScriptMessage( OwnerID(), OwnerID(), 2, GetString("MSG_GET_BLACKSMITH_1"), C_SYSTEM );--畫面中間訊息：你已取得打鐵學徒資格
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("MSG_GET_BLACKSMITH_1_D"), "0xFFFF8000");--訊息視窗訊息：你已取得打鐵學徒資格，打鐵等級上限為20級。
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("MSG_GET_BLACKSMITH_FORMULA1"), C_YELLOW);--訊息視窗訊息：你已習得「配方-鑲釘木棍」。
	end
end

-------------------------------------------------------------------------------------
function LuaFunc_DISSOLUTION_Dialog() --分解術
	local String = GetString("SD_DISSOLUTION_DIALOG")
	local Result = LuaFunc_LivinSkill_Dialog(String)
	if Result == 1 then
		SetFlag( OwnerID(), 540002, 1 );	-- 給予540002分解術
		ScriptMessage( OwnerID(), OwnerID(), 2, GetString("MSG_GET_DISSOLUTION_1"), C_SYSTEM );--畫面中間訊息：你已學會分解術				ScriptMessage( OwnerID(), OwnerID(), 0, GetString("MSG_GET_DISSOLUTION_1_D"), C_YELLOW);--訊息視窗訊息：你已學會分解術
	end
end