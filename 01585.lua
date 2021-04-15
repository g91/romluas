------忠誠的威廉
function LuaS_422826()
	SetSpeakDetail(OwnerID(),"[SC_422826_29]")	--什麼事？是有關於聖騎士之劍嗎？
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422826_30]","LuaS_422826_0",0)		-- 威廉，我……
end

function LuaS_422826_0()
	CloseSpeak(OwnerID())
	if ReadRoleValue( TargetID() , EM_RoleValue_Register ) == 0 then
		DisableQuest(TargetID() ,true )
		BeginPlot( TargetID() , "LuaS_422826_1" , 0 )
	end
end

function LuaS_422826_1()
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 1 )
	Hide(OwnerID())
	local man = LuaFunc_CreateObjByOBj( 113661, OwnerID() )
	WriteRoleValue( man , EM_RoleValue_PID , TargetID() )
	BeginPlot( man , "LuaS_422826_2" , 0 )
	for i = 0 , 100 , 1 do
		if CheckID(man) == false or ReadRoleValue( man , EM_RoleValue_OrgID ) ~= 113661 then
			break
		end
		sleep( 60 )
	end
	Show( OwnerID() , 0 )
	DisableQuest(OwnerID() ,false )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
end

function LuaS_422826_2()
	local PP = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local NPC1 = CreateObjByFlag( 113810 , 780467 , 1 , 0 )  --緹亞娜
	AddToPartition( NPC1 , 0 )
	MoveToFlagEnabled( NPC1 , false )
	LuaFunc_MoveToFlag(NPC1 , 780467 , 2 ,  0 )

	SetDefIdleMotion( NPC1, ruFUSION_MIME_EMOTE_SPEAK)
	SetDefIdleMotion( OwnerID(), ruFUSION_MIME_EMOTE_SPEAK)
	Say(NPC1 , "[SC_422826_0]")	--副官威廉？
	sleep(30)
	Say(OwnerID() , "[SC_422826_1]")	--妳……是誰？我似乎在哪曾經看過妳？
	sleep(30)
	Say(NPC1 , "[SC_422826_2]")	--你不記得了啊？千年前，你曾鄙棄的看著我，就站在[113686]的身旁。
	sleep(30)
	Say(OwnerID() , "[SC_422826_3]")	--是妳？那名對主人癡心妄想的魔族？
	sleep(30)
	Say(NPC1 , "[SC_422826_4]")	--哼！頑固腦袋說出的話總是這麼不中聽，那名魔族是我，但你的主人本來就屬於我
	sleep(30)
	Say(OwnerID() , "[SC_422826_5]")	--住口，不准妳污衊主人。
	SetDefIdleMotion( OwnerID(), ruFUSION_MIME_NONE)
	SetDefIdleMotion( NPC1, ruFUSION_MIME_NONE)
	sleep(30)
	Say(NPC1 , "[SC_422826_6]")	--污衊？你錯了，[113686]他自願待在我身邊。	

	PlayMotion(  NPC1 ,ruFUSION_ACTORSTATE_EMOTE_LAUGH)
	sleep(30)
	Say(NPC1 , "[SC_422826_7]")	--[113686]，來吧！來見見你千年前的部下。

	local NPC2 = CreateObjByFlag( 113629 , 780467 , 3 , 0 )  --安德薩斯
	AddToPartition( NPC2 , 0 )
	MoveToFlagEnabled( NPC2 , false )
	LuaFunc_MoveToFlag(NPC2 , 780467 , 4 ,  0 )
	sleep(10)
	Say(OwnerID() , "[SC_422826_8]")	--聖騎士之劍……主人？
	sleep(30)
	Say(NPC1 , "[SC_422826_9]")	--你還記得他嗎？呵～你忠誠的部下？
	sleep(30)
	Say(OwnerID() , "[SC_422826_10]")	--主人，這是夢嗎？我終於等到這一刻了！......
	PlayMotion(OwnerID() , ruFUSION_ACTORSTATE_EMOTE_CRY)

	sleep(30)
	Say(NPC2 , "[SC_422826_11]")	--[113691]？你說這就是我的部下？
	sleep(30)
	Say(NPC1 , "[SC_422826_12]")	--千年前你忠誠的部下，當你成為鮮血之王後，為了取得適合的劍，還曾經來到這裡取劍，你忘了？
	sleep(30)
	Say(NPC1 , "[SC_422826_13]")	--果然還需要更多的回憶碎片，來幫助你才行。
	sleep(20)
	ScriptMessage( OwnerID(), PP, 0, "[SC_422826_14]", 0 )	
	ScriptMessage( OwnerID(), PP, 1, "[SC_422826_14]", 0 )	--[113628]的身影顫抖了起來，發出淒厲的叫聲
	PlayMotion(OwnerID() , ruFUSION_ACTORSTATE_EMOTE_ANGRY)

	sleep(20)
	Say(OwnerID() , "[SC_422826_15]")	--不可能……不可能……主人他怎麼可能是鮮血之王。
	sleep(30)
	Say(NPC2 , "[SC_422826_16]")	--我不記得了，不過我更不記得曾有養過這麼不重用的廢物。......
	sleep(20)
	PlayMotion(NPC2 , ruFUSION_ACTORSTATE_EMOTE_POINT)
	ScriptMessage( OwnerID(), PP, 0, "[SC_422826_17]", 0 )	
	ScriptMessage( OwnerID(), PP, 1, "[SC_422826_17]", 0 )	-- [113628]的身影顫慄且劇烈的搖晃著並喃喃自語著。
	PlayMotion(OwnerID() , ruFUSION_ACTORSTATE_HURT_NORMAL)
	sleep(20)
	Say(OwnerID() , "[SC_422826_18]")	--被殺死的瞬間，我的確有懷疑過殺我的那人，與主人的使用的刀劍的手法，太像……太像。
	sleep(30)
	Say(OwnerID() , "[SC_422826_19]")	--但我從來就沒有相信過我心底的那絲質疑。你不是我的主人，絕對不能是我的主人。
	sleep(30)
	Say(NPC2 , "[SC_422826_20]")	--即使沒有記憶，但有一點我還知道，不該存在的最好還是不要存在這世界上。
	sleep(30)
	Say(NPC2 , "[SC_422826_21]")	--我會讓你獲得解脫。
	sleep(10)
	PlayMotion(NPC2  , ruFUSION_ACTORSTATE_ATTACK_1H)
--	sleep(10)
--	SetDefIdleMotion(OwnerID(),ruFUSION_MIME_DEATH_LOOP)
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_DYING,ruFUSION_ACTORSTATE_DEAD)


	local Player = SearchRangePlayer(OwnerID() , 350)
	For i=0,table.getn(Player)-1 do
		If	CheckAcceptQuest( Player[i], 422826 )	or
			CheckAcceptQuest( Player[i], 422827 )	then
			SetFlag(Player[i] , 543438 , 1)
		end
	end

	sleep(30)
	ScriptMessage( OwnerID(), TargetID(), 0, "[SC_422826_0_3]", 0 )	
	ScriptMessage( OwnerID(), TargetID(), 1, "[SC_422826_0_3]", 0 )	--[113691]利用法術取得[113628]的記憶碎片！
	CastSpell( NPC1 , OwnerID() , 494410 )	--
	sleep(20)
	Hide(OwnerID())
	AddBuff( NPC1 ,  502383 , 0 , 1 )
	sleep(10)
	ScriptMessage( OwnerID(), TargetID(), 0, "[SC_422826_0_1]", 0 )	
	ScriptMessage( OwnerID(), TargetID(), 1, "[SC_422826_0_1]", 0 )	--緹亞娜獲得威廉的記憶碎片！
	sleep(20)
	Say(NPC1 , "[SC_422826_22]")	--呵，有了這個記憶碎片，你會回憶起更多的往事，我的安德薩斯。
	sleep(30)
	Say(NPC2 , "[SC_422826_23]")	--回憶嗎？唔～
	sleep(10)
	PlayMotion(NPC2  , ruFUSION_ACTORSTATE_CROUCH_BEGIN)	--(安德薩斯開始崩毀)跪地
--	PlayMotion(NPC2  , ruFUSION_ACTORSTATE_CROUCH_END)	--(安德薩斯開始崩毀)跪地
	ScriptMessage( OwnerID(), PP, 0, "[SC_422826_0_2]", 0 )	--安德薩斯因為諾芙的守護之石而開始崩毀！	
	ScriptMessage( OwnerID(), PP, 1, "[SC_422826_0_2]", 0 )
	sleep(30)
	Say(NPC1 , "[SC_422826_24]")	--[113686]？
	Delobj( NPC2 )
	sleep(30)
	Say(NPC1 , "[SC_422826_25]")	--該死，又是[113633]壞事......
	sleep(30)
	for i =5, 16, 1 do
		local j = CreateObjByFlag( 102794 , 780467 , i , 0 )  
		CallPlot( j , "LuaFunc_Obj_Suicide" , 300 )
		AddToPartition( j , 0 )
		if CheckID( PP ) == true and ReadRoleValue( PP , EM_RoleValue_IsDead) == 0 then
			SetAttack( j , PP )
		end
	end
	sleep(30)
	Say(NPC1 , "[SC_422826_27]")	--回去告訴[113633]，千年來的恩怨也該清算清算了！.....
	sleep(30)
	Delobj( NPC1 )

	sleep(20)
	Delobj( OwnerID() )
end

--------鮮血之王安德薩斯

function LuaS_422828_0()
	SetSpeakDetail(OwnerID(),"[SC_422828_1]")	--萬物自有它的一套規律、方向，而我打破了這個規律...
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422828_2]","LuaS_422828_1",0)		--血之禮讚 ？
end

function LuaS_422828_1()
	SetSpeakDetail(OwnerID(),"[SC_422828_3]")	--沒錯，因為禁忌符文的影響，讓這把劍有了不一樣的變化...
	SetFlag(OwnerID() , 543448 , 1)
end

-----取得真實之石
function LuaM_422829_Check()
	if CheckAcceptQuest( OwnerID() , 422829 ) == false or CountBodyItem(OwnerID() , 206171) > 0 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422507_0]" , 0 ) --你目前不需要這麼做
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422507_0]" , 0 ) 
		return false
	end

	if ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) ~= 102771 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204624_2]" , 0 ) --目標錯誤
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204624_2]" , 0 ) 
		return false
	end
	if ReadRoleValue( TargetID() , EM_RoleValue_IsDead ) == 1  then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422829]" , 0 ) --[102771]已經死了！
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422829]" , 0 ) 
		return false
	end
	if ReadRoleValue( TargetID() , EM_RoleValue_AttackTargetID ) ~= OwnerID()  then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422829_1]" , 0 ) --你必須先讓[102771]注意到你！
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422829_1]" , 0 ) 
		return false
	end
	if ReadRoleValue( TargetID() , EM_RoleValue_HP ) >  ReadRoleValue( TargetID() , EM_RoleValue_MaxHP )/2  then
		SetAttack( TargetID() , OwnerID() )
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422829_2]" , 0 ) --[102771]頑強抵抗！
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422829_2]" , 0 ) 
		return false
	end
	return true
end

function LuaM_422829_Effect()
	BeginPlot( TargetID() , "LuaM_422829_Reset" , 0 )

	local Party = LuaFunc_PartyData(OwnerID())
	for i = 1 , Party[0] , 1 do
		if 	CheckAcceptQuest( Party[i] , 422829 ) == true and
 			CountBodyItem( Party[i], 206171 )<1	and
			GetDistance(Party[i] , OwnerID() ) < 200 and 
			ReadRoleValue(Party[i] ,EM_RoleValue_IsDead) == 0 then
				GiveBodyItem( Party[i] , 206171 , 1 )
		end
	end
end

function LuaM_422829_Reset()
	LuaFunc_ResetObj( OwnerID() ) 
end

------淨化之石

function LuaS_422830()
	SetSpeakDetail(OwnerID(),"[SC_ 422830_1]")	--[206172]？你知道這是個什麼樣的東西嗎？......
	GiveBodyItem( OwnerID() , 206172 , 1 )
end

-----滅魔之痕

function LuaS_113769()
	LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest( OwnerID() , 422833 ) == true	and 
		CheckCompleteQuest( OwnerID() , 422833) == false and CheckFlag( OwnerID() , 543457) == false then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422833_0]","LuaS_422833_0",0)	--我準備好了！讓我們一起擊敗[113672]吧！
	end
end

function LuaS_422833_0()
	CloseSpeak( OwnerID() )
	if	ReadRoleValue( TargetID() , EM_RoleValue_Register ) == 0 then
		DisableQuest(TargetID() ,true )
		BeginPlot( TargetID() , "LuaS_422833_1" , 0 )
	end
end

function LuaS_422833_1()
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 1 )
	Say(OwnerID() , "[SC_422833_01]")	--出來吧！[113672]......該是解決恩怨的時刻了！
	sleep(20)
	local AA = CreateObjByFlag( 113810 , 780482 , 1 , 0 )  --緹亞娜
	AddToPartition( AA , 0 )
	MoveToFlagEnabled( AA , false )
	LuaFunc_MoveToFlag(AA , 780482 , 2 ,  0 )
	PlayMotion( AA ,  ruFUSION_ACTORSTATE_EMOTE_LAUGH )
	Say(AA , "[SC_422833_02]")		--[113678]呢？哈哈哈～那個膽小鬼鐵定又躲起來了吧？
	sleep(30)
	PlayMotion( AA ,  ruFUSION_ACTORSTATE_EMOTE_POINT )
	Say(AA , "[SC_422833_03]")		--無所謂，就讓我的[102775]寶貝來陪你們玩玩吧！
	AdjustFaceDir( AA,OwnerID(), 0 ) 
	sleep(30)

	local BB = CreateObjByFlag( 102836 , 780482 , 3 , 0 )  --傀儡安德薩斯
	SetFightMode( BB, 0 , 1 , 0 , 0 )
	AddToPartition( BB , 0 )
	WriteRoleValue( AA , EM_RoleValue_PID , BB )
	WriteRoleValue( BB , EM_RoleValue_PID , AA )

	BeginPlot( AA , "LuaS_422833_AA_CHECK" , 0 )		--在緹亞娜身上檢查安德薩斯在不在
	CallPlot( BB , "LuaFunc_Obj_Suicide" , 300 )		--離開戰鬥，安德薩斯就消失
	SetPlot(BB,"dead","LuaS_422833_BB_dead",0 )		--安德薩斯自然死後，改變緹亞娜的PID

	sleep(20)
	Yell(AA , "[SC_422833_04]" , 3)		--讓他們知道你的厲害，[102775]～
	PlayMotion( AA ,  ruFUSION_ACTORSTATE_EMOTE_THREATEN )
	sleep(30)
	FaceObj( BB ,OwnerID() )
	PlayMotion( BB , ruFUSION_ACTORSTATE_ATTACK_2H_SP )
	sleep(10)
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_HURT_NORMAL )
	sleep(10)
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_DYING )
	SetFightMode(BB, 1 , 1 , 1 , 1 )
	sleep(10)
	Hide( OwnerID() )
	SetAttack(BB,TargetID())
	Yell(AA , "[SC_422833_05]" , 3)		--四處飛濺的鮮血，真是太美麗了！

	for i = 0 , 100 , 1 do		--判斷緹亞娜不在場上，讓瑞紫蓓顯示出來
		if CheckID(AA)    == false  then
			break
		end
		sleep( 30 )
	end
	Show( OwnerID() , 0 )
	DisableQuest(OwnerID() ,false )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
end

function LuaS_422833_AA_CHECK()
	local MonBB = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	for i = 0 , 100 , 1 do
		if CheckID(MonBB) == false  then
			break
		else
			AdjustFaceDir( OwnerID() , MonBB , 0 )
			if i > 5 then
				if DW_Rand(2) > 1 then
					PlayMotion( OwnerID()  ,  ruFUSION_ACTORSTATE_EMOTE_ANGRY )
				end
			end
		end
		sleep( 30 )
	end
	sleep(20)	
	if	ReadRoleValue(OwnerID(),EM_RoleValue_Register) > 0	then
		BeginPlot( OwnerID() , "LuaS_422833_2" , 0 )
	else
		Delobj( OwnerID() )
	end
end

function LuaS_422833_BB_dead()
	local MonAA = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	WriteRoleValue( MonAA , EM_RoleValue_Register , 1 )
	Delobj( OwnerID() )
	return false
end

function LuaS_422833_2()
	MoveToFlagEnabled( OwnerID() , false )
	PlayMotion( OwnerID()  ,  ruFUSION_ACTORSTATE_EMOTE_POINT )
	sleep(10)
	Say(OwnerID() , "[SC_422833_06]")		--瞧你們做的好事！你們把我的[102775]怎麼了？
	sleep(20)
	Say(OwnerID() , "[SC_422833_07]")		--我真的生氣了！我要親自對付你們！
	CastSpell(OwnerID(),OwnerID(),491276)
	sleep(20)
	Hide(OwnerID())
	local C1 = LuaFunc_CreateObjByOBj( 102837, OwnerID() )		--真的
	AddBuff( C1 ,504992 ,100 ,-1 )
	local C2 = LuaFunc_CreateObjByOBj( 102838, OwnerID() )		--假的
	AddBuff( C2 ,504992 ,100 ,-1 )
	local C3 = LuaFunc_CreateObjByOBj( 102838, OwnerID() )		--假的
	AddBuff( C3 ,504992 ,100 ,-1 )
	WriteRoleValue( C2 , EM_RoleValue_PID , C1 )
	WriteRoleValue( C3 , EM_RoleValue_PID , C1 )
	SetPlot(C1,"dead","LuaS_422833_C1_dead",0 )		
	SetPlot(C2,"dead","LuaS_422833_C2_dead",0 )		
	SetPlot(C3,"dead","LuaS_422833_C2_dead",0 )		
	BeginPlot( C2 , "LuaS_422833_C2_CHECK" , 0 )
	BeginPlot( C3 , "LuaS_422833_C2_CHECK" , 0 )
	SetAttack(C1,TargetID())
	SetAttack(C2,TargetID())
	SetAttack(C3,TargetID())
	CallPlot( C1 , "LuaFunc_Obj_Suicide" , 300 )	
	CallPlot( C2 , "LuaFunc_Obj_Suicide" , 300 )	
	CallPlot( C3 , "LuaFunc_Obj_Suicide" , 300 )	

	for i = 0 , 100 , 1 do
		if CheckID(C1) == false  then
			break
		end
		sleep( 60 )
	end

--戰鬥完開始演戲
	Show( OwnerID() , 0 )
	PlayMotionEX( OwnerID(),ruFUSION_ACTORSTATE_SIT_BEGIN , ruFUSION_ACTORSTATE_SIT_LOOP)
	local DD = CreateObjByFlag( 113683 , 780482 , 4 , 0 )  --諾芙
	AddToPartition( DD , 0 )
	MoveToFlagEnabled( DD , false )
	LuaFunc_MoveToFlag(DD , 780482 , 5 ,  0 )
	AdjustFaceDir( DD, OwnerID(), 0 ) 
	sleep(5) 
	SetDefIdleMotion( DD, ruFUSION_MIME_EMOTE_SPEAK)
	Say(DD , "[SC_422833]")		--[102804]，住手吧......千年來，你已經造下太多的罪惡......
	sleep(30)
	Say(OwnerID() , "[SC_422833_1]")		--你這令人作噁的女人，妳根本不了解我的心境。
	sleep(30)
	Say(DD , "[SC_422833_2]")		--請你相信我明白你的痛處，[102775]已死去千年了，你和我一樣悲傷......		
	sleep(30)
	Say(OwnerID() , "[SC_422833_3]")		--妳什麼都不懂，什麼也沒做就能搶走我的所有！
	sleep(20)
	Say(OwnerID() , "[SC_422833_4]")		--我就是要妳痛苦，非要妳痛苦才能彌平我心中的恨意。	
	sleep(30)
	Say(DD , "[SC_422833_5]")		--不是這樣的，[102804]，靜下心來，妳的痛苦來自於妳對他的執著，讓憤恨蒙蔽了妳的心智。
	SetDefIdleMotion( DD, ruFUSION_MIME_NONE)
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_SIT_END )
	sleep(30)
	Say(OwnerID() , "[SC_422833_6]")	--矇蔽？哈哈......被矇蔽的是世界上的所有人！他們不但相信妳滿口偽善的謊言，還奉妳為神。
	AdjustFaceDir( OwnerID(), DD , 0 ) 
	PlayMotion(  OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_LAUGH)
	sleep(30)
	Say(OwnerID() , "[SC_422833_7]")	--可笑的是，他們口中的神，其實是個懦弱躲藏，把自己放在聖潔地位的膽小鬼，而這樣的人竟從我手中搶走[102775]！
	PlayMotion(  OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_POINT)
	sleep(30)
	Say(OwnerID() , "[SC_422833_8]")	--這世界上，只有妳最沒資格說我！
	PlayMotion(  OwnerID() ,ruFUSION_ACTORSTATE_ATTACK_1H)
	sleep(30)
	SetDefIdleMotion( DD, ruFUSION_MIME_EMOTE_SPEAK)
	Say(DD , "[SC_422833_9]")		--我......並不聖潔，也不曾認為自己是神聖......聆聽妳的心吧！[102804]，它正在哭泣......
	sleep(30)
	Say(DD , "[SC_422833_10]")	--然而我能怎麼幫助妳？
	sleep(30)
	Say(DD , "[SC_422833_11]")	--如果過去的回憶，讓妳感到痛苦，也許遺忘它們能讓妳獲得解脫......
	sleep(30)
	Say(OwnerID() , "[SC_422833_12]")	--妳想對我做什麼？
	sleep(30)
	Say(DD , "[SC_422833_13]")	--不要害怕，忘卻了[102775]，妳將獲得重生。
	SetDefIdleMotion( DD, ruFUSION_MIME_NONE)
	sleep(30)
	Say(OwnerID() , "[SC_422833_14]")	--妳憑什麼自作主張決定？擁有他的回憶讓我撐到現在，妳搶走他，而現在要對我的記憶下手？
	PlayMotion(  OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_POINT)
	sleep(30)
	Say(OwnerID() , "[SC_422833_15]")	--滾開！撤下妳那自以為是的救贖！妳根本救不了任何人，沒有[102775]的生活我不需要。
	PlayMotion(  OwnerID() ,ruFUSION_ACTORSTATE_ATTACK_1H)
	sleep(30)
	Say(OwnerID() , "[SC_422833_16]")	--不！住手，我不要自己一個人活著......與其被妳奪去記憶，我寧願面對死亡！
	PlayMotion(  OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_CRY)
	sleep(30)
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_DYING,ruFUSION_ACTORSTATE_DEAD)
--	SetDefIdleMotion(OwnerID(),ruFUSION_MIME_DEATH_LOOP)
	sleep(40)
	PlayMotionEX(DD , ruFUSION_ACTORSTATE_CROUCH_BEGIN,ruFUSION_ACTORSTATE_CROUCH_LOOP)
	Say(DD , "[SC_422833_17]")	--[102804]......
	sleep(30)
	Delobj( DD )
	Delobj( OwnerID() )
end

function LuaS_422833_C1_dead()
	local Player 
	for i=0, HateListCount( OwnerID() )-1 do
		Player = HateListInfo(OwnerID() , i , EM_HateListInfoType_GItemID )
		if	CheckAcceptQuest ( Player   , 422833 )	then
			SetFlag( Player   , 543457, 1 )
		end	
	end	
	Delobj( OwnerID() )
	return false
end

function LuaS_422833_C2_dead()
	Say(OwnerID() , "[SC_422833_08]")	--哈哈哈！這不過是我的一個分身罷了！
	local FF = ReadRoleValue ( OwnerID(), EM_RoleValue_MaxHP )
	WriteRoleValue ( OwnerID() , EM_RoleValue_HP, FF )
	return false
end

function LuaS_422833_C2_CHECK()
	local MonCC = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	for i = 0 , 100 , 1 do
		if CheckID(MonCC) == false  then
			break
		end
		sleep( 30 )
	end
	Delobj( OwnerID() )
end




---真實之石使用檢查
function LuaM_206173_Check()
	if CheckAcceptQuest( OwnerID() , 422833 ) == false or CheckFlag(OwnerID() , 543457) ==true or CheckCompleteQuest( OwnerID() , 422833 ) == true then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422507_0]" , 0 ) --你目前不需要這麼做
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422507_0]" , 0 ) 
		return false
	end
	if ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) ~= 102837	and
	   ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) ~= 102838 	then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204624_2]" , 0 ) --目標錯誤
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204624_2]" , 0 ) 
		return false
	end
	return true
end

function LuaM_206173_Effect()
	if ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 102837	then
		if  CheckBuff( TargetID() , 504992) == true	then	
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_206173]" , 0 ) --[206173]開始作用！
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_206173]" , 0 ) 
			CancelBuff( TargetID() , 504992 )
			Say(TargetID() , "[SC_206173_1]")	--這怎麼可能？你竟然能破除我的魅惑......
		else
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_206173_2]" , 0 ) --你已經識破[113672]的偽裝！
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_206173_2]" , 0 ) 
		end
	end

	if ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 102838	then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_206173_3]" , 0 ) --這不是[113672]的本體！
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_206173_3]" , 0 ) 
	end
end









