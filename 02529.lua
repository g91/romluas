function cl_z22_Chuansong_ctrlAI()
	local ctrlAI = OwnerID()
	local RoomID = ReadRoleValue( ctrlAI , EM_RoleValue_RoomID ) ---�ŧi�o�Ӧa��~�O�ڲ{�bŪ�쪺�a��
	local door_rand = 0
	local ctrlAI_table = {}
	local flag_table = {}
	flag_table[1] = 781037
	flag_table[2] = 781038
	flag_table[3] = 781039
	flag_table[4] = 781040
	local flag_num=table.getn(flag_table) ----���X��������ƶq
	for i = 1 , flag_num , 1 do
		ctrlAI_table[i] = CreateObjByFlag( 118697 , flag_table[i] , 0 , 1 ) ------------for�j�鲣�ͥ|�Ӭ�s��
		SetModeEx( ctrlAI_table[i] , EM_SetModeType_Show, false) ---����(�_)
		SetModeEx( ctrlAI_table[i] , EM_SetModeType_Strikback, false) ---����(�_)
		SetModeEx( ctrlAI_table[i] , EM_SetModeType_Move, false) ---����	(�_)
		SetModeEx( ctrlAI_table[i] , EM_SetModeType_Searchenemy, false)--����(�_)
		SetModeEx( ctrlAI_table[i] , EM_SetModeType_Mark, false)			---�i�I��(�O)
		SetModeEx( ctrlAI_table[i] , EM_SetModeType_ShowRoleHead, false) 		---�Y����(�O)
		SetModeEx( ctrlAI_table[i] , EM_SetModeType_Fight, false) ---�i���(�O)
		SetModeEx( ctrlAI_table[i] , EM_SetModeType_NotShowHPMP , true) ----����ܼg��
		local Rand_Num = DW_Rand(8)  ----�H����@�ӭȥN��TABLE�̪���m
		AddToPartition ( ctrlAI_table[i] , RoomID ) ----����[�J����,�Ҧ椽��
		WriteRoleValue ( ctrlAI_table[i] , EM_RoleValue_PID , ctrlAI )
		WriteRoleValue ( ctrlAI_table[i] , EM_RoleValue_Register1 , i )
		WriteRoleValue ( ctrlAI_table[i] , EM_RoleValue_Register2 , Rand_Num )
		BeginPlot( ctrlAI_table[i] , "cl_Z22_BOX_ctrlAI" , 0 ) -----��t�T�w�ʧ@�μ@��
	end
	local Chuansong_table = {}
	local Chuansong = table.getn(flag_table)
	for i = 1 , Chuansong , 1 do
		table.insert( Chuansong_table , flag_table[i] ) ---
	end
	while 1 do
		sleep ( 10 )
		if ReadRoleValue ( ctrlAI , EM_RoleValue_Register1 ) == 1 then
			local door_No = ReadRoleValue ( ctrlAI , EM_RoleValue_Register2 )
			local door_num = table.getn( Chuansong_table ) ----
			if door_num > 1 then
				door_rand = DW_Rand(door_num-1)
			elseif door_num == 1 then
				door_rand = DW_Rand(door_num)
				if ReadRoleValue ( ctrlAI , EM_RoleValue_Register3 ) == 0 then
					local PPL = SetSearchAllPlayer(RoomID )
					for i = 1 , PPL , 1 do  
						local ID = GetSearchResult()
						if ReadRoleValue( ID , EM_RoleValue_RoomID  ) == RoomID then
							if CountBodyItem ( ID, 530860 ) == 0 then
								GiveBodyItem( ID, 530860, 1 )
							end
						end	
					end
				end
			end
			if ReadRoleValue ( ctrlAI , EM_RoleValue_Register4 ) == 0 then
				local PPL = SetSearchAllPlayer(RoomID )
				for i = 1 , PPL , 1 do
					local ID = GetSearchResult()
					if ReadRoleValue( ID , EM_RoleValue_RoomID  ) == RoomID then
						if CountBodyItem ( ID, 530859 ) == 0 then
							GiveBodyItem( ID, 530859, 1 )
						end
					end	
				end
			end
			WriteRoleValue ( ctrlAI , EM_RoleValue_Register4 , 0 )
			local ch_door=CreateObjByFlag( 105040, flag_table[door_No] , 10 , 1 )
			SetModeEx( ch_door , EM_SetModeType_Mark, false)
			SetModeEx( ch_door , EM_SetModeType_ShowRoleHead, false) 	
			SetModeEx( ch_door , EM_SetModeType_Obstruct, true) 
			SetModeEx( ch_door , EM_SetModeType_Strikback, false) ---����
			SetModeEx( ch_door , EM_SetModeType_Move, false) ---����	
			SetModeEx( ch_door , EM_SetModeType_Fight, false) ---�i���
			SetModeEx( ch_door , EM_SetModeType_SearchenemyIgnore, false) 
			SetModeEx( ch_door , EM_SetModeType_Searchenemy, false)
			AddToPartition(ch_door,RoomID)
			WriteRoleValue ( ch_door , EM_RoleValue_Register1 , flag_table[door_No] )
			WriteRoleValue ( ch_door , EM_RoleValue_Register2 , Chuansong_table[door_rand] )
			BeginPlot( ch_door , "cl_z22_ChangeBoss" , 0 ) -----��t�T�w�ʧ@�μ@��
			WriteRoleValue ( ctrlAI , EM_RoleValue_Register1 , 0 )
			table.remove ( Chuansong_table , door_rand ) ---�p�G�ƪ��ܴN�N�L�qtable������
			ScriptMessage( ctrlAI , -1 , 2 ,"[SC_Z22_BOX_CHUANSONG]" , 2 ) ----��ܿ��~�X�{�Ǫ�
		end
	end
end
function cl_Z22_BOX_ctrlAI()
	local ctrlAI = OwnerID()
	local RoomID = ReadRoleValue( ctrlAI , EM_RoleValue_RoomID ) ---�ŧi�o�Ӧa��~�O�ڲ{�bŪ�쪺�a��
	local ctrl_boss = ReadRoleValue( ctrlAI , EM_RoleValue_PID ) ---�ŧi�o�Ӧa��~�O�ڲ{�bŪ�쪺�a��
	local flag_num = ReadRoleValue ( ctrlAI , EM_RoleValue_Register1 )
	local cord_rand = ReadRoleValue ( ctrlAI , EM_RoleValue_Register2 )
	local door_open = 0
	local Box_flag = {}
	local Box_table = {}
	Box_table[1] = 119670
	Box_table[2] = 119671
	Box_table[3] = 119672
	Box_table[4] = 119673
	Box_table[5] = 119674
	Box_table[6] = 119675
	Box_table[7] = 119676
	Box_table[8] = 119677
	Box_table[9] = 119678
	local flag_table = {}
	flag_table[1] = 781037  ---1
	flag_table[2] = 781038  ---2
	flag_table[3] = 781039  ---3
	flag_table[4] = 781040  ---4
	local cord_table = {}
	cord_table[1] = { 1 , 2 , 3 }
	cord_table[2] = { 4 , 5 , 6 }
	cord_table[3] = { 7 , 8 , 9 }
	cord_table[4] = { 1 , 4 , 7 }
	cord_table[5] = { 2 , 5 , 8 }
	cord_table[6] = { 3 , 6 , 9 }
	cord_table[7] = { 1 , 5 , 9 }
	cord_table[8] = { 3 , 5 , 7 }
	local Box_num=table.getn(Box_table) ----���X��������ƶq
	for i = 1 , Box_num , 1 do
		Box_flag[i] = CreateObjByFlag( Box_table[i] , flag_table[flag_num] , i , 1 ) ------------for�j�鲣�ͥ|�Ӭ�s��
		SetModeEx( Box_flag[i] , EM_SetModeType_Strikback, false) ---����(�_)
		SetModeEx( Box_flag[i] , EM_SetModeType_Move, false) ---����	(�_)
		SetModeEx( Box_flag[i] , EM_SetModeType_Searchenemy, false)--����(�_)
		SetModeEx( Box_flag[i] , EM_SetModeType_Mark, true)			---�i�I��(�O)
		SetModeEx( Box_flag[i] , EM_SetModeType_ShowRoleHead, true) 		---�Y����(�O)
		SetModeEx( Box_flag[i] , EM_SetModeType_Fight, false) ---�i���(�O)
		SetModeEx( Box_flag[i] , EM_SetModeType_NotShowHPMP , true) ----����ܼg��
		AddToPartition ( Box_flag[i] , RoomID ) ----����[�J����,�Ҧ椽��
		WriteRoleValue ( Box_flag[i] , EM_RoleValue_PID , ctrlAI )
		for x = 1 , 3 , 1 do
			if i ==  cord_table[cord_rand][x] then
				WriteRoleValue ( Box_flag[i] , EM_RoleValue_Register1 , 1 )
			end
		end
	end
	while 1 do
		sleep ( 5 )
		local door_open = ReadRoleValue ( ctrlAI , EM_RoleValue_Register3 )
		if door_open == 3 then
			WriteRoleValue ( ctrl_boss , EM_RoleValue_Register1 , 1 )
			WriteRoleValue ( ctrl_boss , EM_RoleValue_Register2 , flag_num )
			WriteRoleValue ( ctrlAI , EM_RoleValue_Register3 , 4 )
		end
	end
end
function cl_z22_box_Ai()
	local play = OwnerID()
	local BOX = TargetID()
	if ReadRoleValue( BOX , EM_RoleValue_Register2 ) == 0 then
		SetSpeakDetail(play , GetString("SC_Z22_BOX_ITEM_01") )
		AddSpeakOption( play , BOX , "[SC_Z22_BOX_ITEM_02]", "cl_z22_addbuff", 0 ) ----
		if ReadRoleValue ( play , EM_RoleValue_VOC ) == 0 then
			local yes_or_NO = ReadRoleValue ( BOX , EM_RoleValue_Register1 )
			if yes_or_NO == 1 then
				say ( play , "it's this" )
			elseif yes_or_NO ~= 1 then
				say ( play , "not's this" )
			end
		end
	elseif ReadRoleValue( BOX , EM_RoleValue_Register2 ) == 1 then ---����
		SetSpeakDetail( play , GetString("SC_Z22_BOX_ITEM_YES") )
	elseif ReadRoleValue( BOX , EM_RoleValue_Register2 ) == 2 then ---����
		SetSpeakDetail( play , GetString("SC_Z22_BOX_ITEM_NO"))
	end
end
function cl_z22_addbuff()
	local play = OwnerID()
	local BOX = TargetID()
	local ctrlAI = ReadRoleValue( BOX , EM_RoleValue_PID ) ---�ŧi�o�Ӧa��~�O�ڲ{�bŪ�쪺�a��
	local ctrlBoss = ReadRoleValue ( ctrlAI , EM_RoleValue_PID )
	local yes_or_NO = ReadRoleValue ( BOX , EM_RoleValue_Register1 )
	PlayMotion ( play, ruFUSION_ACTORSTATE_EMOTE_KICK )
	sleep ( 5 )
	if yes_or_NO == 1 then
		ScriptMessage( BOX , -1 , 2 ,"[SC_Z22_BOX_SAY_YES]" , 2 ) ----��ܥ��T�X�{�S��
		WriteRoleValue ( BOX , EM_RoleValue_Register2 , 1 )
		local door_open = ReadRoleValue ( ctrlAI , EM_RoleValue_Register3 )
		WriteRoleValue ( ctrlAI , EM_RoleValue_Register3 , door_open+1 )
		Addbuff (  BOX , 621095 , 0 ,-1 )
		CloseSpeak( play )
	elseif yes_or_NO ~= 1 then
		ScriptMessage( BOX , -1 , 2 ,"[SC_Z22_BOX_SAY_NO]" , 2 ) ----��ܿ��~�X�{�Ǫ�
		WriteRoleValue ( ctrlBoss , EM_RoleValue_Register3 , 1 )
		WriteRoleValue ( ctrlBoss , EM_RoleValue_Register4 , 1 )
		CallPlot( ctrlAI, "cl_z22_Produce_Monster", 0 )
		CloseSpeak( play )
		WriteRoleValue ( BOX , EM_RoleValue_Register2 , 2 )
	end
end
function cl_z22test_delobj()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ---�ŧi�o�Ӧa��~�O�ڲ{�bŪ�쪺�a��
	local Box_table = {}
	Box_table[1] = 119670
	Box_table[2] = 119671
	Box_table[3] = 119672
	Box_table[4] = 119673
	Box_table[5] = 119674
	Box_table[6] = 119675
	Box_table[7] = 119676
	Box_table[8] = 119677
	Box_table[9] = 119678
	Box_table[10] = 105040
	local Box_num = table.getn(Box_table) ----���X��������ƶq
	local ThesePlayer = {}
	local TempPlayer = SetSearchAllNPC(RoomID)----��ϰ�Ҧ����a
	for i=1,TempPlayer do ---TempPlayer����ƶq�N��for�j��n���X��
		ThesePlayer[i] = GetSearchResult() --�N��쪺���aGID�Ȯɦs��o�ӭȤ�
		for X = 1 , Box_num , 1 do
			if ReadRoleValue ( ThesePlayer[i] , EM_RoleValue_OrgID ) == Box_table[X] then
				delobj ( ThesePlayer[i] )
			end
		end
	end
end
function cl_z22_ChangeBoss()
	local door = OwnerID()
	local RoomID = ReadRoleValue( door , EM_RoleValue_RoomID ) ---�ŧi�o�Ӧa��~�O�ڲ{�bŪ�쪺�a��
	local flag = ReadRoleValue ( door , EM_RoleValue_Register1 )
	local Chuansong = ReadRoleValue ( door , EM_RoleValue_Register2 )
	local ch_door=CreateObjByFlag( 105040, Chuansong , 13 , 1 )
	SetModeEx( ch_door , EM_SetModeType_Mark, false)
	SetModeEx( ch_door , EM_SetModeType_ShowRoleHead, false) 	
	SetModeEx( ch_door , EM_SetModeType_Obstruct, true) 
	SetModeEx( ch_door , EM_SetModeType_Strikback, false) ---����
	SetModeEx( ch_door , EM_SetModeType_Move, false) ---����	
	SetModeEx( ch_door , EM_SetModeType_Fight, false) ---�i���
	SetModeEx( ch_door , EM_SetModeType_SearchenemyIgnore, false) 
	SetModeEx( ch_door , EM_SetModeType_Searchenemy, false)
	AddToPartition(ch_door,RoomID)
	WriteRoleValue ( ch_door , EM_RoleValue_Register1 , flag )
	SetPlot( door,"collision","cl_z22_in_door",30 )
	SetPlot( ch_door,"collision","cl_z22_out_door",30 )
end
function cl_z22_in_door() ---�ǹL�h
	local play = OwnerID()
	local door = TargetID()
	local RoomID = ReadRoleValue( door , EM_RoleValue_RoomID ) ---�ŧi�o�Ӧa��~�O�ڲ{�bŪ�쪺�a��
	local flag = ReadRoleValue ( door , EM_RoleValue_Register1 )
	local Chuansong = ReadRoleValue ( door , EM_RoleValue_Register2 )
	SetPosByFlag( play , Chuansong , 14 )
end
function cl_z22_out_door() --�Ǧ^��
	local play = OwnerID()
	local door = TargetID()
	local RoomID = ReadRoleValue( door , EM_RoleValue_RoomID ) ---�ŧi�o�Ӧa��~�O�ڲ{�bŪ�쪺�a��
	local flag = ReadRoleValue ( door , EM_RoleValue_Register1 )
	local Chuansong = ReadRoleValue ( door , EM_RoleValue_Register2 )
	SetPosByFlag( play , flag , 11 )
end
function cl_z22_Produce_Monster()
	local ctrlAI = OwnerID()
	local RoomID = ReadRoleValue( ctrlAI , EM_RoleValue_RoomID ) ---�ŧi�o�Ӧa��~�O�ڲ{�bŪ�쪺�a��
	local MapID = ReadRoleValue( ctrlAI , EM_RoleValue_ZoneID ) ---�ŧi�o�Ӧa��~�O�ڲ{�bŪ�쪺�a��
	local flag_num = ReadRoleValue ( ctrlAI , EM_RoleValue_Register1 )
	local ZoneID = {}
	ZoneID[144] = 106427
	ZoneID[145] = 106747
	ZoneID[37] = 106427
	local flag_table = {}
	flag_table[1] = 781037  ---1
	flag_table[2] = 781038  ---2
	flag_table[3] = 781039  ---3
	flag_table[4] = 781040  ---4
	for i = 1 , 4 , 1 do
		local Monster = CreateObjByFlag( ZoneID[MapID], flag_table[flag_num] , i+14 , 1 )
		AddToPartition( Monster , RoomID )
		say( Monster , "[SC_Z22_BOX_NO_MONSTER]" )
	end	
end