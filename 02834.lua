function GM_26IN_direct()--26�ƥ��ɤ�
	local Player		=OwnerID();
	local room		=ReadRoleValue(Player, EM_RoleValue_RoomID);
	
	--��l��(�C���ϥήɰ���)
	Global_26in_foreboss4_Ctrl	=Global_26in_foreboss4_Ctrl	or	{};		--�O���T����|�������A�ХX�ӷ�����������
	if Global_26in_foreboss4_Ctrl then
		if Global_26in_foreboss4_Ctrl[room] then
			DelObj(Global_26in_foreboss4_Ctrl[room]);
			Global_26in_foreboss4_Ctrl[room]=nil;
		end
	end
	Global_26in_DramaNPCrefl	=Global_26in_DramaNPCrefl	or	{};		--���Ȧs�b�ɡA�b�f�P�������p�Ǿ����������~�|���e��
	Global_26in_DramaNPCrefl[room]	=nil;
	
	DialogClose(Player);
	DialogCreate(Player, EM_LuaDialogType_Select, "[SC_GM_26IN_HELP_HOMEPAGE]");
	--�ﶵ
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
	
	--60��M�w
	for sec=1, 60, 1 do
		sleep(10);
		if DW_GetDistance(Player, x,y,z)>40 then
			DialogClose(Player);
			return;
		end
		local result = DialogGetResult(Player);
		if	result		==-1	then--���a����
			break;
		elseif	result		==0	then--���ϰT���ޱ���
			GM_26IN_PAGE1();return;
		elseif	result		==1	then--�ƦZ�α_
			GM_26IN_PAGE2();return;
		elseif	result		==2	then--���Ը��ȱK��
			GM_26IN_PAGE3();return;
		elseif	result		==3	then--�f�P����
			GM_26IN_PAGE4();return;
		elseif	result		==4	then--�t�����q
			GM_26IN_PAGE5();return;
		elseif	result		==5	then--��h����
			GM_26IN_HELP();return;
		end
	end
	DialogClose(Player);
end
function GM_26IN_HELP()--��h����
	local Player		=OwnerID();
	local room		=ReadRoleValue(Player, EM_RoleValue_RoomID);
	DialogClose(Player);
	DialogCreate(Player, EM_LuaDialogType_Select, "[SC_GM_26IN_HELP_MENU_INTRO]");
	
	--�ﶵ
	DialogSelectStr(Player, "[SC_GM_26IN_HELP_MENU_RECOVER]");
	
	if DialogSendOpen(Player)==false then
		DebugMsg(0,room,"Data Error");return;
	end
	local x,y,z,dir=DW_Location(player);
	
	--60��M�w
	for sec=1, 60, 1 do
		sleep(10);
		if DW_GetDistance(Player, x,y,z)>40 then
			DialogClose(Player);
			return;
		end
		local result = DialogGetResult(Player);
		if	result		==-1		then
			break;
		elseif	result		==0		then--<�����ڴ_��NPC���A>
			CallPlot(Player,"gm_bellatiaduplication_change_status", "standby");return;
		end
	end
	DialogClose(Player);
end
function GM_26IN_PAGE1()--���ϰT���ޱ���
	local Player		=OwnerID();
	local room		=ReadRoleValue(Player, EM_RoleValue_RoomID);
	DialogClose(Player);
	DialogCreate(Player, EM_LuaDialogType_Select, "[SC_GM_26IN_HELP_1_INTRO]");
	
	
	
	--�ﶵ
	DialogSelectStr(Player, "[SC_GM_26IN_HELP_1_1]");
	DialogSelectStr(Player, "[SC_GM_26IN_HELP_1_2]");
	DialogSelectStr(Player, "[SC_GM_26IN_HELP_2_1]");
	
	if DialogSendOpen(Player)==false then
		DebugMsg(0,room,"Data Error");return;
	end
	local x,y,z,dir=DW_Location(player);
	
	--60��M�w
	for sec=1, 60, 1 do
		sleep(10);
		if DW_GetDistance(Player, x,y,z)>40 then
			DialogClose(Player);
			return;
		end
		local result = DialogGetResult(Player);
		if	result		==-1		then
			break;
		elseif	result		==0		then--<��i�ƥ���@���e>
			
			CallPlot(Player,"GM_BellatiaDuplication_initialize", 1);break;
		elseif	result		==1		then--<�D�Ԥ@��>
			CallPlot(Player,"GM_BellatiaDuplication_initialize", 2);break;
		elseif	result		==2		then--<����1���쥴2���e>
			PlayMotionEX(Global_BellatiaDuplication[room].door_after_boss1.GUID, ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP);
			SetDefIdleMotion(Global_BellatiaDuplication[room].door_after_boss1.GUID,ruFUSION_MIME_ACTIVATE_LOOP);
			SetModeEx(Global_BellatiaDuplication[room].door_after_boss1.GUID, EM_SetModeType_Obstruct, false);
			CallPlot(Player,"GM_BellatiaDuplication_initialize", 3);break;
		end
	end
	DialogClose(Player);
end
function GM_26IN_PAGE2()--�ƦZ�α_
	local Player		=OwnerID();
	local room		=ReadRoleValue(Player, EM_RoleValue_RoomID);
	DialogClose(Player);
	DialogCreate(Player, EM_LuaDialogType_Select, "[SC_GM_26IN_HELP_2_INTRO]");
	
	--�ﶵ
	DialogSelectStr(Player, "[SC_GM_26IN_HELP_2_1]");
	DialogSelectStr(Player, "[SC_GM_26IN_HELP_2_2]");
	DialogSelectStr(Player, "[SC_GM_26IN_HELP_2_3]");
	
	if DialogSendOpen(Player)==false then
		DebugMsg(0,room,"Data Error");return;
	end
	local x,y,z,dir=DW_Location(player);
	
	--60��M�w
	for sec=1, 60, 1 do
		sleep(10);
		if DW_GetDistance(Player, x,y,z)>40 then
			DialogClose(Player);
			return;
		end
		local result = DialogGetResult(Player);
		if	result		==-1		then
			break;
		elseif	result		==0		then--<����1���쥴2���e>
			PlayMotionEX(Global_BellatiaDuplication[room].door_after_boss1.GUID, ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP);
			SetDefIdleMotion(Global_BellatiaDuplication[room].door_after_boss1.GUID,ruFUSION_MIME_ACTIVATE_LOOP);
			SetModeEx(Global_BellatiaDuplication[room].door_after_boss1.GUID, EM_SetModeType_Obstruct, false);
			CallPlot(Player,"GM_BellatiaDuplication_initialize", 3);break;
		elseif	result		==1		then--<�D��2��>
			CallPlot(Player,"GM_BellatiaDuplication_initialize", 4);break;
		elseif	result		==2		then--<�e���K��>
			CallPlot(Player,"GM_BellatiaDuplication_initialize", 4);
			BeginPlot(Player, "GM_JumpTo26INBoss2Die", 1);break;
		end
	end
	DialogClose(Player);
end
function GM_26IN_PAGE3()--���Ը��ȱK��
	local Player		=OwnerID();
	local room		=ReadRoleValue(Player, EM_RoleValue_RoomID);
	DialogClose(Player);
	DialogCreate(Player, EM_LuaDialogType_Select, "[SC_GM_26IN_HELP_3_INTRO]");
	
	--�ﶵ
	DialogSelectStr(Player, "[SC_GM_26IN_HELP_3_1]");
	DialogSelectStr(Player, "[SC_GM_26IN_HELP_3_2]");
	DialogSelectStr(Player, "[SC_GM_26IN_HELP_3_3]");
	
	if DialogSendOpen(Player)==false then
		DebugMsg(0,room,"Data Error");return;
	end
	local x,y,z,dir=DW_Location(player);
	
	--60��M�w
	for sec=1, 60, 1 do
		sleep(10);
		if DW_GetDistance(Player, x,y,z)>40 then
			DialogClose(Player);
			return;
		end
		local result = DialogGetResult(Player);
		if	result		==-1		then
			break;
		elseif	result		==0		then--<���F�K�Ǩ�D��3���e>
			CallPlot(Player,"GM_BellatiaDuplication_initialize", 5);
			BeginPlot(Player, "Lua_26instance_foreboss3_ObjectRecover", 1);break;
		elseif	result		==1		then--<�D��3��>
			CallPlot(Player,"GM_BellatiaDuplication_initialize", 6);
			BeginPlot(Player, "GM_QuickToBoss3", 0);break;
		elseif	result		==2		then--<����3����>
			CallPlot(Player,"GM_BellatiaDuplication_initialize", 6);
			BeginPlot(Player, "lua_26in_foreboss4_GoPosition", 1);break;
		end
	end
	DialogClose(Player);
end
function GM_26IN_PAGE4()--�f�P����
	local Player		=OwnerID();
	local room		=ReadRoleValue(Player, EM_RoleValue_RoomID);
	DialogClose(Player);
	DialogCreate(Player, EM_LuaDialogType_Select, "[SC_GM_26IN_HELP_4_INTRO]");
	
	--�ﶵ
	DialogSelectStr(Player, "[SC_GM_26IN_HELP_4_1]");
	DialogSelectStr(Player, "[SC_GM_26IN_HELP_4_2]");
	
	if DialogSendOpen(Player)==false then
		DebugMsg(0,room,"Data Error");return;
	end
	local x,y,z,dir=DW_Location(player);
	
	--60��M�w
	for sec=1, 60, 1 do
		sleep(10);
		if DW_GetDistance(Player, x,y,z)>40 then
			DialogClose(Player);
			return;
		end
		local result = DialogGetResult(Player);
		if	result		==-1		then
			break;
		elseif	result		==0		then--<���}�K�ǫ�>
			CallPlot(Player,"GM_BellatiaDuplication_initialize", 7);
			BeginPlot(Player, "GM_26in_foreboss4a_recover", 1);break;
		elseif	result		==1		then--<�D�ԥ|��>
			CallPlot(Player,"GM_BellatiaDuplication_initialize", 8);break;
		end
	end
	DialogClose(Player);
end
function GM_26IN_PAGE5()--�t�����q
	local Player		=OwnerID();
	local room		=ReadRoleValue(Player, EM_RoleValue_RoomID);
	DialogClose(Player);
	DialogCreate(Player, EM_LuaDialogType_Select, "[SC_GM_26IN_HELP_5_INTRO]");
	
	--�ﶵ
	DialogSelectStr(Player, "[SC_GM_26IN_HELP_5_1]");
	DialogSelectStr(Player, "[SC_GM_26IN_HELP_5_2]");
	
	if DialogSendOpen(Player)==false then
		DebugMsg(0,room,"Data Error");return;
	end
	local x,y,z,dir=DW_Location(player);
	
	--60��M�w
	for sec=1, 60, 1 do
		sleep(10);
		if DW_GetDistance(Player, x,y,z)>40 then
			DialogClose(Player);
			return;
		end
		local result = DialogGetResult(Player);
		if	result		==-1		then
			break;
		elseif	result		==0		then--<�襴��4��>
			CallPlot(Player,"GM_BellatiaDuplication_initialize", 9);break;
		elseif	result		==1		then--<�D��5��>
			CallPlot(Player,"GM_BellatiaDuplication_initialize", 10);break;
		end
	end
	DialogClose(Player);
end