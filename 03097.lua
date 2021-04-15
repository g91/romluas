--由中控器的產生劇情執行"WY_Z163_B5_TARROS"。
--此函式會創造BOSS物件並蒐集BOSS相關狀態資料為全域變數，並在迴圈中持續檢查BOSS是否處於戰鬥中。
--若進入戰鬥則持續更新BOSS狀態資料並持續記錄戰鬥時間與各技能冷卻狀況。
	-- 140724 K.J. Aris
	--140724 修正 "boss" 屬性為Global 與多迴圈併寫 該物件 造成參數錯亂的問題    目前將"boss" local化
	--請注意"tarros"與"boss"參數的使用 原始版本之操作容易造成資料內容不同步(多迴圈併寫) 或瞬間變為空值
		--多迴圈併寫 情形簡述 : 不同區塊的迴圈  同時不斷的刷新某個共用的全域參數 ("boss" 尤為明顯)   造成不同區塊的迴圈內 所取得的參數  可能為其他迴圈所更新的內容
		--如果同時有不同區塊做寫入跟讀取的動作  所取得的參數內容將難以掌握   此方式在撰寫上應盡量避免
local tarros = nil;
local _bossGlobalConst = nil;--140724  K.J. Aris Fixed
function WY_Z163_B5_TARROS()
	local level = ReadRoleValue(OwnerID(),EM_RoleValue_ZoneID);
	local _roomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID);

	if( _bossGlobalConst == nil ) then _bossGlobalConst = {}; end--140724
	if( tarros == nil ) then tarros = {}; end--140724
	tarros[_roomID] = {}
	tarros[_roomID].skilltime = {}
	tarros[_roomID].skilltime.total = 0
	tarros[_roomID].skilltime.RuneSlash = 7--符能連斬的冷卻
	tarros[_roomID].skilltime.RuneBean = 10--符文光束的冷卻
	tarros[_roomID].skilltime.RuneTrap = 13--傳送陷阱的冷卻
	tarros[_roomID].skilltime.RayAttack = 17--射線攻擊的冷卻
	tarros[_roomID].skilltime.Teleport = 19--隨機位移的冷卻
	tarros[_roomID].mine = 0
	tarros[_roomID].target = {}
	boss_org = 108280
	local door = {}
	door.front = 0
	door.back = 0
	--創造BOSS與後門
	local x,y,z,direction = 4531, 809, 3117, 0
	door.back = WY_Create_an_obj(106246,x,y,z,direction)	
	SetModeEx( door.back , EM_SetModeType_Mark , false );	--不可點選
	SetModeEx( door.back , EM_SetModeType_HideName , true );	--不顯示名稱
	SetModeEx( door.back , EM_SetModeType_NotShowHPMP , false );	--不顯示血條
	SetModeEx( door.back , EM_SetModeType_Strikback , false );	--不會反擊
	SetModeEx( door.back , EM_SetModeType_Move , false );	--不會移動
	SetModeEx( door.back , EM_SetModeType_Fight , false );	--不可攻擊
	SetModeEx( door.back , EM_SetModeType_Searchenemy , false );	--不會索敵
	SetModeEx( door.back , EM_SetModeType_Obstruct , true );	--有阻擋效果
	x,y,z,direction = DW_Location(OwnerID())
	if level == 163 then boss_org = 108280 
	elseif level == 164 then boss_org = 108485
	elseif level == 165 then boss_org = 108488
	end
	local CreatedBoss = WY_Create_an_obj(boss_org, x,y,z,direction)
	--建立需要使用的BOSS資訊
	local boss = WY_get_objStatus(CreatedBoss);
	_bossGlobalConst[ _roomID ] = boss;--140724 K.J. Aris

	local boss_reset = false
	tarros_CombatActive = false
	--while boss.hp > 0 do
	
	local _bossDead = false;
	while true do
	--更新BOSS資訊
		boss = WY_get_objStatus(CreatedBoss)
		--_bossGlobalConst[ _roomID ] = boss;--140724 K.J. Aris

		if ( boss ~= nil ) then
			_bossDead = CheckID( boss.id ) == false or ReadRoleValue( boss.id , EM_RoleValue_IsDead ) == 1;
			if ( _bossDead ) then
				DebugMsg( 0 , 0 , "Boss is dead or not exist !!" );
				break;
			end
		else
			DebugMsg( 0 , 0 , "Error !! boss is nil !!" );
			break;
		end
	
		--DebugMsg( 0 , 0 , "LoopCheck : "..tostring( _bossDead ).." : "..boss.id.." : "..boss.hp );


	--判斷是否在戰鬥中
		if boss.hatecount ~= 0 then
			tarros_CombatActive = true
			--DebugMsg( 0 , 0 , "-- boss in fight !!" );
			if not boss_reset then --用BOSS的重置開關當判斷，使每次戰鬥只會啟動一次這個函式
				CallPlot(boss.id , "WY_Z163_B5_TARROS_COMBAT",boss.id ) 
				x,y,z,direction = 3788, 820, 3118, 4
				door.front = WY_Create_an_obj(106247,x,y,z,direction)
				SetModeEx( door.front , EM_SetModeType_Mark , false );	--不可點選
				SetModeEx( door.front , EM_SetModeType_HideName , true );	--不顯示名稱
				SetModeEx( door.front , EM_SetModeType_NotShowHPMP , false );	--不顯示血條
				SetModeEx( door.front , EM_SetModeType_Strikback , false );	--不會反擊
				SetModeEx( door.front , EM_SetModeType_Move , false );	--不會移動
				SetModeEx( door.front , EM_SetModeType_Fight , false );	--不可攻擊
				SetModeEx( door.front , EM_SetModeType_Searchenemy , false );	--不會索敵
				SetModeEx( door.front , EM_SetModeType_Obstruct , true );	--有阻擋效果	
			end
			boss_reset = true
			--若戰鬥就執行AI計時
			tarros[_roomID].skilltime.total = tarros[_roomID].skilltime.total+1
			DebugMsg(0,0,"_skilltime="..tarros[_roomID].skilltime.total);
			if tarros[_roomID].skilltime.total >= 360 and level ~= 163 then --360
				DebugMsg(0,0,"--164or165--");
				addBuff(boss.id, 625099, 0,-1)
			elseif tarros[_roomID].skilltime.total >= 480 and level == 163 then
				DebugMsg(0,0,"--163333333333333333333--");
				addBuff(boss.id, 625099, 0,-1)
			end
			if tarros[_roomID].skilltime.RuneSlash > 0 then
				tarros[_roomID].skilltime.RuneSlash = tarros[_roomID].skilltime.RuneSlash-1
			end
			if tarros[_roomID].skilltime.RuneBean > 0 then
				tarros[_roomID].skilltime.RuneBean = tarros[_roomID].skilltime.RuneBean-1
			end
			if tarros[_roomID].skilltime.RuneTrap > 0 then
				tarros[_roomID].skilltime.RuneTrap = tarros[_roomID].skilltime.RuneTrap-1
			end
			if tarros[_roomID].skilltime.RayAttack > 0 then
				tarros[_roomID].skilltime.RayAttack = tarros[_roomID].skilltime.RayAttack-1
			end
			if tarros[_roomID].skilltime.Teleport >0 then
				tarros[_roomID].skilltime.Teleport = tarros[_roomID].skilltime.Teleport-1
			end
		--若脫離戰鬥則重設初始化
		elseif boss_reset and boss.hp>0 then
			sleep(10)
			tarros_CombatActive = false
			DelObj(boss.id)
			DelObj(door.front)
			x,y,z,direction = DW_Location(OwnerID())
			Lua_DavisDelObj( boss_org );--140722 K.J. Aris
			CreatedBoss = WY_Create_an_obj(boss_org, x,y,z,direction)
			boss = WY_get_objStatus(CreatedBoss)
			_bossGlobalConst[ _roomID ] = boss;--140724 K.J. Aris
			boss_reset = false
			tarros[_roomID] = {}
			tarros[_roomID].skilltime = {}
			tarros[_roomID].skilltime.total = 0
			tarros[_roomID].skilltime.RuneSlash = 7--符能連斬的冷卻
			tarros[_roomID].skilltime.RuneBean = 10--符文光束的冷卻
			tarros[_roomID].skilltime.RuneTrap = 13--傳送陷阱的冷卻
			tarros[_roomID].skilltime.RayAttack = 17--射線攻擊的冷卻
			tarros[_roomID].skilltime.Teleport = 19--隨機位移的冷卻
			tarros[_roomID].mine = 0
			tarros[_roomID].target = {}
			local temp_list = SearchRangeNPC(OwnerID(),500)
			for n = 1,#temp_list do
				local pos = n-1
				local temp_obj = ReadRoleValue(temp_list[pos], EM_RoleValue_OrgID) 
				if temp_obj == 103385 or temp_obj == 103384 or temp_obj == 123210 then
					DelObj(temp_list[pos])
				end
			end
			DebugMsg( 0 , 0 , "-- boss reset!!" );
		end
		sleep(10)
	end

	DebugMsg( 0 , 0 , "-- out of track  !!" );

	DelObj(door.back)
	DelObj(door.front)
	local temp_list = SearchRangeNPC(OwnerID(),500)
	for n = 1,#temp_list do
		local pos = n-1
		local temp_obj = ReadRoleValue(temp_list[pos], EM_RoleValue_OrgID) 
		if temp_obj == 103385 or temp_obj == 103384 or temp_obj == 123210 then
			DelObj(temp_list[pos])
		end
	end
	boss = nil
	tarros_CombatActive = nil
	tarros[ _roomID ] = nil
	_bossGlobalConst[ _roomID ] = nil;
end
--"WY_Z163_B5_TARROS_COMBAT"這個函式由中控器的產生劇情偵測到BOSS的戰鬥狀態時啟動在BOSS身上。
--此函式持續以全域BOSS資訊是否在戰鬥中作為迴圈開關。
--函式中持續檢查魔力狀態是否足以切換姿態。
--並當在全域BOSS資訊中的冷卻條件符合條件的時候施展對應技能。
function WY_Z163_B5_TARROS_COMBAT(guid)
	local _roomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID);
	local r = 0
	local sys = {625100,625101}
	local overheat = 0
	local near_player = {}
	local doom = 0

	local boss = _bossGlobalConst[ _roomID ];--140724 K.J. Aris
	DebugMsg( 0 , 0 , "bOSS IS in fight" );	

	local _nextSystemStatus = RandRange(1,2);--1 = blue , 2 = red
	while tarros_CombatActive do
		boss = WY_get_objStatus(guid)
		system = WY_Z163_B5_SYSTEM()
		--檢查魔力是否全滿
		if boss.mp >= ReadRoleValue( boss.id , EM_RoleValue_MaxMP ) then
			WriteRoleValue(boss.id,EM_RoleValue_MP,0)
			for n=1,2 do cancelBuff(boss.id,sys[n]) end
			if system == "Red" then
				r = 1
				scriptMessage(boss.id, boss.Rtarget, 2, "[WY_STRING_Z163_BLUE]" , 0 )
				DebugMsg( 0 , 0 , " red switch to blue " );
				cancelBuff(boss.id,625100)
				AddBuff( boss.id , 625101 , 0 , -1 );
				_nextSystemStatus = 1;
			elseif system == "Blue" then
				r = 2
				scriptMessage(boss.id, boss.Rtarget, 2, "[WY_STRING_Z163_RED]" , 0 )
				DebugMsg( 0 , 0 , " blue switch to red " );
				cancelBuff(boss.id,625101)
				AddBuff( boss.id , 625100 , 0 , -1 );
				_nextSystemStatus = 2;
			--else r = RandRange(1,2) end
			else 
				r = _nextSystemStatus;
				local _buffID =  sys[r];
				AddBuff(boss.id,_buffID,0,-1);
			end
			--addBuff(boss.id, sys[r],0,-1)
			addBuff(boss.id,625104,0,-1)
			overheat = overheat +1
		end
		--檢查是否過熱
		if overheat >= 4 then
			scriptMessage(boss.id, boss.Rtarget or 0 , 2, "[WY_STRING_Z163_OVERHEAT]" , 0)
			overheat = 0
			SysCastSpellLv(boss.id,boss.id,851367,0)
			WriteRoleValue(boss.id,EM_RoleValue_MP,0)
			for n=1,2 do cancelBuff(boss.id,sys[n]) end
			SetDefIdleMotion(boss.id, ruFUSION_MIME_CROUCH_LOOP)
			CastSpellLV(boss.id,boss.id,851365 ,0)
			Sleep(60)
			SetDefIdleMotion(boss.id, ruFUSION_MIME_IDLE_STAND)
			WriteRoleValue(boss.id,EM_RoleValue_MP,1000000)
		end
		--當符能連斬冷卻結束
		if tarros[_roomID].skilltime.RuneSlash <= 0 then
			CastSpellLV(boss.id,boss.id,851358,0)
			tarros[_roomID].skilltime.RuneSlash = 7--重設符能連斬的冷卻
		end
		--當符文光束冷卻結束
		if tarros[_roomID].skilltime.RuneBean <= 0  then
			--當赤紅狀態執行以下
			if system == "Red" then
				CastSpellLV(boss.id,boss.id,851360,0)
				--WriteRoleValue(boss.id,EM_RoleValue_MP,boss.mp+200000)
				--當湛藍狀態則執行以下
			elseif system == "Blue" then
				CastSpellLV(boss.id,boss.id,851362,0)
			end
			tarros[_roomID].skilltime.RuneBean = 10--重設符文光束的冷卻
		end
		--當傳送陷阱冷卻結束
		if tarros[_roomID].skilltime.RuneTrap <= 0 and tarros[_roomID].mine < 8 then
			local x,y,z,direction = DW_Location(OwnerID())
			local Tarp = CreateObj(123210,x,y,z,direction,1)
			 AddtoPartition(Tarp, boss.room_id)
			tarros[_roomID].mine = tarros[_roomID].mine + 1
			tarros[_roomID].skilltime.RuneTrap = 13--重設傳送陷阱的冷卻
		end
		--當射線攻擊的冷卻結束
		if tarros[_roomID].skilltime.RayAttack <= 0 then
			--當赤紅狀態執行以下
			if system == "Red" then
				Sleep(5);
				if CastSpellLV(boss.id,boss.Rtarget, 851361, 0) then
					DebugMsg(0,ReadRoleValue( boss.Rtarget , EM_RoleValue_RoomID ),"Rad_true");
					scriptMessage(boss.id, boss.Rtarget, 2, "[WY_STRING_Z163_REDRAY]" , 0 );
					sleep(50);
				else
					DebugMsg(0,ReadRoleValue( boss.Rtarget , EM_RoleValue_RoomID ),"Rad_false");
				end
			--當湛藍狀態則執行以下
			elseif system == "Blue" then
				Sleep(5);
				if CastSpellLV(boss.id,boss.Rtarget, 851363, 0) then
					DebugMsg(0,ReadRoleValue( boss.Rtarget , EM_RoleValue_RoomID ),"Blue_true");
					scriptMessage(boss.id, boss.Rtarget, 2, "[WY_STRING_Z163_BLUERAY]" , 0 );
					sleep(50);
				else
					DebugMsg(0,ReadRoleValue( boss.Rtarget , EM_RoleValue_RoomID ),"Blue_false");
				end
			end
			tarros[_roomID].skilltime.RayAttack = 17--重設射線攻擊的冷卻
		end
		--當隨機位移的冷卻結束
		if tarros[_roomID].skilltime.Teleport <= 0 then
			local r = RandRange(1,4)-1
			local x,y,z,direction = DW_Location(781343,r)
			Say(boss.id,"[WY_STRING_Z163_TELEPORT]")
			sleep(15)
			Addbuff(boss.id,625114,0,1)
			sleep(5)
			SetPos(boss.id,x,y,z,direction)
			SetDefIdleMotion(boss.id, ruFUSION_MIME_CROUCH_LOOP)
			CastSpellLV(boss.id,boss.id,851366 ,0)
			Sleep(29)
			SetDefIdleMotion(boss.id, ruFUSION_MIME_IDLE_STAND)
			tarros[_roomID].skilltime.Teleport = 19--重設隨機位移的冷卻
		end
		near_player = SearchRangePlayer(boss.id, 60)
		if #near_player < 1 and doom < 4 then
			doom = doom + 1
			--ScriptMessage( boss.id, -1, 2, "[WY_STRING_Z163_DOOM]"..(4-doom), 0 );
			ScriptMessage( boss.id, -1, 2, "[WY_STRING_Z163_DOOM]", 0 );
			if doom > 3 then SysCastSpellLv(boss.id,boss.id,851359,0) end
		else
			doom = 0
		end
		sleep(10)
	end
end
--BOSS當前系統狀態回傳
function WY_Z163_B5_SYSTEM()
	local boss = OwnerID()
	local system = "Cool Down"
	if CheckBuff(boss, 625100) then
		system = "Red"
	elseif CheckBuff(boss, 625101) then
		system = "Blue"
	end
	return system
end
--陷阱倒數與啟動
function WY_Z163_B5_TRAP()
	for n = 1,5 do
		say(OwnerID(),"[WY_STRING_Z163_TRAP]"..(6-n))
		sleep(10)
	end
	Say(OwnerID(),"[WY_STRING_Z163_ARMED]")
	SetPlot(OwnerID(),"range", "WY_Z163_B5_TeleportTrap",20)
end
--傳送陷阱觸發效果
function WY_Z163_B5_TeleportTrap()
	if ( CheckBuff( OwnerID() , 625112 ) ) then--避免傳送後  又撞到陷阱 又加一次
		return;
	end

	local _roomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID );
	local boss = _bossGlobalConst[ _roomID ];--140724 K.J. Aris

	local _currentMP = ReadRoleValue( boss.id , EM_RoleValue_MP );
	local _maxMp = ReadRoleValue( boss.id , EM_RoleValue_MaxMP );
	WriteRoleValue( boss.id , EM_RoleValue_MP , _currentMP + _maxMp*0.2 );
	addBuff(OwnerID(),625112,0,3)
	sleep(10)
	local x,y,z,direction = DW_Location(boss.id)
	
	SetPos(OwnerID(),x,y,z,direction)
	tarros[_roomID].mine = tarros[_roomID].mine - 1
	DelObj(TargetID())
end
--自訂扇形法術擊中區域
function WY_ARC_TARGET_120()--已作廢
	local temp_table = SearchRangePlayer(OwnerID(),125)
	local temp_dir = 0
	local boss_dir = ReadRoleValue(OwnerID(),EM_RoleValue_Dir)
	local targets = 0
	local boss_sys = WY_Z163_B5_SYSTEM()
	for  n = 1, #temp_table do
		local pos = n-1
		local player = temp_table[pos]
		local x,y,z,direction = DW_Location(player)
		local temp_dir = DW_GetDir(x,y,z,player)
		local diff_dir = math.abs(DW_GetDiffOfDirs(temp_dir, boss_dir) )
		if diff_dir < 60 then
			PushMagicShootTarget(player)
			targets = targets + 1
		end
	end
	local boss_mp = ReadRoleValue(OwnerID(),EM_RoleValue_MP)
	local n = 0
	if ReadRoleValue(OwnerID(),EM_RoleValue_ZoneID) == 163 then
		n = 5
	else
		n = 3
	end
	if targets <n and boss_sys == "Red" then
		--WriteRoleValue(OwnerID(),EM_RoleValue_MP,boss_mp+150000*targets)
		WriteRoleValue(OwnerID(),EM_RoleValue_MP,boss_mp + boss_mp*0.15*targets)
	end
	if boss_sys == "Blue" then
		--WriteRoleValue(OwnerID(),EM_RoleValue_MP,boss_mp+100000*targets)		
		WriteRoleValue(OwnerID(),EM_RoleValue_MP,boss_mp+boss_mp*0.15*targets)		
	end
end

function Lua_703097_Skill_Laser_Blue_Hit()
	local _ownerID = OwnerID();
	local _targetID = TargetID();
	local _maxMp = ReadRoleValue(_ownerID,EM_RoleValue_MaxMP);
	local _currentMP = ReadRoleValue(_ownerID,EM_RoleValue_MP);
	WriteRoleValue(_ownerID,EM_RoleValue_MP,_currentMP+_maxMp*0.10)
	return true;
end

function Lua_703097_Skill_Laser_Red()
	local _ownerID = OwnerID();
	local _currentMP = ReadRoleValue(_ownerID,EM_RoleValue_MP);
	local _maxMp = ReadRoleValue(_ownerID,EM_RoleValue_MaxMP);
	DebugMsg(0,ReadRoleValue( _ownerID , EM_RoleValue_RoomID ),"_currentMP=".._currentMP.."  _maxMp=".._maxMp);
	WriteRoleValue(_ownerID,EM_RoleValue_MP,_currentMP+_maxMp*0.2);
	DebugMsg(0,ReadRoleValue( _ownerID , EM_RoleValue_RoomID ),"_currentMP="..ReadRoleValue(_ownerID,EM_RoleValue_MP));
	BeginPlot( _ownerID , "Lua_703097_Skill_Laser_Red_End" , 15 );
	return true;
end
function Lua_703097_Skill_Laser_Red_Hit()
	local _ownerID = OwnerID();
	local _targetID = TargetID();
	DebugMsg(0,ReadRoleValue( _ownerID , EM_RoleValue_RoomID ),"Lua_703097_Skill_Laser_Red_Hit");
	local _hitCounter = ReadRoleValue( _ownerID , EM_RoleValue_Register10 );
	_hitCounter = _hitCounter + 1;
	WriteRoleValue( _ownerID , EM_RoleValue_Register10 , _hitCounter );
	
--	if _hitCounter ==1 then
--		BeginPlot( _ownerID , "Lua_703097_Skill_Laser_Red_End" , 15 );
--	end

	return true;
end
function Lua_703097_Skill_Laser_Red_End()
	local _ownerID = OwnerID();
	local _targetID = TargetID();
	
	local _zoneID = ReadRoleValue( _ownerID , EM_RoleValue_ZoneID );

	local _minPlayer = 5;
	if ( _zoneID == 164 or _zoneID == 165 ) then
		_minPlayer = 3;
	end

	local _currentMP = ReadRoleValue(_ownerID,EM_RoleValue_MP);
	local _maxMp = ReadRoleValue(_ownerID,EM_RoleValue_MaxMP);
	local _hitCounter = ReadRoleValue( _ownerID , EM_RoleValue_Register10 );
	
	if ( _hitCounter < _minPlayer  ) then--若是分擔傷害的玩家人數少於5人（普通與簡單為3人），則額外增加15%魔力。
		DebugMsg(0,ReadRoleValue( _ownerID , EM_RoleValue_RoomID ),"_currentMP=".._currentMP.."  _maxMp=".._maxMp);
		WriteRoleValue(_ownerID,EM_RoleValue_MP,_currentMP+_maxMp*0.15);
		DebugMsg(0,ReadRoleValue( _ownerID , EM_RoleValue_RoomID ),"_currentMP="..ReadRoleValue(_ownerID,EM_RoleValue_MP));
	end
	WriteRoleValue( _ownerID , EM_RoleValue_Register10 , 0 );
end

--[[
function Lua_703097_Skill_Laser_Red_Hit_Zero()
	WriteRoleValue( OwnerID() , EM_RoleValue_Register10 , 0 );
	return;
end
]]--

--冰牢的產生與設定死亡劇情
function WY_Z163_B5_ICE()
	local _roomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID );
	local boss = _bossGlobalConst[ _roomID ];--140724 K.J. Aris

	local level = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID );
	local x,y,z,direction = DW_Location(TargetID())
	if level == 163 then ice_org = 103384 
	elseif level == 164 then ice_org = 108480
	elseif level == 165 then ice_org = 108486
	end
	local ice = WY_Create_an_obj(ice_org,x,y,z,direction)
	local timer = 0
	if ( boss.Rtarget ~= nil ) then scriptMessage(boss.id, boss.Rtarget, 2, getname(TargetID()).. "[WY_STRING_Z163_ICED]" , 0); end
	WriteRoleValue(ice,EM_RoleValue_Register1,TargetID())
	SetModeEx(ice,EM_SetModeType_Obstruct,true)
	WriteRoleValue(ice,EM_RoleValue_LiveTime,20)
	SetPlot(ice, "dead", "WY_Z163_B5_ICEBREAK",0)			
end
--冰牢的死亡劇情
function WY_Z163_B5_ICEBREAK()
	cancelBuff(TargetID(),625109)
	DelObj(OwnerID())
end
--火焰符石的產生
function WY_Z163_B5_FIRE()
--	DebugMsg( 0 , 0 , "OwnerID="..OwnerID() )
--	DebugMsg( 0 , 0 , "TargetID="..TargetID() )
	local x,y,z,direction = DW_Location(TargetID())
	local fire_org = 0
	local level = ReadRoleValue( TargetID() , EM_RoleValue_ZoneID );
	if level == 163 then fire_org = 103385 
	elseif level == 164 then fire_org = 108484
	elseif level == 165 then fire_org = 108486
	end
	local fire = WY_Create_an_obj(fire_org,x,y,z,direction)
	SetModeEx(fire,EM_SetModeType_Fight,false)
	SetModeEx( fire , EM_SetModeType_Mark , false );	--不可點選
	SetModeEx( fire , EM_SetModeType_HideName , true );	--不顯示名稱
	SetModeEx( fire , EM_SetModeType_NotShowHPMP , false );	--不顯示血條
	SetModeEx( fire , EM_SetModeType_Strikback , false );	--不會反擊
	SetModeEx( fire , EM_SetModeType_Move , false );	--不會移動
	SetModeEx( fire , EM_SetModeType_Fight , false );	--不可攻擊
	SetModeEx( fire , EM_SetModeType_Searchenemy , false );	--不會索敵
	WriteRoleValue( fire , EM_RoleValue_Register1 , OwnerID() );
end
--火焰符石的法術
function WY_Z163_FIRERUNE()
	local me = OwnerID()
	local _boss = ReadRoleValue( me , EM_RoleValue_Register1 );
	while ReadRoleValue(me,EM_RoleValue_HP) ~= 0 and ReadRoleValue( _boss , EM_RoleValue_AttackTargetID ) ~= 0 do
		SysCastSpellLv(me,me,497710,0)
		sleep(50)
	end
end