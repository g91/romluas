
function DW_AirLineMenu(TYPE,WDBNum,ZoneNum,PointNum)--查詢中心
	--下表為可用TYPE列表
	--"InquiryCost"
	--查詢收費
	--"PointQuantity"
	--節點數量
	--"ZoneQuantity"
	--區域數量
	--"KeyString"
	--區域名稱
	--"AllowPass"
	--是否允許通行
	
	if	TYPE == nil	then
		TYPE = "InquiryCost"--預設是查詢收費
	end
	--陣列關係表(新點要設)
	--WDBNum>ZoneNum>PointNum>花費金額
	local AirPointData = {}
	AirPointData[1] = {}
	AirPointData[1][2] = {20}							--銀湧之野節點傳送費用
	AirPointData[2] = {}
	AirPointData[2][15] = {2000}							--雷蹄之丘節點傳送費用
	AirPointData[3] = {}
	AirPointData[3][13] = {250,400,1000,1800}						--派利寇海岸節點傳送費用
	AirPointData[3][14] = {2200,2200,2200}						--賽薇亞拉節點傳送費用
	AirPointData[4] = {}
	AirPointData[4][22] = {2200}							--諾里吉安國遺址傳送費用
	AirPointData[4][23] = {2200}
	AirPointData[4][24] = {2200}
	AirPointData[4][25] = {2200}
	AirPointData[4][26] = {2200}
	AirPointData[5] = {}							--海盜島傳送費用
	AirPointData[5][27] = {3000}
	AirPointData[5][28] = {3000}
	AirPointData[5][29] = {3000}
	AirPointData[5][30] = {3000}
	AirPointData[6] = {}							--克魯迪亞大陸傳送費用
	AirPointData[6][32] = {6000}
	AirPointData[6][33] = {6000}
	AirPointData[6][34] = {6000}


	--字串查詢表(新點要設)
	local AirPointString = {}
	AirPointString[1] = {}
	AirPointString[1][2] = {	"[ZONE_SILVERSPRING]"					--銀湧之野
										}
	AirPointString[2] = {}
	AirPointString[2][15] = {	"[ZONE_THUNDERHOOF_MESA]"			--雷蹄之丘
										}
	AirPointString[3] = {}
	AirPointString[3][13] = {	"[ZONE_HARFEN_CAMP]",				--海爾芬營地
					"[ZONE_LANZERD_HORDE]",				--蘭薩德部落
					"[ZONE_WILDERNESS_RESEARCH_CAMP]",		--荒原調查營地
					"[ZONE_TEMPORARY_FANGT_CAMP]"			--凡蓋德臨時
										}
	AirPointString[3][14] = {	"[ZONE_RUINS_TESTING_CAMP]",			--遺跡調查營地
					"[ZONE_JINNERS_CAMP]",				--居尼爾斯
					"[ZONE_FRONT_LINES_CAMP]"				--決戰先鋒營地
										}
	AirPointString[4] = {}
	AirPointString[4][22] = {	"[ZONE_Z22_OLD_ROJAN_KINGDOM]"			--諾里吉安國遺址
										}
	AirPointString[4][23] = {	"[ZONE_Z23_QUESLANA]"				--奇斯特拉艾恩那
										}
	AirPointString[4][24] = {	"[ZONE_Z24_MERDIN_TUNDRA]"			--彌爾丁凍原
										}
	AirPointString[4][25] = {	"[ZONE_Z25_SERBAYT_PASS]"				--希爾卑特隘口
										}
	AirPointString[4][26] = {	"[ZONE_Z26_ZHYRO]"					--薩烏洛
										}
	AirPointString[5] = {}	
	AirPointString[5][27] = {	"[ZONE_Z27_WAILING_FJORD]"				--哀嚎峽灣
										}
	AirPointString[5][28] = {	"[ZONE_Z28_HURTEKKE_JUNGLE]"				--赫特克叢林
										}
	AirPointString[5][29] = {	"[ZONE_Z29_XADIA_BASIN]"				--塞勒裴地亞盆地
										}
	AirPointString[5][30] = {	"[ZONE_Z30_KATHALAN]"					--卡沙愛蘭
										}

	AirPointString[6] = {}
	AirPointString[6][32] = {	"[ZONE_Z32_SPLITWATER]"				--裂水台地
										}
	AirPointString[6][33] = {	"[ZONE_Z33_FAYTEAR_UPLANDS]"				--費泰爾丘陵
										}
--	AirPointString[6][34] = {	"[ZONE_Z30_KATHALAN]"					--日輪谷地
--										}
	--旗標查詢表(新點要設)
	local AirPointFlag = {}
	AirPointFlag[1] = {}
	AirPointFlag[1][2] = {	541314		--銀涌之野
					}
	AirPointFlag[2] = {}
	AirPointFlag[2][15] = {	543704		--雷蹄之丘
					}
	AirPointFlag[3] = {}
	AirPointFlag[3][13] = {
				544980,	--海爾芬營地
				544981,	--蘭薩德營地
				544982,	--荒野調查營地
				545042		--凡蓋德臨時
					}
	AirPointFlag[3][14] = {
				544983,	--遺址調查營地
				545043,	--居尼爾斯
				545044		--決戰先鋒
					}
	AirPointFlag[4] = {}
	AirPointFlag[4][22] = {	546189		--諾里吉安國遺址
					}
	AirPointFlag[4][23] = {	547002  	--奇斯特拉艾恩那
					}
	AirPointFlag[4][24] = {	547003  	--彌爾丁凍原
					}
	AirPointFlag[4][25] = {	547004  	--希爾卑特隘口
					}
	AirPointFlag[4][26] = {	547005  	--希爾卑特隘口
					}
					
	AirPointFlag[5] = {}
	AirPointFlag[5][27] = {	548380	--哀嚎峽灣
					}
	AirPointFlag[5][28] = {	548381  	--開啟赫特克叢林
					}
	AirPointFlag[5][29] = {	548382  	--塞勒裴地亞盆地
					}
	AirPointFlag[5][30] = {	548383  	--卡沙愛蘭
					}

	AirPointFlag[6] = {}
	AirPointFlag[6][32] = {	548978	--裂水台地
					}
	AirPointFlag[6][33] = {	548979	--費泰爾丘陵
					}
	AirPointFlag[6][34] = {	548980  	--日輪谷地
					}


	if	TYPE == "InquiryCost" then
		return AirPointData[WDBNum][ZoneNum][PointNum]				--回傳節點傳送收費
	elseif	TYPE == "PointQuantity" then
		local Num = 0
		for i , n in pairs(AirPointData[WDBNum][ZoneNum]) do
			Num = Num + 1
		end
		return Num 									--回傳節點數量
	elseif	TYPE == "ZoneQuantity" then
		local Num = 0
		for i , n in pairs(AirPointData[WDBNum]) do
			Num = Num + 1
		end
		return Num 									--回傳區域數量
	elseif	TYPE == "KeyString"	then
		return AirPointString[WDBNum][ZoneNum][PointNum]
	elseif	TYPE == "AllowPass"	then							--回傳旗標
		return AirPointFlag[WDBNum][ZoneNum][PointNum]
	else
		return nil
	end
end

function DW_AirPointGoing(Obj,WDBNum,ZoneNum,PointNum)--飛行中心
	--座標定位表(新點要設)
	local AirPointCoordinate = {}					--建立飛行節點資料
	AirPointCoordinate[1] = {}
	AirPointCoordinate[1][2] = {	{2296.9,0,1160.9,60.8}		--銀湧之野
										}
	AirPointCoordinate[2] = {}
	AirPointCoordinate[2][15] = {	{ -4261 , 13 , 5050 , 250 }	--雷蹄之丘
										}
	AirPointCoordinate[3] = {}				
	AirPointCoordinate[3][13] = {	{-6321.8,161.2,-3908.4,189.2},	--海爾芬營地
					{41.7,140,-1154.7,298},		--蘭薩德部落
					{-7413.9,620,1191.3,192.9},	--荒原調查營地
					{-2.5,687,5027.5,290.4}		--凡蓋德臨時
										}
	AirPointCoordinate[3][14] = {	{982.6,326,13358.4,275.9},	--遺跡調查營地
					{12874,55,1955.2,69.9},		--居尼爾斯營地
					{6777.6,95,6312.5,76.3}		--決戰先鋒營地
										}
	AirPointCoordinate[4] = {}
	AirPointCoordinate[4][22] = {	{-20732.1,570,-22756.7,321.3}	--諾里吉安國遺址
										}
	AirPointCoordinate[4][23] = {	{-7794.4,718.8,-16589.3,169.9}	--奇斯特拉艾恩那
										}
	AirPointCoordinate[4][24] = {	{3847.4,444.8,-7769.3,180.9}	--彌爾丁凍原
										}
	AirPointCoordinate[4][25] = {	{ -6557.7, 1452.4, -7719.4, 29 }	--希爾卑特隘口
										}
	AirPointCoordinate[4][26] = {	{ -17896.6, 801.9, -3340.5, 335.9 }	--希爾卑特隘口
										}
	AirPointCoordinate[5] = {}
	AirPointCoordinate[5][27] = {	{-9171.8, 20, 3055, 283.7}	
										}
	AirPointCoordinate[5][28] = {	{ 2587.7, 146.9, 24619, 210}	
										}
	AirPointCoordinate[5][29] = {	{ 7054, 11, 22695, 272} 
										}
	AirPointCoordinate[5][30] = {	{19298.9,45.8,34932.7,134.6 }	
										}

	AirPointCoordinate[6] = {}
	AirPointCoordinate[6][32] = {	{-12978.9, 180.8, 14154.6, 280.5}	
										}
	AirPointCoordinate[6][33] = {	{-4248.7,839.1,5134.2,116.5 }	
										}
	AirPointCoordinate[6][34] = {	{0,0,0,0 }	 
										}

			
	local Shortening = AirPointCoordinate[WDBNum][ZoneNum][PointNum]			--指定代稱
	ChangeZone(Obj,ZoneNum,0,Shortening[1],Shortening[2],Shortening[3],Shortening[4])	--進行傳送
end

function DW_DialogStringChange(WDBNum,ZoneNum,PointNum)--字串轉換中心
	local String = ""
	if  DW_AirLineMenu("InquiryCost",WDBNum,ZoneNum,PointNum)== nil then
		return -1 
	else
		local TransZone_Cost = DW_AirLineMenu("InquiryCost",WDBNum,ZoneNum,PointNum)
		local ZONE_KeyStirng = DW_AirLineMenu("KeyString",WDBNum,ZoneNum,PointNum)
		String = "[SC_111256_DIALOG_0][$SETVAR1="..ZONE_KeyStirng.."][$SETVAR2="..TransZone_Cost.."]" 			--傳送到X需要付費X金
	end 
	return String
end

function DW_AirPortSleepShop(PID)--航空休息站
	local Obj = OwnerID()
	CloseSpeak(Obj)
	CallPlot(Obj,"DW_TransnerDialog",PID)
end

function DW_TransnerDialog(PID)--客服中心
	local Obj = OwnerID()
	local ZoneNum = math.floor(PID/1000)								--範例：14326 => 14 3 2 6
	local WDBNum = (math.floor(PID/100))%10							--wdb3 的 z14 的第2站, wdb3 的第6站
	local PointNum = (math.floor(PID/10))%10	
	local PointTurn = PID%10
	local DialogString = DW_DialogStringChange(WDBNum,ZoneNum,PointNum)			--取得對話字串
	if	DialogString==-1	then
		ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_FIXEQ_DATA_ERROR]",0)			--資料送出有問題
		return 0
	end
	DialogCreate(Obj,EM_LuaDialogType_YesNo,DialogString)
	DialogSelectStr( Obj,"[SO_YES]")
	DialogSelectStr( Obj,"[SO_NO]")
	local Ans = LuaS_DialogRePort_TwoChoose(Obj)
	if	Ans == "Yes"	then
		local Money = DW_AirLineMenu("InquiryCost",WDBNum,ZoneNum,PointNum)
		if ReadRoleValue( Obj,EM_RoleValue_Money ) < Money then
			ScriptMessage( Obj, Obj, 1, "[SAY_MOUTH_ERROR_A]", 0 ); 			--你身上的錢不夠。
		else
			if AddRoleValue( Obj , EM_RoleValue_Money , -(Money) ) then			--交錢
					CastSpell( Obj , Obj , 491008 )					--表演
					sleep( 5 )
					DW_AirPointGoing(Obj,WDBNum,ZoneNum,PointNum)	--飛指定座標
			end
		end
	else
		return false 										--沒有選擇或選擇失敗
	end
end

function DW_AirLineCodeTrans(WDBNum,ZoneNum,PointNum,PointTurn)--航點代碼轉譯表
	return (ZoneNum*1000)+(WDBNum*100)+(PointNum*10)+PointTurn
end

function DW_SetAirLineHome()--回程術記錄
	local Obj = OwnerID()
	local Target = TargetID()
	local Area = LuaS_111256_ZoneID( ReadRoleValue( Obj , EM_RoleValue_ZoneID ) )
	CloseSpeak(Obj)										--關閉對話
	if Area > 99 or Area < 1 then
		ScriptMessage( Obj , Obj , 1 , "[SYS_TOUCH_TARGET_TOFAR]" , 0 )
		return
	end
	if	GetDistance(Obj,Target)>50	then
		ScriptMessage( Obj , Obj , 1 , "[SYS_TOUCH_TARGET_TOFAR]" , 0 )
		return
	end
	local IfSuccessSet = SaveHomePoint(Obj)
	if	IfSuccessSet==true	then
		CastSpell(Obj,Obj,491008)
		ScriptMessage( Obj, Obj, 2, "[SC_SETRECORDPOINT]", C_SYSTEM )
		ScriptMessage( Obj, Obj, 0, "[SC_SETRECORDPOINT]", 0 )
	else
		ScriptMessage( Obj, Obj, 2, "[ST_TRANSFER_FAIL]", C_SYSTEM )
		ScriptMessage( Obj, Obj, 0, "[ST_TRANSFER_FAIL]", 0 )
	end
end

function DW_AirPointInitSet()--航點初始劇情設定
	local Obj = OwnerID()
	SetMinimapIcon ( Obj, 7 )				--設定傳送點小地圖圖示
end