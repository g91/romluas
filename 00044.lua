function Test_MagicGiveItem()
 	local Owner = Role:new( OwnerID() ) 
	Owner:Say( "�k�NĲ�o�@������!!!" )
	Owner:GiveBodyItem( 200001 , 1 )
	Owner:GiveBodyItemEx( 210001 , 1 , 0 , 510000 ,0 ,0,0,0 )

	Owner:Say( "��������!!" )

end