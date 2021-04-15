function AddyGUIDMaker_initialize()
	-------------------------------------------------------------
	--	GUIDMaker
	-------------------------------------------------------------
	AddyGlobalGUID = {}
	-- AddyGlobalGUID[ key ].GUID
	-- AddyGlobalGUID[ key ].is_used
	-- AddyGlobalGUID[ key ].last_use
	-------------------------------------------------------------
	AddyGUIDMaker = AddyObject:new()
	AddyGUIDMaker.class = "GUIDMaker"
	function AddyGUIDMaker:produce(_x, _y, _z)
		local _x = _x or 0
		local _y = _y or 0
		local _z = _z or 0
		if not AddyGlobalGUID then
			AddyGlobalGUID = {}
		end

		local _guid = CreateObj(122177, _x, _y, _z, 0, 1)

		table.insert(AddyGlobalGUID, _guid)

		return _guid
	end
	function AddyGUIDMaker:recover(_guid)
		for index, guid in pairs(AddyGlobalGUID) do
			if _guid == guid then
				DelObj(_guid)
				AddyGlobalGUID[index] = nil
				return
			end
		end
	end

	DebugLog(2, "[ROM Class] AddyGUIDMaker initialized")
end