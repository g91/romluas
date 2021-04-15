--------------------------------------------------------------------------
--	水晶產生劇情
--------------------------------------------------------------------------
function Lua_twist_power_crystal_create()
	if not Global_2013_TwistPower_Setting then Lua_twist_power_setting() end
	Global_2013_TwistPower_Setting.crystal = AddyAlly:new(OwnerID())
	Global_2013_TwistPower_Setting.crystal.movable = false
	Global_2013_TwistPower_Setting.crystal.search_enemy = true
	Global_2013_TwistPower_Setting.crystal.strike_back = true
end
--------------------------------------------------------------------------
--	2013 巧藝節 扭轉動力 物件類別		P.S. 很可怕不要看
--------------------------------------------------------------------------
function Lua_twist_power_class_initialize()

	--------------------------------------------------------------------------
	-- 能原裝置基座物件
	--------------------------------------------------------------------------

	Class_TwistPowerSourceBase = AddyNpc:new()
	Class_TwistPowerSourceBase.class = "Class_TwistPowerSourceBase"

	--------------------------------------------------------------------------
	-- 能原裝置基座的create方法
	--------------------------------------------------------------------------
	function Class_TwistPowerSourceBase:create(_x, _y, _z)
		local _x = _x or 0
		local _y = _y or 0
		local _z = _z or 0
		-- 創造能原裝置基座
		self.GUID = CreateObj(121109, _x, _y, _z, 0, 1)
		-- 寫入上次使用時間
		self.last_time = GetSystime(0)
		-- 設定觸碰劇情
		SetPlot(self.GUID, "collision", "Class_TwistPowerSourceBaseTouch", 10)
		self:dispatchEvent(AddyRoleEvent:new(AddyRoleEvent.Create))
	end

	--------------------------------------------------------------------------
	-- 能原裝置基座的delete()方法
	--------------------------------------------------------------------------
	function Class_TwistPowerSourceBase:delete()
		DelObj(self.GUID)
		-- 如果有能源球也一併刪除
		if self.source then
			DelObj(self.source.GUID)
		end
		self:dispatchEvent(AddyRoleEvent:new(AddyRoleEvent.Delete))
	end

	--------------------------------------------------------------------------
	-- 能原裝置基座的addToPartition()方法
	--------------------------------------------------------------------------
	function Class_TwistPowerSourceBase:addToPartition(_room_id)
		local _room_id = _room_id or 0
		AddToPartition(self.GUID, _room_id)
		-- 如果有能源球一併加入
		if self.source then
			AddToPartition(self.source.GUID, _room_id)
		end
		self:dispatchEvent(AddyRoleEvent:new(AddyRoleEvent.AddToPartition))
	end

	--------------------------------------------------------------------------
	-- 能原裝置基座的delFromPartition()方法
	--------------------------------------------------------------------------
	function Class_TwistPowerSourceBase:delFromPartition()
		DelFromPartition(self.GUID)
		-- 如果有能源球一併移除
		if self.source then
			DelFromPartition(self.source.GUID)
		end
		self:dispatchEvent(AddyRoleEvent:new(AddyRoleEvent.DelFromPartition))
	end

	--------------------------------------------------------------------------
	-- 能原裝置基座的produce()方法，用來生產能量球
	--------------------------------------------------------------------------
	function Class_TwistPowerSourceBase:produce(_type)
		if self.source then
			self.source:delete()
			self.is_empty = true
		end
		-- 如果沒有帶入type隨機選一種
		local _type = _type or RandRange(121991, 121992)
		local _type_name
		-- 設定種類
		if _type == "booster" or _type == 121991 then
			_type = 121991
			_type_name = "booster"
		elseif _type == "cooler" or _type == 121992 then
			_type = 121992
			_type_name = "cooler"
		end

		-- 
		self.is_empty = false
		-- 新建Npc
		self.source = AddyNpc:new()
		--
		self.source:create(_type, self.x, self.y + 26, self.z)
		-- 記錄原始高度
		self.source.origin_y = self.source.y
		-- 記錄能源種類
		self.source.source_type = _type_name
		-- 無重力
		self.source.gravity = false
		-- 不可選
		self.source.mark = false
		-- 加入分割區
		self.source:AddToPartition()
		-- 緩速
		self.source:addBuff(624177)
		-- 開始飄浮
		self.source:move(self.source.x, self.source.y + 12, self.source.z)
		-- 漂浮劇情
		CallPlot(self.source.GUID, "Class_TwistPowerSourceBaseFloat")
	end

	--------------------------------------------------------------------------
	-- 能源的漂浮劇情
	--------------------------------------------------------------------------
	function Class_TwistPowerSourceBaseFloat()
		-- 
		local source_base
		-- 從全域Global_2013_TwistPower裡尋找自己
		for index, _source_base in pairs(Global_2013_TwistPower.source_base) do
			if _source_base.source and _source_base.source.GUID == OwnerID() then
				source_base = _source_base
				break
			end
		end
		if not source_base then
			return 
		end
		-- 只要能源基座還有能源球就持續移動
		while CheckID(OwnerID()) do
			if source_base.source then
				if source_base.source.y > source_base.source.origin_y then
					source_base.source:move(source_base.source.x, source_base.source.origin_y - 12, source_base.source.z)
				else
					source_base.source:move(source_base.source.x, source_base.source.origin_y + 12, source_base.source.z)
				end
			end
			Sleep(30)
		end
	end

	--------------------------------------------------------------------------
	-- 能源基座的觸碰劇情
	--------------------------------------------------------------------------
	function Class_TwistPowerSourceBaseTouch()
		-- 觸碰者
		local player = AddyPlayer:new(OwnerID())		
		local is_game_player = false
		-- 從Global_2013_TwistPower.players裡找出觸碰的玩家
		for index, player in pairs(Global_2013_TwistPower.players) do
			if OwnerID() == player.GUID then
				is_game_player = true
				break
			end
		end
		-- 如果不是遊戲玩家返回
		if not is_game_player then
			-- 非母體驅動者，無法獲取符文能量
			player:scriptMessage(player, "[SC_2013TWISTPOWER_121397_26]", 1)
			return
		end
		-- 能源基座
		local target
		-- 能源等級
		local level
		-- 尋找被觸碰的能源基座
		for index, source_base in pairs(Global_2013_TwistPower.source_base) do
			if source_base.GUID == TargetID() then
				target = source_base
				break
			end
		end
		if target.is_empty then
			return
		end
		-- 如果該基座有能源就計算能源等級
		if target.source then
			-- 有能源清除
			if player.buff[501308] then player:cancelBuff(501308) end
			if player.buff[501309] then player:cancelBuff(501309) end
			if player.buff[507824] then player:cancelBuff(507824) end
			if player.buff[507825] then player:cancelBuff(507825) end
			if target.source.y <= target.source.origin_y + 3 and target.source.y >= target.source.origin_y - 3 then
				level = 3
			elseif target.source.y <= target.source.origin_y + 9 and target.source.y >= target.source.origin_y + 3 then
				level = 2
			elseif target.source.y >= target.source.origin_y + 9 then
				level = 2
			elseif target.source.y <= target.source.origin_y - 3 and target.source.y >= target.source.origin_y - 9 then
				level = 1
			elseif target.source.y <= target.source.origin_y -9 then
				level = 1
			else
				level = 1
			end
			-- 根據能源種類給予buff
			if target.source.ORGID == 121991 then
				player:addBuff(501308, level - 1)
			elseif target.source.ORGID == 121992 then
				player:addBuff(501309, level - 1)
			end
			if target.source.ORGID == 121991 then			
				target:scriptMessage(player, "[SC_2013TWISTPOWER_121397_32]" .. level .. "[SC_2013TWISTPOWER_121397_25]", 0)
			elseif target.source.ORGID == 121992 then
				target:scriptMessage(player, "[SC_2013TWISTPOWER_121397_32]" .. level .. "[SC_2013TWISTPOWER_121397_25]", 0)
			end			
			-- 刪除能源
			target.source:delete()
			target.source = nil
			-- 無能元標繼
			target.is_empty = true
			-- 記錄最後使用時間
			target.last_time = GetSystime(0)
		else
			player:scriptMessage(player, "[SC_2013TWISTPOWER_121397_31]", 1)
		end
	end
end