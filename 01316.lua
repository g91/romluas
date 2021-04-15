function LuaInside_CAPTUREFLAG()
	SetCrystalID( TargetID(), 431 ); 	--設定管理的競技場
	LoadQuestOption( OwnerID() )
	--AddSpeakOption( OwnerID(), TargetID( ), "[SC_CAPTUREFLAGINSIDE_1]" , "Lua_CAPTUREFLAG_GetGuildBidInfo", 0 ) --我想報名3v3生存戰場的比賽
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_CAPTUREFLAGINSIDE_2]" , "Lua_CAPTUREFLAG_Teach", 0 ) --我想了解3v3生存戰場的規則
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_DEFEND_2]" , "Lua_DEFEND_Teach", 0 ) --我想了解3v3生存戰場的規則
end

function Lua_CAPTUREFLAG_GetGuildBidInfo()
	CloseSpeak( OwnerID() )
	local Party = LuaFunc_PartyData(OwnerID())
	if (CheckZone(431) == false) then
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_1V1PVP_ZONEERROR]" , 0 )	--戰場還在準備中
	else		
		if Party[0] == 1 then
			-- 要求開啟公會戰競標介面, 資訊傳給 DC, DC 在將資訊轉給 Client
			SendBGInfoToClient( 431, OwnerID() )
		else
			ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_1V1PVP_PARTYERROR]" , 0 )	--請先脫離隊伍在報名
		end
	end
--	Say(OwnerID(),"SendBGInfoToClient")
end
function Lua_CAPTUREFLAG_Teach()
	SetSpeakDetail( OwnerID(), "[SC_CAPTUREFLAGINSIDE_3]"   )
	--1.雙方陣營主堡內皆有象徵該陣營的符石。
	--2.觸碰敵方陣營的符石可以攜帶該符石，並且變身成符石守衛者（+100％攻擊力-50％防禦力），這時只要將該符石帶回己方陣營的符石座，就可以獲得700分。
	--3.當持有符石狀態被殺死時，符石會掉落在死亡的地點，此時如果己方陣營觸碰該符石，則該符石回到主堡符石座。
	--4.殺死一個敵方陣營的玩家可以獲得50分。
	--5.每15秒雙方陣營皆會獲得10分積分。
	--6.分數達到500、1000、1500分的時候同陣營成員會獲得50點榮譽。
	--7.總分先達到2000分的陣營為勝利方，勝利方全體成員會獲得100點榮譽。
end
function Lua_DEFEND_Teach()
	SetSpeakDetail( OwnerID(), "[SC_DEFEND_3]"   )
	--1.雙方陣營主堡內皆有象徵該陣營的符石。
	--2.觸碰敵方陣營的符石可以攜帶該符石，並且變身成符石守衛者（+100％攻擊力-50％防禦力），這時只要將該符石帶回己方陣營的符石座，就可以獲得700分。
	--3.當持有符石狀態被殺死時，符石會掉落在死亡的地點，此時如果己方陣營觸碰該符石，則該符石回到主堡符石座。
	--4.殺死一個敵方陣營的玩家可以獲得50分。
	--5.每15秒雙方陣營皆會獲得10分積分。
	--6.分數達到500、1000、1500分的時候同陣營成員會獲得50點榮譽。
	--7.總分先達到2000分的陣營為勝利方，勝利方全體成員會獲得100點榮譽。
end
 



