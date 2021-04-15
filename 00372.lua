function SetEq_Druid_Lv70()

	local Obj = Role:new( OwnerID() )
	Obj:SetJob( 8 );	-- 設定為德魯依
	Obj:SetLevel( 70 );
	Obj:SetExp( 0 );

	--設定配點點數
	Obj:SetStr( 0 )
	Obj:SetSta( 0 )
	Obj:SetAgi( 0 )
	Obj:SetInt( 0 )
	Obj:SetMnd( 0 )

	--設定玩家裝備
	Obj:SetEq( EM_EQWearPos_Head , 220527 );
	Obj:SetEq( EM_EQWearPos_Gloves , 220641 );
	Obj:SetEq( EM_EQWearPos_Shoes , 220667 );
	Obj:SetEq( EM_EQWearPos_Clothes , 220558 );
	Obj:SetEq( EM_EQWearPos_Pants , 220616 );
	Obj:SetEq( EM_EQWearPos_Back , 0 );
	Obj:SetEq( EM_EQWearPos_Belt , 220585 );
	Obj:SetEq( EM_EQWearPos_Shoulder, 220686 );
	Obj:SetEq( EM_EQWearPos_Necklace, 0 );
	Obj:SetEq( EM_EQWearPos_Ring1, 0 );
	Obj:SetEq( EM_EQWearPos_Ring2, 0 );
	Obj:SetEq( EM_EQWearPos_Earring1, 0  );
	Obj:SetEq( EM_EQWearPos_Earring2 , 0 );
	Obj:SetEq( EM_EQWearPos_MainHand, 210159 );
	Obj:SetEq( EM_EQWearPos_SecondHand, 0  );
	Obj:SetEq( EM_EQWearPos_Ammo, 0  );
	Obj:SetEq( EM_EQWearPos_Bow , 0  );


end