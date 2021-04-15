function LuaS_InSideWorld_3_1_8()
--我要兌換武器
local flag = 203097
local item = 210409
local HowMuch = 7200
local HowMuch2 = 7
	if CountBodyItem( OwnerID() , flag ) >= HowMuch and CountBodyItem( OwnerID() , flag2 ) >= HowMuch2 then
		if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then			
		DelBodyItem( OwnerID() , flag , HowMuch )
		GiveBodyItem( OwnerID() , item , 1 )
		SetSpeakDetail( OwnerID(), GetString("SC_CHANGEGOOD_1_1")   )--來這就是你要的裝備。
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_InSideWorld_3_1", 0 ) --回到上一頁
		else
		SetSpeakDetail( OwnerID(), GetString("SC_CHANGEGOOD_1_2")   )--您的背包空間不足，請清理一下再來吧。
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_InSideWorld_3_1", 0 ) --回到上一頁
		end
	else
	SetSpeakDetail( OwnerID(), GetString("SC_CHANGEGOOD_1_3")   )--您所持有的噩夢碎片或噩夢之眼數量不足，還不能兌換喔。
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_InSideWorld_3_1", 0 ) --回到上一頁	
	end
end
function LuaS_InSideWorld_3_2_8()
--我要兌換武器
local flag = 203097
local flag2 = 203280
local item = 210463
local HowMuch = 7200
local HowMuch2 = 7
	if CountBodyItem( OwnerID() , flag ) >= HowMuch and CountBodyItem( OwnerID() , flag2 ) >= HowMuch2 then
		if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then			
		DelBodyItem( OwnerID() , flag , HowMuch )
		GiveBodyItem( OwnerID() , item , 1 )
		SetSpeakDetail( OwnerID(), GetString("SC_CHANGEGOOD_1_1")   )--來這就是你要的裝備。
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_InSideWorld_3_2", 0 ) --回到上一頁
		else
		SetSpeakDetail( OwnerID(), GetString("SC_CHANGEGOOD_1_2")   )--您的背包空間不足，請清理一下再來吧。
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_InSideWorld_3_2", 0 ) --回到上一頁
		end
	else
	SetSpeakDetail( OwnerID(), GetString("SC_CHANGEGOOD_1_3")   )--您所持有的噩夢碎片或噩夢之眼數量不足，還不能兌換喔。
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_InSideWorld_3_2", 0 ) --回到上一頁	
	end
end
function LuaS_InSideWorld_3_3_8()
--我要兌換武器
local flag = 203097
local flag2 = 203280
local item = 210431
local HowMuch = 7200
local HowMuch2 = 7
	if CountBodyItem( OwnerID() , flag ) >= HowMuch and CountBodyItem( OwnerID() , flag2 ) >= HowMuch2 then
		if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then			
		DelBodyItem( OwnerID() , flag , HowMuch )
		GiveBodyItem( OwnerID() , item , 1 )
		SetSpeakDetail( OwnerID(), GetString("SC_CHANGEGOOD_1_1")   )--來這就是你要的裝備。
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_InSideWorld_3_3", 0 ) --回到上一頁
		else
		SetSpeakDetail( OwnerID(), GetString("SC_CHANGEGOOD_1_2")   )--您的背包空間不足，請清理一下再來吧。
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_InSideWorld_3_3", 0 ) --回到上一頁
		end
	else
	SetSpeakDetail( OwnerID(), GetString("SC_CHANGEGOOD_1_3")   )--您所持有的噩夢碎片或噩夢之眼數量不足，還不能兌換喔。
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_InSideWorld_3_3", 0 ) --回到上一頁	
	end
end
function LuaS_InSideWorld_3_4_8()
--我要兌換武器
local flag = 203097
local flag2 = 203280
local item = 210222
local HowMuch = 7200
local HowMuch2 = 7
	if CountBodyItem( OwnerID() , flag ) >= HowMuch and CountBodyItem( OwnerID() , flag2 ) >= HowMuch2 then
		if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then			
		DelBodyItem( OwnerID() , flag , HowMuch )
		GiveBodyItem( OwnerID() , item , 1 )
		SetSpeakDetail( OwnerID(), GetString("SC_CHANGEGOOD_1_1")   )--來這就是你要的裝備。
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_InSideWorld_3_4", 0 ) --回到上一頁
		else
		SetSpeakDetail( OwnerID(), GetString("SC_CHANGEGOOD_1_2")   )--您的背包空間不足，請清理一下再來吧。
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_InSideWorld_3_4", 0 ) --回到上一頁
		end
	else
	SetSpeakDetail( OwnerID(), GetString("SC_CHANGEGOOD_1_3")   )--您所持有的噩夢碎片或噩夢之眼數量不足，還不能兌換喔。
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_InSideWorld_3_4", 0 ) --回到上一頁	
	end
end
function LuaS_InSideWorld_3_5_8()
--我要兌換武器
local flag = 203097
local flag2 = 203280
local item = 210437
local HowMuch = 7200
local HowMuch2 = 7
	if CountBodyItem( OwnerID() , flag ) >= HowMuch and CountBodyItem( OwnerID() , flag2 ) >= HowMuch2 then
		if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then			
		DelBodyItem( OwnerID() , flag , HowMuch )
		GiveBodyItem( OwnerID() , item , 1 )
		SetSpeakDetail( OwnerID(), GetString("SC_CHANGEGOOD_1_1")   )--來這就是你要的裝備。
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_InSideWorld_3_5", 0 ) --回到上一頁
		else
		SetSpeakDetail( OwnerID(), GetString("SC_CHANGEGOOD_1_2")   )--您的背包空間不足，請清理一下再來吧。
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_InSideWorld_3_5", 0 ) --回到上一頁
		end
	else
	SetSpeakDetail( OwnerID(), GetString("SC_CHANGEGOOD_1_3")   )--您所持有的噩夢碎片或噩夢之眼數量不足，還不能兌換喔。
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_InSideWorld_3_5", 0 ) --回到上一頁	
	end
end
function LuaS_InSideWorld_3_6_8()
--我要兌換武器
local flag = 203097
local flag2 = 203280
local item = 210423
local HowMuch = 7200
local HowMuch2 = 7
	if CountBodyItem( OwnerID() , flag ) >= HowMuch and CountBodyItem( OwnerID() , flag2 ) >= HowMuch2 then
		if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then			
		DelBodyItem( OwnerID() , flag , HowMuch )
		GiveBodyItem( OwnerID() , item , 1 )
		SetSpeakDetail( OwnerID(), GetString("SC_CHANGEGOOD_1_1")   )--來這就是你要的裝備。
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_InSideWorld_3_6", 0 ) --回到上一頁
		else
		SetSpeakDetail( OwnerID(), GetString("SC_CHANGEGOOD_1_2")   )--您的背包空間不足，請清理一下再來吧。
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_InSideWorld_3_6", 0 ) --回到上一頁
		end
	else
	SetSpeakDetail( OwnerID(), GetString("SC_CHANGEGOOD_1_3")   )--您所持有的噩夢碎片或噩夢之眼數量不足，還不能兌換喔。
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_InSideWorld_3_6", 0 ) --回到上一頁	
	end
end