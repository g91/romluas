--中秋禮包(小)
Function LuaI_202908(Option)
	local PlayerID = OwnerID()
	local PackageID = 202908
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
				GiveBodyItem( PlayerID , 721856 , 1 )		   ---test drop
		local randA= rand(100)
			if randA<= 4 then
				GiveBodyItem( PlayerID , 201611 , 1 )		--50格包裹
			elseif randA<= 4+15 then
				GiveBodyItem( PlayerID , 201967 , 1 )		--安心修理錘
			elseif randA<= 4+15+10 then
				GiveBodyItem( PlayerID ,202907, 1 )		--椰絨月餅
			elseif randA<= 4+15+10+10 then
				GiveBodyItem( PlayerID , 202451 , 1 )		--7天白馬
			elseif randA<= 4+15+10+10+10 then
				GiveBodyItem( PlayerID , 201141, 1 )		--賢哲的救贖
			elseif randA<= 4+15+10+10+10+20 then
				GiveBodyItem( PlayerID , 221576, 1 )		--初級生命護符
			elseif randA<= 4+15+10+10+10+20+20 then
				GiveBodyItem( PlayerID , 221577 , 1 )		--初級法力護符		
			else
				GiveBodyItem( PlayerID , 202231 , 1 )		--7天鶴駝
			end
	end

end