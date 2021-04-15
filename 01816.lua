--ヘ玡硂CHECK场だ蛤╧磅ㄆノ--

function FN_HOUSESERVANT_CheckTired(id,need,type)
	local temp1 = ReadServantValue( id, EM_HouseServantValueType_Tired ) --痟骋
	local temp2 = ReadServantValue( id, EM_HouseServantValueType_Value0 ) --克盞
	local temp3 = ReadServantValue( id, EM_HouseServantValueType_Value1 ) --緔
	local temp4 = ReadServantValue( id, EM_HouseServantValueType_MaxValue0 ) --克盞程
	local temp5 = ReadServantValue( id, EM_HouseServantValueType_MaxValue1 ) --緔程
--	Say( OwnerID(), "OwnerID")
--	local script = id
--	script = script  .. " SAY "
--	script = script  .. " " .. temp1
--	ClientEvent_Range(  OwnerID(), 99, script )
--	local script = id
--	script = script  .. " SAY "
--	script = script  .. " " .. temp2
--	ClientEvent_Range(  OwnerID(), 99, script )
--硂琿琌ノㄓ浪琩浪琩共计跑て
	if temp1 <= ( 100 - need ) then
		WriteServantValue( id , EM_HouseServantValueType_Tired, temp1+need )
		if need ==15 then
			local String = Rand(11)
			local String2 = temp2/10
			if String >= String2 then --讽克盞禫蔼禫螟矗ど
				if temp4 > temp2 then --耞克盞璶程穦矗ど
					WriteServantValue( id , EM_HouseServantValueType_Value0, temp2+1 )
--					WriteServantValue( id , EM_HouseServantValueType_Value0, 100 )
					ScriptMessage( OwnerID(), OwnerID(), 1, "[C_HOUSESERVANT_SYS01]".."1", C_SYSTEM )
				end
				if temp5 > temp3 then --耞緔璶程穦矗ど
					WriteServantValue( id , EM_HouseServantValueType_Value1, temp3+1 )
--					WriteServantValue( id , EM_HouseServantValueType_Value1, 100 )
				end
			end
			return true
		end
	else
		local script = id
		script = script  .. " SAY "
		if type == 1 then
			script = script  .. "C_HOUSESERVANT_TIRED_1_1"
		elseif type == 2 then
			script = script  .. "C_HOUSESERVANT_TIRED_1_2"
		elseif type == 3 then
			script = script  .. "C_HOUSESERVANT_TIRED_1_3"
		elseif type == 4 then
			script = script  .. "C_HOUSESERVANT_TIRED_1_4"
			ClientEvent_Range(  OwnerID(), 99, script )
			local script = id
			script = script  .. " EMOTE "
			script = script  .. "C_HOUSESERVANT_TIRED_1_4_PLUS"
		elseif type == 5 then
			script = script  .. "C_HOUSESERVANT_TIRED_1_5"
		end
		ClientEvent_Range(  OwnerID(), 99, script )
		return false
	end
	--	WriteServantValue( id , EM_HouseServantValueType_Tired, 0)
end

function FN_HOUSESERVANT_LOCK(id)
	local script = id
	script = script  .. " LOCK"
	ClientEvent_Range(  OwnerID(), 99, script )
end

function FN_HOUSESERVANT_UNLOCK(id)
	local script = id
	script = script  .. " UNLOCK"
	ClientEvent_Range(  OwnerID(), 99, script )
end

function FN_HOUSESERVANT_NEEDSPACE(itemdspace)

	local NeedSpace = itemdspace
	local NeedSpaceStatus  = Check_Bag_Space( OwnerID() , NeedSpace  )

	if ( NeedSpaceStatus  == false ) then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_111490_DIALOG10]", 0 )
		return false
	else
		return true
	end
end