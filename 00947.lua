function LuaI_YU_stone2( Option )
	local PlayerID = OwnerID()
	local PackageID = 203267	-- 高級符文鑑定捲軸
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	local Creash =  CountBodyItem( PlayerID , 203034 ) --神祕的符文碎片
	local gechi01 =  CountBodyItem( PlayerID , 203268 ) --傀奇碎片

	local Playername = "|cffffff20"..GetName( OwnerID() ).."|r"
	local str = "[SC_101222_YU_43][$SETVAR1="..Playername.."]"

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) and Creash >= 1 then
			return true
		else
			return false
		end
	elseif ( Option == "USE" ) then

		DelBodyItem( PlayerID , 203034 , 1 )
		sleep(10)
		GiveBodyItem( PlayerID , 724253 , 1 )	
		sleep(20)	
		local gechi02 =  CountBodyItem( PlayerID , 203268 ) --傀奇碎片		
		
		if gechi02 == gechi01+1 then
			RunningMsg( OwnerID() , 2 ,  Str )--在鑑定<CP>[203034]</CP>的過程中，[$VAR1]幸運地鑑定出<CP>[203268]</CP>!
		end
		sleep(10)		

	end
end