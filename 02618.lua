function Lua_Hao_Germany_3th_Counter()	-- 3周年 Npc - 林其米‧百匯(116477) 物件產生劇情

	local Self = OwnerID()
	local Room = ReadRoleValue( Self , EM_RoleValue_RoomID )
	local ZoneID = ReadRoleValue( Self , EM_RoleValue_RealZoneID )
	local Time = { 0 , 3 , 6 , 9 , 12 , 15 , 18 , 21 }	-- 遊戲開始時間
 	local Tornados = {}
	local Hour , Min , Npc , SysHour , SysMin	-- 時、分、產生的隱型物件
	local EventBuff = 503217			-- 節慶活動專屬 Buff
	local ObjID , X , Y , Z , Dir , MsgMin
	local Zone = ZoneID -1000*math.floor( ZoneID / 1000 )		
	
	if Zone == 2 then
		ObjID , X , Y , Z , Dir = 113105 , 1181.1 , 37.3 , 6919.3 , 330.6		-- 產生的隱形物件
	elseif Zone == 951 then
		ObjID , X , Y , Z , Dir = 113105 , 443.3 , -257.2 , 164.9 , 338.1		-- 產生的隱形物件
	end

	AddBuff( Self , EventBuff , 0 , -1 )

	if Germany_3th_Tornado_Time == nil then
		Germany_3th_Tornado_Time = 0 -- 時間
	end

	while true do
		if Germany_3th_Tornado_Time ~= 0 then
			Hour = Math.floor(Germany_3th_Tornado_Time/100)
			Min = Germany_3th_Tornado_Time%100
			if Min > 59 then
				Min = Min%60
				Hour = Hour + 1
			end
			if Hour > 23 then
				Hour = Hour%24
			end
			Germany_3th_Tornado_Time = Hour*100 + Min
			SysHour = GetSystime(1)
			SysMin = GetSystime(2)
		--	DebugMsg( 0 , Room , "De 3th Custom time: "..string.format("%04d", Germany_3th_Tornado_Time ).." System time: "..string.format("%02d", SysHour ).." : "..string.format("%02d", SysMin ) )
			Germany_3th_Tornado_Time = Germany_3th_Tornado_Time + 1
		else
			Hour = GetSystime(1)
			Min = GetSystime(2)
		--	DebugMsg( 0 , Room , "De 3th Custom time: "..string.format("%04d", Germany_3th_Tornado_Time ).." System time: "..string.format("%02d", Hour ).." : "..string.format("%02d", Min ) )
		end
--		DebugMsg( 0 , Room , Hour.." : "..Min )
		for i = 1 , table.getn(Time) , 1 do
			if Hour == Time[i] + 2  then
				if Min == 50 then
				--	if ZoneID <= 999 then
				--		RunningMsgEX( Self , 1 , 3 , "Tornado will come after 10 min." )	-- 凡瑞娜絲城大門前的料理鐵人 - 安基司‧百匯正在招募熱心的冒險者們，看來，他很需要幫忙。
				--	end
				--	break
				elseif Min == 55 or Min == 59 then
					MsgMin = 60 - Min
					if ZoneID <= 999 then
						RunningMsgEX( Self , 2 , 3 , "[SC_DE_3TH_TORNADO_00][$SETVAR1="..MsgMin.."]" )	-- 一股不穩定的能量正於幻紗湖的上空流竄，天氣專家表示：5分鐘後，這股能量將轉變為強烈的龍捲風。
					end
					break					
				end
			elseif Hour == Time[i] then
				if Min == 0 then
					if ZoneID <= 999 then
						RunningMsgEX( Self , 2 , 3 , "[SC_DE_3TH_TORNADO_01]" )	-- 於幻紗湖出現了龍捲風，據說還降下了青蛙雨！？
					end
					Npc = CreateObj( ObjID , X  , Y , Z , Dir , 1 )	-- 產生隱形物件
					SetModeEx( Npc , EM_SetModeType_ShowRoleHead , false )	-- 頭像框
					SetModeEx( Npc , EM_SetModeType_Mark , false )		-- 標記
					SetModeEx( Npc , EM_SetModeType_Show , false )		-- 顯示
					SetModeEx( Npc , EM_SetModeType_Fight , false )		-- 砍殺
					AddToPartition( Npc , Room )
					BeginPlot( Npc , "Lua_Hao_Germany_3th_Show_Time" , 0 )	-- 產生龍捲風
					break
				elseif Min == 20 then
					if ZoneID <= 999 then
						RunningMsgEX( Self , 2 , 3 , "[SC_DE_3TH_TORNADO_02]" )	-- 在幻紗湖肆虐的龍捲風似乎消失了。
					end
					for i = 1 , 2 , 1 do
						Tornados[i] = ReadRoleValue( Npc , EM_RoleValue_Register+i )
						DelObj( Tornados[i] )
					end
					DelObj( Npc )
					break
				end 
			end
		end
	--	Hour = GetSystime(1)
	--	Min = GetSystime(2)
		Sleep(600)
	--	sleep(10)
	end
end

function Lua_Hao_Germany_3th_Show_Time()	-- 隱形物件產升龍捲風

	local Self = OwnerID()
	local Room = ReadRoleValue( Self , EM_RoleValue_RoomID )
	local X = ReadRoleValue( Self , EM_RoleValue_X )
	local Y = ReadRoleValue( Self , EM_RoleValue_Y )
	local Z = ReadRoleValue( Self , EM_RoleValue_Z )
	local Dir = ReadRoleValue( Self , EM_RoleValue_Dir )
	local TornadoID = 120467
	local Tornados = {}
	local Range = 200
--	local Sec = 300	-- 隱形物件執行掃描的時間
	local Buff = { 622162 , 622163 , 507555 }	-- 捕捉時間、神奇藥水、神奇藥水使用特效
	local Key = { 545451 , 545452 }	-- 已報名、已完成
	local ObjID , Count

	for i = 1 , 2 , 1 do
		Tornados[i] = CreateObj( TornadoID , X , Y , Z , Dir , 1 )
		SetModeEx( Tornados[i] , EM_SetModeType_ShowRoleHead , false )	--頭像框
		SetModeEx( Tornados[i] , EM_SetModeType_Mark , false )		--標記
		SetModeEx( Tornados[i] , EM_SetModeType_Show , true )		--顯示
		SetModeEx( Tornados[i] , EM_SetModeType_Fight , false )		--砍殺
		MoveToFlagEnabled( Tornados[i] , false )				--關閉巡邏劇情
		WriteRoleValue( Self , EM_RoleValue_Register+i , Tornados[i] )
		AddToPartition( Tornados[i] , Room )
	end

	while true do
		Count = SetSearchRangeInfo( Self , Range )
		for i = 1 , Count , 1 do
			ObjID = GetSearchResult()
			if ReadRoleValue( ObjID , EM_RoleValue_IsPlayer ) == 1 and ReadRoleValue( ObjID , EM_RoleValue_RoomID ) == Room then
				 if CheckFlag( ObjID , Key[1] ) == true and CheckFlag( ObjID , Key[2] ) == false then
					SetFlag( ObjID , Key[2] , 1 )
					CancelBuff_NoEvent( ObjID , Buff[2] )
				--	if Sec >= 120 then
				--		Sec = 120
				--		AddBuff( ObjID , Buff[1] , 0 , Sec ) 
				--	else
				--		AddBuff( ObjID , Buff[1] , 0 , Sec )
				--	end
					AddBuff( ObjID , Buff[1] , 0 , 120 )
					AddBuff( ObjID , Buff[3] , 0 , 1 )
				--	ScriptMessage( ObjID , ObjID , 1 , "You have "..Sec .." Sec" , C_SYSTEM )
					ScriptMessage( ObjID , ObjID , 1 , "[SC_DE_3TH_TORNADO_14]" , C_SYSTEM )
					ScriptMessage( ObjID , ObjID , 0 , "[SC_DE_3TH_TORNADO_14]" , C_SYSTEM )
				end
			end
		end
		Sleep(10)
	--	Sec = Sec - 1
	--	if Sec == 0 then
	--		break
	--	end
	end
end

function Lua_Hao_Germany_3th_Check_Time() -- 查詢目前時間

	local Player = OwnerID()
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local Hour , Min

	if Germany_3th_Tornado_Time ~= 0 and Germany_3th_Tornado_Time ~= nil then
		Hour = Math.floor(Germany_3th_Tornado_Time/100)
		Min = Germany_3th_Tornado_Time%100
		DebugMsg( 0 , Room , "Custom time: "..string.format("%04d", Germany_3th_Tornado_Time ) )
	else
		Hour = GetSystime(1)
		Min = GetSystime(2)
		DebugMsg( 0 , Room , "System time: "..string.format("%02d", Hour ).." : "..string.format("%02d", Min ) )
	end
end

function Lua_Hao_Germany_3th_Set_Time(Time) -- 自訂設定時間

	local Player = OwnerID()
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )

	if Time == nil then
		DebugMsg( Player , Room , "I can't understand what you mean." )
		return false
	end

	if Germany_3th_Tornado_Time == nil then
		Germany_3th_Tornado_Time = 0 -- 時間
	end

	local Hour , Min
	Hour = Math.floor(Time/100)
	Min = Time%100

	if Hour > 23 or Min > 59 then
		DebugMsg( Player , Room , "I can't understand what you mean." )
		return false
	else
		Hour = GetSystime(1)
		Min = GetSystime(2)
		Germany_3th_Tornado_Time = Time
	--	DebugMsg( Player , Room , Hour.." : "..Min )
		DebugMsg( 0 , Room , "Custom time: "..string.format("%04d", Germany_3th_Tornado_Time ).." System time: "..string.format("%02d", Hour ).." : "..string.format("%02d", Min ) )
	end
end
			
function Lua_Hao_Germany_3th_Npc_0( Npc , Range , Sec )	-- 對話超過距離，關閉對話劇情

	local Player = OwnerID()
	local BuffID = 621751	-- 偵測距離
--	local BuffIDPos , Npc
	
	while true do
	--	BuffIDPos = Lua_BuffPosSearch( Player , BuffID )			-- 取 Buff 的位置
	--	Npc = BuffInfo( Player , BuffIDPos , EM_BuffInfoType_OwnerID )	-- 取 Buff 施展者
		if GetDistance( Player , Npc )  >= Range then
			CloseSpeak( Player )
			AdjustFaceDir( Npc , Player , 0 ) -- 面向
			break
		end
		sleep(Sec)
	end
	CancelBuff_NoEvent( Player , BuffID )	
end


function Lua_Hao_Germany_3th_DelKey()	-- 個人遊戲時間結束時，執行的劇情

	local Player = OwnerID()
	local Key = 545451
	local Buff = 622146
	local Score = Lua_Hao_Return_Buff_Lv( Player , Buff ) + 1
	local String = "[SC_DE_3TH_TORNADO_18][$SETVAR1="..Score.."]"
--	local OrgID = ReadRoleValue( Player , EM_RoleValue_DBID )
--	local Accept = 1024
--	local Over = 888
--	local Reset = 1280
--	local Call = { " , " , "Accept =" , Accept , " , " ,"Over =" , Over , " , " , "Reset =" , Reset }
	
	SetFlag( Player , Key , 0 )
	ScriptMessage( Player , Player , 1 , "[SC_DE_3TH_TORNADO_03]" , C_SYSTEM )
	ScriptMessage( Player , Player , 0 , "[SC_DE_3TH_TORNADO_03]" , C_SYSTEM )
	ScriptMessage( Player , Player , 2 , String , C_SYSTEM )
	ScriptMessage( Player , Player , 0 , String , C_SYSTEM )
--	return Lua_Event_Return_Log(Score)
--	return Lua_Event_Return_Log(Call)
end

function Lua_Hao_Germany_3th_DelKey_Test()	-- 測試離線觸發

	AddBuff( OwnerID() , 622162 , 0 , 100 )
end
-------------------------------------------------------------------------------------------------------------------- 以上為時間劇情
function Lua_Hao_Germany_3th_Npc_1()	-- 3周年 Npc -林其米‧百匯(116477) 對話劇情

	local Player = OwnerID()
	local Npc = TargetID()
	local IsBuffed = CheckBuff( Player , 621751 )
	local Key = { 545451 , 545452 , 545463 }	-- 已報名、已完成、已兌換獎勵
	local Buff = 622146
	local Score = Lua_Hao_Return_Buff_Lv( Player , Buff ) + 1
	local Step = 0
	
	SysCastSpellLv( Npc , Player , 496587 , 0 )
	if IsBuffed== false then
		CallPlot( Player , "Lua_Hao_Germany_3th_Npc_0" , Npc , 50 , 5 )  --檢查NPC與玩家的距離
	end
	AdjustFaceDir( Npc , Player , 0 ) --面向
	if CheckFlag( Player , Key[1] ) == true then
		SetSpeakDetail( Player , "[SC_DE_3TH_TORNADO_05]" ) -- 已報名
		Step = 1
	else	-- 未報名或已捕捉青蛙
		if CheckFlag( Player , Key[2] ) == false then	-- 未報名
			SetSpeakDetail( Player , "[SC_DE_3TH_TORNADO_04]" ) -- 主內容
			AddSpeakOption( Player , Npc , "[SC_DE_3TH_TORNADO_17]" , "Lua_Hao_Germany_3th_Npc_2", 0 )-- 需要幫手嗎？
		else	-- 已完成捕捉青蛙
		--	if Score >= 1 then
			if CheckFlag( Player , Key[3] ) == false then	-- 領取獎勵
				SetSpeakDetail( Player , "[SC_DE_3TH_TORNADO_07]"  )	-- 今天真是謝謝你的幫忙。
				AddSpeakOption( Player , Npc , "[SC_FIREDAY_EV1_21]" , "Lua_Hao_Germany_3th_Npc_6" , 0 )-- 領取獎勵
			else
				SetSpeakDetail( Player , "[SC_DE_3TH_TORNADO_15]"  )	-- 看來你的收穫不太妙
				AddSpeakOption( Player , Npc , "[SC_DE_3TH_TORNADO_08]" , "Lua_Hao_Germany_3th_Npc_4" , 0 )-- 我想換取更多的魔法誘餌
			end
		end
	end
	if Step == 1 then
		AddSpeakOption( Player , Npc , "[SC_DE_3TH_TORNADO_09]" , "Lua_Hao_Germany_3th_Npc_3 " , 0 )-- 提示
	end
end

function Lua_Hao_Germany_3th_Npc_2()

	local Player = OwnerID()
	CloseSpeak( Player )
	SetSpeakDetail( Player , "[SC_DE_3TH_TORNADO_16]" ) -- 內容
	AddSpeakOption( Player , Player , "[SC_DE_3TH_TORNADO_06]" , "Lua_Hao_Germany_3th_Npc_2_0", 0 )-- 我來幫助你吧！
	AddSpeakOption( Player , Player , "[SO_BACK]" , "Lua_Hao_Germany_3th_Npc_1 " , 0 )-- 回到上一頁
end

function Lua_Hao_Germany_3th_Npc_2_0()

	local Player = OwnerID()
	local Npc = TargetID()
	CloseSpeak( Player )
	local Key = 545451
	local Buff = 622163
	SetFlag( Player , Key , 1 )
--	AddBuff( Player , Buff , 0 , 86400 )
	AddBuff( Player , Buff , 0 , 604800 )
	AdjustFaceDir( Npc , Player , 0 ) --面向
	PlayMotion( Npc , 112 )
--	BeginPlot( Player , "Lua_Hao_Germany_3th_Npc_7" , 0 )
	AddBuff( Player , 507555 , 0 , 1 )
--	AddBuff( Player , 507555 , 0 , 1 )
	ScriptMessage( Player , Player , 1 , "[SC_DE_3TH_TORNADO_10]" , C_SYSTEM )	-- 一切就拜託你了。
	ScriptMessage( Player , Player , 0 , "[SC_DE_3TH_TORNADO_10]" , C_SYSTEM )	-- 一切就拜託你了。
	DesignLog( Player , 116477 , "2012 DE 3th Frog Rain Start")	-- 選擇參加遊戲的人數
end

function Lua_Hao_Germany_3th_Npc_3()

	local Player = OwnerID()
	SetSpeakDetail( Player , "[SC_DE_3TH_TORNADO_11]" ) -- 內容
	AddSpeakOption( Player , Player , "[SO_BACK]" , "Lua_Hao_Germany_3th_Npc_1 " , 0 )-- 回到上一頁
end

function Lua_Hao_Germany_3th_Npc_4()

	local Player = OwnerID()
	SetSpeakDetail( Player , "[SC_DE_3TH_TORNADO_12]"  )	-- Are you sure that you want to trade 1 [202903] to 1 Magic?
	AddSpeakOption( Player , Player , "[SC_GETTITLE_1]" , "Lua_Hao_Germany_3th_Npc_5" , 0 )	-- Yes , I do.
	AddSpeakOption( Player , Player , "[SO_BACK]" , "Lua_Hao_Germany_3th_Npc_1" , 0 )	-- 回到上一頁
end

function Lua_Hao_Germany_3th_Npc_5()

	local Player = OwnerID()
	local Npc = TargetID()
	local Key = { 545451 , 545452 , 545463 }	-- 已報名、已完成、已兌換獎勵
	local Item = 202903	-- 傳送者符文
	local Ticket = CountBodyItem( Player , Item )
	local Buff = 622163
	
	CloseSpeak( Player )
	
	if Ticket >= 1 then
		DelBodyItem( Player , Item , 1 )
		SetFlag( Player , Key[1] , 1 )
		SetFlag( Player , Key[2] , 0 )
		SetFlag( Player , Key[3] , 0 )
		AddBuff( Player , Buff , 0 , 604800 )
		ScriptMessage( Player , Player , 1 ,  "[SC_DE_3TH_TORNADO_13]" , C_SYSTEM )	-- 我已經重新幫你灑上了[622163]，祝你好運。
		AdjustFaceDir( Npc , Player , 0 ) --面向
		PlayMotion( Npc , 112 )
	--	BeginPlot( Player , "Lua_Hao_Germany_3th_Npc_7" , 0 )
		AddBuff( Player , 507555 , 0 , 1 )
	--	AddBuff( Player , 507555 , 0 , 1 )
	--	PlayMotion( Npc , ruFUSION_ACTORSTATE_CAST_INSTANT )	-- 施法動作
	else
		ScriptMessage( Player , Player , 1 , "[SC_112502_NO]" , C_SYSTEM )	-- 你持有的物品數量不足喔！ 
	end
	DesignLog( Player , 1164771 , "2012 DE 3th Frog Rain Reset")	-- 選擇支付 1 個傳送者符文重置的人次
end

function Lua_Hao_Germany_3th_Npc_6()

	local Player = OwnerID()
	local Npc = TargetID()
	local Range = { 25 , 75 , 125 , 99999 }	--　50以下 , 51-100 , 101-150 , 150以上
	local Buff = 622146
	local Key = 545463	-- 已兌換獎勵
	local Score = Lua_Hao_Return_Buff_Lv( Player , Buff ) + 1
	local Sapce = { 2 , 3 , 3 , 3 }
	local Gift = {}
		Gift[1] = 209561	-- 歡慶青蛙憑證
		Gift[2] = 241114	-- 精緻的緞帶
		Gift[3] = { 241128 , 241127 , 241126 }
		
	AdjustFaceDir( Npc , Player , 0 )
--	PlayMotion( Npc , 102 )
	CloseSpeak( Player )
	
	for i = 1 , table.getn(Range) , 1 do
		if Score <= Range[i] then
			if Check_Bag_Space( Player , Sapce[i] ) == false then
				ScriptMessage( Player , Player , 1 ,  "[SC_111490_DIALOG10]" , C_SYSTEM )	-- 背包空間不足
				return false
			end
			GiveBodyItem( Player , Gift[1] , 1 )
			GiveBodyItem( Player , Gift[2] , 3 )
			if i ~= 1 then
				GiveBodyItem( Player , Gift[3][i-1] , 1 )
			end
			SetFlag( Player , Key , 1 )
			CancelBuff_NoEvent( Player , Buff )
			break
		end
	end
	DesignLog( Player , 1164772 , "2012 DE 3th Frog Rain Score = "..Score )	-- 完成此活動的玩家次數與得分
end

function Lua_Hao_Germany_3th_Npc_7()

	local Player = OwnerID()
	local Buff = 507555

	Sleep(20)	
	AddBuff( Player , Buff , 0 , 1 )
end
-------------------------------------------------------------------------------------------------------------------- 以上為Npc對話劇情
function Lua_Hao_Germany_3th_Tornado()	-- 龍捲風巡邏劇情

	local Self = OwnerID()
	local X = ReadRoleValue( Self , EM_RoleValue_X )
	local Y = ReadRoleValue( Self , EM_RoleValue_Y )
	local Z = ReadRoleValue( Self , EM_RoleValue_Z )
	local Range , NewX , NewZ , NewY
	local Count = 0
	local Buff = { 622107 , 622108 }	-- 緩速、加速
	AddBuff( Self , 621744 , 0 , -1 )	-- 放大	
	MoveToFlagEnabled( Self , false )	--關閉巡邏劇情
	BeginPlot( Self , "Lua_Hao_Germany_3th_Produce" , 0 )	-- 生成青蛙
	while true do
		SysCastSpellLv( Self , Self , 850040 , 0 )
		Range = Math.random(100)+75
		NewX = X+Math.random( -Range , Range )
		NewZ = Z+Math.random( -Range , Range )
		NewY = GetHeight( NewX , Y , NewZ )
	--	DebugMsg( 0 , 0 , "X = "..NewX.." Y = "..Y.." Z = "..NewZ )
	--	DebugMsg( 0 , 0 , " Count = "..Count.." % = "..Count%50 )
		if CheckLine( Self , NewX , NewY , NewZ ) == true and Count%50 == 0 then
			AddBuff( Self , Buff[2] , Rand(5)+10 , 5 )	-- 緩、加速
		--	AddBuff( Self , Buff[Math.random(2)] , Rand(10) , 5 )	-- 緩、加速
			MoveDirect( Self , NewX , NewY , NewZ )
			Count = 0
		end
	--	DebugMsg( 0 , 0 , "Count = "..Count )
		Sleep(1)
		Count = Count + 1
	end
end 

function Lua_Hao_Germany_3th_Produce( Tornado )	-- 生成青蛙

	if Tornado == nil then
		Tornado = OwnerID()
	end
	local Room = ReadRoleValue( Tornado , EM_RoleValue_RoomID )
--	local Name = ReadRoleValue( Tornado , EM_RoleValue_PID )
--	local CreateID = 120293	-- 產生雪花  
	local Limit = 10
	local CreateID = {}
	CreateID[1] = { 20 , 115004 , 1 , 8 }	-- % 1分 青蛙存在於地面的秒數
	CreateID[2] = { 35 , 114993 , 3 , 6 }	-- % 3分 同上
	CreateID[3] = { 45 , 115005 , 5 , 4 }	-- % 5分 同上
	CreateID[4] = { 55 , 120463 , 10 , 2 }	-- % 10分 同上
	CreateID[5] = { 70 , 120464 , 0 , 5 }	-- % 恐懼 0分 同上
	CreateID[6] = { 85 , 120465 , 0 , 1 }	-- % 震退 0分 同上
	CreateID[7] = { 100 , 120466 , 0 , 1 }	-- % 倒地 0分 同上	-- 114993
	
	local Pos = {}			-- 座標
	local X , Y , Z , Plane , Dir , Cal , Height , RandDis , ObjID , NpcPlane , Number ,  Percent
	while true do
--	for j = 1 , 1 , 1 do
		Number = ReadRoleValue( Tornado , EM_RoleValue_Register+1 )
	--	DebugMsg( 0 , Room , "ID = "..Name.." Number = "..Number )
		if Number < Limit then
		 	Percent = Rand(100)+1
			X = ReadRoleValue( Tornado , EM_RoleValue_X )
			Y = ReadRoleValue( Tornado , EM_RoleValue_Y )
			Z = ReadRoleValue( Tornado , EM_RoleValue_Z )
			Plane = GetHeight( X , Y , Z )		-- 玩家水平面
			Dir = Rand(360)				-- 隨機面向
			Cal = (math.pi/180)*(Dir)		-- 物件生成時的角度 
			Height = Math.random(100 , 150)+Plane	-- 物件生成時的高度
			RandDis = Math.random( 1 , 50 )	-- 圓半徑
			Pos["X"] = X + (RandDis*math.cos(Cal))	-- 圓心的隨機X
			Pos["Z"] = Z - (RandDis*math.sin(Cal))	-- 圓心的隨機Z
		--	DebugMsg( Tornado , Room , "X= "..X.." Y= "..Y.." Z= "..Z.." Dir ="..Dir.." Plane = "..Plane )
			for i = 1 , table.getn(CreateID) , 1 do
				if Percent <= CreateID[i][1] then
					ObjID = CreateObj( CreateID[i][2] , Pos["X"] , Height , Pos["Z"] , Dir , 1 )
					NpcPlane = GetHeight( Pos["X"] , Height , Pos["Z"] )
					Number = Number + 1
					WriteRoleValue( Tornado , EM_RoleValue_Register+1 , Number )
					WriteRoleValue( ObjID , EM_RoleValue_Register+1 , Tornado )		--讓生成的青蛙記起龍捲風
					WriteRoleValue( ObjID , EM_RoleValue_Register+2 , CreateID[i][3] )		--將分數帶入青蛙中
					SetModeEx( ObjID , EM_SetModeType_ShowRoleHead , false )		--頭像框
					SetModeEx( ObjID , EM_SetModeType_Mark , false )			--標記
					SetModeEx( ObjID , EM_SetModeType_Gravity , false )			--重力
					SetModeEx( ObjID , EM_SetModeType_DisableRotate , false )		--關閉自動面向
					SetModeEx( ObjID , EM_SetModeType_Show , true )			--顯示
					SetModeEx( ObjID , EM_SetModeType_Move , true )			--移動
					SetModeEx( ObjID , EM_SetModeType_Drag , true )			--水平
					SetModeEx( ObjID , EM_SetModeType_Searchenemy , false )		--索敵
					SetModeEx( ObjID , EM_SetModeType_Fight , false )			--砍殺
					SetModeEx( ObjID , EM_RoleValue_SetNPCAttackRange , 0 )		--攻擊距離
					MoveToFlagEnabled( ObjID , false )					--關閉巡邏劇情
					AddToPartition( ObjID , Room )
					SetDefIdleMotion( ObjID , ruFUSION_MIME_JUMP_LOOP )			--指定動作
					MoveDirect( ObjID , Pos["X"] , NpcPlane , Pos["Z"] )
					CallPlot( ObjID , "Lua_Hao_Germany_3th_Frog" , Pos["X"] , Height , NpcPlane , Pos["Z"] , Dir , Tornado , i , CreateID[i][4] )
					CallPlot( ObjID , "Lua_Hao_Germany_3th_Cast" , i )			--青蛙施法
					break
				end
			end
		end
		sleep(10)
	end
end

function Lua_Hao_Germany_3th_Frog( X , Y , NpcPlane , Z , Dir , Tornado , Choise , Sec )	-- 產生青蛙後，從空中 - 地面 - 地面亂數移動的劇情
	-- 讓青蛙記得 產生時的  X 座標、Y 座標、水平面、Z 座標、面向、龍捲風、多少時間亂數移動一次、分數、青蛙存在於地面的秒數
	local Npc = OwnerID()
	local Room = ReadRoleValue( Npc , EM_RoleValue_RoomID )
	local RealY , Number , Range , NewX , NewY , NewZ , CastOver , Dis , Speed , RealDis , Key
	local Time , Step = 0 , 0
--	local RandNum = Math.random(10)
	local Buff = { 622107 , 622108 }				-- 緩速、加速
	local MagicID = { [5] = 496597 , [6] = 496598 , [7] = 850039  }	-- 恐懼、震退、倒地
	local Effect = { 622109 , 622148 , 622147 , 621883 , 622157 , 622158 , 622159 }-- 勾勾(灰)、勾勾(黃)、驚嘆號(黃)、混亂、驚嘆號(紅)、驚嘆號(灰)、睡眠
	local Random = { ["Slow"] = Rand(10) , ["Fast"] = Rand(25)+25 }
--	local NewDir = ReadRoleValue( Npc , EM_RoleValue_Dir )
	local Motion = {}	-- 降落動作
	Motion[1] = ruFUSION_MIME_PARRY_UNARMED		-- 拭眉(純色綠蛙 1分)
	Motion[2] = ruFUSION_MIME_PARRY_UNARMED		-- 拭眉(雜色綠蛙 2分)
	Motion[3] = ruFUSION_MIME_PARRY_UNARMED		-- 拭眉(純色紅蛙 5分)
	Motion[4] = ruFUSION_MIME_PARRY_UNARMED		-- 拭眉(青蛙王子 10分)
	Motion[5] = ruFUSION_MIME_PARRY_UNARMED		-- 吐舌(恐懼青蛙)
	Motion[6] = ruFUSION_MIME_CAST_SP01		-- 抓狂(震退青蛙)
	Motion[7] = 0						-- 倒地
	local Rate = {}
	Rate[1] = { Buff[1] , Random["Slow"]+5 }	-- 下墜時緩速1%、下墜時的緩速等級
	Rate[2] = { Buff[1] , Random["Slow"]+15 }	-- 同上
	Rate[3] = { Buff[1] , Random["Slow"]+25 }	-- 同上
	Rate[4] = { Buff[1] , Random["Slow"]+50 }	-- 同上
	Rate[5] = { Buff[2] , Random["Fast"] }	-- 下墜時加速1%、下墜時的加速等級
	Rate[6] = { Buff[2] , Random["Fast"] }	-- 同上
	Rate[7] = { Buff[2] , Random["Fast"] }	-- 同上
	
	AddBuff( Npc , Rate[Choise][1] , Rate[Choise][2] , -1 )

	While true do
		RealY = ReadRoleValue( Npc , EM_RoleValue_Y )
	--	DebugMsg( 0 , 0 , " Y  = "..Y.." RealY = "..RealY.." Time ="..Time )
	--	if RealY == NpcPlane then	-- 落地後，執行的劇情
		if RealY - NpcPlane <= 5 then	-- 落地後，執行的劇情
		--	WriteRoleValue( Npc , EM_RoleValue_PID , NpcPlane )	-- 將每次判斷的距離寫入青蛙
			CastOver = ReadRoleValue( Npc , EM_RoleValue_Register+3 )	--只讓青蛙施法一次
			SetModeEx( Npc , EM_SetModeType_Gravity , true )		--重力
			WriteRoleValue( Npc , EM_RoleValue_IsWalk , 0 )
			CancelBuff_NoEvent( Npc , Rate[Choise][1] )
			AddBuff( Npc , Buff[1] , Rand(10)+5 , -1 )
			
			if Motion[Choise] ~= 0 then
				SetDefIdleMotion( Npc , Motion[Choise] )			--降落後表演動作
				Sleep(5)
			--	SetDefIdleMotion( Npc , ruFUSION_MIME_RUN_FORWARD )	--恢復跑步狀態
			else
				SetDefIdleMotion( Npc , ruFUSION_MIME_CAST_SP01 )		--抓狂
			end

			if Choise > 5 then
				AddBuff( Npc , Effect[3] , 0 , -1 )
				if CastOver == 0 then
					SysCastSpellLv( Npc , Npc , MagicID[Choise] , 0 )
					WriteRoleValue( Npc ,  EM_RoleValue_Register+3 , 1 )
				end
			else
				for i = 1 , Sec*10 , 1 do
					if i%10 == 0 then
						Range = Math.random(50) + 100
						NewX = X+Math.random( -Range , Range )
						NewZ = Z+Math.random( -Range , Range )
					 	NewY = GetHeight( NewX , RealY , NewZ )
					--	DebugMsg( 0 , 0 , "X = "..NewX.." Y = "..Y.." Z = "..NewZ )
						if CheckLine( Npc , NewX , NewY , NewZ ) == true then
						--	LuaFunc_WaitmoveTo( Npc , NewX , NewY , NewZ )
							MoveDirect( Npc , NewX , NewY , NewZ )
					--		CallPlot( Npc , "DW_MoveRand" , Npc , Range )
						end
					end
					sleep(1)
				end
			end
			sleep(10)
		--	AddBuff( Npc , 622145 , 0 , 1 )  
			if Choise <= 5 then
				Key = ReadRoleValue( Npc , EM_RoleValue_Register+4 )
				if Key ~= 1 then
				--	CancelBuff_NoEvent( Npc , Effect[1] )
					WriteRoleValue( Npc , EM_RoleValue_Register+4 , 1 )	-- 讓 Npc 不再可以被得分
					AddBuff( Npc , Effect[7] , 0 , -1 )
					sleep(5)
				end
			end
			Number = ReadRoleValue( Tornado , EM_RoleValue_Register+1 )
			WriteRoleValue( Tornado , EM_RoleValue_Register+1 , Number-1 )
			DelObj( Npc )
			break
--		else
--			if Y ~= RealY then
--				if Step <= 1 then
--					Dis = Y - RealY
--					Speed = Dis / Time
				--	DebugMsg( 0 , 0 , "Dis = "..Dis.." Time = "..Time.." Speed = "..Speed )
				--	DebugMsg( 0 , 0 , "Y  = "..Y.." RealY = "..RealY )
--					Time = 0 -- 時間
--					Y = RealY -- 改變Y為當前預判值
--					Step = Step + 1
--				end
--			end
		end
	--	DebugMsg( 0 , 0 , "Time = "..Time )
--		if Step > 1 then
--			RealDis = Y - Speed*Time
--		--	DebugMsg( 0 , 0 , "RealDis = "..RealDis.." Y = "..Y )
--			if RealDis - NpcPlane < 40 then
--				RealDis = NpcPlane
--			end
--			WriteRoleValue( Npc , EM_RoleValue_PID , RealDis )	-- 將每次預估的距離寫入青蛙
--		end
		Sleep(1)
--		Time = Time + 1 -- 時間
	end
end

function Lua_Hao_Germany_3th_Check()	-- 睡眠、偷取分數、於基本法術上執行的檢查劇情，確認被施法對象是否是自己。

	local Self = OwnerID()
	local Target = TargetID()
	local Key = { 545451 , 545452 }	-- 已報名、已完成
	local Score = 622146		-- 分數
	local FeedBack = 496596	-- 回饋特效
	local DefBuff = { 622165 , 5 }	-- 反偷竊專家、持續時間
	local TargetScore , AfterScore
	local Random = Math.random( 1 , 5 )
	local SName = GetName( Self )
	local TName = GetName( Target )
	local String_1 , String_2

	if CheckBuff( Target , DefBuff[1] ) == true or CheckBuff( Target , Score ) == false then
		return false
	end

	if Target == Self or CheckFlag( Target , Key[1] ) == false or CheckFlag( Target , Key[2] ) == false then
		return false
	else
		AddBuff( Target , DefBuff[1] , 0 , DefBuff[2] )
		TargetScore = Lua_Hao_Return_Buff_Lv( Target , Score ) + 1
		AfterScore = TargetScore - Random
		if TargetScore > 0 then
			CancelBuff_NoEvent( Target , Score )
			if AfterScore > 0 then
				String_1 = "[SC_DE_3TH_TORNADO_19][$SETVAR1="..SName.."][$SETVAR2="..Random.."]"
				String_2 = "[SC_DE_3TH_TORNADO_20][$SETVAR1="..TName.."][$SETVAR2="..Random.."]"
				ScriptMessage( Target , Target , 0 , String_1 , C_Red )
				ScriptMessage( Self , Self , 0 , String_2 , "0xFF37FF39" )				
				ScriptMessage( Target , Target , 2 , "- "..Random , C_Red )
				ScriptMessage( Self , Self , 1 , "+ "..Random , "0xFF37FF39" )
				AddBuff( Target , Score , AfterScore-1 , -1 )
				AddBuff( Self , Score , Random-1 , -1 )
			else
				String_1 = "[SC_DE_3TH_TORNADO_19][$SETVAR1="..SName.."][$SETVAR2="..TargetScore.."]"
				String_2 = "[SC_DE_3TH_TORNADO_20][$SETVAR1="..TName.."][$SETVAR2="..TargetScore.."]"
				ScriptMessage( Target , Target , 0 , String_1 , C_Red )
				ScriptMessage( Self , Self , 0 , String_2 , "0xFF37FF39" )			
				ScriptMessage( Target , Target , 2 , "- "..TargetScore , C_Red )
				ScriptMessage( Self , Self , 1 , "+ "..TargetScore , "0xFF37FF39" )
				AddBuff( Self , Score , TargetScore-1 , -1 )
			end
			SysCastSpellLv( Target , Self , 499108 , 0 )
		end
		return true
	end
end

function Lua_Hao_Germany_3th_ReCheck()	-- 確認被施法對象是否有報名

	local Self = OwnerID()
	local Target = TargetID()
	local Key = { 545451 , 545452 }	-- 已報名、已完成

	if Target == Self or CheckFlag( Target , Key[1] ) == false or CheckFlag( Target , Key[2] ) == false then
		return false
	end
end

function Lua_Hao_Germany_3th_Cast( Choise )	-- 青蛙定期施法

	local Npc = OwnerID() 
	local MagicID = { }
	MagicID[1] = 496588	-- 計算分數
	MagicID[2] = 496588	-- 同上 
	MagicID[3] = 496588	-- 同上 
	MagicID[4] = 496588	-- 同上 
	MagicID[5] = 496597	-- 恐懼

	if Choise <= 5 then
		while true do
 			SysCastSpellLv( Npc , Npc , MagicID[Choise] , 0 )
 			sleep(1)
		end
	end
end

function Lua_Hao_Germany_3th_Base( Choise )

	local Npc = OwnerID()
	local Player = TargetID()
	local Tornado = ReadRoleValue( Npc , EM_RoleValue_Register+1 )		--讓生成的青蛙想起龍捲風
	local Number = ReadRoleValue( Tornado , EM_RoleValue_Register+1 )	--讀取龍捲風已生成的青蛙數量
	local Score = ReadRoleValue( Npc , EM_RoleValue_Register+2 )		--讀取該青蛙的分數
	local Touch = ReadRoleValue( Npc , EM_RoleValue_Register+4 )		--讀取青蛙是否已被碰觸
	local Dis = ReadRoleValue( Npc , EM_RoleValue_PID )			--讀取青蛙的實際高度
	local Range , Height = 5 , 20	-- 可允取範圍的平面、高度誤差
	local Key = { 545451 , 545452 }	-- 已報名、已完成
	local N_Pos , P_Pos , Var = {} , {} , {}
	local Random = Math.random(100)
	local Effect = { 622109 , 622148 , 622147 , 621883 , 622157 , 622158 , 622159 }-- 勾勾(灰)、勾勾(黃)、驚嘆號(黃)、混亂、驚嘆號(紅)、驚嘆號(灰)、睡眠
	local ScoreBuff = { 622145 , 622146 }
	local TimeBuff = 622162	-- 捕捉時間
--	local Color = { [1] = C_SYSTEM , [3] = C_SYSTEM , [5] = C_Red , [10] = "0xFF91C7FF" }
	local MagicID = {}
	local Steal = 25		-- 取得偷竊法術的機率
	MagicID[1] = { 622126 , 3 }	-- 判斷恐懼
--	MagicID[2] = { 622127 , 1 }	-- 判斷震退
	MagicID[3] = { 622128 , 1 }	-- 判斷倒地

	if CheckFlag( Player , Key[1] ) == false or CheckBuff( Player , TimeBuff ) == false then
		return false
	end

	if Choise == nil then
	--	N_Pos["X"] = ReadRoleValue( Npc , EM_RoleValue_X )
	--	N_Pos["Z"] = ReadRoleValue( Npc , EM_RoleValue_Z )
		N_Pos["Y"] = ReadRoleValue( Npc , EM_RoleValue_Y )

	--	P_Pos["X"] = ReadRoleValue( Player , EM_RoleValue_X )
	--	P_Pos["Z"] = ReadRoleValue( Player , EM_RoleValue_Z )
		P_Pos["Y"] = ReadRoleValue( Player , EM_RoleValue_Y )

	--	Var["X"] = N_Pos["X"] - P_Pos["X"]
	--	Var["Z"] = N_Pos["Z"] - P_Pos["Z"]
		Var["Y"] = N_Pos["Y"] - P_Pos["Y"]
	--	Var["W"] = Dis - P_Pos["Y"]
		
	--	DebugMsg( 0 , 0 , "N_Pos = "..N_Pos["Y"].." P_Pos = "..P_Pos["Y"].." Dis = "..Dis.." Touch = "..Touch )

	--	if Math.abs(Var["W"]) < Height then	-- Server做預估的動作。
		if Math.abs(Var["Y"]) < Height then	-- Server由每0.3秒變更為每0.1秒抓範圍後，就不需要Dis做預估的動作。
		--	DebugMsg( 0 , 0 , "Number = "..Number )
			if Score ~= 0 and Touch == 0 then
				WriteRoleValue( Npc , EM_RoleValue_Register+4 , 1 )	-- 讓 Npc 不再可以被得分
				CancelBuff_NoEvent( Npc , Effect[1] )
				AddBuff( Npc , Effect[2] , 0 , -1 )
				AddBuff( Player , ScoreBuff[1] , 0 , 1 )
				AddBuff( Player , ScoreBuff[2] , Score-1 , -1 )
				ScriptMessage( Player , Player , 1 , "+"..Score , C_SYSTEM )
			--	ScriptMessage( Player , Player , 1 , "+"..Score , Color[Score] )
				if Random <= Steal then
					AddBuff( Player , 622160 , 0 , 2 )
				end
			end
		else
			return false
		end
	else
		AddBuff( Player , MagicID[Choise][1] , 0 , MagicID[Choise][2] )
		if Choise == 1 then   
			AddBuff( Npc , Effect[3] , 0 , 2 )
			AdjustFaceDir( Npc , Player , 0 )
			SetDefIdleMotion( Npc , ruFUSION_ACTORSTATE_ATTACK_POLEARM )	-- 吐舌
		end
	end
	sleep(5)
--	AddBuff( Npc , 622145 , 0 , 1 )
	WriteRoleValue( Tornado , EM_RoleValue_Register+1 , Number-1 )
	DelObj( Npc )
end
---------------------------------------------------------------------------------------------以下為測試用
function Lua_Hao_Germany_3th_Clear()	-- 清除所有物件

	local CreateID = {}
	CreateID[1] = 114993	-- 1分
	CreateID[2] = 115004	-- 3分
	CreateID[3] = 115005	-- 5分
	CreateID[4] = 120463	-- 10分
	CreateID[5] = 120464	-- 恐懼
	CreateID[6] = 120465	-- 震退
	CreateID[7] = 120466	-- 倒地
	CreateID[8] = 120467	-- 龍捲風
	CreateID[9] = 113105	-- 隱藏物件
	
	for i = 1 , table.getn(CreateID) , 1 do
		Lua_Hao_NPCofAll_Clear(CreateID[i])
	end
end

function Lua_Hao_Germany_3th_Reset(Choise)

	local Player = OwnerID()
	local Key = {}
	Key[1] = { 545451 , 1 }	-- 已報名
	Key[2] = { 545452 , 0 }	-- 已完成
	Key[3] = { 545463 , 0 }	-- 當日已領取獎勵
	
	local Buff = { 622146 , 622162 , 622163 }	-- 食材分數、捕捉時間、神奇藥水
	
	if Choise == 0 then
		for i = 1 , table.getn(Key) , 1 do
			SetFlag( Player , Key[i][1] , 0 )
		end
		
		for i = 1 , table.getn(Buff) , 1 do
			if CheckBuff( Player , Buff[i] ) == true then
				CancelBuff_NoEvent( Player , Buff[i] )
			end
		end
		DebugMsg( Player , 0 , "Reset" )
	elseif Choise == 1 then
		for i = 1 , table.getn(Key) , 1 do
			SetFlag( Player , Key[i][1] , Key[i][2] )
		end
		CancelBuff_NoEvent( Player , Buff[1] )
		CancelBuff_NoEvent( Player , Buff[2] )
		AddBuff( Player , Buff[3] , 0 , 604800 )
		DebugMsg( Player , 0 , "Let's go" )
	else
		DebugMsg( Player , 0 , "Entry error" )
	end
end
function Lua_Hao_Germany_3th_GameStart()	-- 遊戲開始(未使用)

	local Player = OwnerID()
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local Count = SetSearchAllNpc(Room)
	local NpcID = 116477
	local Obj , ObjID

	if Count ~= 0 then
		for i = 1 , Count , 1 Do
			Obj = GetSearchResult()
			ObjID = ReadRoleValue( Obj , EM_RoleValue_OrgID )
			if ObjID == NpcID then
				BeginPlot( ObjID , "" , 0 )
				break
			end
		end
	end
end

function Lua_Hao_Germany_3th_ScriptMsg()

	local Self = OwnerID()
	local Random
	for i = 1 , 10 , 1 do
		Random = Math.Random(1,10)
		ScriptMessage( Self , Self , 0 , "+ "..Random , C_SYSTEM )
	end
end

function Lua_Hao_Test_CheckXYZ(Choise)

	CallPlot( OwnerID() , "Lua_Hao_Test_CheckXYZ_3" , Choise )
end

function Lua_Hao_Test_CheckXYZ_2(Height)

	local Obj = OwnerID()
	local Room = ReadRoleValue( Obj , EM_RoleValue_RoomID )
	DebugMsg( Obj , Room , "Call Height = "..Height )
end

function Lua_Hao_Test_CheckXYZ_3(Choise)

	local Obj = OwnerID()  
	local Room = ReadRoleValue( Obj , EM_RoleValue_RoomID )
	local X , Y , Z , Height
	local Sec = 0
		
	while Sec < 101 do
		X = ReadRoleValue( Obj , EM_RoleValue_X )
		Y = ReadRoleValue( Obj , EM_RoleValue_Y ) 
		Z = ReadRoleValue( Obj , EM_RoleValue_Z )
		Height = GetHeight( X , Y , Z )
	--	DebugMsg( Obj , Room , "X = "..X.." Z = "..Z.." Y = "..Y.." Height = "..Height )
	--	DebugMsg( Obj , Room , "X = "..X.." Z = "..Z )
		if Choise == 0 then
			DebugMsg( Obj , Room , "X = "..X.." Z = "..Z )
		elseif Choise == 1 then
			DebugMsg( Obj , Room , "Y = "..Y.."True Height = "..Height )
		elseif Choise == 2 then
			DebugMsg( Obj , Room , "X = "..X.." Z = "..Z.." Y = "..Y.." Height = "..Height )
		end
	--	CallPlot( Obj , "Lua_Hao_Test_CheckXYZ_2" , Height )
		Sleep(1)
		Sec = Sec + 1
	end
end

function Lua_Hao_Test_RandMove()

	local Npc = OwnerID()

	for i = 1 , 10 , 1 do
		CallPlot( Npc , "DW_MoveRand" , Npc , 25 )
		Sleep(10)
	end
end

function Lua_Hao_Germany_3th_Frog_Test()	-- 105098

	local Self = OwnerID()
	local X = ReadRoleValue( Self , EM_RoleValue_X )
	local Y = ReadRoleValue( Self , EM_RoleValue_Y )
	local Z = ReadRoleValue( Self , EM_RoleValue_Z )
	local Range , NewX , NewY , NewZ
	MoveToFlagEnabled( Self , false )				--關閉巡邏劇情
	SetModeEx( Self , EM_SetModeType_DisableRotate , false )	--關閉自動面向
	WriteRoleValue( Self , EM_RoleValue_IsWalk , 0 )
	SetDefIdleMotion( Self , ruFUSION_MIME_RUN_FORWARD )	--恢復跑步狀態
	while true do
		Range = Math.random(25) + 25
		NewX = X+Math.random( -Range , Range )
		NewZ = Z+Math.random( -Range , Range )
 		NewY = GetHeight( NewX , Y , NewZ )
	--	DebugMsg( 0 , 0 , "X = "..NewX.." Y = "..Y.." Z = "..NewZ )
		if CheckLine( Self , NewX , NewY , NewZ ) == true then
		--	LuaFunc_WaitmoveTo( Npc , NewX , Y , NewZ )
			MoveDirect( Self , NewX , NewY , NewZ )
		--	CallPlot( Npc , "DW_MoveRand" , Npc , Range )
		end
		sleep(10)
	end
end