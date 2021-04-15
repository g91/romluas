-------------------Ice Blade Plat--Easy---Janebug------------------------------------------------------------------------------------------------------
-- Ice Blade  none LuaS_Discowood_Callfunction_UnArmed  and LuaYU_JaneBug_01  0 , 0 
function LuaYU_JaneBug_01()
   -- buff not correct??? 
	AddBuff( OwnerID() ,501306 ,1 , 4 ); 

end

function LuaS_janebug_UnArmed()
	local Motion = {}
	Motion[1] = ruFUSION_ACTORSTATE_SHIELD_BASH
	Motion[2] = ruFUSION_ACTORSTATE_ATTACK_UNARMED
	Motion[3] = ruFUSION_ACTORSTATE_ATTACK_UNARMED_SP
	Motion[4] = ruFUSION_ACTORSTATE_SP_SPINKICK
	
	if ReadRoleValue(OwnerID() , EM_RoleValue_AttackTargetID) ~= 0 then
		SetIdleMotion( OwnerID(),ruFUSION_ACTORSTATE_NORMAL)
		return false
	else
		math.randomseed(math.random(10000, 99999))
		local ran = math.random(1,4)
		PlayMotion( OwnerID(), Motion[ran] )
		return true
	end
end

-------------------------------------------------------------Janebug----------------------------------
-- Ice Blade Transducer 4
function Lua_Janebug20()

	local dis = 13  -- array spacing
	local count = 4 -- The size of the array, input 3 will be a 3*3 array; but because the number of rows must be an odd number, input 4 will be a 5*4 array.
	local checktime = 10 -- The time interval of judgment, the lower the value, the higher the frequency of judgment, the more natural, but the more resources it consumes
	local ReviveTime = 600000  -- When all the objects in the array disappear, the array will be reset. If -1 is filled in, it will be reset according to the rebirth time set by OwnerID()
	local circle = 6000  -- How many cycles are completely respawned once? If 0 is filled in, the rebirth will only occur when all objects disappear
	local Matrix = LuaFunc_Matrix_Maker( dis , count )  -- Create a table and use LuaFunc_CreateNPCByMatrix(ObjID,Matrix,A,B) to generate objects where you want to generate objects. The four numbers represent in sequence 1. The ID of the object to be generated 2. The array used as a reference 3. The column position 4. The row position
	
	local SkillRND =  Rand( 100 )+1	--
	if SkillRND <= 100 and SkillRND > 80 then
		checktime = checktime + 1
	elseif SkillRND <= 80 and SkillRND > 60 then
		checktime = checktime + 2		
	elseif SkillRND <= 60 and SkillRND > 40 then
		checktime = checktime + 3
	elseif SkillRND <= 40 and SkillRND > 20 then
		checktime = checktime + 4
	elseif SkillRND <= 20 and SkillRND > 0 then
		checktime = checktime + 5
	end	
	
	local ObjMatrix ={}
	
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(109208,Matrix,1,-1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(109208,Matrix,1,1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(109208,Matrix,2,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(109208,Matrix,2,1)

	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_Janebug21" , 0 )
end

function Lua_Janebug21()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_Janebug20" , 0 )
end


-------------------------------------------------------------Janebug----------------------------------
-- Ice Blade Guard 4
function Lua_Janebug22()

	local dis = 13  -- array spacing
	local count = 5 -- The size of the array, input 3 will be a 3*3 array; but because the number of rows must be an odd number, input 4 will be a 5*4 array.
	local checktime = 10 -- The time interval of judgment, the lower the value, the higher the frequency of judgment, the more natural, but the more resources it consumes
	local ReviveTime = 600000  -- When all the objects in the array disappear, the array will be reset. If -1 is filled in, it will be reset according to the rebirth time set by OwnerID()
	local circle = 6000  -- How many cycles are completely respawned once? If 0 is filled in, the rebirth will only occur when all objects disappear
	local Matrix = LuaFunc_Matrix_Maker( dis , count )  -- Create a table and use LuaFunc_CreateNPCByMatrix(ObjID,Matrix,A,B) to generate objects where you want to generate objects. The four numbers represent in sequence 1. The ID of the object to be generated 2. The array used as a reference 3. The column position 4. The row position
	
	local SkillRND =  Rand( 100 )+1	-- 
	if SkillRND <= 100 and SkillRND > 80 then
		checktime = checktime + 1
	elseif SkillRND <= 80 and SkillRND > 60 then
		checktime = checktime + 2		
	elseif SkillRND <= 60 and SkillRND > 40 then
		checktime = checktime + 3
	elseif SkillRND <= 40 and SkillRND > 20 then
		checktime = checktime + 4
	elseif SkillRND <= 20 and SkillRND > 0 then
		checktime = checktime + 5
	end	
	
	local ObjMatrix ={}
	
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(109206,Matrix,1,-1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(109206,Matrix,1,1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(109206,Matrix,2,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(109206,Matrix,2,1)

	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_Janebug23" , 0 )
end

function Lua_Janebug23()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_Janebug22" , 0 )
end

-------------------------------------------------------------Janebug----------------------------------
-- Battle Boar of the Wrathiful eye 2
function Lua_Janebug24()

	local dis = 13  -- array spacing
	local count = 5 -- The size of the array, input 3 will be a 3*3 array; but because the number of rows must be an odd number, input 4 will be a 5*4 array.
	local checktime = 10 -- The time interval of judgment, the lower the value, the higher the frequency of judgment, the more natural, but the more resources it consumes
	local ReviveTime = 600000  -- When all the objects in the array disappear, the array will be reset. If -1 is filled in, it will be reset according to the rebirth time set by OwnerID()
	local circle = 6000  -- How many cycles are completely respawned once? If 0 is filled in, the rebirth will only occur when all objects disappear
	local Matrix = LuaFunc_Matrix_Maker( dis , count )  -- Create a table and use LuaFunc_CreateNPCByMatrix(ObjID,Matrix,A,B) to generate objects where you want to generate objects. The four numbers represent in sequence 1. The ID of the object to be generated 2. The array used as a reference 3. The column position 4. The row position
	
	local SkillRND =  Rand( 100 )+1	-- 
	if SkillRND <= 100 and SkillRND > 80 then
		checktime = checktime + 1
	elseif SkillRND <= 80 and SkillRND > 60 then
		checktime = checktime + 2		
	elseif SkillRND <= 60 and SkillRND > 40 then
		checktime = checktime + 3
	elseif SkillRND <= 40 and SkillRND > 20 then
		checktime = checktime + 4
	elseif SkillRND <= 20 and SkillRND > 0 then
		checktime = checktime + 5
	end	
	
	local ObjMatrix ={}
	
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(109214,Matrix,1,-1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(109214,Matrix,1,2)

	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_Janebug25" , 0 )
end

function Lua_Janebug25()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_Janebug24" , 0 )
end

-------------------------------------------------------------Janebug----------------------------------
-- Guard of the Wrathiful Eye 4

function Lua_Janebug26()

	local dis = 15  -- array spacing
	local count = 5 -- The size of the array, input 3 will be a 3*3 array; but because the number of rows must be an odd number, input 4 will be a 5*4 array.
	local checktime = 10 -- The time interval of judgment, the lower the value, the higher the frequency of judgment, the more natural, but the more resources it consumes
	local ReviveTime = 600000  -- When all the objects in the array disappear, the array will be reset. If -1 is filled in, it will be reset according to the rebirth time set by OwnerID()
	local circle = 6000  -- How many cycles are completely respawned once? If 0 is filled in, the rebirth will only occur when all objects disappear
	local Matrix = LuaFunc_Matrix_Maker( dis , count )  -- Create a table and use LuaFunc_CreateNPCByMatrix(ObjID,Matrix,A,B) to generate objects where you want to generate objects. The four numbers represent in sequence 1. The ID of the object to be generated 2. The array used as a reference 3. The column position 4. The row position
	
	local SkillRND =  Rand( 100 )+1	-- 
	if SkillRND <= 100 and SkillRND > 80 then
		checktime = checktime + 1
	elseif SkillRND <= 80 and SkillRND > 60 then
		checktime = checktime + 2		
	elseif SkillRND <= 60 and SkillRND > 40 then
		checktime = checktime + 3
	elseif SkillRND <= 40 and SkillRND > 20 then
		checktime = checktime + 4
	elseif SkillRND <= 20 and SkillRND > 0 then
		checktime = checktime + 5
	end	
	
	local ObjMatrix ={}
	
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(109213,Matrix,1,-1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(109213,Matrix,1,1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(109213,Matrix,2,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(109213,Matrix,2,1)

	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_Janebug27" , 0 )
end

function Lua_Janebug27()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_Janebug26" , 0 )
end

-------------------------------------------------------------Janebug----------------------------------
-- Ice Blade Guard 1
function Lua_Janebug28()

	local dis = 8
	local count = 2
	local checktime = 8
	local circle = 0
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 

	local ObjMatrix ={}
	--ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(109217,Matrix,1,-1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(109206,Matrix,1,1)
	for i=1,table.getn(ObjMatrix),1 do
		WriteRoleValue(ObjMatrix[i],EM_RoleValue_IsWalk,1)
	end
	sleep(20)
	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle )
end

-------------------------------------------------------------Janebug----------------------------------
-- Ice Blade Guard 2 Ice blade Tranducer 2
function Lua_Janebug30()

	local dis = 13  -- array spacing
	local count = 5 -- The size of the array, input 3 will be a 3*3 array; but because the number of rows must be an odd number, input 4 will be a 5*4 array.
	local checktime = 10 -- The time interval of judgment, the lower the value, the higher the frequency of judgment, the more natural, but the more resources it consumes
	local ReviveTime = 600000  -- When all the objects in the array disappear, the array will be reset. If -1 is filled in, it will be reset according to the rebirth time set by OwnerID()
	local circle = 6000  -- How many cycles are completely respawned once? If 0 is filled in, the rebirth will only occur when all objects disappear
	local Matrix = LuaFunc_Matrix_Maker( dis , count )  -- Create a table and use LuaFunc_CreateNPCByMatrix(ObjID,Matrix,A,B) to generate objects where you want to generate objects. The four numbers represent in sequence 1. The ID of the object to be generated 2. The array used as a reference 3. The column position 4. The row position
	
	local SkillRND =  Rand( 100 )+1	--
	if SkillRND <= 100 and SkillRND > 80 then
		checktime = checktime + 1
	elseif SkillRND <= 80 and SkillRND > 60 then
		checktime = checktime + 2		
	elseif SkillRND <= 60 and SkillRND > 40 then
		checktime = checktime + 3
	elseif SkillRND <= 40 and SkillRND > 20 then
		checktime = checktime + 4
	elseif SkillRND <= 20 and SkillRND > 0 then
		checktime = checktime + 5
	end	
	
	local ObjMatrix ={}
	
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(109206,Matrix,1,-1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(109208,Matrix,1,1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(109206,Matrix,2,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(109208,Matrix,2,1)

	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_Janebug31" , 0 )
end

function Lua_Janebug31()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_Janebug30" , 0 )
end

-------------------------------------------------------------Janebug----------------------------------
-- Iron Guard of the choas alter 2 Shaman of the Altar 2
function Lua_Janebug32()

	local dis = 20  -- array spacing
	local count = 4 -- The size of the array, input 3 will be a 3*3 array; but because the number of rows must be an odd number, input 4 will be a 5*4 array.
	local checktime = 10 -- The time interval of judgment, the lower the value, the higher the frequency of judgment, the more natural, but the more resources it consumes
	local ReviveTime = 600000  -- When all the objects in the array disappear, the array will be reset. If -1 is filled in, it will be reset according to the rebirth time set by OwnerID()
	local circle = 6000  -- How many cycles are completely respawned once? If 0 is filled in, the rebirth will only occur when all objects disappear
	local Matrix = LuaFunc_Matrix_Maker( dis , count )  -- Create a table and use LuaFunc_CreateNPCByMatrix(ObjID,Matrix,A,B) to generate objects where you want to generate objects. The four numbers represent in sequence 1. The ID of the object to be generated 2. The array used as a reference 3. The column position 4. The row position
	
	local SkillRND =  Rand( 100 )+1	--
	if SkillRND <= 100 and SkillRND > 80 then
		checktime = checktime + 1
	elseif SkillRND <= 80 and SkillRND > 60 then
		checktime = checktime + 2		
	elseif SkillRND <= 60 and SkillRND > 40 then
		checktime = checktime + 3
	elseif SkillRND <= 40 and SkillRND > 20 then
		checktime = checktime + 4
	elseif SkillRND <= 20 and SkillRND > 0 then
		checktime = checktime + 5
	end	
	
	local ObjMatrix ={}
	
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(109216,Matrix,1,-1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(109216,Matrix,1,1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(109215,Matrix,2,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(109215,Matrix,2,1)

	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_Janebug33" , 0 )
end

function Lua_Janebug33()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_Janebug32" , 0 )
end

-------------------------------------------------------------Janebug----------------------------------
-- 
function LuaI_JaneFollow_1()

	local dis = 8
	local count = 2
	local checktime = 8
	local circle = 0
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 

	local ObjMatrix ={}
	--ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(109217,Matrix,1,-1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(109216,Matrix,1,1)
	for i=1,table.getn(ObjMatrix),1 do
		WriteRoleValue(ObjMatrix[i],EM_RoleValue_IsWalk,1)
	end
	sleep(20)
	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle )
end


-- ---------------------Ice Blade Plat--Normal
-- ---------------------Ice Blade Plat--Normal
-- ---------------------Ice Blade Plat--Normal
-- ---------------------Ice Blade Plat--Normal
-- ---------------------Ice Blade Plat--Normal
-- ---------------------Ice Blade Plat--Normal
-- ---------------------Ice Blade Plat--Normal
-- ---------------------Ice Blade Plat--Normal
-----------------------------Ice Blade Plat--Normal---Janebug------------------------------------------------------------------------------------------------------
-- Ice Blade   LuaS_Discowood_Callfunction_UnArmed  and LuaYU_JaneBug_01  0 , 0 
function LuaYU_JaneBug_02()
   -- buff not correct??? 
	AddBuff( OwnerID() ,501306 ,1 , 4 ); 

end

function LuaS_janebug_UnArmed()
	local Motion = {}
	Motion[1] = ruFUSION_ACTORSTATE_SHIELD_BASH
	Motion[2] = ruFUSION_ACTORSTATE_ATTACK_UNARMED
	Motion[3] = ruFUSION_ACTORSTATE_ATTACK_UNARMED_SP
	Motion[4] = ruFUSION_ACTORSTATE_SP_SPINKICK
	
	if ReadRoleValue(OwnerID() , EM_RoleValue_AttackTargetID) ~= 0 then
		SetIdleMotion( OwnerID(),ruFUSION_ACTORSTATE_NORMAL)
		return false
	else
		math.randomseed(math.random(10000, 99999))
		local ran = math.random(1,4)
		PlayMotion( OwnerID(), Motion[ran] )
		return true
	end
end

---------------------------------------------------------------Janebug----------------------------------
-- Ice Blade Transducer 4
function Lua_Janebug34()

	local dis = 13  -- array spacing
	local count = 4 -- The size of the array, input 3 will be a 3*3 array; but because the number of rows must be an odd number, input 4 will be a 5*4 array.
	local checktime = 10 -- The time interval of judgment, the lower the value, the higher the frequency of judgment, the more natural, but the more resources it consumes
	local ReviveTime = 600000  -- When all the objects in the array disappear, the array will be reset. If -1 is filled in, it will be reset according to the rebirth time set by OwnerID()
	local circle = 6000  -- How many cycles are completely respawned once? If 0 is filled in, the rebirth will only occur when all objects disappear
	local Matrix = LuaFunc_Matrix_Maker( dis , count )  -- Create a table and use LuaFunc_CreateNPCByMatrix(ObjID,Matrix,A,B) to generate objects where you want to generate objects. The four numbers represent in sequence 1. The ID of the object to be generated 2. The array used as a reference 3. The column position 4. The row position
	
	local SkillRND =  Rand( 100 )+1	--
	if SkillRND <= 100 and SkillRND > 80 then
		checktime = checktime + 1
	elseif SkillRND <= 80 and SkillRND > 60 then
		checktime = checktime + 2		
	elseif SkillRND <= 60 and SkillRND > 40 then
		checktime = checktime + 3
	elseif SkillRND <= 40 and SkillRND > 20 then
		checktime = checktime + 4
	elseif SkillRND <= 20 and SkillRND > 0 then
		checktime = checktime + 5
	end	
	
	local ObjMatrix ={}
	
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(109166,Matrix,1,-1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(109166,Matrix,1,1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(109166,Matrix,2,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(109166,Matrix,2,1)

	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_Janebug35" , 0 )
end

function Lua_Janebug35()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_Janebug34" , 0 )
end


-------------------------------------------------------------Janebug----------------------------------
-- Ice Blade Guard 4
function Lua_Janebug36()

	local dis = 13  -- array spacing
	local count = 5 -- The size of the array, input 3 will be a 3*3 array; but because the number of rows must be an odd number, input 4 will be a 5*4 array.
	local checktime = 10 -- The time interval of judgment, the lower the value, the higher the frequency of judgment, the more natural, but the more resources it consumes
	local ReviveTime = 600000  -- When all the objects in the array disappear, the array will be reset. If -1 is filled in, it will be reset according to the rebirth time set by OwnerID()
	local circle = 6000  -- How many cycles are completely respawned once? If 0 is filled in, the rebirth will only occur when all objects disappear
	local Matrix = LuaFunc_Matrix_Maker( dis , count )  -- Create a table and use LuaFunc_CreateNPCByMatrix(ObjID,Matrix,A,B) to generate objects where you want to generate objects. The four numbers represent in sequence 1. The ID of the object to be generated 2. The array used as a reference 3. The column position 4. The row position
	
	local SkillRND =  Rand( 100 )+1	-- 
	if SkillRND <= 100 and SkillRND > 80 then
		checktime = checktime + 1
	elseif SkillRND <= 80 and SkillRND > 60 then
		checktime = checktime + 2		
	elseif SkillRND <= 60 and SkillRND > 40 then
		checktime = checktime + 3
	elseif SkillRND <= 40 and SkillRND > 20 then
		checktime = checktime + 4
	elseif SkillRND <= 20 and SkillRND > 0 then
		checktime = checktime + 5
	end	
	
	local ObjMatrix ={}
	
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(109159,Matrix,1,-1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(109159,Matrix,1,1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(109159,Matrix,2,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(109159,Matrix,2,1)

	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_Janebug37" , 0 )
end

function Lua_Janebug37()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_Janebug36" , 0 )
end

-------------------------------------------------------------Janebug----------------------------------
-- Battle Boar of the Wrathiful eye 2
function Lua_Janebug38()

	local dis = 13  -- array spacing
	local count = 5 -- The size of the array, input 3 will be a 3*3 array; but because the number of rows must be an odd number, input 4 will be a 5*4 array.
	local checktime = 10 -- The time interval of judgment, the lower the value, the higher the frequency of judgment, the more natural, but the more resources it consumes
	local ReviveTime = 600000  -- When all the objects in the array disappear, the array will be reset. If -1 is filled in, it will be reset according to the rebirth time set by OwnerID()
	local circle = 6000  -- How many cycles are completely respawned once? If 0 is filled in, the rebirth will only occur when all objects disappear
	local Matrix = LuaFunc_Matrix_Maker( dis , count )  -- Create a table and use LuaFunc_CreateNPCByMatrix(ObjID,Matrix,A,B) to generate objects where you want to generate objects. The four numbers represent in sequence 1. The ID of the object to be generated 2. The array used as a reference 3. The column position 4. The row position
	
	local SkillRND =  Rand( 100 )+1	-- 
	if SkillRND <= 100 and SkillRND > 80 then
		checktime = checktime + 1
	elseif SkillRND <= 80 and SkillRND > 60 then
		checktime = checktime + 2		
	elseif SkillRND <= 60 and SkillRND > 40 then
		checktime = checktime + 3
	elseif SkillRND <= 40 and SkillRND > 20 then
		checktime = checktime + 4
	elseif SkillRND <= 20 and SkillRND > 0 then
		checktime = checktime + 5
	end	
	
	local ObjMatrix ={}
	
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(109172,Matrix,1,-1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(109172,Matrix,1,2)

	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_Janebug39" , 0 )
end

function Lua_Janebug39()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_Janebug38" , 0 )
end

-------------------------------------------------------------Janebug----------------------------------
-- Guard of the Wrathiful Eye 4

function Lua_Janebug40()

	local dis = 15  -- array spacing
	local count = 5 -- The size of the array, input 3 will be a 3*3 array; but because the number of rows must be an odd number, input 4 will be a 5*4 array.
	local checktime = 10 -- The time interval of judgment, the lower the value, the higher the frequency of judgment, the more natural, but the more resources it consumes
	local ReviveTime = 600000  -- When all the objects in the array disappear, the array will be reset. If -1 is filled in, it will be reset according to the rebirth time set by OwnerID()
	local circle = 6000  -- How many cycles are completely respawned once? If 0 is filled in, the rebirth will only occur when all objects disappear
	local Matrix = LuaFunc_Matrix_Maker( dis , count )  -- Create a table and use LuaFunc_CreateNPCByMatrix(ObjID,Matrix,A,B) to generate objects where you want to generate objects. The four numbers represent in sequence 1. The ID of the object to be generated 2. The array used as a reference 3. The column position 4. The row position
	
	local SkillRND =  Rand( 100 )+1	-- 
	if SkillRND <= 100 and SkillRND > 80 then
		checktime = checktime + 1
	elseif SkillRND <= 80 and SkillRND > 60 then
		checktime = checktime + 2		
	elseif SkillRND <= 60 and SkillRND > 40 then
		checktime = checktime + 3
	elseif SkillRND <= 40 and SkillRND > 20 then
		checktime = checktime + 4
	elseif SkillRND <= 20 and SkillRND > 0 then
		checktime = checktime + 5
	end	
	
	local ObjMatrix ={}
	
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(109171,Matrix,1,-1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(109171,Matrix,1,1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(109171,Matrix,2,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(109171,Matrix,2,1)

	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_Janebug41" , 0 )
end

function Lua_Janebug41()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_Janebug40" , 0 )
end

-------------------------------------------------------------Janebug----------------------------------
-- Ice Blade Guard 1
function Lua_Janebug42()

	local dis = 8
	local count = 2
	local checktime = 8
	local circle = 0
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 

	local ObjMatrix ={}
	--ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(109180,Matrix,1,-1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(109159,Matrix,1,1)
	for i=1,table.getn(ObjMatrix),1 do
		WriteRoleValue(ObjMatrix[i],EM_RoleValue_IsWalk,1)
	end
	sleep(20)
	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle )
end

-------------------------------------------------------------Janebug----------------------------------
-- Ice Blade Guard 2 Ice blade Tranducer 2
function Lua_Janebug43()

	local dis = 13  -- array spacing
	local count = 5 -- The size of the array, input 3 will be a 3*3 array; but because the number of rows must be an odd number, input 4 will be a 5*4 array.
	local checktime = 10 -- The time interval of judgment, the lower the value, the higher the frequency of judgment, the more natural, but the more resources it consumes
	local ReviveTime = 600000  -- When all the objects in the array disappear, the array will be reset. If -1 is filled in, it will be reset according to the rebirth time set by OwnerID()
	local circle = 6000  -- How many cycles are completely respawned once? If 0 is filled in, the rebirth will only occur when all objects disappear
	local Matrix = LuaFunc_Matrix_Maker( dis , count )  -- Create a table and use LuaFunc_CreateNPCByMatrix(ObjID,Matrix,A,B) to generate objects where you want to generate objects. The four numbers represent in sequence 1. The ID of the object to be generated 2. The array used as a reference 3. The column position 4. The row position
	
	local SkillRND =  Rand( 100 )+1	--
	if SkillRND <= 100 and SkillRND > 80 then
		checktime = checktime + 1
	elseif SkillRND <= 80 and SkillRND > 60 then
		checktime = checktime + 2		
	elseif SkillRND <= 60 and SkillRND > 40 then
		checktime = checktime + 3
	elseif SkillRND <= 40 and SkillRND > 20 then
		checktime = checktime + 4
	elseif SkillRND <= 20 and SkillRND > 0 then
		checktime = checktime + 5
	end	
	
	local ObjMatrix ={}
	
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(109159,Matrix,1,-1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(109166,Matrix,1,1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(109159,Matrix,2,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(109166,Matrix,2,1)

	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_Janebug44" , 0 )
end

function Lua_Janebug44()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_Janebug43" , 0 )
end

-------------------------------------------------------------Janebug----------------------------------
-- Iron Guard of the choas alter 2 Shaman of the Altar 2
function Lua_Janebug45()

	local dis = 20  -- array spacing
	local count = 4 -- The size of the array, input 3 will be a 3*3 array; but because the number of rows must be an odd number, input 4 will be a 5*4 array.
	local checktime = 10 -- The time interval of judgment, the lower the value, the higher the frequency of judgment, the more natural, but the more resources it consumes
	local ReviveTime = 600000  -- When all the objects in the array disappear, the array will be reset. If -1 is filled in, it will be reset according to the rebirth time set by OwnerID()
	local circle = 6000  -- How many cycles are completely respawned once? If 0 is filled in, the rebirth will only occur when all objects disappear
	local Matrix = LuaFunc_Matrix_Maker( dis , count )  -- Create a table and use LuaFunc_CreateNPCByMatrix(ObjID,Matrix,A,B) to generate objects where you want to generate objects. The four numbers represent in sequence 1. The ID of the object to be generated 2. The array used as a reference 3. The column position 4. The row position
	
	local SkillRND =  Rand( 100 )+1	--
	if SkillRND <= 100 and SkillRND > 80 then
		checktime = checktime + 1
	elseif SkillRND <= 80 and SkillRND > 60 then
		checktime = checktime + 2		
	elseif SkillRND <= 60 and SkillRND > 40 then
		checktime = checktime + 3
	elseif SkillRND <= 40 and SkillRND > 20 then
		checktime = checktime + 4
	elseif SkillRND <= 20 and SkillRND > 0 then
		checktime = checktime + 5
	end	
	
	local ObjMatrix ={}
	
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(109174,Matrix,1,-1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(109174,Matrix,1,1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(109173,Matrix,2,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(109173,Matrix,2,1)

	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_Janebug46" , 0 )
end

function Lua_Janebug46()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_Janebug45" , 0 )
end

-------------------------------------------------------------Janebug----------------------------------
-- Behru of the Chaos Altar 
function LuaI_JaneFollow_2()

	local dis = 8
	local count = 2
	local checktime = 8
	local circle = 0
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 

	local ObjMatrix ={}
	--ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(109180,Matrix,1,-1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(109174,Matrix,1,1)
	for i=1,table.getn(ObjMatrix),1 do
		WriteRoleValue(ObjMatrix[i],EM_RoleValue_IsWalk,1)
	end
	sleep(20)
	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle )
end


-- ---------------------Ice Blade Plat--Hard
-- ---------------------Ice Blade Plat--Hard
-- ---------------------Ice Blade Plat--Hard
-- ---------------------Ice Blade Plat--Hard
-- ---------------------Ice Blade Plat--Hard
-- ---------------------Ice Blade Plat--Hard
-------------------------Ice Blade Plat--Hard---Janebug------------------------------------------------------------------------------------------------------



-- I can not start my Ice Blade Plateau  #181 so if you have it then you will have to add them your self ... 
-- or kindly tell me how it loads a map so i can fix mine.....