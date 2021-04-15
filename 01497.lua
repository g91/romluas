

function LuaS_113358_0()
	AddBuff(OwnerID(),504112,1,900)
	CastSpell(OwnerID(),OwnerID(),493812)
	local DiningTable = Lua_CreateObjByDir( OwnerID() , 113358 , 25 , 0)
	AddToPartition(DiningTable,ReadRoleValue(OwnerID(),EM_RoleValue_RoomID))
	SetPlot(DiningTable,"touch","LuaS_113358_2",50)
	BeginPlot(DiningTable,"LuaS_113358_1",0)
end

function LuaS_113358_1()
	local Sec = 0
	while true do
		sleep(10)
		Sec = Sec + 1
		if	Sec > 120 then
			DelObj(OwnerID())
		end
		if	ReadRoleValue(OwnerID(),EM_RoleValue_PID)>40	then
			DelObj(OwnerID())
		end
	end
end

function LuaS_113358_2()
	local SpellID = 493801
	local SpellLV = 3
--是否進入戰鬥
--是否在施法
	if	ReadRoleValue(OwnerID(),EM_RoleValue_IsAttackMode) == 0	and
		ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID ) == 0 then
--累計次數
		WriteRoleValue(TargetID(),EM_RoleValue_PID,	ReadRoleValue(TargetID(),EM_RoleValue_PID)+1	)
		CastSpellLv(OwnerID(),OwnerID(),SpellID,SpellLV)
	end
end


function LuaS_113358_3() --掛在檢查
	if	CheckBuff(OwnerID(),504112)	then
		ScriptMessage(OwnerID(),OwnerID(),1,"[SC_101614_2]",0)
		return false
	end
	if	ReadRoleValue(OwnerID(),EM_RoleValue_ZoneID)==400	then
		ScriptMessage(OwnerID(),OwnerID(),1,"[SC_CANTHOME]",0)
		return false
	end
	return true
end


function LuaS_113359_0()
	AddBuff(OwnerID(),504112,1,900)
	CastSpell(OwnerID(),OwnerID(),493812)
	local DiningTable = Lua_CreateObjByDir( OwnerID() , 113359 , 25 , 0)
	AddToPartition(DiningTable,ReadRoleValue(OwnerID(),EM_RoleValue_RoomID))
	SetPlot(DiningTable,"touch","LuaS_113359_1",50)
	BeginPlot(DiningTable,"LuaS_113358_1",0)
end


function LuaS_113359_1()
	local SpellID = 493802
	local SpellLV = 3
--是否進入戰鬥
--是否在施法
	if	ReadRoleValue(OwnerID(),EM_RoleValue_IsAttackMode) == 0	and
		ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID ) == 0 then
--累計次數
		WriteRoleValue(TargetID(),EM_RoleValue_PID,	ReadRoleValue(TargetID(),EM_RoleValue_PID)+1	)
		CastSpellLv(OwnerID(),OwnerID(),SpellID,SpellLV)
	end
end

function LuaS_113359_2() --掛在檢查
	if	CheckBuff(OwnerID(),504112)	then
		ScriptMessage(OwnerID(),OwnerID(),1,"[SC_101614_2]",0)
		return false
	end
	if	ReadRoleValue(OwnerID(),EM_RoleValue_ZoneID)==400	then
		ScriptMessage(OwnerID(),OwnerID(),1,"[SC_CANTHOME]",0)
		return false
	end
	return true
end