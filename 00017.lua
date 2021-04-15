function Init_Role_ModeValue()
	Def_Mode_Show 		= Hex( "0x00000001" )  	-- 秀出(不論秀出或隱藏, 標記/致能)
	Def_Mode_Mark	    	= Hex( "0x00000002" )  	-- 可標記/點選(可以讓玩家點選)
	Def_Mode_Obstruct    	= Hex( "0x00000004" )	-- 會阻擋(阻擋其他的物件)
	Def_Mode_Gravity	                = Hex( "0x00000008" )	-- 有重力(地心引力, 計算物件與地面的碰撞,否則依照 Client 送來的座標, 不會依地面高度改變 y)
	Def_Mode_Save	    	= Hex( "0x00000010" )	-- 此物件是否要儲存
	Def_Mode_Drag                      = Hex( "0x00000020" )    -- 有阻力的

	Def_Mode_Trade		= Hex( "0x00000100" )	-- 可交易
	Def_Mode_Sell		= Hex( "0x00000200" )	-- 可買賣
	Def_Mode_Logoutdel	= Hex( "0x00000400" )	-- 離線消失
	Def_Mode_Expense		= Hex( "0x00000800" )	-- 消耗
	Def_Mode_Coloring	= Hex( "0x00001000" )	-- 可染色
	Def_Mode_GuildMark	= Hex( "0x00002000" )	-- 公會章
	Def_Mode_EQSoulBound      = Hex( "0x00004000" )	-- 裝備禁制

	Def_Mode_Strikback	= Hex( "0x00010000" )	-- 反擊
	Def_Mode_Move		= Hex( "0x00020000" )	-- 移動
	Def_Mode_Searchenemy	= Hex( "0x00040000" )	-- 搜尋敵人
	Def_Mode_Revive		= Hex( "0x00080000" )	-- 可重生(告知 SERVER, 開啟此旗標的物件需要重生, 重生時間查看 Revive)
	Def_Mode_Fight		= Hex( "0x00100000" )	-- 可砍殺攻擊(開啟此旗標的物件可以被砍殺)
	Def_Mode_Escape		= Hex( "0x00200000" )	-- 逃跑
	Def_Mode_SearchIgnore	= Hex( "0x00400000" )	-- 此物件不會被搜尋到
end