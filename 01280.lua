-------------------------------------------------------------------------------------------------------
function GuildFarm_FarmProduceSheet( Option ) -- all levels drop items of farm
--Say(OwnerID(), "1")
--Say(TargetID(), "2")
	local PlayerID = OwnerID()
	local PackageID = {	204784,
				204827,
				204828,
				205216,
				205217,
				205218,
				205219,
				205220,
				205221,
				205222}		
	local DropingContent = 0
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space2( PlayerID , NeedSpace  )
	local ClickObj = GetUseItemGUID(OwnerID())
	--ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	local RoomID = ReadRoleValue( TargetID(), EM_RoleValue_RoomID )
	--Say(OwnerID(), ClickObj)
	local Item1 = { 	720470,
			720472,	-- 最後掉落表
			720473,
			720476,
			724602,
			724603,
			724604,
			724605,
			724606,
			724607}
	for i = 1, 10 do
		if ClickObj  == PackageID[i] then
			DropingContent = Item1[i]
		end
	end

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , ClickObj ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , DropingContent , 1 )

		----  5.0.2 新增公會BOSS家具材料掉落  205689 辛勤結晶    1/400 機率掉落
		local R = Rand(400)+1
		if R >399 then
			GiveBodyItem( PlayerID , 205689 , 1 )
		end
		-------------------------------------------------------------------
	end

end
-------------------------------------------------------------------------------------------------------
function GuildFarm_FactoryProduceSheet( Option )
	local PlayerID = OwnerID()
	local PackageID = {	204785,
				204829,
				204830,
				205209,
				205210,
				205211,
				205212,
				205213,
				205214,
				205215}		
	local DropingContent = 0
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space2( PlayerID , NeedSpace  )
	local ClickObj = GetUseItemGUID(OwnerID())
	local RoomID = ReadRoleValue( TargetID(), EM_RoleValue_RoomID )
	local Item1 = { 	720471,
			720474,	-- 最後掉落表
			720475,
			724616,
			724617,
			724618,
			724619,
			720539,
			720541,
			720542}
	for i = 1, 10 do
		if ClickObj  == PackageID[i] then
			DropingContent = Item1[i]
		end
	end

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , ClickObj ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , DropingContent , 1 )

		----  5.0.2 新增公會BOSS家具材料掉落  205689 辛勤結晶    1/400 機率掉落
		local R = Rand(400)+1
		if R >399 then
			GiveBodyItem( PlayerID , 205689 , 1 )
		end
		-------------------------------------------------------------------
	end



end
-------------------------------------------------------------------------------------------------------
function GuildWoden_FactoryProduceSheet( Option )
	local PlayerID = OwnerID()
	local PackageID = {	205223,
				205224,
				205225,
				205226,
				205227,
				205228,
				205229,
				205230,
				205231,
				205232}		
	local DropingContent = 0
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space2( PlayerID , NeedSpace  )
	local ClickObj = GetUseItemGUID(OwnerID())
	local RoomID = ReadRoleValue( TargetID(), EM_RoleValue_RoomID )
	local Item1 = { 	720553,
			720554,	-- 最後掉落表
			720555,
			720543,
			720551,
			720556,
			720557,
			720558,
			720570,
			720571}
	for i = 1, 10 do
		if ClickObj  == PackageID[i] then
			DropingContent = Item1[i]
		end
	end

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , ClickObj ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , DropingContent , 1 )

		----  5.0.2 新增公會BOSS家具材料掉落  205689 辛勤結晶    1/400 機率掉落
		local R = Rand(400)+1
		if R >399 then
			GiveBodyItem( PlayerID , 205689 , 1 )
		end
		-------------------------------------------------------------------
	end
end