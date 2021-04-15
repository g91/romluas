function CreateNPC_10x10()
	local Owner = Role:new( OwnerID() ) 

	local BaseX = Owner:X()
 	local BaseY = Owner:Y();
 	local BaseZ = Owner:Z();
 	 
	for i = 0 , 9 , 1 do
		 for j = 0 , 9 , 1 do 
			GItemID = CreateObj( 100001 , BaseX + i * 20 , BaseY , BaseZ + j * 20 , 0 , 1 )
			
			AddToPartition( GItemID , 0 )

		 end
		Sleep( 1 )
	end 
end