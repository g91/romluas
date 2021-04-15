function Warden_main_493395()	--森牧 蓄力斬script
	local own = OwnerID()
	local RoomID = ReadRoleValue( own , EM_RoleValue_RoomID)
	local MainClass = ReadRoleValue ( own, EM_RoleValue_VOC)
	local SubClass = ReadRoleValue ( own, EM_RoleValue_VOC_SUB)
	local PlayerLV = ReadRoleValue(own, EM_RoleValue_LV)

--Say(own, "[493395]")
	-- 活力沸騰
	Warden_main_493401(own, MainClass, PlayerLV)
	-- 森/神 自然泉源
	Warden_main_494362(own, MainClass, SubClass)
end

function Warden_main_493392()	--森牧 木靈之力script
	local own = OwnerID()
	local RoomID = ReadRoleValue( own , EM_RoleValue_RoomID)
	local MainClass = ReadRoleValue ( own, EM_RoleValue_VOC)
	local SubClass = ReadRoleValue ( own, EM_RoleValue_VOC_SUB)
	local PlayerLV = ReadRoleValue(own, EM_RoleValue_LV)

--Say(own, "[493392]")
	-- 活力沸騰
	Warden_main_493401(own, MainClass, PlayerLV)
end

function Warden_main_493401(own, MainClass, PlayerLV)	--森牧 活力沸騰script
	if MainClass == 7 and PlayerLV >= 40 and CheckBuff(own, 620677) == false then
		SysCastSpellLv( own, own, 493414, 1 )
--Say(own, "[493401]".."Heal")
	end
end

function Warden_main_494362(own, MainClass, SubClass)	--森/神 自然泉源script
	if MainClass == 7 and SubClass == 8 and CheckFlag(own, 543124) == true and CheckBuff(own, 505205) == false then
		local PosX = ReadRoleValue(own, EM_RoleValue_X)
		local PosY = ReadRoleValue(own, EM_RoleValue_Y)
		local PosZ = ReadRoleValue(own, EM_RoleValue_Z)
		SysCastSpellLv_Pos( own, PosX, PosY, PosZ, 494606, 1 )
--Say(own, "[494362]".."Heal")
	end
end
------------------------------------------------------------------------------------------------------------------------
--					召喚寵物相關
------------------------------------------------------------------------------------------------------------------------
function lua_Dy_PetHelpCheck()
	if CheckBuff (OwnerID() , 620951) == true then --套裝技能被動協定契約 
			AddBuff( OwnerID() ,504566 ,0 , 3) --原服從契約的效果，協定契約續用
			ReCalculate(OwnerID() )
	elseif CheckBuff( OwnerID() , 506461) == true then --套裝技能寵物大師-50%施法速度
			AddBuff( OwnerID() ,506517 ,0 , 3) ------add 施法減短的實際效果
			ReCalculate(OwnerID() )
	end
	----- 先檢查身上有無前一隻寵物的被動效果

	--[[if CheckBuff( OwnerID() , 620682) == true then --檢查自己有無橡樹之靈被動
		CancelBuff_NoEvent( OwnerID(), 620682 )
	elseif CheckBuff( OwnerID() , 620678) == true then --檢查自己有無橡樹行者被動
		CancelBuff(OwnerID(),620678)
	elseif CheckBuff( OwnerID() , 620709) == true then --檢查自己有無橡樹行者森法35被動
		CancelBuff(OwnerID(),620709)
	elseif CheckBuff( OwnerID(), 503948 ) == true then --檢查自己有無自然晶體被動
		CancelBuff( OwnerID(), 503948 )
	elseif CheckBuff( OwnerID(), 500499) == true then --檢查自己有無森遊人馬的強化被動
		CancelBuff(OwnerID(),500499)
	end--]]
	return true
end
function lua_Dy_PetHelpCheck_1() --招喚另一個寵物的時候，招喚取代成功才刪除增益效果

	----- 先檢查身上有無前一隻寵物的被動效果

	if CheckBuff( OwnerID() , 620682) == true then --檢查自己有無橡樹之靈被動
		CancelBuff_NoEvent( OwnerID(), 620682 )
	elseif CheckBuff( OwnerID() , 620678) == true then --檢查自己有無橡樹行者被動
		CancelBuff_NoEvent(OwnerID(),620678)
	elseif CheckBuff( OwnerID() , 620709) == true then --檢查自己有無橡樹行者森法35被動
		CancelBuff_NoEvent(OwnerID(),620709)
	elseif CheckBuff( OwnerID(), 503948 ) == true then --檢查自己有無自然晶體被動
		CancelBuff_NoEvent( OwnerID(), 503948 )
	elseif CheckBuff( OwnerID(), 500499) == true then --檢查自己有無人馬的強化被動
		CancelBuff_NoEvent(OwnerID(),500499)
	end
	return true
end

function Lua_PetAttribute()
	star_skill_PetSpawnBuff(7)	--加上一個檢查主職用的Buff
	local Pet = OwnerID()
	local PetID = ReadRoleValue( Pet, EM_RoleValue_OrgID )
	local Master = ReadRoleValue ( Pet , EM_RoleValue_OwnerGUID )
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


	local AttributeTable = {ATK, MATK, DEF, MDEF, DMG, MDMG, HIT, MHIT, CRI, MCRI, HP}
	local AttributeRatio ={	--寵物的各項屬性加權係數,按照上面順序
				[102297]={0.08, 0, 0.3, 0.1, 0.08, 0.8, 0.8, 0, 0.3, 0, 0.1};		--橡樹之靈
				[102324]={0.1, 0, 0.03, 0.03, 0.1, 0, 0.8, 0, 0.8, 0, 0.08};		--橡樹行者
				[102325]={0.01, 0.1, 0.01, 0.1, 0, 0.5, 0.5, 0.8, 0, 0.3, 0.08};	--自然晶體
				[102803]={0.15, 0, 0.03, 0.03, 0.1, 0, 0.8, 0, 0.3, 0, 0.06};}		--半人馬凱隆

	local AttributeBuff = 507185	--下面的for迴圈用來當作基礎值的，實際上是從507186開始
	for i=1,table.getn(AttributeTable) do
		AddBuff (Pet , AttributeBuff+i , (AttributeTable[i]*AttributeRatio[PetID][i]) , -1)
	end

	----- 以上都是寵物的各項屬性設定

	AddBuff( Pet ,620706 ,0, -1 )	-- 620706 是在寵物身上 偵測死亡刪除
	AddBuff( Pet ,504196 ,0, -1 )	-- 504196 是在寵物身上 範圍減傷

	-----	森牧 自然血緣
	if ReadRoleValue( Master, EM_RoleValue_LV ) >= 34 then
		local PLevel = ReadRoleValue( Master , EM_RoleValue_MagicPowerLv_SP+17 ) ---------填資料表的時候記得把LV位置填上去
		if ReadRoleValue(Pet, EM_RoleValue_OrgID ) == 102325 then	--自然晶體的跟別人不一樣 包含無敵跟無法進行攻擊的效果
			AddBuff(Pet, 504898, PLevel, -1)
		else
			SysCastSpellLv ( Pet, Pet, 493563,  PLevel  )
		end
	end
	-----	森牧/遊俠 20 馴獸師
	if CheckFlag( Master , 543091 ) == true and ReadRoleValue( Master, EM_RoleValue_VOC ) == 7 and  ReadRoleValue( Master, EM_RoleValue_VOC_SUB ) == 2 then
		local PLevel = ReadRoleValue( Master , EM_RoleValue_MagicPowerLv_SP+36 )
		AddBuff( Pet ,504514 , PLevel, -1 )	--爆擊Buff
		AddBuff( Pet ,506421 , PLevel, -1 )	--閃躲Buff
	end
	-----	森牧/遊俠 35 默契
	if CheckFlag( Master , 543121 ) == true and ReadRoleValue( Master, EM_RoleValue_VOC ) == 7 and  ReadRoleValue( Master, EM_RoleValue_VOC_SUB ) == 2 and ReadRoleValue(Pet, EM_RoleValue_OrgID ) == 102803 then
		local PLevel = ReadRoleValue( Master , EM_RoleValue_MagicPowerLv_SP+39 )
		AddBuff( Pet ,505184 , PLevel, -1 )
	end
	-----	森牧/遊俠 60 微風環繞
	if CheckFlag( Master, 546825 ) == true and ReadRoleValue( Master, EM_RoleValue_VOC ) == 7 and  ReadRoleValue( Master, EM_RoleValue_VOC_SUB ) == 2 and ReadRoleValue(Pet, EM_RoleValue_OrgID ) == 102803 then
		AddBuff( Pet ,623251 , 0, -1 )
	end
	-----	森牧/法師 20 橡樹堅韌
	if CheckFlag( Master, 543093 ) == true and ReadRoleValue( Master, EM_RoleValue_VOC ) == 7 and  ReadRoleValue( Master, EM_RoleValue_VOC_SUB ) == 4 then
		local PLevel = ReadRoleValue( Master , EM_RoleValue_MagicPowerLv_SP+52 )
		AddBuff( Pet ,504600 , PLevel, -1 )
	end
	-----	森牧/神官 25 敏銳反應
	if CheckFlag( Master, 543104 ) == true and ReadRoleValue( Master, EM_RoleValue_VOC ) == 7 and  ReadRoleValue( Master, EM_RoleValue_VOC_SUB ) == 8 then
		local PLevel = ReadRoleValue( Master , EM_RoleValue_MagicPowerLv_SP+61 )
		AddBuff( Pet ,504711 , PLevel, -1 )
		AddBuff( Pet ,506422 , PLevel, -1 )---0327阿龐新增，閃躲等級
	end
end

function Lua_PetDie() --寵物死亡 刪除強化效果
	local Pet = OwnerID()
	local Master = ReadRoleValue ( Pet , EM_RoleValue_OwnerGUID )
	local PetID = ReadRoleValue( Pet, EM_RoleValue_OrgID )
	local PetBuff = {620682, 620678, 503948, 500499}
	for i=1,table.getn(PetBuff) do
		if CheckBuff( Master, PetBuff[i] ) == true then CancelBuff_NoEvent( Master , PetBuff[i] ) end --消除主人身上的Buff
	end
end	

function Lua_MasterDie() --主人死亡 刪除寵物
	local MyPet = ReadRoleValue ( OwnerID() , EM_RoleValue_PetID )
	if CheckID( MyPet ) == true then
		DelObj ( MyPet )
	end
end

------------------------------------------------------------------------------------------------------------------------
--					寵物技能相關
------------------------------------------------------------------------------------------------------------------------

function Dy_Pet01_CRI() --橡樹行者 主人爆擊觸發額外野萼打擊
	local Player = OwnerID()
	local MyPet = ReadRoleValue ( Player , EM_RoleValue_PetID ) ------抓寵物ID
	local Target = ReadRoleValue( Player, EM_RoleValue_AttackTargetID)  --當前目標
	local PLevel = ReadRoleValue( Player , EM_RoleValue_MagicPowerLv_SP+14 ) --野萼打擊的等級
	if CheckFlag( Player, 543123 ) == true and ReadRoleValue( Player, EM_RoleValue_VOC ) == 7 and  ReadRoleValue( Player, EM_RoleValue_VOC_SUB ) == 4 then
		SysCastSpellLv ( MyPet, Target, 498233,  PLevel  ) --森/法 35 靈魂回饋 強化過的野萼打擊
	else	
		SysCastSpellLv ( MyPet, Target, 493385,  PLevel  ) --施放野萼打擊
	end
end

function Dy_WS25MISS(Condition) --半人馬凱隆 人馬之箭觸發
	local Pet = OwnerID()
	local Master = ReadRoleValue ( Pet , EM_RoleValue_OwnerGUID )
	local SkillLevel = ReadRoleValue( Master , EM_RoleValue_MagicPowerLv_SP+67 ) --人馬之箭的等級
	
	if Condition == 0 or  Condition == 10 then	--未命中
		SysCastSpellLv ( Pet, Pet, 498218,  SkillLevel  )
		return
	elseif Condition == 2 and checkbuff(Pet,620705) == true then	--爆擊
		CancelBuff(Pet,620705)
	end
	if CheckFlag(Master, 546826) == true then
		AddBuff(Master, 623252, 0, 8)
	end

--	if Condition == 2 and checkbuff(Pet,620705) == true then
--		CancelBuff(Pet,620705)
--	elseif Condition == 0 or  Condition == 10 then 
--		SysCastSpellLv ( Pet, Pet, 498218,  0  )
--	end	
end
------------------------------------------------------------------------------------------------------------------------
--			精英技能 - 森牧 / 遊俠
------------------------------------------------------------------------------------------------------------------------
--犧牲 - 使用前判斷
function YoYo_WS50_CheckPet() 	
	local MyPet = ReadRoleValue ( OwnerID() , EM_RoleValue_PetID )	--抓寵物ID
	if CheckID( MyPet ) == true then
		return true
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_5]" , 1 )
		return false
	end
end
--犧牲 - 給寵物虛弱狀態
function lua_Dy_PetByeWS50()
	local MyPet = ReadRoleValue ( OwnerID() , EM_RoleValue_PetID )	--抓寵物ID
	if CheckID( MyPet ) == true then
		AddBuff ( MyPet, 503639, 0, 30 )
		return true
	else
		return false
	end
end