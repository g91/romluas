--�@�Y���ͯS�w����æ^��GUID���@�Ө禡
function WY_Create_an_obj(orgid,x,y,z,direction)
	local obj = CreateObj(orgid,x,y,z,direction,1)
	addToPartition(obj,ReadRoleValue(OwnerID(),EM_RoleValue_RoomID))
	return obj
end

--���o�Y���󪺰��d�ˬd�B����B��m����T
function WY_get_objStatus(obj_GUID)
	local r = 0
	local me = {}
	me.hatecount = HateListCount(obj_GUID)
	me.id = obj_GUID
	me.hatelist = {}
	for n = 1, me.hatecount do
		local pos = n-1
		me.hatelist[pos+1] = HateListInfo(me.id, pos ,EM_HateListInfoType_GItemID)
	end
	me.hp = ReadRoleValue(obj_GUID,EM_RoleValue_HP)/ReadRoleValue(obj_GUID,EM_RoleValue_MaxHP)*100
	me.mp = ReadRoleValue(obj_GUID,EM_RoleValue_MP)
	me.x = ReadRoleValue(OwnerID(),EM_RoleValue_X)
	me.y = ReadRoleValue(OwnerID(),EM_RoleValue_Y)
	me.z = ReadRoleValue(OwnerID(),EM_RoleValue_Z)
	me.direction = ReadRoleValue(OwnerID(),EM_RoleValue_Dir)
	me.time = GetSystime(0)
	me.combating = 0
	me.room_id = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	r = RandRange(1,#me.hatelist)
	me.Rtarget = me.hatelist[r]
	return me
end

--���ͯS�w�d���H������Ʃέt��ƪ��u��
function WY_CoinStyle_Random(start_num, end_num)
	local r = RandRange(start_num, end_num)
	local coin = RandRange(1,2)
	local chance = {1,-1}
	local result_num = r * chance[coin]
	return result_num
end

--�M���Ҧ����󪺴��ի��O
function WY_KILL_ALL_OBJ()
	local table = {}
	table = SearchRangeNPC(OwnerID(),5000)
	for i,v in pairs(table) do
		delobj(v)
		DebugMsg(0,0,"ObjectID "..ReadRoleValue(v,EM_RoleValue_OrgID).." is now deleted")
	end
end

--�إ�boss�έp�ɾ�
function WY_BossTimer()
	local time = {}
	time.BA = 0
	time.total = 0
	time.CD = {}
	time.action = {}
	time.action.a = 0
	time.action.b = 0	
	return time
end

--TEST
function WY_test01()
	local x = 9
	local y = x/4
	local z = y-y%1
	DebugMsg(0,0,"z = "..z)
end 