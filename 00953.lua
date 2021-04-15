function LuaI_pumpkinpie( Option )  --953
	local PlayerID = OwnerID()
	local PackageID = 203079		-- 南瓜派
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
--	Say(PlayerID,"PlayerID is "..PlayerID)
	local Item = {	203080,		-- 黃色彩帶
			203081,		-- 綠色彩帶
			203082,		-- 藍色彩帶
			203083,		-- 紫色彩帶
			203084	}	-- 紅色彩帶
	local probability = {	10,		-- 黃色彩帶機率
			30,             	-- 綠色彩帶機率
			20,             	-- 藍色彩帶機率
			30,             	-- 紫色彩帶機率
			10	}       	-- 紅色彩帶機率
	local RAND = rand(100)

	if ( Option == "CHECK" ) then
--		Say(PlayerID,"PlayerID is "..PlayerID)
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			-- 加入判斷戰場區域
			local ZoneID =  ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID ) 
			local Zone = ZoneID -1000*math.floor( ZoneID / 1000 )
			local CheckResult = "No"
			local Pass = {401}
			if Zone < 400 then
				CheckResult = "Yes"
			end
			for i=1,table.getn(Pass) do
				if Zone == Pass[i] then
					CheckResult = "No"
				end
			end
			if CheckResult == "Yes" then
				return true
			else
				ScriptMessage( OwnerID(),OwnerID(),1,"[SC_DAN_111700_37]",0)
				return false
			end

		end
	elseif ( Option == "USE" ) then
	--	Say(PlayerID,"RAND is "..RAND)
		if RAND > (100 - probability[1]) then
			GiveBodyItem( PlayerID , Item[1] , 1 )					
		elseif RAND > (100 - probability[1] - probability[2]) then
			GiveBodyItem( PlayerID , Item[2] , 1 )					
		elseif RAND > (100 - probability[1] - probability[2] - probability[3]) then
			GiveBodyItem( PlayerID , Item[3] , 1 )					
		elseif RAND > (100 - probability[1] - probability[2] - probability[3] - probability[4]) then
			GiveBodyItem( PlayerID , Item[4] , 1 )					
		else
			GiveBodyItem( PlayerID , Item[5] , 1 )					
		end
	end
end