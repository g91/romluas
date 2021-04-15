--------------------------------------------------------------------------
--	�������ͼ@��
--------------------------------------------------------------------------
function Lua_twist_power_crystal_create()
	if not Global_2013_TwistPower_Setting then Lua_twist_power_setting() end
	Global_2013_TwistPower_Setting.crystal = AddyAlly:new(OwnerID())
	Global_2013_TwistPower_Setting.crystal.movable = false
	Global_2013_TwistPower_Setting.crystal.search_enemy = true
	Global_2013_TwistPower_Setting.crystal.strike_back = true
end
--------------------------------------------------------------------------
--	2013 �����` ����ʤO �������O		P.S. �ܥi�Ȥ��n��
--------------------------------------------------------------------------
function Lua_twist_power_class_initialize()

	--------------------------------------------------------------------------
	-- ���˸m��y����
	--------------------------------------------------------------------------

	Class_TwistPowerSourceBase = AddyNpc:new()
	Class_TwistPowerSourceBase.class = "Class_TwistPowerSourceBase"

	--------------------------------------------------------------------------
	-- ���˸m��y��create��k
	--------------------------------------------------------------------------
	function Class_TwistPowerSourceBase:create(_x, _y, _z)
		local _x = _x or 0
		local _y = _y or 0
		local _z = _z or 0
		-- �гy���˸m��y
		self.GUID = CreateObj(121109, _x, _y, _z, 0, 1)
		-- �g�J�W���ϥήɶ�
		self.last_time = GetSystime(0)
		-- �]�wĲ�I�@��
		SetPlot(self.GUID, "collision", "Class_TwistPowerSourceBaseTouch", 10)
		self:dispatchEvent(AddyRoleEvent:new(AddyRoleEvent.Create))
	end

	--------------------------------------------------------------------------
	-- ���˸m��y��delete()��k
	--------------------------------------------------------------------------
	function Class_TwistPowerSourceBase:delete()
		DelObj(self.GUID)
		-- �p�G���෽�y�]�@�֧R��
		if self.source then
			DelObj(self.source.GUID)
		end
		self:dispatchEvent(AddyRoleEvent:new(AddyRoleEvent.Delete))
	end

	--------------------------------------------------------------------------
	-- ���˸m��y��addToPartition()��k
	--------------------------------------------------------------------------
	function Class_TwistPowerSourceBase:addToPartition(_room_id)
		local _room_id = _room_id or 0
		AddToPartition(self.GUID, _room_id)
		-- �p�G���෽�y�@�֥[�J
		if self.source then
			AddToPartition(self.source.GUID, _room_id)
		end
		self:dispatchEvent(AddyRoleEvent:new(AddyRoleEvent.AddToPartition))
	end

	--------------------------------------------------------------------------
	-- ���˸m��y��delFromPartition()��k
	--------------------------------------------------------------------------
	function Class_TwistPowerSourceBase:delFromPartition()
		DelFromPartition(self.GUID)
		-- �p�G���෽�y�@�ֲ���
		if self.source then
			DelFromPartition(self.source.GUID)
		end
		self:dispatchEvent(AddyRoleEvent:new(AddyRoleEvent.DelFromPartition))
	end

	--------------------------------------------------------------------------
	-- ���˸m��y��produce()��k�A�ΨӥͲ���q�y
	--------------------------------------------------------------------------
	function Class_TwistPowerSourceBase:produce(_type)
		if self.source then
			self.source:delete()
			self.is_empty = true
		end
		-- �p�G�S���a�Jtype�H����@��
		local _type = _type or RandRange(121991, 121992)
		local _type_name
		-- �]�w����
		if _type == "booster" or _type == 121991 then
			_type = 121991
			_type_name = "booster"
		elseif _type == "cooler" or _type == 121992 then
			_type = 121992
			_type_name = "cooler"
		end

		-- 
		self.is_empty = false
		-- �s��Npc
		self.source = AddyNpc:new()
		--
		self.source:create(_type, self.x, self.y + 26, self.z)
		-- �O����l����
		self.source.origin_y = self.source.y
		-- �O���෽����
		self.source.source_type = _type_name
		-- �L���O
		self.source.gravity = false
		-- ���i��
		self.source.mark = false
		-- �[�J���ΰ�
		self.source:AddToPartition()
		-- �w�t
		self.source:addBuff(624177)
		-- �}�l�ƯB
		self.source:move(self.source.x, self.source.y + 12, self.source.z)
		-- �}�B�@��
		CallPlot(self.source.GUID, "Class_TwistPowerSourceBaseFloat")
	end

	--------------------------------------------------------------------------
	-- �෽���}�B�@��
	--------------------------------------------------------------------------
	function Class_TwistPowerSourceBaseFloat()
		-- 
		local source_base
		-- �q����Global_2013_TwistPower�̴M��ۤv
		for index, _source_base in pairs(Global_2013_TwistPower.source_base) do
			if _source_base.source and _source_base.source.GUID == OwnerID() then
				source_base = _source_base
				break
			end
		end
		if not source_base then
			return 
		end
		-- �u�n�෽��y�٦��෽�y�N���򲾰�
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
	-- �෽��y��Ĳ�I�@��
	--------------------------------------------------------------------------
	function Class_TwistPowerSourceBaseTouch()
		-- Ĳ�I��
		local player = AddyPlayer:new(OwnerID())		
		local is_game_player = false
		-- �qGlobal_2013_TwistPower.players�̧�XĲ�I�����a
		for index, player in pairs(Global_2013_TwistPower.players) do
			if OwnerID() == player.GUID then
				is_game_player = true
				break
			end
		end
		-- �p�G���O�C�����a��^
		if not is_game_player then
			-- �D�����X�ʪ̡A�L�k����Ť��q
			player:scriptMessage(player, "[SC_2013TWISTPOWER_121397_26]", 1)
			return
		end
		-- �෽��y
		local target
		-- �෽����
		local level
		-- �M��QĲ�I���෽��y
		for index, source_base in pairs(Global_2013_TwistPower.source_base) do
			if source_base.GUID == TargetID() then
				target = source_base
				break
			end
		end
		if target.is_empty then
			return
		end
		-- �p�G�Ӱ�y���෽�N�p��෽����
		if target.source then
			-- ���෽�M��
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
			-- �ھگ෽��������buff
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
			-- �R���෽
			target.source:delete()
			target.source = nil
			-- �L�स���~
			target.is_empty = true
			-- �O���̫�ϥήɶ�
			target.last_time = GetSystime(0)
		else
			player:scriptMessage(player, "[SC_2013TWISTPOWER_121397_31]", 1)
		end
	end
end