------------------------------------------------------------------------------------
-- 銀行、信箱、拍賣所
------------------------------------------------------------------------------------
-- 系_銀行_設定 (在系統分類裡面)
--function Sys_Bank_Auto()
--	SetMinimapIcon ( OwnerID(), EM_MapIconType_Bank );
--	SetPlot( OwnerID() , "Touch" , "Sys_Bank_Open" , 50 );
--end

-- 信箱
function MyOpenMailInit()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_MailBox );
	SetPlot( OwnerID() , "Touch" , "MyOpenMail" , 50 ); 
end
-- 信箱+圖示
function NewMyOpenMailInit()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_MailBox );
	SetPlot( OwnerID() , "Touch" , "MyOpenMail" , 50 );
	AddBuff(  OwnerID()  , 623300, 1, -1)  
end
function LuaI_110771()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_MailBox );
end

-- 拍賣所
function MyOpenACInit()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_AuctionHouse );
	SetPlot( OwnerID() , "Touch" , "MyOpenAC" , 50 );
end
function LuaI_110770()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_AuctionHouse );
end
------------------------------------------------------------------------------------
-- 傳送紀錄點
------------------------------------------------------------------------------------
-- 110561_傳送師諾薇
function Lua_110561_shop()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_FlightPoint );
end

-- 110591_傳送師克利絲汀
function Lua_110591_mark()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_FlightPoint );
	SetPlot( OwnerID(),"range","LuaS_110591_Intro" , 25 );
end

-- 110592_傳送師蘿拉
function Lua_110592_mark()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_FlightPoint );
end

-- 110710_傳送師亞紗
function Lua_110710_mark()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_FlightPoint );
end

-- 110725_傳送師艾亞亞
function Lua_110725_mark()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_FlightPoint );
end

-- 110726_傳送師娜薇
function Lua_110726_mark()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_FlightPoint );
end

-- 110727_傳送師笛薇
function Lua_110727_mark()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_FlightPoint );
end

-- 110728_傳送師芭薇
function Lua_110728_mark()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_FlightPoint );
end

-- 110755_傳送師黎薇
function Lua_110755_mark()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_FlightPoint );
end

-- 110805_傳送師梅珍
function Lua_110805_mark()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_FlightPoint );
end

------------------------------------------------------------------------------------
-- 配方
------------------------------------------------------------------------------------
-- 挖礦配方(學徒/工匠)
function LuaFunc_Shop_Mine_A()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Recipe )
	SetShop( OwnerID() , 600052 , "Test_Shop_Close" );
end

-- 打鐵配方(學徒/工匠)
function LuaFunc_Shop_Smith_A()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Recipe )
   	SetShop( OwnerID() , 600046 , "Test_Shop_Close" );
end

-- 伐木配方(學徒/工匠)
function LuaFunc_Shop_Lumb_A()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Recipe )
	SetShop( OwnerID() , 600053, "Test_Shop_Close" );
end

-- 採藥配方(學徒/工匠)
function LuaFunc_Shop_Herb_A()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Recipe )
	SetShop( OwnerID() , 600054, "Test_Shop_Close" );
end

-- 木工配方(學徒/工匠)
function LuaFunc_Shop_Carpenter_A()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Recipe )
   	SetShop( OwnerID() , 600047 , "Test_Shop_Close" );
end

-- 製甲配方(學徒/工匠)
function LuaFunc_Shop_MakeArmor_A()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Recipe )
   	SetShop( OwnerID() , 600048 , "Test_Shop_Close" );
end

-- 裁縫配方(學徒/工匠)
function LuaFunc_Shop_Tailor_A()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Recipe )
   	SetShop( OwnerID() , 600049 , "Test_Shop_Close" );
end

-- 煉金配方(學徒/工匠)
function LuaFunc_Shop_Alchemy_A()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Recipe )
   	SetShop( OwnerID() , 600051 , "Test_Shop_Close" );
end

-- 烹飪配方(學徒/工匠)
function LuaFunc_Shop_Cook_A()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Recipe )
   	SetShop( OwnerID() , 600050 , "Test_Shop_Close" );
end
-- 挖礦配方(專精/大師)
function LuaFunc_Shop_Mine_B()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Recipe )
	SetShop( OwnerID() , 600084 , "Test_Shop_Close" );
end

-- 打鐵配方(專精/大師)
function LuaFunc_Shop_Smith_B()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Recipe )
   	SetShop( OwnerID() , 600078 , "Test_Shop_Close" );
end

-- 伐木配方(專精/大師)
function LuaFunc_Shop_Lumb_B()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Recipe )
	SetShop( OwnerID() , 600085 , "Test_Shop_Close" );
end

-- 採藥配方(專精/大師)
function LuaFunc_Shop_Herb_B()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Recipe )
	SetShop( OwnerID() , 600086, "Test_Shop_Close" );
end

-- 木工配方(專精/大師)
function LuaFunc_Shop_Carpenter_B()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Recipe )
   	SetShop( OwnerID() , 600079 , "Test_Shop_Close" );
end

-- 製甲配方(專精/大師)
function LuaFunc_Shop_MakeArmor_B()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Recipe )
   	SetShop( OwnerID() , 600080, "Test_Shop_Close" );
end

-- 裁縫配方(專精/大師)
function LuaFunc_Shop_Tailor_B()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Recipe )
   	SetShop( OwnerID() , 600081 , "Test_Shop_Close" );
end

-- 煉金配方(專精/大師)
function LuaFunc_Shop_Alchemy_B()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Recipe )
   	SetShop( OwnerID() , 600083 , "Test_Shop_Close" );
end

-- 烹飪配方(專精/大師)
function LuaFunc_Shop_Cook_B()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Recipe )
   	SetShop( OwnerID() , 600082, "Test_Shop_Close" );
end

-- 新手挖礦導師
function LuaInit_110469()
	SetMinimapIcon( OwnerID(), EM_MapIconType_Recipe );
	SetShop( OwnerID() , 600020 , "Test_Shop_Close" );
end

-- 新手伐木導師
function LuaInit_110470()
	SetMinimapIcon( OwnerID(), EM_MapIconType_Recipe );
	SetShop( OwnerID() , 600022 , "Test_Shop_Close" );
end

-- 新手採藥導師
function LuaInit_110471()
	SetMinimapIcon( OwnerID(), EM_MapIconType_Recipe );
	SetShop( OwnerID() , 600023 , "Test_Shop_Close" );
end

-- 新手打鐵導師
function LuaInit_110597()
	SetMinimapIcon( OwnerID(), EM_MapIconType_Recipe );
	SetShop( OwnerID() , 600019 , "Test_Shop_Close" );
end

-- 新手木工導師
function LuaInit_110598()
	SetMinimapIcon( OwnerID(), EM_MapIconType_Recipe );
	SetShop( OwnerID() , 600024 , "Test_Shop_Close" );
end

-- 新手煉金導師
function LuaInit_110599()
	SetMinimapIcon( OwnerID(), EM_MapIconType_Recipe );
	SetShop( OwnerID() , 600027 , "Test_Shop_Close" );
end

------------------------------------------------------------------------------------
-- 委託任務
------------------------------------------------------------------------------------
function LuaI_RepeatQuest()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_TrustQuest );
end
------------------------------------------------------------------------------------
-- 坐騎租借
------------------------------------------------------------------------------------
function LuaI_Mount_Shop()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Bank ); --代用
	SetShop( OwnerID() , 600056 , "Test_Shop_Close" );
end

function LuaI_Mount_Shop2()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Bank ); --代用
	SetShop( OwnerID() , 600093 , "Test_Shop_Close" );
end

function LuaI_Mount_Shop3()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Bank ); --代用
	SetShop( OwnerID() , 600094 , "Test_Shop_Close" );
end
-----------------------------------------------------------------------------------------
--熔解石商店
-----------------------------------------------------------------------------------------
function LuaI_MeltStone()
	SetShop( OwnerID() ,600113, "Test_Shop_Close" );
end
--精煉石商店
-----------------------------------------------------------------------------------------
function LuaI_ReFineStone()
	SetShop( OwnerID() ,600058, "Test_Shop_Close" );
end
-----------------------------------------------------------------------------------------
function LuaI_HighReFineStone()
	SetShop( OwnerID() ,600164, "Test_Shop_Close" );
end
