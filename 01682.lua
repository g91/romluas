
function LuaS_422872_0()
	SetDefIdleMotion( OwnerID(), ruFUSION_MIME_SLEEP_LOOP)
end

function LuaS_422872_1()
		LoadQuestOption(OwnerID())
	if 	CheckAcceptQuest( OwnerID() , 422872 ) == true	and	CheckFlag(OwnerID(),543501) == false	and	CheckFlag(OwnerID(),543526) == true	then
		SetFlag( OwnerID() , 543501 , 1 )	
	end	
end

function LuaS_422872_2()	--掛艾傑爾
		LoadQuestOption(OwnerID())
	if 	CheckCompleteQuest( OwnerID() , 422896) == true		then
		SetFlag( OwnerID() , 543526 , 1 )	
	end	
end

function LuaS_114099()	--艾傑爾吐血持續施法
	--LuaP_DW_Dead()
	LuaP_Sitting()
	while true do
		sleep(20)
		CastSpell( OwnerID(), OwnerID(), 492667 )
	end
end


----------------------------------------------------------------------------------------

function LuaS_422873_0()
	LoadQuestOption(OwnerID())	
	if	(CheckAcceptQuest(OwnerID(),422873)==true)and(CheckCompleteQuest(OwnerID(),422873)==false)	 then
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422873_0]","LuaS_422873_1",0)	--我們需要你的幫忙！
	end
end

function LuaS_422873_1()
	SetSpeakDetail(OwnerID(),"[SC_422873_1]")				--(隱士揮落斗蓬上的灰塵，看起來像是剛從外頭回來。)	
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422873_2]","LuaS_422873_2",0)	--我把艾傑爾從敵人基地帶回來，但他身受重傷，目前在哈利普頓那裡。
end

function LuaS_422873_2()
	SetSpeakDetail(OwnerID(),"[SC_422873_3]")				--艾傑爾...是哈利普頓口中一直唸著的朋友。
	SetFlag( OwnerID() , 543503  , 1 )
end

function LuaS_422873_99() --完成任務後
	Addbuff( TargetID() , 504004 , 0 , -1 )
 	local Anter   = Lua_DW_CreateObj("flag" ,114277,780455,2 ) 	--種出安特克羅（演戲用）
	DisableQuest( Anter , true )					--關閉對話
	MoveToFlagEnabled(Anter , false )				--關閉巡邏
	local Harry   = Lua_DW_CreateObj("flag" ,114021,780455,1 ) 	--種出哈利普頓（演戲用）
	DisableQuest( Anter , true )					--關閉對話
	MoveToFlagEnabled(Anter , false )				--關閉巡邏
	local TTRR= Lua_DW_CreateObj("flag" ,114023,780455,3 ) 
	Lua_ObjDontTouch( TTRR )
	say(Harry   ,"[SC_422873_4]")					--艾傑爾…艾傑爾！
--	PlayMotion( Harry , ruFUSION_ACTORSTATE_EMOTE_CRY)
	PlayMotion( Harry , ruFUSION_ACTORSTATE_EMOTE_ANGRY)
	sleep(20)
	say(Anter,"[SC_422873_12]")					--孩子，你需要冷靜。
	PlayMotion(  Anter, ruFUSION_ACTORSTATE_EMOTE_APPROVAL)
--	PlayMotion(  Anter, ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	sleep(20)
	FaceObj( Harry  , Anter  )
	say(Harry   ,"[SC_422873_5]")					--隱士！救他！救他好嗎？拜託你…
---	PlayMotion( Harry , ruFUSION_ACTORSTATE_EMOTE_BEG)
	PlayMotion( Harry ,ruFUSION_ACTORSTATE_EMOTE_SURRENDER )
	sleep(20)
	FaceObj( Anter  ,Harry   )
	say(Anter,"[SC_422873_6]")						--不用太過擔心，他還有一絲氣息。
	PlayMotion( Anter , ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)
--	PlayMotion( Anter  ,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(20)
	say(Harry   ,"[SC_422873_7]")					--所以他能活下來對不對？
	PlayMotion( Harry ,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(20)
	FaceObj( Harry  , TTRR  )
	sleep(10)
	PlayMotion( Harry ,ruFUSION_ACTORSTATE_CROUCH_BEGIN )
	say(Harry   ,"[SC_422873_8]")					--艾傑爾，你有救了！聽到了嗎？聽到了嗎？
	sleep(20)
--	PlayMotion( Harry ,ruFUSION_ACTORSTATE_CROUCH_END )	
	FaceObj( Harry  , Anter  )
	say(Harry   ,"[SC_422873_9]")					--啊…還有…那時候我都看到了…重要的自然之石被艾傑爾拿走，對不起…
	PlayMotion( Harry ,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	say(Harry   ,"[SC_422873_10]")					--但是，艾傑爾有說自然之石已經被獻給魔族希爾洛奧斯，你知道他是誰嗎？
	PlayMotion( Harry ,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	say(Anter,"[SC_422873_11]")					--魔族…
	sleep(20)
	DelObj(Anter)
	DelObj(Harry )
	DelObj(TTRR)
	CancelBuff_NoEvent( TargetID() , 504004 )
End
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
--422876 歸還自然之石

function LuaI_422876() --接任務後上BUFF					--掛在接受任務後
	
	AddBuff(TargetID() , 505441 , 0 , 600 )  --任務檢查buff
end

function LuaI_422876_1() --放棄任務時刪除物件			
	
	if (CheckAcceptQuest(OwnerID(),422876)==false)and(CheckCompleteQuest(OwnerID(),422876)==false) then
	
		SetFlag( OwnerID() , 543505, 0 )
		CancelBuff( OwnerID() , 505441 )
	end
end

function LuaI_422876_2() --BUFF結束時，任務失敗通知
	
	if CheckCompleteQuest(OwnerID(),422876)==false then
		
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_421696]" , C_SYSTEM )	
		SetFlag( OwnerID() , 543505, 0 )			--任務條件
		if	CountBodyItem( OwnerID(), 206389 )	then
			DelBodyItem( OwnerID(), 206389,1 )	
		end
	end
end

function LuaI_422876_3() --任務完成後，刪除身上的計時BUFF			--掛在還任務
	
	CancelBuff( TargetID() , 505441 )
end

-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
--422897 王者再臨

--function LuaS_422897_0() 	--掛在地圖上的亞爾弗列德
--	LoadQuestOption(OwnerID())
--	if	(CheckAcceptQuest(OwnerID(),422897 )== true )and( CheckCompleteQuest( OwnerID(),422897)== false)	then
--		AddSpeakOption(OwnerID(),TargetID(),"[SC_422897_0]","LuaS_422897_1",0)				--我把自然之石帶回來了，隱士和米娜薇絲說過…
--	end
--end

function LuaS_422897_1() 
	SetSpeakDetail(OwnerID(),"[SC_422897_1]")							--嗯…我想先確認一件事。
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422897_2]","LuaS_422897_2",0)				--隱士確實這麼說過，但他究竟是誰？為什麼會終止你們的使命？

end

function LuaS_422897_2() 
	SetSpeakDetail(OwnerID(),"[SC_422897_3]")							--隱士的身份…他是尊貴的那一位王者啊…
	if	(CheckAcceptQuest(OwnerID(),422897 )== true )and( CheckCompleteQuest( OwnerID(),422897)== false) and
		ReadRoleValue( TargetID() , EM_RoleValue_Register+8 ) == 0 			  	       	 then	
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422897_4]","LuaS_422897_3",0)				--他好像沒有特別提及…
	end
	if	(CheckAcceptQuest(OwnerID(),422897 )== true )and( CheckCompleteQuest( OwnerID(),422897)== false) and
		ReadRoleValue( TargetID() , EM_RoleValue_Register+8 ) ~= 0 				       	 then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422897_4]","LuaS_422897_99",0)				--他好像沒有特別提及…
	end
end

function LuaS_422897_3()
	writerolevalue( TargetID() , EM_RoleValue_Register+8 , 1 )						--TargetID是亞爾
	CloseSpeak(OwnerID())
	Beginplot(TargetID(),"LuaS_422897_4",0)
end

function LuaS_422897_99()
	CloseSpeak(OwnerID())
	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422897_98]" , 0 )	 				--亞爾長老手裡握著魯弗提克的遺物，靜默的神情像是在緬懷...
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422897_98]" , 0 )
end


function LuaS_422897_4()
	say(OwnerID() ,"[SC_422897_23]")					--沒有提及...
	PlayMotion(OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(10)
	say(OwnerID() ,"[SC_422897_24]")					--等等，這股氣息...莫非是那一位？我們先去確認。
	PlayMotion(OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(20)
	SetPosByFlag( TargetID(), 780456 , 4)					--傳送玩家
	Addbuff( TargetID() , 504004 , 0 , -1 )					--owner是亞爾
	sleep(10)
	local YA   = Lua_DW_CreateObj("flag" ,114279,780456,1 )		 	--種出亞爾114279（演戲用）		--原本的client隱藏
	DisableQuest( YA , true )						--關閉對話
	MoveToFlagEnabled(YA , false )					--關閉巡邏
	sleep(10)
	say(YA,"[SC_422897_25]")						--就是這裡。
	sleep(20)
	local MINA   = Lua_DW_CreateObj("flag" ,114268,780456,2 ) 	--種出米娜薇絲（演戲用）	--原本的client隱藏
	DisableQuest( MINA , true )					--關閉對話
	MoveToFlagEnabled(MINA , false )				--關閉巡邏			
	yell( MINA , "[SC_422897_5]",2 )				--抱歉，亞爾，我實在等不及確認～
---插入動作
	PlayMotion( MINA ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
--	PlayMotion( MINA ,ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)

	sleep(20)
	yell( MINA , "[SC_422897_6]",2 )				--那位隱士真的是...？
--插入動作
	PlayMotion( MINA ,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(20)
	yell( YA   , "[SC_422897_7]",2 )				--是的。但我們守護的禁制之壁如今…	
	PlayMotion( YA ,ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	sleep(20)

	ScriptMessage( TargetID() , TargetID() , 2 , "[SC_422897_8]" , 0 )	 --一陣輕柔薰風伴隨草木飄揚悠然而至～～
	ScriptMessage( TargetID() , TargetID() , 0 , "[SC_422897_8]" , 0 )
	sleep(20)
	ScriptMessage( TargetID() , TargetID() , 2 , "[SC_422897_26]" , 0 )	 --精靈們被蘊含的自然之力吸引前來
	ScriptMessage( TargetID() , TargetID() , 0 , "[SC_422897_26]" , 0 )

	local People = {}
	local amount = 8
	For i=1, amount  do
		sleep(5)	
		local R = Rand( 3 ) 
		if	R ==0	then
			local P = Rand( 3 ) 
			if	P ==0	then
				People[i] = CreateObjByFlag( 114284 , 780521 , 9 , 0 )  
				Lua_ObjDontTouch( People[i] )	
				WriteRoleValue(People[i] , EM_RoleValue_IsWalk , 1 )
				AddToPartition( People[i] , 0 )
				Lua_ObjDontTouch( People[i]) 
				writerolevalue( People[i] , EM_RoleValue_PID , i )	
				BeginPlot(People[i],"LuaS_422897_PeopleGo",0)
			elseif	P ==1	then
				People[i] = CreateObjByFlag( 114284 , 780521 , 10 , 0 )  
				Lua_ObjDontTouch( People[i] )
				WriteRoleValue(People[i] , EM_RoleValue_IsWalk , 1 )
				AddToPartition( People[i] , 0 )
				Lua_ObjDontTouch( People[i]) 
				writerolevalue( People[i] , EM_RoleValue_PID , i )	
				BeginPlot(People[i],"LuaS_422897_PeopleGo",0)
			else
				People[i] = CreateObjByFlag( 114284 , 780521 , 11 , 0 )  
				Lua_ObjDontTouch( People[i] )
				WriteRoleValue(People[i] , EM_RoleValue_IsWalk , 1 )
				AddToPartition( People[i] , 0 )
				Lua_ObjDontTouch( People[i]) 
				writerolevalue( People[i] , EM_RoleValue_PID , i )	
				BeginPlot(People[i],"LuaS_422897_PeopleGo",0)
			end	
		elseif	R ==1	then	
			local P = Rand( 3 ) 
			if	P ==0	then
				People[i] = CreateObjByFlag( 114285 , 780521 , 9 , 0 )  
				Lua_ObjDontTouch( People[i] )
				WriteRoleValue(People[i] , EM_RoleValue_IsWalk , 1 )
				AddToPartition( People[i] , 0 )
				Lua_ObjDontTouch( People[i]) 
				writerolevalue( People[i] , EM_RoleValue_PID , i )	
				BeginPlot(People[i],"LuaS_422897_PeopleGo",0)
			elseif	P ==1	then
				People[i] = CreateObjByFlag( 114285 , 780521 , 10 , 0 )  
				Lua_ObjDontTouch( People[i] )
				WriteRoleValue(People[i] , EM_RoleValue_IsWalk , 1 )
				AddToPartition( People[i] , 0 )
				Lua_ObjDontTouch( People[i]) 
				writerolevalue( People[i] , EM_RoleValue_PID , i )	
				BeginPlot(People[i],"LuaS_422897_PeopleGo",0)
			else
				People[i] = CreateObjByFlag( 114285 , 780521 , 11 , 0 )  
				Lua_ObjDontTouch( People[i] )
				WriteRoleValue(People[i] , EM_RoleValue_IsWalk , 1 )
				AddToPartition( People[i] , 0 )
				Lua_ObjDontTouch( People[i]) 
				writerolevalue( People[i] , EM_RoleValue_PID , i )	
				BeginPlot(People[i],"LuaS_422897_PeopleGo",0)
			end	
		else
			local P = Rand( 3 ) 
			if	P ==0	then
				People[i] = CreateObjByFlag( 114286 , 780521 , 9 , 0 )  
				Lua_ObjDontTouch( People[i] )
				WriteRoleValue(People[i] , EM_RoleValue_IsWalk , 1 )
				AddToPartition( People[i] , 0 )
				Lua_ObjDontTouch( People[i]) 
				writerolevalue( People[i] , EM_RoleValue_PID , i )	
				BeginPlot(People[i],"LuaS_422897_PeopleGo",0)
			elseif	P ==1	then
				People[i] = CreateObjByFlag( 114286 , 780521 , 10 , 0 )  
				Lua_ObjDontTouch( People[i] )
				WriteRoleValue(People[i] , EM_RoleValue_IsWalk , 1 )
				AddToPartition( People[i] , 0 )
				Lua_ObjDontTouch( People[i]) 
				writerolevalue( People[i] , EM_RoleValue_PID , i )	
				BeginPlot(People[i],"LuaS_422897_PeopleGo",0)
			else
				People[i] = CreateObjByFlag( 114286 , 780521 , 11 , 0 )  
				Lua_ObjDontTouch( People[i] )
				WriteRoleValue(People[i] , EM_RoleValue_IsWalk , 1 )
				AddToPartition( People[i] , 0 )
				Lua_ObjDontTouch( People[i]) 
				writerolevalue( People[i] , EM_RoleValue_PID , i )	
				BeginPlot(People[i],"LuaS_422897_PeopleGo",0)
			end	
		end
	End
	yell( MINA , "[SC_422897_27]",2 )				--你們也感受到這股豐沛的自然之力了？
	sleep(60)
	local Anter   = Lua_DW_CreateObj("flag" ,114290,780456,3 ) 	--種出隱士（演戲用）		--原本的client隱藏
	DisableQuest( Anter , true )					--關閉對話
	MoveToFlagEnabled(Anter , false )				--關閉巡邏	種出隱士
	yell( Anter , "[SC_422897_9]",2 )				--禁制之壁已有自然之石足以維繫。
---插入動作
	PlayMotion( Anter,	ruFUSION_MIME_EMOTE_IDLE2)

	sleep(30)
	AdjustFaceDir( YA , Anter, 0 )
	yell( YA , "[SC_422871_13]",2 )				--王！
	PlayMotionEX( YA , ruFUSION_ACTORSTATE_CROUCH_BEGIN,ruFUSION_ACTORSTATE_CROUCH_LOOP)

---插入動作
	--PlayMotion( YA,	ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	sleep(30)
	if	CheckID( TargetID()) == false	then
		writerolevalue( OwnerID() , EM_RoleValue_Register+8 , 0 )
		SetFlag(TargetID(),543526,0)
		DelObj(YA)
		DelObj(MINA)
		DelObj(Anter)
		For i=1, 8  do
			DelObj(People[i])
		end
	end

	if	(CheckAcceptQuest(TargetID(),422897)==true )	and	(CheckFlag( TargetID(), 543527 )==false)		then
		SetFlag( TargetID() , 543527  , 1 )
	end
	AdjustFaceDir( MINA , Anter, 0 )
	yell( MINA , "[SC_422897_10]",2 )				--您是安特克羅…精靈王安特克羅嗎？    --罐頭疑問

---插入動作
	PlayMotion( MINA,ruFUSION_ACTORSTATE_EMOTE_SPEAK )

	sleep(30)
	yell( Anter , "[SC_422897_11]",2 )

-----插入動作

	PlayMotion(Anter  , ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)------
				--是。 					--罐頭驚嘆我王！
	sleep(30)

	For i=1, 8  do
		AdjustFaceDir( People[i], Anter, 0 )
		local R = Rand( 3 ) 
		if	R ==0	then
			PlayMotion( People[i] ,ruFUSION_ACTORSTATE_DAZED_BEGIN )
		elseif	R ==1	then
			PlayMotion( People[i] ,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
		else
			PlayMotion( People[i] ,ruFUSION_ACTORSTATE_EMOTE_IDLE2 )
		end	
	end
	sleep(20)	
	For i=1, 8  do
		PlayMotionEX( People[i] , ruFUSION_ACTORSTATE_CROUCH_BEGIN,ruFUSION_ACTORSTATE_CROUCH_LOOP)
	end

	yell( MINA , "[SC_422897_12]",2 )				--感謝精靈聖王～沒想到我會在此見到您，然而有件事我深感抱歉....關於聖劍弧光亞克，我兒莽撞……

---插入動作
	PlayMotionEX( MINA , ruFUSION_ACTORSTATE_CROUCH_BEGIN,ruFUSION_ACTORSTATE_CROUCH_LOOP)
	sleep(20)

---插入動作
	yell( Anter , "[SC_422897_13]",2 )				--波魯內傑之妃，不用自責。

--	PlayMotion( Anter ,ruFUSION_MIME_EMOTE_SPEAK )
	PlayMotion( Anter , ruFUSION_ACTORSTATE_EMOTE_APPROVAL)
--	PlayMotion( Anter ,ruFUSION_ACTORSTATE_ATTACK_1H)

---插入王妃
	sleep(15)
	PlayMotion( MINA, ruFUSION_ACTORSTATE_CROUCH_END)

	sleep(20)
	yell( Anter , "[SC_422897_14]",2 )				--精靈聖王之物還有機會尋回，它的初始意義在於護衛我族，儘管在被拔起時造成禁制之壁封印力量減弱

---插入動作
	PlayMotion( Anter ,ruFUSION_ACTORSTATE_EMOTE_SPEAK )

	if	CheckID( TargetID()) == false	then
		writerolevalue( OwnerID() , EM_RoleValue_Register+8 , 0 )
		SetFlag(OwnerID(),543526,0)
		DelObj(YA)
		DelObj(MINA)
		DelObj(Anter)
		For i=1, 8  do
			DelObj(People[i])
		end
	end
	sleep(50)
	yell( YA , "[SC_422897_15]",2 )				--王，您的意思是…我們從現在開始不再守護禁制之壁？--罐頭—附和擔憂--

---插入動作
	--PlayMotion( YA ,ruFUSION_ACTORSTATE_EMOTE_SPEAK )

	sleep(20)
	yell( Anter , "[SC_422897_16]",2 )				--歷史將在此進入轉折，已經足夠了，你們做得很好。
----插入動作

--	PlayMotion( Anter ,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	PlayMotion( Anter ,ruFUSION_ACTORSTATE_EMOTE_POINT )

	sleep(20)
	yell( Anter , "[SC_422897_17]",2 )				--現在，讓我們回歸、傾聽自然的詠歎，過去的使命該結束了。
---插入動作 shield_bash
	PlayMotion(  Anter  ,ruFUSION_ACTORSTATE_SHIELD_BASH)
--	sleep(10)
--	PlayMotion(  Anter  ,ruFUSION_ACTORSTATE_SHIELD_BLOCK)	

	sleep(20)
	PlayMotion( YA, ruFUSION_ACTORSTATE_CROUCH_END)
	For i=1, 8  do
		PlayMotion( People[i] , ruFUSION_ACTORSTATE_CROUCH_END)
	end
	sleep(10)
	ScriptMessage( TargetID() , TargetID() , 2 , "[SC_422897_18]" , 0 )	 --眾精靈激昂地看著安特克羅！
	ScriptMessage( TargetID() , TargetID() , 0 , "[SC_422897_18]" , 0 )	

	For i=1, 8  do
		PlayMotion( People[i] ,ruFUSION_ACTORSTATE_EMOTE_VICTORY	)
	end

	sleep(20)
	yell( Anter , "[SC_422897_19]",2 )				--從今而後，毋須再為過去擔憂，現在開始，以我們精靈之傲與尊嚴寫下屬於新時代的篇章，締造更輝煌的歷史。

---插入動作  buff01
	PlayMotion( Anter , ruFUSION_ACTORSTATE_BUFF_BEGIN)
	sleep(10)
	PlayMotion(Anter ,ruFUSION_ACTORSTATE_BUFF_END )

	sleep(20)
	yell( MINA , "[SC_422897_20]",2 )				--已經毋須再為過去擔憂…

---插入動作
	PlayMotion(  MINA  ,ruFUSION_ACTORSTATE_EMOTE_SPEAK )

	sleep(10)
	yell( YA , "[SC_422897_21]",2 )				--是的！跟隨王的腳步，我們將邁向更輝煌的未來。

--插入動作
--	PlayMotion(YA ,	ruFUSION_ACTORSTATE_EMOTE_APPLAUSE	 )
	PlayMotion(YA ,	ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )

	sleep(20)


	yell( Anter , "[SC_422897_22]",2 )				--精靈聖王的意志永存，而我也會與你們同在。
---插入動作
--	PlayMotion( Anter ,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	PlayMotion( Anter ,	ruFUSION_ACTORSTATE_EMOTE_POINT )


	sleep(20)
	DelObj(MINA)							--還任務的client顯現
									--隱士在結束後不久<算整段的時間>隱藏
	DelObj(YA)
	DelObj(Anter )
	For i=1, 8  do
		DelObj(People[i])
	end		
	CancelBuff_NoEvent( TargetID() , 504004 )				
	writerolevalue( OwnerID() , EM_RoleValue_Register+8 , 0 )
end

function LuaS_422897_PeopleGo()
	MoveToFlagEnabled(OwnerID(), false)
	LuaFunc_MoveToFlag(OwnerID() , 780521 , ReadRoleValue(OwnerID(),EM_RoleValue_PID),0  )
end

