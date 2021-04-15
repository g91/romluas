-----布拉村傑斯種出夜梟
function LuaS_114366_Born()
	local Car = Lua_DW_CreateObj("flag" , 114563 ,780560 , 1 )	--傑斯種出夜梟
	WriteRoleValue ( OwnerID() , EM_RoleValue_PID, Car )
	WriteRoleValue ( Car , EM_RoleValue_PID, OwnerID() )		
end

----老陳碎碎念
function LuaS_422997()	
	LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest( OwnerID() ,422997 ) == true	then 
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_422997_0]" , "LuaS_422997_Answer", 0 )	--艾翁現在是怎麼回事？為何要封城？ 
	end
end

function LuaS_422997_Answer()	
	SetSpeakDetail(OwnerID(),"[SC_422997_1]")						--唉～艾翁是六大領主國之一，早在幾千年前...
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_422997_2]" , "LuaS_422997_Answer_1", 0 )	--維多利亞夫人？是傑斯的母親嗎？
end

function LuaS_422997_Answer_1()	
	SetSpeakDetail(OwnerID(),"[SC_422997_3]")						--前任領主與露易絲夫人生下傑斯少爺時...
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_422997_4]" , "LuaS_422997_Answer_2", 0 )	--談談勞爾跟傑諾兩位少爺吧。
end

function LuaS_422997_Answer_2()	
	SetSpeakDetail(OwnerID(),"[SC_422997_5]")						--說到這兩位少爺，我的心中又有無限感慨...
	SetFlag(OwnerID() , 543703 , 1 )
end

------傑諾的對話

function LuaS_422998()	
	LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest( OwnerID() ,422998 ) == true	then 
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_422998_0]" , "LuaS_422998_1", 0 )	--傑諾爵士，我謹代表達拉尼斯城...
	end
	if	CheckAcceptQuest( OwnerID() ,423002 ) == true	then 
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_423002_1]" , "LuaS_423002_1", 0 )	--傑諾少爺，發生什麼事了？
	end
end

function LuaS_422998_1()	
	SetSpeakDetail(OwnerID(),"[SC_422998_1]")							--親愛的使節先生，實在抱歉...						
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_422998_2]" , "LuaS_422998_2", 0 )			--勞爾爵士為什麼要這麼做？
end

function LuaS_422998_2()	
	SetSpeakDetail(OwnerID(),"[SC_422998_3]")							--哼！我想他是擔心我把他的暴行向達拉尼斯城報告...						
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_422998_4]" , "LuaS_422998_3", 0 )			--勞爾爵士的想法真讓人遺憾。
end

function LuaS_422998_3()	
	SetSpeakDetail(OwnerID(),"[SC_422998_5]")							--可不是嗎？使節先生，請原諒我在您面前抱怨這些...				
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_422998_6]" , "LuaS_422998_4", 0 )			--您有跟勞爾爵士談過這樣的事嗎？
end

function LuaS_422998_4()	
	SetSpeakDetail(OwnerID(),"[SC_422998_7]")							--當然談過，還不只一次，我們幾乎每次溝通到這些...		
	SetFlag(OwnerID() , 543723 , 1 )
end

function LuaS_422998_Complete()	
	DisableQuest( OwnerID() ,true )
	local Soldier = CreateObjByFlag( 114737 , 780548 , 1 , 0 )  --甲小兵
	WriteRoleValue( Soldier , EM_RoleValue_IsWalk , 0 )
	AddToPartition( Soldier , 0 )

	local KK = LuaFunc_CreateObjByOBj( 114594 , OwnerID() )			--種出傑諾
	WriteRoleValue(KK , EM_RoleValue_IsWalk, 0 )	
	Hide( KK )
	Show( KK ,0)
	

	MoveToFlagEnabled( Soldier , false )
	MoveToFlagEnabled( KK , false )
	sleep(10)
	Say( Soldier , "[SC_422998_8]")			--傑諾少爺，不好了！
	LuaFunc_MoveToFlag( Soldier , 780548 , 2 ,  0 )
	Say( KK , "[SC_422998_9]")				--發生什麼事？
	sleep(30)
	Say( Soldier , "[SC_422998_10]")			--[114595]因為趁[114557]少爺不在時擅闖房間
	sleep(30)
	Say( KK , "[SC_422998_11]")			--什麼！可惡的勞爾，我得去阻止他！
	sleep(20)
	LuaFunc_MoveToFlag( KK , 780548 , 3 ,  0 )
	Delobj( KK )
	LuaFunc_MoveToFlag( Soldier , 780548 , 3 ,  0 )	
	Delobj(Soldier )
	DisableQuest( OwnerID() ,false )
end

------傑諾發火

function LuaS_423002_1()	
	SetSpeakDetail(OwnerID(),"[SC_423002_2]")							--我已經不只一次從母親口中得知...			
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_423002_3]" , "LuaS_423002_2", 0 )			--勞爾少爺真的這麼做了？	
end

function LuaS_423002_2()	
	SetSpeakDetail(OwnerID(),"[SC_423002_4]")							--果然我才剛離開母親的房間，就看見勞爾走過來...		
	SetFlag(OwnerID() , 543734 , 1 )
end

-------被小人偷襲
function LuaS_423003()	
	LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest( OwnerID() ,423003 ) == true	and
		CheckFlag( OwnerID() , 543735) == false	then 
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_423003_1]" , "LuaS_423003_1", 0 )	--勞爾爵士，我想請問你關於剛剛發生的事...
	end
end

function LuaS_423003_1()	
	CloseSpeak( OwnerID() )
	DisableQuest(TargetID() ,true )
	BeginPlot( TargetID() , "LuaS_423003_2" , 0 )
end

function LuaS_423003_2()	
	local NPC = LuaFunc_CreateObjByOBj( 114395, OwnerID() )
	Hide(OwnerID())
	WriteRoleValue( NPC , EM_RoleValue_PID , TargetID() )

	BeginPlot( NPC , "LuaS_423003_3" , 0 )
	for i = 0 , 100 , 1 do
		if CheckID(NPC) == false or ReadRoleValue( NPC , EM_RoleValue_OrgID ) ~= 114395 then
			break
		end
		sleep( 60 )
	end
	Show( OwnerID() , 0 )
	DisableQuest(OwnerID() ,false )
end

function LuaS_423003_3()
	local SP = Lua_DW_CreateObj("flag" , 114633 ,780549 , 3 )				--種出奸臣
	MoveToFlagEnabled( OwnerID() , false )
	MoveToFlagEnabled( SP , false )

	LuaFunc_MoveToFlag( SP , 780549 , 4 ,  0 )
	Say( SP , "[SC_423003_2]")							--勞爾少爺，有些事情需要請您定奪...
	AdjustFaceDir( SP , OwnerID(), 0 )
	AdjustFaceDir( OwnerID() , SP, 0 )
	sleep(30)
	Say( OwnerID() , "[SC_423003_3]")						--好，我這就去。
	sleep(20)
	LuaFunc_MoveToFlag( OwnerID() , 780549 , 5 ,  0 )
	Hide( OwnerID() )
	sleep(20)
	Say( SP , "[SC_423003_4]")							--你這個外來者不該干涉太多的......
	sleep(30)
	Say( SP , "[SC_423003_5]")							--任何干涉艾翁太多的人，都該被剷除！
	sleep(30)
	LuaFunc_MoveToFlag( SP , 780549 , 3 ,  0 )
	Delobj( SP )


	local Player = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local Monster = {}
	local amount = 2
	local Group = {}

	For i=1, amount  do		--叫出殺手
		Monster[i] = CreateObjByFlag( 103496 , 780549 , i , 0 )  
		CallPlot( Monster[i] , "LuaFunc_Obj_Suicide" , 300 )
		AddToPartition( Monster[i] , 0 )
		SetPlot(Monster[i],"dead","LuaS_423003_4",0 )	--怪死掉後觸發死亡劇情
		SetAttack(Monster[i],Player)
		BeginPlot(Monster[i], "LuaS_423003_5" , 0 )
		Lua_Drama_Radar( Monster[i], 423003 )
	End

	for i = 0 , 100 , 1 do
		if	CheckID(Monster[1]) == false  and
			CheckID(Monster[2]) == false	then
			break
		end
		if	Lua_Check_Drama_Statu(Monster[1]) == false  and
			Lua_Check_Drama_Statu(Monster[2]) == false	then
			Delobj( Monster[1] )
			Delobj( Monster[2] )
			break
		end
		sleep( 20 )
	end

	Delobj( OwnerID() )
end

function LuaS_423003_4()		--怪死掉後觸發死亡劇情
	local Player 
	for i=0, HateListCount( OwnerID() )-1 do
		Player = HateListInfo(OwnerID() , i , EM_HateListInfoType_GItemID )
		if	CheckAcceptQuest ( Player   , 423003 )	then
			SetFlag( Player   , 543735, 1 )
		end	
	end	
	return true
end

function LuaS_423003_5()

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





-------奧力維爾之死
function LuaS_423004_Complete()
	local Car = ReadRoleValue(OwnerID(),EM_RoleValue_PID)		--取得夜梟
	DisableQuest( Car ,true )
	DisableQuest( OwnerID() ,true )

	SetDefIdleMotion( Car, ruFUSION_MIME_EMOTE_SPEAK)
	SetDefIdleMotion( OwnerID(), ruFUSION_MIME_EMOTE_SPEAK)


	Say( Car , "[SC_423004_1]")			--這事情看起來不單純，傑斯，你得振作起來處理它。
	sleep(30)
	Say( OwnerID() , "[SC_423004_2]")		--我明白，現在不是讓我繼續沈浸在哀傷中的時候......
	sleep(30)
	Say( OwnerID() , "[SC_423004_3]")		--我要找出背後的原因，不能讓奧力維爾死得不明不白。
	sleep(30)
	Say( Car , "[SC_423004_4]")			--恩，還有，傑斯，你得趕快派人去看顧奧力維爾的屍體，屍體可能會被急著處理掉。
	sleep(30)
	Say( OwnerID() , "[SC_423004_5]")		--處理？這是為什麼？
	sleep(30)
	Say( Car , "[SC_423004_6]")			--屍體會說話，把他死前經歷的事情，告訴可以解讀的人
	sleep(30)
	Say( OwnerID() , "[SC_423004_7]")		--我要怎麼知道奧力維爾死前發生什麼事？如何聽懂屍體要說什麼？
	sleep(30)
	Say( Car , "[SC_423004_8]")			--別擔心，我有一個好友擁有這方面的專長，但是他在達拉尼斯城，我得過去找他。
	sleep(30)
	Say( Car , "[SC_423004_9]")			--另外，我還需要能夠自由進出艾翁的通行證。
	sleep(30)
	Say( OwnerID() , "[SC_423004_10]")		--這沒問題，謝謝你願意幫助我，我的好友。
	SetDefIdleMotion( Car, ruFUSION_MIME_NONE)
	SetDefIdleMotion( OwnerID(), ruFUSION_MIME_NONE)


	sleep(10)
	DisableQuest( Car ,false )
	DisableQuest( OwnerID() ,false )	
end

function LuaS_423005_Complete()
	Addbuff( TargetID() , 506242, 1 , 60 )
	local Car = Lua_DW_CreateObj("flag" , 114708 ,780561 , 1 )	
	local MN = Lua_DW_CreateObj("flag" , 114707 ,780561 , 2 )	
	local Flag = 780561
	
	MoveToFlagEnabled( Car , false )
	MoveToFlagEnabled( MN , false )
	LuaFunc_MoveToFlag( MN , 780561 , 4 ,  0 )	
	AdjustFaceDir( MN , OwnerID(), 0 )

	Say( MN , "[SC_423005_1]")			--能讓你親自出馬，大老遠的把我拉來這，想必是非常令人興奮的「藝術品」吧？
	sleep(30)
	Say( Car , "[SC_423005_2]")			--以你的眼光，算是吧。
	sleep(30)
	Say( MN , "[SC_423005_3]")			--那我就不客氣，慢慢享用囉！嘿嘿嘿嘿～
	LuaFunc_MoveToFlag( Car , 780561 , 3 ,  0 )	
	sleep(5)
	AdjustFaceDir( Car , MN, 0 )

	sleep(30)
	Delobj( Car )
	Delobj( MN )
	if	CheckBuff( TargetID() , 506242) == true	 then
		CancelBuff( TargetID() , 506242)  
	end
end

--------勸說傑斯
function LuaS_114366_0()
	LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest( OwnerID() ,422995 ) == true	and
		CheckFlag( OwnerID() , 543737) == false	then 
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_422995_1]" , "LuaS_422995", 0 )	--你真的不打算回艾翁？
	end
	if	CheckAcceptQuest( OwnerID() ,422992 ) == true	and( CheckCompleteQuest( OwnerID(),422992 )==false) 	and
		CheckFlag( OwnerID() , 543698) == false	then 
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422992_1]","LuaS_422992_2",0)	--達拉尼斯城方面想了解，這次舉行的領主國會議
	end
	if	CheckAcceptQuest( OwnerID() ,422993 ) == true	and
		CheckFlag( OwnerID() , 543751) == false	then 
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_422993_0]" , "LuaS_422993_1", 0 )	--請帶我去認識布拉村的人們
	end
end

function LuaS_422995()
	CloseSpeak( OwnerID() )
	DisableQuest(TargetID() ,true )
	BeginPlot( TargetID() , "LuaS_422995_1" , 0 )
end

function LuaS_422995_1()
	local Car = ReadRoleValue(OwnerID(),EM_RoleValue_PID)		--取得夜梟
	DisableQuest( Car ,true )

	Say( OwnerID() , "[SC_422995_2]")			--哈哈～您可別聽大家說什麼領主領主的，也希望我回艾翁啊！
	local PA = Lua_DW_CreateObj("flag" , 114723 ,780574 , 1 )	
	local PB = Lua_DW_CreateObj("flag" , 114724 ,780574 , 2 )	
	MoveToFlagEnabled( PA , false )
	MoveToFlagEnabled( PB , false )
	LuaFunc_MoveToFlag( PA , 780574 , 3 ,  0 )
	LuaFunc_MoveToFlag( PB , 780574 , 4 ,  0 )

	Say( PA , "[SC_422995_3]")				--可是您才是最有能力成為領主，帶領艾翁的人啊！ 
	PlayMotion( PA , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	Say( PB , "[SC_422995_4]")				--沒錯！你的善良與敦厚，以及保護大家的決心，讓我們如此愛戴您，怎麼可以眼睜睜看著您的兄弟奪取您該得到的位置呢？
	PlayMotion( PB , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	Say( OwnerID() , "[SC_422995_5]")			--大家都誤會了！
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)	
	Say( OwnerID() , "[SC_422995_6]")			--我的弟弟們能力比我好太多了，勞爾統籌跟帶領的能力非常傑出，傑諾善體人意，體貼聰穎，艾翁交給他們，才會有安定的未來。
	sleep(30)
	Say( PA , "[SC_422995_7]")				--可是現在的艾翁一點都不安定，因為兩位王子的關係，權力鬥爭十分嚴重啊！	
	PlayMotion( PA , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	Say( OwnerID() , "[SC_422995_8]")			--這只是因為他們之間有一些誤會，過些時候誤會自然會解開，一起帶領艾翁邁向繁榮。
	sleep(30)
	Say( Car , "[SC_422995_9]")				--你等待的結果不會憑空出現。
	sleep(30)
	Say( OwnerID() , "[SC_422995_10]")			--卡爾？	
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SPEAK )	
	sleep(30)
	Say( Car , "[SC_422995_11]")			--需要有人主動介入，解決造成他們誤會的起因。		
	sleep(30)
	Say( OwnerID() , "[SC_422995_12]")			--奧力維爾待在艾翁裡，已經努力在進行這項工作了。		
	sleep(30)
	Say( Car , "[SC_422995_13]")			--這麼多年過去，你期待的結果並未出現。		
	PlayMotion( Car , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	Say( OwnerID() , "[SC_422995_14]")			--這....讓我想想，我瞭解大家說的，可是我答應過母后，我的離開可以讓事情變得比較單純，現在如果要再回到艾翁.....讓我想想.....	
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	Say( PA , "[SC_422995_15]")			--大家不是要逼您，我們親愛的傑斯‧莫克里夫領主，但是希望您可以把大家的話聽進去，認真思考可行性。		
	PlayMotion( PA , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	Say( PB , "[SC_422995_16]")			--我們先離開吧！給傑斯‧莫克里夫領主一個安靜的空間思考。
	PlayMotion( PB , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(20)	

	local Group = {}
	Group = SearchRangePlayer(OwnerID() , 350)	--搜尋附近玩家
	For i=0,table.getn(Group)-1 do
		if	CheckAcceptQuest( Group[i], 422995 )==true	then
			SetFlag(Group[i] , 543737 , 1)
		end
	end

	LuaFunc_MoveToFlag( PA , 780574 , 1 ,  0 )
	Delobj( PA )
	LuaFunc_MoveToFlag( PB , 780574 , 2 ,  0 )
	Delobj( PB )

	DisableQuest( Car , false )
	DisableQuest( OwnerID() , false )
end

-----晉見人王

function LuaS_423013_Complete()
	Addbuff( TargetID() , 506403, 1 , -1 )
	local KK = LuaFunc_SearchNPCbyOrgID( OwnerID() , 114961 , 100 )	
	Hide( OwnerID() )
	DisableQuest( KK ,true )
	local Jazz = Lua_DW_CreateObj("flag" , 114955 ,780588 , 1 )
	DisableQuest( Jazz ,true )
	MoveToFlagEnabled( Jazz , false )
	LuaFunc_MoveToFlag( Jazz , 780588 , 2 ,  0 )	
	AdjustFaceDir( Jazz , OwnerID(), 0 )

	Say( Jazz , "[SC_423013_1]")				--我來了！[114369]陛下
	sleep(20)
	PlayMotionEX( Jazz, ruFUSION_ACTORSTATE_CROUCH_BEGIN,ruFUSION_ACTORSTATE_CROUCH_LOOP)
	Say( KK , "[SC_423013_2]")			--[114955]爵士，很高興聽到你願意加入獅心騎士團的消息！
	sleep(30)
	Say( Jazz , "[SC_423013_3]")				--我會竭盡自己的力量，成為陛下的後盾，守護[ZONE_SAVILLEPLAINS]！這也是先祖的遺訓
	sleep(30)
	Say( KK , "[SC_423013_4]")			--你會是我很好的助力，為了[ZONE_SAVILLEPLAINS]的秩序，為了重返人王的榮耀！守護的工作就交給你了！
	sleep(20)
	Say( Jazz , "[SC_423013_5]")			--遵命！
	LuaFunc_MoveToFlag( Jazz , 780588 , 4 ,  0 )

	sleep(30)
	Delobj( Jazz )
	if	CheckBuff( TargetID() , 506403) == true	 then
		CancelBuff( TargetID() , 506403)  
	end
	Show( OwnerID() , 0 )
end












