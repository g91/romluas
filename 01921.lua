------------------------------------------------------------------------------
--2010/06/02
--³æ¤H§¤ÃM³¡¤À
	--3ºØ¤û§¤ÃM: ¥¨¨¤ªi¦è¡B¨ª²´°«¤û¡B¶m³¥¤ô¤û
	--1ºØ®üÄ_: ºû¨ÊÂÅÄ_
	--3ºØ¦Ï¾m: ³·¦a¦Ï¾m¡B¥jªL¦Ï¾m¡B°ª­ì¦Ï¾m
	--3ºØ°\: ´³ÂI±¶°\¡BÂy©]°\¡Bîî©]°\
	--1ºØºµ:µq³·¾Ôºµ
	--1ºØÆNºµ:¥¨ÆNÃ~
	--1ºØ³·¾õ:·x¥V³·¾õ
--Âù¤H§¤ÃM
	--¤£¯à­¸
	--¢°ºØºµ: ©H¼S¾Ôºµ
	--¤ô¤W¨«
	--2ºØ­¸´à: µµÆF­¸´à¡BÅ]¯à­¸´à
------------------------------------------------------------------------------



------------------------------------------------------------------------------
--§¤ÃM  207552   7¤Ñ¥¨¨¤ªi¦è§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_207552( Option )
	local PlayerID = OwnerID()
	local PackageID = 207552		--¥]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207509 , 1 )	
	end
end
------------------------------------------------------------------------------
--§¤ÃM  207553   30¤Ñ¥¨¨¤ªi¦è§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_207553( Option )
	local PlayerID = OwnerID()
	local PackageID = 207553		--¥]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207510 , 1 )	
	end
end


------------------------------------------------------------------------------
--§¤ÃM  207554   7¤Ñ¨ª²´°«¤û§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_207554( Option )
	local PlayerID = OwnerID()
	local PackageID = 207554		--¥]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207512 , 1 )	
	end
end


------------------------------------------------------------------------------
--§¤ÃM  207555   30¤Ñ¨ª²´°«¤û§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_207555( Option )
	local PlayerID = OwnerID()
	local PackageID = 207555		--¥]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207513 , 1 )	
	end
end

------------------------------------------------------------------------------
--§¤ÃM  207556   7¤Ñ¶m³¥¤ô¤û§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_207556( Option )
	local PlayerID = OwnerID()
	local PackageID = 207556		--¥]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207515 , 1 )	
	end
end


------------------------------------------------------------------------------
--§¤ÃM  207557   30¤Ñ¶m³¥¤ô¤û§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_207557( Option )
	local PlayerID = OwnerID()
	local PackageID = 207557		--¥]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207516 , 1 )	
	end
end


------------------------------------------------------------------------------
--§¤ÃM  207506   7¤Ñºû¨ÊÂÅÄ_§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_207506( Option )
	local PlayerID = OwnerID()
	local PackageID = 207506		--¥]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207525 , 1 )	
	end
end


------------------------------------------------------------------------------
--§¤ÃM  207507   30¤Ñºû¨ÊÂÅÄ_§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_207507( Option )
	local PlayerID = OwnerID()
	local PackageID = 207507		--¥]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207526 , 1 )	
	end
end


------------------------------------------------------------------------------
--§¤ÃM  207615   7¤Ñ³·¦a¦Ï¾m§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_207615( Option )
	local PlayerID = OwnerID()
	local PackageID = 207615		--¥]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207528 , 1 )	
	end
end


------------------------------------------------------------------------------
--§¤ÃM  207616   30¤Ñ³·¦a¦Ï¾m§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_207616( Option )
	local PlayerID = OwnerID()
	local PackageID = 207616		--¥]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207529 , 1 )	
	end
end


------------------------------------------------------------------------------
--§¤ÃM  207617   7¤Ñ¥jªL¦Ï¾m§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_207617( Option )
	local PlayerID = OwnerID()
	local PackageID = 207617		--¥]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207531 , 1 )	
	end
end


------------------------------------------------------------------------------
--§¤ÃM  207618   30¤Ñ¥jªL¦Ï¾m§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_207618( Option )
	local PlayerID = OwnerID()
	local PackageID = 207618		--¥]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207532 , 1 )	
	end
end


------------------------------------------------------------------------------
--§¤ÃM  207619   7¤Ñ°ª­ì¦Ï¾m§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_207619( Option )
	local PlayerID = OwnerID()
	local PackageID = 207619		--¥]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207534 , 1 )	
	end
end


------------------------------------------------------------------------------
--§¤ÃM  207620   30¤Ñ°ª­ì¦Ï¾m§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_207620( Option )
	local PlayerID = OwnerID()
	local PackageID = 207620		--¥]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207535 , 1 )	
	end
end


------------------------------------------------------------------------------
--§¤ÃM  207625   7¤Ñ´³ÂI±¶°\§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_207625( Option )
	local PlayerID = OwnerID()
	local PackageID = 207625		--¥]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207537 , 1 )	
	end
end


------------------------------------------------------------------------------
--§¤ÃM  207626   30¤Ñ´³ÂI±¶°\§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_207626( Option )
	local PlayerID = OwnerID()
	local PackageID = 207626		--¥]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207538 , 1 )	
	end
end


------------------------------------------------------------------------------
--§¤ÃM  207627   7¤ÑÂy©]°\§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_207627( Option )
	local PlayerID = OwnerID()
	local PackageID = 207627		--¥]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207540 , 1 )	
	end
end


------------------------------------------------------------------------------
--§¤ÃM  207628   30¤ÑÂy©]°\§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_207628( Option )
	local PlayerID = OwnerID()
	local PackageID = 207628		--¥]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207541 , 1 )	
	end
end


------------------------------------------------------------------------------
--§¤ÃM  207629   7¤Ñîî©]°\§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_207629( Option )
	local PlayerID = OwnerID()
	local PackageID = 207629		--¥]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207543 , 1 )	
	end
end


------------------------------------------------------------------------------
--§¤ÃM  207630   30¤Ñîî©]°\§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_207630( Option )
	local PlayerID = OwnerID()
	local PackageID = 207630		--¥]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207544 , 1 )	
	end
end


------------------------------------------------------------------------------
--§¤ÃM  207622   7¤Ñ©H¼S¾Ôºµ§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_207622( Option )
	local PlayerID = OwnerID()
	local PackageID = 207622		--¥]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207501 , 1 )	
	end
end


------------------------------------------------------------------------------
--§¤ÃM  207623   30¤Ñ©H¼S¾Ôºµ§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_207623( Option )
	local PlayerID = OwnerID()
	local PackageID =  207623		--¥]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207502 , 1 )	
	end
end


------------------------------------------------------------------------------
--§¤ÃM  207631   7¤ÑµµÆF­¸´à§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_207631( Option )
	local PlayerID = OwnerID()
	local PackageID = 207631		--¥]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207546 , 1 )	
	end
end


------------------------------------------------------------------------------
--§¤ÃM  207632   30¤ÑµµÆF­¸´à§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_207632( Option )
	local PlayerID = OwnerID()
	local PackageID =  207632		--¥]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207547 , 1 )	
	end
end

------------------------------------------------------------------------------
--§¤ÃM  207633   7¤ÑÅ]¯à­¸´à§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_207633( Option )
	local PlayerID = OwnerID()
	local PackageID = 207633		--¥]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207549 , 1 )	
	end
end


------------------------------------------------------------------------------
--§¤ÃM  207634   30¤ÑÅ]¯à­¸´à§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_207634( Option )
	local PlayerID = OwnerID()
	local PackageID =  207634		--¥]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207550 , 1 )	
	end
end


------------------------------------------------------------------------------
--§¤ÃM  207561   7¤Ñµq³·¾Ôºµ§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_207561( Option )
	local PlayerID = OwnerID()
	local PackageID = 207561		--¥]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207558 , 1 )	
	end
end


------------------------------------------------------------------------------
--§¤ÃM  207562   30¤Ñµq³·¾Ôºµ§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_207562( Option )
	local PlayerID = OwnerID()
	local PackageID =  207562		--¥]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207559 , 1 )	
	end
end

------------------------------------------------------------------------------
--§¤ÃM  207504   7¤Ñ¥¨ÆNÃ~§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_207504( Option )
	local PlayerID = OwnerID()
	local PackageID = 207504		--¥]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207563 , 1 )	
	end
end
------------------------------------------------------------------------------
--§¤ÃM  207508   30¤Ñ¥¨ÆNÃ~§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_207508( Option )
	local PlayerID = OwnerID()
	local PackageID = 207508		--¥]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207564 , 1 )	
	end
end



------------------------------------------------------------------------------
--§¤ÃM  207505   7¤Ñ·x¥V³·¾õ§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_207505( Option )
	local PlayerID = OwnerID()
	local PackageID = 207505		--¥]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207572 , 1 )	
	end
end
------------------------------------------------------------------------------
--§¤ÃM  207621  30¤Ñ·x¥V³·¾õ§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_207621( Option )
	local PlayerID = OwnerID()
	local PackageID = 207621		--¥]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207573 , 1 )	
	end
end