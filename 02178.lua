------------------------------------------------------------------------------
--2010/10/26
--³æ¤H§¤ÃM³¡¤À
	--¤£¯à­¸
	--1ºØ¨³²rÀs§¤ÃM: §Ö»L¨³²rÀs
	--3ºØ¸Ë¥Ò°\§¤ÃM:µµ¤bÁl¾W°\¡B»A¦Ð¶³°\¡BµØ¹¢«Õ¼v°\
	--1ºØ«Cµì§¤ÃM: Å]¤Û¥¨µì
	--2ºØ©Ô¤ñ¨ß§¤ÃM: ©Ô¤ñ©Ô¤ñ¡BÅ]ªk©Ô¤ñ

--Âù¤H§¤ÃM

------------------------------------------------------------------------------



------------------------------------------------------------------------------
--§¤ÃM  207959   7¤Ñ§Ö»L¨³²rÀs§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_207959( Option )
	local PlayerID = OwnerID()
	local PackageID = 207959		--¥]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 208570 , 1 )	
	end
end
------------------------------------------------------------------------------
--§¤ÃM  207960   30¤Ñ§Ö»L¨³²rÀs§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_207960( Option )
	local PlayerID = OwnerID()
	local PackageID = 207960		--¥]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 208571 , 1 )	
	end
end




------------------------------------------------------------------------------
--§¤ÃM  209488   7¤ÑÅ]¤Û¥¨µì§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_209488( Option )
	local PlayerID = OwnerID()
	local PackageID = 209488		--¥]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 209485 , 1 )	
	end
end
------------------------------------------------------------------------------
--§¤ÃM  209489   30¤ÑÅ]¤Û¥¨µì§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_209489( Option )
	local PlayerID = OwnerID()
	local PackageID = 209489		--¥]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 209486 , 1 )	
	end
end
------------------------------------------------------------------------------
--§¤ÃM  207624   90¤ÑÅ]¤Û¥¨µì§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_207624( Option )
	local PlayerID = OwnerID()
	local PackageID = 207624		--¥]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 209490 , 1 )	
	end
end




------------------------------------------------------------------------------
--§¤ÃM  209967   7¤Ñ©Ô¤ñ©Ô¤ñ§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_209967( Option )
	local PlayerID = OwnerID()
	local PackageID = 209967		--¥]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 209961 , 1 )	
	end
end
------------------------------------------------------------------------------
--§¤ÃM  209968   30¤Ñ©Ô¤ñ©Ô¤ñ§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_209968( Option )
	local PlayerID = OwnerID()
	local PackageID = 209968		--¥]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 209962 , 1 )	
	end
end


------------------------------------------------------------------------------
--§¤ÃM  209969   7¤ÑÅ]ªk©Ô¤ñ§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_209969( Option )
	local PlayerID = OwnerID()
	local PackageID = 209967		--¥]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 209964 , 1 )	
	end
end
------------------------------------------------------------------------------
--§¤ÃM  209970   30¤ÑÅ]ªk©Ô¤ñ§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_209970( Option )
	local PlayerID = OwnerID()
	local PackageID = 209970		--¥]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 209965 , 1 )	
	end
end

------------------------------------------------------------------------------
--§¤ÃM  240442   7¤Ñµµ¤bÁl¾W°\§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_240442( Option )
	local PlayerID = OwnerID()
	local PackageID = 240442		--¥]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 240433 , 1 )	
	end
end
------------------------------------------------------------------------------
--§¤ÃM  240443   30¤Ñµµ¤bÁl¾W°\§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_240443( Option )
	local PlayerID = OwnerID()
	local PackageID = 240443		--¥]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 240434 , 1 )	
	end
end
------------------------------------------------------------------------------
--§¤ÃM  240444   7¤Ñ»A¦Ð¶³°\§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_240444( Option )
	local PlayerID = OwnerID()
	local PackageID = 240444		--¥]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 240436 , 1 )	
	end
end
------------------------------------------------------------------------------
--§¤ÃM  240445   30¤Ñ»A¦Ð¶³°\§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_240445( Option )
	local PlayerID = OwnerID()
	local PackageID = 240445		--¥]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 240437 , 1 )	
	end
end
------------------------------------------------------------------------------
--§¤ÃM  240446   7¤ÑµØ¹¢«Õ¼v°\§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_240446( Option )
	local PlayerID = OwnerID()
	local PackageID = 240446		--¥]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 240439 , 1 )	
	end
end
------------------------------------------------------------------------------
--§¤ÃM  240447   30¤ÑµØ¹¢«Õ¼v°\§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_240447( Option )
	local PlayerID = OwnerID()
	local PackageID = 240447		--¥]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 240440 , 1 )	
	end
end

------------------------------------------------------------------------------
--§¤ÃM  240931  7¤Ñ¹ÚÆL¤õ°¨§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_240931( Option )
	local PlayerID = OwnerID()
	local PackageID = 240931		--¥]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 240928 , 1 )	
	end
end

------------------------------------------------------------------------------
--§¤ÃM  240932   30¤Ñ¹ÚÆL¤õ°¨§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_240932( Option )
	local PlayerID = OwnerID()
	local PackageID = 240932		--¥]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 240929 , 1 )	
	end
end

------------------------------------------------------------------------------
--§¤ÃM  240936   7¤Ñ«Õ­ß¯Tµï§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_240936( Option )
	local PlayerID = OwnerID()
	local PackageID = 240936		--¥]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 240933 , 1 )	
	end
end

------------------------------------------------------------------------------
--§¤ÃM  240937   30¤Ñ«Õ­ß¯Tµï§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_240937( Option )
	local PlayerID = OwnerID()
	local PackageID = 240937		--¥]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 240934 , 1 )	
	end
end
------------------------------------------------------------------------------
--§¤ÃM  241010   7¤Ñ²`²W¨f¥qº¸§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_241010( Option )
	local PlayerID = OwnerID()
	local PackageID = 241010		--¥]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 240916 , 1 )	
	end
end

------------------------------------------------------------------------------
--§¤ÃM  241011   30¤Ñ²`²W¨f¥qº¸§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_241011( Option )
	local PlayerID = OwnerID()
	local PackageID = 241011		--¥]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 240917 , 1 )	
	end
end



------------------------------------------------------------------------------
--§¤ÃM  241319   7¤Ñ²Å¯¾Ây¼v°\§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_241319( Option )
	local PlayerID = OwnerID()
	local PackageID = 241319		--¥]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 241316 , 1 )	
	end
end



------------------------------------------------------------------------------
--§¤ÃM  241320   30¤Ñ²Å¯¾Ây¼v°\§¤ÃM¥]
------------------------------------------------------------------------------
function LuaI_241320( Option )
	local PlayerID = OwnerID()
	local PackageID = 241320		--¥]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 241317 , 1 )	
	end
end


