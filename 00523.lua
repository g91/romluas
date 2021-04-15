function LuaS_110773()
	-- 若要修改此處房屋小天使的功能，麻煩連702235的一並確認修改，感謝！
	LoadQuestOption( OwnerID() )	-- 載入任務模板

	local homenumber = Read_Role_HomeNumber( OwnerID() )

	if ( CountBodyItem( OwnerID() , 201291 ) >= 1 ) then
		AddSpeakOption( OwnerID() , TargetID() , GetString("SO_HOMEFT_GIVE") , "LuaS_HomeFT_Give" , 0 )	-- 增加一個選項：我有家具兌換券，我想兌換！
	end

	if ( homenumber == -1 ) then
		AddSpeakOption( OwnerID(), TargetID(),  GetString("SO_BUYHOME") ,      "LuaS_110773_HomeBUY",     0 );	--增加一個選項，我要申請一間房屋
	else
		AddSpeakOption( OwnerID(), TargetID(),  GetString("SO_ENTERHOME") , "LuaS_110773_HomeEnter",     0 )	--增加一個選項，我要進入我的房屋
		AddSpeakOption( OwnerID(), TargetID(),  GetString("SO_VISITHOME") , "LuaS_110773_HomeVISIT",    0 )		--增加一個選項，我要參觀訪問別人的房屋
		AddSpeakOption( OwnerID(), TargetID(),  GetString("SC_FURNITUESHOP") , "LuaS_ComShop_1",    0 ) 		--增加一個選項，我要購買基本家具
	end
	if LuaFunc_CountJobNumber() > 1 then
		AddSpeakOption( OwnerID(), TargetID(), "[SO_110581_1]" , "LuaS_110581_1",0 );	--增加一個選項，我想轉換主副職
	end
	--AddSpeakOption( OwnerID(), TargetID(),  GetString("SC_ACCOUNTBAG") , "LuaS_AccountBag",    0 )		--增加一個選項，我要取回房屋的物品
	AddSpeakOption( OwnerID(), TargetID(),  GetString("SC_HOUSEBANK") , "LuaS_110773_HomeBANK",    0 ) 		--增加一個選項，我要開啟銀行
	AddSpeakOption( OwnerID(), TargetID(),  GetString("SO_WHATHOME") , "LuaS_110773_HomeINTRO", 0 )		--增加一個選項，房屋是什麼？

end
function LuaS_110773_HomeBUY()
	CloseSpeak( OwnerID() );	--關閉對話視窗
	BeginPlot( TargetID() , "LuaS_110773_HomeBUY_Dialog" , 0 )
end

function LuaS_110773_HomeBANK()
	CloseSpeak( OwnerID() );	--關閉對話視窗
	Sys_Bank_Open()
end

function LuaS_110773_HomeEnter()
	CloseSpeak( OwnerID() );	--關閉對話視窗
	Sys_HouseVisit_MyHouse_Open()	
end

function LuaS_110773_HomeBUY_Dialog()

	if true then--( CountBodyItem( TargetID() , 201383 ) < 1 ) then
		Tell( TargetID() , OwnerID() , GetString("SO_GIVEHOMETALKMAID5") )	-- 這是申請房屋即可擁有的20格置物箱，請收下，主人要記得將它擺放到房屋中喔！
		GiveBodyItem ( TargetID() , 201383 , 1 )	-- 20格置物箱
	end

	Tell( TargetID() , OwnerID() , GetString("SO_GIVEHOMEMAID") )	-- 好的，我馬上為你辦理申請，主人請稍等～
	local Ret = BuildHouse( TargetID() , 575523 );
	SetFlag( TargetID()  , 542670, 1 )  --給旗標
	if( Ret == false ) then
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SO_NOBUILDHOME") , 0 )		-- "無法申請房屋！！
	end
	PlayMotion ( OwnerID() , ruFUSION_ACTORSTATE_CRAFTING_BEGIN );
	Sleep( 15 )
	Tell( TargetID() , OwnerID() , GetString("SO_GIVEHOMETALKMAID1") )	-- 嗯…要填這些，還有這些…
	Sleep( 15 )
	Tell( TargetID() , OwnerID() , GetString("SO_GIVEHOMETALKMAID2") )	-- 啊！還有這個也要填…
	Sleep( 15 )
	Tell( TargetID() , OwnerID() , GetString("SO_GIVEHOMETALKMAID3") )	-- 耶～不會吧，還有這個…
	Sleep( 15 )
	Tell( TargetID() , OwnerID() , GetString("SO_GIVEHOMETALKMAID4") )	-- 呼～終於填的差不多了…
	PlayMotion ( OwnerID() , ruFUSION_ACTORSTATE_CRAFTING_END );


	local homenumber = Read_Role_HomeNumber( TargetID() )
	if ( homenumber ~= -1 ) then
		local homenumber_text = string.format( "%06d", homenumber  );
		local Str = "[SO_GIVEHOMEOKMAID][$SETVAR1="..homenumber_text .."]"
		Tell( TargetID() , OwnerID() , Str )	-- 申請已經完成，主人你的房屋門牌號碼是
	else
		Tell( TargetID() , OwnerID() , GetString("SO_NOBUILDHOME") )	-- "無法申請房屋！！
	end
	Sleep( 5 )

end

function LuaS_110773_HomeVISIT()
	CloseSpeak( OwnerID() );	--關閉對話視窗
	local Obj = Role:new( OwnerID() );
	local Ret = SaveReturnPos( OwnerID() , Obj:ZoneID() , Obj:X() , Obj:Y() , Obj:Z() , Obj:Dir() );
	if( Ret == false ) then
		--Tell( OwnerID() , TargetID() , "此處不能設定回傳點" );
		return;
	end
	OpenVisitHouse( false );
end

function LuaS_110773_HomeINTRO()
	SetSpeakDetail( OwnerID(), GetString("SO_HOMEINTRO") )	--房屋是指每人都可以申請的一個私人空間。\n\n在這個空間裡屋主可以自由發揮創意來擺\設各種家具，而且有些稀有的家具還會為屋主帶來有益的效果。\n\n所以，擁有一間房屋，在這個世界是非常重要而且必要的一件事。\n\n每一間房屋都有一個不重複的「門牌號碼」，若是你想參觀別人的房屋，只要找我對話，選擇「我要參觀訪問別人的房屋」，之後輸入想參觀房屋的門牌號碼即可。\n\n不過要注意的是，若是你參觀的房屋屋主有設定「門禁密碼」，你還需要輸入正確的門禁密碼才獲准進入。
	AddSpeakOption( OwnerID(), TargetID(), GetString("SO_BACK") , "LuaS_110773", 0 );	--回上一頁
end

function LuaS_HomeFT_Give()
	CloseSpeak( OwnerID() )			-- 關閉對話視窗
	delBodyItem (OwnerID() , 201291 , 1 )
	local FT1 = ""
	local FT2 = ""

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
		local Str = "[SO_HOMEFT_STR1][$SETVAR1="..FT1.."][$SETVAR2="..FT2.."]"
		Tell( OwnerID() , TargetID() , Str)
end

function LuaFunc_CountJobNumber()
	local JCount = 0

	if ReadRoleValue( OwnerID() , EM_RoleValue_VOCLV_Warrior ) > 0 then
		JCount = JCount + 1
	end
	if ReadRoleValue( OwnerID() , EM_RoleValue_VOCLV_Ranger ) > 0 then
		JCount = JCount + 1
	end
	if ReadRoleValue( OwnerID() , EM_RoleValue_VOCLV_Rogue ) > 0 then
		JCount = JCount + 1
	end
	if ReadRoleValue( OwnerID() , EM_RoleValue_VOCLV_Wizard ) > 0 then
		JCount = JCount + 1
	end
	if ReadRoleValue( OwnerID() , EM_RoleValue_VOCLV_Priest ) > 0 then
		JCount = JCount + 1
	end
	if ReadRoleValue( OwnerID() , EM_RoleValue_VOCLV_Knight ) > 0 then
		JCount = JCount + 1
	end
	if ReadRoleValue( OwnerID() , EM_RoleValue_VOCLV_RuneDancer ) > 0 then
		JCount = JCount + 1
	end
	if ReadRoleValue( OwnerID() , EM_RoleValue_VOCLV_Druid ) > 0 then
		JCount = JCount + 1
	end
	if ReadRoleValue( OwnerID() , EM_RoleValue_VOCLV_HARPSYN ) > 0 then
		JCount = JCount + 1
	end
	if ReadRoleValue( OwnerID() , EM_RoleValue_VOCLV_PSYRON ) > 0 then
		JCount = JCount + 1
	end
	return JCount 
end
