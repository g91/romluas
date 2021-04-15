function LuaFunc_HelpMeBoDaGo()
	local Enermy
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID)

	while 1 do
		if CheckID(ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID ) ) then
			if ReadRoleValue(OwnerID() , EM_RoleValue_PID ) > 0 then 
				Yell( OwnerID() , "[SC_AGRIZA_BOSS1_00]" , 5 )
				LuaFunc_MonsterAlert_Script( 101346, 150 , "SC_AGRIZA_BOSS1_01")
			end
		else
			if ReadRoleValue(OwnerID() , EM_RoleValue_PID ) == 0 then
				WriteRoleValue(OwnerID() , EM_RoleValue_PID , 10 )
			end
		end
		sleep(60)
	end
end

function LuaFunc_BoDaGoGo()
	local Enermy
	local MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP)
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID)
	local Count = 0
	local Wait = "NO"
	local BuffTable = { [1] = 4 , [2] = 6 , [3]= 7 ,[4] = 17 , [5] = 37 , [6] = 43  ,[7] = 44 , [8] = 45 , [9] = 59 , [10] = 101}
	SetPlot( OwnerID() , "Dead" , "Lua_BoDaGo_Dead" , 40 )
	while 1 do
		if CheckID(ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID ) ) then
			Enermy = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID ) 
			Count = Count + 1
			local Buff = BuffCount ( OwnerID())
			local Angry ="NO"
			local BuffID = {}
			if Buff>0 then
				for i = 0 , Buff , 1 do
					table.insert( BuffID, BuffInfo( OwnerID() , i-1, EM_BuffInfoType_BuffID) );
				end
				for j,v in ipairs(BuffID) do
					for k,n in ipairs(BuffTable) do
						if GameObjInfo_int ( v , "AssistType" ) == n then
							CancelBuff( OwnerID() , v )
							Angry = "Yes"
						end
					end
				end
			end
			if Angry == "Yes" then
				Yell( OwnerID() , "[SC_AGRIZA_BOSS1_03]" , 5)
				AddBuff( OwnerID() ,501470 , 1  , 15 );
				Angry = "No"
			end
			if ReadRoleValue( OwnerID() , EM_RoleValue_HP) <= MaxHP/20 then 
				EnableNpcAI( OwnerID() , true )
				if CheckBuff( OwnerID() , 501081 ) == true then
					CancelBuff( OwnerID() , 501081 )
				end
				if CheckBuff( OwnerID() , 502217) ~= true then
					Yell( OwnerID() , "[SC_AGRIZA_BOSS1_03]" , 5)
					AddBuff( OwnerID() , 502217 , 1 , -1  )
				end
				if count >= 5 then
					CastSpellLV( OwnerID() , OwnerID() , 492079 , 20 )
					Count = 0
				end 
			else
				local RandNum = Rand(100)
				if Wait == "NO" and Count >= 5 then
					if RandNum < 10 or RandNum >= 90 then
					--	EnableNpcAI( OwnerID() , false );
						CastSpell( OwnerID() , Enermy , 492069 )
						SetAttack( OwnerID() , Enermy )
						Wait = "YES"
						sleep(10)
						Addbuff( OwnerID() , 501081 , 1 , -1 )
						Count = 1
					end
				end
				if Wait =="YES" and Count >= 6 then
					if CheckBuff( OwnerID() , 501081 ) == true then
						CancelBuff( OwnerID() , 501081 )
					end
					sleep(10)
					CastSpellLV( OwnerID() , OwnerID() , 492079 , 10 )		
				--	EnableNpcAI( OwnerID() , true );
					Wait = "NO"
				end
				if count == 5 then
					LuaFunc_MonsterAlert_Script( 101355 , 500 , "SC_AGRIZA_BOSS1_02")
				end
			end
			if  Count >= 9 then
				count = 0
			end
		else
			if CheckBuff( OwnerID() , 502217 ) then
				CancelBuff( OwnerID() , 502217 )
			end
			if ReadRoleValue( OwnerID() , EM_RoleValue_HP) < MaxHP then
				WriteRoleValue( OwnerID() , EM_RoleValue_HP , MaxHP )
			end
			sleep(50)
		end
		sleep(10)
	end
end

function LuaFunc_HammmerHuge()
	CastSpell( TargetID() , TargetID() , 492070 )
end

function LuaFunc_BoDaGo_Speak()
	MoveToFlagEnabled( OwnerID() ,false)
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	sleep( 20 )
	MoveToFlagEnabled( OwnerID() ,true)	
end

function Lua_BoDaGo_Dead()
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Dead = Ver_Zone252_Cyclops[Room]["BossDead"]
	Dead = Dead + 1
	Ver_Zone252_Cyclops[Room]["BossDead"] = Dead
	if Dead == 1 then
		ScriptMessage( OwnerID() , -1 , 2 ,"[SC_AGRIZA_BOSS1_04]" , 1 ) 
	elseif Dead == 2 then
		ScriptMessage( OwnerID() , -1 , 2 ,"[SC_AGRIZA_BOSS1_05]", 1 )
	else
		ScriptMessage( OwnerID() , -1 , 2 ,"[SC_AGRIZA_BOSS1_06]", 1 )  
	end

	local PlayerLV = ReadRoleValue( TargetID() , EM_RoleValue_LV )
	local PlayerSUBLV = ReadRoleValue( TargetID() , EM_RoleValue_LV_SUB )
	DesignLog(OwnerID(),101346,"Killer Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)

	return true
end