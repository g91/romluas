function Sys_TeleportObj_Init()
	SetPlot( OwnerID() , "touch" , "Sys_TeleportObj_Touch" , 50 )
end

function Sys_TeleportObj_Touch()
	local ObjName = GetName( TargetID() )
	local PID = ReadRoleValue( TargetID() , EM_RoleValue_PID )
	local String 
	if PID == 0 then
		String= "[SC_TELEPORTOBJ_DIALOG1][$SETVAR1="..ObjName.."]"
	elseif PID == 1 then
		String= "[SC_TELEPORTOBJ_DIALOG2]"
	else
		String= "[SC_TELEPORTOBJ_DIALOG][$SETVAR1="..ObjName.."]"
	end
	if CheckBuff( OwnerID() , 501570) == false then  --增加檢查判斷

		DialogCreate( OwnerID() , EM_LuaDialogType_YesNo  , String);
		DialogSelectStr( OwnerID() , GetString("SO_YES") );
		DialogSelectStr( OwnerID() , GetString("SO_NO") );
		AddBuff(OwnerID() , 501570,0,-1);--然後給予BUFF

		if( DialogSendOpen( OwnerID() ) == false ) then 
			ScriptMessage( OwnerID(),OwnerID(),1,GetString("SYS_FIXEQ_DATA_ERROR"),0)	
			--資料送出有問題
			return 0
		end
		
		local SelectID = EX_GetDialogResoult( OwnerID(), 30 , 50 , TargetID() )
		DialogClose( OwnerID() )
		CancelBuff( OwnerID(), 501570 );--最後清除BUFF

		if SelectID == 0  then
			GoReturnPosByNPC( TargetID() , OwnerID() )
			return 1
		elseif SelectID == 1  then
			return 0
		else 
			return 0
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	end
end