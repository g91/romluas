function ChristineEventDispatcher_initialize()
	Christine.EventDispatcher = Christine.Object:new()
	Christine.EventDispatcher.class = "EventDispatcher"
	function Christine.EventDispatcher:addEventListener(_type, _callback, _log)
		local _log = _log or false
		if type(_type) ~= "string" then self:error(1, "Christine.EventDispatcher:addEventListener( _type:string , _callback:function , _log:boolean )") return false end
		if type(_callback) ~= "function" then self:error(1, "Christine.EventDispatcher:addEventListener( _type:string , _callback:function , _log:boolean )") return false end
		if type(_log) ~= "boolean" then self:error(1, "Christine.EventDispatcher:addEventListener( _type:string , _callback:function , _log:boolean )") return false end
		self.event = self.event or {}
		if self.event[_type] then self:warning("recover event listener : " .. _type) end
		self.event[_type] = {
			type = _type,
			callback = _callback,
			log = _log
		}
		return self
	end
	function Christine.EventDispatcher:removeEventListener(_type)
		if type(_type) ~= "string" then self:error(1, "Christine.EventDispatcher:removeEventListener( _type:string )") return false end
		if not self.event then return false end
		if not self.event[_type] then return false end
		self.event[_type] = nil
		return self
	end
	function Christine.EventDispatcher:removeAllEventListener()
		if not self.event then return false end
		self.event = nil
		return self
	end
	function Christine.EventDispatcher:dispatchEvent(_event)
		if not _event or not _event.isInheritorOf or not _event:isInheritorOf("Event") then self:error(1, "Christine.EventDispatcher:dispatchEvent( _event:Event )") return false end
		if not self.event then return false end
		if not self.event[_event.type] then return false end
		if self.event[_event.type].log then Debuglog(2, "[Christine Class] EVENT : " .. _event.type .. " >> " .. self.GUID or self.class) end
		_event.target = self
		pcall(self.event[_event.type].callback, _event)
		return self
	end

	DebugLog(2, "[Christine Class] EventDispatcher initialized")
end