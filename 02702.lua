function Lua_na_FindMistake_Q1()
	local Owner = OwnerID() --NPC
	local Target = ReadRoleValue( Owner, EM_RoleValue_Register10) --玩家
	local RoomID = ReadRoleValue( Target , EM_RoleValue_RoomID ) 
	local R = ReadRoleValue( Owner, EM_RoleValue_Register2) --回合
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

	local Y = 0 --random起始值
	local Z = {} --位置
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
	Say( Owner , "[SC_120993_SAY1]" ) -- 嘻嘻……出現吧！出現吧！家具們出現了唷！
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
		if RanF <= 5 then  --出現桌上物品
			W =DW_Rand(#F[1]) -- RAND家具外型
			furniture[i]= CreateObjByFlag( F[1][W] , 781144, Z[i] ,1) 	
			table.remove(F[1],W)	
		else
			W = DW_Rand(#F[2])-- 出現地面家具
			furniture[i]= CreateObjByFlag( F[2][W] , 781146, Z[i] ,1) 
			table.remove(F[2],W)
		end					
		SetModeEx( furniture[i] , EM_SetModeType_Gravity, false ) --重力
		SetModeEx( furniture[i] , EM_SetModeType_Move, false )--移動
		SetModeEx( furniture[i] , EM_SetModeType_ShowRoleHead, true )--頭像框
		SetModeEx( furniture[i] , EM_SetModeType_NotShowHPMP, true )
		AddToPartition( furniture[i], RoomID )	--產生傢俱
		AddBuff( furniture[i] , 620015 , 0 , 20 )
		AddBuff(  furniture[i] , 624235 , 0, -1 )
		WriteRoleValue( furniture[i] , EM_RoleValue_Register1 , 1 )--首先出現的15個家具將不會變動，將值寫為1
	end
	sleep(200)
	SysCastSpellLv(Owner, Target, 850201, 1 ) --施放矇眼技能
	Sleep(40)
	for i = 1 , BornNew do   -- 產生3個會改變的傢俱
		Y = DW_Rand(#X)
		Z[i] = X[Y]
		table.remove(X,Y)
		local RanF = DW_Rand(10)	
		if RanF <= 5 then --出現桌上物品
			W = DW_Rand(#F[1])-- RAND家具外型
			furniture[i]= CreateObjByFlag( F[1][W], 781144, Z[i] ,1) --
			table.remove(F[1],W)
    	
		else -- 出現地面物件
			W = DW_Rand(#F[2])-- RAND家具外型
			furniture[i]= CreateObjByFlag(F[2][W] , 781146, Z[i] ,1) --
			table.remove(F[2],W)
		end	
		SetModeEx( furniture[i] , EM_SetModeType_Gravity, false ) --重力
		SetModeEx( furniture[i] , EM_SetModeType_Move, false )--移動
	--	SetModeEx( furniture[i], EM_SetModeType_Mark, false )--標記
		SetModeEx( furniture[i] , EM_SetModeType_NotShowHPMP, true )
		SetModeEx( furniture[i] , EM_SetModeType_ShowRoleHead, true )--頭像框
		AddToPartition( furniture[i], RoomID )	--產生傢俱
		AddBuff(  furniture[i] , 624235 , 0, -1)
		WriteRoleValue( furniture[i] , EM_RoleValue_Register1, 2 ) --更動的家具，將值寫為2
		WriteRoleValue( furniture[i] , EM_RoleValue_Register10, Target ) --讓家具記住玩家		
		local Reg = ReadRoleValue( furniture[i] , EM_RoleValue_Register1)	
		BeginPlot( furniture[i]  , "Lua_na_showans", 0) 
	end
	sleep(10)
	ClockOpen(Target , EM_ClockCheckValue_29  , 31 , 31 , 0  ,"Lua_Clockending"  , "Lua_Clockending" );--時間以秒算
	AddBuff( Target , 622634 , 0, 30)
	ScriptMessage( Target ,Target , 2 , "[SC_120993_GAMETYPE1][$SETVAR1="..BornNew.."] ", 0 )
	Lua_na_FindMistake_obj()
end


function Lua_na_FindMistake_Qitem()
	local Owner = OwnerID()
	Sleep(340)
	SetModeEx( Owner, EM_SetModeType_Mark, true )--標記
	SetModeEx( Owner , EM_SetModeType_ShowRoleHead, true )--頭像框	
end