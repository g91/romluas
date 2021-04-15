function SetEq_Augur_Lv40()

	local Obj = Role:new( OwnerID() )
	Obj:SetJob( 5 );	-- 設定為祭司
	Obj:SetLevel( 40 );
	Obj:SetExp( 0 );

	--設定配點點數
	Obj:SetStr( 0 )
	Obj:SetSta( 0 )
	Obj:SetAgi( 0 )
	Obj:SetInt( 0 )
	Obj:SetMnd( 0 )

	--設定玩家裝備
	Obj:SetEq( EM_EQWearPos_Head , 220329 );
	Obj:SetEq( EM_EQWearPos_Gloves , 220451  );
	Obj:SetEq( EM_EQWearPos_Shoes , 220478 );
	Obj:SetEq( EM_EQWearPos_Clothes , 220360  );
	Obj:SetEq( EM_EQWearPos_Pants , 220422 );
	Obj:SetEq( EM_EQWearPos_Back , 0 );
	Obj:SetEq( EM_EQWearPos_Belt , 220392 );
	Obj:SetEq( EM_EQWearPos_Shoulder, 220499 );
	Obj:SetEq( EM_EQWearPos_Necklace, 0 );
	Obj:SetEq( EM_EQWearPos_Ring1, 0 );
	Obj:SetEq( EM_EQWearPos_Ring2, 0 );
	Obj:SetEq( EM_EQWearPos_Earring1, 0  );
	Obj:SetEq( EM_EQWearPos_Earring2 , 0 );
	Obj:SetEq( EM_EQWearPos_MainHand, 210150 );
	Obj:SetEq( EM_EQWearPos_SecondHand, 0  );
	Obj:SetEq( EM_EQWearPos_Ammo, 0  );
	Obj:SetEq( EM_EQWearPos_Bow , 0  );

end