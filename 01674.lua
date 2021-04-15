--Flag 780520 1~4 任務 422890
--Flag 780520 5~6 任務 422891
--Flag 780520 7~15 任務 422892
--Flag 780520 16~19 任務 422893
--Flag 780520 20~22 任務 422895
function LuaI_114098_0()
	sleep( 30 )
	local Box = LuaFunc_SearchNPCbyOrgID( OwnerID(), 114112, 50 )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register + 9 , Box )
end

function LuaS_114098_0()
	LoadQuestOption( OwnerID() )
	if  CheckAcceptQuest(OwnerID(),422878)==true  and  CheckFlag(OwnerID(),543510)==false  then--422878尋找哈利普頓------重要旗標543510
	 	AddSpeakOption(OwnerID(),TargetID(),"[SC_422878]","LuaS_422878_1",0)  
	end
	if CheckAcceptQuest( OwnerID() , 422890 ) == true and CheckFlag( OwnerID() , 543516 ) == false then
		AddSpeakOption(  OwnerID(), TargetID( ),  "[SC_422890_0]" ,  "LuaS_114098_1",  0 ) --請你帶我去找你所謂的寶物
	end
end

function LuaS_422878_1()
	SetSpeakDetail ( OwnerID(),"[SC_422878_1]" )
 	AddSpeakOption(OwnerID(),TargetID(),"[SC_422878_2]","LuaS_422878_2",0)  
end
function LuaS_422878_2()
	SetSpeakDetail ( OwnerID(),"[SC_422878_3]" )
 	AddSpeakOption(OwnerID(),TargetID(),"[SC_422878_4]","LuaS_422878_3",0)  
end
function LuaS_422878_3()
	SetSpeakDetail ( OwnerID(),"[SC_422878_5]" )
 	SetFlag(OwnerID() ,543510, 1 )
	AddSpeakOption(  OwnerID(), TargetID( ), "[SO_BACK]",  "LuaS_114098_0",  0 );
end

function LuaS_114098_1()	
	CloseSpeak( OwnerID() )
	if ReadRoleValue( OwnerID() , EM_RoleValue_Register ) == 0 then
		BeginPlot( TargetID() , "LuaQ_422890_Accept" , 0 )
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SAY_NPC_BUSY]" , 0 )
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SAY_NPC_BUSY]" , 0 )
	end
end

function LuaQ_422890_Accept()
	if ReadRoleValue( OwnerID() , EM_RoleValue_Register ) == 0 then
		local Buff = 504004
		DisableQuest( OwnerID() , true )
		SetPlot( OwnerID() , "touch" , "LuaFunc_Obj_BUSY" , 50 )
		WriteRoleValue( OwnerID() , EM_RoleValue_Register , 7 )
		local Box = ReadRoleValue( OwnerID() , EM_RoleValue_Register + 9 )
		local Dir =ReadRoleValue( OwnerID() , EM_RoleValue_Dir)
		AdjustFaceDir( OwnerID()  , Box  , 0)
		sleep( 5 )
		PlayMotionEX(  OwnerID()  , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_LOOP )
		sleep(30)
		if CheckID( TargetID() ) == true then
			AddBuff( TargetID() , Buff , 0 , 30 )
		end
		PlayMotion(  OwnerID()  , ruFUSION_ACTORSTATE_CROUCH_END )
		sleep( 30 )
		SetDir( OwnerID(), Dir)
		sleep( 5 )
		WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
		SetPlot( OwnerID() , "touch" , "" , 0 )
		DisableQuest( OwnerID() , false )
	else
		ScriptMessage( TargetID() , TargetID() , 1 , "[SAY_NPC_BUSY]" , 0 )
		ScriptMessage( TargetID() ,  TargetID() ,0 , "[SAY_NPC_BUSY]" , 0 )
	end
end

function LuaQ_422890_OnClick()
	local Buff = 504004
	if CheckBuff( OwnerID() , Buff ) == false then
 		ScriptMessage( OwnerID() , OwnerID()  , 1 , "[SC_422890_1]" , 0 ) --[114098]還沒進到箱子中
 		ScriptMessage( OwnerID() , OwnerID()  , 0 , "[SC_422890_1]" , 0 )
		return -1
	end
	if CountBodyItem( OwnerID() , 206457) > 0 then
		ScriptMessage( OwnerID() , OwnerID()  , 2 , "[SC_422890_2]" , 0 ) --你翻了翻箱子，並沒有發現什麼特別的東西
 		ScriptMessage( OwnerID() , OwnerID()  , 0 , "[SC_422890_2]" , 0 )
		return -1
	end
	return 1
end

function LuaQ_422890_Range_A()
	SetPlot( OwnerID() , "range" , "LuaQ_422890_Range_A2" , 150 )
end

function LuaQ_422890_Range_B()
	SetPlot( OwnerID() , "range" , "LuaQ_422890_Range_B2" , 50 )
end

function LuaQ_422890_Range_C()
	SetPlot( OwnerID() , "range" , "LuaQ_422890_Range_C2" , 70 )
end

function LuaQ_422890_Range_A2()
	if CheckAcceptQuest( OwnerID() , 422890 ) == true and CountBodyItem(OwnerID() , 206457 ) > 0 and CheckFlag( OwnerID() , 543516 ) == false then
 		ScriptMessage( OwnerID() , OwnerID()  , 2 , "[SC_422890_3]" , 0 ) --[114098]大喊：就是這裡！就是這裡！快把我放下來！
 		ScriptMessage( OwnerID() , OwnerID()  , 0 , "[SC_422890_3]" , 0 )
	end
end

function LuaQ_422890_Range_B2()
	if CheckAcceptQuest( OwnerID() , 422890 ) == true and CountBodyItem(OwnerID() , 206457 ) > 0 and CheckFlag( OwnerID() , 543516 ) == false then
		if ReadRoleValue( OwnerID() , EM_RoleValue_Z ) < 27040 then
 			ScriptMessage( OwnerID() , OwnerID()  , 0 , "[SC_422890_18]" , "0xFFBE60D2")--[114098]小聲的說：這裡，從這條小路走進去。
		end
	end
end

function LuaQ_422890_Range_C2()
	if CheckAcceptQuest( OwnerID() , 422890 ) == true and CountBodyItem(OwnerID() , 206457 ) > 0 and CheckFlag( OwnerID() , 543516 ) == false then
		if ReadRoleValue( OwnerID() , EM_RoleValue_Y ) > 1090 then
 			ScriptMessage( OwnerID() , OwnerID()  , 0 , "[SC_422890_19]" , "0xFFBE60D2" )--[114098]小聲的說：看到前面那塊空地了嗎？跳到那邊去。
		end
	end
end

function LuaI_206457_Check()
	local Flag = 780520
	if CheckFlag( OwnerID() , 543516 ) == true or CheckCompleteQuest(OwnerID() , 422890) == true or CheckAcceptQuest(OwnerID() , 422890) == false then
		ScriptMessage( OwnerID() , OwnerID()  , 1 , "[SC_422890_8]" , 0 ) --[114098]已經從箱子中出來了
 		ScriptMessage( OwnerID() , OwnerID()  , 0 , "[SC_422890_8]" , 0 )
		return false
	end
	if Lua_ExGetZone(OwnerID()) ~= 9 or ( Lua_ObjAreaCheck(OwnerID(), 714 ) ==false and Lua_ObjAreaCheck(OwnerID(), 715 ) ==false ) then
 		ScriptMessage( OwnerID() , OwnerID()  , 0 , "[SC_422890_4]" , "0xFFBE60D2" ) --[114098]小聲的說：不對，你走錯位置了。
		return false
	end
	if Lua_ObjAreaCheck(OwnerID(), 715 ) ==true and ReadRoleValue( OwneRID() , EM_RoleValue_X ) > -10600 then 
		ScriptMessage( OwnerID() , OwnerID()  , 0 , "[SC_422890_21]" , "0xFFBE60D2" ) --[114098]小聲的說：我們先離開村子，往[ZONE_TITANS HILL]前進。
		return false
	end
	if DW_CheckDis( OwnerID() ,Flag, 1 , 1500 ) == false then
 		ScriptMessage( OwnerID() , OwnerID()  , 0 , "[SC_422890_4]" , "0xFFBE60D2" ) --[114098]小聲的說：不對，你走錯位置了。
		BeginPlot( OwnerID() , "LuaI_206457_Hint" , 0 )
		return false
	end
	if DW_CheckDis( OwnerID() ,Flag, 1 , 1000 ) == false then
 		ScriptMessage( OwnerID() , OwnerID()  , 0 , "[SC_422890_5]" , "0xFFBE60D2" ) --[114098]小聲的說：不對，不是這裡。
		BeginPlot( OwnerID() , "LuaI_206457_Hint" , 0 )
		return false
	end
	if DW_CheckDis( OwnerID() ,Flag, 1 , 500 ) == false then
 		ScriptMessage( OwnerID() , OwnerID()  , 0 , "[SC_422890_6]" , "0xFFBE60D2" ) --[114098]小聲的說：還有好一段距離
		BeginPlot( OwnerID() , "LuaI_206457_Hint" , 0 )
		return false
	end
	if DW_CheckDis( OwnerID() ,Flag, 1 , 150 ) == false then
 		ScriptMessage( OwnerID() , OwnerID()  , 0 , "[SC_422890_7]" , "0xFFBE60D2" ) --[114098]小聲的說：就快到了。
		BeginPlot( OwnerID() , "LuaI_206457_Hint" , 0 )
		return false
	end
	local HLPD = LuaFunc_SearchNPCbyOrgID( OwnerID(),114110 , 300 )
	if CheckID( HLPD ) == true  then
 		ScriptMessage( OwnerID() , OwnerID()  , 1 , "[SC_422890_8]" , 0 ) --[114098]已經從箱子中出來了
 		ScriptMessage( OwnerID() , OwnerID()  , 0 , "[SC_422890_8]" , 0 )
		return false
	end
	UseItemDestroy( OwnerID() ) 
	return true
end

function LuaI_206457_Hint()
	local RandCall = {102548 , 102549 , 102550 }
	local Creatrue = GameObjInfo_Str( RandCall[DW_Rand(3)] ,"Name");
	local tips = Lua_DW_CreateObj("obj" , Creatrue, OwnerID(),0)
	local Str = "[SC_422890_20][$SETVAR1="..Creatrue.."]"
 	ScriptMessage( TargetID() ,TargetID() , 0 , Str , "0xFFBE60D2" )--[114098]小聲的說：往那裡，往那個[$VAR1]跑過去的方向走。
	WriteRoleValue( tips , EM_RoleValue_LiveTime , 5 )
	WriteRoleValue( tips , EM_RoleValue_IsWalk, 0 )
	Lua_ObjDontTouch(tips)
	AddToPartition(tips,0)
	SetFightMode( tips , 0 , 1 , 0 , 0 )
	BeginPlot( tips , "LuaI_206457_Move" , 0 )
	sleep( 50 )
end

function LuaI_206457_Move()
	LuaFunc_MoveToFlag( OwnerID() , 780520 , 1 ,0 )
end

function LuaI_206457_Use()
	local HLPD = LuaFunc_CreateObjByObj( 114110 , OwnerID() )
	Lua_ObjDontTouch( HLPD) 
	MoveToFlagEnabled( HLPD , false )
	SetPlot( HLPD , "Dead" , "LuaI_422890_Dead" , 0 )
	BeginPlot( HLPD , "LuaI_422890_PLAY" , 0 )
end

function LuaI_422890_PLAY()
	local Flag = 780520
	local Enermy = {}

	Yell( OwnerID() , "[SC_422890_9]" , 3 ) --到了，就是這裡了……
	LuaFunc_MoveToFlag( OwnerID(), Flag, 1 ,0 )
	sleep( 5 )
	Yell( OwnerID() , "[SC_422890_10]" , 3 ) --只要取出就行了。
	PlaymotionEX( OwnerID() , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_LOOP )
	sleep( 30 )
	SetFightMode( OwnerID() , 0 , 0 , 0 , 1 )

	for i = 1 , 2 , 1 do
		if i == 1 then
			Enermy[i] = CreateObjByFlag( 102674 , Flag , 2 , 1)
		else
			Enermy[i] = CreateObjByFlag( 102673 , Flag , 3 , 1)
		end
		SetroleCamp( Enermy[i] , "Visitor" )
		WriteRoleValue( Enermy[i] , EM_RoleValue_IsWalk , 0 )
		AddToPartition( Enermy[i] , 0 )
		MoveToFlagEnabled( Enermy[i] ,  false )
		AdjustFaceDir( Enermy[i] , OwnerID() , 0 ) 
	end

	Yell( Enermy[1] ,"[SC_422890_11]" , 3 ) --將你手上的東西交出來，否則……
	PlayMotion( Enermy[1] , ruFUSION_ACTORSTATE_EMOTE_POINT )
	sleep( 10 )
	Playmotion( OwnerID() , ruFUSION_ACTORSTATE_CROUCH_END)
	sleep( 10 )
	AdjustFaceDir(OwnerID() , Enermy[1] ,  0 ) 
	Yell( Enermy[2] ,"[SC_422890_12]" , 3 ) --廢話少說，動手吧！
	PlayMotion( Enermy[2] , ruFUSION_ACTORSTATE_ATTACK_1H )	
	sleep( 10 )
	SetRoleCamp( Enermy[2] , "Monster" )
	SetRoleCamp( OwnerID() , "SNPC" )
	SetAttack( Enermy[2] , OwnerID() )
	sleep( 5 )
	SetRoleCamp( Enermy[1] , "Monster" )
	SetAttack( Enermy[1] , OwnerID() )
	for i = 1 , 300 , 1 do
		if ReadRoleValue(  Enermy[1] , EM_RoleValue_HP) < 0.5*ReadRoleValue(  Enermy[1] , EM_RoleValue_MaxHP) then
			break
		end
		if ReadRoleValue(  Enermy[2] , EM_RoleValue_HP) < 0.5*ReadRoleValue(  Enermy[2] , EM_RoleValue_MaxHP) then
			break
		end
		if ReadRoleValue(  OwnerID() , EM_RoleValue_HP) < 0.5*ReadRoleValue(  OwnerID(), EM_RoleValue_MaxHP) then
			if CheckID( TargetID() ) == true and ReadRoleValue( TargetID() , EM_RoleValue_IsDead ) == 0 and GetDistance( TargetID() , OwnerID() ) < 150 then
				if CheckAcceptQuest(TargetID() , 422890 ) == true then
					AddBuff( TargetID() , 505466 , 0 , 10)
					SetFlag(TargetID(), 543516  , 1 )
				end
			end
			break
		end
		sleep( 10 )
	end
	
	for i = 1 , 2 , 1 do
		BeginPlot( Enermy[i] , "LuaI_422890_Dead" , 0 )
		MoveToFlagEnabled(  Enermy[i] , false )
	end

	Lua_CancelAllBuff( OwnerID() ) 
	SetStopAttack( OwnerID() )
	SetRoleCamp( OwnerID() , "Visitor" )


	AdjustFaceDir(OwnerID() ,  Enermy[2] ,  0 ) 
	sleep( 5 )
	----計算 Enermy[2]  以及  Enermy[1] 要移動到的位置 --
	local Org = Role:new( OwnerID()  )
	local PosA = {}
	local PosB = {}
	local Cal =(math.pi/180)*(Org:Dir() )
	local dis = GetDistance( OwnerID() , Enermy[2]  )
	if Dis >10 then	
		PosA["X"] = Org:X() +(dis/2*math.cos(Cal))
		PosA["Z"] = Org:Z() - (dis/2*math.sin(Cal))
		PosA["Y"] = GetHeight( PosA["X"] , Org:Y() , PosA["Z"] );
		PosB["X"] = Org:X() +(dis/4*math.cos(Cal))
		PosB["Z"] = Org:Z() - (dis/4*math.sin(Cal))
		PosB["Y"] = GetHeight( PosB["X"] , Org:Y() , PosB["Z"] );
	else
		PosA["X"] = Org:X()
		PosA["Z"] = Org:Z() 
		PosA["Y"] = Org:Y()
		PosB["X"] = Org:X()
		PosB["Z"] = Org:Z()
		PosB["Y"] = Org:Y()
	end
	------------------------------------------
	local SleepTimeA = MoveDirect( Enermy[2], PosA["X"]  , PosA["Y"] , PosA["Z"] ) 
	sleep( 5 )
	local SleepTimeB = MoveDirect( Enermy[1], PosB["X"]  , PosB["Y"] , PosB["Z"] ) 
	if SleepTimeA > SleepTimeB + 5 then
		sleep( SleepTimeA -5)
	else
		sleep( SleepTimeB)
	end
	sleep( 5 )
	Yell( Enermy[2] , "[SC_422890_13]" , 3 ) --納命來吧！
	PlayMotion( Enermy[2] , ruFUSION_ACTORSTATE_ATTACK_1H )	
	Yell( Enermy[1] , "[SC_422890_14]" , 3 ) --不！來不及了！我們快逃吧！
	AdjustFaceDir( Enermy[1] ,Enermy[2]  ,   0 ) 
	sleep( 5 )
	Yell( OwnerID(), "[SC_422890_15]" , 3 ) --[114099]？
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	AdjustFaceDir( OwnerID()  ,  Enermy[1] , 0 ) 
	Yell( Enermy[1] , "[SC_422890_16]" , 3 ) --快走吧！目前我們打不過他們的。
	PlayMotion( Enermy[1] ,ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )
	sleep( 20 )
	Yell( Enermy[2] , "[SC_422890_17]" , 3 ) --算你們好運。
	BeginPlot(  Enermy[2] , "LuaI_422890_Flee" , 0 )	
	sleep( 20 )
	AdjustFaceDir( Enermy[1] ,OwnerID()  ,   0 ) 
	PlayMotion( Enermy[1] ,ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )
	sleep( 20 )
	BeginPlot(  Enermy[1] , "LuaI_422890_Flee" , 0 )	
	sleep( 20 )
	SetPlot( OwnerID() , "range" , "LuaI_422890_CancelBuff" , 150 )
	SetDir( OwnerID() , 190 )
	sleep( 10 )
	DelObj( OwnerID() )
end

function LuaI_422890_Dead()
	local Buff = 505466
	for i = 1 , HateListCount( OwnerID() ) , 1 do
		local ID = HateListInfo(OwnerID() ,i-1 , EM_HateListInfoType_GItemID )
		if CheckAcceptQuest( ID , 422890 ) == true and CheckFlag( ID , 543516 ) == false then
			AddBuff( ID ,Buff , 0 , 10)
			SetFlag( ID , 543516  , 1 )
		end
	end
	Lua_CancelAllBuff( OwnerID() ) 
	SetStopAttack( OwnerID() )
	SetRoleCamp( OwnerID() , "Visitor" )
	return false
end

function LuaI_422890_CancelBuff()
	local Buff = 505466
	if CheckBuff( OwnerID() , Buff ) == true then
		CancelBuff_NoEvent( OwnerID() , Buff )
	end
end

function LuaI_422890_Flee()
	local Flag = 780520
	LuaFunc_MoveToFlag( OwnerID(), Flag, 4 ,0 )
	DelObj( OwnerID() )
end

function LuaI_114192_0()
	sleep( 30 )
	local RuffleDick = LuaFunc_SearchNPCbyOrgID( OwnerID(), 114193, 50 )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register + 9 , RuffleDick )
end

function LuaS_114192_0()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 422891 ) == true then
		AddSpeakOption(  OwnerID(), TargetID( ),  "[SC_422891_0]" ,  "LuaS_114192_1",  0 ) --發生了什麼事？
	end
	if CheckAcceptQuest( OwnerID() , 422892 ) == true and CheckFlag( OwnerID() , 543518 ) == false then
		AddSpeakOption(  OwnerID(), TargetID( ),  "[SC_422892_0]" ,  "LuaS_114098_2",  0 ) --走吧！讓我們找出自然之石吧！
	end
end

function LuaS_114098_2()	
	if ReadRoleValue( OwnerID() , EM_RoleValue_Register ) == 0 then
		CloseSpeak( OwnerID() )
		BeginPlot( TargetID() , "LuaQ_422892_PLAY" , 0 )
	else
		SetSpeakDetail( OwnerID(), "[SC_422892_1]"   )  --等等，我似乎感到一絲不詳的預感。
	end
end

function LuaS_114192_1()
	SetSpeakDetail( OwnerID(), "[SC_422891_1]"   ) 
	if CheckAcceptQuest( OwnerID() , 422891 ) == true then
		SetFlag( OwnerID() , 543517 , 1 )
	end
	AddSpeakOption(  OwnerID(), TargetID( ), "[SO_BACK]",  "LuaS_114192_0",  0 );
end

function LuaQ_422891_Complete()
	local Buff = 504004
	AddBuff( TargetID() , Buff , 0 , 30 )

	if ReadRoleValue( OwnerID() , EM_RoleValue_Register ) == 0 then
		local Flag = 780520
		DisableQuest( OwnerID() , true )
		SetPlot( OwnerID() , "touch" , "LuaFunc_Obj_BUSY" , 50 )
		WriteRoleValue( OwnerID() , EM_RoleValue_Register , 7 )
		local RuffleDick = CreateObjByFlag( 114106 , Flag , 5 , 1 )
		Lua_ObjDontTouch( RuffleDick )
		WriteRoleValue( RuffleDick , EM_RoleValue_IsWalk , 1 )
		AddToPartition ( RuffleDick  , 0 )
		MoveToFlagEnabled( RuffleDick , false );
		Yell( RuffleDick ,  "[SC_422891_2]"   , 3 ) --發生了什麼事了？
		LuaFunc_MoveToFlag( RuffleDick , Flag , 6 ,0 )
		sleep( 5 )
		Yell( RuffleDick ,  "[SC_422891_3]"   , 3 ) --你們為什麼會在這呢？
		PlayMotion( RuffleDick , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
		AdjustFaceDir(RuffleDick ,OwnerID()  ,   0 ) 
		sleep( 20 )
		Yell( RuffleDick ,  "[SC_422891_4]"   , 3 ) --拿到[206389]了嗎？
		PlayMotion( RuffleDick , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
		sleep( 20 )
		SetPlot( RuffleDick , "range" , "LuaQ_422891_CancelBuff" , 150 )
		sleep( 10 )
		DelObj( RuffleDick )
		WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
		SetPlot( OwnerID() , "touch" , "" , 0 )
		DisableQuest( OwnerID() , false )
	else
		ScriptMessage( TargetID() , TargetID() , 1 , "[SAY_NPC_BUSY]" , 0 )
		ScriptMessage( TargetID() ,  TargetID() ,0 , "[SAY_NPC_BUSY]" , 0 )
	end
end

function LuaQ_422891_CancelBuff()
	local Buff = 504004
	if CheckBuff( OwnerID() , Buff ) == true then
		CancelBuff_NoEvent( OwnerID() , Buff )
	end
end

function LuaQ_422892_PLAY()
	local Flag = 780520
	if CheckID( TargetID() ) == true then	
		AddBuff(  TargetID() , 505468 , 0 , 120 )
	else
		return
	end
	WriteRoleValue( OwnerID() ,  EM_RoleValue_Register , 7 )
	DisableQuest( OwnerID() , true )
	SetPlot( OwnerID() , "touch" , "LuaFunc_Obj_BUSY" , 50 )
--	Hide( OwnerID() )
	local RuffleDick_Org = ReadRoleValue( OwnerID() , EM_RoleValue_Register+9 )
	local HLPD = LuaFunc_CreateObjByObj( 114132 , OwnerID() )
	local RuffleDick = LuaFunc_CreateObjByObj( 114133 , RuffleDick_Org )
	local Auro = CreateObjByFlag( 113425,Flag , 7 , 1 ) 
	Lua_ObjDontTouch(Auro) 
	WriteRoleValue( HLPD , EM_RoleValue_IsWalk , 1 )
	WriteRoleValue( RuffleDick , EM_RoleValue_IsWalk , 1 )
	Hide( HLPD )
	Hide( RuffleDick )
	Lua_ObjDontTouch( HLPD) 
	Lua_ObjDontTouch( RuffleDick) 
	Show( HLPD , 0 )
	Show( RuffleDick, 0 )
	MoveToFlagEnabled( HLPD , false )
	MoveToFlagEnabled( RuffleDick , false )
	WriteRoleValue( HLPD  , EM_RoleValue_Register , 9 )
	AdjustFaceDir( HLPD ,Auro  ,   0 ) 
	sleep( 5)
	PlayMotion( HLPD ,  ruFUSION_ACTORSTATE_EMOTE_POINT )
	sleep( 30 )
	BeginPlot(HLPD   , "LuaI_422892_GO" , 0 )
	LuaFunc_MoveToFlag(  RuffleDick  , Flag, 1 ,0 )
	sleep( 5 )
	if CheckID( TargetID() ) == true then --玩家不在或放棄任務就中斷
		if CheckAcceptQuest( TargetID() , 422892 ) == false or CheckBuff(  TargetID() , 505468 ) == false then
			if CheckBuff(  TargetID() , 505468 ) == true then
				CancelBuff_NoEvent(  TargetID() , 505468 )
			end
			Delobj(  HLPD )
			Delobj(  RuffleDick )
			Delobj(  Auro )
			DisableQuest( OwnerID() , false )
			WriteRoleValue( OwnerID() ,  EM_RoleValue_Register , 0 )
			SetPlot( OwnerID() , "touch" , "LuaFunc_Obj_BUSY" , 0 )
			return
		end
	else
		Delobj(  HLPD )
		Delobj(  RuffleDick )
		Delobj(  Auro )
		DisableQuest( OwnerID() , false )
		WriteRoleValue( OwnerID() ,  EM_RoleValue_Register , 0 )
		SetPlot( OwnerID() , "touch" , "LuaFunc_Obj_BUSY" , 0 )
		return
	end
	LuaFunc_MoveToFlag(  RuffleDick  , Flag, 8 ,0 )
	sleep( 5 )
	if CheckID( TargetID() ) == true then --玩家不在或放棄任務就中斷
		if CheckAcceptQuest( TargetID() , 422892 ) == false or CheckBuff(  TargetID() , 505468 ) == false then
			if CheckBuff(  TargetID() , 505468 ) == true then
				CancelBuff_NoEvent(  TargetID() , 505468 )
			end
			Delobj(  HLPD )
			Delobj(  RuffleDick )
			Delobj(  Auro )
			DisableQuest( OwnerID() , false )
			WriteRoleValue( OwnerID() ,  EM_RoleValue_Register , 0 )
			SetPlot( OwnerID() , "touch" , "LuaFunc_Obj_BUSY" , 0 )
			return
		end
	else
		Delobj(  HLPD )
		Delobj(  RuffleDick )
		Delobj(  Auro )
		DisableQuest( OwnerID() , false )
		WriteRoleValue( OwnerID() ,  EM_RoleValue_Register , 0 )
		SetPlot( OwnerID() , "touch" , "LuaFunc_Obj_BUSY" , 0 )
		return
	end
	Yell( HLPD ,  "[SC_422892_2]" , 3 ) --到了，似乎就在這了。
	AdjustFaceDir( HLPD ,Auro  ,   0 ) 
	sleep( 5 )
	PlaymotionEX( HLPD , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_LOOP )
	sleep( 20 )
	Yell( RuffleDick ,   "[SC_422892_3]" , 3 ) --趕快把東西取出來吧。
	AdjustFaceDir(  RuffleDick , HLPD  ,   0 ) 
	sleep( 20 )
	Yell( HLPD ,  "[SC_422892_4]" , 3 ) --好～我記得祖訓是怎麼說的？
	sleep( 30 )
	Yell( HLPD ,  "[SC_422892_5]" , 3 ) --以染炎之靈，索取真正的寶物？
	sleep( 20 )
	ScriptMessage( Auro , 0 , 2 , "[SC_422892_6]" , 0 ) --[114132]手上發光的物品，引出了潛藏在此的魔法陣。
	ScriptMessage( Auro , 0 , 0 , "[SC_422892_6]" , 0 ) --[114132]手上發光的物品，引出了潛藏在此的魔法陣。
	AddToPartition( Auro , 0 )
	if CheckID( TargetID() ) == true then --玩家不在或放棄任務就中斷
		if CheckAcceptQuest( TargetID() , 422892 ) == false or CheckBuff(  TargetID() , 505468 ) == false then
			if CheckBuff(  TargetID() , 505468 ) == true then
				CancelBuff_NoEvent(  TargetID() , 505468 )
			end
			Delobj(  HLPD )
			Delobj(  RuffleDick )
			Delobj(  Auro )
			DisableQuest( OwnerID() , false )
			WriteRoleValue( OwnerID() ,  EM_RoleValue_Register , 0 )
			SetPlot( OwnerID() , "touch" , "LuaFunc_Obj_BUSY" , 0 )
			return
		end
	else
		Delobj(  HLPD )
		Delobj(  RuffleDick )
		Delobj(  Auro )
		DisableQuest( OwnerID() , false )
		WriteRoleValue( OwnerID() ,  EM_RoleValue_Register , 0 )
		SetPlot( OwnerID() , "touch" , "LuaFunc_Obj_BUSY" , 0 )
		return
	end
	local Enermy = {}
	for i = 1 , 2 , 1 do
		Enermy[i] = CreateObjByFlag( 114214 , Flag , 9+i , 1)
		WriteRoleValue( Enermy[i] , EM_RoleValue_Register , 11+i )
		Lua_ObjDontTouch(Enermy[i]) 
		SetRoleCamp( Enermy[i] , "Visitor" )
		WriteRoleValue( Enermy[i] , EM_RoleValue_IsWalk , 0 )
		AddToPartition( Enermy[i] , 0 )
		MoveToFlagEnabled( Enermy[i] ,  false )	
	end	
	AdjustFaceDir( Enermy[1] , RuffleDick , 0 ) 
	AdjustFaceDir( Enermy[2] ,  HLPD  , 0 ) 
	sleep( 5 )
	Yell(  Enermy[1] ,  "[SC_422892_7]" , 3 ) --呵～終於出現了吧！
	AdjustFaceDir(RuffleDick ,  Enermy[1] , 0 ) 
	SetDefIdleMotion(RuffleDick ,ruFUSION_MIME_IDLE_COMBAT_1H)
	Playmotion( HLPD , ruFUSION_ACTORSTATE_CROUCH_END)
	sleep( 20 )
	AdjustFaceDir(HLPD  ,  Enermy[1] , 0 ) 
	Yell(  Enermy[1] ,  "[SC_422892_8]" , 3 ) --喂，之前說好的，一人搶一個。
	FaceObj( Enermy[1] , RuffleDick)
	sleep( 10 )
	Yell( Enermy[2] ,  "[SC_422892_9]" , 3 ) --我知道……
	FaceObj( Enermy[2] , HLPD)
	sleep( 20 )
	PlayMotion( Enermy[2] , ruFUSION_ACTORSTATE_THROW )
	PlayMotion( Enermy[1] , ruFUSION_ACTORSTATE_CAST_INSTANT )
	AddBuff(HLPD  ,500235 , 0 , 1)
	Yell( HLPD ,  "[SC_422892_10]" , 3 ) --[114099]～
	PlayMotionEX( RuffleDick, ruFUSION_ACTORSTATE_DYING,ruFUSION_ACTORSTATE_DEAD)
	sleep( 5 )
	Delobj( Auro )
	AdjustFaceDir( Enermy[2] ,  Enermy[1] ,  0 ) 
	Yell( Enermy[2] ,  "[SC_422892_11]" , 3 ) --到手了，走吧。
	PlayMotion(Enermy[1] , ruFUSION_ACTORSTATE_CROUCH_BEGIN )
	sleep( 20 )
	Yell( Enermy[1] ,  "[SC_422892_12]" , 3 ) --我這裡也好了。
	BeginPlot( Enermy[2] , "LuaI_422892_GO" , 0 )
	Delobj( RuffleDick )
	PlayMotion(Enermy[1] , ruFUSION_ACTORSTATE_CROUCH_END )
	sleep( 20 )	
	BeginPlot( Enermy[1] , "LuaI_422892_GO" , 0 )	
	if CheckID( TargetID() ) == true then --玩家不在或放棄任務就中斷
		if CheckAcceptQuest( TargetID() , 422892 ) == false or CheckBuff(  TargetID() , 505468 ) == false then
			if CheckBuff(  TargetID() , 505468 ) == true then
				CancelBuff_NoEvent(  TargetID() , 505468 )
			end
			Delobj(  HLPD )
			Delobj(  RuffleDick )
			Delobj(  Auro )
			DisableQuest( OwnerID() , false )
			WriteRoleValue( OwnerID() ,  EM_RoleValue_Register , 0 )
			SetPlot( OwnerID() , "touch" , "LuaFunc_Obj_BUSY" , 0 )
			return
		end
	else
		Delobj(  HLPD )
		Delobj(  RuffleDick )
		Delobj(  Auro )
		DisableQuest( OwnerID() , false )
		WriteRoleValue( OwnerID() ,  EM_RoleValue_Register , 0 )
		SetPlot( OwnerID() , "touch" , "LuaFunc_Obj_BUSY" , 0 )
		return
	end
	Hide( HLPD)
	WriteRoleValue(  HLPD , EM_RoleValue_IsWalk , 0 )
	Show(HLPD , 0 )
	LuaFunc_MoveToFlag( HLPD, Flag, 15 ,0 )
	SetDir( HLPD , 186 )
	sleep( 5 )	
	Delobj( HLPD )
	if CheckID( TargetID() ) == true then
		if CheckAcceptQuest( TargetID() , 422892 ) == true then
			SetFlag(  TargetID() , 543518 , 1 )
		end
		if CheckBuff(  TargetID() , 505468 ) == true then
			CancelBuff_NoEvent(  TargetID() , 505468 )
		end
	end
--	Show( OwnerID() , 0 )
	DisableQuest( OwnerID() , false )
	WriteRoleValue( OwnerID() ,  EM_RoleValue_Register , 0 )
	SetPlot( OwnerID() , "touch" , "" , 0 )
end
function LuaQ_422892_Complete()
	AddBuff( TargetID() , 504004 , 0 , 60 )
	if ReadRoleValue( OwnerID() , EM_RoleValue_Register ) > 0 then
		return	
	end
	SetPlot( OwnerID() , "touch" , "LuaFunc_Obj_BUSY" , 0 )
	local Flag = 780520
	WriteRoleValue( OwnerID() ,  EM_RoleValue_Register , 7 )
	DisableQuest( OwnerID() , true )
	local AntCrown = CreateObjByFlag( 114190 , Flag ,14, 1)
	local HLPD = CreateObjByObj( 114281 , OwnerID() )
	local Dir = ReadRoleValue( OwnerID() , EM_RoleValue_Dir )
	Lua_ObjDontTouch(AntCrown) 
	Lua_ObjDontTouch( HLPD ) 
	AddToPartition( AntCrown, 0 )
	MoveToFlagEnabled( HLPD , false )
	MoveToFlagEnabled( AntCrown, false )
	CastSpell(  AntCrown , AntCrown , 494747)
	sleep( 20 )
	Yell( AntCrown , "[SC_422892_13]" , 3 ) --是不是發生了什麼事？
	AdjustFaceDir( AntCrown ,  HLPD  , 0 ) 	
	sleep( 5 )
	AdjustFaceDir(   HLPD   , AntCrown  , 0 ) 
	PlayMotion(   HLPD  ,  ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep( 30 )
	Yell( AntCrown , "[SC_422892_14]" , 3 ) --[206389]與[114133]都被奇怪的人帶走？
	PlayMotion( AntCrown ,  ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )
	sleep( 20 )
	SetDir( AntCrown  , 250)
	sleep( 20 )
	Yell( AntCrown , "[SC_422892_15]" , 3 ) --難怪風的律動與魔法衝擊頻率，不同於往常。
	PlayMotion( AntCrown , ruFUSION_ACTORSTATE_EMOTE_IDLE2 )
	sleep( 30 )
	AdjustFaceDir( AntCrown  , HLPD ,  0 ) 
	sleep( 5 )
	Yell( AntCrown , "[SC_422892_16]" , 3 ) --必須盡快將他們帶回。
	PlayMotion( AntCrown ,  ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
	sleep( 25 )
	SetDir(  HLPD , Dir)
	SetPlot( AntCrown ,"range" , "LuaI_422892_Range" , 150 )
	SetDir( AntCrown  , 250)
	sleep( 10 )
	Delobj( AntCrown )
	Delobj(  HLPD)
	DisableQuest( OwnerID() , false )
	WriteRoleValue( OwnerID() ,  EM_RoleValue_Register , 0 )
	SetPlot( OwnerID() , "touch" , "" , 0 )
end

function LuaI_422892_GO()
	local Flag = 780520
	local GoToID = ReadRoleValue( OwnerID() , EM_RoleValue_Register )
	LuaFunc_MoveToFlag( OwnerID(), Flag, GoToID ,0 )
	if GoToID == 12 or GoToID == 13 then
		Delobj( OwnerID() )
	end
end

function LuaI_422892_Range()
	if CheckBuff( OwnerID() , 504004) == true then
		CancelBuff_NoEvent( OwnerID() , 504004)
	end
end

function LuaI_206451_Check()
	if CheckAcceptQuest( OwnerID() , 422893 ) == false or CheckFlag( OwnerID() , 543519 ) == true or CheckCompleteQuest( OwnerID() , 422893 ) == true then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422893_0]" , 0 ) --你目前不需要使用此物品
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422893_0]" , 0 )
		return false
	end
	if ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID ) ~= 9 and ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID ) ~= 38 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422893_1]" , 0 ) --此物品只能在[ZONE_MOUNT AL TURAJ]區域內使用
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422893_1]" , 0 )
		return false
	end
	if ReadRoleValue( OwnerID() , EM_RoleValue_IsAttackMode) == 1 or ReadRoleValue( OwnerID() , EM_RoleValue_IsDead ) == 1 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422893_13]" , 0 ) --你無法在目前狀態下使用此物品
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422893_13]" , 0 )
		return false
	end
	return true
end

function LuaI_206451_Use()
	local Flag = 780520
	local Buff = 505482
	SetPosByFlag( OwnerID() , Flag  , 16 )
	ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_422893_14]" , 0 )
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422893_14]" , 0 )
	AddBuff( OwnerID() , Buff , 0 , 180 )
	BeginPlot( OwnerID() , "LuaI_114107_PPLCheck" , 0 )
	UseItemDestroy()
end

function LuaI_114107_0()
	SetPlot( OwnerID() , "range" , "LuaI_114107_1" , 100 )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
end

function LuaI_114107_1()
	if CheckAcceptQuest( OwnerID() , 422893 ) == true and CheckFlag( OwnerID() , 543519 ) == false and ReadRoleValue( TargetID() , EM_RoleValue_Register) == 0 then
		if CheckBuff( OwnerID() , 505482 ) == false then
			local Count = CountBodyItem( OwnerID() , 206451 ) 
			SetPosByFlag( OwnerID() ,780520  , 16 )
			ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_422893_14]" , 0 )
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422893_14]" , 0 )
			AddBuff( OwnerID() , 505482 , 0 , 180 )
			BeginPlot( OwnerID() , "LuaI_114107_PPLCheck" , 0 )
			if Count > 0 then
				DelBodyItem( OwnerID() , 206451 , Count )
			end
		end
		WriteRoleValue( TargetID() , EM_RoleValue_Register , 7 )
		BeginPlot( TargetID() , "LuaI_114107_2" , 0 )
	end
end

function LuaI_114107_PPLCheck()
	for i = 1 , 36 , 1 do
		sleep( 50 )
		if CheckAcceptQuest( OwnerID() , 422893 ) == false then
			CancelBuff_NoEvent( OwnerID() , 505482 )
			break
		end
	end
end

function LuaI_114107_2()
	local Flag = 780520
	local RuffleDick = CreateObjByFlag( 114131 , Flag , 17 , 1 )
	local ManInCape = CreateObjByFlag( 114214 , Flag , 18 , 1 )
	local CheckPoint = LuaFunc_CreateObjbyObj( 112399 , OwnerID() )
	local ShiftBuff = 505469
	SetRoleCamp( ManInCape , "Visitor")
	Lua_ObjDontTouch(RuffleDick) 
	Lua_ObjDontTouch(ManInCape) 
	Lua_ObjDontTouch(CheckPoint) 
	MoveToFlagEnabled( RuffleDick , false )
	MoveToFlagEnabled(ManInCape , false )
	AddToPartition( RuffleDick , 0 )
	AddToPartition( ManInCape , 0 )
	Yell( RuffleDick ,"[SC_422893_2]" , 3 )--[206389]已經拿到手了，照我們交易的內容，你們必須將我的力量再度提升。
	PlayMotion( RuffleDick ,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep( 20 )
	PlayMotion( RuffleDick ,ruFUSION_ACTORSTATE_EMOTE_POINT )
	sleep( 20 )
	AdjustFaceDir( ManInCape,  RuffleDick , 180 ) 
	sleep( 5 )
	Yell(  ManInCape,"[SC_422893_3]" , 3 )--力量……又是個執著力量的狂熱者。
	PlayMotion( ManInCape,ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )
	sleep( 20 )
	AdjustFaceDir( ManInCape,  RuffleDick , 0 ) 
	sleep( 5 )
	PlayMotion( ManInCape,ruFUSION_ACTORSTATE_USE)
	sleep(20)
	local Player = SearchRangePlayer( OwnerID() , 10 )
	for pry , obj in pairs(Player) do
		if CheckID(obj) == true and CheckAcceptQuest( obj , 422893 ) == true and CheckFlag( obj ,  543519 ) == false then
			ScriptMessage( obj , obj , 2 , "[SC_422893_4]" , 0 ) --[102674]丟了個東西給[114131]
			ScriptMessage( obj , obj , 0 , "[SC_422893_4]" , 0 )
		end
	end
	CastSpell( RuffleDick , RuffleDick , 491923 )
	sleep( 10 )
	AddBuff( RuffleDick , ShiftBuff , 0 , -1 )
	sleep( 30 )
	Yell( RuffleDick ,"[SC_422893_5]" , 3 )--你在說什麼？有了力量，才能守護住你所想要的任何東西。
	PlayMotion( RuffleDick ,ruFUSION_ACTORSTATE_EMOTE_IDLE1 )
	sleep( 20 )
	Yell(  ManInCape,"[SC_422893_6]" , 3 )--即使是犧牲生命？
	AdjustFaceDir( ManInCape,  RuffleDick , 0 ) 
	sleep( 5 )
	PlayMotion( ManInCape,ruFUSION_ACTORSTATE_EMOTE_POINT )
	sleep( 10 )
	Yell( RuffleDick  ,"[SC_422893_7]" , 3 )--你在說什麼？
	PlayMotion( RuffleDick  , ruFUSION_ACTORSTATE_HURT_CRITICAL )
	sleep( 10 )
	Yell(  ManInCape,"[SC_422893_8]" , 3 )--經過多次的改造，你的身體已經到了極限了。
	PlayMotion( ManInCape , ruFUSION_ACTORSTATE_EMOTE_IDLE1)
	sleep( 20 )
	Yell( RuffleDick  ,"[SC_422893_9]" , 3 )--怎麼可能？
	PlayMotion( RuffleDick  ,ruFUSION_ACTORSTATE_EMOTE_IDLE0 )
	sleep( 10 )
	Yell(  ManInCape,"[SC_422893_10]" , 3 )--你從沒有懷疑過嗎？在獲得力量的那一瞬，也代表著你生命的衰竭。原本上面的人要我殺了你，但我覺得沒有必要。
	PlayMotion( ManInCape,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep( 30 )
	PlayMotion( ManInCape,ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )
	sleep( 20  )
	LuaFunc_MoveToFlag( ManInCape , Flag, 19 ,0 )	
	Yell(  ManInCape,"[SC_422893_11]" , 3 )--你還沒有注意到你的身體的變化嗎？你剩不了多少時間，我也不想污了我的手。
	PlayMotion( ManInCape,ruFUSION_ACTORSTATE_EMOTE_WAVE )
	sleep( 5 )
	BeginPlot( ManInCape,"LuaI_422893_GO" , 0 )
	Yell( RuffleDick  ,"[SC_422893_12]" , 3 )--什麼意思，你別走……
	LuaFunc_MoveToFlag( RuffleDick , Flag, 19 ,0 )	
	LuaFunc_MoveToFlag( RuffleDick , Flag, 20 ,0 )
	DelObj( RuffleDick )	
	SetPlot( CheckPoint ,"range" , "LuaI_422893_GetKeyItem" ,100 )
	sleep( 10 )
	DelObj( CheckPoint )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
end

function LuaI_422893_GetKeyItem()
	local Buff = 505482
	if CheckAcceptQuest( OwnerID() , 422893 ) == true and CheckBuff( OwnerID() , Buff ) == true then
		SetFlag( OwnerID() , 543519 , 1 )
		CancelBuff_NoEvent( OwnerID() , Buff )
	end
end

function LuaI_422893_GO()
	local Flag = 780520
	LuaFunc_MoveToFlag( OwnerID(), Flag, 20 ,0 )
	DelObj( OwnerID() )
end

function LuaS_114107_0()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 422894 ) == true  then
		AddSpeakOption(  OwnerID(), TargetID( ),  "[SC_422894_0]" ,  "LuaS_114107_1",  0 ) --叫喚[114107]
	end	
end

function LuaS_114107_1()
	CloseSpeak( OwnerID() )
	if ReadRoleValue( TargetID() , EM_RoleValue_Register ) == 0 then
		Yell( TargetID() , "[SC_422894_1]" , 3 ) --你也是來阻礙我的對不對？不管是誰？阻礙我，就只有死！
		BeginPlot( TargetID() , "Lua_422894_PLAY" , 0 )
	end
end

function Lua_422894_PLAY()
	if CheckFlag( TargetID() , 543523 ) == true then
		return
	end
	WriteRoleValue( OwnerID() , EM_RoleValue_Register  , 7 )
	DisableQuest( OwnerID() , true )
	local Me = Role:new( OwnerID() )
	local X , Y , Z , Dir = Me:X() , Me:Y() , Me:Z() , Me:Dir() 
	local RuffleDick = CreateObj( 102941 , X , Y , Z , Dir , 1  )
	Hide( OwnerID() )
	sleep( 10 )
	AddToPartition( RuffleDick , 0 )
	SetPlot( RuffleDick , "dead" , "Lua_422894_Dead" , 0 )
	CallPlot(  RuffleDick , "LuaFunc_Obj_Suicide" , 30 )
	if CheckID( TargetID() ) == true then
		SetAttack( RuffleDick , TargetID() )
	end
	while 1 do
		if CheckID( RuffleDick ) == false then
			break
		end
		sleep( 10 )
	end
	Show( OwnerID() , 0 )
	DisableQuest( OwnerID() , false )
	WriteRoleValue( OwnerID()  , EM_RoleValue_Register  , 0 )
end

function Lua_422894_Dead()
	for i = 1 , HateListCount( OwnerID() ) , 1 do
		local ID = HateListInfo(OwnerID() ,i-1 , EM_HateListInfoType_GItemID )
		if CheckAcceptQuest( ID , 422894 ) == true then
			SetFlag( ID , 543523 , 1 )
			AddBuff(  ID  ,  505468 , 0 , 5 )
		end
	end
	Lua_CancelAllBuff( OwnerID() ) 
	SetStopAttack(OwnerID() )
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_DYING)
	BeginPlot( OwnerID() , "LuaFunc_DeadPlay_Sub" , 0 )
	return false
end

function LuaQ_422895_Complete()
	Addbuff( TargetID() , 504004 , 0 , 120 )
	if ReadRoleValue( OwnerID() , EM_RoleValue_Register ) == 0 then
		local Flag = 780520
		WriteRoleValue( OwnerID() , EM_RoleValue_Register , 7 )
		DisableQuest( OwnerID() , true)
		Hide( OwnerID() )
		local RuffleDick = CreateObjByObj( 114128 , OwnerID() )
		local AntCrown = CreateObjByFlag( 114129 , Flag , 21 , 1 )
		Lua_ObjDontTouch(RuffleDick) 
		Lua_ObjDontTouch(AntCrown) 
		SetDefIdleMotion(RuffleDick ,ruFUSION_MIME_DEATH_LOOP)
		WriteRoleValue(  AntCrown ,EM_RoleValue_IsWalk , 1 )
		MoveToFlagEnabled( AntCrown , false )
		AddToPartition( AntCrown , 0 )
		Yell( AntCrown , "[SC_422895_0]" , 3 ) --這是怎麼回事？
		LuaFunc_MoveToFlag( AntCrown ,Flag , 22 ,0 )
		sleep( 5 )
		AdjustFacedir( AntCrown , RuffleDick , 0 )
		sleep( 5 )
		PlayMotionEX( AntCrown ,ruFUSION_ACTORSTATE_CROUCH_BEGIN,ruFUSION_ACTORSTATE_CROUCH_LOOP)
		sleep( 30 )
		AddBuff( AntCrown , 504936 , 0 , -1 )
		BeginPlot( RuffleDick , "LuaQ_422895_Heal" , 0 )
		sleep( 10 )
		Yell( RuffleDick, "[SC_422895_1]" , 3 ) --隱士？請你施捨你的仁慈吧！我成了我族的恥辱，成為了怪物，請你讓我獲得安息吧。
		sleep( 30 )
		Yell( AntCrown , "[SC_422895_2]" , 3 ) --我會讓你的身體變回原來的樣子。
		sleep( 20 )
		AddBuff(  RuffleDick , 505470 , 0 , -1 )
		local RuffleDick2 = CreateObjByObj( 114282 , OwnerID() )
		Lua_ObjDontTouch(RuffleDick2 ) 
		SetDefIdleMotion(RuffleDick2  ,ruFUSION_MIME_DEATH_LOOP)
		Yell( RuffleDick2 , "[SC_422895_3]" , 3 ) --我做了很多無法挽回的錯事……如果我當初能聽進你所說的話，那麼也許……
		sleep( 20 )
		Yell( AntCrown , "[SC_422895_4]" , 3 ) --現在還不算遲……傾聽自然，你就能與之同步……
		sleep( 20 )
		Yell( RuffleDick2 , "[SC_422895_5]" , 3 ) --不，我的靈魂被沾汙了，無法回應自然，無法獲得真正的安息……
		sleep( 20 )
		Yell( AntCrown , "[SC_422895_6]" , 3 ) --我會引導你，回歸自然，回歸到精靈聖王的懷抱。
		sleep( 20 )
		Yell( AntCrown , "[SC_422895_7]" , 3 ) --聆聽大地與風的詠歎，它將為你獻上祝福，精靈聖王也將為你開啟大道。
		sleep( 30 )
		Yell( RuffleDick2 , "[SC_422895_8]" , 3 ) --它……也會與我同在嗎？
		sleep( 20 )
		writeRolevalue(  RuffleDick , EM_RoleValue_PID , 7 )
		CancelBuff( AntCrown , 504936 )
		Yell( AntCrown , "[SC_422895_9]" , 3 ) --孩子，不要害怕，自然之力將永遠與你同在，你將化為永恆。
		PlayMotion( AntCrown ,ruFUSION_ACTORSTATE_CROUCH_END)
		sleep( 10 )
		CastSpell( RuffleDick , RuffleDick , 492217)
		sleep( 20 )
		CastSpell( RuffleDick ,RuffleDick , 494746 )
		PlayMotion( AntCrown ,ruFUSION_ACTORSTATE_EMOTE_APPROVAL)	
		sleep( 10 )
		DelObj( RuffleDick2)
		Yell( AntCrown , "[SC_422895_11]" , 3 ) --孩子......不要畏懼，大地收回了你的四肢，你才能真正化為自然的一部份。
		sleep( 30 )
		Yell( AntCrown , "[SC_422895_12]" , 3 ) --吟唱生命的哀歌宛若讚美歌...生與死其實並無分別。
		SetDir(  AntCrown , 202 )
		SetPlot( AntCrown,"range" , "LuaQ_422895_Range",150 )
		sleep( 10 )
		DelObj( RuffleDick )
		Delobj( AntCrown )
		Show( OwnerID() , 0 )
		DisableQuest( OwnerID() , false)
		WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
	else
		ScriptMessage( TargetID() , TargetID() , 1 , "[SAY_NPC_BUSY]" , 0 )
		ScriptMessage( TargetID() ,  TargetID() ,0 , "[SAY_NPC_BUSY]" , 0 )
	end
end

function LuaQ_422895_Heal()
	for i = 1 , 20 , 1  do
		if ReadRoleValue( OwnerID() , EM_RoleValue_PID ) == 0 then
			CastSpell( OwnerID() , OwnerID() ,493776 )
		else
			break
		end
		sleep( 25 )
	end
end

function LuaQ_422895_Range()
	if CheckBuff( OwnerID() , 504004 ) == true then
		ScriptMessage( OwnerID() ,OwnerID() , 0 , "[SC_422895_10]" ,"0xFFBE60D2" )--[114111 ]TELL：[$playname]，我都看見、聽見了……我偷偷跟在你們過來……我躲在XXXXXX，你過來找我好嗎？
		CancelBuff_NoEvent( OwnerID() , 504004 )
	end
end