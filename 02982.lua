--[[�ƥΤ��
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

function lua_26in_npcGUID()--�^��26�ƥ����nnpc(�^�ǧ�  bancremz, morek, jill, comgas, kalaway, ironrose, dragon;)
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
	--�Y����b 0,0,0 dir �S�O99 ������N�O�s�СA�ݭnaddtopartition
	return bancremz, morek, jill, comgas, kalaway, ironrose, dragon;
end
function lua_26in_partitionCHECK(obj)--�ˬd lua_26in_npcGUID�^�Ǫ����� �O�_�w�g�[�J���ΰ�
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
function lua_26in_getsoldiersguid()--�M��26�ƥ��A���o�������h�L��guid
	local room		=ReadRoleValue(OwnerID(), EM_RoleValue_RoomID);
	local soldier		={};
	Global_BellatiaDuplication[room].soldiers = Global_BellatiaDuplication[room].soldiers or {};
	for	i, __ in pairs(Global_BellatiaDuplication[room].soldiers) do
		if __.guid	then
			table.insert(soldier, Global_BellatiaDuplication[room].soldiers[i]);
		end
	end
	
	if not	Global_BellatiaDuplication[room].soldiers or #soldier==0	then
		--�S���h�L����ơA�ۦ�Ы�
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
function GM_checksavepoint()--���ҥثe���x�s�I�i��
	local room=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID);
	local save_point = Global_BellatiaDuplication[room].save_point;
	DebugMsg(0,room,save_point);
end
---------------
--2�����ݨ禡


function lua_26in_boss2_set()--�i�԰��e���]�m�ηǳ�(��ܼ@��Ĳ�o);
	DisableQuest(TargetID(),true);
	CloseSpeak(OwnerID());
	--�򥻷ǳ�
	local bancremz, morek, jill, comgas, kalaway, ironrose, dragon=lua_26in_npcGUID();
	local room=ReadRoleValue(OwnerID(), EM_RoleValue_RoomID);
	DisableQuest(bancremz,true);
	Lua_BellatiaDuplication_change_status(room, "boss");--�i�Jboss��(�������)
		
	--�}��
	local FRONTdoor=Global_BellatiaDuplication[room].door_before_boss2.GUID;
	SetModeEx(FRONTdoor,EM_SetModeType_Show,false);
	SetModeEx(FRONTdoor,EM_SetModeType_Obstruct,false);

	BeginPlot(bancremz, "lua_26in_boss2_main", 0);
end

--main
function lua_26in_boss2_HPtrigger()--�ƦZ��q�L�C��Ĳ�o�@��
        local boss      =OwnerID();
        local room      =ReadRoleValue(boss, EM_RoleValue_RoomID);
        --�������
        local HP=DW_GetHPpercentVar(boss, 9);
        LockHP(boss, HP, "");--����ݪ�t
        
        --�q�����H
        WriteRoleValue(boss, EM_RoleValue_Register, 1);
end
function lua_26in_boss2_AntSoid()--��q����@�w�{�׮ɲ����ƻ�
        local ant=OwnerID();
        local room=ReadRoleValue(ant, EM_RoleValue_RoomID);
        LockHP(ant, -100, "");
        DebugMsg(0, room, "trigger");
        
        --��L�ưʧ@
        StopMove(ant, true);
        SetModeEx(ant, EM_SetModeType_Move, false);
        --�ƻĳ]�w
        local x,y,z,dir=DW_Location(ant);
        local soid=CreateObj(103373, x,y,z,dir, 1);
        SetModeEx(soid, EM_SetModeType_Mark, false);
        SetModeEx(soid, EM_SetModeType_ShowRoleHead, false);
        DW_UnFight(soid, true);
        WriteRoleValue(soid, EM_RoleValue_LiveTime, 10);        
        AddToPartition(soid, room);
        BeginPlot(soid, "lua_26in_boss2_AntSoid_cast", 0);
        --��L��
        local who=HateListInfo(ant, 0, EM_HateListInfoType_GItemID);
        KillID(who, ant);
end
function lua_26in_boss2_AntSoid_cast()--�s��I�k
        local s=OwnerID();
        while true do
                sleep(10);
                SysCastSpellLv(s, s, 850980, 0);
        end
end
function lua_26in_boss2_AutoDisappear()--�p�G���bBoss���q�N����
	local room=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID);
	while(Lua_BellatiaDuplication_check_status(room,"fail")==false)do
		sleep(10);
	end
	DelObj(OwnerID());
end