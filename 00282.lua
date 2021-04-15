function PICTURE_GIRL_SHOP()
  	SetMinimapIcon ( OwnerID(), 101 );
	SetShop( OwnerID() , 600031 , "Test_Shop_Close" );
	SetPlot( OwnerID() , "Touch" , "Test_Shop_Open" , 150 );
end