function Test_Shop_WeaponLv50_Auto()
   	SetShop( OwnerID() , 600006 , "Test_Shop_Close" );
	SetPlot( OwnerID() , "Touch" , "Test_Shop_Open" , 150 );
end