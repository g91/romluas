-------------------------------New Pantheon Easy-----Janebug------------------------------------------------------------------------------------------------------
-- 2 Temple Naga Assassin 2 Temple Naga Patrol
function Lua_Janebug96()

	local dis = 25  -- array spacing
	local count = 3 -- The size of the array, input 3 will be a 3*3 array; but because the number of rows must be an odd number, input 4 will be a 5*4 array.
	local checktime = 10 -- The time interval of judgment, the lower the value, the higher the frequency of judgment, the more natural, but the more resources it consumes
	local ReviveTime = 600000  -- When all the objects in the array disappear, the array will be reset. If -1 is filled in, it will be reset according to the rebirth time set by OwnerID()
	local circle = 6000  -- How many cycles are completely respawned once? If 0 is filled in, the rebirth will only occur when all objects disappear
	local Matrix = LuaFunc_Matrix_Maker( dis , count )  -- Create a table and use LuaFunc_CreateNPCByMatrix(ObjID,Matrix,A,B) to generate objects where you want to generate objects. The four numbers represent in sequence 1. The ID of the object to be generated 2. The array used as a reference 3. The column position 4. The row position
	
	local SkillRND =  Rand( 100 )+2	--
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
		
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(109796,Matrix,2,-1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(109796,Matrix,2,1)
	
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(109792,Matrix,3,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(109792,Matrix,3,1)

	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_Janebug97" , 0 )
end

function Lua_Janebug97()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_Janebug96" , 0 )
end

-------------------------------------------------------------Janebug----------------------------------
-- 2 Temple Supply Naga  2 Temple Naga Mage
function Lua_Janebug98()

	local dis = 25  -- array spacing
	local count = 3 -- The size of the array, input 3 will be a 3*3 array; but because the number of rows must be an odd number, input 4 will be a 5*4 array.
	local checktime = 4 -- The time interval of judgment, the lower the value, the higher the frequency of judgment, the more natural, but the more resources it consumes
	local ReviveTime = 600000  -- When all the objects in the array disappear, the array will be reset. If -1 is filled in, it will be reset according to the rebirth time set by OwnerID()
	local circle = 6000  -- How many cycles are completely respawned once? If 0 is filled in, the rebirth will only occur when all objects disappear
	local Matrix = LuaFunc_Matrix_Maker( dis , count )  -- Create a table and use LuaFunc_CreateNPCByMatrix(ObjID,Matrix,A,B) to generate objects where you want to generate objects. The four numbers represent in sequence 1. The ID of the object to be generated 2. The array used as a reference 3. The column position 4. The row position
	
	local SkillRND =  Rand( 100 )+2	--
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
		
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(109797,Matrix,2,-1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(109797,Matrix,2,1)
	
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(109793,Matrix,3,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(109793,Matrix,3,1)

	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_Janebug99" , 0 )
end

function Lua_Janebug99()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_Janebug98" , 0 )
end

-------------------------------------------------------------Janebug----------------------------------
-- 2 New Pantheon Demon Soldier

function Lua_Janebug100()

	local dis = 25  -- array spacing
	local count = 3 -- The size of the array, input 3 will be a 3*3 array; but because the number of rows must be an odd number, input 4 will be a 5*4 array.
	local checktime = 4 -- The time interval of judgment, the lower the value, the higher the frequency of judgment, the more natural, but the more resources it consumes
	local ReviveTime = 600000  -- When all the objects in the array disappear, the array will be reset. If -1 is filled in, it will be reset according to the rebirth time set by OwnerID()
	local circle = 6000  -- How many cycles are completely respawned once? If 0 is filled in, the rebirth will only occur when all objects disappear
	local Matrix = LuaFunc_Matrix_Maker( dis , count )  -- Create a table and use LuaFunc_CreateNPCByMatrix(ObjID,Matrix,A,B) to generate objects where you want to generate objects. The four numbers represent in sequence 1. The ID of the object to be generated 2. The array used as a reference 3. The column position 4. The row position
	
	local SkillRND =  Rand( 100 )+2	--
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
		
	--ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(109797,Matrix,2,-1)
	--ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(109797,Matrix,2,1)
	
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(109798,Matrix,3,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(109798,Matrix,3,1)

	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_Janebug101" , 0 )
end

function Lua_Janebug101()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_Janebug100" , 0 )
end

-------------------------------------------------------------Janebug----------------------------------
-- 2 New Pantheon Researcher 2 New Pantheon Guardsman

function Lua_Janebug102()

	local dis = 15  -- array spacing
	local count = 3 -- The size of the array, input 3 will be a 3*3 array; but because the number of rows must be an odd number, input 4 will be a 5*4 array.
	local checktime = 4 -- The time interval of judgment, the lower the value, the higher the frequency of judgment, the more natural, but the more resources it consumes
	local ReviveTime = 600000  -- When all the objects in the array disappear, the array will be reset. If -1 is filled in, it will be reset according to the rebirth time set by OwnerID()
	local circle = 6000  -- How many cycles are completely respawned once? If 0 is filled in, the rebirth will only occur when all objects disappear
	local Matrix = LuaFunc_Matrix_Maker( dis , count )  -- Create a table and use LuaFunc_CreateNPCByMatrix(ObjID,Matrix,A,B) to generate objects where you want to generate objects. The four numbers represent in sequence 1. The ID of the object to be generated 2. The array used as a reference 3. The column position 4. The row position
	
	local SkillRND =  Rand( 100 )+2	--
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
		
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(109805,Matrix,2,-1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(109805,Matrix,2,1)
	
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(109802,Matrix,3,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(109802,Matrix,3,1)

	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_Janebug103" , 0 )
end

function Lua_Janebug103()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_Janebug102" , 0 )
end

-------------------------------New Pantheon Normal-----Janebug------------------------------------------------------------------------------------------------------
-- 2 Temple Naga Assassin 2 Temple Naga Patrol
function Lua_Janebug104()

	local dis = 25  -- array spacing
	local count = 3 -- The size of the array, input 3 will be a 3*3 array; but because the number of rows must be an odd number, input 4 will be a 5*4 array.
	local checktime = 10 -- The time interval of judgment, the lower the value, the higher the frequency of judgment, the more natural, but the more resources it consumes
	local ReviveTime = 600000  -- When all the objects in the array disappear, the array will be reset. If -1 is filled in, it will be reset according to the rebirth time set by OwnerID()
	local circle = 6000  -- How many cycles are completely respawned once? If 0 is filled in, the rebirth will only occur when all objects disappear
	local Matrix = LuaFunc_Matrix_Maker( dis , count )  -- Create a table and use LuaFunc_CreateNPCByMatrix(ObjID,Matrix,A,B) to generate objects where you want to generate objects. The four numbers represent in sequence 1. The ID of the object to be generated 2. The array used as a reference 3. The column position 4. The row position
	
	local SkillRND =  Rand( 100 )+2	--
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
		
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(109781,Matrix,2,-1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(109781,Matrix,2,1)
	
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(109777,Matrix,3,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(109777,Matrix,3,1)

	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_Janebug105" , 0 )
end

function Lua_Janebug105()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_Janebug104" , 0 )
end

-------------------------------------------------------------Janebug----------------------------------
-- 2 Temple Supply Naga  2 Temple Naga Mage
function Lua_Janebug106()

	local dis = 25  -- array spacing
	local count = 3 -- The size of the array, input 3 will be a 3*3 array; but because the number of rows must be an odd number, input 4 will be a 5*4 array.
	local checktime = 4 -- The time interval of judgment, the lower the value, the higher the frequency of judgment, the more natural, but the more resources it consumes
	local ReviveTime = 600000  -- When all the objects in the array disappear, the array will be reset. If -1 is filled in, it will be reset according to the rebirth time set by OwnerID()
	local circle = 6000  -- How many cycles are completely respawned once? If 0 is filled in, the rebirth will only occur when all objects disappear
	local Matrix = LuaFunc_Matrix_Maker( dis , count )  -- Create a table and use LuaFunc_CreateNPCByMatrix(ObjID,Matrix,A,B) to generate objects where you want to generate objects. The four numbers represent in sequence 1. The ID of the object to be generated 2. The array used as a reference 3. The column position 4. The row position
	
	local SkillRND =  Rand( 100 )+2	--
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
		
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(109782,Matrix,2,-1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(109782,Matrix,2,1)
	
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(109778,Matrix,3,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(109778,Matrix,3,1)

	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_Janebug107" , 0 )
end

function Lua_Janebug107()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_Janebug106" , 0 )
end

-------------------------------------------------------------Janebug----------------------------------
-- 2 New Pantheon Demon Soldier

function Lua_Janebug108()

	local dis = 25  -- array spacing
	local count = 3 -- The size of the array, input 3 will be a 3*3 array; but because the number of rows must be an odd number, input 4 will be a 5*4 array.
	local checktime = 4 -- The time interval of judgment, the lower the value, the higher the frequency of judgment, the more natural, but the more resources it consumes
	local ReviveTime = 600000  -- When all the objects in the array disappear, the array will be reset. If -1 is filled in, it will be reset according to the rebirth time set by OwnerID()
	local circle = 6000  -- How many cycles are completely respawned once? If 0 is filled in, the rebirth will only occur when all objects disappear
	local Matrix = LuaFunc_Matrix_Maker( dis , count )  -- Create a table and use LuaFunc_CreateNPCByMatrix(ObjID,Matrix,A,B) to generate objects where you want to generate objects. The four numbers represent in sequence 1. The ID of the object to be generated 2. The array used as a reference 3. The column position 4. The row position
	
	local SkillRND =  Rand( 100 )+2	--
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
			
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(109783,Matrix,3,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(109783,Matrix,3,1)

	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_Janebug109" , 0 )
end

function Lua_Janebug109()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_Janebug108" , 0 )
end

-------------------------------------------------------------Janebug----------------------------------
-- 2 New Pantheon Researcher 2 New Pantheon Guardsman

function Lua_Janebug110()

	local dis = 15  -- array spacing
	local count = 3 -- The size of the array, input 3 will be a 3*3 array; but because the number of rows must be an odd number, input 4 will be a 5*4 array.
	local checktime = 4 -- The time interval of judgment, the lower the value, the higher the frequency of judgment, the more natural, but the more resources it consumes
	local ReviveTime = 600000  -- When all the objects in the array disappear, the array will be reset. If -1 is filled in, it will be reset according to the rebirth time set by OwnerID()
	local circle = 6000  -- How many cycles are completely respawned once? If 0 is filled in, the rebirth will only occur when all objects disappear
	local Matrix = LuaFunc_Matrix_Maker( dis , count )  -- Create a table and use LuaFunc_CreateNPCByMatrix(ObjID,Matrix,A,B) to generate objects where you want to generate objects. The four numbers represent in sequence 1. The ID of the object to be generated 2. The array used as a reference 3. The column position 4. The row position
	
	local SkillRND =  Rand( 100 )+2	--
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
		
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(109787,Matrix,2,-1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(109787,Matrix,2,1)
	
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(109790,Matrix,3,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(109790,Matrix,3,1)

	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_Janebug111" , 0 )
end

function Lua_Janebug111()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_Janebug110" , 0 )
end

-------------------------------New Pantheon Hard-----Janebug------------------------------------------------------------------------------------------------------
-- 2 Temple Naga Assassin 2 Temple Naga Patrol
function Lua_Janebug112()

	local dis = 25  -- array spacing
	local count = 3 -- The size of the array, input 3 will be a 3*3 array; but because the number of rows must be an odd number, input 4 will be a 5*4 array.
	local checktime = 10 -- The time interval of judgment, the lower the value, the higher the frequency of judgment, the more natural, but the more resources it consumes
	local ReviveTime = 600000  -- When all the objects in the array disappear, the array will be reset. If -1 is filled in, it will be reset according to the rebirth time set by OwnerID()
	local circle = 6000  -- How many cycles are completely respawned once? If 0 is filled in, the rebirth will only occur when all objects disappear
	local Matrix = LuaFunc_Matrix_Maker( dis , count )  -- Create a table and use LuaFunc_CreateNPCByMatrix(ObjID,Matrix,A,B) to generate objects where you want to generate objects. The four numbers represent in sequence 1. The ID of the object to be generated 2. The array used as a reference 3. The column position 4. The row position
	
	local SkillRND =  Rand( 100 )+2	--
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
		
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(109766,Matrix,2,-1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(109766,Matrix,2,1)
	
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(109762,Matrix,3,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(109762,Matrix,3,1)

	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_Janebug113" , 0 )
end

function Lua_Janebug113()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_Janebug112" , 0 )
end

-------------------------------------------------------------Janebug----------------------------------
-- 2 Temple Supply Naga  2 Temple Naga Mage
function Lua_Janebug114()

	local dis = 25  -- array spacing
	local count = 3 -- The size of the array, input 3 will be a 3*3 array; but because the number of rows must be an odd number, input 4 will be a 5*4 array.
	local checktime = 4 -- The time interval of judgment, the lower the value, the higher the frequency of judgment, the more natural, but the more resources it consumes
	local ReviveTime = 600000  -- When all the objects in the array disappear, the array will be reset. If -1 is filled in, it will be reset according to the rebirth time set by OwnerID()
	local circle = 6000  -- How many cycles are completely respawned once? If 0 is filled in, the rebirth will only occur when all objects disappear
	local Matrix = LuaFunc_Matrix_Maker( dis , count )  -- Create a table and use LuaFunc_CreateNPCByMatrix(ObjID,Matrix,A,B) to generate objects where you want to generate objects. The four numbers represent in sequence 1. The ID of the object to be generated 2. The array used as a reference 3. The column position 4. The row position
	
	local SkillRND =  Rand( 100 )+2	--
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
		
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(109767,Matrix,2,-1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(109767,Matrix,2,1)
	
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(109763,Matrix,3,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(109763,Matrix,3,1)

	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_Janebug115" , 0 )
end

function Lua_Janebug115()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_Janebug114" , 0 )
end

-------------------------------------------------------------Janebug----------------------------------
-- 2 New Pantheon Demon Soldier

function Lua_Janebug116()

	local dis = 25  -- array spacing
	local count = 3 -- The size of the array, input 3 will be a 3*3 array; but because the number of rows must be an odd number, input 4 will be a 5*4 array.
	local checktime = 4 -- The time interval of judgment, the lower the value, the higher the frequency of judgment, the more natural, but the more resources it consumes
	local ReviveTime = 600000  -- When all the objects in the array disappear, the array will be reset. If -1 is filled in, it will be reset according to the rebirth time set by OwnerID()
	local circle = 6000  -- How many cycles are completely respawned once? If 0 is filled in, the rebirth will only occur when all objects disappear
	local Matrix = LuaFunc_Matrix_Maker( dis , count )  -- Create a table and use LuaFunc_CreateNPCByMatrix(ObjID,Matrix,A,B) to generate objects where you want to generate objects. The four numbers represent in sequence 1. The ID of the object to be generated 2. The array used as a reference 3. The column position 4. The row position
	
	local SkillRND =  Rand( 100 )+2	--
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
			
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(109768,Matrix,3,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(109768,Matrix,3,1)

	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_Janebug117" , 0 )
end

function Lua_Janebug117()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_Janebug116" , 0 )
end

-------------------------------------------------------------Janebug----------------------------------
-- 2 New Pantheon Researcher 2 New Pantheon Guardsman

function Lua_Janebug118()

	local dis = 15  -- array spacing
	local count = 3 -- The size of the array, input 3 will be a 3*3 array; but because the number of rows must be an odd number, input 4 will be a 5*4 array.
	local checktime = 4 -- The time interval of judgment, the lower the value, the higher the frequency of judgment, the more natural, but the more resources it consumes
	local ReviveTime = 600000  -- When all the objects in the array disappear, the array will be reset. If -1 is filled in, it will be reset according to the rebirth time set by OwnerID()
	local circle = 6000  -- How many cycles are completely respawned once? If 0 is filled in, the rebirth will only occur when all objects disappear
	local Matrix = LuaFunc_Matrix_Maker( dis , count )  -- Create a table and use LuaFunc_CreateNPCByMatrix(ObjID,Matrix,A,B) to generate objects where you want to generate objects. The four numbers represent in sequence 1. The ID of the object to be generated 2. The array used as a reference 3. The column position 4. The row position
	
	local SkillRND =  Rand( 100 )+2	--
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
		
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(109775,Matrix,2,-1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(109775,Matrix,2,1)
	
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(109772,Matrix,3,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(109772,Matrix,3,1)

	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_Janebug119" , 0 )
end

function Lua_Janebug119()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_Janebug118" , 0 )
end

-------------------------------------------------------------Janebug----------------------------------









