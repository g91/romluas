function LuaPE_ZONE18_PE01_GlobalSet()	
	ZONE18_PE01_Obj = {}							-- 使用物件管理陣列
	ZONE18_PE01_Var = {}							-- 使用參數管理陣列

	ZONE18_PE01_Phase = 0							-- 階段標籤
	ZONE18_PE01_ArgidinNowMove = 0	
	ZONE18_PE01_TotalScore = 0
	ZONE18_PE01_Move_FlagNum = 1
	ZONE18_PE01_PEIndex = 1
	ZONE18_PE01_Agidin_In_Water = 0	
	ZONE18_PE01_Art = {}
	ZONE18_PE01_Run_In_Pool = {0,0,0,0,0} --是否開戰--是否泡過第一次水--是否泡過第二次水--是否泡過第三次水--是否泡過第四次水--
	ZONE18_PE01_Message = {			
							--擺放共鳴石階段獵人說的話
							[1] = "[SC_PE_ZONE18_01_M01]";--[<S>104485]出現了，所有人準備[<S>208197]！		
							[2] = "[SC_PE_ZONE18_01_M02]"; --離他們遠一點！小心不要激怒他們...不然連[116392]都保不住你...		--亞基丁泡水前
							[3] = "[SC_PE_ZONE18_01_M03]";--[<S>104487]出現了！用相同的方法殺死他！				--巨大亞基丁出現
							[4] = "[SC_PE_ZONE18_01_M04]";--[<S>115600]享受了一頓美味的[116402]大餐，並打算繼續獵捕[104286]。
								
							[5] = "[SC_PE_ZONE18_01_M05]"; --遠方的獵人傳訊說[<S>104485]靠近了，大夥拿著[<S>208197]準備吧！
							[6] = "[SC_PE_ZONE18_01_M06]"; --要守護村子，大夥都要來幫忙，跟我來吧！

							[7] = "[SC_PE_ZONE18_01_M07]"; --該放的地點一個也別漏了，[<S>104485]會從空隙間鑽過來！
							[8] = "[SC_PE_ZONE18_01_M08]"; --沒有[<S>208197]的人可以來找我拿！
							[9] = "[SC_PE_ZONE18_01_M09]"; --[<S>104485]身上的鋼毛無堅不摧，我們要利用這些[116392]引導他們進熱泉！
							[10] = "[SC_PE_ZONE18_01_M10]"; --所有該放的地方我們都做了標記，大夥來找我拿[<S>208197]吧！

							[11] = "[SC_PE_ZONE18_01_M11]";--索取[<S>208197]。
							[12] = "[SC_PE_ZONE18_01_M12]";--這裡已經擺放了一顆[116392]。
							[13] = "[SC_PE_ZONE18_01_M13]";--你必須向獵人索取[<S>208197]在此擺放。
							--亞基丁行動階段獵人說的話
							[14] = "[SC_PE_ZONE18_01_M14]"; --只要泡過熱水他們的鋼毛就會變軟...散發出濃濃的香味...			--亞基丁第一次泡水後第二次泡水前
							[15] = "[SC_PE_ZONE18_01_M15]"; --不要靠近，這些熱泉對我們也是十分危險...				--亞基丁第二次泡水後
							--亞基丁泡水時螢幕顯示
							[16] = "[SC_PE_ZONE18_01_M16]";--[116402]堅硬的鋼毛開始軟化。						--第一次泡水
							[17] = "[SC_PE_ZONE18_01_M17]";--泡過熱泉的[<S>104485]散發出濃濃的香味。				--第二次泡水
							[18] = "[SC_PE_ZONE18_01_M18]";--[116402]看似一條悶煮過的肉腸...						--第三次泡水
							[19] = "[SC_PE_ZONE18_01_M19]";--你覺得是時候該去把這條香噴噴的肉腸處理掉了。				--第四次泡水

							--亞基丁遭遇狀況時獵人說的話
							[20] = "[SC_PE_ZONE18_01_M20]";--所有人退到我後面！只要有[116392]他們就不會過來！		--亞基丁沒泡水的狀況下穿過共鳴石
							[21] = "[SC_PE_ZONE18_01_M21]";--糟糕！有一個地點漏了！獵人們拖延時間保護所有人回村避難！		--亞基丁沒泡水的狀況下穿過共鳴石
							[22] = "[SC_PE_ZONE18_01_M22]";--他的鋼毛已經軟化了，大夥上，小心別掉進熱泉裡囉！			--亞基丁泡過一到三次水
							[23] = "[SC_PE_ZONE18_01_M23]";--很好...就這麼進熱泉去洗個澡吧...					--亞基丁第一次泡水
							[24] = "[SC_PE_ZONE18_01_M24]";--沒錯，就這麼翻轉，你不覺得很香嗎？					--亞基丁第二次泡水
							[25] = "[SC_PE_ZONE18_01_M25]";--或許已經夠了，但還是再等一下子。					--亞基丁第三次泡水
							[26] = "[SC_PE_ZONE18_01_M26]";--他已經很虛弱了！大夥待會小心別掉到熱泉裡面囉！					--亞基丁第四次泡水
							--獵人死亡
							[27] = "[SC_PE_ZONE18_01_M27]";--我有點不妙，剩下的就拜託你們了...					--獵人死亡
							[28] = "[SC_PE_ZONE18_01_M28]";--遠方出現了另一隻巨獸。							--獵人全滅
							[29] = "[SC_PE_ZONE18_01_M29]";--[104450]無奈的離開，[<S>115600]似乎已經習慣這樣的狀況，打算繼續獵捕[104286]。--厚殼離開
							--PE失敗
							[30] = "[SC_PE_ZONE18_01_M30]";--所有的獵人都撤退了，營地即將面臨危機。							
							--BOSS戰前畫面中央說的話
							[31] = "[SC_PE_ZONE18_01_M31]";--最大隻的來了，大夥小心。		
							[32] = "[SC_PE_ZONE18_01_M32]";--營地遭到亞基丁的包圍，所有獵人都回去守護他們的營地了。	
							[100] = "[SC_PE_ZONE18_01_M100]";--放製[116392]。
							[101] = "[SC_PE_ZONE18_01_M101]";--你被熱泉的滾水所燙傷，如果繼續待在水中會被煮熟。
							[102] = "[SC_PE_ZONE18_01_M102]";--[<S>115600]又開始繼續獵捕[104286]。
							[103] = "[SC_PE_ZONE18_01_M103]";--[<S>115600]又開始繼續獵捕[104286]。
				}
	
--	ZONE18_PE01_Var["White"] = Lua_DW_CreateObj("flag" ,116398,780753,1)		--重新創造白牙
--	ZONE18_PE01_Var["White2"] = Lua_DW_CreateObj("flag" ,116399,780753,1)	
--	ZONE18_PE01_Var["White3"] = Lua_DW_CreateObj("flag" ,116400,780753,1)	
--	table.insert( ZONE18_PE01_Obj , ZONE18_PE01_Var["White"] )
--	table.insert( ZONE18_PE01_Obj , ZONE18_PE01_Var["White2"] )
--	table.insert( ZONE18_PE01_Obj , ZONE18_PE01_Var["White3"] )
	--ZONE18_PE01_Var["ResetTime"] = 30				-- 公眾任務重置時間(秒)	1小時
	ZONE18_PE01_Var["CreateTime"] = 70				-- 怪物生產檢查間隔
	ZONE18_PE01_Var["MapID"] = 631					-- 公眾事件分區編號
	ZONE18_PE01_Var["TestID"] = 1					-- 公眾事件測試區編號
	ZONE18_PE01_Var["RoomID"] = 0	
	
	ZONE18_PE01_Var["ControllerID"] = 116390		-- PE控制物件GID
	ZONE18_PE01_Var["CreaterID"] = 116393			-- 怪物生產控制物件GID
	--ZONE18_PE01_Var["WellID"] = 116107				-- 水井GID
	ZONE18_PE01_Var["Controller"] = 0				-- PE控制物件
	ZONE18_PE01_Var["Creater"] = 0					-- 生產物件
	ZONE18_PE01_Var["CountMachine"] = 0					-- 生產物件
	ZONE18_PE01_Var["FlagID"] = {780756,780757,780759,780753}				-- 旗標ID
	local FlagID = ZONE18_PE01_Var["FlagID"]
	--ZONE18_PE01_Var["BossFlagID"] = 780657			-- BOSS用旗標
	ZONE18_PE01_Var["FlagNum"] = GetMoveFlagCount( FlagID[2] ) --旗幟數量
	--ZONE18_PE01_Var["CropType"] = 50				-- 作物區隔的旗標編號
		
	ZONE18_PE01_Var["HunterCount"] = 0
	ZONE18_PE01_Var["MstCount"] = 0	
	ZONE18_PE01_Var["Mark"] = {}							-- 使用參數管理陣列
	ZONE18_PE01_Var["ShowMark"] = {}						-- 使用參數管理陣列
	ZONE18_PE01_Agidin = {}						-- 使用參數管理陣列
	ZONE18_PE01_Hunter = {}							-- 使用參數管理陣列
	ZONE18_PE01_Var["HunterID"] = { 116394,			-- 獵人
									116395, 		-- 獵人
									116396,			-- 獵人
									116397 }		-- 獵人
									

	ZONE18_PE01_Var["GiveItem"] =  208197			-- 共鳴石

	ZONE18_PE01_Var["MstID"] = {	104286,			-- 幼年亞基丁
									104485,			-- 硬皮亞基丁
									104487 }		-- 巨大亞基丁
		
	ZONE18_PE01_Var["TimeCreateMst"] = 1				-- 每次間隔出場的怪物數目
	ZONE18_PE01_Var["MaxHunter"] = 10				-- 場上維持的獵人數目
	ZONE18_PE01_Var["NowHunter"] = 0				-- 場上的獵人數目
	ZONE18_PE01_Var["MaxMst"] = 5					-- 場上維持的怪物數目

	ZONE18_PE01_Var["HunterDead"] = 0				-- 目前獵人死亡數目
	ZONE18_PE01_Var["agidin"] = 0					-- 亞基丁死亡數量
	ZONE18_PE01_Var["MstDead"] = 0					-- 亞基丁死亡數量
	ZONE18_PE01_Var["MstBoss"] = 0					-- 巨大亞基丁的GitemID
	
	ZONE18_PE01_Var["ResetTime"] = 2400
	ZONE18_PE01_Var["PH1Require"]  = 60				-- 階段0需要捕捉幼年亞基丁數量
	ZONE18_PE01_Var["PH2Time"] = 120					-- 階段1總時間(秒)
	ZONE18_PE01_Var["PH3Require"] = 30				-- 階段2需要擊倒的硬殼亞基丁數量
	ZONE18_PE01_Var["PH4Require"] = 1				-- 階段3需要擊倒的巨大亞基丁數量
	
	ZONE18_PE01_Var["MaxHunterDead"] = 10			-- 獵人最大死亡數 (失敗條件)
	ZONE18_PE01_Var["NumInTown"] = 3				-- 階段3~4亞基丁存在於城鎮旁的最大數量		
	
	ZONE18_PE01_Var["Bonus"] = { 5,10,25,300 }			-- 每階段分數
	
	ZONE18_PE01_Var["ExCha_Ratio"] = 100			-- 回饋比率
	ZONE18_PE01_Var["MaxBonus"] = 1200				-- 最大分數
end

--==================================================--
--  公眾事件設定區                                  --
--==================================================--
function LuaPE_ZONE18_PE01_PESet()

	local PE_Name = "SC_PE_ZONE18_01_NAME"					-- [116402]浩劫
	local PE_Desc = "SC_PE_ZONE18_01_DESC"					-- 為了傳說中的美食，[<S>115600]處心積慮獵捕[104286]，做出種種可能觸怒[104487]的行為。
	local PEIndex = ZONE18_PE01_PEIndex
	local PE_ResetTime = ZONE18_PE01_Var["ResetTime"] * 1000	
	PE_AddPE( PE_Name , PE_Desc , PEIndex , 3000 ) 	-- 新增一個事件

	local MapID = ZONE18_PE01_Var["MapID"]
	local TestID = ZONE18_PE01_Var["TestID"]
	PE_AddRegion( PEIndex , MapID )							-- 把PE放進實際分區
	PE_AddRegion( PEIndex , TestID )						-- 把PE放進測試區
	--階段變數
	local PH0Index = 100	--階段變數
	local PH1Index = 101	
	local PH2Index = 102
	local PH3Index = 103
	local PH4Index = 104
	--階段名稱
	local PH0_Name = "SC_PE_ZONE18_01_PHNAME04" 	--稍微安分
	local PH1_Name = "SC_PE_ZONE18_01_PHNAME00" 	--欺負弱小[116402]
	local PH2_Name = "SC_PE_ZONE18_01_PHNAME01"	--另類的防衛陣形
	local PH3_Name = "SC_PE_ZONE18_01_PHNAME02"	--難纏的硬殼
	local PH4_Name = "SC_PE_ZONE18_01_PHNAME03"	--巨大惡魔竄出
	--階段敘述
	local PH0_Desc = "SC_PE_ZONE18_01_M44"		--經過上一次[<S>116402]的攻擊，[<S>115600]稍微安分了些，或許什麼時候又會不怕死的抓[<S>104286]來吃。
	local PH1_Desc = "SC_PE_ZONE18_01_M40"		--雖然[<S>116402]相當恐怖，但他的肉質也十分鮮美，連[<S>115600]都忍不住抓來吃。
	local PH2_Desc = "SC_PE_ZONE18_01_M41"		--[<S>104485]準備發起攻擊了，要準備好[<S>208197]來抵擋[<S>104485]。
	local PH3_Desc = "SC_PE_ZONE18_01_M42"		--[<S>116402]出現了，要將他引進熱泉，但也要小心別跌下去，否則熟的就不只是[<S>116402]。
	local PH4_Desc = "SC_PE_ZONE18_01_M43"		--巨大的[104296]出現了，使用相同的方法擊倒他。
	--新增階段
	PE_AddPhase( PEIndex , PH0Index , PH0_Name , PH0_Desc , 0 , 0 , 0 , 0 )	-- 新增階段0
	PE_AddPhase( PEIndex , PH1Index , PH1_Name , PH1_Desc , 0 , 0 , 0 , 0 )	-- 新增階段1
	PE_AddPhase( PEIndex , PH2Index , PH2_Name , PH2_Desc , 0 , 0 , 0 , 0 )	-- 新增階段2
	PE_AddPhase( PEIndex , PH3Index , PH3_Name , PH3_Desc , 0 , 0 , 1 , 0 )	-- 新增階段3
	PE_AddPhase( PEIndex , PH4Index , PH4_Name , PH4_Desc , 0 , 0 , 1 , 0 )	-- 新增階段3
	--階段回傳變數
	local OB0Index = 1000
	local OB1Index = 1001
	local OB2Index = 1002
	local OB3Index = 1003
	local OB4Index = 1004
	local OB5Index = 1005
	local OB6Index = 1006
	--階段成功條件
	local OB0_Name = "SC_PE_ZONE18_01_OBNAME05" 	-- 距離下次開始等待時間
	local OB1_Name = "SC_PE_ZONE18_01_OBNAME00" 	-- 補獲[<S>104286]
	local OB2_Name = "SC_PE_ZONE18_01_OBNAME01"	-- 距離[<S>104485]到達時間剩餘
	local OB3_Name = "SC_PE_ZONE18_01_OBNAME02"	-- 殺死大型亞基丁
	local OB4_Name = "SC_PE_ZONE18_01_OBNAME03"	-- 殺死深紅吞食者
	local OB5_Name = "SC_PE_ZONE18_01_OBNAME04"	-- 深紅吞噬者靠近營地
	local OB6_Name = "SC_PE_ZONE18_01_OBNAME06"	-- 包圍營地的亞基丁
	--階段成功條件敘述
	local OB0_Desc = "SC_PE_ZONE18_01_OB0_DESC"	--等待重置時間結束
	local OB1_Desc = "SC_PE_ZONE18_01_OB1_DESC" --使用捕捉[<S>104286]的麻繩獵捕[<S>104286]，麻繩可以在接到[116398]的委託後取得。
	local OB2_Desc = "SC_PE_ZONE18_01_OB2_DESC" --必須在[<S>104485]到達到達之前在所有指示的地方堆置[116392]。
	local OB3_Desc = "SC_PE_ZONE18_01_OB3_DESC" --使用剛才排列的[<S>116392]將[<S>104485]引導至熱泉中再擊殺他們。
	local OB4_Desc = "SC_PE_ZONE18_01_OB4_DESC" --巨大的[104296]出現了，他將是這場危機的最後一頭[116402]，使用相同的方法擊倒他。
	local OB5_Desc = "SC_PE_ZONE18_01_OB5_DESC" --千萬不能讓恐佈的深紅吞噬者到營地。
	local OB6_Desc = "SC_PE_ZONE18_01_OB6_DESC" --營地遭到憤怒亞基丁的包圍而陷入危險，請立刻消滅這些亞基丁
	
	local PH1Require = ZONE18_PE01_Var["PH1Require"]
	local PH2Require = ZONE18_PE01_Var["PH2Time"]
	local PH3Require = ZONE18_PE01_Var["PH3Require"]
	local PH4Require = ZONE18_PE01_Var["PH4Require"]	
	local MaxHunterDead = ZONE18_PE01_Var["MaxHunterDead"]
	local NumInTown = ZONE18_PE01_Var["NumInTown"]


	PE_PH_AddObjective_TimeLimit( PEIndex , PH0Index , OB0Index , OB0_Name , OB0_Desc , "ZONE18_PE01_ResetTime" , ZONE18_PE01_Var["ResetTime"] *1000 , 0 ,  true )
	-- 獵捕小亞基丁	
	PE_PH_AddObjective_EqualAndGreater( PEIndex , PH1Index , OB1Index , OB1_Name , OB1_Desc , "ZONE18_PE01_Var_SmallAgidinDead" , 0 , PH1Require ,  true )
	
	-- 新增一個目標，階段1成功條件：倒數時間結束
	PE_PH_AddObjective_TimeLimit( PEIndex , PH2Index , OB2Index , OB2_Name , OB2_Desc , "ZONE18_PE01_PH2Time" , ZONE18_PE01_Var["PH2Time"]*1000 , 0 ,  true )
	
	-- 新增一個目標，階段2成功條件：殺死硬殼亞基丁
	PE_PH_AddObjective_EqualAndGreater( PEIndex , PH3Index , OB3Index , OB3_Name , OB3_Desc , "ZONE18_PE01_Var_BigAgidinDead" , 0 , PH3Require ,  true )	
	
	-- 新增一個目標，階段3成功條件：殺死巨大沙暴亞基丁
	PE_PH_AddObjective_EqualAndGreater( PEIndex , PH4Index , OB4Index , OB4_Name , OB4_Desc , "ZONE18_PE01_Var_BossDead" , 0 , 1 ,  true )	
	
	-- 新增一個目標，階段2,3,4失敗條件：獵人撤退
	--PE_PH_AddObjective_EqualAndGreater( PEIndex , PH2Index , OB5Index , OB5_Name , OB5_Desc , "ZONE18_PE01_Var_MaxHunterDead" , 0 , MaxHunterDead ,  false )
	--PE_PH_AddObjective_EqualAndGreater( PEIndex , PH3Index , OB5Index , OB5_Name , OB5_Desc , "ZONE18_PE01_Var_MaxHunterDead" , 0 , MaxHunterDead ,  false )
	PE_PH_AddObjective_EqualAndGreater( PEIndex , PH4Index , OB5Index , OB5_Name , OB5_Desc , "ZONE18_PE01_Var_BigInTown" , 0 , 1 ,  false )	
	--新增一個失敗目標，階段2.3失敗：包圍營地的巨大亞基丁過多
	PE_PH_AddObjective_EqualAndGreater( PEIndex , PH3Index , OB6Index , OB6_Name , OB6_Desc , "ZONE18_PE01_Var_MaxAgidinInTown" , 0 , NumInTown ,  false )
	PE_PH_AddObjective_EqualAndGreater( PEIndex , PH4Index , OB6Index , OB6_Name , OB6_Desc , "ZONE18_PE01_Var_MaxAgidinInTown" , 0 , NumInTown ,  false )	

	-- 設定階段連接
	PE_PH_SetNextPhase( PEIndex , PH0Index , PH1Index )
	PE_PH_SetNextPhase( PEIndex , PH1Index , PH2Index )
	PE_PH_SetNextPhase( PEIndex , PH2Index , PH3Index )
	PE_PH_SetNextPhase( PEIndex , PH3Index , PH4Index )
	-- 設定組隊/團隊階段獎勵積分
--	PE_PH_SetBonusScore( PEIndex , PH1Index , 20 , 20 )
--	PE_PH_SetBonusScore( PEIndex , PH2Index , 40 , 20 )
--	PE_PH_SetBonusScore( PEIndex , PH3Index , 80 , 20 )
--	PE_PH_SetBonusScore( PEIndex , PH4Index , 100 , 40 )
	
	-- 設定目標達成的回摳函式
	PE_OB_SetCallBackOnAchieve( PEIndex , "LuaPE_ZONE18_PE01_OB_OnAchieve" )
	
	-- 設定事件結束的結算回摳函式
	PE_SetCallBackOnBalance( PEIndex , "LuaPE_ZONE18_PE01_FinalExchange" )

	-- 事件啟動
	PE_Start( PEIndex , PH0Index )

end

function LuaPE_ZONE18_PE01_OB_OnAchieve( PEIndex, PHIndex , OBIndex )
	debugmsg(0,0,"PHIndex = "..PHIndex.." & OBIndex = "..OBIndex)
	local Controller = ZONE18_PE01_Var["Controller"]	-- 控制物件
	local Creater = ZONE18_PE01_Var["Creater"]	-- 控制物件
	local Phase = ZONE18_PE01_Phase
--	Local White = ZONE18_PE01_Var["White"]
--	Local White2 = ZONE18_PE01_Var["White2"]
	if	PHIndex == 100 and OBIndex == 1000 then
		CallPlot( Controller, "LuaPE_ZONE18_PE01_PhaseDO", Phase )		--[<S>115600]又開始繼續獵捕[104286]。
		BeginPlot( Controller, "LuaPE_ZONE18_PE01_DelArt", 0 )
		CallPlot( Controller, "LuaPE_ZONE18_PE01_Add_Number_PerTime" )
	elseif PHIndex == 101 and OBIndex == 1001 then 	-- PE開始-->進入第一階段
		ZONE18_PE01_TotalHunterDead = 0
		CallPlot( Controller, "LuaPE_ZONE18_PE01_PhaseDO", Phase )		--[<S>104485]出現了，所有人準備[<S>208197]。
--		BeginPlot( Controller, "LuaPE_ZONE18_PE01_CreateControl", 0 )		--白牙裝傻
		BeginPlot(Controller,"LuaPE_ZONE18_PE01_Phase2_Start",0)		--出現指標跟獵人

	elseif PHIndex == 102 and OBIndex == 1002 then 	-- 滿足第一階段-->進入第二階段 

		CallPlot( Controller, "LuaPE_ZONE18_PE01_PhaseDO", Phase )		--離他們遠一點！小心不要激怒他們...不然連[116392]都保不住你...
		BeginPlot(Creater,"LuaPE_ZONE18_PE01_Phase3_Start",0)			--出現硬皮亞基丁
		BeginPlot(Creater,"LuaPE_ZONE18_PE01_Phase3_NPCsay",0)			--獵人開始廢話	
		BeginPlot(Controller,"LuaPE_ZONE18_PE01_Creater_SetCount_Agidin_In_Town",0)	
	elseif PHIndex == 103 and OBIndex == 1003 then -- 滿足第二階段-->進入第三階段		
		CallPlot( Controller, "LuaPE_ZONE18_PE01_PhaseDO", Phase )		--[<S>104487]出現了！用相同的方法殺死他！
		BeginPlot(Creater,"LuaPE_ZONE18_PE01_Phase4_Start",0)			--出現巨大亞基丁
	elseif PHIndex == 104 and OBIndex == 1004 then -- 滿足第三階段	 驅趕完成	
		CallPlot( Controller, "LuaPE_ZONE18_PE01_PhaseDO", Phase )		--[<S>115600]享受了一頓美味的[116402]大餐，並打算繼續獵捕[104286]。	
		sleep(10)
		BeginPlot( Controller , "LuaPE_ZONE18_PE01_Reset" , 0 )			-- 重置公眾任務
	elseif OBIndex == 1005 then --獵人撤退
		CallPlot( Controller, "LuaPE_ZONE18_PE01_PhaseDO", 30 )  		-- 所有的獵人都撤退了，營地即將面臨危機。
		BeginPlot( Controller, "LuaPE_ZONE18_PE01_Art", 0 )
		sleep(20)
		BeginPlot( Controller , "LuaPE_ZONE18_PE01_Reset" , 0 )			-- 重置公眾任務
	elseif OBIndex == 1006 then --營地被包圍
		CallPlot( Controller, "LuaPE_ZONE18_PE01_PhaseDO", 32 )  		-- 所有的獵人都撤退了，營地即將面臨危機。
		BeginPlot( Controller, "LuaPE_ZONE18_PE01_Art", 0 )
		sleep(20)
		BeginPlot( Controller , "LuaPE_ZONE18_PE01_Reset" , 0 )			-- 重置公眾任務
	end
end
		
function LuaPE_ZONE18_PE01_FinalExchange( PEIndex , GUID , Score )
	local LV = 57
	local MapID = ZONE18_PE01_Var["MapID"]
	if LuaPE_KS_CheckLv( GUID, LV, MapID ) == false then return end
	local ExCha_Ratio = ZONE18_PE01_Var["ExCha_Ratio"]
	local MaxBonus = ZONE18_PE01_Var["MaxBonus"]
	local AddScore = ( ZONE18_PE01_Var["MaxHunter"] - ZONE18_PE01_TotalHunterDead ) * 20
--	local CountMachine = ZONE18_PE01_Var["CountMachine"]
	--say(GUID,GUID)
	DelBodyItem(GUID,208197,CountBodyItem ( GUID, 208197 ))				--刪除所有人身上的自鳴石
	if Score > 0	and	 DW_CheckMap( GUID, MapID ) == true	then
		if Score > 50	and	ZONE18_PE01_BigADInTown < 3	and	ZONE18_PE01_RedADInTown < 1	then
			Score = Score + AddScore
			debugmsg(0,0,GetName(GUID).." get bonus "..AddScore.." point")
		end
		if Score < ExCha_Ratio and Score > ExCha_Ratio/2 then
			CallPlot(GUID, "YOYO_GetTokenValue", 2, 1);--古代遺物"
		elseif Score > ExCha_Ratio then
			if Score >= MaxBonus then Score = MaxBonus end
			CallPlot(GUID, "YOYO_GetTokenValue", 2, math.floor( Score/ExCha_Ratio ));--古代遺物"
		end
		debugmsg(0,0,GetName(GUID).." total get "..Score.." point")
	end
end

--==================================================--
--  階段/訊息處理區                                 --
--==================================================--
--階段處理
function LuaPE_ZONE18_PE01_PhaseDO( Phase )

	local Total = ZONE18_PE01_TotalScore
	if Phase == 0 then
		ZONE18_PE01_Phase = 1
		LuaPE_ZONE18_PE01_Message( 102 , C_SYSTEM ) -- 第一階段訊息		
	elseif Phase == 1 then
		ZONE18_PE01_Phase = 2
		LuaPE_ZONE18_PE01_Message( 1 , C_SYSTEM ) -- 第一階段訊息
	elseif Phase == 2 then
		ZONE18_PE01_Phase = 3
		LuaPE_ZONE18_PE01_Message( 2 , C_DEFAULT ) -- 第二階段訊息
	elseif Phase == 3 then
		ZONE18_PE01_Phase = 4
		LuaPE_ZONE18_PE01_Message( 3 , C_DEFAULT ) -- 第三階段訊息
	elseif Phase == 4 then	
		ZONE18_PE01_Phase = 5
		LuaPE_ZONE18_PE01_Message( 4 , C_DEFAULT ) -- 第四階段訊息
	elseif Phase == 30 then
		debugmsg( 0, 0, "This PE Total Give Bonus = " ..Total )
		LuaPE_ZONE18_PE01_Message( 30 , C_DEFAULT ) -- 獵人都撤退
	elseif Phase == 32 then
		debugmsg( 0, 0, "This PE Total Give Bonus = " ..Total )
		LuaPE_ZONE18_PE01_Message( 32 , C_DEFAULT ) -- 獵人都撤退
	end
end

function LuaPE_ZONE18_PE01_Message( Index , Color )
	local MapID = ZONE18_PE01_Var["MapID"]		-- 
	local RoomID = ZONE18_PE01_Var["RoomID"]		
	local Message = ZONE18_PE01_Message
	Color = "0xffffff00"	-- 強制訊息為黃色
	local AreaPlayer = LuaPE_KS_GetAreaPlayer( MapID, RoomID )
	if Index == 102 then
		debugmsg( 0, 0, "PE Start")
		ScriptMessage( OwnerID(), -1 , 1 , Message[Index] , Color )
		ScriptMessage( OwnerID(), -1 , 0 , Message[Index] , Color )
		debugmsg( 0, 0, "PE Start!!!")
	else
		for i = 1 , table.getn(AreaPlayer) do
			ScriptMessage( OwnerID(), AreaPlayer[i] , 1 , Message[Index] , Color )			
			ScriptMessage( OwnerID(), AreaPlayer[i] , 0 , Message[Index], Color )
		end
	end
end

--==================================================--
--    階段一處理區                   				  	--
--==================================================--
function LuaPE_ZONE18_PE01_Add_Number_PerTime()
	local SmallAgidinDead
	While	ZONE18_PE01_Phase == 1	do
		sleep(150)
		SmallAgidinDead = ZONE18_PE01_Var["agidin"]
		SmallAgidinDead = SmallAgidinDead +1
		ZONE18_PE01_Var["agidin"] = SmallAgidinDead
		PE_SetVar( "ZONE18_PE01_Var_SmallAgidinDead" , SmallAgidinDead )
	end
end

--==================================================--
--    階段二處理區                   				  	--
--==================================================--
function LuaPE_ZONE18_PE01_Phase2_Start()
	debugmsg(0,0,"Phase 2")
	local FlagNum = ZONE18_PE01_Var["FlagNum"]
	local FlagID = ZONE18_PE01_Var["FlagID"]
	local Mark = {}
	local Phase = ZONE18_PE01_Phase
	local Hunter = ZONE18_PE01_Var["HunterID"]
	local FourHunter = {}
	local msg = ZONE18_PE01_Message 
	local ShowMark = {}
	for i = 1 , FlagNum+1 do						--顯示所有指示位置並放上觸碰劇情
		Mark[i] =    Lua_DW_CreateObj("flag" ,116391,FlagID[2],i)		
		ShowMark[i] =    Lua_DW_CreateObj("flag" ,116467,FlagID[2],i)		
		--say(Mark[i],"i am number "..i)
		WriteRoleValue( Mark[i] , EM_RoleValue_Register+2, 0 )
		WriteRoleValue( Mark[i] , EM_RoleValue_Register+1, i )		 
		SetPlot(Mark[i],"touch","LuaPE_ZONE18_PE01_TouchMark",10)
		table.insert( ZONE18_PE01_Obj , Mark[i] )
		table.insert( ZONE18_PE01_Obj , ShowMark[i] )
	end
	ZONE18_PE01_Var["Mark"] = Mark						--將指示物傳到全域變數
	ZONE18_PE01_Var["ShowMark"] = ShowMark
	for i = 1,4 do								--建立四隻獵人到各處去放自鳴石
		--say(OwnerID(),Hunter[i])
		FourHunter[i] =    KS_CreateObjMode( Hunter[i], FlagID[4] , 2 , 30, 1, 1 )

		SetPlot(FourHunter[i],"dead","LuaPE_ZONE18_PE01_HunterDead",100)
		table.insert( ZONE18_PE01_Obj , FourHunter[i] )
		table.insert( ZONE18_PE01_Hunter , FourHunter[i] )
		WriteRoleValue( FourHunter[i] , EM_RoleValue_LiveTime , 1800 )
		CallPlot(FourHunter[i],"LuaPE_ZONE18_PE01_Phase2_FourHunterAI",FlagID[4],i+i+1)  --Flag , FlagNum
	end
	ZONE18_PE01_Var["NowHunter"] = ZONE18_PE01_Var["NowHunter"] + 4		--已出場獵人數+4
	Npcsay(FourHunter[rand(3)+1],msg[5])
	sleep(40)
	Npcsay(FourHunter[rand(3)+1],msg[6])

end

function LuaPE_ZONE18_PE01_TouchMark() --register+1 =>代表他的號碼       register+2 =>代表他的石頭   register+3 => 代表他是否正在被放置
	local CastBarStatus
	local PEIndex = ZONE18_PE01_PEIndex
	local MapID = ZONE18_PE01_Var["MapID"]				-- 區域地圖編號
	local Bonus = ZONE18_PE01_Var["Bonus"]
	local Phase = ZONE18_PE01_Phase
	local ShowMark = ZONE18_PE01_Var["ShowMark"]
	if ReadRoleValue( TargetID(), EM_RoleValue_Register+3 ) == 1 then
		ScriptMessage( TargetID(), OwnerID(), 1, "[SYS_AUCTION_WAIT_NEXT]", 0 )	--忙碌中，請稍候再試。
	elseif	CountBodyItem ( OwnerID(), 208197 ) < 1 then
		ScriptMessage( TargetID(), OwnerID(), 1, "[SC_PE_ZONE18_01_M13]", 0 )	--沒有自鳴石，請找獵人取得	
	else	
		DW_CancelTypeBuff(68,  OwnerID() )
		BeginCastBar( OwnerID(), "[SC_SC_PE_ZONE18_01_PUTING]", 100, ruFUSION_ACTORSTATE_CROUCH_BEGIN, ruFUSION_ACTORSTATE_CROUCH_END, 0 )	--蹲下放置
		WriteRoleValue( TargetID() , EM_RoleValue_Register+3, 1 )										--指示物忙碌中
		while true do																--成功則放置自鳴石給予分數,失敗就站起來
			sleep( 2 )
			CastBarStatus = CheckCastBar( OwnerID() )
			if ( CastBarStatus > 0) then --點擊成功
				DelBodyItem(OwnerID(),208197,1)
				Local Stone = Lua_DW_CreateObj("obj",116392,TargetID())
				table.insert( ZONE18_PE01_Obj , Stone )				
				WriteRoleValue( TargetID() , EM_RoleValue_Register+2, Stone )
				EndCastBar( OwnerID(), CastBarStatus )
				SetPlot( TargetID(), "touch", "", 0 )
				WriteRoleValue( TargetID(), EM_RoleValue_Register+3, 0 )
				--say(TargetID(),"stone = "..ReadRoleValue( TargetID(), EM_RoleValue_Register+2 )..";StoneNum = "..ReadRoleValue( TargetID(), EM_RoleValue_Register+1 ))
				BeginPlot(TargetID(),"LuaPE_ZONE18_PE01_DontLook",0)
				BeginPlot(ShowMark[ReadRoleValue( TargetID(), EM_RoleValue_Register+1 )],"LuaPE_ZONE18_PE01_DontLook",0)
				CallPlot(TargetID(),"LuaPE_KS_SetBonus", PEIndex, MapID, Bonus[2],OwnerID() )         -- 給予分數
				ZONE18_PE01_TotalScore = ZONE18_PE01_TotalScore + Bonus[Phase]
				break
			elseif ( CastBarStatus < 0 ) then --點擊中斷
				WriteRoleValue( TargetID(), EM_RoleValue_Register+3, 0 )
				EndCastBar( OwnerID(), CastBarStatus )
				break
			end			
		end		
	end		
		
		
end

function LuaPE_ZONE18_PE01_Phase3_FourHunterTalk()								---獵人的對話
	local msg = ZONE18_PE01_Message 
	LoadQuestOption( OwnerID() )
	AddSpeakOption(OwnerID(),TargetID(),msg[11],"LuaPE_ZONE18_PE01_Phase_GetStone",0)	--索取自鳴石

end

function LuaPE_ZONE18_PE01_Phase_GetStone()
	local Phase = ZONE18_PE01_Phase
	local msg = ZONE18_PE01_Message 
	if	CountBodyItem( OwnerID(), 208197 ) > 0	then
		SetSpeakDetail( OwnerID(), "[SC_SC_PE_ZONE18_01_GETSTONE0]" )	
	elseif EmptyPacketCount( OwnerID() ) == 0  then
		SetSpeakDetail( OwnerID(), "[K_08MID_DIALOG8]")--您的背包空間不足，請清理一下再來吧。
	elseif	Phase == 2	then			
		SetSpeakDetail( OwnerID(), "[SC_SC_PE_ZONE18_01_GETSTONE2]" )			
		GiveBodyItem ( OwnerID(), 208197, 1 )	
	elseif	HateListCount( TargetID() ) == 0	then
		SetSpeakDetail( OwnerID(), "[SC_SC_PE_ZONE18_01_GETSTONE3]" )			
		GiveBodyItem ( OwnerID(), 208197, 1 )	
	else
		SetSpeakDetail( OwnerID(), "[SC_SC_PE_ZONE18_01_GETSTONE4]" )
		GiveBodyItem ( OwnerID(), 208197, 1 )	
	end
end


function LuaPE_ZONE18_PE01_Phase2_FourHunterAI(FlagID,FlagNum)  --register+1 => 是否有目標		---獵人的AI
	local Mark = ZONE18_PE01_Var["Mark"]
	SetModeEx( OwnerID() , EM_SetModeType_Searchenemy , false )		-- 索敵
	CallPlot(OwnerID(),"LuaPE_ZONE18_PE01_AttackEnable")
	sleep(20)
	WriteRoleValue(OwnerID() , EM_RoleValue_IsWalk, 0 )			---用跑的		
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+1, 0 )	--目前沒有處理任何共鳴石
	if	FlagID ~= nil and FlagNum ~= nil	then
		DW_MoveToFlag(OwnerID(),FlagID , FlagNum , 0 ,1)	
		DW_MoveToFlag(OwnerID(),FlagID , FlagNum+1 , 0 ,1)
	end
	CallPlot(OwnerID(),"LuaPE_ZONE18_PE01_Hunter_Del")
	While ZONE18_PE01_Phase	== 2 do					---2階段的時候
		local Phase = ZONE18_PE01_Phase	
		AddBuff( OwnerID() , 506303 , 0 , -1 ) -- 防AE Buff	
		if CheckID( OwnerID() ) ~= true or ReadRoleValue( OwnerID() , EM_RoleValue_IsDead ) == 1 then
			LuaPE_KS_StopAttack( OwnerID() ) --停止攻擊
			break
		elseif Phase > 4 then
			LuaPE_KS_StopAttack( OwnerID() ) --停止攻擊
			break			
		end

		CastSpell( OwnerID(), OwnerID(), 496180 )				--搜尋共鳴石
		local target = ReadRoleValue( OwnerID(), EM_RoleValue_Register+1 )	--register+1 = 目標
		--say(OwnerID(),"My Target is "..target)

		if	target > 0 and CheckID(target) == true then
			--say(OwnerID(),"so I close "..Target)
			DW_GetClose(OwnerID(),target,20)				--靠近目標，沒靠近前不會停
			while GetDistance( OwnerID() , target ) > 20 do
			sleep(10)
			end
			--say(OwnerID(),ReadRoleValue( target, EM_RoleValue_Register+3 ).."  "..HateListCount( OwnerID() ))
			--移動後判斷,指示物不忙碌,指示物上沒有共鳴石,自己目前不在戰鬥中則
			if ReadRoleValue( target, EM_RoleValue_Register+3 ) == 0 and ReadRoleValue( target, EM_RoleValue_Register+2 ) == 0 and HateListCount( OwnerID() ) == 0 then
				--say(OwnerID(),"i am working")
				WriteRoleValue( target , EM_RoleValue_Register+3, 1 )					---目標忙碌
				CastSpell( OwnerID(), target, 496202 )							---放置
				sleep(5)
				local MagicID = ReadRoleValue( OwnerID(), EM_RoleValue_SpellMagicID )			---檢查施法狀態
				--debugmsg( 0,0,"MagicID = "..MagicID)

				if MagicID ~= 0 and HateListCount( OwnerID() ) == 0 then				---仍然保持施法
				--say(OwnerID(),"i am CROUCH")				
					PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_CROUCH_BEGIN )
					PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_CROUCH_LOOP )
				--say(OwnerID(),"i cast "..ReadRoleValue( OwnerID(), EM_RoleValue_SpellMagicID ))
					for i = 1 , 11 do
						if	ZONE18_PE01_Phase == 2	then
							sleep(10)
						else
							break
						end
					end
				--say(OwnerID(),"i cast "..ReadRoleValue( OwnerID(), EM_RoleValue_SpellMagicID ))
					if	HateListCount( OwnerID() ) == 0 then
						PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_CROUCH_END)
					end
				end
				WriteRoleValue( target , EM_RoleValue_Register+3, 0 )
			end
			if	ReadRoleValue( target, EM_RoleValue_Register+2 ) ~= 0 then		--代表完成
				WriteRoleValue( OwnerID() , EM_RoleValue_Register+1, 0 )
			end
		else
			WriteRoleValue( OwnerID() , EM_RoleValue_Register+1, 0 )
		end
		if	HateListCount( OwnerID() ) == 0 then						--如果沒有在戰鬥就隨機移動+說話
			LuaPE_ZONE18_PE01_RandomMove()			
		end
		sleep(10)
	end
	--debugmsg(0,0,"ZONE18_PE01_PHASE = "..ZONE18_PE01_Phase)
	local FlagID = ZONE18_PE01_Var["FlagID"]
	while	(ZONE18_PE01_Phase > 2 or ReadRoleValue( OwnerID(), EM_RoleValue_IsDead) == 1) do										---第三階段的時候
		
		
		if	DW_CheckDis( OwnerID() , FlagID[3] , ZONE18_PE01_Move_FlagNum , 30 ) == false and HateListCount( OwnerID() ) == 0 then		--移動
			DW_MoveToFlag(OwnerID(),FlagID[4] , 10+ZONE18_PE01_Move_FlagNum , 30 ,1)	
			
			sleep(5)
			AdjustFaceDir( OwnerID() ,Mark[ZONE18_PE01_Move_FlagNum], 0 )	
		elseif	HateListCount( OwnerID() ) == 0	then
			sleep(20)
			CastSpell( OwnerID(), OwnerID(), 496218 )			
		end
		sleep(10)
	end

end

function LuaPE_ZONE18_PE01_RandomMove()
	local time = ks_MoveToObj( OwnerID(), OwnerID(), 30 )--自身周圍亂數移動
	local msg = ZONE18_PE01_Message
	local Phase = ZONE18_PE01_Phase

	if ReadRoleValue( OwnerID(), EM_RoleValue_Register+2 ) < 10 then					---說話
		WriteRoleValue( OwnerID() , EM_RoleValue_Register+2, ReadRoleValue( OwnerID(), EM_RoleValue_Register+2 )+1 )
	else
		if	Phase == 2 then
			Npcsay(OwnerID(),msg[rand(3)+7])
		else
			Npcsay(OwnerID(),msg[rand(3)+7])			
		end
		WriteRoleValue( OwnerID() , EM_RoleValue_Register+2, 0 )		
	end

	sleep(time+10)
end

function LuaPE_ZONE18_PE01_Phase2_Search_Mark()			---法數,尋找沒有自鳴石的指示物
	--say(TargetID(),ReadRoleValue( TargetID(), EM_RoleValue_Register+2 ).."   "..ReadRoleValue( OwnerID(), EM_RoleValue_Register+1 ))
	--say(ReadRoleValue( OwnerID(), EM_RoleValue_Register+1 ), " i am "..ReadRoleValue( OwnerID(), EM_RoleValue_Register+1 ))
	if	ReadRoleValue( TargetID(), EM_RoleValue_Register+2 ) == 0 and ReadRoleValue( OwnerID(), EM_RoleValue_Register+1 ) == 0 and ReadRoleValue( TargetID() , EM_RoleValue_OrgID) == 116391 then
		WriteRoleValue( OwnerID() , EM_RoleValue_Register+1, TargetID() )
		return true
	end
	return false
end

function LuaPE_ZONE18_PE01_Phase2_Set_Stone()			---放置自鳴石,加入陣列,看不見指示物
	Local Stone = Lua_DW_CreateObj("obj",116392,TargetID())
	local ShowMark = ZONE18_PE01_Var["ShowMark"]
	--say(OwnerID(),"i put stone")
	--say(TargetID(),"i have stone")
	table.insert( ZONE18_PE01_Obj , Stone )				
	WriteRoleValue( TargetID() , EM_RoleValue_Register+2, Stone )
	SetPlot( TargetID(), "touch", "", 0 )
	WriteRoleValue( TargetID(), EM_RoleValue_Register+3, 0 )
	--say(TargetID(),"stone = "..ReadRoleValue( TargetID(), EM_RoleValue_Register+2 )..";StoneNum = "..ReadRoleValue( TargetID(), EM_RoleValue_Register+1 ))
	BeginPlot(TargetID(),"LuaPE_ZONE18_PE01_DontLook",0)	
	BeginPlot(ShowMark[ReadRoleValue( TargetID(), EM_RoleValue_Register+1 )],"LuaPE_ZONE18_PE01_DontLook",0)	
	return true
end

function LuaPE_ZONE18_PE01_Check_Agidin()
	if	ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 104485 or ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 104487	then
		return true
	end
	return false
end

function LuaPE_ZONE18_PE01_Attack_Agidin()
	SetAttack(OwnerID(),TargetID())
end

--==================================================--
--    階段三處理區                   				  	--
--==================================================--

function LuaPE_ZONE18_PE01_Phase3_Start()				---第三階段開始		---亞基丁rigister+1是記錄creater
	local FlagID = ZONE18_PE01_Var["FlagID"]						---亞基丁rigister+2是記錄他目前被燙幾次,如果被燙次數>=這個泉的PID,就不會再被燙
	local Creater = OwnerID()								
	local MaxAgidin = ZONE18_PE01_Var["MaxMst"]
	local Phase = ZONE18_PE01_Phase 			--階段		
	local MstRestTime = ZONE18_PE01_Var["CreateTime"]
	WriteRoleValue( Creater , EM_RoleValue_Register+1, 0 )
	sleep(50)
	local BigAgidinNum = 0
	while  1  do							---每n秒產生一隻亞基丁
		local HardAgidin = Lua_DW_CreateObj("flag" ,104485,FlagID[1],0)
		BigAgidinNum = BigAgidinNum +1
		table.insert( ZONE18_PE01_Obj , HardAgidin )
		table.insert( ZONE18_PE01_Agidin , HardAgidin )
		WriteRoleValue( HardAgidin , EM_RoleValue_LiveTime , 1800 )
		WriteRoleValue( Creater , EM_RoleValue_Register+1, ReadRoleValue( Creater, EM_RoleValue_Register+1 )+1)	--硬殼亞基丁數量+1
		WriteRoleValue( HardAgidin , EM_RoleValue_Register+1, Creater )
		SetPlot(HardAgidin,"dead","LuaPE_ZONE18_PE01_BigAgidinDead",100)
		sleep(20)
		WriteRoleValue(HardAgidin , EM_RoleValue_IsWalk, 0 )			---用跑的		
		BeginPlot(HardAgidin,"LuaPE_ZONE18_PE01_Phase3_MonsterAI",0)		---大亞基丁AI
		sleep(MstRestTime-40)
--		while ReadRoleValue( Creater, EM_RoleValue_Register+1 ) >= MaxAgidin do	---只要亞基丁數量等於指定數量則停止生產
--			sleep(10)
--		end
		sleep(20)
--		if	ZONE18_PE01_Phase  ~= 3	then
--			break
--		end
		if	BigAgidinNum > 50	then
			break
		end

	end
end


function LuaPE_ZONE18_PE01_Phase3_MonsterAI()
	local FlagID = ZONE18_PE01_Var["FlagID"]
	local GoToFlag = 1
	local FlagNum = ZONE18_PE01_Var["FlagNum"]
	local Mark = ZONE18_PE01_Var["Mark"]
	local InPool = ZONE18_PE01_Run_In_Pool
	local Message = ZONE18_PE01_Message
	local AllHunter = ZONE18_PE01_Hunter								---叫所有沒在戰鬥的獵人攻擊自己
	local AllHunterNum = table.getn(AllHunter)
--	local white = ZONE18_PE01_Var["White2"]

	AddBuff(OwnerID(),506981,0,-1)
	SetDefIdleMotion( OwnerID(), ruFUSION_MIME_RUN_FORWARD )
	while GoToFlag < FlagNum do
		--say(OwnerID(),"i am going to "..GoToFlag)
		if ZONE18_PE01_Move_FlagNum < GoToFlag then					---更新亞基丁的最前端位置
			ZONE18_PE01_Move_FlagNum = GoToFlag
		end								---跑完所有旗標前都要做這個判斷
 		local X , Y , Z							---用MOVEDIRECT移動
		X = GetMoveFlagValue( FlagID[1] , GoToFlag , EM_RoleValue_X )
		Y = GetMoveFlagValue( FlagID[1] , GoToFlag , EM_RoleValue_Y )
		Z = GetMoveFlagValue( FlagID[1] , GoToFlag , EM_RoleValue_Z )
		while HateListCount( OwnerID() ) == 0 and DW_CheckDis( OwnerID() , FlagID[1] , GoToFlag , 5 ) == false do	---被攻擊就停止移動
			--DW_MoveToFlag(OwnerID(),FlagID[1] , GoToFlag , 0 ,1)				---跑到GOTOFLAG的位置
			MoveDirect( OwnerID(), X , Y , Z )
			sleep(2)
		end
		while HateListCount( OwnerID() ) ~= 0 and GoToFlag == 1	do	---被攻擊就停止移動
			SetDefIdleMotion( OwnerID(), ruFUSION_MIME_IDLE_STAND )
			--DW_MoveToFlag(OwnerID(),FlagID[1] , GoToFlag , 0 ,1)				---跑到GOTOFLAG的位置
			sleep(10)
		end
		SetDefIdleMotion( OwnerID(), ruFUSION_MIME_RUN_FORWARD )
		if	ReadRoleValue( Mark[GoToFlag], EM_RoleValue_Register+2 ) == 0	or	HateListCount( OwnerID() ) ~= 0		then	---如果沒擺自鳴石或被打就BREAK
			if	ReadRoleValue( Mark[GoToFlag] , EM_RoleValue_Register+4 ) == 0	then		---檢查這個位置是否被突破過
				WriteRoleValue( Mark[GoToFlag] , EM_RoleValue_Register+4, 1 )
				if	InPool[1] == 1	then
					CallPlot(OwnerID(),"LuaPE_ZONE18_PE01_Phase3_SimonHunter",Mark[GoToFlag])
					CallPlot(OwnerID(),"LuaPE_ZONE18_PE01_Phase3_SimonHunter2",Mark[GoToFlag])
				else							---如果是第一次闖過的話,說某句話
					local temp = AllHunter[rand(AllHunterNum-1)+1] 
					if	ReadRoleValue( temp, EM_RoleValue_IsDead) == 0 then
						if	HateListCount( OwnerID() ) ~= 0	then
							debugmsg(0,0,"player fight")
							NPCsay(temp ,Message[103])
						elseif	CheckBuff( OwnerID() , 506981 ) == true	then
							NPCsay(temp ,Message[21])
						elseif	CheckBuff( OwnerID() , 507666 ) == true	or CheckBuff( OwnerID() , 507667 ) == true or CheckBuff( OwnerID() , 507668 ) == true then
							NPCsay(temp ,Message[22])
						elseif	CheckBuff( OwnerID() , 507669 ) == true	then
							NPCsay(temp ,Message[26])
						end
					end
				end			
				InPool[1] = 1
			end
			
			break
		end
		GoToFlag = GoToFlag + 1								---檢測下一個位置
		sleep(1)
	end
	--debugmsg(0,0,"Agidin not cross")
	local goes
	SetDefIdleMotion( OwnerID(), ruFUSION_MIME_IDLE_STAND )
	--	
	if	GoToFlag == FlagNum	and	HateListCount( OwnerID() ) == 0 then			---如果走到盡頭就移動到終點
		CallPlot(OwnerID(),"DW_MoveToFlag",OwnerID(),FlagID[3] , GoToFlag , 0 ,1)
		goes = GoToFlag+1
	elseif	GoToFlag ~= FlagNum	and	HateListCount( OwnerID() ) == 0 then
		CallPlot(OwnerID(),"DW_MoveToFlag",OwnerID(),FlagID[3] , GoToFlag , 0 ,1)				---走過自鳴石的漏洞
		goes = GoToFlag	
	end
	--debugmsg(0,0,"Agidin cross")
	sleep(50)
	while 1  do
		CallPlot(OwnerID(),"LuaPE_ZONE18_PE01_HunterAttack")					---叫所有獵人攻擊
		if	DW_CheckDis( OwnerID() , FlagID[4] , 2 , 90 ) == false and HateListCount( OwnerID() ) == 0 then		--移動
			--debugmsg(0,0,"Agidin go to Town")
			DW_MoveToFlag(OwnerID(),FlagID[4] , 2 , 90 ,1)								--距離目標還有90以上且沒有戰鬥就移動
			sleep(10)
		elseif	DW_CheckDis( OwnerID() , FlagID[4] , 2 , 90 ) == true	then
			SetIdleMotion( OwnerID(),ruFUSION_ACTORSTATE_COMBAT_UNARMED)
			FaceFlag ( OwnerID(),780753, 51 )			
--			AdjustFaceDir( OwnerID() ,white,0 )
		end
		
		sleep(20)
	end
end

function LuaPE_ZONE18_PE01_HunterAttack()
	local AllHunter = ZONE18_PE01_Hunter								---叫所有沒在戰鬥的獵人攻擊自己
	local AllHunterNum = table.getn(AllHunter)
	if AllHunterNum > 0 then
		for i = 1, AllHunterNum do
			--say(AllHunter[i] ,"i am here")
			if CheckID(AllHunter[i]) == true and HateListCount(AllHunter[i]) == 0 and GetDistance( OwnerID() , AllHunter[i] ) < 400 then
			SetAttack(AllHunter[i],OwnerID())
			end
		end
	end
end

function LuaPE_ZONE18_PE01_Phase3_SimonHunter(Target)					
	local Flag = ZONE18_PE01_Var["FlagID"]
	local HunterID = ZONE18_PE01_Var["HunterID"]
	local MaxHunter = ZONE18_PE01_Var["MaxHunter"]	
	local HunterDead = 	ZONE18_PE01_Var["HunterDead"]		
	if	ZONE18_PE01_Var["NowHunter"] + HunterDead < MaxHunter	then						---如果現在的獵人數量還沒到上限
		ZONE18_PE01_Var["NowHunter"] = ZONE18_PE01_Var["NowHunter"] + 1
		local Hunter1 = LuaS_MK_MoveToObj("flag",HunterID[rand(3)+1],Target,Flag[4],2,100,150,0)		---距離自己150處種一隻獵人跑到距離50處並攻擊自己
		table.insert( ZONE18_PE01_Obj , Hunter1 )
		table.insert( ZONE18_PE01_Hunter ,Hunter1)
		WriteRoleValue( Hunter1 , EM_RoleValue_LiveTime , 1800 )
		DisableQuest( Hunter1 , false )
		SetModeEx( Hunter1 , EM_SetModeType_Searchenemy , TRUE )		-- 索敵
		SetPlot(Hunter1,"dead","LuaPE_ZONE18_PE01_HunterDead",100)					---給予死亡劇情

		--CallPlot(Hunter1,"LuaPE_ZONE18_PE01_AttackEnable")
		CallPlot(Hunter1,"LuaPE_ZONE18_PE01_Phase2_FourHunterAI")					---給予AI
		SetAttack(Hunter1,OwnerID())
	end
end


function LuaPE_ZONE18_PE01_Phase3_SimonHunter2(Target)								---同上
	local Flag = ZONE18_PE01_Var["FlagID"]
	local HunterID = ZONE18_PE01_Var["HunterID"]
	local Hunter1
	local MaxHunter = ZONE18_PE01_Var["MaxHunter"]
	local HunterDead = 	ZONE18_PE01_Var["HunterDead"]		
	if	ZONE18_PE01_Var["NowHunter"] + HunterDead < MaxHunter	then					
		ZONE18_PE01_Var["NowHunter"] = ZONE18_PE01_Var["NowHunter"] + 1
		local Hunter1 = LuaS_MK_MoveToObj("flag",HunterID[rand(3)+1],Target,Flag[4],2,100,130,0)
		table.insert( ZONE18_PE01_Obj , Hunter1 )
		table.insert( ZONE18_PE01_Hunter ,Hunter1)
		WriteRoleValue( Hunter1 , EM_RoleValue_LiveTime , 1800 )
		DisableQuest( Hunter1 , false )
		SetModeEx( Hunter1 , EM_SetModeType_Searchenemy , TRUE )		-- 索敵
		SetPlot(Hunter1,"dead","LuaPE_ZONE18_PE01_HunterDead",100)
		--CallPlot(Hunter1,"LuaPE_ZONE18_PE01_AttackEnable")
		CallPlot(Hunter1,"LuaPE_ZONE18_PE01_Phase2_FourHunterAI")
		SetAttack(Hunter1,OwnerID())
	end
end

---------對話-------------
function LuaPE_ZONE18_PE01_Phase3_NPCsay()
	--debugmsg(0,0,"NPCsay Action")
	local ControllerID = ZONE18_PE01_Var["ControllerID"]
	local RoomID = ZONE18_PE01_Var["RoomID"]
	local Phase = ZONE18_PE01_Phase	
	local NPCsayCommand = LuaPE_ZONE18_PE01_CreaterSet( ControllerID, RoomID )	-- 設定控制物件	
	table.insert( ZONE18_PE01_Obj , NPCsayCommand )
	while 1 do									--當階段>2的時候
		if	Phase > 2	then
			CallPlot(NPCsayCommand , "LuaPE_ZONE18_PE01_Phase3_HunterSay")
		end
		sleep(10)
	end
end

function LuaPE_ZONE18_PE01_Phase3_HunterSay()						--依照階段每N秒說一次話
	local InPool = ZONE18_PE01_Run_In_Pool
	local Message = ZONE18_PE01_Message
	local AllHunter = ZONE18_PE01_Hunter
	local AllHunterNum = table.getn(AllHunter)
	local temp = AllHunter[rand(AllHunterNum)+1]
	if ReadRoleValue( OwnerID() , EM_RoleValue_Register+1 ) > 3 and ReadRoleValue( temp, EM_RoleValue_IsDead) == 0 then
		--debugmsg(0,0,"NPCsay 1")
		WriteRoleValue( OwnerID() , EM_RoleValue_Register+1, 0 )
		if	Inpool[1] == 0	then
			NPCsay(temp ,Message[20])
		elseif	Inpool[2] > 0	and	Inpool[3] < 1	then
			NPCsay(temp ,Message[14])
		elseif	Inpool[3] > 0	then
			NPCsay(temp ,Message[15])
		end
	else
		WriteRoleValue( OwnerID() , EM_RoleValue_Register+1, ReadRoleValue( OwnerID() , EM_RoleValue_Register+1 )+1 )		
	end
end

--==================================================--
--    階段四處理區                   				  	--
--==================================================--

function LuaPE_ZONE18_PE01_Phase4_Start()				---第四階段開始
	local FlagID = ZONE18_PE01_Var["FlagID"]
	local Creater = OwnerID()
	local MaxAgidin = ZONE18_PE01_Var["MaxMst"]
	local Phase = ZONE18_PE01_Phase 			--階段		
	local MstRestTime = ZONE18_PE01_Var["CreateTime"]
	local BigAgidin = Lua_DW_CreateObj("flag" ,104487,FlagID[1],0)
	local Message = ZONE18_PE01_Message
	local AllHunter = ZONE18_PE01_Hunter
	local AllHunterNum = table.getn(AllHunter)
	NPCsay(AllHunter[rand(AllHunterNum)+1] ,Message[31])
	table.insert( ZONE18_PE01_Obj , BigAgidin )
	table.insert( ZONE18_PE01_Agidin , BigAgidin )
	WriteRoleValue( BigAgidin , EM_RoleValue_LiveTime , 1800 )
	WriteRoleValue( Creater , EM_RoleValue_Register+1, ReadRoleValue( Creater, EM_RoleValue_Register+1 )+1)	--硬殼亞基丁數量+1
	WriteRoleValue( BigAgidin , EM_RoleValue_Register+1, Creater )
	SetPlot(BigAgidin,"dead","LuaPE_ZONE18_PE01_BigAgidinDead",100)
	sleep(20)
	WriteRoleValue(BigAgidin , EM_RoleValue_IsWalk, 0 )			---用跑的		
	BeginPlot(BigAgidin,"LuaPE_ZONE18_PE01_Phase3_MonsterAI",0)		---大亞基丁AI
end

--==================================================--
--    熱泉處理區                   				  	--
--==================================================--

function LuaPE_ZONE18_PE01_Hot_Spring_Hurt100()
	LuaPE_ZONE18_PE01_DontLook()
	while 1 do
		sleep(10)			---一秒燙一次
		SysCastSpellLV(OwnerID(),OwnerID(),496219,1)
		SysCastSpellLV(OwnerID(),OwnerID(),496220,1)
	end
end

function LuaPE_ZONE18_PE01_Hot_Spring_Hurt70()
	LuaPE_ZONE18_PE01_DontLook()
	while 1 do
		sleep(10)			---一秒燙一次
		SysCastSpellLV(OwnerID(),OwnerID(),496338,1)
		SysCastSpellLV(OwnerID(),OwnerID(),496339,1)
	end
end
--檢查掉進熱泉的生物

function LuaPE_ZONE18_PE01_Check_Fall_In_Pool_Player()
	local Message = ZONE18_PE01_Message
	if	ReadRoleValue( TargetID(), EM_RoleValue_IsDead) == 1	then
		return false
	elseif	ReadRoleValue(TargetID(),EM_RoleValue_HP)/ReadRoleValue(TargetID(),EM_RoleValue_MaxHP)	< 0.1	or	
		ReadRoleValue(TargetID(),EM_RoleValue_HP)/ReadRoleValue(TargetID(),EM_RoleValue_MaxHP)	== 0.1	then
		SysCastSpellLV(TargetID(),TargetID(),496338,1)	
		return false		
	else
		ScriptMessage( TargetID() , TargetID() , 1 , Message[101] , 0 ) --
		ScriptMessage( TargetID() , TargetID() , 0 , Message[101] , 0 )
		return true
	end
end
function LuaPE_ZONE18_PE01_Check_Fall_In_Pool()
	if	ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 104485 or ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 104487 or ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 104286 then
		if	ReadRoleValue( TargetID(), EM_RoleValue_Register+2) == 2	then
			CancelBuff( TargetID()  , 507666  )
		elseif	ReadRoleValue( TargetID(), EM_RoleValue_Register+2) == 3	then
			CancelBuff( TargetID()  , 507666  )
			CancelBuff( TargetID()  , 507667  )
		elseif	ReadRoleValue( TargetID(), EM_RoleValue_Register+2) == 4	then
			CancelBuff( TargetID()  , 507666  )
			CancelBuff( TargetID()  , 507667  )
			CancelBuff( TargetID()  , 507668  )	
		end
		if	ReadRoleValue( TargetID(), EM_RoleValue_Register+2) < ReadRoleValue( OwnerID() , EM_RoleValue_PID)	then
			return true
		end
	end
	return false
end
--以被燙的次數決定還要被燙幾次
function LuaPE_ZONE18_PE01_Monster_Fall_In_Pool()
	if	ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 104286	then
		SysCastSpellLV(TargetID() , TargetID() , 496224 , 1)		
		
	elseif	ZONE18_PE01_Phase > 2	then
		local InPool = ZONE18_PE01_Run_In_Pool
		local Message = ZONE18_PE01_Message
		local AllHunter = ZONE18_PE01_Hunter								---叫所有沒在戰鬥的獵人攻擊自己
		local AllHunterNum = table.getn(AllHunter)
		local Count = PE_GetActivePlayerGUIDCount(1)
		
		--亞基丁泡水時顯示文字
		if	ReadRoleValue( TargetID(), EM_RoleValue_Register+2) == 0	and	Inpool[2] == 0 and Count ~= 0	then
			for i = 1 , Count , 1 do
				local ID = PE_GetActivePlayerGUID(1)
				ScriptMessage( ID , ID , 1 , Message[16] , 0 ) --
				ScriptMessage( ID , ID , 0 , Message[16] , 0 )
			end	
			InPool[1] = 1
			NPCsay(AllHunter[rand(AllHunterNum-1)+1] ,Message[23])
		elseif	ReadRoleValue( TargetID(), EM_RoleValue_Register+2) == 1	and	Inpool[3] == 0 and Count ~= 0  	then
			for i = 1 , Count , 1 do
				local ID = PE_GetActivePlayerGUID(1)
				ScriptMessage( ID , ID , 1 , Message[17] , 0 ) --
				ScriptMessage( ID , ID , 0 , Message[17] , 0 )
			end	
			InPool[2] = 1
			NPCsay(AllHunter[rand(AllHunterNum-1)+1] ,Message[24])
		elseif	ReadRoleValue( TargetID(), EM_RoleValue_Register+2) == 2	and	Inpool[4] == 0 and Count ~= 0  	then
			for i = 1 , Count , 1 do
				local ID = PE_GetActivePlayerGUID(1)
				ScriptMessage( ID , ID , 1 , Message[18] , 0 ) --
				ScriptMessage( ID , ID , 0 , Message[18] , 0 )
			end	
			InPool[3] = 1
			NPCsay(AllHunter[rand(AllHunterNum-1)+1] ,Message[25])
		elseif	ReadRoleValue( TargetID(), EM_RoleValue_Register+2) == 3	and	Inpool[5] == 0 and Count ~= 0  	then
			for i = 1 , Count , 1 do
				local ID = PE_GetActivePlayerGUID(1)
				ScriptMessage( ID , ID , 1 , Message[19] , 0 ) --
				ScriptMessage( ID , ID , 0 , Message[19] , 0 )
			end	
			InPool[4] = 1
			NPCsay(AllHunter[rand(AllHunterNum-1)+1] ,Message[26])
		end

		--亞基丁泡水時產生狀態
		if	ReadRoleValue( TargetID(), EM_RoleValue_Register+2) == 0	then	--刪除鋼毛BUFF,增加燙傷1BUFF,被燙一次
			CancelBuff( TargetID()  , 506981  )
			AddBuff(TargetID(),507666,0,-1)
			WriteRoleValue( TargetID() , EM_RoleValue_Register+2, 1 )
			Inpool[2] = 1
		elseif	ReadRoleValue( TargetID(), EM_RoleValue_Register+2) == 1	then	--刪除燙傷1BUFF,增加燙傷2BUFF,受傷一次,被燙2次
			CancelBuff( TargetID()  , 506981  )
			CancelBuff( TargetID()  , 507666  )
			AddBuff(TargetID(),507667,0,-1)
			AddBuff( TargetID() , 507532 , 0 , -1 )					--加入不會回血BUFF
			SysCastSpellLV(TargetID() , TargetID() , 496224 , 1)
			WriteRoleValue( TargetID() , EM_RoleValue_Register+2, 2 )
			Inpool[3] = 1
		elseif	ReadRoleValue( TargetID(), EM_RoleValue_Register+2) == 2	then	--刪除燙傷2BUFF,增加燙傷3BUFF,受傷2次,被燙3次
			CancelBuff( TargetID()  , 506981  )
			CancelBuff( TargetID()  , 507666  )
			CancelBuff( TargetID()  , 507667  )
			AddBuff(TargetID(),507668,0,-1)
			SysCastSpellLV(TargetID() , TargetID() , 496225 , 1)
			WriteRoleValue( TargetID() , EM_RoleValue_Register+2, 3 )
			Inpool[4] = 1
		elseif	ReadRoleValue( TargetID(), EM_RoleValue_Register+2) == 3	then	--刪除燙傷3BUFF,增加燙傷4BUFF,受傷3次,被燙4次
			CancelBuff( TargetID()  , 506981  )
			CancelBuff( TargetID()  , 507666  )
			CancelBuff( TargetID()  , 507667  )
			CancelBuff( TargetID()  , 507668  )
			AddBuff(TargetID(),507669,0,-1)
			SysCastSpellLV(TargetID() , TargetID() , 496226 , 1)
			WriteRoleValue( TargetID() , EM_RoleValue_Register+2, 4 )
			Inpool[5] = 1
		end
	end
end

--==================================================--
--    啟動處理區                   				  	--
--==================================================--
function LuaPE_ZONE18_PE01_Reset()
	local Mode = 1
	LuaPE_ZONE18_PE01_Start(1)
end

function LuaPE_ZONE18_PE01_Start(mode)
	local Temp
	local Art
	
	if ZONE18_PE01_Obj ~= nil then
		--Temp = ZONE18_PE01_Var["Controller"]
		LuaPE_ZONE18_PE01_DelObj()
	end
	
	if ZONE18_PE01_Art ~= nil then
		Art = ZONE18_PE01_Art
	end
	
	LuaPE_ZONE18_PE01_GlobalSet()	-- 共用變數設定
	if Art ~= nil then
		ZONE18_PE01_Art = Art
	end
	
	if mode == nil then
		LuaPE_ZONE18_PE01_PESet()		-- 公眾事件設定
	end
	
	local ControllerID = ZONE18_PE01_Var["ControllerID"]
	local RoomID = ZONE18_PE01_Var["RoomID"]
	--if ZONE18_PE01_Var["Controller"] == 0 then
		ZONE18_PE01_Var["Controller"] = OwnerID()
	--end
	--local Controller = LuaPE_ZONE18_PE01_CreaterSet( ControllerID, RoomID )	-- 設定控制物件	
	local Creater = LuaPE_ZONE18_PE01_CreaterSet( ControllerID, RoomID )	-- 設定控制物件	
	--ZONE18_PE01_Var["Controller"] = Controller
	ZONE18_PE01_Var["Creater"] = Creater
	--table.insert( ZONE18_PE01_Obj , Controller )	
	table.insert( ZONE18_PE01_Obj , Creater )		
--	BeginPlot( OwnerID(), "LuaPE_ZONE18_PE01_CreateControl", 0 )
	--[[if temp ~= nil then
		DelObj( Temp )
	end--]]
end

function LuaPE_ZONE18_PE01_CreateControl()		---當階段進行到2時隱藏接任務的白牙
	local Phase = ZONE18_PE01_Phase
--	Local White = ZONE18_PE01_Var["White"]
--	Local White2 = ZONE18_PE01_Var["White2"]

	if	Phase == 0	then
--	Show(white,0)
--	Hide(white2)
	else
--	Show(white2,0)
--	Hide(white)	
	end
end


function LuaPE_ZONE18_PE01_Creater_SetCount_Agidin_In_Town()				--設定亞基丁的擊合點
	LuaPE_ZONE18_PE01_DontLook()
	local FlagID = ZONE18_PE01_Var["FlagID"]
	local ControllerID = ZONE18_PE01_Var["ControllerID"]
	local Obj = KS_CreateObjMode( ControllerID, FlagID[4] , 2 , 0, 1, 1 )
	BeginPlot( Obj, "LuaPE_ZONE18_PE01_DontLook", 0 )
	ZONE18_PE01_Var["CountMachine"] = obj	

	table.insert( ZONE18_PE01_Obj , Obj )
	BeginPlot(Obj,"LuaPE_ZONE18_PE01_Creater_Count_Agidin_In_Town",0)
end

function LuaPE_ZONE18_PE01_Creater_Count_Agidin_In_Town()				--每秒施放法術計算一次亞基丁的數量

	while ReadRoleValue( OwnerID(), EM_RoleValue_Register+1) < 3	and	ReadRoleValue( OwnerID(), EM_RoleValue_Register+2) < 1	do
		WriteRoleValue( OwnerID(), EM_RoleValue_Register+1, 0 )
		WriteRoleValue( OwnerID(), EM_RoleValue_Register+2, 0 )
		CastSpell( OwnerID(), OwnerID(), 496217 )
		sleep(20)
		ZONE18_PE01_BigADInTown = ReadRoleValue( OwnerID(), EM_RoleValue_Register+1)
		PE_SetVar( "ZONE18_PE01_Var_MaxAgidinInTown" , ZONE18_PE01_BigADInTown )
		ZONE18_PE01_RedADInTown = ReadRoleValue( OwnerID(), EM_RoleValue_Register+2)
		PE_SetVar( "ZONE18_PE01_Var_BigInTown" , ZONE18_PE01_RedADInTown )		
		if	ReadRoleValue( OwnerID(), EM_RoleValue_Register+1) > 2	or	ReadRoleValue( OwnerID(), EM_RoleValue_Register+2) > 0	then
			break
		end
	end

end
function LuaPE_ZONE18_PE01_Count_Agidin_In_Town()

	if	ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 104485	then
		if	ReadRoleValue( TargetID(), EM_RoleValue_IsDead) == 0 and CheckID( TargetID() ) == true then
			WriteRoleValue( OwnerID(), EM_RoleValue_Register+1, ReadRoleValue( OwnerID(), EM_RoleValue_Register+1)+1 )			
		end
	end
	if	ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 104487	then
		if	ReadRoleValue( TargetID(), EM_RoleValue_IsDead) == 0 and CheckID( TargetID() ) == true then
			WriteRoleValue( OwnerID(), EM_RoleValue_Register+2, ReadRoleValue( OwnerID(), EM_RoleValue_Register+2)+1 )			
		end
	end
end
--測試指令加在701887(此文件過長)