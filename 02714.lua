function lua_mika_weave_test_born1()
	Lua_Hao_Round_wall( OwnerID() , 121054 , 30 , 150 , 0 )   -- 實際  25 120   
end

function lua_mika_weave_test_born2()
	Lua_Hao_Round_wall( OwnerID() , 121054 , 20 , 100 , 0 )   -- 實際  15   70
end

function lua_mika_weave_test_born4()
	Lua_Hao_Round_wall( OwnerID() , 121045 , 25 , 160 , 0 )
end

function lua_mika_weave_test_born5()
	Lua_Hao_Round_wall( OwnerID() , 121097 , 25 , 120 , 0 )   --搶標會石柱
end

function lua_mika_weave_test_01()
	local CTRL = OwnerID() -- 活動npc
	local flag = 781176
	local range = 125		--活動半徑範圍
	local Leader = CreateObjByFlag( 121089 , flag , 0 , 1 )  -- 棋子id 0 
	AddToPartition( Leader , 0 )

	local Player = SearchRangePlayer( CTRL , range  ) --搜尋周圍玩家
	for i = 0 , table.getn(Player)-1  do 	--搜尋範圍內玩家
		if CheckBuff( Player[i] , 623225 ) == true then		-- 有報名證明buff的人
			say(Player[i], "123 player-"..i)
			AddBuff( Player[i] , 623229 , 0 , 310 )		--活動技能buff
			CancelBuff( Player[i] , 623225 )		--刪報名證明buff
			Callplot(Player[i], "sasa_Auction_checkrange" ,Leader )  -- 跑 檢查距離劇情
			say(Player[i], "456 player-"..i)
		end
	end
end