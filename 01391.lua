------------------------------------------------------------------------------
--2009/11/04
--�¤Ѱ����M�]x2

--2009/10/26 �s�W
--2�ӱ������M

--2009/10/21 �s�W
--2�Ӳr�����M�]
--2�ӳD�V�s���M�]

-- 2009/06/03 �s�W
--18�ӳ��ާ��M�]
--8�ӵR�����M�]
------------------------------------------------------------------------------
--���M  204288     7�ѷ�l���M�]
------------------------------------------------------------------------------
function LuaI_204288( Option )
	local PlayerID = OwnerID()
	local PackageID = 204288		--7�ѷ�l���M�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 204282 , 1 )	
	end
end
------------------------------------------------------------------------------
--���M  204289     30�ѷ�l���M�]
------------------------------------------------------------------------------
function LuaI_204289( Option )
	local PlayerID = OwnerID()
	local PackageID = 204289		--30�ѷ�l���M�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 204283 , 1 )	
	end
end
------------------------------------------------------------------------------
--���M  204290     7�Ѷ·৤�M�]
------------------------------------------------------------------------------
function LuaI_204290( Option )
	local PlayerID = OwnerID()
	local PackageID = 204290		--7�Ѷ·৤�M�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 204285 , 1 )	
	end
end
------------------------------------------------------------------------------
--���M  204291     30�Ѷ·৤�M�]
------------------------------------------------------------------------------
function LuaI_204291( Option )
	local PlayerID = OwnerID()
	local PackageID = 204291		--30�Ѷ·৤�M�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 204286 , 1 )	
	end
end
------------------------------------------------------------------------------
--���M  204294     7�ѳ��ާ��M�]
------------------------------------------------------------------------------
function LuaI_204294( Option )
	local PlayerID = OwnerID()
	local PackageID = 204294		--7�ѳ��ާ��M�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 204293 , 1 )	
	end
end
------------------------------------------------------------------------------
--���M  204295     30�ѳ��ާ��M�]
------------------------------------------------------------------------------
function LuaI_204295( Option )
	local PlayerID = OwnerID()
	local PackageID = 204295		--30�ѳ��ާ��M�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 204292 , 1 )	
	end
end
------------------------------------------------------------------------------
--���M  204977     7�ѵ��O���ާ��M�]
------------------------------------------------------------------------------
function LuaI_204977( Option )
	local PlayerID = OwnerID()
	local PackageID = 204977		--7�ѵ��O���ާ��M�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 204931 , 1 )	
	end
end
------------------------------------------------------------------------------
--���M  204978     30�ѵ��O���ާ��M�]
------------------------------------------------------------------------------
function LuaI_204978( Option )
	local PlayerID = OwnerID()
	local PackageID = 204978		--30�ѵ��O���ާ��M�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 204930 , 1 )	
	end
end
------------------------------------------------------------------------------
--���M  204979     7�Ѭ��O���ާ��M�]
------------------------------------------------------------------------------
function LuaI_204979( Option )
	local PlayerID = OwnerID()
	local PackageID = 204979		--7�Ѭ��O���ާ��M�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 204934 , 1 )	
	end
end
------------------------------------------------------------------------------
--���M  204982     30�Ѭ��O���ާ��M�]
------------------------------------------------------------------------------
function LuaI_204982( Option )
	local PlayerID = OwnerID()
	local PackageID = 204982		--30�Ѭ��O���ާ��M�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 204933 , 1 )	
	end
end
------------------------------------------------------------------------------
--���M  204983    7�Ѫ��O���ާ��M�]
------------------------------------------------------------------------------
function LuaI_204983( Option )
	local PlayerID = OwnerID()
	local PackageID = 204983		--7�Ѫ��O���ާ��M�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 204937 , 1 )	
	end
end
------------------------------------------------------------------------------
--���M  204984    30�Ѫ��O���ާ��M�]
------------------------------------------------------------------------------
function LuaI_204984( Option )
	local PlayerID = OwnerID()
	local PackageID = 204984		--30�Ѫ��O���ާ��M�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 204936 , 1 )	
	end
end
------------------------------------------------------------------------------
--���M  204985    7�ѦB�쳥�ާ��M�]
------------------------------------------------------------------------------
function LuaI_204985( Option )
	local PlayerID = OwnerID()
	local PackageID = 204985		--7�ѦB�쳥�ާ��M�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 204940 , 1 )	
	end
end
------------------------------------------------------------------------------
--���M  204986    30�ѦB�쳥�ާ��M�]
------------------------------------------------------------------------------
function LuaI_204986( Option )
	local PlayerID = OwnerID()
	local PackageID = 204986		--30�ѦB�쳥�ާ��M�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 204939 , 1 )	
	end
end
------------------------------------------------------------------------------
--���M  204987   7�ѷ��a���ާ��M�]
------------------------------------------------------------------------------
function LuaI_204987( Option )
	local PlayerID = OwnerID()
	local PackageID = 204987		--7�ѷ��a���ާ��M�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 204943 , 1 )	
	end
end
------------------------------------------------------------------------------
--���M  204988   30�ѷ��a���ާ��M�]
------------------------------------------------------------------------------
function LuaI_204988( Option )
	local PlayerID = OwnerID()
	local PackageID = 204988		--30�ѷ��a���ާ��M�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 204942 , 1 )	
	end
end
------------------------------------------------------------------------------
--���M  204989   7�Ѫᴳ���ާ��M�]
------------------------------------------------------------------------------
function LuaI_204989( Option )
	local PlayerID = OwnerID()
	local PackageID = 204989		--7�Ѫᴳ���ާ��M�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 204946 , 1 )	
	end
end
------------------------------------------------------------------------------
--���M  204990   30�Ѫᴳ���ާ��M�]
------------------------------------------------------------------------------
function LuaI_204990( Option )
	local PlayerID = OwnerID()
	local PackageID = 204990		--30�Ѫᴳ���ާ��M�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 204945 , 1 )	
	end
end
------------------------------------------------------------------------------
--���M  204991   7�Ѵ������ާ��M�]
------------------------------------------------------------------------------
function LuaI_204991( Option )
	local PlayerID = OwnerID()
	local PackageID = 204991		--7�Ѵ������ާ��M�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 204952 , 1 )	
	end
end
------------------------------------------------------------------------------
--���M  204992   30�Ѵ������ާ��M�]
------------------------------------------------------------------------------
function LuaI_204992( Option )
	local PlayerID = OwnerID()
	local PackageID = 204992		--30�Ѵ������ާ��M�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 204951 , 1 )	
	end
end
------------------------------------------------------------------------------
--���M  204993  7�Ѩ��K���ާ��M�]
------------------------------------------------------------------------------
function LuaI_204993( Option )
	local PlayerID = OwnerID()
	local PackageID = 204993		--7�Ѩ��K���ާ��M�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 204955 , 1 )	
	end
end
------------------------------------------------------------------------------
--���M  204994   30�Ѩ��K���ާ��M�]
------------------------------------------------------------------------------
function LuaI_204994( Option )
	local PlayerID = OwnerID()
	local PackageID = 204994		--30�Ѩ��K���ާ��M�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 204954 , 1 )	
	end
end
------------------------------------------------------------------------------
--���M  204995  7�Ѷ��O���ާ��M�]
------------------------------------------------------------------------------
function LuaI_204995( Option )
	local PlayerID = OwnerID()
	local PackageID = 204995		--7�Ѷ��O���ާ��M�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 204958 , 1 )	
	end
end
------------------------------------------------------------------------------
--���M  204996  30�Ѷ��O���ާ��M�]
------------------------------------------------------------------------------
function LuaI_204996( Option )
	local PlayerID = OwnerID()
	local PackageID = 204996		--30�Ѷ��O���ާ��M�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 204957 , 1 )	
	end
end
------------------------------------------------------------------------------
--���M  204947  7�ѦǦ�먤�R�����M�]
------------------------------------------------------------------------------
function LuaI_204947( Option )
	local PlayerID = OwnerID()
	local PackageID = 204947		--7�ѦǦ�먤�R�����M�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 204961 , 1 )	
	end
end
------------------------------------------------------------------------------
--���M  204948  30�ѦǦ�먤�R�����M�]
------------------------------------------------------------------------------
function LuaI_204948( Option )
	local PlayerID = OwnerID()
	local PackageID = 204948		--30�ѦǦ�먤�R�����M�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 204960 , 1 )	
	end
end
------------------------------------------------------------------------------
--���M  204971  7�Ѻ񳥨먤�R�����M�]
------------------------------------------------------------------------------
function LuaI_204971( Option )
	local PlayerID = OwnerID()
	local PackageID = 204971		--7�Ѻ񳥨먤�R�����M�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 204964 , 1 )	
	end
end
------------------------------------------------------------------------------
--���M  204972  30�Ѻ񳥨먤�R�����M�]
------------------------------------------------------------------------------
function LuaI_204972( Option )
	local PlayerID = OwnerID()
	local PackageID = 204972		--30�Ѻ񳥨먤�R�����M�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 204963 , 1 )	
	end
end
------------------------------------------------------------------------------
--���M  204973  7�Ѻʹ��먤�R�����M�]
------------------------------------------------------------------------------
function LuaI_204973( Option )
	local PlayerID = OwnerID()
	local PackageID = 204973		--7�Ѻʹ��먤�R�����M�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 204967 , 1 )	
	end
end
------------------------------------------------------------------------------
--���M  204974  30�Ѻʹ��먤�R�����M�]
------------------------------------------------------------------------------
function LuaI_204974( Option )
	local PlayerID = OwnerID()
	local PackageID = 204974		--30�Ѻʹ��먤�R�����M�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 204966 , 1 )	
	end
end
------------------------------------------------------------------------------
--���M  204975  7�ѥզ�먤�R�����M�]
------------------------------------------------------------------------------
function LuaI_204975( Option )
	local PlayerID = OwnerID()
	local PackageID = 204975		--7�ѥզ�먤�R�����M�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 204970 , 1 )	
	end
end
------------------------------------------------------------------------------
--���M  204976  30�ѥզ�먤�R�����M�]
------------------------------------------------------------------------------
function LuaI_204976( Option )
	local PlayerID = OwnerID()
	local PackageID = 204976		--30�ѥզ�먤�R�����M�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 204969 , 1 )	
	end
end

------------------------------------------------------------------------------
--���M  206208   30�Ѩg�b�r�����M�]
------------------------------------------------------------------------------
function LuaI_206208( Option )
	local PlayerID = OwnerID()
	local PackageID = 206208		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206197 , 1 )	
	end
end
------------------------------------------------------------------------------
--���M  206209  7�Ѩg�b�r�����M�]
------------------------------------------------------------------------------
function LuaI_206209( Option )
	local PlayerID = OwnerID()
	local PackageID = 206209		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206198 , 1 )	
	end
end
------------------------------------------------------------------------------
--���M  206210 30�ѯ��r�����M�]
------------------------------------------------------------------------------
function LuaI_206210( Option )
	local PlayerID = OwnerID()
	local PackageID = 206210		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206200 , 1 )	
	end
end
------------------------------------------------------------------------------
--���M  206211  7�ѯ��r�����M�]
------------------------------------------------------------------------------
function LuaI_206211( Option )
	local PlayerID = OwnerID()
	local PackageID = 206211		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID ,206201 , 1 )	
	end
end
------------------------------------------------------------------------------
--���M  206212   30�ѼC�b�D�V�s���M�]
------------------------------------------------------------------------------
function LuaI_206212( Option )
	local PlayerID = OwnerID()
	local PackageID = 206212		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206203 , 1 )	
	end
end
------------------------------------------------------------------------------
--���M  206213   7�ѼC�b�D�V�s���M�]
------------------------------------------------------------------------------
function LuaI_206213( Option )
	local PlayerID = OwnerID()
	local PackageID =206213		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206204 , 1 )	
	end
end
------------------------------------------------------------------------------
--���M  206214  30�Ѩ��D�V�s���M�]
------------------------------------------------------------------------------
function LuaI_206214( Option )
	local PlayerID = OwnerID()
	local PackageID = 206214		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206206 , 1 )	
	end
end
------------------------------------------------------------------------------
--���M  206215    7�Ѩ��D�V�s���M�]
------------------------------------------------------------------------------
function LuaI_206215( Option )
	local PlayerID = OwnerID()
	local PackageID = 206215		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206207 , 1 )	
	end
end
------------------------------------------------------------------------------
--���M  206241    7�ѻ��R����999���M�]
------------------------------------------------------------------------------
function LuaI_206241( Option )
	local PlayerID = OwnerID()
	local PackageID = 206241		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206236 , 1 )	
	end
end
------------------------------------------------------------------------------
--���M  206240    30�ѻ��R����999���M�]
------------------------------------------------------------------------------
function LuaI_206240( Option )
	local PlayerID = OwnerID()
	local PackageID = 206240		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206235 , 1 )	
	end
end
------------------------------------------------------------------------------
--���M  206243    7�ѷo�J3000���M�]
------------------------------------------------------------------------------
function LuaI_206243( Option )
	local PlayerID = OwnerID()
	local PackageID = 206243		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206239 , 1 )	
	end
end
------------------------------------------------------------------------------
--���M  206242   30�ѷo�J3000���M�]
------------------------------------------------------------------------------
function LuaI_206242( Option )
	local PlayerID = OwnerID()
	local PackageID = 206242		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206238 , 1 )	
	end
end

------------------------------------------------------------------------------
--���M  205748   30�Ѷ¤Ѱ����M�]
------------------------------------------------------------------------------
function LuaI_205748( Option )
	local PlayerID = OwnerID()
	local PackageID = 205748		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 204997 , 1 )	
	end
end

------------------------------------------------------------------------------
--���M  205749   7�Ѷ¤Ѱ����M�]
------------------------------------------------------------------------------
function LuaI_205749( Option )
	local PlayerID = OwnerID()
	local PackageID = 205749		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 204998 , 1 )	
	end
end

------------------------------------------------------------------------------
--���M  206574   7�ѷҺ����⧤�M�]
------------------------------------------------------------------------------
function LuaI_206574( Option )
	local PlayerID = OwnerID()
	local PackageID = 206574		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206556 , 1 )	
	end
end

------------------------------------------------------------------------------
--���M  206575   30�ѷҺ����⧤�M�]
------------------------------------------------------------------------------
function LuaI_206575( Option )
	local PlayerID = OwnerID()
	local PackageID = 206575		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206557 , 1 )	
	end
end

------------------------------------------------------------------------------
--���M  206576   7�ѫխ߹��L���M�]
------------------------------------------------------------------------------
function LuaI_206576( Option )
	local PlayerID = OwnerID()
	local PackageID = 206576		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206559 , 1 )	
	end
end

------------------------------------------------------------------------------
--���M  206577   30�ѫխ߹��L���M�]
------------------------------------------------------------------------------
function LuaI_206577( Option )
	local PlayerID = OwnerID()
	local PackageID = 206577		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206560 , 1 )	
	end
end

------------------------------------------------------------------------------
--���M  206584   7�ѻa�����L���M�]
------------------------------------------------------------------------------
function LuaI_206584( Option )
	local PlayerID = OwnerID()
	local PackageID = 206584		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206571 , 1 )	
	end
end

------------------------------------------------------------------------------
--���M  206585   30�ѻa�����L���M�]
------------------------------------------------------------------------------
function LuaI_206585( Option )
	local PlayerID = OwnerID()
	local PackageID = 206585		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206572 , 1 )	
	end
end

------------------------------------------------------------------------------
--���M  206582   7�Ѫ��V���L���M�]
------------------------------------------------------------------------------
function LuaI_206582( Option )
	local PlayerID = OwnerID()
	local PackageID = 206582		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206568 , 1 )	
	end
end

------------------------------------------------------------------------------
--���M  206583   30�Ѫ��V���L���M�]
------------------------------------------------------------------------------
function LuaI_206583( Option )
	local PlayerID = OwnerID()
	local PackageID = 206583		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206569 , 1 )	
	end
end

------------------------------------------------------------------------------
--���M  206580   7�Ѳ`�W���L���M�]
------------------------------------------------------------------------------
function LuaI_206580( Option )
	local PlayerID = OwnerID()
	local PackageID = 206580		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206565 , 1 )	
	end
end

------------------------------------------------------------------------------
--���M  206581   30�Ѳ`�W���L���M�]
------------------------------------------------------------------------------
function LuaI_206581( Option )
	local PlayerID = OwnerID()
	local PackageID = 206581		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206566 , 1 )	
	end
end

------------------------------------------------------------------------------
--���M  206578   7���]����L���M�]
------------------------------------------------------------------------------
function LuaI_206578( Option )
	local PlayerID = OwnerID()
	local PackageID = 206578		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206562 , 1 )	
	end
end

------------------------------------------------------------------------------
--���M  206579   30���]����L���M�]
------------------------------------------------------------------------------
function LuaI_206579( Option )
	local PlayerID = OwnerID()
	local PackageID = 206579		--�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206563 , 1 )	
	end
end