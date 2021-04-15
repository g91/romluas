-- Index: 
-- FA_MoveRandEx：多模式複數次隨機移動
-- FA_MoveToTheMiddle：讓物件移動到兩點中間的位置
-- FA_Loafing：萬用遊盪
-- FA_StopLoafing：停止遊盪
-- FA_HideDead：Hide and dead
-- FA_Border：多頁面書本訊息
-- FA_TwoChoose：是或否 or 二選一 可帶參數可決定範圍時間版
-- FA_Dialog_Choose：多選對話框
-- FA_Call：特別版的CallPlot，未確認運作，最好勿用
-- FA_LookAround：泛用四處張望
-- FA_TurnRound：完美的可決定順序180度回頭（直接轉180度會因為client跟server不同步，亂轉一通）
-- FA_MoveToPathStop：搭配MoveToPathPoint，人物停止
-- FA_MoveToPathGo：搭配MoveToPathPoint，人物走
-- FA_DelBodyItemEX：把身上物品全砍或者留下幾個
-- FA_SetPosByObj：單純把已存在的物件丟到另外一個物件的位子上
-- FA_GetHeight：回到地面上（抓地面碰撞點）
-- FA_MoveToFlag：移動至指定旗子
-- FA_WaitMoveTo：有等走路時間的走
-- FA_MoveToFlagDirect：改用MoveDirect的DW_MoveToFlag
-- FA_FaceFlagEX：FaceFlag加強版
-- FA_SyncDir：把兩個物件的方向同步
-- FA_AdjustDirEX：AdjustDir超級加強版
-- FA_FlagSwitch：放在任務模版（或其他地方）內，直接切換旗標開關
-- FA_FlagChange：放在任務模版（或其他地方）內，把關掉的旗標打開，或者把打開的旗標關掉
-- FA_Busy：「XXX正在忙碌中」的訊息顯示，不需建立字串，有NPC的名稱
-- FA_Say_NoOverlap：把npc上鎖，講一句話、作一個動作（選填）、等一段時間（避免npc不斷被觸發而連發對話或動作）
-- FA_SayAndWait：FA_Say_NoOverlap的沒有控制上鎖的版本，欄位與其相同。ForNoOverLap不需要填寫
-- FA_CheckPlayer：與演戲配合，我自己用的。看不懂的請不要用
-- FA_CheckPlayerDel：與演戲配合，我自己用的。看不懂的請不要用


--------------------------------- FA_MoveRandEx ---------------------------------
--------------------------------- 多模式複數次隨機移動 ---------------------------------
-- 修改自小宏的DW_MoveRand（單次移動）
--ObjID		想進行移動的物件
--RandRange	想隨機移動的範圍(直徑)
--Time		可以輸入要做幾次。
		-- 如果輸入"Loop"，則進入Loop模式（請務必搭配BeginPlot使用，從那邊再用一般呼叫）。
		-- 在控制走路的物件上掛508897，如果該Buff消失則停止運作。（用CancelBuff(ObjID, 508897)控制）
		-- 防止無窮迴圈之安全措施，如果運作超過100次該buff依然存在，
		-- 會用DebugMsg 丟 FA_MoveRandEx ERROR! Walk over 100 times and no stop commend! 這個訊息出來
		-- 如果硬要讓他真的走成無窮迴圈，請改輸入"InfiniteLoop"，但除非你知道你在幹嘛且真的有必要，否則請盡量不要使用。
		-- "InfiniteLoop"模式下依然會判斷Buff消失就停止。
-- Delay 	每次移動的等候時間，設定成0則走到定點不會等，會馬上改變移動方向再走一次（不平滑）。單位=1/10秒
-- RandDelay	給Delay增加的Rand值，不想Rand就留0，如果Delay是0會無視這邊。
-- IfEnable	是否要關閉MoveToFlagEnabled 預設是關，填1也是關，填其他的就不關
-- V1 V2 V3	裡面的填法會影響使用何種隨機移動方式（說明待補，請先自行參閱函式Code）

function FA_MoveRandEx (ObjID, RandRange, Time, Delay, RandDelay, IfEnable, V1, V2, V3)
	local Counter = 0
	if CheckBuff(ObjID, 508897) == true then
		DebugMsg(0,0,"ERROR: FA_MoveRandEx is runing on" .. ObjID)
		return false
	end
	if	IfEnable == nil	then
		MoveToFlagEnabled(ObjID, false)
	elseif	IfEnable == 1	then
		MoveToFlagEnabled(ObjID, false)
	end
	local x,y,z,TempX,TempY,TempZ,NowX,NowZ
	if Time == "Loop" or Time == "InfiniteLoop" then
		AddBuff(ObjID, 508897, 0, -1)
	elseif type(Time) ~= "number" or Time < 1 then
		return false
	end
	if	V1 == nil	then
--以自己的座標範圍隨機移動
		TempX = ReadRoleValue(ObjID,EM_RoleValue_X)
		TempY = ReadRoleValue(ObjID,EM_RoleValue_Y)
		TempZ = ReadRoleValue(ObjID,EM_RoleValue_Z)
	elseif	V3~=nil	then
--以輸入的xyz座標移動
		TempX = V1
		TempY = V2
		TempZ = V3
--以指定物件的位置隨機移動
	elseif	V2 ==nil	then
		TempX = ReadRoleValue(V1,EM_RoleValue_X)
		TempY = ReadRoleValue(V1,EM_RoleValue_Y)
		TempZ = ReadRoleValue(V1,EM_RoleValue_Z)
	else
--以輪入的旗標位置移動
		TempX = GetMoveFlagValue(V1,V2,EM_RoleValue_X)
		TempY = GetMoveFlagValue(V1,V2,EM_RoleValue_Y)
		TempZ = GetMoveFlagValue(V1,V2,EM_RoleValue_Z)
	end
	if Time == "Loop" or Time == "InfiniteLoop" then
		while 1 do
			if Counter == 100  and CheckBuff(ObjID, 508897) == true and Time == "Loop" then
				DebugMsg(0,0,"FA_MoveRandEx ERROR! Walk over 100 times and no stop commend!")
				Counter = 0
				CancelBuff(ObjID, 508897)
				break
			end
			if CheckBuff(ObjID, 508897) == false then
				break
			elseif  Time == "Loop" then
				Counter = Counter + 1
			end
			for i=1,20,1 do
				NowX = ReadRoleValue(ObjID,EM_RoleValue_X)
				NowZ = ReadRoleValue(ObjID,EM_RoleValue_Z)
				x=TempX -(RandRange/2)+DW_Rand(RandRange)
				if x - NowX < 10 and x - NowX >=0 then
					x = NowX + 10
				elseif x - NowX > -10 and x - NowX  < 0 then
					x = NowX - 10
				end
				y=TempY
				z=TempZ -(RandRange/2)+DW_Rand(RandRange)
				if z - NowZ < 10 and z - NowZ >=0 then
					z = NowZ + 10
				elseif z - NowZ > -10 and z - NowZ  < 0 then
					z = NowZ - 10
				end
				y=GetHeight( x , y , z )
				if i == 20 then
					return false
				elseif	CheckLine( ObjID ,  x , y , z )==true or math.abs(y-TempY)<45 then
					break
				end
			end
			LuaFunc_WaitmoveTo( ObjID, x , y , z )
			if Delay ~= 0 and Delay ~= nil and Delay ~= -1 then
				If RandDelay ~= 0 and RandDelay ~= nil and RandDelay ~= -1 then
					Sleep(Delay + Rand(RandDelay) +10)
				else
					Sleep(Delay)
				end
			end
		end
	else
		for i = 1, Time do
			for i=1,10,1 do
				NowX = ReadRoleValue(ObjID,EM_RoleValue_X)
				NowZ = ReadRoleValue(ObjID,EM_RoleValue_Z)
				x=TempX -(RandRange/2)+DW_Rand(RandRange)
				if x - NowX < 10 and x - NowX >=0 then
					x = NowX + 10
				elseif x - NowX > -10 and x - NowX  < 0 then
					x = NowX - 10
				end
				y=TempY
				z=TempZ -(RandRange/2)+DW_Rand(RandRange)
				if z - NowZ < 10 and z - NowZ >=0 then
					z = NowZ + 10
				elseif z - NowZ > -10 and z - NowZ  < 0 then
					z = NowZ - 10
				end
				y=GetHeight( x , y , z )
				if i == 10 then
					return false
				elseif	CheckLine( ObjID ,  x , y , z )==true or math.abs(y-TempY)<45 then
					break
				end
			end
			LuaFunc_WaitmoveTo( ObjID, x , y , z )
		end
	end
	return true
end

--------------------------------- FA_MoveToTheMiddle ---------------------------------
--------------------------------- 讓物件移動到兩點中間的位置 ---------------------------------
-- 兩個參考點可以自由指定座標、Flag或物件。
-- ObjID	執行移動的對象。
-- ObjID1 / FlagNum1 / Z1 跟 ObjID2 / FlagNum2 / Z2 的填法：
	-- 前面一組是 A 點，後面一組是 B 點，所謂的兩點中間即為此AB點之中間。AB點可指定不同類型的參考點。
	-- 若參考點為物件，則只需要輸入 ObjID1 或 ObjID2
	-- 若參考點為Flag，則寫入旗子的群組（資料庫編號）到 ObjID1 或 ObjID2 並把編號寫到 FlagNum1 或 FlagNum2 內。
	-- 若參考點為座標，則寫入XYZ值對應塞入 ObjID1 / FlagNum1 / Z1 或 ObjID2 / FlagNum2 / Z2  內
	-- 你沒用到的參數就填0
-- Range	亂數決定移動到定點的範圍，不隨機請留空或填零
-- Enable	0 ＝ 不關閉MoveToFlag	1 ＝ 關閉MoveToFlag
-- CheckLine	要不要檢查該點位置是否與兩參考點之間暢通無阻

function FA_MoveToTheMiddle( ObjID , ObjID1 , FlagNum1 , Z1 , ObjID2 , FlagNum2, Z2 , Range , Enable )
	if Enable ~= nil	then
		if Enable == 1	then
			MoveToFlagEnabled( ObjID , false )
		end
	else
		MoveToFlagEnabled( ObjID , false )
	end
	return DW_WaitMoveTo( ObjID , FA_GotMiddle(ObjID1 , FlagNum1 , Z1 , ObjID2 , FlagNum2, Z2 , Range) )
end

--未完全完成
--------------------------------- FA_Loafing ---------------------------------
--------------------------------- 萬用遊盪 ---------------------------------
-- 用 BeginPlot 或 CallPlot 呼叫，他會在該物件上掛 509084 ，解除 509084 之後會自動結束，務必要記得解除不然會無限迴圈！
-- （CancelBuff(ObjID, 509084)）
-- ObjID	欲操作遊盪的物件
-- RndRange	遊盪到各種參考點的隨機範圍
-- StartFlag ＼ EndFlag 記得需要加上 StartFlagNum ＼ EndFlagNum
-- StartFlag 跟 EndFlag 都不寫則以自身為基準點晃來晃去
-- 輸入 StartFlag 不輸入EndFlag 則會走到 StartFlag 並且以其為基準點晃來晃去，如果連StartFlagNum都沒寫則預設為編號001
-- 輸入 StartFlag 與 EndFlag 則需要配合 Mode 決定行為模式
	-- Mode = 0（或不填）
		-- 先走到 StartFlag ，然後在 StartFlag ＼ EndFlag 間兩點來回遊盪
	-- Mode = 1
		-- 先走到 StartFlag ，然後從 StartFlag 的 StartFlagNum 沿著旗標編號一隻隻依序走到 EndFlagNum（忽略EndFlag）
	-- Mode = 2
		--先走到 StartFlag ，然後隨機挑 StartFlag 的 StartFlagNum 到 EndFlagNum 中間編號的旗標亂走（忽略EndFlag）


function FA_Loafing(ObjID,RndRange,Wait,StartFlag,StartFlagNum,EndFlag,EndFlagNum,Mode)
	AddBuff(ObjID, 509084, 0, -1)
	while CheckBuff(ObjID,509084) == true do
		if StartFlag == nil then
		elseif EndFlagNum ~= nil then
			if Mode == 0 or Mode == nil then
				FA_MoveToFlag(ObjID,StartFlag,StartFlagNum,RndRange,1,1)
				Sleep(Wait)
				if CheckBuff(ObjID,509084) == false then break end
				FA_MoveToFlag(ObjID,EndFlag,EndFlagNum,RndRange,1,1)
				Sleep(Wait)
			end
		end
	end
end


--------------------------------- FA_StopLoafing ---------------------------------
--------------------------------- 停止遊盪 ---------------------------------
-- Mode = 1 使NPC停止並面向 FaceWho 指定的對象
function FA_StopLoafing(ObjID,Mode,FaceWho)
	CancelBuff(ObjID,509084)
	if Mode == 1 then
		StopMove(ObjID,true)
		AdjustFaceDir( ObjID, FaceWho, 0 )
	end
end

-- Hide and dead
-- WhoKill 預設同 ObjID，可另外指定
function FA_HideDead(ObjID,WhoKill)
	WhoKill = WhoKill or ObjID
	Hide(ObjID)
	Sleep(10)
	NPCDead(ObjID,WhoKill)
end

--------------------------------- FA_Border ---------------------------------
--------------------------------- 多頁面書本訊息 ---------------------------------
-- WHO 寫開書本的人，如 OwnerID()
-- 只要Pages用陣列塞滿字串丟進去就是多頁書本。
-- 如果你只要單頁，那就傳單純的字串進去就好。
-- Title 寫書本（石碑介面）的標題用的字串，不寫就是物品名稱
-- 如果需要給Flag，可直接傳入FlagID

function FA_Border( WHO, Pages, Title, FlagID )

	WHO = WHO or OwnerID()

	Title = Title or "["..GetUseItemGUID(OwnerID()).."]"

	ClearBorder( WHO )	--初始化石碑介面
	if Type(Title) ~= "string" or (Type(Pages) ~= "table" and Type(Pages) ~= "string")then
		DebugMsg(0,0,"FA_Border ERROR： Wrong Arg.")
		return FALSE
	end
	if Type(Pages) == "table" then
		for i = 1 , table.getn(Pages)	do
			AddBorderPage( WHO , Pages[i])
		end
	else
		AddBorderPage( WHO , Pages )
	end
	ShowBorder( WHO , 0, Title, "ScriptBorder_Texture_Paper" )
	if FlagID ~= nil then SetFlag(WHO,FlagID,1) end
end

--------------------------------- FA_TwoChoose ---------------------------------
--------------------------------- 是或否 or 二選一 可帶參數可決定範圍時間版 ---------------------------------
-- 修改自小宏的 DW_ChooseOneFromTwo
-- 二擇系統模版改用 ks_DialogRePort_TwoChoose
-- 加入了可以給Y/N傳入參數的部分，可以自定傳入一個參數，位置是目標函數的第一個參數。
-- 如果你需要傳入很多參數，請使用 Array
-- YesFuncArg	給 YesFunc 的傳入值
-- NoFuncArg	給 NoFunc 的傳入值
-- Range	移動多遠就失效，預設為100碼（可設定範圍：50～250碼，超過此範圍會被設定為50）
-- Time		放置太久就失效，預設為30秒（可設定範圍：5～60秒，超過此範圍會被設定為30）
-- 原本的說明沒有提到的：
-- 他會把ChooserID 丟進 YesFunc 跟 NoFunc 裡面，我把這個放在「第二個傳入值」
-- 如果你需要這個傳入值，請放兩個傳入參數來接
-- 下面是原始函式 DW_ChooseOneFromTwo 原本的說明
--
--超快速系統選擇框產生模版！！ 選擇是或否可各自執行一個函式
--警告！此function的ChooserID必須填玩家的ID
--MsgString 系統訊息框內容
--YesFunc 選擇「是」在OwnerID()上執行的
--NoFunc 選擇「否」在OwnerID()上執行的
--YesOption 是的選項字串，可不填 預設為「是」
--NoOption 否的選項字串，可不填  預設為「否」


function FA_TwoChoose(ChooserID,MsgString,YesFunc,NoFunc,YesFuncArg,NoFuncArg,YesOption,NoOption,Range,Time)
	Range = Range or 100
--防呆檢查：填錯資料
--	if	NoFunc == nil	then
--DeBugMSG(0,0,"FA_TwoChoose Error: NoFunc == nil")
--		return
--	end
	if	type(MsgString)~="string"	then
DeBugMSG(0,0,"FA_TwoChoose Error: MsgString ~= string")
		return
	end
	DialogCreate( ChooserID,EM_LuaDialogType_YesNo,MsgString)
--可省略
	if	YesOption == nil	then
		DialogSelectStr( ChooserID , "[SO_YES]" )
	else
		DialogSelectStr( ChooserID , YesOption );
	end
	if	NoOption == nil	then
		DialogSelectStr( ChooserID , "[SO_NO]" );
	else
		DialogSelectStr( ChooserID , NoOption );
	end
	DeBugMSG(0,0,"FA_TwoChoose is Done")
--等待倒數
	local result = ks_DialogRePort_TwoChoose(ChooserID,Range,Time)
	if	result == "Yes" and YesFunc ~= "" and YesFunc ~= nil then
		CallPlot(OwnerID(),YesFunc,YesFuncArg,ChooserID)
	end
	if	result == "No" and NoFunc ~= "" and NoFunc ~= nil then
		CallPlot(OwnerID(),NoFunc,NoFuncArg,ChooserID)
	end
end


--------------------------------- FA_Dialog_Choose ---------------------------------
--------------------------------- 多選對話框 ---------------------------------
-- Who			開對話框的玩家編號，不知道要寫啥就 OwnerID() 或 TargetID() 試試。
--			預設 OwnerID()
-- Text			打開的文字內容
-- Option		選項，請給一個二維Table寫入選項文字與Func，範例：
--
--	local Option = {	{ "[SC_OPTION_01]",	function ()
--								Say(OwnerID(), 1 )
--							end				},
--
--				{ "[SC_OPTION_02]",	function ()
--								Say(OwnerID(), 2 )
--							end				},
--
--				{ "[SC_OPTION_03]",	function ()
--								Say(OwnerID(), 3 )
--							end				}	}
--
--			前面是選項的字，後面是點選項會跑的Script。
--			這樣感覺寫，然後把宣告的迴圈放進這格就好。
--			看不懂結構的只要把中間02的那個不斷複製成你要的量插在中間，改字串跟function內容，就可以用了。
--
-- TimeLimit		時間限制，玩家多久沒反應就自動貼心地幫他關掉。預設600秒。
--			寫 -1 或 0 或 FALSE 者無時間限制（伺服器負擔大，慎用）
-- IfExit		貼心地幫您加上離開選項，預設為沒有，指定 1 或 TRUE 就有。
-- TimeOutMsg		逾時自動關掉框的系統訊息
-- TimeOutMsgColor	上面的系統訊息的顏色，預設為紅色
-- TimeOutMsgPos	0 = 左下對話框顯示（預設，沒寫或亂寫都這個）
--			1 = 中央警告訊息顯示
--			2 = 二者皆顯示
-- WhenEsc		若是跳出對話框而非選擇選項（包括「離開」選項）則執行此處。
--			傳入Function名（String）或直接傳一個Function。
-- WhenEscArg		可以放一個傳入值給上面的Function（限用String，你如果要傳Func的話自己寫就好了）

function FA_Dialog_Choose( Who, Text, Option, TimeLimit, IfExit, NotLevelOne, TimeOutMsg, TimeOutMsgColor, TimeOutMsgPos, WhenEsc, WhenEscArg)

	TimeOutMsgColor = TimeOutMsgColor or C_Red
	TimeLimit = TimeLimit or 600
	Who = Who or OwnerID()

	local Exit =	{function ()
				DialogClose( Who )
				if Type(WhenEsc) == "string" then
					CallPlot( Who, WhenEsc, WhenEscArg)
				elseif Type(WhenEsc) == "function" then
					WhenEsc()
				end
				return FALSE
			end}

	if Type(Option) == "function" then
		Option = {Option}
	elseif	Option == nil or Option == 0 then
		Option = {}
	elseif Type(Option) ~= "table" then
		DebugMsg ( 0, 0, "FA_Dialog_Choose ERROR: Arg = Option got a wrong value!" )
		DebugMsg ( 0, 0, "FA_Dialog_Choose ERROR: Arg Type = "..Type(Option) )
		return FALSE
	end

	if IfExit == 1 or IfExit == TRUE then
		table.insert( Option, { "[SO_EXIT]", Exit[1] } )
	end

	local Time = 0
	local Step = 0
	local DialogStatus = 0
	local OptionNum = table.getn(Option)

	if NotLevelOne ~= 1 then
		DialogClose( Who )
	end
--	Sleep(1)	-- 防止視窗立即關閉
	DialogCreate( Who , EM_LuaDialogType_Select , Text )   -- 你想去哪裡?

	if Option ~= {} then
		for i = 1 , OptionNum do

	 		DialogSelectStr( Who , Option[i][1] )

		end
	end

	if ( DialogSendOpen( Who ) == false )  then  --表單使用錯誤，回傳錯誤訊息

		ScriptMessage ( Who , Who , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 ) 

		return FALSE
	end

	if Option == nil and (IfExit == 1 or IfExit == TRUE) then return TRUE end

	while 1 do

		DialogStatus = DialogGetResult( Who )  --檢查使用者選取的項目

	 	if Time > TimeLimit and TimeLimit ~= -1 and TimeLimit ~= 0 then  -- Timeout，關閉對話視窗
			Time = Time + 1

			if TimeOutMsg ~= nil and TimeOutMsg ~= 0 then
				if TimeOutMsgPos == 1 then
					ScriptMessage( Who , Who , 1 , TimeOutMsg , TimeOutMsgColor )	-- 逾時時給玩家的訊息
				elseif TimeOutMsgPos == 2 then
					ScriptMessage( Who , Who , 0 , TimeOutMsg , TimeOutMsgColor )
					ScriptMessage( Who , Who , 1 , TimeOutMsg , TimeOutMsgColor )
				else
					ScriptMessage( Who , Who , 0 , TimeOutMsg , TimeOutMsgColor )
				end
			end

			return Exit[1]()
		end

		if DialogStatus == -1
		or ( (IfExit == 1 or IfExit == TRUE) and DialogStatus == OptionNum - 1 ) then -- 被按 x 之類的中斷

			return Exit[1]()
		end



		if DialogStatus ~= -2 then	-- -2 = 初始化

			if NotLevelOne ~= 1 then
				DialogClose( Who )
			end
			Option[DialogStatus+1][2]()
			Step = 1
		end

		if Step == 1 then
			break
		end

		sleep(1)

	end
	return DialogStatus
end


-- FA_Call
-- 特別版的CallPlot，未確認運作，最好勿用

function FA_Call(GitemID,Func,ArgArray,Timer)
	Timer = Timer or 1
	local RandTemp
	if G_FA_Call == nil then G_FA_Call = {} end
	repeat
		RandTemp = FA_Rand("10")
	until G_FA_Call[RandTemp] == nil
	G_FA_Call[RandTemp] = TRUE
	callplot(GitemID,Func,RandTemp,ArgArray)
	repeat
		sleep(Timer)
	until G_FA_Call[RandTemp] == nil
end


--------------------------------- FA_LookAround ---------------------------------
--------------------------------- 泛用四處張望 ---------------------------------
-- Who =	誰要左右張望
-- Mode = 0	左右張望（先左先右隨機）（預設）
-- Mode = 1	先右後左張望
-- Mode = 2	先左後右張望
-- WaitLR :	左右張望間的延遲時間，預設1.5秒。
-- Back = 1	然後會看背後。不寫或亂寫就不會。
-- Back = 2	把看背後的動作拿到最前面，依次是左右張望，然後轉回來（Reset=2,3的設定會失效，回頭方向會被固定為順向）
-- WaitB :	轉到背後前的延遲時間，預設1.5秒。
-- Reset = 1	最後會轉回正面，不寫或亂寫的話他就不會轉回正面（轉回正面的方向隨機）
-- Reset = 2	順時鐘轉回正面
-- Reset = 3	逆時鐘轉回正面
-- WaitR :	轉回正面前的延遲時間，預設1.5秒。
function FA_LookAround(Who,Mode,WaitLR,Back,WaitB,Reset,WaitR)
	local LR = {1,-1}
	local ResetYN = {[0]=0,[1]=1,[2]=1,[3]=1,}
	WaitLR = WaitLR or 15
	WaitB = WaitB or 15
	WaitR = WaitR or 15
	if Back == 2 then
		Sleep(WaitB)
		FA_TurnRound(Who)
		FA_LookAround(Who,Mode,WaitLR,ResetYN[Reset],WaitR)
		return
	end
	if Mode ~= 1 and Mode ~= 2 then
		Mode = RandRange(1,2)
	end
	AdjustDir(Who, 90 * LR[Mode] )
	Sleep(WaitLR)
	FA_TurnRound(Who, LR[Mode] * -1)
	if Back == 1 then
		Sleep(WaitB)
		AdjustDir(Who, -90 * LR[Mode] )
	end
	if Reset == 1 then
		Sleep(WaitR)
		FA_TurnRound(Who)
	elseif Reset == 2 or Reset == 3 then
		Sleep(WaitR)
		FA_TurnRound(Who, LR[Reset - 1] )
	end
end

-- 完美的可決定順序180度回頭（直接轉180度會因為client跟server不同步，亂轉一通）
function FA_TurnRound(Who,LR)
	local SetLR = {1,-1, [-1] = -1 }
	Who = Who or OwnerID()
	LR = LR or RandRange(1,2)
	AdjustDir(Who, 90 * SetLR[LR] )
	Sleep(1)
	AdjustDir(Who, 90 * SetLR[LR] )
end


-- 走 與 停
-- 搭配MoveToPathPoint
-- StopMove如果沒寫正確的boolen或者都沒寫，預設false
function FA_MoveToPathStop(ObjID,StopMoveArg)
	StopMoveArg = StopMoveArg or false
	MoveToFlagEnabled(ObjID,false)
	StopMove(ObjID,StopMoveArg)
end

function FA_MoveToPathGo(ObjID)
	MoveToFlagEnabled(ObjID,true)
end

--------------------------------- FA_DelBodyItemEX ---------------------------------
--------------------------------- 把身上物品全砍或者留下幾個 ---------------------------------
-- Who : 從誰身上砍
-- ItemID : 砍什麼東西
-- LastNum : 留幾個
-- 注意：如果把這function掛在物品自己，例如說物品200000下面掛使用劇情，然後砍自己200000的話，會無效。
-- 因為物品使用時無法Count到自己的量。
function FA_DelBodyItemEX(Who,ItemID,LastNum)
	LastNum = LastNum or 0
	if LastNum >= CountBodyItem(Who,ItemID) then return end
	DelBodyItem(Who,ItemID, (CountBodyItem(Who,ItemID) - LastNum))
end

--------------------------------- FA_SetPosByObj ---------------------------------
--------------------------------- 單純把已存在的物件丟到另外一個物件的位子上 ---------------------------------
-- ObjID	= 要被重新定位的物件
-- TargetID	= 重新定位點的參考物件
-- 也就是說ObjID這東西會被丟到TargetID的腳下。
-- 沒寫值時的預設值：
--	ObjID = TargetID()	（把要被重新定位的物件設定為選取目標）
--	TargetID = OwnerID()	（把定位目標設定為執行Plot的人）
-- 遊戲內直接執行Pcall可用，可以把東西拉到自己腳下。使用方法：
-- /gm ? pcall FA_SetPosByObj( 要拉到自己腳下的東西的GUID )
-- （注意不是資料庫編號，是GUID）
function FA_SetPosByObj(ObjID, TargetID)
	ObjID = ObjID or TargetID()
	TargetID = TargetID or OwnerID()
	if ObjID == nil or TargetID == nil then
		DebugMsg(0,0,"FA_SetPosByObj ERROR! Cant get ObjID")
	end
	SetPos(ObjID,kg_GetPos(TargetID))
end

-- 回到地面上（抓地面碰撞點）

function FA_GetHeight (ObjID)
	ObjID = ObjID or OwnerID()
	local Pos = {kg_GetPos(ObjID)}
	Pos[2] = GetHeight(Pos[1],Pos[2],Pos[3])
	setpos( ObjID , Pos[1],Pos[2],Pos[3],Pos[4] )
end

--------------------移動至指定旗子----------------------------------
--ObjID 執行移動的對象
--FlagObjID 旗子的資料庫編號
--FlagID 旗子編號
--Range 亂數決定移動到定點的範圍
--Enable  0，不關閉movotoflag   1，關閉movetoflag，不輸入東西預設＝1
function FA_MoveToFlag( ObjID , FlagObjID , FlagID,Range , Enable ,IfLoafing)
	if Enable == nil or Enable == 1 then
		MoveToFlagEnabled( ObjID , false )
	end
 	local X , Y , Z
	X = GetMoveFlagValue( FlagObjID , FlagID , EM_RoleValue_X )
	Y = GetMoveFlagValue( FlagObjID , FlagID , EM_RoleValue_Y )
	Z = GetMoveFlagValue( FlagObjID , FlagID , EM_RoleValue_Z )

	X = X + Rand( Range) * 2 - Range + 1
	Z = Z + Rand( Range) * 2 - Range + 1

	if IfLoafing == 1 then
		return FA_WaitMoveTo( ObjID , X , Y  , Z , 1)
	end
	return FA_WaitMoveTo( ObjID , X , Y  , Z )
end

function FA_WaitMoveTo( ObjID, X, Y, Z, IfLoafing )
	local Obj = Role:new( ObjID )
	local LastX = 0
	local LastZ = 0
	local NowX,NowZ
	local DW = 0
	if X == 0 and Z == 0 then
		DeBugLog( 6 , ObjID.." Will Move To 0 , Y , 0 ")
	end
	local Time = Obj:Move(  X , Y ,Z  )
	if	Time ==nil	then
		Time = 1200
	else
		Time = (Time +600*5)/10
	end
	local Count = 0
	while 1 do
		for i = 0 , 60 , 1 do
			if IfLoafing == 1 and CheckBuff(ObjID,509084) == false then
				return true
			end
			NowX = Obj:X()
			NowZ = Obj:Z()

			if Abs( NowX - X ) < 10 and Abs( NowZ - Z ) < 10 then
				return true
			end

			if	(LastX == NowX 	and LastZ == NowZ) and
				ReadRoleValue(ObjID,EM_RoleValue_IsAttackMode)==0	then
				DW = DW + 1
				Obj:Move(  X , Y ,Z  )
			else
				DW = 0
			end

			if	DW >100	then
				return true
			end

			LastX = NowX
			LastZ = NowZ
			Sleep( 10 )
			Count = Count + 1
			if	Count > Time	then
				DeBugLog( 6 , ObjID.." Long Time to Move ! ")
				SetPos(ObjID ,X,Y,Z,Obj:Dir())
				return true
			end
		end
	end
	return false
end




--------------------------------- FA_MoveToFlagDirect ---------------------------------
--------------------------------- 改用MoveDirect的DW_MoveToFlag ---------------------------------
-- 把DW_MoveToFlag 改成用MoveDirect （為了可以使用StopMove）
--ObjID 執行移動的對象
--FlagObjID 旗子的資料庫編號
--FlagID 旗子編號
--Range 亂數決定移動到定點的範圍
--Enable  0，不關閉movotoflag   1，關閉movetoflag

function FA_MoveToFlagDirect( ObjID , FlagObjID , FlagID,Range , Enable  )
	if	Enable ~= nil	then
		if	Enable == 1	then
			MoveToFlagEnabled( ObjID , false )
		end
	else
		MoveToFlagEnabled( ObjID , false )
	end
 	local X , Y , Z
	X = GetMoveFlagValue( FlagObjID , FlagID , EM_RoleValue_X )
	Y = GetMoveFlagValue( FlagObjID , FlagID , EM_RoleValue_Y )
	Z = GetMoveFlagValue( FlagObjID , FlagID , EM_RoleValue_Z )

	X = X + Rand( Range) * 2 - Range + 1
	Z = Z + Rand( Range) * 2 - Range + 1

	return MoveDirect( ObjID , X , Y  , Z )
end

--------------------------------- FA_FaceFlagEX ---------------------------------
--------------------------------- FaceFlag加強版 ---------------------------------
-- 原本的FaceFlag需要多加一行AdjustDir，索性包起來，既然要包就多加上一點功能。
-- FlagID：	Flag群組的代號（資料庫編號）
-- FlagNum：	Flag該隻的編號
-- Angle：	多轉的方向，如，面向參考Npc的右邊／順時鐘30度就在這輸入30，逆時鐘40就-40。範圍為-180~-180）
-- RandAdd：	在多轉的方向上多一個RandAdd，請給正數，不然會被變成正數。
-- Angle 跟 Rand 參數沒用到可以不要寫。
-- 會傳回轉向物件的Dir值。

function FA_FaceFlagEX(ObjID, FlagID , FlagNum ,Angle ,RandAdd)
	RandAdd = RandAdd or 0
	RandAdd = math.abs(RandAdd)
	Angle = Angle or 0
--	if math.abs(Angle + RandAdd) > 180 then
--		DebugMsg(0,0,"FA_FaceFlagEX ERROR: Angel + Rand > 180 or < -180!")
--	end
	FaceFlag ( ObjID, FlagID , FlagNum )
	if RandRange(0,1) == 0 then
		AdjustDir(ObjID,Angle+RandRange(0,RandAdd))
	else
		AdjustDir(ObjID,Angle-RandRange(0,RandAdd))
	end
	return ReadRoleValue(ObjID,EM_RoleValue_Dir)
end


-- FA_SyncDir
-- 把兩個物件的方向同步

function FA_SyncDir( ObjID, TargetID, Angle )

	ObjID = ObjID or OwnerID()
	TargetID = TargetID or TargetID()
	Angle = Angle or 0

	SetDir( ObjID, ReadRoleValue( TargetID , EM_RoleValue_Dir ) + Angle )

end

--------------------------------- FA_AdjustDirEX ---------------------------------
--------------------------------- AdjustDir超級加強版 ---------------------------------
-- Mode：	執行的模式，有下面三種模式，使用代碼如下：
--		 ---- 大小寫無所謂 ----
--		 "xyz"或 "X" 或 "0"	指定為面向座標
--		"Obj" 或 "O" 或 "1"	指定為面向物件
--		 "Flag" 或 "F" 或 "2"	指定為面向旗標
-- 面向座標：	在 Var1 跟 Var2 依序寫上 x 跟 z（不用 y ）。
--		Var3可以輸入要多轉的方向，如，面向參考Npc的右邊／順時鐘30度就在這輸入30，逆時鐘40就-40。範圍為-180~-180。
-- 		Var4可以在多轉的方向上多一個Rand，請給正數，不然會被變成正數。Angle+Rand之絕對值不可超過180。
--		例如，Angle = 30，Rand = 5的話，會變成25~35之間的隨機角度。
-- 面向物件：	在 Var1 寫上物件的ID，Var2可以輸入要多轉的方向，Var3可以給一個Rand值，用法如上。
-- 面向旗標：	在 Var1 跟 Var2 依序寫上旗標群代號（資料庫編號）與旗標編號。Var3跟Var4如上。
-- 後面的參數沒用到可以不要寫。
-- 會傳回轉向物件的Dir值。

function FA_AdjustDirEX(ObjID,Mode,Var1,Var2,Var3,Var4)
	if Type(Mode) ~= "string" then
		DebugMsg(0,0,"FA_AdjustDirEX ERROR: Please input point's type!")
		return false
	else
		Mode = string.lower(Mode)
	end
	if Var2 == nil then
		Var2 = 0
	end
	if Var3 == nil then
		Var3 = 0
	end
	if Var4 == nil then
		Var4 = 0
	end
	if Mode == "xyz" or "x" or "0" then
		if math.abs(Var3 + Var4) > 180 then
			DebugMsg(0,0,"FA_AdjustDirEX ERROR: Angel + Rand > 180 or < -180!")
		end
		if RandRange(0,1) == 0 then
			AdjustDir(ObjID,CalDir(ReadRoleValue(ObjID,EM_RoleValue_X)-Var1,ReadRoleValue(ObjID,EM_RoleValue_Z)-Var2)+Var3+RandRange(0,Var4))
		else
			AdjustDir(ObjID,CalDir(ReadRoleValue(ObjID,EM_RoleValue_X)-Var1,ReadRoleValue(ObjID,EM_RoleValue_Z)-Var2)+Var3-RandRange(0,Var4))
		end
	elseif Mode == "obj" or "o" or "1" then
		if math.abs(Var2 + Var3) > 180 then
			DebugMsg(0,0,"FA_AdjustDirEX ERROR: Angel + Rand > 180 or < -180!")
		end
		if RandRange(0,1) == 0 then
			AdjustFaceDir(ObjID,Var1,Var2+RandRange(0,Var3))
		else
			AdjustFaceDir(ObjID,Var1,Var2-RandRange(0,Var3))
		end
		
	elseif Mode == "flag" or "f" or "2" then
		if math.abs(Var3 + Var4) > 180 then
			DebugMsg(0,0,"FA_AdjustDirEX ERROR: Angel + Rand > 180 or < -180!")
		end
		FA_FaceFlagEX(ObjID, Var1 , Var2 ,Var3 ,Var4)
	end
	return ReadRoleValue(ObjID,EM_RoleValue_Dir)
end

function FA_FlagSwitch(FlagID, TF, IsOwner)
	local Player
	if IsOwner == 1 or true then
		Player = OwnerID()
	else
		Player = TargetID()
	end
	if TF == 0 or TF == 1 then
		SetFlag ( Player , FlagID , TF)
	else
		DebugMsg (0,0,"FA_FlagSwitch ERROR: T/F arg is wrong! Check your func!")
	end
end

function FA_FlagChange(FlagID, IsOwner)
	local Player
	if IsOwner == 1 or true then
		Player = OwnerID()
	else
		Player = TargetID()
	end
	if CheckFlag(Player, FlagID) then
		SetFlag ( Player , FlagID , 0)
	else
		SetFlag ( Player , FlagID , 1)
	end
end

-- 不用建立字串的npc忙碌訊息
-- 會顯示成「XXX正在忙碌中...」，XXX為NPC的名字
-- Player 為傳訊目標 寫nil的話自動變成OwnerID()
-- NPCOrgID 為 該NPC的資料庫編號，必填
-- Mode = 1 
function FA_Busy(Player, NPCOrgID, Mode, Str, Color )
	if Player ~= nil and NPCOrgID == nil then
		Player, NPCOrgID = NPCOrgID, Player
	end

	Player = Player or OwnerID()
	Mode = Mode or -1
	Str = Str or "[SAY_NPC_BUSY_02]"
	Color = Color or C_Red

	if Mode == 0 or Mode == -1 then
		ScriptMessage(Player,Player,0,Str.."[$SETVAR1="..NPCOrgID.."]", Color)
	end
	if Mode == 1 or Mode == -1 then
		ScriptMessage(Player,Player,1,Str.."[$SETVAR1="..NPCOrgID.."]", Color)
	end
end

-- 把npc上鎖，講一句話、作一個動作（選填）、等一段時間（避免npc不斷被觸發而連發對話或動作）
-- 這段時間不會被重複觸發，然後等到等候時間過才解鎖
-- Dialog Npc說的話
-- Time 等的時間
-- IsNpcSay 控制是不是用NPCSay，不是的話請留空或寫nil
-- Motion 可以寫動作，會在講話的同時作動作，不要就留空
function FA_Say_NoOverlap(ObjID, Dialog, Time, IsNpcsay, Motion )
	if not CheckBuff(ObjID, 620264) then
		CallPlot(ObjID, "FA_SayAndWait", ObjID, Dialog, Time, IsNpcsay, Motion, true)
	end
end

-- FA_Say_NoOverlap的沒有控制上鎖的版本，欄位與其相同。ForNoOverLap不需要填寫
function FA_SayAndWait(ObjID, Dialog, Time, IsNpcsay, Motion, ForNoOverLap)
	if Motion ~= nil then PlayMotion(ObjID, Motion) end
	if IsNpcsay == nil then
		Say(ObjID, Dialog)
	else
		NpcSay(ObjID, Dialog)
	end
	Sleep(Time)
	if ForNoOverLap ~= nil or ForNoOverLap ~= false then CancelBuff(ObjID, 620264) end
end


-- 與演戲配合，我自己用的。看不懂的請不要用
function FA_CheckPlayer( Player, QuestID, FinishFlag, ResetNPC, ResetNPCColumn, Buff, CheckPoint, FlagNum, Range, CancelFunc )
	local Controller = OwnerID()
	local CheckDis = true

	Range = nil or 150

	repeat
		if 	CheckID(Player)==false	 then
			CallPlot(Controller, CancelFunc, Player, 1, QuestID,  ResetNPC, ResetNPCColumn)
		end
		if CheckPoint ~= nil then
			if FlagNum == nil then
				CheckDis = CheckDistance(CheckPoint, Player, Range)
			else
				CheckDis = DW_CheckDis(Player, MoveFlag, FlagNum, Range)
			end
		end
		if 	CheckBuff(Player, Buff)==false or
			CheckAcceptQuest(Player, QuestID)==false or
			CheckDis==false then
			CallPlot(Controller, CancelFunc, Player, 2, ResetNPC, ResetNPCColumn)
			return
		end
		Sleep(20)
	until CheckFlag(Player, FinishFlag)
end

-- 與演戲配合，我自己用的。看不懂的請不要用
function FA_CheckPlayerDel( Player, Mode, ResetNPC, ResetNPCColumn, DelFlag, DelObjs, DelBuff, DelItem)
	local Controller = OwnerID()
	local DelObjList

	if	Type(DelFlag) ~= "table" 	then
		DelFlag = {DelFlag}
	end
	if	Type(DelObjs) ~= "table" 	then
		DelObjs = {DelObjs}
	end
	if	Type(DelBuff) ~= "table" 	then
		DelBuff = {DelBuff}
	end
	if	Type(DelItem) ~= "table" 	then
		DelItem = {DelItem}
	end

	if ResetNPC ~= nil	then
		WriteRoleValue(ResetNPC, ResetNPCColumn, 0)
	end
	if Mode == 2 then
		if DelFlag[1] ~= nil 	then
			for i = 1, table.getn(DelFlag) do
				SetFlag(Player, DelFlag[i], 0)
			end
		end
		if DelBuff[1] ~= nil	then
			for i = 1, table.getn(DelBuff) do
				CancelBuff(Player, DelBuff[i])
			end
		end
		if DelItem[1] ~= nil	 then
			for i = 1, table.getn(DelItem) do
				DelBodyItem(Player, DelItem[i], CountBodyItem(Player, DelItem[i])) 
			end 
		end
	end
	if DelObjs[1] ~= nil then
		for i = 1, table.getn(DelObjs) do
			DelObjList = FA_SearchNPC( Controller, nil, DelObjs[i])
			if Type(DelObjList) == "table" then
				for j = 1, table.getn(DelObjList) do
					DelObj(DelObjList[j])
				end
			elseif DelObjList ~= nil then
				DelObj(DelObjList)
			end
		end
	end
end