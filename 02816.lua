--781256		創造棋子位子參照的旗標
--棋子的Register1	表示棋子X軸
--棋子的Register1	表示棋子Y軸
--棋子的PID		表示棋子參照flag編號 & 在table中的位置
--玩家的Register10	用來紀錄NPC的編號
--NPC的Register8	用來紀錄現在場上有多少子變色了，如果變色的子達25就判定死棋
--NPC的Register9	用來控制多個玩家同時得分時，訊息不要重複出現的開關用
--NPC的Register10	用來紀錄分數


function FireDay2013_test()
	AddBuff(OwnerID(), 623957, 0, -1)
end

function FireDay2013_Chess_ControlCenter()	--中控器物件產生劇情
	local Control = OwnerID()
	local RoomID = ReadRoleValue( Control, EM_RoleValue_RoomID )
	
	if FireDay121738 == nil then
		FireDay121738 = {}
	end

	for x = 0, 4 do
		-- 建台座
		for y = 1, 5 do
			local Pos = (x*5) + y
			local stone = CreateObjByFlag( 121742 , 781256 , Pos , 1 )
			SetModeEx( stone, EM_SetModeType_Gravity, false )--重力
			SetModeEx( stone, EM_SetModeType_ShowRoleHead, false )--頭像框
			SetModeEx( stone, EM_SetModeType_Mark, false )--標記
			SetModeEx( stone, EM_SetModeType_Obstruct, false ) --阻擋
			AddToPartition(stone , RoomID)
			local x_stone = ReadRoleValue(stone, EM_RoleValue_X )
			local y_stone =ReadRoleValue(stone, EM_RoleValue_Y  )
			local z_stone = ReadRoleValue(stone, EM_RoleValue_Z )

		--	local Chess = CreateObjByFlag( 121746 , 781256 , Pos , 1 )
			local Chess = CreateObj( 121746 , x_stone , y_stone+3 , z_stone , 0 , 1)
			WriteRoleValue( Chess, EM_RoleValue_Register1, x )		-- 寫入X座標
			WriteRoleValue( Chess, EM_RoleValue_Register2, y )		-- 寫入Y座標
			WriteRoleValue( Chess, EM_RoleValue_PID, Pos )
			WriteRoleValue( Chess, EM_RoleValue_Register10, Control )
			SetModeEx( Chess, EM_SetModeType_Gravity, false )--重力
			SetModeEx( Chess, EM_SetModeType_ShowRoleHead, false )--頭像框
			SetModeEx( Chess, EM_SetModeType_Obstruct, false ) --阻擋
			AddToPartition(Chess , RoomID)
			table.insert( FireDay121738, Pos, Chess )
			CallPlot(  Chess, "FireDay2013_Chess_CreatSet", 0 )
			-- 把創出來的棋子全部記到全域變數 FireDay121738 裡面
		end
	end
end

function FireDay2013_Chess_CreatSet()	--掛在棋子上的物件產生劇情
	local Chess = OwnerID()

	SetModeEx( Chess , EM_SetModeType_Strikback, false )		--反擊
	SetModeEx( Chess , EM_SetModeType_SearchenemyIgnore, false )	--被搜尋
	SetModeEx( Chess , EM_SetModeType_Obstruct, false )		--阻擋
	SetModeEx( Chess , EM_SetModeType_Mark, true )			--標記
	SetModeEx( Chess , EM_SetModeType_Move, false )			--移動
	SetModeEx( Chess , EM_SetModeType_Searchenemy, false )	--索敵
	SetModeEx( Chess , EM_SetModeType_HideName, true )		--名稱
	SetModeEx( Chess , EM_SetModeType_ShowRoleHead, false )	--頭像框
	SetModeEx( Chess , EM_SetModeType_Fight , false )			--可砍殺攻擊
	SetModeEx( Chess , EM_SetModeType_DisableRotate, false )	--轉向
	SetPlot( Chess, "touch", "FireDay2013_Chess_Touch", 30 )
end

function FireDay2013_Chess_Touch()
	local Player = OwnerID()
	local Chess = TargetID()
	local MainNPC = ReadRoleValue( Chess, EM_RoleValue_Register10 )		-- 從棋子的Register10去讀取NPC是誰
	--/*
	local BuffID = { 623957, 623958, 623956 }	-- 依序為黃、藍、紅
	local ChessColor = 0				-- 決定要置換的棋子的顏色
	local ChessCount = ReadRoleValue( MainNPC, EM_RoleValue_Register8 )		-- 紀錄現在場上有多少子變色了
	--/*
	for b = 1, 4 do					-- 確定玩家身上的是什麼顏色，然後把Buff刪掉
		if b == 4 then				-- 會跑到4表示玩家並沒有活動需求的顏色Buff
			ScriptMessage( Player , Player , 1 , "[SC_2013FIRE_EV1_MSG_09]" , 0  )   -- 你未持有符文棋
			ScriptMessage( Player , Player , 0 , "[SC_2013FIRE_EV1_MSG_09]" , 0  )   -- 你未持有符文棋
			return
		elseif CheckBuff( Player, BuffID[b] ) == true then
			ChessColor = BuffID[b]
			CancelBuff( Player, BuffID[b] )
			break
		end
	end
	--/*
	local ObjID = { [623957] = 121739, [623958] = 121740, [623956] = 121741 }		-- 要變色的旗子物件，依序為黃、藍、紅，陣列的位置是對應BuffID
	local SEID = { [623957] = 850575, [623958] = 850575, [623956] = 850575 }		-- 連線成功消去的特效，依序為黃、藍、紅，陣列的位置是對應BuffID
	local CheckNum = { 	[1] = { 1, 0 };		-- 直					-- 這陣列的功能是用來計算XY座標的位移
				[2] = { 0, 1 };		-- 橫
				[3] = { 1, 1 };		-- 右斜
				[4] = { -1, 1 };	}	-- 左斜
	local cX = ReadRoleValue( Chess, EM_RoleValue_Register1 )		-- 紀錄玩家放置的那一子的X座標
	local cY = ReadRoleValue( Chess, EM_RoleValue_Register2 )		-- 紀錄玩家放置的那一子的Y座標
	local Pos = ReadRoleValue( Chess, EM_RoleValue_PID )
	--/*
	SetPlot( Chess, "touch", "", 0 )						--把觸碰劇情關掉，因為要變色了
	ChangeObjID( Chess, ObjID[ChessColor])					--置換棋子，讓棋子變色
	ChessCount = ChessCount + 1						--已經變色的棋子數量+1
	--/*
	local LineNum = 0
	local ChessNum = 1		-- 基本放下的這一子就算分
	local ChessTable = {}

	for x = 1, 4 do			-- 依序判斷 直/橫/右斜/左斜，共4組
		local TempChess = 0	-- 計算這組有幾子的暫時值
		local TempTable = {}	-- 紀錄這組有哪幾個子的暫時值
		for  y = 1, 2 do			-- 判斷 "+ -" 方向
			local NewNum= { 1, -1 }	-- 1是"漸+" 2是"漸-"
			local NewX = cX
			local NewY = cY
			for z = 1, 4 do	-- 往外判斷最多4格
				NewX = NewX + CheckNum[x][1] * NewNum[y]		-- 計算判斷過去的新位置X座標
				NewY = NewY + CheckNum[x][2] * NewNum[y]		-- 計算判斷過去的新位置Y座標
				if NewX > 4 or NewX < 0 or NewY > 5 or NewY < 1 then	--判斷有無超過邊界
					break
					-- 判斷如果這個方向已經超出邊框，就直接跳掉不再往這個方向檢查過去
				end
				--/*
				local NewPos = (NewX*5) + NewY		-- 計算判斷用新位置的編號
				local NewChess = FireDay121738[NewPos]	-- 新編號的棋子是誰
				local NewObjID = ReadRoleValue( NewChess, EM_RoleValue_OrgID )
				if NewObjID == ObjID[ChessColor] then	-- 比對跟放下去的那子是否同色
					TempChess = TempChess + 1
					table.insert( TempTable, NewChess )
				else
					break					--不同色就跳掉
				end
			end
		end
		-- 計算完一組方向之後，看這組有沒有超過3子，如果有的話表示有連成一條線
		if TempChess >= 2 then				-- 用2是因為加上放下去的那子就算3子了
			LineNum = LineNum + 1			--此次成功連線數+1
			ChessNum = ChessNum + TempChess	--成功連線的子算進去
			for p = 1, table.getn(TempTable) do
			table.insert( ChessTable, TempTable[p] )	--確定連線成功之後，塞進ChessTable的就是等下得分後要消除的子
			end
		end
	end
	-- 最後算出的LineNum數量成功連線數、ChessNum就是這些連線相加總共幾子
	--得分的公式按照Mika給的：(獲得分數)= (連線數*幾子)
	if LineNum >= 1 then
		local OrgScroe = ReadRoleValue( MainNPC, EM_RoleValue_Register10 )		-- NPC身上所記錄現有分數
		local AddScore = LineNum * ChessNum						-- 這次連線成功加的分數
		OrgScroe = OrgScroe + AddScore
		WriteRoleValue( MainNPC, EM_RoleValue_Register10, OrgScroe )
		--/*
	--	Sleep(10)  -- mika - 先hide這段
		table.insert( ChessTable, Chess )
		for i = 1, table.getn( ChessTable ) do							-- 把有算分的子都變回白色
			SysCastSpellLv( ChessTable[i], ChessTable[i], SEID[ChessColor], 0)		-- 連線成功消去的特效，會對應顏色
			SysCastSpellLv( ChessTable[i], Player, 850584, 0)				-- 連線成功，玩家獲得分數特效
			ChangeObjID( ChessTable[i], 121746 )					-- 換色
			SetPlot( ChessTable[i], "touch", "FireDay2013_Chess_Touch", 30 )		-- 變回白色就把觸碰劇情再開
		end
		ChessCount = ChessCount - ChessNum						--已經變色的棋子數量 - 消去的棋子數量
		-- mika增加 告訴玩家當下分數 
		local FireDayChessGotScoreIng = ReadRoleValue( MainNPC, EM_RoleValue_Register9 )
		if FireDayChessGotScoreIng == 0  then
			WriteRoleValue( MainNPC, EM_RoleValue_Register9, 1 )			--  得分ing
			for j = 1, #FireDayChessPlayers do
				ScriptMessage( FireDayChessPlayers[j] , FireDayChessPlayers[j] , 1 , "[SC_2013FIRE_EV1_MSG_07][$SETVAR1="..OrgScroe.."]" , C_SYSTEM  )   -- 連線成功！目前的分數為[$VAR1]分
				ScriptMessage( FireDayChessPlayers[j] , FireDayChessPlayers[j] , 0 , "[SC_2013FIRE_EV1_MSG_07][$SETVAR1="..OrgScroe.."]" , C_SYSTEM  )   -- 連線成功！目前的分數為[$VAR1]分
			end
			WriteRoleValue( MainNPC, EM_RoleValue_Register9, 0 )			--  得分結束
		end
	end
	--/*
	AddBuff( Player, BuffID[DW_Rand(3)], 0, -1 )					-- 隨機給予玩家顏色Buff
	WriteRoleValue( MainNPC, EM_RoleValue_Register8, ChessCount )	-- 把場上變色子的數量寫回去NPC身上，方便判斷是否已經死棋
end

function FireDay2013_Chess_Reboot()	-- 遊戲結束時重置場上所有旗子
	for i = 1, table.getn(FireDay121738) do
		local ObjID =  ReadRoleValue( FireDay121738[i], EM_RoleValue_OrgID )
		if ObjID ~= 121746 then
			ChangeObjID( FireDay121738[i], 121746 )
			SetPlot( FireDay121738[i], "touch", "FireDay2013_Chess_Touch", 30 )		-- 變回白色就把觸碰劇情再開
		end
	end
end