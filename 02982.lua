--[[備用文件
	if	not	lua_26in_partitionCHECK(bancremz)	then
		AddToPartition(bancremz, room);
	end
	if	not	lua_26in_partitionCHECK(morek)		then
		AddToPartition(morek, room);
	end
	if	not	lua_26in_partitionCHECK(jill)		then
		AddToPartition(jill, room);
	end
	if	not	lua_26in_partitionCHECK(comgas)		then
		AddToPartition(comgas, room);
	end
	if	not	lua_26in_partitionCHECK(kalaway)	then
		AddToPartition(kalaway, room);
	end
	if	not	lua_26in_partitionCHECK(ironrose)	then
		AddToPartition(ironrose, room);
	end
	if	not	lua_26in_partitionCHECK(dragon)		then
		AddToPartition(dragon, room);
	end
--]]

function lua_26in_npcGUID()--回傳26副本重要npc(回傳序  bancremz, morek, jill, comgas, kalaway, ironrose, dragon;)
	local room=ReadRoleValue(OwnerID(), EM_RoleValue_RoomID);
	local	bancremz,
		dragon,
		morek,
		jill,
		comgas,
		kalaway,
		ironrose;
	
	local org={};
	local __={hard=122201;normal=122776;easy=122784;};org.bancremz=   __[Global_BellatiaDuplication.type];
	local __={hard=122435;normal=122777;easy=122785;};org.morek=        __[Global_BellatiaDuplication.type];
	local __={hard=122464;normal=122778;easy=122786;};org.jill=               __[Global_BellatiaDuplication.type];
	local __={hard=122465;normal=122779;easy=122787;};org.comgas=       __[Global_BellatiaDuplication.type];
	local __={hard=122608;normal=122780;easy=122788;};org.kalaway=      __[Global_BellatiaDuplication.type];
	local __={hard=103371;normal=107861;easy=108071;};org.ironrose=     __[Global_BellatiaDuplication.type];
	local __={hard=102996;normal=108009;easy=108073;};org.dragon=       __[Global_BellatiaDuplication.type];
                               

	
	local create=false;
	if not Global_BellatiaDuplication then
		create=true;
	else
		if not Global_BellatiaDuplication[room] then
			create=true;
		end
	end
	if create then
		bancremz=CreateObj(org.bancremz, 0,0,0,99, 1);
		dragon=CreateObj(org.dragon, 0,0,0,99, 1);
		morek=CreateObj(org.morek, 0,0,0,99, 1);
		jill=CreateObj(org.jill, 0,0,0,99, 1);
		comgas=CreateObj(org.comgas, 0,0,0,99, 1);
		kalaway=CreateObj(org.kalaway, 0,0,0,99, 1);
		ironrose=CreateObj(org.ironrose, 0,0,0,99, 1);
	else
		bancremz=		Global_BellatiaDuplication[room].PangkorRams.guid;
		dragon=			Global_BellatiaDuplication[room].PangkorRams_dragon.guid;
		morek=			Global_BellatiaDuplication[room].Morrok.guid;
		jill=			Global_BellatiaDuplication[room].Jill.guid;
		comgas=			Global_BellatiaDuplication[room].Kangersy.guid;
		kalaway=		Global_BellatiaDuplication[room].Cassam.guid;
		ironrose=		Global_BellatiaDuplication[room].IronRose.guid;
		
		if not	bancremz	then		bancremz=CreateObj(org.bancremz, 0,0,0,99, 1);		end
		if not	dragon		then		dragon=CreateObj(org.dragon, 0,0,0,99, 1);		end
		if not	morek		then		morek=CreateObj(org.morek, 0,0,0,99, 1);		end
		if not	jill		then		jill=CreateObj(org.jill, 0,0,0,99, 1);			end
		if not	comgas		then		comgas=CreateObj(org.comgas, 0,0,0,99, 1);		end
		if not	kalaway		then		kalaway=CreateObj(org.kalaway, 0,0,0,99, 1);		end
		if not	ironrose	then		ironrose=CreateObj(org.ironrose, 0,0,0,99, 1);		end
	end
	--若物件在 0,0,0 dir 又是99 那物件就是新創，需要addtopartition
	return bancremz, morek, jill, comgas, kalaway, ironrose, dragon;
end
function lua_26in_partitionCHECK(obj)--檢查 lua_26in_npcGUID回傳的物件 是否已經加入分割區
	local room=ReadRoleValue(OwnerID(), EM_RoleValue_RoomID);
	if not obj then
		DebugMsg(0, room, "obj=nil")
		return false;
	end
	local x,y,z,dir=DW_Location(obj);
	if	x==0	and
		y==0	and
		z==0	and
		dir==99	then
		return false;
	else
		return true;
	end
end
function lua_26in_getsoldiersguid()--專屬26副本，取得突擊隊士兵的guid
	local room		=ReadRoleValue(OwnerID(), EM_RoleValue_RoomID);
	local soldier		={};
	Global_BellatiaDuplication[room].soldiers = Global_BellatiaDuplication[room].soldiers or {};
	for	i, __ in pairs(Global_BellatiaDuplication[room].soldiers) do
		if __.guid	then
			table.insert(soldier, Global_BellatiaDuplication[room].soldiers[i]);
		end
	end
	
	if not	Global_BellatiaDuplication[room].soldiers or #soldier==0	then
		--沒有士兵的資料，自行創建
		local __={	hard={103291;103357;103358;103359};
				normal={108013;108014;108015;108016};
				easy={108077;108078;108079;108080;};	};
		org=__[Global_BellatiaDuplication.type];
		for i=1, 4, 1 do
			local s = AddyAlly:new();
			s:create( org[i], 0,0,0,99);
			s.patrol=false;
			s.is_walk=0;
			table.insert(soldier, s);
			table.insert(Global_BellatiaDuplication[room].soldiers, s);
		end
	end
	return soldier;
end
function GM_checksavepoint()--驗證目前的儲存點進度
	local room=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID);
	local save_point = Global_BellatiaDuplication[room].save_point;
	DebugMsg(0,room,save_point);
end
---------------
--2王附屬函式


function lua_26in_boss2_set()--進戰鬥前的設置及準備(對話劇情觸發);
	DisableQuest(TargetID(),true);
	CloseSpeak(OwnerID());
	--基本準備
	local bancremz, morek, jill, comgas, kalaway, ironrose, dragon=lua_26in_npcGUID();
	local room=ReadRoleValue(OwnerID(), EM_RoleValue_RoomID);
	DisableQuest(bancremz,true);
	Lua_BellatiaDuplication_change_status(room, "boss");--進入boss戰(不給對話)
		
	--開門
	local FRONTdoor=Global_BellatiaDuplication[room].door_before_boss2.GUID;
	SetModeEx(FRONTdoor,EM_SetModeType_Show,false);
	SetModeEx(FRONTdoor,EM_SetModeType_Obstruct,false);

	BeginPlot(bancremz, "lua_26in_boss2_main", 0);
end

--main
function lua_26in_boss2_HPtrigger()--蟻后血量過低時觸發劇情
        local boss      =OwnerID();
        local room      =ReadRoleValue(boss, EM_RoleValue_RoomID);
        --替換鎖血
        local HP=DW_GetHPpercentVar(boss, 9);
        LockHP(boss, HP, "");--鎖住等待表演
        
        --通風報信
        WriteRoleValue(boss, EM_RoleValue_Register, 1);
end
function lua_26in_boss2_AntSoid()--血量掉到一定程度時產生蟻酸
        local ant=OwnerID();
        local room=ReadRoleValue(ant, EM_RoleValue_RoomID);
        LockHP(ant, -100, "");
        DebugMsg(0, room, "trigger");
        
        --原兵蟻動作
        StopMove(ant, true);
        SetModeEx(ant, EM_SetModeType_Move, false);
        --蟻酸設定
        local x,y,z,dir=DW_Location(ant);
        local soid=CreateObj(103373, x,y,z,dir, 1);
        SetModeEx(soid, EM_SetModeType_Mark, false);
        SetModeEx(soid, EM_SetModeType_ShowRoleHead, false);
        DW_UnFight(soid, true);
        WriteRoleValue(soid, EM_RoleValue_LiveTime, 10);        
        AddToPartition(soid, room);
        BeginPlot(soid, "lua_26in_boss2_AntSoid_cast", 0);
        --原兵蟻
        local who=HateListInfo(ant, 0, EM_HateListInfoType_GItemID);
        KillID(who, ant);
end
function lua_26in_boss2_AntSoid_cast()--連續施法
        local s=OwnerID();
        while true do
                sleep(10);
                SysCastSpellLv(s, s, 850980, 0);
        end
end
function lua_26in_boss2_AutoDisappear()--如果不在Boss階段就消失
	local room=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID);
	while(Lua_BellatiaDuplication_check_status(room,"fail")==false)do
		sleep(10);
	end
	DelObj(OwnerID());
end