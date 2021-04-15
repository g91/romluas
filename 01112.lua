function LuaS_203414( Option )

	local Player = OwnerID()
	local PackageID = 203414

	if ( Option == "CHECK" ) then
		if ( CountBodyItem( Player , PackageID ) >= 1 ) then
			if CountBodyItem( Player , 203413 ) >= 1 then	-- 未知種子
				return true
			else
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_203414_1]" , 0 )	--  你沒有可以種植的未知種子！！
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_203414_1]" , C_DEFAULT )
				return false
			end
		else
			return false
		end
	elseif ( Option == "USE" ) then
		if DelBodyItem( Player , 203413 , 1 ) then
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_203414_2]" , 0 )	--  你將未知種子種植在泥土培育袋裡！！
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_203414_2]" , C_SYSTEM )

			local R = Rand( 100 ) + 1
			if R >= 0 and R < 40 then
				GiveBodyItem( Player , 203429 , 1 )
			elseif R >= 40 and R < 55 then
				GiveBodyItem( Player , 200334 , 1 )
			elseif R >= 55 and R < 70 then
				GiveBodyItem( Player , 200335 , 1 )
			elseif R >= 70 and R < 85 then
				GiveBodyItem( Player , 200338 , 1 )
			else
				GiveBodyItem( Player , 200342 , 1 )
			end
		end
	end

end