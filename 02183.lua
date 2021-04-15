function Lua_xmas_crulmax_na()

	SetSpeakDetail( OwnerID(), GetString("SC_CRULMAX_01") ) --看呀！很棒的暖冬樹吧！必爾汀商會為了慶賀暖冬節，推出了佈置暖冬樹的活動，只要收到一定數量的未知的禮物，就可以換取裝飾物唷！。
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_CRULMAX_02"), "Lua_crulmax_na_10", 0 ) --交出10個未知的禮物
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_CRULMAX_03"), "Lua_crulmax_na_30", 0 ) --交出30個未知的禮物
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_CRULMAX_04"), "Lua_crulmax_na_50", 0 ) --交出50個未知的禮物
end


function Lua_crulmax_na_10()
	if CountBodyItem( OwnerID(), 208470) >= 10 then
		DelBodyItem( OwnerID(), 208470, 10)
		GiveBodyItem( OwnerID(), 208471 , 1) --裝飾物(10)
		SetSpeakDetail( OwnerID(), "[SC_CRULMAX_05]")  -- 謝謝你的參與，這是暖冬樹的裝飾品，快去掛上吧！和我們一起讓暖冬樹變得更加繽紛絢麗。
		if CheckFlag ( OwnerID(),544559 ) ==false then  --本日尚未領取過獎勵
			GiveBodyItem( OwnerID(), 206437, 1) --我是乖寶寶證書
			SetFlag( OwnerID(), 544559, 1) --開啟每日領取旗標
			SetSpeakDetail( OwnerID(), "[SC_CRULMAX_05]")  -- 謝謝你的參與，這是暖冬樹的裝飾品，快去掛上吧！和我們一起讓暖冬樹變得更加繽紛絢麗。
		else 
			return false
		end
	else 
		SetSpeakDetail( OwnerID(), "[SC_CRULMAX_06]")  -- 你身上沒有足夠的未知的禮物。
	end
end



function Lua_crulmax_na_30()
	if CountBodyItem( OwnerID(), 208470) >= 30 then
		DelBodyItem( OwnerID(), 208470, 30)
		GiveBodyItem( OwnerID(), 208574 , 1) --裝飾物(30)
		SetSpeakDetail( OwnerID(), "[SC_CRULMAX_05]")  -- 謝謝你的參與，這是暖冬樹的裝飾品，快去掛上吧！和我們一起讓暖冬樹變得更加繽紛絢麗。
		if CheckFlag ( OwnerID(),544559 ) ==false then  --本日尚未領取過獎勵
			GiveBodyItem( OwnerID(), 206437, 1)--我是乖寶寶證書
			SetFlag( OwnerID(), 544559, 1) --開啟每日領取旗標
		else 
			return false
		end
	else 
		SetSpeakDetail( OwnerID(), "[SC_CRULMAX_06]")  -- 你身上沒有足夠的未知的禮物。
	end
end



function Lua_crulmax_na_50()
	if CountBodyItem( OwnerID(), 208470) >= 50 then
		DelBodyItem( OwnerID(), 208470, 50)
		GiveBodyItem( OwnerID(), 208575 , 1) --裝飾物(50)		
		SetSpeakDetail( OwnerID(), "[SC_CRULMAX_05]")  -- 謝謝你的參與，這是暖冬樹的裝飾品，快去掛上吧！和我們一起讓暖冬樹變得更加繽紛絢麗。
		if CheckFlag ( OwnerID(),544559 ) ==false then  --本日尚未領取過獎勵		
			GiveBodyItem( OwnerID(), 206437, 1) --我是乖寶寶證書
			SetFlag( OwnerID(), 544559, 1) --開啟每日領取旗標
		else 
			return false
		end
	else 
		SetSpeakDetail( OwnerID(), "[SC_CRULMAX_06]")  -- 你身上沒有足夠的未知的禮物。
	end
end