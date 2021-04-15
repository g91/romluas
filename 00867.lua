function LuaS_111376_0()
LoadQuestOption( OwnerID() )
AddSpeakOption( OwnerID(), TargetID( ), GetString("K_08MID_DIALOG1") , "LuaS_111376_1", 0 ) --/*我想了解中秋節的來源
AddSpeakOption( OwnerID(), TargetID( ), GetString("K_08MID_DIALOG2") , "LuaS_111376_2", 0 ) --我想用10個豆沙月餅換取中秋禮包(小)202906 202908 
AddSpeakOption( OwnerID(), TargetID( ), GetString("K_08MID_DIALOG3") , "LuaS_111376_3", 0 ) --我想用10個椰絨月餅換取中秋禮包(中)202907 202909
AddSpeakOption( OwnerID(), TargetID( ), GetString("K_08MID_DIALOG4") , "LuaS_111376_4", 0 ) --我想用20個椰絨月餅換取中秋禮包(大)202907 202910
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaS_111376_1()
SetSpeakDetail( OwnerID(), GetString("K_08MID_DIALOG5")   )--這就是中秋節的由來ㄛ
AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111376_0", 0 ) --回到上一頁
end


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaS_111376_2()
--我想用10個豆沙月餅換取中秋禮包(小)
	if CountBodyItem( OwnerID() , 202906 ) >= 10 then
		if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then			
		DelBodyItem( OwnerID() , 202906 , 10 )
		GiveBodyItem( OwnerID() , 202908  , 1 )
		SetSpeakDetail( OwnerID(), GetString("K_08MID_DIALOG6")   )--祝您中秋佳節愉快
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111376_0", 0 ) --回到上一頁
		else
		SetSpeakDetail( OwnerID(), GetString("K_08MID_DIALOG8")   )--您的背包空間不足，請清理一下再來吧。
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111376_0", 0 ) --回到上一頁
		end
	else
	SetSpeakDetail( OwnerID(), GetString("K_08MID_DIALOG7")   )--您所持有的數量不足，還不能兌換喔。
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111376_0", 0 ) --回到上一頁	
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaS_111376_3()
--我想用10個椰絨月餅換取中秋禮包(中)
	if CountBodyItem( OwnerID() , 202907 ) >= 10 then
		if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then			
		DelBodyItem( OwnerID() , 202907 , 10 )
		GiveBodyItem( OwnerID() , 202909  , 1 )
		SetSpeakDetail( OwnerID(), GetString("K_08MID_DIALOG6")   )--祝您中秋佳節愉快
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111376_0", 0 ) --回到上一頁
		else
		SetSpeakDetail( OwnerID(), GetString("K_08MID_DIALOG8")   )--您的背包空間不足，請清理一下再來吧。
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111376_0", 0 ) --回到上一頁
		end
	else
	SetSpeakDetail( OwnerID(), GetString("K_08MID_DIALOG7")   )--您所持有的數量不足，還不能兌換喔。
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111376_0", 0 ) --回到上一頁	
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaS_111376_4()
--我想用20個椰絨月餅換取中秋禮包(大)
	if CountBodyItem( OwnerID() , 202907 ) >= 20 then
		if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then			
		DelBodyItem( OwnerID() , 202907 , 20 )
		GiveBodyItem( OwnerID() , 202910  , 1 )
		SetSpeakDetail( OwnerID(), GetString("K_08MID_DIALOG6")   )--祝您中秋佳節愉快
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111376_0", 0 ) --回到上一頁
		else
		SetSpeakDetail( OwnerID(), GetString("K_08MID_DIALOG8")   )--您的背包空間不足，請清理一下再來吧。
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111376_0", 0 ) --回到上一頁
		end
	else
	SetSpeakDetail( OwnerID(), GetString("K_08MID_DIALOG7")   )--您所持有的數量不足，還不能兌換喔。
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111376_0", 0 ) --回到上一頁	
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------