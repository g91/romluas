function FN_HOUSESERVANT_1_1_TALK01(id) --1=女，1=個性一號

	if FN_HOUSESERVANT_CheckTired(id,15,1)  == false then
		return;
	end

	FN_HOUSESERVANT_LOCK(id)

	local script = id
	script = script  .. " SAY "
	local String = Rand(2)
	if String == 0 then
		script = script  .. "C_HOUSESERVANT_1_1_01"
	elseif String == 1 then
		script = script  .. "C_HOUSESERVANT_1_1_02"
	elseif String == 2 then
		script = script  .. "C_HOUSESERVANT_1_1_03"
	end
	ClientEvent_Range(  OwnerID(), 99, script )

	FN_HOUSESERVANT_UNLOCK(id)
end

function FN_HOUSESERVANT_1_1_TALK02(id) --1=女，1=個性一號

	if FN_HOUSESERVANT_CheckTired(id,15,1)  == false then
		return;
	end

	FN_HOUSESERVANT_LOCK(id)

	local script = id
	script = script  .. " SAY "
	local String = Rand(3)
	if String == 0 then
		script = script  .. "C_HOUSESERVANT_1_1_01"
	elseif String == 1 then
		script = script  .. "C_HOUSESERVANT_1_1_02"
	elseif String == 2 then
		script = script  .. "C_HOUSESERVANT_1_1_03"
	elseif String == 3 then
		script = script  .. "C_HOUSESERVANT_1_1_04"
	end
	ClientEvent_Range(  OwnerID(), 99, script )

	FN_HOUSESERVANT_UNLOCK(id)
end

function FN_HOUSESERVANT_1_1_TALK03(id) --1=女，1=個性一號
	
	if FN_HOUSESERVANT_CheckTired(id,15,1)  == false then
		return;
	end

	FN_HOUSESERVANT_LOCK(id)
	
	local script = id
	script = script  .. " SAY "
	local String = Rand(4)
	if String == 0 then
		script = script  .. "C_HOUSESERVANT_1_1_01"
	elseif String == 1 then
		script = script  .. "C_HOUSESERVANT_1_1_02"
	elseif String == 2 then
		script = script  .. "C_HOUSESERVANT_1_1_03"
	elseif String == 3 then
		script = script  .. "C_HOUSESERVANT_1_1_04"
	elseif String == 4 then
		script = script  .. "C_HOUSESERVANT_1_1_05"
	end
	ClientEvent_Range(  OwnerID(), 99, script )

	FN_HOUSESERVANT_UNLOCK(id)
end

function FN_HOUSESERVANT_1_1_TALK04(id) --1=女，1=個性一號
	
	if FN_HOUSESERVANT_CheckTired(id,15,1)  == false then
		return;
	end

	FN_HOUSESERVANT_LOCK(id)

	local script = id
	script = script  .. " SAY "
	local String = Rand(2)
	if String == 0 then
		script = script  .. "C_HOUSESERVANT_1_1_05"
	elseif String == 1 then
		script = script  .. "C_HOUSESERVANT_1_1_06"
	elseif String == 2 then
		script = script  .. "C_HOUSESERVANT_1_1_07"
	end
	ClientEvent_Range(  OwnerID(), 99, script )

	FN_HOUSESERVANT_UNLOCK(id)
end

function FN_HOUSESERVANT_1_1_TALK05(id) --1=女，1=個性一號

	if FN_HOUSESERVANT_CheckTired(id,15,1)  == false then
		return;
	end

	FN_HOUSESERVANT_LOCK(id)

	local script = id
	script = script  .. " SAY "
	local String = Rand(3)
	if String == 0 then
		script = script  .. "C_HOUSESERVANT_1_1_05"
	elseif String == 1 then
		script = script  .. "C_HOUSESERVANT_1_1_06"
	elseif String == 2 then
		script = script  .. "C_HOUSESERVANT_1_1_07"
	elseif String == 3 then
		script = script  .. "C_HOUSESERVANT_1_1_08"
	end
	ClientEvent_Range(  OwnerID(), 99, script )

	FN_HOUSESERVANT_UNLOCK(id)
end

function FN_HOUSESERVANT_1_1_TALK06(id) --1=女，1=個性一號

	if FN_HOUSESERVANT_CheckTired(id,15,1)  == false then
		return;
	end

	FN_HOUSESERVANT_LOCK(id)

	local script = id
	script = script  .. " SAY "
	local String = Rand(3)
	if String == 0 then
		script = script  .. "C_HOUSESERVANT_1_1_06"
	elseif String == 1 then
		script = script  .. "C_HOUSESERVANT_1_1_07"
	elseif String == 2 then
		script = script  .. "C_HOUSESERVANT_1_1_08"
	elseif String == 3 then
		script = script  .. "C_HOUSESERVANT_1_1_09"
	end
	ClientEvent_Range(  OwnerID(), 99, script )

	FN_HOUSESERVANT_UNLOCK(id)
end

function FN_HOUSESERVANT_1_1_TALK07(id) --1=女，1=個性一號

	if FN_HOUSESERVANT_CheckTired(id,15,1)  == false then
		return;
	end

	FN_HOUSESERVANT_LOCK(id)

	local script = id
	script = script  .. " SAY "
	local String = Rand(4)
	if String == 0 then
		script = script  .. "C_HOUSESERVANT_1_1_06"
	elseif String == 1 then
		script = script  .. "C_HOUSESERVANT_1_1_07"
	elseif String == 2 then
		script = script  .. "C_HOUSESERVANT_1_1_08"
	elseif String == 3 then
		script = script  .. "C_HOUSESERVANT_1_1_09"
	elseif String == 4 then
		script = script  .. "C_HOUSESERVANT_1_1_10"
	end
	ClientEvent_Range(  OwnerID(), 99, script )

	FN_HOUSESERVANT_UNLOCK(id)
end
--
function FN_HOUSESERVANT_1_1_TALK08(id) --1=女，1=個性一號

	if FN_HOUSESERVANT_CheckTired(id,15,1)  == false then
		return;
	end

	FN_HOUSESERVANT_LOCK(id)

	local script = id
	script = script  .. " SAY "
	local String = Rand(2)
	if String == 0 then
		script = script  .. "C_HOUSESERVANT_1_1_10"
	elseif String == 1 then
		script = script  .. "C_HOUSESERVANT_1_1_11"
	elseif String == 2 then
		script = script  .. "C_HOUSESERVANT_1_1_12"
	end
	ClientEvent_Range(  OwnerID(), 99, script )

	FN_HOUSESERVANT_UNLOCK(id)
end

function FN_HOUSESERVANT_1_1_TALK09(id) --1=女，1=個性一號

	if FN_HOUSESERVANT_CheckTired(id,15,1)  == false then
		return;
	end

	FN_HOUSESERVANT_LOCK(id)

	local script = id
	script = script  .. " SAY "
	local String = Rand(3)
	if String == 0 then
		script = script  .. "C_HOUSESERVANT_1_1_10"
	elseif String == 1 then
		script = script  .. "C_HOUSESERVANT_1_1_11"
	elseif String == 2 then
		script = script  .. "C_HOUSESERVANT_1_1_12"
	elseif String == 3 then
		script = script  .. "C_HOUSESERVANT_1_1_13"
	end
	ClientEvent_Range(  OwnerID(), 99, script )

	FN_HOUSESERVANT_UNLOCK(id)
end

function FN_HOUSESERVANT_1_1_TALK10(id) --1=女，1=個性一號

	if FN_HOUSESERVANT_CheckTired(id,15,1)  == false then
		return;
	end

	FN_HOUSESERVANT_LOCK(id)

	local script = id
	script = script  .. " SAY "
	local String = Rand(3)
	if String == 0 then
		script = script  .. "C_HOUSESERVANT_1_1_11"
	elseif String == 1 then
		script = script  .. "C_HOUSESERVANT_1_1_12"
	elseif String == 2 then
		script = script  .. "C_HOUSESERVANT_1_1_13"
	elseif String == 3 then
		script = script  .. "C_HOUSESERVANT_1_1_14"
	end
	ClientEvent_Range(  OwnerID(), 99, script )

	FN_HOUSESERVANT_UNLOCK(id)
end

function FN_HOUSESERVANT_1_1_TALK11(id) --1=女，1=個性一號

	if FN_HOUSESERVANT_CheckTired(id,15,1)  == false then
		return;
	end

	FN_HOUSESERVANT_LOCK(id)

	local script = id
	script = script  .. " SAY "
	local String = Rand(4)
	if String == 0 then
		script = script  .. "C_HOUSESERVANT_1_1_11"
	elseif String == 1 then
		script = script  .. "C_HOUSESERVANT_1_1_12"
	elseif String == 2 then
		script = script  .. "C_HOUSESERVANT_1_1_13"
	elseif String == 3 then
		script = script  .. "C_HOUSESERVANT_1_1_14"
	elseif String == 4 then
		script = script  .. "C_HOUSESERVANT_1_1_15"
	end
	ClientEvent_Range(  OwnerID(), 99, script )

	FN_HOUSESERVANT_UNLOCK(id)
end
--
function FN_HOUSESERVANT_1_1_TALK12(id) --1=女，1=個性一號

	if FN_HOUSESERVANT_CheckTired(id,15,1)  == false then
		return;
	end

	FN_HOUSESERVANT_LOCK(id)

	local script = id
	script = script  .. " SAY "
	local String = Rand(2)
	if String == 0 then
		script = script  .. "C_HOUSESERVANT_1_1_15"
	elseif String == 1 then
		script = script  .. "C_HOUSESERVANT_1_1_16"
	elseif String == 2 then
		script = script  .. "C_HOUSESERVANT_1_1_17"
	end
	ClientEvent_Range(  OwnerID(), 99, script )

	FN_HOUSESERVANT_UNLOCK(id)
end

function FN_HOUSESERVANT_1_1_TALK13(id) --1=女，1=個性一號

	if FN_HOUSESERVANT_CheckTired(id,15,1)  == false then
		return;
	end

	FN_HOUSESERVANT_LOCK(id)

	local script = id
	script = script  .. " SAY "
	local String = Rand(3)
	if String == 0 then
		script = script  .. "C_HOUSESERVANT_1_1_15"
	elseif String == 1 then
		script = script  .. "C_HOUSESERVANT_1_1_16"
	elseif String == 2 then
		script = script  .. "C_HOUSESERVANT_1_1_17"
	elseif String == 3 then
		script = script  .. "C_HOUSESERVANT_1_1_18"
	end
	ClientEvent_Range(  OwnerID(), 99, script )

	FN_HOUSESERVANT_UNLOCK(id)
end

function FN_HOUSESERVANT_1_1_TALK14(id) --1=女，1=個性一號

	if FN_HOUSESERVANT_CheckTired(id,15,1)  == false then
		return;
	end

	FN_HOUSESERVANT_LOCK(id)

	local script = id
	script = script  .. " SAY "
	local String = Rand(3)
	if String == 0 then
		script = script  .. "C_HOUSESERVANT_1_1_16"
	elseif String == 1 then
		script = script  .. "C_HOUSESERVANT_1_1_17"
	elseif String == 2 then
		script = script  .. "C_HOUSESERVANT_1_1_18"
	elseif String == 3 then
		script = script  .. "C_HOUSESERVANT_1_1_19"
	end
	ClientEvent_Range(  OwnerID(), 99, script )

	FN_HOUSESERVANT_UNLOCK(id)
end
---------------------------------------------------------------------------------------------
function FN_HOUSESERVANT_1_2_TALK01(id) --1=女，2=個性二號

	if FN_HOUSESERVANT_CheckTired(id,15,2)  == false then
		return;
	end

	FN_HOUSESERVANT_LOCK(id)

	local script = id
	script = script  .. " SAY "
	local String = Rand(2)
	if String == 0 then
		script = script  .. "C_HOUSESERVANT_1_2_01"
	elseif String == 1 then
		script = script  .. "C_HOUSESERVANT_1_2_02"
	elseif String == 2 then
		script = script  .. "C_HOUSESERVANT_1_2_03"
	end
	ClientEvent_Range(  OwnerID(), 99, script )

	FN_HOUSESERVANT_UNLOCK(id)
end

function FN_HOUSESERVANT_1_2_TALK02(id) --1=女，2=個性二號

	if FN_HOUSESERVANT_CheckTired(id,15,2)  == false then
		return;
	end

	FN_HOUSESERVANT_LOCK(id)

	local script = id
	script = script  .. " SAY "
	local String = Rand(3)
	if String == 0 then
		script = script  .. "C_HOUSESERVANT_1_2_01"
	elseif String == 1 then
		script = script  .. "C_HOUSESERVANT_1_2_02"
	elseif String == 2 then
		script = script  .. "C_HOUSESERVANT_1_2_03"
	elseif String == 3 then
		script = script  .. "C_HOUSESERVANT_1_2_04"
	end
	ClientEvent_Range(  OwnerID(), 99, script )

	FN_HOUSESERVANT_UNLOCK(id)
end

function FN_HOUSESERVANT_1_2_TALK03(id) --1=女，2=個性二號

	if FN_HOUSESERVANT_CheckTired(id,15,2)  == false then
		return;
	end

	FN_HOUSESERVANT_LOCK(id)

	local script = id
	script = script  .. " SAY "
	local String = Rand(4)
	if String == 0 then
		script = script  .. "C_HOUSESERVANT_1_2_01"
	elseif String == 1 then
		script = script  .. "C_HOUSESERVANT_1_2_02"
	elseif String == 2 then
		script = script  .. "C_HOUSESERVANT_1_2_03"
	elseif String == 3 then
		script = script  .. "C_HOUSESERVANT_1_2_04"
	elseif String == 4 then
		script = script  .. "C_HOUSESERVANT_1_2_05"
	end
	ClientEvent_Range(  OwnerID(), 99, script )

	FN_HOUSESERVANT_UNLOCK(id)
end

function FN_HOUSESERVANT_1_2_TALK04(id) --1=女，2=個性二號

	if FN_HOUSESERVANT_CheckTired(id,15,2)  == false then
		return;
	end

	FN_HOUSESERVANT_LOCK(id)

	local script = id
	script = script  .. " SAY "
	local String = Rand(2)
	if String == 0 then
		script = script  .. "C_HOUSESERVANT_1_2_05"
	elseif String == 1 then
		script = script  .. "C_HOUSESERVANT_1_2_06"
	elseif String == 2 then
		script = script  .. "C_HOUSESERVANT_1_2_07"
	end
	ClientEvent_Range(  OwnerID(), 99, script )

	FN_HOUSESERVANT_UNLOCK(id)
end

function FN_HOUSESERVANT_1_2_TALK05(id) --1=女，2=個性二號

	if FN_HOUSESERVANT_CheckTired(id,15,2)  == false then
		return;
	end

	FN_HOUSESERVANT_LOCK(id)

	local script = id
	script = script  .. " SAY "
	local String = Rand(3)
	if String == 0 then
		script = script  .. "C_HOUSESERVANT_1_2_05"
	elseif String == 1 then
		script = script  .. "C_HOUSESERVANT_1_2_06"
	elseif String == 2 then
		script = script  .. "C_HOUSESERVANT_1_2_07"
	elseif String == 3 then
		script = script  .. "C_HOUSESERVANT_1_2_08"
	end
	ClientEvent_Range(  OwnerID(), 99, script )

	FN_HOUSESERVANT_UNLOCK(id)
end

function FN_HOUSESERVANT_1_2_TALK06(id) --1=女，2=個性二號

	if FN_HOUSESERVANT_CheckTired(id,15,2)  == false then
		return;
	end

	FN_HOUSESERVANT_LOCK(id)

	local script = id
	script = script  .. " SAY "
	local String = Rand(3)
	if String == 0 then
		script = script  .. "C_HOUSESERVANT_1_2_06"
	elseif String == 1 then
		script = script  .. "C_HOUSESERVANT_1_2_07"
	elseif String == 2 then
		script = script  .. "C_HOUSESERVANT_1_2_08"
	elseif String == 3 then
		script = script  .. "C_HOUSESERVANT_1_2_09"
	end
	ClientEvent_Range(  OwnerID(), 99, script )

	FN_HOUSESERVANT_UNLOCK(id)
end

function FN_HOUSESERVANT_1_2_TALK07(id) --1=女，2=個性二號

	if FN_HOUSESERVANT_CheckTired(id,15,2)  == false then
		return;
	end

	FN_HOUSESERVANT_LOCK(id)

	local script = id
	script = script  .. " SAY "
	local String = Rand(4)
	if String == 0 then
		script = script  .. "C_HOUSESERVANT_1_2_06"
	elseif String == 1 then
		script = script  .. "C_HOUSESERVANT_1_2_07"
	elseif String == 2 then
		script = script  .. "C_HOUSESERVANT_1_2_08"
	elseif String == 3 then
		script = script  .. "C_HOUSESERVANT_1_2_09"
	elseif String == 4 then
		script = script  .. "C_HOUSESERVANT_1_2_10"
	end
	ClientEvent_Range(  OwnerID(), 99, script )

	FN_HOUSESERVANT_UNLOCK(id)
end
--
function FN_HOUSESERVANT_1_2_TALK08(id) --1=女，2=個性二號

	if FN_HOUSESERVANT_CheckTired(id,15,2)  == false then
		return;
	end

	FN_HOUSESERVANT_LOCK(id)

	local script = id
	script = script  .. " SAY "
	local String = Rand(2)
	if String == 0 then
		script = script  .. "C_HOUSESERVANT_1_2_10"
	elseif String == 1 then
		script = script  .. "C_HOUSESERVANT_1_2_11"
	elseif String == 2 then
		script = script  .. "C_HOUSESERVANT_1_2_12"
	end
	ClientEvent_Range(  OwnerID(), 99, script )

	FN_HOUSESERVANT_UNLOCK(id)
end

function FN_HOUSESERVANT_1_2_TALK09(id) --1=女，2=個性二號

	if FN_HOUSESERVANT_CheckTired(id,15,2)  == false then
		return;
	end

	FN_HOUSESERVANT_LOCK(id)

	local script = id
	script = script  .. " SAY "
	local String = Rand(3)
	if String == 0 then
		script = script  .. "C_HOUSESERVANT_1_2_10"
	elseif String == 1 then
		script = script  .. "C_HOUSESERVANT_1_2_11"
	elseif String == 2 then
		script = script  .. "C_HOUSESERVANT_1_2_12"
	elseif String == 3 then
		script = script  .. "C_HOUSESERVANT_1_2_13"
	end
	ClientEvent_Range(  OwnerID(), 99, script )

	FN_HOUSESERVANT_UNLOCK(id)
end

function FN_HOUSESERVANT_1_2_TALK10(id) --1=女，2=個性二號

	if FN_HOUSESERVANT_CheckTired(id,15,2)  == false then
		return;
	end

	FN_HOUSESERVANT_LOCK(id)

	local script = id
	script = script  .. " SAY "
	local String = Rand(3)
	if String == 0 then
		script = script  .. "C_HOUSESERVANT_1_2_11"
	elseif String == 1 then
		script = script  .. "C_HOUSESERVANT_1_2_12"
	elseif String == 2 then
		script = script  .. "C_HOUSESERVANT_1_2_13"
	elseif String == 3 then
		script = script  .. "C_HOUSESERVANT_1_2_14"
	end
	ClientEvent_Range(  OwnerID(), 99, script )

	FN_HOUSESERVANT_UNLOCK(id)
end

function FN_HOUSESERVANT_1_2_TALK11(id) --1=女，2=個性二號

	if FN_HOUSESERVANT_CheckTired(id,15,2)  == false then
		return;
	end

	FN_HOUSESERVANT_LOCK(id)

	local script = id
	script = script  .. " SAY "
	local String = Rand(4)
	if String == 0 then
		script = script  .. "C_HOUSESERVANT_1_2_11"
	elseif String == 1 then
		script = script  .. "C_HOUSESERVANT_1_2_12"
	elseif String == 2 then
		script = script  .. "C_HOUSESERVANT_1_2_13"
	elseif String == 3 then
		script = script  .. "C_HOUSESERVANT_1_2_14"
	elseif String == 4 then
		script = script  .. "C_HOUSESERVANT_1_2_15"
	end
	ClientEvent_Range(  OwnerID(), 99, script )

	FN_HOUSESERVANT_UNLOCK(id)
end
--
function FN_HOUSESERVANT_1_2_TALK12(id) --1=女，2=個性二號

	if FN_HOUSESERVANT_CheckTired(id,15,2)  == false then
		return;
	end

	FN_HOUSESERVANT_LOCK(id)

	local script = id
	script = script  .. " SAY "
	local String = Rand(2)
	if String == 0 then
		script = script  .. "C_HOUSESERVANT_1_2_15"
	elseif String == 1 then
		script = script  .. "C_HOUSESERVANT_1_2_16"
	elseif String == 2 then
		script = script  .. "C_HOUSESERVANT_1_2_17"
	end
	ClientEvent_Range(  OwnerID(), 99, script )

	FN_HOUSESERVANT_UNLOCK(id)
end

function FN_HOUSESERVANT_1_2_TALK13(id) --1=女，2=個性二號

	if FN_HOUSESERVANT_CheckTired(id,15,2)  == false then
		return;
	end

	FN_HOUSESERVANT_LOCK(id)

	local script = id
	script = script  .. " SAY "
	local String = Rand(3)
	if String == 0 then
		script = script  .. "C_HOUSESERVANT_1_2_15"
	elseif String == 1 then
		script = script  .. "C_HOUSESERVANT_1_2_16"
	elseif String == 2 then
		script = script  .. "C_HOUSESERVANT_1_2_17"
	elseif String == 3 then
		script = script  .. "C_HOUSESERVANT_1_2_18"
	end
	ClientEvent_Range(  OwnerID(), 99, script )

	FN_HOUSESERVANT_UNLOCK(id)
end

function FN_HOUSESERVANT_1_2_TALK14(id) --1=女，2=個性二號

	if FN_HOUSESERVANT_CheckTired(id,15,2)  == false then
		return;
	end

	FN_HOUSESERVANT_LOCK(id)

	local script = id
	script = script  .. " SAY "
	local String = Rand(3)
	if String == 0 then
		script = script  .. "C_HOUSESERVANT_1_2_16"
	elseif String == 1 then
		script = script  .. "C_HOUSESERVANT_1_2_17"
	elseif String == 2 then
		script = script  .. "C_HOUSESERVANT_1_2_18"
	elseif String == 3 then
		script = script  .. "C_HOUSESERVANT_1_2_19"
	end
	ClientEvent_Range(  OwnerID(), 99, script )

	FN_HOUSESERVANT_UNLOCK(id)
end
-------------------------------------------------------------------------
function FN_HOUSESERVANT_1_3_TALK01(id) --1=女，3=個性三號

	if FN_HOUSESERVANT_CheckTired(id,15,3)  == false then
		return;
	end

	FN_HOUSESERVANT_LOCK(id)

	local script = id
	script = script  .. " SAY "
	local String = Rand(2)
	if String == 0 then
		script = script  .. "C_HOUSESERVANT_1_3_01"
	elseif String == 1 then
		script = script  .. "C_HOUSESERVANT_1_3_02"
	elseif String == 2 then
		script = script  .. "C_HOUSESERVANT_1_3_03"
	end
	ClientEvent_Range(  OwnerID(), 99, script )

	FN_HOUSESERVANT_UNLOCK(id)
end

function FN_HOUSESERVANT_1_3_TALK02(id) --1=女，3=個性三號

	if FN_HOUSESERVANT_CheckTired(id,15,3)  == false then
		return;
	end

	FN_HOUSESERVANT_LOCK(id)

	local script = id
	script = script  .. " SAY "
	local String = Rand(3)
	if String == 0 then
		script = script  .. "C_HOUSESERVANT_1_3_01"
	elseif String == 1 then
		script = script  .. "C_HOUSESERVANT_1_3_02"
	elseif String == 2 then
		script = script  .. "C_HOUSESERVANT_1_3_03"
	elseif String == 3 then
		script = script  .. "C_HOUSESERVANT_1_3_04"
	end
	ClientEvent_Range(  OwnerID(), 99, script )

	FN_HOUSESERVANT_UNLOCK(id)
end

function FN_HOUSESERVANT_1_3_TALK03(id) --1=女，3=個性三號

	if FN_HOUSESERVANT_CheckTired(id,15,3)  == false then
		return;
	end

	FN_HOUSESERVANT_LOCK(id)

	local script = id
	script = script  .. " SAY "
	local String = Rand(4)
	if String == 0 then
		script = script  .. "C_HOUSESERVANT_1_3_01"
	elseif String == 1 then
		script = script  .. "C_HOUSESERVANT_1_3_02"
	elseif String == 2 then
		script = script  .. "C_HOUSESERVANT_1_3_03"
	elseif String == 3 then
		script = script  .. "C_HOUSESERVANT_1_3_04"
	elseif String == 4 then
		script = script  .. "C_HOUSESERVANT_1_3_05"
	end
	ClientEvent_Range(  OwnerID(), 99, script )

	FN_HOUSESERVANT_UNLOCK(id)
end

function FN_HOUSESERVANT_1_3_TALK04(id) --1=女，3=個性三號

	if FN_HOUSESERVANT_CheckTired(id,15,3)  == false then
		return;
	end

	FN_HOUSESERVANT_LOCK(id)

	local script = id
	script = script  .. " SAY "
	local String = Rand(2)
	if String == 0 then
		script = script  .. "C_HOUSESERVANT_1_3_05"
	elseif String == 1 then
		script = script  .. "C_HOUSESERVANT_1_3_06"
	elseif String == 2 then
		script = script  .. "C_HOUSESERVANT_1_3_07"
	end
	ClientEvent_Range(  OwnerID(), 99, script )

	FN_HOUSESERVANT_UNLOCK(id)
end

function FN_HOUSESERVANT_1_3_TALK05(id) --1=女，3=個性三號

	if FN_HOUSESERVANT_CheckTired(id,15,3)  == false then
		return;
	end

	FN_HOUSESERVANT_LOCK(id)

	local script = id
	script = script  .. " SAY "
	local String = Rand(3)
	if String == 0 then
		script = script  .. "C_HOUSESERVANT_1_3_05"
	elseif String == 1 then
		script = script  .. "C_HOUSESERVANT_1_3_06"
	elseif String == 2 then
		script = script  .. "C_HOUSESERVANT_1_3_07"
	elseif String == 3 then
		script = script  .. "C_HOUSESERVANT_1_3_08"
	end
	ClientEvent_Range(  OwnerID(), 99, script )

	FN_HOUSESERVANT_UNLOCK(id)
end

function FN_HOUSESERVANT_1_3_TALK06(id) --1=女，3=個性三號

	if FN_HOUSESERVANT_CheckTired(id,15,3)  == false then
		return;
	end

	FN_HOUSESERVANT_LOCK(id)

	local script = id
	script = script  .. " SAY "
	local String = Rand(3)
	if String == 0 then
		script = script  .. "C_HOUSESERVANT_1_3_06"
	elseif String == 1 then
		script = script  .. "C_HOUSESERVANT_1_3_07"
	elseif String == 2 then
		script = script  .. "C_HOUSESERVANT_1_3_08"
	elseif String == 3 then
		script = script  .. "C_HOUSESERVANT_1_3_09"
	end
	ClientEvent_Range(  OwnerID(), 99, script )

	FN_HOUSESERVANT_UNLOCK(id)
end

function FN_HOUSESERVANT_1_3_TALK07(id) --1=女，3=個性三號

	if FN_HOUSESERVANT_CheckTired(id,15,3)  == false then
		return;
	end

	FN_HOUSESERVANT_LOCK(id)

	local script = id
	script = script  .. " SAY "
	local String = Rand(4)
	if String == 0 then
		script = script  .. "C_HOUSESERVANT_1_3_06"
	elseif String == 1 then
		script = script  .. "C_HOUSESERVANT_1_3_07"
	elseif String == 2 then
		script = script  .. "C_HOUSESERVANT_1_3_08"
	elseif String == 3 then
		script = script  .. "C_HOUSESERVANT_1_3_09"
	elseif String == 4 then
		script = script  .. "C_HOUSESERVANT_1_3_10"
	end
	ClientEvent_Range(  OwnerID(), 99, script )

	FN_HOUSESERVANT_UNLOCK(id)
end
--
function FN_HOUSESERVANT_1_3_TALK08(id) --1=女，3=個性三號

	if FN_HOUSESERVANT_CheckTired(id,15,3)  == false then
		return;
	end

	FN_HOUSESERVANT_LOCK(id)

	local script = id
	script = script  .. " SAY "
	local String = Rand(2)
	if String == 0 then
		script = script  .. "C_HOUSESERVANT_1_3_10"
	elseif String == 1 then
		script = script  .. "C_HOUSESERVANT_1_3_11"
	elseif String == 2 then
		script = script  .. "C_HOUSESERVANT_1_3_12"
	end
	ClientEvent_Range(  OwnerID(), 99, script )

	FN_HOUSESERVANT_UNLOCK(id)
end

function FN_HOUSESERVANT_1_3_TALK09(id) --1=女，3=個性三號

	if FN_HOUSESERVANT_CheckTired(id,15,3)  == false then
		return;
	end

	FN_HOUSESERVANT_LOCK(id)

	local script = id
	script = script  .. " SAY "
	local String = Rand(3)
	if String == 0 then
		script = script  .. "C_HOUSESERVANT_1_3_10"
	elseif String == 1 then
		script = script  .. "C_HOUSESERVANT_1_3_11"
	elseif String == 2 then
		script = script  .. "C_HOUSESERVANT_1_3_12"
	elseif String == 3 then
		script = script  .. "C_HOUSESERVANT_1_3_13"
	end
	ClientEvent_Range(  OwnerID(), 99, script )

	FN_HOUSESERVANT_UNLOCK(id)
end

function FN_HOUSESERVANT_1_3_TALK10(id) --1=女，3=個性三號

	if FN_HOUSESERVANT_CheckTired(id,15,3)  == false then
		return;
	end

	FN_HOUSESERVANT_LOCK(id)

	local script = id
	script = script  .. " SAY "
	local String = Rand(3)
	if String == 0 then
		script = script  .. "C_HOUSESERVANT_1_3_11"
	elseif String == 1 then
		script = script  .. "C_HOUSESERVANT_1_3_12"
	elseif String == 2 then
		script = script  .. "C_HOUSESERVANT_1_3_13"
	elseif String == 3 then
		script = script  .. "C_HOUSESERVANT_1_3_14"
	end
	ClientEvent_Range(  OwnerID(), 99, script )

	FN_HOUSESERVANT_UNLOCK(id)
end

function FN_HOUSESERVANT_1_3_TALK11(id) --1=女，3=個性三號

	if FN_HOUSESERVANT_CheckTired(id,15,3)  == false then
		return;
	end

	FN_HOUSESERVANT_LOCK(id)

	local script = id
	script = script  .. " SAY "
	local String = Rand(4)
	if String == 0 then
		script = script  .. "C_HOUSESERVANT_1_3_11"
	elseif String == 1 then
		script = script  .. "C_HOUSESERVANT_1_3_12"
	elseif String == 2 then
		script = script  .. "C_HOUSESERVANT_1_3_13"
	elseif String == 3 then
		script = script  .. "C_HOUSESERVANT_1_3_14"
	elseif String == 4 then
		script = script  .. "C_HOUSESERVANT_1_3_15"
	end
	ClientEvent_Range(  OwnerID(), 99, script )

	FN_HOUSESERVANT_UNLOCK(id)
end
--
function FN_HOUSESERVANT_1_3_TALK12(id) --1=女，3=個性三號

	if FN_HOUSESERVANT_CheckTired(id,15,3)  == false then
		return;
	end

	FN_HOUSESERVANT_LOCK(id)

	local script = id
	script = script  .. " SAY "
	local String = Rand(2)
	if String == 0 then
		script = script  .. "C_HOUSESERVANT_1_3_15"
	elseif String == 1 then
		script = script  .. "C_HOUSESERVANT_1_3_16"
	elseif String == 2 then
		script = script  .. "C_HOUSESERVANT_1_3_17"
	end
	ClientEvent_Range(  OwnerID(), 99, script )

	FN_HOUSESERVANT_UNLOCK(id)
end

function FN_HOUSESERVANT_1_3_TALK13(id) --1=女，3=個性三號

	if FN_HOUSESERVANT_CheckTired(id,15,3)  == false then
		return;
	end

	FN_HOUSESERVANT_LOCK(id)

	local script = id
	script = script  .. " SAY "
	local String = Rand(3)
	if String == 0 then
		script = script  .. "C_HOUSESERVANT_1_3_15"
	elseif String == 1 then
		script = script  .. "C_HOUSESERVANT_1_3_16"
	elseif String == 2 then
		script = script  .. "C_HOUSESERVANT_1_3_17"
	elseif String == 3 then
		script = script  .. "C_HOUSESERVANT_1_3_18"
	end
	ClientEvent_Range(  OwnerID(), 99, script )

	FN_HOUSESERVANT_UNLOCK(id)
end

function FN_HOUSESERVANT_1_3_TALK14(id) --1=女，3=個性三號

	if FN_HOUSESERVANT_CheckTired(id,15,3)  == false then
		return;
	end

	FN_HOUSESERVANT_LOCK(id)

	local script = id
	script = script  .. " SAY "
	local String = Rand(3)
	if String == 0 then
		script = script  .. "C_HOUSESERVANT_1_3_16"
	elseif String == 1 then
		script = script  .. "C_HOUSESERVANT_1_3_17"
	elseif String == 2 then
		script = script  .. "C_HOUSESERVANT_1_3_18"
	elseif String == 3 then
		script = script  .. "C_HOUSESERVANT_1_3_19"
	end
	ClientEvent_Range(  OwnerID(), 99, script )

	FN_HOUSESERVANT_UNLOCK(id)
end
----------------------------------------------------------------------------------
function FN_HOUSESERVANT_1_4_TALK01(id) --1=女，4=個性四號

	if FN_HOUSESERVANT_CheckTired(id,15,4)  == false then
		return;
	end

	FN_HOUSESERVANT_LOCK(id)

	local script = id
	script = script  .. " SAY "
	local String = Rand(2)
	if String == 0 then
		script = script  .. "C_HOUSESERVANT_1_4_01"
		ClientEvent_Range(  OwnerID(), 99, script )
		script = id
		script = script  .. " EMOTE "
		script = script  .. "C_HOUSESERVANT_1_4_01_PLUS"
	elseif String == 1 then
		script = script  .. "C_HOUSESERVANT_1_4_02"
	elseif String == 2 then
		script = script  .. "C_HOUSESERVANT_1_4_03"
	end
	ClientEvent_Range(  OwnerID(), 99, script )

	FN_HOUSESERVANT_UNLOCK(id)
end

function FN_HOUSESERVANT_1_4_TALK02(id) --1=女，4=個性四號

	if FN_HOUSESERVANT_CheckTired(id,15,4)  == false then
		return;
	end

	FN_HOUSESERVANT_LOCK(id)

	local script = id
	script = script  .. " SAY "
	local String = Rand(3)
	if String == 0 then
		script = script  .. "C_HOUSESERVANT_1_4_01"
		ClientEvent_Range(  OwnerID(), 99, script )
		script = id
		script = script  .. " EMOTE "
		script = script  .. "C_HOUSESERVANT_1_4_01_PLUS"
	elseif String == 1 then
		script = script  .. "C_HOUSESERVANT_1_4_02"
	elseif String == 2 then
		script = script  .. "C_HOUSESERVANT_1_4_03"
	elseif String == 3 then
		script = script  .. "C_HOUSESERVANT_1_4_04"
	end
	ClientEvent_Range(  OwnerID(), 99, script )

	FN_HOUSESERVANT_UNLOCK(id)
end

function FN_HOUSESERVANT_1_4_TALK03(id) --1=女，4=個性四號

	if FN_HOUSESERVANT_CheckTired(id,15,4)  == false then
		return;
	end

	FN_HOUSESERVANT_LOCK(id)

	local script = id
	script = script  .. " SAY "
	local String = Rand(4)
	if String == 0 then
		script = script  .. "C_HOUSESERVANT_1_4_01"
		ClientEvent_Range(  OwnerID(), 99, script )
		script = id
		script = script  .. " EMOTE "
		script = script  .. "C_HOUSESERVANT_1_4_01_PLUS"
	elseif String == 1 then
		script = script  .. "C_HOUSESERVANT_1_4_02"
	elseif String == 2 then
		script = script  .. "C_HOUSESERVANT_1_4_03"
	elseif String == 3 then
		script = script  .. "C_HOUSESERVANT_1_4_04"
	elseif String == 4 then
		script = script  .. "C_HOUSESERVANT_1_4_05"
	end
	ClientEvent_Range(  OwnerID(), 99, script )

	FN_HOUSESERVANT_UNLOCK(id)
end

function FN_HOUSESERVANT_1_4_TALK04(id) --1=女，4=個性四號

	if FN_HOUSESERVANT_CheckTired(id,15,4)  == false then
		return;
	end

	FN_HOUSESERVANT_LOCK(id)

	local script = id
	script = script  .. " SAY "
	local String = Rand(2)
	if String == 0 then
		script = script  .. "C_HOUSESERVANT_1_4_05"
	elseif String == 1 then
		script = script  .. "C_HOUSESERVANT_1_4_06"
	elseif String == 2 then
		script = script  .. "C_HOUSESERVANT_1_4_07"
	end
	ClientEvent_Range(  OwnerID(), 99, script )

	FN_HOUSESERVANT_UNLOCK(id)
end

function FN_HOUSESERVANT_1_4_TALK05(id) --1=女，4=個性四號

	if FN_HOUSESERVANT_CheckTired(id,15,4)  == false then
		return;
	end

	FN_HOUSESERVANT_LOCK(id)

	local script = id
	script = script  .. " SAY "
	local String = Rand(3)
	if String == 0 then
		script = script  .. "C_HOUSESERVANT_1_4_05"
	elseif String == 1 then
		script = script  .. "C_HOUSESERVANT_1_4_06"
	elseif String == 2 then
		script = script  .. "C_HOUSESERVANT_1_4_07"
	elseif String == 3 then
		script = script  .. "C_HOUSESERVANT_1_4_08"
	end
	ClientEvent_Range(  OwnerID(), 99, script )

	FN_HOUSESERVANT_UNLOCK(id)
end

function FN_HOUSESERVANT_1_4_TALK06(id) --1=女，4=個性四號

	if FN_HOUSESERVANT_CheckTired(id,15,4)  == false then
		return;
	end

	FN_HOUSESERVANT_LOCK(id)

	local script = id
	script = script  .. " SAY "
	local String = Rand(3)
	if String == 0 then
		script = script  .. "C_HOUSESERVANT_1_4_06"
	elseif String == 1 then
		script = script  .. "C_HOUSESERVANT_1_4_07"
	elseif String == 2 then
		script = script  .. "C_HOUSESERVANT_1_4_08"
	elseif String == 3 then
		script = script  .. "C_HOUSESERVANT_1_4_09"
	end
	ClientEvent_Range(  OwnerID(), 99, script )

	FN_HOUSESERVANT_UNLOCK(id)
end

function FN_HOUSESERVANT_1_4_TALK07(id) --1=女，4=個性四號

	if FN_HOUSESERVANT_CheckTired(id,15,4)  == false then
		return;
	end

	FN_HOUSESERVANT_LOCK(id)

	local script = id
	script = script  .. " SAY "
	local String = Rand(4)
	if String == 0 then
		script = script  .. "C_HOUSESERVANT_1_4_06"
	elseif String == 1 then
		script = script  .. "C_HOUSESERVANT_1_4_07"
	elseif String == 2 then
		script = script  .. "C_HOUSESERVANT_1_4_08"
	elseif String == 3 then
		script = script  .. "C_HOUSESERVANT_1_4_09"
	elseif String == 4 then
		script = script  .. "C_HOUSESERVANT_1_4_10"
	end
	ClientEvent_Range(  OwnerID(), 99, script )

	FN_HOUSESERVANT_UNLOCK(id)
end
--
function FN_HOUSESERVANT_1_4_TALK08(id) --1=女，4=個性四號

	if FN_HOUSESERVANT_CheckTired(id,15,4)  == false then
		return;
	end

	FN_HOUSESERVANT_LOCK(id)

	local script = id
	script = script  .. " SAY "
	local String = Rand(2)
	if String == 0 then
		script = script  .. "C_HOUSESERVANT_1_4_10"
	elseif String == 1 then
		script = script  .. "C_HOUSESERVANT_1_4_11"
	elseif String == 2 then
		script = script  .. "C_HOUSESERVANT_1_4_12"
	end
	ClientEvent_Range(  OwnerID(), 99, script )

	FN_HOUSESERVANT_UNLOCK(id)
end

function FN_HOUSESERVANT_1_4_TALK09(id) --1=女，4=個性四號

	if FN_HOUSESERVANT_CheckTired(id,15,4)  == false then
		return;
	end

	FN_HOUSESERVANT_LOCK(id)

	local script = id
	script = script  .. " SAY "
	local String = Rand(3)
	if String == 0 then
		script = script  .. "C_HOUSESERVANT_1_4_10"
	elseif String == 1 then
		script = script  .. "C_HOUSESERVANT_1_4_11"
	elseif String == 2 then
		script = script  .. "C_HOUSESERVANT_1_4_12"
	elseif String == 3 then
		script = script  .. "C_HOUSESERVANT_1_4_13"
	end
	ClientEvent_Range(  OwnerID(), 99, script )

	FN_HOUSESERVANT_UNLOCK(id)
end

function FN_HOUSESERVANT_1_4_TALK10(id) --1=女，4=個性四號
	
	if FN_HOUSESERVANT_CheckTired(id,15,4)  == false then
		return;
	end

	FN_HOUSESERVANT_LOCK(id)

	local script = id
	script = script  .. " SAY "
	local String = Rand(3)
	if String == 0 then
		script = script  .. "C_HOUSESERVANT_1_4_11"
	elseif String == 1 then
		script = script  .. "C_HOUSESERVANT_1_4_12"
	elseif String == 2 then
		script = script  .. "C_HOUSESERVANT_1_4_13"
	elseif String == 3 then
		script = script  .. "C_HOUSESERVANT_1_4_14"
	end
	ClientEvent_Range(  OwnerID(), 99, script )

	FN_HOUSESERVANT_UNLOCK(id)
end

function FN_HOUSESERVANT_1_4_TALK11(id) --1=女，4=個性四號

	if FN_HOUSESERVANT_CheckTired(id,15,4)  == false then
		return;
	end

	FN_HOUSESERVANT_LOCK(id)

	local script = id
	script = script  .. " SAY "
	local String = Rand(4)
	if String == 0 then
		script = script  .. "C_HOUSESERVANT_1_4_11"
	elseif String == 1 then
		script = script  .. "C_HOUSESERVANT_1_4_12"
	elseif String == 2 then
		script = script  .. "C_HOUSESERVANT_1_4_13"
	elseif String == 3 then
		script = script  .. "C_HOUSESERVANT_1_4_14"
	elseif String == 4 then
		script = script  .. "C_HOUSESERVANT_1_4_15"
	end
	ClientEvent_Range(  OwnerID(), 99, script )

	FN_HOUSESERVANT_UNLOCK(id)
end
--
function FN_HOUSESERVANT_1_4_TALK12(id) --1=女，4=個性四號

	if FN_HOUSESERVANT_CheckTired(id,15,4)  == false then
		return;
	end

	FN_HOUSESERVANT_LOCK(id)

	local script = id
	script = script  .. " SAY "
	local String = Rand(2)
	if String == 0 then
		script = script  .. "C_HOUSESERVANT_1_4_15"
	elseif String == 1 then
		script = script  .. "C_HOUSESERVANT_1_4_16"
	elseif String == 2 then
		script = script  .. "C_HOUSESERVANT_1_4_17"
	end
	ClientEvent_Range(  OwnerID(), 99, script )

	FN_HOUSESERVANT_UNLOCK(id)
end

function FN_HOUSESERVANT_1_4_TALK13(id) --1=女，4=個性四號

	if FN_HOUSESERVANT_CheckTired(id,15,4)  == false then
		return;
	end

	FN_HOUSESERVANT_LOCK(id)

	local script = id
	script = script  .. " SAY "
	local String = Rand(3)
	if String == 0 then
		script = script  .. "C_HOUSESERVANT_1_4_15"
	elseif String == 1 then
		script = script  .. "C_HOUSESERVANT_1_4_16"
	elseif String == 2 then
		script = script  .. "C_HOUSESERVANT_1_4_17"
	elseif String == 3 then
		script = script  .. "C_HOUSESERVANT_1_4_18"
	end
	ClientEvent_Range(  OwnerID(), 99, script )

	FN_HOUSESERVANT_UNLOCK(id)
end

function FN_HOUSESERVANT_1_4_TALK14(id) --1=女，4=個性四號

	if FN_HOUSESERVANT_CheckTired(id,15,4)  == false then
		return;
	end

	FN_HOUSESERVANT_LOCK(id)

	local script = id
	script = script  .. " SAY "
	local String = Rand(3)
	if String == 0 then
		script = script  .. "C_HOUSESERVANT_1_4_16"
	elseif String == 1 then
		script = script  .. "C_HOUSESERVANT_1_4_17"
	elseif String == 2 then
		script = script  .. "C_HOUSESERVANT_1_4_18"
	elseif String == 3 then
		script = script  .. "C_HOUSESERVANT_1_4_19"
	end
	ClientEvent_Range(  OwnerID(), 99, script )

	FN_HOUSESERVANT_UNLOCK(id)
end
-------------------------------------------------------------------------
function FN_HOUSESERVANT_1_5_TALK01(id) --1=女，5=個性五號

	if FN_HOUSESERVANT_CheckTired(id,15,5)  == false then
		return;
	end

	FN_HOUSESERVANT_LOCK(id)

	local script = id
	script = script  .. " SAY "
	local String = Rand(2)
	if String == 0 then
		script = script  .. "C_HOUSESERVANT_1_5_01"
	elseif String == 1 then
		script = script  .. "C_HOUSESERVANT_1_5_02"
	elseif String == 2 then
		script = script  .. "C_HOUSESERVANT_1_5_03"
	end
	ClientEvent_Range(  OwnerID(), 99, script )

	FN_HOUSESERVANT_UNLOCK(id)
end

function FN_HOUSESERVANT_1_5_TALK02(id) --1=女，5=個性五號

	if FN_HOUSESERVANT_CheckTired(id,15,5)  == false then
		return;
	end

	FN_HOUSESERVANT_LOCK(id)

	local script = id
	script = script  .. " SAY "
	local String = Rand(3)
	if String == 0 then
		script = script  .. "C_HOUSESERVANT_1_5_01"
	elseif String == 1 then
		script = script  .. "C_HOUSESERVANT_1_5_02"
	elseif String == 2 then
		script = script  .. "C_HOUSESERVANT_1_5_03"
	elseif String == 3 then
		script = script  .. "C_HOUSESERVANT_1_5_04"
	end
	ClientEvent_Range(  OwnerID(), 99, script )

	FN_HOUSESERVANT_UNLOCK(id)
end

function FN_HOUSESERVANT_1_5_TALK03(id) --1=女，5=個性五號

	if FN_HOUSESERVANT_CheckTired(id,15,5)  == false then
		return;
	end

	FN_HOUSESERVANT_LOCK(id)

	local script = id
	script = script  .. " SAY "
	local String = Rand(4)
	if String == 0 then
		script = script  .. "C_HOUSESERVANT_1_5_01"
	elseif String == 1 then
		script = script  .. "C_HOUSESERVANT_1_5_02"
	elseif String == 2 then
		script = script  .. "C_HOUSESERVANT_1_5_03"
	elseif String == 3 then
		script = script  .. "C_HOUSESERVANT_1_5_04"
	elseif String == 4 then
		script = script  .. "C_HOUSESERVANT_1_5_05"
	end
	ClientEvent_Range(  OwnerID(), 99, script )

	FN_HOUSESERVANT_UNLOCK(id)
end

function FN_HOUSESERVANT_1_5_TALK04(id) --1=女，5=個性五號

	if FN_HOUSESERVANT_CheckTired(id,15,5)  == false then
		return;
	end

	FN_HOUSESERVANT_LOCK(id)

	local script = id
	script = script  .. " SAY "
	local String = Rand(2)
	if String == 0 then
		script = script  .. "C_HOUSESERVANT_1_5_05"
	elseif String == 1 then
		script = script  .. "C_HOUSESERVANT_1_5_06"
	elseif String == 2 then
		script = script  .. "C_HOUSESERVANT_1_5_07"
		ClientEvent_Range(  OwnerID(), 99, script )
		script = id
		script = script  .. " EMOTE "
		script = script  .. "C_HOUSESERVANT_1_5_07_PLUS"
	end
	ClientEvent_Range(  OwnerID(), 99, script )

	FN_HOUSESERVANT_UNLOCK(id)
end

function FN_HOUSESERVANT_1_5_TALK05(id) --1=女，5=個性五號

	if FN_HOUSESERVANT_CheckTired(id,15,5)  == false then
		return;
	end

	FN_HOUSESERVANT_LOCK(id)

	local script = id
	script = script  .. " SAY "
	local String = Rand(3)
	if String == 0 then
		script = script  .. "C_HOUSESERVANT_1_5_05"
	elseif String == 1 then
		script = script  .. "C_HOUSESERVANT_1_5_06"
	elseif String == 2 then
		script = script  .. "C_HOUSESERVANT_1_5_07"
		ClientEvent_Range(  OwnerID(), 99, script )
		script = id
		script = script  .. " EMOTE "
		script = script  .. "C_HOUSESERVANT_1_5_07_PLUS"
	elseif String == 3 then
		script = script  .. "C_HOUSESERVANT_1_5_08"
	end
	ClientEvent_Range(  OwnerID(), 99, script )

	FN_HOUSESERVANT_UNLOCK(id)
end

function FN_HOUSESERVANT_1_5_TALK06(id) --1=女，5=個性五號

	if FN_HOUSESERVANT_CheckTired(id,15,5)  == false then
		return;
	end

	FN_HOUSESERVANT_LOCK(id)

	local script = id
	script = script  .. " SAY "
	local String = Rand(3)
	if String == 0 then
		script = script  .. "C_HOUSESERVANT_1_5_06"
	elseif String == 1 then
		script = script  .. "C_HOUSESERVANT_1_5_07"
		ClientEvent_Range(  OwnerID(), 99, script )
		script = id
		script = script  .. " EMOTE "
		script = script  .. "C_HOUSESERVANT_1_5_07_PLUS"
	elseif String == 2 then
		script = script  .. "C_HOUSESERVANT_1_5_08"
	elseif String == 3 then
		script = script  .. "C_HOUSESERVANT_1_5_09"
	end
	ClientEvent_Range(  OwnerID(), 99, script )

	FN_HOUSESERVANT_UNLOCK(id)
end

function FN_HOUSESERVANT_1_5_TALK07(id) --1=女，5=個性五號

	if FN_HOUSESERVANT_CheckTired(id,15,5)  == false then
		return;
	end

	FN_HOUSESERVANT_LOCK(id)

	local script = id
	script = script  .. " SAY "
	local String = Rand(4)
	if String == 0 then
		script = script  .. "C_HOUSESERVANT_1_5_06"
	elseif String == 1 then
		script = script  .. "C_HOUSESERVANT_1_5_07"
		ClientEvent_Range(  OwnerID(), 99, script )
		script = id
		script = script  .. " EMOTE "
		script = script  .. "C_HOUSESERVANT_1_5_07_PLUS"
	elseif String == 2 then
		script = script  .. "C_HOUSESERVANT_1_5_08"
	elseif String == 3 then
		script = script  .. "C_HOUSESERVANT_1_5_09"
	elseif String == 4 then
		script = script  .. "C_HOUSESERVANT_1_5_10"
	end
	ClientEvent_Range(  OwnerID(), 99, script )

	FN_HOUSESERVANT_UNLOCK(id)
end
--
function FN_HOUSESERVANT_1_5_TALK08(id) --1=女，5=個性五號

	if FN_HOUSESERVANT_CheckTired(id,15,5)  == false then
		return;
	end

	FN_HOUSESERVANT_LOCK(id)

	local script = id
	script = script  .. " SAY "
	local String = Rand(2)
	if String == 0 then
		script = script  .. "C_HOUSESERVANT_1_5_10"
	elseif String == 1 then
		script = script  .. "C_HOUSESERVANT_1_5_11"
	elseif String == 2 then
		script = script  .. "C_HOUSESERVANT_1_5_12"
	end
	ClientEvent_Range(  OwnerID(), 99, script )

	FN_HOUSESERVANT_UNLOCK(id)
end

function FN_HOUSESERVANT_1_5_TALK09(id) --1=女，5=個性五號

	if FN_HOUSESERVANT_CheckTired(id,15,5)  == false then
		return;
	end

	FN_HOUSESERVANT_LOCK(id)

	local script = id
	script = script  .. " SAY "
	local String = Rand(3)
	if String == 0 then
		script = script  .. "C_HOUSESERVANT_1_5_10"
	elseif String == 1 then
		script = script  .. "C_HOUSESERVANT_1_5_11"
	elseif String == 2 then
		script = script  .. "C_HOUSESERVANT_1_5_12"
	elseif String == 3 then
		script = script  .. "C_HOUSESERVANT_1_5_13"
	end
	ClientEvent_Range(  OwnerID(), 99, script )

	FN_HOUSESERVANT_UNLOCK(id)
end

function FN_HOUSESERVANT_1_5_TALK10(id) --1=女，5=個性五號

	if FN_HOUSESERVANT_CheckTired(id,15,5)  == false then
		return;
	end

	FN_HOUSESERVANT_LOCK(id)

	local script = id
	script = script  .. " SAY "
	local String = Rand(3)
	if String == 0 then
		script = script  .. "C_HOUSESERVANT_1_5_11"
	elseif String == 1 then
		script = script  .. "C_HOUSESERVANT_1_5_12"
	elseif String == 2 then
		script = script  .. "C_HOUSESERVANT_1_5_13"
	elseif String == 3 then
		script = script  .. "C_HOUSESERVANT_1_5_14"
	end
	ClientEvent_Range(  OwnerID(), 99, script )

	FN_HOUSESERVANT_UNLOCK(id)
end

function FN_HOUSESERVANT_1_5_TALK11(id) --1=女，5=個性五號

	if FN_HOUSESERVANT_CheckTired(id,15,5)  == false then
		return;
	end

	FN_HOUSESERVANT_LOCK(id)

	local script = id
	script = script  .. " SAY "
	local String = Rand(4)
	if String == 0 then
		script = script  .. "C_HOUSESERVANT_1_5_11"
	elseif String == 1 then
		script = script  .. "C_HOUSESERVANT_1_5_12"
	elseif String == 2 then
		script = script  .. "C_HOUSESERVANT_1_5_13"
	elseif String == 3 then
		script = script  .. "C_HOUSESERVANT_1_5_14"
	elseif String == 4 then
		script = script  .. "C_HOUSESERVANT_1_5_15"
	end
	ClientEvent_Range(  OwnerID(), 99, script )

	FN_HOUSESERVANT_UNLOCK(id)
end
--
function FN_HOUSESERVANT_1_5_TALK12(id) --1=女，5=個性五號

	if FN_HOUSESERVANT_CheckTired(id,15,5)  == false then
		return;
	end

	FN_HOUSESERVANT_LOCK(id)

	local script = id
	script = script  .. " SAY "
	local String = Rand(2)
	if String == 0 then
		script = script  .. "C_HOUSESERVANT_1_5_15"
	elseif String == 1 then
		script = script  .. "C_HOUSESERVANT_1_5_16"
	elseif String == 2 then
		script = script  .. "C_HOUSESERVANT_1_5_17"
	end
	ClientEvent_Range(  OwnerID(), 99, script )

	FN_HOUSESERVANT_UNLOCK(id)
end

function FN_HOUSESERVANT_1_5_TALK13(id) --1=女，5=個性五號

	if FN_HOUSESERVANT_CheckTired(id,15,5)  == false then
		return;
	end

	FN_HOUSESERVANT_LOCK(id)

	local script = id
	script = script  .. " SAY "
	local String = Rand(3)
	if String == 0 then
		script = script  .. "C_HOUSESERVANT_1_5_15"
	elseif String == 1 then
		script = script  .. "C_HOUSESERVANT_1_5_16"
	elseif String == 2 then
		script = script  .. "C_HOUSESERVANT_1_5_17"
	elseif String == 3 then
		script = script  .. "C_HOUSESERVANT_1_5_18"
	end
	ClientEvent_Range(  OwnerID(), 99, script )

	FN_HOUSESERVANT_UNLOCK(id)
end

function FN_HOUSESERVANT_1_5_TALK14(id) --1=女，5=個性五號

	if FN_HOUSESERVANT_CheckTired(id,15,5)  == false then
		return;
	end

	FN_HOUSESERVANT_LOCK(id)

	local script = id
	script = script  .. " SAY "
	local String = Rand(3)
	if String == 0 then
		script = script  .. "C_HOUSESERVANT_1_5_16"
	elseif String == 1 then
		script = script  .. "C_HOUSESERVANT_1_5_17"
	elseif String == 2 then
		script = script  .. "C_HOUSESERVANT_1_5_18"
	elseif String == 3 then
		script = script  .. "C_HOUSESERVANT_1_5_19"
	end
	ClientEvent_Range(  OwnerID(), 99, script )

	FN_HOUSESERVANT_UNLOCK(id)
end