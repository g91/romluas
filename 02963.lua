----------------------------------------------------------------------------
--↓是否要啟動3王中控器的判斷
----------------------------------------------------------------------------
function YOYO_Zone27D_Boss3_Start()
	local Owner = OwnerID()	--偵測者本身
	local CtrlCentralID = 103075	--中央控制器編號
	local CtrlCentral = 0 --中央控制器
	local RangeNPCTable = SearchRangeNPC( Owner , 2000 ) --抓取距離2000的所有NPC
	for I = 0 , #RangeNPCTable do
		if ReadRoleValue ( RangeNPCTable[ I ] , EM_RoleValue_OrgID  ) == CtrlCentralID then	--檢查是否為中控器
			CtrlCentral = RangeNPCTable[ I ]	--把中控器GUID記下
			break
		end
	end
	
	local StickID = 209464	--那布赫洛斯的手杖
	local RangePlayerTable = SearchRangePlayer( CtrlCentral , 2000 ) --抓取中控器距離2000的所有玩家
	for J = 0 , #RangePlayerTable do
		if CountBodyItem( RangePlayerTable[ J ] , StickID ) >= 1 then
			BeginPlot( CtrlCentral , "YOYO_Zone27D_Boss3_Ctrl" , 0 )	--啟動Boss中控器
			DelBodyItem( RangePlayerTable[ J ] , StickID , 1 )	--刪除布赫洛斯的手杖
			return
		end
	end
	--Say( CtrlCentral , "No one holds a stick... (Test Message)" )
end
----------------------------------------------------------------------------
--↓BOSS重生與環境的相關劇情
----------------------------------------------------------------------------
function YOYO_Zone27D_Boss3_Ctrl()
	--物件編號
	local FlagID = 781317	--旗標編號
	local EasyBossID = 108178	--簡單副本BOSS編號
	local NormalBossID = 108176	--普通副本BOSS編號
	local RaidBossID = 107834	--困難副本BOSS編號
	local DoorID = 106249	--阻擋門物件編號

	--旗標
	local BossFlag = 0	--BOSS重生點旗標號
	local BeforeDoorFlagID = 1	--前門旗標號
	local AfterDoorFlagID = 2	--後門旗標號
	local CombatBegin = 0	--開戰旗標
	
	--物件
	local CtrlCentral = OwnerID() --中央控制器
	local Boss	--Boss物件
	local BeforeDoor	--前門
	local AfterDoor	--後門

	local AppearedTalk = { "[SC_107834_01]" , "[SC_107834_02]" }	--Boss現身預告字串
	local BossTalk = { "[SC_107834_03]" , "[SC_107834_04]" , "[SC_107834_05]" }	--Boss戰鬥前後喊話字串
	local ZoneID = ReadRoleValue( CtrlCentral , EM_RoleValue_ZoneID )	--副本難度
	local RoomID = ReadRoleValue( CtrlCentral , EM_RoleValue_RoomID )	--副本房層數
	local BossShowTime = 10	--訊息出現後Boss現身的秒數
		
	local BossID	--對照副本斷後的的Boss編號
	if ZoneID == 159 then	BossID = EasyBossID	--簡單 159
	elseif ZoneID == 158 then	BossID = NormalBossID	--普通 158
	else	BossID = RaidBossID	end	--困難 157

	--生成後門
	AfterDoor = CreateObjByFlag( DoorID , FlagID , AfterDoorFlagID , 1 )
	SetModeEx( AfterDoor , EM_SetModeType_Mark , false )	--不可點選
	SetModeEx( AfterDoor , EM_SetModeType_HideName , false )	--不顯示名稱
	SetModeEx( AfterDoor , EM_SetModeType_NotShowHPMP , false )	--不顯示血條
	SetModeEx( AfterDoor , EM_SetModeType_Strikback , false )	--不會反擊
	SetModeEx( AfterDoor , EM_SetModeType_Move , false )	--不會移動
	SetModeEx( AfterDoor , EM_SetModeType_Fight , false )	--不可攻擊
	SetModeEx( AfterDoor , EM_SetModeType_Searchenemy , false )	--不會索敵
	SetModeEx( AfterDoor , EM_SetModeType_Obstruct , true )	--有阻擋效果
	AddToPartition( AfterDoor , RoomID)
	

	sleep( BossShowTime * 3 )	--讓上一支王喊完的時間
	ScriptMessage( CtrlCentral, -1 , 2 , AppearedTalk[ 1 ] , 2 )	--Boss即將現身預告
	sleep( BossShowTime * 10 )	--讓玩家準備的時間
	ScriptMessage( CtrlCentral, -1 , 2 , AppearedTalk[ 2 ] , 2 )	--Boss降臨！
	
	Boss = CreateObjByFlag(BossID , FlagID , BossFlag , 1 )	--生成Boss
	AddToPartition( Boss , RoomID )
	--Boss與中控互把對方的GUID寫入自己的PID
	--WriteRoleValue( CtrlCentral , EM_RoleValue_PID , Boss )
	--WriteRoleValue( Boss , EM_RoleValue_PID , CtrlCentral )
	--CallPlot( AfterDoor ,"KJ_28BOSS3_tokenRULE", BossID );--backdoor auto destroy--131202 K.J. Aris


	--任務需求：判斷任務給予旗標
	local RangePlayerTable = LUA_YOYO_RangePlayerNotGM( Boss , 2000 ) --抓取Boss距離2000的所有玩家，排除GM
	for I = 1 , #RangePlayerTable do
		if CheckAcceptQuest( RangePlayerTable[ I ] , 426476 ) == true then
			SetFlag( RangePlayerTable[ I ] , 548385 , 1 )
		end
	end

	while true do
		sleep( 10 )
		if HateListCount( Boss ) ~= 0 then	--仇恨表有人
			if CombatBegin == 0 then	--開戰旗標未開
				CombatBegin = 1	--將開戰旗標設為打開
				BeginPlot( Boss , "YOYO_Zone27D_Boss3_Fight" , 0 )
				CallPlot( Boss , "YOYO_Zone27D_Boss3_ViolentTimer" )
				ScriptMessage( Boss, -1 , 2 , BossTalk[ 1 ] , 2 )	--BOSS開戰嗆聲
				WriteRoleValue( Boss , EM_RoleValue_Register1 , 1 )	--Register1為Boss跨function用的戰鬥旗標，1  = 開始戰鬥
				
				--生成前門
				BeforeDoor = CreateObjByFlag( DoorID , FlagID , BeforeDoorFlagID , 1 )
				SetModeEx( BeforeDoor , EM_SetModeType_Mark , false )	--不可點選
				SetModeEx( BeforeDoor , EM_SetModeType_HideName , false )	--不顯示名稱
				SetModeEx( BeforeDoor , EM_SetModeType_NotShowHPMP , false )	--不顯示血條
				SetModeEx( BeforeDoor , EM_SetModeType_Strikback , false )	--不會反擊
				SetModeEx( BeforeDoor , EM_SetModeType_Move , false )	--不會移動
				SetModeEx( BeforeDoor , EM_SetModeType_Fight , false )	--不可攻擊
				SetModeEx( BeforeDoor , EM_SetModeType_Searchenemy , false )	--不會索敵
				SetModeEx( BeforeDoor , EM_SetModeType_Obstruct , true )	--有阻擋效果
				AddToPartition( BeforeDoor , RoomID )
			end
		end
	
		if HateListCount( Boss ) == 0 and CombatBegin == 1 then	--仇恨表沒人，開戰旗標已開
			if ReadRoleValue( Boss , EM_RoleValue_IsDead ) == 0 then	--BOSS還存活
				CombatBegin = 0	--將開戰旗標設為關閉
				DelObj( Boss )	--刪除BOSS
				Delobj( BeforeDoor )	--刪除前門
				ScriptMessage( Boss, -1 , 2 , BossTalk[ 2 ] , 2 )	--廣播BOSS勝利宣言
				WriteRoleValue( Boss , EM_RoleValue_Register1 , 0 )	--Register1為BOSS跨function用的戰鬥旗標，0  = 脫離戰鬥
				BeginPlot( CtrlCentral , "YOYO_Zone27D_Boss3_Clearance" , 0 )
				sleep( 50 )
				
				RoomID = ReadRoleValue( CtrlCentral , EM_RoleValue_RoomID )	--副本房層數
				Boss = CreateObjByFlag( BossID , FlagID , BossFlag , 1 )	--重置BOSS
				AddToPartition( Boss , RoomID )
				--Boss與中控互把對方的GUID寫入自己的PID
				--WriteRoleValue( CtrlCentral , EM_RoleValue_PID , Boss )
				--WriteRoleValue( Boss , EM_RoleValue_PID , CtrlCentral )
			end
		end			
			
		if ReadRoleValue( Boss , EM_RoleValue_IsDead ) == 1 then	--BOSS已死亡
			CombatBegin = 0	--將開戰旗標設為關閉
			Delobj( BeforeDoor )	--刪除前門
			Delobj( AfterDoor )	--刪除後門
			ScriptMessage( Boss, -1 , 2 , BossTalk[ 3 ] , 2 )	--廣播BOSS死亡對話
			WriteRoleValue( Boss , EM_RoleValue_Register1 , 0 )	--Register1為Boss跨function用的戰鬥旗標，0  = 脫離戰鬥
			BeginPlot( CtrlCentral , "YOYO_Zone27D_Boss3_Clearance" , 0 )
			sleep( 50 )
			break	--結束此中控判斷迴圈
		end
	end
end
----------------------------------------------------------------------------
--↓Boss的戰鬥AI
----------------------------------------------------------------------------
function YOYO_Zone27D_Boss3_Fight()
	--一些設定
	local Boss = OwnerID()
	local RoomID = ReadRoleValue( Boss , EM_RoleValue_RoomID)	--副本房層數
	local SkillTalk = { "[SC_107834_06]" , "[SC_107834_07]" , "[SC_107834_08]" }	--技能相關的對話
	local ZoneID = ReadRoleValue( Boss , EM_RoleValue_ZoneID )	--副本難度
	local PowerLv	--副本難度對應的技能等級
	if ZoneID == 159 then	PowerLv = 0	--簡單 159
	elseif ZoneID == 158 then	PowerLv = 1	--普通 158
	else	PowerLv = 2	end	--困難 157
	
	--技能與狀態
	local SkillA_DeBuff = 501945	-- 黏稠水壓 (狀態)
	local SkillB_DeBuffTable = { 500300 , 500301 , 500302 , 500303 , 500304 }	-- 窒息水壓 (狀態)
	local SkillC = 491548	--高壓水擊
	local SkillD = 491547	--地縛水壓
	local SkillE = 490046	--致命水壓
	
	--技能冷卻
	local SkillCtime = 7		--施法間隔：高壓水擊 (7秒)
	local SkillDtime = 10		--施法間隔：地縛水壓 (10秒)
	local SkillETime = 30	--施法間隔：致命水壓 (30秒)
	
	--其它變數
	local IntoP2HP = 40	--進入第二階段的血量
	local BossTime = 0	--Boss戰鬥計數器
	local P2SkillBFlag = 0	--進入第二階段時，檢查窒息水壓是否施展過的旗標
	
	--技能E 真空漩渦相關資料
	local WhirlpoolID = 103372	--真空旋渦物件
	local WhirlpoolFlag = 781322	--真空漩渦旗標
	local BuffID = 500054	--真空旋渦特效光環
	local WhirlpoolCount = 2	--真空旋渦的數量
	local WhirlpoolTable = {}
	
	--開場即施效果A 黏稠水壓
	--Say( Boss , "---- SkillA ----" )
	local RangePlayerTable = LUA_YOYO_RangePlayerNotGM_EX( Boss , 2000 , true ) --抓取自己距離2000的所有玩家，排除GM
	if #RangePlayerTable > 0 then
		for I = 1 , #RangePlayerTable do
			AddBuff( RangePlayerTable[ I ] , SkillA_DeBuff , 0 , -1 )	--開戰時立即讓副本內的玩家受到黏稠水壓狀態
		end
	else
	--	Say( Boss , "SkillA Nobody Nearby... (Test Message)" )
	end
	
	--開場即施效果B 窒息水壓
	--Say( Boss , "---- SkillB ----" )
	if #RangePlayerTable >= 3 then	--區域內玩家數量 >= 3人
		for I = 1 ,  3 do
			AddBuff( RangePlayerTable[ I ] , SkillB_DeBuffTable[ I ] , PowerLv , -1 )
		end
		
	elseif #RangePlayerTable == 2 then	--區域內只有2名玩家
		for I = 1 ,  2 do
			AddBuff( RangePlayerTable[ I ] , SkillB_DeBuffTable[ I ] , PowerLv , -1 )
		end
		AddBuff( RangePlayerTable[ 1 ] , SkillB_DeBuffTable[ 3 ] , PowerLv , -1 )	--清單第1位再+1枚窒息水壓
		
	elseif #RangePlayerTable == 1 then	--區域內只有1名玩家
		for I = 1 ,  3 do
			AddBuff( RangePlayerTable[ 1 ] , SkillB_DeBuffTable[ I ] , PowerLv , -1 )	--清單第1位共要承受3發窒息水壓
		end

		else	--Say( Boss , "SkillB No Player... (Test Message)" )
	end

	while true do
		Sleep(10)
		BossTime = BossTime + 1
		--Say( Boss , "-Time " .. BossTime .. " -" )	--計數器

		--C 高壓水擊
		if BossTime % SkillCtime == 0 then
			while ReadRoleValue( Boss , EM_RoleValue_SpellMagicID ) ~= 0 do	--有沒有正在施放技能
				sleep(2)	end
			--Say( Boss , "---- SkillC ----" )
			local NowTarget = ReadRoleValue( Boss , EM_RoleValue_AttackTargetID )
			CastSpellLV( Boss , NowTarget , SkillC , PowerLv )
		end
		
		--D 地縛水壓
		if BossTime % SkillDtime == 0 then
			while ReadRoleValue( Boss , EM_RoleValue_SpellMagicID ) ~= 0 do	--有沒有正在施放技能
				sleep(2)	end
			--Say( Boss , "---- SkillD ----" )
			CastSpellLV( Boss , Boss , SkillD , PowerLv )
			ScriptMessage( Boss, -1 , 2 , SkillTalk[ 1 ] , 2 )	--BOSS廣播施放地縛水壓
		end
		
		--E 真空旋渦 + 致命水壓
		if BossTime % SkillEtime == 0 then
			while ReadRoleValue( Boss , EM_RoleValue_SpellMagicID ) ~= 0 do	--有沒有正在施放技能
				sleep(2)	end
			--Say( Boss , "---- SkillE ----" )
			local SkillECastTime = 5	--致命水壓的唱咒表演秒數
			local SkillECastFX = 500059	--致命水壓的唱咒表演特效
			if Lua_PercentHP( Boss ) <= IntoP2HP then	--如果進入P2，改變真空漩渦數量，以及致命水壓的唱咒時間
				WhirlpoolCount = 1
				SkillECastTime = 8
			else
				WhirlpoolCount = 2
				SkillECastTime = 10
			end
				
			for I = 0 , WhirlpoolCount - 1 do
				local RandNumber = RandRange( 1 , 3 )
				local RandFlagID = I + 3 * ( RandNumber - 1 )	--隨機旗標位置
				WhirlpoolTable[ I ] = CreateObjByFlag( WhirlpoolID , WhirlpoolFlag , RandFlagID , 1 ) --產生一枚隱形物件在隨機旗標位置
				SetModeEx( WhirlpoolTable[ I ], EM_SetModeType_Fight, false ) --不可攻擊
				SetModeEx( WhirlpoolTable[ I ], EM_SetModeType_Searchenemy, false ) --不會索敵
				SetModeEx( WhirlpoolTable[ I ], EM_SetModeType_Strikback , false ) --不會反擊
				SetModeEx( WhirlpoolTable[ I ], EM_SetModeType_Mark , false ) --不可點選
				SetModeEx( WhirlpoolTable[ I ], EM_SetModeType_NotShowHPMP, false ) --不顯示血條
				SetModeEx( WhirlpoolTable[ I ] , EM_SetModeType_HideName , false ) --不顯示名稱
				AddToPartition( WhirlpoolTable[ I ] , RoomID )
				AddBuff( WhirlpoolTable[ I ] , BuffID , 0 , -1 ) --將真空旋渦特效光環施放在隱形物件上
			end
			ScriptMessage( Boss , -1 , 2 , SkillTalk[ 2 ] , 2 )	--BOSS廣播施放地縛水壓
			
			--由於致命水壓施展法術集合會有機率施放失敗，所以改用Script表演的方式來做表演
			SetModeEx( Boss , EM_SetModeType_Fight , false )	--不可攻擊
			SetModeEx( Boss , EM_SetModeType_Move , false )	--不會移動
			PlayMotionEX( Boss , ruFUSION_ACTORSTATE_CAST_BEGIN , ruFUSION_ACTORSTATE_CAST_LOOP )	--施展唱咒循環
			AddBuff( Boss , SkillECastFX , 0 , -1 )	--播放唱咒特效
			sleep( SkillECastTime * 10 )	--唱咒表演時間
			PlayMotion( Boss , ruFUSION_ACTORSTATE_CAST_END )	--結束施展循環
			CancelBuff( Boss , SkillECastFX )	--結束唱咒特效
			SysCastSpellLV( Boss , Boss , SkillE , 0 )
			PlayMotion( Boss , ruFUSION_ACTORSTATE_CAST_SP02 )	--播放施展技能動作
			SetModeEx( Boss , EM_SetModeType_Fight , true )	--不可攻擊
			SetModeEx( Boss , EM_SetModeType_Move , true )	--不會移動
		end

		--進入P2階段，增加2枚窒息水壓
		if Lua_PercentHP( Boss ) <= IntoP2HP and P2SkillBFlag == 0 then
			P2SkillBFlag = 1
			--Say( Boss , "---- P2 SkillB ----" )
			RangePlayerTable = LUA_YOYO_RangePlayerNotGM_EX( Boss , 2000 , true ) --抓取自己距離2000的所有玩家，排除GM
			
			if #RangePlayerTable >= 2 then	--區域內玩家數量 >= 2人
				for I = 1 ,  2 do
					AddBuff( RangePlayerTable[ I ] , SkillB_DeBuffTable[ I + 3 ] , PowerLv , -1 )
				end
		
			elseif #RangePlayerTable == 1 then	--區域內只有1名玩家
				for I = 1 ,  2 do
					AddBuff( RangePlayerTable[ 1 ] , SkillB_DeBuffTable[ I + 3 ] , PowerLv , -1 )	--清單第1位共要承受3發窒息水壓
				end

				else	--Say( Boss , "SkillB No Player... (Test Message)" )
			end
			ScriptMessage( Boss, -1 , 2 , SkillTalk[ 3 ] , 2 )	--BOSS廣播進入P2階段
		end
		
		--檢查場上窒息水壓數量是否足夠
		RangePlayerTable = LUA_YOYO_RangePlayerNotGM_EX( Boss , 2000 , true ) --抓取自己距離2000的所有玩家，排除GM
		local PressureBuffFlag = { 0 , 0 , 0 , 0 , 0 }	--用來記錄場上窒息水壓旗標的陣列

		for I = 1 , #RangePlayerTable do	--將場上窒息水壓的旗標登記至陣列中
			for J = 1 , #SkillB_DeBuffTable do
				if CheckBuff( RangePlayerTable[ I ] , SkillB_DeBuffTable[ J ] ) == true then
					PressureBuffFlag[ J ] = 1
				end
			end
		end
		
		for I = 1 , #PressureBuffFlag do
			if PressureBuffFlag[ I ] == 0 then	--若窒息水壓數量不足，則再補上給範圍內最近的玩家
				if I > 3 then	--進入P2時才檢查4、5號旗標
					if Lua_PercentHP( Boss ) <= IntoP2HP then
						AddBuff( RangePlayerTable[ 1 ] , SkillB_DeBuffTable[ I ] , PowerLv , -1 )
					end
				else
					AddBuff( RangePlayerTable[ 1 ] , SkillB_DeBuffTable[ I ] , PowerLv , -1 )
				end
			end
		end
		
	end
end
----------------------------------------------------------------------------
--↓Boss狂暴計數器與狂暴狀態
----------------------------------------------------------------------------
function YOYO_Zone27D_Boss3_ViolentTimer()
	local Boss = OwnerID()
	local ZoneID = ReadRoleValue( Boss , EM_RoleValue_ZoneID )	--副本難度
	local ViolentBuff = 502107	--狂暴法術編號
	local BossTimer = 0	--BOSS計數器
	local ViolentTime = 480	--BOSS狂暴的時間(8分鐘)
	local ViolentFlag = 0	--檢查狂暴是否已施展過的旗標
	local SkillTalk = "[SC_107834_09]" 	--BOSS狂暴的對話

	if( ZoneID == 158 ) then ViolentTime = 360; end
	if( ZoneID == 159 ) then return end

	while true do
		Sleep(10)
		BossTimer = BossTimer + 1
		--狂暴
		if BossTimer > ViolentTime and ViolentFlag == 0 then
			ViolentFlag = 1
			AddBuff( Boss , ViolentBuff , 0 , -1 )
			ScriptMessage( Boss, -1 , 2 , SkillTalk , 2 )	--BOSS廣播進入狂暴
		end
	end
end
----------------------------------------------------------------------------
--↓Boss脫離戰鬥後清場
----------------------------------------------------------------------------
function YOYO_Zone27D_Boss3_Clearance()
	local CtrlCentral = OwnerID()	--中央控制器
	local RoomID = ReadRoleValue( CtrlCentral , EM_RoleValue_RoomID )	--副本房層數
	local SkillA_DeBuff = 501945	-- 黏稠水壓 (狀態)
	local SkillB_DeBuffTable = { 500300 , 500301 , 500302 , 500303 , 500304 }	-- 窒息水壓 (狀態)
	local SkillD_DeBuff = 500672 --地縛水壓 (定身狀態)
	local WhirlpoolID = 103372	--真空旋渦物件
	
	local PlayerList = LUA_YOYO_GetAllPlayer( RoomID ) --列出場上的所有玩家編號
	for I = 1 , #PlayerList do
		CancelBuff( PlayerList[ I ] , SkillA_DeBuff ) --清除黏稠水壓
		CancelBuff( PlayerList[ I ] , SkillD_DeBuff ) --清除地縛水壓
		for J = 1 , #SkillB_DeBuffTable do
			CancelBuff( PlayerList[ I ] , SkillB_DeBuffTable[ J ] ) --清除窒息水壓
		end
	end
	
	local WhirlpoolList = LUA_YOYO_GetSpecificNPC( RoomID , WhirlpoolID )	--取出場上所有的真空旋渦物件
	for I = 1 , #WhirlpoolList do
		DelObj( WhirlpoolList[ I ] )	--清除真空旋渦
	end
end
----------------------------------------------------------------------------
--↓窒息水壓的傳染機制
----------------------------------------------------------------------------
function YOYO_Zone27D_Boss3_SkillB( Pieces )
	local Oneself = OwnerID()	--自己
	local ZoneID = ReadRoleValue( Oneself , EM_RoleValue_ZoneID )	--副本難度
	local PowerLv	--副本難度對應的技能等級
	if ZoneID == 159 then	PowerLv = 0	--簡單 159
	elseif ZoneID == 158 then	PowerLv = 1	--普通 158
	else	PowerLv = 2	end	--困難 157
	
	local PressureBuff = { 500300 , 500301 , 500302 , 500303 , 500304 }	--窒息水壓
	local SuffocationBuff = 500120	--窒息

	local _EffectiveRange = 30;--抓取自己距離30的所有玩家	131202 K.J. Aris
	if ( ReadRoleValue( Oneself , EM_RoleValue_IsDead ) == 1 ) then--若玩家死亡  則選擇更大的範圍傳遞 131202 K.J. Aris
		_EffectiveRange = 300;--131202 K.J. Aris
	end--131202 K.J. Aris

	local RangePlayerTable = LUA_YOYO_RangePlayerNotGM_EX( Oneself , _EffectiveRange , true ) --抓取自己距離30的存活玩家，排除GM--702774
	local RangePlayerDisTable = {}
	
	if #RangePlayerTable ~= 0 then
		for I = 1 , #RangePlayerTable do
			RangePlayerDisTable[ I ] = GetDistance( Oneself , RangePlayerTable[ I ] ) --取得附近玩家清單中所有玩家的距離
		end
		RangePlayerTable , RangePlayerDisTable = LUA_YOYO_Sequence( RangePlayerTable , RangePlayerDisTable , 0 )	--依距離遞增排序
		
		local _selectedTarget = RangePlayerTable[ 1 ];--131202 K.J. Aris
		if ( ReadRoleValue( Oneself , EM_RoleValue_IsDead ) == 1 ) then--若目標玩家死亡  則重新判斷 131202 K.J. Aris
			YOYO_Zone27D_Boss3_SkillB( Pieces );
			DebugMsg( 0 , 0 , "Target is dead !!" );
			return
		end

		AddBuff ( RangePlayerTable[ 1 ] , PressureBuff[ Pieces ] , PowerLv , -1)	--給予距離自己最近的目標窒息水壓狀態
		CancelBuff( Oneself , PressureBuff[ Pieces ] )	--移除自己身上的窒息水壓狀態
		AddBuff ( Oneself , SuffocationBuff , 0 , 30)	--給予距離自己窒息狀態
	else
		--Say( Oneself , "Nobody Nearby... (Test Message)" )
		--CancelBuff( Oneself , PressureBuff[ Pieces ] )	--移除自己身上的窒息水壓狀態--131202 K.J. Aris
		return
	end
end
----------------------------------------------------------------------------
--↓地縛水壓的範圍隨機點人機制
----------------------------------------------------------------------------
function YOYO_Zone27D_Boss3_SkillD()
	local Boss = OwnerID()	--王自己
	local ZoneID = ReadRoleValue( Boss , EM_RoleValue_ZoneID )	--副本難度
	local PowerLv	--副本難度對應的技能等級
	if ZoneID == 159 then	PowerLv = 0	--簡單 159
	elseif ZoneID == 158 then	PowerLv = 1	--普通 158
	else	PowerLv = 2	end	--困難 157
	
	local EarthboundSkill = 491550	--地縛水壓
	local TargetCount = 2	--命中人數
	local IntoP2HP = 40	--模式二的HP%數
	if Lua_PercentHP( Boss ) <= IntoP2HP then	TargetCount = 3	end	--若BossHP低於40%則命中人數變為3人
	local TargetPlayerTable = LUA_YOYO_RandPlayerNotGM( Boss , TargetCount , false ) --抓取仇恨清單中數名隨機玩家，並排除GM
	
	if #TargetPlayerTable >= TargetCount then	--若清單人數>=技能命中人數
		for I = 1 ,  TargetCount do
			SysCastSpellLv( Boss , TargetPlayerTable[ I ] , EarthboundSkill , PowerLv )
		end
		
	elseif #TargetPlayerTable == TargetCount - 1 then	--清單人數比技能命中人數少1人
		for I = 1 ,  #TargetPlayerTable do
			SysCastSpellLv( Boss , TargetPlayerTable[ I ] , EarthboundSkill , PowerLv )
		end
		SysCastSpellLv( Boss , TargetPlayerTable[ 1 ] , EarthboundSkill , PowerLv )	--清單第1位共要承受2發技能
		
	elseif #TargetPlayerTable == TargetCount - 2 and #TargetPlayerTable ~= 0 then	--清單人數比技能命中人數少2人
		for I = 1 ,  3 do
			SysCastSpellLv( Boss , TargetPlayerTable[ 1 ] , EarthboundSkill , PowerLv )	--清單第1位共要承受3發技能
		end

		else	--Say( Boss , "No Player... (Test Message)" )
	end
end
----------------------------------------------------------------------------
--↓致命水壓施展抓目標，施展完後刪除真空漩渦
----------------------------------------------------------------------------
function YOYO_Zone27D_Boss3_SkillE()
	local Boss = OwnerID()
	local RoomID = ReadRoleValue( Boss , EM_RoleValue_RoomID )	--副本房層數
	local FatalSkillID = 490045	--致命水壓一擊必殺
	local WhirlpoolID = 103372	--真空漩渦物件
	local TargetPlayerTable = KS_GetHateList( Boss , 4 )	--抓取仇恨清單中所有玩家，並排除GM
	
	if #TargetPlayerTable ~= 0 then
		for I = 1 ,  #TargetPlayerTable do
			SysCastSpellLv( Boss , TargetPlayerTable[ I ] , FatalSkillID , 0 )
		end
	else	--Say( Boss , "SkillE No Player... (Test Message)" )
	end
	
	sleep( 10 )
	local WhirlpoolList = LUA_YOYO_GetSpecificNPC( RoomID , WhirlpoolID ) --取出場上所有的真空漩渦物件
	for Count = 1 , #WhirlpoolList do
		DelObj( WhirlpoolList[Count] ) --清除真空漩渦
	end
	
end
----------------------------------------------------------------------------
--↓致命水壓命中檢查
----------------------------------------------------------------------------
function YOYO_Zone27D_Boss3_SkillEJudge()
	local Player = TargetID()
	local WhirlpoolBuff = 500055	--真空漩渦狀態
	if CheckBuff( Player , WhirlpoolBuff ) == true then
		return false
	else
		return true
	end
end
----------------------------------------------------------------------------
--↓清除狀態：地縛水壓 (測試用)
----------------------------------------------------------------------------
function YOYO_Zone27D_Boss3_TestCancelBuff()
	local Player = OwnerID()
	local EarthboundBuff = 500672 --地縛水壓
	CancelBuff( Player , EarthboundBuff )
end