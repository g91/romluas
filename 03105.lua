function WY_Z28_BUFF_DECREASE()
	DebugMsg(0,0,"DECREASE")
	local confidence = 625183
	local cautious = 625184
	local temp_pow = 0
	local buff_list = {}
	local own = OwnerID()
	for n = 1,BuffCount(own) do
		local pos = n - 1
		buff_list[n] = BuffInfo(own, pos , EM_BuffInfoType_BuffID)
		if buff_list[n] == confidence then
			DebugMsg(0,0,"confidence")
			temp_pow = BuffInfo(own, pos , EM_BuffInfoType_Power) -1
			AddBuff(own, confidence, temp_pow,-1)
		elseif buff_list[n] == cautious then
			temp_pow = BuffInfo(own, pos , EM_BuffInfoType_Power) -1
			AddBuff(own, cautious, temp_pow,-1)
		end
	end
end