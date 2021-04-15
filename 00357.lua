function SetEq_Augur_Lv55()

	local Obj = Role:new( OwnerID() )
	Obj:SetJob( 5 );	-- 設定為祭司
	Obj:SetLevel( 55 );
	Obj:SetExp( 0 );

	--設定配點點數
	Obj:SetStr( 0 )
	Obj:SetSta( 0 )
	Obj:SetAgi( 0 )
	Obj:SetInt( 0 )
	Obj:SetMnd( 0 )

	--設定玩家裝備
	Obj:SetEq( EM_EQWearPos_Head , 220335 );
	Obj:SetEq( EM_EQWearPos_Gloves , 220455 );
	Obj:SetEq( EM_EQWearPos_Shoes , 220482 );
	Obj:SetEq( EM_EQWearPos_Clothes , 220366 );
	Obj:SetEq( EM_EQWearPos_Pants , 220428 );
	Obj:SetEq( EM_EQWearPos_Back , 0 );
	Obj:SetEq( EM_EQWearPos_Belt , 220396 );
	Obj:SetEq( EM_EQWearPos_Shoulder, 220503 );
	Obj:SetEq( EM_EQWearPos_Necklace, 0 );
	Obj:SetEq( EM_EQWearPos_Ring1, 0 );
	Obj:SetEq( EM_EQWearPos_Ring2, 0 );
	Obj:SetEq( EM_EQWearPos_Earring1, 0  );
	Obj:SetEq( EM_EQWearPos_Earring2 , 0 );
	Obj:SetEq( EM_EQWearPos_MainHand, 210237 );
	Obj:SetEq( EM_EQWearPos_SecondHand, 0  );
	Obj:SetEq( EM_EQWearPos_Ammo, 0  );
	Obj:SetEq( EM_EQWearPos_Bow , 0  );

end