function SetEq_Mage_Lv10()

	local Obj = Role:new( OwnerID() )
	Obj:SetJob( 4 );	-- �]�w���k�v
	Obj:SetLevel( 10 );
	Obj:SetExp( 0 );

	--�]�w�t�I�I��
	Obj:SetStr( 0 )
	Obj:SetSta( 0 )
	Obj:SetAgi( 0 )
	Obj:SetInt( 0 )
	Obj:SetMnd( 0 )

	--�]�w���a�˳�
	Obj:SetEq( EM_EQWearPos_Head , 0 );
	Obj:SetEq( EM_EQWearPos_Gloves , 0  );
	Obj:SetEq( EM_EQWearPos_Shoes , 220469 );
	Obj:SetEq( EM_EQWearPos_Clothes , 220348  );
	--Obj:SetEq( EM_EQWearPos_Clothes , 220349  );	--HQ�~
	Obj:SetEq( EM_EQWearPos_Pants , 220410 );
	--Obj:SetEq( EM_EQWearPos_Pants , 220411 );		--HQ�~
	Obj:SetEq( EM_EQWearPos_Back , 0 );
	Obj:SetEq( EM_EQWearPos_Belt , 220383 );
	Obj:SetEq( EM_EQWearPos_Shoulder, 0 );
	Obj:SetEq( EM_EQWearPos_Necklace, 0 );
	Obj:SetEq( EM_EQWearPos_Ring1, 0 );
	Obj:SetEq( EM_EQWearPos_Ring2, 0 );
	Obj:SetEq( EM_EQWearPos_Earring1, 0  );
	Obj:SetEq( EM_EQWearPos_Earring2 , 0 );
	Obj:SetEq( EM_EQWearPos_MainHand, 210141 );	--�����
	--Obj:SetEq( EM_EQWearPos_MainHand, 210114 );	--�u�P
	Obj:SetEq( EM_EQWearPos_SecondHand, 0  );
	Obj:SetEq( EM_EQWearPos_Ammo, 0  );
	Obj:SetEq( EM_EQWearPos_Bow , 0  );


end