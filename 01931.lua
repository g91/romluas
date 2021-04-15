function LuaS_423367_0()
	LoadQuestOption( OwnerID() )
	if	(CheckAcceptQuest(OwnerID(),423367)==true )and( CheckCompleteQuest( OwnerID(),423367)==false) and	CheckFlag( OwnerID() , 544281) ==false	then
		if 	(ReadRoleValue( TargetID() , EM_RoleValue_Register+1 ) == 0)	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423367_0]","LuaS_423367_1",0)	--我已經準備好了。
			else
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423367_0]","LuaS_423367_2",0)	--我已經準備好了。
		end
	end
end

function LuaS_423367_2()
	SetSpeakDetail(OwnerID(),"[SC_423367_1]")	--安：嗯，還有幾位朋友尚未到來，他們來自各處。     								
end

function LuaS_423367_1()
	CloseSpeak(OwnerID())
	if 	(ReadRoleValue( TargetID() , EM_RoleValue_Register+1 ) == 0)	then
		WriteRoleValue(TargetID() , EM_RoleValue_Register+1,1 )
		BeginPlot(TargetID(),"LuaS_423367_3",0 )
	end
end

function LuaS_423367_3()
	Yell( OwnerID(), "[SC_423367_2]" , 3 )		
	sleep(20)
	local ANT = Lua_DW_CreateObj("flag" ,115933,780694,1,1)				--出現演戲的安特
	DisableQuest(  ANT , true )								--開關NPC頭上的任務提示以及對話劇情(true關閉)
	MoveToFlagEnabled( ANT , false )
	WriteRoleValue(  ANT ,EM_RoleValue_IsWalk , 1 )
	WriteRoleValue(  ANT ,EM_RoleValue_Register+2,TargetID())				--把玩家寫進安特
	WriteRoleValue(  ANT ,EM_RoleValue_Register+3,OwnerID())				--把原始ANT寫進演戲安特

	BeginPlot(ANT , "LuaS_423367_Range_CHECK" , 0 )					--任務檢查！！
	Setposbyflag(TargetID(), 780694, 7 ) 							--傳送玩家，旗子編號780694、7
	sleep(10)
	if 	CheckAcceptQuest( TargetID() , 423367) == true		and
		GetDistance(TargetID(), ANT  ) < 300		and 
		ReadRoleValue(TargetID() ,EM_RoleValue_IsDead) == 0	then
		AddBuff( TargetID()  , 507183 , 1 , 180 )						
	end
	
	BeginPlot(ANT, "LuaS_423367_4_LOOP" , 0 )
end

function LuaS_423367_4_LOOP()
	local player = ReadRoleValue(OwnerID(),EM_RoleValue_Register+2)	
	local QANT = ReadRoleValue(OwnerID(),EM_RoleValue_Register+3)

	local ELY = Lua_DW_CreateObj("flag" ,115934,780694,2,1)				--115934伊利雅爾、旗子編號780694、2
	DisableQuest(  ELY , true )								--開關NPC頭上的任務提示以及對話劇情(true關閉)
	MoveToFlagEnabled( ELY , false )
	WriteRoleValue(  ELY ,EM_RoleValue_IsWalk , 1 )
	WriteRoleValue(  OwnerID(),EM_RoleValue_Register+4,ELY)				--把演戲伊利寫進演戲安特
	WriteRoleValue(  ELY,EM_RoleValue_Register+3,OwnerID())				--把演戲安特寫進演戲伊利雅爾
	WriteRoleValue(  ELY,EM_RoleValue_Register+2,player )					--把玩家寫進伊利雅爾
	BeginPlot(ELY, "LuaS_423367_MO_CHECK" , 0 )					--掛伊利迴圈檢查--演戲安特不在就刪除伊利
	BeginPlot(ELY, "LuaS_423367_ELY" , 0 )						--妖精行動							
	sleep(40)
	Yell( OwnerID(), "[SC_423367_3]" , 3 )							--專注於你將進行的事。					
	sleep(10)
	LuaFunc_MoveToFlag(OwnerID(), 780694,4,0)						--安、伊利走向繁星湧泉780694,4
	BeginPlot(  ELY, "LuaS_423367_MOVE" , 0 )
	sleep(10)
	PlayMotionEX(OwnerID(),ruFUSION_ACTORSTATE_CAST_BEGIN , ruFUSION_ACTORSTATE_CAST_LOOP)	--安施法動作
--	SetDefIdleMotion(OwnerID(),ruFUSION_MIME_CAST_BEGIN)
	sleep(20)
	local BOX= Lua_DW_CreateObj("flag" ,115966,780694,11,1)				--115966、旗子編號780694、11
	SetModeEX( BOX, EM_SetModeType_Mark , false )
	WriteRoleValue(  OwnerID(),EM_RoleValue_Register+7,BOX)				--把演戲BOX寫進演戲安特
	WriteRoleValue(  BOX,EM_RoleValue_Register+3,OwnerID())				--把演戲安特寫進特效
	BeginPlot(BOX, "LuaS_423367_MO_CHECK" , 0 )
	Lua_ObjDontTouch( BOX)
	sleep(10)
	CastSpell( OwnerID(), BOX, 495601)							--ANT身上出現施法特效
	sleep(20)

	local STAR = Lua_DW_CreateObj("flag" ,115935,780694,3,1)				--地上種出(or client顯示)六芒星台115935旗子編號780694、3
	DisableQuest(  STAR , true )								--開關NPC頭上的任務提示以及對話劇情(true關閉)
	SetModeEX( STAR , EM_SetModeType_Mark , false )
--	SetModeEX( STAR , EM_SetModeType_Obstruct , true )
	MoveToFlagEnabled( STAR , false )
	WriteRoleValue(  STAR ,EM_RoleValue_IsWalk , 1 )
	WriteRoleValue(  OwnerID(),EM_RoleValue_Register+5,STAR)				--把六芒星寫進演戲安特
	WriteRoleValue(  ELY,EM_RoleValue_Register+2,STAR)					--把六芒星寫進演戲伊利
	WriteRoleValue(  STAR,EM_RoleValue_Register+3,OwnerID())				--把演戲安特寫進演戲六芒星	
	BeginPlot(STAR, "LuaS_423367_MO_CHECK" , 0 )					--掛六芒星迴圈檢查--演戲安特不在就刪除

	local POINT = Lua_DW_CreateObj("flag" ,115936,780694,10,1)				--115936、旗子編號780694、10
	WriteRoleValue(  OwnerID(),EM_RoleValue_Register+6,POINT )				--把點擊寫進演戲安特
	WriteRoleValue(  POINT ,EM_RoleValue_Register+3,OwnerID())				--把演戲安特寫進點擊
	BeginPlot(POINT , "LuaS_423367_MO_CHECK" , 0 )

	WriteRoleValue(  POINT ,EM_RoleValue_Register+1,BOX)					--把特效寫進點擊
	
	sleep(20)
	Yell( OwnerID(), "[SC_423367_4]" , 3 )							--安：[$playername]，盡你所能，維持風的運行。
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_CAST_END)
	sleep(30)
	LuaFunc_MoveToFlag(OwnerID(), 780694,5,0)						--安站上一角(拿奇茲那司的劍)
	AdjustFaceDir( OwnerID(), STAR, 0 )
	sleep(10)
	--SetDefIdleMotion(OwnerID(),ruFUSION_MIME_RUN_CHARGE)
	
	--PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_CAST_INSTANT)
	PlayMotionEX(OwnerID(),ruFUSION_ACTORSTATE_CAST_BEGIN , ruFUSION_ACTORSTATE_CAST_LOOP)
	--維持一個類似插劍在地上的動作
	local Time = 0
	for i = 1, 75 , 1 do									--時間到就刪除其餘NPC，回復原狀
	Time = Time + 1
	
		if	CheckID( player  ) == false or ReadRoleValue( player  , EM_RoleValue_IsDead ) == 1 		then
			WriteRoleValue( QANT   , EM_RoleValue_Register+1 , 0 )
			DelObj (OwnerID())
			if	CheckBuff( player   , 507183) == true	then
				CancelBuff( player   , 507183)  
			end
			if	CheckFlag( player   , 544283 ) == true	then
				SetFlag( player   , 544283 , 0 )
			end
			break
		end

		if	Time==2	or	Time==4	or	Time==6		then
			if	CheckBuff(player   , 507184) == false	and	CheckBuff(player   , 507205) == false	then
				ScriptMessage(player  ,player  ,2,"[SC_423367_8]",0)		--觸碰六芒星陣，驅動風的運行
				ScriptMessage(player  ,player  ,0,"[SC_423367_8]",0)
				sleep(20)
			end
		end
		if	Time>5		then
			if	CheckBuff(player   ,507205) == true	then
				ScriptMessage(player  ,player  ,1,"[SC_423367_5]",0)			--風的運行趨於停滯......
				ScriptMessage(player  ,player  ,0,"[SC_423367_5]",0)			--風的運行趨於停滯......
				sleep(20)
			end		
		end

		if	Time>8		then
			if	(CheckBuff(player  , 507184) == false)	and	(CheckBuff(player  , 507205) == false)	then
				ScriptMessage(player ,player ,1,"[SC_423367_6]",0)		--毀壞禁忌符文的儀式失敗，必須等待下次機會！
				ScriptMessage(player ,player ,0,"[SC_423367_6]",0)
				WriteRoleValue( QANT   , EM_RoleValue_Register+1 , 0 )
				DelObj (OwnerID())
				if	CheckBuff( player  , 507183) == true then
					CancelBuff( player  , 507183)  
				end
				if	CheckFlag( player  , 544283 ) == true	then
					SetFlag( player  , 544283 , 0 )
				end
				break
			end
		end
		
		if	Time==10		then
			if	(CheckBuff(player  , 507184) == true)	or	(CheckBuff(player  , 507205) == true)	then
				Yell( OwnerID(), "[SC_423367_10]" , 3 )						
			end
		end


		if	Time==20		then
			if	(CheckBuff(player  , 507184) == true)	or	(CheckBuff(player  , 507205) == true)	then
				Yell( OwnerID(), "[SC_423367_11]" , 3 )						
			end
		end

		if	Time==30		then
			if	(CheckBuff(player  , 507184) == true)	or	(CheckBuff(player  , 507205) == true)	then
				Yell( OwnerID(), "[SC_423367_12]" , 3 )						
			end
		end

		if	Time>40		then
			if	(CheckBuff(player   , 507184) == true)	or	(CheckBuff(player   , 507205) == true)	then
				if	CheckFlag( player   , 544283 ) == false 	then
					SetFlag( player   , 544283 , 1 )
				end
			end
		end	

		if	CheckFlag( player   , 544283 ) == true 	then
			PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_CAST_END)
			BeginPlot( OwnerID(), "LuaS_423367_4" , 0 )		
			break		
		end
		sleep(20)
	end
end

function LuaS_423367_Range_CHECK()
	local QANT = ReadRoleValue(OwnerID(),EM_RoleValue_Register+3)	
	local play  = ReadRoleValue(OwnerID(),EM_RoleValue_Register+2)	
	local Num
	for i = 0 , 180 , 1 do
		Num = 0
			if	CheckAcceptQuest( play, 423367) == true	then
				Num = Num + 1
			end
		if	Num == 0		then
			break
		end
		sleep(20)
	end
		if	CheckFlag( play  , 544283 ) == true	then
			SetFlag( play  , 544283 , 0 )
		end
	sleep(10)
		if 	CheckBuff( play  , 507183) == true	then
			CancelBuff( play  , 507183)  
		end
		if 	CheckBuff( play  , 507184) == true	then
			CancelBuff( play  , 507184)  
		end
		if 	CheckBuff( play  , 507205) == true	then
			CancelBuff( play  , 507205)  
		end
	WriteRoleValue( QANT, EM_RoleValue_Register+1 , 0 )
	Setposbyflag(play  , 780694, 6 ) 						--傳送玩家回原地，旗子編號780694、6
	Delobj( OwnerID() )
end

function LuaS_423367_BUFF_CHECK()
	local Num
	for i = 0 , 20 , 1 do
		Num = 0
			if	CheckAcceptQuest( OwnerID(), 423367) == true	then
				Num = Num + 1
			end
		if	Num == 0		then
			break
		end
		sleep(20)
	end
		if	CheckFlag( play  , 544283 ) == true	then
			SetFlag( play  , 544283 , 0 )
		end
		if 	CheckBuff( OwnerID(), 507183) == true	then
			CancelBuff( OwnerID(), 507183)  
		end
	return false	
end


function LuaS_423367_Player_CHECK()
	if	(CheckAcceptQuest(OwnerID(),423367)==false )	then
		if 	CheckBuff( OwnerID(), 507183) == true	then
			CancelBuff( OwnerID() , 507183)  
		end
		return false
	end
	local ANT= {}
	ANT= SearchRangeNPC(OwnerID() , 30000)
	for i=0,table.getn(ANT)-1 do
		if	ReadRoleValue(ANT[i] , EM_RoleValue_OrgID) == 115933		then
			return false
		end
		if	i == table.getn(ANT)	then
			return true
		end
	end
end

function LuaS_423367_Player_CHECK_FINAL()
	CancelBuff( OwnerID() , 507183)
	ScriptMessage(OwnerID() , OwnerID() , 2 , "[SC_423177_10]" , 0 )				--距離太遠，任務失敗！
	ScriptMessage( OwnerID() , OwnerID(), 0 , "[SC_423177_10]" , 0 )
	SetFlag(OwnerID() , 544301, 0 )
end


function LuaS_423367_4()
	local player=ReadRoleValue( OwnerID() , EM_RoleValue_Register+2 )
	local QANT=ReadRoleValue( OwnerID() , EM_RoleValue_Register+3 )
	local ELY	=ReadRoleValue( OwnerID() , EM_RoleValue_Register+4 )		
	local STAR=ReadRoleValue( OwnerID() , EM_RoleValue_Register+5 )
	local POINT =ReadRoleValue( OwnerID() , EM_RoleValue_Register+6 )
	local BOX=ReadRoleValue( OwnerID() , EM_RoleValue_Register+7 )
	Lua_ObjDontTouch( POINT ) 
	local WATER = Lua_DW_CreateObj("flag" ,115966,780694,12,1)
	WriteRoleValue(  WATER ,EM_RoleValue_Register+3,OwnerID())				--把演戲安特寫進特效	
	BeginPlot(WATER , "LuaS_423367_MO_CHECK" , 0 )					--掛特效迴圈檢查--演戲安特不在就刪除
	SetModeEX( WATER , EM_SetModeType_Mark , false )
	
	sleep(10)
	AdjustFaceDir( OwnerID(), WATER , 0 )

	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_POINT)				--安舉劍指向繁星湧泉
	AddBuff( WATER ,  505453 , 0 , -1 )							--特效放大3

	PlayMotion(ELY,ruFUSION_ACTORSTATE_CAST_END)
	sleep(20)
	DelObj (POINT )
	DelObj (BOX)
	CastSpell( OwnerID(), WATER , 495598)	
	sleep(10)
	CastSpell( STAR, STAR, 495601)					--STAR身上出現施法特效，最後一個特效從六芒星正中央冉冉上升，繁星湧泉種出爆裂特效
	sleep(20)
	DelObj (STAR)
	AddBuff( WATER   , 501119, 1 , 5 )	
	sleep(10)
	DelObj (WATER )
	AdjustFaceDir( ELY , STAR, 0 )
	Yell( ELY , "[SC_423367_7]" , 3 )							--伊利：結束了...一切...
	sleep(10)
	if	CheckFlag( player, 544281 ) == false	then
		SetFlag( player, 544281 , 1 )
	end

	if	(CheckBuff(player, 507184) == true)	then
		CancelBuff( player, 507184)  
	end

	if	CheckBuff( player, 507183) == true	then
		CancelBuff( player, 507183)  
	end
	sleep(20)
	if	(CheckBuff(player, 507205) == true)	then
		CancelBuff( player, 507205)  
	end
	DelObj (OwnerID())
	Setposbyflag(player, 780694, 6 ) 							--傳送玩家回原地，旗子編號780694、6
	WriteRoleValue( QANT, EM_RoleValue_Register+1 , 0 )
end

function LuaS_423367_MOVE()
	LuaFunc_MoveToFlag(OwnerID(), 780694,5,0)
	sleep(10)
	LuaFunc_MoveToFlag(OwnerID(), 780694,8,0)						--伊利站上一角
end

function LuaS_423367_MO_CHECK()	
	local ANT = ReadRoleValue(OwnerID(),EM_RoleValue_Register+3)				--演戲安特
	for i = 0 , 180 , 1 do
		if	CheckID(ANT ) == false	then
			break
		end
		sleep( 20 )
	end
	Delobj( OwnerID() )
end

function LuaS_423367_ELY()								--妖精行動
	local player = ReadRoleValue(OwnerID(),EM_RoleValue_Register+2)				--必須知道玩家
	local Time = 0
	for i = 1, 20 , 1 do							
	Time = Time + 1
										
		if	Time>5		then
			if	(CheckBuff(player  , 507184) == true)	or	(CheckBuff(player  , 507205) == true)	then
				BeginPlot( OwnerID(), "LuaS_423367_ELY_LOOP" , 0 )		
				break		
			end
		end
	sleep(20)
	end
end

function LuaS_423367_ELY_LOOP()								--在伊利身上跑的劇情
		local STAR= ReadRoleValue(OwnerID(),EM_RoleValue_Register+4)
		PlayMotionEX(OwnerID(),ruFUSION_ACTORSTATE_CAST_BEGIN, ruFUSION_ACTORSTATE_CAST_LOOP)	
		local spiritA = Lua_DW_CreateObj("flag" ,115937,780695,1,1)				--115937火妖精、旗子編號780695、1
		DisableQuest(spiritA , true )								--開關NPC頭上的任務提示以及對話劇情(true關閉)
		MoveToFlagEnabled( spiritA , false )
		SetModeEX( spiritA , EM_SetModeType_Mark , false )
		WriteRoleValue(  spiritA ,EM_RoleValue_IsWalk , 1 )
		WriteRoleValue(  spiritA,EM_RoleValue_Register+3,OwnerID())				--把演戲伊利寫進演戲火妖精
		BeginPlot(  spiritA, "LuaS_423367_ELY_CHECK" , 0 )					--掛火妖精迴圈檢查--伊利不在就刪除火妖精
		BeginPlot(  spiritA, "LuaS_423367_SA_MOVE" , 0 )					--移動

		sleep(20)
	
		local spiritB = Lua_DW_CreateObj("flag" ,115938,780695,2,1)				--115938水妖精、旗子編號780695、2
		DisableQuest(spiritB , true )								--開關NPC頭上的任務提示以及對話劇情(true關閉)
		MoveToFlagEnabled( spiritB , false )
		SetModeEX( spiritB  , EM_SetModeType_Mark , false )
		WriteRoleValue(  spiritB ,EM_RoleValue_IsWalk , 1 )
		WriteRoleValue(  spiritB,EM_RoleValue_Register+3,OwnerID())				--把演戲伊利寫進演戲火妖精
		BeginPlot(  spiritB, "LuaS_423367_ELY_CHECK" , 0 )					--掛水妖精迴圈檢查--伊利不在就刪除水妖精
		BeginPlot(  spiritB, "LuaS_423367_SB_MOVE" , 0 )					--移動
		
		sleep(20)

		local spiritC = Lua_DW_CreateObj("flag" ,115949,780695,3,1)				--115938闇妖精、旗子編號780695、3
		DisableQuest(spiritC , true )								--開關NPC頭上的任務提示以及對話劇情(true關閉)
		MoveToFlagEnabled( spiritC , false )
		SetModeEX( spiritC , EM_SetModeType_Mark , false )
		WriteRoleValue(  spiritC ,EM_RoleValue_IsWalk , 1 )
		WriteRoleValue(  spiritC,EM_RoleValue_Register+3,OwnerID())				--把演戲伊利寫進演戲闇妖精
		BeginPlot(  spiritC, "LuaS_423367_ELY_CHECK" , 0 )					--掛闇妖精迴圈檢查--伊利不在就刪除闇妖精
		BeginPlot(  spiritC, "LuaS_423367_SC_MOVE" , 0 )					--移動
		
		sleep(20)

		local spiritD = Lua_DW_CreateObj("flag" ,115950,780695,4,1)				--115938風妖精、旗子編號780695、4
		DisableQuest(spiritD , true )								--開關NPC頭上的任務提示以及對話劇情(true關閉)
		MoveToFlagEnabled( spiritD , false )
		SetModeEX( spiritD , EM_SetModeType_Mark , false )
		WriteRoleValue(  spiritD ,EM_RoleValue_IsWalk , 1 )
		WriteRoleValue(  spiritD,EM_RoleValue_Register+3,OwnerID())				--把演戲伊利寫進演戲火妖精
		BeginPlot(  spiritD, "LuaS_423367_ELY_CHECK" , 0 )					--掛風妖精迴圈檢查--伊利不在就刪除風妖精
		BeginPlot(  spiritD, "LuaS_423367_SD_MOVE" , 0 )					--移動
		
		sleep(20)

		local spiritE = Lua_DW_CreateObj("flag" ,115951,780695,5,1)				--115938光妖精、旗子編號780695、5
		DisableQuest(spiritE , true )								--開關NPC頭上的任務提示以及對話劇情(true關閉)
		MoveToFlagEnabled( spiritE , false )
		SetModeEX( spiritE , EM_SetModeType_Mark , false )
		WriteRoleValue(  spiritE ,EM_RoleValue_IsWalk , 1 )
		WriteRoleValue(  spiritE,EM_RoleValue_Register+3,OwnerID())				--把演戲伊利寫進演戲火妖精
		BeginPlot(  spiritE, "LuaS_423367_ELY_CHECK" , 0 )					--掛光妖精迴圈檢查--伊利不在就刪除光妖精
		BeginPlot(  spiritE, "LuaS_423367_SE_MOVE" , 0 )					--移動	
		return true
end

function LuaS_423367_ELY_CHECK()	
	local ELY = ReadRoleValue(OwnerID(),EM_RoleValue_Register+3)		--演戲伊利
	for i = 0 , 120 , 1 do
		if	CheckID(ELY ) == false	then
			break
		end
		sleep( 20 )
	end
	Delobj( OwnerID() )
end

function LuaS_423367_SA_MOVE()	--火
	LuaFunc_MoveToFlag(OwnerID(), 780695,2,0)
	sleep( 10 )
	LuaFunc_MoveToFlag(OwnerID(), 780695,3,0)
	sleep( 10 )
	LuaFunc_MoveToFlag(OwnerID(), 780695,4,0)
	sleep( 10 )
	LuaFunc_MoveToFlag(OwnerID(), 780695,5,0)
	sleep( 10 )
	LuaFunc_MoveToFlag(OwnerID(), 780695,1,0)
	sleep( 10 )
	LuaFunc_MoveToFlag(OwnerID(), 780695,2,0)
	sleep( 10 )
	LuaFunc_MoveToFlag(OwnerID(), 780695,3,0)
	sleep( 10 )
	LuaFunc_MoveToFlag(OwnerID(), 780695,4,0)
	sleep( 10 )
	LuaFunc_MoveToFlag(OwnerID(), 780695,5,0)
	sleep( 10 )
	LuaFunc_MoveToFlag(OwnerID(), 780695,1,0)
	sleep( 10 )
	LuaFunc_MoveToFlag(OwnerID(), 780695,3,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,4,0)
	sleep( 10 )
	LuaFunc_MoveToFlag(OwnerID(), 780695,5,0)
	sleep( 10 )
	LuaFunc_MoveToFlag(OwnerID(), 780695,1,0)
	sleep( 10 )
	LuaFunc_MoveToFlag(OwnerID(), 780695,2,0)
	sleep( 10 )
	LuaFunc_MoveToFlag(OwnerID(), 780695,3,0)
	sleep( 10 )
	LuaFunc_MoveToFlag(OwnerID(), 780695,11,0)
end

function LuaS_423367_SB_MOVE()	--水
	LuaFunc_MoveToFlag(OwnerID(), 780695,5,0)
	sleep( 10 )
	LuaFunc_MoveToFlag(OwnerID(), 780695,3,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,1,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,4,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,3,0)
	sleep( 10 )
	LuaFunc_MoveToFlag(OwnerID(), 780695,5,0)
	sleep( 10 )
	LuaFunc_MoveToFlag(OwnerID(), 780695,3,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,1,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,4,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,2,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,3,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,5,0)
	sleep( 10 )
	LuaFunc_MoveToFlag(OwnerID(), 780695,1,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,4,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,11,0)
end

function LuaS_423367_SC_MOVE()	--闇
	LuaFunc_MoveToFlag(OwnerID(), 780695,5,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,2,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,4,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,1,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,3,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,5,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,2,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,4,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,1,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,3,0)
	sleep( 10 )
	LuaFunc_MoveToFlag(OwnerID(), 780695,2,0)	
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,4,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,3,0)
	sleep( 10 )
	LuaFunc_MoveToFlag(OwnerID(), 780695,11,0)
end

function LuaS_423367_SD_MOVE()	--風
	LuaFunc_MoveToFlag(OwnerID(), 780695,3,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,2,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,1,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,5,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,4,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,3,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,2,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,1,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,5,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,4,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,3,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,2,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,1,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,5,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,4,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,11,0)
end

function LuaS_423367_SE_MOVE()	--光
	LuaFunc_MoveToFlag(OwnerID(), 780695,6,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,7,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,8,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,5,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,6,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,7,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,8,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,5,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,9,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,4,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,6,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,7,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,8,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,5,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,4,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,6,0)
	sleep( 10 )	
	LuaFunc_MoveToFlag(OwnerID(), 780695,11,0)
end

--點擊115936後
function LuaS_115936_0()
	local BOX=ReadRoleValue( TargetID() , EM_RoleValue_Register+1 )

	if	(CheckBuff(OwnerID() , 507184) == false)	and	(CheckBuff(OwnerID() , 507205) == false)	then
		AddBuff( OwnerID()  , 507184, 1 , 12 )
		AddBuff( BOX,  505463 , 0 , 13 )
		AddBuff( BOX,  505453 , 0 , -1 )		--特效放大3
		return true
	end
	if	(CheckBuff(OwnerID() , 507184) == false)	and	(CheckBuff(OwnerID() , 507205) == true)	then
		CancelBuff(OwnerID() , 507205)
		AddBuff( OwnerID()  , 507184, 1 , 12 )
		AddBuff( BOX,  505463 , 0 , 13 )
		AddBuff( BOX,  505453 , 0 , -1 )		--特效放大3
		return true
	end
	if	(CheckBuff(OwnerID() , 507184) == true)	and	(CheckBuff(OwnerID() , 507205) == false)	then
		ScriptMessage(OwnerID(),OwnerID(),1,"[SC_423367_9]",0)		--風的力量運行中，暫時無法重複施放
		ScriptMessage(OwnerID(),OwnerID(),0,"[SC_423367_9]",0)
		return false
	end
end