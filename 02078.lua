--開啟稱號包用的function
--	Option		(1) "CHECK"	物品使用前檢查
--			(2) "USE"	物品使用效果
--	PackageID			掛這個function的包的編號
--	GiveID				開包之後要給予的稱號編號
--	NeedSpace			檢查玩家身上足夠格數以及給予的數量

------------------------------------------------------------------------------
function LuaI_mika_opentitleitem( Option,PackageID,GiveID)
	local PlayerID = OwnerID()
	local Pcount = CountBodyItem( PlayerID , PackageID ) -- 包包的數量
	local Tcount = CountBodyItem( PlayerID , GiveID ) -- 稱號的數量

	if ( Option == "CHECK" ) then
		if Pcount < 1 then  -- 沒有包包
			return false
		elseif Tcount >= 1 then --已經有此稱號
			ScriptMessage(OwnerID(), OwnerID(), 1, "[SC_GOBLINTITLE05]",0)  --你已經擁有此稱號。
			ScriptMessage(OwnerID(), OwnerID(), 0, "[SC_GOBLINTITLE05]",0)  
			return false
		else
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , GiveID , 1 ) --給稱號
	end
end