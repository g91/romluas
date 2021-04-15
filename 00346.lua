function SetEq_Ranger_Lv60()

	local Obj = Role:new( OwnerID() )
	Obj:SetJob( 2 );	-- 設定為遊俠
	Obj:SetLevel( 60 );
	Obj:SetExp( 0 );

	--設定配點點數
	Obj:SetStr( 0 )
	Obj:SetSta( 0 )
	Obj:SetAgi( 0 )
	Obj:SetInt( 0 )
	Obj:SetMnd( 0 )

	--設定玩家裝備
	Obj:SetEq( EM_EQWearPos_Head , 220523 );
	Obj:SetEq( EM_EQWearPos_Gloves , 220638 );
	Obj:SetEq( EM_EQWearPos_Shoes , 220664 );
	Obj:SetEq( EM_EQWearPos_Clothes , 220554 );
	Obj:SetEq( EM_EQWearPos_Pants , 220612 );
	Obj:SetEq( EM_EQWearPos_Back , 0 );
	Obj:SetEq( EM_EQWearPos_Belt , 220582 );
	Obj:SetEq( EM_EQWearPos_Shoulder, 220683 );
	Obj:SetEq( EM_EQWearPos_Necklace, 0 );
	Obj:SetEq( EM_EQWearPos_Ring1, 0 );
	Obj:SetEq( EM_EQWearPos_Ring2, 0 );
	Obj:SetEq( EM_EQWearPos_Earring1, 0  );
	Obj:SetEq( EM_EQWearPos_Earring2 , 0 );
	Obj:SetEq( EM_EQWearPos_MainHand, 210134 );
	Obj:SetEq( EM_EQWearPos_SecondHand, 0  );
	Obj:SetEq( EM_EQWearPos_Ammo, 0  );
	Obj:SetEq( EM_EQWearPos_Bow , 0  );


end