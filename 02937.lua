
function GM_JumpTo26INBoss2Die()--跳到2王死亡之後的靜止狀態
	local room=ReadRoleValue(OwnerID(), EM_RoleValue_RoomID);
	--蝌蚪相關
	Lua_BellatiaDuplication_change_status(room, "boss");
	local org=
	{
		allySoldier={103291;103357;103358;103359};
								}

	local bancremz, morek, jill, comgas, kalaway, ironrose, dragon=lua_26in_npcGUID();
	
	
	--驗證 以防未加入分割區，同時設定位置和狀態
	if	not	lua_26in_partitionCHECK(bancremz)	then
		AddToPartition(bancremz, room);
	end
	local x,y,z,dir=DW_Location(781316, 1)
	SetPos(bancremz, x,y,z,dir);
	
	MoveToFlagEnabled(bancremz, false);
	SetModeEx(bancremz, EM_SetModeType_Mark, true);
	SetModeEx(bancremz, EM_SetModeType_show, true);

	SetPos(dragon, 0,0,0,0);
	MoveToFlagEnabled(dragon, false);

	--突擊隊士兵
	
	local soldiers=lua_26in_getsoldiersguid();
	for i=1,4,1 do
		if(not lua_26in_partitionCHECK(soldiers[i].guid))then AddToPartition(soldiers[i].guid,room);end
		local x,y,z,dir=DW_Location(781316, 7+i-1);
		SetPos(soldiers[i].guid, x,y,z,dir);
	end
	
	
	sleep(20);
	Lua_BellatiaDuplication_change_status(room, "standby");
	Global_26IN_Boss2AlreadyBEdefeat = Global_26IN_Boss2AlreadyBEdefeat or {};
	Global_26IN_Boss2AlreadyBEdefeat[room] = true;
end
function lua_26in_afterboss2_changeEXE()--跳轉執行(2王後)
	local player, bancremz=OwnerID(), TargetID();
	local room=ReadRoleValue(player, EM_RoleValue_RoomID);
	Lua_BellatiaDuplication_change_status(room, "advance");
	DisableQuest(bancremz,true);
	CloseSpeak(player);
	BeginPlot(bancremz, "Lua_26instance_foreboss3_tochamber", 0);
	Global_26IN_Boss2AlreadyBEdefeat[room]=nil;
end
--前往密室
function Lua_26instance_foreboss3_tochamber()--跑在人形光龍身上，控制所有物件前往密室。
	local bancremz=OwnerID();
	local room = ReadRoleValue(bancremz, EM_RoleValue_RoomID);
	
	--物件設定
	local ally={};
	local bancremz, morek, jill, comgas, kalaway, ironrose, dragon=lua_26in_npcGUID();
	local soldier=lua_26in_getsoldiersguid();
	
	local function SETmovetoflag()--設定所有友方勢力，關閉巡邏劇情
		for i, who in pairs(ally) do
			MoveToFlagEnabled(who, false);
		end
	end
	local function SETallOFmode(option, Bool)--setmodeex >>所有友方統一設定
		for i, who in pairs(ally) do
			SetModeEx(who, option, Bool);
		end
	end
	local function AllyFOLOOW(x,y,z,dir)--所有友方勢力跟隨
		for p1, p2 in pairs(ally) do
			Lua_26instance_foreboss3_follow(p1, p2, x,y,z,dir);
		end
	end
	local function AllyFaceTObancremz()--除了光龍之外，所有人面向光龍
		local x,y,z,dir=DW_Location(ally.bancremz);
		for i, GUID in pairs(ally) do
			if GUID~=bancremz then
				local bearing=DW_GetDir(x,y,z, GUID);
				SetDir(GUID, bearing);
			end
		end
	end
	
	
	ally={
		bancremz=			bancremz;
		morek=				morek;
		jill=				jill;
		comgas=				comgas;
		kalaway=			kalaway;
		ironrose=			ironrose;
		soldier1=			soldier[1].guid;
		soldier2=			soldier[2].guid;
		soldier3=			soldier[3].guid;
		soldier4=			soldier[4].guid;
					};
	
	
	
	DisableQuest(morek, true);
	DisableQuest(jill, true);
	DisableQuest(comgas, true);
	
	SETmovetoflag()--關閉巡邏劇情
	SETallOFmode(EM_SetModeType_Move, true);--所有友方開啟移動
	
	--密門相關資料
	local Entrance=Global_BellatiaDuplication[room].door_after_boss2.GUID;
	local Exit=Global_BellatiaDuplication[room].door_secret_entrance.GUID;	
	
	--旗子資料
	local toChamber={};
	toChamber.flag={	id=781207;	--前往密室
				};
	toChamber.flag.max=GetMoveflagCount(toChamber.flag.id)-1;
	
	
	--表演
	Yell(bancremz, "[SC_26IN_FOREBOSS3_A]", 3);
	
	--延著旗子移動
	local flag = toChamber.flag;
	for spot=1, 2, 1 do
		local x,y,z,dir=DW_Location(flag.id, spot);
		local sec=Move(bancremz, x,y,z);
		AllyFOLOOW(x,y,z,dir);--所有人依隊型跟上
		sleep(sec);
		AllyFaceTObancremz()--調整面向
		if	spot	==1	then
			Yell(jill, "[SC_26IN_FOREBOSS3_B]", 3);
		else
			Lua_BroadCast_RoomStingTypeColor(room, "[SC_26IN_FOREBOSS3_X]")--廣播
		end
	end
	rawequal(flag, nil);
	CastSpell(bancremz, Entrance, 850804);
	sleep(20);
	AllyFaceTObancremz();--調整面向
	Yell(morek, "[SC_26IN_FOREBOSS3_C]", 3);
	PlayMotionEX(Entrance, ruFUSION_ACTORSTATE_ACTIVATE_BEGIN, ruFUSION_ACTORSTATE_ACTIVATE_LOOP);
	SetDefIdleMotion(Entrance,ruFUSION_MIME_ACTIVATE_LOOP);
	
	sleep(10)
	SetModeEx(Entrance,EM_SetModeType_Obstruct,false);
	
	local flag = toChamber.flag;
	for spot=3, 4, 1 do
		local x,y,z,dir=DW_Location(flag.id, spot);
		local sec=Move(bancremz, x,y,z);
		AllyFOLOOW(x,y,z,dir);--所有人依隊型跟上
		sleep(sec);
		AllyFaceTObancremz();--調整面向
		if	spot	==3	then
			Yell(jill, "[SC_26IN_FOREBOSS3_D]", 3);
		else
			Yell(bancremz, "[SC_26IN_FOREBOSS3_E]", 3);
		end
	end
	rawequal(flag, nil);
	CastSpell(bancremz, Exit, 850804);
	Lua_BellatiaDuplication_change_music(room,Global_BellatiaDuplication.music.enter_secret_room);
	sleep(20);
	Lua_BroadCast_RoomStingTypeColor(room, "[SC_26IN_FOREBOSS3_Y]")--廣播
	AllyFaceTObancremz();--調整面向
	PlayMotionEX(Exit, ruFUSION_ACTORSTATE_ACTIVATE_BEGIN, ruFUSION_ACTORSTATE_ACTIVATE_LOOP);
	SetDefIdleMotion(Exit,ruFUSION_MIME_ACTIVATE_LOOP);

	sleep(10)
	SetModeEx(Exit,EM_SetModeType_Obstruct,false);

	local flag = toChamber.flag;
	for spot=5, flag.max, 1 do
		local x,y,z,dir=DW_Location(flag.id, spot);
		local sec=Move(bancremz, x,y,z);
		AllyFOLOOW(x,y,z,dir);--所有人依隊型跟上
		sleep(sec);
		AllyFaceTObancremz();--調整面向
		if spot==flag.max then
			Yell(comgas, "[SC_26IN_FOREBOSS3_G]", 3);
		end
	end
	rawequal(flag, nil);
	
	--走到定位
	local x,y,z,dir=DW_Location(781297, 1)
	Move(morek, x,y,z);
	
	local x,y,z,dir=DW_Location(781297, 2)
	Move(jill, x,y,z);
	
	local x,y,z,dir=DW_Location(781297, 3);
	Move(comgas, x,y,z);
	
	local x,y,z,dir=DW_Location(781297, 4)
	Move(kalaway, x,y,z);
	
	local x,y,z,dir=DW_Location(781297, 5)
	Move(ironrose, x,y,z);
	
	for i=1, 4, 1 do
		local x,y,z,dir=DW_Location(781297, 6+i-1);
		Move(soldier[i].guid, x,y,z);
	end
	
	local x,y,z,dir=DW_Location(781282, 5);
	sleep( Move(bancremz, x,y,z) );
	Yell(bancremz, "[SC_26IN_FOREBOSS3_F]", 3);
	--設定光龍的save_point, 蝌蚪的模組會自動開啟光龍的對話
	Lua_BellatiaDuplication_change_save_point(room, 5);
	Lua_BellatiaDuplication_change_status(room, "standby");
	AllyFaceTObancremz();
end
function Lua_26instance_foreboss3_ObjectRecover()--物件恢復狀態
	local room=ReadRoleValue(OwnerID(), EM_RoleValue_RoomID);
	
	--清除舊的中控
	if Global_26IN_ForeBoss3_ctrl and Global_26IN_ForeBoss3_ctrl[room] then
		DelObj(Global_26IN_ForeBoss3_ctrl[room]);
		Global_26IN_ForeBoss3_ctrl[room] = nil;
	end
	--玩家集中，清除夢境Buff
	local x,y,z,dir				=DW_Location(781282, 5);
	local t=#Global_BellatiaDuplication[room].players;
	for i=1, t, 1 do
		local player=Global_BellatiaDuplication[room].players[i].guid;
		SetPos(player, x,y,z,dir);
		CancelBuff_NoEvent(player, 624292);
	end
	if	Global_26IN_ForeBoss3	then
		if	Global_26IN_ForeBoss3[room]	then
			if	Global_26IN_ForeBoss3[room].players	then
				for player, __ in pairs(Global_26IN_ForeBoss3[room].players) do
					if	__.shadow	then
						DelObj(__.shadow);
					end
					__.shadow=nil;
				end
				Global_26IN_ForeBoss3[room]=nil;
			end
		end
	end
	
	local	bancremz, 
		morek, 
		jill, 
		comgas, 
		kalaway, 
		ironrose, 
		dragon;
		
		bancremz, morek, jill, comgas, kalaway, ironrose, dragon = lua_26in_npcGUID();
	
	local x,y,z,dir=DW_Location(781282, 5);
	SetPos(bancremz, x,y,z,dir);
	SetModeEx(bancremz, EM_SetModeType_Show, true);
	SetModeEx(bancremz, EM_SetModeType_Mark, true);
	SetModeEx(bancremz, EM_SetModeType_ShowRoleHead, true);

	SetPos(dragon, 0,0,0,0);

	local x,y,z,dir=DW_Location(781297, 1);
	SetPos(morek, x,y,z,dir);
	
	local x,y,z,dir=DW_Location(781297, 2);
	SetPos(jill, x,y,z,dir);

	local x,y,z,dir=DW_Location(781297, 3);
	SetPos(comgas, x,y,z,dir);

	local x,y,z,dir=DW_Location(781297, 4);
	SetPos(kalaway, x,y,z,dir);

	local x,y,z,dir=DW_Location(781297, 5);
	SetPos(ironrose, x,y,z,dir);

	local soldiers=lua_26in_getsoldiersguid();
	for i=1,4,1 do
		if(not lua_26in_partitionCHECK(soldiers[i].guid))then AddToPartition(soldiers[i].guid,room);end
		local x,y,z,dir=DW_Location(781297, 6+i-1);
		SetStopAttack(soldiers[i].guid);
		SetPos(soldiers[i].guid, x,y,z,dir);
	end
	
	--狀態記錄
	Lua_BellatiaDuplication_change_status(room, "standby");
end
function lua_26in_foreboss3_changeEXE()--跳轉執行(3王前)
	local player, bancremz=OwnerID(), TargetID();
	CloseSpeak(player);
	local room=ReadRoleValue(player, EM_RoleValue_RoomID);
	--狀態記錄
	Lua_BellatiaDuplication_change_status(room, "advance");
	DisableQuest(bancremz,true);
	
	local x,y,z,dir=DW_Location(781282, 5);
	SetDir(bancremz, dir);
	
	BeginPlot(bancremz,"Lua_26instance_foreboss3_dragondream",0);
end
function Lua_26instance_foreboss3_dragondream()--創出龍形，趴下去睡(在中控開啟
	local bancremz=OwnerID();
	local room=ReadRoleValue(bancremz, EM_RoleValue_RoomID);
	
	
	local player = TargetID();
	Yell(bancremz, "[SC_26IN_FOREBOSS3_S]", 3);
	AddBuff(bancremz, 624289, 0, 7);
	SysCastSpellLv(bancremz, bancremz, 850810, 0);
	--變數承接
	local	bancremz,
		morek,
		jill, 
		comgas, 
		kalaway, 
		ironrose,
		dragon
					=lua_26in_npcGUID();
	
	sleep(35);
	--變形

	MoveToFlagEnabled(dragon, false);
	local x,y,z,dir=DW_Location(bancremz);
	SetPos(dragon, x,y,z,dir);
	
	SetModeEx(dragon, EM_SetModeType_Searchenemy, false);
	SetModeEx(dragon, EM_SetModeType_Show, true);
	SetPos(bancremz, 0,0,0,0);
	
	Yell(morek, "[SC_26IN_FOREBOSS3_T]", 3);
	sleep(20);


		
	
	sleep(20)
	--趴下
	PlayMotionEX(dragon, ruFUSION_ACTORSTATE_SLEEP_BEGIN, ruFUSION_ACTORSTATE_SLEEP_LOOP);
	SetDefIdleMotion(dragon,ruFUSION_ACTORSTATE_SLEEP_LOOP);

	--開啟摩瑞克的對話劇情,
	DisableQuest(morek, false);
	
	--新創物件，開啟小怪中控
	local	x,y,z,dir=DW_Location(player);
	Global_26IN_ForeBoss3_ctrl=Global_26IN_ForeBoss3_ctrl	or {};
	Global_26IN_ForeBoss3_ctrl[room]=CreateObj(110987, x,y,z,dir, 1);
	SetModeEx(Global_26IN_ForeBoss3_ctrl[room], EM_SetModeType_Show, false);
	SetModeEx(Global_26IN_ForeBoss3_ctrl[room], EM_SetModeType_Mark, false);
	AddToPartition(Global_26IN_ForeBoss3_ctrl[room], room);
	
	BeginPlot(Global_26IN_ForeBoss3_ctrl[room], "Lua_26instance_foreboss3_ctrl", 0);
	BeginPlot(Global_26IN_ForeBoss3_ctrl[room], "Lua_26instance_foreboss3_updateplayer", 0);
	Lua_BellatiaDuplication_change_save_point(room, 6);
end
--物件共用設定或是動作
function Lua_26instance_foreboss3_follow(who, guid, x,y,z,dir)--跟隨者的移動函式
	local	angle,
		dis;
	if who=="morek" then
		angle=135;dis=50;
	elseif who=="jill" then
		angle=180;dis=50;
	elseif who=="comgas" then
		angle=220;dis=50;
		
	elseif who=="kalaway" then
		angle=160;dis=60;
	elseif who=="ironrose" then
		angle=200;dis=60;
		
		
	elseif who=="soldier1" then
		angle=170;dis=70;
	elseif who=="soldier2" then
		angle=190;dis=70;
	elseif who=="soldier3" then
		angle=165;dis=80;
	elseif who=="soldier4" then
		angle=195;dis=80;
	end
	if angle and dis then
		x,y,z,dir = DW_NewLocation(angle, dis, x,y,z,dir);
		local sec=Move(guid, x,y,z);
		return sec;
	end
end
--對話劇情
function Lua_26instance_foreboss3_morek()--摩瑞克的對話劇情
	local player = OwnerID();
	LoadQuestOption(player);
	AddSpeakOption(player, player, "[SC_26IN_FOREBOSS3_T]", "Lua_26instance_foreboss3_GoIntoDream", 0);
end
function Lua_26instance_foreboss3_GoIntoDream()--進入夢境
	local player=OwnerID();
	local room=ReadRoleValue(player,EM_RoleValue_RoomID);

	CloseSpeak(player);
	local buff = 624292;
	AddBuff(player, buff, 0, -1);
	local x,y,z,dir=DW_Location(781292, 1);
	SetPos(player, x,y,z,dir);
	
end
function Lua_26instance_foreboss3_updateplayer()
	local room=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID);
	while(Lua_BellatiaDuplication_check_status(room,"advance")==true)do
		Lua_BellatiaDuplication_update_players(room);
		sleep(10);
	end
end
--通往三王的通道機關
function Lua_26instance_foreboss3_ctrl()--通往三王路上小怪纏身的中控, 目前掛在摩瑞克身上
	local room = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID);
	--代稱宣告
	local buff = 624292
	local flag = 781292
	local waystart=1;
	local wayend = 6;
	if(Global_BellatiaDuplication.type=="hard")then harassnum=6;else harassnum=3;end
	
	
	
	--變數宣告
	local	playermax,	--玩家總數
		ProgressSec,	--已進展秒數
		LastDialogue,	--上次對話時間
		dialogueIndex,	--對話進度
		harassed,	--正被騷擾的玩家數量
		NewestProgress;	--走最快的玩家的距離
	
		playermax=0;
		ProgressSec=0;
		LastDialogue=0;
		dialogueIndex=0;
		harassed=0;
		NewestProgress=0;
	local summonCD={};
	
	local MsgSwitch=false;	--是否要show給玩家訊息
	local neverShow=true;	--還沒開始兩條龍之間的台詞
	local baseDis=0;--距離基數
	do
		local 	x,y,z,dir		=DW_Location(781292, 1);
		local	_dis			=DW_GetDisToFlag(781292,6,	x,y,z);
		baseDis				=math.floor(_dis/10)-20;
	end
	--字串
	local dialogue=--對話劇情
	{	"[SC_26IN_2DRAGON_1]"; 
		"[SC_26IN_2DRAGON_2]"; 
		"[SC_26IN_2DRAGON_3]"; 
		"[SC_26IN_2DRAGON_4]"; 
		"[SC_26IN_2DRAGON_5]"; 
		"[SC_26IN_2DRAGON_6]"; 
		"[SC_26IN_2DRAGON_7]"; 
		"[SC_26IN_2DRAGON_8]"; 
		"[SC_26IN_2DRAGON_9]";		};
	local dialogueCol=--對話顏色
	{	C_LightBlue;
		C_YELLOW;
		C_LightBlue;
		C_YELLOW;
		C_LightBlue;
		C_YELLOW;
		C_LightBlue;
		C_YELLOW;
		C_LightBlue;				};
	


	
	--全域變數宣告
	Global_26IN_ForeBoss3			=Global_26IN_ForeBoss3	or	{};
	Global_26IN_ForeBoss3[room]		={};
	Global_26IN_ForeBoss3[room].players	={};
	local IsPlaying="never play";
	while	true	do
		sleep(10);
		
		--重置
		harassed		=0;
		playermax		=0;
		NewestProgress		=0;
		
		--維持
		ProgressSec		=ProgressSec+1;
		
		for i=#summonCD,1,-1 do
			if(summonCD[i]==0)then
				table.remove(summonCD,i);
			else
				summonCD[i]=summonCD[i]-1;
			end
		end
		
		--整理資料(第一步，scan新的資料)
		for i,__ in pairs(Global_BellatiaDuplication[room].players)do
			if(not Global_26IN_ForeBoss3[room].players[__.guid])then
				Global_26IN_ForeBoss3[room].players[__.guid]={};
			end
		end
		--整理資料(第二步，排除過時資料)
		for player,__ in pairs(Global_26IN_ForeBoss3[room].players) do
			if(not CheckID(player))then
				if(__.shadow)then
					DelObj(__.shadow);
				end
				Global_26IN_ForeBoss3[room].players[player]=nil;
			end
		end
		local list={};
		--整理資料(第三步，匯整資訊)
		for	player,	__ in pairs(Global_26IN_ForeBoss3[room].players) do
			local _add=false;
			if __.shadow then
				if(CheckID(__.shadow)==false)or(ReadRoleValue(__.shadow, EM_RoleValue_IsDead)==1)then
					__.shadow=nil;
					table.insert(summonCD,5);--CD 5 秒
				elseif(ReadRoleValue(player, EM_RoleValue_IsDead)==1)then
					DelObj(__.shadow);
					__.shadow=nil;
					_add=true;
				else
					harassed=harassed+1;
				end
			else
				_add=true;
			end
			playermax=playermax+1;		--核對總數

			local x,y,z,dir		=DW_Location(player);
			__.DisFromStart	=DW_GetDisToFlag(781292, 1, x,y,z);
			__.DisFromEnd		=DW_GetDisToFlag(781292, 6, x,y,z);
			__.indream		=CheckBuff(player, 624292);
			
			if(not __.indream)then
				_add=false;
				if(IsPlaying=="never play")then
					IsPlaying="playing";
					Lua_BellatiaDuplication_change_music(room,Global_BellatiaDuplication.music.enter_dream);
				end
			end
			if(__.DisFromEnd<150)then _add=false;AddBuff(player,624345,0,2);end
			if(__.DisFromStart<50)then _add=false;end
			if(CheckBuff(player,624495))then _add=false;end
			if _add then
				table.insert(list, player);
			end
			if	__.DisFromStart > NewestProgress	and	__.indream	then
				NewestProgress	=__.DisFromStart;
			end
		end
		
		--廣播
		if	neverShow			and
			NewestProgress >baseDis		then
			neverShow		=false;
			for	player,	__ in pairs(Global_26IN_ForeBoss3[room].players) do
				if(__.indream)then
					ScriptMessage(player, player, 2, "[$MUTE]".."[SC_26IN_2DRAGON_0]", 0);
				end
			end
		end
		local	show	=false;
		if	NewestProgress	>	baseDis*(dialogueIndex+1)	then
			show	=true;
		end
		if	neverShow==false	then
			if	show		then
				if dialogueIndex < 9 	and	ProgressSec - LastDialogue > 3 	then
					dialogueIndex		=dialogueIndex+1;
					LastDialogue		=ProgressSec;
					for player,__ in pairs(Global_26IN_ForeBoss3[room].players) do
						if(__.indream)then
							ScriptMessage(player, player, 2, "[$MUTE]"..dialogue[dialogueIndex], dialogueCol[dialogueIndex]);
							ScriptMessage(player, player, 0, "[$MUTE]"..dialogue[dialogueIndex], dialogueCol[dialogueIndex]);
						end
					end
				end
			end
		end
		
		--如果都抵達就跳出
		local n=0;
		for	player,	__ in pairs(Global_26IN_ForeBoss3[room].players) do
			if	__.DisFromEnd		<150	and	__.indream	then
				n	=n+1;
			end
		end
		if(n==playermax)or(Lua_BellatiaDuplication_check_status(room,"boss")==true)then
			for	player,	__ in pairs(Global_26IN_ForeBoss3[room].players) do
				if	__.shadow	then
					DelObj(__.shadow);
					__.shadow	=nil;
				end
			end

			local msg,color;
			if dialogueIndex%2==0 then
				msg,color="[$MUTE]".."[SC_26IN_2DRAGON_END2]", C_LightBlue;
			else
				msg,color="[$MUTE]".."[SC_26IN_2DRAGON_END1]", C_YELLOW;
			end
			for player,__ in pairs(Global_26IN_ForeBoss3[room].players) do
				if(__.indream)then
					ScriptMessage(player, player, 2, msg, color);
					ScriptMessage(player, player, 0, msg, color);
				end
			end
			--三王前機關終止，鼓吹開戰台詞
			sleep(30);
			for player,__ in pairs(Global_26IN_ForeBoss3[room].players) do
				if(__.indream)then
					ScriptMessage(player, player, 2, "[$MUTE]".."[SC_26IN_FOREBOSS3_I]", 0);
					ScriptMessage(player, player, 0, "[$MUTE]".."[SC_26IN_FOREBOSS3_I]", 0);
				end
			end
			Global_26IN_ForeBoss3[room]	=nil;
			break;
		end

		--小怪騷擾玩家的機制
		local num=harassnum-#summonCD-harassed;	--(應有隻數-CD中數量-正被騷擾)
		if(num>=#list)then
			num=#list;
		end
		if(ProgressSec%20==0)then
			DebugMsg(0,room,"Shadow in CD:"..#summonCD..", playermax:"..playermax..", list number:"..#list..", still need create:"..num);
		end
		for i=1,num,1 do
			if #list==0 then break;end
			for k=#list, 1, -1*DW_Rand(#list) do
				BeginPlot(list[k], "Lua_26instance_foreboss3_harass", 0);
				table.remove(list, k);
				break;
			end
		end
	end
	
end
--出現幽暗衍體，綁住玩家並且攻擊。
function Lua_26instance_foreboss3_harass()--由玩家執行Function ，幽暗衍體會鎖定這個玩家進行攻擊
	
	local player = OwnerID();
	local room = ReadRoleValue(player, EM_RoleValue_RoomID);
	AddBuff(player,624495,0,2);--標記在運行此段劇情
	
	local x,y,z,dir = DW_Location(player);
	x,y,z,dir = DW_NewLocation(0,50, x,y,z,dir);
	local org={hard=103032;normal=108029;easy=108094;};
	local shadow = CreateObj(org[Global_BellatiaDuplication.type], x,y,z,dir-180, 1);
	AddToPartition(shadow, room);
	Global_26IN_ForeBoss3[room].players[player].shadow=shadow;
	local function IsBreak()
		if not Global_26IN_ForeBoss3 then return true;end
		if not Global_26IN_ForeBoss3[room] then return true;end
		if not Global_26IN_ForeBoss3[room].players then return true;end
		
		return false;--一切正常
	end
	local function appearANDattack()--現身攻擊
		local x,y,z,dir	=DW_Location(player);
		x,y,z,dir	=DW_NewLocation(0, 40, x,y,z,dir);
		SetPos(shadow, x,y,z,dir);
		SetModeEx(shadow, EM_SetModeType_Show, true);
		SetModeEx(shadow, EM_SetModeType_Move, true);
		SetModeEx(shadow, EM_SetModeType_Mark, true);
		DW_UnFight(shadow, false);
		SetAttack(shadow, player);
	end
	local function disappear()--消失
		DW_UnFight(shadow, true);
		SetModeEx(shadow, EM_SetModeType_Show, false);
		SetModeEx(shadow, EM_SetModeType_Mark, false);
	end
	local function shadowOUT()--影子死亡或消失
		if not CheckID(shadow) then
			return true;
		end
		if ReadRoleValue(shadow, EM_RoleValue_IsDead)==1 then
			return true;
		end
		return false;
	end
	local x,y,z,dir=DW_Location(781292, 6);
	local duration=0
	local pause=false;
	local phase="appear";
	while not IsBreak() do
		AddBuff(player,624495,0,2);--更新標記持續時間
		if not CheckBuff(player, 624292) then break; end
		if shadowOUT() then DebugMsg(0, room, "shadowOUT");break; end
		if	DW_GetDistance(player, x,y,z)<150	then
			DebugMsg(0, room, "Get End");
			Global_26IN_ForeBoss3[room].players[player].shadow=nil;
			break;
		end
		if duration	==0	then
			--階段
			--防呆
			if	phase		==false		then
				DebugMsg(0, room, "Func:Lua_26instance_foreboss3_harass >> phase is nil");
			--出現(5s)
			elseif	phase		=="appear"	then
				appearANDattack();--現身攻擊
				duration	=5;
				pause		=true;
				phase		="pause";
			--緩沖(0.5s)
			elseif	phase		=="pause"	then
				AddBuff(player, 624271, 0, 5);--附加定身
				duration	=45;
				phase		="disappear";
			--消失()
			elseif	phase		=="disappear"	then
				disappear();--消失
				duration	=20;
				phase		="appear"
			end
		end
		--等待
		sleep(5)
		duration		=duration-5;
	end
	CancelBuff_NoEvent(player, 624271);
	DelObj(shadow);
end
function lua_26in_foreboss3_collectPOINT()--顯示集合點的位置
	local point = OwnerID();
	local room = ReadRoleValue(point, EM_RoleValue_RoomID);
	SetModeEx(point, EM_SetModeType_ShowRoleHead, false);
	DW_UnFight(point, true);
	AddBuff(point, 624285, 0, -1);
	AddBuff(point, 624286, 0, -1);
end
--測試指令區
function GM_QuickToBoss3()--所有人到三王入口集合
	local room = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID);
	local n=#Global_BellatiaDuplication[room].players;
	local x,y,z,dir = DW_Location(781292, 6);
	for i=1, n, 1 do
		local id =Global_BellatiaDuplication[room].players[i].guid;
		SetPos(id, x,y,z,dir);
	end
end