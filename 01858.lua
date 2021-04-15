

--======================================================================================================
--423255	和不愛翻土的小伙子對話
--======================================================================================================
function LuaS_423255_0()
	
	LoadQuestOption(OwnerID()) 	
	--吃卡多芋就好了，種什麼田？
	if 	CheckAcceptQuest(OwnerID(),423255)==true 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423255_0]","LuaS_423255_1",0)
		--「嘿，當然要種，等到卡多芋吃完就來不及了。」
	end
end

function LuaS_423255_1()
	SetSpeakDetail(OwnerID(),"[SC_423255_1]")
	--既然是你說的，一定有道理，我回去種田了。
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423255_1_1]","LuaS_423255_2",0)
	--「長老看見你回去會很欣慰的。」
end

function LuaS_423255_2()
	CloseSpeak(OwnerID())
	SetFlag(OwnerID(),543948,1)	--得到旗標，觸發村民的client
end

function LuaS_423255_3()
	LoadQuestOption(OwnerID()) 	
	--就算我們再努力，其他村民還是不接受我們，有必要那麼累的去種田嗎？一點意義都沒有。
	if 	CheckAcceptQuest(OwnerID(),423255)==true 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423255_2]","LuaS_423255_4",0)
		--「辛勤耕作不一定會有好收成，但你有見過因此而放棄播種的農夫嗎？」
	end
end

function LuaS_423255_4()
	SetSpeakDetail(OwnerID(),"[SC_423255_3]")
	--是長老請你來的吧？謝謝你，提醒我不應該忘了初衷，當初我們做這些事並沒有存著什麼目的，
	--只是單純的出於感謝，因為有一個可以安頓的地方。呵呵，我該回去翻土了。
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423255_4]","LuaS_423255_5",0)
	--「去吧。」
end

function LuaS_423255_5()
	CloseSpeak(OwnerID())
	SetFlag(OwnerID(),543981,1)	--得到旗標
end

function LuaS_423255_6()
	LoadQuestOption(OwnerID()) 	
	--翻土這個工作真是累死人了，現在的陽光正好我打個小瞌睡......
	if 	CheckAcceptQuest(OwnerID(),423255)==true 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423255_5]","LuaS_423255_7",0)
		--「居然翻幾下土就喊累，你是老頭子還是年輕人？」
	end
end

function LuaS_423255_7()
	SetSpeakDetail(OwnerID(),"[SC_423255_6]")
	--是誰在哪裡？啊，是你......別以為你為我們做了點事，就可以在這裡對我指手畫腳的，再說，你還沒讓那些石頭腦袋聽你的呢，哼！
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423255_7]","LuaS_423255_8",0)
	--「是啊，現在我眼前也有一顆石頭腦袋不聽我的呢。」
end

function LuaS_423255_8()
	SetSpeakDetail(OwnerID(),"[SC_423255_8]")
	--你說我是什麼？我、我......對啊，剛剛這些話一向是那些石頭腦袋們會說的，我是怎麼了？哎！還是回去翻土吧！
	SetFlag(OwnerID(),543982,1)	--得到旗標，觸發村民的client
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423255_9]","LuaS_423255_9",0)
	--「想想收穫時的喜悅。」
end

function LuaS_423255_9()
	CloseSpeak(OwnerID())
	SetFlag(OwnerID(),543982,1)	--得到旗標
end



--======================================================================================================
--423256	接任務後script，完成後給旗標，隱去發任務湯尼及伊崔妮，故只鎖不用hide ownerid
--======================================================================================================
function LuaS_423256_0()
	DisableQuest( OwnerID() , true )
	AddBuff( TargetID()  , 504004  , 1 , 300 ) 
	local Ton = LuaFunc_CreateObjByObj( 115078 , OwnerID() )
	local Rose = Lua_DW_CreateObj("flag" ,115081,780630,1)
		DisableQuest(Ton , true )					--關閉對話
			DisableQuest(Rose , true )					--關閉對話
	Hide(Rose)
	Sleep(10)
	Hide(Ton)
	Show(Ton,0)
	WriteRoleValue (Ton, EM_RoleValue_IsWalk, 0)
	WriteRoleValue (Rose, EM_RoleValue_IsWalk, 0)
	Sleep(10)
	Beginplot(Ton,"LuaS_423256_1",0)	
	Sleep(20)
	Show(Rose,0)

--	Beginplot(Rose,"LuaS_423256_2",0)
	Say(Rose,"[SC_423256_ACT0]")						--湯尼少爺，請等等我！
	DW_MoveToFlag(Rose,780630,3,0,1)
--	Sleep(50)
	AdjustFaceDir(  Rose,TargetID() , 3 )
	Say(Rose,"[SC_423256_ACT2]")						--[$playername]，我與湯尼少爺先行，你一會到卻普瑞谷地入口找我們。
	Sleep(30)
	DW_MoveToFlag(Rose,780630,2,0,1)
	CancelBuff( TargetID()  , 504004  ) 	--還玩家自由
	Delobj(Ton)
	Delobj(Rose)
	DisableQuest( OwnerID() , false )
end


function LuaS_423256_1()
	DW_MoveToFlag(OwnerID(),780630,2,0,1)
	Hide(OwnerID())
end

function LuaS_423256_2()
	DW_MoveToFlag(OwnerID(),780630,3,0,1)
end





--======================================================================================================
--423257	任務後script	OwnerID=伊崔妮，會掛client
--======================================================================================================
function LuaS_423257_ACT0()	
--	Hide(OwnerID())
	DisableQuest( OwnerID() , true )
	AddBuff( TargetID()  , 503977 , 1 , 300 )
	local Rose = LuaFunc_CreateObjByObj(115270 , OwnerID() )
	SetFlag(TargetID(),544014,1)	--給看戲旗標
	local Cral = Lua_DW_CreateObj("flag" ,115138,780631,1)
	local Jx = Lua_DW_CreateObj("flag" ,115264,780631,2)
	Local Ton = Lua_DW_CreateObj("flag" ,115273,780631,3) 
	DisableQuest(Rose, true )	
	DisableQuest(Cral , true )	
	DisableQuest(Jx , true )	
	DisableQuest(Ton, true )	

--	Sleep(10)
	Hide(Rose)
	Hide(Cral)
	Hide(Ton)
	Show(Rose,0)
	WriteRoleValue (Rose, EM_RoleValue_IsWalk, 1)
	WriteRoleValue (Cral, EM_RoleValue_IsWalk, 1)
	WriteRoleValue (Ton, EM_RoleValue_IsWalk, 1)
	Sleep(20)	
	Show(Ton,0)
	Show(Cral,0)
	Beginplot(Cral,"LuaS_423257_ACT2",0)
--	Sleep(30)
	
	Sleep(20)
	Say(Cral,"[SC_423257_ACT1]")					--不用謝我，目前最先要做的是，確認巨大卻普瑞是否真的存在，剛才晨星和我在附近繞了一下，沒看到什麼像是巨獸的生物，不過......
	Beginplot(Ton,"LuaS_423257_ACT1",0)
	Sleep(40)
	
	PlayMotion(Cral,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Say(Cral,"[SC_423257_ACT2]")					--還有，你們注意到了嗎？這裡地形怪奇，有不少很隱密的洞穴，而且這些卻普瑞進退行動還有著隱然的秩序。
	Sleep(30)
	
	PlayMotion(Rose,ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	Say(Rose,"[SC_423257_ACT3]")				--是啊，像是遵循著什麼人的指令在行動。
	Sleep(20)
	
	Local Derek = Lua_DW_CreateObj("flag" ,115083,780631,6)
	DisableQuest(Derek, true )
	DW_MoveToFlag(Derek,780631,7,0,1)
	AdjustFaceDir( Derek, Ton ,3 )
	
	PlayMotion(Derek,ruFUSION_ACTORSTATE_EMOTE_APPLAUSE)	--拍手
	Say(Derek,"[SC_423257_ACT4]")					--看看我找到了誰......
	Sleep(40)
	AdjustFaceDir( Ton, Derek ,3 )
	AdjustFaceDir( Cral , Derek ,3 )
	AdjustFaceDir( Rose , Derek ,3 )
	AdjustFaceDir( Jx , Derek ,3 )
	
	PlayMotionEX(Derek,ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_LOOP)
	Say(Derek,"[SC_423257_ACT5]")					--我尊貴的人王陛下，請接受萊慕恩王國的德銳克．怒牙向您致上最誠摯的敬意。
	Sleep(40)
	PlayMotion(Derek,ruFUSION_ACTORSTATE_CROUCH_END)
	Sleep(20)

	PlayMotion(Rose,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Say(Rose,"[SC_423257_ACT6]")					--此次領主國會議，並未見到貴國派遺任何使者。
	Sleep(30)
	
	PlayMotion(Derek,ruFUSION_ACTORSTATE_BUFF_SP01)
	Say(Derek,"[SC_423257_ACT7]")					--鐵牙部族在萊慕恩國己失去應有的勢力，你們眼前的，是一名被奪去將軍之銜、拋棄弟兄，一無所有的犬人。
	Sleep(50)
	
	PlayMotion(Ton,ruFUSION_ACTORSTATE_EMOTE_POINT)
	Say(Ton,"[SC_423257_ACT8]")						--你怎麼會在這裡？
	Sleep(30)
	
	PlayMotion(Derek,ruFUSION_ACTORSTATE_EMOTE_SPEAK)	--說話
	Say(Derek,"[SC_423257_ACT9]")					--陛下，您問了一個好問題。千年前，先祖卡沃克．怒牙在向人王卡薩姆表示歸順之時，是否也曾回答當年的卡薩姆陛下同樣的問題呢？這個不會有人知道了。
	Sleep(60)
	
	PlayMotion(Derek,ruFUSION_ACTORSTATE_EMOTE_CRY)
	Say(Derek,"[SC_423257_ACT10]")					--不過，千年後的現在，人王卡薩姆的血脈卻將斷絕在我的手上，是不是很諷刺呢？					--奇普！
	Sleep(40)
	
	local Chip = Lua_DW_CreateObj("flag" ,115277,780631,8)
	DisableQuest(Chip, true )
	--AddBuff(TargetID(),506116,1,300)			--放光
	CastSpell(Derek,TargetID(),491276)
	Sleep(30)
	Delobj(Derek)
	Delobj(Ton)
	Sleep(20)
	Hide(Rose)
	Show(Rose,0)
	Hide(Cral)
	Show(Cral,0)
	WriteRoleValue (Rose, EM_RoleValue_IsWalk, 0)
	WriteRoleValue (Cral, EM_RoleValue_IsWalk, 0)
	Sleep(10)
	
	local Derek = Lua_DW_CreateObj("flag" ,115083,780631,9)
	local Ton = Lua_DW_CreateObj("flag" ,115273,780631,10)
	DisableQuest( Derek, true )
	DisableQuest(Ton, true )
	PlayMotion(Ton,ruFUSION_ACTORSTATE_DYING)	--湯尼做躺下動作
	Sleep(30)
	
	PlayMotion(Rose,ruFUSION_ACTORSTATE_CAST_SP01)
	Say(Rose,"[SC_423257_ACT11]")				--保護陛下！
	Sleep(20)
	
	--AddBuff(TargetID(),506116,1,300)			--放光
	CastSpell(Derek,TargetID(),491276)
	Sleep(30)
	Delobj(Derek)
	Delobj(Ton)
	Delobj(Chip)
	
	PlayMotion(Cral,ruFUSION_ACTORSTATE_BUFF_SP01)
--	Say(Cral,"[SC_423257_ACT12]")				--是巨大卻普瑞！
--	Sleep(20)

	Beginplot(Cral,"LuaS_423257_ACT3",0)
	Sleep(10)
	DW_MoveToFlag(Jx,780631,11,0,1)
	Hide(Jx)

	CancelBuff( TargetID()  , 503977  ) 	--還玩家自由
	Setflag(TargetID(),544014,0)
	Delobj(Rose)
	Delobj(Cral)
	
	Setflag(TargetID(),543934,1)
	DisableQuest( OwnerID() , false )
end	
	
function LuaS_423257_ACT1()
	DW_MoveToFlag(OwnerID(),780631,4,0,1)
end

function LuaS_423257_ACT2()
	DW_MoveToFlag(OwnerID(),780631,5,0,1)
end

function LuaS_423257_ACT3()
	DW_MoveToFlag(OwnerID(),780631,11,0,1)
	Hide(OwnerID())
end


function LuaS_423257_Break()	
	LoadQuestOption(OwnerID()) 
	if 	CheckCompleteQuest(OwnerID(),423257)==true	and
		CheckAcceptQuest(OwnerID(),423258)==false	and
		Checkflag(OwnerID(),543934)==false			then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423257_ACT12]","LuaS_423257_Break1",0)	--再次觀賞劇情
		
	end
end

function LuaS_423257_Break1()
	CloseSpeak(OwnerID())
	Setflag(OwnerID(),543934,1)
end		
	


	
	
	


--======================================================================================================
--423258	接下任務script	OwnerID=伊崔妮
--======================================================================================================
function LuaS_423258_ACT0()
	if 	(CheckAcceptQuest(TargetID(),423258)== true ) 		and
	 	(CheckCompleteQuest(TargetID(),423258)==  false)  	and
		(CheckAcceptQuest(TargetID(),423259)== false)		and 
		(CheckFlag(TargetID(), 543935 )==false) 		then
		AddBuff( TargetID()  , 504004 , 1 , 300 )	
		DisableQuest( OwnerID() , true )
		--
		local Rose = LuaFunc_CreateObjByObj(115279 , OwnerID() )
		DisableQuest(Rose, true )
		Sleep(20)
		WriteRoleValue (Rose, EM_RoleValue_IsWalk, 0)
		
		local Dog1  = Lua_DW_CreateObj("flag" ,103557,780633,1)			
		local Dog2  = Lua_DW_CreateObj("flag" ,103557,780633,2)
		local Dog3  = Lua_DW_CreateObj("flag" ,103557,780633,3)
			

		
			Setplot(Dog1,"dead","LuaS_423258_Dead",100)	--讓怪物死亡時屍體即消失
			Setplot(Dog2,"dead","LuaS_423258_Dead",100)
			Setplot(Dog3,"dead","LuaS_423258_Dead",100)

		SetDefIdleMotion(Dog1,ruFUSION_MIME_IDLE_COMBAT_1H	)
		SetDefIdleMotion(Dog2,ruFUSION_MIME_IDLE_COMBAT_1H	)
		SetDefIdleMotion(Dog3,ruFUSION_MIME_IDLE_COMBAT_1H	)
		
		SetModeEx(Rose,EM_SetModeType_Strikback,true) 		--反擊
		SetModeEx(Rose,EM_SetModeType_Fight,true) 			--攻擊
		SetModeEx(Rose,EM_SetModeType_Searchenemy,true) 	--索敵

		SetAttack(Dog2 , Rose)
		SetAttack(Dog1 , Rose)
		SetAttack(Dog3 , Rose)
		SetAttack(Rose,Dog3)

		local player="here"
		local Monster="NotDead"
		local MonID="true"
	
		while 1 do
			if 	CheckAcceptQuest(TargetID(),423258)== false			then
				break
			end
			
			if	ReadRoleValue(TargetID() , EM_RoleValue_IsDead)==1 	or
				CheckID(TargetID()) == false	then
				player="Nothere"
				break	
			end
			
			if 	(ReadRoleValue(Dog1, EM_RoleValue_IsDead)==1 or  CheckID(Dog1)== false)	and	--小宏修，因為死掉後消失的屍體系統不會列入消失判斷，合在一起判斷，就不會變成怪死掉很久，才給任務旗標的問題
				(ReadRoleValue(Dog2, EM_RoleValue_IsDead)==1 or  CheckID(Dog2)== false) 	and
				(ReadRoleValue(Dog3, EM_RoleValue_IsDead)==1 or  CheckID(Dog3)== false)	then
				Monster="IsDead"
				break
			end
			Sleep(10)
		end
	
		Local X = ReadRoleValue(OwnerID(),EM_RoleValue_X)
		Local Y = ReadRoleValue(OwnerID(),EM_RoleValue_Y)
		Local Z = ReadRoleValue(OwnerID(),EM_RoleValue_Z)
		
		if player=="Nothere" then
			
			ScriptMessage(OwnerID(), TargetID() , 1 , "[SAY_420635_1]" , 0 )		--任務失敗，請放棄重接
			ScriptMessage(OwnerID(), TargetID() , 0 , "[SAY_420635_1]" , 0 )		--任務失敗，請放棄重接
			Sleep(30)
			ScriptMessage(OwnerID(), TargetID() , 1 , "[SAY_420635_1]" , 0 )		--任務失敗，請放棄重接
			ScriptMessage(OwnerID(), TargetID() , 1 , "[SAY_420635_1]" , 0 )		--任務失敗，請放棄重接
			SetStopAttack(Rose)
			SetStopAttack(Dog1)
			SetStopAttack(Dog2)
			SetStopAttack(Dog3)

			Delobj(Dog1)
			Delobj(Dog2)
			Delobj(Dog3)
		end
		
		if  (CheckAcceptQuest(TargetID(),423258)== true ) 		and
			(CheckCompleteQuest(TargetID(),423258)==  false)  	and
			(CheckAcceptQuest(TargetID(),423259)== false)		and 
			(CheckFlag(TargetID(), 543935 )==false) 		then
			if	Monster=="IsDead" or MonID=="false" then
				Move(Rose,X,Y,Z)		--讀115272的座標，填入
				SetFlag(TargetID() , 543935 , 1)		--給旗標，完成任務，並讓還任務伊崔妮出現 
				Hide(Rose)
				Show(OwnerID(),0)
				Sleep(40)
					SetStopAttack(Rose)
					SetStopAttack(Dog1)
					SetStopAttack(Dog2)
					SetStopAttack(Dog3)
	
				Delobj(Dog1)
				Delobj(Dog2)
				Delobj(Dog3)
			end
		end
		DisableQuest( OwnerID() , false )
		CancelBuff( TargetID()  , 504004  )	
		DelObj(Rose)
		Delobj(Dog1)
		Delobj(Dog2)
		Delobj(Dog3)
	end
end
	

function LuaS_423258_Dead()
	Sleep(20)
	Delobj(OwnerID())
end


--======================================================================================================
--423259 	將軍出題，猜猜卡拉維是哪一個
--======================================================================================================

function LuaS_423259_104()		--For115104
	LoadQuestOption(OwnerID()) 
	--啊，勇敢的騎士，為了你的國王，你會做出多大的犧牲呢？
	if 	CheckAcceptQuest(OwnerID(),423259)==true 	and
		CheckFlag(OwnerID(), 543929 )==false 		then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423259_0]","LuaS_423259_1",0)
		--「陛下呢？你該不會己經把他......」
	end
	if 	CheckCompleteQuest(OwnerID(),423258)==true 			then
			
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423259_12]","LuaS_423259_Move2",0)
	--不選，讓我離開這裡。
	end
		
end


function LuaS_423259_0()		--For115100
	LoadQuestOption(OwnerID()) 
	--啊，勇敢的騎士，為了你的國王，你會做出多大的犧牲呢？
	if 	CheckAcceptQuest(OwnerID(),423259)==true 	and
		CheckFlag(OwnerID(), 543929 )==false 		then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423259_0]","LuaS_423259_1",0)
		--「陛下呢？你該不會己經把他......」
	end
	if 	CheckAcceptQuest(OwnerID(),423259)==true 	and
		CheckFlag(OwnerID(), 543929 )==true		then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423259_5]","LuaS_423259_12",0)
	--「好，我選。」
	
	end
		
end

function LuaS_423259_1()
	SetSpeakDetail(OwnerID(),"[SC_423259_1]")
	--嘖嘖，耐心，你和那個乳臭未乾的人王小鬼都得學會這一點。
	--我們來玩個遊戲吧，如果你贏了，我就把你的陛下還給你。
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423259_1_1]","LuaS_423259_2",0)
	--「你想做什麼？」
end

function LuaS_423259_2()
	SetSpeakDetail(OwnerID(),"[SC_423259_2]")
	--這個遊戲你一定很有興趣，來，猜猜哪一個是真正的現任人王卡拉維．卡薩姆，好好猜，猜錯的代價可是很高的。
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423259_3]","LuaS_423259_3",0)
	--「不要把別人當笨蛋！」
end

function LuaS_423259_3()
	SetSpeakDetail(OwnerID(),"[SC_423259_4]")
	--不試的話，卡拉維就真的永遠都回不去他那座有著高高的牆，阻擋所有人民哀嚎哭聲傳入的漂亮王宮，
	--當那個在艾翁和夏多爾強大軍力的簇擁保護下，坐等其他領主國前去〞朝聖〞，
	--卻無視那些同樣也是英雄後代的領主們困境的人王，這樣好嗎？ 
	SetFlag(OwnerID(),543929,1)	--給旗標，現出隱藏起的數個卡拉維
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423259_5]","LuaS_423259_12",0)
	--「好，我選。」
	--AddSpeakOption(OwnerID(),TargetID(),"[SC_423259_12]","LuaS_423259_Move2",0)
	--不選，讓我離開這裡。

end

function LuaS_423259_Move2()
	CloseSpeak(OwnerID())
	Say(TargetID(),"[SC_423259_13]")
	BeginPlot( OwnerID() , "LuaQ_423259_Move_3" , 0 )
end

function LuaQ_423259_Move_3()
	CastSpell( OwnerID() , OwnerID() , 491008 )
	sleep(5)
	ChangeZone( OwnerID() , 16 , 0 , -2905.7 ,-794.9, 24806 , 2.3 )
	SetFlag(OwnerID(),544034,1)
end

function LuaS_423259_12()	
	CloseSpeak(OwnerID())
	BeginPlot( OwnerID() , "LuaQ_423259_Accept_Do" , 0 )

end
	
function LuaQ_423259_Accept_Do()
	CastSpell( OwnerID() , OwnerID() , 491008 )
	sleep(5)
	ChangeZone( OwnerID() , 16 , 0 , -3108.4 ,-419, 25098 , 325.9 )
end	
	
	
function LuaS_423259_4()
	LoadQuestOption(OwnerID()) 
	--勇敢的騎士，你選的沒錯，我就是真正的人王共主卡拉維。
	if 	CheckAcceptQuest(OwnerID(),423259)==true 	and
		CheckFlag(OwnerID(),543929)==true			and
		CheckFlag(OwnerID(), 543985 )==false		and
		ReadRoleValue(OwnerID(),EM_RoleValue_IsAttackMode)==0	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423259_6]","LuaS_423259_5",0)
		--「陛下，你是陛下吧。」
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423259_7]","LuaS_423259_6",0)
		--「你不是陛下。」
	end
end

function LuaS_423259_5()
	CloseSpeak(OwnerID())
	Yell(TargetID(),"[SC_423259_8]",1)
	--匍匐在你所選擇的人王腳下，獻出你的熱血吧，哈哈！
	--WriteRoleValue(TargetID(),EM_RoleValue_PID,591)--直接在種出的npc上設pid值
	Beginplot(TargetID(),"LuaS_423259_7",0)

end

function LuaS_423259_6()	
	CloseSpeak(OwnerID())
	PlayMotion(TargetID(),ruFUSION_ACTORSTATE_EMOTE_ANGRY	)
	Yell(TargetID(),"[SC_423259_9]",1)	--是我，當然是我，我是卡拉維！
end

function LuaS_423259_7()	--生怪打玩家
	DisableQuest( OwnerID() , true )
	Local player="here"
	Local Monster="live"
	Hide(OwnerID())
	local fake = LuaFunc_CreateObjByObj(103555, OwnerID() )
		
	Setplot(fake ,"dead","LuaS_423259_Dead",100)
	SetAttack(fake, TargetID())
	Sleep(20)
	While 1 do

		if 	CheckID(fake) == false	or
			ReadRoleValue(fake, EM_RoleValue_IsDead)==1 then
			Monster="Dead"
			break
		end
		
		if	GetDistance( TargetID(), OwnerID()) >200   or
			ReadRoleValue(TargetID() , EM_RoleValue_IsDead)==1 	or
			CheckID(TargetID()) == false	or
			ReadRoleValue(TargetID(),EM_RoleValue_IsAttackMode)==0 then
			player="Nothere"
			break	
		end
		
		if 	CheckAcceptQuest(TargetID(),423259)==false 
			 then
			break
		end
		Sleep(10)
	end
	

	if player=="Nothere" then
		Sleep(50)
		SetStopAttack(fake)
		Delobj(fake)
		Show(OwnerID(),0)
		ScriptMessage(TargetID(), TargetID() , 1 , "[SAY_420635_1]" , 0 )	--任務失敗，請重接一次	
		ScriptMessage(TargetID(), TargetID() , 0 , "[SAY_420635_1]" , 0 )	--任務失敗，請重接一次
		SetFlag(TargetID(),543929,0)
		SetFlag(TargetID(),543985,0)
		SetFlag(TargetID(),543986,0)
		SetFlag(TargetID(),543987,0)
	end
	
	if 	CheckAcceptQuest(TargetID(),423259)==true 	and
	
		Monster=="Dead" 							then
			if 	ReadRoleValue(OwnerID(),EM_RoleValue_PID)==591	then
				SetFlag(TargetID() , 543985 , 1)
			end
			
			if 	ReadRoleValue(OwnerID(),EM_RoleValue_PID)==592	then
				SetFlag(TargetID() , 543986 , 1)
			end

			if 	ReadRoleValue(OwnerID(),EM_RoleValue_PID)==593	then
				SetFlag(TargetID() , 543987 , 1)
			end	
	end
	SetStopAttack(fake)
	Delobj(fake)
	DisableQuest( OwnerID() , false )
	Sleep(50)
	Show(OwnerID(),0)
	
end


function LuaS_423259_8()
	LoadQuestOption(OwnerID()) 
	--該死的，你不選我的話，回到達拉尼斯你就完蛋了！
	if 	CheckAcceptQuest(OwnerID(),423259)==true 	and
		CheckFlag(OwnerID(), 543986 )==false		and
		ReadRoleValue(OwnerID(),EM_RoleValue_IsAttackMode)==0	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423259_6]","LuaS_423259_9",0)
		--「陛下，你是陛下吧。」
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423259_7]","LuaS_423259_6",0)
		--「你不是陛下。」
	end
end

function LuaS_423259_9()
	CloseSpeak(OwnerID())
	Yell(TargetID(),"[SC_423259_10]",1)
	--就你這樣有眼無珠的人，居然還是獅心騎士團的騎士？
--	WriteRoleValue(TargetID(),EM_RoleValue_PID,592)--直接在種出的npc上設pid值
	Beginplot(TargetID(),"LuaS_423259_7",0)
end

function LuaS_423259_10()
	LoadQuestOption(OwnerID()) 
	--不要被那二個假貨騙了，我才是卡拉維！
	if 	CheckAcceptQuest(OwnerID(),423259)==true 	and
		CheckFlag(OwnerID(), 543987 )==false		and
		ReadRoleValue(OwnerID(),EM_RoleValue_IsAttackMode)==0	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423259_6]","LuaS_423259_11",0)
		--「陛下，你是陛下吧。」
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423259_7]","LuaS_423259_6",0)
		--「你不是陛下。」
	end
end

function LuaS_423259_11()
	CloseSpeak(OwnerID())
	Yell(TargetID(),"[SC_423259_11]",1)
	--被假貨欺騙的感覺如何啊？呵呵......
--	WriteRoleValue(TargetID(),EM_RoleValue_PID,593)--直接在種出的npc上設pid值
	Beginplot(TargetID(),"LuaS_423259_7",0)
end

function LuaS_423259_Dead()
	
	
	Delobj(OwnerID())
end

--======================================================================================================
--423259		任務完成後的特效
--======================================================================================================

function LuaS_423259_ACT0()
	AddBuff( TargetID()  , 504004 , 1 , 300 )
	local ball = Lua_DW_CreateObj("flag" ,115280,780634,1)		--種一個透明物件，命名為安特克羅

	DisableQuest(ball, true )
	CastSpell(ball,ball,494399)				--放特效
	Sleep(30)
	Tell(TargetID() ,ball,"[SC_423259_ACT0]")			--別被你眼中所見迷惑，這些只是幻象。
	SetFlag(TargetID() , 543988 , 1)		--給旗標，藏將軍，現出發任務的安特克羅
	CastSpell(ball,ball,494399)				--放特效
	Sleep(30)
	CancelBuff( TargetID()  , 504004  )
	Delobj(ball)
end
	
	

	
	
	