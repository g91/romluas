function LuaS_oldkeys()
	LoadQuestOption( OwnerID() )
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_OLDKEY_DIALOG2") , "LuaS_oldkeys_1", 0 ) --我想用20個「怪異的結晶」兌換1個「古老的鑰匙」
end
-----------------
function LuaS_oldkeys_1()
--我想用20個「怪異的結晶」兌換1個「古老的鑰匙」
	if CountBodyItem( OwnerID() , 204222 ) >= 20 then
		if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then
			DelBodyItem( OwnerID() , 204222 , 20 )
			GiveBodyItem( OwnerID() , 203178 , 1 )
			SetSpeakDetail( OwnerID(), GetString("SC_OLDKEY_DIALOG8")   )--謝謝光臨！
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_oldkeys", 0 ) --回到上一頁
		else
		SetSpeakDetail( OwnerID(), GetString("SC_111490_DIALOG10")   )--您的背包空間不足，請清理一下再來吧。
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_oldkeys", 0 ) --回到上一頁
		end
	else
	SetSpeakDetail( OwnerID(), GetString("SC_111490_DIALOG9")   )--您所持有的數量不足，還不能兌換喔。
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_oldkeys", 0 ) --回到上一頁	
	end
end