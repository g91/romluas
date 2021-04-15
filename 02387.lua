--=============================================--
--PE內容

function Lua_ZONE20_PE01_DelMst()--刪除所有怪物
	DebugMsg(0,0,"ZONE20_PE01_DelMst")
	DebugLog(0,"ZONE20_PE01_DelMst")
	local MstID = ZONE20_PE01_Var["MstID"];
	local Mst = ZONE20_PE01_Mst;
	local MstNum = table.getn(Mst);
	local OrgID;
	
	for i=1, MstNum do
		if Mst[i] ~= nil and CheckID( Mst[i] )== true then
			OrgID = ReadRoleValue( Mst[i], EM_RoleValue_OrgID );
			for j=1, table.getn(MstID) do
				if OrgID == MstID[j] then
					DelObj( Mst[i])
				end
			end
		end
	end
	ZONE20_PE01_Mst = {};
	
	DebugLog(0,"ZONE20_PE01_DelMst End")
	DebugMsg(0,0,"ZONE20_PE01_DelMst End")
end

function Lua_ZONE20_PE01_ResetArcher()--重置弓手
	local ArcherGroup = ZONE20_PE01_ArcherGroup;
	for Ctrl in pairs( ArcherGroup ) do
		ArcherGroup[Ctrl]["Food"] = 500;
		ArcherGroup[Ctrl]["Ammunition"] = 500;
		
		if ArcherGroup[Ctrl]["Member"][1] ~= nil and CheckID( ArcherGroup[Ctrl]["Member"][1] ) ~= true then
			Lua_ZONE20_PE01_CreateArcher( Ctrl, 1 );--創造弓手
		elseif ArcherGroup[Ctrl]["Member"][1] ~= nil then
			CancelBuff( ArcherGroup[Ctrl]["Member"][1], 509792 )--清除疲勞
		end
		if ArcherGroup[Ctrl]["Member"][2] ~= nil and CheckID( ArcherGroup[Ctrl]["Member"][2] ) == true then
			DelObj( ArcherGroup[Ctrl]["Member"][2] )
		end
		if ArcherGroup[Ctrl]["Member"][3] ~= nil and CheckID( ArcherGroup[Ctrl]["Member"][3] ) == true then
			if CheckBuff( ArcherGroup[Ctrl]["Member"][3], 509781 ) == true then--防禦弓手
				CancelBuff( ArcherGroup[Ctrl]["Member"][3], 509781 )
			end
		end
	end
end

--=============================================--
--怪物產生

function Lua_ZONE20_PE01_CreateCtrl()--產生中控
	local MstFlag = ZONE20_PE01_Var["MstFlag"]
	local Ctrl = KS_CreateObjMode( 115506, MstFlag, 1, 0, 1, 1 );
	ks_SetController( Ctrl )--設定隱形控制物件
	ZONE20_PE01_Var["Ctrl"] = Ctrl;
	return Ctrl;
end	
	
function Lua_ZONE20_PE01_CreateMst( Phase )--產生中控
	DebugMsg(0,0,"ZONE20_PE01 CreateMst     Phase = "..Phase )
	local MstNum = ZONE20_PE01_MstNum;
	local MstFlag = ZONE20_PE01_Var["MstFlag"]
	local PHTime = Zone20_PE01_Var["PHTime"];
	local MstID = ZONE20_PE01_Var["MstID"];
	local ChangeTime = math.floor( PHTime[Phase] /2 );
	local UnitNum = { 8,1,2,4 };
	local Site = {};
	Site[2] = {1,2};
	Site[4] = {4,3};
	Site[6] = {1,2};
	Site[7] = {4,3};
	
	local count = 0;
	local Type = 1;
	local ObjType = Site[Phase][Type];
	local p = Phase;
	local Rnd = { -5,0,5 }
	while true do
		local NowTime = math.floor(PE_GetVar( "Zone20_PE01_PH"..Phase.."_Time" )/1000);
		if NowTime <= 30 then
			return;
		end
		local TotalUnit = 0;		
		for i=1, table.getn(MstID) do
			TotalUnit = TotalUnit + math.floor( MstNum[i] / UnitNum[i] );
		end

		if TotalUnit < 7 then
			if count == 0 then
				if NowTime < ChangeTime then
					if Type == 2 then
						Type = 1;
					else
						Type = 2;
					end
				end
				if p == 6 then
					p = 7;
				elseif p == 7 then
					p =6;
				end
				
				ObjType = Site[p][Type];
			end
			if NowTime < ChangeTime then
				local Array = { UnitNum[Site[p][1]], UnitNum[Site[p][2]] };
				local LCM = KS_lcm( Array );--取得最小公倍數, 最大公因數
				if count+1 >= LCM/ UnitNum[Site[p][3-Type]] then
					count = 0;
				else
					count = count +1;
				end
			else
				if count+1 >= UnitNum[ObjType] then
					count = 0;
				else
					count = count +1;
				end
			end
			
			local obj = KS_CreateObjMode( MstID[ObjType], MstFlag, 1, 15, 1 );
			SetModeEx( obj, EM_SetModeType_Searchenemy , false );		-- 索敵
			SetModeEx( obj , EM_SetModeType_Strikback , false );		-- 反擊
			MoveToFlagEnabled( obj, false );
			WriteRoleValue( obj, EM_RoleValue_IsWalk, 0 )
			--WriteRoleValue( obj, EM_RoleValue_PID, 1 )
			AddToPartition( obj, 0 );			
			SetPlot( obj, "Dead", "Lua_ZONE20_PE01_MstDead", 0 )
			CallPlot( obj, "Lua_ZONE20_PE01_MstMove", 0 )
			if ObjType == 3 then
				AddBuff( obj, 509832, 0,-1 )--魔法護盾
			end
			AddBuff( obj, 502707, 0,-1 )--停止回血
			AddBuff( obj, 509835, 0,-1)--向外逃竄
			table.insert( ZONE20_PE01_Mst, obj );
			MstNum[ObjType] = MstNum[ObjType] +1;
			
			if TotalUnit >= 4 then
				sleep(20+Rnd[rand(3)+1])
			end
		end
		sleep(30+Rnd[rand(3)+1])
	end
	
end

--=============================================--
--怪物移動

function Lua_ZONE20_PE01_MstMove()--怪物移動
	local OID = OwnerID();
	local Barricades = ZONE20_PE01_Barricades;
	local MstFlag = ZONE20_PE01_Var["MstFlag"];
	local Goal = GetMoveFlagCount( MstFlag ) - 1;
	local MoveSite = 1;
	local CheckRange = 45;
	local OrgID = ReadRoleValue( OID, EM_RoleValue_OrgID );
	local FlagX = GetMoveFlagValue( MstFlag , MoveSite , EM_RoleValue_X );
	local FlagY = GetMoveFlagValue( MstFlag , MoveSite , EM_RoleValue_Y );
	local FlagZ = GetMoveFlagValue( MstFlag , MoveSite , EM_RoleValue_Z );	
	local Rnd = { 	[1] = 1+rand( 6 )*5,
				[2] = 1-rand( 6 )*5 }
	
	while true do
		if CheckBuff( OID, 500660 ) == true then
			CancelBuff( OID, 500660 );
		end
		
		local AttackTargetID = ReadRoleValue( OID, EM_RoleValue_AttackTargetID );
		if AttackTargetID ~= 0 and ReadRoleValue( AttackTargetID, EM_RoleValue_OrgID ) == 105742 and KS_FrontOrBack( AttackTargetID, OID ) < 1 then
			SetStopAttack(OID );
			AttackTargetID = 0;
		end
		
		if AttackTargetID == 0 then
			local Fight = false;			
			for i=1, table.getn( Barricades ) do
				if Barricades[i] ~= nil and GetDistance( OID, Barricades[i] ) <= 50 and GetModeEx( Barricades[i], EM_SetModeType_Fight ) == true then
					if KS_FrontOrBack( Barricades[i], OID ) > 10 and OrgID ~= ZONE20_PE01_Var["MstID"][3] then--取得正面/背面
						SetAttack( OID, Barricades[i] );
						Fight = true;
						break;
					end
				end
			end
		
			if Fight == false then--被看守著
				local X = ReadRoleValue( OID , EM_RoleValue_X );
	 			local Z = ReadRoleValue( OID , EM_RoleValue_Z );
				local DisX = ( X - FlagX )^2;
				local DisZ = ( Z - FlagZ )^2;
				local Dis = math.floor( (DisX+DisZ)^0.5);
				
				if Dis <= CheckRange then	-- 走到定點設定下一點位置
					if MoveSite == Goal then
						CancelBuff( OID, 509835 )--向外逃竄
						if OrgID ~= ZONE20_PE01_Var["MstID"][3] then
							ks_AttackMode( OID );--設定可攻擊NPC
							SysCastSpellLv( ZONE20_PE01_Var["General"], OID, 495767, 0 )--強制挑釁
							return;
						else
							NPCSay( OID, "[SC_PE_ZONE20_01_EXIT_0"..(rand(3)+1).."]");
							Sleep(10);
							ZONE20_PE01_MstNum[3] = ZONE20_PE01_MstNum[3] - 1;
							DelObj(OID);
						end
					else
						MoveSite = MoveSite + 1;
						FlagX = GetMoveFlagValue( MstFlag , MoveSite , EM_RoleValue_X );
						FlagY = GetMoveFlagValue( MstFlag , MoveSite , EM_RoleValue_Y );
						FlagZ = GetMoveFlagValue( MstFlag , MoveSite , EM_RoleValue_Z );
					end
				end
				MoveDirect( OID , FlagX+Rnd[rand(2)+1]  , FlagY , FlagZ+Rnd[rand(2)+1] );-- 中控移動
			end		
		end
		sleep(10)
	end
end

--=============================================--
--檢查

function Lua_ZONE20_PE01_CheckMonster( Show )--檢查怪物
	local OID = OwnerID();
	local TID = TargetID();
	local MstID = ZONE20_PE01_Var["MstID"];
	local OrgID = ReadRoleValue( TID, EM_RoleValue_OrgID );
	for i=1, table.getn(MstID) do
		if OrgID == MstID[i] then
			return true;
		end
	end
	Show = Show or false;
	if Show == true then
		ScriptMessage( OID, OID, 1 , "[EM_200928_2]" , 0 );--目標錯誤
	end
	return false;
end

function Lua_ZONE20_PE01_CheckMonster75per()
	local OID = OwnerID();
	local TID = TargetID();
	local MstID = ZONE20_PE01_Var["MstID"];
	local OrgID = ReadRoleValue( TID, EM_RoleValue_OrgID );
	for i=1, table.getn(MstID) do
		if OrgID == MstID[i] then
			if ReadRoleValue( TID, EM_RoleValue_HP ) <= ReadRoleValue( TID, EM_RoleValue_MaxHP )*0.75 then
				return true;
			end
			ScriptMessage( OID, OID, 1 , "[SYS_CASTSPELL_NEED_HP_LOWER]", 0 );--血量過高
			return false;
		end
	end
	
	ScriptMessage( OID, OID, 1 , "[EM_200928_2]" , 0 );--目標錯誤
	return false;
end

function Lua_ZONE20_PE01_CheckMap()--檢查區域
	local OID = OwnerID()
	if DW_CheckMap( OID, ZONE20_PE01_Var["MapID"] ) == true or DW_CheckMap( OID, 1 ) == true then
		return true;
	end
	ScriptMessage( OID, OID, 1 , "[SC_421324_1]" , 0 )--不在目標區域內
	return false;
end

--=============================================--
--文件取回者

function Lua_ZONE20_PE01_FailureExperimental()--失敗實驗
	local OID = OwnerID()
	KS_ClearBuffLV( OID, 509758, 1, false )--清除物件(Obj)身上BuffID 層數(Lv) 觸發效果(Event) 
	ks_QuestKill( OID, 105738, 1 )--任務用隱藏殺人法(
end

function Lua_ZONE20_PE01_DocumentKill()--文件無條件殺怪
	local OID = OwnerID()
	KS_ClearBuffLV( OID, 509758, 1, false )--清除物件(Obj)身上BuffID 層數(Lv) 觸發效果(Event) 
	ks_QuestKill( OID, 105738, 4 )--任務用隱藏殺人法	
end

function Lua_ZONE20_PE01_Sleep()--怪物睡著
	local OID = OwnerID()
	KS_ClearBuffLV( OID, 509758, 1, false )--清除物件(Obj)身上BuffID 層數(Lv) 觸發效果(Event) 
	ks_QuestKill( OID, 105738, 1 )--任務用隱藏殺人法
end

--=============================================--
--輸送糧食者

function Lua_ZONE20_PE01_Pocket()--私吞糧食
	local OID = OwnerID()
	KS_ClearBuffLV( OID, 509760, 1, false )--清除物件(Obj)身上BuffID 層數(Lv) 觸發效果(Event) 
	ks_QuestKill( OID, 105738, 1 )--任務用隱藏殺人法
end

function Lua_ZONE20_PE01_Feeding()--加料糧食
	KS_ClearBuffLV( OwnerID(), 509760, 1, false )--清除物件(Obj)身上BuffID 層數(Lv) 觸發效果(Event) 
end

function Lua_ZONE20_PE01_Discard()--丟棄糧食
	local Food = OwnerID()
	local master = TargetID()
	KS_ClearBuffLV( master, 509760, 1, false )--清除物件(Obj)身上BuffID 層數(Lv) 觸發效果(Event) 
	WriteRoleValue( Food, EM_RoleValue_PID, master )
	AddBuff( Food, 507899, 0, -1 )--不可攻擊
	Hide(Food)
	SetModeEx( Food , EM_SetModeType_Strikback , true )		-- 反擊
	SetModeEx( Food , EM_SetModeType_NotShowHPMP , true )	-- 不顯示血條
	SetModeEx( Food , EM_SetModeType_DisableRotate, true )	--禁止轉向
	Show(Food, 0 )
	AddBuff( Food, 507899, 0, -1 )--不可攻擊
	
	SetPlot( Food, "Dead", "Lua_ZONE20_PE01_FoodDead", 0 )
	for i=1, 20 do
		SysCastSpellLv( Food, Food, 497708, 0 )
		Sleep(10)
	end
	Lua_ZONE20_PE01_FoodDead()
end

function Lua_ZONE20_PE01_FoodDead()--糧食掛了
	local Food = OwnerID();	
	local master = ReadRoleValue( Food, EM_RoleValue_PID );
	local MstID = ZONE20_PE01_Var["MstID"];
	
	if HateListCount( Food ) > 0 then
		local HateNum = 0
		for i = 1 , HateListCount( Food ) do						
			Hater = HateListInfo( Food ,i-1 , EM_HateListInfoType_GItemID )	
			local OrgID = ReadRoleValue( Hater, EM_RoleValue_OrgID );
			for i=1, table.getn(MstID) do
				if OrgID == MstID[i] then
					HateNum = HateNum+1;
					break
				end
			end
		end
		if HateNum > 0 then
			ks_QuestKill( master, 105738, HateNum );--任務用隱藏殺人法
		end
	end
	DelObj( Food )
	return false
end

function Lua_ZONE20_PE01_DiscardFind()--丟棄糧時找怪
	local Mst = TargetID()
	if ReadRoleValue( Mst, EM_RoleValue_AttackTargetID ) == 0 then
		SetAttack( Mst, OwnerID() )
	end
end

--=============================================--
--補充彈藥者

function Lua_ZONE20_PE01_ReduceArrow()--減少箭矢
	KS_ClearBuffLV( OwnerID(), 509759, 1, false )--清除物件(Obj)身上BuffID 層數(Lv) 觸發效果(Event) 
end

--=============================================--
--散落的文件

function Lua_ZONE20_PE01_DocumentTouch() --觸碰劇情
	SetPlot( OwnerID() , "touch" , "Lua_ZONE20_PE01_DocumentTouch1" , 30 )
end

function Lua_ZONE20_PE01_DocumentTouch1()
	local OID = OwnerID() 	-- 玩家
	local TID = TargetID()  	-- NPC
	
	if ( ( CheckBuff( OID, 509751 ) == true and KS_CheckBuffLV( OID, 509758 ) < 2 ) or ( CheckBuff( OID, 509751 ) ~= true and CheckBuff( OID, 509758 ) ~= true ) ) and 
		CheckBuff( OID, 509759 ) ~= true and CheckBuff( OID, 509760 ) ~= true and CheckBuff( OID, 509761 ) ~= true then
		if BeginCastBarEvent( OID, TID,"[SC_RUNRUNPUMPKIN_05]", 20, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "Lua_ZONE20_PE01_DocumentTouch2" ) ~= 1 then 
			ScriptMessage( OID, OID, 0,"[SAY_NPC_BUSY]", 0 )--目標忙碌中
			return
		end
	else
		ScriptMessage( OID, OID, 1,"[SC_PE_ZONE20_01_FULL]", 0 )--你無法攜帶更多了！
		ScriptMessage( OID, OID, 0,"[SC_PE_ZONE20_01_FULL]", 0 )--你無法攜帶更多了！
	end
end



function Lua_ZONE20_PE01_DocumentTouch2( OID, CheckStatus )
	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then-- 成功
			AddBuff( OID, 509758, 0, -1 );--攜帶文件
			CallPlot( TargetID(), "ks_resetObj", TargetID(), 25 )--重生
		end
		EndCastBar( OID, CheckStatus );
	end
end

--=============================================--
--一整袋的箭

function Lua_ZONE20_PE01_ArrowTouch() --觸碰劇情
	SetPlot( OwnerID() , "touch" , "Lua_ZONE20_PE01_ArrowTouch1" , 30 )
end

function Lua_ZONE20_PE01_ArrowTouch1()
	local OID = OwnerID() 	-- 玩家
	local TID = TargetID()  	-- NPC
	local BuffNum = KS_CheckBuffLV( OID, 509759 );
	if CheckBuff( OID, 509770 ) == true then--不穩定的符文石
		BuffNum = BuffNum+1;
	end
	if CheckBuff( OID, 509774 ) == true then--破魔符文石
		BuffNum = BuffNum+1;
	end
	if 	(	( CheckBuff( OID, 509753 ) == true and BuffNum < 3 ) --有PE狀態
			or ( CheckBuff( OID, 509753 ) ~= true and BuffNum < 1 )	) --普通狀態且沒有箭袋
			and CheckBuff( OID, 509758 ) ~= true --沒有其他資源
			and CheckBuff( OID, 509760 ) ~= true 
			and CheckBuff( OID, 509761 ) ~= true then
		local Time = 30;
		if CheckBuff( OID, 509776 ) == true then--驚人技藝
			Time = 10;
		end
		if BeginCastBarEvent( OID, TID,"[SC_RUNRUNPUMPKIN_05]", Time, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "Lua_ZONE20_PE01_ArrowTouch2" ) ~= 1 then 
			ScriptMessage( OID, OID, 0,"[SAY_NPC_BUSY]", 0 )--目標忙碌中
			return
		end
	else
		ScriptMessage( OID, OID, 1,"[SC_PE_ZONE20_01_FULL]", 0 )--你無法攜帶更多了！
		ScriptMessage( OID, OID, 0,"[SC_PE_ZONE20_01_FULL]", 0 )--你無法攜帶更多了！
	end
end

function Lua_ZONE20_PE01_ArrowTouch2( OID, CheckStatus )
	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then-- 成功
			AddBuff( OID, 509759, 0, -1 );--攜帶箭袋
			--CallPlot( TargetID(), "ks_resetObj", TargetID(), 25 )--重生
		end
		EndCastBar( OID, CheckStatus );
	end
end

--=============================================--
--一袋糧食

function Lua_ZONE20_PE01_FoodTouch() --觸碰劇情
	SetPlot( OwnerID() , "touch" , "Lua_ZONE20_PE01_FoodTouch1" , 30 )
end

function Lua_ZONE20_PE01_FoodTouch1()
	local OID = OwnerID() 	-- 玩家
	local TID = TargetID()  	-- NPC
	
	if ( 	( CheckBuff( OID, 509752 ) == true and 
		( CheckBuff( OID, 509766 ) ~= true and KS_CheckBuffLV( OID, 509760 ) < 2 ) or --加料
		CheckBuff( OID, 509766 ) == true and KS_CheckBuffLV( OID, 509760 ) < 1 ) 
		or ( CheckBuff( OID, 509752 ) ~= true and CheckBuff( OID, 509760 ) ~= true ) ) and 
		
		CheckBuff( OID, 509758 ) ~= true and CheckBuff( OID, 509759 ) ~= true and CheckBuff( OID, 509761 ) ~= true then
		if BeginCastBarEvent( OID, TID,"[SC_RUNRUNPUMPKIN_05]", 20, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "Lua_ZONE20_PE01_FoodTouch2" ) ~= 1 then 
			ScriptMessage( OID, OID, 0,"[SAY_NPC_BUSY]", 0 )--目標忙碌中
			return
		end
	else
		ScriptMessage( OID, OID, 1,"[SC_PE_ZONE20_01_FULL]", 0 )--你無法攜帶更多了！
		ScriptMessage( OID, OID, 0,"[SC_PE_ZONE20_01_FULL]", 0 )--你無法攜帶更多了！
	end
end

function Lua_ZONE20_PE01_FoodTouch2( OID, CheckStatus )
	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then-- 成功
			AddBuff( OID, 509760, 0, -1 );--攜帶糧食
			--CallPlot( TargetID(), "ks_resetObj", TargetID(), 25 )--重生
		end
		EndCastBar( OID, CheckStatus );
	end
end

--=============================================--
--準備好的弓手

function Lua_ZONE20_PE01_RegArcher()--註冊弓手領取者
	ZONE20_PE01_Var["GetArcher"] = OwnerID();	
	--Hide( OwnerID() );
end

function Lua_ZONE20_PE01_ArcherSpeak()--弓手對話
	local TID = TargetID() --補給點
	local OID = OwnerID() --玩家
	
	local BuffNum = KS_CheckBuffLV( OID, 509761 );
	if ZONE20_PE01_Var["ArcherNum"] < 8 and
		( CheckBuff( OID, 509754 ) == true and BuffNum < 2 ) or 
		( CheckBuff( OID, 509754 ) ~= true and BuffNum < 1 ) then--取得指定物件身上BUFF等級 
		
		SetSpeakDetail( OID, "[SC_PE_ZONE20_01_ARCHER]");
		AddSpeakOption( OID, TID, "[SC_PE_ZONE20_01_GETARCHER]", "Lua_ZONE20_PE01_GetArcher", 0 )--領取弓手
	else	
		SetSpeakDetail( OID, "[SC_PE_ZONE20_01_NOARCHER]");
	end
end

function Lua_ZONE20_PE01_GetArcher()--領取弓手
	local TID = TargetID()--目標
	local OID = OwnerID()--使用者
	CloseSpeak( OID );

	Hide( TID)
	WriteRoleValue( TID, EM_RoleValue_PID, 0 );--快速徵招判斷
	SetModeEx( TID, EM_SetModeType_Move, false )
	BeginPlot( TID, "Lua_ZONE20_PE01_ArcherWaiting", 0 );	
	
	local X = ReadRoleValue( TID, EM_RoleValue_X )
	local Y = ReadRoleValue( TID, EM_RoleValue_Y )
	local Z = ReadRoleValue( TID, EM_RoleValue_Z )
	local Archer = CreateObj( 118456, X, Y, Z, 0, 1 );
	
	ZONE20_PE01_Var["ArcherNum"] = ZONE20_PE01_Var["ArcherNum"] + 1;
	WriteRoleValue( Archer, EM_RoleValue_PID, OID );
	SetModeEx( Archer , EM_SetModeType_NotShowHPMP , true )	-- 不顯示血條
	SetModeEx( Archer , EM_SetModeType_HideName , false )	-- 名稱
	AddToPartition( Archer, 0 );
	
	AddBuff( OID, 509761, 0, -1 )--帶領弓手
	BeginPlot( Archer, "Lua_ZONE20_PE01_ArcherRun", 0 );
end

function Lua_ZONE20_PE01_ArcherWaiting()--等待重生
	local OID = OwnerID()
	for i=1, 60 do
		if ReadRoleValue( OID, EM_RoleValue_PID ) > 0 then--快速徵招判斷
			WriteRoleValue( OID, EM_RoleValue_PID, 0 );--快速徵招判斷
			Show( OID, 0 );
			DebugMsg(0,0,"ZONE20_PE01 Archer Show")
			SetModeEx( OID, EM_SetModeType_Move, true )
			return;
		end
		Sleep(10)
	end
	Show( OID, 0 );
	WriteRoleValue( OID, EM_RoleValue_PID, 0 );--快速徵招判斷
	DebugMsg(0,0,"ZONE20_PE01 Archer Show")
	SetModeEx( OID, EM_SetModeType_Move, true )
end

function Lua_ZONE20_PE01_ArcherRun()--弓手移動
	local  OID = OwnerID();
	local master = ReadRoleValue( OID, EM_RoleValue_PID );
	while true do
		if CheckID( master ) == true and CheckBuff( master, 509761 ) == true and --帶領弓手
			ReadRoleValue( master, EM_RoleValue_IsDead )  ~= 1 and DW_CheckMap( master, ZONE20_PE01_Var["MapID"] ) == true then
			SetFollow( OID, master );
		else
			CancelBuff( master, 509761 )
			ZONE20_PE01_Var["ArcherNum"] = ZONE20_PE01_Var["ArcherNum"] - 1;
			DelObj( OID );
		end
		Sleep(10)
	end
end

function Lua_ZONE20_PE01_CheckArcher()--檢查阿洽
	local OID = OwnerID();
	if DW_CheckMap( OID, ZONE20_PE01_Var["MapID"] ) == true then
		local GetArcher = ZONE20_PE01_Var["GetArcher"];
		if GetModeEx( GetArcher, EM_SetModeType_Move ) == false and ZONE20_PE01_Var["ArcherNum"] < 8 then
			return true;
		end
		ScriptMessage( OID, OID, 1,"[SC_PE_ZONE20_01_RECRUIT]", 0 )--目前還不需要緊急徵招。
		return false;
	end
	ScriptMessage( OID, OID, 1 , "[SC_421324_1]" , 0 )--不在目標區域內
	return false;
end

function Lua_ZONE20_PE01_ReArcher()--d1立即補充阿洽
	local OID = OwnerID();
	local GetArcher = ZONE20_PE01_Var["GetArcher"];
	WriteRoleValue( GetArcher, EM_RoleValue_PID, 1 );
	ks_QuestKill( OID, 105738, 4 );--任務用隱藏殺人法
end

function Lua_ZONE20_PE01_ArcherExit()--阿洽離開
	local OID = OwnerID();
	AddBuff( OID, 506098, 0, 1 )--畫面一黑
	local Ctrl = ReadRoleValue( OID, EM_RoleValue_Register2 );
	local X = ReadRoleValue( Ctrl, EM_RoleValue_X );
	local Y = ReadRoleValue( Ctrl, EM_RoleValue_Y );
	local Z = ReadRoleValue( Ctrl, EM_RoleValue_Z );
	WriteRoleValue( OID, EM_RoleValue_Register2, 0 );
	ZONE20_PE01_ArcherGroup[Ctrl]["Member"][3] = nil;
	CancelBuff( OID, 509791 ) --沒飯吃	
	Y = GetHeight( X, Y, Z )
	SetPos( OID, X, Y, Z, 0 );
end

--=============================================--
--裝備精良的屍體

function Lua_ZONE20_PE01_SetDeader()
	SetDefIdleMotion( OwnerID(), ruFUSION_MIME_IDLE_DEAD );
end

--=============================================--
--加強指揮

function Lua_ZONE20_PE01_PriorityAttack()--優先攻擊
	local TID = TargetID();
	AddBuff( TID, 509779, 0, -1 );--優先目標
	WriteRoleValue( TID, EM_RoleValue_Register2, OwnerID() );
	local ArcherGroup = ZONE20_PE01_ArcherGroup;
	for Ctrl in pairs( ArcherGroup ) do
		for i=1, 3 do
			if ArcherGroup[Ctrl]["Member"][i] ~= nil and CheckID( ArcherGroup[Ctrl]["Member"][i] ) == true then				
				if ReadRoleValue( ArcherGroup[Ctrl]["Member"][i], EM_RoleValue_IsPlayer ) ~= 1 and
					GetDistance( ArcherGroup[Ctrl]["Member"][i], TID ) < 250 and
					ReadRoleValue( ArcherGroup[Ctrl]["Member"][i], EM_RoleValue_AttackTargetID ) ~= TID then
					ClearHateList( ArcherGroup[Ctrl]["Member"][i], -1 );
					SetAttack( ArcherGroup[Ctrl]["Member"][i], TID );
				end
			end
		end
	end	
end

function Lua_ZONE20_PE01_ComicArrow()--連環箭
	local TID = TargetID();
	AddBuff( TID, 620019, 0, -1 );--眾矢之的
	WriteRoleValue( TID, EM_RoleValue_Register3, OwnerID() );
	local ArcherGroup = ZONE20_PE01_ArcherGroup;
	for Ctrl in pairs( ArcherGroup ) do
		for i=1, 3 do
			if ArcherGroup[Ctrl]["Member"][i] ~= nil and CheckID( ArcherGroup[Ctrl]["Member"][i] ) == true then				
				if ReadRoleValue( ArcherGroup[Ctrl]["Member"][i], EM_RoleValue_IsPlayer ) ~= 1 and
					GetDistance( ArcherGroup[Ctrl]["Member"][i], TID ) < 250 and
					ReadRoleValue( ArcherGroup[Ctrl]["Member"][i], EM_RoleValue_AttackTargetID ) ~= TID then
					ClearHateList( ArcherGroup[Ctrl]["Member"][i], -1 );
					SetAttack( ArcherGroup[Ctrl]["Member"][i], TID );
				end
			end
		end
	end	
end

function Lua_ZONE20_PE01_PayCommandCheck()--繳交命令檢查
	local OID = OwnerID()
	if DW_CheckMap( OID, ZONE20_PE01_Var["MapID"] ) == true or DW_CheckMap( OID, 1 ) == true then
		if CheckBuff( TargetID(), 509758 ) == true then--攜帶文件
			if CheckBuff( OID, 620022 ) ~= true then--沒有知悉秘密
				return true;
			end
			ScriptMessage( OID, OID, 1 , "[SC_PE_ZONE20_01_SECRET]" , 0 )--你已經擁有知悉秘密
			return false;
		end
		ScriptMessage( OID, OID, 1 , "[SC_PE_ZONE20_01_COMMAND]" , 0 )--目標沒有符合的狀態
		return false;
	end
	ScriptMessage( OID, OID, 1 , "[SC_421324_1]" , 0 )--不在目標區域內
	return false;
end

function Lua_ZONE20_PE01_GetSecret()--取得秘密
	local OID = OwnerID();
	local TID = TargetID();
	local Num = 1;
	AddBuff( OID, 509780, 0, -1 )--知悉秘密
	
	if OID == TID then
		AddBuff( OID, 509817, 3, -1 );--機密知情者
		ks_QuestKill( OID, 105738, 2 );--任務用隱藏殺人法
	else
		ks_QuestKill( OID, 105738, 1 );--任務用隱藏殺人法
		if CheckAcceptQuest( TID, 424292 ) == true then
			ks_QuestKill( TID, 105738, 1 );--任務用隱藏殺人法
			AddBuff( TID, 509817, 3, -1 );--機密知情者
		else
			AddBuff( TID, 509814, 3, -1 );--將軍的讚揚
		end
	end	
	
	CancelBuff( OID, 509758 )--消除文件
end

function Lua_ZONE20_PE01_ClearArcherCheck()--清除弓手檢查
	local OID = OwnerID()
	if DW_CheckMap( OID, ZONE20_PE01_Var["MapID"] ) == true then
		local ArcherGroup = ZONE20_PE01_ArcherGroup;
		for Ctrl in pairs( ArcherGroup ) do
			if GetDistance( OID, Ctrl ) < 100 then
				for i=1, 3 do
					if ArcherGroup[Ctrl]["Member"][i] ~= nil and CheckID( ArcherGroup[Ctrl]["Member"][i] ) == true then
						return true;
					end
				end
			end
		end
		ScriptMessage( OID, OID, 1 , "[SC_PE_ZONE20_01_NOSUPPLY]" , 0 )--附近沒有防禦箭塔
		return false;
	end
	ScriptMessage( OID, OID, 1 , "[SC_421324_1]" , 0 )--不在目標區域內
	return false;
end

function Lua_ZONE20_PE01_ClearArcher()--清除弓手
	local OID = OwnerID();
	local ArcherGroup = ZONE20_PE01_ArcherGroup;
	for Ctrl in pairs( ArcherGroup ) do
		if GetDistance( OID, Ctrl ) < 100 then
			for i=1, 3 do
				if ArcherGroup[Ctrl]["Member"][i] ~= nil and CheckID( ArcherGroup[Ctrl]["Member"][i] ) == true then				
					if ReadRoleValue( ArcherGroup[Ctrl]["Member"][i], EM_RoleValue_IsPlayer ) == 1 then
						CancelBuff( ArcherGroup[Ctrl]["Member"][i], 509781 );
					else
						DelObj( ArcherGroup[Ctrl]["Member"][i] );
						ZONE20_PE01_Var["ArcherNum"] = ZONE20_PE01_Var["ArcherNum"] - 1;
					end
				end
			end
			ks_QuestKill( OID, 105738, 5 );--任務用隱藏殺人法
			return;
		end
	end
end

function Lua_ZONE20_PE01_FindWeakness()--洞悉弱點
	local OID = OwnerID();
	KS_ClearBuffLV( OID, 509758, 1, false );--清除物件(Obj)身上BuffID 層數(Lv) 觸發效果(Event) 
	CancelBuff( OID, 509780 );
	local ArcherGroup = ZONE20_PE01_ArcherGroup;
	for Ctrl in pairs( ArcherGroup ) do
		for i=1, 3 do
			if ArcherGroup[Ctrl]["Member"][i] ~= nil and CheckID( ArcherGroup[Ctrl]["Member"][i] ) == true then
				AddBuff( ArcherGroup[Ctrl]["Member"][i], 509782, 0, -1);--洞悉弱點
			end
		end
	end
	ks_QuestKill( OID, 105738, 4 );--任務用隱藏殺人法
end
--=============================================--
--火力支援

function Lua_ZONE20_PE01_SetBomb()--放炸彈
	local OID = OwnerID()
	local X = ReadRoleValue( OID, EM_RoleValue_X )
	local Y = ReadRoleValue( OID, EM_RoleValue_Y )
	local Z = ReadRoleValue( OID, EM_RoleValue_Z )
	local Bomb = CreateObj( 105740, X, Y, Z, 0, 1 )
	SetModeEx( Bomb , EM_SetModeType_NotShowHPMP , true )	-- 不顯示血條
	SetModeEx( Bomb, EM_SetModeType_Move , false )		-- 移動
	SetModeEx( Bomb , EM_SetModeType_ShowRoleHead , false )	-- 頭像框
	SetModeEx( Bomb , EM_SetModeType_Fight, false )			-- 可砍殺攻擊
	AddToPartition( Bomb, 0 )
	WriteRoleValue( Bomb, EM_RoleValue_PID, OID )
	BeginPlot( Bomb, "Lua_ZONE20_PE01_BombAttack", 0 )
end

function Lua_ZONE20_PE01_BombAttack()--炸彈吸引
	local Bomb = OwnerID()
	local MstID = ZONE20_PE01_Var["MstID"];
	
	for i=1, 20 do
		Sleep(10)
		local NPC = SearchRangeNPC( Bomb, 80 );
		for i=0, table.getn(NPC)-1 do
			local OrgID = ReadRoleValue( NPC[i], EM_RoleValue_OrgID );
			for i=1, table.getn(MstID) do
				if OrgID == MstID[i] then
					CastSpell( Bomb, Bomb, 497709 )--自爆
					Sleep(5)
					DelObj( Bomb)
					return
				end
			end
		end
	end
	DelObj( Bomb)
end

function Lua_ZONE20_PE01_SetMagic()--設定魔力束縳者
	local OID = OwnerID()
	Hide(OID)
	SetModeEx( OID , EM_SetModeType_NotShowHPMP , true )	-- 不顯示血條
	SetModeEx( OID, EM_SetModeType_Move , false )		-- 移動	
	SetModeEx( OID , EM_SetModeType_HideName , true )		-- 名稱
	Show( OID, 0 )
	AddBuff( OID, 508946, 0, -1 )--無敵+裝死
	CastSpell( OID, OID, 497711 )--施放魔力束縳
end

--=============================================--
--傀儡戰士利用

function Lua_ZONE20_PE01_CheckPuppet()--傀儡檢查
	local OID = OwnerID();
	if ReadRoleValue( TargetID(), EM_RoleValue_OrgID ) == ZONE20_PE01_Var["DeaderID"] then
		local Puppet = ReadRoleValue( OID, EM_RoleValue_Register3 );
		if Puppet == 0 or ( Puppet ~= 0 and CheckID( Puppet ) ~= true ) then
			return true;
		else
			ScriptMessage( OID, OID, 1 , "[SC_PE_ZONE20_01_PUPPET]" , 0 );--魁儡已存在
			return false;
		end
	end
	ScriptMessage( OID, OID, 1 , "[EM_200928_2]" , 0 );--目標錯誤
	return false;
end

function Lua_ZONE20_PE01_CreatePuppet()--創造魁儡
	local TID = TargetID()--目標
	local OID = OwnerID()--使用者
	
	local X = ReadRoleValue( TID, EM_RoleValue_X )
	local Y = ReadRoleValue( TID, EM_RoleValue_Y )
	local Z = ReadRoleValue( TID, EM_RoleValue_Z )
	CallPlot( TID, "ks_resetObj", TID, 25 )
		
	local Puppet = CreateObj( 105741, X, Y, Z, 0, 1 );
	WriteRoleValue( OID, EM_RoleValue_Register3, Puppet )--記錄
	
	WriteRoleValue( Puppet, EM_RoleValue_PID, OID );
	SetModeEx( Puppet, EM_SetModeType_Fight , true )		-- 可砍殺攻擊
	SetModeEx( Puppet , EM_SetModeType_Strikback , true )		-- 反擊
	SetModeEx( Puppet, EM_SetModeType_Searchenemy , false )	-- 索敵
	AddToPartition( Puppet, 0 );
		
	AddBuff( Puppet, 509789, 0, -1 );--檢查主人
	CancelBuff( OID, 509758 );
end

function Lua_ZONE20_PE01_PuppetCheckMaster()--傀儡檢查主人
	local OID = OwnerID();
	local Master = ReadRoleValue ( OID , EM_RoleValue_PID );
	if	CheckBuff( OID, 509789 ) ~= true or CheckID( Master ) ~= true or 
		( DW_CheckMap( Master, ZONE20_PE01_Var["MapID"] ) ~= true and 
		DW_CheckMap( Master, 1 ) ~= true ) or
		ReadRoleValue( Master, EM_RoleValue_IsDead ) == 1 or 
		ReadRoleValue( OID, EM_RoleValue_IsDead ) == 1 then
		
		local X = ReadRoleValue( OID, EM_RoleValue_X );
		local Y = ReadRoleValue( OID, EM_RoleValue_Y );
		local Z = ReadRoleValue( OID, EM_RoleValue_Z );
		local Facker = CreateObj( ZONE20_PE01_Var["DeaderID"], X, Y, Z, 0, 1 );
		ks_ActorMode( Facker, true );
		AddToPartition( Facker, 0 );
		WriteRoleValue( Facker, EM_RoleValue_LiveTime, 10 );
		SetDefIdleMotion( Facker, ruFUSION_ACTORSTATE_DEAD );
		DelObj( OID );
	elseif ReadRoleValue( OID, EM_RoleValue_AttackTargetID ) == 0 then
		local X = ReadRoleValue( master, EM_RoleValue_X );
		local Y = ReadRoleValue( master, EM_RoleValue_Y );
		local Z = ReadRoleValue( master, EM_RoleValue_Z );
		ks_Move( OID, 30, X, Y, Z ) --對象(RoleID)移動到指定位置
	end
end

function Lua_ZONE20_PE01_DelPuppet()--清除魁儡
	local OID = OwnerID();
	local master = ReadRoleValue( OID, EM_RoleValue_PID );
	WriteRoleValue( master, EM_RoleValue_Register3, 0 )--記錄
	DelObj( OID);
end

function Lua_ZONE20_PE01_CheckMyPuppet( Mode )--傀儡檢查
	local OID = OwnerID();
	local Puppet = ReadRoleValue( OID, EM_RoleValue_Register3 );
	if Puppet ~= 0 and CheckID(Puppet) == true and ReadRoleValue( Puppet, EM_RoleValue_OrgID ) == 105741 then
		Mode = Mode or 0;
		if Mode == 1 then
			local MstID = ZONE20_PE01_Var["MstID"];
			local OrgID = ReadRoleValue( TargetID(), EM_RoleValue_OrgID );
			for i=1, table.getn(MstID) do
				if OrgID == MstID[i] then
					return true;
				end
			end
			ScriptMessage( OID, OID, 1 , "[EM_200928_2]" , 0 );--目標錯誤
			return false;
		end
		return true;
	end
	
	ScriptMessage( OID, OID, 1 , "[SC_PE_ZONE20_01_NOPUPPET]" , 0 );--目前沒有可使用的傀儡
	return false;
end

function Lua_ZONE20_PE01_PuppetCharge()--魁儡衝鋒
	local TID = TargetID()--目標
	local OID = OwnerID()--使用者	
	local Puppet = ReadRoleValue( OID, EM_RoleValue_Register3 );
	SetStopAttack( Puppet )--停止攻擊
	ClearHateList( Puppet, -1 )--清除仇恨	
	if GetDistance( Puppet, TID ) > 50 then
		KS_Move( Puppet, 35, TID );
	end
	SysCastSpellLv( TID, Puppet, 496946, 100 )--給予仇恨
	SetAttack( Puppet, TID );
end

function Lua_ZONE20_PE01_BuffPuppet()--給與魁儡強化
	local OID = OwnerID();
	CancelBuff( OID, 509758 );
	
	local Puppet = ReadRoleValue( OID, EM_RoleValue_Register3 );
	AddBuff( Puppet, 509788, 0, -1 );--傀儡戰士強化	
	
	CancelBuff_NoEvent( Puppet, 509789 );--傀儡戰士檢查
	AddBuff( Puppet, 509789, 0, -1 );--重置存在時間
end

function Lua_ZONE20_PE01_CheckBuffPuppet( Type )--檢查魁儡強化狀態
	if Type == 1 and CheckBuff( OwnerID(), 509788 ) ~= true then
		return true;
	elseif Type == 2 and CheckBuff( OwnerID(), 509788 ) == true then
		return true;
	end
	return false;
end

function Lua_ZONE20_PE01_PuppetBomb()--魁儡炸彈
	local OID = OwnerID()
	local Puppet = ReadRoleValue( OID, EM_RoleValue_Register3 );
	WriteRoleValue( OID, EM_RoleValue_Register3, 0 );
	SetModeEx( Puppet , EM_SetModeType_Strikback , false )		-- 反擊	
	SetModeEx( Puppet , EM_SetModeType_Move, false )
	SetStopAttack( Puppet );
	BeginPlot( Puppet, "Lua_ZONE20_PE01_PuppetBombGo", 0 )--自爆吧
end

function Lua_ZONE20_PE01_PuppetBombGo()
	local Puppet = OwnerID();
	Sleep(10)
	CastSpell( Puppet, Puppet, 497743 )--自爆
	SetModeEx( Puppet, EM_SetModeType_Fight , false )		-- 可砍殺攻擊
end

--=============================================--
--文件管理者

function Lua_ZONE20_PE01_ManagerSpeak()--管理員對話
	local TID = TargetID() --補給點
	local OID = OwnerID() --玩家
	SetSpeakDetail( OID, "[SC_PE_ZONE20_01_MANAGER]");
	if CheckBuff( OID, 509758 ) == true then--攜帶文件
		AddSpeakOption( OID, TID, "[SC_PE_ZONE20_01_PAY_DOC]", "Lua_ZONE20_PE01_PayDocument",0) --繳交文件。
	end
end


function Lua_ZONE20_PE01_PayDocument()--繳交文件
	local OID = OwnerID();
	CloseSpeak( OID );
	if CheckAcceptQuest( OID, 424292 ) == true then
		AddBuff( OID, 509817, 0, -1 );--機密知情者
		if CheckBuff( OID, 509751 ) == true then--文件解讀專家
			ks_QuestKill( OID, 105738, 2 );--任務用隱藏殺人法
		else
			ks_QuestKill( OID, 105738, 1 );--任務用隱藏殺人法
		end
	else
		AddBuff( OID, 509814, 4, -1 );--將軍的讚揚
	end
	CancelBuff( OID, 509758 );
end

--=============================================--
--補給點

function Lua_ZONE20_PE01_SupplySpeak()--補給點對話
	local TID = TargetID() --補給點
	local OID = OwnerID() --玩家
	local ArcherGroup = ZONE20_PE01_ArcherGroup;
	local Food = ArcherGroup[TID]["Food"];
	local Ammunition = ArcherGroup[TID]["Ammunition"];
	SetSpeakDetail( OID, "[SC_PE_ZONE20_01_SUPPLY][$SETVAR1 = "..Ammunition.."][$SETVAR2 = "..Food.."]" ) --目前彈藥量:X 糧食量:Y
	
	if CheckBuff( OID, 509759 ) == true or CheckBuff( OID, 509770 ) == true  or CheckBuff( OID, 509774 ) == true then --攜帶箭袋/不穩定的符文石/破魔符文石
		AddSpeakOption( OID, TID, "[SC_PE_ZONE20_01_PAY_ARROW]", "Lua_ZONE20_PE01_PayArrow",0) --繳交箭袋。
	end
	if CheckBuff( OID, 509760 ) == true or CheckBuff( OID, 509766 ) == true then--攜帶糧食/加料糧食
		AddSpeakOption( OID, TID, "[SC_PE_ZONE20_01_PAY_FOOD]", "Lua_ZONE20_PE01_PayFood",0) --繳交糧食。
	end
	
	if CheckBuff( OID, 509761 ) == true or  CheckBuff( OID, 509777 ) == true then--帶領弓手
		AddSpeakOption( OID, TID, "[SC_PE_ZONE20_01_SUPPLY_ARCHER]", "Lua_ZONE20_PE01_SupplyArcher",0) --補充弓手。
	end
end

function Lua_ZONE20_PE01_PayArrow()--繳交箭袋
	local OID = OwnerID();
	local Ctrl = TargetID();
	local ArcherGroup = ZONE20_PE01_ArcherGroup;
	local FlagSite = ReadRoleValue( Ctrl, EM_RoleValue_PID );
	CloseSpeak( OID );
	
	local BuffNum = KS_CheckBuffLV( OID, 509759 )--取得指定物件身上BUFF等級
	if CheckAcceptQuest( OID, 424292 ) == true then
		AddBuff( OID, 509815, FlagSite-1, -1 );--速射的秘訣		
				
		if CheckBuff( OID, 509770 ) == true then--不穩定的符文石
			BuffNum = BuffNum+1;
		end
		if CheckBuff( OID, 509774 ) == true then--破魔符文石
			BuffNum = BuffNum+1;
		end
		
		ks_QuestKill( OID, 105738, BuffNum );--任務用隱藏殺人法
		ArcherGroup[Ctrl]["Ammunition"] = ArcherGroup[Ctrl]["Ammunition"] + BuffNum*40;
	else
		AddBuff( OID, 509814, FlagSite-1, -1 );--將軍的讚揚
		ArcherGroup[Ctrl]["Ammunition"] = ArcherGroup[Ctrl]["Ammunition"] +40;
	end

	for i=1, 3 do
		if ArcherGroup[Ctrl]["Member"][i] ~= nil and CheckID( ArcherGroup[Ctrl]["Member"][i] ) == true then
			if BuffNum == 3 then
				AddBuff( ArcherGroup[Ctrl]["Member"][i], 509768, 0, -1 );--濫用箭矢
			end
			if CheckBuff( OID, 509770 ) == true then--不穩定的符文石
				AddBuff( ArcherGroup[Ctrl]["Member"][i], 509775, 0, -1 );--爆裂箭矢
			end
			if CheckBuff( OID, 509774 ) == true then--破魔符文石
				AddBuff( ArcherGroup[Ctrl]["Member"][i], 509773, 0, -1 );--穿魔箭矢
			end
		end
	end
	
	CancelBuff( OID, 509759 );
	CancelBuff( OID, 509770 );
	CancelBuff( OID, 509774 );
end

function Lua_ZONE20_PE01_PayFood()--繳交糧食
	local OID = OwnerID();
	local Ctrl = TargetID();
	local ArcherGroup = ZONE20_PE01_ArcherGroup;
	local FlagSite = ReadRoleValue( Ctrl, EM_RoleValue_PID );
	CloseSpeak( OID );
	
	if CheckAcceptQuest( OID, 424292 ) == true then		
		AddBuff( OID, 509816, FlagSite-1, -1 );--氣力的來源
		local BuffNum = KS_CheckBuffLV( OID, 509760 )--取得指定物件身上BUFF等級
		if CheckBuff( OID, 509766 ) == true then--加料糧食
			BuffNum = BuffNum+1;
		end
		ks_QuestKill( OID, 105738, BuffNum );--任務用隱藏殺人法
		ArcherGroup[Ctrl]["Food"] = ArcherGroup[Ctrl]["Food"] + BuffNum*40;
	else
		AddBuff( OID, 509814, FlagSite-1, -1 );--將軍的讚揚
		ArcherGroup[Ctrl]["Food"] = ArcherGroup[Ctrl]["Food"] + 40;
	end
	
	if CheckBuff( OID, 509766 ) == true then--加料糧食
		for i=1, 3 do
			if ArcherGroup[Ctrl]["Member"][i] ~= nil and CheckID( ArcherGroup[Ctrl]["Member"][i] ) == true then
				AddBuff( ArcherGroup[Ctrl]["Member"][i], 509767, 0, -1 )--興奮狀態
			end
		end
		CancelBuff( OID, 509766 );
	end
	
	CancelBuff( OID, 509760 );
end

function Lua_ZONE20_PE01_SupplyArcher()--補充弓手
	local OID = OwnerID();
	local Ctrl = TargetID();
	local ArcherGroup = ZONE20_PE01_ArcherGroup;
	local FlagSite = ReadRoleValue( Ctrl, EM_RoleValue_PID );
	CloseSpeak( OID );
	
	if CheckAcceptQuest( OID, 424292 ) == true then--補充弓手	
		local ArcherGroup = ZONE20_PE01_ArcherGroup;
		AddBuff( OID, 509818, FlagSite-1, -1 );--護送者
		
		local BuffNum = KS_CheckBuffLV( OID, 509761 )--取得指定物件身上BUFF等級
		if BuffNum > 0 then
			CallPlot( Ctrl, "Lua_ZONE20_PE01_CreateArcher", Ctrl, BuffNum )--創造弓手
			ks_QuestKill( OID, 105738, BuffNum );--任務用隱藏殺人法
		end
		if CheckBuff( OID, 509777 ) == true and ArcherGroup[Ctrl]["Member"][3] == nil 
			or ( ArcherGroup[Ctrl]["Member"][3] ~= nil and CheckID(ArcherGroup[Ctrl]["Member"][3]) ~= true ) then--志願者
			
			CancelBuff( OID, 509777 )--解除志願者
			DetachObj( OID )--解除搭乘
			AddBuff( OID, 509379, 0, -1)--解除坐騎
			local ArcherFlag = ZONE20_PE01_Var["ArcherFlag"];
			ArcherGroup[Ctrl]["Member"][3] = OID;
			local BaseX = GetMoveFlagValue( ArcherFlag, FlagSite, EM_RoleValue_X );
			local BaseY = GetMoveFlagValue( ArcherFlag, FlagSite, EM_RoleValue_Y );
			local BaseZ = GetMoveFlagValue( ArcherFlag, FlagSite, EM_RoleValue_Z );
			local X = BaseX - 15*math.cos(math.pi*2);
			local Z = BaseZ + 15*math.sin(math.pi*2);
			local Dir = CalDir( (X - BaseX), (Z - BaseZ) );
			AddBuff( OID, 506098, 0, 2 )--畫面一黑
			WriteRoleValue( OID, EM_RoleValue_Register2, Ctrl );
			AddBuff( OID, 509781, 0, -1 )--防禦弓手
			Y = GetHeight( X, BaseY, Z )
			SetPos( OID, X, BaseY+5, Z, Dir );
		end
	else
		AddBuff( OID, 509814, FlagSite-1, -1 );--將軍的讚揚
		Lua_ZONE20_PE01_CreateArcher( Ctrl, 1 )--創造弓手
	end
	CancelBuff( OID, 509761 )--帶領弓手
end

function Lua_ZONE20_PE01_CreateSupply()--設定補給點
	local SupplyFlag = ZONE20_PE01_Var["SupplyFlag"];
	local SupplyID = ZONE20_PE01_Var["SupplyID"];	
	for i=1, 4 do
		local X = GetMoveFlagValue( SupplyFlag, i, EM_RoleValue_X )
		local Y = GetMoveFlagValue( SupplyFlag, i, EM_RoleValue_Y )
		local Z = GetMoveFlagValue( SupplyFlag, i, EM_RoleValue_Z )
		local Dir = GetMoveFlagValue( SupplyFlag, i, EM_RoleValue_Dir )
		obj = CreateObj( SupplyID, X, Y, Z, Dir, 1 );
		SetModeEx( obj , EM_SetModeType_NotShowHPMP , true )	-- 不顯示血條
		SetModeEx( obj , EM_SetModeType_ShowRoleHead , false )	-- 頭像框		
		AddToPartition( obj, 0 );
		CallPlot( obj, "Lua_ZONE20_PE01_CtrlArcher", i );
	end
end

function Lua_ZONE20_PE01_CtrlArcher( Site )--弓手控制
	local Ctrl = OwnerID();
	local ArcherGroup = ZONE20_PE01_ArcherGroup;
	WriteRoleValue( Ctrl, EM_RoleValue_PID, Site )
	ArcherGroup[Ctrl] = {};
	ArcherGroup[Ctrl]["Member"] = {};
	ArcherGroup[Ctrl]["Food"] = 500;
	ArcherGroup[Ctrl]["Ammunition"] = 500;
	Lua_ZONE20_PE01_CreateArcher( Ctrl, 1 );--創造弓手
	
	while true do
		for i=1, 3 do
			local Member = ArcherGroup[Ctrl]["Member"][i];
			if Member ~= nil and CheckID( Member ) == true and 
				(ReadRoleValue( Member, EM_RoleValue_IsPlayer ) == 1 or 
				ReadRoleValue( Member, EM_RoleValue_OrgID ) == ZONE20_PE01_Var["ArcherID"] ) then
				
				if ArcherGroup[Ctrl]["Food"] > 0 then
					ArcherGroup[Ctrl]["Food"] = ArcherGroup[Ctrl]["Food"] - 10;
					CancelBuff( Member, 509791 )
				elseif CheckBuff( Member, 509791 ) ~= true then
					AddBuff( Member, 509791, 0, -1 )--沒飯吃
				end
			end
		end
		sleep(100)
	end
end

function Lua_ZONE20_PE01_CreateArcher( Ctrl, Num )--創造弓手
	local ArcherGroup = ZONE20_PE01_ArcherGroup;
	local ArcherID = ZONE20_PE01_Var["ArcherID"];
	local ArcherFlag = ZONE20_PE01_Var["ArcherFlag"];
	local FlagSite = ReadRoleValue( Ctrl, EM_RoleValue_PID );
	local BaseX = GetMoveFlagValue( ArcherFlag, FlagSite, EM_RoleValue_X );
	local BaseY = GetMoveFlagValue( ArcherFlag, FlagSite, EM_RoleValue_Y );
	local BaseZ = GetMoveFlagValue( ArcherFlag, FlagSite, EM_RoleValue_Z );
	local CreateNum = 0;
	local Member;
	
	for i=1, 2 do
		Member = ArcherGroup[Ctrl]["Member"][i];
		if Member == nil or ( Member ~= nil and CheckID(Member) ~= true ) then
			local X = BaseX - 15*math.cos(math.pi*2*(i/3));
			local Z = BaseZ + 15*math.sin(math.pi*2*(i/3));
			local Dir = CalDir( (X - BaseX), (Z - BaseZ) );
			obj = CreateObj( ArcherID, X, BaseY, Z, Dir, 1 );
			WriteRoleValue( obj, EM_RoleValue_Register2, Ctrl );
			SetModeEx( obj, EM_SetModeType_Move , false );		-- 移動
			AddToPartition( obj, 0 );
			AddBuff( obj, 508946, 0,-1);--無敵+裝死
			ArcherGroup[Ctrl]["Member"][i] = obj;
			ZONE20_PE01_Var["ArcherNum"] = ZONE20_PE01_Var["ArcherNum"] + 1;
			CreateNum = CreateNum+1;
		elseif ArcherGroup[Ctrl]["Member"][2] ~= nil and CheckID(ArcherGroup[Ctrl]["Member"][2]) == true then
			CheckBuff( Member, 509792 )--疲憊
			CheckBuff( Member, 509782 )--洞悉弱點
			CheckBuff( Member, 509767 )--興奮狀態
			ZONE20_PE01_Var["ArcherNum"] = ZONE20_PE01_Var["ArcherNum"] - 1;
			CreateNum = CreateNum+1;
		end
		if CreateNum >= Num then
			return;
		end
	end
end

function Lua_ZONE20_PE01_GetArcherNum()--取得場上弓手數量
	local ArcherGroup = ZONE20_PE01_ArcherGroup
	local Num = 0;	
	for Ctrl in pairs( ArcherGroup ) do
		for i=1, 3 do
			if ArcherGroup[Ctrl]["Member"][i] ~= nil and CheckID( ArcherGroup[Ctrl]["Member"][i] ) == true then
				Num = Num +1;
			end
		end
	end
	ZONE20_PE01_Var["ArcherNum"] = Num;
	DebugMsg( 0,0, "ArcherNum = "..ZONE20_PE01_Var["ArcherNum"] )

end

function Lua_ZONE20_PE01_ArcherAttackBegin()--弓手攻擊
	local OID = OwnerID()
	local ArcherGroup = ZONE20_PE01_ArcherGroup;
	local Ctrl = ReadRoleValue( OID, EM_RoleValue_Register2 );
	if Ctrl == 0 then return end
	
	if ArcherGroup[Ctrl]["Ammunition"] <= 0 then--彈藥不足
		if ReadRoleValue( OID, EM_RoleValue_IsPlayer ) == 1 then
			ScriptMessage( OID, OID, 1 , "[SC_PE_ZONE20_01_CANT_FIRE]" , 0 )--彈藥不足
		end
		return false;
	end
	
	local TID = TargetID();
	local MstID = ZONE20_PE01_Var["MstID"];
	local OrgID = ReadRoleValue( TID, EM_RoleValue_OrgID );
	for i=1, table.getn(MstID) do
		if OrgID == MstID[i] then
			return true;
		end
	end
	if CheckBuff( OID, 509781 ) == true then--防禦弓手
		ScriptMessage( OID, OID, 1 , "[EM_200928_2]" , 0 );--目標錯誤
	end
	return false
end

function Lua_ZONE20_PE01_ArcherAttackEnd()--弓手攻擊結束
	local OID = OwnerID()
	local ArcherGroup = ZONE20_PE01_ArcherGroup;
	
	local Ctrl = ReadRoleValue( OID, EM_RoleValue_Register2 );
	if Ctrl == 0 then return end
	
	ArcherGroup[Ctrl]["Ammunition"] = ArcherGroup[Ctrl]["Ammunition"] - 2;

	if CheckBuff( OID, 509781 ) ~= true then--防禦弓手
		if CheckBuff( OID, 509767 ) == true then--興奮狀態
			AddBuff( OID, 509792, 1, -1 )--疲累
		else
			AddBuff( OID, 509792, 0, -1 )--疲累
		end
		if KS_CheckBuffLV( OID, 509792 ) >= 20 then--取得指定物件身上BUFF等級	
			ZONE20_PE01_Var["ArcherNum"] = ZONE20_PE01_Var["ArcherNum"] - 1;
			DelObj( OID )			
		end
	end
end

function Lua_ZONE20_PE01_ArcherAttackCheck( Type )--弓手目標檢查
	local OID = OwnerID();
	local TID = TargetID();

	local MstID = ZONE20_PE01_Var["MstID"];
	local OrgID = ReadRoleValue( TID, EM_RoleValue_OrgID );
	if CheckBuff( OID, 509773 ) == true and OrgID == MstID[3] then--穿魔箭矢
		if CheckBuff( TID, 509832 ) == true then
			CancelBuff( TID, 509832 );
			KillID( OID, TID )
		end
		return;
	end
	
	if OrgID == MstID[Type] then
		local Lv = 1;
		if CheckBuff( OID, 509837 ) ~= true then--射擊判斷
			if CheckBuff( OID, 509767 ) == true then--興奮狀態
				Lv =Lv+1;
			end
			if CheckBuff( OID, 509782 ) == true then--洞悉弱點
				Lv =Lv+2;
			end
			if CheckBuff( OID, 509791 ) == true then--沒飯吃
				Lv =Lv-1;
			end
			AddBuff( OID, 509837, Lv, -1 ) --射擊判斷
		end
		
		if Lv ~= 1 and CheckBuff( OID, 509775 ) ~= true then--爆裂箭矢
			SysCastSpellLv( OID, TID, 497741, Lv )--射擊
			return false;
		elseif CheckBuff( OID, 509775 ) == true then--爆裂箭矢
			local Lv = KS_CheckBuffLV( OID, 509837 );
			SysCastSpellLv( OID, TID, 497716, Lv )--爆裂箭
			CancelBuff( OID, 509837 ) --射擊判斷
			return false;
		end
		 CancelBuff( OID, 509837 ) --射擊判斷
		return true;
	end
	return false;
end

function Lua_ZONE20_PE01_AttackDoublueCheck( Type )--弓手目標檢查
	local OID = OwnerID();
	local TID = TargetID();

	local MstID = ZONE20_PE01_Var["MstID"];
	local OrgID = ReadRoleValue( TID, EM_RoleValue_OrgID );
	
	if OrgID == MstID[Type] then
		return true;
	end
	return false;
end

--=============================================--
--NPC設定

function Lua_ZONE20_PE01_SetGeneral()--設定將軍
	local OID = OwnerID();
	ZONE20_PE01_Var["General"] = OID;
	
	AddBuff( OID, 509929, 0, -1 );--回血
	AddBuff( OID, 502707, 0,-1 );--停止回血
	local MaxHP = ReadRoleValue( OID, EM_RoleValue_MaxHP );
	WriteRoleValue( OID, EM_RoleValue_HP, MaxHP*0.5 );
end

function Lua_ZONE20_PE01_GeneralBuff()--將軍回血
	if HateListCount( OwnerID() ) < 1 then
		AddBuff( OwnerID(), 509929, 0, -1 );--回血
	end
end

function Lua_ZONE20_PE01_SetBarricades()--拒馬設定
	local Barricades = ZONE20_PE01_Barricades;
	local OID = OwnerID();
	SetModeEx( OID, EM_SetModeType_Fight , true );-- 可砍殺攻擊
	SetModeEx( OID , EM_SetModeType_Strikback , false )	-- 反擊
	SetModeEx( OID , EM_SetModeType_Searchenemy , false )	-- 索敵
	SetModeEx( OID, EM_SetModeType_Move , false )		-- 移動
	SetModeEx( OID , EM_SetModeType_NotShowHPMP , true )-- 不顯示血條
	AddBuff( OID, 502707, 0, - 1 );--停止回血
	
	local Player = SearchRangePlayer( OID, 15 );
	if table.getn(Player) > 0 then
		local X = ReadRoleValue( OID, EM_RoleValue_X );
		local Y = ReadRoleValue( OID, EM_RoleValue_Y );
		local Z = ReadRoleValue( OID, EM_RoleValue_Z );
		for i=0, table.getn(Player)-1 do
			local Site = { -15-rand(3)*5,15+rand(3)*5};
			SetPos( Player[i], X+Site[rand(2)+1], Y+5, Z+Site[rand(2)+1], 0 );
		end
	end
	SetModeEx( OID , EM_SetModeType_Obstruct, true )	--阻擋
	
	for i=1, table.getn(Barricades) do
		if Barricades[i] == OID then
			return;
		end
	end
	table.insert( Barricades, OID );
end

function Lua_ZONE20_PE01_BarricadesDead()--拒馬死了
	ZONE20_PE01_Var["BarricadesDead"] = ZONE20_PE01_Var["BarricadesDead"] +1;
	local OID = OwnerID();
	SetModeEx( OID, EM_SetModeType_Fight , false );-- 可砍殺攻擊
	SetModeEx( OID , EM_SetModeType_Obstruct, false )	--不阻擋
	Hide(OID)
	return false
end

function Lua_ZONE20_PE01_SetWork()--設定工人
	local Worker = ZONE20_PE01_Worker;
	local OID = OwnerID();
	SetModeEx( OID , EM_SetModeType_Mark , false )	-- 標記
	
	for i=1, table.getn(Worker) do
		if Worker[i] == OID then
			return;
		end
	end
	table.insert( Worker, OID );
end

function Lua_ZONE20_PE01_ClearReg()--清除暫存
	WriteRoleValue( OwnerID(), EM_RoleValue_Register1, 0 )
end

function Lua_ZONE20_PE01_MstDead()--怪物死亡
	local OID = OwnerID();
	local TID = TargetID();	
	local MstNum = ZONE20_PE01_MstNum;
	local MstID = ZONE20_PE01_Var["MstID"];
	local OrgID = ReadRoleValue( OID, EM_RoleValue_OrgID );
	local MstType = 1;
	for i=1, table.getn(MstID) do
		if OrgID == MstID[i] then
			MstNum[i] = MstNum[i] - 1 ;
			MstType = i;
			break
		end
	end
	
	if CheckBuff( OID, 509779 ) == true then --優先目標
		local Marker = ReadRoleValue( OID, EM_RoleValue_Register2 );
		ks_QuestKill( Marker, 105738, 2 );--任務用隱藏殺人法
	end

	if CheckBuff( OID, 620019 ) == true then --眾矢之的
		local Marker = ReadRoleValue( OID, EM_RoleValue_Register3 );
		ks_QuestKill( Marker, 105738, 1 );--任務用隱藏殺人法
	end	
	
	if CheckBuff( TID, 509781 ) == true then--防禦弓手
		ks_QuestKill( TID, 105738, 1 );--任務用隱藏殺人法
	end
		
	if CheckBuff( TID, 509756 ) == true then--火力支援
		if MstType == 1 then
			ks_QuestKill( TID, 105738, 1 );--任務用隱藏殺人法
		elseif MstType == 2 then
			ks_QuestKill( TID, 105738, 8 );--任務用隱藏殺人法
		elseif MstType == 4 then
			ks_QuestKill( TID, 105738, 4 );--任務用隱藏殺人法(
		end
	end
	
	if ReadRoleValue( TID, EM_RoleValue_IsPlayer ) ~= 1 and ReadRoleValue( TID, EM_RoleValue_OrgID ) == 105741 then--魁儡
		local Master = ReadRoleValue ( TID , EM_RoleValue_PID );
		ks_QuestKill( Master, 105738, 1 );--任務用隱藏殺人法
		if Rand(10)<4 and CheckBuff( master, 509758 ) ~= true then
			AddBuff( master, 509758, 0, -1 )--給與文件
		end
	end
	
	DelObj(OID);
	return false;
end

--=============================================--

function Lua_ZONE20_PE01_QuestComplete()--完成任務執行
	local Player = TargetID()
	if LuaPE_KS_CleanBuff( Player ) == true then
		AddBuff( Player, 620401, 0, -1 )
	end
end