function SetEq_Runedancer_Lv60()

	local Obj = Role:new( OwnerID() )
	Obj:SetJob( 7 );	-- �]�w�����F��
	Obj:SetLevel( 60 );
	Obj:SetExp( 0 );

	--�]�w�t�I�I��
	Obj:SetStr( 0 )
	Obj:SetSta( 0 )
	Obj:SetAgi( 0 )
	Obj:SetInt( 0 )
	Obj:SetMnd( 0 )

	--�]�w���a�˳�
	Obj:SetEq( EM_EQWearPos_Head , 220337 );
	Obj:SetEq( EM_EQWearPos_Gloves , 220457 );
	Obj:SetEq( EM_EQWearPos_Shoes , 220484 );
	Obj:SetEq( EM_EQWearPos_Clothes , 220368 );
	Obj:SetEq( EM_EQWearPos_Pants , 220430 );
	Obj:SetEq( EM_EQWearPos_Back , 0 );
	Obj:SetEq( EM_EQWearPos_Belt , 220398 );
	Obj:SetEq( EM_EQWearPos_Shoulder, 220505 );
	Obj:SetEq( EM_EQWearPos_Necklace, 0 );
	Obj:SetEq( EM_EQWearPos_Ring1, 0 );
	Obj:SetEq( EM_EQWearPos_Ring2, 0 );
	Obj:SetEq( EM_EQWearPos_Earring1, 0  );
	Obj:SetEq( EM_EQWearPos_Earring2 , 0 );
	Obj:SetEq( EM_EQWearPos_MainHand, 210156 );
	Obj:SetEq( EM_EQWearPos_SecondHand, 0  );
	Obj:SetEq( EM_EQWearPos_Ammo, 0  );
	Obj:SetEq( EM_EQWearPos_Bow , 0  );

end