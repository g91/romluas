
-- server 1632 
-- 4.0.6 - 修改 安德魯禮盒(206464) 物品內容及機率

function LuaDan_Xam2009_Gift( Option )
	local PlayerID = OwnerID()
	local PackageID = 206464		--安德魯禮盒
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	local KEY =  CountBodyItem( PlayerID , 203178 ) --古老的鑰匙
	local SEX = ReadRoleValue( OwnerID()  ,EM_RoleValue_SEX) 

	local Item = {	720612,		-- 活動用強大綜合包  
			227538,		-- 槲寄生之翼 
			725449,		-- 公會資源包
			205547,		-- 7天背包空間卷 - III	
			207747,		-- 7天銀行空間卷 - II	
			725526,		--酷裝武器防具
			720611,		-- 男酷裝包  
			720610	}	-- 女酷裝包 

	local probability = {	20,	 --1
   				  4,	--2
				30,	--3
				 12,	--4
				 12,	--5
				10,	--6
				12, 	--7 	       
				12} 	--8

	local RAND = rand(100)

	if ( Option == "CHECK" ) then
		local KEY =  CountBodyItem( PlayerID , 203178 ) --古老的鑰匙
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) and KEY > 0 then
			return true
		else
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_DAN_111700_30]" , 0 ) 
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_DAN_111700_30]" , 0 ) 
			return false
		end
	elseif ( Option == "USE" ) then
		if RAND > (100 - probability[1]) then
			GiveBodyItem( PlayerID , Item[1] , 1 )	-- 活動用強大綜合包  
			DelBodyItem( PlayerID , 203178 , 1 )
		elseif RAND > (100 - probability[1] - probability[2]) then   -- 槲寄生之翼 
			GiveBodyItem( PlayerID , Item[2] , 1 )	
			DelBodyItem( PlayerID , 203178 , 1 )
		elseif RAND > (100 - probability[1] - probability[2]- probability[3]) then   --   公會資源包
			GiveBodyItem( PlayerID , Item[3] , 1 )	
			DelBodyItem( PlayerID , 203178 , 1 )
		elseif RAND > (100 - probability[1] - probability[2]- probability[3]- probability[4]) then   --7天背包空間卷 - II
			GiveBodyItem( PlayerID , Item[4] , 1 )	
			DelBodyItem( PlayerID , 203178 , 1 )
		elseif RAND > (100 - probability[1] - probability[2]- probability[3]- probability[4]- probability[5]) then   --  7天銀行空間卷 - II
			GiveBodyItem( PlayerID , Item[5] , 1 )	
			DelBodyItem( PlayerID , 203178 , 1 )
		elseif RAND > (100 - probability[1] - probability[2]- probability[3]- probability[4]- probability[5]- probability[6] ) then   -- 酷裝武器防具
			GiveBodyItem( PlayerID , Item[6] , 1 )	
			DelBodyItem( PlayerID , 203178 , 1 )
		else
			if SEX == 0 then
				GiveBodyItem( PlayerID , Item[7] , 1 )	
				DelBodyItem( PlayerID , 203178 , 1 )
			else
				GiveBodyItem( PlayerID , Item[8] , 1 )	
				DelBodyItem( PlayerID , 203178 , 1 )
			end	
		end
	end
end



-- 2013 安德魯禮物箱
function Lua_na_Xam2013_Gift( Option )
	local Owner = OwnerID()
	local PackageID = 242094		--安德魯禮物箱
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( Owner , NeedSpace  )
	local KEY =  CountBodyItem( Owner , 203178 ) --古老的鑰匙
	local SEX = ReadRoleValue( Owner  ,EM_RoleValue_SEX) 
	local R = DW_Rand(100)
	local Item = {	[1] = { 15 , 242519} ,
			[2] = { 21 , 227538} ,
			[3] = { 44 , 725449} , 
			[4] = { 61 , 242513} , 
			[5] = { 78 , 242515} , 
			[6] = { 89 , 725526} , 
			[7] = { 90 , 242522} ,	
			[8] = { 100 , 720611, 720610}	}


	if ( Option == "CHECK" ) then
		local KEY =  CountBodyItem( Owner, 203178 ) --古老的鑰匙
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( Owner, PackageID ) >= 1 ) and KEY > 0 then
			return true
		else
			ScriptMessage( Owner , Owner, 1 , "[SC_DAN_111700_30]" , 0 ) 
			ScriptMessage( Owner , Owner, 0 , "[SC_DAN_111700_30]" , 0 ) 
			return false
		end
	elseif ( Option == "USE" ) then
		if R <= 90 then
			for i = 1 , #Item do
				if R <= Item[i][1] then
					GiveBodyItem( Owner , Item[i][2] , 1 )
					break
				end
			end
		else
			if SEX == 0 then
				GiveBodyItem( Owner , Item[8][2] , 1 )	
			else
				GiveBodyItem( Owner , Item[8][3] , 1 )	
			end	
		end
		DelBodyItem( Owner , 203178 , 1 )
	end
end