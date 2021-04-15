--==================================================--
-- 上線前需要調整的部份
-- 1.任務422431斷橋守衛戰的接受Script(LuaS_422431_War)要拿掉
-- 2.調整瑞吉．布聶芬司的位置，旗標780392
-- 3.重置的時間要調整
--==================================================--

--==================================================--
--  測試函式區                                      --
--==================================================--
function LuaPE_ZONE8_01BBD_DeleteAll( DeleteMode )
	local Obj = LuaPE_ZONE8_01BBD_Obj
	local StartNum = 1

	if DeleteMode ~= nil and DeleteMode == 1 then
		StartNum = 2
	end

	for i = StartNum, table.getn(Obj) do
		if CheckID(Obj[i]) == true then
			DelObj( Obj[i] )
		end
	end

	if DeleteMode == nil then
		LuaPE_ZONE8_01BBD_QuestNPC_Show()
	end

end
function LuaPE_ZONE8_01BBD_KillSnake()
	local Var = LuaPE_ZONE8_01BBD_Var
	local SnakeKillNum = Var[5]	-- 目前殺死蛇人數目

	SnakeKillNum = SnakeKillNum + 100
	LuaPE_ZONE8_01BBD_Var[5] = SnakeKillNum
end
function LuaPE_ZONE8_01BBD_KillGuard()
	local Var = LuaPE_ZONE8_01BBD_Var
	local GuardKillNum = Var[4]	-- 目前被殺隊員數目

	GuardKillNum = GuardKillNum + 25
	LuaPE_ZONE8_01BBD_Var[4] = GuardKillNum
end
--==================================================--



--==================================================--
--  全域變數區                                      --
--==================================================--
function LuaPE_ZONE8_01BBD_GlobalSet()
	LuaPE_ZONE8_01BBD_Obj = {}		-- 使用物件管理陣列
	LuaPE_ZONE8_01BBD_Var = {}		-- 使用參數管理陣列
	LuaPE_ZONE8_01BBD_Phase = 0		-- 進行到第？階段

	LuaPE_ZONE8_01BBD_Var[1] = 0	-- 領導物件GID(旗幟)

	LuaPE_ZONE8_01BBD_Var[2] = 8	-- 一次隊員產生數量
	LuaPE_ZONE8_01BBD_Var[3] = 5	-- 一次蛇人產生數量
	LuaPE_ZONE8_01BBD_Var[4] = 0	-- 目前被殺隊員數目
	LuaPE_ZONE8_01BBD_Var[5] = 0	-- 目前殺死蛇人數目
	LuaPE_ZONE8_01BBD_Var[6] = 25	-- 事件失敗需要被殺隊員數目
	LuaPE_ZONE8_01BBD_Var[7] = 50	-- 事件獲勝需要殺死蛇人數目

	LuaPE_ZONE8_01BBD_Var[8] = 0	-- 瑞吉．布聶芬司(劇情用)
	LuaPE_ZONE8_01BBD_Var[9] = 0	-- 特殊人物出現旗標	1 瑞吉．布聶芬司登場, 2 補血隊員登場
	LuaPE_ZONE8_01BBD_Var[10] = 0	-- 戰鬥瑞吉．布聶芬司被幹掉
	LuaPE_ZONE8_01BBD_Var[11] = 7200	-- 公眾任務重置時間(秒)2小時
	LuaPE_ZONE8_01BBD_Var[12] = 0	-- 瑞吉．布聶芬司(失敗劇情專用)
end
--==================================================--



--==================================================--
--  訊息處理區                                      --
--==================================================--
--傳送訊息
function LuaPE_ZONE8_01BBD_Message( Index , Color )
	local AreaPlayer = LuaPE_ZONE8_01BBD_GetAreaPlayer()
	local Message = ""
	local Var = LuaPE_ZONE8_01BBD_Var
	local SnakeKillNum = Var[5]		-- 目前殺死蛇人數目
	local SnakeKill_WinNum = Var[7]		-- 事件獲勝需要殺死蛇人數目
	local GuardKillNum = Var[4]		-- 目前被殺隊員數目
	local GuardKill_LostNum = Var[6]	-- 事件失敗需要被殺隊員數目

	    if Index == 1 then
		Message = "[SC_PE_ZONE8_01][$SETVAR1=[SC_PE_ZONE8_01BBD_M01]]"	-- 事件 [$VAR1] 開始進行！！ $VAR1=中央石橋攻防戰
	elseif Index == 2 then
		Message = "[SC_PE_ZONE8_02][$SETVAR1=[SC_PE_ZONE8_01BBD_M02]][$SETVAR2="..SnakeKillNum.."][$SETVAR3="..SnakeKill_WinNum.."]"	-- 事件獲勝條件: [$VAR1] $VAR1=殲滅蛇人突擊隊( [$VAR2] / [$VAR3] )
	elseif Index == 3 then
		Message = "[SC_PE_ZONE8_03][$SETVAR1=[SC_PE_ZONE8_01BBD_M03]][$SETVAR2="..GuardKillNum.."][$SETVAR3="..GuardKill_LostNum.."]"	-- 狀態改變條件: [$VAR1] $VAR1=突擊隊員死亡( [$VAR2] / [$VAR3] )
	elseif Index == 4 then
		Message = "[SC_PE_ZONE8_04][$SETVAR1=[SC_PE_ZONE8_01BBD_M04]]"	-- 事件狀態改變: [$VAR1] $VAR1=蛇人營地發出一陣笛聲，蛇人開始撤退！！
	elseif Index == 5 then
		Message = "[SC_PE_ZONE8_04][$SETVAR1=[SC_PE_ZONE8_01BBD_M05]]"	-- 事件狀態改變: [$VAR1] $VAR1=蛇人奪回了中央石橋的控制權！！
	elseif Index == 6 then
		Message = "[SC_PE_ZONE8_01BBD_M06]"	-- 妖蛇突擊兵開始往中央石橋展開了攻擊！
	elseif Index == 7 then
		Message = "[SC_PE_ZONE8_01BBD_M07]"	-- 一批妖蛇突擊兵開始前往中央石橋增援！
	elseif Index == 8 then
		Message = "[SC_PE_ZONE8_01BBD_M08]"	-- 一批妖蛇突擊兵與蛇人突擊兵開始前往中央石橋增援！
	elseif Index == 9 then
		Message = "[SC_PE_ZONE8_04][$SETVAR1=[SC_PE_ZONE8_01BBD_M09]]"	-- 事件狀態改變: [$VAR1] $VAR1=突擊隊員趁機返回中央石橋進行防守！！
	elseif Index == 10 then
		Message = "[SC_PE_ZONE8_01BBD_M10]"	-- 蛇人營長率領著蛇人突擊兵前往中央石橋展開攻擊！
	elseif Index == 11 then
		Message = "[SC_PE_ZONE8_05][$SETVAR1=[SC_PE_ZONE8_01BBD_M01]]"	-- 事件 [$VAR1] 至此結束！！ $VAR1=中央石橋攻防戰
	end

	for i = 1 , table.getn(AreaPlayer) do
		ScriptMessage( OwnerID(), AreaPlayer[i] , 1 , Message , Color )
		ScriptMessage( OwnerID(), AreaPlayer[i] , 0 , Message , Color )
	end
end

--表演對話
function LuaPE_ZONE8_01BBD_Say( Player , Index )
	local ObjSay = ""

	    if Index == 1 then
		ObjSay = "[SC_PE_ZONE8_01BBD_S01]"	-- 我們成功擋住這波攻擊，全員返回整備！
	elseif Index == 2 then
		ObjSay = "[SC_PE_ZONE8_01BBD_S02]"	-- 可惡，先撤退再想辦法！
	elseif Index == 3 then
		ObjSay = "[SC_PE_ZONE8_01BBD_S03]"	-- 我不行了，你們得要支持下去啊…
	elseif Index == 4 then
		ObjSay = "[SC_PE_ZONE8_01BBD_S04]"	-- 是！
	elseif Index == 5 then
		ObjSay = "[SC_PE_ZONE8_01BBD_S05]"	-- 擋下他們！
	elseif Index == 6 then
		ObjSay = "[SC_PE_ZONE8_01BBD_S06]"	-- 別讓蛇人靠近這裡一步！
	elseif Index == 7 then
		ObjSay = "[SC_PE_ZONE8_01BBD_S07]"	-- 正義萬歲！
	elseif Index == 8 then
		ObjSay = "[SC_PE_ZONE8_01BBD_S08]"	-- 消滅蛇人！
	elseif Index == 9 then
		ObjSay = "[SC_PE_ZONE8_01BBD_S09]"	-- 看我們突擊隊的英勇！
	elseif Index == 10 then
		ObjSay = "[SC_PE_ZONE8_01BBD_S10]"	-- 絕對不能辜負隊長的期待！(副隊長專用)
	elseif Index == 11 then
		ObjSay = "[SC_PE_ZONE8_01BBD_S11]"	-- 補血！救援！
	elseif Index == 12 then
		ObjSay = "[SC_PE_ZONE8_01BBD_S12]"	-- 謝謝你們，我們快趁著這個機會！
	elseif Index == 13 then
		ObjSay = "[SC_PE_ZONE8_01BBD_S13]"	-- 冒險者，你找我嗎？快過來…
	end

	Say( Player , ObjSay )
end
--==================================================--



--==================================================--
--  共用函式區                                      --
--==================================================--
--物件產生
function LuaPE_ZONE8_01BBD_FlagCreateBatch( ObjID , FlagID , ObjBronFlag , ObjNum , RoomID , ObjTalk , ect )
	local Obj = {}

	for i = 1 , ObjNum do
		Obj[i] = CreateObjByFlag( ObjID[i] , FlagID , ObjBronFlag[i] , 1 )
		table.insert( LuaPE_ZONE8_01BBD_Obj , Obj[i] )
		WriteRoleValue( Obj[i] , EM_RoleValue_IsWalk , 0 )	-- 用跑的移動	-- 要有Partition經過才會正常
		AddToPartition( Obj[i] , RoomID )
		SetIdleMotion( Obj[i] , ruFUSION_ACTORSTATE_COMBAT_1H )
		MoveToFlagEnabled( Obj[i] , false )	-- 關閉巡邏劇情
		if Rand( 10 ) > 5 and ObjTalk[i] ~= nil then
			LuaPE_ZONE8_01BBD_Say( Obj[i] , ObjTalk[i] )
		end
		SetPlot( Obj[i] , "DEAD" , "LuaPE_ZONE8_01BBD"..ect.."Dead" , 0 )
		BeginPlot( Obj[i] , "LuaPE_ZONE8_01BBD"..ect.."DO" , 0 )
		Sleep( 5 )
	end

	return obj
end

--死亡處理
function LuaPE_ZONE8_01BBD_DeadBatch( ObjID , Obj2ID )
	local Count = 0

	local SearchObj = SearchRangeNPC( OwnerID() , 500 )
	if SearchObj[0] == -1 then	-- 找不到人
	else
		for i = 0, table.getn(SearchObj)-1 do	-- 最後一個-1不要，所以要-1
			if SearchObj[i] == OwnerID() then	-- 自己不算
			else
				if ReadRoleValue( SearchObj[i] , EM_RoleValue_OrgID ) == ObjID or ReadRoleValue( SearchObj[i] , EM_RoleValue_OrgID ) == Obj2ID then	-- 找到同種
					if ReadRoleValue( SearchObj[i] , EM_RoleValue_IsDead ) == 1 then	-- 死掉不算
					else
						Count = Count + 1	-- 找到多少人
					end
				else
				end
			end
		end
	end

	return Count;
end

--物件移動
function LuaPE_ZONE8_01BBD_ObjGO( FlagObjID , FlagGoID , Range )
	local Player = OwnerID()

	Sleep( 10 )
	local X = GetMoveFlagValue( FlagObjID , FlagGoID , EM_RoleValue_X )
	local Y = GetMoveFlagValue( FlagObjID , FlagGoID , EM_RoleValue_Y )
	local Z = GetMoveFlagValue( FlagObjID , FlagGoID , EM_RoleValue_Z )

	X = X + Rand( Range ) * 2 - Range + 1
	Z = Z + Rand( Range ) * 2 - Range + 1

	local Obj = Role:new( Player )
	Obj:Move( X , Y , Z )
	while true do
		local NowX = Obj:X()
		local NowZ = Obj:Z()
		
		if Abs( NowX - X ) < Range and Abs( NowZ - Z ) < Range or Obj:IsAttack() == true then
			break;
		end
		Sleep( 2 )
	end

	return true
end

--領頭旗子物件設定
function LuaPE_ZONE8_01BBD_LeaderSet( LeaderID , FlagID , LeaderBronFlag , RoomID )
	local Leader = CreateObjByFlag( LeaderID , FlagID , LeaderBronFlag , 1 )
	SetModeEx( Leader , EM_SetModeType_SearchenemyIgnore , false )	-- 被搜尋
	SetModeEx( Leader , EM_SetModeType_Obstruct , true )		-- 阻擋
	SetModeEx( Leader , EM_SetModeType_Gravity , false )		-- 重力
	SetModeEx( Leader , EM_SetModeType_Mark , false )		-- 標記
	SetModeEx( Leader , EM_SetModeType_Move , false )		-- 移動
	SetModeEx( Leader , EM_SetModeType_Searchenemy , false )	-- 索敵
	SetModeEx( Leader , EM_SetModeType_HideName , false )		-- 名稱
	SetModeEx( Leader , EM_SetModeType_ShowRoleHead , false )	-- 頭像框
	SetModeEx( Leader , EM_SetModeType_Fight , false )		-- 可砍殺攻擊
	SetModeEx( Leader , EM_SetModeType_Show , true )		-- 顯示
	AddToPartition( Leader , RoomID )

	LuaPE_ZONE8_01BBD_Obj[1] = Leader	-- 將操作物件加入第一項
	LuaPE_ZONE8_01BBD_Var[1] = Leader	-- 領導物件GID
	BeginPlot( Leader , "LuaPE_ZONE8_01BBD_FlagtoCallAttack" , 0 )	-- 防止人物發呆

	return Leader;
end

--停止戰鬥
function LuaPE_ZONE8_01BBD_StopAttack( Player , RoomID )
	SetModeEx( Player , EM_SetModeType_Strikback , false )		-- 反擊
	SetModeEx( Player , EM_SetModeType_Searchenemy , false )	-- 索敵
	SetModeEx( Player , EM_SetModeType_Fight , false )		-- 可砍殺攻擊
	Hide( Player )
	Show( Player , RoomID )
	SetStopAttack( Player )
	WriteRoleValue( Player , EM_RoleValue_IsAttackMode , 0 )
end

--抓取區域玩家
function LuaPE_ZONE8_01BBD_GetAreaPlayer()
	local RoomID = 0
	--local AreaID = 664	-- 蛇人補給線西邊
	local AreaID = 667	-- 蛇人補給線東邊
	local TestID = 1	-- 測試區
	local AreaPlayer = {}
	local ZonePlayer = {}

	local PlayerCount = SetSearchAllPlayer( RoomID )	-- 回傳找到個數
	for i = 1 , PlayerCount do
		ZonePlayer[i] = GetSearchResult()	-- 取得搜尋到的玩家
		local X = ReadRoleValue( ZonePlayer[i] , EM_RoleValue_X )
		local Y = ReadRoleValue( ZonePlayer[i] , EM_RoleValue_Y )
		local Z = ReadRoleValue( ZonePlayer[i] , EM_RoleValue_Z )
		if CheckMapID( X , Y , Z , AreaID ) == true or CheckMapID( X , Y , Z , TestID ) then
			table.insert( AreaPlayer , ZonePlayer[i] )	-- 搜尋到這個分區的玩家就加進去
		end
	end

	return AreaPlayer;
end

--判斷玩家是否有相關任務
function LuaPE_ZONE8_01BBD_CheckAreaPlayerQuest()
	local QuestID = 422431		-- 斷橋守衛戰
	local QuestPlayer = 0

	local AreaPlayer = LuaPE_ZONE8_01BBD_GetAreaPlayer()

	for i = 1 , table.getn(AreaPlayer) do
		if CheckAcceptQuest( AreaPlayer[i], QuestID ) == true then
			QuestPlayer = QuestPlayer + 1
		end
	end

	if QuestPlayer > 0 then
		return true;
	else
		return false;
	end

end
--==================================================--



--==================================================--
--  劇情人物處置區                                  --
--==================================================--
function LuaPE_ZONE8_01BBD_QuestNPC_Hide()
	local GuardID = 113216	-- 突擊隊員(劇情用)
	local Guard2ID = 113173	-- 瑞吉．布聶芬司(劇情用)
	local SearchRange = 300	-- 搜尋範圍

	local SearchObj = SearchRangeNPC( OwnerID() , SearchRange )	-- 劇情用的先隱藏
	if SearchObj[0] == -1 then	-- 找不到人
	else
		for i = 0, table.getn(SearchObj)-1 do	-- 最後一個-1不要，所以要-1
			if SearchObj[i] == OwnerID() then	-- 自己不算
			else
				if ReadRoleValue( SearchObj[i] , EM_RoleValue_OrgID ) == Guard2ID then
					LuaPE_ZONE8_01BBD_Var[8] = SearchObj[i]
					DelFromPartition( SearchObj[i] )
				elseif ReadRoleValue( SearchObj[i] , EM_RoleValue_OrgID ) == GuardID then
					DelObj( SearchObj[i] )
				end
			end
		end
	end
end
function LuaPE_ZONE8_01BBD_QuestNPC_Show()
	local RoomID = 0
	local Guard2ID = LuaPE_ZONE8_01BBD_Var[8]

	AddToPartition( Guard2ID , RoomID )
end
--==================================================--



--==================================================----==================================================--
--           公眾任務-原生之地-斷橋攻防戰           ----                                                  --
--==================================================----==================================================--



--==================================================--
--  斷橋攻防戰  啟動處理區                          --
--==================================================--
function LuaPE_ZONE8_01BBD_Start( Mode )
	local LeaderID = 110224		-- 凡瑞娜絲旗幟
	local FlagID = 780445
	local LeaderBronFlag = 11
	local RoomID = 0
	local Obj = LuaPE_ZONE8_01BBD_Obj
	local FlagTmp = 0

	if Obj ~= nil then
		LuaPE_ZONE8_01BBD_DeleteAll( Mode )	-- 將之前的前一個事件的物件全部刪掉
	end

	if Mode ~= nil and Mode == 1 then
		FlagTmp = LuaPE_ZONE8_01BBD_Var[1]
	end

	LuaPE_ZONE8_01BBD_GlobalSet()	-- 設定共用變數

	local Leader = LuaPE_ZONE8_01BBD_LeaderSet( LeaderID , FlagID , LeaderBronFlag , RoomID )	-- 設定領頭旗幟(凡瑞娜絲)

	LuaPE_ZONE8_01BBD_QuestNPC_Hide()	-- 隱藏劇情使用人物

	LuaPE_ZONE8_01BBD_Message( 1 , C_SYSTEM )
	LuaPE_ZONE8_01BBD_Phase = 1		-- 進入第一階段

	Sleep( 10 )	-- 等待一下
	BeginPlot( Leader , "LuaPE_ZONE8_01BBD_GuardCreate" , 0 )	-- 產生隊員
	BeginPlot( Leader , "LuaPE_ZONE8_01BBD_SnakeCreate" , 0 )	-- 產生蛇人

	if Mode ~= nil and Mode == 1 then
		DelObj( FlagTmp )	-- 刪除前一個旗幟
	end
end
--==================================================--



--==================================================--
--  斷橋攻防戰  物件產生區                          --
--==================================================--
function LuaPE_ZONE8_01BBD_GuardCreate()
	local GuardID = { 102711 , 102711 , 102711 , 102711 , 102711 , 102711 , 102711 , 102711 , 102711 , 102711 }	-- 突擊隊員
	local GuardLeaderID = 102712	-- 瑞吉．布聶芬司
	local FlagID = 780445
	local GuardBronFlag = { 1 , 2 , 3 , 4 , 5 , 1 , 2 , 3 , 4 , 5 }
	local Var = LuaPE_ZONE8_01BBD_Var
	local GuardNum = Var[2]
	local SpecialPersion = Var[9]
	local RoomID = 0
	local GuardTalk = { 5 , 6 , 7 , 8 , 9 , 5 , 6 , 7 , 8 , 9 , 10 }

	-- 聯軍特殊人物的出現
	if SpecialPersion == 0 then
		GuardID[1] = GuardLeaderID	-- 瑞吉．布聶芬司
		GuardTalk[1] = GuardTalk[11]
		LuaPE_ZONE8_01BBD_Var[9] = 1
	end

	local Guard = LuaPE_ZONE8_01BBD_FlagCreateBatch( GuardID , FlagID , GuardBronFlag , GuardNum , RoomID , GuardTalk , "_Guard" )

end
function LuaPE_ZONE8_01BBD_SnakeCreate()
	local SnakeID = { 102709 , 102709 , 102709 , 102709 , 102709 , 102710 , 102710 , 102710 , 102710 , 102710 }	-- 102709妖蛇突擊兵 102710蛇人突擊兵
	local SnakeLeaderID = 102346	-- 蛇人營長
	local FlagID = 780445
	local SnakeBronFlag = { 6 , 7 , 8 , 9 , 10 , 6 , 7 , 8 , 9 , 10 }
	local Var = LuaPE_ZONE8_01BBD_Var
	local Phase = LuaPE_ZONE8_01BBD_Phase
	local SnakeNum = Var[3]	-- 蛇人產生數目
	local SnakeKillNum = Var[5]	-- 目前殺死蛇人數目
	local RoomID = 0
	local SnakeTalk = {}
	local SnakeLeaderGo = 0

	if Phase == 2 then		-- 第二階段產的位置不一樣
		SnakeBronFlag = { 1 , 2 , 3 , 4 , 5 , 1 , 2 , 3 , 4 , 5 }
	end

	-- 蛇人增援，殺越多增越多
	if SnakeKillNum == 0 then
		LuaPE_ZONE8_01BBD_Message( 6 , C_DEFAULT )
	elseif SnakeKillNum < 10 then
		if Phase == 1 then
			LuaPE_ZONE8_01BBD_Message( 7 , C_DEFAULT )
		end
	elseif SnakeKillNum < 20 then
		SnakeNum = SnakeNum + 1
		if Phase == 1 then
			LuaPE_ZONE8_01BBD_Message( 8 , C_DEFAULT )
		end
	elseif SnakeKillNum < 30 then
		SnakeNum = SnakeNum + 2
		if Phase == 1 then
			LuaPE_ZONE8_01BBD_Message( 8 , C_DEFAULT )
		end
	elseif SnakeKillNum < 35 then	-- 防止蛇人營長出兩次
		SnakeNum = SnakeNum + 3
		if Phase == 1 then
			LuaPE_ZONE8_01BBD_Message( 8 , C_DEFAULT )
		end
	elseif SnakeKillNum < 40 then
		SnakeNum = SnakeNum + 3
		if Phase == 1 and LuaPE_ZONE8_01BBD_CheckAreaPlayerQuest() == true then	-- 假如有任務的玩家在的話
			SnakeLeaderGo = 1
			SnakeID = { SnakeLeaderID , 102710 , 102710 , 102710 , 102710 , 102710 , 102710 , 102710 , 102710 , 102710 }
			-- SnakeLeaderID	-- 蛇人營長
			LuaPE_ZONE8_01BBD_Message( 10 , C_DEFAULT )
		else
			LuaPE_ZONE8_01BBD_Message( 8 , C_DEFAULT )
		end
	elseif SnakeKillNum < 50 then
		SnakeNum = SnakeNum + 3
		LuaPE_ZONE8_01BBD_Message( 8 , C_DEFAULT )
	else
		SnakeNum = SnakeNum + 4
		LuaPE_ZONE8_01BBD_Message( 8 , C_DEFAULT )
	end

	local Snake = LuaPE_ZONE8_01BBD_FlagCreateBatch( SnakeID , FlagID , SnakeBronFlag , SnakeNum , RoomID , SnakeTalk , "_Snake" )
	if SnakeLeaderGo == 1 then
		SetPlot( Snake[1] , "DEAD" , "LuaS_422431_Snake_Dead" , 0 )	-- 設定蛇人營長的死亡劇情，給任務旗標
		SnakeLeaderGo = 0
	end
end
--==================================================--



--==================================================--
--  斷橋攻防戰  死亡處理區                          --
--==================================================--
function LuaPE_ZONE8_01BBD_GuardDead()
	local Phase = LuaPE_ZONE8_01BBD_Phase
	if Phase > 2 then	-- 結束判定時不再產
		return true
	end

	local GuardID = 102711	-- 突擊隊員
	local Guard2ID = 102712	-- 瑞吉．布聶芬司
	local Var = LuaPE_ZONE8_01BBD_Var
	local GuardKill_LostNum = Var[6]	-- 事件失敗需要被殺隊員數目
	local GuardMaxNum = Var[2]	-- 8-1+8 = 15 場上最多15個隊員
	local GuardKillNum = Var[4]	-- 目前被殺隊員數目
	local Leader = Var[1]
	local Obj = LuaPE_ZONE8_01BBD_Obj
	local Player = OwnerID()

	GuardKillNum = GuardKillNum + 1		-- 死亡計數
	LuaPE_ZONE8_01BBD_Var[4] = GuardKillNum

	-- 死亡的人移出物件管理陣列，但是瑞吉．布聶芬司不會死，所以要排除
	for i = 1, table.getn(Obj) do
		if ReadRoleValue( Obj[i] , EM_RoleValue_OrgID ) ~= Guard2ID and Obj[i] == Player then
			table.remove( Obj , i )
			break;
		end
	end
	LuaPE_ZONE8_01BBD_Message( 3 , C_SYSTEM )		-- 隊員總死亡人數

	local GuardCount = LuaPE_ZONE8_01BBD_DeadBatch( GuardID , Guard2ID )

	if GuardKillNum >= GuardKill_LostNum then
		BeginPlot( Leader , "LuaPE_ZONE8_01BBD_Lost" , 0 )		-- 進入第二階段
	else
		if GuardCount < GuardMaxNum then
			BeginPlot( Leader , "LuaPE_ZONE8_01BBD_GuardCreate" , 0 )	-- 重新執行第一階段 產人
		end
	end

	if ReadRoleValue( Player , EM_RoleValue_OrgID ) == Guard2ID then	-- 瑞吉．布聶芬司死亡的特殊處理
		local RoomID = 0
		LuaPE_ZONE8_01BBD_StopAttack( Player , RoomID )
		Lua_CancelAllBuff( Player )	-- 防止因為DOT而死不停

		LuaPE_ZONE8_01BBD_Say( Player , 3 )
		LuaPE_ZONE8_01BBD_Var[10] = 1
		Sleep( 10 )	-- 為了感覺，停一秒
		BeginPlot( Player , "LuaPE_ZONE8_01BBD_GuardBack_SP1" , 0 )
		return false
	else
		return true
	end
end
function LuaPE_ZONE8_01BBD_SnakeDead()
	local Phase = LuaPE_ZONE8_01BBD_Phase
	if Phase > 3 then	-- 結束判定時不再產
		return true
	end

	local SnakeID = 102709	-- 妖蛇衛兵
	local Snake2ID = 102710	-- 蛇人衛士
	local Var = LuaPE_ZONE8_01BBD_Var
	local SnakeKill_WinNum = Var[7]	-- 事件獲勝需要殺死蛇人數目
	local SnakeMaxNum = Var[3]	-- 5-1+5 = 9 場上最多9隻蛇人
	local SnakeKillNum = Var[5]	-- 目前殺死蛇人數目
	local Leader = Var[1]

	SnakeKillNum = SnakeKillNum + 1		-- 死亡計數
	LuaPE_ZONE8_01BBD_Var[5] = SnakeKillNum

	LuaPE_ZONE8_01BBD_Message( 2 , C_SYSTEM )		-- 蛇人總死亡人數

	local SnakeCount = LuaPE_ZONE8_01BBD_DeadBatch( SnakeID , Snake2ID )

	if SnakeKillNum >= SnakeKill_WinNum then
		BeginPlot( Leader , "LuaPE_ZONE8_01BBD_Win" , 0 )
	else
		if SnakeCount < SnakeMaxNum then
			BeginPlot( Leader , "LuaPE_ZONE8_01BBD_SnakeCreate" , 0 )	-- 重新執行第一階段 產怪
		end
	end

	return true
end
--==================================================--



--==================================================--
--  斷橋攻防戰  移動表演區                          --
--==================================================--
function LuaPE_ZONE8_01BBD_GuardDo()
	local FlagObjID = 780445 
	local FlagGoID = 0
	local Range = 15

	local GoDone = LuaPE_ZONE8_01BBD_ObjGO( FlagObjID , FlagGoID , Range )
end
function LuaPE_ZONE8_01BBD_SnakeDo()
	local FlagObjID = 780445 
	local FlagGoID = 0
	local Range = 15

	local GoDone = LuaPE_ZONE8_01BBD_ObjGO( FlagObjID , FlagGoID , Range )
end
--==================================================--



--==================================================--
--  斷橋攻防戰  表演分配區                          --
--==================================================--
function LuaPE_ZONE8_01BBD_Win()
	local SnakeID = 102709	-- 妖蛇衛兵
	local Snake2ID = 102710	-- 蛇人衛士
	local SnakeLeaderID = 102346	-- 蛇人營長
	local GuardID = 102711	-- 突擊隊員
	local Guard2ID = 102712	-- 瑞吉．布聶芬司
	local Obj = LuaPE_ZONE8_01BBD_Obj
	local Phase = LuaPE_ZONE8_01BBD_Phase
	local GuardGoBackAgain = 0

	if Phase == 2 then
		GuardGoBackAgain = 1
	end

	LuaPE_ZONE8_01BBD_Phase = 3	-- 進入第三階段
	LuaPE_ZONE8_01BBD_Message( 4 , C_SYSTEM )

	for i = 1, table.getn(Obj) do
		if Obj[i] ~= nil and CheckID(Obj[i]) == true then
			local RoomID = 0
			LuaPE_ZONE8_01BBD_StopAttack( Obj[i] , RoomID )

			local OrgID = ReadRoleValue( Obj[i] , EM_RoleValue_OrgID )
			if OrgID == Guard2ID or OrgID == GuardID then
				BeginPlot( Obj[i] , "LuaPE_ZONE8_01BBD_GuardWinBack" , 0 )	-- 隊員獲勝整備
			elseif OrgID == Snake2ID or OrgID == SnakeID or OrgID == SnakeLeaderID then
				BeginPlot( Obj[i] , "LuaPE_ZONE8_01BBD_SnakeLostBack" , 0 )	-- 蛇人失敗撤退
			end
		end
	end

	if GuardGoBackAgain == 1 then
		Sleep( 10 )
		local GuardID = { 102712 , 102711 , 102711 , 102711 , 102711 }	-- 突擊隊員
		local FlagID = 780445
		local GuardBronFlag = { 12 , 12 , 12 , 12 , 12 }
		local Var = LuaPE_ZONE8_01BBD_Var
		local GuardNum = 5
		local RoomID = 0
		local GuardTalk = { 12 , 4 , 4 , 4 , 4 }
		local Guard = {}

		LuaPE_ZONE8_01BBD_Message( 9 , C_SYSTEM )
		local GuardLeader = LuaPE_ZONE8_01BBD_Var[12]
		if GuardLeader ~= nil and CheckID(GuardLeader) == true then
			DelObj(GuardLeader)	-- 刪除瑞吉．布聶芬司(失敗劇情專用)
		end

		for i = 1 , GuardNum do
			Guard[i] = CreateObjByFlag( GuardID[i] , FlagID , GuardBronFlag[i] , 1 )
			SetModeEx( Guard[i] , EM_SetModeType_Strikback , false )		-- 反擊
			SetModeEx( Guard[i] , EM_SetModeType_Searchenemy , false )	-- 索敵
			SetModeEx( Guard[i] , EM_SetModeType_Fight , false )		-- 可砍殺攻擊
			WriteRoleValue( Guard[i] , EM_RoleValue_IsWalk , 0 )	-- 用跑的移動	-- 要有Partition經過才會正常
			AddToPartition( Guard[i] , RoomID )
			LuaPE_ZONE8_01BBD_Say( Guard[i] , GuardTalk[i] )
			MoveToFlagEnabled( Guard[i] , false )	-- 關閉巡邏劇情
			BeginPlot( Guard[i] , "LuaPE_ZONE8_01BBD_GuardBack_SP3" , 0 )
			Sleep( 5 )
		end
		Sleep( 65 )
	else
		Sleep( 80 )
	end

	LuaPE_ZONE8_01BBD_QuestNPC_Show()
	local FlagTmp = LuaPE_ZONE8_01BBD_Obj[1]	-- 旗幟編號先暫存起來

	local LeaderID = 110224		-- 凡瑞娜絲旗幟
	local FlagID = 780445
	local LeaderBronFlag = 11
	local RoomID = 0

	local Leader = LuaPE_ZONE8_01BBD_LeaderSet( LeaderID , FlagID , LeaderBronFlag , RoomID )	-- 設定領頭旗幟(凡瑞娜絲)
	BeginPlot( Leader , "LuaPE_ZONE8_01BBD_Reset" , 0 )	-- 重置公眾任務

	DelObj( FlagTmp )	-- 刪除蛇人軍隊旗幟

end
function LuaPE_ZONE8_01BBD_Lost()
	local SnakeID = 102709	-- 妖蛇衛兵
	local Snake2ID = 102710	-- 蛇人衛士
	local SnakeLeaderID = 102346	-- 蛇人營長
	local GuardID = 102711	-- 突擊隊員
	local Guard2ID = 102712	-- 瑞吉．布聶芬司
	local Obj = LuaPE_ZONE8_01BBD_Obj
	local Var = LuaPE_ZONE8_01BBD_Var
	local SnakeKill_WinNum = Var[7]	-- 事件獲勝需要殺死蛇人數目

	LuaPE_ZONE8_01BBD_Phase = 2	-- 進入第二階段
	LuaPE_ZONE8_01BBD_Message( 5 , C_DEFAULT )

	SnakeKill_WinNum = SnakeKill_WinNum*2		-- 第二階段完成條件為原本的加倍
	LuaPE_ZONE8_01BBD_Var[7] = SnakeKill_WinNum

	for i = 1, table.getn(Obj) do
		if Obj[i] ~= nil and CheckID(Obj[i]) == true then
			local RoomID = 0
			LuaPE_ZONE8_01BBD_StopAttack( Obj[i] , RoomID )

			local OrgID = ReadRoleValue( Obj[i] , EM_RoleValue_OrgID )
			if OrgID == Guard2ID or OrgID == GuardID then
				BeginPlot( Obj[i] , "LuaPE_ZONE8_01BBD_GuardLostBack" , 0 )	-- 隊員失敗撤退
			elseif OrgID == Snake2ID or OrgID == SnakeID or OrgID == SnakeLeaderID then
				BeginPlot( Obj[i] , "LuaPE_ZONE8_01BBD_SnakeWinEnter" , 0 )	-- 蛇人獲勝佔據
			end
		end
	end
	Sleep( 80 )

	local FlagTmp = LuaPE_ZONE8_01BBD_Obj[1]	-- 旗幟編號先暫存起來

	local LeaderID = 113607		-- 蛇人軍隊旗幟
	local FlagID = 780445
	local LeaderBronFlag = 11
	local RoomID = 0

	local Leader = LuaPE_ZONE8_01BBD_LeaderSet( LeaderID , FlagID , LeaderBronFlag , RoomID )	-- 設定領頭旗幟(蛇人)
	 DelObj( FlagTmp )	-- 刪除凡瑞娜絲旗幟

end
--==================================================--



--==================================================--
--  斷橋攻防戰  隊員表演區                          --
--==================================================--
function LuaPE_ZONE8_01BBD_GuardWinBack()	-- 隊員獲勝整備
	local FlagGoID = 11
	LuaPE_ZONE8_01BBD_GuardBack_SP2( FlagGoID )

end
function LuaPE_ZONE8_01BBD_GuardLostBack()	-- 隊員失敗撤退
	local FlagGoID = 12
	LuaPE_ZONE8_01BBD_GuardBack_SP2( FlagGoID )
end
--==================================================--



--==================================================--
--  斷橋攻防戰  蛇人表演區                          --
--==================================================--
function LuaPE_ZONE8_01BBD_SnakeLostBack()	-- 蛇人失敗撤退
	local FlagObjID = 780445
	local FlagGoID = 6
	local Range = 30

	local GoDone = LuaPE_ZONE8_01BBD_ObjGO( FlagObjID , FlagGoID , Range )
	DelObj( OwnerID() )
end
function LuaPE_ZONE8_01BBD_SnakeWinEnter()	-- 蛇人獲勝佔據
	local FlagObjID = 780445
	local FlagGoID = 0
	local Range = 30
	local RoomID = 0
	local Player = OwnerID()

	Sleep( 30 )
	local GoDone = LuaPE_ZONE8_01BBD_ObjGO( FlagObjID , FlagGoID , Range )

	AdjustDir( Player , 180 )
	SetModeEx( Player , EM_SetModeType_Strikback , true )	-- 反擊
	SetModeEx( Player , EM_SetModeType_Searchenemy , true )	-- 索敵
	SetModeEx( Player , EM_SetModeType_Fight , true )	-- 可砍殺攻擊
	Hide( Player )
	Show( Player , RoomID )

end
--==================================================--



--==================================================--
--  斷橋攻防戰  特殊人物表演區                      --
--==================================================--
function LuaPE_ZONE8_01BBD_GuardBack_SP1()	-- 瑞吉．布聶芬司死亡撤退蹲下
	local FlagObjID = 780445
	local FlagGoID = 11
	local Range = 25

	local GoDone = LuaPE_ZONE8_01BBD_ObjGO( FlagObjID , FlagGoID , Range )
	SetIdleMotion( OwnerID() , ruFUSION_ACTORSTATE_NORMAL )
	Sleep( 5 )
	PlayMotionEX( OwnerID() , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_LOOP )
end
function LuaPE_ZONE8_01BBD_GuardBack_SP2( FlagGoID )	-- 隊員撤退
	local FlagObjID = 780445
	local Range = 30
	local GuardID = 102711	-- 突擊隊員
	local Guard2ID = 102712	-- 瑞吉．布聶芬司
	local Player = OwnerID()
	local OrgID = ReadRoleValue( Player , EM_RoleValue_OrgID )
	local Var = LuaPE_ZONE8_01BBD_Var
	local GuardLeaderDead = Var[10]
	local Phase = LuaPE_ZONE8_01BBD_Phase

	if OrgID == Guard2ID then
		if GuardLeaderDead == 1 then
			PlayMotion( Player , ruFUSION_ACTORSTATE_CROUCH_END )
			Sleep( 10 )
			AdjustDir( Player , 180 )
		end
		Sleep( 5 )
		PlayMotion( Player , ruFUSION_ACTORSTATE_EMOTE_VICTORY )
		if Phase == 2 then
			LuaPE_ZONE8_01BBD_Say( Player , 2 )
		elseif Phase == 3 then
			LuaPE_ZONE8_01BBD_Say( Player , 1 )
		end
		Sleep( 5 )
	elseif OrgID == GuardID then
		if GuardLeaderDead == 1 then
			Sleep( 10 )
		end
		Sleep( 15 )
		if Rand( 10 ) > 3 then
			LuaPE_ZONE8_01BBD_Say( Player , 4 )
		end
	end

	local GoDone = LuaPE_ZONE8_01BBD_ObjGO( FlagObjID , FlagGoID , Range )
	Sleep( 5 )	-- 跑到之後等一下

	if OrgID == Guard2ID and FlagGoID == 12 then	-- 12表示失敗撤退
		local GuardLeaderID = 113664	-- 瑞吉．布聶芬司(失敗劇情專用)
		local FlagID = 780445
		local ObjBronFlag = 13
		local RoomID = 0

		local GuardLeader = CreateObjByFlag( GuardLeaderID , FlagID , ObjBronFlag , 1 )
		AddToPartition( GuardLeader , RoomID )
		LuaPE_ZONE8_01BBD_Var[12] = GuardLeader	-- 紀錄進去好刪除
		SetPlot( GuardLeader , "RANGE" , "LuaS_113664_Range" , 125 )
	end
	DelObj( Player )
end
function LuaPE_ZONE8_01BBD_GuardBack_SP3()	-- 隊員再度歸來
	local FlagObjID = 780445 
	local FlagGoID = 11
	local Range = 15
	local Player = OwnerID()

	local GoDone = LuaPE_ZONE8_01BBD_ObjGO( FlagObjID , FlagGoID , Range )
	Sleep( 5 )	-- 跑到之後等一下

	DelObj( Player )
end
function LuaS_113664_Range()
-- 422428支援石橋駐守隊
-- 422429強化防線所需
-- 422430阻止兵力集結
-- 422431斷橋守衛戰
	local Player = OwnerID()
	if CheckAcceptQuest( Player , 422428 ) == true or CheckAcceptQuest( Player , 422429 ) == true or CheckAcceptQuest( Player , 422430 ) == true  or CheckAcceptQuest( Player , 422431 ) == true then
		--Say(OwnerID(), "Rang")
		Tell( Player , TargetID() , "[SC_PE_ZONE8_01BBD_S13]" )
	end
end
--==================================================--



--==================================================--
--  斷橋攻防戰  旗幟攻擊指示區                      --
--==================================================--
function LuaPE_ZONE8_01BBD_FlagtoCallAttack()	-- 防止人物發呆
	local SnakeID = 102709	-- 妖蛇衛兵
	local Snake2ID = 102710	-- 蛇人衛士
	local SnakeLeaderID = 102346	-- 蛇人營長
	local GuardID = 102711	-- 突擊隊員
	local Guard2ID = 102712	-- 瑞吉．布聶芬司
	local Obj = LuaPE_ZONE8_01BBD_Obj
	local Var = LuaPE_ZONE8_01BBD_Var
	local Phase = LuaPE_ZONE8_01BBD_Phase
	--local GuardLeaderDead = Var[10]

	while true do
		Sleep( 50 )	-- 開始等五秒
		if Phase == 1 then
			for i = 1, table.getn(Obj) do
				if CheckID(Obj[i]) == true then
					if ReadRoleValue( Obj[i] , EM_RoleValue_IsAttackMode ) == 0 and ReadRoleValue( Obj[i] , EM_RoleValue_IsDead ) ~= 1 then
						local OrgID = ReadRoleValue( Obj[i] , EM_RoleValue_OrgID )
						if OrgID == Guard2ID and LuaPE_ZONE8_01BBD_Var[10] ~= 1 then
							for s = 1, table.getn(Obj) do
								local sOrgID = ReadRoleValue( Obj[s] , EM_RoleValue_OrgID )
								if (sOrgID == Snake2ID or sOrgID == SnakeID or sOrgID == SnakeLeaderID) and ReadRoleValue( Obj[s] , EM_RoleValue_IsDead ) ~= 1 then
									SetAttack( Obj[i] , Obj[s] )
									break;
								end
							end
						elseif OrgID == GuardID then
							for s = 1, table.getn(Obj) do
								local sOrgID = ReadRoleValue( Obj[s] , EM_RoleValue_OrgID )
								if (sOrgID == Snake2ID or sOrgID == SnakeID or sOrgID == SnakeLeaderID) and ReadRoleValue( Obj[s] , EM_RoleValue_IsDead ) ~= 1 then
									SetAttack( Obj[i] , Obj[s] )
									break;
								end
							end
						elseif OrgID == Snake2ID or OrgID == SnakeID or OrgID == SnakeLeaderID then
							for g = 1, table.getn(Obj) do
								local gOrgID = ReadRoleValue( Obj[g] , EM_RoleValue_OrgID )
								if gOrgID == Guard2ID and LuaPE_ZONE8_01BBD_Var[10] ~= 1 then
									SetAttack( Obj[i] , Obj[g] )
									break;
								elseif gOrgID == GuardID and ReadRoleValue( Obj[g] , EM_RoleValue_IsDead ) ~= 1 then
									SetAttack( Obj[i] , Obj[g] )
									break;
								end
							end
						end
					end
				end
			end
		end
	end
end
--==================================================--



--==================================================--
--  斷橋攻防戰  啟動處理區                          --
--==================================================--
function LuaPE_ZONE8_01BBD_Reset()
	local ResetTime = LuaPE_ZONE8_01BBD_Var[11]		-- 秒
	local Mode = 1

	LuaPE_ZONE8_01BBD_Message( 11 , C_SYSTEM )
	Sleep( ResetTime*10 )
	LuaPE_ZONE8_01BBD_Start( Mode )
end
--==================================================----==================================================--