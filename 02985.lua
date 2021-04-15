--=======================================================
--	<劇情表演通用排隊函式>
--
--	需知：
--		觸發表演劇情的對話用NPC，EM_RoleValue_Register+1不要用，留給此系統
--
--	事前準備：
--		任務NPC*1		用來觸發表演劇情的對話用NPC
--		基本法術*1		一個用來判斷Client顯像的buff，決定玩家是否可以看見NPC的演出
--		Client劇情		幫要演出的NPC掛上Client顯像劇情，用上面那個buff當判斷
--		特殊編號		一組編號，給全域變數辨識用的，請一定要夠特殊，建議直接用任務編號，如果沒有任務就自創獨特編號
--
--=======================================================
function FN_Quest_Acting_plot( QuestID, BuffID, Func )
	--從NPC的對話劇情接到這邊來，記得代入參數特殊編號
	--這邊會偵測表演是否在進行中，如果沒在進行則直接開始表演，如果表演中則把玩家排入等待的佇列
	local Player = OwnerID()
	local NPC = TargetID()
	local InActing = ReadRoleValue( NPC, EM_RoleValue_Register+1 )
	local ZoneID = ReadRoleValue( NPC, EM_RoleValue_ZoneID )
	--檢查全域變數是否存在，創建全域變數
	if Global_player_queue == nil then Global_player_queue = {} end
	if Global_player_queue[ZoneID] == nil then Global_player_queue[ZoneID] = {} end
	if Global_player_queue[ZoneID][QuestID] == nil then Global_player_queue[ZoneID][QuestID] = {} end
	--檢查是否在表演中，"0"=否，"1"=是，"2"=即將開始
	DebugMSG(0,0,"EM_RoleValue_Register="..InActing)
	if InActing == 1 or InActing == 2 then
		if FN_InTableCheck( Player, Global_player_queue[ZoneID][QuestID] ) == false then
			--確認玩家不在queue,裡面，把他塞入
			table.insert( Global_player_queue[ZoneID][QuestID], Player )
			if InActing == 1 then
				ScriptMessage( Player, Player, 1, "[SC_QUESTSTRING_17]", 0 )	--劇情演出正在進行中，將您排入下一輪的等待佇列中，若離開此區域則自動離開佇列
			else
				ScriptMessage( Player, Player, 1, "[SC_QUESTSTRING_20]", 0 )	--劇情演出即將開始，請不要走遠				
			end
		else
			ScriptMessage( Player, Player, 1, "[SC_QUESTSTRING_18]", 0 )	--您已經在等待佇列中，請等待下一輪劇情演出
		end
	else
		CallPlot( NPC, "FN_Quest_Acting_Main", Player, NPC, Func, QuestID, BuffID )	--開始表演
	end
	CloseSpeak( Player )
end

function FN_Quest_Acting_Main( Player, NPC, Func, QuestID, BuffID )
	WriteRoleValue( NPC, EM_RoleValue_Register+1, 1 )		--寫為表演正在進行中
	--
	local ActPlayerTable = {}	--這個Table是處理所有參與劇情的玩家，會在之後有所更動
	if type(Player) == "table" then
		ActPlayerTable = Player
	else
		table.insert( ActPlayerTable, Player )
	end

	--=================劇情表演開始=============
	--這邊要串接過去表演的主要劇情，這邊會代入兩個參數，參與劇情的玩家們 ActPlayerTable & 對話觸發的NPC
	CallPlot( NPC, Func, ActPlayerTable, NPC )
	--=================劇情表演結束=============
	Sleep( 50 )
	while true do
		Sleep( 10 )
		--進入一個迴圈檢查，如果看表演的玩家身上都沒有看表演用的Buff，表示表演結束了，可以呼叫重來plot
		local ShowOverCheck = true
		for p = 1, #ActPlayerTable do
			if CheckID( ActPlayerTable[p] ) == true and CheckBuff( ActPlayerTable[p], BuffID ) == true then
				ShowOverCheck = false
			end
		end
		if ShowOverCheck == true then
			CallPlot( NPC, "FN_Quest_Acting_ReActCheck", NPC, Func, QuestID, BuffID )
			return
		end
	end
end

function FN_Quest_Acting_ReActCheck( NPC, Func, QuestID, BuffID )
	local ZoneID = ReadRoleValue( NPC, EM_RoleValue_ZoneID )
	--表演結束之後跑這函式，判斷佇列中有沒有等待的玩家，來決定是否要再演一次

	if #Global_player_queue[ZoneID][QuestID] > 0 then
		-- 大於0表示佇列中有等待的玩家
		for i = 1, #Global_player_queue[ZoneID][QuestID] do
			CallPlot( Global_player_queue[ZoneID][QuestID][i], "FN_Quest_Acting_AskJoin", NPC, QuestID )
		end
		Global_player_queue[ZoneID][QuestID] = {}					--清空queue
		WriteRoleValue( NPC, EM_RoleValue_Register+1, 2 )				--寫為準備開始
		Sleep(400)									--等待40秒
		--等待的這段時間裡，點選願意加入劇情的玩家，或是跟NPC報名的玩家都會重新被加入ActPlayerQueueTable
		--時間到之後這些玩家就會開始新一輪的劇情表演
		if #Global_player_queue[ZoneID][QuestID] >= 1 then		--至少有一個玩家表示要參加
			CallPlot( NPC, "FN_Quest_Acting_Main", Global_player_queue[ZoneID][QuestID], NPC, Func, QuestID, BuffID )	--開始表演
			Global_player_queue[ZoneID][QuestID] = {}
		else								--原本在佇列中的玩家都沒有要參加
			WriteRoleValue( NPC, EM_RoleValue_Register+1, 0 )	--所以寫為0，表示隨時都可以進行表演
		end
	else
		WriteRoleValue( NPC, EM_RoleValue_Register+1, 0 )		--佇列中沒有等待的玩家，寫為表演結束，可以開始下一次表演
	end
end

function FN_Quest_Acting_AskJoin( NPC, QuestID )
	--開始一個詢問視窗來詢問玩家要不要傳送過去看劇情，詢問視窗存在40秒
	local Player = OwnerID()
	local ZoneID = ReadRoleValue( NPC, EM_RoleValue_ZoneID )
	local PlayerZoneID = ReadRoleValue( Player, EM_RoleValue_ZoneID )
	if PlayerZoneID == ZoneID then
		--玩家在同Zone才詢問
		--開啟詢問視窗
		DialogCreate( Player, EM_LuaDialogType_YesNo, "[SC_QUESTSTRING_19]")
		DialogSelectStr( Player, "[SO_GETVOC_YES]" )
		DialogSelectStr( Player, "[SO_NEWHANDNO]" )
		--等待玩家選擇，至多40秒
		local player_choice = LuaS_DialogRePort_TwoChoose_40s(Player)
		--延遲選擇，重新判斷
		if player_choice == "Yes" then
			local x,y,z,Dir = DW_Location( NPC )
			SetPos( Player, x, y, z, Dir )
			--
			table.insert( Global_player_queue[ZoneID][QuestID], Player )
		end
	end
end

function FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )	--檢查正在看表演的玩家狀態函式
	for i = #ActPlayerTable, 1, -1 do
		local PlayerID = ActPlayerTable[i]
		if GetDistance( PlayerID, NPC ) > 200 or CheckQuest( PlayerID, QuestID, 0 ) == false then		--超過距離 / 放棄任務 就取消看表演資格
			DebugMSG(0,0,"Not in the show, remove from table")
			CancelBuff( PlayerID, BuffID )
			table.remove( ActPlayerTable, i )
			--停止播放劇情bgm 回復原本的bgm
			StopSound( PlayerID, MusicID[PlayerID] )
			Lua_PlayBGM( PlayerID )
		end
	end
	--把符合條件的玩家傳回去
	return ActPlayerTable
end