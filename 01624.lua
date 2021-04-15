-----旗子780517
-----543506失敗
-----543507成功

function LuaS_422865_Gulida_Born()

	local OriginalSakis = Lua_DW_CreateObj( "flag" , 114205 ,780517 , 1 )	--咕哩達初始劇情種出沙奇司
	WriteRoleValue ( OwnerID() , EM_RoleValue_PID, OriginalSakis )	
end


function LuaS_422865_Gulida_Again()
	LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest( OwnerID() ,422865 ) == true		and
		CheckFlag( OwnerID(), 543477 )==false			then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422865_25]","LuaS_422865_Gulida_ahaha",0)	--請讓我再次幫助沙奇司，重新召喚湖主之靈
	end
end

function LuaS_422865_Gulida_ahaha()
	CloseSpeak( OwnerID() )
	if CountBodyItem( OwnerID() , 206387 ) == 0 and CountBodyItem( OwnerID() , 206390 ) == 0 then
		GiveBodyItem( OwnerID() , 206387 , 1 )
	end
	BeginPlot( TargetID() , "LuaS_422865" , 0 )
end


function LuaS_422865()
	
	if	ReadRoleValue( OwnerID() ,EM_RoleValue_Register  ) == 0	then
		Say(OwnerID() , "[SC_422865_0]")		
		WriteRoleValue( OwnerID() , EM_RoleValue_Register , 1 )	
		BeginPlot( OwnerID() , "LuaS_422865_1" , 0 )
	else
		Say(OwnerID() , "[SC_422865_1]")		
	end
end

function LuaS_422865_1()
	local OriginalSakis = ReadRoleValue( OwnerID() ,EM_RoleValue_PID  ) 
	Hide(OriginalSakis)
	local Sakis = CreateObjByFlag( 114072 , 780517 , 1 , 0 )		--沙奇司
	local Wind = CreateObjByFlag( 114074 , 780517 , 2 , 0 )		--風的隱形球
	local Earth = CreateObjByFlag( 114075 , 780517 , 3 , 0 )		--土的隱形球（種在風跟火中間）
	local Fire = CreateObjByFlag( 114092 , 780517 , 4 , 0 )		--火的隱形球
	AddToPartition( Sakis , 0 )
	AddToPartition( Wind , 0 )
	AddToPartition( Earth , 0 )
	AddToPartition( Fire , 0 )
	Lua_ObjDontTouch( Wind)			--不會顯示頭像框以及名字，也不能被碰觸
	Lua_ObjDontTouch( Earth) 
	Lua_ObjDontTouch( Fire) 
	MoveToFlagEnabled( Sakis , false)

	LuaFunc_MoveToFlag( Sakis , 780517 , 6  ,  0 )
	Say( Sakis , "[SC_422865_2]")		--(沙奇司告訴玩家他要開始儀式)
	sleep(20)
	AdjustFaceDir( Sakis, Wind, 0 )
	SetFightMode ( Sakis ,0 ,0 ,0 ,0 )

	PlayMotion(Sakis , ruFUSION_ACTORSTATE_CAST_BEGIN)
	sleep(30)
	PlayMotion(Sakis , ruFUSION_ACTORSTATE_CAST_END)
	PlayMotion(Sakis , ruFUSION_ACTORSTATE_CAST_INSTANT)
	Say( Sakis , "[SC_422865_3]")		--(沙奇司召喚風之靈的對話)
	AddBuff( Wind ,  505463, 0 , -1 )		--在風的隱形球上出現特效
	PlayMotion(Sakis , ruFUSION_ACTORSTATE_BUFF_BEGIN)
	sleep(20)
	AddBuff( Wind ,  505452 , 0 , -1 )		--風特效放大2
	sleep(20)
	AddBuff( Wind ,  505453 , 0 , -1 )		--風特效放大3
	sleep(20)
	PlayMotion(Sakis , ruFUSION_ACTORSTATE_BUFF_END)
	sleep(30)

	AdjustFaceDir( Sakis, Earth, 0 )
	PlayMotion(Sakis , ruFUSION_ACTORSTATE_CAST_BEGIN)
	sleep(30)
	PlayMotion(Sakis , ruFUSION_ACTORSTATE_CAST_END)
	PlayMotion(Sakis , ruFUSION_ACTORSTATE_CAST_INSTANT)
	Say( Sakis , "[SC_422865_4]")		--(沙奇司召喚土之靈的對話)
	AddBuff( Earth ,  505462, 0 , -1 )		--在土的隱形球上出現特效
	PlayMotion(Sakis , ruFUSION_ACTORSTATE_BUFF_BEGIN)
	sleep(20)
	AddBuff( Earth ,  505452 , 0 , -1 )		--土特效放大2
	sleep(20)
	AddBuff( Earth ,  505453 , 0 , -1 )		--土特效放大3
	sleep(20)
	PlayMotion(Sakis , ruFUSION_ACTORSTATE_BUFF_END)
	sleep(30)

	AdjustFaceDir( Sakis, Fire, 0 )
	PlayMotion(Sakis , ruFUSION_ACTORSTATE_CAST_BEGIN)
	sleep(30)
	PlayMotion(Sakis , ruFUSION_ACTORSTATE_CAST_END)
	PlayMotion(Sakis , ruFUSION_ACTORSTATE_CAST_INSTANT)
	Say( Sakis , "[SC_422865_5]")		--(沙奇司召喚火之靈的對話)
	AddBuff( Fire ,  505471 , 0 , -1 )		--在火的隱形球上出現特效
	PlayMotion(Sakis , ruFUSION_ACTORSTATE_BUFF_BEGIN)
	sleep(20)
	AddBuff( Fire ,  505453 , 0 , -1 )		--火特效放大3
	sleep(20)
	AddBuff( Fire ,  505455 , 0 , -1 )		--火特效放大5
	sleep(20)
	PlayMotion(Sakis , ruFUSION_ACTORSTATE_BUFF_END)
	sleep(30)
	SetFightMode ( Sakis ,0 ,1 ,0 ,0 )

	AdjustFaceDir( Sakis, Earth, 0 )
	PlayMotion(Sakis , ruFUSION_ACTORSTATE_CAST_BEGIN)
	sleep(30)
	PlayMotion(Sakis , ruFUSION_ACTORSTATE_CAST_END)
	PlayMotion(Sakis , ruFUSION_ACTORSTATE_CAST_INSTANT)
	Say( Sakis , "[SC_422865_6]")		--(沙奇司呼喚小小的水之靈的對話)
	sleep(30)
	local Water = CreateObjByFlag( 114203 , 780517 , 5 , 0 )		--水的隱形球
	AddToPartition( Water , 0 )
	WriteRoleValue( Water , EM_RoleValue_PID , Sakis )
	AddBuff( Water ,  505464 , 0 , -1 )		--在水的隱形球上出現特效
	sleep(20)
	AddBuff( Water ,  505451 , 0 , -1 )	
	BeginPlot( Water , "LuaS_422865_Water_CHECK" , 0 )
	SetFightMode ( Sakis ,0 ,1 ,0 ,0 )

	Say( Sakis , "[SC_422865_7]")		--(沙奇司開始跳舞的碎碎念)
	PlayMotion(Sakis , ruFUSION_ACTORSTATE_EMOTE_IDLE1)
	BeginPlot( Sakis , "LuaS_422865_Sakis_CHECK" , 0 )
	while true do
		sleep(20)
		PlayMotion(Sakis , ruFUSION_ACTORSTATE_EMOTE_IDLE0)
		sleep(20)
		PlayMotion(Sakis , ruFUSION_ACTORSTATE_EMOTE_IDLE1)
		if	ReadRoleValue( Sakis ,EM_RoleValue_Register) > 0	then
			SetFlag(Sakis , 543506 , 1 )		--時間到，任務失敗
			break
		end
		if	CheckBuff( Water , 505455 )== true	then
			SetFlag(Sakis , 543507 , 1 )		--召喚完成，任務成功
			break
		end
		if	CheckFlag( Sakis ,543506 )== true	  	then	--水消失時得到的旗標
			break
		end	
	end

	if	CheckFlag( Sakis ,543506 )== true		then
		Say(Sakis, "[SC_422865_8]")			--儀式失敗的廢話
		Delobj( Water )
		sleep(30)
		LuaFunc_MoveToFlag( Sakis , 780517 , 1  ,  0 )
		Delobj( Fire )
		Delobj( Wind )
		Delobj( Earth )
		Delobj( Sakis )
		Show(  OriginalSakis  , 0 )
		BeginPlot( OwnerID() , "LuaS_422865_Quest_Fail" , 0 )
	end

	if	CheckFlag( Sakis ,543507 )== true		then
		Say(Sakis, "[SC_422865_9]")			--儀式成功的廢話
		Lua_ObjDontTouch( Water )	
		sleep(30)
		LuaFunc_MoveToFlag( Sakis , 780517 , 1  ,  0 )
		Delobj( Water )
		Delobj( Fire )
		Delobj( Wind )
		Delobj( Earth )
		Delobj( Sakis )
		Show(  OriginalSakis  , 0 )
		BeginPlot( OwnerID() , "LuaS_422865_Quest_Success" , 0 )
	end
end

function LuaS_422865_Sakis_CHECK()

	local Time = 0
	for i = 0 , 500 , 1 do
		sleep( 20 )
		Time = Time + 1
		if	Time  >  300	then
			WriteRoleValue( OwnerID() , EM_RoleValue_Register , 1 )		--超過時間
			break
		end

		if	CheckFlag( OwnerID() , 543507) == true	or
			CheckFlag( OwnerID() , 543506) == true	then		--任務成功後，不再計時
			break
		end
	end
end

function LuaS_422865_Water_CHECK()
	local Sakis = ReadRoleValue(OwnerID(), EM_RoleValue_PID )
	local Water = 0
	local OLDWater = 0
	local Num = 0
	for i = 0 , 200 , 1 do
		sleep(50)
		OLDWater = Water
		Water = ReadRoleValue(OwnerID(), EM_RoleValue_Register )
		if	OLDWater > Water	then
			Say(Sakis, "[SC_422865_10]")			--水變小了之類的對話
			Num = 0

		elseif	OLDWater < Water	then
			Say(Sakis, "[SC_422865_11]")			--做得很好，繼續保持之類的對話
			Num = 0
		else
			Say(Sakis, "[SC_422865_12]")			--水沒變時的廢話
			Num = Num + 1
			if	Num > 15	then
				if	CheckBuff(OwnerID(), 505454 ) == true	then	--第四層
					AddBuff( OwnerID() ,  505453 , 0 , -1 )		--改上第三層

				elseif	CheckBuff(OwnerID(), 505453 ) == true	then	--第三層
					AddBuff( OwnerID() ,  505452 , 0 , -1 )		--改上第二層

				elseif	CheckBuff(OwnerID(), 505452 ) == true	then	--第二層
					AddBuff( OwnerID() ,  505451 , 0 , -1 )		--改上第一層

				elseif	CheckBuff(OwnerID(), 505451 ) == true	then	--第一層
					CancelBuff(OwnerID() , 505451 )			--刪掉第一層
					SetFlag(Sakis , 543506 , 1 )			--水滅了，任務失敗
				end

				Num = 0
			end
		end
		Sleep( 30 )
		if	CheckBuff(OwnerID(), 505451 ) == true	then
			Say(Sakis, "[SC_422865_13]")			--第一層小水的對話
		end

		if	CheckBuff(OwnerID(), 505452 ) == true	then
			Say(Sakis, "[SC_422865_14]")			--第二層小水的對話
		end

		if	CheckBuff(OwnerID(), 505453 ) == true	then
			Say(Sakis, "[SC_422865_15]")			--第三層小水的對話
		end

		if	CheckBuff(OwnerID(), 505454 ) == true	then
			Say(Sakis, "[SC_422865_16]")			--第四層小水的對話
		end

		if	CheckBuff(OwnerID(), 505455 ) == true	then
			Say(Sakis, "[SC_422865_17]")			--第五層小水的對話
			break
		end
		if	CheckFlag( Sakis , 543506) == true	then
			break
		end
	end
end

function LuaS_422865_USE_CHECK()
	if	ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 114056	then		--盛湖水的空容器
		if	CountBodyItem( OwnerID(), 206387 )>0	or
			CountBodyItem( OwnerID(), 206390 )>0	then
			ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_422865_18]", 0 )		--你的身上已經有一個空容器
			return false
		else
			return true
		end

	elseif	ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 114073	then		--點擊水面
		if	CountBodyItem( OwnerID(), 206387 )>0	then
			return true
		else
			ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_422865_19]", 0 )		--你需要一個汲水的空容器
			return false
		end
	else
--		if	ReadRoleValue( TargetID() , EM_RoleValue_Register2  ) == 0 	then
			if	CheckAcceptQuest(OwnerID(),422865)==true	and
				CheckCompleteQuest( OwnerID(),422865)==false	then
--				if	CountBodyItem( OwnerID(),206390) >0	then
--					WriteRoleValue( TargetID() , EM_RoleValue_Register2 , 1 )
--					BeginPlot( TargetID() , "LuaS_422865_USE_WATEROK" , 0 )
--					return false
--				end
				if	CountBodyItem( OwnerID(),206390) <1	and
					CheckFlag( OwnerID(), 543477 )==false	then
					ScriptMessage( OwnerID() , OwnerID(), 1, "[SC_422865_20]" , 0 )		--你缺少盛滿水的容器
					return false
				end
				if	CheckFlag( OwnerID(),543477 )== true	  	then	
					ScriptMessage( OwnerID() , OwnerID(), 1, "[SC_422865_21]" , 0 )		--你已經幫助過沙奇司
					return false
				end
				return	true
			end
--		else
--			say(OwnerID(),ReadRoleValue( TargetID() , EM_RoleValue_Register2  ) )
--			ScriptMessage( OwnerID() , OwnerID(), 1, "[SC_422865_22]" , 0 )				--目標正被使用中
--			return false
--		end
	end
end

function LuaS_422865_USE_OK()
	if	ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 114073	then
		SetFlag(OwnerID() , 543502 , 1 )			--曾經汲取過水	
		DelBodyItem ( OwnerID(),206387 , 1 )
		return	true
	elseif
		ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 114203	then
--		WriteRoleValue( TargetID() , EM_RoleValue_Register2 , 0 )
		ScriptMessage( OwnerID() , OwnerID(), 1, "[SC_422865_26]" , 0 )				--注力中
		DelBodyItem ( OwnerID(),206390 , 1 )
--		GiveBodyItem( TargetID(), 206387, 1 )
		if	CheckBuff(TargetID(), 505454 ) == true	then	--第四層
			AddBuff( TargetID() ,  505455 , 0 , -1 )		--上第五層
			WriteRoleValue( TargetID() , EM_RoleValue_Register , 5 )
			return	true

		elseif	CheckBuff(TargetID(), 505453 ) == true	then	--第三層
			AddBuff( TargetID() ,  505454 , 0 , -1 )		--上第四層
			WriteRoleValue( TargetID() , EM_RoleValue_Register , 4 )
			return	true

		elseif	CheckBuff(TargetID(), 505452 ) == true	then	--第二層
			AddBuff( TargetID() ,  505453 , 0 , -1 )		--上第三層
			WriteRoleValue( TargetID() , EM_RoleValue_Register , 3 )
			return	true

		elseif	CheckBuff(TargetID(), 505451 ) == true	then	--第一層
			AddBuff( TargetID() ,  505452 , 0 , -1 )		--上第二層
			WriteRoleValue( TargetID() , EM_RoleValue_Register , 2 )
			return	true

		else
			AddBuff( TargetID() ,  505451 , 0 , -1 )		--上第一層
			WriteRoleValue( TargetID() , EM_RoleValue_Register , 1 )
			return	true
		end
	else
		return	true
	end
end

function LuaS_422865_Quest_Fail()

 	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local PPL = SetSearchAllPlayer(RoomID)
	for i = 1 , PPL , 1 do 
		local Player = GetSearchResult()
		if	CheckAcceptQuest( Player ,422865 ) == true	and
			CheckFlag( Player, 543477 )==false		and
			CheckFlag( Player, 543502 )==true		then
			ScriptMessage( Player , Player , 1 , "[SC_422865_23]" , 0 )		--(湖主之靈召喚失敗！)
			SetFlag(Player , 543502 , 0 )
			if	CountBodyItem( Player, 206390 )>0	then
				DelBodyItem ( Player , 206390 , CountBodyItem( Player, 206390 ) )
			end		
		end
	end
 	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )	
end

function LuaS_422865_Quest_Success()

 	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local PPL = SetSearchAllPlayer(RoomID)
	for i = 1 , PPL , 1 do 
		local Player = GetSearchResult()
		if	CheckAcceptQuest( Player ,422865 ) == true	and
			CheckFlag( Player, 543477 )==false		and
			CheckFlag( Player, 543502 )==true		then
			ScriptMessage( Player , Player , 1 , "[SC_422865_24]" , 0 )		--(湖主之靈召喚成功！)
			SetFlag(Player , 543502 , 0 )
			SetFlag(Player , 543477 , 1 )
			if	CountBodyItem( Player, 206390 )>0	then
				DelBodyItem ( Player , 206390 , CountBodyItem( Player, 206390 ) )
			end
			if	CountBodyItem( Player, 206387 )>0	then
				DelBodyItem ( Player , 206387 , CountBodyItem( Player, 206387 ) )
			end		
		end
	end
 	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )	
end








