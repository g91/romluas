function Test_QuestMove()
 	local Owner = Role:new( OwnerID() ) 
 	local Target = Role:new( TargetID() ) 

	Move( TargetID() , Owner:X() , Owner:Z() )
end