--422981拼湊真相

function LuaS_422981_0()			--找好約翰的對話劇情，插入
	LoadQuestOption( OwnerID() )
	if	(CheckAcceptQuest(OwnerID(),422981)==true )	and	( CheckCompleteQuest( OwnerID(),422981)==false)	and	
		CheckFlag( OwnerID() , 543706 ) ==false	and	CheckFlag( OwnerID() , 543708 ) ==false		and
		CheckFlag( OwnerID() , 543709 ) ==false	and	(CountBodyItem( TargetID(),206819) <1)		then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_86]","LuaS_422981_107",0)		--我們要開始了嗎
	end
	
	if	CheckFlag( OwnerID() , 543701 ) ==false and	(CheckAcceptQuest(OwnerID(),422981)==true )	and	(CountBodyItem( OwnerID(),206820) >0)		then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_85]","LuaS_114512_100",0)		--約翰隊長，有一張午夜親筆紙籤要交給你。
	end


	if	CheckAcceptQuest(OwnerID(),422981)==true 	and	CountBodyItem( OwnerID(), 206816)<1	and	
		CheckFlag( OwnerID() , 543708 ) ==false	and	CountBodyItem( OwnerID(), 206820)<1	and
		CheckFlag( OwnerID() , 543701 ) ==false	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_83]","LuaS_114512_109",0)		--我弄丟[114542]搶到的那枚[206816]了...
	end


	if	(CheckAcceptQuest(OwnerID(),422981)==true )and( CheckCompleteQuest( OwnerID(),422981)==false) 	then

		if	CheckFlag( OwnerID() , 543706 ) ==true	and	CheckFlag( OwnerID() , 543707) ==false	and	
			CheckFlag( OwnerID() , 543708) ==false	and	(CountBodyItem( OwnerID(),206819) <1)	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_87]","LuaS_422981_108",0)	--我查到線索，殺傷尼古拉的是盜賊。
		end

		if	CheckFlag( OwnerID() , 543706 ) ==false	and	CheckFlag( OwnerID() , 543707) ==false	and
			CheckFlag( OwnerID() , 543708 ) ==true	and	(CountBodyItem( OwnerID(),206819) <1)	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_88]","LuaS_422981_109",0)	--我查到線索，鈕釦是馬龍盜賊團所有。
		end

		if	CheckFlag( OwnerID() , 543706 ) ==true	and	CheckFlag( OwnerID() , 543707) ==false	and	
			CheckFlag( OwnerID() , 543708 ) ==false	and	(CountBodyItem( OwnerID(),206819) >0)	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_89]","LuaS_422981_110",0)	--我查到線索，兇手是盜賊，還有這張奇怪的圖...
		end

		if	CheckFlag( OwnerID() , 543706 ) ==true	and	CheckFlag( OwnerID() , 543707) ==false	and	
			CheckFlag( OwnerID() , 543708 ) ==true	and	(CountBodyItem( OwnerID(),206819) <1)	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_90]","LuaS_422981_111",0)	--現在已經知道兇手是馬龍盜賊團，還可以往哪個方向調查？
		end	

		if	CheckFlag( OwnerID() , 543706 ) ==true	and	CheckFlag( OwnerID() , 543707) ==false	and	
			CheckFlag( OwnerID() , 543708 ) ==true	and	(CountBodyItem( OwnerID(),206819) >0)	then
			SetFlag( OwnerID() , 543707 , 1 )						--得到2旗標
			SetFlag( OwnerID() , 543700 , 1 )						--得到查出真相
		end		
	end

end

function LuaS_422981_108()
	SetSpeakDetail(OwnerID(),"[SC_422981_73]")					--盜賊？外城區遊蕩的盜賊什麼時候開始產生「閒情逸致」找這些遊民的麻煩…
										--查出集合地點、確認盜賊真實身份，這兩點也很重要。
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_79]","LuaS_114512_102",0)	--好，我再去找找。
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_80]","LuaS_114512_103",0)	--玩家回答：我不曉得哪裡還可能有線索…
end

function LuaS_422981_109()
	SetSpeakDetail(OwnerID(),"[SC_422981_74]")					--很好，既然已經知道鈕釦擁有者的身份...馬龍盜賊團的勢力竟能如此囂張地伸進王城中，也該適時提醒他們這裡的老大是誰了～
										--你再找找看有沒有其他線索能查探出他們在城內的據點～
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_81]","LuaS_114512_102",0)	--我馬上去。
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_82]","LuaS_114512_104",0)	--玩家回答：城內的據點…我應該從何處著手？
end

function LuaS_422981_110()
	SetSpeakDetail(OwnerID(),"[SC_422981_75]")					--我看看…紙上描繪的「優美」線條…是達拉尼斯城沒錯，至於這塊塗得相當「藝術」的劃記區域，也許就是他們說的集合地點。
										--我再研究一會兒，你先去釐清鈕釦擁有者的身份吧～
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_81]","LuaS_114512_102",0)	--我馬上去。
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_92]","LuaS_114512_108",0)	--我不曉得要怎麼查出[206816]的擁有者身份。
end

function LuaS_422981_111()
	SetSpeakDetail(OwnerID(),"[SC_422981_76]")					--唔…殘存的目擊者見過馬龍盜賊團犯罪情形…
										--他提過地上有個被遺留的袋子，你檢查過袋子裡面的物品了？也許有關他們集合地點的線索就隱藏在其中。	
end

function LuaS_422981_2()
	SetSpeakDetail(OwnerID(),"[SC_422981_3]")					--哦？這次的見習騎士裡竟然也有像凱那樣「認真」的人啊…
										--好吧，威利．路易斯會跟你一起行動，到時候再次到這裡會合。
end

function LuaS_422981_3()
	SetSpeakDetail(OwnerID(),"[SC_422981_4]")					--你真的想要我告訴你怎麼做？					
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_5]","LuaS_422981_4",0)		--呃…是的，麻煩你。
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_6]","LuaS_422981_0",0)		--返回
end

function LuaS_422981_4()
	SetSpeakDetail(OwnerID(),"[SC_422981_7]")					--那先回去尼古拉．霍爾倒下的現場看看有沒有什麼讓人意外的線索囉～
end

----------------------------------

function LuaS_114589_99()	--遊民的初始劇情
	LuaP_Crouch()
	--LuaP_Crafting()
	--LuaP_Sitting()
end


function LuaS_114589_0()		--旗子	780453 1-5
	--LoadQuestOption( OwnerID() )	--OwnerID是玩家、TargetID是遊民
	if (CheckAcceptQuest(OwnerID(),422981)==true )and( CheckCompleteQuest( OwnerID(),422981)==false) and	CheckFlag( OwnerID() , 543706 ) ==false	then
		SetSpeakDetail(OwnerID(),"[SC_422981_8]")				--(眼前的遊民專心翻動地上的袋子，渾然未覺你的靠近……)
		if (ReadRoleValue( TargetID() , EM_RoleValue_Register+5 )  == 0)	 then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_9]","LuaS_114589_9",0) --請問…
		else
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_9]","LuaS_114589_1",0) --請問…
		end	
	end
end

function LuaS_114589_1()
	SetSpeakDetail(OwnerID(),"[SC_422981_10]")					--(眼前的遊民還在翻動袋子，或許待會再打擾他比較好...)
end

function LuaS_114589_9()
	BeginPlot(TargetID(), "LuaS_114589_2" , 0 )
end

function LuaS_114589_2()--在遊民身上跑
	CloseSpeak( TargetID())							--OwnerID遊民，TargetID玩家
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+5 , 2 )	
	AddBuff( TargetID()  , 506215, 1 , -1 )						--給玩家BUFF （可見演戲的、看不見原本的）
	local DADA = Lua_DW_CreateObj("flag" ,114391,780453,1,1)			--產生遊民
	DisableQuest( DADA , true )							--開關NPC頭上的任務提示以及對話劇情(true關閉)
	MoveToFlagEnabled(DADA , false )
	WriteRoleValue( DADA ,EM_RoleValue_IsWalk , 1 )
	BeginPlot(DADA , "LuaS_114589_8" , 0 )
	sleep(10)
	Yell( DADA , "[SC_422981_11]" , 3 )						--啊～～～～～
	sleep(10)
	AdjustFaceDir( DADA ,TargetID(), 0 )
	Yell( DADA , "[SC_422981_12]" , 3 )						--你你你、騎士！
	sleep(20)
	PlayMotion( DADA,ruFUSION_ACTORSTATE_EMOTE_SURRENDER)		--恐懼地向你跪下祈求<動作>
	Yell( DADA , "[SC_422981_13]" , 3 )						--不！不是、不是我、不是我，別抓我！
	sleep(20)
	Yell( DADA , "[SC_422981_14]" , 3 )						--別抓我…別抓我…
	PlayMotion( DADA,ruFUSION_ACTORSTATE_EMOTE_SURRENDER)			--恐懼地向你跪下祈求<動作>
	local WLI = Lua_DW_CreateObj("flag" ,114598,780453,3,1)			--產生威利
	WriteRoleValue ( WLI  , EM_RoleValue_PID, DADA )
	MoveToFlagEnabled(WLI , false )
	WriteRoleValue( WLI ,EM_RoleValue_IsWalk , 1 )
	
	AdjustFaceDir( WLI ,DADA , 0 )
	Yell( WLI , "[SC_422981_15]" , 3 )						--他在怕什麼？
	PlayMotion( WLI , ruFUSION_ACTORSTATE_EMOTE_POINT)			--<指著遊民>
	sleep(20)

	Yell( DADA , "[SC_422981_14]" , 3 )						--別抓我…別抓我…
	PlayMotion( DADA,ruFUSION_ACTORSTATE_EMOTE_SURRENDER)			--恐懼地向你跪下祈求<動作>
	sleep(20)

	AdjustFaceDir( WLI ,TargetID(), 0 )
	Yell( WLI , "[SC_422981_16]" , 3 )						--是他砍了尼古拉．霍爾？
	sleep(20)
	PlayMotion( DADA ,ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)
	Yell( DADA , "[SC_422981_17]" , 3 )						--不！不、不、不，真的不是我，是他們！
	sleep(20)	
	
	PlayMotion( DADA ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( DADA , "[SC_422981_18]" , 3 )						--…是那兩個有刀疤的人…
	sleep(20)
	
	AdjustFaceDir( WLI ,DADA , 0 )
	Yell( WLI , "[SC_422981_19]" , 3 )						--什麼有刀疤的人？
	sleep(10)
	AdjustFaceDir( WLI ,DADA , 0 )
	sleep(10)
	PlayMotion( WLI , ruFUSION_ACTORSTATE_EMOTE_POINT)
	Yell( WLI , "[SC_422981_20]" , 3 )						--說話說清楚一點！你想要我砍你嗎？
	LuaFunc_MoveToFlag( WLI,780453,4,0)					--威利走向前一步

	PlayMotion( DADA,ruFUSION_ACTORSTATE_EMOTE_SURRENDER)	
	Yell( DADA , "[SC_422981_21]" , 3 )						--我說！我說！別殺我！
	sleep(20)
	
	AdjustFaceDir( WLI ,TargetID(), 0 )
	PlayMotion( WLI ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( WLI , "[SC_422981_22]" , 3 )						--真麻煩！你想問他什麼就問吧～
	sleep(20)

	Yell( WLI , "[SC_422981_23]" , 3 )						--我只習慣用刀子問話～
	sleep(10)
	BeginPlot( DADA, "LuaS_114589_3" , 0 )					--玩家可點擊遊民
	local Time = 0
		for i = 1, 40 , 1 do							--時間到就刪除其餘NPC，回復原狀
		Time = Time + 1

			if	Time>30		then
				WriteRoleValue( OwnerID() , EM_RoleValue_Register+5 , 0 )
				DelObj (DADA)
				DelObj (WLI)
				if	CheckBuff( TargetID() , 506215) == true then
					CancelBuff( TargetID() , 506215)  
				end
				break
					
			end
			if	  CheckID( TargetID() ) == false	then
				WriteRoleValue( OwnerID() , EM_RoleValue_Register+5 , 0 )
				DelObj (DADA)
				DelObj (WLI)
				if	CheckBuff( TargetID() , 506215) == true then
					CancelBuff( TargetID() , 506215)  
				end
				break
			end
			if	CheckFlag( TargetID() , 543706 ) == true 	then
				WriteRoleValue( WLI , EM_RoleValue_Register+7 , TargetID() )
				BeginPlot( WLI, "LuaS_114589_7" , 0 )		
				break		
			end
		sleep(10)
		end
end


function LuaS_114589_3()		--DADA遊民對話劇情
										--TargetID玩家、OwnerID遊民
	DisableQuest( OwnerID() , false )						--開關NPC頭上的任務提示以及對話劇情(true關閉)
	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),422981)==true )and( CheckCompleteQuest( OwnerID(),422981)==false) 	then
	--	if	CheckBuff( TargetID() , 506215) == true	then			
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_24]","LuaS_114589_4",0)	--你剛剛說「有刀疤的人」？
	--	end
	end
end

function LuaS_114589_4()
	SetSpeakDetail(OwnerID(),"[SC_422981_25]")					--對、對、對！砍死你同伴…那個騎士的人是…兩個兇狠的…有刀疤的盜賊，我見過他們…
										--…他們、他們上次抓走我的朋友，後來…後來我朋友出現在午夜店裡…他死了！就像人們說的一樣…好幾個人死了，一定是那群盜賊…一定是他們！
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_26]","LuaS_114589_5",0)	--你說你見過？他們沒發現你嗎？
end

function LuaS_114589_5()
	SetSpeakDetail(OwnerID(),"[SC_422981_27]")					--沒、沒，我躲起來了，那個騎士本來要問我屍體的事，我逃了、逃了…對不起，我不該自己
										--騎士倒下...不動了…可是、可是…那麼兇狠的盜賊竟然會怕引來太多人注意，還說什麼死掉的就沒用了…趕快去集合…
										--後來他們很快走掉…還掉了一個袋子，我、我只是要拿錢而已…其他什麼都沒拿，真的！我只有拿錢！人也不是我殺的！
										--地上的袋子也給你！
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_28]","LuaS_114589_6",0)	--地上的袋子？
end

function LuaS_114589_6()
	SetSpeakDetail(OwnerID(),"[SC_422981_29]")					--對！就在牆邊，他們遺漏的袋子！
	SetFlag( OwnerID() , 543706 , 1 )						--得到殺人的是盜賊旗標
end	

function LuaS_114589_7()
	local play	=ReadRoleValue( OwnerID() , EM_RoleValue_Register+7 )	
	local DADA11 =ReadRoleValue( OwnerID() , EM_RoleValue_PID )	
	DisableQuest( DADA11 , true )						--關閉對話
	AdjustFaceDir( OwnerID(),play, 0 )
	Yell( OwnerID() , "[SC_422981_30]" , 3 )					--問完了？		--OwnerID是威利
	sleep(20)
	AdjustFaceDir( OwnerID(),DADA11 , 0 )
	PlayMotion(  OwnerID() ,ruFUSION_ACTORSTATE_ATTACK_2H)			--威利出其不意拔劍砍向遊民
	sleep(20)
	PlayMotion( DADA11 ,ruFUSION_ACTORSTATE_EMOTE_ROFL)			--遊民emote_rofl打滾動作，表現出不會武功
	sleep(20)
	Yell( DADA11 , "[SC_422981_31]" , 3 )					--嚇...嚇死我了！騎士大人？
	sleep(20)	
	Yell(  OwnerID() , "[SC_422981_32]" , 3 )					--果然只是一般的遊民。									
	sleep(20)
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_KISS)
	Yell(  OwnerID() , "[SC_422981_33]" , 3 )					--是不是假裝不會武，搶過這麼多村子的我一試便知！
	sleep(20)
	Yell(  OwnerID() , "[SC_422981_34]" , 3 )					--沒事了～你可以走了。
	sleep(20)
	PlayMotion( DADA11 ,ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	Yell( DADA11 , "[SC_422981_35]" , 3 )					--是、是！
	LuaFunc_MoveToFlag( OwnerID(),780453,5,0)
	LuaFunc_MoveToFlag( DADA11 ,780453,4,0)			
	WriteRoleValue(TargetID(),EM_RoleValue_Register+5 , 0 )
	if	CheckBuff( play , 506215) == true then
		CancelBuff( play , 506215)  
	end
	DelObj (OwnerID())
	DelObj (DADA11 )
end

function LuaS_114589_8()
	LuaFunc_MoveToFlag( OwnerID(),780453,2,0)					--跑到一旁
end

function LuaS_206819_0()--使用物品	
	if	CheckAcceptQuest( OwnerID() , 422981 ) == true then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422981_36]" , 0 ) 		--圖紙上出現詭異的劃記，背景疑似達拉尼斯城的地形，也許可以拿給約翰．霍夫曼看看。
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422981_36]" , 0 ) 
		return true
	end
end

----未得到3旗標，判斷：

function LuaS_114592_0()--點擊午夜
	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),422981)==true )and( CheckCompleteQuest( OwnerID(),422981)==false) 	then
		if	CheckFlag( OwnerID() , 543701 ) ==false and	(CountBodyItem( OwnerID(),206820) <1)	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_38]","LuaS_114592_1",0)	--尼古拉．霍爾身受重傷與你有關？
		end
		if	CheckFlag( OwnerID() , 543708 ) ==false and	(CountBodyItem( OwnerID(),206816) >0)	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_42]","LuaS_114592_3",0)	--你知道這顆鈕釦是誰的嗎？
		end
		if	CheckFlag( OwnerID() , 543701 ) == true and	(CheckAcceptQuest(OwnerID(),422981)==true )	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_94]","LuaS_114592_6",0)	--我把紙籤交給約翰隊長了。
		end

		if	CheckFlag( OwnerID() , 543701 ) ==false and	(CheckAcceptQuest(OwnerID(),422981)==true )	and	(CountBodyItem( OwnerID(),206820) >0)		then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_95]","LuaS_114592_7",0)	--我回來了。
		end
	end
end

function LuaS_114592_1()
	SetSpeakDetail(OwnerID(),"[SC_422981_39]")					--嘻嘻…好直接～好直接～如果可以收藏這個說話這麼直接的藝術品，多好啊～
										--可惜你猜錯囉～
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_40]","LuaS_114592_2",0)	--尼古拉．霍爾被襲擊時，你在哪裡？
end


function LuaS_114592_2()
	SetSpeakDetail(OwnerID(),"[SC_422981_41]")					--當然是跟親愛的霍夫曼大人在一起囉～直到尖叫聲響起前，他可是每一刻都捨不得離開我
end

function LuaS_114592_3()
	SetSpeakDetail(OwnerID(),"[SC_422981_43]")					--呵～鈕釦啊～你真的希望小的回答嗎？
										--如果你同意死後留在小的這裡，小的可以告訴你答案，如何呢？
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_44]","LuaS_114592_4",0)	--…好。
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_45]","LuaS_114592_5",0)	--(還是再想一下有沒有別的方法得知好了…)
end


function LuaS_114592_4()
	SetSpeakDetail(OwnerID(),"[SC_422981_46]")					--「答案」你很快就能得到了。
										--那麼…先把這張紙交給親愛的霍夫曼大人吧～
	DelBodyItem( OwnerID(), 206816, 1 )
	if	(CountBodyItem( OwnerID(),206820) <1)	then 	
		GiveBodyItem ( OwnerID(),206820 , 1 )
	end
end


function LuaS_114592_5()
	CloseSpeak(OwnerID())
end

function LuaS_114592_6()
	SetSpeakDetail(OwnerID(),"[SC_422981_47]")			--你回來啦～答案是來自「夜梟」的解讀～
								--「鈕釦屬於最近出沒在達拉尼斯城的盜賊團體所有，與亞班諾的馬龍盜賊團勢力相符。」
								--就是這樣囉～小的很期待你再次光臨的時刻呵～
	if	(CountBodyItem( OwnerID(),206816) <1)	then 	
		GiveBodyItem ( OwnerID(),206816 , 1 )
	end
	SetFlag( OwnerID() , 543708 , 1 )				--得到鈕釦是馬龍的旗標
end

function LuaS_114592_7()
	SetSpeakDetail(OwnerID(),"[SC_422981_48]")			--嘻嘻…真是心急哪～你還沒把紙交給他唷～
end

--function LuaS_111111_0()--點擊阿道夫-----併入蘇哥的LUA
--	if	( CheckCompleteQuest( OwnerID(),422981)==true) and	(CheckAcceptQuest(OwnerID(),422981)==true )	and( CheckCompleteQuest( OwnerID(),422981)==false)	and
--		(CountBodyItem( OwnerID(),206816) >0)		then
--		SetSpeakDetail(OwnerID(),"[SC_422981_49]")			--哦？又見面了。這顆鈕釦…你要我幫忙鑑識來源？
--									--嗯…你這傢伙真不討喜，來者哪個不是捧著沈甸甸錢袋央求，看在你散發出非尋常人的血腥味份上，這次我免費幫你吧～
--		AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_50]","LuaS_114546_100",0)	--謝謝。
--	end
--end

function LuaS_114546_100()
	SetSpeakDetail(OwnerID(),"[SC_422981_49]")			--哦？又見面了。這顆鈕釦…你要我幫忙鑑識來源？
								--嗯…你這傢伙真不討喜，來者哪個不是捧著沈甸甸錢袋央求，看在你散發出非尋常人的血腥味份上，這次我免費幫你吧～
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_50]","LuaS_114546_102",0)	--謝謝。

end

function LuaS_114546_102()	
	SetSpeakDetail(OwnerID(),"[SC_422981_51]")					--鈕釦混雜多種噁心血味…這是盜賊…而且是…
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_52]","LuaS_114546_101",0)	--而且是…？
end

function LuaS_114546_101()	
	SetSpeakDetail(OwnerID(),"[SC_422981_53]")				--而且是曾在亞班諾待上一陣子的…馬龍盜賊團。
									--好了，廢話完畢，你也該走了。
	SetFlag( OwnerID() , 543708 , 1 )					--得到鈕釦是馬龍的旗標
end

------------------------------------------
--午夜要玩家拿紙給約翰，判斷未給「給紙旗標」，約翰：

function LuaS_114512_100()
	SetSpeakDetail(OwnerID(),"[SC_422981_54]")					--葬儀社老闆「特地」要你拿這張紙來給我？
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_55]","LuaS_114512_106",0)	--嗯…是的。
end

function LuaS_114512_106()
	DelBodyItem( OwnerID(), 206820, 1 )
	SetSpeakDetail(OwnerID(),"[SC_422981_56]")					--(迅速開啟紙條的約翰難得顯露出幾乎稱得上是「扭曲」的神情…)
	SetFlag( OwnerID() , 543701 , 1 )						--得到給紙旗標
end
----------------------------------------------

function LuaS_114596_0()	--點擊藥水商人
		LoadQuestOption( OwnerID() )
	if	(CheckAcceptQuest(OwnerID(),422981)==true )and( CheckCompleteQuest( OwnerID(),422981)==false) 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_57]","LuaS_114596_1",0)	--一連串遊民死亡事件，驗出死前喝了你這裡販售的藥水，這一點你怎麼說？
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_60]","LuaS_114596_2",0)	--你在這裡販售藥水很久了？
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_64]","LuaS_114596_6",0)	--老闆，你這裡除了療傷藥水，有沒有奇特的新鮮貨？例如…
	end
end

function LuaS_114596_1()
	SetSpeakDetail(OwnerID(),"[SC_422981_58]")				--死前喝了我這裡的藥水？
									--就算是這樣，也不能硬說是我的藥水害死他們啊！
									--我在這裡販賣好幾年了，真的不是我！
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_59]","LuaS_114596_5",0)	--你以為...
end

function LuaS_114596_2()
	SetSpeakDetail(OwnerID(),"[SC_422981_61]")			--是的，這是我賴以維生的工作。
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_62]","LuaS_114596_3",0)	--那你知道…陸續死亡的遊民屍體上有檢測出藥水反應嗎？
end

function LuaS_114596_3()
	SetSpeakDetail(OwnerID(),"[SC_422981_63]")					--什麼？藥水？…難道您懷疑是我嗎？
										--不可能！那些事情真的不是我做的！
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_59]","LuaS_114596_5",0)	--你以為...
end


function LuaS_114596_6()
	SetSpeakDetail(OwnerID(),"[SC_422981_65]")					--例如…？
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_66]","LuaS_114596_2",0)	--例如…喝了會致死的毒藥。
end

function LuaS_114596_4()
	SetSpeakDetail(OwnerID(),"[SC_422981_67]")				--怎麼可能！我才沒有賣那種藥水！
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_59]","LuaS_114596_5",0)	--你以為...
end

function LuaS_114596_5()		
	closespeak(OwnerID())			--TargetID是藥水商人、OwnerID是玩家
	if (CheckAcceptQuest(OwnerID(),422981)==true )and( CheckCompleteQuest( OwnerID(),422981)==false) 	then
		if (ReadRoleValue( TargetID() , EM_RoleValue_Register )  == 0)	 then
			DisableQuest( TargetID(), true )
			BeginPlot(TargetID()  , "LuaS_114596_7" , 0 )
		else
			return
		end	
	end

end

function LuaS_114596_7()	
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 2 )				--OwnerID是原本的藥水商人、TargetID是玩家
	local WLI = Lua_DW_CreateObj("flag" ,114598,780453,7,1)			--產生威利
	MoveToFlagEnabled(WLI , false )
	WriteRoleValue( WLI ,EM_RoleValue_IsWalk , 1 )
	sleep(10)
	LuaFunc_MoveToFlag( WLI,780453,6,0)

	AdjustFaceDir( WLI,OwnerID(), 0 )
	PlayMotion( WLI, ruFUSION_ACTORSTATE_EMOTE_POINT)
	Yell( WLI , "[SC_422981_68]" , 3 )						--我覺得不是他。
	sleep(20)
	AdjustFaceDir( OwnerID(),WLI, 0 )
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( OwnerID() , "[SC_422981_69]" , 3 )					--啊！騎士大爺，您來得正好～
	sleep(20)
	PlayMotion( WLI,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( WLI , "[SC_422981_70]" , 3 )						--每種藥水我都偷偷買來喝過了，到現在什麼事都沒發生，還覺得身體更好耶～
	sleep(20)
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( OwnerID() , "[SC_422981_71]" , 3 )					--對呀！對呀！他可以作證！我的藥水不會害死人！
	sleep(20)
	Yell( WLI , "[SC_422981_72]" , 3 )						--好啦～所以我們快去別處調查吧～
	sleep(20)
	LuaFunc_MoveToFlag( WLI,780453,7,0)	
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
	DisableQuest( OwnerID(), false )
	DelObj(WLI)		
end

------------------
--總共要3條線索，引出「查出真相」旗標
--1.殺人的是盜賊543706
--2.地點543707
--3.是馬龍543708

--約翰狀況：
--function LuaS_114512_101()	--併入約翰原本的LUA<可能是小妍那裡>
--	if	(CheckAcceptQuest(OwnerID(),422981)==true )and( CheckCompleteQuest( OwnerID(),422981)==false) 	then
--		if	CheckFlag( OwnerID() , 543706 ) ==true	and	CheckFlag( OwnerID() , 543708 ) ==false	and	
--			CheckFlag( OwnerID() , 543709 ) ==false	and	(CountBodyItem( TargetID(),206819) <1)	then
		
--			SetSpeakDetail(OwnerID(),"[SC_422981_73]")				--盜賊？外城區遊蕩的盜賊什麼時候開始產生「閒情逸致」找這些遊民的麻煩…
												--查出集合地點、確認盜賊真實身份，這兩點也很重要。
--			AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_59]","LuaS_114512_102",0)	--好，我再去找找。
--			AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_59]","LuaS_114512_103",0)	--玩家回答：我不曉得哪裡還可能有線索…
--		end
--		if	CheckFlag( OwnerID() , 543706 ) ==false	and	CheckFlag( OwnerID() , 543706 ) ==false	and
--			CheckFlag( OwnerID() , 543708 ) ==true	and	(CountBodyItem( TargetID(),206819) <1)	then
--			SetSpeakDetail(OwnerID(),"[SC_422981_74]")				--很好，看情形你已經知道鈕釦擁有者的身份了。
												--馬龍盜賊團的勢力竟能如此囂張地伸進王城中，也該適時提醒他們這裡的老大是誰了～
												--你再找找看有沒有其他線索能查探出他們在城內的據點～
--			AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_59]","LuaS_114512_102",0)	--我馬上去。
--			AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_59]","LuaS_114512_104",0)	--玩家回答：城內的據點…我應該從何處著手？
--		end
--		if	CheckFlag( OwnerID() , 543706 ) ==true	and	CheckFlag( OwnerID() , 543706 ) ==false	and	
--			CheckFlag( OwnerID() , 543708 ) ==false	and	(CountBodyItem( TargetID(),206819) >0)	then
--			SetSpeakDetail(OwnerID(),"[SC_422981_75]")				--我看看…紙上描繪的「優美」線條…是達拉尼斯城沒錯，至於這塊塗得相當「藝術」的劃記區域，也許就是他們說的集合地點。
												--我再研究一會兒，你先去釐清鈕釦擁有者的身份吧～
--		end
--		if	CheckFlag( OwnerID() , 543706 ) ==true	and	CheckFlag( OwnerID() , 543706 ) ==false	and	
--			CheckFlag( OwnerID() , 543708 ) ==true	and	(CountBodyItem( TargetID(),206819) <1)	then
--			SetSpeakDetail(OwnerID(),"[SC_422981_76]")	--唔…殘存的目擊者見過馬龍盜賊團犯罪情形…
									--他提過地上有個被遺留的袋子，你檢查過袋子裡面的物品了？也許有關他們集合地點的線索就隱藏在其中。
--		end	
--		if	CheckFlag( OwnerID() , 543706 ) ==true	and	CheckFlag( OwnerID() , 543706 ) ==false	and	
--			CheckFlag( OwnerID() , 543708 ) ==true	and	(CountBodyItem( TargetID(),206819) >0)	then
--			SetFlag( OwnerID() , 543707 , 1 )					--得到2旗標
--			SetFlag( OwnerID() , 543700 , 1 )					--得到查出真相
--		end
--	end
--end			

function LuaS_114512_102()
	CloseSpeak(OwnerID())
end

function LuaS_114512_103()
	SetSpeakDetail(OwnerID(),"[SC_422981_77]")					--那位遊民提過地上有個被遺留的袋子，你檢查過袋子裡面的物品了？也許有關他們集合地點的線索就隱藏在其中。
										--此外，鈕釦的擁有者也是可以調查的方向。
end

function LuaS_114512_104()
	SetSpeakDetail(OwnerID(),"[SC_422981_78]")					--確認過尼古拉．霍爾倒下的區塊了？
										--尼古拉．霍爾身上的刀傷是經歷過一場激烈爭鬥的結果，也許會有目擊者，值得去探查看看。
end

function LuaS_422981_107()
	SetSpeakDetail(OwnerID(),"[SC_422981_0]")					--這起事件有許多還沒串起來的關鍵點，我也需要時間思考，你想「靠自己」找線索破解還是…要等我理出一點頭緒再告訴你？			
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_1]","LuaS_422981_2",0)		--我想靠自己試看看。
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_2]","LuaS_422981_3",0)		--唔…你能告訴我你現在有什麼想法嗎？
end

function LuaS_114512_108()
	SetSpeakDetail(OwnerID(),"[SC_422981_93]")					--...葬儀社老闆或許有管道可以查出，只不過...算了，去吧、去吧。
end

function LuaS_114512_109()
	SetSpeakDetail(OwnerID(),"[SC_422981_84]")					--嗯，我撿到了。我還在思索～你什麼時候會突然「聰明」的想到來找我～
	GiveBodyItem( OwnerID(), 206816, 1 )
end


