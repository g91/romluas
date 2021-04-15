function Hsinag_TreasureTest_Init()
	-- SetMinimapIcon ( OwnerID(), 6 );
	SetPlot( OwnerID() , "Touch" , "Hsinag_TreasureTest_Touch" , 50 );
end

function Hsinag_TreasureTest_Touch()

	if( KillID( OwnerID() , TargetID() ) == true ) then 
		GiveBodyItem( OwnerID() , 210001 , 1 );
--		                物品編號也可以是掉落表, count
	end		

end

