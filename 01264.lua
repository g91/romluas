function LuaYU_Frogbabago5_00()   --�C��޾ɪ�--�����C��S����
	
	local Obj = Role:new( OwnerID() )
	local ZoneID = Obj:ZoneID() -1000*math.floor(Obj:ZoneID() / 1000 )
	local RoomID = ReadRoleValue(  OwnerID() ,EM_RoleValue_RoomID) 

	if ZoneID == 1 or ZoneID == 10 or  ZoneID == 2 or ZoneID == 4 or  ZoneID == 5 or  ZoneID == 6 or ZoneID == 12 then

		local Frog = LuaFunc_CreateObjByObj ( 100044 , OwnerID() )

		SetModeEx( Frog   , EM_SetModeType_Strikback, false )--����
		SetModeEx( Frog   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
		SetModeEx( Frog   , EM_SetModeType_Obstruct, false )--����
		SetModeEx( Frog   , EM_SetModeType_Mark, false )--�аO
		SetModeEx( Frog   , EM_SetModeType_Move, false )--����
		SetModeEx( Frog   , EM_SetModeType_Searchenemy, false )--����
		SetModeEx( Frog   , EM_SetModeType_HideName, true )--�W��
		SetModeEx( Frog   , EM_SetModeType_ShowRoleHead, false )--�Y����
		SetModeEx( Frog   , EM_SetModeType_Show , false ) --�����
		SetModeEx( Frog   , EM_SetModeType_Fight , false )--�i�������

		Hide( Frog )
		Show( Frog ,RoomID )

		Beginplot( Frog ,"LuaYU_Frogbabago5_01", 0 )

	else
		ScriptMessage( OwnerID() , OwnerID() , 1, "You can't use it in this zone.", 0 )
		ScriptMessage( OwnerID() , OwnerID() , 0, "You can't use it in this zone.", 0 )

	end

end


function LuaYU_Frogbabago5_01()   --�C��޾ɪ�

	local Obj = Role:new( OwnerID() )
	local ZoneID = Obj:ZoneID() -1000*math.floor(Obj:ZoneID() / 1000 )
	local RoomID = ReadRoleValue(  OwnerID() ,EM_RoleValue_RoomID) 

	if ZoneID == 1 then

		local Frogaa = LuaFunc_CreateObjByObj ( 101712 , OwnerID() )
		SetModeEx( Frogaa   , EM_SetModeType_Revive , true )--�i����


		Hide( Frogaa )
		Show( Frogaa ,0 )



		local X = ReadRoleValue( Frogaa , EM_RoleValue_X )
		local Y = ReadRoleValue( Frogaa  , EM_RoleValue_Y )
		local Z = ReadRoleValue( Frogaa  , EM_RoleValue_Z )
		local Dir  = ReadRoleValue( Frogaa  , EM_RoleValue_Dir )



		local Frogbb = CreateObj( 101712 , X+20 , Y , Z-20 , Dir  , 1 )
		SetModeEx( Frogbb   , EM_SetModeType_Revive , true )--�i����
		AddToPartition( Frogbb, RoomID) 

		local Frogcc = CreateObj( 101712 , X-20 , Y , Z+20 , Dir  , 1 )
		SetModeEx( Frogcc   , EM_SetModeType_Revive , true )--�i����
		AddToPartition( Frogcc, RoomID) 

		local Frogdd = CreateObj( 101712 , X+30 , Y , Z-30 , Dir  , 1 )
		SetModeEx( Frogdd   , EM_SetModeType_Revive , true )--�i����
		AddToPartition( Frogdd, RoomID) 

		local Frogee = CreateObj( 101712 , X-30 , Y , Z+30 , Dir  , 1 )
		SetModeEx( Frogee   , EM_SetModeType_Revive , true )--�i����
		AddToPartition( Frogee, RoomID) 


		SetRandMove( Frogaa , 100 ,300,50 )
		SetRandMove( Frogbb , 100 ,300,50 )	
		SetRandMove( Frogcc , 100 ,300,50 )	
		SetRandMove( Frogdd , 100 ,300,50 )	
		SetRandMove( Frogee , 100 ,300,50 )	


		Delobj( OwnerID()  )

	elseif ZoneID == 10 then

		local Frogaa = LuaFunc_CreateObjByObj ( 101712 , OwnerID() )
		SetModeEx( Frogaa   , EM_SetModeType_Revive , true )--�i����


		Hide( Frogaa )
		Show( Frogaa ,0 )



		local X = ReadRoleValue( Frogaa , EM_RoleValue_X )
		local Y = ReadRoleValue( Frogaa  , EM_RoleValue_Y )
		local Z = ReadRoleValue( Frogaa  , EM_RoleValue_Z )
		local Dir  = ReadRoleValue( Frogaa  , EM_RoleValue_Dir )



		local Frogbb = CreateObj( 101712 , X+20 , Y , Z+20 , Dir  , 1 )
		SetModeEx( Frogbb   , EM_SetModeType_Revive , true )--�i����
		AddToPartition( Frogbb, RoomID) 

		local Frogcc = CreateObj( 101712 , X-20 , Y , Z-20 , Dir  , 1 )
		SetModeEx( Frogcc   , EM_SetModeType_Revive , true )--�i����
		AddToPartition( Frogcc, RoomID) 

		local Frogdd = CreateObj( 101712 , X+30 , Y , Z+30 , Dir  , 1 )
		SetModeEx( Frogdd   , EM_SetModeType_Revive , true )--�i����
		AddToPartition( Frogdd, RoomID) 

		local Frogee = CreateObj( 101712 , X-30 , Y , Z-30 , Dir  , 1 )
		SetModeEx( Frogee   , EM_SetModeType_Revive , true )--�i����
		AddToPartition( Frogee, RoomID) 


		SetRandMove( Frogaa , 100 ,300,50 )
		SetRandMove( Frogbb , 100 ,300,50 )	
		SetRandMove( Frogcc , 100 ,300,50 )	
		SetRandMove( Frogdd , 100 ,300,50 )	
		SetRandMove( Frogee , 100 ,300,50 )	


		Delobj( OwnerID()  )

	elseif ZoneID == 2 then

		local Frogaa = LuaFunc_CreateObjByObj ( 101710 , OwnerID() )
		SetModeEx( Frogaa   , EM_SetModeType_Revive , true )--�i����


		Hide( Frogaa )
		Show( Frogaa ,0 )



		local X = ReadRoleValue( Frogaa , EM_RoleValue_X )
		local Y = ReadRoleValue( Frogaa  , EM_RoleValue_Y )
		local Z = ReadRoleValue( Frogaa  , EM_RoleValue_Z )
		local Dir  = ReadRoleValue( Frogaa  , EM_RoleValue_Dir )



		local Frogbb = CreateObj( 101710 , X+20 , Y , Z+20 , Dir  , 1 )
		SetModeEx( Frogbb   , EM_SetModeType_Revive , true )--�i����
		AddToPartition( Frogbb, RoomID) 

		local Frogcc = CreateObj( 101710 , X-20 , Y , Z-20 , Dir  , 1 )
		SetModeEx( Frogcc   , EM_SetModeType_Revive , true )--�i����
		AddToPartition( Frogcc, RoomID) 

		local Frogdd = CreateObj( 101710 , X+30 , Y , Z+30 , Dir  , 1 )
		SetModeEx( Frogdd   , EM_SetModeType_Revive , true )--�i����
		AddToPartition( Frogdd, RoomID) 

		local Frogee = CreateObj( 101710 , X-30 , Y , Z-30 , Dir  , 1 )
		SetModeEx( Frogee   , EM_SetModeType_Revive , true )--�i����
		AddToPartition( Frogee, RoomID) 



		SetRandMove( Frogaa , 100 ,300,50 )
		SetRandMove( Frogbb , 100 ,300,50 )	
		SetRandMove( Frogcc , 100 ,300,50 )	
		SetRandMove( Frogdd , 100 ,300,50 )	
		SetRandMove( Frogee , 100 ,300,50 )	


		Delobj( OwnerID()  )





	elseif ZoneID == 4 then

		local Frogaa = LuaFunc_CreateObjByObj ( 101711 , OwnerID() )
		SetModeEx( Frogaa   , EM_SetModeType_Revive , true )--�i����


		Hide( Frogaa )
		Show( Frogaa ,0 )



		local X = ReadRoleValue( Frogaa , EM_RoleValue_X )
		local Y = ReadRoleValue( Frogaa  , EM_RoleValue_Y )
		local Z = ReadRoleValue( Frogaa  , EM_RoleValue_Z )
		local Dir  = ReadRoleValue( Frogaa  , EM_RoleValue_Dir )



		local Frogbb = CreateObj( 101711 , X+20 , Y , Z+20 , Dir  , 1 )
		SetModeEx( Frogbb   , EM_SetModeType_Revive , true )--�i����
		AddToPartition( Frogbb, RoomID) 

		local Frogcc = CreateObj( 101711 , X-20 , Y , Z-20 , Dir  , 1 )
		SetModeEx( Frogcc   , EM_SetModeType_Revive , true )--�i����
		AddToPartition( Frogcc, RoomID) 

		local Frogdd = CreateObj( 101711 , X+30 , Y , Z+30 , Dir  , 1 )
		SetModeEx( Frogdd   , EM_SetModeType_Revive , true )--�i����
		AddToPartition( Frogdd, RoomID) 

		local Frogee = CreateObj( 101711 , X-30 , Y , Z-30 , Dir  , 1 )
		SetModeEx( Frogee   , EM_SetModeType_Revive , true )--�i����
		AddToPartition( Frogee, RoomID) 


		SetRandMove( Frogaa , 100 ,300,50 )
		SetRandMove( Frogbb , 100 ,300,50 )	
		SetRandMove( Frogcc , 100 ,300,50 )	
		SetRandMove( Frogdd , 100 ,300,50 )	
		SetRandMove( Frogee , 100 ,300,50 )	


		Delobj( OwnerID()  )



	elseif ZoneID == 5 then
		local Frogaa = LuaFunc_CreateObjByObj ( 101714 , OwnerID() )
		SetModeEx( Frogaa   , EM_SetModeType_Revive , true )--�i����


		Hide( Frogaa )
		Show( Frogaa ,0 )



		local X = ReadRoleValue( Frogaa , EM_RoleValue_X )
		local Y = ReadRoleValue( Frogaa  , EM_RoleValue_Y )
		local Z = ReadRoleValue( Frogaa  , EM_RoleValue_Z )
		local Dir  = ReadRoleValue( Frogaa  , EM_RoleValue_Dir )



		local Frogbb = CreateObj( 101714 , X+20 , Y , Z+20 , Dir  , 1 )
		SetModeEx( Frogbb   , EM_SetModeType_Revive , true )--�i����
		AddToPartition( Frogbb, RoomID) 

		local Frogcc = CreateObj( 101714 , X-20 , Y , Z-20 , Dir  , 1 )
		SetModeEx( Frogcc   , EM_SetModeType_Revive , true )--�i����
		AddToPartition( Frogcc, RoomID) 

		local Frogdd = CreateObj( 101714 , X+30 , Y , Z+30 , Dir  , 1 )
		SetModeEx( Frogdd   , EM_SetModeType_Revive , true )--�i����
		AddToPartition( Frogdd, RoomID) 

		local Frogee = CreateObj( 101714 , X-30 , Y , Z-30 , Dir  , 1 )
		SetModeEx( Frogee   , EM_SetModeType_Revive , true )--�i����
		AddToPartition( Frogee, RoomID) 


		SetRandMove( Frogaa , 100 ,300,50 )
		SetRandMove( Frogbb , 100 ,300,50 )	
		SetRandMove( Frogcc , 100 ,300,50 )	
		SetRandMove( Frogdd , 100 ,300,50 )	
		SetRandMove( Frogee , 100 ,300,50 )	


		Delobj( OwnerID()  )

	elseif ZoneID == 6 then

		local Frogaa = LuaFunc_CreateObjByObj ( 101713 , OwnerID() )
		SetModeEx( Frogaa   , EM_SetModeType_Revive , true )--�i����


		Hide( Frogaa )
		Show( Frogaa ,0 )



		local X = ReadRoleValue( Frogaa , EM_RoleValue_X )
		local Y = ReadRoleValue( Frogaa  , EM_RoleValue_Y )
		local Z = ReadRoleValue( Frogaa  , EM_RoleValue_Z )
		local Dir  = ReadRoleValue( Frogaa  , EM_RoleValue_Dir )



		local Frogbb = CreateObj( 101713 , X+20 , Y , Z+20 , Dir  , 1 )
		SetModeEx( Frogbb   , EM_SetModeType_Revive , true )--�i����
		AddToPartition( Frogbb, RoomID) 

		local Frogcc = CreateObj( 101713 , X-20 , Y , Z-20 , Dir  , 1 )
		SetModeEx( Frogcc   , EM_SetModeType_Revive , true )--�i����
		AddToPartition( Frogcc, RoomID) 

		local Frogdd = CreateObj( 101713 , X+30 , Y , Z+30 , Dir  , 1 )
		SetModeEx( Frogdd   , EM_SetModeType_Revive , true )--�i����
		AddToPartition( Frogdd, RoomID) 

		local Frogee = CreateObj( 101713 , X-30 , Y , Z-30 , Dir  , 1 )
		SetModeEx( Frogee   , EM_SetModeType_Revive , true )--�i����
		AddToPartition( Frogee, RoomID) 



		SetRandMove( Frogaa , 100 ,300,50 )
		SetRandMove( Frogbb , 100 ,300,50 )	
		SetRandMove( Frogcc , 100 ,300,50 )	
		SetRandMove( Frogdd , 100 ,300,50 )	
		SetRandMove( Frogee , 100 ,300,50 )	


		Delobj( OwnerID()  )

	elseif ZoneID == 12 then

		local Frogaa = LuaFunc_CreateObjByObj ( 101712 , OwnerID() )
		SetModeEx( Frogaa   , EM_SetModeType_Revive , true )--�i����


		Hide( Frogaa )
		Show( Frogaa ,0 )



		local X = ReadRoleValue( Frogaa , EM_RoleValue_X )
		local Y = ReadRoleValue( Frogaa  , EM_RoleValue_Y )
		local Z = ReadRoleValue( Frogaa  , EM_RoleValue_Z )
		local Dir  = ReadRoleValue( Frogaa  , EM_RoleValue_Dir )



		local Frogbb = CreateObj( 101712 , X+20 , Y , Z-20 , Dir  , 1 )
		SetModeEx( Frogbb   , EM_SetModeType_Revive , true )--�i����
		AddToPartition( Frogbb, RoomID) 

		local Frogcc = CreateObj( 101712 , X-20 , Y , Z+20 , Dir  , 1 )
		SetModeEx( Frogcc   , EM_SetModeType_Revive , true )--�i����
		AddToPartition( Frogcc, RoomID) 

		local Frogdd = CreateObj( 101712 , X+30 , Y , Z-30 , Dir  , 1 )
		SetModeEx( Frogdd   , EM_SetModeType_Revive , true )--�i����
		AddToPartition( Frogdd, RoomID) 

		local Frogee = CreateObj( 101712 , X-30 , Y , Z+30 , Dir  , 1 )
		SetModeEx( Frogee   , EM_SetModeType_Revive , true )--�i����
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
