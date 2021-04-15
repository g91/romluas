

function LuaS_addy_music_box_addbuff()
	DebugMsg(OwnerID(), 1, "1134")
	AddBuff(OwnerID(), 624115, 1, 120)
	LuaFunc_MoveToFlag(OwnerID(), 781261, 0, 0)
	LuaS_addy_music_box()
end

function LuaS_addy_music_box_remove()
	
end



function LuaS_addy_test222()
	DebugMsg(OwnerID(), 1, "LuaS_addy_test...")
	
end

function LuaS_addy_music_box_create()
	DebugMsg(OwnerID(), 1, ">>LuaS_addy_music_box_start...")
end

function LuaS_addy_music_box_story()
	DebugMsg(OwnerID(), 1, ">>LuaS_addy_music_box_story...")
end

function LuaS_addy_music_box_skill_1_check()
	DebugMsg(OwnerID(), 1, "basic magic check")
	return true
end

function LuaS_addy_music_box_skill_1_effect()
	DebugMsg(OwnerID(), 1, "basic magic effect")
	AddBuff(TargetID(), 503556, 1, -1)
end

function LuaS_addy_music_box_skill_1_result()
	DebugMsg(OwnerID(), 1, "basic magic result")
	return true
end

function LuaS_addy_music_box_skill_1_magicgroup_check()
	DebugMsg(OwnerID(), 1, "magic group check")
	return true
end

function LuaS_addy_music_box_skill_1_magicgroup_effect()
	DebugMsg(OwnerID(), 1, "magic group effect")
end

function LuaS_addy_123()
	DebugMsg(OwnerID(), 1, "power source create")
end


function LuaS_check_456789()
	DebugMsg(0, 0, "check point")
	Say(OwnerID(), "i am Owner")
end

function LuaS_c850675()
	Say(OwnerID(), "check 850675")
	DebugMsg(OwnerID(), 0, "check 850675")
end

function LuaS_c624101()
	Say(OwnerID(), "check 624101")
	DebugMsg(OwnerID(), 0, "check 624101")
end

function LuaS_r624101()
	Say(OwnerID(), "result 624101")
	DebugMsg(OwnerID(), 0, "result 624101")
end





function LuaS_check_move()
	DebugMsg(OwnerID(), 0, "check move!!!")
end

function LuaS_result_move()
	DebugMsg(OwnerID(), 0, "result move!!!")
end

function get_move_flags_info_table(_flag_id)
	local flag_count = GetMoveFlagCount(_flag_id)
--	DebugMsg(OwnerID(), 0, ">>get_move_flags_info_table : flag_count = " .. flag_count)

	local flags = {}

	for index = 1, flag_count, 1 do
		local _flag_info = {}
		_flag_info["x"] = GetMoveFlagValue(_flag_id, index - 1, EM_RoleValue_X)
		_flag_info["y"] = GetMoveFlagValue(_flag_id, index - 1, EM_RoleValue_Y)
		_flag_info["z"] = GetMoveFlagValue(_flag_id, index - 1, EM_RoleValue_Z)
		flags[index] = _flag_info
--		DebugMsg(OwnerID(), 0, ">>get_move_flags_info_table : flags[" .. index .. "] : " .. table.print(flags[index]))
	end

	return flags
end

function LuaS_ilikemovemove1()
	local flag_id = 781261

	local flags_info_table = get_move_flags_info_table(flag_id)

	local current_flag = 0

	for index, flag in pairs(flags_info_table) do
		if flag["x"] == ReadRoleValue(OwnerID(), EM_RoleValue_X) and flag["y"] == ReadRoleValue(OwnerID(), EM_RoleValue_Y) and flag["z"] == ReadRoleValue(OwnerID(), EM_RoleValue_Z) then
			current_flag = index - 1
		end
	end

	if current_flag + 1 >= #flags_info_table then
		SetPosByFlag(OwnerID(), flag_id, 0)
--		LuaFunc_MoveToFlag(OwnerID(), flag_id, 0, 0)
--		Move(OwnerID(), flags_info_table[1]["x"], flags_info_table[1]["y"], flags_info_table[1]["z"])
	else
		SetPosByFlag(OwnerID(), flag_id, current_flag + 1)
--		LuaFunc_MoveToFlag(OwnerID(), flag_id, 0, current_flag + 1)
--		Move(OwnerID(), flags_info_table[current_flag + 2]["x"], flags_info_table[current_flag + 2]["y"], flags_info_table[current_flag + 2]["z"])
	end
end

function LuaS_ilikemovemove2()
	local flag_id = 781261

	local flags_info_table = get_move_flags_info_table(flag_id)

	local current_flag = 0

	for index, flag in pairs(flags_info_table) do
		if flag["x"] == ReadRoleValue(OwnerID(), EM_RoleValue_X) and flag["y"] == ReadRoleValue(OwnerID(), EM_RoleValue_Y) and flag["z"] == ReadRoleValue(OwnerID(), EM_RoleValue_Z) then
			current_flag = index - 1
		end
	end

	if current_flag - 1 < 0 then
		SetPosByFlag(OwnerID(), flag_id, #flags_info_table - 1)
--		LuaFunc_MoveToFlag(OwnerID(), flag_id, 0, #flags_info_table - 1)
--		Move(OwnerID(), flags_info_table[#flags_info_table]["x"], flags_info_table[#flags_info_table]["y"], flags_info_table[#flags_info_table]["z"])
	else
		SetPosByFlag(OwnerID(), flag_id, current_flag - 1)
--		LuaFunc_MoveToFlag(OwnerID(), flag_id, 0, current_flag - 1)
--		Move(OwnerID(), flags_info_table[current_flag]["x"], flags_info_table[current_flag]["y"], flags_info_table[current_flag]["z"])
	end
end

function gogogo()
	DebugMsg(OwnerID(), 1, "gogogo")
--	Move(OwnerID(), ReadRoleValue(OwnerID(), EM_RoleValue_X) + 10, ReadRoleValue(OwnerID(), EM_RoleValue_Y), ReadRoleValue(OwnerID(), EM_RoleValue_Z) + 10)
	Move(62587716, 10, -257, 10)
end

function print_my_guid()
	DebugMsg(OwnerID(), 1, "your guid is : " .. OwnerID())
end

function qqqqq()
	DebugMsg(OwnerID(), 1, type(Role:Move()))
end

function i_am_super_man()
	Say(OwnerID(), "hay~i am super man!!!")
	AddBuff(OwnerID(), 624117, 1, -1)
	AddBuff(OwnerID(), 624118, 1, -1)
	AddBuff(OwnerID(), 624119, 1, -1)
end