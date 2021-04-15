
--======================================================================================================
--423331
--======================================================================================================
function LuaS_423331_0()
	LoadQuestOption(OwnerID())
		if 	(CheckAcceptQuest(OwnerID(),423331)== true ) 	and
			Checkflag(OwnerID(),544239)== false		then
			if	CountBodyItem( OwnerID(), 207467)>0	then
				AddSpeakOption(OwnerID(),TargetID(),"[SC_423331_1]","LuaS_423331_1",0)
				--你好，請收下這束花。
			else
				ScriptMessage( OwnerID() , OwnerID() , 2 , "[207467]:[SC_110497_5]", 0 )
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[207467]:[SC_110497_5]", 0 )

			end
		end
end

function LuaS_423331_1()
	SetSpeakDetail(OwnerID(),"[SC_423331_2]")
	--這個能賣錢嗎？我看看.....不值幾個錢嘛。
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423331_3]","LuaS_423331_2",0)
	--請容我向你表示，一種不知從何而來的傾慕之意......
end

function LuaS_423331_2()
	SetSpeakDetail(OwnerID(),"[SC_423331_4]")
	--呿！又是一個來示愛的，肯定是那兩個無聊的人類找來的笨蛋，這次他們又在爭什麼了？一塊炭烤豬蹄，還是一片樹莓蛋糕，煩不煩啊？
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423331_5]","LuaS_423331_3",0)
	--呃......
end

function LuaS_423331_3()
	SetSpeakDetail(OwnerID(),"[SC_423331_6]")
	--你走吧，我會再和那兩個傢伙算算我被他們這種破爛玩笑耽擱的時間而損失的金錢，開玩笑，我可是一眨眼就好幾千金幣從手裡進出的大商人吶！
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423331_7]","LuaS_423331_4",0)
	--抱歉，打擾了。
	end
	
function LuaS_423331_4()
	
	if (CheckAcceptQuest(OwnerID(),423331)== true ) 	then
		Setflag(OwnerID(),544239,1)
		DelBodyItem( OwnerID(),207467,1)
	end
	CloseSpeak(OwnerID())
end

------------□□□□□□□□□□□□□□□□□□□□□□--------------

function LuaS_115926_423331_1()		--掛在舒博的對話之下
	LoadQuestOption(OwnerID())

end


--======================================================================================================
--423333
--======================================================================================================

function LuaI_423333_accept()	--掛在接下任務423333之後，有些曾接過任務又搞怪放棄，但身上仍有計時者，可重新計時
	local QuestID = 423333
	local Q_flag = 544238
	local Q_buff = 506931
	if 	CheckAcceptQuest(TargetID(),QuestID)==true 	and
		Checkflag(TargetID(),Q_flag)== false		then
		if (CheckBuff(TargetID(), Q_buff) == true)	then
			Say(OwnerID(),"[SC_423333_0]")
			--想要重新開始挑戰嗎？好！
			Cancelbuff(TargetID(),Q_buff)
			Sleep(30)
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_423333_8]" , C_SYSTEM )	
			--SC_423333_8
			AddBuff( TargetID()  , Q_buff , 1 , 600 ) 
		else
			AddBuff( TargetID()  , Q_buff , 1 , 600) 
		end
	end
end

	
function LuaI_423333_check()	--掛在npc雅各韓115925的對話劇情之下
	LoadQuestOption(OwnerID())
	local QuestID = 423333
	local Q_flag = 544238
	local Q_buff = 506931
		if 	(CheckAcceptQuest(OwnerID(),QuestID)== true ) 	and 
			(CheckFlag(OwnerID(), Q_flag )==false)			then 
			if	(Countbodyitem(OwnerID(),207475)>0	)		and
				(Countbodyitem(OwnerID(),207476)>0	)		then
				if	(CheckBuff( OwnerID(), Q_buff) == true)				then
					AddSpeakOption(OwnerID(),TargetID(),"[SC_423333_1]","LuaI_423333_speak_1",0)
					--我把目標物都帶回來了。
				else
					AddSpeakOption(OwnerID(),TargetID(),"[SC_423333_1]","LuaI_423333_speak_2",0)
				end
			else
				AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_95]","LuaI_423333_speak_5",0)
			end
		end
end

function LuaI_423333_speak_1()
	SetSpeakDetail(OwnerID(),"[SC_423333_2]")
	--你辦到了嘛！哈哈
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423028_4]","LuaI_423333_speak_3",0)
end

function LuaI_423333_speak_3()
	Setflag(OwnerID(),544238,1)
	CloseSpeak( OwnerID() )
end

function LuaI_423333_speak_2()
	SetSpeakDetail(OwnerID(),"[SC_423333_3]")
	--三匙燈油都燒完了，可惜啊，我的朋友，你要再試一次嗎？
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423333_4]","LuaI_423333_speak_4",0)
	--好，請讓我再試一次。
end

function LuaI_423333_speak_4()
	if (CheckBuff( OwnerID(), 506931) == false)	then
		DelBodyItem( OwnerID(), 207475, 1 )
		DelBodyItem( OwnerID(), 207476, 1 )
		AddBuff( OwnerID()  , 506931 , 1 , 600 ) 
		GiveBodyItem( OwnerID() , 208067 , 1 )
		Say(TargetID(),"[SC_111368_5]")
		--開始吧！
		ScriptMessage( OwnerID() , TargetID() , 1 , "[SC_423333_8]" , C_SYSTEM )	
	else	
		Say(TargetID(),"[SC_423333_4]")
		--燈油還未燃盡，你還有時間，衝啊！朋友！
	end
	CloseSpeak( OwnerID() )
end

function LuaI_423333_speak_5()
	if 	(CheckBuff( OwnerID(), 506931) == true)	then
		SetSpeakDetail(OwnerID(),"[SC_423333_6]")
		--朋友，你沒有把兩種波利姆都帶回來。
	else
		SetSpeakDetail(OwnerID(),"[SC_423333_3]")
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423333_4]","LuaI_423333_speak_4",0)
	end
end
	
function LuaI_423333_Complete()
	CancelBuff( TargetID()  , 506931  )	
	if (CountBodyItem(TargetID(),208067))>0 then
		DelBodyItem(TargetID(),208067,1)
	end
end

function LuaI_423333_506932() --
	
	if CheckCompleteQuest(OwnerID(),423333)==false then
		
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_423333_7]" , C_SYSTEM )	
	
	end
end

------------□□□□□□□□□□□□□□□□□□□□□□--------------
function LuaI_s7_208067()	--放棄哨子

	Beginplot(TargetID(),"LuaI_s7_208067_1",0)
end

function LuaI_s7_208067_1()
	if	(CheckBuff( TargetID(), 506931)) == true	then
		CancelBuff( TargetID()  , 506931  )
	end

end

--======================================================================================================
--------------------------------------------------------笑笑笑
--======================================================================================================

function LuaS_ModTalkToOtherxd()
	local Self_Dir = ReadRoleValue(OwnerID(),EM_RoleValue_Dir)
	sleep( 30 )
	Local Speak={}
	Local Motion
	Speak[1] = ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD
	Speak[2] = ruFUSION_ACTORSTATE_EMOTE_APPLAUSE
	Speak[3] = ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE


	for i = 4 , 10 , 1 do
		Speak[i] = ruFUSION_ACTORSTATE_EMOTE_SPEAK
	end

	for i = 11 , 14 , 1 do
		Speak[i] = ruFUSION_ACTORSTATE_EMOTE_LAUGH
	end
	while true do
		Local j = rand(14) + 1
		Motion = Speak[j]
		
		sleep(rand(20) +30)
		if Self_Dir  == ReadRoleValue(OwnerID(),EM_RoleValue_Dir) then
			if ReadRoleValue(OwnerID(),EM_RoleValue_IsAttackMode) ~= 1 then
				PlayMotion( OwnerID(),Speak[j] )
			end
		else
			if ReadRoleValue(OwnerID(),EM_RoleValue_IsAttackMode)  ~= 1 then
				SetDir( OwnerID(), Self_Dir)
				PlayMotion( OwnerID(),Speak[j])
			end
		end
	end
end


-----------------------------------------------------------工作Cat
Function LuaP_Gather_cat()
	SetDefIdleMotion( OwnerID() ,ruFUSION_MIME_GATHER_LOOP)		
end
