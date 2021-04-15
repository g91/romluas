function Test_RandCreateNPC_Show()
	local Owner = Role:new( OwnerID() )
	Sleep( 100 );
	Owner:SetDeadPlot( "Test_RandCreateNPC_OnDead" );
	Owner:AddtoPartition(  0 )

end