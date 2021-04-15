---萊斯明的對話劇情
function LuaS_113625()

	if	CheckBuff( OwnerID() , 502462)== true	then
		if	(CountBodyItem( OwnerID(), 206150 )>0 )	then
				SetSpeakDetail(OwnerID(),"[SC_422789_9]")	--啊！這是巴菲的玩具球......
				DelBodyItem(OwnerID() , 206150 , 1)
				CancelBuff(OwnerID(), 502462)
		else
			SetSpeakDetail(OwnerID(),"[SC_422789_8]")	--萊斯明生氣中，轉過頭去不想與你交談......
		end
	else
		LoadQuestOption( OwnerID() )
		if	CheckAcceptQuest( OwnerID() ,422789 ) == true	and 
			CheckFlag( OwnerID() , 543384) == false	then
				AddSpeakOption(OwnerID(),TargetID(),"[SC_422789]","LuaS_422789_0",0)	--可以跟我說說你在森林裡發生的事嗎？
		end
		if	CheckAcceptQuest( OwnerID() , 422789 ) == true	and 
			(CountBodyItem( OwnerID(), 206139 )>0 )	and 
			CheckFlag( OwnerID() , 543383) == false	then	--刪除水骨葉湯汁
				SetFlag(OwnerID() , 543383 , 1 )
				DelBodyItem(OwnerID() , 206139 , 1)
		end
		if	CheckAcceptQuest( OwnerID() ,422790 ) == true	and 
			CheckFlag(OwnerID(),543385) == false		then
				AddSpeakOption(OwnerID(),TargetID(),"[SC_422790]","LuaS_422790",0)	--我準備好要見見那些「不速之客」了！
		end
	end
end

---狗痴萊斯明
function LuaS_422789_0()
	SetSpeakDetail(OwnerID(),"[SC_422789_1]")	--我已經說過很多次，我是因為看見巴菲往森林裡跑......
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422789_2]","LuaS_422789_1",0)		--可是巴菲不是死掉很多年了嗎？
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422789_4]","LuaS_422789_2",0)		--原來如此，巴菲那麼可愛，走失了你一定會很心疼吧？
end

function LuaS_422789_1()
	SetSpeakDetail(OwnerID(),"[SC_422789_3]")	--你跟布利明是同一夥的吧！跟村子裡的人一樣......
	AddBuff( OwnerID() , 502462 , 1 , 180 ) --萊斯明生氣的BUFF
end

function LuaS_422789_2()
	SetSpeakDetail(OwnerID(),"[SC_422789_5]")	--是啊！自從巴菲走失後，這幾年來我都覺得自己的生活......
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422789_6]","LuaS_422789_3",0)		--你有追到巴菲嗎？
end

function LuaS_422789_3()
	SetSpeakDetail(OwnerID(),"[SC_422789_7]")	--（萊斯明搖搖頭。）本來我已經追到巴菲了！牠就在低語森林裡......
	SetFlag(OwnerID() , 543384 , 1 )
end


------巴菲的玩具球
function LuaS_113623()
	LoadQuestOption( OwnerID() )
	if	CheckBuff( OwnerID() , 502462)== true	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_113623]","LuaS_113623_1",0)		--撿取巴菲的玩具球。
	end
end

function LuaS_113623_1()
	if	(CountBodyItem( OwnerID(), 206150 )<1 )	then
			GiveBodyItem( OwnerID() , 206150 , 1 )
			CloseSpeak( OwnerID() )
	else
		CloseSpeak( OwnerID() )
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_113623_1]", 0 )	--你已經擁有一顆[206150]！
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_113623_1]", 0 )
	end

end

------神秘的劍
function LuaS_422790()
	CloseSpeak(OwnerID())
	DisableQuest(TargetID() ,true )
	BeginPlot( TargetID() , "LuaS_422790_1" , 0 )
end

function LuaS_422790_1()
	local NPC = LuaFunc_CreateObjByOBj( 102746, OwnerID() )
	Hide(OwnerID())
	WriteRoleValue( NPC , EM_RoleValue_PID , TargetID() )
	BeginPlot( NPC , "LuaS_422790_CHECK" , 0 )
	BeginPlot( NPC , "LuaS_422790_2" , 0 )
	for i = 0 , 100 , 1 do
		if CheckID(NPC) == false or ReadRoleValue( NPC , EM_RoleValue_OrgID ) ~= 102746 then
			break
		end
		sleep( 60 )
	end
	Show( OwnerID() , 0 )
	DisableQuest(OwnerID() ,false )
end

function LuaS_422790_CHECK()
	local Player = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	Local NPC = OwnerID() 
	local Result = "Success"	
	SetPlot( OwnerID() , "Dead" , "LuaS_422790_Dead" , 0 )

	while true do
		sleep(10)
		if	ReadRoleValue(OwnerID(),EM_RoleValue_Register) > 0	then
			Result = "Fail"
			break
		end
	end
	
	if Result == "Fail" then
		SetStopAttack( OwnerID() ) --停止攻擊
		Lua_CancelAllBuff( OwnerID())  --清掉身上的BUFF
		SetRoleCamp( OwnerID() , "Visitor" ) --改變陣營
		
		Tell(Player,OwnerID(),"[SC_422790_1]") --太危險了！我還是先躲起來好了......
	end
	Move( OwnerID() , -12973 , 942 , 31919 )
	sleep( 5 )
	Delobj( OwnerID() )
end

function LuaS_422790_Dead()
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 1 )
	return false
end

function LuaS_422790_2()
	local Player = ReadRoleValue( OwnerID() , EM_RoleValue_PID )

	local Monster = {}
	local amount = 3
	local Group = {}

--	ScriptMessage(Player, 0, 1, "[SC_422790_2]", 0 )	--出來吧！這次我有幫手，可不怕你們！
	Yell( OwnerID() , "[SC_422790_2]" , 2 )
	PlayMotion(OwnerID()  , ruFUSION_ACTORSTATE_EMOTE_POINT)
	sleep(10)
	For i=1, amount  do
		Monster[i] = CreateObjByFlag( 102747 , 780450 , i , 0 )  
		CallPlot( Monster[i] , "LuaFunc_Obj_Suicide" , 300 )
		AddToPartition( Monster[i] , 0 )
		SetPlot(Monster[i],"dead","LuaS_422790_3",0 )	--怪死掉後觸發死亡劇情
		SetAttack(OwnerID(),Monster[i])
		SetAttack(Monster[i],OwnerID())
		BeginPlot(Monster[i], "LuaS_422790_4" , 0 )
	End

	Say(Monster[1] , "[SC_422790_4]")	--把劍還給我們......
	while ReadRoleValue(OwnerID(),EM_RoleValue_IsAttackMode)==1 do
		sleep(10)
	end
	sleep(10)
	Group = SearchRangePlayer(OwnerID() , 350)	--搜尋附近玩家
	For i=0,table.getn(Group)-1 do
		If	CheckAcceptQuest( Group[i], 422790 )==true	and
			CheckFlag( Group[i] , 543386 )==true		then
			SetFlag(Group[i] , 543385 , 1)
		end
	end
	sleep(10)
	PlayMotion(OwnerID()  , ruFUSION_ACTORSTATE_ATTACK_1H)
	Say(OwnerID() , "[SC_422790_3]")	--怕了吧！以後都別再來了！
	Sleep(20)
	Delobj( OwnerID() )
end

function LuaS_422790_3()
	local Player 
	for i=0, HateListCount( OwnerID() )-1 do
		Player = HateListInfo(OwnerID() , i , EM_HateListInfoType_GItemID )
		if	CheckAcceptQuest ( Player   , 422790 )	then
			SetFlag( Player   , 543386, 1 )
		end	
	end	
	return true
end

function LuaS_422790_4()
	for i = 0 , 100 , 1 do
		if CheckID(TargetID()) == false  then
			break
		end
		sleep( 30 )
	end
	Delobj( OwnerID() )
end

------巴菲的寶物543387
function LuaS_422791_CHECK()
	if	CheckFlag( OwnerID() , 543387 )==true		then
			BeginPlot( TargetID() , "LuaS_422791_HIDE" , 0 )
			return false
	else
		return true
	end
end

function LuaS_422791_HIDE() 
	Hide( OwnerID() )
	local obj = LuaFunc_CreateObjByObj ( 113661 , OwnerID() )	--威廉
	FaceObj ( obj, TargetID() )
	SetFightMode ( obj,0, 0, 0,0 )
	PlayMotion(obj  , ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Tell(TargetID() ,obj ,"[SC_422791]")		--你在找什麼？
	sleep(40)
	PlayMotion(obj  , ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)
	Tell(TargetID() ,obj ,"[SC_422791_1]")		--找寶物？......拿走主人的聖劍還不夠嗎？
	sleep(40)
	PlayMotion(obj  , ruFUSION_ACTORSTATE_EMOTE_ANGRY)
	Tell(TargetID() ,obj ,"[SC_422791_2]")		--那是主人非常重要的寶劍啊！我們在此地替主人守護寶劍，等待主人回來......
	sleep(40)
	PlayMotion(obj  , ruFUSION_ACTORSTATE_EMOTE_BEG)
	Tell(TargetID() ,obj ,"[SC_422791_3]")		--如果你知道聖劍的去處，請你一定要把聖劍拿回來還給我們......
	SetFlag(TargetID() , 543391 , 1 )
	sleep(40)
	Delobj( obj )
	Show( OwnerID() , 0 )
end

function LuaS_422791()
	if	CheckFlag( OwnerID() , 543388 )==true		and
		CheckFlag( OwnerID() , 543389 )==true		and
		CheckFlag( OwnerID() , 543390 )==true		then
			SetFlag( OwnerID()   , 543387, 1 )
			GiveBodyItem( OwnerID(), 206153, 1 )		--給軍事記錄本
	elseif	CheckFlag( OwnerID() , 543389 )==true		and
		CheckFlag( OwnerID() , 543390 )==true		then
			GiveBodyItem( OwnerID(), 206151, 1 )		--給卷軸
			SetFlag( OwnerID()   , 543388, 1 )
	elseif	CheckFlag( OwnerID() , 543390 )==true		then
			GiveBodyItem( OwnerID(), 206152, 1 )		--給軍徽
			SetFlag( OwnerID()   , 543389, 1 )
	else		
			GiveBodyItem( OwnerID(), 206154, 1 )		--給盒子
			SetFlag( OwnerID()   , 543390, 1 )
	end
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_422791_0]", 0 )	
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422791_0]", 0 )
	return true
end

------長者波伽利
function LuaS_422794()
	LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest( OwnerID() ,422794 ) == true	and 
		CheckCompleteQuest( OwnerID() , 422794) == false 	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422794]","LuaS_422794_1",0)	--有件事情想要麻煩您，是關於萊斯明與布利明兩兄弟……
	end
	if	CheckAcceptQuest( OwnerID() ,422795 ) == true	and 
		CheckCompleteQuest( OwnerID() , 422795) == false 	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422795]","LuaS_422795",0)	--這個村子裡曾經發生什麼事？
	end
	
	if CheckAcceptQuest( OwnerID() ,422819 ) == true and CheckFlag(OwnerID(),543413) == false	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422819_0]","LuaS_422819_1",0) --您剛剛說到傳送石？
	end
end

function LuaS_422794_1()
	SetSpeakDetail(OwnerID(),"[SC_422794_1]")	--喔～～[113625]與[113624]那對有禮貌的兄弟啊......
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422794_2]","LuaS_422794_2",0)		--萊斯明說，他的弟弟布利明攻擊他，還搶走他的劍！
end

function LuaS_422794_2()
	SetSpeakDetail(OwnerID(),"[SC_422794_3]")	--這聽起來真是不可思議，在我的記憶裡......
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422794_4]","LuaS_422794_3",0)		--是啊！布利明也說他是去對付一個強盜，根本沒有看見萊斯明……
end

function LuaS_422794_3()
	SetSpeakDetail(OwnerID(),"[SC_422794_5]")	--你說[113624]是看見一名強盜，而不是攻擊[113625]......
	SetFlag( OwnerID()   , 543403, 1 )
end

----------這個村子裡的怪事
function LuaS_422795()
	SetSpeakDetail(OwnerID(),"[SC_422795_1]")	--我記得在我還很小的時候，也曾經偷偷跑進森林裡玩耍......
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422795_2]","LuaS_422795_1",0)		--（聽起來與[113625]遇到的情況似乎一樣......）
end

function LuaS_422795_1()
	SetSpeakDetail(OwnerID(),"[SC_422795_3]")	--這樣的事情好像不只在我身上發生過......
	SetFlag( OwnerID()   , 543404, 1 )
end

------威廉的對話劇情
function LuaS_422798()
	LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest( OwnerID() ,422798 ) == true		and 
		CheckCompleteQuest( OwnerID() , 422798) == false 	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422798]","LuaS_422798_1",0)	--威廉，你怎麼了？
	end

	if	CheckAcceptQuest( OwnerID() ,422826 ) == true		and 
		CheckCompleteQuest( OwnerID() , 422826) == false 	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422826_28]","LuaS_422826",0)	--威廉，我有事想要轉告你。
	end

	if	CheckAcceptQuest( OwnerID() ,422827 ) == true		and 
		CheckCompleteQuest( OwnerID() , 422827) == false 	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422826_28]","LuaS_422826",0)	--威廉，我有事想要轉告你。
	end
end

function LuaS_422798_1()
	SetSpeakDetail(OwnerID(),"[SC_422798_1]")	--我只是想到自己如此沒用，不禁悲從中來。......
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422798_2]","LuaS_422798_2",0)		--為什麼你說自己辜負了主人的恩情？
end

function LuaS_422798_2()
	SetSpeakDetail(OwnerID(),"[SC_422798_3]")	--我曾經發誓要一輩子效忠主人[113629]......
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422798_4]","LuaS_422798_3",0)		--這不是你的錯，威廉……
end

function LuaS_422798_3()
	SetSpeakDetail(OwnerID(),"[SC_422798_5]")	--就在主人犧牲後，我依舊留在這裡......
	SetFlag( OwnerID()   , 543405, 1 )
end

------向王者致敬(測試同時點取物品)

function LuaS_422799()
	if	ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) ~= 113703	then
			return true
	else
		if	CountBodyItem( OwnerID(), 206155 )<10  	then
				ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_422799]", 0 )	--需要10朵[<S>206155]！
				ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422799]", 0 )
				return false
		else
				if	ReadRoleValue( TargetID() ,EM_RoleValue_PID ) == 0	then
						BeginPlot( TargetID(), "LuaS_422799_1" , 0 )
						local FF =CountBodyItem( OwnerID(), 206155 )
						DelBodyItem ( OwnerID(),206155 , FF )
						return true
				else
					ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_422804]", 0 )	--目標忙碌中
					ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422804]", 0 )
					return false
				end
		end
	end
end

function LuaS_422799_1()	--旗子780463
	writerolevalue( OwnerID(), EM_RoleValue_PID , 1 )
	local obj = CreateObjByFlag( 113683 , 780463 , 2 , 0 )  --諾芙
	AddToPartition( obj , 0 )
	local flower = CreateObjByFlag( 113725 , 780463 , 1 , 0 )  --花束
	AddToPartition( flower , 0 )
	AdjustFaceDir( obj , flower , 0 )
	PlayMotion(obj  , ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Say(obj , "[SC_422799_1]")	--[206155]......這東西我不陌生，是[113628]請你來的吧？
	sleep(40)
	PlayMotion(obj  , ruFUSION_ACTORSTATE_CROUCH_BEGIN)
	Say(obj , "[SC_422799_2]")	--經過這麼久的時間了......[113628]還是堅持守在那裡不肯離去......
	sleep(40)
	Say(obj , "[SC_422799_3]")	--......有機會的話，好好勸勸[113628]吧！
	sleep( 40 )
	PlayMotion(obj  , ruFUSION_ACTORSTATE_CROUCH_END)
	Say(obj , "[SC_422799_4]")	--他所等待的人，已經不需要他再繼續等待下去......
	sleep(40)
	AdjustFaceDir( obj , flower , 180 )
	sleep( 10 )
	Delobj( obj )
	Delobj( flower )
	writerolevalue( OwnerID() , EM_RoleValue_PID , 0 )
end

-----布利明的對話劇情
function LuaS_113624()
	LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest( OwnerID() ,422802 ) == true		and
		CheckCompleteQuest( OwnerID() , 422802) == false	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422802]","LuaS_422802",0) --請將[113709]借給我......
	end
end

-----動物會知道

function LuaS_422802()	

	if ReadRoleValue( TargetID() ,EM_RoleValue_PID ) == 0 then
		writerolevalue( TargetID() , EM_RoleValue_PID , 1 )
		BeginPlot( TargetID() , "LuaS_422802_1" , 0 )
		CloseSpeak( OwnerID() )
	else
		SetSpeakDetail(OwnerID(),"[SC_422802_1]")	--[113709]跑出去玩耍了，請稍等一下，待會兒應該就會回來。
	end

end

function LuaS_422802_1()	
	local dog = CreateObjByFlag( 113709 , 780464 , 1 , 0 )  --巴菲二世
	WriteRoleValue(dog , EM_RoleValue_IsWalk , 1 )
	AddToPartition( dog , 0 )

	MoveToFlagEnabled( dog , false )
	LuaFunc_MoveToFlag(dog , 780464 , 2 ,  0 )
	ScriptMessage( OwnerID() , TargetID() , 1 , "[SC_422802_2]" , C_SYSTEM )	--[113709]在地上嗅了嗅......
	PlayMotion(dog , ruFUSION_ACTORSTATE_EMOTE_IDLE2)
	sleep(10)
	PlayMotion(dog , ruFUSION_ACTORSTATE_EMOTE_IDLE2)
	sleep(40)
	LuaFunc_MoveToFlag(dog , 780464 , 3 ,  0 )
	ScriptMessage( OwnerID() , TargetID() , 1 , "[SC_422802_3]" , C_SYSTEM )	--[113709]似乎發現了什麼東西！
	WriteRoleValue(dog , EM_RoleValue_IsWalk, 0 )
--	Hide( dog )
--	Show( dog ,0)
	sleep(30)	
	LuaFunc_MoveToFlag(dog , 780464 , 4 ,  0 )
	ScriptMessage( OwnerID() , TargetID() , 1 , "[SC_422802_4]" , C_SYSTEM )	--[113709]對著眼前的奇怪石版大聲吠叫！
	PlayMotion(dog , ruFUSION_ACTORSTATE_ATTACK_1H)
	sleep(50)
	writerolevalue( OwnerID() , EM_RoleValue_PID , 0 )
	Delobj( dog )
end

-----希普莉艾兒對話劇情
function LuaS_113630()
	LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest( OwnerID() ,422803 ) == true		and
		CheckCompleteQuest( OwnerID() , 422803) == false	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422803]","LuaS_422803",0) --我是跟隨[113624]的狗來到這裡，並不知道石版的特殊之處。
	end
end

function LuaS_422803()
	SetSpeakDetail(OwnerID(),"[SC_422803_1]")	--喔～原來是[113624]那隻可愛的[113709]帶你來的呀！......
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422803_2]","LuaS_422803_1",0)	--你知道那個女子去哪裡了嗎？
end

function LuaS_422803_1()
	SetSpeakDetail(OwnerID(),"[SC_422803_3]")	--我不清楚那個女子去哪裡了，事實上我也正想找她問點事情......
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422803_4]","LuaS_422803_2",0)	--看來我們都在找尋那名女子的蹤跡......
end

function LuaS_422803_2()	
	SetSpeakDetail(OwnerID(),"[SC_422803_5]")--你也在找那名女子呀！......
	SetFlag( OwnerID()   , 543431, 1 )
end

-----最後一項材料
function LuaS_422804()

	if ReadRoleValue( TargetID() ,EM_RoleValue_PID ) == 0 then
		if CheckFlag( OwnerID() , 543432) == false then
			return true
		else
			ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_422804_14]", 0 )	--目標忙碌中
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422804_14]", 0 )
			return false
		end
	else
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_422804]", 0 )	--目標忙碌中
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422804]", 0 )
		return false
	end
end

function LuaS_422804_1()
	writerolevalue( TargetID() , EM_RoleValue_PID , 1 )
	if CountBodyItem( OwnerID() , 206158 ) > 0 then
		DelBodyItem( OwnerID() , 206158 , 1 )
	end
	BeginPlot( TargetID() , "LuaS_422804_2" , 0 )
	return true
end

function LuaS_422804_2()	--503977乖乖看戲
	if CheckID( TargetID() ) == true then
		local PPL = Role:new(TargetID() )
		local Ball = createObj( 112399 , PPL:X() , PPL:Y() ,PPL:Z() , PPL:Dir() , 1 )
		Lua_ObjDontTouch( Ball ) 
		AddToPartition( Ball , 0 )
		AddBuff( Ball , 503604 , 0 , 30 )
		AddBuff( TargetID() ,505110,100 , 30 )
		ScriptMessage( OwnerID(), TargetID(), 0, "[SC_422804_0]", 0 )	--你喝下一口[206158]，突然全身動彈不得！
		ScriptMessage( OwnerID(), TargetID(), 1, "[SC_422804_0]", 0 )
	end
	sleep(20)
	local NPC = CreateObjByFlag( 113712 , 780465 , 1 , 0 )  --希普莉艾兒
	AddToPartition( NPC , 0 )
	
	MoveToFlagEnabled( NPC , false )
	PlayMotion(NPC , ruFUSION_ACTORSTATE_EMOTE_LAUGH)
	Say(NPC , "[SC_422804_1]")		--呵呵呵～真是令人憐愛的傢伙！
	sleep(30)
	Say(NPC , "[SC_422804_2]")		--現在是不是動彈不得了，心裡覺得很慌張呢？
	LuaFunc_MoveToFlag(NPC , 780465 , 2 ,  0 )
	PlayMotion(NPC , ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Say(NPC , "[SC_422804_3]")		--其實最後需要的材料，是一顆心臟......
	sleep(40)
	LuaFunc_MoveToFlag(NPC , 780465 , 3 ,  0 )
	AdjustFaceDir( NPC , TargetID(), 0 )
	PlayMotion(NPC , ruFUSION_ACTORSTATE_EMOTE_LAUGH)
	Say(NPC , "[SC_422804_4]")		--放心，很快就會結束，不會感覺到疼痛......
	sleep(30)

	local dog = CreateObjByFlag( 113709 , 780465 , 1 , 0 )  --巴菲二世
	WriteRoleValue( dog , EM_RoleValue_IsWalk , 0 )
	AddToPartition( dog , 0 )
	MoveToFlagEnabled( dog , false )
	WriteRoleValue(dog , EM_RoleValue_IsWalk, 0 )
--	Hide( dog )
--	Show( dog ,0)

	LuaFunc_MoveToFlag(dog , 780465 , 4 ,  0 )
	Yell(dog , "[SC_422804_5]" , 3)		--汪！汪！
	LuaFunc_MoveToFlag(dog , 780465 , 5 ,  0 )

	sleep(30)
	local Man = CreateObjByFlag( 113732 , 780465 , 1 , 0 )  --布利明
	WriteRoleValue(Man , EM_RoleValue_IsWalk , 0 )
	AddToPartition( Man , 0 )
	MoveToFlagEnabled( Man , false )

	local Girl = CreateObjByFlag( 113712 , 780465 , 6 , 0 )  --希普莉艾兒
	WriteRoleValue(Girl , EM_RoleValue_IsWalk , 0 )
	AddToPartition( Girl , 0 )
	MoveToFlagEnabled( Girl , false )
	PlayMotion(Man , ruFUSION_ACTORSTATE_EMOTE_POINT)
	Yell(Man , "[SC_422804_6]" , 3)	--妳是誰？為什麼假扮[113630]？
	AdjustFaceDir( Man, NPC , 0 )
	sleep(30)
	Yell(dog , "[SC_422804_7]" , 3)		--汪！汪汪！
	PlayMotion(dog , ruFUSION_ACTORSTATE_ATTACK_1H)
	PlayMotion(dog , ruFUSION_ACTORSTATE_ATTACK_1H)
	sleep(10)
	local NPC1 = CreateObjByFlag( 113811 , 780465 , 3 , 0 )  --年輕女子
	AddToPartition( NPC1 , 0 )
	MoveToFlagEnabled( NPC1 , false )
	Delobj( NPC )
	AdjustFaceDir( NPC1 ,Dog ,0 )
	sleep(30)
	PlayMotion(Man , ruFUSION_ACTORSTATE_HURT_NORMAL)
	Yell(Man , "[SC_422804_8]" , 3)	--妳......不就是那個錢袋被搶劫的女士嗎？
	if CheckID( TargetID() ) == true then
		FaceObj( Girl , TargetID() )
	end
	PlayMotion(NPC1 , ruFUSION_ACTORSTATE_ATTACK_1H)
	sleep(30)
	PlayMotion(NPC1 , ruFUSION_ACTORSTATE_ATTACK_1H)
	Yell(NPC1 , "[SC_422804_9]", 3 )	--這隻討厭的狗，快走開！可惡，你們竟然來破壞我的好事！這次就放過你，下次我不會善罷干休的。
	sleep(30)
	Delobj( NPC1 )
	sleep(30)
	PlayMotion( Girl  , ruFUSION_ACTORSTATE_EMOTE_SPEAK)	
	Yell(Girl , "[SC_422804_10]" , 3)	--你沒事吧？快喝下這個藥水，就可以解除你身體的麻痺。
	if CheckID( TargetID() ) == true then
		CancelBuff( TargetID() , 503977 )	
		CancelBuff( TargetID() , 503604 )	
		SetFlag( TargetID()   , 543432, 1 )
	end
	sleep(30)
	PlayMotion( Man , ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell(Man , "[SC_422804_11]",3)	--那個女子假扮[113630]想做什麼？剛剛她好像想對你不利？
	LuaFunc_MoveToFlag(dog , 780465 , 7,  0 )
--	sleep(20)
	AdjustFaceDir( Man , dog , 0 )
	PlayMotion( Man , ruFUSION_ACTORSTATE_EMOTE_WAVE)
	Yell(Man , "[SC_422804_12]" , 3)	--巴菲～回來！別追過去，太危險了。
	sleep(30)
	Delobj( dog )
	AdjustFaceDir( Man , TargetID() , 0 )
	Yell(Man , "[SC_422804_13]" , 3)	--我先去把巴菲帶回來，晚一點你再來找我吧！
	SetFollow(  Girl , Man )
	LuaFunc_MoveToFlag(Man , 780465 , 7,  0 )
	Delobj( Man )	
	Delobj( Girl )	
	writerolevalue( OwnerID() , EM_RoleValue_PID , 0 )
end

------勇者的殞歿--543455可接緹亞娜線：543456可接諾芙線
function LuaS_422805()
	LoadQuestOption( OwnerID() )
	if	CheckCompleteQuest( OwnerID() , 422805) == true	and
		CheckCompleteQuest( OwnerID() , 422816) == false	and
		CheckCompleteQuest( OwnerID() , 422806) == false	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422628_0]","LuaS_422805_1",0)	--發生什麼事？
	end
	if	CheckFlag( OwnerID(), 543456 ) == true	and
		CheckAcceptQuest( OwnerID() , 422816) == false	and
		CheckAcceptQuest( OwnerID() , 422806) == false	then
			SetFlag( OwnerID()   , 543456, 0 )
			SetFlag( OwnerID()   , 543455, 1 )
	end
end

function LuaS_113762()	--亞貝爾的對話劇情
	LoadQuestOption( OwnerID() )
	if	CheckFlag( OwnerID(), 543455 ) == true	and
		CheckAcceptQuest( OwnerID() , 422816) == false	and
		CheckAcceptQuest( OwnerID() , 422806) == false	then
			SetFlag( OwnerID()   , 543455, 0 )
			SetFlag( OwnerID()   , 543456, 1 )
	end
end

function LuaS_422805_1()
	CloseSpeak( OwnerID() )
	Hide( TargetID() )
	BeginPlot( TargetID() , "LuaS_422805_2" , 0 )
end

function LuaS_422805_2()
	local NPC = CreateObjByFlag( 102821 , 780475 , 1 , 0 ) 	--亞貝爾
	AddToPartition( NPC , 0 )
	Say(NPC , "[SC_422805_1]")	--快來幫助我！[113713]被魔女迷惑了！別相信他的話！
	local OLD = LuaFunc_CreateObjByOBj( 102822, OwnerID() )	--波伽利
	Say(OLD , "[SC_422805]")	--[113762]變成魔物了！快幫我擊敗他！
	AddBuff( OLD ,504991 ,100 ,-1 )
	WriteRoleValue( NPC , EM_RoleValue_PID , OLD )
	WriteRoleValue( OLD , EM_RoleValue_PID , NPC )
--	CallPlot( OLD , "LuaFunc_Obj_Suicide" , 300 )
--	CallPlot( NPC , "LuaFunc_Obj_Suicide" , 300 )
	BeginPlot( NPC , "LuaS_422805_NPC_CHECK" , 0 )
	BeginPlot( OLD , "LuaS_422805_OLD_CHECK" , 0 )


	SetPlot(NPC,"dead","LuaS_422805_NPC_dead",0 )
	SetPlot(OLD,"dead","LuaS_422805_OLD_dead",0 )


	SetAttack(NPC,OLD)
	SetAttack(OLD,NPC)

	for i = 0 , 100 , 1 do
		if CheckID(OLD) == false  then
			break
		end
		sleep( 60 )
	end
	Show( OwnerID() ,0)
end

function LuaS_422805_NPC_CHECK()
	local MonOLD = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	for i = 0 , 100 , 1 do
		if CheckBuff( MonOLD , 504991)  == false  then
			break
		end
		sleep( 30 )
	end
	SetStopAttack( OwnerID() ) --停止攻擊
	Hide( OwnerID() )
	Lua_CancelAllBuff( OwnerID())  --清掉身上的BUFF
	SetRoleCamp( OwnerID() , "Visitor" ) --改變陣營

	for i = 0 , 100 , 1 do
		if CheckID(MonOLD)   == false  then
			break
		end
		sleep( 30 )
	end
	Delobj( OwnerID() )
end

function LuaS_422805_OLD_CHECK()
	local MonNPC = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	for i = 0 , 100 , 1 do
		if CheckID(MonNPC) == false  then
			break
		end
		sleep( 30 )
	end
	Delobj( OwnerID() )
end

function LuaS_422805_NPC_dead()
	local Player 
	for i=0, HateListCount( OwnerID() )-1 do
		Player = HateListInfo(OwnerID() , i , EM_HateListInfoType_GItemID )
		if	CheckCompleteQuest( Player , 422805) == true	and
			CheckAcceptQuest ( Player   , 422816 ) == false	and
			CheckAcceptQuest ( Player   , 422806 ) == false	and
			CheckCompleteQuest( Player , 422816) == false	and
			CheckCompleteQuest( Player , 422806) == false	then
			SetFlag( Player   , 543456, 0 )
			SetFlag( Player   , 543455, 1 )
		end	
	end
	Delobj( OwnerID() )
	return false
end

function LuaS_422805_OLD_dead()
	local Player 
	local Abel
	for i=0, HateListCount( OwnerID() )-1 do
		Player = HateListInfo(OwnerID() , i , EM_HateListInfoType_GItemID )
		if ReadRoleValue( Player , EM_Rolevalue_OrgID ) == 102821 then
			Abel = Player
		end
		if	CheckCompleteQuest( Player , 422805) == true	and
			CheckAcceptQuest ( Player   , 422816 ) == false	and
			CheckAcceptQuest ( Player   , 422806 ) == false	and
			CheckCompleteQuest( Player , 422816) == false	and
			CheckCompleteQuest( Player , 422806) == false	then
			SetFlag( Player   , 543455, 0 )
			SetFlag( Player   , 543456, 1 )
		end	
	end
	SetStopAttack( OwnerID() ) --停止攻擊
--	Hide( OwnerID() )
	Lua_CancelAllBuff( OwnerID())  --清掉身上的BUFF
	SetFightMode( OwnerID() , 0 , 0 , 0 ,0 ) --改變陣營
	SetRoleCamp( OwnerID() , "Visitor" ) --改變陣營
	SetIdleMotion( OwnerID() , ruFUSION_ACTORSTATE_DEAD)
	SetFightMode( Abel , 0 , 0 , 0 ,0 ) --改變陣營
	CallPlot( OwnerID() , "LuaS_422805_OLD_SHOW" , Abel)
	return false
end

function LuaS_422805_OLD_SHOW(Obj)
	AddBuff( OwnerID() , 502707, 0 , -1 )
	sleep(20)
	local Abel = Role:new( Obj )
--	local Man = CreateObjByFlag( 113762 , 780475 , 2 , 0 ) 	--亞貝爾
	local Man = CreateObj( 113762 , Abel:X() ,Abel:Y() , Abel:Z() ,Abel:Dir() , 1 )
	AddToPartition( Man , 0 )
	sleep(300)
	Delobj( Man )
	Delobj( OwnerID() )
end

function LuaS_422816_422806()
	SetFlag( TargetID()   , 543455, 0 )
	SetFlag( TargetID()   , 543456, 0 )
end


