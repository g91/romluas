function LuaQ_420038_OnClick()
	local Stale = {[110187] = 200020,[110188] = 200026 ,[110189] = 200027 ,[110190] = 200028}
	local Scroll = {[110187] = 200029,[110188] = 200031 ,[110189] = 200032 ,[110190] = 200033}
	if ( CountBodyItem( OwnerID(), 200017 ) >= 1 ) then -- 檢查有無拓印工具
		local ID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID)
		if CountBodyItem( OwnerID() , Stale[ID] ) >=1 or CountBodyItem( OwnerID() , Scroll[ID] ) >=1 then
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_420038_1"), 0 ) 
			return -1
		else
			return 1
		end
	else
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_420038_2"), 0 ) 
		return -1
	end
end
-----------------------------------------------------------------------------------------------------------------------
Function LuaQ_420038_AfterClick()
	local SteleCount = 1
	local Stele = {}
	local n

	Stele[0] = 200020
	Stele[1] = 200026
	Stele[2] = 200027
	Stele[3] = 200028
	Stele[4] = 200029
	Stele[5] = 200031
	Stele[6] = 200032
	Stele[7] = 200033

	for n = 0 , 3 , 1 do
		local m = n + 4
		if(CountBodyItem( OwnerID(), Stele[n]) >= 1 or CountBodyItem( OwnerID(),Stele[m] ) >= 1) then
			SteleCount = SteleCount * 10
		end
		if( SteleCount == 1000 ) then 
			DelBodyItem( OwnerID(), 200017, 1 ) 
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_420038_3"), 0 ) --/*你的工作完成了，拓印用的材料也剛好用光。
		end
	end

	return 1
END
-------------------------------------------------------------------------------------------------------------------------