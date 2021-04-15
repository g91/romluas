function Lua_26_in_dialogue_morek()--摩瑞克對話
	local player		=OwnerID();
	local room		=ReadRoleValue(player, EM_RoleValue_RoomID);
	local bancremz		=Global_BellatiaDuplication[room].pangkorrams.guid;
	local save_point	=Global_BellatiaDuplication[room].save_point;
	
	if(save_point == 1)then
		--入口處
		SetSpeakDetail(player, "[SC_26IN_DIALOGUE_MOREK_1]");
	elseif(save_point == 4)and(Global_26IN_Boss2AlreadyBEdefeat)and(Global_26IN_Boss2AlreadyBEdefeat[room])then
		--2王房
		SetSpeakDetail(player, "[SC_26IN_DIALOGUE_MOREK_5]");return;
	elseif(save_point == 4)then
		--2王前
		SetSpeakDetail(player, "[SC_26IN_DIALOGUE_MOREK_4]");return;
	elseif save_point == 5 then
		--剛抵達密室
		SetSpeakDetail(player, "[SC_26IN_DIALOGUE_MOREK_5]");return
	elseif save_point == 6 then
		local x,y,z,dir=DW_Location(bancremz);
		DebugMsg(0, room, table.concat({x,y,z,dir}, ","));
		--光龍趴下去
		if x==0 and z==0 then
			SetSpeakDetail(player, "[SC_26IN_DIALOGUE_MOREK_6]");
			AddSpeakOption(player, player, "[SC_26IN_FOREBOSS3_T]", "Lua_26instance_foreboss3_GoIntoDream", 0);return;
		end
		--打完3王
		SetSpeakDetail(player, "[SC_26IN_DIALOGUE_MOREK_7]");return;
	elseif save_point == 7 then
		--出通道
		SetSpeakDetail(player, "[SC_26IN_DIALOGUE_MOREK_8]");return;
	elseif save_point == 8 then
		--四王前
		SetSpeakDetail(player, "[SC_26IN_DIALOGUE_MOREK_9]");return;
	elseif save_point == 9 then
		--四王後
		SetSpeakDetail(player, "[SC_26IN_DIALOGUE_MOREK_10]");return;
	elseif save_point == 10 then
		--五王前
		SetSpeakDetail(player, "[SC_26IN_DIALOGUE_MOREK_11]");return;
	elseif save_point == 11 then
		--打完曼索瑞恩
		SetSpeakDetail(player, "[SC_26IN_DIALOGUE_MOREK_END]");return;
	end
end
function Lua_26_in_dialogue_jill()--吉兒對話
	local player		=OwnerID();
	local room		=ReadRoleValue(player, EM_RoleValue_RoomID);
	local bancremz		=Global_BellatiaDuplication[room].pangkorrams.guid;
	local save_point	=Global_BellatiaDuplication[room].save_point;
	
	if save_point == 1 then
		--入口處
		SetSpeakDetail(player, "[SC_26IN_DIALOGUE_JILL_1]");
	elseif(save_point == 4)and(Global_26IN_Boss2AlreadyBEdefeat)and(Global_26IN_Boss2AlreadyBEdefeat[room])then
		--2王房
		SetSpeakDetail(player, "[SC_26IN_DIALOGUE_JILL_5]");return;
	elseif(save_point == 4)then
		--2王前
		SetSpeakDetail(player, "[SC_26IN_DIALOGUE_JILL_4]");return;
	elseif save_point == 5 then
		--剛到密室
		SetSpeakDetail(player, "[SC_26IN_DIALOGUE_JILL_6]");return;
	elseif save_point == 6 then
		--打完3王
		SetSpeakDetail(player, "[SC_26IN_DIALOGUE_JILL_7]");return;
	elseif save_point == 7 then
		--出通道
		SetSpeakDetail(player, "[SC_26IN_DIALOGUE_JILL_8]");return;
	elseif save_point == 8 then
		--四王前
		SetSpeakDetail(player, "[SC_26IN_DIALOGUE_JILL_9]");return;
	elseif save_point == 9 then
		--四王後
		SetSpeakDetail(player, "[SC_26IN_DIALOGUE_JILL_10]");return;
	elseif save_point == 10 then
		--五王前
		SetSpeakDetail(player, "[SC_26IN_DIALOGUE_JILL_11]");return;
	elseif save_point == 11 then
		--打完曼索瑞恩
		SetSpeakDetail(player, "[SC_26IN_DIALOGUE_JILL_END]");return;
	end
end
function Lua_26_in_dialogue_comgas(option)--康葛斯
	local player		=OwnerID();
	local room		=ReadRoleValue(player, EM_RoleValue_RoomID);
	local bancremz		=Global_BellatiaDuplication[room].pangkorrams.guid;
	local save_point	=Global_BellatiaDuplication[room].save_point;
	
	
	if option == 1 then
		SetSpeakDetail(player, "[SC_26IN_DIALOGUE_COMGAS_END_1]");
		AddSpeakOption(player, player, "[SC_26IN_DIALOGUE_COMGAS_OPTION_2]", "Lua_26_in_dialogue_comgas(2)", 0 );return
	elseif option == 2 then
		SetSpeakDetail(player, "[SC_26IN_DIALOGUE_COMGAS_END_2]");return;
	end
	
	if save_point == 1 then
		--入口處
		SetSpeakDetail(player, "[SC_26IN_DIALOGUE_COMGAS_1]");
	elseif(save_point == 4)and(Global_26IN_Boss2AlreadyBEdefeat)and(Global_26IN_Boss2AlreadyBEdefeat[room])then
		--2王房
		SetSpeakDetail(player, "[SC_26IN_DIALOGUE_COMGAS_5]");return;
	elseif(save_point == 4)then
		--2王前
		SetSpeakDetail(player, "[SC_26IN_DIALOGUE_COMGAS_4]");return;
	elseif save_point == 5 then
		--剛到密室
		SetSpeakDetail(player, "[SC_26IN_DIALOGUE_COMGAS_6]");return;
	elseif save_point == 6 then
		--打完3王
		SetSpeakDetail(player, "[SC_26IN_DIALOGUE_COMGAS_7]");return;
	elseif save_point == 7 then
		--出通道
		SetSpeakDetail(player, "[SC_26IN_DIALOGUE_COMGAS_8]");return;
	elseif save_point == 8 then
		--四王前
		SetSpeakDetail(player, "[SC_26IN_DIALOGUE_COMGAS_9]");return;
	elseif save_point == 9 then
		--四王後
		SetSpeakDetail(player, "[SC_26IN_DIALOGUE_COMGAS_10]");return;
	elseif save_point == 10 then
		--五王前
		SetSpeakDetail(player, "[SC_26IN_DIALOGUE_COMGAS_11]");return;
	elseif save_point == 11 then
		--打完曼索瑞恩
		SetSpeakDetail(player, "[SC_26IN_DIALOGUE_COMGAS_END]");
		AddSpeakOption(player, player, "[SC_26IN_DIALOGUE_COMGAS_OPTION_1]", "Lua_26_in_dialogue_comgas(1)", 0 );return;
	end
end
function Lua_26_in_dialogue_ironrose()--伊崔妮
	local player		=OwnerID();
	local room		=ReadRoleValue(player, EM_RoleValue_RoomID);
	local bancremz		=Global_BellatiaDuplication[room].pangkorrams.guid;
	local save_point	=Global_BellatiaDuplication[room].save_point;
	
	if save_point == 1 then
		--入口處
		SetSpeakDetail(player, "[SC_26IN_DIALOGUE_IRONROSE_1]");
	elseif(save_point == 4)and(Global_26IN_Boss2AlreadyBEdefeat)and(Global_26IN_Boss2AlreadyBEdefeat[room])then
		--2王房
		SetSpeakDetail(player, "[SC_26IN_DIALOGUE_IRONROSE_5]");return;
	elseif(save_point == 4)then
		--2王前
		SetSpeakDetail(player, "[SC_26IN_DIALOGUE_IRONROSE_4]");return;
	elseif save_point == 5 then
		--剛到密室
		SetSpeakDetail(player, "[SC_26IN_DIALOGUE_IRONROSE_6]");return;
	elseif save_point == 6 then
		--打完3王
		SetSpeakDetail(player, "[SC_26IN_DIALOGUE_IRONROSE_7]");return;
	elseif save_point == 7 then
		--出通道
		SetSpeakDetail(player, "[SC_26IN_DIALOGUE_IRONROSE_8]");return;
	elseif save_point == 8 then
		--四王前
		SetSpeakDetail(player, "[SC_26IN_DIALOGUE_IRONROSE_9]");return;
	elseif save_point == 11 then
		--打完曼索瑞恩
		SetSpeakDetail(player, "[SC_26IN_DIALOGUE_IRONROSE_END]");return;
	end
end
function lua_26in_dialogue_support()--艾力克支援者的對話劇情
	local player=OwnerID();
	local room=ReadRoleValue(player,EM_RoleValue_RoomID);
	local bancremz		=Global_BellatiaDuplication[room].pangkorrams.guid;
	local save_point	=Global_BellatiaDuplication[room].save_point;
	
	if(save_point==11)then
		SetSpeakDetail(player, "[SC_26IN_SURPORT_3]");
		AddSpeakOption(player,player,"[SC_26IN_SURPORT_4]","",0);--傳出副本的劇情，請見下一個函式
	else
		SetSpeakDetail(player, "[SC_26IN_SURPORT_1]");
		AddToPartition(player,player,"[SC_26IN_SURPORT_2]","",0);--請見下下個函式
	end
end
function lua_26in_transport_out()--傳出副本的劇情
	local player=OwnerID();
	ChangeZone(player,26,0,x,y,z,dir);
end
function lua_26in_transport_firstline()--傳到副本最前線
	
end