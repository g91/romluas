function Zone2_Treasure_Init()
	-- SetMinimapIcon ( OwnerID(), 6 );
	SetPlot( OwnerID() , "Touch" , "Zone2_Treasure_Touch" , 15 );
end


function Zone2_Treasure_Touch()
	local Item3;
	local RandValue = Rand( 2 ) ;
	if( RandValue == 0 ) then
		Item3 = 721229;
	elseif( RandValue == 1 ) then
		Item3 = 721230;
	end
	
	TreasureTouch( OwnerID() , 201631 , 721227 , 721225 , Item3 )
end