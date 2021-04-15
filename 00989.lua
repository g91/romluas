--------------------------------
function LuaS_InSideWorld_3_4()
--我要兌換戰士套裝
	SetSpeakDetail( OwnerID(), GetString("SC_CHANGE_0")   )--請問你要兌換哪個部位。
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_CHANGE_1") , "LuaS_InSideWorld_3_4_1", 0 ) --我要兌換頭盔(需要1600個噩夢碎片和4個噩夢之眼)
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_CHANGE_2") , "LuaS_InSideWorld_3_4_2", 0 ) --我要兌換上衣(需要7000個噩夢碎片和6個噩夢之眼)
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_CHANGE_3") , "LuaS_InSideWorld_3_4_3", 0 ) --我要兌換褲子(需要5500個噩夢碎片和5個噩夢之眼)
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_CHANGE_4") , "LuaS_InSideWorld_3_4_4", 0 ) --我要兌換手套(需要1400個噩夢碎片)
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_CHANGE_5") , "LuaS_InSideWorld_3_4_5", 0 ) --我要兌換鞋子(需要1200個噩夢碎片)
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_CHANGE_6") , "LuaS_InSideWorld_3_4_6", 0 ) --我要兌換肩甲(需要800個噩夢碎片)
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_CHANGE_7") , "LuaS_InSideWorld_3_4_7", 0 ) --我要兌換腰帶(需要600個噩夢碎片)
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_CHANGE_8") , "LuaS_InSideWorld_3_4_8", 0 ) --我要兌換武器(需要7200個噩夢碎片和7個噩夢之眼)
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_InSideWorld_3", 0 ) --回到上一頁
end
--------------------------------
function LuaS_InSideWorld_3_4_1()
--我要兌換頭盔
local flag = 203097
local flag2 = 203280
local item = 221009
local HowMuch = 1600
local HowMuch2 = 4
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
--------------------------------
function LuaS_InSideWorld_3_4_2()
--我要兌換上衣
local flag = 203097
local flag2 = 203280
local item = 221014
local HowMuch = 7000
local HowMuch2 = 6
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
--------------------------------
function LuaS_InSideWorld_3_4_3()
--我要兌換褲子
local flag = 203097
local flag2 = 203280
local item = 221025
local HowMuch = 5500
local HowMuch2 = 5
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
--------------------------------
function LuaS_InSideWorld_3_4_4()
--我要兌換手套
local flag = 203097
local flag2 = 203280
local item = 221027
local HowMuch = 1400
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
--------------------------------
function LuaS_InSideWorld_3_4_5()
--我要兌換鞋子
local flag = 203097
local flag2 = 203280
local item = 221031
local HowMuch = 1200
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
--------------------------------
function LuaS_InSideWorld_3_4_6()
--我要兌換肩甲
local flag = 203097
local flag2 = 203280
local item = 221035
local HowMuch = 800
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
--------------------------------