--===========================================================================================================================
--任務編號:423611	旗標編號:780742    看戲BUFF:507551		Flag:544575
--===========================================================================================================================

--演出的演員   
--116540拉法埃爾．貝克德
--116867伊崔妮
--116541~116544葛林鎮民(男)
--116864~116866葛林鎮民(女)

--(1)對話劇情觸發模式
function LuaWS_423611()	--掛在116425湯尼身上
	if 		CheckAcceptQuest( OwnerID(), 423611 ) == true 				and 
			CheckFlag( OwnerID(), 544575 ) == false 					and 
			ReadRoleValue( TargetID(), EM_RoleValue_Register1 ) > 0 	then
			--■■註■■判斷有任務  沒有旗標  並且該NPC忙碌時
			SetSpeakDetail( OwnerID(), "[SC_423611_0]" ) 
			--騎士，你也選擇潛藏在這個地點嗎？看來躲在這裡挺萬無一失的，我放心了。噓，安靜，遠方似乎有動靜。
			AddSpeakOption( OwnerID(), TargetID(), "[SC_423611_1]", "LuaWS_423611_0",0) 
			--是的，陛下。
			
			elseif 	CheckAcceptQuest( OwnerID(), 423611 ) == true 		and 
					CheckFlag( OwnerID(), 544575 ) == false 			then 
					--■■註■■否則進行第二判斷  有任務 沒有旗標 並該NPC不忙碌時
					SetSpeakDetail( OwnerID(), "[SC_423611_0]" ) 
					AddSpeakOption( OwnerID(), TargetID(), "[SC_423611_1]", "LuaWS_423611_1",0) 
					--是的，陛下。
	else
			LoadQuestOption( OwnerID() )	
			--■■註■■如果不掛這個，該NPC其他任務將不會被玩家看見
	end
end

--(2)若已有人觸發劇情，該npc可請玩家等候
function LuaWS_423611_0()
	SetSpeakDetail( OwnerID(), "[SC_423611_2]" ) 
	--湯尼沒空:是我聽錯了，拉法埃爾還沒有過來，我們再靜待一會吧，騎士。
end

--(3)成功觸發劇情 lua
function LuaWS_423611_1()
	CloseSpeak( OwnerID() )
	WriteRoleValue( TargetID(), EM_RoleValue_Register1, 1 )	
	--讓NPC變忙碌
	BeginPlot( TargetID(), "LuaWS_423611_2", 0 )
end

--114357
--checkid
--(4)劇情演出lua
function LuaWS_423611_2()

	while true do								--注意 這是迴圈 將自動上BUFF 自動判斷玩家有無離開劇情範圍
		local O_ID = OwnerID()					--掛在NPC身上的演戲劇情
		local QuestID = 423611					--任務編號 (只要改動此編號)
		local FinishFlagID = 544575				--完成任務獲得的旗標	(只要改動此編號)
		local CheckBuffID = 507551				--檢查是否正在演戲的BUFF(只要改動此編號) 507178為演戲BUFF 503977為棟住BUFF
		local CheckRange = 150					--演戲的檢查範圍(只要改動此範圍)
		local DoScript = "LuaWS_423611_break"	--當劇情結束或者沒人在看戲時作的處理	(要改為自己的任務編號)
				
		--（（（（（（（叫出演員）））））））
		local NPCL1 = Lua_DW_CreateObj("flag" ,116541, 780742 , 1 )	
		local NPCL2 = Lua_DW_CreateObj("flag" ,116542, 780742 , 2 )	
		local NPCL3 = Lua_DW_CreateObj("flag" ,116543, 780742 , 3 )	
		local NPCL4 = Lua_DW_CreateObj("flag" ,116544, 780742 , 4 )	
		local NPCL5 = Lua_DW_CreateObj("flag" ,116864, 780742 , 5 )	
		local NPCL6 = Lua_DW_CreateObj("flag" ,116865, 780742 , 6 )	
		local NPCL7 = Lua_DW_CreateObj("flag" ,116866, 780742 , 7 )	

		Sleep(10)
		
		--（（（（（（（開演！！））））））
		
		ScriptMessage(  TargetID()   , TargetID()    , 0 , "[SC_423611_10]" , 0 )
		ScriptMessage(  TargetID()   , TargetID()    , 1 , "[SC_423611_10]" , 0 )
		ks_ActSetMode( NPCL1 )
		ks_ActSetMode( NPCL2 )
		ks_ActSetMode( NPCL3 )
		ks_ActSetMode( NPCL4 )
		ks_ActSetMode( NPCL5 )
		ks_ActSetMode( NPCL6 )
		ks_ActSetMode( NPCL7 )	
		--演員專用函式  阿信包的(關閉移動劇情 保持走路狀態 無法反擊'攻擊'索敵'點選'隱藏血條'顯示名稱)

		Sleep(5)
		CallPlot( OwnerID(), "ks_QuestAddBuff", QuestID, FinishFlagID, CheckBuffID, CheckRange, DoScript )
		--範圍看戲用的檢查函式(要加入 呼應檢查函式)

		WriteRoleValue( NPCL1, EM_RoleValue_PID, 1 )	
		WriteRoleValue( NPCL2, EM_RoleValue_PID, 2 )	
		WriteRoleValue( NPCL3, EM_RoleValue_PID, 3 )	
		WriteRoleValue( NPCL4, EM_RoleValue_PID, 4 )	
		WriteRoleValue( NPCL5, EM_RoleValue_PID, 5 )	
		WriteRoleValue( NPCL6, EM_RoleValue_PID, 6 )	
		WriteRoleValue( NPCL7, EM_RoleValue_PID, 7 )	
		
		
		Beginplot(NPCL1,"LuaWS_423611_NPCL",0)
		Beginplot(NPCL2,"LuaWS_423611_NPCL",0)
		Beginplot(NPCL3,"LuaWS_423611_NPCL",0)
		Beginplot(NPCL4,"LuaWS_423611_NPCL",0)
		Beginplot(NPCL5,"LuaWS_423611_NPCL",0)
		Beginplot(NPCL6,"LuaWS_423611_NPCL",0)
		Beginplot(NPCL7,"LuaWS_423611_NPCL",0)
		Sleep(80)
		
		local Lafa = Lua_DW_CreateObj("flag" ,116540,780742 ,8)
		local Rose = Lua_DW_CreateObj("flag" ,116867,780742 ,9)	
		ks_ActSetMode( Lafa )	
		ks_ActSetMode( Rose )

		Beginplot(Lafa,"LuaWS_423611_Lafa_1",0)
		Sleep(10)
		DW_MoveToFlag(Rose,780742 , 19 ,0 ,1)
		Sleep(10)
		Yell(Lafa,"[SC_423611_3]",4)
		--現在能站在這裡的，都是擁有最多神賜之果的力量，被選中的人。
		Sleep(40)
		
		Beginplot(NPCL1,"LuaWS_423611_NPCL_1",0)
		Beginplot(NPCL2,"LuaWS_423611_NPCL_1",0)
		Beginplot(NPCL3,"LuaWS_423611_NPCL_1",0)
		Beginplot(NPCL4,"LuaWS_423611_NPCL_1",0)
		Beginplot(NPCL7,"LuaWS_423611_NPCL_1",0)
		Beginplot(NPCL6,"LuaWS_423611_NPCL_3",0)
		Beginplot(NPCL5,"LuaWS_423611_NPCL_2",0)
		--感謝偉大的領主！感謝拉法埃爾大人！
		Sleep(50)
		
		Yell(Lafa,"[SC_423611_5]",4)
		--你們將可以踏進格拉夫城堡，為我們偉大的領主奉獻自己。
		Sleep(30)
	
		Yell(NPCL1,"[SC_423611_6]",3)
		Beginplot(NPCL2,"LuaWS_423611_NPCL_4",0)
		Beginplot(NPCL3,"LuaWS_423611_NPCL_4",0)
		Beginplot(NPCL4,"LuaWS_423611_NPCL_4",0)
		Beginplot(NPCL5,"LuaWS_423611_NPCL_4",0)
		Beginplot(NPCL6,"LuaWS_423611_NPCL_4",0)
		Beginplot(NPCL7,"LuaWS_423611_NPCL_4",0)
		--奉獻自己、奉獻自己！
		Sleep(30)
	
		Yell(Lafa,"[SC_423611_7]",4)
		--當然，你們將能享用比現在濃郁百倍以上的神賜之果所製的美食、美酒、和冰鎮後更美味的果汁。
		Sleep(50)
		PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_BUFF_SP02)
		
		Yell(Lafa,"[SC_423611_8]",4)
		--現在，去收拾你們的破爛，再到鎮口集合！
		PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_IDLE2)
		Sleep(30)
		
		Beginplot(NPCL1,"LuaWS_423611_NPCL_5",0)
		Beginplot(NPCL2,"LuaWS_423611_NPCL_5",0)
		Beginplot(NPCL3,"LuaWS_423611_NPCL_5",0)
		Beginplot(NPCL4,"LuaWS_423611_NPCL_5",0)
		Beginplot(NPCL5,"LuaWS_423611_NPCL_5",0)
		Beginplot(NPCL6,"LuaWS_423611_NPCL_5",0)
		Beginplot(NPCL7,"LuaWS_423611_NPCL_5",0)
		Sleep(50)
		
		Yell(Lafa,"[SC_423611_9]",4)
		--咦？這啾啾叫的聲音從哪兒傳來的，是我聽錯了嗎？呵呵呵.....
		Sleep(30)
		Beginplot(Lafa,"LuaWS_423611_Lafa_2",0)
		Sleep(10)
		DW_MoveToFlag(Rose,780742 , 9 ,0 ,1)
		
		--（（（（（（（戲演完了）））））））
		CallPlot( OwnerID(), "ks_QuestEnd", QuestID, FinishFlagID, CheckBuffID, CheckRange, DoScript ) 
		--戲演完了 自動給予旗標(要加入 呼應函式)
		break								
		--在最後面記得加break中斷
	end
end

function LuaWS_423611_Lafa_1()
	DW_MoveToFlag(OwnerID(),780742 , 18 ,0 ,1)
end

function LuaWS_423611_Lafa_2()
	DW_MoveToFlag(OwnerID(),780742 , 8 ,0 ,1)
end

function LuaWS_423611_NPCL()
	local N=ReadRoleValue( OwnerID(), EM_RoleValue_PID )
	local ball=Lua_DW_CreateObj("flag" ,114357, 780742 , 18 )	
	SetModeEx( ball,  EM_SetModeType_Mark, false )
	DW_MoveToFlag(OwnerID(),780742 , 10+N ,0 ,1) 
	Adjustfacedir(OwnerID(),ball,0)
	Sleep(5)
	Delobj(ball)
end

function LuaWS_423611_NPCL_1()
	local N=Range
	NPCSay(OwnerID(),"[SC_423611_4]")
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_APPROVAL)
	Sleep(30)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_APPLAUSE)
	Sleep(40)
end

function LuaWS_423611_NPCL_2()
	NPCSay(OwnerID(),"[SC_423611_4]")
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_DANCE)
	Sleep(30)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_APPROVAL)
	Sleep(40)
end

function LuaWS_423611_NPCL_3()
	Yell(OwnerID(),"[SC_423611_4]",3)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_IDLE2)
	Sleep(40)
end

function LuaWS_423611_NPCL_4()
	NPCSay(OwnerID(),"[SC_423611_6]")
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_APPROVAL)
	Sleep(40)

end

function LuaWS_423611_NPCL_5()
	local N=ReadRoleValue( OwnerID(), EM_RoleValue_PID )
	--LuaFunc_MoveToFlag( OwnerID(), 780742 , N ,0 )  
	DW_MoveToFlag(OwnerID(),780742 , N ,0 ,1) 
	Hide(OwnerID())
	Sleep(5)

end


function LuaWS_423611_break()					--這段戲中斷/結束時要作的事情(需要此函式輔助判斷)(423519要改為自己的任務編號)
	local Lafa = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116540, 500, 0 )--搜尋附近參加的NPC演員
	local Rose = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116867, 500, 0 )

	local NPCL1 = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116541, 1000, 0 )
	local NPCL2 = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116542, 500, 0 )
	local NPCL3 = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116543, 500, 0 )
	local NPCL4 = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116544, 500, 0 )
	local NPCL5 = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116864, 500, 0 )
	local NPCL6 = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116865, 500, 0 )
	local NPCL7 = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116866, 500, 0 )

	--如果存在 則刪除
	if Lafa ~= nil then delobj(Lafa) end							
	if Rose ~= nil then delobj(Rose) end
	if NPCL1 ~= nil then delobj(NPCL1) end
	if NPCL2 ~= nil then delobj(NPCL2) end
	if NPCL3 ~= nil then delobj(NPCL3) end
	if NPCL4 ~= nil then delobj(NPCL4) end
	if NPCL5 ~= nil then delobj(NPCL5) end 
	if NPCL6 ~= nil then delobj(NPCL6) end
	if NPCL7 ~= nil then delobj(NPCL7) end
	
	ks_resetObj( OwnerID(), nil )
end

---------------
function LuaWS_423611_Star_0()
		Setplot(OwnerID(),"range","LuaWS_423611_Star_1",50)	
end

function LuaWS_423611_Star_1()
	Beginplot(TargetID(),"LuaWS_423611_Star_2",0)
end

function LuaWS_423611_Star_2()
	if 	(CheckAcceptQuest(TargetID(),423611)== true ) 		and
	 	(CheckCompleteQuest(TargetID(),423611)==  false)  	and
		CheckFlag(TargetID(),544575)==false					then
			Tell(TargetID() ,OwnerID() ,"[SC_423611_STAR]")	
			--[$playername]，別再往前，小心隱藏自己。
		end
end


--===========================================================================================================================
--任務編號:423612	旗標編號:780742    看戲BUFF:507551		Flag:544576
--===========================================================================================================================

function LuaWS_423612_ACCEPT_0()
--780801旗子
	DisableQuest(OwnerID(), true )
	AddBuff(TargetID(),506114,1,600)
	local Ton= LuaFunc_CreateObjByObj( 117162 , OwnerID() )
	local Mork=Lua_DW_CreateObj("flag" ,117163,780801 ,1)
	local Congus=Lua_DW_CreateObj("flag" ,117164,780801 ,2)

		Hide(Ton)
		Show(Ton,0)
		Hide(Mork)
		Show(Mork,0)
		Hide(Congus)
		Show(Congus,0)
	DisableQuest(Ton, true )
	DisableQuest(Mork, true )
	DisableQuest(Congus, true )
		WriteRoleValue(Ton, EM_RoleValue_IsWalk, 0)
		WriteRoleValue(Mork, EM_RoleValue_IsWalk, 0)
		WriteRoleValue(Congus, EM_RoleValue_IsWalk, 0)
		Sleep(20)
		Adjustfacedir(Ton,TargetID(),0)
		Adjustfacedir(Mork,TargetID(),0)
		Adjustfacedir(Congus,TargetID(),0)
		
		Beginplot(Ton,"LuaWS_423612_ACCEPT_1",0)
		Beginplot(Mork,"LuaWS_423612_ACCEPT_2",0)
		Beginplot(Congus,"LuaWS_423612_ACCEPT_3",0)
		Sleep(80)
		Hide(Ton)
		Hide(Mork)
		Hide(Congus)
		Delobj(Ton)
		
	CancelBuff( TargetID()  , 506114  )	
	DisableQuest(OwnerID(), false )
end

function LuaWS_423612_ACCEPT_1()
--TON
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	Sleep(30)
	DW_MoveToFlag(OwnerID(),780801,4,0,1)
	DW_MoveToFlag(OwnerID(),780801,5,0,1)
end

function LuaWS_423612_ACCEPT_2()
--Mork
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	Sleep(30)
	DW_MoveToFlag(OwnerID(),780801,6,0,1)
	DW_MoveToFlag(OwnerID(),780801,7,0,1)
	DW_MoveToFlag(OwnerID(),780801,8,0,1)
end

function LuaWS_423612_ACCEPT_3()
--Congus
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	Sleep(30)
	DW_MoveToFlag(OwnerID(),780801,9,0,1)
	DW_MoveToFlag(OwnerID(),780801,10,0,1)
	DW_MoveToFlag(OwnerID(),780801,11,0,1)
end

---------------

function LuaWS_423612_116534()
		Setplot(OwnerID(),"range","LuaWS_423612_116534_1",150)	
end

function LuaWS_423612_116534_1()
	Beginplot(TargetID(),"LuaWS_423612_116534_2",0)
end

function LuaWS_423612_116534_2()
	if 	(CheckAcceptQuest(TargetID(),423612)== true ) 		and
	 	(CheckCompleteQuest(TargetID(),423612)==  false)  	and
		CheckBuff( TargetID() , 508185)== true				and
		CheckFlag(TargetID(),544576)==false					then
			ScriptMessage( OwnerID(), TargetID(), 1, "[SC_423612_WORN]", 1 )
			ScriptMessage( OwnerID(), TargetID(), 0, "[SC_423612_WORN]", 1 )
			Sleep(20)
		end
end


----------

function LuaWS_423612_end()
	DisableQuest(OwnerID(), true )
	AddBuff(TargetID(),506114,1,600)
		local 	Mo= Lua_DW_CreateObj("flag" ,116871,780744 ,1)
		DisableQuest(Mo, true )
				Hide(Mo)
				Show(Mo,0)
				WriteRoleValue(Mo, EM_RoleValue_IsWalk, 1)
				DW_MoveToFlag(Mo,780744 , 2 ,0 ,1) 
				Say(Mo,"[SC_423612_END]")
				Sleep(30)
				Delobj(Mo)
	CancelBuff( TargetID()  , 506114 )
	DisableQuest(OwnerID(), false )
end




--===========================================================================================================================
--葛林小鎮佈置lua人
--===========================================================================================================================

function LuaWS_Speak_Cry()
	MoveToFlagEnabled( OwnerID(), false );
	Local Speak={}
	Local Motion
	Speak[0] = ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD -- 1/5 機率做出點頭動作
	Speak[1] = ruFUSION_ACTORSTATE_EMOTE_CRY
	Speak[2] = ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE
	Speak[3] = ruFUSION_ACTORSTATE_EMOTE_CRY
	Speak[4] = ruFUSION_ACTORSTATE_EMOTE_SPEAK

	while 1 do 
		Local i = rand(5)
		Motion = Speak[i]
		PlayMotion( OwnerID(),Motion )
		sleep(200)
	end

	MoveToFlagEnabled( OwnerID(), true );
end


function LuaWS_BigGuy()
	MoveToFlagEnabled( OwnerID(), false );
	Local Speak={}
	Local Motion
	Speak[0] = ruFUSION_ACTORSTATE_EMOTE_LAUGH -- 1/5 機率做出點頭動作
	Speak[1] = ruFUSION_ACTORSTATE_EMOTE_THREATEN
	Speak[2] = ruFUSION_ACTORSTATE_EMOTE_SPEAK
	Speak[3] = ruFUSION_ACTORSTATE_EMOTE_SPEAK
	Speak[4] = ruFUSION_ACTORSTATE_EMOTE_SPEAK

	while 1 do 
		Local i = rand(5)
		Motion = Speak[i]
		PlayMotion( OwnerID(),Motion )
		sleep(200)
	end

	MoveToFlagEnabled( OwnerID(), true );
end


function LuaWS_Crazy01()
	MoveToFlagEnabled( OwnerID(), false );
	Local Speak={}
	Local Motion
	Speak[0] = ruFUSION_ACTORSTATE_EMOTE_LAUGH -- 1/5 機率做出點頭動作
	Speak[1] = ruFUSION_ACTORSTATE_EMOTE_THREATEN
	Speak[2] = ruFUSION_ACTORSTATE_EMOTE_DRINK
	Speak[3] = ruFUSION_ACTORSTATE_EMOTE_DRINK
	Speak[4] = ruFUSION_ACTORSTATE_EMOTE_PLAY_SAXOPHONE
	Speak[5] = ruFUSION_ACTORSTATE_EMOTE_CUTE3
	Speak[6] = ruFUSION_ACTORSTATE_EMOTE_STRETCH
	Speak[7] = ruFUSION_ACTORSTATE_EMOTE_PLAY_GUITAR
	Speak[8] = ruFUSION_ACTORSTATE_EMOTE_DANCE
	Speak[9] = ruFUSION_ACTORSTATE_EMOTE_THREATEN
	Speak[10] = ruFUSION_ACTORSTATE_EMOTE_EAT

	while 1 do 
		Local i = rand(11)
		Motion = Speak[i]
		Local n = rand(11)
		local R=RandRange(50,100)
		local CrazyMove = Speak[n]
		PlayMotion( OwnerID(),Motion )
		sleep(R)
		PlayMotion(OwnerID(),CrazyMove)
		sleep(100)
	end

	MoveToFlagEnabled( OwnerID(), true );
end


function LuaWS_Crazy02()
	MoveToFlagEnabled( OwnerID(), false );
	Local Speak={}
	Local Motion
	Speak[0] = ruFUSION_ACTORSTATE_EMOTE_LAUGH -- 1/5 機率做出點頭動作
	Speak[1] = ruFUSION_ACTORSTATE_EMOTE_THREATEN
	Speak[2] = ruFUSION_ACTORSTATE_EMOTE_DRINK
	Speak[3] = ruFUSION_ACTORSTATE_EMOTE_DRINK
	Speak[4] = ruFUSION_ACTORSTATE_EMOTE_PLAY_SAXOPHONE
	Speak[5] = ruFUSION_ACTORSTATE_EMOTE_CUTE3
	Speak[6] = ruFUSION_ACTORSTATE_EMOTE_STRETCH
	Speak[7] = ruFUSION_ACTORSTATE_EMOTE_PLAY_GUITAR
	Speak[8] = ruFUSION_ACTORSTATE_EMOTE_DANCE
	Speak[9] = ruFUSION_ACTORSTATE_EMOTE_THREATEN
	Speak[10] = ruFUSION_ACTORSTATE_EMOTE_EAT

	
		local i = rand(11)
		Motion = Speak[i]
		local n = rand(11)
		local R=RandRange(50,100)
		local CrazyMove = Speak[n]
		PlayMotion( OwnerID(),Motion )
		sleep(R)
		PlayMotion(OwnerID(),CrazyMove)
		sleep(50)
	

	MoveToFlagEnabled( OwnerID(), true );
end


function LuaWS_Dance_01()
	
	While 1	do
		Local i = rand(6)
		NPCSay( OwnerID() , "[SC_Z19_GREEN"..i.."]" )
		--喲呼！哇哈哈！
		PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_PLAY_SAXOPHONE)
		Sleep(35)
		PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_DANCE)
		Sleep(35)
	end
end

function LuaWS_Dance_02()
	
	While 1	do
		Local i = rand(6)
		NPCSay( OwnerID() , "[SC_Z19_GREEN"..i.."]" )
		--喲呼！哇哈哈！
		PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_PLAY_GUITAR)
		Sleep(35)
		PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_TAPDANCE)
		Sleep(35)
	end
end


function LuaWS_GREENOLD()
		Local i = rand(5)
		NPCSay( OwnerID() , "[SC_Z19_GREENOLD"..i.."]" )
		--喲呼！哇哈哈！
		PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_SPEAK)
		Sleep(40)
end


function LuaWS_GREENman()
		Local i = rand(3)
		NPCSay( OwnerID() , "[SC_Z19_GREENMAN"..i.."]" )
		--喲呼！哇哈哈！
		PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_APPROVAL)
		Sleep(40)
end
	
		

function LuaWS_Speak_Normal()
	MoveToFlagEnabled( OwnerID(), false );
	Local Speak={}
	Local Motion
	Speak[0] = ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD -- 1/5 機率做出點頭動作
	Speak[1] = ruFUSION_ACTORSTATE_EMOTE_SPEAK
	Speak[2] = ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE
	Speak[3] = ruFUSION_ACTORSTATE_EMOTE_SPEAK
	Speak[4] = ruFUSION_ACTORSTATE_EMOTE_SPEAK

	while 1 do 
		Local i = rand(5)
		Local Motion = Speak[i]
		PlayMotion( OwnerID(),Motion )
		sleep(200)
	end

	MoveToFlagEnabled( OwnerID(), true );
end


function LuaP_WS_Sleep() 
	SetDefIdleMotion(OwnerID(),ruFUSION_MIME_DEATH_LOOP)
	While 1 do
		NPCSay(OwnerID(),"Zzzzz.....")
		Sleep(150)
	end
end


--780741