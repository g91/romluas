function AddyEventDispatcher_initialize()
	-------------------------------------------------------------
	--	EventDispatcher
	-------------------------------------------------------------
	AddyEventDispatcher = AddyObject:new()
	AddyEventDispatcher.class = "EventDispatcher"
	function AddyEventDispatcher:addEventListener(_type, _callback, _log)
		local _log = _log or false
		if type(_type) ~= "string" or type(_callback) ~= "function" or type(_log) ~= "boolean" then
			DebugMsg(0, 0, "[ERROR] type error. AddyEventDispatcher:addEventListener( _type:string, _callback:function, _log:boolean)")
			return
		end
		if not self.event then self.event = {} end
		self.event[_type] = { type = _type, callback = _callback, log = _log or false}
--		table.insert(self.event, { type = _type, callback = _callback, log = _log or false})
		return true
	end
	function AddyEventDispatcher:removeEventListener(_type)
		local _log = _log or false
		if not _type then
			DebugMsg(0, 0, "[ERROR] type error. AddyEventDispatcher:removeEventListener( _type:string )")
			return
		end
		if not self.event then return false end
		if not self.event[_type] then return false end
--		for index, event in pairs(self.event) do
--			if event.type == _type then
--				table.remove(self.event, index)
--				return true
--			end
--		end
		self.event[_type] = nil
		return true
	end
	function AddyEventDispatcher:removeAllEventListener()
		self.event = nil
	end
	function AddyEventDispatcher:dispatchEvent(_event)
		if not self.event or not self.event[_event.type] then return false end
		if self.event[_event.type].log then DebugLog(2, "[event] target : " .. self.GUID .. ", type : " .. self.event[_event.type].type) end
		_event.target = self
		pcall(self.event[_event.type].callback, _event)
		return true
--		if self.event then
--			local dispatch_event = {}
--			for index, event in pairs(self.event) do
--				if event.type == _event.type then
--					table.insert(dispatch_event, event)
--				end
--			end
--			for index, event in pairs(dispatch_event) do
--				if event.log then DebugLog(2, "[event] target : " .. self.GUID .. ", type : " .. _event.type) end
--				_event.target = self
--				pcall(event.callback, _event)
--				return true
--			end
--		end
	end

	DebugLog(2, "[ROM Class] AddyEventDispatcher initialized")
end