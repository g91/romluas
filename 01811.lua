------------------------------------------裡線任務NO.1（摩瑞克身上的對話劇情）
function LuaS_423176()	
	LoadQuestOption( OwnerID() )				
	if	CheckAcceptQuest( OwnerID() ,423176 ) == true	then
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_423176_0]" , "LuaS_423176_1", 0 )		--我準備好了！一起前往傑諾斯塔森林吧！
	end
end

function LuaS_423176_1()	

	CloseSpeak( OwnerID() )	
	if	ChangeZone( OwnerID() , 16 , 0 , -9298.7, -454.7 , 18009.5 , 227.4 )	then	
		SetFlag(OwnerID() , 543918 , 1 )
	end
end

function LuaS_423176_Complete()	
	AddBuff( TargetID() , 506613 , 1 , -1 )	--要加在玩家身上的BUFF
	DisableQuest( OwnerID() ,true )
	local Kid = Lua_DW_CreateObj("flag" , 115058 ,780592 , 2 )		--種出死人馬
	WriteRoleValue(Kid , EM_RoleValue_IsWalk, 0 )
	Hide( Kid )
	Show( Kid ,0)
	DisableQuest( Kid ,true )
	MoveToFlagEnabled( Kid , false )
	LuaFunc_MoveToFlag( Kid , 780592 , 3 ,  0 )	
	Say( Kid , "[SC_423176_1]")						--嗯～是摩瑞克耶～是摩瑞克耶～還有一名......看起來好陌生的冒險者？
	PlayMotion( Kid , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	Say( Kid , "[SC_423176_2]")						--對了！摩瑞克，一起過來嗎？阿爾特正在前方不遠的地方，你要不要一起過來呢。
	sleep(30)
	Say( Kid , "[SC_423176_3]")						--阿爾特看見你，一定會很開心。
	PlayMotion( Kid , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(20)
	Delobj( Kid )
	CancelBuff( TargetID() , 506613)	--刪除玩家身上的BUFF 
	DisableQuest(OwnerID() ,false )
end

---------------------------------------裡線任務NO.2(摩瑞克115060身上的對話劇情)--護送co這個
function LuaS_423177()	
	LoadQuestOption( OwnerID() )				
	if	CheckAcceptQuest( OwnerID() ,423177 ) == true	then
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_423177_0]" , "LuaS_423177_CHECK", 0 )		--我準備好了！
	end
end

function LuaS_423177_CHECK()	
	local Player=OwnerID();
	CloseSpeak(Player);
	BeginPlot(Player,"LuaRB_423177_AfterSpeak",0);
--[[舊版內容
	if	ReadRoleValue( TargetID() ,EM_RoleValue_PID ) == 0	then
		writerolevalue( TargetID() , EM_RoleValue_PID , 1 )
		BeginPlot( TargetID() , "LuaS_423177_1" , 0 )
		CloseSpeak( OwnerID() )
	else
		SetSpeakDetail(OwnerID(),"[SC_423177_1]")			--等等，我似乎感受到了一些元素之力。
	end--]]
end
function LuaRB_423177_AfterSpeak()--對下對話選項之後, 把玩家傳過去，給他完成旗標，搞定(一個function就把它搞定) 回修不得超過5.0.3
	local Player=OwnerID();
	local FadePlayerWithBlack=620001
	AddBuff(Player,FadePlayerWithBlack,0,4);
	sleep(10);
	SetPos(Player,-9076,-380,18779,289);
	SetDir(Player,289);
	SetFlag(Player,543919,1);
	local x,y,z,dir=DW_Location(780601,3);
	local NewCentaur=CreateObj(115063,x,y,z,dir,1);
	AddToPartition(NewCentaur,ReadRoleValue(Player,EM_RoleValue_RoomID));
	Say(NewCentaur,"[SC_423177_8]");
	SetFlag(Player,543920,1);
	CancelBuff_NoEvent(Player,FadePlayerWithBlack);
end
function LuaS_423177_1()	
	local Party = {}
	local Party = LuaFunc_PartyData(TargetID())
	for i = 1 , Party[0] , 1 do
		if 	CheckAcceptQuest( Party[i] , 423177 ) == true		and
			GetDistance(Party[i] , OwnerID() ) < 150			and 
			ReadRoleValue(Party[i] ,EM_RoleValue_IsDead) == 0	then
			SetFlag(Party[i] , 543919 , 1 )	
			AddBuff(Party[i] , 506614 , 100 , -1 )  
		end
	end
	local Morrok = LuaFunc_CreateObjByOBj( 115062, OwnerID() )			--出現演戲的摩瑞克
	DisableQuest( Morrok ,true )
	WriteRoleValue ( Morrok , EM_RoleValue_PID, OwnerID() )

	BeginPlot( Morrok , "LuaS_423177_Range_CHECK" , 0 )
	BeginPlot( Morrok , "LuaS_423177_2" , 0 )
end

function LuaS_423177_2()		--主要劇情	
	local OMorrok = ReadRoleValue(OwnerID(),EM_RoleValue_PID)	
	local OKid = LuaFunc_SearchNPCbyOrgID( OwnerID() , 115059 , 400 )		--（搜尋場上的西里特）
	local Kid = LuaFunc_CreateObjByOBj( 115061, OKid )				--出現演戲的西里特
	DisableQuest( Kid ,true )
	WriteRoleValue ( Kid , EM_RoleValue_PID, OwnerID() )
	BeginPlot( Kid , "LuaS_423177_Kid_CHECK" , 0 )

	MoveToFlagEnabled( OwnerID() , false )
	MoveToFlagEnabled( Kid , false )
	LuaFunc_MoveToFlag( Kid , 780601 , 1 ,  0 )
	sleep(10)
	AdjustFaceDir( Kid , OwnerID(), 0 )
	sleep(10)
	PlayMotion( Kid , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Yell( Kid , "[SC_423177_2]" , 3 ) 				--走吧！ 走吧！ 摩瑞克！
	sleep(20)
	Yell( OwnerID() , "[SC_423177_3]" , 3 ) 			--西里特‧耀芒，接下來就麻煩你帶我們到達隆克所在的地方。
	AdjustFaceDir( OwnerID() , Kid, 0 )
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(20)
	Yell( Kid , "[SC_423177_4]" , 3 )				--好～ 
	BeginPlot( Kid , "LuaS_423177_Kid_go" , 0 )
	LuaFunc_MoveToFlag( OwnerID() , 780601 , 2 ,  0 )		--感應產生阿爾特
	BeginPlot( OwnerID() , "LuaS_423177_Art" , 0 )
	LuaFunc_MoveToFlag( OwnerID() , 780601 , 4 ,  0 )
	local Art = ReadRoleValue(OwnerID(),EM_RoleValue_Register)
	
	sleep(20)
	Yell( Art , "[SC_423177_7]" , 3 ) 				--呵～這一切都是星輝的指引啊～尤其是這位遠道而來的新朋友～
	sleep(30)
	PlayMotion( Art , ruFUSION_ACTORSTATE_EMOTE_THINK ) 
	Yell( Art , "[SC_423177_8]" , 3 ) 				--真是恰巧啊～我得意的弟子剛好送酒過來！你們一定要品嘗看看這個美酒！既美味又順口～
	sleep(30)
	PlayMotion( Art ,  ruFUSION_ACTORSTATE_EMOTE_LAUGH)
	Yell( Art , "[SC_423177_9]" , 3 ) 				--西里特‧耀芒，去叫艾爾特‧晨星也一起過來。
	PlayMotion( Art , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	BeginPlot( OwnerID() , "LuaS_423177_Finish" , 0 )
	sleep(10)
	Delobj( Art )
	Delobj( Kid )
	writerolevalue( OMorrok , EM_RoleValue_PID , 0 )
	Delobj( OwnerID() )
end

function LuaS_423177_Range_CHECK()
	local OMorrok = ReadRoleValue(OwnerID(),EM_RoleValue_PID)	
	local Group = {}
	local Num
	for i = 0 , 100 , 1 do
		Group = SearchRangePlayer(OwnerID() , 250)
		Num = 0
		for i=0,table.getn(Group)-1 do
			if	CheckAcceptQuest( Group[i], 423177 ) == true	and
				CheckFlag( Group[i] , 543919 ) == true		then
				Num = Num + 1
			end
		end
		if	Num == 0		then
			break
		end
		sleep(20)
	end
	writerolevalue( OMorrok , EM_RoleValue_PID , 0 )
	Delobj( OwnerID() )
end

function LuaS_423177_Player_CHECK()
	local ET = {}
	ET = SearchRangeNPC(OwnerID() , 250)
	for i=0,table.getn(ET)-1 do
		if	ReadRoleValue(ET[i] , EM_RoleValue_OrgID) == 115062	then
			return false
		end
		if	i == table.getn(ET)	then
			return true
		end
	end
end

function LuaS_423177_Player_CHECK_FINAL()
	CancelBuff( OwnerID() , 506614 )
	ScriptMessage(OwnerID() , OwnerID() , 2 , "[SC_423177_10]" , 0 )	--距離太遠，任務失敗！
	ScriptMessage( OwnerID() , OwnerID(), 0 , "[SC_423177_10]" , 0 )
	SetFlag(OwnerID() , 543919 , 0 )
end

function LuaS_423177_Finish()
	local Gp = {}
	Gp = SearchRangePlayer(OwnerID() , 250)
	for i=0,table.getn(Gp)-1 do
		if	CheckAcceptQuest( Gp[i], 423177 ) == true	and
			CheckFlag( Gp[i] , 543919 ) == true		then
			SetFlag(Gp[i] , 543920 , 1 )
			CancelBuff( Gp[i] , 506614 )
		end
	end
end

function LuaS_423177_Kid_CHECK()	
	local Morrok = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	for i = 0 , 100 , 1 do
		if	CheckID(Morrok) == false	then
			break
		end
		sleep( 20 )
	end
	Delobj( OwnerID() )
end

function LuaS_423177_Art_CHECK()	
	local Morrok = ReadRoleValue(OwnerID(),EM_RoleValue_Register )
	for i = 0 , 100 , 1 do
		if	CheckID(Morrok) == false	then
			break
		end
		sleep( 20 )
	end
	Delobj( OwnerID() )
end

function LuaS_423177_Kid_go()	
	LuaFunc_MoveToFlag( OwnerID() , 780601 , 15 ,  0 )
	LuaFunc_MoveToFlag( OwnerID() , 780601 , 5 ,  0 )
	Yell( OwnerID() , "[SC_423177_6]" , 3 ) 			--是我在森林遇見他的唷！
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
end

function LuaS_423177_Art()	
	local Art = Lua_DW_CreateObj("flag" , 115063 ,780601 , 3 )
	BeginPlot( Art , "LuaS_423177_Art_CHECK" , 0 )
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register , Art )
	WriteRoleValue ( Art , EM_RoleValue_Register , OwnerID() )
	DisableQuest( Art ,true )
	Yell( Art , "[SC_423177_5]" , 3 ) 			--這不是摩瑞克嗎？好久不見了。
	PlayMotion( Art , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
end

---------------------------------------裡線任務NO.3
function LuaS_423178_Accept()	
	local Art = LuaFunc_SearchNPCbyOrgID( OwnerID() , 115065 , 100 )		--取得原本的阿爾特
	local Morrok = LuaFunc_SearchNPCbyOrgID( OwnerID() , 115067 , 100 )	--取得原本的摩瑞克
	DisableQuest( Art ,true )
	DisableQuest( OwnerID() ,true )
	DisableQuest( Morrok ,true )
	Yell( Morrok , "[SC_423178_1]" , 3 )					--阿爾特，最近這片森林有沒有起什麼變化。
	PlayMotion( Morrok , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	Yell( Art , "[SC_423178_2]" , 3 )					--摩瑞克，你還記得過去我為你占星的結果嗎？
	PlayMotion( Art ,  ruFUSION_ACTORSTATE_EMOTE_POINT )
	sleep(30)
	Yell( Morrok , "[SC_423178_3]" , 3 )					--你是說……
	sleep(30)
	Yell( Art , "[SC_423178_4]" , 3 )					--我當初所訴說的命運，至今依然沒有改變......
	PlayMotion( Art , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	DisableQuest( OwnerID() ,false )
	DisableQuest( Art ,false )
	DisableQuest( Morrok ,false )
end

function LuaS_423178_Complete()	
	AddBuff( TargetID() , 506616 , 1 , -1 )					--要加在玩家身上的BUFF
	local Star = Lua_DW_CreateObj("flag" , 115068 ,780614 , 1 )		--晨星出現
	local OArt = LuaFunc_SearchNPCbyOrgID( OwnerID() , 115065 , 200 )		--（搜尋場上的阿爾特）
	local Art = LuaFunc_CreateObjByOBj( 115069, OArt )				--出現演戲的阿爾特
	DisableQuest( OwnerID() ,true )
	DisableQuest( Art ,true )
	DisableQuest( Star ,true )
	Yell( OwnerID() , "[SC_423178_13]" , 3 )									--要趕快準備一些酒......
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	MoveToFlagEnabled( Star , false )
	LuaFunc_MoveToFlag( Star , 780614 , 2 ,  0 )
	Yell( Star , "[SC_423178_5]" , 3 )					--又見面了！卡爾的貴客～
	PlayMotion( Star ,  ruFUSION_ACTORSTATE_EMOTE_WAVE )
	sleep(30)
	Yell( Art , "[SC_423178_6]" , 3 )					--艾爾特，你們認識？
	PlayMotion( Art , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	Yell( Star , "[SC_423178_7]" , 3 )					--只有指引星象的熟度。
	PlayMotion( Star , ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD  )
	Yell( OwnerID() , "[SC_423178_14]" , 3 )									--這個酒的作法是....
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	Yell( Star , "[SC_423178_8]" , 3 )					--呵～這一次問題是龍與怪物攻擊村莊的傳言？別急著否認，我剛在後面聽見了。
	sleep(30)
	Yell( Star , "[SC_423178_9]" , 3 )					--這麼說來，我的確有在其他的區域聽見相關的傳言...
	PlayMotion( Star , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	Yell( Art , "[SC_423178_10]" , 3 )					--艾爾特，你還知道些什麼？說來聽聽吧？
	Yell( OwnerID() , "[SC_423178_15]" , 3 )									--讓我先仔細想一想....
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	Yell( Star , "[SC_423178_11]" , 3 )					--老師～這一次我可是專程送酒來的，可不是為了其他人解惑之旅。
	PlayMotion( Star , ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD  )
	sleep(30)
	Yell( Art , "[SC_423178_12]" , 3 )					--摩瑞克、新朋友，問題暫且放在一邊吧！
	PlayMotion( Art , ruFUSION_ACTORSTATE_EMOTE_LAUGH )
	sleep(30)
	DisableQuest( OwnerID() ,false )
	Delobj( Art )
	Delobj( Star )
	CancelBuff( TargetID() , 506616)					--刪除玩家身上的BUFF 
end

---------------------------------------裡線任務NO.4(摩瑞克115060身上的對話劇情)
function LuaS_423179_Complete()	
	AddBuff( TargetID() , 506617 , 1 , -1 )						--要加在玩家身上的BUFF
	local Star = LuaFunc_SearchNPCbyOrgID( OwnerID() , 115072 , 200 )		--（搜尋場上的晨星）
	local Morrok = LuaFunc_SearchNPCbyOrgID( OwnerID() , 115073 , 200 )		--（搜尋場上的摩瑞克）

	DisableQuest( OwnerID() ,true )
	DisableQuest( Morrok ,true )
	DisableQuest( Star ,true )
	Yell( OwnerID() , "[SC_423179_1]" , 3 )				--來～摩瑞克，你也過來喝酒。
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	Yell( Morrok , "[SC_423179_2]" , 3 )					--我喝過了。
	PlayMotion(  Morrok , ruFUSION_ACTORSTATE_PARRY_BOW)
	sleep(30)
	Yell( OwnerID() , "[SC_423179_3]" , 3 )				--艾爾特，你也來喝。我最珍貴的弟子。
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	Yell( Star , "[SC_423179_4]" , 3 )					--你醉了，老師。
	PlayMotion( Star , ruFUSION_ACTORSTATE_EMOTE_DRINK )
	sleep(30)
	Yell( OwnerID() , "[SC_423179_5]" , 3 )				--胡說什麼？人馬是不會喝醉的！
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_DODGE )
	sleep(30)
	Yell( Star , "[SC_423179_6]" , 3 )					--呵～老師......每次你這麼說就代表你醉了。
	sleep(30)
	Yell( OwnerID() , "[SC_423179_7]" , 3 )				--我怎麼可能醉！我意識這麼清楚！....
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_AMAZED )
	sleep(30)
	Yell( OwnerID() , "[SC_423179_8]" , 3 )				--我還記得她身上穿的衣服花紋，要不要我數給你聽聽？..
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_LAUGH )
	sleep(30)
	Yell( Star , "[SC_423179_9]" , 3 )					--西里特‧耀芒，我想可以準備艾梅草了～讓他醒醒酒。
	PlayMotion( Star , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	Yell( OwnerID() , "[SC_423179_10]" , 3 )				--艾爾特，我說我根本沒醉！這點酒算得了什麼？
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_LAUGH )
	sleep(30)
	Yell( OwnerID() , "[SC_423179_11]" , 3 )				--哈哈哈～好久沒有這麼放鬆了！
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_LAUGH )
	DisableQuest( OwnerID() ,false )
	DisableQuest( Morrok ,false )
	DisableQuest( Star ,false )
	CancelBuff( TargetID() , 506617)
end

------------------------------------------裡線任務NO.5（阿爾特身上的對話劇情）
function LuaS_423180()	
	LoadQuestOption( OwnerID() )				
	if	CheckAcceptQuest( OwnerID() ,423180 ) == true	then
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_423180_1]" , "LuaS_423180_1", 0 )		--所以？
	end
end

function LuaS_423180_1()	
	SetSpeakDetail(OwnerID(),"[SC_423180_2]")						--哈～星芒的交輝有一定的意義存在......
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_423180_3]" , "LuaS_423180_2", 0 )		--你的意思是？
end

function LuaS_423180_2()	
	SetSpeakDetail(OwnerID(),"[SC_423180_4]")						--嗝～真舒服，讓我們來聊聊其他的如何？......
	SetFlag(OwnerID() , 543921 , 1 )
end

function LuaS_423180_Complete()	
	local MA = Lua_DW_CreateObj("flag" , 115307 ,780615 , 1 )		--種出人馬A
	DisableQuest( MA ,true )
	MoveToFlagEnabled( MA , false )
	MoveToFlagEnabled( OwnerID() , false )
	local Morrok = LuaFunc_SearchNPCbyOrgID( OwnerID() , 115076 , 200 )		--（搜尋場上的摩瑞克）
	DisableQuest( OwnerID() ,true )
	DisableQuest( Morrok ,true )

	LuaFunc_MoveToFlag( MA , 780615 , 2 ,  0 )	
	AdjustFaceDir( MA , OwnerID(), 0 )
	AdjustFaceDir( OwnerID() , MA, 0 )
	Yell( MA , "[SC_423180_5]" , 3 )						--阿爾特，天空又出現奇怪的影子在盤旋。
	PlayMotion( MA , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(20)
	Yell( OwnerID() , "[SC_423180_6]" , 3 )					--嗯，我知道了。
	PlayMotion(  OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_THINK) 
	sleep(30)
	AdjustFaceDir( OwnerID() , Morrok, 0 )
	Yell( Morrok , "[SC_423180_7]" , 3 )						--天空出現奇怪的影子？阿爾特，這是你所說的森林最近的異狀嗎？
	PlayMotion(  Morrok  , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	Yell( OwnerID() , "[SC_423180_8]" , 3 )					--沒有錯。
	PlayMotion(  OwnerID() , ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD  ) 
	sleep(20)
	LuaFunc_MoveToFlag( MA , 780615 , 1 ,  0 )
	Delobj( MA )
	MoveToFlagEnabled( OwnerID() , true )
	DisableQuest( OwnerID() ,false )
	DisableQuest( Morrok ,false )
end

------------------------------------------裡線任務NO.6
function LuaS_423181_Accept()	
	local Morrok = LuaFunc_SearchNPCbyOrgID( OwnerID() , 115076 , 200 )	
	Tell(TargetID(),Morrok,"[SC_423181_1]")				 --我會與你一同前往傑洛斯塔的OOO，空中的黑影極有可能是我們追察的關鍵之一。
end

function LuaS_423181_CHECK() --掛在檢查點上
	SetDefIdleMotion(OwnerID(),ruFUSION_MIME_DEATH_LOOP)
	SetPlot( OwnerID() , "range" , "LuaS_423181_CHECK_1" , 150 ) 		--調整最後的數字以改變偵測範圍
end

function LuaS_423181_CHECK_1()
	if	CheckAcceptQuest( OwnerID() , 423181 ) == true		then
		if	CheckFlag( OwnerID() , 543922 ) == false		and
			CheckBuff( OwnerID() , 506618) == false 		then
			AddBuff( OwnerID() , 506618 , 1 , -1 )	
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_423181_2]" , 0 ) 		--週遭傳出細微的吵雜聲！
			ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_423181_2]" , 0 )
		end
		if	ReadRoleValue(TargetID(),EM_RoleValue_Register ) < 1	then
			BeginPlot( TargetID() , "LuaS_423181_MP" , 0 )
			WriteRoleValue ( TargetID() , EM_RoleValue_Register , 1 )
		end
	end
end

function LuaS_423181_MP()
	local MP = Lua_DW_CreateObj("flag" , 115309 ,780616 , 1 )				--真理之手A	
	WriteRoleValue ( MP , EM_RoleValue_Register4 , TargetID() )
	DisableQuest( MP ,true )
	WriteRoleValue ( MP , EM_RoleValue_Register , OwnerID() )
	BeginPlot( MP , "LuaS_423181_Main" , 0 )		
end

function LuaS_423181_Main()	

	local Atac = ReadRoleValue(OwnerID(),EM_RoleValue_Register4 )	
	local Box = ReadRoleValue(OwnerID(),EM_RoleValue_Register )												
	BeginPlot( OwnerID() , "LuaS_423181_FC" , 0 )
	local Hand = Lua_DW_CreateObj("flag" , 115311 ,780616 , 2 )				--真理之手B
	local Gill = Lua_DW_CreateObj("flag" , 115310 ,780616 , 3 )				--吉兒
	WriteRoleValue ( Gill , EM_RoleValue_PID , OwnerID() )
	WriteRoleValue ( Hand , EM_RoleValue_PID , OwnerID() )
	BeginPlot( Gill , "LuaS_423181_Gill_CHECK" , 0 )
	BeginPlot( Hand , "LuaS_423181_Gill_CHECK" , 0 )
	DisableQuest( Hand ,true )
	DisableQuest( Gill ,true )
	MoveToFlagEnabled( Hand , false )
	MoveToFlagEnabled( Gill , false )
	
	Yell( OwnerID() , "[SC_423181_3]" , 3 )						--差不多該將他抓回去了。
	sleep(20)
	Yell( Gill , "[SC_423181_4]" , 3 )							--礙事......
	sleep(20)
	Yell( Gill , "[SC_423181_5]" , 3 )							--來吧！
	sleep(20)
	BeginPlot( Gill , "LuaS_423181_Gillrun" , 0 )						--（吉兒跑走）

	local MonNoDa = Lua_DW_CreateObj("flag" , 115313 ,780616 , 9 )	
	WriteRoleValue ( MonNoDa , EM_RoleValue_PID , OwnerID() )
	BeginPlot( MonNoDa , "LuaS_423181_Gill_CHECK" , 0 )
	DisableQuest( MonNoDa ,true )
	MoveToFlagEnabled( MonNoDa , false )
--用跑的

	LuaFunc_MoveToFlag( MonNoDa , 780616 , 1 ,  0 )
--播攻擊
	Yell( OwnerID() , "[SC_423181_6]" , 3 )						--快走！
	SetDefIdleMotion(OwnerID(),ruFUSION_MIME_DEATH_LOOP)

	local Mon = Lua_DW_CreateObj("flag" , 103898 ,780616 , 4 )	
	SetAttack( Mon , Atac )
	WriteRoleValue ( Mon , EM_RoleValue_Register6 , OwnerID() )
	CallPlot( Mon, "LuaFunc_Obj_Suicide" , 300 )
	AddToPartition( Mon , 0 )
	SetPlot(Mon,"dead","LuaS_423181_Dead",0 )						--怪死掉後觸發死亡劇情
	BeginPlot(Mon, "LuaS_423003_5" , 0 )							--離開戰鬥後刪掉自己
	BeginPlot( Hand , "LuaS_423181_Handrun" , 0 )						--（真理之手B逃走跑走）
	BeginPlot( MonNoDa , "LuaS_423181_MonNoDa" , 0 )	

	for i = 0 , 100 , 1 do
		if	CheckID(Mon) == false  or
			ReadRoleValue(Mon ,EM_RoleValue_IsDead) == 1	then
			break
		end
		sleep( 20 )
	end
--	sleep(10)

	if	ReadRoleValue ( OwnerID() , EM_RoleValue_Register3 ) >0		then
		local Morrok = Lua_DW_CreateObj("flag" , 115314 ,780616 , 7 )
		WriteRoleValue ( Morrok , EM_RoleValue_PID , OwnerID() )
		BeginPlot( Morrok , "LuaS_423181_Gill_CHECK" , 0 )
		DisableQuest( Morrok ,true )
		MoveToFlagEnabled( Morrok , false )
		LuaFunc_MoveToFlag( Morrok , 780616 , 8 ,  0 )
		Yell( Morrok , "[SC_423181_7]" , 3 )						--這是怎麼回事？
		sleep(20)
		BeginPlot( Morrok , "LuaS_423181_SeeMo" , 0 )
	end
	WriteRoleValue ( Box , EM_RoleValue_Register , 0 )					--把木箱Register寫回0
	Delobj( OwnerID() )
end

function LuaS_423181_Dead()
	local OO = ReadRoleValue ( OwnerID() , EM_RoleValue_Register6 )
	local Player 
	for i=0, HateListCount( OwnerID() )-1 do
		Player = HateListInfo(OwnerID() , i , EM_HateListInfoType_GItemID )
		if	CheckAcceptQuest ( Player   , 423181 )		and
			CheckBuff( Player , 506618) == true 	then
			SetFlag( Player   , 543922, 1 )
		end	
	end
	WriteRoleValue ( OO , EM_RoleValue_Register3 , 1 )	
	return true
end

function LuaS_423181_FC()									--檢查附近有無玩家，中斷劇情用
	local Box = ReadRoleValue(OwnerID(),EM_RoleValue_Register )	
	local Group = {}
	local Num
	for i = 0 , 100 , 1 do
		Group = SearchRangePlayer(OwnerID() , 300)
		Num = 0
		for i=0,table.getn(Group)-1 do
			if	CheckAcceptQuest( Group[i], 423181 ) == true	and
				CheckBuff(Group[i]  , 506618) == true 	then
				Num = Num + 1
			end
		end
		if	Num == 0		then
			break
		end
		sleep(20)
	end
	WriteRoleValue ( Box , EM_RoleValue_Register , 0 )
	Delobj( OwnerID() )
end

function LuaS_423181_Gillrun()
	LuaFunc_MoveToFlag( OwnerID() , 780616 , 5 ,  0 )
	Delobj( OwnerID() )
end

function LuaS_423181_Handrun()
	LuaFunc_MoveToFlag( OwnerID() , 780616 , 6 ,  0 )
	Delobj( OwnerID() )
end

function LuaS_423181_MonNoDa()
	LuaFunc_MoveToFlag( OwnerID() , 780616 , 1 ,  0 )
	LuaFunc_MoveToFlag( OwnerID() , 780616 , 6 ,  0 )
	Delobj( OwnerID() )
end

function LuaS_423181_Gill_CHECK()	
	local MP = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	for i = 0 , 100 , 1 do
		if	CheckID(MP) == false	then
			break
		end
		sleep( 20 )
	end
	Delobj( OwnerID() )
end

function LuaS_423181_Player_CHECK()
	local ET = {}
	ET = SearchRangeNPC(OwnerID() , 300)
	for i=0,table.getn(ET)-1 do
		if	ReadRoleValue(ET[i] , EM_RoleValue_OrgID) == 115308	then
			return false
		end
		if	i == table.getn(ET)	then
			return true
		end
	end
end

function LuaS_423181_Player_CHECK_FINAL()
	CancelBuff( OwnerID() , 506618 )
end

function LuaS_423181_SeeMo()
	local Qp = {}
	Qp = SearchRangePlayer(OwnerID() , 300)
	for i=0,table.getn(Qp)-1 do
		if	CheckAcceptQuest( Qp[i], 423181 ) == true	and
			CheckFlag( Qp[i] , 543922 ) == true		then
			SetFlag(Qp[i] , 543923 , 1 )
			CancelBuff( Qp[i] , 506618)
		end
	end
	Delobj( OwnerID() )
end

------------------------------------------裡線任務NO.7
function LuaS_423182_Complete()
	AddBuff( TargetID() , 506620 , 1 , -1 )		
	DisableQuest( OwnerID() ,true )
	MoveToFlagEnabled( OwnerID() , false )
	LuaFunc_MoveToFlag( OwnerID() , 780616 , 10 ,  0 )
--蹲下
	PlayMotionEX( OwnerID()  , ruFUSION_ACTORSTATE_CROUCH_BEGIN,ruFUSION_ACTORSTATE_CROUCH_LOOP)
	Yell( OwnerID() , "[SC_423182_1]" , 3 )			--這是......
	sleep(30)
	PlayMotion( OwnerID()  , ruFUSION_ACTORSTATE_CROUCH_END)
	sleep(10)
	CancelBuff( TargetID() , 506620 )
	MoveToFlagEnabled( OwnerID() , true )
	DisableQuest( OwnerID() ,false )
end

------------------------------------------裡線任務NO.8
function LuaS_423183_Complete()
	AddBuff( TargetID() , 506621 , 1 , -1 )		
	DisableQuest( OwnerID() ,true )
--阿爾特蹲下
--阿爾特雜唸
	local Art = LuaFunc_CreateObjByOBj( 115321, OwnerID() )
	local Star = Lua_DW_CreateObj("flag" , 115322 ,780614 , 2 )	
	DisableQuest( Art ,true )
	DisableQuest( Star ,true )
	MoveToFlagEnabled( Art , false )
	MoveToFlagEnabled( Star , false )
	Yell( Star , "[SC_423183_1]" , 3 )		--老師，你說爪痕該不會是你擺在酒桶附近的那一個？	
	PlayMotion( star , ruFUSION_ACTORSTATE_EMOTE_SPEAK )	
	sleep(30)
	Yell( Star , "[SC_423183_2]" , 3 )		--如果那爪痕是愛薩蘭星的象徵，那麼在每個傳說中被龍與怪物襲擊的地方都曾經出現過相近的爪痕...
	PlayMotion( star , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	local Morrok = Lua_DW_CreateObj("flag" , 115323 ,780601 , 2 )	
	DisableQuest( Morrok ,true )
	MoveToFlagEnabled( Morrok , false )
	LuaFunc_MoveToFlag( Morrok , 780601 , 4 ,  0 )
	Yell( Morrok , "[SC_423183_3]" , 3 )		--那麼你知道那些地方都有什麼共同的象徵？
	PlayMotion( Morrok , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	Yell( Star , "[SC_423183_4]" , 3 )		--共通點只有一個，真理之手！在那附近都曾經有真理之手活動的跡象！	
	PlayMotion( Star ,  ruFUSION_ACTORSTATE_EMOTE_POINT  ) 
	sleep(30)
	Yell( Art , "[SC_423183_5]" , 3 )		--愛爾特，把你所知道都說出來吧！摩瑞克與新朋友是轉動世界的一個契機。
	PlayMotion( Art ,ruFUSION_ACTORSTATE_EMOTE_THINK) 
	sleep(30)
	Yell( Star , "[SC_423183_6]" , 3 )		--我知道了！師傅既然您都這麼說了～我又怎麼會讓您失望呢？
	PlayMotion( Star , ruFUSION_ACTORSTATE_EMOTE_SALUTE2) 
	sleep(30)
	Yell( Star , "[SC_423183_7]" , 3 )		--有個地方或許有他們所想要的答案，擁有古代監護者的湖泊裡、被稱為卡雅村的村落。
	PlayMotion( Star ,  ruFUSION_ACTORSTATE_EMOTE_IDLE2  ) 
	sleep(30)
	Yell( Morrok , "[SC_423183_8]" , 3 )		--我明白了，我們會往那個方向追查。
	PlayMotion( Morrok ,   ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD  ) 
	sleep(20)
	CancelBuff( TargetID() , 506621 )
	Delobj( Art )
	Delobj( Star )
	Delobj( Morrok )
	DisableQuest( OwnerID() ,false )
end






