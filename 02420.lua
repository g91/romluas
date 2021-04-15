--=============================================--
--�ܼƫŧi

function Lua_ZONE20_PE01_GlobalSet()--�ܼƫŧi
	ZONE20_PE01_PEIndex = 2001
	ZONE20_PE01_Phase = 1;
		
	ZONE20_PE01_Barricades = {};
	ZONE20_PE01_Worker = {};
	ZONE20_PE01_ArcherGroup = {};
	ZONE20_PE01_MstNum = { 0,0,0,0};
	ZONE20_PE01_Mst = {};
	ZONE20_PE01_Obj = {};

	ZONE20_PE01_Var = {}
	ZONE20_PE01_Var["MapID"] = 244;
	ZONE20_PE01_Var["GetArcher"] = 0;
	ZONE20_PE01_Var["General"] = 0;
	ZONE20_PE01_Var["ArcherID"] = 105737;
	ZONE20_PE01_Var["ArcherFlag"] = 780656;
	ZONE20_PE01_Var["SupplyID"] = 118446;
	ZONE20_PE01_Var["SupplyFlag"] = 780657;
	ZONE20_PE01_Var["MstFlag"] = 780755;
	ZONE20_PE01_Var["DeaderID"] =  118451;
	ZONE20_PE01_Var["BarricadesDead"] = 0;
	ZONE20_PE01_Var["Ctrl"] = 0;
	ZONE20_PE01_Var["Leader"] = 0;
	ZONE20_PE01_Var["ArcherNum"] = 0;
	ZONE20_PE01_Var["MstID"] = {	105733,	--���B(���)
					105734,	--�Z�J(���)
					105735,	--�l����(�L)
					105736		--�]�o��(���)
					}
	Zone20_PE01_Var["PHTime"] = {	300,
					360,
					30,
					360,
					30,
					360,
					360
					}
end

--=============================================--
--  �����ƥ�]�w��

function Lua_Zone20_PE01_PESet()
	local PE_Name = "SC_PE_ZONE20_01_NAME"					-- ZONE20PE
	local PE_Desc = "SC_PE_ZONE20_01_DESC"					-- 
	local PEIndex = Zone20_PE01_PEIndex	
	PE_AddPE( PE_Name, PE_Desc, PEIndex , 0 ) 	-- �s�W�@�Өƥ�

	local MapID = Zone20_PE01_Var["MapID"]
	local TestID = 1
	PE_AddRegion( PEIndex , MapID )							-- ��PE��i��ڤ���
	PE_AddRegion( PEIndex , TestID )						-- ��PE��i���հ�	
	
	local PH_Name = {	"SC_PE_ZONE20_01_PHNAME01",	-- �ƾ�
				"SC_PE_ZONE20_01_PHNAME02",	-- �Ĥ@�i����
				"SC_PE_ZONE20_01_PHNAME03",	-- �ɵ��ɶ�
				"SC_PE_ZONE20_01_PHNAME04",	-- �ĤG�i����
				"SC_PE_ZONE20_01_PHNAME05",	-- �ݮ��ɶ�
				"SC_PE_ZONE20_01_PHNAME06",	-- �ĤT�i����
				"SC_PE_ZONE20_01_PHNAME07",	-- �ĥ|�i����
			}
	
	local PH_Desc = {	"SC_PE_ZONE20_01_PH1_DESC",
				"SC_PE_ZONE20_01_PH2_DESC",
				"SC_PE_ZONE20_01_PH3_DESC",
				"SC_PE_ZONE20_01_PH4_DESC",
				"SC_PE_ZONE20_01_PH5_DESC",
				"SC_PE_ZONE20_01_PH6_DESC",
				"SC_PE_ZONE20_01_PH7_DESC"
			}
	local PHIndex = 100;
	local OBIndex = 1000;
	local OB_Name = "SC_PE_ZONE16_DW_21"; --�Ѿl�ɶ�
	local PHTime = Zone20_PE01_Var["PHTime"];

	for i=1, 7 do
		PE_AddPhase( PEIndex , PHIndex+i , PH_Name[i] , PH_Desc[i] , 0 , 0 , 0 , 0 )
	end
		
	-- �]�w���q����
	for i=1, 7 do
		PE_PH_AddObjective_TimeLimit( PEIndex , PHIndex + i, OBIndex+i , OB_Name, "" , "Zone20_PE01_PH"..i.."_Time" , PHTime[i]*1000 , 0 ,  true )
	end

	-- �]�w���q�s��
	for i=1, 6 do
		PE_PH_SetNextPhase( PEIndex , PHIndex+i , PHIndex+i+1 )
	end
	
	-- �]�w�ؼйF�����^��禡
	PE_OB_SetCallBackOnAchieve( PEIndex , "Lua_Zone20_PE01_OB_OnAchieve" )	
	PE_SetScoreVisible( PEIndex, false )--����ܿn��
	
	-- �ƥ�Ұ�
	PE_Start( PEIndex , PHIndex+1 )

end

function Lua_Zone20_PE01_OB_OnAchieve( PEIndex, PHIndex , OBIndex )
	ZONE20_PE01_Phase = ZONE20_PE01_Phase +1;
	local Ctrl = ZONE20_PE01_Var["Ctrl"];
	if OBIndex == 1001 then
		ZONE20_PE01_Var["BarricadesDead"] = 0;
		Lua_ZONE20_PE01_HideWorker()--���äu�H
		Lua_ZONE20_PE01_PlayerClearBuff()--�M�����a���A
		CallPlot( Ctrl, "Lua_ZONE20_PE01_CreateMst", ZONE20_PE01_Phase )--���ͩǪ�
	elseif OBIndex == 1002 then
		Lua_ZONE20_PE01_ShowWorker()--�X�{�u�H
	elseif OBIndex == 1003 then
		Lua_ZONE20_PE01_HideWorker()--���äu�H
		CallPlot( Ctrl, "Lua_ZONE20_PE01_CreateMst", ZONE20_PE01_Phase )--���ͩǪ�
	elseif OBIndex == 1004 then
		Lua_ZONE20_PE01_ShowWorker()--�X�{�u�H
	elseif OBIndex == 1005 then
		Lua_ZONE20_PE01_HideWorker()--���äu�H
		CallPlot( Ctrl, "Lua_ZONE20_PE01_CreateMst", ZONE20_PE01_Phase )--���ͩǪ�
	elseif OBIndex == 1006 then
		CallPlot( Ctrl, "Lua_ZONE20_PE01_CreateMst", ZONE20_PE01_Phase )--���ͩǪ�
	elseif OBIndex == 1007 then
		Lua_ZONE20_PE01_PlayerGetAward()--���a���o���y
		Lua_ZONE20_PE01_DelMst();--�R���Ҧ��Ǫ�
		Lua_ZONE20_PE01_Reset()--���mPE
	end
end

function Lua_ZONE20_PE01_HideWorker()--���äu�H
	local Barricades = ZONE20_PE01_Barricades;
	local Worker = ZONE20_PE01_Worker;
	for i = 1, table.getn(Worker) do
		Hide( Worker[i] );
	end
	for i =1, table.getn(Barricades) do
		CancelBuff( Barricades[i], 509836 );--����״_
	end
end

function Lua_ZONE20_PE01_ShowWorker()--�X�{�u�H
	local Barricades = ZONE20_PE01_Barricades;
	local Worker = ZONE20_PE01_Worker;
	for i =1, table.getn(Barricades) do
		Show( Barricades[i], 0 );
		local Player = SearchRangePlayer( Barricades[i], 15 );
		if table.getn(Player) > 0 then
			local X = ReadRoleValue( Barricades[i], EM_RoleValue_X );
			local Y = ReadRoleValue( Barricades[i], EM_RoleValue_Y );			
			local Z = ReadRoleValue( Barricades[i], EM_RoleValue_Z );
			for i=0, table.getn(Player)-1 do
				local Site = { -15-rand(3)*5,15+rand(3)*5};
				SetPos( Player[i], X+Site[rand(2)+1], Y+5, Z+Site[rand(2)+1], 0 );
			end
		end
		SetModeEx( Barricades[i], EM_SetModeType_Fight , true );-- �i�������
		AddBuff( Barricades[i], 509836, 0, -1 );--�״_��
		SetModeEx( Barricades[i] , EM_SetModeType_Obstruct, true )	--������		
	end
	for i = 1, table.getn(Worker) do
		Show( Worker[i], 0 );
	end
end

function Lua_ZONE20_PE01_Init()--��l�]�w(SERVER)
	Lua_ZONE20_PE01_GlobalSet()--�ϰ��ܼ�
	Lua_Zone20_PE01_PESet()--PE�Ұ�
	local Ctrl = Lua_ZONE20_PE01_CreateCtrl();--���ͤ���
	BeginPlot( Ctrl, "Lua_ZONE20_PE01_ShowWorker", 2 )--�X�{�u�H
	Lua_ZONE20_PE01_CreateSupply()--�]�w�ɵ��I
end

function Lua_ZONE20_PE01_SetPhaseTime( Phase )--�]�wPE���q�ɶ�
	PE_SetVar( "Zone20_PE01_PH"..Phase.."_Time", 10000 );
end

function Lua_ZONE20_PE01_Reset()--���mPE
	DebugMsg(0,0,"ZONE20_PE01_Reset")
	DebugLog(2,"ZONE20_PE01_Reset")
	ZONE20_PE01_Phase = 1	
	ZONE20_PE01_MstNum = { 0,0,0,0};
	Lua_ZONE20_PE01_ShowWorker();
	Lua_ZONE20_PE01_ResetArcher();
	CallPlot( ZONE20_PE01_Var["General"], "Lua_ZONE20_PE01_SetGeneral", 0 );
	DebugLog(2,"ZONE20_PE01_Reset End")
	DebugMsg(0,0,"ZONE20_PE01_Reset End")
end

function Lua_ZONE20_PE01_PlayerGetAward()--���a���o���y
	DebugMsg(0,0,"ZONE20_PE01 PlayerGetAward")
	local PEIndex = ZONE20_PE01_PEIndex;
	local Count = PE_GetActivePlayerGUIDCount( PEIndex );
	local GUID;
	for i = 1 , Count do
		GUID = PE_GetActivePlayerGUID( PEIndex );
		if	KS_CheckBuffLV( GUID, 509815 ) >= 50 and --�t�g�����Z
			KS_CheckBuffLV( GUID, 509816 ) >= 60 and --��O���ӷ�
			KS_CheckBuffLV( GUID, 509817 ) >= 25 and --���K������
			KS_CheckBuffLV( GUID, 509818 ) >= 50 and  --�@�e��
			KS_CheckBuffLV( GUID, 620401 ) >= 5 then --�ϩR���F
			
			AddBuff( GUID, 620023, 0, -1 )--�ƤH��{
			GiveBodyItem( GUID, 530751, 1 );--�����ٸ��u���ݼ�¾�v
		end
	end
	DebugMsg(0,0,"ZONE20_PE01 PlayerGetAward End")
end

function Lua_ZONE20_PE01_PlayerClearBuff()--�M�����a���A
	DebugMsg(0,0,"ZONE20_PE01 PlayerClearBuff")
	local PEIndex = ZONE20_PE01_PEIndex;
	local Count = PE_GetActivePlayerGUIDCount( PEIndex );
	local GUID;
	for i = 1 , Count do
		GUID = PE_GetActivePlayerGUID( PEIndex );
		CancelBuff( GUID, 509815 );--�t�g�����Z
		CancelBuff(  GUID, 509816 );--��O���ӷ�
		CancelBuff(  GUID, 509817 ); --���K������
		CancelBuff(  GUID, 509818 );  --�@�e��
		CancelBuff(  GUID, 620401 ); --�ϩR���F
	end
end