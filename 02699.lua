function Cl_Zone23_Monster_Skill499419()
	local OwnerID = OwnerID()
	local ZoneID = ReadRoleValue ( OwnerID , EM_RoleValue_ZoneID )
	local SkillLV = {}
	SkillLV[146] = 10
	SkillLV[147] = 10
	SkillLV[148] = 10
	SkillLV[937] = 10
	local RoomID = ReadRoleValue( OwnerID , EM_RoleValue_RoomID )
	local HideBall = kg_GetPosRX( OwnerID  ,106132 , 300 )
	Cl_EM_SetModeType( HideBall , true , false , false , false , false , false , true , false , false )
	WriteRoleValue( HideBall , EM_RoleValue_LiveTime , 3 )
	AddToPartition ( HideBall , RoomID ) ----物件加入場景,例行公事
	SysCastSpelllv ( OwnerID , HideBall , 499421 , SkillLV[ZoneID] )
end
function Cl_Zone23_Monster_Skill499422(Time)
	local OwnerID = OwnerID()
	local ZoneID = ReadRoleValue ( OwnerID , EM_RoleValue_ZoneID )
	local RoomID = ReadRoleValue( OwnerID , EM_RoleValue_RoomID )
	if Time ~= nil then
		sleep ( Time )
	end
	if ReadRoleValue( OwnerID , EM_RoleValue_Register1 ) <= 5 or
		ReadRoleValue( OwnerID , EM_RoleValue_Register1 ) == nil then
		local HideBall = kg_GetPosRX( OwnerID  ,107055 , 40 )
		Cl_EM_SetModeType( HideBall , true , false , false , false , false , false , true , false , false )
		WriteRoleValue( HideBall , EM_RoleValue_LiveTime , 8 )
		WriteRoleValue( HideBall , EM_RoleValue_Register1 , ReadRoleValue( OwnerID , EM_RoleValue_Register1 )+1 )
		Addbuff (  HideBall , 622864 , 0 , -1 ) 
		CallPlot( HideBall , "Cl_Zone23_Monster_Skill499422" , 2 )
		AddToPartition ( HideBall , RoomID ) ----物件加入場景,例行公事
	end
end
function CL_Zone23_ReadZoneID146()
	local OwnerID = OwnerID()
	if ReadRoleValue ( OwnerID , EM_RoleValue_ZoneID ) == 146 or
		ReadRoleValue ( OwnerID , EM_RoleValue_ZoneID ) == 937 then
		return true
	else
		return false
	end
end
function CL_Zone23_ReadZoneID147()
	local OwnerID = OwnerID()
	if ReadRoleValue ( OwnerID , EM_RoleValue_ZoneID ) == 147 or
		ReadRoleValue ( OwnerID , EM_RoleValue_ZoneID ) == 937 then
		return true
	else
		return false
	end
end
function CL_Zone23_ReadZoneID148()
	local OwnerID = OwnerID()
	if ReadRoleValue ( OwnerID , EM_RoleValue_ZoneID ) == 148 or
		ReadRoleValue ( OwnerID , EM_RoleValue_ZoneID ) == 937 then
		return true
	else
		return false
	end
end
function CL_Zone23_Monster_Skill499426()---FX_落石術
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue( OwnerID , EM_RoleValue_RoomID )
	local ZoneID = ReadRoleValue ( OwnerID , EM_RoleValue_ZoneID )
	local HideBall = kg_GetPosRX( OwnerID  , 107055 , 0 )
	Cl_EM_SetModeType( HideBall , true , false , false , false , false , false , true , false , false )
	WriteRoleValue( HideBall , EM_RoleValue_LiveTime , 3 )
	AddToPartition ( HideBall , RoomID ) ----物件加入場景,例行公事
	local SkillLV = {}
	SkillLV[146] = 10
	SkillLV[147] = 10
	SkillLV[148] = 10
	SkillLV[937] = 10
	local Tag_X , Tag_Y , Tag_Z = Cl_Rand_HateList( 1 , 0 )
	if Tag_X ~= nil or Tag_Y ~= nil or Tag_Z ~= nil then
		CastSpellPos( HideBall , Tag_X , Tag_Y , Tag_Z , 499427 , SkillLV[ZoneID] )
	end
end
function Cl_Zone23_Monster_106124_DEAD()
	local OwnerID = OwnerID()
	if ReadRoleValue ( OwnerID , EM_RoleValue_PID ) ~= 1 then
		CallPlot( OwnerID , "Cl_Zone23_Monster_106124" , 0 )
		--say ( ReadRoleValue( OwnerID , EM_RoleValue_AttackTargetID ) , "AttackTargetID" )
		WriteRoleValue( OwnerID , EM_RoleValue_Register1 , ReadRoleValue( OwnerID , EM_RoleValue_AttackTargetID ) )
		MagicInterrupt( OwnerID )
		WriteRoleValue( OwnerID , EM_RoleValue_PID , 1 )
		SetModeEx( OwnerID , EM_SetModeType_Searchenemy, false )--索敵(否)
		return false
	elseif ReadRoleValue ( OwnerID , EM_RoleValue_PID ) == 1 then
		Cl_Zone23_Ant_Dead()
		return true
	end
end
function Cl_Zone23_Monster_106124_DeadSkill()
	local OwnerID = OwnerID()
	local AttackTarget = ReadRoleValue( OwnerID , EM_RoleValue_Register1 )
	SysCastSpelllv ( OwnerID , OwnerID , 499429 , 0 )
	KillID ( AttackTarget , OwnerID )
end
function Cl_Zone23_Monster_106124()
	local OwnerID = OwnerID()
	Addbuff (  OwnerID , 622875 , 0 , 4 )
	local Owner_X = ReadRoleValue ( OwnerID, EM_RoleValue_X)	
	local Owner_Y = ReadRoleValue ( OwnerID, EM_RoleValue_Y)
	local Owner_Z = ReadRoleValue ( OwnerID, EM_RoleValue_Z)
	local Rand_X = math.random( -120, 120 )
	local Rand_Z = math.random( -120, 120 )
	while true do
		Rand_X = math.random( -120, 120 )
		Rand_Z = math.random( -120, 120 )
		LuaFunc_WaitMoveTo( OwnerID, Owner_X+Rand_X , Owner_Y , Owner_Z+Rand_Z )
		sleep ( 1 )
	end
end
function Cl_Zone23_MonsterSkill_499437()
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	if ReadRoleValue ( OwnerID , EM_RoleValue_ZoneID ) == 937 or
		ReadRoleValue ( OwnerID , EM_RoleValue_ZoneID ) == 146 then
		if CheckBuff ( TargetID , 622885 ) ~= true then
			return true
		else
			return false
		end
	else
		return false
	end
end
function Cl_Zone23_MonsterSkill_junp()
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue( OwnerID , EM_RoleValue_RoomID )
	SetPosByFlag( OwnerID , 781112 , 0 )
	Addbuff (  OwnerID , 622888 , 0 , -1 )
	Addbuff (  OwnerID , 507808 , 0 , -1 )
	local Hate_X,Hate_Y,Hate_Z = Cl_Rand_HateList( 1 , 0 )
	local CtarlBall = CreateObj( 107059 , Hate_X , Hate_Y , Hate_Z , 0 , 1 ) ----產生透明球專用
	Cl_EM_SetModeType( CtarlBall , true , false , false , false , false , false , true , false , false )
	WriteRoleValue( CtarlBall , EM_RoleValue_PID , OwnerID )
	AddToPartition( CtarlBall , RoomID )
	CallPlot( CtarlBall , "Cl_Zone23_MonsterSkill_junp_2" , 0 )
end
function Cl_Zone23_MonsterSkill_junp_2()
	local OwnerID = OwnerID()
	local Ant_Big = ReadRoleValue ( OwnerID , EM_RoleValue_PID )
	local Hate_X , Hate_Y , Hate_Z = Cl_Read_OwnerXYZ(OwnerID)
	sleep ( 40 )
	SetPos( Ant_Big , Hate_X , Hate_Y , Hate_Z , 0 )
	sleep ( 5 )
	delobj ( OwnerID )
	CancelBuff_NoEvent( Ant_Big , 507808 ) ---清除BUFF
	sysCastSpelllv ( Ant_Big , Ant_Big , 498307 , 0 )
	CancelBuff_NoEvent( Ant_Big , 622888 ) ---清除BUFF
end
function Cl_Zone23_MonsterSkill_498312()
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	local Owner_X = ReadRoleValue ( OwnerID, EM_RoleValue_X)	
	local Owner_Y = ReadRoleValue ( OwnerID, EM_RoleValue_Y)
	local Owner_Z = ReadRoleValue ( OwnerID, EM_RoleValue_Z)
	local Rand_X = math.random( -25, 25 )
	local Rand_Z = math.random( -25, 25 )
	SetPos( TargetID , Owner_X+Rand_X, Owner_Y , Owner_Z+Rand_Z , 0 )
end
function Cl_Zone23_Monster_106159()
	local OwnerID = OwnerID()
	if ReadRoleValue ( OwnerID , EM_RoleValue_ZoneID ) == 937 or
		ReadRoleValue ( OwnerID , EM_RoleValue_ZoneID ) == 146 then
		Addbuff (  OwnerID , 622886 , 0 , -1 ) 
	end
end
function CL_Zone23_Monster_Skill499442()
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue( OwnerID , EM_RoleValue_RoomID )
	local ZoneID = ReadRoleValue ( OwnerID , EM_RoleValue_ZoneID )
	local Ant_Table = {}
	Ant_Table[146] = 107070
	Ant_Table[147] = 107070
	Ant_Table[148] = 107070
	Ant_Table[937] = 107070
	local Hate_X , Hate_Y , Hate_Z = Cl_Read_OwnerXYZ(OwnerID)
	local Rand_X = math.random( -30, 30 )
	local Rand_Z = math.random( -30, 30 )
	local Ant_Ball = CreateObj( Ant_Table[ZoneID] , Hate_X+Rand_X , Hate_Y , Hate_Z+Rand_Z , 0 , 1 ) ----產生透明球專用
	WriteRoleValue( Ant_Ball , EM_RoleValue_PID , OwnerID )
	WriteRoleValue( Ant_Ball , EM_RoleValue_LiveTime , 12 )
	AddToPartition( Ant_Ball , RoomID )
	CallPlot( Ant_Ball , "Cl_Zone23_Monster_Ant_Ball" , 0 )
end
function Cl_Zone23_Monster_Ant_Ball()
	local OwnerID = OwnerID()
	local TargetID = ReadRoleValue ( OwnerID , EM_RoleValue_PID )
	while 1 do
		sleep ( 5 )
		
	end
end
function Cl_Zone23_Monster_RemoveHeta()
	local OwnerID = OwnerID()
	local hate_table = HateListCount( OwnerID )
	for i=0 , hate_table-1 do
		SetHateListPoint( OwnerID , i , 1 )
	end
end
function Cl_Zone23_MonsterSkill_Win()
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue( OwnerID , EM_RoleValue_RoomID )
	local ZoneID = ReadRoleValue ( OwnerID , EM_RoleValue_ZoneID )
	local Win_Table = {}
	Win_Table[146] = 10
	Win_Table[147] = 10
	Win_Table[148] = 10
	Win_Table[937] = 10
	local Ant_Table = {}
	
	Ant_Table[146] = 107070
	Ant_Table[147] = 107070
	Ant_Table[148] = 107070
	Ant_Table[937] = 107070
	
	local Hate_X , Hate_Y , Hate_Z = Cl_Read_OwnerXYZ(OwnerID)
	local Ant_Ball = CreateObj( Ant_Table[ZoneID] , Hate_X , Hate_Y , Hate_Z , 0 , 1 ) ----產生透明球專用
	Cl_EM_SetModeType( Ant_Ball , true , false , false , false , false , false , true , false , false )
	WriteRoleValue( Ant_Ball , EM_RoleValue_LiveTime , 12 )
	AddToPartition( Ant_Ball , RoomID )
	CastSpelllv ( Ant_Ball , Ant_Ball , 499458 , Win_Table[ZoneID] )
end
function Cl_Zone23_Monster_CallAnt()
	local OwnerID = OwnerID()
	local AttackTarget = ReadRoleValue( OwnerID , EM_RoleValue_AttackTargetID )
	local Search = SearchRangeNPC ( OwnerID , 250 )
	local doorname
	local door = {106123,107262,107282,106212,107270,107290}
	for i = table.getn(Search) , 0 ,-1 do
		if Search[i] ~= OwnerID then
			for a = 1 , #(door) do
				if ReadRoleValue( Search[i] , EM_RoleValue_OrgID )==door[a] then
					table.remove(Search,i)
					break
				end
			end			
		end
	end
	for i = 0 , table.getn(Search) do
		--say(Search[i],"own = "..ReadRoleValue( Search[i] , EM_RoleValue_OrgID ))
		SetAttack( Search[i] , AttackTarget)
	end
end
function Cl_Zone23_Ant_Dead()
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue( OwnerID , EM_RoleValue_RoomID )
	local ZoneID = ReadRoleValue ( OwnerID , EM_RoleValue_ZoneID )
	local SkillLV = {}
	SkillLV[937] = 0
	SkillLV[146] = 29
	SkillLV[147] = 29
	SkillLV[148] = 29
	local Monster = {}
	Monster[937] = { 106891 , 106892 , 106893 , 106894 }
	Monster[146] = { 106891 , 106892 , 106893 , 106894 }
	Monster[147] = { 107278 , 107279 , 107280 , 107281 }
	Monster[148] = { 107298 , 107299 , 107300 , 107301 }
	local Hate_X , Hate_Y , Hate_Z = Cl_Read_OwnerXYZ(OwnerID)
	local Rand_number = DW_Rand(100)
	DebugMsg( 0 , 0 , "Rand_number="..Rand_number )
	if Rand_number <= 30 then ------------------------------------------------------------------------------大爆炸填這
		local Ball = Cl_CreateObj_ForHideBall( 107258 , Hate_X , Hate_Y , Hate_Z , RoomID )
		WriteRoleValue( Ball , EM_RoleValue_LiveTime , 4 )
		SysCastSpellLv_Pos( Ball , Hate_X , Hate_Y , Hate_Z , 498319 , SkillLV[ZoneID] )
	elseif Rand_number >= 31 and Rand_number <= 40 then  -------------------------------------------------產生元素怪田這裡
		Rand_number = DW_Rand(4)
		local Ant_Ball = CreateObj( Monster[ZoneID][Rand_number] , Hate_X , Hate_Y , Hate_Z , 0 , 1 )
		AddToPartition( Ant_Ball , RoomID )
	end
end