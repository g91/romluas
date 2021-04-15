---------------------------------
function LuaS_111490_6()
--我想用彩帶兌換商城物品
	SetSpeakDetail( OwnerID(), GetString("SC_111490_6_DIALOG")   )--請問你要兌換哪一種。
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111490_6_DIALOG1") , "LuaS_111490_6_1", 0 ) --用五條黃色彩帶兌換
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111490_6_DIALOG2") , "LuaS_111490_6_2", 0 ) --用五條綠色彩帶兌換
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111490_6_DIALOG3") , "LuaS_111490_6_3", 0 ) --用五條藍色彩帶兌換
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111490_6_DIALOG4") , "LuaS_111490_6_4", 0 ) --用五條紫色彩帶兌換
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111490_6_DIALOG5") , "LuaS_111490_6_5", 0 ) --用五條紅色彩帶兌換
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111490_0", 0 ) --回到上一頁
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaS_111490_6_1()
--用五條黃色彩帶兌換
local flag = 203080
local item = 207963 --公會資源禮盒
local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )
	if CountBodyItem( OwnerID() , flag ) >= 5 then
		if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then			
			DelBodyItem( OwnerID() , flag , 5 )
			GiveBodyItem( OwnerID() , item , 1 )
			SetSpeakDetail( OwnerID(), GetString("SC_111490_DIALOG8")   )--祝您南瓜節快樂！
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111490_0", 0 ) --回到上一頁
		else
			SetSpeakDetail( OwnerID(), GetString("SC_111490_DIALOG10")   )--您的背包空間不足，請清理一下再來吧。
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111490_0", 0 ) --回到上一頁
		end
	else
		SetSpeakDetail( OwnerID(), GetString("SC_111490_DIALOG9")   )--您所持有的數量不足，還不能兌換喔。
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111490_0", 0 ) --回到上一頁	
	end
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaS_111490_6_2()
--用五條綠色彩帶兌換
local flag = 203081
local item = 201445 --世界頻道喊話儀
	if CountBodyItem( OwnerID() , flag ) >= 5 then
		if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then			
			DelBodyItem( OwnerID() , flag , 5 )
			GiveBodyItem( OwnerID() , item , 10 )
			SetSpeakDetail( OwnerID(), GetString("SC_111490_DIALOG8")   )--祝您南瓜節快樂！
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111490_0", 0 ) --回到上一頁
		else
			SetSpeakDetail( OwnerID(), GetString("SC_111490_DIALOG10")   )--您的背包空間不足，請清理一下再來吧。
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111490_0", 0 ) --回到上一頁
		end
	else
		SetSpeakDetail( OwnerID(), GetString("SC_111490_DIALOG9")   )--您所持有的數量不足，還不能兌換喔。
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111490_0", 0 ) --回到上一頁	
	end
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaS_111490_6_3()
--用五條藍色彩帶兌換
local flag = 203082
local item = 201134 --經驗藥劑
	if CountBodyItem( OwnerID() , flag ) >= 5 then
		if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then			
			DelBodyItem( OwnerID() , flag , 5 )
			GiveBodyItem( OwnerID() , item , 2 )
			SetSpeakDetail( OwnerID(), GetString("SC_111490_DIALOG8")   )--祝您南瓜節快樂！
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111490_0", 0 ) --回到上一頁
		else
			SetSpeakDetail( OwnerID(), GetString("SC_111490_DIALOG10")   )--您的背包空間不足，請清理一下再來吧。
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111490_0", 0 ) --回到上一頁
		end
	else
		SetSpeakDetail( OwnerID(), GetString("SC_111490_DIALOG9")   )--您所持有的數量不足，還不能兌換喔。
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111490_0", 0 ) --回到上一頁	
	end
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaS_111490_6_4()
--用五條紫色彩帶兌換
local flag = 203083
local item = 202902  --空間記錄墨水
	if CountBodyItem( OwnerID() , flag ) >= 5 then
		if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then			
			DelBodyItem( OwnerID() , flag , 5 )
			GiveBodyItem( OwnerID() , item , 5 )
			SetSpeakDetail( OwnerID(), GetString("SC_111490_DIALOG8")   )--祝您南瓜節快樂！
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111490_0", 0 ) --回到上一頁
		else
			SetSpeakDetail( OwnerID(), GetString("SC_111490_DIALOG10")   )--您的背包空間不足，請清理一下再來吧。
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111490_0", 0 ) --回到上一頁
		end
	else
		SetSpeakDetail( OwnerID(), GetString("SC_111490_DIALOG9")   )--您所持有的數量不足，還不能兌換喔。
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111490_0", 0 ) --回到上一頁	
	end
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaS_111490_6_5()
--用五條紅色彩帶兌換
local flag = 203084
local item = 202903 --傳送者符文
	if CountBodyItem( OwnerID() , flag ) >= 5 then
		if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then			
			DelBodyItem( OwnerID() , flag , 5 )
			GiveBodyItem( OwnerID() , item , 10 )
			SetSpeakDetail( OwnerID(), GetString("SC_111490_DIALOG8")   )--祝您南瓜節快樂！
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111490_0", 0 ) --回到上一頁
		else
			SetSpeakDetail( OwnerID(), GetString("SC_111490_DIALOG10")   )--您的背包空間不足，請清理一下再來吧。
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111490_0", 0 ) --回到上一頁
		end
	else
		SetSpeakDetail( OwnerID(), GetString("SC_111490_DIALOG9")   )--您所持有的數量不足，還不能兌換喔。
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111490_0", 0 ) --回到上一頁	
	end
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------