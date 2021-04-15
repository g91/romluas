----午夜的助手叫出午夜
function LuaS_114770()	
	LoadQuestOption( OwnerID() )				
	if	CheckAcceptQuest( OwnerID() ,422981 ) == true	then
		if	CheckAcceptQuest( OwnerID() ,423024 ) == true	or
			CheckAcceptQuest( OwnerID() ,423025 ) == true	then
				AddSpeakOption( OwnerID(), TargetID( ), "[SC_114770]" , "LuaS_114770_1", 0 )	--請問老闆午夜在嗎？
		elseif	CheckCompleteQuest( OwnerID() ,423025 ) == false	and
			CheckCompleteQuest( OwnerID() ,423024 ) == true	then
				AddSpeakOption( OwnerID(), TargetID( ), "[SC_114770]" , "LuaS_114770_1", 0 )	--請問老闆午夜在嗎？
		else
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_114770]" , "LuaS_114770_0", 0 )		--請問老闆午夜在嗎？
		end
	end
end

function LuaS_114770_0()	
	CloseSpeak( OwnerID() )
	DisableQuest(TargetID() ,true )
	BeginPlot( TargetID() , "LuaS_114770_Show" , 0 )
end

function LuaS_114770_show()	
	local MN = Lua_DW_CreateObj("flag" , 114592 ,780578 , 1 )		--種出午夜	
	MoveToFlagEnabled( MN , false )
	Say( MN , "[SC_114770_3]")				--找小的嗎？嘿嘿嘿嘿～
	LuaFunc_MoveToFlag( MN , 780578 , 2 ,  0 )
	sleep(600)
	Say( MN , "[SC_114770_4]")				--小的先離開一下....
	LuaFunc_MoveToFlag( MN , 780578 , 1 ,  0 )
	Delobj( MN )
	DisableQuest(OwnerID() ,false )
end

function LuaS_114770_1()	
	SetSpeakDetail(OwnerID(),"[SC_114770_2]")		--老闆他正在忙！有事找他請稍等。	
end



------遺失的「銀色眼球」
function LuaS_114763()	--馬龍嘍囉的箱子
	LoadQuestOption( OwnerID() )
	if	CheckCompleteQuest( OwnerID() ,422965 ) == true	and
		CheckCompleteQuest( OwnerID() ,423160 ) == false	and
		CountBodyItem( OwnerID(), 206813 )<1		then 
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_114763]" , "LuaS_114763_1", 0 )	--請問你知道酒館老闆的「銀色眼球」到哪去了嗎？ 
	end
end

function LuaS_114763_1()	
	GiveBodyItem( OwnerID(), 206813, 1 )
	CloseSpeak( OwnerID() )
end

function LuaS_206813()
	ClearBorder( OwnerID());	--初始化石碑介面
	AddBorderPage( OwnerID(), GetQuestDetail( 423160, 1 ));
	local str = "["..GetUseItemGUID(OwnerID()).."]"
	ShowBorder( OwnerID(), 423160,str ,"ScriptBorder_Texture_Paper" )	
end	


------遺失的「銀色眼球」
function LuaS_422965_1()	--喝醉的比爾
	LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest( OwnerID() ,422965 ) == true	then 
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_422965_0]" , "LuaS_422965_1_Answer", 0 )	--請問你知道酒館老闆的「銀色眼球」到哪去了嗎？ 
	end
end
	
function LuaS_422965_1_Answer()	
	SetSpeakDetail(OwnerID(),"[SC_422965_1]")	--哈哈哈！你說那顆「銀色眼球」不見了啊？...嗝！
	SetFlag(OwnerID() , 543664 , 1 )
end

function LuaS_422965_2()	--嫵媚瑪麗
	LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest( OwnerID() ,422965 ) == true	then 
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_422965_0]" , "LuaS_422965_2_Answer", 0 )	--請問你知道酒館老闆的「銀色眼球」到哪去了嗎？ 
	end
end

function LuaS_422965_2_Answer()	
	SetSpeakDetail(OwnerID(),"[SC_422965_2]")	--嗯～你說酒館老闆的「銀色眼球」不見了呀～
	SetFlag(OwnerID() , 543665 , 1 )
end

function LuaS_422965_3()	--落魄勇者唐吉
	LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest( OwnerID() ,422965 ) == true	then 
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_422965_0]" , "LuaS_422965_3_Answer", 0 )	--請問你知道酒館老闆的「銀色眼球」到哪去了嗎？ 
	end
end

function LuaS_422965_3_Answer()	
	SetSpeakDetail(OwnerID(),"[SC_422965_3]")	--哼！這還需要說嗎？一定是那些騎士團拿走的！
	SetFlag(OwnerID() , 543666 , 1 )
end

function LuaS_422965_4()	--老摩姆海德
	LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest( OwnerID() ,422965 ) == true	then 
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_422965_0]" , "LuaS_422965_4_Answer", 0 )	--請問你知道酒館老闆的「銀色眼球」到哪去了嗎？ 
	end
end

function LuaS_422965_4_Answer()	
	SetSpeakDetail(OwnerID(),"[SC_422965_4]")	--那顆眼球會被盜我可是一點也不意外
	SetFlag(OwnerID() , 543667 , 1 )
end

function LuaS_422965_5()	--萊慕人
	LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest( OwnerID() ,422965 ) == true		and
		CheckFlag(OwnerID() , 543668 ) == false 		then 
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_422965_5]" , "LuaS_422965_5_Answer", 0 )	--豺狼人？
	end
end

function LuaS_422965_5_Answer()	
	CloseSpeak( OwnerID() )
	DisableQuest(TargetID() ,true )
	BeginPlot( TargetID() , "LuaS_422965_5_Show" , 0 )
end

function LuaS_422965_5_Show()
	Say(OwnerID() , "[SC_422965_6]")	--你說什麼？豺狼人？	
	sleep(30)
	Say(OwnerID() , "[SC_422965_7]")	--這是哪裡來的鄉巴佬？
	sleep(10)
	PlayMotion(OwnerID() , ruFUSION_ACTORSTATE_CAST_SP01)	--（萊慕人打人）
	AddBuff( TargetID() , 505965 , 1 , 120 )			--給玩家暈眩BUFF2分鐘
	SetFlag(TargetID() , 543668 , 1 )
	DisableQuest( OwnerID() , false )
end

function LuaS_422965_5_Show_1()
	local R = Rand( 2 ) 
	if	R == 1	then
		AddBuff( OwnerID() , 505967 , 1 , 6 )		--暈6秒	
	end
end


------422976阿凱跟約翰交接


function LuaS_422976_Complete()

	local John = LuaFunc_SearchNPCbyOrgID( OwnerID() , 114512 , 100 )		--取得約翰
	DisableQuest( John ,true )
	DisableQuest( OwnerID() ,true )
	BeginPlot( John , "LuaS_422976_Complete_John" , 0 )
end

function LuaS_422976_Complete_John()
	local KO = LuaFunc_SearchNPCbyOrgID( OwnerID() , 114508 , 100 )	--取得原本的阿凱
	local KK = LuaFunc_CreateObjByOBj( 114533 , KO )		--種出後來的阿凱
	MoveToFlagEnabled( KK , false )
	local Ni = Lua_DW_CreateObj("flag" , 114511 ,780541 , 2 )		--種出伊崔妮	
	MoveToFlagEnabled( Ni , false )
	LuaFunc_MoveToFlag( Ni , 780541 , 3 ,  0 )

	SetDefIdleMotion( Ni, ruFUSION_MIME_EMOTE_SPEAK)
	SetDefIdleMotion( KK, ruFUSION_MIME_EMOTE_SPEAK)


	Say( Ni , "[SC_422976_1]")			--凱，辛苦你了，接下來的訓練工作，就交給約翰吧！
	sleep(30)
	Say( KK , "[SC_422976_2]")			--雖然很捨不得這些可愛的學生們，不過，約翰，我就把他們交給你了！我知道你會好好愛護他們，教導他們的。
	sleep(30)
	SetDefIdleMotion( KK, ruFUSION_MIME_NONE)
	SetDefIdleMotion( OwnerID(), ruFUSION_MIME_EMOTE_SPEAK)
	Say( OwnerID() , "[SC_422976_3]")		--凱，沒關係的，如果你覺得捨不得，這些學生還是由你來教導好了...
	sleep(20)
	Say( Ni , "[SC_422976_4]")			--別想再推卸責任...
	sleep(30)
	Say( OwnerID() , "[SC_422976_5]")		--好好好，別生氣...
	sleep(30)
	Say( Ni , "[SC_422976_6]")			--嗯......約翰，我明白你的意思...
	sleep(20)
	Say( OwnerID() , "[SC_422976_7]")		--咳...咳....那個...時間不多，我們開始進行訓練課程吧！
	SetDefIdleMotion( OwnerID(), ruFUSION_MIME_NONE)
	sleep(30)
	Say( KK , "[SC_422976_8]")			--我可愛的學生們～...
	sleep(30)

	SetDefIdleMotion( Ni, ruFUSION_MIME_NONE)
	
	

	BeginPlot( Ni , "LuaS_422976_Complete_Cancel" , 0 )
	BeginPlot( KK , "LuaS_422976_Complete_Cancel" , 0 )
	DisableQuest( OwnerID() , false )
	DisableQuest( KO , false )
end

function LuaS_422976_Complete_Cancel()
	LuaFunc_MoveToFlag( OwnerID() , 780541 , 4 ,  0 )
	Delobj( OwnerID() )
end

------歡迎光臨午夜的店，約翰：114534
function LuaS_422978_John()
	LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest( OwnerID() ,422978 ) == true	then 
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_422978_1]" , "LuaS_422978_1", 0 )	--這麼有趣的地方啊？那我們趕快進去吧！
	end

	if	CheckAcceptQuest( OwnerID() ,422979 ) == true	and
		CountBodyItem( OwnerID(), 206930 )<1	then 
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_422979_1]" , "LuaS_422979_1", 0 )	--請問我被分配去哪調查？
	end
end

function LuaS_422978_1()
	CloseSpeak( OwnerID() )
	DisableQuest(TargetID() ,true )
	BeginPlot( TargetID() , "LuaS_422978_2" , 0 )
	Hide( TargetID() )
end

function LuaS_422978_2()
	local John = LuaFunc_CreateObjByOBj( 114950 , OwnerID() )
	local MN = Lua_DW_CreateObj("flag" , 114717 ,780567 , 1 )		--種出午夜	
	MoveToFlagEnabled( MN , false )
	MoveToFlagEnabled( John , false )
	WriteRoleValue(John , EM_RoleValue_IsWalk, 1 )	
	Hide( John )
	Show( John ,0)
	Lua_Drama_Radar( John ,422978)
	LuaFunc_MoveToFlag( John , 780567 , 5 ,  0 )
	LuaFunc_MoveToFlag( John , 780567 , 2 ,  0 )
	AdjustFaceDir( John , MN, 0 )
	if Lua_Check_Drama_Statu( John ) == false then
		DelObj( John )
		DelObj( MN )
		Show( OwnerID() ,0)
		DisableQuest(OwnerID() ,false )
		return
	end
	Say( MN , "[SC_422978_2]")				--歡迎光臨～霍夫曼爵士，小的恭候您多時啦～
	PlayMotion( MN , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	Say( John , "[SC_422978_3]")			--據說葬儀社的老闆非常忙碌，常不在店裡，怎麼每次我來的時候，老闆總是在家呢？
	PlayMotion( John , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	Say( MN , "[SC_422978_4]")				--霍夫曼家總是會帶來讓人耳目一新的藝術品，對小的而言可是貴客唷！嘿嘿嘿嘿....
	PlayMotion( MN , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	Say( MN , "[SC_422978_5]")				--況且，您身上散發的死神氣味，小的可是大老遠就聞到了～
	sleep(30)
	Say( John , "[SC_422978_6]")			--死神的氣味啊～從對於屍體十分狂熱的老闆口中聽到這樣的稱讚，真是讓我「受寵若驚」呢！
	sleep(30)
	if Lua_Check_Drama_Statu( John ) == false and Lua_Check_Drama_Statu( MN ) == false then
		DelObj( John )
		DelObj( MN )
		Show( OwnerID() ,0)
		DisableQuest(OwnerID() ,false )
		return
	end
	Say( MN , "[SC_422978_7]")				--嘿嘿嘿嘿....爵士前幾天送來的「藝術品」，不就是個上等好貨，讓小的可是愛不釋手，兩夜沒睡，整日與「他」纏綿呢～
	PlayMotion(  MN ,ruFUSION_ACTORSTATE_EMOTE_LAUGH)
	sleep(30)
	Say( John , "[SC_422978_8]")			--喔～有纏綿出什麼結果嗎？
	PlayMotion( John , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	Say( MN , "[SC_422978_9]")				--小的在「他」的指尖嗅到濃濃的人王的錢幣味道......
	sleep(30)
	Say( MN , "[SC_422978_10]")			--嘿嘿嘿嘿～這種到達旅途終點時所湧現的執著，可是人類最美麗燦爛的一刻啊！
	sleep(30)
	Say( John , "[SC_422978_11]")			--濃濃的人王錢幣味道？....一個達拉尼斯城遊民身上出現大量的錢幣，這可真是件耐人尋味的事情......
	sleep(30)
	if Lua_Check_Drama_Statu( John ) == false then
		DelObj( John )
		DelObj( MN )
		Show( OwnerID() ,0)
		DisableQuest(OwnerID() ,false )
		return
	end
	Say( John , "[SC_422978_12]")			--還有其他的發現嗎？
	PlayMotion( John , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	Say( MN , "[SC_422978_13]")			--小的還在「他」體內發現一種特殊藥水殘留，腹部發現一道美麗的新鮮刀痕。
	sleep(30)
	Say( John , "[SC_422978_14]")			--刀痕？發現「他」的地方可沒見到大量血跡，甚至連「他」的衣服上都沒有沾到半滴血吶！這是怎麼回事......
	sleep(30)
	Say( MN , "[SC_422978_15]")			--是啊～身體在還活繃亂跳時被劃開，卻沒有流出半滴血，小的也是第一次看見這樣的情況，真是興奮地睡不著啊～嘿嘿嘿嘿.....
	PlayMotion( MN , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	Say( MN , "[SC_422978_16]")			--小的猜測，這種現象，或許跟那特殊藥水有關係，畢竟在達拉尼斯城裡，還有什麼奇怪的事情不會發生呢？
	sleep(30)
	if Lua_Check_Drama_Statu( John ) == false then
		DelObj( John )
		DelObj( MN )
		Show( OwnerID() ,0)
		DisableQuest(OwnerID() ,false )
		return
	end
	Say( John , "[SC_422978_17]")			--這樣啊.....那我可得好好調查一番～謝啦！每次與你的會面總是這麼「有趣」......
	sleep(30)
	Say( MN , "[SC_422978_18]")			--小的也是非常高興能跟霍夫曼爵士相聚啊～在您身邊總是有許多稀有珍貴的藝術品出現，小的這家店，可是永遠為爵士您敞開大門...不過您帶來的這些小朋友們......
	sleep(30)
	Say( MN , "[SC_422978_19]")			--這家店裡的「貴賓」實在不喜歡有人注意他們的東西呀～不管是用眼神或是真的動手碰都一樣，嘿嘿嘿嘿......		
	
	local Star = Lua_DW_CreateObj("flag" , 114718 ,780567 , 3 )		--種出晨星	
	MoveToFlagEnabled( Star , false )
	LuaFunc_MoveToFlag( Star , 780567 , 4 ,  0 )

	Say( Star , "[SC_422978_20]")			--不要輕舉妄動，朋友，招惹亡靈比你想像中的嚴重多了。		
	sleep(30)
	PlayMotion(Star , ruFUSION_ACTORSTATE_EMOTE_POINT)
	Say( Star , "[SC_422978_21]")			--我看到某些光芒四散，殞落於黑暗之中。
	sleep(30)
	Say( Star , "[SC_422978_22]")			--午夜，看來接下來某些小朋友就要成為你的「貴賓」了。
	sleep(30)
	if Lua_Check_Drama_Statu( John ) == false then
		DelObj( John )
		DelObj( MN )
		DelObj( Star )
		Show( OwnerID() ,0)
		DisableQuest(OwnerID() ,false )
		return
	end	
	Say( John , "[SC_422978_23]")			--咳.....那......我們先離開了......
	sleep(30)
	Say( MN , "[SC_422978_24]")			--嘿嘿嘿嘿......霍夫曼爵士，再告訴您一件事，「他」的鞋子上沾有一些特殊泥土，這可是達拉尼斯城的「那個地方」才有的唷！	
	PlayMotion(  MN ,ruFUSION_ACTORSTATE_EMOTE_LAUGH)
	sleep(30)
	Say( John , "[SC_422978_25]")			--嗯，我會去那裡調查的....願您.....「生意興隆」...呃～我想，這麼說可能對達拉尼斯城不是件好事啊！	
	PlayMotion( John , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	Say( MN , "[SC_422978_26]")			--嘻嘻！	
	BeginPlot( MN , "LuaS_422978_MNDead" , 0 )
	BeginPlot( Star , "LuaS_422978_StarDead" , 0 )
	
	local Party = LuaFunc_PartyData(TargetID())
	for i = 1 , Party[0] , 1 do
		if 	CheckAcceptQuest( Party[i] , 422978 ) == true and
 			CheckFlag(Party[i] , 543736 ) == false and
			GetDistance(Party[i] , OwnerID() ) < 200 and 
			ReadRoleValue(Party[i] ,EM_RoleValue_IsDead) == 0 then
			SetFlag(Party[i] , 543736 , 1 )
		end
	end
	sleep(20)
	LuaFunc_MoveToFlag( John , 780567 , 5 ,  0 )
	LuaFunc_MoveToFlag( John , 780567 , 6 ,  0 )
	Delobj( John )
	sleep(20)
	Show( OwnerID() ,0)
	DisableQuest(OwnerID() ,false )
end

function LuaS_422978_MNDead()
	sleep(50)
	Delobj( OwnerID() )
end

function LuaS_422978_StarDead()
	sleep(50)
	Delobj( OwnerID() )
end


-------展開調查
function LuaS_422979_1()
	SetSpeakDetail(OwnerID(),"[SC_422979_2]")	
end

function LuaS_422979_2()

	if	ReadRoleValue( TargetID() ,EM_RoleValue_PID ) == 0	then
			BeginPlot( TargetID(), "LuaS_422979_3" , 0 )
			return true
	else
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_422804]", 0 )	--目標忙碌中
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422804]", 0 )
		return false
	end
end


function LuaS_422979_3()
	writerolevalue( OwnerID(), EM_RoleValue_PID , 1 )

	local Star = CreateObjByFlag( 114722 , 780573 , 1 , 0 )		--晨星
	AddToPartition( Star , 0 )
	local Tony = CreateObjByFlag( 114719 , 780573 , 2 , 0 )		--湯尼
	AddToPartition( Tony , 0 )
	MoveToFlagEnabled( Star , false )
	MoveToFlagEnabled( Tony , false )

	
	LuaFunc_MoveToFlag( Tony , 780573 , 4 ,  0 )
	Say(Tony , "[SC_422979_3]")					--這次我一定要早蘭...呃......早那個人一步查出真相！
	LuaFunc_MoveToFlag( Star , 780573 , 3 ,  0 )
	sleep(30)
	Say(Tony , "[SC_422979_4]")					--咦？有人！
	PlayMotion( Tony , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(20)
	Say(Tony , "[SC_422979_5]")					--糟糕！怎麼會有見習騎士在這裡，要是被發現我偷溜出來......	
	sleep(30)
	AdjustFaceDir( Tony , Star, 0 )
	Say(Tony , "[SC_422979_6]")					--謝謝你陪我走這一趟，不過，我想我晚一點再過來好了......	
	PlayMotion( Tony , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	LuaFunc_MoveToFlag( Tony , 780573 , 2 ,  0 )
	Delobj( Tony )
	LuaFunc_MoveToFlag( Star , 780573 , 1 ,  0 )
	Delobj( Star )

	writerolevalue( OwnerID() , EM_RoleValue_PID , 0 )
end

function LuaS_422983()
	SetSpeakDetail(OwnerID(),"[SC_422983_1]")		--你不需要多做闡述，所有的過程我都聽[114534]報告過了！
	SetFlag(OwnerID() , 543739 , 1 )			
end

----------沼地裡的豬打馬龍780577

function LuaS_114752()
	LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest( OwnerID() ,422967 ) == true	and
		CheckFlag( OwnerID() , 543789) == false	then 
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_422967_12]" , "LuaS_114752_1", 0 )	--把[114507]的東西交出來！
	end	
end

function LuaS_114752_1()
	CloseSpeak( OwnerID() )
	DisableQuest(TargetID() ,true )
	BeginPlot( TargetID() , "LuaS_114752_Fight" , 0 )
end

function LuaS_114752_Fight()

	local NPC1 = LuaFunc_CreateObjByOBj( 103168 , OwnerID() )
	local NPC2 = Lua_DW_CreateObj("flag" , 103168 ,780577 , 1 )	
	local NPC3 = Lua_DW_CreateObj("flag" , 103168 ,780577 , 2 )	
	AddToPartition( NPC1 , 0 )
	AddToPartition( NPC2 , 0 )
	AddToPartition( NPC3 , 0 )
	SetAttack(NPC1,TargetID())
	SetAttack(NPC2,TargetID())
	SetAttack(NPC3,TargetID())

	BeginPlot( NPC1 , "LuaS_114752_2" , 0 )
	BeginPlot( NPC2 , "LuaS_114752_2" , 0 )
	BeginPlot( NPC3 , "LuaS_114752_2" , 0 )
	Hide(OwnerID())
	for i = 0 , 100 , 1 do
		if	CheckID(NPC1) == false	and	
			CheckID(NPC2) == false	and
			CheckID(NPC3) == false	then
			break
		end
		sleep( 30 )
	end
	Show( OwnerID() , 0 )
	DisableQuest(OwnerID() ,false )
end

function LuaS_114752_2()

	SetPlot(OwnerID(),"dead","LuaS_114752_3",0 )	--怪死掉後觸發死亡劇情

	while true do
		if	ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID ) ~= 0	and 
			CheckID( OwnerID() ) == true				then  --檢查是否離開戰鬥
			Sleep( 20 )
		else
			if CheckID( OwnerID() ) == true	then	
				DelObj( OwnerID() )	
			end 
			break
		end
	end
end

function LuaS_114752_3()
	local Player 
	for i=0, HateListCount( OwnerID() )-1 do
		Player = HateListInfo(OwnerID() , i , EM_HateListInfoType_GItemID )
		if	CheckAcceptQuest ( Player   , 422967 ) == true	then
			SetFlag( Player   , 543789, 1 )
		end	
	end	
	return true
end












