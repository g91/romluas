function ChristineArray_initialize()
	Christine.Array = Christine.Object:new()
	Christine.Array.class = "Array"
	function Christine.Array:new(t)
		local inheritor = t or {}
		setmetaArray(inheritor, self)
		self.__index = function(_object, _index)
			return self[_index]
		end
		self.__newindex = function(_object, _index, _value)
			if type(_index) ~= "number" then self:error(1, "array class can accept only number type") end
			rawset(_object, _index, _value)
		end
		inheritor:systemInit()
		return inheritor
	end

	function Christine.Array:print()
		local result = ""
		for key, value in pairs(self) do
			result = result .. tostring(key) .. " = " .. tostring(value) .. ", "
		end
		return string.sub(result, 1, #result - 2)
	end

	function Christine.Array:insert(index, _value)
		if not _value then return false end
		if index then table.insert(self, index, _value)
		else table.insert(self, _value) end
		return self
	end

	function Christine.Array:remove(index)
		if index then table.remove(self, index)
		else table.remove(self) end
	end

	function Christine.Array:descending_sort()
		table.sort(self, function(a, b) return a > b end)
		return self
	end

	function Christine.Array:ascending_sort()
		table.sort(self)
		return self
	end

	function Christine.Array:random_sort()
		local result = Christine.Array:new()
		local random_index = {}
		for index, value in ipairs(self) do
			table.insert(random_index, index)
		end
		for index = 1, #self do
			table.insert(result, self[table.remove(random_index, RandRange(1, #random_index))])
		end
		self = result
		return self
	end

	DebugLog(2, "[Christine Class] Array initialized")
end