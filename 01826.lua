function Apon_Check_Job(ID) ----判斷職業用
	local Job = ReadRoleValue( OwnerID() , EM_RoleValue_VOC )
	local Job_sub = ReadRoleValue( OwnerID() , EM_RoleValue_VOC_SUB )
	
	if ID == 1 then
		if Job == 1 or Job_sub == 1 or Job == 10 or Job_sub == 10 then
			return true
		else
			return false
		end
		
	elseif ID == 2 then	
		if Job == 2 or Job_sub == 2 or Job == 9 or Job_sub == 9 then 
			return true
		else
			return false
		end
	
	elseif ID == 3 then
		if Job == 3 or Job_sub == 3 then 
			return true
		else
			return false
		end
	end
end

function Apon_Check_Job_45678() ----判斷職業用
	local Job = ReadRoleValue( OwnerID() , EM_RoleValue_VOC )
	local Job_sub = ReadRoleValue( OwnerID() , EM_RoleValue_VOC_SUB )
		
	if Job ~= 1 and Job_sub ~= 1 and Job ~= 2 and Job_sub ~= 2 and Job ~= 3 and Job_sub ~= 3 
		and Job ~= 9 and Job_sub ~= 9	and Job ~= 10 and Job_sub ~= 10   then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_SKILLTIPS_495494]" , 1 )
	else
		return true
	end
end

function Apon_Suitskill_495481()---- 套裝技，法師，魔力回流連續檢查buff用
	if CheckBuff( OwnerID() , 506456) == false then
		SysCastSpellLV( OwnerID() , OwnerID() , 495584 , 0 )
		--AddBuff (OwnerID() , 506456 , 0 , 60)
	end
end

function Apon_Suitskill_495482()---套裝技能，法師，神選，二選一用
	local Buff_1 = 506670
	local Buff_2 = 506582
	local Chose = Rand(100)+1
	if Chose <= 100 and Chose >= 80 then
		AddBuff (OwnerID() , Buff_1 , 0 , 10)
	elseif Chose <= 79 and Chose >= 60 then
		AddBuff (OwnerID() , Buff_2 , 0 , 10)
	elseif Chose <= 59 and Chose >= 40 then
		AddBuff (OwnerID() , Buff_1 , 0 , 10)
	elseif Chose <= 39 and Chose >= 20 then
		AddBuff (OwnerID() , Buff_2 , 0 , 10)
	elseif Chose <= 19 and Chose >= 10 then
		AddBuff (OwnerID() , Buff_1 , 0 , 10)	
	elseif Chose <= 9 then
		AddBuff (OwnerID() , Buff_2 , 0 , 10)	
	end
end

function Apon_115230_QNPC() ---Zone15 套裝技能解離師
	LoadQuestOption(OwnerID())
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_115230_1]" , "Apon_115230_QNPC_1", 0 )--套裝技能的運用資格	
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_115230]" , "Hsiang_OpenSuitSkill", 0 )--我想看看你賣的東西
end

function Apon_115230_QNPC_1() ---Zone15 套裝技能解離師
	SetSpeakDetail( OwnerID(), "[SC_115230_2]"   )--解釋套裝技能的運用
	AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Apon_115230_QNPC", 0 ) --回到上一頁
end

function AP_suitskill_magic_60()
	local MasterID = 104453 ----崩環中間的NPC
	local MagicID = 496096 ---崩環中心的法術效果
	local MasterEffectBuff = 507727		------大地崩環中心特效
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Master = star_CreateObj_NoAdd( OwnerID() , MasterID , 0 , 0 , 0 , Room , 0)
	SetModeEx( Master , EM_SetModeType_Move , false )			------不移動
	SetModeEx( Master , EM_SetModeType_Strikback , false )	------不反擊
	SetModeEx( Master , EM_SetModeType_Fight , false )		------不可砍殺
	SetModeEx( Master , EM_SetModeType_Searchenemy , false )	------不索敵		
	SetModeEx( Master , EM_SetModeType_Mark , false )			------不可點選	(只要關這個就可以不跑出血條)
	SetModeEx( Master , EM_SetModeType_NotShowHPMP , false )	------不show血條
	SetModeEx( Master , EM_SetModeType_HideName , false ) 		-------不顯示名稱
	AddToPartition( Master , Room )
	AddBuff(Master , MasterEffectBuff , 0 , -1)
	WriteRoleValue( Master , EM_RoleValue_Livetime , 30)
	SysCastSpellLV( OwnerID() , Master , MagicID , 0 )
	WriteRoleValue( OwnerID() , EM_LuaValueFlag_SkillUse10 , Master ) ----將崩環中心NPC存入玩家暫存器中
	WriteRoleValue( Master , EM_RoleValue_register1 , OwnerID()) ---將施法者的ID存入崩環中心NPC
	BeginPlot( Master , "AP_suitskill_magic_60_Mob" , 0 )
	--Setplot( Master , "range" , "star_skill_DWD50_2" , 80)	
end

function AP_suitskill_magic_60_NPC()  ----崩環內效果 --掛在施法者身上的連續產生法術
	local MagicID = 496096
	local Master = ReadRoleValue ( OwnerID() , EM_LuaValueFlag_SkillUse10 )
	if Master ~= nil and ( CheckID(Master)) == true then
		SysCastSpellLV( OwnerID() , Master , MagicID , 0 )
	end
end

function AP_suitskill_magic_60_Mob() --崩環中心NPC生石柱
	local Player = ReadRoleValue ( OwnerID() , EM_RoleValue_register1 )
	local Mob_skill = 496098
	local Counter = 0
	local Mob_Num = 0
	local Temp = {}
	Temp = AP_BornByMultilateral( 104451 , 5 , 50 )---（物件編號 ， 物件數量，物件間的距離）--五角形
	for i = 1 , 5 , 1 do
		SysCastSpellLV( Player , Temp[i] , Mob_skill , 0 )---玩家施放陷阱到石柱的腳下
		Delobj(Temp[i])
	end
	while 1 do
		sleep(10)
		Counter = Counter + 1
		local Check_life = {}
		local Check_life_Num = 0
		if Counter == 3 then
			local Search = SearchRangeNPC ( OwnerID() , 60 )
			for i = 0 , table.getn(Search)+1 do
				if Search[i] ~= OwnerID() and Search[i] ~= nil then
					if	ReadRoleValue(Search[i],EM_RoleValue_OrgID) == 	104452	then
						table.insert( Check_life , Search[i] )
					end
				end
			end
			Counter = 0
			local Check_life_Num = table.getn(Check_life)
			--say(OwnerID(),"Check_life_Num ="..Check_life_Num)	
			if Check_life_Num == 0 then
				Delobj(OwnerID())
				break
			end
		end
	end
end

function AP_suitskill_magic_60_Mob_1() ---石柱的初始劇情
	AddBuff (OwnerID() , 507502 , 0 , -1) ---石柱上的特效
	local HitLv = ReadRoleValue(TargetID(),EM_RoleValue_Fin_Mag_HitLv) ---- 讀主人的法術命中等級
	local DMG = ReadRoleValue(TargetID(),EM_RoleValue_Fin_Mag_Dmg) ---讀主人的法術Dmg 
	local ATK = ReadRoleValue(TargetID(),EM_RoleValue_Fin_Mag_ATK) ---讀主人的法術ATK
	local LV = ReadRoleValue(TargetID(),EM_RoleValue_LV) ---讀主人的等級
	WriteRoleValue( OwnerID(), EM_RoleValue_LV, LV)
	local Skill_Lv = ATK*0.1
	AddBuff (OwnerID() , 507501 , Skill_Lv , 60) ---ATK & DMG & HIT
	--sleep(20)
	local LV_mob = ReadRoleValue(OwnerID(),EM_RoleValue_LV) 
	local DMG_mob = ReadRoleValue(OwnerID(),EM_RoleValue_Fin_Mag_Dmg)
	local ATK_mob = ReadRoleValue(OwnerID(),EM_RoleValue_Fin_Mag_ATK)
	local HitLv = ReadRoleValue(OwnerID(),EM_RoleValue_Fin_Mag_HitLv)
	--say(OwnerID(),"22222")
	--say(TargetID(),"33333")
end
----------------------------------------------------------------------------------------------------------------------------65等崩環
function un_suitskill_magic_60()
	local MasterID = 104453 ----崩環中間的NPC
	local MagicID = 497829 ---崩環中心的法術效果
	local MasterEffectBuff = 507727		------大地崩環中心特效
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Master = star_CreateObj_NoAdd( OwnerID() , MasterID , 0 , 0 , 0 , Room , 0)
	SetModeEx( Master , EM_SetModeType_Move , false )			------不移動
	SetModeEx( Master , EM_SetModeType_Strikback , false )	------不反擊
	SetModeEx( Master , EM_SetModeType_Fight , false )		------不可砍殺
	SetModeEx( Master , EM_SetModeType_Searchenemy , false )	------不索敵		
	SetModeEx( Master , EM_SetModeType_Mark , false )			------不可點選	(只要關這個就可以不跑出血條)
	SetModeEx( Master , EM_SetModeType_NotShowHPMP , false )	------不show血條
	SetModeEx( Master , EM_SetModeType_HideName , false ) 		-------不顯示名稱
	AddToPartition( Master , Room )
	AddBuff(Master , MasterEffectBuff , 0 , -1)
	WriteRoleValue( Master , EM_RoleValue_Livetime , 30)
	SysCastSpellLV( OwnerID() , Master , MagicID , 0 )
	WriteRoleValue( OwnerID() , EM_LuaValueFlag_SkillUse10 , Master ) ----將崩環中心NPC存入玩家暫存器中
	WriteRoleValue( Master , EM_RoleValue_register1 , OwnerID()) ---將施法者的ID存入崩環中心NPC
	BeginPlot( Master , "un_suitskill_magic_60_Mob" , 0 )
	--Setplot( Master , "range" , "star_skill_DWD50_2" , 80)	
end

function un_suitskill_magic_60_NPC()  ----崩環內效果 --掛在施法者身上的連續產生法術
	local MagicID = 497829
	local Master = ReadRoleValue ( OwnerID() , EM_LuaValueFlag_SkillUse10 )
	if Master ~= nil and ( CheckID(Master)) == true then
		SysCastSpellLV( OwnerID() , Master , MagicID , 0 )
	end
end

function un_suitskill_magic_60_Mob() --崩環中心NPC生石柱
	local Player = ReadRoleValue ( OwnerID() , EM_RoleValue_register1 )
	local Mob_skill = 497831
	local Counter = 0
	local Mob_Num = 0
	local Temp = {}
	Temp = AP_BornByMultilateral( 104451 , 5 , 50 )---（物件編號 ， 物件數量，物件間的距離）--五角形
	for i = 1 , 5 , 1 do
		SysCastSpellLV( Player , Temp[i] , Mob_skill , 0 )---玩家施放陷阱到石柱的腳下
		Delobj(Temp[i])
	end
	while 1 do
		sleep(10)
		Counter = Counter + 1
		local Check_life = {}
		local Check_life_Num = 0
		if Counter == 3 then
			local Search = SearchRangeNPC ( OwnerID() , 60 )
			for i = 0 , table.getn(Search)+1 do
				if Search[i] ~= OwnerID() and Search[i] ~= nil then
					if	ReadRoleValue(Search[i],EM_RoleValue_OrgID) == 	104452	then
						table.insert( Check_life , Search[i] )
					end
				end
			end
			Counter = 0
			local Check_life_Num = table.getn(Check_life)
			--say(OwnerID(),"Check_life_Num ="..Check_life_Num)	
			if Check_life_Num == 0 then
				Delobj(OwnerID())
				break
			end
		end
	end
end

function un_suitskill_magic_60_Mob_1() ---石柱的初始劇情
	AddBuff (OwnerID() , 507502 , 0 , -1) ---石柱上的特效
	local HitLv = ReadRoleValue(TargetID(),EM_RoleValue_Fin_Mag_HitLv) ---- 讀主人的法術命中等級
	local DMG = ReadRoleValue(TargetID(),EM_RoleValue_Fin_Mag_Dmg) ---讀主人的法術Dmg 
	local ATK = ReadRoleValue(TargetID(),EM_RoleValue_Fin_Mag_ATK) ---讀主人的法術ATK
	local LV = ReadRoleValue(TargetID(),EM_RoleValue_LV) ---讀主人的等級
	WriteRoleValue( OwnerID(), EM_RoleValue_LV, LV)
	local Skill_Lv = ATK*0.1
	AddBuff (OwnerID() , 507501 , Skill_Lv , 60) ---ATK & DMG & HIT
	--sleep(20)
	local LV_mob = ReadRoleValue(OwnerID(),EM_RoleValue_LV) 
	local DMG_mob = ReadRoleValue(OwnerID(),EM_RoleValue_Fin_Mag_Dmg)
	local ATK_mob = ReadRoleValue(OwnerID(),EM_RoleValue_Fin_Mag_ATK)
	local HitLv = ReadRoleValue(OwnerID(),EM_RoleValue_Fin_Mag_HitLv)
	--say(OwnerID(),"22222")
	--say(TargetID(),"33333")
end
----------------------------------------------------------------------------------------------------------65等機運
function un_Suitskill_495482()---套裝技能，法師，神選，二選一用 --65級更換用
	local Buff_1 = 509962
	local Buff_2 = 509963
	local Chose = Rand(100)+1
	if Chose <= 100 and Chose >= 80 then
		AddBuff (OwnerID() , Buff_1 , 0 , 10)
	elseif Chose <= 79 and Chose >= 60 then
		AddBuff (OwnerID() , Buff_2 , 0 , 10)
	elseif Chose <= 59 and Chose >= 40 then
		AddBuff (OwnerID() , Buff_1 , 0 , 10)
	elseif Chose <= 39 and Chose >= 20 then
		AddBuff (OwnerID() , Buff_2 , 0 , 10)
	elseif Chose <= 19 and Chose >= 10 then
		AddBuff (OwnerID() , Buff_1 , 0 , 10)	
	elseif Chose <= 9 then
		AddBuff (OwnerID() , Buff_2 , 0 , 10)	
	end
end












