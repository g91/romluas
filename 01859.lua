


	
--======================================================================================================
--423260掛在洞裡的安特克羅身上
--======================================================================================================	
function LuaS_423260_Move()
	LoadQuestOption(OwnerID()) 	
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423260_MOVE]","LuaS_423260_Move1",0)
				--請帶領我尋找陛下。
		
	
end

function LuaS_423260_Move1()
	CloseSpeak(OwnerID())
	Say(TargetID(),"[SC_422693_6]")
	BeginPlot( OwnerID() , "LuaQ_423260_Accept_Do" , 0 )
end

function LuaQ_423260_Accept_Do()
	CastSpell( OwnerID() , OwnerID() , 491008 )
	sleep(5)
	ChangeZone( OwnerID() , 16 , 0 , -2905.7 ,-794.9, 24806 , 2.3 )
	SetFlag(OwnerID(),544034,1)
end

--======================================================================================================
--423260
--======================================================================================================



function LuaS_423260_ACT0()		--掛在接受任務之後 
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,1 )

	DisableQuest(OwnerID(),true)	
	DisableQuest( OwnerID() , true )
--	Hide(OwnerID())
	AddBuff( TargetID()  , 506807 , 1 , -1 ) 	--或者給buff
	CallPlot(OwnerID(),"LuaS_Check_noquest", 1 , 1 , 423260 , 506807,TargetID(),OwnerID(),200)	
	Local Ann = LuaFunc_CreateObjByObj(115283, OwnerID() )
	DisableQuest(Ann, true )
	Setflag(TargetID(),544039,1)
	Say(Ann,"[SC_423260_ACT0]")							--出來吧，我知道你在這裡。
	Sleep(40)
	local Derek = Lua_DW_CreateObj("flag" ,115284,780635,1)
	Hide(Derek)
	local Chip = Lua_DW_CreateObj("flag" ,115285,780635,2)
	Hide(Chip)
	DisableQuest(Derek, true )
	DisableQuest(Chip, true )
	
	Show(Derek,0)
	Show(Chip,0)
	
	Sleep(20)
	WriteRoleValue (Derek, EM_RoleValue_IsWalk, 1)
	WriteRoleValue (Chip, EM_RoleValue_IsWalk, 1)
	
	Beginplot(Derek,"LuaS_423260_ACT1",0)	
	Beginplot(Chip,"LuaS_423260_ACT2",0)
	Sleep(40)
	AdjustFaceDir( Ann , Derek ,3 )
	AdjustFaceDir( Derek ,Ann , 3 )
	PlayMotion(Derek,ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)
	Say(Derek,"[SC_423260_ACT1]")						--被拆穿啦？精靈，你的力量強大到我看不出深淺，到底是從哪裡冒出來的？不會是一般的精靈，又不像是居爾納精靈......
	Sleep(50)
	
	Say(Ann,"[SC_423260_ACT2]")							--卡拉維可平安無事？
	Sleep(30)
		
	PlayMotion(Derek,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Say(Derek,"[SC_423260_ACT3]")						--你說呢？反正我怎麼也打不過你，不陪你們在這裡耗了，哈哈。
	Sleep(30)
	
	PlayMotion(Derek,ruFUSION_ACTORSTATE_CAST_SP01)	--POSE:跳起
	Sleep(20)

	CastSpell(Chip,TargetID(),491276)		--放光 
	Sleep(30)
	
	Delobj(Derek)
	Delobj(Chip)

	if CheckAcceptQuest(TargetID(),423260)==true then
		SetFlag(TargetID() , 544034 , 1)		--任務完成旗標：尋找王者足跡
	end
	
--	Show(OwnerID(),0)
	CancelBuff( TargetID()  , 506807  )
	if	CheckAcceptQuest(TargetID(),423260)==true 	then
		Setflag(TargetID(),544039,0)
	end
	Delobj(Ann)
	DisableQuest( OwnerID() , false )
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )
end


function LuaS_423260_ACT1()
	Show(OwnerID(),0)
	DW_MoveToFlag(OwnerID(),780635,5,0,1)
end

function LuaS_423260_ACT2()
	Show(OwnerID(),0)
	DW_MoveToFlag(OwnerID(),780635,6,0,1)
end




--======================================================================================================
--423261	接下任務劇情：
--======================================================================================================
function LuaS_423261_ACT0()
	DisableQuest(OwnerID(),true)	
	
	DisableQuest(OwnerID() ,true )
	AddBuff( TargetID()  , 506808 , 1 , 300 )	--或者給定身buff
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register4 , TargetID() )
	Beginplot(OwnerID(),"LuaS_423261_AK_CHECK",0)

	local Jx1 = Lua_DW_CreateObj("flag" ,115438,780639,1)
	local Jx2 = Lua_DW_CreateObj("flag" ,115290,780639,2)
	DisableQuest(Jx1, true )
	DisableQuest(Jx2, true )
	Hide(Jx2)

	Say(Jx1 ,"[S_423261_ACT1]")				--說吧，沒有誰比我更有資格知道。
	DW_MoveToFlag(Jx1,780639,2,0,1)
	CastSpell(Jx1,Jx1,494518)
	Sleep(30)
	Show(Jx2,0)
	Hide(Jx1)
	CastSpell(Jx2,Jx2,494518)	
	Sleep(50)
--	ScriptMessage(OwnerID(), TargetID() , 1 , "[S_423261_ACT2]" , 0 )		--[115287]驚訝的看著變成萊慕恩人的[115438]。
--	ScriptMessage(OwnerID(), TargetID() , 0 , "[S_423261_ACT2]" , 0 )		--[115287]驚訝的看著變成萊慕恩人的[115438]。
	
--	SetFlag(TargetID() , 544037 , 1)		--給旗標，看得見原地的螢火
--	AddBuff( TargetID()  , 506810 , 1 , 300 )
	--SetFlag(TargetID() , _____ , 0)		--拿掉演戲npc的現形旗標
	CancelBuff( TargetID()  , 506808  ) 	--還玩家自由	
	Delobj(Jx1)
	Delobj(Jx2)
	DisableQuest(OwnerID() ,false )
end

function LuaS_423261_AK_CHECK()
local Player = ReadRoleValue(OwnerID(),EM_RoleValue_Register4 )	
	for i = 0 , 100 , 1 do
		if	CheckAcceptQuest( Player, 423261 )==false		and	
			CheckBuff( Player , 506808) == true		then
			break
		end
		if	CheckBuff( Player , 506808) == false		then
			break
		end
		sleep( 20 )
	end
	CancelBuff( Player  , 506808  )	
end
--======================================================================================================
--423261	向老犬人問話
--======================================================================================================
function LuaS_423261_0()
	LoadQuestOption(OwnerID()) 
	--我對你們是毫無敵意的，今天德銳克的種種做為，我完全不知情，更不明白他的目的是什麼。
	if CheckAcceptQuest(OwnerID(),423261)==true 	and
		Checkflag(OwnerID(),544013)== false			then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423261_0]","LuaS_423261_1",0)
		--「你怎麼會在這裡？」
	end
end

function LuaS_423261_1()
	SetSpeakDetail(OwnerID(),"[SC_423261_1]")
	--我們是鐵牙部族中的一支，千年之前就來到這個卻普瑞的故鄉，
	--照顧偉大的先祖卡沃克．怒牙的戰友──卻普瑞之王奇普，在奇普逝去後，世世代代繼續在這裡守著牠的後代和子民。
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423261_2]","LuaS_423261_2",0)
	--「德銳克是你的族人，你怎麼會不知道他的計劃？」
end	
	
function LuaS_423261_2()
	SetSpeakDetail(OwnerID(),"[SC_423261_3]")
	--(老犬人看了賈思敏一眼)
	--我們這一支的存在，一向只有先祖卡沃克的直系族人才知道，彼此之間互有聯繫，
	--只是後來因為某些原因......往來漸少，我們不再收到他們的消息，直到十數年前，
	--德銳克帶著二十幾人的小隊伍來到這裡。在我們知道他就是當代的直系血親後，
	--就答應他留下的要求，卻從未過問或干涉他的生活。
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423261_4]","LuaS_423261_3",0)
	--「卻普瑞谷地中有兇猛巨獸的傳言，是你們放出去的？」
end

function LuaS_423261_3()
	SetSpeakDetail(OwnerID(),"[SC_423261_5]")
	--我們一向隱居在谷地裡平靜度日，這裡的卻普瑞有很強烈的地盤意識，
	--根本沒人敢進來，我們也不想改變這樣的生活，怎麼會放出這樣的傳言，去吸引外人的注目？
	--
	--老犬人詳實說當年事，他們對將軍當年是否參與對付羅嚴不清楚，但奇普謠言的確是在將軍來之後幾年才有的，

	AddSpeakOption(OwnerID(),TargetID(),"[SC_423261_6]","LuaS_423261_4",0)
	--「我知道了。」
end

function LuaS_423261_4()
	SetFlag(OwnerID(),544013,1)	--給旗標，完成此任務

	CloseSpeak(OwnerID())
end



--======================================================================================================
--423262
--======================================================================================================
function LuaQ_423262_Accept()	 --掛在接受任務之後，傳送玩家
	BeginPlot( TargetID() , "LuaQ_423262_Accept_Do" , 0 )
end

function LuaQ_423262_Accept_Do()
	CastSpell( OwnerID() , OwnerID() , 491008 )
	Sleep( 20)
	ChangeZone( OwnerID() , 16 , 0 , -4707.1  , -157.8  , 22811.3   , 101.1 )
	SetFlag(OwnerID(),544035,1)
end

-------------------------



function LuaS_423262_ACT0()		--掛在任務接受之後	
	DisableQuest( OwnerID() , true )
	AddBuff( TargetID()  , 503977 , 1 , 300 )	--或者給定身buff
	local Ann = LuaFunc_CreateObjByObj	( 115524 , OwnerID() )
	DisableQuest(Ann, true )
--	AddBuff(OwnerID(),506116,1,300)		--給看的見演戲的buff
	local Star = Lua_DW_CreateObj("flag" ,115521,780637,1)
	local Cral = Lua_DW_CreateObj("flag" ,115522,780637,2)
	local Rose = Lua_DW_CreateObj("flag" ,115523,780637,3)	
	DisableQuest(Star, true )
	DisableQuest(Cral, true )
	DisableQuest(Rose, true )
	SetFlag(TargetID() , 544014 , 1)	--給隱藏owner的旗標

--Hide(OwnerID())
	
	
	PlayMotion(Star   ,ruFUSION_ACTORSTATE_EMOTE_KISS) 
	Say(Star ,"[S_423262_ACT0]")					--呵，這位大人將你們平安帶回來了。
	Sleep(30)
	Hide(Cral)
	Show(Cral,0)
	
	PlayMotion(Ann   ,ruFUSION_ACTORSTATE_EMOTE_SPEAK) 
	Say(Ann  ,"[S_423262_ACT1]")					--在與你們分別之前，我有個問題想問夜梟，符文在薩維爾大陸上只用於武器？
	Sleep(30)
	WriteRoleValue (Cral , EM_RoleValue_IsWalk, 0)
	
	AdjustFaceDir( Cral , Ann ,3 )
	PlayMotion(Cral  ,ruFUSION_ACTORSTATE_EMOTE_SPEAK) 	--說話
	Say(Cral ,"[S_423262_ACT2]")					--符文鑲嵌在武器相當普及，其他用途沒有被廣泛流傳，你指的是......？
	Sleep(40)
	
	PlayMotion(Ann  ,ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD) 	--低頭	
	Say(Ann ,"[S_423262_ACT3]")						--另一塊大陸，以及久遠之前，它曾被濫用於人體。
	Sleep(30)
	
	PlayMotion(Cral ,ruFUSION_ACTORSTATE_EMOTE_SPEAK) 
	Say(Cral ,"[S_423262_ACT4]")					--你是說瓦納多肯碉堡抓走許多人民，並不全然是因為競技場，羅嚴．傑爾正在進行符文研究？
	Sleep(40)
	
	PlayMotion(Ann   ,ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE) 	--搖頭
	Say(Ann  ,"[S_423262_ACT5]")					--這點我不清楚，不過......歷史總是不斷循環。
	Sleep(30)
	
	PlayMotion(Rose  ,ruFUSION_ACTORSTATE_EMOTE_SPEAK) 	--
	Say(Rose  ,"[S_423262_ACT6]")					--用符文改造人體，就是所謂的魔族.....我曾在千羽曆上看過封印之戰的紀錄。
	Sleep(30)
	PlayMotion(Rose  ,ruFUSION_ACTORSTATE_EMOTE_SPEAK) 	--
	Say(Rose  ,"[S_423262_ACT7]")					--這裡的地形充滿坑洞、怪岩，羅嚴．傑爾當年是否受制於此而落敗，轉而追求更強大的力量，所以將目光放到魔族的強大......
	Sleep(40)
	
	AdjustFaceDir( Cral , Rose ,3 )
	AdjustFaceDir( Star , Cral ,3 )
	PlayMotion(Cral,ruFUSION_ACTORSTATE_EMOTE_ROCK)
	Say(Cral ,"[S_423262_ACT8]")					--不！不可能，儘管羅嚴．傑爾當年有些得意忘形，他的驕傲都不會允許他因為地形而落敗....一定有其他的原因......
	Sleep(40)
	
	DW_MoveToFlag(Star,780637 ,5 ,0,1)
	Say(Star,"[S_423262_ACT9]")						--卡爾，冷靜點！
	Sleep(30)
	
	PlayMotion(Cral  ,ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	Say(Cral ,"[S_423262_ACT10]")					--總之，只要見到他，就能揭曉一切，各位，我先走了。
	Sleep(30)
	
	BeginPlot( Cral , "LuaS_423262_ACT1" , 0 )
	Sleep(20)
	
	PlayMotion(Star ,ruFUSION_ACTORSTATE_EMOTE_CUTE2)	--鞠躬
	Say(Star ,"[S_423262_ACT11]")					--命運彼此交會的人們，我們會再相見的。	
	Sleep(30)
	BeginPlot( Star , "LuaS_423262_ACT2" , 0 )
	
	Sleep(20)
	PlayMotion(Ann ,ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	Say(Ann  ,"[S_423262_ACT12]")					--我將去追蹤方才的萊慕人，你們之後的行動請要一切小心。
	Sleep(40)
	CastSpell( Ann , Ann , 491008 )
	Sleep(30)
	Hide(Ann)
	
	CancelBuff( TargetID()  , 503977  ) 	--還玩家自由
	Delobj(Star)
	Delobj(Cral)
	Delobj(Rose)
	Delobj(Ann)

	if 	CheckAcceptQuest(TargetID(),423262)== true then
			Setflag(TargetID(),544016,1)			--完成任務旗標
	end
	DisableQuest( OwnerID() , false )
	SetFlag(TargetID() , 544014 , 0)		--拿掉旗標，秀出ownerid
--	Show(OwnerID(),0)
end

function LuaS_423262_ACT1()
	DW_MoveToFlag(OwnerID(),780637,6,0,1)
	Hide(OwnerID())
end

function LuaS_423262_ACT2()
	DW_MoveToFlag(OwnerID(),780637,7,0,1)
	Hide(OwnerID())
end

function LuaS_423262_115291()	--掛在安特克羅115291的對話劇情
	LoadQuestOption(OwnerID()) 
	if 	CheckAcceptQuest(OwnerID(),423262)==true 	and
		CheckCompleteQuest(OwnerID(),423262)==false	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_50]","LuaS_423262_115291_1",0)
		--謝謝。
	end
end

function LuaS_423262_115291_1()
	SetSpeakDetail(OwnerID(),"[SC_423262_115291_1]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423236_10]","LuaS_423262_115291_2",0)--是的
end

function LuaS_423262_115291_2()
	CloseSpeak(OwnerID())
	Beginplot(TargetID(),"LuaS_423262_ACT0",1)
end
		

--======================================================================================================
--423287	和獲救的卡拉維對話
--======================================================================================================
function LuaS_423287_0()
	LoadQuestOption(OwnerID()) 
	--......[$playername]。
	if 	CheckAcceptQuest(OwnerID(),423287)==true 	and
		Checkflag(OwnerID(),544015)==false 			then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423260_0]","LuaS_423287_1",0)
		--「陛下，您還好嗎？」
	end
end

function LuaS_423287_1()
	SetSpeakDetail(OwnerID(),"[SC_423260_1]")
	--(卡拉維看著你，露出有些複雜的眼神)我沒事，謝...謝謝你。
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423260_2]","LuaS_423287_2",0)
	--「是安特克羅大人救了我們，屬下不敢居功。」
end

function LuaS_423287_2()
	if 	CheckAcceptQuest(OwnerID(),423287)==true 	and
		Checkflag(OwnerID(),544015)==false 			then
		SetFlag(OwnerID(),544015,1)	--給旗標，完成此任務
	end
	CloseSpeak(OwnerID())
end


--======================================================================================================
--423288		完成任務後script
--======================================================================================================
function LuaS_423288_ACT0()		
	DisableQuest( OwnerID() , true )
	AddBuff( TargetID()  , 503977 , 1 , 300 ) 
	local tony = LuaFunc_CreateObjByOBj( 115547, OwnerID() )
	DisableQuest(tony, true )		
	local Arni = Lua_DW_CreateObj("flag" ,115372,780636,1)

	DisableQuest(Arni, true )
	DW_MoveToFlag(Arni,780636,2,0,1)
--	Sleep(20)
	AdjustFaceDir( Arni , OwnerID() ,3 )
	AdjustFaceDir( tony , Arni ,0 )	
	Say(Arni,"[S_423288_ACT0]")						--這、這真的是奇普的牙齒嗎？
	PlayMotion(Arni ,ruFUSION_ACTORSTATE_EMOTE_POINT)	
	Sleep(30)	
	local A1 = Lua_DW_CreateObj("flag" ,115373,780636,3)
	local A2 = Lua_DW_CreateObj("flag" ,115374,780636,3)
	DisableQuest(A1, true )
	DisableQuest(A2, true )
	Hide(A1)
	Show(A1,0)
	Hide(A2)
	Show(A2,0)
	Hide(Arni)
	Show(Arni,0)
	Sleep(30)
	WriteRoleValue (A1, EM_RoleValue_IsWalk, 0)
	WriteRoleValue (A2, EM_RoleValue_IsWalk, 0)
	WriteRoleValue (Arni, EM_RoleValue_IsWalk, 0)
	
	BeginPlot( A1, "LuaS_423288_ACT1" , 0 )
	BeginPlot( A2, "LuaS_423288_ACT2" , 0 )
	Sleep(20)
	AdjustFaceDir( A1 , Arni ,3 )	
	AdjustFaceDir( A2 , Arni ,3 )	
	
	PlayMotion(A1   ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)		
	Say( A1,"[S_423288_ACT1]")							--村長村長，不好了，剛剛有人闖入伐木營地，捉走好幾個人。
	Sleep(30)
	
	PlayMotion(A2   ,ruFUSION_ACTORSTATE_EMOTE_FEAR)
	Say( A2,"[S_423288_ACT2]")							--我...我躲在旁邊，沒被他們發現才撿回一命，那些壞人穿著像是士兵的衣服，在一個殘暴的女人帶領下，他們叫她瑪拉琪執政官。
	Sleep(30)
	
	PlayMotion(Arni   ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Say( Arni,"[S_423288_ACT3]")						--冒險者，都怪我，如果我相信你們說的，今天就不會發生這件事。
	Sleep(30)
	
	PlayMotion(Arni  ,ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)
	Say( Arni,"[S_423288_ACT4]")						--你們一直試著告訴我真相，我卻......
	Sleep(30)
	
	PlayMotion(tony   ,ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)
	Say( tony,"[S_423288_ACT5]")					--村長，先別自責，現在最重要的是救回被捉走的人。
	Sleep(30)
	
	PlayMotion(Arni   ,ruFUSION_ACTORSTATE_EMOTE_BEG)
	Say(Arni ,"[S_423288_ACT6]")						--只有你們可以幫我們，拜託你們，請幫我們到瓦納多肯堡救回我們被捉走的村民吧？
	Sleep(40)
	
	PlayMotion(A1   ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Say(A1 ,"[S_423288_ACT7]")							--村長，要怎麼跟那些被擄走的家人說呢？
	Sleep(30)
	
	PlayMotion(tony   ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Say(tony ,"[S_423288_ACT8]")					--阿尼莫，你去安撫村民們吧，追擊擄人的瓦納多肯碉堡的士兵就交給我們了。
	Sleep(30)
	
	PlayMotion(Arni   ,ruFUSION_ACTORSTATE_EMOTE_SALUTE2)
	Say( Arni,"[S_423288_ACT9]")						--謝謝你們！
	Sleep(30)
	BeginPlot( A1, "LuaS_423288_ACT3" , 0 )
	BeginPlot( A2, "LuaS_423288_ACT3" , 0 )
	BeginPlot( Arni, "LuaS_423288_ACT3" , 0 )
	Sleep(60)
	Delobj(tony)
	Delobj(A1)
	Delobj(A2)
	Delobj(Arni)
	CancelBuff( TargetID()  , 503977  ) 	--還玩家自由
	SetFlag(TargetID() , 544036 , 1)			--給重要旗標，開啟下個任務
	DisableQuest( OwnerID() , false )
end

function LuaS_423288_ACT1()	
	DW_MoveToFlag(OwnerID(),780636,4,0,1)
end

function LuaS_423288_ACT2()	
	DW_MoveToFlag(OwnerID(),780636,5,0,1)
end

function LuaS_423288_ACT3()	
	DW_MoveToFlag(OwnerID(),780636,6,0,1)
	Hide(OwnerID())
end


	
	
function LuaS_423289_0()
	ScriptMessage(OwnerID(), TargetID() , 1 , "[SC_423289_0]" , 0 )
	ScriptMessage(OwnerID(), TargetID() , 0 , "[SC_423289_0]" , 0 )
	--呀啊啊啊！！！
	Sleep(20)
	ScriptMessage(OwnerID(), TargetID() , 1 , "[SC_423289_1]" , 0 )
	ScriptMessage(OwnerID(), TargetID() , 0 , "[SC_423289_1]" , 0 )
	--(碉堡中傳來撕裂般的淒慘厲叫！！)
end	
	