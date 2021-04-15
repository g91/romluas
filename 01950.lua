
--==================================================--
-- 斯里威的開心農場									--
--==================================================--
--==================================================--
--  全域變數區                                      --
--==================================================--
function LuaPE_ZONE17_PE01_GlobalSet()	
	ZONE17_PE01_Obj = {}							-- 使用物件管理陣列
	ZONE17_PE01_Var = {}							-- 使用參數管理陣列
	ZONE17_PE01_Phase = 0							-- 階段標籤
	ZONE17_PE01_TotalScore = 0
	ZONE17_PE01_PEIndex = 1
	
	ZONE17_PE01_Message = { [1] = "[SC_PE_ZONE17_01_M01]"; --只能從農田旁的水井取水灌溉真有些麻煩。
							[2] = "[SC_PE_ZONE17_01_M02]"; --要撒些肥料作物才會生長得比較好。
							[3] = "[SC_PE_ZONE17_01_M03]"; --作物放著不管可是會枯萎的。
							[4] = "[SC_PE_ZONE17_01_M04]"; --沒肥料的人就跟我拿吧。
							[5] = "[SC_PE_ZONE17_01_M05]"; --真希望能有自動灌溉的方法。
							[6] = "[SC_PE_ZONE17_01_M06]"; --這些討人厭的東西到底是從哪冒出來的。
							[7] = "[SC_PE_ZONE17_01_M07]"; --生活真是不好過。
							[8] = "[SC_PE_ZONE17_01_M08]"; --孟犽怎麼又來了。
							[9] = "[SC_PE_ZONE17_01_M09]"; --我有些累了要先休息一會。
							[10] = "[SC_PE_ZONE17_01_M10]";--向他索取肥料。
							[11] = "[SC_PE_ZONE17_01_M11]";--已經澆過水了。
							[12] = "[SC_PE_ZONE17_01_M12]";--已經施過肥了。
							[13] = "[SC_PE_ZONE17_01_M13]";--[$VAR1] 還沒有成熟。
							[21] = "[SC_PE_ZONE17_01_M21]";--該是播種的時候了，不過斯里威農田上有許多雜草需要清除。
							[22] = "[SC_PE_ZONE17_01_M22]";--澆水施肥樣樣不能少，有好的照料才有好的收成。
							[23] = "[SC_PE_ZONE17_01_M23]";--收成的時候總是會有些討人厭的東西。
							[24] = "[SC_PE_ZONE17_01_M24]";--孟犽又來了!!!!快阻止牠們啃食我們的作物。
							[25] = "[SC_PE_ZONE17_01_M25]";--付出的辛勞總算有收穫了。
							[26] = "[SC_PE_ZONE17_01_M26]";--看來農夫們都疲勞過度無法耕作了。
							[27] = "[SC_PE_ZONE17_01_M28]";--這次的收成欠佳，[<S>116108]都沮喪的離開了。
							[28] = "[SC_PE_ZONE17_01_M27]";--好不容易收成的作物都被孟犽吃掉了...							
							[29] = "[SC_PE_ZONE17_01_M29]";--採收完成的作物數量: [$VAR1]
							[30] = "[SC_PE_ZONE17_01_M30]";--[<S>104012]數量:  [$VAR1]
							[100] = "[SC_PE_ZONE17_01_M100]";--因為你沒有[$VAR1] ，所以[$VAR2]毫無反應。
							[101] = "[SC_PE_ZONE17_01_M101]";--澆水中
							[102] = "[SC_PE_ZONE17_01_M102]";--施肥中
							[103] = "[SC_PE_ZONE17_01_M103]";--取水中
							[104] = "[SC_PE_ZONE17_01_M104]";}--採收中
							
	ZONE17_PE01_Var["ResetTime"] = 3600				-- 公眾任務重置時間(秒)	1小時
	ZONE17_PE01_Var["CreateTime"] = 120				-- 怪物生產檢查間隔
	ZONE17_PE01_Var["MapID"] = 926					-- 公眾事件分區編號		斯里威農場(926)
	ZONE17_PE01_Var["TestID"] = 1					-- 公眾事件測試區編號
	ZONE17_PE01_Var["RoomID"] = 0	
		
	ZONE17_PE01_Var["ControllerID"] = 115053		-- PE控制物件GID
	ZONE17_PE01_Var["CreaterID"] = 115506			-- 生產控制物件GID
	ZONE17_PE01_Var["WellID"] = 116107				-- 水井GID
	ZONE17_PE01_Var["Controller"] = 0				-- PE控制物件
	ZONE17_PE01_Var["Creater"] = 0					-- 生產物件
	ZONE17_PE01_Var["FlagID"] = 780656				-- 旗標ID
	ZONE17_PE01_Var["BossFlagID"] = 780657			-- BOSS用旗標
	ZONE17_PE01_Var["FlagNum"] = GetMoveFlagCount( ZONE17_PE01_Var["FlagID"] ) --旗幟數量
	ZONE17_PE01_Var["CropType"] = 50				-- 作物區隔的旗標編號
		
	ZONE17_PE01_Var["FarmerCount"] = 0
	ZONE17_PE01_Var["MstCount"] = 0	
	ZONE17_PE01_Var["FarmerID"] = { 116108,			-- 農婦
									116109, 		-- 農夫
									116113,			-- 農夫
									116114 }		-- 農夫
									

	ZONE17_PE01_Var["GiveItem"] = { 208075,			-- 裝滿水的桶子
									208076 }		-- 有機肥料
									
	ZONE17_PE01_Var["Crop1ID"] = {	116104,			-- 土堆
									115691,			-- 玉米株lv1
									115694, 		-- 玉米株lv2
									115695 } 		-- 玉米株lv3
	ZONE17_PE01_Var["Crop2ID"] = {	116104,			-- 土堆
									116177,			-- 南瓜lv1
									116176,			-- 南瓜lv2
									116178 }		-- 南瓜lv3
									
	ZONE17_PE01_Var["CropCarID"] = {	104012,		-- 堆好的作物(小)
										102717 } 	-- 堆好的作物(大)
										
	ZONE17_PE01_CropCar = {}
	ZONE17_PE01_Var["DeadCrop1ID"] = {	115693,		-- 枯萎的玉米株lv1
										116105,		-- 枯萎的玉米株lv2
										115976	}	-- 枯萎的玉米株lv3
	ZONE17_PE01_Var["DeadCrop2ID"] = {	116175, 	--枯萎的南瓜lv1
										116174,		--枯萎的南瓜lv2
										116174 }	--枯萎的南瓜lv3
	
	ZONE17_PE01_Var["MstID"] = {	104149,			-- 兇猛的烈焰草
									104011,			-- 詭面甲蟲的幼蟲
									103998,			-- 赤背剎牙
									104010 }		-- 孟犽
		
	ZONE17_PE01_Var["CropLiveTime"] = 25			-- 作物生長時間
	ZONE17_PE01_Var["TimeSpace"] = 15				-- 計時間隔(秒)
	ZONE17_PE01_Var["TimeCreateFarmer"] = 6			-- 每次間隔出場的農夫數目
	ZONE17_PE01_Var["TimeCreateMst"] = 14			-- 每次間隔出場的怪物數目	
	ZONE17_PE01_Var["MaxFarmer"] = 12				-- 場上維持的農夫數目
	ZONE17_PE01_Var["MaxMst"] = 28					-- 場上維持的怪物數目

	ZONE17_PE01_Var["FarmerDead"] = 0				-- 目前農夫死亡數目
	ZONE17_PE01_Var["WeedDead"] = 0					-- 雜草死亡數量
	ZONE17_PE01_Var["MstDead"] = 0					-- 剎牙死亡數量
	ZONE17_PE01_Var["MstBoss"] = 0					-- 剎牙王
	
	ZONE17_PE01_Var["PH1Require"]  = 40				-- 階段一需要殺死雜草數目
	ZONE17_PE01_Var["PH2Time"] = 90					-- 階段二總時間(秒)
	ZONE17_PE01_Var["PH3Time"] = 120				-- 階段三總時間(秒)
	ZONE17_PE01_Var["GetCrop"] = 0					-- 已取得的作物數量
	
	ZONE17_PE01_Var["MaxFarmerDead"] = 10			-- 農夫最大死亡數 (失敗條件)
	ZONE17_PE01_Var["CropLoss"]	= 5					-- 穀物袋失去量(第四階段失敗條件)
	ZONE17_PE01_Var["CropNum"] = 20					-- 每取得N個作物兌換一個穀物
	ZONE17_PE01_Var["MaxCropLoss"] = 5				-- 穀物袋最大失去量(第四階段失敗條件)
	ZONE17_PE01_Var["GetCropCar"] = 0	 			-- 已經取得的作物袋數量
	
	ZONE17_PE01_Var["Bonus"] = { 5,5,5,5 }			-- 栽種作物/收成分數
	
	ZONE17_PE01_Var["ExCha_Ratio"] = 100			-- 回饋比率
	ZONE17_PE01_Var["MaxBonus"] = 1000				-- 最大分數
end
--==================================================--



--==================================================--
--  公眾事件設定區                                  --
--==================================================--
function LuaPE_ZONE17_PE01_PESet()

	local PE_Name = "SC_PE_ZONE17_01_NAME"					-- 斯里威的農村生活
	local PE_Desc = "SC_PE_ZONE17_01_DESC"					-- 又到了播種的季節，土地上叢生的雜草與人手不足的問題，使得斯里威農場的農夫陷入困境。
	local PEIndex = ZONE17_PE01_PEIndex	
	PE_AddPE( PE_Name , PE_Desc , PEIndex , 0 ) 	-- 新增一個事件

	local MapID = ZONE17_PE01_Var["MapID"]
	local TestID = ZONE17_PE01_Var["TestID"]
	PE_AddRegion( PEIndex , MapID )							-- 把PE放進實際分區
	PE_AddRegion( PEIndex , TestID )						-- 把PE放進測試區
	
	local PH0Index = 100	--階段變數
	local PH1Index = 101	
	local PH2Index = 102
	local PH3Index = 103
	local PH4Index = 104
	local PH5Index = 105
	
	local PH0_Name = "SC_PE_ZONE16_DW_22" --重置時間
	local PH1_Name = "SC_PE_ZONE17_01_PHNAME01"	-- 除草大作戰	
	local PH2_Name = "SC_PE_ZONE17_01_PHNAME02"	-- 努力才有收穫
	local PH3_Name = "SC_PE_ZONE17_01_PHNAME03"	-- 不速之客
	local PH4_Name = "SC_PE_ZONE17_01_PHNAME04"	-- 一波三折
	
	local PH0_Desc = ""
	local PH1_Desc = "SC_PE_ZONE17_01_M21"	-- 該是播種的時候了，不過斯里威農田上有許多雜草需要清除。
	local PH2_Desc = "SC_PE_ZONE17_01_M22"	-- 澆水施肥樣樣不能少，有好的照料才有好的收成。
	local PH3_Desc = "SC_PE_ZONE17_01_M23"	-- 收成的時候總是會有些討人厭的東西。
	local PH4_Desc = "SC_PE_ZONE17_01_M24"	-- 孟犽又來了!!!!快阻止它啃食我們的作物。

	PE_AddPhase( PEIndex , PH0Index , PH0_Name , PH0_Desc , 0 , 0 , 0 , 0 )	-- 新增階段0
	PE_AddPhase( PEIndex , PH1Index , PH1_Name , PH1_Desc , 0 , 0 , 0 , 0 )	-- 新增階段1
	PE_AddPhase( PEIndex , PH2Index , PH2_Name , PH2_Desc , 0 , 0 , 0 , 0 )	-- 新增階段2
	PE_AddPhase( PEIndex , PH3Index , PH3_Name , PH3_Desc , 0 , 0 , 0 , 0 )	-- 新增階段3
	PE_AddPhase( PEIndex , PH4Index , PH3_Name , PH3_Desc , 0 , 0 , 0 , 0 )	-- 新增階段4
	PE_AddPhase( PEIndex , PH5Index , PH4_Name , PH4_Desc , 0 , 0 , 0 , 0 )	-- 新增階段4

	local OB0Index = 1000
	local OB1Index = 1001
	local OB2Index = 1002
	local OB3Index = 1003
	local OB4Index = 1004
	local OB5Index = 1005
	local OB6Index = 1006
	local OB7Index = 1007
	local OB8Index = 1008
	
	local OB0_Name = "SC_PE_ZONE17_DW_21" --剩餘時間
	local OB1_Name = "SC_PE_ZONE17_01_OBNAME01"	-- 清除農地上的雜草
	local OB2_Name = "SC_PE_ZONE17_01_OBNAME02"	-- 協助栽種
	local OB3_Name = "SC_PE_ZONE17_01_OBNAME03"	-- 搶收作物
	local OB4_Name = ""
	local OB5_Name = "SC_PE_ZONE17_01_OBNAME04"	-- 驅趕孟犽
	local OB6_Name = "SC_PE_ZONE17_01_OBNAME05"	-- 疲憊的農夫
	local OB7_Name = "SC_PE_ZONE17_01_OBNAME06"	-- 損失作物袋
	local OB8_Name = "SC_PE_ZONE17_01_OBNAME06"	-- 損失作物袋
	
	local OB0_Desc = ""
	local OB1_Desc = "SC_PE_ZONE17_01_OB1_DESC" --幫助[<S>116108]清除[ZONE_SLEY_FARMS]裡的[<S>104149]
	local OB2_Desc = "SC_PE_ZONE17_01_OB2_DESC" --從[ZONE_SLEY_FARMS]附近的[<S>116107]取水灌溉，再從[<S>116108]身上取得[<S>208076]幫作物施肥，然後等待作物成長。
	local OB3_Desc = "SC_PE_ZONE17_01_OB3_DESC" --必須在[<S>104011]與[<S>103998]將作物啃食殆盡前，將作物採收完畢，並且撲趕那些防礙者。
	local OB4_Desc = ""
	local OB5_Desc = "SC_PE_ZONE17_01_OB4_DESC" --在[104010]與那些飢餓的[<S>103998]將[<S>102717]吃完前，將[104010]擊倒驅逐。
	local OB6_Desc = ""
	local OB7_Desc = ""
	local OB8_Desc = ""
	
	local PH1Require = ZONE17_PE01_Var["PH1Require"]
	local MaxFarmerDead = ZONE17_PE01_Var["MaxFarmerDead"]
	local CropLoss = ZONE17_PE01_Var["CropLoss"]

	-- PE重置倒數
	PE_PH_AddObjective_TimeLimit( PEIndex , PH0Index , OB0Index , OB0_Name , OB0_Desc , "ZONE17_PE01_ResetTime" , ZONE17_PE01_Var["ResetTime"]*1000 , 0 ,  true )
	
	-- 新增一個目標，階段1成功條件：雜草死亡超過
	PE_PH_AddObjective_EqualAndGreater( PEIndex , PH1Index , OB1Index , OB1_Name , OB1_Desc , "ZONE17_PE01_Var_WeedDead" , 0 , PH1Require ,  true )	
	
	-- 新增一個目標，階段2成功條件：完成作物栽種
	PE_PH_AddObjective_TimeLimit( PEIndex , PH2Index , OB2Index , OB2_Name , OB2_Desc , "ZONE17_PE01_PH2Time" , ZONE17_PE01_Var["PH2Time"]*1000 , 0 ,  true )
	
	-- 新增一個目標，階段3成功條件：一波三折(搶收)
	PE_PH_AddObjective_TimeLimit( PEIndex , PH3Index , OB3Index , OB3_Name , OB3_Desc , "ZONE17_PE01_PH3Time" , ZONE17_PE01_Var["PH3Time"]*1000 , 0 ,  true )
	
	-- 新增一個目標，階段4成功條件：倒數
	PE_PH_AddObjective_TimeLimit( PEIndex , PH4Index , OB4Index , OB3_Name , OB3_Desc , "ZONE17_PE01_PH4Time" , 5*1000 , 0 ,  true )
	
	-- 新增一個目標，階段5成功條件：不速之客(殺死孟犽)
	PE_PH_AddObjective_Equal( PEIndex , PH5Index , OB5Index , OB5_Name , OB5_Desc , "ZONE17_PE01_Var_BossDead" , 0 , 1 ,  true )
	
	-- 新增一個目標，階段2,3失敗條件：農夫累死
	PE_PH_AddObjective_EqualAndGreater( PEIndex , PH2Index , OB6Index , OB6_Name , OB6_Desc , "ZONE17_PE01_Var_MaxFarmerDead" , 0 , MaxFarmerDead ,  false )
	PE_PH_AddObjective_EqualAndGreater( PEIndex , PH3Index , OB6Index , OB6_Name , OB6_Desc , "ZONE17_PE01_Var_MaxFarmerDead" , 0 , MaxFarmerDead ,  false )	
	
	-- 新增一個目標，階段4.5失敗條件：作物被吃光
	PE_PH_AddObjective_Equal( PEIndex , PH4Index , OB7Index , OB7_Name , OB7_Desc , "ZONE17_PE01_Var_CropLoss" , CropLoss , ZONE17_PE01_Var["MaxCropLoss"] ,  false )
	PE_PH_AddObjective_Equal( PEIndex , PH5Index , OB8Index , OB8_Name , OB8_Desc , "ZONE17_PE01_Var_CropLoss" , CropLoss , ZONE17_PE01_Var["MaxCropLoss"] ,  false )

	-- 設定階段連接
	PE_PH_SetNextPhase( PEIndex , PH0Index , PH1Index )
	PE_PH_SetNextPhase( PEIndex , PH1Index , PH2Index )
	PE_PH_SetNextPhase( PEIndex , PH2Index , PH3Index )
	PE_PH_SetNextPhase( PEIndex , PH3Index , PH4Index )
	PE_PH_SetNextPhase( PEIndex , PH4Index , PH5Index )	
	
	-- 設定目標達成的回摳函式
	PE_OB_SetCallBackOnAchieve( PEIndex , "LuaPE_ZONE17_PE01_OB_OnAchieve" )
	
	-- 設定事件結束的結算回摳函式
	PE_SetCallBackOnBalance( PEIndex , "LuaPE_ZONE17_PE01_FinalExchange" )

	-- 事件啟動
	PE_Start( PEIndex , PH0Index )

end

function LuaPE_ZONE17_PE01_OB_OnAchieve( PEIndex, PHIndex , OBIndex )
	local Controller = ZONE17_PE01_Var["Controller"]	-- 控制物件
	local Creater = ZONE17_PE01_Var["Creater"]	-- 控制物件
	local Phase = ZONE17_PE01_Phase

	if PHIndex == 100 and OBIndex == 1000 then 	-- PE倒數結束-->進入第一階段
		CallPlot( Controller, "LuaPE_ZONE17_PE01_PhaseDO", Phase )		--該是播種的時候了，不過斯里威農田上有許多雜草需要清除。
	elseif PHIndex == 101 and OBIndex == 1001 then 	-- 滿足第一階段-->進入第二階段 
		CallPlot( Controller, "LuaPE_ZONE17_PE01_PhaseDO", Phase )		--澆水施肥樣樣不能少，有好的照料才有好的收成。
		LuaPE_ZONE17_PE01_DelCreater()		--雜草停止生長(刪除生產控製物件)		
		BeginPlot( Controller, "LuaPE_ZONE17_PE01_CreateControl", 0 )--產生土堆
		BeginPlot( Controller, "LuaPE_ZONE17_PE01_CreateFarmer", 0 ) 	--產生農夫
	elseif PHIndex == 102 and OBIndex == 1002 then -- 滿足第二階段-->進入第三階段		
		CallPlot( Controller, "LuaPE_ZONE17_PE01_PhaseDO", Phase )		--收成的時候總是會有些討人厭的東西。
		BeginPlot( Controller, "LuaPE_ZONE17_PE01_CreateMst", 0 ) 		--產生剎牙
	elseif PHIndex == 103 and OBIndex == 1003 then -- 滿足第三階段-->進入第四階段	
		BeginPlot( Controller , "LuaPE_ZONE17_PE01_CreateCrop", 0 ) 	--產生穀物
	elseif PHIndex == 104 and OBIndex == 1004 then -- 滿足第四階段-->進入第五階段
		CallPlot( Controller, "LuaPE_ZONE17_PE01_PhaseDO", Phase )		--孟犽又來了!!!!快阻止它啃食我們的作物。		
		BeginPlot( Controller , "LuaPE_ZONE17_PE01_CreateBoss", 0 )		--產生孟犽		
	elseif PHIndex == 105 and OBIndex == 1005 then 	-- 滿足第五階段 驅趕完成	
		CallPlot( Controller, "LuaPE_ZONE17_PE01_PhaseDO", Phase )		-- 付出的辛勞總算有收穫了。
		BeginPlot( Controller , "LuaPE_ZONE17_PE01_Reset" , 0 )			-- 重置公眾任務
	elseif OBIndex == 1006 then --農夫累死
		CallPlot( Controller, "LuaPE_ZONE17_PE01_PhaseDO", 5 )  		-- 看來農夫們都疲勞過度無法耕作了。		
		BeginPlot( Controller , "LuaPE_ZONE17_PE01_Reset" , 0 )			-- 重置公眾任務
	elseif OBIndex == 1007 then --收成欠佳
		CallPlot( Controller, "LuaPE_ZONE17_PE01_PhaseDO", 6 )  		-- 好不容易收成的作物都被孟犽吃掉了...		
		BeginPlot( Controller , "LuaPE_ZONE17_PE01_Reset" , 0 )			-- 重置公眾任務	
	elseif OBIndex == 1008 then --穀物被吃光
		CallPlot( Controller, "LuaPE_ZONE17_PE01_PhaseDO", 7 )  		-- 好不容易收成的作物都被孟犽吃掉了...		
		BeginPlot( Controller , "LuaPE_ZONE17_PE01_Reset" , 0 )			-- 重置公眾任務	
	end
end

function LuaPE_ZONE17_PE01_FinalExchange( PEIndex , GUID , Score )
	local LV = 56
	local MapID = ZONE17_PE01_Var["MapID"]
	if LuaPE_KS_CheckLv( GUID, LV, MapID ) == false then return end

	local ExCha_Ratio = ZONE17_PE01_Var["ExCha_Ratio"]
	local MaxBonus = ZONE17_PE01_Var["MaxBonus"]	
	local MaxCropLoss = ZONE17_PE01_Var["MaxCropLoss"]
	local CropLoss = ZONE17_PE01_Var["CropLoss"]
	local AddScore = (MaxCropLoss - CropLoss)*50
		
	if Score > 0 then			
		if Score < ExCha_Ratio and Score > ExCha_Ratio/2 then
			CallPlot(GUID, "YOYO_GetTokenValue", 2, 1);--古代遺物"
		elseif Score > ExCha_Ratio then
			Score = Score + AddScore
			if Score >= MaxBonus then Score = MaxBonus end			
			CallPlot(GUID, "YOYO_GetTokenValue", 2, math.floor( Score/ExCha_Ratio ));--古代遺物"
		end
	end	
end

--==================================================--

--==================================================--
--  階段/訊息處理區                                 --
--==================================================--
--階段處理
function LuaPE_ZONE17_PE01_PhaseDO( Phase )
	local Total = ZONE17_PE01_TotalScore
	if Phase == 0 then
		ZONE17_PE01_Phase = 1
		LuaPE_ZONE17_PE01_Message( 1 , C_SYSTEM ) -- 第一階段訊息
	elseif Phase == 1 then
		ZONE17_PE01_Phase = 2
		LuaPE_ZONE17_PE01_Message( 2 , C_DEFAULT ) -- 第二階段訊息
	elseif Phase == 2 then
		ZONE17_PE01_Phase = 3
		LuaPE_ZONE17_PE01_Message( 3 , C_DEFAULT ) -- 第三階段訊息
	elseif Phase == 3 then	
		ZONE17_PE01_Phase = 4
		LuaPE_ZONE17_PE01_Message( 4 , C_DEFAULT ) -- 第四階段訊息
	elseif Phase == 4 then
		ZONE17_PE01_Phase = 5
		debugmsg( 0, 0, "This PE Total Give Bonus = " ..Total )
		LuaPE_ZONE17_PE01_Message( 5 , C_SYSTEM ) -- PE完成訊息
	elseif Phase == 5 then
		ZONE17_PE01_Phase = 6
		debugmsg( 0, 0, "This PE Total Give Bonus = " ..Total )
		LuaPE_ZONE17_PE01_Message( 6 , C_DEFAULT ) -- 農夫累死訊息
	elseif Phase == 6 then
		ZONE17_PE01_Phase = 7
		debugmsg( 0, 0, "This PE Total Give Bonus = " ..Total )
		LuaPE_ZONE17_PE01_Message( 7 , C_DEFAULT ) -- 這次的收成欠佳，[<S>116108]都沮喪的離開了。
	elseif Phase == 7 then
		ZONE17_PE01_Phase = 8		
		debugmsg( 0, 0, "GetCropCar = " ..ZONE17_PE01_Var["GetCropCar"] )
		LuaPE_ZONE17_PE01_Message( 8 , C_DEFAULT ) -- 穀物被吃光訊息
	end

end


--傳送訊息
function LuaPE_ZONE17_PE01_Message( Index , Color )
	local MapID = ZONE17_PE01_Var["MapID"]		-- 斯里威農場	
	local RoomID = ZONE17_PE01_Var["RoomID"]		
	local Message = ZONE17_PE01_Message
	Color = "0xffffff00"	-- 強制訊息為黃色
	local AreaPlayer = LuaPE_KS_GetAreaPlayer( MapID, RoomID )
	
	if Index == 1 then
		debugmsg( 0, 0, "PE Start")
		ScriptMessage( OwnerID(), -1 , 1 , Message[20+Index] , Color )
		ScriptMessage( OwnerID(), -1 , 0 , Message[20+Index] , Color )
		debugmsg( 0, 0, "PE Start!!!")
	elseif Index == 9 then
			local GetCrop = ZONE17_PE01_Var["GetCrop"]
			local CropNum = ZONE17_PE01_Var["CropNum"]
			local MaxCropLoss = ZONE17_PE01_Var["MaxCropLoss"]
			local Num = math.floor(GetCrop/CropNum)	
		for i = 1 , table.getn(AreaPlayer) do
			if Num > ZONE17_PE01_Var["GetCropCar"] then
				ScriptMessage( OwnerID(), AreaPlayer[i] , 0 , "[SC_PE_ZONE17_01_M29][$SETVAR1="..GetCrop.."]", Color )--採收完成的作物數量:
				ScriptMessage( OwnerID(), AreaPlayer[i] , 0 , "[SC_PE_ZONE17_01_M30][$SETVAR1="..Num.."]", Color )--堆放好的作物袋數量: 										
			else
				ScriptMessage( OwnerID(), AreaPlayer[i] , 0 , "[SC_PE_ZONE17_01_M29][$SETVAR1="..GetCrop.."]", Color )--採收完成的作物數量:
			end		
		end
		ZONE17_PE01_Var["GetCropCar"] = Num
	else
		for i = 1 , table.getn(AreaPlayer) do
			ScriptMessage( OwnerID(), AreaPlayer[i] , 1 , Message[20+Index] , Color )			
			ScriptMessage( OwnerID(), AreaPlayer[i] , 0 , Message[20+Index], Color )
		end			
	end
end
--==================================================--

--==================================================--
--  斯里威農場  物件產生區                        --
--==================================================--
--控制物件設定
function LuaPE_ZONE17_PE01_CreaterSet( ObjID , RoomID )
	local Controller = ZONE17_PE01_Var["Controller"]
	local Obj = KS_CreateObjMode( ObjID, Controller, nil, 30, 1, 0 )
	
	SetModeEx( Obj , EM_SetModeType_SearchenemyIgnore , false )	-- 被搜尋
	SetModeEx( Obj , EM_SetModeType_Obstruct , false )			-- 阻擋
	SetModeEx( Obj , EM_SetModeType_Gravity , false )			-- 重力
	SetModeEx( Obj , EM_SetModeType_Mark , false )				-- 標記
	SetModeEx( Obj , EM_SetModeType_Move , false )				-- 移動
	SetModeEx( Obj , EM_SetModeType_Searchenemy , false )		-- 索敵
	SetModeEx( Obj , EM_SetModeType_HideName , false )			-- 名稱
	SetModeEx( Obj , EM_SetModeType_ShowRoleHead , false )		-- 頭像框
	SetModeEx( Obj , EM_SetModeType_Fight , false )				-- 可砍殺攻擊
	SetModeEx( Obj , EM_SetModeType_Show , false )				-- 顯示
	AddToPartition( Obj , RoomID )

	return Obj
end

function LuaPE_ZONE17_PE01_CreateFarmer()--農夫產生
	local Var = ZONE17_PE01_Var
	local Phase = ZONE17_PE01_Phase
	local FlagID = Var["FlagID"]					
	local FarmerID = Var["FarmerID"]				--農夫物件ID
	local Controller = Var["Controller"]			--中控物件
	local MaxFarmer = Var["MaxFarmer"]				--場上最大農夫數量	
	local TimeSpace = Var["TimeSpace"]				--計時間隔(秒)
	local TimeCreateFarmer = Var["TimeCreateFarmer"]--每次間隔出場的農夫數目
	local RoomID = Var["RoomID"]
	local FarmerNum = 0								--場上目前農夫數量	
	local CreateFarmer								--實際產生數量

	while true do
		Phase = ZONE17_PE01_Phase
		if Phase < 2 and Phase > 4 then break end --停止
		FarmerNum = ReadRoleValue( Controller, EM_RoleValue_Register2 )	--讀取農夫數量
		if FarmerNum < MaxFarmer then
			CreateFarmer = MaxFarmer - FarmerNum
			if CreateFarmer >= TimeCreateFarmer then
				CreateFarmer = TimeCreateFarmer - FarmerNum
				LuaPE_ZONE17_PE01_ObjCreate( FarmerID , FlagID , nil, TimeCreateFarmer )
			elseif CreateFarmer < TimeCreateFarmer then
				LuaPE_ZONE17_PE01_ObjCreate( FarmerID , FlagID , nil, CreateFarmer )				
			end
		end
		Sleep( TimeSpace*10 ) --生產間隔
	end
end

function LuaPE_ZONE17_PE01_CreateMst()--產生剎牙
	local Phase = ZONE17_PE01_Phase
	local Var = ZONE17_PE01_Var				
	local FlagID = Var["FlagID"]					
	local Controller = Var["Controller"]			-- 中控物件
	local MstID = Var["MstID"]						-- 怪物物件ID
	local BossFlagID = ZONE17_PE01_Var["BossFlagID"]-- Boss產生旗標	
	local MaxMst = Var["MaxMst"]					-- 場上最大剎牙數量
	local TimeCreateMst = Var["TimeCreateMst"]		-- 每次間隔出場的剎牙數目
	local TimeSpace = Var["TimeSpace"]				-- 計時間隔(秒)
	local MstNum = 0								-- 場上目前剎牙數量
	local CreateMst	= 0								-- 實際產生數量
	local FlagObjID
	
	while true do
		Phase = ZONE17_PE01_Phase		
		if Phase < 2 and Phase > 4 then break --停止
		elseif Phase == 4 then 
			FlagID = BossFlagID
			FlagObjID = 0
		end
		MstNum = ReadRoleValue( Controller, EM_RoleValue_Register1 ) --讀取剎牙數量
		if MstNum < MaxMst then
			CreateMst = MaxMst - MstNum
			if CreateMst >= TimeCreateMst then				
				LuaPE_ZONE17_PE01_ObjCreate( MstID[3] , FlagID, FlagObjID, TimeCreateMst )
			elseif CreateMst < TimeCreateMst then
				LuaPE_ZONE17_PE01_ObjCreate( MstID[3] , FlagID, FlagObjID, CreateMst )
			end		
		end				
		Sleep( TimeSpace*10 ) --生產間隔
	end
end

function LuaPE_ZONE17_PE01_CreateBoss()--產生孟犽
	local BossFlagID = ZONE17_PE01_Var["BossFlagID"]-- Boss產生旗標
	local MstID = ZONE17_PE01_Var["MstID"]						-- 怪物物件ID
	
	ZONE17_PE01_Var["MstBoss"] = LuaPE_ZONE17_PE01_ObjCreate( MstID[4] , BossFlagID , 0, 1 )	
end

function LuaPE_ZONE17_PE01_CreateCrop()
	local FlagID = ZONE17_PE01_Var["BossFlagID"]
	local CropCarID = ZONE17_PE01_Var["CropCarID"]
	local MaxCropLoss = ZONE17_PE01_Var["MaxCropLoss"]
	local RoomID = ZONE17_PE01_Var["RoomID"]	
	local GetCropCar = ZONE17_PE01_Var["GetCropCar"]
	local GetCrop = ZONE17_PE01_Var["GetCrop"]
	local CropNum = ZONE17_PE01_Var["CropNum"]
	local Num = math.floor(GetCrop/CropNum)
	local mod = GetCrop%CropNum
	local Obj = {}
	if mod >= math.floor(CropNum/2) then GetCropCar = GetCropCar + 1 end
	PE_SetVar( "ZONE17_PE01_Var_CropLoss" , MaxCropLoss - GetCropCar )		-- PE變數改變
	ZONE17_PE01_Var["CropLoss"] = MaxCropLoss - GetCropCar
	ZONE17_PE01_Var["GetCropCar"] = GetCropCar
	debugmsg( 0, 0, "GetCropCar = " ..ZONE17_PE01_Var["GetCropCar"] )
	
	if GetCropCar > 0 then
		for i=0, GetCropCar-1 do
			if mod >= math.floor(CropNum/2) and i == GetCropCar-1 then
				Obj[i] = KS_CreateObjMode( CropCarID[1], FlagID , i+1, 20, 1, 0 )
			else
				Obj[i] = KS_CreateObjMode( CropCarID[2], FlagID , i+1, 20, 1, 0 )
			end
			SetModeEx( Obj[i] , EM_SetModeType_Mark , true )			-- 標記
			SetModeEx( Obj[i] , EM_SetModeType_Strikback , false )		-- 反擊
			SetModeEx( Obj[i] , EM_SetModeType_Searchenemy , false )	-- 索敵
			SetModeEx( Obj[i] , EM_SetModeType_Move, false )			-- 移動
			SetModeEx( Obj[i] , EM_SetModeType_ShowRoleHead, false )	-- 頭像框
			SetModeEx( Obj[i] , EM_SetModeType_Fight , true )			-- 可砍殺攻擊
			AddBuff( Obj[i] , 506303 , 0 , -1 )--AE減傷
			AddBuff( Obj[i] , 507532 , 0 , -1 )--不會回HP/SP
			AddBuff( Obj[i] , 507514 , 0 , -1 ) -- 治療免疫
			AddToPartition( Obj[i] , RoomID )
			table.insert( ZONE17_PE01_Obj , Obj[i] )					-- 加入物件管理陣列
			table.insert( ZONE17_PE01_CropCar, Obj[i] )
			SetPlot( Obj[i], "DEAD", "LuaPE_ZONE17_PE01_CropLoss", 0 )
		end	
	end
end

--物件產生
function LuaPE_ZONE17_PE01_ObjCreate( ObjID, FlagID, FlagObjID, ObjNum )
	local Obj = {}
	local ObjType
	local Phase = ZONE17_PE01_Phase
	local RoomID = ZONE17_PE01_Var["RoomID"]
	local FarmerID = ZONE17_PE01_Var["FarmerID"]				-- 農夫ID
	local MstID = ZONE17_PE01_Var["MstID"]						-- 怪物ID
	local Controller = ZONE17_PE01_Var["Controller"]			-- 中控物件
	local FlagNum = ZONE17_PE01_Var["FlagNum"]					-- 旗幟數量
	local count
	
	for i = 1 , ObjNum do
		if FlagObjID == nil then
			FlagObjID = rand(FlagNum)+1
		end
		
		if ObjID ~= FarmerID then
			if FlagID == nil then
				Obj[i] = KS_CreateObjMode( ObjID, FlagObjID, nil, 25, 1, 0 )
			else				
				Obj[i] = KS_CreateObjMode( ObjID, FlagID , FlagObjID,  25, 1, 0 )
			end
			ObjType = 1
		else
			Obj[i] = KS_CreateObjMode( ObjID[rand(4)+1], FlagID , FlagObjID,  30, 1, 0 )
			ObjType = 2				
		end

		Sleep(2)
		if ReadRoleValue( Obj[i], EM_RoleValue_OrgID ) == MstID[4] then
			BeginPlot( Obj[i], "LuaPE_ZONE17_PE01_BossWork", 0 )		-- 開始工作
			SetModeEx( Obj[i] , EM_SetModeType_Strikback , false )		-- 反擊
		else
			BeginPlot( Obj[i], "LuaPE_ZONE17_PE01_MoveWork", 0 ) 		-- 開始工作
			SetModeEx( Obj[i] , EM_SetModeType_Strikback , true )		-- 反擊
		end
		WriteRoleValue( Obj[i] , EM_RoleValue_IsWalk , 1 )			-- 用跑的移動
		SetModeEx( Obj[i] , EM_SetModeType_Mark , true )			-- 標記				
		SetModeEx( Obj[i] , EM_SetModeType_Searchenemy , true )		-- 索敵
		SetModeEx( Obj[i] , EM_SetModeType_Fight , true )			-- 可砍殺攻擊
		AddToPartition( Obj[i] , RoomID )
		MoveToFlagEnabled( Obj[i] , false )							-- 關閉巡邏劇情
		table.insert( ZONE17_PE01_Obj , Obj[i] )					-- 加入物件管理陣列
		AddBuff( Obj[i] , 506303 , 0 , -1 )							-- 防AE的Buff					
			
		if ObjType == 1 then				--怪物
			count = ReadRoleValue( Controller, EM_RoleValue_Register1 )
			WriteRoleValue( Controller, EM_RoleValue_Register1, count+1 )
			SetPlot( Obj[i], "DEAD", "LuaPE_ZONE17_PE01_MstDead", 0 )
		elseif ObjType == 2 then		--農夫
			count = ReadRoleValue( Controller, EM_RoleValue_Register2 )
			WriteRoleValue( Controller, EM_RoleValue_Register2, count+1 )			
			SetPlot( Obj[i], "DEAD", "LuaPE_ZONE17_PE01_FarmerDead", 0 )
		end
		
		FlagObjID = nil
	end
	return Obj
end
--==================================================--



--==================================================--
--    死亡處理區                       				--
--==================================================--

function LuaPE_ZONE17_PE01_Weeds() --地圖原始怪物掛載
	SetPlot( OwnerID(), "DEAD", "LuaPE_ZONE17_PE01_MstDead", 0 )
	while true do
		if ZONE17_PE01_Phase > 1 then
			DelObj(OwnerID())
		end
		sleep(30)
	end
end

function LuaPE_ZONE17_PE01_FarmerDead()	
	if ZONE17_PE01_Phase > 0 and ZONE17_PE01_Phase < 5 then
		local Var = ZONE17_PE01_Var
		local Controller = Var["Controller"]		-- 控制物件
		local FarmerDead = Var["FarmerDead"]		-- 目前被殺農夫數目
		local FlagID = Var["FlagID"]
		local count
		local Message = "[SC_PE_ZONE17_01_M09]" 				--我先休息一會。
		
		FarmerDead = FarmerDead + 1		-- 死亡計數
		Var["FarmerDead"] = FarmerDead
		PE_SetVar( "ZONE17_PE01_Var_MaxFarmerDead" , FarmerDead )		-- PE變數改變
		count = ReadRoleValue( Controller, EM_RoleValue_Register2 )
		WriteRoleValue( Controller, EM_RoleValue_Register2, count-1 )
		
		NPCSay( OwnerID(), Message )
		DelObj(OwnerID())	
		return false
	end
	--debugmsg(0,0,"true dead")
	return true
end

function LuaPE_ZONE17_PE01_MstDead()	
	if ZONE17_PE01_Phase > 0 and ZONE17_PE01_Phase < 5 then
		local PEIndex = ZONE17_PE01_PEIndex
		local Phase = ZONE17_PE01_Phase
		local Controller = ZONE17_PE01_Var["Controller"]	-- 控制物件
		local MstDead = ZONE17_PE01_Var["MstDead"]			-- 目前殺死怪物數量
		local MaxMst = ZONE17_PE01_Var["MaxMst"]			-- 場上最大剎牙數量
		local MaxMstDead = ZONE17_PE01_Var["MaxMstDead"]	-- 最大剎牙死亡數量
		local MstID = ZONE17_PE01_Var["MstID"]				-- 怪物ID
		local MapID = ZONE17_PE01_Var["MapID"]				-- 區域地圖編號
		local Bonus = ZONE17_PE01_Var["Bonus"]
		local WeedDead = ZONE17_PE01_Var["WeedDead"] 
		local ObjID = ReadRoleValue( OwnerID() , EM_RoleValue_OrgID )
				
		if ObjID == MstID[1] and Phase == 1 then
			WeedDead = WeedDead + 1
			ZONE17_PE01_Var["WeedDead"] = WeedDead				-- 雜草死亡數量
			PE_SetVar( "ZONE17_PE01_Var_WeedDead" , WeedDead )	-- PE變數改變 雜草掛掉
			--debugmsg(0,0,"MstDead 1")
			ks_CreateObj_reset(false)
		elseif Phase == 4 then
			local count = ReadRoleValue( Controller, EM_RoleValue_Register1 )
			WriteRoleValue( Controller, EM_RoleValue_Register1, count-1 )
			ZONE17_PE01_Var["MstDead"] = MstDead + 1		-- 剎牙死亡數量
			--debugmsg(0,0,"MstDead 3")
		end
		
		if ObjID == MstID[4] then	--Boss死亡
			LuaPE_KS_GetBonus( PEIndex, MapID, Bonus[Phase]*20 )
			PE_SetVar( "ZONE17_PE01_Var_BossDead", 1 )
			ZONE17_PE01_TotalScore = ZONE17_PE01_TotalScore + Bonus[Phase]*20
			debugmsg(0,0,"BossDead")
			return true
		else			
			LuaPE_KS_GetBonus( PEIndex, MapID, Bonus[Phase] )         -- 擊殺給予分數
			ZONE17_PE01_TotalScore = ZONE17_PE01_TotalScore + Bonus[Phase]
		end		
		return true
	else
		ks_CreateObj_reset(false)
		return true		
	end
end

function LuaPE_ZONE17_PE01_CropLoss()
	local CropLoss = ZONE17_PE01_Var["CropLoss"]
	CropLoss = CropLoss + 1
	ZONE17_PE01_Var["CropLoss"] = CropLoss
	PE_SetVar( "ZONE17_PE01_Var_CropLoss", CropLoss )
	debugmsg(0,0,"CropLoss = "..ZONE17_PE01_Var["CropLoss"])
	WriteRoleValue( OwnerID(), EM_RoleValue_LiveTime, 2 )
	return true
end

--==================================================--

--==================================================--
--  	法術集合處理區                      		--
--==================================================--

function LuaPE_ZONE17_PE01_CheckCrop()
	local Obj = TargetID()
	local Crop1ID = ZONE17_PE01_Var["Crop1ID"]
	local Crop2ID = ZONE17_PE01_Var["Crop2ID"]
	local CropCarID = ZONE17_PE01_Var["CropCarID"]
	local MstID = ZONE17_PE01_Var["MstID"]
	local FarmerID = ZONE17_PE01_Var["FarmerID"]
	local OrgID = ReadRoleValue( Obj, EM_RoleValue_OrgID )
	local O_ID = ReadRoleValue( OwnerID(), EM_RoleValue_OrgID )
	
	for i=1, table.getn(MstID) do
		if O_ID == MstID[i] then
			for j=2, table.getn( Crop1ID ) do
				if ( OrgID == Crop1ID[j] or OrgID == Crop2ID[j] ) or OrgID == CropCarID[1] or OrgID == CropCarID[2] then					
					WriteRoleValue( OwnerID(), EM_RoleValue_Register1, Obj )
					return true
				end
			end
		end
	end
	for i=1, table.getn( FarmerID ) do		
		if O_ID == FarmerID[i] then
			if ZONE17_PE01_Phase < 4 then
				for j=1, table.getn(Crop1ID) do
					if ( OrgID == Crop1ID[j] or OrgID == Crop2ID[j] ) and ( OrgID ~= Crop1ID[3] or OrgID ~= Crop2ID[3] )then
						WriteRoleValue( OwnerID(), EM_RoleValue_Register1, Obj )
						return true
					end
				end
			elseif ZONE17_PE01_Phase == 4 then
				for i=1, table.getn(MstID) do
					if OrgID == MstID[i] then
						WriteRoleValue( OwnerID(), EM_RoleValue_Register1, Obj )					
						return true
					end
				end			
			end
		end
	end	
	return false
end

function LuaPE_ZONE17_PE01_Working()
	local O_ID = OwnerID() --NPC
	local T_ID = TargetID()--點擊物
	local MstID = ZONE17_PE01_Var["MstID"]
	local FlagID = ZONE17_PE01_Var["FlagID"]
	local FarmerID = ZONE17_PE01_Var["FarmerID"]
	local OrgID = ReadRoleValue( O_ID, EM_RoleValue_OrgID )
	local T_OrgID = ReadRoleValue( T_ID, EM_RoleValue_OrgID )
	local CropPhase = LuaPE_ZONE17_PE01_GetCropPhase( T_OrgID )
	local Phase = ZONE17_PE01_Phase
	for i=1, table.getn(FarmerID) do
		if OrgID == FarmerID[i] then
			if Phase < 4 then
				if ReadRoleValue( T_ID, EM_RoleValue_Register3 ) == 0 then
					WriteRoleValue( T_ID, EM_RoleValue_Register3, 1 )--不能點擊				
					if CropPhase == 4 then
						ZONE17_PE01_Var["GetCrop"] = ZONE17_PE01_Var["GetCrop"] + 1						
						debugmsg(0,0,"GetCrop = "..ZONE17_PE01_Var["GetCrop"])
						LuaPE_ZONE17_PE01_Message( 9 , C_DEFAULT ) -- 採收成功訊息
						SetPlot( T_ID, "TOUCH", "", 0 )	
						DelObj(T_ID)
					elseif CropPhase < 3 then
						BeginPlot( T_ID, "LuaPE_ZONE17_PE01_CropMode", 0 )
					end
				end
			end
			WriteRoleValue( O_ID, EM_RoleValue_Register1, 0 )			
			break
		elseif OrgID == MstID[i] then
			if CropPhase > 1 then
				DelObj(T_ID)				
				break
			end
			WriteRoleValue( O_ID, EM_RoleValue_Register1, 0 )
		end
	end
	WriteRoleValue( O_ID, EM_RoleValue_Register1, 0 )--無對象
end

--==================================================--

--==================================================--
--  	AI 移動處理區                      			--
--==================================================--

function LuaPE_ZONE17_PE01_MoveWork()
	local Message = ZONE17_PE01_Message
	local FarmerID = ZONE17_PE01_Var["FarmerID"]
	local MstID = ZONE17_PE01_Var["MstID"]
	local BossFlagID = ZONE17_PE01_Var["BossFlagID"]
	local OrgID = ReadRoleValue( OwnerID(), EM_RoleValue_OrgID )			
	local type = 0
	local time

	for i=1, table.getn(FarmerID) do
		if OrgID == FarmerID[i] then
			type = 1
			break
		end
	end
	while true do
		local Phase = ZONE17_PE01_Phase
		local MaxCropLoss = ZONE17_PE01_Var["MaxCropLoss"]
		local CropLoss = ZONE17_PE01_Var["CropLoss"]	

		AddBuff( OwnerID() , 506303 , 0 , -1 ) -- 防AE Buff	
		if CheckID( OwnerID() ) ~= true or ReadRoleValue( OwnerID() , EM_RoleValue_IsDead ) == 1 then
			LuaPE_KS_StopAttack( OwnerID() ) --停止攻擊
			break
		elseif Phase > 4 then
			LuaPE_KS_StopAttack( OwnerID() ) --停止攻擊
			break			
		end
		
		local Obj = Role:new( OwnerID())
		if Obj:IsAttack() ~= true and HateListCount( OwnerID() ) == 0 then
			if rand(10)+1 > 8 and type == 1 and Phase < 4 then				
				NPCSay( OwnerID(), Message[rand(5)+1] )
			end
			if Phase == 4 then
				WriteRoleValue( OwnerID(), EM_RoleValue_IsWalk , 0 )
			else
				WriteRoleValue( OwnerID(), EM_RoleValue_IsWalk , 1 )
			end
			local target = ReadRoleValue( OwnerID(), EM_RoleValue_Register1 )
			local work = ReadRoleValue( target, EM_RoleValue_Register3 )
			if target ~= 0 and CheckID(target) == true then
				if Phase < 4 and work == 0 then											
					while true do						
						if GetDistance( OwnerID(), target ) <=25 then
							StopMove( OwnerID(), true )
							SetModeEx( OwnerID(), EM_SetModeType_Move , false )
							CastSpell( OwnerID(), target, 495836 )--採集
						end
						sleep(5)
						local MagicID = ReadRoleValue( OwnerID(), EM_RoleValue_SpellMagicID )
						work = ReadRoleValue( target, EM_RoleValue_Register3 )
						if MagicID ~= 0 and HateListCount( OwnerID() ) == 0 and work == 0 then
							if type == 1 then
								PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_CROUCH_BEGIN )
								PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_CROUCH_LOOP )
							else
								PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_IDLE2 )
							end
						else
							PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_IDLE )
							SetModeEx( OwnerID(), EM_SetModeType_Move , true )
							time = ks_MoveToObj( OwnerID(), target, 30 )--移動到目標
							break
						end
						sleep(time+10)
					end	
				elseif Phase < 4 and work ~= 0 then
					WriteRoleValue( OwnerID(), EM_RoleValue_Register1 , 0 )
				elseif Phase == 4 then
					time = ks_MoveToObj( OwnerID(), target, 30 )--移動到目標
					sleep(time+5)
					if ReadRoleValue( target, EM_RoleValue_IsPlayer ) ~= 1 and type == 0 then
						SetAttack( OwnerID() , target )
					end
				end
			else
				StopMove( OwnerID(), true )
				if target ~= 0 then DelObj(target) end
				if Phase == 4 then
					local CropCar = ZONE17_PE01_CropCar
					for i=1, table.getn(CropCar) do
						if CheckID(CropCar[i]) == true then
							WriteRoleValue( OwnerID(), EM_RoleValue_Register1 , CropCar[i] )
							time = ks_MoveToObj( OwnerID(), CropCar[i], 30 )							
							break
						end											
					end									
				else
					time = ks_MoveToObj( OwnerID(), OwnerID(), 30 )--自身周圍亂數移動
				end
				sleep(time+10)
				CastSpell( OwnerID(), OwnerID(), 495835 )--搜尋判斷				
			end
		else
			if rand(10)+1 > 9 and type == 1 and Phase < 4 then		
				NPCSay( OwnerID(), Message[rand(2)+6] )
			elseif rand(10)+1 > 9 and type == 1 and Phase == 4 then
				NPCSay( OwnerID(), Message[rand(3)+6] )
			end
		end
		sleep( 10 )
	end
end

function LuaPE_ZONE17_PE01_BossWork()
	local time = 0
	local times = 0
	local target
	local magic = { [1] = 496043;--鳴叫
					[3] = 496042;--高亢	
					[7] = 496044;--混亂									
					}	
	
	while true do		
		AddBuff( OwnerID() , 507525 , 0 , -1 ) -- 免疫擊退
		AddBuff( OwnerID() , 506303 , 0 , -1 ) -- 防AE Buff
		SetModeEx( OwnerID() , EM_SetModeType_Strikback , false )	-- 反擊
		SetModeEx( OwnerID() , EM_SetModeType_Searchenemy , false )	-- 索敵
		WriteRoleValue( OwnerID(), EM_RoleValue_IsWalk , 0 )
		local Phase = ZONE17_PE01_Phase
		if CheckID( OwnerID() ) ~= true or ReadRoleValue( OwnerID() , EM_RoleValue_IsDead ) == 1 then
			LuaPE_KS_StopAttack( OwnerID() ) --停止攻擊
			break
		elseif Phase > 4 then
			LuaPE_KS_StopAttack( OwnerID() ) --停止攻擊
			break			
		end
		
		local Obj = Role:new( OwnerID())
		local CropCar = ZONE17_PE01_CropCar
		for i=1, table.getn(CropCar) do
			if CheckID(CropCar[i]) == true then
				CastSpell( CropCar[i], OwnerID(), 495767 )--作物袋挑釁
				if GetDistance( OwnerID(), CropCar[i] ) <= 30 then
					SetAttack( OwnerID() , CropCar[i] )
				else
					ks_MoveToObj( OwnerID(), CropCar[i], 30 )
				end
				target = CropCar[i]
				break
			end
		end		
		if Obj:IsAttack() ~= true and HateListCount( OwnerID() ) == 0 then
			
		else			
			local AttackTID = ReadRoleValue( OwnerID(), EM_RoleValue_AttackTargetID )
			if ReadRoleValue( AttackTID, EM_RoleValue_IsPlayer ) == 1 then
				SetStopAttack( OwnerID() )
				CastSpell( OwnerID(), OwnerID(), 495874 )--清除仇恨
			elseif target ~= nil then 				
				while true do
					local Distance = GetDistance( OwnerID(), target )
					if Distance < 80 then										
						time = ks_MoveToObj( OwnerID(), target, 30 )						
					else
						CastSpell( OwnerID(), target, 496142 )--衝撞						
					end					
					sleep(time+10)
					if Distance <= 30 then break end
				end				
				SetAttack( OwnerID() , target )				
			end			
			
			if magic[times] ~= nil then
				CastSpell( OwnerID(), OwnerID(), magic[times] )--放法術			
			end
			if times == 10 then times = 0 end
			times = times + 1
		end
		sleep( 10 )
	end
end



--==================================================--


--==================================================--
--  			作物觸碰劇情區                  	--
--==================================================--

function LuaPE_ZONE17_PE01_CropPhase()
	local O_ID = OwnerID() --玩家
	local T_ID = TargetID()--點擊物	
	local item = ZONE17_PE01_Var["GiveItem"]
	local OrgID = ReadRoleValue( T_ID, EM_RoleValue_OrgID )
	local Message = ZONE17_PE01_Message
	local CropPhase = LuaPE_ZONE17_PE01_GetCropPhase( OrgID )
	local IsPlayer = ReadRoleValue( T_ID, EM_RoleValue_IsPlayer )
	
	if ReadRoleValue( T_ID, EM_RoleValue_Register3 ) == 0 then
		if CropPhase < 3 then
			if CountBodyItem( O_ID, item[CropPhase] ) > 0 then	--101澆水中 102施肥中
				if BeginCastBarEvent( O_ID, T_ID, Message[100+CropPhase], 40, ruFUSION_ACTORSTATE_CROUCH_BEGIN, ruFUSION_ACTORSTATE_CROUCH_END, 0, "LuaPE_ZONE17_PE01_CropPhaseDo" ) ~= 1 then
					ScriptMessage( O_ID, O_ID, 0,"[SAY_NPC_BUSY]", 0 )
					return
				end
			else
				ScriptMessage( O_ID, O_ID, 1 , "[SC_PE_ZONE17_01_M100][$SETVAR1=[<S>"..item[CropPhase].."]][$SETVAR2=["..OrgID.."]]", 0 )--因為你沒有[$VAR1] ，所以[$VAR2]毫無反應。
				ScriptMessage( O_ID, O_ID, 0 , "[SC_PE_ZONE17_01_M100][$SETVAR1=[<S>"..item[CropPhase].."]][$SETVAR2=["..OrgID.."]]", 0 )
			end
		elseif CropPhase == 3 then
			ScriptMessage( O_ID, O_ID, 1 , Message[13], 0 )	--還沒有成熟。
			ScriptMessage( O_ID, O_ID, 0 , Message[13], 0 )	--還沒有成熟。
		elseif CropPhase == 4 then	-- 104採收中
			if BeginCastBarEvent( O_ID, T_ID, Message[100+CropPhase], 40, ruFUSION_ACTORSTATE_CROUCH_BEGIN, ruFUSION_ACTORSTATE_CROUCH_END, 0, "LuaPE_ZONE17_PE01_CropPhaseDo" ) ~= 1 then
				ScriptMessage( O_ID, O_ID, 0,"[SAY_NPC_BUSY]", 0 )
				return
			end		
		end
	elseif ReadRoleValue( T_ID, EM_RoleValue_Register3 ) ~= 0 then
		ScriptMessage( O_ID, O_ID, 1 , Message[10+CropPhase], 0 )--11已經澆過水了。 12已經施過肥了。
		ScriptMessage( O_ID, O_ID, 0 , Message[10+CropPhase], 0 )
	end
end

function LuaPE_ZONE17_PE01_CropPhaseDo( ObjID, CheckStatus )
	local O_ID = OwnerID() --玩家
	local T_ID = TargetID()--作物
	local PEIndex = ZONE17_PE01_PEIndex
	local Bonus = ZONE17_PE01_Var["Bonus"]
	local MstID = ZONE17_PE01_Var["MstID"]
	local FlagID = ZONE17_PE01_Var["FlagID"]
	local GiveItem = ZONE17_PE01_Var["GiveItem"]
	local OrgID = ReadRoleValue( T_ID, EM_RoleValue_OrgID )
	local CropPhase = LuaPE_ZONE17_PE01_GetCropPhase( OrgID )
	local IsPlayer = ReadRoleValue( T_ID, EM_RoleValue_IsPlayer )
	local MapID = ZONE17_PE01_Var["MapID"]
	
	if CheckStatus ~= 0 then
		if CheckStatus > 0 and ReadRoleValue( T_ID, EM_RoleValue_Register3 ) == 0 then -- 成功				
			EndCastBar( O_ID, CheckStatus )
			WriteRoleValue( T_ID, EM_RoleValue_Register3, 1 )--不能點擊
			
			if CropPhase == 5 then
				GiveBodyItem( O_ID, GiveItem[1], 5 )
				WriteRoleValue( T_ID, EM_RoleValue_Register3, 0 )--不能點擊
				return
			end
			if CropPhase == 4 then
				ZONE17_PE01_Var["GetCrop"] = ZONE17_PE01_Var["GetCrop"] + 1
				LuaPE_ZONE17_PE01_Message( 9 , C_DEFAULT ) -- 採收成功訊息
				debugmsg(0,0,"GetCrop = "..ZONE17_PE01_Var["GetCrop"])
				SetPlot( T_ID, "TOUCH", "", 0 )	
				DelObj(T_ID)
			else
				DelBodyItem( O_ID, GiveItem[CropPhase], 1 )
				if rand(2)+1 >1 then
					CallPlot( T_ID, "LuaPE_ZONE17_PE01_ObjCreate", MstID[2], nil, T_ID, 1 )
				end
			end
			if CropPhase < 4 then
				BeginPlot( T_ID, "LuaPE_ZONE17_PE01_CropMode", 0 )
			elseif CropPhase < 3 and IsPlayer == 1 then
				DelBodyItem( O_ID, item[CropPhase] )
			end
			LuaPE_KS_SetBonus( PEIndex, MapID, Bonus[CropPhase]*2, O_ID )--分數計算	
			--PE_GivePlayerScore( PEIndex , O_ID, Bonus[CropPhase]*2 )
			ZONE17_PE01_TotalScore = ZONE17_PE01_TotalScore + Bonus[CropPhase]*2
		else	-- 失敗
			CheckStatus = -1
			EndCastBar( O_ID, CheckStatus )
		end
	end
end

function LuaPE_ZONE17_PE01_CropMode()
	local O_ID = OwnerID() --作物
	local OrgID = ReadRoleValue( O_ID, EM_RoleValue_OrgID )
	local CropPhase = LuaPE_ZONE17_PE01_GetCropPhase( OrgID )
	local DeadPhase = CropPhase-1
	local Crop1ID = ZONE17_PE01_Var["Crop1ID"]
	local Crop2ID = ZONE17_PE01_Var["Crop2ID"]
	local DeadCrop1ID = ZONE17_PE01_Var["DeadCrop1ID"]
	local CropLiveTime = ZONE17_PE01_Var["CropLiveTime"]
	local FlagID = ZONE17_PE01_Var["FlagID"]
	local MstID = ZONE17_PE01_Var["MstID"]
	local CropType = ZONE17_PE01_Var["CropType"]	
	local Num = ReadRoleValue( O_ID, EM_RoleValue_Register2 )
	local Obj
	
	WriteRoleValue( O_ID, EM_RoleValue_Register3, 1 )
	sleep(CropLiveTime*10)
	if ( CropPhase == 1 and Num < CropType ) or ( CropPhase > 1 and OrgID == Crop1ID[CropPhase] ) then	
		Obj = LuaFunc_CreateObjByObj( Crop1ID[CropPhase+1], O_ID )
		WriteRoleValue( Obj, EM_RoleValue_Register2, Num )
	elseif OrgID == Crop2ID[CropPhase] then		
		Obj = LuaFunc_CreateObjByObj( Crop2ID[CropPhase+1], O_ID )
		WriteRoleValue( Obj, EM_RoleValue_Register2, Num )
	end	
	table.insert( ZONE17_PE01_Obj, Obj )
	CallPlot( Obj, "LuaPE_ZONE17_PE01_CropDead", 2 )
	if CropPhase == 2 then
		BeginPlot( Obj, "LuaPE_ZONE17_PE01_CropMode", 0 )	
		if rand(5)+1 > 3 then
			LuaPE_ZONE17_PE01_ObjCreate( MstID[CropPhase] , nil , Obj, 1 )
		end
	end	
	SetPlot( Obj, "TOUCH", "LuaPE_ZONE17_PE01_CropPhase", 20 )
	SetPlot( OwnerID(), "TOUCH", "", 0 )
	sleep(5)
	DelObj(OwnerID())
end

function LuaPE_ZONE17_PE01_GetCropPhase( OrgID )
	local Crop1ID = ZONE17_PE01_Var["Crop1ID"]
	local Crop2ID = ZONE17_PE01_Var["Crop2ID"]
	local WellID = ZONE17_PE01_Var["WellID"]
	local CropPhase
	for i=1, table.getn(Crop1ID) do
		if OrgID == Crop1ID[i] or OrgID == Crop2ID[i] then
			CropPhase = i
			break
		elseif OrgID == WellID then
			CropPhase = 5
			break
		end
	end
	return CropPhase
end

function LuaPE_ZONE17_PE01_CropDead( Type )	
	local Obj
	if Type == 1 then		
		local time = ZONE17_PE01_Var["PH2Time"]
		Sleep( time*10 )
		if ReadRoleValue( OwnerID(), EM_RoleValue_Register3 ) == 0 then
			DelObj(OwnerID())
		end		
	elseif Type == 2 then --枯萎		
		local OrgID = ReadRoleValue( OwnerID(), EM_RoleValue_OrgID )
		local CropPhase = LuaPE_ZONE17_PE01_GetCropPhase( OrgID )
		local CropLiveTime = ZONE17_PE01_Var["CropLiveTime"]
		local DeadPhase = CropPhase-1
		local Crop1ID = ZONE17_PE01_Var["Crop1ID"]
		local Crop2ID = ZONE17_PE01_Var["Crop2ID"]
		local DeadCrop1ID = ZONE17_PE01_Var["DeadCrop1ID"]
		local DeadCrop2ID = ZONE17_PE01_Var["DeadCrop2ID"]
		Sleep( CropLiveTime*20 )
		if ReadRoleValue( OwnerID(), EM_RoleValue_Register3 ) == 0 then
			if OrgID == Crop1ID[CropPhase] then
				Obj = LuaFunc_CreateObjByObj( DeadCrop1ID[DeadPhase], OwnerID() )			
			elseif OrgID == Crop2ID[CropPhase] then
				Obj = LuaFunc_CreateObjByObj( DeadCrop2ID[DeadPhase], OwnerID() )			
			end
			SetModeEx( Obj , EM_SetModeType_Mark , false )			-- 標記
			SetModeEx( Obj , EM_SetModeType_ShowRoleHead, false )	-- 頭像框
			table.insert( ZONE17_PE01_Obj, Obj )
			sleep(10)
			DelObj(OwnerID())
		end
	end
end

--==================================================--

--==================================================--
--  			NPC設定區		                  	--
--==================================================--

function LuaPE_ZONE17_PE01_setNPC()
	SetPlot( OwnerID(), "TOUCH", "LuaPE_ZONE17_PE01_GetItem", 20 )	
end

function LuaPE_ZONE17_PE01_GetItem()
	local Message = ZONE17_PE01_Message
	local GiveItem = ZONE17_PE01_Var["GiveItem"]
	if CountBodyItem( OwnerID(), GiveItem[1] ) == 0 then
		if BeginCastBarEvent( OwnerID(), TargetID(), Message[103], 20, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "LuaPE_ZONE17_PE01_CropPhaseDo" ) ~= 1 then
			ScriptMessage( TargetID(), TargetID(), 0,"[SAY_NPC_BUSY]", 0 )
			return
		end
	else
		ScriptMessage( OwnerID(), OwnerID(), 1 , "[SC_PE_ZONE17_01_M14][$SETVAR1=[<S>"..GiveItem[1].."]]", 0 )--你已經擁有太多[$VAR1]了。
		ScriptMessage( OwnerID(), OwnerID(), 0 , "[SC_PE_ZONE17_01_M14][$SETVAR1=[<S>"..GiveItem[1].."]]", 0 )
	end
end

function LuaPE_ZONE17_PE01_Say()
	local Phase = ZONE17_PE01_Phase
	local GiveItem = ZONE17_PE01_Var["GiveItem"]
	local Message = ZONE17_PE01_Message	
	
	SetSpeakDetail( OwnerID(), Message[rand(5)+1] )
	if Phase > 0 and Phase < 4 then
		if CountBodyItem( OwnerID(), GiveItem[2] ) == 0 then
			AddSpeakOption( OwnerID(), TargetID(), Message[10], "LuaPE_ZONE17_PE01_get",0) --向他索取肥料。	
		end
	end
end

function LuaPE_ZONE17_PE01_get()
	local GiveItem = ZONE17_PE01_Var["GiveItem"]	
	GiveBodyItem( OwnerID(), GiveItem[2], 5 )	
	CloseSpeak( OwnerID() )
end

function LuaPE_ZONE17_PE01_SetPlotCrop()	
	SetPlot( OwnerID(), "TOUCH", "LuaPE_ZONE17_PE01_CropPhase", 20 )
	CallPlot( OwnerID(), "LuaPE_ZONE17_PE01_CropDead", 1 )
end

--==================================================--

--==================================================--
--    啟動處理區                   				  	--
--==================================================--

function LuaPE_ZONE17_PE01_Reset()
	local Mode = 1
	LuaPE_ZONE17_PE01_Start(1)
end



function LuaPE_ZONE17_PE01_Start( Mode )
	local Temp
	if ZONE17_PE01_Obj ~= nil then
		Temp = ZONE17_PE01_Var["Controller"]
		LuaPE_ZONE17_PE01_DelObj()
	end
	
	LuaPE_ZONE17_PE01_GlobalSet()	-- 共用變數設定
	if Mode == nil then
		LuaPE_ZONE17_PE01_PESet()		-- 公眾事件設定
	end
	
	local ControllerID = ZONE17_PE01_Var["ControllerID"]
	local RoomID = ZONE17_PE01_Var["RoomID"]
	if ZONE17_PE01_Var["Controller"] == 0 then
		ZONE17_PE01_Var["Controller"] = OwnerID()
	end
	local Controller = LuaPE_ZONE17_PE01_CreaterSet( ControllerID, RoomID )	-- 設定控制物件	
	ZONE17_PE01_Var["Controller"] = Controller
	
	BeginPlot( Controller, "LuaPE_ZONE17_PE01_CreateControl", 0 )
	
	if temp ~= nil then
		DelObj( Temp )
	end
end

function LuaPE_ZONE17_PE01_CreateControl()
	local Phase = ZONE17_PE01_Phase
	local CreaterID = ZONE17_PE01_Var["CreaterID"]		-- 種怪控制
	local ControllerID = ZONE17_PE01_Var["ControllerID"] -- PE控制
	local FlagID = ZONE17_PE01_Var["FlagID"]			-- 旗子ID
	local RoomID = ZONE17_PE01_Var["RoomID"]
	local Creater = LuaPE_ZONE17_PE01_CreaterSet( CreaterID , RoomID )	-- 設定控制物件
	ZONE17_PE01_Var["Creater"] = Creater
	ZONE17_PE01_Obj[1] = Creater	-- 將操作物件加入第一項
	
	BeginPlot( Creater, "LuaPE_ZONE17_PE01_create", 0 )
end

function LuaPE_ZONE17_PE01_create()
	local FlagObjID = ZONE17_PE01_Var["FlagID"] --旗幟物件編號
	local FlagNum = ZONE17_PE01_Var["FlagNum"] 	--旗幟數量
	local Phase = ZONE17_PE01_Phase 			--階段	
	local CreateTime = ZONE17_PE01_Var["CreateTime"] --重製時間(秒)
	local Range = 30							--生產範圍
	local Gravity = true 						--重力
	local Move = false							--移動
	local ObjNum = math.floor( FlagNum / 4 )	--種植物件數量
	local Obj									--種植物件編號									
	
	if Phase < 2 then
		Obj = ZONE17_PE01_Var["MstID"]		
		ks_CreateObj( FlagObjID, FlagNum, Obj[1], ObjNum, CreateTime, Range, Gravity, Move )
	else
		local create = {}
		Obj = ZONE17_PE01_Var["Crop1ID"]
		for i=0, FlagNum do
			local x = GetMoveFlagValue( FlagObjID, i , EM_RoleValue_X ) 
			local y = GetMoveFlagValue( FlagObjID, i , EM_RoleValue_Y ) 
			local z = GetMoveFlagValue( FlagObjID, i , EM_RoleValue_Z ) 
			create[i] = CreateObj( Obj[1], x, y, z, 0, 1 )
			AddToPartition( create[i], 0 )
			WriteRoleValue( create[i], EM_RoleValue_Register2, i )
			table.insert( ZONE17_PE01_Obj , create[i] )					-- 加入物件管理陣列
			WriteRoleValue( create[i], EM_RoleValue_LiveTime, 900 )
		end
	end		
end

--==================================================--

--==================================================--
--		刪除物件與測試處理區						--
--==================================================--

function LuaPE_ZONE17_PE01_DelCreater()
	local Creater = ZONE17_PE01_Var["Creater"]
	DelObj(Creater)--刪除生產控製物件
end

function LuaPE_ZONE17_PE01_DelObj()
	local Obj = ZONE17_PE01_Obj
	local ObjNum = table.getn(Obj)
	local count = 0
	local type
	if ObjNum > 0 then
		for i = 1, ObjNum do
			if Obj[i] ~= nil then
				DelObj( Obj[i] )
			end			
		end
	end
end

function LuaPE_ZONE17_PE01_test()
	local Phase = ZONE17_PE01_Phase
	LuaPE_ZONE17_PE01_PhaseDO( Phase )	
end


--==================================================--
function LuaPE_ZONE17_PE01_TimeFly()--快速結束重置時間
	PE_SetVar("ZONE17_PE01_ResetTime", 1);
end
function LuaPE_ZONE17_PE01_Pass1()--快速結束第1階段
	PE_GivePlayerScore( ZONE17_PE01_PEIndex , OwnerID() , 1000 );
	PE_SetVar("ZONE17_PE01_Var_WeedDead", 40);
end
function LuaPE_ZONE17_PE01_Pass2()--快速結束第2階段
	PE_GivePlayerScore( ZONE17_PE01_PEIndex , OwnerID() , 1000 );
	PE_SetVar("ZONE17_PE01_Var_MaxFarmerDead", 0);
	ZONE17_PE01_Var["GetCropCar"]=80;
	PE_SetVar("ZONE17_PE01_PH2Time", 1);
end
function LuaPE_ZONE17_PE01_Pass3()--快速結束第3階段
	PE_GivePlayerScore( ZONE17_PE01_PEIndex , OwnerID() , 1000 );
	PE_SetVar("ZONE17_PE01_Var_MaxFarmerDead", 0);
	ZONE17_PE01_Var["GetCropCar"]=80;
	PE_SetVar("ZONE17_PE01_PH3Time", 1);
end
function LuaPE_ZONE17_PE01_Pass4()--快速結束王出現前的倒數
	PE_GivePlayerScore( ZONE17_PE01_PEIndex , OwnerID() , 1000 );
	PE_SetVar("ZONE17_PE01_Var_CropLoss", 0);
	ZONE17_PE01_Var["GetCropCar"]=80;
	PE_SetVar("ZONE17_PE01_PH4Time", 1);
end