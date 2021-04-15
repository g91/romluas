function Lua_TC_TalkScript()
	LoadQuestOption( OwnerID() )
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_TC_JOINGAME]" , "Lua_TC_TalkScript2", 0 ) --我想報名
end
function Lua_TC_TalkScript2()
	local RoomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID)
	CloseSpeak( OwnerID() )
	if ChangeZone( OwnerID(), 354 ,RoomID , 2093, 13.4, 4636.5, 0) == true then
	end
end
function Lua_TC_SurvivalRange()	--放在教場內的一個隱形盒上面
	SetPlot(OwnerID(),"collision","Lua_TC_Survival_ReSet",200)
end

function Lua_TC_Survival_ReSet()
	local player = TargetID()
	--Say(OwnerID(),"StartGame")
	if CheckFlag( player  , 542748 ) == false then
		SetPlot(player,"collision","",0)
		BeginPlot(player,"Lua_TC_Survival",0)
	end
end

function Lua_TC_SurvivalPlay()
	local RoomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID)
	
	if CheckBuff( OwnerID() , 501570) == false then  --增加檢查判斷
		AddBuff(OwnerID() , 501570,0,-1);--然後給予BUFF
		
		DialogCreate( OwnerID() , EM_LuaDialogType_YesNo ,"[SC_TC_SURIVIVALREADY]")
		DialogSelectStr( OwnerID() , "[SC_GETTITLE_1]" );
		DialogSelectStr( OwnerID() , "[SC_CANCEL]" );
		if( DialogSendOpen( OwnerID() ) == false ) then 
			ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_FIXEQ_DATA_ERROR]",0)	
			--資料送出有問題
			return
		end
		for i = 0 , 1000 , 1 do
			Sleep( 1 );
			SelectID = DialogGetResult( OwnerID() );
			if ( SelectID ~= -2 ) and ( SelectID ~= -1 ) and i < 100 then
				if ( SelectID == 0 ) then
					DebugMsg( 0, RoomID ,"==== Start Game ====")
					BeginPlot(TargetID(),"Lua_TC_Survival",0)
					CancelBuff( OwnerID(), 501570 );--最後清除BUFF
					DialogClose( OwnerID() )
					break;
				elseif ( SelectID == 1 ) then
					CancelBuff( OwnerID(), 501570 );--最後清除BUFF
					DialogClose( OwnerID() )		
					break
				end
			elseif i == 1000 then
				CancelBuff( OwnerID(), 501570 );--最後清除BUFF
				DialogClose( OwnerID() )		
				break
			end
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	end	
end

function Lua_TC_Survival()
	local RoomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID)
	local FlagID = 780190	--定點生怪的旗子ID
	local Array = {}
	local Pass
	local HowMuch
	local Live =  true
	local EndClass = 1
	local Chest = 203256
	local MonsterID
	local AttackID = LuaS_TC_GetRangePlayer(RoomID,800)
	local PlayerLV = ReadRoleValue( AttackID , EM_RoleValue_LV  )  --取得玩家等級
	if PlayerLV <= 10 then
		MonsterID = 102267
	elseif PlayerLV <= 20 then
		MonsterID = 102268
	elseif PlayerLV <= 30 then
		MonsterID = 102269
	elseif PlayerLV <= 40 then
		MonsterID = 102270
	elseif PlayerLV <= 49 then
		MonsterID = 102271
	elseif PlayerLV <= 100 then
		MonsterID = 102272
	end
--	Say(AttackID,"AttackID")
--	AddBuff(AttackID,500535,0,-1)
	AddBuff(AttackID,503784,0,-1)
	StartClientCountDown ( AttackID, 15, 0, 0, 0, 1, "[SC_1V1PVP_COUNTDOWN]" )	--玩家Client顯示倒數15秒
	StartClientCountDown ( AttackID, 15, 0, 0, 1, 0, "[SC_1V1PVP_COUNTDOWN]" )	--玩家Client顯示倒數15秒
	for i = 1 , 15 do
		if CheckID(AttackID) == true then
		else
			SetPlot(OwnerID(),"Range","Lua_TC_SurvivalPlay",200)
			return
		end
		sleep(10)
	end
	ScriptMessage( OwnerID(),  -1, 1, "[SC_TC_GAMESTART]" , C_SYSTEM )
--第一關
	for i = 1, 10 do
		HowMuch = 1+((i-1)*2)
		DebugMsg( 0, RoomID ,"==== !! Stage "..i.." !! ====")
		local string = "[SC_TC_STAGE][$SETVAR1="..i.."]"

		if Live == true then
			ScriptMessage( OwnerID(),  -1, 1, string , C_SYSTEM )
			ScriptMessage( OwnerID(),  -1, 0, string , C_SYSTEM )
			ScriptMessage( OwnerID(),  -1, 1, "[SC_TC_NEXTSTAGE]" , C_SYSTEM )
			
			Array[i] = Lua_TC_Survival_CreateMonster( HowMuch ,  MonsterID , RoomID , AttackID , FlagID)	--生出怪物
			for i = 1 , table.getn(Array) do
				for j=1, table.getn(Array[i]) do
					if CheckID(Array[i][j]) == true then
						SetAttack( Array[i][j] , AttackID )
					end
				end
			end
			EndClass = i-1
			ClockOpen( AttackID , EM_ClockCheckValue_6  , 15 , 15 , 0  ,"Lua_Clockending"  , "Lua_Clockending" );--時間以秒算
			for i = 1 , 15 do	--15秒內檢查玩家是否死亡
				Pass = LuaS_TC_Survival_CheckIsDead(AttackID,RoomID)
				if Pass == true then
					Live = false
					break
				end
				sleep(10)
			end
		end
	end
--死亡！！！生寶箱
	DebugMsg( 0, RoomID ,"==== !! The End !! ====")
	if Live == false then
		for i = 1 , table.getn(Array) do
			for j=1, table.getn(Array[i]) do
				if CheckID(Array[i][j]) == true then
					DelObj(Array[i][j])
				end
			end
		end
		ClockClose(AttackID)--關閉時鐘
		if EndClass == 0 then
			DebugMsg( 0, RoomID ,"==== !! Try Again Ha!Ha! !! ===="..EndClass)
			ScriptMessage( OwnerID(),  -1, 1, "[SC_TC_YOUDEAD]" , C_SYSTEM )
			StartClientCountDown ( AttackID, 5, 0, 0, 0, 0, "[SC_TC_BACKTOROOM]" )	--玩家Client顯示倒數5秒
			Sleep(50)
			ChangeZone( AttackID, 354 , RoomID , 5121.3, 13.4, 2515.2, 269.9 )--傳回小房間
			SetFlag( AttackID  , 542748 , 1 )
--			SetPlot(OwnerID(),"collision","Lua_TC_Survival_ReSet",200 )-- 2012.04.10 新增，修正玩家使用公會校場重置券(206351)重新進入遊戲後，沒有劇情的問題。
		else
			ScriptMessage( OwnerID(),  -1, 1, "[SC_TC_YOUDEAD]" , C_SYSTEM )
--			AddRoleValue( AttackID , EM_RoleValue_Exp , 10*(2^EndClass) );
--			AddRoleValue( AttackID , EM_RoleValue_TpExp , 2^EndClass );
			--local GainEXP = 10*(2^EndClass)
			--local GainTP = 2^EndClass
			--ScriptMessage( AttackID, -1, 1, "[SC_LEARNTP][$SETVAR1 = "..10*(2^EndClass).."]" , C_SYSTEM )	
			--ScriptMessage( AttackID, -1, 1, "[SC_LEARNTP][$SETVAR1 = "..2^EndClass.."]" , C_SYSTEM )
			--------------------------------------------------------------------// 2013/04/23 FN進行校場統一獎勵
			--------------------------------------------------------------------// 2013/08/22 FN調整獎勵數值
			local Honor = (70*EndClass)
			FN_GuildGame_Honor( AttackID, Honor )
--			local GuildGameLV = GuildGameLVArea[RoomID]
--			AddRoleValue(AttackID, EM_RoleValue_Honor, Honor) -- 增加榮譽值
--			ScriptMessage( AttackID,AttackID,3,"[GUILD_TC_HITPLATYPUS_REWARD]"..Honor , C_SYSTEM)
			--------------------------------------------------------------------
--			ScriptMessage( AttackID,AttackID,3,"[GUILD_TC_HITPLATYPUS_REWARD]".. "EXP" .. 10*(2^EndClass) .. " / " .. "TP" .. 2^EndClass , C_SYSTEM)
--			ScriptMessage( AttackID,AttackID,0,"[GUILD_TC_HITPLATYPUS_REWARD]".. "EXP" .. 10*(2^EndClass) .. " / " .. "TP" .. 2^EndClass , C_SYSTEM)
			DebugMsg( 0, RoomID ,"==== !! Get Tp !! ===="..EndClass)
			StartClientCountDown ( AttackID, 5, 0, 0, 0, 0, "[SC_TC_BACKTOROOM]" )	--玩家Client顯示倒數5秒
			if ReadRoleValue( AttackID ,EM_RoleValue_IsDead ) == 1 then
				Revive( AttackID, 354 , 5121.3, 13.4, 2515.2, 269.9 )
			end
			Sleep(50)
			ChangeZone( AttackID, 354 , RoomID , 5121.3, 13.4, 2515.2, 269.9 )--傳回小房間
			SetFlag( AttackID  , 542748 , 1 )
--			SetPlot(OwnerID(),"collision","Lua_TC_Survival_ReSet",200 )-- 2012.04.10 新增，修正玩家使用公會校場重置券(206351)重新進入遊戲後，沒有劇情的問題。
		end
		CancelBuff_NoEvent( AttackID , 503784 )
	else
		for i = 1 , table.getn(Array) do
			for j=1, table.getn(Array[i]) do
				if CheckID(Array[i][j]) == true then
					DelObj(Array[i][j])
				end
			end
		end
		CancelBuff_NoEvent( AttackID , 503784 )
		DebugMsg( 0, RoomID ,"==== !! Finish Game !! ====")
		EndClass = 10
		ScriptMessage( OwnerID(),  -1, 1, "[SC_TC_WINNER]" , C_SYSTEM )
--		AddRoleValue( AttackID , EM_RoleValue_Exp , 10*(2^EndClass) );
--		AddRoleValue( AttackID , EM_RoleValue_TpExp , 2^EndClass );
		--local GainEXP = 10*(2^EndClass)
		--local GainTP = 2^EndClass
		--GiveBodyItem ( AttackID , Chest , EndClass )	--給寶箱
		--ScriptMessage( AttackID, -1, 1, "[SC_LEARNTP][$SETVAR1 = "..10*(2^EndClass).."]" , C_SYSTEM )	
		--ScriptMessage( AttackID, -1, 1, "[SC_LEARNTP][$SETVAR1 = "..2^EndClass.."]" , C_SYSTEM )
		--------------------------------------------------------------------// 2013/04/23 FN進行校場統一獎勵
		--------------------------------------------------------------------// 2013/08/22 FN調整獎勵數值
		local Honor = (70*EndClass)
		FN_GuildGame_Honor( AttackID, Honor )
--		local GuildGameLV = GuildGameLVArea[RoomID]
--		local Honor = (10*(2^EndClass)) * (1+(0.1*GuildGameLV))
--		AddRoleValue(AttackID, EM_RoleValue_Honor, Honor) -- 增加榮譽值
--		ScriptMessage( AttackID,AttackID,3,"[GUILD_TC_HITPLATYPUS_REWARD]"..Honor , C_SYSTEM)
		--------------------------------------------------------------------
--		ScriptMessage( AttackID,AttackID,1,"[GUILD_TC_HITPLATYPUS_REWARD]".. "EXP" .. 10*(2^EndClass) .. " / " .. "TP" .. 2^EndClass , C_SYSTEM)
--		ScriptMessage( AttackID,AttackID,0,"[GUILD_TC_HITPLATYPUS_REWARD]".. "EXP" .. 10*(2^EndClass) .. " / " .. "TP" .. 2^EndClass , C_SYSTEM)
		DebugMsg( 0, RoomID ,"==== !! Get Tp !! ===="..EndClass)
		StartClientCountDown ( AttackID, 5, 0, 0, 0, 0, "[SC_TC_BACKTOROOM]" )	--玩家Client顯示倒數15秒
		if ReadRoleValue( AttackID ,EM_RoleValue_IsDead ) == 1 then
			Revive( AttackID, 354 , 5121.3, 13.4, 2515.2, 269.9 )
		end
		Sleep(50)
		ChangeZone( AttackID, 354 , RoomID , 5121.3, 13.4, 2515.2, 269.9 )--傳回小房間
		SetFlag( AttackID  , 542748 , 1 )
	end
	BeginPlot(OwnerID(),"Lua_TC_SurvivalRange",0)
end

--生怪物函式
function Lua_TC_Survival_CreateMonster( HowMuch ,  MonsterID , RoomID , AttackID , FlagID)
	local Array = Lua_Davis_BornByMultilateral( MonsterID , HowMuch , 200 )
	for i=1 , HowMuch , 1 do
		MoveToFlagEnabled( Array[i] , false )
		SetAttack( Array[i] , AttackID )
		--SetRandMove( Monster , 30 ,  20 , 30 )
	end
	return Array
end
--玩家是否死亡的函式
function LuaS_TC_Survival_CheckIsDead(AttackID,RoomID)
	--Say(AttackID,"AttackID")
	if 	CheckID(AttackID) == true and ReadRoleValue(AttackID , EM_RoleValue_RoomID) == RoomID and ReadRoleValue(AttackID , EM_RoleValue_IsDead) == 0 then
		--DebugMsg( 0, RoomID ,"==== Pass = false ===="..ReadRoleValue(AttackID , EM_RoleValue_IsDead))
		local Pass = false
		return Pass
	else
		--DebugMsg( 0, RoomID ,"==== Pass = true ===="..ReadRoleValue(AttackID , EM_RoleValue_IsDead))
		local Pass = true
		return Pass
	end
end
--取得範圍內隨機一人為攻擊對象
function LuaS_TC_GetRangePlayer(RoomID,Range)
	local NewTarget = 0
	local OtherTarget = {}
	local count = 1
	local Player = SearchRangePlayer ( OwnerID(), Range )--將附近玩家取成陣列
--	Say( OwnerID() , "table.getn = "..table.getn(Player))
	for i= 0 , table.getn(Player) do
--		Say( OwnerID() , "Player[i] "..Player[i])
--		Say( OwnerID() , "AttackTarget "..AttackTarget)
		If CheckID( Player[i] ) == true and ReadRoleValue(Player[i] , EM_RoleValue_RoomID) == RoomID then
			OtherTarget[count] = Player[i]
			count = count + 1
		end
	end
	NewTarget = OtherTarget[Rand(count-1)+1]
	return NewTarget
end