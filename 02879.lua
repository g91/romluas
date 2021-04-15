function LuaTest_table()--測試lua  table
--[[
	local mt={}
	mt.a=function () DebugMsg(0, 0, 1); end
	mt.b=2
	mt.__index=function (v1,v2) DebugMsg(0, 0, "__index".."v1="..type(v1).."  v2="..v2 ); end
	mt.__newindex=function (v1,v2,v3)  DebugMsg(0, 0, "__newindex".."v1="..type(v1).."  v2="..v2.."  v3="..v3 ); end
	mt.__call=function(v1,v2,v3) DebugMsg(0, 0, "__call".."v1="..type(v1).."  v2="..v2.."  v3="..v3 ); end
	local newtable={};
	setmetatable(newtable, mt);
	local a=newtable.b;
	DebugMsg(0, 0, "======");
	newtable.c="newtable.c";
	DebugMsg(0, 0, "======");
	newtable("call1",1);
	DebugMsg(0, 0, "======");
--]]
	--資料設定
	local DB={};
	--讀取值觸發的事件
	DB.__index=	function(who, _call_arg)
				if _call_arg=="hp" then
					return ReadRoleValue(who.guid, EM_RoleValue_HP);
				end
			end
	--設定值觸發的事件
	DB.__newindex=	function (who, _call_arg, new_value)
				if _call_arg=="hp" then
					WriteRoleValue(who.guid, EM_RoleValue_HP, new_value);
				end
			end
	--使用function呼叫的事件
	DB.__call=	function ()
				DebugMsg(0, 0, "What are you want to know");
			end
	--玩家資料
	local player={};
	player.guid=OwnerID();
	setmetatable(player, DB);
	player.hp=1;
	Say(user, "I only have "..player.hp.." hp, help me!!")
	player();
end
--[[
a={ f=1 }

a.g(a);
a.f=1

a:g()
self.f=1

--]]
function lua_spy_InitFromFunc()--從function產生物件
	GlobalSpyRecord=GlobalSpyRecord or {};
	local player=OwnerID();
	local zone=ReadRoleValue(player, EM_RoleValue_ZoneID);
	local room=ReadRoleValue(player, EM_RoleValue_RoomID);
	GlobalSpyRecord[zone]=GlobalSpyRecord[zone] or {};
	local x,y,z,dir=DW_Location(player);
	local IsEmpty=false;
	if GlobalSpyRecord[zone][room]==nil then
		IsEmpty=true;
	else
		if CheckID(GlobalSpyRecord[zone][room])==false then
			IsEmpty=true;
		end
	end
	if IsEmpty==true then
		local n=CreateObj(110987, x,y,z,dir, 1);
		GlobalSpyRecord[zone][room]=n;
		AddToPartition(n, room);
		BeginPlot(n, "lua_spy_npcTrack", 0);
		DebugLog(2, "room:"..room.."begin to spy");
	end
end
function lua_spy_npcTrack()--定期回報NPC資料
	local spy=OwnerID();
	local room=ReadRoleValue(OwnerID(), EM_RoleValue_RoomID);
	SetModeEx(spy, EM_SetModeType_Show, false);
	SetModeEx(spy, EM_SetModeType_Gravity, false);
	SetModeEx(spy, EM_SetModeType_Mark, false);
	SetModeEx(spy, EM_SetModeType_ShowRoleHead, false);
	SetPos(spy, 0,0,0,0);
	sleep(100);
	
	while true do
		DebugLog(2, "spy"..spy.." report, room:"..room..", Date:"..GetSystime(4))
		local num=SetSearchAllNPC(room);
		local npc=0;
		for i=1, num, 1 do
			npc=GetSearchResult();
			if ReadRoleValue(npc, EM_RoleValue_SEX)==3 then--王級精英
				--屬於要追蹤的對象
				local org=ReadRoleValue(npc, EM_RoleValue_OrgID);
				if ReadRoleValue(npc, EM_RoleValue_IsDead)==1 then
					local x,y,z,dir=DW_Location(npc);
					DebugLog(2, "boss_org:"..org..", x:"..x..", y:"..y..", z:"..z.."  already die.")
				else
					local x,y,z,dir=DW_Location(npc);
					DebugLog(2, "boss_org:"..org..", x:"..x..", y:"..y..", z:"..z)
				end
			end
		end
		lua_spy_scan000();
		sleep(6000);
	end
end
function lua_spy_scan000()--檢查0,0,0,附近的物件
	local spy=OwnerID();
	local room=ReadRoleValue(spy, EM_RoleValue_RoomID);
	local tNPC=SearchRangeNPC(spy, 100);
	if #tNPC>1 then
		DebugLog(2, (#tNPC-1).." item on pos 0 0 0")
	else
		return;
	end
	for i=0, #tNPC, 1 do
		if tNPC[i]~=spy then
			local x,y,z,dir=DW_Location(tNPC[i]);
			local org=ReadRoleValue(tNPC[i], EM_RoleValue_OrgID);
			DebugLog(2, "org:"..org..", x:"..x..", y:"..y..", z:"..z);
		end
	end
end