function CreateFlag_2x2( )
	local Owner = Role:new( OwnerID() ) 
	local BaseX = Owner:X()
 	local BaseY = Owner:Y();
 	local BaseZ = Owner:Z();
 	local BaseDir = Owner:Dir();

 	local Inc = 0;
	for i = -2 , 2 , 1 do
		for j = -2 , 2 , 1 do
--			CreateFlag( 0 , Inc  , BaseX + i * 10 , BaseY , BaseZ + j * 10 , BaseDir )
--			Inc = Inc + 1		

			if i == -2 or j == -2 or i == 2 or  j == 2 then	
				CreateFlag( 0 , Inc  , BaseX + i * 10  , BaseY , BaseZ + j * 10 , BaseDir )		
				Inc = Inc + 1		
			end
		
		end
		-- 每0.1秒為單位
		Sleep( 1 )
	end  
end