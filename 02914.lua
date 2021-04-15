function AddyTimer_initialize()
	-------------------------------------------------------------
	--	Timer
	-------------------------------------------------------------
	AddyGlobalTimer = {}
	-------------------------------------------------------------
	AddyTimerEvent = AddyEvent:new()
	AddyTimerEvent.class = "TimerEvent"
	AddyTimerEvent.Timer = "AddyTimerEvent_Timer"
	AddyTimerEvent.Complete = "AddyTimerEvent_Complete"
	-------------------------------------------------------------
	AddyTimer = AddyEventDispatcher:new()
	AddyTimer.class = "Timer"
	-- AddyTimer.delay
	-- AddyTimer.time_up
	-- AddyTimer.is_running
	-- AddyTimer.is_complete
	function AddyTimer:new(_delay)
		local _inheritor = {}
		setmetatable(_inheritor, self)
		self.__index = function(_object, _key)
			return self[_key]
		end
		self.__newindex = function(_object, _key, _value)
			rawset(_object, _key, _value)
		end
		_inheritor.is_running = false
		_inheritor.is_complete = false
		_inheritor.delay =_delay or 0
		return _inheritor
	end
	function AddyTimer:start()
		if not self.delay then
			return
		end
		if not AddyGlobalTimer then
			AddyGlobalTimer = {}
		end
		local GUIDMaker = AddyGUIDMaker:new()
		_guid = GUIDMaker:produce()
		self.time_up = GetSystime(0) + self.delay
		self.is_running = true
		AddyGlobalTimer[_guid] = self
		CallPlot(_guid, "AddyTimerLoop", _guid)
	end
	function AddyTimer:stop()
		self.is_running = false
		self:clean()
	end
	function AddyTimer:clean()
		if not self.is_running then
			AddyGlobalTimer[_guid] = nil
		else
			DebugMsg(0, 0, "[ERROR] AddyTimer:clean() : AddyTimer is still running.")
		end
	end
	function AddyTimerLoop(_guid)
		local GUIDMaker = AddyGUIDMaker:new()
		local self = AddyGlobalTimer[_guid]
		while self.is_running do
			Sleep(10)
			if GetSystime(0) == self.time_up then
				self.is_running = false
				self.is_complete = true
				self:clean()
			end
			self:dispatchEvent(AddyTimerEvent:new(AddyTimerEvent.Timer))
		end
		if self.is_complete then
			self:dispatchEvent(AddyTimerEvent:new(AddyTimerEvent.Complete))
		end
		GUIDMaker:recover(_guid)
	end

	DebugLog(2, "[ROM Class] AddyTimer initialized")
end