function LuaWS_423612()	--掛在116426摩瑞克的對話劇情
----	if 		CheckAcceptQuest( OwnerID(), 423612 ) == true 				and 	CheckFlag( OwnerID(), 544576 ) == false 	then
----			--■■註■■判斷有任務  沒有旗標  並且該NPC忙碌時
----				SetSpeakDetail( OwnerID(), "[SC_423612_0]" )--噓，鎮民陸續過來了，我們儘量避免交談
-----				AddSpeakOption( OwnerID(), TargetID(), "[SC_423612_1]", "LuaWS_423612_1",0) ------好，我會注意的。
			
	if 	CheckAcceptQuest( OwnerID(), 423612 ) == true 		and  CheckFlag( OwnerID(), 544576 ) == false 			then 
					--■■註■■否則進行第二判斷  有任務 沒有旗標 並該NPC不忙碌時
					SetSpeakDetail( OwnerID(), "[SC_423612_0]" ) 
					AddSpeakOption( OwnerID(), TargetID(), "[SC_423612_1]", "LuaWS_423612_1",0) 
					
	else
			LoadQuestOption( OwnerID() )	
			--■■註■■如果不掛這個，該NPC其他任務將不會被玩家看見
	end
end

--(2)若已有人觸發劇情，該npc可請玩家等候
-----function LuaWS_423612_0()
------	SetSpeakDetail( OwnerID(), "[SC_423612_2]" ) 
	--摩瑞克沒空:似乎還沒到鎮民集合的時候，我們再等等。
-----end

--(3)成功觸發劇情 lua
function LuaWS_423612_1()
	CloseSpeak( OwnerID() )
	--讓NPC變忙碌
-----追加BUFF  508047
	AddBuff(TargetID(), 508047,1,360)
	SetModeEx(TargetID(), EM_SetModeType_ShowRoleHead ,false) -----------秀出頭像框
	SetModeEx(TargetID(), EM_SetModeType_HideName ,true) -----------
	SetModeEx( TargetID(),  EM_SetModeType_Mark, false )
-----	SetModeEx(TargetID(), EM_SetModeType_Show,false) 
	BeginPlot( TargetID(), "LuaWS_423612_2", 0 )
end

--(4)劇情演出lua
function LuaWS_423612_2()
	local KK = Lua_DW_CreateObj("flag" ,116904,780808,1,0 )---種出一個掌控全部的NPC的魔王。
	DisableQuest( OwnerID() ,true )
	DisableQuest( KK ,true )
	Lua_ObjDontTouch( KK )
	AddToPartition( KK, 0 )
	BeginPlot( KK , "LuaS_423612_3" , 0 )
	Callplot( OwnerID(), "LuaS_423612_1_sub",KK)
end
function LuaS_423612_1_sub(KK)
	while true do
		sleep(10)
		if 	CheckID( KK)== false  then
			CancelBuff( OwnerID(),508047)
			SetModeEx(TargetID(), EM_SetModeType_ShowRoleHead ,true) -----------秀出頭像框
			SetModeEx(TargetID(), EM_SetModeType_HideName ,false) -----------
			SetModeEx( TargetID(),  EM_SetModeType_Mark, true )
--------------					SetModeEx(OwnerID(),EM_SetModeType_Show,true) 
					DisableQuest( OwnerID(),false  )
			break
		end
	end
end
--104946伊崔妮
--104944湯尼
--104947摩瑞克
--104943康葛斯
--104942艾可
--116874~116880葛林鎮民(共7隻)
--104954拉法埃爾(劇情怪
function LuaS_423612_3()
	local player  = {}
	player= SearchRangePlayer(OwnerID(), 350)

	for H=0,table.getn(Player)-1 do
		if 	(CheckAcceptQuest( player[H] , 423612 ) == true ) and CheckFlag( player[H],544576)==false   then
				AddBuff(player[H] ,508185,1,60)
	
		end
	end

	local LAF = Lua_DW_CreateObj("flag" ,104864 ,780808,2,1 )
	SetRoleCamp( LAF , "Visitor" )
	local ENT = Lua_DW_CreateObj("flag" ,104946,780808,3,1 )
	SetRoleCamp( ENT , "Visitor" )
	local TONY= Lua_DW_CreateObj("flag" ,104944,780808,4,0 )
	local MORK= Lua_DW_CreateObj("flag" ,104863,780808,5,1 )
	local STAR= Lua_DW_CreateObj("flag" ,104942,780808,14,0)
	local MEN1= Lua_DW_CreateObj("flag" ,116874,780808,7,1 )
	local MEN2 = Lua_DW_CreateObj("flag" ,116875,780808,8,1 )
	local MEN3= Lua_DW_CreateObj("flag" ,116876,780808,9,1 )
	local MEN4 = Lua_DW_CreateObj("flag" ,116877,780808,10,1 )	
	local MEN5= Lua_DW_CreateObj("flag" ,116878,780808,11,1 )
	local MEN6 = Lua_DW_CreateObj("flag" ,116879,780808,12,1 )		
	local MEN7= Lua_DW_CreateObj("flag" ,116880,780808,13,1 )
	local CS= Lua_DW_CreateObj("flag" ,104943,780808,6,0 )
	SetPlot( STAR,"touch","",0)
	SetPlot( CS,"touch","",0)
	SetPlot( MORK,"touch","",0)
	SetPlot( TONY,"touch","",0)
	SetPlot( ENT,"touch","",0)
	DisableQuest( MEN1 ,true )
	DisableQuest( MEN2 ,true )
	DisableQuest( MEN3 ,true )
	DisableQuest( MEN4 ,true )
	DisableQuest( MEN5 ,true )
	DisableQuest( MEN6 ,true )
	DisableQuest( MEN7 ,true )
	MoveToFlagEnabled( MORK , false )
MoveToFlagEnabled( STAR , false )
MoveToFlagEnabled( CS , false )
MoveToFlagEnabled( TONY , false )
	Callplot( OwnerID(), "LuaS_423612_6",STAR,CS,TONY,ENT,MORK,LAF,MEN1,MEN2,MEN3,MEN4,MEN5,MEN6,MEN7)
	sleep(20)
	BeginPlot( LAF , "LuaS_423612_people" , 0 )
	Yell(LAF,"[SC_423612_3]",4)
	BeginPlot( ENT , "LuaS_423612_people17" , 0 )
	BeginPlot( MEN1 , "LuaS_423612_people18" , 0 )
	BeginPlot( MEN2 , "LuaS_423612_people19" , 0 )
	BeginPlot( MEN3 , "LuaS_423612_people20" , 0 )
	BeginPlot( MEN4 , "LuaS_423612_people21" , 0 )
	BeginPlot( MEN5 , "LuaS_423612_people23" , 0 )
	BeginPlot( MEN6 , "LuaS_423612_people24" , 0 )
	BeginPlot( MEN7 , "LuaS_423612_people25" , 0 )
	sleep(40)
	Yell(MEN1,"[SC_423612_4]",4)
	NPCSay(MEN2,"[SC_423612_4]")
	NPCSay(MEN3,"[SC_423612_4]")
	NPCSay(MEN4,"[SC_423612_4]")
	NPCSay(MEN5,"[SC_423612_4]")
	NPCSay(MEN6,"[SC_423612_4]")
	NPCSay(MEN7,"[SC_423612_4]")
	sleep(40)	
	BeginPlot( LAF , "LuaS_423612_people1" , 0 )
	BeginPlot( ENT , "LuaS_423612_people31" , 0 )----SC_423612_4
	sleep(30)
	BeginPlot( MEN1 , "LuaS_423612_people11" , 0 )
	BeginPlot( MEN2 , "LuaS_423612_people11" , 0 )
	BeginPlot( MEN3 , "LuaS_423612_people12" , 0 )
	BeginPlot( MEN4 , "LuaS_423612_people13" , 0 )
	BeginPlot( MEN5 , "LuaS_423612_people14" , 0 )
	BeginPlot( MEN6 , "LuaS_423612_people15" , 0 )
	BeginPlot( MEN7 , "LuaS_423612_people16" , 0 )
	Yell(MEN1,"[SC_423612_5]",4)
	NPCSay(MEN2,"[SC_423612_5]")
	NPCSay(MEN3,"[SC_423612_5]")
	NPCSay(MEN4,"[SC_423612_5]")
	NPCSay(MEN5,"[SC_423612_5]")
	NPCSay(MEN6,"[SC_423612_5]")
	NPCSay(MEN7,"[SC_423612_5]")
	sleep(30)-------SC_423612_16
	Yell(LAF,"[SC_423612_16]",4)
	sleep(50)
	BeginPlot( MEN1 , "LuaS_423612_people2A" , 0 )
	BeginPlot( MEN2 , "LuaS_423612_people2" , 0 )
	BeginPlot( MEN3 , "LuaS_423612_people2" , 0 )
	BeginPlot( MEN4 , "LuaS_423612_people2" , 0 )
	BeginPlot( MEN5 , "LuaS_423612_people2" , 0 )
	BeginPlot( MEN6 , "LuaS_423612_people2" , 0 )
	BeginPlot( MEN7 , "LuaS_423612_people2" , 0 )
	sleep(80)
	Yell(LAF,"[SC_423612_8]",4)
	sleep(50)
	Yell(LAF,"[SC_423612_9]",4)
	sleep(40)
	Yell(MORK,"[SC_423612_10]",4)
	CallPlot( mork , "LuaS_423612_mork" , LAF )
	AddToPartition(CS, 0 )
	AddToPartition(STAR, 0 )
	AddToPartition(TONY, 0 )
	for H=0,table.getn(Player)-1 do
		if (CheckAcceptQuest( player[H] , 423612 ) == true ) and CheckFlag( player[H],544576)==flase  then
				ScriptMessage(player[H], player[H],  1 , "[SC_423612_HELP]" , 0 ) --超出時間，劇情中斷。
				ScriptMessage( player[H], player[H], 0 , "[SC_423612_HELP]"  , 0 )		
			
		end
	end
	sleep(40)	
	SetRoleCamp( LAF , "Monster"  )
	SetPlot( LAF , "dead" , "LuaS_423612_LAF" , 0 )
	SetPlot( MORK , "dead" , "LuaS_423612_LAF" , 0 )
	SetPlot( CS , "dead" , "LuaS_423612_LOVE" , 0 )
	SetPlot( STAR , "dead" , "LuaS_423612_LOVE" , 0 )
	SetPlot( MORK , "dead" , "LuaS_423612_LOVE" , 0 )
	SetPlot( TONY , "dead" , "LuaS_423612_LOVE" , 0 )
	SetAttack(MORK,LAF)
	SetAttack(CS,LAF)	
	SetAttack(STAR,LAF)	
	SetAttack(TONY,LAF)
	local Num = 0
	for i=1, 180, 1 do
		EE = ReadRoleValue(LAF,EM_RoleValue_HP)
		TT =ReadRoleValue(LAF,EM_RoleValue_MaxHP)
		for K=0,table.getn(player)-1 do
			if	CheckAcceptQuest( player[K], 423612 ) == true	and   CheckFlag( player[K],544576) == false	then
				Num = Num + 1
			end
		end
		if	Num == 0  then
			break
		end
		if EE/TT <0.7 then
			break
		end
		if 	   i==180  then
			for M=0,table.getn(player)-1 do
				if	CheckAcceptQuest( player[M], 423612 == true	and  CheckFlag( player[M], 544576) )== false	then
					ScriptMessage(player[M], player[M],  1 , "[SC_423353_6]" , 0 ) --超出時間，劇情中斷。
					ScriptMessage( player[M], player[M], 0 , "[SC_423353_6]" , 0 )
				end
			end
			DW_CheckThenDel(MEN1)
			DW_CheckThenDel(MEN2)
			DW_CheckThenDel(MEN3)
			DW_CheckThenDel(MEN4)
			DW_CheckThenDel(MEN5)
			DW_CheckThenDel(MEN6)
			DW_CheckThenDel(STAR)
			DW_CheckThenDel(CS)
			DW_CheckThenDel(MEN7)
			DW_CheckThenDel(MORK)
			DW_CheckThenDel(LAF)
			DW_CheckThenDel(TONY)
			DW_CheckThenDel(ENT)			
			delobj( OwnerID())
			break
		end	
		sleep(10)
	end	
	for H=0,table.getn(Player)-1 do
		if	 (CheckAcceptQuest( player[H] , 423612 ) == true ) and  CheckBuff(  player[H]  ,508185 )==true    then
			CancelBuff(  player[H]  ,508185 )
		end
	end
	BeginPlot( LAF ,  "LuaS_423612_LAF" , 0)	
	sleep(40)
	SetStopAttack( LAF )
	SetStopAttack( TONY )
	SetStopAttack( MORK)
	SetStopAttack( STAR )	
	SetStopAttack( CS )
	SetRoleCamp( LAF , "Visitor" )
	SetRoleCamp( TONY , "Visitor" )
	SetRoleCamp( MORK, "Visitor" )
	SetRoleCamp( STAR , "Visitor" )
	SetRoleCamp( CS , "Visitor" )
	Yell(LAF,"[SC_423612_11]",4)
	sleep(50)
	Yell(LAF,"[SC_423612_12]",4)
----伊崔妮做動作
	CastSpell( ENT, TONY,495235)	
	FaceObj( ENT, TONY) 
	FaceObj(  TONY,ENT) 
--------	BeginPlot( ENT , "LuaS_423612_ENT" , 0 )
----湯尼做動作倒地 死亡動作
	sleep(20)
	SetDefIdleMotion(TONY,ruFUSION_MIME_DEATH_LOOP)
	Yell(LAF,"[SC_423612_15]",4)
----做動作消失
	CastSpell( LAF , LAF ,491276)
	sleep(20)
	for H=0,table.getn(Player)-1 do
		if 	(CheckAcceptQuest( player[H] , 423612 ) == true ) and CheckFlag( player[H],544576)==false   then
			ScriptMessage(player[H], player[H],  1 , "[SC_423612_19]" , 0 ) 
			ScriptMessage( player[H], player[H], 0 , "[SC_423612_19]" , 0 )
	
		end
	end
	local Num = 0
	for MH=1, 1, 1 do
		Num = 0
		for K=0,table.getn(player)-1 do
			if	CheckAcceptQuest( player[K], 423612 ) == true	and CheckFlag( player[K],544576)==true   	then
						Num = Num + 1
			end
		end
		if	Num == 0  then
				DW_CheckThenDel(MON1)
				DW_CheckThenDel(MON2)
				DW_CheckThenDel(MON3)
				DW_CheckThenDel(MON4)
				DW_CheckThenDel(MON5)
				DW_CheckThenDel(LB)
				DW_CheckThenDel(STAR)
				DW_CheckThenDel(CS)
				DW_CheckThenDel(GILL)
				DW_CheckThenDel(MORK)
				DW_CheckThenDel(ANY)
				DW_CheckThenDel(LAF)
				DW_CheckThenDel(TONY)
				DW_CheckThenDel(ENT)			
				delobj( OwnerID())
		end
		sleep(10)
	end
	DW_CheckThenDel(LAF)
	DW_CheckThenDel(ENT)	
	sleep(40)
	Callplot( MORK , "LuaS_423612_ALL" , TONY )
	Callplot( STAR , "LuaS_423612_ALL" , TONY )
	Callplot( CS , "LuaS_423612_ALL" , TONY )
	Yell(MORK,"[SC_423612_17]",4)-----湯尼不像受傷，但卻昏迷不醒......我們不宜在這裡久留。
	sleep(30)	
	Yell(MORK,"[SC_423612_18]",4)
	Sleep(30)
	for H=0,table.getn(Player)-1 do
		if 	(CheckAcceptQuest( player[H] , 423612 ) == true ) and CheckFlag( player[H],544576)==true   then
			Setposbyflag(player[H]  , 780808, 25 ) 
		end
	end
	DW_CheckThenDel(TONY)
	DW_CheckThenDel(MORK)	
	DW_CheckThenDel(CS)
	DW_CheckThenDel(ENT)	
	DW_CheckThenDel(STAR)
	DW_CheckThenDel(OwnerID())	
end
	
function LuaS_423612_LAF()
	local TempID
	local LL =ReadRoleValue(OwnerID(), EM_RoleValue_MaxHP)
	local FF = ReadRoleValue(OwnerID(), EM_RoleValue_HP)
	for	i=0 , HateListCount(OwnerID())-1 DO
		TempID = HateListInfo(OwnerID(),i , EM_HateListInfoType_GItemID )----
		if	CheckAcceptQuest( TempID , 423612)==true  	then
			SetFlag(TempID  ,544576, 1 )
		end
	end
	WriteRoleValue(OwnerID(), FF, LL)
	return false
end
function  LuaS_423612_6(STAR,CS,TONY,ENT,MORK,LAF,MEN1,MEN2,MEN3,MEN4,MEN5,MEN6,MEN7)
	local Group = {}
	local Num = 0
	Group = SearchRangePlayer(OwnerID(), 350)
	for i=1, 180, 1 do
		Num = 0
		for K=0,table.getn(Group)-1 do
			if	CheckAcceptQuest( Group[K], 423612 ) == true	and   GetDistance( Group[K] , OwnerID() ) < 400  	then
					Num = Num + 1
			end
			if	CheckAcceptQuest( Group[K], 423612 ) == false and  CheckBuff(  Group[K] ,508185 )==true      then
			CancelBuff(  Group[K]   ,508185 )
			end
		end
		if	Num == 0  then
			DW_CheckThenDel(MEN1)
			DW_CheckThenDel(MEN2)
			DW_CheckThenDel(MEN3)
			DW_CheckThenDel(MEN4)
			DW_CheckThenDel(MEN5)
			DW_CheckThenDel(MEN6)
			DW_CheckThenDel(STAR)
			DW_CheckThenDel(CS)
			DW_CheckThenDel(MEN7)
			DW_CheckThenDel(MORK)
			DW_CheckThenDel(LAF)
			DW_CheckThenDel(TONY)
			DW_CheckThenDel(ENT)			
			delobj( OwnerID())
		end
	sleep(10)
	end
end

function LuaS_423612_people1()
	DW_MoveToFlag( OwnerID(),780808, 15,1)
end
function LuaS_423612_people11()
	DW_MoveToFlag( OwnerID(),780808, 40,1)
end
function LuaS_423612_people12()
	DW_MoveToFlag( OwnerID(),780808, 23,1)
end
function LuaS_423612_people13()
	DW_MoveToFlag( OwnerID(),780808, 24,1)
end
function LuaS_423612_people14()
	DW_MoveToFlag( OwnerID(),780808, 29,1)
end
function LuaS_423612_people15()
	DW_MoveToFlag( OwnerID(),780808, 26,1)
end
function LuaS_423612_people16()
	DW_MoveToFlag( OwnerID(),780808, 27,1)
end
function LuaS_423612_people18()
	DW_MoveToFlag( OwnerID(),780808, 28,1)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_APPROVAL)
	Sleep(30)
end
function LuaS_423612_people19()
	DW_MoveToFlag( OwnerID(),780808, 35,1)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_APPROVAL)
	Sleep(30)
end
function LuaS_423612_people20()
	DW_MoveToFlag( OwnerID(),780808, 30,1)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_APPROVAL)
	Sleep(30)
end
function LuaS_423612_people21()
	DW_MoveToFlag( OwnerID(),780808, 31,1)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_APPROVAL)
	Sleep(30)
end
function LuaS_423612_people22()
	DW_MoveToFlag( OwnerID(),780808, 32,1)
end
function LuaS_423612_people23()
	DW_MoveToFlag( OwnerID(),780808, 33,1)
end
function LuaS_423612_people24()
	DW_MoveToFlag( OwnerID(),780808, 34,1)
end
function LuaS_423612_people25()
	DW_MoveToFlag( OwnerID(),780808, 38,1)
end
function LuaS_423612_people31()
	DW_MoveToFlag( OwnerID(),780808, 36,1)
end
function LuaS_423612_people2()
	NPCSay(OwnerID(),"[SC_423612_6]")
	sleep(50)
	NPCSay(OwnerID(),"[SC_423612_7]")
	move(OwnerID(),-7762.2+rand(100) , 587.6 , 44073.2+rand(100)  )
	sleep(40)
----	DW_MoveToFlag( OwnerID(),780808, 16,1)
	DW_CheckThenDel(OwnerID())
end

function LuaS_423612_people2A()
	Yell(OwnerID(),"[SC_423612_6]",4)
	sleep(50)
	Yell(OwnerID(),"[SC_423612_7]",4)
	move(OwnerID(),-7762.2+rand(100) , 587.6 , 44073.2+rand(100)  )
---	DW_MoveToFlag( OwnerID(),780808, 16,1)
	DW_CheckThenDel(OwnerID())
end

function LuaS_423612_mork( LAF )
	local OID = OwnerID()
	local FlagID = 780808
	local Site = 22
	WriteRoleValue(OID, EM_RoleValue_IsWalk, 0 )
	while true do
		AddBuff( OID, 506984, 0, -1 )
		KS_Move( OID, 0, FlagID, site )
		if KS_InCombat(OID) == true then
			SysCastSpellLv( LAF, OID, 495767, 0 )--作物袋挑釁
			CancelBuff(OID,506984 )		
			return
		end
		sleep(10)
	end
end

function LuaS_423612_people()
	DW_MoveToFlag( OwnerID(),780808, 17,1)
end

function LuaS_423612_people17()
	DW_MoveToFlag( OwnerID(),780808, 37,1)
end

function LuaS_423612_ENT()
	DW_MoveToFlag( OwnerID(),780808, 18,1)
end

function LuaS_423612_ALL(TONY)
	faceobj( OwnerID(),TONY)
end
function LuaS_423612_LOVE()
	local LL =ReadRoleValue(OwnerID(), EM_RoleValue_MaxHP)
	local FF = ReadRoleValue(OwnerID(), EM_RoleValue_HP)
	WriteRoleValue(OwnerID() , FF , LL)
	return false
end