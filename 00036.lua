function Test_Shop_WeaponLv10_Auto()
   	SetShop( OwnerID() , 600002 , "Test_Shop_Close" );
	SetPlot( OwnerID() , "Touch" , "Test_Shop_Open" , 150 );
end