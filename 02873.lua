--本段劇情使用全域變數如下：

--Global_Run_426127
--這是table, 只有表演進行時存在，表演結束則設為nil

--Global_player_queue
--這是table, 有玩家在排隊等著看表演時才會存在

--Global_Morake_426127
--這是摩瑞克的GUID, 玩家和此NPC對話，然後點擊對話選項以觸發任務(不會被清除)

--此任務的進行流程是和摩瑞克(122067)對話，若任務狀態正確，會有一個對話選項可選
--點擊對話選項，若沒有表演在進行，新的表演立刻執行。若有，詢問玩家是否進入佇列
--進佇列的玩家會不時收到訊息，尚有多久表演將重新開始
--表演結束會確認佇列中是否有玩家在等待，若有，則重新開始表演
--開始時，佇列中的玩家則會被傳送到指定位置

--本文件附有測試指令，請搜尋 Lua_426127_clear
--本文件中的語法  Global_Run_426127.waiting_player  和 Global_Run_426127[waiting_player] 是相同意思
--只是把 [ ] 中弧號 換成 . 的模式，讀起來比較輕鬆
function Lua_122067_szLuaScript()--摩瑞克對話劇情
	local Player,Morake=OwnerID(),TargetID();
	Global_Morake_426127=Morake;
	
	--檢查任務狀態：不符合就呈現非任務相關內容
	local IsNormalState=true;
	local Quest_TwoVoice=426127;
	if ( CheckAcceptQuest(Player, Quest_TwoVoice) == true ) then
		IsNormalState = false;
	end

	if ( CheckFlag(Player, 547725) == true ) then
		IsNormalState = true;
	end

	if IsNormalState == true then
		LoadQuestOption(Player);
		return;
	end
	
	--接了兩個聲音(426127)之後的狀態
	SetSpeakDetail(Player, "[SC_Z25Q426127_AN_1]");	
	AddSpeakOption(Player, Morake, "[SC_Z25Q426127_AN_2]", "Lua_122067_sz_option", 0);
end
function Lua_122067_sz_option()--進行任務的選項
	local Player, Morake=OwnerID(), TargetID();
	local Quest_TwoVoice=426127;
	
	--確認任務狀態
	local IsQuestRunning;
	local InQueue;
	if ( Global_Run_426127 ~= nil ) then
		IsQuestRunning=true;
	else
		IsQuestRunning=false;
	end
	
	--直接開始表演
	if IsQuestRunning == false then
		Global_Run_426127={ waiting_player=1 };
		Global_player_queue = Global_player_queue or {};
		table.insert(Global_player_queue, Player);
		BeginPlot(Morake, "Lua_426127_execution", 0);
		CloseSpeak(Player);
		return;
	end
	
	--避免重複報名
	for pos=1, table.getn( Global_player_queue ), 1 do
		local who = Global_player_queue[pos];
		if Player == who then
			InQueue = true;
		end
	end
	if InQueue == true then
		ScriptMessage( Player, Player, 1, "[SC_QUESTSTRING_16]" , 0);
		return;
	end
	
	--詢問是否要進入佇列
	BeginPlot(Player, "Lua_426127_AddQueue_option", 0);
	CloseSpeak(Player);
end
function Lua_426127_AddQueue_option()--玩家畫面出現詢問框：是否要進入佇列
	
	--參數設定
	local str_main="[SC_QUESTSTRING_13]";
	local str_lOption="[SO_GETVOC_YES]";
	local str_rOption="[SO_NEWHANDNO]";
	local longest_dis=70;
	
	--變數宣告
	local Player=OwnerID();
	Morake=Global_Morake_426127;
	
	--開啟詢問視窗
	DialogCreate(Player, EM_LuaDialogType_YesNo, str_main);
	DialogSelectStr(Player, str_lOption);
	DialogSelectStr(Player, str_rOption);
	
	--等待玩家選擇，至多120秒
	local choice_player=LuaS_DialogRePort_TwoChoose(Player);
	
	--延遲選擇，重新判斷
	if ( choice_player == "Yes" ) then
		if Global_Run_426127==nil then
			Global_Run_426127={ waiting_player=1 };
			Global_player_queue = Global_player_queue or {};
			table.insert(Global_player_queue, Player);
			BeginPlot(Morake, "Lua_426127_execution", 0);
		else
			Global_Run_426127.waiting_player = Global_Run_426127.waiting_player + 1;
			Lua_426127_queue();
		end
	end
end
function Lua_426127_queue()--加入等待佇列; 此佇列中玩家會收到剩餘秒數
	
	--取GUID
	local Morake=Global_Morake_426127;
	local Player=OwnerID();
	
	Global_player_queue = Global_player_queue or {};
	--進入佇列
	table.insert(Global_player_queue, Player);
	ScriptMessage(Player, Player, 3, "[SC_QUESTSTRING_16]", 0);--你加入了等待劇情演出的佇列
	
	--時間可能延遲，再次校對表演狀態
	local IsQuestRunning;
	if Global_Run_426127 == nil then
		IsQuestRunning = false;
	else
		IsQuestRunning = true;
	end
	
	--表演進行中，把玩家送進佇列
	if IsQuestRunning == true then
		Global_Run_426127.waiting_player = Global_Run_426127.waiting_player + 1;
		return;
	end
	
	--表演已結束，直接重新開始; 重新建立全域變數
	if IsQuestRunning == false then
		Global_Run_426127={waiting_player=1};
		BeginPlot(Morake, "Lua_426127_execution", 0);
	end
end
function Lua_426127_execution()--表演流程
	
	--變數宣告：
	local list={};
	Global_Run_426127.playerlist = {};
	local move_flag=781272;
	local quest_flag=547725;
	local client_buff=624065;
	local blind_buff=620001;
	local x,y,z,dir;
	local music_track={}
	local IsAnyPlayerInQueue;
	if  #Global_player_queue ~= 0 then
		IsAnyPlayerInQueue = true;
	else
		IsAnyPlayerInQueue = false;
	end
	
	--物件編號
	local orgid={morake=122112, jill=122111, kadmose=122068, light_dragon=122074, dark_dragon=122073};
	
	--副函式宣告
	--此表演流程用到三種副函式: KickLeaverOut,  msg_toList ,DelObjTable_msg_toList
	--這三個函式會組合使用，通常你會看到它們一起出現
	--模式是先過濾玩家名單，再用最新的正確名單來做後續處理
	
	--KickLeaverOut 是用來確認玩家仍符合任務狀態，沒有放棄任務，離得太遠，etc.
	--看到此函式請視同為table 作用: 它的用法純粹是把table丟進去，回傳過濾完的結果，回傳nil就是沒人
	local KickLeaverOut = function (player_table)--剔除無效玩家
		if player_table==nil then
			return nil;
		end
		local list={};
		local client_buff=624065;
		for pos=1, table.getn(player_table), 1 do
			local IsGone=false;
			local Player=player_table[pos];
			
			--檢測項目
			if ( Player == nil ) then
				IsGone = true;
			end
			if IsGone==false and ( CheckID(Player) == false ) then
				IsGone = true;
			end
			if IsGone==false and ( GetDistance( Global_Morake_426127, Player)>150 ) then
				CancelBuff_NoEvent( Player, client_buff );
				ScriptMessage(Player, Player, 3, "[SC_QUESTSTRING_15]", 0);
				IsGone = true;
			end
			if IsGone==false and CheckAcceptQuest(Player, 426127)==false then
				CancelBuff_NoEvent( Player, client_buff );
				IsGone = true;
			end
			if ( IsGone == false ) then
				table.insert( list, Player);
			end
		end
		if table.getn(list)==0 then
			return nil;
		end
		return list;
	end
	--msg_toList專門用來通知正在排隊的玩家，還有幾秒表演就要開始
	--第一個參數填的是table, 而且為了避報錯， 會先用 KickLeaverOut 進行過濾, 第二個參數是剩餘秒數
	local msg_toList = function (player_table, remain_sec)--副函式:傳訊佇列內的玩家目前進度
		if player_table==nil then
			return;
		end
		if remain_sec==nil then
			return;
		end
		local _msg="[SC_QUESTSTRING_14][$SETVAR1="..remain_sec.."]";
		for pos=1, table.getn(player_table),1 do
			ScriptMessage(player_table[pos], player_table[pos], 2, _msg, 0);
		end
	end
	--表演中會保持觀賞表演的玩家清單，清單經過 KickLeaverOut過濾的結果若是nil 代表就沒人
	--DelObjTable_msg_toList 會清除所有產生的物件，並且傳訊息給正在排隊的玩家，通知他們下一場要開始
	local DelObjTable_msg_toList = function ( ObjTable, queue_table )--副函式:清除所有產生的物件 + 傳訊告知下場要開始
		--清除所有物件
		for pos=1, table.getn(ObjTable),1 do
			DelObj( ObjTable[pos] );
		end
		
		--無人排隊; reset
		if queue_table == nil then
			Global_Run_426127 = nil;
			return;
		end
		
		--有人排隊; 傳訊;
		local _msg="[SC_QUESTSTRING_14][$SETVAR1=5".."]";
		for pos=1, table.getn(queue_table),1 do
			ScriptMessage(queue_table[pos], queue_table[pos], 2, _msg, 0);
		end
		
		--準備重新開始
		BeginPlot(Global_Morake_426127, "Lua_426127_repeated", 0);
	end
	
	--資料初始化
	if  IsAnyPlayerInQueue then
		Global_Run_426127.playerlist = KickLeaverOut(Global_player_queue);
		--佇列無人
		if Global_Run_426127.playerlist==nil then
			Global_Run_426127 = nil;
			return;
		end
		
		--計算站位資訊
		local list_length=table.getn(Global_Run_426127.playerlist);
		local equal_angle=180/list_length;
		local x,y,z,dir=DW_Location(Global_Morake_426127);
		
		--設定資訊; 傳送至指定位置; 音樂;
		for pos=1, list_length, 1 do
			local player=Global_Run_426127.playerlist[pos];
			AddBuff(player, blind_buff, 0, 2);
			AddBuff(player, client_buff, 0, -1);
			SetPos(player, DW_NewLocation( 60+( pos*equal_angle ), 50, x,y,z,dir) );
			Lua_StopBGM( player );
			music_track[player] = PlayMusicToPlayer(player,"music/zone/005/zone005_mystic_altar_outside.mp3", false)
		end
		sleep(10);
		
		--清空佇列
		Global_player_queue = {};
		Global_Run_426127.waiting_player = 0;
	else
		return;
	end
	--物件初始化
	x,y,z,dir=DW_Location(move_flag, 50);
	local Kadmose=CreateObj(orgid.kadmose, x,y,z,dir, 1);
	MoveToFlagEnabled(Kadmose, false);
	SetDefIdleMotion(Kadmose, ruFUSION_MIME_SLEEP_LOOP);
	AddToPartition(Kadmose, 0);
	
	x,y,z,dir=DW_Location(move_flag, 51);
	local Light_Dragon=CreateObj(orgid.light_dragon, x,y,z,dir, 1);
	MoveToFlagEnabled(Light_Dragon, false);
	AddToPartition(Light_Dragon, 0);
	
	x,y,z,dir=DW_Location(move_flag, 54);
	local Dark_Dragon=CreateObj(orgid.dark_dragon, x,y,z,dir, 1);
	MoveToFlagEnabled(Dark_Dragon, false);
	PlayMotionEX(Dark_Dragon, ruFUSION_ACTORSTATE_CROUCH_BEGIN, ruFUSION_ACTORSTATE_CROUCH_LOOP);
	
	x,y,z,dir=DW_Location(move_flag, 52);
	local Jill=CreateObj(orgid.jill, x,y,z,dir, 1);
	MoveToFlagEnabled(Jill, false);
	AddToPartition(Jill, 0);
	
	x,y,z,dir=DW_Location(move_flag, 53);
	local Morake=CreateObj(orgid.morake, x,y,z,dir, 1);
	MoveToFlagEnabled(Morake, false);
	AddToPartition(Morake, 0);
	
	--記錄物件GUID, 以備刪除時使用
	local ObjTable={Kadmose, Light_Dragon, Dark_Dragon, Jill, Morake};
	
	--正式開始
	--光龍走到旗標8:……由於我的疏忽才讓妳產生……現在察覺到了，就不讓妳再為所欲為……。
	sleep(15);
	PlayMotion(Light_Dragon, ruFUSION_ACTORSTATE_EMOTE_SPEAK);
	sleep(10);
	Yell(Light_Dragon, "[SC_Z25Q426127_1]", 3);
	sleep(30);
	x,y,z,dir=DW_Location(move_flag, 55);
	sleep( Move(Light_Dragon, x,y,z) );
	sleep(10);
	
	--光龍生氣動作：ruFUSION_ACTORSTATE_EMOTE_ANGRY
	--中央藍色字串：礙事！老頭，別垂死掙扎了，放棄的話，我們都可以輕鬆點！
	--中斷檢查
	Global_Run_426127.playerlist = KickLeaverOut(Global_Run_426127.playerlist);
	list=KickLeaverOut(Global_player_queue);
	if Global_Run_426127.playerlist == nil then 
		DelObjTable_msg_toList(ObjTable, list);
		return;
	else
		msg_toList( list, 45 ); 
	end
	StopMove(Light_Dragon, true);
	PlayMotion(Light_Dragon, ruFUSION_ACTORSTATE_EMOTE_ANGRY);
	sleep(15);
	ScriptMessage(Light_Dragon, -1, 0, "[SC_Z25Q426127_2]", "0xFF75BEFB");
	ScriptMessage(Light_Dragon, -1, 2, "[SC_Z25Q426127_2]", "0xFF75BEFB");
	sleep(30);
	
	--光龍走到旗標7
	--光龍搖頭動作：ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE
	--光龍：為了不讓黑暗掩蓋未來，絕對要封印妳......！
	x,y,z,dir=DW_Location(move_flag, 54);
	sleep( Move(Light_Dragon, x,y,z));
	sleep(10);
	StopMove(Light_Dragon, true);
	PlayMotion(Light_Dragon, ruFUSION_ACTORSTATE_SHIELD_BASH);
	sleep(10);
	Yell(Light_Dragon, "[SC_Z25Q426127_3]", 3);
	sleep(30);
	
	--光龍走到旗標8
	--光龍嘲笑動作：ruFUSION_ACTORSTATE_EMOTE_LAUGH
	--幽龍：哈哈，老頭，你睡傻了嗎？你已經太過虛弱，來不及了！
	--中斷檢查
	Global_Run_426127.playerlist = KickLeaverOut(Global_Run_426127.playerlist);
	list=KickLeaverOut(Global_player_queue);
	if Global_Run_426127.playerlist == nil then 
		DelObjTable_msg_toList(ObjTable, list);
		return;
	else
		msg_toList( list, 35 ); 
	end
	
	x,y,z,dir=DW_Location(move_flag, 55);
	sleep( Move(Light_Dragon, x,y,z));
	sleep(10);
	StopMove(Light_Dragon, true);
	PlayMotion(Light_Dragon, ruFUSION_ACTORSTATE_EMOTE_LAUGH);
	sleep(20);
	ScriptMessage(Light_Dragon, -1, 0, "[SC_Z25Q426127_4]", "0xFF75BEFB");
	ScriptMessage(Light_Dragon, -1, 2, "[SC_Z25Q426127_4]", "0xFF75BEFB");
	sleep(30);
	
	--光龍走到旗標7
	--光龍生氣動作：ruFUSION_ACTORSTATE_EMOTE_ANGRY
	--光龍：可惡……唔啊啊啊！
	x,y,z,dir=DW_Location(move_flag, 54);
	sleep( Move(Light_Dragon, x,y,z));
	sleep(30);
	PlayMotion(Light_Dragon, ruFUSION_ACTORSTATE_EMOTE_ANGRY);
	sleep(10);
	Yell(Light_Dragon, "[SC_Z25Q426127_5]", 3);
	--中斷檢查
	Global_Run_426127.playerlist = KickLeaverOut(Global_Run_426127.playerlist);
	list=KickLeaverOut(Global_player_queue);
	if Global_Run_426127.playerlist == nil then 
		DelObjTable_msg_toList(ObjTable, list);
		return;
	else
		msg_toList( list, 25 ); 
	end
	sleep(15);
	
	--光龍跪下動作：ruFUSION_ACTORSTATE_CRAFTING_LOOP
	--以光龍為中心放出暗系特效，特效結束後變成幽龍（也就是產生在旗標7的位置）
	PlayMotionEX(Light_Dragon, ruFUSION_ACTORSTATE_CROUCH_BEGIN, ruFUSION_ACTORSTATE_CROUCH_LOOP);
	local DarkShowEffect=496177
	sleep(10);
	SysCastSpellLv(Light_Dragon, Light_Dragon, DarkShowEffect, 1);
	sleep(10);
	AddToPartition(Dark_Dragon, 0);
	PlayMotionEX(Dark_Dragon, ruFUSION_ACTORSTATE_CROUCH_LOOP, ruFUSION_ACTORSTATE_CRAFTING_END)
	Hide(Light_Dragon);
	
	--除了幽龍以外的眾人：ruFUSION_ACTORSTATE_DODGE
	--除了幽龍之外的眾人：！
	PlayMotion(Morake, ruFUSION_ACTORSTATE_DODGE);
	PlayMotion(Jill, ruFUSION_ACTORSTATE_DODGE);
	PlayMotionEX(Kadmose, ruFUSION_ACTORSTATE_SLEEP_END, ruFUSION_ACTORSTATE_COMBAT_UNARMED);
	SetDefIdleMotion(Kadmose, ruFUSION_MIME_IDLE_COMBAT_UNARMED);
	Yell(Morake, "[SC_Z25Q426127_6]", 3);
	Yell(Jill, "[SC_Z25Q426127_6]", 3);
	--玩家也做出反應
	Global_Run_426127.playerlist = KickLeaverOut(Global_Run_426127.playerlist);
	for pos=1, table.getn(Global_Run_426127.playerlist), 1 do
		NPCSay( Global_Run_426127.playerlist[pos], "[SC_Z25Q426127_6]");
		PlayMotion( Global_Run_426127.playerlist[pos], ruFUSION_ACTORSTATE_DODGE);
	end
	
	--幽龍起身動作：ruFUSION_ACTORSTATE_CROUCH_END
	--幽龍：嘻嘻嘻嘻！
	PlayMotion(Dark_Dragon, ruFUSION_ACTORSTATE_CROUCH_END);
	Yell(Dark_Dragon, "[SC_Z25Q426127_7]", 3);
	sleep(20);
	PlayMotion(Kadmose, ruFUSION_ACTORSTATE_HURT_NORMAL);
	
	--幽龍：現在，礙事的老頭睡著了，該死的也得去死了！
	--幽龍使用暗系法術給冰龍最後一擊，原本站著的冰龍死亡
	Yell(Dark_Dragon, "[SC_Z25Q426127_8]", 3);
	local PowerDarkFlyEffect=850739;
	sleep(20);
	CastSpell(Dark_Dragon, Kadmose, PowerDarkFlyEffect);
	sleep(10);
	PlayMotionEX(Kadmose, ruFUSION_ACTORSTATE_DYING, ruFUSION_ACTORSTATE_DEAD);
	SetDefIdleMotion(Kadmose, ruFUSION_MIME_IDLE_DEAD);
	
	--摩瑞克：住手！
	--摩瑞克和吉兒往幽龍的方向衝去（實際上是跑到特定旗子）
	Yell(Morake, "[SC_Z25Q426127_13]", 3);
	sleep(15);
	x,y,z,dir=DW_Location(move_flag, 57);
	WriteRoleValue(Morake, EM_RoleValue_IsWalk, 0);
	Move(Morake, x,y,z);
	x,y,z,dir=DW_Location(move_flag, 56);
	WriteRoleValue(Jill, EM_RoleValue_IsWalk, 0);
	Move(Jill, x,y,z);
	sleep(15);
	
	--幽龍放出範圍暗系法術，吉兒和摩瑞克跪下
	--幽龍變成龍型，做出停留空中動作
	SysCastSpellLv(Morake, Morake, 850322, 1);
	SysCastSpellLv(Jill, Jill, 850322, 1);
	sleep(5);
	StopMove(Morake, true);
	StopMove(Jill, true);
	PlayMotionEX(Morake, ruFUSION_ACTORSTATE_CROUCH_BEGIN, ruFUSION_ACTORSTATE_CROUCH_LOOP);
	PlayMotionEX(Jill, ruFUSION_ACTORSTATE_CROUCH_BEGIN, ruFUSION_ACTORSTATE_CROUCH_LOOP);
	x,y,z,dir=DW_Location(Kadmose);

	--幽龍對冰龍施展一個吸收型的暗系法術
	--法術結束後冰龍消失
	--幽龍：[122068]的力量，我收下囉！
	ScriptMessage(Dark_Dragon, -1, 0, "[SC_Z25Q426127_9]", "0xFF75BEFB");
	ScriptMessage(Dark_Dragon, -1, 2, "[SC_Z25Q426127_9]", "0xFF75BEFB");
	PlayMotionEX(Dark_Dragon, ruFUSION_ACTORSTATE_BUFF_INSTANT,ruFUSION_ACTORSTATE_BUFF_INSTANT);
	CastSpell(Kadmose, Dark_Dragon, 850753);
	--PlayMotion(Dark_Dragon, ruFUSION_ACTORSTATE_CAST_SP02);
	sleep(35);
	Hide(Kadmose);
	--中斷檢查
	Global_Run_426127.playerlist = KickLeaverOut(Global_Run_426127.playerlist);
	list=KickLeaverOut(Global_player_queue);
	if Global_Run_426127.playerlist == nil then 
		DelObjTable_msg_toList(ObjTable, list);
		return;
	else
		msg_toList( list, 15 ); 
	end
	
	--幽龍：呼呼呼，感覺到了，[122068]的力量在體內竄動著！
	--幽龍：我就快要真正的「存在」了……。
	--幽龍：嘻嘻！摩瑞克，我說過了吧！龍族的「末日」一定會來的！ 
	--幽龍飛走
	local Dark_Dragon_Form=CreateObj(122114, x,y+30,z,dir+45, 1);
	SetModeEx(Dark_Dragon_Form, EM_SetModeType_Gravity, false);
	AddBuff(Dark_Dragon_Form, 506984, 10, -1);
	AddToPartition(Dark_Dragon_Form, 0);
	table.insert(ObjTable, Dark_Dragon_Form);
	--x,y,z,dir=DW_Location(Dark_Dragon_Form);
	--MoveDirect(Dark_Dragon_Form, x,y+100,z);
	--sleep(5)
	Hide(Dark_Dragon);
	sleep(15)
	PlayMotionEX(Dark_Dragon_Form, ruFUSION_ACTORSTATE_FLY_LOOP, ruFUSION_ACTORSTATE_FLY_LOOP);
	SetDefIdleMotion(Dark_Dragon_Form, ruFUSION_MIME_FLY_LOOP);
	ScriptMessage(Dark_Dragon_Form, -1, 0, "[SC_Z25Q426127_10]", "0xFF75BEFB");
	ScriptMessage(Dark_Dragon_Form, -1, 2, "[SC_Z25Q426127_10]", "0xFF75BEFB");
	sleep(30)
	ScriptMessage(Dark_Dragon_Form, -1, 0, "[SC_Z25Q426127_11]", "0xFF75BEFB");
	ScriptMessage(Dark_Dragon_Form, -1, 2, "[SC_Z25Q426127_11]", "0xFF75BEFB");
	sleep(20);
	ScriptMessage(Dark_Dragon_Form, -1, 0, "[SC_Z25Q426127_12]", "0xFF75BEFB");
	ScriptMessage(Dark_Dragon_Form, -1, 2, "[SC_Z25Q426127_12]", "0xFF75BEFB");
	PlayMotionEX(Dark_Dragon_Form, ruFUSION_ACTORSTATE_SPIRAL_LOOP, ruFUSION_ACTORSTATE_SPIRAL_LOOP);
	SetDefIdleMotion(Dark_Dragon_Form, ruFUSION_MIME_SPIRAL_LOOP);
	SetModeEx(Dark_Dragon_Form, EM_SetModeType_Drag, false);
	x,y,z,dir=DW_Location(Dark_Dragon_Form);
	x,y,z,dir=DW_NewLocation(0,2000, x,y,z,dir);
	MoveDirect(Dark_Dragon_Form, x,y+700,z);
	sleep(30);

	--整理玩家狀態
	Global_Run_426127.playerlist = KickLeaverOut(Global_Run_426127.playerlist);
	if Global_Run_426127.playerlist and #Global_Run_426127.playerlist~=0 then
		for pos=1, table.getn(Global_Run_426127.playerlist), 1 do
			local player=Global_Run_426127.playerlist[pos];
			CancelBuff_NoEvent(player, client_buff);
			SetFlag(player, quest_flag, 1);--任務完成
			StopSound( player, music_track[player]);
			Lua_PlayBGM( player );
		end
	end
	--結束表演
	list=KickLeaverOut(Global_player_queue);
	DelObjTable_msg_toList(ObjTable, list);
end
function Lua_426127_repeated()--等待舊執行緒結束; 重新進行執行緒
	sleep(50);
	BeginPlot(Global_Morake_426127, "Lua_426127_execution", 0);
end
function Lua_426127_TestFunc()--測試用(%t_id)在非玩家物件上執行; 等同將自己加入佇列
	Global_Morake_426127=OwnerID();
	Global_Run_426127={waiting_player=1};
	Global_player_queue = Global_player_queue or {};
	table.insert( Global_player_queue, TargetID());
end
--[[
/gm ? runplot %T_ID Lua_426127_TestFunc
/gm ? runplot Lua_426127_clear
/gm ? runplot Lua_426127_queue
--任務位置
/gm ? zone 25 0 -11998 1485 -2133 0
--]]
function Lua_426127_clear()--測試用; 清除相關物件
	
	local player=TargetID();
	local roomid=ReadRoleValue(player, EM_RoleValue_RoomID);
	SetFlag(player, 547725, 0);
	CancelBuff_NoEvent(player, 624065);
	CancelBuff_NoEvent(player, 620001);
	
	--清除上一次的結果
	Global_Run_426127=nil;
	
	--宣告變數
	local _trash={122068, 122074, 122073, 122111, 122112, 122114};
	local time=table.getn(_trash);
	local total = SetSearchAllNPC(roomid);
	for pos=1, total, 1 do
		local who=GetSearchResult();
		local orgid=ReadRoleValue(who, EM_RoleValue_OrgID);
		for i=1, time, 1 do
			if orgid==_trash[i] then
				DelObj(who)
			end
		end
	end
end