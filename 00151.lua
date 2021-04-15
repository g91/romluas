function SetEq_Mage_Lv10()

	local Obj = Role:new( OwnerID() )
	Obj:SetJob( 4 );	-- 設定為法師
	Obj:SetLevel( 10 );
	Obj:SetExp( 0 );

	--設定配點點數
	Obj:SetStr( 0 )
	Obj:SetSta( 0 )
	Obj:SetAgi( 0 )
	Obj:SetInt( 0 )
	Obj:SetMnd( 0 )

	--設定玩家裝備
	Obj:SetEq( EM_EQWearPos_Head , 0 );
	Obj:SetEq( EM_EQWearPos_Gloves , 0  );
	Obj:SetEq( EM_EQWearPos_Shoes , 220469 );
	Obj:SetEq( EM_EQWearPos_Clothes , 220348  );
	--Obj:SetEq( EM_EQWearPos_Clothes , 220349  );	--HQ品
	Obj:SetEq( EM_EQWearPos_Pants , 220410 );
	--Obj:SetEq( EM_EQWearPos_Pants , 220411 );		--HQ品
	Obj:SetEq( EM_EQWearPos_Back , 0 );
	Obj:SetEq( EM_EQWearPos_Belt , 220383 );
	Obj:SetEq( EM_EQWearPos_Shoulder, 0 );
	Obj:SetEq( EM_EQWearPos_Necklace, 0 );
	Obj:SetEq( EM_EQWearPos_Ring1, 0 );
	Obj:SetEq( EM_EQWearPos_Ring2, 0 );
	Obj:SetEq( EM_EQWearPos_Earring1, 0  );
	Obj:SetEq( EM_EQWearPos_Earring2 , 0 );
	Obj:SetEq( EM_EQWearPos_MainHand, 210141 );	--雙手杖
	--Obj:SetEq( EM_EQWearPos_MainHand, 210114 );	--短匕
	Obj:SetEq( EM_EQWearPos_SecondHand, 0  );
	Obj:SetEq( EM_EQWearPos_Ammo, 0  );
	Obj:SetEq( EM_EQWearPos_Bow , 0  );


end