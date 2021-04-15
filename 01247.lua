function LuaInside_SURVIVE()
	SetCrystalID( TargetID(), 430 ); 	--設定管理的競技場
	LoadQuestOption( OwnerID() )
	--AddSpeakOption( OwnerID(), TargetID( ), "[SC_SURVIVEINSIDE_1]" , "Lua_SURVIVE_GetGuildBidInfo", 0 ) --我想報名3v3生存戰場的比賽
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_SURVIVEINSIDE_2]" , "Lua_SURVIVE_Teach", 0 ) --我想了解3v3生存戰場的規則
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_SURVIVEINSIDE_2_6V6]" , "Lua_SURVIVE6v6_Teach", 0 ) --我想了解6v6生存戰場的規則
end

function Lua_SURVIVE_GetGuildBidInfo()
	CloseSpeak( OwnerID() )
	local Party = LuaFunc_PartyData(OwnerID())
	if (CheckZone(430) == false) then
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_1V1PVP_ZONEERROR]" , 0 )	--戰場還在準備中
	else		
		if Party[0] == 1 then
			-- 要求開啟公會戰競標介面, 資訊傳給 DC, DC 在將資訊轉給 Client
			SendBGInfoToClient( 430, OwnerID() )
		else
			ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_1V1PVP_PARTYERROR]" , 0 )	--請先脫離隊伍在報名
		end
	end
--	Say(OwnerID(),"SendBGInfoToClient")
end
function Lua_SURVIVE_Teach()
	SetSpeakDetail( OwnerID(), "[SC_SURVIVEINSIDE_3]"   )	--這是一個考驗3人默契的生存戰場，以個人加入佇列，當佇列中達到6人小隊時，就會隨機配對成三人一組為相同陣營，變成兩個陣營的廝殺。 
									--進入戰場後，會有兩分鐘的等待時間，如果兩分鐘內所有進入佇列的玩家還沒到齊，則關閉戰場，該次戰場沒有獲勝者。 
									--每殺死一個敵方陣營成員，己方增加100分戰場積分，當有一方陣營的戰場積分達到2000分時，則該陣營獲勝，戰場結束。 
									--死亡之後的重生點在陣營起始出發點，重生時有10秒鐘的重生無敵。
									--當陣營戰場積分達到500、1000、1500時，該陣營玩家皆會獲得50點榮譽值。 
									--生存戰場中獲勝陣營成員，不論是否已死亡，皆發給100點榮譽值。 
									--比賽進行時，每3分鐘會出現魔法印記在場上。 
end
function Lua_SURVIVE6v6_Teach()
	SetSpeakDetail( OwnerID(), "[SC_SURVIVEINSIDE_3_6V6]"   )	--這是一個考驗3人默契的生存戰場，以個人加入佇列，當佇列中達到6人小隊時，就會隨機配對成三人一組為相同陣營，變成兩個陣營的廝殺。 
									--進入戰場後，會有兩分鐘的等待時間，如果兩分鐘內所有進入佇列的玩家還沒到齊，則關閉戰場，該次戰場沒有獲勝者。 
									--每殺死一個敵方陣營成員，己方增加100分戰場積分，當有一方陣營的戰場積分達到2000分時，則該陣營獲勝，戰場結束。 
									--死亡之後的重生點在陣營起始出發點，重生時有10秒鐘的重生無敵。
									--當陣營戰場積分達到500、1000、1500時，該陣營玩家皆會獲得50點榮譽值。 
									--生存戰場中獲勝陣營成員，不論是否已死亡，皆發給100點榮譽值。 
									--比賽進行時，每3分鐘會出現魔法印記在場上。 
end