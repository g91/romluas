function LuaDan_113034_Teleportion()
--Say(OwnerID(), "1") --player
--Say(TargetID(), "2")
	local Reward_Flag = CheckFlag(OwnerID(), 542745)

		if Reward_Flag == false then
			SetSpeakDetail(OwnerID(), "[GUILD_TC_HITPLATYPUS_3]" )                                       --校場教官對話內容
			AddSpeakOption(OwnerID(), TargetID(), "[GUILD_TC_HITPLATYPUS_4]", "LuaDan_113034_Teleportion2", 0) --我要用積分兌換經驗值和TP
			--AddSpeakOption(OwnerID(), TargetID(), "[GUILD_TC_HITPLATYPUS_6]", "LuaDan_113034_Teleportion3", 0) --我要用積分兌換眼明手快憑証
			--AddSpeakOption(OwnerID(), TargetID(), "[GUILD_TC_HITPLATYPUS_5]", "LuaDan_113034_Teleportion4", 0) --我要用積分再玩一次遊戲
			--AddSpeakOption( OwnerID(), TargetID( ), "[SC_CLICKFUNGO04]"  , "LuaDan_ClickFunGo_leave", 0 )--離開訓練場		
		else
			SetSpeakDetail(OwnerID(), "[GUILD_TC_HITPLATYPUS_3]" )                                   --你已經兌換過獎勵了
			--AddSpeakOption( OwnerID(), TargetID( ), "[SC_CLICKFUNGO04]"  , "LuaDan_ClickFunGo_leave", 0 )--離開訓練場	
		end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function LuaDan_113034_Teleportion2()
--Say(OwnerID(), "3") -- player
--Say(TargetID(), "4")
	local Player = OwnerID()
	local Reward_Flag = CheckFlag(OwnerID(), 542745)
	local RoomID = ReadRoleValue( TargetID() ,EM_RoleValue_RoomID) 
	--local NPC = SearchRangeNPC ( OwnerID() , 500 )
	local PID
		--for i=0 , table.getn(NPC) do	
		--local  ID = ReadRoleValue( NPC[i] , EM_RoleValue_OrgID)
		--	if  ID == 100044 then
		--		 PID = ReadRoleValue( NPC[i] , EM_RoleValue_PID)
		--	end
		--end	
	local Obj
	local Count = SetSearchAllNPC(RoomID)
			if Count ~= 0 then
				for i = 1 , Count , 1 do
					local ID = GetSearchResult()
						Obj = Role:New( ID )
					if Obj:IsNPC() == true then
							if ReadRoleValue(ID ,EM_RoleValue_OrgID) == 113043 then
									 PID = ReadRoleValue( ID , EM_RoleValue_PID)
								--Say(OwnerID(), PID) -- Player
								--Say(TargetID(), PID)
								--Say(ID, PID)
--									local EXP = math.floor(PID) * 10
--									local TP = math.floor(EXP * 0.1)
									local Score = PID * 10
									--Say(OwnerID(), PID) -- Player
									--Say(OwnerID(), "ExP" .. EXP) -- Player
										--if EmptyPacketCount( OwnerID() ) >= 1 and QueuePacketCount( OwnerID() ) == 0 then
										if PID == 0 then

											SetSpeakDetail( Player, "[SC_422149_1]" )                                   --我想你努力的還不夠
											--AddSpeakOption( OwnerID(), TargetID( ), "[SC_CLICKFUNGO04]"  , "LuaDan_ClickFunGo_leave", 0 )--離開訓練場

										else								 
												if Reward_Flag == false then
													SetSpeakDetail(Player, "[GUILD_TC_HITPLATYPUS_7]" )                     --活動管理員對話內容
													--AddSpeakOption( OwnerID(), TargetID( ), "[SC_CLICKFUNGO04]"  , "LuaDan_ClickFunGo_leave", 0 )--離開訓練場
													--AddEXP( OwnerID() , EXP)
													--AddRoleValue( Player , EM_RoleValue_EXP , EXP )
													--AddRoleValue( Player , EM_RoleValue_TpExp, TP )
													--------------------------------------------------------------------// 2013/04/23 FN進行校場統一獎勵
													FN_GuildGame_Honor( Player, Score )
--													local GuildGameLV = GuildGameLVArea[RoomID]
--													Score = Score * (1+(0.1*GuildGameLV))
--													AddRoleValue(Player, EM_RoleValue_Honor, Score) -- 增加榮譽值
--													ScriptMessage( Player,Player,3,"[GUILD_TC_HITPLATYPUS_REWARD]"..Score , C_SYSTEM)
													--------------------------------------------------------------------
													--ScriptMessage( Player,Player,0,"[GUILD_TC_HITPLATYPUS_REWARD]".. "EXP" .. EXP .. " / " .. "TP" .. TP , C_SYSTEM)
													--ScriptMessage( OwnerID(), OwnerID(), 0,"[GUILD_TC_HITPLATYPUS_REWARD]" .. EXP .. "\" .. TP, 0)
													SetFlag( Player  , 542745 , 1 )
													break
												else
													SetSpeakDetail(Player, "[SC_DAN_111700_20]" )                                   --你已經兌換過獎勵了
													--AddSpeakOption( OwnerID(), TargetID( ), "[SC_CLICKFUNGO04]"  , "LuaDan_ClickFunGo_leave", 0 )--離開訓練場
												end	
										end

							end
					end
				end					
		end

		--else
			--SetSpeakDetail( OwnerID(), "[SC_DAN_111700_22]")  --您的背包空間不足，請清理一下再來吧。
			--AddSpeakOption( OwnerID(), TargetID( ), "[SC_CLICKFUNGO04]"  , "LuaDan_ClickFunGo_leave", 0 )--離開訓練場	
	       		--AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , "LuaDan_113034_Teleportion", 0 ) --回到上一頁
		--end        
end
---------------------------------------------------------------------------------------------------------------------------------------------
function LuaDan_113034_Teleportion3()
	local Reward_Flag = CheckFlag(OwnerID(), 542745)
	local NPC = SearchRangeNPC ( OwnerID() , 500 )
	local PID
		for i=0 , table.getn(NPC) do	
		local  ID = ReadRoleValue( NPC[i] , EM_RoleValue_OrgID)
			if  ID == 100044 then
				 PID = ReadRoleValue( NPC[i] , EM_RoleValue_PID)
			end
		end	
	if PID >= 50 then
		if EmptyPacketCount( OwnerID() ) >= 1 and QueuePacketCount( OwnerID() ) == 0 then
				if Reward_Flag == false then
					SetSpeakDetail(OwnerID(), "[GUILD_TC_HITPLATYPUS_7]" )                     --活動管理員對話內容
					AddSpeakOption( OwnerID(), TargetID( ), "[SC_CLICKFUNGO04]"  , "LuaDan_ClickFunGo_leave", 0 )--離開訓練場
					ScriptMessage( OwnerID(), OwnerID(), 0, "[GUILD_TC_HITPLATYPUS_REWARD1]" , 0 )	--你得到了[205083]
					GiveBodyItem( OwnerID() , 205083  , 1 ) --憑証
					SetFlag( OwnerID()  , 542745 , 1 )
					WriteRoleValue( OwnerID() , EM_RoleValue_PID, PID-50)
				else
					SetSpeakDetail(OwnerID(), "[SC_DAN_111700_20]" )                                   --你已經兌換過獎勵了
					AddSpeakOption( OwnerID(), TargetID( ), "[SC_CLICKFUNGO04]"  , "LuaDan_ClickFunGo_leave", 0 )--離開訓練場
				end	
		else
			SetSpeakDetail( OwnerID(), "[SC_DAN_111700_22]")  --您的背包空間不足，請清理一下再來吧。
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_CLICKFUNGO04]"  , "LuaDan_ClickFunGo_leave", 0 )--離開訓練場	
	       		AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , "LuaDan_113034_Teleportion", 0 ) --回到上一頁
		end
	else		        
			SetSpeakDetail( OwnerID(), "[GUILD_TC_HITPLATYPUS_26]")  --您的積分不足50，請再挑戰一次吧！
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_CLICKFUNGO04]"  , "LuaDan_ClickFunGo_leave", 0 )--離開訓練場	
	       		AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , "LuaDan_113034_Teleportion", 0 ) --回到上一頁
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function LuaDan_113034_Teleportion5()

		local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
		CloseSpeak( OwnerID() )
		ChangeZone( OwnerID(), 354 , RoomID , 3101.1, 13.4, 4599.3, 266.4)	--ChangeZone( OwnerID(), ZoneID 區域ID , 第幾層 0 為第0層 -1代表只跑副本規則 , x, y, z, Dir)  
end
---------------------------------------------------------------------------------------------------------------------------------------------
function LuaDan_113034_Teleportion6()
		SetSpeakDetail( OwnerID(), "[GUILD_TC_HITPLATYPUS_8]")  --遊戲教學
		AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , "LuaYU_GuildTrainer_00", 0 ) --回到上一頁
end
---------------------------------------------------------------------------------------------------------------------------------------------
--function LuaDan_113034_Teleportion4()
--	local Reward_Flag = CheckFlag(OwnerID(), 542745)
--	local PID = ReadRoleValue( OwnerID() , EM_RoleValue_PID)
--		if PID > 50 and Reward_Flag == true  then
--			SetFlag( OwnerID()  , 542745 , 0 )
--			BeginPlot ( OwnerID(), "LuaDan_ClickFunGo_leave", 10)
--		end
--end
---------------------------------------------------------------------------------------------------------------------------------------------	
function LuaDan_TrainCentre_HitShrew_ST()
	SetPlot( OwnerID() , "range" , "LuaDan_TrainCentre_HitShrew" , 150 )
end
---------------------------------------------------------------------------------------------------------------------------------------------
function LuaDan_TrainCentre_HitShrew()
--Say(OwnerID(), "1")玩家
--Say(TargetID(), "2")地鼠
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )
	local step = 0 
	local Xtime = 0
	local Flag = 780329
	local MonsterID		
	local Random
	local Monster 
	local Count = 0
	local Score = 0
	local Hole = {}
	if HitShrewScore == nil then
		HitShrewScore = {}	
	end
	HitShrewScore[RoomID] = 0
---------------------------------------------------------------------------------------------------------------------------------------------
	while true do 
---------------------------------------------------------------------------------------------------------------------------------------------
		--local RoomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID)
		if step == 0 then  --確認開始遊戲了嗎？
		
			local RecordNPC = CreateObjByFlag( 113043, Flag, 0, 1)  

				SetModeEx( RecordNPC  , EM_SetModeType_Strikback, false )--反擊
				SetModeEx( RecordNPC   , EM_SetModeType_SearchenemyIgnore, true )--被搜尋
				SetModeEx( RecordNPC  , EM_SetModeType_Obstruct, false )--阻擋
				SetModeEx( RecordNPC  , EM_SetModeType_Mark, false )--標記
				SetModeEx( RecordNPC   , EM_SetModeType_Move, false )--移動
				SetModeEx( RecordNPC   , EM_SetModeType_Searchenemy, false )--索敵
				SetModeEx( RecordNPC    , EM_SetModeType_HideName, false )--名稱
				SetModeEx( RecordNPC , EM_SetModeType_ShowRoleHead, false )--頭像框
				SetModeEx( RecordNPC, EM_SetModeType_Fight , false )--可砍殺攻擊
				SetModeEx( RecordNPC   , EM_SetModeType_Show , false ) --不顯示
				AddToPartition( RecordNPC  , RoomID) 
				WriteRoleValue( RecordNPC , EM_RoleValue_PID, 0)
			--for i = 1, 9 do
			--	Hole[i] = CreateObjByFlag( 112758, Flag, i, 1)  
			--	SetModeEx( Hole[i]  , EM_SetModeType_Strikback, false )--反擊
			--	SetModeEx( Hole[i]   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
			--	SetModeEx( Hole[i]  , EM_SetModeType_Obstruct, true )--阻擋
			--	SetModeEx( Hole[i]  , EM_SetModeType_Mark, true )--標記
			--	SetModeEx( Hole[i]   , EM_SetModeType_Move, false )--移動
			--	SetModeEx( Hole[i]   , EM_SetModeType_Searchenemy, false )--索敵
			--	SetModeEx( Hole[i]    , EM_SetModeType_HideName, false )--名稱
			--	SetModeEx( Hole[i] , EM_SetModeType_ShowRoleHead, false )--頭像框
			--	SetModeEx( Hole[i], EM_SetModeType_Fight , false )--可砍殺攻擊
			--	SetModeEx( Hole[i]   , EM_SetModeType_Show , true ) --不顯示
			--	AddToPartition( Hole[i]  , 0) 
			--end
			ScriptMessage( OwnerID(),0,1,"[GUILD_TC_HITPLATYPUS_9]", 0)
			SetSmallGameMenuType( OwnerID() , 1 , 1 ) --Open
			SetSmallGameMenuValue( OwnerID() , 1 , 1 , 1) --Change Stage((++))
			SetSmallGameMenuStr( OwnerID(), 1 , 2 , 0 ) --Change grade (++String數字")) 
			--DebugMsg( 0, RoomID ,"LuaDan_HitShrew_CheckOK = 5 5 0")
			LuaDan_HitShrew_CheckOK(5,5,0)	--玩家Client顯示倒數
			LuaDan_Addbuff_Check()			
			step = 2
		elseif step == 2 then	--第一關
			SetSmallGameMenuValue( OwnerID() , 1 , 1 , 1) --Change Stage((++))
			ScriptMessage( OwnerID(),0,1,"[GUILD_TC_HITPLATYPUS_10]", 0)
			Sleep(20)
			ScriptMessage( OwnerID(),0,1,"[GUILD_TC_HITPLATYPUS_11]", 0)
			Sleep(10)
			while Xtime <= 20 do
				Xtime = LuaDan_TrainCentre_HitShrew_produceMonster(Xtime)
			end
			
			step = 3

		elseif step == 3 then --第二關
			SetSmallGameMenuValue( OwnerID() , 1 , 1 , 2) --Change Stage((++))
			ScriptMessage( OwnerID(),0,1,"[GUILD_TC_HITPLATYPUS_12]", 0)
			Sleep(20)
			ScriptMessage( OwnerID(),0,1,"[GUILD_TC_HITPLATYPUS_13]" , 0)
			Sleep(10)
			while Xtime > 20 and Xtime <= 40 do				
				Xtime = LuaDan_TrainCentre_HitShrew_produceMonster2(Xtime)
			end
			step = 4

		elseif step == 4 then--第三關
			SetSmallGameMenuValue( OwnerID() , 1 , 1 , 3) --Change Stage((++))
			ScriptMessage( OwnerID(),0,1,"[GUILD_TC_HITPLATYPUS_14]", 0)
			Sleep(20)
			ScriptMessage( OwnerID(),0,1,"[GUILD_TC_HITPLATYPUS_13]" , 0)
			Sleep(10)
			while Xtime > 40 and Xtime <= 50 do
				Xtime = LuaDan_TrainCentre_HitShrew_produceMonster3(Xtime)			 
			end
			step = 5

		elseif step == 5 then
			SetSmallGameMenuValue( OwnerID() , 1 , 1 , 4) --Change Stage((++))
			ScriptMessage( OwnerID(),0,1,"[GUILD_TC_HITPLATYPUS_24]", 0) --第四關
			Sleep(20)
			ScriptMessage( OwnerID(),0,1,"[GUILD_TC_HITPLATYPUS_25]" , 0) --注意不要相信你看到的訊息
			Sleep(10)
			while Xtime > 50 and Xtime <= 70 do
				Xtime = LuaDan_TrainCentre_HitShrew_produceMonster4(Xtime)			 
			end
			step = 6

		elseif step == 6 then--給獎勵，出現NPC

			ScriptMessage( OwnerID(),0,1,"[GUILD_TC_HITPLATYPUS_15]" , 0)
			sleep(10)
			LuaDan_TrainCentre_HitShrew_Clockclose()
				--for i = 1, 9 do
					--DelObj(Hole[i])
				--end
			local RewardNPC = CreateObjByFlag( 113034, Flag, 0, 1)  

				SetModeEx( RewardNPC  , EM_SetModeType_Strikback, false )--反擊
				SetModeEx( RewardNPC   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
				SetModeEx( RewardNPC  , EM_SetModeType_Obstruct, false )--阻擋
				SetModeEx( RewardNPC  , EM_SetModeType_Mark, true )--標記
				SetModeEx( RewardNPC   , EM_SetModeType_Move, false )--移動
				SetModeEx( RewardNPC   , EM_SetModeType_Searchenemy, false )--索敵
				SetModeEx( RewardNPC    , EM_SetModeType_HideName, false )--名稱
				SetModeEx( RewardNPC , EM_SetModeType_ShowRoleHead, true )--頭像框
				SetModeEx( RewardNPC, EM_SetModeType_Fight , false )--可砍殺攻擊
				SetModeEx( RewardNPC   , EM_SetModeType_Show , true ) --不顯示
				AddToPartition( RewardNPC  , RoomID) 
				PlayMotion( RewardNPC, 116) 
				Sleep(10)
				PlayMotion( RewardNPC, 115) 
				
				ScriptMessage( OwnerID(),0,1,"[GUILD_TC_HITPLATYPUS_16]" , 0) 
				sleep(10)
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[GUILD_TC_HITPLATYPUS_17]" .. HitShrewScore[RoomID] , C_SYSTEM )
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[GUILD_TC_HITPLATYPUS_17]" .. HitShrewScore[RoomID] , C_SYSTEM )
				Say(RewardNPC, "[GUILD_TC_HITPLATYPUS_15]")
				sleep(300)
				DelObj(RewardNPC)
				--DelObj(RecordNPC)	
				SetFlag( OwnerID()  , 542745 , 1 )
				SetSmallGameMenuType( OwnerID() , 1 , 2 ) --Close the interface
				HitShrewScore[RoomID] = 0
				
		local RoomID = ReadRoleValue( TargetID() ,EM_RoleValue_RoomID) 
		--local NPC = SearchRangeNPC ( OwnerID() , 500 )	
		--for i=0 , table.getn(NPC) do	
		--local  ID = ReadRoleValue( NPC[i] , EM_RoleValue_OrgID)
		--	if  ID == 100044 then
		--		 PID = ReadRoleValue( NPC[i] , EM_RoleValue_PID)
		--	end
		--end	
		local Obj
		local Count = SetSearchAllNPC(RoomID)
			if Count ~= 0 then
				for i = 1 , Count , 1 do
					local ID = GetSearchResult()
						Obj = Role:New( ID )
					if Obj:IsNPC() == true then
							if ReadRoleValue(ID ,EM_RoleValue_OrgID) == 113043 then
								DelObj(ID)
							end
					end
				end
			end

			--local Obj
			local PlayerNumber = SetSearchAllPlayer(RoomID)
			if PlayerNumber ~= 0 then
				for i = 1 , PlayerNumber , 1 do
					local PlayerID = GetSearchResult()
					Obj = Role:New( PlayerID )
					if Obj:IsPlayer() == true then						
						ChangeZone( OwnerID(), 354 , RoomID , 5121.3, 13.4, 2515.2, 269.9 )
					end
				end	
			end

			break	
		end
		sleep(10)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function LuaDan_TrainCentre_HitShrew_produceMonster(Xtime) --階段一出怪
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )
	local Flag = 780329
	local Shrew = {}
	local Probability = { 90, 10 }
	local MonsterID = {102143, 
			      102176,
			      102177,
			      102178,
			      102179,
			      102180,
			      102181,
			      102182,
			      102183}

	local KindNPC =  {   102184, 
			        101278,
			        101279,
			        101545,
			        101546,
			        101547,
			        101548,
			        101549,
			        101550}						
-----------------------------------------------------------------------------------------------------------------------------------
	while true do 
-----------------------------------------------------------------------------------------------------------------------------------
		for i = 0, 20 do	
			local PRandom = rand(100)
			local Random = rand(9) + 1	
			 if PRandom >= (100 - Probability[1] )  then					
					Shrew[i] = CreateObjByFlag( MonsterID[Random], Flag, Random, 1)  --生出地鼠
					SetModeEx( Shrew[i]  , EM_SetModeType_Strikback, false )--反擊
					SetModeEx( Shrew[i]   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
					SetModeEx( Shrew[i]  , EM_SetModeType_Obstruct, true )--阻擋
					SetModeEx( Shrew[i]  , EM_SetModeType_Mark, true )--標記
					SetModeEx( Shrew[i]   , EM_SetModeType_Move, false )--移動
					SetModeEx( Shrew[i]   , EM_SetModeType_Searchenemy, false )--索敵
					SetModeEx( Shrew[i]    , EM_SetModeType_HideName, true )--名稱
					SetModeEx( Shrew[i] , EM_SetModeType_ShowRoleHead, true )--頭像框
					SetModeEx( Shrew[i], EM_SetModeType_Fight , true )--可砍殺攻擊
					SetModeEx( Shrew[i]   , EM_SetModeType_Show , true ) --不顯示
					AddToPartition( Shrew[i]  , RoomID) 
					PlayMotion( Shrew[i], 161)
					Say(Shrew[i] , Random)
					sleep(30)
					DelObJ(Shrew[i])
					Xtime = Xtime + 1
			else
					Shrew[i] = CreateObjByFlag( KindNPC[Random], Flag, Random, 1)  --生出地鼠
					SetModeEx( Shrew[i]  , EM_SetModeType_Strikback, false )--反擊
					SetModeEx( Shrew[i]   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
					SetModeEx( Shrew[i]  , EM_SetModeType_Obstruct, true )--阻擋
					SetModeEx( Shrew[i]  , EM_SetModeType_Mark, true )--標記
					SetModeEx( Shrew[i]   , EM_SetModeType_Move, false )--移動
					SetModeEx( Shrew[i]   , EM_SetModeType_Searchenemy, false )--索敵
					SetModeEx( Shrew[i]    , EM_SetModeType_HideName, true )--名稱
					SetModeEx( Shrew[i] , EM_SetModeType_ShowRoleHead, true )--頭像框
					SetModeEx( Shrew[i], EM_SetModeType_Fight , true )--可砍殺攻擊
					SetModeEx( Shrew[i]   , EM_SetModeType_Show , true ) --不顯示
					AddToPartition( Shrew[i]  , RoomID) 
					PlayMotion( Shrew[i], 51)
					Say(Shrew[i] , Random)
					sleep(30)
					DelObJ(Shrew[i])
					Xtime = Xtime + 1
			end
		end
		--sleep(10)
		break 		
	end
	return  Xtime
end
---------------------------------------------------------------------------------------------------------------------------------------------
function LuaDan_TrainCentre_HitShrew_produceMonster2(Xtime) --階段二出怪
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )
	local Flag = 780329
	local Shrew = {}
	local Probability = { 90, 10 }
	local MonsterID = {102143, 
			      102176,
			      102177,
			      102178,
			      102179,
			      102180,
			      102181,
			      102182,
			      102183}
			      
	local KindNPC =  {   102184, 
			        101278,
			        101279,
			        101545,
			        101546,
			        101547,
			        101548,
			        101549,
			        101550}						
						
-----------------------------------------------------------------------------------------------------------------------------------
	while true do 
-----------------------------------------------------------------------------------------------------------------------------------
		for i = 0, 20 do	
		local PRandom = rand(100)
		local Random = rand(9) + 1	
		 if PRandom > (100 - Probability[1] )  then				
				Shrew[i] = CreateObjByFlag( MonsterID[Random], Flag, Random, 1)  --生出地鼠
				SetModeEx( Shrew[i]  , EM_SetModeType_Strikback, false )--反擊
				SetModeEx( Shrew[i]   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
				SetModeEx( Shrew[i]  , EM_SetModeType_Obstruct, true )--阻擋
				SetModeEx( Shrew[i]  , EM_SetModeType_Mark, true )--標記
				SetModeEx( Shrew[i]   , EM_SetModeType_Move, false )--移動
				SetModeEx( Shrew[i]   , EM_SetModeType_Searchenemy, false )--索敵
				SetModeEx( Shrew[i]    , EM_SetModeType_HideName, true )--名稱
				SetModeEx( Shrew[i] , EM_SetModeType_ShowRoleHead, true )--頭像框
				SetModeEx( Shrew[i], EM_SetModeType_Fight , true )--可砍殺攻擊
				SetModeEx( Shrew[i]   , EM_SetModeType_Show , true ) --不顯示
				AddToPartition( Shrew[i]  , RoomID) 
				PlayMotion( Shrew[i], 161)
				Say(Shrew[i] , Random)
				sleep(20)
				DelObJ(Shrew[i])
				Xtime = Xtime + 1
		else
				Shrew[i] = CreateObjByFlag( KindNPC[Random], Flag, Random, 1)  --生出地鼠
				SetModeEx( Shrew[i]  , EM_SetModeType_Strikback, false )--反擊
				SetModeEx( Shrew[i]   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
				SetModeEx( Shrew[i]  , EM_SetModeType_Obstruct, true )--阻擋
				SetModeEx( Shrew[i]  , EM_SetModeType_Mark, true )--標記
				SetModeEx( Shrew[i]   , EM_SetModeType_Move, false )--移動
				SetModeEx( Shrew[i]   , EM_SetModeType_Searchenemy, false )--索敵
				SetModeEx( Shrew[i]    , EM_SetModeType_HideName, true )--名稱
				SetModeEx( Shrew[i] , EM_SetModeType_ShowRoleHead, true )--頭像框
				SetModeEx( Shrew[i], EM_SetModeType_Fight , true )--可砍殺攻擊
				SetModeEx( Shrew[i]   , EM_SetModeType_Show , true ) --不顯示
				AddToPartition( Shrew[i]  , RoomID) 
				PlayMotion( Shrew[i], 51)
				Say(Shrew[i] , Random)
				sleep(20)
				DelObJ(Shrew[i])
				Xtime = Xtime + 1
		end
		end
		--sleep(10)
		break 

	end
	return  Xtime
end
---------------------------------------------------------------------------------------------------------------------------------------------
function LuaDan_TrainCentre_HitShrew_produceMonster3(Xtime) --階段三出怪
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )
	local Flag = 780329
	local Shrew = {}
	local Probability = { 90, 10 }	
	local MonsterID = {102143, 
			      102176,
			      102177,
			      102178,
			      102179,
			      102180,
			      102181,
			      102182,
			      102183}
			      
	local KindNPC =  {   102184, 
			        101278,
			        101279,
			        101545,
			        101546,
			        101547,
			        101548,
			        101549,
			        101550}							
-----------------------------------------------------------------------------------------------------------------------------------
	while true do 
-----------------------------------------------------------------------------------------------------------------------------------
		for i = 0, 20 do	
		local PRandom = rand(100)
		local Random = rand(9) + 1	
		 if PRandom > (100 - Probability[1] )  then					
				Shrew[i] = CreateObjByFlag( MonsterID[Random], Flag, Random, 1)  --生出地鼠
				SetModeEx( Shrew[i]  , EM_SetModeType_Strikback, false )--反擊
				SetModeEx( Shrew[i]   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
				SetModeEx( Shrew[i]  , EM_SetModeType_Obstruct, true )--阻擋
				SetModeEx( Shrew[i]  , EM_SetModeType_Mark, true )--標記
				SetModeEx( Shrew[i]   , EM_SetModeType_Move, false )--移動
				SetModeEx( Shrew[i]   , EM_SetModeType_Searchenemy, false )--索敵
				SetModeEx( Shrew[i]    , EM_SetModeType_HideName, true )--名稱
				SetModeEx( Shrew[i] , EM_SetModeType_ShowRoleHead, true )--頭像框
				SetModeEx( Shrew[i], EM_SetModeType_Fight , true )--可砍殺攻擊
				SetModeEx( Shrew[i]   , EM_SetModeType_Show , true ) --不顯示
				AddToPartition( Shrew[i]  , RoomID) 
				PlayMotion( Shrew[i], 161)
				Say(Shrew[i] , Random)
				sleep(15)
				DelObJ(Shrew[i])
				Xtime = Xtime + 1
		else
				Shrew[i] = CreateObjByFlag( KindNPC[Random], Flag, Random, 1)  --生出地鼠
				SetModeEx( Shrew[i]  , EM_SetModeType_Strikback, false )--反擊
				SetModeEx( Shrew[i]   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
				SetModeEx( Shrew[i]  , EM_SetModeType_Obstruct, true )--阻擋
				SetModeEx( Shrew[i]  , EM_SetModeType_Mark, true )--標記
				SetModeEx( Shrew[i]   , EM_SetModeType_Move, false )--移動
				SetModeEx( Shrew[i]   , EM_SetModeType_Searchenemy, false )--索敵
				SetModeEx( Shrew[i]    , EM_SetModeType_HideName, true )--名稱
				SetModeEx( Shrew[i] , EM_SetModeType_ShowRoleHead, true )--頭像框
				SetModeEx( Shrew[i], EM_SetModeType_Fight , true )--可砍殺攻擊
				SetModeEx( Shrew[i]   , EM_SetModeType_Show , true ) --不顯示
				AddToPartition( Shrew[i]  , RoomID) 
				PlayMotion( Shrew[i], 51)
				Say(Shrew[i] , Random)
				sleep(15)
				DelObJ(Shrew[i])
				Xtime = Xtime + 1
		end
		end
		--sleep(10)
		break
	end
	return  Xtime
end
---------------------------------------------------------------------------------------------------------------------------------------------
function LuaDan_TrainCentre_HitShrew_produceMonster4(Xtime) --階段四出怪
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )
	local Flag = 780329
	local Shrew = {}
	local Probability = { 90, 10 }	
	local MonsterID = {102143, 
			      102176,
			      102177,
			      102178,
			      102179,
			      102180,
			      102181,
			      102182,
			      102183}
			      
	local KindNPC =  {   102184, 
			        101278,
			        101279,
			        101545,
			        101546,
			        101547,
			        101548,
			        101549,
			        101550}							
						
-----------------------------------------------------------------------------------------------------------------------------------
	while true do 
-----------------------------------------------------------------------------------------------------------------------------------
		for i = 0, 15 do	
		local PRandom = rand(100)
		local Trap = rand(9) + 1
		local Random = rand(9) + 1	
		 if PRandom > (100 - Probability[1] )  then					
				Shrew[i] = CreateObjByFlag( MonsterID[Random], Flag, Random, 1)  --生出地鼠
				SetModeEx( Shrew[i]  , EM_SetModeType_Strikback, false )--反擊
				SetModeEx( Shrew[i]   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
				SetModeEx( Shrew[i]  , EM_SetModeType_Obstruct, true )--阻擋
				SetModeEx( Shrew[i]  , EM_SetModeType_Mark, true )--標記
				SetModeEx( Shrew[i]   , EM_SetModeType_Move, false )--移動
				SetModeEx( Shrew[i]   , EM_SetModeType_Searchenemy, false )--索敵
				SetModeEx( Shrew[i]    , EM_SetModeType_HideName, true )--名稱
				SetModeEx( Shrew[i] , EM_SetModeType_ShowRoleHead, true )--頭像框
				SetModeEx( Shrew[i], EM_SetModeType_Fight , true )--可砍殺攻擊
				SetModeEx( Shrew[i]   , EM_SetModeType_Show , true ) --不顯示
				AddToPartition( Shrew[i]  , RoomID) 
				PlayMotion( Shrew[i], 161)
				Say(Shrew[i] , Trap)
				sleep(15)
				DelObJ(Shrew[i])
				Xtime = Xtime + 1
		else
				Shrew[i] = CreateObjByFlag( KindNPC[Random], Flag, Random, 1)  --生出地鼠
				SetModeEx( Shrew[i]  , EM_SetModeType_Strikback, false )--反擊
				SetModeEx( Shrew[i]   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
				SetModeEx( Shrew[i]  , EM_SetModeType_Obstruct, true )--阻擋
				SetModeEx( Shrew[i]  , EM_SetModeType_Mark, true )--標記
				SetModeEx( Shrew[i]   , EM_SetModeType_Move, false )--移動
				SetModeEx( Shrew[i]   , EM_SetModeType_Searchenemy, false )--索敵
				SetModeEx( Shrew[i]    , EM_SetModeType_HideName, true )--名稱
				SetModeEx( Shrew[i] , EM_SetModeType_ShowRoleHead, true )--頭像框
				SetModeEx( Shrew[i], EM_SetModeType_Fight , true )--可砍殺攻擊
				SetModeEx( Shrew[i]   , EM_SetModeType_Show , true ) --不顯示
				AddToPartition( Shrew[i]  , RoomID) 
				PlayMotion( Shrew[i], 51)
				Say(Shrew[i] , Trap)
				sleep(15)
				DelObJ(Shrew[i])
				Xtime = Xtime + 1
		end
		end
		--sleep(10)
		break
	end
	return  Xtime
end
---------------------------------------------------------------------------------------------------------------------------------------------

function LuaDan_HitShrew_CheckOK(Time,NowTime,type) --時間倒數記數器
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )
	local Obj
	local Count = SetSearchAllPlayer(RoomID)
	if Count ~= 0 then
		for i = 1 , Count , 1 do
			local ID = GetSearchResult()
			Obj = Role:New( ID )
			if Obj:IsPlayer() == true then
				StartClientCountDown ( ID, Time, NowTime, 0, 0, type, "[SC_1V1PVP_COUNTDOWN]" )	--玩家Client顯示倒數5秒
				sleep(15)
			end
		end	
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function LuaDan_Addbuff_Check() --給予打地鼠Buff
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )
	local Obj
	--local Count = SetSearchAllPlayer(RoomID)
	local Players = SearchRangePlayer( OwnerID() , 500 )

		for i= 0 , table.getn(Players) do
			If CheckID( Players[i] ) == true  then
				--CastSpelllv    (Players[i], Players[i] , 493475, 0)
				AddBuff( Players[i],  503690, 1, -1)
				sleep(1)
				AddBuff( Players[i],  503691, 1, -1)
				sleep(1)
				AddBuff( Players[i],  503692, 1, -1)
				sleep(1)
				AddBuff( Players[i],  503696, 1, -1)
				sleep(1)
				AddBuff( Players[i],  503755, 1, -1)
				sleep(1)
				AddBuff( Players[i],  503756, 1, -1)
				sleep(1)
				AddBuff( Players[i],  503757, 1, -1)
				sleep(1)
				AddBuff( Players[i],  503758, 1, -1)
				sleep(1)
				AddBuff( Players[i],  503759, 1, -1)
				sleep(1)	
				ClockOpen( Players[i] ,EM_ClockCheckValue_4,180,180,0,"Lua_Clockending","LuaDan_TrainCentre_HitShrew_Clockclose") --倒數計時器
			end
		end
	
	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function LuaDan_TrainCentre_HitShrew_Clockclose()  
--Say(OwnerID(),"1") -- players
--Say(TargetID(), "2")--none
--DebugMsg(0,0,OwnerID())
	local Players = SearchRangePlayer( OwnerID() , 500 )

		for i= 0 , table.getn(Players) do
--DebugMsg(0,0,OwnerID())
			if CheckID( Players[i] ) == true  then
					ScriptMessage( OwnerID() ,  -1, 1, "[GUILD_TC_HITPLATYPUS_18]" , C_SYSTEM )
					ScriptMessage( OwnerID() ,  -1, 0, "[GUILD_TC_HITPLATYPUS_18]" , C_SYSTEM )  
					CancelBuff( Players[i],  503690)
					sleep(1)
					CancelBuff( Players[i],  503691)
					sleep(1)
					CancelBuff( Players[i],  503692)
					sleep(1)
					CancelBuff( Players[i],  503696)
					sleep(1)
					CancelBuff( Players[i],  503755)
					sleep(1)
					CancelBuff( Players[i],  503756)
					sleep(1)
					CancelBuff( Players[i],  503757)
					sleep(1)
					CancelBuff( Players[i],  503758)
					sleep(1)
					CancelBuff( Players[i],  503759)	
					sleep(1)
					ClockClose(  Players[i]  ) 
			end
		end	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function LuaDan_ClickFunGo_leave()--離開訓練場

	CloseSpeak( OwnerID() ) 
	SetSmallGameMenuType( OwnerID() , 1 ,2 ) --Close
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
	SetFlag( OwnerID()  , 542745 , 1 )
	ChangeZone( OwnerID(), 354 , RoomID , 5121.3, 13.4, 2515.2, 269.9 )	--ChangeZone( OwnerID(), ZoneID 區域ID , 第幾層 0 為第0層 -1代表只跑副本規則 , x, y, z, Dir)  

end