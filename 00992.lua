function LuaS_InSideWorld_3_1_7()
--我要兌換腰帶
local flag = 203097
local item = 221060
local HowMuch = 600
	if CountBodyItem( OwnerID() , flag ) >= HowMuch then
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
function LuaS_InSideWorld_3_2_7()
--我要兌換腰帶
local flag = 203097
local item = 221044
local HowMuch = 600
	if CountBodyItem( OwnerID() , flag ) >= HowMuch then
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
function LuaS_InSideWorld_3_3_7()
--我要兌換腰帶
local flag = 203097
local item = 221043
local HowMuch = 600
	if CountBodyItem( OwnerID() , flag ) >= HowMuch then
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
function LuaS_InSideWorld_3_4_7()
--我要兌換腰帶
local flag = 203097
local item = 220407
local HowMuch = 600
	if CountBodyItem( OwnerID() , flag ) >= HowMuch then
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
function LuaS_InSideWorld_3_5_7()
--我要兌換腰帶
local flag = 203097
local item = 220406
local HowMuch = 600
	if CountBodyItem( OwnerID() , flag ) >= HowMuch then
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
function LuaS_InSideWorld_3_6_7()
--我要兌換腰帶
local flag = 203097
local item = 220725
local HowMuch = 600
	if CountBodyItem( OwnerID() , flag ) >= HowMuch then
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