--產生呼嚕族時得到"呼嚕族"分類BUFF
function WY_Z27_Minions_HuLuClan()
	AddBuff(OwnerID(),624860,0,-1)
end
--120範圍內通過技能檢查後，每有1個呼嚕族就記錄到本身的R10之中
function WY_Z27_Minions_HuLuClan_Check()
	local num = ReadRoleValue(OwnerID(),EM_RoleValue_Register10)+1
	WriteRoleValue(OwnerID(),EM_RoleValue_Register10,num)
end
--戰鬥中檢查目標是否為呼嚕族
function WY_Z27_Minions_HuLuClan_Count()
	--DebugMsg(0,0,"check hulu")
	if CheckBuff(TargetID(),624860) then
		return true
	else
		return false
	end
end
--呼嚕族團結強化BUFF使用
function WY_Z27_Minions_HuLuClan_Buff()
	local power = ReadRoleValue(OwnerID(),EM_RoleValue_Register10)-1
	if power > 9 then power = 9; end
	CancelBuff(OwnerID(),624861)
	if power ~= -1 then
		AddBuff(OwnerID(),624861, power , -1)
	end
end
--呼嚕族同伴死亡避免重複施放檢查
function WY_Z27_Minions_HuLuClan_Buff_AntiLoop()
	--DebugMsg(0,0,"check rage")
	if not CheckBuff(TargetID(),624943) then
		return true
	else
		return false
	end
end
--獵手類


--呼嚕獵手
function WY_Z27_Minions_HuLuClanHunters()
	AddBuff(OwnerID(),624860,0,-1)
end
--兇蠻愣喀憤怒檢查
function WY_Z27_Minions_Hungers_RageCheck()
	if CheckBuff(OwnerID(),624865) then
		return true
	else
		return false
	end
end
--怪物求救劇情
function WY_Z27_Minions_MonsterCall()
	local MonsterList = {107923,108107,108109,107918}
	local My_TypeList = {108106,108108,107917}
	local type = 0
	local r_M = RandRange(15,35)
	local r_N = {-1,1}
	local r = RandRange(1,2)
	local x , z, dir = ReadRoleValue(OwnerID(),EM_RoleValue_X), ReadRoleValue(OwnerID(),EM_RoleValue_Z), ReadRoleValue(OwnerID(), EM_RoleValue_Dir)
	local y = GetHeight(x, 0 , z)
	local My_Type = ReadRoleValue(OwnerID(), EM_RoleValue_OrgID)
	local Obj = 0
	for i,v in pairs(My_TypeList) do
		if My_Type == v then
			if i == 1 then type = RandRange(1,2)
			elseif i == 2 then type = 3
			elseif i == 3 then type = 4
			end
		end
	end
	Obj = CreateObj(MonsterList[type], x+r_M*r_N[r], y, z+r_M*r_N[r], dir, 1)
	AddToPartition(Obj, ReadRoleValue(OwnerID(),EM_RoleValue_RoomID) )
	WriteRoleValue(Obj,EM_RoleValue_LiveTime,25)
end

function WY_POISION_CHECK()
	if not CheckBuff(TargetID(),624852) then return true; else return false; end
end

function lua_bico_Z27_SpecialMOB_AESkill()
	SetPlot( OwnerID(), "range", "lua_bico_Z27_851449_AESkill", 20 )
end

function lua_bico_Z27_851449_AESkill()
	if ReadRoleValue( OwnerID() , EM_RoleValue_IsPlayer ) == 1 then
	SysCastSpellLv( TargetID(), TargetID(), 851449, 0 )
	BeginPlot(TargetID(),"lua_bico_Z27_851449_AESkill_2",5)
	end
	
end

function lua_bico_Z27_851449_AESkill_2()
	KillID( OwnerID() , OwnerID() )
end