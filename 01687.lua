------------------------------------------------------------------------------
--2009/12/15
--1�Ӿ԰����M
--2010/01/08
--�ۼv���I�B������I�B�s��Ծs�B�Ȫe�Ѱ�
--2010/02/06
--�������j
--2010/02/11
--�����N���~�B�N�����C��B�ů���L�B���j�r��
------------------------------------------------------------------------------

------------------------------------------------------------------------------
--���M  206597   7�ѿ��K�԰����M�]
------------------------------------------------------------------------------
function LuaI_206597( Option )
	local PlayerID = OwnerID()
	local PackageID = 206597		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206594 , 1 )	
	end
end
------------------------------------------------------------------------------
--���M  206598   30�ѿ��K�԰����M�]
------------------------------------------------------------------------------
function LuaI_206598( Option )
	local PlayerID = OwnerID()
	local PackageID = 206598		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206595 , 1 )	
	end
end
------------------------------------------------------------------------------
--���M  206721   7�� �ۼv���I���M�]
------------------------------------------------------------------------------
function LuaI_206721( Option )
	local PlayerID = OwnerID()
	local PackageID = 206721		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206715 , 1 )	
	end
end
------------------------------------------------------------------------------
--���M  206722   30�Ѥۼv���I���M�]
------------------------------------------------------------------------------
function LuaI_206722( Option )
	local PlayerID = OwnerID()
	local PackageID = 206722		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206716 , 1 )	
	end
end
------------------------------------------------------------------------------
--���M  206723   7�� ������I���M�]
------------------------------------------------------------------------------
function LuaI_206723( Option )
	local PlayerID = OwnerID()
	local PackageID = 206723		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206718 , 1 )	
	end
end
------------------------------------------------------------------------------
--���M  206724   30�ѱ�����I���M�]
------------------------------------------------------------------------------
function LuaI_206724( Option )
	local PlayerID = OwnerID()
	local PackageID = 206724		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206719 , 1 )	
	end
end
------------------------------------------------------------------------------
--���M  206711   7�� �s��Ծs���M�]
------------------------------------------------------------------------------
function LuaI_206711( Option )
	local PlayerID = OwnerID()
	local PackageID = 206711		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206705 , 1 )	
	end
end
------------------------------------------------------------------------------
--���M  206712   30���s��Ծs���M�]
------------------------------------------------------------------------------
function LuaI_206712( Option )
	local PlayerID = OwnerID()
	local PackageID = 206712		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206706 , 1 )	
	end
end
------------------------------------------------------------------------------
--���M  206713   7�� �Ȫe�Ѱ����M�]
------------------------------------------------------------------------------
function LuaI_206713( Option )
	local PlayerID = OwnerID()
	local PackageID = 206713		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206708 , 1 )	
	end
end
------------------------------------------------------------------------------
--���M  206714   30�ѻȪe�Ѱ����M�]
------------------------------------------------------------------------------
function LuaI_206714( Option )
	local PlayerID = OwnerID()
	local PackageID = 206714		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206709 , 1 )	
	end
end
------------------------------------------------------------------------------
--���M  206907   7�� �������j���M�]
------------------------------------------------------------------------------
function LuaI_206907( Option )
	local PlayerID = OwnerID()
	local PackageID = 206907		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206904 , 1 )	
	end
end
------------------------------------------------------------------------------
--���M  206908   30�ѻ������j���M�]
------------------------------------------------------------------------------
function LuaI_206908( Option )
	local PlayerID = OwnerID()
	local PackageID = 206908		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206905 , 1 )	
	end
end
------------------------------------------------------------------------------
--���M  206937   7�� �ɭ��N���~���M�]
------------------------------------------------------------------------------
function LuaI_206937( Option )
	local PlayerID = OwnerID()
	local PackageID = 206937		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206934 , 1 )	
	end
end
------------------------------------------------------------------------------
--���M  206938   30�Ѽɭ��N���~���M�]
------------------------------------------------------------------------------
function LuaI_206938( Option )
	local PlayerID = OwnerID()
	local PackageID = 206938		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206935 , 1 )	
	end
end
------------------------------------------------------------------------------
--���M  206942   7�� �N�����C���M�]
------------------------------------------------------------------------------
function LuaI_206942( Option )
	local PlayerID = OwnerID()
	local PackageID = 206942		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206939 , 1 )	
	end
end
------------------------------------------------------------------------------
--���M  206943   30���N�����C���M�]
------------------------------------------------------------------------------
function LuaI_206943( Option )
	local PlayerID = OwnerID()
	local PackageID = 206943		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206940 , 1 )	
	end
end
------------------------------------------------------------------------------
--���M  206947   7�Ѳů���L���M�]
------------------------------------------------------------------------------
function LuaI_206947( Option )
	local PlayerID = OwnerID()
	local PackageID = 206947		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206944 , 1 )	
	end
end
------------------------------------------------------------------------------
--���M  206948   30�Ѳů���L���M�]
------------------------------------------------------------------------------
function LuaI_206948( Option )
	local PlayerID = OwnerID()
	local PackageID = 206948		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206945 , 1 )	
	end
end
------------------------------------------------------------------------------
--���M  206952   7�ѻ��j�r�����M�]
------------------------------------------------------------------------------
function LuaI_206952( Option )
	local PlayerID = OwnerID()
	local PackageID = 206952		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206949 , 1 )	
	end
end
------------------------------------------------------------------------------
--���M  206953   30�ѻ��j�r�����M�]
------------------------------------------------------------------------------
function LuaI_206953( Option )
	local PlayerID = OwnerID()
	local PackageID = 206953		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206950 , 1 )	
	end
end