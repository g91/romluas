function FN_HOUSESERVANT_1_Professional_1(id) --1=女, 1=魔法能力
	local temp5 = ReadServantValue( id, EM_HouseServantValueType_Value0 ) --親密度
	if temp5 >=10 then
		if FN_HOUSESERVANT_CheckTired(id,25,1)  == false then
			return;
		end
		FN_HOUSESERVANT_LOCK(id)
		
		local temp3 = ReadServantValue( id, EM_HouseServantValueType_Value3 ) --魔法能力
		local temp4 = ReadServantValue( id, EM_HouseServantValueType_Value1 ) --魅力
		local temp6 = ReadServantValue( id, EM_HouseServantValueType_MaxValue3 ) --魔法能力最大值

		if temp5 > temp3 then
			if temp6 ~= temp3 then
				WriteServantValue( id , EM_HouseServantValueType_Value3, temp3+1 )
			end
		end
		temp3 = temp3/5
		local Tempint = Rand(2)
		--Say(OwnerID(),Tempint)
		if Tempint == 0 then
			AddBuff(OwnerID(), 506633, temp3, 144*temp4)
		elseif Tempint == 1 then
			AddBuff(OwnerID(), 506635, temp3, 144*temp4)
		end

		FN_HOUSESERVANT_UNLOCK(id)
	else
		ScriptMessage( OwnerID(), OwnerID(), 1, "[C_HOUSESERVANT_SYS02]", "0" )
	end
end

function FN_HOUSESERVANT_1_Professional_1_plus(id) --1=女, 1=魔法能力
	if FN_HOUSESERVANT_CheckTired(id,25,1)  == false then
		return;
	end
	FN_HOUSESERVANT_LOCK(id)
	
	local temp3 = ReadServantValue( id, EM_HouseServantValueType_Value3 ) --魔法能力
	local temp4 = ReadServantValue( id, EM_HouseServantValueType_Value1 ) --魅力
	local temp5 = ReadServantValue( id, EM_HouseServantValueType_Value0 ) --親密度
	local temp6 = ReadServantValue( id, EM_HouseServantValueType_MaxValue3 ) --魔法能力最大值
	if temp5 > temp3 then
		if temp6 ~= temp3 then
			WriteServantValue( id , EM_HouseServantValueType_Value3, temp3+1 )
		end
	end
	local temp7 = (temp3-75)/5
	temp3 = temp3/5
	local Tempint = Rand(2)
	--Say(OwnerID(),Tempint)
	if Tempint == 0 then
		AddBuff(OwnerID(), 506633, temp3, 144*temp4)
		AddBuff(OwnerID(), 506634, temp7, 144*temp4)
	elseif Tempint == 1 then
		AddBuff(OwnerID(), 506635, temp3, 144*temp4)
	end

	FN_HOUSESERVANT_UNLOCK(id)
end
---------------------------------------
function FN_HOUSESERVANT_1_Professional_2(id) --1=女, 2=戰鬥能力
	local temp5 = ReadServantValue( id, EM_HouseServantValueType_Value0 ) --親密度
	if temp5 >=10 then
		if FN_HOUSESERVANT_CheckTired(id,25,1)  == false then
			return;
		end
		FN_HOUSESERVANT_LOCK(id)
		
		local temp3 = ReadServantValue( id, EM_HouseServantValueType_Value4 ) --戰鬥能力
		local temp4 = ReadServantValue( id, EM_HouseServantValueType_Value1 ) --魅力

		local temp6 = ReadServantValue( id, EM_HouseServantValueType_MaxValue4 ) --戰鬥能力最大值
		if temp5 > temp3 then
			if temp6 ~= temp3 then
				WriteServantValue( id , EM_HouseServantValueType_Value4, temp3+1 )
			end
		end
		temp3 = temp3/5
		local Tempint = Rand(2)
		--Say(OwnerID(),Tempint)
		if Tempint == 0 then
			AddBuff(OwnerID(), 506637, temp3, 144*temp4)
		elseif Tempint == 1 then
			AddBuff(OwnerID(), 506639, temp3, 144*temp4)
		end

		FN_HOUSESERVANT_UNLOCK(id)
	else
		ScriptMessage( OwnerID(), OwnerID(), 1, "[C_HOUSESERVANT_SYS02]", "0" )
	end
end

function FN_HOUSESERVANT_1_Professional_2_plus(id) --1=女, 2=戰鬥能力
	if FN_HOUSESERVANT_CheckTired(id,25,1)  == false then
		return;
	end
	FN_HOUSESERVANT_LOCK(id)
	
	local temp3 = ReadServantValue( id, EM_HouseServantValueType_Value4 ) --戰鬥能力
	local temp4 = ReadServantValue( id, EM_HouseServantValueType_Value1 ) --魅力
	local temp5 = ReadServantValue( id, EM_HouseServantValueType_Value0 ) --親密度
	local temp6 = ReadServantValue( id, EM_HouseServantValueType_MaxValue4 ) --戰鬥能力最大值
	if temp5 > temp3 then
		if temp6 ~= temp3 then
			WriteServantValue( id , EM_HouseServantValueType_Value4, temp3+1 )
		end
	end
	local temp7 = (temp3-75)/5
	temp3 = temp3/5
	local Tempint = Rand(2)
	--Say(OwnerID(),Tempint)
	if Tempint == 0 then
		AddBuff(OwnerID(), 506637, temp3, 144*temp4)
		AddBuff(OwnerID(), 506638, temp7, 144*temp4)
	elseif Tempint == 1 then
		AddBuff(OwnerID(), 506639, temp3, 144*temp4)
	end

	FN_HOUSESERVANT_UNLOCK(id)
end
---------------------------------------
function FN_HOUSESERVANT_1_Professional_3(id) --1=女, 3=守護能力
	local temp5 = ReadServantValue( id, EM_HouseServantValueType_Value0 ) --親密度
	if temp5 >=10 then
		if FN_HOUSESERVANT_CheckTired(id,25,1)  == false then
			return;
		end
		FN_HOUSESERVANT_LOCK(id)
		
		local temp3 = ReadServantValue( id, EM_HouseServantValueType_Value5 ) --守護能力
		local temp4 = ReadServantValue( id, EM_HouseServantValueType_Value1 ) --魅力

		local temp6 = ReadServantValue( id, EM_HouseServantValueType_MaxValue5 ) --守護能力最大值
		if temp5 > temp3 then
			if temp6 ~= temp3 then
				WriteServantValue( id , EM_HouseServantValueType_Value5, temp3+1 )
			end
		end
		temp3 = temp3/5
		local Tempint = Rand(2)
		--Say(OwnerID(),Tempint)
		if Tempint == 0 then
			AddBuff(OwnerID(), 506641, temp3, 144*temp4)
		elseif Tempint == 1 then
			AddBuff(OwnerID(), 506693, temp3, 144*temp4)
		end

		FN_HOUSESERVANT_UNLOCK(id)
	else
		ScriptMessage( OwnerID(), OwnerID(), 1, "[C_HOUSESERVANT_SYS02]", "0" )
	end
end

function FN_HOUSESERVANT_1_Professional_3_plus(id) --1=女, 3=守護能力
	if FN_HOUSESERVANT_CheckTired(id,25,1)  == false then
		return;
	end
	FN_HOUSESERVANT_LOCK(id)
	
	local temp3 = ReadServantValue( id, EM_HouseServantValueType_Value5 ) --守護能力
	local temp4 = ReadServantValue( id, EM_HouseServantValueType_Value1 ) --魅力
	local temp5 = ReadServantValue( id, EM_HouseServantValueType_Value0 ) --親密度
	local temp6 = ReadServantValue( id, EM_HouseServantValueType_MaxValue5 ) --守護能力最大值
	if temp5 > temp3 then
		if temp6 ~= temp3 then
			WriteServantValue( id , EM_HouseServantValueType_Value5, temp3+1 )
		end
	end
	local temp7 = (temp3-75)/5
	temp3 = temp3/5
	local Tempint = Rand(2)
	--Say(OwnerID(),Tempint)
	if Tempint == 0 then
		AddBuff(OwnerID(), 506641, temp3, 144*temp4)
		AddBuff(OwnerID(), 506642, temp7, 144*temp4)
	elseif Tempint == 1 then
		AddBuff(OwnerID(), 506693, temp3, 144*temp4)
		AddBuff(OwnerID(), 506694, temp7, 144*temp4)
	end

	FN_HOUSESERVANT_UNLOCK(id)
end
---------------------------------------
function FN_HOUSESERVANT_1_Professional_4(id) --1=女, 4=烹飪能力
	local temp5 = ReadServantValue( id, EM_HouseServantValueType_Value0 ) --親密度
	if temp5 >=10 then
		if FN_HOUSESERVANT_CheckTired(id,25,1)  == false then
			return;
		end

		local temp3 = ReadServantValue( id, EM_HouseServantValueType_Value6 ) --烹飪能力
		local temp4 = ReadServantValue( id, EM_HouseServantValueType_Value1 ) --魅力

		local temp6 = ReadServantValue( id, EM_HouseServantValueType_MaxValue6 ) --烹飪能力最大值

		if FN_HOUSESERVANT_NEEDSPACE(2) == false then
			return
		end

		if temp5 > temp3 then
			if temp6 ~= temp3 then
				WriteServantValue( id , EM_HouseServantValueType_Value6, temp3+1 )
			end
		end

		FN_HOUSESERVANT_LOCK(id)

		temp4 = math.floor(temp4/5)
		if temp3 >= 81 then
			temp3 = math.floor((temp3-70)/10)*5--81~89給5個，90~99給10個，100給15個
			GiveBodyItem( OwnerID(), 207215, temp3+temp4 )
			GiveBodyItem( OwnerID(), 207216, temp3+temp4 )
		elseif temp3 >= 51 then
			temp3 = math.floor((temp3-40)/10)*5--51~59給5個，60~69給10個，70~79給15個，80給20個
			GiveBodyItem( OwnerID(), 207213, temp3+temp4 )
			GiveBodyItem( OwnerID(), 207214, temp3+temp4 )
		elseif temp3 >= 21 then
			temp3 = math.floor((temp3-10)/10)*5--21~29給5個，30~39給10個，40~49給15個，50給20個
			GiveBodyItem( OwnerID(), 207211, temp3+temp4 )
			GiveBodyItem( OwnerID(), 207212, temp3+temp4 )
		elseif temp3 <= 20 then
			temp3 = math.floor((temp3/10)+1)*5--0~9給5個，10~19給10個，20給15個
			GiveBodyItem( OwnerID(), 207209, temp3+temp4 )
			GiveBodyItem( OwnerID(), 207210, temp3+temp4 )
		end
		
		FN_HOUSESERVANT_UNLOCK(id)
	else
		ScriptMessage( OwnerID(), OwnerID(), 1, "[C_HOUSESERVANT_SYS02]", "0" )
	end
end
---------------------------------------
function FN_HOUSESERVANT_1_Professional_5(id) --1=女, 5=發明能力
	local temp5 = ReadServantValue( id, EM_HouseServantValueType_Value0 ) --親密度
	if temp5 >=10 then
		if FN_HOUSESERVANT_CheckTired(id,25,1)  == false then
			return;
		end

		if FN_HOUSESERVANT_NEEDSPACE(1) == false then
			return
		end

		local temp3 = ReadServantValue( id, EM_HouseServantValueType_Value7 ) --發明能力
		local temp4 = ReadServantValue( id, EM_HouseServantValueType_Value1 ) --魅力

		local temp6 = ReadServantValue( id, EM_HouseServantValueType_MaxValue7 ) --發明能力最大值

		FN_HOUSESERVANT_LOCK(id)
		if temp5 > temp3 then
			if temp6 ~= temp3 then
				WriteServantValue( id , EM_HouseServantValueType_Value7, temp3+1 )
			end
		end
		temp4 = temp4/8
		local P5item = {} 	--P5代表Professional_5
		P5item[0] = 207199
		P5item[1] = 207200
		P5item[2] = 207201
		P5item[3] = 207202
		P5item[4] = 207203
		P5item[5] = 207204
		P5item[6] = 207205
		P5item[7] = 207206
		P5item[8] = 207207
		P5item[9] = 207208

		if temp3 <=29 then
			temp3 = (temp3/10)
			if temp3 == 0 then temp3 = 1 end
			local Tempint = Rand(2)
			GiveBodyItem( OwnerID(), P5item[Tempint], 3+temp4)
			if Tempint == 2 then
				GiveBodyItem( OwnerID(), P5item[Tempint-2], 3+temp4)
			else
				GiveBodyItem( OwnerID(), P5item[Tempint+1], 3+temp4)
			end
		else
			temp3 = (temp3/10)
			if temp3 == 10 then temp3 = 9 end
			local Tempint = Rand(temp3)
			GiveBodyItem( OwnerID(), P5item[Tempint], 3+temp4)
			if Tempint == temp3 then
				GiveBodyItem( OwnerID(), P5item[Tempint-temp3], 3+temp4)
			else
				GiveBodyItem( OwnerID(), P5item[Tempint+1], 3+temp4)
			end
		end

		FN_HOUSESERVANT_UNLOCK(id)
	else
		ScriptMessage( OwnerID(), OwnerID(), 1, "[C_HOUSESERVANT_SYS02]", "0" )
	end
end