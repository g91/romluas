function PICTURE_WAP_SHOP()
  	SetMinimapIcon ( OwnerID(), 100 );
	SetShop( OwnerID() , 600029 , "Test_Shop_Close" );
	SetPlot( OwnerID() , "Touch" , "Test_Shop_Open" , 150 );
end