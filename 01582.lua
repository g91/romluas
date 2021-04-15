function Lua_Hao_TitleSys_Give_Title(Num)

	local O_ID = OwnerID()
	local RoomID = ReadRoleValue( O_ID , EM_RoleValue_RoomID )
	local Obj = Role:new( O_ID )  -- 取得玩家 X.Y.Z.Dir值
	local BaseX = Obj :X()
 	local BaseY = Obj :Y()
 	local BaseZ = Obj :Z()
	local BaseDir = Obj:Dir()
	local QBOX = CreateObj( 113105 , BaseX , BaseY , BaseZ , BaseDir , 1 ) --在玩家(球體)座標 X.Y.Z.Dir 身上準備創立物件
	SetModeEx( QBOX , EM_SetModeType_Strikback , false )--反擊
	SetModeEx( QBOX , EM_SetModeType_SearchenemyIgnore , false )--被搜尋
	SetModeEx( QBOX , EM_SetModeType_Obstruct , false )--阻擋
	SetModeEx( QBOX , EM_SetModeType_Mark , false )--標記
	SetModeEx( QBOX , EM_SetModeType_Move , false )--移動
	SetModeEx( QBOX , EM_SetModeType_Searchenemy , false )--索敵
	SetModeEx( QBOX , EM_SetModeType_HideName , false )--名稱
	SetModeEx( QBOX , EM_SetModeType_ShowRoleHead , false )--頭像框
	SetModeEx( QBOX , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( QBOX , EM_SetModeType_Drag , false )--阻力
	SetModeEx( QBOX , EM_SetModeType_Show , true )--顯示
	AddToPartition( QBOX , RoomID ) -- 建立物件
	Hide(QBOX)
	CallPlot( QBOX , "Lua_Hao_TitleSys_Build_QBox" , O_ID , Num )
	CallPlot( QBOX , "Lua_Hao_TitleSys_Del_QBox" , O_ID )
end

function Lua_Hao_TitleSys_Build_QBox( Player , Num )

	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local Count = 0

	if Num == nil then
		DebugMsg( Player , Room , "Entry error" )
		return
	elseif Num == 0 or Num == 100 then	-- 給予目前有稀有度的全部稱號、給予全部稱號
		for i = 530000 , 530999 , 1 do
			if CountBodyItem( Player , i ) < 1 then
				local Type = {}
				Type[1] = GameObjInfo_int( i , "Classify1" )
				Type[2] = GameObjInfo_int( i , "Classify2" )
				Type[3] = GameObjInfo_int( i , "OutputLanguage" )
				Type[4] = GameObjInfo_int( i , "Rare" )
			--	Type[4] = GameObjInfo_int( i , "Translate" )
			--	DebugMsg( Player , Room , i..", [1] = "..Type[1]..", [2] = "..Type[2]..", [3] = "..Type[3] )
				if Type[1] ~= nil then
					if Num == 100 then
						if Type[1] >= 0 and Type[2] >= 0 and Type[3] == -1 and Type[4] >= 1 then
						--	DebugMsg( Player , Room , i )
							GiveBodyItem( Player , i , 1 )
							Count = Count + 1
							DebugMsg( Player , Room , Count )
							Sleep(1)
						end
					else
						if Type[1] >= 0 and Type[2] >= 0 and Type[3] == -1 then
						--	DebugMsg( Player , Room , i )
							GiveBodyItem( Player , i , 1 )
							Count = Count + 1
							DebugMsg( Player , Room , Count )
							Sleep(1)
						end
					end
				end
			end
		end
		if Num == 0 then
			DebugMsg( Player , Room , "Get Rare Titles" )
		elseif Num == 100 then
			DebugMsg( Player , Room , "Get all Titles" )
		end
	elseif Num == 1 or Num == 101 then	-- 刪除目前有稀有度的全部稱號、刪除全部稱號
		for i = 530000 , 530999 , 1 do
			if CountBodyItem( Player , i ) == 1 then
				local Type = {}
				Type[1] = GameObjInfo_int( i , "Rare" )
				if Num == 101 then
					if Type[1] >= 1 then 
						DelBodyItem( Player , i , 1 )
						Count = Count + 1
						DebugMsg( Player , Room , Count )
						if i % 100 == 0 then
							sleep(1)
						end
					end
				else
					if Type[1] ~= nil then 
						DelBodyItem( Player , i , 1 )
						Count = Count + 1
						DebugMsg( Player , Room , Count )
						if i % 100 == 0 then
							sleep(1)
						end
					end
				end
			end
		end
		if Num == 1 then
			DebugMsg( Player , Room , "Del Rare Titles" )
		elseif Num == 101 then
			DebugMsg( Player , Room , "Del all Titles" )
		end
	elseif Num >= 530000 and Num <= 530999 then
		if CountBodyItem( Player , i ) == 1 then
			DelBodyItem( Player , i , 1 )
		end
		DebugMsg( Player , Room , "Del Title "..Num )
	end
	DelObj(OwnerID())
end

function Lua_Hao_TitleSys_Del_QBox( Player )	-- 

	while CheckID(Player) == true do	--由 NPC 自己判斷是否要刪除自己
		sleep(10)
	end
	DelObj( OwnerID() )
end

function Lua_Hao_TitleSys_Check_Rare( Rare )	-- 回傳具有指定徽章等級的稱號數量(測試專用)

	local Player = OwnerID()
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local Count = 0

	for i = 530000 , 530999 , 1 do
		if CountBodyItem( Player , i ) == 1 then
			local Type = GameObjInfo_int( i , "Rare" )
			if Type == Rare then
			--	DebugMsg( Player , Room , "Title = "..i )
				Say( Player , "Title "..i.." = ".."["..i.."]" )
				Count = Count + 1
			end
		end
	end
	DebugMsg( Player , Room , "Count = "..Count )
	return Count
end

function Lua_Hao_TitleSys_Q_Check_Rare( Obj , Rare )	-- 回傳具有指定徽章等級的稱號數量(任務判斷用)

	local Room = ReadRoleValue( Obj , EM_RoleValue_RoomID )
	local Count = 0

	for i = 530000 , 530999 , 1 do
		if CountBodyItem( Obj , i ) == 1 then
			local Type = GameObjInfo_int( i , "Rare" )
			if Type == Rare then
			--	DebugMsg( Player , Room , "Title = "..i )
				Count = Count + 1
			end
		end
	end

	for i = 531000 , 531999 , 1 do
		if CountBodyItem( Obj , i ) == 1 then
			local Type = GameObjInfo_int( i , "Rare" )
			if Type == Rare then
			--	DebugMsg( Player , Room , "Title = "..i )
				Count = Count + 1
			end
		end
	end
	DebugMsg( Obj , Room , "Count = "..Count )
	return Count
end

function Lua_Hao_TitleSys_Return_Lv_Exp(Obj)	-- 回傳目標的徽章等級與經驗值

	local Room = ReadRoleValue( Obj , EM_RoleValue_RoomID )

	local Lv = ReadRoleValue( Obj , EM_RoleValue_TitleSys_Lv )	-- 徽章等級
	local Exp = ReadRoleValue( Obj , EM_RoleValue_TitleSys_Exp )	-- 當前經驗值
	DebugMsg( Obj , Room , "Lv = "..Lv.." , ".."Exp = "..Exp )
	return Lv , Exp
end

function Lua_Hao_TitleSys_Return_Lv_Exp_2()	-- 回傳目標

	local Lv , Exp = Lua_Hao_TitleSys_Return_Lv_Exp(OwnerID())
end

function Lua_Hao_TitleSys_Set_Lv(Lv)		-- 寫入徽章介面的等級
	local Player = OwnerID()
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local Value = {}
	Value[1] = ReadRoleValue( Player , EM_RoleValue_TitleSys_Lv )	-- 舊有徽章等級
	WriteRoleValue( Player , EM_RoleValue_TitleSys_Lv , Lv )	-- 徽章等級
	Value[2] = ReadRoleValue( Player , EM_RoleValue_TitleSys_Lv )	-- 修改徽章等級
	DebugMsg( Player , Room , "Lv = "..Value[1].." , New Lv = "..Value[2] )
end

function Lua_Hao_TitleSys_Set_Exp(Exp)	-- 寫入徽章介面的經驗值
	local Player = OwnerID()
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local Value = {}
	Value[1] = ReadRoleValue( Player , EM_RoleValue_TitleSys_Exp )	-- 舊有經驗值
	WriteRoleValue( Player , EM_RoleValue_TitleSys_Exp , Exp )		-- 寫入經驗值
	Value[2] = ReadRoleValue( Player , EM_RoleValue_TitleSys_Exp )	-- 修改經驗值
	DebugMsg( Player , Room , "Exp = "..Value[1].." , New Exp = "..Value[2] )
end

function Lua_Hao_TitleSys_Set_Famous(Famous)	-- 寫入徽章介面的名聲
	local Player = OwnerID()
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local Value = {}
	Value[1] = ReadRoleValue( Player , EM_RoleValue_TitleSys_Famous )	-- 舊有名聲
	WriteRoleValue( Player , EM_RoleValue_TitleSys_Famous , Famous )	-- 寫入名聲
	Value[2] = ReadRoleValue( Player , EM_RoleValue_TitleSys_Famous )	-- 修改名聲
	DebugMsg( Player , Room , "Famous = "..Value[1].." , New Famous = "..Value[2] )
end

function Lua_Hao_TitleSys_Return_Famous()	-- 回傳徽章介面的名聲
	local Player = OwnerID()
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local Value = {}
	Value[1] = ReadRoleValue( Player , EM_RoleValue_TitleSys_Famous )	-- 舊有名聲
	DebugMsg( Player , Room , "Famous = "..Value[1] )
end

function Lua_Hao_TitleSys_Click_Tool( Player , KeyItemTable , TitleFlag )

	local Count = 0
	if CountBodyItem( Player , TitleFlag ) < 1 then
		for i = 1 , table.getn(KeyItemTable) , 1 do
			if CheckFlag( Player , KeyItemTable[i] ) == true then
				DebugMsg( 0 , 0 , "TitleFlag = "..TitleFlag )
				GiveBodyItem( Player , TitleFlag , 1 )
				Count = Count + 1
				break
			end
		end
	end
	return Count
end

function Lua_Hao_TitleSys_Click_Tool_2( Player , KeyItemTable , TitleFlag )

	local Count = 0
	if CountBodyItem( Player , TitleFlag ) < 1 then
		for i = 1 , table.getn(KeyItemTable) , 1 do
			if CountBodyItem( Player , KeyItemTable[i] ) >= 1 then
				DebugMsg( 0 , 0 , "TitleFlag = "..TitleFlag )
				GiveBodyItem( Player , TitleFlag , 1 )
				Count = Count + 1
				break
			end
		end
	end
	return Count
end

function Lua_Hao_TitleSys_Click_Check( Player )
-- 2011.08.22 新增稱號系統稱號 ----

	local KeyItemTable , Select , TitleFlag
	local Count , LifeisGood = 0 , 0
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local Total = 0

	KeyItemTable = { 540269 , 540270 , 540333 }	-- 重要物品
	TitleFlag = 530016				-- 頭銜
	Total = Total + Lua_Hao_TitleSys_Click_Tool( Player , KeyItemTable , TitleFlag )
	-- 採集紀錄日記

	KeyItemTable = { 540340 , 540341 , 540342 }
	TitleFlag = 530017
	Total = Total + Lua_Hao_TitleSys_Click_Tool( Player , KeyItemTable , TitleFlag )
	-- 採集情未了

	KeyItemTable = { 540349 , 540350 , 540351 }
	TitleFlag = 530043
	Total = Total + Lua_Hao_TitleSys_Click_Tool( Player , KeyItemTable , TitleFlag )
	-- 挖掘行動

	KeyItemTable = { 540358 , 540359 , 540360 }
	TitleFlag = 530044
	Total = Total + Lua_Hao_TitleSys_Click_Tool( Player , KeyItemTable , TitleFlag )
	-- 零秒出手

	KeyItemTable = { 540268 , 540334 , 540335 , 540336 , 540337 , 540338 }
	TitleFlag = 530045
	Total = Total + Lua_Hao_TitleSys_Click_Tool( Player , KeyItemTable , TitleFlag )
	-- 與製造有約

	KeyItemTable = { 540343 , 540344 , 540345 , 540346 , 540347 , 540348 }
	TitleFlag = 530046
	Total = Total + Lua_Hao_TitleSys_Click_Tool( Player , KeyItemTable , TitleFlag )
	-- 製造方程式

	KeyItemTable = { 540352 , 540353 , 540354 , 540355 , 540356 , 540357 }
	TitleFlag = 530047
	Total = Total + Lua_Hao_TitleSys_Click_Tool( Player , KeyItemTable , TitleFlag )
	-- 總是一個人練習

	KeyItemTable = { 540361 , 540362 , 540363 , 540364 , 540365 , 540366 }
	TitleFlag = 530048
	Total = Total + Lua_Hao_TitleSys_Click_Tool( Player , KeyItemTable , TitleFlag )
	-- 製造沒有假期

	Count = 0
	KeyItemTable = { 540352 , 540353 , 540354 , 540355 , 540356 , 540357 }
	if CountBodyItem( Player , 530074 ) < 1 then
		for i = 1 , table.getn(KeyItemTable) , 1 do
			if CheckFlag( Player , KeyItemTable[i] ) == true then
				Count = Count + 1
				if Count >= 3 then
					GiveBodyItem( Player , 530074 , 1 )
					Total = Total + 1
					break
				end
			end
		end
	end
	-- 純手工製造

	KeyItemTable = {}
	Select = { 6 , 3 , 1 }
	LifeisGood = 0
	KeyItemTable[1] = { 540340 , 540341 , 540342 , 540343 , 540344 , 540345 , 540346 , 540347 , 540348 , 542887 } -- 工匠
	KeyItemTable[2] = { 540349 , 540350 , 540351 , 540352 , 540353 , 540354 , 540355 , 540356 , 540357 , 542888 } -- 專精
	KeyItemTable[3] = { 540358 , 540359 , 540360 , 540361 , 540362 , 540363 , 540364 , 540365 , 540366 , 542889 } -- 大師
	if CountBodyItem( Player , 530076 ) < 1 then
		for i = 1 , table.getn(KeyItemTable) , 1 do
			Count = 0
			for j = 1 , table.getn(KeyItemTable[i]) , 1 do
				if CheckFlag( Player , KeyItemTable[i][j] ) == true then
					Count = Count + 1
					if Count >= Select[i] then
						LifeisGood = LifeisGood+1
						break
					end
				end
			end
			if LifeisGood == 3 then
				GiveBodyItem( Player , 530076 , 1 )
				Total = Total + 1
			end
		end
	end
	-- 1%天分，99%努力

	Count = 0
	KeyItemTable = { 540269 , 540270 , 540333 , 540268 , 540334 , 540335 , 540336 , 540337 , 540338 , 542886 }	-- 學徒
	if CountBodyItem( Player , 530049 ) < 1 then
		for i = 1 , table.getn(KeyItemTable) , 1 do
			if CheckFlag( Player , KeyItemTable[i] ) == true then
				Count = Count + 1
				if Count >= 10 then
					GiveBodyItem( Player , 530049 , 1 )
					Total = Total + 1
					break
				end
			end
		end
	end
	-- 萬事皆可達

	Count = 0
	KeyItemTable = { 540343 , 540344 , 540345 , 540346 , 540347 , 540348 }	-- 製造類工匠
	if CountBodyItem( Player , 530050 ) < 1 then
		for i = 1 , table.getn(KeyItemTable) , 1 do
			if CheckFlag( Player , KeyItemTable[i] ) == true then
				Count = Count + 1
				if Count >= 6 then
					GiveBodyItem( Player , 530050 , 1 )
					Total = Total + 1
					break
				end
			end
		end
	end
	-- 製造百分百

	Count = 0
	KeyItemTable = { 540340 , 540341 , 540342 }	-- 採集類工匠
	if CountBodyItem( Player , 530073 ) < 1 then
		for i = 1 , table.getn(KeyItemTable) , 1 do
			if CheckFlag( Player , KeyItemTable[i] ) == true then
				Count = Count + 1
				if Count >= 3 then
					GiveBodyItem( Player , 530073 , 1 )
					Total = Total + 1
					break
				end
			end
		end
	end
	-- 採集萬歲!

	Count = 0
	KeyItemTable = { 540349 , 540350 , 540351 }	-- 採集類專精
	if CountBodyItem( Player , 530075 ) < 1 then
		for i = 1 , table.getn(KeyItemTable) , 1 do
			if CheckFlag( Player , KeyItemTable[i] ) == true then
				Count = Count + 1
				if Count >= 3 then
					GiveBodyItem( Player , 530075 , 1 )
					Total = Total + 1
					break
				end
			end
		end
	end
	-- 我要成為採集王

	KeyItemTable = { 530433 , 530434 , 530435 , 530436 , 530437 , 530438 , 530439 , 530440 , 530441 , 530442 } -- 尉級
	TitleFlag = 530077
	Total = Total + Lua_Hao_TitleSys_Click_Tool_2( Player , KeyItemTable , TitleFlag )
	-- 我要活下去

	KeyItemTable = { 530443 , 530444 , 530445 , 530446 , 530447 , 530448 , 530451 , 530452 , 530453 , 530454 , 530455 , 530456 , 530449 , 530450 , 530457 , 530458 , 530459 , 530460 } -- 校級
	TitleFlag = 530078
	Total = Total + Lua_Hao_TitleSys_Click_Tool_2( Player , KeyItemTable , TitleFlag )
	-- 全面反擊

	KeyItemTable = { 530461 , 530462 , 530463 , 530464 , 530465 , 530466 , 530467 , 530468 , 530469 , 530470 , 530471 , 530472 , 530473 , 530474 , 530475 , 530476 , 530477 , 530513 } -- 將級
	TitleFlag = 530079
	Total = Total + Lua_Hao_TitleSys_Click_Tool_2( Player , KeyItemTable , TitleFlag )
	-- 光榮時刻

	Count = 0
	while Count <= 90 do
		-- 2013.04.29 修正玩家於稱號介面中按下檢查後，ScriptMsg會提示玩家取得稱號，但卻不會取得任何稱號的問題。
		if CountBodyItem( Player , 530514+Count ) >= 1 and CountBodyItem( Player , 530080 ) == 0 then
			GiveBodyItem( Player , 530080 , 1 )
			Total = Total + 1
			break
		end
		Count = Count + 1
	end
	-- 戰爭領主

	KeyItemTable = {}
	KeyItemTable[1] = { 530433 } -- 少尉
	KeyItemTable[2] = { 530434 , 530435 , 530436 } -- 中尉
	KeyItemTable[3] = { 530437 , 530438 , 530439 , 530440 , 530441 , 530442 } -- 上尉
	Count = 0
	for i = 1 , table.getn(KeyItemTable) , 1 do
		for j = 1 , table.getn(KeyItemTable[i]) , 1 do
			if CountBodyItem( Player , KeyItemTable[i][j] ) >= 1 then
				Count = Count + 1
				break
			end
		end
		-- 2013.04.29 修正玩家於稱號介面中按下檢查後，ScriptMsg會提示玩家取得稱號，但卻不會取得任何稱號的問題。
		if Count == 3 and CountBodyItem( Player , 530081 ) == 0 then
			GiveBodyItem( Player , 530081 , 1 )
			Total = Total + 1
		end
	end
	-- 浴血勇士

	KeyItemTable = {}
	KeyItemTable[1] = { 530443 , 530444 , 530445 , 530449 , 530450 } -- 少校
	KeyItemTable[2] = { 530446 , 530447 , 530448 , 530457 , 530458 } -- 中校
	KeyItemTable[3] = { 530451 , 530452 , 530453 , 530454 , 530455 , 530456 , 530459 , 530460 } -- 上校
	Count = 0
	for i = 1 , table.getn(KeyItemTable) , 1 do
		for j = 1 , table.getn(KeyItemTable[i]) , 1 do
			if CountBodyItem( Player , KeyItemTable[i][j] ) >= 1 then
				Count = Count + 1
				break
			end
		end
		-- 2013.04.29 修正玩家於稱號介面中按下檢查後，ScriptMsg會提示玩家取得稱號，但卻不會取得任何稱號的問題。		
		if Count == 3 and CountBodyItem( Player , 530082 ) == 0 then
			GiveBodyItem( Player , 530082 , 1 )
			Total = Total + 1
		end
	end
	-- 征戰隊長

	KeyItemTable = {}
	KeyItemTable[1] = { 530461 , 530462 , 530463 , 530473 , 530474 } -- 少將
	KeyItemTable[2] = { 530464 , 530465 , 530466 , 530475 , 530476 } -- 中將
	KeyItemTable[3] = { 530467 , 530468 , 530469 , 530470 , 530471 , 530472 , 530477 , 530513 } -- 上將
	Count = 0
	for i = 1 , table.getn(KeyItemTable) , 1 do
		for j = 1 , table.getn(KeyItemTable[i]) , 1 do
			if CountBodyItem( Player , KeyItemTable[i][j] ) >= 1 then
				Count = Count + 1
				break
			end
		end
		-- 2013.04.29 修正玩家於稱號介面中按下檢查後，ScriptMsg會提示玩家取得稱號，但卻不會取得任何稱號的問題。		
		if Count == 3 and CountBodyItem( Player , 530083 )  == 0 then
			GiveBodyItem( Player , 530083 , 1 )
			Total = Total + 1
		end
	end
	-- 王國之心

	KeyItemTable = {}
	KeyItemTable[1] = 530514 -- 男爵 530514 ~ 530531
	KeyItemTable[2] = 530532 -- 子爵 530532 ~ 530549
	KeyItemTable[3] = 530550 -- 伯爵 530550 ~ 530567
	KeyItemTable[4] = 530568 -- 侯爵 530568 ~ 530585
	KeyItemTable[5] = 530586 -- 公爵 530586 ~ 530603
	Count = 0
	for i = 1 , table.getn(KeyItemTable) , 1 do
		for j = 0 , 17 , 1 do
			if CountBodyItem( Player , KeyItemTable[i]+j ) >= 1 then
				Count = Count + 1
				break
			end
		end
		-- 2013.04.29 修正玩家於稱號介面中按下檢查後，ScriptMsg會提示玩家取得稱號，但卻不會取得任何稱號的問題。		
		if Count == 5 and CountBodyItem( Player , 530084 ) == 0 then
			GiveBodyItem( Player , 530084 , 1 )
			Total = Total + 1
		end
	end
	-- 兵臨天下
	return Total
end
-- 1%天分，99%努力 生產幸運加成 詳情請見 Script 701606
function Lua_TitleSys_530076(Check)

	local Player , Buff = OwnerID() , 508460
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )

	if Check == 0 then
		DebugMsg( Player , Room , "Effect disappeared" )
		CancelBuff( Player , Buff )
	elseif Check == 1 then
		DebugMsg( Player , Room , "Increases rarity for produced items by 25%" )
		AddBuff( Player , Buff , 0 , -1 )
	end
end