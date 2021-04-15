function Cl_Z32_Boss3_ObjList() --設定物件資料庫編號
	local ObjID = {}
	ObjID.Boss = {108598,108703,108704}
	ObjID.Weapon = {107815,107815,107815}
	return ObjID
end
function Cl_Z32_Boss3_SkillList() --設定BOSS技能與技能施放等級
	local Skill = {}
	Skill.Boss = { 
					{ ID = 851577 , CD = 7 , LV = { 10 , 0 , 0 } },    --削鐵如泥
					{ ID = 851585 , CD = 13 , LV = { 15 , 0 , 0 } },   --廢鐵刃
					{ ID = 851583 , CD = 17 , LV = { 10 , 0 , 0 } },   --鐵蝟斬
					{ ID = 493601 , CD = 20 , LV = { 0 , 0 , 0 } },   --狂怒姿態
				}
	return Skill
end
function Cl_Z32_Boss3_ResetVar() --宣告全域變數初始化
	local RoomID = ReadRoleValue ( OwnerID() , EM_RoleValue_RoomID )
	Cl_Z32_Boss3_GlobalVar = Cl_Z32_Boss3_GlobalVar or {}
	Cl_Z32_Boss3_GlobalVar[RoomID] = Cl_Z32_Boss3_GlobalVar[RoomID] or {}
	Cl_Z32_Boss3_GlobalVar[RoomID].stage = 0
	Cl_Z32_Boss3_GlobalVar[RoomID].CtarlAI = OwnerID()
	Cl_Z32_Boss3_GlobalVar[RoomID].Boss = 0
	Cl_Z32_Boss3_GlobalVar[RoomID].LockHp = 1
	Cl_Z32_Boss3_GlobalVar[RoomID].Weapon = {}
end
function Cl_Z32_Boss3_CrtlAI() --中控器AI控制物件產生與刪除重置
	Cl_Z32_Boss3_ResetVar()
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue ( OwnerID , EM_RoleValue_RoomID )
	local Diff = Cl_Z32_Boss_Difficulty()
	local OrgID = Cl_Z32_Boss3_ObjList()
	local Boss = Cl_Z32_Boss3_CreateBoss( OwnerID , RoomID , OrgID.Boss[Diff] )
	local Door1 = 0
	local Door2 = Cl_Z32_Boss3_CreateDoor(RoomID,31)
	--local Lava = Cl_Z32_Boss3_CreateLava(RoomID)
	local CombatBegin = 0
	local time = 0
	local DefTime = 0
	local Defflag = false
	local Weapon = Cl_Z32_Boss3_CreateWeapon(RoomID)
	local WeaponTime = 0
	while Cl_Z32_Boss3_GlobalVar[RoomID].stage ~= 4 do
		sleep( 10 )
		if Cl_Z32_Boss3_GlobalVar[RoomID].stage == 1 then
			if CombatBegin == 0 then
				Door1 = Cl_Z32_Boss3_CreateDoor(RoomID,32)
				CombatBegin = 1
			end
			if CombatBegin == 1 then
				if Defflag == false then
					time = time + 1
					if time == 10 then
						Addbuff ( Boss , 625370 , 9 , -1 )
						Defflag = true
					end
				elseif Defflag == true then
					if CheckBuff( Boss , 625370 ) ~= true then
						DefTime = DefTime + 1
						if DefTime%20 == 0 then
							Addbuff ( Boss , 625370 , 9 , -1 )
						end
					end
				end
				
				WeaponTime = WeaponTime + 1
				if WeaponTime >= 20 then
					for i = 1 , #Weapon , 1 do
						if CheckID( Weapon[i] ) == true then
							Delobj( Weapon[i] )
						end
					end
					Weapon = Cl_Z32_Boss3_CreateWeapon(RoomID)
					WeaponTime = 0
				end
			end
		elseif Cl_Z32_Boss3_GlobalVar[RoomID].stage == 2 then
			for i = 1 , #Weapon , 1 do
				if CheckID( Weapon[i] ) == true then
					Delobj( Weapon[i] )
				end
			end
			Delobj( Door2 )
			Delobj( Door1 )
			Cl_Z32_Boss3_GlobalVar[RoomID].stage = 4
		elseif Cl_Z32_Boss3_GlobalVar[RoomID].stage == 3 then
			Delobj( Boss )
			Delobj( Door1 )
			for i = 1 , #Weapon , 1 do
				if CheckID( Weapon[i] ) == true then
					Delobj( Weapon[i] )
				end
			end
			if CombatBegin == 1 then
				CombatBegin = 0
			end
			DefTime = 0
			time = 0
			sleep( 30 )
			Boss = Cl_Z32_Boss3_CreateBoss( OwnerID , RoomID , OrgID.Boss[Diff] )
			Cl_Z32_Boss3_GlobalVar[RoomID].stage = 0
		end
	end
	--say( OwnerID , "Stop" )
end
function Cl_Z32_Boss3_CreateDoor(RoomID,flagID)
	local x , y , z , dir = DW_Location( 781387 , flagID )--根據旗子位置
	local Door = CreateObj( 107856 , x , y , z , dir , 1 )
	SetModeEx( Door , EM_SetModeType_Strikback, false) ---反擊(否)
	SetModeEx( Door , EM_SetModeType_Move, false) ---移動	(否)
	SetModeEx( Door , EM_SetModeType_Searchenemy, false)--索敵(否)
	SetModeEx( Door , EM_SetModeType_Mark, false)			---可點選(是)
	SetModeEx( Door , EM_SetModeType_ShowRoleHead, false) 		---頭像框(是)
	SetModeEx( Door , EM_SetModeType_Fight, false) ---可砍殺(是)
	SetModeEx( Door , EM_SetModeType_NotShowHPMP , true ) ----不顯示寫條  
	SetModeEx( Door , EM_SetModeType_Obstruct , true ) ----不顯示寫條  
	AddToPartition( Door , RoomID )
	return Door
end
function Cl_Z32_Boss3_CreateBoss(OwnerID,RoomID,OrgID) --BOSS產生物件並回傳BOSS DBID
	local Ox = ReadRoleValue ( OwnerID , EM_RoleValue_X )
	local Oy = ReadRoleValue ( OwnerID , EM_RoleValue_Y )
	local Oz = ReadRoleValue ( OwnerID , EM_RoleValue_Z )
	local ODir = ReadRoleValue ( OwnerID , EM_RoleValue_Dir )
	local Boss = CreateObj( OrgID , Ox , Oy , Oz , ODir , 1 )
	AddToPartition( Boss , RoomID )
	Cl_Z32_Boss3_GlobalVar[RoomID].Boss = Boss
	CallPlot( Boss , "Cl_Z32_Boss3_BossAI" , 0 )
	return Boss
end
function Cl_Z32_Boss3_CreateWeapon(RoomID)
	local WeaponNpc = { 124154 , 124155 }
	local Weapon = {}
	local RandTable = {}
	local numTable = {}
	for i = 1 , 30 , 1 do
		RandTable[i] = i
	end
	for i = 1 , 10 , 1 do
		local Num = RandRange( 1 , #RandTable )
		numTable[i] = Num
		table.remove(RandTable,Num)
	end
	for i = 1 , 10 , 1 do
		local x , y , z , dir = DW_Location( 781387 , numTable[i] )--根據旗子位置
		Weapon[i] = CreateObj( WeaponNpc[RandRange( 1 , 2 )] , x , y , z , dir , 1 )
		SetModeEx( Weapon[i] , EM_SetModeType_Strikback, false) ---反擊(否)
		SetModeEx( Weapon[i] , EM_SetModeType_Move, false) ---移動	(否)
		SetModeEx( Weapon[i] , EM_SetModeType_Searchenemy, false)--索敵(否)
		SetModeEx( Weapon[i] , EM_SetModeType_Mark, true)			---可點選(是)
		SetModeEx( Weapon[i] , EM_SetModeType_ShowRoleHead, true) 		---頭像框(是)
		SetModeEx( Weapon[i] , EM_SetModeType_Fight, false) ---可砍殺(是)
		SetModeEx( Weapon[i] , EM_SetModeType_NotShowHPMP , true ) ----不顯示寫條  
		AddToPartition( Weapon[i] , RoomID )
		CallPlot( Weapon[i] , "Cl_Z32_Boss3_WeaponSetPlot" , 0 )
	end
	return Weapon
end
function Cl_Z32_Boss3_WeaponSetPlot()
	SetPlot( OwnerID() , "touch","Cl_Z32_Boss3_touchWeapon", 20 ) 
end
function Cl_Z32_Boss3_touchWeapon()
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	if ReadRoleValue ( TargetID , EM_RoleValue_PID ) == 0 then
		WriteRoleValue( TargetID , EM_RoleValue_PID , 1 )
		Addbuff ( OwnerID , 625375 , 0 , -1 )
		Delobj( TargetID )
	end
end
function Cl_Z32_Boss3_ThrowWeapon()
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	CancelBuff_NoEvent( OwnerID, 625375 )
	if CheckBuff( TargetID , 625370 ) == true then
		local BuffNum = BuffCount( TargetID ) 
		for i = 0 , BuffNum-1 , 1 do
			local BuffID = BuffInfo( TargetID , i , EM_BuffInfoType_BuffID )
			if BuffID == 625370 then
				local BuffLV = BuffInfo( TargetID , i , EM_BuffInfoType_Power )
				CancelBuff_NoEvent( TargetID, 625370 )
				Addbuff ( TargetID , 625370 , BuffLV-1 , -1 )
			end
		end
	end
	Addbuff ( OwnerID , 500353 , 0 , -1 )
end
function Cl_Z32_Boss3_LavaAI()
	local OwnerID = OwnerID()
	Addbuff ( OwnerID , 625460 , 0 , -1 )
	Addbuff ( OwnerID , 500351 , 0 , -1 )
end
function Cl_Z32_Boss3_CheckBoss()
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	local OrgID = Cl_Z32_Boss3_ObjList()
	local Diff = Cl_Z32_Boss_Difficulty()
	if ReadRoleValue ( TargetID , EM_RoleValue_OrgID ) == OrgID.Boss[Diff] then
		return true
	else
		return false
	end
end
function Cl_Z32_Boss3_BossAI() --boss戰鬥時的ai
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue ( OwnerID , EM_RoleValue_RoomID )
	local CombatBegin = 0
	local AttackTarget = 0
	SetFollow( OwnerID, Cl_Z32_Boss3_GlobalVar[RoomID].CtarlAI ) 
	local time = 0
	local Skill = Cl_Z32_Boss3_SkillList()
	local Diff = Cl_Z32_Boss_Difficulty()
	local Weapon = {}
	SetPlot( OwnerID, "dead","Cl_Z32_Boss3_BossDead", 0 ) 
	while true do
		sleep( 10 )
		AttackTarget = ReadRoleValue( OwnerID , EM_RoleValue_AttackTargetID )
		if HateListCount( OwnerID ) ~= 0 then
			if CombatBegin == 0 then
				SetFollow( OwnerID, 0 ) 
				ScriptMessage( OwnerID , 0 , 2 , "[$MUTE]".."[SC_108598_ENGAGE]" , 0 )
				Cl_Z32_Boss3_GlobalVar[RoomID].stage = 1
				CombatBegin = 1
			end
			if CombatBegin == 1 then
				if ReadRoleValue( OwnerID , EM_RoleValue_SpellMagicID  ) == 0 then
					time = time + 1
					if time%(Skill.Boss[1].CD) == 0 then
						--say( OwnerID , "["..Skill.Boss[1].ID.."]" )
						CastSpelllv( OwnerID , AttackTarget , Skill.Boss[1].ID , Skill.Boss[1].LV[Diff] )
					elseif time%(Skill.Boss[2].CD) == 0 then
						--say( OwnerID , "["..Skill.Boss[2].ID.."]" )
						CastSpelllv( OwnerID , OwnerID , Skill.Boss[2].ID , Skill.Boss[2].LV[Diff] )
					elseif time%(Skill.Boss[3].CD) == 0 then
						--say( OwnerID , "["..Skill.Boss[3].ID.."]" )
						local SpellTarget = DW_HateSequence(1)
						if #SpellTarget > 0 then
							CastSpelllv( OwnerID , SpellTarget[1] , Skill.Boss[3].ID , Skill.Boss[3].LV[Diff] )
						else
							CastSpelllv( OwnerID , AttackTarget , Skill.Boss[3].ID , Skill.Boss[3].LV[Diff] )
						end
					elseif time%(Skill.Boss[4].CD) == 0 then
						--say( OwnerID , "["..Skill.Boss[4].ID.."]" )
						CastSpelllv( OwnerID , OwnerID , Skill.Boss[4].ID , Skill.Boss[4].LV[Diff] )
					end
				end
			end
		elseif HateListCount( OwnerID ) == 0 then
			if CombatBegin == 1 then
				ScriptMessage( OwnerID , 0 , 2 , "[$MUTE]".."[SC_108598_RESET]" , 0 )
				Cl_Z32_Boss3_GlobalVar[RoomID].stage = 3
				CombatBegin = 0
			end
		end
	end
end
function Cl_Z32_Boss3_BossDead()
	local RoomID = ReadRoleValue ( OwnerID() , EM_RoleValue_RoomID )
	ScriptMessage( OwnerID() , 0 , 2 , "[$MUTE]".."[SC_108598_DEATH]" , 0 )
	Cl_Z32_Boss3_GlobalVar[RoomID].stage = 2
end
function Cl_Z32_Boss3_CreateFire()
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue ( OwnerID , EM_RoleValue_RoomID )
	if Cl_Z32_Boss3_GlobalVar[RoomID].stage ~= 1 then
		Delobj( OwnerID )
	end
	if CheckBuff( OwnerID , 625464 ) == true then
		local RoomID = ReadRoleValue ( OwnerID , EM_RoleValue_RoomID )
		local Ox = ReadRoleValue ( OwnerID , EM_RoleValue_X )
		local Oy = ReadRoleValue ( OwnerID , EM_RoleValue_Y )
		local Oz = ReadRoleValue ( OwnerID , EM_RoleValue_Z )
		local ODir = ReadRoleValue ( OwnerID , EM_RoleValue_Dir )
		local Fire = CreateObj( 108702 , Ox , Oy , Oz , ODir , 1 )
		SetModeEx( Fire , EM_SetModeType_Strikback , false ) ---反擊(否)
		SetModeEx( Fire , EM_SetModeType_Move , false ) ---移動	(否)
		SetModeEx( Fire , EM_SetModeType_Searchenemy , false )--索敵(否)
		SetModeEx( Fire , EM_SetModeType_Mark , false )			---可點選(是)
		SetModeEx( Fire , EM_SetModeType_ShowRoleHead , false ) 		---頭像框(是)
		SetModeEx( Fire , EM_SetModeType_Fight , false ) ---可砍殺(是)
		SetModeEx( Fire , EM_SetModeType_NotShowHPMP , true ) ----不顯示寫條  
		SetModeEx( Fire , EM_SetModeType_HideName , true ) ----不顯示名稱
		AddToPartition( Fire , RoomID )
		
		local BuffNum = BuffCount( OwnerID ) 
		for i = 0 , BuffNum-1 , 1 do
			local BuffID = BuffInfo( OwnerID , i , EM_BuffInfoType_BuffID )
			if BuffID == 625464 then
				local BuffLV = BuffInfo( OwnerID , i , EM_BuffInfoType_Power )
				WriteRoleValue( Fire , EM_RoleValue_LiveTime , BuffLV )
				Addbuff ( Fire , 625369 , 0 , -1 )
				break
			end
		end
	end
end
---測試功能用---
function Cl_TextBossAI()
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue ( OwnerID , EM_RoleValue_RoomID )
	local CombatBegin = 0
	local AttackTarget = 0
	while true do
		sleep( 10 )
		AttackTarget = ReadRoleValue( OwnerID , EM_RoleValue_AttackTargetID )
		if HateListCount( OwnerID ) ~= 0 then
			if CombatBegin == 0 then

				CombatBegin = 1
			end
			if CombatBegin == 1 then
				if ReadRoleValue( OwnerID , EM_RoleValue_SpellMagicID  ) == 0 then
					CastSpelllv( OwnerID , AttackTarget , 851583 , 0 )
				end
			end
		elseif HateListCount( OwnerID ) == 0 then
			if CombatBegin == 1 then

				CombatBegin = 0
			end
		end
	end
end