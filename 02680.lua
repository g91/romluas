--------------------------------------------------------------------------------------------------------
----2012 哀怨節
--------------------------------------------------------------------------------------------------------
kors_12MusicFes_Global = kors_12MusicFes_Global or {}



function lua_kors_12musicFes_Ctrl()								--主控制器
local Cctrl = OwnerID()
local room = ReadRoleValue(Cctrl,EM_RoleValue_RoomID)
	kors_12MusicFes_Global[room] = kors_12MusicFes_Global or {}
local Global = kors_12MusicFes_Global[room]
	Global["ctrl"] ={}
	for i = 1,3 do
 	Global["ctrl"][i] = CreateObjByFlag(120883,781157,i,1)
	SetModeEx( Global["ctrl"][i], EM_SetModeType_ShowRoleHead, TRUE )		--頭像框
	BeginPlot(Global["ctrl"][i],"lua_kors_12musicFes_con",0)
	AddToPartition(Global["ctrl"][i],room)
	end
	BeginPlot(Cctrl,"LuaN_miyon_action02",0)
end


function lua_kors_12musicFes_con()								--遊戲中控
local ctrl = OwnerID()
local room = ReadRoleValue(ctrl,EM_RoleValue_RoomID)
local Global = kors_12MusicFes_Global[room]
	SetPlot(ctrl,"touch","lua_kors_12musicFes_GameSet",50)
end

function lua_kors_12musicFes_GameSet()							--機台待機中
local Player = OwnerID()
local ctrl = TargetID()
local room = ReadRoleValue(ctrl,EM_RoleValue_RoomID)
local Global = kors_12MusicFes_Global[room]
	SetPlot(ctrl,"touch","",0)
	if CheckFlag(Player,546516) == TRue and CheckBuff(Player,622707) == TRUE then		--中級票
			beginPlot(ctrl,"lua_kors_12musicFes_GameIng",0)
			WriteRoleValue(ctrl,EM_RoleValue_PID,Player)
	else
		ScriptMessage(Player,Player,2,"[KORS_MUSICFES12_16]",c_system)
		SetPlot(ctrl,"touch","lua_kors_12musicFes_GameSet",50)
	end	
end

function lua_kors_12musicFes_GameIng()							--遊戲進行控制器
local ctrl = OwnerID()
local room = ReadRoleValue(ctrl,EM_RoleValue_RoomID)
local Player = ReadRoleValue(ctrl,EM_RoleValue_PID)
local score = {850243,850244}
local ShotObj = {}
	WriteRoleValue(Player,EM_RoleValue_PID,0)	
	AddBuff(Player,622723,1,-1)
	for i = 1,2 do
		ShotObj[i] = KORS_CreateObjPosition(120884,ctrl,60,(235+i*90))
			SetModeEx( ShotObj[i] , EM_SetModeType_Show, TRUE )			--顯示
			SetModeEx( ShotObj[i]   , EM_SetModeType_HideName, TRUE )--名稱
			SetModeEx( ShotObj[i] , EM_SetModeType_ShowRoleHead, FALSE )		--頭像框
			SetModeEx( ShotObj[i], EM_SetModeType_SearchenemyIgnore, false )	--被搜尋
			SetModeEx( ShotObj[i], EM_SetModeType_Obstruct, FALSE )			--阻擋
			SetModeEx( ShotObj[i], EM_SetModeType_Mark,FALSE  )			--標記
		AddToPartition(ShotObj[i],room)
	end
	SetFlag(Player,546516,0)
	CancelBuff(Player,622707)	
	for p = 1,45 do							--遊戲進行中
		local Music = Rand(10)					--遊戲要做得事情。
		if Music <5 then
--		cl_chack_CastSpell()				
		CastSpell(ShotObj[1],ctrl,score[1])
		else
--		cl_chack_CastSpell()
		CastSpell(ShotObj[2],ctrl,score[2])
		end
	
		if CheckID(Player) == FALSE then			--玩家斷線
				for s = 1,2 do
					DelObj(ShotObj[s])
				end
			SetPlot(ctrl,"touch","lua_kors_12musicFes_GameSet",50)
			WriteRoleValue(ctrl,EM_RoleValue_PID,0)
			return
		end

		if CheckBuff(Player,622723) == FALSE then
					for s = 1,2 do
					DelObj(ShotObj[s])
				end
			SetPlot(ctrl,"touch","lua_kors_12musicFes_GameSet",50)
			WriteRoleValue(ctrl,EM_RoleValue_PID,0)
			return
		end
	Sleep(15)
	end

	ScriptMessage(Player,Player,2,"[KORS_MUSICFES12_18]",0)
	
	for d = 1,2 do							--遊戲結束後。
		DelObj(ShotObj[d])
	end
	CancelBuff(Player,622723)
		SetPlot(ctrl,"touch","lua_kors_12musicFes_GameSet",50)
	SetFlag(Player,546518,1)
	if CheckFlag(Player,546519) == FALSE then			--塞玩過免費的KEY
		SetFlag(Player,546519,1)
	end	
end

function lua_kors_12musicFes_GameDef(intWay)					--玩家用技能
local Player = OwnerID()
local ctrl = TargetID()
local magic = {}
	AddBuff(ctrl,magic[intWay],1,-1)
end	

function lua_kors_12musicFes_GameBeat(intWay)					--BEAT skill
local ctrl = TargetID()
local Shot = OwnerID()
local Player = ReadRoleValue(ctrl,EM_RoleValue_PID)
local DefBuff = {622710,622711,622712,622713}
	if CheckBuff(ctrl,DefBuff[intWay]) == TRUE then
		local score = ReadRoleValue(Player,EM_RoleValue_Register1)
		WriteRoleValue(Player,EM_RoleValue_Register1,score+1)
		CancelBuff(ctrl,DefBuff[intWay])
		local NS = score+1
		ScriptMessage(Player,Player,2,"[KORS_MUSICFES12_05][$SETVAR1="..NS.."]",0)
	else
		CancelBuff(ctrl,DefBuff[1])
		CancelBuff(ctrl,DefBuff[2])
		ScriptMessage(Player,Player,2,"[KORS_MUSICFES12_06]",0)
	end
end


function lua_kors_12musicFes_SkCheck()
local TAG = TargetID()
local ORG = ReadRoleValue(TAG,EM_RoleValue_OrgID)
	if ORG == 120883 then
		return TRUE
	else
		return FALSE
	end
end


---------------
--NPC
---------------

function lua_kors_12musicFes_Npc()
	local Player = OwnerID()
	local NPC = TargetID()
	local Language = GetServerDataLanguage() 
	local key = CheckBuff(Player,622707) 
	local playend = CheckFlag(Player,546518) 
	local today = CheckFlag(Player,546519) 

	if key == true then -- 有遊玩鑰匙
		SetSpeakDetail(Player,"[KORS_MUSICFES12_09]")
		-- 還沒去啟動機器嗎？不要再摸魚了。
		-- 我時間不多，你再不快點我就要來不及完成了！
	else
--		if today == true then  -- 當天已玩過
--		--	if Language ~= "rw" then  -- 台版專屬沒有重置選項  測試用
--			if Language ~= "tw" then  -- 台版專屬沒有重置選項  正式版
--				SetSpeakDetail(Player,"[KORS_MUSICFES12_13]")  --  當天已完成對話
--				AddSpeakOption(Player,NPC,"[KORS_MUSICFES12_14]","lua_kors_12musicFes_BuyTicket",0)
--			else
--				SetSpeakDetail(Player,"[KORS_MUSICFES12_13_TW]")  -- 當天已完成對話
--			end
--		else
--			if playend == true then  --玩完未回報
--				SetSpeakDetail(Player,"[KORS_MUSICFES12_08]")  -- 玩完未回報
--				-- 呼，看起來是完成了，那個臭老頭居然指派這麼麻煩的工作給我。
--				-- [$playername]做得不錯嘛，沒有我想像中的慢。那麼我來看看你蒐集了多少吧。
--				AddSpeakOption(Player,NPC,"[KORS_MUSICFES12_07]","lua_kors_12musicFes_change",0)
--			else
--				SetSpeakDetail(Player,"[KORS_MUSICFES12_00]")  --  當天未玩過訊息
--				AddSpeakOption(Player,NPC,"[KORS_MUSICFES12_01]","lua_kors_12musicFes_GameFree",0)
--			end
--		end
--	2014/04/30 奈奈修改條件判斷的順序	
		if playend == true then  --玩完未回報
			SetSpeakDetail(Player,"[KORS_MUSICFES12_08]")  -- 玩完未回報
			-- 呼，看起來是完成了，那個臭老頭居然指派這麼麻煩的工作給我。
			-- [$playername]做得不錯嘛，沒有我想像中的慢。那麼我來看看你蒐集了多少吧。
			AddSpeakOption(Player,NPC,"[KORS_MUSICFES12_07]","lua_kors_12musicFes_change",0)
		elseif today == true then  -- 當天已玩過
		--	if Language ~= "rw" then  -- 台版專屬沒有重置選項  測試用
			if Language ~= "tw" then  -- 台版專屬沒有重置選項  正式版
				SetSpeakDetail(Player,"[KORS_MUSICFES12_13]")  --  當天已完成對話
				AddSpeakOption(Player,NPC,"[KORS_MUSICFES12_14]","lua_kors_12musicFes_BuyTicket",0)
			else
				SetSpeakDetail(Player,"[KORS_MUSICFES12_13_TW]")  -- 當天已完成對話
			end
		else
			SetSpeakDetail(Player,"[KORS_MUSICFES12_00]")  --  當天未玩過訊息
			AddSpeakOption(Player,NPC,"[KORS_MUSICFES12_01]","lua_kors_12musicFes_GameFree",0)
		end
	end	
end

function lua_kors_12musicFes_change()
	local Player = OwnerID()
	local NPC = TargetID()
	local score = ReadRoleValue(Player,EM_RoleValue_Register1)

		if score <=10 and score ~= 0 then
			SetSpeakDetail(Player,"[KORS_MUSICFES12_10][$SETVAR1="..score.."]")
			GiveBodyItem(Player,204428,1)
			GiveBodyItem(Player,204457,1)
		elseif score >10 and score <=24 then
			SetSpeakDetail(Player,"[KORS_MUSICFES12_11][$SETVAR1="..score.."]")
			GiveBodyItem(Player,204428,4)
			GiveBodyItem(Player,204457,4)
		elseif score > 24 then
			SetSpeakDetail(Player,"[KORS_MUSICFES12_12][$SETVAR1="..score.."]")
			GiveBodyItem(Player,204428,6)
			GiveBodyItem(Player,204457,6)
		end
		if score == 0 then
			SetSpeakDetail(Player,"[KORS_MUSICFES12_17]")
		end
	Setflag(Player, 546519, 1)
	SetFlag(Player,546518,0)
	WriteRoleValue(Player,EM_RoleValue_Register1,0)
end



function lua_kors_12musicFes_GameFree()					--每天一次的免錢遊戲
local Player = OwnerID()
local NPC = TargetID()
	SetSpeakDetail(Player,"[KORS_MUSICFES12_02]")
	AddSpeakOption(Player,NPC,"[KORS_MUSICFES12_03]","lua_kors_12musicFes_GetTicket",0)	
end

function lua_kors_12musicFes_BuyTicket()
	local Player = OwnerID()
	local NPC = TargetID()

	if CountBodyItem(Player,202903) < 1 then 
		SetSpeakDetail(Player,"[SC_112503_NO]")  --你所持的物品數量不足喔！
	else
		SetSpeakDetail(Player,"[KORS_MUSICFES12_15]")
		DelBodyItem(Player,202903,1)
		AddBuff(Player,622707,1,-1)
		SetFlag(Player,546516,1)
	end
end

function lua_kors_12musicFes_GetTicket()
local Player = OwnerID()
	CloseSpeak(Player)
	ScriptMessage(Player,Player,2,"[KORS_MUSICFES12_04]",0)

	AddBuff(Player,622707,1,-1)
	SetFlag(Player,546516,1)
end