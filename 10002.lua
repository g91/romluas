-------------------------------Vale of rights-Easy------Janebug------------------------------------------------------------------------------------------------------
-- 3 Assassin of Vale 2 Combat Mage of the Vale 
function Lua_Janebug60()

	local dis = 20  -- array spacing
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
	
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(100381,Matrix,2,-1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(100381,Matrix,2,1)
	
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(100380,Matrix,3,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(100380,Matrix,3,0)
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(100380,Matrix,3,1)

	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_Janebug61" , 0 )
end

function Lua_Janebug61()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_Janebug60" , 0 )
end

-------------------------------------------------------------Janebug----------------------------------
-- 2 Assassin of Vale
function Lua_Janebug62()

	local dis = 17  -- array spacing
	local count = 3 -- The size of the array, input 3 will be a 3*3 array; but because the number of rows must be an odd number, input 4 will be a 5*4 array.
	local checktime = 5 -- The time interval of judgment, the lower the value, the higher the frequency of judgment, the more natural, but the more resources it consumes
	local ReviveTime = 600000  -- When all the objects in the array disappear, the array will be reset. If -1 is filled in, it will be reset according to the rebirth time set by OwnerID()
	local circle = 6000  -- How many cycles are completely respawned once? If 0 is filled in, the rebirth will only occur when all objects disappear
	local Matrix = LuaFunc_Matrix_Maker( dis , count )  -- Create a table and use LuaFunc_CreateNPCByMatrix(ObjID,Matrix,A,B) to generate objects where you want to generate objects. The four numbers represent in sequence 1. The ID of the object to be generated 2. The array used as a reference 3. The column position 4. The row position
		
	local ObjMatrix ={}
		
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(100380,Matrix,3,-1)
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(100380,Matrix,3,1)

	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_Janebug63" , 0 )
end

function Lua_Janebug63()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_Janebug62" , 0 )
end

-------------------------------------------------------------Janebug----------------------------------
-- 3 Assassin of Vale 2 Dark Energy of the Vale
function Lua_Janebug64()

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
	
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(100383,Matrix,2,-1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(100383,Matrix,2,1)
	
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(100380,Matrix,3,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(100380,Matrix,3,0)
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(100380,Matrix,3,1)

	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_Janebug65" , 0 )
end

function Lua_Janebug65()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_Janebug64" , 0 )
end

-------------------------------------------------------------Janebug----------------------------------
-- 5 Fallen Harpy
function Lua_Janebug66()

	local dis = 25 -- array spacing
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
	
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(100386,Matrix,2,-1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(100386,Matrix,2,1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(100386,Matrix,3,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(100386,Matrix,3,0)
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(100386,Matrix,3,1)

	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_Janebug67" , 0 )
end

function Lua_Janebug67()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_Janebug66" , 0 )
end

-------------------------------------------------------------Janebug----------------------------------
-- 4 Assassin of Vale
function Lua_Janebug68()

	local dis = 10 -- array spacing
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
	
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(100380,Matrix,1,-1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(100380,Matrix,1,1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(100380,Matrix,2,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(100380,Matrix,2,1)

	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_Janebug69" , 0 )
end

function Lua_Janebug69()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_Janebug68" , 0 )
end

-------------------------------------------------------------Janebug----------------------------------
-- 5 Dark Energy of the Vale
function Lua_Janebug70()

	local dis = 20  -- array spacing
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
	
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(100383,Matrix,2,-1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(100383,Matrix,2,1)
	
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(100383,Matrix,3,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(100383,Matrix,3,0)
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(100383,Matrix,3,1)

	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_Janebug71" , 0 )
end

function Lua_Janebug71()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_Janebug70" , 0 )
end

-------------------------------Vale of rights-Normal------Janebug------------------------------------------------------------------------------------------------------
-- 3 Assassin of Vale 2 Combat Mage of the Vale 
function Lua_Janebug72()

	local dis = 20  -- array spacing
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
	
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(107389,Matrix,2,-1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(107389,Matrix,2,1)
	
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(107388,Matrix,3,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(107388,Matrix,3,0)
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(107388,Matrix,3,1)

	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_Janebug73" , 0 )
end

function Lua_Janebug73()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_Janebug72" , 0 )
end

-------------------------------------------------------------Janebug----------------------------------
-- 2 Assassin of Vale
function Lua_Janebug74()

	local dis = 17  -- array spacing
	local count = 3 -- The size of the array, input 3 will be a 3*3 array; but because the number of rows must be an odd number, input 4 will be a 5*4 array.
	local checktime = 5 -- The time interval of judgment, the lower the value, the higher the frequency of judgment, the more natural, but the more resources it consumes
	local ReviveTime = 600000  -- When all the objects in the array disappear, the array will be reset. If -1 is filled in, it will be reset according to the rebirth time set by OwnerID()
	local circle = 6000  -- How many cycles are completely respawned once? If 0 is filled in, the rebirth will only occur when all objects disappear
	local Matrix = LuaFunc_Matrix_Maker( dis , count )  -- Create a table and use LuaFunc_CreateNPCByMatrix(ObjID,Matrix,A,B) to generate objects where you want to generate objects. The four numbers represent in sequence 1. The ID of the object to be generated 2. The array used as a reference 3. The column position 4. The row position
		
	local ObjMatrix ={}
		
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(107388,Matrix,3,-1)
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(107388,Matrix,3,1)

	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_Janebug75" , 0 )
end

function Lua_Janebug75()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_Janebug74" , 0 )
end

-------------------------------------------------------------Janebug----------------------------------
-- 3 Assassin of Vale 2 Dark Energy of the Vale
function Lua_Janebug76()

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
	
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(109385,Matrix,2,-1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(109385,Matrix,2,1)
	
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(107388,Matrix,3,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(107388,Matrix,3,0)
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(107388,Matrix,3,1)

	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_Janebug77" , 0 )
end

function Lua_Janebug77()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_Janebug76" , 0 )
end

-------------------------------------------------------------Janebug----------------------------------
-- 5 Fallen Harpy
function Lua_Janebug78()

	local dis = 25 -- array spacing
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
	
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(109388,Matrix,2,-1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(109388,Matrix,2,1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(109388,Matrix,3,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(109388,Matrix,3,0)
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(109388,Matrix,3,1)

	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_Janebug79" , 0 )
end

function Lua_Janebug79()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_Janebug78" , 0 )
end

-------------------------------------------------------------Janebug----------------------------------
-- 4 Assassin of Vale
function Lua_Janebug80()

	local dis = 10 -- array spacing
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
	
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(107388,Matrix,1,-1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(107388,Matrix,1,1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(107388,Matrix,2,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(107388,Matrix,2,1)

	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_Janebug81" , 0 )
end

function Lua_Janebug81()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_Janebug80" , 0 )
end

-------------------------------------------------------------Janebug----------------------------------
-- 5 Dark Energy of the Vale
function Lua_Janebug82()

	local dis = 20  -- array spacing
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
	
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(109385,Matrix,2,-1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(109385,Matrix,2,1)
	
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(109385,Matrix,3,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(109385,Matrix,3,0)
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(109385,Matrix,3,1)

	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_Janebug83" , 0 )
end

function Lua_Janebug83()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_Janebug82" , 0 )
end

-------------------------------Vale of rights-Hard------Janebug------------------------------------------------------------------------------------------------------
-- 3 Assassin of Vale 2 Combat Mage of the Vale 
function Lua_Janebug84()

	local dis = 20  -- array spacing
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
	
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(107394,Matrix,2,-1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(107394,Matrix,2,1)
	
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(107393,Matrix,3,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(107393,Matrix,3,0)
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(107393,Matrix,3,1)

	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_Janebug85" , 0 )
end

function Lua_Janebug85()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_Janebug84" , 0 )
end

-------------------------------------------------------------Janebug----------------------------------
-- 2 Assassin of Vale
function Lua_Janebug86()

	local dis = 17  -- array spacing
	local count = 3 -- The size of the array, input 3 will be a 3*3 array; but because the number of rows must be an odd number, input 4 will be a 5*4 array.
	local checktime = 5 -- The time interval of judgment, the lower the value, the higher the frequency of judgment, the more natural, but the more resources it consumes
	local ReviveTime = 600000  -- When all the objects in the array disappear, the array will be reset. If -1 is filled in, it will be reset according to the rebirth time set by OwnerID()
	local circle = 6000  -- How many cycles are completely respawned once? If 0 is filled in, the rebirth will only occur when all objects disappear
	local Matrix = LuaFunc_Matrix_Maker( dis , count )  -- Create a table and use LuaFunc_CreateNPCByMatrix(ObjID,Matrix,A,B) to generate objects where you want to generate objects. The four numbers represent in sequence 1. The ID of the object to be generated 2. The array used as a reference 3. The column position 4. The row position
		
	local ObjMatrix ={}
		
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(107393,Matrix,3,-1)
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(107393,Matrix,3,1)

	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_Janebug87" , 0 )
end

function Lua_Janebug87()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_Janebug86" , 0 )
end

-------------------------------------------------------------Janebug----------------------------------
-- 3 Assassin of Vale 2 Dark Energy of the Vale
function Lua_Janebug88()

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
	
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(107624,Matrix,2,-1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(107624,Matrix,2,1)
	
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(107393,Matrix,3,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(107393,Matrix,3,0)
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(107393,Matrix,3,1)

	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_Janebug89" , 0 )
end

function Lua_Janebug89()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_Janebug88" , 0 )
end

-------------------------------------------------------------Janebug----------------------------------
-- 5 Fallen Harpy
function Lua_Janebug90()

	local dis = 25 -- array spacing
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
	
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(107690,Matrix,2,-1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(107690,Matrix,2,1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(107690,Matrix,3,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(107690,Matrix,3,0)
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(107690,Matrix,3,1)

	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_Janebug91" , 0 )
end

function Lua_Janebug91()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_Janebug90" , 0 )
end

-------------------------------------------------------------Janebug----------------------------------
-- 4 Assassin of Vale
function Lua_Janebug92()

	local dis = 10 -- array spacing
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
	
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(107393,Matrix,1,-1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(107393,Matrix,1,1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(107393,Matrix,2,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(107393,Matrix,2,1)

	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_Janebug93" , 0 )
end

function Lua_Janebug93()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_Janebug92" , 0 )
end

-------------------------------------------------------------Janebug----------------------------------
-- 5 Dark Energy of the Vale
function Lua_Janebug94()

	local dis = 20  -- array spacing
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
	
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(107624,Matrix,2,-1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(107624,Matrix,2,1)
	
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(107624,Matrix,3,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(107624,Matrix,3,0)
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(107624,Matrix,3,1)

	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_Janebug95" , 0 )
end

function Lua_Janebug95()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_Janebug94" , 0 )
end

-------------------------------------------------------------Janebug----------------------------------





