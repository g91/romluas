function LuaS_TP_NPC_na() 	--判斷不同TP獎勵的 NPC
	-- OwnerID = 玩家
	-- TargetID = NPC

	AdjustFaceDir( TargetID() , OwnerID() , 0 ) -- 面向

	BeginPlot( TargetID() , "LuaS_NPC_Ranger_na" , 0 )  --檢查NPC與玩家的距離

	if ReadRoleValue ( TargetID() , EM_RoleValue_PID ) == 101 then
		SetSpeakDetail( OwnerID() , "[SC_BUFFNPC_24]" )	--你好，想領取提升TP值的祝福嗎?
		AddSpeakOption( OwnerID(), TargetID(), "[SC_BUFFNPC_39]" , "LuaS_TP_NPC_20", 0 )
	elseif ReadRoleValue ( TargetID(), EM_RoleValue_PID) == 102 then
		SetSpeakDetail ( OwnerID(), "[SC_BUFFNPC_25]" )	--你好，想領取提升TP值的祝福嗎?
		AddSpeakOption( OwnerID(), TargetID(), "[SC_BUFFNPC_39]", "LuaS_TP_NPC_50" ,0 )
	elseif ReadRoleValue ( TargetID(), EM_RoleValue_PID) == 103 then
		SetSpeakDetail ( OwnerID(), "[SC_BUFFNPC_26]" )	--你好，想領取提升TP值的祝福嗎?
		AddSpeakOption( OwnerID(), TargetID(), "[SC_BUFFNPC_39]", "LuaS_TP_NPC_100" ,0 )
	end
end



function LuaS_TP_NPC_20()  --給予TP BUFF
	--OwnerID = 玩家
	-- TargetID = NPC
	if CheckFlag( OwnerID(), 543962) == true then
		SetSpeakDetail( OwnerID(), "[SC_BUFFNPC_27]") --你今天已經領取過了，明天再來吧。
		CloseSpeak( OwnerID() )
		return false
	else
		Addbuff( OwnerID(), 506825, 0, 7200) --給予 TP 20% BUFF 2小時
		SetFlag( OwnerID(), 543962, 1 )
		CloseSpeak( OwnerID() )
	end
end	
	

function LuaS_TP_NPC_50()
	--OwnerID = 玩家
	-- TargetID = NPC
	if CheckFlag( OwnerID(), 543962) == true then
		SetSpeakDetail( OwnerID(),  "[SC_BUFFNPC_27]") --你今天已經領取過了，明天再來吧。
		 CloseSpeak( OwnerID() )
		return false
	else
		Addbuff( OwnerID(), 506826, 0, 7200) --給予 TP 50% BUFF 2小時
		SetFlag( OwnerID(), 543962, 1 )
		CloseSpeak( OwnerID() )
	end
end


function LuaS_TP_NPC_100()
	--OwnerID = 玩家
	-- TargetID = NPC
	if CheckFlag( OwnerID(), 543962) == true then
		SetSpeakDetail( OwnerID(), "[SC_BUFFNPC_27]") --你今天已經領取過了，明天再來吧。
		 CloseSpeak( OwnerID() )
		return false
	else
		Addbuff( OwnerID(), 506827, 0, 7200) --給予 TP 100% BUFF 2小時
		SetFlag( OwnerID(), 543962, 1 )
		CloseSpeak( OwnerID() )
	end
end


function LuaS_EXP_NPC_na() 	--判斷不同EXP獎勵的 NPC
	-- OwnerID = 玩家
	-- TargetID = NPC

	AdjustFaceDir( TargetID() , OwnerID() , 0 ) -- 面向

	BeginPlot( TargetID() , "LuaS_NPC_Ranger_na" , 0 )


	if ReadRoleValue ( TargetID(), EM_RoleValue_PID ) == 201 then
		SetSpeakDetail( OwnerID(), "[SC_BUFFNPC_28]" )	--你好，想領取提升經驗值的祝福嗎?
		AddSpeakOption( OwnerID(), TargetID(), "[SC_BUFFNPC_39]" , "LuaS_EXP_NPC_20", 0 )
	elseif ReadRoleValue ( TargetID(), EM_RoleValue_PID) == 202 then
		SetSpeakDetail ( OwnerID(), "[SC_BUFFNPC_29]" )	--你好，想領取提升經驗值的祝福嗎?
		AddSpeakOption( OwnerID(), TargetID(), "[SC_BUFFNPC_39]", "LuaS_EXP_NPC_50" ,0 )
	elseif ReadRoleValue ( TargetID(), EM_RoleValue_PID) == 203 then
		SetSpeakDetail ( OwnerID(), "[SC_BUFFNPC_30]" )	--你好，想領取提升經驗值的祝福嗎?
		AddSpeakOption( OwnerID(), TargetID(), "[SC_BUFFNPC_39]", "LuaS_EXP_NPC_100" ,0 )
	end
end



function LuaS_EXP_NPC_20() 	--給予BUFF
	--OwnerID = 玩家
	-- TargetID = NPC
	if CheckFlag( OwnerID(), 543963) == true then
		SetSpeakDetail( OwnerID(), "[SC_BUFFNPC_27]") --你今天已經領取過了，明天再來吧。
		 CloseSpeak( OwnerID() )
		return false
	else
		Addbuff( OwnerID(), 506828, 0, 7200) --給予 EXP 20% BUFF 2小時
		SetFlag( OwnerID(), 543963, 1 )
		CloseSpeak( OwnerID() )
	end
end	
	

function LuaS_EXP_NPC_50()
	--OwnerID = 玩家
	-- TargetID = NPC
	if CheckFlag( OwnerID(), 543963) == true then
		SetSpeakDetail( OwnerID(), "[SC_BUFFNPC_27]") --你今天已經領取過了，明天再來吧。
		 CloseSpeak( OwnerID() )
		return false
	else
		Addbuff( OwnerID(), 506829, 0, 7200) --給予 EXP 50% BUFF 2小時
		SetFlag( OwnerID(), 543963, 1 )
		CloseSpeak( OwnerID() )
	end
end


function LuaS_EXP_NPC_100()
	--OwnerID = 玩家
	-- TargetID = NPC
	if CheckFlag( OwnerID(), 543963) == true then
		SetSpeakDetail( OwnerID(), "[SC_BUFFNPC_27]") --你今天已經領取過了，明天再來吧。
		 CloseSpeak( OwnerID() )
		return false
	else
		Addbuff( OwnerID(), 506830, 0, 7200) --給予 EXP 100% BUFF 2小時
		SetFlag( OwnerID(), 543963, 1 )
		CloseSpeak( OwnerID() )
	end
end


function LuaS_DR_NPC_na() 	--判斷不同DR獎勵的 NPC
	--OwnerID = 玩家
	-- TargetID = NPC

	AdjustFaceDir( TargetID() , OwnerID() , 0 ) -- 面向

	BeginPlot( TargetID() , "LuaS_NPC_Ranger_na" , 0 )

	if ReadRoleValue ( TargetID(), EM_RoleValue_PID ) == 301 then
		SetSpeakDetail( OwnerID(),  "[SC_BUFFNPC_31]" )	--你好，想領取提升掉寶機率的祝福嗎?
		AddSpeakOption( OwnerID(), TargetID(), "[SC_BUFFNPC_39]" , "LuaS_DR_NPC_20", 0 )
	elseif ReadRoleValue ( TargetID(), EM_RoleValue_PID) == 302 then
		SetSpeakDetail ( OwnerID(),"[SC_BUFFNPC_32]" )	--你好，想領取提升掉寶機率的祝福嗎?
		AddSpeakOption( OwnerID(), TargetID(), "[SC_BUFFNPC_39]", "LuaS_DR_NPC_50" ,0 )
	elseif ReadRoleValue ( TargetID(), EM_RoleValue_PID) == 303 then
		SetSpeakDetail ( OwnerID(),  "[SC_BUFFNPC_33]" )	--你好，想領取提升掉寶機率的祝福嗎?
		AddSpeakOption( OwnerID(), TargetID(), "[SC_BUFFNPC_39]", "LuaS_DR_NPC_100" ,0 )
	end
end



function LuaS_DR_NPC_20() 	--給予BUFF
	--OwnerID = 玩家
	-- TargetID = NPC
	if CheckFlag( OwnerID(), 543964) == true then
		SetSpeakDetail( OwnerID(), "[SC_BUFFNPC_27]") --你今天已經領取過了，明天再來吧。
		 CloseSpeak( OwnerID() )
		return false
	else
		Addbuff( OwnerID(), 506831, 0, 7200) --給予 DR 20% BUFF 2小時
		SetFlag( OwnerID(), 543964, 1 )
		CloseSpeak( OwnerID() )
	end
end	
	

function LuaS_DR_NPC_50()
	--OwnerID = 玩家
	-- TargetID = NPC
	if CheckFlag( OwnerID(), 543964) == true then
		SetSpeakDetail( OwnerID(), "[SC_BUFFNPC_27]") --你今天已經領取過了，明天再來吧。
		 CloseSpeak( OwnerID() )
		return false
	else
		Addbuff( OwnerID(), 506832, 0, 7200) --給予 DR 50% BUFF 2小時
		SetFlag( OwnerID(), 543964, 1 )
		CloseSpeak( OwnerID() )
	end
end


function LuaS_DR_NPC_100()
	--OwnerID = 玩家
	-- TargetID = NPC
	if CheckFlag( OwnerID(), 543964) == true then
		SetSpeakDetail( OwnerID(), "[SC_BUFFNPC_27]") --你今天已經領取過了，明天再來吧。
		 CloseSpeak( OwnerID() )
		return false
	else
		Addbuff( OwnerID(), 506833, 0, 7200) --給予 DR 100% BUFF 2小時
		SetFlag( OwnerID(), 543964, 1 )
		CloseSpeak( OwnerID() )
	end
end


function LuaS_debt_NPC_na() 	--判斷不同除債獎勵的 NPC
	--OwnerID = 玩家
	-- TargetID = NPC

	AdjustFaceDir( TargetID() , OwnerID() , 0 ) -- 面向

	BeginPlot( TargetID() , "LuaS_NPC_Ranger_na" , 0 )



	if ReadRoleValue ( TargetID(), EM_RoleValue_PID ) == 401 then
		SetSpeakDetail( OwnerID(), "[SC_BUFFNPC_36]" )	--你好，想領取去除部分債務的祝福嗎?
		AddSpeakOption( OwnerID(), TargetID(), "[SC_BUFFNPC_39]" , "LuaS_debt_na_part_01", 0 )
	elseif ReadRoleValue ( TargetID(), EM_RoleValue_PID) == 402 then
		SetSpeakDetail ( OwnerID(),  "[SC_BUFFNPC_35]" )	--你好，想領取清除所有債務的祝福嗎?
		AddSpeakOption( OwnerID(), TargetID(), "[SC_BUFFNPC_39]", "LuaS_debt_na_all_01" ,0 )
	end
end

		 
function LuaS_debt_na_part_01()
	local DebtEXP = ReadRoleValue( OwnerID(), EM_RoleValue_DebtExp) --負債EXP
	local DebtTP = ReadRoleValue( OwnerID(), EM_RoleValue_DebtTP) --負債TP
	local EXP = 5000
	local TP = 500
	local NewEXP = DebtEXP+EXP
	local NewTP = DebtTP+TP


	if CheckFlag( OwnerID(), 543965) == true then
		SetSpeakDetail( OwnerID(), "[SC_BUFFNPC_27]" ) --你今天已經領取過了，明天再來吧。
		return false
	elseif DebtEXP>=0 and DebtTP >= 0 then
		SetSpeakDetail( OwnerID(), "[SC_BUFFNPC_37]") 
		--Say( OwnerID(), "Step=0" )
		return FALSE

	elseif  NewEXP < 0 and NewTP <0 then

		WriteRoleValue( OwnerID(), EM_RoleValue_DebtExp, NewEXP)
		WriteRoleValue( OwnerID(), EM_RoleValue_DebtTP, NewTP)
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BUFFNPC_38]" , C_SYSTEM )	--你已經獲得寬恕的祝福。
		SetFlag( OwnerID(), 543965, 1)
		CloseSpeak( OwnerID() )
		--Say( OwnerID(), "Step=1" )

	elseif  NewEXP >=0 or NewTP <0 then
		if NewEXP >0 then
			NewEXP = 0
		end
		if NewTP >0 then
			NewTP = 0
		end
		WriteRoleValue( OwnerID(), EM_RoleValue_DebtExp, NewEXP)
		WriteRoleValue( OwnerID(), EM_RoleValue_DebtTP, NewTP)
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BUFFNPC_38]" , C_SYSTEM )	--你已經獲得寬恕的祝福。
		SetFlag( OwnerID(), 543965, 1)
		CloseSpeak( OwnerID() )
		--Say( OwnerID(), "Step=2" )

	elseif  NewEXP <0 or NewTP >=0 then
		if NewEXP >0 then
			NewEXP = 0
		end
		if NewTP >0 then
			NewTP = 0
		end
		WriteRoleValue( OwnerID(), EM_RoleValue_DebtExp, NewEXP)
		WriteRoleValue( OwnerID(), EM_RoleValue_DebtTP, NewTP)
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BUFFNPC_38]" , C_SYSTEM )	--你已經獲得寬恕的祝福。
		SetFlag( OwnerID(), 543965, 1)
		CloseSpeak( OwnerID() )
		--Say( OwnerID(), "Step=3" )
	end
end


function LuaS_debt_na_all_01()
-- OwnerID = 玩家
-- TargetID = NPC
	local DebtEXP = ReadRoleValue( OwnerID(), EM_RoleValue_DebtExp )
	local DebtTP = ReadRoleValue( OwnerID(), EM_RoleValue_DebtTP )
	if CheckFlag ( OwnerID(), 543965) == true then
		SetSpeakDetail( OwnerID() ,"[SC_BUFFNPC_27]")  --你今天已經領取過了，明天再來吧。
		return false
	else
		WriteRoleValue( OwnerID(), EM_RoleValue_DebtExp, 0 )	--玩家EXP負債歸0
		WriteRoleValue( OwnerID(), EM_RoleValue_DebtTP, 0 )	--玩家TP負債歸0
		ScriptMessage( OwnerID(), OwnerID() , 1, "[SC_BUFFNPC_38]", C_SYSTEM )
		SetFlag( OwnerID(), 543965, 1)
		CloseSpeak( OwnerID() )
	end
end		
	


function LuaS_buffnpc_na_DelNPC_01()
	if CheckBuff( OwnerID() , 501570) == true then 
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );--視窗已經打開了
		return 0
	end
	local Time = 0 
	local Step = 0
	local DialogStatus = 0

	DialogCreate( OwnerID(), EM_LuaDialogType_Select, "[SC_BUFFNPC_40]" )   --NPC類型選擇表單
	AddBuff(OwnerID() , 501570,0,-1);
 		DialogSelectStr( OwnerID(), "[SC_BUFFNPC_39]")  -- 確定刪除[0]
		DialogSelectStr( OwnerID(), "[SC_BUFFNPC_12]") --回到上ㄧ頁[1]
	

	if ( DialogSendOpen(OwnerID() ) == false)  then  --表單使用錯誤，回傳錯誤訊息
		ScriptMessage ( OwnerID(), OwnerID(), 1, "[SYS_FIXEQ_DATA_ERROR]", 0) 
		return
	end

	while true do  	--選單開啟之後，執行迴圈
		sleep(10)
		Time = Time+1
	--	say( OwnerID() , Time)
	 	if Time > 30 then  -- 一分鐘無動作，關閉對話視窗
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BUFFNPC_07]" , 0 )
			DialogClose( OwnerID() )
			CancelBuff( OwnerID(), 501570 );--
			break
		end
		
		DialogStatus = DialogGetResult( OwnerID() )  --檢查使用者選取的項目
			if DialogStatus == -2  then -- 初始化
			
			elseif DialogStatus == -1  then--中斷
				CancelBuff( OwnerID(), 501570 );
				DialogClose( OwnerID() );
			elseif DialogStatus == 0 then  --TP
				CancelBuff( OwnerID(), 501570 );--
				Beginplot( OwnerID(), "LuaS_buffnpc_na_DelNPC_02" , 0 )
				DialogClose( OwnerID() )
			--	Say( OwnerID() , DialogStatus )			
				Step = 1			
			elseif DialogStatus == 1 then -- 回到上ㄧ頁
			CancelBuff( OwnerID(), 501570 );--
			Beginplot( OwnerID(), "LuaS_buffnpc_na",0 )
			DialogClose( OwnerID() )
			Step= 1
			end
		if Step == 1 then
			break
		end
	end
end  



function LuaS_buffnpc_na_DelNPC_02() 	--刪除NPC

	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID) --確認伺服器的分流
	local Count = SetSearchAllNPC( RoomID) --尋找分流內所有的NPC
	local Obj

	if  Count ~= 0 then
		for i=1 , Count, 1 do  --設定搜尋所有NPC次數的迴圈
			local ID = GetSearchResult() --取得搜尋NPC的結果
			Obj=Role:New(ID)
			
			if Obj:IsNPC() == true then
			local Name = ReadRoleValue(  ID, EM_RoleValue_OrgID)--確認所有NPC的編號
				if Name == 115554 or Name == 115555 or Name == 115556 or Name == 115557  then  --若是為特定NPC
				DelObj(ID) 
				end
			end
		end
	end
end




--測試用負債值
function LuaS_buffnpc01_na()

		WriteRoleValue( OwnerID(), EM_RoleValue_DebtExp, -2000 )	
		WriteRoleValue( OwnerID(), EM_RoleValue_DebtTP, -200 )	
end


function LuaS_buffnpc02_na()

		WriteRoleValue( OwnerID(), EM_RoleValue_DebtExp, 0)	
		WriteRoleValue( OwnerID(), EM_RoleValue_DebtTP, -600 )
end


function LuaS_buffnpc03_na()

		WriteRoleValue( OwnerID(), EM_RoleValue_DebtExp, -60000)	
		WriteRoleValue( OwnerID(), EM_RoleValue_DebtTP, 0 )
end


function LuaS_buffnpc04_na()

		WriteRoleValue( OwnerID(), EM_RoleValue_DebtExp, -4000)	
		WriteRoleValue( OwnerID(), EM_RoleValue_DebtTP, -600 )
end


function LuaS_buffnpc05_na()

		WriteRoleValue( OwnerID(), EM_RoleValue_DebtExp, -8000)	
		WriteRoleValue( OwnerID(), EM_RoleValue_DebtTP, -300 )
end


function LuaS_NPC_Ranger_na()	-- 距離超過50即關閉對話視窗

	while true do
		if GetDistance( OwnerID() , TargetID() )  >= 50 then
			CloseSpeak( TargetID() )
			AdjustFaceDir( OwnerID(), TargetID() , 0 ) -- 面向
			PlayMotion( OwnerID() , 116 ) -- 再見
			break
		end
		sleep(10)
	end
end