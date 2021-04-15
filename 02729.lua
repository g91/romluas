-- 2015.09.03 阿浩：修正會影響到流程的編輯方式，避免巨龍或蛋不會被正確重置的問題 -- 
-- 並建立以下適用於此 function 的全域變數，此處定義變數，不影響其他 function  -- 
local g_CheckObj = {};		-- 防呆機制，巨龍蛋與巨龍產生時，註冊進此表中，與小強尼對話時，會確認各階段應產生物件是否異常
g_CheckObj.DragonEgg = 0;
g_CheckObj.Dragon = 0;

local g_FightStatus = 0;	-- 非戰鬥中，預設值
-- g_FightStatus = 1 時為龍蛋生成
-- g_FightStatus = 2 時為巨龍生成

local g_ObjID = {};	-- 流程物件清單，巨龍蛋(121185)、巨龍(107149)
g_ObjID.DragonEgg = 121185;	-- 龍蛋(觸碰劇情用)
g_ObjID.Dragon = 107149;	-- 龍(戰鬥劇情與獎勵)

local g_CreateFlag = 781180;	-- 生成龍蛋與巨龍的旗標編號

local g_KeyItem = {};	-- 重要物品清單
g_KeyItem.Fight = 546905;	-- 活動進行中
g_KeyItem.Complete = 546907;	-- 任務已完成
g_KeyItem.KillDragon = 546910;	-- 當日已屠龍
g_KeyItem.GiftLv = {};	-- 獎勵區間
g_KeyItem.GiftLv[1] = 546903;	-- 必爾汀藥水組 * 1，分數 0 分
g_KeyItem.GiftLv[2] = 546904;	-- 童話點數券 * 1，分數 1 ~ 10 分
g_KeyItem.GiftLv[3] = 546906;	-- 童話點數券 * 3，分數 11 ~ 30 分
g_KeyItem.GiftLv[4] = 546909;	-- 童話點數券 * 5，分數 31 分以上

local g_Msg = {};
g_Msg[1] = "[SC_2012FAIRY_JOHN1]"	-- 對話首頁：故事書裡面的巨龍……牠……牠跑出來了！
g_Msg[2] = "[SC_2012FAIRY_JOHN2]"	-- 對話次頁：太好了！帶著[623277]吧！當巨龍出現之後，你就會變成童話中的勇者：
g_Msg[3] = "[SC_2012FAIRY_JOHN3]"	-- 拒絕選項：希望你能再考慮考慮，好嗎？
g_Msg[4] = "[SC_2012FAIRY_JOHN4]"	-- 戰鬥中：故事書中的勇者開始跟巨龍大戰了！好精采唷！
g_Msg[5] = "[SC_2012FAIRY_JOHN5]"	-- 完成選項：你身上殘留著故事書的味道，今天無法再次成為童話英雄了！
g_Msg[6] = "[SC_2012FAIRY_JOHN9]"	-- 接受任務後再次對話：希望你可以順利討伐巨龍，這樣故事書中篇章就會出現你的故事了！

g_Msg.Reward = {};
g_Msg.Reward["Fail"] = {};	-- 失敗時字串
g_Msg.Reward["Success"] = {};	-- 成功時字串
g_Msg.Reward["Fail"][1] = "[SC_2012FAIRY_JOHN6]"	-- 屠龍失敗，屠龍分數 <= 30
g_Msg.Reward["Fail"][2] = "[SC_2012FAIRY_JOHN7]"	-- 屠龍失敗，屠龍分數 > 30
g_Msg.Reward["Success"][1] = "[SC_2012FAIRY_JOHN8]"	-- 屠龍成功，屠龍分數 < 30
g_Msg.Reward["Success"][2] = "[SC_2012FAIRY_JOHN10]"	-- 屠龍成功，屠龍分數 => 30

local g_Ticket = 623277;	-- 報名Buff
local g_DragonHp = 623321;	-- 巨龍體力值
local g_PlayerHp = 623278;	-- 玩家體力值

local g_BossBuff = {};	-- 巨龍的Buff(代表靈氣)
g_BossBuff.ResMagic = 623279;	-- 吸收魔法靈氣，玩家以魔法攻擊巨龍時，會治療巨龍 1 點 Hp
g_BossBuff.ResPhysical = 623280;	-- 吸收物理靈氣，玩家以物理攻擊巨龍時，會治療巨龍 1 點 Hp
g_BossBuff.UnDead = 623281;	-- 吸收物理與魔法靈氣，僅有治療可造成傷害

-- 記錄每位參加活動成員的得分，取代舊有以玩家身上的 Reg+1 紀錄分數的作法，因 Reg 值只有在離線時重置，故換區、離開活動範圍等，都會導致其他使用 Reg+1 的活動引發未知的問題
-- 改以 DBID 記錄得分，每個角色在創造後，在 伺服器 端都會有一個獨一無二的固定 ID 提供查詢，這個 ID 就是 DBID
local g_HeroPoints;
---------------------------------------------------------------------------------------
function Lua_na_2012Fairy_LittleJohn()	-- 小強尼(121053) 物件產生劇情

	local LittleJohn = OwnerID();
	BeginPlot( LittleJohn , "LuaN_miyon_action02" , 0 );	-- 掛載活動看板Buff

	g_HeroPoints = {};

	while true do
		if g_FightStatus == 2 then	-- 當巨龍產生時
			PlayMotion( LittleJohn, 149 );	-- 蹲下
		else
			PlayMotion( LittleJohn, ruFUSION_ACTORSTATE_EMOTE_CRY );
			Sleep( 25 );
			PlayMotion( LittleJohn, ruFUSION_ACTORSTATE_EMOTE_CRY );
			Sleep( 25 );
		end
		sleep( 10 );
	end
end

function Lua_na_12fairy_JohnSPK()	-- 小強尼(121053) 對話劇情

	local Owner = OwnerID();	-- 玩家
	local LittleJohn = TargetID();	-- 小強尼

	local Reward = {};	-- 獎勵
	Reward[1] = { 724509, 1 };	-- 必爾汀藥水組 * 1
	Reward[2] = { 240059, 1 };	-- 童話點數券 * 1
	Reward[3] = { 240059, 3 };	-- 童話點數券 * 3
	Reward[4] = { 240059, 5 };	-- 童話點數券 * 5

	-- 防呆機制，避免未知原因導致龍蛋、巨龍被刪除，而延伸的後續問題
	local IsDragonEggAlive = CheckID( g_CheckObj.DragonEgg );
	local IsDragonAlive = CheckID( g_CheckObj.Dragon );

	DebugMsg( Owner, 0, "Stage = "..g_FightStatus..", Dragon egg alive = "..tostring(IsDragonEggAlive)..", Dragon alive = "..tostring(IsDragonAlive) );
	if g_FightStatus == 1 and not IsDragonEggAlive then
		if CheckBuff( Owner, g_Ticket ) then
			CancelBuff_NoEvent( Owner, g_Ticket );
		end
		if IsDragonAlive then
			DelObj( g_CheckObj.Dragon );
		end
		g_FightStatus = 0;
	elseif g_FightStatus == 2 and not IsDragonAlive then
		if IsDragonEggAlive then
			DelObj( g_CheckObj.DragonEgg );
		end
		g_FightStatus = 0;
	end
	-- 

	if CheckFlag( Owner, g_KeyItem.Complete ) == true then	-- 當日已完成任務

		local ReceiveGift = false;	-- 領取獎勵
		local IsValor = false;	-- 屠龍分數是否超過 30 

		for i = 1, #g_KeyItem.GiftLv do	-- 給予獎勵
			if CheckFlag( Owner, g_KeyItem.GiftLv[i] ) then	-- 先查詢符合的獎勵區間
				DebugMsg( Owner, 0, "Reward Lv = "..i );	-- 	-- 獎勵區間
				if i == #g_KeyItem.GiftLv then	-- 屠龍分數 > 30
					IsValor = true;
				end
				ReceiveGift = true;	-- 允許領取獎勵
				SetFlag( Owner, g_KeyItem.GiftLv[i], 0 );	-- 給予符合獎勵區間的獎勵
				GiveBodyItem( Owner, Reward[i][1], Reward[i][2] );	-- 給予獎勵
				Lua_Festival_08_All(Owner);	-- 全勤獎判斷
				break;
			end
		end

		if not ReceiveGift then	-- 已領取獎勵
			SetSpeakDetail( Owner ,g_Msg[5] );	-- 你身上殘留著故事書的氣息，今天無法再次成為童話英雄了！
			return
		end
		DebugMsg( Owner, 0, "IsValor = "..tostring(IsValor) );
		if CheckFlag( Owner, g_KeyItem.KillDragon ) then	-- 屠殺成功
			if IsValor then	-- 屠龍分數 31 以上
				SetSpeakDetail( Owner, g_Msg.Reward["Success"][2] );
			else	-- 屠龍分數 0 ~ 30
				SetSpeakDetail( Owner, g_Msg.Reward["Success"][1] );
				end
			SetFlag( Owner, g_KeyItem.KillDragon, 0 );
		else	-- 屠殺失敗
			if IsValor then	-- 屠龍分數 31 以上
				SetSpeakDetail( Owner, g_Msg.Reward["Fail"][2] );
			else	-- 屠龍分數 0 ~ 30
				SetSpeakDetail( Owner, g_Msg.Reward["Fail"][1] );
			end
		end

	elseif CheckBuff( Owner, g_Ticket ) then	-- 有參加活動的 Buff 時
		SetSpeakDetail( Owner , g_Msg[6] );	-- 希望你可以順利討伐巨龍，這樣故事書中篇章就會出現你的故事了！
	else	-- 當日未完成任務
		if g_FightStatus == 2 then	-- 當龍蛋、巨龍已產生時
			SetSpeakDetail( Owner, g_Msg[4] );	-- 童話中的勇者開始跟巨龍大戰了！好精采唷！
			return
		end
		SetSpeakDetail( Owner, g_Msg[1] );	-- 嗚……嗚…………故事書裡面的巨龍……牠……牠跑出來了！
		AddSpeakOption( Owner, LittleJohn, "[SC_0908SEANSON_53]", "Lua_na_12fairy_John1", 0 );	-- 好，讓我來幫你吧！
		AddSpeakOption( Owner, LittleJohn, "[SO_GETVOC_NO]", "Lua_na_12fairy_No", 0 );
	end
end

function Lua_na_12fairy_No() --拒絕

	local Owner = OwnerID();	-- 玩家
	SetSpeakDetail( Owner , g_Msg[3] );	-- 是喔……
end

function Lua_na_12fairy_John1()

	local Owner = OwnerID();	-- 玩家
	local LittleJohn = TargetID();	-- 小強尼

	if g_FightStatus == 2 then	-- 巨龍產生時，就不讓玩家接取任務
		SetSpeakDetail( Owner , g_Msg[4] );	-- 童話中的勇者開始跟巨龍大戰了！好精采唷！
		return
	end
	SetSpeakDetail( Owner, g_Msg[2] ); 	--太好了！當巨龍出現之後，你就會變成童話中的勇者：【童話遊劍士】或【童話魔巫師】。
	AddSpeakOption( Owner, LittleJohn, "[SC_TRAIN10_NPC_SPEAK04]", "Lua_na_12fairy_trans", 0 );	-- 我準備好了
end

function Lua_na_12fairy_trans()

	local Owner = OwnerID();	-- 玩家
	local LittleJohn = TargetID();	-- 小強尼

	CloseSpeak( Owner );
	AddBuff( Owner, g_Ticket, 0, -1 );	-- 給予報名Buff
	SetFlag( Owner, g_KeyItem.Fight, 1 );	-- 活動進行中
	SysCastSpellLv( Owner, Owner, 499522, 0 );	-- 將玩家傳送至龍蛋(巨龍)旁邊

	if g_FightStatus == 0 then	-- 第一個進入此選項的玩家會呼叫小強尼產生龍蛋的劇情
		g_FightStatus = 1;
		CallPlot( LittleJohn, "Hao_Fairy_CreateDragonEgg", LittleJohn );
	end
end

function Hao_Fairy_CreateDragonEgg( LittleJohn )	-- 由小強尼執行產生龍蛋的劇情

	local DragonEgg = CreateObjByFlag( g_ObjID.DragonEgg, g_CreateFlag, 0, 1 );	 -- 龍蛋
	SetModeEx( DragonEgg, EM_SetModeType_ShowRoleHead, true );	--頭像框
	SetModeEx( DragonEgg, EM_SetModeType_Move, false );	-- 移動
	SetModeEx( DragonEgg, EM_SetModeType_SearchenemyIgnore, true );	-- 被搜尋
	AddToPartition( DragonEgg , 0 ); -- 建立物件

	g_CheckObj.DragonEgg = DragonEgg;	-- 將龍蛋註冊進監控清單中

	local NpcList = SearchRangeNPC( DragonEgg, 400 );
	local OrgID = 100938;	-- 凡瑞娜絲城警衛

	for i = 0 , #NpcList do
		if ReadRoleValue( NpcList[i], EM_RoleValue_OrgID ) == OrgID then
			DelFromPartition( NpcList[i] );	-- 刪除範圍內的警衛，避免警衛攻擊龍
		end
	end
	SetPlot( DragonEgg, "touch", "Hao_Fairy_DragonEggPlot", 40 );	-- 龍蛋的觸碰劇情
end

function Hao_Fairy_DragonEggPlot()	-- 龍蛋的觸碰劇情

	local Owner = OwnerID();	-- 點擊龍蛋的玩家
	local DragonEgg = TargetID();	-- 龍蛋
	local PID = ReadRoleValue( DragonEgg, EM_RoleValue_PID );	-- 是否已生成巨龍
	local HeroList = {};	-- 參與此次征討巨龍的玩家清單
	local Needs = 3;	-- 活動需求人數

	if PID == 1 then	-- 複數玩家同時點擊龍蛋時
		ScriptMessage( Owner, Owner, 2, "[SC_422804]", C_SYSTEM );	-- 目標忙碌中
		return
	end

	if not CheckBuff( Owner, g_Ticket ) or not CheckFlag( Owner, g_KeyItem.Fight ) then	-- 未參加活動的玩家點擊龍蛋時
		ScriptMessage( Owner,  Owner, 2, "[SC_2012FAIRY_DRAGON05]", C_SYSTEM );	--  這是一顆巨大的蛋
		return
	end

	WriteRoleValue( DragonEgg, EM_RoleValue_PID, 1 );
	local Player = SearchRangePlayer( DragonEgg, 200 );	-- 搜尋龍蛋周圍 200 內的玩家

	for i = 0 , #Player do
		DW_CancelTypeBuff( 68, Player[i] );	-- 取消坐騎狀態
		if CheckBuff( Player[i], g_Ticket ) == true and CheckFlag( Player[i], g_KeyItem.Fight )== true then
			table.insert( HeroList, Player[i] );
		end
	end
--	DebugMsg( Owner, 0, "Now Heroes = "..#HeroList );

	if #HeroList < Needs then	-- 周圍參與的玩家人數不足時
		ScriptMessage( Owner, Owner, 1, "[SC_2012FAIRY_DRAGON08]", 0 );	-- 在巨龍蛋附近，沒有足夠成為童話勇者的冒險者。
		WriteRoleValue( DragonEgg, EM_RoleValue_PID, 0 );
		return
	end

	g_HeroPoints = {};	-- 重置每位參與成員的得分
	g_FightStatus = 2;	-- 戰鬥階段，代表巨龍已生成，不讓其他未報名的玩家報名
	SetPlot( DragonEgg, "touch", "", 40 );	-- 關閉龍蛋的觸碰劇情
	SetModeEx( DragonEgg, EM_SetModeType_Show, false );	-- 關閉顯示
	SetModeEx( DragonEgg, EM_SetModeType_Mark, false );	-- 關閉標記
	SetModeEx( DragonEgg, EM_SetModeType_HideName, true );	-- 隱藏名稱
	SetModeEx( DragonEgg, EM_SetModeType_ShowRoleHead, false );	-- 關閉頭像框
	Hide( DragonEgg );

	for i = 1, #HeroList do

		local Player = HeroList[i];
		local DBID = ReadRoleValue( Player, EM_RoleValue_DBID );
		g_HeroPoints[DBID] = 0;	-- 重置每位參與成員的得分
		CancelBuff_NoEvent( Player, g_Ticket );	-- 刪除報名 Buff ，並給予體力值與職業
		AddBuff( Player, 623055, 0, 3 );	-- 不顯示的BUFF，作為判斷距離用
		AddBuff( Player, g_PlayerHp, 9, -1 );	-- 給予玩家體力值
		if i%2 == 1 then
			AddBuff( Player, 623313, 0, -1 );	-- 單數為童話遊劍士
		else
			AddBuff( Player, 623315, 0, -1 );	-- 偶數為童話魔巫師
		end
	end

	local Dragon = CreateObjByFlag( g_ObjID.Dragon, g_CreateFlag, 0, 1 );	-- 巨龍
	SetModeEx( Dragon, EM_SetModeType_Move, true )	-- 移動
	SetModeEx( Dragon, EM_SetModeType_Searchenemy, true )	-- 索敵
	SetModeEx( Dragon, EM_SetModeType_ShowRoleHead, true )	-- 頭像框
	SetModeEx( Dragon, EM_SetModeType_Fight, true )	-- 可砍殺攻擊
	SetModeEx( Dragon, EM_SetModeType_Drag , false )	-- 阻力
	AddToPartition( Dragon, 0 ) -- 建立物件
	g_CheckObj.Dragon = Dragon;	-- 將巨龍註冊進監控清單中

	CallPlot( Dragon, "Hao_Fairy_DragonFight", Dragon, DragonEgg, HeroList );
end

function Hao_Fairy_DragonFight( Dragon, DragonEgg, HeroList )	-- 由巨龍執行巨龍的產生劇情 ( 巨龍、龍蛋、參與此次活動的玩家清單 )

	local Msg = {};
	Msg.Counter = {};
	Msg.Counter[1] = { 240, "[SC_2012FAIRY_DGMES1]" };	-- 巨龍的篇幅已經接近尾聲，約一分鐘之後巨龍將會消失。
	Msg.Counter[2] = { 270, "[SC_2012FAIRY_DGMES2]" };	-- 30秒之後，巨龍將會消失！
	Msg.Counter[3] = { 300, "[SC_2012FAIRY_DGMES3]" };	-- 巨龍的篇幅已經結束，童話巨龍消失了！

	AddBuff( Dragon, g_DragonHp, 99, -1 );	-- 巨龍體力值
	Say( Dragon, "[SC_2012FAIRY_DRAGON_SAY1]" );	-- 是...誰...不...知...死...活...的...喚...醒...我......
	PlayMotion( Dragon, ruFUSION_ACTORSTATE_BUFF_SP02 );	-- 播放登場動作

	local Counter = 0;	-- 計數器
	local OverTime = false;	-- 超過 300 秒，巨龍消失。

	while true do

		Sleep(10);
		Counter = Counter + 1;
	--	DebugMsg( 0, 0, "Counter = "..Counter );

		if Counter > Msg.Counter[3][1] then	-- 超過 300 秒
			OverTime = true;
		end

		for i = #HeroList, 1, -1 do
			local Player = HeroList[i];

			if not CheckID( Player ) then	-- 當目標不存在
			--	DebugMsg( 0, 0, "Remove player, miss target" );
				table.remove( HeroList, i );
			elseif not CheckFlag( Player, g_KeyItem.Fight ) then	-- 當目標非戰鬥中時
			--	DebugMsg( 0, 0, "Remove player, out of combat" );
				table.remove( HeroList, i );
			elseif not CheckBuff( Player, g_PlayerHp ) then	-- 當目標無體力值時
			--	DebugMsg( 0, 0, "Remove player, dead" );
				table.remove( HeroList, i );
			else	-- 距離判斷與發送訊息
				for j = 1, #Msg.Counter do	-- 活動進行時間，發送訊息
					if CheckID( Player ) and Counter == Msg.Counter[j][1] then
						ScriptMessage( Player, Player, 1, Msg.Counter[j][2], 0 );
					end
				end

		 		local Distance = GetDistance( Player, DragonEgg );	-- 監控距離
				if Distance > 200 then
					CancelBuff( Player, g_PlayerHp );
					table.remove( HeroList, i );
				--	DebugMsg( 0, 0, "Remove player, out of range" );
				else
					AddBuff( Player, 623055, 0, 3 );	-- 不顯示的BUFF，作為判斷距離用
					if Distance > 150 then
						ScriptMessage( Player, Player, 1, " [SC_2012FAIRY_DRAGON06]", 0 );	-- 警告！距離巨龍過遠，童話人物篇章的效果將會消失。
					end
				end
			end
		end

		if #HeroList == 0 or OverTime then	-- 當範圍內沒有進行活動的玩家時
			
			if not OverTime then
				Yell( Dragon, "[SC_2012FAIRY_DRAGON_SAY2]", 2 );	--哈哈！什麼『童話勇者』！只是一群膽小鬼，連接近我的勇氣都沒有！
			--	Say( Dragon, "[SC_2012FAIRY_DRAGON_SAY2]" );	--哈哈！什麼『童話勇者』！只是一群膽小鬼，連接近我的勇氣都沒有！
			end
			SetModeEx( Dragon, EM_SetModeType_Fight, false );	-- 關閉砍殺
			g_FightStatus = 1;	-- 將活動階段寫為 1，代表龍蛋產生，但未產生巨龍
			PlayMotionEX( Dragon, ruFUSION_ACTORSTATE_SLEEP_BEGIN, ruFUSION_ACTORSTATE_SLEEP_LOOP );	-- 播放離場動作
			Sleep(25);
			Hide( Dragon );
			SetModeEx( Dragon, EM_SetModeType_Show, false );	-- 關閉顯示
			SetModeEx( Dragon, EM_SetModeType_Mark, false );	-- 關閉標記
			SetModeEx( Dragon, EM_SetModeType_HideName, true );	-- 隱藏名稱
			SetModeEx( Dragon, EM_SetModeType_ShowRoleHead, false );	-- 關閉頭像框
			Sleep(25);
			Show( DragonEgg, 0 );
			SetPlot( DragonEgg, "touch", "Hao_Fairy_DragonEggPlot", 40 );	-- 重新開啟龍蛋的觸碰劇情
			SetModeEx( DragonEgg, EM_SetModeType_Show, true );	-- 顯示
			SetModeEx( DragonEgg, EM_SetModeType_Mark, true );	-- 標記
			SetModeEx( DragonEgg, EM_SetModeType_HideName, false );	-- 不隱藏名稱
			SetModeEx( DragonEgg, EM_SetModeType_ShowRoleHead, true );	-- 頭像框
			WriteRoleValue( DragonEgg, EM_RoleValue_PID, 0 );
			DelObj( Dragon );
			break;
		elseif not CheckBuff( Dragon, g_DragonHp ) then	-- 巨龍死亡時，給予獎勵，表現優異的玩家將額外獲得物品 - 勇者的龍皮包裹

			KillID( Dragon, Dragon );	-- 播放死亡劇情

			for i = 1, #HeroList do
				local Player = HeroList[i];	-- 活動進行中的玩家
				local DBID = ReadRoleValue( Player, EM_RoleValue_DBID );
				SetFlag( Player, g_KeyItem.KillDragon, 1 );	-- 給予屠龍證明
			--	DebugMsg( Player, 0, "Dragon Dead, Point = "..g_HeroPoints[DBID] );
				if g_HeroPoints[DBID] > 29 then	-- 正確施法 > 30 次
					GiveBodyItem( Player, 241450 , 1 );	-- 給予物品 - 勇者的龍皮包裹
				end
				local KillDragonCount = ReadRoleValue( Player, EM_LuaValueFlag_UseItem41 );	-- 檢查玩家殺死巨龍的次數
				WriteRoleValue( Player, EM_LuaValueFlag_UseItem41, KillDragonCount+1 );	-- 殺死巨龍次數+1
				if KillDragonCount + 1 > 9 then	-- 殺死 10 次以上的巨龍時
					if CountBodyItem( Player, 530866 ) == 0 then	-- 稱號 - 沒有我推不倒的龍
						GiveBodyItem( Player, 530866, 1 );
					end
					if CountBodyItem( Player, 530867 ) == 0 then	-- 稱號 - 終結巨龍的勇者 ( 避免在更新前就已累積殺死 10 次以上巨龍的玩家拿不到殺死 1 次的稱號
						GiveBodyItem( Player, 530867, 1 );
					end
				else	-- 殺死 1 次以上的巨龍時
					if CountBodyItem( Player, 530867 ) == 0 then	-- 稱號 - 終結巨龍的勇者
						GiveBodyItem( Player, 530867, 1 );
					end
				end
			end

			g_FightStatus = 0;	-- 將活動階段寫為 0，代表龍蛋與巨龍未生成
			Sleep(20);
			DelObj( Dragon );
		else
			if Counter%3 == 0 then	-- 巨龍每 3 秒執行一次攻擊

				local RangeAttack = 850378;	-- 範圍傷害
				local SingleAttack = 850377;	-- 單體傷害
				local DragonBall = 121189;	-- 龍之靈
				local BuffTime = 10;	-- 持續時間(單位:1秒)
				local Random = Math.Random( 100 );

				if Counter%30 == 0 then	-- 每 30 秒施放一次靈氣
					if Random < 34 then
						Addbuff( Dragon, g_BossBuff.ResMagic, 0, BuffTime );	-- 吸收魔法系傷害，並轉化為體力值。
					elseif Random < 67 then
						Addbuff( Dragon, g_BossBuff.ResPhysical, 0, BuffTime );	-- 吸收物理系傷害，並轉化為體力值。
					else
						Addbuff( Dragon, g_BossBuff.UnDead, 0, BuffTime );	-- 吸收攻擊系及魔法系並轉化為體力值，唯有治療系法術會造成傷害。
					end
				end

				if Counter%12 == 0 then	-- 每 12 秒進行一次範圍攻擊
					CastSpell( Dragon , Dragon , RangeAttack );	-- 範圍攻擊
				else	-- 每 3 秒進行一次單體攻擊或建立龍之靈( 121189 )
					local Target = HeroList[DW_Rand( #HeroList )];	-- 隨機到的目標
					if Random < 61 then	-- 3/5 機率
						CastSpell( Dragon, Target, SingleAttack )	-- 隨機從參與活動的玩家中選一個，進行攻擊
					else	-- 2/5 機率
						local TargetPos = Vector_GetRolePos( Target );
						local Room = ReadRoleValue( Target, EM_RoleValue_RoomID );
						local Ball = CreateObj( DragonBall, TargetPos.X, TargetPos.Y, TargetPos.Z, 0, 1 );	-- 在目標位置生成龍之靈
						AddToPartition ( Ball, Room );
					end

					if Random < 6 then	-- 1/20 機率
						Say( Dragon, "[SC_2012FAIRY_DRAGON_SAY4]" )	--你還能承受多少攻擊呢......
					elseif Random < 11 then	-- 1/10 機率
						Say( Dragon, "[SC_2012FAIRY_DRAGON_SAY5]" )	--你看起來，滿可口的呢......
					end
				end
			end
		end
	end
end

function Lua_na_fairyplayer_DMG()	-- 巨龍對玩家所施展的傷害法術(623310)

	local Owner = OwnerID();	-- 巨龍
	local Target = TargetID();	-- 玩家
	local BuffX = FN_CountBuffLevel(Target,g_PlayerHp);

	if CheckFlag( Target, g_KeyItem.Fight ) == true and CheckBuff( Target, g_PlayerHp ) == true then	-- 當玩家身上有報名的重要物品與剩餘體力值時

		if CheckBuff( Target, 623318 ) == false then	-- 如果玩家身上沒有幻影護盾
			CancelBuff( Target, g_PlayerHp );
			if BuffX > 0 then	-- 有剩餘體力值時
				AddBuff( Target, g_PlayerHp, BuffX-1, -1 );
			else
				CancelBuff( Target , 623313 );	-- 遊劍士
				CancelBuff( Target , 623315 );	-- 魔巫師
				SetFlag( Target, g_KeyItem.Fight, 0 );	-- 關閉玩家正在進行活動的旗標
			end
		else	-- 當玩家身上有幻影護盾時，給予 1 點分數 
			local DBID = ReadRoleValue( Target, EM_RoleValue_DBID );
			g_HeroPoints[DBID] = g_HeroPoints[DBID] + 1;
		--	DebugMsg( Target, 0, "Shield, Point = "..g_HeroPoints[DBID] );
		end
	end
end

function Lua_na_fairy_BossBall()	-- 龍之靈物件產生劇情

	local Owner = OwnerID();
	sleep(20);
	SysCastSpellLv( Owner, Owner, 499521, 0 );
	sleep(10);
	DelObj(Owner);
end
---------------------------------------------------------------------------------------
function Lua_na_fairy_checkboss()	-- 掛載在降雷術(499630)、大劍揮擊(499631)的使用檢查 Lua，若目標沒有巨龍無敵術(表示非巨龍)或非活動目標時，表示目標錯誤

	local Target = TargetID();

	local IsPlayer = ReadRoleValue( Target, EM_RoleValue_IsPlayer );
	if IsPlayer == 1 then
		return false;
	end

	local OrgID = ReadRoleValue( Target, EM_RoleValue_OrgID );
	if OrgID ~= g_ObjID.Dragon then
		return false;
	end
	return true;
end

function Lua_na_fairy_checkTG()	-- 掛載在治癒術(499633)的使用檢查 Lua，若目標沒有巨龍無敵術(表示非巨龍)或非活動目標時，表示目標錯誤

	local Owner = OwnerID();
	local Target = TargetID();
	local PlayerHP = FN_CountBuffLevel( Target, g_PlayerHp );

	local IsPlayer = ReadRoleValue( Target, EM_RoleValue_IsPlayer );
	if IsPlayer == 1 then
		local PlayerHP = FN_CountBuffLevel( Target, g_PlayerHp );
		if PlayerHP > 8  then -- 目標是擁有童話篇章的玩家
			ScriptMessage( Owner, Owner, 1, "[SC_2012FAIRY_DRAGON01]", 0 );	 --目標童話英雄生命值已達上限
			return false;
		end
		return true;
	end

	local OrgID = ReadRoleValue( Target, EM_RoleValue_OrgID );
	if OrgID ~= g_ObjID.Dragon then
		return false;
	end
	return true;
end

function Lua_na_fairyboss_DMG()	-- 大劍揮擊(499631)、玩家對巨龍的物理傷害

	local Owner = OwnerID();	-- 玩家
	local Target = TargetID();	-- 巨龍
	local DragonHp = FN_CountBuffLevel( Target, g_DragonHp );	-- 巨龍體力值

	if CheckBuff( Target , 623280 ) == true then	-- 如果龍有抵抗物理攻擊的BUFF
		ScriptMessage( Owner, Owner, 1, "[SC_2012FAIRY_DRAGON02]", 0 );	-- 童話巨龍吸收了大劍揮擊的攻擊
		if DragonHp < 99 then
			CancelBuff( Target, g_DragonHp );
			AddBuff( Target, g_DragonHp, DragonHp+1, -1 );
		end
	elseif CheckBuff( Target , 623281 ) == true then	-- 幽靈化，攻擊會幫龍補血
		ScriptMessage( Owner, Owner, 1, "[SC_2012FAIRY_DRAGON04]", 0 );	-- 巨龍呈現幽靈化！所受的攻擊傷害將轉化為體力補充。
		if DragonHp < 99 then
			CancelBuff( Target, g_DragonHp );
			AddBuff( Target, g_DragonHp, DragonHp+1, -1 );
		end
	else	-- 當玩家對巨龍造成傷害時
		local DBID = ReadRoleValue( Owner, EM_RoleValue_DBID );
		g_HeroPoints[DBID] = g_HeroPoints[DBID] + 1;
	--	DebugMsg( Owner, 0, "Physical, Point = "..g_HeroPoints[DBID] );
		CancelBuff( Target, g_DragonHp );
		if DragonHp > 0 then
			AddBuff( Target, g_DragonHp, DragonHp-1, -1 );
			PlayMotion( Target ,ruFUSION_ACTORSTATE_HURT_NORMAL );
		end
	end
end
---------------------------------------------------------------------------------------
function Lua_na_fairyboss_MDMG()	--降雷術(499630)、玩家對巨龍的魔法傷害

	local Owner = OwnerID();	-- 玩家
	local Target = TargetID();	-- 巨龍
	local DragonHp = FN_CountBuffLevel( Target, g_DragonHp );	-- 巨龍體力值

	if CheckBuff( Target , 623279 ) == true then	-- 如果龍有抵抗魔法攻擊的BUFF
		ScriptMessage( Owner, Owner, 1, "[SC_2012FAIRY_DRAGON03]", 0 );
		if DragonHp < 99 then
			CancelBuff( Target, g_DragonHp );
			AddBuff( Target, g_DragonHp, DragonHp+1, -1 );
		end
	elseif CheckBuff( Target, 623281 ) == true then  --幽靈化，攻擊會幫龍補血
		ScriptMessage( Owner , Owner , 1 , "[SC_2012FAIRY_DRAGON04]" , 0 ) --巨龍呈現幽靈化！所受的攻擊傷害將轉化為體力補充。
		if DragonHp < 99 then
			CancelBuff( Target, g_DragonHp );
			AddBuff( Target, g_DragonHp, DragonHp+1, -1 );
		end
	else	-- 當玩家對巨龍造成傷害時
		local DBID = ReadRoleValue( Owner, EM_RoleValue_DBID );
		g_HeroPoints[DBID] = g_HeroPoints[DBID] + 1;
	--	DebugMsg( Owner, 0, "Magic, Point = "..g_HeroPoints[DBID] );

		CancelBuff( Target, g_DragonHp );
		if DragonHp > 0 then
			AddBuff( Target, g_DragonHp, DragonHp-1, -1 );
			PlayMotion( Target, ruFUSION_ACTORSTATE_HURT_NORMAL );
		end
	end
end
---------------------------------------------------------------------------------------
function Lua_na_fairyboss_Heal()	-- 治癒術(499633) 玩家對玩家或對巨龍使用

	local Owner = OwnerID()	-- 玩家
	local Target = TargetID()	-- 目標

	if CheckBuff( Target , g_DragonHp ) == true then --目標是巨龍

		local DragonHp = FN_CountBuffLevel(Target,g_DragonHp);	-- 巨龍體力值

		if CheckBuff( Target , 623281 ) == true then --幽靈化

			local DBID = ReadRoleValue( Owner, EM_RoleValue_DBID );
			g_HeroPoints[DBID] = g_HeroPoints[DBID] + 1;
		--	DebugMsg( Owner, 0, "Heal Dragon, Point = "..g_HeroPoints[DBID] );

			CancelBuff( Target, g_DragonHp );
			if DragonHp > 0 then
				AddBuff( Target, g_DragonHp, DragonHp-1, -1 );
				PlayMotion( Target, ruFUSION_ACTORSTATE_HURT_NORMAL );	-- 播放受傷動作
			end
		else
			ScriptMessage( Owner, Owner, 1, "[SC_2012FAIRY_DRAGON07]", 0 );	-- 無法為童話巨龍回復體力值。
		end
	elseif CheckBuff( Target , g_PlayerHp ) == true then -- 目標是擁有童話英雄的玩家

		local PlayerHp = FN_CountBuffLevel(Target,g_PlayerHp);	-- 英雄的體力值

		if PlayerHp < 9  then	-- 沒有溢補時，才獲得分數
			local DBID = ReadRoleValue( Owner, EM_RoleValue_DBID );
			g_HeroPoints[DBID] = g_HeroPoints[DBID] + 1;
		--	DebugMsg( Owner, 0, "Heal, Point = "..g_HeroPoints[DBID] );

			CancelBuff( Target, g_PlayerHp );
			AddBuff( Target, g_PlayerHp, PlayerHp+1, -1 );
		end
	end
end
---------------------------------------------------------------------------------------
function Lua_na_12fairy_delbuff()	-- 當玩家因距離過遠離場時，或戰鬥結束時執行

	local Owner = OwnerID();
	local DBID = ReadRoleValue( Owner, EM_RoleValue_DBID );
	local Lv = ReadRoleValue( Owner, EM_RoleValue_Lv );
	local SubLv = ReadRoleValue( Owner, EM_RoleValue_LV_SUB );

	CancelBuff( Owner , g_PlayerHp );	-- 童話英雄體力值
	CancelBuff( Owner , 623313 );	-- 遊劍士
	CancelBuff( Owner , 623315 );	-- 魔巫師

	if g_HeroPoints == nil then	-- 避免玩家於伺服器關閉前進行遊戲，等到重新開啟後才登入，而搜尋不到此值的問題
		g_HeroPoints = {};
	end

	if g_HeroPoints[DBID] == nil then
		g_HeroPoints[DBID] = 0;
	end
--	DebugMsg( Owner, 0, "Reward Point = "..g_HeroPoints[DBID] );

	if g_HeroPoints[DBID] == 0 then	-- 區間1
		SetFlag( Owner, g_KeyItem.GiftLv[1], 1 );
	elseif g_HeroPoints[DBID] < 11 then	-- 區間2
		SetFlag( Owner, g_KeyItem.GiftLv[2], 1 );
	elseif g_HeroPoints[DBID] < 31 then	-- 區間3
		SetFlag( Owner, g_KeyItem.GiftLv[3], 1 );
	else	-- 區間4
		SetFlag( Owner, g_KeyItem.GiftLv[4], 1 );
	end

	SetFlag( Owner, g_KeyItem.Fight, 0 );	-- 活動進行中
	SetFlag( Owner, g_KeyItem.Complete, 1 );	-- 給予每日完成旗標
	ScriptMessage( Owner, Owner, 2, "[SC_2012FAIRY_REWARD1]", C_SYSTEM );	-- 童話勇者的效果已消失，到中央廣場向小強尼回報結果！
	ScriptMessage( Owner, Owner, 0, "[SC_2012FAIRY_REWARD1]", C_SYSTEM );
	DesignLog( Owner , 121052 , "Lv = "..Lv.." SubLv = "..SubLv ); 	-- 回傳活動參與值
end

function LuaI_241450( Option )	-- 物品 - 勇者的龍皮包裹

	local PlayerID = OwnerID()
	local PackageID = 241450
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 726138 , 1 )	
	end
end

function Lua_na_12fairy_delbuff2()	-- 623277 童話故事人物篇章
	SetFlag( OwnerID() , g_KeyItem.Fight, 0 );
end

--↓測試用指令
function Hao_Fairy_Dragon_SetScore(Num)	-- 需要在 Zone 2 使用，此值才會正確被列入獎勵要素

	local Owner = OwnerID();
	local DBID = ReadRoleValue( Owner, EM_RoleValue_DBID );

	if g_HeroPoints == nil then g_HeroPoints = {}; end
	if g_HeroPoints[DBID] == nil then g_HeroPoints[DBID] = 0; end

	g_HeroPoints[DBID] = Num;
	Say( Owner, "Your score = "..g_HeroPoints[DBID] );
end

function Lua_na_12fairy_addbuff2()	-- 需要在 Zone 2 使用，此值才會正確被設定

--	local Owner = OwnerID()
--	WriteRoleValue( Owner , EM_RoleValue_Register1 , 30)
--	local Reg1 = ReadRoleValue( Owner , EM_RoleValue_Register1 )
--	Say( Owner , "REG 2 = " ..Reg1)

	local Owner = OwnerID();
	local DBID = ReadRoleValue( Owner, EM_RoleValue_DBID );

	if g_HeroPoints == nil then g_HeroPoints = {}; end
	if g_HeroPoints[DBID] == nil then g_HeroPoints[DBID] = 0; end

	g_HeroPoints[DBID] = 30;
	Say( Owner, "Your score = "..g_HeroPoints[DBID] );
end

function Lua_na_12fairy_Title0()
	local Owner = OwnerID()
	WriteRoleValue( Owner , EM_LuaValueFlag_UseItem41 , 0)
	local kill = ReadRoleValue( Owner ,EM_LuaValueFlag_UseItem41 )
	Say( Owner , "kill = " .. kill )
end

function Lua_na_12fairy_Title9()
	local Owner = OwnerID()
	WriteRoleValue( Owner , EM_LuaValueFlag_UseItem41 , 9)
	local kill = ReadRoleValue( Owner ,EM_LuaValueFlag_UseItem41 )
	Say( Owner , "kill = " .. kill )
end

function Lua_na_12fairy_SCORE()	-- 需要在 Zone 2 使用，此值才會正確被讀取

--	local Owner = OwnerID();
--	Say( Owner , "Score = " ..ReadRoleValue( Owner , EM_RoleValue_Register1) )
	local Owner = OwnerID();
	local DBID = ReadRoleValue( Owner, EM_RoleValue_DBID );
	if g_HeroPoints == nil then g_HeroPoints = {}; end
	if g_HeroPoints[DBID] == nil then g_HeroPoints[DBID] = 0; end
	Say( Owner, "Your score = "..g_HeroPoints[DBID] );
end

function Lua_na_12fairy_HERO()
	local Owner = OwnerID()
	AddBuff( Owner,623277, 0 , -1 )
	SetFlag (Owner , 546905, 1 )
end

--活動判斷全部重置
function Lua_na_2012Fairy_Reset() 
	local Owner = OwnerID() 
	WriteRoleValue( Owner , EM_RoleValue_Register1 , 0 )
	CancelBuff( Owner, 623277)
	SetFlag( Owner , 546907 , 0 )	 --每日
	SetFlag( Owner , 546903 , 0 )	--獎勵區間1
	SetFlag( Owner , 546904 , 0 )	--獎勵區間2
	SetFlag( Owner , 546906 , 0 )	--獎勵區間3		
	SetFlag( Owner , 546909 , 0 )	--獎勵區間4
	SetFlag( Owner , 546910 , 0 )	--龍死亡
	SetFlag( Owner , 546905 , 0 )	 --戰鬥
end