--==================================================--
-- 上線前需要調整的部份
-- 1.蛇人補給線的佈怪
-- 2.重置的時間要調整
--==================================================--

--==================================================--
--  測試函式區                                      --
--==================================================--
function LuaPE_ZONE8_02SCA_DeleteAll( DeleteMode )
	local Obj = LuaPE_ZONE8_02SCA_Obj
	local StartNum = 1

	if DeleteMode ~= nil and DeleteMode == 1 then
		StartNum = 2
	end

	for i = StartNum, table.getn(Obj) do
		if CheckID(Obj[i]) == true then
			DelObj( Obj[i] )
		end
	end
end
--==================================================--



--==================================================--
--  全域變數區                                      --
--==================================================--
function LuaPE_ZONE8_02SCA_GlobalSet()
	LuaPE_ZONE8_02SCA_Obj = {}		-- 使用物件管理陣列
	LuaPE_ZONE8_02SCA_Var = {}		-- 使用參數管理陣列
	LuaPE_ZONE8_02SCA_Phase = 0		-- 進行到第？階段

	LuaPE_ZONE8_02SCA_Var[1] = 0	-- 領導物件GID(旗幟)
	LuaPE_ZONE8_02SCA_Var[2] = 0	-- 運輸鐵脊龍ID
	LuaPE_ZONE8_02SCA_Var[3] = 1	-- 運輸鐵脊龍目前走到哪一個旗標
	LuaPE_ZONE8_02SCA_Var[4] = {}	-- 護衛桌
	LuaPE_ZONE8_02SCA_Var[5] = 0	-- 死亡中
	LuaPE_ZONE8_02SCA_Var[11] = 3600	-- 公眾任務重置時間(秒)1小時
end
--==================================================--



--==================================================--
--  訊息處理區                                      --
--==================================================--
--傳送訊息
function LuaPE_ZONE8_02SCA_Message( Index , Color )
	local AreaPlayer = LuaPE_ZONE8_02SCA_GetAreaPlayer()
	local Message = ""

	    if Index == 1 then
		Message = "[SC_PE_ZONE8_01][$SETVAR1=[SC_PE_ZONE8_02SCA_M01]]"	-- 事件 [$VAR1] 開始進行！！ $VAR1=鐵脊龍補給
	elseif Index == 2 then
		Message = "[SC_PE_ZONE8_02SCA_M02]"	-- 一個鐵脊龍補給小隊出發了！！
	elseif Index == 3 then
		Message = "[SC_PE_ZONE8_04][$SETVAR1=[SC_PE_ZONE8_02SCA_M03]]"	-- 鐵脊龍補給小隊發現障礙！！
	elseif Index == 4 then
		Message = "[SC_PE_ZONE8_04][$SETVAR1=[SC_PE_ZONE8_02SCA_M04]]"	-- 鐵脊龍補給小隊排除障礙，繼續前進！！
	elseif Index == 5 then
		Message = "[SC_PE_ZONE8_04][$SETVAR1=[SC_PE_ZONE8_02SCA_M05]]"	-- 運輸鐵脊龍受到驚嚇，快速逃跑！！
	elseif Index == 6 then
		Message = "[SC_PE_ZONE8_04][$SETVAR1=[SC_PE_ZONE8_02SCA_M06]]"	-- 運輸鐵脊龍受到嚴重傷害，變得憤怒！！
	elseif Index == 7 then
		Message = "[SC_PE_ZONE8_02SCA_M07]"	-- 鐵脊龍補給小隊順利的將物品運輸到達定點！！
	elseif Index == 8 then
		Message = "[SC_PE_ZONE8_02SCA_M08]"	-- 鐵脊龍補給小隊警戒謹慎的邁入石橋，讓人找不到空隙攻擊！！
	elseif Index == 9 then
		Message = "[SC_PE_ZONE8_02SCA_M09]"	-- 鐵脊龍補給小隊順利的通過石橋，警戒稍微放鬆了下來！！
	elseif Index == 11 then
		Message = "[SC_PE_ZONE8_05][$SETVAR1=[SC_PE_ZONE8_02SCA_M01]]"	-- 事件 [$VAR1] 至此結束！！ $VAR1=鐵脊龍補給
	end

	for i = 1 , table.getn(AreaPlayer) do
		ScriptMessage( OwnerID(), AreaPlayer[i] , 1 , Message , Color )
		ScriptMessage( OwnerID(), AreaPlayer[i] , 0 , Message , Color )
	end
end
--==================================================--



--==================================================--
--  共用函式區                                      --
--==================================================--
--領頭旗子物件設定
function LuaPE_ZONE8_02SCA_LeaderSet( LeaderID , FlagID , LeaderBronFlag , RoomID )
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

	LuaPE_ZONE8_02SCA_Obj[1] = Leader	-- 將操作物件加入第一項
	LuaPE_ZONE8_02SCA_Var[1] = Leader	-- 領導物件GID

	return Leader;
end

--抓取區域玩家
function LuaPE_ZONE8_02SCA_GetAreaPlayer()
	local RoomID = 0
	local AreaID = 664	-- 蛇人補給線西邊
	--local AreaID = 667	-- 蛇人補給線東邊
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

-- 六角陣型
function LuaPE_ZONE8_02SCA_FormationPosition( X , Y , Z , Width , Height , Angle , Angle2 )
	if Height == nil then Height = Width end
	if Angle2 == nil then Angle2 = 15 end

	local Position = {}
	Position["X"] = {}
	Position["Y"] = {}
	Position["Z"] = {}

	Position["X"][1] = X+Height*math.cos(Angle*math.pi/180)	-- 前
	Position["Y"][1] = Y
	Position["Z"][1] = Z-Height*math.sin(Angle*math.pi/180)

	Position["X"][2] = X-Width*math.sin(Angle*math.pi/180+Angle2)	-- 右前
	Position["Y"][2] = Y
	Position["Z"][2] = Z-Width*math.cos(Angle*math.pi/180+Angle2)

	Position["X"][3] = X+Width*math.sin(Angle*math.pi/180-Angle2)	-- 左前
	Position["Y"][3] = Y
	Position["Z"][3] = Z+Width*math.cos(Angle*math.pi/180-Angle2)

	Position["X"][4] = X-Width*math.sin(Angle*math.pi/180-Angle2)	-- 右後
	Position["Y"][4] = Y
	Position["Z"][4] = Z-Width*math.cos(Angle*math.pi/180-Angle2)

	Position["X"][5] = X+Width*math.sin(Angle*math.pi/180+Angle2)	-- 左後
	Position["Y"][5] = Y
	Position["Z"][5] = Z+Width*math.cos(Angle*math.pi/180+Angle2)

	Position["X"][6] = X-Height*math.cos(Angle*math.pi/180)	-- 後
	Position["Y"][6] = Y
	Position["Z"][6] = Z+Height*math.sin(Angle*math.pi/180)

	return Position;
end
--==================================================--



--==================================================----==================================================--
--           公眾任務-原生之地-補給攔截戰           ----                                                  --
--==================================================----==================================================--



--==================================================--
--  補給攔截戰  啟動處理區                          --
--==================================================--
function LuaPE_ZONE8_02SCA_Start( Mode )
	local Obj = LuaPE_ZONE8_02SCA_Obj
	local Var = LuaPE_ZONE8_02SCA_Var

	local LeaderID = 113607		-- 蛇人軍隊旗幟
	local FlagID = 780462
	local LeaderBronFlag = 0
	local RoomID = 0
	local FlagTmp = 0

	if Obj ~= nil then
		LuaPE_ZONE8_02SCA_DeleteAll( Mode )	-- 將之前的前一個事件的物件全部刪掉
	end

	if Mode ~= nil and Mode == 1 then
		FlagTmp = Var[1]	-- 旗幟編號暫存
	end

	LuaPE_ZONE8_02SCA_GlobalSet()	-- 設定共用變數

	local Leader = LuaPE_ZONE8_02SCA_LeaderSet( LeaderID , FlagID , LeaderBronFlag , RoomID )	-- 設定領頭旗幟(蛇人旗幟)

	LuaPE_ZONE8_02SCA_Message( 1 , C_SYSTEM )
	LuaPE_ZONE8_02SCA_Phase = 1		-- 進入第一階段

	Sleep( 10 )	-- 等待一下
	local Ankylo = LuaPE_ZONE8_02SCA_AnkyloCreate()	-- 產生鐵脊龍
	LuaPE_ZONE8_02SCA_Var[2] = Ankylo

	BeginPlot( Leader , "LuaPE_ZONE8_02SCA_AnkyloDo" , 0 )	-- 整體運輸過程迴圈
	LuaPE_ZONE8_02SCA_Message( 2 , C_SYSTEM )

	if Mode ~= nil and Mode == 1 then
		DelObj( FlagTmp )	-- 刪除前一個旗幟
	end
end
--==================================================--



--==================================================--
--  補給攔截戰  物件產生區                          --
--==================================================--
function LuaPE_ZONE8_02SCA_AnkyloCreate()	-- 整體補給隊
	local AnkyloID = 102713	-- 102713運輸鐵脊龍
	local FlagID = 780462
	local AnkyloBronFlag = 1
	local RoomID = 0
	local SnakeID = { 102716 , 102715 , 102715 , 102715 , 102715 , 102715 }	--102709妖蛇補給兵 102710蛇人補給兵
	local SnakeNum = 5	-- 這邊只產生 前跟左右兩邊的護衛

	local Ankylo = CreateObjByFlag( AnkyloID , FlagID , AnkyloBronFlag , 1 )
	SetModeEx( Ankylo , EM_SetModeType_Mark , false )		-- 標記
	SetModeEx( Ankylo , EM_SetModeType_Strikback , false )		-- 反擊
	SetModeEx( Ankylo , EM_SetModeType_Searchenemy , false )	-- 索敵
	SetModeEx( Ankylo , EM_SetModeType_Fight , false )		-- 可砍殺攻擊
	WriteRoleValue( Ankylo , EM_RoleValue_IsAttackMode , 0 )	-- 不是攻擊狀態
	WriteRoleValue( Ankylo , EM_RoleValue_IsWalk , 1 )	-- 用走的移動
	AddToPartition( Ankylo , RoomID )
	MoveToFlagEnabled( Ankylo , false )	-- 關閉巡邏劇情
	table.insert( LuaPE_ZONE8_02SCA_Obj , Ankylo )
	Sleep( 5 )

	SetPlot( Ankylo , "DEAD" , "LuaPE_ZONE8_02SCA_AnkyloDead" , 0 )	-- 設定死亡劇情

	local X = ReadRoleValue( Ankylo , EM_RoleValue_X )
 	local Y = ReadRoleValue( Ankylo , EM_RoleValue_Y )
 	local Z = ReadRoleValue( Ankylo , EM_RoleValue_Z )
	local Dir = ReadRoleValue( Ankylo , EM_RoleValue_Dir )
	local RoomID = ReadRoleValue( Ankylo , EM_RoleValue_RoomID )

	local Width = 60
	local Height = 90

	local Snake = {}
	local SnakeBornPosition = LuaPE_ZONE8_02SCA_FormationPosition( X , Y , Z , Width , Height , Dir )

	for i = 1 , SnakeNum do
		if SnakeID[i] ~= nil then
			Snake[i] = CreateObj( SnakeID[i] , SnakeBornPosition["X"][i], SnakeBornPosition["Y"][i] , SnakeBornPosition["Z"][i] , Dir , 1 )
			WriteRoleValue( Ankylo , EM_RoleValue_IsWalk , 1 )	-- 用走的移動
			AddToPartition( Snake[i] , RoomID )
			MoveToFlagEnabled( Snake[i] , false )	-- 關閉巡邏劇情
			table.insert( LuaPE_ZONE8_02SCA_Obj , Snake[i] )
			SetPlot( Snake[i] , "DEAD" , "LuaPE_ZONE8_02SCA_SnakeDead" , 0 )	-- 設定死亡劇情
		end
	end

	LuaPE_ZONE8_02SCA_Var[4] = Snake

	return Ankylo;	-- 回傳運輸鐵脊龍的ID
end



--==================================================--
--  補給攔截戰  移動表演區                          --
--==================================================--
function LuaPE_ZONE8_02SCA_AnkyloDo()
	local Var = LuaPE_ZONE8_02SCA_Var

	local FlagObjID = 780462 
	local FlagGoID = 1	-- 從第 1 點開始走
	local Range = 10
	local Width = 60
	local Height = 90
	local CheckDis = 50
	local SnakeNum = 5	-- 這邊只產生 前跟左右兩邊的護衛

	local Leader = Var[1]
	local Ankylo = Var[2]
	local Snake = Var[4]

	local FlagX = GetMoveFlagValue( FlagObjID , FlagGoID , EM_RoleValue_X )
	local FlagY = GetMoveFlagValue( FlagObjID , FlagGoID , EM_RoleValue_Y )
	local FlagZ = GetMoveFlagValue( FlagObjID , FlagGoID , EM_RoleValue_Z )

	local AnkyloDir = ReadRoleValue( Ankylo , EM_RoleValue_Dir )
	local RoomID = ReadRoleValue( Ankylo , EM_RoleValue_RoomID )
	PreviousDir = AnkyloDir

	local IsAttack = 0
	local Wude = 0 -- 石橋上無敵狀態

	MoveDirect( Ankylo , FlagX , FlagY , FlagZ )	-- 鐵脊龍移動

	while true do
		local Phase = LuaPE_ZONE8_02SCA_Phase

		Sleep( 10 )
		local AnkyloX = ReadRoleValue( Ankylo , EM_RoleValue_X )
	 	local AnkyloY = ReadRoleValue( Ankylo , EM_RoleValue_Y )
	 	local AnkyloZ = ReadRoleValue( Ankylo , EM_RoleValue_Z )
		local AnkyloDir = ReadRoleValue( Ankylo , EM_RoleValue_Dir )

		if math.abs( AnkyloX - FlagX ) < Range and math.abs( AnkyloZ - FlagZ ) < Range then	-- 走到定點設定下一點位置
			FlagGoID = FlagGoID + 1
			FlagX = GetMoveFlagValue( FlagObjID , FlagGoID , EM_RoleValue_X )
			FlagY = GetMoveFlagValue( FlagObjID , FlagGoID , EM_RoleValue_Y )
			FlagZ = GetMoveFlagValue( FlagObjID , FlagGoID , EM_RoleValue_Z )
			FlagX = FlagX + Rand( Range ) * 2 - Range + 1
			FlagZ = FlagZ + Rand( Range ) * 2 - Range + 1
			MoveDirect( Ankylo , FlagX , FlagY , FlagZ )	-- 鐵脊龍移動
		end

		local DeltaDir = math.abs( PreviousDir - AnkyloDir )	--轉向處理，看是否需要變化陣型位置
		if DeltaDir > 90 and DeltaDir < 270 then	-- 變化陣型位置
			local tmp = 0
			if Snake[1] ~= nil and Snake[6] ~= nil then
				tmp = Snake[1]
				Snake[1] = Snake[6]
				Snake[6] = tmp
			end
			if Snake[2] ~= nil and Snake[5] ~= nil then
				tmp = Snake[2]
				Snake[2] = Snake[5]
				Snake[5] = tmp
			end
			if Snake[3] ~= nil and Snake[4] ~= nil then
				tmp = Snake[3]
				Snake[3] = Snake[4]
				Snake[4] = tmp
			end
		end
		PreviousDir = AnkyloDir

		local SnakePosition = LuaPE_ZONE8_02SCA_FormationPosition( AnkyloX , AnkyloY , AnkyloZ , Width , Height , AnkyloDir )	-- 計算該走到的位置

		for i = 1 , SnakeNum do
			if Snake[i] ~= nil and CheckID( Snake[i] ) == true and ReadRoleValue( Snake[i] , EM_RoleValue_IsNPC ) == 1 then	-- 是否 NPC 且存在
				if ReadRoleValue( Snake[i] , EM_RoleValue_IsAttackMode ) == 1 and ReadRoleValue( Snake[i] , EM_RoleValue_IsDead ) ~= 1 then	--  在戰鬥中 且 活著
					local AttackTargetID = ReadRoleValue( Snake[i] , EM_RoleValue_AttackTargetID )
					for j = 1 , SnakeNum do
						if Snake[j] ~= nil then
							SetAttack( Snake[j] , AttackTargetID )	-- 所有人攻擊
						end
					end
					IsAttack = 1
				else
					IsAttack = 0
					MoveToFlagEnabled( Snake[i] , false )  --戰鬥過後會打開，所以需要再關一次
--					local Snake = Snake[i]
					local DeltaX = math.abs( SnakePosition["X"][i]-ReadRoleValue( Snake[i] , EM_RoleValue_X ) )
					local DeltaY = math.abs( SnakePosition["Y"][i]-ReadRoleValue( Snake[i] , EM_RoleValue_Y ) )
					local DeltaZ = math.abs( SnakePosition["Z"][i]-ReadRoleValue( Snake[i] , EM_RoleValue_Z ) )
					if DeltaX > CheckDis or DeltaY > CheckDis or DeltaZ > CheckDis then
						WriteRoleValue( Snake[i] , EM_RoleValue_IsWalk , 0 )
						if DeltaX < 3*CheckDis or DeltaY < 2*CheckDis or DeltaZ < 3*CheckDis then
							if FlagGoID ~= 10 then
								local CastTime = SetPos( Snake[i] , SnakePosition["X"][i] , SnakePosition["Y"][i] , SnakePosition["Z"][i] , AnkyloDir )
							else
								local CastTime = MoveDirect( Snake[i] , SnakePosition["X"][i] , SnakePosition["Y"][i] , SnakePosition["Z"][i] )
							end
						elseif DeltaX < 2*CheckDis and DeltaY < 2*CheckDis and DeltaZ < 2*CheckDis then
							local CastTime = MoveDirect( Snake[i] , SnakePosition["X"][i] , SnakePosition["Y"][i] , SnakePosition["Z"][i] )
						else
							local CastTime = Move( Snake[i] , SnakePosition["X"][i] , SnakePosition["Y"][i] , SnakePosition["Z"][i] )
						end
					else
						if FlagGoID ~= 10 then
							WriteRoleValue( Snake[i] , EM_RoleValue_IsWalk , 1 )
						end
						local CastTime = MoveDirect( Snake[i] , SnakePosition["X"][i] , SnakePosition["Y"][i] , SnakePosition["Z"][i] )
					end
				end
			end
		end

		local SnakeDeadNum = Var[5]
		if IsAttack == 1 and SnakeDeadNum < SnakeNum then	-- 攻擊 還沒死完
			if Phase == 1 or Phase == 3 then
				LuaPE_ZONE8_02SCA_Message( 3 , C_DEFAULT )
				LuaPE_ZONE8_02SCA_Phase = 2
			end
			SetModeEX( Ankylo , EM_SetModeType_Move , false )	-- 不移動
			Hide( Ankylo )
			Show( Ankylo , RoomID )
		elseif IsAttack == 0 and SnakeDeadNum < SnakeNum then	-- 停止攻擊 還沒死完
			if Phase == 2 then
				LuaPE_ZONE8_02SCA_Message( 4 , C_SYSTEM )
				LuaPE_ZONE8_02SCA_Phase = 3
			end
			SetModeEX( Ankylo , EM_SetModeType_Move , true )	-- 移動
			MoveDirect( Ankylo , FlagX , FlagY , FlagZ )		-- 鐵脊龍移動
		elseif SnakeDeadNum == SnakeNum then
			if Phase == 2 then
				LuaPE_ZONE8_02SCA_Message( 5 , C_DEFAULT )
				LuaPE_ZONE8_02SCA_Phase = 4
			end
			if ReadRoleValue( Ankylo , EM_RoleValue_IsAttackMode ) ~= 1 then
				SetModeEX( Ankylo , EM_SetModeType_Move , true )	-- 移動
				MoveDirect( Ankylo , FlagX , FlagY , FlagZ )		-- 鐵脊龍移動
			end
		end

		if FlagGoID == 10 then
			if Wude == 0 and SnakeDeadNum < SnakeNum then
				Wude = 1
				LuaPE_ZONE8_02SCA_Message( 8 , C_DEFAULT )

				WriteRoleValue( Ankylo , EM_RoleValue_IsWalk , 0 )		-- 用跑的移動
				Hide( Ankylo )
				Show( Ankylo , RoomID )

				for k = 1 , SnakeNum do
					if Snake[k] ~= nil then
						SetModeEx( Snake[k] , EM_SetModeType_Strikback , false )	-- 反擊
						SetModeEx( Snake[k] , EM_SetModeType_Searchenemy , false )	-- 索敵
						SetModeEx( Snake[k] , EM_SetModeType_Fight , false )	-- 可砍殺攻擊
						WriteRoleValue( Snake[k] , EM_RoleValue_IsWalk , 0 )		-- 用跑的移動
						Hide( Snake[k] )
						Show( Snake[k] , RoomID )
					end
				end
			end
		elseif FlagGoID == 11 then
			if Wude == 1 and SnakeDeadNum < SnakeNum then
				Wude = 2
				LuaPE_ZONE8_02SCA_Message( 9 , C_SYSTEM )

				WriteRoleValue( Ankylo , EM_RoleValue_IsWalk , 1 )		-- 用走的移動
				Hide( Ankylo )
				Show( Ankylo , RoomID )

				for l = 1 , SnakeNum do
					if Snake[l] ~= nil then
						SetModeEx( Snake[l] , EM_SetModeType_Strikback , true )	-- 反擊
						SetModeEx( Snake[l] , EM_SetModeType_Searchenemy , true )	-- 索敵
						SetModeEx( Snake[l] , EM_SetModeType_Fight , true )	-- 可砍殺攻擊
						WriteRoleValue( Snake[l] , EM_RoleValue_IsWalk , 1 )		-- 用走的移動
						Hide( Snake[l] )
						Show( Snake[l] , RoomID )
					end
				end
			end
		elseif FlagGoID == 15 then
			if CheckID( Ankylo ) == true then
				DelObj( Ankylo )
			end
			for i = 1 , SnakeNum do
				if Snake[i] ~= nil then
					if CheckID( Snake[i] ) == true then
						DelObj( Snake[i] )
					end
				end
			end
			LuaPE_ZONE8_02SCA_Message( 7 , C_SYSTEM )
			BeginPlot( Leader , "LuaPE_ZONE8_02SCA_Reset" , 0 )	-- 重置
			break;
		end
	end
end
--==================================================--



--==================================================--
--  補給攔截戰  死亡處理區                          --
--==================================================--
function LuaPE_ZONE8_02SCA_AnkyloDead()
	LuaPE_ZONE8_02SCA_Phase = 5
	LuaPE_ZONE8_02SCA_Message( 6 , C_DEFAULT )
	CallPlot( OwnerID() , "LuaPE_ZONE8_02SCA_AnkyloDeadDo" , TargetID() )
	return false
end
function LuaPE_ZONE8_02SCA_AnkyloDeadDo( NowTarget )

	local AnkyloID = 102713		-- 運輸鐵脊龍
	local Ankylo2ID = 102714	-- 憤怒鐵脊龍
	local Player = OwnerID()
	local WoodBoxID = { 113714 , 113714 , 113714 , 113714 , 113714 }
	local BarricoID = { 113715 , 113715 , 113715 , 113715 , 113715 }

	local X = ReadRoleValue( Player , EM_RoleValue_X )
 	local Y = ReadRoleValue( Player , EM_RoleValue_Y )
 	local Z = ReadRoleValue( Player , EM_RoleValue_Z )
	local Dir = ReadRoleValue( Player , EM_RoleValue_Dir )
	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local Angle = Dir
	local Width = 30
	local High = 20

	SetModeEX( Player , EM_SetModeType_Move , false )	-- 不移動
	CastSpell( Player , Player , 494395 )	-- 爆炸特效
	Sleep( 10 )

	-- 產生裝飾用木頭
	local WoodBox = {}
	local Barrico = {}
	for i = 1 , 3 do
		WoodBox[i] = CreateObj( WoodBoxID[i] , X-Width*math.sin(Angle*math.pi/180-Rand(Width)) , Y+High , Z-Width*math.cos(Angle*math.pi/180-Rand(Width)) , Dir+Rand(360) , 1 )
		AddToPartition( WoodBox[i] , RoomID )
		BeginPlot( WoodBox[i] , "LuaPE_ZONE8_02SCA_WoodBoxLife" , 0 )
		WoodBox[i+3] = CreateObj( WoodBoxID[i] , X+Width*math.sin(Angle*math.pi/180+Rand(Width)) , Y+High , Z+Width*math.cos(Angle*math.pi/180+Rand(Width)) , Dir+Rand(360) , 1 )
		AddToPartition( WoodBox[i+3] , RoomID )
		BeginPlot( WoodBox[i+3] , "LuaPE_ZONE8_02SCA_WoodBoxLife" , 0 )
		Barrico[i] = CreateObj( BarricoID[i] , X-Width*math.sin(Angle*math.pi/180-Rand(Width)) , Y+High , Z-Width*math.cos(Angle*math.pi/180-Rand(Width)) , Dir+Rand(360) , 1 )
		AddToPartition( Barrico[i] , RoomID )
		BeginPlot( Barrico[i] , "LuaPE_ZONE8_02SCA_WoodBoxLife" , 0 )
		Barrico[i+3] = CreateObj( BarricoID[i] , X+Width*math.sin(Angle*math.pi/180+Rand(Width)) , Y+High , Z+Width*math.cos(Angle*math.pi/180+Rand(Width)) , Dir+Rand(360) , 1 )
		AddToPartition( Barrico[i+3] , RoomID )
		BeginPlot( Barrico[i+3] , "LuaPE_ZONE8_02SCA_WoodBoxLife" , 0 )
	end

	-- 產生寶箱
	local BowBox1 = CreateObj( 113716 , X-Width*math.sin(Angle*math.pi/180) , Y+High , Z-Width*math.cos(Angle*math.pi/180) , Dir+90 , 1 )
	local BowBox2 = CreateObj( 113716 , X+Width*math.sin(Angle*math.pi/180) , Y+High , Z+Width*math.cos(Angle*math.pi/180) , Dir-90 , 1 )
	table.insert( LuaPE_ZONE8_02SCA_Obj , BowBox1 )
	table.insert( LuaPE_ZONE8_02SCA_Obj , BowBox2 )
	SetModeEx( BowBox1 , EM_SetModeType_Obstruct , true )		-- 阻擋
	SetModeEx( BowBox2 , EM_SetModeType_Obstruct , true )		-- 阻擋
	AddToPartition( BowBox1 , RoomID )
	AddToPartition( BowBox2 , RoomID )
	SetPlot( BowBox1 , "TOUCH" , "LuaPE_ZONE8_02SCA_BowBox1" , 15 )
	SetPlot( BowBox2 , "TOUCH" , "LuaPE_ZONE8_02SCA_BowBox2" , 15 )

	-- 產生憤怒鐵脊龍
	local Ankylo2 = CreateObjByObj( Ankylo2ID , Player )
	table.insert( LuaPE_ZONE8_02SCA_Obj , Ankylo2 )				-- 鐵脊龍加入物件管理
	BeginPlot( Ankylo2 , "LuaPE_ZONE8_02SCA_Ankylo2Life" , 0 )
	SetPlot( Ankylo2 , "DEAD" , "LuaPE_ZONE8_02SCA_Ankylo2Dead" , 0 )	-- 設定死亡劇情
	SetAttack( Ankylo2 , NowTarget )					-- 攻擊殺死運輸鐵脊龍的對象

	DelObj( Player )
	Sleep( 5 )

end
function LuaPE_ZONE8_02SCA_WoodBoxLife()
	local LifeTime = 50

	Sleep( LifeTime )
	if CheckID( OwnerID() ) == true then
		DelObj( OwnerID() )
	end
end
function LuaPE_ZONE8_02SCA_BowBox1()	-- 開寶箱動作
	local AlreadyOpen = 0

	if ReadRoleValue( TargetID() , EM_RoleValue_PID ) == 1 or CheckID( TargetID() ) == false then
		AlreadyOpen = 1
	end
	WriteRoleValue( TargetID() , EM_RoleValue_PID , 1 )

	if AlreadyOpen == 0 then
		local NeedSpace = 6
		if EmptyPacketCount( OwnerID() ) < NeedSpace then
			--Say(OwnerID() , EmptyPacketCount( OwnerID() ) )
			ScriptMessage( OwnerID(), OwnerID(), 1, "[MSG_SONGSONGBAGWARN]", C_DEFAULT )	-- 背包空格欄位不足，無法繼續取得物品！
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 0 )
			return
		elseif QueuePacketCount( OwnerID() ) > 0 then
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_PE_ZONE8_17]", C_DEFAULT )	-- 請等待物品完全進入到背包之中！
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 0 )
			return			
		end

		if BeginCastBar( OwnerID() , "[TREASURE_OPEN]" , 10 , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_END , 0 ) ~= 1 then
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SAY_NPC_BUSY]" , 0 )
			return
		end
		while true do
		Sleep( 2 )
			local CastBarStatus = CheckCastBar( OwnerID() )
			if ( CastBarStatus ~= 0 ) then 
				if ( CastBarStatus > 0) then -- 成功
					result = "OKOK"
					EndCastBar( OwnerID() , CastBarStatus )
					break;
				elseif ( CastBarStatus < 0 ) then -- 失敗
					result = "DAME"
					EndCastBar( OwnerID() , CastBarStatus )
					break;
				end
			end
		end

		if ( result == "OKOK" ) then
			local BoxContentID , BoxContentNum = LuaPE_ZONE8_02SCA_BoxContent()
			PlayMotionEX( TargetID() , ruFUSION_ACTORSTATE_ACTIVATE_BEGIN , ruFUSION_ACTORSTATE_ACTIVATE_LOOP )
			for i = 1 , table.getn(BoxContentID) do
				GiveBodyItem( OwnerID() , BoxContentID[i] , BoxContentNum[i] )
				Sleep(5)
			end
			Sleep( 10 )
			DelObj( TargetID() )
		else
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 0 )
		end
	end
end
function LuaPE_ZONE8_02SCA_BowBox2()	-- 開寶箱動作
	local AlreadyOpen = 0

	if ReadRoleValue( TargetID() , EM_RoleValue_PID ) == 1 or CheckID( TargetID() ) == false then
		AlreadyOpen = 1
	end
	WriteRoleValue( TargetID() , EM_RoleValue_PID , 1 )

	if AlreadyOpen == 0 then
		local NeedSpace = 6
		if EmptyPacketCount( OwnerID() ) < NeedSpace then
			ScriptMessage( OwnerID(), OwnerID(), 1, "[MSG_SONGSONGBAGWARN]", C_DEFAULT )	-- 背包空格欄位不足，無法繼續取得物品！
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 0 )
			return
		elseif QueuePacketCount( OwnerID() ) > 0 then
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_PE_ZONE8_17]", C_DEFAULT )	-- 請等待物品完全進入到背包之中！
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 0 )
			return			
		end

		if BeginCastBar( OwnerID() , "[TREASURE_OPEN]" , 10 , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_END , 0 ) ~= 1 then
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SAY_NPC_BUSY]" , 0 )
			return
		end
		while true do
		Sleep( 2 )
			local CastBarStatus = CheckCastBar( OwnerID() )
			if ( CastBarStatus ~= 0 ) then 
				if ( CastBarStatus > 0) then -- 成功
					result = "OKOK"
					EndCastBar( OwnerID() , CastBarStatus )
					break;
				elseif ( CastBarStatus < 0 ) then -- 失敗
					result = "DAME"
					EndCastBar( OwnerID() , CastBarStatus )
					break;
				end
			end
		end

		if ( result == "OKOK" ) then
			local BoxContentID , BoxContentNum = LuaPE_ZONE8_02SCA_BoxContent()
			PlayMotionEX( TargetID() , ruFUSION_ACTORSTATE_ACTIVATE_BEGIN , ruFUSION_ACTORSTATE_ACTIVATE_LOOP )
			for i = 1 , table.getn(BoxContentID) do
				GiveBodyItem( OwnerID() , BoxContentID[i] , BoxContentNum[i] )
				Sleep(5)
			end
			Sleep( 10 )
			DelObj( TargetID() )
		else
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 0 )
		end
	end
end
function LuaPE_ZONE8_02SCA_Ankylo2Life()	-- 憤怒鐵脊龍的生存時間
	local LifeTime = 3000	-- 五分鐘

	Sleep( LifeTime )
	while true do
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
		if AttackTarget == 0 then
			if CheckID( OwnerID() ) == true then
				local Reset = LuaPE_ZONE8_02SCA_Ankylo2Dead()
				DelObj( OwnerID() )
			end
			break;
		end
		Sleep( 5 )
	end
end
function LuaPE_ZONE8_02SCA_Ankylo2Dead()	-- 憤怒鐵脊龍也死亡就重置整個公眾
	local Leader = LuaPE_ZONE8_02SCA_Var[1]

	BeginPlot( Leader , "LuaPE_ZONE8_02SCA_Reset" , 0 )
	return true
end
function LuaPE_ZONE8_02SCA_SnakeDead()
	local Var = LuaPE_ZONE8_02SCA_Var

	local Ankylo = Var[2]
	local Snake = Var[4]
	local SnakeDeadNum = Var[5]
	local RoomID = 0

	local SnakeNum = 5	-- 這邊只產生 前跟左右兩邊的護衛

	for i = 1 , SnakeNum do
		if Snake[i] ~= nil then
			if Snake[i] == OwnerID() then
				SnakeDeadNum = SnakeDeadNum + 1
				LuaPE_ZONE8_02SCA_Var[5] = SnakeDeadNum
				table.remove( Snake , i )	
				break;
			end
		end
	end

	if SnakeDeadNum >= SnakeNum then	--只殺五隻
		SetModeEx( Ankylo , EM_SetModeType_Mark , true )		-- 標記
		SetModeEx( Ankylo , EM_SetModeType_Strikback , true )		-- 反擊
		SetModeEx( Ankylo , EM_SetModeType_Searchenemy , true )		-- 索敵
		SetModeEx( Ankylo , EM_SetModeType_Fight , true )		-- 可砍殺攻擊
		WriteRoleValue( Ankylo , EM_RoleValue_IsWalk , 0 )		-- 用走的移動
		Hide( Ankylo )
		Show( Ankylo , RoomID )
	end
end
--==================================================--



--==================================================--
--  補給攔截戰  啟動處理區                          --
--==================================================--
function LuaPE_ZONE8_02SCA_Reset()
	local ResetTime = LuaPE_ZONE8_02SCA_Var[11]		-- 秒
	local Mode = 1

	LuaPE_ZONE8_02SCA_Message( 11 , C_SYSTEM )
	Sleep( ResetTime*10 )
	LuaPE_ZONE8_02SCA_Start( Mode )
end
--==================================================----==================================================--
function LuaPE_ZONE8_02SCA_BoxContent()

	local BoxContentID = {}
	local BoxContentNum = {}

	BoxContentID[1] = 206249	-- 一袋溶解石
	BoxContentNum[1] = 2

	BoxContentID[2] = 206250	-- 一袋符文
	BoxContentNum[2] = 1

	local RNDType = Rand( 100 ) + 1	-- 產生 1~100 的亂數
	
	if RNDType > 1 and RNDType <= 50 then
		local MaterialID = {}	-- 材料LV53
		MaterialID[1] = 200242	-- 巫鐵礦
		MaterialID[2] = 200306	-- 紫杉木
		MaterialID[3] = 200345	-- 月石斛
		local MaterialNum = {}
		MaterialNum[1] = 20
		MaterialNum[2] = 20
		MaterialNum[3] = 20

		BoxContentID[3] = MaterialID[1]	-- 巫鐵礦
		BoxContentNum[3] = MaterialNum[1]
		BoxContentID[4] = MaterialID[2]	-- 紫杉木
		BoxContentNum[4] = MaterialNum[2]
		BoxContentID[5] = MaterialID[3]	-- 月石斛
		BoxContentNum[5] = MaterialNum[3]


		local MaterialRuneID = {}	-- 生產符文
		MaterialRuneID[1] = 200850	-- 連接
		MaterialRuneID[2] = 200851	-- 冷卻
		MaterialRuneID[3] = 200852	-- 活化
		MaterialRuneID[4] = 200853	-- 分解
		MaterialRuneID[5] = 200854	-- 純化
		MaterialRuneID[6] = 200855	-- 混合
		local MaterialRuneNum = {}
		MaterialRuneNum[1] = 10
		MaterialRuneNum[2] = 10
		MaterialRuneNum[3] = 10
		MaterialRuneNum[4] = 10
		MaterialRuneNum[5] = 10
		MaterialRuneNum[6] = 10

		local RND1 = Rand( 6 ) + 1	-- 產生 1~6 的亂數
		BoxContentID[6] = MaterialRuneID[RND1]	-- 生產符文
		BoxContentNum[6] = MaterialRuneNum[RND1]

	elseif RNDType > 50 and RNDType <= 100 then
		local PotionID = {}	--  必送藥水
		PotionID[1] = 204889	-- 神靈藥草
		PotionID[2] = 204890	-- 神靈元素石
		PotionID[3] = 200229	-- 強效療傷藥
		PotionID[4] = 200270	-- 強效靈感藥水
		local PotionNum = {}
		PotionNum[1] = 10
		PotionNum[2] = 10
		PotionNum[3] = 4
		PotionNum[4] = 4

		BoxContentID[3] = PotionID[1]	-- 神靈藥草
		BoxContentNum[3] = PotionNum[1]
		BoxContentID[4] = PotionID[2]	-- 神靈元素石
		BoxContentNum[4] = PotionNum[2]
		BoxContentID[5] = PotionID[3]	-- 強效療傷藥
		BoxContentNum[5] = PotionNum[3]
		BoxContentID[6] = PotionID[4]	-- 強效靈感藥水
		BoxContentNum[6] = PotionNum[4]
	end

	return BoxContentID , BoxContentNum;

end