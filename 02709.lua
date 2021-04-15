--影者
------------------------------------------------影戰60LV 毒性感染
function lua_un_DrugCancel()
local PLevel = ReadRoleValue( OwnerID() , EM_RoleValue_MagicPowerLv_SP+24 )  --
SysCastSpellLv	( OwnerID(), TargetID() , 499478 , PLevel)
CancelBuff( TargetID(), 502894 )
end

function un_491506() --烈火能量
local  PLevel = ReadRoleValue( OwnerID() ,EM_RoleValue_MagicPowerLv_SP+32 )
SysCastSpellLv	( OwnerID(), TargetID() , 490204 , PLevel)
end


function un_493260() --魔力翻騰
local own = OwnerID()

	if checkbuff(own,503181) == true then
		cancelbuff(own,503181)
	end
end
function un_499507() --強化魔力翻騰禁制
	if CheckBuff( OwnerID() , 623034) == true then 
		return false
	else
		addbuff(OwnerID(),623034,0,30)
		return true
	end	
end

function un_499510_1() --邪惡手段精通 for卑鄙手段
local own = OwnerID()
local plv = ReadRoleValue( own ,EM_RoleValue_MagicPowerLv_SP+1 )
sysCastSpellLv(own,own,491543,plv)
end
function un_499510_2() --邪惡手段精通 for死角攻擊
local own = OwnerID()
local plv = ReadRoleValue( own ,EM_RoleValue_MagicPowerLv_SP+4 )
sysCastSpellLv(own,own,491543,plv)
end
function un_499510_3() --邪惡手段精通判斷自己的話不上buff
local own = OwnerID()
	if own == TargetID() then
		return false
	else
		return true
	end
end
function un_499542() --重振
local own = OwnerID()
local plv = FN_CountBuffLevel(own,623072)
sysCastSpellLv(own,own,499543,plv)
cancelbuff(own,623072)
end

function un_Skill_IsHuman()
	local MobDBID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	local MobSex = GameObjInfo_Int( MobDBID , "Sex" )
	if ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) == 1 
		or MobSex >= 3 then
		--ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_14]" , 1 )
		return false
	else
		--un_Skill_IsHuman_return()
		return true
	end	
end
--影者
------------------------------------------------影戰60LV 毒性感染


function un_skill_101686()	--炎靈
	star_skill_PetSpawnBuff(4)
	local Master = ReadRoleValue ( OwnerID() , EM_RoleValue_OwnerGUID )	
	local ATK = ReadRoleValue( Master , EM_RoleValue_Fin_Phy_ATK) ---抓主人攻擊力
	local MATK = ReadRoleValue( Master , EM_RoleValue_Fin_Mag_ATK) ---抓主人法術攻擊力
	local DEF = ReadRoleValue( Master , EM_RoleValue_Fin_Phy_Def) ---抓主人防禦力
	local MDEF = ReadRoleValue( Master , EM_RoleValue_Fin_Mag_Def) ---抓主人法術防禦力
	local DMG = ReadRoleValue( Master , EM_RoleValue_Fin_Phy_Dmg) ---抓主人物理傷害
	local MDMG = ReadRoleValue( Master , EM_RoleValue_Fin_Mag_Dmg) ---抓主人法術傷害
	local HIT = ReadRoleValue( Master , EM_RoleValue_Fin_Phy_HitLv) ---抓主人物理命中等級
	local MHIT = ReadRoleValue( Master , EM_RoleValue_Fin_Mag_HitLv) ---抓主人法術命中等級
	local CRI = ReadRoleValue( Master , EM_RoleValue_Fin_Phy_CritRate) ---抓主人爆擊等級
	local MCRI = ReadRoleValue( Master , EM_RoleValue_Fin_Mag_CritRate) ---抓主人法爆等級
	local HP = ReadRoleValue( Master , EM_RoleValue_MaxHP) ---抓主人血量上限
	local LV = ReadRoleValue(Master,EM_RoleValue_LV) ---讀主人的等級
	AddBuff (OwnerID() , 507186 , (ATK*0.05) , -1)
	AddBuff (OwnerID() , 507187 , (MATK*0.5) , -1)
	AddBuff (OwnerID() , 507188 , (DEF*0.1) , -1)
	AddBuff (OwnerID() , 507189 , (MDEF*0.5) , -1)
	AddBuff (OwnerID() , 507191 , (MDMG*0.4) , -1)
	AddBuff (OwnerID() , 507193 , (MHIT*0.8) , -1)
	AddBuff (OwnerID() , 507195 , (MCRI*0.8) , -1)
	AddBuff (OwnerID() , 507196 , (HP*0.02) , -1)
local PLevel = ReadRoleValue( Master , EM_RoleValue_MagicPowerLv_SP+28 ) --森法橡樹堅韌
	if CheckFlag( Master, 542112 ) == true and ReadRoleValue( Master, EM_RoleValue_VOC ) == 4 and  ReadRoleValue( Master, EM_RoleValue_VOC_SUB ) == 2 and  ReadRoleValue( Master, EM_RoleValue_LV ) >= 50 then
		AddBuff( OwnerID() ,620185 , PLevel, 25 )
		AddBuff( Master ,620185 , PLevel, 25 )
		--say (OwnerID() , "Def is True")
	else 
		--say (OwnerID() , "Def is False")
	end
SetPlot( OwnerID(),"dead","un_skill_101686_die",0 )
local ttime =0
--say(OwnerID(),"ttime1 = "..ttime)
--say(Master,"ttime2 = "..ttime)
	while 1 do
		--say(OwnerID(),"ttime = "..ttime)
		ttime = ttime + 1
		sleep(10)
		if ttime >39 then
			--addbuff(Master,623178,0,-1)
			sysCastSpellLv(Master,Master,499655,10)
		end
	end
end
function un_skill_101686_die()
local Master = ReadRoleValue ( OwnerID() , EM_RoleValue_OwnerGUID )
--addbuff(Master,623178,0,-1)
sysCastSpellLv(Master,Master,499655,10)
end

function un_skill499597()  --風火雙修
local own = OwnerID()
local plv1 = ReadRoleValue( own ,EM_RoleValue_MagicPowerLv_SP+22 )
local plv2 = ReadRoleValue( own ,EM_RoleValue_MagicPowerLv_SP+26 )
		CancelBuff_NoEvent(OwnerID(),623185)
		addbuff(own,623180,plv1,-1)
		addbuff(own,623181,plv2,-1)
		addbuff(own,623185,0,-1)
	--[[if checkbuff(own,623185) == false then
		addbuff(own,623180,plv1,-1)
		addbuff(own,623181,plv2,-1)
		addbuff(own,623185,0,-1)	
	end--]]
end

function un_un_skill499597del()
CancelBuff_NoEvent(OwnerID(),623180)
CancelBuff_NoEvent(OwnerID(),623181)
CancelBuff_NoEvent(OwnerID(),623185)
end

function un_skill493055() --暗影之懼
local own = OwnerID()
local plv = ReadRoleValue( own ,EM_RoleValue_MagicPowerLv_SP+30 )--497768
sysCastSpellLv(own,TargetID(),497768,plv)
end

function un_skill493055_1() --暗影之懼
local own = OwnerID()
say(OwnerID(),"123")
return true
end

function un_skill499604() --男爵之傲
local own = OwnerID()
Lua_CDtime_set(own,493320,-3)
--say(own,"fire")
end

function un_skill499623() --地脈連結
	addbuff(OwnerID(),623224,0,-1)
	addbuff(OwnerID(),504899,0,-1)
	addbuff(OwnerID(),509793,0,-1)
end
function un_499589() --地脈連結
local own = OwnerID()
local sta = ReadRoleValue( own ,EM_RoleValue_FinSta )
local str = ReadRoleValue( own ,EM_RoleValue_FinStr )
local intlv = (sta+str)/2
addbuff(own,623148,intlv,-1)
end
function un_505155()--聯繫
addbuff(OwnerID(),505155,0,-1)
end

function lua_star_SleepDagger_ForMob_job32() --影遊麻醉射擊的患目標判斷for怪物
	local IsMob = lua_star_Skill_ForMob()
	lua_star_controlcheck( 623021 )
	return IsMob
end
function lua_star_SleepDagger_ForPlayer_job32() --影遊麻醉射擊的患目標判斷for玩家
	local IsPlayer = lua_star_Skill_ForPlayer()
	lua_star_controlcheck( 623022 )
	return IsPlayer
end

--影行者/法師 新版 對不起亂放這邊
	--躍動刀鋒
function lua_skill_491180_count()
	local player = OwnerID()
	local ResetTimes = 2
	AddBuff(player, 501277, 0, 2)
--	Say(player, "in")
	local BuffLV = FN_CountBuffLevel(player,501277)
--	Say(player, "BuffLV="..BuffLV)

	if BuffLV >= ResetTimes then
		CancelBuff(player, 501277)
		CallPlot( player, "lua_skill_491180_resetCD",  player)
	end
end

function lua_skill_491180_resetCD(player)
	Sleep(5)
	Lua_CDtime_set(player, 491180, 6)
end
	--附魔投擲
function lua_skill_491178_HitEffect_Auto()
	local player = OwnerID()
	local tar = TargetID()
	--滿天花雨 擊中減少CD
	if DW_Rand(2) == 1 then
		Lua_CDtime_set(player, 491183, -1)
	end
end

function lua_skill_491178_HitEffect()
	local player = OwnerID()
	local tar = TargetID()
	--滿天花雨 擊中減少CD
	Lua_CDtime_set(player, 491183, -1)
end
function un_499858() --抑制救贖
	local tar = TargetID()
	local Count = BuffCount( tar )
	local buffid
	local skilllv = 0
	local tablein = {}
	for i = 1 , Count ,1 do
		buffid = BuffInfo( tar , i-1 , EM_BuffInfoType_BuffID )
		local Value = GameObjInfo_Int(buffid,"SettingFlag");
		if	CheckBit(Value,0)==true	then
		else
			table.insert(tablein, buffid)
		end
	end
	skilllv = #(tablein)
	if skilllv > 0 then
		--[[for i = 1 , skilllv do
		
			Cancelbuff(tar,tablein[i])
		end--]]
	addbuff(OWnerID(),623450,skilllv,-1)
		if tar ~= OwnerID() then
			SysCastSpellLv(OwnerID(),OwnerID(),499845,0)   --對自己施放治療術
		end
	end
	return true
end
function Un_Job_WM_45_FireAndWin_WP()
	local OwnerID = OwnerID()
	if CheckBuff ( OwnerID , 623185 ) == true then
		ScriptMessage( OwnerID , OwnerID , 1 , "[SC_LV60_SKILL_WM_WP]" , 1 )
		return false
	else
		return true
	end
end
function un_621188() --苦痛蔓延
	local own = OwnerID()
	local tar = TargetID()
	local powerLV1 = ReadRoleValue( own , EM_RoleValue_MagicPowerLv_normal+1 ) --耗弱織咒
	local powerLV2 = ReadRoleValue( own , EM_RoleValue_MagicPowerLv_normal+4 ) --心靈苦痛
	local powerLV3 = ReadRoleValue( own , EM_RoleValue_MagicPowerLv_SP+0 )     --感知榨取
--	Addbuff(tar,501577,powerLV1,-1)
--	Addbuff(tar,621188,powerLV2,-1)
--	Addbuff(tar,621701,powerLV3,-1)

	SysCastSpellLv(own,tar,499748,powerLV1)
	SysCastSpellLv(own,tar,499749,powerLV2)
	SysCastSpellLv(own,tar,499750,powerLV3)
end
function un_623522_CD() --冥想之徑+15sCD
local own = OwnerID()
	if checkbuff(own,623522) == true then
		return false
	else
		addbuff(own,623522,0,-1)
		return true
	end
end
function un_Skill_IsHuman_return()
	local MobDBID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	local MobSex = GameObjInfo_Int( MobDBID , "Sex" )
	if ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) == 1 then
		
		return true
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_14]" , 1 )
		return false
	end	
end	
function un_Skill_IsHuman_return_1()
	local MobDBID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	local MobSex = GameObjInfo_Int( MobDBID , "Sex" )
	if ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) == 1 
		or MobSex >= 3 then
		return false
	else
		return true
	end	
end

function skill_490281_check()
	local Oid = OwnerID();
	if CheckBuff( Oid, 620407   )==true then
		local SkillMP=GameObjInfo_Int( 490281 ,"CostValue" );--技能所需消耗的MP
		local BuffLv = KS_CheckBuffLV( Oid , 620407   );--Buff等級
		local AddMP = BuffLv*( ReadRoleValue(Oid,EM_RoleValue_MAXMP)*(5/100) );--額外消耗的MP
		local Result = ReadRoleValue(Oid, EM_RoleValue_MP)- ( SkillMP + AddMP );
		--say(Oid,"Result = "..Result)
		if Result<0 then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[WARRING_SKILL_ABSENCE_MP]" , 1 )--要提示MP不足
			return false
		end
		for i=1 , BuffLv do
			SysCastSpellLv( Oid , Oid , 498046  , 1 );--先扣魔力
		end
	end
	return true
end
function un_491640_1()--聖光之佑 own~=own
	if ownerid() ~=targetid() then
		return true
	else
		return false
	end
end	
function un_491640_2()--聖光之佑 own=own
	if ownerid() ==targetid() then
		return true
	else
		return false
	end
end		

function bico_491178_skillfixPowerLv()
	if CheckBuff( OwnerID(), 501274 ) ==true or CheckBuff( OwnerID(), 501279) == true then
		local PowerLv = ReadRoleValue( OwnerID() , EM_RoleValue_MagicPowerLv_Normal+1 )
		local WeaponID = GetItemInfo( OwnerID() , EM_ItemPacketType_EQ , 9 , EM_ItemValueType_OrgObjID )     -- 讀取彈藥欄位的ID 
	--	say( OwnerID(), "ID= "..WeaponID )
		if WeaponID ~= 0 then
			SysCastSpellLv( OwnerID() , TargetID() , 491179, PowerLv )
	--		say( OwnerID(), "own= "..PowerLv )
	--		say( TargetID(), "tar" )
		else
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SYS_GAMEMSGEVENT_123]",0 )
			if CheckBuff( OwnerID(), 501274 ) then
			CancelBuff( OwnerID(), 501274)
			elseif CheckBuff( OwnerID(), 501279 ) then
			CancelBuff( OwnerID(), 501279 )
			end
		end
	end

	local createchancePLV = ReadRoleValue( OwnerID() , EM_RoleValue_MagicPowerLv_Normal+41 )	--機會創造的施放判斷(因為無法與附魔投擲同時並存所做的修正)2013/10/17_BICO
	if CheckBuff( OwnerID(), 620301 ) == true then
		local r = Rand(100)
		if r <= 30 then
		SysCastSpellLv( OwnerID(), TargetID(), 493077, createchancePLV )
		end
	end
end

function bico_491178_SkillBulletCheck()
     local Player = OwnerID() 
     local WeaponID = GetItemInfo( Player , EM_ItemPacketType_EQ , 9 , EM_ItemValueType_OrgObjID )     -- 讀取彈藥欄位的ID 
     local WeaponType = GameObjInfo_Int( WeaponID ,"WeaponType" )     -- 抓取資料庫中設定好的類型，箭為14，投擲類則為16 
      
     if WeaponType == 16 then 
          return true 
     end      
     ScriptMessage( Player, Player, 1, "[SYS_GAMEMSGEVENT_123]",0 )
     return false
end  	