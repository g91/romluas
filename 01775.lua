function Lua_FN_Rescue_NPCtalk() --掛在NPC上的開場跟終場對話事件
	--Owner是玩家 Target是NPC
	if ReadRoleValue ( OwnerID() , EM_RoleValue_Register1 ) == 2 then --Register1用來記綠玩家遊戲進行狀況，2為已經進行過
		SetSpeakDetail( OwnerID(), "[SC_RESCUE_STRING_FINISH]"  ) --NPC遊戲結束後台詞
		AddSpeakOption( OwnerID(), TargetID(), "[SC_EXIT_EXAM]"  , "Lua_FN_Rescue_LEAVE", 0 ) --選項:離開試煉
	else
		SetSpeakDetail( OwnerID(), "[SC_RESCUE_STRING_START]"  ) --NPC開始遊戲前台詞
		AddSpeakOption( OwnerID(), TargetID(), "[SC_RULE]"  , "Lua_FN_RESCUE_RULE", 0 ) --選項:規則說明
		AddSpeakOption( OwnerID(), TargetID(), "[SC_RESCUE_STRING_01]"  , "Lua_FN_RESCUE_Start", 0 ) --選項:進行救傷試煉
		AddSpeakOption( OwnerID(), TargetID(), "[SC_EXIT_EXAM]"  , "Lua_FN_RESCUE_LEAVE", 0 ) --選項:離開試煉
	end
end

function Lua_FN_RESCUE_RULE() --遊戲教學
	SetSpeakDetail( OwnerID(), "[SC_RESCUE_STRING_RULE]"  ) --NPC台詞
end

function Lua_FN_Rescue_LEAVE() --離去 --跟救傷試煉2共用
	CloseSpeak( OwnerID() )
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
	AddBuff( OwnerID() ,503693 ,1 , 1 )
	sleep(10)
	ChangeZone( OwnerID(), 354 , RoomID , 5121.3, 13.4, 2515.2, 269.9 )	--ChangeZone( OwnerID(), ZoneID 區域ID , 第幾層 0 為第0層 -1代表只跑副本規則 , x, y, z, Dir)
end

function Lua_FN_RESCUE_Start()
	SetSpeakDetail( OwnerID(), "[SC_RESCUE_STRING_05]"  )
	AddSpeakOption( OwnerID(), TargetID(), "[SC_RESCUE_STRING_EASY]"  , "Lua_FN_RESCUE_EASYMODE", 0 )
	AddSpeakOption( OwnerID(), TargetID(), "[SC_RESCUE_STRING_NORMAL]"  , "Lua_FN_RESCUE_NORMALMODE", 0 )
	AddSpeakOption( OwnerID(), TargetID(), "[SC_RESCUE_STRING_HARD]"  , "Lua_FN_RESCUE_HARDMODE", 0 )
end

function Lua_FN_RESCUE_EASYMODE()
	WriteRoleValue ( TargetID() , EM_RoleValue_Register1, 3)
	BeginPlot( TargetID(), "Lua_FN_RESCUE_Main", 0 ) --Target是NPC
	CloseSpeak( OwnerID() ) 
end

function Lua_FN_RESCUE_NORMALMODE()
	WriteRoleValue ( TargetID() , EM_RoleValue_Register1, 6)
	BeginPlot( TargetID(), "Lua_FN_RESCUE_Main", 0 ) --Target是NPC
	CloseSpeak( OwnerID() ) 
end

function Lua_FN_RESCUE_HARDMODE()
	WriteRoleValue ( TargetID() , EM_RoleValue_Register1, 9)
	BeginPlot( TargetID(), "Lua_FN_RESCUE_Main", 0 ) --Target是NPC
	CloseSpeak( OwnerID() ) 
end

function Lua_FN_RESCUE_Main()
	WriteRoleValue ( TargetID() , EM_RoleValue_Register1, 2) --表 玩家已經在進行遊戲
--	Owner為NPC，Target為玩家
	local ZoneID = ReadRoleValue(TargetID() , EM_RoleValue_ZoneID)
	local hardlevel = ReadRoleValue ( OwnerID() , EM_RoleValue_Register1 ) --1>簡單、2>普通、3>困難
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )
	local NPCCheck = 0 --Check NPC狀態用的
	local Score = 0 --計分
	local Die = 0 --失敗計次
	local TempTable = {} --記錄毛毯
	local TempGroup1 = {} --記錄病人
	local TempNumber = 0 --計算病人數量
	local TempCount = 0 --判斷是否需要補人用的
	local Timer = 0 --計時器
	local TempNPC =  SearchRangeNPC ( OwnerID() , 300 ) --只是拿來一開始定位用
	--
	SetSmallGameMenuType( TargetID() , 9 , 1 ) --記分板，填1為創造，填2為關閉
	SetSmallGameMenuStr( TargetID() , 9 , 1 , "[SC_RESCUE_STRING_STATE][$SETVAR1="..Score.."]" )	--成功救治
	SetSmallGameMenuStr( TargetID() , 9 , 2 , "[SC_RESCUE_STRING_SCORE][$SETVAR1="..Die.."]" )	--死亡病患
	-----
	SetFlag (TargetID()  , 542178 , 1 ) -- 救傷試煉
	--
	AddBuff (TargetID(),506290,1,-1)
	AddBuff (TargetID(),506291,1,-1)
	-----
	Hide(OwnerID())
	-----
	for i=0,table.getn(TempNPC) do
		if ReadRoleValue( TempNPC[i], EM_RoleValue_OrgID  ) == 114963 then
			table.insert (TempTable,TempNPC[i]) --篩選出毛毯，塞進TempTable裡頭
		end
	end
	--TempTable記錄了遊戲所有的毛毯
	--for i=1,hardlevel do
		--TempGroup1[1] = Lua_FN_RESCUE_DEBUFF(TempTable[1])
	--end
	ClockOpen( TargetID() , EM_ClockCheckValue_14  , 180 , 180 , 0  ,"Lua_Clockending"  , "Lua_Clockending" );--時間以秒算
	-----遊戲主體迴圈-----
	while true do
		TempCount = 0 --判斷補人用
		-----
		ZoneID = ReadRoleValue(TargetID() , EM_RoleValue_ZoneID)
		if ZoneID ~= 354 then
			ScriptMessage( TargetID(), TargetID(), 1, "[SC_RESCUE_STRING_09]", "0xffffffff" )
			Lua_FN_RESCUE_END(Score,TargetID(),OwnerID(),RoomID,TempGroup1,0,hardlevel)
			break;
		end
		--
		if Timer == 60 then --1分鐘
			ScriptMessage( TargetID(), TargetID(), 1, "[SC_RESCUE_STRING_06]", "0xffffffff" )
		elseif Timer == 120 then --2分鐘
			ScriptMessage( TargetID(), TargetID(), 1, "[SC_RESCUE_STRING_07]", "0xffffffff" )
		elseif Timer == 180 then --3分鐘時間到
			ScriptMessage( TargetID(), TargetID(), 1, "[SC_RESCUE_STRING_08]", "0xffffffff" )
			Lua_FN_RESCUE_END(Score,TargetID(),OwnerID(),RoomID,TempGroup1,1,hardlevel)
			break;
		end
		-----
		for x=1,hardlevel do --檢查有沒有已經被處理或是死掉的病人
			if TempGroup1[x] ~= nil then
				if ReadRoleValue ( TempGroup1[x] , EM_RoleValue_IsDead ) == 1 then
					NPCCheck = 2
				else
					NPCCheck = ReadRoleValue ( TempGroup1[x] , EM_RoleValue_Register1 )
				end
				-- 治療過是1
				-- 死亡是2
				if NPCCheck ~= 0 then
					if NPCCheck == 1 then
						Score = Score + 1--加分處理
						SetSmallGameMenuStr( TargetID() , 9 , 1 , "[SC_RESCUE_STRING_STATE][$SETVAR1="..Score.."]" )	--成功救治
					else
						Die = Die + 1 --扣分處理
						SetSmallGameMenuStr( TargetID() , 9 , 2 , "[SC_RESCUE_STRING_SCORE][$SETVAR1="..Die.."]" )	--死亡病患
					end
					TempCount = TempCount +1 --有人被處理就表示要補人
					DelObj(TempGroup1[x])
					TempGroup1[x] = nil
				end
			else
				TempCount = TempCount +1 --有空位也表示要補人
			end
		end
		-----
		if Die >= 10 then --判斷是否失敗
			ScriptMessage( TargetID(), TargetID(), 1, "[SC_RESCUE_STRING_09]", "0xffffffff" )
			Lua_FN_RESCUE_END(Score,TargetID(),OwnerID(),RoomID,TempGroup1,0,hardlevel)
			break;
		end
		-----
		if Timer%3 == 0 then
			if TempCount > 0 then --判斷要不要補人
				while true do
					TempNumber = Rand(hardlevel)+1
					if TempGroup1[TempNumber] == nil then
						TempGroup1[TempNumber] = Lua_FN_RESCUE_DEBUFF(TempTable[TempNumber])
						break
					end
				end
			end
		end
		-----
		Sleep(10)
		Timer = Timer + 1 --秒數+1
	end
	-----遊戲主體迴圈結束-----
end


----------------------------------Game Over----------------------------------
function Lua_FN_RESCUE_END(Score,Player,NPC,RoomID,TempGroup1,Endtype,hardlevel)
	ClockClose(Player)--關閉時鐘
	local ZoneID = ReadRoleValue(Player , EM_RoleValue_ZoneID)
	--
	for i=1,9 do
		if TempGroup1[i] ~= nil then
			DelObj(TempGroup1[i]) --刪掉剩下的病人
		end
	end
	--
	Show( NPC,RoomID )
	--
	if Endtype == 1 then --判斷是因為哪種方式結束遊戲
		Say(NPC, "[SC_RESCUE_STRING_NPC06]")
	else
		Say(NPC, "[SC_RESCUE_STRING_NPC07]")
	end
	--
	SetSmallGameMenuType( Player , 9 ,2 )	--關閉記分板
	--
	Score = Score*2
	if Endtype == 1 then
		Score = Score + (10*hardlevel)
	End
	Say(NPC, "[SC_RESCUE_STRING_NPC08][$SETVAR1="..Score.."]")
--	ScriptMessage( Player, Player, 0, "[SC_DDR_STRING14]", "0xffFEFF91" )
--	ScriptMessage( Player, Player, 0, "[SC_DDR_STRING15]"..Score, "0xffFEFF91" )
--	AddRoleValue(Player,EM_RoleValue_Honor,Score) -- 增加榮譽值
	FN_GuildGame_Honor( Player, Score )
	--
	sleep(100)
	CancelBuff( Player,506290)
	CancelBuff( Player,506291)
	--
	if ZoneID == 354 then
		AddBuff( Player ,503693 ,1 , 1 )
		sleep(10)
		ChangeZone( Player, 354 , RoomID , 5121.3, 13.4, 2515.2, 269.9 ) --傳回去
	end
end
----------------------------------使用技能判斷，移除相對應的不良狀態----------------------------------
function Lua_FN_RESCUE_506355()  --移除"物理傷害"
	--Owner為施法者，Target為目標
	if CheckBuff( TargetID() , 506281) == true then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_RESCUE_STRING_03][$SETVAR1=[506281]]", "0xffffffff" )
		CancelBuff( TargetID(),506281)
		Lua_FN_RESCUE_Skill(TargetID())
	end

end
function Lua_FN_RESCUE_506356() --移除"魔法傷害"
	if CheckBuff( TargetID() , 506282) == true then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_RESCUE_STRING_03][$SETVAR1=[506282]]", "0xffffffff" )
		CancelBuff( TargetID(),506282)
		Lua_FN_RESCUE_Skill(TargetID())
	end
end
function Lua_FN_RESCUE_506357() --移除"奪命散"
	if CheckBuff( TargetID() , 506283) == true then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_RESCUE_STRING_03][$SETVAR1=[506283]]", "0xffffffff" )
		CancelBuff( TargetID(),506283)
		Lua_FN_RESCUE_Skill(TargetID())
	end
end
function Lua_FN_RESCUE_506358() --移除"喪魂露"
	if CheckBuff( TargetID() , 506284) == true then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_RESCUE_STRING_03][$SETVAR1=[506284]]", "0xffffffff" )
		CancelBuff( TargetID(),506284)
		Lua_FN_RESCUE_Skill(TargetID())
	end
end
function Lua_FN_RESCUE_506359() --移除"腐熱症"
	if CheckBuff( TargetID() , 506285) == true then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_RESCUE_STRING_03][$SETVAR1=[506285]]", "0xffffffff" )
		CancelBuff( TargetID(),506285)
		Lua_FN_RESCUE_Skill(TargetID())
	end
end
function Lua_FN_RESCUE_506360() --移除"屍寒病"
	if CheckBuff( TargetID() , 506286) == true then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_RESCUE_STRING_03][$SETVAR1=[506286]]", "0xffffffff" )
		CancelBuff( TargetID(),506286)
		Lua_FN_RESCUE_Skill(TargetID())
	end
end
function Lua_FN_RESCUE_506381() --移除"中暑"
	if CheckBuff( TargetID() , 506287) == true then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_RESCUE_STRING_03][$SETVAR1=[506287]]", "0xffffffff" )
		CancelBuff( TargetID(),506287)
		Lua_FN_RESCUE_Skill(TargetID())
	end
end
function Lua_FN_RESCUE_506382() --移除"休克"
	if CheckBuff( TargetID() , 506288) == true then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_RESCUE_STRING_03][$SETVAR1=[506288]]", "0xffffffff" )
		CancelBuff( TargetID(),506288)
		Lua_FN_RESCUE_Skill(TargetID())
	end
end

function Lua_FN_RESCUE_Skill(NPC)
	WriteRoleValue ( NPC , EM_RoleValue_Register1, 1) --治療過的病人寫入1
	--Hide( TargetID() )
	-----以下是表演台詞-----
	local x = Rand(5)
	if x >= 3 then
		local y = Rand(3)
		if y == 0 then
			Say (NPC,"[SC_RESCUE_STRING_NPC01]")
		elseif y == 1 then
			Say (NPC,"[SC_RESCUE_STRING_NPC02]")
		else
			Say (NPC,"[SC_RESCUE_STRING_NPC03]")
		end
	end
end
----------------------------------創造病患並且隨機給予不良狀態----------------------------------
function Lua_FN_RESCUE_DEBUFF(NPC)
	local Unit
	local RandUnit = 0
	RandUnit = Rand(4)
	if RandUnit == 0 then --隨機四種造型
		Unit = CreateObjByObj(101551, NPC ) 
	elseif RandUnit == 1 then 
		Unit = CreateObjByObj(101552, NPC )
	elseif RandUnit == 2 then 
		Unit = CreateObjByObj(102639, NPC )
	elseif RandUnit == 3 then 
		Unit = CreateObjByObj(103070, NPC )
	end
	--SetModeEx( NPC , EM_SetModeType_ShowRoleHead, TRUE ) --頭像框
	SetDefIdleMotion(Unit,ruFUSION_MIME_DEATH_LOOP) --播放躺下動作
	SetPlot(Unit,"dead","Lua_FN_RESCUE_dead",0) --掛死亡劇情
	WriteRoleValue ( Unit, EM_RoleValue_Register1, 0) --剛出來的病人寫入0
	-----
	local TempX = Rand(8) --隨機DEBUFF
	if TempX == 0 then
		AddBuff(Unit,506281,1,-1)
	elseif TempX == 1 then
		AddBuff(Unit,506282,1,-1)
	elseif TempX == 2 then
		AddBuff(Unit,506283,1,-1)
	elseif TempX == 3 then
		AddBuff(Unit,506284,1,-1)
	elseif TempX == 4 then
		AddBuff(Unit,506285,1,-1)
	elseif TempX == 5 then
		AddBuff(Unit,506286,1,-1)
	elseif TempX == 6 then
		AddBuff(Unit,506287,1,-1)
	elseif TempX == 7 then
		AddBuff(Unit,506288,1,-1)
	end
	return Unit
end
----------------------------------執行的死亡劇情----------------------------------
function Lua_FN_RESCUE_dead()
	-----以下是表演台詞-----
	local x = Rand(5)
	if x >= 3 then
		local y = Rand(2)
		if y == 0 then
			Yell (OwnerID(),"[SC_RESCUE_STRING_NPC04]", 5)
		else
			Yell (OwnerID(),"[SC_RESCUE_STRING_NPC05]", 5)
		end
	end
end
----------------------------測試碼-----------------------------------
function FN_RESCUE_TEST1()
	AddBuff(OwnerID(),506289,0,-1)
end

function FN_RESCUE_TEST2()
	AddBuff(OwnerID(),506281,0,-1)
end