function LuaS_ForEventNpcs()
LoadQuestOption( OwnerID() )
AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_K_09V_112151_6") , "LuaS_112151_20", 0 ) --我想製作愛戀巧克力
end

function LuaS_112151_20()
local aitem=202981	--可可豆
local bitem=202983	--牛奶
local citem=203022	--情人的愛心
local ditem=203023	--愛戀巧克力
	if  CountBodyItem( OwnerID() , aitem )>=1 and CountBodyItem( OwnerID() , bitem )>=1 and CountBodyItem( OwnerID() , citem )>=1 then
		if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then
			DelBodyItem( OwnerID() , aitem , 1 )
			DelBodyItem( OwnerID() , bitem , 1 )
			DelBodyItem( OwnerID() , citem , 1 )
			GiveBodyItem( OwnerID() ,ditem , 1 )
			SetSpeakDetail( OwnerID(), GetString("SC_K_09V_112151_5")   )--祝天下有情人終成眷屬
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaYU_112150_20", 0 ) --回到上一頁
		else
		SetSpeakDetail( OwnerID(), GetString("K_08MID_DIALOG8")   )--您的背包空間不足，請清理一下再來吧。
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaYU_112150_20", 0 ) --回到上一頁
		end
	else
	SetSpeakDetail( OwnerID(), GetString("SC_K_09V_112151_7")   )--您所持有的數量不足，還不能兌換喔。
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaYU_112150_20", 0 ) --回到上一頁
	end
end