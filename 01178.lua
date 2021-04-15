-----------------------------一直坐著(怪物用)--------------------------------------
function lua_star_sit_mob()
	while 1 do
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_SIT_BEGIN,ruFUSION_ACTORSTATE_SIT_LOOP)	
		while 1 do	
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )	
			sleep(10)	
			if ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then					
				sleep(3000)
				break
			end				
		end
	end
end
------------------------------------------------------------------------------------密使潛行
function lua_star_stealth_mob()
	while 1 do	
	AddBuff( OwnerID() , 501055 , 1 , 3600 ) 	
		for i = 0 , 30 do	
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
			sleep(10)			 	
			if ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then					
				sleep(300)				
			end				
		end
	end
end

------------------------------------------------------------------------------------------------------------------------------------------------威爾詛咒
function lua_star_CursedWell()
	if CheckBuff( TargetID() , 502517 ) == false then
		AddBuff( TargetID() , 502517 , 0 , 300 )
		SetPlot( TargetID() ,"touch", "lua_star_CursedWell_1" ,60 )
	end	
end

function lua_star_CursedWell_1() 
	CancelBuff( TargetID() , 502517 )	
	BeginPlot( TargetID(), "lua_star_CursedWell_2", 1 )
end

function lua_star_CursedWell_2()
	SetPlot( OwnerID()  ,"touch", "" ,0 )
		local LittleProblem = LuaFunc_CreateObjByObj( 101997 , OwnerID() )
end	

------------------------------------------------------------------------------------------------------------------------------------------------巨岩希達歐
function lua_star_RockHill()
	local mode = rand(99)
	--Say(OwnerID() , mode)
	if mode > -1 and mode < 50 then
		AddBuff( OwnerID() , 502677 , 0 , 10 )
	elseif mode > 49 and mode < 100 then
		AddBuff( OwnerID() , 502678 , 0 , 10 )
	end		
end