-----羅德連死後的對話
function LuaS_113460() 

	if CheckCompleteQuest( OwnerID() , 422698) == true then
		SetSpeakDetail(OwnerID(),"[SC_113460]") --要不是為了救我，[113453]副隊長也不會被魔兵殺掉.....
		PlayMotion(TargetID() , ruFUSION_ACTORSTATE_EMOTE_CRY)
	else
		LoadQuestOption( OwnerID() )
	end
end


------置換陷阱
function LuaS_422673() 

	if CountBodyItem( OwnerID(), 205904 )>0  then
		return true
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422673_1]" , C_SYSTEM ) -- 你缺少陷阱工具包！
		return false
	end
end

function LuaS_422673_1() 

	local NPC = LuaFunc_CreateObjByObj ( 113474 , TargetID() )
	WriteRoleValue( NPC  , EM_RoleValue_LiveTime , 30 )
	AddToPartition( NPC , 0 )
	return true
end

-----廢棄武器
function LuaS_422675() 

	local R = Rand( 6 ) 
	if R==1  then
		GiveBodyItem( OwnerID(), 205905, 1 )
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422675]" , C_SYSTEM ) -- 廢棄武器在你的觸碰下化為粉末
		BeginPlot( TargetID() , "LuaS_422675_1" , 0 )
		return false
	else
		return true
	end
end

function LuaS_422675_1() 
	Hide( OwnerID() )
	sleep(400)
	LuaFunc_ResetObj( OwnerID() )
end


------阿帕契的對話串
function LuaS_113455()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() ,422676 ) == true and CheckCompleteQuest( OwnerID() , 422676) == false then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_113455_1]","LuaS_113455_1",0) --阿帕契，你的計畫是......
	end
	if CheckAcceptQuest( OwnerID() ,420947 ) == true and CheckCompleteQuest( OwnerID() , 420947) == false then
		AddSpeakOption(OwnerID(), TargetID( ), "[SC_113455_SUEZ_00]",  "LuaS_113455_Suez_0",  0 ) --聽取關於斥候被炎魔襲擊的情報
	end
end

function LuaS_113455_1()
	SetSpeakDetail(OwnerID(),"[SC_113455_2]") --如果現在要以軍隊和蛇人大軍正面對抗，結果必定是失敗的... 
	AddSpeakOption(OwnerID(),TargetID(),"[SC_113455_3]","LuaS_113455_2",0) --那麼，我該怎麼做？
end

function LuaS_113455_2()
	SetSpeakDetail(OwnerID(),"[SC_113455_4]") --根據偵察兵的回報，想要到達蛇人魔都，唯一的通道......
	SetFlag(OwnerID() , 543298 , 1 )
end

----達馬蓋村的支援
function LuaS_422698()
	if CheckCompleteQuest( OwnerID() , 422744) == true then
		SetSpeakDetail(OwnerID(),"[SC_422698_1]") --我記得你，謝謝你曾經幫助我......
		SetFlag(OwnerID() , 543325 , 1 )
	else
		SetSpeakDetail(OwnerID(),"[SC_422698_2]") --協助？我再也不會去幫助你們這些「外來者」......
		SetFlag(OwnerID() , 543325 , 1 )
	end
end

function LuaS_422698_complete()
--旗子780441

	local NPC = CreateObjByFlag( 113528 , 780441 , 1 , 0 )  --報告士兵
	writerolevalue( NPC , EM_RoleValue_IsWalk , 0 )
	AddToPartition( NPC , 0 )

	MoveToFlagEnabled( NPC , false )
	LuaFunc_MoveToFlag( NPC , 780441 , 2 ,  0 )
	Say( NPC , "[SC_422698_3]" )               -- 指揮官，我有一件事情要報告......
	sleep(30)
	Say(OwnerID() , "[SC_422698_4]"  )     -- 什麼事情？你的臉色怎麼如此慘白？
	sleep(30)
	Say(NPC , "[SC_422698_5]"  )     -- 剛剛哨塔傳來消息，[113453]副隊長，他....
	sleep(30)
	Say( OwnerID() , "[SC_422698_6]" )               -- [113453]？[113453]他怎麼了？！
	sleep(30)
	Say( NPC , "[SC_422698_7]" )               -- 副隊長他....因為被魔兵襲擊.....殉職了......
	sleep(20)
	Say( OwnerID() , "[SC_422698_8]" ) 	-- 噢！不！[113453]....
	PlayMotion(OwnerID() , ruFUSION_ACTORSTATE_EMOTE_CRY)
	sleep(30)
	DelObj(NPC)
end

---422699向英雄致敬
function LuaS_422699()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() ,422699 ) == true and CheckFlag(OwnerID(),543340) == false  then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422699]","LuaS_422699_1",0) --我來送[113453]一程......
	end
end

function LuaS_422699_1()
	CloseSpeak( OwnerID() )
	if ReadRoleValue( TargetID() ,EM_RoleValue_PID ) == 0 then
		DisableQuest( TargetID() , true )
		writerolevalue( TargetID() , EM_RoleValue_PID , 1 )
		BeginPlot( TargetID() , "LuaS_422699_2" , 0 )
	else
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SAY_NPC_BUSY]" , 0 )  
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SAY_NPC_BUSY]" , C_SYSTEM )	
	end
end

--780442
function LuaS_422699_2()

	SetFlag(TargetID() , 543341 , 1 ) --阿帕契演戲中
	local soldier = {}	
	for i =1, 10, 1 do
		soldier[i] = CreateObjByFlag( 113524 , 780442 , i , 0 )  
		AddToPartition( soldier[i] , 0 )
	end

	local NPC = CreateObjByFlag( 113530 , 780442 , 11 , 1 )  --阿帕契
	AddToPartition( NPC , 0 )

	MoveToFlagEnabled( NPC , false )
	LuaFunc_MoveToFlag( NPC , 780442 , 12 ,  0 )
	sleep(20)
	Say( NPC , "[SC_422699_1]" )         --  我來見你最後一面了，[113453]......

	for i =1, 10, 1 do
		PlayMotion( soldier[i] , ruFUSION_ACTORSTATE_EMOTE_SALUTE)
	end

	sleep(30)
	PlayMotionEX( NPC, ruFUSION_ACTORSTATE_CROUCH_BEGIN,ruFUSION_ACTORSTATE_CROUCH_LOOP)
	Say( NPC , "[SC_422699_2]" )         --  往事歷歷在目，而你卻已經冰冷的躺在這裡......
	sleep(10)

	for i =1, 10, 1 do
		PlayMotionEX( soldier[i] , ruFUSION_ACTORSTATE_CROUCH_BEGIN,ruFUSION_ACTORSTATE_CROUCH_LOOP)
	end

	sleep(50)
	Say( NPC , "[SC_422699_3]" )         --  我會替你報仇的，兄弟！安心上路吧......
	LuaFunc_MoveToFlag( NPC , 780442 , 13 ,  0 )
	sleep(20)
	PlayMotion(NPC , ruFUSION_ACTORSTATE_EMOTE_POINT)
	sleep(20)
	local Fire = CreateObjByFlag( 113583 , 780442 , 14 , 0 ) --火焰  
	Lua_ObjDontTouch( Fire ) 
	AddToPartition( Fire , 0 )
	AddBuff( Fire , 503605 , 1 , -1 )

	sleep(30)
	LuaFunc_MoveToFlag( NPC , 780442 , 15 ,  0 )
	LuaFunc_MoveToFlag( NPC , 780442 , 16 ,  0 )
	sleep(20)
	Say( NPC , "[SC_422699_4]" )         --  [113453]副隊長在今日英勇殉職，但他的事蹟，將會永遠流存在我們心中！
	AddBuff( Fire , 502724 , 1 , -1 )
	sleep(30)
	PlayMotion( NPC , ruFUSION_ACTORSTATE_EMOTE_SALUTE)
	sleep(50)
	SetFlag(TargetID() , 543340 , 1 )    --任務完成
	SetFlag(TargetID() , 543341 , 0) --阿帕契不演了！

	Delobj( NPC )
	Delobj( Fire )
	for i =1, 10, 1 do
		Delobj( soldier[i] )
	end

	DisableQuest( OwnerID() , false )
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 )
end























