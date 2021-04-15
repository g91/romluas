--濃縮產生特定物件並回傳GUID為一個函式
function WY_Create_an_obj(orgid,x,y,z,direction)
	local obj = CreateObj(orgid,x,y,z,direction,1)
	addToPartition(obj,ReadRoleValue(OwnerID(),EM_RoleValue_RoomID))
	return obj
end

--取得某物件的健康檢查、仇恨、位置等資訊
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

--產生特定範圍內隨機正整數或負整數的工具
function WY_CoinStyle_Random(start_num, end_num)
	local r = RandRange(start_num, end_num)
	local coin = RandRange(1,2)
	local chance = {1,-1}
	local result_num = r * chance[coin]
	return result_num
end

--清除所有物件的測試指令
function WY_KILL_ALL_OBJ()
	local table = {}
	table = SearchRangeNPC(OwnerID(),5000)
	for i,v in pairs(table) do
		delobj(v)
		DebugMsg(0,0,"ObjectID "..ReadRoleValue(v,EM_RoleValue_OrgID).." is now deleted")
	end
end

--建立boss用計時器
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