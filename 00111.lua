function SetEq_Warrior_Lv1()

	local Obj = Role:new( OwnerID() )
	Obj:SetJob( 1 );	-- 設定為戰士
	Obj:SetLevel( 1 );
	-- 設定玩家等級為 1
	Obj:SetExp( 0 );
	Obj:SetJob_Sub( 4 );	--設定副職為法師

	--設定配點點數
	Obj:SetStr( 0 )
	Obj:SetSta( 0 )
	Obj:SetAgi( 0 )
	Obj:SetInt( 0 )
	Obj:SetMnd( 0 )

	--設定玩家裝備
	Obj:SetEq( EM_EQWearPos_Head , 0 );
	Obj:SetEq( EM_EQWearPos_Gloves , 0  );
	Obj:SetEq( EM_EQWearPos_Shoes , 0 );
	Obj:SetEq( EM_EQWearPos_Clothes , 220097  );
	Obj:SetEq( EM_EQWearPos_Pants , 220146 );
	Obj:SetEq( EM_EQWearPos_Back , 0 );
	Obj:SetEq( EM_EQWearPos_Belt , 0 );
	Obj:SetEq( EM_EQWearPos_Shoulder, 0 );
	Obj:SetEq( EM_EQWearPos_Necklace, 0 );
	Obj:SetEq( EM_EQWearPos_Ring1, 0 );
	Obj:SetEq( EM_EQWearPos_Ring2, 0 );
	Obj:SetEq( EM_EQWearPos_Earring1, 0  );
	Obj:SetEq( EM_EQWearPos_Earring2 , 0 );
	Obj:SetEq( EM_EQWearPos_MainHand, 210081 );
	Obj:SetEq( EM_EQWearPos_SecondHand, 0  );
	Obj:SetEq( EM_EQWearPos_Ammo, 0  );
	Obj:SetEq( EM_EQWearPos_Bow , 0  );
end