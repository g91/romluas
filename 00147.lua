function SetEq_Thief_Lv45()

	local Obj = Role:new( OwnerID() )
	Obj:SetJob( 3 );	-- �]�w���s��
	Obj:SetLevel( 45 );
	Obj:SetExp( 0 );

	--�]�w�t�I�I��
	Obj:SetStr( 0 )
	Obj:SetSta( 0 )
	Obj:SetAgi( 0 )
	Obj:SetInt( 0 )
	Obj:SetMnd( 0 )

	--�]�w���a�˳�
	Obj:SetEq( EM_EQWearPos_Head , 220518 );
	Obj:SetEq( EM_EQWearPos_Gloves , 220634  );
	Obj:SetEq( EM_EQWearPos_Shoes , 220660 );
	Obj:SetEq( EM_EQWearPos_Clothes , 220549  );
	Obj:SetEq( EM_EQWearPos_Pants , 220607 );
	Obj:SetEq( EM_EQWearPos_Back , 0 );
	Obj:SetEq( EM_EQWearPos_Belt , 220578 );
	Obj:SetEq( EM_EQWearPos_Shoulder, 220679 );
	Obj:SetEq( EM_EQWearPos_Necklace, 0 );
	Obj:SetEq( EM_EQWearPos_Ring1, 0 );
	Obj:SetEq( EM_EQWearPos_Ring2, 0 );
	Obj:SetEq( EM_EQWearPos_Earring1, 0  );
	Obj:SetEq( EM_EQWearPos_Earring2 , 0 );
	Obj:SetEq( EM_EQWearPos_MainHand, 210127 );
	Obj:SetEq( EM_EQWearPos_SecondHand, 0  );
	Obj:SetEq( EM_EQWearPos_Ammo, 0  );
	Obj:SetEq( EM_EQWearPos_Bow , 0  );


end