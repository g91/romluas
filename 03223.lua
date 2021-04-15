--�վ�f��
--/gm ? runplot Hao_Monetary_Union_Adjust

-- �վ�I������ ( String = 1 ���ӤH�B2 �� Server �C��B3 �� Server �C�P�B-1 �����]�w�A Amount ����ɬ���_�w�]�A�� 0 �H�W�ɡA�����w�I������)
--/gm ? pcall %s_id "Hao_SetItemExchange(String,Amount)"

-- ���U�� -- Npc ���W�� Reg �ȨϥΪ��p�A�O�� Server �C��I�����ƥ�
-- EM_RoleValue_Register+0 ���1 �P�_�ɶ�
-- EM_RoleValue_Register+1 ���1 �P�_�I�����ơA�̦h 127 ��
-- EM_RoleValue_Register+2 ���2 �ɶ�
-- EM_RoleValue_Register+3 ���2 �I������
-- EM_RoleValue_Register+4 ���3 �ɶ�
-- EM_RoleValue_Register+5 ���3 �I������
-- EM_RoleValue_Register+6 ���4 �ɶ�
-- EM_RoleValue_Register+7 ���4 �I������
-- EM_RoleValue_Register+8 ���5 �ɶ�
-- EM_RoleValue_Register+9 ���5 �I������

-- ��l�ơA���s�}���ɶi�檺��l�Ƹ��
local g_ResetDefault = 0;
-- ����`��
local g_ProgramTotally = 5;
-- �f��Define�B�f���s���B�f���W��(-1�ɬ��L�W��)�B�f���r��B�f��½Ķ
local g_CurrencyInfo = {};
g_CurrencyInfo[1] = { EM_RoleValue_PhiriusShellCoin, 11, 1000, "[SYS_MONEY_TYPE_11]", "Phirius Shell" };	-- �����B�ꨩ
g_CurrencyInfo[2] = { EM_RoleValue_EnergyJusticeCoin, 12, -1, "[SYS_MONEY_TYPE_12]", "Energy of Justice" };	-- ���q��q
g_CurrencyInfo[3] = { EM_RoleValue_DreamlandCoin, 10, -1, "[SYS_MONEY_TYPE_10]", "Dreamland Pioneer Sigil" };	-- �ڹҥ����L�O
g_CurrencyInfo[4] = { EM_RoleValue_RelicsCoin, 9, 10000, "[SYS_MONEY_TYPE_9]", "Ancient Mementos" };	-- �j�N��
g_CurrencyInfo[5] = { EM_RoleValue_ProofLegendCoin, 13, -1, "[SYS_MONEY_TYPE_13]", "Proof of Myth" };	-- �ǩ_����
-- �ŧi��I�P�I���f�����M��
local g_Status = {};	-- �O����X�f�����(�ƶq)
local g_ExStatus = {};	-- �O���I���f�����(�ƶq)
local g_StatusCount = {};-- �� DesignLog �����I�Ÿ���Ǥ�
local g_ExStatusCount = {};-- �� DesignLog �����I�Ÿ���Ǥ�
local g_Gift = {};	-- �P�_�O�ؤ��ΧI��
-- ���o LogView ����I�f�����]�w
local g_Currency = {};
-- �P�_��׼ƶq
local g_Program = 0;	-- �H������ ����`�q�W�L�ƼƮɡA�|�s�W�@�h�D�ؿ����
local g_ProgramStatus = {};	-- �קK�t�ӳ]�w��׸����ɡA�禡���ê����D(Ĵ�p�t�ӨϥΤ�� 2 3 5�A�������L��� 1 4 )
-- ���o LogView ���I���f�����]�w
local g_ExCurrency = {};
-- �]�w�U��ת��Y��
local g_Info = {};
-------------------------------------------------------------------------
function Hao_CurrencyExchange_Reset()	-- ��l��

	for i = 1, g_ProgramTotally do	-- ��l��
		g_Status[i] = {};
		g_ExStatus[i] = {};
		g_StatusCount[i] = 0;
		g_ExStatusCount[i] = 0;
		g_Gift[i] = true;
	end

	for i = 1, g_ProgramTotally do	-- ��׼ƶq
	
		g_Currency[i] = {};
		g_Currency[i][1] = GetDBKeyValue("Currency_0"..i.."_PhiriusShell");	-- �����B�ꨩ�ƶq
		g_Currency[i][2] = GetDBKeyValue("Currency_0"..i.."_EnergyJustice");	-- ���q��q�ƶq
		g_Currency[i][3] = GetDBKeyValue("Currency_0"..i.."_Dreamland");	-- �ڹҥ����L�O�ƶq
		g_Currency[i][4] = GetDBKeyValue("Currency_0"..i.."_Ancient");	-- �j�N�򪫼ƶq
		g_Currency[i][5] = GetDBKeyValue("Currency_0"..i.."_ProofMyth");	-- �ǩ_���Ҽƶq
	
		-- ���o��I�f�����M��
		for Index, Value in ipairs(g_Currency[i]) do
			if Value > 0 then	-- ��ӳf������I�}���]���}�ҥB��I�ƶq�]�� 1 �H�W�A������I����ɡC
				local Pay = {};
				Pay.index = Index;
				Pay.quantity = Value;
				table.insert( g_Status[i], Pay );
				g_Gift[i] = false;	-- �ŧi����׫D�ؤ������A���I������
				g_StatusCount[i] = g_StatusCount[i] + 1;
			end
		end
	end
	
	for i = 1, g_ProgramTotally do	-- ��׼ƶq
	
		g_ExCurrency[i] = {};
		g_ExCurrency[i][1] = GetDBKeyValue("Currency_0"..i.."_ExPhiriusShell");	-- �����B�ꨩ�ƶq
		g_ExCurrency[i][2] = GetDBKeyValue("Currency_0"..i.."_ExEnergyJustice");	-- ���q��q�ƶq
		g_ExCurrency[i][3] = GetDBKeyValue("Currency_0"..i.."_ExDreamland");	-- �ڹҥ����L�O�ƶq
		g_ExCurrency[i][4] = GetDBKeyValue("Currency_0"..i.."_ExAncient");	-- �j�N�򪫼ƶq
		g_ExCurrency[i][5] = GetDBKeyValue("Currency_0"..i.."_ExProofMyth");	-- �ǩ_���Ҽƶq
	
		g_ProgramStatus[i] = 0;
		-- ���o�I���f�����M��
		for Index, Value in ipairs(g_ExCurrency[i]) do
			if Value > 0 then	-- ��ӳf�����I���}���]���}�ҥB�I���ƶq�]�� 1 �H�W�A�����I������ɡC
				local Ex = {};
				Ex.index = Index;
				Ex.quantity = Value;
				table.insert( g_ExStatus[i], Ex );
				g_ExStatusCount[i] = g_ExStatusCount[i] + 1;
				if g_ProgramStatus[i] == 0 then
					g_Program = g_Program + 1;
					g_ProgramStatus[i] = 1;
				end
			end
		end
	end
	
	for i = 1, g_ProgramTotally do	-- ����`��
	
		g_Info[i] = {};
		g_Info[i].SysDate = EM_RoleValue_Register+((i-1)*2)	-- �t�ήɶ�
		g_Info[i].Date = EM_AccountFlag_CE_Date14_12+((i-1)*20)	-- ���a���W�̫�@���P Npc �I�����ɶ�
		g_Info[i].DailyAccountAmount = EM_AccountFlag_CE_Count14_8+((i-1)*20)	-- ���a�b�����I���W���q
		g_Info[i].DailyServerAmount = EM_RoleValue_Register+((i-1)*2+1)	-- ���A���C��I���W���A�O���� Npc ���W
		g_Info[i].WeeklyServerAmount = "SC_ITEM_SOP_20"..(i+4)	-- Server �C�P�I����e�Ѿl�ƶq
	
		g_Info[i].LowestLv = GetDBKeyValue("Currency_0"..i.."_LowestLv");	-- �I���̧C�ݨD����
		g_Info[i].HighestLv = GetDBKeyValue("Currency_0"..i.."_HighestLv");	-- �I���̰��ݨD����
		g_Info[i].DailyAccountLimit = GetDBKeyValue("Currency_0"..i.."_DailyAccountLimit");	-- ���a�b���C��I���W���q
		g_Info[i].DailyServerLimit = GetDBKeyValue("Currency_0"..i.."_DailyServerLimit");	-- Server �C��I���W���q
		g_Info[i].WeeklyServerLimit = GetDBKeyValue("Currency_0"..i.."_WeeklyServerLimit");	-- Server �C�P�I���W���q
		
		g_Info[i].Gift = g_Gift[i];	-- �P�_���ذe�ΧI��
		g_Info[i].Status = g_Status[i];	-- ��I�f���ƶq
		g_Info[i].ExStatus = g_ExStatus[i];	-- �I���f���ƶq
	
		-- �O���� LogView �W�� DesignLog �\��
		g_Info[i].TradeLog = 12414900+(i*10);	-- �W�u�ɥ��
		g_Info[i].DailyTradeLimitLog = 12414901+(i*10);	-- ���A���C��ܤW����
		g_Info[i].WeeklyTradeLimitLog = 12414902+(i*10);	-- ���A���C�P�ܤW����
	
	end
end
---------------------------------------------------------------
function Hao_CurrencyExchange_Home()	-- �I�� Npc ���� �P�_��׼ƶq�A���ƶq���ܰ_�l���

	if g_ResetDefault == 0 then	-- ��l�Ƴ]�w
		Hao_CurrencyExchange_Reset();
		g_ResetDefault = 1;
	end

	local Owner = OwnerID();	-- ���a
	local Target = TargetID();	-- Npc
	local Room = ReadRoleValue( Owner, EM_RoleValue_RoomID );
	local ProgramAmount = 0;
--	DebugMsg( Owner, Room, "g_Program = "..g_Program );
	NpcDialog( Target, Owner );

	if g_Program == 0 then	-- �Ҧ���ק����������߱����
		SetSpeakDetail( Owner, "[SC_ITEM_SOP_223]" );	-- �A�ȩ|���}��A�бz�@�ߵ��ԡC
	elseif g_Program == 1 then	-- �u�}�ҳ�@��׮�
		for i = 1, #g_ProgramStatus do
			if g_ProgramStatus[i] == 1 then
				Hao_CurrencyExchangeProgram(i);
				break;
			end
		end
	else	-- �}�ҽƼƥH�W��׮�
		SetSpeakDetail( Owner, "[SC_ITEM_SOP_229]" );
		for i = 1, #g_ProgramStatus do
		--	DebugMsg( Owner, Room, "Status = "..g_ProgramStatus[i].." , i = "..i );
			if g_ProgramStatus[i] == 1 then
				ProgramAmount = ProgramAmount + 1;
				local ProgramNumber = "[SC_ITEM_SOP_2"..(17+ProgramAmount).."]";
			--	DebugMsg( Owner, Room, "Number = "..ProgramNumber..", Name = "..ProgramName );
				AddSpeakOption( Owner, Target, ProgramNumber, "Hao_CurrencyExchangeProgram("..i..")" , 0 );
			end
		end
	end
end

function Hao_CurrencyExchangeProgram(Select)

	local Owner = OwnerID();	-- ���a
	local Target = TargetID();	-- Npc
	local Room = ReadRoleValue( Owner, EM_RoleValue_RoomID );
	local Month = GetSystime(3)+1;	-- Ū���{�b���
	local Day = GetSystime(4);	-- Ū���{�b��� (1)���� (2)���� (3)+1 ���� (4)����
	local SysDate = Month*100+Day;	-- �t�ήɶ� �̤p��� 101 ( 1��1�� ) �̤j��� 1231 ( 12��31�� )
	AdjustFaceDir( Target, Owner, 0 ); -- ���V

--	DebugMsg( Owner, Room, "Select = "..Select );

	local PlayerDate = ReadAccountFlagValue( Owner, g_Info[Select].Date, 12 );	-- Ū�����a���W�̫�@���P Npc �I�����ɶ�
	if PlayerDate ~= SysDate then	-- �C��P�_�A�������a�b�����I������
		WriteAccountFlagValue( Owner, g_Info[Select].DailyAccountAmount, 8, g_Info[Select].DailyAccountLimit );	-- ���s�g�J���a�b�����I���W���q
		WriteAccountFlagValue( Owner, g_Info[Select].Date, 12, SysDate );
	end

	local NpcDate = ReadRoleValue( Target, g_Info[Select].SysDate );	-- Ū�� Npc ���W�̫�@���P���a�I�����ɶ�
	if NpcDate ~= SysDate and g_Info[Select].DailyServerLimit ~= 0 then	-- �P�_Server���I���W���q�O�_���m
		WriteRoleValue( Target, g_Info[Select].SysDate, SysDate );
		WriteRoleValue( Target, g_Info[Select].DailyServerAmount, g_Info[Select].DailyServerLimit );	-- ���s�g�JServer���I���W���q
	end

	local WeeklyServerAmount = GetWorldVar( g_Info[Select].WeeklyServerAmount );	-- Ū�� Server �C�P�I����e�Ѿl�ƶq
	-- ���� = 0 �ɡA�N�� Server ��}�ҡA = 100 �ɡA�N���P�I���ƶq�w�I���M�šA> 100 �ɡA�N���P�I���ƶq�w�I���M��
	if WeeklyServerAmount == 0 and g_Info[Select].WeeklyServerLimit ~= 0 then	-- ���m  Server �C�P�I���ƶq
		SetWorldVar( g_Info[Select].WeeklyServerAmount, g_Info[Select].WeeklyServerLimit+100 );
	end

	local String = {};
	String.wrap = "\n";	-- ����
	String.paytitle = "[SC_ITEM_SOP_211]";	-- ú��
	String.extitle = "[SC_ITEM_SOP_212]";	-- �I��
	String.pay = "";
	String.ex = "";

	for Sort, Data in ipairs(g_Info[Select].Status) do
		String.pay = String.pay.."<CY>"..Data.quantity.."</CY>".." ".."<CM>"..g_CurrencyInfo[Data.index][4].."</CM>"..String.wrap;
	end

	for Sort, Data in ipairs(g_Info[Select].ExStatus) do
		String.ex = String.ex.."<CY>"..Data.quantity.."</CY>".." ".."<CM>"..g_CurrencyInfo[Data.index][4].."</CM>"..String.wrap;
	end

	if g_Info[Select].Gift then
		String.title = "[SC_ITEM_SOP_213]"..String.wrap;	-- �}�Y
		-- �����ذe�����e�p�U�A�A�T�w�n�{�b����ܡH
		String.sentence = String.title..String.wrap..String.ex..String.wrap;
	else
		String.title = "[SC_ITEM_SOP_210]"..String.wrap;	-- �}�Y
		-- �A�T�w�n�i��H�U�I���ܡH
		String.sentence = String.title..String.wrap..String.paytitle..String.wrap..String.pay..String.wrap..String.extitle..String.wrap..String.ex..String.wrap;
	end

	if g_Info[Select].LowestLv > 0 and g_Info[Select].HighestLv > 0 then	-- �ϥε��ŭ���G<CY>[$VAR1]</CY> ~ <CY>[$VAR2]</CY>
		String.sentence = String.sentence.."[SC_ITEM_SOP_230][$SETVAR1="..g_Info[Select].LowestLv.."][$SETVAR2="..g_Info[Select].HighestLv.."]"..String.wrap;
	end

	local DailyAccountAmount = ReadAccountFlagValue( Owner, g_Info[Select].DailyAccountAmount, 8 );	-- Ū�����a�b�����W�����I���W���q
	String.sentence = String.sentence.."[SC_ITEM_SOP_214][$SETVAR3="..DailyAccountAmount.."]"..String.wrap;

	-- ��@�b���C��i�ϥΦ����ٳѤU�G<CY>[$VAR3]</CY>
	if g_Info[Select].DailyServerLimit ~= 0 then
		local DailyServerAmount = ReadRoleValue( Target, g_Info[Select].DailyServerAmount );	-- Ū�� Npc ���W��Server���I���W���q
		String.sentence = String.sentence.."[SC_ITEM_SOP_215][$SETVAR4="..DailyServerAmount.."]"..String.wrap;
		-- ���A���C��i�ϥΦ����ٳѤU�G<CY>[$VAR4]<CY>
	end

	if g_Info[Select].WeeklyServerLimit ~= 0 then
		WeeklyServerAmount = GetWorldVar( g_Info[Select].WeeklyServerAmount )-100;	-- Ū�� Server �C�P�I����e�Ѿl�ƶq
		String.sentence = String.sentence.."[SC_ITEM_SOP_216][$SETVAR5="..WeeklyServerAmount.."]";
		-- ���A���C�P�i�ϥΦ����ٳѤU�G<CY>[$VAR5]</CY>
	end
	SetSpeakDetail( Owner, String.sentence );
	AddSpeakOption( Owner, Target, "[SC_111284_6]", "Hao_CurrencyExchangeProgram_Dialog("..Select..")", 0 );
	if g_Program > 1 then	-- �}�ҽƼƥH�W��׮�
		AddSpeakOption( Owner, Target, "[SC_BUFFNPC_12]", "Hao_CurrencyExchange_Home", 0 );
	end
end

function Hao_CurrencyExchangeProgram_Dialog(Select)

	local Owner = OwnerID();	-- ���a
	local Target = TargetID();	-- Npc
	local Room = ReadRoleValue( Owner, EM_RoleValue_RoomID );
	local PlayerLv = ReadRoleValue( Owner, EM_RoleValue_Lv );	-- ���a����

	AdjustFaceDir( Target, Owner, 0 ); -- ���V
	CloseSpeak( Owner );

	if g_Info[Select].LowestLv > 0 and g_Info[Select].HighestLv > 0 then	-- ��ݨD�̧C���ŻP�ݨD�̰����Ŧ��]�w�ɡA�d�ߵ��Ű϶�
		if PlayerLv < g_Info[Select].LowestLv or PlayerLv > g_Info[Select].HighestLv then	-- �z���D¾���ť������󦹰϶��~�ŦX�ϥθ��G<CY>[$VAR1]</CY> ~ <CY>[$VAR2]</CY>
			SetSpeakDetail( Owner, "[SC_ITEM_SOP_45][$SETVAR1="..g_Info[Select].LowestLv.."][$SETVAR2="..g_Info[Select].HighestLv.."]" );
			return PlayMotion( Target, 107 );	-- �n�Y
		end
	end

	local DailyAccountAmount =  ReadAccountFlagValue( Owner, g_Info[Select].DailyAccountAmount, 8 );	-- ���a�b�����W�����I���W���q
	local DailyServerAmount = ReadRoleValue( Target, g_Info[Select].DailyServerAmount );	-- Npc ���W��Server���I���W���q
	local WeeklyServerAmount = GetWorldVar( g_Info[Select].WeeklyServerAmount );	-- Npc ���W��Server�C�P�I���W���q ( �ݩ� Server �ܼơB�i�� Zone )

	if WeeklyServerAmount < 101 and g_Info[Select].WeeklyServerLimit ~= 0 then
		SetSpeakDetail( Owner, "[SC_ITEM_SOP_14]" ) -- �����I�����Ƥw�F�W���A�I���A�ȱN����A�����@�᭫�s�}��C
		return PlayMotion( Target, 107 );	-- �n�Y
	elseif DailyAccountAmount < 1 or ( DailyServerAmount < 1 and g_Info[Select].DailyServerLimit ~= 0 ) then
		SetSpeakDetail( Owner, "[SC_ITEM_SOP_08]" );	-- ����I�����Ƥw�F�W���A���q�O�ݻŪ�...�бz���ѦA�ӡC
		return PlayMotion( Target, 107 );	-- �n�Y;
	end

	for Sort, Data in ipairs(g_Info[Select].Status) do	-- �d�߫��w�f���ƶq�O�_����
	--	Say( Owner, g_CurrencyInfo[Data.index][4].." , quantity = "..tostring(CheckSpeicalCoin( Owner, g_CurrencyInfo[Data.index][2], Data.quantity )) );
		if ( not CheckSpeicalCoin( Owner, g_CurrencyInfo[Data.index][2], Data.quantity ) ) then
			SetSpeakDetail( Owner, "[SC_112311_6]" ); -- �z�ҫ������ƶq�����A�٤���I����C 
			return PlayMotion( Target, 107 );	-- �n�Y
		end
	end

	local Overload = {};	-- �L���M��
	Overload.title = "[SC_ITEM_SOP_226]";	-- �A�Ȥ���A�z�������U�z�f���N�b�����A�ȫ�W�X�ƶq�W���G
	Overload.list = ""	-- �W�X���|�ƶq���f���M��
	Overload.wrap = "\n";	-- ����
	Overload.sentence = "";	-- ��ܤ������ݨ쪺���e
	Overload.status = False;	-- �P�_�O�_���W�X���|�ƶq���f��

	for Sort, Data in ipairs(g_Info[Select].ExStatus) do	-- �ˬd�f���O�_�W�X�ƶq�W��
		local Ceiling = g_CurrencyInfo[Data.index][3];	-- �f���W���ƶq
		if Ceiling > 0 then	-- ��ӳf�����]�w�W����
			local Deposit = ReadRoleValue( Owner, g_CurrencyInfo[Data.index][1] );	-- �f�������ƶq
			local Maximum = Deposit + Data.quantity;	-- �{���f���ƶq+�I���f���ƶq
			if Maximum > Ceiling then	-- �f���`�q > �ƶq�W���ɡA����i����
				local name = g_CurrencyInfo[Data.index][4];	-- �W�X���f������
				local quantity = (Maximum - Ceiling);	-- �W�X�f�����ƶq
				Overload.list = Overload.list.."<CY>"..quantity.."</CY>".." ".."<CM>"..name.."</CM>"..String.wrap;
				Overload.status = True;
			end
		end
	end

	if Overload.Status then	-- �A�Ȥ���I�z�������f���N�󥻦��A�ȫ�W�X�ƶq�W���A�Ш��U�z�f�������P�W�X�ƶq�G
		Overload.sentence = Overload.title..Overload.wrap..Overload.wrap..Overload.list;
		SetSpeakDetail( Owner, Overload.sentence ); -- �I������
		return PlayMotion( Target, 107 );	-- �n�Y;
	end

	local String = {};
	String.paytitle = "Exchange ";	-- �}�Y
	String.present = "Get "
	String.paymaxtitle = "There is a limit cap in exchanging ";	-- �}�Y
	String.extitle = "to ";	-- �}�Y
	String.ex = "";	-- ú��
	String.pay = "";	-- �I��
	String.sentence = "";

	local Count = 0;	-- �� DesignLog �����I�Ÿ���Ǥ�
	local ExCount = 0;	-- �P�W

	for Sort, Data in ipairs(g_Info[Select].Status) do	-- ú��M��
		AddSpeicalCoin( Owner, 11, g_CurrencyInfo[Data.Index][2], -Data.quantity );	-- ����̡BAction Type(�@������)�B�f���N���B���������ƶq
		ScriptMessage( Owner, Owner, 0, "[SC_ITEM_SOP_224][$SETVAR1="..Data.quantity.."][$SETVAR2="..g_CurrencyInfo[Data.Index][4].."]", 0 );	-- ��ܮ� �A��I�F _ �f��
		Count = Count + 1;
		if Count < g_StatusCount[Select] then
			String.pay = String.pay..g_CurrencyInfo[Data.Index][5].." x "..Data.quantity..", ";
		else
			String.pay = String.pay..g_CurrencyInfo[Data.Index][5].." x "..Data.quantity.." ";
		end
	end

	for Sort, Data in ipairs(g_Info[Select].ExStatus) do	-- �I���M��
		AddSpeicalCoin( Owner, 11, g_CurrencyInfo[Data.Index][2], Data.quantity );
		ScriptMessage( Owner, Owner, 0, "[SC_ITEM_SOP_225][$SETVAR1="..Data.quantity.."][$SETVAR2="..g_CurrencyInfo[Data.Index][4].."]", 0 );	-- ��ܮ� �A��o�F _ �f��
		ExCount = ExCount + 1;
		if ExCount < g_ExStatusCount[Select] then
			String.ex = String.ex..g_CurrencyInfo[Data.Index][5].." x "..Data.quantity..", ";
		else
			String.ex = String.ex..g_CurrencyInfo[Data.Index][5].." x "..Data.quantity..". ";
		end
	end
	if g_Info[Select].Gift then	-- ����׬��ذe��
		String.sentence = String.present..String.pay..String.ex;
	else
		String.sentence = String.paytitle..String.pay..String.extitle..String.ex;
	end
	WriteAccountFlagValue( Owner, g_Info[Select].DailyAccountAmount, 8, DailyAccountAmount - 1 );	-- ���a�b�����W�����I���W���q -1
--	DebugMsg( Owner, Room, String.sentence );
	DesignLog( Owner, g_Info[Select].TradeLog, String.sentence );	-- �I�� Log

	if g_Info[Select].DailyServerLimit ~= 0 then	-- Server �C��I���F��W���ɪ� Log
		WriteRoleValue( Target, g_Info[Select].DailyServerAmount, DailyServerAmount - 1 );	-- NPC���W�� Server ���I���W���ƶq -1
		if DailyServerAmount - 1 == 0 then	-- �� Server ���I���F�ܤW����
			String.sentence = String.paymaxtitle..String.pay..String.extitle..String.ex;
		--	DebugMsg( Owner, Room, String.sentence.."today." );
			DesignLog( Owner, g_Info[Select].DailyTradeLimitLog, String.sentence.." today." );
		end
	end

	if g_Info[Select].WeeklyServerLimit ~= 0 then	-- Server �C�P�I���F��W���ɪ� Log
		SetWorldVar( g_Info[Select].WeeklyServerAmount, WeeklyServerAmount-1 );	-- �g�J Server �C�P�I���Ѿl�ƶq
		if WeeklyServerAmount - 1 == 100 then	-- �� Server ��P�I���F�ܤW����
			String.sentence = String.paymaxtitle..String.pay..String.extitle..String.ex;
		--	DebugMsg( Owner, Room, String.sentence.."this week." );
			DesignLog( Owner, g_Info[Select].WeeklyTradeLimitLog, String.sentence.." this week." );
		end
	end
end