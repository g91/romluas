------------------------------------Sun Temple Easy-----------------Janebug----------------------------------
-- 4 Sun Temple Combat Mage
function Lua_Janebug150()

	local dis = 15  -- array spacing
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(109531,Matrix,1,1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(109531,Matrix,1,-1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(109531,Matrix,3,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(109531,Matrix,3,1)

	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_Janebug151" , 0 )
end

function Lua_Janebug151()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_Janebug150" , 0 )
end

-------------------------------------------------------------Janebug----------------------------------
-- 4 Sun Temple Guardian
function Lua_Janebug152()

	local dis = 15  -- array spacing
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(109532,Matrix,1,1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(109532,Matrix,1,-1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(109532,Matrix,3,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(109532,Matrix,3,1)

	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_Janebug153" , 0 )
end

function Lua_Janebug153()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_Janebug152" , 0 )
end

-------------------------------------------------------------Janebug----------------------------------
--  2 Mutated Angren Warrior
function Lua_Janebug154()

	local dis = 15  -- array spacing
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(109535,Matrix,1,1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(109535,Matrix,1,-1)

	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_Janebug155" , 0 )
end

function Lua_Janebug155()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_Janebug154" , 0 )
end

-------------------------------------------------------------Janebug----------------------------------
-- 2 Mutated Angren Warrior 2 Mutated Angren Hunter
function Lua_Janebug156()

	local dis = 15  -- array spacing
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(109535,Matrix,1,1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(109536,Matrix,1,-1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(109535,Matrix,3,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(109536,Matrix,3,1)

	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_Janebug157" , 0 )
end

function Lua_Janebug157()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_Janebug156" , 0 )
end

-------------------------------------------------------------Janebug----------------------------------
-- 2 Sun Temple Guardian 2 Sun Temple Combat Mage
function Lua_Janebug158()

	local dis = 15  -- array spacing
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(109531,Matrix,1,1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(109531,Matrix,1,-1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(109532,Matrix,3,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(109532,Matrix,3,1)

	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_Janebug159" , 0 )
end

function Lua_Janebug159()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_Janebug158" , 0 )
end

-------------------------------------------------------------Janebug----------------------------------
--  2 Mutated Jyr'na Guard
function Lua_Janebug160()

	local dis = 15  -- array spacing
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(109541,Matrix,1,1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(109541,Matrix,1,-1)

	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_Janebug161" , 0 )
end

function Lua_Janebug161()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_Janebug160" , 0 )
end

-------------------------------------------------------------Janebug----------------------------------
-- 2 Mutated Jyr'na Druid  2 Mutated Entling
function Lua_Janebug162()

	local dis = 15  -- array spacing
	local count = 3 -- The size of the array, input 3 will be a 3*3 array; but because the number of rows must be an odd number, input 4 will be a 5*4 array.
	local checktime = 12 -- The time interval of judgment, the lower the value, the higher the frequency of judgment, the more natural, but the more resources it consumes
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(109539,Matrix,1,1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(109539,Matrix,1,-1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(109538,Matrix,3,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(109538,Matrix,3,1)

	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_Janebug163" , 0 )
end

function Lua_Janebug163()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_Janebug162" , 0 )
end

-------------------------------------------------------------Janebug----------------------------------
-- 2 Mutated Jyr'na Guard  2 Mutated Jyr'na Scout
function Lua_Janebug164()

	local dis = 15  -- array spacing
	local count = 3 -- The size of the array, input 3 will be a 3*3 array; but because the number of rows must be an odd number, input 4 will be a 5*4 array.
	local checktime = 12 -- The time interval of judgment, the lower the value, the higher the frequency of judgment, the more natural, but the more resources it consumes
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(109540,Matrix,1,1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(109540,Matrix,1,-1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(109541,Matrix,3,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(109541,Matrix,3,1)

	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_Janebug165" , 0 )
end

function Lua_Janebug165()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_Janebug164" , 0 )
end



--
--
--------------------------------------Sun Temple Normal
--------------------------------------Sun Temple Normal
--------------------------------------Sun Temple Normal
--------------------------------------Sun Temple Normal
--------------------------------------Sun Temple Normal
--
--
--------------------------------------Sun Temple Normal --------------------------Janebug----------------------------------
-- 4 Sun Temple Combat Mage
function Lua_Janebug166()

	local dis = 15  -- array spacing
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(109516,Matrix,1,1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(109516,Matrix,1,-1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(109516,Matrix,3,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(109516,Matrix,3,1)

	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_Janebug167" , 0 )
end

function Lua_Janebug167()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_Janebug166" , 0 )
end

-------------------------------------------------------------Janebug----------------------------------
-- 4 Sun Temple Guardian
function Lua_Janebug168()

	local dis = 15  -- array spacing
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(109517,Matrix,1,1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(109517,Matrix,1,-1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(109517,Matrix,3,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(109517,Matrix,3,1)

	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_Janebug169" , 0 )
end

function Lua_Janebug169()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_Janebug168" , 0 )
end

-------------------------------------------------------------Janebug----------------------------------
--  2 Mutated Angren warrior
function Lua_Janebug170()

	local dis = 15  -- array spacing
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(109520,Matrix,1,1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(109520,Matrix,1,-1)

	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_Janebug171" , 0 )
end

function Lua_Janebug171()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_Janebug170" , 0 )
end

-------------------------------------------------------------Janebug----------------------------------
-- 2 Mutated Angren Warrior 2 Mutated Angren Hunter
function Lua_Janebug172()

	local dis = 15  -- array spacing
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(109521,Matrix,1,1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(109520,Matrix,1,-1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(109521,Matrix,3,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(109520,Matrix,3,1)

	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_Janebug173" , 0 )
end

function Lua_Janebug173()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_Janebug172" , 0 )
end

-------------------------------------------------------------Janebug----------------------------------
-- 2 Sun Temple Guardian 2 Sun Temple Combat Mage
function Lua_Janebug174()

	local dis = 15  -- array spacing
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(109517,Matrix,1,1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(109517,Matrix,1,-1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(109516,Matrix,3,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(109516,Matrix,3,1)

	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_Janebug175" , 0 )
end

function Lua_Janebug175()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_Janebug174" , 0 )
end

-------------------------------------------------------------Janebug----------------------------------
--  2 Mutated Jyr'na Guard
function Lua_Janebug176()

	local dis = 15  -- array spacing
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(109526,Matrix,1,1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(109526,Matrix,1,-1)

	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_Janebug177" , 0 )
end

function Lua_Janebug177()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_Janebug176" , 0 )
end

-------------------------------------------------------------Janebug----------------------------------
-- 2 Mutated Jyr'na Druid  2 Mutated Entling
function Lua_Janebug178()

	local dis = 15  -- array spacing
	local count = 3 -- The size of the array, input 3 will be a 3*3 array; but because the number of rows must be an odd number, input 4 will be a 5*4 array.
	local checktime = 12 -- The time interval of judgment, the lower the value, the higher the frequency of judgment, the more natural, but the more resources it consumes
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(109524,Matrix,1,1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(109524,Matrix,1,-1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(109523,Matrix,3,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(109523,Matrix,3,1)

	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_Janebug179" , 0 )
end

function Lua_Janebug179()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_Janebug178" , 0 )
end

-------------------------------------------------------------Janebug----------------------------------
-- 2 Mutated Jyr'na Guard  2 Mutated Jyr'na Scout
function Lua_Janebug180()

	local dis = 15  -- array spacing
	local count = 3 -- The size of the array, input 3 will be a 3*3 array; but because the number of rows must be an odd number, input 4 will be a 5*4 array.
	local checktime = 12 -- The time interval of judgment, the lower the value, the higher the frequency of judgment, the more natural, but the more resources it consumes
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(109526,Matrix,1,1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(109526,Matrix,1,-1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(109525,Matrix,3,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(109525,Matrix,3,1)

	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_Janebug181" , 0 )
end

function Lua_Janebug181()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_Janebug180" , 0 )
end





--
--
--------------------------------------Sun Temple Hard
--------------------------------------Sun Temple Hard
--------------------------------------Sun Temple Hard
--------------------------------------Sun Temple Hard
--------------------------------------Sun Temple Hard
--
--
--------------------------------------Sun Temple Hard --------------------------Janebug----------------------------------
-- 4 Sun Temple Combat Mage
function Lua_Janebug182()

	local dis = 15  -- array spacing
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(109501,Matrix,1,1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(109501,Matrix,1,-1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(109501,Matrix,3,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(109501,Matrix,3,1)

	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_Janebug183" , 0 )
end

function Lua_Janebug183()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_Janebug182" , 0 )
end

-------------------------------------------------------------Janebug----------------------------------
-- 4 Sun Temple Guardian
function Lua_Janebug184()

	local dis = 15  -- array spacing
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(109502,Matrix,1,1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(109502,Matrix,1,-1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(109502,Matrix,3,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(109502,Matrix,3,1)

	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_Janebug185" , 0 )
end

function Lua_Janebug185()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_Janebug184" , 0 )
end

-------------------------------------------------------------Janebug----------------------------------
--  2 Mutated Angren warrior
function Lua_Janebug186()

	local dis = 15  -- array spacing
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(109505,Matrix,1,1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(109505,Matrix,1,-1)

	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_Janebug187" , 0 )
end

function Lua_Janebug187()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_Janebug186" , 0 )
end

-------------------------------------------------------------Janebug----------------------------------
-- 2 Mutated Angren Warrior 2 Mutated Angren Hunter
function Lua_Janebug188()

	local dis = 15  -- array spacing
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(109505,Matrix,1,1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(109505,Matrix,1,-1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(109506,Matrix,3,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(109506,Matrix,3,1)

	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_Janebug189" , 0 )
end

function Lua_Janebug189()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_Janebug188" , 0 )
end

-------------------------------------------------------------Janebug----------------------------------
-- 2 Sun Temple Guardian 2 Sun Temple Combat Mage
function Lua_Janebug190()

	local dis = 15  -- array spacing
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(109502,Matrix,1,1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(109502,Matrix,1,-1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(109501,Matrix,3,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(109501,Matrix,3,1)

	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_Janebug191" , 0 )
end

function Lua_Janebug191()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_Janebug190" , 0 )
end

-------------------------------------------------------------Janebug----------------------------------
--  2 Mutated Jyr'na Guard
function Lua_Janebug192()

	local dis = 15  -- array spacing
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(109511,Matrix,1,1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(109511,Matrix,1,-1)

	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_Janebug193" , 0 )
end

function Lua_Janebug193()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_Janebug192" , 0 )
end

-------------------------------------------------------------Janebug----------------------------------
-- 2 Mutated Jyr'na Druid  2 Mutated Entling
function Lua_Janebug194()

	local dis = 15  -- array spacing
	local count = 3 -- The size of the array, input 3 will be a 3*3 array; but because the number of rows must be an odd number, input 4 will be a 5*4 array.
	local checktime = 12 -- The time interval of judgment, the lower the value, the higher the frequency of judgment, the more natural, but the more resources it consumes
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(109509,Matrix,1,1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(109509,Matrix,1,-1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(109508,Matrix,3,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(109508,Matrix,3,1)

	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_Janebug195" , 0 )
end

function Lua_Janebug195()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_Janebug194" , 0 )
end

-------------------------------------------------------------Janebug----------------------------------
-- 2 Mutated Jyr'na Guard  2 Mutated Jyr'na Scout
function Lua_Janebug196()

	local dis = 15  -- array spacing
	local count = 3 -- The size of the array, input 3 will be a 3*3 array; but because the number of rows must be an odd number, input 4 will be a 5*4 array.
	local checktime = 12 -- The time interval of judgment, the lower the value, the higher the frequency of judgment, the more natural, but the more resources it consumes
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(109511,Matrix,1,1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(109511,Matrix,1,-1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(109510,Matrix,3,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(109510,Matrix,3,1)

	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_Janebug197" , 0 )
end

function Lua_Janebug197()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_Janebug196" , 0 )
end
