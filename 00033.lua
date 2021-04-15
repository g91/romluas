function Test_Shop_WeaponLv01_Auto()
  	SetShop( OwnerID() , 600001 , "Test_Shop_Close" );
	SetPlot( OwnerID() , "Touch" , "Test_Shop_Open" , 150 );
end