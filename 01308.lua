-- 愛樂節禮盒.測試指令_701308

------------------------------------------------------------------------------
--音符岩鼠寵物禮盒  241386   ( 5.0.0 ) 2012
------------------------------------------------------------------------------
function LuaI_241386( Option )
	local PlayerID = OwnerID()
	local PackageID = 241386
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 726111 , 1 )	
	end
end



------------------------------------------------------------------------------
--茱莉雅禮盒  204427     
------------------------------------------------------------------------------
function LuaI_204427box( Option )
	local PlayerID = OwnerID()
	local PackageID = 204427		--茱莉雅禮盒
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 724438 , 1 )	
	end
end
-------------------------------------------------------------------------------
--愛樂坐騎禮盒  204554     
------------------------------------------------------------------------------
function LuaI_204554box( Option )
	local PlayerID = OwnerID()
	local PackageID = 204554 		--愛樂坐騎禮盒
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 724439 , 1 )	
	end
end
-------------------------------------------------------------------------------
--樂器素材包  204555     
------------------------------------------------------------------------------
function LuaI_204555box( Option )
	local PlayerID = OwnerID()
	local PackageID = 204555 		--樂器素材包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 724433 , 1 )	
	end
end
-------------------------------------------------------------------------------
--金色管樂禮盒      204557  
------------------------------------------------------------------------------
function LuaI_204557box( Option )
	local PlayerID = OwnerID()
	local PackageID = 204557		--金色管樂禮盒 
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		local BorG = ReadRoleValue( PlayerID , EM_RoleValue_SEX  )  
		If BorG == 0 then
			GiveBodyItem( PlayerID , 724434 , 1 )	 --跑男生的
		elseif BorG == 1 then
			GiveBodyItem( PlayerID , 724435 , 1 )	 --跑女生的
		end
	end
end
-------------------------------------------------------------------------------
--愛樂嘉年華禮盒      204556  
------------------------------------------------------------------------------
function LuaI_204556box( Option )
	local PlayerID = OwnerID()
	local PackageID = 204556		--愛樂嘉年華禮盒
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		local BorG = ReadRoleValue( PlayerID , EM_RoleValue_SEX  )  

		If BorG == 0 then
			GiveBodyItem( PlayerID , 724436 , 1 )	 --跑男生的
		elseif BorG == 1 then
			GiveBodyItem( PlayerID , 724437 , 1 )	 --跑女生的
		end
	end
end
-------------------------------------------------------------------------------
--必爾汀藥水組合包  204578 
------------------------------------------------------------------------------
function LuaI_204578box( Option )
	local PlayerID = OwnerID()
	local PackageID = 204578 		--必爾汀藥水組合包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 725144 , 1 )	
	end
end

function lua_mika_systimeshow()
	local month = GetSystime(3)+1
	local day = GetSystime(4)
	local hour = GetSystime(1)
	local min = GetSystime(2)

	DebugMsg(OwnerID(),OwnerID(),month.."/"..day.." "..hour..":"..min)
end


Function lua_mika_musicfes_delkey01() --魅影活動
	Setflag(OwnerID(), 542553, 0)
	Setflag(OwnerID(), 542666, 0)
	Say(OwnerID(), "delkeyitem shadow")
end

Function lua_mika_musicfes_delkey02()  --馬術活動
	Setflag(OwnerID(), 542448 , 0 )
	Setflag(OwnerID(), 542520 , 0 )
	Setflag(OwnerID(), 542527 , 0 )
	Setflag(OwnerID(), 542528 , 0 )
	Setflag(OwnerID(), 542529 , 0 )
	Setflag(OwnerID(), 542548 , 0 )
	Setflag(OwnerID(), 542549 , 0 )
	Setflag(OwnerID(), 542550 , 0 )
	Setflag(OwnerID(), 542551 , 0 )
	Setflag(OwnerID(), 542560 , 0 )
	Setflag(OwnerID(), 542629 , 0 )
	Setflag(OwnerID(), 542630 , 0 )
	Setflag(OwnerID(), 542552 , 0 )
	Setflag(OwnerID(), 542631 , 0 )
	Setflag(OwnerID(), 542632 , 0 )
	Setflag(OwnerID(), 542633 , 0 )
	Say(OwnerID(), "delkeyitem ricing")
end

Function lua_mika_musicfes_delkey03()  --音符階梯
	Setflag(OwnerID(), 542448 , 0 )
	Setflag(OwnerID(), 542521 , 0 )
	Setflag(OwnerID(), 542522 , 0 )
	Setflag(OwnerID(), 542523 , 0 )
	Setflag(OwnerID(), 542524 , 0 )
	Setflag(OwnerID(), 542525 , 0 )
	Setflag(OwnerID(), 542526 , 0 )
	Setflag(OwnerID(), 542530 , 0 )
	Setflag(OwnerID(), 542531 , 0 )
	Setflag(OwnerID(), 542532 , 0 )
	Setflag(OwnerID(), 542533 , 0 )
	Setflag(OwnerID(), 542534 , 0 )
	Setflag(OwnerID(), 542535 , 0 )
	Setflag(OwnerID(), 542536 , 0 )
	Setflag(OwnerID(), 542537 , 0 )
	Setflag(OwnerID(), 542538 , 0 )
	Setflag(OwnerID(), 542539 , 0 )
	Setflag(OwnerID(), 542540 , 0 )
	Setflag(OwnerID(), 542541 , 0 )
	Setflag(OwnerID(), 542542 , 0 )
	Setflag(OwnerID(), 542543 , 0 )
	Setflag(OwnerID(), 542544 , 0 )
	Setflag(OwnerID(), 542545 , 0 )
	Setflag(OwnerID(), 542546 , 0 )
	Setflag(OwnerID(), 542547 , 0 )
	Setflag(OwnerID(), 542558 , 0 )
	Setflag(OwnerID(), 542559 , 0 )
	Say(OwnerID(), "delkeyitem music")
end
