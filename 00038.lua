function Test_Shop_WeaponLv30_Auto()
   	SetShop( OwnerID() , 600004 , "Test_Shop_Close" );
	SetPlot( OwnerID() , "Touch" , "Test_Shop_Open" , 150 );
end