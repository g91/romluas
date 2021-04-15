Function LuaQ_420101_Complete()

--	setplot( OwnerID(), "touch" , "LuaFunc_Obj_BUSY", 40); --NPC表演時鎖定
	
	local M =  LuaFunc_SearchNPCbyOrgID( OwnerID() ,110053 ,300 );	--從戴爾的位置尋找米拉亞
	sleep ( 30);
--	setplot( M, "touch" , "LuaFunc_Obj_BUSY", 40);	--NPC表演時鎖定
	
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_WAVE );	--戴爾揮手
	BeginPlot( M , "LuaQ_420101_Complete_B" , 30 )
	sleep( 200 )
--	setplot( OwnerID(), "touch" , "", 40);	--解除鎖定
--	setplot( M, "touch" , "", 40);	--解除鎖定


End

Function LuaQ_420101_Complete_B()
	
	MoveToFlagEnabled( OwnerID() , false )
	WriteRoleValue( OwnerID() , EM_RoleValue_IsWalk , 0 )

	FaceObj( OwnerID(), TargetID() );  	--米拉亞面向戴爾
 	sleep (100);

	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_HURT );	--米拉亞表演動作
	sleep(60);
	--PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_LAUGH );  米拉亞表演高興動作，目前無此動作
	
	MoveToFlagEnabled( OwnerID() , true )	
end