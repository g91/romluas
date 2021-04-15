

function LuaS_421324_0()
	SetPlot( OwnerID() , "Range" , "LuaS_421324_1" ,  80 )
end

function LuaS_421324_1()
	if CountBodyItem(OwnerID() , 202526) > 0 then
		ScriptMessage( OwnerID(), OwnerID(), 2, GetString("SC_421324_0"), 0 )--看來這裡就是老獵人所說的地方
	end
end

function LuaS_421324_2()
	local NPC = SearchRangeNPC ( OwnerID() , 110 )
	for i=0 , table.getn(NPC) do
		
		if ReadRoleValue(NPC[i],EM_RoleValue_OrgID) == 111271 then
			return true
		end
	
	end
	ScriptMessage( TargetID(), TargetID(), 1, GetString("SC_421324_1"), 0 )--不在目標區域內
	return false
end

function LuaS_421324_3()
	local Cup = LuaFunc_CreateObjByObj ( 100814 , OwnerID() )
	SetRoleCamp( Cup  , "SNPC" )--改變陣營
	AddToPartition( Cup ,    0 )	--加進舞台
	BeginPlot( Cup , "LuaS_421324_4" , 0 )
	ScriptMessage( TargetID(), TargetID(), 2, GetString("SC_421324_2"), 0 )--炸彈安置完成
end


function LuaS_421324_4()
	sleep(30)
	SetPlot( OwnerID() , "dead" , "LuaS_421324_5" ,  50 )
	local Monster = CreateObjByFlag( 100815 , 780203 , 0 , 1 )
	AddToPartition( Monster ,    0 )	--加進舞台
	SetAttack( Monster , OwnerID() )	--下令攻擊
	BeginPlot(Monster,"LuaS_Discowood_CheckPeace",0)
end

function LuaS_421324_5()
	WriteRoleValue(OwnerID() , EM_RoleValue_PID , ReadRoleValue(OwnerID() , EM_RoleValue_AttackTargetID) )
	BeginPlot(OwnerID() , "LuaS_421324_6" , 0 )
	return false
end

function LuaS_421324_6()
	CastSpell( OwnerID() , OwnerID() , 491259 )
	local Monster = ReadRoleValue(OwnerID() , EM_RoleValue_PID)
	local HP = ReadRoleValue(Monster , EM_RoleValue_HP )
	PlayMotion ( OwnerID() , ruFUSION_ACTORSTATE_HURT_NORMAL ) --播被打的動作
	WriteRoleValue( Monster , EM_RoleValue_HP , math.floor(0.7*HP) )
	BeginPlot(Monster , "LuaS_421324_7" , 0 )
	sleep(10)
	DelObj(OwnerID())
end

function LuaS_421324_7()
	local Players = SearchRangePlayer( OwnerID() , 200 )
	for i=0 , table.getn(Players) do
		if ReadRoleValue(Players[i],EM_RoleValue_OrgID) == 1000 then
			SetAttack(OwnerID() , Players[i] )
			break
		end
	end
end