function MyStopNPCMoveFlag()
MoveToFlagEnabled( TargetID() , false )
SetNpcNearPlayer( OwnerID() , TargetID() )
Sleep( 100 )
MoveToFlagEnabled( TargetID() , true )

end