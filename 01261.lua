function LuaYU_Frogbabago_00()   --青蛙引導者--有王有青蛙
	
	local Obj = Role:new( OwnerID() )
	local ZoneID = Obj:ZoneID() -1000*math.floor(Obj:ZoneID() / 1000 )
	local RoomID = ReadRoleValue(  OwnerID() ,EM_RoleValue_RoomID) 

	if ZoneID == 1 or ZoneID == 10 or  ZoneID == 2 or ZoneID == 4 or  ZoneID == 5 or  ZoneID == 6 or ZoneID == 12 then

		local Frog = LuaFunc_CreateObjByObj ( 100044 , OwnerID() )

		SetModeEx( Frog   , EM_SetModeType_Strikback, false )--反擊
		SetModeEx( Frog   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
		SetModeEx( Frog   , EM_SetModeType_Obstruct, false )--阻擋
		SetModeEx( Frog   , EM_SetModeType_Mark, false )--標記
		SetModeEx( Frog   , EM_SetModeType_Move, false )--移動
		SetModeEx( Frog   , EM_SetModeType_Searchenemy, false )--索敵
		SetModeEx( Frog   , EM_SetModeType_HideName, true )--名稱
		SetModeEx( Frog   , EM_SetModeType_ShowRoleHead, false )--頭像框
		SetModeEx( Frog   , EM_SetModeType_Show , false ) --不顯示
		SetModeEx( Frog   , EM_SetModeType_Fight , false )--可砍殺攻擊

		Hide( Frog )
		Show( Frog ,RoomID )

		Beginplot( Frog ,"LuaYU_Frogbabago_01", 0 )

	else
		ScriptMessage( OwnerID() , OwnerID() , 1, "You can't use it in this zone.", 0 )
		ScriptMessage( OwnerID() , OwnerID() , 0, "You can't use it in this zone.", 0 )

	end

end


function LuaYU_Frogbabago_01()   --青蛙引導者

	local Obj = Role:new( OwnerID() )
	local ZoneID = Obj:ZoneID() -1000*math.floor(Obj:ZoneID() / 1000 )
	local RoomID = ReadRoleValue(  OwnerID() ,EM_RoleValue_RoomID) 

	if ZoneID == 1 then

		local Frogaa = LuaFunc_CreateObjByObj ( 101715 , OwnerID() )
		SetModeEx( Frogaa   , EM_SetModeType_Revive , true )--可重生


		Hide( Frogaa )
		Show( Frogaa ,0 )



		local X = ReadRoleValue( Frogaa , EM_RoleValue_X )
		local Y = ReadRoleValue( Frogaa  , EM_RoleValue_Y )
		local Z = ReadRoleValue( Frogaa  , EM_RoleValue_Z )
		local Dir  = ReadRoleValue( Frogaa  , EM_RoleValue_Dir )



		local Frogbb = CreateObj( 101712 , X+20 , Y , Z-20 , Dir  , 1 )
		SetModeEx( Frogbb   , EM_SetModeType_Revive , true )--可重生
		AddToPartition( Frogbb, RoomID) 

		local Frogcc = CreateObj( 101712 , X-20 , Y , Z+20 , Dir  , 1 )
		SetModeEx( Frogcc   , EM_SetModeType_Revive , true )--可重生
		AddToPartition( Frogcc, RoomID) 

		local Frogdd = CreateObj( 101712 , X+30 , Y , Z-30 , Dir  , 1 )
		SetModeEx( Frogdd   , EM_SetModeType_Revive , true )--可重生
		AddToPartition( Frogdd, RoomID) 

		local Frogee = CreateObj( 101712 , X-30 , Y , Z+30 , Dir  , 1 )
		SetModeEx( Frogee   , EM_SetModeType_Revive , true )--可重生
		AddToPartition( Frogee, RoomID) 


		SetRandMove( Frogaa , 100 ,300,50 )
		SetRandMove( Frogbb , 100 ,300,50 )	
		SetRandMove( Frogcc , 100 ,300,50 )	
		SetRandMove( Frogdd , 100 ,300,50 )	
		SetRandMove( Frogee , 100 ,300,50 )	


		Delobj( OwnerID()  )

	elseif ZoneID == 10 then

		local Frogaa = LuaFunc_CreateObjByObj ( 101715 , OwnerID() )
		SetModeEx( Frogaa   , EM_SetModeType_Revive , true )--可重生


		Hide( Frogaa )
		Show( Frogaa ,0 )



		local X = ReadRoleValue( Frogaa , EM_RoleValue_X )
		local Y = ReadRoleValue( Frogaa  , EM_RoleValue_Y )
		local Z = ReadRoleValue( Frogaa  , EM_RoleValue_Z )
		local Dir  = ReadRoleValue( Frogaa  , EM_RoleValue_Dir )



		local Frogbb = CreateObj( 101712 , X+20 , Y , Z+20 , Dir  , 1 )
		SetModeEx( Frogbb   , EM_SetModeType_Revive , true )--可重生
		AddToPartition( Frogbb, RoomID) 

		local Frogcc = CreateObj( 101712 , X-20 , Y , Z-20 , Dir  , 1 )
		SetModeEx( Frogcc   , EM_SetModeType_Revive , true )--可重生
		AddToPartition( Frogcc, RoomID) 

		local Frogdd = CreateObj( 101712 , X+30 , Y , Z+30 , Dir  , 1 )
		SetModeEx( Frogdd   , EM_SetModeType_Revive , true )--可重生
		AddToPartition( Frogdd, RoomID) 

		local Frogee = CreateObj( 101712 , X-30 , Y , Z-30 , Dir  , 1 )
		SetModeEx( Frogee   , EM_SetModeType_Revive , true )--可重生
		AddToPartition( Frogee, RoomID) 


		SetRandMove( Frogaa , 100 ,300,50 )
		SetRandMove( Frogbb , 100 ,300,50 )	
		SetRandMove( Frogcc , 100 ,300,50 )	
		SetRandMove( Frogdd , 100 ,300,50 )	
		SetRandMove( Frogee , 100 ,300,50 )	


		Delobj( OwnerID()  )

	elseif ZoneID == 2 then

		local Frogaa = LuaFunc_CreateObjByObj ( 101470 , OwnerID() )
		SetModeEx( Frogaa   , EM_SetModeType_Revive , true )--可重生


		Hide( Frogaa )
		Show( Frogaa ,0 )



		local X = ReadRoleValue( Frogaa , EM_RoleValue_X )
		local Y = ReadRoleValue( Frogaa  , EM_RoleValue_Y )
		local Z = ReadRoleValue( Frogaa  , EM_RoleValue_Z )
		local Dir  = ReadRoleValue( Frogaa  , EM_RoleValue_Dir )



		local Frogbb = CreateObj( 101710 , X+20 , Y , Z+20 , Dir  , 1 )
		SetModeEx( Frogbb   , EM_SetModeType_Revive , true )--可重生
		AddToPartition( Frogbb, RoomID) 

		local Frogcc = CreateObj( 101710 , X-20 , Y , Z-20 , Dir  , 1 )
		SetModeEx( Frogcc   , EM_SetModeType_Revive , true )--可重生
		AddToPartition( Frogcc, RoomID) 

		local Frogdd = CreateObj( 101710 , X+30 , Y , Z+30 , Dir  , 1 )
		SetModeEx( Frogdd   , EM_SetModeType_Revive , true )--可重生
		AddToPartition( Frogdd, RoomID) 

		local Frogee = CreateObj( 101710 , X-30 , Y , Z-30 , Dir  , 1 )
		SetModeEx( Frogee   , EM_SetModeType_Revive , true )--可重生
		AddToPartition( Frogee, RoomID) 



		SetRandMove( Frogaa , 100 ,300,50 )
		SetRandMove( Frogbb , 100 ,300,50 )	
		SetRandMove( Frogcc , 100 ,300,50 )	
		SetRandMove( Frogdd , 100 ,300,50 )	
		SetRandMove( Frogee , 100 ,300,50 )	


		Delobj( OwnerID()  )





	elseif ZoneID == 4 then

		local Frogaa = LuaFunc_CreateObjByObj ( 101717 , OwnerID() )
		SetModeEx( Frogaa   , EM_SetModeType_Revive , true )--可重生


		Hide( Frogaa )
		Show( Frogaa ,0 )



		local X = ReadRoleValue( Frogaa , EM_RoleValue_X )
		local Y = ReadRoleValue( Frogaa  , EM_RoleValue_Y )
		local Z = ReadRoleValue( Frogaa  , EM_RoleValue_Z )
		local Dir  = ReadRoleValue( Frogaa  , EM_RoleValue_Dir )



		local Frogbb = CreateObj( 101711 , X+20 , Y , Z+20 , Dir  , 1 )
		SetModeEx( Frogbb   , EM_SetModeType_Revive , true )--可重生
		AddToPartition( Frogbb, RoomID) 

		local Frogcc = CreateObj( 101711 , X-20 , Y , Z-20 , Dir  , 1 )
		SetModeEx( Frogcc   , EM_SetModeType_Revive , true )--可重生
		AddToPartition( Frogcc, RoomID) 

		local Frogdd = CreateObj( 101711 , X+30 , Y , Z+30 , Dir  , 1 )
		SetModeEx( Frogdd   , EM_SetModeType_Revive , true )--可重生
		AddToPartition( Frogdd, RoomID) 

		local Frogee = CreateObj( 101711 , X-30 , Y , Z-30 , Dir  , 1 )
		SetModeEx( Frogee   , EM_SetModeType_Revive , true )--可重生
		AddToPartition( Frogee, RoomID) 


		SetRandMove( Frogaa , 100 ,300,50 )
		SetRandMove( Frogbb , 100 ,300,50 )	
		SetRandMove( Frogcc , 100 ,300,50 )	
		SetRandMove( Frogdd , 100 ,300,50 )	
		SetRandMove( Frogee , 100 ,300,50 )	


		Delobj( OwnerID()  )



	elseif ZoneID == 5 then
		local Frogaa = LuaFunc_CreateObjByObj ( 101718 , OwnerID() )
		SetModeEx( Frogaa   , EM_SetModeType_Revive , true )--可重生


		Hide( Frogaa )
		Show( Frogaa ,0 )



		local X = ReadRoleValue( Frogaa , EM_RoleValue_X )
		local Y = ReadRoleValue( Frogaa  , EM_RoleValue_Y )
		local Z = ReadRoleValue( Frogaa  , EM_RoleValue_Z )
		local Dir  = ReadRoleValue( Frogaa  , EM_RoleValue_Dir )



		local Frogbb = CreateObj( 101714 , X+20 , Y , Z+20 , Dir  , 1 )
		SetModeEx( Frogbb   , EM_SetModeType_Revive , true )--可重生
		AddToPartition( Frogbb, RoomID) 

		local Frogcc = CreateObj( 101714 , X-20 , Y , Z-20 , Dir  , 1 )
		SetModeEx( Frogcc   , EM_SetModeType_Revive , true )--可重生
		AddToPartition( Frogcc, RoomID) 

		local Frogdd = CreateObj( 101714 , X+30 , Y , Z+30 , Dir  , 1 )
		SetModeEx( Frogdd   , EM_SetModeType_Revive , true )--可重生
		AddToPartition( Frogdd, RoomID) 

		local Frogee = CreateObj( 101714 , X-30 , Y , Z-30 , Dir  , 1 )
		SetModeEx( Frogee   , EM_SetModeType_Revive , true )--可重生
		AddToPartition( Frogee, RoomID) 


		SetRandMove( Frogaa , 100 ,300,50 )
		SetRandMove( Frogbb , 100 ,300,50 )	
		SetRandMove( Frogcc , 100 ,300,50 )	
		SetRandMove( Frogdd , 100 ,300,50 )	
		SetRandMove( Frogee , 100 ,300,50 )	


		Delobj( OwnerID()  )

	elseif ZoneID == 6 then

		local Frogaa = LuaFunc_CreateObjByObj ( 101716 , OwnerID() )
		SetModeEx( Frogaa   , EM_SetModeType_Revive , true )--可重生


		Hide( Frogaa )
		Show( Frogaa ,0 )



		local X = ReadRoleValue( Frogaa , EM_RoleValue_X )
		local Y = ReadRoleValue( Frogaa  , EM_RoleValue_Y )
		local Z = ReadRoleValue( Frogaa  , EM_RoleValue_Z )
		local Dir  = ReadRoleValue( Frogaa  , EM_RoleValue_Dir )



		local Frogbb = CreateObj( 101713 , X+20 , Y , Z+20 , Dir  , 1 )
		SetModeEx( Frogbb   , EM_SetModeType_Revive , true )--可重生
		AddToPartition( Frogbb, RoomID) 

		local Frogcc = CreateObj( 101713 , X-20 , Y , Z-20 , Dir  , 1 )
		SetModeEx( Frogcc   , EM_SetModeType_Revive , true )--可重生
		AddToPartition( Frogcc, RoomID) 

		local Frogdd = CreateObj( 101713 , X+30 , Y , Z+30 , Dir  , 1 )
		SetModeEx( Frogdd   , EM_SetModeType_Revive , true )--可重生
		AddToPartition( Frogdd, RoomID) 

		local Frogee = CreateObj( 101713 , X-30 , Y , Z-30 , Dir  , 1 )
		SetModeEx( Frogee   , EM_SetModeType_Revive , true )--可重生
		AddToPartition( Frogee, RoomID) 



		SetRandMove( Frogaa , 100 ,300,50 )
		SetRandMove( Frogbb , 100 ,300,50 )	
		SetRandMove( Frogcc , 100 ,300,50 )	
		SetRandMove( Frogdd , 100 ,300,50 )	
		SetRandMove( Frogee , 100 ,300,50 )	


		Delobj( OwnerID()  )

	elseif ZoneID == 12 then

		local Frogaa = LuaFunc_CreateObjByObj ( 101715 , OwnerID() )
		SetModeEx( Frogaa   , EM_SetModeType_Revive , true )--可重生


		Hide( Frogaa )
		Show( Frogaa ,0 )



		local X = ReadRoleValue( Frogaa , EM_RoleValue_X )
		local Y = ReadRoleValue( Frogaa  , EM_RoleValue_Y )
		local Z = ReadRoleValue( Frogaa  , EM_RoleValue_Z )
		local Dir  = ReadRoleValue( Frogaa  , EM_RoleValue_Dir )



		local Frogbb = CreateObj( 101712 , X+20 , Y , Z-20 , Dir  , 1 )
		SetModeEx( Frogbb   , EM_SetModeType_Revive , true )--可重生
		AddToPartition( Frogbb, RoomID) 

		local Frogcc = CreateObj( 101712 , X-20 , Y , Z+20 , Dir  , 1 )
		SetModeEx( Frogcc   , EM_SetModeType_Revive , true )--可重生
		AddToPartition( Frogcc, RoomID) 

		local Frogdd = CreateObj( 101712 , X+30 , Y , Z-30 , Dir  , 1 )
		SetModeEx( Frogdd   , EM_SetModeType_Revive , true )--可重生
		AddToPartition( Frogdd, RoomID) 

		local Frogee = CreateObj( 101712 , X-30 , Y , Z+30 , Dir  , 1 )
		SetModeEx( Frogee   , EM_SetModeType_Revive , true )--可重生
		AddToPartition( Frogee, RoomID) 


		SetRandMove( Frogaa , 100 ,300,50 )
		SetRandMove( Frogbb , 100 ,300,50 )	
		SetRandMove( Frogcc , 100 ,300,50 )	
		SetRandMove( Frogdd , 100 ,300,50 )	
		SetRandMove( Frogee , 100 ,300,50 )	


		Delobj( OwnerID()  )

	else

		Say(OwnerID(),"You can't use it in this zone.")
		sleep(50)
		Delobj( OwnerID()  )

	end


end

function Lua_Hao_FrogGo_NewSelect_01()   -- 1 Boss

	local Obj = Role:new( OwnerID() )
	local ZoneID = Obj:ZoneID() -1000*math.floor(Obj:ZoneID() / 1000 )
	local RoomID = ReadRoleValue(  OwnerID() ,EM_RoleValue_RoomID ) 
	local Zone = { 1 , 10 , 12 , 2 , 4 , 5 , 6 , 51 }
	local Step = 0
	
	for i = 1 , table.getn( Zone ) , 1 do 
		if ZoneID == Zone[i] then
		--	Say( OwnerID() , "Zone =".. Zone[i] )
		--	Say( OwnerID() , "ZoneID =".. ZoneID )
			local Frog = LuaFunc_CreateObjByObj ( 100044 , OwnerID() )
			SetModeEx( Frog   , EM_SetModeType_Strikback, false )--反擊
			SetModeEx( Frog   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
			SetModeEx( Frog   , EM_SetModeType_Obstruct, false )--阻擋
			SetModeEx( Frog   , EM_SetModeType_Mark, false )--標記
			SetModeEx( Frog   , EM_SetModeType_Move, false )--移動
			SetModeEx( Frog   , EM_SetModeType_Searchenemy, false )--索敵
			SetModeEx( Frog   , EM_SetModeType_HideName, true )--名稱
			SetModeEx( Frog   , EM_SetModeType_ShowRoleHead, false )--頭像框
			SetModeEx( Frog   , EM_SetModeType_Show , false ) --不顯示
			SetModeEx( Frog   , EM_SetModeType_Fight , false )--可砍殺攻擊
			Hide( Frog )
			Show( Frog ,RoomID )
			Beginplot( Frog ,"Lua_Hao_FrogGo_NewSelect_02", 0 )
			Step = 1
			if Step == 1 then
				break
			end
		end
	end
	if Step == 0 then
		ScriptMessage( OwnerID() , OwnerID() , 1, "You can't use it in this zone.", 0 )
		ScriptMessage( OwnerID() , OwnerID() , 0, "You can't use it in this zone.", 0 )
	end
end

function Lua_Hao_FrogGo_NewSelect_02()

	local Obj = Role:new( OwnerID() )
	local ZoneID = Obj:ZoneID() -1000*math.floor(Obj:ZoneID() / 1000 )
	local RoomID = ReadRoleValue(  OwnerID() ,EM_RoleValue_RoomID) 

--	101715 = 1 , 10 , 12	-- LV 10
--	101470 = 2		-- LV 20
--	101717 = 4		-- LV 30
--	101718 = 5		-- LV 40
--	101716 = 6		-- LV 50
	
	local Zone = { 1 , 10 , 12 , 2 , 4 , 5 , 6 , 51 }
	local Boss = { 101715 , 101715 , 101715 , 101470 , 101717 , 101718 , 101716 , 101716 }

	for i = 1 , table.getn( Zone ) , 1 do
		if ZoneID == Zone[1] or ZoneID == Zone[2] or ZoneID == Zone[3] then
			local Frogaa = LuaFunc_CreateObjByObj ( Boss[1] , OwnerID() )
			SetModeEx( Frogaa , EM_SetModeType_Revive , true )--可重生
			Hide( Frogaa )
			Show( Frogaa , 0 )
			SetRandMove( Frogaa , 100 , 300 , 50 )
		elseif ZoneID == Zone[4] then
			local Frogaa = LuaFunc_CreateObjByObj ( Boss[4] , OwnerID() )
			SetModeEx( Frogaa , EM_SetModeType_Revive , true )--可重生
			Hide( Frogaa )
			Show( Frogaa , 0 )
			SetRandMove( Frogaa , 100 , 300 , 50 )
		elseif ZoneID == Zone[5] then
			local Frogaa = LuaFunc_CreateObjByObj ( Boss[5] , OwnerID() )
			SetModeEx( Frogaa , EM_SetModeType_Revive , true )--可重生
			Hide( Frogaa )
			Show( Frogaa , 0 )
			SetRandMove( Frogaa , 100 , 300 , 50 )
		elseif ZoneID == Zone[6] then
			local Frogaa = LuaFunc_CreateObjByObj ( Boss[6] , OwnerID() )
			SetModeEx( Frogaa , EM_SetModeType_Revive , true )--可重生
			Hide( Frogaa )
			Show( Frogaa , 0 )
			SetRandMove( Frogaa , 100 , 300 , 50 )
		elseif ZoneID == Zone[7] then
			local Frogaa = LuaFunc_CreateObjByObj ( Boss[7] , OwnerID() )
			SetModeEx( Frogaa , EM_SetModeType_Revive , true )--可重生
			Hide( Frogaa )
			Show( Frogaa , 0 )
			SetRandMove( Frogaa , 100 , 300 , 50 )
		elseif ZoneID == Zone[8] then
			local Frogaa = LuaFunc_CreateObjByObj ( Boss[8] , OwnerID() )
			SetModeEx( Frogaa , EM_SetModeType_Revive , true )--可重生
			Hide( Frogaa )
			Show( Frogaa , 0 )
			SetRandMove( Frogaa , 100 , 300 , 50 )
		end
		Delobj( OwnerID()  )
		break
	end
end

function Lua_Hao_FrogGo_NewSelect_03()   -- 1 青蛙

	local Obj = Role:new( OwnerID() )
	local ZoneID = Obj:ZoneID() -1000*math.floor(Obj:ZoneID() / 1000 )
	local RoomID = ReadRoleValue(  OwnerID() ,EM_RoleValue_RoomID ) 
	local Zone = { 1 , 10 , 12 , 2 , 4 , 5 , 6 , 51 }
	local Step = 0
	
	for i = 1 , table.getn( Zone ) , 1 do 
		if ZoneID == Zone[i] then
			local Frog = LuaFunc_CreateObjByObj ( 100044 , OwnerID() )
			SetModeEx( Frog   , EM_SetModeType_Strikback, false )--反擊
			SetModeEx( Frog   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
			SetModeEx( Frog   , EM_SetModeType_Obstruct, false )--阻擋
			SetModeEx( Frog   , EM_SetModeType_Mark, false )--標記
			SetModeEx( Frog   , EM_SetModeType_Move, false )--移動
			SetModeEx( Frog   , EM_SetModeType_Searchenemy, false )--索敵
			SetModeEx( Frog   , EM_SetModeType_HideName, true )--名稱
			SetModeEx( Frog   , EM_SetModeType_ShowRoleHead, false )--頭像框
			SetModeEx( Frog   , EM_SetModeType_Show , false ) --不顯示
			SetModeEx( Frog   , EM_SetModeType_Fight , false )--可砍殺攻擊
			Hide( Frog )
			Show( Frog ,RoomID )
			Beginplot( Frog ,"Lua_Hao_FrogGo_NewSelect_04", 0 )
			Step = 1
			if Step == 1 then
				break
			end
		end
	end
	if Step == 0 then
		ScriptMessage( OwnerID() , OwnerID() , 1, "You can't use it in this zone.", 0 )
		ScriptMessage( OwnerID() , OwnerID() , 0, "You can't use it in this zone.", 0 )
	end
end

function Lua_Hao_FrogGo_NewSelect_04()

	local Obj = Role:new( OwnerID() )
	local ZoneID = Obj:ZoneID() -1000*math.floor(Obj:ZoneID() / 1000 )
	local RoomID = ReadRoleValue(  OwnerID() ,EM_RoleValue_RoomID) 

--	101712 = 1 , 10 , 12	-- LV 10
--	101710 = 2		-- LV 20
--	101711 = 4		-- LV 30
--	101714 = 5		-- LV 40
--	101713 = 6		-- LV 50
	
	local Zone = { 1 , 10 , 12 , 2 , 4 , 5 , 6 , 51 }	
	local Frog = { 101712 , 101712 , 101712 , 101710 , 101711 , 101714 , 101713 , 101713 }

	for i = 1 , table.getn( Zone ) , 1 do
		if ZoneID == Zone[1] or ZoneID == Zone[2] or ZoneID == Zone[3] then
			local Frogaa = LuaFunc_CreateObjByObj ( Frog[1] , OwnerID() )
			SetModeEx( Frogaa , EM_SetModeType_Revive , true )--可重生
			Hide( Frogaa )
			Show( Frogaa , 0 )
			SetRandMove( Frogaa , 100 , 300 , 50 )
		elseif ZoneID == Zone[4] then
			local Frogaa = LuaFunc_CreateObjByObj ( Frog[4] , OwnerID() )
			SetModeEx( Frogaa , EM_SetModeType_Revive , true )--可重生
			Hide( Frogaa )
			Show( Frogaa , 0 )
			SetRandMove( Frogaa , 100 , 300 , 50 )
		elseif ZoneID == Zone[5] then
			local Frogaa = LuaFunc_CreateObjByObj ( Frog[5] , OwnerID() )
			SetModeEx( Frogaa , EM_SetModeType_Revive , true )--可重生
			Hide( Frogaa )
			Show( Frogaa , 0 )
			SetRandMove( Frogaa , 100 , 300 , 50 )
		elseif ZoneID == Zone[6] then
			local Frogaa = LuaFunc_CreateObjByObj ( Frog[6] , OwnerID() )
			SetModeEx( Frogaa , EM_SetModeType_Revive , true )--可重生
			Hide( Frogaa )
			Show( Frogaa , 0 )
			SetRandMove( Frogaa , 100 , 300 , 50 )
		elseif ZoneID == Zone[7] then
			local Frogaa = LuaFunc_CreateObjByObj ( Frog[7] , OwnerID() )
			SetModeEx( Frogaa , EM_SetModeType_Revive , true )--可重生
			Hide( Frogaa )
			Show( Frogaa , 0 )
			SetRandMove( Frogaa , 100 , 300 , 50 )
		elseif ZoneID == Zone[8] then
			local Frogaa = LuaFunc_CreateObjByObj ( Frog[8] , OwnerID() )
			SetModeEx( Frogaa , EM_SetModeType_Revive , true )--可重生
			Hide( Frogaa )
			Show( Frogaa , 0 )
			SetRandMove( Frogaa , 100 , 300 , 50 )
		end
		Delobj( OwnerID()  )
		break
	end
end

function Lua_Hao_FrogGo_NewSelect_05()   -- 10 青蛙

	local Obj = Role:new( OwnerID() )
	local ZoneID = Obj:ZoneID() -1000*math.floor(Obj:ZoneID() / 1000 )
	local RoomID = ReadRoleValue(  OwnerID() ,EM_RoleValue_RoomID ) 
	local Zone = { 1 , 10 , 12 , 2 , 4 , 5 , 6 , 51 }
	local Step = 0
	
	for i = 1 , table.getn( Zone ) , 1 do 
		if ZoneID == Zone[i] then
			local Frog = LuaFunc_CreateObjByObj ( 100044 , OwnerID() )
			SetModeEx( Frog   , EM_SetModeType_Strikback, false )--反擊
			SetModeEx( Frog   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
			SetModeEx( Frog   , EM_SetModeType_Obstruct, false )--阻擋
			SetModeEx( Frog   , EM_SetModeType_Mark, false )--標記
			SetModeEx( Frog   , EM_SetModeType_Move, false )--移動
			SetModeEx( Frog   , EM_SetModeType_Searchenemy, false )--索敵
			SetModeEx( Frog   , EM_SetModeType_HideName, true )--名稱
			SetModeEx( Frog   , EM_SetModeType_ShowRoleHead, false )--頭像框
			SetModeEx( Frog   , EM_SetModeType_Show , false ) --不顯示
			SetModeEx( Frog   , EM_SetModeType_Fight , false )--可砍殺攻擊
			Hide( Frog )
			Show( Frog ,RoomID )
			Beginplot( Frog ,"Lua_Hao_FrogGo_NewSelect_06", 0 )
			Step = 1
			if Step == 1 then
				break
			end
		end
	end
	if Step == 0 then
		ScriptMessage( OwnerID() , OwnerID() , 1, "You can't use it in this zone.", 0 )
		ScriptMessage( OwnerID() , OwnerID() , 0, "You can't use it in this zone.", 0 )
	end
end

function Lua_Hao_FrogGo_NewSelect_06()

	local Obj = Role:new( OwnerID() )
	local ZoneID = Obj:ZoneID() -1000*math.floor(Obj:ZoneID() / 1000 )
	local RoomID = ReadRoleValue(  OwnerID() ,EM_RoleValue_RoomID) 

--	101712 = 1 , 10 , 12	-- LV 10
--	101710 = 2		-- LV 20
--	101711 = 4		-- LV 30
--	101714 = 5		-- LV 40
--	101713 = 6		-- LV 50
	
	local Zone = { 1 , 10 , 12 , 2 , 4 , 5 , 6 , 51 }	
	local Frog = { 101712 , 101712 , 101712 , 101710 , 101711 , 101714 , 101713 , 101713 }

	for i = 1 , table.getn( Zone ) , 1 do
		if ZoneID == Zone[1] or ZoneID == Zone[2] or ZoneID == Zone[3] then

			local Obj = Role:new( OwnerID() )
			local BaseX = Obj :X()
			local BaseY = Obj :Y()
			local BaseZ = Obj :Z()
			local BaseDir = Obj :Dir()
			local MonsterGroup = {}
			local X = { 10 }-- 幾邊型
			local dis = { 50 } -- 距離圓心的距離
			local Count = 1
		
			for i = 1 , table.getn(X) do
				for j = 1 , X[i] , 1 do
					--CreateObj ( ObjID , X , Y , Z , Dir , Count )  
					MonsterGroup[Count] = CreateObj( Frog[1] , BaseX-dis[i]*math.cos(math.pi*2*(j/X[i])) , BaseY , BaseZ+dis[i]*math.sin(math.pi*2*(j/X[i])) , BaseDir , 1 )
					Count = Count + 1
				end
			end
			for i = 1 , table.getn(MonsterGroup) do
				AddToPartition( MonsterGroup[i] , RoomID )
				SetModeEx( MonsterGroup[i] , EM_SetModeType_Revive , true )--可重生
				SetRandMove( MonsterGroup[i] , 100 , 50 , 50 )
			end
		--	local Frogaa = LuaFunc_CreateObjByObj ( Frog[1] , OwnerID() )
		--	SetModeEx( Frogaa , EM_SetModeType_Revive , true )--可重生
		--	Hide( Frogaa )
		--	Show( Frogaa , 0 )
		--	SetRandMove( Frogaa , 100 , 300 , 50 )
		elseif ZoneID == Zone[4] then

			local Obj = Role:new( OwnerID() )
			local BaseX = Obj :X()
			local BaseY = Obj :Y()
			local BaseZ = Obj :Z()
			local BaseDir = Obj :Dir()
			local MonsterGroup = {}
			local X = { 10 }-- 幾邊型
			local dis = { 50 } -- 距離圓心的距離
			local Count = 1
		
			for i = 1 , table.getn(X) do
				for j = 1 , X[i] , 1 do
					--CreateObj ( ObjID , X , Y , Z , Dir , Count )  
					MonsterGroup[Count] = CreateObj( Frog[4] , BaseX-dis[i]*math.cos(math.pi*2*(j/X[i])) , BaseY , BaseZ+dis[i]*math.sin(math.pi*2*(j/X[i])) , BaseDir , 1 )
					Count = Count + 1
				end
			end
			for i = 1 , table.getn(MonsterGroup) do
				AddToPartition( MonsterGroup[i] , RoomID )
				SetModeEx( MonsterGroup[i] , EM_SetModeType_Revive , true )--可重生
				SetRandMove( MonsterGroup[i] , 100 , 50 , 50 )
			end

		--	local Frogaa = LuaFunc_CreateObjByObj ( Frog[4] , OwnerID() )
		--	SetModeEx( Frogaa , EM_SetModeType_Revive , true )--可重生
		--	Hide( Frogaa )
		--	Show( Frogaa , 0 )
		--	SetRandMove( Frogaa , 100 , 300 , 50 )
		elseif ZoneID == Zone[5] then

			local Obj = Role:new( OwnerID() )
			local BaseX = Obj :X()
			local BaseY = Obj :Y()
			local BaseZ = Obj :Z()
			local BaseDir = Obj :Dir()
			local MonsterGroup = {}
			local X = { 10 }-- 幾邊型
			local dis = { 50 } -- 距離圓心的距離
			local Count = 1
		
			for i = 1 , table.getn(X) do
				for j = 1 , X[i] , 1 do
					--CreateObj ( ObjID , X , Y , Z , Dir , Count )  
					MonsterGroup[Count] = CreateObj( Frog[5] , BaseX-dis[i]*math.cos(math.pi*2*(j/X[i])) , BaseY , BaseZ+dis[i]*math.sin(math.pi*2*(j/X[i])) , BaseDir , 1 )
					Count = Count + 1
				end
			end
			for i = 1 , table.getn(MonsterGroup) do
				AddToPartition( MonsterGroup[i] , RoomID )
				SetModeEx( MonsterGroup[i] , EM_SetModeType_Revive , true )--可重生
				SetRandMove( MonsterGroup[i] , 100 , 50 , 50 )
			end

		--	local Frogaa = LuaFunc_CreateObjByObj ( Frog[5] , OwnerID() )
		--	SetModeEx( Frogaa , EM_SetModeType_Revive , true )--可重生
		--	Hide( Frogaa )
		--	Show( Frogaa , 0 )
		--	SetRandMove( Frogaa , 100 , 300 , 50 )
		elseif ZoneID == Zone[6] then

			local Obj = Role:new( OwnerID() )
			local BaseX = Obj :X()
			local BaseY = Obj :Y()
			local BaseZ = Obj :Z()
			local BaseDir = Obj :Dir()
			local MonsterGroup = {}
			local X = { 10 }-- 幾邊型
			local dis = { 50 } -- 距離圓心的距離
			local Count = 1
		
			for i = 1 , table.getn(X) do
				for j = 1 , X[i] , 1 do
					--CreateObj ( ObjID , X , Y , Z , Dir , Count )  
					MonsterGroup[Count] = CreateObj( Frog[6] , BaseX-dis[i]*math.cos(math.pi*2*(j/X[i])) , BaseY , BaseZ+dis[i]*math.sin(math.pi*2*(j/X[i])) , BaseDir , 1 )
					Count = Count + 1
				end
			end
			for i = 1 , table.getn(MonsterGroup) do
				AddToPartition( MonsterGroup[i] , RoomID )
				SetModeEx( MonsterGroup[i] , EM_SetModeType_Revive , true )--可重生
				SetRandMove( MonsterGroup[i] , 100 , 50 , 50 )
			end

		--	local Frogaa = LuaFunc_CreateObjByObj ( Frog[6] , OwnerID() )
		--	SetModeEx( Frogaa , EM_SetModeType_Revive , true )--可重生
		--	Hide( Frogaa )
		--	Show( Frogaa , 0 )
		--	SetRandMove( Frogaa , 100 , 300 , 50 )
		elseif ZoneID == Zone[7] then

			local Obj = Role:new( OwnerID() )
			local BaseX = Obj :X()
			local BaseY = Obj :Y()
			local BaseZ = Obj :Z()
			local BaseDir = Obj :Dir()
			local MonsterGroup = {}
			local X = { 10 }-- 幾邊型
			local dis = { 50 } -- 距離圓心的距離
			local Count = 1
		
			for i = 1 , table.getn(X) do
				for j = 1 , X[i] , 1 do
					--CreateObj ( ObjID , X , Y , Z , Dir , Count )  
					MonsterGroup[Count] = CreateObj( Frog[7] , BaseX-dis[i]*math.cos(math.pi*2*(j/X[i])) , BaseY , BaseZ+dis[i]*math.sin(math.pi*2*(j/X[i])) , BaseDir , 1 )
					Count = Count + 1
				end
			end
			for i = 1 , table.getn(MonsterGroup) do
				AddToPartition( MonsterGroup[i] , RoomID )
				SetModeEx( MonsterGroup[i] , EM_SetModeType_Revive , true )--可重生
				SetRandMove( MonsterGroup[i] , 100 , 50 , 50 )
			end

		--	local Frogaa = LuaFunc_CreateObjByObj ( Frog[7] , OwnerID() )
		--	SetModeEx( Frogaa , EM_SetModeType_Revive , true )--可重生
		--	Hide( Frogaa )
		--	Show( Frogaa , 0 )
		--	SetRandMove( Frogaa , 100 , 300 , 50 )
		elseif ZoneID == Zone[8] then

			local Obj = Role:new( OwnerID() )
			local BaseX = Obj :X()
			local BaseY = Obj :Y()
			local BaseZ = Obj :Z()
			local BaseDir = Obj :Dir()
			local MonsterGroup = {}
			local X = { 10 }-- 幾邊型
			local dis = { 50 } -- 距離圓心的距離
			local Count = 1
		
			for i = 1 , table.getn(X) do
				for j = 1 , X[i] , 1 do
					--CreateObj ( ObjID , X , Y , Z , Dir , Count )  
					MonsterGroup[Count] = CreateObj( Frog[8] , BaseX-dis[i]*math.cos(math.pi*2*(j/X[i])) , BaseY , BaseZ+dis[i]*math.sin(math.pi*2*(j/X[i])) , BaseDir , 1 )
					Count = Count + 1
				end
			end
			for i = 1 , table.getn(MonsterGroup) do
				AddToPartition( MonsterGroup[i] , RoomID )
				SetModeEx( MonsterGroup[i] , EM_SetModeType_Revive , true )--可重生
				SetRandMove( MonsterGroup[i] , 100 , 50 , 50 )
			end

		--	local Frogaa = LuaFunc_CreateObjByObj ( Frog[8] , OwnerID() )
		--	SetModeEx( Frogaa , EM_SetModeType_Revive , true )--可重生
		--	Hide( Frogaa )
		--	Show( Frogaa , 0 )
		--	SetRandMove( Frogaa , 100 , 300 , 50 )
		end
		Delobj( OwnerID()  )
		break
	end
end