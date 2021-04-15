function LuaS_117291()
	if CheckBuff(OwnerID(), 508708) == false then
		SetFlag(OwnerID(), 544748, 1)
	end

	LoadQuestOption( OwnerID() )	-- 載入任務模板

	local homenumber = Read_Role_HomeNumber( OwnerID() )

	if ( CountBodyItem( OwnerID() , 201291 ) >= 1 ) then
		AddSpeakOption( OwnerID() , TargetID() , GetString("SO_HOMEFT_GIVE") , "LuaS_HomeFT_Give" , 0 )	-- 增加一個選項：我有家具兌換券，我想兌換！
	end

	if ( homenumber == -1 ) then
		AddSpeakOption( OwnerID(), TargetID(),  GetString("SO_BUYHOME") ,      "LuaS_117291_HomeBUY",     0 );	--增加一個選項，我要申請一間房屋
	else
		AddSpeakOption( OwnerID(), TargetID(),  GetString("SO_ENTERHOME") , "LuaS_117291_HomeEnter",     0 )	--增加一個選項，我要進入我的房屋
		AddSpeakOption( OwnerID(), TargetID(),  GetString("SO_VISITHOME") , "LuaS_117291_HomeVISIT",    0 )		--增加一個選項，我要參觀訪問別人的房屋
		AddSpeakOption( OwnerID(), TargetID(),  GetString("SC_FURNITUESHOP") , "LuaS_ComShop_1",    0 ) 		--增加一個選項，我要購買基本家具
	end
	if LuaFunc_CountJobNumber() > 1 then
		AddSpeakOption( OwnerID(), TargetID(), "[SO_110581_1]" , "LuaS_110581_1",0 );	--增加一個選項，我想轉換主副職
	end
	--AddSpeakOption( OwnerID(), TargetID(),  GetString("SC_ACCOUNTBAG") , "LuaS_AccountBag",    0 )		--增加一個選項，我要取回房屋的物品
	AddSpeakOption( OwnerID(), TargetID(),  GetString("SC_HOUSEBANK") , "LuaS_117291_HomeBANK",    0 ) 		--增加一個選項，我要開啟銀行
	AddSpeakOption( OwnerID(), TargetID(),  GetString("SO_WHATHOME") , "LuaS_117291_HomeINTRO", 0 )		--增加一個選項，房屋是什麼？

end
function LuaS_117291_HomeBUY()
	CloseSpeak( OwnerID() );	--關閉對話視窗
	BeginPlot( TargetID() , "LuaS_117291_HomeBUY_Dialog" , 0 )
end

function LuaS_117291_HomeBANK()
	CloseSpeak( OwnerID() );	--關閉對話視窗
	Sys_Bank_Open()
end

function LuaS_117291_HomeEnter()
	CloseSpeak( OwnerID() );	--關閉對話視窗
	Sys_HouseVisit_MyHouse_Open()	
end

function LuaS_117291_HomeBUY_Dialog()

	if ( CountBodyItem( TargetID() , 201383 ) < 1 ) then
		Tell( TargetID() , OwnerID() , "[SO_GIVEHOMETALKMAID5_117291]" )	-- 來，這個置物箱可以放20樣東西，是給你的。你要記得把它擺放到房屋中喔！
		GiveBodyItem ( TargetID() , 201383 , 1 )	-- 20格置物箱
	end

	Tell( TargetID() , OwnerID() , GetString("SO_GIVEHOMEMAID_117291") )	-- 然後……等我一下喔，娜可得寫一些資料才行…
	local Ret = BuildHouse( TargetID() , 575523 );
	SetFlag( TargetID()  , 542670, 1 )  --給旗標
	if( Ret == false ) then
		Tell( TargetID() , OwnerID() , GetString("SO_NOBUILDHOME_117291") )	-- 那個…好像有一點小小的問題，好像還沒辦法幫你完成申請…你可以等等再來找娜可一次嗎？[$PLAYERNAME]，對不起…
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
		local Str = "[SO_GIVEHOMEOKMAID_117291][$SETVAR1="..homenumber_text .."]"
		Tell( TargetID() , OwnerID() , Str )	-- 娜可幫你弄好房屋的申請手續囉！門牌號碼是[$VAR1]，要記清楚喔！這樣[$PLAYERNAME]也跟大家一樣有自己的房子了呢！
	else
		Tell( TargetID() , OwnerID() , GetString("SO_NOBUILDHOME_117291") )	-- 那個…好像有一點小小的問題，好像還沒辦法幫你完成申請…你可以等等再來找娜可一次嗎？[$PLAYERNAME]，對不起…
		Tell( TargetID() , OwnerID() , GetString("SO_NOBUILDHOME") )	-- "無法申請房屋！！
	end
	Sleep( 5 )

end

function LuaS_117291_HomeVISIT()
	CloseSpeak( OwnerID() );	--關閉對話視窗
	local Obj = Role:new( OwnerID() );
	local Ret = SaveReturnPos( OwnerID() , Obj:ZoneID() , Obj:X() , Obj:Y() , Obj:Z() , Obj:Dir() );
	if( Ret == false ) then
		--Tell( OwnerID() , TargetID() , "此處不能設定回傳點" );
		return;
	end
	OpenVisitHouse( false );
end

function LuaS_117291_HomeINTRO()
	SetSpeakDetail( OwnerID(), GetString("SO_HOMEINTRO") )	--房屋是指每人都可以申請的一個私人空間。\n\n在這個空間裡屋主可以自由發揮創意來擺\設各種家具，而且有些稀有的家具還會為屋主帶來有益的效果。\n\n所以，擁有一間房屋，在這個世界是非常重要而且必要的一件事。\n\n每一間房屋都有一個不重複的「門牌號碼」，若是你想參觀別人的房屋，只要找我對話，選擇「我要參觀訪問別人的房屋」，之後輸入想參觀房屋的門牌號碼即可。\n\n不過要注意的是，若是你參觀的房屋屋主有設定「門禁密碼」，你還需要輸入正確的門禁密碼才獲准進入。
	AddSpeakOption( OwnerID(), TargetID(), GetString("SO_BACK") , "LuaS_117291", 0 );	--回上一頁
end