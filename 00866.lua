function MagicBox_AddEnergy_01( Option )
	local Player = OwnerID()
	local PackageID = {202928,208778}
	if ( Option == "CHECK" ) then
		if ( CountBodyItem( Player , PackageID[1] ) >= 1 ) or ( CountBodyItem( Player , PackageID[2] ) >= 1 ) then
			if CheckFlag( OwnerID(),541795 ) == true then	--檢查魔幻寶盒是否開啟
				return true
			else
				ScriptMessage( OwnerID(),OwnerID(),1,"[SC_MAGICBOX_NOTOPEN]",0)
				return false
			end
		else
			return false
		end
	elseif ( Option == "USE" ) then
		AddRoleValue( Player , EM_RoleValue_BoxEnergy , 10 )
	end
end

function MagicBox_AddEnergy_02( Option )

	local Player = OwnerID()
	local PackageID = {202929,208777}
	if ( Option == "CHECK" ) then
		if ( CountBodyItem( Player , PackageID[1] ) >= 1 ) or ( CountBodyItem( Player , PackageID[2] ) >= 1 ) then
			if CheckFlag( OwnerID(),541795 ) == true then	--檢查魔幻寶盒是否開啟
				return true
			else
				ScriptMessage( OwnerID(),OwnerID(),1,"[SC_MAGICBOX_NOTOPEN]",0)
				return false
			end
		else
			return false
		end
	elseif ( Option == "USE" ) then
		AddRoleValue( Player , EM_RoleValue_BoxEnergy , 50 )
	end

end

function MagicBox_AddEnergy_03( Option )

	local Player = OwnerID()
	local PackageID = {202930,208776}
	if ( Option == "CHECK" ) then
		if ( CountBodyItem( Player , PackageID[1] ) >= 1 ) or ( CountBodyItem( Player , PackageID[2] ) >= 1 ) then
			if CheckFlag( OwnerID(),541795 ) == true then	--檢查魔幻寶盒是否開啟
				return true
			else
				ScriptMessage( OwnerID(),OwnerID(),1,"[SC_MAGICBOX_NOTOPEN]",0)
				return false
			end
		else
			return false
		end
	elseif ( Option == "USE" ) then
		AddRoleValue( Player , EM_RoleValue_BoxEnergy , 100 )
	end

end

function MagicBox_AddEnergy_04( Option )  --新手禮包用

	local Player = OwnerID()
	local PackageID = 203487
	if ( Option == "CHECK" ) then
		if ( CountBodyItem( Player , PackageID ) >= 1 ) then
			if CheckFlag( OwnerID(),541795 ) == true then	--檢查魔幻寶盒是否開啟
				return true
			else
				ScriptMessage( OwnerID(),OwnerID(),1,"[SC_MAGICBOX_NOTOPEN]",0)
				return false
			end
		else
			return false
		end
	elseif ( Option == "USE" ) then
		AddRoleValue( Player , EM_RoleValue_BoxEnergy , 1 )
	end
end

function MagicBox_AddEnergy2_01( Option ) --新手禮包用

	local Player = OwnerID()
	local PackageID = 203577
	if ( Option == "CHECK" ) then
		if ( CountBodyItem( Player , PackageID ) >= 1 ) then
			if CheckFlag( OwnerID(),541795 ) == true then	--檢查魔幻寶盒是否開啟
				return true
			else
				ScriptMessage( OwnerID(),OwnerID(),1,"[SC_MAGICBOX_NOTOPEN]",0)
				return false
			end
		else
			return false
		end
	elseif ( Option == "USE" ) then
		AddRoleValue( Player , EM_RoleValue_BoxEnergy , 10 )
	end
end

function MagicBox_AddEnergy2_02( Option ) --新手禮包用

	local Player = OwnerID()
	local PackageID = 203578
	if ( Option == "CHECK" ) then
		if ( CountBodyItem( Player , PackageID ) >= 1 ) then
			if CheckFlag( OwnerID(),541795 ) == true then	--檢查魔幻寶盒是否開啟
				return true
			else
				ScriptMessage( OwnerID(),OwnerID(),1,"[SC_MAGICBOX_NOTOPEN]",0)
				return false
			end
		else
			return false
		end
	elseif ( Option == "USE" ) then
		AddRoleValue( Player , EM_RoleValue_BoxEnergy , 50 )
	end
end

function LuaS_421457_Complete()
	local Player = TargetID()
	AddRoleValue( Player , EM_RoleValue_BoxEnergy , 10 )
end

--================================================================
--				2010/12/5 新增
--================================================================

function MagicBox_AddEnergy_05( Option )  --韓國新一季活動用，增加寶盒能量5

	local Player = OwnerID()
	local PackageID = 208932
	if ( Option == "CHECK" ) then
		if ( CountBodyItem( Player , PackageID ) >= 1 ) then
			if CheckFlag( OwnerID(),541795 ) == true then	--檢查魔幻寶盒是否開啟
				return true
			else
				ScriptMessage( OwnerID(),OwnerID(),1,"[SC_MAGICBOX_NOTOPEN]",0)
				return false
			end
		else
			return false
		end
	elseif ( Option == "USE" ) then
		AddRoleValue( Player , EM_RoleValue_BoxEnergy , 5 )
	end
end