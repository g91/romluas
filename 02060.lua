------------------------------------------------------------------------------
--坐騎包用的function
--	Option		(1) "CHECK"	物品使用前檢查
--			(2) "USE"	物品使用效果
--	PackageID			掛這個function的包的編號
--	GiveID				開包之後要給予的坐騎的編號
--	NeedSpace			檢查玩家身上足夠格數以及給予的數量

--不會用的話請參考物品的208215、208216、208217、208218
------------------------------------------------------------------------------
function LuaI_FN_OPENRIDEPACKAGE( Option,PackageID,GiveID,NeedSpace)
	local PlayerID = OwnerID()
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , GiveID , NeedSpace )	
	end
end