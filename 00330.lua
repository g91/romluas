function LuaI_110459()
	SetPlot( OwnerID() , "touch" , "LuaI_110459_Summon" , 40 )
end
---------------------------------------------------------------------------------------------------------
function LuaI_110459_Summon()

	if CheckFlag( OwnerID() , 540226 ) == false then
		return
	end

	SetPlot( TargetID() , "touch" , "LuaFunc_Obj_Nothing" , 0 )

	local Soiler = LuaFunc_CreateObjByObj(100266,TargetID())
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )

	Hide( TargetID() )
	AddToPartition( Soiler , Room )

	SetPlot( Soiler , "dead" , "LuaQ_420271_PlayA" , 40 )

end
---------------------------------------------------------------------------------------------------------
function LuaQ_420271_PlayA()
	if CheckAcceptQuest( TargetID() , 420271 ) then
		local Room = ReadRoleValue( TArgetID() , EM_RoleValue_RoomID )
		local Adery = CreateObjByFlag(110332,780038,1,1)
		AddToPartition( Adery , Room )
		BeginPlot( Adery , "LuaQ_420271_PlayB" , 0 )
	end
end
---------------------------------------------------------------------------------------------------------
function LuaQ_420271_PlayB()
	SetPlot( OwnerID() , "touch" , "LuaFunc_Obj_Nothing" , 40 )
	local KerlBull = LuaFunc_SearchNPCbyOrgID( OwnerID() , 110347 , 500 )
	DelObj( KerlBull )
	MoveToFlagEnabled( OwnerID() , false)
	WriteRoleValue( OwnerID() , EM_RoleValue_IsWalk , 0 )
	LuaFunc_MoveToFlag( OwnerID() , 780038 , 2 , 0 )
	sleep( 5 )
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Say( OwnerID() , GetString("SAY_110332_2") ) --/*太好了！你們沒事！
	sleep( 30 )
	SetPlot( OwnerID() , "touch" , "" , 0 )
end