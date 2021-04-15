function LuaI_114613_0()
	local Flag =780565
	local MM1 = CreateObjByFlag( 114617 , Flag , 1 , 1 )
	local MM2 = CreateObjByFlag( 114618 , Flag , 2 , 1 )
	local MM3 = CreateObjByFlag( 114619 , Flag , 3 , 1 )
	local MM4 = CreateObjByFlag( 114620 , Flag , 4 , 1 )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register + 1, MM1 )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register + 2  , MM2 )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register + 3  , MM3 )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register + 4  , MM4 )
	AddToPartition( MM1 , RoomID )
	AddToPartition( MM2 , RoomID )
	AddToPartition( MM3 , RoomID )
	AddToPartition( MM4 , RoomID )
	SetModeEx(MM1 ,EM_SetModeType_ShowRoleHead ,true) -----------秀出頭像框
	SetModeEx(MM1 ,EM_SetModeType_HideName ,false) -----------秀出名稱

	SetModeEx(MM2 ,EM_SetModeType_ShowRoleHead ,true) -----------秀出頭像框
	SetModeEx(MM2 ,EM_SetModeType_HideName ,false) -----------秀出名稱


	SetModeEx(MM3 ,EM_SetModeType_ShowRoleHead ,true) -----------秀出頭像框
	SetModeEx(MM3 ,EM_SetModeType_HideName ,false) -----------秀出名稱


	SetModeEx(MM4 ,EM_SetModeType_ShowRoleHead ,true) -----------秀出頭像框
	SetModeEx(MM4 ,EM_SetModeType_HideName ,false) -----------秀出名稱

end

function LuaI_423048_1( )
	CloseSpeak( TargetID() )
	DisableQuest( OwnerID() , true )
	local MM1 = ReadRoleValue( OwnerID() , EM_RoleValue_Register + 1 )
	local MM2 = ReadRoleValue( OwnerID() , EM_RoleValue_Register + 2 )
	local MM3 = ReadRoleValue( OwnerID() , EM_RoleValue_Register + 3 )
	local MM4 = ReadRoleValue( OwnerID() , EM_RoleValue_Register + 4 )
	sleep(10)
	Yell( OwnerID()  , "[SC_423048_8]" , 3 )--你們都平安無事，太好了！
	PlayMotion(  OwnerID() , ruFUSION_ACTORSTATE_EMOTE_CRY )
	sleep(30)
	BeginPlot(MM1, "LuaI_423048_2" , 0 )
	BeginPlot(MM2, "LuaI_423048_2" , 0 )
	BeginPlot(MM3, "LuaI_423048_2" , 0 )
	BeginPlot(MM4, "LuaI_423048_2" , 0 )
	sleep(50)
	Yell( OwnerID()  , "[SC_423048_10]" , 3 )
	PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	DisableQuest( OwnerID() , false )
end
function LuaI_423048_2( )
	DisableQuest( OwnerID() , true )
	Yell( OwnerID()  , "[SC_423048_9]" , 3 )
	PlayMotion(  OwnerID() ,  ruFUSION_ACTORSTATE_EMOTE_IDLE1)	
	sleep(20)
	DisableQuest( OwnerID() , false )
end


function LuaI_423042_0()---潘尼西亞寶物
 	SetPlot( OwnerID() , "Range" , "LuaI_423042_1" , 50 )
end
function LuaI_423042_1()
	if(CheckAcceptQuest( OwnerID() , 423042 ) == true ) and (CheckFlag(OwnerID(),543763)==false) then
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423042_1]" , 0 )---
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423042_1]" , 0 )---
		SetFlag(OwnerID() ,543763, 1 )--
	end
end
