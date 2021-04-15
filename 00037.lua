function Test_Shop_WeaponLv20_Auto()
   	SetShop( OwnerID() , 600003 , "Test_Shop_Close" );
	SetPlot( OwnerID() , "Touch" , "Test_Shop_Open" , 150 );
end