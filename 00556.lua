function Change_Custom_ID( Zone , Type , ID1 , ID2 , ID3 , ID4 )

	local DropID = { 725643 , 725644 , 725645 , 725646 , 725647 }
	local ZoneID = GetIniValueSetting ( "ZoneID" )

	if Type >= 1 and Type <= 5 then
		if Zone == ZoneID then
			-- 掉落物品ID
			WriteGameObjInfo_Double( DropID[Type] , "TreasureItem1" , ID1 )
			WriteGameObjInfo_Double( DropID[Type] , "TreasureItem2" , ID2 )
			WriteGameObjInfo_Double( DropID[Type] , "TreasureItem3" , ID3 )
			WriteGameObjInfo_Double( DropID[Type] , "TreasureItem4" , ID4 )
		else	
			return false
		end
	end
end

function Change_Custom_Percent( Zone , Type , Percent1 , Percent2 , Percent3 , Percent4 )

	local DropID = { 725643 , 725644 , 725645 , 725646 , 725647 }
	local ZoneID = GetIniValueSetting ( "ZoneID" )

	if Type >= 1 and Type <= 5 then
		if Zone == ZoneID then
			-- 掉落物品機率
			WriteGameObjInfo_Double( DropID[Type] , "TreasureCount1" , Percent1*1000 )
			WriteGameObjInfo_Double( DropID[Type] , "TreasureCount2" , Percent2*1000 )
			WriteGameObjInfo_Double( DropID[Type] , "TreasureCount3" , Percent3*1000 )
			WriteGameObjInfo_Double( DropID[Type] , "TreasureCount4" , Percent4*1000 )
		else	
			return false
		end
	end
end

function Change_Custom_Count( Zone , Type , Count1 , Count2 , Count3 , Count4 )

	local DropID = { 725643 , 725644 , 725645 , 725646 , 725647 }
	local ZoneID = GetIniValueSetting ( "ZoneID" )

	if Type >= 1 and Type <= 5 then
		if Zone == ZoneID then
			-- 掉落物品數量
			WriteGameObjInfo_Double( DropID[Type] , "Treasuredropcount1" , Count1 )
			WriteGameObjInfo_Double( DropID[Type] , "Treasuredropcount2" , Count2 )
			WriteGameObjInfo_Double( DropID[Type] , "Treasuredropcount3" , Count3 )
			WriteGameObjInfo_Double( DropID[Type] , "Treasuredropcount4" , Count4 )
		else	
			return false
		end
	end
end

function Change_Custom_Test( DropID )

	if DropID >= 720000 and DropID <= 729999 then
		for i = 1 , 1000 , 1 do
			GiveBodyItem( OwnerID() , DropID , 1 )
		end
		DebugMsg( 0 , 0 , "Running Over" )
	else
		DebugMsg( 0 , 0 , "Error ID" )
		return false
	end
end

--function Change_Custom_Drop( Zone , Type , ID1 , ID2 , ID3 , ID4 , Percent1 , Percent2 , Percent3 , Percent4 , Count1 , Count2 , Count3 , Count4 )
--
--	local DropID = { 725643 , 725644 , 725645 , 725646 }
--	local ZoneID = GetIniValueSetting ( "ZoneID" )
--	local MaxHeap = { }
--		MaxHeap[1] = GameObjInfo_Int( ID1 ,"MaxHeap" ) -- 抓物品的堆疊量
--		MaxHeap[2] = GameObjInfo_Int( ID2 ,"MaxHeap" )
--		MaxHeap[3] = GameObjInfo_Int( ID3 ,"MaxHeap" )
--		MaxHeap[4] = GameObjInfo_Int( ID4 ,"MaxHeap" )
--	local Quantity = { Count1 , Count2 , Count3 , Count4 }
--
--	for i = 1 , 4 , 1 do
--		if Quantity[i] > MaxHeap[i] then
--			return false
--		end
--	end
--
--	if Type >= 1 and Type <= 4 then
--		if Zone == ZoneID then
--			-- 掉落物品ID
--			WriteGameObjInfo_Double( DropID[Type] , "TreasureItem1" , ID1 )
--			WriteGameObjInfo_Double( DropID[Type] , "TreasureItem2" , ID2 )
--			WriteGameObjInfo_Double( DropID[Type] , "TreasureItem3" , ID3 )
--			WriteGameObjInfo_Double( DropID[Type] , "TreasureItem4" , ID4 )
--			-- 掉落物品機率
--			WriteGameObjInfo_Double( DropID[Type] , "TreasureCount1" , Percent1 )
--			WriteGameObjInfo_Double( DropID[Type] , "TreasureCount2" , Percent2 )
--			WriteGameObjInfo_Double( DropID[Type] , "TreasureCount3" , Percent3 )
--			WriteGameObjInfo_Double( DropID[Type] , "TreasureCount4" , Percent4 )
--			-- 掉落物品數量
--			WriteGameObjInfo_Double( DropID[Type] , "Treasuredropcount1" , Count1 )
--			WriteGameObjInfo_Double( DropID[Type] , "Treasuredropcount2" , Count2 )
--			WriteGameObjInfo_Double( DropID[Type] , "Treasuredropcount3" , Count3 )
--			WriteGameObjInfo_Double( DropID[Type] , "Treasuredropcount4" , Count4 )
--		else	
--			return false
--		end
--	end
--end