function ChristineObject_initialize()
	Christine = {}

	Christine.Object = {}
	Christine.Object.class = "Object"
	function Christine.Object:new()
		local inheritor = {}
		setmetatable(inheritor, self)
		self.__index = function(_object, _key)
			return self[_key]
		end
		self.__newindex = function(_object, _key, _value)
			rawset(_object, _key, _value)
		end
--		if inheritor.initialize then inheritor:initialize() end
		inheritor:systemInit()
		return inheritor
	end

	function Christine.Object:systemInit()
		if getmetatable(self) then getmetatable(self):systemInit() end
		if self.initialize then self:initialize() end
	end

	function Christine.Object:isInheritorOf(_class)
		if self.class == _class then return self end
		if getmetatable(self) then
			if getmetatable(self).class == _class then return self
			else return getmetatable(self):isInheritorOf(_class) end
		else return false end
	end

	function Christine.Object:copy()
		local result = {}
		for orig_key, orig_value in next, self, nil do result[orig_key] = copy(orig_value) end
		setmetatable(result, getmetatable(self))
		return result
	end

	function Christine.Object:error(_type, _message)
		if not _type then return false
		elseif _type == 1 then _type = "arguments error"
		elseif _type == 2 then _type = "request error" end
--		DebugMsg(0, 0, "[Christine Class] ERROR : " .. _type .. " >> " .. _message)
--		DebugLog(2, "[Christine Class] ERROR : " .. _type .. " >> " .. _message)
		error("[Christine Class] ERROR : " .. _type .. " >> " .. _message, 3)
		return self
	end

	function Christine.Object:warning(_message)
		DebugMsg(0, 0, "[Christine Class] WARNING  : " .. _message)
		return self
	end

	function Christine.Object:sleep(_delay)
		Sleep((_delay or 1) * 10)
		return self
	end

	function Christine.Object:toString()
		local result = ""
		for key, value in pairs(self) do
			result = result .. tostring(key) .. " => " .. tostring(value) .. ", "
		end
		return string.sub(result, 1, -3)
	end

	DebugLog(2, "[Christine Class] Object initialized")
end