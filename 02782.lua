function Hao_Test_Table_Mounts(Num)

	local Player = OwnerID()
	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID )
	if Num < 10 then
		CallPlot( Player , "Hao_Test_Table_Mounts_Begin" , Player , RoomID , Num )
	else
		DebugMsg( Player , RoomID , "Input error" )
	end
end

function Hao_Test_Table_Mounts_Begin( Player , RoomID , Num )

	local Topic = "Please choose the mounts."
	local Hint = "Idle for more than 30s, window will close automatically."	-- 閒置超過30秒,自動關閉視窗。
	local Choise = ReadRoleValue( Player , EM_RoleValue_PID )
	local Random , Time = {} , 0
	local DialogStatus
	local Mounts = {	505075 ,	--01.騎乘紫冠鶴鴕
				505111 ,	--02.騎乘猛禽鶴鴕
				505113 ,	--03.騎乘莫爾戰馬
				505127 ,	--04.騎乘毀滅戰馬
				505472 ,	--05.騎乘煉獄夢魘
				505473 ,	--06.騎乘幽冥夢魘
				505474 ,	--07.騎乘蒼火夢魘
				505475 ,	--08.騎乘金燄夢魘
				505476 ,	--09.騎乘深淵夢魘
				505477 ,	--10.騎乘魔血夢魘
				505478 ,	--11.騎乘曙光雪貂
				505479 ,	--12.騎乘鋼焰戰馬
				505480 ,	--13.騎乘龍魂戰駒
				505481 ,	--14.騎乘銀河天馬
				506001 ,	--15.騎乘白色駿馬
				506002 ,	--16.騎乘黑色駿馬
				506109 ,	--17.騎乘棕色駿馬
				506137 ,	--18.騎乘遠征毛驢
				506174 ,	--19.騎乘暴風鷹馬獸
				506175	--20.騎乘鷹眼葛列佛
						}
	DialogClose( Player )
	DialogCreate( Player , EM_LuaDialogType_Select , Topic )

	if Choise ~= 0 then	-- 當 PID 不等於 0 時，代表已施法騎乘過坐騎 PID
		for i = 1 , #Mounts , 1 do
			if Choise == Mounts[i] then
				table.remove( Mounts , i )
			--	DebugMsg( Player , RoomID , "Remove = "..i )
			end
		end
	end
	
	for i = 0 , Num-1 , 1 do
		Random[i] = table.remove( Mounts , math.random(#Mounts) )
		DialogSelectStr( Player , string.format("%02d", i+1 )..".".."["..Random[i].."]" )
	end
	DialogSelectStr( Player , "[SO_EXIT]")	-- 離開
	
	if( DialogSendOpen( Player ) == false ) then
		ScriptMessage( Player , Player , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 )	--資料送出有問題
		return 0
	end
	
	while true do
		Sleep(1)
		Time = Time + 1
		DialogStatus = DialogGetResult( Player )
	--	DebugMsg( Player , RoomID , "Time = "..Time.." DialogStatus = "..DialogStatus )
		if Time > 300 then -- 防無窮迴圈
			DebugMsg( Player , RoomID , Hint )	-- 閒置超過30秒,自動關閉視窗。
			break
		end
		if DialogStatus == -1 or DialogStatus == Num then	-- 中斷、離開
			break
		elseif DialogStatus ~= -2 then	-- 初始化
			AddBuff( Player , Random[DialogStatus] , 0 , -1 )
			WriteRoleValue( Player , EM_RoleValue_PID , Random[DialogStatus] )
			break
		end
	end
	DialogClose( Player )
end

--lua進階題目1：在玩家前方每50距離建立1個箱子共10個箱子，在箱子上面坐10個不一樣的npc，每次執行上面的npc隨機分配
--lua進階題目2：在玩家的位子建立一個npc，沿著箱子的間隔處，蛇形往前走到最後一個箱子，在走回來。撰寫人：FN、阿元、小宏、阿浩、阿準
--lua進階題目3：題目2的npc必須以弧形前進。撰寫人：小宏、阿浩

function Hao_Test_Build_Box_Array_1()	-- 題目1

	local Player = OwnerID()
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local X , Y , Z , Dir = Lua_Hao_Return_Coordinate(Player)	-- 取座標
	local BoxNum = 106747		-- 箱子編號
	local Distance = 50			-- 每個箱子的間距
	local Box , Npc = {} , {}			-- 箱子、Npc
	local NpcList = {
				114798 ,	-- Npc 編號
				114799 ,
				114802 ,
				114801 ,
				114803 ,
				114805 ,
				114811 ,
				116707 ,
				116708 ,
				116703	
						}

	for Count = 1 , #NpcList , 1 do
		Box[Count] = Lua_CreateObjByDir( Player , BoxNum , Count*Distance , 0 ) --參考物件，產生的物件id，距離 ，面向：0 的話是面向參考物件，180 的話是背向參考物件
		Hao_Test_Build_Box_Array_Status( Box[Count] )	-- 設定狀態
		Npc[Count] = CreateObj_ByObjPoint( Box[Count] , table.remove( NpcList , math.random(#NpcList) ) ,"p_Hit_point01" ) 	-- 創立 Npc
		Hao_Test_Build_Box_Array_Status( Npc[Count] )	-- 設定狀態
		SetDefIdleMotion( Npc[Count] , ruFUSION_MIME_SIT_CHAIR_LOOP )
		AddToPartition( Box[Count] , Room )
		AddToPartition( Npc[Count] , Room )
	end
end

function Hao_Test_Build_Box_Array_2(Choise)	-- 題目2與3
	--題目2 /gm ? pcall Hao_Test_Build_Box_Array_2(1
	--題目3 /gm ? pcall Hao_Test_Build_Box_Array_2(2
	
	local Player = OwnerID()
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local X , Y , Z , Dir = Lua_Hao_Return_Coordinate(Player)	-- 取座標
	local Walker = 114798					-- 移動的Npc

	Walker = CreateObj( Walker , X , Y , Z , Dir , 1 )
	Hao_Test_Build_Box_Array_Status(Walker)
	AddToPartition( Walker , Room )
	CallPlot( Walker , "Hao_Test_Build_Box_Array_2_"..Choise , X , Y , Z , Dir , Walker , Player , Room )
end

function Hao_Test_Build_Box_Array_2_1( X , Y , Z , Dir , Walker , Player , Room )
	
	local BoxNum = 106747		-- 箱子編號
	local Distance = 50			-- 每個箱子的間距
	local Box , Npc  = {} , {}			-- 箱子、箱子上的Npc
	local Pos = {}				-- 移動點：X、Y、Z
	local NpcList = {	
				114798 ,	-- Npc 編號
				114799 ,
				114802 ,
				114801 ,
				114803 ,
				114805 ,
				114811 ,
				116707 ,
				116708 ,
				116703	
						}
	local Point = #NpcList
	Pos[0] = {}
	Pos[0]["X"] , Pos[0]["Y"] , Pos[0]["Z"]  = X , Y , Z
	WriteRoleValue( Walker , EM_RoleValue_IsWalk , 0 )	-- 行走以跑步方式

	for Count = 1 , #NpcList , 1 do
		Box[Count] = Lua_CreateObjByDir( Walker , BoxNum , Count*Distance , 180 )	--參考物件，產生的物件id，距離 ，面向 ： 0 的話是面向參考物件，180 的話是背向參考物件
		Npc[Count] = CreateObj_ByObjPoint( Box[Count] , table.remove( NpcList , math.random(#NpcList) ) ,"p_Hit_point01" )
		SetDefIdleMotion( Npc[Count] , ruFUSION_MIME_SIT_CHAIR_LOOP )
		Hao_Test_Build_Box_Array_Status( Box[Count] )
		Hao_Test_Build_Box_Array_Status( Npc[Count] )		
		AddToPartition( Box[Count] , Room )
		AddToPartition( Npc[Count] , Room )
		Pos[Count] = {}
		Pos[Count]["X"] , Pos[Count]["Y"] , Pos[Count]["Z"] = Hao_Test_Build_Box_Array_Tools( Box[Count] , Distance , Count%2 )	-- 餘數為1時往左移動、為0時往右移動
		if Count == Point then
			Pos[Count+1] = {}
		 	Pos[Count+1]["X"] , Pos[Count+1]["Y"] , Pos[Count+1]["Z"] = Hao_Test_Build_Box_Array_Tools(Box[Count] , Distance )
		end
	end
	while true do
		for Step = 1 , #Pos , 1 do
			DW_WaitMoveTo( Walker , Pos[Step]["X"] , Pos[Step]["Y"] , Pos[Step]["Z"] )
		end
		for Step = #Pos , 0 , -1 do
			DW_WaitMoveTo( Walker , Pos[Step]["X"] , Pos[Step]["Y"] , Pos[Step]["Z"] )
		end
	end
end

function Hao_Test_Build_Box_Array_2_2( X , Y , Z , Dir , Walker , Player , Room )
	
	local BoxNum = 106747	-- 箱子編號
	local Distance = 50		-- 每個箱子的間距
	local Polygon = 5		-- 圓的解析度、以6個點切分5條線
	local Box , Npc  = {} , {}		-- 箱子、箱子上的Npc
	local Pos = {}			-- Walker 移動順序
	local Steps = 0			-- Walker  步數
	local NpcList = {		-- Npc 編號
				114798 ,
				114799 ,
				114802 ,
				114801 ,
				114803 ,
				114805 ,
				114811 ,
				116707 ,
				116708 ,
				116703	
						}

	WriteRoleValue( Walker , EM_RoleValue_IsWalk , 0 )	-- 行走以跑步方式
	Pos[Steps] = {}
	Pos[Steps]["X"] , Pos[Steps]["Y"] , Pos[Steps]["Z"] = X , Y , Z

	for Count = 1 , #NpcList , 1 do
		Box[Count] = Lua_CreateObjByDir( Walker , BoxNum , Count*Distance , 180 )	--參考物件，產生的物件id，距離 ，面向 ： 0 的話是面向參考物件，180 的話是背向參考物件
		Npc[Count] = CreateObj_ByObjPoint( Box[Count] , table.remove( NpcList , math.random(#NpcList) ) ,"p_Hit_point01" )
		SetDefIdleMotion( Npc[Count] , ruFUSION_MIME_SIT_CHAIR_LOOP )
		Hao_Test_Build_Box_Array_Status( Box[Count] )
		Hao_Test_Build_Box_Array_Status( Npc[Count] )
		AddToPartition( Box[Count] , Room )
		AddToPartition( Npc[Count] , Room )
		if Count%2 == 1 then	-- 1 , 3 , 5 , 7 , 9 等...奇數
			for Step = (Count-1)*10 , (Count*10)-5 , 1 do
				X , Y , Z  = Hao_Test_Build_Box_Array_Circle( Box[Count] , Distance/2 , Step%10 , Polygon )	-- 物件、距離、半圓切成幾等份(分子)、半圓切成幾等份(分母)
				Steps = Steps+1
				Pos[Steps] = {}				
				Pos[Steps]["X"] , Pos[Steps]["Y"] , Pos[Steps]["Z"] = X , Y , Z
			end			
		else	-- 2 , 4 , 6 , 8 , 10 等...偶數
			for Step = Count*10 , (Count-1)*10+5 , -1 do
				X , Y , Z  = Hao_Test_Build_Box_Array_Circle( Box[Count] , Distance/2 , Step%10 , Polygon )	-- 物件、距離、半圓切成幾等份(分子)、半圓切成幾等份(分母)
				Steps = Steps+1
				Pos[Steps] = {}
				Pos[Steps]["X"] , Pos[Steps]["Y"] , Pos[Steps]["Z"] = X , Y , Z
			end
		end		
	end

	while true do
		for Step = 1 , #Pos , 1 do
			DW_WaitMoveTo( Walker , Pos[Step]["X"] , Pos[Step]["Y"] , Pos[Step]["Z"] )
		end
		for Step = #Pos , 0 , -1 do
			DW_WaitMoveTo( Walker , Pos[Step]["X"] , Pos[Step]["Y"] , Pos[Step]["Z"] )
		end
	end
end

function Hao_Test_Build_Box_Array_Status(ObjID)	-- 管理物件狀態

	SetModeEx( ObjID , EM_SetModeType_Obstruct , false )	-- 阻擋
	SetModeEx( ObjID , EM_SetModeType_Searchenemy , false )	-- 索敵
	SetModeEx( ObjID , EM_SetModeType_NotShowHPMP, true )	-- 不顯示血條
	SetModeEx( ObjID , EM_SetModeType_HideName , true )	-- 不顯示名稱
	SetModeEx( ObjID , EM_SetModeType_Mark , false )		-- 標記
	SetModeEx( ObjID , EM_SetModeType_ShowRoleHead , false )	-- 頭像框
	MoveToFlagEnabled( ObjID , false )				-- 關閉巡邏劇情
end

function Hao_Test_Build_Box_Array_Tools(ObjID , Distance , Direction)	-- 題目2工具：物件、距離、選擇左右
	
	local X , Y , Z , Dir = Lua_Hao_Return_Coordinate(ObjID)	-- 取座標
	local Pos = {}
	
	if Direction == 0 then
		Dir = Dir + 90
		if Dir >= 360 then
			Dir = Dir - 360
		end
	elseif Direction == 1 then
		Dir = Dir - 90
		if Dir < 0 then
			Dir = Dir + 360
		end
	else
		Dir = Dir
	end

	local Cal = (math.pi/180)*(Dir)	-- Math.pi =(圓的周長/直徑) , 徑度轉角度
	Pos["X"] = X +( Distance*math.cos(Cal) )
	Pos["Z"] = Z - ( Distance*math.sin(Cal ))
	Pos["Y"] = GetHeight( Pos["X"] , Y , Pos["Z"] )
	return Pos["X"] , Pos["Y"] , Pos["Z"]
end

function Hao_Test_Build_Box_Array_Circle(ObjID , Distance , Step , Polygon )	-- 題目3工具：物件、距離、半圓切成幾等份(分子)、半圓切成幾等份(分母)

	local X , Y , Z , Dir = Lua_Hao_Return_Coordinate( ObjID )	-- 取座標
	local Pos = {}
	local Cal = (math.pi/180)*(Dir)	-- Math.pi =(圓的周長/直徑) , 徑度轉角度
	Pos["X"] = X-( Distance*math.cos(math.pi*(Step/Polygon)+Cal) )
	Pos["Z"] = Z+( Distance*math.sin(math.pi*(Step/Polygon)+Cal) )
	Pos["Y"] = GetHeight( Pos["X"] , Y , Pos["Z"] )
	return Pos["X"] , Pos["Y"] , Pos["Z"]
end

function Hao_Test_Build_Box_Array_Clear()	-- 清除題目1 ~ 3所有 Npc

	local ObjList = {	106747 , 
				114798 ,	-- Npc 編號
				114799 ,
				114802 ,
				114801 ,
				114803 ,
				114805 ,
				114811 ,
				116707 ,
				116708 ,
				116703	
						}	
	
	for Num = 1 , #ObjList , 1 do
		Lua_Hao_NPCofAll_Clear(ObjList[Num])
	end
end