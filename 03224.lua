function NpcDialog( Npc, ObjID )	-- ���V�P�����Z��

	AdjustFaceDir( Npc, ObjID, 0 ); -- ���V
	PlayMotion( Npc, 112 );	-- ��
	local RangeCheck = CheckBuff( ObjID, 621751 );	-- �����Z�� 621751
	SysCastSpellLv( Npc, ObjID, 496587, 0 );	-- �����Z���k�N���X�A�I�� 621751

	if RangeCheck== false then
		CallPlot( ObjID, "Lua_Hao_Item_SOP_Ranger", 50 );	-- �ˬdNPC�P���a���Z��
	end
end

-----------------------------------------------------------------------------------------------------------
--/gm ? pcall %s_id "Hao_SetItemExchange(String,Amount)"
function Hao_SetItemExchange(String,Amount)	-- �]�w(���m)�u��G�b���C��BServer �C��(�Ӱϰ줺���I��Npc)�BServer �C�P���I������

	local Owner = OwnerID();
	local Room = ReadRoleValue( Owner, EM_RoleValue_RoomID );

	if not Amount or Amount < 0 then
		if String == -1 then
			Lua_Hao_Item_SOP_Reset_Player();
			Lua_Hao_Item_SOP_Reset_Server();
			Lua_Hao_Test_Week1();
			DebugMsg( Owner, Room, "Account, Server daily, and Server weekly limit has been reset." );
		elseif String == 1 then
			Lua_Hao_Item_SOP_Reset_Player();
			DebugMsg( Owner, Room, "Account limit has been reset." );
		elseif String == 2 then
			Lua_Hao_Item_SOP_Reset_Server();
			DebugMsg( Owner, Room, "Server daily limit has been reset." );
		elseif String == 3 then
			Lua_Hao_Test_Week1();
			DebugMsg( Owner, Room, "Server weekly limit has been reset." );
		end
		return
	end

	if String == -1 then
		Lua_Hao_Item_SOP_Reset_Player(Amount);
		Lua_Hao_Item_SOP_Reset_Server(Amount);
		Lua_Hao_Test_Week0(Amount);
		DebugMsg( Owner, Room, "Account, Server daily, and Server weekly limit has been set to a "..Amount );
	elseif String == 1 then
		Lua_Hao_Item_SOP_Reset_Player(Amount);
		DebugMsg( Owner, Room, "Account limit been set to a "..Amount );
	elseif String == 2 then
		Lua_Hao_Item_SOP_Reset_Server(Amount);
		DebugMsg( Owner, Room, "Server daily limit has been set to a "..Amount );
	elseif String == 3 then
		Lua_Hao_Test_Week0(Amount);
		DebugMsg( Owner, Room, "Server weekly limit has been set to a "..Amount );
	else
		DebugMsg( Owner, Room, "Entry error!" );
	end
end

function Hao_Test_20150714()

	local Owner = OwnerID();
--[[
	Say( Owner, "Date14 = "..EM_AccountFlag_CE_Date14_12 );
	Say( Owner, "Count14 = "..EM_AccountFlag_CE_Count14_8 );
	Say( Owner, "Date15 = "..EM_AccountFlag_CE_Date15_12 );
	Say( Owner, "Count15 = "..EM_AccountFlag_CE_Count15_8 );
	Say( Owner, "Date16 = "..EM_AccountFlag_CE_Date16_12 );
	Say( Owner, "Count16 = "..EM_AccountFlag_CE_Count16_8 );
	Say( Owner, "Date17 = "..EM_AccountFlag_CE_Date17_12 );
	Say( Owner, "Count17 = "..EM_AccountFlag_CE_Count17_8 );
	Say( Owner, "Date18 = "..EM_AccountFlag_CE_Date18_12 );
	Say( Owner, "Count18 = "..EM_AccountFlag_CE_Count18_8 );
	Say( Owner, "String = ".."SC_ITEM_SOP_20"..(1+4) )

	local g_Info = {};
	for i = 1, 5 do	-- ����`��
		g_Info[i] = {};
		g_Info[i].SysDate = EM_RoleValue_Register+(2*(i-1))	-- �t�ήɶ�
		g_Info[i].Date = EM_AccountFlag_CE_Date14_12+(20*(i-1))	-- ���a���W�̫�@���P Npc �I�����ɶ�
		g_Info[i].DailyAccountAmount = EM_AccountFlag_CE_Count14_8+(20*(i-1))	-- ���a�b�����I���W���q
		g_Info[i].DailyServerAmount = EM_RoleValue_Register+(2*(i-1)+1)	-- ���A���C��I���W���A�O���� Npc ���W
		g_Info[i].WeeklyServerAmount = "SC_ITEM_SOP_20"..(i+4)	-- Server �C�P�I����e�Ѿl�ƶq
		
		g_Info[i].DailyAccountLimit = GetDBKeyValue("Plus_"..(i+10).."_DailyAccountLimit");	-- ���a�b���C��I���W���q
		g_Info[i].DailyServerLimit = GetDBKeyValue("Plus_"..(i+10).."_DailyServerLimit");	-- Server �C��I���W���q
		g_Info[i].WeeklyServerLimit = GetDBKeyValue("Plus_"..(i+10).."_WeeklyServerLimit");	-- Server �C�P�I���W���q
		
	--	g_Info[i].Gift = g_Gift[i];	-- �P�_���ذe�ΧI��
	--	g_Info[i].LowestLv = g_LowestLv[i];	-- �ݨD�̧C����
	--	g_Info[i].HighestLv = g_HighestLv[i];	-- �ݨD�̰�����
	--	g_Info[i].Status = g_Status[i];	-- ��I�f���ƶq
	--	g_Info[i].ExStatus = g_ExStatus[i];	-- �I���f���ƶq
		g_Info[i].Log = 12414900+(i*10);	-- �W�u�ɥ��
		g_Info[i].DailyLimitLog = 12414901+(i*10);	-- ���A���C��ܤW����
		g_Info[i].WeeklyLimitLog = 12414902+(i*10);	-- ���A���C�P�ܤW����
	--	for Index, Value in pairs(g_Info[i]) do
	--		Say( Owner, Index.." = "..Value );
	--	end
	end
--]]
	local g_Currency = {};
	for i = 1, 1 do	-- ��׼ƶq
		g_Currency[i] = {};
		g_Currency[i] = {};
		g_Currency[i].PhiriusShell = {};
		g_Currency[i].EnergyJustice = {};
		g_Currency[i].Dreamland = {};
		g_Currency[i].Ancient = {};
		g_Currency[i].ProofMyth = {};
		g_Currency[i].PhiriusShell.switch = GetDBKeyValue("Plus_"..(i+10).."_PhiriusShell");	-- �����B�ꨩ
		g_Currency[i].PhiriusShell.quantity = GetDBKeyValue("Plus_"..(i+10).."_PhiriusShellQuantity");	-- �����B�ꨩ�ƶq
		g_Currency[i].EnergyJustice.switch = GetDBKeyValue("Plus_"..(i+10).."_EnergyJustice");	-- ���q��q
		g_Currency[i].EnergyJustice.quantity = GetDBKeyValue("Plus_"..(i+10).."_EnergyJusticeQuantity");	-- ���q��q�ƶq
		g_Currency[i].Dreamland.switch = GetDBKeyValue("Plus_"..(i+10).."_Dreamland");	-- �ڹҥ����L�O
		g_Currency[i].Dreamland.quantity = GetDBKeyValue("Plus_"..(i+10).."_DreamlandQuantity");	-- �ڹҥ����L�O�ƶq
		g_Currency[i].Ancient.switch = GetDBKeyValue("Plus_"..(i+10).."_Ancient");	-- �j�N��
		g_Currency[i].Ancient.quantity = GetDBKeyValue("Plus_"..(i+10).."_AncientQuantity");	-- �j�N�򪫼ƶq
		g_Currency[i].ProofMyth.switch = GetDBKeyValue("Plus_"..(i+10).."_ProofMyth");	-- �ǩ_����
		g_Currency[i].ProofMyth.quantity = GetDBKeyValue("Plus_"..(i+10).."_ProofMythQuantity");	-- �ǩ_���Ҽƶq
		-- ���o��I�f�����M��
		Say( Owner, "Running" );
		for Index, Value in pairs(g_Currency[i]) do
			local Pay = {};
		--	Say( Owner, "Index = "..Index.." , switch = "..Value.switch.." , quantity = "..Value.quantity );
			if Value.switch > 0 and Value.quantity > 0 then
				Pay.index = index;
				Pay.quantity = Value.quantity;
				table.insert( g_Status[i], Pay );
				g_Gift[i] = false;
				g_StatusCount[i] = g_StatusCount[i] + 1;
			end
		end
	end

	local g_CurrencyInfo = {};
	g_CurrencyInfo.PhiriusShell = { EM_RoleValue_PhiriusShellCoin, 11, 1000, "[SYS_MONEY_TYPE_11]", "Phirius Shell" };	-- �����B�ꨩ
	g_CurrencyInfo.EnergyJustice = { EM_RoleValue_EnergyJusticeCoin, 12, -1, "[SYS_MONEY_TYPE_12]", "Energy of Justice" };	-- ���q��q
	g_CurrencyInfo.Dreamland = { EM_RoleValue_DreamlandCoin, 10, -1, "[SYS_MONEY_TYPE_10]", "Dreamland Pioneer Sigil" };	-- �ڹҥ����L�O
	g_CurrencyInfo.Ancient = { EM_RoleValue_RelicsCoin, 9, 10000, "[SYS_MONEY_TYPE_9]", "Ancient Mementos" };	-- �j�N��
	g_CurrencyInfo.ProofMyth = { EM_RoleValue_ProofLegendCoin, 13, -1, "[SYS_MONEY_TYPE_13]", "Proof of Myth" };	-- �ǩ_����

	Say( Owner, "Count = "..#g_CurrencyInfo );
end

function Hao_Test_20150714_1()

	local Owner = OwnerID();
	--  �f��Define�B�f���s���B�f���W��(-1�ɬ��L�W��)�B�f���r��B�f��½Ķ -- 
	local g_CurrencyInfo = {};
	g_CurrencyInfo[1] = { EM_RoleValue_PhiriusShellCoin, 11, 1000, "[SYS_MONEY_TYPE_11]", "Phirius Shell" };	-- �����B�ꨩ
	g_CurrencyInfo[2] = { EM_RoleValue_EnergyJusticeCoin, 12, -1, "[SYS_MONEY_TYPE_12]", "Energy of Justice" };	-- ���q��q
	g_CurrencyInfo[3] = { EM_RoleValue_DreamlandCoin, 10, -1, "[SYS_MONEY_TYPE_10]", "Dreamland Pioneer Sigil" };	-- �ڹҥ����L�O
	g_CurrencyInfo[4] = { EM_RoleValue_RelicsCoin, 9, 10000, "[SYS_MONEY_TYPE_9]", "Ancient Mementos" };	-- �j�N��
	g_CurrencyInfo[5] = { EM_RoleValue_ProofLegendCoin, 13, -1, "[SYS_MONEY_TYPE_13]", "Proof of Myth" };	-- �ǩ_����
	-- �ŧi��I�P�I���f�����M�� ----------------------------------------
	local g_Status = {};	-- ��X���~���(�}���B�ƶq)
	local g_ExStatus = {};	-- �I�����~���(�}���B�ƶq)
	local g_StatusCount = {};-- �� DesignLog �����I�Ÿ���Ǥ�
	local g_ExStatusCount = {};-- �� DesignLog �����I�Ÿ���Ǥ�
	local g_Gift = {};	-- �P�_�O�ؤ��ΧI��
	
	for i = 1, #g_CurrencyInfo do	-- ��l��
		g_Status[i] = {};
		g_ExStatus[i] = {};
		g_StatusCount[i] = 0;
		g_ExStatusCount[i] = 0;
		g_Gift[i] = true;
	end
--[[
	-- ���o LogView ����I�f�����]�w ---------------------------------
	local g_Currency = {};
	for i = 1, #g_CurrencyInfo do	-- ��׼ƶq
	
		g_Currency[i] = {};
		g_Currency[i][1] = {};
		g_Currency[i][2] = {};
		g_Currency[i][3] = {};
		g_Currency[i][4] = {};
		g_Currency[i][5] = {};
	
		g_Currency[i][1].switch = GetDBKeyValue("Plus_"..(i+10).."_PhiriusShell");	-- �����B�ꨩ
		g_Currency[i][2].switch = GetDBKeyValue("Plus_"..(i+10).."_EnergyJustice");	-- ���q��q
		g_Currency[i][3].switch = GetDBKeyValue("Plus_"..(i+10).."_Dreamland");	-- �ڹҥ����L�O
		g_Currency[i][4].switch = GetDBKeyValue("Plus_"..(i+10).."_Ancient");	-- �j�N��
		g_Currency[i][5].switch = GetDBKeyValue("Plus_"..(i+10).."_ProofMyth");	-- �ǩ_����
	
		g_Currency[i][1].quantity = GetDBKeyValue("Plus_"..(i+10).."_PhiriusShellQuantity");	-- �����B�ꨩ�ƶq
		g_Currency[i][2].quantity = GetDBKeyValue("Plus_"..(i+10).."_EnergyJusticeQuantity");	-- ���q��q�ƶq
		g_Currency[i][3].quantity = GetDBKeyValue("Plus_"..(i+10).."_DreamlandQuantity");	-- �ڹҥ����L�O�ƶq
		g_Currency[i][4].quantity = GetDBKeyValue("Plus_"..(i+10).."_AncientQuantity");	-- �j�N�򪫼ƶq
		g_Currency[i][5].quantity = GetDBKeyValue("Plus_"..(i+10).."_ProofMythQuantity");	-- �ǩ_���Ҽƶq
	
		-- ���o��I�f�����M��
		for Index, Value in ipairs(g_Currency[i]) do
			local Pay = {};
			Say( Owner, "Index = "..Index..", switch = "..Value.switch.." , quantity = "..Value.quantity );
			if Value.switch > 0 and Value.quantity > 0 then
				Pay.index = index;
				Pay.quantity = Value.quantity;
				table.insert( g_Status[i], Pay );
				g_Gift[i] = false;
				g_StatusCount[i] = g_StatusCount[i] + 1;
			end
		end
	end
--]]

	-- �P�_��׼ƶq------------------------------------------------
	local g_Program = 0;	-- �H������ ����`�q�W�L�ƼƮɡA�|�s�W�@�h�D�ؿ����
	local g_ProgramStatus = {};	-- �קK�t�ӳ]�w��׸����ɡA�禡���ê����D(Ĵ�p�t�ӨϥΤ�� 2 3 5�A�������L��� 1 4 )
	
	-- ���o LogView ���I���f�����]�w ---------------------------------
	local g_ExCurrency = {};
	for i = 1, #g_CurrencyInfo do	-- ��׼ƶq
	
		g_ExCurrency[i] = {};
		g_ExCurrency[i][1] = {};
		g_ExCurrency[i][2] = {};
		g_ExCurrency[i][3] = {};
		g_ExCurrency[i][4] = {};
		g_ExCurrency[i][5] = {};
	
		g_ExCurrency[i][1].switch = GetDBKeyValue("Plus_"..(i+10).."_ExPhiriusShell");	-- �����B�ꨩ
		g_ExCurrency[i][2].switch = GetDBKeyValue("Plus_"..(i+10).."_ExEnergyJustice");	-- ���q��q
		g_ExCurrency[i][3].switch = GetDBKeyValue("Plus_"..(i+10).."_ExDreamland");	-- �ڹҥ����L�O
		g_ExCurrency[i][4].switch = GetDBKeyValue("Plus_"..(i+10).."_ExAncient");	-- �j�N��
		g_ExCurrency[i][5].switch = GetDBKeyValue("Plus_"..(i+10).."_ExProofMyth");	-- �ǩ_����
	
		g_ExCurrency[i][1].quantity = GetDBKeyValue("Plus_"..(i+10).."_ExPhiriusShellQuantity");	-- �����B�ꨩ�ƶq
		g_ExCurrency[i][2].quantity = GetDBKeyValue("Plus_"..(i+10).."_ExEnergyJusticeQuantity");	-- ���q��q�ƶq
		g_ExCurrency[i][3].quantity = GetDBKeyValue("Plus_"..(i+10).."_ExDreamlandQuantity");	-- �ڹҥ����L�O�ƶq
		g_ExCurrency[i][4].quantity = GetDBKeyValue("Plus_"..(i+10).."_ExAncientQuantity");	-- �j�N�򪫼ƶq
		g_ExCurrency[i][5].quantity = GetDBKeyValue("Plus_"..(i+10).."_ExProofMythQuantity");	-- �ǩ_���Ҽƶq

		g_ProgramStatus[i] = 0;
		-- ���o�I���f�����M��
		for Index, Value in ipairs(g_ExCurrency[i]) do
		--	Say( Owner, "ExIndex = "..Index..", switch = "..Value.switch.." , quantity = "..Value.quantity );
			if Value.switch > 0 and Value.quantity > 0 then
				local Ex = {};
				Ex.index = index;
				Ex.quantity = Value.quantity;
				table.insert( g_ExStatus[i], Ex );
				g_ExStatusCount[i] = g_ExStatusCount[i] + 1;
				if g_ProgramStatus[i] == 0 then
					g_Program = g_Program + 1;
					g_ProgramStatus[i] = 1;
					Say( Owner, "Program = "..g_Program..", Plan "..i.." = "..g_ProgramStatus[i] );
				end
			end

		end
	end

--[[
	-- �]�w�U��ת��Y�� ----------------------------------------------------
	local g_Info = {};
	for i = 1, #g_CurrencyInfo do	-- ����`��
	
		g_Info[i] = {};
		g_Info[i].SysDate = EM_RoleValue_Register+((i-1)*2)	-- �t�ήɶ�
		g_Info[i].Date = EM_AccountFlag_CE_Date14_12+((i-1)*20)	-- ���a���W�̫�@���P Npc �I�����ɶ�
		g_Info[i].DailyAccountAmount = EM_AccountFlag_CE_Count14_8+((i-1)*20)	-- ���a�b�����I���W���q
		g_Info[i].DailyServerAmount = EM_RoleValue_Register+((i-1)*2+1)	-- ���A���C��I���W���A�O���� Npc ���W
		g_Info[i].WeeklyServerAmount = "SC_ITEM_SOP_20"..(i+4)	-- Server �C�P�I����e�Ѿl�ƶq
	
		g_Info[i].LowestLv = GetDBKeyValue("Plus_"..(i+10).."_LowestLv");	-- �I���̧C�ݨD����
		g_Info[i].HighestLv = GetDBKeyValue("Plus_"..(i+10).."_HighestLv");	-- �I���̰��ݨD����
		g_Info[i].DailyAccountLimit = GetDBKeyValue("Plus_"..(i+10).."_DailyAccountLimit");	-- ���a�b���C��I���W���q
		g_Info[i].DailyServerLimit = GetDBKeyValue("Plus_"..(i+10).."_DailyServerLimit");	-- Server �C��I���W���q
		g_Info[i].WeeklyServerLimit = GetDBKeyValue("Plus_"..(i+10).."_WeeklyServerLimit");	-- Server �C�P�I���W���q
		
		g_Info[i].Gift = g_Gift[i];	-- �P�_���ذe�ΧI��
		g_Info[i].Status = g_Status[i];	-- ��I�f���ƶq
		g_Info[i].ExStatus = g_ExStatus[i];	-- �I���f���ƶq
		g_Info[i].Log = 12414900+(i*10);	-- �W�u�ɥ��
		g_Info[i].DailyLimitLog = 12414901+(i*10);	-- ���A���C��ܤW����
		g_Info[i].WeeklyLimitLog = 12414902+(i*10);	-- ���A���C�P�ܤW����

		for Index, Value in pairs(g_Info[i]) do
			Say( Owner, "Index = "..Index.." , Value = "..tostring(Value) );
		end
	end
--]]
end