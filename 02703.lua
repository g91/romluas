function Lua_na_FindMistake_Q2()
	local Owner = OwnerID()
	local Target = ReadRoleValue( Owner, EM_RoleValue_Register10) --���a
	local R = ReadRoleValue( Owner, EM_RoleValue_Register2) --�^�X
	local RoomID = ReadRoleValue( Target , EM_RoleValue_RoomID ) 
	local Score = ReadRoleValue( Target, EM_LuaValueFlag_UseItem40 )
	local F = {	[1] = { 	111915, 111916, 111917, 113879, 113885, 113651, 111919, 111921, 118394, 118395, 
				118396, 118397, 118398, 118399, 118400, 118401, 118402, 113847, 113848, 113849, 
				113855, 113856, 113857, 113858, 113859, 113860, 113861, 113862, 114156, 114157, 
				114165, 113912, 113707, 113708, 113738, 113739, 113737, 113740	 } , 
			[2] = {	111857, 111860, 111862, 113894, 113895, 113882, 113883, 113890, 113891, 113892, 
				114143, 114144, 114145, 114146, 114147, 114153, 114154, 114155, 114196, 114197, 
				114198, 114152, 114148, 114149, 114151 }	 }   --�a��C��A[1]��W�\�� 38�ءA[2]�a�����骫�� 25��
	local Q = { 	[1] = {} ,
			[2] = {}	} --�@���D��
	local A1 = {} --����EM_RoleValue_Register1
	local A2 = {} --����
	local Y = 0 --random�_�l��
	local Z = {} --��m
	local furniture = {}
	local BornQ = 0  -- 5 / 10 / 20 
	local BornA = 0 -- 3 / 5 / 5 
	if R == 7 then	
		BornQ = 12	
		BornA = 3
	elseif R == 8 then
		BornQ = 13
		BornA = 5
	elseif R == 9 then
		BornQ = 15
		BornA = 5
	end

	local X = {}
	for i = 0 , 19 do
		table.insert( X , i )
	end
	Say( Owner , "[SC_120993_SAY1]" ) -- �H�H�K�K�X�{�a�I�X�{�a�I�a��̥X�{�F��I
	WriteRoleValue( Target, EM_LuaValueFlag_UseItem40, Score + 1000 )
	local NewScore = ReadRoleValue( Target, EM_LuaValueFlag_UseItem40)
--	Debugmsg( Target, 0, NewScore)
--	WriteRoleValue( Owner , EM_RoleValue_Register1, 3 ) --Lylia����ܡA���ʥ��b�i�椤
	for i = 1 , BornQ do   -- ����10�Ӥ��ܰʪ��í�
		Y = DW_Rand(#X) --RAND�X�l�s��
		Z[i] = X[Y]
		table.remove(X,Y)
		local RanF = DW_Rand(100)	
		if RanF <= 60 then  --60% �X�{��W���~
			W = DW_Rand(#F[1])-- RAND�a��~��
			Q[1][i] = F[1][W]
			table.remove(F[1],W)
			furniture[i]= CreateObjByFlag( Q[1][i] , 781144, Z[i] ,1) 
		else
			W = DW_Rand(#F[2])-- RAND�a��~��
			Q[2][i] = F[2][W]
			table.remove(F[2],W)
			furniture[i]= CreateObjByFlag( Q[2][i] , 781146, Z[i] ,1) 
		end	
		SetModeEx( furniture[i] , EM_SetModeType_Gravity, false ) --���O
		SetModeEx( furniture[i] , EM_SetModeType_Move, false )--����
		SetModeEx( furniture[i] , EM_SetModeType_ShowRoleHead, true )--�Y����
		SetModeEx( furniture[i] , EM_SetModeType_NotShowHPMP, true )
		AddToPartition( furniture[i], RoomID )	--���ͳí�
		AddBuff( furniture[i] , 620015 , 0 , 20 )
		AddBuff(  furniture[i] , 624235 , 0, -1)
		WriteRoleValue( furniture[i] , EM_RoleValue_Register1 , 1 )
		local Reg = ReadRoleValue( furniture[i] , EM_RoleValue_Register1)
	--	SetPlot(furniture[i] , "Touch" , "Lua_funiture_touch_na" , 50 )
	end
	for i = 1 , BornA do   -- ����5�ӷ|�ܤƪ��a��
		Y = DW_Rand(#X) --RAND�X�l�s��
		Z[i] = X[Y]
		table.remove(X,Y)
		local RanF = DW_Rand(10)	
		if RanF <= 5 then  --�X�{��W���~
			W =DW_Rand(#F[1])-- RAND�a��~��
		--	A1[i] = F[1][W]
			furniture[i]= CreateObjByFlag( F[1][W], 781144, Z[i] ,1) 
			table.remove(F[1],W)
			table.insert( A1 , furniture[i])
		else
			W = DW_Rand(#F[2])-- RAND�a��~��
		--	A2[i] = F[2][W]
			furniture[i]= CreateObjByFlag(F[2][W], 781146, Z[i] ,1) 
			table.remove(F[2],W)
			table.insert( A2 , furniture[i])
		end	
		SetModeEx( furniture[i] , EM_SetModeType_Gravity, false ) --���O
		SetModeEx( furniture[i] , EM_SetModeType_Move, false )--����
		SetModeEx( furniture[i] , EM_SetModeType_ShowRoleHead, true )--�Y����
		SetModeEx( furniture[i] , EM_SetModeType_NotShowHPMP, true )
		AddToPartition( furniture[i], RoomID )	--���ͳí�
		AddBuff( furniture[i] , 620015 , 0 , 20 )
		AddBuff(  furniture[i] , 624235 , 0, -1)
		WriteRoleValue( furniture[i] , EM_RoleValue_Register1 , 1 ) --
		local Reg = ReadRoleValue( furniture[i] , EM_RoleValue_Register1)
	end		
	sleep(200)
	SysCastSpellLv(Owner, Target, 850201, 1 ) --�I��é���ޯ�
	Sleep(40)
--	DebugMsg( 0, 0 , "Change!" )
	Lua_na_funiture2_change(F, A1,A2)
	Sleep(10)
	ClockOpen(Target , EM_ClockCheckValue_29  , 31 , 31 , 0  ,"Lua_Clockending"  , "Lua_Clockending" );--�ɶ��H���
	AddBuff( Target , 622634 , 0, 30)
	ScriptMessage( Target ,Target , 2 ,  "[SC_120993_GAMETYPE2][$SETVAR1="..BornA.."] ", 0 )
	Lua_na_FindMistake_obj()
end



function Lua_na_funiture2_change(F, A1,A2) --�ܴ��~��
	local Owner = OwnerID()
	local Target = TargetID()
	local W = 0
--	DebugMsg( 0, 0 , "Change!2" )
	for i = 1 , #A1, 1 do --
		W = DW_Rand(#F[1])-- RAND�a��~��
		ChangeObjID( A1[i] , F[1][W])
		WriteRoleValue(A1[i] , EM_RoleValue_Register1 , 2 )	--�ୱ���a��AReg�g��2
		local Reg = ReadRoleValue(A1[i] , EM_RoleValue_Register1)
		BeginPlot(A1[i] , "Lua_na_showans", 0) -- �b�^�X�����ᵪ�ת�������ܯS��
		table.remove(F[1],W)
	--	say(ANSNPC1[i], "F1")
	end

	for i = 1 , #A2, 1  do --
		W = DW_Rand(#F[2])-- RAND�a��~��
		ChangeObjID( A2[i] , F[2][W])
		WriteRoleValue(  A2[i] , EM_RoleValue_Register1 , 2 )	--�a�����a��AReg�g��2
		local Reg = ReadRoleValue(A2[i] , EM_RoleValue_Register1)
		BeginPlot( A2[i]  , "Lua_na_showans", 0) -- �b�^�X�����ᵪ�ת�������ܯS��
		table.remove( F[2],W)
	end
end