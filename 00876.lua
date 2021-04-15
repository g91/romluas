function YUYULua_100175_0()
	local GAHO = LuaFunc_SearchNPCbyOrgID( OwnerID(), 100586, 200 , 1) 
	local coolbo = LuaFunc_SearchNPCbyOrgID(OwnerID(), 100044, 200 , 1) 
	local HunPID = LuaFunc_SearchNPCbyOrgID(OwnerID(), 101047, 200 , 1) 

	WriteRoleValue( OwnerID() , EM_RoleValue_PID , coolbo[0] )
	WriteRoleValue( HunPID[0]  , EM_RoleValue_PID , OwnerID() )

--	WriteRoleValue(coolbo[0] ,EM_RoleValue_Register ,GAHO[0] )
--	WriteRoleValue(coolbo[0] ,EM_RoleValue_Register+1 ,GAHO[1] )
--	WriteRoleValue(coolbo[0] ,EM_RoleValue_Register+2 ,GAHO[2] )
--	WriteRoleValue(coolbo[0] ,EM_RoleValue_Register+3 ,GAHO[3] )
--	WriteRoleValue(coolbo[0] ,EM_RoleValue_Register+4 ,GAHO[4] )

	SetPlot(  OwnerID() , "dead","YUYULua_100175_1",0 )

end

function YUYULua_100175_1()
		local coolbo = ReadRoleValue( OwnerID(), EM_RoleValue_PID ) 
		Delobj( OwnerID() )
		BeginPlot( coolbo , "YUYULua_100175_2" , 0 )  
end


function YUYULua_100175_2()
	local GAHO = LuaFunc_SearchNPCbyOrgID( OwnerID(), 100586, 200 , 1) 

--	local GAHO[0] = ReadRoleValue( OwnerID(), EM_RoleValue_Register ) 
--	local GAHO[1] = ReadRoleValue( OwnerID(), EM_RoleValue_Register+1 ) 
--	local GAHO[2] = ReadRoleValue( OwnerID(), EM_RoleValue_Register+2 ) 
--	local GAHO[3] = ReadRoleValue( OwnerID(), EM_RoleValue_Register+3 ) 
--	local GAHO[4] = ReadRoleValue( OwnerID(), EM_RoleValue_Register+4 ) 


		if ReadRoleValue( GAHO[0] , EM_RoleValue_IsDead ) ~= 1 and CheckID( GAHO[0] ) ~= nil then	
			Say( GAHO[0] , GetString("SC_100175_YU_00") )   

		elseif  ReadRoleValue( GAHO[1] , EM_RoleValue_IsDead ) ~= 1 and CheckID( GAHO[1] ) ~= nil then 
			Say( GAHO[1] , GetString("SC_100175_YU_00") )   

		elseif  ReadRoleValue( GAHO[2] , EM_RoleValue_IsDead ) ~= 1 and CheckID( GAHO[2] ) ~= nil then 
			Say( GAHO[2] , GetString("SC_100175_YU_00") )   

		elseif  ReadRoleValue( GAHO[3] , EM_RoleValue_IsDead ) ~= 1 and CheckID( GAHO[3] ) ~= nil then 
			Say( GAHO[3] , GetString("SC_100175_YU_00") )   

		elseif  ReadRoleValue( GAHO[4] , EM_RoleValue_IsDead ) ~= 1 and CheckID( GAHO[4] ) ~= nil then 
			Say( GAHO[4] , GetString("SC_100175_YU_00") )   
		end

	sleep(20)
	ScriptMessage(OwnerID() , -1 , 1 , GetString("SC_100175_YU_01") , C_SYSTEM )
	sleep(10)


-- 系統訊息。(發話人，受話人，顯示方式) ( 受話人，0為周圍都可聽到，0 為對話訊息框輸出, 1 為畫面中間警告輸出，-1為全zone ) C_SYSTEM 代表黃色 C_Default 代表紅色 

end