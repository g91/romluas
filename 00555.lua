function Zone105_Treasure_Init()
	-- SetMinimapIcon ( OwnerID(), 6 );
	SetPlot( OwnerID() , "Touch" , "Zone105_Treasure_Touch" , 15 );
end


function Zone105_Treasure_Touch()
	local Item3;
	local RandValue = Rand( 2 ) ;
	if( RandValue == 0 ) then
		Item3 = 721223;
	elseif( RandValue == 1 ) then
		Item3 = 721222;
--	elseif( RandValue == 2 ) then
--		Item3 = 721223;
--	elseif( RandValue == 3 ) then
--		Item3 = 20003;
	end

	
	TreasureTouch( OwnerID() , 201929 , 721221 , 721225 , Item3 )
end

function Zone105plus_Treasure_Init()
	-- SetMinimapIcon ( OwnerID(), 6 );
	SetPlot( OwnerID() , "Touch" , "Zone105plus_Treasure_Touch" , 15 );
end


function Zone105plus_Treasure_Touch()
	local Item3;
	local RandValue = Rand( 2 ) ;
	if( RandValue == 0 ) then
		Item3 = 721223;
	elseif( RandValue == 1 ) then
		Item3 = 721222;
--	elseif( RandValue == 2 ) then
--		Item3 = 721223;
--	elseif( RandValue == 3 ) then
--		Item3 = 20003;
	end

	
	TreasureTouch( OwnerID() , 0 , 721221 , 721225 , Item3 )
end

function Zone105EX_Treasure_Init()
	-- SetMinimapIcon ( OwnerID(), 6 );
	SetPlot( OwnerID() , "Touch" , "Zone105EX_Treasure_Touch" , 15 );
end


function Zone105EX_Treasure_Touch()
	local Item3;
	local RandValue = Rand( 2 ) ;
	if( RandValue == 0 ) then
		Item3 = 721223;
	elseif( RandValue == 1 ) then
		Item3 = 721222;
--	elseif( RandValue == 2 ) then
--		Item3 = 721223;
--	elseif( RandValue == 3 ) then
--		Item3 = 20003;
	end

	
	TreasureTouch( OwnerID() , 0 , 721221 , 721225 , Item3 )
end