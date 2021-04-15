------------------------------------------------------------------------------
--2009/11/04
--¶Â¤Ñ°¨§¤ÃM¥]x2

--2009/10/26 ·s¼W
--2­Ó±½©ª§¤ÃM

--2009/10/21 ·s¼W
--2­Ó²rº¿§¤ÃM¥]
--2­Ó³DÀVÀs§¤ÃM¥]

-- 2009/06/03 ·s¼W
--18­Ó³¥½Þ§¤ÃM¥]
--8­ÓµR¤û§¤ÃM¥]
------------------------------------------------------------------------------
--§¤ÃM  204288     7¤Ñ·à¤l§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_204288( Option )
	local PlayerID = OwnerID()
	local PackageID = 204288		--7¤Ñ·à¤l§¤ÃM¥]
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
--§¤ÃM  204289     30¤Ñ·à¤l§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_204289( Option )
	local PlayerID = OwnerID()
	local PackageID = 204289		--30¤Ñ·à¤l§¤ÃM¥]
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
--§¤ÃM  204290     7¤Ñ¶Â·à§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_204290( Option )
	local PlayerID = OwnerID()
	local PackageID = 204290		--7¤Ñ¶Â·à§¤ÃM¥]
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
--§¤ÃM  204291     30¤Ñ¶Â·à§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_204291( Option )
	local PlayerID = OwnerID()
	local PackageID = 204291		--30¤Ñ¶Â·à§¤ÃM¥]
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
--§¤ÃM  204294     7¤Ñ³¥½Þ§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_204294( Option )
	local PlayerID = OwnerID()
	local PackageID = 204294		--7¤Ñ³¥½Þ§¤ÃM¥]
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
--§¤ÃM  204295     30¤Ñ³¥½Þ§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_204295( Option )
	local PlayerID = OwnerID()
	local PackageID = 204295		--30¤Ñ³¥½Þ§¤ÃM¥]
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
--§¤ÃM  204977     7¤ÑµµÃO³¥½Þ§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_204977( Option )
	local PlayerID = OwnerID()
	local PackageID = 204977		--7¤ÑµµÃO³¥½Þ§¤ÃM¥]
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
--§¤ÃM  204978     30¤ÑµµÃO³¥½Þ§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_204978( Option )
	local PlayerID = OwnerID()
	local PackageID = 204978		--30¤ÑµµÃO³¥½Þ§¤ÃM¥]
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
--§¤ÃM  204979     7¤Ñ¬õÃO³¥½Þ§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_204979( Option )
	local PlayerID = OwnerID()
	local PackageID = 204979		--7¤Ñ¬õÃO³¥½Þ§¤ÃM¥]
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
--§¤ÃM  204982     30¤Ñ¬õÃO³¥½Þ§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_204982( Option )
	local PlayerID = OwnerID()
	local PackageID = 204982		--30¤Ñ¬õÃO³¥½Þ§¤ÃM¥]
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
--§¤ÃM  204983    7¤Ñª÷ÃO³¥½Þ§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_204983( Option )
	local PlayerID = OwnerID()
	local PackageID = 204983		--7¤Ñª÷ÃO³¥½Þ§¤ÃM¥]
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
--§¤ÃM  204984    30¤Ñª÷ÃO³¥½Þ§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_204984( Option )
	local PlayerID = OwnerID()
	local PackageID = 204984		--30¤Ñª÷ÃO³¥½Þ§¤ÃM¥]
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
--§¤ÃM  204985    7¤Ñ¦B­ì³¥½Þ§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_204985( Option )
	local PlayerID = OwnerID()
	local PackageID = 204985		--7¤Ñ¦B­ì³¥½Þ§¤ÃM¥]
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
--§¤ÃM  204986    30¤Ñ¦B­ì³¥½Þ§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_204986( Option )
	local PlayerID = OwnerID()
	local PackageID = 204986		--30¤Ñ¦B­ì³¥½Þ§¤ÃM¥]
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
--§¤ÃM  204987   7¤Ñ·¥¦a³¥½Þ§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_204987( Option )
	local PlayerID = OwnerID()
	local PackageID = 204987		--7¤Ñ·¥¦a³¥½Þ§¤ÃM¥]
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
--§¤ÃM  204988   30¤Ñ·¥¦a³¥½Þ§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_204988( Option )
	local PlayerID = OwnerID()
	local PackageID = 204988		--30¤Ñ·¥¦a³¥½Þ§¤ÃM¥]
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
--§¤ÃM  204989   7¤Ñªá´³³¥½Þ§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_204989( Option )
	local PlayerID = OwnerID()
	local PackageID = 204989		--7¤Ñªá´³³¥½Þ§¤ÃM¥]
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
--§¤ÃM  204990   30¤Ñªá´³³¥½Þ§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_204990( Option )
	local PlayerID = OwnerID()
	local PackageID = 204990		--30¤Ñªá´³³¥½Þ§¤ÃM¥]
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
--§¤ÃM  204991   7¤Ñ´³¯¾³¥½Þ§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_204991( Option )
	local PlayerID = OwnerID()
	local PackageID = 204991		--7¤Ñ´³¯¾³¥½Þ§¤ÃM¥]
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
--§¤ÃM  204992   30¤Ñ´³¯¾³¥½Þ§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_204992( Option )
	local PlayerID = OwnerID()
	local PackageID = 204992		--30¤Ñ´³¯¾³¥½Þ§¤ÃM¥]
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
--§¤ÃM  204993  7¤Ñ¨ªµK³¥½Þ§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_204993( Option )
	local PlayerID = OwnerID()
	local PackageID = 204993		--7¤Ñ¨ªµK³¥½Þ§¤ÃM¥]
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
--§¤ÃM  204994   30¤Ñ¨ªµK³¥½Þ§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_204994( Option )
	local PlayerID = OwnerID()
	local PackageID = 204994		--30¤Ñ¨ªµK³¥½Þ§¤ÃM¥]
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
--§¤ÃM  204995  7¤Ñ¶ÀÃO³¥½Þ§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_204995( Option )
	local PlayerID = OwnerID()
	local PackageID = 204995		--7¤Ñ¶ÀÃO³¥½Þ§¤ÃM¥]
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
--§¤ÃM  204996  30¤Ñ¶ÀÃO³¥½Þ§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_204996( Option )
	local PlayerID = OwnerID()
	local PackageID = 204996		--30¤Ñ¶ÀÃO³¥½Þ§¤ÃM¥]
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
--§¤ÃM  204947  7¤Ñ¦Ç¦â¨ë¨¤µR¤û§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_204947( Option )
	local PlayerID = OwnerID()
	local PackageID = 204947		--7¤Ñ¦Ç¦â¨ë¨¤µR¤û§¤ÃM¥]
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
--§¤ÃM  204948  30¤Ñ¦Ç¦â¨ë¨¤µR¤û§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_204948( Option )
	local PlayerID = OwnerID()
	local PackageID = 204948		--30¤Ñ¦Ç¦â¨ë¨¤µR¤û§¤ÃM¥]
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
--§¤ÃM  204971  7¤Ñºñ³¥¨ë¨¤µR¤û§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_204971( Option )
	local PlayerID = OwnerID()
	local PackageID = 204971		--7¤Ñºñ³¥¨ë¨¤µR¤û§¤ÃM¥]
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
--§¤ÃM  204972  30¤Ñºñ³¥¨ë¨¤µR¤û§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_204972( Option )
	local PlayerID = OwnerID()
	local PackageID = 204972		--30¤Ñºñ³¥¨ë¨¤µR¤û§¤ÃM¥]
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
--§¤ÃM  204973  7¤ÑºÍ´¼¨ë¨¤µR¤û§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_204973( Option )
	local PlayerID = OwnerID()
	local PackageID = 204973		--7¤ÑºÍ´¼¨ë¨¤µR¤û§¤ÃM¥]
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
--§¤ÃM  204974  30¤ÑºÍ´¼¨ë¨¤µR¤û§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_204974( Option )
	local PlayerID = OwnerID()
	local PackageID = 204974		--30¤ÑºÍ´¼¨ë¨¤µR¤û§¤ÃM¥]
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
--§¤ÃM  204975  7¤Ñ¥Õ¦â¨ë¨¤µR¤û§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_204975( Option )
	local PlayerID = OwnerID()
	local PackageID = 204975		--7¤Ñ¥Õ¦â¨ë¨¤µR¤û§¤ÃM¥]
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
--§¤ÃM  204976  30¤Ñ¥Õ¦â¨ë¨¤µR¤û§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_204976( Option )
	local PlayerID = OwnerID()
	local PackageID = 204976		--30¤Ñ¥Õ¦â¨ë¨¤µR¤û§¤ÃM¥]
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
--§¤ÃM  206208   30¤Ñ¨g©b²rº¿§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_206208( Option )
	local PlayerID = OwnerID()
	local PackageID = 206208		--¥]
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
--§¤ÃM  206209  7¤Ñ¨g©b²rº¿§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_206209( Option )
	local PlayerID = OwnerID()
	local PackageID = 206209		--¥]
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
--§¤ÃM  206210 30¤Ñ¯î­ì²rº¿§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_206210( Option )
	local PlayerID = OwnerID()
	local PackageID = 206210		--¥]
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
--§¤ÃM  206211  7¤Ñ¯î­ì²rº¿§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_206211( Option )
	local PlayerID = OwnerID()
	local PackageID = 206211		--¥]
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
--§¤ÃM  206212   30¤Ñ¼C¤b³DÀVÀs§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_206212( Option )
	local PlayerID = OwnerID()
	local PackageID = 206212		--¥]
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
--§¤ÃM  206213   7¤Ñ¼C¤b³DÀVÀs§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_206213( Option )
	local PlayerID = OwnerID()
	local PackageID =206213		--¥]
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
--§¤ÃM  206214  30¤Ñ¨ë¯á³DÀVÀs§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_206214( Option )
	local PlayerID = OwnerID()
	local PackageID = 206214		--¥]
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
--§¤ÃM  206215    7¤Ñ¨ë¯á³DÀVÀs§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_206215( Option )
	local PlayerID = OwnerID()
	local PackageID = 206215		--¥]
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
--§¤ÃM  206241    7¤Ñ»´»R­¸´­999§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_206241( Option )
	local PlayerID = OwnerID()
	local PackageID = 206241		--¥]
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
--§¤ÃM  206240    30¤Ñ»´»R­¸´­999§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_206240( Option )
	local PlayerID = OwnerID()
	local PackageID = 206240		--¥]
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
--§¤ÃM  206243    7¤Ñ·o³J3000§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_206243( Option )
	local PlayerID = OwnerID()
	local PackageID = 206243		--¥]
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
--§¤ÃM  206242   30¤Ñ·o³J3000§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_206242( Option )
	local PlayerID = OwnerID()
	local PackageID = 206242		--¥]
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
--§¤ÃM  205748   30¤Ñ¶Â¤Ñ°¨§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_205748( Option )
	local PlayerID = OwnerID()
	local PackageID = 205748		--¥]
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
--§¤ÃM  205749   7¤Ñ¶Â¤Ñ°¨§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_205749( Option )
	local PlayerID = OwnerID()
	local PackageID = 205749		--¥]
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
--§¤ÃM  206574   7¤Ñ·Òº»¹ÚÅâ§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_206574( Option )
	local PlayerID = OwnerID()
	local PackageID = 206574		--¥]
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
--§¤ÃM  206575   30¤Ñ·Òº»¹ÚÅâ§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_206575( Option )
	local PlayerID = OwnerID()
	local PackageID = 206575		--¥]
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
--§¤ÃM  206576   7¤Ñ«Õ­ß¹ÚÆL§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_206576( Option )
	local PlayerID = OwnerID()
	local PackageID = 206576		--¥]
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
--§¤ÃM  206577   30¤Ñ«Õ­ß¹ÚÆL§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_206577( Option )
	local PlayerID = OwnerID()
	local PackageID = 206577		--¥]
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
--§¤ÃM  206584   7¤Ñ»a¤õ¹ÚÆL§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_206584( Option )
	local PlayerID = OwnerID()
	local PackageID = 206584		--¥]
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
--§¤ÃM  206585   30¤Ñ»a¤õ¹ÚÆL§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_206585( Option )
	local PlayerID = OwnerID()
	local PackageID = 206585		--¥]
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
--§¤ÃM  206582   7¤Ñª÷¿V¹ÚÆL§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_206582( Option )
	local PlayerID = OwnerID()
	local PackageID = 206582		--¥]
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
--§¤ÃM  206583   30¤Ñª÷¿V¹ÚÆL§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_206583( Option )
	local PlayerID = OwnerID()
	local PackageID = 206583		--¥]
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
--§¤ÃM  206580   7¤Ñ²`²W¹ÚÆL§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_206580( Option )
	local PlayerID = OwnerID()
	local PackageID = 206580		--¥]
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
--§¤ÃM  206581   30¤Ñ²`²W¹ÚÆL§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_206581( Option )
	local PlayerID = OwnerID()
	local PackageID = 206581		--¥]
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
--§¤ÃM  206578   7¤ÑÅ]¦å¹ÚÆL§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_206578( Option )
	local PlayerID = OwnerID()
	local PackageID = 206578		--¥]
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
--§¤ÃM  206579   30¤ÑÅ]¦å¹ÚÆL§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_206579( Option )
	local PlayerID = OwnerID()
	local PackageID = 206579		--¥]
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