--進入按鈕劇情
function CheckEnterGuildWar()
	--受傷狀態不能進入戰場
	local Count = BuffCount ( OwnerID())
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID ) -- 基本法術ID
		if BuffID == 501387 then--大天使....
			CancelBuff_NoEvent(OwnerID(),505918)
			CancelBuff_NoEvent(OwnerID(),505919)
			CancelBuff_NoEvent(OwnerID(),505518)
			CancelBuff_NoEvent(OwnerID(),505920)
			CancelBuff_NoEvent(OwnerID(),506136)
			return true
		end
	end
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID ) -- 基本法術ID
		if BuffID == 505918 then--輕傷狀態....
			CancelBuff_NoEvent(OwnerID(),505918)
			AddBuff(OwnerID(),505919,0,600)
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_YU_GUILDWAR_BUILD_52]" , 0 );
			ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_YU_GUILDWAR_BUILD_52]" , 0 );
			return true
		elseif BuffID == 505919 then--重傷狀態....
			CancelBuff_NoEvent(OwnerID(),505919)
			AddBuff(OwnerID(),505920,0,600)
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_YU_GUILDWAR_BUILD_52]" , 0 );
			ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_YU_GUILDWAR_BUILD_52]" , 0 );
			return true
		elseif BuffID == 505920 then--奄奄一息....
--			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_YU_GUILDWAR_BUILD_51]" , 0 );
--			ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_YU_GUILDWAR_BUILD_51]" , 0 );
			return true
		end
	end
	return true
end

function Event_GuildWarInit(RoomID)	--公會載入完成初始化劇情
	local BB = CreateObj(100292,3117,1681,0,268,1)
	SetModeEx( BB, EM_SetModeType_Strikback, false )--反擊
	SetModeEx( BB, EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( BB, EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( BB, EM_SetModeType_Mark, false )--標記
	SetModeEx( BB, EM_SetModeType_Move, false )--移動
	SetModeEx( BB , EM_SetModeType_NotShowHPMP, true )--不顯示血條
	SetModeEx( BB, EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( BB, EM_SetModeType_HideName, true )--名稱
	SetModeEx( BB, EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( BB, EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( BB, EM_SetModeType_Show, false )--顯示
	SetModeEx( BB, EM_SetModeType_Drag , false )--阻力
	AddToPartition( BB , RoomID)
	BeginPlot(BB,"LuaZone_GUILDWAR_Main",0)
end

function LuaZone_GUILDWAR_BuildFlag()
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local LandMarkID = ReadRoleValue( OwnerID(), EM_RoleValue_PID );
	local CampID = GetRoleCampID( OwnerID() );
	if GuildWarSetting[RoomID]["FlagID"][LandMarkID] == nil then
		GuildWarSetting[RoomID]["FlagID"][LandMarkID] = {}
	end
	local FlagID
	if CampID == 7 then	--BLUE
		FlagID = 113701
	else	--RED
		FlagID = 113700
	end
	local Flag = {}
	Flag[1] = CreateObjByFlag( FlagID , 780235 , 2*(LandMarkID-2)-1 , 1 ) 
	Flag[2] = CreateObjByFlag( FlagID , 780235 , 2*(LandMarkID-2)-2 , 1 ) 
	for i = 1 , 2 do
		SetModeEx( Flag[i], EM_SetModeType_Strikback, false )--反擊
		SetModeEx( Flag[i], EM_SetModeType_SearchenemyIgnore, false )--被搜尋
		SetModeEx( Flag[i], EM_SetModeType_Obstruct, true )--阻擋
		SetModeEx( Flag[i], EM_SetModeType_Mark, true )--標記
		SetModeEx( Flag[i], EM_SetModeType_Move, false )--移動
		SetModeEx( Flag[i], EM_SetModeType_Searchenemy, false )--索敵
		SetModeEx( Flag[i], EM_SetModeType_HideName, true )--名稱
		SetModeEx( Flag[i], EM_SetModeType_ShowRoleHead, false )--頭像框
		SetModeEx( Flag[i], EM_SetModeType_Fight , false )--可砍殺攻擊
		SetModeEx( Flag[i], EM_SetModeType_Drag , true )--阻力
		AddToPartition(Flag[i] , RoomID)
		BeginPlot( Flag[i] , "Yuyu_GuildWarBuliding_BigSP2_00" , 0)
		WriteRoleValue( Flag[i], EM_RoleValue_PID, LandMarkID );			--將水晶編號記錄在pid
		GuildWarSetting[RoomID]["FlagID"][LandMarkID][i]= Flag[i]
		SetRoleCampID( Flag[i], CampID );
	end
	BeginPlot(OwnerID(),"LuaZone_GUILDWAR_BuildGuard",0)
end
function LuaZone_GUILDWAR_BuildGuard()
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local LandMarkID = ReadRoleValue( OwnerID(), EM_RoleValue_PID );
	local CampID = GetRoleCampID( OwnerID() );
	local ServerMaxLv = GetIniValueSetting("MaxRoleLevel")	-- 讀取伺服器設定的等級上限
	if GuildWarSetting[RoomID]["Guard"][LandMarkID] == nil then
		GuildWarSetting[RoomID]["Guard"][LandMarkID] = {}
	end
	local GuardID
	local GuardBoss
	if CampID == 7 then	--BLUE
		GuardBoss = 103144
		GuardID = 103314
	else	--RED
		GuardBoss = 103143
		GuardID = 103313
	end
	local Guard = {}
	Guard[1] = CreateObjByFlag( GuardID , 780329 , 3*(LandMarkID-2)-1 , 1 ) 
	Guard[2] = CreateObjByFlag( GuardID , 780329 , 3*(LandMarkID-2)-2 , 1 ) 
	Guard[3] = CreateObjByFlag( GuardBoss , 780329 , 3*(LandMarkID-2)-3 , 1 ) 
	for i = 1 , 3 do
		WriteRoleValue( Guard[i], EM_RoleValue_LV , ServerMaxLv )--等級會隨伺服器等級開放的上限而成長
		SetModeEx( Guard[i], EM_SetModeType_Strikback, true )--反擊
		SetModeEx( Guard[i], EM_SetModeType_SearchenemyIgnore, false )--被搜尋
		SetModeEx( Guard[i], EM_SetModeType_Obstruct, false )--阻擋
		SetModeEx( Guard[i], EM_SetModeType_Mark, true )--標記
		SetModeEx( Guard[i], EM_SetModeType_Move, true )--移動
		SetModeEx( Guard[i], EM_SetModeType_Searchenemy, true )--索敵
		SetModeEx( Guard[i], EM_SetModeType_HideName, true )--名稱
		SetModeEx( Guard[i], EM_SetModeType_ShowRoleHead, true )--頭像框
		SetModeEx( Guard[i], EM_SetModeType_Fight , true )--可砍殺攻擊
		SetModeEx( Guard[i], EM_SetModeType_Drag , true )--阻力
		AddToPartition(Guard[i] , RoomID)
		SetRoleCampID( Guard[i], CampID );
		WriteRoleValue( Guard[i], EM_RoleValue_PID, LandMarkID );			--將水晶編號記錄在pid
		GuildWarSetting[RoomID]["Guard"][LandMarkID][i]= Guard[i]
		SetPlot( Guard[i] , "dead" , "Lua_GUILDWAR_GuardDead" , 0 )
	end
	BeginPlot(OwnerID(),"Lua_GUILDWAR_GuardReviveClock",0)
end
function Lua_GUILDWAR_GuardReviveClock()
	local LandMarkID = ReadRoleValue( OwnerID(), EM_RoleValue_PID );
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local CampID = GetRoleCampID( OwnerID() );
	local GuardID
	local GuardBoss
	if CampID == 7 then	--BLUE
		GuardBoss = 103144
		GuardID = 103314
	else			--RED
		GuardBoss = 103143
		GuardID = 103313
	end
	local DeadClock = {-1,-1,-1}
	local Guard = {}
	while 1 do
		for i = 1 , 3 do
		--	DebugMsg( 0, RoomID ,"LandMarkID = "..LandMarkID.." DeadClock "..i.." ="..DeadClock[i])
			local GG = GuildWarSetting[RoomID]["Guard"][LandMarkID][i]
			local MonsterID = GuardID
			local index = i
			if i == 3 then
				MonsterID = GuardBoss
			end
			if DeadClock[i] ~= -1 then
			--	DebugMsg( 0, RoomID ," Reset ".."LandMarkID = "..LandMarkID.." DeadClock "..i.." ="..DeadClock[i])
				DeadClock[i] = DeadClock[i] + 1
			end
		--	Say(GG,"MyID = "..GG)
			if GG ~= 0 then
				if CheckID(GG) == true then
					if ReadRoleValue( GG ,EM_RoleValue_IsDead) == 1 then
					--	DebugMsg( 0, RoomID ," i am dead ".."LandMarkID = "..LandMarkID.." DeadClock "..i.." ="..DeadClock[i])
						if DeadClock[i] == -1 then
						--	DebugMsg( 0, RoomID ," Del Owner ".."LandMarkID = "..LandMarkID.." DeadClock "..i.." ="..DeadClock[i])
							DelObj(GG)
							GuildWarSetting[RoomID]["Guard"][LandMarkID][i] = 0
							DeadClock[i] = 0
						end
					end
				end
			end
			if DeadClock[i] >=300 then
				DeadClock[i] = -1
			--	DebugMsg( 0, RoomID ," CallPlot ######################")
			--	DebugMsg( 0, RoomID ," MonsterID = "..MonsterID.." index = "..index)
				local Obj = Role:new( OwnerID() ) 
				local BaseX = Obj :X()
			 	local BaseY = Obj :Y()
			 	local BaseZ = Obj :Z()
				local BaseDir = Obj:Dir()
				local BB = CreateObj( 100292 , BaseX, BaseY, BaseZ, BaseDir, 1 )
				SetModeEx( BB, EM_SetModeType_Strikback, false )--反擊
				SetModeEx( BB, EM_SetModeType_SearchenemyIgnore, false )--被搜尋
				SetModeEx( BB, EM_SetModeType_Obstruct, false )--阻擋
				SetModeEx( BB, EM_SetModeType_Mark, false )--標記
				SetModeEx( BB, EM_SetModeType_Move, false )--移動
				SetModeEx( BB, EM_SetModeType_Searchenemy, false )--索敵
				SetModeEx( BB, EM_SetModeType_HideName, true )--名稱
				SetModeEx( BB, EM_SetModeType_ShowRoleHead, false )--頭像框
				SetModeEx( BB, EM_SetModeType_Fight , false )--可砍殺攻擊
				SetModeEx( BB, EM_SetModeType_Show, false )--顯示
				SetModeEx( BB, EM_SetModeType_Drag , false )--阻力
				SetModeEx( BB , EM_SetModeType_NotShowHPMP, true )--不顯示血條
				AddToPartition( BB , RoomID)
				CallPlot(BB,"Lua_GUILDWAR_GuardRevive",MonsterID,index,LandMarkID,CampID)
			end
		end
		Sleep(10)
	end
end

function Lua_GUILDWAR_GuardRevive(MonsterID,index,LandMarkID,CampID)	-- 守衛重生
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local ServerMaxLv = GetIniValueSetting("MaxRoleLevel")	-- 讀取伺服器設定的等級上限
	local Guard = CreateObjByFlag( MonsterID , 780329 , 3*(LandMarkID-2)-index , 1 ) 
--	Debuglog(2 , "RoomID = "..RoomID.." CallPlot ###################### Susses")
--	DebugMsg( 0, RoomID ," CallPlot ###################### Susses")
--	Debuglog(2 , "RoomID = "..RoomID.." MonsterID = "..MonsterID.." index = "..index.." LandMarkID = "..LandMarkID)
--	DebugMsg( 0, RoomID ," MonsterID = "..MonsterID.." index = "..index)
	WriteRoleValue( Guard, EM_RoleValue_LV , ServerMaxLv )--等級會隨伺服器等級開放的上限而成長
	SetModeEx( Guard, EM_SetModeType_Strikback, true )--反擊
	SetModeEx( Guard, EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( Guard, EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( Guard, EM_SetModeType_Mark, true )--標記
	SetModeEx( Guard, EM_SetModeType_Move, true )--移動
	SetModeEx( Guard, EM_SetModeType_Searchenemy, true )--索敵
	SetModeEx( Guard, EM_SetModeType_HideName, true )--名稱
	SetModeEx( Guard, EM_SetModeType_ShowRoleHead, true )--頭像框
	SetModeEx( Guard, EM_SetModeType_Fight , true )--可砍殺攻擊
	SetModeEx( Guard, EM_SetModeType_Drag , true )--阻力
	AddToPartition(Guard , RoomID)
	SetRoleCampID( Guard, CampID );
	WriteRoleValue( Guard, EM_RoleValue_PID, LandMarkID );			--將水晶編號記錄在pid
	GuildWarSetting[RoomID]["Guard"][LandMarkID][index]= Guard
	SetPlot( Guard , "dead" , "Lua_GUILDWAR_GuardDead" , 0 )
	DelObj(OwnerID())
end

function LuaZone_GUILDWAR_Main()
	SetZoneReviveScript( "LuaZone_GUILDWAR_Revive" );
	SetZonePVPScript( "LuaZone_GUILDWAR_PVPDead" );
	local ZoneID =  ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID ) 
	local Zone = ZoneID -1000*math.floor( ZoneID / 1000 )
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )
	local ServerMaxLv = GetIniValueSetting("MaxRoleLevel")	-- 讀取伺服器設定的等級上限
	if RoomID == 0 then
		--return
	end
	if CrystalOwn == nil then
		CrystalOwn = {}
	end
	if GuildWarSetting == nil then
		GuildWarSetting = {}
	end
	--2012.06.12 修正公會城戰(Zone 402)建築 - 冶煉廠、農田、伐木廠，提高的研發技術等級，會在下一場公會城戰繼承的問題
	if Z402_AreaBuff == nil then
		Z402_AreaBuff = {}
	end
	Z402_AreaBuff[RoomID] = {}	-- 將該 Room 的全域變數歸零，避免研發技術等級繼承的錯誤發生
	--
	CrystalOwn[RoomID]= {}
	GuildWarSetting[RoomID]= {}
	GuildWarSetting[RoomID]["FlagID"]= {}
	GuildWarSetting[RoomID]["Guard"]= {}
	GuildWarSetting[RoomID]["building"]= {}
	GuildWarSetting[RoomID]["vehicle"]= {}
	GuildWarSetting[RoomID]["Kill"]= {}
	GuildWarSetting[RoomID]["energy"]= {}
	GuildWarSetting[RoomID]["MainObj"] = {}
	GuildWarSetting[RoomID]["building"][1]		= 110	--【建築物】能源汲取時間
	GuildWarSetting[RoomID]["building"][2]		= 1	--【建築物】能源汲取量
	GuildWarSetting[RoomID]["building"][3]		= 1	--【汲取能源】獲得戰績數量
	GuildWarSetting[RoomID]["vehicle"][1]		= 1	--【載具】建築時間	
	GuildWarSetting[RoomID]["vehicle"][2]		= 1	--【載具】所需能源	
	GuildWarSetting[RoomID]["vehicle"][3]		= 1	--【載具】所需戰績	
	GuildWarSetting[RoomID]["Kill"][1]		= 20	--【殺人】獲得戰績數量
	GuildWarSetting[RoomID]["Kill"][2]		= 50	--【殺軍團長】獲得戰績數量
	GuildWarSetting[RoomID]["Kill"][3]		= 100	--【佔領據點】獲得戰績數量
	GuildWarSetting[RoomID]["Kill"][4]		= 200	--【佔領大據點】獲得戰績數量
	GuildWarSetting[RoomID]["Kill"][5]		= 100	--【殺王級菁英】獲得戰績數量
	GuildWarSetting[RoomID]["Kill"][6]		= 50	--【殺菁英】獲得戰績數量
	GuildWarSetting[RoomID]["energy"][1]		= 	10	--【榮譽水晶能量增加量】7
	GuildWarSetting[RoomID]["energy"][2]		= 	10	--【榮譽水晶能量增加量】8
	GuildWarSetting[RoomID]["energy"][3]		= 	5000	--【能量總數】布魯克
	GuildWarSetting[RoomID]["energy"][4]		= 	5000	--【能量總數】阿納德
	GuildWarSetting[RoomID]["energy"][5]		= 	5000	--【能量總數】希爾特
	GuildWarSetting[RoomID]["energy"][6]		= 	5000	--【能量總數】貝里尼
	GuildWarSetting[RoomID]["energy"][7]		= 	5000	--【能量總數】愛薩奇
	GuildWarSetting[RoomID]["energy"][8]		= 	5000	--【能量總數】肯尼亞
	GuildWarSetting[RoomID]["MainObj"][1]		= 0	--榮譽水晶
	GuildWarSetting[RoomID]["MainObj"][2]		= 0	--榮譽水晶
	GuildWarSetting[RoomID]["MainObj"][3]		= 0	--世界奇觀計時器
	GuildWarSetting[RoomID]["MainObj"][4]		= 0	--世界奇觀計時器
	
	local CheckOK = 0
	local GateID = {}
	local Setp = 0
	local CrystalObj = {}
	local CrystalMainObj = {}
	--產生水晶
	--小紅 111264
	--小灰 111261
	--小藍 111258
	--小紅 114335
	--小藍 114336
	for i=1, 6 do 
		if i%2 == 1 then
			CrystalObj[i] = CreateObjByFlag( 114336 , 780288 , i-1 , 1 ) 
		else
			CrystalObj[i] = CreateObjByFlag( 114335 , 780288 , i-1 , 1 ) 
		end
		SetModeEx( CrystalObj[i], EM_SetModeType_Strikback, false )--反擊
		SetModeEx( CrystalObj[i], EM_SetModeType_SearchenemyIgnore, false )--被搜尋
		SetModeEx( CrystalObj[i], EM_SetModeType_Obstruct, true )--阻擋
		SetModeEx( CrystalObj[i], EM_SetModeType_Mark, true )--標記
		SetModeEx( CrystalObj[i], EM_SetModeType_Move, false )--移動
		SetModeEx( CrystalObj[i], EM_SetModeType_Searchenemy, false )--索敵
		SetModeEx( CrystalObj[i], EM_SetModeType_HideName, true )--名稱
		SetModeEx( CrystalObj[i], EM_SetModeType_ShowRoleHead, false )--頭像框
		SetModeEx( CrystalObj[i], EM_SetModeType_Fight , false )--可砍殺攻擊
		SetModeEx( CrystalObj[i], EM_SetModeType_Drag , true )--阻力
		SetModeEx( CrystalObj[i], EM_SetModeType_Gravity, true )--重力
		AddToPartition(CrystalObj[i] , RoomID)
		SetPosByFlag( CrystalObj[i] , 780288, i-1 )
		SetPlot( CrystalObj[i] , "touch" , "Lua_GUILDWAR_StealCrystal" , 25 )
		SetPlot( CrystalObj[i] , "range" , "Lua_GUILDWAR_CrystalRange" , 300 )
	--	Debuglog(2 , "Create CrystalObj = "..i.." and RoomID = "..RoomID)
		--設定水晶相關資料
		WriteRoleValue( CrystalObj[i], EM_RoleValue_PID, i+2 );			--將水晶編號記錄在pid
		local OBJPID = ReadRoleValue(CrystalObj[i], EM_RoleValue_PID)
		local pX = ReadRoleValueFloat(CrystalObj[i],EM_RoleValue_X)
		local pY = ReadRoleValueFloat(CrystalObj[i],EM_RoleValue_Y)
		local pZ = ReadRoleValueFloat(CrystalObj[i],EM_RoleValue_Z)
		local pName = "GUILDWAR_LANDMARK_NAME_" ..OBJPID
		--設定水晶擁有陣營
		if i%2 == 1 then
			CrystalOwn[RoomID][i+2]=1
			SetMapMark ( RoomID , i+1 , pX , pY , pZ , pName , 59 )
		--	Debuglog(2 , "RoomID = "..RoomID.." i = "..i.." pX = "..pX.." pY = "..pY.." pZ = "..pZ.." pName = "..pName)
			SetRoleCampID( CrystalObj[i], 7 );	
		else
			CrystalOwn[RoomID][i+2]=2			
			SetMapMark ( RoomID , i+1 , pX , pY , pZ , pName , 58 )
		--	Debuglog(2 , "RoomID = "..RoomID.." i = "..i.." pX = "..pX.." pY = "..pY.." pZ = "..pZ.." pName = "..pName)
			SetRoleCampID( CrystalObj[i], 8 );	
		end
		BeginPlot( CrystalObj[i] , "LuaZone_GUILDWAR_BuildFlag" , 0)
	end
	local DefTower = {}
	for i=1, 8 do 
		if i<5 then
			DefTower[i] = CreateObjByFlag( 102756 , 780005 , i-1 , 1 ) 
		else
			DefTower[i] = CreateObjByFlag( 102756 , 780005 , i-1 , 1 ) 
		end
		WriteRoleValue( DefTower[i], EM_RoleValue_LV , ServerMaxLv )--等級會隨伺服器等級開放的上限而成長
		SetModeEx( DefTower[i], EM_SetModeType_Strikback, false )--反擊
		SetModeEx( DefTower[i], EM_SetModeType_SearchenemyIgnore, false )--被搜尋
		SetModeEx( DefTower[i], EM_SetModeType_Obstruct, false )--阻擋
		SetModeEx( DefTower[i], EM_SetModeType_Mark, true )--標記
		SetModeEx( DefTower[i], EM_SetModeType_Move, true )--移動
		SetModeEx( DefTower[i], EM_SetModeType_Searchenemy, false )--索敵
		SetModeEx( DefTower[i], EM_SetModeType_HideName, true )--名稱
		SetModeEx( DefTower[i], EM_SetModeType_ShowRoleHead, true )--頭像框
		SetModeEx( DefTower[i], EM_SetModeType_Fight , true )--可砍殺攻擊
		SetModeEx( DefTower[i], EM_SetModeType_Drag , false  )--阻力
		AddToPartition(DefTower[i] , RoomID)
	--	SetPosByFlag( DefTower[i] , 780005, i-1 )
		--設定防禦箭塔相關資料
		if i<5 then
			SetRoleCampID( DefTower[i], 8 );	
		else
			SetRoleCampID( DefTower[i], 7 );	
		end
	end
 --	//收尋房間內某個企劃群組的物件
	--	int		SetSearchAllNPC_ByGroupID( int RoomID , int GroupID );
	--	//物件的參考點上建物件
	--	int		CreateObj_ByObjPoint	( int GItemID , int ObjID , const char* Point );
		--產生主堡水晶
	local CastleCampID = {}
	local Obj
	local Count = SetSearchAllNPC_ByGroupID(RoomID,1)	--搜尋企劃群組npc
--	Debuglog(2 , "@@@@@@@@Count = "..Count)
	if Count ~= 0 then
		for i = 1 , Count , 1 do
			local ID = GetSearchResult()
			Obj = Role:New( ID )
			local CampID = GetRoleCampID(ID)
			-- 2013.10.24 阿浩:修正6.0.3後新增的城堡外觀，在公會城戰開始後，攻擊塔、水晶點與發石台建築點不會出現的問題
			-- 公會城主堡(城堡)
			local Main_Building = {
						111415 ,	-- 一階
						114038 ,	-- 二階
						115908 ,	-- 三階
						120877 ,	-- 商城外觀1
						121240 ,	-- 商城外觀2
						121245 ,	-- 商城外觀3
						121250 ,	-- 商城外觀4
						122262 ,	-- 商城外觀5
						122267 ,	-- 商城外觀6
						122272	-- 商城外觀7
								}
			--公會城城砦(城牆)
			local Fortification = {
						111414 ,	-- 一階
						114215 ,	-- 二階
						115909 ,	-- 三階
						120876 ,	-- 商城外觀1
						121239 ,	-- 商城外觀2
						121244 ,	-- 商城外觀3
						121249 ,	-- 商城外觀4
						122261 ,	-- 商城外觀5
						122266 ,	-- 商城外觀6
						122271	-- 商城外觀7
								}

			for GUID = 1 , #Main_Building , 1 do
				if ReadRoleValue( ID , EM_RoleValue_OrgID ) == Main_Building[GUID] then
					if CampID == 7 then
						CastleCampID[1] = ID	--藍隊主堡
					elseif  CampID == 8 then
						CastleCampID[2] = ID	--紅隊主堡
					end
				end
			end

			for GUID = 1 , #Fortification , 1 do
				if ReadRoleValue( ID , EM_RoleValue_OrgID ) == Fortification[GUID] then
					if CampID == 7 then
						CastleCampID[3] = ID	--藍隊城寨
					elseif  CampID == 8 then
						CastleCampID[4] = ID	--紅隊城寨
					end
				end
			end
		end	
	end
	local AttackTower = {}
	local HideObj = {}
	for i=1, 2 do 
		local BarBette = {}
		if i%2 == 1 then
			AttackTower[i] = CreateObj_ByObjPoint( CastleCampID[1] , 103316 , "flag_01")	--攻擊塔
			HideObj[i] = CreateObj_ByObjPoint( CastleCampID[1] , 113693 , "flag_01")	--隱藏物件
			CrystalMainObj[i] = CreateObj_ByObjPoint( CastleCampID[1] , 113697 , "flag_01")	--水晶
			BarBette[1] = CreateObj_ByObjPoint( CastleCampID[3] , 113695 , "barbette_1")	--發石台建築點1
			BarBette[2] = CreateObj_ByObjPoint( CastleCampID[3] , 113695 , "barbette_2")	--發石台建築點2
			BarBette[3] = CreateObj_ByObjPoint( CastleCampID[3] , 113695 , "barbette_3")	--發石台建築點3
			BarBette[4] = CreateObj_ByObjPoint( CastleCampID[3] , 113695 , "barbette_4")	--發石台建築點4
		else
			AttackTower[i] = CreateObj_ByObjPoint( CastleCampID[2] , 103315 , "flag_01")	--攻擊塔
			HideObj[i] = CreateObj_ByObjPoint( CastleCampID[1] , 113693 , "flag_01")	--隱藏物件
			CrystalMainObj[i] = CreateObj_ByObjPoint( CastleCampID[2] , 113696 , "flag_01")	--水晶
			BarBette[1] = CreateObj_ByObjPoint( CastleCampID[4] , 113695 , "barbette_1")	--發石台建築點1
			BarBette[2] = CreateObj_ByObjPoint( CastleCampID[4] , 113695 , "barbette_2")	--發石台建築點2
			BarBette[3] = CreateObj_ByObjPoint( CastleCampID[4] , 113695 , "barbette_3")	--發石台建築點3
			BarBette[4] = CreateObj_ByObjPoint( CastleCampID[4] , 113695 , "barbette_4")	--發石台建築點4
		end

		SetModeEx( CrystalMainObj[i], EM_SetModeType_Strikback, false )--反擊
		SetModeEx( CrystalMainObj[i], EM_SetModeType_SearchenemyIgnore, false )--被搜尋
		SetModeEx( CrystalMainObj[i], EM_SetModeType_Obstruct, true )--阻擋
		SetModeEx( CrystalMainObj[i], EM_SetModeType_Mark, true )--標記
		SetModeEx( CrystalMainObj[i], EM_SetModeType_Move, false )--移動
		SetModeEx( CrystalMainObj[i], EM_SetModeType_Searchenemy, false )--索敵
		SetModeEx( CrystalMainObj[i], EM_SetModeType_HideName, true )--名稱
		SetModeEx( CrystalMainObj[i], EM_SetModeType_ShowRoleHead, false )--頭像框
		SetModeEx( CrystalMainObj[i], EM_SetModeType_Fight , false )--可砍殺攻擊
		SetModeEx( CrystalMainObj[i], EM_SetModeType_Drag , true )--阻力
		SetModeEx( CrystalMainObj[i], EM_SetModeType_Show, true )--顯示
		AddToPartition(CrystalMainObj[i] , RoomID)
		WriteRoleValue( AttackTower[i], EM_RoleValue_LV , ServerMaxLv )--等級會隨伺服器等級開放的上限而成長
		SetModeEx( AttackTower[i], EM_SetModeType_Strikback, true )--反擊
		SetModeEx( AttackTower[i], EM_SetModeType_SearchenemyIgnore, false )--被搜尋
		SetModeEx( AttackTower[i], EM_SetModeType_Obstruct, true )--阻擋
		SetModeEx( AttackTower[i], EM_SetModeType_Mark, true )--標記
		SetModeEx( AttackTower[i], EM_SetModeType_Move, false )--移動
		SetModeEx( AttackTower[i], EM_SetModeType_Searchenemy, true )--索敵
		SetModeEx( AttackTower[i], EM_SetModeType_HideName, true )--名稱
		SetModeEx( AttackTower[i], EM_SetModeType_ShowRoleHead, true )--頭像框
		SetModeEx( AttackTower[i], EM_SetModeType_Fight , true )--可砍殺攻擊
		SetModeEx( AttackTower[i], EM_SetModeType_Drag , true )--阻力
		SetModeEx( AttackTower[i], EM_SetModeType_Show, true )--顯示
		AddToPartition(AttackTower[i] , RoomID)
		SetModeEx( HideObj[i], EM_SetModeType_Strikback, false )--反擊
		SetModeEx( HideObj[i], EM_SetModeType_SearchenemyIgnore, false )--被搜尋
		SetModeEx( HideObj[i], EM_SetModeType_Obstruct, false )--阻擋
		SetModeEx( HideObj[i], EM_SetModeType_Mark, false )--標記
		SetModeEx( HideObj[i], EM_SetModeType_Move, false )--移動
		SetModeEx( HideObj[i], EM_SetModeType_Searchenemy, false )--索敵
		SetModeEx( HideObj[i] , EM_SetModeType_NotShowHPMP, true )--不顯示血條
		SetModeEx( HideObj[i], EM_SetModeType_HideName, true )--名稱
		SetModeEx( HideObj[i], EM_SetModeType_ShowRoleHead, false )--頭像框
		SetModeEx( HideObj[i], EM_SetModeType_Fight , false )--可砍殺攻擊
		SetModeEx( HideObj[i], EM_SetModeType_Drag , false )--阻力
		SetModeEx( HideObj[i], EM_SetModeType_Show, false )--顯示
		AddToPartition(HideObj[i] , RoomID)
		AddBuff( CrystalMainObj[i] ,502707 ,1 ,-1 ); --非戰鬥中不回血的buff (ownerID,buff,LV,Time)
		WriteRoleValue( CrystalMainObj[i], EM_RoleValue_PID, i );			--將水晶編號記錄在pid
		WriteRoleValue( HideObj[i], EM_RoleValue_PID, i );			--將水晶編號記錄在pid
		WriteRoleValue(CrystalMainObj[i], EM_RoleValue_Register9,i )
		SetPlot( CrystalMainObj[i] , "touch" , "Lua_GUILDWAR_StealMainCrystal" , 50 )
		SetPlot( HideObj[i] , "range" , "Lua_GUILDWAR_MainCrystalRange" , 300 )
		GuildWarSetting[RoomID]["MainObj"][i] = CrystalMainObj[i]
		--設定水晶擁有陣營
		local pX = ReadRoleValueFloat(CrystalMainObj[i],EM_RoleValue_X)
		local pY = ReadRoleValueFloat(CrystalMainObj[i],EM_RoleValue_Y)
		local pZ = ReadRoleValueFloat(CrystalMainObj[i],EM_RoleValue_Z)
		local pName =	"SC_YU_GUILDWAR_BUILD_50"
	--	Debuglog(2 , "Create CrystalMainObj = "..i.." and RoomID = "..RoomID)
		--設定水晶擁有陣營
		if i%2 == 1 then
			for j = 1 , table.getn(BarBette) do
				AddToPartition(BarBette[j] , RoomID)
			--	Debuglog(2 , "Create BarBette = "..j.." and RoomID = "..RoomID.." ID = "..BarBette[j])
				SetRoleCampID( BarBette[j], 7 );
			end
			CrystalOwn[RoomID][1]=1
			SetMapMark ( RoomID , 0 , pX , pY , pZ , pName , 59 )
			SetRoleCampID( CrystalMainObj[i], 7 );
			SetRoleCampID( AttackTower[i], 7 );
		--	Debuglog(2 , "Create AttackTower = "..i.." and RoomID = "..RoomID.." ID = "..AttackTower[i])
		else
			for j = 1 , table.getn(BarBette) do
				AddToPartition(BarBette[j] , RoomID)
		--		Debuglog(2 , "Create BarBette = "..j.." and RoomID = "..RoomID.." ID = "..BarBette[j])
				SetRoleCampID( BarBette[j], 8 );
			end
			CrystalOwn[RoomID][2]=2
			SetMapMark ( RoomID , 1 , pX , pY , pZ , pName , 58 )
			SetRoleCampID( CrystalMainObj[i], 8 );
			SetRoleCampID( AttackTower[i], 8 );
		--	Debuglog(2 , "Create AttackTower = "..i.." and RoomID = "..RoomID.." ID = "..AttackTower[i])
		end
	end

	-- 2013.07.11 YoYo：新增寵物阻擋線相關功能，防止寵物穿牆打人。
	local BlockLineFlag = 780234	--寵物阻擋線專用的旗標
	--阻擋線旗標副編號對應位置如下：
	--外城牆
	--       藍隊                            紅隊
	--[7]-[9]-[8]-[4]           [17]-[19][18]-[14]
	--[6]             [3]	          [16]                [13]
	--[5]             [2]	          [15]                [12]
	--[1]----------[0]	          [11]------------[10]
	--內城牆
	--   藍隊          紅隊
	--[35]-[37]    [40]-[38]
	--[34]-[36]    [41]-[39]
	
	local BPX = {}	--旗標X座標Table
	local BPY = {}	--旗標Y座標Table
	local BPZ = {}	--旗標Z座標Table
	local BPDir = {}	--旗標角度Table
	
	for I = 0 , 41 do	--副編號目前至41號
		BPX[ I ] , BPY[ I ] , BPZ[ I ] , BPDir[ I ] = DW_Location( BlockLineFlag , I ) --取得阻擋線旗標的座標與面向
	end
	AddLineBlock( RoomID , 100 , BPX[ 0 ] , BPZ[ 0 ] , BPX[ 1 ] , BPZ[ 1 ] )	--新增阻擋線：藍隊 - 後牆
	AddLineBlock( RoomID , 101 , BPX[ 0 ] , BPZ[ 0 ] , BPX[ 2 ] , BPZ[ 2 ] )	--新增阻擋線：藍隊 - 右後牆 (布魯克)
	AddLineBlock( RoomID , 102 , BPX[ 3 ] , BPZ[ 3 ] , BPX[ 4 ] , BPZ[ 4 ] )	--新增阻擋線：藍隊 - 右前牆 (布魯克)
	AddLineBlock( RoomID , 103 , BPX[ 1 ] , BPZ[ 1 ] , BPX[ 5 ] , BPZ[ 5 ] )	--新增阻擋線：藍隊 - 左後牆 (愛薩奇)
	AddLineBlock( RoomID , 104 , BPX[ 6 ] , BPZ[ 6 ] , BPX[ 7 ] , BPZ[ 7 ] )	--新增阻擋線：藍隊 - 左前牆 (愛薩奇)
	AddLineBlock( RoomID , 105 , BPX[ 4 ] , BPZ[ 4 ] , BPX[ 8 ] , BPZ[ 8 ] )	--新增阻擋線：藍隊 - 前右牆
	AddLineBlock( RoomID , 106 , BPX[ 7 ] , BPZ[ 7 ] , BPX[ 9 ] , BPZ[ 9 ] )	--新增阻擋線：藍隊 - 前左牆
	
	AddLineBlock( RoomID , 200 , BPX[ 10 ] , BPZ[ 10 ] , BPX[ 11 ] , BPZ[ 11 ] )	--新增阻擋線：紅隊 - 後牆
	AddLineBlock( RoomID , 201 , BPX[ 10 ] , BPZ[ 10 ] , BPX[ 12 ] , BPZ[ 12 ] )	--新增阻擋線：紅隊 - 右後牆 (貝里尼)
	AddLineBlock( RoomID , 202 , BPX[ 13 ] , BPZ[ 13 ] , BPX[ 14 ] , BPZ[ 14 ] )	--新增阻擋線：紅隊 - 右前牆 (貝里尼)
	AddLineBlock( RoomID , 203 , BPX[ 11 ] , BPZ[ 11 ] , BPX[ 15 ] , BPZ[ 15 ] )	--新增阻擋線：紅隊 - 左後牆 (阿納德)
	AddLineBlock( RoomID , 204 , BPX[ 16 ] , BPZ[ 16 ] , BPX[ 17 ] , BPZ[ 17 ] )	--新增阻擋線：紅隊 - 左前牆 (阿納德)
	AddLineBlock( RoomID , 205 , BPX[ 14 ] , BPZ[ 14 ] , BPX[ 18 ] , BPZ[ 18 ] )	--新增阻擋線：紅隊 - 前右牆
	AddLineBlock( RoomID , 206 , BPX[ 17 ] , BPZ[ 17 ] , BPX[ 19 ] , BPZ[ 19 ] )	--新增阻擋線：紅隊 - 前左牆
	
	AddLineBlock( RoomID , 110 , BPX[ 34 ] , BPZ[ 34 ] , BPX[ 35 ] , BPZ[ 35 ] )	--新增阻擋線：藍隊 - 內門後牆
	AddLineBlock( RoomID , 111 , BPX[ 34 ] , BPZ[ 34 ] , BPX[ 36 ] , BPZ[ 36 ] )	--新增阻擋線：藍隊 - 內門右牆 (布魯克)
	AddLineBlock( RoomID , 112 , BPX[ 35 ] , BPZ[ 35 ] , BPX[ 37 ] , BPZ[ 37 ] )	--新增阻擋線：藍隊 - 內門左牆 (愛薩奇)
	AddLineBlock( RoomID , 113 , BPX[ 36 ] , BPZ[ 36 ] , BPX[ 37 ] , BPZ[ 37 ] )	--新增阻擋線：藍隊 - 內門前牆
	
	AddLineBlock( RoomID , 210 , BPX[ 38 ] , BPZ[ 38 ] , BPX[ 39 ] , BPZ[ 39 ] )	--新增阻擋線：紅隊 - 內門後牆 
	AddLineBlock( RoomID , 211 , BPX[ 38 ] , BPZ[ 38 ] , BPX[ 40 ] , BPZ[ 40 ] )	--新增阻擋線：紅隊 - 內門右牆 (貝里尼)
	AddLineBlock( RoomID , 212 , BPX[ 39 ] , BPZ[ 39 ] , BPX[ 41 ] , BPZ[ 41 ] )	--新增阻擋線：紅隊 - 內門左牆 (阿納德)
	AddLineBlock( RoomID , 213 , BPX[ 40 ] , BPZ[ 40 ] , BPX[ 41 ] , BPZ[ 41 ] )	--新增阻擋線：紅隊 - 內門前牆

--	Debuglog(2 , "ScriptFinish "..AttackTower[1].." Camp = "..GetRoleCampID(AttackTower[1]).." and "..AttackTower[2].." Camp = "..GetRoleCampID(AttackTower[2]))
	--檢查各隊分數
	while 1 do
	--	Debuglog(2 , "inLoop")
--		for i = 1 , 2 do
--			Say(CrystalMainObj[i],"MM MyCamp = "..GetRoleCampID(CrystalMainObj[i]))
--			Say(AttackTower[i],"QQ MyCamp = "..GetRoleCampID(AttackTower[i]))
--		end
		--Debuglog(2 , "%%%%CheckING....")

		--Debuglog(2 , "%%%%CheckING....GuildID = "..GuildID.." CampID = "..CampID)
		if GuildID ~= 0 then
			if CampID == 7 then
				AddGuildWarEnergy( OwnerID() , GuildWarSetting[RoomID]["energy"][2] )
				--Debuglog(2 , "%%%%GETENERY....GuildID = "..GuildID.." CampID = "..CampID)
			elseif  CampID == 8 then
				AddGuildWarEnergy( OwnerID() , GuildWarSetting[RoomID]["energy"][1] )
				--Debuglog(2 , "%%%%GETENERY....GuildID = "..GuildID.." CampID = "..CampID)
			end
		end
		local T1S = GetGuildWarScore_ByID(RoomID,0)
		local T2S = GetGuildWarScore_ByID(RoomID,1)
	--	DebugMsg( 0, RoomID ,"T1S = "..T1S.." T2S = "..T2S)
		Sleep(50)
	end
end

function LuaZone_GUILDWAR_PVPDead( KillerID , DeadID , ZoneID , ParallelZoneID , pRoomID )
--	DeBugMSG(0,ReadRoleValue(KillerID,EM_RoleValue_RoomID),"run LuaZone_GUILDWAR_PVPDead:")
	local KillerTeamID = GetRoleCampID( KillerID );
--	Debuglog(2 , "KillerID = "..KillerID.." DeadID = "..DeadID.." ZoneID = "..ZoneID)
	if( KillerTeamID ~= GetRoleCampID( DeadID ) ) then

		local RoomID = ReadRoleValue( KillerID, EM_RoleValue_RoomID );
		local NearPlayer = SearchRangePlayer(KillerID,200)	--搜尋周圍玩家
		local Score = GuildWarSetting[RoomID]["Kill"][1] 	--【殺人】獲得戰績數量
		local Count = BuffCount ( DeadID)
		local REi = 0
		for i = 0 , Count do
			--檢查是否為軍團長
			if BuffID == 502970 or BuffID == 502971 then--軍團長buff
				Score = GuildWarSetting[RoomID]["Kill"][2] --【殺軍團長】獲得戰績數量
			end
		end
		for j = 0 , table.getn(NearPlayer)-1 do
			if GetRoleCampID( KillerID ) ~= GetRoleCampID( NearPlayer[j] ) then
				--DebugMsg( 0, RoomID ,"PlayerName = "..GetName(NearPlayer[j]).." Not Same CampID.")
				REi = REi + 1
			end
		end
		local RK_Count = math.ceil(Score/(table.getn(NearPlayer)-REi))
	--	DebugMsg( 0, RoomID ,"RK_Count = "..RK_Count.." REi = "..REi)
		for i=0,table.getn(NearPlayer)-1 do
			if GetRoleCampID( KillerID ) == GetRoleCampID( NearPlayer[i] ) then
			---*---以下判斷玩家是否有學習技術
				local SetA = -1
				local Count = BuffCount ( NearPlayer[i])
				for j = 0 , Count do
					local BuffID = BuffInfo ( NearPlayer[i] , j , EM_BuffInfoType_BuffID ) -- 基本法術ID
					if BuffID == 505317 then--榮譽意志：戰績獲得量加強
						local BuffLv = BuffInfo ( NearPlayer[i] , j , EM_BuffInfoType_Power )--該建築第 j 個BUFF的等級
						SetA = BuffLv
					end
				end
				if SetA>-1 then -- 表示有修煉此技能
					RK_Count = RK_Count+(SetA+1)
				end
				--DebugMsg( 0, RoomID ,"PlayerName = "..GetName(NearPlayer[i]).." Get "..RK_Count.." Score.")
				AddGuildWarPlayerValue( NearPlayer[i] ,4 , RK_Count )
				GiveBodyItem( NearPlayer[i] , 206685 , RK_Count )
				if	NearPlayer[i]~=KillerID	then
					AddGuildWarPlayerValue( NearPlayer[i], 0 , 1 );
				end
			end
		end
	end
end

function LuaZone_GUILDWAR_Revive()
	local	RoomID	= ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );

	-- 區域重生劇情
	local 	TeamID	= GetRoleCampID( OwnerID() )
	local	X	= 0;
	local	Y	= 0;
	local	Z	= 0;
	local	Dir	= 0;

	if( TeamID == 7 ) then	
		X 	= 3758
		Y	= 2150
		Z 	= -19.7
		Dir	= 180
	else		
		X 	= -3758.4
		Y	= 2150
		Z 	= 20.1
		Dir	= 0
	end
	WriteRoleValue( OwnerID(), EM_RoleValue_X, X );
	WriteRoleValue( OwnerID(), EM_RoleValue_Y, Y );
	WriteRoleValue( OwnerID(), EM_RoleValue_Z, Z );
	WriteRoleValue( OwnerID(), EM_RoleValue_Dir, Dir );
	Lua_PVPAllFull( OwnerID())		--補滿狀態
	AddBuff(OwnerID(), 500667, 0 , 10)	--玩家重生無敵10秒
end

--給所有此zone的同陣營玩家施放BuffID 持續時間BuffTime
function Lua_GUILDWAR_ShareBuff(BuffID , BuffTime , Select )
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local CampID = GetRoleCampID( OwnerID() )	-- 取得物件的陣營
	local Obj
	local Count = SetSearchAllPlayer(RoomID)
-- 2011.11.21 應廠商要求，複數同建築Buff不可堆疊，取決於該建築最高等級 --
	local BuildingGuildID = ReadRoleValue( OwnerID() , EM_RoleValue_GuildID )
	if Select == nil then
		Select = 0
	end
--
	if Count ~= 0 then
		for i = 1 , Count , 1 do
			local ID = GetSearchResult()
			Obj = Role:New( ID )
		--	if Obj:IsPlayer() == true then
				if GetRoleCampID( ID ) == CampID then
				--	CallPlot( ID , "Lua_GuildWar_Recall_BuildLv" , BuffID )
					AddBuff( ID , BuffID , 0 , BuffTime )
				--	DebugMsg( 0, RoomID ,"AddBuff = "..BuffID.." BuffTime = "..BuffTime)
				end
		--	end
		end	
		if Select == 1 then
			Z402_AreaBuff[RoomID][BuildingGuildID][BuffID] = Z402_AreaBuff[RoomID][BuildingGuildID][BuffID] + 1 -- 由 701636 宣告的全域變數
		end
	end
end

---------------------------------------------------------------------------
Function LuaI_206770(Option)
	local PlayerID = OwnerID()
	local PackageID = 206770
	local NeedSpace = 4
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , 206772 , 1 ) --特級裝備禮盒
		GiveBodyItem( PlayerID , 206774 , 1 ) --公會貢獻包(大)
		GiveBodyItem( PlayerID , 203065 , 1 ) --1000點技能球

		-- 5.0.2 新增公會boss家具材料 ------------
		GiveBodyItem( PlayerID , 205690 , 3 ) --  榮耀徽章 x3
		-----------------------------------------

		GiveBodyItem( PlayerID , 203276 , 1 ) --1萬點經驗球
	end
end
Function LuaI_206771(Option)
	local PlayerID = OwnerID()
	local PackageID = 206771
	local NeedSpace = 3
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , 206773 , 1 ) --高級裝備禮盒
		GiveBodyItem( PlayerID , 206775 , 1 ) --公會貢獻包(小)

		-- 5.0.2 新增公會boss家具材料 ------------
		GiveBodyItem( PlayerID , 205690 , 1 ) --  榮耀徽章 x1
		-----------------------------------------

		GiveBodyItem( PlayerID , 203064 , 1 ) --100點技能球
	end
end
Function LuaI_206772(Option)
	local PlayerID = OwnerID()
	local PackageID = 206772
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		local PlayerLv = ReadRoleValue( PlayerID , EM_RoleValue_LV )
		local LvTable = { 55 ,  57 , 60 , 62 , 65 , 67 , 70 , 72 , 75 , 77 , 80 , 82 , 85 , 87 , 90 , 92 , 95 , 97 , 100 }
		local EqTable = { 724913 ,  725219 , 726679 , 726680 , 726681 , 726682 , 726683 , 726684 , 726685 , 726686 , 726687 , 726688 , 726689 , 726690 , 726691 , 726692 , 726693 , 726694 , 726695 }
		for I = 1 , #LvTable do
			if PlayerLv <= LvTable[ I ] then
				GiveBodyItem( PlayerID , EqTable[ I ] , 1 ) --給予對應等級的隨機藍裝
				return
			end
		end
	end
end
Function LuaI_206773(Option)
	local PlayerID = OwnerID()
	local PackageID = 206773
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		local PlayerLv = ReadRoleValue( PlayerID , EM_RoleValue_LV )
		local LvTable = { 55 ,  57 , 60 , 62 , 65 , 67 , 70 , 72 , 75 , 77 , 80 , 82 , 85 , 87 , 90 , 92 , 95 , 97 , 100 }
		local EqTable = { 726660 ,  726661 , 726662 , 726663 , 726664 , 726665 , 726666 , 726667 , 726668 , 726669 , 726670 , 726671 , 726672 , 726673 , 726674 , 726675 , 726676 , 726677 , 726678 }
		for I = 1 , #LvTable do
			if PlayerLv <= LvTable[ I ] then
				GiveBodyItem( PlayerID , EqTable[ I ] , 1 ) --給予對應等級的隨機綠裝
				return
			end
		end
	end
end
Function LuaI_206774(Option)
	local PlayerID = OwnerID()
	local PackageID = 206774
	local NeedSpace = 3
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , 202916 , 1 ) --魔物精華
		GiveBodyItem( PlayerID , 202917 , 1 ) --王者核心
		GiveBodyItem( PlayerID , 725113 , 1 ) --隨機材料
	end
end
Function LuaI_206775(Option)
	local PlayerID = OwnerID()
	local PackageID = 206775
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , 725113 , 1 ) --隨機材料
	end
end
function Lua_GUILDWAR_BuildDScript_0()	--500火

	SetModeEx(OwnerID(), EM_SetModeType_Fight , false )--可砍殺攻擊
	local ObjID 	= CreateObjByObj( 114740 , OwnerID() , 1);
	BeginPlot(ObjID ,"Lua_GUILDWAR_BuildDScript_3",0)
	-- 2013.06.28 阿浩：新增死亡時，掃描固定範圍內指定物件，將指定物件拉至地面
	CallPlot( ObjID  , "Hao_GuildWar_Build_Dead_Plot" , 60 )
	--
	Sleep(30)
	DelObj(OwnerID())
end
function Lua_GUILDWAR_BuildDScript_1()	--700火

	SetModeEx(OwnerID(), EM_SetModeType_Fight , false )--可砍殺攻擊
	local ObjID 	= CreateObjByObj( 114741 , OwnerID() , 1);
	BeginPlot(ObjID ,"Lua_GUILDWAR_BuildDScript_3",0)
	-- 2013.06.28 阿浩：新增死亡時，掃描固定範圍內指定物件，將指定物件拉至地面	
	CallPlot( ObjID , "Hao_GuildWar_Build_Dead_Plot" , 120 )
	--
	Sleep(30)
	DelObj(OwnerID())
end
function Lua_GUILDWAR_BuildDScript_2()	--1000火

	SetModeEx(OwnerID(), EM_SetModeType_Fight , false )--可砍殺攻擊
	local ObjID 	= CreateObjByObj( 113698 , OwnerID() , 1);
	BeginPlot(ObjID ,"Lua_GUILDWAR_BuildDScript_3",0)
	-- 2013.06.28 阿浩：新增死亡時，掃描固定範圍內指定物件，將指定物件拉至地面	
	CallPlot( ObjID , "Hao_GuildWar_Build_Dead_Plot" , 120 )
	--
	Sleep(30)
	DelObj(OwnerID())
end
function Lua_GUILDWAR_BuildDScript_3()
	Sleep(35)
	DelObj(OwnerID())
end
function Lua_GUILDWAR_Monster20()
	AddBuff( OwnerID() , 505513 , 79, -1 )	--80%--攻擊NPC傷害減弱 法術等級 0 = 1%
	SetRandMove(OwnerID(),70, 30, 50 )	--兔子亂數範圍內移動  (150=範圍, 100=10秒 , 20=每次移動距離)
	SetPlot( OwnerID() , "dead" , "Lua_GUILDWAR_MonsterDead20" , 0 )
end
function Lua_GUILDWAR_MonsterDead20()
	local	RoomID	= ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local	PlayerCampID	= GetRoleCampID( TargetID() );
	local 	OrgID 		= ReadRoleValue( OwnerID(), EM_RoleValue_OrgID );
	local	Score		= 20
	local NearPlayer = SearchRangePlayer(TargetID(),200)	--搜尋周圍玩家
	local PeopleCount =  table.getn(NearPlayer)
	for i = 0 , table.getn(NearPlayer)-1 do
		if GetRoleCampID( TargetID() ) ~= GetRoleCampID( NearPlayer[i] ) then
		--	DebugMsg( 0, RoomID ,"PlayerName = "..GetName(NearPlayer[i]).." Not Same CampID.")
			PeopleCount = PeopleCount - 1
		end
	end
	Score = math.ceil(Score/PeopleCount)
	--	DebugMsg( 0, RoomID ,"PeopleCount = "..PeopleCount.." Same Camp.")
	for i=0,table.getn(NearPlayer)-1 do
		if GetRoleCampID( TargetID() ) == GetRoleCampID( NearPlayer[i] ) then
		---*---以下判斷玩家是否有學習技術
			local SetA = -1
			local Count = BuffCount ( NearPlayer[i])
			for j = 0 , Count do
				local BuffID = BuffInfo ( NearPlayer[i] , j , EM_BuffInfoType_BuffID ) -- 基本法術ID
				if BuffID == 505317 then--榮譽意志：戰績獲得量加強
					local BuffLv = BuffInfo ( NearPlayer[i] , j , EM_BuffInfoType_Power )--該建築第 j 個BUFF的等級
					SetA = BuffLv
				end
			end
			if SetA>-1 then -- 表示有修煉此技能
				Score = Score+(SetA+1)
			end
		--	DebugMsg( 0, RoomID ,"PlayerName = "..GetName(NearPlayer[i]).." Get "..Score.." Score.")
			AddGuildWarPlayerValue( NearPlayer[i] ,4 , Score )
			GiveBodyItem( NearPlayer[i] , 206685 , Score )
		end
	end
	return true
end
function Lua_GUILDWAR_Monster5()
	AddBuff( OwnerID() , 505513 , 89, -1 )	--90%--攻擊NPC傷害減弱 法術等級 0 = 1%
	SetRandMove(OwnerID(),70, 30, 50 )	--兔子亂數範圍內移動  (150=範圍, 100=10秒 , 20=每次移動距離)
	SetPlot( OwnerID() , "dead" , "Lua_GUILDWAR_MonsterDead5" , 0 )
end
function Lua_GUILDWAR_MonsterDead5()
	local	RoomID	= ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local	PlayerCampID	= GetRoleCampID( TargetID() );
	local 	OrgID 		= ReadRoleValue( OwnerID(), EM_RoleValue_OrgID );
	local	Score		= 5
	local NearPlayer = SearchRangePlayer(TargetID(),200)	--搜尋周圍玩家
	local PeopleCount =  table.getn(NearPlayer)
	for i = 0 , table.getn(NearPlayer)-1 do
		if GetRoleCampID( TargetID() ) ~= GetRoleCampID( NearPlayer[i] ) then
		--	DebugMsg( 0, RoomID ,"PlayerName = "..GetName(NearPlayer[i]).." Not Same CampID.")
			PeopleCount = PeopleCount - 1
		end
	end
	Score = math.ceil(Score/PeopleCount)
--	DebugMsg( 0, RoomID ,"PeopleCount = "..PeopleCount.." Same Camp.")
	for i=0,table.getn(NearPlayer)-1 do
		if GetRoleCampID( TargetID() ) == GetRoleCampID( NearPlayer[i] ) then
		---*---以下判斷玩家是否有學習技術
			local SetA = -1
			local Count = BuffCount ( NearPlayer[i])
			for j = 0 , Count do
				local BuffID = BuffInfo ( NearPlayer[i] , j , EM_BuffInfoType_BuffID ) -- 基本法術ID
				if BuffID == 505317 then--榮譽意志：戰績獲得量加強
					local BuffLv = BuffInfo ( NearPlayer[i] , j , EM_BuffInfoType_Power )--該建築第 j 個BUFF的等級
					SetA = BuffLv
				end
			end
			if SetA>-1 then -- 表示有修煉此技能
				Score = Score+(SetA+1)
			end
		--	DebugMsg( 0, RoomID ,"PlayerName = "..GetName(NearPlayer[i]).." Get "..Score.." Score.")
			AddGuildWarPlayerValue( NearPlayer[i] ,4 , Score )
			GiveBodyItem( NearPlayer[i] , 206685 , Score )
		end
	end
	return true
end
function Lua_GUILDWAR_EnterScript()
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local CampID = GetRoleCampID( OwnerID() );
	local Obj
	local Count = SetSearchAllPlayer(RoomID)
	local T1 = 0
	local T2 = 0
	local GuildID1 = 0
	local GuildID2 = 0
	if CampID == 7 then
		SetBattleGroundObjGUIDForceFlag(OwnerID(),223090)	--背後背旗
	else
		SetBattleGroundObjGUIDForceFlag(OwnerID(),223091)	--背後背旗
	end
	if Count ~= 0 then
		for i = 1 , Count , 1 do
			local ID = GetSearchResult()
			Obj = Role:New( ID )
			if Obj:IsPlayer() == true then
				if GetRoleCampID( ID ) == 7 then
					GuildID1 = ReadRoleValue(ID,EM_RoleValue_GuildID)
				--	DebugMsg( 0, RoomID ,"GuildID1 = "..GuildID1)
					T1 = T1 + 1
				elseif GetRoleCampID( ID ) == 8 then
					GuildID2 = ReadRoleValue(ID,EM_RoleValue_GuildID)
				--	DebugMsg( 0, RoomID ,"GuildID2 = "..GuildID2)
					T2 = T2 + 1
				end
			end
		end	
	end
	SetFlag( OwnerID()  , 543769 , 0 )--玩家在載具上之旗標
	WriteRoleValue( OwnerID() , EM_RoleValue_PID ,0)
	WriteRoleValue( OwnerID() , EM_RoleValue_Register1, 0 )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register2, 0 )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register3, 0 )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register4, 0 )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register5, 0 )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register6, 0 )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register7, 0 )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register8, 0 )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register9, 0 )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register10, 0 )
	CancelBuff_NoEvent(OwnerID(),502941)	--清除現行犯buff
	CancelBuff( OwnerID() , 502931 )
	CancelBuff( OwnerID() , 502932 )
	CancelBuff( OwnerID() , 502933 )
--	Debuglog(2 , "#####$$$$$GUILDID....T1 = "..T1.." T2 = "..T2)
--	DebugMsg( 0, RoomID ,"T1 = "..T1.." T2 = "..T2)
	if T1 > 0 and T2 > 0 and GuildID1 ~= 0 and GuildID2 ~= 0 then
		WriteRoleValue(GuildWarSetting[RoomID]["MainObj"][1] , EM_RoleValue_GuildID,GuildID1)
		WriteRoleValue(GuildWarSetting[RoomID]["MainObj"][2] , EM_RoleValue_GuildID,GuildID2)
	--	Debuglog(2 , "#####$$$$$GUILDID....T1 = "..T1.." T2 = "..T2)
	--	DebugMsg( 0, RoomID ,"T1 = "..T1.." T2 = "..T2)
	end
	--2011.11.24 玩家進入公會城戰時，依照"當前"冶煉廠、農田、伐木廠所升級的科技，直接給予玩家相對應的科技 Lv。
	CallPlot( OwnerID() , "Lua_GuildWar_Recall_BuildLv" , 0 , 1 )
	--Lua_GuildWar_Recall_BuildLv( 0 , 1 )
	--
end
function Lua_GUILDWAR_WinnerClock()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID );
	local GuildID = ReadRoleValue(OwnerID(),EM_RoleValue_GuildID)
	local	ObjCampID	= GetRoleCampID( OwnerID() );
	local	LandMarkID	= ReadRoleValue( OwnerID(), EM_RoleValue_PID );
	local BB = CreateObj(100292,3117,1681,0,268,1)
	SetModeEx( BB, EM_SetModeType_Strikback, false )--反擊
	SetModeEx( BB, EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( BB, EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( BB, EM_SetModeType_Mark, false )--標記
	SetModeEx( BB, EM_SetModeType_Move, false )--移動
	SetModeEx( BB , EM_SetModeType_NotShowHPMP, true )--不顯示血條
	SetModeEx( BB, EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( BB, EM_SetModeType_HideName, true )--名稱
	SetModeEx( BB, EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( BB, EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( BB, EM_SetModeType_Show, false )--顯示
	SetModeEx( BB, EM_SetModeType_Drag , false )--阻力
	AddToPartition( BB , RoomID)
	SetRoleCampID( BB, ObjCampID );
	WriteRoleValue(BB, EM_RoleValue_GuildID,GuildID)
	local EnemyGuildName
	local GuildName
	local PlayerName
	local FullKey
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
	if( ObjCampID == 8 ) then 
		EnemyGuildName =  "|cffff3232"..GetGuildName_ByID( RoomID , ((CrystalOwn[RoomID][LandMarkID]+1)%2+1)%2 ).."|r"
		local orgid = ReadRoleValue( OwnerID(),EM_RoleValue_OrgID)
		PlayerName 	= "|cffff3232".."["..orgid.."]".."|r"
		GuildName  =  "|cff00ffff"..GetGuildName_ByID( RoomID , CrystalOwn[RoomID][LandMarkID]-1 ).."|r"
		FullKey 		= "[SC_YU_GUILDWAR_BUILD_78]" .. "[$SETVAR1="..EnemyGuildName.."][$SETVAR2="..PlayerName.."][$SETVAR3=" .. GuildName .. "]"
		GuildWarSetting[RoomID]["MainObj"][3] = BB
		if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
			RunningMsg( OwnerID() , 3 , FullKey) --被佔領
		end
	else
		EnemyGuildName =  "|cff00ffff"..GetGuildName_ByID( RoomID , ((CrystalOwn[RoomID][LandMarkID]+1)%2+1)%2 ).."|r"
		local orgid = ReadRoleValue( OwnerID(),EM_RoleValue_OrgID)
		PlayerName 	= "|cff00ffff".."["..orgid.."]".."|r"
		GuildName  =  "|cffff3232"..GetGuildName_ByID( RoomID , CrystalOwn[RoomID][LandMarkID]-1 ).."|r"
		FullKey 		= "[SC_YU_GUILDWAR_BUILD_78]" .. "[$SETVAR1="..EnemyGuildName.."][$SETVAR2="..PlayerName.."][$SETVAR3=" .. GuildName .. "]"
		GuildWarSetting[RoomID]["MainObj"][4] = BB
		if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
			RunningMsg( OwnerID() , 3 , FullKey) --被佔領
		end
	end
	BeginPlot( BB , "Lua_GUILDWAR_WinnerClockCount" , 0)	--啟動世界奇觀
end
function Lua_GUILDWAR_WinnerClockCount()
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local Obj
	local Count = SetSearchAllPlayer(RoomID)
	local ObjCampID = GetRoleCampID( OwnerID() );
	local TimeC = 0
	local WinnerState = 0
	local Enemy = 7
	if ObjCampID == 7 then
		Enemy = 8
	end
	while 1 do
		local Count = SetSearchAllPlayer(RoomID)
		if TimeC >=300 then
			WinnerState = 1
			break
		end
		if Count ~= 0 then
			for i = 1 , Count , 1 do
				local ID = GetSearchResult()
				Obj = Role:New( ID )
				if Obj:IsPlayer() == true then
					if GetRoleCampID( ID ) == Enemy and TimeC%5 == 0 then
					--	DebugMsg( 0, RoomID ,"!!!!!!SendTime Time = "..TimeC.." ID = "..ID)
						--Say(ID,"GetTimerTime = "..TimeC)
						ClockClose( ID )
						ClockOpen( ID , EM_ClockCheckValue_12  , 300-TimeC , 300-TimeC , 0  ,"Lua_Clockending"  , "Lua_Clockending" );--時間以秒算
					end
				end
			end	
		end
	--	DebugMsg( 0, RoomID ,"!!!!!!Time = "..TimeC)
		TimeC = TimeC + 1
		Sleep(10)
	end
	if WinnerState == 1 then
		AddGuildWarScore(OwnerID(),10000)
	end
end
function Lua_GUILDWAR_WinnerClockStop()
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local Obj
	local Count = SetSearchAllPlayer(RoomID)
	local ObjCampID = GetRoleCampID( OwnerID() );
--	DebugMsg( 0, RoomID ,"!!!!!!ObjCampID = "..ObjCampID)
	if Count ~= 0 then
		for i = 1 , Count , 1 do
			local ID = GetSearchResult()
			Obj = Role:New( ID )
			if Obj:IsPlayer() == true then
				if GetRoleCampID( ID ) == ObjCampID then
				--	DebugMsg( 0, RoomID ,"!!!!!!Stop TimeClock")
					ClockClose( ID )
				end
			end
		end	
	end
end