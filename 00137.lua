function SetEq_Ranger_Lv50()

	local Obj = Role:new( OwnerID() )
	Obj:SetJob( 2 );	-- 設定為遊俠
	Obj:SetLevel( 50 );
	Obj:SetExp( 0 );

	--設定配點點數
	Obj:SetStr( 0 )
	Obj:SetSta( 0 )
	Obj:SetAgi( 0 )
	Obj:SetInt( 0 )
	Obj:SetMnd( 0 )

	--設定玩家裝備
	Obj:SetEq( EM_EQWearPos_Head , 220087 );
	Obj:SetEq( EM_EQWearPos_Gloves , 220185  );
	Obj:SetEq( EM_EQWearPos_Shoes , 220206 );
	Obj:SetEq( EM_EQWearPos_Clothes , 220115  );
	Obj:SetEq( EM_EQWearPos_Pants , 220164 );
	Obj:SetEq( EM_EQWearPos_Back , 220826 );
	Obj:SetEq( EM_EQWearPos_Belt , 220139 );
	Obj:SetEq( EM_EQWearPos_Shoulder, 0 );
	Obj:SetEq( EM_EQWearPos_Necklace, 0 );
	Obj:SetEq( EM_EQWearPos_Ring1, 0 );
	Obj:SetEq( EM_EQWearPos_Ring2, 0 );
	Obj:SetEq( EM_EQWearPos_Earring1, 0  );
	Obj:SetEq( EM_EQWearPos_Earring2 , 0 );
	Obj:SetEq( EM_EQWearPos_MainHand, 210130 );
	Obj:SetEq( EM_EQWearPos_SecondHand, 0  );
	Obj:SetEq( EM_EQWearPos_Ammo, 0  );
	Obj:SetEq( EM_EQWearPos_Bow , 0  );


end