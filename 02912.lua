function AddyBattleListener_initialize()
	-------------------------------------------------------------
	--	BattleListener
	-------------------------------------------------------------
	AddyBattleListener = AddyObject:new()
	AddyBattleListener.class = "BattleListener"
	-- 開始戰鬥監聽器
	function AddyBattleListener:start()
		if not self.list then self.list = {} end
		self.current_time = GetSystime(0)
		if self.is_active then
			self.delay = self.current_time - self.last_time
			self:loop()
			self.duration_time = self.current_time - self.start_time
		else
			self.start_time = GetSystime(0)
			self.is_active = true
			self.duration_time = 0
		end

		self.last_time = GetSystime(0)
	end
	function AddyBattleListener:loop()
	--	while self.is_active do
	--		self.current_time = GetSystime(0)
			for index, object in pairs(self.list) do
				if object.class == "Boss" then
					if object.skill then
						for name, skill in pairs(object.skill) do
							if not skill.is_lock then
								if not skill.ready then
									skill:colddown(self.delay)
								else
									if skill.inactive then
										skill:inactive(object)
									end
								end
							end
						end
					end
				end
			end
	--		Sleep(self.delay)
	--	end
	end
	-- 停止戰鬥監聽器
	function AddyBattleListener:stop()
		if self.is_active then
			self.end_time = GetSystime(0)
			self.is_active = false
		end
	end
	-- 加入監聽對象
	function AddyBattleListener:add(_object)
		if _object.class == nil then
			DebugMsg(0, 0, "[ERROR] type error. AddyBattleListener:add( _object:Boss )")
			return
		end
		self.list = self.list or {}
		 for index, object in pairs(self.list) do
			if object == _object then return end
		end
		table.insert(self.list, _object)
	end
	-- 移除監聽對象
	function AddyBattleListener:remove(_object)
		if _object.class == nil then
			DebugMsg(0, 0, "[ERROR] type error. AddyBattleListener:add( _object:Boss )")
			return
		end
		for index, object in pairs(self.list) do
			if object == _object then
				table.remove(self.list, index)
			end
		end
	end

	DebugLog(2, "[ROM Class] AddyBattleListener initialized")
end