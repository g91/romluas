function LuaI_205687_BOX( Option )

	local PlayerID = OwnerID()
	local PackageID = 206619		--��⪺������X
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )


	if ( Option == "CHECK" ) then
		local KEY =  CountBodyItem( PlayerID , 203178 ) --�j�Ѫ��_��
		if ( NeedSpaceStatus  == false ) then

			ScriptMessage( PlayerID, PlayerID, 0, "[SC_TREASURE_NOSPACE]", 0 )	--�A���I�]�Ŷ�����
			ScriptMessage( PlayerID, PlayerID, 1, "[SC_TREASURE_NOSPACE]", 0 )
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) and KEY > 0 then
			return true
		else
			ScriptMessage( PlayerID, PlayerID, 0, "[SC_TREASURE_NOKEY]", 0 )		--�A�S���j�Ѫ��_��
			ScriptMessage( PlayerID, PlayerID, 1, "[SC_TREASURE_NOKEY]", 0 )
			return false
		end
	elseif ( Option == "USE" ) then

		GiveBodyItem( PlayerID , 720616 , 1 )	
		DelBodyItem( PlayerID , 203178 , 1 )

	end
end