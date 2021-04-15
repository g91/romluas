
function Lua_ACWB_Boss1_GlobalSet()--企劃變數設定
	if ACWB_Boss1_Global == nil then
		ACWB_Boss1_Global = {}
	end
	local Global = ACWB_Boss1_Global
	
	Global["Skill"] = {}
	Global["Skill"][1] = {	ID = 499048, Time = 20, TID = nil	}--熔岩領域
	Global["Skill"][2] = {	ID = 499053, Time = 12, TID = 1	}--地震波
	Global["Skill"][3] = {	ID = 499052, Time = 9, TID = nil	}--怒暴狂吼
	Global["Skill"][4] = {	ID = 499051, Time = 17, TID = 0	}--狂擊
	
	Global["CheckDis"] = 300 --脫離戰鬥的距離
	Global["FireLife"] = 90--熔岩存在時間
	Global["CrazyTime"] = 480 --狂暴時間
	Global["FireTime"] = 1	--灼燒之炎/鋼鐵煉體施放間隔
	Global["ShareDmgLv"] = 20 --分攤傷害最大等級(0~7)
	Global["ShareNum"] = 7 --分攤傷害的需求人數
end

function Lua_ACWB_Boss1_Ctrl()
	local Ctrl = OwnerID()
	local RoomID = ReadRoleValue( Ctrl, EM_RoleValue_RoomID );
	
	if ACWB_Boss1_Global == nil then
		Lua_ACWB_Boss1_GlobalSet()
	end
	
	if ACWB_Boss1_Global[RoomID] == nil then
		ACWB_Boss1_Global[RoomID] = {}
	end
		
	local Global = ACWB_Boss1_Global[RoomID]
	Global["Ctrl"] = Ctrl
	Global["Boss"] = LuaFunc_CreateObjByObj(  106625, Global["Ctrl"] )
	ks_AttackMode( Global["Boss"] )--設定可攻擊NPC
	SetPlot( Global["Boss"], "dead", "Lua_ACWB_Boss1_Dead", 0 );--死亡判斷
		--20120109準，新設阻擋後門。
		local Global = ACWB_Boss1_Global[RoomID];
		local exit = Cl_CreateObj_ForFlag( 106237 , 780871 , 2 , RoomID ) ----產生透明球專用
		SetModeEx ( exit , EM_SetModeType_Obstruct, true) 		---阻擋(是)
		WriteRoleValue( OwnerID(),EM_RoleValue_Register10, exit)
end

function Lua_ACWB_Boss1_Fight()--開始戰鬥
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	CallPlot( ACWB_Boss1_Global[RoomID]["Ctrl"], "Cl_ACWB_BossIsDeadFlag", 1)--進入戰鬥
	CallPlot( OwnerID(), "Lua_ACWB_Boss1_AI" )
		--新設阻擋門，20120102準新增
		--local RoomID = ReadRoleValue( Boss, EM_RoleValue_RoomID );
		local Global = ACWB_Boss1_Global[RoomID];
		local doors1 = Cl_CreateObj_ForFlag( 106237 , 780871 , 1 , RoomID ) ----產生透明球專用
		SetModeEx ( doors1 , EM_SetModeType_Obstruct, true) 		---阻擋(是)
		Global["CtrlObj"] = Global["CtrlObj"] or {}
		table.insert( Global["CtrlObj"], doors1 )

end

function Lua_ACWB_Boss1_AI()--BossAI
	local Boss = OwnerID()
	local RoomID = ReadRoleValue( Boss, EM_RoleValue_RoomID );
	local Global = ACWB_Boss1_Global[RoomID];
	local Skill = ACWB_Boss1_Global["Skill"]
	Global["HitCount"] = 0
	local time = 0;
	
	CallPlot( Boss, "Lua_ACWB_Boss1_Timer", 0 )--計時器
	ScriptMessage( Boss, -1 , 2 , "[SC_ACWB_BOSS1_START]", 2 );--脫離戰鬥
		--20120113新增延後開戰的時間
		sleep(40)
	while true do
		DebugMsg(0,0,"SkillTime = "..time )
		for i=1, #Skill do
			if time%Skill[i].Time == 0 then
				local DisableRotate = false
				StopMove( Boss, true );
				ScriptMessage( Global["Ctrl"], -1 , 2 , "[SC_ACWB_BOSS1_SKILL_"..i.."]", 2 );
				local target = ReadRoleValue( Boss, EM_RoleValue_AttackTargetID )
				if Skill[i].TID == nil then
					target = Boss
				else
					if Skill[i].TID >= 0 then
						local Hater = KS_GetHateList( Boss, 4 );--仇恨表( Type:1 依仇恨; 2 依距離; 3 玩家; 4過濾GM)
						if #Hater >0 then
							target = Hater[rand(#Hater)+1]
						end
					end
					--target = Lua_ACWB_Boss1_SpellTarget( target )--創造技能標記點
				end
				
				if i==2 then--地震波
					DisableRotate = true--面向鎖定
					AdjustFaceDir( Boss, target, 0 )
					target = Boss
				elseif i==4 then--怒暴狂擊
					AddBuff( target, 621983, 0,-1 )--攻擊鎖定
				end
				--Say( Boss, "target = "..GetName(target) )
				CastSpell( Boss, target, Skill[i].ID )
				lockTime = GameObjInfo_Int( Skill[i].ID, "SpellTime" )
				Lua_ACWB_Boss1_SetLock( lockTime, DisableRotate  )
				break
			end
		end
		time = time+1;
		sleep(10)
	end
end

function Lua_ACWB_Boss1_Dead()--死亡劇情
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local Global = ACWB_Boss1_Global[RoomID];
	ScriptMessage( Global["Ctrl"], -1 , 2 , "[SC_ACWB_BOSS1_DEAD]", 2 );--脫離戰鬥
	CallPlot( Global["Ctrl"], "Cl_ACWB_BossIsDeadFlag", 3)--BOSS死亡
	CallPlot(Global["Ctrl"] , "Lua_ACWB_DelExit")
	Lua_ACWB_Boss1_Reset()
end

function Lua_ACWB_Boss1_SpellTarget( target )--創造技能標記點
	local Boss = OwnerID()
	local RoomID = ReadRoleValue( Boss, EM_RoleValue_RoomID );
	local Global = ACWB_Boss1_Global[RoomID];
	local Bx = ReadRoleValue( Boss, EM_RoleValue_X )
	local By = ReadRoleValue( Boss, EM_RoleValue_Y )
	local Bz = ReadRoleValue( Boss, EM_RoleValue_Z )
	local Tx = ReadRoleValue( target, EM_RoleValue_X )
	local Tz = ReadRoleValue( target, EM_RoleValue_Z )
	local radian = (math.pi/180)*CalDir( (Tx-Bx), (Tz-Bz) )--徑度

	target = CreateObj( 103123, Bx  +10*math.cos(radian), By, Bz - 10*math.sin(radian), 0, 1 )--106626
	SetRoleCamp( target, "Visitor")
	ks_TrapMode( target )----陷阱用
	WriteRoleValue( target, EM_RoleValue_LiveTime, 3 )
	
	return target
end

function Lua_ACWB_Boss1_Timer()--計時器
	local Boss = OwnerID()
	local Global = ACWB_Boss1_Global
	local Base = {}
	Base.X = ReadRoleValue( Boss, EM_RoleValue_X )
	Base.Y = ReadRoleValue( Boss, EM_RoleValue_Y )
	Base.Z = ReadRoleValue( Boss, EM_RoleValue_Z )
	local X, Z
	local time = 0
	
	while true do
		X = ReadRoleValue( Boss , EM_RoleValue_X );
	 	Z = ReadRoleValue( Boss , EM_RoleValue_Z );
		Dis = math.floor( ( ( X - Base.X )^2 +( Z - Base.Z )^2 )^0.5);
		if not KS_InCombat( Boss )  or Dis > Global["CheckDis"] then
			ScriptMessage( Boss, -1 , 2 , "[SC_ACWB_BOSS1_EXIT]", 2 );--脫離戰鬥
			ks_TransTo( Base.X, Base.Y, Base.Z )--傳送到特定位置( Rnd = 隨機距離 min=最小距離 )
			Lua_ACWB_Boss1_Reset( true )--重置
			return
		end
		
		if time >= Global["CrazyTime"] and not CheckBuff( Boss, 621929 ) then
			--AddBuff( Boss, 621929, 0, -1 )
			AddBuff( Boss, 622092, 0, -1 )
		end
		DebugMsg(0,0,"time="..time)
		time = time+1
		Sleep(10)
	end
end

function Lua_ACWB_Boss1_Reset( reset )
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local Global = ACWB_Boss1_Global[RoomID];
	if Global["CtrlObj"] ~= nil then
		for i=1, #Global["CtrlObj"] do
			if CheckID( Global["CtrlObj"][i] ) then
				DelObj( Global["CtrlObj"][i] )
			end
		end
		Global["CtrlObj"] = nil
	end
	
	if reset then
		CallPlot( Global["Ctrl"], "Cl_ACWB_BossIsDeadFlag", 2)--戰鬥重置
		SetModeEx( Global["Boss"], EM_SetModeType_Move, true )
		SetModeEx( Global["Boss"], EM_SetModeType_Fight, true )
		SetModeEx( Global["Boss"], EM_SetModeType_DisableRotate , false )
		ks_resetObj( Global["Boss"], 5 );
	end
end

--function Lua_ACWB_Boss1_CreateFire()--產生熔岩
--	local Boss = OwnerID()
--	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
--	local Global = ACWB_Boss1_Global[RoomID];
--	local fire = LuaFunc_CreateObjByObj( 106626, Boss )
--	ks_TrapMode( fire )----陷阱用
--	AddBuff( fire, 621930, 0, -1 )--特效
--	CallPlot( fire, "Lua_ACWB_Boss1_FireAI", Boss )
	
--	Global["CtrlObj"] = Global["CtrlObj"] or {}
--	table.insert( Global["CtrlObj"], fire )
--end
--修改版本，在boss付近100碼施放
function Lua_ACWB_Boss1_CreateFire()--產生熔岩
	local Boss = OwnerID()
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local Global = ACWB_Boss1_Global[RoomID];
	local X = ReadRoleValue( Boss , EM_RoleValue_X )
	local Y = ReadRoleValue( Boss , EM_RoleValue_Y )
	local Z = ReadRoleValue( Boss , EM_RoleValue_Z )
	local Range = 70
	local ObjX , ObjZ = 0 , 0
	local nRand=Rand(8)+1
		ObjX = X - Range * math.cos(math.pi*2*(nRand/8))
		ObjZ = Z + Range * math.sin(math.pi*2*(nRand/8))
	local fire = CreateObj( 106626 , ObjX, Y+25, ObjZ, 0, 1 )
	AddToPartition( fire , RoomID  )
	--local fire = LuaFunc_CreateObjByObj( 106626, Boss )
	ks_TrapMode( fire )----陷阱用
	AddBuff( fire, 621930, 0, -1 )--特效
	CallPlot( fire, "Lua_ACWB_Boss1_FireAI", Boss )
	
	Global["CtrlObj"] = Global["CtrlObj"] or {}
	table.insert( Global["CtrlObj"], fire )
end

function Lua_ACWB_Boss1_FireAI( Boss )--熔岩控制
	local Fire = OwnerID()
	local Global = ACWB_Boss1_Global
	--2012/01/02準新增修改開始壘BUFF時間
	for i=1,3 do
		if (HateListCount(Boss) == 0 ) or CheckID(Boss )==false then
			DebugMsg(0,0,"bye")
			DelObj(OwnerID())
			return
		end
		Sleep(10)
	end
	for i=1, Global["FireLife"] do
		if i%Global["FireTime"] == 0 then
			if GetDistance( Fire, Boss ) <= 100 then
				--準新增判定，為避免減傷過頭玩家攻擊變回血。
				 if CheckBuff(Boss,622092)==FALSE then
					AddBuff( Boss, 621922, 0, -1 )--鋼鐵煉體
				end
			end
			--local AttackTarget = ReadRoleValue( Boss , EM_RoleValue_AttackTargetID )

			CastSpell( Fire, Fire, 499049 )
		end
		Sleep(10)
	end
	DelObj( Fire )
end

function Lua_ACWB_Boss1_SetLock( time, DisableRotate )
	local obj = OwnerID()
	time = time or 0
	if time == 0 then
		sleep(5)
		return
	end
	if DisableRotate then
		SetModeEx( obj, EM_SetModeType_DisableRotate , true )
	end
	SetModeEx( obj, EM_SetModeType_Move, false )
	--SetModeEx( obj, EM_SetModeType_Fight, false )
	sleep( time*10 )
	--SetModeEx( obj, EM_SetModeType_Fight, true )
	SetModeEx( obj, EM_SetModeType_DisableRotate , false )
	Sleep(10)
	SetModeEx( obj, EM_SetModeType_Move, true )
end

function Lua_ACWB_Boss1_ShareDmgCheck()--傷害分攤檢查
	local Boss = OwnerID()
	local TID = TargetID()
	local count = 0
	
	local Player = SearchRangePlayer( TID, 100 );
	for i=0, #Player-1 do
		if ReadRoleValue( Player[i], EM_RoleValue_VOC ) ~= 0 then
			count = count+1
		end
	end
	DebugMsg(0,0,"ShareDmgLv = ".. math.floor(ACWB_Boss1_Global["ShareDmgLv"]/count).."; count = "..count )
	SysCastSpellLv( Boss, Boss, 499050, math.floor(ACWB_Boss1_Global["ShareDmgLv"]/count) )
	if count < ACWB_Boss1_Global["ShareNum"] then
		CallPlot( Boss, "Lua_ACWB_Boss1_AddCrazyBuff", ACWB_Boss1_Global["ShareNum"] - count-1 )--狂暴狀態
	end
end

function Lua_ACWB_Boss1_AddCrazyBuff( Lv )--狂暴狀態
	Sleep(10)
	local BuffID = 621924
	local MaxLv = GameObjInfo_Int( BuffID, "MaxBuffLv")
	if Lv > MaxLv then
		Lv = MaxLv
	end
	AddBuff( OwnerID(), BuffID, Lv, -1 )--狂暴
end

--boss死亡時刪除阻擋門
function Lua_ACWB_DelExit()
		local exit=ReadRoleValue(OwnerID(),EM_RoleValue_Register10)
		DelObj(exit)
end