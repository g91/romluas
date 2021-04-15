function Lua_423236() --巡視林地		
	local  guard = LuaFunc_SearchNPCbyOrgID( OwnerID(), 115198, 100, 0) --巡邏員 史考特 存在?
	if CheckAcceptQuest( OwnerID() ,423236 ) == true and guard ~= -1 and CheckFlag( OwnerID(), 543970 ) == false then		
		SetSpeakDetail(OwnerID(),"[SC_423236_0]") --準備好了嗎？
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423236_10]","Lua_423236_ok",0) --是的。
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423236_11]","Lua_423236_cancel",0) --再等等，我忘了一些東西……
	elseif CheckAcceptQuest( OwnerID() ,423236 ) == true and guard == -1 and CheckFlag( OwnerID(), 543970 ) == false then
		SetSpeakDetail(OwnerID(),"[SC_423236_00]") --請等一下吧，史考特跟人出去巡邏了。
	else
		LoadQuestOption( OwnerID())
	end
end

function Lua_423236_cancel()
	SetSpeakDetail(OwnerID(),"[SC_423236_21]") --那你弄完再過來吧。
end

function Lua_423236_ok()
	NPCSay( TargetID(), "[SC_423236_20]" ) --那你們出發吧...
	local guard = LuaFunc_SearchNPCbyOrgID( OwnerID(), 115198, 100, 0)
	BeginPlot( guard, "Lua_423236_start", 0 )
	CloseSpeak( OwnerID() )	
end

function Lua_423236_start()
	local Phase = 0
	local guard = OwnerID() 
	local BackPhase = 0
	local waiting = 0
	local lose = 3 --連續等待失敗次數
	local loseTime = 180 --執行任務最大時間(秒)
	local FlagObjID = 780608
	local monsterID = {}	
	monsterID[0] = 103604 --灰煙雷安卡獵手
	monsterID[1] = 103605 --灰煙雷安卡斥候
	monsterID[2] = 103605 --灰煙雷安卡斥候
	local Num = 3 --每次戰鬥 怪物產生數量
	local Des ={}
	local player = {}
	local monster = {}
	local Des = {}	
	Des[0] = 115223 --巡察點A
	Des[1] = 115227 --巡察點B
	Des[2] = 115199 --巡察點C	
	WriteRoleValue( guard, EM_RoleValue_Register, 0 )	
	WriteRoleValue( guard, EM_RoleValue_IsWalk , 1 )
	MoveToFlagEnabled( guard, false )
	SetRoleEquip( guard, EM_EQWearPos_MainHand, 210474, 1 ) --給予 NPC 武器
	SetRoleEquip( guard, EM_EQWearPos_SecondHand, 221270, 1 ) ----給予 NPC 盾
	sleep(20)
	NPCSay( guard, "[SC_423236_22]" ) --我們走吧，要環顧四周安危。
	
	SetPlot( guard, "dead", "Lua_423236_dead", 0 )		
	for i=0, loseTime do   --5分鐘內必須解完	
		WriteRoleValue( guard, EM_RoleValue_IsWalk , 1 )
		sleep(10)
		if Phase > 13 then  --完成任務階段
			Lua_423236_reset( 1 ) 			
			LuaFunc_ResetObj( guard )
			break
		end
		if Phase > BackPhase then 
			BackPhase = Phase --階段改變
		end
		if waiting >lose then --任務失敗
			Lua_423236_reset( guard ) 
			waiting = 0				
			break				
		end	
		Phase, waiting = Lua_423236_do( monster, Phase, guard, waiting, FlagObjID, monsterID, Des, Num ) --各階段執行內容
		if i == loseTime then --執行任務時間太久 失敗
			Lua_423236_reset( guard ) 
			break 
		end		
	end
end

function Lua_423236_reset( result )	
	if result ~= 1 then		
		local player = SearchRangePlayer ( result, 200 ) 
		for i=0, table.getn( player ) do
			if CheckAcceptQuest( player[i], 423236 ) == true then 
				ScriptMessage( player[i], player[i], 1, "[SC_422974_FAILED]", 0 )--任務失敗，請重新再來
				ScriptMessage( player[i], player[i], 0, "[SC_422974_FAILED]", 0 )--任務失敗，請重新再來
			end
		end
		MoveToFlagEnabled( result, true )
		LuaFunc_ResetObj( result )					
	end
	if result == 1 then -- 任務完成
		local guard = LuaFunc_SearchNPCbyOrgID( OwnerID(), 115198, 100, 0)
		local player = SearchRangePlayer ( guard, 100 ) 
		for i=0, table.getn( player ) do
			if CheckAcceptQuest( player[i], 423236 ) == true then 
				ScriptMessage( player[i], player[i], 1, "[BILLBOARD_015]", 0 )--任務完成
				ScriptMessage( player[i], player[i], 0, "[BILLBOARD_015]", 0 )--任務完成
				SetFlag( player[i], 543970, 1 )	
			end
		end
	end	
end

function Lua_423236_dead()
	CallPlot( OwnerID(), "Lua_423236_reset", OwnerID() )
	return false
end

function Lua_423236_do( monster ,Phase, guard, waiting, FlagObjID, monsterID, Des, Num )
	local check = {}
	local time = 90 --戰鬥最長時間(秒)			
	waiting = Lua_423236_check( guard, FlagObjID, Phase, waiting ) --檢查玩家跟NPC距離 是否需要等待
	Phase = Lua_423236_checkFlag( FlagObjID, Phase )	
	if Phase == 3 then
		check[0] = LuaFunc_SearchNPCbyOrgID( guard, Des[0], 30, 0) --搜尋範圍 30內的巡察點A
		Sleep(10)
		if check[0] ~= -1 then --檢查點A		
			StopMove( guard, true )			
			Sleep(20)
			NPCSay( guard, "[SC_423236_30]" ) --這裡一切正常，繼續前進。	
		end
	elseif Phase == 5 then --戰鬥1					
		while true do		
			sleep(10)	
			waiting = Lua_423236_check( guard, FlagObjID, Phase, waiting ) --檢查玩家跟NPC距離 是否需要等待
			if DW_CheckDis( guard, FlagObjID, Phase, rand(10)+20 ) == true then
				NPCSay( guard, "[SC_423236_32]" ) --警戒!有東西靠近。
				Sleep(10)
				monster = Lua_423236_Create( monster, monsterID, FlagObjID, 15, Phase, Num ) --指定旗標編號產怪	
				break
			end
		end
		for i=0, time do			
			waiting = Lua_423236_killOver( Num ) --判斷怪物死光沒
			if waiting == 0 then --怪打完 流程繼續			
				sleep(20)			
				NPCSay( guard, "[SC_423236_34]" ) --看來這邊沒有問題了，我們繼續前進吧。
				break
			end			
			if i == time then waiting = time end
			sleep(10)
		end
	elseif Phase == 7 then
		check[1] = LuaFunc_SearchNPCbyOrgID( guard, Des[1], 30, 0) --搜尋範圍 30內的巡察點A
		Sleep(10)
		if check[1] ~= -1 then --檢查點A		
			StopMove( guard, true )			
			Sleep(20)
			NPCSay( guard, "[SC_423236_30]" ) --這裡一切正常，繼續前進。
		end
	elseif Phase == 10 then
		check[2] = LuaFunc_SearchNPCbyOrgID( guard, Des[2], 30, 0) --搜尋範圍 30內的巡察點A
		Sleep(10)
		if check[2] ~= -1 then --檢查點A		
			StopMove( guard, true )			
			Sleep(20)
			NPCSay( guard, "[SC_423236_30]" ) --這裡一切正常，繼續前進。
		end
	elseif Phase == 12 then --戰鬥2
		while true do		
			sleep(10)
			waiting = Lua_423236_check( guard, FlagObjID, Phase, waiting ) --檢查玩家跟NPC距離 是否需要等待
			if DW_CheckDis( guard, FlagObjID, Phase, rand(10)+20 ) == true then
				NPCSay( guard, "[SC_423236_32]" ) --警戒!有東西靠近。
				Sleep(10)
				monster = Lua_423236_Create( monster, monsterID, FlagObjID, 14, Phase, Num ) --指定旗標編號產怪	
				break
			end
		end
		for i=0, time do
			waiting = Lua_423236_killOver( Num ) --判斷怪物死光沒
			if waiting == 0 then --怪打完 流程繼續
				sleep(20)			
				NPCSay( guard, "[SC_423236_34]" ) --看來這邊沒有問題了，我們繼續前進吧。
				break
			end			
			if i == time then waiting = time end
			sleep(10)
		end
	elseif Phase == 13 then
		while true do
			Sleep(10)
			waiting = Lua_423236_check( guard, FlagObjID, Phase, waiting ) --檢查玩家跟NPC距離 是否需要等待
			if DW_CheckDis( guard, FlagObjID, Phase, rand(10)+10 ) == true then
				NPCSay( guard, "[SC_423236_4]" ) --巡察完成，謝謝你了...							
				Sleep(10)
				break
			end
		end
	end
	return Phase, waiting;
end

function Lua_423236_check( RoleID, FlagObjID, Phase, waiting )
	local player = {}
	local playerCount = 0
	local count = 0

	if HateListCount( RoleID ) > 0 then
		NPCSay( RoleID, "[SC_423236_31]" ) --這條路上可真不平靜。
	end
	
	player = SearchRangePlayer ( RoleID, 80+rand(20) ) 

	for pry , obj in pairs(player) do
		playerCount = playerCount + 1
	end
	for i= 0, playerCount-1 do	
		if CheckAcceptQuest( player[i], 423236 ) == true then 
			ks_MoveToFlag( RoleID, FlagObjID, Phase, 5)			
			waiting = 0
			count = 0	
			sleep( rand(10)+5 )
		else
			count = count + 1
		end		
		if Count == playerCount then							
			StopMove( RoleID, true )
			NPCSay( RoleID, "[SC_423236_33]" ) --快跟上吧，我們的工作可還沒結束。
			waiting = waiting + 1
			sleep( rand(20)+20 )				
		end
	end
	return waiting
end

function Lua_423236_checkFlag( FlagGroup, Phase ) --檢查到達定位沒
	if DW_CheckDis( OwnerID(), FlagGroup, Phase, rand(10)+20 ) == true then
		Phase = Phase + 1		
	end
	return Phase
end


function Lua_423236_killOver( Num )
	local killCount = ReadRoleValue( OwnerID(), EM_RoleValue_Register )
	if killCount == Num then
		WriteRoleValue( OwnerID(), EM_RoleValue_Register, 0 )
		return 0
	end
	return Num
end

function Lua_423236_kill()
	local  guard = LuaFunc_SearchNPCbyOrgID( OwnerID(), 115198, 200, 0)
	local killCount = ReadRoleValue( guard, EM_RoleValue_Register )
	WriteRoleValue( guard, EM_RoleValue_Register, killCount + 1 )
end

function Lua_423236_Create( monster, monsterID, FlagObjID, FlagID, Phase, Num )
	for i = 0 , Num-1 do
		monster[ i ] = CreateObjByFlag( MonsterID[rand(3)], FlagObjID , FlagID, 1 )
	end
	for i = 0, table.getn(monster) do
		AddToPartition(monster[i], 0 )
		sleep( rand(10) )
		ks_MoveToFlag( monster[i], FlagObjID, Phase, 10 )
		SetPlot( monster[i], "dead", "Lua_423236_kill", 10)
		sleep( rand(10)+10 )
	end
	return monster
end
