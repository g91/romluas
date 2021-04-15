function LuaYU_Frogkill_00()

	local Frogset = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101724, 300 , 1)      --«CµìÀJ¹³

	local FrogBoss01 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101470, 300 , 1)      --¹p»ï¤ûµì¤ý
	local FrogBoss02 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101715, 300 , 1)      --Àã¦a¬rµì¤ý
	local FrogBoss03 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101716, 300 , 1)      --¨ª§À¶Â¬Ðµì¤ý
	local FrogBoss04 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101717, 300 , 1)      --¼ÚÄ¬°Ç¬rµì¤ý
	local FrogBoss05 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101718, 300 , 1)      --®üªi©Ô³·µì¤ý

	local Frog01 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101710, 300 , 1)      --¹p»ï¤ûµì
	local Frog02 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101712, 300 , 1)      --Àã¦a¬rµì
	local Frog03 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101713, 300 , 1)      --¨ª§À¶Â¬Ðµì
	local Frog04 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101711, 300 , 1)      --¼ÚÄ¬°Ç¬rµì
	local Frog05 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101714, 300 , 1)      --®üªi©Ô³·µì


	if Frogset[0] ~= -1 then
		for i=0, table.getn(Frogset) do
			if CheckID(Frogset[i]) == true then
				Delobj(Frogset[i])
			end
		end
	end



	if FrogBoss01[0] ~= -1 then
		for i=0, table.getn(FrogBoss01) do
			if CheckID(FrogBoss01[i]) == true then
				Delobj(FrogBoss01[i])
			end
		end
	end

	if FrogBoss02[0] ~= -1 then
		for i=0, table.getn(FrogBoss02) do
			if CheckID(FrogBoss02[i]) == true then
				Delobj(FrogBoss02[i])
			end
		end
	end

	if FrogBoss03[0] ~= -1 then
		for i=0, table.getn(FrogBoss03) do
			if CheckID(FrogBoss03[i]) == true then
				Delobj(FrogBoss03[i])
			end
		end
	end

	if FrogBoss04[0] ~= -1 then
		for i=0, table.getn(FrogBoss04) do
			if CheckID(FrogBoss04[i]) == true then
				Delobj(FrogBoss04[i])
			end
		end
	end

	if FrogBoss05[0] ~= -1 then
		for i=0, table.getn(FrogBoss05) do
			if CheckID(FrogBoss05[i]) == true then
				Delobj(FrogBoss05[i])
			end
		end
	end

	if Frog01[0] ~= -1 then
		for i=0, table.getn(Frog01) do
			if CheckID(Frog01[i]) == true then
				Delobj(Frog01[i])
			end
		end
	end

	if Frog02[0] ~= -1 then
		for i=0, table.getn(Frog02) do
			if CheckID(Frog02[i]) == true then
				Delobj(Frog02[i])
			end
		end
	end

	if Frog03[0] ~= -1 then
		for i=0, table.getn(Frog03) do
			if CheckID(Frog03[i]) == true then
				Delobj(Frog03[i])
			end
		end
	end

	if Frog04[0] ~= -1 then
		for i=0, table.getn(Frog04) do
			if CheckID(Frog04[i]) == true then
				Delobj(Frog04[i])
			end
		end
	end

	if Frog05[0] ~= -1 then
		for i=0, table.getn(Frog05) do
			if CheckID(Frog05[i]) == true then
				Delobj(Frog05[i])
			end
		end
	end

end