--==================================
--			熊相關
--==================================

function FN_Xmas2012_Bear()	--熊的物件產生劇情
	local Bear = OwnerID()

	AddBuff(Bear, 507120, 0, -1)
end

function FN_Xmas2012_Bear_check()	--Bear的check劇情
	local Bear = OwnerID()
	local Bonfire = TargetID()

	if ReadRoleValue( Bonfire, EM_RoleValue_OrgID ) == 117698 and ReadRoleValue( Bonfire, EM_RoleValue_Register1 ) == 1 and ReadRoleValue( Bear, EM_RoleValue_Register1 ) == 0 then
		return true
	else
		return false
	end
end

function FN_Xmas2012_BearAction()	--熊脾氣掃到火堆物件
	local Bear = OwnerID()
	local Bonfire = TargetID()
	local ActionCheck = ReadRoleValue(Bear, EM_RoleValue_Register1 )
	
	if ActionCheck == 0 then
		MoveToFlagEnabled( Bear, false )
		CallPlot( Bear, "FN_Xmas2012_BearPlot", Bonfire )
		WriteRoleValue( Bear, EM_RoleValue_Register1, 1 )
	end
end

function FN_Xmas2012_BearPlot( Bonfire )
	local Bear = OwnerID()
	local x,y,z,dir = DW_Location( Bonfire )

	Sleep( (Move( Bear, x, y, z ) + 5) )
	WriteRoleValue( Bonfire, EM_RoleValue_Register1, 2 )	--把火堆熄滅
	PlayMotion( Bear, 37 )
	WriteRoleValue( Bear, EM_RoleValue_Register1, 0 )
	DesignLog( Bear , 114321 , "Bear hate Fire!" )
	Sleep( 10 )
	MoveToFlagEnabled( Bear, true )
end

--==================================
--			兔子相關
--==================================

function FN_Xmas2012_Rabbit()	--兔的物件產生劇情
	local Rabbit = OwnerID()

	AddBuff( Rabbit, 507239, 0, -1)
	SetPlot( Rabbit, "touch", "FN_Xmas2012_RabbitTouch", 50 )
end

function FN_Xmas2012_Rabbit_check()	--Rabbit的check劇情
	local Rabbit = OwnerID()
	local Player = TargetID()

	if ReadRoleValue( Rabbit, EM_RoleValue_Register1 ) == 0 and ReadRoleValue( Player, EM_RoleValue_VOC ) ~= 0 then
		return true
	else
		return false
	end
end

function FN_Xmas2012_RabbitAction()
	local Rabbit = OwnerID()
	local Player = TargetID()
	local ActionCheck = ReadRoleValue(Rabbit, EM_RoleValue_Register1 )	--兔子追人中判定

	if ActionCheck == 0 then
		MoveToFlagEnabled( Rabbit, false )
		CallPlot( Rabbit, "FN_Xmas2012_RabbitPlot", Player )
		WriteRoleValue( Rabbit, EM_RoleValue_Register1, 1 )
	end
end

function FN_Xmas2012_RabbitPlot(Player)
	local Rabbit = OwnerID()
	local RunTimeCount = 0
	while true do
		if ReadRoleValue(Rabbit, EM_RoleValue_Register2) == 1 then	--偵測兔子被擊退
			WriteRoleValue( Rabbit, EM_RoleValue_Register2, 0 )
			break
		end
		if CheckDistance( Rabbit, Player, 35 ) == true then
			SysCastSpellLV( Rabbit, Player, 491672, 0 )
			PlayMotion( Rabbit, 37 )
			DesignLog( Player , 1143231 , "Watch out da Rabbit!" )
			break
		end
		if RunTimeCount >= 100 then
			break
		end
		--
		local x,y,z,dir = DW_Location( Player )
		local RunTime = Move( Rabbit, x, y, z )
		Sleep( RunTime )
		RunTimeCount = RunTimeCount + RunTime
	end
	MoveToFlagEnabled( Rabbit, true )
	Sleep( 100 )									--兔子重新開始允許追人的CD
	WriteRoleValue( Rabbit, EM_RoleValue_Register1, 0 )
end

function FN_Xmas2012_RabbitTouch()
	local Player = OwnerID()
	local Rabbit = TargetID()
	local DelayTime = ReadRoleValue( Rabbit, EM_RoleValue_MoveDelay)
	DebugMsg(0,0,"DelayTime="..DelayTime)
	if ReadRoleValue( Rabbit, EM_RoleValue_Register3 ) == 0 then
		WriteRoleValue( Rabbit, EM_RoleValue_Register3, 1 )	--控制兔子不要被重複touch的開關
		WriteRoleValue( Rabbit, EM_RoleValue_Register2, 1 )	--偵測兔子被擊退
		AdjustFaceDir( Rabbit, Player, 0 )
		PlayMotion( Player, 37 )
		SysCastSpellLV( Player, Rabbit, 498627, 0 )
		if Rand(4) == 0 then
			ScriptMessage( Player, Player, 2, "[FN_XMAS2012_RABBITDROP]", 0 )
			GiveBodyItem( Player, 205807, 1 )
		end
		DesignLog( Player , 1143232 , "Kick da Rabbit!" )
		--
		CancelBuff( Rabbit, 507239 )
		WriteRoleValue( Rabbit, EM_RoleValue_Register3, 0 )
		Sleep(100)							--兔子被重複擊退的CD
		AddBuff( Rabbit, 507239, 0, -1 )
		WriteRoleValue( Rabbit, EM_RoleValue_Register3, 0 )
	end
end

--==================================
--			5大靈獸
--		Register1	判斷打火石擊中1 未擊中0
--		Register2	判斷靈獸被擊中次數
--		Register3	判斷靈獸被擊中上限
--		Register4	Boss判斷有沒有被擊中
--		Register5	在Boss身上紀錄雪境之口
--		Register6	紀錄靈獸是否已經倒下 1=倒下 0=還沒
--		Register9	死亡時產生的特效物件的ID
--		Register10	讓打火石的使用劇情辨識的特殊值
--==================================
function FN_Xmas2012_Soul_SkillCheck()
	local Player = TargetID()
	if ReadRoleValue( Player, EM_RoleValue_VOC ) == 0 then
		return false
	end
end

function FN_Xmas2012_Soul_Hit(Soul)
	--WriteRoleValue( Soul, EM_RoleValue_Register1, 1 )
	
	local HitNow = ReadRoleValue( Soul, EM_RoleValue_Register2 )
	local HitMax = ReadRoleValue( Soul, EM_RoleValue_Register3 )
	if (HitNow+1) >= HitMax then					--擊倒動物之靈
		MoveToFlagEnabled( Soul, false )
		StopMove( Soul, true )
		SetModeEx( Soul  , EM_SetModeType_Move, false )	--移動
		PlayMotion( Soul, ruFUSION_ACTORSTATE_DYING )	--播放死亡動作
		SetDefIdleMotion( Soul, ruFUSION_MIME_IDLE_DEAD )	--保持死亡動作
		WriteRoleValue( Soul, EM_RoleValue_Register6, 1 )		--紀錄 靈獸已經被擊倒
		BeginPlot( Soul, "FN_Xmas2012_Soul_down", 0 )
	else
		local SoulOrgID = ReadRoleValue( Soul, EM_RoleValue_OrgID )
		if SoulOrgID ~= 102986 and SoulOrgID ~= 102806 then	--牛跟鹿排除
			local SoulSkillTable = { [101999]=490821; [102645]=490822; [102916]=490823}
			StopMove( Soul, true )
			CastSpell( Soul, Soul, SoulSkillTable[SoulOrgID] )
		end
		--
		if SoulOrgID == 102986 then WriteRoleValue( Soul, EM_RoleValue_Register4, 1 ) end	--Boss特別判斷用
		WriteRoleValue( Soul, EM_RoleValue_Register2, (HitNow+1) )
	--	Say( Soul, "HitNow="..(HitNow+1) )
	end
	-- 扣血的表演
	local MaxHp = ReadRoleValue( Soul, EM_RoleValue_MaxHP )
	local X = MaxHp/HitMax
	local Y = HitMax - (HitNow+1)
	WriteRoleValue( Soul, EM_RoleValue_HP, X*Y )
end

function FN_Xmas2012_Soul_touch()
	local Player = OwnerID()
	local Soul = TargetID()
	local SoulOrgID = ReadRoleValue( Soul, EM_RoleValue_OrgID )
	local Flag = ReadRoleValue( Soul, EM_RoleValue_Register10 )
	local Title = { [547192]=530945, [547193]=530944, [547194]=530943, [547195]=530946, [547196]=530947 }

	if CheckFlag( Player, Flag ) == true then
		ScriptMessage( Player, Player, 2, "[FN_XMAS2012_SOUL01]", 0 )
	elseif SoulOrgID == 102986 then
		local SoulFlag = { 547192, 547193, 547194, 547195 }
		for i = 1, 4 do					-- 偵測玩家是否擁有4靈獸的 KeyItem
			if CheckFlag( Player, SoulFlag[i] ) == false then
				ScriptMessage( Player, Player, 2, "[FN_XMAS2012_SOUL08]", 0 )
				return
			end
		end
		SetFlag( Player, Flag, 1 )
		GiveBodyItem( Player, Title[Flag], 1 )
	else
		ScriptMessage( Player, Player, 2, "[FN_XMAS2012_SOUL02][$SETVAR1=".."["..SoulOrgID.."]".."]", 0 )
		SetFlag( Player, Flag, 1 )
		GiveBodyItem( Player, Title[Flag], 1 )
	end
end

function FN_Xmas2012_Soul_Creat()	--靈獸創造
	local Soul = OwnerID()
	local SoulOrgID = ReadRoleValue( Soul, EM_RoleValue_OrgID ) --101999 狼 102645鵰 102806牛 102916象 102986魂靈
	local SoulFlag = { [101999]=547192; [102645]=547193;  [102806]=547194; [102916]=547195; [102986]=547196 }
	local SoulHit = { [101999]=10; [102645]=10;  [102806]=10; [102916]=7; [102986]=25 }
--	Say(Soul, SoulFlag[SoulOrgID])
	WriteRoleValue( Soul, EM_RoleValue_Register10, SoulFlag[SoulOrgID] )	--寫入這個特殊值來讓打火石的使用劇情辨識這是靈獸 此值參照重要物品ID
	WriteRoleValue( Soul, EM_RoleValue_Register3, SoulHit[SoulOrgID] )	--寫入靈獸被擊中上限

	SetModeEx( Soul, EM_SetModeType_Fight , false )				--可砍殺攻擊

	AddBuff( Soul, 504340, 0, -1 )							--靈獸特效
	AddBuff( Soul, 505637, 0, -1 )							--非戰鬥不回血
end

function FN_Xmas2012_Soul_down()	--靈獸倒下
	local Soul = OwnerID()
	local RoomID = ReadRoleValue( Soul, EM_RoleValue_RoomID )
	local SE = CreateObjByObj( 120996, Soul )
	local MaxHp = ReadRoleValue( Soul, EM_RoleValue_MaxHP )
	local OrgID = ReadRoleValue( Soul, EM_RoleValue_OrgID )
	
	SetPlot( Soul, "touch", "FN_Xmas2012_Soul_touch", 30 )
	DesignLog( Soul , 120143 , "Kill Soul="..OrgID )

	Sleep(1200)
	if OrgID == 102986 then		-- 如果是BossSoul直接刪掉
		local SP = ReadRoleValue( BossSoul, EM_RoleValue_Register5 )	-- 讀取雪境之口
		SetPlot( SP, "touch", "FN_Xmas2012_SnowPortal_touch", 65 )	-- 重設雪境之口的觸碰劇情
		DelObj( SE )
		DelObj( Soul )
	else
		SetDefIdleMotion( Soul, ruFUSION_MIME_IDLE_STAND )			--重新站起來的動作
		MoveToFlagEnabled( Soul, true )						--重新開始巡邏
		SetModeEx( Soul  , EM_SetModeType_Move, true )	--移動
		Hide( Soul )									--隱藏
		DelObj( SE )									--刪除特效用的物件
		WriteRoleValue( Soul, EM_RoleValue_Register2, 0 )				--判斷被擊中次數歸0
		SetPlot( Soul, "touch", "", 0 )
		Sleep(9000)
		Show( Soul, RoomID )								--秀出來
		WriteRoleValue( Soul, EM_RoleValue_HP, MaxHp )				--把血量補滿
		WriteRoleValue( Soul, EM_RoleValue_Register6, 0 )				--紀錄 靈獸重新爬起來
	end
end

function FN_Xmas2012_SnowPortal_Creat()	--雪境之口 物件產生劇情
	local SP = OwnerID()
	SetPlot( SP, "touch", "FN_Xmas2012_SnowPortal_touch", 65 )
end

function FN_Xmas2012_SnowPortal_touch()	--雪境之口 觸碰事件
	local Player = OwnerID()
	local SP = TargetID()
	local RoomID = ReadRoleValue( SP, EM_RoleValue_RoomID )
	local SoulFlag = { 547192, 547193, 547194, 547195 }

	if CheckFlag( Player, 547196 ) == true then 	-- 偵測玩家是不是已經觸碰過Boss
		ScriptMessage( Player, Player, 2, "[FN_XMAS2012_SOUL07]", 0 )
		return
	end

	for i = 1, 4 do					-- 偵測玩家是否擁有4靈獸的 KeyItem
		if CheckFlag( Player, SoulFlag[i] ) == false then
			ScriptMessage( Player, Player, 2, "[FN_XMAS2012_SOUL03]", 0 )
			return
		end
	end
	--
	SetPlot( SP, "touch", "", 0 )					--在已經召喚了Boss的時候不給點
	ScriptMessage( Player, Player, 2, "[FN_XMAS2012_SOUL04]", 0 )
	--
	local BossSoul = CreateObjByObj( 102986, SP )
	SetPos( BossSoul, -11210, 715, -3511, 291 )
	SetRandMove( BossSoul, 100, 3, 60 )				--亂數移動
	WriteRoleValue( BossSoul, EM_RoleValue_Register5, SP )
	CallPlot( BossSoul, "FN_Xmas2012_BossSoul", 0 )
	AddToPartition(BossSoul , RoomID)
end

function FN_Xmas2012_BossSoul()		--Boss
	local BossSoul = OwnerID()
	local LiveTime = 180
	local FightTime = 0
	local CDTimeSkillAB = 5
	local PlayerSkillC
	local CDTimeSkillC = 0
	local CDTimeSkillD = 0
	local BossSkillTable = { [1]=490821; [2]=490822; [3]=490823}	--迴旋 音爆 震盪
	
	while true do
		local HitCheck = ReadRoleValue( BossSoul, EM_RoleValue_Register4 )
		if HitCheck == 1 then								--如果有被擊中
				FightTime = 8								--把進入戰鬥時間重置
--				LiveTime = 180							--把生存時間重置
		end
		--
		if FightTime > 0 then
			FightTime = FightTime - 1
			--隨選技能 迴旋/音爆
			if CDTimeSkillAB == 0 and HitCheck == 1 then
				local RandNum = DW_Rand( 2 )
				CastSpell( BossSoul, BossSoul, BossSkillTable[RandNum] )
				CDTimeSkillAB = 5
			elseif CDTimeSkillAB > 0 then
				CDTimeSkillAB = CDTimeSkillAB - 1
			end
			--大地震盪
			if CDTimeSkillC == 0 and HitCheck == 1 then
				local PlayerList = SearchRangePlayer( BossSoul, 125 )
				local RandNum = Rand( table.getn( PlayerList ) )
				PlayerSkillC = PlayerList[RandNum]
				CDTimeSkillC = 8
			elseif CDTimeSkillC > 0 then
				CDTimeSkillC = CDTimeSkillC - 1
				CastSpell( BossSoul, PlayerSkillC, BossSkillTable[3] )
			end
			--熄滅周圍火堆
			if CDTimeSkillD == 0 then
				CDTimeSkillD = 10
				local NPCList = SearchRangeNPC( BossSoul, 125 )
				for i = table.getn(NPCList), 0, -1 do
					if ReadRoleValue( NPCList[i], EM_RoleValue_OrgID ) == 117698 and ReadRoleValue( NPCList[i], EM_RoleValue_Register1 ) == 1 then
						WriteRoleValue( NPCList[i], EM_RoleValue_Register1, 2 )	--把火堆熄滅
					end
				end
				ScriptMessage( BossSoul, 0, 2, "[FN_XMAS2012_SOUL06]", 0 )
			 else
				CDTimeSkillD = CDTimeSkillD - 1
			end
		end
		--
		if LiveTime == 0 then								-- 生存時間為0
			local SP = ReadRoleValue( BossSoul, EM_RoleValue_Register5 )	-- 讀取雪境之口
			SetPlot( SP, "touch", "FN_Xmas2012_SnowPortal_touch", 65 )	-- 重設雪境之口的觸碰劇情
			ScriptMessage( BossSoul, 0, 2, "[FN_XMAS2012_SOUL05]", 0 )
			DelObj( BossSoul )
		else
			LiveTime = LiveTime - 1
		end
		--
		WriteRoleValue( BossSoul, EM_RoleValue_Register4, 0 )		--把擊中判定回復為0
		--
		Sleep(10)
	end
end

--==================================
--			雪境能量節點
--==================================
function FN_Xmas2012_SnowPoint()
	local Point = OwnerID()

	SetPlot( Point, "touch", "FN_Xmas2012_SnowPoint_touch", 20 )
--	SetModeEx( Point, EM_SetModeType_Strikback, false )		--反擊
--	SetModeEx( Point, EM_SetModeType_SearchenemyIgnore, false )	--被搜尋
--	SetModeEx( Point, EM_SetModeType_Obstruct, false )		--阻擋
--	SetModeEx( Point, EM_SetModeType_Mark, true )			--標記
	SetModeEx( Point, EM_SetModeType_Move, false )			--移動
	SetModeEx( Point, EM_SetModeType_Gravity, false )		--重力
	SetModeEx( Point, EM_SetModeType_AlignToSurface, false )	--貼地
--	SetModeEx( Point, EM_SetModeType_Searchenemy, false )		--索敵
--	SetModeEx( Point, EM_SetModeType_HideName, true )		--名稱
	SetModeEx( Point, EM_SetModeType_ShowRoleHead, false )	--頭像框
--	SetModeEx( Point, EM_SetModeType_Fight , false )			--可砍殺攻擊
--	SetModeEx( Point, EM_SetModeType_Drag , true )			--阻力
end

function FN_Xmas2012_SnowPoint_touch()
	local Player = OwnerID()
	local SnowPoint = TargetID()
	local Quest = ReadRoleValue( SnowPoint, EM_RoleValue_Register1 )
	if CheckAcceptQuest( Player, Quest ) == true then
		BeginCastBarEvent( Player, TargetID(), "[FN_XMAS2012_SNOWPOINT]", 20, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "FN_Xmas2012_SnowPoint_Plot" )
	else
		ScriptMessage( Player, Player, 2, "[FN_XMAS2012_SNOWPOINT_01]", 0 )
	end
end

function FN_Xmas2012_SnowPoint_Plot(Obj,CheckResult)
	local Player = OwnerID()
	local SnowPoint = TargetID()
	local Pid = ReadRoleValue( SnowPoint, EM_RoleValue_PID )

	if CheckResult > 0 then					--大於0是成功
		SetFlag( Player, Pid, 1 )
--	elseif CheckResult < 0 then 				--小於0是失敗
--		return
	end
	EndCastBar( Player, CheckResult )
end

function FN_Xmas2012_SnowPoint_Q421649()
	local player = TargetID()
	SetFlag( player, 547183, 0 )	--任務完成 移除前置條件
	SetFlag( player, 547323, 1 )	--FN添加的全勤獎判斷旗標
	DesignLog( Player , 421649 , "SnowPoint Q1 complete" )
end

function FN_Xmas2012_SnowPoint_Q421650()
	local player = TargetID()
	GiveBodyItem( player, 530941, 1 )
	SetFlag( player, 547184, 0 )	--任務完成 移除前置條件
	SetFlag( player, 547324, 1 )	--FN添加的全勤獎判斷旗標
	DesignLog( Player , 421650 , "SnowPoint Q2 complete" )
end

function FN_Xmas2012_SnowPoint_Q421651()
	local player = TargetID()
	GiveBodyItem( player, 530942, 1 )
	SetFlag( player, 547185, 0 )	--任務完成 移除前置條件
	SetFlag( player, 547325, 1 )	--FN添加的全勤獎判斷旗標
	DesignLog( Player , 421651 , "SnowPoint Q3 complete" )
end

--==================================
--			覆雪的寶箱
--==================================
function FN_Xmas2012_SnowTreasure_Creat()	--覆雪的寶箱
	local SnowTreasure = OwnerID()
	SetModeEx( SnowTreasure, EM_SetModeType_Mark, true )			--標記
	SetModeEx( SnowTreasure, EM_SetModeType_Obstruct, false )		--阻擋
	SetModeEx( SnowTreasure, EM_SetModeType_ShowRoleHead, false )	--頭像框
	SetPlot( SnowTreasure, "touch", "FN_Xmas2012_SnowTreasure_touch", 50 )
end

function FN_Xmas2012_SnowTreasure_touch()	--touch覆雪的寶箱
	local Player = OwnerID()
	local TrueID = ReadRoleValue( Player, EM_RoleValue_DBID )
	local SnowTreasure = TargetID()

	for y = 1, table.getn( Z358_Treasure[SnowTreasure] ) do	--這段是從全域變數的紀錄中，確認玩家在時間內有沒有開啟過這個Treasure
		if Z358_Treasure[SnowTreasure][y] == TrueID then
			ScriptMessage( Player, Player, 2, "[FN_XMAS2012_SNOWTREASURE01]", C_SYSTEM )
			return
		end
	end

	BeginCastBarEvent( Player, SnowTreasure, "[SC_GERMANY2_CONCERTO_05]", 20, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "FN_Xmas2012_SnowTreasure_Result" )
end

function FN_Xmas2012_SnowTreasure_Result(Obj,CheckResult)	--touch覆雪的寶箱
	local Player = OwnerID()
	local SnowTreasure = TargetID()

	if CheckResult > 0 then					--大於0是成功
		GiveBodyItem( Player, 724331, 1 )			--掉寶表

		local TrueID = ReadRoleValue( Player, EM_RoleValue_DBID )
		table.insert( Z358_Treasure[SnowTreasure], TrueID )	--玩家成功開啟Treasure，記到全域變數當中
--	elseif CheckResult < 0 then 				--小於0是失敗
--		return
		DesignLog( Player , 117199 , "Snow Treasure Open" )
	end
	EndCastBar( Player, CheckResult )
end
--==================================
--			雪境大秘寶
--==================================
function FN_Xmas2012_SnowOnePiece_Creat()
	local SnowOnePiece = OwnerID()
	SetModeEx( SnowOnePiece, EM_SetModeType_Mark, true )			--標記
	SetModeEx( SnowOnePiece, EM_SetModeType_ShowRoleHead, false )	--頭像框
	SetPlot( SnowOnePiece, "touch", "FN_Xmas2012_SnowOnePiece_touch", 50 )
	--
	AddBuff( SnowOnePiece, 507821, 0 ,-1 )
	--
	while true do
		local SnowPower = ReadRoleValue( SnowOnePiece, EM_RoleValue_Register1 )
		if SnowPower > 0 then WriteRoleValue( SnowOnePiece, EM_RoleValue_Register1, (SnowPower-1) ) end
		--
		Sleep( 70 )
	end
end	

function FN_Xmas2012_SnowOnePiece_touch()
	local Player = OwnerID()
	local SnowOnePiece = TargetID()
	local SnowPower = ReadRoleValue( SnowOnePiece, EM_RoleValue_Register1 )

	if CheckFlag( Player, 541882 ) == false then
		GiveBodyItem( Player, 724488, 1 )		--掉寶表
		GiveBodyItem( Player, 241481, 15 )
		SetFlag( Player, 541882, 1 )
		if (SnowPower+10) >= 100 then
			ScriptMessage( Player, -1, 1, "[FN_XMAS2012_SNOWONEPIECE3]", C_SYSTEM )
			WriteRoleValue( SnowOnePiece, EM_RoleValue_Register1, 0 )
			local AllFire = LuaFunc_SearchRoomNPCbyOrgID( SnowOnePiece , 117698 , 1)
			for i = 1, #AllFire do
				if ReadRoleValue( AllFire[i], EM_RoleValue_Register1 ) == 1 then
					WriteRoleValue( AllFire[i], EM_RoleValue_Register1, 2 )	--把火堆熄滅
				end
			end
		else
			WriteRoleValue( SnowOnePiece, EM_RoleValue_Register1, (SnowPower+10) )
			ScriptMessage( Player, -1, 0, "[FN_XMAS2012_SNOWONEPIECE1][$SETVAR1="..(SnowPower+10).."]", C_SYSTEM )
		end
		DesignLog( Player , 114941 , "Snow OnePiece Open" )
	else
		ScriptMessage( Player, Player, 3, "[FN_XMAS2012_SNOWONEPIECE2]", C_SYSTEM )
		return
	end
end