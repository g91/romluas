function yuyu_111612_0() 
	local CT = 10	-- �@���ˬd�@��
	local MP = 150	-- ñ���I���d�ɶ�
	local Leaderboy = OwnerID()
	local MARK = { }
	local Hour = GetSystime( 1 )
	local Monster01 = { }
	local Monster02 = { }
	local Monster03 = { }
	local MonsterKing = { }

	WriteRoleValue(Leaderboy ,EM_RoleValue_IsWalk , 0 ) --�R�O�Ө��ⳣ�Ψ���(  �]�h�] 0 )
	MoveToFlagEnabled( Leaderboy , false )

	SetModeEx( Leaderboy  , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( Leaderboy , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( Leaderboy  , EM_SetModeType_Strikback, false )--����
	SetModeEx( Leaderboy  , EM_SetModeType_Move , TRUE )--����

	ScriptMessage( Leaderboy , -1 , 1 , "[SC_YU_HW_111611_0]" , C_SYSTEM ) --�ѥ[�ʰ��j�C�檺�_�I�̡̭I�ڭ̭n�X�o�o�I
	Say( Leaderboy , "[SC_YU_HW_111611_0]" )  
	DebugMsg( 0,0, "time is "..Hour )	-- ���ʶ}�l
	DesignLog( Leaderboy , 111611 , "time is "..Hour )	-- ���ʶ}�l

	sleep(CT)
	WriteRoleValue(Leaderboy ,EM_RoleValue_IsWalk , 1 )
	MARK[1] = CreateObjByFlag( 111593, 780201, 8 , 1 );            --ñ��� 
	AddToPartition( MARK[1] , 0) 

	LuaFunc_WaitMoveTo( Leaderboy, 2637.4 , 44.1 , 1000.6 )
	WriteRoleValue(Leaderboy ,EM_RoleValue_IsWalk , 0 )
	LuaFunc_MoveToFlag( Leaderboy, 780199 , 30 , 0 )
	LuaFunc_MoveToFlag( Leaderboy, 780199 , 31 , 0 )
	sleep(CT)
		ScriptMessage( Leaderboy , 0 , 1 , "[SC_YU_HW_111611_3]" , C_SYSTEM ) --ñ���I���o�I�j�a�y�L�𮧤@�U�a�I
		Say( Leaderboy , "[SC_YU_HW_111611_3]" )  
	sleep(MP)
		ScriptMessage( Leaderboy , 0 , 1 , "[SC_YU_HW_111611_2]" , C_SYSTEM ) --�n�o�I�ڭ̨��a�I
		Say( Leaderboy , "[SC_YU_HW_111611_2]" )  
	sleep(CT)
	LuaFunc_WaitMoveTo( Leaderboy, 2584.9 , -14.9 , 1683.5 )
	sleep(CT)
		ScriptMessage( Leaderboy , 0 , 1 , "[SC_YU_HW_111611_1]" , C_SYSTEM ) --����
		Say( Leaderboy , "[SC_YU_HW_111611_1]" )  
		WriteRoleValue(Leaderboy ,EM_RoleValue_IsWalk , 1 ) --�C��
		Delobj( MARK[1] )
	sleep(CT)
	LuaFunc_WaitMoveTo( Leaderboy, 2656.5 , -14.2 , 1849.9 )

	SetModeEx( Leaderboy  , EM_SetModeType_Searchenemy, true )--����
	SetModeEx( Leaderboy , EM_SetModeType_Fight , true )--�i�������
	SetModeEx( Leaderboy  , EM_SetModeType_Strikback, true )--����
	WriteRoleValue(  Leaderboy   , EM_RoleValue_Register , 0 ) --����N�~�A�԰��e�A���M�žɹC

	Monster01[1] = CreateObjByFlag( 101285, 780201, 9 , 1 );            --��
	Monster01[2] = CreateObjByFlag( 101285, 780201, 10 , 1 );            --��
	Monster01[3] = CreateObjByFlag( 101281, 780201, 11 , 1 );            --��
	Monster01[4] = CreateObjByFlag( 101281, 780201, 12 , 1 );            --��
	
	for i=1 , table.getn(Monster01) do	
		WriteRoleValue( Monster01[i] , EM_RoleValue_PID , Leaderboy ) --�O��ɹC
		AddToPartition( Monster01[i] , 0) 
		SetAttack( Monster01[i] , Leaderboy  )
	end
	SetAttack( Leaderboy , Monster01[1]  )
	CallPlot(Leaderboy , "Lua_na_2008_tourist_check2" , 4 )
	Lua_na_2008_tourist_check(4) --�ˬd�����q���������ʩǪ��G4��
	MARK[2] = CreateObjByFlag( 111594, 780201, 13 , 1 );            --ñ���
	AddToPartition( MARK[2]  , 0) 
	LuaFunc_MoveToFlag( Leaderboy, 780199 , 35 , 0 )
	LuaFunc_MoveToFlag( Leaderboy, 780199 , 36 , 0 )
	sleep(CT)
		ScriptMessage( Leaderboy , 0 , 1 , "[SC_YU_HW_111611_3]" , C_SYSTEM ) --ñ���I���o�I�j�a�y�L�𮧤@�U�a�I
		Say( Leaderboy , "[SC_YU_HW_111611_3]" )  
	sleep(MP)
		ScriptMessage( Leaderboy , 0 , 1 , "[SC_YU_HW_111611_2]" , C_SYSTEM ) --�n�o�I�ڭ̨��a�I
		Say( Leaderboy , "[SC_YU_HW_111611_2]" )  
	sleep(CT)
	LuaFunc_MoveToFlag( Leaderboy, 780199 , 37 , 0 )
	LuaFunc_MoveToFlag( Leaderboy, 780199 , 38 , 0 )
	sleep(CT)
		ScriptMessage( Leaderboy , 0 , 1 , "[SC_YU_HW_111611_1]" , C_SYSTEM ) --����
		Say( Leaderboy , "[SC_YU_HW_111611_1]" )  
		WriteRoleValue(Leaderboy ,EM_RoleValue_IsWalk , 1 ) --�C��
		Delobj( MARK[2] )
	sleep(CT)
	LuaFunc_MoveToFlag( Leaderboy, 780199 , 39 , 0 )
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
		SetAttack( Monster02[i] , Leaderboy  )
	end
	SetAttack( Leaderboy , Monster02[1]  )
	CallPlot(Leaderboy , "Lua_na_2008_tourist_check2" , 6 )
	Lua_na_2008_tourist_check(6) --�ˬd�����q���������ʩǪ��G6��
	MARK[3] = CreateObjByFlag( 111595, 780201, 20 , 1 );            --ñ���
	AddToPartition( MARK[3] , 0) 
	LuaFunc_MoveToFlag( Leaderboy, 780199 , 40 , 0 )
		ScriptMessage( Leaderboy , 0 , 1 , "[SC_YU_HW_111611_3]" , C_SYSTEM ) --ñ���I���o�I�j�a�y�L�𮧤@�U�a�I
		Say( Leaderboy , "[SC_YU_HW_111611_3]" )  
	sleep(MP)
		ScriptMessage( Leaderboy , 0 , 1 , "[SC_YU_HW_111611_2]" , C_SYSTEM ) --�n�o�I�ڭ̨��a�I
		Say( Leaderboy , "[SC_YU_HW_111611_2]" )  
	sleep(CT)
		LuaFunc_MoveToFlag( Leaderboy, 780199 , 41 , 0 )
		LuaFunc_MoveToFlag( Leaderboy, 780199 , 42 , 0 )
		LuaFunc_MoveToFlag( Leaderboy, 780199 , 43 , 0 )
	sleep(CT)
		ScriptMessage( Leaderboy , 0 , 1 , "[SC_YU_HW_111611_1]" , C_SYSTEM ) --����
		Say( Leaderboy , "[SC_YU_HW_111611_1]" )  
		WriteRoleValue(Leaderboy ,EM_RoleValue_IsWalk , 1 ) --�C��
		Delobj( MARK[3] )
	sleep(CT)
	LuaFunc_MoveToFlag( Leaderboy, 780199 , 44 , 0 )

	SetModeEx( Leaderboy  , EM_SetModeType_Searchenemy, true )--����
	SetModeEx( Leaderboy , EM_SetModeType_Fight , true )--�i�������
	SetModeEx( Leaderboy  , EM_SetModeType_Strikback, true )--����
	WriteRoleValue(  Leaderboy   , EM_RoleValue_Register , 0 ) --����N�~�A�԰��e�A���M�žɹC
	
	Monster03[1] = CreateObjByFlag( 101281, 780201, 21 , 1 );            --��
	Monster03[2] = CreateObjByFlag( 101283, 780201, 22 , 1 );            --��
	Monster03[3] = CreateObjByFlag( 101285, 780201, 23 , 1 );            --��
	Monster03[4] = CreateObjByFlag( 101281, 780201, 24 , 1 );            --��
	Monster03[5] = CreateObjByFlag( 101287, 780201, 25 , 1 );            --��
	Monster03[6] = CreateObjByFlag( 101281, 780201, 26 , 1 );            --��
	Monster03[7] = CreateObjByFlag( 101286, 780201, 27 , 1 );            --��
	Monster03[8] = CreateObjByFlag( 101283, 780201, 28 , 1 );            --��
	for i=1 , #Monster03 do	
		WriteRoleValue( Monster03[i] , EM_RoleValue_PID , Leaderboy ) --�O��ɹC
		AddToPartition( Monster03[i], 0) 
		SetAttack( Monster03[i] , Leaderboy  )
	end
	SetAttack( Leaderboy , Monster03[1]  )
	CallPlot(Leaderboy , "Lua_na_2008_tourist_check2" , 8 )
	Lua_na_2008_tourist_check(8) --�ˬd�����q���������ʩǪ��G8��
	MARK[4] = CreateObjByFlag( 111596, 780201, 29 , 1 );            --ñ���
	AddToPartition( MARK[4] , 0) 
	LuaFunc_MoveToFlag( Leaderboy, 780199 , 45 , 0 )
		ScriptMessage( Leaderboy , 0 , 1 , "[SC_YU_HW_111611_3]" , C_SYSTEM ) --ñ���I���o�I�j�a�y�L�𮧤@�U�a�I
		Say( Leaderboy , "[SC_YU_HW_111611_3]" )  
	sleep(MP)
		ScriptMessage( Leaderboy , 0 , 1 , "[SC_YU_HW_111611_2]" , C_SYSTEM ) --�n�o�I�ڭ̨��a�I
		Say( Leaderboy , "[SC_YU_HW_111611_2]" )  
	sleep(CT)
	LuaFunc_MoveToFlag( Leaderboy, 780199 , 46 , 0 )
	LuaFunc_MoveToFlag( Leaderboy, 780199 , 47 , 0 )
	sleep(CT)
		ScriptMessage( Leaderboy , 0 , 1 , "[SC_YU_HW_111611_1]" , C_SYSTEM ) --����
		Say( Leaderboy , "[SC_YU_HW_111611_1]" )  
		WriteRoleValue(Leaderboy ,EM_RoleValue_IsWalk , 0 ) --�C��
		Delobj( MARK[4]  )
	sleep(CT)
	LuaFunc_MoveToFlag( Leaderboy, 780199 , 48 , 0 )
	sleep(CT)

	local MonsterKing = { }

	MonsterKing[1] = CreateObjByFlag( 101282, 780201, 30 , 1 );            --��
	MonsterKing[2] = CreateObjByFlag( 101288, 780201, 31 , 1 );            --��

	for i=1 , table.getn(MonsterKing) do	
		WriteRoleValue( MonsterKing[i] , EM_RoleValue_PID , Leaderboy ) --�O��ɹC
		SetModeEx( MonsterKing[i]  , EM_SetModeType_Searchenemy, false )--����
		SetModeEx( MonsterKing[i] , EM_SetModeType_Fight , false )--�i�������
		AddToPartition( MonsterKing[i] , 0) 
	end

	sleep(10)		
	PlayMotion( MonsterKing[1]  , 123) 
	SetStopAttack( MonsterKing[1] ) 	
	ScriptMessage( MonsterKing[1] , 0 , 1 , "[SC_YU_HW_111611_4]" , C_SYSTEM ) --����
	Say( MonsterKing[1] , "[SC_YU_HW_111611_4]" )  
	sleep(40)

	SetModeEx( Leaderboy  , EM_SetModeType_Searchenemy, true )--����
	SetModeEx( Leaderboy , EM_SetModeType_Fight , true )--�i�������
	SetModeEx( Leaderboy  , EM_SetModeType_Strikback, true )--����
	WriteRoleValue(  Leaderboy   , EM_RoleValue_Register , 0 ) --����N�~�A�԰��e�A���M�žɹC

	SetModeEx( MonsterKing[1]  , EM_SetModeType_Searchenemy, true )--����
	SetModeEx( MonsterKing[1] , EM_SetModeType_Fight , true )--�i�������
	SetModeEx( MonsterKing[2]  , EM_SetModeType_Searchenemy, true )--����
	SetModeEx( MonsterKing[2] , EM_SetModeType_Fight , true )--�i�������
	SetAttack( MonsterKing[1] , Leaderboy  )
	SetAttack( MonsterKing[2] , Leaderboy  )
	SetAttack( Leaderboy , MonsterKing[1] )
	CallPlot(Leaderboy , "Lua_na_2008_tourist_check2" , 2 )
	Lua_na_2008_tourist_check(2) --�ˬd�����q���������ʩǪ��G2��
	MARK[5] = CreateObjByFlag( 111597, 780201, 29 , 1 );            --ñ���
	AddToPartition( MARK[5] , 0) 
	BeginPlot( Leaderboy  , "yuyu_111612_1" , 0 )  
end