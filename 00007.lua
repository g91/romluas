function CreateFlag_5x5( )
	local Owner = Role:new( OwnerID() ) ;
	local BaseX = Owner:X();
 	local BaseY = Owner:Y();
 	local BaseZ = Owner:Z();
	local BaseDir = Owner:Dir();

 	local Inc = 0;
	for i = 0 , 4 , 1 do
		 for j = 0 , 4 , 1 do		 	
			CreateFlag( 0 , Inc  , BaseX + i * 20 , BaseY , BaseZ + j * 20 , BaseDir )		
			Inc = Inc + 1

		 end
		-- 每0.1秒為單位
		Sleep( 1 )
	end 

end