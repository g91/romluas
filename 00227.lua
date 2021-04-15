Function LuaQ_420034_Complete()
	DisableQuest( OwnerID() , true )
	local Slayer1
	local Slayer2
--	SetPlot( OwnerID() , "touch" , "LuaFunc_Obj_Nothing" , 10 )

	WriteRoleValue( OwnerID() ,EM_RoleValue_IsWalk , 0  )
	Slayer1 = CreateObjByFlag ( 100078 , 780020, 2 ,1)
	AddToPartition(Slayer1 , 0)
	Slayer2 = CreateObjByFlag ( 100078  , 780020, 3 ,1)
	AddToPartition(Slayer2 , 0)
	Say ( Slayer1, GetString("SAY_110183_3") ) --/*別讓他逃了！
	PlayMotion( Slayer1,ruFUSION_ACTORSTATE_EMOTE_POINT)
	SetFightMode ( Slayer1 , 0, 0, 0,0 )
	sleep(30)
	Say ( Slayer2, GetString("SAY_110183_4") ) --/*你知道太多了！
	PlayMotion(Slayer2, ruFUSION_ACTORSTATE_EMOTE_SPEAK)	
	SetFightMode ( Slayer2 , 0, 0, 0,0 )
	sleep(15)
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_SIT_END )
	Say ( OwnerID(), GetString("SAY_110183_0") ) --/*他們來了......我去引開他們注意.....
	sleep(30)
	LuaFunc_MoveToFlag( OwnerID(), 780020 , 0 ,0 )
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_ATTACK_OH)
	sleep(5)
	PlayMotion(  Slayer1 ,ruFUSION_ACTORSTATE_HURT_CRITICAL)
	NPCDead( slayer1, OwnerID())
	Say ( Slayer2, GetString("SAY_110183_5") ) --/*你知道太多了！
	PlayMotion(  Slayer2 ,ruFUSION_ACTORSTATE_DODGE)
	sleep(15)
	LuaFunc_MoveToFlag( OwnerID(), 780020 , 1 ,0 )
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_ATTACK_OH)
	PlayMotion(  Slayer2 ,ruFUSION_ACTORSTATE_HURT_CRITICAL)
	NPCDead( slayer2, OwnerID())
	sleep(15)
	LuaFunc_MoveToFlag( OwnerID(), 780020 , 6 ,0 )
	DelObj( Slayer1 )
	DelObj( Slayer2 )
	Say ( OwnerID(), GetString("SAY_110183_1") ) --/*你也快離開吧.....別忘了.....
	sleep(10)
	Say ( OwnerID(), GetString("SAY_110183_2") ) --/*呃啊！
	AdjustDir( OwnerID(), 180 )
	sleep(30)
	DisableQuest( OwnerID() , false )
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_SIT_BEGIN,ruFUSION_ACTORSTATE_SIT_LOOP)
	sleep(30)
--	Hide( OwnerID() )

--	sleep( 100)
--	LuaFunc_ResetObj( OwnerID() )
end
-----------------------------------------------------------------------------------