-- 702779_新版婚禮檢查條件

-- 檢查錢夠不夠
function Marry_Money_Check(Player, roomid )
	-- 後台版本	
	local coin1 = GetDBKeyValue("WeddingRoomCost_01")	--  必爾汀代幣價格
	local coin2 = GetDBKeyValue("WeddingRoomCost_02")	
	local coin3 = GetDBKeyValue("WeddingRoomCost_03")	

	local itemid = 203038
	local coinlist = {coin1, coin1, coin1, coin2, coin2, coin2, coin3, coin3, coin3 }
	local mycoin = CountBodyItem(Player, itemid )  -- 必爾汀代幣持有量

	if Mycoin >= coinlist[roomid] then
		return true
	else
		return false
	end
end

function Marry_Apply_Check_1(player)  -- 檢查婚禮會場申請條件 -異性結婚版 (只允許異性)
	local NPC = TargetID()

	local PartyNum = GetPartyID(player , -1 )
	local Couple1 = GetPartyID( player , 1 )
	local Couple2 = GetPartyID( player , 2 )
	local Relation = GetRelation(Couple1, Couple2)  --檢查雙方關係
	local Relation2 = GetRelation(Couple2, Couple1) -- 檢查雙方關係

	local P1LV = ReadRoleValue( Couple1, EM_RoleValue_LV)
	local P2LV = ReadRoleValue( Couple2, EM_RoleValue_LV)
	local P1Sex = ReadRoleValue(Couple1, EM_RoleValue_SEX)
	local P2Sex = ReadRoleValue(Couple2, EM_RoleValue_SEX)

	local P1_DBID = ReadRoleValue(Couple1, EM_RoleValue_DBID ) --1P的DBID
	local P2_DBID = ReadRoleValue(Couple2, EM_RoleValue_DBID ) --2P的DBID
	local P1_online =  CheckOnlinePlayer(P1_DBID )  -- 在不在線上
	local P2_online =  CheckOnlinePlayer(P2_DBID )  -- 在不在線上

	local IamS = Check_Relation( Couple1 , EM_RelationType_Student )  --1P是S
	local IamT = Check_Relation( Couple1, EM_RelationType_Teacher )  --1P是T
	local IamH = Check_Relation( Couple1 , EM_RelationType_Husband )  
	local IamW = Check_Relation( Couple1 , EM_RelationType_Wife  )  
	local IamL = Check_Relation( Couple1 , EM_RelationType_Lover )  
	local IamF = Check_Relation( Couple1 , EM_RelationType_Family  )  
	local IamB = Check_Relation( Couple1 , EM_RelationType_BestFriend  )  
---------------
	local YouS = Check_Relation( Couple2 , EM_RelationType_Student )  --
	local YouT = Check_Relation( Couple2, EM_RelationType_Teacher )  --
	local YouH = Check_Relation( Couple2 , EM_RelationType_Husband )  --
	local YouW = Check_Relation( Couple2 , EM_RelationType_Wife  )  --
	local YouL = Check_Relation( Couple2 , EM_RelationType_Lover )  --
	local YouF = Check_Relation( Couple2 , EM_RelationType_Family  )  --
	local YouB = Check_Relation( Couple2 , EM_RelationType_BestFriend  )  --

	local P1_POS19_DBID  = GetRelation_DBID( Couple1 , 19 )
	local P2_POS19_DBID  = GetRelation_DBID( Couple2 , 19 )

--	Say(NPC, "NPC" ) -- NPC
--------------
	if ( PartyNum >= 3 ) then
		ScriptMessage( player, player, 2, "[SC_2012MARRY_TRANSNPC23]" , 0 )   -- 申請失敗，新郎與新娘必須維持兩人小隊
		ScriptMessage( player, player, 0, "[SC_2012MARRY_TRANSNPC23]" , 0 )	
	elseif ( PartyNum <= 0 ) then
		ScriptMessage( player, player, 2, "[SC_2012MARRY_TRANSNPC23]" , 0 )  -- 申請失敗，新郎與新娘必須維持兩人小隊
		ScriptMessage( player, player, 0, "[SC_2012MARRY_TRANSNPC23]" , 0 )
	elseif ( PartyNum == 1 ) then
		ScriptMessage( player, player , 2, "[SC_RELATION_OFFLINE]" , 0 )	--  與你申請結婚的對象不在線上，無法申請。
		ScriptMessage( player, player , 0, "[SC_RELATION_OFFLINE]" , 0 )	
	elseif ( PartyNum == 2 ) then
		if CheckFlag( Couple1, 541321) == true or CheckFlag( Couple2, 541321) == true then --今天結過婚
			ScriptMessage( Couple1, Couple1, 2, "[SC_MARRY_TODAY]" , 0 )	--畫面中間訊息  雙方或其中之一今天已經進行過婚禮了，請明天再來。
			ScriptMessage( Couple1, Couple1, 0, "[SC_MARRY_TODAY]" , 0 )	--訊息欄
			ScriptMessage( Couple2, Couple2, 2, "[SC_MARRY_TODAY]" , 0 )	--畫面中間訊息  雙方或其中之一今天已經進行過婚禮了，請明天再來。
			ScriptMessage( Couple2, Couple2, 0, "[SC_MARRY_TODAY]" , 0 )	--訊息欄
		else
			if GetDistance( Couple1 , NPC ) <= 200 and GetDistance( Couple2 , NPC ) <= 200 and GetDistance( Couple1 , NPC ) ~= -1 and GetDistance( Couple2 , NPC ) ~= -1 then
				if P1LV  < 18 or P2LV  < 18 then   -- 未滿 LV18
					ScriptMessage( Couple1, Couple1, 2, "[SC_MARRY_34]" , 0 )	-- 雙方所有職業其中之一的職業等級必須在LV18以上
					ScriptMessage( Couple1, Couple1, 0, "[SC_MARRY_34]" , 0 )	
					ScriptMessage( Couple2, Couple2, 2, "[SC_MARRY_34]" , 0 )	
					ScriptMessage( Couple2, Couple2, 0, "[SC_MARRY_34]" , 0 )	
					return false
				elseif P1Sex == 0 and P2Sex == 0 then -- 兩個角色都是男的
					ScriptMessage( Couple1, Couple1, 2, "[SC_2012MARRY_TRANSNPC24]" , 0 )	--  申請失敗，申請結婚的雙方角色為同性別
					ScriptMessage( Couple1, Couple1, 0, "[SC_2012MARRY_TRANSNPC24]" , 0 )	
					ScriptMessage( Couple2, Couple2, 2, "[SC_2012MARRY_TRANSNPC24]" , 0 )	
					ScriptMessage( Couple2, Couple2, 0, "[SC_2012MARRY_TRANSNPC24]" , 0 )	
					return false
				elseif P1Sex == 1 and P2Sex == 1 then -- 兩個角色都是女的
					ScriptMessage( Couple1, Couple1, 2, "[SC_2012MARRY_TRANSNPC24]" , 0 )	--  申請失敗，申請結婚的雙方角色為同性別
					ScriptMessage( Couple1, Couple1, 0, "[SC_2012MARRY_TRANSNPC24]" , 0 )	
					ScriptMessage( Couple2, Couple2, 2, "[SC_2012MARRY_TRANSNPC24]" , 0 )	
					ScriptMessage( Couple2, Couple2, 0, "[SC_2012MARRY_TRANSNPC24]" , 0 )	
					return false
				elseif P1_POS19_DBID ~= 0 then  --如果此值不等於0 (表示此玩家已有20個特殊關係角色)
					ScriptMessage( Couple1, Couple1, 2, "[SC_RELATION_COUNTOVER]" , 0 )	--畫面中間訊息  你的特殊關係數量已達上限，無法建立關係。
					ScriptMessage( Couple1, Couple1, 0, "[SC_RELATION_COUNTOVER]" , 0 )	
					ScriptMessage( Couple2, Couple2, 2, "[SC_RELATION_COUNTOVER]" , 0 )	
					ScriptMessage( Couple2, Couple2, 0, "[SC_RELATION_COUNTOVER]" , 0 )	
					return false
				elseif P2_POS19_DBID ~= 0 then  --如果此值不等於0 (表示此玩家已有20個特殊關係角色)
					ScriptMessage( Couple1, Couple1, 2, "[SC_RELATION_COUNTOVER]" , 0 )	--畫面中間訊息  你的特殊關係數量已達上限，無法建立關係。
					ScriptMessage( Couple1, Couple1, 0, "[SC_RELATION_COUNTOVER]" , 0 )
					ScriptMessage( Couple2, Couple2, 2, "[SC_RELATION_COUNTOVER]" , 0 )
					ScriptMessage( Couple2, Couple2, 0, "[SC_RELATION_COUNTOVER]" , 0 )	
					return false
				elseif  ( IamH == true or YouW == true ) or ( IamW == true or YouH == true ) then  -- 雙方或其中之一為已婚狀態
					ScriptMessage( Couple1, Couple1, 2, "[SC_2012MARRY_TRANSNPC25]" , 0 )	--  申請失敗，雙方或其中之一為已婚狀態
					ScriptMessage( Couple1, Couple1, 0, "[SC_2012MARRY_TRANSNPC25]" , 0 )	
					ScriptMessage( Couple2, Couple2, 2, "[SC_2012MARRY_TRANSNPC25]" , 0 )	
					ScriptMessage( Couple2, Couple2, 0, "[SC_2012MARRY_TRANSNPC25]" , 0 )
					return false
				elseif Relation == -1 and Relation2 == -1 then 	--雙方沒有任何關係
				--可結婚
					return true
				else
				--不可結婚 訊息
					ScriptMessage(  Couple1,  Couple1, 2, "[SC_MARRY_41]" , 0 )	-- 雙方或其中之一已有其它關係，無法進行婚禮。
					ScriptMessage(  Couple1,  Couple1, 0, "[SC_MARRY_41]" , 0 )	
					ScriptMessage(  Couple2,  Couple2, 2, "[SC_MARRY_41]" , 0 )	
					ScriptMessage(  Couple2,  Couple2, 0, "[SC_MARRY_41]" , 0 )	
					return false
				end

			else
				ScriptMessage( Couple1, Couple1 , 2, "[SC_MARRY_42]" , 0 )	--畫面中間訊息   新郎與新娘必須在我的附近，才能辦理申請。
				ScriptMessage( Couple1, Couple1 , 0, "[SC_MARRY_42]" , 0 )
				ScriptMessage( Couple2, Couple2 , 2, "[SC_MARRY_42]" , 0 )	
				ScriptMessage( Couple2, Couple2 , 0, "[SC_MARRY_42]" , 0 )	
			end
		end
	end
end


function Marry_Apply_Check_2(player)  -- 檢查婚禮會場申請條件 -同性結婚版 (可同性, 也可異性)
	local NPC = TargetID()

	local PartyNum = GetPartyID(player , -1 )
	local Couple1 = GetPartyID( player , 1 )
	local Couple2 = GetPartyID( player , 2 )
	local Relation = GetRelation(Couple1, Couple2)  --檢查雙方關係
	local Relation2 = GetRelation(Couple2, Couple1) -- 檢查雙方關係

	local P1LV = ReadRoleValue( Couple1, EM_RoleValue_LV)
	local P2LV = ReadRoleValue( Couple2, EM_RoleValue_LV)
	local P1Sex = ReadRoleValue(Couple1, EM_RoleValue_SEX)
	local P2Sex = ReadRoleValue(Couple2, EM_RoleValue_SEX)

	local P1_DBID = ReadRoleValue(Couple1, EM_RoleValue_DBID ) --1P的DBID
	local P2_DBID = ReadRoleValue(Couple2, EM_RoleValue_DBID ) --2P的DBID
	local P1_online =  CheckOnlinePlayer(P1_DBID )  -- 在不在線上
	local P2_online =  CheckOnlinePlayer(P2_DBID )  -- 在不在線上

	local IamS = Check_Relation( Couple1 , EM_RelationType_Student )  --1P是S
	local IamT = Check_Relation( Couple1, EM_RelationType_Teacher )  --1P是T
	local IamH = Check_Relation( Couple1 , EM_RelationType_Husband )  
	local IamW = Check_Relation( Couple1 , EM_RelationType_Wife  )  
	local IamL = Check_Relation( Couple1 , EM_RelationType_Lover )  
	local IamF = Check_Relation( Couple1 , EM_RelationType_Family  )  
	local IamB = Check_Relation( Couple1 , EM_RelationType_BestFriend  )  
---------------
	local YouS = Check_Relation( Couple2 , EM_RelationType_Student )  --
	local YouT = Check_Relation( Couple2, EM_RelationType_Teacher )  --
	local YouH = Check_Relation( Couple2 , EM_RelationType_Husband )  --
	local YouW = Check_Relation( Couple2 , EM_RelationType_Wife  )  --
	local YouL = Check_Relation( Couple2 , EM_RelationType_Lover )  --
	local YouF = Check_Relation( Couple2 , EM_RelationType_Family  )  --
	local YouB = Check_Relation( Couple2 , EM_RelationType_BestFriend  )  --

	local P1_POS19_DBID  = GetRelation_DBID( Couple1 , 19 )
	local P2_POS19_DBID  = GetRelation_DBID( Couple2 , 19 )

--	Say(NPC, "NPC" ) -- NPC
--------------
	if ( PartyNum >= 3 ) then
		ScriptMessage( player, player, 2, "[SC_2012MARRY_TRANSNPC23]" , 0 )   -- 申請失敗，新郎與新娘必須維持兩人小隊
		ScriptMessage( player, player, 0, "[SC_2012MARRY_TRANSNPC23]" , 0 )
	elseif ( PartyNum <= 0 ) then
		ScriptMessage( player, player, 2, "[SC_2012MARRY_TRANSNPC23]" , 0 )  -- 申請失敗，新郎與新娘必須維持兩人小隊
		ScriptMessage( player, player, 0, "[SC_2012MARRY_TRANSNPC23]" , 0 )
	elseif ( PartyNum == 1 ) then
		ScriptMessage( player, player , 2, "[SC_RELATION_OFFLINE]" , 0 )	--畫面中間訊息   與你申請結婚的對象不在線上，無法申請。
		ScriptMessage( player, player , 0, "[SC_RELATION_OFFLINE]" , 0 )	
	elseif ( PartyNum == 2 ) then
		if CheckFlag( Couple1, 541321) == true or CheckFlag( Couple2, 541321) == true then --今天結過婚
			ScriptMessage( Couple1, Couple1, 2, "[SC_MARRY_TODAY]" , 0 )	--畫面中間訊息  雙方或其中之一今天已經進行過婚禮了，請明天再來。
			ScriptMessage( Couple1, Couple1, 0, "[SC_MARRY_TODAY]" , 0 )	--訊息欄
			ScriptMessage( Couple2, Couple2, 2, "[SC_MARRY_TODAY]" , 0 )	--畫面中間訊息  雙方或其中之一今天已經進行過婚禮了，請明天再來。
			ScriptMessage( Couple2, Couple2, 0, "[SC_MARRY_TODAY]" , 0 )	--訊息欄
		else
			if GetDistance( Couple1 , NPC ) <= 200 and GetDistance( Couple2 , NPC ) <= 200 and GetDistance( Couple1 , NPC ) ~= -1 and GetDistance( Couple2 , NPC ) ~= -1 then
				if P1LV  < 18 or P2LV  < 18 then   -- 未滿 LV18
					ScriptMessage( Couple1, Couple1, 2, "[SC_MARRY_34]" , 0 )	--畫面中間訊息  雙方所有職業其中之一的職業等級必須在LV18以上
					ScriptMessage( Couple1, Couple1, 0, "[SC_MARRY_34]" , 0 )	
					ScriptMessage( Couple2, Couple2, 2, "[SC_MARRY_34]" , 0 )	
					ScriptMessage( Couple2, Couple2, 0, "[SC_MARRY_34]" , 0 )	
					return false
				elseif P1_POS19_DBID ~= 0 then  --如果此值不等於0 (表示此玩家已有20個特殊關係角色)
					ScriptMessage( Couple1, Couple1, 2, "[SC_RELATION_COUNTOVER]" , 0 )	--畫面中間訊息  你的特殊關係數量已達上限，無法建立關係。
					ScriptMessage( Couple1, Couple1, 0, "[SC_RELATION_COUNTOVER]" , 0 )
					ScriptMessage( Couple2, Couple2, 2, "[SC_RELATION_COUNTOVER]" , 0 )	
					ScriptMessage( Couple2, Couple2, 0, "[SC_RELATION_COUNTOVER]" , 0 )	
					return false
				elseif P2_POS19_DBID ~= 0 then  --如果此值不等於0 (表示此玩家已有20個特殊關係角色)
					ScriptMessage( Couple1, Couple1, 2, "[SC_RELATION_COUNTOVER]" , 0 )	--畫面中間訊息  你的特殊關係數量已達上限，無法建立關係。
					ScriptMessage( Couple1, Couple1, 0, "[SC_RELATION_COUNTOVER]" , 0 )
					ScriptMessage( Couple2, Couple2, 2, "[SC_RELATION_COUNTOVER]" , 0 )	
					ScriptMessage( Couple2, Couple2, 0, "[SC_RELATION_COUNTOVER]" , 0 )	
					return false
				elseif  ( IamH == true or YouW == true ) or ( IamW == true or YouH == true ) then  -- 雙方或其中之一為已婚狀態
					ScriptMessage( Couple1, Couple1, 2, "[SC_2012MARRY_TRANSNPC25]" , 0 )	--  申請失敗，雙方或其中之一為已婚狀態
					ScriptMessage( Couple1, Couple1, 0, "[SC_2012MARRY_TRANSNPC25]" , 0 )
					ScriptMessage( Couple2, Couple2, 2, "[SC_2012MARRY_TRANSNPC25]" , 0 )	
					ScriptMessage( Couple2, Couple2, 0, "[SC_2012MARRY_TRANSNPC25]" , 0 )	
					return false
				elseif Relation == -1 and Relation2 == -1 then 	--雙方沒有任何關係
				--可結婚
					return true
				else
				--不可結婚 訊息
					ScriptMessage(  Couple1,  Couple1, 2, "[SC_2012MARRY_TRANSNPC26]" , 0 )	-- 申請失敗，雙方或其中之一已有其它關係，無法進行婚禮。
					ScriptMessage(  Couple1,  Couple1, 0, "[SC_2012MARRY_TRANSNPC26]" , 0 )
					ScriptMessage(  Couple2,  Couple2, 2, "[SC_2012MARRY_TRANSNPC26]" , 0 )
					ScriptMessage(  Couple2,  Couple2, 0, "[SC_2012MARRY_TRANSNPC26]" , 0 )
					return false
				end

			else
				ScriptMessage( Couple1, Couple1 , 2, "[SC_MARRY_42]" , 0 )	--畫面中間訊息   新郎與新娘必須在我的附近，才能辦理申請。
				ScriptMessage( Couple1, Couple1 , 0, "[SC_MARRY_42]" , 0 )
				ScriptMessage( Couple2, Couple2 , 2, "[SC_MARRY_42]" , 0 )
				ScriptMessage( Couple2, Couple2 , 0, "[SC_MARRY_42]" , 0 )	
			end
		end
	end
end