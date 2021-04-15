function LuaI_100904_0() --皮爾拉諾克的僕從
	SetPlot( OwnerID() , "dead" , "Lua_100904_deadlog_1" , 0 );
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 ) 
	local PID = 0
	local Num = 0
	while 1 do
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
		if (  AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- 檢查是否離開戰鬥
			PID = ReadRoleValue( OwnerID() , EM_RoleValue_PID  )
			if PID >= 3 and Num < 20 then
				ScriptMessage( OwnerID(),  0 , 1, GetString("SC_100904_1"), 0 ); 
				local Egg = LuaFunc_CreateObjByObj ( 100907 , OwnerID() )
				SetPlot( Egg , "dead" , "LuaFunc_DeadPlay" , 40 )
				WriteRoleValue( Egg, EM_RoleValue_PID , AttackTarget   )
				BeginPlot( Egg , "LuaI_100904_1" , 0 )
				SetFightMode ( Egg, 0 , 0 , 0 ,1 )
				WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 )
				Num = Num + 1
--				Say( OwnerID() , Num )
			end
		else
			WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 )
			if Num ~= 0 then 
				Num = 0
--				Say( OwnerID() , Num )
			end
		end
		sleep( 10 )
	end
end

function LuaI_100904_1()
	Sleep( 150 )
	ScriptMessage( OwnerID(),  0 , 1, GetString("SC_100904_2"), 0 ); 
	Hide( OwnerID() )
	local Spider
	for i = 1 , 5 , 1 do
		Spider = LuaFunc_CreateObjByObj ( 100208 , OwnerID() )
		SetPlot( Spider , "dead" , "LuaFunc_DeadPlay" , 40 )
		BeginPlot( Spider , "LuaI_100904_2" , 0 )
		SetAttack( Spider , ReadRoleValue(OwnerID(), EM_RoleValue_PID) )
	end
	DelObj( OwnerID() )
end

function LuaI_100904_2()
	LuaFunc_Obj_Suicide(10)
end

function LuaI_100904_3()
	if CheckID( OwnerID() ) == true and ReadRoleValue( OwnerID() , EM_RoleValue_IsNPC ) == 1 and ReadRoleValue( OwnerID() , EM_RoleValue_IsDead ) ~= 1 then
		local PID = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
		PID = PID + 1
		WriteRoleValue( OwnerID() , EM_RoleValue_PID , PID )
	end
end

function LuaI_100905_0() --貪吃鬼卡魯德
	SetPlot( OwnerID() , "dead" , "Lua_100905_deadlog_1" , 0 );
	local CheckTime = 10
	local HP
	local MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP ) 
	Local PID = 0
	local Count = 0
	local RandNum = 0
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 ) 
	while 1 do
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
		if (  AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- 檢查是否離開戰鬥
			HP = ReadRoleValue( OwnerID() , EM_RoleValue_HP ) 
			PID = ReadRoleValue( OwnerID() , EM_RoleValue_PID ) 
			if HP < MaxHP*(60/100) then
--				Say( OwnerID() , PID )
				if PID == 0 then 
					RandNum = 1
				else
					RandNum = Rand(2)+1
				end
--				Say( OwnerID() , RandNum )
				if RandNum == 1 then
					CastSpell(  OwnerID() ,  OwnerID() , 491123)
					sleep(15)
					 CastSpell(  OwnerID() ,  OwnerID() , 491124)
					sleep(15)
					if CheckBuff( OwnerID() , 501679 ) == true then
						ScriptMessage( OwnerID(),  0 , 1, GetString("SC_100905_1"), 0 ); 
						WriteRoleValue( OwnerID() , EM_RoleValue_PID , 1 ) 
					end
					sleep( 150 )
				end
			elseif HP >  MaxHP* ( 60/100 ) then
				WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 ) 
			end
		end
		sleep( CheckTime )
	end
end

function LuaI_100906_0() --
	while 1 do
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
		if (  AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- 檢查是否離開戰鬥

		end
	end
end