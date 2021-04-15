--結婚管理員2  (只能異性結婚)

function LuaS_111274_2() -- npc初始劇情
	LoadQuestOption( OwnerID() );  --載入任務模板
	BeginPlot( TargetID() , "lua_mika_merrynpc_range" , 0 )  --檢查NPC與玩家的距離
	local Player = OwnerID()
	local Target = TargetID()
	local Couple1 = GetPartyID( Player , 1 )
	local Couple2 = GetPartyID( Player , 2 )
	local IamH = Check_Relation( Couple1 , EM_RelationType_Husband )  --1P是老公
	local IamW = Check_Relation( Couple1, EM_RelationType_Wife )  --1P是老婆
	local UareH = Check_Relation( Couple2 , EM_RelationType_Husband )  --2P是老公
	local UareW = Check_Relation( Couple2 , EM_RelationType_Wife  )  --2P是老婆

	AddSpeakOption( OwnerID(), TargetID(),"[SC_RELATION_INTRO_01]" , "lua_mika_relationintro_01" , 0 )  --關係系統介紹
	if CheckFlag( OwnerID() , 541320 ) == true then  --有已申請結婚的keyitem
		AddSpeakOption( OwnerID(), TargetID(),"[SC_MARRY_36]" , "lua_mika_merryzonego" , 0 )  --前往結婚場地
		AddSpeakOption( OwnerID(), TargetID(),"[SC_MARRY_GIVEUP1]" , "lua_mika_merrygiveup" , 0 )  --我想放棄婚姻申請
	else
		if (IamH ==  false  and UareW  == false) or (IamW  == false and UareH == false ) then  --雙方都沒有結婚
			AddSpeakOption( OwnerID(), TargetID(), GetString("SC_MARRY_1") , "Marry_Check2" , 0 )	--我想要結婚
		end
	end
	AddSpeakOption( OwnerID(), TargetID(), GetString("SC_MARRY_20") , "Marry_Shop" , 0 )		--購買婚姻相關物品
end

--申請結婚
function Marry_Check2()  
	local Couple1 = GetPartyID( OwnerID() , 1 )
	local Couple2 = GetPartyID( OwnerID() , 2 )
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
	CloseSpeak( OwnerID() )			-- 關閉對話視窗
--	Say(OwnerID(), Relation )
--	Say(OwnerID(), Relation2 )
	local PartyNum = GetPartyID( OwnerID() , -1 )
	if ( PartyNum == 0 ) then
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_MARRY_3]" , C_SYSTEM )	--畫面中間訊息  請先跟你心儀的對象組成兩人小隊，再來找我申請。
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_MARRY_3]" , C_SYSTEM )	--訊息欄
	elseif ( PartyNum == 1 ) then
		ScriptMessage( OwnerID(), OwnerID() , 2, "[SC_RELATION_OFFLINE]" , C_SYSTEM )	--畫面中間訊息   與你申請結婚的對象不在線上，無法申請。
		ScriptMessage( OwnerID(), OwnerID() , 0, "[SC_RELATION_OFFLINE]" , C_SYSTEM )	--訊息欄
	elseif ( PartyNum == 2 ) then
		if GetDistance( Couple1 , OwnerID() ) <= 200 and GetDistance( Couple2 , OwnerID() ) <= 200 and GetDistance( Couple1 , OwnerID() ) ~= -1 and GetDistance( Couple2 , OwnerID() ) ~= -1 then
			if P1LV  < 18 or P2LV  < 18 then   -- 未滿 LV18
				ScriptMessage( Couple1, Couple1, 2, "[SC_MARRY_34]" , C_SYSTEM )	--畫面中間訊息  雙方所有職業其中之一的職業等級必須在LV18以上
				ScriptMessage( Couple1, Couple1, 0, "[SC_MARRY_34]" , C_SYSTEM )	--訊息欄
				ScriptMessage( Couple2, Couple2, 2, "[SC_MARRY_34]" , C_SYSTEM )	--畫面中間訊息  雙方所有職業其中之一的職業等級必須在LV18以上
				ScriptMessage( Couple2, Couple2, 0, "[SC_MARRY_34]" , C_SYSTEM )	--訊息欄
			elseif P1Sex == 0 and P2Sex == 0 then -- 兩個角色都是男的
				ScriptMessage( Couple1, Couple1, 2, "[SC_MARRY_38]" , C_SYSTEM )	--畫面中間訊息  申請結婚的雙方角色為同性別，無法申請結婚。
				ScriptMessage( Couple1, Couple1, 0, "[SC_MARRY_38]" , C_SYSTEM )	--訊息欄
				ScriptMessage( Couple2, Couple2, 2, "[SC_MARRY_38]" , C_SYSTEM )	--畫面中間訊息  申請結婚的雙方角色為同性別，無法申請結婚。
				ScriptMessage( Couple2, Couple2, 0, "[SC_MARRY_38]" , C_SYSTEM )	--訊息欄
			elseif P1Sex == 1 and P2Sex == 1 then -- 兩個角色都是女的
				ScriptMessage( Couple1, Couple1, 2, "[SC_MARRY_38]" , C_SYSTEM )	--畫面中間訊息  申請結婚的雙方角色為同性別，無法申請結婚。
				ScriptMessage( Couple1, Couple1, 0, "[SC_MARRY_38]" , C_SYSTEM )	--訊息欄
				ScriptMessage( Couple2, Couple2, 2, "[SC_MARRY_38]" , C_SYSTEM )	--畫面中間訊息  申請結婚的雙方角色為同性別，無法申請結婚。
				ScriptMessage( Couple2, Couple2, 0, "[SC_MARRY_38]" , C_SYSTEM )	--訊息欄
			elseif P1_POS19_DBID ~= 0 then  --如果此值不等於0 (表示此玩家已有20個特殊關係角色)
				ScriptMessage( Couple1, Couple1, 2, "[SC_RELATION_COUNTOVER]" , C_SYSTEM )	--畫面中間訊息  你的特殊關係數量已達上限，無法建立關係。
				ScriptMessage( Couple1, Couple1, 0, "[SC_RELATION_COUNTOVER]" , C_SYSTEM )	--訊息欄
				ScriptMessage( Couple2, Couple2, 2, "[SC_RELATION_COUNTOVER]" , C_SYSTEM )	--畫面中間訊息  你的特殊關係數量已達上限，無法建立關係。
				ScriptMessage( Couple2, Couple2, 0, "[SC_RELATION_COUNTOVER]" , C_SYSTEM )	--訊息欄
			elseif P2_POS19_DBID ~= 0 then  --如果此值不等於0 (表示此玩家已有20個特殊關係角色)
				ScriptMessage( Couple1, Couple1, 2, "[SC_RELATION_COUNTOVER]" , C_SYSTEM )	--畫面中間訊息  你的特殊關係數量已達上限，無法建立關係。
				ScriptMessage( Couple1, Couple1, 0, "[SC_RELATION_COUNTOVER]" , C_SYSTEM )	--訊息欄
				ScriptMessage( Couple2, Couple2, 2, "[SC_RELATION_COUNTOVER]" , C_SYSTEM )	--畫面中間訊息  你的特殊關係數量已達上限，無法建立關係。
				ScriptMessage( Couple2, Couple2, 0, "[SC_RELATION_COUNTOVER]" , C_SYSTEM )	--訊息欄
			elseif  ( IamH == true or YouW == true ) or ( IamW == true or YouH == true ) then  -- 雙方或其中之一為已婚狀態
				ScriptMessage( Couple1, Couple1, 2, "[SC_MARRY_28]" , C_SYSTEM )	--畫面中間訊息  雙方或其中之一為已婚狀態，無法申請結婚。
				ScriptMessage( Couple1, Couple1, 0, "[SC_MARRY_28]" , C_SYSTEM )	--訊息欄
				ScriptMessage( Couple2, Couple2, 2, "[SC_MARRY_28]" , C_SYSTEM )	--畫面中間訊息  雙方或其中之一為已婚狀態，無法申請結婚。
				ScriptMessage( Couple2, Couple2, 0, "[SC_MARRY_28]" , C_SYSTEM )	--訊息欄
			elseif Relation == -1 and Relation2 == -1 then 	--雙方沒有任何關係
			--可結婚
				BeginPlot(OwnerID(), "Marry_Check_step2" , 0)
			else
			--不可結婚 訊息
				ScriptMessage(  Couple1,  Couple1, 2, "[SC_MARRY_40]" , C_SYSTEM )	--畫面中間訊息  雙方或其中之一已有其它關係，無法申請結婚。
				ScriptMessage(  Couple1,  Couple1, 0, "[SC_MARRY_40]" , C_SYSTEM )	--訊息欄
				ScriptMessage(  Couple2,  Couple2, 2, "[SC_MARRY_40]" , C_SYSTEM )	--畫面中間訊息  雙方或其中之一已有其它關係，無法申請結婚。
				ScriptMessage(  Couple2,  Couple2, 0, "[SC_MARRY_40]" , C_SYSTEM )	--訊息欄
			end
		else
			ScriptMessage( Couple1, Couple1 , 2, "[SC_MARRY_42]" , C_SYSTEM )	--畫面中間訊息   新郎與新娘必須在我的附近，才能辦理結婚申請。
			ScriptMessage( Couple1, Couple1 , 0, "[SC_MARRY_42]" , C_SYSTEM )	--訊息欄
			ScriptMessage( Couple2, Couple2 , 2, "[SC_MARRY_42]" , C_SYSTEM )	--畫面中間訊息   新郎與新娘必須在我的附近，才能辦理結婚申請。
			ScriptMessage( Couple2, Couple2 , 0, "[SC_MARRY_42]" , C_SYSTEM )	--訊息欄
		end
	elseif ( PartyNum >= 3 ) then
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_MARRY_4]" , C_SYSTEM )	--畫面中間訊息  你的隊伍人數太多，請只跟你心儀的對象組成兩人小隊，再來找我申請。
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_MARRY_4]" , C_SYSTEM )	--訊息欄
	end
end