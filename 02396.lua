---------------------------------------424216-------------------------------------------
function LuaS_118277_1()
	local Player = OwnerID();
	local NPC = TargetID();
	LoadQuestOption(Player);
	if CheckAcceptQuest(Player,424216)==true and ReadRoleValue(NPC,EM_RoleValue_Register10)==0 and CheckFlag( Player,545103 )~=true then
		AddSpeakOption( Player, NPC, "[SC_424216_07]", "LuaS_118277_2",0 );--「大將軍」蘭斯希望你盡快啟程出使安格爾，告知即將召開臨時領主國會議一事。
	end
end

function LuaS_118277_2()
	local Player = OwnerID();
	local NPC = TargetID();
	if ReadRoleValue(NPC,EM_RoleValue_Register10)==0 then
		WriteRoleValue(NPC,EM_RoleValue_Register10,1);
		CallPlot(NPC,"Lua_118277_Show",NPC,Player );
	end
	CloseSpeak(Player);
end

function Lua_118277_Show( NPC ,Player )
	local RoomID = ReadRoleValue(NPC, EM_RoleValue_RoomID);
	--產生劇情中控器,劇情就不會掛在原本的NPC身上
	local Ctrl=OwnerID();
	if ReadRoleValue( Ctrl , EM_RoleValue_OrgID )~=117201 then
		if type(Lua_Zone20_QuestObj)~="table" then
			Lua_Zone20_QuestObj={};
		end
		Lua_Zone20_QuestObj[424216]={};
		local Ctrl = kg_GetPosRX( NPC , 117201 );
		table.insert( Lua_Zone20_QuestObj[424216] , Ctrl );
		kg_InvisibleObjInit(Ctrl);
		AddToPartition( Ctrl , RoomID );
		CallPlot(Ctrl,"Lua_118277_Show",NPC,Player );
		return
	end
	--循環檢查整體任務狀態
	CallPlot( NPC , "ks_QuestAddBuff" , 424216, 545103, 509848, 150, "LuaQ_424216_ShowEnd"  );
	--產生表演NPC
	local NPCA = kg_GetPosRX( NPC, 118280 );
	table.insert( Lua_Zone20_QuestObj[424216] , NPCA );
	kg_ActorInit( NPCA );
	SetModeEx( NPCA , EM_SetModeType_Mark, false)	----可點選(否)
	SetModeEx( NPCA , EM_SetModeType_ShowRoleHead, false) 	---頭像框(否)
	AddToPartition(NPCA,RoomID);
	local NPCB = kg_GetPosRX( Zone20_kg_QuestNPC[118279] , 118281 );--瓦奧蕾特．安卻斯特
	table.insert( Lua_Zone20_QuestObj[424216] , NPCB );
	kg_ActorInit( NPCB );
	SetModeEx( NPCB , EM_SetModeType_Mark, false)	----可點選(否)
	SetModeEx( NPCB , EM_SetModeType_ShowRoleHead, false) 	---頭像框(否)
	AddToPartition(NPCB,RoomID);
	
	Sleep(10);
	AdjustFaceDir( NPCA , Player,0 );
	Sleep(20);
	PlayMotion( NPCA,ruFUSION_ACTORSTATE_EMOTE_SPEAK );
	NPCSay( NPCA , "[SC_424216_ACT_01]" );--出、出使安格爾？盡快啟程？可、可是......
	Sleep(30);
	AdjustFaceDir( NPCB , NPCA,0 );
	Sleep(20)
	PlayMotion( NPCB,ruFUSION_ACTORSTATE_EMOTE_SPEAK );
	NPCSay(NPCB,"[SC_424216_ACT_02]");	--席明納...
	Sleep(20);
	PlayMotion( NPCA,ruFUSION_ACTORSTATE_SLUMBER_BEGIN );
	NPCSay(NPCA,"[SC_424216_ACT_03]");	--嗚...我明白了...我會立刻準備的......(2s)
	Sleep(30);
	AdjustFaceDir(NPCA,NPCB,0);
	Sleep(20);
	PlayMotion( NPCA,ruFUSION_ACTORSTATE_EMOTE_SPEAK );
	NPCSay(NPCA,"[SC_424216_ACT_04]");	--妳為了我，前幾天明明抱病甚至下不了床，今天卻臉色紅潤地與我見面，兩人卿卿我我......(4s)
	Sleep(50);
	PlayMotion( NPCA,ruFUSION_ACTORSTATE_EMOTE_CRY );
	NPCSay(NPCA,"[SC_424216_ACT_05]");	--妳完全不顧會被妳丈夫發現的危險，只願和我在一起，我...
	Sleep(30);
	PlayMotion( NPCB,ruFUSION_ACTORSTATE_EMOTE_CRY );
	NPCSay(NPCB,"[SC_424216_ACT_06]");	--別再說了，席明納......
	Sleep(30);
	PlayMotion( NPCA,ruFUSION_ACTORSTATE_EMOTE_APPROVAL );
	NPCSay(NPCA,"[SC_424216_ACT_07]");	--妳要等我回來啊，我美麗的瓦奧蕾特！(說話動作)不管我們相隔多遠，我也會一直愛著妳的！
	Sleep(20);
	PlayMotion( NPCA ,ruFUSION_ACTORSTATE_EMOTE_SPEAK );
	Sleep(30);
	SetDefIdleMotion(NPCB , ruFUSION_MIME_EMOTE_CRY );--一直哭
	NPCSay(NPCB, "[SC_424216_ACT_08]");	--噢......席明納！！為什麼你是席明納！！
	Sleep(30);
	ks_QuestEnd( 424216, 545103, 509848, 150 );
end

function LuaQ_424216_ShowEnd( NPC )
	NPC = NPC or OwnerID();
	for i in pairs( Lua_Zone20_QuestObj[424216] ) do
		DelObj( Lua_Zone20_QuestObj[424216][i] );
	end;
	Lua_Zone20_QuestObj[424216]=nil;
	WriteRoleValue(NPC,EM_RoleValue_Register10,0);
end

function Lua_kg_Z20_GeneralNpcBorn()--通用出生劇情
	local NPC  = OwnerID()
	local OrgID = ReadRoleValue(NPC,EM_RoleValue_OrgID);
	--Say(NPC,"OrgID="..OrgID);
	if Zone20_kg_QuestNPC==nil then
		Zone20_kg_QuestNPC = {};
	end
	Zone20_kg_QuestNPC[OrgID]=NPC;
end

--------------------------------------424218------------------------------------
function LuaQ_424218_RangeCheckBurn()--
	SetPlot(OwnerID(),"range",  "LuaQ_424218_RangeCheck" , 40);
end

function LuaQ_424218_RangeCheck()--當玩家接任務時 , 一出出口就看不到蘭斯
	local Player = OwnerID();
	if CheckAcceptQuest(Player,424218)==true and CheckFlag( Player,545106 )~=true then
		SetFlag( Player , 545227 , 1 );--看不到蘭斯!!
	end
end

function LuaS_118442_1()
	local Player = OwnerID();
	local NPC = TargetID();--蘭斯大將軍
	LoadQuestOption(Player);
	if CheckAcceptQuest(Player,424218)==true and ReadRoleValue(NPC,EM_RoleValue_Register10)==0 and CheckFlag( Player,545106 )~=true then
		AddSpeakOption( Player, NPC, "[SC_424218_01]", "LuaS_118442_2",0 );--我已經將所有事情準備好了。
	end
end

function LuaS_118442_2()
	local Player = OwnerID();
	local NPC = TargetID();--蘭斯大將軍
	if ReadRoleValue(NPC,EM_RoleValue_Register10)==0 then
		WriteRoleValue(NPC,EM_RoleValue_Register10,1);
		CallPlot(NPC,"Lua_118442_Show",NPC,Player );
	end
	CloseSpeak(Player);
end

function Lua_118442_Show(NPC,Player)
	local RoomID = ReadRoleValue(NPC, EM_RoleValue_RoomID);
	--產生劇情中控器,劇情就不會掛在原本的NPC身上
	local Ctrl=OwnerID();
	if ReadRoleValue( Ctrl , EM_RoleValue_OrgID )~=117201 then
		if type(Lua_Zone20_QuestObj)~="table" then
			Lua_Zone20_QuestObj={};
		end
		Lua_Zone20_QuestObj[424218]={};
		local Ctrl = kg_GetPosRX( NPC , 117201 );
		table.insert( Lua_Zone20_QuestObj[424218] , Ctrl );
		kg_InvisibleObjInit(Ctrl);
		AddToPartition( Ctrl , RoomID );
		CallPlot(Ctrl,"Lua_118442_Show",NPC,Player );
		return
	end
	--產生演員
	local FlagID = 780954;
			--{OrgID , Gid , 移動順序 }
	local Actor = {	{118407,0,{1,1,2,26} },		--蘭斯		01,01,02,26
			{118410,0,{3,4,5,27} },		--傑諾		03,04,05,27
			{118411,0,{6,7,8,28} },		--赫蒂爾	06,07,08,28
			{118412,0,{9,10,11,30} },	--蜜朵娜	09,10,14,30
			{118413,0,{12,13,14,29} },	--螢火		12,13,11,29
			{118414,0,{24,25,31,32} },	--奇普		24,25,31,32
			{118409,0,{15,16,17} },	--湯尼		15,16,17
			{118408,0,{18,19,20} },	--伊崔妮	18,19,20
			{118415,0,{21,22,23} }	--康葛斯	21,22,23
			};
	--循環檢查整體任務狀態
	CallPlot( NPC , "ks_QuestAddBuff" , 424218, 545106, 509849, 300, "LuaQ_424218_ShowEnd"  );
	local x,y,z;
	for i =1,6 do
		Actor[i][2]=kg_GetPosRX({ FlagID,Actor[i][3][1] },Actor[i][1] );
		table.insert( Lua_Zone20_QuestObj[424218] , Actor[i][2] );
		kg_ActorInit( Actor[i][2] );
		SetModeEx( Actor[i][2] , EM_SetModeType_Mark, false)	----可點選(否)
		SetModeEx( Actor[i][2] , EM_SetModeType_ShowRoleHead, false) 	---頭像框(否)
		AddToPartition(Actor[i][2],RoomID);
	end
	for i=2,6 do
		x,y,z,_ = kg_GetPosRX( {FlagID,Actor[i][3][2]} );
		Move(Actor[i][2],x,y,z);
	end
	
	Sleep(60);
	NPCSay( Actor[1][2],"[SC_424218_ACT_01]" );--各位一路上辛苦了，現在就與我一同進城吧。
	Sleep(30);
	for i =1,6 do
		x,y,z,_ = kg_GetPosRX( {FlagID,Actor[i][3][3]} );
		Move(Actor[i][2],x,y,z);
	end
	--湯尼始動
	for i=7,9 do
		Actor[i][2]=kg_GetPosRX({ FlagID,Actor[i][3][1] },Actor[i][1] );
		table.insert( Lua_Zone20_QuestObj[424218] , Actor[i][2] );
		kg_ActorInit( Actor[i][2] );
		SetModeEx( Actor[i][2] , EM_SetModeType_Mark, false)	----可點選(否)
		SetModeEx( Actor[i][2] , EM_SetModeType_ShowRoleHead, false) 	---頭像框(否)
		AddToPartition(Actor[i][2],RoomID);
		x,y,z,_ = kg_GetPosRX( {FlagID,Actor[i][3][2]} );
		Move(Actor[i][2],x,y,z);
	end
	Sleep(15);
	NPCSay(Actor[7][2],"[SC_424218_ACT_02]"); --蘭斯？你怎麼會在這裡？
	PlayMotion( Actor[7][2],ruFUSION_ACTORSTATE_EMOTE_POINT );
	Sleep(20);
	for i=1,6 do
		AdjustFaceDir( Actor[i][2],Actor[7][2] ,0 );
	end
	Sleep(10);
	PlayMotion(Actor[1][2],ruFUSION_ACTORSTATE_EMOTE_SALUTE);--敬禮
	NPCSay(Actor[1][2] , "[SC_424218_ACT_03]");--陛下，我來此是迎接各位領主，沒想到您也在此時回城。
	Sleep(30);
	PlayMotion( Actor[7][2],ruFUSION_ACTORSTATE_EMOTE_SPEAK );
	NPCSay(Actor[7][2],"[SC_424218_ACT_04]" );--那...從安格爾來的這位是...？
	Sleep(30);
	PlayMotion( Actor[4][2],ruFUSION_ACTORSTATE_EMOTE_SPEAK );
	NPCSay(Actor[4][2],"[SC_424218_ACT_05]");--陛下，我是拉夏娜的女兒蜜朵娜。
	Sleep(30);
	NPCSay(Actor[4][2],"[SC_424218_ACT_06]");--母親有要事在身，所以將在外歷鍊的我召回，代替她參與會議。
	Sleep(30);
	PlayMotion( Actor[7][2],ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD );
	NPCSay(Actor[7][2],"[SC_424218_ACT_07]");--原來如此。
	Sleep(30);
	NPCSay(Actor[1][2],"[SC_424218_ACT_08]");--各位請一同進宮，稍做休息吧。
	Sleep(30);
	for i =1,9 do
		if i<7 then
			x,y,z,_ = kg_GetPosRX( {FlagID,Actor[i][3][4]} );
		else
			x,y,z,_ = kg_GetPosRX( {FlagID,Actor[i][3][3]} );
		end
		Move(Actor[i][2],x,y,z);
	end
	Sleep(10);
	local PlayerArray = SearchRangePlayer( NPC, 300 );
	for i =0 , #PlayerArray-1 do
		if CheckAcceptQuest(PlayerArray[i],424218)==true and CheckBuff(PlayerArray[i],509849)==true and kg_GetDis(PlayerArray[i],FlagID,1)<=250 then
			SetFlag( PlayerArray[i],545106 , 1 );--給予獎勵
			SetFlag( PlayerArray[i] , 545227 , 0 );
		end
	end
end

function LuaQ_424218_ShowEnd(NPC)
	NPC = NPC or OwnerID();
	for i in pairs( Lua_Zone20_QuestObj[424218] ) do
		DelObj( Lua_Zone20_QuestObj[424218][i] );
	end;
	Lua_Zone20_QuestObj[424218]=nil;
	WriteRoleValue(NPC,EM_RoleValue_Register10,0);
end

-----------------------------------------------424219--------------------------------------------------------
function LuaS_118264_1()
	local Player = OwnerID();
	local NPC = TargetID();--伊崔妮．吉昂特
	LoadQuestOption(Player);
	if CheckAcceptQuest(Player,424219)==true and CheckFlag( Player,545107 )~=true then
		if ReadRoleValue(NPC,EM_RoleValue_Register10)==0 then
			AddSpeakOption( Player, NPC, "[SC_424219_01]", "LuaS_118264_2",0 );--我已經準備好參與會議了。
		else
			local Message = "[SAY_NPC_BUSY_02][$SETVAR1="..GetName(NPC).."]";
			ScriptMessage( Player, Player, 1,Message, 0 );--[$VAR1]正在忙碌中，請稍後再嘗試一次。
		end
	elseif CheckAcceptQuest(Player,424221)==true  and CheckFlag( Player,545112 )~=true then
		if ReadRoleValue(NPC,EM_RoleValue_Register9)==0 then
			AddSpeakOption( Player, NPC, "[SC_424219_01]", "LuaS_118264_3",0 );--我已經準備好參與會議了。
		else
			local Message = "[SAY_NPC_BUSY_02][$SETVAR1="..GetName(NPC).."]";
			ScriptMessage( Player, Player, 1,Message, 0 );--[$VAR1]正在忙碌中，請稍後再嘗試一次。
		end
	elseif CheckAcceptQuest(Player,424222)==true and CheckFlag( Player,545113 )~=true then
		if ReadRoleValue(NPC,EM_RoleValue_Register8)==0 then
			AddSpeakOption( Player, NPC, "[SC_424222_01]", "LuaS_118264_4",0 );--我已準備好了。
		else
			local Message = "[SAY_NPC_BUSY_02][$SETVAR1="..GetName(NPC).."]";
			ScriptMessage( Player, Player, 1,Message, 0 );--[$VAR1]正在忙碌中，請稍後再嘗試一次。
		end
	end
end

function LuaS_118264_2()
	local Player = OwnerID();
	local NPC = TargetID();--伊崔妮．吉昂特
	if ReadRoleValue(NPC,EM_RoleValue_Register10)==0 then
		WriteRoleValue(NPC,EM_RoleValue_Register10,1);
		CallPlot(NPC,"Lua_118264_Show",NPC,Player );
	end
	CloseSpeak(Player);
end

function Lua_118264_Show(NPC,Player)
	local FlagID = 780955;
	local RoomID = ReadRoleValue(NPC, EM_RoleValue_RoomID);
	--產生劇情中控器,劇情就不會掛在原本的NPC身上
	local Ctrl=OwnerID();
	if ReadRoleValue( Ctrl , EM_RoleValue_OrgID )~=117201 then
		if type(Lua_Zone20_QuestObj)~="table" then
			Lua_Zone20_QuestObj={};
		end
		Lua_Zone20_QuestObj[424219]={};
		local Ctrl = kg_GetPosRX( NPC , 117201 );
		--table.insert( Lua_Zone20_QuestObj[424219] , Ctrl );
		WriteRoleValue( Ctrl , EM_RoleValue_Register1 , NPC );--劇情中控器記住NPC
		kg_InvisibleObjInit(Ctrl);
		AddToPartition( Ctrl , RoomID );
		CallPlot(Ctrl,"Lua_118264_Show",NPC,Player );
		return
	end
	
	local Actor = {	{118416,0,Zone20_kg_QuestNPC[114367]},	--蘭斯
			{118417,0,Zone20_kg_QuestNPC[118264]},	--伊崔妮
			{118418,0,{FlagID,1}},				--卡拉維
			{118419,0,{3,4}},				--傑諾
			{118420,0,{5,6}},				--赫蒂爾
			{118421,0,{7,8}},				--蜜朵娜
			{118422,0,{9,10}},				--螢火
			{118423,0,{11,12}},				--奇普
			{118424,0,{13,14}},				--賽弗爾
			};
			
	--循環檢查整體任務狀態
	CallPlot( Ctrl , "ks_QuestAddBuff" , 424219, 545107, 509850, 300, "LuaQ_424219_ShowEnd"  );
	local x,y,z;
	for i =1,3 do
		Actor[i][2]=kg_GetPosRX( Actor[i][3],Actor[i][1] );
		table.insert( Lua_Zone20_QuestObj[424219] , Actor[i][2] );
		kg_ActorInit( Actor[i][2] );
		SetModeEx( Actor[i][2] , EM_SetModeType_Mark, false)	----可點選(否)
		SetModeEx( Actor[i][2] , EM_SetModeType_ShowRoleHead, false) 	---頭像框(否)
		AddToPartition(Actor[i][2],RoomID);
	end
	for i =4,#Actor do
		x,y,z,_ = kg_GetPosRX( {FlagID,Actor[i][3][2]} );
		Actor[i][2]=kg_GetPosRX(  {FlagID,Actor[i][3][1] },Actor[i][1] );
		table.insert( Lua_Zone20_QuestObj[424219] , Actor[i][2] );
		kg_ActorInit( Actor[i][2] );
		SetModeEx( Actor[i][2] , EM_SetModeType_Mark, false)	----可點選(否)
		SetModeEx( Actor[i][2] , EM_SetModeType_ShowRoleHead, false) 	---頭像框(否)
		AddToPartition(Actor[i][2],RoomID);
		Move(Actor[i][2],x,y,z);
	end
	Sleep(60);--等候NPC走到定位
	FaceFlag ( Actor[9][2], FlagID , 2 );
	AdjustDir( Actor[9][2], 0 );
	PlayMotion( Actor[3][2],ruFUSION_ACTORSTATE_EMOTE_SPEAK );
	Yell(Actor[3][2], "[SC_424219_ACT_01]",3 );--各位，我相信我們很清楚現在面臨的危機。
	Sleep(30);
	PlayMotion( Actor[3][2],ruFUSION_ACTORSTATE_EMOTE_SPEAK );
	Yell(Actor[3][2], "[SC_424219_ACT_02]",3 );--艾娜莉亞‧格拉夫褻瀆死者、擾亂生者安寧，而這些事件的背後，我發現有個人在操控這一切。
	Sleep(40);
	PlayMotion( Actor[3][2],ruFUSION_ACTORSTATE_EMOTE_SPEAK );
	Yell(Actor[3][2], "[SC_424219_ACT_03]",3 );--他是教導艾娜莉亞操控屍體技術的人，被她尊稱為「老師」。
	Sleep(30);
	PlayMotion( Actor[3][2],ruFUSION_ACTORSTATE_EMOTE_SPEAK );
	Yell(Actor[3][2], "[SC_424219_ACT_04]",3 );--這位「老師」恐怕將帶來更大的問題，我們必須立即解決這個威脅，確保子民的和平。
	Sleep(40);
	PlayMotion( Actor[3][2] , ruFUSION_ACTORSTATE_EMOTE_APPROVAL  );--贊同
	Yell(Actor[3][2], "[SC_424219_ACT_05]",3 );--請各位將你們的軍隊借給我，立刻掃除這些藐視生命的惡者！
	Sleep(30)
	AdjustFaceDir( Actor[1][2],Actor[3][2],0 );
	Sleep(15);
	PlayMotion( Actor[1][2],ruFUSION_ACTORSTATE_EMOTE_SPEAK );
	Yell(Actor[1][2], "[SC_424219_ACT_06]",3 );--貿然出兵只會打草驚蛇，我建議暫緩出兵一事。
	Sleep(10);
	AdjustFaceDir( Actor[3][2],Actor[1][2],0 );
	Sleep(20);
	Yell(Actor[3][2], "[SC_424219_ACT_07]",3 );--唔.....
	Sleep(30);
	AdjustFaceDir( Actor[9][2],Actor[3][2],0 );
	Sleep(15)
	PlayMotion( Actor[9][2],ruFUSION_ACTORSTATE_EMOTE_SPEAK );
	Yell(Actor[9][2], "[SC_424219_ACT_08]",3 );--我想四位領主舟車勞頓，何不先暫停會議，稍做歇息？
	Sleep(10);
	AdjustFaceDir( Actor[3][2],Actor[9][2],0 );
	Sleep(20);
	PlayMotion( Actor[3][2], ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD );
	Yell(Actor[3][2], "[SC_424219_ACT_09]" ,3 );--就照老師說的吧各位辛苦了。
	Sleep(10)
	FaceFlag ( Actor[3][2], FlagID , 2 );
	AdjustDir( Actor[3][2], 0 );
	Sleep(30);
	for i=4,#Actor do
		x,y,z,_ = kg_GetPosRX( {FlagID,Actor[i][3][1]} );
		Move(Actor[i][2],x,y,z);
	end
	Sleep(20);
	for i=4,8 do
		DelObj(Actor[i][2]);
	end
	Tell( Player , Actor[9][2]  , "[SC_424219_TIP_01]" );--賽弗爾悄悄地對你說：過來找我一下，我就在王宮旁不遠處。
	Sleep(15);
	local PlayerArray = SearchRangePlayer( NPC, 300 );
	for i =0 , #PlayerArray-1 do
		if CheckAcceptQuest(PlayerArray[i],424219)==true and CheckBuff(PlayerArray[i],509850)==true and kg_GetDis(PlayerArray[i],FlagID , 2  )<=240 then
			SetFlag( PlayerArray[i],545107 , 1 );--給予獎勵
		end
	end
	Sleep(15);
	--[[
	CancelBuff(Player, 509850);
	DelObj(Actor[1][2]);
	DelObj(Actor[2][2]);
	DelObj(Actor[3][2]);
	DelObj(Actor[9][2]);
	WriteRoleValue(NPC,EM_RoleValue_Register10,0);
	]]
end

function LuaQ_424219_ShowEnd()
	local Ctrl = OwnerID();
	local NPC = ReadRoleValue( Ctrl , EM_RoleValue_Register1 );
	for i in pairs( Lua_Zone20_QuestObj[424219] ) do
		DelObj( Lua_Zone20_QuestObj[424219][i] );
	end;
	Lua_Zone20_QuestObj[424219]=nil;
	WriteRoleValue(NPC,EM_RoleValue_Register10,0);
	Sleep(5); DelObj(Ctrl);
end

----------------------------------424221----------------------------------
function LuaS_118264_3()
	local Player = OwnerID();
	local NPC = TargetID();--伊崔妮．吉昂特
	if ReadRoleValue(NPC,EM_RoleValue_Register9)==0 then
		WriteRoleValue(NPC,EM_RoleValue_Register9,1);
		CallPlot(NPC,"Lua_118264_Show2",NPC,Player );
	end
	CloseSpeak(Player);
end

function Lua_118264_Show2( NPC,Player )
	local FlagID = 780955;
	local RoomID = ReadRoleValue(NPC, EM_RoleValue_RoomID);
	--產生劇情中控器,劇情就不會掛在原本的NPC身上
	local Ctrl=OwnerID();
	if ReadRoleValue( Ctrl , EM_RoleValue_OrgID )~=117201 then
		if type(Lua_Zone20_QuestObj)~="table" then
			Lua_Zone20_QuestObj={};
		end
		Lua_Zone20_QuestObj[424221]={};
		local Ctrl = kg_GetPosRX( NPC , 117201 );
		--table.insert( Lua_Zone20_QuestObj[424221] , Ctrl );
		WriteRoleValue( Ctrl , EM_RoleValue_Register1 , NPC );--劇情中控器記住NPC
		kg_InvisibleObjInit(Ctrl);
		AddToPartition( Ctrl , RoomID );
		CallPlot(Ctrl,"Lua_118264_Show2",NPC,Player );
		return
	end
	--循環檢查整體任務狀態
	CallPlot( Ctrl , "ks_QuestAddBuff" , 424221, 545112, 509851, 300, "LuaQ_424221_ShowEnd"  );
	
	local Actor = {	{118425,0,Zone20_kg_QuestNPC[114367]},	--蘭斯
			{118426,0,Zone20_kg_QuestNPC[118264]},	--伊崔妮
			{118427,0,{FlagID,1}},				--卡拉維
			{118428,0,{3,4}},				--傑諾
			{118429,0,{5,6}},				--赫蒂爾
			{118430,0,{7,8}},				--蜜朵娜
			{118431,0,{9,10}},				--螢火
			{118432,0,{11,12}},				--奇普
			{118433,0,{13,14}},				--賽弗爾
			};
	local x,y,z;
	for i =1,3 do
		Actor[i][2]=kg_GetPosRX( Actor[i][3],Actor[i][1] );
		table.insert( Lua_Zone20_QuestObj[424221] , Actor[i][2] );
		kg_ActorInit( Actor[i][2] );
		SetModeEx( Actor[i][2] , EM_SetModeType_Mark, false)	----可點選(否)
		SetModeEx( Actor[i][2] , EM_SetModeType_ShowRoleHead, false) 	---頭像框(否)
		AddToPartition(Actor[i][2],RoomID);
	end
	for i =4,#Actor do
		x,y,z,_ = kg_GetPosRX( {FlagID,Actor[i][3][2]} );
		Actor[i][2]=kg_GetPosRX(  {FlagID,Actor[i][3][1] },Actor[i][1] );
		table.insert( Lua_Zone20_QuestObj[424221] , Actor[i][2] );
		kg_ActorInit( Actor[i][2] );
		SetModeEx( Actor[i][2] , EM_SetModeType_Mark, false)	----可點選(否)
		SetModeEx( Actor[i][2] , EM_SetModeType_ShowRoleHead, false) 	---頭像框(否)
		AddToPartition(Actor[i][2],RoomID);
		Move(Actor[i][2],x,y,z);
	end
	Sleep(60);--等候NPC走到定位
	FaceFlag ( Actor[9][2], FlagID , 2 );
	AdjustDir( Actor[9][2], 0 );
	PlayMotion( Actor[3][2],ruFUSION_ACTORSTATE_EMOTE_SPEAK );
	Yell(Actor[3][2],"[SC_424221_ACT_01]",3);--再次召集各位，是有件重要的事情宣佈。
	Sleep(30);
	PlayMotion( Actor[3][2],ruFUSION_ACTORSTATE_EMOTE_SPEAK );
	Yell(Actor[3][2],"[SC_424221_ACT_02]",3);--我與賽弗爾老師談過了，為了迎戰這個敵人，我們必須接受訓練。
	Sleep(40);
	PlayMotion( Actor[3][2],ruFUSION_ACTORSTATE_EMOTE_SPEAK );
	Yell(Actor[3][2],"[SC_424221_ACT_03]",3);--這項訓練是為了激發出各位身為古代七位英雄的血脈繼承者該有的潛力。
	Sleep(40);
	PlayMotion( Actor[3][2],ruFUSION_ACTORSTATE_EMOTE_SPEAK );
	Yell(Actor[3][2],"[SC_424221_ACT_04]",3);--至於訓練的內容將由唯一與七位英雄同行過的「不滅者」康葛斯決定。各位的意見是...？
	Sleep(40);
	local FaceNum= kg_Rand(4,8);
	for i =4,7 do
		if i~= FaceNum then
			AdjustFaceDir( Actor[i][2] , Actor[FaceNum][2], 0 );
		end
	end
	Sleep(10)
	for i =4,7 do
		PlayMotion( Actor[i][2],ruFUSION_ACTORSTATE_EMOTE_SPEAK );
	end
	Sleep(30);
	for i =4,7 do
		AdjustFaceDir( Actor[i][2] , Actor[3][2], 0 );
	end
	Sleep(15);
	PlayMotion( Actor[4][2],ruFUSION_ACTORSTATE_EMOTE_SPEAK );
	Yell( Actor[4][2],"[SC_424221_ACT_05]",3 );--我們沒有異議，陛下。
	Sleep(30);
	PlayMotion( Actor[3][2],ruFUSION_ACTORSTATE_EMOTE_VICTORY );
	Yell( Actor[3][2],"[SC_424221_ACT_06]",3 );--好！達拉尼斯將由我與蘭斯做為代表；艾翁是傑斯；夏多爾是伊崔妮；安格爾與萊慕恩的代表就是蜜朵娜與螢火。
	Sleep(40);
	PlayMotion( Actor[3][2],ruFUSION_ACTORSTATE_EMOTE_SPEAK );
	Yell( Actor[3][2],"[SC_424221_ACT_07]",3 );--各位如果對於人選沒有任何異議，我們的會議就結束吧。
	Sleep(30);
	for i=4,#Actor do
		x,y,z,_ = kg_GetPosRX( {FlagID,Actor[i][3][1]} );
		Move(Actor[i][2],x,y,z);
	end
	Sleep(20);
	for i=1,#Actor do
		DelObj(Actor[i][2]);
	end
	local PlayerArray = SearchRangePlayer( NPC, 300 );
	for i =0 , #PlayerArray-1 do
		if CheckAcceptQuest(PlayerArray[i],424221)==true and CheckBuff(PlayerArray[i],509851)==true and kg_GetDis(PlayerArray[i],FlagID , 2  )<=240 then
			SetFlag( PlayerArray[i],545112 , 1 );--給予獎勵
		end
	end
end

function LuaQ_424221_ShowEnd()
	local Ctrl = OwnerID();
	local NPC = ReadRoleValue( Ctrl , EM_RoleValue_Register1 );
	for i in pairs( Lua_Zone20_QuestObj[424221] ) do
		DelObj( Lua_Zone20_QuestObj[424221][i] );
	end;
	Lua_Zone20_QuestObj[424221]=nil;
	WriteRoleValue(NPC,EM_RoleValue_Register9,0);
	Sleep(5); DelObj(Ctrl);
end

----------------------------------424222----------------------------------
function LuaS_118264_4()
	local Player = OwnerID();
	local NPC = TargetID();--伊崔妮．吉昂特
	if ReadRoleValue(NPC,EM_RoleValue_Register8)==0 then
		WriteRoleValue(NPC,EM_RoleValue_Register8,1);
		CallPlot(NPC,"Lua_118264_Show3",NPC,Player );
	end
	CloseSpeak(Player);
end

function Lua_118264_Show3( NPC,Player )
	local RoomID = ReadRoleValue(NPC, EM_RoleValue_RoomID);
	--產生劇情中控器,劇情就不會掛在原本的NPC身上
	local Ctrl=OwnerID();
	if ReadRoleValue( Ctrl , EM_RoleValue_OrgID )~=117201 then
		if type(Lua_Zone20_QuestObj)~="table" then
			Lua_Zone20_QuestObj={};
		end
		Lua_Zone20_QuestObj[424222]={};
		local Ctrl = kg_GetPosRX( NPC , 117201 );
		--table.insert( Lua_Zone20_QuestObj[424222] , Ctrl );
		kg_InvisibleObjInit(Ctrl);
		WriteRoleValue( Ctrl , EM_RoleValue_Register1 , NPC );--劇情中控器記住NPC
		AddToPartition( Ctrl , RoomID );
		CallPlot(Ctrl,"Lua_118264_Show3",NPC,Player );
		return
	end
	AddBuff( Player , 509852 , 0 ,-1 );--給玩家buff
	CallPlot( Ctrl,"Lua_424222_CheckQuest", Player , 424222, 545113, 509852 );
	
	local FlagID = 780957;
	local Actor = {	{118434,0,Zone20_kg_QuestNPC[114367]},	--蘭斯
			{118435,0,Zone20_kg_QuestNPC[118264]},	--伊崔妮
			{118436,0,{FlagID,1}},				--卡拉維
			{118437,0,{3,4}},				--傑諾
			{118438,0,{5,6}},				--赫蒂爾
			{118439,0,{7,8}},				--蜜朵娜
			{118440,0,{9,10}},				--螢火
			{118441,0,{11,12}},				--奇普
			};
	local x,y,z;
	for i =1,3 do
		Actor[i][2]=kg_GetPosRX( Actor[i][3],Actor[i][1] );
		table.insert( Lua_Zone20_QuestObj[424222] , Actor[i][2] );
		kg_ActorInit( Actor[i][2] );
		SetModeEx( Actor[i][2] , EM_SetModeType_Mark, false)	----可點選(否)
		SetModeEx( Actor[i][2] , EM_SetModeType_ShowRoleHead, false) 	---頭像框(否)
		AddToPartition(Actor[i][2],RoomID);
	end
	for i =4,#Actor do
		x,y,z,_ = kg_GetPosRX( {FlagID,Actor[i][3][2]} );
		Actor[i][2]=kg_GetPosRX(  {FlagID,Actor[i][3][1] },Actor[i][1] );
		table.insert( Lua_Zone20_QuestObj[424222] , Actor[i][2] );
		kg_ActorInit( Actor[i][2] );
		SetModeEx( Actor[i][2] , EM_SetModeType_Mark, false)	----可點選(否)
		SetModeEx( Actor[i][2] , EM_SetModeType_ShowRoleHead, false) 	---頭像框(否)
		AddToPartition(Actor[i][2],RoomID);
		Move(Actor[i][2],x,y,z);
	end
	Sleep(50);--等候NPC走到定位
	Yell(Actor[1][2],"[SC_424222_ACT_01]",3);--現在開始舉行冊封儀式。
	Sleep(30);
	local PlayerName = GetName(Player);
	Yell(Actor[1][2] , "[SC_424222_ACT_02][$SETVAR1="..PlayerName.."]"  , 3 );--由於你多次表現優異，我身為獅心騎士團團長，決定向陛下推薦，讓你晉升為高階騎士。
	Sleep(50);
	PlayMotion(Actor[1][2], ruFUSION_ACTORSTATE_EMOTE_POINT );
	Yell(Actor[1][2] , "[SC_424222_ACT_03]" , 3 );--到前面來，單膝跪在陛下面前。
	Sleep(10);
	ScriptMessage( Player , Player , 2 ,  "[SC_424222_TIP_01]" , "0xffff0000" );--現在請盡快走到卡拉維面前
	Sleep(20);
	local timer = 0; 
	while 1 do
		Sleep(10);
		if kg_GetDis(Player,FlagID,2)<16 and timer<=10 then
			break
		elseif timer>10 then	--玩家10秒內沒有到範圍內
			Yell(Actor[1][2] ,"[SC_424222_END_01]" ,3 );--看來你還沒有準備好...那麼冊封儀式改天再舉行吧！
			Sleep(30);
			ScriptMessage( Player , Player , 2 ,  "[SC_424222_TIP_02]" , "0xffff0000" );--你沒有完成儀式，請重新向伊崔妮報到
			CancelBuff(Player, 509852);
			for i=1,#Actor do
				DelObj(Actor[i][2]);
			end
			WriteRoleValue(NPC,EM_RoleValue_Register8,0);
			Sleep(5); DelObj(Ctrl);
			return
		end
		timer = timer+1;
	end
	AddBuff(Player,503977,0,-1);--乖乖看戲
	AdjustFaceDir( Player , Actor[3][2],0 );
	Sleep(15);
	PlayMotion(Player,ruFUSION_ACTORSTATE_CROUCH_BEGIN);--跪下
	Sleep(30);
	PlayMotion(Actor[3][2],ruFUSION_ACTORSTATE_EMOTE_POINT);
	NPCSay(Actor[3][2] , "[SC_424222_ACT_04][$SETVAR1="..PlayerName.."]" );--從現在起，你就是獅心騎士團的高階騎士。
	Sleep(30);
	NPCSay(Actor[3][2], "[SC_424222_ACT_05]");--保持你對我的忠誠心，不要忘了你身為騎士的榮耀。
	Sleep(30);
	for i=1,2 do
		CallPlot( Actor[i][2] ,"Lua_424222_APPLAUSE", Actor[i][2]);
	end
	for i =4 , #Actor do
		CallPlot( Actor[i][2] ,"Lua_424222_APPLAUSE", Actor[i][2]);
	end
	Sleep(20);
	if CheckAcceptQuest(Player,424222)==true and CheckBuff(Player,509852)==true and kg_GetDis(Player,780955 , 2  )<=240 then
		PlayMotion(Player,ruFUSION_ACTORSTATE_CROUCH_END);--跪下結束
		SetFlag( Player,545113 , 1 );--給予獎勵
	end
	Sleep(15);
	for i=4,#Actor do
		x,y,z,_ = kg_GetPosRX( {FlagID,Actor[i][3][1]} );
		Move(Actor[i][2],x,y,z);
	end
	Sleep(20);
	CancelBuff(Player,503977);
	CancelBuff(Player, 509852);
end

function Lua_424222_APPLAUSE( Obj )
	for i=1,3 do
		PlayMotion( Obj,ruFUSION_ACTORSTATE_EMOTE_APPLAUSE );
		Sleep(15);
	end
end

function Lua_424222_CheckQuest( Player , QuestID, FlagID, BuffID )
	local Ctrl = OwnerID();
	local NPC = ReadRoleValue( Ctrl , EM_RoleValue_Register1 );
	while 1 do
		if CheckID(Player) == true and  CheckAcceptQuest( Player, QuestID ) ~= true or --檢查有無任務
		CheckBuff( Player, BuffID ) ~= true or --檢查有無BUFF
		--CheckFlag( Player, FlagID ) == true or --檢查有無重要物品
		CheckID(Player) ~= true or
		kg_GetDis(Player,780955 , 2  )>240 then --檢查是否超過檢查範圍
			CancelBuff( Player, BuffID );
			CancelBuff(Player,503977);
			break
		end
		Sleep(20);
	end
	for i in pairs( Lua_Zone20_QuestObj[424222] ) do
		DelObj( Lua_Zone20_QuestObj[424222][i] );
	end;
	Lua_Zone20_QuestObj[424222]=nil;
	WriteRoleValue(NPC,EM_RoleValue_Register8,0);
	Sleep(5); DelObj( Ctrl );
	DebugMsg(0,0,"424222_CheckQuest break");
end

----------------------------------424225----------------------------------
function Lua_424225_Tip01()--玩家範圍觸發提示
	local Player = OwnerID();
	local NpcA = TargetID();
	if CheckAcceptQuest(Player,424225)==true and CheckFlag( Player,545115 )~=true and ReadRoleValue(ReadRoleValue(NpcA,EM_RoleValue_Register9),EM_RoleValue_Register10 )==1 then
		ScriptMessage( NpcA,Player,2,"[SC_424225_TIP_01]","0xffff0000" );--快阻止兩人的爭吵！
	end
end

function Lua_118273_CreateTalkGroup()--鬼打牆對話循環
	local Npc = OwnerID();
	WriteRoleValue(Npc,EM_RoleValue_Register10,1);--Part1
	local FlagID = 780958;
	local RoomID = ReadRoleValue(Npc,EM_RoleValue_RoomID);
	local NpcA  = kg_GetPosRX( {FlagID,3},118557 );
	kg_ActorInit(NpcA);
	WriteRoleValue(Npc , EM_RoleValue_Register9 , NpcA);
	WriteRoleValue(NpcA , EM_RoleValue_Register9 , Npc);
	AddToPartition( NpcA , RoomID );
	local NpcB = kg_GetPosRX( {FlagID,4},118558 );
	kg_ActorInit(NpcB);
	WriteRoleValue(Npc , EM_RoleValue_Register8 , NpcB);
	WriteRoleValue(NpcB , EM_RoleValue_Register9 , Npc);
	AddToPartition( NpcB , RoomID );
	
	SetPlot( NpcA, "range","Lua_424225_Tip01", 50 );
	local TalkString = {	{NpcA,"[SC_424225_ACT_01]",0},
				{NpcA,"[SC_424225_ACT_02]",ruFUSION_ACTORSTATE_EMOTE_POINT},
				{NpcB,"[SC_424225_ACT_03]",ruFUSION_ACTORSTATE_EMOTE_POINT},
				{NpcB,"[SC_424225_ACT_04]",0},
				{NpcB,"[SC_424225_ACT_05]",0},
				};
	local Step = 1;
	while 1 do
		if TalkString[Step][3]~=0 then
			PlayMotion( TalkString[Step][1] , TalkString[Step][3] );
		end
		NPCSay( TalkString[Step][1] ,TalkString[Step][2]);
		Step = Step+1;
		if Step>5 then Step=1; end
		Sleep(30);
	end
end

function LuaS_424225_1()--第一組人共用
	local Player = OwnerID();
	local NpcAB = TargetID();
	local Npc = ReadRoleValue(NpcAB,EM_RoleValue_Register9);
	local SpeakString = {	"[SC_424225_SPK_01]",		--不要再吵了！！
				"[SC_424225_SPK_02]",		--夠了，別吵了！！
				"[SC_424225_SPK_03]",		--你們不要吵架！
				"[SC_424225_SPK_04]",		--以和為貴啊！
				"[SC_424225_SPK_05]",		--又不是小孩子，別吵架！
				"[SC_424225_SPK_06]",		--你們都冷靜點！
				};
	LoadQuestOption(Player);
	if CheckAcceptQuest(Player,424225)==true and CheckFlag( Player,545115 )~=true then
		AddSpeakOption( Player, NpcAB , SpeakString[kg_Rand(6)]  , "LuaS_424225_2",0 );
	end
end

function LuaS_424225_2()--排隊進入Part2
	local Player = OwnerID();
	local Npc = ReadRoleValue(TargetID() , EM_RoleValue_Register9);
	if ReadRoleValue(Npc , EM_RoleValue_Register10 )==1 then
		WriteRoleValue(Npc , EM_RoleValue_Register10 , 2 );
		local Ctrl = kg_GetPosRX( {780958,3},117201);
		kg_InvisibleObjInit(Ctrl);
		AddToPartition( Ctrl , RoomID );
		CallPlot( Ctrl ,"Lua_424225_Part2",Npc,Player );
		--CallPlot( Npc ,"Lua_424225_Part2",Npc,Player );
	else
		if ReadRoleValue(Npc,EM_RoleValue_Register6)==1 then--勸架時機提醒開關
			ScriptMessage(TargetID(),Player,2,"[SC_424225_TIP_04]","0xffff0000" );--你錯失勸架的大好時機，現在他們又吵起來了。
		else
			ScriptMessage(TargetID(),Player,2,"[SC_424225_TIP_02]","0xffff0000" );--他沒把你的話聽進去，再試一次吧
		end
	end
	CloseSpeak(Player);
end

function Lua_424225_Part2(Npc,Player)
	DebugMsg(0,0,"Quest424225_EnterPart2!!");
	local Ctrl = OwnerID();
	local FlagID = 780958;
	local RoomID = ReadRoleValue(Npc, EM_RoleValue_RoomID);
	
	--創造新演員
	local NpcA2 = kg_GetPosRX( {FlagID,3},118443 );--茲卡歐．瑞斗
	kg_ActorInit(NpcA2);
	WriteRoleValue(NpcA2 , EM_RoleValue_Register9, Npc);
	DisableQuest( NpcA2 , true );
	AddToPartition( NpcA2 , RoomID );
	LockHP( NpcA2 , ReadRoleValue(NpcA2,EM_RoleValue_MaxHP)*0.25 , "Lua_424225_LockHP" );
	
	local NpcB2 = kg_GetPosRX( {FlagID,4},118444 );--帕洛恩．德夫
	kg_ActorInit(NpcB2);
	WriteRoleValue(NpcB2 , EM_RoleValue_Register9, Npc);
	DisableQuest( NpcB2 , true );
	AddToPartition( NpcB2 , RoomID );
	LockHP( NpcB2 , ReadRoleValue(NpcB2,EM_RoleValue_MaxHP)*0.25 , "Lua_424225_LockHP" );
	AddBuff(NpcB2,502707,1,-1);
	
	--上障眼法
	AddBuff( Player , 509853 , 0 ,-1 );
	Sleep(20);
	NPCSay( NpcA2 , "[SC_424225_FIG_01]" );--夠了！我生氣了！
	PlayMotion(NpcA2,ruFUSION_ACTORSTATE_ATTACK_1H);
	Sleep(5);
	PlayMotion( NpcB2 , ruFUSION_ACTORSTATE_KNOCKDOWN_BEGIN );
	Sleep(13);
	NPCSay( NpcB2 , "[SC_424225_FIG_02]" );--你！你竟然動手！
	Sleep(20);
	
	--打架循環
	ScriptMessage( Npc , Player , 2 , "[SC_424225_TIP_05]", "0xffff0000" );--快快阻止他們的打鬥行為！
	AddBuff(NpcA2,507532,0,-1);
	AddBuff(NpcA2,620034,0,-1);
	AddBuff(NpcB2,507532,0,-1);
	AddBuff(NpcB2,620034,0,-1);
	AddBuff(Player, 620032 , 0 ,-1);
	CallPlot( NpcA2 , "Lua_424225_NpcFight" , Npc , NpcA2 , NpcB2 );
	
	local Part2Check = ReadRoleValue( Npc , EM_RoleValue_Register7 );
	while 1 do
		if ReadRoleValue(Npc,EM_RoleValue_Register10)==3 then--任一NPC血量低於25%就跳出迴圈
			break
		end
		Part2Check = ReadRoleValue( Npc , EM_RoleValue_Register7 );
		Part2Check = Part2Check +1 ;
		if Part2Check>10 or CheckAcceptQuest(Player,424225)~=true or CheckID(Player)~=true or kg_GetDis( Player,780958 , 3  )>240 then	--當檢查值大於10,即超過10秒家沒動作,就重製此階段
			DebugMsg(0,0,"424225 Fail")
			DelObj(NpcA2);
			DelObj(NpcB2);
			CancelBuff(Player,509853);
			CancelBuff(Player,620032);
			CallPlot(Npc,"Lua_424225_CloseHint",Npc);
			Sleep(10);--等刪除物件
			local PlayerList = SearchRangePlayer( Ctrl , 150 );
			for i in pairs(PlayerList) do
				if CheckAcceptQuest( PlayerList[i] , 424225 )==true and CheckBuff(  PlayerList[i] ,509853 )~=true and CheckBuff(  PlayerList[i] ,620036 )~=true and CheckFlag( Player,545115 )~=true then
					ScriptMessage(Npc,PlayerList[i],2,"[SC_424225_TIP_03]", "0xffff0000" );--現在正是勸架的好機會！
				end
			end
			WriteRoleValue( Npc, EM_RoleValue_Register5 , 0 );--NPC互打開關
			WriteRoleValue(Npc,EM_RoleValue_Register6 , 1 );--勸架時機提醒開關
			WriteRoleValue(Npc,EM_RoleValue_Register7 , 0 );--計次檢查
			WriteRoleValue(Npc,EM_RoleValue_Register10 , 1);--鎖定解除
			Sleep(5); DelObj(OwnerID());
			return
		else
			WriteRoleValue( Npc , EM_RoleValue_Register7 , Part2Check );
		end
		
		Sleep(10);
	end
	
	DebugMsg(0,0,"Quest424225_EnterPart3!!");
	CancelBuff(Player,620032);--拿掉玩家技能
	CancelBuff(NpcA2,620034);
	CancelBuff(NpcB2,620034);
	LockHP( NpcA2 , 0 , "" );
	LockHP( NpcB2 , 0 , "" );
	
	AddBuff( Player , 620036 , 0 ,-1 );--為了看見第三組,順便擋掉接任務的亞力克．費勒
	local Npc2 = kg_GetPosRX( {FlagID,1},118445 );
	kg_ActorInit(Npc2);
	SetModeEx( Npc2 , EM_SetModeType_Mark, false)	----可點選(否)
	SetModeEx( Npc2 , EM_SetModeType_ShowRoleHead, false) 	---頭像框(否)
	WriteRoleValue(Npc2,EM_RoleValue_IsWalk,0);
	AddToPartition(Npc2,RoomID);
	Sleep(10);
	LuaFunc_MoveToFlag( Npc2 , FlagID, 2,0 );
	WriteRoleValue( Npc, EM_RoleValue_Register5 , 1 );
	NPCSay( Npc2, "[SC_424225_FIG_03]");--都別打了！特使大人您也真是..
	PlayMotion( Npc2,ruFUSION_ACTORSTATE_EMOTE_SPEAK );
	Sleep(10);
	AdjustFaceDir(NpcA2,Npc2,0);
	AdjustFaceDir(NpcB2,Npc2,0);
	Sleep(20);
	NPCSay(NpcA2,"[SC_424225_FIG_04]");--特、特使！？
	PlayMotion( NpcA2,ruFUSION_ACTORSTATE_EMOTE_SPEAK );
	Sleep(20);
	
	--Part3
	local NpcA3 = kg_GetPosRX( NpcA2,118554 );
	kg_ActorInit( NpcA3 );
	SetModeEx( NpcA3 , EM_SetModeType_Mark, false)	----可點選(否)
	SetModeEx( NpcA3 , EM_SetModeType_ShowRoleHead, false) 	---頭像框(否)
	AddToPartition(NpcA3 ,RoomID);
	local NpcB3 = kg_GetPosRX(NpcB2 , 118555);
	kg_ActorInit( NpcB3 );
	SetModeEx( NpcB3 , EM_SetModeType_Mark, false)	----可點選(否)
	SetModeEx( NpcB3 , EM_SetModeType_ShowRoleHead, false) 	---頭像框(否)
	AddToPartition(NpcB3 ,RoomID);
	local Npc3 = kg_GetPosRX(Npc2,118556);
	kg_ActorInit( Npc3 );
	SetModeEx( Npc3 , EM_SetModeType_Mark, false)	----可點選(否)
	SetModeEx( Npc3 , EM_SetModeType_ShowRoleHead, false) 	---頭像框(否)
	AddToPartition(Npc3 ,RoomID);
	CallPlot(Npc3, "Lua_424225_Part3" , Npc , Player , Npc3 , NpcA3 , NpcB3  );
	CallPlot(Npc3, "Lua_424225_CheckPart3" , Npc , Player , Npc3 , NpcA3 , NpcB3  );
	--讓正在排隊的人參與
	DelObj(NpcA2);
	DelObj(NpcB2);
	DelObj(Npc2);
	Sleep(10);--等刪除物件
	local PlayerList = SearchRangePlayer( Ctrl , 150 );
	for i in pairs(PlayerList) do
		if CheckAcceptQuest( PlayerList[i] , 424225 )==true and CheckBuff(  PlayerList[i] ,509853 )~=true and CheckBuff(  PlayerList[i] ,620036 )~=true and CheckFlag( Player,545115 )~=true then
			ScriptMessage(Npc,PlayerList[i],2,"[SC_424225_TIP_03]", "0xffff0000" );--現在正是勸架的好機會！
		end
	end
	WriteRoleValue( Npc, EM_RoleValue_Register5 , 0 );
	WriteRoleValue(Npc,EM_RoleValue_Register6,1);
	WriteRoleValue(Npc,EM_RoleValue_Register10,1);
	CallPlot(Npc,"Lua_424225_CloseHint",Npc);
	Sleep(5); DelObj(OwnerID());
end

function Lua_424225_NpcFight( Npc , NpcA2 , NpcB2 )--兩個NPC互毆
	local Step = 0;
	while 1 do
		if ReadRoleValue( Npc,EM_RoleValue_Register5 )==1 then--任一NPC血量低於25%就跳出迴圈
			return
		end
		if Step%2==0 then
			PlayMotion(NpcB2,ruFUSION_ACTORSTATE_ATTACK_1H);
		else
			PlayMotion(NpcA2,ruFUSION_ACTORSTATE_ATTACK_1H);
		end
		Step = Step+1;
		Sleep(10)
	end
end

function Lua_424225_Part3( Npc , Player , Npc3 , NpcA3 , NpcB3 )
	Sleep(20);
	CancelBuff(Player,509853);
	NPCSay(NpcB3,"[SC_424225_END_01]");--這...難道是陛下不信任我們了...？
	PlayMotion( NpcB3,ruFUSION_ACTORSTATE_EMOTE_SPEAK );
	Sleep(30);
	NPCSay(Npc3,"[SC_424225_END_02]");--不用擔心，特使大人只是來了解當地情況。
	PlayMotion( Npc3,ruFUSION_ACTORSTATE_EMOTE_SPEAK );
	Sleep(35);
	NPCSay(NpcA3,"[SC_424225_END_03]");--這樣呀......
	PlayMotion( NpcA3,ruFUSION_ACTORSTATE_EMOTE_SPEAK );
	Sleep(30);
	NPCSay(Npc3,"[SC_424225_END_04]");--兩位使節還是先包紮傷口、休息一下吧？
	PlayMotion( Npc3,ruFUSION_ACTORSTATE_EMOTE_SPEAK );
	Sleep(35);
	NPCSay(NpcB3,"[SC_424225_END_05]");--也是......
	PlayMotion( NpcB3,ruFUSION_ACTORSTATE_EMOTE_SPEAK );
	Sleep(30);
	local FlagID = 780958;
	local x,y,z,_ = kg_GetPosRX( {FlagID , 3} , nil , 100 , 0 , 180 );
	Move( NpcA3 , x,y,z );
	x,y,z,_ = kg_GetPosRX( {FlagID , 4} , nil , 100 , 0 , 180 );
	Move( NpcB3 , x,y,z );
	Sleep(10);
	if CheckAcceptQuest(Player,424225)==true and CheckBuff(Player,620036)==true and kg_GetDis( Player,780958 , 3  )<=240 then
		SetFlag( Player,545115 , 1 );--給予獎勵
	end
	Sleep(10);
	DelObj(NpcA3);
	DelObj(NpcB3);
	Hide(Npc3);
	Sleep(30);
	CancelBuff(Player,620036);
	DelObj( Npc3 );
end
function Lua_424225_CheckPart3( Npc , Player , Npc3 , NpcA3 , NpcB3 )
	while 1 do
		if CheckID(Player) == true and  CheckAcceptQuest( Player, 424225 ) ~= true or --檢查有無任務
		CheckID(Player) ~= true or
		kg_GetDis(Player,780958 , 3  )>240 then --檢查是否超過檢查範圍
			CancelBuff( Player, 620036 );
			CancelBuff( Player, 509853 );
			break
		end
		Sleep(20);
	end
	DelObj(NpcA3); DelObj(NpcB3); DelObj(Npc3);
end
function Lua_424225_CloseHint(  Npc )
	Sleep(30);
	WriteRoleValue( Npc ,EM_RoleValue_Register6 ,0 );
end

function Lua_424225_LockHP()
	local Npc = ReadRoleValue(OwnerID(),EM_RoleValue_Register9);
	if ReadRoleValue(Npc,EM_RoleValue_Register10)==2 then
		WriteRoleValue(Npc,EM_RoleValue_Register10,3);
		DebugMsg(0,0,"Quest424225_ReadyToEnterPart3!!");
	end
end

function Lua_497854_Check()
	local Player = OwnerID();
	local OrgID = ReadRoleValue(TargetID(),EM_RoleValue_OrgID);
	if OrgID ==105805 or OrgID==105693 or OrgID==118443 or OrgID==118444  then
		return true
	end
	ScriptMessage( Player, Player, 1 , "[EM_200928_2]" , 0 )--目標錯誤
	return false
end

function Lua_497854_WriteReg7()
	local Npc = ReadRoleValue( TargetID() ,EM_RoleValue_Register9 );
	WriteRoleValue( Npc,EM_RoleValue_Register7 , 0 );
end

----------------------------------424229----------------------------------
function LuaS_118498_1()
	local Player = OwnerID();
	local NPC = TargetID();--獅心騎士
	LoadQuestOption(Player);
	if CheckAcceptQuest(Player,424229)==true and CheckFlag( Player,545096 )~=true then
		AddSpeakOption( Player, NPC, "[SC_424229_01]", "LuaS_118498_2",0 );--我來和你一同埋伏。
	end
end

function LuaS_118498_2()
	local Player = OwnerID();
	local NPC = TargetID();--獅心騎士
	if ReadRoleValue(NPC,EM_RoleValue_Register10)==0 then
		WriteRoleValue(NPC,EM_RoleValue_Register10,1);
		DebugMsg(0,0,"reg10="..ReadRoleValue(NPC,EM_RoleValue_Register10));
		CallPlot(NPC,"Lua_118498_Show",NPC,Player );
	else
		ScriptMessage(NPC,Player,2,"[SC_424229_TIP_04]","0xffff0000" );--他現在正忙著其他事情，晚一點再來找他比較好
	end
	CloseSpeak(Player);
end

function Lua_118498_Show(NPC,Player)
	local RoomID = ReadRoleValue(NPC, EM_RoleValue_RoomID);
	local Bucket = OwnerID();
	if ReadRoleValue(Bucket,EM_RoleValue_OrgID)~=117201 then
		local Bucket = kg_GetPosRX( NPC , 117201 , 15 );--產生再騎士前面，用於判定玩家是否在石頭後面
		kg_InvisibleObjInit( Bucket );
		AddToPartition( Bucket , RoomID );
		CallPlot( Bucket , "Lua_118498_Show" , NPC,Player);
		return
	end
	Tell( Player , NPC , "[SC_424229_TIP_01]" );--特使大人，請到石頭後面躲好，別讓人看到了。
	local timer =0;
	while 1 do
		if CheckAcceptQuest(Player,424229)~=true or kg_GetDis(Player,NPC  )>240 or CheckID(Player)~=true then
			DebugMsg(0,0,"Lua_118498_Show break");
			WriteRoleValue(NPC,EM_RoleValue_Register10,0);
			DelObj(Bucket);
			return
		end;
		if timer >10 then--玩家在10秒內沒有在範圍內
			Say( NPC , "[SC_424229_TIP_02]" );--特使大人，您這樣亂跑就失去了埋伏的意義啦！
			ScriptMessage(NPC,Player,2,"[SC_424229_TIP_03]","0xffff0000" );--請再一次與騎士說話
			WriteRoleValue(NPC,EM_RoleValue_Register10,0);
			DelObj(Bucket);
			return
		end;
		
		if kg_CheckTargetBack( Player , Bucket , 180 , 270 )==1 and kg_GetDis( Player , Bucket )<=60 then
			AddBuff(Player,503977,0,-1);--乖乖看戲
			SetDir( Player , ReadRoleValue( NPC , EM_RoleValue_Dir ) );
			break;
		end;
		Sleep(10);
		timer = timer +1 ;
	end;
	
	local FlagID = 780959;
	local Actor = {	{OrgID=118499 , Gid = 0 },	--演員騎士
			{OrgID=118500 , Gid = 0 },	--阿克
			};
	Actor[1].Gid = kg_GetPosRX( NPC , Actor[1].OrgID );
	kg_ActorInit( Actor[1].Gid );
	SetModeEx( Actor[1].Gid , EM_SetModeType_Mark, false)	----可點選(否)
	SetModeEx( Actor[1].Gid , EM_SetModeType_ShowRoleHead, false) 	---頭像框(否)
	WriteRoleValue( Actor[1].Gid , EM_RoleValue_IsWalk , 0 );
	AddToPartition( Actor[1].Gid , RoomID );
	Actor[2].Gid = kg_GetPosRX( {FlagID,2} , Actor[2].OrgID );
	kg_ActorInit( Actor[2].Gid );
	SetModeEx( Actor[2].Gid , EM_SetModeType_Mark, false)	----可點選(否)
	SetModeEx( Actor[2].Gid , EM_SetModeType_ShowRoleHead, false) 	---頭像框(否)
	AddToPartition( Actor[2].Gid , RoomID );
	CallPlot( Bucket , "Lua_424229_CheckPlayer" , NPC, Player , Actor[1].Gid , Actor[2].Gid  );
	AddBuff( Player , 509854 , 0 ,-1 );
	
	Sleep(20);
	LuaFunc_MoveToFlag( Actor[2].Gid , FlagID , 3 , 0 );
	Sleep(10);
	AdjustDir( Actor[2].Gid , 45 );
	Sleep(15);
	AdjustDir( Actor[2].Gid , -90 );
	Sleep(15);
	LuaFunc_MoveToFlag( Actor[2].Gid , FlagID , 4 , 0 );
	Sleep(10);
	AdjustDir( Actor[2].Gid , 45 );
	Sleep(15);
	AdjustDir( Actor[2].Gid , -90 );
	Sleep(15);
	local x,y,z,_ = kg_GetPosRX( {FlagID,5} );
	Move(Actor[2].Gid,x,y,z);
	Sleep(20);
	CancelBuff( Player , 503977 );
	LuaFunc_MoveToFlag( Actor[1].Gid , FlagID , 1 , 0 );
	AdjustFaceDir( Actor[1].Gid , Actor[2].Gid , 0 );
	Sleep(10);
	PlayMotion( Actor[1].Gid ,  ruFUSION_ACTORSTATE_EMOTE_POINT);
	NPCSay( Actor[1].Gid , "[SC_424229_ACT_01]"  );--站住，你這可疑的傢伙！
	Sleep(20);
	SetDefIdleMotion( Actor[1].Gid , ruFUSION_MIME_IDLE_COMBAT_2H );
	AdjustFaceDir( Actor[2].Gid , Actor[1].Gid , 0 );
	Sleep(10)
	local SpeakString = {	{2,"[SC_424229_ACT_02]",30,0 },	--看你這身盔甲就知道是獅心騎士團的人，怎麼這麼沒規矩。
				{2,"[SC_424229_ACT_03]",30,0 },	--喂喂，我是來幫我弟追查一些事情，可不是來這裡跟你打架的。
				{1,"[SC_424229_ACT_04]",20,0 },	--你弟弟...
				{2,"[SC_424229_ACT_05]",40,ruFUSION_ACTORSTATE_EMOTE_SPEAK },--我叫阿克．凱因斯，我弟曾拜託我帶過幾次訓練課程，不知道你在不在那之中就是了。
				{1,"[SC_424229_ACT_06]",40,ruFUSION_ACTORSTATE_EMOTE_SALUTE },--你這樣說，我是有些印象了，你是凱．凱因斯老師的兄長。對不起，我失禮了。
				{2,"[SC_424229_ACT_07]",40,ruFUSION_ACTORSTATE_EMOTE_SPEAK },--我弟拜託我來調查事情，不過看到你們在這裡，我想你們大概也知道發生什麼事情了。
				{2,"[SC_424229_ACT_08]",40,ruFUSION_ACTORSTATE_EMOTE_SPEAK },--那個送貨商人已經死去多時，我隨著過去的帳單買賣紀錄追查，於是來到這裡。
				{2,"[SC_424229_ACT_09]",30,ruFUSION_ACTORSTATE_EMOTE_SPEAK },--從此之後，不會再有神賜之果流入紅土丘陵了，你們大可放心。
				{2,"[SC_424229_ACT_10]",30,ruFUSION_ACTORSTATE_EMOTE_STRETCH },--好啦，沒別的事情的話，我就走了。
				};
				
	for i =1 ,#SpeakString do
		if i==3 then
			SetDefIdleMotion( Actor[1].Gid ,ruFUSION_MIME_IDLE_STAND );
		end
		PlayMotion( Actor[SpeakString[i][1]].Gid , SpeakString[i][4] );
		NPCSay( Actor[ SpeakString[i][1] ].Gid , SpeakString[i][2] );
		Sleep( SpeakString[i][3] );
	end
	Sleep(20);
	x,y,z,_ = kg_GetPosRX({FlagID,5},nil,100,0,180);
	Move( Actor[2].Gid ,x,y,z);
	x,y,z,_ = kg_GetPosRX({FlagID,1},nil,100,0,180);
	Move( Actor[1].Gid ,x,y,z);
	Sleep(15);
	if CheckAcceptQuest(Player,424229)==true and CheckBuff(Player,509854)==true and kg_GetDis(Player,FlagID , 5  )<=240 then
		SetFlag( Player,545096 , 1 );--給予獎勵
	end
	for i=1,#Actor do
		DelObj(Actor[i].Gid);
	end
	Sleep(10);
	CancelBuff(Player, 509854);
	WriteRoleValue(NPC,EM_RoleValue_Register10,0);
end

function Lua_424229_CheckPlayer( NPC,Player,Npc1,Npc2 )
	while 1 do
		if CheckID(Player) == true and  CheckAcceptQuest( Player, 424229 ) ~= true or --檢查有無任務
		CheckID(Player)~=true or
		kg_GetDis(Player,Npc1  )>240 then --檢查是否超過檢查範圍
			CancelBuff( Player, 509854 );
			CancelBuff( Player , 503977 );
			break
		end
		Sleep(20);
	end
	WriteRoleValue(NPC,EM_RoleValue_Register10,0);
	DelObj(Npc1); DelObj(Npc2); DelObj(OwnerID());
end