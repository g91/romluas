
--����t��§��
Function LuaI_203481(Option)
	local PlayerID = OwnerID()
	local PackageID = 203481
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
				GiveBodyItem( PlayerID , 200230 , 50 )		--200230 �����q	50
			elseif randA<= 3+4 then
				GiveBodyItem( PlayerID , 200293 , 50)		--200293 ����	50
			elseif randA<= 7+4 then
				GiveBodyItem( PlayerID ,200335, 50)		--200335 �s�]����		50
			elseif randA<= 14 then
				GiveBodyItem( PlayerID , 203281 , 20 )		--203281 ���J�O�}	10
			elseif randA<= 17 then
				GiveBodyItem( PlayerID , 203282 , 20)		--203282 �δο}	10
			elseif randA<= 18 then
				GiveBodyItem( PlayerID , 203482, 1 )		--���t��§�� 1
			elseif randA<= 19 then
				GiveBodyItem( PlayerID , 203483 , 1 )		--����t��§�� 1	
			else
			end
	end

end