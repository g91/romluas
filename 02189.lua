--================================舊劇情表演========================================--

function ks_QuestAddBuff( QuestID, FinishFlagID, CheckBuffID, CheckRange, DoScript )--範圍玩家任務劇情開始播放
	local allplayer = {}
	local player = {}
	local playerCount = 0	
	
	allplayer = SearchRangePlayer ( OwnerID(), CheckRange )	
	for pry , obj in pairs( allplayer ) do
		playerCount = playerCount + 1
	end
	--debugmsg( 0,0, "Add CheckBuff Start")
	for i= 0, playerCount-1 do
		if CheckID(allplayer[i]) == true and  CheckAcceptQuest( allplayer[i], QuestID ) == true and CheckBuff( allplayer[i], CheckBuffID ) ~= true and CheckFlag( allplayer[i], FinishFlagID ) ~= true then 
			AddBuff( allplayer[i], CheckBuffID, 0, -1 )--給予檢查			
			table.insert( player, allplayer[i] )
			--debugmsg( 0,0, "AddPlayer " ..allplayer[i] )
		end
	end
	--debugmsg( 0,0, "Add CheckBuff End")	
	while true do
		local Count = 0
		--debugmsg( 0,0, "PlayerNum = "..table.getn(player) )
		for i= 1, table.getn(player) do
			--debugmsg( 0,0, player[i].." Check" )
			if CheckID(player[i]) == true and  CheckAcceptQuest( player[i], QuestID ) ~= true or --檢查有無任務
				CheckBuff( player[i], CheckBuffID ) ~= true or --檢查有無BUFF
				CheckFlag( player[i], FinishFlagID ) == true or --檢查有無重要物品
				CheckDistance( player[i], OwnerID(), CheckRange ) ~= true then --檢查是否超過檢查範圍
				Count = Count + 1
				CancelBuff( player[i], CheckBuffID )
				--debugmsg( 0,0, player[i].." TableRemove" )
				--table.remove( player, i )				
			end
		end
		if Count == table.getn(player) then
			debugmsg( 0,0, "break")
			if DoScript ~= nil then
				BeginPlot( OwnerID(), DoScript, 0 )
			end
			break
		end		
		sleep(20)
	end	
end

function ks_QuestEnd( QuestID, FinishFlagID, CheckBuffID, CheckRange, DoScript )--範圍玩家任務劇情結束給予重要旗標
	local player = {}
	local playerCount = 0
	player = SearchRangePlayer ( OwnerID(), CheckRange ) 
	
	for pry , obj in pairs( player ) do
		playerCount = playerCount + 1
	end
	for i= 0, playerCount-1 do
		if CheckID(player[i]) == true and  CheckAcceptQuest( player[i], QuestID ) == true and CheckBuff( player[i] , CheckBuffID ) == true then 
			if FinishFlagID ~= nil then SetFlag( player[i], FinishFlagID, 1 ) end
			CancelBuff( player[i], CheckBuffID )
		end
	end
	if DoScript ~= nil then
		BeginPlot( OwnerID(), DoScript, 0 )
	end
	debugmsg( 0,0, "Quest End")
end

function ks_AddBuff( QuestID, FinishFlagID, CheckBuffID, CheckRange )
	local allplayer = {}
	local playerCount = 0	
	
	allplayer = SearchRangePlayer ( OwnerID(), CheckRange )	
	for pry , obj in pairs( allplayer ) do
		playerCount = playerCount + 1
	end
	debugmsg( 0,0, "Add CheckBuff Start")
	for i= 0, playerCount-1 do
		if CheckID(allplayer[i]) == true and  CheckAcceptQuest( allplayer[i], QuestID ) == true and CheckBuff( allplayer[i], CheckBuffID ) ~= true and CheckFlag( allplayer[i], FinishFlagID ) ~= true then 
			AddBuff( allplayer[i], CheckBuffID, 0, -1 )--給予檢查			
			debugmsg( 0,0, "AddPlayer " ..allplayer[i] )
		end
	end
	debugmsg( 0,0, "Add CheckBuff End")	
end

function ks_QuestCheck( QuestID, FinishFlagID, CheckBuffID, CheckRange, DoScript )
	local allplayer = {}
	local player = {}
	local playerCount = 0	
	
	allplayer = SearchRangePlayer ( OwnerID(), CheckRange )	
	for pry , obj in pairs( allplayer ) do
		playerCount = playerCount + 1
	end
	for i= 0, playerCount-1 do
		if CheckID(allplayer[i]) == true and CheckAcceptQuest( allplayer[i], QuestID ) == true and CheckBuff( allplayer[i], CheckBuffID ) == true and CheckFlag( allplayer[i], FinishFlagID ) ~= true then 
			table.insert( player, allplayer[i] )
			debugmsg( 0,0, "AddPlayer " ..allplayer[i] )
		end
	end	
	while true do
		local Count = 0
		--debugmsg( 0,0, "PlayerNum = "..table.getn(player) )
		for i= 1, table.getn(player) do
			--debugmsg( 0,0, player[i].." Check" )
			if  CheckID(player[i]) == true and CheckAcceptQuest( player[i], QuestID ) ~= true or --檢查有無任務
				CheckBuff( player[i], CheckBuffID ) ~= true or --檢查有無BUFF
				CheckFlag( player[i], FinishFlagID ) == true or --檢查有無重要物品
				CheckDistance( player[i], OwnerID(), CheckRange ) ~= true then --檢查是否超過檢查範圍
				Count = Count + 1
				CancelBuff( player[i], CheckBuffID )
				debugmsg( 0,0, player[i].." TableRemove" )
				--table.remove( player, i )				
			end
		end
		if Count == table.getn(player) then
			debugmsg( 0,0, "break")
			if DoScript ~= nil then
				BeginPlot( OwnerID(), DoScript, 0 )
			end
			return true
		end		
		sleep(20)
	end
end

function KS_QuestSetPos( QuestID, CheckBuffID, CheckRange, target, Range )--演戲用的轉場傳送
--此函式將範圍內(CheckRange)有任務(QuestID)並且有BUFF(CheckBuffID)的玩家傳送到指定座標(x, y, z )
	-- QuestID	任務編號	
	-- CheckBuffID 	檢查是否正在演戲的BUFF
	-- CheckRange	演戲的檢查範圍
	-- target 		傳送的目標位置
	-- Range		距離目標位置的隨機範圍 不填則距離為0
	local player = {}
	local playerCount = 0
	local count = 0	
	player = SearchRangePlayer ( OwnerID(), CheckRange )
	local x = ReadRoleValue( target, EM_RoleValue_X )
	local y = ReadRoleValue( target, EM_RoleValue_Y )
	local z = ReadRoleValue( target, EM_RoleValue_Z )
	if Range == nil then Range = 0 end
	for pry , obj in pairs( player ) do
		playerCount = playerCount + 1
	end
	for i= 0, playerCount-1 do
		if CheckID(player[i]) == true and CheckAcceptQuest( player[i], QuestID ) == true and CheckBuff( player[i], CheckBuffID ) == true then 
			AddBuff( player[i], 506098, 0, -1 )--畫面一黑
			sleep(2)
			SetPos( player[i], x+math.random(-Range,Range ), y, z+math.random(-Range,Range ), 0 )
			CancelBuff( player[i], 506098 )
		end
	end
end

--================================新劇情表演========================================--

function ks_QuestAddBuffEx( QuestID, FinishFlagID, CheckBuffID, CheckRange, ActorArray )--範圍玩家任務劇情開始播放
	local player = {}
	local Ctrl = OwnerID()
	local allplayer = SearchRangePlayer( Ctrl, CheckRange )	

	for i=0, table.getn(allplayer)-1 do--符合條件 給予演戲用Buff
		if	CheckID(allplayer[i]) == true and  
			CheckAcceptQuest( allplayer[i], QuestID ) == true and 
			CheckBuff( allplayer[i], CheckBuffID ) ~= true and 
			CheckFlag( allplayer[i], FinishFlagID ) ~= true then 
			
			AddBuff( allplayer[i], CheckBuffID, 0, -1 )--給予檢查			
			table.insert( player, allplayer[i] )
		end
	end
	DebugMsg(0,0, "Count = "..table.getn(player))
	while true do
		for i= 1, table.getn(player) do
			if player[i] ~= nil and CheckID(player[i]) == true and  
				( CheckAcceptQuest( player[i], QuestID ) ~= true or --檢查有無任務
				CheckBuff( player[i], CheckBuffID ) ~= true or --檢查有無BUFF
				CheckFlag( player[i], FinishFlagID ) == true or --檢查有無重要物品
				CheckDistance( player[i], Ctrl, CheckRange ) ~= true ) then --檢查是否超過檢查範圍
				
				CancelBuff( player[i], CheckBuffID )
				table.remove(player, i)							
			end
		end
		--DebugMsg(0,0, "Count = "..table.getn(player))
		if table.getn(player) == 0 then
			--DebugMsg(0,0,"Del")
			for i=1, table.getn(ActorArray ) do--刪除演員
				if CheckID(ActorArray[i]) == true then DelObj(ActorArray[i]) end
			end
			ks_resetObj( Ctrl, nil )--重置中控
			break
		end
		sleep(20)
	end	
end

function ks_QuestEndEx( QuestID, FinishFlagID, CheckBuffID, CheckRange, ActorArray, Ctrl )--範圍玩家任務劇情結束給予重要旗標
	Ctrl = Ctrl or OwnerID()
	local player = SearchRangePlayer ( Ctrl, CheckRange ) 	

	for i=0, table.getn(player )-1 do--清除演戲Buff
		if	CheckID(player[i]) == true and  
			CheckAcceptQuest( player[i], QuestID ) == true and 
			CheckBuff( player[i] , CheckBuffID ) == true and 
			CheckFlag( player[i], FinishFlagID ) ~= true then
			
			if FinishFlagID ~= nil then SetFlag( player[i], FinishFlagID, 1 ) end
			CancelBuff( player[i], CheckBuffID )
		end
	end

	for i=1, table.getn(ActorArray ) do--刪除演員
		if CheckID(ActorArray[i]) == true then DelObj(ActorArray[i]) end
	end

	ks_resetObj( OwnerID(), nil )--重置中控
end

function ks_AddBuffEx( QuestID, FinishFlagID, CheckBuffID, CheckRange )--給予任務用BUFF	
	local allplayer = SearchRangePlayer ( OwnerID(), CheckRange )	
	local Num = 0	

	for i=0, table.getn(allplayer)-1 do
		if	CheckID(allplayer[i]) == true and  
			CheckAcceptQuest( allplayer[i], QuestID ) == true and
			CheckBuff( allplayer[i], CheckBuffID ) ~= true and 
			CheckFlag( allplayer[i], FinishFlagID ) ~= true then
			
			AddBuff( allplayer[i], CheckBuffID, 0, -1 )--給予檢查
			Num = Num+1
		end
	end
	DebugMsg(0,0,"AddQuestBuff Num = "..Num)
end

function ks_QuestCheckEx( QuestID, FinishFlagID, CheckBuffID, CheckRange, ActorArray, CtrlObj )--檢查任務
	local player = {}
	local Ctrl = OwnerID()
	
	local allplayer = SearchRangePlayer ( Ctrl, CheckRange )
	for i=0, table.getn(allplayer)-1 do--符合條件 給予演戲用Buff
		if 	CheckID(allplayer[i]) == true and  
			CheckAcceptQuest( allplayer[i], QuestID ) == true and 
			CheckBuff( allplayer[i], CheckBuffID ) == true and 
			CheckFlag( allplayer[i], FinishFlagID ) ~= true then 
			
			DebugMsg(0,0,"insert "..allplayer[i] )
			table.insert( player, allplayer[i] )
		end
	end
	
	while true do
		for i= 1, table.getn(player) do
			if  	player[i] ~= nil and CheckID(player[i]) == true and
				( CheckAcceptQuest( player[i], QuestID ) ~= true or --檢查有無任務
				CheckBuff( player[i], CheckBuffID ) ~= true or --檢查有無BUFF
				CheckFlag( player[i], FinishFlagID ) == true or --檢查有無重要物品
				CheckDistance( player[i], Ctrl, CheckRange ) ~= true ) then --檢查是否超過檢查範圍

				CancelBuff( player[i], CheckBuffID )
				table.remove(player, i)
			end
		end
		--DebugMsg(0,0,"Player Count = "..table.getn(player))
		if table.getn(player) == 0 then
			CallPlot( CtrlObj, "ks_QuestDelActot", ActorArray )
			break
		end
		sleep(20)
	end
end

function ks_QuestDelActot( ActorArray )
	for i=1, table.getn(ActorArray ) do--刪除演員
		if CheckID(ActorArray[i]) == true then DelObj(ActorArray[i]) end
	end
	ks_resetObj( OwnerID(), nil )
end

--==================================================================================--