
--==================================================--
-- 墓園												--
--==================================================--
--==================================================--
--  全域變數區                                      --
--==================================================--

function Lua_Zone19_PE01_GlobalSet()	
	Zone19_PE01_Obj = {}							-- 使用物件管理陣列
	Zone19_PE01_NPC = {}							-- 使用物件管理陣列
	Zone19_PE01_LinkList = {}						-- 靈魂鍊結
	Zone19_PE01_Var = {}							-- 使用參數管理陣列	
	Zone19_PE01_Phase = 0							-- 階段標籤
	Zone19_PE01_PEIndex = 1901
							
	Zone19_PE01_Var["ResetTime"] = 3600				-- 公眾任務重置時間(秒)	1小時	
	Zone19_PE01_Var["MapID"] = 515					-- 公眾事件分區編號		克魯瑪墓園(926)
	Zone19_PE01_Var["TestID"] = 1					-- 公眾事件測試區編號
	Zone19_PE01_Var["RoomID"] = 0	
		
	Zone19_PE01_Var["ControllerID"] = 115053		-- PE控制物件GID
	Zone19_PE01_Var["CreaterID"] = 115506			-- 生產控制物件GID	
	Zone19_PE01_Var["Controller"] = 0				-- PE控制物件
	Zone19_PE01_Var["Creater"] = 0					-- 生產物件
	Zone19_PE01_Var["FlagID"] = 780656				-- 旗標ID
	Zone19_PE01_Var["MstFlagID"] = 780657			-- 旗標ID
	Zone19_PE01_Var["BossFlagID"] = 780657			-- BOSS用旗標
	
	Zone19_PE01_Var["GiveItem"] = {	[1] = 208434;	--火把
									[2] = 208433	--藥劑
									}
		
	Zone19_PE01_Var["NPCID"] = {	116808,		-- 隊長
									116809, 	-- 隊員
									116810,		-- 隊員
									116811, 	-- 隊員
									116812		-- 隊員
									}
	
	Zone19_PE01_Var["MstID"] = 104859			-- 墓園腐屍(強化版)
	Zone19_PE01_Var["DeathID"] = 116813			-- 屍體
	Zone19_PE01_Var["BladeID"] = 116815			-- 深淵之刃
	Zone19_PE01_Var["BossID"] = 104852			-- BOSS
	Zone19_PE01_Var["Boss"] = 0					-- BOSS
										
	Zone19_PE01_Var["TimeSpace"] = 20			-- 計時間隔(秒)
	Zone19_PE01_Var["NPCDead"] = 0				-- NPC死亡數量
	Zone19_PE01_Var["MaxMst"] = 5				-- Mst最大數量
	Zone19_PE01_Var["TimeCreateMst"] = 3		-- 每次出場數量
	
	Zone19_PE01_Var["PH2Require"] = 10			--第二階段燒屍體數量
	Zone19_PE01_Var["PH4Kill"] = 25				--第四階段打精英數量
	Zone19_PE01_Var["PH6Time"]	= 180			--打六階段打王時間
	
	Zone19_PE01_Var["Bonus"] = { 5, 10, 15, 200 }	-- 分數
	
	Zone19_PE01_Var["ExCha_Ratio"] = 100			-- 回饋比率
	Zone19_PE01_Var["MaxBonus"] = 1400				-- 最大分數

	Zone19_PE01_NPC_Message = {	[10] = "[SC_PE_ZONE19_01_NPCSAY_05]";--為了保護其他人，請原諒我們...
								[20] = "[SC_PE_ZONE19_01_NPCSAY_06]";--我還是不敢相信他們也曾經是正常人。
								[30] = "[SC_PE_ZONE19_01_NPCSAY_07]";--我們是否也會向他們一樣?
								[40] = "[SC_PE_ZONE19_01_NPCSAY_08]";--這裡的慘狀實在讓人不勝唏噓。
								[50] = "[SC_PE_ZONE19_01_NPCSAY_09]";--這些感染者似乎已經沒有神智...
							}	
end

--==================================================--



--==================================================--
--  公眾事件設定區                                  --
--==================================================--
function Lua_Zone19_PE01_PESet()

	local PE_Name = "SC_PE_ZONE19_01_NAME"					-- 無盡的夜晚
	local PE_Desc = "SC_PE_ZONE19_01_DESC"					-- 湖畔墓園內除了遊走的腐屍外還有些不尋常的事情發生。
	local PEIndex = Zone19_PE01_PEIndex	
	PE_AddPE( PE_Name, PE_Desc, PEIndex , 0 ) 	-- 新增一個事件

	local MapID = Zone19_PE01_Var["MapID"]
	local TestID = Zone19_PE01_Var["TestID"]
	PE_AddRegion( PEIndex , MapID )							-- 把PE放進實際分區
	PE_AddRegion( PEIndex , TestID )						-- 把PE放進測試區
	
	local PH0Index = 100	--階段變數
	local PH1Index = 101	
	local PH2Index = 102
	local PH3Index = 103
	local PH4Index = 104
	local PH5Index = 105
	local PH6Index = 106
	local PH7Index = 107
	
	local PH0_Name = "SC_PE_ZONE16_DW_22" --重置時間
	local PH1_Name = "SC_PE_ZONE19_01_PHNAME01"	-- 不明的身影
	local PH2_Name = "SC_PE_ZONE19_01_PHNAME02"	-- 慘痛的決定
	local PH3_Name = "SC_PE_ZONE19_01_PHNAME03"	-- 瘟疫的起源
	local PH4_Name = "SC_PE_ZONE19_01_PHNAME04"	-- 抵擋來襲
	local PH5_Name = "SC_PE_ZONE19_01_PHNAME05"	-- 無法放下的執念
	local PH6_Name = "SC_PE_ZONE19_01_PHNAME06"	-- 救贖
	local PH7_Name = "SC_PE_ZONE19_01_PHNAME07"	-- 清醒之時
	
	local PH0_Desc = ""
	local PH1_Desc = "SC_PE_ZONE19_01_PH1_DESC"	-- 出現在墓園的不明身影在訴說些什麼...
	local PH2_Desc = "SC_PE_ZONE19_01_PH2_DESC"	-- 雖然不得已，但也只能將感染者的屍體用火淨化。
	local PH3_Desc = "SC_PE_ZONE19_01_PH3_DESC"	-- 不明的疾病發生在調查團身上。
	local PH4_Desc = "SC_PE_ZONE19_01_PH4_DESC"	-- 困守其中，也只能奮力抵檔...
	local PH5_Desc = "SC_PE_ZONE19_01_PH5_DESC"	-- 背負太多無法放下的事物...
	local PH6_Desc = "SC_PE_ZONE19_01_PH6_DESC"	-- 染了太多的鮮血並失去了許多同伴，即使死亡也無法安息...
	local PH7_Desc = "SC_PE_ZONE19_01_PH7_DESC"	-- 最後的遺願

	PE_AddPhase( PEIndex , PH0Index , PH0_Name , PH0_Desc , 0 , 0 , 0 , 0 )	-- 倒數
	PE_AddPhase( PEIndex , PH1Index , PH1_Name , PH1_Desc , 0 , 0 , 0 , 0 )	-- 看戲
	PE_AddPhase( PEIndex , PH2Index , PH2_Name , PH2_Desc , 0 , 1 , 0 , 0 )	-- 燒屍體
	PE_AddPhase( PEIndex , PH3Index , PH3_Name , PH3_Desc , 0 , 1 , 0 , 0 )	-- 跑路
	PE_AddPhase( PEIndex , PH4Index , PH4_Name , PH4_Desc , 0 , 1 , 0 , 0 )	-- 打殭屍
	PE_AddPhase( PEIndex , PH5Index , PH5_Name , PH5_Desc , 0 , 1 , 0 , 0 )	-- 看戲
	PE_AddPhase( PEIndex , PH6Index , PH6_Name , PH6_Desc , 0 , 0 , 0 , 0 )	-- 打BOSS
	PE_AddPhase( PEIndex , PH7Index , PH7_Name , PH7_Desc , 0 , 0 , 0 , 0 )	-- 看戲

	local OB0Index = 1000
	local OB1Index = 1001
	local OB2Index = 1002
	local OB3Index = 1003
	local OB4Index = 1004
	local OB5Index = 1005
	local OB6Index = 1006
	local OB7Index = 1007
	
	local OB8Index = 1008
	local OB9Index = 1009
	
	local OB0_Name = "SC_PE_ZONE16_DW_21" --剩餘時間
	local OB1_Name = "SC_PE_ZONE19_01_OBNAME01"	-- 為了大義
	local OB2_Name = "SC_PE_ZONE19_01_OBNAME02"	-- 焚燒屍體
	local OB3_Name = "SC_PE_ZONE19_01_OBNAME03"	-- 調查
	local OB4_Name = "SC_PE_ZONE19_01_OBNAME04"	-- 抵擋感染者來襲
	local OB5_Name = "SC_PE_ZONE19_01_OBNAME05"	-- 訴不盡的遺憾
	local OB6_Name = "SC_PE_ZONE19_01_OBNAME06"	-- 救贖迷失的亡魂
	local OB7_Name = "SC_PE_ZONE19_01_OBNAME07"	-- 遺願
	
	local OB8_Name = "SC_PE_ZONE19_01_OBNAME08"	-- [116808]的死亡
	local OB9_Name = "SC_PE_ZONE16_DW_21"	--剩餘時間
	
	local OB0_Desc = ""
	local OB1_Desc = "" 
	local OB2_Desc = "SC_PE_ZONE19_01_OB2_DESC" --協助調查團的行動，並使用[208434]焚燒感染者的屍體。
	local OB3_Desc = "SC_PE_ZONE19_01_OB3_DESC" --協助調查團的行動，並使用[208433]治療受感染的調查者。
	local OB4_Desc = "SC_PE_ZONE19_01_OB4_DESC" --協助調查團抵擋來襲。	
	local OB5_Desc = ""
	local OB6_Desc = "SC_PE_ZONE19_01_OB6_DESC" --在有限的時間內救贖迷失的亡魂
	local OB7_Desc = ""
	local OB8_Desc = ""
	local OB9_Desc = ""

	local PH2Require = Zone19_PE01_Var["PH2Require"]
	local PH4Kill = Zone19_PE01_Var["PH4Kill"]
	local PH6Time = Zone19_PE01_Var["PH6Time"]
	
	-- PE重置倒數
	PE_PH_AddObjective_TimeLimit( PEIndex , PH0Index , OB0Index , OB0_Name , OB0_Desc , "Zone19_PE01_PH0_Time" , Zone19_PE01_Var["ResetTime"]*1000 , 0 ,  true )
	
	-- 階段1成功條件:看戲
	PE_PH_AddObjective_Equal( PEIndex , PH1Index , OB1Index , OB1_Name , OB1_Desc , "Zone19_PE01_Var_PH1Require" , 0 , 1 ,  true )
	
	-- 階段2成功條件：燒屍體
	PE_PH_AddObjective_EqualAndGreater( PEIndex , PH2Index , OB2Index , OB2_Name , OB2_Desc , "Zone19_PE01_Var_PH2Require" , 0 , PH2Require,  true )
	
	-- 階段3成功條件：跑路
	PE_PH_AddObjective_Equal( PEIndex , PH3Index , OB3Index , OB3_Name , OB3_Desc , "Zone19_PE01_Var_PH3Require" , 0 , 3,  true )	
	
	-- 階段4成功條件：打殭屍
	PE_PH_AddObjective_EqualAndGreater( PEIndex , PH4Index , OB4Index , OB4_Name , OB4_Desc , "Zone19_PE01_Var_PH4Kill" , 0 , PH4Kill,  true )
	
	-- 階段5成功條件：看戲
	PE_PH_AddObjective_Equal( PEIndex , PH5Index , OB5Index , OB5_Name , OB5_Desc , "Zone19_PE01_Var_PH5Require" , 0 , 1 ,  true )
	
	-- 階段6成功條件：BOSS死亡
	PE_PH_AddObjective_Equal( PEIndex , PH6Index , OB6Index , OB6_Name , OB6_Desc , "Zone19_PE01_Var_BossDead" , 0 , 1,  true )
	
	-- 階段7成功條件：看戲
	PE_PH_AddObjective_Equal( PEIndex , PH7Index , OB7Index , OB7_Name , OB7_Desc , "Zone19_PE01_Var_PH7Require" , 0 , 1,  true )
	
	-- 階段2,3,4失敗條件：調查團掛點
	PE_PH_AddObjective_EqualAndGreater( PEIndex , PH2Index , OB8Index , OB8_Name , OB8_Desc , "Zone19_PE01_Var_NPCDead" , 0 , 1,  false )
	PE_PH_AddObjective_EqualAndGreater( PEIndex , PH3Index , OB8Index , OB8_Name , OB8_Desc , "Zone19_PE01_Var_NPCDead" , 0 , 1,  false )	
	PE_PH_AddObjective_EqualAndGreater( PEIndex , PH4Index , OB8Index , OB8_Name , OB8_Desc , "Zone19_PE01_Var_NPCDead" , 0 , 1,  false )	
	
	-- 階段6失敗條件：時間到
	PE_PH_AddObjective_TimeLimit( PEIndex , PH6Index , OB9Index , OB9_Name , OB9_Desc , "Zone19_PE01_PH6_Time" , PH6Time*1000 , 0 ,  false )

	-- 設定階段連接
	PE_PH_SetNextPhase( PEIndex , PH0Index , PH1Index )
	PE_PH_SetNextPhase( PEIndex , PH1Index , PH2Index )
	PE_PH_SetNextPhase( PEIndex , PH2Index , PH3Index )
	PE_PH_SetNextPhase( PEIndex , PH3Index , PH4Index )
	PE_PH_SetNextPhase( PEIndex , PH4Index , PH5Index )
	PE_PH_SetNextPhase( PEIndex , PH5Index , PH6Index )
	PE_PH_SetNextPhase( PEIndex , PH6Index , PH7Index )
		
	-- 設定目標達成的回摳函式
	PE_OB_SetCallBackOnAchieve( PEIndex , "Lua_Zone19_PE01_OB_OnAchieve" )
	
	-- 設定事件結束的結算回摳函式
	PE_SetCallBackOnBalance( PEIndex , "Lua_Zone19_PE01_FinalExchange" )

	-- 事件啟動
	PE_Start( PEIndex , PH0Index )

end

function Lua_Zone19_PE01_OB_OnAchieve( PEIndex, PHIndex , OBIndex )
	local Controller = Zone19_PE01_Var["Controller"]	-- 控制物件
	local Creater = Zone19_PE01_Var["Creater"]			-- 控制物件

	if PHIndex == 100 and OBIndex == 1000 then 		-- 進入第一階段	
		BeginPlot( Controller, "Lua_Zone19_PE01_NPC_ACT1", 0 )
	elseif PHIndex == 103 and OBIndex == 1003 then	-- 進入第四階段
		BeginPlot( Creater, "Lua_Zone19_PE01_CreateMst", 0 )		
	elseif PHIndex == 104 and OBIndex == 1004 then	-- 進入第五階段
		BeginPlot( Controller, "Lua_Zone19_PE01_NPC_ACT2", 0 )
	elseif PHIndex == 105 and OBIndex == 1005 then	-- 進入第六階段	
		BeginPlot( Controller, "Lua_Zone19_PE01_CreateBoss", 0 )		--產生Boss
	elseif PHIndex == 106 and OBIndex == 1006 then	-- 進入第七階段
		BeginPlot( Controller, "Lua_Zone19_PE01_NPC_ACT3", 0 )
	end
	
	CallPlot( Controller, "Lua_Zone19_PE01_Message", OBIndex%1000+1, PEIndex )
	if OBIndex >= 1007 then
		CallPlot( Controller , "Lua_Zone19_PE01_Init" , 1 )-- 重置公眾任務
	end
end

function Lua_Zone19_PE01_FinalExchange( PEIndex , GUID , Score )
	local item = Zone19_PE01_Var["GiveItem"]
	for i=1, table.getn(item) do
		if CountItem( GUID, item[i] ) == 1 then
			DelBodyItem( GUID, item[i], 1 )
		end
	end

	local LV = 60
	local MapID = ZONE19_PE01_Var["MapID"]
	if LuaPE_KS_CheckLv( GUID, LV, MapID ) == false then return end

	local ExCha_Ratio = Zone19_PE01_Var["ExCha_Ratio"]
	local MaxBonus = Zone19_PE01_Var["MaxBonus"]
	
	if Score > 0 then
		if Score < ExCha_Ratio and Score > ExCha_Ratio/2 then
			CallPlot(GUID, "YOYO_GetTokenValue", 2, 1);--古代遺物"
		else
			if Score >= MaxBonus then Score = MaxBonus end			
			CallPlot(GUID, "YOYO_GetTokenValue", 2, math.floor( Score/ExCha_Ratio ));--古代遺物"
		end
	end	
end

--==================================================--

--==================================================--
--  階段/訊息處理區                                 --
--==================================================--

function Lua_Zone19_PE01_Message( Phase, PEIndex )--傳送訊息	
	local Color = "0xffffff00"	-- 強制訊息為黃色
	local OID = OwnerID()
	Zone19_PE01_Phase = Zone19_PE01_Phase + 1	
	
	local Message = {	[1] = "[SC_PE_ZONE19_01_PHASE1]";--墓園似乎又出現了許多奇怪的人影...						
						[2] = "[SC_PE_ZONE19_01_PHASE2]";--感染者的屍體必須用火淨化!!
						[3] = "[SC_PE_ZONE19_01_PHASE3]";--調查一切的源頭
						[4] = "[SC_PE_ZONE19_01_PHASE4]";--在黎明到來前必須堅守下去
						[5] = "[SC_PE_ZONE19_01_PHASE5]";--失去了所有，還剩下什麼
						[6] = "[SC_PE_ZONE19_01_PHASE6]";--能否從黑暗中脫離!?
						[7] = "[SC_PE_ZONE19_01_PHASE7]";--黎明照進了黑暗當中
						[8] = "[SC_PE_ZONE19_01_PHASE8]";--是結束還是另一個開始...
						[9] = "[SC_PE_ZONE19_01_PHASE9]";--一切如噩夢般的消失...
						[10] = "[SC_PE_ZONE19_01_PHASE10]";--終究還是被黑暗吞噬...
					}	
	
	
	debugmsg( 0,0, "Phase = "..Phase)
	if Phase == 1 then
		ScriptMessage( OID, -1 , 1 , Message[Phase] , Color )
		ScriptMessage( OID, -1 , 0 , Message[Phase] , Color )		
	else		
		local Count = PE_GetActivePlayerGUIDCount( PEIndex )
		local item = Zone19_PE01_Var["GiveItem"]
		debugmsg( 0,0, "PE_Count = "..Count )
		local GUID
			
		for i = 1 , Count do
			GUID = PE_GetActivePlayerGUID( PEIndex )
			debugmsg(0,0,"GUID = "..GUID)
			if Phase < 6 then
				for i=1, table.getn(item) do
					if CountItem( GUID, item[i] ) <= 0 and GetUseItemGUID( GUID ) ~= item[i] then
						GiveBodyItem( GUID, item[i], 1 )
					end
				end
			end
			if Phase == 5 and CheckAcceptQuest( GUID, 423761 ) == true and CheckCompleteQuest( GUID, 423761 ) ~= true and CheckFlag( GUID, 544664 ) ~= true then
				SetFlag( GUID, 544664, 1 )
			end
			ScriptMessage( OID, GUID, 1 , Message[Phase] , Color )
			ScriptMessage( OID, GUID, 0 , Message[Phase] , Color )		
		end
	end	
end

--==================================================--

--==================================================--
--  	表演區                      				--
--==================================================--

function Lua_Zone19_PE01_NPC_ACT0()
	local NPCID = Zone19_PE01_Var["NPCID"]
	local FlagID = Zone19_PE01_Var["FlagID"]
	local npc = {}
	local num = 5
	
	for i=1, num do	
		npc[i] = KS_CreateObjMode( NPCID[i], FlagID , i,  0, 1, 1 )
		MoveToFlagEnabled( npc[i], false )
		SetModeEx( npc[i] , EM_SetModeType_Fight, false )			-- 可砍殺攻擊
		SetModeEx( npc[i] , EM_SetModeType_Strikback , false )		-- 反擊		
		SetModeEx( npc[i] , EM_SetModeType_Searchenemy , false )	-- 索敵
		table.insert( Zone19_PE01_NPC , npc[i] )					-- 加入物件管理陣列
		table.insert( Zone19_PE01_Obj , npc[i] )					-- 加入物件管理陣列		
		if i ~= 1 then
			AdjustFaceDir( npc[i], npc[1], 0 ) --面向目標
			PlayMotion( npc[i], ruFUSION_ACTORSTATE_CROUCH_LOOP )		-- 蹲下
		end
	end
	
	AdjustDir( npc[1], 180 )
end

function Lua_Zone19_PE01_NPC_ACT1()
	local npc = Zone19_PE01_NPC
	local num = 5
	
	for i=1, num do
		ks_ActSetMode( npc[i] )										-- 演戲用
		if i == 1 then
			DisableQuest( npc[i],true )
		else
			PlayMotion( npc[i], ruFUSION_ACTORSTATE_CROUCH_LOOP )		-- 蹲下
		end		
	end

	PlayMotion( npc[2], ruFUSION_ACTORSTATE_EMOTE_IDLE )		-- 站立
	AdjustFaceDir( npc[2], npc[1], 0 ) --面向目標
	sleep(15)
	PlayMotion( npc[2], ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	NPCSay( npc[2], "[SC_PE_ZONE19_01_ACT1_01]" )--看來這裡也淪陷了...感染者甚至無法分辨敵我。難道我們要殺了他們嗎？
	sleep(35)
	PlayMotion( npc[1], ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
	AdjustFaceDir( npc[1], npc[2], 0 ) --面向目標
	NPCSay( npc[1], "[SC_PE_ZONE19_01_ACT1_02]" )--恐怕你所說的就要成真了，席巴。
	sleep(25)
	PlayMotion( npc[3], ruFUSION_ACTORSTATE_CROUCH_END )
	AdjustFaceDir( npc[3], npc[1], 0 ) --面向目標
	NPCSay( npc[3], "[SC_PE_ZONE19_01_ACT1_03]" )--殿下，難道您要......
	sleep(30)
	AdjustFaceDir( npc[1], npc[3], 0 ) --面向目標
	PlayMotion( npc[1],ruFUSION_ACTORSTATE_EMOTE_APPROVAL )
	NPCSay( npc[1], "[SC_PE_ZONE19_01_ACT1_04]" )--不能讓這些被感染者傷害其他的平民，若天意要我承擔這項罪名......
	sleep(35)
	PlayMotion( npc[4], ruFUSION_ACTORSTATE_CROUCH_END )
	PlayMotion( npc[5], ruFUSION_ACTORSTATE_CROUCH_END )
	AdjustFaceDir( npc[4], npc[1], 0 ) --面向目標
	AdjustFaceDir( npc[5], npc[1], 0 ) --面向目標
	NPCSay( npc[4], "[SC_PE_ZONE19_01_ACT1_05]" )--殿下...!!請準許我們為您分憂！
	NPCSay( npc[5], "[SC_PE_ZONE19_01_ACT1_05]" )--殿下...!!請準許我們為您分憂！
	sleep(30)
	PlayMotion( npc[1], ruFUSION_ACTORSTATE_EMOTE_SALUTE2 )
	NPCSay( npc[1], "[SC_PE_ZONE19_01_ACT1_06]" )--能作為你們的領袖，是我這輩子最輝煌的榮耀。我們走！
	sleep(20)
	AdjustFaceDir( npc[1], npc[2], 0 ) --面向目標
	PlayMotion( npc[1], ruFUSION_ACTORSTATE_EMOTE_SALUTE2 )
	sleep(15)
	
	PE_SetVar( "Zone19_PE01_Var_PH1Require", 1 )
	for i=1, num do
		ks_AttackMode( npc[i] )
		AddBuff( npc[i], 507514 , 0 , -1 ) 						-- 治療免疫
		SetPlot( npc[i], "Dead", "Lua_Zone19_PE01_NPCDead", 0 )
		BeginPlot( npc[i], "Lua_Zone19_PE01_NPC_AI", 0 )
		WriteRoleValue( npc[i], EM_RoleValue_PID, 6 )
	end
end

function Lua_Zone19_PE01_NPC_ACT2()
	local npc = Zone19_PE01_NPC
	local count = 0
	for i=2, table.getn(npc) do
		if CheckID(npc[i]) == true then
			count = count +1
			DelObj(npc[i])
		end
	end
	
	for i = 1 , PE_GetActivePlayerGUIDCount( Zone19_PE01_PEIndex ) do
		local GUID = PE_GetActivePlayerGUID( Zone19_PE01_PEIndex )
		if PE_GetPlayerScore( Zone19_PE01_PEIndex, GUID ) >= 400 then
			LuaPE_KS_SetBonus( Zone19_PE01_PEIndex, Zone19_PE01_Var["MapID"], count*50, GUID )--(指定)分數計算
			break
		end
	end
	
	ks_ActSetMode( npc[1] )		-- 演戲用
	CancelBuff( npc[1], 507520 )--清除瘟疫
	AddBuff( npc[1], 507899, 0, -1 )--不可物理攻擊
	ClearHateList( npc[1], -1 )--清除仇恨
	SetModeEx( npc[1], EM_SetModeType_Move , false )	
	sleep(10)	
	AdjustDir( npc[1], 90 )
	NPCSay( npc[1], "[SC_PE_ZONE19_01_ACT2_01]" )--法爾德？......席巴？你們在哪？
	sleep(10)
	AdjustDir( npc[1], 90 )
	sleep(10)
	AdjustDir( npc[1], 90 )
	sleep(10)
	PlayMotion( npc[1], ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )
	NPCSay( npc[1], "[SC_PE_ZONE19_01_ACT2_02]" )--唉......只剩下我了嗎？
	sleep(35)
	NPCSay( npc[1], "[SC_PE_ZONE19_01_ACT2_03]" )--你們在我面前走向生命盡頭......而我卻什麼都不能做！
	sleep(40)
	PlayMotion( npc[1], ruFUSION_ACTORSTATE_EMOTE_ANGRY )
	NPCSay( npc[1], "[SC_PE_ZONE19_01_ACT2_04]" )--原本希望能為我的子民們謀得幸福，但......看看我都做了些什麼？
	sleep(20)
	CallPlot( npc[1], "Lua_Zone19_PE01_NPC_ACT", npc[1] )--變身
	sleep(20)
	PlayMotion( npc[1], ruFUSION_ACTORSTATE_CROUCH_LOOP )
	NPCSay( npc[1], "[SC_PE_ZONE19_01_ACT2_05]" )--我對不起你們......
	sleep(25)	
	NPCSay( npc[1], "[SC_PE_ZONE19_01_ACT2_06]" )--法爾德...席巴...蕾米和蕾蒂斯......我更對不起你們
	sleep(35)

	PE_SetVar( "Zone19_PE01_Var_PH5Require", 1 )
end

function Lua_Zone19_PE01_NPC_ACT( Obj )--變身
	local Ball = Lua_Davis_BornByMultilateral( 112399 , 5 , 50 )
	local num = table.getn(Ball)
	for i=1, num do
		Lua_ObjDontTouch( Ball[i] )
		DW_UnFight( Ball[i] )
	end

	for i=1, num do
		CastSpell(Ball[i], Obj, 496446 )
		sleep(10)
	end

	sleep(15)
	SysCastSpellLv( Obj, Obj, 496177, 1 )
	sleep(5)
	for i=1, num do
		SysCastSpellLv( Obj, Ball[i], 492185, 1 )
		DW_CheckThenDel( Ball[i] )
	end
end

function Lua_Zone19_PE01_NPC_ACT3_Fire()
	local Obj = Zone19_PE01_Obj
	local BladeID = Zone19_PE01_Var["BladeID"]
	for i = 1, table.getn(Obj) do
		if Obj[i] ~= nil and CheckID(Obj[i]) == true and ReadRoleValue( Obj[i], EM_RoleValue_OrgID ) == BladeID then
			local Fire = LuaFunc_CreateObjByObj( 116814, Obj[i] )			
			WriteRoleValue( Fire, EM_RoleValue_LiveTime, 3 )
			Hide( Fire )
			SetModeEx( Fire, EM_SetModeType_Mark, false )
			Show( Fire, 0 )
			DelObj(Obj[i])
			sleep(3)
		end
	end
end

function Lua_Zone19_PE01_NPC_ACT3()
	local NPCID = Zone19_PE01_Var["NPCID"]
	local Boss = Zone19_PE01_Var["Boss"]
	local npc = KS_CreateObjMode( NPCID[1], Boss, nil, 0, 1, 1 )	--黑魔王
	table.insert( Zone19_PE01_Obj , npc )					-- 加入物件管理陣列
	DisableQuest( npc, true )
	BeginPlot( OwnerID(), "Lua_Zone19_PE01_NPC_ACT3_Fire", 0 )
	
	sleep(15)
	PlayMotion( npc, ruFUSION_ACTORSTATE_EMOTE_LAUGH )--大笑
	NPCSay( npc, "[SC_PE_ZONE19_01_ACT3_01]" )--慚愧、悔恨、憤怒還有無助......它們幾乎將我吞沒。
	sleep(40)	
	NPCSay( npc, "[SC_PE_ZONE19_01_ACT3_02]" )--雖然不知道你們是誰，但是謝謝你們將我從瘋狂中喚醒。
	sleep(35)
	NPCSay( npc, "[SC_PE_ZONE19_01_ACT3_03]" )--倘若當時，我能遇上像你們這樣的冒險者......	
	sleep(20)
	PlayMotion( npc, ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )
	sleep(15)
	NPCSay( npc, "[SC_PE_ZONE19_01_ACT3_04]" )--也罷，既然一切都已過去......
	sleep(35)
	PlayMotion( npc, ruFUSION_ACTORSTATE_EMOTE_SALUTE2 )
	NPCSay( npc, "[SC_PE_ZONE19_01_ACT3_05]" )--謝謝你們，冒險者。
	sleep(25)
	
	PE_SetVar( "Zone19_PE01_Var_PH7Require", 1 )
end

--==================================================--

--==================================================--
--  物件產生區                       				--
--==================================================--

function Lua_Zone19_PE01_CreateBoss()--物件產生
	local BossID = Zone19_PE01_Var["BossID"]		
	local npc = Zone19_PE01_NPC	

	local Boss = KS_CreateObjMode( BossID, npc[1], nil, 0, 1, 1 )	--黑魔王
	Hide(npc[1])
	Zone19_PE01_Var["Boss"] = Boss
	BeginPlot( Boss, "Lua_Zone19_PE01_Boss_AI", 0 )
	SetPlot( Boss, "Dead", "Lua_Zone19_PE01_MstDead", 0 )
	table.insert( Zone19_PE01_Obj , Boss )					-- 加入物件管理陣列	
end

function Lua_Zone19_PE01_CreateMst()--產生強化殭屍
	local Var = ZONE19_PE01_Var
	local MstFlagID = Var["MstFlagID"]
	local Creater = Var["Creater"]					-- 中控物件
	local MstID = Var["MstID"]						-- 怪物物件ID
	local TimeCreateMst = Var["TimeCreateMst"]		-- 每次間隔數目
	local MaxMst = Var["MaxMst"]					-- 場上最大數量		
	local MstNum = 0								-- 場上目前數量
	local CreateMst	= 0								-- 實際產生數量
	debugmsg(0,0,"CreateMst")
	while true do		
		if ZONE19_PE01_Phase < 3 or ZONE19_PE01_Phase > 6 then
			debugmsg(0,0,"Break CreateMst")
			break
		end--停止
		MstNum = ReadRoleValue( Creater, EM_RoleValue_Register1 ) --讀取數量
		if MstNum < MaxMst then
			CreateMst = MaxMst - MstNum
			if CreateMst >= TimeCreateMst then
				Lua_ZONE19_PE01_MstCreateMode( 7, TimeCreateMst )
			elseif CreateMst < TimeCreateMst then
				Lua_ZONE19_PE01_MstCreateMode( 7, CreateMst )
			end
		end
		Sleep( Zone19_PE01_Var["TimeSpace"]*10 )
	end
end

function Lua_ZONE19_PE01_MstCreateMode( SiteMode, Num )
	local Var = ZONE19_PE01_Var
	local Creater = Var["Creater"]		-- 中控物件	
	local MstID = Var["MstID"]			-- 怪物物件ID
	local MstFlagID = Var["MstFlagID"]
	local Site = {	[1] = { 1 };
					[2] = { 2,3 };
					[3] = { 4,5 };
					[4] = { 6,7 };
					[5] = { 8,9,10 };
					[6] = { 11,12,13 };
					[7] = { 14,15,16,17,18 }}
	local Obj = {}
	local count
	if SiteMode ~= nil and Num == nil then 
		Num = table.getn(Site[SiteMode])
	elseif Num == nil then
		Num = 1
	end
	for i = 1, Num do
		if SiteMode ~= nil then
			obj[i] = KS_CreateObjMode( MstID, MstFlagID, Site[SiteMode][i], 15, 1, 1 )
			-- ObjID(物件ID), var1(旗標ID) , var2(旗標位置), Range(產生範圍), ObjNum(產生數量), Add(是否AddToPartition )
		else
			obj[i] = KS_CreateObjMode( MstID, OwnerID(), nil, 15, 1, 1 )
			-- ObjID(物件ID),  var1(指定物件位置), var2(nil), Range(產生範圍), ObjNum(產生數量), Add(是否AddToPartition )
		end		
		
		AddBuff( Obj[i] , 506303 , 0 , -1 )							-- 防AE的Buff
		table.insert( Zone19_PE01_Obj , Obj[i] )					-- 加入物件管理陣列
		ks_AttackMode( Obj[i] )
		
		SetPlot( Obj[i], "Dead", "Lua_Zone19_PE01_MstDead", 0 )
		BeginPlot( Obj[i], "Lua_Zone19_PE01_Mst_AI", 0 )

		count = ReadRoleValue( Creater, EM_RoleValue_Register1 )
		WriteRoleValue( Creater, EM_RoleValue_Register1, count+1 )
	end
	if Num > 1 then
		return Obj
	else
		return Obj[1]
	end
end

--==================================================--


--==================================================--
--  	AI 移動處理區                      			--
--==================================================--

function Lua_Zone19_PE01_NPC_AI()
	local Message = Zone19_PE01_NPC_Message
	local FlagID = Zone19_PE01_Var["FlagID"]
	local MstFlagID = Zone19_PE01_Var["MstFlagID"]
	local NPCID = Zone19_PE01_Var["NPCID"]		
	local DeathID = Zone19_PE01_Var["DeathID"]
	local NPC = Zone19_PE01_NPC
	local O_ID = OwnerID()
	local target = 0
	local Phase
	local Goal = 19 --終點
	local site
	local BuffLV
	local rnd
	local Hate
	local help = false
	local FindLock = false
	
	while true do		
		Phase = Zone19_PE01_Phase
		rnd = rand(70)
		site = ReadRoleValue( O_ID, EM_RoleValue_PID )
		if Phase > 4 then
			break
		end

		if DW_CheckDis( O_ID, FlagID, site, 30 ) == true then			
			if ReadRoleValue( O_ID, EM_RoleValue_OrgID ) == NPCID[1] and FindLock ~= true then
				Lua_Zone19_PE01_NPC_Find( site )--探索
				if site == 19 then FindLock = true end
			end
			if site < Goal and O_ID == NPC[1] then				
				WriteRoleValue( NPC[1], EM_RoleValue_PID, site+1 )
			elseif site < Goal and O_ID ~= NPC[1] then
				WriteRoleValue( O_ID, EM_RoleValue_PID, ReadRoleValue( NPC[1], EM_RoleValue_PID ) )
			end		
		end		
							
		if Phase >= 2 and Phase < 5 then
			BuffLV = KS_CheckBuffLV( O_ID, 507520 )--判斷中毒
			if BuffLV == 5 and rnd < 5 then
				NPCSay( O_ID, "[SC_PE_ZONE19_01_NPCSAY_01]" )--我覺得好累，需要休息...
			else
				if BuffLV > 0 and KS_GetColdown( O_ID, 496480 ) ~= 0 and rnd > 55 then
					NPCSay( O_ID, "[SC_PE_ZONE19_01_NPCSAY_02]" )--我有點不舒服，能用治療石幫我嗎?
				end
			end
		end
		
		for i=1, table.getn(NPC) do
			if NPC[i] ~= nil and NPC[i] ~= O_ID and CheckID(NPC[i]) == true and KS_InCombat(NPC[i]) == true then					
				Hate = ReadRoleValue( NPC[i], EM_RoleValue_AttackTargetID )
				if Hate ~= 0 then
					SysCastSpellLv( Hate, O_ID, 495767, 0 )--高級挑釁
				else
					Hate = KS_GetHateList( NPC[i] ) --仇恨表( Type:1 依仇恨; 2 依距離;)
					SysCastSpellLv( Hate[1], O_ID, 495767, 0 )--高級挑釁
				end
				sleep(10)
				break
			end
		end	
		
		if KS_InCombat(O_ID) == false and ReadRoleValue( O_ID, EM_RoleValue_Register2 ) == 0 then--非戰鬥
			target = Lua_Zone19_PE01_NPCSearch()--搜尋
			if target == 0 and Phase < 4 and help == false then
				WriteRoleValue( O_ID, EM_RoleValue_IsWalk , 1 )			-- 用走的移動
				
				ks_Move( O_ID, 25, FlagID, ReadRoleValue( O_ID, EM_RoleValue_PID ) )
			elseif CheckID( target ) == true and ReadRoleValue( O_ID, EM_RoleValue_SpellMagicID ) == 0 then			
				if 	GetDistance( O_ID, target )	<= 30 then					
					StopMove( O_ID, true )
					if ReadRoleValue( O_ID, EM_RoleValue_SpellMagicID ) == 0 then
						if ReadRoleValue( target, EM_RoleValue_OrgID ) == DeathID and KS_GetColdown( O_ID, 496479 ) == 0 and CheckID(target) == true then
							if rnd%2 == 0 then
								NPCSay( O_ID, "[SC_PE_ZONE19_01_NPCSAY_03]" )--願你們能因此安息...
							end
							sleep(rnd%10*2)
							CastSpell( O_ID, target, 496479 )--點燃															
						elseif KS_CheckBuffLV( target, 507520 ) > 0 and KS_GetColdown( O_ID, 496480 ) == 0 and CheckID(target) == true then
							if target ~= O_ID and rnd%2 == 0 then
								NPCSay( O_ID, "[SC_PE_ZONE19_01_NPCSAY_04]" )--稍等一下，我正在幫你治療。
							end
							sleep(rnd%10*2)
							CastSpell( O_ID, target, 496480 )--治療
						end
					end
				else
					ks_Move( O_ID, 30, target )
				end				
			end
			help = false
			WriteRoleValue( O_ID, EM_RoleValue_Register1, 0 )		
		else
			AddBuff( O_ID, 506303 , 0 , -1 )							-- 防AE的Buff
			local str = ReadRoleValue( ReadRoleValue( O_ID, EM_RoleValue_AttackTargetID ), EM_RoleValue_Register2 )
			if str ~= 0 and rnd < 5 then
				NPCSay( O_ID, "[SC_PE_ZONE19_01_NPCSAY_10][$SETVAR1=["..Str.."]]" )--[$VAR1]，為了拯救其他人... 請原諒我......
			elseif Message[rnd] ~= nil then
				NPCSay( O_ID, Message[rnd] )				
			end
		end
		sleep(10)
	end
end

function Lua_Zone19_PE01_NPCSearch()--檢查可工作對象
	local OID = OwnerID()		
	local NPC = Zone19_PE01_NPC	
	local NPCnum = table.getn(NPC)
	local count = 1		
	local DeathID = Zone19_PE01_Var["DeathID"]
	local obj = SearchRangeNPC( OID, 60 )	
	local num = table.getn(obj)
	
	if KS_GetColdown( OID, 496480 ) == 0 then
		for i= 1, NPCnum do			
			if NPC[i] ~= nil and CheckID(NPC[i]) == true and KS_CheckBuffLV( NPC[i], 507520 ) > 0 then
				for j= 1, NPCnum do
					if NPC[j] ~= nil and CheckID(NPC[j]) == true and NPC[j] ~= OID and ReadRoleValue( NPC[j], EM_RoleValue_Register1 ) ~= NPC[i] then
						count = count + 1
					elseif NPC[j] == nil or CheckID(NPC[j]) ~= true then
						NPCnum = NPCnum - 1
					end
				end
				if count == NPCnum then
					WriteRoleValue( OID, EM_RoleValue_Register1, NPC[i] )
					return NPC[i]
				end
			end
		end
	end
	
	if KS_GetColdown( OID, 496479 ) == 0 then
		for i=0, num do
			if ReadRoleValue( obj[i], EM_RoleValue_OrgID ) == DeathID then
				for j= 1, NPCnum do				
					if NPC[j] ~= nil and CheckID(NPC[j]) == true and NPC[j] ~= OID and ReadRoleValue( NPC[j], EM_RoleValue_Register1 ) ~= obj[i] then
						count = count + 1
					elseif NPC[j] == nil or CheckID(NPC[j]) ~= true then
						NPCnum = NPCnum - 1
					end
				end
				if count == NPCnum then
					WriteRoleValue( OID, EM_RoleValue_Register1, obj[i] )
					return obj[i]					
				end
			end			
		end
	end
	return 0
end

function Lua_Zone19_PE01_NPC_Find( site )--探索
	local AttackSite = { 7,9,11,14,15,17 }
	local NPC = Zone19_PE01_NPC
	
	if site == 11 or site == 15 or site == 19 then
		for i=1, table.getn(NPC) do
			if CheckID(npc[i]) == true then
				ks_ActSetMode( npc[i] )	-- 演戲用
				ClearHateList( npc[i], -1 )--清仇恨
				SetModeEx( npc[i], EM_SetModeType_Move , false )		-- 移動
				SetDefIdleMotion( npc[i], ruFUSION_MIME_IDLE_COMBAT_1H )
				WriteRoleValue( npc[i], EM_RoleValue_Register2, 1 )
			end
		end
		sleep(15)
		PlayMotion( npc[1], ruFUSION_ACTORSTATE_CROUCH_LOOP )		-- 蹲下	
		CallPlot( npc[1], "Lua_Zone19_PE01_NpcMessage", "[SC_PE_ZONE19_01_NPCSAY_12]" )--這地方的感覺讓我很不舒服，似乎隱藏著什麼...
		Sleep(35)
		if PE_GetVar("Zone19_PE01_Var_PH3Require") == 2 then
			local obj = Lua_ZONE19_PE01_MstCreateMode( 7 )
			for i=1, table.getn(obj) do
				if CheckID(obj[i]) == true then
					ks_ActSetMode( obj[i] )	-- 演戲用
					SetModeEx( obj[i], EM_SetModeType_Move , false )	-- 移動
				end
			end
			PlayMotion( npc[1], ruFUSION_ACTORSTATE_CROUCH_END )		-- 起立			
			CallPlot( npc[1], "Lua_Zone19_PE01_NpcMessage", "[SC_PE_ZONE19_01_NPCSAY_13]" )--而我們似乎被包圍了...
			sleep(20)
			PlayMotion( npc[1],ruFUSION_ACTORSTATE_EMOTE_APPROVAL )
			CallPlot( npc[1], "Lua_Zone19_PE01_NpcMessage", "[SC_PE_ZONE19_01_NPCSAY_14]" )--在結束這一切之前...而我們絕不能倒下!!			
			sleep(25)
			for i=1, table.getn(obj) do
				if CheckID(obj[i]) == true then
					ks_AttackMode( obj[i] )
					SetModeEx( obj[i], EM_SetModeType_Move , true )	-- 移動
				end
			end
		end		
		PE_SetVar( "Zone19_PE01_Var_PH3Require", PE_GetVar("Zone19_PE01_Var_PH3Require")+1 )
		for i=1, table.getn(NPC) do
			if CheckID(npc[i]) == true then
				SetDefIdleMotion( npc[i], ruFUSION_MIME_IDLE_STAND )
				ks_AttackMode( npc[i] )
				WriteRoleValue( npc[i], EM_RoleValue_Register2, 0 )
				AddBuff( npc[i], 506984, 0, 30 )--加速30%
			end
		end
	end
	for i=1, table.getn(AttackSite) do
		if AttackSite[i] == site then			
			CallPlot( npc[1], "Lua_Zone19_PE01_NpcMessage", "[SC_PE_ZONE19_01_NPCSAY_15]", 0xffff0000 )--注意了!!有感染者來襲...	
			for i=1, table.getn(NPC) do
				if CheckID(npc[i]) == true then
					SetDefIdleMotion( npc[i], ruFUSION_MIME_IDLE_COMBAT_1H )
					StopMove( npc[i], true )
					sleep(2)
				end
			end
			sleep(10)
			Lua_ZONE19_PE01_MstCreateMode( i )
			for i=1, table.getn(NPC) do
				if CheckID(npc[i]) == true then
					SetDefIdleMotion( npc[i], ruFUSION_MIME_IDLE_STAND )
				end
			end
			break
		end
	end
end

function Lua_Zone19_PE01_Mst_AI()
	local OID = OwnerID()
	local NPC = Zone19_PE01_NPC
	local FlagID = Zone19_PE01_Var["FlagID"]
	local time = 0
	local Hate = 0
	local rnd = rand(5)
	local Phase
	
	while true do
		Phase = Zone19_PE01_Phase
		if  Phase >= 7 then DelObj( OID) end
		
		if KS_InCombat(OID) == false then--非戰鬥
			if Phase < 5 then
				ks_Move( OID, 30, NPC[1] )
			elseif Phase > 5 and Zone19_PE01_Var["Boss"] ~= 0 then
				ks_Move( OID, 30, Zone19_PE01_Var["Boss"] )
			end
			time = 0
		elseif KS_InCombat(OID) == true then
			AddBuff( OID, 506303 , 0 , -1 )			-- 防AE的Buff
			
			if time > 1 and time%(7+rnd) == 0 then
				Hate = ReadRoleValue( OID, EM_RoleValue_AttackTargetID )
				if Hate == 0 then
					Hate = KS_GetHateList( OID ) --仇恨表( Type:1 依仇恨; 2 依距離;)
					Hate = Hate[1]
				end
				SysCastSpellLv( OID, Hate, 496545, 60 )--猛攻
			end
			if Phase < 5 and  time%(16+rnd) == 0 then
				SysCastSpellLv( OID, OID, 496536, 0 )--瘟疫
			elseif Phase == 5 then			
				ClearHateList( OID, NPC[1] )--清仇恨
			end
			time = time + 1
		end
		sleep(10)
	end
end

function Lua_Zone19_PE01_Boss_AI()
	local Message = {	[1] = "[SC_PE_ZONE19_01_BOSS_SAY01]";--別以為能逃離這裡，這場噩夢不會輕易結束的。(黑暗之刃)
						[2] = "[SC_PE_ZONE19_01_BOSS_SAY02]";--縱使有再強的力量也無法改變什麼...(禁錮之劍)
						[3] = "[SC_PE_ZONE19_01_BOSS_SAY03]";--你們能了解手刃自己臣民的痛苦嗎!?(靈魂之鍊)
					}
	local OID = OwnerID()
	local time = 0
	local combat = false
	local HateList = {}
		
	Lua_Zone19_PE01_UBW()--無限之刃
	while true do
		if KS_InCombat(OID) == true	then--戰鬥
			AddBuff( OID, 506303 , 0 , -1 )							-- 防AE的Buff
			if time%17 == 0 then
				CastSpell( OID, OID, 496537 )--痛苦打擊
				SysCastSpellLv( OID, OID, 496548, 0 )--爆氣
			end
			if time > 1 and time%13 == 0 then
				CallPlot( OID, "Lua_Zone19_PE01_NpcMessage", Message[2] )
				BeginPlot( OID, "Lua_Zone19_PE01_GetBatter", 0 )--禁錮之劍
			elseif time > 1 and time%17 == 0 then
				CallPlot( OID, "Lua_Zone19_PE01_NpcMessage", Message[1] )				
				Lua_Zone19_PE01_RangeAttack()--黑暗之刃連打
			elseif time > 1 and time%19 == 0 then
				CallPlot( OID, "Lua_Zone19_PE01_NpcMessage", Message[3] )
				BeginPlot( OID, "Lua_Zone19_PE01_SetSoulLink", 0 )--靈魂之鍊
			end
			
			HateList = KS_GetHateList( OID )
			if HateList[1] ~= nil then
				SetAttack( OID, HateList[1] )
				if GetDistance( OID, HateList[1] ) > 70 then
					SysCastSpellLv( OID, HateList[1], 496478, 100 )--黑暗之刃
					CallPlot( OID, "Lua_Zone19_PE01_NpcMessage", Message[1] )
				end
			end
			combat = true
			time = time+1			
		else
			if combat == true then
				KS_ClearArray( Zone19_PE01_LinkList )--釋放陣列
				combat = false
			end
			time = 0
		end
		sleep(10)
	end	
end

function Lua_Zone19_PE01_NpcMessage( Message, Color )
	Color = Color or "0xffffff80"	-- 強制訊息為白色
	local PEIndex = Zone19_PE01_PEIndex
	local Count = PE_GetActivePlayerGUIDCount( PEIndex )
	local OID = OwnerID()
	local GUID	
	
	for i = 1 , Count do
		GUID = PE_GetActivePlayerGUID( PEIndex )	
		ScriptMessage( OID, GUID, 1 , Message, Color )		
	end
	NPCSay( OID, Message )
end

		
--==================================================--


--==================================================--
--    死亡處理區                       				--
--==================================================--

function Lua_Zone19_PE01_MstDeadSet()
	SetPlot( OwnerID(), "Dead", "Lua_Zone19_PE01_MstDead", 0 )
end

function Lua_Zone19_PE01_NPCDead()
	local OID = OwnerID()
	local NPCID = Zone19_PE01_Var["NPCID"]
	if ReadRoleValue( OID, EM_RoleValue_OrgID ) == NPCID[1] then
		if ZONE19_PE01_Phase <= 4 then
			PE_SetVar( "Zone19_PE01_Var_NPCDead" , 1 )		-- PE變數改變
		else
			return false
		end
	else
		local OrgID		
		local npc = Zone19_PE01_NPC
		local Str = {	[116809] = 116816;
						[116810] = 116817;
						[116811] = 116994;
						[116812] = 116995	}
		for i=2, table.getn(npc) do
			OrgID = ReadRoleValue( OID, EM_RoleValue_OrgID )						
			if OrgID == NPCID[i] then				
				NPCSay( OID, "[SC_PE_ZONE19_01_NPCSAY_17]" )--殿下... 請原諒我不能繼續追隨你...				
				CallPlot( npc[1], "Lua_Zone19_PE01_NpcMessage", "[SC_PE_ZONE19_01_NPCSAY_16][$SETVAR1=["..Str[OrgID].."]]" )--[$VAR1]，我會讓造成這一切的人付出代價的!!
				SysCastSpellLv( npc[1], npc[1], 496546, 0 )--憤怒
				if Zone19_PE01_Phase < 4 then
					local dead = Lua_ZONE19_PE01_MstCreateMode()
					WriteRoleValue( dead, EM_RoleValue_Register2, Str[OrgID] )
				else
					for i = 1 , PE_GetActivePlayerGUIDCount( Zone19_PE01_PEIndex ) do
						local GUID = PE_GetActivePlayerGUID( Zone19_PE01_PEIndex )
						if PE_GetPlayerScore( Zone19_PE01_PEIndex, GUID ) >= 200 then
							LuaPE_KS_SetBonus( Zone19_PE01_PEIndex, Zone19_PE01_Var["MapID"], 10+(PE_GetVar( "Zone19_PE01_Var_PH4Kill" )%10)*10, GUID )--(指定)分數計算
							break
						end
					end
				end
				break
			end
		end
		DelObj(OID)
	end	
end

function Lua_Zone19_PE01_MstDead()
	local O_ID = OwnerID()
	local T_ID = TargetID()
	local OrgID = ReadRoleValue( O_ID, EM_RoleValue_OrgID )
	local npc = Zone19_PE01_NPC
	
	if Zone19_PE01_Phase > 0 then
		local PEIndex = Zone19_PE01_PEIndex		
		local BossID = Zone19_PE01_Var["BossID"]
		local MapID = Zone19_PE01_Var["MapID"]
		local Bonus = Zone19_PE01_Var["Bonus"]
		local MstID = Zone19_PE01_Var["MstID"]
		local BladeID = Zone19_PE01_Var["BladeID"]
		local Creater = Zone19_PE01_Var["Creater"]-- 生產控制物件GID
		local Type = 1
		
		if OrgID == BossID then	--Boss死亡
			type = 4
			PE_SetVar( "Zone19_PE01_Var_BossDead", 1 )		
		elseif OrgID == MstID then
			type = 3
			count = ReadRoleValue( Creater, EM_RoleValue_Register1 )
			WriteRoleValue( Creater, EM_RoleValue_Register1, count-1 )
			if Zone19_PE01_Phase >= 4 then
				PE_SetVar( "Zone19_PE01_Var_PH4Kill", PE_GetVar("Zone19_PE01_Var_PH4Kill") + 1 )
			end
		end
		local TOrgID = ReadRoleValue( T_ID, EM_RoleValue_OrgID )
		if ReadRoleValue( T_ID, EM_RoleValue_IsPlayer ) == 1 then
			if type == 4 then				
				local TimeBonus = math.floor(PE_GetVar( "Zone19_PE01_PH6_Time" )/1000)*2
				LuaPE_KS_GetBonus( PEIndex, MapID, Bonus[Type]+ TimeBonus )       -- 擊殺給予分數
			elseif ( type == 3 and Zone19_PE01_Phase > 2 ) or type == 1 then
				local str = ReadRoleValue( O_ID, EM_RoleValue_Register2 )
				if str ~= 0 then
					NPCSay( npc[1], "[SC_PE_ZONE19_01_NPCSAY_11][$SETVAR1=["..str.."]]" )--[$VAR1]，請安息吧......
				end
				LuaPE_KS_GetBonus( PEIndex, MapID, Bonus[Type] )       -- 擊殺給予分數				
			end			
		elseif TOrgID == BossID then				
			local Boss = Zone19_PE01_Var["Boss"]			
			local Blade = LuaFunc_CreateObjByObj( BladeID, O_ID )
			table.insert( Zone19_PE01_Obj, Blade )
			ks_ActorMode( Blade, true )--設定演戲用NPC
			WriteRoleValue( Blade, EM_RoleValue_Register2, Boss )
			AddBuff( Boss, 507541, 0, -1 )
		end	
	
		if OrgID ~= BossID and OrgID ~= MstID and Zone19_PE01_Phase < 5 then
			local DeathID = Zone19_PE01_Var["DeathID"]
			local death = LuaFunc_CreateObjByObj ( DeathID, O_ID )
			table.insert( Zone19_PE01_Obj , death )
			SetDir( death, ReadRoleValue( O_ID, EM_RoleValue_Dir ) )		
			ks_ActorMode( death, true )--設定演戲用NPC	
			SetDefIdleMotion( death, ruFUSION_MIME_IDLE_DEAD )
			PlayMotion( death, ruFUSION_ACTORSTATE_ACTIVATE_BEGIN )	
			WriteRoleValue( death, EM_RoleValue_LiveTime, 60 )
		end
	end
	Hide(O_ID)
end

--==================================================--


--==================================================--
--  		如何燒一具屍體                     		--
--==================================================--

function Lua_Zone19_PE01_SpellFire()--使用物品後
	local OID = OwnerID()	
	if ReadRoleValue( OID, EM_RoleValue_SpellMagicID ) == 0 then
		local Obj = SearchRangeNPC( OID, 40 ) --TargetID()	
		local OrgID
		for i= 0, table.getn(Obj) do		
			OrgID = ReadRoleValue( Obj[i], EM_RoleValue_OrgID )
			if OrgID == Zone19_PE01_Var["DeathID"] or OrgID == Zone19_PE01_Var["BladeID"] then			
				CastSpell( OID, Obj[i], 496479 )--放火
				return
			end
		end
	
		ScriptMessage( OID, OID, 1 , "[SYS_TOUCH_NOTARGET]" , 0 )--沒有目標		
	end
end

function Lua_Zone19_PE01_CheckFire()--然後對它放火
	local Obj = TargetID()
	local Player = OwnerID()
	if ReadRoleValue( Obj, EM_RoleValue_Register1 ) == 0 then
		AdjustFaceDir( Player, Obj, 0 ) --面向目標
		PlayMotion( Player, ruFUSION_ACTORSTATE_CRAFTING_LOOP )
		return true
	else
		return false
	end	
end

function Lua_Zone19_PE01_Fire()--然後對它放火
	local O_ID = OwnerID() --玩家
	local T_ID = TargetID()--對象
	local PEIndex = Zone19_PE01_PEIndex
	local DeathID = Zone19_PE01_Var["DeathID"]
	local BladeID = Zone19_PE01_Var["BladeID"]
	local Bonus = Zone19_PE01_Var["Bonus"]
	local MapID = Zone19_PE01_Var["MapID"]
	local OrgID = ReadRoleValue( T_ID, EM_RoleValue_OrgID )	
	local Boss
	
	if ReadRoleValue( T_ID, EM_RoleValue_Register1 ) == 0 then
		WriteRoleValue( T_ID, EM_RoleValue_Register1, 1 )
		if OrgID == DeathID then
			local MstFire = PE_GetVar( "Zone19_PE01_Var_PH2Require" )
			PE_SetVar( "Zone19_PE01_Var_PH2Require", MstFire+1 )
		elseif OrgID == BladeID then
			Boss = ReadRoleValue( T_ID, EM_RoleValue_Register2 )
			KS_ClearBuffLV( Boss, 507541, 1 )--清除BOSS BUFF
			SysCastSpellLv( O_ID, Boss, 496534, 0 )--造成傷害
		end
		if ReadRoleValue( O_ID, EM_RoleValue_IsPlayer ) == 1 then
			LuaPE_KS_SetBonus( PEIndex, MapID, Bonus[2], O_ID )--分數計算	
		end
		
		local Fire = LuaFunc_CreateObjByObj( 116814, T_ID )
		WriteRoleValue( Fire, EM_RoleValue_LiveTime, 5 )
		Hide( Fire )
		SetModeEx( Fire, EM_SetModeType_Mark, false )
		Show( Fire, 0 )
		DelObj(T_ID)		
	end
end

--==================================================--

--==================================================--
--  		如何毒死人 	                    		--
--==================================================--

function Lua_Zone19_PE01_NpcCheck()--先找出對象
	local NPCID = Zone19_PE01_Var["NPCID"]
	local TID = TargetID()
	if ReadRoleValue( TID, EM_RoleValue_IsPlayer ) ~= 1 then
		for i=1, table.getn(NPCID) do
			if ReadRoleValue( TID, EM_RoleValue_OrgID ) == NPCID[i] then
				return true
			end
		end
	end
	return false
end

function Lua_Zone19_PE01_HealCheck()--先找出肥羊
	local Obj = TargetID()
	local Player = OwnerID()	
	local NPCID = Zone19_PE01_Var["NPCID"]
	local OrgID = ReadRoleValue( Obj, EM_RoleValue_OrgID )
		
	for i=1, table.getn(NPCID) do
		if OrgID == NPCID[i] and KS_CheckBuffLV( Obj, 507520 ) > 0 then
			AdjustFaceDir( Player, Obj, 0 ) --面向目標
			PlayMotion( Player, ruFUSION_ACTORSTATE_CRAFTING_LOOP )
			return true
		end
	end	
	ScriptMessage( Player, Player, 1 , "[SC_Z19PE_ITEM]" , 0 )--目前似乎還用不到
	return false
end

function Lua_Zone19_PE01_Heal()--然後對它噴毒
	local O_ID = OwnerID() --玩家
	local T_ID = TargetID()--對象
	local PEIndex = Zone19_PE01_PEIndex
	local Bonus = Zone19_PE01_Var["Bonus"]
	local MapID = Zone19_PE01_Var["MapID"]
	
	AdjustFaceDir( T_ID, O_ID, 0 ) --面向目標
	
	if KS_CheckBuffLV( T_ID, 507520 ) > 0 then
		KS_ClearBuffLV( T_ID, 507520, 1 )
		SysCastSpellLv( O_ID, T_ID, 496547, Zone19_PE01_Phase-2 ) -- 補血
	end
	
	if ReadRoleValue( O_ID, EM_RoleValue_IsPlayer ) == 1 then		
		LuaPE_KS_SetBonus( PEIndex, MapID, Bonus[2], O_ID )--分數計算
	end
end

--==================================================--

--==================================================--
--  			又痛又準的禁錮之劍	                --
--==================================================--

function Lua_Zone19_PE01_GetBatter()--抓對象
	local Boss = OwnerID()
	local HateList = KS_GetHateList( Boss )--抓仇恨表
	local HateNum = table.getn(HateList)
	
	if HateNum > 0 then
		local num = math.floor(HateNum/2)
		local List = KS_RegroupArray( HateList, num )
		for i=1, num do
			if List[i] ~= Boss then
				SysCastSpellLv( Boss, List[i], 496530, 0 )--禁錮之劍
			end
		end
	end		
end

function Lua_Zone19_PE01_CheckMagic()--檢查施法
	local OID = OwnerID()
	local lv = KS_CheckBuffLV( OID, 508062 )
	if CheckBuff( OID, 508093 ) ~= true and lv < 7 then		
		CancelBuff_NoEvent( OID, 508062 )--清除檢察用BUFF
		CancelBuff_NoEvent( OID, 508093 )--清除檢察用BUFF
		AddBuff( OID, 508062, lv, 5 )--禁錮之劍
		AddBuff( OID, 508093, 0, -1 )--檢察用BUFF
		WriteRoleValue( OID, EM_RoleValue_Register3, lv )
		--SysCastSpellLv( OID, OID, 496530, 0 )
	end
end

function Lua_Zone19_PE01_CreateBatter()-- 產生連擊劍	
	local OID = OwnerID()	
		CancelBuff_NoEvent( OID, 508093 )--清除檢察用BUFF
		AddBuff( OID, 508068, 0, 3 )--定身
		local ObjID = 117219
		local Num = ReadRoleValue( OID, EM_RoleValue_Register3 )
		WriteRoleValue( OID, EM_RoleValue_Register3, 0 )

		local Obj = ks_RandBornByMultilateral( ObjID, OID, nil, Num+3, 50, 60 )	--在周圍用ObjID 圍成 Num 角形	
		for i =1, table.getn(Obj) do
			ks_ActSetMode( Obj[i] )--設定演戲用NPC
			WriteRoleValue( Obj[i], EM_RoleValue_LiveTime, 3 )
			CallPlot( Obj[i], "Lua_Zone19_PE01_BatterDo", OID )
		end
	
end

function Lua_Zone19_PE01_BatterDo( site )--劍移動/傷害
	local OID = OwnerID()
	local Boss = Zone19_PE01_Var["Boss"]
	local x = ReadRoleValue( OID, EM_RoleValue_X )
	local y = ReadRoleValue( site, EM_RoleValue_Y )
	local z = ReadRoleValue( OID, EM_RoleValue_Z )
	local RoomID = ReadRoleValue( OID, EM_RoleValue_RoomID )
	local MoveY
	MoveDirect( OID, x+1 , y, z+1 )

	while true do		
		AddBuff( OID, 506984, 4, -1 )
		MoveY = ReadRoleValue( OID, EM_RoleValue_Y )		
		if MoveY <= y+30 then
			break
		end
		sleep(3)
	end
	SysCastSpellLv( Boss, OID, 496533, 0 )--造成傷害
end

--==================================================--

--==================================================--
--  			打我多少就還你多少	                --
--==================================================--

function Lua_Zone19_PE01_SetSoulLink()--靈魂連結
	local Boss = OwnerID()
	local BuffLv = 0
	local HateList = KS_GetHateList( Boss, 3 )--抓仇恨表	
	local Num = table.getn(HateList)
	local time = 10
	
	if Num > 0 then
		AddBuff( Boss, 508064, 0, time )
		Zone19_PE01_LinkList = HateList
		BuffLv = KS_CheckBuffLV( Boss, 507541 )--取得指定物件身上BUFF等級
		for i=1, Num do
			AddBuff( HateList[i], 508066, math.floor(BuffLv/Num), time )
		end
	end	
end
	
function Lua_Zone19_PE01_InCombat( MagicID, Dmg )	--受到法術影響
	local Boss = TargetID()
	if CheckBuff( Boss, 508064 ) == true and Dmg < 0 and MagicID ~= 508087 then		
		local LinkList = Zone19_PE01_LinkList
		local lv = math.floor(math.abs(Dmg/1000))
		if lv > 0 then
			lv = lv - 1
		end		
		for i=1, table.getn(LinkList) do
			if LinkList[i] ~= nil and CheckID(LinkList[i]) == true then
				SysCastSpellLv( Boss, LinkList[i], 496535, lv )--造成傷害
			end
		end		
	end	
	return Dmg
end

--==================================================--
--  			無限之刃		                  	--
--==================================================--

function Lua_Zone19_PE01_UBW()--無限之刃
	local Boss = OwnerID()
	local ObjID = Zone19_PE01_Var["BladeID"]
	local Num = 25
	local dis = 150
	local Obj = ks_RandBornByMultilateral( ObjID, Boss, nil, Num, dis, 0 )
	AddBuff( Boss, 507541, Num-1, -1 )
	
	for i =1, table.getn(Obj) do		
		table.insert( Zone19_PE01_Obj, Obj[i] )
		ks_ActorMode( Obj[i] )--設定演戲用NPC
		WriteRoleValue( Obj[i], EM_RoleValue_Register2, Boss )
	end
end

--==================================================--

--==================================================--
--  				專打最遠的突擊                 	--
--==================================================--
function Lua_Zone19_PE01_RangeAttack()--專打最遠的
	local Boss = OwnerID()
	local HateRange = KS_GetHateListRange( Boss )--取得仇恨表(距離越遠順位越前)
	local Num = table.getn(HateRange)
	Num = math.floor(Num/3)
	if Num > 0 then	
		for i=1, Num do
			if HateRange[i] ~= nil and CheckID(HateRange[i]) == true then
				SysCastSpellLv( Boss, HateRange[i], 496478, 0 )--幻影斬擊
			else
				break
			end
			sleep(5)
		end
	end
end

--==================================================--

--==================================================--
--  			物品領取設定	                  	--
--==================================================--

function Lua_Zone19_PE01_NPCSet()
	local Player = OwnerID()
	local NPC = TargetID()
	local NPCID = Zone19_PE01_Var["NPCID"]
	if Zone19_PE01_Phase == 0 and ReadRoleValue( NPC, EM_RoleValue_OrgID ) == NPCID[1] then
		LoadQuestOption( Player )	
	else
		local Message = Zone19_PE01_NPC_Message
		SetSpeakDetail( Player, Message[(rand(5)+1)*10] )
		if Zone19_PE01_Phase > 1 then
			local GiveItem = Zone19_PE01_Var["GiveItem"]
			if CountBodyItem( player, GiveItem[1] ) == 0 or CountBodyItem( player, GiveItem[2] ) == 0 then
				AddSpeakOption( Player, NPC, "[SC_PE_ZONE19_GETITEM]", "Lua_Zone19_PE01_get",0) --向他索取物品。
			end
		end
	end
end

function Lua_Zone19_PE01_get()
	local OID = OwnerID()
	local item = Zone19_PE01_Var["GiveItem"]
	for i=1, table.getn(item) do
		if CountBodyItem( OID, item[i] ) == 0 then
			GiveBodyItem( OID, item[i], 1 )
		end
	end
	CloseSpeak( OID )
end

--==================================================--

--==================================================--
--    啟動處理區                   				  	--
--==================================================--

function Lua_Zone19_PE01_Init( Mode )
	if Zone19_PE01_Obj ~= nil then
		Lua_Zone19_PE01_DelObj()
	end
		
	Lua_Zone19_PE01_GlobalSet()	-- 共用變數設定
	Zone19_PE01_Var["Controller"] = OwnerID()
	
	local CreaterID = Zone19_PE01_Var["CreaterID"]-- 生產控制物件GID
	local Creater = KS_CreateObjMode( CreaterID, OwnerID(), nil, 30, 1, 1 )
	ks_SetController( Creater )--設定隱形控制物件
	Zone19_PE01_Var["Creater"] = Creater	
	ZONE19_PE01_Obj[1] = Creater	-- 將操作物件加入第一項
	
	Mode = Mode or Lua_Zone19_PE01_PESet()		-- 公眾事件設定
	while true do
		sleep(50)
		if math.floor(PE_GetVar( "Zone19_PE01_PH0_Time" )/1000) <= Zone19_PE01_Var["ResetTime"]*0.1 then break end
	end	
	Lua_Zone19_PE01_NPC_ACT0()
end

--==================================================--

--==================================================--
--		刪除物件與測試處理區						--
--==================================================--

function Lua_Zone19_PE01_DelObj()
	local Obj = Zone19_PE01_Obj
	local ObjNum = table.getn(Obj)
	if ObjNum > 0 then
		for i = 1, ObjNum do
			if Obj[i] ~= nil and CheckID(Obj[i]) == true then
				DelObj( Obj[i] )
			end
		end
	end
	KS_ClearArray( Obj )--釋放陣列
end

function Lua_Zone19_PE01_test01()--縮短重置時間
	PE_SetVar( "Zone19_PE01_PH0_Time", 30000 )
end

function Lua_Zone19_PE01_test02()--直接打王
	local NPC = Zone19_PE01_NPC
	local FlagID = Zone19_PE01_Var["FlagID"]	
	local PEIndex = Zone19_PE01_PEIndex
	
	local PH2Require = Zone19_PE01_Var["PH2Require"]
	local PH4Kill = Zone19_PE01_Var["PH4Kill"]
	
	PE_SetVar( "Zone19_PE01_PH0_Time", 15000 )
	PE_SetVar( "Zone19_PE01_Var_PH1Require", 1 )
	PE_SetVar( "Zone19_PE01_Var_PH2Require", PH2Require )
	PE_SetVar( "Zone19_PE01_Var_PH3Require", 3 )
	
	sleep(200)
	for i=1, table.getN(NPC) do
		CancelBuff( npc[i], 507520 )--清除瘟疫
		AddBuff( npc[i], 507899, 0, -1 )--不可物理攻擊
		ClearHateList( npc[i], -1 )--清除仇恨
		SetModeEx( npc[i], EM_SetModeType_Move , false )				-- 移動
		ks_RandRangeSetPos( NPC[i], FlagID, 19, 20 )--傳送
	end

	local Count = PE_GetActivePlayerGUIDCount( PEIndex )	
	local GUID
			
	for i = 1 , Count do
		GUID = PE_GetActivePlayerGUID( PEIndex )
		ks_RandRangeSetPos( GUID, FlagID, 19, 20 )--傳送
	end
	PE_SetVar( "Zone19_PE01_Var_PH4Kill", PH4Kill )
end

function Lua_Zone19_PE01_test03()
	DebugMsg( 0,0, "ResetTime = "..math.floor(PE_GetVar( "Zone19_PE01_PH0_Time" )/1000) )
end
--[[
/gm ? pcall LuaPE_ZONE19_PE01_GetScore(100)
--]]
function LuaPE_ZONE19_PE01_GetScore(Score)--給自己分數
	PE_GivePlayerScore( ZONE19_PE01_PEIndex , OwnerID() , Score );
end

--==================================================--