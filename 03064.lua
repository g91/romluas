function ChristineRoute_initialize()
	Christine.Route = Christine.EventDispatcher:new()
	Christine.Route.class = "Route"

	function Christine.Route:new(_flag_group, _mode)
		if not _flag_group.isInheritorOf or not _flag_group:isInheritorOf("FlagGroup") or _mode and type(_mode) ~= "table" then
			self:error(0, 0, "Christine.Route:new( _flag_group:FlagGroup, [ _mode:table ] )") return false
		end
		local inheritor = {}
		inheritor.route = _flag_group
		inheritor.is_active = false
		inheritor.start_index = 1
		inheritor.current_index = 1
		inheritor.target_index = 1
		inheritor.end_index = #inheritor.route
		if _mode then
		--	���u�O�_���ơGtrue�A�L�����ơFfalse�A�����ơF�Ʀr�A���Ʀ��ơC
			inheritor.is_repeat = _mode.is_repeat or false
		--	�C�����ƼҦ��Gnormal�Binverse
			inheritor.repeat_mode = _mode.repeat_mode or "normal"
		--	�C����ܲ��ʥؼмҦ��Gnormal�Bodd�Beven�B(number)
			inheritor.select_mode = _mode.select_mode or "normal"
		--	�ۭq���ʥؼп�ܾ�
			inheritor.selecter = _mode.selecter
		end
		setmetatable(inheritor, self)
		self.__index = function(_object, _key)
			return self[_key]
		end
		self.__newindex = function(_object, _key, _value)
			rawset(_object, _key, _value)
		end
		return inheritor
	end

	function Christine.Route:setMode(_mode)
		if type(_mode) ~= "table" then
			self:error(0, 0, "Christine.Route:setMode( _mode:table )") return false
		end
		for key, value in pairs(_mode) do
			if key ~= "is_repeat" or
			   key ~= "repeat_mode" or
			   key ~= "select_mode" or
			   key ~= "selecter" then
				self:warning("Christine.Route:setMode( _mode:table ) -> " .. key .. " is not legal option.")
			end
		end
		self.is_repeat = _mode.is_repeat or self.is_repeat
		self.repeat_mode = _mode.repeat_mode or self.repeat_mode
		self.select_mode = _mode.select_mode or self.select_mode
		self.selecter = _mode.selecter or self.selecter
		return self
	end

	function Christine.Route:start(index)
		if self.is_active then return false end
		self.is_active = true
		self.start_index = index or self.start_index
	end

	function Christine.Route:stop()
		if not self.is_active then return false end
		self.is_active = false
	end
end