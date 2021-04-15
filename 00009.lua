function Test_Shop_Auto()
 	SetShop( OwnerID() , 600000 , "Test_Shop_Close" );
	SetPlot( OwnerID() , "Touch" , "Test_Shop_Open" , 150 );
end