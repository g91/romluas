function SetEq_Ranger_Lv45()

	local Obj = Role:new( OwnerID() )
	Obj:SetJob( 2 );	-- �]�w���C�L
	Obj:SetLevel( 45 );
	Obj:SetExp( 0 );

	--�]�w�t�I�I��
	Obj:SetStr( 0 )
	Obj:SetSta( 0 )
	Obj:SetAgi( 0 )
	Obj:SetInt( 0 )
	Obj:SetMnd( 0 )

	--�]�w���a�˳�
	Obj:SetEq( EM_EQWearPos_Head , 220086 );
	Obj:SetEq( EM_EQWearPos_Gloves , 220184  );
	Obj:SetEq( EM_EQWearPos_Shoes , 220205 );
	Obj:SetEq( EM_EQWearPos_Clothes , 220114  );
	Obj:SetEq( EM_EQWearPos_Pants , 220163 );
	Obj:SetEq( EM_EQWearPos_Back , 220823 );
	Obj:SetEq( EM_EQWearPos_Belt , 220138 );
	Obj:SetEq( EM_EQWearPos_Shoulder, 0 );
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