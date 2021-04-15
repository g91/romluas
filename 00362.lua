function SetEq_Knight_Lv60()

	local Obj = Role:new( OwnerID() )
	Obj:SetJob( 6 );	-- 設定為騎士
	Obj:SetLevel( 60 );
	Obj:SetExp( 0 );

	--設定配點點數
	Obj:SetStr( 0 )
	Obj:SetSta( 0 )
	Obj:SetAgi( 0 )
	Obj:SetInt( 0 )
	Obj:SetMnd( 0 )

	--設定玩家裝備
	Obj:SetEq( EM_EQWearPos_Head , 220695 );
	Obj:SetEq( EM_EQWearPos_Gloves , 220742 );
	Obj:SetEq( EM_EQWearPos_Shoes , 220751 );
	Obj:SetEq( EM_EQWearPos_Clothes , 220751 );
	Obj:SetEq( EM_EQWearPos_Pants , 220730 );
	Obj:SetEq( EM_EQWearPos_Back , 0 );
	Obj:SetEq( EM_EQWearPos_Belt , 220720 );
	Obj:SetEq( EM_EQWearPos_Shoulder, 220761 );
	Obj:SetEq( EM_EQWearPos_Necklace, 0 );
	Obj:SetEq( EM_EQWearPos_Ring1, 0 );
	Obj:SetEq( EM_EQWearPos_Ring2, 0 );
	Obj:SetEq( EM_EQWearPos_Earring1, 0  );
	Obj:SetEq( EM_EQWearPos_Earring2 , 0 );
	Obj:SetEq( EM_EQWearPos_MainHand, 210105 );
	Obj:SetEq( EM_EQWearPos_SecondHand, 0  );
	Obj:SetEq( EM_EQWearPos_Ammo, 0  );
	Obj:SetEq( EM_EQWearPos_Bow , 0  );

end