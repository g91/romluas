-----------------------------------------------------------------------------
function LuaFunc_MINING_Dialog() --挖礦
	local String = GetString("SD_MINING_DIALOG")
	local Result = LuaFunc_LivinSkill_Dialog(String)
	if Result == 1 then
		SetFlag( OwnerID(), 540269, 1 );	-- <給予重要物品540269-挖礦學徒>
		GiveBodyItem( OwnerID() , 540376 , 1 )	-- <給予重要物品540376-配方-黃銅砂>
--		GiveBodyItem( OwnerID() , 540377 , 1 )	-- <給予重要物品540377-配方-錫砂>							   
--		GiveBodyItem( OwnerID() , 530000 , 1 )	-- <給予稱號530000-挖礦學徒>

		SetFlag( OwnerID(), 540808, 1 )	-- <新手導引用重要物品540808-學習挖礦>

		ScriptMessage( OwnerID(), OwnerID(), 2, GetString("MSG_GET_MINE_1"), C_SYSTEM );--畫面中間訊息：你已取得挖礦學徒資格
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("MSG_GET_MINE_1_D"), "0xFFFF8000");--訊息視窗訊息：你已取得挖礦學徒資格，挖礦等級上限為20級。
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("MSG_GET_FORMULA_MINE_1"), C_YELLOW);--訊息視窗訊息：你已習得「配方-黃銅砂」。
--		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("MSG_GET_FORMULA_MINE_2"), C_YELLOW);--訊息視窗訊息：你已習得「配方-錫砂」。
--		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("MSG_GET_FORMULA_MINE_3"), C_YELLOW);--訊息視窗訊息：習得錫石精鍊。
	end
end
----------------------------------------------------------------------------------
function LuaFunc_LUMBERING_Dialog() --伐木
	local String = GetString("SD_LUMBERING_DIALOG")
	local Result = LuaFunc_LivinSkill_Dialog(String)
	if Result == 1 then
		SetFlag( OwnerID(), 540270, 1 );	-- <給予重要物品540270-伐木學徒>
		GiveBodyItem( OwnerID() , 540648 , 1 )	-- <給予重要物品540648-配方-輕木材>
--		GiveBodyItem( OwnerID() , 540649 , 1 )	-- <給予重要物品540649-配方-柳木條>		
--		GiveBodyItem( OwnerID() , 530001 , 1 )	-- <給予稱號530001-伐木學徒>

		SetFlag( OwnerID(), 540809, 1 )	-- <新手導引用重要物品540809-學習伐木>

		ScriptMessage( OwnerID(), OwnerID(), 2, GetString("MSG_GET_WOOD_1"), C_SYSTEM );--畫面中間訊息：你已取得伐木的學徒資格
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("MSG_GET_WOOD_1_D"),"0xFFFF8000");--訊息視窗訊息：你已取得伐木的學徒資格，挖礦等級上限為20級。
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("MSG_GET_FORMULA_WOOD_1"), C_YELLOW);--訊息視窗訊息：你已習得「配方-輕木材」。
--		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("MSG_GET_FORMULA_WOOD_2"), C_YELLOW);--訊息視窗訊息：你已習得「配方-柳木條」。
	end
end
-----------------------------------------------------------------------------------
function LuaFunc_HERBLISM_Dialog() --採藥
	local String = GetString("SD_HERBLISM_DIALOG")
	local Result = LuaFunc_LivinSkill_Dialog(String)
	if Result == 1 then
		SetFlag( OwnerID(), 540333, 1 );	-- <給予重要物品540333-採藥學徒>
		GiveBodyItem( OwnerID() , 540661 , 1 )	-- <給予重要物品540661-配方-山魔楊草束>
--		GiveBodyItem( OwnerID() , 540662 , 1 )	-- <給予重要物品540662-配方-野漿果溶液>		
--		GiveBodyItem( OwnerID() , 530002 , 1 )	-- <給予稱號530002-採藥學徒>

		SetFlag( OwnerID(), 540810, 1 )	-- <新手導引用重要物品540810-學習採草>

		ScriptMessage( OwnerID(), OwnerID(), 2, GetString("MSG_GET_HERB_1"), C_SYSTEM );--畫面中間訊息：你已取得採藥的學徒資格
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("MSG_GET_HERB_1_D"), "0xFFFF8000");--訊息視窗訊息：你已取得採藥的學徒資格，採藥等級上限為20級。
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("MSG_GET_FORMULA_HERB_1"), C_YELLOW);--訊息視窗訊息：你已習得「配方-山魔楊草束」。
--		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("MSG_GET_FORMULA_HERB_2"), C_YELLOW);--訊息視窗訊息：你已習得「配方-野漿果溶液」。
	end
end
----------------------------------------------------------------------------------
function LuaFunc_ALCHEMY_Dialog() --煉金
	local String = GetString("SD_ALCHEMY_DIALOG")
	local Result = LuaFunc_LivinSkill_Dialog(String)
	if Result == 1 then
		SetFlag( OwnerID(), 540338, 1 );	-- 給予540338煉金學徒
		SetFlag( OwnerID(), 540606, 1 );	-- 給予540606配方-基礎療傷藥

--		GiveBodyItem( OwnerID() , 530008 , 1 )
		ScriptMessage( OwnerID(), OwnerID(), 2, GetString("MSG_GET_ALCHEMY_1"), C_SYSTEM );--畫面中間訊息：你已取得煉金學徒資格
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("MSG_GET_ALCHEMY_1_D"), "0xFFFF8000");--訊息視窗訊息：你已取得煉金學徒資格，煉金等級上限為20級。

		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("MSG_GET_ALCHEMY_FORMULA1"), C_YELLOW);--訊息視窗訊息：你已習得「配方-基礎療傷藥」。
--		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("MSG_GET_ALCHEMY_FORMULA2"), C_YELLOW);--訊息視窗訊息：你已習得「基礎療傷藥」的製造方式。
	end
end
---------------------------------------------------------------------------------------
function LuaFunc_COOK_Dialog() --烹飪
	local String = GetString("SD_COOK_DIALOG")
	local Result = LuaFunc_LivinSkill_Dialog(String)
	if Result == 1 then
		SetFlag( OwnerID(), 540337, 1 );	-- 給予540337烹飪學徒
		SetFlag( OwnerID(), 540570, 1 );	-- 給予540570配方-烤魚

--		GiveBodyItem( OwnerID() , 530007 , 1 )
		ScriptMessage( OwnerID(), OwnerID(), 2, GetString("MSG_GET_COOK_1"), C_SYSTEM );--畫面中間訊息：你已取得烹飪的學徒資格
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("MSG_GET_COOK_1_D"), "0xFFFF8000");--訊息視窗訊息：你已取得烹飪的學徒資格，烹飪等級上限為20級。

		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("MSG_GET_COOK_FORMULA1"), C_YELLOW);--訊息視窗訊息：你已習得「配方-烤魚」。
--		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("MSG_GET_COOK_FORMULA2"), C_YELLOW);--訊息視窗訊息：你已習得「果醬」的製造方式。
--		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("MSG_GET_COOK_FORMULA3"), C_YELLOW);--訊息視窗訊息：你已習得「烤魚」的製造方式。
	end
end
