function ChristineEvent_initialize()
	Christine.Event = Christine.Object:new()
	Christine.Event.class = "Event"
	function Christine.Event:new(_type)
		local inheritor = {}
		inheritor.type = _type
		setmetatable(inheritor, self)
		self.__index = function(object, key)
			return self[key]
		end
		self.__newindex = function(object, key, value)
			rawset(object, key, value)
		end
		return inheritor
	end

	DebugLog(2, "[Christine Class] Event initialized")
end