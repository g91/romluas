--���t��§��
Function LuaI_203482(Option)
	local PlayerID = OwnerID()
	local PackageID = 203482
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		local randA= rand(20)
			if randA<= 3 then
				GiveBodyItem( PlayerID , 200232  , 70 )	--200232 ���q	70
			elseif randA<= 7 then
				GiveBodyItem( PlayerID , 200295 , 70)		--200295 �h��	70
			elseif randA<= 11 then
				GiveBodyItem( PlayerID ,200334, 70)		--200334 ���߯�	70
			elseif randA<= 14 then
				GiveBodyItem( PlayerID , 203281 , 30 )		--203281 ���J�O�}	30
			elseif randA<= 17 then
				GiveBodyItem( PlayerID , 203282, 30)		--203282 �δο}	30
			elseif randA<= 18 then
				GiveBodyItem( PlayerID , 203483, 1 )		--����t��§��	1
			elseif randA<= 19 then
				GiveBodyItem( PlayerID , 203481 , 1 )		--����t��§��	1		

			end
	end

end