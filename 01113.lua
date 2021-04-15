function LuaQ_421596_Complete()
	DisableQuest(OwnerID(),true)
	local Obj = Role:new( OwnerID() )
	local X = Obj:X()
	local Y = Obj:Y()
	local Z = Obj:Z()
	local Dir = Obj:Dir()
	FaceObj( OwnerID() , TargetID() )
	sleep(15)
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_ATTACK_1H )
	sleep(15)
	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_421596_0]" , 1 ) --你的劍已被斬斷。
	LuaFunc_WaitMoveTo( OwnerID(), X , Y , Z )
	sleep(10)
	SetDir( OwnerID(), Dir )
	sleep(15)
	DisableQuest(OwnerID(),false)
end

function LuaS_111785_0()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 421597 ) == true and ReadRoleValue( TargetID() , EM_RoleValue_PID) == 0 then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_111785_0]","LuaS_111785_1",0) --我準備好要跟美麗的公主見面了。
	end
end

function LuaS_111785_1()
	CloseSpeak( OwnerID() )
	WriteRoleValue( TargetID() , EM_RoleValue_PID , 7 )
	DisableQuest(TargetID(),true)
	BeginPlot( TargetID() , "LuaS_111785_2" , 0 )
end

function LuaS_111785_2()
	local Me = Role:new(OwnerID())
	local Princess = CreateObj( 101384 , Me:X() + 20 , Me:Y() , Me:Z() + 20 , 0 , 1 )
	AddToPartition( Princess , 0 )
	SetAttack( Princess , TargetID() )
	BeginPlot( Princess , "LuaQ_Zone5_Epic_NPCDead" , 0 )
	while 1 do
		if CheckID( Princess ) == false or ReadRoleValue( Princess , EM_RoleValue_IsDead ) == 1 then
			break
		end
		sleep(30)
	end
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 )
	DisableQuest(OwnerID(),false)
end

function LuaI_203433_Check()
	local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	if OrgID == 101380 and ReadRoleValue(TargetID() , EM_RoleValue_IsDead ) == 0  then
		return true
	elseif OrgID == 101381 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_203433_0]" , 0 ) --他看起來已經加熱過了
		return false
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_203433_1]" , 0 ) --火焰彈很危險，請不要亂丟
		return false
	end
end

function LuaI_203433_Effect()
	local Monster = LuaFunc_CreateObjByObj( 101381 , TargetID())
	Beginplot(TargetID() , "LuaS_421219_3" , 0 )
--	AddToPartition( Monster , 0 )
	Say(Monster , "[SC_203433_2]" ) --好燙～好燙～ 
	SetAttack( Monster , OwnerID())
	BeginPlot( Monster , "LuaS_421219_2", 0 )
end

function LuaQ_421593_AfterClick()
	BeginPlot( TargetID() , "LuaQ_421593_MowMow" , 0 )
	return true
end

function LuaQ_421593_MowMow()
	Hide( OwnerID() )
	local Mow = LuaFunc_CreateObjByObj( 101383 , OwnerID() )
	AddToPartition( Mow , 0 )
	BeginPlot( Mow , "LuaQ_Zone5_Epic_NPCDead" , 0 )
	SetAttack( Mow , TargetID() )
	while 1 do
		if CheckID( Mow ) == False or ReadRoleValue( Mow ,EM_RoleValue_IsNPC ) == 0 or ReadRoleValue( Mow ,EM_RoleValue_IsDead ) == 1 then
			break
		end
		sleep(60)
	end
	sleep( 150 )
	Show( OwnerID() , 0 )
end

Function LuaI_203437_Quest()
	ClearBorder( OwnerID());	--初始化石碑介面
	AddBorderPage( OwnerID(), "[Sys421595_szquest_accept_detail]");

	ShowBorder( OwnerID(), 421595, "[203437]", "ScriptBorder_Texture_Paper" )	

end