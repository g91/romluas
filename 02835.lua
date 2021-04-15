function Lua_26_in_dialogue_morek()--����J���
	local player		=OwnerID();
	local room		=ReadRoleValue(player, EM_RoleValue_RoomID);
	local bancremz		=Global_BellatiaDuplication[room].pangkorrams.guid;
	local save_point	=Global_BellatiaDuplication[room].save_point;
	
	if(save_point == 1)then
		--�J�f�B
		SetSpeakDetail(player, "[SC_26IN_DIALOGUE_MOREK_1]");
	elseif(save_point == 4)and(Global_26IN_Boss2AlreadyBEdefeat)and(Global_26IN_Boss2AlreadyBEdefeat[room])then
		--2����
		SetSpeakDetail(player, "[SC_26IN_DIALOGUE_MOREK_5]");return;
	elseif(save_point == 4)then
		--2���e
		SetSpeakDetail(player, "[SC_26IN_DIALOGUE_MOREK_4]");return;
	elseif save_point == 5 then
		--���F�K��
		SetSpeakDetail(player, "[SC_26IN_DIALOGUE_MOREK_5]");return
	elseif save_point == 6 then
		local x,y,z,dir=DW_Location(bancremz);
		DebugMsg(0, room, table.concat({x,y,z,dir}, ","));
		--���s�w�U�h
		if x==0 and z==0 then
			SetSpeakDetail(player, "[SC_26IN_DIALOGUE_MOREK_6]");
			AddSpeakOption(player, player, "[SC_26IN_FOREBOSS3_T]", "Lua_26instance_foreboss3_GoIntoDream", 0);return;
		end
		--����3��
		SetSpeakDetail(player, "[SC_26IN_DIALOGUE_MOREK_7]");return;
	elseif save_point == 7 then
		--�X�q�D
		SetSpeakDetail(player, "[SC_26IN_DIALOGUE_MOREK_8]");return;
	elseif save_point == 8 then
		--�|���e
		SetSpeakDetail(player, "[SC_26IN_DIALOGUE_MOREK_9]");return;
	elseif save_point == 9 then
		--�|����
		SetSpeakDetail(player, "[SC_26IN_DIALOGUE_MOREK_10]");return;
	elseif save_point == 10 then
		--�����e
		SetSpeakDetail(player, "[SC_26IN_DIALOGUE_MOREK_11]");return;
	elseif save_point == 11 then
		--�����ү��箦
		SetSpeakDetail(player, "[SC_26IN_DIALOGUE_MOREK_END]");return;
	end
end
function Lua_26_in_dialogue_jill()--�N����
	local player		=OwnerID();
	local room		=ReadRoleValue(player, EM_RoleValue_RoomID);
	local bancremz		=Global_BellatiaDuplication[room].pangkorrams.guid;
	local save_point	=Global_BellatiaDuplication[room].save_point;
	
	if save_point == 1 then
		--�J�f�B
		SetSpeakDetail(player, "[SC_26IN_DIALOGUE_JILL_1]");
	elseif(save_point == 4)and(Global_26IN_Boss2AlreadyBEdefeat)and(Global_26IN_Boss2AlreadyBEdefeat[room])then
		--2����
		SetSpeakDetail(player, "[SC_26IN_DIALOGUE_JILL_5]");return;
	elseif(save_point == 4)then
		--2���e
		SetSpeakDetail(player, "[SC_26IN_DIALOGUE_JILL_4]");return;
	elseif save_point == 5 then
		--���K��
		SetSpeakDetail(player, "[SC_26IN_DIALOGUE_JILL_6]");return;
	elseif save_point == 6 then
		--����3��
		SetSpeakDetail(player, "[SC_26IN_DIALOGUE_JILL_7]");return;
	elseif save_point == 7 then
		--�X�q�D
		SetSpeakDetail(player, "[SC_26IN_DIALOGUE_JILL_8]");return;
	elseif save_point == 8 then
		--�|���e
		SetSpeakDetail(player, "[SC_26IN_DIALOGUE_JILL_9]");return;
	elseif save_point == 9 then
		--�|����
		SetSpeakDetail(player, "[SC_26IN_DIALOGUE_JILL_10]");return;
	elseif save_point == 10 then
		--�����e
		SetSpeakDetail(player, "[SC_26IN_DIALOGUE_JILL_11]");return;
	elseif save_point == 11 then
		--�����ү��箦
		SetSpeakDetail(player, "[SC_26IN_DIALOGUE_JILL_END]");return;
	end
end
function Lua_26_in_dialogue_comgas(option)--�d����
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
		--�J�f�B
		SetSpeakDetail(player, "[SC_26IN_DIALOGUE_COMGAS_1]");
	elseif(save_point == 4)and(Global_26IN_Boss2AlreadyBEdefeat)and(Global_26IN_Boss2AlreadyBEdefeat[room])then
		--2����
		SetSpeakDetail(player, "[SC_26IN_DIALOGUE_COMGAS_5]");return;
	elseif(save_point == 4)then
		--2���e
		SetSpeakDetail(player, "[SC_26IN_DIALOGUE_COMGAS_4]");return;
	elseif save_point == 5 then
		--���K��
		SetSpeakDetail(player, "[SC_26IN_DIALOGUE_COMGAS_6]");return;
	elseif save_point == 6 then
		--����3��
		SetSpeakDetail(player, "[SC_26IN_DIALOGUE_COMGAS_7]");return;
	elseif save_point == 7 then
		--�X�q�D
		SetSpeakDetail(player, "[SC_26IN_DIALOGUE_COMGAS_8]");return;
	elseif save_point == 8 then
		--�|���e
		SetSpeakDetail(player, "[SC_26IN_DIALOGUE_COMGAS_9]");return;
	elseif save_point == 9 then
		--�|����
		SetSpeakDetail(player, "[SC_26IN_DIALOGUE_COMGAS_10]");return;
	elseif save_point == 10 then
		--�����e
		SetSpeakDetail(player, "[SC_26IN_DIALOGUE_COMGAS_11]");return;
	elseif save_point == 11 then
		--�����ү��箦
		SetSpeakDetail(player, "[SC_26IN_DIALOGUE_COMGAS_END]");
		AddSpeakOption(player, player, "[SC_26IN_DIALOGUE_COMGAS_OPTION_1]", "Lua_26_in_dialogue_comgas(1)", 0 );return;
	end
end
function Lua_26_in_dialogue_ironrose()--��Z�g
	local player		=OwnerID();
	local room		=ReadRoleValue(player, EM_RoleValue_RoomID);
	local bancremz		=Global_BellatiaDuplication[room].pangkorrams.guid;
	local save_point	=Global_BellatiaDuplication[room].save_point;
	
	if save_point == 1 then
		--�J�f�B
		SetSpeakDetail(player, "[SC_26IN_DIALOGUE_IRONROSE_1]");
	elseif(save_point == 4)and(Global_26IN_Boss2AlreadyBEdefeat)and(Global_26IN_Boss2AlreadyBEdefeat[room])then
		--2����
		SetSpeakDetail(player, "[SC_26IN_DIALOGUE_IRONROSE_5]");return;
	elseif(save_point == 4)then
		--2���e
		SetSpeakDetail(player, "[SC_26IN_DIALOGUE_IRONROSE_4]");return;
	elseif save_point == 5 then
		--���K��
		SetSpeakDetail(player, "[SC_26IN_DIALOGUE_IRONROSE_6]");return;
	elseif save_point == 6 then
		--����3��
		SetSpeakDetail(player, "[SC_26IN_DIALOGUE_IRONROSE_7]");return;
	elseif save_point == 7 then
		--�X�q�D
		SetSpeakDetail(player, "[SC_26IN_DIALOGUE_IRONROSE_8]");return;
	elseif save_point == 8 then
		--�|���e
		SetSpeakDetail(player, "[SC_26IN_DIALOGUE_IRONROSE_9]");return;
	elseif save_point == 11 then
		--�����ү��箦
		SetSpeakDetail(player, "[SC_26IN_DIALOGUE_IRONROSE_END]");return;
	end
end
function lua_26in_dialogue_support()--��O�J�䴩�̪���ܼ@��
	local player=OwnerID();
	local room=ReadRoleValue(player,EM_RoleValue_RoomID);
	local bancremz		=Global_BellatiaDuplication[room].pangkorrams.guid;
	local save_point	=Global_BellatiaDuplication[room].save_point;
	
	if(save_point==11)then
		SetSpeakDetail(player, "[SC_26IN_SURPORT_3]");
		AddSpeakOption(player,player,"[SC_26IN_SURPORT_4]","",0);--�ǥX�ƥ����@���A�Ш��U�@�Ө禡
	else
		SetSpeakDetail(player, "[SC_26IN_SURPORT_1]");
		AddToPartition(player,player,"[SC_26IN_SURPORT_2]","",0);--�Ш��U�U�Ө禡
	end
end
function lua_26in_transport_out()--�ǥX�ƥ����@��
	local player=OwnerID();
	ChangeZone(player,26,0,x,y,z,dir);
end
function lua_26in_transport_firstline()--�Ǩ�ƥ��̫e�u
	
end