function Lua_na_FindMistake_Q1()
	local Owner = OwnerID() --NPC
	local Target = ReadRoleValue( Owner, EM_RoleValue_Register10) --���a
	local RoomID = ReadRoleValue( Target , EM_RoleValue_RoomID ) 
	local R = ReadRoleValue( Owner, EM_RoleValue_Register2) --�^�X
	local Score = ReadRoleValue( Target, EM_LuaValueFlag_UseItem40 )
	local F = {	[1] = { 	111915, 111916, 111917, 113879, 113885, 113651, 111919, 111921, 118394, 118395, 
				118396, 118397, 118398, 118399, 118400, 118401, 118402, 113847, 113848, 113849, 
				113855, 113856, 113857, 113858, 113859, 113860, 113861, 113862, 114156, 114157, 
				114165, 113912, 113707, 113708, 113738, 113739, 113737, 113740	 } , 
			[2] = {	111857, 111860, 111862, 113894, 113895, 113882, 113883, 113890, 113891, 113892, 
				114143, 114144, 114145, 114146, 114147, 114153, 114154, 114155, 114196, 114197, 
				114198, 114152, 114148, 114149, 114151 }	 }   --�a��C���A[1]��W�\�� 38�ءA[2]�a�����骫�� 25��
	local Q = { 	[1] = {} ,
			[2] = {}	} --�@���D��

	local Y = 0 --random�_�l��
	local Z = {} --��m
	local furniture = {}
	local BornOld = 0  -- 5 / 10 / 20 
	local BornNew = 0 -- 3 / 5 / 5 
	if R == 1 then	
		BornOld = 5 	
		BornNew = 3
	elseif R == 2 then
		BornOld = 7
		BornNew = 5
	elseif R == 3 then
		BornOld = 10
		BornNew = 5
	else
		DebugMsg( 0, 0 , "WRONG")
	end
	local X = {}
	for i = 0 , 19 do
		table.insert( X , i )
	end
	Say( Owner , "[SC_120993_SAY1]" ) -- �H�H�K�K�X�{�a�I�X�{�a�I�a��̥X�{�F��I
--	if R ~= 1 then
		WriteRoleValue( Target, EM_LuaValueFlag_UseItem40, Score + 1000 )
		local NewScore = ReadRoleValue(Target, EM_LuaValueFlag_UseItem40)
	--	Debugmsg( Target, 0, NewScore)
--	end
	for i = 1 , BornOld, 1 do 
		Y =  DW_Rand(#X) --  
		Z[i] = X[Y]
		table.remove(X,Y)
		local RanF = DW_Rand(10)	
		if RanF <= 5 then  --�X�{��W���~
			W =DW_Rand(#F[1]) -- RAND�a��~��
			furniture[i]= CreateObjByFlag( F[1][W] , 781144, Z[i] ,1) 	
			table.remove(F[1],W)	
		else
			W = DW_Rand(#F[2])-- �X�{�a���a��
			furniture[i]= CreateObjByFlag( F[2][W] , 781146, Z[i] ,1) 
			table.remove(F[2],W)
		end					
		SetModeEx( furniture[i] , EM_SetModeType_Gravity, false ) --���O
		SetModeEx( furniture[i] , EM_SetModeType_Move, false )--����
		SetModeEx( furniture[i] , EM_SetModeType_ShowRoleHead, true )--�Y����
		SetModeEx( furniture[i] , EM_SetModeType_NotShowHPMP, true )
		AddToPartition( furniture[i], RoomID )	--���ͳí�
		AddBuff( furniture[i] , 620015 , 0 , 20 )
		AddBuff(  furniture[i] , 624235 , 0, -1 )
		WriteRoleValue( furniture[i] , EM_RoleValue_Register1 , 1 )--�����X�{��15�Ӯa��N���|�ܰʡA�N�ȼg��1
	end
	sleep(200)
	SysCastSpellLv(Owner, Target, 850201, 1 ) --�I��é���ޯ�
	Sleep(40)
	for i = 1 , BornNew do   -- ����3�ӷ|���ܪ��í�
		Y = DW_Rand(#X)
		Z[i] = X[Y]
		table.remove(X,Y)
		local RanF = DW_Rand(10)	
		if RanF <= 5 then --�X�{��W���~
			W = DW_Rand(#F[1])-- RAND�a��~��
			furniture[i]= CreateObjByFlag( F[1][W], 781144, Z[i] ,1) --
			table.remove(F[1],W)
    	
		else -- �X�{�a������
			W = DW_Rand(#F[2])-- RAND�a��~��
			furniture[i]= CreateObjByFlag(F[2][W] , 781146, Z[i] ,1) --
			table.remove(F[2],W)
		end	
		SetModeEx( furniture[i] , EM_SetModeType_Gravity, false ) --���O
		SetModeEx( furniture[i] , EM_SetModeType_Move, false )--����
	--	SetModeEx( furniture[i], EM_SetModeType_Mark, false )--�аO
		SetModeEx( furniture[i] , EM_SetModeType_NotShowHPMP, true )
		SetModeEx( furniture[i] , EM_SetModeType_ShowRoleHead, true )--�Y����
		AddToPartition( furniture[i], RoomID )	--���ͳí�
		AddBuff(  furniture[i] , 624235 , 0, -1)
		WriteRoleValue( furniture[i] , EM_RoleValue_Register1, 2 ) --��ʪ��a��A�N�ȼg��2
		WriteRoleValue( furniture[i] , EM_RoleValue_Register10, Target ) --���a��O�����a		
		local Reg = ReadRoleValue( furniture[i] , EM_RoleValue_Register1)	
		BeginPlot( furniture[i]  , "Lua_na_showans", 0) 
	end
	sleep(10)
	ClockOpen(Target , EM_ClockCheckValue_29  , 31 , 31 , 0  ,"Lua_Clockending"  , "Lua_Clockending" );--�ɶ��H����
	AddBuff( Target , 622634 , 0, 30)
	ScriptMessage( Target ,Target , 2 , "[SC_120993_GAMETYPE1][$SETVAR1="..BornNew.."] ", 0 )
	Lua_na_FindMistake_obj()
end


function Lua_na_FindMistake_Qitem()
	local Owner = OwnerID()
	Sleep(340)
	SetModeEx( Owner, EM_SetModeType_Mark, true )--�аO
	SetModeEx( Owner , EM_SetModeType_ShowRoleHead, true )--�Y����	
end