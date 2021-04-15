-- 以下為 Npc 起始劇情 --
function Hao_DE_4th_Npc_121802_Create()	-- 4周年 Npc -葛雷．追分(121802) 起始劇情

	local Npc = OwnerID()
	local Zone = ReadRoleValue( Npc , EM_RoleValue_ZoneID )
	local Room = ReadRoleValue( Npc , EM_RoleValue_RoomID )
	local Box = {}
	Box["ID"] = 121911	-- 隱型物件
	local Pos = {}
	
	if Zone == 2 then
		Pos["X"] , Pos["Y"] , Pos["Z"] , Pos["Dir"] = 3108.4 , 44.9 , 50.0 , 146.4
	else
		Pos["X"] , Pos["Y"] , Pos["Z"] , Pos["Dir"] = Lua_Hao_Return_Coordinate(Npc) -- 取Npc當前座標
	end

	AddBuff( Npc , 503217 , 0 , -1 )	-- 施放活動用標誌
	if DE_4th_121802_StarBall == nil then	-- 宣告活動專屬的全域變數
		DE_4th_121802_StarBall = {}
	end

	Box["Obj"] = CreateObj( Box["ID"] , Pos["X"] , Pos["Y"] , Pos["Z"] , Pos["Dir"] , 1 )
	WriteRoleValue( Npc , EM_RoleValue_PID , Box["Obj"])	-- 將隱型物件寫入 Npc，讓 Npc 記得隱型物件
	Hao_Germany_4th_Obj_Status( Box["Obj"] , Room , false , false , false , false , false )	-- 選擇生成狀態
	DE_4th_121802_StarBall[Room] = {}	-- 宣告該 Room 的全域變數
	DE_4th_121802_StarBall[Room][0] = Box["Obj"]	-- 宣告活動專屬的全域變數 [Room][0] 為隱型物件
	CallPlot( Box["Obj"] , "Hao_DE_4th_Npc_Mounted_Buff" , 80 )	-- 禁止騎乘
	CallPlot( Box["Obj"] , "Hao_DE_4th_Npc_121802_Create_Obj" , Box["Obj"] , Room )	-- 開始生成物件的劇情

	local NpcList = {}
	NpcList[1] = { 121799 , 3 }	-- 綠色星空球、全場物件總量
	NpcList[2] = { 121800 , 2 }	-- 黃色星空球、全場物件總量
	NpcList[3] = { 121801 , 4 }	-- 藍色星空球、全場物件總量
	NpcList[4] = { 121443 , 9 }	-- 活動石板、全場物件總量，石板固定量為9，最大量為 18 ，故設為可允許值10
	NpcList[5] = { 121865 , 3 }	-- 葉球、全場物件最大量
	NpcList[6] = { 121866 , 0 }	-- 甜蜜蜜貪吃球、為葉球的變化體，與葉球共享物件最大量
	NpcList[7] = { 121867 , 0 }	-- 火辣辣貪吃球、為葉球的變化體，與葉球共享物件最大量
	NpcList[8] = { 107622 , 5 }	-- 烏鴉、全場物件總量
	NpcList[9] = { 121911 , 1 }	-- 德國4周年慶星空爭霸隱型物件、全場物件總量、隱型物件無法搜尋
	
	while true do
		Sleep(600)
		local SearchNpc = SetSearchRangeInfo( Npc , 500 )	-- 掃出範圍內所有物件(含自己)
	--	local SearchNpc = SetSearchAllNPC( Room )	-- 搜尋全場的Npc物件
		local Count = {}
		Count["Total"] = 0	-- 總量
		Count["StarBall"] = 0	-- 星空球
		Count["Bird"] = 0	-- 烏鴉
		Count["Balloon"] = 0	-- 葉球
		Count["Slate"] = 0	-- 石板
		-- 2013.11.18 新增，監控星空球爆量的問題
		Count["Maximum"] = 0	-- 最大值
		--
		local SearchList = {}
		for i = 1 , SearchNpc , 1 do	-- 將物件逐一回傳
			local Result = GetSearchResult()	-- 回傳物件
			table.insert( SearchList , Result )			
			local OrgID = ReadRoleValue( Result , EM_RoleValue_OrgID )	-- 回傳物件的OrgID
			for j = 1 , #NpcList , 1 do
				if Count[j] == nil then
					Count[j] = 0
				end
				if OrgID == NpcList[j][1] then
					Count[j] = Count[j] + 1	-- 用來計算各物件當前總量
					break
				end
			end
		end
		for j = 1 , #NpcList , 1 do	-- 計算總量後，得出總共有幾種物件低於標準值
			if Count[j] == 0 then
				if j < 4 then	-- 當判斷的物品為星空球時，若該球不存在，則...
					Count["StarBall"] = Count["StarBall"] + 1
				elseif j >= 5 and j <= 7 then	-- 若各式葉球都不存在，則...
					Count["Balloon"] = Count["Balloon"] + 1	-- 葉球
				elseif j == 8 then	-- 若烏鴉都不存在，則...
					Count["Bird"] = Count["Bird"] + 1	-- 烏鴉
				end
			end
			if Count[j] < NpcList[j][2] then	-- 當單種物件少於或列表中物件總量時則+1，不判斷甜蜜蜜貪吃球與火辣辣貪吃球(設為0)
				if j == 4 then
					DesignLog( Npc , 1218024 , "2013 DE 4th Slate = "..Count[j] )
				end
				Count["Total"] = Count["Total"] + 1
				if j == 4 then
					Count["Slate"] = Count["Slate"] + 1
				end
			end
			-- 2013.11.18 新增，監控星空球爆量的問題
			if j < 4 then	-- 當星空球的數量大於列表中物件總量時則+1，只判斷星空球
				if Count[j] > NpcList[j][2] then
					Count["Maximum"] = Count["Maximum"] + 1
				end
			end					
			--
		end
		Box["CheckObj"] = ReadRoleValue( Npc , EM_RoleValue_PID )	-- 讀取記錄於Npc中的隱型物件
		if Count["StarBall"] == 3 or Count["Balloon"] == 3 or Count["Bird"] == 1 or Count["Slate"] == 1 or Count["Total"] > 3 or CheckID(Box["CheckObj"]) == false or Count["Maximum"] > 0 then
		-- 當三種星空球全消失、三種葉球全消失、烏鴉全消失、石板少於可允許值、列表中的物件有4種(不含甜蜜蜜與火辣辣貪吃球)少於全場物件總量、隱形物件不在其中一種條件達成時則重置
		-- 2013.11.18 新增星空球超過標準值時重置，監控星空球爆量的問題
			DesignLog( Npc , 1218023 , "2013 DE 4th Event Reset".." , Total = "..Count["Total"].." , StarBall = "..Count["StarBall"].." , Bird = "..Count["Bird"].." ,  Balloon = "..Count["Balloon"].." , Slate = "..Count["Slate"] )
		--	初始狀態為 Total = ０ , StarBall = 0 , Bird = 0 , Balloon = 2 , Slate = 0
			for i = 1 , #SearchList , 1 do	-- 將物件逐一回傳
				local OrgID = ReadRoleValue( SearchList[i] , EM_RoleValue_OrgID )	-- 回傳物件的OrgID
				for j = 1 , #NpcList , 1 do
					if OrgID == NpcList[j][1] then	-- 將物件全數刪除
						DelObj(SearchList[i])
						break
					end
				end
			end
			Sleep(10)
		--	DesignLog( Npc , 1218023 , "2013 DE 4th Event Reset" )
			Box["Obj"] = CreateObj( Box["ID"] , Pos["X"] , Pos["Y"] , Pos["Z"] , Pos["Dir"] , 1 )
			WriteRoleValue( Npc , EM_RoleValue_PID , Box["Obj"])	-- 將隱型物件寫入 Npc，讓 Npc 記得隱型物件			
			Hao_Germany_4th_Obj_Status( Box["Obj"] , Room , false , false , false , false , false )	-- 選擇生成狀態
			DE_4th_121802_StarBall[Room] = {}	-- 宣告該 Room 的全域變數
			DE_4th_121802_StarBall[Room][0] = Box["Obj"]	-- 宣告活動專屬的全域變數 [Room][0] 為隱型物件
			CallPlot( Box["Obj"] , "Hao_DE_4th_Npc_Mounted_Buff" , 80 )	-- 禁止騎乘
			CallPlot( Box["Obj"] , "Hao_DE_4th_Npc_121802_Create_Obj" , Box["Obj"] , Room )	-- 開始生成物件的劇情
		end
	end
end

function Hao_Del_Single_Obj(NpcID)	-- 刪除該區域指定ID中所有物件的  1 個

	local Player = OwnerID()
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local SearchNpc = SetSearchAllNPC( Room )	-- 搜尋全場的Npc物件
	local Count = 0
	
	for i = 1 , SearchNpc , 1 do	-- 將物件逐一回傳
		local Result = GetSearchResult()	-- 回傳物件
		local OrgID = ReadRoleValue( Result , EM_RoleValue_OrgID )	-- 回傳物件的OrgID
		if OrgID == NpcID then
			if Count == 0 then
				DelObj(Result)
			end
			Count = Count + 1
		end
	end
	DebugMsg( Player , Room , NpcID.." = "..Count-1 )	-- 指定Npc剩餘的數量
end
		
function Hao_DE_4th_Npc_Mounted_Buff(Range)	-- 判斷禁止騎乘

	local Box = OwnerID()
	local Room = ReadRoleValue( Box , EM_RoleValue_RoomID )	-- 回傳區域
	local Buff = 624013	--禁止騎乘
	
	while true do
		local Count = SetSearchRangeInfo( Box , Range*2 )	-- 掃出範圍內所有物件(含自己)
		for i = 1 , Count , 1 do
			local ObjID = GetSearchResult()	-- 回傳範圍內所有物件的 GUID
			if ReadRoleValue( ObjID , EM_RoleValue_IsPlayer ) == 1 then	-- 如果是玩家才處理			
				local Distance = GetDistance( Box , ObjID )	-- 取得該物件與參考物件的距離
				if Distance <= Range  then
					if DW_CancelMount( ObjID ) == true then	-- 讓騎乘中的玩家下馬(包含副座)
						ScriptMessage( ObjID , ObjID , 1 , "[SC_THANKS_2011_12]" , C_SYSTEM )	-- 活動進行中，此處無法騎乘坐騎！
						ScriptMessage( ObjID , ObjID , 0 , "[SC_THANKS_2011_12]" , C_SYSTEM )
					end
					if CheckBuff( ObjID , Buff ) == false then
						AddBuff( ObjID , Buff , 0 , 5 )
					--	DebugMsg( ObjID , Room , "Distance = "..Distance )
					else
						local Pos = Lua_BuffPosSearch( ObjID , Buff )
						local Time = BuffInfo( ObjID , Pos , EM_BuffInfoType_Time )
						if Time <= 1 then
							AddBuff( ObjID , Buff , 0 , 5 )
						end
					end
				elseif Distance <= Range*2 then
					if CheckBuff( ObjID , Buff ) == true then
						CancelBuff_NoEvent( ObjID , Buff )
					end
				end
			end
		end
		Sleep(10)
	end
end

-- 物件產生劇情 --
function Hao_DE_4th_Npc_121802_Create_Obj(ObjID , Room )

	local Polygon = 18	-- 幾邊形，需為偶數
	local Distance = 75	-- 半徑距離，直徑需*2
	local SlateID = 121443	-- 平台ID(圓形石板)
--	local SlateID = 121807	-- 平台ID(方形地磚)
	local Slate = {}		-- 平台
	local Height = { 5 , 15 , 25 , 35 , 45 , 55 , 65 , 75 , 85 }	-- 在指定高度建立圓形平台，總數需為 Polygon /2
	local Pos = {}
	Pos["X"] , Pos["Y"] , Pos["Z"] , Pos["Dir"] = Lua_Hao_Return_Coordinate(ObjID) -- 取Npc當前座標
	Pos["Obj_X"] , Pos["Obj_Y"] , Pos["Obj_Z"] = {} , {} , {}
	
	for i = 1 , #Height , 1 do	-- 在指定高度建立圓形平台
		local Point = { i , i+(Polygon/2) }		-- 將圓以N邊型方式拼湊。 Table 的數量，將決定每層高度有幾個平台	
		DE_4th_121802_StarBall[Room][i] = {}	-- (將每個點的 x.y.z 代入全域變數中，再次更新時，可考慮用其他物件記住，不需全域變數)
		for j = 1 , Polygon , 1 do	-- 建立的平台是以幾邊形、及多大的圓排列(再次更新時，可考慮只宣告一次 x . y . z 座標，再從 y 變化，不需多個迴圈做運算)
			Pos["Obj_X"][j] = Pos["X"]-Distance*math.cos(math.pi*2*(j/Polygon))
			Pos["Obj_Y"][j] = Pos["Y"]+Height[i]
			Pos["Obj_Z"][j] = Pos["Z"]+Distance*math.sin(math.pi*2*(j/Polygon))
			DE_4th_121802_StarBall[Room][i][j] = { Pos["Obj_X"][j] , Pos["Obj_Y"][j] , Pos["Obj_Z"][j] }
		end
	--	for k = 1 , #Point , 1 do	-- 建立星空	兩側皆有半圓
		for k = 1 , #Point , 2 do	-- 建立星空	單側有半圓
			Slate[k] = CreateObj( SlateID , Pos["Obj_X"][Point[k]] , Pos["Obj_Y"][Point[k]] , Pos["Obj_Z"][Point[k]] , Pos["Dir"] , 1 )
			ReCalculate( Slate[k] )	-- 重新計算平台資料
			Hao_Germany_4th_Obj_Status( Slate[k] , Room , true )	-- 選擇生成狀態
			CallPlot( Slate[k] , "Hao_DE_4th_Npc_121802_Slate_Rround" , Slate[k] , Point[k] , Room , i , Polygon , ObjID )
		end
	end
	Callplot( ObjID , "Hao_DE_4th_Npc_121802_Board_Up" , ObjID , Pos["X"] , Pos["Y"] , Pos["Z"] , Pos["Dir"] , Room )
	-- 呼叫平台不斷往上移動。Npc、Npc的 x.y.z.dir、Room
	Hao_Germany_4th_Create_SkyBall()	-- 執行星空球初始劇情
end

function Hao_DE_4th_Npc_121802_Slate_Rround( Slate , Point , Room , Height , Polygon , Npc )	-- 呼叫平台不斷圓形環繞
 -- 平台、建立位置、room、高度、幾邊形、代入Npc
	while true do
		if Point > Polygon then
			Point = 1
		end
		local Pos = {}	-- 讀取全域變數中記錄的 X , Y , Z
		Pos["X"] = DE_4th_121802_StarBall[Room][Height][Point][1]
		Pos["Y"] = DE_4th_121802_StarBall[Room][Height][Point][2]
		Pos["Z"] = DE_4th_121802_StarBall[Room][Height][Point][3]
		MoveDirect( Slate , Pos["X"] , Pos["Y"] , Pos["Z"] )
		Point = Point+1
		sleep(30)
	end
end

function Hao_DE_4th_Npc_121802_Board_Up( ObjID , X , Y , Z , Dir , Room )	-- 於指定高度生成平台，呼叫平台移動至指定高度後消失

	local BoardID = 121443	-- 圓形石板
--	local BoardID = 121807	-- 方形地磚	
	local BirdID = 107622		-- 烏鴉
	local BalloonID = 121865 	-- 葉球	
--	local Height = { 100 , 0 }	-- 在指定高度建立圓形平台 Height[1]為起始點、Height[2]為物件消失點(由上往下移動)
	local Height = { 0 , 85 }	-- 在指定高度建立圓形平台 Height[1]為起始點、Height[2]為物件消失點(由下往上移動)
	local Bird_Height = { 50 , 55 , 60 , 65 , 70 , 75 }	-- 產生烏鴉的高度
	local Balloon_Height = { 25 , 35 , 45 , 55 , 65 , 75 }	-- 產生葉球的高度
	local Polygon ={ 5 , 3 , 6 }	-- 烏鴉、葉球、內圓平台數量
	local Distance = { 35 , 70 , 35 }	-- 烏鴉圓半徑長、葉球圓半徑長、內圈平台半徑長
	local Buff = 622107	-- 減速法術，每增加等級1，減緩1%速度
	local Speed = 79	-- 平台移動減緩的速度，以 Buff 調整
	local Pos = {}
	Pos["X"] , Pos["Y"] , Pos["Z"] , Pos["Others_Y"] = {} , {} , {} , {}

	for Site = 1 , #Distance , 1 do
		Pos["X"][Site] , Pos["Y"][Site] , Pos["Z"][Site] , Pos["Others_Y"][Site] = {} , {} , {} , {}
		for Count = 1 , Polygon[Site] , 1 do	-- 用多邊型代表圓
			Pos["X"][Site][Count] = X-Distance[Site]*math.cos(math.pi*2*(Count/Polygon[Site]))
			Pos["Z"][Site][Count] = Z+Distance[Site]*math.sin(math.pi*2*(Count/Polygon[Site]))
			Pos["Y"][Site][Count] = Y + Height[1]			-- 產生圓型平台的起始高度
			if Site == 1 then	-- 產生烏鴉
				Pos["Others_Y"][Site][Count] = Y + Bird_Height[Count]	-- 產生烏鴉的高度
				local Bird = CreateObj( BirdID , Pos["X"][Site][Count] , Pos["Others_Y"][Site][Count] , Pos["Z"][Site][Count] , Dir , 1 )	-- 產生烏鴉
				Hao_Germany_4th_Obj_Status( Bird , Room , false , true , false , true )	-- 選擇生成狀態(物件、Room、阻擋、頭像框、砍殺、標記)
			elseif Site == 2 then	-- 產生葉球
				Pos["Others_Y"][Site][Count] = Y + Balloon_Height[Count]	-- 產生葉球的高度
				local Balloon = CreateObj( BalloonID , Pos["X"][Site][Count] , Pos["Others_Y"][Site][Count] , Pos["Z"][Site][Count] , Dir , 1 )	-- 產生葉球
				Hao_Germany_4th_Obj_Status( Balloon , Room , false , true , false , true  )	-- 選擇生成狀態(物件、Room、阻擋、頭相框、砍殺、標記)
			end
		end
	end

	while true do
		for Site = 3 , #Distance , 1 do
			for Count = 1 , Polygon[Site] , 1 do	-- 用多邊型代表圓
				local Board = CreateObj( BoardID , Pos["X"][Site][Count] , Pos["Y"][Site][Count] , Pos["Z"][Site][Count] , Dir , 1 )	-- 物件成品
				AddBuff( Board , Buff , Speed , -1 )
				ReCalculate( Board )	-- 重新計算平台速度
				Hao_Germany_4th_Obj_Status( Board , Room , true )	-- 選擇生成狀態
				MoveDirect( Board , Pos["X"][Site][Count] , Y+Height[2] , Pos["Z"][Site][Count] )
				Callplot( Board , "Hao_DE_4th_Npc_121802_Board_Disappear" , Board , ObjID , Y+Height[2] )	-- 平台、Npc、飛毯消失時高度
				Sleep(30)
			end
		end
	end
end

function Hao_DE_4th_Npc_121802_Board_Disappear( Board , ObjID , Height )	-- 指定平台爬升至指定高度消失

	local Sec = 0
	while Sec < 60 do	-- 安全機制，產生平台後超過60秒，平台會刪除自己，避免物件因不明原因無法到達指定高度而爆量的問題
		local Y = ReadRoleValue( Board , EM_RoleValue_Y )
		local Distance = Math.abs(Y-Height)
		if Distance <5 then	-- 距離超過 5 以內就刪除平台
			break
		end
		Sleep(10)
		Sec = Sec + 1
	end
	DelObj(Board)
end
------------------------------ 以下為 Npc 對話劇情 --------------------------
function Hao_DE_4th_Npc_121802()	-- 4周年 Npc -葛雷．追分(121802) 對話劇情

	local Player = OwnerID()
	local Npc = TargetID()
	local CheckDis = CheckBuff( Player , 621751 )	-- 確認玩家是否在 Npc 的對話範圍內
	local Key = { 547508 , 547509 }	-- 任務進行中、任務已完成

	if CheckDis== false then
 		AddBuff( Player , 621751 , 0 , -1 ) -- 偵測距離
		CallPlot( Player , "Hao_Check_Distance" , Npc , 50 )  ----將Npc帶入玩家的記錄中、超過多少距離即關閉視窗
	end

	AdjustFaceDir( Npc , Player , 0 )	-- 面向
	PlayMotion( Npc , 106 )		-- 點頭

	if CheckFlag( Player , Key[1] ) == true then	-- 任務進行中與 Npc 對話時...
		SetSpeakDetail( Player , "[SC_DE_4TH_SKY_BALL_04]" ) -- 已報名。加油，期待你有個好成績！
	else	-- 未報名或已領取獎勵
		if CheckFlag( Player , Key[2] ) == false then	-- 未報名
			SetSpeakDetail( Player , "[SC_DE_4TH_SKY_BALL_01]" )	-- 你好，我是[121802]，有興趣參加星空爭霸嗎？
			AddSpeakOption( Player , Npc , "[SC_DE_4TH_SKY_BALL_02]" , "Hao_DE_4th_Npc_121802_1", 0 )	-- 好阿，我有興趣。
		else	-- 已領取獎勵
			SetSpeakDetail( Player , "[SC_DE_4TH_SKY_BALL_05]"  )	-- 玩得意猶未盡嗎？
			AddSpeakOption( Player , Npc , "[SC_DE_4TH_SKY_BALL_07]" , "Hao_DE_4th_Npc_121802_3" , 0 )	-- 我想再玩一次。			
		end
	end
end
	
function Hao_Check_Distance( Npc , Range )	-- 對話超過距離，關閉對話劇情

	local Player = OwnerID()
	while true do
		if GetDistance( Player , Npc )  >= Range then
			CloseSpeak( Player )
			AdjustFaceDir( Npc , Player , 0 ) -- 面向
			break
		end
		Sleep(5)
	end
	CancelBuff_NoEvent( Player , 621751 )
end

function Hao_DE_4th_Npc_121802_1()	-- 選擇我有興趣後，執行的劇情。

	local Player = OwnerID()
	CloseSpeak( Player )
	SetSpeakDetail( Player , "[SC_DE_4TH_SKY_BALL_03]" ) -- 星空爭霸，一種歷史悠久的遊戲...
	AddSpeakOption( Player , Player , "[SC_111796_0]" , "Hao_DE_4th_Npc_121802_2", 0 )	-- 我準備好了
	AddSpeakOption( Player , Player , "[SO_BACK]" , "Hao_DE_4th_Npc_121802 " , 0 )-- 回到上一頁
end

function Hao_DE_4th_Npc_121802_2()	-- 選擇參加遊戲後，執行的劇情。

	local Player = OwnerID()
	local Npc = TargetID()
	CloseSpeak( Player )
	local Key = 547508	-- 任務進行中
	local Buff = 624006	-- 代表活動時間的Buff
	local Time = 180	-- 捕捉手憑證的持續時間
	
	DW_CancelTypeBuff( 68 , Player )	-- 讓騎乘中的玩家下馬(包含副座)
	SetFlag( Player , Key , 1 )
	AddBuff( Player , Buff , 0 , Time )	-- 活動時間
--	AddBuff( Player , 508175 , 0 , 2 )	-- 參加特效
	AdjustFaceDir( Npc , Player , 0 )	-- 面向
	PlayMotion( Npc , 106 )		-- 點頭
	PlayMotion( Player , 103 )	-- 振臂
	ScriptMessage( Player , Player , 1 , "[SC_DE_4TH_SKY_BALL_08]" , C_SYSTEM )	-- 期待你的表現，成為優異的捕捉手吧！
	ScriptMessage( Player , Player , 0 , "[SC_DE_4TH_SKY_BALL_08]" , C_SYSTEM )	-- 期待你的表現，成為優異的捕捉手吧！
	DesignLog( Player , 121802 , "2013 DE 4th Sky Ball Start" )	--選擇參加遊戲的人數
end

function Hao_DE_4th_Npc_121802_3()	-- 選擇再玩一次後，執行的重置劇情。

	local Player = OwnerID()
	SetSpeakDetail( Player , "[SC_DE_4TH_SKY_BALL_09]"  )	-- 製作星空球需要大量的魔力，目前魔力的來源都是從[202903]中抽取而來，隨著參加人數逐漸增加，我們庫存的[202903]越來越少了，如果你想再玩一次，請先贊助1個[202903]好嗎？
	AddSpeakOption( Player , Player , "[SC_422579_1]" , "Hao_DE_4th_Npc_121802_4" , 0 )	-- 我願意
	AddSpeakOption( Player , Player , "[SO_BACK]" , "Hao_DE_4th_Npc_121802" , 0 )	-- 回到上一頁
end

function Hao_DE_4th_Npc_121802_4()	-- 呈上，執行的重置劇情。

	local Player = OwnerID()
	local Npc = TargetID()
	local Key = { 547508 , 547509 }	-- 任務進行中、任務已完成
	local Item = 202903		-- 傳送者符文
	local Ticket = CountBodyItem( Player , Item )	-- 計算玩家身上有多少個傳送者符文
	local Buff = 624006	-- 代表活動時間的Buff
	local Time = 180	-- 捕捉手憑證的持續時間

	CloseSpeak( Player )
	if Ticket >= 1 then
		DW_CancelTypeBuff( 68 , Player )	-- 讓騎乘中的玩家下馬(包含副座)
		DelBodyItem( Player , Item , 1 )
		SetFlag( Player , Key[1] , 1 )
		SetFlag( Player , Key[2] , 0 )
		AddBuff( Player , Buff , 0 , Time )	-- 180秒的捕捉手憑證
	--	AddBuff( Player , 508175 , 0 , 2 )	-- 參加特效		
		AdjustFaceDir( Npc , Player , 0 )	-- 面向
		PlayMotion( Npc , 112 )		-- 筆劃
		PlayMotion( Player , 103 )	-- 振臂
		ScriptMessage( Player , Player , 1 ,  "[SC_DE_4TH_SKY_BALL_10]" , C_SYSTEM )	-- 你再度擁有了捕捉手憑證。
		ScriptMessage( Player , Player , 0 , "[SC_DE_4TH_SKY_BALL_08]" , C_SYSTEM )	-- 期待你的表現，成為優異的捕捉手吧！
		DesignLog( Player , 1218021 , "2013 DE 4th Sky Ball Reset" )	--選擇支付 1 個傳送者符文的重置人次		
	else
		PlayMotion( Npc , 107 )	-- 搖頭
		ScriptMessage( Player , Player , 1 , "[SC_112502_NO]" , C_SYSTEM )	-- 你持有的物品數量不足喔！		
	end
end

function Hao_DE_4th_Star_Ball_Reward()	-- 遊戲時間結束時，執行的劇情

	local Player = OwnerID()
	local Key = { 547508 , 547509 }	-- 任務進行中、任務已完成
	local Buff = 624003		-- 星塵碎片(代表分數)
	local Score = Lua_Hao_Return_Buff_Lv( Player , Buff ) + 1	-- 累積分數
	local Range = { 0 , 50 , 100 , 150 , 99999 }	-- 分數區間與獎勵

	for i = 1 , table.getn(Range) , 1 do
		local String
		local Gift = {}
		Gift[1] = {}
		Gift[2] = { { 209561 , 1 } , { 241114 , 3 } }	-- 歡慶青蛙憑證*1、精緻的緞帶*3
		Gift[3] = { { 209561 , 1 } , { 241114 , 3 } , { 241128 , 1  } }	-- 歡慶青蛙憑證*1、精緻的緞帶*3、必爾汀圓貝禮包(小)*1
		Gift[4] = { { 209561 , 1 } , { 241114 , 3 } , { 241127 , 1  } }	-- 歡慶青蛙憑證*1、精緻的緞帶*3、必爾汀圓貝禮包(中)*1
		Gift[5] = { { 209561 , 1 } , { 241114 , 3 } , { 241126 , 1  } }	-- 歡慶青蛙憑證*1、精緻的緞帶*3、必爾汀圓貝禮包(大)*1
		if Score <= Range[i] then
			if i > 1 then
				for j = 1 , #Gift[i] , 1 do
					GiveBodyItem( Player , Gift[i][j][1] , Gift[i][j][2] )
				end
				String = "[SC_DE_4TH_SKY_BALL_11][$SETVAR1="..Score.."]"
				PlayMotion( Player , 115 )	-- 歡呼
			else
				String = "[SC_DE_4TH_SKY_BALL_12]"
				PlayMotion( Player , 105 )	-- 哭泣
			end
			SetFlag( Player , Key[1] , 0 )			
			SetFlag( Player , Key[2] , 1 )
			CancelBuff_NoEvent( Player , Buff )
			ScriptMessage( Player , Player , 2 , String , C_SYSTEM )
			ScriptMessage( Player , Player , 0 , String , C_SYSTEM )
			DesignLog( Player , 1218022 , "2013 DE 4th Sky Ball Score = "..Score )	-- 玩家完成此活動的次數與分數
			break
		end
	end
end
-- 以下為星空球初始劇情 --
function Hao_Germany_4th_Create_SkyBall()

	local ObjID = OwnerID()
	local Room = ReadRoleValue( ObjID , EM_RoleValue_RoomID )
	local SkyBall
	local Height = { 25 , 40 , 55 , 70 , 85 , 100 , 115 }	-- 在指定高度建立星空球
	local Removing = 50			-- 星空球生成時離參考物件的距離
	local Pos = {}
	Pos["X"] , Pos["Y"] , Pos["Z"] , Pos["Dir"] = Lua_Hao_Return_Coordinate(ObjID) -- 取Npc當前座標	
	local BallList = {}		-- 每層星空球生成的數量與生成ID
	BallList[1] = { 121801 , 1 , 4 , 20 , 10 }	-- 星空球ID，此層數的物件數量、移動方式、移動距離、重生時間(1/10秒)
	BallList[2] = { 121801 , 1 , 4 , 20 , 10 }	-- 綠色星空球(121799)*3、黃色星空球(121800)*2、藍色星空球 (121801)*4
	BallList[3] = { 121799 , 1 , 3 , 30 , 30 }	-- 
	BallList[4] = { 121800 , 1 , 3 , 40 , 50 }	-- 
	BallList[5] = { 121801 , 2 , 4 , 20 , 10 }	--
	BallList[6] = { 121799 , 2 , 3 , 30 , 30 }	-- 
	BallList[7] = { 121800 , 1 , 3 , 40 , 25 }	--
	
	for i = 1 , #BallList , 1 do
		for k = 1 , BallList[i][2] , 1 do
			local Distance =  math.random( -Removing , Removing )	-- 星空球生成時離參考物件的距離
			Pos["Obj_Dir"] = math.random( 0 , 359 )	-- 移動方向
			local Cal = (math.pi/180)*Pos["Obj_Dir"]
			Pos["Obj_X"] = Pos["X"] +( Distance*math.cos(Cal) )
			Pos["Obj_Y"] = Pos["Y"] +Height[i]
			Pos["Obj_Z"] = Pos["Z"] - ( Distance*math.sin(Cal) )
			SkyBall = CreateObj( BallList[i][1] , Pos["Obj_X"] , Pos["Obj_Y"] , Pos["Obj_Z"] , Pos["Obj_Dir"] , 1 )
			Hao_Germany_4th_Obj_Status( SkyBall , Room , false )	-- 選擇生成狀態
			WriteRoleValue( SkyBall , EM_RoleValue_PID , Height[i] )	-- 將預設高度寫入星空球中
			WriteRoleValue( SkyBall , EM_RoleValue_Register+2 , BallList[i][3] )	-- 將移動方式寫入星空球中
			WriteRoleValue( SkyBall , EM_RoleValue_Register+3 , BallList[i][4] )	-- 將移動距離寫入星空球中
			WriteRoleValue( SkyBall , EM_RoleValue_Register+4 , BallList[i][5] )	-- 將重生時間寫入星空球中
			WriteRoleValue( SkyBall , EM_RoleValue_Register+5 , Removing )	-- 將星空球生成時離參考物件的距離寫入星空球中
			CallPlot( SkyBall , "Hao_Obj_Mobile" , SkyBall , BallList[i][3] , BallList[i][4] , 1 )
			-- 星空球離參考物件的距離加上亂數移動的最大距離，不要超過圓形環繞平台的距離。
		end
	end
end
-- 星空球物件產生劇情(不斷施放法術)
function Hao_Germany_4th_StarBall_Casting()

	local StarBall = OwnerID()
	local OrgID = ReadRoleValue( StarBall , EM_RoleValue_OrgID )
	local Magic = {}
	Magic[121799] = 850605	-- 綠色星空球
	Magic[121800] = 850606	-- 黃色星空球
	Magic[121801] = 850604	-- 藍色星空球
	while true do
		SysCastSpellLv( StarBall , StarBall , Magic[OrgID] , 0 )
		sleep(1)
	end
end
-- 基本法術中的檢查 Lua 檢查玩家是否有代表參加活動的 Buff
function Hao_Germany_4th_StarBall_Check()

	local Player = TargetID()
	local StarBall = OwnerID()
	local Key = 547509	-- 星空爭霸任務已完成
	local Quest = { 425985 , 425998 }	-- 米佳的任務、佳瑋的任務
	local Buff = 624037	-- 狗狗的任務
	local Statue = 0

	if CheckBuff( Player , Buff ) == true or CheckFlag( Player , Key ) == true then	-- 查詢該名玩家是否有狗狗活動的Buff、星空爭霸任務已完成
		Statue = 1
	end

	if Statue == 0 then
		for ID = 1 , #Quest , 1 do	-- 米佳或佳瑋的任務進行中
			if CheckQuest( Player , Quest[ID] , 0 ) == true then
				Statue = 1
				break
			end
		end
	end

	if ReadRoleValue( Player , EM_RoleValue_IsDead ) == 1 then	-- 查詢該名玩家是否死亡
		return false
	end

	if CheckBuff( Player , 624006 ) == false then	-- 查詢該名玩家是否有報名Buff
		if Statue ~= 1 then
			ScriptMessage( Player , Player , 2 , "[SC_DE_4TH_SKY_BALL_06]" , C_RED )	-- 捕捉星空球前，請先找尋取得[624006]。
		end
	--	DebugMsg( Player , 0 , "You must be obtained Buff 624006 first , You can entry /gm ? pcall buffaddskill(624006 to get it" )
		return false
	end
	
	if ReadRoleValue( StarBall , EM_RoleValue_Register+1 ) == 1 then	-- 查詢此星空球是否已施法過
	--	DebugMsg( Player , 0 , "Casting already" )
		return false
	end
	
	DW_CancelTypeBuff( 68 , Player )	-- 讓騎乘中的玩家下馬(包含副座)
end
-- 基本法術中的執行劇情，用來判斷玩家碰觸什麼顏色的星空球，並得到多少分
function Hao_Germany_4th_StarBall_Score(Score)
	-- 藍星空球為 1 分、綠星空球為 5 分、黃星空球為 20分，此設定寫於基本法術中的執行劇情
	local Player = TargetID()
	local StarBall = OwnerID()
	local Effect = { 622109 , 622148 }	-- 勾勾(灰)、勾勾(黃)
	
	AddBuff( StarBall , Effect[2] , 0 , 1 )
	AddBuff( Player , 624003 , Score-1 , -1 )	-- 給允玩家分數
	WriteRoleValue( StarBall , EM_RoleValue_Register+1 , 1 )	-- 該星空球已經施放過法術
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local Height = ReadRoleValue( StarBall , EM_RoleValue_PID )	-- 讀取星空球紀錄的高度
	local ID = ReadRoleValue( StarBall , EM_RoleValue_OrgID )	-- 讀取星空球的OrgID
	local Mobile = ReadRoleValue( StarBall , EM_RoleValue_Register+2 )	-- 讀取預設的移動方式
	local Dis = ReadRoleValue( StarBall , EM_RoleValue_Register+3 )		-- 讀取預設的移動距離
	local ReviveTime = ReadRoleValue( StarBall , EM_RoleValue_Register+4 )	-- 讀取預設的重生時間	
	local Removing =  ReadRoleValue( StarBall , EM_RoleValue_Register+5 )	-- 讀取星空球生成時離參考物件的距離
	local Distance =math.random( -Removing , Removing )			-- 星空球生成時離參考物件的距離
	local Npc = DE_4th_121802_StarBall[Room][0]	-- 讓星空球記起中心點的Npc
	local Pos = {}
	Pos["X"] , Pos["Y"] , Pos["Z"] , Pos["Dir"] = Lua_Hao_Return_Coordinate(Npc) -- 取Npc當前座標
	Pos["Obj_Dir"] = math.random( 0 , 359 )	-- 移動方向

	local Cal = (math.pi/180)*Pos["Obj_Dir"]
	Pos["Obj_X"] = Pos["X"] +( Distance*math.cos(Cal) )
	Pos["Obj_Y"] = Pos["Y"] +Height
	Pos["Obj_Z"] = Pos["Z"] - ( Distance*math.sin(Cal) )

	local Obj = CreateObj( ID , Pos["Obj_X"] , Pos["Obj_Y"] , Pos["Obj_Z"] , Pos["Obj_Dir"] , 1 )
	WriteRoleValue( Obj , EM_RoleValue_PID , Height )
	WriteRoleValue( Obj , EM_RoleValue_Register+2 , Mobile )	-- 將移動方式寫入星空球中
	WriteRoleValue( Obj , EM_RoleValue_Register+3 , Dis )		-- 將移動距離寫入星空球中
	WriteRoleValue( Obj , EM_RoleValue_Register+4 , ReviveTime )	-- 將重生時間寫入星空球中
	WriteRoleValue( Obj , EM_RoleValue_Register+5 , Removing )	-- 將星空球生成時離參考物件的距離寫入星空球中
	CallPlot( Obj , "Hao_Germany_4th_StarBall_Back" , Obj , Mobile , ReviveTime , Dis , StarBall , Room )
	-- 新星空球、移動方式、重生時間、舊星空球、分流、
end

function Hao_Germany_4th_StarBall_Back( Obj , Mobile , ReviveTime , Dis , StarBall , Room )
	-- 新星空球、移動方式、重生時間、舊星空球、分流
	DelObj(StarBall)
	Sleep(ReviveTime)
	Hao_Germany_4th_Obj_Status( Obj , Room , false )	-- 選擇生成狀態
	CallPlot( Obj , "Hao_Obj_Mobile" , Obj , Mobile , Dis , 1 )	-- 代入目標、移動方式、移動距離、是否Loop
end
-- 以下為共用函式 -- 
-- 等待移動至定點後，才執行其他劇情
function Hao_WaitMoveTo( ObjID , X , Y , Z )

	MoveDirect( ObjID , X , Y , Z )
	while true do
		local Pos = {}
		Pos["X"] , Pos["Y"] , Pos["Z"] , Pos["Dir"]= Lua_Hao_Return_Coordinate(ObjID) -- 取球當前座標
	--	DebugMsg( 0 , 0 , Pos["X"].." , "..Pos["Y"].." , "..Pos["Z"] )
		if Math.abs(X - Pos["X"]) < 5 and Math.abs(Y - Pos["Y"]) < 5 and Math.abs(Z- Pos["Z"]) < 5 then
			break
		end
		sleep(5)
	end
end
-- 在基本法術中的檢查lua掛上此Lua，可以偵測施法者與被施法者的高度差距
function Hao_Obj_To_Obj_Height(Height)

	local Caster = OwnerID()
	local Target = TargetID()
	local OrgID = ReadRoleValue( Target , EM_RoleValue_OrgID )
	local Pos = {}
	Pos["Caster_Y"] = ReadRoleValueFloat( Caster , EM_RoleValue_Y )	
	Pos["Target_Y"] = ReadRoleValueFloat( Target , EM_RoleValue_Y )
--	DebugMsg( 0 , 0 , "Dis = "..Math.abs( Pos["Caster_Y"] - Pos["Target_Y"]) )
	if Math.abs( Pos["Caster_Y"] - Pos["Target_Y"] ) > Height then
		return false
	end
end

-- 原地建立一個物件，並從當前面向移動
function Hao_Obj_Mobile(ObjID,Mobile,Distance,Loop)	-- 物件、移動方式、距離、是否會來回
-- Mobile = 1 時，為上下移動、2 時為前後移動、3時為以一個點為起始點，上下左右亂數移動、4時為以一個點為起始點，左右亂數移動。
-- Distance 可填 - 值，會往反方向移動、Loop 為 1 時，會重複往返，可不填。

--	local Zone = ReadRoleValue( ObjID , EM_RoleValue_ZoneID )
	local Pos = {}
	Pos["X"] , Pos["Y"] , Pos["Z"] , Pos["Dir"] = Lua_Hao_Return_Coordinate(ObjID)	-- 取ObjID當前座標
	local Cal = (math.pi/180)*Pos["Dir"]
	if Loop == nil then
		Loop = 0
	end

	if Mobile == 1 then	-- 上(Loop時為上下)
		Pos["NewX"] = Pos["X"]
		Pos["NewZ"] = Pos["Z"]
		Pos["NewY"] = Pos["Y"] + Distance
		Pos["Surface"] = GetHeight( Pos["NewX"] , Pos["Y"] , Pos["NewZ"] )
		if Pos["NewY"] <= Pos["Surface"] then
			Pos["NewY"] = Pos["Surface"]
		end		
	elseif Mobile == 2 then	-- 前(Loop時為前後)
		Pos["NewX"] = Pos["X"] +( Distance*math.cos(Cal) )
		Pos["NewZ"] = Pos["Z"] - ( Distance*math.sin(Cal) )
		Pos["NewY"] = Pos["Y"]
		Pos["Surface"] = GetHeight( Pos["NewX"] , Pos["Y"] , Pos["NewZ"] )
		if Pos["NewY"] <= Pos["Surface"] then
			Pos["NewY"] = Pos["Surface"]
		end
	end
	
	while true do
		local Statue = ReadRoleValue( ObjID , EM_RoleValue_IsAttackMode )           --判斷是否進入戰鬥 1=是 0=否
		if Mobile == 3 then	-- 以一個點為起始點，上下左右亂數移動。
			Pos["Dir"] = math.random( 1 , 360 )
			local Cal = (math.pi/180)*Pos["Dir"]
			Pos["NewX"] = Pos["X"] +( Distance*math.cos(Cal) )
			Pos["NewZ"] = Pos["Z"] - ( Distance*math.sin(Cal) )
			Pos["NewY"] = Pos["Y"] + math.random( -Distance , Distance )
			Pos["Surface"] = GetHeight( Pos["NewX"] , Pos["NewY"] , Pos["NewZ"] )
			if Pos["NewY"] <= Pos["Surface"] then
				Pos["NewY"] = Pos["Surface"]
			end
		elseif Mobile == 4 then	-- 以一個點為起始點，左右亂數移動。
			Pos["Dir"] = math.random( 1 , 360 )
			local Cal = (math.pi/180)*Pos["Dir"]
			Pos["NewX"] = Pos["X"] +( Distance*math.cos(Cal) )
			Pos["NewZ"] = Pos["Z"] - ( Distance*math.sin(Cal) )
			Pos["NewY"] = Pos["Y"]
		end
		if Statue == 0 then
			Hao_WaitMoveTo( ObjID , Pos["NewX"] , Pos["NewY"] , Pos["NewZ"] )
			sleep(1)
			if Loop == 0 then
				break
			elseif Loop == 1 and Mobile < 3 then
				Hao_WaitMoveTo( ObjID , Pos["X"] , Pos["Y"] , Pos["Z"] )
			end
		--	DebugMsg( 0 , 0 , "Running" )
		end
	--	if Zone ~= 2 then
		--	Say( ObjID , "Running" )
		--	DebugMsg( 0 , 0 , "X = "..Pos["NewX"].." , Y = "..Pos["NewY"].." , Z = "..Pos["NewZ"] )
	--	end
		Sleep(1)
	end
end

-- 決定顯示狀態
function Hao_Germany_4th_Obj_Status( Obj , Room , Obstruct , RoleHead , Fight , Mark , ObjShow )
-- 物件、所在Room、阻擋狀態、頭像框、是否可砍殺、標記、是否走路、顯示

	if Obstruct == nil then
		Obstruct = false
	end
	if RoleHead == nil then
		RoleHead = false
	end
	if Fight == nil then
		Fight = false
	end
	if Mark == nil then
		Mark = false
	end
	if ObjShow == nil then
		ObjShow = true
	end

	WriteRoleValue( Obj , EM_RoleValue_IsWalk , 1 )			-- 走路
	SetModeEx( Obj , EM_SetModeType_Obstruct , Obstruct )		-- 阻擋
	SetModeEx( Obj , EM_SetModeType_ShowRoleHead , RoleHead )	-- 頭像框
	SetModeEx( Obj , EM_SetModeType_Fight , Fight )		--可砍殺攻擊
	SetModeEx( Obj , EM_SetModeType_Mark , Mark )		-- 標記
	SetModeEx( Obj , EM_SetModeType_Show , ObjShow )		-- 顯示
	SetModeEx( Obj , EM_SetModeType_Strikback , false )		-- 反擊
	SetModeEx( Obj , EM_SetModeType_SearchenemyIgnore , false )	-- 被搜尋
	SetModeEx( Obj , EM_SetModeType_Searchenemy , false )	-- 索敵
	SetModeEx( Obj , EM_SetModeType_NotShowHPMP , true )	-- 不顯示血條
	SetModeEx( Obj , EM_SetModeType_HideName , true )		-- 不顯示名稱
	SetModeEx( Obj , EM_SetModeType_Gravity , false )		-- 重力
	MoveToFlagEnabled( Obj , false )				-- 關閉巡邏劇情
	AddToPartition( Obj , Room )
end

function Hao_Check_Cancel_Buff_Distance( Npc , Range , Buff , Msg , Range2 , Msg2 )	-- 超過距離即刪除 Buff
	-- 中心點的npc、檢查範圍半徑、刪除Buff、提示訊息字串、檢查範圍半徑2、提示訊息字串2。
	local Player = OwnerID()
	if Npc == nil or Range == nil or Buff == nil then
		return
	end
	
	while true do
		local Distance = GetDistance( Player , Npc )
		if Range2 ~= nil then
			if CheckBuff( Player , Buff ) == true then		
				if Distance >= Range2 then
					if Msg2 ~= nil then
						if Type(Msg2) == "string" then
							ScriptMessage( Player , Player , 2 , Msg2 , C_SYSTEM )	-- 提示玩家Msg2
							ScriptMessage( Player , Player , 0 , Msg2 , C_SYSTEM )
						end
					end
				end
			end
		end
		Sleep(5)
		if Distance >= Range then
			if CheckBuff( Player , Buff ) == true then
				CancelBuff_NoEvent( Player , Buff )
				if Msg ~= nil then
					if Type(Msg) == "string" then
						ScriptMessage( Player , Player , 1 , Msg , C_SYSTEM )	-- 提示玩家Msg1(Buff已消失)
						ScriptMessage( Player , Player , 0 , Msg , C_SYSTEM )
					end
				end
			end
			break
		end
		Sleep(5)
	end
end

function Hao_DE_4th_Npc_121802_ClearNpc()	-- 刪除所有活動相關 Npc

	local Npc = {}
	Npc[1] = 121798	-- 紅色星空球
	Npc[2] = 121799	-- 綠色星空球
	Npc[3] = 121800	-- 黃色星空球
	Npc[4] = 121801	-- 藍色星空球	
	Npc[5] = 121443	-- 活動石板	
	Npc[6] = 121807	-- 活動地磚
	Npc[7] = 121911	-- 德國4周年慶星空爭霸隱型物件
	Npc[8] = 121865	-- 葉球
	Npc[9] = 107622	-- 烏鴉
	Npc[10] = 121937	-- 紅色星空球(Client顯像使用)
	Npc[11] = 121938	-- 法力灌注器

	for i = 1 , #Npc , 1 do
		Lua_Hao_NPCofAll_Clear(Npc[i])
		sleep(1)
	end
end

function Hao_DE_4th_Npc_121802_Quest_Reset()	-- 重置活動相關任務

	local Player = OwnerID()
	local Key = { 547508 , 547509 }	-- 任務進行中、任務已完成
	
	for i = 1 , #Key , 1 do
		SetFlag( Player , Key[i] , 0 )
	end
end

function Hao_DE_4th_Npc_121802_Set_Score(Score)	-- 設置分數

	local Player = OwnerID()
	local Buff = 624003		-- 星塵碎片(代表分數)
	
	if Score == 0 then
		CancelBuff_NoEvent( Player , Buff )
	else
		AddBuff( Player , Buff , Score-1 , -1 )
	end
end

function Hao_DE_4th_Npc_121802_Set_Ticket(Sec)	-- 設置活動門票秒數

	local Player = OwnerID()
	local Buff = 624006
	AddBuff( Player , Buff , 0 , Sec )
end
------------------------------------------------以下均為此次未使用，且編輯好的的函式------------------------------------------------
-- 以下為石板移動劇情 -- 
function Hao_Germany_4th_Slate_Cast_Check(Choise)	-- 水平面施法時檢查	０為垂直面、1為水平面

	local Player = OwnerID()
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local Npc = DE_4th_121802_StarBall[Room][0]	-- 讀取Npc
	local Offside = GetDistance( Player , Npc )	-- Npc與石板的距離
	local Distance = 20	-- 石板於玩家前方多少距離建立
	local Height = 5	-- 石板於玩家前方多少高度建立
	local X , Y , Z , Dir = Lua_Hao_Return_Coordinate(Player)	-- 取玩家當前的座標
	local Cal = (math.pi/180)*(Dir)
	local Pos = {}	-- 石板建立的位置
		Pos["X"] = X +( Distance*math.cos(Cal) )	-- 建立石板的 X
		Pos["Z"] = Z - ( Distance*math.sin(Cal) )	-- 建立石板的 Z
		Pos["Y"] = Y + Height			-- 建立石板的 Y
		Pos["Surface"] = Y - GetHeight( X , Y , Z )	-- 玩家距離地表的距離

	if Choise == 0 and Pos["Surface"] >= 175 then	-- 距離地表175以下才可以使用
		DebugMsg( Player , Room , "Surface = "..Pos["Surface"].." You can't use this skill that surface >= 175" )
		return false
	elseif Choise == 1 and Pos["Surface"] < 20 then	-- 距離地表20以上才可以使用
		DebugMsg( Player , Room , "Surface = "..Pos["Surface"].." You can't use this skill that surface < 20" )
		return false
	elseif Offside >= 200 then
		DebugMsg( Player , Room , "Offside = "..Offside.." You're out of range!" )
		return false		
	end
	return true
end

function Hao_Germany_4th_Slate(Choise)	-- 德國四週年慶活動 Choise = 0 時，往上移動，

	local Player = OwnerID()
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local Slate = 121443	-- 石板物件
	local Distance = 20	-- 石板於玩家前方多少距離建立
	local Height = 5	-- 石板於玩家前方多少高度建立
	local X , Y , Z , Dir = Lua_Hao_Return_Coordinate(Player)	-- 取玩家當前的座標
	local Cal = (math.pi/180)*(Dir)
	local Pos = {}	-- 石板建立的位置
		Pos["X"] = X +( Distance*math.cos(Cal) )	-- 建立石板的 X
		Pos["Z"] = Z - ( Distance*math.sin(Cal) )	-- 建立石板的 Z
		Pos["Y"] = Y + Height			-- 建立石板的 Y
		Pos["Surface"] = Y - GetHeight( X , Y , Z )	-- 玩家距離地表的距離

	local ObjID = CreateObj( Slate , Pos["X"] , Pos["Y"] , Pos["Z"] , Dir , 1 )	-- 建立石板
	Hao_Germany_4th_Obj_Status( ObjID , Room , true )
	CallPlot( ObjID , "Hao_Germany_4th_Slate_Direct_1" , ObjID , Player , Room , Choise )
	-- 傳入石板、玩家、層數、選擇石板向上或往當前面向移動
end

function Hao_Germany_4th_Slate_Direct_1( ObjID , Player , Room , Choise )	-- 讓石板執行移動的劇情
	-- 石板、玩家、層數、選擇石板向上或往當前面向移動
	local Pos = {}
	local Removing	-- 石板移動的距離
	local X , Y , Z , Dir = Lua_Hao_Return_Coordinate(ObjID)	-- 取物件當前的座標
	local Cal = (math.pi/180)*(Dir)

	if Choise == 0 then 	-- 讓石板往上移動
		Removing = 35	-- 石板移動的距離
		Pos["X"] = X
		Pos["Y"] = Y + Removing
		Pos["Z"] = Z
		Sleep(30)	-- 於原地停留三秒後才執行位移
		CallPlot( ObjID , "Hao_Germany_4th_Slate_Direct_2" , ObjID , Player , Room )	-- 判斷玩家是否距離石板太遠		
		while true do	-- 石板往上時，移動的點
			Hao_WaitMoveTo( ObjID , Pos["X"] , Pos["Y"] , Pos["Z"] )
			Hao_WaitMoveTo( ObjID , X , Y , Z )
		end
	elseif Choise == 1 then	-- 讓石板往當前面向移動
		Removing = 125	-- 石板移動的距離
		Pos["X"] = X +( Removing*math.cos(Cal) )
		Pos["Y"] = Y
		Pos["Z"] = Z - ( Removing*math.sin(Cal) )
		Sleep(30)	-- 於原地停留三秒後才執行位移
		CallPlot( ObjID , "Hao_Germany_4th_Slate_Direct_2" , ObjID , Player , Room )	-- 判斷玩家是否距離石板太遠
		Hao_WaitMoveTo( ObjID , Pos["X"] , Pos["Y"] , Pos["Z"] )				-- 呼叫物件移動至指定點
	end
end

function Hao_Germany_4th_Slate_Direct_2( ObjID , Player , Room )	-- 石板停留三秒後，執行的劇情

	local Count = 0
	local Npc = DE_4th_121802_StarBall[Room][0]
	
	while true do
		local Distance = GetDistance( ObjID , Player )	-- 玩家與石板的距離
		local Offside = GetDistance( ObjID , Npc )	-- Npc與石板的距離
		local Pos = {}
		Pos["ObjID_Y"] = ReadRoleValueFloat( Player , EM_RoleValue_Y )	-- 取石板當前的座標
		Pos["Player_Y"] = ReadRoleValueFloat( Player , EM_RoleValue_Y )	-- 取玩家當前的座標
		Pos["Y"] = Pos["Player_Y"] - Pos["ObjID_Y"]
	--	DebugMsg( Player , Room , "Offside = "..Offside )
		if Pos["Y"] <= -4 or Pos["Y"] >= 15 or Distance >= 12 or Count >= 100 or Offside >= 175 then	-- 玩家低於石板、高於石板、與石板距離過遠、招喚時間 >= 10 秒後都會刪除石板
			DebugMsg( Player , Room , "Del Obj" )
			DelObj( ObjID )
		elseif Offside >= 150 then
			DebugMsg( Player , Room , "Warning You're out of range!" )		
		end
		Sleep(1)
		Count = Count + 1
	end
end

function Hao_Germany_4th_20130129_2( Slate , Mobile , Distance )	-- 指定平台不斷做前後、左右移動
	-- 平台本身、移動方式、距離
	local Pos = {}
	Pos["X"] , Pos["Y"] , Pos["Z"] , Pos["Dir"] = Lua_Hao_Return_Coordinate(Slate) -- 取Npc當前座標
	local Cal = (math.pi/180)*Pos["Dir"]
	Pos["NewX"] = {}
	Pos["NewZ"] = {}
	if Mobile == 0 then	-- 前後位移
		Pos["NewX"][1] = Pos["X"] +( Distance*math.cos(Cal) )
		Pos["NewX"][2] = Pos["X"] +( -Distance*math.cos(Cal) )
		 Pos["NewZ"][1]= Pos["Z"] - ( Distance*math.sin(Cal) )
		 Pos["NewZ"][2]= Pos["Z"] - ( -Distance*math.sin(Cal) )
	elseif Mobile == 1 then	-- 左右位移
		Pos["NewX"][1] = Pos["X"] -( Distance*math.cos(Cal) )
		Pos["NewX"][2] = Pos["X"] -( -Distance*math.cos(Cal) )
		 Pos["NewZ"][1]= Pos["Z"] + ( Distance*math.sin(Cal) )
		 Pos["NewZ"][2]= Pos["Z"] + ( -Distance*math.sin(Cal) )	
	end
	
	while true do
		Hao_WaitMoveTo( Slate , Pos["NewX"][1] , Pos["Y"] , Pos["NewZ"][1] )
		Sleep(1)
		Hao_WaitMoveTo( Slate , Pos["NewX"][2] , Pos["Y"] , Pos["NewZ"][2] )
	end
end

-- 執行星空球
function Hao_Germany_4th_StarBall_Plot( SkyBall , ObjID , BallID )
	-- 球本體、隱藏物件

	local BallList = {}
	BallList[1] = 121799 	-- 綠球
	BallList[2] = 121800	-- 黃球
	BallList[3] = 121801  	-- 藍球	

	local Select = math.random(4)		-- 前後、上下、單向Loop、圓型環繞移動
	local Distance =math.random( 15 , 75 )	-- 移動的距離
	local Height = math.random( 15 , 50 )	-- 移動的高度(前後、單向Loop、圓形環繞沒有高低差)
	local Dir = math.random( 0 , 359 )	-- 移動方向
	local Pos = {}
		Pos["X"] , Pos["Y"] , Pos["Z"] , Pos["Dir"] = {} , {} , {} , {}
		Pos["X"][0] , Pos["Y"][0] , Pos["Z"][0] , Pos["Dir"][0] = Lua_Hao_Return_Coordinate(SkyBall) -- 取球當前座標
	local Cal = (math.pi/180)*(Dir)

	if Select == 1 then	-- 前後
		Pos["X"][1] = Pos["X"][0] +( Distance*math.cos(Cal) )
		Pos["Z"][1] = Pos["Z"][0] - ( Distance*math.sin(Cal) )
		Pos["Y"][1] = Pos["Y"][0]
	elseif Select == 2 then	-- 上下
		Pos["X"][1] = Pos["X"][0]
		Pos["Z"][1] = Pos["Z"][0]
		Pos["Y"][1] = Pos["Y"][0] + Height
	elseif Select == 4 then	-- 圓型環繞
		for Count = 1 , 18 , 1 do	-- 用多邊型代表圓
			Pos["X"][Count] = Pos["X"][0]-Distance*math.cos(math.pi*2*(Count/18))
			Pos["Y"][Count] = Pos["Y"][0]
			Pos["Z"][Count] = Pos["Z"][0]+Distance*math.sin(math.pi*2*(Count/18))
		end
	end

	while true do
		if Select == 3 then	-- 每次從原點至一隨機點，然後再傳送回原點後再至一隨機點循環
			Dir = math.random( 0 , 359 )	-- 移動方向
			Cal = (math.pi/180)*(Dir)		
			Pos["X"][1] = Pos["X"][0] +( Distance*math.cos(Cal) )
			Pos["Z"][1] = Pos["Z"][0] - ( Distance*math.sin(Cal) )
			Pos["Y"][1] = Pos["Y"][0] + Height
		end
		for i = 1 , #Pos["X"] , 1 do
			Hao_WaitMoveTo( SkyBall , Pos["X"][i] , Pos["Y"][i] , Pos["Z"][i] )
		end
		sleep(1)
		if Select == 3 then
			SetPos( SkyBall , Pos["X"][0] , Pos["Y"][0] , Pos["Z"][0] , Pos["Dir"][0] )
		elseif Select <= 3 then  
			Hao_WaitMoveTo( SkyBall , Pos["X"][0] , Pos["Y"][0] , Pos["Z"][0] )
		end
		sleep(1)
	end
end