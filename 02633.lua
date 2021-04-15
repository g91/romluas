------------------------------------------------------------------------------------
--AC BOSS2
------------------------------------------------------------------------------------
KORS_ACBoss_Global = KORS_ACBoss_Global or {
	["Skill"] = {
		[1] = { ID = 499103,Time = 7,Tag = 2},		--利爪掃擊
		[2] = { ID = 499104,Time = 13,Tag = 2},		--恐懼凝視
		[3] = { ID = 499105,Time = 17,Tag = 1},		--戰慄之聲
		[4] = { ID = 499106,Time = 27,Tag = 1}},		--戰慄之噬
--		[5] = { ID = 850032,Time = 35,Tag = 0}},		--幻能凝聚
	["CheckDis"] = 250,					--戰鬥脫離距離
	["BoomTime"] = 100,					--幻影爆炸
	["Range"] = 250,						--狂暴時間
	["maxBoom"] = 3						}	

function Lua_kors_ACboss_ctrl()						--中控
local ctrl = OwnerID()
local room = ReadRoleValue(ctrl,EM_RoleValue_RoomID)

	SetModeEx( ctrl, EM_SetModeType_Show, FALSE )--顯示

	if KORS_ACBoss_Global[room] == nil then
		KORS_ACBoss_Global[room] ={}
	end

local Global = KORS_ACBoss_Global[room]
	Global["Control"] = ctrl
	Global["Dead"] = 0
	Global["Boom"] = 0
	Global["illusion"] = {}
	Global["player"] = {}
	Global["type"]  = 0
	Global["doorNofight"] = Cl_CreateObj_ForFlag( 106237 , 781086 , 2 , Room )
	Global["AtKCount"] = 0
	Global["Mirror"] = KORS_CreateObjCycle(120427,ctrl,3,250,"Rand")
	Global["Boss"] =LuaFunc_CreateObjByObj(106635,ctrl)
			SetModeEx ( Global["doorNofight"] , EM_SetModeType_Obstruct, true) 		---阻擋(是)
			AddBuff(Global["Boss"] ,621968,1,-1)
			AddToPartition(Global["Boss"],room)
end

function Lua_kors_ACboss_Fight()
local Boss = OwnerID()
local room = ReadRoleValue(Boss,EM_RoleValue_RoomID)
local Global = KORS_ACBoss_Global[room]
	Global["door"] = {
			[1] = Cl_CreateObj_ForFlag( 106237 , 781086 , 1 , Room ) ,			----產生透明球專用
			[2] = Cl_CreateObj_ForFlag( 106237 , 781086 , 2 , Room ) }			----產生透明球專用
local door = Global["door"]
	SetModeEx ( door[1] , EM_SetModeType_Obstruct, true) 		---阻擋(是)
	SetModeEx ( door[2] , EM_SetModeType_Obstruct, true) 		---阻擋(是)
	BeginPlot(Boss,"Lua_kors_ACboss_BossAI",0)
end


function Lua_kors_ACboss_BossAI()					--動作AI
local Boss = OwnerID()
local room = ReadRoleValue(Boss,EM_RoleValue_RoomID)
local Global = KORS_ACBoss_Global[room]
local illusion = Global["illusion"]
local Mirror = Global["Mirror"]
local player = Global["player"]
local Time = 0
local Skill = KORS_ACBoss_Global["Skill"]
local Bossillusion
local illusionCrt = 0
	Global["type"] = 1
			for i = 1, #Mirror do
				SetPlot(Mirror[i],"touch","Lua_kors_AC_CrystalUse",30)	
				AddToPartition(Mirror[i],room)
			end
	callplot(Global["Control"], "Cl_ACWB_BossIsDeadFlag", 1)
	while TRUE do	
--	Say(Boss,Time)
		Global["player"] = star_HateListSort(Boss)		
		for s = 1,#Skill do
			if Time%Skill[s].Time == 0 and time ~= 0  then
			local hit = Global["player"][RandRange(1,#Global["player"])] 	
			if Skill[s].Tag == 1 then
			CastSpell(Boss,hit,Skill[s].ID)
			elseif Skill[s].Tag == 2 then
			SysCastSpellLv(Boss,hit,Skill[s].ID,1)
			end 
			Global["AtKCount"] = Global["AtKCount"]+1
				if Global["AtKCount"] >= illusionCrt then
				Bossillusion = LuaFunc_CreateObjByObj(106636,Boss)
				BeginPlot(Bossillusion,"Lua_kors_ACboss_illusion",0)
				AddToPartition(Bossillusion,room)
				table.insert(illusion,Bossillusion)
				Global["AtKCount"] = 0	
				KORS_buffUpDown(Boss,621968,0,1)
				end
			break
			end
		end

		if Global["Boom"] >= 5   then
			Global["type"] = 2
		end

		if Global["type"] == 1 then
			illusionCrt = 7
		elseif Global["type"] == 2 then
			illusionCrt = 5
		end

	if Time >= 480 and  CheckBuff( Boss, 621929 ) == FALSE  then
		AddBuff( Boss, 622092, 0, -1 )
	end
		
	Time = Time +1
	Sleep(10)
	end
end

function Lua_kors_ACboss_False()							--重置
local Boss = OwnerID()
local room = ReadRoleValue( Boss , EM_RoleValue_RoomID)
local Global= KORS_ACBoss_Global[room]
	if Global["play"] ~= nil then
	Global["player"] = {}
	end
local illusion = Global["illusion"]
local Mirror = Global["Mirror"]
local door = Global["door"]

	if illusion ~= nil then
		for i = 1,#illusion do
			DelObj(illusion[i])
		end
	end
	for x = 1,#Mirror do
		DelObj(Mirror[x])
	end

	DelObj(door[1])
	DelObj(door[2])
	DelObj(Global["doorNofight"])

	if ReadRoleValue(Boss,EM_RoleValue_IsDead) == 0 then
	callplot(Global["Control"], "Cl_ACWB_BossIsDeadFlag", 2)
	BeginPlot(Global["Control"] ,"Lua_kors_ACboss_ctrl",0)
	DelObj(Boss)
	end
end

function Lua_kors_ACboss_illusion()
local Bossill = OwnerID()
local room= ReadRoleValue(Bossill,EM_RoleValue_RoomID)
local Global = KORS_ACBoss_Global[room]
local player = Global["player"]
local Time = 0
local Skill = KORS_ACBoss_Global["Skill"]
local Boss = Global["Boss"]
	SetAttack(Bossill, player[RandRange(1,#player)] )
	while TRUE do
		for s = 1,3 do
			if Time%Skill[s].Time == 0 and Time~= 0  then
			local hit = player[RandRange(1,#player)] 
				CastSpell(Bossill,hit,Skill[s].ID)
				end
		end
		Time = Time+ 1
	Sleep(10)
	end

end

function Lua_kors_ACboss_illusionDead()
local Boss = OwnerID()
local room = ReadRoleValue(Boss,EM_RoleValue_RoomID)
local Global = KORS_ACBoss_Global[room]
	callplot(Global["Control"],"Lua_kors_ACboss_illusionBoom",Boss)
	Global["Boom"] = Global["Boom"] +1
	KORS_buffUpDown(Global["Boss"],621968,1,1)
	return  TRUE
end
	
function Lua_kors_ACboss_illusionBoom(intPos)
local ctrl = OwnerID()
local X = ReadRoleValue(intPos,EM_RoleValue_X)
local Y =ReadRoleValue(intPos,EM_RoleValue_Y)
local Z = ReadRoleValue(intPos,EM_RoleValue_Z)
	SysCastSpellLv_Pos(intPos,X,Y,Z,850032,1)
	Sleep(5)
	DelObj(intPos)
end



function Lua_kors_ACboss_ValueDead()					--Dead play
local Boss = OwnerID()
local room = ReadRoleValue(Boss,EM_RoleValue_RoomID)
local Global = KORS_ACBoss_Global[room]
	callplot(Global["Control"], "Cl_ACWB_BossIsDeadFlag", 3)	
	DelObj(Global["doorNofight"])
	 ic_ha_de_194_02()
	return  TRUE
--	BeginPlot(Global["Control"],"Lua_kors_ACboss_EndClear",0)
end

function Lua_kors_AC_FearADD()						--上戰慄
	 KORS_buffUpDown(TargetID(),621967,0,1)
local room = ReadRoleValue(TargetID(),EM_RoleValue_RoomID)
local Global = KORS_ACBoss_Global[room]
--	if Global["skillCheck"] == 0 then
--	Global["skillCheck"] = 1
--	end
end

--------------------------------------------------------------------------------------------------------------------
--水晶相關
--------------------------------------------------------------------------------------------------------------------


function Lua_kors_AC_CrystalUse()
local player = OwnerID()
local crystal = TargetID()
	
	 if BeginCastBarEvent( player, crystal , "[499101]", 30, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0 , "Lua_kors_ACcryMirror") ~= 1 then
		ScriptMessage( Player , Player , 1 , "[SAY_NPC_BUSY]" , 0 ) --目標忙碌中
	End
end

function Lua_kors_ACcryMirror(player , Result)						--水晶技能

local crystal = TargetID()
local room = ReadRoleValue(player,EM_RoleValue_RoomID)
local Global = KORS_ACBoss_Global[room]
local center = Global["center"]
local Mirror = Global["Mirror"]
local reborn
local RandPOS = RandRange(1,360)
local RandRang = RandRange(90,250)
	if Result >= 0 then
		EndCastBar(player,Result)
		CastSpell(player,player,499101)
	   	reborn =KORS_CreateObjPosition(120427,center,1,RandRang,RandPOS)
		SetPlot(reborn,"touch","Lua_kors_AC_CrystalUse",40)
		AddToPartition(reborn,room)	
		SysCastSpellLv(crystal,player,499102,1)
		CancelBuff(player,621967)
			table.insert(Mirror,reborn)
		Sleep(20)			
		DelObj(crystal)
	else
		EndCastBar(player,Result)
		SetPlot(crystal ,"touch","Lua_kors_AC_CrystalUse",40)
	end
end

function Lua_kors_AC_CrystalBoom()					--水晶爆炸
local crystal = OwnerID()
local TAG = TargetID()
local room = ReadRoleValue(Tag,EM_RoleValue_RoomID)
local Global = KORS_ACBoss_Global[room]
local lock = 0
	if ReadRoleValue(TAG,EM_RoleValue_IsNPC) ~= 0 and ReadRoleValue(TAG,EM_RoleValue_OrgID) == 106636 then
		Global["Boom"] = Global["Boom"] +1
		callplot(Global["Control"],"Lua_kors_ACboss_illusionBoom",Tag)
		KORS_buffUpDown(Global["Boss"],621968,1,1)
	elseif ReadRoleValue(TAG, EM_RoleValue_IsNPC) == 0 then
		AddBuff(Tag,621969,1,3)
	end
end


			
function Lua_kors_AC_FearEat()						--戰慄之噬
local player = TargetID()
local boss = OwnerID()
local pos = Lua_BuffPosSearch( player, 621967 )
local lv = BuffInfo( player, pos , EM_BuffInfoType_Power )
	if lv ~= nil then
	 SysCastSpellLv(boss,player,499107,lv)
	CancelBuff(player,621967)
	end
end 