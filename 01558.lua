function Lua_apon_113596() ----賣水龍配方用

	SetSpeakDetail( OwnerID(), "[SC_113596_1]" )--關於生產配方
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_113596_00]" , "Lua_apon_113596_00", 0 ) --配方的源由
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_113596_01]" , "Lua_apon_113596_01", 0 ) --布
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_113596_02]" , "Lua_apon_113596_02", 0 ) --皮
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_113596_03]" , "Lua_apon_113596_03", 0 ) --鎖
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_113596_04]" , "Lua_apon_113596_04", 0 ) --鎧
end

function Lua_apon_touch()
	closeSpeak( OwnerID() )
	GetRecipeList( OwnerID(), TargetID() );	 -- GetRecipeList( Player, NPC );
end

function Lua_apon_113596_00()
	SetSpeakDetail( OwnerID(), "[SC_113596_00_1]"   )--主文，水龍的背景簡介，內容
	AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113596", 0 ) --回到上一頁
end

function Lua_apon_113596_01()                                                                                               
	local GAHO0 = LuaFunc_SearchNPCbyOrgID(TargetID(), 113598, 200 , 1) 
	BeginPlot( GAHO0[0],  "Lua_apon_113596_01_1" , 0 )    
end

function Lua_apon_113596_01_1()
	BeginPlot( TargetID(), "Lua_apon_touch" , 0 )
	AddRecipe( OwnerID() , 551010)
	AddRecipe( OwnerID() , 551011)
	AddRecipe( OwnerID() , 551012)
	AddRecipe( OwnerID() , 551013)
end

function Lua_apon_113596_02()                                                                                               
	local GAHO1 = LuaFunc_SearchNPCbyOrgID(TargetID(), 113599, 200 , 1) 
	BeginPlot( GAHO1[0],  "Lua_apon_113596_02_1" , 0 )    
end

function Lua_apon_113596_02_1()
	BeginPlot( TargetID(), "Lua_apon_touch" , 0 )
	AddRecipe( OwnerID() , 551014)
	AddRecipe( OwnerID() , 551015)
	AddRecipe( OwnerID() , 551016)
	AddRecipe( OwnerID() , 551017)
end

function Lua_apon_113596_03()                                                                                               
	local GAHO2 = LuaFunc_SearchNPCbyOrgID(TargetID(), 113600, 200 , 1) 
	BeginPlot( GAHO2[0],  "Lua_apon_113596_03_1" , 0 )    
end

function Lua_apon_113596_03_1()
	BeginPlot( TargetID(), "Lua_apon_touch" , 0 )
	AddRecipe( OwnerID() , 551018)
	AddRecipe( OwnerID() , 551019)
	AddRecipe( OwnerID() , 551020)
	AddRecipe( OwnerID() , 551021)
end

function Lua_apon_113596_04()                                                                                               
	local GAHO3 = LuaFunc_SearchNPCbyOrgID(TargetID(), 113601, 200 , 1) 
	BeginPlot( GAHO3[0],  "Lua_apon_113596_04_1" , 0 )    
end

function Lua_apon_113596_04_1()
	BeginPlot( TargetID(), "Lua_apon_touch" , 0 )
	AddRecipe( OwnerID() , 551022)
	AddRecipe( OwnerID() , 551023)
	AddRecipe( OwnerID() , 551024)
	AddRecipe( OwnerID() , 551025)
end