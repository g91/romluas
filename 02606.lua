-------------------------------------------------
--AC = STEP2
-------------------------------------------------
KORS_ACSTEP2_Global = KORS_ACSTEP2_Global or {
		["monster"] = {					--怪物群
				[1] = 106691 ,
				[2] = 106692 ,
				[3] = 106693 ,
				[4] = 106694 ,
				["boss"] = 106696 },
		["coldown"] = 3600 ,				--BOSS冷卻
		["born"] = 30,					--怪物產生間隔
		["soldiers"] =  106697	}			--協助打怪士兵	
----------------------------------------------------------------------------------------------------------------------
--測試用指令
----------------------------------------------------------------------------------------------------------------------	
function lua_kors_ACSTEP2_Switch(intValue)

	local crystal = GetWorldVar("Zone2_WorldPE_Crystal")
			SetWorldVar( "Zone2_WorldPE_Crystal", crystal+intValue)
end 

function Lua_kors_ACSTEP2_Phase(intSwitch)
	if intSwitch == "On" then
	SetWorldVar("Zone2_WorldPE_Phase",2)
	elseif intSwitch == "Off" then
	SetWorldVar("Zone2_WorldPE_Phase",4)
	end
end


-----------------------------------------------------------------------------------------------------------------------
--中控器
-----------------------------------------------------------------------------------------------------------------------
function lua_kors_ACSTEP2_Ctrl()						--中控階段檢查
local ctrl = OwnerID()
local StartACP2= 0
local room = ReadRoleValue(ctrl,EM_RoleValue_RoomID)
	if KORS_ACSTEP2_Global[room] == nil then	
		KORS_ACSTEP2_Global[room] = {}
	end
local Global = KORS_ACSTEP2_Global[room]
	Global["control"] =ctrl
	Global["slave"] = {}
	Global["bossDead"] = 0
	while TRUE do
	local Phase = GetWorldVar( "Zone2_WorldPE_Phase");
	local crystal = GetWorldVar("Zone2_WorldPE_Crystal")

		if Phase == 2 and StartACP2 == 0 then
		BeginPlot(ctrl,"lua_kors_ACSTEP2_CentelCtrl",0)
		StartACP2 = 1
		elseif Phase ~= 2 and StartACP2 ~= 0 then
--		BeginPlot(ctrl,"lua_kors_ACSTEP2_RESET",0)
--		SetWorldVar( "Zone2_WorldPE_Crystal"  , 0) 
		StartACP2= 0
		end
	Sleep(10)
	end
end

function lua_kors_ACSTEP2_CentelCtrl()						--中控階段2					
local ctrl = OwnerID()
local room = ReadRoleValue(ctrl,EM_RoleValue_RoomID)
local Global = KORS_ACSTEP2_Global[room]
local slave = Global["slave"]
local time = 0
local boss = 0
local monster = KORS_ACSTEP2_Global["monster"]
local Clodown = 0
local addCrystel = 60
local clear = 0
local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
	for i = 1 , 4 do
		slave[i] = CreateObjByFlag(120127,781063,i,1)
		AddBuff(slave[i],622090,1,-1)
		SetModeEx( slave[i]  , EM_SetModeType_Mark, false ) 
		callplot(slave[i],"lua_kors_ACSTEP2_MonCtrl",i)
		AddToPartition(slave[i],room)
	end
		if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
			RunningMsgEx( ctrl, 2 , 3 , "[SC_KORS_ACS2_00]" ) 
		end
		Sleep(20)
	while TRUE do
		local crystal = GetWorldVar("Zone2_WorldPE_Crystal")
		local Phase = GetWorldVar( "Zone2_WorldPE_Phase");
			if Phase ~= 2 then
				break
			end
		for i = 1,#slave do
			if ReadRoleValue(slave[i],EM_RoleValue_Register1) == 0 then
				clear = clear +1
			--	DebugMsg(0,0,"now the clear is "..clear)
			end
		end

		if clear == 4 and boss == 0 then
			boss = LuaFunc_CreateObjByObj(monster["boss"],ctrl)
			ScriptMessage(ctrl,-1,1,"[SC_KORS_ACS2_01]",0)
			SetPlot(boss,"dead","Lua_kors_ACSTEP2_BossDead",0)
			BeginPlot(boss,"lua_kors_ACSTEP2_MonCheck",0)
			AddToPartition(boss,room)
		end
		
		if crystal%5600 == 0 and crystal ~= 0 then
		--	if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
		--		RunningMsgEx( ctrl, 2 , 3 , "[SC_KORS_ACS2_08]" ) 
		--	end
		end
		
		if boss ~= 0 and Global["bossDead"] ~= 0 then
			boss = 0
			Global["bossDead"] = 0
		end
		
		if time%addCrystel ==  0 then
			if lua_ACuseRealZoneID( OwnerID() ) then
				SetWorldVar("Zone2_WorldPE_Crystal",crystal+3)
			end
		end

	clear =0
	time = time + 1
	Sleep(10)
	end
end

function Lua_kors_ACSTEP2_BossDead()
local boss = OwnerID()
local room = ReadRoleValue(boss,EM_RoleValue_RoomID)
local Global = KORS_ACSTEP2_Global[room]
	Global["bossDead"] = 1
end


----------------------------------------------------------------------------------------------------------------------------------
--小怪控制群
----------------------------------------------------------------------------------------------------------------------------------
function lua_kors_ACSTEP2_MonCtrl(intLv)						--控制器
local ctrl = OwnerID()
local room = ReadRoleValue(ctrl,EM_RoleValue_RoomID)
local Global = KORS_ACSTEP2_Global[room]
local monster = KORS_ACSTEP2_Global["monster"]
local Clodown = 0
local mon 
local countNow = 0
local time = 0
	for i = 1,3 do
	local rndPos = RandRange(1,360)
	mon =KORS_CreateObjPosition(monster[intLv],ctrl,40,rndPos)
		WriteRoleValue(mon,EM_RoleValue_PID,ctrl)		
		SetPlot(mon,"dead","lua_kors_ACSTEP2_MonDead",0)
		BeginPlot(mon,"lua_kors_ACSTEP2_MonCheck",0)
		AddToPartition(mon,room)
	end
		WriteRoleValue(ctrl,EM_RoleValue_Register1,3)	
	while TRUE do
	local CountMon = ReadRoleValue(ctrl,EM_RoleValue_Register1)
		if time%10 == 0 and CountMon< 8  then
		local rndPos = RandRange(1,360)
		mon =KORS_CreateObjPosition(monster[intLv],ctrl,40,rndPos)
			WriteRoleValue(mon,EM_RoleValue_PID,ctrl)		
			SetRandMove(mon,140,50,35)
			SetPlot(mon,"dead","lua_kors_ACSTEP2_MonDead",0)
			BeginPlot(mon,"lua_kors_ACSTEP2_MonCheck",0)
			WriteRoleValue(ctrl,EM_RoleValue_Register1,CountMon+1)
			AddToPartition(mon,room)
		end	
		
		if GetWorldVar("Zone2_WorldPE_Phase") ~= 2 then
			DelObj(ctrl)
			break
		end	
	time = time +1
	Sleep(10)
	end
end

function lua_kors_ACSTEP2_MonDead()
local mon = OwnerID()
local ctrl = ReadRoleValue(mon,EM_RoleValue_PID)
local CountMon = ReadRoleValue(ctrl,EM_RoleValue_Register1)
	WriteRoleValue(ctrl,EM_RoleValue_Register1,CountMon-1)
end	

function lua_kors_ACSTEP2_MonCheck()
local mon = OwnerID()
local soldier = 0
local room = ReadRoleValue(mon,EM_RoleValue_RoomID)
	while TRUE do
	local rnd = Rand(99)
		if GetWorldVar("Zone2_WorldPE_Phase") ~= 2  then
			DelObj(mon)
		end

		if rnd >=98 and soldier == 0 then
			soldier = KORS_CreateObjPosition(106697,mon,20,"front")
			BeginPlot(soldier,"lua_kors_ACSTEP2_SoldCheck",0)
			WriteRoleValue(soldier,EM_RoleValue_PID,mon)
			AddToPartition(soldier,room)
			SetAttack(soldier,mon)
		end
	Sleep(10)
	end
end

function lua_kors_ACSTEP2_SoldCheck()
local soldier = OwnerID()
local mon = ReadRoleValue(soldier,EM_RoleValue_PID)
	Say(soldier,"[SC_KORS_ACS2_06]")
	while TRUE do
		if ReadRoleValue(mon,EM_RoleValue_IsDead) ~= 0 then
			Say(soldier,"[SC_KORS_ACS2_07]")
			DelObj(soldier)
		end

		if GetWorldVar("Zone2_WorldPE_Phase") ~= 2  then
			DelObj(soldier)
		end
	Sleep(10)
	end
end


-----------------------------------------------------------------------------------------------------------------------------------
--RESET
-----------------------------------------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------------------------------------------
--對話
---------------------------------------------------------------------------------------------------------------------------------------
function Lua_kors_ACSTEP2_FARLOW()
local NPC = OwnerID()
local showing = 0
local hideing = 0
	while TRUE do
	if GetWorldVar("Zone2_WorldPE_Phase") == 2 and showing == 0 then
			SetModeEx( NPC, EM_SetModeType_Show, TRUE )			--顯示
			SetModeEx( NPC, EM_SetModeType_ShowRoleHead, TRUE )		--頭像框
			SetModeEx( NPC, EM_SetModeType_SearchenemyIgnore, TRUE )	--被搜尋
			SetModeEx(NPC, EM_SetModeType_Mark,TRUE  )			--標記
			showing = 1
			hideing = 0
	elseif GetWorldVar("Zone2_WorldPE_Phase") ~= 2 and hideing == 0 then
			SetModeEx( NPC, EM_SetModeType_Show, FALSE )			--顯示
			SetModeEx( NPC, EM_SetModeType_ShowRoleHead, FALSE )		--頭像框
			SetModeEx( NPC, EM_SetModeType_SearchenemyIgnore, FALSE )	--被搜尋
			SetModeEx(NPC, EM_SetModeType_Mark,FALSE  )			--標記
			hideing = 1
			showing = 0
	end
	Sleep(600)
	end
end




function lua_kors_ACSTEP2_Dialogue()
local Player = OwnerID()
local Npc = TargetID()
local give = CountBodyItem(Player,241124)
local peace = CountBodyItem(Player,206045)
	if GetWorldVar("Zone2_WorldPE_Phase") == 2 then
	SetSpeakDetail(Player,"[SC_KORS_ACS2_02]")
		if give>= 5 then
		AddSpeakOption(Player,Npc,"[SC_KORS_ACS2_03]","lua_kors_ACSTEP2_Dialogue2",0)
		elseif peace >= 1 then
		AddSpeakOption(Player,Npc,"[SC_KORS_ACS2_09]","Lua_kors_ACSTEP2_Peace",0)
		end
	else
	SetSpeakDetail(Player,"[SC_KORS_ACS2_04]")
	end
end

function Lua_kors_ACSTEP2_Peace()
local Player = OwnerID()
local Npc = TargetID()
local peace = CountItem(Player,206045)
	SetSpeakDetail(Player,"[SC_KORS_ACS2_10]")
	if peace >= 5 then
		AddSpeakOption(Player,Npc,"[SC_KORS_ACS2_11]","Lua_kors_ACSTEP2_PeaceChange",0)
	end
end

function Lua_kors_ACSTEP2_PeaceChange()
local Player = OwnerID()
local Npc = TargetID()
local peace = CountBodyItem(Player,206045)
	SetSpeakDetail(Player,"[SC_KORS_ACS2_12]")
	DelBodyItem(Player,206045,5)
	GiveBodyItem(Player,241124,1)
end

function lua_kors_ACSTEP2_Dialogue2()
local Player = OwnerID()
local Npc = TargetID()
local crystal = GetWorldVar( "Zone2_WorldPE_Crystal")
local give = CountBodyItem(Player,241124)

	SetSpeakDetail(Player,"[SC_KORS_ACS2_05]")
	DelBodyItem(Player,241124,give)
		SetWorldVar( "Zone2_WorldPE_Crystal",crystal+give)
	GiveBodyItem(Player,241125,1)
end

function lua_kors_ACSTEP2_gift()
local Player = OwnerID()
local lv = ReadRoleValue(Player,EM_RoleValue_LV)
	if lv <=45 then
	GiveBodyItem(Player,726036,1)
	elseif lv>45 and lv <= 55 then
	GiveBodyItem(Player,726036,2)
	elseif lv > 55 then
	GiveBodyItem(Player,726036,3)
	end
end