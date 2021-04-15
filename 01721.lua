--布拉村、艾翁
-------------------422992 提出疑問

function LuaS_422992_1()				
--	AddSpeakOption(OwnerID(),TargetID(),"[SC_422992_1]","LuaS_422992_2",0)	--達拉尼斯城方面想了解，這次舉行的領主國會議，你因為什麼原因沒有代表艾翁出席？
end

function LuaS_422992_2()
	SetSpeakDetail(OwnerID(),"[SC_422992_2]")				--艾翁沒有出席領主國會議？！....我很抱歉，發生這種事情驚擾到大家，還讓您辛苦前來。
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422992_3]","LuaS_422992_3",0)	--弟弟們？
end

function LuaS_422992_3()
	SetSpeakDetail(OwnerID(),"[SC_422992_4]")				--對，勞爾．莫克里夫、傑諾．莫克里夫是我的弟弟，能力都非常優秀。
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422992_5]","LuaS_422992_4",0)	--不是你治理艾翁…那為什麼你會留在布拉村？
end

function LuaS_422992_4()
	SetSpeakDetail(OwnerID(),"[SC_422992_6]")				--離開艾翁，城內的狀況才能單純一點，等到大臣們看見勞爾和傑諾的治理能力，他們會全力支持的。
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422992_7]","LuaS_422992_5",0)	--為什麼艾翁阻止外人進入？
end

function LuaS_422992_5()
	SetSpeakDetail(OwnerID(),"[SC_422992_8]")				--勞爾和傑諾對彼此有些誤會，有時候有也會引發一些紛爭，暫時把艾翁封城，可以避免波及到外面。
	SetFlag( OwnerID() , 543698 , 1 )					--給旗標
end
 
----------布拉村盛會422994

function LuaS_422994_0()		--傑夫114702出生劇情	種出114703、114704	780458	1-2
	local SD = CreateObjByFlag( 114703 , 780458 , 1 , 1 )	 	
	AddToPartition(  SD , 0 )
	DisableQuest( SD , true )						--關閉對話
	MoveToFlagEnabled(SD , false )					--關閉巡邏
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register+1,SD )		--將史丹114703	寫進傑夫．塞勒裡

	local VE = CreateObjByFlag( 114704 , 780458 , 2 , 1 )	 	
	AddToPartition(  VE , 0 )
	DisableQuest( VE , true )						--關閉對話
	MoveToFlagEnabled(VE , false )					--關閉巡邏
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register+2,VE )		--將維克114704	寫進傑夫．塞勒裡
end
function LuaS_422994_1()	--接任務後執行
	local SD=ReadRoleValue( OwnerID() , EM_RoleValue_Register+1 ) 
	local VE=ReadRoleValue( OwnerID() , EM_RoleValue_Register+2 ) 
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_VICTORY)
	Yell( OwnerID() , "[SC_422994_0]" , 3 )				--傑斯領主萬歲！
	sleep(20)
	--PlayMotion( SD , ruFUSION_ACTORSTATE_EMOTE_HANDSTAND)
	PlayMotion( SD ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	--sleep(20)
	Yell( SD , "[SC_422994_1]" , 3 )					--快去請傑斯領主來喝酒～	
	sleep(10)	
	PlayMotion( VE ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( VE , "[SC_422994_2]" , 3 )					--對呀！請他先別忙了～
end

--點擊大叔後
function LuaS_422994_2()
		LoadQuestOption( OwnerID() )
	if	(CheckAcceptQuest(OwnerID(),422994)==true )and( CheckCompleteQuest( OwnerID(),422994)==false)	then
		if	(CheckFlag( OwnerID(), 543718)==false)		then
			SetFlag( OwnerID() , 543718, 1 )
		end			
	end
end

--大叔114705	
function LuaS_114705_99()
	while true do
		PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_PLAY_GUITAR)
		AddBuff( OwnerID() ,503012 ,1 ,-1 ) --特效 
		sleep(30)
		PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_PLAY_GUITAR)
		AddBuff( OwnerID() ,503012 ,1 ,-1 ) --特效 
	end
end

--------------------------422999勸阻！

function LuaS_422999_0()		
	LoadQuestOption( OwnerID() )
	if 	(CheckAcceptQuest(OwnerID(),422999)==true )and( CheckCompleteQuest( OwnerID(),422999)==false) then
		if	(CheckFlag( OwnerID(), 543713)==false)	and	(CheckFlag( OwnerID(), 543714)==false)	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422999_0]","LuaS_422999_1",0)			--勞爾．莫克里夫爵士，請手下留情！
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422999_19]","LuaS_422999_9",0) 		--[114557]爵士，我聽說艾翁國一向上下一心，今日兩位王子卻在這宏偉的王城裡反目相向，請問是為了何事？
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422999_32]","LuaS_422999_16",0) 		--[114557]爵士，請先冷靜下來。這一切或許只是誤會。要不要先詢問這位女士為何出現在你的房間裡，聽聽看她的理由？
		end
	end
	if 	(CheckAcceptQuest(OwnerID(),423000)==true )and( CheckCompleteQuest( OwnerID(),423000)==false) then
		if	(CheckFlag( OwnerID(), 543699)==false)	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423000_1]","LuaS_423000_2",0)	--我並不想引起我們之間的衝突，也沒有傷害艾翁的意思。
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423000_2]","LuaS_423000_3",0)	--勞爾．莫克里夫爵士，請注意你的態度！	
		end
	end
end

function LuaS_422999_1()
	SetSpeakDetail(OwnerID(),"[SC_422999_1]")						--你是那一位從達拉尼斯城來的使節吧？
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422999_2]","LuaS_422999_2",0)			--是的，艾翁沒有出席這次的領主國會議。
end

function LuaS_422999_2()
	SetSpeakDetail(OwnerID(),"[SC_422999_3]")						--領主國會議…這確實是我們的疏失，因為內亂的關係...我代表艾翁致歉，無論你需要什麼，我稍後會與你詳談。
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422999_4]","LuaS_422999_3",0)			--請你手下留情！
end

function LuaS_422999_3()
	SetSpeakDetail(OwnerID(),"[SC_422999_5]")						--使節大人，我不確定你是否清楚自己在做什麼，犯了罪就該接受刑罰
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422999_6]","LuaS_422999_4",0)			--那只是一個東西，不會比人命重要。
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422999_7]","LuaS_422999_4",0)			--沒有轉寰餘地？
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422999_8]","LuaS_422999_99",0)			--我明白了，這件事我不會再插手。
end

function LuaS_422999_4()
	SetSpeakDetail(OwnerID(),"[SC_422999_9]")						--我接到的訊息果然沒錯，「來自達拉尼斯城的使節」接受傑諾及他身邊大臣的接待，如今，你說出和他一樣的言論。
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422999_10]","LuaS_422999_5",0)			--你誤會了，我只是認為一條人命不該因此葬送。
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422999_17]","LuaS_422999_8",0)			--身為達拉尼斯城的使節，不是能如此輕易被收買或左右立場的，[114557]爵士。
end

function LuaS_422999_5()
	SetSpeakDetail(OwnerID(),"[SC_422999_11]")						--為什麼？如果這次放過她，那麼日後再有他人犯了相同情事，執法者該以什麼立場治罪？
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422999_12]","LuaS_422999_7",0)			--就因為身為達拉尼斯城的使節，有些話我不得不提醒你，勞爾．莫克里夫爵士。
end


--結果
function LuaS_422999_99()
	closespeak(OwnerID())
	SetFlag( OwnerID()   , 543713, 1 )		--得到勸說失敗旗標--TargetID是勞爾、OwnerID玩家
	SetFlag( OwnerID()   , 543710, 1 )
	if	ReadRoleValue( TargetID() , EM_RoleValue_Register+1 ) == 0	then		--設定成場上有NPC就不再種
		BeginPlot(TargetID()  , "LuaS_422999_100" , 0 )
		else
		return
	end
end

------

function LuaS_422999_7()
	SetSpeakDetail(OwnerID(),"[SC_422999_13]")						--請說。
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422999_14]","LuaS_422999_10",0)		--我認為以打碎王族物品來說，這名女子罪不致死，是艾翁的刑罰太重，但若就她是否意圖行刺來看，應該是尚不明朗的狀況，不是嗎？
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422999_15]","LuaS_422999_10",0)		--艾翁的強大來自團結，為了避免心懷不軌者趁機破壞、傷害，兩位爵士，可以先冷靜下來談一談嗎？
end

function LuaS_422999_8()
	SetSpeakDetail(OwnerID(),"[SC_422999_18]")						--那麼，你就更不應該插手艾翁的私事。
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422999_12]","LuaS_422999_7",0)			--就因為身為達拉尼斯城的使節，有些話我不得不提醒你，勞爾．莫克里夫爵士。
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422999_8]","LuaS_422999_99",0)		--我明白了，這件事我不會再插手。
end

function LuaS_422999_9()
	SetSpeakDetail(OwnerID(),"[SC_422999_20]")						--一名女子趁我不在時擅闖我的房間，意圖不明，因打碎前任領主遺留的貴重花瓶產生巨響被守衛抓住，而這些，是艾翁的私事，使節大人。
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422999_21]","LuaS_422999_11",0)		--但你方才是與傑諾．莫克里夫爵士正發生爭執吧？
end

function LuaS_422999_10()
											--TargetID是勞爾、OwnerID是玩家
	SetSpeakDetail(OwnerID(),"[SC_422999_15]")						--……或許…你說的沒錯，待我把這名女子的所有犯行都釐清之後，再處決也不遲。
	SetFlag( OwnerID()   , 543714, 1 )							--得到勸說成功旗標
	SetFlag( OwnerID()   , 543710, 1 )		
	if	ReadRoleValue( TargetID() , EM_RoleValue_Register+1 ) == 0 then			--設定成場上有NPC就不再種
		BeginPlot(TargetID()  , "LuaS_422999_101" , 0 )
		else
		return
	end
end
-------------------------------------------------------

function LuaS_422999_11()
	SetSpeakDetail(OwnerID(),"[SC_422999_22]")						--艾翁正值短暫分裂時期，我會盡快解決，無論如何，艾翁對達拉尼斯王城的關係是不會變的。
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422999_23]","LuaS_422999_12",0)		--感謝爵士的承諾，不過，能否請你聽我一言？
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422999_24]","LuaS_422999_13",0)		--既然已經得到艾翁承諾，我不會再對此事多加干涉。
end

function LuaS_422999_12()
	SetSpeakDetail(OwnerID(),"[SC_422999_13]")						--請說。
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422999_15]","LuaS_422999_14",0)		--艾翁的強大來自團結，為了避免心懷不軌者趁機破壞、傷害，兩位爵士，可以先冷靜下來談一談嗎？
end

function LuaS_422999_13()
	SetSpeakDetail(OwnerID(),"[SC_422999_22]")	--謝謝你的配合，使節大人。		--TargetID是勞爾、OwnerID是玩家
	SetFlag( OwnerID()   , 543713, 1 )		--得到勸說失敗旗標
	SetFlag( OwnerID()   , 543710, 1 )
	if	ReadRoleValue( TargetID() , EM_RoleValue_Register+1 ) == 0 then	--設定成場上有NPC就不再種
		BeginPlot(TargetID()  , "LuaS_422999_100" , 0 )
		else
		return
	end
end

function LuaS_422999_14()
	SetSpeakDetail(OwnerID(),"[SC_422999_26]")						--我一向是依法冷靜治事，
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422999_17]","LuaS_422999_15",0)		--身為達拉尼斯城的使節，不是能如此輕易被收買或左右立場的，[114557]爵士。
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422999_27]","LuaS_422999_15",0)		--[114557]爵士，身為達拉尼斯城的使節，我的立場是中立的，或者...莫非你不相信「大將軍」蘭斯？
end

function LuaS_422999_15()
	SetSpeakDetail(OwnerID(),"[SC_422999_28]")						--……
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422999_29]","LuaS_422999_22",0)		--再說，我並未阻止一位觸犯律法者接受她應得的裁決，而是覺得此事大有蹊蹺，正如你所說的，該名女子的意圖不明，你不覺得，此事有必要詳細追究下去嗎？
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422999_30]","LuaS_422999_22",0)		--如果你是真的想解決艾翁分裂的問題，釐清事情真相的重要性你一定很清楚，處決只是暫時被延遲，而不是取消。
end

function LuaS_422999_16()
	SetSpeakDetail(OwnerID(),"[SC_422999_33]")						--除了支吾其詞，強調她不是故意打碎花瓶，		
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422999_21]","LuaS_422999_11",0)		--但你方才是與傑諾．莫克里夫爵士正發生爭執吧？
end

function LuaS_422999_22()
											--TargetID是勞爾、OwnerID是玩家
	SetSpeakDetail(OwnerID(),"[SC_422999_35]")						--……或許…你說的沒錯，待我把這名女子的所有犯行都釐清之後，再處決也不遲。
	SetFlag( OwnerID()   , 543714, 1 )							--得到勸說成功旗標
	SetFlag( OwnerID()   , 543710, 1 )	
	if	ReadRoleValue( TargetID() , EM_RoleValue_Register+1 ) == 0 then			--設定成場上有NPC就不再種
		BeginPlot(TargetID()  , "LuaS_422999_101" , 0 )
		else
		return
	end
end

-----------------------------過程中點擊傑諾：
function LuaS_422999_23()
	LoadQuestOption( OwnerID() )
	if 	(CheckAcceptQuest(OwnerID(),422999)==true )and( CheckCompleteQuest( OwnerID(),422999)==false) then
		if	(CheckFlag( OwnerID(), 543713)==false)	and	(CheckFlag( OwnerID(), 543714)==false)	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422999_46]","LuaS_422999_23_1",0) --爵士...
		end
	end
end

function LuaS_422999_23_1()
		SetSpeakDetail(OwnerID(),"[SC_422999_36]")	--氣死我了！
							--如此的不近人情，竟然為了一個沒生命的花瓶想剝奪一條人命！
							--說什麼她是我的女人之一，還擅闖進他的房間意圖行刺？他的意思是要說我指使她去的嗎？
							--可惡的勞爾！
							--這樣還能說自己將是艾翁的統治者？
							--我無法放心把艾翁交給這種人！
end


---------------------------------------

function LuaS_422999_100()			---------勸說失敗
	if CheckID( TargetID() ) == true then				--參考505457--有BUFF看得見演戲--原本的CLIENT
		AddBuff( TargetID() , 506217, 0 , 60 )
	end
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+1 , 2 )
	local LAO2=ReadRoleValue( OwnerID() , EM_RoleValue_Register+9 ) 
	--local JJ2=ReadRoleValue( OwnerID() , EM_RoleValue_Register+8 ) 
	local WW1=ReadRoleValue( OwnerID() , EM_RoleValue_Register+7 ) 
	local WW2=ReadRoleValue( OwnerID() , EM_RoleValue_Register+6 ) 
	local WOMAN=ReadRoleValue( OwnerID() , EM_RoleValue_Register+5 ) 

	local WWBE1 = CreateObjByFlag( 114394, 780454 , 3 , 1 )	
	AddToPartition(  WWBE1 , 0 )
	DisableQuest( WWBE1 , true )					--關閉對話
	MoveToFlagEnabled(WWBE1 , false )					--關閉巡邏
	WriteRoleValue( WWBE1 ,EM_RoleValue_IsWalk , 1 )

	local WWBE2 = CreateObjByFlag( 114394, 780454 , 4 , 1 )	
	AddToPartition(  WWBE2 , 0 )
	DisableQuest( WWBE2 , true )					--關閉對話
	MoveToFlagEnabled(WWBE2 , false )					--關閉巡邏
	WriteRoleValue( WWBE2 ,EM_RoleValue_IsWalk , 1 )

	local WOMAN2= CreateObjByFlag( 114393, 780454 , 5 , 1 )	
	AddToPartition(  WOMAN2, 0 )
	PlayMotion( WOMAN2, ruFUSION_ACTORSTATE_CROUCH_BEGIN)
	DisableQuest( WOMAN2, true )					--關閉對話
	MoveToFlagEnabled(WOMAN2, false )					--關閉巡邏
	WriteRoleValue( WOMAN2,EM_RoleValue_IsWalk , 1 )

	local JJ3= CreateObjByFlag( 114758, 780454 , 2 , 1 )	
	WriteRoleValue ( JJ3 , EM_RoleValue_Register+1,LAO2 )
	AddToPartition(  JJ3, 0 )
	DisableQuest( JJ3, true )						--關閉對話
	MoveToFlagEnabled(JJ3, false )					--關閉巡邏
	WriteRoleValue( JJ3,EM_RoleValue_IsWalk , 1 )

	PlayMotion( LAO2,ruFUSION_ACTORSTATE_EMOTE_KISS)
	sleep(20)
	Yell( LAO2 , "[SC_422999_36]" , 3 )					--都不用再說了。
	sleep(10)
	AdjustFaceDir( LAO2 ,WOMAN2, 0 )
	PlayMotion( LAO2 , ruFUSION_ACTORSTATE_EMOTE_POINT)
	Yell( LAO2 , "[SC_422999_37]" , 3 )					--把她帶下去！送上處刑台！
	sleep(20)
	AdjustFaceDir( WWBE1 ,LAO2 , 0 )
	AdjustFaceDir( WWBE2 ,LAO2 , 0 )
	PlayMotion( WWBE1 ,ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	PlayMotion( WWBE2 ,ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	Yell( WWBE1 , "[SC_422999_39]" , 3 )					--是！
	Yell( WWBE2 , "[SC_422999_39]" , 3 )					--是！
	sleep(10)
	AdjustFaceDir( WWBE1 ,WOMAN2  , 0 )
	AdjustFaceDir( WWBE2 ,WOMAN2  , 0 )
	PlayMotion( WWBE1 ,ruFUSION_ACTORSTATE_SHIELD_BASH)			--2個衛兵做出揮舞動作
	PlayMotion( WWBE2 ,ruFUSION_ACTORSTATE_SHIELD_BASH)	
	PlayMotion( WOMAN2, ruFUSION_ACTORSTATE_CROUCH_END)	--女人站起	
	sleep(10)					
	BeginPlot(WWBE1 ,  "LuaS_114595_0" , 0 )					--和女人一起移動離開
	BeginPlot(WWBE2 , "LuaS_114595_1" , 0 )
	BeginPlot(WOMAN2  , "LuaS_114595_2" , 0 )
	BeginPlot(JJ3, "LuaS_114595_3" , 0 )
	sleep(60)
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+1 , 0 )
	if	CheckBuff( TargetID() , 506217) == true then
		CancelBuff( TargetID() , 506217)  
	end
end

function LuaS_114595_0()
	LuaFunc_MoveToFlag( OwnerID(),780454,6,0)
	DelObj( OwnerID())
end

function LuaS_114595_1()
	LuaFunc_MoveToFlag( OwnerID(),780454,7,0)
	DelObj( OwnerID())
end

function LuaS_114595_2()
	LuaFunc_MoveToFlag( OwnerID(),780454,8,0)
	DelObj( OwnerID())
end

function LuaS_114595_3()
	local LAO2=ReadRoleValue( OwnerID() , EM_RoleValue_Register+1 ) 
	AdjustFaceDir( OwnerID(),LAO2 , 0 )
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_POINT)
	sleep(10)
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_PARRY_BOW)
	sleep(10)
	LuaFunc_MoveToFlag( OwnerID(),780454,8,0)
	DelObj( OwnerID())
end

function LuaS_114595_99()	--薇倫婷的初始劇情
	LuaP_Crouch()
	--LuaP_Sitting()
end

-------------------------------------422999勸說成功

function LuaS_422999_101()				--成功
								--TargetID是玩家、OwnerID是勞爾
	if CheckID( TargetID() ) == true then				--參考505457--有BUFF看得見演戲--原本的CLIENT
		AddBuff( TargetID() , 506217, 0 , 60 )
	end
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+1 , 2 )
	local LAO2=ReadRoleValue( OwnerID() , EM_RoleValue_Register+9 ) 
	--local JJ2=ReadRoleValue( OwnerID() , EM_RoleValue_Register+8 ) 
	local WW1=ReadRoleValue( OwnerID() , EM_RoleValue_Register+7 ) 
	local WW2=ReadRoleValue( OwnerID() , EM_RoleValue_Register+6 ) 
	local WOMAN=ReadRoleValue( OwnerID() , EM_RoleValue_Register+5 ) 

	local WWBE1 = CreateObjByFlag( 114394, 780454 , 3 , 1 )	
	AddToPartition(  WWBE1 , 0 )
	DisableQuest( WWBE1 , true )					--關閉對話
	MoveToFlagEnabled(WWBE1 , false )					--關閉巡邏
	WriteRoleValue( WWBE1 ,EM_RoleValue_IsWalk , 1 )

	local WWBE2 = CreateObjByFlag( 114394, 780454 , 4 , 1 )	
	AddToPartition(  WWBE2 , 0 )
	DisableQuest( WWBE2 , true )					--關閉對話
	MoveToFlagEnabled(WWBE2 , false )					--關閉巡邏
	WriteRoleValue( WWBE2 ,EM_RoleValue_IsWalk , 1 )


	local WOMAN2= CreateObjByFlag( 114393, 780454 , 5 , 1 )	
	AddToPartition(  WOMAN2, 0 )
	DisableQuest( WOMAN2, true )					--關閉對話
	MoveToFlagEnabled(WOMAN2, false )					--關閉巡邏
	WriteRoleValue( WOMAN2,EM_RoleValue_IsWalk , 1 )

	local JJ3= CreateObjByFlag( 114758, 780454 , 2 , 1 )	
	WriteRoleValue ( JJ3 , EM_RoleValue_Register+1,LAO2 )
	AddToPartition(  JJ3, 0 )
	DisableQuest( JJ3, true )						--關閉對話
	MoveToFlagEnabled(JJ3, false )					--關閉巡邏
	WriteRoleValue( JJ3,EM_RoleValue_IsWalk , 1 )

	PlayMotion( LAO2,ruFUSION_ACTORSTATE_EMOTE_KISS)
	sleep(20)
	Yell( LAO2 , "[SC_422999_36]" , 3 )					--都不用再說了。
	sleep(10)
	AdjustFaceDir( LAO2 ,WOMAN2, 0 )
	PlayMotion( LAO2 , ruFUSION_ACTORSTATE_EMOTE_POINT)
	Yell( LAO2 , "[SC_422999_38]" , 3 )					--先把她帶下去，關進大牢
	sleep(20)
	AdjustFaceDir( WWBE1 ,LAO2 , 0 )
	AdjustFaceDir( WWBE2 ,LAO2 , 0 )
	PlayMotion( WWBE1 ,ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	PlayMotion( WWBE2 ,ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	Yell( WWBE1 , "[SC_422999_39]" , 3 )					--是！
	Yell( WWBE2 , "[SC_422999_39]" , 3 )					--是！
	sleep(10)
	AdjustFaceDir( WWBE1 ,WOMAN2, 0 )
	AdjustFaceDir( WWBE2 ,WOMAN2, 0 )
	
	PlayMotion( WWBE1 ,ruFUSION_ACTORSTATE_SHIELD_BASH)			--2個衛兵做出揮舞動作
	PlayMotion( WWBE2 ,ruFUSION_ACTORSTATE_SHIELD_BASH)	
	PlayMotion( WOMAN2, ruFUSION_ACTORSTATE_CROUCH_END)	--女人站起	
	sleep(10)					
	BeginPlot(WWBE1 ,  "LuaS_114595_0" , 0 )					--和女人一起移動離開
	BeginPlot(WWBE2 , "LuaS_114595_1" , 0 )
	BeginPlot(WOMAN2  , "LuaS_114595_2" , 0 )
	BeginPlot(JJ3, "LuaS_114595_3" , 0 )
	sleep(60)

	WriteRoleValue( OwnerID() , EM_RoleValue_Register+1 , 0 )
	if	CheckBuff( TargetID() , 506217) == true then
		CancelBuff( TargetID() , 506217)  
	end
end


---------------------------------出生劇情	旗子780454 1-5

function LuaS_114557_0()	--出生劇情--被種到遊戲上時，先種出演戲勞爾114600、傑諾114564--用CLIENT擋住
	local LAO2 = CreateObjByFlag( 114600 , 780454 , 1 , 1 )	 	
	AddToPartition(  LAO2 , 0 )
	DisableQuest( LAO2 , true )					--關閉對話
	MoveToFlagEnabled(LAO2 , false )				--關閉巡邏
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register+9,LAO2 )	--將勞爾2號寫進114557勞爾裡
	
	local JJ2 = CreateObjByFlag( 114392, 780454 , 2 , 1 )	 	
	AddToPartition(  JJ2 , 0 )
	DisableQuest( JJ2 , true )					--關閉對話
	MoveToFlagEnabled(JJ2 , false )					--關閉巡邏
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register+8,JJ2 )	--將傑諾2號寫進114557勞爾裡
	
	local WW1 = CreateObjByFlag( 114593, 780454 , 3 , 1 )	 	--衛兵1號
	AddToPartition(  WW1 , 0 )
	DisableQuest( WW1 , true )					--關閉對話
	MoveToFlagEnabled(WW1 , false )					--關閉巡邏
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register+7,WW1 )	--將衛兵1號寫進114557勞爾裡
	
	local WW2 = CreateObjByFlag( 114593 , 780454 , 4 , 1 )	 	--衛兵2號
	AddToPartition(  WW2 , 0 )
	DisableQuest( WW2 , true )					--關閉對話
	MoveToFlagEnabled(WW2 , false )					--關閉巡邏
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register+6,WW2 )	--將衛兵2號寫進114557勞爾裡
	
	local WOMAN = CreateObjByFlag( 114595 , 780454 , 5 , 1 )	--女人薇倫婷
	AddToPartition(  WOMAN , 0 )
	DisableQuest( WOMAN , true )					--關閉對話
	MoveToFlagEnabled(WOMAN , false )					--關閉巡邏
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register+5,WOMAN )	--將女人薇倫婷寫進114557勞爾裡
end
----------------423000勞爾的聲明

--function LuaS_423000_1()			
--	AddSpeakOption(OwnerID(),TargetID(),"[SC_423000_1]","LuaS_423000_2",0)	--我並不想引起我們之間的衝突，也沒有傷害艾翁的意思。
--	AddSpeakOption(OwnerID(),TargetID(),"[SC_423000_2]","LuaS_423000_3",0)	--勞爾．莫克里夫爵士，請注意你的態度！	
--end

function LuaS_423000_2()
	SetSpeakDetail(OwnerID(),"[SC_423000_3]")				--你恐怕不曉得，從你插手艾翁政事那一刻起，對艾翁就是一種負擔。
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423000_4]","LuaS_423000_4",0)	--勞爾．莫克里夫領主…
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423000_5]","LuaS_423000_4",0)  --我有自信可以幫助你們脫離現在的紛亂狀況。
end

function LuaS_423000_3()
	SetSpeakDetail(OwnerID(),"[SC_423000_6]")				--覺得我太過強勢、失禮？
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423000_7]","LuaS_423000_4",0)	--我沒有惡意…
end

function LuaS_423000_4()
	SetSpeakDetail(OwnerID(),"[SC_423000_8]")				--難道你沒有看見現在的分裂狀況嗎？
	SetFlag( OwnerID() , 543699 , 1 )					--給旗標
end

--------423000完成任務演戲	旗子：780452	1-4

function LuaS_423000_Complete()
	if CheckID( TargetID() ) == true then					--參考505457--有BUFF看得見演戲--原本的CLIENT
		AddBuff( TargetID() , 506240, 0 , 60 )
	end
	
	if ReadRoleValue( OwnerID() , EM_RoleValue_Register+1 ) > 0 then		--設定成場上有NPC就不再種
		return
	end
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 2 )
	local LAUR = Lua_DW_CreateObj("flag",114584,780452,1 )		--勞爾，勞爾原本的位置
	MoveToFlagEnabled(LAUR , false )
	WriteRoleValue( LAUR ,EM_RoleValue_IsWalk , 1 )
	local SPIN = Lua_DW_CreateObj("flag",114585,780452,2 )			--史賓瑟，種在勞爾不遠處
	MoveToFlagEnabled(SPIN , false )
	WriteRoleValue( SPIN ,EM_RoleValue_IsWalk , 1 )
	sleep(20)
	Yell( SPIN , "[SC_423000_9]" , 3 )					--領主大人！
	LuaFunc_MoveToFlag( SPIN,780452,3,0)					--走向勞爾

	PlayMotion( SPIN ,ruFUSION_ACTORSTATE_EMOTE_SALUTE2)  
	Yell( SPIN , "[SC_423000_10]" , 3 )					--很抱歉打擾你們談話，我有一件緊急的事要向您稟告。
	sleep(20)
	AdjustFaceDir( LAUR ,SPIN , 0 )
	PlayMotion( LAUR ,ruFUSION_ACTORSTATE_EMOTE_KISS)
	Yell( LAUR , "[SC_423000_11]" , 3 )					--你沒有打擾到我們，說吧！
	sleep(20)
	PlayMotion( SPIN ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( SPIN , "[SC_423000_12]" , 3 )					--是這樣的…傑諾大人或許會為今日您與他因為那名罪犯引起的爭執一事到維多莉亞王妃那裡告上一狀…
	sleep(30)
	PlayMotion( SPIN ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( SPIN , "[SC_423000_13]" , 3 )					--我擔心他如果扭曲事實…那恐怕會造成王妃對您的誤解…您知道的…這也不是他第一次這麼做了…
	sleep(30)
	PlayMotion( LAUR ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( LAUR , "[SC_423000_14]" , 3 )					--是啊…他總是如此像個任性孩子一般地不成熟，我去母后那裡一趟，這裡先交給你處理。
	sleep(20)
	PlayMotion( SPIN ,ruFUSION_ACTORSTATE_EMOTE_SALUTE2)  
	Yell( SPIN , "[SC_423000_15]" , 3 )					--是！
	sleep(10)
	LuaFunc_MoveToFlag( LAUR,780452,4,0)				--勞爾離開
	Delobj( LAUR )
	Delobj( SPIN )		
	CancelBuff( TargetID()  , 506240) 
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
end

---423001 史賓瑟忠告任務完成後演戲	780455	1-2
function LuaS_423001_com()

	if	ReadRoleValue( OwnerID() , EM_RoleValue_Register+2 ) > 0 then	--設定成場上有NPC就不再種
		return
	end
	if CheckID( TargetID() ) == true then				--參考505457--有BUFF看得見演戲--原本的CLIENT
		AddBuff( TargetID() , 506241 , 0 , 15 )
	end
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+2 , 2 )
	local JJ3 = Lua_DW_CreateObj("flag",114601,780455,1 )		
	MoveToFlagEnabled(JJ3 , false )
	WriteRoleValue( JJ3 ,EM_RoleValue_IsWalk , 1 )
	sleep(20)
	PlayMotion( JJ3 ,ruFUSION_ACTORSTATE_EMOTE_ANGRY)		--生氣
	sleep(20)
	Yell( JJ3 , "[SC_423001_1]" , 3 )				--氣死我了！
	LuaFunc_MoveToFlag( JJ3,780455,2,0)				--走回位置上
	sleep(20)
	PlayMotion( JJ3 ,ruFUSION_ACTORSTATE_EMOTE_ANGRY)		--生氣
	sleep(10)
	Yell( JJ3 , "[SC_423001_2]" , 3 )				--該死的獨斷獨行！
	sleep(20)
	Delobj( JJ3 )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+2 , 0 )
	if	CheckBuff( TargetID() , 506241) == true then
		CancelBuff( TargetID() , 506241)  
	end				
end


