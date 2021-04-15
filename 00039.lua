function Test_Shop_WeaponLv40_Auto()
   	SetShop( OwnerID() , 600005 , "Test_Shop_Close" );
	SetPlot( OwnerID() , "Touch" , "Test_Shop_Open" , 150 );
end