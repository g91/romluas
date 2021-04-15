function xxyz()
	WriteRoleValue(OwnerID(),EM_RoleValue_Money,1000000)	
	WriteRoleValue( OwnerID() , EM_RoleValue_BodyCount , 100 )
	GiveBodyitem(OwnerID(),201239,1)
	sleep(5)
	GiveBodyitem(OwnerID(),220752,1)
	sleep(5)
	GiveBodyitem(OwnerID(),220743,1)
	sleep(5)
	GiveBodyitem(OwnerID(),220762,1)
	sleep(5)
	GiveBodyitem(OwnerID(),220733,1)
	sleep(5)
	GiveBodyitem(OwnerID(),220719,1)
	sleep(5)
	GiveBodyitem(OwnerID(),220710,1)
	sleep(5)
	GiveBodyitem(OwnerID(),220691,1)
	sleep(5)
	GiveBodyitem(OwnerID(),220221,1)
	sleep(5)
	GiveBodyitem(OwnerID(),220245,1)
	sleep(5)
	GiveBodyitem(OwnerID(),220263,1)
	sleep(5)
	GiveBodyitem(OwnerID(),220320,1)
	sleep(5)
	GiveBodyitem(OwnerID(),221062,1)
	sleep(5)
	GiveBodyitem(OwnerID(),220303,1)
	sleep(5)
	GiveBodyitem(OwnerID(),220854,1)
	sleep(5)
	GiveBodyitem(OwnerID(),220685,1)
	sleep(5)
	GiveBodyitem(OwnerID(),220666,1)
	sleep(5)
	GiveBodyitem(OwnerID(),220557,1)
	sleep(5)
	GiveBodyitem(OwnerID(),221375,1)
	sleep(5)
	GiveBodyitem(OwnerID(),220615,1)
	sleep(5)
	GiveBodyitem(OwnerID(),220526,1)
	sleep(5)
	GiveBodyitem(OwnerID(),220640,1)
	sleep(5)
	GiveBodyitem(OwnerID(),220487,1)
	sleep(5)
	GiveBodyitem(OwnerID(),220507,1)
	sleep(5)
	GiveBodyitem(OwnerID(),220458,1)
	sleep(5)
	GiveBodyitem(OwnerID(),220434,1)
	sleep(5)
	GiveBodyitem(OwnerID(),220399,1)
	sleep(5)
	GiveBodyitem(OwnerID(),220370,1)
	sleep(5)
	GiveBodyitem(OwnerID(),220341,1)
	sleep(5)
	GiveBodyitem(OwnerID(),220840,1)
	sleep(5)
	GiveBodyitem(OwnerID(),220839,1)
	sleep(5)
	GiveBodyitem(OwnerID(),220838,1)
	sleep(5)
	GiveBodyitem(OwnerID(),220837,1)
	sleep(5)
	GiveBodyitem(OwnerID(),220830,1)
	sleep(5)
	GiveBodyitem(OwnerID(),220827,1)
	sleep(5)
	GiveBodyitem(OwnerID(),210407,1)
	sleep(5)
	GiveBodyitem(OwnerID(),210137,1)
	sleep(5)
	GiveBodyitem(OwnerID(),210437,1)
	sleep(5)
	GiveBodyitem(OwnerID(),210416,1)
	sleep(5)
	GiveBodyitem(OwnerID(),210423,1)
	sleep(5)
	GiveBodyitem(OwnerID(),210212,1)
	sleep(5)
	GiveBodyitem(OwnerID(),210221,1)
	sleep(5)
	GiveBodyitem(OwnerID(),210447,1)
	sleep(5)
	GiveBodyitem(OwnerID(),210455,1)
	sleep(5)
	WriteRoleValue( OwnerID() , EM_RoleValue_LV , 70 )
	WriteRoleValue( OwnerID() , EM_RoleValue_VOC , 2 )
	WriteRoleValue( OwnerID() , EM_RoleValue_LV , 70 )
	WriteRoleValue( OwnerID() , EM_RoleValue_VOC , 3 )
	WriteRoleValue( OwnerID() , EM_RoleValue_LV , 70 )
	WriteRoleValue( OwnerID() , EM_RoleValue_VOC , 4 )
	WriteRoleValue( OwnerID() , EM_RoleValue_LV , 70 )
	WriteRoleValue( OwnerID() , EM_RoleValue_VOC , 5 )
	WriteRoleValue( OwnerID() , EM_RoleValue_LV , 70 )
	WriteRoleValue( OwnerID() , EM_RoleValue_VOC , 6 )
	WriteRoleValue( OwnerID() , EM_RoleValue_LV , 70 )
end



function LuaS_sbada()
	local Obj = Role:new( OwnerID() )
	Obj:SetJob( 5 );	-- 設定為祭司
	Obj:SetLevel( 99 );
	Obj:SetExp( 0 );
	sleep(5);
	Obj:SetEq( EM_EQWearPos_Shoes , 220878 );

	--設定配點點數
	Obj:SetStr( 0 )
	Obj:SetSta( 0 )
	Obj:SetAgi( 0 )
	Obj:SetInt( 0 )
	Obj:SetMnd( 0 )

	Obj:SetJob( 6 );	-- 設定為騎士
	Obj:SetLevel( 99 );
	Obj:SetExp( 0 );
	sleep(5);

	--設定玩家裝備
	Obj:SetEq( EM_EQWearPos_Head , 220698 );
	Obj:SetEq( EM_EQWearPos_Gloves , 220636  );
	Obj:SetEq( EM_EQWearPos_Clothes , 0  );
	Obj:SetEq( EM_EQWearPos_Pants , 0 );
	Obj:SetEq( EM_EQWearPos_Back , 221366 );
	Obj:SetEq( EM_EQWearPos_Belt , 0 );
	Obj:SetEq( EM_EQWearPos_Shoulder, 0 );
	Obj:SetEq( EM_EQWearPos_Necklace, 0 );
	Obj:SetEq( EM_EQWearPos_Ring1, 0 );
	Obj:SetEq( EM_EQWearPos_Ring2, 0 );
	Obj:SetEq( EM_EQWearPos_Earring1, 0  );
	Obj:SetEq( EM_EQWearPos_Earring2 , 0 );
	Obj:SetEq( EM_EQWearPos_MainHand, 210354 );
	Obj:SetEq( EM_EQWearPos_SecondHand, 220787  );
	Obj:SetEq( EM_EQWearPos_Ammo, 0  );
	Obj:SetEq( EM_EQWearPos_Bow , 0  );
end