function LUA_YOYO_ChessGladiatorSkill_Chase() --秘法棋戰-棋鬥士-趁勝追擊，判斷目標是否狀態是否有暈眩狀態，若是則給予追加傷害效果
	local Tar = TargetID()
	local TarBuffCount = BuffCount(tar)
	local BuffCensor01 = Checkbuff(Tar , 623573)
	local BuffCensor02 = Checkbuff(Tar , 623603)
	local BuffCensor03 = Checkbuff(Tar , 623618)	
	local BuffCensor04 = Checkbuff(Tar , 623619)	
	local BuffCensor05 = Checkbuff(Tar , 623651)	
	if 
	BuffCensor01 == TRUE or 
	BuffCensor02 == TRUE or 
	BuffCensor03 == TRUE or 
	BuffCensor04 == TRUE or 
	BuffCensor05 == TRUE then
		return TRUE
	else	return FALSE
	end
end

function LUA_YOYO_ChessGladiatorSkill_Spiral() --秘法棋戰-棋鬥士-螺旋鑽，判斷目標是否狀態是否有破甲狀態，若是則給予追加流血效果
	local Tar = TargetID()
	local TarBuffCount = BuffCount(tar)
	local BuffCensor01 = Checkbuff(Tar , 623556)
	local BuffCensor02 = Checkbuff(Tar , 623610)
	if 
	BuffCensor01 == TRUE or 
	BuffCensor02 == TRUE then
		return TRUE
	else	return FALSE
	end
	if ReadRoleValue( Target , EM_RoleValue_IsNPC ) == 1 then --如果為NPC則此效果失效
		return false
	end
end

function LUA_YOYO_ChessGladiatorSkill_Shock() --秘法棋戰-棋鬥士-震盪波，判斷目標是否狀態是否有麻痺狀態，若是則給予追加倒地效果
	local Tar = TargetID()
	local TarBuffCount = BuffCount(tar)
	local BuffCensor01 = Checkbuff(Tar , 623612)
	if 
	BuffCensor01 == TRUE then
		return TRUE
	else	return FALSE
	end
end

function LUA_YOYO_ChessGladiatorSkill_Collide() --秘法棋戰-棋鬥士-蠻橫衝撞，瞬移至目標所在位置
	local Owner = OwnerID()
	local Target = TargetID()
	local SkillID = 850496
	local OwnerX , OwnerY , OwnerZ , OwnerDir = DW_Location(Owner) --取出自己的座標與面向
	local TargetX , TargetY , TargetZ , TargetDir = DW_Location(Target) --取出目標的座標與面向
	SetPos( OwnerID() , TargetX , TargetY , TargetZ , OwnerDir )
	SysCastSpellLv( Owner , Owner , SkillID , 1 )
end

function LUA_YOYO_ChessGladiatorSkill_Teleports() --秘法棋戰-棋鬥士-瞬身，瞬移至目標前方
	local Owner = OwnerID()
	local Target = TargetID()
	local TargetX , TargetY , TargetZ , Dir = DW_Location(Target) --取出目標的座標與面向
	local Dx , Dz
	Dir = Dir + 180
	
	if Dir>360 then
		Dir = Dir - 360
	end	
	
	Dir = (360 - Dir) / 57.2958
	
	for Angle = 15 , 0 , -5 do
		Dx = math.cos(Dir) * Angle
		Dz = math.sin(Dir) * Angle
		
		if CheckLine(Target , TargetX + Dx , TargetY , TargetZ + Dz) == true then
			break
		end
		
	end
	SetPos( OwnerID() , TargetX + Dx , TargetY , TargetZ + Dz , Dir )
end

function LUA_YOYO_HealLimit() --治療限制玩家
	local Owner = OwnerID()
	local Target = TargetID()
	if ReadRoleValue( Target , EM_RoleValue_IsPlayer ) == 0 then
		return false;
	else
		return true
	end
end

function LUA_YOYO_TeleportsLimit() --瞬身限制
	local Owner = OwnerID()
	local Target = TargetID()
	local RoomID = ReadRoleValue(Owner , EM_RoleValue_RoomID)
	local Sktalk = {"[DUELIST_SKILL_01]"}
	if ReadRoleValue( Target , EM_RoleValue_IsPlayer ) == 0 then
		return false;
	end
	if Owner == Target then
		ScriptMessage( Owner , Owner , 2 , Sktalk[1] , 2 )
		return false
	else
		return true
	end
end

function LUA_YOYO_ChessGladiatorSkill_TrapObj()	--精密陷阱讀取數值
	local Master = ReadRoleValue ( OwnerID() , EM_RoleValue_OwnerGUID )
	local ATK = ReadRoleValue( Master , EM_RoleValue_Fin_Phy_ATK) ---抓主人攻擊力
	local DMG = ReadRoleValue( Master , EM_RoleValue_Fin_Phy_Dmg) ---抓主人物理傷害
	local HIT = ReadRoleValue( Master , EM_RoleValue_Fin_Phy_HitLv) ---抓主人物理命中等級
	local CRI = ReadRoleValue( Master , EM_RoleValue_Fin_Phy_CritRate) ---抓主人爆擊等級
	local LV = ReadRoleValue(Master,EM_RoleValue_LV) ---讀主人的等級
		SetModeEx(OwnerID(),EM_SetModeType_Mark,false)
		SetModeEx(OwnerID(),EM_SetModeType_Searchenemy,false)
		SetModeEx(OwnerID(), EM_SetModeType_Move, false)
		SetModeEx(OwnerID(),EM_SetModeType_Fight, false) 
		SetModeEx(OwnerID(),EM_SetModeType_Strikback, false) 
		SetModeEx(OwnerID(),EM_SetModeType_HideName,false)              ---物件頭上是否顯示名稱
		SetModeEx(OwnerID(),EM_SetModeType_HideMinimap,false)           ---物件是否在小地圖上顯示
		SetModeEx(OwnerID(),EM_SetModeType_NotShowHPMP,false)           ---不顯示血條
	WriteRoleValue( OwnerID(), EM_RoleValue_LV, LV)
	--say (OwnerID() , "MASTERALV = "..LV)
	AddBuff (OwnerID() , 507186 , (ATK*0.5) , -1)
	--say (OwnerID() , "MASTERATK = "..ATK)
	AddBuff (OwnerID() , 507190 , (DMG*0.1) , -1)
	--say (OwnerID() , "MASTERDMG = "..DMG)
	AddBuff (OwnerID() , 507192 , (HIT*0.8) , -1)
	--say (OwnerID() , "MASTERHIT = "..HIT)
	AddBuff (OwnerID() , 507194 , (CRI*0.5) , -1)
	--say (OwnerID() , "MASTERCRI = "..CRI)
end

function LUA_YOYO_ChessGladiatorSkill_PrecisionTrap() --精密陷阱
	local own = OwnerID() --陷阱本身
	local RoomID=ReadRoleValue(own,EM_RoleValue_RoomID)
	local Master = ReadRoleValue ( own , EM_RoleValue_OwnerGUID ) -- 抓到主人
	local monster = LuaFunc_CreateObjByObj ( 107330 , own ) --在陷阱處產生一枚持續性的隱藏陷阱
	SetModeEx(monster,EM_SetModeType_Mark, false) --不可點選
	SetModeEx(monster,EM_SetModeType_HideName, false) --不顯示名稱
	SetModeEx(monster,EM_SetModeType_NotShowHPMP, false) --不顯是血條
	SetModeEx(monster,EM_SetModeType_Strikback, false) --不會反擊
	SetModeEx(monster,EM_SetModeType_Move, false) --不會移動
	SetModeEx(monster,EM_SetModeType_Fight, false) --不可砍殺
	SetModeEx(monster,EM_SetModeType_Searchenemy, false) --不會索敵
	SetModeEx(monster,EM_SetModeType_Obstruct, false) --沒有阻擋效果
	AddToPartition(monster,RoomID) --將陷阱顯示
	WriteRoleValue(monster,EM_RoleValue_register1,Master) --寫入臨時屬性1
	WriteRoleValue(monster,EM_RoleValue_Livetime,60) --寫入存在時間
	Beginplot(monster,"LUA_YOYO_ChessGladiatorSkill_PrecisionTrapEffect",0) --精密陷阱效果
end
function LUA_YOYO_ChessGladiatorSkill_PrecisionTrapEffect() --精密陷阱效果
	local own = OwnerID()
	local master = ReadRoleValue(own,EM_RoleValue_register1)
	while 1 do
		sleep(10)
		SysCastSpellLv(master,own,850436,0) --施展1級的陷阱傷害
	end
end

function LUA_YOYO_ChessGladiatorSkill_AbsoluteField() --絕對領域
	local own = OwnerID() --陷阱本身
	local RoomID = ReadRoleValue(own , EM_RoleValue_RoomID)
	local Master = ReadRoleValue ( own , EM_RoleValue_OwnerGUID ) -- 抓到主人
	local monster = LuaFunc_CreateObjByObj ( 107366 , own ) --在陷阱處產生一枚持續性的隱藏陷阱
	SetModeEx(monster , EM_SetModeType_Mark, false) --不可點選
	SetModeEx(monster , EM_SetModeType_HideName, false) --不顯示名稱
	SetModeEx(monster , EM_SetModeType_NotShowHPMP, false) --不顯是血條
	SetModeEx(monster , EM_SetModeType_Strikback, false) --不會反擊
	SetModeEx(monster , EM_SetModeType_Move, false) --不會移動
	SetModeEx(monster , EM_SetModeType_Fight, false) --不可砍殺
	SetModeEx(monster , EM_SetModeType_Searchenemy, false) --不會索敵
	SetModeEx(monster , EM_SetModeType_Obstruct, false) --沒有阻擋效果
	AddToPartition(monster , RoomID) --將陷阱顯示
	WriteRoleValue(monster , EM_RoleValue_register1,Master) --寫入臨時屬性1
	WriteRoleValue(monster , EM_RoleValue_Livetime,60) --寫入存在時間
	Beginplot(monster , "LUA_YOYO_ChessGladiatorSkill_AbsoluteFieldEffect",0) --絕對領域效果
end
function LUA_YOYO_ChessGladiatorSkill_AbsoluteFieldEffect() --絕對領域效果
	local own = OwnerID()
	local master = ReadRoleValue(own , EM_RoleValue_register1)
	while 1 do
		sleep(10)
		SysCastSpellLv(master , own , 850439 , 0) --施展1級的領域傷害
	end
end

function LUA_YOYO_499696_Itself() --毀天滅地自身緩速
	local Owner = OwnerID()
	local BuffID = 623666 --毀天滅地的緩速效果
	AddBuff( Owner , BuffID , 1 , 10)
	return true
end

function un_499696() --毀天滅地傷害陷阱
	local own = OwnerID()
	local Master = ReadRoleValue ( own , EM_RoleValue_OwnerGUID )
	SetModeEx(own,EM_SetModeType_Mark, false)
	SetModeEx(own,EM_SetModeType_HideName, true)
	SetModeEx(own,EM_SetModeType_NotShowHPMP, true)
	SetModeEx(own,EM_SetModeType_Strikback, false)
	SetModeEx(own,EM_SetModeType_Move, false)
	SetModeEx(own,EM_SetModeType_Fight, false)
	SetModeEx(own,EM_SetModeType_Searchenemy, false)
	SetModeEx(own,EM_SetModeType_Obstruct, false)
	addbuff(own,623661,0,-1)
	sleep(20)
	SysCastSpellLv(master,own,499739,1)
end

function un_623671() --絕對領域buff外觀
	addbuff(OwnerID(),623671,0,-1)
	local own = OwnerID()
	local master = ReadRoleValue(own , EM_RoleValue_OwnerGUID)
	while 1 do
		sleep(10)
		SysCastSpellLv(master , own , 850439 , 0) --施展1級的領域傷害
	end
end

function LUA_YOYO_KillPlayer() --死灰復燃：再度死亡效果
	local Own = OwnerID()
	KillID(Own , Own)
	return true
end

function LUA_YOYO_RemoveCooldown(BuffID) --治癒光環施法開關與清除冷卻
	local Owner = OwnerID()
	local SkillID = 499700 --治癒光環
	Lua_Hao_ResetColdown( Owner , SkillID , 0 ) --修改技能冷卻時間
	
	if CheckBuff( OwnerID() , BuffID ) == true then --Buff開關判斷
		CancelBuff( OwnerID() , BuffID )
		return false
	else
		return true
	end	
end

function LUA_YOYO_HaloCooldown() --治癒光環的冷卻時間
	local Owner = OwnerID()
	local SkillID = 499700 --治癒光環
	local CooldownTime = 10 --冷卻時間10秒
	local Type = GameObjInfo_Int( SkillID ,"ColdownType")  -- 抓這個法術的施法冷卻欄位次分類 - 冷卻類型
	WriteRoleValue( Owner , EM_RoleValue_Coldown_Job + Type , CooldownTime )
end

function LUA_YOYO_Huiguangfanzhao(BuffID) --迴光返照死亡倒數狀態不疊加
	if CheckBuff( OwnerID() , BuffID ) == true then --Buff開關判斷
		return false
	else
		return true
	end	
end

function LUA_YOYO_BurstSeed() --爆裂種子不會炸到自己
	local Owner = OwnerID()
	local Target = TargetID()
	if Owner == Target then
		return false
	end
	if ReadRoleValue( Target , EM_RoleValue_IsPlayer ) == 0 then --如果為NPC則此效果失效
		return false
	end
end

function YOYO_MonsterCantDot() --祕法棋戰的怪物免疫所有持續傷害效果
	local Owner = OwnerID()
	local BuffID = 623850 --祕法屏蔽
	AddBuff( Owner , BuffID , 1 , -1 )
end
	
function YOYO_DotCantMonster() --祕法棋戰的DOT效果對怪物無效
	local Owner = OwnerID()
	local Target = TargetID()
	if ReadRoleValue( Target , EM_RoleValue_IsNPC ) == 1 then --如果為NPC則此效果失效
		return false
	end
end