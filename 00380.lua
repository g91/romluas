function Hsiang_CreateMonster( )

	local Owner = Role:new( OwnerID() ) 

	local BaseX = Owner:X()
 	local BaseY = Owner:Y();
 	local BaseZ = Owner:Z();
 	 local x = 0;
	for i = 0 , 19 , 1 do
		 for j = 0 , 19 , 1 do 
			GItemID = CreateObj( 100052 , BaseX + i * 5 , BaseY , BaseZ + j * 5 , 0 , 1 )
			x = x+ 1
			local NewNpc = Role:new( GItemID ) 
			NewNPC:SetPID( 6396 )
			local Mode = GetMode( GItemID )
			Mode = Mode + 524288
			SetMode( GItemID , Mode )
			AddToPartition( GItemID , 0 )

		 end
		Sleep( 1 )
	end 
end

function Hsiang_DelMonster()

	SetSearchAllNPC(  0 )

	while 1 do
		local DelID = GetSearchResult();
		if( DelID == -1 ) then
			break;
		end
		local NewNpc = Role:new( DelID ) 
		if( NewNPC:PID() == 6396 ) then 
			DelObj( DelID )	
		end
	end	
end

function Hsiang_CreateMonster1( ID   )

	local Owner = Role:new( OwnerID() ) 

	local BaseX = Owner:X()
 	local BaseY = Owner:Y();
 	local BaseZ = Owner:Z();
	local x = 0;
	 for j = 0 , 9 , 1 do 
		GItemID = CreateObj( ID  + x , BaseX  , BaseY , BaseZ + j * 50 , 0 , 1 )
		x = x+ 10
		local NewNpc = Role:new( GItemID ) 
		NewNPC:SetPID( 6396 )
		local Mode = GetMode( GItemID )
		Mode = Mode + 524288
		SetMode( GItemID , Mode )
		AddToPartition( GItemID , 0 )
	 end
end

function Hsiang_TestMonster( ID  )

	local Owner = Role:new( OwnerID() ) 

	local BaseX = Owner:X()
 	local BaseY = Owner:Y();
 	local BaseZ = Owner:Z();
 	 local x = 0;
	for x = 0 , 3 ,1 do
	for i = 0 , 9 , 1 do
		 for j = 0 , 9 , 1 do 
			local GItemID = CreateObj( 100460 + i*10+j , BaseX + i * 50 , BaseY , BaseZ + j * 50 , 0 , 1 )
			local NewNpc = Role:new( GItemID ) 
			NewNPC:SetPID( 6396 )
			local Mode = GetMode( GItemID )
			SetMode( GItemID , Mode )
			AddToPartition( GItemID , 0 )
			local A = GItemID ;

			GItemID = CreateObj( 100460 + ID*10+j , BaseX + i * 50 , BaseY , BaseZ + j * 50 , 0 , 1 )
			NewNpc = Role:new( GItemID ) 
			NewNPC:SetPID( 6396 )
			local Mode = GetMode( GItemID )
			SetMode( GItemID , Mode )
			SetRoleCamp( GItemID , "Good" )
			AddToPartition( GItemID , 0 )
			
			SetAttack( A , GItemID );
			SetAttack( GItemID , A );
		 end
		Sleep( 1 )
	end 
	end
end
