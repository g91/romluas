--710

--保羅 證婚牧師

function LuaS_111282()
	local Player = OwnerID()
	local NPC = TargetID()

	LoadQuestOption(Player)
	BeginPlot( NPC , "lua_mika_merrynpc_range" , 0 )  --檢查NPC與玩家的距離

	if CheckFlag(Player, 541320) == true then --有申請過結婚
		AddSpeakOption( Player, Player, GetString("SC_MARRY_2") , "Marry_Start" , 0 )	--婚禮開始
	end

	AddSpeakOption( Player, Player, "[SC_MERRY_LEAVE]" , "lua_mika_merry_exit01" , 0 )	--離開結婚會場

end

function LuaS_111282_2()
	local Player = OwnerID()
	local NPC = TargetID()

	LoadQuestOption(Player)
	BeginPlot( NPC , "lua_mika_merrynpc_range" , 0 )  --檢查NPC與玩家的距離

	if CheckFlag(Player, 541320) == true then --有申請過結婚
		AddSpeakOption( Player, Player, GetString("SC_MARRY_2") , "Marry_Start2" , 0 )	--婚禮開始
	end

	if CheckBuff(Player, 623790 )  == true then  -- 如果有會場租借憑證 要結完婚才可以走
		if CheckFlag(Player, 541321) == true then --有申請過結婚
			AddSpeakOption( Player, Player, "[SC_MERRY_LEAVE]" , "lua_mika_merry_exit01" , 0 )	--離開結婚會場
		end
	else  -- 一般來賓可以直接離開
		AddSpeakOption( Player, Player, "[SC_MERRY_LEAVE]" , "lua_mika_merry_exit01" , 0 )	--離開結婚會場
	end
end

function lua_mika_merrynpc_range()	-- 距離超過50即關閉對話視窗
	while true do
	--	Say(OwnerID(), "OwnerID")
	--	Say(TargetID(), "TargetID")
		if GetDistance( OwnerID() , TargetID() )  >= 50 then
			CloseSpeak( TargetID() )
			break
		end
		sleep(5)
	end
end

--婚禮開始
function Marry_Start()
	CloseSpeak( OwnerID() )			-- 關閉對話視窗
--	Say(OwnerID(), "OwnerID") -- Player
--	Say(TargetID(), "TargetID" ) -- npc
	BeginPlot( TargetID() , "Marry_Start_Begin", 1 )
end

function Marry_Start2()
	CloseSpeak( OwnerID() )			-- 關閉對話視窗
--	Say(OwnerID(), "OwnerID") -- Player
--	Say(TargetID(), "TargetID" ) -- npc
	BeginPlot( TargetID() , "Marry_Start_Begin2", 1 )
end

--婚禮檢查
function Marry_Start_Begin()
--	Say(OwnerID(), "OwnerID 2") -- npc
--	Say(TargetID(), "TargetID 2" ) -- player
	local PartyNum = GetPartyID(TargetID() , -1 )
	local Couple1 = GetPartyID( TargetID() , 1 )
	local Couple2 = GetPartyID( TargetID() , 2 )
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
	local IamH = Check_Relation( Couple1 , EM_RelationType_Husband )  --
	local IamW = Check_Relation( Couple1 , EM_RelationType_Wife  )  --
	local IamL = Check_Relation( Couple1 , EM_RelationType_Lover )  --
	local IamF = Check_Relation( Couple1 , EM_RelationType_Family  )  --
	local IamB = Check_Relation( Couple1 , EM_RelationType_BestFriend  )  --
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
--------------
--	Say(TargetID(), Relation )
--	Say(TargetID(), Relation2 )
	if ( PartyNum == 0 ) then
		ScriptMessage( TargetID(), TargetID(), 2, "[SC_MARRY_7]" , 0 )	--畫面中間訊息  新郎與新娘必須維持兩人小隊，才可以開始婚禮。
		ScriptMessage( TargetID(), TargetID(), 0, "[SC_MARRY_7]" , 0 )	--訊息欄
	elseif ( PartyNum == 1 ) then
		ScriptMessage( TargetID(), TargetID() , 2, "[SC_RELATION_OFFLINE]" , 0 )	--畫面中間訊息   與你申請結婚的對象不在線上，無法申請。
		ScriptMessage( TargetID(), TargetID() , 0, "[SC_RELATION_OFFLINE]" , 0 )	--訊息欄
	elseif ( PartyNum == 2 ) then
		if GetDistance( Couple1 , OwnerID() ) <= 200 and GetDistance( Couple2 , OwnerID() ) <= 200 and GetDistance( Couple1 , OwnerID() ) ~= -1 and GetDistance( Couple2 , OwnerID() ) ~= -1 then
			if P1LV  < 18 or P2LV  < 18 then   -- 未滿 LV18
				ScriptMessage( Couple1, Couple1, 2, "[SC_MARRY_34]" , 0 )	--畫面中間訊息  雙方所有職業其中之一的職業等級必須在LV18以上
				ScriptMessage( Couple1, Couple1, 0, "[SC_MARRY_34]" , 0 )	
				ScriptMessage( Couple2, Couple2, 2, "[SC_MARRY_34]" , 0 )	
				ScriptMessage( Couple2, Couple2, 0, "[SC_MARRY_34]" , 0 )	
			elseif P1_POS19_DBID ~= 0 then  --如果此值不等於0 (表示此玩家已有20個特殊關係角色)
				ScriptMessage( Couple1, Couple1, 2, "[SC_RELATION_COUNTOVER]" , 0 )	--畫面中間訊息  你的特殊關係數量已達上限，無法建立關係。
				ScriptMessage( Couple1, Couple1, 0, "[SC_RELATION_COUNTOVER]" , 0 )	
				ScriptMessage( Couple2, Couple2, 2, "[SC_RELATION_COUNTOVER]" , 0 )	
				ScriptMessage( Couple2, Couple2, 0, "[SC_RELATION_COUNTOVER]" , 0 )	
			elseif P2_POS19_DBID ~= 0 then  --如果此值不等於0 (表示此玩家已有20個特殊關係角色)
				ScriptMessage( Couple1, Couple1, 2, "[SC_RELATION_COUNTOVER]" , 0 )	--畫面中間訊息  你的特殊關係數量已達上限，無法建立關係。
				ScriptMessage( Couple1, Couple1, 0, "[SC_RELATION_COUNTOVER]" , 0 )	
				ScriptMessage( Couple2, Couple2, 2, "[SC_RELATION_COUNTOVER]" , 0 )	
				ScriptMessage( Couple2, Couple2, 0, "[SC_RELATION_COUNTOVER]" , 0 )	
			elseif  ( IamH == true or YouW == true ) or ( IamW == true or YouH == true ) then  -- 雙方或其中之一為已婚狀態
				ScriptMessage( Couple1, Couple1, 2, "[SC_MARRY_39]" , 0 )	--畫面中間訊息  雙方或其中之一為已婚狀態，無法進行婚禮。
				ScriptMessage( Couple1, Couple1, 0, "[SC_MARRY_39]" , 0 )	
				ScriptMessage( Couple2, Couple2, 2, "[SC_MARRY_39]" , 0 )	
				ScriptMessage( Couple2, Couple2, 0, "[SC_MARRY_39]" , 0 )	
			elseif Relation == -1 and Relation2 == -1 then 	--雙方沒有任何關係
			--可結婚
				BeginPlot(TargetID(), "Marry_Start_Begin3" , 0)  --結婚
			else
			--不可結婚 訊息
				ScriptMessage(  Couple1,  Couple1, 2, "[SC_MARRY_41]" , 0 )	--畫面中間訊息  雙方或其中之一已有其它關係，無法進行婚禮。
				ScriptMessage(  Couple1,  Couple1, 0, "[SC_MARRY_41]" , 0 )	
				ScriptMessage(  Couple2,  Couple2, 2, "[SC_MARRY_41]" , 0 )	
				ScriptMessage(  Couple2,  Couple2, 0, "[SC_MARRY_41]" , 0 )	
			end
		else
			ScriptMessage( Couple1, Couple1 , 2, "[SC_MARRY_8]" , 0 )	--畫面中間訊息   新郎與新娘必須在我的附近，我才能為你們證婚。
			ScriptMessage( Couple1, Couple1 , 0, "[SC_MARRY_8]" , 0 )	
			ScriptMessage( Couple2, Couple2 , 2, "[SC_MARRY_8]" , 0 )	
			ScriptMessage( Couple2, Couple2 , 0, "[SC_MARRY_8]" , 0 )	
		end
	elseif ( PartyNum >= 3 ) then
		ScriptMessage( Couple1, Couple1, 2, "[SC_MARRY_7]" , 0 )	--畫面中間訊息  新郎與新娘必須維持兩人小隊，才可以開始婚禮。
		ScriptMessage( Couple1, Couple1, 0, "[SC_MARRY_7]" , 0 )	
		ScriptMessage( Couple2, Couple2, 2, "[SC_MARRY_7]" , 0 )	
		ScriptMessage( Couple2, Couple2, 0, "[SC_MARRY_7]" , 0 )	
	end
end

function Marry_Start_Begin3()
--	Say(OwnerID(), "Owner 123") 
--	Say(TargetID(), "Target 456" ) 
	local PartyNum = GetPartyID( OwnerID() , -1 )
	local Couple1 = GetPartyID( OwnerID() , 1 )
	local Couple2 = GetPartyID( OwnerID() , 2 )
	if CheckFlag( Couple1, 541321) == true or CheckFlag( Couple2, 541321) == true then --今天結過婚
		ScriptMessage( Couple1, Couple1, 2, "[SC_MARRY_TODAY]" , 0 )	--畫面中間訊息  雙方或其中之一今天已經進行過婚禮了，請明天再來。
		ScriptMessage( Couple1, Couple1, 0, "[SC_MARRY_TODAY]" , 0 )	--訊息欄
		ScriptMessage( Couple2, Couple2, 2, "[SC_MARRY_TODAY]" , 0 )	--畫面中間訊息  雙方或其中之一今天已經進行過婚禮了，請明天再來。
		ScriptMessage( Couple2, Couple2, 0, "[SC_MARRY_TODAY]" , 0 )	--訊息欄
	else
		if CheckFlag( Couple1 , 541320 ) == true and CheckFlag( Couple2 , 541320 ) == true then  --有已申請結婚的keyitem
		--	Say(OwnerID(), "OwnerID4") --npc
		--	Say(TargetID(), "TargetID4") --player
		--	local Couple1 = GetPartyID( TargetID() , 1 )
		--	local Couple2 = GetPartyID( TargetID() , 2 )
		------------- 第一個角色的 -----------------------------------------------------------------
			local P1_mallring1 = CountBodyItem( Couple1 , 202543 )  --商城男生ring
			local P1_mallring2 = CountBodyItem( Couple1 , 202544 )  --商城女生ring
			local P1_shopring1 = CountBodyItem( Couple1 , 202817 )  --遊戲男生ring
			local P1_shopring2 = CountBodyItem( Couple1 , 202818 )  --遊戲女生ring
		------------- 第二個角色的 -----------------------------------------------------------------
			local P2_mallring1 = CountBodyItem( Couple2 , 202543 )  --商城男生ring
			local P2_mallring2 = CountBodyItem( Couple2 , 202544 )  --商城女生ring
			local P2_shopring1 = CountBodyItem( Couple2 , 202817 )  --遊戲男生ring
			local P2_shopring2 = CountBodyItem( Couple2 , 202818 )  --遊戲女生ring

					--加上規則- 
			--提出組隊的人需為男方，接受組隊找需為女方。
			--男方需持有男性婚戒其中一種(商城或遊戲內)，女方需持有女性婚戒其中一種(商城或遊戲內)
			if P1_mallring1 == 0 and  P1_shopring1 == 0 then
				--p1沒有戒指
				ScriptMessage( Couple1, Couple1, 2, "[SC_RELATION_PARTY02]" , 0 ) --畫面中間訊息   請確認提出組隊者是否持有[202817]或[202543]，
				ScriptMessage( Couple1, Couple1, 0, "[SC_RELATION_PARTY02]" , 0 )	
				ScriptMessage( Couple2, Couple2, 2, "[SC_RELATION_PARTY02]" , 0 )	
				ScriptMessage( Couple2, Couple2, 0, "[SC_RELATION_PARTY02]" , 0 )	
				Sleep(10)
				ScriptMessage( Couple1, Couple1, 2, "[SC_RELATION_PARTY02_2]" , 0 )	--畫面中間訊息   接受組隊者是否持有[202818]或[202544]。
				ScriptMessage( Couple1, Couple1, 0, "[SC_RELATION_PARTY02_2]" , 0 )	
				ScriptMessage( Couple2, Couple2, 2, "[SC_RELATION_PARTY02_2]" , 0 )	
				ScriptMessage( Couple2, Couple2, 0, "[SC_RELATION_PARTY02_2]" , 0 )	
			else 
				if P1_mallring1 > 0 then  --有商城戒指
					if P2_mallring2 == 0  then
					--p2沒有商城戒指
						ScriptMessage( Couple1, Couple1, 2, "[SC_RELATION_PARTY04]" , 0 ) --畫面中間訊息   接受組隊者未持有[202544]
						ScriptMessage( Couple1, Couple1, 0, "[SC_RELATION_PARTY04]" , 0 )	
						ScriptMessage( Couple2, Couple2, 2, "[SC_RELATION_PARTY04]" , 0 )	
						ScriptMessage( Couple2, Couple2, 0, "[SC_RELATION_PARTY04]" , 0 )	
					elseif  P2_mallring2 > 0 then
						Marry_Start_Begin_Combo( Couple1 , Couple2 )
					end
				elseif  P1_shopring1 > 0 then  --有一般戒指
					if P2_shopring2 == 0  then
						ScriptMessage( Couple1, Couple1, 2, "[SC_RELATION_PARTY03]" , 0 )  --畫面中間訊息   接受組隊者未持有[202818]
						ScriptMessage( Couple1, Couple1, 0, "[SC_RELATION_PARTY03]" , 0 )	
						ScriptMessage( Couple2, Couple2, 2, "[SC_RELATION_PARTY03]" , 0 )	
						ScriptMessage( Couple2, Couple2, 0, "[SC_RELATION_PARTY03]" , 0 )	
					elseif  P2_shopring2  > 0 then
						Marry_Start_Begin_Combo( Couple1 , Couple2 )
					end
				end
			end
		else
			ScriptMessage( Couple1, Couple1, 2, "[SC_MARRY_43]" , 0 ) --畫面中間訊息  雙方或其中之一未辦理結婚申請，請先向婚姻管理員申請再來找我。
			ScriptMessage( Couple1, Couple1, 0, "[SC_MARRY_43]" , 0 ) 	
			ScriptMessage( Couple2, Couple2, 2, "[SC_MARRY_43]" , 0 )
			ScriptMessage( Couple2, Couple2, 0, "[SC_MARRY_43]" , 0 ) 	
		end
	end
end
