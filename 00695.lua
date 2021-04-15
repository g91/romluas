--700695_婚姻管理員1_同性  (可同性結婚, 也可異性 ) --玫麗 

function LuaI_111274()  --商店設定 掛在任務Npc物件產生劇情
	local NPC = OwnerID()
	SetMinimapIcon( NPC, EM_MapIconType_Shop )
	SetShop( NPC , 600120 , "Test_Shop_Close" )
end

function Marry_Shop() --購買婚姻相關物品
	CloseSpeak( OwnerID() )	-- 關閉對話視窗
	OpenShop()
end

function LuaS_111274() -- npc初始劇情
	local Player = OwnerID()
	local NPC = TargetID()
	local Couple1 = GetPartyID( Player , 1 )
	local Couple2 = GetPartyID( Player , 2 )
	local apply_Key = 541320  --已申請結婚的keyitem
	local NPCID = { 115002 ,111274 }  -- 1 同性不可結婚  2. 同性可結婚
	local NPCOrgID = ReadRoleValue(NPC, EM_RoleValue_OrgID ) -- NPC ID

	local IamH = Check_Relation( Couple1 , EM_RelationType_Husband )  --1P是老公
	local IamW = Check_Relation( Couple1, EM_RelationType_Wife )  --1P是老婆
	local UareH = Check_Relation( Couple2 , EM_RelationType_Husband )  --2P是老公
	local UareW = Check_Relation( Couple2 , EM_RelationType_Wife  )  --2P是老婆

	BeginPlot( NPC , "lua_mika_merrynpc_range" , 0 )  --檢查NPC與玩家的距離

	if CheckBuff(Player, 623790 ) == True then  -- 有私人會場租借buff
		local ChoosedSN = ReadRoleValue(Player, EM_LuaValueFlag_UseItem43)
		SetSpeakDetail(Player, "[SC_2012MARRY_TRANSNPC02]")   -- 再次進入會場？
		AddSpeakOption(Player,Player,"[SC_GETTITLE_1]","Lua_Mika_weddingtrans_room6("..ChoosedSN..")", 0)  -- 確定
	else
		LoadQuestOption(Player)
		AddSpeakOption( Player, Player,"[SC_RELATION_INTRO_01]" , "lua_mika_relationintro_01" , 0 )  --關係系統介紹
		if CheckFlag( Player , apply_Key ) == true then  --有已申請結婚的keyitem
			AddSpeakOption( Player,  Player,"[SC_2012MARRY_TRANSNPC14]" , "lua_mika_weddingtrans_NPC1" , 0 )  --婚禮會場申請
			AddSpeakOption( Player, Player,"[SC_MARRY_GIVEUP1]" , "lua_mika_merrygiveup" , 0 )  --我想放棄婚姻申請
		else
			if (IamH ==  false  and UareW  == false) or (IamW  == false and UareH == false ) then  --雙方都沒有結婚
				if NPCOrgID == NPCID[1] then -- 同性不可結婚
				--	say(Player, "same sex - no")
					AddSpeakOption( Player, Player, GetString("SC_MARRY_1") , "Marry_Check_1" , 0 )	--我想要結婚
				elseif NPCOrgID == NPCID[2] then -- 同性可結婚
				--	say(Player, "same sex - ok ")
					AddSpeakOption( Player, Player, GetString("SC_MARRY_1") , "Marry_Check_2" , 0 )	--我想要結婚
				end
			end
		end
		AddSpeakOption( Player, Player, GetString("SC_MARRY_20") , "Marry_Shop" , 0 )		--購買婚姻相關物品
	end
end


function Marry_Check_1()  --申請結婚 (同性不可結婚)
	local Player = OwnerID()
--	Say(Player, "check1")
	CloseSpeak(Player)-- 關閉對話視窗
	if Marry_Apply_Check_1(player) == true then  -- 檢查婚禮會場申請條件 -異性結婚版 (只允許異性)
--		Say(Player, "check1 ok")
		BeginPlot(Player, "Marry_Check_step2" , 0)
	end
end

function Marry_Check_2()  --申請結婚 (同性可結婚)
	local Player = OwnerID()
--	Say(Player, "check2")
	CloseSpeak(Player)-- 關閉對話視窗
	if Marry_Apply_Check_2(player) == true then  -- 檢查婚禮會場申請條件 -同性結婚
--		Say(Player, "check2 ok")
		BeginPlot(Player, "Marry_Check_step2" , 0)
	end
end


function Marry_Check_step2()
	local Player = OwnerID()
	local Couple1 = GetPartyID( Player , 1 )
	local Couple2 = GetPartyID( Player , 2 )
	local P1LV = ReadRoleValue( Couple1, EM_RoleValue_LV)
	local P2LV = ReadRoleValue( Couple2, EM_RoleValue_LV)
	local P1Sex = ReadRoleValue(Couple1, EM_RoleValue_SEX)
	local P2Sex = ReadRoleValue(Couple2, EM_RoleValue_SEX)

	local P1_mallring1 = CountBodyItem( Couple1 , 202543 )  --商城男生ring
	local P1_mallring2 = CountBodyItem( Couple1 , 202544 )  --商城女生ring
	local P1_shopring1 = CountBodyItem( Couple1 , 202817 )  --遊戲男生ring
	local P1_shopring2 = CountBodyItem( Couple1 , 202818 )  --遊戲女生ring
------------- 第二個角色的 -----------------------------------------------------------------
	local P2_mallring1 = CountBodyItem( Couple2 , 202543 )  --商城男生ring
	local P2_mallring2 = CountBodyItem( Couple2 , 202544 )  --商城女生ring
	local P2_shopring1 = CountBodyItem( Couple2 , 202817 )  --遊戲男生ring
	local P2_shopring2 = CountBodyItem( Couple2 , 202818 )  --遊戲女生ring

	if CheckFlag( Couple1 , 541320 ) == true and CheckFlag( Couple2, 541320 ) == true then
		ScriptMessage( Couple1, Couple1, 2, "[SC_MARRY_11]" , C_SYSTEM )	--畫面中間訊息  婚禮已經申請完成，請前往結婚會場找證婚牧師開始你們的婚禮
		ScriptMessage( Couple1, Couple1, 0, "[SC_MARRY_11]" , C_SYSTEM )	
		ScriptMessage( Couple2, Couple2, 2, "[SC_MARRY_11]" , C_SYSTEM )	
		ScriptMessage( Couple2, Couple2, 0, "[SC_MARRY_11]" , C_SYSTEM )	
		Sleep(10)
		ScriptMessage( Couple1, Couple1, 2, "[SC_MARRY_37]" , C_SYSTEM )	--畫面中間訊息  請記得邀請你們的親朋好友組隊一同前往前往結婚會場為你們祝福。
		ScriptMessage( Couple1, Couple1, 0, "[SC_MARRY_37]" , C_SYSTEM )	
		ScriptMessage( Couple2, Couple2, 2, "[SC_MARRY_37]" , C_SYSTEM )	
		ScriptMessage( Couple2, Couple2, 0, "[SC_MARRY_37]" , C_SYSTEM )	
	elseif CheckFlag( Couple1 , 541320 ) == TRUE and CheckFlag( Couple2 , 541320 ) == FALSE then --1p 有申請過 2p沒
		ScriptMessage( Couple1, Couple1, 2, "[SC_MARRY_44]" , 0 )	--畫面中間訊息  雙方或其中之一已辦理過結婚申請。
		ScriptMessage( Couple1, Couple1, 0, "[SC_MARRY_44]" , 0 )	
		ScriptMessage( Couple2, Couple2, 2, "[SC_MARRY_44]" , 0 )	
		ScriptMessage( Couple2, Couple2, 0, "[SC_MARRY_44]" , 0 )
		Sleep(10)
		ScriptMessage( Couple1, Couple1, 2, "[SC_MARRY_45]" , 0 )	--畫面中間訊息  雙方若要重新辦理結婚申請，已辦理過結婚申請的一方先進行放棄結婚申請。
		ScriptMessage( Couple1, Couple1, 0, "[SC_MARRY_45]" , 0 )	
		ScriptMessage( Couple2, Couple2, 2, "[SC_MARRY_45]" , 0 )	
		ScriptMessage( Couple2, Couple2, 0, "[SC_MARRY_45]" , 0 )	
	elseif CheckFlag( Couple1 , 541320 ) == FALSE and CheckFlag( Couple2 , 541320 ) == TRUE then --1P沒申請過 2P有
		ScriptMessage( Couple1, Couple1, 2, "[SC_MARRY_44]" , 0 )	--畫面中間訊息  雙方或其中之一已辦理過結婚申請。
		ScriptMessage( Couple1, Couple1, 0, "[SC_MARRY_44]" , 0 )	
		ScriptMessage( Couple2, Couple2, 2, "[SC_MARRY_44]" , 0 )	
		ScriptMessage( Couple2, Couple2, 0, "[SC_MARRY_44]" , 0 )	
		Sleep(10)
		ScriptMessage( Couple1, Couple1, 2, "[SC_MARRY_45]" , 0 )	--畫面中間訊息  雙方若要重新辦理結婚申請，已辦理過結婚申請的一方先進行放棄結婚申請。
		ScriptMessage( Couple1, Couple1, 0, "[SC_MARRY_45]" , 0 )	
		ScriptMessage( Couple2, Couple2, 2, "[SC_MARRY_45]" , 0 )	
		ScriptMessage( Couple2, Couple2, 0, "[SC_MARRY_45]" , 0 )	
	else
		--加上規則- 
		--提出組隊的人需為男方，接受組隊找需為女方。
		--男方需持有男性婚戒其中一種(商城或遊戲內)，女方需持有女性婚戒其中一種(商城或遊戲內)
		if P1_mallring1 == 0 and  P1_shopring1 == 0 then
			--p1沒有戒指
			ScriptMessage( Couple1, Couple1, 2, "[SC_RELATION_PARTY02]" , 0 )	--畫面中間訊息   請確認提出組隊者是否持有[202817]或[202543]，
			ScriptMessage( Couple1, Couple1, 0, "[SC_RELATION_PARTY02]" , 0 )	
			ScriptMessage( Couple2, Couple2, 2, "[SC_RELATION_PARTY02]" , 0 )	
			ScriptMessage( Couple2, Couple2, 0, "[SC_RELATION_PARTY02]" , 0 )	
			Sleep(10)
			ScriptMessage( Couple1, Couple1, 2, "[SC_RELATION_PARTY02_2]" , 0 )	--畫面中間訊息   接受組隊者是否持有[202818]或[202544]。
			ScriptMessage( Couple1, Couple1, 0, "[SC_RELATION_PARTY02_2]" , 0 )	--訊息欄
			ScriptMessage( Couple2, Couple2, 2, "[SC_RELATION_PARTY02_2]" , 0 )	--畫面中間訊息   接受組隊者是否持有[202818]或[202544]。
			ScriptMessage( Couple2, Couple2, 0, "[SC_RELATION_PARTY02_2]" , 0 )	
		else 
			if P1_mallring1 > 0 then  --有商城戒指
				if P2_mallring2 == 0  then
				--p2沒有商城戒指
					ScriptMessage( Couple1, Couple1, 2, "[SC_RELATION_PARTY04]" , 0 )	--畫面中間訊息   接受組隊者未持有[202544]，無法進行結婚申請或婚禮。
					ScriptMessage( Couple1, Couple1, 0, "[SC_RELATION_PARTY04]" , 0 )	--訊息欄
					ScriptMessage( Couple2, Couple2, 2, "[SC_RELATION_PARTY04]" , 0 )	--畫面中間訊息   接受組隊者未持有[202544]，無法進行結婚申請或婚禮。
					ScriptMessage( Couple2, Couple2, 0, "[SC_RELATION_PARTY04]" , 0 )	--訊息欄
				elseif  P2_mallring2 > 0 then
					ScriptMessage( Couple1, Couple1, 2, "[SC_MARRY_11]" , C_SYSTEM )	--畫面中間訊息  婚禮已經申請完成，請前往結婚會場找證婚牧師開始你們的婚禮
					ScriptMessage( Couple1, Couple1, 0, "[SC_MARRY_11]" , C_SYSTEM )	
					ScriptMessage( Couple2, Couple2, 2, "[SC_MARRY_11]" , C_SYSTEM )
					ScriptMessage( Couple2, Couple2, 0, "[SC_MARRY_11]" , C_SYSTEM )	
					Sleep(10)
					ScriptMessage( Couple1, Couple1, 2, "[SC_MARRY_37]" , C_SYSTEM )	--畫面中間訊息  請記得邀請你們的親朋好友組隊一同前往前往結婚會場為你們祝福。
					ScriptMessage( Couple1, Couple1, 0, "[SC_MARRY_37]" , C_SYSTEM )
					ScriptMessage( Couple2, Couple2, 2, "[SC_MARRY_37]" , C_SYSTEM )
					ScriptMessage( Couple2, Couple2, 0, "[SC_MARRY_37]" , C_SYSTEM )
					SetFlag( Couple1 , 541320 , 1 )
					SetFlag( Couple2 , 541320 , 1 )
				end
			elseif  P1_shopring1 > 0 then  --有一般戒指
				if P2_shopring2 == 0  then
					ScriptMessage( Couple1, Couple1, 2, "[SC_RELATION_PARTY03]" , 0 )	--畫面中間訊息   接受組隊者未持有[202818]，無法進行結婚申請或婚禮。
					ScriptMessage( Couple1, Couple1, 0, "[SC_RELATION_PARTY03]" , 0 )	
					ScriptMessage( Couple2, Couple2, 2, "[SC_RELATION_PARTY03]" , 0 )	
					ScriptMessage( Couple2, Couple2, 0, "[SC_RELATION_PARTY03]" , 0 )	
				elseif  P2_shopring2  > 0 then
					ScriptMessage( Couple1, Couple1, 2, "[SC_MARRY_11]" , C_SYSTEM )	--畫面中間訊息  婚禮已經申請完成，請前往結婚會場找證婚牧師開始你們的婚禮
					ScriptMessage( Couple1, Couple1, 0, "[SC_MARRY_11]" , C_SYSTEM )
					ScriptMessage( Couple2, Couple2, 2, "[SC_MARRY_11]" , C_SYSTEM )	
					ScriptMessage( Couple2, Couple2, 0, "[SC_MARRY_11]" , C_SYSTEM )	
					Sleep(10)
					ScriptMessage( Couple1, Couple1, 2, "[SC_MARRY_37]" , C_SYSTEM )	--畫面中間訊息  請記得邀請你們的親朋好友組隊一同前往前往結婚會場為你們祝福。
					ScriptMessage( Couple1, Couple1, 0, "[SC_MARRY_37]" , C_SYSTEM )	
					ScriptMessage( Couple2, Couple2, 2, "[SC_MARRY_37]" , C_SYSTEM )	
					ScriptMessage( Couple2, Couple2, 0, "[SC_MARRY_37]" , C_SYSTEM )	
					SetFlag( Couple1 , 541320 , 1 )
					SetFlag( Couple2 , 541320 , 1 )
				end
			end
		end
	end
end

function lua_mika_merrygiveup() --我想放棄婚姻申請
	SetSpeakDetail( OwnerID(), "[SC_MARRY_GIVEUP2]" )--你確定要放棄婚姻申請嗎？
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GETTITLE_1]" , "lua_mika_merrygiveup2", 0 ) --確定
end

function lua_mika_merrygiveup2() --確定-放棄婚姻申請
	local Player = OwnerID()
	CloseSpeak( Player )		-- 關閉對話視窗
	SetFlag( Player , 541320 , 0 ) --放棄婚姻申請

	WriteRoleValue(Player, EM_LuaValueFlag_UseItem43, 0 )
	local SN = ReadRoleValue(Player, EM_LuaValueFlag_UseItem43 )
	if CheckBuff(Player, 623790 ) == true then
		CancelBuff(Player, 623790 )
	end
	ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_MARRY_GIVEUP4]" , C_SYSTEM )	--畫面中間訊息  你已放棄婚姻申請。
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_MARRY_GIVEUP4]" , C_SYSTEM )	--訊息欄
end

function lua_mika_merryzonego() --前往結婚會場
	local PlayerTeam = LuaFunc_PartyData( OwnerID() )           --判斷OwnerID() 的所有組隊成員的資料(排除不在同地區者但未排除死亡者)， PlayerTeam[0] 第一筆資料為成員人數、第二筆以後為成員資料。
	for i = 1 , PlayerTeam[0] do
		CloseSpeak(PlayerTeam[i])
		BeginPlot( PlayerTeam[i] , "lua_mika_merryzonego2" , 0 )  
	end
end

function lua_mika_merryzonego2()
	local Player = OwnerID()
	if CheckBuff( OwnerID() , 501570) == false then  --增加檢查判斷
		DialogCreate( OwnerID() , EM_LuaDialogType_YesNo ,"[SC_MARRY_35]") --是否確定進入結婚會場？
		DialogSelectStr( OwnerID() , "[SC_GETTITLE_1]" );
		DialogSelectStr( OwnerID() , "[SC_CANCEL]" );
		AddBuff(OwnerID() , 501570,0,-1);--然後給予BUFF

		if( DialogSendOpen( Player ) == false ) then 
			ScriptMessage( Player , Player , 1 , GetString("SYS_FIXEQ_DATA_ERROR") , 0 )	--資料送出有問題
			return 0
		end

		local n = 0
		local DialogResult = ""
		while true do
			Sleep( 10 )
			local DialogStatus = DialogGetResult( Player )
			n = n + 1
		--	Say(OwnerID(), n)
			if n >= 10 then -- 防無窮迴圈，10sec
				--ScriptMessage( Player , Player , 0, "Infinity Loop", 0 )
				DialogClose( Player )
				CancelBuff( OwnerID(), 501570 );--最後清除BUFF

				break
			else
				--ScriptMessage( Player , Player , 0, "OK", 0 )
			end

			if ( DialogStatus >-2 ) then
				if ( DialogStatus == 0 ) then
					DialogResult = "Yes"
					Beginplot( OwnerID() ,"lua_mika_merryzonego3", 0 )
					DialogClose( Player )
					CancelBuff( OwnerID(), 501570 );--最後清除BUFF
					break
				elseif ( DialogStatus == 1 ) or ( DialogStatus ==-1 ) then
					DialogResult = "No"
					DialogClose( Player )
					CancelBuff( OwnerID(), 501570 );--最後清除BUFF
					break
				else
					DialogResult = "Etc"
				end
			end
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	end
end


function lua_mika_merryzonego3()
	ChangeZone( OwnerID(), 303 , 0 , 2681.7, 1.9 , 1432.9, 89.6)    --ChangeZone( OwnerID(), ZoneID 區域ID , 第幾層 0 為第0層 -1代表只跑副本規則 , x, y, z, Dir)  
	local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					--取得玩家等級
	local PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				--取得玩家副職等級
	DesignLog(OwnerID(),303," last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)	--紀錄進入人次
end

function lua_mika_merryzonecheck() --入口隱形物件
	While true do
	--	say(OwnerID(), "check")
		SetPlot( OwnerID(), "range", "lua_mika_merryzonecheck2", 300 )  
		Sleep(50)
	end
end

function lua_mika_merryzonecheck2() 
--	Say(OwnerID(), "OwnerID") --player
--	Say(TargetID(), "TargetID")  --box
	if CheckBuff(OwnerID(), 501770) == false then
		AddBuff( OwnerID() , 501770 , 0 , -1 )
--		ClockOpen( OwnerID() ,EM_ClockCheckValue_3, 5400 ,5400,0,"Lua_Clockending","lua_mika_merry_timeup") --倒數計時器  (後面的兩個呼叫函式： "換區消失"，"時間到時呼叫函式")
		ScriptMessage( OwnerID() , OwnerID(), 2 , "[SC_MARRY_WELCOME01]" , C_SYSTEM )	--歡迎來到結婚會場！
		ScriptMessage( OwnerID() , OwnerID(), 0 , "[SC_MARRY_WELCOME01]"  , C_SYSTEM )
		Sleep(20)
		ScriptMessage( OwnerID() , OwnerID(), 2 , "[SC_MARRY_WELCOME02]" , C_SYSTEM )	--若新人雙方已準備好，請到紅毯前方與證婚牧師對話開啟婚禮吧！
		ScriptMessage( OwnerID() , OwnerID(), 0 , "[SC_MARRY_WELCOME02]"  , C_SYSTEM )
	end
end