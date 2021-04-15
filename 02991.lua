-----------------------------------------------------------------------
--	26 duplication - Great Shark Cellar Duplication
--	6 boss - TecolySanzoUzal
--	ai & gm command
-----------------------------------------------------------------------

-----------------------------------------------------------------------
--	TecolySanzoUzal ai
-----------------------------------------------------------------------
function GreatSharkCellarDuplication_TecolySanzoUzal_ai()
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
	GreatSharkCellarDuplication_TecolySanzoUzal:debug("TecolySanzoUzal ai start -> function GreatSharkCellarDuplication_TecolySanzoUzal_ai()")
	GreatSharkCellarDuplication_TecolySanzoUzal[room_id].ai_trigger = false
	local orgid = ReadRoleValue(OwnerID(), EM_RoleValue_OrgID)

	-----------------------------------------------------------------------
	--	check ai's owner
	-----------------------------------------------------------------------
	local TecolySanzoUzal = nil
	if orgid == GreatSharkCellarDuplication_TecolySanzoUzal.TecolySanzoUzal_orgid then
		TecolySanzoUzal = GreatSharkCellarDuplication_TecolySanzoUzal[room_id].TecolySanzoUzal
	else TecolySanzoUzal = GreatSharkCellarDuplication_TecolySanzoUzal[room_id].TecolySanzoUzal_SungChiLi end

	TecolySanzoUzal.fight = true
	TecolySanzoUzal.movable = true
	TecolySanzoUzal.search_enemy = true
	TecolySanzoUzal.strike_back = true
	TecolySanzoUzal.hate_list_duplication = TecolySanzoUzal.hate_list

	GreatSharkCellarDuplication_TecolySanzoUzal:debug("TecolySanzoUzal ai loop start")
	while GreatSharkCellarDuplication_TecolySanzoUzal[room_id].status == "boss" do

		TecolySanzoUzal.hate_list_duplication = TecolySanzoUzal.hate_list

		-----------------------------------------------------------------------
		--	skill
		-----------------------------------------------------------------------
		if #TecolySanzoUzal.hate_list_duplication > 0 then
			TecolySanzoUzal:useSkill("sword_of_sky")
			TecolySanzoUzal:useSkill("denunciation")
			TecolySanzoUzal:useSkill("back_to_the_sky")
			TecolySanzoUzal:useSkill("amulet_binding")
		else TecolySanzoUzal:hate(GreatSharkCellarDuplication_TecolySanzoUzal[room_id].players[1]) end

		-----------------------------------------------------------------------
		--	system delay
		-----------------------------------------------------------------------
		GreatSharkCellarDuplication_TecolySanzoUzal:sleep()
		
	end
	GreatSharkCellarDuplication_TecolySanzoUzal:debug("TecolySanzoUzal ai loop stop")

	GreatSharkCellarDuplication_TecolySanzoUzal:debug("TecolySanzoUzal ai stop")
	GreatSharkCellarDuplication_TecolySanzoUzal[room_id].ai_trigger = true
end

-----------------------------------------------------------------------
--	gm command
-----------------------------------------------------------------------
function gm_gscd_tecolysanzouzal_commander()
	if not GreatSharkCellarDuplication_TecolySanzoUzal then return end
	GreatSharkCellarDuplication_TecolySanzoUzal.recipient = AddyPlayer:new(OwnerID())
	GreatSharkCellarDuplication_TecolySanzoUzal.alpha = true
	GreatSharkCellarDuplication_TecolySanzoUzal.beta = true
	GreatSharkCellarDuplication_TecolySanzoUzal:debug("Hello commander ! It's a debug message for you.")
	GreatSharkCellarDuplication_TecolySanzoUzal:debug("alpha : " .. tostring(GreatSharkCellarDuplication_TecolySanzoUzal.alpha))
	GreatSharkCellarDuplication_TecolySanzoUzal:debug("beta : " .. tostring(GreatSharkCellarDuplication_TecolySanzoUzal.beta))
end

-----------------------------------------------------------------------
--	change status
-----------------------------------------------------------------------
function gm_gscd_tecolysanzouzal_changestatus(_status)
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
	if not GreatSharkCellarDuplication_TecolySanzoUzal or not GreatSharkCellarDuplication_TecolySanzoUzal[room_id] then return end
	GreatSharkCellarDuplication_TecolySanzoUzal[room_id].status = _status
	GreatSharkCellarDuplication_TecolySanzoUzal:debug("status : " .. GreatSharkCellarDuplication_TecolySanzoUzal[room_id].status)
end

-----------------------------------------------------------------------
--	check global data
-----------------------------------------------------------------------
function gm_gscd_tecolysanzouzal_checkglobal()
	if not GreatSharkCellarDuplication_TecolySanzoUzal then return end
	GreatSharkCellarDuplication_TecolySanzoUzal:debug("--------------------------check global")
	for key, value in pairs(GreatSharkCellarDuplication_TecolySanzoUzal) do
		GreatSharkCellarDuplication_TecolySanzoUzal:debug(key .. " : " .. tostring(value))
	end
	GreatSharkCellarDuplication_TecolySanzoUzal:debug("--------------------------check global done")
end

-----------------------------------------------------------------------
--	check local data
-----------------------------------------------------------------------
function gm_gscd_tecolysanzouzal_checklocal()
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
	if not GreatSharkCellarDuplication_TecolySanzoUzal or not GreatSharkCellarDuplication_TecolySanzoUzal[room_id] then return end
	GreatSharkCellarDuplication_TecolySanzoUzal:debug("--------------------------check local : ")
	for key, value in pairs(GreatSharkCellarDuplication_TecolySanzoUzal[room_id]) do
		GreatSharkCellarDuplication_TecolySanzoUzal:debug("[" .. room_id .. "]." .. key .. " : " .. tostring(value))
	end
	GreatSharkCellarDuplication_TecolySanzoUzal:debug("--------------------------check local done")
end

-----------------------------------------------------------------------
--	debug
-----------------------------------------------------------------------
function gm_gscd_tecolysanzouzal_spell_851043()
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
	GreatSharkCellarDuplication_TecolySanzoUzal[room_id].TecolySanzoUzal:say("spell magic")
	GreatSharkCellarDuplication_TecolySanzoUzal[room_id].TecolySanzoUzal:castSpell(GreatSharkCellarDuplication_TecolySanzoUzal[room_id].TecolySanzoUzal, 851043)
	GreatSharkCellarDuplication_TecolySanzoUzal:debug("done")
end
function gm_gscd_tecolysanzouzal_open_all_trigger()
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
	GreatSharkCellarDuplication_TecolySanzoUzal[room_id].step_trigger = true
	GreatSharkCellarDuplication_TecolySanzoUzal[room_id].ai_trigger = true
end