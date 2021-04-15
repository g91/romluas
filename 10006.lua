-------------------------------Tomb of souls Easy-----Janebug------------------------------------------------------------------------------------------------------
-- 2 Souless Canine Scout 2 Tomb Caine Dead Spirit
function Lua_Janebug120()

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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(107048,Matrix,1,1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(107048,Matrix,1,-1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(107047,Matrix,3,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(107047,Matrix,3,1)

	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_Janebug121" , 0 )
end

function Lua_Janebug121()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_Janebug120" , 0 )
end

-------------------------------------------------------------Janebug----------------------------------
-- 2 Tomb Deathbone 2 Tomb Shadow
function Lua_Janebug122()

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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(107046,Matrix,1,1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(107046,Matrix,1,-1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(107045,Matrix,3,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(107045,Matrix,3,1)

	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_Janebug123" , 0 )
end

function Lua_Janebug123()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_Janebug122" , 0 )
end

-------------------------------------------------------------Janebug----------------------------------
-- 2 Tomb of Souls Combat Mage
function Lua_Janebug124()

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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(107051,Matrix,1,1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(107051,Matrix,1,-1)

	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_Janebug125" , 0 )
end

function Lua_Janebug125()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_Janebug124" , 0 )
end

-------------------------------------------------------------Janebug----------------------------------
-- 4 Tomb of Souls Guard
function Lua_Janebug126()

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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(107050,Matrix,1,1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(107050,Matrix,1,-1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(107050,Matrix,3,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(107050,Matrix,3,1)

	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_Janebug127" , 0 )
end

function Lua_Janebug127()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_Janebug126" , 0 )
end


-------------------------------------------------------------Janebug----------------------------------
-- 5 Tomb Vampire Bats
function Lua_Janebug144()

	local dis = 14  -- array spacing
	local count = 6 -- The size of the array, input 3 will be a 3*3 array; but because the number of rows must be an odd number, input 4 will be a 5*4 array.
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(107039,Matrix,2,-1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(107039,Matrix,2,1)
	
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(107039,Matrix,3,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(107039,Matrix,3,0)
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(107039,Matrix,3,1)

	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_Janebug145" , 0 )
end

function Lua_Janebug145()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_Janebug144" , 0 )
end


-------------------------------Tomb of Souls Normal-----Janebug------------------------------------------------------------------------------------------------------
-- 2 Souless Canine Scout 2 Tomb Caine Dead Spirit
function Lua_Janebug128()

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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(100029,Matrix,1,1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(100029,Matrix,1,-1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(100028,Matrix,3,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(100028,Matrix,3,1)

	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_Janebug129" , 0 )
end

function Lua_Janebug129()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_Janebug128" , 0 )
end

-------------------------------------------------------------Janebug----------------------------------
-- 2 Tomb Deathbone 2 Tomb Shadow
function Lua_Janebug130()

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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(100027,Matrix,1,1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(100027,Matrix,1,-1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(100026,Matrix,3,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(100026,Matrix,3,1)

	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_Janebug131" , 0 )
end

function Lua_Janebug131()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_Janebug130" , 0 )
end

-------------------------------------------------------------Janebug----------------------------------
-- 2 Tomb of Souls Combat Mage
function Lua_Janebug132()

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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(103812,Matrix,1,1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(103812,Matrix,1,-1)

	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_Janebug133" , 0 )
end

function Lua_Janebug133()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_Janebug132" , 0 )
end

-------------------------------------------------------------Janebug----------------------------------
-- 4 Tomb of Souls Guard
function Lua_Janebug134()

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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(103811,Matrix,1,1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(103811,Matrix,1,-1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(103811,Matrix,3,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(103811,Matrix,3,1)

	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_Janebug135" , 0 )
end

function Lua_Janebug135()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_Janebug134" , 0 )
end

-------------------------------------------------------------Janebug----------------------------------
-- 5 Tomb Vampire Bats
function Lua_Janebug146()

	local dis = 14  -- array spacing
	local count = 6 -- The size of the array, input 3 will be a 3*3 array; but because the number of rows must be an odd number, input 4 will be a 5*4 array.
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(100020,Matrix,2,-1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(100020,Matrix,2,1)
	
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(100020,Matrix,3,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(100020,Matrix,3,0)
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(100020,Matrix,3,1)

	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_Janebug147" , 0 )
end

function Lua_Janebug147()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_Janebug146" , 0 )
end


-------------------------------Tomb of souls Hard-----Janebug------------------------------------------------------------------------------------------------------
-- 2 Souless Canine Scout 2 Tomb Caine Dead Spirit
function Lua_Janebug136()

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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(100013,Matrix,1,1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(100013,Matrix,1,-1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(100014,Matrix,3,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(100014,Matrix,3,1)

	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_Janebug137" , 0 )
end

function Lua_Janebug137()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_Janebug136" , 0 )
end

-------------------------------------------------------------Janebug----------------------------------
-- 2 Tomb Deathbone 2 Tomb Shadow
function Lua_Janebug138()

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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(100012,Matrix,1,1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(100012,Matrix,1,-1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(100011,Matrix,3,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(100011,Matrix,3,1)

	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_Janebug139" , 0 )
end

function Lua_Janebug139()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_Janebug138" , 0 )
end

-------------------------------------------------------------Janebug----------------------------------
-- 2 Tomb of Souls Combat Mage
function Lua_Janebug140()

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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(100017,Matrix,1,1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(100017,Matrix,1,-1)

	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_Janebug141" , 0 )
end

function Lua_Janebug141()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_Janebug140" , 0 )
end

-------------------------------------------------------------Janebug----------------------------------
-- 4 Tomb of Souls Guard
function Lua_Janebug142()

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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(100016,Matrix,1,1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(100016,Matrix,1,-1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(100016,Matrix,3,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(100016,Matrix,3,1)

	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_Janebug143" , 0 )
end

function Lua_Janebug143()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_Janebug142" , 0 )
end


-------------------------------------------------------------Janebug----------------------------------
-- 5 Tomb Vampire Bats
function Lua_Janebug148()

	local dis = 14  -- array spacing
	local count = 6 -- The size of the array, input 3 will be a 3*3 array; but because the number of rows must be an odd number, input 4 will be a 5*4 array.
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(100005,Matrix,2,-1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(100005,Matrix,2,1)
	
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(100005,Matrix,3,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(100005,Matrix,3,0)
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(100005,Matrix,3,1)

	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_Janebug149" , 0 )
end

function Lua_Janebug149()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_Janebug148" , 0 )
end