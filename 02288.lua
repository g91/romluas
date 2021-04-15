--Z13劇情任務 道具劇情

function lua_mika_zone13maptest()
	for i = 1 , 31 do
		local z13mapid = {301,310,311,312,313,320,321,322,323,330,331,332,333,334,335,340,350,351,352,353,354,355,356,357,360,361,362,363,364,365,366}
		if DW_CheckMap(OwnerID(), z13mapid[i]  ) then   --檢查區域map id
			say(OwnerID(), z13mapid[i])
			say(OwnerID(), "ok")
		else
			say(OwnerID(), z13mapid[i] )
			say(OwnerID(), "no ok")
		end
	end
end


function LuaI_209215_check()
	if DW_CheckMap(OwnerID(), 322 ) then   --檢查區域map id
		return true
	elseif  DW_CheckMap(OwnerID(), 301 ) then
		return true
	elseif  DW_CheckMap(OwnerID(), 320 ) then
		return true
	else
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_209215_2]" , 0 )	--畫面中間訊息  只有在[SC_ZONE13_03]才能收集回音元素。
		return false
	end
end

function LuaI_209215_use()
	local RAN = rand(100)
	if RAN >= 81 then    -- 20
		--哇，真想將這裡美麗的風景與大家分享～！
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_209215_SAY1]" , C_SYSTEM )	--對象-自己 , 欄位- 畫面中間訊息  
		ScriptMessage( OwnerID(), 0, 0, "[SC_209215_SAY1]" , C_SYSTEM )	--對象-周圍所有人 , 欄位- 對話框
		AddBuff( OwnerID() , 509139 , 0 , 10 ) 	 --預計20秒
	elseif RAN <= 80 and RAN >= 46 then   --35
		--哈囉～，我是[$PLAYERNAME]～！
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_209215_SAY2]" , C_SYSTEM )	--對象-自己 , 欄位- 畫面中間訊息  
		ScriptMessage( OwnerID(), 0, 0, "[SC_209215_SAY2]" , C_SYSTEM )	--對象-周圍所有人 , 欄位- 對話框
		AddBuff( OwnerID() , 509139 , 0 , 10 ) 	 --預計20秒
	elseif RAN <= 45 then   --45
		--呦呵－－－！
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_209215_SAY3]" , C_SYSTEM )	--對象-自己 , 欄位- 畫面中間訊息  
		ScriptMessage( OwnerID(), 0, 0, "[SC_209215_SAY3]" , C_SYSTEM )	--對象-周圍所有人 , 欄位- 對話框
		AddBuff( OwnerID() , 509139 , 0 , 10 ) 	 --預計20秒
	end
end