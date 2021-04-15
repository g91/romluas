function LuaI_200938_Check()
	if CheckAcceptQuest( OwnerID() , 420351 ) == false then
		ScriptMessage( OwnerID() , OwnerID() , 0 ,GetString(SAY_200938_0) , 0)
		return false
	else
		return true
	end
end

function LuaI_200938_Effect()
	local feather = {}
	local Give = Rand(7)+1
	feather[1] = 201268
	feather[2] = 201269
	feather[3] = 201270
	feather[4] = 201271
	feather[5] = 201272
	feather[6] = 201273
	feather[7] = 201274
	if Give > 0 and Give < 8 then
		GiveBodyItem( OwnerID() , feather[Give] , 1 )
		local name = "["..feather[Give].."]"
		local String = "[SAY_200938_1][$SETVAR1="..name.."]"
		ScriptMessage( OwnerID() , OwnerID() , 0 ,String, C_YELLOW )
	end
end

function LuaI_110362_0()
	SetPlot( OwnerID() , "touch" ,  "LuaI_110362_1" , 40 )
end

function LuaI_110362_1()
	BeginPlot( TargetID() , "LuaI_110362_2",0)
end

function LuaI_110362_2()
	sleep( 5 )
	if CheckCompleteQuest(TargetID(),420349) == false and CountBodyItem( TargetID() , 200936 ) == 0 then
		GiveBodyItem( TargetID(),200936 , 1 )
	else
		ScriptMessage( OwnerID() , OwnerID() , 0 ,GetString(SAY_110362), C_YELLOW )
	end
end