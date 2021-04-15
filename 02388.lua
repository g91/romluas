--物品執行劇情
function LuaBK_buffnpc_begin()
	BeginPlot( OwnerID(), "LuaBK_buffnpc", 0)
end
--列表劇情
function LuaBK_buffnpc()
	local Time = 0 
	local Step = 0
	local DialogStatus = 0
	local NPCIDList ={118501,118502,118503,118504,118505}
	if CheckBuff( OwnerID() , 501570) == true then 
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );--視窗已經打開了
		return 0
	end
	AddBuff(OwnerID() , 501570,0,-1);
	DialogCreate( OwnerID(), EM_LuaDialogType_Select, "[SC_BK_BUFFNPC_01]" )   --NPC類型選擇表單
 	DialogSelectStr( OwnerID(), "[SC_BK_BUFFNPC_02]")  -- TP
	DialogSelectStr( OwnerID(), "[SC_BK_BUFFNPC_03]") --EXP
	DialogSelectStr( OwnerID(), "[SC_BK_BUFFNPC_04]") --DR
	DialogSelectStr( OwnerID(), "[SC_BK_BUFFNPC_05]") --除債NPC
	DialogSelectStr( OwnerID(), "[SC_BK_BUFFNPC_07]") --刪除NPC
	--DialogSelectStr( OwnerID(), "[SC_BK_BUFFNPC_06]") --變身NPC
	if ( DialogSendOpen(OwnerID() ) == false)  then  --表單使用錯誤，回傳錯誤訊息
		ScriptMessage ( OwnerID(), OwnerID(), 1, "[SYS_FIXEQ_DATA_ERROR]", 0) 
		CancelBuff( OwnerID(), 501570 );--
		return
	end
	while true do  	--選單開啟之後，執行迴圈
		sleep(10)
		Time = Time+1
	--	say( OwnerID() , Time)
	 	if Time > 30 then  -- 30秒無動作，關閉對話視窗
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BK_BUFFNPC_08]" , 0 )--閒置超過30秒,自動關閉視窗。
			CancelBuff( OwnerID(), 501570 );--
			DialogClose( OwnerID() )
			break
		end
		DialogStatus = DialogGetResult( OwnerID() )  --檢查使用者選取的項目
		if DialogStatus == -2  then -- 初始化
		elseif DialogStatus == -1  then--中斷
			DialogClose( OwnerID() );
			CancelBuff( OwnerID(), 501570 );--
			break;
		elseif DialogStatus == 4  then
			CancelBuff( OwnerID(), 501570 );--
			Beginplot( OwnerID(), "LuaBK_buffnpc_DelNPC_01" , 0 );
			DialogClose( OwnerID() );
			break;
		else
			CancelBuff( OwnerID(), 501570 );--
			CallPlot(OwnerID(),"LuaBK_buffnpc_CreateNPC",NPCIDList[DialogStatus+1]);
			DialogClose( OwnerID() );
			break;
		end
	end
end
--建出NPC
function LuaBK_buffnpc_CreateNPC(NpcID)
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local NPC = CreateObjByObj(NpcID,OwnerID()); --在玩家座標 X.Y.Z.Dir 身上準備創立物件
	SetModeEx( NPC, EM_SetModeType_Strikback, false )--反擊
	SetModeEx( NPC, EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( NPC, EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( NPC, EM_SetModeType_Mark, true )--標記
	SetModeEx( NPC, EM_SetModeType_Move, false )--移動
	SetModeEx( NPC, EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( NPC, EM_SetModeType_HideName, false )--名稱
	SetModeEx( NPC, EM_SetModeType_ShowRoleHead, true )--頭像框
	SetModeEx( NPC, EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( NPC, EM_SetModeType_Drag , false )--阻力
	SetModeEx( NPC, EM_SetModeType_Show, true )--顯示
	AddToPartition( NPC , RoomID) -- 建立物件
	AddBuff(NPC,503217,0,-1);--加標籤
end
-----以下為NPC劇情
--三種BUFF獎勵的 NPC初始劇情
function LuaBK_BUFF_NPC()
	-- OwnerID = 玩家
	-- TargetID = NPC
	local OrgID = ReadRoleValue(TargetID(),EM_RoleValue_OrgID);
	local OLv = ReadRoleValue(OwnerID(),EM_RoleValue_LV);
	local month = GetSystime(3)+1
	local day = GetSystime(4)
	local hour = GetSystime(1)
	local min = GetSystime(2)
	local NowTime = month*1000000+day*10000+hour*100+min;
	local StartTimeList = {"Luckystarttime_00", "Tpstarttime_00", "Expstarttime_00"}
	local EndTimeList = {"Luckyendtime_00", "Tpendtime_00", "Expendtime_00"}
	local NPCIDList ={118501,118502,118503};
	local Detaillist = {"[SC_BK_BUFFNPC_09]","[SC_BK_BUFFNPC_10]","[SC_BK_BUFFNPC_11]"};
	local MaxLvList = {"Tphighlv_00","Exphighlv_00","Luckyhighlv_00"};
	local MinLvList = {"Tplowlv_00","Explowlv_00","Luckylowlv_00"};
	AdjustFaceDir( TargetID() , OwnerID() , 0 ); -- 面向
	BeginPlot( TargetID() , "LuaBK_NPC_Ranger" , 0 );  --檢查NPC與玩家的距離
	for i =1,table.getn(NPCIDList) do
		if OrgID == NPCIDList[i] then
			local StartTime = GetDBKeyValue(StartTimeList[i]);
			local EndTime = GetDBKeyValue(EndTimeList[i]);
			DebugMsg( 0 , 0 , "StartTime = "..StartTime.. "EndTime = "..EndTime.. "NowTime = "..NowTime );
			if NowTime > EndTime then
				SetSpeakDetail ( OwnerID(), "[SC_BK_BUFFNPC_20]" );	--這個活動已經結束了!
				 CloseSpeak( OwnerID() );			
				break;
		 	elseif NowTime < StartTime then
				SetSpeakDetail ( OwnerID(), "[SC_BK_BUFFNPC_19]" );	--這個活動還沒開始!
				 CloseSpeak( OwnerID() );			
				break;
			end
			local MaxLv = GetDBKeyValue(MaxLvList[i]);
			local MinLv = GetDBKeyValue(MinLvList[i]);
			if OLv>MaxLv or OLv<MinLv then
				--等級不符
				SetSpeakDetail ( OwnerID(), "[SC_BK_BUFFNPC_13][$SETVAR1="..MinLv.."][$SETVAR2="..MaxLv.."]" );	--你的等級不符合活動限制，此活動限[$VAR1]級~[$VAR2]級的玩家參與。
				 CloseSpeak( OwnerID() );			
				break;
			else
				SetSpeakDetail ( OwnerID(), Detaillist[i] );	--你好，想領取提升TP值的祝福嗎?
				AddSpeakOption( OwnerID(), TargetID(), "[SC_BUFFNPC_39]", "LuaBK_AddBuff" ,0 );
				break;
			end
		end
	end
end
--領取三種BUFF獎勵劇情
function LuaBK_AddBuff()
	--OwnerID = 玩家
	-- TargetID = NPC
	local TransID = GetDBKeyValue("TransfigurationID_00");
	local TransRate = GetDBKeyValue("Transfigurationrate_00");
	local OrgID = ReadRoleValue(TargetID(),EM_RoleValue_OrgID);
	local NPCIDList ={118501,118502,118503};
	local Bufflist = {509683,509684,509685};
	local LvList = {	"Tpbufflv_00",
			"Expbufflv_00",
			"Luckybufflv_00"};
	local TimeList = {"Tpbufftime_00",
			"Expbufftime_00",
			"Luckybufftime_00"};
	for i =1,table.getn(NPCIDList) do
		if OrgID == NPCIDList[i] then
			local SkillLV = GetDBKeyValue(LvList[i]);
			local SkillTime = GetDBKeyValue(TimeList[i]);
			if CheckFlag( OwnerID(),544727) == true then
				SetSpeakDetail( OwnerID(), "[SC_BUFFNPC_27]"); --你今天已經領取過了，明天再來吧。
				 CloseSpeak( OwnerID() );
			else
				if (Rand(100)+1)>TransRate then--變身機率
					Addbuff( OwnerID(), Bufflist[i], SkillLV, SkillTime); --給予 BUFF 2小時
					SetFlag( OwnerID(), 544727, 1 );
					CloseSpeak( OwnerID() );
				else
					ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BK_BUFFNPC_21]" , C_SYSTEM );	--你已經獲得寬恕的祝福。
					Addbuff( OwnerID(), TransID, 0, 7200); --給予變身 BUFF 2小時
					SetFlag( OwnerID(), 544727, 1)
					CancelBuff( OwnerID(), 501570 );--
					DialogClose( OwnerID() );
				end
			end
			break;
		end
	end
end
--除債獎勵的 NPC初始劇情
function LuaBK_debt_NPC()
	--OwnerID = 玩家
	-- TargetID = NPC
	local month = GetSystime(3)+1;
	local day = GetSystime(4);
	local hour = GetSystime(1);
	local min = GetSystime(2);
	local NowTime = month*1000000+day*10000+hour*100+min;
	local StartTimeList = "Debtexpstarttime_00";
	local EndTimeList = "Debtexpendtime_00";
	local MaxLvList = "Debthighlv_00";
	local MinLvList = "Debtlowlv_00";
	local OLv = ReadRoleValue(OwnerID(),EM_RoleValue_LV);
	AdjustFaceDir( TargetID() , OwnerID() , 0 ) -- 面向
	BeginPlot( TargetID() , "LuaBK_NPC_Ranger" , 0 )
	local StartTime = GetDBKeyValue(StartTimeList);
	local EndTime = GetDBKeyValue(EndTimeList);
	--DebugMsg( 0 , 0 , "StartTime = "..StartTime.. "EndTime = "..EndTime.. "NowTime = "..NowTime );
	if NowTime > EndTime then
		SetSpeakDetail ( OwnerID(), "[SC_BK_BUFFNPC_20]" );	--這個活動已經結束了!
		 CloseSpeak( OwnerID() );			
	elseif NowTime < StartTime then
		SetSpeakDetail ( OwnerID(), "[SC_BK_BUFFNPC_19]" );	--這個活動還沒開始!
		 CloseSpeak( OwnerID() );			
	end
	local MaxLv = GetDBKeyValue(MaxLvList);
	local MinLv = GetDBKeyValue(MinLvList);
	if OLv>MaxLv or OLv<MinLv then
		--等級不符
		SetSpeakDetail ( OwnerID(), "[SC_BK_BUFFNPC_13][$SETVAR1="..MinLv.."][$SETVAR2="..MaxLv.."]" );	--你的等級不符合活動限制，此活動限[$VAR1]級~[$VAR2]級的玩家參與。
		 CloseSpeak( OwnerID() );			
	else
		SetSpeakDetail( OwnerID(), "[SC_BK_BUFFNPC_12]" );	--你好，想領取去除部分債務的祝福嗎?
		AddSpeakOption( OwnerID(), TargetID(), "[SC_BUFFNPC_39]" , "LuaBK_debt_part_01", 0 );
	end
end
--領取清負債祝福劇情
function LuaBK_debt_part_01()
	local TransID = GetDBKeyValue("TransfigurationID_00");
	local TransRate = GetDBKeyValue("Transfigurationrate_00");
	local DebtEXP = ReadRoleValue( OwnerID(), EM_RoleValue_DebtExp); --負債EXP
	local DebtTP = ReadRoleValue( OwnerID(), EM_RoleValue_DebtTP); --負債TP
	local EXP = GetDBKeyValue("Expdebt_00");
	local TP = GetDBKeyValue("Tpdebt_00");
	local NewEXP = DebtEXP+EXP;
	local NewTP = DebtTP+TP;
	--讀取後台值判斷是否全部清除
	if CheckFlag( OwnerID(), 544727) == true then
		SetSpeakDetail( OwnerID(), "[SC_BUFFNPC_27]" ) --你今天已經領取過了，明天再來吧。
		CloseSpeak( OwnerID() );
	elseif DebtEXP>=0 and DebtTP >= 0 then
		SetSpeakDetail( OwnerID(), "[SC_BUFFNPC_37]") --沒有負債
		CloseSpeak( OwnerID() );
	else
		if (Rand(100)+1)>TransRate then--變身機率
			if NewEXP >0 or EXP <0 then
				NewEXP = 0;
			end
			if NewTP >0 or TP <0 then
				NewTP = 0;
			end
			WriteRoleValue( OwnerID(), EM_RoleValue_DebtExp, NewEXP);
			WriteRoleValue( OwnerID(), EM_RoleValue_DebtTP, NewTP);
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BUFFNPC_38]" , C_SYSTEM );	--你已經獲得寬恕的祝福。
			SetFlag( OwnerID(), 544727, 1)
			CloseSpeak( OwnerID() );
		else
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BK_BUFFNPC_21]" , C_SYSTEM );	--你已經獲得寬恕的祝福。
			Addbuff( OwnerID(), TransID, 0, 7200); --給予 變身BUFF 2小時
			SetFlag( OwnerID(), 544727, 1)
			CancelBuff( OwnerID(), 501570 );--
			DialogClose( OwnerID() );
		end
	end
end
--刪除NPC選單
function LuaBK_buffnpc_DelNPC_01()
	local Time = 0 
	local DialogStatus = 0
	if CheckBuff( OwnerID() , 501570) == true then 
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );--視窗已經打開了
		return 0
	end
	AddBuff(OwnerID() , 501570,0,-1);
	DialogCreate( OwnerID(), EM_LuaDialogType_Select, "[SC_BUFFNPC_40]" )   --NPC類型選擇表單
 	DialogSelectStr( OwnerID(), "[SC_BK_BUFFNPC_14]")  -- 確定刪除[0]
 	DialogSelectStr( OwnerID(), "[SC_BK_BUFFNPC_15]")  -- 確定刪除[1]
 	DialogSelectStr( OwnerID(), "[SC_BK_BUFFNPC_16]")  -- 確定刪除[2]
 	DialogSelectStr( OwnerID(), "[SC_BK_BUFFNPC_17]")  -- 確定刪除[3]
 	DialogSelectStr( OwnerID(), "[SC_BK_BUFFNPC_18]")  -- 確定刪除[4]
	DialogSelectStr( OwnerID(), "[SC_BUFFNPC_12]")	--回到上ㄧ頁[5]
	if ( DialogSendOpen(OwnerID() ) == false)  then  --表單使用錯誤，回傳錯誤訊息
		ScriptMessage ( OwnerID(), OwnerID(), 1, "[SYS_FIXEQ_DATA_ERROR]", 0) 
		CancelBuff( OwnerID(), 501570 );--
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
			DialogClose( OwnerID() );
			CancelBuff( OwnerID(), 501570 );--
			break;
		elseif DialogStatus == 5 then -- 回到上ㄧ頁
			CancelBuff( OwnerID(), 501570 );--
			Beginplot( OwnerID(), "LuaBK_buffnpc",0 );
			DialogClose( OwnerID() );
			break;
		else
			CancelBuff( OwnerID(), 501570 );--
			CallPlot(OwnerID(),"LuaBK_buffnpc_DelNPC_02",DialogStatus+1)
			DialogClose( OwnerID() );
		--	Say( OwnerID() , DialogStatus );
			break;	
		end
	end
end  
--刪除NPC劇情
function LuaBK_buffnpc_DelNPC_02(DialogStatus) 	--刪除NPC
	local NPCIDList ={118501,118502,118503,118504,118505}
	if DialogStatus ==5 then
		Lua_DavisDelObj(NPCIDList);
	else
		Lua_DavisDelObj(NPCIDList[DialogStatus]);
	end
end
--測試用負債值
function LuaBK_buffnpc01(XX)
	WriteRoleValue( OwnerID(), EM_RoleValue_DebtExp, XX )	
	WriteRoleValue( OwnerID(), EM_RoleValue_DebtTP, XX/10 )	
end
--檢查距離劇情
function LuaBK_NPC_Ranger()	-- 距離超過50即關閉對話視窗
	while true do
		if GetDistance( OwnerID() , TargetID() )  >= 50 then
			CloseSpeak( TargetID() )
			AdjustFaceDir( OwnerID(), TargetID() , 0 ) -- 面向
			PlayMotion( OwnerID() , 116 ) -- 再見
			break
		end
		sleep(5)
	end
end