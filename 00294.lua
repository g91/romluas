function LuaQ_420262_Accept()
	SetPlot( OwnerID() , "Touch" ,"LuaFunc_Obj_Nothing" , 40)
	MoveToFlagEnabled( OwnerID(), false );
	WriteRoleValue( OwnerID() ,EM_RoleValue_IsWalk , 1  )
	local Owner = Role:new(OwnerID())
	local X = Owner:X()
	local Y = Owner:Y()
	local Z = Owner:Z()	
	LuaFunc_WaitMoveTo( OwnerID(), X+50 , Y , Z )
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_CRAFTING_BEGIN )
	sleep( 50 )
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_CRAFTING_END )
	sleep( 30 )
	LuaFunc_WaitMoveTo( OwnerID(), X , Y , Z )	
	Say( OwnerID() , GetString("SAY_110278_0")) --/*�g�n�F�I
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	sleep(30)
	if GiveBodyItem( TargetID() , 201007 , 1 ) then	
		Say( OwnerID() , GetString("SAY_110278_1")) --/*�ЧA�N�o�Ӯ�����L�w�a�I
		PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SPEAK)
		sleep( 30 )	
		Say( OwnerID() , GetString("SAY_110278_2")) --/*�ڷQ�A�L�J�쪺�·Ч����������W���A���L�N���U�A���U�F�C
		PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SPEAK)
		sleep( 30 )
	end
	SetPlot( OwnerID() , "Touch" ,"" , 0)	
end