-- ※請將此函式(  Z25_3_Center   )掛在中控器上   Z25_3_Center

--  三王房間前座標/GM ? Zone 151 0 -2919 3126.9 491.6
--  flag編號為781046
-- PID 4~9 為王未開戰前, 進行巡邏劇情時會走的點
-- PID 1      為Zone開啟後, 王一開始被創造出來的點, 以及擊敗王之後寶箱出現的點
-- PID 2      為Zone開啟後, 三王通關門的點
-- PID 30    為戰鬥開始後, 防止玩家逃離房間的阻擋門

function Z25_3_setDoorState( obj ) -- 門專用, 顯示,阻擋
	SetModeEx( obj , EM_SetModeType_Mark, false)										
	SetModeEx( obj , EM_SetModeType_ShowRoleHead, false) 								
	SetModeEx( obj , EM_SetModeType_Obstruct, true) 									
	SetModeEx( obj , EM_SetModeType_Strikback, false) 									
	SetModeEx( obj , EM_SetModeType_Move, false) 									
	SetModeEx( obj , EM_SetModeType_Fight, false) 										
	SetModeEx( obj , EM_SetModeType_SearchenemyIgnore, false)							
	SetModeEx( obj , EM_SetModeType_Searchenemy, false)
	SetModeEx( obj , EM_SetModeType_NotShowHPMP, true) 
end	

function Z25_3_setHideState( obj ) -- 透明球專用(不可砍殺)
	SetModeEx( obj  , EM_SetModeType_Mark, false )
	SetModeEx( obj , EM_SetModeType_Obstruct, false) 
	SetModeEx( obj  , EM_SetModeType_HideName, true )
	SetModeEx( obj  , EM_SetModeType_ShowRoleHead, false )
	SetModeEx( obj  , EM_SetModeType_Move, false )
	SetModeEx( obj , EM_SetModeType_Fight, false) 
	SetModeEx( obj  , EM_SetModeType_Searchenemy, false )
	SetModeEx( obj  , EM_SetModeType_Strikback, false )	
end	

function Z25_3_setTreasureState( obj ) -- 寶箱專用, 顯示, 可點, 阻擋
	SetModeEx( obj , EM_SetModeType_Mark, true)			
	SetModeEx( obj , EM_SetModeType_ShowRoleHead, true) 		
	SetModeEx( obj , EM_SetModeType_Obstruct, true) 			
	SetModeEx( obj , EM_SetModeType_Strikback, false) 
	SetModeEx( obj , EM_SetModeType_Move, false) 	
	SetModeEx( obj , EM_SetModeType_Fight, false) 
	SetModeEx( obj , EM_SetModeType_SearchenemyIgnore, false) 	
	SetModeEx( obj , EM_SetModeType_Searchenemy, false)				
	SetModeEx( obj , EM_SetModeType_NotShowHPMP, true) 
	SetModeEx( obj , EM_SetModeType_HideName, false) 
end

function Z25_3_Center()  												
	local center = OwnerID();	-- center
	local ZoneID = ReadRoleValue ( center, EM_RoleValue_ZoneID )
	local RoomID  = ReadRoleValue ( center, EM_RoleValue_RoomID )

	local BossOrgID, TreasureOrgID;		
	local flagID=781046	-- flag PID (30, 是進來的門)(2, 是通關的門)				
	local doorID=105078	-- 阻擋門ID				

	if ZoneID == 151 then
		BossOrgID=106444	
		TreasureOrgID = 106201
	elseif ZoneID == 152 then
		BossOrgID=107591	
		TreasureOrgID = 107590
	elseif ZoneID == 153 then
		BossOrgID=107606		
		TreasureOrgID = 107607
	elseif ZoneID == 953 then
		BossOrgID=107606	
		TreasureOrgID = 106201
	end			

	-- 通關門 初始化 -- 	
	local nextDoor = CreateObjByFlag( doorID, flagID, 2, 1 ); 	--要產生的物件ID, 根據哪一個旗子產生物件, 旗子PID, 產生的物件量
	Z25_3_setDoorState( nextDoor );
	
	-- Boss 初始化 -- 
	local Boss = CreateObjByFlag( BossOrgID, flagID, 1, 1 );		--要產生的物件ID, 根據哪一個旗子產生物件, 旗子PID, 產生的物件量
	MoveToFlagEnabled( Boss, false );
	SetModeEx( Boss , EM_SetModeType_Searchenemy, false); 	-- 法Q馬德不索敵
	
	local isChallengeSuccess;	-- 判斷王是否被打倒	
	local Boss_Regs_ChallengeSuccess = EM_RoleValue_Register8;	-- 判斷是否挑戰成功	
	WriteRoleValue( Boss, Boss_Regs_ChallengeSuccess, 0 );	-- 1為挑戰成功, 0則否

	-- 放進去 --
	AddToPartition( nextDoor, RoomID );
	AddToPartition( Boss, RoomID );
	
	-- 初始化Boss巡邏劇情 --	
	local isBossAlive; 		-- 判斷王是否存活
	local isResetDrama;		-- 判斷王是否重置巡邏劇情
	local startPID, endPID = 4, 9;	-- 巡邏旗子為4~9
	local nowPID = startPID;		
	local flag_X, flag_Y, flag_Z;
	local now_X, now_Y, now_Z;	

	local Boss_Regs_DramaFlag = EM_RoleValue_Register9;	-- 巡邏劇情的旗標暫存器編號
	WriteRoleValue( Boss, Boss_Regs_DramaFlag, 0 );		-- 1為進行重置巡邏劇情, 0則否(即已在巡邏中)
	
	flag_X = GetMoveFlagValue( flagID, nowPID, EM_RoleValue_X );
	flag_Y = GetMoveFlagValue( flagID, nowPID, EM_RoleValue_Y );
	flag_Z = GetMoveFlagValue( flagID, nowPID, EM_RoleValue_Z );	
	
	flag_Y = GetHeight( flag_X, flag_Y, flag_Z );				
	MoveDirect( Boss, flag_X, flag_Y, flag_Z );
				
	-- 中控器開始判斷是否要重置巡邏, 或給寶箱 --	
	while true do
		isChallengeSuccess = ReadRoleValue( Boss, Boss_Regs_ChallengeSuccess );	
		isBossAlive = CheckID( Boss );
		if ( isChallengeSuccess == 1 ) or ( isBossAlive == 0 ) then 		-- 只要挑戰成功 或 王被刪除, 就開門&給寶箱
			DebugMsg( 0,0,"Show Treasure");		
			-- 開門 --
			DelObj( nextDoor );			

			-- 發寶箱 --
			local Treasure = CreateObjByFlag( TreasureOrgID, flagID, 1, 1 );	--要產生的物件ID, 根據哪一個旗子產生物件, 旗子PID, 產生的物件量
			Z25_3_setTreasureState( Treasure );
			AddToPartition( Treasure, RoomID );
			
			break;
		else	-- 未挑戰成功
			if ( HateListCount(Boss) == 0 ) then	-- 且王不在戰鬥中 
				isResetDrama = ReadRoleValue( Boss, Boss_Regs_DramaFlag );
				if ( isResetDrama == 1 ) then	-- 未巡邏中
					WriteRoleValue( Boss, Boss_Regs_DramaFlag, 0 );	-- 1為進行重置巡邏劇情, 0則否(即已在巡邏中)
					nowPID = startPID;
					flag_X = GetMoveFlagValue( flagID, nowPID, EM_RoleValue_X );
					flag_Y = GetMoveFlagValue( flagID, nowPID, EM_RoleValue_Y );
					flag_Z = GetMoveFlagValue( flagID, nowPID, EM_RoleValue_Z );	
	
					flag_Y = GetHeight( flag_X, flag_Y, flag_Z );				
					MoveDirect( Boss, flag_X, flag_Y, flag_Z );
				end	
					
				now_X = ReadRoleValue( Boss, EM_RoleValue_X );
				now_Z = ReadRoleValue( Boss, EM_RoleValue_Z );
	
				if ( math.abs(now_X-flag_X) < 1 ) and ( math.abs(now_Z-flag_Z) < 1) then	-- 如果走到定點才進行下一個移動(如果座標有誤可能會有bug)
					nowPID = nowPID + 1;
					if ( nowPID > endPID ) then
						nowPID = startPID;
					end
					flag_X = GetMoveFlagValue( flagID, nowPID, EM_RoleValue_X );
					flag_Y = GetMoveFlagValue( flagID, nowPID, EM_RoleValue_Y );
					flag_Z = GetMoveFlagValue( flagID, nowPID, EM_RoleValue_Z );
	
					flag_Y = GetHeight( flag_X, flag_Y, flag_Z );
					MoveDirect( Boss, flag_X, flag_Y, flag_Z );
				end		
			end
			Sleep(10);
		end
	end
	DebugMsg(0,0,"center end");		
end 

function Z25_3_Boss_CombatMain()
	DebugMsg(0,0,"Combat start");

	local Boss = OwnerID();
	local RoomID = ReadRoleValue( Boss, EM_RoleValue_RoomID );	
	BeginPlot( Boss, "Cl_Resist_HackersFightBegin", 0 );	--  啟動防駭客
	StopMove( Boss, false );
	
	-- 關門, 進入房間那扇 --
	local flagID=781046	-- flag PID (30, 是進來的門)(2, 是通關的門)
	local doorID=105078	-- 阻擋門ID	
	local frontDoor = CreateObjByFlag( doorID, flagID, 30, 1 );
	Z25_3_setDoorState( frontDoor );	
	AddToPartition( frontDoor, RoomID );
	CallPlot( frontDoor, "Z25_3_TokenRule", Boss);
		
	-- 戰鬥初始化 --
	AddBuff(Boss,502707,0,-1);--停止自動回血			
	local Boss_HP_Rate20 = Math.floor( (ReadRoleValue( Boss, EM_RoleValue_MaxHP )) * 0.2 ) + 1;	-- 加1, 帳面上玩家看到的%數才會是20%
	LockHP( Boss, Boss_HP_Rate20, "Z25_3_ChallengeSuccess" );	-- 20%血量劇情[挑戰成功]
		
	BeginPlot(Boss,"Z25_3_Boss_AI",0);
end
	
function Z25_3_Boss_AI()
	local Boss = OwnerID();
	local ZoneID = ReadRoleValue( Boss, EM_RoleValue_ZoneID );	
	local RoomID = ReadRoleValue( Boss, EM_RoleValue_RoomID );	
		
	local StartTime = GetSysTime( 0 );
	local NowTime = StartTime;

	local Group_1_PrecastTime = StartTime;
	local Group_2_PrecastTime = StartTime;
	local Group_3_PrecastTime = StartTime;
	local Group_4_PrecastTime = StartTime;	
			
	WriteRoleValue( Boss, EM_RoleValue_Register1, Group_1_PrecastTime );
	WriteRoleValue( Boss, EM_RoleValue_Register2, Group_2_PrecastTime );
	WriteRoleValue( Boss, EM_RoleValue_Register3, Group_3_PrecastTime );
	WriteRoleValue( Boss, EM_RoleValue_Register4, Group_4_PrecastTime );	

	-- 冷卻時間 --				
	local Group_1_ColdDown = 19;	-- 致命處決
	local Group_2_ColdDown = 15;	-- 殺氣壓迫
	local Group_3_ColdDown = 9;	-- 擴散斬擊
	local Group_4_ColdDown = 4;	-- 戰意衝擊、殺意衝擊

	-- 詠唱時間 --
	local Skill_1_SpellTime = 0;	-- 致命處決
	local Skill_2_SpellTime = 3;	-- 殺氣壓迫
	local Skill_3_SpellTime = 2;	-- 擴散斬擊
	local Skill_4_SpellTime = 2;	-- 戰意衝擊、殺意衝擊

	-- 技能佇列鎖 --			
	local _LOCK, _UNLOCK = 1, 0;		-- 未施放技能前,不再加入技能至可施放之佇列
	local Group_1_Lock = _UNLOCK ;
	local Group_2_Lock = _UNLOCK ;
	local Group_3_Lock = _UNLOCK ;	
	local Group_4_Lock = _UNLOCK ;	

	-- 技能等級 --
	local Skill_1_LV, Skill_2_LV;
	if ( ZoneID == 151 ) then
		Skill_1_LV = 11;
		Skill_2_LV = 49;
	elseif ( ZoneID == 152 ) then
		Skill_1_LV = 14;
		Skill_2_LV = 69;
	elseif ( ZoneID == 153 ) then
		Skill_1_LV = 9;
		Skill_2_LV = 9;
	elseif ( ZoneID == 953 ) then
		Skill_1_LV = 11;
		Skill_2_LV = 49;
	end
							
	local CastList = {};
	local isCasting = ReadRoleValue( Boss, EM_RoleValue_SpellMagicID );

	local Boss_Regs_ChallengeSuccess = EM_RoleValue_Register8;	
	local isChallengeSuccess = ReadRoleValue( Boss, Boss_Regs_ChallengeSuccess );	-- 判斷是否挑戰成功, 若挑戰失敗則準備重置巡邏劇情
	
  	-- 獨立機制, 條件達成即強制執行 --
  	-- 狂暴 --
  	local inFury = false;		-- 判定是否狂暴中
	local Boss_Fury_Time = 480;	-- 8分鐘狂暴
	
	local BossNowHP;
	local BossMaxHP = ReadRoleValue( Boss, EM_RoleValue_MaxHP );
	-- 致命處決(每10%施放) --
	local toCast_HPRate = 90;	-- 可施放的門檻(從90%開始)
	local endCheck_HPRate = 22;	-- 停止施放的門檻(20%停止, 且不發動)
	local HP_Rate_Step = 10; 	-- 每次發動的間距門檻(10%血量)
	local CastGateHP = Math.ceil( BossMaxHP * (toCast_HPRate+1)/100 );	-- 取大, (加1, 帳面上玩家看到的%數才會是90%)

	-- Boss AI 開始 --	
	ScriptMessage( Boss, -1, 2, "[SC_106444_01]", 0 ); -- 進入戰鬥, 王嗆聲 [ 只要是我看中的東西，誰都別想奪走！]
		
	while ( isChallengeSuccess == 0 ) and ( HateListCount(Boss) ~= 0 ) do
  		Sleep(10);
  		isChallengeSuccess = ReadRoleValue( Boss, Boss_Regs_ChallengeSuccess );
  		NowTime = GetSysTime(0);
  		
  		-- 獨立機制, 條件達成即強制執行 --
  		-- 狂暴 --
  		if ( inFury == false ) and ( NowTime - StartTime) > Boss_Fury_Time then
  			DebugMsg(0,0,"Boss fury");  	
			ScriptMessage( Boss, -1, 2, "[SC_106444_04]", 0 )			
			AddBuff( Boss, 623851, 0 ,-1 );	-- 狂暴
			inFury = true;
  		end
  		-- 致命處決 --  			
  		if ( toCast_HPRate > endCheck_HPRate ) then	-- 如果未到結束門檻, 才開始判斷
  			BossNowHP = ReadRoleValue( Boss, EM_RoleValue_HP );  
    			if ( BossNowHP <= CastGateHP ) then	-- 如果Boss現有血量小於, 下一次施放[致命處決]的階段血量
  				DebugMsg(0,0,"Boss HPRate: "..toCast_HPRate );
  				ScriptMessage( Boss, -1, 2, "[SC_106444_05]", 0 ); -- 施放技能,致命處決[ 小心不要走錯邊！]
  				CallPlot( Boss, "Z25_3_Boss_Extra_CastSkill_1", Boss, NowTime, Skill_1_SpellTime, Skill_1_LV );	-- [名稱不同]但[功能相同], 只是為了不要讓plot互卡

    				toCast_HPRate = toCast_HPRate - HP_Rate_Step;	-- 換下一個門檻
  				CastGateHP = Math.ceil( BossMaxHP * (toCast_HPRate+1)/100 );	
  			end   	
  		end	
  										
		Group_1_PrecastTime = ReadRoleValue( Boss, EM_RoleValue_Register1 );
		Group_2_PrecastTime = ReadRoleValue( Boss, EM_RoleValue_Register2 );
		Group_3_PrecastTime = ReadRoleValue( Boss, EM_RoleValue_Register3 );	
		Group_4_PrecastTime = ReadRoleValue( Boss, EM_RoleValue_Register4 );	
					
	     	 if ( NowTime - Group_1_PrecastTime ) > ( Group_1_ColdDown ) and ( Group_1_Lock == _UNLOCK ) then	-- 如果冷卻時間OK，且這招已不在施放列表內
	     		Group_1_Lock = _LOCK;
	     		table.insert( CastList, "skiil_1" );	-- 致命處決		
	     	end	 
	     	 if ( NowTime - Group_2_PrecastTime ) > ( Group_2_ColdDown ) and ( Group_2_Lock == _UNLOCK ) then
	     		Group_2_Lock = _LOCK;
	     		table.insert( CastList, "skiil_2" );	-- 殺氣壓迫
	     	end
		 if ( NowTime - Group_3_PrecastTime ) > ( Group_3_ColdDown ) and ( Group_3_Lock == _UNLOCK ) then
			Group_3_Lock = _LOCK;
			table.insert( CastList, "skiil_3" );	-- 擴散斬擊	
	 	end	 
	   	 if ( NowTime - Group_4_PrecastTime ) > ( Group_4_ColdDown ) and ( Group_4_Lock == _UNLOCK ) then
	   		Group_4_Lock = _LOCK;
	   		table.insert( CastList, "skiil_4" );	-- 戰意衝擊、殺意衝擊		
	   	end
  	 		 		 		 	
  	 	isCasting = ReadRoleValue( Boss, EM_RoleValue_SpellMagicID );
  	 	if ( #CastList ~= 0 ) and ( isCasting == 0 ) then	-- 如果施放列內有可施放的法術，且現在無施放任何法術，才去施放一個新的法術  
  	 		table.sort(CastList);	-- 大招往前排
  	 			 	
  	 		if ( CastList[1] == "skiil_1" ) then	-- 技能[致命處決]
  	 			Group_1_Lock = _UNLOCK;  
  	 			ScriptMessage( Boss, -1, 2, "[SC_106444_05]", 0 ); -- [ 小心不要走錯邊！]											
  				CallPlot( Boss, "Z25_3_Boss_CastSkill_1", Boss, NowTime, Skill_1_SpellTime, Skill_1_LV );
  			elseif ( CastList[1] == "skiil_2" ) then	-- 技能[殺氣壓迫]
  				Group_2_Lock = _UNLOCK;
  				ScriptMessage( Boss, -1, 2, "[SC_106444_06]", 0 ); -- [ 就讓我看看你們可以撐多久！]	
  				CallPlot( Boss, "Z25_3_Boss_CastSkill_2", Boss, NowTime, Skill_2_SpellTime, Skill_2_LV );
  			elseif ( CastList[1] == "skiil_3" ) then	-- 技能[擴散斬擊]
    				Group_3_Lock = _UNLOCK;
    				CallPlot( Boss, "Z25_3_Boss_CastSkill_3", Boss, NowTime, Skill_3_SpellTime );		
 			elseif ( CastList[1] == "skiil_4" ) then	-- 技能[戰意衝擊][殺意衝擊]
 	 			Group_4_Lock = _UNLOCK;				
 				CallPlot( Boss, "Z25_3_Boss_CastSkill_4", Boss, NowTime, Skill_4_SpellTime );
  			end
  			table.remove( CastList, 1 );
  		 end
	end


	-- 挑戰失敗即重置Boss --		
	isChallengeSuccess = ReadRoleValue( Boss, Boss_Regs_ChallengeSuccess );
	if ( isChallengeSuccess == 0 ) then	-- 挑戰失敗重置Boss
		DebugMsg(0,0,"Challenge Fail");
		DebugMsg(0,0,"reset Boss");
		
 		ScriptMessage( Boss, -1, 2, "[SC_106444_02]", 0 ); -- 挑戰失敗, 王重置時 [ 這麼點力量根本就不是我的對手。]
 		Sleep(10);
		
		local Boss_Regs_DramaFlag = EM_RoleValue_Register9;	-- 巡邏劇情的旗標暫存器編號
		WriteRoleValue( Boss, Boss_Regs_DramaFlag, 1 );		-- 1為進行重置巡邏劇情, 0則否(即已在巡邏中)
		WriteRoleValue( Boss , EM_RoleValue_IsWalk, 1 );		-- 取消追擊狀態
		SetModeEx( Boss , EM_SetModeType_Searchenemy, false);  	-- 法Q馬德不索敵
		MoveToFlagEnabled( Boss, false );			
	end
	
	DebugMsg(0,0,"Boss AI end");	
end

function Z25_3_Boss_Extra_CastSkill_1( Boss, castTime, spellTime, Skill_1_LV )-- 致命處決(依血量施放版) [名稱不同]但[功能相同], 只是為了不要讓plot互卡	
	local RoomID = ReadRoleValue( Boss, EM_RoleValue_RoomID );
	local InvisibleObjID = 106200;
	
	local allPly = Z25_3_Func_SearchRangePly( Boss, 1000 );
	local x1, y1, z1;	-- 第1個隱形目標用
	local x2, y2, z2;	-- 第2個隱形目標用
	
	if ( #allPly > 1 ) then	-- 如果有兩個玩家以上, 才找出另一個目標
		-- 創造隱形王, 施放技能用 --
		-- 第1個目標--
		local tar_1_randIdx = Rand(#allPly)+1;
		local tar1 = allPly[ tar_1_randIdx ];
		table.remove( allPly, tar_1_randIdx );
				
		x1 = ReadRoleValue( tar1, EM_RoleValue_X );
		y1 = ReadRoleValue( tar1, EM_RoleValue_Y );
		z1 = ReadRoleValue( tar1, EM_RoleValue_Z );		
		y1 = GetHeight( x1, y1, z1 );
				
		local invisibleObj1 = CreateObj( InvisibleObjID, x1, y1, z1, 0, 1 );
		Z25_3_setHideState( invisibleObj1 );

		-- 第2個目標--				
		local tar2_randIdx = Rand(#allPly)+1;
		local tar2 = allPly[ tar2_randIdx ];
		
		x2 = ReadRoleValue( tar2, EM_RoleValue_X );
		y2 = ReadRoleValue( tar2, EM_RoleValue_Y );
		z2 = ReadRoleValue( tar2, EM_RoleValue_Z );	
		y2 = GetHeight( x2, y2, z2 );
				
		local invisibleObj2 = CreateObj( InvisibleObjID, x2, y2, z2, 0, 1 );
		Z25_3_setHideState( invisibleObj2 );

		-- 放入&上落點特效 --				
		AddToPartition( invisibleObj1, RoomID );		
		AddToPartition( invisibleObj2, RoomID );
		CallPlot( invisibleObj1, "Z25_3_TokenRule", Boss );
		CallPlot( invisibleObj2, "Z25_3_TokenRule", Boss );
		AddBuff( invisibleObj1, 623994, 0, -1 );	-- 落點特效buff
		AddBuff( invisibleObj2, 623994, 0, -1 );	
		
		-- 施放技能 -- 	
		WriteRoleValue( Boss, EM_RoleValue_Register1, (castTime+spellTime) );		-- 寫入技能1, (施放法術的時間+詠唱時間), 用來做下一次施法時間的判斷

		Sleep(30);
		CastSpellPos( invisibleObj1, x1, y1, z1, 850089, Skill_1_LV );		-- 於隱形目標1之位置, 施放致命處決	
		CastSpellPos( invisibleObj2, x2, y2, z2, 850089, Skill_1_LV );		-- 於隱形目標2之位置, 施放致命處決	
		CancelBuff( invisibleObj1, 623994 );	-- 解除落點特效buff
		CancelBuff( invisibleObj2, 623994 );	-- 解除落點特效buff
		
		Sleep(20);		
		DelObj( invisibleObj1 );	
		DelObj( invisibleObj2 );
	else
		-- 創造隱形王, 施放技能用 --
		-- 第1個目標--
		local tar1_randIdx = Rand(#allPly)+1;
		local tar1 = allPly[ tar1_randIdx ];
		
		x1 = ReadRoleValue( tar1, EM_RoleValue_X );
		y1 = ReadRoleValue( tar1, EM_RoleValue_Y );
		z1 = ReadRoleValue( tar1, EM_RoleValue_Z );		
		y1 = GetHeight( x1, y1, z1 );
		
		local invisibleObj1 = CreateObj( InvisibleObjID, x1, y1, z1, 0, 1 );
		Z25_3_setHideState( invisibleObj1 );
		
		-- 放入&上落點特效 --		
		AddToPartition( invisibleObj1, RoomID );
		CallPlot( invisibleObj1, "Z25_3_TokenRule", Boss );
		AddBuff( invisibleObj1, 623994, 0, -1 );	-- 落點特效buff
		
		-- 施放技能 -- 		
		WriteRoleValue( Boss, EM_RoleValue_Register1, (castTime+spellTime) );		-- 寫入技能1, (施放法術的時間+詠唱時間), 用來做下一次施法時間的判斷

		Sleep(30);	
		CastSpellPos( invisibleObj1, x1, y1, z1, 850089, Skill_1_LV );		-- 於隱形目標1之位置, 施放致命處決

		CancelBuff( invisibleObj1, 623994 );	-- 解除落點特效buff
		Sleep(20);		
		DelObj( invisibleObj1 );	
	end
end
function Z25_3_Boss_CastSkill_1( Boss, castTime, spellTime, Skill_1_LV  )	-- 致命處決	
	local RoomID = ReadRoleValue( Boss, EM_RoleValue_RoomID );
	local InvisibleObjID = 106200;
	
	local allPly = Z25_3_Func_SearchRangePly( Boss, 1000 );
	local x1, y1, z1;	-- 第1個隱形目標用
	local x2, y2, z2;	-- 第2個隱形目標用
	
	if ( #allPly > 1 ) then	-- 如果有兩個玩家以上, 才找出另一個目標
		-- 創造隱形王, 施放技能用 --
		-- 第1個目標--
		local tar_1_randIdx = Rand(#allPly)+1;
		local tar1 = allPly[ tar_1_randIdx ];
		table.remove( allPly, tar_1_randIdx );
				
		x1 = ReadRoleValue( tar1, EM_RoleValue_X );
		y1 = ReadRoleValue( tar1, EM_RoleValue_Y );
		z1 = ReadRoleValue( tar1, EM_RoleValue_Z );		
		y1 = GetHeight( x1, y1, z1 );
				
		local invisibleObj1 = CreateObj( InvisibleObjID, x1, y1, z1, 0, 1 );
		Z25_3_setHideState( invisibleObj1 );

		-- 第2個目標--				
		local tar2_randIdx = Rand(#allPly)+1;
		local tar2 = allPly[ tar2_randIdx ];
		
		x2 = ReadRoleValue( tar2, EM_RoleValue_X );
		y2 = ReadRoleValue( tar2, EM_RoleValue_Y );
		z2 = ReadRoleValue( tar2, EM_RoleValue_Z );	
		y2 = GetHeight( x2, y2, z2 );
				
		local invisibleObj2 = CreateObj( InvisibleObjID, x2, y2, z2, 0, 1 );
		Z25_3_setHideState( invisibleObj2 );

		-- 放入&上落點特效 --				
		AddToPartition( invisibleObj1, RoomID );		
		AddToPartition( invisibleObj2, RoomID );
		CallPlot( invisibleObj1, "Z25_3_TokenRule", Boss );
		CallPlot( invisibleObj2, "Z25_3_TokenRule", Boss );
		AddBuff( invisibleObj1, 623994, 0, -1 );	-- 落點特效buff
		AddBuff( invisibleObj2, 623994, 0, -1 );	
		
		-- 施放技能 -- 	
		WriteRoleValue( Boss, EM_RoleValue_Register1, (castTime+spellTime) );		-- 寫入技能1, (施放法術的時間+詠唱時間), 用來做下一次施法時間的判斷

		Sleep(30);
		CastSpellPos( invisibleObj1, x1, y1, z1, 850089, Skill_1_LV );		-- 於隱形目標1之位置, 施放致命處決	
		CastSpellPos( invisibleObj2, x2, y2, z2, 850089, Skill_1_LV );		-- 於隱形目標2之位置, 施放致命處決	
		CancelBuff( invisibleObj1, 623994 );	-- 解除落點特效buff
		CancelBuff( invisibleObj2, 623994 );	-- 解除落點特效buff
		
		Sleep(20);		
		DelObj( invisibleObj1 );	
		DelObj( invisibleObj2 );
	else
		-- 創造隱形王, 施放技能用 --
		-- 第1個目標--
		local tar1_randIdx = Rand(#allPly)+1;
		local tar1 = allPly[ tar1_randIdx ];
		
		x1 = ReadRoleValue( tar1, EM_RoleValue_X );
		y1 = ReadRoleValue( tar1, EM_RoleValue_Y );
		z1 = ReadRoleValue( tar1, EM_RoleValue_Z );		
		y1 = GetHeight( x1, y1, z1 );
		
		local invisibleObj1 = CreateObj( InvisibleObjID, x1, y1, z1, 0, 1 );
		Z25_3_setHideState( invisibleObj1 );
		
		-- 放入&上落點特效 --		
		AddToPartition( invisibleObj1, RoomID );
		CallPlot( invisibleObj1, "Z25_3_TokenRule", Boss );
		AddBuff( invisibleObj1, 623994, 0, -1 );	-- 落點特效buff
		
		-- 施放技能 -- 		
		WriteRoleValue( Boss, EM_RoleValue_Register1, (castTime+spellTime) );		-- 寫入技能1, (施放法術的時間+詠唱時間), 用來做下一次施法時間的判斷

		Sleep(30);	
		CastSpellPos( invisibleObj1, x1, y1, z1, 850089, Skill_1_LV );		-- 於隱形目標1之位置, 施放致命處決

		CancelBuff( invisibleObj1, 623994 );	-- 解除落點特效buff
		Sleep(20);		
		DelObj( invisibleObj1 );	
	end
end
function Z25_3_Boss_CastSkill_2( Boss, castTime, spellTime, Skill_2_LV  )	-- 殺氣壓迫
  	WriteRoleValue( Boss, EM_RoleValue_Register2, (castTime+spellTime) );	-- 寫入技能2, (施放法術的時間+詠唱時間), 用來做下一次施法時間的判斷
  	CastSpellLV( Boss, Boss, 850088, Skill_2_LV );
end

function Z25_3_Boss_CastSkill_3( Boss, castTime, spellTime  )		-- 擴散斬擊
	local RoomID = ReadRoleValue( Boss, EM_RoleValue_RoomID );
	local InvisibleObjID = 107673;
	
  	local x0 = ReadRoleValue( Boss, EM_RoleValue_X );
    	local y0 = ReadRoleValue( Boss, EM_RoleValue_Y );
      	local z0 = ReadRoleValue( Boss, EM_RoleValue_Z );
      	y0 = GetHeight( x0, y0, z0 );
      	
  	
      	local InvisibleObj = CreateObj( InvisibleObjID, x0, y0, z0, 0, 1 );
      	Z25_3_setHideState( InvisibleObj );      	
      	AddToPartition( InvisibleObj, RoomID );
  
  	WriteRoleValue( InvisibleObj, EM_RoleValue_LiveTime, 5 );
  	CallPlot( InvisibleObj, "Z25_3_TokenRule", Boss );  	
  	
  	WriteRoleValue( Boss, EM_RoleValue_Register3, (castTime+spellTime) );	-- 寫入技能3, (施放法術的時間+詠唱時間), 用來做下一次施法時間的判斷    
  	
  	local dir = ReadRoleValue( Boss, EM_RoleValue_Dir );	
  	CastSpellLV( Boss, InvisibleObj, 850740, 0 );  	-- 擴散斬擊純特效(施放結束會觸發傷害法術)  
      	local x = ReadRoleValue( Boss, EM_RoleValue_X );
      	local z = ReadRoleValue( Boss, EM_RoleValue_Z );	
      	
      	local rad = math.rad( dir );
      	local dis = 100;	-- 法術距離
      	x = x0 + ( math.cos(rad) * dis );	
            	z = z0 - ( math.sin(rad) * dis );
            	
	SetPos( InvisibleObj, x, y0, z, 0 );
end
		
function Z25_3_Boss_CastSkill_4( Boss, castTime, spellTime )		-- 戰意衝擊、殺意衝擊
	local allPly = Z25_3_Func_SearchRangePly( Boss, 1000 );

	-- 找出要施放的隨機目標 --
	local tar1_randIdx = Rand(#allPly) + 1;
	local tar1 = allPly[ tar1_randIdx ];
	local tar2 = nil;
	if ( #allPly > 1 ) then	-- 如果有兩個玩家以上, 才找出另一個目標
		table.remove( allPly, tar1_randIdx );
		local tar2_randIdx = Rand(#allPly)+1;
		tar2 = allPly[ tar2_randIdx ];						
	end

	-- 創造一個隱形王 --
	local RoomID = ReadRoleValue( Boss, EM_RoleValue_RoomID );
	local ZoneID = ReadRoleValue( Boss, EM_RoleValue_ZoneID );
	local FakeBossID;
	if ( ZoneID == 151 ) then	-- 技能強度參照王的數值(所以要取ZONE)
		FakeBossID = 106200;
	elseif ( ZoneID == 152 ) then
		FakeBossID = 107676;
	elseif ( ZoneID == 153 ) then
		FakeBossID = 107678;
	elseif ( ZoneID == 953 ) then
		FakeBossID = 106200;
	end

	local x, y, z;		
	x = ReadRoleValue( Boss, EM_RoleValue_X );
	y = ReadRoleValue( Boss, EM_RoleValue_Y );
	z = ReadRoleValue( Boss, EM_RoleValue_Z );
	y = GetHeight( x, y, z );	
	
	local FakeBoss = CreateObj( FakeBossID, x, y, z, 0, 1 );
	Z25_3_setHideState( FakeBoss );
	AddToPartition( FakeBoss, RoomID );
	
	WriteRoleValue( FakeBoss, EM_RoleValue_LiveTime, 5 );	-- 5秒後自殺		
	CallPlot( FakeBoss, "Z25_3_TokenRule", Boss );		-- 若王已不存在, 也自殺
	
	-- 施放技能 --		
	WriteRoleValue( Boss, EM_RoleValue_Register4, (castTime+spellTime) );	-- 寫入技能4, (施放法術的時間+詠唱時間), 用來做下一次施法時間的判斷
	if ( tar2 ~= nil ) then	-- 兩個目標以上, 對不同目標施放
		CastSpellLv( Boss, tar1, 850086, 0 );	
		CastSpellLv( FakeBoss, tar2, 850090, 0 );			
	else			-- 只剩一個目標, 對同一目標施放
		CastSpellLv( Boss, tar1, 850086, 0 );	
		CastSpellLv( FakeBoss, tar1, 850090, 0 );	
	end
end

function Z25_3_ChallengeSuccess()
	local Boss = OwnerID();
	LockHP( Boss, -1000, "" ); 	
		
	DebugMsg(0,0,"ChallengeSuccess");
	
	local Boss_Regs_ChallengeSuccess = EM_RoleValue_Register8;
	WriteRoleValue( Boss, Boss_Regs_ChallengeSuccess, 1 );--標示玩家挑戰成功
	
	
	SetModeEx( Boss , EM_SetModeType_Strikback, false );		-- 不反擊
	SetModeEx( Boss , EM_SetModeType_Searchenemy, false ); 	-- 不索敵		
	SetModeEx( Boss , EM_SetModeType_Fight, false );		-- 不可砍殺
	
	MagicInterrupt( Boss);
	SetStopAttack( Boss );
	AddBuff( Boss, 624097, 0 , -1 );	--鎖血		
	
	CallPlot( Boss, "Z25_3_Drama_BossEscape", Boss );	
	DebugMsg(0,0,"end ChallengeSuccess");
end
function Z25_3_Drama_BossEscape( Boss )
	DebugMsg(0,0,"Drama_BossEscape");		
	sleep(20)
	--say(Boss,"123")
	ScriptMessage( Boss, -1, 2, "[SC_106444_03]", 0 ); -- 挑戰成功 王逃跑時 [ 混帳！下次我不會讓你們這麼好過的！ ]			
	Sleep(10);
		
	-- 逃跑動作 --
	local flagID=781046	-- flag PID (30, 是進來的門)(2, 是通關的門)
	local PID = 2;
	local x = GetMoveFlagValue( flagID, PID, EM_RoleValue_X );
	local y = GetMoveFlagValue( flagID, PID, EM_RoleValue_Y );
	local z = GetMoveFlagValue( flagID, PID, EM_RoleValue_Z );	
	Sleep( MoveDirect( Boss, x, y, z ) );
	
	-- 將王隱藏並殺死 --
	-- 執行防駭客機制 --
	SetModeEx( Boss, EM_SetModeType_Show, false );
	Sleep(5);
	WriteRoleValue(Boss,EM_RoleValue_LiveTime,10);
	KillID(Boss,Boss);
	DebugMsg(0,0,"end Drama_BossEscape");
end

function Z25_3_Func_SearchRangePly( GItemID, range )	-- 改由位置[1]開始放入資料, 且最後不會放入"-1"這個值
	local Ret = {}
	local Obj;
	local Count = SetSearchRangeInfo( GItemID,Range )
	local PlayerCount = 1
	
	for i = 1 , Count , 1 do
		local ID = GetSearchResult()
		Obj = Role:New( ID )
		if Obj:IsPlayer() then
			Ret[PlayerCount] = ID	
			PlayerCount = PlayerCount + 1;	
		end
	end	
	return Ret;
end
function Z25_3_TokenRule( Boss )--衍生物規則：離開戰鬥消失
	local Token=OwnerID();
	while true do
		if CheckID(Boss)==false or ReadRoleValue(Boss,EM_RoleValue_IsDead)==1 or HateListCount(Boss)==0 then
			DelObj(Token);
			return;
		end
		sleep(10);
	end
end