function LuaS_111491_0()
	LoadQuestOption( OwnerID() )
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111491_DIALOG1") , "LuaS_111491_1", 0 ) --我想用10個「靈魂碎片」兌換「變身藥水」。
end
-----------------
function LuaS_111491_1()
--我想用10個「靈魂碎片」兌換「變身藥水」。
	if CountBodyItem( OwnerID() , 203165 ) >= 10 then
		if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then
		DelBodyItem( OwnerID() , 203165 , 10 )
		GiveBodyItem( OwnerID() , 203085 , 1 )
		SetSpeakDetail( OwnerID(), GetString("SC_111491_DIALOG2")   )--嘿嘿！變身後，你可能有意外的收穫。
		else
		SetSpeakDetail( OwnerID(), GetString("SC_111491_DIALOG3")   )--您的背包空間不足，請清理一下再來吧。
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111491_0", 0 ) --回到上一頁
		end
	else
	SetSpeakDetail( OwnerID(), GetString("SC_111491_DIALOG4")   )--您所持有的「靈魂碎片」數量不足，還不能兌換。
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111491_0", 0 ) --回到上一頁	
	end
end