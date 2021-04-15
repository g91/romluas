function LuaI_110147_Zone6()
	SetPlot( OwnerID() , "range" , "LuaQ_420270_Touch" , 40 )
	SetPlot( OwnerID() , "touch" , "LuaFunc_Obj_Nothing" , 40 )
end
------------------------------------------------------------------------------------------------
function LuaQ_420270_Touch()
	SetPlot( OwnerID() , "range" , "" , 0 )
	BegingPlot( TargetID() , "LuaQ_420270_Battle" , 0 )
end
------------------------------------------------------------------------------------------------
function LuaQ_420270_Battle()
	Say( TargetID() , GetString("SAY_110147_16") ) --/*歡迎來到喀里恩神殿！
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SALUTE )
	sleep( 30 )
	Say( TargetID() , GetString("SAY_110147_17") ) --/*我很樂意讓你們的屍體留在這個地方。
	SetRoleCamp( OwnerID() , "Monster" )
	SetPlot( OwnerID() , "dead" , "LuaQ_420270_Dead" , 40 )
end
------------------------------------------------------------------------------------------------
function LuaQ_420270_Dead()
	local KerlBull = CreateObjByFlag(110347,780038,0,1)
	BeginPlot( KerlBull , "LuaQ_420270_Play" , 0 )
end
------------------------------------------------------------------------------------------------
function LuaQ_420270_Play()
	local RoomID = ReadRoleValue( TargetID() , EM_RoleValue_RoomID )
	SetPosture( OwnerID(), 8 , ruFUSION_ACTORSTATE_DYING );
	sleep( 30 )
	AddToPartition( OwnerID() , RoomID ) 
	SetPlot( OwnerID() ,"touch","LuaQ_420270_Safe" , 0 )
end
------------------------------------------------------------------------------------------------
function LuaQ_420270_Safe()
	SetPlot( TargetID() , "touch" ,"LuaFunc_Obj_Nothing" , 0 )
	PlayMotion( TargetID() ,ruFUSION_ACTORSTATE_SLEEP_END )
	sleep( 30 )
	SetPlot( TargetID() , "touch" ,"" , 0 )
end
------------------------------------------------------------------------------------------------
function LuaQ_420271_Accept()
	DelBodyItem( TargetID() , 201012 , 1 )
	Say( OwnerID() , GetString("SAY_110347_0") ) --/*艾德雷就拜託你了！符文盤我會負責安全帶回去的！
end