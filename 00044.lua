function Test_MagicGiveItem()
 	local Owner = Role:new( OwnerID() ) 
	Owner:Say( "法術觸發劇情測試!!!" )
	Owner:GiveBodyItem( 200001 , 1 )
	Owner:GiveBodyItemEx( 210001 , 1 , 0 , 510000 ,0 ,0,0,0 )

	Owner:Say( "給予測試!!" )

end