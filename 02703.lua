function Lua_na_FindMistake_Q2()
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
	local Q = { 	[1] = {} ,
			[2] = {}	} --作為題目
	local A1 = {} --答案EM_RoleValue_Register1
	local A2 = {} --答案
	local Y = 0 --random起始值
	local Z = {} --位置
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
	Say( Owner , "[SC_120993_SAY1]" ) -- 嘻嘻……出現吧！出現吧！家具們出現了唷！
	WriteRoleValue( Target, EM_LuaValueFlag_UseItem40, Score + 1000 )
	local NewScore = ReadRoleValue( Target, EM_LuaValueFlag_UseItem40)
--	Debugmsg( Target, 0, NewScore)
--	WriteRoleValue( Owner , EM_RoleValue_Register1, 3 ) --Lylia的對話，活動正在進行中
	for i = 1 , BornQ do   -- 產生10個不變動的傢俱
		Y = DW_Rand(#X) --RAND旗子編號
		Z[i] = X[Y]
		table.remove(X,Y)
		local RanF = DW_Rand(100)	
		if RanF <= 60 then  --60% 出現桌上物品
			W = DW_Rand(#F[1])-- RAND家具外型
			Q[1][i] = F[1][W]
			table.remove(F[1],W)
			furniture[i]= CreateObjByFlag( Q[1][i] , 781144, Z[i] ,1) 
		else
			W = DW_Rand(#F[2])-- RAND家具外型
			Q[2][i] = F[2][W]
			table.remove(F[2],W)
			furniture[i]= CreateObjByFlag( Q[2][i] , 781146, Z[i] ,1) 
		end	
		SetModeEx( furniture[i] , EM_SetModeType_Gravity, false ) --重力
		SetModeEx( furniture[i] , EM_SetModeType_Move, false )--移動
		SetModeEx( furniture[i] , EM_SetModeType_ShowRoleHead, true )--頭像框
		SetModeEx( furniture[i] , EM_SetModeType_NotShowHPMP, true )
		AddToPartition( furniture[i], RoomID )	--產生傢俱
		AddBuff( furniture[i] , 620015 , 0 , 20 )
		AddBuff(  furniture[i] , 624235 , 0, -1)
		WriteRoleValue( furniture[i] , EM_RoleValue_Register1 , 1 )
		local Reg = ReadRoleValue( furniture[i] , EM_RoleValue_Register1)
	--	SetPlot(furniture[i] , "Touch" , "Lua_funiture_touch_na" , 50 )
	end
	for i = 1 , BornA do   -- 產生5個會變化的家具
		Y = DW_Rand(#X) --RAND旗子編號
		Z[i] = X[Y]
		table.remove(X,Y)
		local RanF = DW_Rand(10)	
		if RanF <= 5 then  --出現桌上物品
			W =DW_Rand(#F[1])-- RAND家具外型
		--	A1[i] = F[1][W]
			furniture[i]= CreateObjByFlag( F[1][W], 781144, Z[i] ,1) 
			table.remove(F[1],W)
			table.insert( A1 , furniture[i])
		else
			W = DW_Rand(#F[2])-- RAND家具外型
		--	A2[i] = F[2][W]
			furniture[i]= CreateObjByFlag(F[2][W], 781146, Z[i] ,1) 
			table.remove(F[2],W)
			table.insert( A2 , furniture[i])
		end	
		SetModeEx( furniture[i] , EM_SetModeType_Gravity, false ) --重力
		SetModeEx( furniture[i] , EM_SetModeType_Move, false )--移動
		SetModeEx( furniture[i] , EM_SetModeType_ShowRoleHead, true )--頭像框
		SetModeEx( furniture[i] , EM_SetModeType_NotShowHPMP, true )
		AddToPartition( furniture[i], RoomID )	--產生傢俱
		AddBuff( furniture[i] , 620015 , 0 , 20 )
		AddBuff(  furniture[i] , 624235 , 0, -1)
		WriteRoleValue( furniture[i] , EM_RoleValue_Register1 , 1 ) --
		local Reg = ReadRoleValue( furniture[i] , EM_RoleValue_Register1)
	end		
	sleep(200)
	SysCastSpellLv(Owner, Target, 850201, 1 ) --施放矇眼技能
	Sleep(40)
--	DebugMsg( 0, 0 , "Change!" )
	Lua_na_funiture2_change(F, A1,A2)
	Sleep(10)
	ClockOpen(Target , EM_ClockCheckValue_29  , 31 , 31 , 0  ,"Lua_Clockending"  , "Lua_Clockending" );--時間以秒算
	AddBuff( Target , 622634 , 0, 30)
	ScriptMessage( Target ,Target , 2 ,  "[SC_120993_GAMETYPE2][$SETVAR1="..BornA.."] ", 0 )
	Lua_na_FindMistake_obj()
end



function Lua_na_funiture2_change(F, A1,A2) --變換外型
	local Owner = OwnerID()
	local Target = TargetID()
	local W = 0
--	DebugMsg( 0, 0 , "Change!2" )
	for i = 1 , #A1, 1 do --
		W = DW_Rand(#F[1])-- RAND家具外型
		ChangeObjID( A1[i] , F[1][W])
		WriteRoleValue(A1[i] , EM_RoleValue_Register1 , 2 )	--桌面型家具，Reg寫為2
		local Reg = ReadRoleValue(A1[i] , EM_RoleValue_Register1)
		BeginPlot(A1[i] , "Lua_na_showans", 0) -- 在回合結束後答案的物件顯示特效
		table.remove(F[1],W)
	--	say(ANSNPC1[i], "F1")
	end

	for i = 1 , #A2, 1  do --
		W = DW_Rand(#F[2])-- RAND家具外型
		ChangeObjID( A2[i] , F[2][W])
		WriteRoleValue(  A2[i] , EM_RoleValue_Register1 , 2 )	--地面型家具，Reg寫為2
		local Reg = ReadRoleValue(A2[i] , EM_RoleValue_Register1)
		BeginPlot( A2[i]  , "Lua_na_showans", 0) -- 在回合結束後答案的物件顯示特效
		table.remove( F[2],W)
	end
end