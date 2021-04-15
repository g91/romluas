--活動副本-古代秘寶
-----獎勵.物品


-- 古代秘寶遺跡調查憑證
function LuaI_206426( Option ) --古代秘寶遺跡調查憑證
	local PlayerID = OwnerID()
	local PackageID = 206426		--古代秘寶遺跡調查憑證
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if CheckFlag(PlayerID, 543406) == false then --無keyitem
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_LOSTTREASURE_RESETTICKET2]" , C_SYSTEM )	--你目前不需要重置此副本。
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_LOSTTREASURE_RESETTICKET2]"  , C_SYSTEM )
			return false
		elseif CheckFlag(PlayerID, 543406) == true then --有keyitem
			return true
		end

	elseif ( Option == "USE" ) then		
		SetFlag(PlayerID, 543406, 0) 
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_LOSTTREASURE_RESETTICKET]" , C_SYSTEM )	--你現在可以重新挑戰古代秘寶遺跡了！
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_LOSTTREASURE_RESETTICKET]"  , C_SYSTEM )
	end
end


--古代秘寶效果卡片組合
function Lua_206425_GET() --命運盒子
	BeginPlot(  OwnerID()  , "Lua_mika_losttreasuredes03" , 0 )  
	sleep(30)
end

function Lua_206425USEAREA()--古代秘寶效果卡片組合判斷區域
	local ZoneID =  ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID ) 
	local Zone = ZoneID -1000*math.floor( ZoneID / 1000 )
	if Zone == 355 then
		return true
	else
		ScriptMessage( OwnerID(),OwnerID(),1,"[SC_DAN_111700_37]",0)
		return false
	end	
end


function LuaI_206427( Option ) --稀有武器配方卷軸
	local PlayerID = OwnerID()
	local PackageID = 206427		--稀有武器配方卷軸
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end

	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 725026 , 1 )	 --掉寶
	end
end

--坐騎碎片
function LuaI_206631( Option ) --幽冥夢魘契約協定
	local PlayerID = OwnerID()
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	local item1 = CountBodyItem( PlayerID, 206631) 
	local item2 = CountBodyItem( PlayerID, 206632) 
	local item3 = CountBodyItem( PlayerID, 206633) 
	local item4 = CountBodyItem( PlayerID, 206634) 
	local item5 = CountBodyItem( PlayerID, 206635) 

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			ScriptMessage( OwnerID(), OwnerID()  , 1 ,"[SC_TREASURE_NOSPACE]" ,0  )--
			ScriptMessage( OwnerID(), OwnerID()  , 0 ,"[SC_TREASURE_NOSPACE]" ,0  )--
			return false
		elseif item1 >= 1 and item2 >=1 and item3 >=1 and item4 >=1 and item5 >=1 then
			DelBodyItem( PlayerID, 206632, 1) 
			DelBodyItem( PlayerID, 206633, 1) 
			DelBodyItem( PlayerID, 206634, 1) 
			DelBodyItem( PlayerID, 206635, 1) 
			return true
		else
			ScriptMessage( OwnerID(), OwnerID()  , 1 ,"[SC_0908SEANSON_26]" ,0  )--你所持的物品數量不足。
			ScriptMessage( OwnerID(), OwnerID()  , 0 ,"[SC_0908SEANSON_26]" ,0  )--你所持的物品數量不足。
			return false
		end

	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID ,206560 , 1 )	 --坐騎
	end
end

function LuaI_206636( Option ) --蒼火夢魘契約協定
	local PlayerID = OwnerID()
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	local item1 = CountBodyItem( PlayerID, 206636) 
	local item2 = CountBodyItem( PlayerID, 206637) 
	local item3 = CountBodyItem( PlayerID, 206638) 
	local item4 = CountBodyItem( PlayerID, 206639) 
	local item5 = CountBodyItem( PlayerID, 206640) 
	local item6 = CountBodyItem( PlayerID, 206641)

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			ScriptMessage( OwnerID(), OwnerID()  , 1 ,"[SC_TREASURE_NOSPACE]" ,0  )--
			ScriptMessage( OwnerID(), OwnerID()  , 0 ,"[SC_TREASURE_NOSPACE]" ,0  )--
			return false
		elseif item1 >= 1 and item2 >=1 and item3 >=1 and item4 >=1 and item5 >=1 and item6 >=1 then
			DelBodyItem( PlayerID, 206637, 1) 
			DelBodyItem( PlayerID, 206638, 1) 
			DelBodyItem( PlayerID, 206639, 1) 
			DelBodyItem( PlayerID, 206640, 1) 
			DelBodyItem( PlayerID, 206641, 1) 
			return true
		else
			ScriptMessage( OwnerID(), OwnerID()  , 1 ,"[SC_0908SEANSON_26]" ,0  )--你所持的物品數量不足。
			ScriptMessage( OwnerID(), OwnerID()  , 0 ,"[SC_0908SEANSON_26]" ,0  )--你所持的物品數量不足。
			return false
		end

	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID ,206572 , 1 )	 --坐騎
	end
end

--獎勵寶箱物品(和npc兌換)
function LuaI_206428( Option ) --古老寶箱
	local PlayerID = OwnerID()
	local PackageID = 206428		--古老寶箱
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end

	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 725010 , 1 )	 --掉寶
	end
end

function LuaI_206429( Option ) --翡翠寶箱
	local PlayerID = OwnerID()
	local PackageID = 206429		--翡翠寶箱
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end

	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 725051 , 1 )	 --掉寶
	end
end

function LuaI_206430( Option ) --翡翠寶箱
	local PlayerID = OwnerID()
	local PackageID = 206430		--翡翠寶箱
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end

	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 725013 , 1 )	 --掉寶
	end
end

function LuaI_206431( Option ) --背包空間體驗書卷
	local PlayerID = OwnerID()
	local PackageID = 206431		--背包空間體驗書卷
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end

	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 725025 , 1 )	 --掉寶
	end
end