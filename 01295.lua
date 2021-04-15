function LuaI_503104()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local X = ReadRoleValue( OwnerID() , EM_RoleValue_X )
	local Y = ReadRoleValue( OwnerID() , EM_RoleValue_Y )
	local Z = ReadRoleValue( OwnerID() , EM_RoleValue_Z )
	local D = ReadRoleValue( OwnerID() , EM_RoleValue_Dir )
	local Mob = CreateObj ( 101839 , X , Y , Z , D , 1)
	SetFightMode( Mob , 0 , 0 , 0 , 0 )
	Lua_ObjDontTouch( Mob ) 
	SetModeEx(  Mob  , EM_SetModeType_Gravity, false)
	AddToPartition( Mob , RoomID )	
	WriteRoleValue( Mob ,  EM_RoleValue_LiveTime  , 60 ) --持續時間
	AddBuff( Mob , 503105  , 1 , -1 ) --灼焰領域將原本的傷害改成固定趴數
end

function LuaI_503106()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local PPL = SetSearchAllPlayer(RoomID )
	local Flag = 780347
	local Count = GetMoveFlagCount(Flag)
	for i = 1 , PPL , 1 do
		local ID = GetSearchResult()
		if CheckRelation( OwnerID() , ID , EM_CheckRelationType_Attackable  ) == true and ReadRoleValue( ID , EM_RoleValue_VOC ) ~= 0 and ReadRoleValue( ID , EM_RoleValue_IsDead) == 0 then
			if CheckRelation( OwnerID() , ID, EM_CheckRelationType_Attackable  ) == true then
				AddBuff( ID , 503400 , 1 , 3 ) --Dot和恐懼效果
			end
		end
	end
	for i = 1 , Count , 1 do
		LuaI_492851_Summon(Flag , i ,RoomID , 100 )
	end
end

function LuaI_492851_Summon(Flag , FlagIndex , Room , LV)
	local Orb = CreateObjByFlag( 112620, Flag , FlagIndex , 1 )
	AddToPartition( Orb , Room )
	WriteRoleValue( Orb ,  EM_RoleValue_LiveTime  , 30 )
	SetFightMode( Orb , 0 , 0 , 0 , 0 )
	SetModeEX( Orb , EM_SetModeType_Strikback	 , false )
	Lua_ObjDontTouch( Orb )
	CastSpellLV( Orb, Orb, 492851 , LV )--熾熱流漿
end

function LuaI_503111()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local PPL = SetSearchAllPlayer(RoomID)
	local Flag = 780347
	local Count = GetMoveFlagCount(Flag)
	for i = 1 , PPL , 1 do
		local ID = GetSearchResult()
		local Obj = Role:new( ID )
		if ReadRoleValue(ID, EM_RoleValue_RoomID) == RoomID and ReadRoleValue( ID , EM_RoleValue_VOC ) ~= 0 and ReadRoleValue( ID , EM_RoleValue_IsDead) == 0 then
--			if CheckRelation( OwnerID() , ID, EM_CheckRelationType_Attackable  ) == true then
--				Say( ID ,"Shoot me" )
				local Orb = CreateObj ( 112620,Obj:X(), Obj:Y() + 200 , Obj:Z(), Obj:Dir()  , 1)
				SetFightMode( Orb , 0 , 0 , 0 , 0 )
				SetModeEX( Orb  , EM_SetModeType_Gravity , false )	
				SetModeEX( Orb  , EM_SetModeType_Strikback , false )
				Lua_ObjDontTouch( Orb )			
				AddToPartition( Orb , RoomID )
				WriteRoleValue( Orb  ,  EM_RoleValue_LiveTime  , 5)
				if CastSpellLV( Orb , ID , 492855 , 500) == true then --燃盡原本300修改成500
--					Say( ID ,"Oh Yeah" )
				end
--			end
		end
	end	
end

function LuaI_101584_AI()
	AddBuff( OwnerID() , 503399 , 1 , -1 )
	SetModeEX( OwnerID() , EM_SetModeType_Move , false )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Count = 0
	local Timer = 0
	local Pos = {}
	local Orb = {}
	local NowTarget
	local BurnOut = 0
	local Reset = 0
	while 1 do
		Count = HateListCount( OwnerID() )
		if Count > 0 then
			if Reset == 0 then
				Reset = 1 
			end 
			NowTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
			if GetDistance( OwnerID() , NowTarget ) > 150 then
				if BurnOut == 0 then
					BurnOut = 1
				end
			else
				if BurnOut == 1 then
					BurnOut = 0
				end
			end
			if ( Timer == 13 or Timer == 28 or Timer == 43 ) then
				for i = 1, 5 , 2 do
					Pos["X"] = ReadRoleValue( OwnerID() , EM_RoleValue_X ) +( Rand( 100 )+10)*(-1)^Rand(1) 
					Pos["Z"] = ReadRoleValue( OwnerID() , EM_RoleValue_Z ) + (Rand( 100 )+10)*(-1)^Rand(1) 
					Pos["Y"] = GetHeight( Pos["X"]  , ReadRoleValue( OwnerID() , EM_RoleValue_Y ) , Pos["Z"] )
					Orb[i] = CreateObj ( 112620, Pos["X"] , Pos["Y"] , Pos["Z"]  , 0 , 1)
					Orb[1+i] = CreateObj (  112620 , Pos["X"] , Pos["Y"]+500 , Pos["Z"]  , 0 , 1)
					for j = 0 , 1 , 1 do
						SetFightMode( Orb[j+i] , 0 , 0 , 0 , 0 )
						SetModeEX( Orb[j+i]  , EM_SetModeType_Gravity	 , false )	
						SetModeEX( Orb[j+i]  , EM_SetModeType_Strikback , false )
						Lua_ObjDontTouch( Orb[j+i] )			
						AddToPartition( Orb[j+i]  , RoomID )
						WriteRoleValue( Orb[j+i]  ,  EM_RoleValue_LiveTime  , 10*(3-i) )
					end
				end
				sleep(20)
				for i = 1 , 5 , 2 do
					CastSpellLV( Orb[i+1] ,Orb[i] , 492853 , 200) --融岩滴落
				end
				local Target = {}
				for i = 0 , Count - 1 , 1 do
					local Player = HateListInfo(OwnerID() ,i , EM_HateListInfoType_GItemID )
					if ReadRoleValue( Player , EM_RoleValue_IsDead ) == 0 and CheckBuff( Player , 503103 ) == false then
						table.insert(Target, Player)
					end
				end
				local n = DW_Rand( table.getn(Target) )
				if Target[n] ~= nil and  CheckID( Target[n] ) == true  then
					CastSpellLV( OwnerID() , Target[n] , 492848 , 200 ) --火靈騷動
				end
				Timer = Timer + 2
			elseif (Timer == 20 or Timer == 40 or Timer == 60) then
				CastSpell( OwnerID() , OwnerID() , 492850 ) --煉獄暴怒
			elseif BurnOut == 1 and (Timer ~= 16 or Timer ~= 36 or Timer ~= 56 or Timer ~= 11 or Timer ~= 26 or Timer ~= 41 ) then
				CastSpell( OwnerID() , OwnerID() , 492856 ) --燃盡
			else
				if DW_Rand( 1000 ) > 150 and BurnOut ~= 1 then
					CastSpellLV( OwnerID() , OwnerID() , 492847 , 1300 ) --遠古之火將原本200修改成1000 
				end
			end
			Timer = Timer + 1
			if Timer > 60 then
				Timer = 1
			end
		else
			if Reset == 1 then
				Timer = 0
				BurnOut = 0
				Lua_CancelAllBuff( OwnerID() ) 
				Reset  = 0
				AddBuff( OwnerID() , 503399 , 1 , -1 )
			end
		end
		sleep( 10 )
	end
end