--****************************************************************	寵物剛召喚時	**********************************************************************--

function Fun_YU_PetAI_ToSay_Start(  )

--OwnerID = 寵物
	local Player = ReadRoleValue( OwnerID(),  EM_RoleValue_Register+8  )--主人
	local ModePet = ReadRoleValue( OwnerID(),  EM_RoleValue_Register+9  )--第幾隻寵物
	local Loyal = ReadPetValue( Player, ModePet ,EM_CultivatePetStructValueType_Loyal )--忠誠度


--寵物剛召喚 忠誠度80↓
	local KK = 10
	local SAY_K = {    "[SC_PETS_SAY_K_1]","[SC_PETS_SAY_K_2]","[SC_PETS_SAY_K_3]","[SC_PETS_SAY_K_4]","[SC_PETS_SAY_K_5]","[SC_PETS_SAY_K_6]","[SC_PETS_SAY_K_7]",
		            "[SC_PETS_SAY_K_8]","[SC_PETS_SAY_K_9]","[SC_PETS_SAY_K_10]"	}
--寵物剛召喚 忠誠度80↑
	local LL = 12
	local SAY_L = {    "[SC_PETS_SAY_L_1]","[SC_PETS_SAY_L_2]","[SC_PETS_SAY_L_3]","[SC_PETS_SAY_L_4]","[SC_PETS_SAY_L_5]","[SC_PETS_SAY_L_6]","[SC_PETS_SAY_L_7]",
		            "[SC_PETS_SAY_L_8]","[SC_PETS_SAY_L_9]","[SC_PETS_SAY_L_10]","[SC_PETS_SAY_L_11]","[SC_PETS_SAY_L_12]"	}

	if Loyal < 80 then
		KK = KK-1
		local STRING = Rand( KK )      
		STRING = STRING+1
--		Say( OwnerID() , "STRING=KK= " .. STRING );
		Npcsay( OwnerID() , SAY_K[STRING] );
	
	elseif Loyal >=80 then
		LL = LL-1
		local STRING = Rand( LL )      
		STRING = STRING+1
--		Say( OwnerID() , "STRING=LL= " .. STRING );
		Npcsay( OwnerID() , SAY_L[STRING] );
	end
end

--****************************************************************	主人非戰鬥時	**********************************************************************--

function Fun_YU_PetAI_ToSay_Pop(  )

--OwnerID = 寵物
	local Player = ReadRoleValue( OwnerID(),  EM_RoleValue_Register+8  )--主人
	local ModePet = ReadRoleValue( OwnerID(),  EM_RoleValue_Register+9  )--第幾隻寵物
	local Loyal = ReadPetValue( Player, ModePet ,EM_CultivatePetStructValueType_Loyal )--忠誠度


--寵物剛召喚 忠誠度80↓
	local NN = 20
	local SAY_N= {    "[SC_PETS_SAY_N_1]","[SC_PETS_SAY_N_2]","[SC_PETS_SAY_N_3]","[SC_PETS_SAY_N_4]","[SC_PETS_SAY_N_5]","[SC_PETS_SAY_N_6]","[SC_PETS_SAY_N_7]",	
		            "[SC_PETS_SAY_N_8]","[SC_PETS_SAY_N_9]","[SC_PETS_SAY_N_10]","[SC_PETS_SAY_N_11]","[SC_PETS_SAY_N_12]","[SC_PETS_SAY_N_13]","[SC_PETS_SAY_N_14]",
		            "[SC_PETS_SAY_N_15]","[SC_PETS_SAY_N_16]","[SC_PETS_SAY_N_17]","[SC_PETS_SAY_N_18]","[SC_PETS_SAY_N_19]","[SC_PETS_SAY_N_20]"	}
--寵物剛召喚 忠誠度80↑
	local OO = 30
	local SAY_O = {    "[SC_PETS_SAY_O_1]","[SC_PETS_SAY_O_2]","[SC_PETS_SAY_O_3]","[SC_PETS_SAY_O_4]","[SC_PETS_SAY_O_5]","[SC_PETS_SAY_O_6]","[SC_PETS_SAY_O_7]",
		             "[SC_PETS_SAY_O_8]","[SC_PETS_SAY_O_9]","[SC_PETS_SAY_O_10]","[SC_PETS_SAY_O_11]","[SC_PETS_SAY_O_12]","[SC_PETS_SAY_O_13]","[SC_PETS_SAY_O_14]",
		             "[SC_PETS_SAY_O_15]","[SC_PETS_SAY_O_16]","[SC_PETS_SAY_O_17]","[SC_PETS_SAY_O_18]","[SC_PETS_SAY_O_19]","[SC_PETS_SAY_O_20]","[SC_PETS_SAY_N_14]",
		             "[SC_PETS_SAY_N_15]","[SC_PETS_SAY_N_16]","[SC_PETS_SAY_N_17]","[SC_PETS_SAY_N_18]","[SC_PETS_SAY_N_19]","[SC_PETS_SAY_N_20]","[SC_PETS_SAY_N_3]",
                                          "[SC_PETS_SAY_N_6]","[SC_PETS_SAY_N_4]"	}


	if Loyal < 80 then
		NN = NN-1
		local STRING = Rand( NN )      
		STRING = STRING+1
--		Say( OwnerID() , "STRING=KK= " .. STRING );
		Npcsay( OwnerID() , SAY_N[STRING] );
	
	elseif Loyal >=80 then
		OO = OO-1
		local STRING = Rand( OO )      
		STRING = STRING+1
--		Say( OwnerID() , "STRING=LL= " .. STRING );
		Npcsay( OwnerID() , SAY_O[STRING] );
	end
end

--****************************************************************	主人戰鬥時	**********************************************************************--

function Fun_YU_PetAI_ToSay_Fight(  )

--OwnerID = 寵物
	local Player = ReadRoleValue( OwnerID(),  EM_RoleValue_Register+8  )--主人
	local ModePet = ReadRoleValue( OwnerID(),  EM_RoleValue_Register+9  )--第幾隻寵物
	local Loyal = ReadPetValue( Player, ModePet ,EM_CultivatePetStructValueType_Loyal )--忠誠度


--寵物剛召喚 忠誠度80↓
	local FF = 20
	local SAY_F= {    "[SC_PETS_SAY_F_1]","[SC_PETS_SAY_F_2]","[SC_PETS_SAY_F_3]","[SC_PETS_SAY_F_4]","[SC_PETS_SAY_F_5]","[SC_PETS_SAY_F_6]","[SC_PETS_SAY_F_7]",
		           "[SC_PETS_SAY_F_8]","[SC_PETS_SAY_F_9]","[SC_PETS_SAY_F_10]","[SC_PETS_SAY_F_11]","[SC_PETS_SAY_F_12]","[SC_PETS_SAY_F_13]","[SC_PETS_SAY_F_14]",
		           "[SC_PETS_SAY_F_15]","[SC_PETS_SAY_F_16]","[SC_PETS_SAY_F_17]","[SC_PETS_SAY_F_18]","[SC_PETS_SAY_F_19]","[SC_PETS_SAY_F_20]"	}
--寵物剛召喚 忠誠度80↑
	local GG = 20
	local SAY_G = {    "[SC_PETS_SAY_G_1]","[SC_PETS_SAY_G_2]","[SC_PETS_SAY_G_3]","[SC_PETS_SAY_G_4]","[SC_PETS_SAY_G_5]","[SC_PETS_SAY_G_6]","[SC_PETS_SAY_G_7]",
		             "[SC_PETS_SAY_G_8]","[SC_PETS_SAY_G_9]","[SC_PETS_SAY_G_10]","[SC_PETS_SAY_G_11]","[SC_PETS_SAY_G_12]","[SC_PETS_SAY_G_13]","[SC_PETS_SAY_G_14]",
		             "[SC_PETS_SAY_G_15]","[SC_PETS_SAY_G_16]","[SC_PETS_SAY_G_17]","[SC_PETS_SAY_G_18]","[SC_PETS_SAY_G_19]","[SC_PETS_SAY_G_20]"	}

	if Loyal < 80 then

		FF = FF-1
		local STRING = Rand( FF )      
		STRING = STRING+1
--		Say( OwnerID() , "STRING=KK= " .. STRING );
		Npcsay( OwnerID() , SAY_F[STRING] );
	
	elseif Loyal >=80 then
		GG = GG-1
		local STRING = Rand( GG )      
		STRING = STRING+1
--		Say( OwnerID() , "STRING=LL= " .. STRING );
		Npcsay( OwnerID() , SAY_G[STRING] );
	end
end

--****************************************************************	寵物開始戰鬥	**********************************************************************--

function Fun_YU_PetAI_ToSay_PetFight(  )

--OwnerID = 寵物
	local Player = ReadRoleValue( OwnerID(),  EM_RoleValue_Register+8  )--主人
	local ModePet = ReadRoleValue( OwnerID(),  EM_RoleValue_Register+9  )--第幾隻寵物
	local Loyal = ReadPetValue( Player, ModePet ,EM_CultivatePetStructValueType_Loyal )--忠誠度


--寵物剛召喚 忠誠度80↓
	local HH = 11
	local SAY_H= {    "[SC_PETS_SAY_H_1]","[SC_PETS_SAY_H_2]","[SC_PETS_SAY_H_3]","[SC_PETS_SAY_H_4]","[SC_PETS_SAY_H_5]","[SC_PETS_SAY_H_6]","[SC_PETS_SAY_H_7]",
		             "[SC_PETS_SAY_H_8]","[SC_PETS_SAY_H_9]","[SC_PETS_SAY_H_10]","[SC_PETS_SAY_H_11]" 	}
--寵物剛召喚 忠誠度80↑
	local II = 16
	local SAY_I = {    "[SC_PETS_SAY_I_1]","[SC_PETS_SAY_I_2]","[SC_PETS_SAY_I_3]","[SC_PETS_SAY_I_4]","[SC_PETS_SAY_I_5]","[SC_PETS_SAY_I_6]","[SC_PETS_SAY_I_7]",
		           "[SC_PETS_SAY_I_8]","[SC_PETS_SAY_I_9]","[SC_PETS_SAY_I_10]","[SC_PETS_SAY_I_11]","[SC_PETS_SAY_I_12]","[SC_PETS_SAY_I_13]","[SC_PETS_SAY_I_14]",
		           "[SC_PETS_SAY_I_15]","[SC_PETS_SAY_I_16]"	}


	if Loyal < 80 then
		HH = HH-1
		local STRING = Rand( HH )      
		STRING = STRING+1
--		Say( OwnerID() , "STRING=KK= " .. STRING );
		Npcsay( OwnerID() , SAY_H[STRING] );
	
	elseif Loyal >=80 then
		II = II-1
		local STRING = Rand( II )      
		STRING = STRING+1
--		Say( OwnerID() , "STRING=LL= " .. STRING );
		Npcsay( OwnerID() , SAY_I[STRING] );
	end
end

--****************************************************************	寵物肚子餓	**********************************************************************--

function Fun_YU_PetAI_ToSay_Hunger(  )--


--OwnerID = 寵物
	local Player = ReadRoleValue( OwnerID(),  EM_RoleValue_Register+8  )--主人
	local ModePet = ReadRoleValue( OwnerID(),  EM_RoleValue_Register+9  )--第幾隻寵物
	local Loyal = ReadPetValue( Player, ModePet ,EM_CultivatePetStructValueType_Loyal )--忠誠度
	local Hunger = ReadPetValue( Player, ModePet ,EM_CultivatePetStructValueType_Hunger )--飽食度
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 

DebugMsg( 0, RoomID ,"ModePet="..ModePet)
DebugMsg( 0, RoomID ,"Loyal="..Loyal)
DebugMsg( 0, RoomID ,"Hunger="..Hunger)

--寵物剛召喚 忠誠度80↓太餓
	local CC = 3
	local SAY_C= {    "[SC_PETS_SAY_C_1]","[SC_PETS_SAY_C_2]","[SC_PETS_SAY_C_3]"	}
--寵物剛召喚 忠誠度80↑太餓
	local DD = 3
	local SAY_D = {    "[SC_PETS_SAY_D_1]","[SC_PETS_SAY_D_2]","[SC_PETS_SAY_D_3]"}
--寵物餓了
	local EE = 14
	local SAY_E = {    "[SC_PETS_SAY_E_1]","[SC_PETS_SAY_E_2]","[SC_PETS_SAY_E_3]","[SC_PETS_SAY_E_4]","[SC_PETS_SAY_E_5]","[SC_PETS_SAY_E_6]","[SC_PETS_SAY_E_7]",
		            "[SC_PETS_SAY_E_8]","[SC_PETS_SAY_E_9]","[SC_PETS_SAY_E_10]","[SC_PETS_SAY_E_11]","[SC_PETS_SAY_E_12]","[SC_PETS_SAY_E_13]","[SC_PETS_SAY_E_14]" }
	if Hunger < 40 then

		local HungerRand = Rand( 10 )      

		if (HungerRand < 2) and (Hunger < 20) then --請加入判斷，是否有食物。

			if Loyal < 80 then
				CC = CC-1
				local STRING = Rand( CC )      
				STRING = STRING+1

				Npcsay( OwnerID() , SAY_C[STRING] );

			elseif Loyal >=80 then
				DD = DD-1
				local STRING = Rand( DD )      
				STRING = STRING+1

				Npcsay( OwnerID() , SAY_D[STRING] );
			end
		else
			EE = EE-1
			local STRING = Rand( EE )      
			STRING = STRING+1

			Npcsay( OwnerID() , SAY_E[STRING] );

		end
	end
end