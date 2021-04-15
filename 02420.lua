--=============================================--
--變數宣告

function Lua_ZONE20_PE01_GlobalSet()--變數宣告
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
	ZONE20_PE01_Var["MstID"] = {	105733,	--豆丁(近戰)
					105734,	--坦克(近戰)
					105735,	--吸炮火(無)
					105736		--跑得快(近戰)
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
--  公眾事件設定區

function Lua_Zone20_PE01_PESet()
	local PE_Name = "SC_PE_ZONE20_01_NAME"					-- ZONE20PE
	local PE_Desc = "SC_PE_ZONE20_01_DESC"					-- 
	local PEIndex = Zone20_PE01_PEIndex	
	PE_AddPE( PE_Name, PE_Desc, PEIndex , 0 ) 	-- 新增一個事件

	local MapID = Zone20_PE01_Var["MapID"]
	local TestID = 1
	PE_AddRegion( PEIndex , MapID )							-- 把PE放進實際分區
	PE_AddRegion( PEIndex , TestID )						-- 把PE放進測試區	
	
	local PH_Name = {	"SC_PE_ZONE20_01_PHNAME01",	-- 備戰
				"SC_PE_ZONE20_01_PHNAME02",	-- 第一波衝擊
				"SC_PE_ZONE20_01_PHNAME03",	-- 補給時間
				"SC_PE_ZONE20_01_PHNAME04",	-- 第二波衝擊
				"SC_PE_ZONE20_01_PHNAME05",	-- 喘息時間
				"SC_PE_ZONE20_01_PHNAME06",	-- 第三波衝擊
				"SC_PE_ZONE20_01_PHNAME07",	-- 第四波衝擊
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
	local OB_Name = "SC_PE_ZONE16_DW_21"; --剩餘時間
	local PHTime = Zone20_PE01_Var["PHTime"];

	for i=1, 7 do
		PE_AddPhase( PEIndex , PHIndex+i , PH_Name[i] , PH_Desc[i] , 0 , 0 , 0 , 0 )
	end
		
	-- 設定階段條件
	for i=1, 7 do
		PE_PH_AddObjective_TimeLimit( PEIndex , PHIndex + i, OBIndex+i , OB_Name, "" , "Zone20_PE01_PH"..i.."_Time" , PHTime[i]*1000 , 0 ,  true )
	end

	-- 設定階段連接
	for i=1, 6 do
		PE_PH_SetNextPhase( PEIndex , PHIndex+i , PHIndex+i+1 )
	end
	
	-- 設定目標達成的回摳函式
	PE_OB_SetCallBackOnAchieve( PEIndex , "Lua_Zone20_PE01_OB_OnAchieve" )	
	PE_SetScoreVisible( PEIndex, false )--不顯示積分
	
	-- 事件啟動
	PE_Start( PEIndex , PHIndex+1 )

end

function Lua_Zone20_PE01_OB_OnAchieve( PEIndex, PHIndex , OBIndex )
	ZONE20_PE01_Phase = ZONE20_PE01_Phase +1;
	local Ctrl = ZONE20_PE01_Var["Ctrl"];
	if OBIndex == 1001 then
		ZONE20_PE01_Var["BarricadesDead"] = 0;
		Lua_ZONE20_PE01_HideWorker()--隱藏工人
		Lua_ZONE20_PE01_PlayerClearBuff()--清除玩家狀態
		CallPlot( Ctrl, "Lua_ZONE20_PE01_CreateMst", ZONE20_PE01_Phase )--產生怪物
	elseif OBIndex == 1002 then
		Lua_ZONE20_PE01_ShowWorker()--出現工人
	elseif OBIndex == 1003 then
		Lua_ZONE20_PE01_HideWorker()--隱藏工人
		CallPlot( Ctrl, "Lua_ZONE20_PE01_CreateMst", ZONE20_PE01_Phase )--產生怪物
	elseif OBIndex == 1004 then
		Lua_ZONE20_PE01_ShowWorker()--出現工人
	elseif OBIndex == 1005 then
		Lua_ZONE20_PE01_HideWorker()--隱藏工人
		CallPlot( Ctrl, "Lua_ZONE20_PE01_CreateMst", ZONE20_PE01_Phase )--產生怪物
	elseif OBIndex == 1006 then
		CallPlot( Ctrl, "Lua_ZONE20_PE01_CreateMst", ZONE20_PE01_Phase )--產生怪物
	elseif OBIndex == 1007 then
		Lua_ZONE20_PE01_PlayerGetAward()--玩家取得獎勵
		Lua_ZONE20_PE01_DelMst();--刪除所有怪物
		Lua_ZONE20_PE01_Reset()--重置PE
	end
end

function Lua_ZONE20_PE01_HideWorker()--隱藏工人
	local Barricades = ZONE20_PE01_Barricades;
	local Worker = ZONE20_PE01_Worker;
	for i = 1, table.getn(Worker) do
		Hide( Worker[i] );
	end
	for i =1, table.getn(Barricades) do
		CancelBuff( Barricades[i], 509836 );--停止修復
	end
end

function Lua_ZONE20_PE01_ShowWorker()--出現工人
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
		SetModeEx( Barricades[i], EM_SetModeType_Fight , true );-- 可砍殺攻擊
		AddBuff( Barricades[i], 509836, 0, -1 );--修復中
		SetModeEx( Barricades[i] , EM_SetModeType_Obstruct, true )	--不阻擋		
	end
	for i = 1, table.getn(Worker) do
		Show( Worker[i], 0 );
	end
end

function Lua_ZONE20_PE01_Init()--初始設定(SERVER)
	Lua_ZONE20_PE01_GlobalSet()--區域變數
	Lua_Zone20_PE01_PESet()--PE啟動
	local Ctrl = Lua_ZONE20_PE01_CreateCtrl();--產生中控
	BeginPlot( Ctrl, "Lua_ZONE20_PE01_ShowWorker", 2 )--出現工人
	Lua_ZONE20_PE01_CreateSupply()--設定補給點
end

function Lua_ZONE20_PE01_SetPhaseTime( Phase )--設定PE階段時間
	PE_SetVar( "Zone20_PE01_PH"..Phase.."_Time", 10000 );
end

function Lua_ZONE20_PE01_Reset()--重置PE
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

function Lua_ZONE20_PE01_PlayerGetAward()--玩家取得獎勵
	DebugMsg(0,0,"ZONE20_PE01 PlayerGetAward")
	local PEIndex = ZONE20_PE01_PEIndex;
	local Count = PE_GetActivePlayerGUIDCount( PEIndex );
	local GUID;
	for i = 1 , Count do
		GUID = PE_GetActivePlayerGUID( PEIndex );
		if	KS_CheckBuffLV( GUID, 509815 ) >= 50 and --速射的秘訣
			KS_CheckBuffLV( GUID, 509816 ) >= 60 and --氣力的來源
			KS_CheckBuffLV( GUID, 509817 ) >= 25 and --機密知情者
			KS_CheckBuffLV( GUID, 509818 ) >= 50 and  --護送者
			KS_CheckBuffLV( GUID, 620401 ) >= 5 then --使命必達
			
			AddBuff( GUID, 620023, 0, -1 )--傲人表現
			GiveBodyItem( GUID, 530751, 1 );--給予稱號「身兼數職」
		end
	end
	DebugMsg(0,0,"ZONE20_PE01 PlayerGetAward End")
end

function Lua_ZONE20_PE01_PlayerClearBuff()--清除玩家狀態
	DebugMsg(0,0,"ZONE20_PE01 PlayerClearBuff")
	local PEIndex = ZONE20_PE01_PEIndex;
	local Count = PE_GetActivePlayerGUIDCount( PEIndex );
	local GUID;
	for i = 1 , Count do
		GUID = PE_GetActivePlayerGUID( PEIndex );
		CancelBuff( GUID, 509815 );--速射的秘訣
		CancelBuff(  GUID, 509816 );--氣力的來源
		CancelBuff(  GUID, 509817 ); --機密知情者
		CancelBuff(  GUID, 509818 );  --護送者
		CancelBuff(  GUID, 620401 ); --使命必達
	end
end