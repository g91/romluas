function Test_Shop_ArmorLv1_Auto()
    	SetShop( OwnerID() , 600009 , "Test_Shop_Close" );
	SetPlot( OwnerID() , "Touch" , "Test_Shop_Open" , 150 );
end