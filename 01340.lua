--�`�y���� 2009�~5��R�ָ` 
--�إ߮ɶ�: 2009/05/06
--�ק���: 2009/05/06
--�إߪ�  : ���ʥ��� ��ʨ�
------------------------------------------------------------------------------
--���M  204280     7�Ѷ¦�먤�R�����M�]
------------------------------------------------------------------------------
function LuaI_204280( Option )
	local PlayerID = OwnerID()
	local PackageID = 204280		--7�Ѷ¦�먤�R�����M�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 724471 , 1 )	
	end
end
------------------------------------------------------------------------------
--���M  204281     30�Ѷ¦�먤�R�����M�]
------------------------------------------------------------------------------
function LuaI_204281( Option )
	local PlayerID = OwnerID()
	local PackageID = 204281		--30�Ѷ¦�먤�R�����M�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 724472 , 1 )	
	end
end