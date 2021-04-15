function LuaInside_1v1PVP()
--	local UseItem4 = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem4)
--	local Played =  CheckFlag( OwnerID()  , 542416 ) --今天有無來過
--	if Played == false then
--		WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem4 , 0 ) 
--		SetFlag(OwnerID(), 542416, 1)
--	end
--	if UseItem4 == 100 then
--		ScriptMessage( OwnerID(),  -1, 2, "[SC_1V1PVP_PLAY100]" , 0 )	--你居然在一天內挑戰了100次!!讓我送你一個禮物!
--		GiveBodyItem( OwnerID() ,  201445  , 10 ) --100次禮物
--	elseif UseItem4 == 300 then
--		ScriptMessage( OwnerID(),  -1, 2, "[SC_1V1PVP_PLAY300]" , 0 )	--你居然在一天內挑戰了300次!!讓我送你一個禮物!
--		GiveBodyItem( OwnerID() ,  201609  , 5 ) --300次禮物
--	elseif UseItem4 == 600 then
--		ScriptMessage( OwnerID(),  -1, 2, "[SC_1V1PVP_PLAY600]" , 0 )	--你居然在一天內挑戰了600次!!讓我送你一個禮物!
--		GiveBodyItem( OwnerID() ,  201610  , 5 ) --600次禮物
--	elseif UseItem4 == 1000 then
--		ScriptMessage( OwnerID(),  -1, 2, "[SC_1V1PVP_PLAY1000]" , 0 )	--你居然在一天內挑戰了1000次!!讓我送你一個禮物!
--		GiveBodyItem( OwnerID() ,  201698  , 1 ) --1000次禮物
--	end
	SetCrystalID( TargetID(), 410 ); 	--設定管理的競技場
	LoadQuestOption( OwnerID() )
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_1V1PVPINSIDE1]" , "Lua_1V1PVP_Teach", 0 ) --我想報名1對1競技場的比賽
	--AddSpeakOption( OwnerID(), TargetID( ), "[SC_1V1PVPINSIDE_1]" , "Lua_1v1PVP_GetGuildBidInfo", 0 ) --我想報名1對1競技場的比賽
--	AddSpeakOption( OwnerID(), TargetID( ), "[SC_1V1PVPINSIDE_2]" , "Lua_1v1PVP_ChangeItem", 0 ) --我想用100個[203988]兌換[203178]
--	AddSpeakOption( OwnerID(), TargetID( ), "[SC_1V1PVPINSIDE_3]" , "Lua_1v1PVP_ChangeItem2", 0 ) --我想用500個[203988]兌換[202095]
--	AddSpeakOption( OwnerID(), TargetID( ), "[SC_1V1PVPINSIDE_4]" , "Lua_1v1PVP_ChangeItem3", 0 ) --我想用1000個[203988]兌換[203300]
end
function Lua_1V1PVP_Teach()
	SetSpeakDetail( OwnerID(), "[SC_1V1PVPINSIDE_RULE]"   )	--這是一個考驗3人默契的生存戰場，以個人加入佇列，當佇列中達到6人小隊時，就會隨機配對成三人一組為相同陣營，變成兩個陣營的廝殺。 
									--進入戰場後，會有兩分鐘的等待時間，如果兩分鐘內所有進入佇列的玩家還沒到齊，則關閉戰場，該次戰場沒有獲勝者。 
									--每殺死一個敵方陣營成員，己方增加100分戰場積分，當有一方陣營的戰場積分達到2000分時，則該陣營獲勝，戰場結束。 
									--死亡之後的重生點在陣營起始出發點，重生時有10秒鐘的重生無敵。
									--當陣營戰場積分達到500、1000、1500時，該陣營玩家皆會獲得50點榮譽值。 
									--生存戰場中獲勝陣營成員，不論是否已死亡，皆發給100點榮譽值。 
									--比賽進行時，每3分鐘會出現魔法印記在場上。 
end
function Lua_1v1PVP_GetGuildBidInfo()
	CloseSpeak( OwnerID() )
	local Party = LuaFunc_PartyData(OwnerID())
	if (CheckZone(410) == false) then
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_1V1PVP_ZONEERROR]" , 0 )	--戰場還在準備中
	else		
		if Party[0] == 1 then
			-- 要求開啟公會戰競標介面, 資訊傳給 DC, DC 在將資訊轉給 Client
			SendBGInfoToClient( 410, OwnerID() )
		else
			ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_1V1PVP_PARTYERROR]" , 0 )	--請先脫離隊伍在報名
		end
	end
--	Say(OwnerID(),"SendBGInfoToClient")
end
function Lua_1v1PVP_ChangeItem()
	local flag = 203988
	local item = 203178
	local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )
	if CountBodyItem( OwnerID() , flag ) >= 100 then
		if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then			
		DelBodyItem( OwnerID() , flag , 100 )
		GiveBodyItem( OwnerID() , item , 1 )
		CloseSpeak( OwnerID() )
		else
		SetSpeakDetail( OwnerID(), "[SC_111490_DIALOG10]")--您的背包空間不足，請清理一下再來吧。
		AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , "LuaInside_1v1PVP", 0 ) --回到上一頁
		end
	else
	SetSpeakDetail( OwnerID(), "[SC_111490_DIALOG9]")--您所持有的數量不足，還不能兌換喔。
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , "LuaInside_1v1PVP", 0 ) --回到上一頁	
	end	
end
function Lua_1v1PVP_ChangeItem2()
	local flag = 203988
	local item = 202095
	local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )
	if CountBodyItem( OwnerID() , flag ) >= 500 then
		if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then			
		DelBodyItem( OwnerID() , flag , 500 )
		GiveBodyItem( OwnerID() , item , 1 )
		CloseSpeak( OwnerID() )
		else
		SetSpeakDetail( OwnerID(), "[SC_111490_DIALOG10]")--您的背包空間不足，請清理一下再來吧。
		AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , "LuaInside_1v1PVP", 0 ) --回到上一頁
		end
	else
	SetSpeakDetail( OwnerID(), "[SC_111490_DIALOG9]")--您所持有的數量不足，還不能兌換喔。
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , "LuaInside_1v1PVP", 0 ) --回到上一頁	
	end
end

function Lua_1v1PVP_ChangeItem3()
	local flag = 203988
	local item = 203300
	local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )
	if CountBodyItem( OwnerID() , flag ) >= 1000 then
		if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then
		CloseSpeak( OwnerID() )
		DelBodyItem( OwnerID() , flag , 1000 )
		GiveBodyItem( OwnerID() , item , 1 )
		else
		SetSpeakDetail( OwnerID(), "[SC_111490_DIALOG10]")--您的背包空間不足，請清理一下再來吧。
		AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , "LuaInside_1v1PVP", 0 ) --回到上一頁
		end
	else
	SetSpeakDetail( OwnerID(), "[SC_111490_DIALOG9]")--您所持有的數量不足，還不能兌換喔。
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , "LuaInside_1v1PVP", 0 ) --回到上一頁
	end
end


--競技場積分用
-- SetArenaScore ( int iRoomID, int iTeamID, int iArenaType, int iIndex, int iValue ) 
-- GetArenaScore ( int iRoomID, int iTeamID, int iArenaType, int iIndex ) 
--iArenaType : 1 = 1v1, 2 = 2v2, 3 = 6v6
--iIndex : 1=參加次數 2=積分 3=本週勝場 4=本週敗場 5=月勝場 6=月敗場 7=個人勝場 8=個人敗場
function CountPVPScore(WinTeamScore,LoseTeamScore)
	local WinScore = 0
	local LoseScore = 0
	local Count = WinTeamScore - LoseTeamScore
	if WinTeamScore > LoseTeamScore then
		WinScore = 25 - math.abs(Count*.01)*0.5
		LoseScore = 30 - math.abs(Count*.01)*0.6
	else
		WinScore = 25 + math.abs(Count*.01)*0.5
		LoseScore = 30 + math.abs(Count*.01)*0.6
	end

	return WinScore,LoseScore
end

function LuaI_PVPGife( Option )
	local PlayerLV = ReadRoleValue( TargetID() , EM_RoleValue_LV ) --讀取玩家的主職等級
	local PlayerID = OwnerID()
	local PackageID = 203988		-- 暖冬禮物盒
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
--	Say(PlayerID,"PlayerID is "..PlayerID)
	local Item = {	200663,	200664,	200808,	200812,	200816,	200820,	204889}
	local ByLv = {	1,	6,	16,	26,	36,	46,	51}
	if ( Option == "CHECK" ) then
--		Say(PlayerID,"PlayerID is "..PlayerID)
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		local Fi = 1
		for i=1,table.getn(ByLv) do
			if PlayerLV >= ByLv[i] then
				Fi = i
			end
		end
		GiveBodyItem( PlayerID , Item[Fi] , Rand(3)+1 )
	end
end