function LuaS_118387_1()
	local Player = OwnerID();
	local NPC = TargetID();
	local StepCheck = ReadRoleValue(NPC,EM_RoleValue_Register10)--0: 還沒開始進入循環 ,1:10秒內,2:表演中
	local PlayerMax = ReadRoleValue(NPC,EM_RoleValue_Register9)--有在表演中的人數
	if CheckAcceptQuest( Player, 424287 )==true and StepCheck~=2 and CheckFlag( Player,545065 )~=true  then
		LoadQuestOption(Player);
		AddSpeakOption( Player, NPC, "[SC_424287_1]", "LuaS_118387_2",0 ) --啊，我看到他們了。
	elseif CheckAcceptQuest( Player, 424287 )==true and StepCheck==2 and CheckFlag( Player,545065 )~=true then
		SetSpeakDetail( Player , "[SC_424287_3]" );
		CancelBuff( Player,509736 );
	else
		LoadQuestOption(Player);
	end
end

function LuaS_118387_2()--觸發10秒後表演劇情
	local Player = OwnerID();
	local NPC = TargetID();
	if ReadRoleValue(NPC,EM_RoleValue_Register10)==0 then
		WriteRoleValue(NPC,EM_RoleValue_Register10,1)
		WriteRoleValue(NPC,EM_RoleValue_Register6,Player)--記住開場的玩家
		CallPlot(NPC,"LuaS_118387_ShowTime",NPC )
	end
	if ReadRoleValue(NPC,EM_RoleValue_Register10)<2 then
		CancelBuff(Player,620146);--取消計時Buff
	end
	AddBuff(Player,509736,0,-1)
	CloseSpeak(Player)
	ScriptMessage(NPC,Player,2,"[SC_424287_MESSAGE_01]","0xffff0000" )--請站到[118387]的面前等候雙方代表出現。
	ScriptMessage(NPC,Player,0,"[SC_424287_2]","0xffffffff")--[118349]對你說：稍等一下，他們正在走過來。
end

function LuaQ_424287_ShowEndMessage( NPC )
	WriteRoleValue(NPC,EM_RoleValue_Register6,0);
	WriteRoleValue(NPC,EM_RoleValue_Register10,0);
	local PlayerArray = SearchRangePlayer( NPC,200 );
	for i=0,#PlayerArray-1 do
		CancelBuff( PlayerArray[i],620146 );--取消計時Buff
		if CheckAcceptQuest( PlayerArray[i], 424287 )==true and CheckFlag(PlayerArray[i],545065)~=true then
			if kg_GetDis(NPC,PlayerArray[i])<=140 then
				ScriptMessage(NPC,PlayerArray[i],0,"[SC_424287_4]","0xffffffff")--[118387]對你說：我看到他們囉，快過來。
			else
				ScriptMessage(NPC,PlayerArray[i],2,"[SC_424287_5]","0xffff0000" )--[118349]看到各國代表了，請你回去找他。
			end
		end
	end
end

function LuaQ_424287_CheckPlayer( NPC , Bucket )
	DebugMsg(0,0,"LuaQ_424287_CheckPlayer Start");
	local PlayerArray = Lua_Zone20_424287_QuestObj.PlayerArray;
	local PlayerCount = table.getn( PlayerArray );
	local CurrentCount = 0;
	while 1 do
		CurrentCount = 0;
		for i in pairs(PlayerArray) do
			if CheckID(PlayerArray[i]) == true and  CheckAcceptQuest( PlayerArray[i], 424287 ) ~= true or --檢查有無任務
			CheckID(PlayerArray[i]) ~= true or
			CheckFlag( PlayerArray[i],545065 )==true or
			CheckBuff(PlayerArray[i],509736)~=true then
				CurrentCount = CurrentCount+1;
				CancelBuff(PlayerArray[i],509824);--拍手buff
				CancelBuff(PlayerArray[i],503977);--乖乖看戲
				CancelBuff(PlayerArray[i],506098);--FadeIn FadeOut
				CancelBuff(PlayerArray[i],509736);--看表演判定buff
			end;
		end;
		if CurrentCount>=PlayerCount then
			DebugMsg( 0,0," 424287_Show break" );
			break;
		end;
		Sleep(20);
	end;
	PlayerArray = Lua_Zone20_424287_QuestObj.Obj;	--刪除演戲NPC
	for i in pairs(PlayerArray) do
		DelObj(PlayerArray[i]);
	end
	Lua_Zone20_424287_QuestObj=nil;
	Sleep(10);
	LuaQ_424287_ShowEndMessage( NPC );
	DebugMsg(0,0,"LuaQ_424287_CheckPlayer End");
end

function LuaS_118387_ShowTime( NPC )--NPC進入劇情倒數
	local RoomID = ReadRoleValue(NPC,EM_RoleValue_RoomID);
	local Bucket=OwnerID();
	if ReadRoleValue( Bucket , EM_RoleValue_OrgID )~=117201 then
		Lua_Zone20_424287_QuestObj={ Obj={},PlayerArray={} };
		local Bucket = kg_GetPosRX( NPC,117201,200,1);
		table.insert( Lua_Zone20_424287_QuestObj.Obj , Bucket );
		kg_InvisibleObjInit(Bucket);
		AddToPartition( Bucket,0 );
		CallPlot(Bucket,"LuaS_118387_ShowTime",NPC);
		return
	end
	
	Sleep(100);
	WriteRoleValue(NPC,EM_RoleValue_Register10,2)
	--Say(NPC,"Show Time!!")
	local FlagID = 780948;
	local TempArray = SearchRangePlayer( NPC,100 );
	local PlayerArray = {};
	if table.getn( TempArray )~=0 then
		for i=0,#TempArray-1 do
			CancelBuff(TempArray[i],620146);--取消計時Buff
			if kg_CheckTargetBack( TempArray[i],NPC,90,270 )==0 and CheckAcceptQuest( TempArray[i], 424287 )== true  then
				table.insert( PlayerArray ,TempArray[i]  );
			end;
		end;
	elseif table.getn( TempArray )==0 then
		PlayerArray=TempArray;
	end;
	--假如沒有任何玩家在範圍內的處理
	if table.getn( PlayerArray )==0 then
		Sleep(10);
		LuaQ_424287_ShowEndMessage( NPC );
		DelObj(Bucket);
		DebugMsg( 0,0," 424287_Show break" );
		return
	end;
	Lua_Zone20_424287_QuestObj.PlayerArray=PlayerArray;
	for i in pairs(PlayerArray) do
		if CheckID(PlayerArray[i])==true and 
		CheckAcceptQuest( PlayerArray[i], 424287 )==true and
		CheckBuff(PlayerArray[i],509736)==true then
			--Say(PlayerArray[i],"yo")
			AddBuff(PlayerArray[i] ,506098,0,-1)--FadeIn FadeOut
			AddBuff(PlayerArray[i],503977,0,-1)--乖乖看戲
		end
	end
	Sleep(15)--等待淡入
	--提醒未進入的玩家
	NPCSay( NPC , "[SC_424287_31]" );--哎呀，看錯了吧，再等一等吧！
	TempArray = SearchRangePlayer( NPC,200 );
	for i=0,#TempArray-1 do
		if CheckID(TempArray[i])==true and 
		CheckAcceptQuest( TempArray[i], 424287 )==true and
		CheckBuff(TempArray[i],509736)==true and
		CheckBuff(TempArray[i],503977)~=true then
			--Say(TempArray[i],"oh no~");
			AddBuff( TempArray[i],620146,0,112 );
			ScriptMessage(NPC,TempArray[i],2,"[SC_424287_MESSAGE_02]","0xffff0000" )--請再一次與[118387]談話後，移駕到他的面前。
		end
	end
	--產生物件與設定玩家位置
	local ActorNPC={	{118349},	--使節A	1
				{118378},	--使節B	2
				{118379},	--矮人A	3
				{118380},	--矮人B	4
				{118381},	--矮人C	5
				{118382},	--犀牛人A	6
				{118383},	--犀牛人B	7
				{118384},	--犀牛人C	8
				{118385},	--阿克‧凱因斯	9
				{118386}	--犀牛人貴族	10
				};
				
	--產生演員
	local MainActorDis = ReadRoleValue(NPC,EM_RoleValue_PID );	--主要腳色 (矮人A，犀牛人A) 與旗標的初始距離
	local SubActorDis = 30;		--跟班的與主角的距離(B,C)
	local x,y,z,d;
	ActorNPC[1][2]=kg_GetPosRX({FlagID,0},ActorNPC[1][1],20,0,90,-3);--使節A
	LuaS_118387_ActorInit( ActorNPC[1][2] )
	ActorNPC[2][2]=kg_GetPosRX({FlagID,0},ActorNPC[2][1],20,0,-90,-3);--使節B
	LuaS_118387_ActorInit( ActorNPC[2][2] )
	x,y,z,d=kg_GetPosRX({FlagID,1},nil, MainActorDis ,0,90,-1);--矮人A
	ActorNPC[3][2] = CreateObj( ActorNPC[3][1] ,x,y,z,d,1)
	ActorNPC[3][3]={x,y,z,d}
	LuaS_118387_ActorInit( ActorNPC[3][2] )
	x,y,z,d=kg_GetPosRX( ActorNPC[3][2] ,nil,SubActorDis,0,90,-3 );--矮人B
	ActorNPC[4][2]=CreateObj( ActorNPC[4][1] ,x,y,z,d,1)
	ActorNPC[4][3]={x,y,z,d}
	LuaS_118387_ActorInit( ActorNPC[4][2] )
	x,y,z,d=kg_GetPosRX( ActorNPC[3][2] , nil ,SubActorDis,0,-90,-3 );--矮人C
	ActorNPC[5][2]=CreateObj( ActorNPC[5][1] ,x,y,z,d,1)
	ActorNPC[5][3]={x,y,z,d}
	LuaS_118387_ActorInit( ActorNPC[5][2] )
	x,y,z,d=kg_GetPosRX( {FlagID,1} , nil , MainActorDis ,0,-90,-1 );--犀牛人A
	ActorNPC[6][2]=CreateObj( ActorNPC[6][1] ,x,y,z,d,1)
	ActorNPC[6][3]={x,y,z,d}
	LuaS_118387_ActorInit( ActorNPC[6][2] )
	x,y,z,d=kg_GetPosRX( ActorNPC[6][2] , nil ,SubActorDis,0,90,-3 );--犀牛人B
	ActorNPC[7][2]=CreateObj( ActorNPC[7][1] ,x,y,z,d,1)
	ActorNPC[7][3]={x,y,z,d}
	LuaS_118387_ActorInit( ActorNPC[7][2] )
	x,y,z,d=kg_GetPosRX( ActorNPC[6][2] , nil ,SubActorDis,0,-90,-3 );--犀牛人C
	ActorNPC[8][2]=CreateObj( ActorNPC[8][1] ,x,y,z,d,1)
	ActorNPC[8][3]={x,y,z,d}
	LuaS_118387_ActorInit( ActorNPC[8][2] )
	x,y,z,d=kg_GetPosRX( ActorNPC[1][2] ,nil,30,0,135,-3 );--阿克
	ActorNPC[9][2]=CreateObj( ActorNPC[9][1] ,x,y,z,d,1)
	ActorNPC[9][3]={x,y,z,d}
	WriteRoleValue(ActorNPC[9][2],EM_RoleValue_IsWalk,0)
	LuaS_118387_ActorInit( ActorNPC[9][2] )
	
	--物件產生完之後就讓玩家看的到
	for i in pairs(PlayerArray) do
		CancelBuff(PlayerArray[i],506098)--FadeIn FadeOut
	end
	CallPlot( NPC , "LuaQ_424287_CheckPlayer" , NPC,Bucket )--循環劇情判斷
	Sleep(20)--等待淡出
	
	--開始對話
	PlayMotion( ActorNPC[1][2],ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Yell( ActorNPC[1][2], "[SC_424287_6][$SETVAR1="..GetName(ReadRoleValue(NPC,EM_RoleValue_Register6)).."]",3)--我們先前幫特使大人[$playername]送出的書信內容雙方應該都看過了，我們就不贅述細節。
	Sleep(40)
	PlayMotion( ActorNPC[2][2],ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Yell( ActorNPC[2][2],"[SC_424287_7]",3 )--無論如何，既然這是他人陰謀所挑起的誤會，那今天我們希望各位能以和為貴，停止戰爭...
	Sleep(40)
	PlayMotion( ActorNPC[3][2] , ruFUSION_ACTORSTATE_EMOTE_ANGRY )--矮人在玩家前面,他很生氣
	Yell( ActorNPC[3][2],"[SC_424287_8]",3 )--喂！這樣跟死牛頭之間的帳怎麼算！死牛頭殺了我們這麼多人可是事實啊！
	Sleep(40)
	PlayMotion( ActorNPC[7][2] , ruFUSION_ACTORSTATE_EMOTE_ANGRY )--犀牛人在玩家前面,他很生氣
	Yell( ActorNPC[7][2], "[SC_424287_9]",3 )--半殘人還敢說，我們多少弟兄死在你們手上，這筆帳就算殺了半殘人領主也還不清！
	Sleep(40)
	SetDefIdleMotion( ActorNPC[3][2], ruFUSION_MIME_IDLE_COMBAT_1H )
	Yell( ActorNPC[3][2] ,"[SC_424287_10]",3 )--該死的畜生！嘴巴放乾淨點！
	Sleep(25)
	SetDefIdleMotion( ActorNPC[7][2], ruFUSION_MIME_IDLE_COMBAT_1H )
	Yell(ActorNPC[7][2] , "[SC_424287_11]" ,3)--可惡！我族才不是畜生！我們是撼地王的後裔！信不信我一腳踩扁你！
	Sleep(35)
	SetDefIdleMotion( ActorNPC[4][2], ruFUSION_MIME_IDLE_COMBAT_1H )
	SetDefIdleMotion( ActorNPC[5][2], ruFUSION_MIME_IDLE_COMBAT_1H )
	SetDefIdleMotion( ActorNPC[6][2], ruFUSION_MIME_IDLE_COMBAT_1H )
	SetDefIdleMotion( ActorNPC[8][2], ruFUSION_MIME_IDLE_COMBAT_1H )
	x,y,z,_=kg_GetPosRX({FlagID,1},nil,10,0,90);
	MoveDirect( ActorNPC[3][2] , x,y,z )
	x,y,z,_=kg_GetPosRX({FlagID,1},nil,10,0,-90);
	MoveDirect( ActorNPC[7][2] , x,y,z )
	x,y,z,_=kg_GetPosRX({FlagID,1});
	Yell(ActorNPC[3][2] , "[SC_424287_12]",3)--啥！找死！
	Yell(ActorNPC[7][2] , "[SC_424287_13]",3)--吼！死吧！
	while 1 do
		--DebugMsg(0,0,kg_GetDis( ActorNPC[3][2],x,y,z).." , "..kg_GetDis( ActorNPC[7][2],x,y,z));
		if kg_GetDis( ActorNPC[3][2],x,y,z)<=16 and kg_GetDis( ActorNPC[7][2],x,y,z)<=16 then
			break
		end
		Sleep(10)
	end
	
	--Sleep(30)
	SetDefIdleMotion( ActorNPC[3][2], ruFUSION_MIME_IDLE_COMBAT_1H )--PlayMotion( ActorNPC[3][2] , ruFUSION_ACTORSTATE_ATTACK_1H )
	Yell(ActorNPC[3][2] , "[SC_424287_14]",3)--賭上火靴將軍的名譽，讓你付出代價！
	Sleep(5)
	SetDefIdleMotion( ActorNPC[7][2], ruFUSION_MIME_IDLE_COMBAT_1H )--PlayMotion( ActorNPC[7][2] , ruFUSION_ACTORSTATE_ATTACK_1H )
	Yell(ActorNPC[7][2] , "[SC_424287_15]",3)--為你的無禮，用鮮血賠罪！
	Sleep(5)
	CallPlot( ActorNPC[3][2],"LuaS_118387_ActorBattle",ActorNPC[3][2],ActorNPC[7][2] )--互毆
	
	--阿克表演
	x,y,z,_= kg_GetPosRX( {FlagID,1},nil,35,0,160 )--找出旗標1左邊的大概位置
	WriteRoleValue(ActorNPC[9][2],EM_RoleValue_IsWalk,0)
	MoveDirect( ActorNPC[9][2] , x,y,z )--move是先把位置抓到那個點,再用client演出,故直接用move抓距離不准
	Sleep(10)
	Yell(ActorNPC[9][2] , "[SC_424287_16]",3)--別這樣！冷靜點！
	while 1 do
		--DebugMsg( 0,0,"Dis="..kg_GetDis( ActorNPC[9][2],x,y,z ) )
		if kg_GetDis( ActorNPC[9][2],x,y,z )<=15 then
			StopMove( ActorNPC[9][2],true )
			WriteRoleValue(ActorNPC[9][2],EM_RoleValue_IsWalk,1)
			--DebugMsg(0,0,"Actor92 break")
			break
		end
		Sleep(10)
	end
	
	--犀牛人貴族表演
	ActorNPC[10][2]=kg_GetPosRX( ActorNPC[2][2] ,ActorNPC[10][1],50,0,-135,-3 );--貴族,在使節B左手邊
	WriteRoleValue( ActorNPC[10][2],EM_RoleValue_IsWalk,0 )
	LuaS_118387_ActorInit( ActorNPC[10][2] )
	x,y,z,_= kg_GetPosRX( {FlagID,1},nil,35,0,-150 )
	Hide(ActorNPC[10][2])
	SetModeEx(ActorNPC[10][2],EM_SetModeType_Show,false )
	WriteRoleValue( ActorNPC[10][2],EM_RoleValue_IsWalk,0 )
	Show( ActorNPC[10][2] , 0 )
	MoveDirect( ActorNPC[10][2] , x,y,z )
	Sleep(10)
	Yell( ActorNPC[10][2] , "[SC_424287_17]" ,3)--你們先不要吵，聽我一言！
	WriteRoleValue(ActorNPC[3][2],EM_RoleValue_Register10,1)--停止互毆
	while 1 do
		if kg_GetDis( ActorNPC[10][2],x,y,z )<=20 then
			StopMove( ActorNPC[10][2],true )
			--DebugMsg(0,0,"Actor102 break"  )
			break
		end
		Sleep(10)
	end
	SetDefIdleMotion(ActorNPC[7][2],ruFUSION_MIME_IDLE_STAND )
	SetDefIdleMotion(ActorNPC[3][2],ruFUSION_MIME_IDLE_STAND )
	AdjustFaceDir( ActorNPC[7][2] , ActorNPC[10][2] ,0 )
	AdjustFaceDir( ActorNPC[3][2] , ActorNPC[10][2] ,0 )
	--Sleep(15)
	PlayMotion( ActorNPC[10][2],ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Yell( ActorNPC[10][2] , "[SC_424287_18]" ,3 )--大家冷靜一點，其實我們都被仇恨給蒙蔽了！
	Sleep(30)
	PlayMotion( ActorNPC[10][2],ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Yell( ActorNPC[10][2] , "[SC_424287_19]",3  )--這場戰爭是人為操作之下所造成的，我族跟[SC_ZONE20_01]都只是被利用了。
	Sleep(35)
	PlayMotion( ActorNPC[10][2],ruFUSION_ACTORSTATE_EMOTE_POINT )
	Yell( ActorNPC[10][2] , "[SC_424287_32]"  ,3)--你們看，這份是我好不容易取得的，有薩爾多領主親印的文件！
	Sleep(35);
	PlayMotion( ActorNPC[10][2],ruFUSION_ACTORSTATE_EMOTE_SPEAK );
	Yell( ActorNPC[10][2] , "[SC_424287_33]",3  );--這文件是要我國的[118310]配合前往竊取貴國的聖斧颶風，殺死我國少主，我個人也被其抓走，差點死於非命！我們都是這陰謀的受害者！
	Sleep(45);
	PlayMotion( ActorNPC[10][2],ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Yell( ActorNPC[10][2] , "[SC_424287_20]" ,3 )--我被抓走的這段期間，甚至親眼目睹他們復活死掉的屍體藉以奴役，還嘲笑我們只是易於操弄的愚民！
	Sleep(40)
	PlayMotion( ActorNPC[10][2],ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Yell( ActorNPC[10][2] , "[SC_424287_21]",3  )--真正的敵人是薩爾多堡！火靴朋友們，族人們，你們還想繼續打嗎？
	AdjustFaceDir( ActorNPC[10][2] , ActorNPC[3][2] ,0 )--貴族轉向
	Sleep(20);
	AdjustFaceDir( ActorNPC[10][2] , ActorNPC[7][2] ,0 )--貴族轉向
	Sleep(20);
	
	PlayMotion( ActorNPC[7][2],ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Yell( ActorNPC[7][2] , "[SC_424287_22]",3 )--這...[118311]大人說的話，絕對是沒有問題，可惡！實在是恨不得將那些人嵌進城牆裡。
	Sleep(35)
	PlayMotion( ActorNPC[3][2],ruFUSION_ACTORSTATE_EMOTE_ANGRY )
	Yell( ActorNPC[3][2] , "[SC_424287_23]",3 )--特使給的信裡也這麼說，如果這是真的，實在是可惡至極啊！
	SetDefIdleMotion(ActorNPC[4][2],ruFUSION_MIME_IDLE_STAND )
	SetDefIdleMotion(ActorNPC[5][2],ruFUSION_MIME_IDLE_STAND )
	SetDefIdleMotion(ActorNPC[7][2],ruFUSION_MIME_IDLE_STAND )
	SetDefIdleMotion(ActorNPC[8][2],ruFUSION_MIME_IDLE_STAND )
	Sleep(30)
	PlayMotion( ActorNPC[5][2],ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Yell( ActorNPC[9][2] , "[SC_424287_24]",3 )--仇恨我懂，但繼續打下去也沒好處啊！你們就算在這兒打死對方，那又能改變些什麼啊？！
	Sleep(35)
	PlayMotion( ActorNPC[2][2],ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Yell( ActorNPC[2][2] , "[SC_424287_34]",3 )--你們繼續打下去，死去的同伴不會回來，此地的靈魂不會安息，未來更只會流更多血，失去更多夥伴的！
	Sleep(35)
	PlayMotion( ActorNPC[1][2],ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Yell( ActorNPC[1][2] , "[SC_424287_35]" ,3)--諸君，收起互相毆打的手，也放下互相攻伐的矛吧！我們還有改變與彌補的機會呀！
	Sleep(40)
	AdjustFaceDir( ActorNPC[3][2] , ActorNPC[5][2] ,0 )
	AdjustFaceDir( ActorNPC[7][2] , ActorNPC[7][2] ,0 )
	Sleep(15)
	AdjustFaceDir( ActorNPC[3][2] , ActorNPC[4][2] ,0 )
	AdjustFaceDir( ActorNPC[7][2] , ActorNPC[8][2] ,0 )
	Sleep(15)
	AdjustFaceDir(ActorNPC[7][2],ActorNPC[3][2],0)--犀牛人A看向矮人A
	AdjustFaceDir(ActorNPC[3][2],ActorNPC[7][2],0)--矮人A看向犀牛人A
	Sleep(20)
	PlayMotion( ActorNPC[7][2] , ruFUSION_ACTORSTATE_EMOTE_THINK )--抓頭...!?
	Yell( ActorNPC[7][2], "[SC_424287_26]" ,3)--如果跟使節與特使大人說的一樣，那我可以不再對半...[SC_ZONE20_01]動手......
	Sleep(35)
	PlayMotion( ActorNPC[3][2] , ruFUSION_ACTORSTATE_EMOTE_ANGRY );--頓足
	Yell( ActorNPC[3][2] , "[SC_424287_27]",3 )--我也不是笨蛋！既然知道是第三者的陰謀，豈有繼續打下去的道理！
	Sleep(30)
	PlayMotion( ActorNPC[4][2],ruFUSION_ACTORSTATE_EMOTE_SPEAK );
	Yell( ActorNPC[4][2] , "[SC_424287_36]",3 );--我和將軍本就是承領主的停戰之意而來，只是不知道喀洛恩方是怎麼想的?
	Sleep(35);
	PlayMotion( ActorNPC[6][2],ruFUSION_ACTORSTATE_EMOTE_SPEAK );
	Yell( ActorNPC[6][2] , "[SC_424287_37]",3 );--既然這是場被擺佈的戰爭，我們就沒有打的理由了！真是為死去的族人感到不值啊！為了避免更多的犧牲，我們就停戰吧！
	Sleep(40);
	
	for i in pairs(PlayerArray) do
		AddBuff( PlayerArray[i] , 509824,0,-1 )--拍手buff
		ScriptMessage(PlayerArray[i],PlayerArray[i],2,"[SC_424287_30]","0xffff0000" )--周遭響起一片掌聲...
	end
	for i=1,8 do
		if i~=3 and i~=6 then
			PlayMotion( ActorNPC[i][2] , ruFUSION_ACTORSTATE_EMOTE_APPLAUSE )
			Sleep( math.random(3,10) )
		end
	end
	for i=1,8 do
		PlayMotion( ActorNPC[i][2] , ruFUSION_ACTORSTATE_EMOTE_APPLAUSE )
	end
	Sleep(20)
	PlayMotion( ActorNPC[7][2] , ruFUSION_MIME_EMOTE_ANGRY )
	Yell( ActorNPC[7][2] ,"[SC_424287_28]",3  )--現在的敵人看起來是薩爾多堡的渾帳們！或許我們該再討論如何跟他們要個解釋！
	Sleep(35)
	PlayMotion( ActorNPC[3][2] , ruFUSION_MIME_EMOTE_ANGRY )
	Yell( ActorNPC[3][2] ,"[SC_424287_29]",3  )--不給解釋就把他們拖出來打！我們先回去稟報了，此前的帳，暫時先改記在他們頭上吧！
	Sleep(35)
	AdjustDir( ActorNPC[3][2],180 )
	AdjustDir( ActorNPC[7][2],180 )
	Sleep(15)
	for i=3,9 do
		move( ActorNPC[i][2], ActorNPC[i][3][1], ActorNPC[i][3][2] , ActorNPC[i][3][3] )
	end
	Sleep(10)
	
	--演戲結束,玩家淡入
	for i in pairs(PlayerArray) do
		AddBuff(PlayerArray[i] ,506098,0,-1)--FadeIn FadeOut
	end
	Sleep(10)--等待淡入
	--刪除表演NPC
	for i in pairs(ActorNPC) do
		if ActorNPC[i][2]~=nil then
			DelObj(ActorNPC[i][2])
			ActorNPC[i][2]=nil
		end
	end
	Sleep(20)--等待Client延遲
	--給予玩家獎勵與清buff
	for i in pairs(PlayerArray) do
		if CheckAcceptQuest( PlayerArray[i], 424287 )==true and CheckBuff( PlayerArray[i] , 509736 )==true and CheckBuff( PlayerArray[i] , 503977 )==true then
			SetFlag( PlayerArray[i],545065,1 )--給旗標
		end
		CancelBuff(PlayerArray[i],509824)--拍手buff
		CancelBuff(PlayerArray[i],503977)--乖乖看戲
		CancelBuff(PlayerArray[i],506098)--FadeIn FadeOut
		CancelBuff(PlayerArray[i],509736)--看表演判定buff
	end
	DelObj(Bucket)
	--Say(NPC,"End...")
end

function LuaS_118387_ActorBattle( Actor1 , Actor2 )--演員互毆
	DebugMsg(0,0,"ActorBattle Start")
	while 1 do
		if ReadRoleValue(Actor1,EM_RoleValue_Register10)==0 then
			PlayMotion( Actor1 , ruFUSION_ACTORSTATE_ATTACK_1H )
		else
			DebugMsg(0,0,"ActorBattle End")
			break
		end
		Sleep(10)
		PlayMotion( Actor2 , ruFUSION_ACTORSTATE_ATTACK_1H )
	end
end

function LuaS_118387_ActorInit( Actor )--產生演員
	table.insert( Lua_Zone20_424287_QuestObj.Obj , Actor );
	MoveToFlagEnabled( Actor, false )
	WriteRoleValue( Actor, EM_RoleValue_IsWalk, 1 )--走路
	SetModeEx( Actor , EM_SetModeType_Strikback , false )	-- 反擊
	SetModeEx( Actor , EM_SetModeType_Fight, false )		-- 可砍殺攻擊
	SetModeEx( Actor , EM_SetModeType_Searchenemy , false )	-- 索敵
	SetModeEx( Actor , EM_SetModeType_Mark , false )	-- 標記
	SetModeEx( Actor , EM_SetModeType_HideName , false )
	SetModeEx( Actor , EM_SetModeType_ShowRoleHead , false )-- 頭像框
	SetModeEx( Actor , EM_SetModeType_NotShowHPMP , true )	-- 不顯示血條
	AddToPartition(Actor,0)
end

function LuaS_118387_PlayerApplause()--玩家按了會鼓掌
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_APPLAUSE )
	return true
end

function LuaS_118387_PlayerVictory()--玩家按了會歡呼
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_VICTORY )
	return true
end