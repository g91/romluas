--423465	旗子780550
function LuaS_423465_0()--(點擊普利，演戲)
	LoadQuestOption( OwnerID() )
	if	(CheckAcceptQuest(OwnerID(),423465)==true )and( CheckCompleteQuest( OwnerID(),423465)==false) and	CheckFlag( OwnerID() , 544331) ==false	then
		if 	(ReadRoleValue( TargetID() , EM_RoleValue_Register+1 ) == 0)	then
				AddSpeakOption(OwnerID(),TargetID(),"[SC_423465_0]","LuaS_423465_1",0)	--為什麼這麼說？
				else
				AddSpeakOption(OwnerID(),TargetID(),"[SC_423465_0]","LuaS_423465_2",0)	--為什麼這麼說？
		end
	end
end

function LuaS_423465_2()
	SetSpeakDetail(OwnerID(),"[SC_423465_1]")	--普利：你只是個外族人，涉入太深對你沒有好處。（普利莫斯．怒牙低頭不語，拒絕再跟你談話。）   
end

function LuaS_423465_1()
	closespeak(OwnerID())
	if 	(ReadRoleValue( TargetID() , EM_RoleValue_Register+1 ) == 0)	then
		WriteRoleValue ( TargetID() , EM_RoleValue_Register+1,1 )
		BeginPlot(TargetID(), "LuaS_423465_3" , 0 )
	end
end


function LuaWS_423465_accept()
	if 	CheckBuff( TargetID() , 507470 )== true 	then
		CancelBuff( TargetID(), 507470)
	end
end
		

function LuaS_423465_3()
	if 	CheckAcceptQuest( TargetID() , 423465) == true		and
		GetDistance(TargetID(), OwnerID() ) < 250		and 
		ReadRoleValue(TargetID() ,EM_RoleValue_IsDead) == 0	then
		SetFlag(TargetID() , 544333, 1 )				--544333判斷距離用		
		AddBuff(TargetID() , 507470 , 1 , 180 )  			--BUFF編號507470				
	end
	local PU = LuaFunc_CreateObjByOBj(116173, OwnerID() )			--116173演戲用普利
	DisableQuest( PU , true )						--開關NPC頭上的任務提示以及對話劇情(true關閉)
	MoveToFlagEnabled(PU , false )
	WriteRoleValue( PU ,EM_RoleValue_IsWalk , 1 )
	WriteRoleValue( PU,EM_RoleValue_Register+2,TargetID())			--把玩家寫進普利
	WriteRoleValue( PU,EM_RoleValue_Register+3,OwnerID())			--把原普利寫進演戲普利
	BeginPlot(PU, "LuaS_423465_Range_CHECK" , 0 )			--距離檢查！！
	BeginPlot(PU, "LuaS_423465_4" , 0 )
end

function LuaS_423465_4()
--OwnerID是PU 
	local player = ReadRoleValue(OwnerID(),EM_RoleValue_Register+2)	
	local QPU  = ReadRoleValue(OwnerID(),EM_RoleValue_Register+3)
	local WW = Lua_DW_CreateObj("flag" ,116172,780550,1,1)			--116172烏托卡、旗子編號780550、1
	DisableQuest(  WW , true )							--開關NPC頭上的任務提示以及對話劇情(true關閉)
	MoveToFlagEnabled( WW , false )
	WriteRoleValue(  WW ,EM_RoleValue_IsWalk , 1 )
	WriteRoleValue(WW,EM_RoleValue_Register+3,OwnerID())			--把演戲普利寫進演戲烏托卡
	BeginPlot(WW , "LuaS_423465_MO_CHECK" , 0 )				
	
	
	local LILI = Lua_DW_CreateObj("flag" ,116140,780550,2,1)			--116140利爪、旗子編號780550、2
	DisableQuest(  LILI , true )						--開關NPC頭上的任務提示以及對話劇情(true關閉)
	MoveToFlagEnabled( LILI , false )
	
	WriteRoleValue(  LILI ,EM_RoleValue_IsWalk , 1 )
	WriteRoleValue(LILI,EM_RoleValue_Register+3,OwnerID())			--把演戲普利寫進演戲利爪
	BeginPlot(LILI , "LuaS_423465_MO_CHECK" , 0 )	
	BeginPlot(LILI , "LuaS_423465_LILI_walk" , 0 )	

		local NPCDOG = {}
		for i=1,4,1 do
		NPCDOG[i] = CreateObjByFlag( 116142, 780722 , i , 0 )		--4隻利爪的護衛
		DisableQuest(NPCDOG[i] , true )
		AddToPartition( NPCDOG[i] , 0 )
		WriteRoleValue(NPCDOG[i],EM_RoleValue_Register+3,OwnerID())
		MoveToFlagEnabled( NPCDOG[i] , false )
		WriteRoleValue( NPCDOG[i] , EM_RoleValue_PID , i+4 )
		WriteRoleValue( NPCDOG[i] , EM_RoleValue_Register , 0 )
		beginplot( NPCDOG[i] , "LuaS_423465_DOG" , 0 )
		BeginPlot(NPCDOG[i] , "LuaS_423465_MO_CHECK" , 0 )
		end
	sleep(10)

	PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( OwnerID() , "[SC_423465_2]" , 3 )					--普利：明哲保身的道理你竟然不懂嗎？	
	sleep(20)
	
	Yell( OwnerID() , "[SC_423465_3]" , 3 )					--普利：過去那個霸道的英雄領主也總是執著在艱難的事啊...
	sleep(30)
	Yell( OwnerID() , "[SC_423465_4]" , 3 )					--普利：...來了，是利爪...小傢伙，跪下！
	PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_CROUCH_BEGIN)
	sleep(20)
	Yell( WW , "[SC_423465_5]" , 3 )						--普利：哼！我才不跪，你是軟弱可恥的萊慕恩人！
	sleep(20)
	Yell( OwnerID() , "[SC_423465_6]" , 3 )					--普利：跪下！烏托卡.怒牙！
	sleep(10)
	AdjustFaceDir(LILI, OwnerID(), 0 )
	PlayMotion( LILI ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell(  LILI , "[SC_423465_8]" , 3 )						--利爪：哦？原來是卑微的怒牙啊～還有一個...外族人。
	sleep(20)
	AdjustFaceDir(LILI, WW, 0 )
	sleep(10)
	Yell(  LILI , "[SC_423465_9]" , 3 )						--利爪：嗯？見到高貴的利爪怎麼能不跪拜？
	PlayMotion(LILI,ruFUSION_ACTORSTATE_EMOTE_POINT)
	sleep(20)
	LuaFunc_MoveToFlag(NPCDOG[1], 780550,6,0)					--(護衛走向前)
	--SetModeEx(NPCDOG[1], EM_SetModeType_Move,false) 
	--StopMove(NPCDOG[1],false)  
	sleep(5)
	AdjustFaceDir(NPCDOG[1],  WW, 0 )
	sleep(10)
	Yell(  OwnerID() , "[SC_423465_10]" , 3 )					--普利：別動他！
	--SetModeEx(NPCDOG[1], EM_SetModeType_Move,true)
	sleep(20)
	PlayMotion( LILI ,ruFUSION_ACTORSTATE_EMOTE_LAUGH)
	Yell(  LILI , "[SC_423465_11]" , 3 )						--利爪：哈～你這是在制止我嗎？低賤的怒牙！
	LuaFunc_MoveToFlag(NPCDOG[1], 780550,7,0)					--(護衛走向普利，攻擊他)
	AdjustFaceDir(NPCDOG[1],  OwnerID(), 0 )
	PlayMotion( NPCDOG[1],ruFUSION_ACTORSTATE_ATTACK_1H)
	PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_CROUCH_END)
	sleep(10)
	PlayMotion( NPCDOG[1],ruFUSION_ACTORSTATE_ATTACK_2H)
	PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_DEAD)			--(普利倒地)
	sleep(20)
	Yell(  WW , "[SC_423465_12]" , 3 )						--烏托卡：爸爸！
	AdjustFaceDir(  WW, LILI, 0 )
	sleep(10)
	PlayMotion(  WW,ruFUSION_ACTORSTATE_EMOTE_ANGRY)			--(烏托轉向利爪想反擊)
	sleep(20)
	Yell(  OwnerID() , "[SC_423465_13]" , 3 )					--普利：小傢伙...別...咳咳...
	sleep(20)
	PlayMotion( LILI ,ruFUSION_ACTORSTATE_EMOTE_LAUGH)
	Yell(  LILI , "[SC_423465_14]" , 3 )						--利爪：自不量力啊～像你們這種低賤的階層，就適合去贊卡面前送死！
	sleep(30)
	Yell(  LILI , "[SC_423465_15]" , 3 )						--利爪：走！
	
	for i = 1, 4 , 1 do
		WriteRoleValue( NPCDOG[i] , EM_RoleValue_Register , 1 )
		Beginplot( NPCDOG[i] , "LuaS_423465_DOG" , 0 )
	end
	WriteRoleValue( LILI , EM_RoleValue_Register , 1 )
	Beginplot( LILI ,"LuaS_423465_LILI_walk" , 0 )
	Yell(  OwnerID() , "[SC_423465_16]" , 3 )						--普利：咳咳...咳...
	sleep(20)
	AdjustFaceDir(  WW, OwnerID(), 0 )
	Yell(  WW , "[SC_423465_17]" , 3 )							--烏托卡：爸爸...爸爸...
	sleep(20)
	BeginPlot( OwnerID() , "LuaS_423465_Finish" , 0 )	
	sleep(30)
	writerolevalue(QPU, EM_RoleValue_Register+1, 0 )
	Delobj( OwnerID() )
	CancelBuff(player  , 507470)
end	
	

function LuaS_423465_Range_CHECK()
	local QPU = ReadRoleValue(OwnerID(),EM_RoleValue_Register+3)	
	local play  = ReadRoleValue(OwnerID(),EM_RoleValue_Register+2)	
	local Num
	for i = 0 , 120 , 1 do
		Num = 0
			if	CheckAcceptQuest( play, 423465) == true	and
				CheckFlag( play , 544333) == true		then
				Num = Num + 1
			end
		if	Num == 0		then
			break
		end
		sleep(20)
	end
	writerolevalue(QPU, EM_RoleValue_Register+1, 0 )
	Delobj( OwnerID() )
end

function LuaS_423465_Player_CHECK()
	if	(CheckAcceptQuest(OwnerID(),423365)==false )	then
		if 	CheckBuff( OwnerID(), 507470) == true	then
			CancelBuff( OwnerID() , 507470)  
		end
		return false
	end
	local PU= {}
	PU= SearchRangeNPC(OwnerID() , 250)
	for i=0,table.getn(PU)-1 do
		if	ReadRoleValue(PU[i] , EM_RoleValue_OrgID) == 116173	then
			return false
		end
		if	i == table.getn(PU)	then
			return true
		end
	end
end

function LuaS_423465_Player_CHECK_FINAL()
	CancelBuff( OwnerID() , 507470)
	ScriptMessage(OwnerID() , OwnerID() , 2 , "[SC_423177_10]" , 0 )	--距離太遠，任務失敗！
	ScriptMessage( OwnerID() , OwnerID(), 0 , "[SC_423177_10]" , 0 )
	SetFlag(OwnerID() , 544333, 0 )
end

function LuaS_423465_Finish()
	local play = ReadRoleValue(OwnerID(),EM_RoleValue_Register+2)
	if	CheckAcceptQuest( play , 423465) == true	and
		CheckFlag( play  , 544333) == true		then
		SetFlag(play  , 544331, 1 )
		CancelBuff( play  , 507470)
		SetFlag(play  , 544333, 0 )
	end
end

function LuaS_423465_MO_CHECK()	
	local PU = ReadRoleValue(OwnerID(),EM_RoleValue_Register+3)		--演戲普利
	for i = 0 , 120 , 1 do
		if	CheckID(PU) == false	then
			break
		end
		sleep( 20 )
	end
	Delobj( OwnerID() )
end

function LuaS_423465_LILI_walk()	
	if	ReadRoleValue( OwnerID() , EM_RoleValue_Register ) ~= 1 then
		LuaFunc_MoveToFlag(OwnerID(), 780550,3,0)
		Yell( OwnerID() ,  "[SC_423465_7]" , 3 )								--利爪：哼哼～我來瞧瞧是誰聚集在這裡。
		sleep(10)
		LuaFunc_MoveToFlag(OwnerID(), 780550,4,0)
	end
	if	ReadRoleValue( OwnerID() , EM_RoleValue_Register ) == 1 then
		LuaFunc_MoveToFlag(OwnerID(), 780550,5,0)								--(利爪囂張離去)
	end	
end

function LuaS_423465_DOG()
	local Flag
	if ReadRoleValue( OwnerID() , EM_RoleValue_Register ) == 0 then
		Flag = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	else
		Flag = ReadRoleValue( OwnerID() , EM_RoleValue_PID ) +4
	end
	LuaFunc_MoveToFlag(OwnerID(), 780722 , Flag,  0 )
	if ReadRoleValue( OwnerID() , EM_RoleValue_Register ) ~= 0 then
		DelObj( OwnerID() )
	end
end

--423466
function LuaS_116138_dead()	--倒地的萊慕初始劇情
	LuaP_DW_Dead() 
end

function LuaS_116139_cry()		--哭泣的烏托卡
	While 1  do 
		PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_CRY)
		sleep(30+Rand(30))
	end
end


function LuaS_423466_0()	--放到普利的function內
	LoadQuestOption( OwnerID() )
	if	(CheckAcceptQuest(OwnerID(),423466)==true )	and	( CheckCompleteQuest( OwnerID(),423466)==false)	and	
		CheckFlag( OwnerID() , 544332 ) ==false		then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422541_0]","LuaS_423466_1",0)		--你說吧...我在聽。(舊有的字串)
	end
end

function LuaS_423466_1()
	SetSpeakDetail(OwnerID(),"[SC_423466_1]")
	SetFlag( OwnerID() , 544332 , 1 )	
end

--完成任務後執行
function LuaS_423466_0_after()
	say(OwnerID(),"[SC_423466_2]")--不要哭...躲好...
end

--423467 點擊利爪的戰利品後，種出5之NPC，判斷NPC死給旗標	780720	1-4
function LuaS_423467_0()
	LoadQuestOption( OwnerID() )
	if	(CheckAcceptQuest(OwnerID(),423467)==true )and( CheckCompleteQuest( OwnerID(),423467)==false)	then
		if	CountBodyItem(OwnerID(),208096) < 1 	then
			if	(ReadRoleValue( TargetID() , EM_RoleValue_Register+1 ) == 0)		then
				return true
				else
				ScriptMessage(OwnerID(),OwnerID(), 1, "[SAY_NPC_BUSY]",0)			--目標正在忙碌中
				return false
			end
		end
		if	CountBodyItem(OwnerID(),208096) > 0	then
			ScriptMessage(OwnerID(),OwnerID(), 2, "[SC_423467_2]",0)			
			return false
		end
	end
end

function LuaS_423467_1()
	WriteRoleValue( TargetID() , EM_RoleValue_Register+1 , 2 )
	BeginPlot( TargetID(), "LuaS_423467_LOOP" , 0 )
end

function LuaS_423467_LOOP()
	local ADOG= Lua_DW_CreateObj("flag" ,103127,780719,1,1)	
	SetRoleCamp(  ADOG , "Visitor" )
	AddToPartition(  ADOG, 0 )
	WriteRoleValue( ADOG,EM_RoleValue_Register+2,OwnerID())			--把寶箱寫進利爪
	--BeginPlot(OwnerID(), "LuaS_423467_3" , 0 )      **********************************************************?????????????????????????????
	BeginPlot(ADOG  , "LuaS_Discowood_CheckPeace" , 0 )	--檢查有沒有進入戰鬥  在判斷消不消失
	SetPlot(ADOG,"dead","LuaS_423467_2",0 )
	
	local NPCDOG = {}
		for i=1,4,1 do
		NPCDOG[i] = CreateObjByFlag( 103128, 780720 , i , 0 )			--4隻利爪的護衛
		SetRoleCamp(  NPCDOG[i] , "Visitor" )
		AddToPartition( NPCDOG[i] , 0 )
	end
	
	
	PlayMotion( ADOG,ruFUSION_ACTORSTATE_EMOTE_ANGRY)	
	say(ADOG,"[SC_423467_0]")						--這不是之前在卑賤怒牙身邊的外族人嗎？
	sleep(20)
	say(ADOG,"[SC_423467_1]")						--想造反？
	sleep(10)
	DW_MoveToFlag( ADOG , 780719 , 2, 0 )

	SetRoleCamp(  NPCDOG[1] , "Monster" )
	SetRoleCamp(  NPCDOG[2] , "Monster" )
	SetRoleCamp(  NPCDOG[3] , "Monster" )
	SetRoleCamp(  NPCDOG[4] , "Monster" )
	SetAttack(NPCDOG[1] , TargetID() )
	SetAttack(NPCDOG[2] , TargetID() )
	SetAttack(NPCDOG[3] , TargetID() )
	SetAttack(NPCDOG[4] , TargetID() )

	SetRoleCamp(  ADOG , "Monster" )
	SetAttack(ADOG , TargetID() )
	
	BeginPlot(NPCDOG[1]  , "LuaS_Discowood_CheckPeace" , 0 )
	BeginPlot(NPCDOG[2]  , "LuaS_Discowood_CheckPeace" , 0 )
	BeginPlot(NPCDOG[3]  , "LuaS_Discowood_CheckPeace" , 0 )
	BeginPlot(NPCDOG[4]  , "LuaS_Discowood_CheckPeace" , 0 )

	sleep(30)
	while true do
		sleep(10)
		if	 CheckID( TargetID() ) == false or ReadRoleValue( TargetID() , EM_RoleValue_IsDead ) == 1 or (  HateListCount( ADOG )== 0 ) 	then
			DelObj( ADOG)
			DelObj( NPCDOG[1])
			DelObj( NPCDOG[2])			
			DelObj( NPCDOG[3])
			DelObj( NPCDOG[4])
			WriteRoleValue( OwnerID() , EM_RoleValue_Register+1 , 0 )
			break	
		end
	end
	return true		
end

function LuaS_423467_2() --怪的死亡劇情
	local BOX=ReadRoleValue( OwnerID() , EM_RoleValue_Register+2 )
	local Player 
	for i=0, HateListCount( OwnerID() )-1 do
		Player = HateListInfo(OwnerID() , i , EM_HateListInfoType_GItemID )
		if	CheckAcceptQuest ( Player   , 423467 )	and	CountBodyItem(OwnerID(),208096) < 1 	then
			GiveBodyItem( Player, 208096 , 1 )	
			WriteRoleValue( BOX , EM_RoleValue_Register+1 , 0 )
		end
	end
	return true
End

