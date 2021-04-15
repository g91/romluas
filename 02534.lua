function Lua_ying_clearpkbuff()	--清除PK保護

	local Player = OwnerID()

	CancelBuff( Player , 502931 ) --一階PK保護
	CancelBuff( Player , 502932 )
	CancelBuff( Player , 502933 )
	-- 獨立戰場測試用
	InitBgIndependence( Player , Def_InitBgIndependence_MaxWeaponSkill+Def_InitBgIndependence_MaxMagicSkill+Def_InitBgIndependence_TitleClear+Def_InitBgIndependence_KeyItemClear+Def_InitBgIndependence_QuestClear )
--	DebugMsg( 0 , 1 , "--------------------------------------Player="..Player )
end

function LuaZone_All_World_BG_JoinQueue( dbid, BattleGroundType, WorldGroupID, LevelGroupID )
	local TotalTeam	= GetNumTeam()-- 取得這戰場最多允許的隊伍數量
	local MaxPlayerNum = GetMaxTeamMember()	--取得該戰場每隊最多允許人數
	local MaxTotal= MaxPlayerNum*TotalTeam
	local TotalRoom	= GetBattleGroundRoomID( -1 )--取得現有的房間總數
	DebugLog( 6, "<BGALL> Player "..dbid..", join queue" )
	DebugLog( 6, "<BGALL> MaxTotal= "..MaxTotal )
	-- 如果已經有房間正在打，就把每個房間裡頭每一隊的人數算進該隊的總人數當中
	local NearFullRoom = nil
	local NearFullPlayerNum = nil
	local MinNumTeamType=0;--應加入哪一隊
	--找人數相差最少的房間
	if TotalRoom==0 then--還沒開場，找最少人的Queue送
		local QueueNum=0;
		local Supposition=20;--不可能卡了20人
		for TeamType=1,TotalTeam,1 do
			QueueNum=GetNumQueueMember(LevelGroupID,TeamType);
			if Supposition>QueueNum then
				Supposition=QueueNum;
				MinNumTeamType=TeamType;
			end
		end
		return MinNumTeamType
	else
		local RoomData={};
		local Drop=MaxPlayerNum;
		for RoomSN=1,TotalRoom,1 do--算出每個戰場總人數;找出目前計算
			local MaxNum,MinNum=0,0;
			local MinTeamNum=MaxPlayerNum;--先估最大值
			RoomData[RoomSN]={};
			for TeamType=1,TotalTeam,1 do
				local TeamSize=GetNumEnterTeamMember(RoomSN,TeamType);
				if TeamType==1 then
					MaxNum=TeamSize;
					MinNum=TeamSize;
					RoomData[RoomSN]["InferiorityType"]=TeamType;
				else
					if MaxNum<=TeamSize then
						MaxNum=TeamSize;
					end
					if MinNum>=TeamSize then
						MinNum=TeamSize;
						RoomData[RoomSN]["InferiorityType"]=TeamType;
					end
				end
			end
			RoomData[RoomSN]["Drop"]=MaxNum-MinNum;
			if RoomData[RoomSN]["Drop"]~=0 then
				if Drop>=RoomData[RoomSN]["Drop"] then
					Drop=RoomData[RoomSN]["Drop"];
				end
			end
		end
		if Drop==MaxPlayerNum then--若所有房間勢力都平衡，找最少人的Queue送
			local Supposition=20;--不可能卡了20人
			for TeamType=1,TotalTeam,1 do
				local QueueNum=GetNumQueueMember(LevelGroupID,TeamType)
				if Supposition>QueueNum then
					Supposition=QueueNum;
					MinNumTeamType=TeamType;
				end
			end
			return MinNumTeamType;
		end
		for RoomSN=1,TotalRoom,1 do--剔除掉人數落差太大的
			if RoomData[RoomSN]["Drop"]>Drop or RoomData[RoomSN]["Drop"]==0 then
				RoomData[RoomSN]=nil;
			end
		end
		local Statistic={}
		for TeamType=1,TotalTeam,1 do
			Statistic[TeamType]=0;
		end
		for RoomSN,Data in pairs(RoomData) do
			Statistic[Data["InferiorityType"]]=Statistic[Data["InferiorityType"]]+1;
		end
		local InferiorityType=TotalRoom;
		local AssignTeamType=0;
		for TeamType=1,TotalTeam,1 do--找出人數落差最少的房間 並且 最少的人的Queue送
			if InferiorityType>=Statistic[TeamType] and Statistic[TeamType]~=0 then
				InferiorityType=Statistic[TeamType];
				AssignTeamType=TeamType
			end
		end
		return AssignTeamType;
	end
	--找最滿的房間
--	if TotalRoom==0 then--還沒開場，找最少人的Queue送
--		local QueueNum=0;
--		local Supposition=20;--不可能卡了20人
--		for TeamType=1,TotalTeam,1 do
--			QueueNum=GetNumQueueMember(LevelGroupID,TeamType);
--			if Supposition>QueueNum then
--				Supposition=QueueNum;
--				MinNumTeamType=TeamType;
--			end
--		end
--		return MinNumTeamType
--	else
--		local StandardNearFull=MaxTotal;
--		local RoomData={};
--		for RoomSN=1,TotalRoom,1 do--算出每個戰場總人數;找出目前計算
--			local ThisRoundNear=MaxTotal;
--			local MinTeamNum=MaxPlayerNum;--先估最大值
--			RoomData[RoomSN]={};
--			for TeamType=1,TotalTeam,1 do
--				local TeamSize=GetNumEnterTeamMember(RoomSN,TeamType);
--				RoomData[RoomSN]["Total"]=RoomData[RoomSN]["Total"]+TeamSize;
--				if TeamSize<=MinTeamNum then
--					MinTeamNum=TeamSize;
--					RoomData[RoomSN]["InferiorityType"]=TeamType;
--				end
--			end
--			ThisRoundNear=MaxTotal-RoomData[RoomSN]["Total"];
--			if ThisRoundNear~=0 then
--				if ThisRoundNear<=StandardNearFull then
--					StandardNearFull=ThisRoundNear;--更新標準
--				end
--			end
--		end
--		if StandardNearFull==MaxTotal then--若所有房間全滿，找最少人的Queue送
--			local Supposition=20;--不可能卡了20人
--			for TeamType=1,TotalTeam,1 do
--				local QueueNum=GetNumQueueMember(LevelGroupID,TeamType)
--				if Supposition>QueueNum then
--					Supposition=QueueNum;
--					MinNumTeamType=TeamType;
--				end
--			end
--			return MinNumTeamType;
--		end
--		for RoomSN=1,TotalRoom,1 do--剔除掉人數落差太大的
--			if MaxTotal-RoomData[RoomSN]["Total"]>StandardNearFull or MaxTotal-RoomData[RoomSN]["Total"]==MaxTotal then
--				RoomData[RoomSN]=nil;
--			end
--		end
--		local Statistic={}
--		for TeamType=1,TotalTeam,1 do
--			Statistic[TeamType]=0;
--		end
--		for RoomSN,Data in pairs(RoomData) do
--			Statistic[Data["InferiorityType"]]=Statistic[Data["InferiorityType"]]+1;
--		end
--		local InferiorityType=TotalRoom;
--		local AssignTeamType=0;
--		for TeamType=1,TotalTeam,1 do--找出人數落差最少的房間 並且 最少的人的Queue送
--			if InferiorityType>=Statistic[TeamType] and Statistic[TeamType]~=0 then
--				InferiorityType=Statistic[TeamType];
--				AssignTeamType=TeamType
--			end
--		end
--		return AssignTeamType;
--	end

	--FN的版本
--	if TotalRoom >= 1 then
--		DebugLog( 6, "<BGALL> TotalRoom "..TotalRoom )
--		for i = 1, TotalRoom do
--			local RoomID = GetBattleGroundRoomID( i );--取得每一個房間的RoomID
--			local RoomPlayerCount = 0
--			for p = 1, TotalTeam do
--				local TeamCount = GetNumEnterTeamMember( RoomID, p );--計算各房間內每個Team的玩家數
--				RoomPlayerCount = RoomPlayerCount + TeamCount
--			end
--			--
--			if NearFullRoom == nil and RoomPlayerCount ~= MaxTotal then--然後開始篩選這是不是"最接近滿人"的房間 跳過"已經滿人"的房間
--				NearFullRoom = RoomID
--				NearFullPlayerNum = RoomPlayerCount
--				DebugLog( 6, "<BGALL> NearFullRoom change to R"..NearFullRoom.." and this room PlayerNum= "..NearFullPlayerNum )
--			elseif NearFullPlayerNum < RoomPlayerCount and RoomPlayerCount ~= MaxTotal then
--				NearFullRoom = RoomID
--				NearFullPlayerNum = RoomPlayerCount
--				DebugLog( 6, "<BGALL> NearFullRoom change to R"..NearFullRoom.." and this room PlayerNum= "..NearFullPlayerNum )
--			end
--		end
--		if NearFullRoom == nil then DebugLog( 6, "<BGALL> NearFullRoom is  nil" ) else DebugLog( 6, "<BGALL> NearFullRoom is  R"..NearFullRoom ) end
--		--至此找出了最接近滿人的房間NearFullRoom
--	end
--	--
--	local lowestTeam	= nil
--	local lowestPlayerNum	= nil
--
--	for y = 1, TotalTeam do
--		local TempPlayerNum
--		if TotalRoom >= 1 and NearFullPlayerNum ~= MaxTotal and NearFullRoom ~= nil then 	--如果已經有房間 & 不是滿人 & 最接近滿人的房間不是nil
--			DebugLog( 6, "<BGALL> NearFullPlayerNum= "..NearFullPlayerNum.." and MaxTotal="..MaxTotal )
--			TempPlayerNum = GetNumEnterTeamMember( NearFullRoom, y )				--那就計算該房間內每個隊伍的人數
--			DebugLog( 6, "<BGALL> EnterTeamMember= "..TempPlayerNum )
--		else
--			TempPlayerNum = GetNumQueueMember( LevelGroupID, y )					--否則計算Queue內每個隊伍的人數
--			DebugLog( 6, "<BGALL> QueueMember= "..TempPlayerNum )
--		end
--															--然後就開始篩選最少人的隊伍是哪個
--		if lowestTeam == nil then
--			lowestTeam = y
--			lowestPlayerNum = TempPlayerNum
--		elseif TempPlayerNum < lowestPlayerNum then
--			lowestTeam = y
--			lowestPlayerNum = TempPlayerNum
--		end
--	end
--	DebugLog( 6, "<BGALL> Player "..dbid..", join Team "..lowestTeam )
--	return lowestTeam
end