function LuaI_East_EnterHomeA()
	--SetPlot( OwnerID() , "collision" , "LuaS_East_EnterHomeA" , 0 )
end

function LuaS_East_EnterHomeA()	-- 凡瑞娜絲城下東區傳用門進房屋A
	local homenumber = Read_Role_HomeNumber( OwnerID() )
	-- ScriptMessage( OwnerID(), OwnerID(), 0, "　你有房屋，門牌號碼是"..homenumber , 0 )
	if  ( homenumber == -1 ) then		-- 沒有房屋，沒反應

	else
		local Obj = Role:new( OwnerID() )
		local Ret = SaveReturnPos( OwnerID() , Obj:ZoneID() , 5020 , 53+1 , 285 , 135 )
		if( Ret == false ) then
			Tell( OwnerID() , TargetID() , "此處不能設定回傳點" )
			return
		end
		OpenVisitHouse( true )
	end
end

function LuaI_East_EnterHomeB()
	--SetPlot( OwnerID() , "collision" , "LuaS_Guild_House_EnterTouch" , 65 )
end

function LuaS_East_EnterHomeB()	-- 凡瑞娜絲城下東區傳用門進房屋B
	local homenumber = Read_Role_HomeNumber( OwnerID() )
	-- ScriptMessage( OwnerID(), OwnerID(), 0, "　你有房屋，門牌號碼是"..homenumber , 0 )
	if  ( homenumber == -1 ) then		-- 沒有房屋，沒反應

	else
		local Obj = Role:new( OwnerID() )
		local Ret = SaveReturnPos( OwnerID() , Obj:ZoneID() , 4960 , 53+1 , 380 , 135 )
		if( Ret == false ) then
			Tell( OwnerID() , TargetID() , "此處不能設定回傳點" )
			return
		end
		OpenVisitHouse( true )
	end
end

function LuaI_West_EnterHomeA()
	--SetPlot( OwnerID() , "collision" , "LuaS_Guild_House_EnterTouch" , 65 )
end

function LuaS_West_EnterHomeA()	-- 凡瑞娜絲城下東區傳用門進房屋A
	local homenumber = Read_Role_HomeNumber( OwnerID() )
	-- ScriptMessage( OwnerID(), OwnerID(), 0, "　你有房屋，門牌號碼是"..homenumber , 0 )
	if  ( homenumber == -1 ) then		-- 沒有房屋，沒反應

	else
		local Obj = Role:new( OwnerID() )
		local Ret = SaveReturnPos( OwnerID() , Obj:ZoneID() , 2525 , 53+1 , -1495 , 315 )
		if( Ret == false ) then
			Tell( OwnerID() , TargetID() , "此處不能設定回傳點" )
			return
		end
		OpenVisitHouse( true )
	end
end

function LuaI_West_EnterHomeB()
	--SetPlot(OwnerID(),"collision" , "LuaS_Guild_House_EnterTouch" , 65 ）
end

function LuaS_West_EnterHomeB()	-- 凡瑞娜絲城下東區傳用門進房屋B
	local homenumber = Read_Role_HomeNumber( OwnerID() )
	-- ScriptMessage( OwnerID(), OwnerID(), 0, "　你有房屋，門牌號碼是"..homenumber , 0 )
	if  ( homenumber == -1 ) then		-- 沒有房屋，沒反應

	else
		local Obj = Role:new( OwnerID() )
		local Ret = SaveReturnPos( OwnerID() , Obj:ZoneID() , 2460 , 53+1 , -1395 , 315 )
		if( Ret == false ) then
			Tell( OwnerID() , TargetID() , "此處不能設定回傳點" )
			return
		end
		OpenVisitHouse( true )
	end
end

function LuaS_HomeFT()
	LoadQuestOption( OwnerID() )	--載入任務模板
	if ( CountBodyItem( OwnerID() , 201291 ) >= 1 ) then
		AddSpeakOption( OwnerID() , TargetID() , GetString("SO_HOMEFT_GIVE") , "LuaS_HomeFT_Draw" , 0 )	-- 增加一個選項：我有家具兌換券，我想兌換！
	end
	AddSpeakOption( OwnerID() , TargetID() , GetString("SO_OPENSHOP") , "LuaS_HomeFT_OpenShop" , 0 )	-- 增加一個選項：開啟商店
end
function LuaS_HomeFT_OpenShop()	-- 家具商人一般開商店
	CloseSpeak( OwnerID() )		-- 關閉對話視窗
	OpenShop()			-- 打開商店
end
function LuaS_HomeFT_Draw()	-- 家具商人一般開商店
	CloseSpeak( OwnerID() )			-- 關閉對話視窗
	delBodyItem (OwnerID() , 201291 , 1 )
	local FT1 = ""
	local FT2 = ""
	local String = ""

	local RND = Rand( 99 ) + 1	-- 產生 1~100 的亂數
	    if ( RND > 0 and RND <= 30 ) then
		GiveBodyItem ( OwnerID() , 201295 , 1 )	-- 六獎　簡便木椅( 機率 30/100 )
		FT1 = GetString("SO_DRAWFT01")
	elseif ( RND > 30 and RND <= 55 ) then
		GiveBodyItem ( OwnerID() , 201296 , 1 )	-- 伍獎　簡便木桌( 機率 25/100 )
		FT1 = GetString("SO_DRAWFT02")
	elseif ( RND > 55 and RND <= 75 ) then
		GiveBodyItem ( OwnerID() , 201297 , 1 )	-- 四獎　簡便地毯( 機率 20/100 )
		FT1 = GetString("SO_DRAWFT03")
	elseif ( RND > 75 and RND <= 85 ) then
		GiveBodyItem ( OwnerID() , 201298 , 1 )	-- 三獎　簡便書櫃( 機率 10/100 )
		FT1 = GetString("SO_DRAWFT04")
	elseif ( RND > 85 and RND <= 95 ) then
		GiveBodyItem ( OwnerID() , 201299 , 1 )	-- 二獎　簡便木床( 機率 10/100 )
		FT1 = GetString("SO_DRAWFT05")
	elseif ( RND > 95 and RND <= 100 ) then
		GiveBodyItem ( OwnerID() , 201300 , 1 )	-- 一獎　簡便寶箱( 機率 5/100 )
		FT1 = GetString("SO_DRAWFT06")
	end
	local RND2 = Rand( 99 ) + 1	-- 產生 1~100 的亂數
	    if ( RND2 > 0 and RND2 <= 30 ) then
		GiveBodyItem ( OwnerID() , 201295 , 1 )	-- 六獎　簡便木椅( 機率 30/100 )
		FT2 = GetString("SO_DRAWFT01")
	elseif ( RND2 > 30 and RND2 <= 55 ) then
		GiveBodyItem ( OwnerID() , 201296 , 1 )	-- 伍獎　簡便木桌( 機率 25/100 )
		FT2 = GetString("SO_DRAWFT02")
	elseif ( RND2 > 55 and RND2 <= 75 ) then
		GiveBodyItem ( OwnerID() , 201297 , 1 )	-- 四獎　簡便地毯( 機率 20/100 )
		FT2 = GetString("SO_DRAWFT03")
	elseif ( RND2 > 75 and RND2 <= 85 ) then
		GiveBodyItem ( OwnerID() , 201298 , 1 )	-- 三獎　簡便書櫃( 機率 10/100 )
		FT2 = GetString("SO_DRAWFT04")
	elseif ( RND2 > 85 and RND2 <= 95 ) then
		GiveBodyItem ( OwnerID() , 201299 , 1 )	-- 二獎　簡便木床( 機率 10/100 )
		FT2 = GetString("SO_DRAWFT05")
	elseif ( RND2 > 95 and RND2 <= 100 ) then
		GiveBodyItem ( OwnerID() , 201300 , 1 )	-- 一獎　簡便寶箱( 機率 5/100 )
		FT2 = GetString("SO_DRAWFT06")
	end
	String = "[SO_HOMEFT_STR1][$SETVAR1="..FT1.."][$SETVAR2="..FT2.."]"
		Tell( OwnerID() , TargetID() , String)
end
