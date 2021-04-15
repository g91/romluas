function Hao_Gathering_Exchange(ItemID,ExChangeID)	-- 採集材料轉化，ItemID 為轉化前的物品，ExChangeID為轉化後的物品

	local Player = OwnerID()	-- 執行者

	if Check_Bag_Space( Player , 1 ) == false then	-- 當玩家身上的背包空間小於1時，則失敗
		ScriptMessage( Player , Player , 1 , "[K_08MID_DIALOG8]" , 0 )	-- 您的背包空間不足，請清理一下再來吧。
		return false
	end

	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )	-- 讀取 Room
	local ItemType = GameObjInfo_Int( ItemID , "ItemType" )	-- 讀取物品分類
	
	if ItemType >= 5 and ItemType <= 7 then
		local Rare = GameObjInfo_Int( ItemID , "Rare" )	-- 讀取該物品的稀有度
		local Count = {}	-- 轉化倍率
		Count[1] = 1	-- 綠轉白的數量，原為2
		Count[2] = 6	-- 藍轉白的數量，原為8
		Count[3] = 36	-- 紫轉白的數量，原為48
		GiveBodyItem( Player , ExChangeID , Count[Rare] )
	else
		DebugMsg( Player , Room , "ItemType Error" )	-- 物品分類錯誤
		return false
	end
end