function LuaS_ying_240181_shop() --必爾汀圓貝兌換特化裝

	LoadQuestOption( OwnerID() ) --你好，我是必爾汀建築商會考古組的古文物學者．XXX
	AddSpeakOption( OwnerID() , TargetID() , "[SC_240181_SHOP_02]", "LuaS_ComShop_1" , 0 ) --我想看看兌換的物品
end
----------------------------------------------------------------------------------------------------------------------------------------------------
function LuaS_ying_shop01() --鎧甲兌換員

	SetMinimapIcon ( OwnerID() , EM_MapIconType_Armor  ) --小地圖顯示
	SetShop( OwnerID() , 600347 , "Test_Shop_Close" ) --鎧甲
end
----------------------------------------------------------------------------------------------------------------------------------------------------
function LuaS_ying_shop02() --鎖甲兌換員

	SetMinimapIcon ( OwnerID() , EM_MapIconType_Armor  ) --小地圖顯示
	SetShop( OwnerID() , 600348 , "Test_Shop_Close" ) --鎖甲
end
----------------------------------------------------------------------------------------------------------------------------------------------------
function LuaS_ying_shop03() --皮甲兌換員

	SetMinimapIcon ( OwnerID() , EM_MapIconType_Armor  ) --小地圖顯示
	SetShop( OwnerID() , 600349 , "Test_Shop_Close" ) --皮甲
end
----------------------------------------------------------------------------------------------------------------------------------------------------
function LuaS_ying_shop04() --法袍兌換員

	SetMinimapIcon ( OwnerID() , EM_MapIconType_Armor  ) --小地圖顯示
	SetShop( OwnerID() , 600350 , "Test_Shop_Close" ) --法袍
end
----------------------------------------------------------------------------------------------------------------------------------------------------
function LuaS_ying_shop05() --布衣兌換員

	SetMinimapIcon ( OwnerID() , EM_MapIconType_Armor  ) --小地圖顯示
	SetShop( OwnerID() , 600351 , "Test_Shop_Close" ) --布衣
end
----------------------------------------------------------------------------------------------------------------------------------------------------
function Hao_Phirius_Shell_Store()	--　補給品兌換員

	local Player = OwnerID()	-- Player
	local Npc = TargetID()	-- Npc
	AdjustFaceDir( Npc , Player , 0 ) --面向
	CloseShop( Npc )
	CloseSpeak( Player )
	SetSpeakDetail( Player , "[SC_240181_SHOP_01]"   )	-- 對話劇情
	AddSpeakOption( Player , Npc , "[AC_ITEMTYPENAME_2]" , "Hao_Phirius_Shell_Store_01", 5 )	-- 補給品兌換
end

function Hao_Phirius_Shell_Store_01()

	local Player = OwnerID()
	local Npc = TargetID()
	SetShop( Npc , 600397 , "" )
	CloseSpeak( Player )
	OpenShop()
end