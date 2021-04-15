function Z33_NPC123906SK_00()	-- 勒瑞．阿克索
	local player = OwnerID();
	local npc = TargetID();

	LoadQuestOption( player );	-- 載入任務模板對話
end

function Z34_NPC124156SK_00()	-- 阿克索家族的僕從
	local player = OwnerID();
	local npc = TargetID();
	local QuestID = 427357;	-- 聖城失聯？

	if CheckAcceptQuest( player , QuestID ) == true then
		AddSpeakOption( player , npc , "[SC_Z34_Q427357_03]" , "Z34_NPC124156SK_01" , 0 );	-- 作為信使向聖城求援一事……
	end

	LoadQuestOption( player );	-- 載入任務模板對話
end

function Z34_NPC124156SK_01()	-- 阿克索家族的僕從
	local player = OwnerID();
	local npc = TargetID();
	local QuestID = 427357;	-- 聖城失聯？

	if CheckAcceptQuest( player , QuestID ) == true then
		SetSpeakDetail( player, "[SC_Z34_Q427357_04]" );		-- 我會將聖城目前的狀況帶回讓家族長知情……
	end
end

function Z34_NPC124157SK_00()	-- 艾登．海蘭德
	local player = OwnerID();
	local npc = TargetID();
	local QuestID = 427357;	-- 聖城失聯？
	local KeyItem = 549381;	-- 至臨時營地內，與艾登．海蘭德交談

	if CheckAcceptQuest( player , QuestID ) == true and CheckFlag( player , KeyItem ) == false then
		SetSpeakDetail( player, "[SC_Z34_Q427357_02]" );		-- 我會將聖城目前的狀況帶回讓家族長知情……
		AddSpeakOption( player , npc , "[SC_Z34_Q427357_01]" , "Z34_NPC124157SK_01" , 0 );	-- 你是這個營地的負責人？
	else
		LoadQuestOption( player );	-- 載入任務模板對話
	end
end

function Z34_NPC124157SK_01()	-- 艾登．海蘭德
	local player = OwnerID();
	local npc = TargetID();
	local QuestID = 427357;	--  聖城失聯？
	local KeyItem = 549381;	-- 至臨時營地內，與艾登．海蘭德交談

	if CheckAcceptQuest( player , QuestID ) == true and CheckFlag( player , KeyItem ) == false then
		SetFlag( player , KeyItem , 1 );
		LoadQuestOption( player );	-- 載入任務模板對話
	end
end

function Z34_NPC124157SK_02()	-- 艾登．海蘭德
	local player = OwnerID();
	local npc = TargetID();
	local QuestID = 427358;	--  迫近的危機！
	local KeyItem = 549384;	-- 任務判斷3

	if CheckAcceptQuest( player , QuestID ) == true and CheckFlag( player , KeyItem ) == false then
	--	SetFlag( player , KeyItem , 1 );
		SetSpeakDetail( player, "[SC_Z34_Q427357_10]" );		-- 正因為擔憂是某個禁忌符文遭到惡人濫用……
		AddSpeakOption( player , npc , "[SC_Z34_Q427357_11]" , "Z34_NPC124158SK_03" , 0 );	-- 拯救伊斯般納，義不容辭！
	end
end

function Z34_NPC124157SK_03()	-- 艾登．海蘭德
	local player = OwnerID();
	local npc = TargetID();
	local QuestID = 427358;	--  迫近的危機！
	local KeyItem = 549384;	-- 任務判斷3

	if CheckAcceptQuest( player , QuestID ) == true and CheckFlag( player , KeyItem ) == false then
		SetFlag( player , KeyItem , 1 );
		SetSpeakDetail( player, "[SC_Z34_Q427357_12]" );		-- 非常好，雖然我們接下來還有一大段艱辛的路途要走……
	end
end

function Z34_NPC124158SK_00()	-- 克雷．希爾
	local player = OwnerID();
	local npc = TargetID();
	local QuestID = 427358;	-- 迫近的危機！

	if CheckAcceptQuest( player , QuestID ) == true then
		AddSpeakOption( player , npc , "[SC_Z34_Q427357_05]" , "Z34_NPC124158SK_01" , 0 );	-- 更多關於穆拉罕裂隙的資訊。
	end

	LoadQuestOption( player )	-- 載入任務模板對話
end

function Z34_NPC124158SK_01()	-- 克雷．希爾
	local player = OwnerID();
	local npc = TargetID();
	local QuestID = 427358;	-- 迫近的危機！
	local KeyItem = 549382;	-- 任務判斷1

	if CheckAcceptQuest( player , QuestID ) == true and CheckFlag( player , KeyItem ) == false then
		SetFlag( player , KeyItem , 1 );
	end

	SetSpeakDetail( player, "[SC_Z34_Q427357_06]" );		-- 依據賢者之眼的研究，穆拉罕裂隙的出現並非偶然……
end

function Z34_NPC124159SK_00()	-- 阿莉雅
	local player = OwnerID();
	local npc = TargetID();
	local QuestID = 427358;	-- 迫近的危機！

	if CheckAcceptQuest( player , QuestID ) == true then
		AddSpeakOption( player , npc , "[SC_Z34_Q427357_07]" , "Z34_NPC124159SK_01" , 0 );	-- 艾力克研究團對於穆拉罕裂隙的調查結果？
	end

	LoadQuestOption( player );	-- 載入任務模板對話
end

function Z34_NPC124159SK_01()	-- 阿莉雅
	local player = OwnerID();
	local npc = TargetID();
	local QuestID = 427358;	-- 迫近的危機！
	local KeyItem = 549383;	-- 任務判斷2

	if CheckAcceptQuest( player , QuestID ) == true and CheckFlag( player , KeyItem ) == false then
		SetFlag( player , KeyItem , 1 );
	end

	SetSpeakDetail( player, "[SC_Z34_Q427357_08]" );		-- 針對穆拉罕裂隙我們已經進行定位，然後有了驚奇的發現……

end

function Z34_NPC124160SK_00()	-- 柏妮絲
	local player = OwnerID();
	local npc = TargetID();

	LoadQuestOption( player );	-- 載入任務模板對話
end

function Z34_NPC124181SK_00()	-- 艾登．海蘭德
	local player = OwnerID();
	local npc = TargetID();

	LoadQuestOption( player );	-- 載入任務模板對話
end

function Z34_NPC124182SK_00()	-- 克雷．希爾
	local player = OwnerID();
	local npc = TargetID();

	LoadQuestOption( player );	-- 載入任務模板對話
end

function Z34_NPC124183SK_00()	--  阿莉雅
	local player = OwnerID();
	local npc = TargetID();

	LoadQuestOption( player );	-- 載入任務模板對話
end

function Z34_NPC124191SK_00()	-- 艾登．海蘭德
	local player = OwnerID();
	local npc = TargetID();

	LoadQuestOption( player );	-- 載入任務模板對話
end

function Z34_NPC124192SK_00()	-- 克雷．希爾
	local player = OwnerID();
	local npc = TargetID();

	LoadQuestOption( player );	-- 載入任務模板對話
end

function Z34_NPC124193SK_00()	--  阿莉雅
	local player = OwnerID();
	local npc = TargetID();

	LoadQuestOption( player );	-- 載入任務模板對話
end

function Z34_NPC124194SK_00()	-- 艾登．海蘭德
	local player = OwnerID();
	local npc = TargetID();

	LoadQuestOption( player );	-- 載入任務模板對話
end

function Z34_NPC124195SK_00()	-- 克雷．希爾
	local player = OwnerID();
	local npc = TargetID();

	LoadQuestOption( player );	-- 載入任務模板對話
end

function Z34_NPC124167SK_00()	-- 克雷．希爾
	local player = OwnerID();
	local npc = TargetID();

	LoadQuestOption( player );	-- 載入任務模板對話
end

function Z34_NPC124196_ClickBefore()
	local player = OwnerID();
	local npc = TargetID();
	local QuestID = 427364;	-- 敵人的陣地
	local KeyItem = 549386;	-- 找出敵人後續計畫的資訊

	if CheckAcceptQuest( player , QuestID ) == true then	-- 有接任務
		return true;		-- 給過
	end

	return false;			-- 不給過

end

function Z34_NPC124196_ClickAfter()
	local player = OwnerID();
	local npc = TargetID();
	local QuestID = 427364;	-- 敵人的陣地
	local KeyItem = 549386;	-- 找出敵人後續計畫的資訊
	local Item = 243298;	-- 指示文書

	if CheckAcceptQuest( player , QuestID ) == true then	-- 有接任務
		if CheckFlag( player , KeyItem ) == false then	-- 沒重要物品給重要物品
			SetFlag( player , KeyItem , 1 );
		end
		if CountBodyItem( player , Item ) < 1 then	-- 沒任務物品給任務物品
			GiveBodyItem( player , Item , 1 );
		end
	end

	return true;
end

function Z34_NPC124172_ClickBefore()	-- 裝備木箱
	local player = OwnerID();
	local npc = TargetID();
	local QuestID = 427384;	-- 破壞敵人的裝備

	if CheckAcceptQuest( player , QuestID ) == true then	-- 有接任務
		return true;		-- 給過
	end

	return false;			-- 不給過

end

function Z34_NPC124172_ClickAfter()		-- 裝備木箱
	local player = OwnerID();
	local npc = TargetID();
	local QuestID = 427384;		-- 破壞敵人的裝備
	local mob = 109315;		-- 破壞裝備木箱

	if CheckAcceptQuest( player , QuestID ) == true then	-- 有接任務
		DW_QietKillOne( player , mob )		--靜靜的殺死怪，前者殺死後者，0代表為玩家
		CallPlot( npc , "Z34_NPC124172_ClickAfter_2" , player );			-- 捉完重生
	end
	
	return true;
end

function Z34_NPC124172_ClickAfter_2( player )		-- 裝備木箱
	local npc = OwnerID();
	local pX = ReadRoleValue( npc , EM_RoleValue_X );
	local pY = ReadRoleValue( npc , EM_RoleValue_Y );
	local pZ = ReadRoleValue( npc , EM_RoleValue_Z );

--	say(player,"player")
--	say(npc,"npc")

	SysCastSpellLv_Pos( npc, pX, pY, pZ, 852288, 3 )		-- 火焰灼燒
	sleep(20)
	CallPlot( npc , "LuaFunc_ResetObj", npc );			-- 捉完重生
	
	return true;
end

function Z34_NPC124241_Initial()		-- 要塞內部
	local npc = OwnerID();

	SetPlot( npc , "range" , "Z34_NPC124241_Range" , 100 )
	
	return true;
end

function Z34_NPC124241_Range()		-- 要塞內部
	local player = OwnerID();
	local QuestID = 427374;		-- 偵查要塞內部
	local Keyitem = 549388;		-- 偵查要塞內部

	if CheckAcceptQuest( player , QuestID ) == true then	-- 有接任務
		SetFlag( player , KeyItem , 1 );
	end
	
	return true;
end