function Cl_Z215_MirrorWorld_CtarlAI()
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue ( OwnerID , EM_RoleValue_RoomID )
	Lua_Cl_Z215_MirrorWorld_GlobalVar = Lua_Cl_Z215_MirrorWorld_GlobalVar or {}
	Lua_Cl_Z215_MirrorWorld_GlobalVar[RoomID] = Lua_Cl_Z215_MirrorWorld_GlobalVar[RoomID] or {}
	Lua_Cl_Z215_MirrorWorld_GlobalVar[RoomID]["stage"] = 0
	Lua_Cl_Z215_MirrorWorld_GlobalVar[RoomID]["CtarlAI"] = OwnerID
	Lua_Cl_Z215_MirrorWorld_GlobalVar[RoomID]["Totem"] = {}
	local FlagID = 781458
	local BossObjID = 130000
	local BossID = CreateObjByFlag( BossObjID , FlagID, 0 , 1 ) 
	SetModeEx( BossID , EM_SetModeType_Strikback, true) ---反擊(否)
	SetModeEx( BossID , EM_SetModeType_Move, true) ---移動	(否)
	SetModeEx( BossID , EM_SetModeType_Searchenemy, true)--索敵(否)
	SetModeEx( BossID , EM_SetModeType_Mark, true)			---可點選(是)
	SetModeEx( BossID , EM_SetModeType_ShowRoleHead, true) 		---頭像框(是)
	SetModeEx( BossID , EM_SetModeType_Fight, true) ---可砍殺(是)
	SetModeEx( BossID , EM_SetModeType_NotShowHPMP , false ) ----不顯示寫條  
	AddToPartition( BossID , RoomID )
	CallPlot( BossID , "Cl_Z215_MirrorWorld_BossAI" , RoomID )
	Lua_Cl_Z215_MirrorWorld_GlobalVar[RoomID]["Boss"] = BossID
	
	while Lua_Cl_Z215_MirrorWorld_GlobalVar[RoomID]["stage"] ~= 4 do
		sleep( 10 )	
		--DebugMSG( 0 , RoomID ,  "stage="..Lua_Cl_Z215_MirrorWorld_GlobalVar[RoomID]["stage"] )
		if Lua_Cl_Z215_MirrorWorld_GlobalVar[RoomID]["stage"] == 1 then --戰鬥中
			
		elseif Lua_Cl_Z215_MirrorWorld_GlobalVar[RoomID]["stage"] == 2 then --死亡
			Cl_Z215_MirrorWorld_DelTotem()
			Lua_Cl_Z215_MirrorWorld_GlobalVar[RoomID]["Boss"] = nil
			Lua_Cl_Z215_MirrorWorld_GlobalVar[RoomID]["stage"] = 4
		elseif Lua_Cl_Z215_MirrorWorld_GlobalVar[RoomID]["stage"] == 3 then --重置
			delobj( BossID )
			Cl_Z215_MirrorWorld_DelTotem()
			sleep( 20 )
			
			BossID = CreateObjByFlag( BossObjID , FlagID, 0 , 1 ) 
			SetModeEx( BossID , EM_SetModeType_Strikback, true) ---反擊(否)
			SetModeEx( BossID , EM_SetModeType_Move, true) ---移動	(否)
			SetModeEx( BossID , EM_SetModeType_Searchenemy, true)--索敵(否)
			SetModeEx( BossID , EM_SetModeType_Mark, true)			---可點選(是)
			SetModeEx( BossID , EM_SetModeType_ShowRoleHead, true) 		---頭像框(是)
			SetModeEx( BossID , EM_SetModeType_Fight, true) ---可砍殺(是)
			SetModeEx( BossID , EM_SetModeType_NotShowHPMP , false ) ----不顯示寫條  
			AddToPartition( BossID , RoomID )
			CallPlot( BossID , "Cl_Z215_MirrorWorld_BossAI" , RoomID )
			Lua_Cl_Z215_MirrorWorld_GlobalVar[RoomID]["Boss"] = BossID
			Lua_Cl_Z215_MirrorWorld_GlobalVar[RoomID]["stage"] = 0
		end
	end
	delobj( OwnerID )
end
function Cl_Z215_MirrorWorld_SkillTable()
	local SkillTable = {}
	skillTable[1] = {skillID=490660,skilllv=0,Coldown=3,Time=0,Ex=0}
	skillTable[2] = {skillID=490629,skilllv=0,Coldown=7,Time=0,Ex=0}
	skillTable[3] = {skillID=491670,skilllv=0,Coldown=20,Time=20,Ex=1}--490660
	return SkillTable
end
function Cl_Z215_MirrorWorld_BossAI()
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue ( OwnerID , EM_RoleValue_RoomID )
	local AttackTarget = 0
	local CombatBegin = 0
	local skill = Cl_Z215_MirrorWorld_SkillTable()
	SetPlot( OwnerID, "dead","Cl_Z215_MirrorWorld_Bossdead", 0 ) 
	while true do
		sleep( 10 )
		AttackTarget = ReadRoleValue( OwnerID , EM_RoleValue_AttackTargetID )
		if HateListCount( OwnerID ) ~= 0 then
			if CombatBegin == 0 then
				Lua_Cl_Z215_MirrorWorld_GlobalVar[RoomID]["stage"] = 1
				CombatBegin = 1
			end
			if CombatBegin == 1 then
				for i = 1 , #skill , 1 do
					if skill[i].Ex == 1 then
						DebugMSG( 0 , RoomID ,  "["..i.."]Time="..skill[i].Time )
						skill[i].Time = skill[i].Time + 1
						if skill[i].Time >= skill[i].Coldown then
							if ReadRoleValue( OwnerID , EM_RoleValue_SpellMagicID  ) == 0 then
								CastSpelllv( OwnerID , AttackTarget , skill[i].skillID , skill[i].skilllv )
								sleep( 10 )
								skill[i].Time = 0
							end
							break
						end
					end
				end
				if ReadRoleValue( OwnerID , EM_RoleValue_SpellMagicID  ) == 0 then
					for i = 1 , #skill , 1 do
						if skill[i].Ex == 0 then
							skill[i].Time = skill[i].Time + 1
							if skill[i].Time >= skill[i].Coldown then
								CastSpelllv( OwnerID , AttackTarget , skill[i].skillID , skill[i].skilllv )
								skill[i].Time = 0
								break
							end
						end
					end
				end
			end
		elseif HateListCount( OwnerID ) == 0 then
			if CombatBegin == 1 then
				Lua_Cl_Z215_MirrorWorld_GlobalVar[RoomID]["stage"] = 3
				CombatBegin = 0
			end
		end
	end
	delobj( OwnerID )
end

function Cl_Z215_MirrorWorld_Bossdead()
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue ( OwnerID , EM_RoleValue_RoomID )
	Lua_Cl_Z215_MirrorWorld_GlobalVar[RoomID]["stage"] = 2
end
function Cl_Z215_MirrorWorld_DelTotem()
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue ( OwnerID , EM_RoleValue_RoomID )
	local Totems = Lua_Cl_Z215_MirrorWorld_GlobalVar[RoomID]["Totem"]
	DebugMSG( 0 , RoomID ,  "Totems="..#Totems )
	if #Totems ~= 0 then
		for i = 1 , #Totems , 1 do
			if CheckID( Totems[i] ) == true then
				delobj( Totems[i] )
			end
		end
	end
	Lua_Cl_Z215_MirrorWorld_GlobalVar[RoomID]["Totem"] = {}
end
function Cl_Z215_MirrorWorld_491670()
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue ( OwnerID , EM_RoleValue_RoomID )
	local OrgID = ReadRoleValue ( OwnerID , EM_RoleValue_OrgID )
	local Totem_Table = {}
	Totem_Table[0] = {ID=104779,Count=5,Buff=500181,ai="Cl_Z215_Mirror_WinTotem",TotemSkill=491671}
	Totem_Table[1] = {ID=104780,Count=5,Buff=500182,ai="Cl_Z215_Mirror_EarthTotem",TotemSkill=493346}
	Totem_Table[2] = {ID=104843,Count=5,Buff=500183,ai="Cl_Z215_Mirror_fireTotem",TotemSkill=493383}
	Totem_Table[3] = {ID=104844,Count=5,Buff=500184,ai="Cl_Z215_Mirror_warterTotem",TotemSkill=493387}
	for i = 0 , #Totem_Table-1 , 1 do
		if OrgID == Totem_Table[i].ID then
			return
		end
	end
	Cl_Z215_MirrorWorld_DelTotem()
	local Odir = ReadRoleValue( OwnerID, EM_RoleValue_Dir )
	local Ox = ReadRoleValue( OwnerID, EM_RoleValue_X )
	local Oy = ReadRoleValue( OwnerID, EM_RoleValue_Y )
	local Oz = ReadRoleValue( OwnerID, EM_RoleValue_Z )
	local Tx , Ty , Tz , Tdir = 0 , 0 , 0 , 0
	local Rdis = 0
	local Rdir = 0
	local Hy = 0
	
	local RandNum = RandRange( 1 , (#Totem_Table*10) )%4
	DebugMSG( 0 , RoomID ,  "["..RandNum.."]OrgID="..Totem_Table[RandNum].ID.."  BuffID="..Totem_Table[RandNum].Buff )
	local NpcID = Lua_CreateObjToRandownPos(
											OwnerID,
											Totem_Table[RandNum].ID,
											Totem_Table[RandNum].Count,
											200,
											false
											)
	for i = 1 , #NpcID , 1 do
		SetModeEx( NpcID[i] , EM_SetModeType_HideName, true) ---反擊(否)
		SetModeEx( NpcID[i] , EM_SetModeType_Strikback, false) ---反擊(否)
		SetModeEx( NpcID[i] , EM_SetModeType_Move, false) ---移動	(否)
		SetModeEx( NpcID[i] , EM_SetModeType_Searchenemy, false)--索敵(否)
		--WriteRoleValue ( NpcID[i] , EM_RoleValue_LiveTime , 60 )
		AddToPartition( NpcID[i] , RoomID )
		Addbuff (  NpcID[i] , Totem_Table[RandNum].Buff , 0 , -1 )
		Lua_Cl_Z215_MirrorWorld_GlobalVar[RoomID]["Totem"][i] = NpcID[i]
		CastSpelllv( NpcID[i] , NpcID[i] , 491670 , 0 )
		local AttackTarget = ReadRoleValue( OwnerID , EM_RoleValue_AttackTargetID )
		CallPlot( NpcID[i] , Totem_Table[RandNum].ai , AttackTarget , Totem_Table[RandNum].TotemSkill )
	end
	
end

function Cl_Z215_Mirror_WinTotem(TargetID,Skill)
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue ( OwnerID , EM_RoleValue_RoomID )
	while true do
		sleep( 10 )
		if ReadRoleValue( OwnerID , EM_RoleValue_SpellMagicID  ) == 0 then
			local Tx = ReadRoleValue( OwnerID, EM_RoleValue_X );
			local Tz = ReadRoleValue( OwnerID, EM_RoleValue_Z );
			local Od = ReadRoleValue( TargetID, EM_RoleValue_Dir );
			local Ox = ReadRoleValue( TargetID, EM_RoleValue_X );
			local Oz = ReadRoleValue( TargetID, EM_RoleValue_Z );
			local Dir =  CalDir( (Tx-Ox),(Tz-Oz) );  
			local deltaDir = (Dir-Od);
			local X , Y , Z = kg_GetPosRX( TargetID , nil , -100 , 0 , deltaDir )
			local ObjID = CreateObj( 106413 , X , Y , Z , Dir , 1 ) 
			SetModeEx( ObjID , EM_SetModeType_Strikback, false) ---反擊(否)
			SetModeEx( ObjID , EM_SetModeType_Move, false) ---移動	(否)
			SetModeEx( ObjID , EM_SetModeType_Searchenemy, false)--索敵(否)
			SetModeEx( ObjID , EM_SetModeType_Mark, false)			---可點選(是)
			SetModeEx( ObjID , EM_SetModeType_ShowRoleHead, false) 		---頭像框(是)
			SetModeEx( ObjID , EM_SetModeType_Fight, false) ---可砍殺(是)
			SetModeEx( ObjID , EM_SetModeType_NotShowHPMP , false ) ----不顯示寫條  
			WriteRoleValue ( ObjID , EM_RoleValue_LiveTime , 10 )
			AddToPartition( ObjID , RoomID )
			CastSpelllv( OwnerID , ObjID , Skill , 0 )
		end
	end
end

function Cl_Z215_Mirror_EarthTotem(TargetID,Skill)
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue ( OwnerID , EM_RoleValue_RoomID )
	local BossID = Lua_Cl_Z215_MirrorWorld_GlobalVar[RoomID]["Boss"]
	while true do
		sleep( 10 )
		if ReadRoleValue( OwnerID , EM_RoleValue_SpellMagicID  ) == 0 then
			CastSpelllv( OwnerID , BossID , Skill , 0 )
		end
	end
end

function Cl_Z215_Mirror_fireTotem(TargetID,Skill)
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue ( OwnerID , EM_RoleValue_RoomID )
	local BossID = Lua_Cl_Z215_MirrorWorld_GlobalVar[RoomID]["Boss"]
	while true do
		sleep( 10 )
		if ReadRoleValue( OwnerID , EM_RoleValue_SpellMagicID  ) == 0 then
			CastSpelllv( OwnerID , OwnerID , Skill , 0 )
		end
	end
end
function Cl_Z215_Mirror_warterTotem(TargetID,Skill)
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue ( OwnerID , EM_RoleValue_RoomID )
	local BossID = Lua_Cl_Z215_MirrorWorld_GlobalVar[RoomID]["Boss"]
	while true do
		sleep( 10 )
		if ReadRoleValue( OwnerID , EM_RoleValue_SpellMagicID  ) == 0 then
			local Tx = ReadRoleValue( OwnerID, EM_RoleValue_X );
			local Tz = ReadRoleValue( OwnerID, EM_RoleValue_Z );
			local Od = ReadRoleValue( BossID, EM_RoleValue_Dir );
			local Ox = ReadRoleValue( BossID, EM_RoleValue_X );
			local Oz = ReadRoleValue( BossID, EM_RoleValue_Z );
			local Dir =  CalDir( (Tx-Ox),(Tz-Oz) );  
			local deltaDir = (Dir-Od);
			local X , Y , Z = kg_GetPosRX( BossID , nil , -100 , 0 , deltaDir )
			local ObjID = CreateObj( 106413 , X , Y , Z , Dir , 1 ) 
			SetModeEx( ObjID , EM_SetModeType_Strikback, false) ---反擊(否)
			SetModeEx( ObjID , EM_SetModeType_Move, false) ---移動	(否)
			SetModeEx( ObjID , EM_SetModeType_Searchenemy, false)--索敵(否)
			SetModeEx( ObjID , EM_SetModeType_Mark, false)			---可點選(是)
			SetModeEx( ObjID , EM_SetModeType_ShowRoleHead, false) 		---頭像框(是)
			SetModeEx( ObjID , EM_SetModeType_Fight, false) ---可砍殺(是)
			SetModeEx( ObjID , EM_SetModeType_NotShowHPMP , false ) ----不顯示寫條  
			WriteRoleValue ( ObjID , EM_RoleValue_LiveTime , 10 )
			AddToPartition( ObjID , RoomID )
			CastSpelllv( OwnerID , ObjID , Skill , 0 )
		end
	end
end