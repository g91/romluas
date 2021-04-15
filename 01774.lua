-----清除隱行Buff用
----只有需要清一個Buff的，另一個變數要填入「0」
function Apon_Skill_ClearBuff(Buff1,Buff2) 
	if CheckBuff( OwnerID() , Buff1) == true then
		Cancelbuff(OwnerID(),Buff1)
	end
	if CheckBuff( OwnerID() , Buff2) == true then
		Cancelbuff(OwnerID(),Buff2)
	end
end

function AP_BornByMultilateral( MonsterID , X , dis )	--在周圍用MonsterID 圍成 X 角形
	local RoomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID)
	local Obj = Role:new( OwnerID() )
	local BaseX = Obj :X()
	local BaseY = Obj :Y()
	local BaseZ = Obj :Z()
	local BaseDir = Obj :Dir()
	local MonsterGroup = {}
	for i = 1 , X do
		MonsterGroup[ i ] =CreateObj( MonsterID, BaseX-dis*math.cos(math.pi*2*(i/X)),BaseY,BaseZ+dis*math.sin(math.pi*2*(i/X)),BaseDir, 1 )
		SetModeEx( MonsterGroup[ i ] , EM_SetModeType_HideName, false) --NPC 或物件頭上的名稱是否顯示
		SetModeEx( MonsterGroup[ i ] , EM_SetModeType_NotShowHPMP, true) --不顯示血條
	end
	for i = 1, table.getn(MonsterGroup) do
		AddToPartition(MonsterGroup[i],RoomID )
	end
	return MonsterGroup
end



function Apon_Skill_495367() ----影+法，陷阱大師
	local HitLv = ReadRoleValue(OwnerID(),EM_RoleValue_Fin_Phy_HitLv) ---- 讀主人的物理命中等級
	local Owner_LV = ReadRoleValue(OwnerID(),EM_RoleValue_LV) ---讀主人的等級
	local Owner_DMG = ReadRoleValue(OwnerID(),EM_RoleValue_Fin_Phy_Dmg) ---讀主人的物理Dmg 
	local Owner_ATK = ReadRoleValue(OwnerID(),EM_RoleValue_Fin_Phy_ATK) ---讀主人的物理ATK
	local PLeve_1 = ReadRoleValue( OwnerID() , EM_RoleValue_MagicPowerLv_SP+35 )---劇毒陷阱
	local PLeve_2 = ReadRoleValue( OwnerID() , EM_RoleValue_MagicPowerLv_SP+36 ) ----爆裂陷阱
	local PLeve_3 = ReadRoleValue( OwnerID() , EM_RoleValue_MagicPowerLv_SP+37 )  ----麻痺陷阱
	local Temp = {}
	local skills = {495386,495387,495388}
	local skills_Lv = {PLeve_1,PLeve_2,PLeve_3}
	Temp = AP_BornByMultilateral( 103588 , 3 , 15 )---（物件編號 ， 物件數量，物件間的距離）
	for i = 1 , 3 , 1 do
		if i == 1 then ---劇毒陷阱
			--local Skill_Lv = Owner_ATK*2
			--AddBuff (Temp[i] , 507316 , Skill_Lv , 60) ---ATK & DMG & HIT
			AddBuff (Temp[i] , 506390 , (Owner_ATK/20) , 60)
			AddBuff (Temp[i] , 506391 , (Owner_DMG/20) , 60)
			AddBuff (Temp[i] , 506396 , (HitLv/100) , 60)
		
		elseif i == 2 then ----爆裂陷阱
			--local Skill_Lv = Owner_ATK*2
			--AddBuff (Temp[i] , 507231 , Skill_Lv , 60) ---ATK & DMG & HIT
			AddBuff (Temp[i] , 506390 , (Owner_ATK/100) , 60)
			AddBuff (Temp[i] , 506391 , (Owner_DMG/100) , 60)
			AddBuff (Temp[i] , 506396 , (HitLv/100) , 60)
		
		elseif i == 3 then ----麻痺陷阱
			AddBuff (Temp[i] , 506390 , (Owner_ATK/100) , 60)
			AddBuff (Temp[i] , 506391 , (Owner_DMG/100) , 60)
			AddBuff (Temp[i] , 506396 , (HitLv/100) , 60)
		end
		--say(OwnerID(),"SKill ="..i.."="..skills_Lv[i])
		WriteRoleValue( Temp[i], EM_RoleValue_LV, Owner_LV)
		WriteRoleValue(Temp[i], EM_RoleValue_Livetime,2)
		SysCastSpellLV( OwnerID() , Temp[i] , skills[i] , skills_Lv[i] )---玩家施放陷阱到SNPC的腳下
		Delobj(Temp[i])
	end
	local ObjCount = SetSearchRangeInfo( OwnerID(),1000 )
	--say(OwnerID(),"Objcount ="..ObjCount)
	local OwnerGID = ReadRoleValue( OwnerID() , EM_RoleValue_DBID )
	for i = 1 , ObjCount , 1 do
		local ID = GetSearchResult()
		local ID_Owner = ReadRoleValue( ID ,EM_RoleValue_OwnerDBID )--找主人的GID
		local ID_Item = ReadRoleValue( ID ,EM_RoleValue_OrgID )--讀出此物件的ID
		if OwnerGID == ID_Owner then
			if ID_Item == 103588 then
			--say(ID,"1111")
				Delobj(ID)
			end
		end
	end
	AddBuff (OwnerID() , 506395 , 0 , 15)
end


function Apon_Skill_495367_checkbuff() ---陷阱大師的禁制，時間為15秒。
	if CheckBuff(OwnerID(),506395) == true then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_SKILLTIPS_495367]" , 1 ) ---你現在無法製造出任何陷阱
		return false
	else
		return true
	end
end




-----以下為影法系列的陷阱script
----OwnerID = 陷阱， Target ＝ 玩家
------ 主要還是以吃「物理傷害為主」

function Apon_Skill_Bomb_check() ---重新計算陷阱的數值
	ReCalculate( OwnerID())
end

--------------------------------------------------------------------------
function Apon_Skill_491341()  ----影法，爆裂陷阱
	local HitLv = ReadRoleValue(TargetID(),EM_RoleValue_Fin_Phy_HitLv) ---- 讀主人的物理命中等級
	local DMG = ReadRoleValue(TargetID(),EM_RoleValue_Fin_Phy_Dmg) ---讀主人的物理Dmg 
	local ATK = ReadRoleValue(TargetID(),EM_RoleValue_Fin_Phy_ATK) ---讀主人的物理ATK
	local LV = ReadRoleValue(TargetID(),EM_RoleValue_LV) ---讀主人的等級
	WriteRoleValue( OwnerID(), EM_RoleValue_LV, LV)
	local Skill_Lv = ATK*0.1
	AddBuff (OwnerID() , 507231 , Skill_Lv , 60) ---ATK & DMG & HIT
	--sleep(20)
	local LV_mob = ReadRoleValue(OwnerID(),EM_RoleValue_LV) 
	local DMG_mob = ReadRoleValue(OwnerID(),EM_RoleValue_Fin_Phy_Dmg)
	local ATK_mob = ReadRoleValue(OwnerID(),EM_RoleValue_Fin_Phy_ATK)
	local HitLv = ReadRoleValue(OwnerID(),EM_RoleValue_Fin_Phy_HitLv)
	--say(OwnerID(),"DMG_mob ="..DMG_mob)
	--say(OwnerID(),"ATK_mob ="..ATK_mob)
	--say(OwnerID(),"LV_mob ="..LV_mob)
	--say(OwnerID(),"HitLv ="..HitLv)
end


function Apon_Skill_491340()  ----影法，劇毒陷阱
	local HitLv = ReadRoleValue(TargetID(),EM_RoleValue_Fin_Phy_HitLv) ---- 讀主人的物理命中等級
	local DMG = ReadRoleValue(TargetID(),EM_RoleValue_Fin_Phy_Dmg) ---讀主人的物理Dmg 
	local ATK = ReadRoleValue(TargetID(),EM_RoleValue_Fin_Phy_ATK) ---讀主人的物理ATK
	local LV = ReadRoleValue(TargetID(),EM_RoleValue_LV) ---讀主人的等級
	WriteRoleValue( OwnerID(), EM_RoleValue_LV, LV)
	local Skill_Lv = ATK*0.2
	AddBuff (OwnerID() , 507316 , Skill_Lv , 60) ---ATK & DMG & HIT
	--AddBuff (OwnerID() , 506390 , (ATK/40) , 60)
	--AddBuff (OwnerID() , 506391 , (DMG/40) , 60)
	--AddBuff (OwnerID() , 506396 , (HitLv/100) , 60)
	--sleep(20)
	local LV_mob = ReadRoleValue(OwnerID(),EM_RoleValue_LV) 
	local DMG_mob = ReadRoleValue(OwnerID(),EM_RoleValue_Fin_Phy_Dmg)
	local ATK_mob = ReadRoleValue(OwnerID(),EM_RoleValue_Fin_Phy_ATK)
	--say(OwnerID(),"DMG_mob ="..DMG_mob)
	--say(OwnerID(),"ATK_mob ="..ATK_mob)
	--say(OwnerID(),"LV_mob ="..LV_mob)
end

function Apon_Skill_491341_Master()  ----影法，爆裂陷阱，陷阱大師用
	local HitLv = ReadRoleValue(TargetID(),EM_RoleValue_Fin_Phy_HitLv) ---- 讀主人的物理命中等級
	local DMG = ReadRoleValue(TargetID(),EM_RoleValue_Fin_Phy_Dmg) ---讀主人的物理Dmg 
	local ATK = ReadRoleValue(TargetID(),EM_RoleValue_Fin_Phy_ATK) ---讀主人的物理ATK
	local LV = ReadRoleValue(TargetID(),EM_RoleValue_LV) ---讀主人的等級
	WriteRoleValue( OwnerID(), EM_RoleValue_LV, LV)
	local Skill_Lv = ATK*0.12
	AddBuff (OwnerID() , 507231 , Skill_Lv , 60) ---ATK & DMG & HIT
	--sleep(20)
	local LV_mob = ReadRoleValue(OwnerID(),EM_RoleValue_LV) 
	local DMG_mob = ReadRoleValue(OwnerID(),EM_RoleValue_Fin_Phy_Dmg)
	local ATK_mob = ReadRoleValue(OwnerID(),EM_RoleValue_Fin_Phy_ATK)
	local HitLv = ReadRoleValue(OwnerID(),EM_RoleValue_Fin_Phy_HitLv)
	--say(OwnerID(),"DMG_mob ="..DMG_mob)
	--say(OwnerID(),"ATK_mob ="..ATK_mob)
	--say(OwnerID(),"LV_mob ="..LV_mob)
	--say(OwnerID(),"HitLv ="..HitLv)
end

function Apon_Skill_491340_Master()  ----影法，劇毒陷阱，陷阱大師用
	local HitLv = ReadRoleValue(TargetID(),EM_RoleValue_Fin_Phy_HitLv) ---- 讀主人的物理命中等級
	local DMG = ReadRoleValue(TargetID(),EM_RoleValue_Fin_Phy_Dmg) ---讀主人的物理Dmg 
	local ATK = ReadRoleValue(TargetID(),EM_RoleValue_Fin_Phy_ATK) ---讀主人的物理ATK
	local LV = ReadRoleValue(TargetID(),EM_RoleValue_LV) ---讀主人的等級
	WriteRoleValue( OwnerID(), EM_RoleValue_LV, LV)
	local Skill_Lv = ATK*0.3
	AddBuff (OwnerID() , 507316 , Skill_Lv , 60) ---ATK & DMG & HIT
	--AddBuff (OwnerID() , 506390 , (ATK/40) , 60)
	--AddBuff (OwnerID() , 506391 , (DMG/40) , 60)
	--AddBuff (OwnerID() , 506396 , (HitLv/100) , 60)
	--sleep(20)
	local LV_mob = ReadRoleValue(OwnerID(),EM_RoleValue_LV) 
	local DMG_mob = ReadRoleValue(OwnerID(),EM_RoleValue_Fin_Phy_Dmg)
	local ATK_mob = ReadRoleValue(OwnerID(),EM_RoleValue_Fin_Phy_ATK)
	--say(OwnerID(),"DMG_mob ="..DMG_mob)
	--say(OwnerID(),"ATK_mob ="..ATK_mob)
	--say(OwnerID(),"LV_mob ="..LV_mob)
end

function Apon_Eliteskill_492937_checkbuff_1()
	
	if CheckBuff( OwnerID() , 506400 ) == false and CheckBuff( OwnerID() , 506401 ) == false 
	and CheckBuff( OwnerID() , 506349 ) == false then 
		CancelBuff( OwnerID() , 506350 )
		--say(OwnerID(),"1111111")
	end
end

function Apon_Eliteskill_492937_Hate_1()
	local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
	if AttackTarget ~= 0 then
	--if HateListCount( OwnerID() ) ~= 0 then
		AddBuff (OwnerID() , 506401 , 0 , 10)
	end
end

function Apon_Eliteskill_492937_Hate_2()
	local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
	if AttackTarget ~= 0 then
	--if HateListCount( OwnerID() ) ~= 0 then
		AddBuff (OwnerID() , 506349 , 0 , 10)
	end
end

function Apon_Eliteskill_492937_clear()
	CancelBuff( OwnerID() , 506350 )
	CancelBuff( OwnerID() , 506349 )
end

function Apon_Eliteskill_492937_checkbuff()
	if CheckBuff( OwnerID() , 506400 ) == false and CheckBuff( OwnerID() , 506419 ) == true then
		sysCastSpellLV( OwnerID() , OwnerID() , 495405 , 0 )
		CancelBuff( OwnerID() , 506419 )
		--say(OwnerID(),"11111111")
	
	elseif CheckBuff( OwnerID() , 506401 ) == false and CheckBuff( OwnerID() , 506418 ) == true then
		sysCastSpellLV( OwnerID() , OwnerID() , 495406 , 0 )
		CancelBuff( OwnerID() , 506418 )
		--say(OwnerID(),"2222222")
	
	elseif	CheckBuff( OwnerID() , 506400 ) == false and CheckBuff( OwnerID() , 506401 ) == false 
	and CheckBuff( OwnerID() , 506349 ) == false then 
		CancelBuff( OwnerID() , 506350 )
		--say(OwnerID(),"3333333")
		
	end
end

function Apon_Eliteskill_493025() ----影+騎 光之淬煉	
local PLevel = ReadRoleValue( OwnerID(),  EM_RoleValue_MagicPowerLv_SP+57 )   -------------------------此法術的等級
	SysCastSpellLv( OwnerID(), OwnerID(), 493086 , PLevel ) 
	--CastSpellLv( OwnerID(), OwnerID(), 493086 , PLevel ) 
end	






	