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
	Say ( Slayer1, GetString("SAY_110183_3") ) --/*�O���L�k�F�I
	PlayMotion( Slayer1,ruFUSION_ACTORSTATE_EMOTE_POINT)
	SetFightMode ( Slayer1 , 0, 0, 0,0 )
	sleep(30)
	Say ( Slayer2, GetString("SAY_110183_4") ) --/*�A���D�Ӧh�F�I
	PlayMotion(Slayer2, ruFUSION_ACTORSTATE_EMOTE_SPEAK)	
	SetFightMode ( Slayer2 , 0, 0, 0,0 )
	sleep(15)
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_SIT_END )
	Say ( OwnerID(), GetString("SAY_110183_0") ) --/*�L�̨ӤF......�ڥh�޶}�L�̪`�N.....
	sleep(30)
	LuaFunc_MoveToFlag( OwnerID(), 780020 , 0 ,0 )
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_ATTACK_OH)
	sleep(5)
	PlayMotion(  Slayer1 ,ruFUSION_ACTORSTATE_HURT_CRITICAL)
	NPCDead( slayer1, OwnerID())
	Say ( Slayer2, GetString("SAY_110183_5") ) --/*�A���D�Ӧh�F�I
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
	Say ( OwnerID(), GetString("SAY_110183_1") ) --/*�A�]�����}�a.....�O�ѤF.....
	sleep(10)
	Say ( OwnerID(), GetString("SAY_110183_2") ) --/*�c�ڡI
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