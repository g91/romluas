function k_2009xmas_2() ----npc掛這個  test ok

	BeginPlot( OwnerID() , "k_2009xmas_1" , 0 )

end

function k_2009xmas_3()	--送buffer 檢查段	
			if GetSystime(1) == 0  and  GetSystime(2) >= 0 and  GetSystime(3) == 0 and  GetSystime(4) == 1   then   ---12~1送buffer
				if CheckBuff( OwnerID() ,492099 ) ~= true then 
					CastSpell( OwnerID()  ,492099 )
					sleep( 10 )
				end
			end
end

function k_2009xmas_1()		--倒數廣播 --掛在中央水池
	while 1 do
			if GetSystime(1) == 23  and  GetSystime(2) == 0 and  GetSystime(3) == 11 and  GetSystime(4) == 31   then   ---剛好11點
				ScriptMessage( OwnerID(), -1, 0, GetString("K_2008xmss_1_s8"), 0 );
			sleep( 250 )
			end

			if GetSystime(1) == 23  and  GetSystime(2) == 30 and  GetSystime(3) == 11 and  GetSystime(4) == 31   then   ---剛好11點30
				ScriptMessage( OwnerID(), -1, 0, GetString("K_2008xmss_1_s8"), 0 );
			sleep( 250 )
			end

			if GetSystime(1) == 23  and  GetSystime(2) == 50 and  GetSystime(3) == 11 and  GetSystime(4) == 31   then   ---剛好11點50
				ScriptMessage( OwnerID(), -1, 0, GetString("K_2008xmss_1_s8"), 0 );
			sleep( 250 )
			end

			if GetSystime(1) == 23 and  GetSystime(2) == 59 and  GetSystime(3) == 11 and  GetSystime(4) == 31   then   ---剛好11點59----------------------------test
			 
				ScriptMessage( OwnerID(), -1, 0,GetString("K_2008xmss_1_s8") , 0 );
			sleep( 495 )					-----------------------time 500
				ScriptMessage( OwnerID(), -1, 0, "10", 0 );
			sleep( 10 )
				ScriptMessage( OwnerID(), -1, 0, "9", 0 );
			sleep( 10 )
				ScriptMessage( OwnerID(), -1, 0, "8", 0 );
			sleep( 10 )
				ScriptMessage( OwnerID(), -1, 0, "7", 0 );
			sleep( 10 )
				ScriptMessage( OwnerID(), -1, 0, "6", 0 );
			sleep( 10 )
				ScriptMessage( OwnerID(), -1, 0, "5", 0 );
			sleep( 10 )
				ScriptMessage( OwnerID(), -1, 0, "4", 0 );
			sleep( 10 )
				ScriptMessage( OwnerID(), -1, 0, "3", 0 );
			sleep( 10 )
				ScriptMessage( OwnerID(), -1, 0, "2", 0 );
			sleep( 10 )
				ScriptMessage( OwnerID(), -1, 0, "1", 0 );
			sleep( 20 )
				ScriptMessage( OwnerID(), -1, 0, "[SC_XAMS_HAPPYNEWYEAR]", 0 );
				SetPlot( OwnerID(),"range","k_2009xmas_4",2500 )


			end

	sleep( 10 )
	end
end



function k_2009xmas_4()		--放機關
	local Rpop = rand(5)
	local popR = rand(5)


	
--	Say( OwnerID(), "Owner_k_2009xmas_4" )
	CastSpell(OwnerID(), OwnerID(),492099)--new year buff
	sleep( 10 )
		if popR == 0 then  GiveBodyItem( OwnerID(),  203291  , 5 ) end
		if popR == 1 then  GiveBodyItem( OwnerID(), 203292  , 5 ) end
		if popR == 2 then  GiveBodyItem( OwnerID(), 203293  , 5 ) end
		if popR == 3 then  GiveBodyItem( OwnerID(),  203294  , 5 ) end
		if popR == 4 then  GiveBodyItem( OwnerID(),  203295  , 5 ) end
		if Rpop == 2 then
			CastSpell(OwnerID(), OwnerID(),492188)--event pop (show)
		end

end

