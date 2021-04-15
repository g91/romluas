function LuaFA_423908_01()					-- 掛 423908 接到任務劇情
--	local Player = OwnerID()
--	local Target = TargetID()
	WriteRoleValue(OwnerID(),EM_RoleValue_Register3,0)			-- 寄居蟹編號洗乾淨
--	Tell( Target , Player , "[SC_423908_01]" )	-- 海爾芬跟玩家耳提面命01
--	sleep (20)						-- 講話中間要休息一下不然太累
--	Tell( Target , Player , "[SC_423908_02]" )	-- 海爾芬跟玩家耳提面命02
end

function LuaFA_209051_01()										-- 使用寄居蟹（209051）的動作
	local CrabID
	local Player = OwnerID()
	local S_NotHere = "[SC_423908_03]"
	local S_JustHere = "[SC_423908_04]"
--	DebugMsg(0,0,FN_CountBuffLevel (Player,508836).."inPut")

	if CheckAcceptQuest (Player, 423908) ==  true						-- 如果接著任務423908
	and CheckBuff(Player,508792) == false then						-- 且 508792 操縱寄居蟹用buff不在身上
		if DW_CheckDis (Player, 780872, 0, 500) == false 
		and DW_CheckDis (Player, 780872, 1, 500) == false 
		and DW_CheckDis (Player, 780872, 2, 500) == false 
		and DW_CheckDis (Player, 780872, 3, 500) == false then				-- 抓跟判斷範圍用flag的距離，若太遠
			ScriptMessage( Player , Player , 1 , S_NotHere, C_Red )	-- 海爾芬隊長說的不是這邊…
			ScriptMessage( Player , Player , 0 , S_NotHere, C_Red )	-- 海爾芬隊長說的不是這邊…
		else											-- 在範圍內的話
			ScriptMessage( Player , Player , 1 , S_JustHere, C_Red )	-- 海爾芬隊長說的應該就是這裡了。
			ScriptMessage( Player , Player , 0 , S_JustHere, C_Red )	-- 海爾芬隊長說的應該就是這裡了。
			AddBuff(Player, 508836, 0, -1)						-- 給流程控制用buff
			CrabID =LuaFunc_CreateObjByObj(105193, Player)			-- 把寄居蟹種在玩家腳下
			WriteRoleValue(Player,EM_RoleValue_Register3,CrabID)		-- 把值寫在玩家身上
			WriteRoleValue(CrabID,EM_RoleValue_Register4,0)			-- 等等用到的寄居蟹走路與否控制寫在寄居蟹身上預設零
			SetRoleCamp( CrabID , "Visitor" ); 				-- 把寄居蟹的陣營改成任務NPC
			AddBuff(Player, 508792, 0, -1)					-- 給玩家寄居蟹操縱技能
			UseItemDestroy(Player) 						-- 把包包裡面的未訓練寄居蟹砍掉
--			DebugMsg(0,0,"a. Player is "..Player)
			CallPlot(CrabID,"LuaFA_423908_CheckPCLocal", Player)			-- 開始判斷玩家位置的 function
		end
	end
end


function LuaFA_423908_CheckPCLocal(Player)								-- 判斷玩家位置的 function
--			DebugMsg(0,0,"b. Player is "..Player)
	local CrabID = OwnerID()
	local S_Abandon = "[SC_423908_ABANDON]"
	local S_TooFar = "[SC_423908_05]"
	-- DebugMsg(0,0,FN_CountBuffLevel (Player,508836).."inLocal")

	while 1 do											-- 進迴圈
		sleep (10)										-- 睡10秒以免主機太忙
		if CheckID(Player) == FALSE then
			DelObj(CrabID)							-- 幹掉寄居蟹
			return
		end
		if CheckAcceptQuest (Player, 423908) == false then					-- 如果玩家手癢把任務423908取消了
			ScriptMessage( Player , Player , 1 , S_Abandon, C_Red )	-- 你取消了[423908]這個任務，任務重置。
			ScriptMessage( Player , Player , 0 , S_Abandon, C_Red )	-- 你取消了[423908]這個任務，任務重置。
			LuaFA_209097_ResetQuest(Player)							-- Reset任務
			return
		elseif CheckBuff(Player, 508792) == false then
			LuaFA_209097_ResetQuest(Player)							-- Reset任務
			return
		elseif DW_CheckDis (Player, 780872, 0, 550) == false					-- 如果玩家距離遠離範圍中心flag 遠至350
		and DW_CheckDis (Player, 780872, 1, 550) == false
		and DW_CheckDis (Player, 780872, 2, 550) == false
		and DW_CheckDis (Player, 780872, 3, 550) == false
		and CountBodyItem (Player, 209087) == 0 then					-- 而且他還沒取得被訓練好的寄居蟹
			ScriptMessage( Player , Player , 1 , S_TooFar, C_Red )	-- 不在海爾芬隊長說的地方做，會被罵的。先把寄居蟹收起來好了。
			ScriptMessage( Player , Player , 0 , S_TooFar, C_Red )	-- 不在海爾芬隊長說的地方做，會被罵的。先把寄居蟹收起來好了。
			LuaFA_209097_ResetQuest(Player)							-- Reset任務
			GiveBodyItem(Player, 209051, 1)						-- 塞還沒訓練的寄居蟹給玩家
			return										-- 結束這個 func
		elseif CountBodyItem (Player, 209087) == 1 then					-- 如果身上已經有訓練好的寄居蟹了
			return										-- 結束這個 func
		end
	end
end

function LuaFA_508793_CrabAction(Player)											-- 寄居蟹動作控制 function
	local CrabID = OwnerID()
	-- DebugMsg(0,0,FN_CountBuffLevel (Player,508836).."inAction")
	local xyz = DW_GetObjXYZ (CrabID)									-- 抓寄居蟹的位置
	local xyz2 = {kg_GetRangePos(CrabID,nil,100,0)}				-- 規劃寄居蟹移動的目標
	local ActionCheck = 0
	local Relocale = 0

	while 1 do													-- 進迴圈
		sleep (10)												-- 睡10秒以免主機太忙
		if Relocale == 1 and ReadRoleValue(CrabID,EM_RoleValue_Register4) == 1 then
			xyz = DW_GetObjXYZ (CrabID)									-- 抓寄居蟹的位置
			xyz2 = {kg_GetRangePos(CrabID,nil,100,0)}				-- 規劃寄居蟹移動的目標
		end
		if CheckBuff(Player, 508792) == false or CheckAcceptQuest (Player, 423908) == false then	-- 如果玩家喪失了控制技能
			return												-- 結束這個 func
		elseif CheckBuff(CrabID, 508837) == false then						-- 寄居蟹沒有不乖才可以叫他動
			if ReadRoleValue(CrabID,EM_RoleValue_Register4) == 1 then								-- 被設定成走路狀態
				Relocale = 0
				-- DebugMsg(0,0,"inM")
				KS_Move (CrabID, 10, xyz2[1], xyz2[2], xyz2[3])				-- 去去寄居蟹走
				while  ReadRoleValue(CrabID,EM_RoleValue_Register4) == 1 and ActionCheck <= 2 do
					sleep (5)
					ActionCheck = ActionCheck + 1
				end
				ActionCheck = 0
				if  ReadRoleValue(CrabID,EM_RoleValue_Register4) == 1 then
					KS_Move (CrabID, 10, xyz[1], xyz[2], xyz[3])					-- 寄居蟹回來
				end
				while  ReadRoleValue(CrabID,EM_RoleValue_Register4) == 1 and ActionCheck <= 2 do
					sleep (5)
					ActionCheck = ActionCheck + 1
				end
				ActionCheck = 0
			elseif ReadRoleValue(CrabID,EM_RoleValue_Register4) == 2 then							-- 被設定成停止
				-- DebugMsg(0,0,"inS")
				Relocale = 1
				StopMove (CrabID, false)							-- 寄居蟹不動
			elseif ReadRoleValue(CrabID,EM_RoleValue_Register4) == 3 then							-- 被設定成攻擊訓練
				-- DebugMsg(0,0,"inA")
				Relocale = 1
				StopMove (CrabID, false)							-- 寄居蟹不動
				PlayMotion(CrabID, ruFUSION_ACTORSTATE_ATTACK_UNARMED)		-- 讓寄居蟹空手打空氣
				Sleep(10)
			end
		end
	end
end

function LuaFA_508793_Magic()									-- 叫寄居蟹移動（技能）
	local Player = OwnerID()
	local Check = 0
	local CrabID = ReadRoleValue(Player,EM_RoleValue_Register3)
	local CrabAction = ReadRoleValue(CrabID,EM_RoleValue_Register4)
	-- DebugMsg(0,0,FN_CountBuffLevel (Player,508836).."doM")
	local Crabsay = {"[SC_423908_CRABSAY_01]", "[SC_423908_CRABSAY_02]", "[SC_423908_CRABSAY_03]", "[SC_423908_CRABSAY_04]"}
													-- 宣告寄居蟹叫聲陣列
	local S_Move = {"[SC_423908_MOVE_01]","[SC_423908_MOVE_02]",["Doing"] = "[SC_423908_MOVE_DOING]"}
	local S_TooFar = "[SC_423908_TOOFAR]"
	local S_Ready = "[SC_423908_READY]"

	say(Player, S_Move[1])							-- 你命令寄居蟹移動
	Check = LuaFA_508793_CheckCrab(1,1)									-- 檢查寄居蟹還乖不乖
	if GetDistance( Player, CrabID) > 100 then					-- 如果玩家離寄居蟹距離超過50
		ScriptMessage( Player , Player , 1 , S_TooFar, C_Red )	-- 寄居蟹似乎離你太遠，聽不到你的命令…
		ScriptMessage( Player , Player , 0 , S_TooFar, C_Red )	-- 寄居蟹似乎離你太遠，聽不到你的命令…
		return											-- 結束 function
	elseif CrabAction == 0 then							-- 若寄居蟹走路函式還沒開始
		WriteRoleValue(CrabID,EM_RoleValue_Register4,1)								-- 設定成寄居蟹走路
		CallPlot (CrabID, "LuaFA_508793_CrabAction", Player)					-- 開始寄居蟹走路函式
		if CheckBuff(CrabID, 508837) == false then						-- 如果有乖
			say(CrabID, Crabsay[RandRange(1, 4)])					-- 從陣列裡面抽一句出來當寄居蟹的叫聲
			ScriptMessage( Player , Player , 1 , S_Move[2], C_Red )	-- 寄居蟹乖乖聽你的命令移動
			ScriptMessage( Player , Player , 0 , S_Move[2], C_Red )	-- 寄居蟹乖乖聽你的命令移動
			if Check == "ok" then
				ScriptMessage( Player , Player , 1 , S_Ready, C_Red )	-- 寄居蟹應該已經訓練完成，可以帶回去了。讓牠停下來吧。
				ScriptMessage( Player , Player , 0 , S_Ready, C_Red )	-- 寄居蟹應該已經訓練完成，可以帶回去了。讓牠停下來吧。
			end
		end
	elseif CheckBuff(CrabID, 508837) == true then					-- 若寄居蟹不乖就啥也別做
		return											-- 結束 function
	elseif CrabAction == 1 then							-- 若寄居蟹已經被設定成走路
		ScriptMessage( Player , Player , 1 , S_Move["Doing"], C_Red )	-- 寄居蟹已經在走路囉
		ScriptMessage( Player , Player , 0 , S_Move["Doing"], C_Red )	-- 寄居蟹已經在走路囉
	elseif CrabAction == 2 or CrabAction == 3 then			-- 若寄居蟹目前是被人命令停下或者練習攻擊動作的狀態
		WriteRoleValue(CrabID,EM_RoleValue_Register4,1)								-- 設定叫他走
		say(CrabID, Crabsay[RandRange(1, 4)])					-- 從陣列裡面抽一句出來當寄居蟹的叫聲
		ScriptMessage( Player , Player , 1 , S_Move[2], C_Red )	-- 寄居蟹乖乖聽你的命令移動
		ScriptMessage( Player , Player , 0 , S_Move[2], C_Red )	-- 寄居蟹乖乖聽你的命令移動
		if Check == "ok" then
			ScriptMessage( Player , Player , 1 , S_Ready, C_Red )	-- 寄居蟹應該已經訓練完成，可以帶回去了。讓牠停下來吧。
			ScriptMessage( Player , Player , 0 , S_Ready, C_Red )	-- 寄居蟹應該已經訓練完成，可以帶回去了。讓牠停下來吧。
		end
	end
	LuaFA_508793_CheckCrab(2)									-- 檢查任務完成沒
end

function LuaFA_508794_Magic()									-- 叫寄居蟹停止（技能）
	local Player = OwnerID()
	local CrabID = ReadRoleValue(Player,EM_RoleValue_Register3)
	local CrabAction = ReadRoleValue(CrabID,EM_RoleValue_Register4)
	-- DebugMsg(0,0,FN_CountBuffLevel (Player,508836).."doS")
	local Crabsay = {"[SC_423908_CRABSAY_01]", "[SC_423908_CRABSAY_02]", "[SC_423908_CRABSAY_03]", "[SC_423908_CRABSAY_04]"}
													-- 宣告寄居蟹叫聲陣列
	local S_Stop = {"[SC_423908_STOP_01]","[SC_423908_STOP_02]",["Doing"] = "[SC_423908_STOP_DOING]"}
	local S_TooFar = "[SC_423908_TOOFAR]"

	say(Player, S_Stop[1])							-- 你命令寄居蟹停止
	LuaFA_508793_CheckCrab(1,2)									-- 檢查寄居蟹還乖不乖
	if GetDistance( Player, CrabID) > 100 then					-- 如果玩家離寄居蟹距離超過50
		ScriptMessage( Player , Player , 1 , S_TooFar, C_Red )	-- 寄居蟹似乎離你太遠，聽不到你的命令…
		ScriptMessage( Player , Player , 0 , S_TooFar, C_Red )	-- 寄居蟹似乎離你太遠，聽不到你的命令…
		return											-- 結束 function
	elseif CheckBuff(CrabID, 508837) == true then					-- 若寄居蟹不乖就啥也別做
		return											-- 結束 function
	elseif CrabAction == 0 then
		WriteRoleValue(CrabID,EM_RoleValue_Register4,2)									-- 設定成寄居蟹停止
		CallPlot (CrabID, "LuaFA_508793_CrabAction", Player)						-- 開始寄居蟹走路函式
		if CheckBuff(CrabID, 508837) == false then						-- 如果有乖
			say(CrabID, Crabsay[RandRange(1, 4)])					-- 從陣列裡面抽一句出來當寄居蟹的叫聲
			ScriptMessage( Player , Player , 1 , S_Stop[2], C_Red )	-- 寄居蟹乖乖聽你的命令停止
			ScriptMessage( Player , Player , 0 , S_Stop[2], C_Red )	-- 寄居蟹乖乖聽你的命令停止
		end
	elseif CrabAction == 2 then							-- 若寄居蟹目前已經是被人命令停下的狀態
		ScriptMessage( Player , Player , 1 , S_Stop["Doing"], C_Red )	-- 寄居蟹已經是停著的囉
		ScriptMessage( Player , Player , 0 , S_Stop["Doing"], C_Red )	-- 寄居蟹已經是停著的囉
	else												-- 寄居蟹正在動
		WriteRoleValue(CrabID,EM_RoleValue_Register4,2)								-- 叫寄居蟹停下
		say(CrabID, Crabsay[RandRange(1, 4)])					-- 從陣列裡面抽一句出來當寄居蟹的叫聲
		ScriptMessage( Player , Player , 1 , S_Stop[2], C_Red )	-- 寄居蟹乖乖聽你的命令停止
		ScriptMessage( Player , Player , 0 , S_Stop[2], C_Red )	-- 寄居蟹乖乖聽你的命令停止
	end
	LuaFA_508793_CheckCrab(2)									-- 檢查任務完成沒
end

function LuaFA_508795_Magic()										-- 叫寄居蟹練習打空氣（技能）
	local Player = OwnerID()
	local Check = 0
	local CrabID = ReadRoleValue(Player,EM_RoleValue_Register3)
	local CrabAction = ReadRoleValue(CrabID,EM_RoleValue_Register4)
	-- DebugMsg(0,0,FN_CountBuffLevel (Player,508836).."doA")
	local Crabsay = {"[SC_423908_CRABSAY_01]", "[SC_423908_CRABSAY_02]", "[SC_423908_CRABSAY_03]", "[SC_423908_CRABSAY_04]"}
														-- 宣告寄居蟹叫聲陣列
	local S_Attack = {"[SC_423908_ATTACK_01]","[SC_423908_ATTACK_02]",["Doing"] = "[SC_423908_ATTACK_DOING]"}
	local S_TooFar = "[SC_423908_TOOFAR]"
	local S_Ready = "[SC_423908_READY]"

	say(Player, S_Attack[1])								-- 你命令寄居蟹停止
	Check = LuaFA_508793_CheckCrab(1,3)										-- 檢查寄居蟹還乖不乖
	if GetDistance( Player, CrabID) > 100 then						-- 如果玩家離寄居蟹距離超過50
		ScriptMessage( Player , Player , 1 , S_TooFar, C_Red )		-- 寄居蟹似乎離你太遠，聽不到你的命令…
		ScriptMessage( Player , Player , 0 , S_TooFar, C_Red )		-- 寄居蟹似乎離你太遠，聽不到你的命令…
		return												-- 結束 function
	elseif CrabAction == 0 then								-- 若寄居蟹走路函式還沒開始
		WriteRoleValue(CrabID,EM_RoleValue_Register4,3)									-- 設定成寄居蟹攻擊
		CallPlot (CrabID, "LuaFA_508793_CrabAction", Player)						-- 開始寄居蟹走路函式
		if CheckBuff(CrabID, 508837) == false then						-- 如果有乖
			say(CrabID, Crabsay[RandRange(1, 4)])						-- 從陣列裡面抽一句出來當寄居蟹的叫聲
			ScriptMessage( Player , Player , 1 , S_Attack[2], C_Red )		-- 寄居蟹乖乖聽你的命令練習攻擊動作
			ScriptMessage( Player , Player , 0 , S_Attack[2], C_Red )		-- 寄居蟹乖乖聽你的命令練習攻擊動作
			if Check == "ok" then
				ScriptMessage( Player , Player , 1 , S_Ready, C_Red )	-- 寄居蟹應該已經訓練完成，可以帶回去了。讓牠停下來吧。
				ScriptMessage( Player , Player , 0 , S_Ready, C_Red )	-- 寄居蟹應該已經訓練完成，可以帶回去了。讓牠停下來吧。
			end
		end
	elseif CheckBuff(CrabID, 508837) == true then						-- 若寄居蟹不乖就啥也別做
		return												-- 結束 function
	elseif CrabAction == 3 then								-- 若寄居蟹已經被設定成攻擊
		ScriptMessage( Player , Player , 1 , S_Attack["Doing"], C_Red )	-- 寄居蟹已經在攻擊囉
		ScriptMessage( Player , Player , 0 , S_Attack["Doing"], C_Red )	-- 寄居蟹已經在攻擊囉
	elseif CrabAction == 1 or CrabAction == 2 then				-- 若寄居蟹目前是被人命令走路或者停下的狀態
		WriteRoleValue(CrabID,EM_RoleValue_Register4,3)									-- 設定叫他練習攻擊動作
		say(CrabID, Crabsay[RandRange(1, 4)])						-- 從陣列裡面抽一句出來當寄居蟹的叫聲
		ScriptMessage( Player , Player , 1 , S_Attack[2], C_Red )		-- 寄居蟹乖乖聽你的命令練習攻擊動作
		ScriptMessage( Player , Player , 0 , S_Attack[2], C_Red )		-- 寄居蟹乖乖聽你的命令練習攻擊動作
		if Check == "ok" then
			ScriptMessage( Player , Player , 1 , S_Ready, C_Red )	-- 寄居蟹應該已經訓練完成，可以帶回去了。讓牠停下來吧。
			ScriptMessage( Player , Player , 0 , S_Ready, C_Red )	-- 寄居蟹應該已經訓練完成，可以帶回去了。讓牠停下來吧。
		end
	end
	LuaFA_508793_CheckCrab(2)										-- 檢查任務完成沒
end

function LuaFA_508793_CheckCrab(switch,act)									-- 檢查寄居蟹乖不乖的 function 接收傳入值switch來決定做哪件事，act判斷是按下哪顆鈕
	local Player = OwnerID()
	local CrabID = ReadRoleValue(Player,EM_RoleValue_Register3)
	local CrabAction = ReadRoleValue(CrabID,EM_RoleValue_Register4)
	-- DebugMsg(0,0,FN_CountBuffLevel (Player,508836).."inCheck")
	local S_Failed = "[SC_423908_FAILED]"
	local S_Done = "[SC_423908_DONE]"

	if switch == 1 then												-- 傳入值為1的話就做第一件事
		if CheckBuff(CrabID, 508837) == true then						-- 如果寄居蟹已經不乖了
			-- DebugMsg(0,0,"moBad")
			ScriptMessage( Player , Player , 1 , S_Failed, C_Red )	-- 說 寄居蟹不乖了，給他吃魚卵他可能就會乖
			ScriptMessage( Player , Player , 0 , S_Failed, C_Red )	-- 說 寄居蟹不乖了，給他吃魚卵他可能就會乖
		elseif FA_BuffInfo (Player,508836,3) <4 then	-- 如果寄居蟹還乖但是給寄居蟹吃東西的次數小於四次
			if Rand (2) ~= 1 then									-- 2/3機率寄居蟹不乖
				-- DebugMsg(0,0,"beBad")
				-- DebugMsg(0,0,FN_CountBuffLevel (Player,508836))
				ScriptMessage( Player , Player , 1 , S_Failed, C_Red ) -- 說 寄居蟹不乖了，給他吃魚卵他可能就會乖
				ScriptMessage( Player , Player , 0 , S_Failed, C_Red ) -- 說 寄居蟹不乖了，給他吃魚卵他可能就會乖
				CallPlot (Player, "FA_MoveRandEx", CrabID, 60, "Loop",10, 20) 		-- 讓寄居蟹滿地隨便走表現不乖的感覺
				AddBuff( CrabID, 508837, 0, -1)					-- 給標示不乖的buff
			end
		end
	else													-- 傳入值不是1的話就做第二件事
		if FA_BuffInfo (Player,508836,3) >=4 then						-- 並檢查身上流程控制buff疊的數量 是否符合吃光魚卵的情況
			if FA_BuffInfo (Player,508836,3) >= 7 then				-- 若流程控制buff再疊三次以上了（多做三次以上動作）
				if  CrabAction == 2 then
					ScriptMessage( Player , Player , 1 , S_Done, C_Red )	-- 寄居蟹看起來已經很乖了，帶回去吧。
					ScriptMessage( Player , Player , 0 , S_Done, C_Red )	-- 寄居蟹看起來已經很乖了，帶回去吧。
					LuaFA_209097_ResetQuest(Player)							-- Reset任務
					GiveBodyItem(Player, 209087, 1)						-- 塞訓練好的寄居蟹給玩家
				else
					return "ok"
				end
			else											-- 若流程控制buff還沒再疊三次（多做三次動作）
				-- DebugMsg(0,0,FN_CountBuffLevel (Player,508836).."before_A")
				AddBuff(Player, 508836, 0, -1)						-- 繼續疊流程控制buff
				-- DebugMsg(0,0,FN_CountBuffLevel (Player,508836).."added_A")
			end
		end
	end
end


function LuaFA_209097_01()
	local Player = OwnerID()
	local CrabID = ReadRoleValue(Player,EM_RoleValue_Register3)
	local CrabAction = ReadRoleValue(CrabID,EM_RoleValue_Register4)
	-- DebugMsg(0,0,FN_CountBuffLevel (Player,508836).."inUse")
	local S_CanEat = "[SC_423908_CANTEAT]"
	local S_CanFeed = "[SC_423908_CANTFEED]"
	local S_Fed = "[SC_423908_FED]"

	if CrabID == nil or CrabID == 0 then					-- 如果寄居蟹被造出來了
		ScriptMessage( Player , Player , 0 , S_CanEat, C_Red )	-- 你檢視了手上的[209097]，一股腥而鮮的味道襲來…這應該是要給寄居蟹吃的吧。
	elseif GetDistance( Player, CrabID) > 30 then					-- 離寄居蟹超過30
		ScriptMessage( Player , Player , 1 , S_CanFeed, C_Red )	-- 你離寄居蟹太遠了，餵不到他。
		ScriptMessage( Player , Player , 0 , S_CanFeed, C_Red )	-- 你離寄居蟹太遠了，餵不到他。
	elseif GetDistance( Player, CrabID) <= 30 then					-- 離寄居蟹距離30以內
		if CheckBuff(CrabID, 508837) == true then
			UseItemDestroy(Player)								-- 一個魚卵消失
			CancelBuff(CrabID, 508837)							-- 取消寄居蟹不乖buff
			CancelBuff(CrabID, 508897)							-- 取消FA_MoveRandEx亂亂走函式的控制buff
			if CrabAction ~= 0 then
				if FA_BuffInfo (Player,508836,3) < 5 then					-- 如果流程控制buff還沒疊到4次
					-- DebugMsg(0,0,FA_BuffInfo (Player,508836,3).."added_B")
					AddBuff(Player, 508836, 0, -1)						-- 疊流程控制buff
					-- DebugMsg(0,0,FA_BuffInfo (Player,508836,3).."added_B")
				end
				WriteRoleValue(CrabID,EM_RoleValue_Register4,2)								-- 寄居蟹不動
			end
			ScriptMessage( Player , Player , 1 , S_Fed, C_Red )		-- 寄居蟹乖乖地停下來吃你手中的[209097]。
			ScriptMessage( Player , Player , 0 , S_Fed, C_Red )		-- 寄居蟹乖乖地停下來吃你手中的[209097]。
		else
			if CrabAction ~= 0 then
				WriteRoleValue(CrabID,EM_RoleValue_Register4,2)								-- 寄居蟹不動
			end
			UseItemDestroy(Player)								-- 一個魚卵消失
			ScriptMessage( Player , Player , 1 , S_Fed, C_Red )		-- 寄居蟹乖乖地停下來吃你手中的[209097]。
			ScriptMessage( Player , Player , 0 , S_Fed, C_Red )		-- 寄居蟹乖乖地停下來吃你手中的[209097]。
		end
	end
end

function LuaFA_209097_ResetQuest(Player)
	local CrabID = OwnerID()

	CancelBuff(Player, 508836)							-- 取消掉所有相關buff
	CancelBuff(Player, 508792)
	CancelBuff(Player, 508793)
	CancelBuff(Player, 508794)
	CancelBuff(Player, 508795)
	CancelBuff(CrabID, 508837)							-- 取消寄居蟹不乖buff
	CancelBuff(CrabID, 508897)							-- 取消FA_MoveRandEx亂亂走函式的控制buff
	DelObj(CrabID)							-- 幹掉寄居蟹
	WriteRoleValue(Player,EM_RoleValue_Register3,0)							-- 清空寄居蟹GitemID記錄
--	WriteRoleValue(CrabID,EM_RoleValue_Register4,0)							-- 清空寄居蟹控制參數
end


function LuaFA_117288_01()
	local Player = OwnerID()
	local Target = TargetID()
	local S_MoreRoe = "[SC_423908_MOREROE]"

	if CheckAcceptQuest (Player, 423908) ==  true						-- 如果接著任務423908
	and CountBodyItem (Player, 209097) == 0 then						-- 且身上已經沒有209097了
		AddSpeakOption(Player,Target,S_MoreRoe,"LuaFA_117288_02",0)				-- 對不起…我身上的魚卵沒了…
		 LoadQuestOption(Player)
	elseif CheckAcceptQuest (Player, 423915) ==  true and CheckFlag( Player, 544797) == false then		-- 回應海爾芬的計畫
		SetSpeakDetail(Player,"[SC_423915_01]")					-- [$playername]，你的意願呢？
		AddSpeakOption(Player,Target,"[SC_423915_02]", "LuaP_423915_02",0)
	else
		 LoadQuestOption(Player)
	end	
end

function LuaFA_117288_02()
	local S_GiveRoe = "[SC_423908_GIVEROE]"
	local Player = OwnerID()
	DebugMsg(0,0,"GiveMeRoe")
	SetSpeakDetail(Player,S_GiveRoe)	-- 不是跟你說要省著點用了嗎？唉，沒辦法，我就再給你一些吧。這次不要再用那麼快了！
	GiveBodyItem(Player,209097,6)
end