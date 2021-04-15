----------------------------------------------------------------------------
--貨幣物品轉換為數值的通用函式
--輸入：貨幣的物品類型
-- Type = 1，試煉徽章
-- Type = 2，古代遺物
-- Type = 3，夢境先遣印記
-- Type = 4，必爾汀圓貝
-- Type = 5，正義能量
-- Type = 6，傳奇之證
-- Type = 7，榮譽點數
-- Type = 8，鏡幻徽印
----------------------------------------------------------------------------
function TokenItemsToValue( Type )
	CallPlot( OwnerID() , "TokenItemsToValue_2" , Type )
end
function TokenItemsToValue_2( Type )
	local OwnID = OwnerID()
	local ItemsTypeTable = { --貨幣物品清單
	206686 , -- Type = 1，試煉徽章
	206879 , -- Type = 2，古代遺物
	208681 , -- Type = 3，夢境先遣印記
	240181 , -- Type = 4，必爾汀圓貝
	201545 , -- Type = 5，正義能量
	241706 , -- Type = 6，傳奇之證
	203944 , -- Type = 7，榮譽點數
	200222 } -- Type = 8，鏡幻徽印
	
	local TokenValueTable = { --貨幣的數值編號
	8 , 	-- TokenValue = 8		--試煉徽章
	9 , 	-- TokenValue = 9		--古代遺物
	10 , 	-- TokenValue = 10	--夢境先遣印記
	11 , 	-- TokenValue = 11	--必爾汀圓貝
	12 , 	-- TokenValue = 12	--正義能量
	13 ,	-- TokenValue = 13	--傳說之證
	4 ,	-- TokenValue = 4	--榮譽點數
	15 }	-- TokenValue = 15	--鏡幻徽印
	
	local TokenValueNameTable = { --貨幣數值清單
	EM_RoleValue_TrialBadgeCoin , -- Type = 1，試煉徽章
	EM_RoleValue_RelicsCoin , -- Type = 2，古代遺物
	EM_RoleValue_DreamlandCoin , -- Type = 3，夢境先遣印記
	EM_RoleValue_PhiriusShellCoin , -- Type = 4，必爾汀圓貝
	EM_RoleValue_EnergyJusticeCoin , -- Type = 5，正義能量
	EM_RoleValue_ProofLegendCoin , -- Type = 6，傳奇之證
	EM_RoleValue_Honor , -- Type = 7，榮譽點數
	EM_RoleValue_MirrorCoin } -- Type = 8，鏡幻徽印
	
	local TokenLimitTable = { --貨幣數值上限清單，-1 = 無上限
	-1 , -- Type = 1，試煉徽章
	10000 , -- Type = 2，古代遺物
	-1 , -- Type = 3，夢境先遣印記
	1000 , -- Type = 4，必爾汀圓貝
	-1 , -- Type = 5，正義能量
	-1 , -- Type = 6，傳奇之證
	25000 , -- Type = 7，榮譽點數
	-1 } -- Type = 8，鏡幻徽印
	

	local TokenStringTable = { --貨幣的字串
	"[SYS_MONEY_TYPE_8]" , 
	"[SYS_MONEY_TYPE_9]" , 
	"[SYS_MONEY_TYPE_10]" , 
	"[SYS_MONEY_TYPE_11]" , 
	"[SYS_MONEY_TYPE_12]" , 
	"[SYS_MONEY_TYPE_13]" ,
	"[SYS_MONEY_TYPE_4]" ,
	"[SYS_MONEY_TYPE_15]" } 
	
	local TokenItemCount = CountBodyItem( OwnID , ItemsTypeTable[ Type ] ) --目前使用貨幣物品的數量
	local TokenValueCount = ReadRoleValue( OwnID , TokenValueNameTable[ Type ] ) --目前欲轉換的貨幣數值數量
	
	local CompleteString = "[SC_TOKEN_STRING_8][$SETVAR1 = "..TokenItemCount.." ][$SETVAR2 = "..TokenStringTable[ Type ].."]" --兌換成功的字串
	local FailString = "[SC_TOKEN_STRING_3]" --兌換失敗的字串
--	DebugMsg( 0 , 0 , "ItemsType = " .. ItemsTypeTable[Type] )
--	DebugMsg( 0 , 0 , "TokenValue = " .. TokenValueTable[Type] )
--	DebugMsg( 0 , 0 , "TokenValueName = " .. TokenValueNameTable[Type] )
--	DebugMsg( 0 , 0 , "TokenLimit = " .. TokenLimitTable[Type] )
--	DebugMsg( 0 , 0 , "TokenItemCount = " .. TokenItemCount )
--	DebugMsg( 0 , 0 , "TokenValueCount = " .. TokenValueCount )
	
	if TokenLimitTable[ Type ] > 0 then --如果超過貨幣數值上限，則不做轉換，並顯示訊息
		if TokenValueCount + TokenItemCount > TokenLimitTable[ Type ] then
			DelBodyItem( OwnID , ItemsTypeTable[ Type ] , TokenLimitTable[ Type ] - TokenValueCount ) --刪除物品成功轉化的物品
			AddSpeicalCoin( OwnID , 11 , TokenValueTable[ Type ] , TokenLimitTable[ Type ] - TokenValueCount ) --把貨幣數值補至上限
			ScriptMessage( OwnID , OwnID , 2 , TokenStringTable[ Type ]..FailString , 0 )
			return
		end
	end
	
	DelBodyItem( OwnID , ItemsTypeTable[ Type ] , TokenItemCount ) --刪除物品
	AddSpeicalCoin( OwnID , 11 , TokenValueTable[ Type ] , TokenItemCount ) --給予貨幣數值
	ScriptMessage( OwnID , OwnID , 2 , CompleteString , 0 ) --轉換成功訊息
end
----------------------------------------------------------------------------
--給予特定數量貨幣數值的通用函式
--輸入：貨幣的物品類型(Type)、給予的數量(Number)
-- Type = 1，試煉徽章
-- Type = 2，古代遺物
-- Type = 3，夢境先遣印記
-- Type = 4，必爾汀圓貝
-- Type = 5，正義能量
-- Type = 6，傳奇之證
-- Type = 7，榮譽點數
-- Type = 8，勇士勳章
-- Type = 9，鏡幻徽印
----------------------------------------------------------------------------
function YOYO_GetTokenValue( Type , Number )
	local OwnID = OwnerID()
	local TokenValueTable = { --貨幣的數值編號
	8 , 	-- TokenValue = 8		--試煉徽章
	9 , 	-- TokenValue = 9		--古代遺物
	10 , 	-- TokenValue = 10	--夢境先遣印記
	11 , 	-- TokenValue = 11	--必爾汀圓貝
	12 , 	-- TokenValue = 12	--正義能量
	13 , 	-- TokenValue = 13	--傳說之證
	4 , 	-- TokenValue = 4	--榮譽點數
	14 ,	-- TokenValue = 14	--勇士勳章
	15 }	-- TokenValue = 15	--鏡幻徽印
	
	local TokenValueNameTable = { --貨幣數值清單
	EM_RoleValue_TrialBadgeCoin , -- Type = 1，試煉徽章
	EM_RoleValue_RelicsCoin , -- Type = 2，古代遺物
	EM_RoleValue_DreamlandCoin , -- Type = 3，夢境先遣印記
	EM_RoleValue_PhiriusShellCoin , -- Type = 4，必爾汀圓貝
	EM_RoleValue_EnergyJusticeCoin , -- Type = 5，正義能量
	EM_RoleValue_ProofLegendCoin , -- Type = 6，傳奇之證
	EM_RoleValue_Honor , -- Type = 7，榮譽點數
	EM_RoleValue_DuelistReward , -- Type = 8，勇士勳章
	EM_RoleValue_MirrorCoin } -- Type = 9，鏡幻徽印
	
	local TokenLimitTable = { --貨幣數值上限清單，-1 = 無上限
	-1 , -- Type = 1，試煉徽章
	10000 , -- Type = 2，古代遺物
	-1 , -- Type = 3，夢境先遣印記
	1000 , -- Type = 4，必爾汀圓貝
	-1 , -- Type = 5，正義能量
	-1 , -- Type = 6，傳奇之證
	25000 , -- Type = 7，榮譽點數
	20000 ,  -- Type = 8，勇士勳章
	-1 } -- Type = 9，鏡幻徽印
	
	local TokenStringTable = { --貨幣的字串
	"[SYS_MONEY_TYPE_8]" , 
	"[SYS_MONEY_TYPE_9]" , 
	"[SYS_MONEY_TYPE_10]" , 
	"[SYS_MONEY_TYPE_11]" , 
	"[SYS_MONEY_TYPE_12]" , 
	"[SYS_MONEY_TYPE_13]" , 
	"[SYS_MONEY_TYPE_4]" , 
	"[SYS_MONEY_TYPE_14]" , 
	"[SYS_MONEY_TYPE_15]" } 
	
	local TokenValueCount = ReadRoleValue( OwnID , TokenValueNameTable[ Type ] ) --目前擁有的貨幣數值數量
	
	local CompleteString = "[SC_TOKEN_STRING_9][$SETVAR1 = "..Number.."][$SETVAR2 = "..TokenStringTable[ Type ].."]" --兌換成功的字串
	local FailString = "[SC_TOKEN_STRING_6]" --兌換失敗的字串
	
	AddSpeicalCoin( OwnID , 11 , TokenValueTable[ Type ] , Number ) --給予貨幣數值
	ScriptMessage( OwnID , OwnID , 2 , CompleteString , 0 ) --獲得貨幣的訊息
	
	if TokenLimitTable[ Type ] > 0 then --如果超過貨幣數值上限，則出警告訊息
		if TokenValueCount + Number > TokenLimitTable[ Type ] then
			ScriptMessage( OwnID , OwnID , 2 , TokenStringTable[ Type ] .. FailString , 0 )
		end
	end
end