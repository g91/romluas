function Hao_Monetary_Union_240181(Player , Coin)	-- 6.0.0 貨幣整合 玩家、單次給予貨幣

	local Maximun = 1000	-- 必爾汀圓貝取得上限量
	local Coin_Total = ReadRoleValue( Player , EM_RoleValue_PhiriusShellCoin )	-- 身上持有量
	
	if Maximun > Coin_Total then	-- 當身上持有量 < 上限量時
		local Count = 0
		if (Maximun - Coin_Total) >= Coin then	-- 當上限量-持有量 > Coin
			Count = Coin
		else
			Count = Maximun - Coin_Total
		end
		ScriptMessage( Player , Player , 0 , "[SC_240181_02][$SETVAR1="..Count.."]" , C_SYSTEM )	-- 主職等級50以上，額外獲得[$VAR1]個[240181]
		ScriptMessage( Player , Player , 1 , "[SC_240181_02][$SETVAR1="..Count.."]" , C_SYSTEM )	-- 主職等級50以上，額外獲得[$VAR1]個[240181]
		AddSpeicalCoin( Player , 11 , 11 , Count )	-- 執行者、Action Type(劇情給予)、必爾汀圓貝代號、此次給予數量
		if Count < Coin then
			ScriptMessage( Player , Player , 0 , "[SC_240181_01]" , 0 )	-- 你最多只能保留1000個必爾汀圓貝，該物品取得數量已達上限。
			ScriptMessage( Player , Player , 2 , "[SC_240181_01]" , 0 )
		end
	else
		ScriptMessage( Player , Player , 0 , "[SC_240181_01]" , 0 )	-- 你最多只能保留1000個必爾汀圓貝，該物品取得數量已達上限。
		ScriptMessage( Player , Player , 2 , "[SC_240181_01]" , 0 )
	end	
end

function Hao_Monetary_Union_Adjust()	-- 測試指令，調整貨幣

	local Player = OwnerID()

	if CheckBuff( Player , 501570 ) == true then 
		ScriptMessage( Player , Player , 0 , "[SC_WINDOW_OPENED]", 0 )	--視窗已經打開了
		return
	end
	
	local Time = 0
	local DialogStatus
	local Currency_Code = ""
	local List = {}
		List[0] = "Reset"			-- 清除模式
		List[1] = "Full"			-- 全滿
		List[2] = "[SYS_MONEY_TYPE_11]"	-- 必爾汀圓貝
		List[3] = "[SYS_MONEY_TYPE_12]"	-- 正義能量
		List[4] = "[SYS_MONEY_TYPE_10]"	-- 夢境先遣印記
		List[5] = "[SYS_MONEY_TYPE_9]"	-- 古代遺物
		List[6] = "[SYS_MONEY_TYPE_13]"	-- 傳奇之證
		List[7] = "[SYS_MONEY_TYPE_4]"	-- 榮譽點數
		List[8] = "[SYS_MONEY_TYPE_8]"	-- 試煉徽章
		List[9] = "[SYS_MONEY_TYPE_14]"	-- 勇士勳章

	AddBuff( Player , 501570 , 0 , -1 )
	DialogCreate( Player , EM_LuaDialogType_Input , "Please enter Currency Code" )	-- 請輸入貨幣代號
	DialogSelectStr( Player , "Accept" )
	DialogSelectStr( Player , "Cancel" )

	for i = 0 , #List , 1 do
		Tell( Player , Player , String.format("%01d", i ).." = "..List[i] )
		if i == #List then
			Tell( Player , Player , "Enter Number : 0 ~ "..i )
		end
	end

	if DialogSendOpen(Player) == false then  --表單使用錯誤，回傳錯誤訊息
		ScriptMessage ( Player , Player , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 )
		return
	end

	while true do
		sleep(1)
		Time = Time+1
	 	if Time > 600 then  -- 60秒無動作，關閉對話視窗
			ScriptMessage( Player , Player , 0 , "Idle for more than 60 sec , window will close automatically." , 0 ) -- 閒置超過60秒,自動關閉視窗。
			break
		end
		DialogStatus = DialogGetResult( Player )  --檢查使用者選取的項目
		if DialogStatus ~= -2 and DialogStatus ~= -1 then -- 不等於初始化及中斷時
			Currency_Code = DialogGetInputResult( Player )
			if DialogStatus == 0 then  -- 有填入字串
				if tonumber(Currency_Code) == nil or Currency_Code == "" or math.abs(tonumber(Currency_Code)) > #List then	-- 輸入欄位時，不等於字串或空白則...

					Tell( Player , Player , "Nullity String Code." )	-- 輸入錯誤
					break
				else
					Tell( Player , Player , List[tonumber(Currency_Code)] )
					CancelBuff( Player, 501570 )
					DialogClose( Player )
					return Hao_Monetary_Union_Adjust_01( Player , tonumber(Currency_Code) )
				end
			else
				break
			end
		elseif DialogStatus == -1 then	-- 中斷
			break
		end
	end
	CancelBuff( Player , 501570 )
	DialogClose( Player )
end

function Hao_Monetary_Union_Adjust_01( Player , Currency_Code )

	if CheckBuff( Player , 501570 ) == true then
		ScriptMessage( Player , Player , 0 , "[SC_WINDOW_OPENED]" , 0 )	--視窗已經打開了
		return
	end	
	
	local Time = 0
	local DialogStatus
	local Trading_Volume = ""
	local CoinDefine = {}
	CoinDefine[2] = { EM_RoleValue_PhiriusShellCoin , 11 , 1000 }		-- 必爾汀圓貝、貨幣編號、貨幣上限：99999為自訂上限
	CoinDefine[3] = { EM_RoleValue_EnergyJusticeCoin , 12 , 99999 } 		-- 正義能量
	CoinDefine[4] = { EM_RoleValue_DreamlandCoin ,  10 , 99999 }		-- 夢境先遣印記
	CoinDefine[5] = { EM_RoleValue_RelicsCoin , 9 , 10000 }			-- 古代遺物
	CoinDefine[6] = { EM_RoleValue_ProofLegendCoin , 13 , 99999 }		-- 傳奇之證
	CoinDefine[7] = { EM_RoleValue_Honor , 4 , 25000 }			-- 榮譽點數			
	CoinDefine[8] = { EM_RoleValue_TrialBadgeCoin , 8 , 99999 }		-- 試煉徽章
	CoinDefine[9] = { EM_RoleValue_DuelistReward , 14 , 20000 } 		-- 勇士勳章

	if Currency_Code == 0 or Currency_Code == 1 then	-- 當模式為清除或全滿時執行
		for i = 2 , #CoinDefine , 1 do
			local Count = ReadRoleValue( Player , CoinDefine[i][1] )
			if Currency_Code == 0 then	-- 當選項為清除時則 ...
				AddSpeicalCoin( Player , 11 , CoinDefine[i][2] , -Count )
			else
				if CoinDefine[i][3] - Count > 0 then	-- 當自訂上限 - 身上持有的貨幣數量 > 0 時則...
					AddSpeicalCoin( Player , 11 , CoinDefine[i][2] , CoinDefine[i][3] - Count )
				end
			end
		end
		return
	end				

	AddBuff( Player , 501570 , 0 , -1 )
	DialogCreate( Player , EM_LuaDialogType_Input , "Please enter Trading Volume" )	-- 請輸入成交量
	DialogSelectStr( Player , "Accept" )
	DialogSelectStr( Player , "Cancel" )

	if DialogSendOpen(Player) == false then  --表單使用錯誤，回傳錯誤訊息
		ScriptMessage ( Player , Player , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 )
		return
	end

	while true do
		sleep(1)
		Time = Time+1
	 	if Time > 600 then  -- 60秒無動作，關閉對話視窗
			ScriptMessage( Player , Player , 0 , "Idle for more than 60 sec , window will close automatically." , 0 ) -- 閒置超過60秒,自動關閉視窗。
			break
		end
		DialogStatus = DialogGetResult( Player )  --檢查使用者選取的項目
		if DialogStatus ~= -2 and DialogStatus ~= -1 then -- 不等於初始化及中斷時
			Trading_Volume = DialogGetInputResult( Player )
			if DialogStatus == 0 then  -- 有填入字串
				if Type(Trading_Volume) ~= "string" or Trading_Volume == "" or math.abs(tonumber(Trading_Volume)) > CoinDefine[tonumber(Currency_Code)][3] then
				-- 輸入欄位時，不等於字串、空白或數值取絕對值後大於自訂上限時則...
					Tell( Player , Player , "Nullity String Code." )	-- 輸入錯誤
					break
				else
   					AddSpeicalCoin( Player , 11 , CoinDefine[tonumber(Currency_Code)][2] , Trading_Volume )
					Tell( Player , Player , tonumber(Trading_Volume) )
					break
				end
			else
				break
			end
		elseif DialogStatus == -1 then	-- 中斷
			break
		end
	end
	CancelBuff( Player , 501570 )
	DialogClose( Player )
end