function lua_mika_weave_test_born1()
	Lua_Hao_Round_wall( OwnerID() , 121054 , 30 , 150 , 0 )   -- ���  25 120   
end

function lua_mika_weave_test_born2()
	Lua_Hao_Round_wall( OwnerID() , 121054 , 20 , 100 , 0 )   -- ���  15   70
end

function lua_mika_weave_test_born4()
	Lua_Hao_Round_wall( OwnerID() , 121045 , 25 , 160 , 0 )
end

function lua_mika_weave_test_born5()
	Lua_Hao_Round_wall( OwnerID() , 121097 , 25 , 120 , 0 )   --�m�з|�۬W
end

function lua_mika_weave_test_01()
	local CTRL = OwnerID() -- ����npc
	local flag = 781176
	local range = 125		--���ʥb�|�d��
	local Leader = CreateObjByFlag( 121089 , flag , 0 , 1 )  -- �Ѥlid 0 
	AddToPartition( Leader , 0 )

	local Player = SearchRangePlayer( CTRL , range  ) --�j�M�P�򪱮a
	for i = 0 , table.getn(Player)-1  do 	--�j�M�d�򤺪��a
		if CheckBuff( Player[i] , 623225 ) == true then		-- �����W�ҩ�buff���H
			say(Player[i], "123 player-"..i)
			AddBuff( Player[i] , 623229 , 0 , 310 )		--���ʧޯ�buff
			CancelBuff( Player[i] , 623225 )		--�R���W�ҩ�buff
			Callplot(Player[i], "sasa_Auction_checkrange" ,Leader )  -- �] �ˬd�Z���@��
			say(Player[i], "456 player-"..i)
		end
	end
end