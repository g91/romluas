function DW_Rand(Int)
	if	type(Int) ~= "number"	then
		return false
	end
	if	Int < 0		then
		return -1
	end
	if	Int == 0		then
		return 0
	end
	math.randomseed(math.random(10000, 99999))
	return math.random(Int)
end


-- FA_Rand
function FA_Rand (Arg1,Arg2,Seed)
	local ToNum
	local PowTemp
	local RandTemp
	Seed = Seed or math.random(10000,99999)
	math.randomseed(Seed)
	if Type(Arg1) == "string" then
		ToNum = tonumber(Arg1)
		if ToNum == 1 then
			return math.random(0,9)
		elseif ToNum == 0 then
			return 0
		elseif ToNum == -1 then
			return math.random()
		elseif (ToNum > 1) == FALSE then
			DebugMsg(0,0,"FA_Rand Error: Check your Arg1!")
			return FALSE
		end
		PowTemp = 10^(ToNum-1)
		RandTemp = math.random() * PowTemp
		while PowTemp > RandTemp do
			RandTemp = RandTemp * 10
		end
		return math.floor(RandTemp)
	end
	if Arg2 ~= nil then
		Arg1 = Arg1 or Arg2
		return math.random(Arg1,Arg2)
	elseif Arg1 ~= nil then
		return math.random(Arg1)
	else
		return math.random(10000,99999)
	end
end