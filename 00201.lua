function SetEq_Druid_Lv40()

	local Obj = Role:new( OwnerID() )
	Obj:SetJob( 8 );	-- �]�w���w�|��
	Obj:SetLevel( 40 );
	Obj:SetExp( 0 );

	--�]�w�t�I�I��
	Obj:SetStr( 0 )
	Obj:SetSta( 0 )
	Obj:SetAgi( 0 )
	Obj:SetInt( 0 )
	Obj:SetMnd( 0 )

	--�]�w���a�˳�
	Obj:SetEq( EM_EQWearPos_Head , 220515 );
	Obj:SetEq( EM_EQWearPos_Gloves , 220632  );
	Obj:SetEq( EM_EQWearPos_Shoes , 220658 );
	Obj:SetEq( EM_EQWearPos_Clothes , 220546 );
	Obj:SetEq( EM_EQWearPos_Pants , 220604 );
	Obj:SetEq( EM_EQWearPos_Back , 0 );
	Obj:SetEq( EM_EQWearPos_Belt , 220576 );
	Obj:SetEq( EM_EQWearPos_Shoulder, 220677 );
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