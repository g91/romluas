--���ͩI�P�ڮɱo��"�I�P��"����BUFF
function WY_Z27_Minions_HuLuClan()
	AddBuff(OwnerID(),624860,0,-1)
end
--120�d�򤺳q�L�ޯ��ˬd��A�C��1�өI�P�ڴN�O���쥻����R10����
function WY_Z27_Minions_HuLuClan_Check()
	local num = ReadRoleValue(OwnerID(),EM_RoleValue_Register10)+1
	WriteRoleValue(OwnerID(),EM_RoleValue_Register10,num)
end
--�԰����ˬd�ؼЬO�_���I�P��
function WY_Z27_Minions_HuLuClan_Count()
	--DebugMsg(0,0,"check hulu")
	if CheckBuff(TargetID(),624860) then
		return true
	else
		return false
	end
end
--�I�P�ڹε��j��BUFF�ϥ�
function WY_Z27_Minions_HuLuClan_Buff()
	local power = ReadRoleValue(OwnerID(),EM_RoleValue_Register10)-1
	if power > 9 then power = 9; end
	CancelBuff(OwnerID(),624861)
	if power ~= -1 then
		AddBuff(OwnerID(),624861, power , -1)
	end
end
--�I�P�ڦP�񦺤`�קK���ƬI���ˬd
function WY_Z27_Minions_HuLuClan_Buff_AntiLoop()
	--DebugMsg(0,0,"check rage")
	if not CheckBuff(TargetID(),624943) then
		return true
	else
		return false
	end
end
--�y����


--�I�P�y��
function WY_Z27_Minions_HuLuClanHunters()
	AddBuff(OwnerID(),624860,0,-1)
end
--���Z�h�ؼ����ˬd
function WY_Z27_Minions_Hungers_RageCheck()
	if CheckBuff(OwnerID(),624865) then
		return true
	else
		return false
	end
end
--�Ǫ��D�ϼ@��
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