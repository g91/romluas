function Cl_Z32_Boss1_CreateBoss(CrtlAI,RoomID)
	local Skill = Cl_Z32_Boss1_Skillinfo()
	local ObjID = Cl_Z32_Boss1_LoadObjID()
	local Diff = Cl_Z32_Boss_Difficulty()
	local BossTable = {}
	local x , y , z , dir = DW_Location( 781464 , 0 )
	BossTable.sanbrisa = CreateObj( ObjID.S[Diff] , x , y , z , dir , 1 )
	SetModeEx( BossTable.sanbrisa , EM_SetModeType_Strikback, true) ---反擊(否)
	SetModeEx( BossTable.sanbrisa , EM_SetModeType_Move, true) ---移動	(否)
	SetModeEx( BossTable.sanbrisa , EM_SetModeType_Searchenemy, true)--索敵(否)
	SetModeEx( BossTable.sanbrisa , EM_SetModeType_Mark, true)			---可點選(是)
	SetModeEx( BossTable.sanbrisa , EM_SetModeType_ShowRoleHead, true) 		---頭像框(是)
	SetModeEx( BossTable.sanbrisa , EM_SetModeType_Fight, true) ---可砍殺(是)
	SetModeEx( BossTable.sanbrisa , EM_SetModeType_NotShowHPMP , false ) ----不顯示寫條  
	Cl_Z32_Boss1_GlobalVar[RoomID]["Boss"].sanbrisa = BossTable.sanbrisa
	AddToPartition( BossTable.sanbrisa , RoomID )

	local x , y , z , dir = DW_Location( 781464 , 1 )--根據旗子位置
	BossTable.lorra = CreateObj( ObjID.L[Diff] , x , y , z , dir , 1 )
	SetModeEx( BossTable.lorra , EM_SetModeType_Strikback, true) ---反擊(否)
	SetModeEx( BossTable.lorra , EM_SetModeType_Move, true) ---移動	(否)
	SetModeEx( BossTable.lorra , EM_SetModeType_Searchenemy, true)--索敵(否)
	SetModeEx( BossTable.lorra , EM_SetModeType_Mark, true)			---可點選(是)
	SetModeEx( BossTable.lorra , EM_SetModeType_ShowRoleHead, true) 		---頭像框(是)
	SetModeEx( BossTable.lorra , EM_SetModeType_Fight, true) ---可砍殺(是)
	SetModeEx( BossTable.lorra , EM_SetModeType_NotShowHPMP , false ) ----不顯示寫條  
	Cl_Z32_Boss1_GlobalVar[RoomID]["Boss"].lorra = BossTable.lorra
	AddToPartition( BossTable.lorra , RoomID )
	
	CallPlot( BossTable.lorra , "Cl_Z32_Boss1_LorraAI" , Skill , Diff ) 
	CallPlot( BossTable.sanbrisa , "Cl_Z32_Boss1_SanbrisaAI" , Skill , Diff ) 
	
	return BossTable
end

function Cl_Z32_Boss_Difficulty()
	local OwnerID = OwnerID()
	local Var = 169
	local ZoneID = ReadRoleValue ( OwnerID , EM_RoleValue_ZoneID )
	--DebugMsg( 0 , 0 , "Difficulty="..( ZoneID - Var ) + 1 )
	if ( ZoneID - Var ) + 1  >= 1 and ( ZoneID - Var ) + 1 <= 3 then
		return ( ZoneID - Var ) + 1
	end
	return 1
end
function Cl_Z32_Boss1_Skillinfo()
	local Skill = {}
	Skill.S = {
				{ID=851572,CD=9},    --軍刀打擊
				{ID=490155,CD=17},   --靈魂狙擊
				{ID=851573,CD=0},   --靈魂狙擊
				}
	
	Skill.L = {
				{ID=851570,CD=15},--索魂劍
				}

	Skill.LV = {}
	Skill.LV[851570] = {10,12,0} --索魂劍
	Skill.LV[851572] = {30,0,10} --軍刀打擊
	Skill.LV[851575] = {10,6,3}  --軍刀連擊
	Skill.LV[851573] = {15,10,10} --靈魂狙擊
	
	Skill.Count = {}
	Skill.Count[851573] = {4,2,2}
	
	return Skill
end

function Cl_Z32_Boss1_LoadObjID()
	local ObjID = {}
	ObjID.S = {108596,108697,108699}
	ObjID.L = {108597,108698,108700}
	ObjID.Box = {106134,106152,106153}
	return ObjID
end

function Cl_Z32_Boss1_CrtlAI()
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue ( OwnerID , EM_RoleValue_RoomID )
	
	Cl_Z32_Boss1_GlobalVar = Cl_Z32_Boss1_GlobalVar or {}
	Cl_Z32_Boss1_GlobalVar[RoomID] = Cl_Z32_Boss1_GlobalVar[RoomID] or {}
	Cl_Z32_Boss1_GlobalVar[RoomID]["stage"] = 0
	Cl_Z32_Boss1_GlobalVar[RoomID]["CtarlAI"] = OwnerID
	Cl_Z32_Boss1_GlobalVar[RoomID]["Boss"] = {}
	Cl_Z32_Boss1_GlobalVar[RoomID]["Overfight"] = false
	Cl_Z32_Boss1_GlobalVar[RoomID]["ChangePosTime"] = 0
	Cl_Z32_Boss1_GlobalVar[RoomID]["DisToOver"] = false
	Cl_Z32_Boss1_GlobalVar[RoomID]["HateList"] = {}
	Cl_Z32_Boss1_GlobalVar[RoomID]["KillTarget"] = 0
	
	local Boss = Cl_Z32_Boss1_CreateBoss(OwnerID,RoomID)
	
	local Skill = Cl_Z32_Boss1_Skillinfo()
	local Diff = Cl_Z32_Boss_Difficulty()
	local Target = {}
	
	local x , y , z , dir = DW_Location( 781464 , 2 )--根據旗子位置
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
	
	local CombatBegin = 0
	local CarzTime = {60*8,60*6,nil}
	while Cl_Z32_Boss1_GlobalVar[RoomID]["stage"] ~= 4 do
		
		if Cl_Z32_Boss1_GlobalVar[RoomID]["stage"] == 1 then
			
			if CombatBegin == 0 then
				ScriptMessage( OwnerID , -1 , 2 , "[SC_108596_ENGAGE]" , 2 )
				CombatBegin = 1
			end
			if CombatBegin == 1 then
				if CarzTime[Diff] ~= nil then
					CarzTime[Diff] = CarzTime[Diff] - 1
					if CarzTime[Diff] < 0 then
						Addbuff ( Boss.sanbrisa , 625441 , 0 , -1 )
						Addbuff ( Boss.lorra , 625441 , 0 , -1 )
						CarzTime[Diff] = nil
					end
				end
				if GetDistance( Boss.sanbrisa , Boss.lorra ) >= 220 then
					Cl_Z32_Boss1_GlobalVar[RoomID]["DisToOver"] = true
				end
				
				Cl_Z32_Boss1_GlobalVar[RoomID]["ChangePosTime"] = Cl_Z32_Boss1_GlobalVar[RoomID]["ChangePosTime"] + 1
				if Cl_Z32_Boss1_GlobalVar[RoomID]["ChangePosTime"] >= 30 then
					DebugMsg( 0 , 0 , "Pos Change Time>30" )
					if Cl_Z32_Boss1_GlobalVar[RoomID]["Overfight"] == true then
						Cl_ChangeBossPos(Boss)
						Cl_Z32_Boss1_GlobalVar[RoomID]["ChangePosTime"] = 0
						sleep( 10 )
					end
				end
			end
		elseif Cl_Z32_Boss1_GlobalVar[RoomID]["stage"] == 2 then
			ScriptMessage( OwnerID , -1 , 2 , "[SC_108596_DEATH]" , 2 )
			CarzTime = {60*8,60*6,nil}
			local ObjID = Cl_Z32_Boss1_LoadObjID()
			local Diff = Cl_Z32_Boss_Difficulty()
			local x , y , z , dir = DW_Location( 781464 , 1 )--根據旗子位置
			Box = CreateObj( ObjID.Box[Diff] , x , y , z , dir , 1 )
			SetModeEx( Box , EM_SetModeType_Strikback, false) ---反擊(否)
			SetModeEx( Box , EM_SetModeType_Move, false) ---移動	(否)
			SetModeEx( Box , EM_SetModeType_Searchenemy, false)--索敵(否)
			SetModeEx( Box , EM_SetModeType_Mark, true)			---可點選(是)
			SetModeEx( Box , EM_SetModeType_ShowRoleHead, true) 		---頭像框(是)
			SetModeEx( Box , EM_SetModeType_Fight, false) ---可砍殺(是)
			SetModeEx( Box , EM_SetModeType_NotShowHPMP , true ) ----不顯示寫條  
			AddToPartition( Box , RoomID )
			
			KillID( Cl_Z32_Boss1_GlobalVar[RoomID]["KillTarget"] , Box )
			Delobj(Door)
			Cl_Z32_Boss1_GlobalVar[RoomID]["stage"] = 4
		elseif Cl_Z32_Boss1_GlobalVar[RoomID]["stage"] == 3 then
			if CombatBegin == 1 then
				ScriptMessage( OwnerID , -1 , 2 , "[SC_108596_RESET]" , 2 )
				CombatBegin = 0
			end
			if CheckID( Boss.sanbrisa ) == true then 
				Delobj(Boss.sanbrisa)
			end
			if CheckID( Boss.lorra ) == true then 
				Delobj(Boss.lorra)
			end
			Cl_Z32_Boss1_GlobalVar[RoomID]["Overfight"] = false
			sleep( 20 )
			Boss = Cl_Z32_Boss1_CreateBoss(OwnerID,RoomID)
			Cl_Z32_Boss1_GlobalVar[RoomID]["stage"] = 0
		end
		sleep(10)
	end
	----say( OwnerID , "Stop" )
end

function Cl_Z32_Boss1_LorraAI( Skill , Diff )
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue ( OwnerID , EM_RoleValue_RoomID )
	local sanbrisa = Cl_Z32_Boss1_GlobalVar[RoomID]["Boss"].sanbrisa
	local AttackTarget = 0
	local CombatBegin = 0
	local MoveTarget = 0
	local time = 0
	SetPlot( OwnerID, "dead","Cl_Z32_Boss1_BossDead", 0 ) 
	while true do
		sleep( 10 )
		AttackTarget = ReadRoleValue( OwnerID , EM_RoleValue_AttackTargetID )
		if HateListCount( OwnerID ) ~= 0 then
			if CombatBegin == 0 then
				if Cl_Z32_Boss1_GlobalVar[RoomID]["stage"] == 0 then
					Cl_Z32_Boss1_GlobalVar[RoomID]["stage"] = 1
				end
				if HateListCount( sanbrisa ) == 0 then
					SetAttack( sanbrisa , AttackTarget )
				end
				CombatBegin = 1
			end
			if CombatBegin == 1 and
				ReadRoleValue( OwnerID , EM_RoleValue_SpellMagicID  ) == 0 then 
				if Cl_Z32_Boss1_GlobalVar[RoomID]["DisToOver"] == true then
					if CheckBuff( OwnerID , 500340) == false then
						DebugMsg( 0 , 0 , "DisToOver" )
						local sanbrisaTarget = ReadRoleValue( sanbrisa , EM_RoleValue_AttackTargetID )
						ScriptMessage( OwnerID , -1 , 2 , "["..tostring(108596).."]:"..GetName( sanbrisaTarget )  .."[SC_108596_SKILL_851570]" , 2 )
						CastSpelllv( OwnerID , sanbrisaTarget , Skill.L[1].ID , Skill.LV[Skill.L[1].ID][Diff] )
					end
				else
					time = time + 1
					if time%Skill.L[1].CD == 0 then
						DebugMsg( 0 , 0 , "time="..time )
						local HataNum = HateListCount( sanbrisa )
						local dis = 0
						local TargetID = 0
						for i = 0 , HataNum-1 , 1 do
							local PlayerID = HateListInfo( sanbrisa , i , EM_HateListInfoType_GItemID )
							if GetDistance( OwnerID , PlayerID ) >= dis then
								TargetID = PlayerID
							end
						end
						ScriptMessage( OwnerID , -1 , 2 , "["..tostring(108596).."]:"..GetName( TargetID )  .."[SC_108596_SKILL_851570]" , 2 )
						CastSpelllv( OwnerID , TargetID , Skill.L[1].ID , Skill.LV[Skill.L[1].ID][Diff] )
					end
				end
			end
		elseif HateListCount( OwnerID ) == 0 then
			if CombatBegin == 1 then
				if Cl_Z32_Boss1_GlobalVar[RoomID]["Overfight"] == false then
					Cl_Z32_Boss1_GlobalVar[RoomID]["Overfight"] = true
				elseif Cl_Z32_Boss1_GlobalVar[RoomID]["Overfight"] == true then
					Cl_Z32_Boss1_GlobalVar[RoomID]["stage"] = 3
				end
				CombatBegin = 0
			end
		end
	end
	delobj( OwnerID )
end
function Cl_Z32_Boss1_SanbrisaSkill()
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	SysCastSpellLv( TargetID , OwnerID , 493388 , 0 ) 
end
function Cl_Z32_Boss1_BuffEvent()
	local OwnerID = OwnerID()
	SysCastSpellLv( OwnerID , OwnerID , 493388 , 0 ) 
end
function Cl_Z32_Boss1_BuffTimeEnd()
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue ( OwnerID , EM_RoleValue_RoomID )
	Cl_Z32_Boss1_GlobalVar[RoomID]["DisToOver"] = false
end

function Cl_Z32_Boss1_SanbrisaAI( Skill , Diff )
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue ( OwnerID , EM_RoleValue_RoomID )
	local lorra = Cl_Z32_Boss1_GlobalVar[RoomID]["Boss"].lorra
	local AttackTarget = 0
	local CombatBegin = 0
	SetPlot( OwnerID, "dead","Cl_Z32_Boss1_BossDead", 0 ) 
	
	Cl_Resist_HackersBossNum( _ownerID )
	
	local time = 0
	while true do
		sleep( 10 )
		AttackTarget = ReadRoleValue( OwnerID , EM_RoleValue_AttackTargetID )
		if HateListCount( OwnerID ) ~= 0 then
			if CombatBegin == 0 then
				if Cl_Z32_Boss1_GlobalVar[RoomID]["stage"] == 0 then
					Cl_Z32_Boss1_GlobalVar[RoomID]["stage"] = 1
				end
				if HateListCount( lorra ) == 0 then
					SetAttack( lorra , AttackTarget )
				end
				CombatBegin = 1
			end
			if CombatBegin == 1 and 
				ReadRoleValue( OwnerID , EM_RoleValue_SpellMagicID  ) == 0 then 
				time = time + 1
				if time%Skill.S[1].CD == 0 then
					ScriptMessage( OwnerID , -1 , 2 , "["..tostring(108596).."]:[SC_108596_SKILL_851572]" , 2 )
					CastSpelllv( OwnerID , AttackTarget , Skill.S[1].ID , Skill.LV[Skill.S[1].ID][Diff] )
				elseif time%Skill.S[2].CD == 0 then
					CastSpelllv( OwnerID , OwnerID , Skill.S[2].ID , 0 )
				end
			end
		elseif HateListCount( OwnerID ) == 0 then
			if CombatBegin == 1 then
				if Cl_Z32_Boss1_GlobalVar[RoomID]["Overfight"] == false then
					Cl_Z32_Boss1_GlobalVar[RoomID]["Overfight"] = true
				elseif Cl_Z32_Boss1_GlobalVar[RoomID]["Overfight"] == true then
					Cl_Z32_Boss1_GlobalVar[RoomID]["stage"] = 3
				end
				CombatBegin = 0
			end
		end
	end
	delobj( OwnerID )
end
function Cl_Z32_Boss1_SaberCombo()
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	local RoomID = ReadRoleValue ( OwnerID , EM_RoleValue_RoomID )
	
	local Skill = Cl_Z32_Boss1_Skillinfo()
	local Diff = Cl_Z32_Boss_Difficulty()
	--local Diff = 1
	
	local PlayTable = SearchRangePlayer ( OwnerID , 50 )
	--say( OwnerID , "PlayTable="..#PlayTable )
	local Dis = 99
	local PlayID = 0
	if #PlayTable > 1 then
		for i = 0 , #PlayTable-1 , 1 do
			if ReadRoleValue ( PlayTable[i] , EM_RoleValue_RoomID ) == RoomID and
				PlayTable[i] ~= TargetID then
				local NowDis = GetDistance( OwnerID , PlayTable[i] )
				if NowDis < Dis then
					Dis = NowDis
					PlayID = PlayTable[i]
				end
			end
		end
		--say( PlayID , "PlayID" )
		SysCastSpelllv( OwnerID , PlayID , 851575 , Skill.LV[851575][Diff] )
	else
		SysCastSpelllv( OwnerID , TargetID , 851575 , Skill.LV[851575][Diff] )
	end
end
function Cl_Z32_Boss1_Soul_Sniper()
	local OwnerID = OwnerID()
	local Skill = Cl_Z32_Boss1_Skillinfo()
	local Diff = Cl_Z32_Boss_Difficulty()
	local Count = Skill.Count[Skill.S[3].ID][Diff]
	local HateNum = HateListCount( OwnerID )
	local PlayTable = {}
	for i = 0 , HateNum-1 , 1 do
		local PlayerID = HateListInfo( OwnerID , i , EM_HateListInfoType_GItemID )
		PlayTable[i+1] = {ID=PlayerID,Dis=GetDistance( OwnerID , PlayerID )}
	end
	function Cl_Z32_Boss1_compare(a,b)
		return a.Dis>b.Dis
	end
	table.sort(PlayTable,Cl_Z32_Boss1_compare)
	for i = 1 , #PlayTable , 1 do
		if i > Count then
			break
		else
			--say( PlayTable[i].ID , "it's me" )
			SysCastSpelllv( OwnerID , PlayTable[i].ID , Skill.S[3].ID , Skill.LV[Skill.S[3].ID][Diff] )
		end
	end
end
function Cl_Z32_Boss1_BossDead()
	local OwnerID = OwnerID()
	--say( OwnerID , "OwnerID" )
	local TargetID = TargetID()
	--say( TargetID , "TargetID" )
	local RoomID = ReadRoleValue ( OwnerID , EM_RoleValue_RoomID )
	if Cl_Z32_Boss1_GlobalVar[RoomID]["Overfight"] == false then
		Cl_Z32_Boss1_GlobalVar[RoomID]["Overfight"] = true
	elseif Cl_Z32_Boss1_GlobalVar[RoomID]["Overfight"] == true then
		Cl_Z32_Boss1_GlobalVar[RoomID]["KillTarget"] = TargetID
		Cl_Z32_Boss1_GlobalVar[RoomID]["stage"] = 2
	end
end
function Cl_ChangeBossPos(Boss)
	local Sx , Sy , Sz = Cl_GetPositionByObj( Boss.sanbrisa , 0 , 0)
	local Lx , Ly , Lz = Cl_GetPositionByObj( Boss.lorra , 0 , 0)
	ClearHateList( Boss.sanbrisa , -1 ) 
	ClearHateList( Boss.lorra , -1 ) 
	
	SetPos( Boss.sanbrisa , Lx , Ly , Lz , 0 ) 
	SetPos( Boss.lorra , Sx , Sy , Sz , 0 ) 
end
function Cl_GetPositionByObj( obj , ang , dis) -- 取得以某物件為基準的相對位置上可放置物件的坐標位置，以及由原點連接到該點的水平線的向量方向（dir）
	local x , y , z , dir
	local x0 = ReadRoleValue( obj , EM_RoleValue_X )
	local y0 = ReadRoleValue( obj , EM_RoleValue_Y )
	local z0 = ReadRoleValue( obj , EM_RoleValue_Z )
	local dir0 = ReadRoleValue( obj , EM_RoleValue_dir ) 
	dir = dir0 + ang
	repeat
		if dir >= 360 then
			dir = dir - 360
		end
		if dir < 0 then
			if dir <= -360 then
				dir = dir + 360
			end
			dir = 360 - math.abs( dir )
		end
	until dir >= 0 and dir < 360 
	local rad = dir * math.pi / 180 
	x = x0 + dis*math.sin( rad )
	z = z0 + dis*math.cos( rad )
	y = GetHeight( x, y0, z )
	return x, y, z , dir
end