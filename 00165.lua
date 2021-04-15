function SetEq_Augur_Lv25()

	local Obj = Role:new( OwnerID() )
	Obj:SetJob( 5 );	-- 設定為祭司
	Obj:SetLevel( 25 );
	Obj:SetExp( 0 );

	--設定配點點數
	Obj:SetStr( 0 )
	Obj:SetSta( 0 )
	Obj:SetAgi( 0 )
	Obj:SetInt( 0 )
	Obj:SetMnd( 0 )

	--設定玩家裝備
	Obj:SetEq( EM_EQWearPos_Head , 0 );
	Obj:SetEq( EM_EQWearPos_Gloves , 220446  );
	Obj:SetEq( EM_EQWearPos_Shoes , 220472 );
	Obj:SetEq( EM_EQWearPos_Clothes , 220354  );
	Obj:SetEq( EM_EQWearPos_Pants , 220416 );
	Obj:SetEq( EM_EQWearPos_Back , 0 );
	Obj:SetEq( EM_EQWearPos_Belt , 220387 );
	Obj:SetEq( EM_EQWearPos_Shoulder, 220494 );
	Obj:SetEq( EM_EQWearPos_Necklace, 0 );
	Obj:SetEq( EM_EQWearPos_Ring1, 0 );
	Obj:SetEq( EM_EQWearPos_Ring2, 0 );
	Obj:SetEq( EM_EQWearPos_Earring1, 0  );
	Obj:SetEq( EM_EQWearPos_Earring2 , 0 );
	Obj:SetEq( EM_EQWearPos_MainHand, 210231 );
	Obj:SetEq( EM_EQWearPos_SecondHand, 0  );
	Obj:SetEq( EM_EQWearPos_Ammo, 0  );
	Obj:SetEq( EM_EQWearPos_Bow , 0  );

end