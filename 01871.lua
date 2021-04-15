function LuaI_209577(style)
	local WeaponGroup = { 210511 , 210512 , 210513 , 210514 , 210515 , 210516 }
	local weapon
	local EquipCheck = 1	--

	for i=1,table.getn(WeaponGroup) do
		if CountItem(OwnerID(),WeaponGroup[i]) >= 1 then
			weapon = WeaponGroup[i]
			if CountbodyItem(OwnerID(),WeaponGroup[i]) >= 1 then
				EquipCheck = 0	--表示在背包裡面
			else
				EquipCheck = 2	--表示在裝備欄
			end
			break
		end
	end

	if style == "check" then
		if EquipCheck == 1 then
			ScriptMessage(OwnerID(),OwnerID(),1,"[LUAI_209577_STRING01]",0)	--u have no weapon.
			return FALSE
		elseif EquipCheck == 0 then
			ScriptMessage(OwnerID(),OwnerID(),1,"[LUAI_209577_STRING00]",0)	--u most equip ur weapon first!!
			return FALSE
		elseif EquipCheck == 2 then
			return TRUE
		end
	elseif style == "use" then
		ScriptMessage(OwnerID(),OwnerID(),1,"[LUAI_209577_STRING02]",C_SYSTEM)
		SetItemInfo( OwnerID() , EM_ItemPacketType_EQ , 15 , EM_ItemValueType_Level , 8 )
	end
end