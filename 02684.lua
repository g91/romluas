-- 5.0.2 廠商需求禮包
Function LuaI_241599() --Starter Package Adventure

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , ""	, { 201095,10 ,201097,10 ,203040,10 ,201134,10 ,201610,10 ,222925,1 , 222926, 1 } }

	return BaseTressureProc(   itemset , 7  )
end

Function LuaI_241626() --Veteran Package Adventure

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , ""	, { 207771 , 10 , 207772,10 ,207773,10 ,201609,5 ,201617,5 ,201139,5 , 201141, 5 } }

	return BaseTressureProc(   itemset , 7  )
end


Function LuaI_241627() --Champion Package Adventure

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , ""	, { 207771, 10 , 207772,10 , 207773,10 , 203574,1 , 201618,1 , 202434,5 , 202506, 5 } }

	return BaseTressureProc(   itemset , 7  )
end


function LuaI_241834() --Fireboot Priest Pet Package

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , ""	, { 240189, 1 ,207575, 1 , 207576,1 } }

	return BaseTressureProc(   itemset , 3  )
end



function LuaI_241943()	-- 莎朵蕾之羽禮包
	local Owner= OwnerID()
	if EmptyPacketCount( Owner ) >= 1 then
		GiveBodyItemEx( Owner , 230324,  1 , 1 , 0 ,0 ,0 , 0 , 0 )	-- 物品號/數量/剩餘符文容量/附加能力編號/所鑲入符文代號*4
	else
		ScriptMessage( Owner , Owner , 1 , "[SYS_BAG_ENOUGH_CAPACITY]", 0 )
		return FALSE
	end	
end



function LuaI_241939(Option) --封印的莎朵蕾亞羽翼
	local PlayerID = OwnerID()
	local PackageID = 241939
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , 229704 , 1 )
	end
end