--1. 週日玩家登入後，提示在玩家對話窗
--2. 週日晚上11點，提示在線上玩家對話窗 (要消失了)
--3. 週日凌晨0點，提示在線上玩家對話窗 (出現)

function Lua_Hao_Retrun_Week(Num)	-- 回傳星期
--	DebugMsg( 0 , 0 , Num )
	local String = {}
	String[0] = "Sunday"
	String[1] = "Monday"
	String[2] = "Tuesday"
	String[3] = "Wednesday"
	String[4] = "Thursday"
	String[5] = "Friday"
	String[6] = "Saturday"
	return String[Num]
end

function Lua_Hao_TW_Phirius_Check_Time()	-- 確認時間

	local Player = OwnerID()
	local Room =ReadRoleValue( Player , EM_RoleValue_RoomID )
	local Hour = GetSystime(1)	-- 時
	local Min = GetSystime(2)	-- 分
	local Week			-- 星期

	if Trading_Phirius_Timer ~= -1 and Trading_Phirius_Timer ~= nil then
		Week = Lua_Hao_Retrun_Week(Math.floor(Trading_Phirius_Timer/10000))
		Hour = Math.floor((Trading_Phirius_Timer%10000)/100)
		Min = Trading_Phirius_Timer%100
		DebugMsg( Player , Room , "Week= "..Week.." ".."Custom time: "..string.format("%02d", Hour ).." : "..string.format("%02d", Min ) )			
	else
		Week = Lua_Hao_Retrun_Week(GetSystime(5))	-- 判斷當前星期(0 ~ 6)，星期日為 0，禮拜六為 6
		Hour = GetSystime(1)	-- 時
		Min = GetSystime(2)	-- 分
		DebugMsg( Player , Room , "Week= "..Week.." ".."System time: "..string.format("%02d", Hour ).." : "..string.format("%02d", Min ) )
	end
end

function Lua_Hao_TW_Phirius_Set_Time(Time) -- 自訂設定時間

	local Player = OwnerID()
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local Week , Hour , Min , Set_Hour , Set_Min

	if Time == nil or Type(Time) ~= "number" then
		DebugMsg( Player , Room , "Change to the default Server time." )
		Trading_Phirius_Timer = -1 -- 宣告為 -1
		Week = Lua_Hao_Retrun_Week(GetSystime(5))	-- 判斷當前星期(0 ~ 6)，星期一為 0
		Hour = GetSystime(1)	-- 時
		Min = GetSystime(2)	-- 分
		DebugMsg( Player , Room , "Week= "..Week.." ".."System time: "..string.format("%02d", Hour ).." : "..string.format("%02d", Min ) )
		return false
	end

	if Trading_Phirius_Timer == nil then
		Trading_Phirius_Timer = -1 -- 時間
	end

	Week = Math.floor(Time/10000)
--	Hour = Math.floor(Time/100)
	Hour = Math.floor((Time%10000)/100)
	Min = Time%100
	if Week > 6 or Hour > 23 or Min > 59 then
		DebugMsg( Player , Room , "Week= "..Week.." ".."Costom time: "..string.format("%02d", Hour ).." : "..string.format("%02d", Min ) )
		DebugMsg( Player , Room , "I can't understand what you mean. For example , you can enter 01032 , It means Sunday 10:32 AM , 40707 means Thursday 07:07 AM , 62359 means Saturday 23:59 PM" )
		return false
	else
		Week = Lua_Hao_Retrun_Week(Math.floor(Time/10000))	-- 週
		Hour = GetSystime(1)	-- 時
		Min = GetSystime(2)	-- 分
		Trading_Phirius_Timer = Time	-- 將全域變數宣告為 Time
		Set_Hour = Math.floor((Time%10000)/100)
		Set_Min = Time%100
		DebugMsg( Player , Room , Week.." Custom time: "..Set_Hour.." : "..Set_Min.." System time: "..string.format("%02d", Hour ).." : "..string.format("%02d", Min ) )
	--	DebugMsg( Player , Room , "Custom time: "..string.format("%05d", Trading_Phirius_Timer ).." "..Week.." System time: "..string.format("%02d", Hour ).." : "..string.format("%02d", Min ) )
	end
end

function Lua_Hao_TW_Phirius_Login( PlayerLV , Type , Race )

	local Player = OwnerID()
	local MsgBuff = 623521	-- 提示用時間訊息
	-- 2012.10.29 擋掉 2012.11.21 號前會產生訊息的問題 --
	local Month = GetSystime(3)+1	-- 月
	local Day = GetSystime(4)	-- 日
	-- 2012.12.18 關閉 2012.11.01 ~ 11.21 擋掉提示訊息的設定 -- 
--	if Month == 11 and Day <= 18 then
--		return false
--	end
	-- DebugMsg( Player , 0 , "Type = "..Type )
	--
	if Type == 3 then
		AddBuff( Player , MsgBuff , 0 , -1 )
	end
end

function Lua_Hao_TW_Phirius_Login_Msg()	-- 每次登入時，執行的劇情

	local Week , Hour , Min	-- 週、小時、分鐘
	local Player = OwnerID()
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )

	if Trading_Phirius_Timer ~= -1 and Trading_Phirius_Timer ~= nil then	-- 例如 : 61024 (禮拜日早上10點24分)
	--	Week = Math.floor(Trading_Phirius_Timer/10000)
		Week = Lua_Hao_Retrun_Week(Math.floor(Trading_Phirius_Timer/10000))	
		Hour = Math.floor((Trading_Phirius_Timer%10000)/100)
		Min = Trading_Phirius_Timer%100
	--	DebugMsg( Player , Room , "Week= "..Week.." ".."Custom time: "..string.format("%02d", Hour ).." : "..string.format("%02d", Min ) )			
	else
		Week = Lua_Hao_Retrun_Week(GetSystime(5))	-- 週	-- 判斷當前星期(0 ~ 6)，星期一為 0
		Hour = GetSystime(1)	-- 時
		Min = GetSystime(2)	-- 分
	--	DebugMsg( Player , Room , "Week= "..Week.." ".."System time: "..string.format("%02d", Hour ).." : "..string.format("%02d", Min ) )
	end

	if Week ~= "Sunday" then
--	if Week ~= 0 and (tostring(Week)) ~= "Sunday" then
	--	DebugMsg( Player , Room , "End exchange service" )
		return false
	else
		if Hour >= 23 then	-- 晚上11點後則... 週日晚上11點，提示在線上玩家對話窗 (要消失了)
			ScriptMessage( Player , Player , 0 , "[SC_TW_PHIRIUS_TRADER_12]", 0 )	-- [200003]兌換[203038]的服務將於凌晨 0 點 0 分時結束！
		else			-- 晚上11點前則... 週日玩家登入後，提示在玩家對話窗
			ScriptMessage( Player , Player , 0 , "[SC_TW_PHIRIUS_TRADER_08]", 0 )	-- [200003]兌換[203038]的服務開始嘍！詳情請找位於[ZONE_VARANAS]及[ZONE_OBSIDIAN BASTION]銀行前的必爾汀代幣兌換商人處查詢歐。
		end
	end
end		

function Lua_Hao_TW_Phirius_Bring()	-- 必爾汀商人 物件產生劇情

	local Npc = OwnerID()
	local OrgID = ReadRoleValue( Npc , EM_RoleValue_OrgID )	-- 讀取 Npc OrgID
	local NpcID = { 121441 , 121442 }	-- NpcID
	local ZoneID =  ReadRoleValue( Npc , EM_RoleValue_ZoneID ) 	-- 讀取 ZoneID
	local Zone = ZoneID -1000*math.floor( ZoneID / 1000 )		-- 判斷分流
	local Room = ReadRoleValue( Npc , EM_RoleValue_RoomID )	-- 讀取 Room
	local Week , Hour , Min , TWWeek	-- 星期、小時、分鐘、顯示中文星期
	local State = 0 -- 現身或隱形
	Hide( Npc )
	if Trading_Phirius_Timer == nil then	-- 設定單一區域的全域變數，用來判斷星期、小時、分鐘
		Trading_Phirius_Timer = -1
	end
	AddBuff( Npc , 503217 , 0 , -1 )	-- 活動標誌
	while true do
		if Trading_Phirius_Timer ~= -1 then	-- 例如 : 61024 (禮拜日早上10點24分)
			Week = Math.floor(Trading_Phirius_Timer/10000)
			Hour = Math.floor((Trading_Phirius_Timer%10000)/100)
			Min = Trading_Phirius_Timer%100
			TWWeek = Lua_Hao_Retrun_Week(Math.floor(Trading_Phirius_Timer/10000))
			if  OrgID == NpcID[1] then
		--		DebugMsg( 0 , Room , "Zone 2 Week= "..TWWeek.." ".."Custom time: "..string.format("%02d", Hour ).." : "..string.format("%02d", Min ) )
			else
		--		DebugMsg( 0 , Room , "Zone 6 Week= "..TWWeek.." ".."Custom time: "..string.format("%02d", Hour ).." : "..string.format("%02d", Min ) )
			end
		else
			Week = GetSystime(5)	-- 判斷當前星期(0 ~ 6)，星期一為 0
			Hour = GetSystime(1)	-- 時
			Min = GetSystime(2)	-- 分
			TWWeek = Lua_Hao_Retrun_Week(GetSystime(5))
			if  OrgID == NpcID[1] then
		--		DebugMsg( 0 , Room , "Zone 2 Week= "..TWWeek.." ".."System time: "..string.format("%02d", Hour ).." : "..string.format("%02d", Min ) )
			else
		--		DebugMsg( 0 , Room , "Zone 6 Week= "..TWWeek.." ".."System time: "..string.format("%02d", Hour ).." : "..string.format("%02d", Min ) )
			end
		end
		
		if Week == 0 then
			if State == 0 then
				Show( Npc , Room )
				State = 1
			end
			if Hour == 23 and Min == 0 and OrgID == NpcID[1] and Zone == 2 then	-- 週日晚上11點0分，提示在線上玩家對話窗
				ScriptMessage( Npc , -2 , 0 , "[SC_TW_PHIRIUS_TRADER_09]", 0 )
				--[200003]兌換[203038]的服務將於 1 小時後結束！兌換服務將於下週日的凌晨 0 點 0 分於[ZONE_VARANAS]及[ZONE_OBSIDIAN BASTION]銀行前的必爾汀代幣兌換商人重新開放，開放時間將持續至隔日的凌晨 0 點 0 分，請把握兌換時間。
			elseif Hour == 0 and Min == 0 and OrgID == NpcID[1] and Zone == 2 then -- 週日凌晨0點，提示在線上玩家對話窗 (出現)
				ScriptMessage( Npc , -2 , 0 , "[SC_TW_PHIRIUS_TRADER_08]", 0 )
				--[200003]兌換[203038]的服務開始嘍！詳情請找位於[ZONE_VARANAS]或[ZONE_OBSIDIAN BASTION]銀行前的必爾汀代幣兌換商人查詢歐。
			end
		else
			if State == 1 then
				Hide( Npc )
				State = 0
			end
		end
		Sleep(600)
	end
end

function Lua_Hao_TW_Phirius_Talk()	 -- 必爾汀商人初始對話劇情

	local Player = OwnerID()
	local Npc = TargetID()
	local IsBuffed = CheckBuff( Player , 621751 )
	SysCastSpellLv( Npc , Player , 496587 , 0 )
	if IsBuffed== false then
		CallPlot( Player , "Lua_Hao_TW_Phirius_Range" , Player , 50 )  --檢查NPC與玩家的距離	
	end
	AdjustFaceDir( Npc , Player , 0 ) --面向
--	PlayMotion( Player , 112 ) -- 談話
	PlayMotion( Npc , 112 ) -- 談話
	SetSpeakDetail( Player , "[SC_TW_PHIRIUS_TRADER_10]" )	-- 你想兌換必爾汀代幣嗎？
	AddSpeakOption(  Player , Npc , "[SC_TW_PHIRIUS_TRADER_11]" ,  "Lua_Hao_Trading_Phirius_Yes_I_do",  0 )	-- 我想兌換
end

function Lua_Hao_TW_Phirius_Range( Player , dis )	-- 距離超過即關閉對話視窗

	local BuffID = 621751
	local BuffIDPos , NpcGuid , Npc
	while true do
		BuffIDPos = Lua_BuffPosSearch( Player , BuffID )			-- 取 Buff 的位置
		NpcGuid = BuffInfo( Player , BuffIDPos , EM_BuffInfoType_OwnerID )	-- 取 Buff 施展者
		Npc = ReadRoleValue( NpcGuid , EM_RoleValue_OrgID )
	--	DebugMsg( Player , 0 , "Dis = "..GetDistance( Player , NpcGuid ) )
		if GetDistance( Player , NpcGuid )  >= dis then
			CloseSpeak( Player )
			AdjustFaceDir( NpcGuid , Player , 0 ) -- 面向
			PlayMotion( NpcGuid , 116 ) -- 再見
		--	DebugMsg( Player , 0 , "Distance exceeded" )			
			break
		end
		sleep(1)
	end
	CancelBuff_NoEvent( Player , BuffID )
end

function Lua_Hao_Trading_Phirius_Yes_I_do()

	local Player = OwnerID()
	local Npc =TargetID()
	CloseSpeak( Player )
	AdjustFaceDir( Npc , Player , 0 ) --面向
	CallPlot( Player , "Lua_Hao_Trading_Phirius_0" , Npc )
end

-- 以下為兌換劇情 -- 
function Lua_Hao_Trading_Phirius_0( Npc )

	local Player = OwnerID()
--	local Npc = TargetID()
	local Diamond = ReadRoleValue( Player , EM_RoleValue_Money_Account )
	local Time = 0
	local Key , DialogStatus
	local inputstring = ""
	local Menu = "[SC_TW_PHIRIUS_TRADER_01][$SETVAR1 ="..Diamond.."]"
	--您目前持有<CY>[$VAR1]</CY><CB>[200003]</CB>，<CY>1</CY><CB>[200003]</CB>可兌換<CY>10</CY>個<CB>[203038]</CB>，每筆兌換最高限額<CY>2000</CY><CB>[200003]</CB>。
	AdjustFaceDir( Npc , Player , 0 ) -- 面向
	if CheckBuff( Player , 501570 ) == true then 
		ScriptMessage( Player , Player , 0 , "[SC_WINDOW_OPENED]", 0 )--視窗已經打開了
		return 0
	end
	local NpcID = ReadRoleValue( Npc , EM_RoleValue_OrgID )	-- DesignLog 回傳的編號
	AddBuff( Player , 501570 , 0 , -1 )
	DialogCreate( Player , EM_LuaDialogType_Input , Menu )
	DialogSelectStr( Player , "[SC_OKAY]" )	-- 確定
	DialogSelectStr( Player , "[SC_CANCEL]" )	-- 取消

	if ( DialogSendOpen( Player ) == false )  then  --表單使用錯誤，回傳錯誤訊息
		ScriptMessage( Player , Player , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 ) 
		return
	end

	while true do
		if Time > 300 then  -- 30秒無動作，關閉對話視窗
			ScriptMessage( Player , Player , 0 , "[SC_BUFFNPC_07]" , 0 ) -- 閒置超過30秒,自動關閉視窗。
			Key = 1
		end
		if GetDistance( Player , Npc ) >= 50 then	-- 距離超過即關閉兌換視窗
			Key = 1
		end
		DialogStatus = DialogGetResult( Player )  --檢查使用者選取的項目
	--	DebugMsg( Player , 0 , "Dialog = "..DialogStatus )
		if DialogStatus ~= -2 and DialogStatus ~= -1 then -- 初始化、中斷
			inputstring = tonumber(DialogGetInputResult( Player ))
			if DialogStatus == 0 then  -- 有填入字串(輸入內容必為 String )
				if Type(inputstring)  ~= "number" then
					ScriptMessage( Player , Player , 1 , "[SC_TW_PHIRIUS_TRADER_02]" , 0 )	-- 輸入內容必須為數字
					Key = 1
				elseif inputstring > 0 then	-- 字串轉數字
					if inputstring > 2000 then
						ScriptMessage( Player , Player , 1 , "[SC_TW_PHIRIUS_TRADER_06]" , 0 )	-- 超過單次可兌換上限，每筆兌換最多限額2000[200003]。
						Key = 1
					elseif Diamond < inputstring then
						ScriptMessage( Player , Player , 1 , "[SC_TW_PHIRIUS_TRADER_04]" , 0 )	 -- 晶鑽餘額不足。
						Key = 1	
					else
						DebugMsg( Player , 0 , inputstring )
						CancelBuff( Player , 501570 )
						DialogClose( Player )
						CallPlot( Player , "Lua_Hao_Trading_Phirius_1" , Player , Npc , inputstring )	-- 玩家、Npc、單次晶鑽交易量
						return true
					end
				else
					DebugMsg( Player , 0 , inputstring )
					ScriptMessage( Player , Player , 1 , "[SC_TW_PHIRIUS_TRADER_05]" , 0 )	-- 輸入內容錯誤
					Key = 1
				end
			else
			--	DebugMsg( Player , 0 , "Step1_Else" )
				Key = 1
			end
		end
		if Key == 1 then
		--	DebugMsg( Player , 0 , "Step1_return" )
			CancelBuff( Player , 501570 )
			DialogClose( Player )
			return false
		end
		sleep(1)
		Time = Time+1
	end
end

function Lua_Hao_Trading_Phirius_1( Player , Npc , Number )	-- 玩家、Npc、單次晶鑽交易量

	local Diamond = ReadRoleValue( Player , EM_RoleValue_Money_Account )	-- 玩家持有的晶鑽數量
	local Ratio = 10	-- 晶鑽:必爾汀的比率
	local Time = 0
	local Key , DialogStatus
	local inputstring = ""
	local Menu = "[SC_TW_PHIRIUS_TRADER_03][$SETVAR1 ="..Number.."][$SETVAR2 ="..Number*Ratio.."][$SETVAR3 ="..Diamond-Number.."]"
	--您確定要用<CY>[$VAR1]</CY><CB>[200003]</CB>兌換<CY>[$VAR2]</C>個<CB>[203038]</CB>嗎？此次兌換後，尚有餘額<CY>[$VAR3]</CY><CB>[200003]</CB>。
	AdjustFaceDir( Npc , Player , 0 ) -- 面向
	if CheckBuff( Player , 501570 ) == true then
		ScriptMessage( Player , Player , 0 , "[SC_WINDOW_OPENED]", 0 )--視窗已經打開了
		return 0
	end
	
	AddBuff( Player , 501570 , 0 , -1 )
	DialogCreate( Player , EM_LuaDialogType_YesNo , Menu )
	DialogSelectStr( Player , "[SC_OKAY]" )	-- 確定
	DialogSelectStr( Player , "[SC_CANCEL]" )	-- 取消

	if( DialogSendOpen( Player ) == false ) then 
		ScriptMessage( Player , Player , 0 , "[SC_WINDOW_OPENED]", 0 )--視窗已經打開了
		return 0
	end

	while true do
		sleep(1)
		Time = Time+1
		if Time > 300 then  -- 30秒無動作，關閉對話視窗
			ScriptMessage( Player , Player , 0 , "[SC_BUFFNPC_07]" , 0 ) -- 閒置超過30秒,自動關閉視窗。
			Key = 1
		end
		if GetDistance( Player , Npc ) >= 50 then	-- 距離超過即關閉兌換視窗
			Key = 1
		end
		DialogStatus = DialogGetResult( Player )  --檢查使用者選取的項目
		if DialogStatus ~= -2 and DialogStatus ~= -1 then -- 初始化、中斷
			inputstring = DialogGetInputResult( Player )
			if DialogStatus == 0 then	-- 選擇確認
				CancelBuff( Player , 501570 )
				DialogClose( Player )
				CallPlot( Player , "Lua_Hao_Trading_Phirius_2" , Player , Npc , Number*Ratio , Ratio )	-- 玩家、Npc、單次必爾汀代幣交易量、晶鑽:必爾汀代幣比率
				return true
			else
			--	DebugMsg( Player , 0 , "Step2_No" )
				Key = 1
			end
		end
		if Key == 1 then
		--	DebugMsg( Player , 0 , "Step2_return" )
			CancelBuff( Player , 501570 )
			DialogClose( Player )
			return false
		end
	end
end

function Lua_Hao_Trading_Phirius_2( Player , Npc , Number , Ratio )	-- 玩家、Npc、單次必爾汀代幣交易量、晶鑽:必爾汀代幣比率

	local Trading = 203038
	local MaxHeap = GameObjInfo_Int( Trading ,"MaxHeap" )	-- 取必爾汀代幣的堆疊量
	local Diamond = ReadRoleValue( Player , EM_RoleValue_Money_Account )	-- 玩家持有的晶鑽數量
	local Space = Math.ceil(Number/MaxHeap)	-- 無條件進位	此次需求空間
	local emotion = { 107 , 106 }	-- 搖頭、點頭
	local QueueOfBag = QueuePacketCount( Player )	--計算背包暫存區有幾格
	local SpaceOfBag = EmptyPacketCount( Player )	--計算背包有幾個空位
	local Turnover = ReadRoleValue( Npc , EM_RoleValue_PID )	--晶鑽成交量(隨Server重啟而重置)
	local NpcID = ReadRoleValue( Npc , EM_RoleValue_OrgID )	-- DesignLog 回傳的編號

	AdjustFaceDir( Npc , Player , 0 )	 -- 面向
	DebugMsg( Player , 0 , "Diamond = "..Diamond.." Number = "..Number.." Space = "..Space.."/"..SpaceOfBag.." NpcID = "..NpcID )

	if Diamond *Ratio < Number then	-- 晶鑽餘額不足
		ScriptMessage( Player , Player , 1 , "[SC_TW_PHIRIUS_TRADER_04]" , 0 ) -- 晶鑽餘額不足。
		PlayMotion( Npc , emotion[1] )	-- 搖頭
	--	DebugMsg( Player , 0 , "Number = "..Number )
		return false  
	else	-- 餘額足夠
	--	if Check_Bag_Space( Player , Space ) == false then	-- 背包空間不足
		if QueueOfBag ~= 0 then	-- 如果背包暫存區已使用
			PlayMotion( Npc , emotion[1] )	-- 搖頭
			ScriptMessage( Player , Player , 1 , "[SC_TW_PHIRIUS_TRADER_07]" , 0 ) -- 請等候佇列物品進入背包完成
			return false
		end
	--	if ( QueueOfBag <= 10 ) then
			if ( SpaceOfBag >= Space ) then	-- 背包剩餘空間 / 此次需求空間
			--	DebugMsg( Player , 0 , "ItemCount = "..(Number*Ratio - ((Space-1)*MaxHeap)) )	-- 堆疊量
				PlayMotion( Player , emotion[2] )	-- 點頭
			--	2012.10.01 晶鑽扣款模式修改
			--	AddRoleValue( Player , EM_RoleValue_Money_Account , -(Number/Ratio) )	-- 扣晶鑽款項
				if AddMoneyEx_Account( Player , EM_ActionType_PlotGive , -(Number/Ratio) , true ) == true then
					for i = 1 , Space , 1 do	-- 分次給予最大堆疊量的物品，若為最後一次，則給予指定量
						if i == Space then
							GiveBodyItem( Player , Trading , Number - ((Space-1)*MaxHeap) )
						else	
							GiveBodyItem( Player , Trading , MaxHeap )
						end
					end
					Turnover = Turnover + (Number/Ratio)
					WriteRoleValue( Npc , EM_RoleValue_PID , Turnover )
					DesignLog( Player , NpcID , "Revenue = "..Number/Ratio.." Turnover = "..Turnover )	-- 單次營收、總營業額
					return true				
				else
					ScriptMessage( Player , Player , 1 , "[SC_EXCHANGE_FAIL]" , 0 ) -- 請耐心等候本次兌換完成。
					return false
				end
			else
				ScriptMessage( Player , Player , 1 , "[K_08MID_DIALOG8]" , 0 )	-- 您的背包空間不足，請清理一下再來吧。
				PlayMotion( Npc , emotion[1] )	-- 搖頭
				return false
			end
	--	else
	--		return false		
	--	end	
	end
end