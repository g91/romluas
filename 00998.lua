function yuyu_111612_1() 
	local CT = 10	-- �@���ˬd�@��
	local MP = 150	-- ñ���I���d�ɶ�
	local MARK = { }
	local Leaderboy = OwnerID()
	local Monster01 = { }
	local Monster02 = { }
	local Monster03 = { }

	WriteRoleValue(Leaderboy ,EM_RoleValue_IsWalk , 0 ) --�b�]
	MoveToFlagEnabled( Leaderboy , false )
	LuaFunc_MoveToFlag( Leaderboy, 780199 , 47 ,0 )
	LuaFunc_MoveToFlag( Leaderboy, 780199 , 46 , 0 )
	LuaFunc_MoveToFlag( Leaderboy, 780199 , 45 , 0 )
		ScriptMessage( Leaderboy , 0 , 1 , "[SC_YU_HW_111611_3]" , C_SYSTEM ) --ñ���I���o�I�j�a�y�L�𮧤@�U�a�I
		Say( Leaderboy, "[SC_YU_HW_111611_3]" )  
		local MARKER = LuaFunc_SearchNPCbyOrgID( Leaderboy , 111597, 100 , 1)       --ñ���5	

	sleep(MP)
		ScriptMessage( Leaderboy, 0 , 1 , "[SC_YU_HW_111611_2]" , C_SYSTEM ) --�n�o�I�ڭ̨��a�I
		Say(Leaderboy , "[SC_YU_HW_111611_2]" )  
	sleep(CT)
		ScriptMessage( Leaderboy, 0 , 1 , "[SC_YU_HW_111611_1]" , C_SYSTEM ) --����
		Say( Leaderboy, "[SC_YU_HW_111611_1]" )  
		WriteRoleValue(Leaderboy,EM_RoleValue_IsWalk , 1 ) --�C��
		Delobj( MARKER[0] )
	sleep(CT)
	LuaFunc_MoveToFlag( Leaderboy, 780199 , 44 , 0 )

	SetModeEx( Leaderboy , EM_SetModeType_Searchenemy, true )--����
	SetModeEx( Leaderboy , EM_SetModeType_Fight , true )--�i�������
	SetModeEx( Leaderboy  , EM_SetModeType_Strikback, true )--����
	WriteRoleValue(  Leaderboy   , EM_RoleValue_Register , 0 ) --����N�~�A�԰��e�A���M�žɹC
	
	Monster01[1] = CreateObjByFlag( 101281, 780201, 21 , 1 );            --��
	Monster01[2] = CreateObjByFlag( 101283, 780201, 22 , 1 );            --��
	Monster01[3] = CreateObjByFlag( 101285, 780201, 23 , 1 );            --��
	Monster01[4] = CreateObjByFlag( 101281, 780201, 24 , 1 );            --��
	Monster01[5] = CreateObjByFlag( 101287, 780201, 25 , 1 );            --��
	Monster01[6] = CreateObjByFlag( 101281, 780201, 26 , 1 );            --��
	Monster01[7] = CreateObjByFlag( 101286, 780201, 27 , 1 );            --��
	Monster01[8] = CreateObjByFlag( 101283, 780201, 28 , 1 );            --��

	for i=1 , table.getn(Monster01) do	
		WriteRoleValue( Monster01[i] , EM_RoleValue_PID , Leaderboy ) --�O��ɹC
		AddToPartition( Monster01[i] , 0) 
		SetAttack( Monster01[i] , Leaderboy  )
	end
	SetAttack( Leaderboy , Monster01[1]  )
	CallPlot(Leaderboy , "Lua_na_2008_tourist_check2" , 8 )
	Lua_na_2008_tourist_check(8) --�ˬd�����q���������ʩǪ��G8��
	MARK[1] = CreateObjByFlag( 111598, 780201, 20 , 1 );            --ñ���
	AddToPartition( MARK[1] , 0) 
	LuaFunc_MoveToFlag( Leaderboy , 780199 , 43 , 0 )
	LuaFunc_MoveToFlag(Leaderboy , 780199 , 42 , 0 )
	LuaFunc_MoveToFlag(Leaderboy , 780199 , 41 , 0 )
	LuaFunc_MoveToFlag(Leaderboy , 780199 , 40 , 0 )
		ScriptMessage( Leaderboy , 0 , 1 , "[SC_YU_HW_111611_3]" , C_SYSTEM ) --ñ���I���o�I�j�a�y�L�𮧤@�U�a�I
		Say( Leaderboy , "[SC_YU_HW_111611_3]" )  
	sleep(MP)
		ScriptMessage(Leaderboy  , 0 , 1 , "[SC_YU_HW_111611_2]" , C_SYSTEM ) --�n�o�I�ڭ̨��a�I
		Say( Leaderboy , "[SC_YU_HW_111611_2]" )  
	sleep(CT)
		ScriptMessage( Leaderboy , 0 , 1 , "[SC_YU_HW_111611_1]" , C_SYSTEM ) --����
		Say( Leaderboy , "[SC_YU_HW_111611_1]" )  
		WriteRoleValue(Leaderboy  ,EM_RoleValue_IsWalk , 1 ) --�C��
		Delobj( MARK[1] )
	sleep(CT)
	LuaFunc_MoveToFlag( Leaderboy , 780199 , 39 , 0 )

	SetModeEx( Leaderboy  , EM_SetModeType_Searchenemy, true )--����
	SetModeEx( Leaderboy , EM_SetModeType_Fight , true )--�i�������
	SetModeEx( Leaderboy  , EM_SetModeType_Strikback, true )--����
	WriteRoleValue(  Leaderboy   , EM_RoleValue_Register , 0 ) --����N�~�A�԰��e�A���M�žɹC

	Monster02[1] = CreateObjByFlag( 101281, 780201, 14 , 1 );            --��
	Monster02[2] = CreateObjByFlag( 101283, 780201, 15 , 1 );            --��
	Monster02[3] = CreateObjByFlag( 101286, 780201, 16 , 1 );            --��
	Monster02[4] = CreateObjByFlag( 101281, 780201, 17 , 1 );            --��
	Monster02[5] = CreateObjByFlag( 101283, 780201, 18 , 1 );            --��
	Monster02[6] = CreateObjByFlag( 101286, 780201, 19 , 1 );            --��

	for i=1 , table.getn(Monster02) do	
		WriteRoleValue( Monster02[i] , EM_RoleValue_PID , Leaderboy ) --�O��ɹC
		AddToPartition( Monster02[i] , 0) 
		SetAttack( Monster02[i] , Leaderboy )
	end
	SetAttack( Leaderboy , Monster02[1]  )
	CallPlot(Leaderboy , "Lua_na_2008_tourist_check2" , 6 )
	Lua_na_2008_tourist_check(6) --�ˬd�����q���������ʩǪ��G6��
	MARK[2] = CreateObjByFlag( 111599, 780201, 13 , 1 );            --ñ���
	AddToPartition( MARK[2] , 0)
	LuaFunc_MoveToFlag( Leaderboy , 780199 , 38 , 0 )
	LuaFunc_MoveToFlag( Leaderboy , 780199 , 37 , 0 )
	LuaFunc_MoveToFlag( Leaderboy , 780199 , 36 , 0 )
	sleep(CT)
		ScriptMessage( Leaderboy  , 0 , 1 , "[SC_YU_HW_111611_3]" , C_SYSTEM ) --ñ���I���o�I�j�a�y�L�𮧤@�U�a�I
		Say( Leaderboy  , "[SC_YU_HW_111611_3]" )  
	sleep(MP)
		ScriptMessage( Leaderboy , 0 , 1 , "[SC_YU_HW_111611_2]" , C_SYSTEM ) --�n�o�I�ڭ̨��a�I
		Say( Leaderboy , "[SC_YU_HW_111611_2]" )  
	sleep(CT)
	LuaFunc_MoveToFlag( Leaderboy , 780199 , 35 , 0 )
	sleep(CT)
		ScriptMessage( Leaderboy  , 0 , 1 , "[SC_YU_HW_111611_1]" , C_SYSTEM ) --����
		Say( Leaderboy , "[SC_YU_HW_111611_1]" )  
		WriteRoleValue(Leaderboy ,EM_RoleValue_IsWalk , 1 ) --�C��
		Delobj( MARK[2] )
	sleep(CT)
	LuaFunc_WaitMoveTo( Leaderboy , 2656.5 , -14.2 , 1849.9 )
	SetModeEx( Leaderboy  , EM_SetModeType_Searchenemy, true )--����
	SetModeEx( Leaderboy  , EM_SetModeType_Fight , true )--�i�������
	SetModeEx( Leaderboy  , EM_SetModeType_Strikback, true )--����
	WriteRoleValue(  Leaderboy   , EM_RoleValue_Register , 0 ) --����N�~�A�԰��e�A���M�žɹC
	Monster03[1] = CreateObjByFlag( 101285, 780201, 9 , 1 );            --��
	Monster03[2] = CreateObjByFlag( 101285, 780201, 10 , 1 );            --��
	Monster03[3] = CreateObjByFlag( 101281, 780201, 11 , 1 );            --��
	Monster03[4] = CreateObjByFlag( 101281, 780201, 12 , 1 );            --��
	
	for i=1 , table.getn(Monster03) do	
		WriteRoleValue( Monster03[i] , EM_RoleValue_PID , Leaderboy ) --�O��ɹC
		AddToPartition( Monster03[i] , 0) 
		SetAttack( Monster03[i] , Leaderboy )
	end
	SetAttack( Leaderboy , Monster03[1]  )
	CallPlot(Leaderboy , "Lua_na_2008_tourist_check2" ,  4 )
	Lua_na_2008_tourist_check(4) --�ˬd�����q���������ʩǪ��G4��
	MARK[3] = CreateObjByFlag( 111600, 780201, 8 , 1 );            --ñ���
	AddToPartition( MARK[3] , 0) 
	LuaFunc_WaitMoveTo( Leaderboy , 2584.9 , -14.9 , 1683.5 )
	LuaFunc_MoveToFlag( Leaderboy , 780199 , 31 , 0 )
	sleep(CT)
		ScriptMessage( Leaderboy , 0 , 1 , "[SC_YU_HW_111611_3]" , C_SYSTEM ) --ñ���I���o�I�j�a�y�L�𮧤@�U�a�I
		Say( Leaderboy , "[SC_YU_HW_111611_3]" )  
	sleep(MP)
		ScriptMessage(Leaderboy , 0 , 1 , "[SC_YU_HW_111611_2]" , C_SYSTEM ) --�n�o�I�ڭ̨��a�I
		Say( Leaderboy , "[SC_YU_HW_111611_2]" )  
		Delobj( MARK[3] )
	sleep(CT)
	LuaFunc_MoveToFlag( Leaderboy , 780199 , 30 , 0 )
	LuaFunc_WaitMoveTo( Leaderboy , 2637.4 , 44.1 , 1000.6 )
	LuaFunc_MoveToFlag( Leaderboy , 780199 , 50 , 0 )

	ScriptMessage( Leaderboy  , 0 , 1 , "[SC_111577_YU_10]" , C_SYSTEM ) --�ʰ��j�C��A���\�I
	Say( Leaderboy , "[SC_111577_YU_10]" )  
	local Leader = LuaFunc_SearchNPCbyOrgID( Leaderboy  , 111604, 100 , 1)       --�޲z��
	WriteRoleValue( Leader[0]  , EM_RoleValue_PID , 0 )
	WriteRoleValue( Leaderboy  , EM_RoleValue_PID , 0 )
	SetPosByFlag( Leaderboy , 780199 , 50 )
end