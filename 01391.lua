------------------------------------------------------------------------------
--2009/11/04
--黑天馬坐騎包x2

--2009/10/26 新增
--2個掃帚坐騎

--2009/10/21 新增
--2個猛瑪坐騎包
--2個蛇頸龍坐騎包

-- 2009/06/03 新增
--18個野豬坐騎包
--8個犀牛坐騎包
------------------------------------------------------------------------------
--坐騎  204288     7天獅子坐騎包
------------------------------------------------------------------------------
function LuaI_204288( Option )
	local PlayerID = OwnerID()
	local PackageID = 204288		--7天獅子坐騎包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 204282 , 1 )	
	end
end
------------------------------------------------------------------------------
--坐騎  204289     30天獅子坐騎包
------------------------------------------------------------------------------
function LuaI_204289( Option )
	local PlayerID = OwnerID()
	local PackageID = 204289		--30天獅子坐騎包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 204283 , 1 )	
	end
end
------------------------------------------------------------------------------
--坐騎  204290     7天黑獅坐騎包
------------------------------------------------------------------------------
function LuaI_204290( Option )
	local PlayerID = OwnerID()
	local PackageID = 204290		--7天黑獅坐騎包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 204285 , 1 )	
	end
end
------------------------------------------------------------------------------
--坐騎  204291     30天黑獅坐騎包
------------------------------------------------------------------------------
function LuaI_204291( Option )
	local PlayerID = OwnerID()
	local PackageID = 204291		--30天黑獅坐騎包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 204286 , 1 )	
	end
end
------------------------------------------------------------------------------
--坐騎  204294     7天野豬坐騎包
------------------------------------------------------------------------------
function LuaI_204294( Option )
	local PlayerID = OwnerID()
	local PackageID = 204294		--7天野豬坐騎包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 204293 , 1 )	
	end
end
------------------------------------------------------------------------------
--坐騎  204295     30天野豬坐騎包
------------------------------------------------------------------------------
function LuaI_204295( Option )
	local PlayerID = OwnerID()
	local PackageID = 204295		--30天野豬坐騎包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 204292 , 1 )	
	end
end
------------------------------------------------------------------------------
--坐騎  204977     7天紫鬃野豬坐騎包
------------------------------------------------------------------------------
function LuaI_204977( Option )
	local PlayerID = OwnerID()
	local PackageID = 204977		--7天紫鬃野豬坐騎包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 204931 , 1 )	
	end
end
------------------------------------------------------------------------------
--坐騎  204978     30天紫鬃野豬坐騎包
------------------------------------------------------------------------------
function LuaI_204978( Option )
	local PlayerID = OwnerID()
	local PackageID = 204978		--30天紫鬃野豬坐騎包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 204930 , 1 )	
	end
end
------------------------------------------------------------------------------
--坐騎  204979     7天紅鬃野豬坐騎包
------------------------------------------------------------------------------
function LuaI_204979( Option )
	local PlayerID = OwnerID()
	local PackageID = 204979		--7天紅鬃野豬坐騎包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 204934 , 1 )	
	end
end
------------------------------------------------------------------------------
--坐騎  204982     30天紅鬃野豬坐騎包
------------------------------------------------------------------------------
function LuaI_204982( Option )
	local PlayerID = OwnerID()
	local PackageID = 204982		--30天紅鬃野豬坐騎包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 204933 , 1 )	
	end
end
------------------------------------------------------------------------------
--坐騎  204983    7天金鬃野豬坐騎包
------------------------------------------------------------------------------
function LuaI_204983( Option )
	local PlayerID = OwnerID()
	local PackageID = 204983		--7天金鬃野豬坐騎包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 204937 , 1 )	
	end
end
------------------------------------------------------------------------------
--坐騎  204984    30天金鬃野豬坐騎包
------------------------------------------------------------------------------
function LuaI_204984( Option )
	local PlayerID = OwnerID()
	local PackageID = 204984		--30天金鬃野豬坐騎包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 204936 , 1 )	
	end
end
------------------------------------------------------------------------------
--坐騎  204985    7天冰原野豬坐騎包
------------------------------------------------------------------------------
function LuaI_204985( Option )
	local PlayerID = OwnerID()
	local PackageID = 204985		--7天冰原野豬坐騎包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 204940 , 1 )	
	end
end
------------------------------------------------------------------------------
--坐騎  204986    30天冰原野豬坐騎包
------------------------------------------------------------------------------
function LuaI_204986( Option )
	local PlayerID = OwnerID()
	local PackageID = 204986		--30天冰原野豬坐騎包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 204939 , 1 )	
	end
end
------------------------------------------------------------------------------
--坐騎  204987   7天極地野豬坐騎包
------------------------------------------------------------------------------
function LuaI_204987( Option )
	local PlayerID = OwnerID()
	local PackageID = 204987		--7天極地野豬坐騎包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 204943 , 1 )	
	end
end
------------------------------------------------------------------------------
--坐騎  204988   30天極地野豬坐騎包
------------------------------------------------------------------------------
function LuaI_204988( Option )
	local PlayerID = OwnerID()
	local PackageID = 204988		--30天極地野豬坐騎包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 204942 , 1 )	
	end
end
------------------------------------------------------------------------------
--坐騎  204989   7天花斑野豬坐騎包
------------------------------------------------------------------------------
function LuaI_204989( Option )
	local PlayerID = OwnerID()
	local PackageID = 204989		--7天花斑野豬坐騎包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 204946 , 1 )	
	end
end
------------------------------------------------------------------------------
--坐騎  204990   30天花斑野豬坐騎包
------------------------------------------------------------------------------
function LuaI_204990( Option )
	local PlayerID = OwnerID()
	local PackageID = 204990		--30天花斑野豬坐騎包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 204945 , 1 )	
	end
end
------------------------------------------------------------------------------
--坐騎  204991   7天斑紋野豬坐騎包
------------------------------------------------------------------------------
function LuaI_204991( Option )
	local PlayerID = OwnerID()
	local PackageID = 204991		--7天斑紋野豬坐騎包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 204952 , 1 )	
	end
end
------------------------------------------------------------------------------
--坐騎  204992   30天斑紋野豬坐騎包
------------------------------------------------------------------------------
function LuaI_204992( Option )
	local PlayerID = OwnerID()
	local PackageID = 204992		--30天斑紋野豬坐騎包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 204951 , 1 )	
	end
end
------------------------------------------------------------------------------
--坐騎  204993  7天赤焰野豬坐騎包
------------------------------------------------------------------------------
function LuaI_204993( Option )
	local PlayerID = OwnerID()
	local PackageID = 204993		--7天赤焰野豬坐騎包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 204955 , 1 )	
	end
end
------------------------------------------------------------------------------
--坐騎  204994   30天赤焰野豬坐騎包
------------------------------------------------------------------------------
function LuaI_204994( Option )
	local PlayerID = OwnerID()
	local PackageID = 204994		--30天赤焰野豬坐騎包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 204954 , 1 )	
	end
end
------------------------------------------------------------------------------
--坐騎  204995  7天黃鬃野豬坐騎包
------------------------------------------------------------------------------
function LuaI_204995( Option )
	local PlayerID = OwnerID()
	local PackageID = 204995		--7天黃鬃野豬坐騎包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 204958 , 1 )	
	end
end
------------------------------------------------------------------------------
--坐騎  204996  30天黃鬃野豬坐騎包
------------------------------------------------------------------------------
function LuaI_204996( Option )
	local PlayerID = OwnerID()
	local PackageID = 204996		--30天黃鬃野豬坐騎包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 204957 , 1 )	
	end
end
------------------------------------------------------------------------------
--坐騎  204947  7天灰色刺角犀牛坐騎包
------------------------------------------------------------------------------
function LuaI_204947( Option )
	local PlayerID = OwnerID()
	local PackageID = 204947		--7天灰色刺角犀牛坐騎包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 204961 , 1 )	
	end
end
------------------------------------------------------------------------------
--坐騎  204948  30天灰色刺角犀牛坐騎包
------------------------------------------------------------------------------
function LuaI_204948( Option )
	local PlayerID = OwnerID()
	local PackageID = 204948		--30天灰色刺角犀牛坐騎包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 204960 , 1 )	
	end
end
------------------------------------------------------------------------------
--坐騎  204971  7天綠野刺角犀牛坐騎包
------------------------------------------------------------------------------
function LuaI_204971( Option )
	local PlayerID = OwnerID()
	local PackageID = 204971		--7天綠野刺角犀牛坐騎包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 204964 , 1 )	
	end
end
------------------------------------------------------------------------------
--坐騎  204972  30天綠野刺角犀牛坐騎包
------------------------------------------------------------------------------
function LuaI_204972( Option )
	local PlayerID = OwnerID()
	local PackageID = 204972		--30天綠野刺角犀牛坐騎包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 204963 , 1 )	
	end
end
------------------------------------------------------------------------------
--坐騎  204973  7天睿智刺角犀牛坐騎包
------------------------------------------------------------------------------
function LuaI_204973( Option )
	local PlayerID = OwnerID()
	local PackageID = 204973		--7天睿智刺角犀牛坐騎包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 204967 , 1 )	
	end
end
------------------------------------------------------------------------------
--坐騎  204974  30天睿智刺角犀牛坐騎包
------------------------------------------------------------------------------
function LuaI_204974( Option )
	local PlayerID = OwnerID()
	local PackageID = 204974		--30天睿智刺角犀牛坐騎包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 204966 , 1 )	
	end
end
------------------------------------------------------------------------------
--坐騎  204975  7天白色刺角犀牛坐騎包
------------------------------------------------------------------------------
function LuaI_204975( Option )
	local PlayerID = OwnerID()
	local PackageID = 204975		--7天白色刺角犀牛坐騎包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 204970 , 1 )	
	end
end
------------------------------------------------------------------------------
--坐騎  204976  30天白色刺角犀牛坐騎包
------------------------------------------------------------------------------
function LuaI_204976( Option )
	local PlayerID = OwnerID()
	local PackageID = 204976		--30天白色刺角犀牛坐騎包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 204969 , 1 )	
	end
end

------------------------------------------------------------------------------
--坐騎  206208   30天狂奔猛瑪坐騎包
------------------------------------------------------------------------------
function LuaI_206208( Option )
	local PlayerID = OwnerID()
	local PackageID = 206208		--包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206197 , 1 )	
	end
end
------------------------------------------------------------------------------
--坐騎  206209  7天狂奔猛瑪坐騎包
------------------------------------------------------------------------------
function LuaI_206209( Option )
	local PlayerID = OwnerID()
	local PackageID = 206209		--包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206198 , 1 )	
	end
end
------------------------------------------------------------------------------
--坐騎  206210 30天荒原猛瑪坐騎包
------------------------------------------------------------------------------
function LuaI_206210( Option )
	local PlayerID = OwnerID()
	local PackageID = 206210		--包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206200 , 1 )	
	end
end
------------------------------------------------------------------------------
--坐騎  206211  7天荒原猛瑪坐騎包
------------------------------------------------------------------------------
function LuaI_206211( Option )
	local PlayerID = OwnerID()
	local PackageID = 206211		--包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID ,206201 , 1 )	
	end
end
------------------------------------------------------------------------------
--坐騎  206212   30天劍刃蛇頸龍坐騎包
------------------------------------------------------------------------------
function LuaI_206212( Option )
	local PlayerID = OwnerID()
	local PackageID = 206212		--包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206203 , 1 )	
	end
end
------------------------------------------------------------------------------
--坐騎  206213   7天劍刃蛇頸龍坐騎包
------------------------------------------------------------------------------
function LuaI_206213( Option )
	local PlayerID = OwnerID()
	local PackageID =206213		--包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206204 , 1 )	
	end
end
------------------------------------------------------------------------------
--坐騎  206214  30天刺脊蛇頸龍坐騎包
------------------------------------------------------------------------------
function LuaI_206214( Option )
	local PlayerID = OwnerID()
	local PackageID = 206214		--包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206206 , 1 )	
	end
end
------------------------------------------------------------------------------
--坐騎  206215    7天刺脊蛇頸龍坐騎包
------------------------------------------------------------------------------
function LuaI_206215( Option )
	local PlayerID = OwnerID()
	local PackageID = 206215		--包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206207 , 1 )	
	end
end
------------------------------------------------------------------------------
--坐騎  206241    7天輕舞飛揚999坐騎包
------------------------------------------------------------------------------
function LuaI_206241( Option )
	local PlayerID = OwnerID()
	local PackageID = 206241		--包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206236 , 1 )	
	end
end
------------------------------------------------------------------------------
--坐騎  206240    30天輕舞飛揚999坐騎包
------------------------------------------------------------------------------
function LuaI_206240( Option )
	local PlayerID = OwnerID()
	local PackageID = 206240		--包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206235 , 1 )	
	end
end
------------------------------------------------------------------------------
--坐騎  206243    7天搗蛋3000坐騎包
------------------------------------------------------------------------------
function LuaI_206243( Option )
	local PlayerID = OwnerID()
	local PackageID = 206243		--包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206239 , 1 )	
	end
end
------------------------------------------------------------------------------
--坐騎  206242   30天搗蛋3000坐騎包
------------------------------------------------------------------------------
function LuaI_206242( Option )
	local PlayerID = OwnerID()
	local PackageID = 206242		--包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206238 , 1 )	
	end
end

------------------------------------------------------------------------------
--坐騎  205748   30天黑天馬坐騎包
------------------------------------------------------------------------------
function LuaI_205748( Option )
	local PlayerID = OwnerID()
	local PackageID = 205748		--包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 204997 , 1 )	
	end
end

------------------------------------------------------------------------------
--坐騎  205749   7天黑天馬坐騎包
------------------------------------------------------------------------------
function LuaI_205749( Option )
	local PlayerID = OwnerID()
	local PackageID = 205749		--包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 204998 , 1 )	
	end
end

------------------------------------------------------------------------------
--坐騎  206574   7天煉獄夢靨坐騎包
------------------------------------------------------------------------------
function LuaI_206574( Option )
	local PlayerID = OwnerID()
	local PackageID = 206574		--包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206556 , 1 )	
	end
end

------------------------------------------------------------------------------
--坐騎  206575   30天煉獄夢靨坐騎包
------------------------------------------------------------------------------
function LuaI_206575( Option )
	local PlayerID = OwnerID()
	local PackageID = 206575		--包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206557 , 1 )	
	end
end

------------------------------------------------------------------------------
--坐騎  206576   7天幽冥夢魘坐騎包
------------------------------------------------------------------------------
function LuaI_206576( Option )
	local PlayerID = OwnerID()
	local PackageID = 206576		--包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206559 , 1 )	
	end
end

------------------------------------------------------------------------------
--坐騎  206577   30天幽冥夢魘坐騎包
------------------------------------------------------------------------------
function LuaI_206577( Option )
	local PlayerID = OwnerID()
	local PackageID = 206577		--包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206560 , 1 )	
	end
end

------------------------------------------------------------------------------
--坐騎  206584   7天蒼火夢魘坐騎包
------------------------------------------------------------------------------
function LuaI_206584( Option )
	local PlayerID = OwnerID()
	local PackageID = 206584		--包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206571 , 1 )	
	end
end

------------------------------------------------------------------------------
--坐騎  206585   30天蒼火夢魘坐騎包
------------------------------------------------------------------------------
function LuaI_206585( Option )
	local PlayerID = OwnerID()
	local PackageID = 206585		--包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206572 , 1 )	
	end
end

------------------------------------------------------------------------------
--坐騎  206582   7天金燄夢魘坐騎包
------------------------------------------------------------------------------
function LuaI_206582( Option )
	local PlayerID = OwnerID()
	local PackageID = 206582		--包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206568 , 1 )	
	end
end

------------------------------------------------------------------------------
--坐騎  206583   30天金燄夢魘坐騎包
------------------------------------------------------------------------------
function LuaI_206583( Option )
	local PlayerID = OwnerID()
	local PackageID = 206583		--包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206569 , 1 )	
	end
end

------------------------------------------------------------------------------
--坐騎  206580   7天深淵夢魘坐騎包
------------------------------------------------------------------------------
function LuaI_206580( Option )
	local PlayerID = OwnerID()
	local PackageID = 206580		--包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206565 , 1 )	
	end
end

------------------------------------------------------------------------------
--坐騎  206581   30天深淵夢魘坐騎包
------------------------------------------------------------------------------
function LuaI_206581( Option )
	local PlayerID = OwnerID()
	local PackageID = 206581		--包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206566 , 1 )	
	end
end

------------------------------------------------------------------------------
--坐騎  206578   7天魔血夢魘坐騎包
------------------------------------------------------------------------------
function LuaI_206578( Option )
	local PlayerID = OwnerID()
	local PackageID = 206578		--包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206562 , 1 )	
	end
end

------------------------------------------------------------------------------
--坐騎  206579   30天魔血夢魘坐騎包
------------------------------------------------------------------------------
function LuaI_206579( Option )
	local PlayerID = OwnerID()
	local PackageID = 206579		--包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206563 , 1 )	
	end
end