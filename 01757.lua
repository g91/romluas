--------------423007找出兇手	接任務午夜是114513；完成任務午夜114602

function LuaS_114602_0()	
	LoadQuestOption( OwnerID() )
	if	(CheckAcceptQuest(OwnerID(),423007)==true )and( CheckCompleteQuest( OwnerID(),423007)==false)	and
		(CountBodyItem( OwnerID(),206823) <1)	and	(CountBodyItem( OwnerID(),206822) <1)	and CheckFlag( OwnerID() , 543748) == true 	then
		ScriptMessage( OwnerID()   ,  OwnerID()   , 1 , "[SC_423007_16]" , 0 ) 	--缺少艾翁侍女服、妝點飾品
		ScriptMessage( OwnerID()   ,  OwnerID()   , 0 , "[SC_423007_16]" , 0 )
		Yell( TargetID() , "[SC_423007_19]" , 3 )					--騎士使節～我們還缺艾翁侍女服和妝點飾品～
	end
	if	(CheckAcceptQuest(OwnerID(),423007)==true )and( CheckCompleteQuest( OwnerID(),423007)==false)	and
		(CountBodyItem( OwnerID(),206823) >0)	and	(CountBodyItem( OwnerID(),206822) <1)	and CheckFlag( OwnerID() , 543748) == true 	then
		ScriptMessage( OwnerID()   ,  OwnerID()   , 1 , "[SC_423007_17]" , 0 ) 	--缺少妝點飾品
		ScriptMessage( OwnerID()   ,  OwnerID()   , 0 , "[SC_423007_17]" , 0 )		
		Yell( TargetID() , "[SC_423007_20]" , 3 )					--騎士使節～我們還缺妝點飾品～
	end
	if	(CheckAcceptQuest(OwnerID(),423007)==true )and( CheckCompleteQuest( OwnerID(),423007)==false)	and
		(CountBodyItem( OwnerID(),206823) <1)	and	(CountBodyItem( OwnerID(),206822) >0)	and CheckFlag( OwnerID() , 543748) == true 	then
		ScriptMessage( OwnerID()   ,  OwnerID()   , 1 , "[SC_423007_18]" , 0 ) 	--缺少艾翁侍女服
		ScriptMessage( OwnerID()   ,  OwnerID()   , 0 , "[SC_423007_18]" , 0 )	
		Yell( TargetID() , "[SC_423007_21]" , 3 )					--騎士使節～我們還缺艾翁侍女服～
	end
	if	(CheckAcceptQuest(OwnerID(),423007)==true )and( CheckCompleteQuest( OwnerID(),423007)==false)	and
		(CountBodyItem( OwnerID(),206823) >0)	and	(CountBodyItem( OwnerID(),206822) >0)	and CheckFlag( OwnerID() , 543748) == true 	then
		SetFlag( OwnerID() , 543715, 1 )
	end
end

function LuaS_423007_2()
	SetSpeakDetail(OwnerID(),"[SC_423007_1]")					--見夫人呀～夫人在哪裡呢？
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423007_2]","LuaS_423007_3",0	)	--聽說夫人幾年前得了怪病後，就把自己關在高塔上的房間內，除了王子之外，只有侍女和專屬醫生才能待在她的房裡。
end

function LuaS_423007_3()
	SetSpeakDetail(OwnerID(),"[SC_423007_3]")					--嘻嘻…怪病嗎？
										--幾年前染上怪病，從此不見其他人…小的越來越想親眼見見高貴的夫人了～
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423007_4]","LuaS_423007_5",0)		--好。
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423007_5]","LuaS_423007_5",0)		--我沒意見。
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423007_6]","LuaS_423007_4",0)		--為什麼是侍女？
end


function LuaS_423007_4()
		closespeak(OwnerID())						--TargetID是午夜
		PlayMotion( TargetID,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
		Yell( TargetID() , "[SC_423007_7]" , 3 )				--當然是因為～夫人的專屬醫生應該沒那麼多人囉～				
	if	ReadRoleValue( TargetID() , EM_RoleValue_Register+9 ) == 0 then		--設定成場上有NPC就不再觸發
		BeginPlot(TargetID()  , "LuaS_423007_6" , 0 )
		else
		SetFlag( OwnerID() , 543748, 1 )
		return
	end
end


function LuaS_423007_5()
		closespeak(OwnerID())						--TargetID是午夜
	if	ReadRoleValue( TargetID() , EM_RoleValue_Register+9 ) == 0 then		--設定成場上有NPC就不再觸發
		BeginPlot(TargetID()  , "LuaS_423007_6" , 0 )
		else
		SetFlag( OwnerID() , 543748, 1 )
		return
	end
end
	
function LuaS_423007_6()
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+9 , 2 )	--TargetID是玩家
	local CARL=ReadRoleValue( OwnerID() , EM_RoleValue_Register+3 ) 
	DisableQuest( CARL , true )					--關閉對話
	MoveToFlagEnabled(CARL , false )				--關閉巡邏
	Yell( CARL , "[SC_423007_8]" , 3 )					--夜梟：你們自己進去就好。
	sleep(20)
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_LAUGH)
	Yell( OwnerID() , "[SC_423007_9]" , 3 )				--午夜：嘻嘻…這怎麼行呢？你親口答應傑斯要幫忙處理這件事～而且我也需要你的保護呀～
	sleep(20)	
	
	PlayMotion( CARL ,ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)
	Yell( CARL , "[SC_423007_10]" , 3 )					--夜梟：…我可以用別的方式。
	sleep(20)

	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( OwnerID() , "[SC_423007_11]" , 3 )				--午夜：哎～說好同進退～而且我要是在王妃房裡發生危險…
	sleep(20)

	Yell( CARL , "[SC_423007_12]" , 3 )					--……
	sleep(20)
	
	Yell( OwnerID() , "[SC_423007_13]" , 3 )				--嗯？
	sleep(20)

	PlayMotion( CARL ,ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	Yell( CARL , "[SC_423007_14]" , 3 )					--夜梟：…好，同進退。
	sleep(20)
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_APPLAUSE)
	Yell( OwnerID() , "[SC_423007_15]" , 3 )				--就這麼說定了！騎士使節，裝扮需要的物品交給你張羅～我們到夫人的居所附近等你。
	PlayMotion( CARL , ruFUSION_ACTORSTATE_CROUCH_BEGIN)
	sleep(10)
	PlayMotion( CARL , ruFUSION_ACTORSTATE_CROUCH_END)
	SetFlag( TargetID() , 543748, 1 )
	sleep(10)
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+9 , 0 )
end


function LuaS_423007_7()		--午夜114513出生劇情	種出114603	780456
	local CARL = CreateObjByFlag( 114603 , 780456 , 1 , 1 )	 	
	AddToPartition(  CARL , 0 )
	DisableQuest( CARL , true )					--關閉對話
	MoveToFlagEnabled(CARL , false )				--關閉巡邏
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register+3,CARL )	--將卡爾寫進114613午夜裡
end

--點擊物品前檢查
function LuaS_423007_99()
	if	(CheckAcceptQuest(OwnerID(),423007)==true )and( CheckCompleteQuest( OwnerID(),423007)==false)	and
		CheckFlag( OwnerID() , 543748 ) ==true	then
		return true
	end
	return	false
end

function LuaS_423007_100()
	local NPC = SearchRangeNPC ( OwnerID() , 50 )
	for i=0,table.getn(NPC)-1 do
		if	ReadRoleValue(NPC[i],EM_RoleValue_OrgID) ==114387 then
			if	CountBodyItem( OwnerID(), 206823)<1	then			
				GiveBodyItem( OwnerID(), 206823, 1 )
				return true
			end
		end
		if	ReadRoleValue(NPC[i],EM_RoleValue_OrgID) ==114388 then
			if	CountBodyItem( OwnerID(), 206822 )<1	then			
				GiveBodyItem( OwnerID(), 206822 , 1 )
				return true
			end
		end
	end
	ScriptMessage( OwnerID()   ,  OwnerID()   , 1 , "[SC_423007_22]" , 0 ) 		--你已經擁有
	ScriptMessage( OwnerID()   ,  OwnerID()   , 0 , "[SC_423007_22]" , 0 )
	return	false
end

--------------422008 侍女扮裝	--接任務後執行

function LuaS_423008_1()-- 填在207013
	if	CountBodyItem(OwnerID(),207014) > 0	then
		DelBodyItem(OwnerID(),207014,1) --del
		GiveBodyItem(OwnerID(),207015,1) --合成
		UseItemDestroy() -- 刪掉使用中的
		return
	end
	ScriptMessage(OwnerID(),OwnerID(),1,"[SC_423008_13]",0)
end

function LuaS_423008_2() --填在207014
	if	CountBodyItem(OwnerID(),207013) > 0	then
		DelBodyItem(OwnerID(),207013,1) --del
		GiveBodyItem(OwnerID(),207015,1) --合成
		UseItemDestroy() -- 刪掉使用中的
		return
	end
	ScriptMessage(OwnerID(),OwnerID(),1,"[SC_423008_14]",0)		
end

function LuaS_423008_0()
	DisableQuest( OwnerID() , true )
	local CARL =ReadRoleValue( OwnerID() , EM_RoleValue_Register+3 ) 
	AdjustFaceDir( OwnerID(),CARL , 0 )
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( OwnerID() , "[SC_423008_1]" , 3 )					--我來幫你化妝～不用擔心，我很有「經驗」。
	sleep(10)
	AdjustFaceDir( CARL,OwnerID(), 0 )
	sleep(10)
	PlayMotion( CARL ,ruFUSION_ACTORSTATE_DODGE)
	Yell( CARL , "[SC_423008_2]" , 3 )						--別拿你畫大體的筆。
	sleep(20)

	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( OwnerID() , "[SC_423008_3]" , 3 )					--放心～這是新的，畫完你我再拿去畫大體～
	sleep(20)

	Yell( CARL , "[SC_423008_4]" , 3 )						--……
	sleep(20)
	
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( OwnerID() , "[SC_423008_5]" , 3 )					--一定會把你變成大美人～
	sleep(20)

	PlayMotion( CARL ,ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)
	Yell( CARL , "[SC_423008_6]" , 3 )						--不需要。
	sleep(20)

	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_APPROVAL)
	Yell( OwnerID() , "[SC_423008_7]" , 3 )					--機會難得耶！
	sleep(20)

	Yell( CARL , "[SC_423008_8]" , 3 )						--少廢話。
	sleep(15)

	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_CRY)
	Yell( OwnerID() , "[SC_423008_9]" , 3 )					--哎哎～真是不解風情～	
	sleep(20)

	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( OwnerID() , "[SC_423008_10]" , 3 )					--沒關係，我還是會幫你畫得很漂亮，跟藝術品一樣～	
	sleep(20)	

	Yell( CARL , "[SC_423008_4]" , 3 )						--……
	sleep(20)
	ScriptMessage( TargetID()   ,  TargetID()   , 0 , "[SC_423008_11]" , 0 ) 		--「夜梟」不再說話，只是緩緩舉起手輕敲了下午夜的額頭。
	ScriptMessage( TargetID()   ,  TargetID()   , 2 , "[SC_423008_11]" , 0 )
	sleep(20)
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_KISS)
	Yell( OwnerID() , "[SC_423008_12]" , 3 )					--噢～好了！進門換上衣服，你就是個長髮美人了～
	sleep(30)
	SetFlag( TargetID() , 543757, 1 )						--看不見夜梟、午夜
	DisableQuest( OwnerID() , false )
end

function LuaS_423008_7()		--午夜114602出生劇情	種出114604	780457
	local CARL = CreateObjByFlag( 114564, 780457 , 1 , 1 )	 	
	AddToPartition(  CARL , 0 )
	DisableQuest( CARL , true )					--關閉對話
	MoveToFlagEnabled(CARL , false )				--關閉巡邏
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register+3,CARL )	--將卡爾寫進114602午夜裡
end

----------423010 落幕
function LuaS_423010_0()
	LoadQuestOption( OwnerID() )
	if	(CheckAcceptQuest(OwnerID(),423010)==true )and( CheckCompleteQuest( OwnerID(),423010)==false) 	then
		if (ReadRoleValue( TargetID() , EM_RoleValue_Register )  == 0)	 then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423010_0]","LuaS_423010_4",0) --傑斯？你好了嗎？
		else
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423010_0]","LuaS_423010_1",0) --傑斯？你好了嗎？
		end	
	end

end

function LuaS_423010_1()	--780459  1-8
	SetSpeakDetail(OwnerID(),"[SC_423010_1]")--請稍等我一會兒
end

function LuaS_423010_4()
	closespeak(OwnerID())
	WriteRoleValue( TargetID() , EM_RoleValue_Register , 2 )
	BeginPlot(TargetID(), "LuaS_423010_2" , 0 )
end

function LuaS_423010_2()
	Yell( OwnerID() , "[SC_423010_2]" , 3 )			--久等了，使節大人，請隨我一同前往王宮。
	sleep(20)
	SetPosByFlag( TargetID(), 780459 , 1 )				--傳送玩家
	
	if	CheckBuff( TargetID() , 506265) == false then
		AddBuff( TargetID(), 506265, 0 , 200 )
	end	

	local LAU = Lua_DW_CreateObj("flag",114584,780459,2 )	--種出勞爾、傑諾、夜梟、午夜
	MoveToFlagEnabled(LAU , false )
	WriteRoleValue( LAU ,EM_RoleValue_IsWalk , 1 )
	local JNO = Lua_DW_CreateObj("flag",114601,780459,3 )	--傑諾
	MoveToFlagEnabled(JNO , false )
	WriteRoleValue( JNO ,EM_RoleValue_IsWalk , 1 )
	local JS = Lua_DW_CreateObj("flag",114781,780459,4 )	--傑斯
	MoveToFlagEnabled(JS , false )
	WriteRoleValue( JS ,EM_RoleValue_IsWalk , 1 )
	local CARL = Lua_DW_CreateObj("flag",114604,780459,5 ) --夜梟
	MoveToFlagEnabled(CARL , false )
	WriteRoleValue( CARL ,EM_RoleValue_IsWalk , 1 )
	local NIGHT = Lua_DW_CreateObj("flag",114707,780459,6)
	MoveToFlagEnabled(NIGHT , false )
	WriteRoleValue( NIGHT ,EM_RoleValue_IsWalk , 1 )
	
	sleep(50)
	PlayMotion( LAU ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( LAU , "[SC_423010_3]" , 3 )		--勞爾：竟然會有這種事…
	sleep(20)
	
	PlayMotion( JNO ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( JNO , "[SC_423010_4]" , 3 )		--傑諾：母后！母后怎麼會變成這樣！到底是從什麼時候開始的…
	sleep(30)
	
	Player = SearchRangePlayer(LAU , 300)			--給BUFF
		for i=0,table.getn(Player)-1 do					
		if	CheckAcceptQuest( Player[i], 423010 ) == true	and	CheckBuff(  Player[i], 506265) == false	then  	
			AddBuff( Player[i], 506265, 0 , 180 )
		end
	end
	--插入檢查
	if	CheckID( TargetID() )== false	 or (CheckAcceptQuest(TargetID(),423010)==false) 	then	--TargetID() 是玩家
		DelObj(JS )	--刪除演戲傑斯
		DelObj(LAU )	--刪除演戲勞爾
		DelObj(JNO )	--刪除演戲傑諾
		DelObj(CARL )	--刪除演戲夜梟
		DelObj(NIGHT )	--刪除演戲午夜	
		CancelBuff( TargetID()  , 506265) 
		WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
		return
	end

	PlayMotion( NIGHT ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( NIGHT , "[SC_423010_5]" , 3 )		--午夜：差不多是四年前唷～
	sleep(20)
	
	AdjustFaceDir( LAU ,NIGHT , 0 )
	PlayMotion( LAU , ruFUSION_ACTORSTATE_EMOTE_POINT)
	Yell( LAU , "[SC_423010_6]" , 3 )		--勞爾：你是…
	sleep(20)

	PlayMotion( JS ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( JS , "[SC_423010_7]" , 3 )		--傑斯：他們是我的朋友。
	sleep(10)
	AdjustFaceDir( LAU ,JS , 0 )
	sleep(10)
	Player = SearchRangePlayer(LAU , 300)			--給BUFF
		for i=0,table.getn(Player)-1 do			
		if	CheckAcceptQuest( Player[i], 423010 ) == true	and	CheckBuff(  Player[i], 506265) == false		then  	
			AddBuff( Player[i], 506265, 0 , 160 )
		end
	end
	--插入檢查
	if	CheckID( TargetID() )== false	 or (CheckAcceptQuest(TargetID(),423010)==false) 	then	--TargetID() 是玩家
		DelObj(JS )	--刪除演戲傑斯
		DelObj(LAU )	--刪除演戲勞爾
		DelObj(JNO )	--刪除演戲傑諾
		DelObj(CARL )	--刪除演戲夜梟
		DelObj(NIGHT )	--刪除演戲午夜	
		CancelBuff( TargetID()  , 506265) 
		WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
		return
	end

	AdjustFaceDir( JNO ,JS , 0 )
	PlayMotion( JNO ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( JNO  , "[SC_423010_8]" , 3 )		--傑諾：大哥！我不能接受…母后是那麼好的人啊！為什麼她會遇到這種事…究竟是誰可以這樣操控屍體？又憑什麼玩弄別人？
	sleep(30)

	PlayMotion( JS ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( JS , "[SC_423010_9]" , 3 )		--傑斯：唉…這個，我也不清楚，幾年來…我們都沒有看出不對勁，敵人的實力應該不止這樣而已。
	sleep(30)
	Player = SearchRangePlayer(LAU , 300)			--給BUFF
		for i=0,table.getn(Player)-1 do			
		if	CheckAcceptQuest( Player[i], 423010 ) == true	and	CheckBuff(  Player[i], 506265) == false		then  	
			AddBuff( Player[i], 506265, 0 , 150 )
		end
	end
	--插入檢查
	if	CheckID( TargetID() )== false	 or (CheckAcceptQuest(TargetID(),423010)==false) 	then	--TargetID() 是玩家
		DelObj(JS )	--刪除演戲傑斯
		DelObj(LAU )	--刪除演戲勞爾
		DelObj(JNO )	--刪除演戲傑諾
		DelObj(CARL )	--刪除演戲夜梟
		DelObj(NIGHT )	--刪除演戲午夜	
		CancelBuff( TargetID()  , 506265) 
		WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
		return
	end

	PlayMotion( LAU ,ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)
	Yell( LAU , "[SC_423010_10]" , 3 )		--勞爾：我一直認為母后生了病才會出現異常的行為舉止…是我疏忽了…都是我的錯…奧力維爾‧哈利斯不應該犧牲…
	sleep(30)

	PlayMotion( JNO ,ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)
	Yell( JNO , "[SC_423010_11]" , 3 )		--傑諾：是我不好，如果我多費一些心思關心母后，就能知道她的變化了…如果我不要一直忙著反對你的作為…我果然太感情用事，不適合治理艾翁。
	sleep(30)

	PlayMotion( JS ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( JS , "[SC_423010_12]" , 3 )		--傑斯：勞爾！傑諾！現在不是垂頭喪氣的時候！我的朋友告訴我，這種時候更要振作起來面對，溫柔的母后一定不希望我們繼續消沈，你們要繼續打起精神治理艾翁啊～
	sleep(40)
	Player = SearchRangePlayer(LAU , 300)			--給BUFF
		for i=0,table.getn(Player)-1 do			
		if	CheckAcceptQuest( Player[i], 423010 ) == true	and	CheckBuff(  Player[i], 506265) == false		then  	
			AddBuff( Player[i], 506265, 0 , 130)
		end
	end
	--插入檢查
	if	CheckID( TargetID() )== false	 or (CheckAcceptQuest(TargetID(),423010)==false) 	then	--TargetID() 是玩家
		DelObj(JS )	--刪除演戲傑斯
		DelObj(LAU )	--刪除演戲勞爾
		DelObj(JNO )	--刪除演戲傑諾
		DelObj(CARL )	--刪除演戲夜梟
		DelObj(NIGHT )	--刪除演戲午夜	
		CancelBuff( TargetID()  , 506265) 
		WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
		return
	end

	PlayMotion( LAU ,ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)
	PlayMotion( LAU ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( LAU , "[SC_423010_13]" , 3 )		--勞爾：大哥，我把事情全搞砸了…怎麼還能談治理…
	sleep(30)

	PlayMotion( JNO ,ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)
	PlayMotion( JNO ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( JNO , "[SC_423010_14]" , 3 )		--傑諾：大哥，我不適合…
	sleep(20)
	Player = SearchRangePlayer(LAU , 300)			--給BUFF
		for i=0,table.getn(Player)-1 do			
		if	CheckAcceptQuest( Player[i], 423010 ) == true	and	CheckBuff(  Player[i], 506265) == false		then  	
			AddBuff( Player[i], 506265, 0 , 120)
		end
	end
	--插入檢查
	if	CheckID( TargetID() )== false	 or (CheckAcceptQuest(TargetID(),423010)==false) 	then	--TargetID() 是玩家
		DelObj(JS )	--刪除演戲傑斯
		DelObj(LAU )	--刪除演戲勞爾
		DelObj(JNO )	--刪除演戲傑諾
		DelObj(CARL )	--刪除演戲夜梟
		DelObj(NIGHT )	--刪除演戲午夜	
		CancelBuff( TargetID()  , 506265) 
		WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
		return
	end

	AdjustFaceDir( JS ,LAU , 0 )
	PlayMotion( JS ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( JS , "[SC_423010_15]" , 3 )		--傑斯：勞爾，你一向擅長軍事，重視律法制度，想建立一個讓人民覺得公平，生活有依據的艾翁，這些人民會需要的。
	sleep(40)

	AdjustFaceDir( JS ,JNO , 0 )
	PlayMotion( JS ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( JS , "[SC_423010_16]" , 3 )		--傑斯：傑諾，你有一顆比誰都體恤人民的心，這份體貼人民都看在眼裡，你絕對適合擔任治理者。
	sleep(40)
	Player = SearchRangePlayer(LAU , 300)			--給BUFF
		for i=0,table.getn(Player)-1 do			
		if	CheckAcceptQuest( Player[i], 423010 ) == true	and	CheckBuff(  Player[i], 506265) == false		then  	
			AddBuff( Player[i], 506265, 0 , 110)
		end
	end
	--插入檢查
	if	CheckID( TargetID() )== false	 or (CheckAcceptQuest(TargetID(),423010)==false) 	then	--TargetID() 是玩家
		DelObj(JS )	--刪除演戲傑斯
		DelObj(LAU )	--刪除演戲勞爾
		DelObj(JNO )	--刪除演戲傑諾
		DelObj(CARL )	--刪除演戲夜梟
		DelObj(NIGHT )	--刪除演戲午夜	
		CancelBuff( TargetID()  , 506265) 
		WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
		return
	end

	PlayMotion( JS ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( JS , "[SC_423010_17]" , 3 )		--傑斯：你們兩個擁有我沒有的能力，艾翁在你們共同帶領下，一定會過得更好！
	sleep(20)

	PlayMotion( LAU ,ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	Yell( LAU , "[SC_423010_18]" , 3 )		--勞爾：好，我答應你。
	sleep(10)
	PlayMotion( JNO ,ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	Yell( JNO , "[SC_423010_19]" , 3 )		--傑諾：嗯！

	AdjustFaceDir( JS ,CARL , 0 )
	LuaFunc_MoveToFlag( JS,780459,7,0)		--傑斯走向夜梟、午夜

		Player = SearchRangePlayer(LAU , 300)			--給BUFF
		for i=0,table.getn(Player)-1 do			
		if	CheckAcceptQuest( Player[i], 423010 ) == true	and	CheckBuff(  Player[i], 506265) == false		then  	
			AddBuff( Player[i], 506265, 0 , 100)
		end
	end
	--插入檢查
	if	CheckID( TargetID() )== false	 or (CheckAcceptQuest(TargetID(),423010)==false) 	then	--TargetID() 是玩家
		DelObj(JS )	--刪除演戲傑斯
		DelObj(LAU )	--刪除演戲勞爾
		DelObj(JNO )	--刪除演戲傑諾
		DelObj(CARL )	--刪除演戲夜梟
		DelObj(NIGHT )	--刪除演戲午夜	
		CancelBuff( TargetID()  , 506265) 
		WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
		return
	end

	PlayMotion( JS ,ruFUSION_ACTORSTATE_EMOTE_SALUTE2)
	Yell( JS , "[SC_423010_20]" , 3 )		--傑斯：好友們，謝謝！我要怎麼報答你們對艾翁的恩情。
	sleep(20)

	PlayMotion( NIGHT ,ruFUSION_ACTORSTATE_EMOTE_KISS)
	Yell( NIGHT , "[SC_423010_21]" , 3 )		--午夜：嘻嘻…我已經得到最好的謝禮了～
	sleep(20)
	Player = SearchRangePlayer(LAU , 300)			--給BUFF
		for i=0,table.getn(Player)-1 do			
		if	CheckAcceptQuest( Player[i], 423010 ) == true	and	CheckBuff(  Player[i], 506265) == false		then  	
			AddBuff( Player[i], 506265, 0 , 90)
		end
	end
	--插入檢查
	if	CheckID( TargetID() )== false	 or (CheckAcceptQuest(TargetID(),423010)==false) 	then	--TargetID() 是玩家
		DelObj(JS )	--刪除演戲傑斯
		DelObj(LAU )	--刪除演戲勞爾
		DelObj(JNO )	--刪除演戲傑諾
		DelObj(CARL )	--刪除演戲夜梟
		DelObj(NIGHT )	--刪除演戲午夜	
		CancelBuff( TargetID()  , 506265) 
		WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
		return
	end

	Yell( JS , "[SC_423010_22]" , 3 )		--傑斯：那…卡爾？
	sleep(20)

	Yell( CARL , "[SC_423010_23]" , 3 )		--夜梟：可以看一眼艾翁從雷汀領主開始傳承千年的「無雙盾」？
	sleep(30)

	PlayMotion( JS ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( JS , "[SC_423010_24]" , 3 )		--傑斯：卡爾～我知道你對武器很了解，也喜歡研究，謝謝你在我避居布拉村時，一次也沒開口向我要求看「無雙盾」。
	sleep(30)
	Player = SearchRangePlayer(LAU , 300)			--給BUFF
		for i=0,table.getn(Player)-1 do			
		if	CheckAcceptQuest( Player[i], 423010 ) == true	and	CheckBuff(  Player[i], 506265) == false		then  	
			AddBuff( Player[i], 506265, 0 , 80)
		end
	end
	--插入檢查
	if	CheckID( TargetID() )== false	 or (CheckAcceptQuest(TargetID(),423010)==false) 	then	--TargetID() 是玩家
		DelObj(JS )	--刪除演戲傑斯
		DelObj(LAU )	--刪除演戲勞爾
		DelObj(JNO )	--刪除演戲傑諾
		DelObj(CARL )	--刪除演戲夜梟
		DelObj(NIGHT )	--刪除演戲午夜	
		CancelBuff( TargetID()  , 506265) 
		WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
		return
	end

	Yell( CARL , "[SC_423010_25]" , 3 )		--夜梟：傑斯，其實…你不想讓我看？
	sleep(20)

	PlayMotion( JS ,ruFUSION_ACTORSTATE_EMOTE_LAUGH)
	Yell( JS , "[SC_423010_26]" , 3 )		--傑斯：哈哈～怎麼會？跟我來吧～
	sleep(20)	
	Player = SearchRangePlayer(LAU , 300)			--給BUFF
		for i=0,table.getn(Player)-1 do			
		if	CheckAcceptQuest( Player[i], 423010 ) == true	and	CheckBuff(  Player[i], 506265) == false		then  	
			AddBuff( Player[i], 506265, 0 , 60)
		end
	end
	--插入檢查
	if	CheckID( TargetID() )== false	 or (CheckAcceptQuest(TargetID(),423010)==false) 	then	--TargetID() 是玩家
		DelObj(JS )	--刪除演戲傑斯
		DelObj(LAU )	--刪除演戲勞爾
		DelObj(JNO )	--刪除演戲傑諾
		DelObj(CARL )	--刪除演戲夜梟
		DelObj(NIGHT )	--刪除演戲午夜	
		CancelBuff( TargetID()  , 506265) 
		WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
		return
	end

	BeginPlot(CARL  , "LuaS_423010_3" , 0 )
	LuaFunc_MoveToFlag( JS,780459,8,0)				--
	LuaFunc_MoveToFlag( JS,780459,9,0)	
	LuaFunc_MoveToFlag( JS,780459,10,0)	

	BeginPlot(JNO , "LuaS_423010_5" , 0 )
	BeginPlot(LAU , "LuaS_423010_6" , 0 )
	LuaFunc_MoveToFlag( JS,780459,11,0)	
	sleep(10)	
	local TTRR= Lua_DW_CreateObj("flag" ,114073,780459,13 ) 			--種出施法用隱形球
	Lua_ObjDontTouch( TTRR )
	sleep(10)	

	AdjustFaceDir( JS,TTRR , 0 )
	AdjustFaceDir( CARL ,TTRR , 0 )
	PlayMotion( CARL , ruFUSION_ACTORSTATE_EMOTE_POINT)
	Yell( CARL , "[SC_423010_27]" , 3 )		--這是傳說中的「無雙盾」？
	sleep(20)

	Yell( JS , "[SC_423010_28]" , 3 )		--對，仿造了外型，實際盾的大小約一半身長。
	sleep(20)

	PlayMotion( CARL ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( CARL , "[SC_423010_29]" , 3 )		--一半身長...堅固、厚實卻偏大的體積會使得重量不似小圓盾輕巧、靈活，也沒有其餘特殊設計。
	sleep(20)

	Player = SearchRangePlayer(LAU , 300)			--給BUFF
		for i=0,table.getn(Player)-1 do			
		if	CheckAcceptQuest( Player[i], 423010 ) == true	and	CheckBuff(  Player[i], 506265) == false		then  	
			AddBuff( Player[i], 506265, 0 , 50)
		end
	end
	--插入檢查
	if	CheckID( TargetID() )== false	 or (CheckAcceptQuest(TargetID(),423010)==false) 	then	--TargetID() 是玩家
		DelObj(JS )	--刪除演戲傑斯
		DelObj(LAU )	--刪除演戲勞爾
		DelObj(JNO )	--刪除演戲傑諾
		DelObj(CARL )	--刪除演戲夜梟
		DelObj(NIGHT )	--刪除演戲午夜	
		DelObj(TTRR )	--刪除演戲隱形球
		CancelBuff( TargetID()  , 506265) 
		WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
		return
	end

	Yell( CARL , "[SC_423010_41]" , 3 )		--盾面雕飾也非少見的紋路。
	sleep(20)

	PlayMotion( CARL ,ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	Yell( CARL , "[SC_423010_30]" , 3 )		--無論是評估實戰或外觀，這都只是一面很尋常的盾牌。
	sleep(20)

	AdjustFaceDir( JNO , CARL , 0 )
	Yell( JNO , "[SC_423010_31]" , 3 )		--傑諾：什麼？！
	sleep(20)

	Player = SearchRangePlayer(LAU , 300)			--給BUFF
		for i=0,table.getn(Player)-1 do			
		if	CheckAcceptQuest( Player[i], 423010 ) == true	and	CheckBuff(  Player[i], 506265) == false		then  	
			AddBuff( Player[i], 506265, 0 , 40)
		end
	end
	--插入檢查
	if	CheckID( TargetID() )== false	 or (CheckAcceptQuest(TargetID(),423010)==false) 	then	--TargetID() 是玩家
		DelObj(JS )	--刪除演戲傑斯
		DelObj(LAU )	--刪除演戲勞爾
		DelObj(JNO )	--刪除演戲傑諾
		DelObj(CARL )	--刪除演戲夜梟
		DelObj(NIGHT )	--刪除演戲午夜	
		DelObj(TTRR )	--刪除演戲隱形球
		CancelBuff( TargetID()  , 506265) 
		WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
		return
	end

	AdjustFaceDir( LAU , CARL , 0 )
	PlayMotion( LAU , ruFUSION_ACTORSTATE_EMOTE_POINT)
	Yell( LAU , "[SC_423010_32]" , 3 )		--勞爾：這是艾翁的象徵，你說他只是平凡無奇的盾牌？
	sleep(20)

	PlayMotion( JS ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( JS , "[SC_423010_33]" , 3 )		--傑斯：先冷靜下來，卡爾對這方面很有研究。
	sleep(20)

	Player = SearchRangePlayer(LAU , 300)			--給BUFF
		for i=0,table.getn(Player)-1 do			
		if	CheckAcceptQuest( Player[i], 423010 ) == true	and	CheckBuff(  Player[i], 506265) == false		then  	
			AddBuff( Player[i], 506265, 0 , 40)
		end
	end
	--插入檢查
	if	CheckID( TargetID() )== false	 or (CheckAcceptQuest(TargetID(),423010)==false) 	then	--TargetID() 是玩家
		DelObj(JS )	--刪除演戲傑斯
		DelObj(LAU )	--刪除演戲勞爾
		DelObj(JNO )	--刪除演戲傑諾
		DelObj(CARL )	--刪除演戲夜梟
		DelObj(NIGHT )	--刪除演戲午夜	
		CancelBuff( TargetID()  , 506265) 
		WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
		return
	end

	Yell( CARL , "[SC_423010_34]" , 3 )		--夜梟：就盾本身來說，確實不足以被稱為「無雙」，但是，如果沒有相當的力氣與鍛鍊，一般人不容易輕鬆使用它。
	sleep(40)

	PlayMotion( CARL ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( CARL , "[SC_423010_35]" , 3 )		--盾牌設計輕巧，發揮時攻、時守的戰術也較靈活，如果刻意摒棄，以這面盾牌的沈重、厚實，使用者的抵禦應是偏向寸步不移的防衛方式。
	sleep(40)
	Player = SearchRangePlayer(LAU , 300)			--給BUFF
		for i=0,table.getn(Player)-1 do			
		if	CheckAcceptQuest( Player[i], 423010 ) == true	and	CheckBuff(  Player[i], 506265) == false		then  	
			AddBuff( Player[i], 506265, 0 , 30)
		end
	end
	--插入檢查
	if	CheckID( TargetID() )== false	 or (CheckAcceptQuest(TargetID(),423010)==false) 	then	--TargetID() 是玩家
		DelObj(JS )	--刪除演戲傑斯
		DelObj(LAU )	--刪除演戲勞爾
		DelObj(JNO )	--刪除演戲傑諾
		DelObj(CARL )	--刪除演戲夜梟
		DelObj(NIGHT )	--刪除演戲午夜	
		CancelBuff( TargetID()  , 506265) 
		WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
		return
	end

	Yell( CARL , "[SC_423010_36]" , 3 )		--這是最簡單也是最困難的守護。
	sleep(20)

	Yell( JNO , "[SC_423010_37]" , 3 )		--傑諾：什麼意思？
	sleep(20)

	PlayMotion( CARL ,ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)
	Yell( CARL , "[SC_423010_38]" , 3 )		--面對敗將、殘兵，有多少人能不得意搶攻？面對強敵、眾兵，有多少人能不畏怯退避？
	sleep(40)
	Player = SearchRangePlayer(LAU , 300)			--給BUFF
		for i=0,table.getn(Player)-1 do			
		if	CheckAcceptQuest( Player[i], 423010 ) == true	and	CheckBuff(  Player[i], 506265) == false		then  	
			AddBuff( Player[i], 506265, 0 , 20)
		end
	end
	--插入檢查
	if	CheckID( TargetID() )== false	 or (CheckAcceptQuest(TargetID(),423010)==false) 	then	--TargetID() 是玩家
		DelObj(JS )	--刪除演戲傑斯
		DelObj(LAU )	--刪除演戲勞爾
		DelObj(JNO )	--刪除演戲傑諾
		DelObj(CARL )	--刪除演戲夜梟
		DelObj(NIGHT )	--刪除演戲午夜	
		CancelBuff( TargetID()  , 506265) 
		WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
		return
	end	

	Yell( JS , "[SC_423010_39]" , 3 )		--...是啊，你說的沒錯。那是一種執著的守護意念…比實質武器更強悍的意念，當初那場阻止魔族入侵的戰役，偉大的先祖就是用這樣的精神護衛人王。
	sleep(30)
	
	Yell( JS , "[SC_423010_40]" , 3 )		--永世效忠、輔佐人王的承諾，身為雷汀莫克里夫的後代，我們的目光竟然都如此短淺，怎麼能只看見艾翁而忽略整個薩維爾大陸的未來？
						
	local Player = SearchRangePlayer(LAU , 300)			--給旗標
		for i=0,table.getn(Player)-1 do
				--say(Player[i],"88888")	
			CancelBuff( Player[i], 506265) 		
		if	CheckAcceptQuest( Player[i], 423010 ) == true	then  	
			SetFlag(Player[i], 543720 , 1)
		end
	end
	DelObj( LAU)
	DelObj( JNO)
	DelObj( JS)
	DelObj( CARL)
	DelObj( NIGHT)
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
end

function LuaS_423010_3()
	sleep(10)
	LuaFunc_MoveToFlag( OwnerID(),780459,8,0)		
	LuaFunc_MoveToFlag( OwnerID(),780459,9,0)	
	LuaFunc_MoveToFlag( OwnerID(),780459,10,0)	
	LuaFunc_MoveToFlag( OwnerID(),780459,12,0)	
end

function LuaS_423010_5()
	LuaFunc_MoveToFlag( OwnerID(),780459,9,0)	
	LuaFunc_MoveToFlag( OwnerID(),780459,10,0)	
end

function LuaS_423010_6()
	LuaFunc_MoveToFlag( OwnerID(),780459,14,0)	
	LuaFunc_MoveToFlag( OwnerID(),780459,15,0)	
end

----------達拉尼斯王城423012

--function LuaS_423012_0()	--放進蘭斯的對話劇情
--	if	(CheckAcceptQuest(OwnerID(),423012)==true )and( CheckCompleteQuest( OwnerID(),423012)==false)	then
--		AddSpeakOption(OwnerID(),TargetID(),"[SC_423012_0]","LuaS_423012_1",0)	--我應該要知道什麼？
--	end
--end

function LuaS_423012_1()
	SetSpeakDetail(OwnerID(),"[SC_423012_1]")				--這裡，是人王所在的達拉尼斯城，。
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423012_2]","LuaS_423012_2",0)	--「艾翁」是六大領主國其中一個？
end

function LuaS_423012_2()
	SetSpeakDetail(OwnerID(),"[SC_423012_3]")			--嗯，艾翁是其中一個，也是一直以來最忠誠的。					
	SetFlag( OwnerID() , 543719, 1 )
end