function LuaS_110752()

	LoadQuestOption( OwnerID() )	-- 載入任務模板

	local homenumber = Read_Role_HomeNumber( OwnerID() )

	if ( homenumber == -1 ) then
		--ScriptMessage( OwnerID(), OwnerID(), 0, "　你沒有房屋！！" , 0 )
		AddSpeakOption( OwnerID(), TargetID(),  GetString("SO_BUYHOME") ,      "LuaS_110752_HomeBUY",     0 );	--增加一個選項，我要申請一間房屋
	else
		--ScriptMessage( OwnerID(), OwnerID(), 0, "　你有房屋，門牌號碼是"..homenumber , 0 )
		AddSpeakOption( OwnerID(), TargetID(),  GetString("SO_ENTERHOME") ,      "LuaS_110752_HomeEnter",     0 );	--增加一個選項，我要進入我的房屋
		AddSpeakOption( OwnerID(), TargetID(),  GetString("SC_FURNITUESHOP") , "LuaS_ComShop_1",    0 ) 		--增加一個選項，我要購買基本家具
	end
	if LuaFunc_CountJobNumber() > 1 then
		AddSpeakOption( OwnerID(), TargetID(), "[SO_110581_1]" , "LuaS_110581_1",0 );	--增加一個選項，我想轉換主副職
	end
	--AddSpeakOption( OwnerID(), TargetID(),  GetString("SC_ACCOUNTBAG") , "LuaS_AccountBag",    0 )		--增加一個選項，我要取回房屋的物品
	AddSpeakOption( OwnerID(), TargetID(),  GetString("SO_VISITHOME") ,  "LuaS_110752_HomeVISIT",    0 );	--增加一個選項，我要參觀別人的房屋
	AddSpeakOption( OwnerID(), TargetID(),  GetString("SC_HOUSEBANK") , "LuaS_110773_HomeBANK",    0 ) 		--增加一個選項，我要開啟銀行
	AddSpeakOption( OwnerID(), TargetID(),  GetString("SO_WHATHOME"),              "LuaS_110752_HomeINTRO", 0 );	--增加一個選項，房屋是什麼？
end



function LuaS_110752_HomeBUY()
	CloseSpeak( OwnerID() );	--關閉對話視窗
	BeginPlot(TargetID() , "LuaS_110752_HomeBUY_Dialog" , 0 )
end

function LuaS_110752_HomeEnter()
	CloseSpeak( OwnerID() );	--關閉對話視窗
	Sys_HouseVisit_MyHouse_Open()	
end

function LuaS_AccountBag()
	CloseSpeak( OwnerID() );	--關閉對話視窗
	OpenAccountBag()
end

function Read_Role_Money( RoleID )
	local money  = ReadRoleValue( RoleID, EM_RoleValue_Money )
	return money
end

function Role_MoneyChange( RoleID , MoneyChange )
	local money  = Read_Role_Money( RoleID )
	money = money + MoneyChange
	WriteRoleValue( RoleID , EM_RoleValue_Money , money )
end

function Read_Role_HomeNumber( RoleID )
	return ReadRoleValue( RoleID , EM_RoleValue_HouseDBID )
end

function LuaS_110752_HomeBUY_Dialog()



	if true then--( CountBodyItem( TargetID() , 201383 ) < 1 ) then
		Tell( TargetID() , OwnerID() , GetString("SO_GIVEHOMETALK5") )	-- 這是申請房屋即可擁有的20格置物箱，請收下，要記得將它擺放到房屋中喔！
		GiveBodyItem ( TargetID() , 201383 , 1 )	-- 20格置物箱
	end
	Tell ( TargetID() , OwnerID() , GetString("SO_GIVEHOME") );	-- 好的，我馬上為你辦理申請，請稍等～
	local Ret = BuildHouse( TargetID() , 575523 );

	if( Ret == false ) then
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SO_NOBUILDHOME") , 0 )		-- "無法申請房屋！！
	end

	PlayMotion ( OwnerID() , ruFUSION_ACTORSTATE_CRAFTING_BEGIN );
	Sleep( 60 )
	PlayMotion ( OwnerID() , ruFUSION_ACTORSTATE_CRAFTING_END );

	local homenumber = Read_Role_HomeNumber( TargetID() )
	if ( homenumber ~= -1 ) then
		local homenumber_text = string.format( "%06d", homenumber  );
		local String ="[SO_GIVEHOMEOK][$SETVAR1="..homenumber_text.."]"
		Tell( TargetID() , OwnerID() ,String )		-- 申請已經完成，你的房屋門牌號碼是
	else
		Tell( TargetID() , OwnerID() , GetString("SO_NOBUILDHOME") )	-- "無法申請房屋！！
	end

	Sleep( 5 )
end

function LuaS_110752_HomeVISIT()
	-- ScriptMessage( OwnerID(), TargetID(), 0, "我要參觀訪問別人的房屋！", 0 )
	CloseSpeak( OwnerID() );	--關閉對話視窗
	local Obj = Role:new( OwnerID() );
	local Ret = SaveReturnPos( OwnerID() , Obj:ZoneID() , Obj:X() , Obj:Y() , Obj:Z() , Obj:Dir() );
	if( Ret == false ) then
		Tell( OwnerID() , TargetID() , "此處不能設定回傳點" );
		return;
	end
	OpenVisitHouse( false );
end

function LuaS_110752_HomeINTRO()
	SetSpeakDetail( OwnerID(), GetString("SO_HOMEINTRO") )	--房屋是指每人都可以申請購買的一個私人空間。\n\n在這個空間裡屋主可以自由發揮創意來擺\設各種家具，而且有些稀有的家具還會為屋主帶來有益的效果。\n\n所以，擁有一間房屋，在這個世界是非常重要而且必要的一件事。\n\n每一間房屋都有一個不重複的「門牌號碼」，若是你想參觀別人的房屋，只要找我對話，選擇「我要參觀訪問別人的房屋」，之後輸入想參觀房屋的門牌號碼即可。\n\n不過要注意的是，若是你參觀的房屋屋主有設定「門禁密碼」，你還需要輸入正確的門禁密碼才獲准進入。
	AddSpeakOption( OwnerID(), TargetID(), GetString("SO_BACK") , "LuaS_110752", 0 );	--回上一頁
end

function LuaFunc_FurnitureShop()
   	SetShop( OwnerID() ,600112, "Test_Shop_Close" );
end