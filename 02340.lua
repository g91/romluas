function bk_war_Shop()--------------------------------世界戰場兌換
	--------------LoadQuestOption( OwnerID() )   -----------讀取
	----SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor  )
	LoadQuestOption( OwnerID() )---------------------寫入人物敘述
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_117310_00]" , "bk_war_shop_0", 0 ) --進入積分商店	
end
function bk_war_shop_0()
	SetSpeakDetail( OwnerID(), "[SC_117310_00]"   ) --對話內容--
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_117310_02]" , "bk_war_shop_1", 0 ) --進入積分一商店
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_117310_03]" , "bk_war_shop_2", 0 ) --進入積分二商店
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_117310_04]" , "bk_war_shop_3", 0 ) --進入積分三商店
	AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "bk_war_Shop", 0 ) --回到上一頁
end
function bk_war_shop_1()
	local warpoint=ReadRoleValue(OwnerID(),EM_RoleValue_IncursivePoint)  --------讀取個人積分
	if warpoint >= 277200 then 
		AddSpeakOption( OwnerID(), TargetID( ), "[SO_WANTBUY]" , "bk_war_shop_1_op", 0 ) --進入積分一商店
	elseif warpoint< 277200 then 
		SetSpeakDetail( OwnerID(), "[SC_117310_05]"   ) --對話內容--積分不足對話
		AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "bk_war_shop_0", 0 ) --回到上一頁
	end
end
function bk_war_shop_1_op()
	SetShop( TargetID( ) , 600310 , "Test_Shop_Close" )
	CloseSpeak( OwnerID() );  --關閉對話視窗
	OpenShop()
end
function bk_war_shop_2()
	local warpoint=ReadRoleValue(OwnerID(),EM_RoleValue_IncursivePoint)  --------讀取個人積分
	if warpoint >= 554400 then 
		AddSpeakOption( OwnerID(), TargetID( ), "[SO_WANTBUY]" , "bk_war_shop_2_op", 0 ) --進入積分一商店
	elseif warpoint< 554400 then 
		SetSpeakDetail( OwnerID(), "[SC_117310_05]"   ) --對話內容--積分不足對話
		AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "bk_war_shop_0", 0 ) --回到上一頁
	end
end
function bk_war_shop_2_op()
	SetShop( TargetID( ) , 600311 , "Test_Shop_Close" )
	CloseSpeak( OwnerID() );  --關閉對話視窗
	OpenShop()
end
function bk_war_shop_3()
	local warpoint=ReadRoleValue(OwnerID(),EM_RoleValue_IncursivePoint)  --------讀取個人積分
	if warpoint >= 831600 then 
		AddSpeakOption( OwnerID(), TargetID( ), "[SO_WANTBUY]" , "bk_war_shop_3_op", 0 ) --進入積分一商店
	elseif warpoint< 831600 then 
		SetSpeakDetail( OwnerID(), "[SC_117310_05]"   ) --對話內容--積分不足對話
		AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "bk_war_shop_0", 0 ) --回到上一頁
	end
end
function bk_war_shop_3_op()
	SetShop( TargetID( ) , 600312 , "Test_Shop_Close" )
	CloseSpeak( OwnerID() );  --關閉對話視窗
	OpenShop()
end


function bk_war_Shop_60()--------------------------------世界戰場兌換
	--------------LoadQuestOption( OwnerID() )   -----------讀取
	----SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor  )
	LoadQuestOption( OwnerID() )---------------------寫入人物敘述
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_117310_00]" , "bk_war_shop0_60_0", 0 ) --進入積分商店	
end
function bk_war_shop0_60_0()
	SetSpeakDetail( OwnerID(), "[SC_117310_00]"   ) --對話內容--
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_117310_02]" , "bk_war_shop_60_1", 0 ) --進入積分一商店
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_117310_03]" , "bk_war_shop_60_2", 0 ) --進入積分二商店
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_117310_04]" , "bk_war_shop_60_3", 0 ) --進入積分三商店
	AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "bk_war_Shop_60", 0 ) --回到上一頁
end
function bk_war_shop_60_1()
	local warpoint=ReadRoleValue(OwnerID(),EM_RoleValue_IncursivePoint)  --------讀取個人積分
	if warpoint >= 277200 then 
		AddSpeakOption( OwnerID(), TargetID( ), "[SO_WANTBUY]" , "bk_war_shop_60_1_op", 0 ) --進入積分一商店
	elseif warpoint< 277200 then 
		SetSpeakDetail( OwnerID(), "[SC_117310_05]"   ) --對話內容--積分不足對話
		AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "bk_war_shop0_60_0", 0 ) --回到上一頁
	end
end
function bk_war_shop_60_1_op()
	SetShop( TargetID( ) , 600313 , "Test_Shop_Close" )
	CloseSpeak( OwnerID() );  --關閉對話視窗
	OpenShop()
end
function bk_war_shop_60_2()
	local warpoint=ReadRoleValue(OwnerID(),EM_RoleValue_IncursivePoint)  --------讀取個人積分
	if warpoint >= 554400 then 
		AddSpeakOption( OwnerID(), TargetID( ), "[SO_WANTBUY]" , "bk_war_shop_60_2_op", 0 ) --進入積分一商店
	elseif warpoint< 554400 then 
		SetSpeakDetail( OwnerID(), "[SC_117310_05]"   ) --對話內容--積分不足對話
		AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "bk_war_shop0_60_0", 0 ) --回到上一頁
	end
end
function bk_war_shop_60_2_op()
	SetShop( TargetID( ) , 600314 , "Test_Shop_Close" )
	CloseSpeak( OwnerID() );  --關閉對話視窗
	OpenShop()
end
function bk_war_shop_60_3()
	local warpoint=ReadRoleValue(OwnerID(),EM_RoleValue_IncursivePoint)  --------讀取個人積分
	if warpoint >= 831600 then 
		AddSpeakOption( OwnerID(), TargetID( ), "[SO_WANTBUY]" , "bk_war_shop_60_3_op", 0 ) --進入積分一商店
	elseif warpoint< 831600 then 
		SetSpeakDetail( OwnerID(), "[SC_117310_05]"   ) --對話內容--積分不足對話
		AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "bk_war_shop0_60_0", 0 ) --回到上一頁
	end
end
function bk_war_shop_60_3_op()
	SetShop( TargetID( ) , 600315 , "Test_Shop_Close" )
	CloseSpeak( OwnerID() );  --關閉對話視窗
	OpenShop()
end

function bk_war_Shop_70()--------------------------------世界戰場兌換
	--------------LoadQuestOption( OwnerID() )   -----------讀取
	----SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor  )
	LoadQuestOption( OwnerID() )---------------------寫入人物敘述
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_117310_00]" , "bk_war_shop0_70_0", 0 ) --進入積分商店	
end
function bk_war_shop0_70_0()
	SetSpeakDetail( OwnerID(), "[SC_117310_00]"   ) --對話內容--
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_117310_02]" , "bk_war_shop_70_1", 0 ) --進入積分一商店
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_117310_03]" , "bk_war_shop_70_2", 0 ) --進入積分二商店
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_117310_04]" , "bk_war_shop_70_3", 0 ) --進入積分三商店
	AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "bk_war_Shop_70", 0 ) --回到上一頁
end
function bk_war_shop_70_1()
	local warpoint=ReadRoleValue(OwnerID(),EM_RoleValue_IncursivePoint)  --------讀取個人積分
	if warpoint >= 277200 then 
		AddSpeakOption( OwnerID(), TargetID( ), "[SO_WANTBUY]" , "bk_war_shop_70_1_op", 0 ) --進入積分一商店
	elseif warpoint< 277200 then 
		SetSpeakDetail( OwnerID(), "[SC_117310_05]"   ) --對話內容--積分不足對話
		AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "bk_war_shop0_70_0", 0 ) --回到上一頁
	end
end
function bk_war_shop_70_1_op()
	SetShop( TargetID( ) , 600316 , "Test_Shop_Close" )
	CloseSpeak( OwnerID() );  --關閉對話視窗
	OpenShop()
end
function bk_war_shop_70_2()
	local warpoint=ReadRoleValue(OwnerID(),EM_RoleValue_IncursivePoint)  --------讀取個人積分
	if warpoint >= 554400 then 
		AddSpeakOption( OwnerID(), TargetID( ), "[SO_WANTBUY]" , "bk_war_shop_70_2_op", 0 ) --進入積分一商店
	elseif warpoint< 554400 then 
		SetSpeakDetail( OwnerID(), "[SC_117310_05]"   ) --對話內容--積分不足對話
		AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "bk_war_shop0_70_0", 0 ) --回到上一頁
	end
end
function bk_war_shop_70_2_op()
	SetShop( TargetID( ) , 600317 , "Test_Shop_Close" )
	CloseSpeak( OwnerID() );  --關閉對話視窗
	OpenShop()
end
function bk_war_shop_70_3()
	local warpoint=ReadRoleValue(OwnerID(),EM_RoleValue_IncursivePoint)  --------讀取個人積分
	if warpoint >= 831600 then 
		AddSpeakOption( OwnerID(), TargetID( ), "[SO_WANTBUY]" , "bk_war_shop_70_3_op", 0 ) --進入積分一商店
	elseif warpoint< 831600 then 
		SetSpeakDetail( OwnerID(), "[SC_117310_05]"   ) --對話內容--積分不足對話
		AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "bk_war_shop0_70_0", 0 ) --回到上一頁
	end
end
function bk_war_shop_70_3_op()
	SetShop( TargetID( ) , 600318 , "Test_Shop_Close" )
	CloseSpeak( OwnerID() );  --關閉對話視窗
	OpenShop()
end
