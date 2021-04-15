function LuaQuest_427416()	-- 兄長之劍
	local player = OwnerID();
	local QuestID = 427416;
	local Item = 208396;

	ClearBorder( player );
	AddBorderPage( player , GetQuestDetail( QuestID , 1 ) );

	ShowBorder( player , QuestID , "["..Item.."]", "ScriptBorder_Texture_Paper" );	

end

function LuaQuest_427420()	-- 危險的詭異觸手
	local player = OwnerID();
	local QuestID = 427420;
	local Item = 208399;

	ClearBorder( player );
	AddBorderPage( player , GetQuestDetail( QuestID , 1 ) );

	ShowBorder( player , QuestID , "["..Item.."]", "ScriptBorder_Texture_Paper" );	

end

function LuaS_208386_CHECK()		-- 魔法計量儀
	local player = OwnerID();
	local QuestID = 427399;	-- 空間的能量變化
	local KeyItem = 549389;	-- 協助霍根．班倫取得能量變化數據

	if CheckAcceptQuest( player , QuestID ) == true then	-- 判斷是否有接任務
		if CheckFlag( player , KeyItem ) == false then		-- 判斷是否有重要物品
			return true;
		else
			ScriptMessage( player, player, 0, "[Z34_QUEST427399_01]", 0 )		-- 訊息：你已經取得能量變化的數據！
			ScriptMessage( player, player, 1, "[Z34_QUEST427399_01]", C_LightGreen )
			return false;
		end
	else
		ScriptMessage( player, player, 0, "[Z34_QUEST427399_02]", 0 )		-- 訊息：魔法計量儀沒有任何反應！
		ScriptMessage( player, player, 1, "[Z34_QUEST427399_02]", C_Red )
		return false;
	end
end

function LuaS_208386_USE()		-- 魔法計量儀
	local player = OwnerID();
	local pX = ReadRoleValue( player , EM_RoleValue_X );
	local pY = ReadRoleValue( player , EM_RoleValue_Y );
	local pZ = ReadRoleValue( player , EM_RoleValue_Z );

--	local MapID = ?	-- 這裡的問題要填「東岸觀察營地」的控制區編號
	local MapID = FindMapID( pX , pY , pZ );	-- 抓取「區域資訊」裡面的「控制區」編號
	ScriptMessage( player , player , 0 , "MapID = "..MapID , 0 );

	if CheckMapID( pX , pY , pZ, MapID ) == true then
		ScriptMessage( player, player, 0, "[Z34_QUEST427399_03]", 0 )		-- 訊息：魔法計量儀開始記錄能量變化的數據！
		ScriptMessage( player, player, 1, "[Z34_QUEST427399_03]", C_LightGreen )
		
		BeginCastBarEvent( player, player, "[Z34_QUEST427399_06]", 100, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "LuaS_208386_USEEnd" )
	
	else
		ScriptMessage( player, player, 0, "[Z34_QUEST427399_02]", 0 )		-- 訊息：魔法計量儀沒有任何反應！
		ScriptMessage( player, player, 1, "[Z34_QUEST427399_02]", C_Red )
	end

	return
end

function LuaS_208386_USEEnd( player, CheckStatus )
	local KeyItem = 549389;	-- 協助霍根．班倫取得能量變化數據

	EndCastBar( player, CheckStatus )
	if CheckStatus > 0 then
		ScriptMessage( player, player, 0, "[Z34_QUEST427399_04]", 0 )		-- 訊息：魔法計量儀將能量變化數據記錄完成！
		ScriptMessage( player, player, 1, "[Z34_QUEST427399_04]", C_LightGreen )
		SetFlag( player, KeyItem, 1 );	-- 給予重要物品
		return
	else
		ScriptMessage( player, player, 0, "[Z34_QUEST427399_05]", 0 )		-- 訊息：魔法計量儀數據記錄失敗！
		ScriptMessage( player, player, 1, "[Z34_QUEST427399_05]", C_Red )
	end
end

function LuaS_208400_CHECK()	-- 不息之子服裝
	local player = OwnerID();
	local QuestID = 427407;	-- 不息之子的裝扮
	local Item = 208400;	-- 不息之子服裝
	local Item1 = 208401;	-- 不息之子的頭部裝備
	local Item2 = 208402;	-- 不息之子的腿部裝備
	local Item3 = 208403;	-- 不息之子的腳部裝備
	local Item4 = 208404;	-- 不息之子的手部裝備
	local Item5 = 208405;	-- 不息之子的身體裝備
	
	if CheckAcceptQuest( player , QuestID ) == true then	-- 判斷是否有接任務
		if CountBodyItem( player, Item ) < 5 then
			if CountBodyItem( player, Item1 ) >= 1 and CountBodyItem( player, Item2 ) >= 1 and CountBodyItem( player, Item3 ) >= 1 and CountBodyItem( player, Item4 ) >= 1 and CountBodyItem( player, Item5 ) >= 1 then
				return true;
			else
				ScriptMessage( player, player, 0, "[Z34_QUEST427407_03]", 0 )		-- 訊息：你仍缺乏其他部位的裝備！
				ScriptMessage( player, player, 1, "[Z34_QUEST427407_03]", C_Red )
				return false;
			end
		else
			ScriptMessage( player, player, 0, "[Z34_QUEST427407_01]", 0 )		-- 訊息：你已經不需要這件物品！
			ScriptMessage( player, player, 1, "[Z34_QUEST427407_01]", C_Red )
			return false;		
		end
	else
		ScriptMessage( player, player, 0, "[Z34_QUEST427407_01]", 0 )		-- 訊息：你已經不需要這件物品！
		ScriptMessage( player, player, 1, "[Z34_QUEST427407_01]", C_Red )
		return false;
	end
	
end

function LuaS_208400_USE()	-- 不息之子服裝
	local player = OwnerID();

	BeginCastBarEvent( player, player, "[Z34_QUEST427407_04]", 100, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "LuaS_208400_USEEnd" )

	return
end

function LuaS_208400_USEEnd( player, CheckStatus )	-- 不息之子服裝
	local player = OwnerID();
	local Item = 208400;	-- 不息之子服裝
	local Item1 = 208401;	-- 不息之子的頭部裝備
	local Item2 = 208402;	-- 不息之子的腿部裝備
	local Item3 = 208403;	-- 不息之子的腳部裝備
	local Item4 = 208404;	-- 不息之子的手部裝備
	local Item5 = 208405;	-- 不息之子的身體裝備

	
	EndCastBar( player, CheckStatus )
	if CheckStatus > 0 then
		ScriptMessage( player, player, 0, "[Z34_QUEST427407_02]", 0 )		-- 訊息：你將各部位裝備湊合一套不息之子服裝。
		ScriptMessage( player, player, 1, "[Z34_QUEST427407_02]", C_LightGreen )
		DelBodyItem( player, Item1, 1 );
		DelBodyItem( player, Item2, 1 );
		DelBodyItem( player, Item3, 1 );
		DelBodyItem( player, Item4, 1 );
		DelBodyItem( player, Item5, 1 );
		GiveBodyItem( player, Item, 1 );	-- 不息之子服裝
		return
	else

	end

	return
end

function LuaS_208388_CHECK()		-- 捕捉裝置
	local player = OwnerID();
	local QuestID = 427403;	-- 被影響的叢林生物
	local Item = 208389;	-- 捕捉到的叢林生物
	local NPCID1 = 109291;	-- 塔蘇克黑豹
	local NPCID2 = 109292;	-- 塔蘇克班古洛
	local NPCID3 = 109293;	-- 塔蘇克野豬
	local NPCID4 = 109296;	-- 塔蘇克巨嘴鳥
	
	if CheckAcceptQuest( player , QuestID ) == true then	-- 判斷是否有接任務
		if CountBodyItem( player, Item ) < 8 then
			local Target = ReadRoleValue( player , EM_RoleValue_AttackTargetID );
			if Target ~= 0 then
				if ReadRoleValue( Target, EM_RoleValue_OrgID ) == NPCID1 or ReadRoleValue( Target, EM_RoleValue_OrgID ) == NPCID2 or ReadRoleValue( Target, EM_RoleValue_OrgID ) == NPCID3 or ReadRoleValue( Target, EM_RoleValue_OrgID ) == NPCID4 then
					return true;
				else
					ScriptMessage( player, player, 0, "[Z34_QUEST427403_06]", 0 )		-- 訊息：你捕捉的對象不是叢林生物！
					ScriptMessage( player, player, 1, "[Z34_QUEST427403_06]", C_Red )
					return false;
				end
			else
				ScriptMessage( player, player, 0, "[Z34_QUEST427403_05]", 0 )		-- 訊息：你必須與叢林生物進行戰鬥才能捕捉牠！
				ScriptMessage( player, player, 1, "[Z34_QUEST427403_05]", C_Red )
				return false;
			end
		else
			ScriptMessage( player, player, 0, "[Z34_QUEST427403_01]", 0 )		-- 訊息：你已經捕捉到了足夠的叢林生物！
			ScriptMessage( player, player, 1, "[Z34_QUEST427403_01]", C_LightGreen )
			return false;		
		end
	else
		ScriptMessage( player, player, 0, "[Z34_QUEST427407_01]", 0 )		-- 訊息：你已經不需要這件物品！(共用其他任務的字串)
		ScriptMessage( player, player, 1, "[Z34_QUEST427407_01]", C_Red )
		return false;
	end
end

function LuaS_208388_USE()		-- 捕捉裝置
	local player = OwnerID();
	
	BeginCastBarEvent( player, player, "[Z34_QUEST427403_04]", 10, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "LuaS_208388_USEEnd" )
		
	return

end

function LuaS_208388_USEEnd( player, CheckStatus )	-- 捕捉裝置
	local player = OwnerID();
	local Item = 208389;	-- 捕捉到的叢林生物
	
	EndCastBar( player, CheckStatus )
	if CheckStatus > 0 then
		ScriptMessage( player, player, 0, "[Z34_QUEST427403_02]", 0 )		-- 訊息：你捕捉到了一隻叢林生物。
		ScriptMessage( player, player, 1, "[Z34_QUEST427403_02]", C_LightGreen )
		local Target = ReadRoleValue( player , EM_RoleValue_AttackTargetID );
		CallPlot( Target, "LuaFunc_ResetObj", Target );			-- 捉完重生
		GiveBodyItem( player, Item, 1 );	-- 捕捉到的叢林生物
		return
	else
		ScriptMessage( player, player, 0, "[Z34_QUEST427403_03]", 0 )		-- 訊息：捕捉叢林生物失敗！
		ScriptMessage( player, player, 1, "[Z34_QUEST427403_03]", C_Red )
	end

	return
end

function LuaS_208398_CHECK()		-- 魔法記錄圖本
	local player = OwnerID();
	local QuestID = 427418;	-- 描繪魔法陣
	local Item = 208398;	-- 魔法記錄圖本
	local Item1 = 243301;	-- 已記錄魔法陣的圖本
	local NPCID = 124220;	-- 魔法陣
	
	if CheckAcceptQuest( player , QuestID ) == true then	-- 判斷是否有接任務
		if CountBodyItem( player, Item1 ) < 1 then
			local RangeNPCs = SearchRangeNPC( player, 100 )
			for i = 0, #RangeNPCs, 1 do
				if ReadRoleValue( RangeNPCs[i], EM_RoleValue_OrgID ) == NPCID then
					return true;
				end
			end
			ScriptMessage( player, player, 0, "[Z34_QUEST427418_03]", 0 )		-- 訊息：附近沒有任何的魔法陣存在！
			ScriptMessage( player, player, 1, "[Z34_QUEST427418_03]", C_Red )				
			return false;
		else
			ScriptMessage( player, player, 0, "[Z34_QUEST427418_01]", 0 )		-- 訊息：你已經將魔法陣的陣型記錄在魔法記錄圖本之中。
			ScriptMessage( player, player, 1, "[Z34_QUEST427418_01]", C_LightGreen )
			return false;
		end
	else
		ScriptMessage( player, player, 0, "[Z34_QUEST427407_01]", 0 )		-- 訊息：你已經不需要這件物品！(共用其他任務的字串)
		ScriptMessage( player, player, 1, "[Z34_QUEST427407_01]", C_Red )
		return false;
	end

end

function LuaS_208398_USE()		-- 魔法記錄圖本
	local player = OwnerID();

	BeginCastBarEvent( player, player, "[Z34_QUEST427418_04]", 100, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "LuaS_208398_USEEnd" )
	
	return

end

function LuaS_208398_USEEnd( player, CheckStatus )	-- 魔法記錄圖本
	local player = OwnerID();
	local Item = 208398;	-- 魔法記錄圖本
	local Item1 = 243301;	-- 已記錄魔法陣的圖本
	
	EndCastBar( player, CheckStatus )
	if CheckStatus > 0 then
		ScriptMessage( player, player, 0, "[Z34_QUEST427418_02]", 0 )		-- 訊息：你已經將魔法陣的陣型記錄下來。
		ScriptMessage( player, player, 1, "[Z34_QUEST427418_02]", C_LightGreen )
		DelBodyItem( player, Item, 1 );
		GiveBodyItem( player, Item1, 1 );	-- 已記錄魔法陣的圖本
		return
	else

	end

	return
end

-- 溫娣．諾貝爾(銀步營地)
function Z34_Npc124187()
	local npc = OwnerID();
	
	WriteRoleValue( npc , EM_RoleValue_Register1 , 0 )	-- 事件判斷關閉
	WriteRoleValue( npc , EM_RoleValue_Register2 , 0 )	-- 事件怪物計數清空
end

function Z34_Npc124187_LockHP()

end

function Z34_Npc124187SK()
	local player = OwnerID();
	local npc = TargetID();
	local QuestID1 = 427393;		-- 警示拒馬
	local QuestID2 = 427394;		-- 防護結界
	local Item = 243302;			-- 結界展開儀

	if CheckAcceptQuest( player , QuestID1 ) == true then
		AddSpeakOption( player , npc , "[Z34_QUEST427393_EVENTOPTION]", "Z34_Quest427393_EventAgain", 0 )	-- 開始裝設魔法偵測儀。
	elseif CheckAcceptQuest( player , QuestID2 ) == true and CountBodyItem( player, Item ) <= 0 then
		AddSpeakOption( player , npc , "[Z34_QUEST427394_01]", "Z34_Npc124187SK_More", 0 )	-- 請再給我一些結界展開儀。		
	end

	LoadquestOption( player )

end

function Z34_Npc124187SK_More()
	local player = OwnerID();
	local Item = 243302;	-- 結界展開儀

	CloseSpeak( player )
	GiveBodyItem( player , Item , 10 )

end

function Z34_Quest427393_EventAgain()
	local player = OwnerID();
	local npc = TargetID();

	if ReadRoleValue( npc, EM_RoleValue_Register1 ) == 0 then	-- 判斷事件是否進行中
		CallPlot( npc, "Z34_Quest427393_EventStart" )		-- 事件開始
	else
		Z34_Quest427393_EventQuestMessage( player, "RUN" )		-- 訊息：敵人的攻勢尚未結束！請繼續保護溫娣．諾貝爾！
	end

	CloseSpeak( player )

	return

end

function Z34_Quest427393_EventAccept()
	local npc = OwnerID();
	local player = TargetID();
	local QuestBuff = 626305;	-- 戰鬥檢查用

	if CheckBuff( player, QuestBuff ) == true then	-- 清除計數用Buff重新計數
		CancelBuff( player, QuestBuff )
	end

	if ReadRoleValue( npc, EM_RoleValue_Register1 ) == 0 then	-- 判斷事件是否進行中
		CallPlot( npc, "Z34_Quest427393_EventStart" )		-- 事件開始
	else
		Z34_Quest427393_EventQuestMessage( Player, "RUN" )		-- 訊息：敵人的攻勢尚未結束！請繼續保護溫娣．諾貝爾！
	end

	return

end

function Z34_Quest427393_EventStart()
	local npc = OwnerID()
	local FlagID = 781473;
	local mobID1 = 104848;
	local mobID2 = 104849;
	local mobID3 = 104850;
	local EventCurrentStatus = false
	local CurrentPhase = 0
	local KeyItem = 109314
	local QuestBuff = 626305;	-- 戰鬥檢查用(狼)
	local CurrentBuffLv = 0
	local RequireBuffLv = 5
	local RangePlayers = {}
	local SearchRange = 500
	local mob = {}
	local QuestID = 427393;	-- 警示拒馬

	WriteRoleValue( npc, EM_RoleValue_Register1, 1 )	-- 防止事件重複進行
	LockHP( npc , ReadRoleValue( npc, EM_RoleValue_MaxHP)*0.25 , "Z34_Npc124187_LockHP" );	-- 低於25%，鎖血
	PlayMotionEX( npc, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_LOOP ) 	-- 工作動作

	SetModeEx( npc, EM_SetModeType_ShowRoleHead, false )	-- 關閉頭像2秒後再打開？
	Sleep( 20 )
	SetModeEx( npc, EM_SetModeType_ShowRoleHead, true )

	RangePlayers = SearchRangePlayer( npc, SearchRange )
	for k = 0, #RangePlayers, 1 do
		local player = RangePlayers[k]
		if CheckAcceptQuest( player , QuestID ) == true then	-- 判斷是否有接任務
			if player ~= nil and CheckID( player ) == true then
				Z34_Quest427393_EventQuestMessage( player, "BEGIN" )			-- 訊息：小心防範！敵人即將來襲！
			end
		end
	end

	Sleep( 35 )

	RangePlayers = SearchRangePlayer( npc, SearchRange )
	for m = 0, #RangePlayers, 1 do
		local player = RangePlayers[m]
		if CheckAcceptQuest( player , QuestID ) == true then	-- 判斷是否有接任務
			if player ~= nil and CheckID( player ) == true then
				Z34_Quest427393_EventQuestMessage( player, "NOTE_1" )			-- 訊息：擊退出現的敵人！
			end
		end
	end

	while true do
		CurrentPhase = CurrentPhase + 1--檢查當前階段
		if CurrentPhase >= 7 then
			Sleep( 20 )
		
			RangePlayers = SearchRangePlayer( npc, SearchRange )
			for r = 0, #RangePlayers, 1 do
				local player = RangePlayers[r]
				if CheckAcceptQuest( player , QuestID ) == true then	-- 判斷是否有接任務
					if player ~= nil and CheckID( player ) == true then
						Z34_Quest427393_EventQuestMessage( player, "END" )		-- 訊息：成功保護溫娣．諾貝爾！
					end
				end
			end

			WriteRoleValue( npc, EM_RoleValue_Register1, 0 )	-- 事件完成，清空事件判斷
			LockHP( npc , -100 , "" );
			PlayMotion( npc, ruFUSION_ACTORSTATE_NORMAL ) 	-- 工作動作

			return
		end
	
		mob = Z34_Quest427393_EventCreateMob( FlagID, mobID1, mobID2, mobID3, CurrentPhase )	-- 產怪函式

		while true do
			EventCurrentStatus = Z34_Quest427393_EventCheckStatus( mob, QuestID, QuestBuff )
			if EventCurrentStatus == true then
				break;
			end
			Sleep( 20 )		-- 每2秒檢查當事件的進度
		end

		if ( CurrentPhase == 2 or CurrentPhase == 4 or CurrentPhase == 6 ) then
			RangePlayers = {}		-- 發送給周圍接獲任務的玩家當前階段的完成條件
			RangePlayers = SearchRangePlayer( npc, SearchRange )
			for i = 0, #RangePlayers, 1 do
				local player = RangePlayers[i]
				if CheckAcceptQuest( player , QuestID ) == true then	-- 判斷是否有接任務
					if ( player ~= nil and CheckID( player ) == true ) then
						if CurrentPhase == 2 then
							Z34_Quest427393_EventQuestMessage( player, "NOTE_2" )		-- 訊息：注意！新的敵人出現了！
						elseif CurrentPhase == 4 then
							Z34_Quest427393_EventQuestMessage( player, "NOTE_3" )		-- 訊息：加把勁！消滅最後出現的敵人！
						end
					end

					if CheckBuff( player, QuestBuff ) == true then
						CurrentBuffLv = KS_CheckBuffLv( player, QuestBuff )
						if CurrentBuffLv >= RequireBuffLv then
							DW_QietKillOne( player, KeyItem )
							CancelBuff( player, QuestBuff )
						end
					end
				end
			end
		end
		Sleep( 10 )
	end
end

function Z34_Quest427393_EventCreateMob( FlagID, mobID1, mobID2, mobID3, CurrentPhase )
	local npc = OwnerID()

	local FlagPosIndex = {}
	local CurrentIndexSum = 0
	while true do
		RandNum = DW_Rand( 10 )		-- 從10個旗標當中隨機取8個旗標來生怪
		CurrentIndexSum = #FlagPosIndex
		if CurrentIndexSum >= 9 then
			break;
		else
			if CurrentIndexSum == 0 then		-- 陣列裡面沒有東西
				FlagPosIndex[ 1 ] = RandNum		-- 可以將第一次的亂數放進去
			else
				for i = 1, CurrentIndexSum, 1 do
					if RandNum == FlagPosIndex[ i ] then	-- 第2次以後抽到的亂數之前已經抽過了
						RandNum = 0	 -- 將亂數歸0	
						break;
					end
				end
				if RandNum ~= 0 then
					CurrentIndexSum = CurrentIndexSum + 1
					table.insert( FlagPosIndex, CurrentIndexSum, RandNum )
				end
			end
		end
	end

	local mobID = {}
	if ( CurrentPhase == 1 or CurrentPhase == 2 ) then		-- 1,2回合只會出1號怪
		mobID[ 1 ], mobID[ 2 ] = mobID1, mobID1
	elseif ( CurrentPhase == 3 or CurrentPhase == 4 ) then	-- 3,4回合只會出1,2號怪
		mobID[ 1 ], mobID[ 2 ] = mobID1, mobID2
	else													-- 5,6回合只會出2,3號怪
		mobID[ 1 ], mobID[ 2 ] = mobID2, mobID3
	end

	local mobAmount = CurrentPhase + 2		-- 每回合出怪數量為回合數+2
	if mobAmount >= 7 then					-- 最多出6隻怪，超過則降低
		mobAmount = 6
	end

	local mob = {}
	for j = 1, mobAmount, 1 do
		local x, y, z, dir = DW_Location( FlagID, FlagPosIndex[ j ] )
		RandNum = DW_Rand( 2 )
		mob[ j ] = CreateObj( mobID[ RandNum ], x, y, z, dir, 1 )
		MoveToFlagEnabled( mob[ j ], false )
		AddToPartition( mob[ j ], 0 )
		WriteRoleValue( mob[ j ], EM_RoleValue_Register1, npc )		-- 將任務NPC的GUID寫到怪物的reg1
		SetPlot( mob[ j ], "dead", "Z34_Quest427393_EventNpcOnDead", 0 )		-- 設置死亡劇情
		AddBuff( mob[ j ], 502862, 0, -1 )			-- 事件怪物標記(頭上會有箭頭)
		AddBuff( mob[ j ], 623132, 0, 3 )			-- 不可移動BUFF(3秒後消失就會移動)
	end

	WriteRoleValue( npc, EM_RoleValue_Register2, mobAmount )	-- 將目前怪數量寫到任務NPC的reg2

	return mob;

end

function Z34_Quest427393_EventCheckStatus( mob, QuestID, QuestBuff )
	local npc = OwnerID()
	local CurrentmobCounter = 0
	local GetBuffPlayer = 0
	local HateListSum = 0
	local CombatRange = 500
	local SearchRange = 350
	local AttackTarget = nil

	CurrentmobCounter = ReadRoleValue( npc, EM_RoleValue_Register2 )

	if ( CurrentmobCounter == nil or CurrentmobCounter <= 0 ) then
		WriteRoleValue( npc, EM_RoleValue_Register2, 0 )
		return true
	end

	for i = 1, #mob, 1 do
		if CheckDistance( mob[ i ], npc, CombatRange ) == false then
			SetStopAttack( mob[ i ] )
		end
		HateListSum = HateListCount( mob[ i ] )
		if ( HateListSum ~= nil and HateListSum ~= 0 ) then
			for j = 0, HateListSum, 1 do
				GetBuffPlayer = HateListInfo( mob[ i ], j, EM_HateListInfoType_GItemID )
				if ( GetBuffPlayer ~= nil and CheckID( GetBuffPlayer ) == true ) then
					if CheckAcceptQuest( GetBuffPlayer, QuestID ) == true then
						AddBuff( GetBuffPlayer, QuestBuff, 0, -1 )
					end
				end
			end
		end
	end

	return false

end

function Z34_Quest427393_EventNpcOnDead()
	local mob = OwnerID()
	local npc = ReadRoleValue( mob, EM_RoleValue_Register1 )
	local CurrentNpcCounter = ReadRoleValue( npc, EM_RoleValue_Register2 )
	CurrentNpcCounter = CurrentNpcCounter-1
	WriteRoleValue( npc, EM_RoleValue_Register2, CurrentNpcCounter )
	return true;
end

function Z34_Quest427393_EventQuestMessage( player , Step )
	if Step == "RUN" then
		ScriptMessage( player, player, 0, "[Z34_QUEST427393_EVENTRUN]", C_Red )		-- 訊息：敵人的攻勢尚未結束！請繼續保護溫娣．諾貝爾！
		ScriptMessage( player, player, 1, "[Z34_QUEST427393_EVENTRUN]", 0 )
	elseif Step == "BEGIN" then
		ScriptMessage( player, player, 0, "[Z34_QUEST427393_EVENTBEGIN]", 0 )				-- 訊息：小心防範！敵人即將來襲！
		ScriptMessage( player, player, 2, "[Z34_QUEST427393_EVENTBEGIN]", C_LightGreen )
	elseif Step == "NOTE_1" then
		ScriptMessage( player, player, 0, "[Z34_QUEST427393_EVENTNOTE1]", 0 )				-- 訊息：擊退出現的敵人！
		ScriptMessage( player, player, 2, "[Z34_QUEST427393_EVENTNOTE1]", C_LightGreen )
	elseif Step == "NOTE_2" then
		ScriptMessage( player, player, 0, "[Z34_QUEST427393_EVENTNOTE2]", 0 )				-- 訊息：注意！新的敵人出現了！
		ScriptMessage( player, player, 1, "[Z34_QUEST427393_EVENTNOTE2]", C_LightGreen )
	elseif Step == "NOTE_3" then
		ScriptMessage( player, player, 0, "[Z34_QUEST427393_EVENTNOTE3]", 0 )				-- 訊息：加把勁！消滅最後出現的敵人！
		ScriptMessage( player, player, 1, "[Z34_QUEST427393_EVENTNOTE3]", C_LightGreen )
	elseif Step == "END" then
		ScriptMessage( player, player, 0, "[Z34_QUEST427393_EVENTEND]", 0 )					-- 訊息：成功保護溫娣．諾貝爾！
		ScriptMessage( player, player, 2, "[Z34_QUEST427393_EVENTEND]", C_LightGreen )
	end
end

-- 溫娣．諾貝爾(核心要塞)
function Z34_Npc124217()

end

function Z34_Npc124217SK()
	local player = OwnerID();
	local npc = TargetID();
	local QuestID = 427406;		-- 核心要塞魔法結界
	local Item = 243303;	-- 身份辨識儀

	if CheckAcceptQuest( player , QuestID ) == true and CountBodyItem( player, Item ) <= 0 then
		AddSpeakOption( player , npc , "[Z34_QUEST427406_01]", "Z34_Npc124217SK_More", 0 )	-- 請再給我一些身份辨識儀。
	end

	LoadquestOption( player )

end

function Z34_Npc124217SK_More()
	local player = OwnerID();
	local Item = 243303;	-- 身份辨識儀

	CloseSpeak( player )
	GiveBodyItem( player , Item , 10 )

end

-- 藍伯特．伊凡斯
function Z34_Npc124206()
	local npc = OwnerID();
	WriteRoleValue( npc , EM_RoleValue_Register1 , 0 )	-- 事件判斷關閉
	WriteRoleValue( npc , EM_RoleValue_Register2 , 0 )	-- 事件怪物計數清空
end

function Z34_Npc124206SK()
	local player = OwnerID();
	local QuestID = 427408;	-- 要塞防守

	if CheckAcceptQuest( player , QuestID ) == true then	-- 判斷是否有接任務
		AddSpeakOption( player , player , "[Z34_QUEST427408_EVENTOPTION]", "Z34_Quest427408_EventAgain", 0 )	-- 選項：協助擊退來襲的不息之子。
	end

	LoadquestOption( player )

end

function Z34_Quest427408_EventAgain()
	local player = OwnerID();
	local npc = TargetID();

	if ReadRoleValue( npc, EM_RoleValue_Register1 ) == 0 then	-- 判斷事件是否進行中
		CallPlot( npc, "Z34_Quest427408_EventStart" )		-- 事件開始
	else
		Z34_Quest427408_EventQuestMessage( player, "RUN" )		-- 訊息：不息之子的攻勢尚未結束！請趕緊協助防守！
	end

	CloseSpeak( player )

	return

end

function Z34_Quest427408_EventAccept()
	local npc = OwnerID();
	local player = TargetID();
	local QuestBuff = 626302;	-- 戰鬥檢查用

	if CheckBuff( player, QuestBuff ) == true then	-- 清除計數用Buff重新計數
		CancelBuff( player, QuestBuff )
	end

	if ReadRoleValue( npc, EM_RoleValue_Register1 ) == 0 then	-- 判斷事件是否進行中
		CallPlot( npc, "Z34_Quest427408_EventStart" )		-- 事件開始
	else
		Z34_Quest427408_EventQuestMessage( Player, "RUN" )		-- 訊息：不息之子的攻勢尚未結束！請趕緊協助防守！
	end

	return

end

function Z34_Quest427408_EventStart()
	local npc = OwnerID()
	local FlagID = 781472;
	local mobID1 = 109287;
	local mobID2 = 109288;
	local mobID3 = 109289;
	local EventCurrentStatus = false
	local CurrentPhase = 0
	local KeyItem = 109311
	local QuestBuff = 626302;	-- 戰鬥檢查用(不息之子)
	local CurrentBuffLv = 0
	local RequireBuffLv = 5
	local RangePlayers = {}
	local SearchRange = 500
	local mob = {}
	local QuestID = 427408;	-- 要塞防守

	WriteRoleValue( npc, EM_RoleValue_Register1, 1 )	-- 防止事件重複進行

	SetModeEx( npc, EM_SetModeType_ShowRoleHead, false )	-- 關閉頭像2秒後再打開？
	Sleep( 20 )
	SetModeEx( npc, EM_SetModeType_ShowRoleHead, true )

	RangePlayers = SearchRangePlayer( npc, SearchRange )
	for k = 0, #RangePlayers, 1 do
		local player = RangePlayers[k]
		if CheckAcceptQuest( player , QuestID ) == true then	-- 判斷是否有接任務
			if player ~= nil and CheckID( player ) == true then
				Z34_Quest427408_EventQuestMessage( player, "BEGIN" )			-- 訊息：做好準備！不息之子即將來襲！
			end
		end
	end

	Sleep( 35 )

	RangePlayers = SearchRangePlayer( npc, SearchRange )
	for m = 0, #RangePlayers, 1 do
		local player = RangePlayers[m]
		if CheckAcceptQuest( player , QuestID ) == true then	-- 判斷是否有接任務
			if player ~= nil and CheckID( player ) == true then
				Z34_Quest427408_EventQuestMessage( player, "NOTE_1" )			-- 訊息：擊退每一波出現的不息之子！
			end
		end
	end

	while true do
		CurrentPhase = CurrentPhase + 1--檢查當前階段
		if CurrentPhase >= 7 then
			Sleep( 20 )
		
			RangePlayers = SearchRangePlayer( npc, SearchRange )
			for r = 0, #RangePlayers, 1 do
				local player = RangePlayers[r]
				if CheckAcceptQuest( player , QuestID ) == true then	-- 判斷是否有接任務
					if player ~= nil and CheckID( player ) == true then
						Z34_Quest427408_EventQuestMessage( player, "END" )		-- 訊息：成功完成核心要塞的防守！
					end
				end
			end

			WriteRoleValue( npc, EM_RoleValue_Register1, 0 )	-- 事件完成，清空事件判斷
			return
		end
	
		mob = Z34_Quest427408_EventCreateMob( FlagID, mobID1, mobID2, mobID3, CurrentPhase )	-- 產怪函式

		while true do
			EventCurrentStatus = Z34_Quest427408_EventCheckStatus( mob, QuestID, QuestBuff )
			if EventCurrentStatus == true then
				break;
			end
			Sleep( 20 )		-- 每2秒檢查當事件的進度
		end

		if ( CurrentPhase == 2 or CurrentPhase == 4 or CurrentPhase == 6 ) then
			RangePlayers = {}		-- 發送給周圍接獲任務的玩家當前階段的完成條件
			RangePlayers = SearchRangePlayer( npc, SearchRange )
			for i = 0, #RangePlayers, 1 do
				local player = RangePlayers[i]
				if CheckAcceptQuest( player , QuestID ) == true then	-- 判斷是否有接任務
					if ( player ~= nil and CheckID( player ) == true ) then
						if CurrentPhase == 2 then
							Z34_Quest427408_EventQuestMessage( player, "NOTE_2" )		-- 訊息：注意！第二波攻勢出現了！
						elseif CurrentPhase == 4 then
							Z34_Quest427408_EventQuestMessage( player, "NOTE_3" )		-- 訊息：加把勁！擋下最後一波的攻勢！
						end
					end

					if CheckBuff( player, QuestBuff ) == true then
						CurrentBuffLv = KS_CheckBuffLv( player, QuestBuff )
						if CurrentBuffLv >= RequireBuffLv then
							DW_QietKillOne( player, KeyItem )
							CancelBuff( player, QuestBuff )
						end
					end
				end
			end
		end
		Sleep( 10 )
	end
end

function Z34_Quest427408_EventCreateMob( FlagID, mobID1, mobID2, mobID3, CurrentPhase )
	local npc = OwnerID()

	local FlagPosIndex = {}
	local CurrentIndexSum = 0
	while true do
		RandNum = DW_Rand( 10 )		-- 從10個旗標當中隨機取8個旗標來生怪
		CurrentIndexSum = #FlagPosIndex
		if CurrentIndexSum >= 9 then
			break;
		else
			if CurrentIndexSum == 0 then		-- 陣列裡面沒有東西
				FlagPosIndex[ 1 ] = RandNum		-- 可以將第一次的亂數放進去
			else
				for i = 1, CurrentIndexSum, 1 do
					if RandNum == FlagPosIndex[ i ] then	-- 第2次以後抽到的亂數之前已經抽過了
						RandNum = 0	 -- 將亂數歸0	
						break;
					end
				end
				if RandNum ~= 0 then
					CurrentIndexSum = CurrentIndexSum + 1
					table.insert( FlagPosIndex, CurrentIndexSum, RandNum )
				end
			end
		end
	end

	local mobID = {}
	if ( CurrentPhase == 1 or CurrentPhase == 2 ) then		-- 1,2回合只會出1號怪
		mobID[ 1 ], mobID[ 2 ] = mobID1, mobID1
	elseif ( CurrentPhase == 3 or CurrentPhase == 4 ) then	-- 3,4回合只會出1,2號怪
		mobID[ 1 ], mobID[ 2 ] = mobID1, mobID2
	else													-- 5,6回合只會出2,3號怪
		mobID[ 1 ], mobID[ 2 ] = mobID2, mobID3
	end

	local mobAmount = CurrentPhase + 2		-- 每回合出怪數量為回合數+2
	if mobAmount >= 7 then					-- 最多出6隻怪，超過則降低
		mobAmount = 6
	end

	local mob = {}
	for j = 1, mobAmount, 1 do
		local x, y, z, dir = DW_Location( FlagID, FlagPosIndex[ j ] )
		RandNum = DW_Rand( 2 )
		mob[ j ] = CreateObj( mobID[ RandNum ], x, y, z, dir, 1 )
		MoveToFlagEnabled( mob[ j ], false )
		AddToPartition( mob[ j ], 0 )
		WriteRoleValue( mob[ j ], EM_RoleValue_Register1, npc )		-- 將任務NPC的GUID寫到怪物的reg1
		SetPlot( mob[ j ], "dead", "Z34_Quest427408_EventNpcOnDead", 0 )		-- 設置死亡劇情
		AddBuff( mob[ j ], 502862, 0, -1 )			-- 事件怪物標記(頭上會有箭頭)
		AddBuff( mob[ j ], 623132, 0, 3 )			-- 不可移動BUFF(3秒後消失就會移動)
	end

	WriteRoleValue( npc, EM_RoleValue_Register2, mobAmount )	-- 將目前怪數量寫到任務NPC的reg2

	return mob;

end

function Z34_Quest427408_EventCheckStatus( mob, QuestID, QuestBuff )
	local npc = OwnerID()
	local CurrentmobCounter = 0
	local GetBuffPlayer = 0
	local HateListSum = 0
	local CombatRange = 500
	local SearchRange = 350
	local AttackTarget = nil

	CurrentmobCounter = ReadRoleValue( npc, EM_RoleValue_Register2 )

	if ( CurrentmobCounter == nil or CurrentmobCounter <= 0 ) then
		WriteRoleValue( npc, EM_RoleValue_Register2, 0 )
		return true
	end

	for i = 1, #mob, 1 do
		if CheckDistance( mob[ i ], npc, CombatRange ) == false then
			SetStopAttack( mob[ i ] )
		end
		HateListSum = HateListCount( mob[ i ] )
		if ( HateListSum ~= nil and HateListSum ~= 0 ) then
			for j = 0, HateListSum, 1 do
				GetBuffPlayer = HateListInfo( mob[ i ], j, EM_HateListInfoType_GItemID )
				if ( GetBuffPlayer ~= nil and CheckID( GetBuffPlayer ) == true ) then
					if CheckAcceptQuest( GetBuffPlayer, QuestID ) == true then
						AddBuff( GetBuffPlayer, QuestBuff, 0, -1 )
					end
				end
			end
		end
	end

	return false

end

function Z34_Quest427408_EventNpcOnDead()
	local mob = OwnerID()
	local npc = ReadRoleValue( mob, EM_RoleValue_Register1 )
	local CurrentNpcCounter = ReadRoleValue( npc, EM_RoleValue_Register2 )
	CurrentNpcCounter = CurrentNpcCounter-1
	WriteRoleValue( npc, EM_RoleValue_Register2, CurrentNpcCounter )
	return true;
end

function Z34_Quest427408_EventQuestMessage( player , Step )
	if Step == "RUN" then
		ScriptMessage( player, player, 0, "[Z34_QUEST427408_EVENTRUN]", C_Red )		-- 訊息：不息之子的攻勢尚未結束！請趕緊協助防守！
		ScriptMessage( player, player, 1, "[Z34_QUEST427408_EVENTRUN]", 0 )
	elseif Step == "BEGIN" then
		ScriptMessage( player, player, 0, "[Z34_QUEST427408_EVENTBEGIN]", 0 )				-- 訊息：做好準備！不息之子即將來襲！
		ScriptMessage( player, player, 2, "[Z34_QUEST427408_EVENTBEGIN]", C_LightGreen )
	elseif Step == "NOTE_1" then
		ScriptMessage( player, player, 0, "[Z34_QUEST427408_EVENTNOTE1]", 0 )				-- 訊息：擊退每一波出現的不息之子！
		ScriptMessage( player, player, 2, "[Z34_QUEST427408_EVENTNOTE1]", C_LightGreen )
	elseif Step == "NOTE_2" then
		ScriptMessage( player, player, 0, "[Z34_QUEST427408_EVENTNOTE2]", 0 )				-- 訊息：注意！第二波攻勢出現了！
		ScriptMessage( player, player, 1, "[Z34_QUEST427408_EVENTNOTE2]", C_LightGreen )
	elseif Step == "NOTE_3" then
		ScriptMessage( player, player, 0, "[Z34_QUEST427408_EVENTNOTE3]", 0 )				-- 訊息：加把勁！擋下最後一波的攻勢！
		ScriptMessage( player, player, 1, "[Z34_QUEST427408_EVENTNOTE3]", C_LightGreen )
	elseif Step == "END" then
		ScriptMessage( player, player, 0, "[Z34_QUEST427408_EVENTEND]", 0 )					-- 訊息：成功完成核心要塞的防守！
		ScriptMessage( player, player, 2, "[Z34_QUEST427408_EVENTEND]", C_LightGreen )
	end
end

function Z34_NPC124221_ClickBefore()
	local player = OwnerID();
	local npc = TargetID();
	local QuestID = 427394;	-- 防護結界
	local Item = 243302;	-- 結界展開儀

	if CheckAcceptQuest( player , QuestID ) == true and CountBodyItem( player, Item ) >= 1 then	-- 有接任務
		return true;		-- 給過
	end

	return false;			-- 不給過

end

function Z34_NPC124221_ClickAfter()
	local player = OwnerID();
	local npc = TargetID();
	local QuestID = 427394;	-- 防護結界
	local Item = 243302;	-- 結界展開儀
	local mob = 109312;		-- 裝設結界展開儀

	if CheckAcceptQuest( player , QuestID ) == true then	-- 有接任務
		DW_QietKillOne( player , mob )		--靜靜的殺死怪，前者殺死後者，0代表為玩家
		DelBodyItem( player , Item , 1 )
	end
	
	return true;
end

function Z34_NPC124222_ClickBefore()
	local player = OwnerID();
	local npc = TargetID();
	local QuestID = 427406;	-- 核心要塞魔法結界
	local Item = 243303;	-- 身份辨識儀

	if CheckAcceptQuest( player , QuestID ) == true and CountBodyItem( player, Item ) >= 1 then	-- 有接任務
		return true;		-- 給過
	end

	return false;			-- 不給過

end

function Z34_NPC124222_ClickAfter()
	local player = OwnerID();
	local npc = TargetID();
	local QuestID = 427406;	-- 核心要塞魔法結界
	local Item = 243303;	-- 身份辨識儀
	local mob = 109313;		-- 裝設身份辨識儀

	if CheckAcceptQuest( player , QuestID ) == true then	-- 有接任務
		DW_QietKillOne( player , mob )		--靜靜的殺死怪，前者殺死後者，0代表為玩家
		DelBodyItem( player , Item , 1 )
	end
	
	return true;
end