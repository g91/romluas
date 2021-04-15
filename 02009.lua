function Lua_Hao_Item_SOP_NPC() -- ���b����NPC�W���@��

	local Owner = OwnerID();
	local Target = TargetID();
	local RoomID = ReadRoleValue( Owner, EM_RoleValue_RoomID )
	local Month = GetSystime(3)+1	-- Ū���{�b���
	local Date = GetSystime(4)	-- Ū���{�b��� (1)���� (2)���� (3)+1 ���� (4)���ѡ@�w�]�� 4
	local SysTime = Month*100+Date	-- �t�ήɶ� �̤p��� 101 ( 1��1�� ) �̤j��� 1231 ( 12��31�� )

	local PlayerLv = ReadRoleValue( Owner, EM_RoleValue_LV );
	local OrgID = ReadRoleValue ( Target, EM_RoleValue_OrgID );

	NpcDialog( Target, Owner );  --�ˬdNPC�P���a���Z��

	if OrgID == 115808 then --�C��e1�Ӫ��~A
		local ID = GetDBKeyValue("ItemID_00")	-- ���~ID
		local Count = GetDBKeyValue("ItemAmount_00")	-- ���~�ƶq
		local Lv = GetDBKeyValue("Lvlimit_00")	-- ����ݨD����
		PlayMotion( Target, 254 ) -- ���i�y
		if Lv > PlayerLv then
			SetSpeakDetail( Owner, "[SC_ITEM_SOP_04][$SETVAR1="..Lv.."]" )	
		--	������~���ݨD�D¾���Ŭ��G<CM>[$VAR1]</CM>...
		else
			SetSpeakDetail( Owner, "[SC_ITEM_SOP_00][$SETVAR1=".."["..ID.."]".."][$SETVAR2="..Count.."]" )
		--	�����ذe�����~��<CM>[$VAR1]</CM><CY>[$VAR2]</CY>��...
			AddSpeakOption( Owner, Target, "[SC_422367_1]" , "Lua_Hao_Sop_Daily_Articles_Basic_1", 0 )
		end
	elseif OrgID == 115809 then --�C��e1�Ӫ��~B
		local ID = GetDBKeyValue("ItemID_01")	-- ���~ID
		local Count = GetDBKeyValue("ItemAmount_01")	-- ���~�ƶq
		local Lv = GetDBKeyValue("Lvlimit_01")	-- ����ݨD����
		PlayMotion( Target, 251 ) -- �c��§��
		if Lv > PlayerLv then
			SetSpeakDetail( Owner, "[SC_ITEM_SOP_04][$SETVAR1="..Lv.."]" )	
		--	������~���ݨD�D¾���Ŭ��G<CY>[$VAR1]</CY>...
		else
			SetSpeakDetail( Owner, "[SC_ITEM_SOP_00][$SETVAR1=".."["..ID.."]".."][$SETVAR2="..Count.."]" )
		--	�����ذe�����~��<CM>[$VAR1]</CM><CY>[$VAR2]</CY>��...
			AddSpeakOption( Owner, Target, "[SC_422367_1]" , "Lua_Hao_Sop_Daily_Articles_Basic_2", 0 )
		end
	elseif OrgID == 115810 then --�C��e2�Ӫ��~
		local ID = GetDBKeyValue("ItemID_02")			-- �Ĥ@�Ӫ��~ID
		local ID2 = GetDBKeyValue("ItemID_02_1")		-- �ĤG�Ӫ��~ID
		local Count = GetDBKeyValue("ItemAmount_02")		-- �Ĥ@�Ӫ��~�ƶq
		local Count2 = GetDBKeyValue("ItemAmount_02_1")	-- �ĤG�Ӫ��~�ƶq
		local Lv = GetDBKeyValue("Lvlimit_02")			-- ����ݨD����
		PlayMotion( Target, 108 ) -- �ѯ�
		if Lv > PlayerLv then
			SetSpeakDetail( Owner, "[SC_ITEM_SOP_04][$SETVAR1="..Lv.."]" )	
		--	������~���ݨD�D¾���Ŭ��G<CY>[$VAR1]</CY>�A�бz�F���o�ӱ����A�L�ӧa�I
		else
			SetSpeakDetail( Owner, "[SC_ITEM_SOP_02][$SETVAR1=".."["..ID.."]".."][$SETVAR2="..Count.."][$SETVAR3=".."["..ID2.."]".."][$SETVAR4="..Count2.."]" )
		--	�����ذe�����~��<CM>[$VAR1]</CM><CY>[$VAR2]</CY>�Ӥ�<CM>[$VAR3]</CM><CY>[$VAR4]</CY>�ӡA�A�n�{�b����ܡH
			AddSpeakOption( Owner, Target, "[SC_422367_1]" , "Lua_Hao_Sop_Daily_Articles_Basic_3", 0 )
		end
	elseif OrgID == 115811 then --�C��e3�Ӫ��~
		local ID = GetDBKeyValue("ItemID_03")			-- �Ĥ@�Ӫ��~ID
		local ID2 = GetDBKeyValue("ItemID_03_1")		-- �ĤG�Ӫ��~ID
		local ID3 = GetDBKeyValue("ItemID_03_2")		-- �ĤT�Ӫ��~ID
		local Count = GetDBKeyValue("ItemAmount_03")		-- �Ĥ@�Ӫ��~�ƶq
		local Count2 = GetDBKeyValue("ItemAmount_03_1")	-- �ĭӪ��~�ƶq
		local Count3 = GetDBKeyValue("ItemAmount_03_2")	-- �ĤT�Ӫ��~�ƶq
		local Lv = GetDBKeyValue("Lvlimit_03")			-- ����ݨD����
		PlayMotion( Target, 106 ) -- �I�Y
		if Lv > PlayerLv then
			SetSpeakDetail( Owner, "[SC_ITEM_SOP_04][$SETVAR1="..Lv.."]" )
		--	������~���ݨD�D¾���Ŭ��G<CY>[$VAR1]</CY>�A�бz�F���o�ӱ����A�L�ӧa�I
		else
			SetSpeakDetail( Owner, "[SC_ITEM_SOP_03][$SETVAR1=".."["..ID.."]".."][$SETVAR2="..Count.."][$SETVAR3=".."["..ID2.."]".."][$SETVAR4="..Count2.."][$SETVAR5=".."["..ID3.."]".."][$SETVAR6="..Count3.."]" )
		--	�����ذe�����~��<CM>[$VAR1]</CM><CY>[$VAR2]</CY>�ӡB<CM>[$VAR3]</CM><CY>[$VAR4]</CY>�Ӥ�<CM>[$VAR5]</CM><CY>[$VAR6]</CY>�ӡA�A�n�{�b����ܡH
			AddSpeakOption( Owner, Target, "[SC_422367_1]" , "Lua_Hao_Sop_Daily_Articles_Basic_4", 0 )
		end
	elseif OrgID == 115812 then --�HA��B ���1
		local LowestLv = GetDBKeyValue("ExLowestLv_00");	-- �I���̧C�ݨD����
		local HighestLv = GetDBKeyValue("ExHighestLv_00");	-- �I���̰��ݨD����
		local ID = GetDBKeyValue("ExItemID_00")			-- �I�X�����~ID
		local Count = GetDBKeyValue("ExItemAmount_00")		-- �I�X�����~�ƶq
		local RID = GetDBKeyValue("ExReturnGoods_00")			-- �o�쪺���~ID
		local RCount = GetDBKeyValue("ExReturnAmount_00")		-- �o�쪺���~�ƶq
		local AccountBarter = GetDBKeyValue("ExBarterlimit_00")		-- ���a�b��������W���q
		local ServerBarter = GetDBKeyValue("ExServerBarterlimit_00")	-- ���A��������W���q
		local Switch = ReadRoleValue( Target, EM_RoleValue_Register+3 )			-- Ū���}�����]�w��-- �t�X���A������}��
		local NPCTime = ReadRoleValue( Target, EM_RoleValue_Register+4 )			-- Ū��NPC���W�̫�@���P���a�I�����ɶ�
		local PlayerTime = ReadAccountFlagValue( Owner, EM_AccountFlag_CE_Date5_12 , 12 )	-- Ū�����a���W�̫�@���PNPC�I�����ɶ�

		if LowestLv > 0 and HighestLv > 0 then
			if PlayerLv < LowestLv or PlayerLv > HighestLv then	-- �z���D¾���ť������󦹰϶��~�ŦX�ϥθ��G<CY>[$VAR1]</CY> ~ <CY>[$VAR2]</CY>
				PlayMotion( Target, 107 )	-- �n�Y
				SetSpeakDetail( Owner, "[SC_ITEM_SOP_45][$SETVAR1="..LowestLv.."][$SETVAR2="..HighestLv.."]" );
				return;
			end
		end

		if NPCTime == 0 then	-- �즸�I���ɡA�ӭȥ����s
			WriteRoleValue( Target, EM_RoleValue_Register+4 , SysTime )
		end

		if PlayerTime == 0 then	-- �즸�I���ɡA�ӭȥ����s
			WriteAccountFlagValue( Owner, EM_AccountFlag_CE_Date5_12 , 12 , SysTime )
		end

		if Switch == 0 then		-- Reg3 NPC �}��
			WriteRoleValue( Target, EM_RoleValue_Register+2 , ServerBarter )		-- �g�J���A��������W���q
			WriteRoleValue( Target, EM_RoleValue_Register+3 , 1 )				-- �}�Ҷ}��1
		elseif Switch == 1 and SysTime ~= NPCTime then
			WriteRoleValue( Target, EM_RoleValue_Register+2 , ServerBarter )	-- ���s�g�J���A��������W���q
			WriteRoleValue( Target, EM_RoleValue_Register+4 , SysTime )
		end

		if SysTime ~= PlayerTime then	-- �C��P�_�A�������a�b�����������
			WriteAccountFlagValue( Owner, EM_AccountFlag_CE_Count5_8 , 8 , AccountBarter )	-- ���s�g�J���a�b��������W���q
			WriteAccountFlagValue( Owner, EM_AccountFlag_CE_Date5_12 , 12 , SysTime )
		end
  	
		local Freetrade =  ReadAccountFlagValue( Owner, EM_AccountFlag_CE_Count5_8 , 8 )	-- ���a�b�����W��������W���q
		local Servertrade = ReadRoleValue( Target, EM_RoleValue_Register+2 )			-- NPC���W�����A��������W���q

		PlayMotion( Target, 112 ) -- ��
		SetSpeakDetail( Owner, "[SC_ITEM_SOP_12][$SETVAR1="..Count.."][$SETVAR2=".."["..ID.."]".."][$SETVAR5="..RCount.."][$SETVAR6=".."["..RID.."]".."][SC_ITEM_SOP_07][$SETVAR3="..Freetrade.."][SC_ITEM_SOP_11][$SETVAR4="..Servertrade.."]" )
		-- �A�T�w�n��<CY>[$VAR1]</CY>��<CM>[$VAR2]</CM>�I��<CY>[$VAR5]</CY>��<CM>[$VAR6]</CM>�ܡH
		-- �C��i�I�������ٳѤU�G<CY>[$VAR3]</CY>
		-- ���A���C��i�I�������ٳѤU�G<CY>[$VAR4]<CY>
		AddSpeakOption( Owner, Target, "[SC_111284_6]" , "Lua_Hao_Sop_Barter_Basic_1" , 0 )
----------- 2011.04.11 �s�W�HA��B ���2�B�HA��B�BC�B�HA��B�BC�BD
	elseif OrgID == 115817 then --�HA��B ���2
		local LowestLv = GetDBKeyValue("ExLowestLv_01");	-- �I���̧C�ݨD����
		local HighestLv = GetDBKeyValue("ExHighestLv_01");	-- �I���̰��ݨD����
		local ID = GetDBKeyValue("ExItemID_01")			-- �I�X�����~ID
		local Count = GetDBKeyValue("ExItemAmount_01")		-- �I�X�����~�ƶq
		local RID = GetDBKeyValue("ExReturnGoods_01")			-- �o�쪺���~ID
		local RCount = GetDBKeyValue("ExReturnAmount_01")		-- �o�쪺���~�ƶq
		local AccountBarter = GetDBKeyValue("ExBarterlimit_01")		-- ���a�b��������W���q
		local ServerBarter = GetDBKeyValue("ExServerBarterlimit_01")	-- ���A��������W���q
		local Switch = ReadRoleValue( Target, EM_RoleValue_Register+3 )			-- Ū���}�����]�w��-- �t�X���A������}��
		local NPCTime = ReadRoleValue( Target, EM_RoleValue_Register+4 )			-- Ū��NPC���W�̫�@���P���a�I�����ɶ�
		local PlayerTime = ReadAccountFlagValue( Owner, EM_AccountFlag_CE_Date6_12 , 12 )	-- Ū�����a���W�̫�@���PNPC�I�����ɶ�

		if LowestLv > 0 and HighestLv > 0 then
			if PlayerLv < LowestLv or PlayerLv > HighestLv then	-- �z���D¾���ť������󦹰϶��~�ŦX�ϥθ��G<CY>[$VAR1]</CY> ~ <CY>[$VAR2]</CY>
				PlayMotion( Target, 107 )	-- �n�Y
				SetSpeakDetail( Owner, "[SC_ITEM_SOP_45][$SETVAR1="..LowestLv.."][$SETVAR2="..HighestLv.."]" );
				return;
			end
		end

		if NPCTime == 0 then	-- �즸�I���ɡA�ӭȥ����s
			WriteRoleValue( Target, EM_RoleValue_Register+4 , SysTime )
		end

		if PlayerTime == 0 then	-- �즸�I���ɡA�ӭȥ����s
			WriteAccountFlagValue( Owner, EM_AccountFlag_CE_Date6_12 , 12 , SysTime )
		end

		if Switch == 0 then		-- Reg3 NPC �}��
			WriteRoleValue( Target, EM_RoleValue_Register+2 , ServerBarter )	-- �g�J���A��������W���q
			WriteRoleValue( Target, EM_RoleValue_Register+3 , 1 )			-- �}�Ҷ}��1
		elseif Switch == 1 and SysTime ~= NPCTime then
			WriteRoleValue( Target, EM_RoleValue_Register+2 , ServerBarter )	-- ���s�g�J���A��������W���q
			WriteRoleValue( Target, EM_RoleValue_Register+4 , SysTime )
		end

		if SysTime ~= PlayerTime then	-- �C��P�_�A�������a�b�����������
			WriteAccountFlagValue( Owner, EM_AccountFlag_CE_Count6_8 , 8 , AccountBarter )	-- ���s�g�J���a�b��������W���q
			WriteAccountFlagValue( Owner, EM_AccountFlag_CE_Date6_12 , 12 , SysTime )
		end
  	
		local Freetrade =  ReadAccountFlagValue( Owner, EM_AccountFlag_CE_Count6_8 , 8 )	-- ���a�b�����W��������W���q
		local Servertrade = ReadRoleValue( Target, EM_RoleValue_Register+2 )			-- NPC���W�����A��������W���q

		PlayMotion( Target, 112 ) -- ��
		SetSpeakDetail( Owner, "[SC_ITEM_SOP_12][$SETVAR1="..Count.."][$SETVAR2=".."["..ID.."]".."][$SETVAR5="..RCount.."][$SETVAR6=".."["..RID.."]".."][SC_ITEM_SOP_07][$SETVAR3="..Freetrade.."][SC_ITEM_SOP_11][$SETVAR4="..Servertrade.."]" )
		-- �A�T�w�n��<CY>[$VAR1]</CY>��<CM>[$VAR2]</CM>�I��<CY>[$VAR3]</CY>��<CM>[$VAR4]</CM>�ܡH
		-- �C��i�I�������ٳѤU�G<CY>[$VAR3]</CY>
		-- ���A���C��i�I�������ٳѤU�G<CY>[$VAR4]<CY>
		AddSpeakOption( Owner, Target, "[SC_111284_6]" , "Lua_Hao_Sop_Barter_Basic_2" , 0 )
	elseif OrgID == 115825 then --�HA��B�BC
		local LowestLv = GetDBKeyValue("ExLowestLv_02");	-- �I���̧C�ݨD����
		local HighestLv = GetDBKeyValue("ExHighestLv_02");	-- �I���̰��ݨD����
		local ID = GetDBKeyValue("ExItemID_02")			-- �I�X�����~A_ID
		local Count = GetDBKeyValue("ExItemAmount_02")		-- �I�X�����~A_�ƶq
		local RID_1 = GetDBKeyValue("ExReturnGoods_02")		-- �o�쪺���~B_ID
		local RCount_1 = GetDBKeyValue("ExReturnAmount_02")		-- �o�쪺���~B_�ƶq
		local RID_2 = GetDBKeyValue("ExReturnGoods_02_1")		-- �o�쪺���~C_ID
		local RCount_2 = GetDBKeyValue("ExReturnAmount_02_1")	-- �o�쪺���~C_�ƶq
		local AccountBarter = GetDBKeyValue("ExBarterlimit_02")		-- ���a�b��������W���q
		local ServerBarter = GetDBKeyValue("ExServerBarterlimit_02")	-- ���A��������W���q
		local Switch = ReadRoleValue( Target, EM_RoleValue_Register+3 )			-- Ū���}�����]�w��-- �t�X���A������}��
		local NPCTime = ReadRoleValue( Target, EM_RoleValue_Register+4 )			-- Ū��NPC���W�̫�@���P���a�I�����ɶ�
		local PlayerTime = ReadAccountFlagValue( Owner, EM_AccountFlag_CE_Date7_12 , 12 )	-- Ū�����a���W�̫�@���PNPC�I�����ɶ�

		if LowestLv > 0 and HighestLv > 0 then
			if PlayerLv < LowestLv or PlayerLv > HighestLv then	-- �z���D¾���ť������󦹰϶��~�ŦX�ϥθ��G<CY>[$VAR1]</CY> ~ <CY>[$VAR2]</CY>
				PlayMotion( Target, 107 )	-- �n�Y
				SetSpeakDetail( Owner, "[SC_ITEM_SOP_45][$SETVAR1="..LowestLv.."][$SETVAR2="..HighestLv.."]" );
				return;
			end
		end

		if NPCTime == 0 then	-- �즸�I���ɡA�ӭȥ����s
			WriteRoleValue( Target, EM_RoleValue_Register+4 , SysTime )
		end
		if PlayerTime == 0 then	-- �즸�I���ɡA�ӭȥ����s
			WriteAccountFlagValue( Owner, EM_AccountFlag_CE_Date7_12 , 12 , SysTime )
		end

		if Switch == 0 then		-- Reg3 NPC �}��
			WriteRoleValue( Target, EM_RoleValue_Register+2 , ServerBarter )	-- �g�J���A��������W���q
			WriteRoleValue( Target, EM_RoleValue_Register+3 , 1 )			-- �}�Ҷ}��1
		elseif Switch == 1 and SysTime ~= NPCTime then
			WriteRoleValue( Target, EM_RoleValue_Register+2 , ServerBarter )	-- ���s�g�J���A��������W���q
			WriteRoleValue( Target, EM_RoleValue_Register+4 , SysTime )
		end

		if SysTime ~= PlayerTime then	-- �C��P�_�A�������a�b�����������
			WriteAccountFlagValue( Owner, EM_AccountFlag_CE_Count7_8 , 8 , AccountBarter )	-- ���s�g�J���a�b��������W���q
			WriteAccountFlagValue( Owner, EM_AccountFlag_CE_Date7_12 , 12 , SysTime )
		end
  	
		local Freetrade =  ReadAccountFlagValue( Owner, EM_AccountFlag_CE_Count7_8 , 8 )	-- ���a�b�����W��������W���q
		local Servertrade = ReadRoleValue( Target, EM_RoleValue_Register+2 )			-- NPC���W�����A��������W���q

		PlayMotion( Target, 112 ) -- ��
		SetSpeakDetail( Owner, "[SC_ITEM_SOP_54][$SETVAR1="..Count.."][$SETVAR2=".."["..ID.."]".."][$SETVAR5="..RCount_1.."][$SETVAR6=".."["..RID_1.."]".."][$SETVAR7="..RCount_2.."][$SETVAR8=".."["..RID_2.."]".."][SC_ITEM_SOP_07][$SETVAR3="..Freetrade.."][SC_ITEM_SOP_11][$SETVAR4="..Servertrade.."]" )
		-- �A�T�w�n��<CY>[$VAR1]</CY>��<CM>[$VAR2]</CM>�I��<CY>[$VAR5]</CY>��<CM>[$VAR6]</CM>�B<CY>[$VAR7]</CY>��<CM>[$VAR8]</CM>�ܡH
		-- �C��i�I�������ٳѤU�G<CY>[$VAR3]</CY>
		-- ���A���C��i�I�������ٳѤU�G<CY>[$VAR4]<CY>
		AddSpeakOption( Owner, Target, "[SC_111284_6]" , "Lua_Hao_Sop_Barter_Basic_3" , 0 )
	elseif OrgID == 116067 then --�HA��B�BC�BD
		local LowestLv = GetDBKeyValue("ExLowestLv_03");	-- �I���̧C�ݨD����
		local HighestLv = GetDBKeyValue("ExHighestLv_03");	-- �I���̰��ݨD����
		local ID = GetDBKeyValue("ExItemID_03")			-- �I�X�����~A_ID
		local Count = GetDBKeyValue("ExItemAmount_03")		-- �I�X�����~A_�ƶq
		local RID_1 = GetDBKeyValue("ExReturnGoods_03")		-- �o�쪺���~B_ID
		local RCount_1 = GetDBKeyValue("ExReturnAmount_03")		-- �o�쪺���~B_�ƶq
		local RID_2 = GetDBKeyValue("ExReturnGoods_03_1")		-- �o�쪺���~C_ID
		local RCount_2 = GetDBKeyValue("ExReturnAmount_03_1")	-- �o�쪺���~C_�ƶq
		local RID_3 = GetDBKeyValue("ExReturnGoods_03_2")		-- �o�쪺���~D_ID
		local RCount_3 = GetDBKeyValue("ExReturnAmount_03_2")	-- �o�쪺���~D_�ƶq
		local AccountBarter = GetDBKeyValue("ExBarterlimit_03")		-- ���a�b��������W���q
		local ServerBarter = GetDBKeyValue("ExServerBarterlimit_03")	-- ���A��������W���q
		local Switch = ReadRoleValue( Target, EM_RoleValue_Register+3 )			-- Ū���}�����]�w��-- �t�X���A������}��
		local NPCTime = ReadRoleValue( Target, EM_RoleValue_Register+4 )			-- Ū��NPC���W�̫�@���P���a�I�����ɶ�
		local PlayerTime = ReadAccountFlagValue( Owner, EM_AccountFlag_CE_Date8_12 , 12 )	-- Ū�����a���W�̫�@���PNPC�I�����ɶ�

		if LowestLv > 0 and HighestLv > 0 then
			if PlayerLv < LowestLv or PlayerLv > HighestLv then	-- �z���D¾���ť������󦹰϶��~�ŦX�ϥθ��G<CY>[$VAR1]</CY> ~ <CY>[$VAR2]</CY>
				PlayMotion( Target, 107 )	-- �n�Y
				SetSpeakDetail( Owner, "[SC_ITEM_SOP_45][$SETVAR1="..LowestLv.."][$SETVAR2="..HighestLv.."]" );
				return;
			end
		end

		if NPCTime == 0 then	-- �즸�I���ɡA�ӭȥ����s
			WriteRoleValue( Target, EM_RoleValue_Register+4 , SysTime )
		end
		if PlayerTime == 0 then	-- �즸�I���ɡA�ӭȥ����s
			WriteAccountFlagValue( Owner, EM_AccountFlag_CE_Date8_12 , 12 , SysTime )
		end

		if Switch == 0 then		-- Reg3 NPC �}��
			WriteRoleValue( Target, EM_RoleValue_Register+2 , ServerBarter )	-- �g�J���A��������W���q
			WriteRoleValue( Target, EM_RoleValue_Register+3 , 1 )			-- �}�Ҷ}��1
		elseif Switch == 1 and SysTime ~= NPCTime then
			WriteRoleValue( Target, EM_RoleValue_Register+2 , ServerBarter )	-- ���s�g�J���A��������W���q
			WriteRoleValue( Target, EM_RoleValue_Register+4 , SysTime )
		end

		if SysTime ~= PlayerTime then	-- �C��P�_�A�������a�b�����������
			WriteAccountFlagValue( Owner, EM_AccountFlag_CE_Count8_8 , 8 , AccountBarter )	-- ���s�g�J���a�b��������W���q
			WriteAccountFlagValue( Owner, EM_AccountFlag_CE_Date8_12 , 12 , SysTime )
		end
  	
		local Freetrade =  ReadAccountFlagValue( Owner, EM_AccountFlag_CE_Count8_8 , 8 )	-- ���a�b�����W��������W���q
		local Servertrade = ReadRoleValue( Target, EM_RoleValue_Register+2 )			-- NPC���W�����A��������W���q

		PlayMotion( Target, 112 ) -- ��
		SetSpeakDetail( Owner, "[SC_ITEM_SOP_55][$SETVAR1="..Count.."][$SETVAR2=".."["..ID.."]".."][$SETVAR5="..RCount_1.."][$SETVAR6=".."["..RID_1.."]".."][$SETVAR7="..RCount_2.."][$SETVAR8=".."["..RID_2.."]".."][$SETVAR9="..RCount_3.."][$SETVAR10=".."["..RID_3.."]".."][SC_ITEM_SOP_07][$SETVAR3="..Freetrade.."][SC_ITEM_SOP_11][$SETVAR4="..Servertrade.."]" )
		-- �A�T�w�n��<CY>[$VAR1]</CY>��<CM>[$VAR2]</CM>�I��<CY>[$VAR5]</CY>��<CM>[$VAR6]</CM>�B<CY>[$VAR7]</CY>��<CM>[$VAR8]</CM>�B<CY>[$VAR9]</CY>��<CM>[$VAR10]</CM>�ܡH
		-- �C��i�I�������ٳѤU�G<CY>[$VAR3]</CY>
		-- ���A���C��i�I�������ٳѤU�G<CY>[$VAR4]<CY>
		AddSpeakOption( Owner, Target, "[SC_111284_6]" , "Lua_Hao_Sop_Barter_Basic_4" , 0 )
	elseif OrgID == 115813 then --�����I�����p
		local Money = GetDBKeyValue("Money_00")
		local Diamond = GetDBKeyValue("Diamond_00")
		local Freetrade_00 = GetDBKeyValue("Freetrade_00")					-- ���a�b��������W���q
		local Servertrade_00 = GetDBKeyValue("Servertrade_00")				-- ���A��������W���q
		local Weektrade_00 = GetDBKeyValue("Weektrade_00")				-- ���A���}�� / ��������W���q
		local Pass_00 = ReadRoleValue( Target, EM_RoleValue_PID )
		local Keyitem =  544050								-- �C�����I�����p�C��X��
		local Switch = ReadRoleValue( Target, EM_RoleValue_Register+3 )			-- Ū���}�����]�w��-- �t�X���A������}��
		local WeekSwitch = GetWorldVar( "SC_ITEM_SOP_100" )				-- Ū���}�����]�w��-- �t�X���A���}�� / ��������W���q
		local NPCTime = ReadRoleValue( Target, EM_RoleValue_Register+4 )			-- Ū��NPC���W�̫�@���P���a�I�����ɶ�
		local PlayerTime = ReadAccountFlagValue( Owner, EM_AccountFlag_CE_Date1_12 , 12 )	-- Ū�����a���W�̫�@���PNPC�I�����ɶ�
		-- Reg1 NPC(�w�I)������}��
		-- Reg2 NPC ���A��������W���q
		-- Reg3 NPC ����}��
		-- Reg4 NPC �ɶ��O���X��

		if NPCTime == 0 then		-- �즸�I���ɡA�ӭȥ����s
			WriteRoleValue( Target, EM_RoleValue_Register+4 , SysTime )
		end

		if PlayerTime == 0 then	-- �즸�I���ɡA�ӭȥ����s
			WriteAccountFlagValue( Owner, EM_AccountFlag_CE_Date1_12 , 12 , SysTime )
		end

		if Switch == 0 then		-- Reg3 NPC �}��
			WriteRoleValue( Target, EM_RoleValue_Register+2 , Servertrade_00 )	-- �g�J���A��������W���q
			WriteRoleValue( Target, EM_RoleValue_Register+3 , 1 )			-- �}�Ҷ}��1
		elseif Switch == 1 and SysTime ~= NPCTime then
			WriteRoleValue( Target, EM_RoleValue_Register+2 , Servertrade_00 )	-- ���s�g�J���A��������W���q
			WriteRoleValue( Target, EM_RoleValue_Register+4 , SysTime )
		end

		if WeekSwitch == 0 then
			SetWorldVar( "SC_ITEM_SOP_100" , Weektrade_00+100 )
		end

---------2010/08/17 �H�����a����@�����I�����p
		local Flag = ReadRoleValue( Owner, EM_RoleValue_UnTrust_Flag )
	--	DebugMsg( 0 , RoomID ,"Flag = "..Flag )
		local UnTrust = {}
		for i = 0 , 31 do	-- �G�i��
			if checkbit( Flag , i ) == true then
				UnTrust[i] = 1
			else
				UnTrust[i] = 0
			end
		--	DebugMsg( 0 , RoomID ,"UnTrust ["..i.."] = "..UnTrust[i] )
		end
		if UnTrust[Trusted_Player_Flag_Design1] == 1 then	-- 2^16
			SetSpeakDetail( Owner, "[SYS_GAMEMSGEVENT_704]" ) -- �A���b���ثe�L�k�ϥΦ��\��C 
			DebugMsg( 0 , RoomID ,"UnTrust is online" )
			return false
		end
---------
		if Pass_00 == 1 then
			if SysTime ~= PlayerTime then	-- �C��P�_�A�������a�b�����������
				WriteAccountFlagValue( Owner, EM_AccountFlag_CE_Count1_8 , 8 , Freetrade_00 )
				WriteAccountFlagValue( Owner, EM_AccountFlag_CE_Date1_12 , 12 , SysTime )
			end
  		
			local Freetrade =  ReadAccountFlagValue( Owner, EM_AccountFlag_CE_Count1_8 , 8 )	-- ���a�b�����W��������W���q
			local Servertrade = ReadRoleValue( Target, EM_RoleValue_Register+2 )		-- NPC���W�����A��������W���q
			local Weektrade = GetWorldVar( "SC_ITEM_SOP_100" ) - 100				-- �����A��������(�i��Zone)

			PlayMotion( Target, 253 ) -- ���ꦡ��§
			SetSpeakDetail( Owner, "[SC_ITEM_SOP_05][$SETVAR1="..Money.."][$SETVAR2="..Diamond.."][SC_ITEM_SOP_07][$SETVAR3="..Freetrade.."][SC_ITEM_SOP_11][$SETVAR4="..Servertrade.."][SC_ITEM_SOP_13][$SETVAR5="..Weektrade.."]" )
			-- �A�T�w�n��<CY>[$VAR1]</CY><CM>[200000]</CM>�I��<CY>[$VAR2]</CY><CM>[200003]</CM>�ܡH

			AddSpeakOption( Owner, Target, "[SC_111284_6]" , "Lua_Hao_Sop_MandD_Trade_Basic_1" , 0 )
		else
			if SysTime ~= PlayerTime then	-- �C��P�_�A�������a�b�����������
				WriteAccountFlagValue( Owner, EM_AccountFlag_CE_Count1_8 , 8 , Freetrade_00 )
				WriteAccountFlagValue( Owner, EM_AccountFlag_CE_Date1_12 , 12 , SysTime )
			end
			SetSpeakDetail( Owner, "[SC_ITEM_SOP_10]" )	-- �I���A�ȩ|���}�l�A�бz�@�ߵ��ݬ��ʶ}��C
		end
	elseif OrgID == 115814 then --���p�I������
		local Money = GetDBKeyValue("Money_01")
		local Diamond = GetDBKeyValue("Diamond_01")
		local Freetrade_01 = GetDBKeyValue("Freetrade_01")					-- ���a�b�����W���q
		local Servertrade_01 = GetDBKeyValue("Servertrade_01")					-- ���A��������W���q
		local Weektrade_01 = GetDBKeyValue("Weektrade_01")				-- ���A���}�� / ��������W���q
		local Pass_01 = ReadRoleValue( Target, EM_RoleValue_PID )
		local Keyitem =  544051									-- �C�����I�����p�C��X��
		local Switch = ReadRoleValue( Target, EM_RoleValue_Register+3 )			-- Ū���}�����]�w��-- �t�X���A������}��
		local WeekSwitch = GetWorldVar( "SC_ITEM_SOP_101" )				-- Ū���}�����]�w��-- �t�X���A���}�� / ��������W���q
		local NPCTime = ReadRoleValue( Target, EM_RoleValue_Register+4 )			-- Ū��NPC���W�̫�@���P���a�I�����ɶ�
		local PlayerTime = ReadAccountFlagValue( Owner, EM_AccountFlag_CE_Date2_12 , 12 )	-- Ū�����a���W�̫�@���PNPC�I�����ɶ�

		if NPCTime == 0 then		-- �즸�I���ɡA�ӭȥ����s
			WriteRoleValue( Target, EM_RoleValue_Register+4 , SysTime )
		end

		if PlayerTime == 0 then	-- �즸�I���ɡA�ӭȥ����s
			WriteAccountFlagValue( Owner, EM_AccountFlag_CE_Date2_12 , 12 , SysTime )
		end

		if Switch == 0 then		-- Reg3 NPC �}��
			WriteRoleValue( Target, EM_RoleValue_Register+2 , Servertrade_01 )		-- �g�J���A��������W���q
			WriteRoleValue( Target, EM_RoleValue_Register+3 , 1 )			-- �}�Ҷ}��1
		elseif Switch == 1 and SysTime ~= NPCTime then
			WriteRoleValue( Target, EM_RoleValue_Register+2 , Servertrade_01 )	-- ���s�g�J���A��������W���q
			WriteRoleValue( Target, EM_RoleValue_Register+4 , SysTime )
		end

		if WeekSwitch == 0 then
			SetWorldVar( "SC_ITEM_SOP_101" , Weektrade_01+100 )
		end

		-- �L�k�ϥδ��p�I������
		local Flag = ReadRoleValue( Owner, EM_RoleValue_UnTrust_Flag )
	--	DebugMsg( 0 , RoomID ,"Flag = "..Flag )
		local UnTrust = {}
		for i = 0 , 31 do	-- �G�i��
			if checkbit( Flag , i ) == true then
				UnTrust[i] = 1
			else
				UnTrust[i] = 0
			end
		--	DebugMsg( 0 , RoomID ,"UnTrust ["..i.."] = "..UnTrust[i] )
		end
		if UnTrust[Trusted_Player_Flag_Design2] == 1 then	-- 2^17
			SetSpeakDetail( Owner, "[SYS_GAMEMSGEVENT_704]" ) -- �A���b���ثe�L�k�ϥΦ��\��C 
			DebugMsg( 0 , RoomID ,"UnTrust is online" )
			return
		end
---------
		if Pass_01 == 1 then
			if SysTime ~= PlayerTime then	-- �C��P�_�A�������a�b�����������
				WriteAccountFlagValue( Owner, EM_AccountFlag_CE_Count2_8 , 8 , Freetrade_01 )
				WriteAccountFlagValue( Owner, EM_AccountFlag_CE_Date2_12 , 12 , SysTime )
			end
  		
			local Freetrade =  ReadAccountFlagValue( Owner, EM_AccountFlag_CE_Count2_8 , 8 )	-- ���a�b�����W��������W���q
			local Servertrade = ReadRoleValue( Target, EM_RoleValue_Register+2 )		-- NPC���W�����A��������W���q
			local Weektrade = GetWorldVar( "SC_ITEM_SOP_101" ) - 100				-- �����A��������(�i��Zone)

			PlayMotion( Target, 112 ) -- ��e
			SetSpeakDetail( Owner, "[SC_ITEM_SOP_06][$SETVAR1="..Diamond.."][$SETVAR2="..Money.."][SC_ITEM_SOP_07][$SETVAR3="..Freetrade.."][SC_ITEM_SOP_11][$SETVAR4="..Servertrade.."][SC_ITEM_SOP_13][$SETVAR5="..Weektrade.."]" )
			-- �A�T�w�n��<CY>[$VAR1]</CY><CM>[200003]</CM>�I��<CY>[$VAR2]</CY><CM>[200000]</CM>�ܡH

			AddSpeakOption( Owner, Target, "[SC_111284_6]" , "Lua_Hao_Sop_MandD_Trade_Basic_2" , 0 )
		else
			if SysTime ~= PlayerTime then	-- �C��P�_�A�������a�b�����������
				WriteAccountFlagValue( Owner, EM_AccountFlag_CE_Count2_8 , 8 , Freetrade_01 )
				WriteAccountFlagValue( Owner, EM_AccountFlag_CE_Date2_12 , 12 , SysTime )
			end
			SetSpeakDetail( Owner, "[SC_ITEM_SOP_10]" )	-- �I���A�ȩ|���}�l�A�бz�@�ߵ��ݬ��ʶ}��C
		end

	elseif OrgID == 115815 then	-- Zone2 NPC �����I�����p
		local Money = GetDBKeyValue("Money_11")
		local Diamond = GetDBKeyValue("Diamond_11")
		local Freetrade_11 = GetDBKeyValue("Freetrade_11")		-- ���a�b��������W���q
		local Servertrade_11 = GetDBKeyValue("Servertrade_11")		-- ���A��������W���q
		local Weektrade_00 = GetDBKeyValue("Weektrade_00")		-- ���A���}�� / ��������W���q
		local Keyitem =  544052						-- �C�����I�����p�C��X��
		local Pass = GetDBKeyValue("Pass_11")				-- Zone2 �����I�������p - �I���}�� 1���i�I�� 0�����i
		local Switch = ReadRoleValue( Target, EM_RoleValue_Register+3 )			-- Ū���}�����]�w��-- �t�X���A������}��
		local WeekSwitch = GetWorldVar( "SC_ITEM_SOP_100" )				-- Ū���}�����]�w��-- �t�X���A���}�� / ��������W���q
		local NPCTime = ReadRoleValue( Target, EM_RoleValue_Register+4 )			-- Ū��NPC���W�̫�@���P���a�I�����ɶ�
		local PlayerTime = ReadAccountFlagValue( Owner, EM_AccountFlag_CE_Date3_12 , 12 )	-- Ū�����a���W�̫�@���PNPC�I�����ɶ�

		if NPCTime == 0 then	-- �즸�I���ɡA�ӭȥ����s
			WriteRoleValue( Target, EM_RoleValue_Register+4 , SysTime )
		end

		if PlayerTime == 0 then	-- �즸�I���ɡA�ӭȥ����s
			WriteAccountFlagValue( Owner, EM_AccountFlag_CE_Date3_12 , 12 , SysTime )
		end

		if Switch == 0 then		-- Reg3 NPC �}��
			WriteRoleValue( Target, EM_RoleValue_Register+2 , Servertrade_11 )		
			WriteRoleValue( Target, EM_RoleValue_Register+3 , 1 )				-- �}�Ҷ}��1
		elseif Switch == 1 and SysTime ~= NPCTime then
			WriteRoleValue( Target, EM_RoleValue_Register+2 , Servertrade_11 )	-- ���s�g�J���A��������W���q
			WriteRoleValue( Target, EM_RoleValue_Register+4 , SysTime )
		end

		if WeekSwitch == 0 then
			SetWorldVar( "SC_ITEM_SOP_100" , Weektrade_00+100 )
		end

---------2010/08/17 �H�����a����@�����I�����p
		-- �L�k�ϥΪ����I�����p
		local Flag = ReadRoleValue( Owner, EM_RoleValue_UnTrust_Flag )
	--	DebugMsg( 0 , RoomID ,"Flag = "..Flag )
		local UnTrust = {}
		for i = 0 , 31 do	-- �G�i��
			if checkbit( Flag , i ) == true then
				UnTrust[i] = 1
			else
				UnTrust[i] = 0
			end
		--	DebugMsg( 0 , RoomID ,"UnTrust ["..i.."] = "..UnTrust[i] )
		end
		if UnTrust[Trusted_Player_Flag_Design1] == 1 then	-- 2^16
			SetSpeakDetail( Owner, "[SYS_GAMEMSGEVENT_704]" ) -- �A���b���ثe�L�k�ϥΦ��\��C 
			DebugMsg( 0 , RoomID ,"UnTrust is online" )
			return false
		end
---------
		WriteRoleValue( Target, EM_RoleValue_PID , Pass )

		local Pass_11 = ReadRoleValue ( Target, EM_RoleValue_PID )		-- Zone2 �����I�������p - �I���}�� 1���i�I�� 0�����i
		local Pass_11_1 = ReadRoleValue( Target, EM_RoleValue_Register+1 )	-- Zone2 �����I�������p - ���~���}�� 0���i�I�� 1�����i

		if Pass_11 == 1 and Pass_11_1 == 0 then
			if SysTime ~= PlayerTime then	-- �C��P�_�A�������a�b�����������
				WriteAccountFlagValue( Owner, EM_AccountFlag_CE_Count3_8 , 8 , Freetrade_11 )
				WriteAccountFlagValue( Owner, EM_AccountFlag_CE_Date3_12 , 12 , SysTime )
			end
  		
			local Freetrade =  ReadAccountFlagValue( Owner, EM_AccountFlag_CE_Count3_8 , 8 )	-- ���a�b�����W��������W���q
			local Servertrade = ReadRoleValue( Target, EM_RoleValue_Register+2 )		-- NPC���W�����A��������W���q
			local Weektrade = GetWorldVar( "SC_ITEM_SOP_100" ) - 100				-- �����A��������(�i��Zone)

  			PlayMotion( Target, 253 ) -- ���ꦡ��§
			SetSpeakDetail( Owner, "[SC_ITEM_SOP_05][$SETVAR1="..Money.."][$SETVAR2="..Diamond.."][SC_ITEM_SOP_07][$SETVAR3="..Freetrade.."][SC_ITEM_SOP_11][$SETVAR4="..Servertrade.."][SC_ITEM_SOP_13][$SETVAR5="..Weektrade.."]" )
			-- �A�T�w�n��<CY>[$VAR1]</CY><CM>[200000]</CM>�I��<CY>[$VAR2]</CY><CM>[200003]</CM>�ܡH
			AddSpeakOption( Owner, Target, "[SC_111284_6]" , "Lua_Hao_Sop_MandD_Trade_Basic_3" , 0 )
		else
			if SysTime ~= PlayerTime then	-- �C��P�_�A�������a�b�����������
				WriteAccountFlagValue( Owner, EM_AccountFlag_CE_Count3_8 , 8 , Freetrade_11 )
				WriteAccountFlagValue( Owner, EM_AccountFlag_CE_Date3_12 , 12 , SysTime )
			end
			SetSpeakDetail( Owner, "[SC_ITEM_SOP_10]" )	-- �I���A�ȩ|���}�l�A�бz�@�ߵ��ݬ��ʶ}��C
		end
	elseif OrgID == 115816 then	-- Zone2 NPC ���p�I������
		local Money = GetDBKeyValue("Money_12")
		local Diamond = GetDBKeyValue("Diamond_12")
		local Freetrade_12 = GetDBKeyValue("Freetrade_12")					-- ���a���������
		local Servertrade_12 = GetDBKeyValue("Servertrade_12")				-- ���A��������W���q
		local Weektrade_01 = GetDBKeyValue("Weektrade_01")				-- ���A���}�� / ��������W���q
		local Pass = GetDBKeyValue("Pass_12")							-- Zone2 ���p�I�������� - �I���}�� 1���i�I�� 0�����i
		local Keyitem =  544053								-- �C�����I�����p�C��X��(���ϥ�)
		local Switch = ReadRoleValue( Target, EM_RoleValue_Register+3 )			-- Ū���}�����]�w��-- �t�X���A������}��
		local WeekSwitch = GetWorldVar( "SC_ITEM_SOP_101" )				-- Ū���}�����]�w��-- �t�X���A���}�� / ��������W���q
		local NPCTime = ReadRoleValue( Target, EM_RoleValue_Register+4 )			-- Ū��NPC���W�̫�@���P���a�I�����ɶ�
		local PlayerTime = ReadAccountFlagValue( Owner, EM_AccountFlag_CE_Date4_12 , 12 )	-- Ū�����a���W�̫�@���PNPC�I�����ɶ�

			if NPCTime == 0 then	-- �즸�I���ɡA�ӭȥ����s
				WriteRoleValue( Target, EM_RoleValue_Register+4 , SysTime )
			end
			if PlayerTime == 0 then	-- �즸�I���ɡA�ӭȥ����s
				WriteAccountFlagValue( Owner, EM_AccountFlag_CE_Date4_12 , 12 , SysTime )
			end

		if Switch == 0 then		-- Reg3 NPC �}��
			WriteRoleValue( Target, EM_RoleValue_Register+2 , Servertrade_12 )		-- �g�J���A��������W���q
			WriteRoleValue( Target, EM_RoleValue_Register+3 , 1 )				-- �}�Ҷ}��1
		elseif Switch == 1 and SysTime ~= NPCTime then
			WriteRoleValue( Target, EM_RoleValue_Register+2 , Servertrade_12 )	-- ���s�g�J���A��������W���q
			WriteRoleValue( Target, EM_RoleValue_Register+4 , SysTime )
		end

		if WeekSwitch == 0 then
			SetWorldVar( "SC_ITEM_SOP_101" , Weektrade_01+100 )
		end

---------2010/08/17 �H�����a����@���p�I������
		-- �L�k�ϥδ��p�I������
		local Flag = ReadRoleValue( Owner, EM_RoleValue_UnTrust_Flag )
	--	DebugMsg( 0 , RoomID ,"Flag = "..Flag )
		local UnTrust = {}
		for i = 0 , 31 do	-- �G�i��
			if checkbit( Flag , i ) == true then
				UnTrust[i] = 1
			else
				UnTrust[i] = 0
			end
		--	DebugMsg( 0 , RoomID ,"UnTrust ["..i.."] = "..UnTrust[i] )
		end
		if UnTrust[Trusted_Player_Flag_Design2] == 1 then	-- 2^17
			SetSpeakDetail( Owner, "[SYS_GAMEMSGEVENT_704]" ) -- �A���b���ثe�L�k�ϥΦ��\��C 
			DebugMsg( 0 , RoomID ,"UnTrust is online" )
			return
		end
---------
		WriteRoleValue( Target, EM_RoleValue_PID , Pass )
		local Pass_12 = ReadRoleValue ( Target, EM_RoleValue_PID )			-- Zone2 ���p�I�������� - �I���}�� 1���i�I�� 0�����i
		local Pass_12_1 = ReadRoleValue( Target, EM_RoleValue_Register+1 )		-- Zone2 ���p�I�������� - ���~���}�� 0���i�I�� 1�����i

		if Pass_12 == 1 and Pass_12_1 == 0 then
			if SysTime ~= PlayerTime then	-- �C��P�_�A�������a�b�����������
				WriteAccountFlagValue( Owner, EM_AccountFlag_CE_Count4_8 , 8 , Freetrade_12 )
				WriteAccountFlagValue( Owner, EM_AccountFlag_CE_Date4_12 , 12 , SysTime )
			end
  		
			local Freetrade =  ReadAccountFlagValue( Owner, EM_AccountFlag_CE_Count4_8 , 8 )	-- ���a�b�����W��������W���q
			local Servertrade = ReadRoleValue( Target, EM_RoleValue_Register+2 )		-- NPC���W�����A��������W���q
			local Weektrade = GetWorldVar( "SC_ITEM_SOP_101" ) - 100				-- �����A��������(�i��Zone)

			PlayMotion( Target, 112 ) -- ��
			SetSpeakDetail( Owner, "[SC_ITEM_SOP_06][$SETVAR1="..Diamond.."][$SETVAR2="..Money.."][SC_ITEM_SOP_07][$SETVAR3="..Freetrade.."][SC_ITEM_SOP_11][$SETVAR4="..Servertrade.."][SC_ITEM_SOP_13][$SETVAR5="..Weektrade.."]" )
			-- �A�T�w�n��<CY>[$VAR1]</CY><CM>[200003]</CM>�I��<CY>[$VAR2]</CY><CM>[200000]</CM>�ܡH
			AddSpeakOption( Owner, Target, "[SC_111284_6]" , "Lua_Hao_Sop_MandD_Trade_Basic_4" , 0 )
		else
			if SysTime ~= PlayerTime then	-- �C��P�_�A�������a�b�����������
				WriteAccountFlagValue( Owner, EM_AccountFlag_CE_Count4_8 , 8 , Freetrade_12 )
				WriteAccountFlagValue( Owner, EM_AccountFlag_CE_Date4_12 , 12 , SysTime )
			end
			SetSpeakDetail( Owner, "[SC_ITEM_SOP_10] " )	-- �I���A�ȩ|���}�l�A�бz�@�ߵ��ݬ��ʶ}��C
		end
	end
end
----------------------------------------------------------------------------------------------------------------