function LuaI_102041_AI()
	local Timer = 0
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local ChargeLV = 9    --銳鱗突襲的技能等級
	while 1 do
		local Count = HateListCount( OwnerID() ) 
		if Count  > 0 then
			if Timer == 7 or Timer == 14 then
				sleep(10)
				local Num = DW_Rand(Count) - 1 
				local Target = -1
				for i = 1 , Count  do
					Target = HateListInfo(OwnerID() ,Num , EM_HateListInfoType_GItemID )
					if CheckBuff( Target , 503488 ) == true or Target == ReadRoleValue( OwnerID() , EM_RoleValue_attackTargetID) then
						Num = Num + 1
						if Num >= Count then
							Num = 0
						end
					else
						break
					end
				end
				if Target == -1 then
					Target = ReadRoleValue( OwnerID() , EM_RoleValue_attackTargetID) 
				end
				CastSpellLV( OwnerID() , Target , 493232 , ChargeLV )    --銳鱗突襲skill
				Timer = Timer + 1
			end
			if Timer == 18 then
				EnableNpcAI( OwnerID() , false )
				sleep(10)
				CastSpell( OwnerID() , OwnerID() , 493233 )    
				local PPL = SetSearchAllPlayer(RoomID )
				for i = 1 , PPL , 1 do 
					local ID = GetSearchResult()
					if CheckBuff( ID ,503433 ) == false and ReadRoleValue(ID, EM_RoleValue_IsDead) == 0 and ReadRoleValue(ID, EM_RoleValue_IsPlayer) == 1 then
--						if ReadRoleValue( ID , EM_RoleValue_VOC ) ~= 0 then
							AddBuff( ID , 503489 , 1 , 10 )
--						end
					end
				end
				sleep( 10 )
				Timer = Timer + 2
				EnableNpcAI( OwnerID() , true )
			end
			sleep( 10 )
			Timer = Timer + 1
			if Timer > 20 then
				Timer = Timer - 20
			end
		else
			if Timer ~= 0 then
				Timer = 0
			end
			sleep( 60 )
		end
	end
end

function LuaSpell_503486()
	BeginPlot( TargetID() , "LuaSpell_503486_DO" , 0)
end
function LuaSpell_503486_DO()
	while 1 do
		if ReadRoleValue( OwnerID() , EM_RoleValue_IsDead) == 1 or ReadRoleValue( OwnerID() , EM_RoleValue_IsPlayer) == 0 then
			break
		end
		if CheckBuff( OwnerID() , 503485 ) == false and CheckBuff( OwnerID() , 506295 ) == false then
			break
		end
		if ReadRoleValue( OwnerID() , EM_RoleValue_HP) >= ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP ) then
			CancelBuff_NoEvent( OwnerID() , 503485 )
			CancelBuff_NoEvent( OwnerID() , 506295 )
			break
		end
		sleep( 1 )
	end
end

function LuaSpell_503488()
	local Me = Role:new( OwnerID() )
	local Fish = {}
	local Name = GetName( OwnerID() )
	local Str = "[SC_503488][$SETVAR1="..Name.."]" --[$VAR1]身上流的血引來了許多[<s>102045]
	local OrgID = 102045
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )

	if ZoneID == 126 then
		OrgID = 103468
	end

	ScriptMessage( OwnerID() , -1, 0 , Str , 0 )
	ScriptMessage( OwnerID() , -1, 2 , Str , 0 )
	for i = 1 , 4 , 1 do
		local Dir = Me:Dir() + 90 + 45*i 
		if Dir >= 360 then
			Dir = Dir - 360
		end
		local Cal = (math.pi/180)*Dir 
		local X = Me:X() + math.cos(Dir)*( 10 + Rand(5) )
		local Z = Me:Z() + math.sin(Dir)*( 10 + Rand(5) )
		local Y = GetHeight( X , Me:Y() , Z )

		Fish[i] = CreateObj( OrgID , X , Y , Z , Dir , 1 ) 
		WriteRoleValue(  Fish[i] , EM_RoleValue_LiveTime, 45 )
		AddToPartition( Fish[i] , ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) )
		SetPlot( Fish[i] , "dead" , "LuaFunc_DeadPlay" , 0 )
		BeginPlot( Fish[i]  , "LuaI_102045_Suicide" , 0 )
	end
end

function LuaI_102045_Suicide()
	SetAttack( OwnerID() , TargetID() )
	LuaFunc_Obj_Suicide( 100 )
end

function LuaI_493232_0()
	BeginPlot( OwnerID() , "LuaI_493232_1", 0 )
	return true
end