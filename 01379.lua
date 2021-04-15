------------------------------------------------------------------------------
--Ãdª«½c  ¥Ã¤[¦º¯«Ä_Ä_Ãdª«½c  204821
------------------------------------------------------------------------------
function LuaI_miyon_petbox01( Option )
	local PlayerID = OwnerID()
	local PackageID = 204821		--¥Ã¤[¦º¯«Ä_Ä_Ãdª«½c
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 203230 , 1 )	 --¥Ã¤[¦º¯«Ä_Ä_Ãdª«³J
	end
end
-------------------------------------------------------------------------------
--Ãdª«½c  ¥Ã¤[«n¥ÊÄ_Ä_Ãdª«½c  204822
------------------------------------------------------------------------------
function LuaI_miyon_petbox02( Option )
	local PlayerID = OwnerID()
	local PackageID = 204822		--¥Ã¤[«n¥ÊÄ_Ä_Ãdª«½c
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 203229 , 1 )	 --¥Ã¤[«n¥ÊÄ_Ä_Ãdª«³J
	end
end
-------------------------------------------------------------------------------
--Ãdª«½c  ¥Ã¤[ôÆë`Ä_Ä_Ãdª«½c  204823
------------------------------------------------------------------------------
function LuaI_miyon_petbox03( Option )
	local PlayerID = OwnerID()
	local PackageID = 204823		--¥Ã¤[ôÆë`Ä_Ä_Ãdª«½c
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 203241 , 1 )	 --¥Ã¤[ôÆë`Ä_Ä_Ãdª«³J
	end
end
------------------------------------------------------------------------------
--Ãdª«½c  ¥Ã¤[¥®¯TÄ_Ä_Ãdª«½c  204824
------------------------------------------------------------------------------
function LuaI_miyon_petbox04( Option )
	local PlayerID = OwnerID()
	local PackageID = 204824		--¥Ã¤[¥®¯TÄ_Ä_Ãdª«½c
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 203243 , 1 )	 --¥Ã¤[¥®¯TÄ_Ä_Ãdª«³J
	end
end
------------------------------------------------------------------------------
--Ãdª«½c  7¤Ñ¤p¥¨¤HÃdª«½c  204817
------------------------------------------------------------------------------
function LuaI_miyon_petbox05( Option )
	local PlayerID = OwnerID()
	local PackageID = 204817		--7¤Ñ¤p¥¨¤HÃdª«½c
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 203227 , 1 )	 --7¤Ñ¤p¥¨¤HÃdª«³J
	end
end
------------------------------------------------------------------------------
--Ãdª«½c  ¥Ã¤[¤p¥¨¤HÃdª«½c  204818
------------------------------------------------------------------------------
function LuaI_miyon_petbox05_2( Option )
	local PlayerID = OwnerID()
	local PackageID = 204818		--¥Ã¤[¤p¥¨¤HÃdª«½c
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 203228 , 1 )	 --¥Ã¤[¤p¥¨¤HÃdª«³J
	end
end
------------------------------------------------------------------------------
--Ãdª«½c  ¥Ã¤[­ô¥¬ªLÃdª«½c  204819
------------------------------------------------------------------------------
function LuaI_miyon_petbox06( Option )
	local PlayerID = OwnerID()
	local PackageID = 204819		--¥Ã¤[­ô¥¬ªLÃdª«½c
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 203242 , 1 )	 --¥Ã¤[­ô¥¬ªLÃdª«³J
	end
end
------------------------------------------------------------------------------
--Ãdª«½c  ¥Ã¤[¯»¦â²y²yÃdª«½c  204820
------------------------------------------------------------------------------
function LuaI_miyon_petbox07( Option )
	local PlayerID = OwnerID()
	local PackageID = 204820		--¥Ã¤[¯»¦â²y²yÃdª«½c
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 203244 , 1 )	 --¥Ã¤[¯»¦â²y²yÃdª«³J
	end
end
------------------------------------------------------------------------------
--Ãdª«½c  ¥Ã¤[¾ï¦â²y²yÃdª«½c  203275
------------------------------------------------------------------------------
function LuaI_miyon_petbox08( Option )
	local PlayerID = OwnerID()
	local PackageID = 203275		--¥Ã¤[¾ï¦â²y²yÃdª«½c
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 203245 , 1 )	 --¥Ã¤[¾ï¦â²y²yÃdª«³J
	end
end
-------------------------------------------------------------------------------
--Ãdª«½c  ¥Ã¤[¶Â¥Ö½ÞÃdª«½c 203284
------------------------------------------------------------------------------
function LuaI_miyon_petbox09( Option )
	local PlayerID = OwnerID()
	local PackageID = 203284		--¥Ã¤[¶Â¥Ö½ÞÃdª«½c
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 203273 , 1 )	 --¥Ã¤[¶Â¥Ö½ÞÃdª«³J
	end
end
-------------------------------------------------------------------------------
--Ãdª«½c  ¥Ã¤[«n¥Ê©ÇÃdª«½c 204782
------------------------------------------------------------------------------
function LuaI_miyon_petbox10( Option )
	local PlayerID = OwnerID()
	local PackageID = 204782		--¥Ã¤[«n¥Ê©ÇÃdª«½c
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 203274 , 1 )	 --¥Ã¤[«n¥Ê©ÇÃdª«³J
	end
end
-------------------------------------------------------------------------------
--Ãdª«½c  30¤Ñ¥Õ¦Ï¦u½ÃÄ_Ä_Ãdª«½c 205678
------------------------------------------------------------------------------
function LuaI_205678box( Option )
	local PlayerID = OwnerID()
	local PackageID = 205678		--30¤Ñ¥Õ¦Ï¦u½ÃÄ_Ä_Ãdª«½c
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 205676 , 1 )	 --30¤Ñ¥Õ¦Ï¦u½ÃÄ_Ä_Ãdª«³J
	end
end
-------------------------------------------------------------------------------
--Ãdª«½c  7¤Ñ¥Õ¦Ï¦u½ÃÄ_Ä_Ãdª«½c 205679
------------------------------------------------------------------------------
function LuaI_205679box( Option )
	local PlayerID = OwnerID()
	local PackageID = 205679		--7¤Ñ¥Õ¦Ï¦u½ÃÄ_Ä_Ãdª«½c
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 205677 , 1 )	 --7¤Ñ¥Õ¦Ï¦u½ÃÄ_Ä_Ãdª«³J
	end
end
------------------------------------------------------------------------------
--Ãdª«½c  7¤Ñ»ï¨F©Ô¦©Ã~Ãdª«½c 206178
------------------------------------------------------------------------------
function LuaI_206178box( Option )
	local PlayerID = OwnerID()
	local PackageID = 206178		--7¤Ñ»ï¨F©Ô¦©Ã~Ãdª«½c
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206175 , 1 )	 --7¤Ñ»ï¨F©Ô¦©Ã~Ãdª«³J
	end
end
------------------------------------------------------------------------------
--Ãdª«½c  30¤Ñ»ï¨F©Ô¦©Ã~Ãdª«½c 206179
------------------------------------------------------------------------------
function LuaI_206179box( Option )
	local PlayerID = OwnerID()
	local PackageID = 206179		--30¤Ñ»ï¨F©Ô¦©Ã~Ãdª«½c
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206176 , 1 )	 --30¤Ñ»ï¨F©Ô¦©Ã~Ãdª«³J
	end
end
------------------------------------------------------------------------------
--Ãdª«½c  7¤Ñ¶Àª÷ÅbÀkÃdª«½c 206025
------------------------------------------------------------------------------
function LuaI_206025box( Option )
	local PlayerID = OwnerID()
	local PackageID = 206025		--7¤Ñ¶Àª÷ÅbÀkÃdª«½c
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206022 , 1 )	 --7¤Ñ¶Àª÷ÅbÀkÃdª«³J
	end
end
------------------------------------------------------------------------------
--Ãdª«½c  30¤Ñ¶Àª÷ÅbÀkÃdª«½c 206252
------------------------------------------------------------------------------
function LuaI_206252box( Option )
	local PlayerID = OwnerID()
	local PackageID = 206252		--30¤Ñ¶Àª÷ÅbÀkÃdª«½c
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206023 , 1 )	 --30¤Ñ¶Àª÷ÅbÀkÃdª«³J
	end
end
------------------------------------------------------------------------------
--2010.03.23 ¼w°ê°Ó«°Ãd

function LuaI_207095( Option )
	local PlayerID = OwnerID()
	local PackageID = 207095		
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207089 , 1 )	
	end
end

function LuaI_207096( Option )
	local PlayerID = OwnerID()
	local PackageID = 207096		
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207090 , 1 )	
	end
end

function LuaI_207097( Option )
	local PlayerID = OwnerID()
	local PackageID = 207097		
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207092 , 1 )	
	end
end

function LuaI_207098( Option )
	local PlayerID = OwnerID()
	local PackageID = 207098		
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207093 , 1 )	
	end
end


------------------------------------------------------------------------------
--Ãdª«½c  7¤Ñª÷·àµ³Ä_Ä_Ãdª«½c 207731
------------------------------------------------------------------------------
function LuaI_207731( Option )
	local PlayerID = OwnerID()
	local PackageID = 207731		
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207099 , 1 )	
	end
end


------------------------------------------------------------------------------
--Ãdª«½c  30¤Ñª÷·àµ³Ä_Ä_Ãdª«½c 207732
------------------------------------------------------------------------------
function LuaI_207732( Option )
	local PlayerID = OwnerID()
	local PackageID = 207732		
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207100 , 1 )	
	end
end


------------------------------------------------------------------------------
--Ãdª«½c  7¤Ñ¼ö±a¥¨¼L³¾Ãdª«½c 207733
------------------------------------------------------------------------------
function LuaI_207733( Option )
	local PlayerID = OwnerID()
	local PackageID = 207733		
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207102 , 1 )	
	end
end


------------------------------------------------------------------------------
--Ãdª«½c  30¤Ñ¼ö±a¥¨¼L³¾Ãdª«½c 207734
------------------------------------------------------------------------------
function LuaI_207734( Option )
	local PlayerID = OwnerID()
	local PackageID = 207734		
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207103 , 1 )	
	end
end


------------------------------------------------------------------------------
--Ãdª«½c  7¤Ñ¶Â¥Õ²yÄ_Ãdª«½c 207105
------------------------------------------------------------------------------
function LuaI_207105( Option )
	local PlayerID = OwnerID()
	local PackageID = LuaI_207105		
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207708 , 1 )	
	end
end


------------------------------------------------------------------------------
--Ãdª«½c  30¤Ñ¶Â¥Õ²yÄ_Ãdª«½c 207106
------------------------------------------------------------------------------
function LuaI_207106( Option )
	local PlayerID = OwnerID()
	local PackageID = LuaI_207106		
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207709 , 1 )	
	end
end


------------------------------------------------------------------------------
--Ãdª«½c  7¤Ñ¦BÁ÷Ä_Ä_Ãdª«½c 208456
------------------------------------------------------------------------------
function LuaI_208456( Option )
	local PlayerID = OwnerID()
	local PackageID = LuaI_208456		
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 208453 , 1 )	
	end
end


------------------------------------------------------------------------------
--Ãdª«½c  30¤Ñ¦BÁ÷Ä_Ä_Ãdª«½c 208457
------------------------------------------------------------------------------
function LuaI_208457( Option )
	local PlayerID = OwnerID()
	local PackageID = LuaI_208457		
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 208454 , 1 )	
	end
end


------------------------------------------------------------------------------
--Ãdª«½c  7¤Ñ³·¤H¤ýÄ_Ä_Ãdª«½c 208464
------------------------------------------------------------------------------
function LuaI_208464( Option )
	local PlayerID = OwnerID()
	local PackageID = LuaI_208464		
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 208458 , 1 )	
	end
end

------------------------------------------------------------------------------
--Ãdª«½c  30¤Ñ³·¤H¤ýÄ_Ä_Ãdª«½c 208465
------------------------------------------------------------------------------
function LuaI_208465( Option )
	local PlayerID = OwnerID()
	local PackageID = LuaI_208465		
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 208459 , 1 )	
	end
end


------------------------------------------------------------------------------
--Ãdª«½c  7¤Ñ¤pÁ¤»æ¤HÃdª«½c 208466
------------------------------------------------------------------------------
function LuaI_208466( Option )
	local PlayerID = OwnerID()
	local PackageID = LuaI_208466		
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 208461 , 1 )	
	end
end


------------------------------------------------------------------------------
--Ãdª«½c  30¤Ñ¤pÁ¤»æ¤HÃdª«½c 208467
------------------------------------------------------------------------------
function LuaI_208467( Option )
	local PlayerID = OwnerID()
	local PackageID = LuaI_208467		
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 208462 , 1 )	
	end
end