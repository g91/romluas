function Test_Shop_WeaponLv60_Auto()
   	SetShop( OwnerID() , 600007 , "Test_Shop_Close" );
	SetPlot( OwnerID() , "Touch" , "Test_Shop_Open" , 150 );
end