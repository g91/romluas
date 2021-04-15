function Test_NpcSay()

	local  RandID 
	while 1 do
		sleep( 50 + rand( 20 ) )
		RandID = rand( 3 )
		if  RandID == 0 then
			Say(  OwnerID() , "test1"  )			
		elseif RandID ==  1 then
			Say(  OwnerID() , "test2"  )
		elseif RandID ==  2 then
			Say(  OwnerID() , "test3"  )
		end
	end
end