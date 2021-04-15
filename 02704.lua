function Lua_na_FindMistake_Q3()
	local Owner = OwnerID()
	local Target = ReadRoleValue( Owner, EM_RoleValue_Register10) --玩家
	local R = ReadRoleValue( Owner, EM_RoleValue_Register2) --回合
	local RoomID = ReadRoleValue( Target , EM_RoleValue_RoomID ) 
	local Score = ReadRoleValue( Target, EM_LuaValueFlag_UseItem40 )
	local F = {	[1] = { 	111915, 111916, 111917, 113879, 113885, 113651, 111919, 111921, 118394, 118395, 
				118396, 118397, 118398, 118399, 118400, 118401, 118402, 113847, 113848, 113849, 
				113855, 113856, 113857, 113858, 113859, 113860, 113861, 113862, 114156, 114157, 
				114165, 113912, 113707, 113708, 113738, 113739, 113737, 113740	 } , 
			[2] = {	111857, 111860, 111862, 113894, 113895, 113882, 113883, 113890, 113891, 113892, 
				114143, 114144, 114145, 114146, 114147, 114153, 114154, 114155, 114196, 114197, 
				114198, 114152, 114148, 114149, 114151 }	 }   --家具列表，[1]桌上擺飾 38種，[2]地面立體物件 25種
	local A = { 	[1] = {} ,
			[2] = {}	} 
	local Y = 0 --random起始值
	local Z = {} --位置
	local Z1 = {} --家具移動後的位置
	local furniture = {}
	local BornQ = 0  -- 5 / 10 / 20 
	local BornA = 0 -- 3 / 5 / 5 
	if R == 4 then	
		BornQ = 5 	
		BornA = 3
	elseif R == 5 then
		BornQ = 7
		BornA = 5
	elseif R == 6 then
		BornQ = 10
		BornA = 5
	end

	local X = {}
	for i = 0 , 19 do
		table.insert( X , i )
	end
	Say( Owner , "[SC_120993_SAY1]" ) -- 嘻嘻……出現吧！出現吧！家具們出現了唷！
	WriteRoleValue(Target, EM_LuaValueFlag_UseItem40, Score+1000 )
	local NewScore = ReadRoleValue( Target, EM_LuaValueFlag_UseItem40)
--	Debugmsg( Target, 0, NewScore)
	local Z1 = {} --家具之後變更的位置
	for i = 1 , BornQ do   -- 產生不變動的傢俱
		Y = DW_Rand(#X)--RAND旗子編號
		Z[i] = X[Y]
		table.remove(X,Y)
		local RanF = DW_Rand(100)	
		if RanF <= 60 then  --60% 出現桌上物品
			W = DW_Rand( #F[1]) -- RAND家具外型
			furniture[i]= CreateObjByFlag( F[1][W] , 781144, Z[i] ,1) 
			table.remove(F[1],W)
		else
			W = DW_Rand( #F[2]) -- RAND 家具外型(地面型，勾重力)
			furniture[i]= CreateObjByFlag( F[2][W] , 781146, Z[i] ,1) 
			table.remove(F[2],W)
		end	
		SetModeEx( furniture[i] , EM_SetModeType_Gravity, false ) --重力
		SetModeEx( furniture[i] , EM_SetModeType_Move, false )--移動
		SetModeEx( furniture[i] , EM_SetModeType_ShowRoleHead, true )--頭像框
		SetModeEx( furniture[i] , EM_SetModeType_NotShowHPMP, true )
		AddToPartition( furniture[i], RoomID )	--產生傢俱
		AddBuff( furniture[i] , 620015 , 0 , 20 )
		AddBuff(  furniture[i] , 624235 , 0, -1)
		WriteRoleValue( furniture[i] , EM_RoleValue_Register1 , 1 )--首先出現的20個不會變更的家具
		local Reg = ReadRoleValue( furniture[i] , EM_RoleValue_Register1)
	--	SetPlot(furniture[i] , "Touch" , "Lua_funiture_touch_na" , 50 )
	end
	
	for i = 1 , BornA do   -- 產生會變化的家具
		Y = DW_Rand(#X) --RAND旗子編號
		Z[i] = X[Y]
		table.remove(X,Y)
		local RanF = DW_Rand(10)		
		if RanF <= 5 then  --出現桌上物品	
			W = DW_Rand(#F[1]) -- RAND家具外型
			furniture[i]= CreateObjByFlag( F[1][W] , 781144, Z[i] ,1) 
			table.insert( A[1], furniture[i])
			table.remove(F[1],W)
		else
			W = DW_Rand(#F[2])   -- RAND 家具外型(地面型，勾重力)
			furniture[i]= CreateObjByFlag(  F[2][W] , 781146, Z[i] , 1) 
			table.insert( A[2], furniture[i])
			table.remove(F[2],W)
		end	
		SetModeEx( furniture[i], EM_SetModeType_Gravity, false ) --重力
		SetModeEx( furniture[i] , EM_SetModeType_Move, false )--移動
		SetModeEx( furniture[i] , EM_SetModeType_ShowRoleHead, true )--頭像框
		SetModeEx( furniture[i] , EM_SetModeType_NotShowHPMP, true )
		AddToPartition( furniture[i], RoomID )	--產生傢俱
		AddBuff( furniture[i] , 620015 , 0 , 20 )
		AddBuff(  furniture[i], 624235 , 0, -1)
		WriteRoleValue( furniture[i] , EM_RoleValue_Register1 , 1 ) --
		local Reg = ReadRoleValue( furniture[i] , EM_RoleValue_Register1)
	end	

	sleep(200)
	SysCastSpellLv(Owner, Target, 850201, 1 ) --施放矇眼技能
	Sleep(30)
	Lua_na_funiture2_move( X, A, RoomID)
	Sleep(20)
	ClockOpen(Target , EM_ClockCheckValue_29  , 31 , 31 , 0  ,"Lua_Clockending"  , "Lua_Clockending" );--時間以秒算
	AddBuff( Target , 622634 , 0, 30)
	ScriptMessage( Target ,Target , 2 ,  "[SC_120993_GAMETYPE3][$SETVAR1="..BornA.."] ", 0 )
	Lua_na_FindMistake_obj()
end



--改變位置
function Lua_na_funiture2_move( X, A, RoomID)  --
	local Owner = OwnerID()
	local Target = TargetID()
	local ANSNPC = {}
	local Z1 = {}
--變換位置後再產生
	for i = 1 ,#A[1] do
		Y = DW_Rand(#X) 
		Z1[i] = X[Y]
		table.remove(X,Y)
		local OrgID = ReadRoleValue(A[1][i], EM_RoleValue_OrgID)
		ANSNPC[i] = CreateObjByFlag( OrgID , 781144 , Z1[i] , 1)
		Say( ANSNPC[i] , i )
		SetModeEx( ANSNPC[i], EM_SetModeType_Gravity, false ) --重力
		SetModeEx( ANSNPC[i], EM_SetModeType_Move, false )--移動
		SetModeEx( ANSNPC[i], EM_SetModeType_ShowRoleHead, true )--頭像框
		SetModeEx( ANSNPC[i] , EM_SetModeType_NotShowHPMP, true )
		AddToPartition(  ANSNPC[i] , RoomID )	--產生傢俱
		AddBuff( ANSNPC[i] , 624235 , 0, -1)
		WriteRoleValue( ANSNPC[i] , EM_RoleValue_Register1 , 2 )
		local Reg = ReadRoleValue( ANSNPC[i] , EM_RoleValue_Register1)
		BeginPlot( ANSNPC[i] , "Lua_na_showans", 0) -- 在回合結束後答案的物件顯示特效
	end
--	debugmsg( 0, 0, "123456789")
	for i = 1 ,#A[2] do 
		Y = DW_Rand(#X) 
		Z1[i] = X[Y]
		table.remove(X,Y)
		local OrgID = ReadRoleValue(A[2][i], EM_RoleValue_OrgID)
		ANSNPC[i] = CreateObjByFlag( OrgID , 781146 , Z1[i] , 1)
		Say( ANSNPC[i] , i )
		SetModeEx( ANSNPC[i], EM_SetModeType_Gravity, false ) --重力
		SetModeEx( ANSNPC[i], EM_SetModeType_Move, false )--移動
		SetModeEx( ANSNPC[i] , EM_SetModeType_ShowRoleHead, true )--頭像框
		SetModeEx( ANSNPC[i] , EM_SetModeType_NotShowHPMP, true )
		AddToPartition(  ANSNPC[i] , RoomID )	--產生傢俱
		AddBuff( ANSNPC[i] , 624235 , 0, -1)
		WriteRoleValue( ANSNPC[i] , EM_RoleValue_Register1 , 2 )--
		local Reg = ReadRoleValue( ANSNPC[i] , EM_RoleValue_Register1)
		BeginPlot( ANSNPC[i] , "Lua_na_showans", 0) -- 在回合結束後答案的物件顯示特效
	end
--	debugmsg( 0, 0, "987654321")
---把題目的家具刪除
	for i = 1 , #A[1], 1 do --
		DelObj( A[1][i] )
	end
	for i = 1 , #A[2], 1 do --
		DelObj(A[2][i] )
	end
end