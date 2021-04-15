
function LuaI_AI_DeadRISE()
	SetPlot( OwnerID() ,"Dead" , "AI_DeadRISE" , 0 )
end

function AI_DeadRISE()-- 死亡復甦
	PlayMotion ( OwnerID() , ruFUSION_ACTORSTATE_DYING )
	Sleep(10)
	Say( OwnerID() , "Help! I Want Not To Die!!!")
	PlayMotion ( OwnerID() , ruFUSION_ACTORSTATE_REVIVING )
	Sleep(10)
	PlayMotion ( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_IDLE0 )
	return false
end

function AI_DeadCry()	-- 死亡遺言
	Say( OwnerID() , "Believe! I'll Be Back!!!")
end

function AI_DeadChange( Monster )	-- 死亡變身
	local Change = LuaFunc_CreateObjByObj ( Monster , OwnerID() )
end

--================================================================================================================
-- 怪物公用函式
--================================================================================================================

function CallMonsterNORepeat( Owner, Target, FunctionName )
	if ( CheckFlag( Target , 540841) == true ) then
		-- ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_MONSTERNOREPEAT") , 0 )	-- 禁止重複叫怪！！！
	else
		SetFlag( Target , 540841, 1 )
		BeginPlot( Owner , FunctionName , 0)	-- 觸發之後隨機出現食火夜妖的陷阱			
	end
end

function delNRFlag( Target )
	SetFlag( Target , 540841 , 0 )
	ScriptMessage( OwnerID(), OwnerID(), 0, "NoRepeatFlag is Deleted" , 0 )	-- 刪除禁止重複叫怪旗標
end

function CreateMonsterByFlagBatch( MonsterID, TotalMonsterNum, FlagID, FlagStart, MonsterNum, RoomID )
-- 要產生在旗子的怪物ID
-- 總共要產生的怪物數量
-- 怪物要產生的旗子ID
-- 產生怪物在旗子的起始位置（會按照起始位置，照總數量依序產生）
-- 一個旗子位置產生的怪物數量
-- 怪物產生的空間ID
	local MonsterGroup = {}
	for i = 1, TotalMonsterNum do
		MonsterGroup[i] = CreateObjByFlag( MonsterID, FlagID, FlagStart, MonsterNum )
		AddToPartition( MonsterGroup[i] , RoomID )
		FlagStart = FlagStart + 1
		Sleep( 1 )
	end

	return MonsterGroup

end

function CreateMonsterByBOSSBatch( MonsterID, BOSSID, RangeX, RangeZ )
	local Obj = Role:new( BOSSID)

	local BaseX = Obj :X()
 	local BaseY = Obj :Y()
 	local BaseZ = Obj :Z()
	local BaseDir = Obj:Dir()
	local BaseRoom = Obj:RoomID()

	local MonsterGroup = nil

	MonsterGroup = CreateObj( MonsterID, BaseX + RangeX, BaseY, BaseZ + RangeZ, BaseDir, 1 )
	AddToPartition( MonsterGroup , BaseRoom )

	return MonsterGroup
end

function SetMonsterAttack( MonsterGroup, AttackPlayer )
	for i = 1, table.getn( MonsterGroup ) do
		SetAttack( MonsterGroup[i] , AttackPlayer )
		Sleep( 1 )
	end

end

function MonsterTalkRND( MonsterID, TalkString )

	local TalkGroup = MonsterTalkFormat( TalkString )
	local i = 0

	local TalkRND =  Rand( 99 ) + 1	-- 產生 1~100 的亂數
	    if ( TalkRND >  0 and TalkRND <= 10 ) then
		i = 1
	elseif ( TalkRND > 10 and TalkRND <= 20 ) then
		i = 2
	elseif ( TalkRND > 20 and TalkRND <= 30 ) then
		i = 3
	elseif ( TalkRND > 30 and TalkRND <= 40 ) then
		i = 4
	elseif ( TalkRND > 40 and TalkRND <= 50 ) then
		i = 5
	elseif ( TalkRND > 50 and TalkRND <= 60 ) then
		i = 6
	elseif ( TalkRND > 60 and TalkRND <= 70 ) then
		i = 7
	elseif ( TalkRND > 70 and TalkRND <= 80 ) then
		i = 8
	elseif ( TalkRND > 80 and TalkRND <= 90 ) then
		i = 9
	elseif ( TalkRND > 90 and TalkRND <= 100 ) then
		i = 10
	end

	local GetTalkString = TalkGroup[i]
	if ( GetTalkString ~= nil ) then
		Say ( MonsterID , GetTalkString )
	end
end

function MonsterTalkFormat( MonsterTalkGroup )
	--local MonsterTalkGroup = GetString("MT_EATFIRE1")
	local MonsterTalk = {}

	for w in string.gfind( MonsterTalkGroup , "& " ) do 
		local i , j = string.find( MonsterTalkGroup , "& " )
		if ( MonsterTalkGroup ~= nil ) then
			table.insert( MonsterTalk , string.sub( MonsterTalkGroup , 1 , i - 1 ) )
		end
		MonsterTalkGroup = string.sub( MonsterTalkGroup , j + 1 , -1 )
		--Say( OwnerID(), MonsterTalkGroup )
	end

	if ( MonsterTalkGroup ~= nil ) then
		table.insert( MonsterTalk , MonsterTalkGroup )		-- 補最後一個
	end

	--for y = 1, table.getn( MonsterTalk ) do
	--	Say( OwnerID(), MonsterTalk[y] )
	--end

	return MonsterTalk
end

--function MonsterBornYell( MonsterID, MonsterBornYellContent )
--	local MonsterBornYell = MonsterTalk( MonsterBornYellContent )
--	Say ( MonsterID , MonsterBornYell )
--	return true
--end

function MonsterDeadCrySetPlot( MonsterID,  MonsterDeadCryfunctionName )
	SetPlot( MonsterID ,"Dead" , MonsterDeadCryfunctionName , 0 )
end

--function MonsterDeadCry( MonsterID, MonsterDeadCryContent )
--	local MonsterDeadCry = MonsterTalk( MonsterDeadCryContent )
--	Say ( MonsterID , MonsterDeadCry )
--	return true
--end

function MonsterLivingTime( Time )		-- Time 物件存在的最低時間
	if ( Time == nil ) then
		Time = 3000
	end
	Sleep(Time)
	while 1 do
		Sleep( 1 )
		if ( ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID ) ~= 0 ) then 
			Sleep( 60 )	-- 六秒檢查一次	
		else
			-- Say( OwnerID(), "It's time to GO, BYEBYE!!" )
			DelObj( OwnerID() )
			break		
		end
		Sleep( 1 )
	end

	return true
end

function MagicRND( Owner, Target, MagicGroup, MagicLV )
	local MagicID = 0
	local i = 0

	local MagicRND =  Rand( 99 ) + 1	-- 產生 1~100 的亂數
	    if ( MagicRND >  0 and MagicRND <= 10 ) then
		i = 1
	elseif ( MagicRND > 10 and MagicRND <= 20 ) then
		i = 2
	elseif ( MagicRND > 20 and MagicRND <= 30 ) then
		i = 3
	elseif ( MagicRND > 30 and MagicRND <= 40 ) then
		i = 4
	elseif ( MagicRND > 40 and MagicRND <= 50 ) then
		i = 5
	elseif ( MagicRND > 50 and MagicRND <= 60 ) then
		i = 6
	elseif ( MagicRND > 60 and MagicRND <= 70 ) then
		i = 7
	elseif ( MagicRND > 70 and MagicRND <= 80 ) then
		i = 8
	elseif ( MagicRND > 80 and MagicRND <= 90 ) then
		i = 9
	elseif ( MagicRND > 90 and MagicRND <= 100 ) then
		i = 10
	end
	
	MagicID = MagicGroup[i]
	if ( MagicID ~= nil ) then
		-- Say( Owner, MagicID )
		if ( MagicLV == nil ) then
			CastSpell( Owner , Target , MagicID )	-- 陷阱傷害
		else
			CastSpellLV( Owner , Target , MagicID,  MagicLV )
		end
	end
end

function CallMonsterAtFightStart( Player , AttackTarget , MonsterID , MonsterNumber , PlayerTalk )

	local X = { 10 , 10 , -10 , -10 , 15 , 15 , -15 , -15  }
	local Z = { 20 , -20 , 20 , -20 , 30 , -30 , 30 , -30 }
	local FTM = "NoCall"	-- 戰鬥開始叫怪

	local Monster = {}
	for i = 1, MonsterNumber do
		Monster[i] = CreateMonsterByBOSSBatch( MonsterID, Player , X[i] , Z[i] )
	end
	FTM = "Called"			-- 作記號，讓怪只出現一次

	if ( PlayerTalk ~= nil ) then
		Say( Player , PlayerTalk )
	end

	local MonsterAttack = SetMonsterAttack( Monster , AttackTarget )

	return FTM, Monster
	
end

function CallMonsterForRecovery( Player , HPLimit , HPMonsterID , HPMagicID , KillAfterRecovery , PlayerTalk , MonsterNumber , MonsterTalk )

	local NowHP = ReadRoleValue( Player , EM_RoleValue_HP )
	local MaxHP = ReadRoleValue( Player , EM_RoleValue_MaxHP )
	local HPPercent = NowHP / MaxHP
	local X = { -30 , -30 }
	local Z = { 30 , -30 }
	local HPM = "NoCall"	-- 血沒了叫怪補血
	local HPMonster = {}
	--Say( Player , "HP = "..(HPPercent*100).."%" )

	if (  HPPercent  <= HPLimit ) then
		HPM = "Called"			-- 作記號，讓怪只出現一次
		if ( PlayerTalk ~= nil ) then
			Say( Player , PlayerTalk )
		end
		Sleep( 10 )
		for i = 1 , MonsterNumber do
			HPMonster[i] = CreateMonsterByBOSSBatch( HPMonsterID , Player , X[i] , Z[i] )
		end
		for i = 1 , MonsterNumber do
			if ( MonsterTalk ~= nil ) then
				Say( HPMonster[i] , MonsterTalk  )
			end
			CastSpell( HPMonster[i] , Player , HPMagicID )		-- 黑暗契約：恢復HP 60%
		end
		Sleep( 70 )
		for i = 1 , MonsterNumber do
			-- 補血成功就消失
			if  ( KillAfterRecovery == "Yes" )	 then		DelObj( HPMonster[i] )	end
		end
	end

	return HPM

end




--呼叫範圍怪物

function Lua_DW_CallHelper()--持續迴圈版本
	while true do
		sleep(20)
		if	ReadRoleValue(OwnerID() , EM_RoleValue_IsAttackMode) == 1	then
			Lua_DW_CallRange( ReadRoleValue(OwnerID(),EM_RoleValue_PID) )
		end
	end
end

function Lua_DW_CallHelper_Now()--只呼叫一次版本
	Lua_DW_CallRange( ReadRoleValue(OwnerID(),EM_RoleValue_PID) )
end

function Lua_DW_CallRange(PID)
	local NPC = SearchRangeNPC( OwnerID() , (PID+1)*100)
	for i = 0 , table.getn(NPC)-1 do
		if	ReadRoleValue(NPC[i] , EM_RoleValue_IsAttackMode) == 0	and
			ReadRoleValue(NPC[i],EM_RoleValue_Y)/10 == ReadRoleValue(OwnerID(),EM_RoleValue_Y)/10 	then
			WriteRoleValue(NPC[i],EM_RoleValue_PID,ReadRoleValue(NPC[i],EM_RoleValue_Y)/10)
			SetAttack( NPC[i] , ReadRoleValue(OwnerID(),EM_RoleValue_AttackTargetID))
		end
	end
end

---必殺術

function Lua_DW_MustDead()
	NPCDead(TargetID(),OwnerID())
end