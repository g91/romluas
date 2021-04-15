function Lua_FN_RescueII_NPCtalk() --掛在NPC上的開場跟終場對話事件
	--Owner是玩家 Target是NPC
	AdjustFaceDir( TargetID(), OwnerID(), 0 ) 
	if ReadRoleValue ( OwnerID() , EM_RoleValue_Register1 ) == 2 then --Register1用來記綠玩家遊戲進行狀況，0為還沒進行，1為進行中，2為已經進行過
		SetSpeakDetail( OwnerID(), "[SC_RESCUEII_STRING_FINISH]"  ) --NPC遊戲結束後台詞
		AddSpeakOption( OwnerID(), TargetID(), "[SC_EXIT_EXAM]"  , "Lua_FN_Rescue_LEAVE", 0 ) --選項:離開試煉
	elseif ReadRoleValue ( OwnerID() , EM_RoleValue_Register1 ) == 1 then
		SetSpeakDetail( OwnerID(), "[SC_RESCUEII_STRING_PLAYING]"  ) --NPC遊戲結束後台詞
	else
		SetSpeakDetail( OwnerID(), "[SC_RESCUEII_STRING_START]"  ) --NPC開始遊戲前台詞
		AddSpeakOption( OwnerID(), TargetID(), "[SC_RULE]"  , "Lua_FN_RESCUEII_RULE", 0 ) --選項:規則說明
		AddSpeakOption( OwnerID(), TargetID(), "[SC_RESCUEII_STRING_01]"  , "Lua_FN_RESCUEII_Start", 0 ) --選項:進行救傷試煉
		AddSpeakOption( OwnerID(), TargetID(), "[SC_EXIT_EXAM]"  , "Lua_FN_RESCUE_LEAVE", 0 ) --選項:離開試煉
	end
end

function Lua_FN_RESCUEII_RULE() --遊戲教學
	SetSpeakDetail( OwnerID(), "[SC_RESCUEII_STRING_RULE]"  ) --NPC台詞
end

function Lua_FN_RESCUEII_Start()
	SetSpeakDetail( OwnerID(), "[SC_RESCUEII_STRING_02]"  )
	AddSpeakOption( OwnerID(), TargetID(), "[SC_RESCUE_STRING_EASY]"  , "Lua_FN_RESCUEII_EASYMODE", 0 )
	AddSpeakOption( OwnerID(), TargetID(), "[SC_RESCUE_STRING_NORMAL]"  , "Lua_FN_RESCUEII_NORMALMODE", 0 )
	AddSpeakOption( OwnerID(), TargetID(), "[SC_RESCUE_STRING_HARD]"  , "Lua_FN_RESCUEII_HARDMODE", 0 )
end

function Lua_FN_RESCUEII_EASYMODE()
	WriteRoleValue ( TargetID() , EM_RoleValue_Register1, 1)
	BeginPlot( TargetID(), "Lua_FN_RESCUEII_Main", 0 ) --Target是NPC
	CloseSpeak( OwnerID() ) 
end

function Lua_FN_RESCUEII_NORMALMODE()
	WriteRoleValue ( TargetID() , EM_RoleValue_Register1, 2)
	BeginPlot( TargetID(), "Lua_FN_RESCUEII_Main", 0 ) --Target是NPC
	CloseSpeak( OwnerID() ) 
end

function Lua_FN_RESCUEII_HARDMODE()
	WriteRoleValue ( TargetID() , EM_RoleValue_Register1, 4)
	BeginPlot( TargetID(), "Lua_FN_RESCUEII_Main", 0 ) --Target是NPC
	CloseSpeak( OwnerID() ) 
end

function Lua_FN_RESCUEII_Main()
--	Owner為NPC，Target為玩家
	local hardlevel = ReadRoleValue ( OwnerID() , EM_RoleValue_Register1 ) --1>簡單、2>普通、3>困難
	local Player = TargetID()
	local MainNPC = OwnerID()
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )
	local Timer = 1 --計時器
	local TempNPC --只是拿來隨手記錄用
	local TempNPCGroup = {} --記錄可憐的NPC們
	local SkillA = 0 --單體傷害 495738
	local SkillB1 = 0 --群體傷害 495737
	local SkillB2 = 0 --群體傷害 495739
	local SkillTimer = 0 --用來讓需要施展的法術不互衝突
	local SkillC1 = 0 --降治療 506918
	local SkillC2 = 0 --強DOT 506920
	local SkillD = 0 --恐懼500974
	local TempLocation = SearchRangeNPC ( OwnerID() , 300 ) --只是拿來一開始定位用
	--設定每日旗標--
	WriteRoleValue ( Player , EM_RoleValue_Register1, 1)
	SetFlag (TargetID()  , 542247, 1 ) -- 救傷試煉2
	--創造病患--
	for i=0,table.getn(TempLocation) do
		if ReadRoleValue( TempLocation[i], EM_RoleValue_OrgID  ) == 114963 then
			TempNPC = Lua_FN_RESCUEII_Creat(TempLocation[i])
			AddBuff(TempNPC,506919,1,-1)
			table.insert (TempNPCGroup,TempNPC)
		end
	end
	--給予玩家額外技能--
	AddBuff(Player,506921,1,-1)
	AddBuff(Player,506922,1,190)
	--教官跟玩家無敵--
	AddBuff(Player,506928,1,-1)
	AddBuff(MainNPC,506928,1,-1)
	--計時器--
	ClockOpen( Player , EM_ClockCheckValue_13  , 180 , 180 , 0  ,"Lua_Clockending"  , "Lua_Clockending" );--時間以秒算
	-----遊戲主體迴圈-----
	while true do
		SkillA = Timer%7
		SkillB1 = Timer%13
		SkillB2 = Timer%19
		SkillC1 = Timer%14
		SkillC2 = Timer%16
		SkillD = Timer%30
		-----法術施放區-----
		---簡單難度---
		TempNPC = Lua_FN_RESCUEII_RanPick(TempNPCGroup)
		if SkillTimer == 0 then
			if SkillB2 == 0 then
				CastSpell( MainNPC , MainNPC , 495739 )
				SkillTimer = 2
			elseif SkillB1 == 0 then
				CastSpell( MainNPC ,  TempNPC , 495737 )
				SkillTimer = 2
			elseif SkillA == 0 then
				CastSpell( MainNPC , TempNPC , 495738 )
				SkillTimer = 2
			end
		end
		---一般難度---
		if hardlevel > 1 then
			if SkillC1 == 0 then
				AddBuff(TempNPC,506918,1,12)
			end
			if SkillC2 == 0 then
				AddBuff(TempNPC,506920,1,7)
			end
		end
		---困難難度---
		if hardlevel > 2 then
			if SkillD == 0 then
				ScriptMessage( Player, Player, 1, "[SC_RESCUEII_STRING_03]", "0xffffffff" )
				AddBuff(Player,500974,1,2)
			end
		end
		--
		Sleep(10)
		Timer = Timer + 1
		--
		if SkillTimer > 0 then
			SkillTimer = SkillTimer -1
		end
		-----結算區-----
		for x=1,table.getn(TempNPCGroup) do --檢查有沒有死掉的病人
			if ReadRoleValue ( TempNPCGroup[x] , EM_RoleValue_IsDead ) == 1 then
				WriteRoleValue ( Player , EM_RoleValue_Register2, 1) --寫為1表示遊戲失敗
			end
		end
		if ReadRoleValue ( Player , EM_RoleValue_Register2 ) == 1 then
			ScriptMessage( Player, Player, 1, "[SC_RESCUEII_STRING_FAIL]", "0xffffffff" )
			Lua_FN_RESCUEII_END(Timer,Player,MainNPC,RoomID,TempNPCGroup,1,hardlevel)
			break;
		end
		--時間點--
		if Timer == 60 then --1分鐘
			ScriptMessage( Player, Player, 1, "[SC_RESCUE_STRING_06]", "0xffffffff" )
			Say(MainNPC,"[SC_RESCUEII_STRING_04]")
		elseif Timer == 120 then --2分鐘
			ScriptMessage( Player, Player, 1, "[SC_RESCUE_STRING_07]", "0xffffffff" )
			Say(MainNPC,"[SC_RESCUEII_STRING_05]")
			CastSpell( MainNPC , MainNPC , 495739 )
		elseif Timer == 180 then --3分鐘時間到
			ScriptMessage( Player, Player, 1, "[SC_RESCUE_STRING_08]", "0xffffffff" )
			Say(MainNPC,"[SC_RESCUEII_STRING_06]")
			Lua_FN_RESCUEII_END(Timer,Player,MainNPC,RoomID,TempNPCGroup,2,hardlevel)
			break;
		end
		--
	end
	-----遊戲主體迴圈End-----
end
----------------------------------GameOver----------------------------------
function Lua_FN_RESCUEII_END(Timer,Player,MainNPC,RoomID,TempNPCGroup,Endtype,hardlevel )
	for i=1,table.getn(TempNPCGroup) do
			DelObj(TempNPCGroup[i]) --刪掉剩下的病人
	end
	--
	ClockClose(Player)--關閉時鐘
	---算分---
	local Score = hardlevel*Timer
	if Endtype == 1 then --1為遊戲失敗、2為挑戰成功
		Say(MainNPC, "[SC_RESCUEII_STRING_END1]")
		Score = Score/2
	elseif Endtype == 2 then
		Say(MainNPC, "[SC_RESCUEII_STRING_END2]")
		if hardlevel ~= 1 then
			Score = Score+60
		end
	end
	AdjustFaceDir( MainNPC, Player, 0 ) 
	Say(MainNPC, "[SC_RESCUE_STRING_NPC08][$SETVAR1="..Score.."]")
--	ScriptMessage( Player, Player, 0, "[SC_DDR_STRING14]", "0xffFEFF91" )
--	ScriptMessage( Player, Player, 0, "[SC_DDR_STRING15]"..Score, "0xffFEFF91" )
--	AddRoleValue(Player,EM_RoleValue_Honor,Score) -- 增加榮譽值
	FN_GuildGame_Honor( Player, Score )
	--
	sleep(100)
	CancelBuff(Player,506921)
	CancelBuff(Player,506922)
	AddBuff( Player ,503693 ,1 , 1 )
	sleep(10)
	ChangeZone( Player, 354 , RoomID , 5121.3, 13.4, 2515.2, 269.9 ) --傳回去
	sleep(10)
	--
	WriteRoleValue ( Player , EM_RoleValue_Register2, 0) --重置失敗判定
end
----------------------------------創造病患----------------------------------
function Lua_FN_RESCUEII_Creat(TempLocation)
	local Unit
	local RandUnit = 0
	RandUnit = Rand(4)
	if RandUnit == 0 then --隨機四種造型
		Unit = CreateObjByObj(101551, TempLocation ) 
	elseif RandUnit == 1 then 
		Unit = CreateObjByObj(101552, TempLocation )
	elseif RandUnit == 2 then 
		Unit = CreateObjByObj(102639, TempLocation )
	elseif RandUnit == 3 then 
		Unit = CreateObjByObj(103070, TempLocation )
	end
	--SetDefIdleMotion(Unit,ruFUSION_MIME_DEATH_LOOP) --播放躺下動作
	SetPlot(Unit,"dead","Lua_FN_RESCUE_dead",0) --掛死亡劇情
	AddBuff(Unit,502707,0,-1)
	return Unit
end
----------------------------------隨機病患----------------------------------
function Lua_FN_RESCUEII_RanPick(TempNPCGroup)
	local X = table.getn(TempNPCGroup)
	local RanX = Rand(X)
	local TempNPC = TempNPCGroup[RanX+1]
	return TempNPC
end
----------------------------------執行的死亡劇情----------------------------------
function Lua_FN_RESCUEII_dead()
	local y = Rand(2)
	if y == 0 then
		Yell (OwnerID(),"[SC_RESCUE_STRING_NPC04]", 5)
	else
		Yell (OwnerID(),"[SC_RESCUE_STRING_NPC05]", 5)
	end
end