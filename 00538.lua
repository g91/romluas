function TransferCombo()
	Beginplot( OwnerID() ,"TransferLove", 0 )
end

function TransferLove()	-- 傳送師之愛
	local n = 0
	local DialogStatus = 0

	local TransferSelect = {}
	TransferSelect[0] = { GetString("SO_EXIT") }				-- 離開對話
	TransferSelect[1] = { "Transfer Normal Zone" }
	TransferSelect[2] = { "Transfer High Level Zone" }
	if CheckBuff( OwnerID() , 501570) == false then  --增加檢查判斷
		DialogCreate( OwnerID() , EM_LuaDialogType_Select , "Where Do You GO ?" )
		for i = 0, table.getn( TransferSelect ) do
			DialogSelectStr( OwnerID() , TransferSelect[i][1] )
		end
		AddBuff(OwnerID() , 501570,0,-1);--然後給予BUFF
		if( DialogSendOpen( OwnerID() ) == false ) then 
			ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("SYS_FIXEQ_DATA_ERROR") , 0 )	--資料送出有問題
			return 0
		end
		while 1 do
			sleep( 1 )
			n = n + 1
			DialogStatus = DialogGetResult( OwnerID() )
			--Say( OwnerID() , DialogStatus )
			if n > 600 then -- 防無窮迴圈，600 = 一分鐘
				ScriptMessage( OwnerID() , OwnerID() , 0, "無窮迴圈或閒置過久", 0 )
				DialogClose( OwnerID() )
				CancelBuff( OwnerID(), 501570 );--最後清除BUFF
				break
			else
				--ScriptMessage( OwnerID() , OwnerID() , 0, "合法迴圈", 0 )
			end

			if ( DialogStatus == 0 ) or ( DialogStatus == -1 ) then
				DialogClose( OwnerID() )
				CancelBuff( OwnerID(), 501570 );--最後清除BUFF
				break
			elseif  ( DialogStatus ~= -2 ) then
				--DialogStatus = DialogStatus + 1
				--DialogClose( OwnerID() )
				break
			end
		end

		if ( DialogStatus == 1 ) then
		local TransferLove = {}
		TransferLove[0] = { "[SO_EXIT]" }									-- 離開對話
		TransferLove[1] = { "[ZONE_HINTERVALE]", 1, -3655, 210, -8596, 125 }						-- 開墾聚落, 克利絲汀
		TransferLove[2] = { "[ZONE_ROGSHIRE]", 1, -1155, 37, -5548, 100 }						-- 羅格鎮, 蘿拉
		TransferLove[3] = { "[ZONE_VARANAS]", 2, 2298, 0, 1153, 39 }	-- 凡瑞娜絲中央廣場區, 娜薇
		TransferLove[4] = { "[ZONE_ARGENFALL]", 4, -5917, 593, 2886,280  }						-- 銀瀑村, 亞紗
		TransferLove[5] = { "[ZONE_HAROLFE TRADING POST]", 5, -14466, 756, -170, 2 }				-- 哈洛夫交易站, 艾亞亞
		TransferLove[6] = { "[ZONE_OBSIDIAN BASTION]", 6, -20460, -190, 6507, 132 }				-- 黑曜石
		TransferLove[7] = { "[ZONE_AYEN CARAVAN]", 10,-38730, -2, 1543, 14 }				-- 蘇西莉亞
		TransferLove[8] = { "[ZONE_LAGO]", 11, -29454, 254 , -17630, 180 }				-- 龍牙山脊
		TransferLove[9] = { "[ZONE_STONES FURLOUGH]", 12, 28502, 312, 3465 , 180 }				-- 精靈島

		local TransferPlace = TransferDialog( OwnerID(), TransferLove )

		elseif ( DialogStatus == 2 ) then
		local TransferZone = {}
		TransferZone[0] = {"[SO_EXIT]" }							-- 離開對話
		TransferZone[1] = {"[ZONE_DUST HOLD]" , 3 , 13855, 27 , 6748, 175 }			-- 廢棄城寨
		TransferZone[2] = {"[ZONE_BOULDERWIND]" , 7 , 19672, 12 , 21907 , 340 }				-- 岩風村
		TransferZone[3] = {"[ZONE_THE GREEN TOWER]" , 8 , 5924 , 189 , 20751 , 210  }				-- 綠之塔
		TransferZone[4] = {"[ZONE_TITANS HILL]" , 9 , -11207 , 973 , 26316 , 70 }				--巨神之丘

		local TransferPlace = TransferDialog( OwnerID(), TransferZone )

		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	end

end

function TransferDialog( Player, TransferLocation )
	local n = 0
	local DialogStatus = 0
	DialogClose( Player )
	CancelBuff( Player, 501570 );--最後清除BUFF
	Sleep( 10 )	-- 防止第二層視窗立即關閉
	if CheckBuff( OwnerID() , 501570) == false then  --增加檢查判斷
		DialogCreate( Player , EM_LuaDialogType_Select , "Go TO Where ?" )
		for i = 0, table.getn( TransferLocation ) do
			DialogSelectStr( Player , TransferLocation[i][1] )
		end
		AddBuff(Player , 501570,0,-1);--然後給予BUFF
		if( DialogSendOpen( Player ) == false ) then 
			ScriptMessage( Player , Player , 1 , GetString("SYS_FIXEQ_DATA_ERROR") , 0 )	--資料送出有問題
			return 0
		end

		while 1 do
			sleep( 1 )
			n = n + 1
			DialogStatus = DialogGetResult( Player )
			if n > 300 then -- 防無窮迴圈，300 = 三十秒
				ScriptMessage( Player , Player , 0, "無窮迴圈或閒置過久", 0 )
				DialogClose( Player )
				CancelBuff( Player, 501570 );--最後清除BUFF
				break
			else
				--ScriptMessage( Player , Player , 0, "合法迴圈", 0 )
			end
			

			if ( DialogStatus == 0 ) or ( DialogStatus == -1 ) then
				DialogClose( Player )
				CancelBuff( Player, 501570 );--最後清除BUFF
				break
			elseif ( DialogStatus ~= -2 ) then
				--DialogStatus = DialogStatus + 1
				DialogClose( Player )
				CancelBuff( Player, 501570 );--最後清除BUFF
				ChangeZone( Player , TransferLocation[DialogStatus][2] , 0 , TransferLocation[DialogStatus][3], TransferLocation[DialogStatus][4] , TransferLocation[DialogStatus][5] , TransferLocation[DialogStatus][6]  )
				break
			end
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	end
end