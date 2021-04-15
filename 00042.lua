function Test_Shop_WeaponLv70_Auto()
   	SetShop( OwnerID() , 600008 , "Test_Shop_Close" );
	SetPlot( OwnerID() , "Touch" , "Test_Shop_Open" , 150 );
end