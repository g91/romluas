-- 儀式峽谷 BOSS3 葛雷森 DOR_TEST  ** 新 手 駕 駛 **

----------------------------------------------------初始清單
--local g_Msg = {}  --台詞清單

local g_Magic = {} 	-- 法術集合清單
--暗咒
g_Magic.DARKCURSE = {}
g_Magic.DARKCURSE.CD = 10
g_Magic.DARKCURSE.DmgID = 491601 --傷害，無動作瞬發

--即死暗咒
g_Magic.DARKEND = {}
g_Magic.DARKEND.DmgID = 491476 --傷害，必殺

-- 冰霧
g_Magic.ICEBLADE = {}
g_Magic.ICEBLADE.CD = 7
g_Magic.ICEBLADE.ActID = 491281 --動作
g_Magic.ICEBLADE.DmgID = 491602 --扇形傷害
g_Magic.ICEBLADE.CG1ID = 491617 --詠唱特效
g_Magic.ICEBLADE.CG2ID = 491624 --透明球出手特效
g_Magic.ICEBLADE.Range = 70 --施放距離

--寒霜凍結
g_Magic.ICEEND = {}
g_Magic.ICEEND.DmgID = 491473 --凍結

-- 火破
g_Magic.FIREBLADE = {}
g_Magic.FIREBLADE.CD = 15
g_Magic.FIREBLADE.ActID = 491281 --動作(與冰霧共用)
g_Magic.FIREBLADE.DmgID = 491603 --傷害
g_Magic.FIREBLADE.CG1ID = 491622 --詠唱特效
g_Magic.FIREBLADE.CG2ID = 491604 --透明球出手特效
g_Magic.FIREBLADE.Delay = 15 --詠唱延遲
g_Magic.FIREBLADE.Range = 100 --施放距離
g_Magic.FIREBLADE.Width = 45
g_Magic.FIREBLADE.Length = 200
g_Magic.FIREBLADE.Height = 100

--烈火燃盡
g_Magic.FIREEND = {}
g_Magic.FIREEND.DmgID = 491319 --傷害

--冰刺
g_Magic.ICESPEAR = {}
g_Magic.ICESPEAR.PreID = 491605 --地面預警特效
g_Magic.ICESPEAR.CG1ID = 491479 --刺出特效
g_Magic.ICESPEAR.DmgID = 491478 --傷害

--撼地
g_Magic.EARTHSTRIKE = {}
g_Magic.EARTHSTRIKE.CD = 8
g_Magic.EARTHSTRIKE.ActID = 491852
g_Magic.EARTHSTRIKE.CG1ID = 491855 -- 聚氣小傷害特效
g_Magic.EARTHSTRIKE.CG2ID = 491856 --出手大傷害特效
g_Magic.EARTHSTRIKE.Dmg1ID = 491853 --聚氣小傷害
g_Magic.EARTHSTRIKE.Dmg2ID = 491854 --出手大傷害+擊倒

--雷引
g_Magic.THUNDERSTRIKE = {}
g_Magic.THUNDERSTRIKE.CD = 16
g_Magic.THUNDERSTRIKE.ActID = 491637
g_Magic.THUNDERSTRIKE.Dmg1ID = 491638 --聚氣小傷害
g_Magic.THUNDERSTRIKE.Dmg2ID = 491649 --出手大傷害
g_Magic.THUNDERSTRIKE.CG1ID = 491650 --落雷特效
g_Magic.THUNDERSTRIKE.SafeRange = 100

local g_BuffID = {} --基本法數
g_BuffID.DARK = {}
g_BuffID.DARK[178] = 502008 -- 困難副本
g_BuffID.DARK[179] = 503259
g_BuffID.DARK[180] = 503259
g_BuffID.DARK[940] = 503259

g_BuffID.FIRE = {}
g_BuffID.FIRE[178] = 501986 -- 困難副本
g_BuffID.FIRE[179] = 503226
g_BuffID.FIRE[180] = 503226
g_BuffID.FIRE[940] = 503226

g_BuffID.ICE = {}
g_BuffID.ICE[178] = 501984 -- 困難副本
g_BuffID.ICE[179] = 503227
g_BuffID.ICE[180] = 503227
g_BuffID.ICE[940] = 503227

g_BuffID.FRZ = 501988

local g_Phase = {} -- 階段轉換flag 聯絡BOSS與中控器
local g_HateList = {} 	-- 仇恨表
local g_Control = {} 	-- 中控器

local g_Door = {}
g_Door.FrontDoor = {} 	-- 前門
g_Door.FrontDoor.NpcID = 106250 	-- 物件ID
g_Door.FrontDoor.Pos = { X = 2452, Y = 149, Z = 3736, Dir = 19 } 	-- 座標

g_Door.RearDoor = {} 	-- 後門
g_Door.RearDoor.NpcID = 106250 	-- 物件ID
g_Door.RearDoor.Pos = { X = 1949, Y = 157, Z = 4413, Dir = 61 } 	-- 座標

local g_Boss = {} 	-- 王
g_Boss.NpcID = {} 	-- 王ID
g_Boss.NpcID[940] = 106175 
g_Boss.NpcID[178] = 106175 	-- 困難副本
g_Boss.NpcID[179] = 106283 	-- 普通副本
g_Boss.NpcID[180] = 106284 	-- 簡單副本

----------------------------------------------------常用功能----------------------------------------------------

local function CompDis( A, B )	-- 比較遠近，由近至遠依序排序，提供此編號的 Script 判斷距離用

	if A.Dis < B.Dis then
		return true 
	end
end

local function CompHatePoint( A, B )	-- 比照仇恨點數，由高至低依序排序，提供此編號的 Script 判斷仇恨用

	if A.HatePoint > B.HatePoint then
		return true 
	end
end

local function GetHateList( ObjID, Haters )	-- 取參考物件的仇恨表，整理 Guid、距離、仇恨點數後回傳 Table，提供此編號的 Script 判斷資訊用

	local HateList = {} 
	for i = 0, Haters-1 do	-- 取仇恨表內的目標
		local Targets = {} 
		local Player = HateListInfo( ObjID, i, EM_HateListInfoType_GItemID ) 
		if ReadRoleValue( Player, EM_RoleValue_Voc ) ~= 0 then	-- 非GM
			Targets.Guid = Player 
			Targets.Dis = GetDistance( ObjID, Player ) 
			Targets.HatePoint = HateListInfo( ObjID, i, EM_HateListInfoType_HatePoint ) 
		--	DebugMsg( 0, Room, Getname( Targets.Guid )..", Dis = "..Targets.Dis..", HatePoint = "..Targets.HatePoint ) 
			table.insert( HateList, Targets ) 
		end
	end
	return HateList 
end


----------------------------------------------------NPC 掛載function----------------------------------------------------

function Z34_BOSS3_Control_Init()	-- 中控物件產生劇情
	DebugMsg( 0, 0, "Z34_BOSS3_Control_Init")
	local Control = OwnerID()
	local Zone = ReadRoleValue( Control, EM_RoleValue_ZoneID ) 
	local Room = ReadRoleValue( Control, EM_RoleValue_RoomID ) 
	g_Control[Room] = Control
	
	if g_Boss[Room] and CheckID( g_Boss[Room] ) then	-- 防呆，刪掉舊王
		DelObj( g_Boss[Room])  
	end

	local ControlPos = Vector_GetRolePos(Control) 
	local ControlDir = ReadRoleValue( Control, EM_RoleValue_Dir ) 
	local VecDir = Vector_DirToVector( ControlDir + 90 + 180 ) 
	local BossPos = ControlPos + VecDir * 10 	-- 王位於中控正後方 10 的位置
	local Boss = CreateObj( g_Boss.NpcID[Zone], BossPos.X, BossPos.Y, BossPos.Z, ControlDir, 1 ) 
	g_Boss[Room] = Boss

	SetModeEx( Boss  , EM_SetModeType_Strikback, true)  ---反擊
	SetModeEx( Boss  , EM_SetModeType_Searchenemy,true)   -- 索敵
	SetModeEx( Boss  , EM_SetModeType_Fight, false)  --砍殺
	AddToPartition( Boss, Room ) 

	if Zone ~= 940 then	-- 避免於測試區測試時報錯，致使劇情中斷
		Cl_Resist_HackersBossNum( Boss ) 	-- 防駭客機制 掛於物件產生
	end

	-- 建立前門
	if g_Door.FrontDoor[Room] and CheckID( g_Door.FrontDoor[Room] ) then	-- 防呆
		DelObj( g_Door.FrontDoor[Room] ) 
	end
	local FrontDoor = CreateObj( g_Door.FrontDoor.NpcID, g_Door.FrontDoor.Pos.X, g_Door.FrontDoor.Pos.Y, g_Door.FrontDoor.Pos.Z, g_Door.FrontDoor.Pos.Dir, 1 ) 
	SetModeEx( FrontDoor, EM_SetModeType_Gravity, false ) 	-- 重力
	SetModeEx( FrontDoor, EM_SetModeType_Searchenemy, false ) 	-- 索敵
	SetModeEx( FrontDoor, EM_SetModeType_Strikback, false ) 	-- 反擊
	SetModeEx( FrontDoor, EM_SetModeType_Fight, false ) 	-- 砍殺
	SetModeEx( FrontDoor, EM_SetModeType_Move, false ) 	-- 移動
	SetModeEx( FrontDoor, EM_SetModeType_HideName, true ) 	-- 名稱
	SetModeEx( FrontDoor, EM_SetModeType_Mark, false ) 	-- 標記
	
	SetModeEx( FrontDoor, EM_SetModeType_Obstruct, false ) 	-- 阻擋
	SetModeEx( FrontDoor, EM_SetModeType_Show, false ) 	-- 顯示
	AddToPartition( FrontDoor, Room ) 
	g_Door.FrontDoor[Room] = FrontDoor 

	-- 建立後門
	if g_Door.RearDoor[Room] and CheckID( g_Door.RearDoor[Room] ) then	-- 防呆
		DelObj( g_Door.RearDoor[Room] ) 
	end
	local RearDoor = CreateObj( g_Door.RearDoor.NpcID, g_Door.RearDoor.Pos.X, g_Door.RearDoor.Pos.Y, g_Door.RearDoor.Pos.Z, g_Door.RearDoor.Pos.Dir, 1 ) 
	SetModeEx( RearDoor, EM_SetModeType_Gravity, false ) 	-- 重力
	SetModeEx( RearDoor, EM_SetModeType_Searchenemy, false ) 	-- 索敵
	SetModeEx( RearDoor, EM_SetModeType_Strikback, false ) 	-- 反擊
	SetModeEx( RearDoor, EM_SetModeType_Fight, false ) 	-- 砍殺
	SetModeEx( RearDoor, EM_SetModeType_Move, false ) 	-- 移動
	SetModeEx( RearDoor, EM_SetModeType_HideName, true ) 	-- 名稱
	SetModeEx( RearDoor, EM_SetModeType_Mark, false ) 	-- 標記
	
	SetModeEx( RearDoor, EM_SetModeType_Obstruct, true ) 	-- 阻擋
	SetModeEx( RearDoor, EM_SetModeType_Show, true ) 	-- 顯示
	AddToPartition( RearDoor, Room ) 
	g_Door.RearDoor[Room] = RearDoor 
	
end

function Z34_BOSS3_Engage()	-- BOSS戰鬥開始
	DebugMsg( 0, 0, "Z34_BOSS3_Engage")
	local Boss = OwnerID()
	local Zone = ReadRoleValue( Boss, EM_RoleValue_ZoneID ) 
	local Room = ReadRoleValue( Boss, EM_RoleValue_RoomID )
	
	g_Phase[Room] = 1 --階段旗標 "戰鬥"
	
	if Zone ~= 940 then
		Cl_Resist_HackersFightBegin() --防駭客
	end
	
	SetModeEx( g_Door.FrontDoor[Room], EM_SetModeType_Obstruct, true ) 	-- 關前門
	SetModeEx( g_Door.FrontDoor[Room], EM_SetModeType_Show, true ) 	
	
	SetModeEx( Boss  , EM_SetModeType_Fight, true)---可砍殺
	CallPlot( g_Control[Room], "Z34_BOSS3_Control_BattleLoop", g_Control[Room], g_Boss[Room], Zone, Room )  --呼叫中控器開始戰鬥主迴圈
end 

function Z34_BOSS3_EndBattle()	-- BOSS脫戰
	DebugMsg( 0, 0, "Z34_BOSS3_EndBattle")
	local Boss = OwnerID()
	local Room = ReadRoleValue( Boss, EM_RoleValue_RoomID )
	DebugMsg( 0, 0, "**g_Phase="..g_Phase[Room])
	

	if ReadRoleValue( Boss, EM_RoleValue_IsDead ) == 0 then --zzzz 王沒死才重置
		g_Phase[Room] = 2 --階段旗標 "脫戰"
		SetModeEx( Boss  , EM_SetModeType_Strikback, false)  ---反擊
		SetModeEx( Boss  , EM_SetModeType_Searchenemy, false)   -- 索敵
		SetModeEx( Boss  , EM_SetModeType_Fight, false)---砍殺
		
		
		SetModeEx( g_Door.FrontDoor[Room], EM_SetModeType_Obstruct, false ) -- 開前門
		SetModeEx( g_Door.FrontDoor[Room], EM_SetModeType_Show, false ) 	
	end 	
end

function Z34_BOSS3_Dead()	-- BOSS死亡
	DebugMsg( 0, 0, "Z34_BOSS3_Dead")
	local Boss = OwnerID()
	local Room = ReadRoleValue( Boss, EM_RoleValue_RoomID )
	local Zone = ReadRoleValue( Boss, EM_RoleValue_ZoneID )
	
	g_Phase[Room] = 3 --階段旗標 "死亡"
	
	if Zone ~= 940 then	-- 避免於測試區測試時報錯，致使劇情中斷
		Cl_Resist_HackersBossDead( Boss );	-- 防駭客機制 掛於物件死亡
	end
	
	SetModeEx( g_Door.FrontDoor[Room], EM_SetModeType_Obstruct, false ) -- 開前後門
	SetModeEx( g_Door.FrontDoor[Room], EM_SetModeType_Show, false ) 	
	SetModeEx( g_Door.RearDoor[Room], EM_SetModeType_Obstruct, false ) 
	SetModeEx( g_Door.RearDoor[Room], EM_SetModeType_Show, false ) 	
end


----------------------------------------------------中控器戰鬥主迴圈----------------------------------------------------


function Z34_BOSS3_Control_BattleLoop(Control, Boss, Zone, Room)	

	DebugMsg( 0, 0, "Z34_BOSS3_Control_BattleLoop")
	
	local Counter = {} 	-- 計數器，用於統計戰鬥時間
	local DARKCURSE = 1
	local ICEBLADE = 2
	local FIREBLADE = 3
	local EARTHSTRIKE = 4
	local THUNDERSTRIKE = 5
	
	local nowHP = 0 --計算BOSS血量
	local maxHP = 0
	local HP = 0
	
	Counter[DARKCURSE] = 0
	Counter[ICEBLADE] = 0
	Counter[FIREBLADE] = 0
	Counter[EARTHSTRIKE] = 0
	Counter[THUNDERSTRIKE] = 0
	
	SysCastSpellLv( Boss, Boss, g_Magic.DARKCURSE.DmgID,1) --開場暗咒
	
	while g_Phase[Room] ~= 0 do --戰鬥主迴圈
	
		nowHP = ReadRoleValue( Boss, EM_RoleValue_HP )
		maxHP = ReadRoleValue( Boss, EM_RoleValue_MaxHP )
		HP = nowHP/maxHP
	
		for i = 1, #Counter do --計時器
			Counter[i] = Counter[i] + 1
		end
		
		if g_Phase[Room] == 1 then --戰鬥中
			
			--*************************************************************************************************戰鬥招式
			
			---------------------------------------------------------------------------------------------暗咒
			if Counter[DARKCURSE] >= g_Magic.DARKCURSE.CD and HateListCount(Boss) > 0 then
			
				
				SysCastSpellLv( Boss, Boss, g_Magic.DARKCURSE.DmgID,1) --暗咒
				sleep(30)
				Counter[DARKCURSE] = 0
			---------------------------------------------------------------------------------------------暗咒
			
			---------------------------------------------------------------------------------------------冰霧
			elseif Counter[ICEBLADE] >= g_Magic.ICEBLADE.CD and HateListCount(Boss) > 0 then
				
				local HateList = GetHateList( Boss, HateListCount(Boss) ) 
				table.sort( HateList, CompHatePoint ) 	-- 將仇恨表內的玩家依照仇恨由高至低排序
				
				local Target = nil
				if GetDistance( Boss, HateList[1].Guid ) <= g_Magic.ICEBLADE.Range then
					Target = HateList[1].Guid 
					
					StopMove(Boss, false) 
					SetModeEx( Boss, EM_SetModeType_Move, false )     -- 乖乖站好
					
					
					SysCastSpellLv( Boss, Target, g_Magic.ICEBLADE.CG1ID,1) --詠唱特效
					Castspell( Boss, Boss, g_Magic.ICEBLADE.ActID) --本招
					sleep(8)
					local Obj = Hao_CreateSpellObj( Boss ) --特效透明球
					local ObjPos = Vector_GetRolePos( Boss )
					AddBuff ( Obj, 505453, 1, -1 ) --放大術
	
					SysCastSpellLv( Obj, Obj, g_Magic.ICEBLADE.CG2ID,1) --出招特效
					
					SetModeEx( Boss, EM_SetModeType_Move, true )      -- 乖乖站好
					sleep(3)
					SysCastSpellLv( Boss, Obj, g_Magic.ICEBLADE.DmgID,1) --傷害
					sleep(5)
					SysCastSpellLv( Boss, Obj, g_Magic.ICEBLADE.DmgID,1) --傷害
					sleep(5)
					SysCastSpellLv( Boss, Obj, g_Magic.ICEBLADE.DmgID,1) --傷害
					sleep(5)
					SysCastSpellLv( Boss, Obj, g_Magic.ICEBLADE.DmgID,1) --傷害
					sleep(5)
					SysCastSpellLv( Boss, Obj, g_Magic.ICEBLADE.DmgID,1) --傷害
					Counter[ICEBLADE] = 0
					
				-----------------------------------------------------------------------------------------冰霧追加冰刺
				
				if HP < 0.6 then
					
					local HateList = GetHateList( Boss, HateListCount(Boss) ) 

					if #HateList > 1 then --如果有多人則排坦
						table.sort( HateList, CompHatePoint ) 	-- 將仇恨表內的玩家依照仇恨由高至低排序
						
						local target = math.random(2,#HateList) --坦以外目標
						CallPlot( Boss, "Z34_BOSS3_ICESPEAR_LOCK", HateList[target].Guid)

					elseif #HateList == 1 then
						CallPlot( Boss, "Z34_BOSS3_ICESPEAR_LOCK", HateList[1].Guid) --單人挑戰直接打唯一目標
					end
					
				end
				
				-----------------------------------------------------------------------------------------冰霧追加冰刺

				else
					DebugMsg( 0, Room, "冰霧 OutofRange")
					Counter[ICEBLADE] = 3	
				end
			---------------------------------------------------------------------------------------------冰霧
			
			---------------------------------------------------------------------------------------------火破
			elseif Counter[FIREBLADE] >= g_Magic.FIREBLADE.CD and HateListCount(Boss) > 0 then
				
				StopMove(Boss, false) 
				SetModeEx( Boss, EM_SetModeType_Move, false )     -- 乖乖站好
				
				SysCastSpellLv( Boss, Boss, g_Magic.FIREBLADE.CG1ID,1) --詠唱特效
				sleep(10)
				Castspell( Boss, Boss, g_Magic.FIREBLADE.ActID) --本招
				sleep(8)
				local Obj = Hao_CreateSpellObj( Boss)
				local Objdir = readrolevalue(Obj, em_rolevalue_dir)
				local Obj2dir = Objdir+90
				if Obj2dir > 360 then
					Obj2dir = Obj2dir -360
				end
				local Obj2 = Hao_CreateSpellObj( Obj, Obj2dir) --特效透明球
				
				SysCastSpellLv( Obj, Obj, g_Magic.FIREBLADE.CG2ID,1) --出招特效
				SysCastSpellLv( Obj2, Obj2, g_Magic.FIREBLADE.CG2ID,1) --出招特效
				
				sleep(5)
				local ObjPos = Vector_GetRolePos( Obj ) 
				
				local EndPos = {}
				for i = 1,4 do
					local VecDir = Vector_DirToVector( ObjDir+90*i ) 	-- 角度轉向量，計算ROM的角度時，要先轉 90 度角才會變為正確向量。
					EndPos[i] = ObjPos + VecDir * g_Magic.FIREBLADE.Length --長度 
				end
				SetModeEx( Boss, EM_SetModeType_Move, true )      -- 乖乖站好
				
				
				local HateList = GetHateList( Boss, HateListCount(Boss) ) 
				
				for t = 1,4 do
					for i = 1,4 do
					
						for p = 1, #HateList do
							local Target = HateList[p].Guid
							local TargetPos = Vector_GetRolePos( Target ) 
							--檢查目標是否在指定長、寬的直線範圍內，否回傳Nil、是的話回傳目標與起點的距離 ( 起點座標、終點座標、寬度、高度、目標座標)
							local Status = Vector_CheckShootObj( ObjPos, EndPos[i], g_Magic.FIREBLADE.Width, g_Magic.FIREBLADE.Height, TargetPos ) 
							if Status then
								SysCastSpellLv( Boss, Target, g_Magic.FIREBLADE.DmgID,1) --傷害
							end
						end
						
						
					end
				sleep(6)
				end
				
			Counter[FIREBLADE] = 0
			---------------------------------------------------------------------------------------------火破

			---------------------------------------------------------------------------------------------亂刃+撼地
			elseif Counter[EARTHSTRIKE] >= g_Magic.EARTHSTRIKE.CD and HateListCount(Boss) > 0 and HP < 0.6 then
				StopMove(Boss, false) 
				SetModeEx( Boss, EM_SetModeType_Move, false )     -- 乖乖站好
				local Obj = Hao_CreateSpellObj( Boss)
				AddBuff ( Obj, 505453, 1, -1 ) --放大術

				Castspell( Boss, Boss, g_Magic.EARTHSTRIKE.ActID) --出手動作
				sleep(15)
				SysCastSpellLv( Obj, Obj, g_Magic.EARTHSTRIKE.CG1ID,1) --聚氣特效
				sleep(2)
				SysCastSpellLv( Boss, Obj, g_Magic.EARTHSTRIKE.Dmg1ID,1) --聚氣小傷害
				sleep(2)
				SysCastSpellLv( Boss, Obj, g_Magic.EARTHSTRIKE.Dmg1ID,1) --聚氣小傷害
				sleep(2)
				SysCastSpellLv( Boss, Obj, g_Magic.EARTHSTRIKE.Dmg1ID,1) --聚氣小傷害
				sleep(2)
				SysCastSpellLv( Boss, Obj, g_Magic.EARTHSTRIKE.Dmg1ID,1) --聚氣小傷害
				sleep(2)
				SysCastSpellLv( Boss, Obj, g_Magic.EARTHSTRIKE.Dmg1ID,1) --聚氣小傷害
				sleep(10)
				SysCastSpellLv( Obj, Obj, g_Magic.EARTHSTRIKE.CG2ID,1) --出手特效
				sleep(4)
				SysCastSpellLv( Boss, Obj, g_Magic.EARTHSTRIKE.Dmg2ID,1) --出手傷害+擊倒
				
				sleep(10)
				SetModeEx( Boss, EM_SetModeType_Move, true )      -- 乖乖站好
				
				Counter[EARTHSTRIKE] = 0
			---------------------------------------------------------------------------------------------亂刃+撼地
			
			---------------------------------------------------------------------------------------------雷引
			elseif Counter[THUNDERSTRIKE] >= g_Magic.THUNDERSTRIKE.CD and HateListCount(Boss) > 0 and HP < 0.8 then

				StopMove(Boss, false) 
				SetModeEx( Boss, EM_SetModeType_Move, false )     -- 乖乖站好
				
				Castspell( Boss, Boss, g_Magic.THUNDERSTRIKE.ActID) --出手動作
				sleep(5)
				SysCastSpellLv( Boss, Boss, g_Magic.THUNDERSTRIKE.Dmg1ID,1) --聚氣小傷害
				sleep(5)
				SysCastSpellLv( Boss, Boss, g_Magic.THUNDERSTRIKE.Dmg1ID,1) --聚氣小傷害
				sleep(5)
				SysCastSpellLv( Boss, Boss, g_Magic.THUNDERSTRIKE.Dmg1ID,1) --聚氣小傷害
				sleep(5)
				SysCastSpellLv( Boss, Boss, g_Magic.THUNDERSTRIKE.Dmg1ID,1) --聚氣小傷害
				sleep(5)
				SysCastSpellLv( Boss, Boss, g_Magic.THUNDERSTRIKE.Dmg1ID,1) --聚氣小傷害
				sleep(5)
				SysCastSpellLv( Boss, Boss, g_Magic.THUNDERSTRIKE.Dmg1ID,1) --聚氣小傷害
				sleep(8)
				SysCastSpellLv( Boss, Boss, g_Magic.THUNDERSTRIKE.Dmg2ID,1) --出手大傷害
				
				sleep(10)
				SetModeEx( Boss, EM_SetModeType_Move, true )      -- 乖乖站好
				
				Counter[THUNDERSTRIKE] = 0
			---------------------------------------------------------------------------------------------雷引


			end
			--*************************************************************************************************戰鬥招式
			
			
				
		elseif g_Phase[Room] == 2 then --脫戰
		
			DebugMsg( 0, 0, "Phase_2")
			sleep(10) --純粹視覺效果
			DelObj( g_Boss[Room])
			sleep(10) --純粹視覺效果
			local ControlPos = Vector_GetRolePos(Control) 
			local ControlDir = ReadRoleValue( Control, EM_RoleValue_Dir )
			local VecDir = Vector_DirToVector( ControlDir + 90 + 180 ) 
			local BossPos = ControlPos + VecDir * 10 	-- 王位於中控正後方 10 的位置

			Boss = CreateObj( g_Boss.NpcID[Zone], BossPos.X, BossPos.Y, BossPos.Z, ControlDir, 1 ) 
			g_Boss[Room] = Boss
			
			SetModeEx( Boss  , EM_SetModeType_Strikback, true)  ---反擊
			SetModeEx( Boss  , EM_SetModeType_Searchenemy,false)   -- 索敵
			SetModeEx( Boss  , EM_SetModeType_Fight, false)  ---砍殺
			AddToPartition( Boss, Room ) 
			-- if Zone ~= 940 then	-- 避免於測試區測試時報錯，致使劇情中斷
				-- Cl_Resist_HackersBossNum( Boss ) 	-- 防駭客機制 掛於物件產生
			-- end
			g_Phase[Room] = 10

		elseif g_Phase[Room] == 3 then --死亡
		
			DebugMsg( 0, 0, "Phase_3")
			g_Phase[Room] = 0
			
		elseif g_Phase[Room] == 10 then --重置安全時間
		
			DebugMsg( 0, 0, "Phase_10")
			sleep(40) --四秒安全時間 不要立刻進入索敵
			SetModeEx( Boss  , EM_SetModeType_Searchenemy,true)   -- 索敵
			g_Phase[Room] = 0
			
		end
		sleep(10)
	end
end

----------------------------------------------------各種額外PLUS FUNCTINO----------------------------------------------------
--暗咒DOT系列
function Z34_BOSS3_502008_CHECK() --暗咒DOT 檢查
	
	local Player = TargetID()
	local Zone = ReadRoleValue( Player, EM_RoleValue_ZoneID ) 	
	if CheckBuff( Player , g_BuffID.DARK[Zone]) or CheckBuff( Player , g_BuffID.ICE[Zone]) or CheckBuff( Player , g_BuffID.FIRE[Zone]) or CheckBuff( Player , g_BuffID.FRZ) then --有暗冰火凍結不上
		return false
	else
		AddBuff (Player, g_BuffID.DARK[Zone], 1, -1 )
		return false
	end
end

function Z34_BOSS3_502009_DARKEND() --502008暗咒時間到，觸發491475帶502009執行LUA造成即死暗咒傷害

	local Player = OwnerID()
	local Room = ReadRoleValue( Player, EM_RoleValue_RoomID ) 
	local Boss = g_Boss[Room]
	
	SysCastSpellLv( Boss, Player, g_Magic.DARKEND.DmgID,1) --即死暗咒傷害(必殺)
end

--寒冰DOT系列
function Z34_BOSS3_501984_CHECK() --寒冰DOT 檢查

	local Player = TargetID()
	local Zone = ReadRoleValue( Player, EM_RoleValue_ZoneID ) 	

	if CheckBuff( Player , g_BuffID.ICE[Zone]) or CheckBuff( Player , g_BuffID.FRZ ) then --有冰有凍結不重上
		return false
	elseif CheckBuff( Player , g_BuffID.FIRE[Zone]) then --有火轉冰
		CancelBuff( Player, g_BuffID.FIRE[Zone] )
		AddBuff (Player, g_BuffID.ICE[Zone], 1, -1 )
		return false
	elseif CheckBuff( Player , g_BuffID.DARK[Zone]) then --有暗轉冰
		CancelBuff( Player, g_BuffID.DARK[Zone] )
		AddBuff ( Player, g_BuffID.ICE[Zone], 1, -1 )
		return false
	else
		AddBuff ( Player, g_BuffID.ICE[Zone], 1, -1 )
		return false
	end
end

function Z34_BOSS3_502074_ICEEND() --501984寒霜時間到，觸發491468帶502074執行LUA造成烈火燃盡傷害

	local Player = OwnerID()
	local Room = ReadRoleValue( Player, EM_RoleValue_RoomID )  
	local Boss = g_Boss[Room]
	
	SysCastSpellLv( Boss, Player, g_Magic.ICEEND.DmgID,1) --寒霜凍結冰塊控場
end

--烈火DOT系列
function Z34_BOSS3_501986_CHECK() --烈火DOT 檢查

	local Player = TargetID()
	local Zone = ReadRoleValue( Player, EM_RoleValue_ZoneID ) 	
	if CheckBuff( Player , g_BuffID.FIRE[Zone]) or CheckBuff( Player , g_BuffID.FRZ) then --有火有凍結不重上
		return false
	elseif CheckBuff( Player , g_BuffID.ICE[Zone]) then --有冰轉火
		CancelBuff( Player, g_BuffID.ICE[Zone] )
		AddBuff ( Player, g_BuffID.FIRE[Zone], 1, -1 )
		return false
	elseif CheckBuff( Player , g_BuffID.DARK[Zone]) then --有暗轉火
		CancelBuff( Player, g_BuffID.DARK[Zone] )
		AddBuff ( Player, g_BuffID.FIRE[Zone], 1, -1 )
		return false
	else
		AddBuff ( Player, g_BuffID.FIRE[Zone], 1, -1 )
		return false
	end
end

function Z34_BOSS3_501989_FIREEND() --501986烈火時間到，觸發491467帶501989執行LUA造成烈火燃盡傷害

	local Player = OwnerID()
	local Room = ReadRoleValue( Player, EM_RoleValue_RoomID )  
	local Boss = g_Boss[Room]
	
	SysCastSpellLv( Boss, Player, g_Magic.FIREEND.DmgID,1) --烈火燃盡傷害
end

--冰刺
function Z34_BOSS3_ICESPEAR_LOCK(Target) --冰刺持續鎖定產生透明球

	local Boss = OwnerID()
	for i = 1,20 do
		local TargetPos = Vector_GetRolePos( Target ) 
		local TargetDir = readrolevalue(Target, em_rolevalue_dir)
		local Objdir = TargetDir+rand(360)
		local VecDir = Vector_DirToVector( Objdir )
		
		local ICEPos = TargetPos + VecDir * (rand(60)+10)
		local Obj = Hao_CreateSpellObjbyPos( ICEPos ) --特效透明球
		AddBuff ( Obj, 621745, 1, -1 ) --放大術
		CallPlot( Obj, "Z34_BOSS3_ICESPEAR", Boss)  --透明球執行冰刺
	sleep(2)
	end
end

function Z34_BOSS3_ICESPEAR(Boss) --冰刺透明球放預警與傷害
	local Obj = OwnerID() --透明球
	SetDir( Obj, rand(360) )
	SysCastSpellLv( Obj, Obj, g_Magic.ICESPEAR.PreID,1) --預警特效
	sleep(12)
	SysCastSpellLv( Obj, Obj, g_Magic.ICESPEAR.CG1ID,1) --刺出特效
	sleep(2)
	SysCastSpellLv( Boss, Obj, g_Magic.ICESPEAR.DmgID,1) --傷害
end

--撼地
function Z34_BOSS3_502031_CHECK() --冰塊不會跌倒
	if CheckBuff( TargetID() , 501988) then
		return false
	end
end

--雷引
function Z34_BOSS3_502069_CHECK() --雷引只打遠程，王周圍安全
	local Player = TargetID()
	local Boss = OwnerID()
	
	if GetDistance( Boss, Player ) <= g_Magic.THUNDERSTRIKE.SafeRange then
		return false
	end
	
end

function Z34_BOSS3_502070_CHECK() --雷引只打遠程，王周圍安全 大傷害用 多特效
	local Player = TargetID()
	local Boss = OwnerID()
	
	if GetDistance( Boss, Player ) <= g_Magic.THUNDERSTRIKE.SafeRange then
		return false
	else
	SysCastSpellLv( Boss, Player, g_Magic.THUNDERSTRIKE.CG1ID,1) --落雷特效	g_Magic.THUNDERSTRIKE.CG1ID = 802645
	end
	
end

----------------------------------------------------測試用----------------------------------------------------
function GGdemodemo()
	local Boss = OwnerID()
	local Room = ReadRoleValue( Boss, EM_RoleValue_RoomID )  
	g_Boss[Room] = Boss
	
	while true do 
		DebugMsg( 0, 0, "-----------------------") 
		StopMove(Boss, false) 
		SetModeEx( Boss, EM_SetModeType_Move, false )     -- 乖乖站好
		
		SysCastSpellLv( Boss, Boss, g_Magic.FIREBLADE.CG1ID,1) --詠唱特效
		sleep(10)
		Castspell( Boss, Boss, g_Magic.FIREBLADE.ActID) --本招
		sleep(8)
		local Obj = Hao_CreateSpellObj( Boss)
		local Objdir = readrolevalue(Obj, em_rolevalue_dir)
		local Obj2dir = Objdir+90
		if Obj2dir > 360 then
			Obj2dir = Obj2dir -360
		end
		local Obj2 = Hao_CreateSpellObj( Obj, Obj2dir) --特效透明球
		
		SysCastSpellLv( Obj, Obj, g_Magic.FIREBLADE.CG2ID,1) --出招特效
		SysCastSpellLv( Obj2, Obj2, g_Magic.FIREBLADE.CG2ID,1) --出招特效
		
		sleep(5)
		local ObjPos = Vector_GetRolePos( Obj ) 
		
		local EndPos = {}
		for i = 1,4 do
			local VecDir = Vector_DirToVector( ObjDir+90*i ) 	-- 角度轉向量，計算ROM的角度時，要先轉 90 度角才會變為正確向量。
			EndPos[i] = ObjPos + VecDir * g_Magic.FIREBLADE.Length --長度 
		end
		SetModeEx( Boss, EM_SetModeType_Move, true )      -- 乖乖站好
		
		
		local HateList = GetHateList( Boss, HateListCount(Boss) ) 
		
		for t = 1,4 do
			for i = 1,4 do
			
				
					local Target = 11665413
					local TargetPos = Vector_GetRolePos( Target ) 
					--檢查目標是否在指定長、寬的直線範圍內，否回傳Nil、是的話回傳目標與起點的距離 ( 起點座標、終點座標、寬度、高度、目標座標)
					local Status = Vector_CheckShootObj( ObjPos, EndPos[i], g_Magic.FIREBLADE.Width, g_Magic.FIREBLADE.Height, TargetPos ) 
					if Status then
						SysCastSpellLv( Boss, Target, g_Magic.FIREBLADE.DmgID,1) --傷害
					end
			end
		sleep(6)
		end
		
		
		sleep(20)
	end
end



--106266