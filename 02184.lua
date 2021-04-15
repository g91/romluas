--------------------------------------------------------------------------------------------------------------------------
function LuaPJ_117386_speak()		--給英勇彼德的隨機喊話
	local Rnum=Rand(4)+1
	local Rnum2=Rand(10)
	local Speak_T={"[SC_117386_01]","[SC_117386_02]","[SC_117386_03]","[SC_117386_04]"}
		if Rnum2==0 then
			PlayMotion(OwnerID(),ruFUSION_MIME_EMOTE_VICTORY)
			say(OwnerID(),Speak_T[Rnum])
		else
		end
end
--------------------------------------------------------------------------------------------------------------------------


-----------------------------------拆除陷阱s
function LuaPJ_423939_0()		
	DW_QietKillOne(0,105287)
	return 1
end


-------------------------------------拆除陷阱，回覆1e

------------------------------------------------------------------------



Function LuaPJ_117376_0()
	LoadQuestOption(OwnerID)
	AdjustFaceDir( TargetID(),OwnerID(), 0 )
	PlayMotion( TargetID(),ruFUSION_ACTORSTATE_EMOTE_SALUTE)	
end

--------------------------------------------------------------
function luaPJ_loadquestobtion()
	LoadQuestOption(OwnerID())
end

-----------------------------------------



--==============================--
function PJ_Face_Load()
	LoadQuestOption(OwnerID())
	AdjustFaceDir(TargetID(),OwnerID(),0)
end
--==============================--
function PJ_Face_Only()
	LoadQuestOption(OwnerID())
	AdjustFaceDir(TargetID(),OwnerID(),0)
end
--==============================--

function LuaPJ_LoadQuest()
	LoadQuestOption(OwnerID())
end
--==============================--
function PJ_Face_Salute()					--行禮
	AdjustFaceDir( TargetID(),OwnerID(), 0 )
	PlayMotion( TargetID(),ruFUSION_ACTORSTATE_EMOTE_SALUTE)
	LoadQuestOption(OwnerID())	
end
--==============================--
function PJ_Face_Angry()					--生氣
	AdjustFaceDir(TargetID(),OwnerID(),0)
	PlayMotion(TargetID(),ruFUSION_ACTORSTATE_EMOTE_ANGRY)
	LoadQuestOption(OwnerID())
end
--==============================--
function PJ_Face_Laugh()					--笑
	AdjustFaceDir(TargetID(),OwnerID(),0)
	PlayMotion(TargetID(),ruFUSION_ACTORSTATE_EMOTE_LAUGH)
	LoadQuestOption(OwnerID())
end
--==============================--
function PJ_Face_H_Shake()					--拍手
	AdjustFaceDir(TargetID(),OwnerID(),0)
	PlayMotion(TargetID(),ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)
	LoadQuestOption(OwnerID())
end
--==============================--
function PJ_Face_Speak()					--說話
	AdjustFaceDir(TargetID(),OwnerID(),0)
	PlayMotion(TargetID(),ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	LoadQuestOption(OwnerID())
end
--==============================--
function PJ_Face_Dazed_L()					--暈眩L
	AdjustFaceDir(TargetID(),OwnerID(),0)
	PlayMotion(TargetID(),ruFUSION_ACTORSTATE_DAZED_LOOP)
	LoadQuestOption(OwnerID())
end
--==============================--
function PJ_Face_Think()					--思考
	AdjustFaceDir(TargetID(),OwnerID(),0)
	PlayMotion(TargetID(),ruFUSION_ACTORSTATE_EMOTE_THINK)
	LoadQuestOption(OwnerID())
end
--==============================--
function PJ_Face_Eat()					--吃
	AdjustFaceDir(TargetID(),OwnerID(),0)
	PlayMotion(TargetID(),ruFUSION_ACTORSTATE_EMOTE_EAT)
	LoadQuestOption(OwnerID())
end
--==============================--
function PJ_Face_Victory()					--歡呼
	AdjustFaceDir(TargetID(),OwnerID(),0)
	PlayMotion(TargetID(),ruFUSION_MIME_EMOTE_VICTORY)
	LoadQuestOption(OwnerID())
end
--==============================--
function PJ_Face_Threaten()					--不屑
	AdjustFaceDir(TargetID(),OwnerID(),0)
	PlayMotion(TargetID(),ruFUSION_MIME_EMOTE_THREATEN)
	LoadQuestOption(OwnerID())
end
--==============================--

function PJ_Face_Stretch()					--伸懶腰
	AdjustFaceDir(TargetID(),OwnerID(),0)
	PlayMotion(TargetID(),ruFUSION_ACTORSTATE_EMOTE_STRETCH)
	LoadQuestOption(OwnerID())
end
--==============================--
function PJ_Face_Stretch_0()					--伸懶腰
	SetScriptFlag( OwnerID(), 544819, 0)
	AdjustFaceDir(TargetID(),OwnerID(),0)
	PlayMotion(TargetID(),ruFUSION_ACTORSTATE_EMOTE_STRETCH)
	LoadQuestOption(OwnerID())
	if CheckAcceptQuest(OwnerID(),423943) then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_423775_04]","LuaPJ_423943_talk_01",0)
	end
end

function LuaPJ_423943_talk_01()
	GiveBodyItem(OwnerID(),209010,10)
	PlayMotion(TargetID(),ruFUSION_MIME_EMOTE_LAUGH)
	CloseSpeak( OwnerID() )
end
--==============================--
function PJ_Face_Kick()					--踹人
	AdjustFaceDir(TargetID(),OwnerID(),0)
	PlayMotion(TargetID(),ruFUSION_ACTORSTATE_EMOTE_KICK)
	LoadQuestOption(OwnerID())
end
--==============================--
function PJ_Face_Cry()					--哭
	AdjustFaceDir(TargetID(),OwnerID(),0)
	PlayMotion(TargetID(),ruFUSION_ACTORSTATE_EMOTE_CRY)
	LoadQuestOption(OwnerID())
end
--==============================--
function PJ_Face_Wave()					--揮手
	AdjustFaceDir(TargetID(),OwnerID(),0)
	PlayMotion(TargetID(),ruFUSION_ACTORSTATE_EMOTE_WAVE)
	LoadQuestOption(OwnerID())
end
--==============================--
function PJ_Face_H_Nod()					--點頭
	AdjustFaceDir(TargetID(),OwnerID(),0)
	PlayMotion(TargetID(),ruFUSION_MIME_EMOTE_HEAD_NOD)
	LoadQuestOption(OwnerID())
end
--==============================--
function PJ_Face_Point()					--指
	AdjustFaceDir(TargetID(),OwnerID(),0)
	PlayMotion(TargetID(),ruFUSION_ACTORSTATE_EMOTE_POINT)
	LoadQuestOption(OwnerID())
end
--==============================--
function LuaPJ_Load_Speak()
	AdjustFaceDir(TargetID(),OwnerID(),0)
	PlayMotion(TargetID(),ruFUSION_ACTORSTATE_EMOTE_SPEAK) --說話
	LoadQuestOption(OwnerID())
end
--==============================--
--==============================--
function PJ_Face_Speak_1()					--說話for亞菲特靈使用
	AdjustFaceDir(TargetID(),OwnerID(),0)
	PlayMotion(TargetID(),ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	LoadQuestOption(OwnerID())
	if CheckAcceptQuest(OwnerID(),423949) then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_117376_01]","luaPJ_117376_01SP",0) --SC_117376_01 請給我更多的陷阱
	end
end

function luaPJ_117376_01SP()
	CloseSpeak(OwnerID())
	GiveBodyItem(OwnerID(),208955,5)
	local num=Rand(4)
	if num==0 then
		Say(TargetID(),"[SC_117376_02]")		--SC_117376_02 雖然這個東西很簡單作，可是也別胡亂使用阿！
	elseif num== 1 then		
		Say(TargetID(),"[SC_117376_03]")		--SC_117376_03 你是不是拿去玩啦，可別浪費我給你的陷阱！
	else
		return TRUE
	end
end

--==============================--
--------------------------------任務423962重要的巡邏工作 

function luaPJ_423962_closeflag()			--對話後將三個旗標關掉
	LoadQuestOption( OwnerID())
	if CheckAcceptQuest(OwnerID(),423962) == FALSE then	
		SetScriptFlag( OwnerID(), 544799, 0)
		SetScriptFlag( OwnerID(), 544809, 0 )
		SetScriptFlag( OwnerID(), 544810, 0 )
	end
end
--------------------------------------巡邏工作：01 start
function luaPJ_423962_0()
	if CheckAcceptQuest(OwnerID(),423962)==true  then
		if CheckFlag(OwnerID(),544799)==true then
			LoadQuestOption(OwnerID())
		else
			LoadQuestOption(OwnerID())
			AdjustFaceDir( TargetID(),OwnerID(), 0 )
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423962_00]","luaPJ_423962_01",0)  	--這是什麼意思
		end
	else
		LoadQuestOption(OwnerID())
	end
END

function luaPJ_423962_01()

	SetSpeakDetail(OwnerID(),"[SC_423962_01]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423962_02]","luaPJ_423962_02",0)
end

function luaPJ_423962_02()
	
	SetSpeakDetail(OwnerID(),"[SC_423962_03]")
	CastSpell(OwnerID(),TargetID(),497140)
	SetScriptFlag( OwnerID(), 544799, 1 )		 --激勵士氣，任務模板記得填
	--GiveBodyItem(OwnerID,544799,1)

end

----------------------------------巡邏工作 01 end
----------------------------------巡邏工作 02 start
function luaPJ_423962_10()
	PlayMotionEX(TargetID(),ruFUSION_ACTORSTATE_CROUCH_BEGIN,ruFUSION_ACTORSTATE_CROUCH_LOOP)
	if CheckAcceptQuest(OwnerID(),423962)==true  then
		if CheckFlag(OwnerID(),544809)==true then
			LoadQuestOption(OwnerID())
		else
			LoadQuestOption(OwnerID())
			AdjustFaceDir( TargetID(),OwnerID(), 0 )
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423962_10]","luaPJ_423962_11",0)  	
		end
	else
		LoadQuestOption(OwnerID())
	end
END

function luaPJ_423962_11()

	SetSpeakDetail(OwnerID(),"[SC_423962_11]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423962_12]","luaPJ_423962_12",0)
end

function luaPJ_423962_12()
	
	SetSpeakDetail(OwnerID(),"[SC_423962_13]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423962_14]","luaPJ_423962_13",0)
end

function luaPJ_423962_13()

	SetSpeakDetail(OwnerID(),"[SC_423962_15]")
	CastSpell(OwnerID(),TargetID(),497140)
	SetScriptFlag( OwnerID(), 544809, 1 )		 --激勵士氣，任務模板記得填
	--GiveBodyItem(OwnerID,544809,1)
end

------------------------------------巡邏工作02 End
------------------------------------巡邏工作03 start

function luaPJ_423962_20()
	if CheckAcceptQuest(OwnerID(),423962)==true  then
		if CheckFlag(OwnerID(),544810)==true then
			LoadQuestOption(OwnerID())
		else
			local Rnum=Rand(4)
			if Rnum==0 or Rnum==1 then
				LoadQuestOption(OwnerID())
				AdjustFaceDir( TargetID(),OwnerID(), 0 )
				AddSpeakOption(OwnerID(),TargetID(),"[SC_423962_20]","luaPJ_423962_21",0)  	
			else
				CallPlot(OwnerID(),"PJ_T_LiveShow",TargetID())
			end
		end
	else
		LoadQuestOption(OwnerID())
	end
END

function luaPJ_423962_21()

	SetSpeakDetail(OwnerID(),"[SC_423962_21]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423962_22]","luaPJ_423962_22",0)
end

function luaPJ_423962_22()
	
	SetSpeakDetail(OwnerID(),"[SC_423962_23]")
	CastSpell(OwnerID(),TargetID(),497140)
	SetScriptFlag( OwnerID(), 544810, 1 )		 --激勵士氣，任務模板記得填
	--GiveBodyItem(OwnerID,544810,1)

end

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------巡邏工作 03 對話 end


-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------巡邏工作 03 戰鬥部份 end

function PJ_T_LiveShow(Target)								--產生攻擊劇情
	CloseSpeak(OwnerID())
	say(Target,"[SC_423962_24]")
	AdjustFaceDir(Target,OwnerID(),0)
	PlayMotion(Target,ruFUSION_ACTORSTATE_UNHOLSTER)
	PlayMotion(Target,ruFUSION_ACTORSTATE_COMBAT_1H)
	CallPlot(OwnerID(),"PJ_L_Battack_0",Target)
end	

function PJ_L_Battack_0(Target)
	local Rnum2 =Rand(4)+1
	local monster_t={105178,105179,105180,105181}
	local monster=Lua_DW_CreateObj("flag",monster_t[Rnum2],780871,5) 			--產生一個蛇人
	PJ_UseAdjModEx(monster)
	PJ_UseAdjModEx(Target)
	SetAttack(monster,OwnerID())
	SetAttack(Target,monster)
		for i=1,500 do								--判斷雙方血量
			sleep(20)
			if ReadRoleValue(OwnerID(),EM_RoleValue_IsDead)==1 then
				Sleep(20)
				DelObj(monster)
				return FALSE
			elseif ReadRoleValue(monster,EM_RoleValue_IsDead)==1 then
				break
			else
				--continue
			end
		End
	PJ_NOUseAdjModEx(Target)
	--DelObj(monster)
	Sleep(20)
	AdjustFaceDir(Target,OwnerID(),0)
	PlayMotion(Target,ruFUSION_MIME_EMOTE_VICTORY)
	Sleep(10)
	Say(Target,"[SC_423962_25]")
	Sleep(20)
	CastSpell(OwnerID(),Target,497140)
	SetScriptFlag( OwnerID(), 544810, 1 )
end
------------------------------------------------------------------------------------------------------------------------------------開啟戰鬥狀態
function PJ_UseAdjModEx(Obj)

	SetModeEx(Obj,EM_SetModeType_Fight,TRUE) 
	SetModeEx(Obj,EM_SetModeType_Strikback,TRUE) 
	SetModeEx(Obj,EM_SetModeType_Searchenemy,TRUE) 
	--DW_UnFight(Obj,true)
	--DW_UnFight(Obj,false)
	return nil
end
---------------------------------------------------------------------------------------------------------------------------------------關掉戰鬥狀態
function PJ_NOUseAdjModEx(Obj)

	SetModeEx(Obj,EM_SetModeType_Fight,FALSE) 
	SetModeEx(Obj,EM_SetModeType_Strikback,FALSE) 
	SetModeEx(Obj,EM_SetModeType_Searchenemy,FALSE) 
	--DW_UnFight(Obj,true)
	--DW_UnFight(Obj,false)
	return nil
end
-----------------------------------------------------------------------------------------------------------------end	



------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------家的記憶	start


--209115[矮人麥酒]
--209009[爆彈草果]
--209005充滿硝煙味的酒
function LuaPJ_423941_talk()
	AdjustFaceDir( TargetID(),OwnerID(),  0 )
	PlayMotion(TargetID(),ruFUSION_ACTORSTATE_EMOTE_SALUTE)
	LoadQuestOption(OwnerID())
		if CheckAcceptQuest(OwnerID(),423934) then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_463941_01]","LuaPJ_423941_01",0)		--01我需要一種奇特的酒…
		end
	AddSpeakOption(OwnerID(),TargetID(),"[SC_463941_02]","LuaPJ_423941_02",0)			--02我想購買一些矮人麥酒
	AddSpeakOption(OwnerID(),TargetID(),"[SC_463941_03]","LuaPJ_423941_04",0)			--03有材料了，請幫我製作充滿硝煙味的酒	
end

function LuaPJ_423941_01()
	SetSpeakDetail(OwnerID(),"[SC_463941_04]")							--04
	AddSpeakOption(OwnerID(),TargetID(),"[SC_463941_05]","LuaPJ_423941_talk",0)		--05我還有其它問題…
end

function LuaPJ_423941_02()
	SetSpeakDetail(OwnerID(),"[SC_463941_06]")							--06剛好我還有一些，每組5瓶，1組300元。
	AddSpeakOption(OwnerID(),TargetID(),"[SC_463941_07]","LuaPJ_423941_03",0)			--07購買
end

function LuaPJ_423941_03()
	if ReadRoleValue ( OwnerID() , EM_RoleValue_Money ) >=300 then			--假如身上有300塊
		AddRoleValue ( OwnerID() , EM_RoleValue_Money , -300 )			--扣你300
		GiveBodyItem(OwnerID(),209115,5)						--給你麥酒
		SetSpeakDetail(OwnerID(),"[SC_463941_08]")					--08 真夠阿莎力的客人，我喜歡！
	else
		SetSpeakDetail(OwnerID(),"[SC_463941_09]")					--09你似乎沒有足夠的錢…
	end
	
	AddSpeakOption(OwnerID(),TargetID(),"[SC_463941_05]","LuaPJ_423941_talk",0)  	--05我還有其它問題…
end

function LuaPJ_423941_04()
	if (CountBodyItem(OwnerID(),209009)==0) then
		SetSpeakDetail(OwnerID(),"[SC_463941_10]")					--10你沒有足夠的[209009]，
		AddSpeakOption(OwnerID(),TargetID(),"[SC_463941_05]","LuaPJ_423941_talk",0) 
	elseif  (CountBodyItem(OwnerID(),209115)==0) then
		SetSpeakDetail( OwnerID(), "[SC_463941_11]")					--11你沒有足夠的[209115]，而我正好有賣耶！真是太神奇了，對吧？
		AddSpeakOption(OwnerID(),TargetID(),"[SC_463941_05]","LuaPJ_423941_talk",0)  
	else
		SetSpeakDetail(OwnerID(),"[SC_463941_12]")						--12喔，你蒐集到足夠的材料了嗎？
		AddSpeakOption(OwnerID(),TargetID(),"[SC_463941_13]","LuaPJ_423941_05",0)  	--13 是的，請幫我製作
	end
end

function LuaPJ_423941_05()
	callplot(OwnerID(),"LuaPJ_423941_creat",TargetID())
End

function LuaPJ_423941_creat(Target)
	CloseSpeak(OwnerID())
	CastSpell(Target,Target,497181)
	Sleep(30)
	local num1 = CountBodyItem( OwnerID(), 209115)
	local num2 = CountBodyItem(OwnerID(), 209009 )
	local Maxnum
		if num1>num2 then
			Maxnum = num2
		else
			Maxnum = num1
		end
		DelBodyItem(OwnerID(),209115,Maxnum)
		DelBodyItem(OwnerID(),209009,Maxnum)
		GiveBodyItem(OwnerID(),209005,Maxnum)
	return TRUE
end


----------------------------------------------------------------------------------------------------------------------家的記憶 end
function PJ_117562_SING()	--給伊根的勵志歌
	local num11=rand(4)		
	if	num11==1	then
		Say(OwnerID(),"[SC_117562_01]")					--漂洋~過海的~青年阿，有著抱負與理想~咚咚搭
		sleep(40)
		Say(OwnerID(),"[SC_117562_02]")					--朝著自己的目標前行~靠所有的能力取得信賴~再辛苦也不害怕~咚搭咚
		sleep(40)
		Say(OwnerID(),"[SC_117562_03]")					--就算偶爾迷失了方向~仰頭有十字星引我前行~咚咚搭
		sleep(40)	
		Say(OwnerID(),"[SC_117562_04]")					--就算路途上偶有阻礙~迎著強風面對挑戰~咚咚搭咚
		sleep(40)
		Say(OwnerID(),"[SC_117562_05]")					--漂洋~過海的~青年阿~追逐夢想永不放棄~搭啦搭啦咚
	else
		return 1
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function LuaPJ_JugM_Y_N()	
	local Obj = OwnerID()							
	local Target = TargetID()					
	local TargetOrgID = ReadRoleValue(Target,EM_RoleValue_OrgID)
	local Target_r=ReadRoleValue(Target,EM_RoleValue_Register)
	if	(TargetOrgID~=105169)	then	
		ScriptMessage( Obj, Obj, 1, "[ST_201250_3]", 0 )		
	elseif	Target_r==50	then
		--Say(Target,Target_r)
		--ScriptMessage( Obj, Obj, 1, "[SC_ALREADY_USED]", 0 )		--目標已被使用過
		return false
	elseif	(ReadRoleValue(Target,EM_RoleValue_HP)/ReadRoleValue(Target,EM_RoleValue_MaxHP))<1	then
		ScriptMessage( Obj, Obj, 1, "[SC_101614_2]", 0 )		--警告訊息：你現在還不能使用！
	elseif	CheckDistance(Obj,Target,50)==false	then
		ScriptMessage( Obj, Obj, 1, "[SC_101614_2]", 0 )		--警告訊息：你現在還不能使用！
	elseif	(ReadRoleValue(Target,EM_RoleValue_IsDead)==1 or ReadRoleValue(Obj,EM_RoleValue_IsDead)==1)	then
		ScriptMessage( Obj, Obj, 1, "[SC_101614_2]", 0 )		--警告訊息：你現在還不能使用！
	elseif	CheckFlag(Obj,544819)==1	then
		ScriptMessage( Obj, Obj, 1, "[SC_101614_2]", 0 )		--警告訊息：你現在還不能使用！
	else
		DelBodyItem(Obj,209010,1)
		SetScriptFlag( Obj, 544819,1)
		--AddBuff(Target,508959,0,10)
		WriteRoleValue(TargetID(),EM_RoleValue_Register,50)
		CallPlot(Target,"LuaPJ_423775_01",Target,Obj)
		return true
	end
	return false
end

function LuaPJ_423775_01(Target,Obj)
	local Rnum1=Rand(5)
	local Rnum2=Rand(7)
		if Rnum1== 0 or Rnum1== 1 or Rnum1== 2 or Rnum1== 3 then
			CastSpell(Obj,Target,497191)				--勾移動不中斷
			Sleep(10)
			ScriptMessage(Obj,Obj,0, "[SC_423775_01]", 0 )		--[SC_423775_01]你看見胡椒炸彈發出了微弱的光芒	
		else
			CastSpell(Obj,Obj,497192)				--勾移動不中斷
			Sleep(10)
			ScriptMessage(Obj,Obj,0, "[SC_423775_02]", 1 )		--[SC_02]胡椒炸彈發出了熊熊的烈火，你覺得你快被烤熟了…
		end
	PJ_NOUseAdjModEx(Target)
	AdjustFaceDir(Target,Obj,0)
	Sleep(10)
		if Rnum2==0 then
			PlayMotion(Target,ruFUSION_ACTORSTATE_DYING)						--動作：死掉				
			ScriptMessage(Obj,Obj,1, "[SC_423775_03]", "0xffffff80" )		--[SC_03]古洛被嚇了一跳就直接昏死過去了！ 
		elseif Rnum2==1 then
			PlayMotion(Target,ruFUSION_ACTORSTATE_CAST_SP01)						--動作：嚇到
			WriteRoleValue(Target,EM_RoleValue_IsWalk,0)	
			Hide(Target)
			Show(Target,0)			
			Sleep(20)
			DW_MoveDirectToFlag( Target,780871,7,10,1)
			ScriptMessage(Obj,Obj,1, "[SC_423775_05]", "0xffffff80" )		--[SC_05]古洛吃了一驚的逃走了 ！
		elseif Rnum2==2 then
			PlayMotion(Target,ruFUSION_ACTORSTATE_ATTACK_1H_SP)						--動作：生氣	
			WriteRoleValue(Target,EM_RoleValue_IsWalk,0)	
			Hide(Target)
			Show(Target,0)				
			Sleep(20)
			ScriptMessage(Obj,Obj,1, "[SC_423775_06]", "0xffffff80" )		--[SC_06]嚇了一跳的古洛冷靜下來後生氣的跑開了…
			DW_MoveDirectToFlag( Target,780871,7,10,1)
		elseif Rnum2==3 then
			PlayMotion(Target,ruFUSION_ACTORSTATE_EMOTE_IDLE2)						--動作：無動作	
			AdjustFaceDir(Target,Obj,180)			
			ScriptMessage(Obj,Obj,1, "[SC_423775_07]", "0xffffff80" )		--[SC_07]毫無反應的古洛默默的轉頭離去…離去時似乎看見了牠鄙視的眼神……
			Sleep(20)
			WriteRoleValue(Target,EM_RoleValue_IsWalk,1)	
			Hide(Target)
			Show(Target,0)
			DW_MoveDirectToFlag( Target,780871,7,10,1)
			Sleep(30)
			PJ_UseAdjModEx(Target)
			SetScriptFlag( Obj, 544819, 0)
			WriteRoleValue(TargetID(),EM_RoleValue_Register,0)
			CallPlot(Target,"LuaFunc_ResetObj",Target)
			return  
		elseif Rnum2==4 then
			PlayMotion(Target,ruFUSION_ACTORSTATE_EMOTE_IDLE2)
			ScriptMessage(Obj,Obj,1, "[SC_423775_08]", "0xffffff80" )		--[SC_08]毫無反應的古洛…依舊是毫無反應……		
			Sleep(20)
			WriteRoleValue(Target,EM_RoleValue_IsWalk,1)	
			Hide(Target)
			Show(Target,0)
			DW_MoveDirectToFlag( Target,780871,7,10,1)
			Sleep(30)
			PJ_UseAdjModEx(Target)
			SetScriptFlag( Obj, 544819, 0)
			WriteRoleValue(TargetID(),EM_RoleValue_Register,0)
			CallPlot(Target,"LuaFunc_ResetObj",Target)
			return  
		else
			PJ_UseAdjModEx(Target)
			WriteRoleValue(Target,EM_RoleValue_Register1,50)
			CallPlot(Target,"LuaPJ_423775_Atc_Start",Target,Obj)			
			return true
		end
		WriteRoleValue(Target,EM_RoleValue_Register,0)
	Sleep(5)
	PJ_UseAdjModEx(Target)
	Sleep(5)
	SetScriptFlag( Obj, 544819, 0)
	DW_QietKillOne(Obj,105342)
	CallPlot(Target,"LuaFunc_ResetObj",Target)
	return
end
--[SC_09]生氣的古洛呼喚著同伴
function LuaPJ_423775_Atc_Start(Target,Obj)
	local T_PARTNER=SearchRangeNPC(Target,150)
	local Partner
		if T_PARTNER[0]==Target then
			Partner=T_PARTNER[1]
		else
			Partner=T_PARTNER[0]
		end
	WriteRoleValue(Target,EM_RoleValue_Register2,Obj)
	ScriptMessage(Obj,Obj,1, "[SC_423775_09]", 1 )	
	PJ_UseAdjModEx(Target)
	Sleep(10)
	SetAttack(Target,Obj)
		if Partner~=nil or Partner~=0 or Partner ~=-1 then
			SetAttack(Partner,Obj)
		end
	for i=1,45,1 do
		local dead=ReadRoleValue(Target,EM_RoleValue_IsDead)
		if dead==1 then
			return
		end
		if HateListCount(Target)==0 then
			WriteRoleValue(Target,EM_RoleValue_Register,0)
			CallPlot(Target,"LuaFunc_ResetObj",Target)
			return
		end
		Sleep(20)
	end  
	WriteRoleValue(Target,EM_RoleValue_Register,0)
	CallPlot(Target,"LuaFunc_ResetObj",Target)

end
--古洛的死亡劇情
function LuaI_423775_Dead()
		WriteRoleValue(TargetID(),EM_RoleValue_Register,0)
		SetPlot(OwnerID(),"dead","Lua_AG_423775",0)
end

function Lua_AG_423775()
	local R_num=ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
		if	R_num~=50	then
			return true
		end
	WriteRoleValue(OwnerID(),EM_RoleValue_Register1,0)
	local Obj=ReadRoleValue(OwnerID(),EM_RoleValue_Register2)
	SetFlag(Obj,544819,0)
	DW_QietKillOne(Obj,105342)
	return true
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------任務423902
function LuaPJ_423902_0()	
	local Obj = OwnerID()--玩家
	local Target = TargetID()--使用對象
	local TargetOrgID = ReadRoleValue(Target,EM_RoleValue_OrgID)
	if	(TargetOrgID~=105175)	then		--目標不是蚯蚓
		ScriptMessage( Obj, Obj, 1, "[ST_201250_3]", 0 )	--目標錯誤
	elseif	CheckBuff(Target,508691)	then		
		--ScriptMessage( Obj, Obj, 1, "[SC_ALREADY_USED]", 0 )	--目標已被使用過
	elseif	(ReadRoleValue(Target,EM_RoleValue_HP)/ReadRoleValue(Target,EM_RoleValue_MaxHP))>0.5	then
		ScriptMessage( Obj, Obj, 1, "[SC_101614_2]", 0 )		--警告訊息：你現在還不能使用！
	elseif	CheckDistance(Obj,Target, 150)==false	then
		ScriptMessage( Obj, Obj, 1, "[SC_101614_2]", 0 )		--警告訊息：你現在還不能使用！
	elseif	(ReadRoleValue(Target,EM_RoleValue_IsDead)==1 or ReadRoleValue(Obj,EM_RoleValue_IsDead)==1)	then
		ScriptMessage( Obj, Obj, 1, "[SC_101614_2]", 0 )		--警告訊息：你現在還不能使用！
	else
		DelBodyItem(Obj,208955,1)
		SetStopAttack(Obj)
		return true
	end
	return false--不予理會
end

function LuaPJ_423902_01()	--翻土研究，點完
		CallPlot(TargetID(),"LuaPJ_423902_02",OwnerID(),TargetID())
end

function LuaPJ_423902_02(PlayBoy,Monster)
		AddBuff(Monster,508691,1,10)
		CastSpell(PlayBoy,Monster,496982)
		Sleep(30)
		GiveBodyItem(PlayBoy,208956,1)
		CallPlot(Monster,"LuaFunc_ResetObj",Monster)
end
------------------------------------------------------------------------------------------------------------------------------------------任務423932：甲殼研究
function LuaPJ_423932_init()
	PJ_UseAdjModEx(OwnerID())
end
function LuaPJ_423932_0()	
	local Obj = OwnerID()--玩家
	local Target = TargetID()--使用對象
	local TargetOrgID = ReadRoleValue(Target,EM_RoleValue_OrgID)
	local x=ReadRoleValue(Target,EM_RoleValue_Register1)
	if	(TargetOrgID~=105193)	then		--目標不是
		ScriptMessage( Obj, Obj, 1, "[ST_201250_3]", 0 )	--目標錯誤
	elseif	x==1	then		
		ScriptMessage( Obj, Obj, 1, "[SC_ALREADY_USED]", 0 )	--目標已被使用過
	elseif	(ReadRoleValue(Target,EM_RoleValue_HP)/ReadRoleValue(Target,EM_RoleValue_MaxHP))>0.45	then
		ScriptMessage( Obj, Obj, 1, "[SC_101614_2]", 0 )		--警告訊息：你現在還不能使用！
	elseif	CheckDistance(Obj,Target, 150)==false	then
		ScriptMessage( Obj, Obj, 1, "[SC_101614_2]", 0 )		--警告訊息：你現在還不能使用！
	elseif	(ReadRoleValue(Target,EM_RoleValue_IsDead)==1 or ReadRoleValue(Obj,EM_RoleValue_IsDead)==1)	then
		ScriptMessage( Obj, Obj, 1, "[SC_101614_2]", 0 )		--警告訊息：你現在還不能使用！
	else
		SetStopAttack(Obj)
		return true
	end
	return false--不予理會

end


function LuaPJ_423932_2()
	WriteRoleValue(TargetID(),EM_RoleValue_Register1,1)
	--LockHP( TargetID() , ReadRoleValue(TargetID(),EM_RoleValue_MaxHP)*0.4 , "Lua_424225_LockHP" ); 
	CallPlot(TargetID(),"LuaPJ_423932_3",OwnerID(),TargetID())
end
function LuaPJ_423932_3(own,Target)
		Sleep(10)
		GiveBodyItem(Own,208982,1)
		ScriptMessage(Own,Own, 0, "[SC_423932_01]", 0) 	--SC_423932_01 貝殼上缺了一角的凱蘭丁寄居蟹傷心的離去了
		PJ_NOUseAdjModEx(Target)
		SetStopAttack(Target)
		DW_MoveDirectToFlag( Target,780871,6,1)
		Sleep(20)
		PJ_UseAdjModEx(Target)
		Sleep(10)
		WriteRoleValue(Target,EM_RoleValue_Register1,0)
		CallPlot(Target,"LuaFunc_ResetObj",Target)
		return TRUE
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------凡蓋德營地，放置陷阱
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------凡蓋德營地，放置陷阱
function PJ_423820_0()							--掛在點擊後產生劇情
	local Rnum=Rand(5)
	--DebugMsg(0,0,Rnum)
	if  CountBodyItem(OwnerID(),209050)>0 then
		DelBodyItem(OwnerID(),209050,1)
		DW_QietKillOne(0,105332)
			if Rnum==4 then
				CallPlot(TargetID(),"PJ_423820_01",TargetID())
			end
		return 1
	else
		ScriptMessage(OwnerID(),OwnerID(),0,"[SC_SPQUESTSET_NOITEM]",0)
		return FALSE
	end
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function PJ_423820_01(Target)
	

	local num=RandRange(50,100)
	local Xrang=ReadRoleValue(Target,EM_RoleValue_X)
	local Yrang=ReadRoleValue(Target,EM_RoleValue_Y)
	local Zrang=ReadRoleValue(Target,EM_RoleValue_Z)
	local xyz={Xrang+num,Yrang,Zrang+num}
	local Obj_S=Lua_DW_CreateObj("xyz",105178,xyz,1,0,1)		--產生一個物件

	PJ_NoUseAdjModEx(Obj_S)
	Move( Obj_S, Xrang, Yrang , Zrang ) 
	Sleep(40)
	SysCastSpellLv(Target,Obj_S,497189,1)
	sleep(40)
	DelObj(Obj_S)
	CallPlot(Target,"LuaFunc_ResetObj",Target)
	return 1	
end
---------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------凡蓋德營地，放置陷阱
function luaPJ_FAKE_TRAP()

		local test_table=SearchRangeNPC(OwnerID(),30)
		local menber1=ReadRoleValue(test_table[0],EM_RoleValue_CampID)
		local menber2=ReadRoleValue(test_table[1],EM_RoleValue_CampID)
		local Npc1
		local NpcCamp

			if test_table[0]~= nil  and test_table[0]~= -1 and test_table[0]~=OwnerID() then
					Npc1=test_table[0]
					NpcCamp=menber1
			elseif test_table[1]~= nil  and test_table[1]~= -1 and test_table[1]~=OwnerID() then
					Npc1=test_table[1]	
					NpcCamp=menber2
			else
					return
			End
	
			if npc1~=0 and NpcCamp==3 then
					AddBuff(npc1,508907,1,12)
					--ScriptMessage(OwnerID(),0,1,"[SC_117612TRAP_0]",0)
			else
					--Sleep(200)
					return
			end
		return
		
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


