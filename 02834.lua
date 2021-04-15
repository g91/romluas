function GM_26IN_direct()--26副本導引
	local Player		=OwnerID();
	local room		=ReadRoleValue(Player, EM_RoleValue_RoomID);
	
	--初始化(每次使用時執行)
	Global_26in_foreboss4_Ctrl	=Global_26in_foreboss4_Ctrl	or	{};		--記錄三王到四王之間，創出來當中控器的物件
	if Global_26in_foreboss4_Ctrl then
		if Global_26in_foreboss4_Ctrl[room] then
			DelObj(Global_26in_foreboss4_Ctrl[room]);
			Global_26in_foreboss4_Ctrl[room]=nil;
		end
	end
	Global_26in_DramaNPCrefl	=Global_26in_DramaNPCrefl	or	{};		--當此值存在時，在審判之門的小怪機關突擊隊才會往前衝
	Global_26in_DramaNPCrefl[room]	=nil;
	
	DialogClose(Player);
	DialogCreate(Player, EM_LuaDialogType_Select, "[SC_GM_26IN_HELP_HOMEPAGE]");
	--選項
	DialogSelectStr(Player,"1st".."[ZONE_BELLATIA_FORTS_01]");
	DialogSelectStr(Player,"2nd".."[ZONE_BELLATIA_FORTS_02]");
	DialogSelectStr(Player,"3rd".."[ZONE_BELLATIA_FORTS_03]");
	DialogSelectStr(Player,"4th".."[ZONE_BELLATIA_FORTS_05]");
	DialogSelectStr(Player,"5th".."[ZONE_BELLATIA_FORTS_06]");
	DialogSelectStr(Player,"[SC_GM_26IN_HELP_MENU]");
	
	if DialogSendOpen(Player)==false then
		DebugMsg(0,room,"Data Error");return;
	end
	local x,y,z,dir=DW_Location(player);
	
	--60秒決定
	for sec=1, 60, 1 do
		sleep(10);
		if DW_GetDistance(Player, x,y,z)>40 then
			DialogClose(Player);
			return;
		end
		local result = DialogGetResult(Player);
		if	result		==-1	then--玩家關閉
			break;
		elseif	result		==0	then--中樞訊息管控區
			GM_26IN_PAGE1();return;
		elseif	result		==1	then--蟻后蟲巢
			GM_26IN_PAGE2();return;
		elseif	result		==2	then--貝拉蒂亞密室
			GM_26IN_PAGE3();return;
		elseif	result		==3	then--審判之門
			GM_26IN_PAGE4();return;
		elseif	result		==4	then--聖王之巔
			GM_26IN_PAGE5();return;
		elseif	result		==5	then--更多說明
			GM_26IN_HELP();return;
		end
	end
	DialogClose(Player);
end
function GM_26IN_HELP()--更多說明
	local Player		=OwnerID();
	local room		=ReadRoleValue(Player, EM_RoleValue_RoomID);
	DialogClose(Player);
	DialogCreate(Player, EM_LuaDialogType_Select, "[SC_GM_26IN_HELP_MENU_INTRO]");
	
	--選項
	DialogSelectStr(Player, "[SC_GM_26IN_HELP_MENU_RECOVER]");
	
	if DialogSendOpen(Player)==false then
		DebugMsg(0,room,"Data Error");return;
	end
	local x,y,z,dir=DW_Location(player);
	
	--60秒決定
	for sec=1, 60, 1 do
		sleep(10);
		if DW_GetDistance(Player, x,y,z)>40 then
			DialogClose(Player);
			return;
		end
		local result = DialogGetResult(Player);
		if	result		==-1		then
			break;
		elseif	result		==0		then--<請幫我復原NPC狀態>
			CallPlot(Player,"gm_bellatiaduplication_change_status", "standby");return;
		end
	end
	DialogClose(Player);
end
function GM_26IN_PAGE1()--中樞訊息管控區
	local Player		=OwnerID();
	local room		=ReadRoleValue(Player, EM_RoleValue_RoomID);
	DialogClose(Player);
	DialogCreate(Player, EM_LuaDialogType_Select, "[SC_GM_26IN_HELP_1_INTRO]");
	
	
	
	--選項
	DialogSelectStr(Player, "[SC_GM_26IN_HELP_1_1]");
	DialogSelectStr(Player, "[SC_GM_26IN_HELP_1_2]");
	DialogSelectStr(Player, "[SC_GM_26IN_HELP_2_1]");
	
	if DialogSendOpen(Player)==false then
		DebugMsg(0,room,"Data Error");return;
	end
	local x,y,z,dir=DW_Location(player);
	
	--60秒決定
	for sec=1, 60, 1 do
		sleep(10);
		if DW_GetDistance(Player, x,y,z)>40 then
			DialogClose(Player);
			return;
		end
		local result = DialogGetResult(Player);
		if	result		==-1		then
			break;
		elseif	result		==0		then--<剛進副本到一王前>
			
			CallPlot(Player,"GM_BellatiaDuplication_initialize", 1);break;
		elseif	result		==1		then--<挑戰一王>
			CallPlot(Player,"GM_BellatiaDuplication_initialize", 2);break;
		elseif	result		==2		then--<打完1王到打2王前>
			PlayMotionEX(Global_BellatiaDuplication[room].door_after_boss1.GUID, ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP);
			SetDefIdleMotion(Global_BellatiaDuplication[room].door_after_boss1.GUID,ruFUSION_MIME_ACTIVATE_LOOP);
			SetModeEx(Global_BellatiaDuplication[room].door_after_boss1.GUID, EM_SetModeType_Obstruct, false);
			CallPlot(Player,"GM_BellatiaDuplication_initialize", 3);break;
		end
	end
	DialogClose(Player);
end
function GM_26IN_PAGE2()--蟻后蟲巢
	local Player		=OwnerID();
	local room		=ReadRoleValue(Player, EM_RoleValue_RoomID);
	DialogClose(Player);
	DialogCreate(Player, EM_LuaDialogType_Select, "[SC_GM_26IN_HELP_2_INTRO]");
	
	--選項
	DialogSelectStr(Player, "[SC_GM_26IN_HELP_2_1]");
	DialogSelectStr(Player, "[SC_GM_26IN_HELP_2_2]");
	DialogSelectStr(Player, "[SC_GM_26IN_HELP_2_3]");
	
	if DialogSendOpen(Player)==false then
		DebugMsg(0,room,"Data Error");return;
	end
	local x,y,z,dir=DW_Location(player);
	
	--60秒決定
	for sec=1, 60, 1 do
		sleep(10);
		if DW_GetDistance(Player, x,y,z)>40 then
			DialogClose(Player);
			return;
		end
		local result = DialogGetResult(Player);
		if	result		==-1		then
			break;
		elseif	result		==0		then--<打完1王到打2王前>
			PlayMotionEX(Global_BellatiaDuplication[room].door_after_boss1.GUID, ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP);
			SetDefIdleMotion(Global_BellatiaDuplication[room].door_after_boss1.GUID,ruFUSION_MIME_ACTIVATE_LOOP);
			SetModeEx(Global_BellatiaDuplication[room].door_after_boss1.GUID, EM_SetModeType_Obstruct, false);
			CallPlot(Player,"GM_BellatiaDuplication_initialize", 3);break;
		elseif	result		==1		then--<挑戰2王>
			CallPlot(Player,"GM_BellatiaDuplication_initialize", 4);break;
		elseif	result		==2		then--<前往密室>
			CallPlot(Player,"GM_BellatiaDuplication_initialize", 4);
			BeginPlot(Player, "GM_JumpTo26INBoss2Die", 1);break;
		end
	end
	DialogClose(Player);
end
function GM_26IN_PAGE3()--貝拉蒂亞密室
	local Player		=OwnerID();
	local room		=ReadRoleValue(Player, EM_RoleValue_RoomID);
	DialogClose(Player);
	DialogCreate(Player, EM_LuaDialogType_Select, "[SC_GM_26IN_HELP_3_INTRO]");
	
	--選項
	DialogSelectStr(Player, "[SC_GM_26IN_HELP_3_1]");
	DialogSelectStr(Player, "[SC_GM_26IN_HELP_3_2]");
	DialogSelectStr(Player, "[SC_GM_26IN_HELP_3_3]");
	
	if DialogSendOpen(Player)==false then
		DebugMsg(0,room,"Data Error");return;
	end
	local x,y,z,dir=DW_Location(player);
	
	--60秒決定
	for sec=1, 60, 1 do
		sleep(10);
		if DW_GetDistance(Player, x,y,z)>40 then
			DialogClose(Player);
			return;
		end
		local result = DialogGetResult(Player);
		if	result		==-1		then
			break;
		elseif	result		==0		then--<剛抵達密室到挑戰3王前>
			CallPlot(Player,"GM_BellatiaDuplication_initialize", 5);
			BeginPlot(Player, "Lua_26instance_foreboss3_ObjectRecover", 1);break;
		elseif	result		==1		then--<挑戰3王>
			CallPlot(Player,"GM_BellatiaDuplication_initialize", 6);
			BeginPlot(Player, "GM_QuickToBoss3", 0);break;
		elseif	result		==2		then--<打完3王後>
			CallPlot(Player,"GM_BellatiaDuplication_initialize", 6);
			BeginPlot(Player, "lua_26in_foreboss4_GoPosition", 1);break;
		end
	end
	DialogClose(Player);
end
function GM_26IN_PAGE4()--審判之門
	local Player		=OwnerID();
	local room		=ReadRoleValue(Player, EM_RoleValue_RoomID);
	DialogClose(Player);
	DialogCreate(Player, EM_LuaDialogType_Select, "[SC_GM_26IN_HELP_4_INTRO]");
	
	--選項
	DialogSelectStr(Player, "[SC_GM_26IN_HELP_4_1]");
	DialogSelectStr(Player, "[SC_GM_26IN_HELP_4_2]");
	
	if DialogSendOpen(Player)==false then
		DebugMsg(0,room,"Data Error");return;
	end
	local x,y,z,dir=DW_Location(player);
	
	--60秒決定
	for sec=1, 60, 1 do
		sleep(10);
		if DW_GetDistance(Player, x,y,z)>40 then
			DialogClose(Player);
			return;
		end
		local result = DialogGetResult(Player);
		if	result		==-1		then
			break;
		elseif	result		==0		then--<離開密室後>
			CallPlot(Player,"GM_BellatiaDuplication_initialize", 7);
			BeginPlot(Player, "GM_26in_foreboss4a_recover", 1);break;
		elseif	result		==1		then--<挑戰四王>
			CallPlot(Player,"GM_BellatiaDuplication_initialize", 8);break;
		end
	end
	DialogClose(Player);
end
function GM_26IN_PAGE5()--聖王之巔
	local Player		=OwnerID();
	local room		=ReadRoleValue(Player, EM_RoleValue_RoomID);
	DialogClose(Player);
	DialogCreate(Player, EM_LuaDialogType_Select, "[SC_GM_26IN_HELP_5_INTRO]");
	
	--選項
	DialogSelectStr(Player, "[SC_GM_26IN_HELP_5_1]");
	DialogSelectStr(Player, "[SC_GM_26IN_HELP_5_2]");
	
	if DialogSendOpen(Player)==false then
		DebugMsg(0,room,"Data Error");return;
	end
	local x,y,z,dir=DW_Location(player);
	
	--60秒決定
	for sec=1, 60, 1 do
		sleep(10);
		if DW_GetDistance(Player, x,y,z)>40 then
			DialogClose(Player);
			return;
		end
		local result = DialogGetResult(Player);
		if	result		==-1		then
			break;
		elseif	result		==0		then--<剛打完4王>
			CallPlot(Player,"GM_BellatiaDuplication_initialize", 9);break;
		elseif	result		==1		then--<挑戰5王>
			CallPlot(Player,"GM_BellatiaDuplication_initialize", 10);break;
		end
	end
	DialogClose(Player);
end