function Test_Shop_ArmorLv10_Auto()
    	SetShop( OwnerID() , 600010 , "Test_Shop_Close" );
	SetPlot( OwnerID() , "Touch" , "Test_Shop_Open" , 150 );
end