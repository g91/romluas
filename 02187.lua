--怪異的布袋
function LuaI_XmasGife5( Option )
	local PlayerID = OwnerID()
	local PackageID = 203536		-- 怪異的布袋
	local NeedSpace = 3
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace )
--	Say(PlayerID,"PlayerID is "..PlayerID)
	local Item = {	203513,		-- 雪人變身藥水
			203521,		-- 暖冬甜心糖
			203515,		-- 7天雪人寵物
			203523,		-- 暖冬高級軟糖
			203524	}	-- 暖冬棒棒糖
	local probability = {	5,		-- 雪人變身藥水機率
			30,             	-- 暖冬甜心糖機率
			10,             	-- 7天雪人寵物機率
			30,             	-- 暖冬高級軟糖機率
			25	}       	-- 暖冬棒棒糖機率
	local RANDOWN = rand(100)

	if ( Option == "CHECK" ) then
--		Say(PlayerID,"PlayerID is "..PlayerID)
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		--Say(PlayerID,"RANDOWN is "..RANDOWN)
		if RANDOWN > (100 - probability[1]) then
			GiveBodyItem( PlayerID , Item[1] , rand(3)+1 )
			--Say(PlayerID," 1 ")
		elseif RANDOWN > (100 - probability[1] - probability[2]) then
			GiveBodyItem( PlayerID , Item[2] , rand(3)+1 )
			--Say(PlayerID," 2 ")					
		elseif RANDOWN > (100 - probability[1] - probability[2] - probability[3]) then
			GiveBodyItem( PlayerID , Item[3] , 1 )	
			--Say(PlayerID," 3 ")				
		elseif RANDOWN > (100 - probability[1] - probability[2] - probability[3] - probability[4]) then
			GiveBodyItem( PlayerID , Item[4] , rand(3)+1 )
			--Say(PlayerID," 4 ")					
		else
			GiveBodyItem( PlayerID , Item[5] , rand(3)+1 )
			--Say(PlayerID," 5 ")					
		end
	end
end

--雪人寵物箱 7天
function LuaI_XmasEgg01( Option )
	local PlayerID = OwnerID()
	local PackageID = 203515		
	local Item = 203514                                
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , Item , 1 )	
	end
end