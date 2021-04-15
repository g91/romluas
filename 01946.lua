
function Lua_423450_Say()
	local T_ID = TargetID() --勞勃
	local O_ID = OwnerID() --玩家	
	if CheckAcceptQuest( O_ID, 423450 ) == true and CheckFlag( O_ID, 544298 ) ~= true and ReadRoleValue( T_ID, EM_RoleValue_Register1 ) > 0 then
		SetSpeakDetail( O_ID, "[SC_423450_01]" ) --(他似乎正在忙什麼...)
	elseif CheckAcceptQuest( O_ID, 423450 ) == true and CheckFlag( O_ID, 544298 ) ~= true then
		SetSpeakDetail( O_ID, "[SC_423450_00]" ) --(他似乎在想著什麼...)
		AddSpeakOption( O_ID, T_ID, "[SC_423450_0]", "Lua_423450_1",0) --跟他打招呼
	else
		LoadQuestOption( O_ID )
	end
end

function Lua_423450_1()
	local T_ID = TargetID() --勞勃
	local O_ID = OwnerID() --玩家
	CloseSpeak( OwnerID() )
	
	WriteRoleValue( O_ID, EM_RoleValue_Register1, 1 )
	BeginPlot( T_ID, "Lua_423450_2", 0 )
end

function Lua_423450_2()
	while true do
		local QuestID = 423450
		local FinishFlagID = 544298
		local CheckBuffID = 507178
		local CheckRange = 100
		local DoScript = "Lua_423450_break"		
		local FlagGroup = 780595
		local T_ID = TargetID()--玩家
		CallPlot( OwnerID(), "ks_QuestAddBuff", QuestID, FinishFlagID, CheckBuffID, CheckRange, DoScript )
		
		local gill = LuaFunc_SearchNPCbyOrgID( OwnerID(), 115984, 80, 0 )
		lobo = LuaFunc_CreateObjByObj( 115999, OwnerID() )
		gill = LuaFunc_CreateObjByObj( 116000, gill )
		ks_ActSetMode( lobo )
		ks_ActSetMode( gill )		
		
		sleep(10)
		AdjustFaceDir( lobo, T_ID, 0 ) --面向目標
		AdjustFaceDir( gill, T_ID, 0 ) --面向目標
		Say( lobo, "[SC_423450_1]" )--好人！你來看我和姊姊嗎？
		sleep(20)
		PlayMotion( gill, ruFUSION_ACTORSTATE_EMOTE_POINT )	--指向
		Say( gill, "[SC_423450_2]" )--你怎麼找到這裡的？
		sleep(20)
		local mo = LuaFunc_SearchNPCbyOrgID( OwnerID(), 115981, 50, 0 )
		mo = LuaFunc_CreateObjByObj( 116002, mo )
		AdjustFaceDir( mo, gill, 0 ) --面向目標
		PlayMotion( mo, ruFUSION_ACTORSTATE_EMOTE_SALUTE2 )	--敬禮
		Say( mo, "[SC_423450_3]" )--是我找到的。
		AdjustFaceDir( gill, mo, 0 ) --面向目標
		AdjustFaceDir( lobo, mo, 0 ) --面向目標
		sleep(25)
		PlayMotion( gill, ruFUSION_ACTORSTATE_EMOTE_SPEAK )	--說話動作
		Say( gill, "[SC_423450_4]" )--你......我弟說你天生可以改變外觀，真的嗎？
		sleep(35)
		CastSpell( mo, mo, 494222 ) ----閃光				
		sleep(10)
		Say( mo, "[SC_423450_5]" )--我可沒喝任何東西。
		PlayMotion( mo, ruFUSION_ACTORSTATE_EMOTE_SALUTE2 )	--敬禮
		sleep(10)
		local mo1 = LuaFunc_CreateObjByObj( 116001, mo )
		DelObj(mo)
		ks_ActSetMode( mo1 )
		AdjustFaceDir( mo1, gill, 0 ) --面向目標
		sleep(20)
		Say( gill, "[SC_421543_5]" )--.......
		sleep(15)
		PlayMotion( gill, ruFUSION_ACTORSTATE_EMOTE_SPEAK )	--說話動作
		Say( gill, "[SC_423450_6]" )--你怎麼做到的！教我，求求你！				
		sleep(20)
		Lua_423450_msg()--(洞裡傳來大叫)放我出去！嘿！你們兩個！放我出去！		
		sleep(10)
		SetDir( mo1, 351 )
		sleep(15)
		Say( mo1, "[SC_423450_8]" )--那是誰？
		PlayMotion( gill, ruFUSION_ACTORSTATE_EMOTE_POINT )	--指向
		sleep(25)
		PlayMotion( gill, ruFUSION_ACTORSTATE_EMOTE_SURRENDER ) --頭痛
		Say( gill, "[SC_423450_9]" )--一個奇怪的傢伙
		sleep(20)
		CallPlot( OwnerID(), "ks_QuestEnd", QuestID, FinishFlagID, CheckBuffID, CheckRange, DoScript )
		break
	end
end

function Lua_423450_msg()
	local player = {}
	local playerCount = 0
	local Color = "0xffffff00"	-- 強制訊息為黃色
	player = SearchRangePlayer ( OwnerID(), 100 ) 
	
	for pry , obj in pairs( player ) do
		playerCount = playerCount + 1
	end
	for i= 0, playerCount-1 do
		if CheckAcceptQuest( player[i], 423450 ) == true and CheckBuff( player[i] , 507178 ) == true then 
			ScriptMessage( player[i], player[i], 1 , "[SC_423450_7]", Color )
			ScriptMessage( player[i], player[i], 0 , "[SC_423450_7]", Color )
		end
	end
end

function Lua_423450_break()
	local gill = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116000, 80, 0 )
	local lobo = LuaFunc_SearchNPCbyOrgID( OwnerID(), 115999, 80, 0 )
	local mo = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116001, 80, 0 )
	local mo1 = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116002, 80, 0 )
	
	if gill ~= nil then delobj(gill) end
	if lobo ~= nil then delobj(lobo) end
	if mo ~= nil then delobj(mo) end
	if mo1 ~= nil then delobj(mo1) end
	ks_resetObj( OwnerID(), nil )
end


--========================================================================================--

function Lua_423452_begin()
	local T_ID = TargetID()--火堆
	local O_ID = OwnerID() --玩家	
	if CountBodyItem( O_ID, 207714 ) > 0 then
		return 1
	else
		ScriptMessage( T_ID, O_ID , 1 , "[SC_423452_0]" , 0 )--沒有[207714]。
		ScriptMessage( T_ID, O_ID , 0 , "[SC_423452_0]" , 0 )		
		return 0
	end
end

function Lua_423452_end()
	local T_ID = TargetID()--火堆
	local O_ID = OwnerID() --玩家	
	
	BeginPlot( T_ID, "Lua_423452_get", 0 )
	return 1
end

function Lua_423452_get()
	local O_ID = OwnerID() --火堆
	local T_ID = TargetID()--玩家
	local gill = LuaFunc_SearchNPCbyOrgID( O_ID, 115984, 50, 0 )
	local lobo = LuaFunc_SearchNPCbyOrgID( O_ID, 115998, 50, 0 )
	Say( lobo, "[SC_423452_1]" ) --姐姐，我肚子餓。
	sleep(10)
	Say( gill, "[SC_423452_2]" )--你先忍一忍吧，等會再去找東西吃。
	sleep(10)
	if CheckAcceptQuest( T_ID, 423452 ) == true and CountBodyItem( T_ID, 207714 ) > 0 then
		GiveBodyItem( T_ID, 207717, 1 )
		DelBodyItem( T_ID, 207714, 1 )
	end
end

function Lua_423452_say()
	local T_ID = TargetID() --摩瑞克
	local O_ID = OwnerID() --玩家	

	if CheckAcceptQuest( O_ID, 423452 ) == true and CheckFlag( O_ID, 544198 ) ~= true then
		LoadQuestOption( O_ID )
		AddSpeakOption( O_ID, T_ID, "[SC_423452_3]", "Lua_423452_re",0 ) --轉述囚犯的要求		
	else
		LoadQuestOption( O_ID )
	end
end

function Lua_423452_re()
	local T_ID = TargetID() --摩瑞克
	local O_ID = OwnerID() --玩家
	SetSpeakDetail( O_ID, "[SC_423452_4]" ) --既然他是真的被關起來...
end

function Lua_423452_say1()
	local T_ID = TargetID() --奇怪的囚犯
	local O_ID = OwnerID() --玩家	

	if CheckAcceptQuest( O_ID, 423452 ) == true and CheckFlag( O_ID, 544198 ) ~= true and CountBodyItem( O_ID, 207717 ) > 0 then
		LoadQuestOption( O_ID )
		AddSpeakOption( O_ID, T_ID, "[SC_423452_5]", "Lua_423452_1",0 ) --將[207717]給他
	else
		LoadQuestOption( O_ID )
	end
end

function Lua_423452_1()
	local T_ID = TargetID() --奇怪的囚犯
	local O_ID = OwnerID() --玩家
		
	SetSpeakDetail( O_ID, "[SC_423452_6]" ) --噢！我的天啊！...
	AddSpeakOption( O_ID, T_ID, "[SC_423452_7]", "Lua_423452_2",0) --詢問和他相關的事
end

function Lua_423452_2()
	local T_ID = TargetID() --奇怪的囚犯
	local O_ID = OwnerID() --玩家
	
	SetSpeakDetail( O_ID, "[SC_423452_8]" ) --年輕人就是該懂禮貌...
	SetFlag( O_ID, 544198, 1 )
	DelBodyItem( O_ID, 207717, 1 )
end

--========================================================================================--

function Lua_423453_get()
	local T_ID = TargetID()--烈陽葉
	local O_ID = OwnerID() --玩家	
	
	if CountBodyItem( O_ID, 207466 ) < 5 then
		GiveBodyItem( O_ID, 207466, 1 )
		if CountBodyItem( O_ID, 207466 ) == 5 then
			SetFlag( O_ID, 544233, 1 )
		end
	end
	return 1
end

--========================================================================================--

function Lua_423454_say()
	local T_ID = TargetID() --多瑞安
	local O_ID = OwnerID() --玩家
	
	if CheckAcceptQuest( O_ID, 423454 ) == true and CheckFlag( O_ID, 544199 ) ~= true and CountBodyItem( O_ID, 207465 ) > 0 and ReadRoleValue( T_ID, EM_RoleValue_Register1 ) > 0 then
		SetSpeakDetail( O_ID, "[SC_423450_01]" ) --(他似乎正在忙什麼...)
	elseif CheckAcceptQuest( O_ID, 423454 ) == true and CheckFlag( O_ID, 544199 ) ~= true and CountBodyItem( O_ID, 207465 ) > 0 then
		LoadQuestOption( O_ID )
		AddSpeakOption( O_ID, T_ID, "[SC_423454_0]", "Lua_423454_1",0 ) --把[207465]給他喝
	else
		LoadQuestOption( O_ID )
	end
end

function Lua_423454_1()
	local T_ID = TargetID() --多瑞安
	local O_ID = OwnerID() --玩家
	CloseSpeak( OwnerID() )
	
	DelBodyItem( O_ID, 207465, 1 )
	WriteRoleValue( T_ID, EM_RoleValue_Register1, 1 )
	BeginPlot( T_ID, "Lua_423454_2", 0 )
end	

function Lua_423454_2()	
	while true do
		local T_ID = TargetID() --玩家
		local QuestID = 423454
		local FinishFlagID = 544199
		local CheckBuffID = 507178
		local CheckRange = 100
		local DoScript = "Lua_423454_break"		
		local FlagGroup = 780595
		CallPlot( OwnerID(), "ks_QuestAddBuff", QuestID, FinishFlagID, CheckBuffID, CheckRange, DoScript )
		
		
		local gill = LuaFunc_SearchNPCbyOrgID( OwnerID(), 115984, 80, 0 )
		local lobo = LuaFunc_SearchNPCbyOrgID( OwnerID(), 115998, 80, 0 )
		local mo = LuaFunc_SearchNPCbyOrgID( OwnerID(), 115981, 80, 0 )
		gill = LuaFunc_CreateObjByObj( 116098, gill )
		lobo = LuaFunc_CreateObjByObj( 116097, lobo )
		mo = LuaFunc_CreateObjByObj( 116099, mo )
		doo = LuaFunc_CreateObjByObj( 116016, OwnerID() )
		SetDefIdleMotion( lobo, ruFUSION_MIME_IDLE_STAND_02 )
		ks_ActSetMode( gill )
		ks_ActSetMode( lobo )
		ks_ActSetMode( mo )
		ks_ActSetMode( doo )
				
		sleep(15)
		if T_ID ~= nil then
			AdjustFaceDir( doo, T_ID, 0 ) --面向目標
		else
			AdjustFaceDir( doo, mo, 0 ) --面向目標
		end
		Say( doo, "[SC_423454_01]" ) --這什麼？
		PlayMotion( doo, ruFUSION_ACTORSTATE_EMOTE_DRINK )	--說話動作
		sleep(30)
		PlayMotion( doo, ruFUSION_ACTORSTATE_EMOTE_DANCE )	--說話動作
		Say( doo, "[SC_423454_02]" ) --喔酷！這玩意兒好耶...		
		sleep(30)
		AdjustFaceDir( mo, doo, 0 ) --面向目標
		AdjustFaceDir( gill, doo, 0 ) --面向目標
		AdjustFaceDir( lobo, doo, 0 ) --面向目標
		PlayMotion( mo, ruFUSION_ACTORSTATE_EMOTE_SPEAK )	--說話動作
		Say( mo, "[SC_423454_03]" )--這個稍候再談，請問一下您究竟幾歲了？			
		sleep(35)
		AdjustFaceDir( doo, mo, 0 ) --面向目標
		PlayMotion( doo, ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )	--說話動作
		Say( doo, "[SC_423454_04]" )--呃......我不記得		
		sleep(25)
		PlayMotion( doo, ruFUSION_ACTORSTATE_EMOTE_SPEAK )	--說話動作
		Say( doo, "[SC_423454_05]" )--這樣說吧...			
		sleep(15)
		Say( mo, "[SC_423207_0]" )--!!
		Say( gill, "[SC_423207_0]" )--!!
		sleep(5)
		Say( lobo, "[SC_423454_06]" )--??		
		sleep(25)
		PlayMotion( mo, ruFUSION_ACTORSTATE_SHIELD_BASH )	--揮開
		Say( mo, "[SC_423454_07]" )--嘿！等等...		
		sleep(35)
		PlayMotion( doo, ruFUSION_ACTORSTATE_EMOTE_STRETCH )	--伸懶腰
		Say( doo, "[SC_423454_08]" )--當然..		
		sleep(35)
		PlayMotion( mo, ruFUSION_ACTORSTATE_EMOTE_SPEAK )	--說話動作
		Say( mo, "[SC_423454_09]" )--你到底叫什麼？
		sleep(25)
		PlayMotion( doo, ruFUSION_ACTORSTATE_EMOTE_PROVOKE )	--挑釁
		Say( doo, "[SC_423454_10]" )--[115751]。以前有段時間...		
		sleep(25)
		AdjustFaceDir( lobo, gill, 0 ) --面向目標		
		Say( lobo, "[SC_423454_11]" )--姊姊，我真的餓了......
		sleep(15)
		AddBuff( lobo, 506984, 5, -1 )		
		SetModeEx( lobo , EM_SetModeType_Gravity , false )
		SetDefIdleMotion( lobo, ruFUSION_MIME_RUN_FORWARD )		
		sleep(5)
		local x = GetMoveFlagValue( FlagGroup, 20, EM_RoleValue_X ) 
		local y = GetMoveFlagValue( FlagGroup, 20, EM_RoleValue_Y )
		local z = GetMoveFlagValue( FlagGroup, 20, EM_RoleValue_Z )
		MoveDirect( lobo, x , y+40 , z )
		sleep(10)
		AdjustFaceDir( doo, lobo, 0 ) --面向目標
		DelObj(lobo)
		Say( doo, "[SC_423454_12]" )--唉呀！醫肚子最重要啦...
		sleep(10)
		ks_MoveToFlag( doo, FlagGroup, 21, 0 )
		sleep(20)
		CallPlot( OwnerID(), "ks_QuestEnd", QuestID, FinishFlagID, CheckBuffID, CheckRange, DoScript )
		break
	end
end

function Lua_423454_break()
	local gill = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116098, 100, 0 )
	local lobo = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116097, 150, 0 )
	local mo = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116099, 100, 0 )
	local doo = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116016, 100, 0 )
		
	if gill ~= nil then delobj(gill) end
	if lobo ~= nil then delobj(lobo) end
	if mo ~= nil then delobj(mo) end
	if doo ~= nil then delobj(doo) end
	ks_resetObj( OwnerID(), nil )
end




--========================================================================================--

function Lua_423455_say()
	local T_ID = TargetID() --多瑞安
	local O_ID = OwnerID() --玩家	
	
	if CheckAcceptQuest( O_ID, 423455 ) == true and CheckFlag( O_ID, 544292 ) ~= true and ReadRoleValue( T_ID, EM_RoleValue_Register1 ) > 0 then
		SetSpeakDetail( O_ID, "[SC_423450_01]" ) --(他似乎正在忙什麼...)
	elseif CheckAcceptQuest( O_ID, 423455 ) == true and CheckFlag( O_ID, 544292 ) ~= true then
		LoadQuestOption( O_ID )		
		AddSpeakOption( O_ID, T_ID, "[SC_423455_0]", "Lua_423455_1",0 ) --問他在做什麼
		AdjustFaceDir( T_ID, O_ID, 0 ) --面向目標
	else
		LoadQuestOption( O_ID )
		AdjustFaceDir( T_ID, O_ID, 0 ) --面向目標
	end
end

function Lua_423455_1()
	local T_ID = TargetID() --多瑞安
	local O_ID = OwnerID() --玩家
	SetSpeakDetail( O_ID, "[SC_423455_1]" )--剛才我還在想...
	AddSpeakOption( O_ID, T_ID, "[SC_423455_2]", "Lua_423455_2",0)--跟他道歉
end

function Lua_423455_2()
	local T_ID = TargetID() --多瑞安
	local O_ID = OwnerID() --玩家
	SetSpeakDetail( O_ID, "[SC_423455_3]" )--算了，講都講了
	AddSpeakOption( O_ID, T_ID, "[SC_423455_4]", "Lua_423455_3",0)--SC_423455_4
end
	
function Lua_423455_3()
	local T_ID = TargetID() --多瑞安
	local O_ID = OwnerID() --玩家	
	
	if ReadRoleValue( T_ID, EM_RoleValue_Register1 ) > 0 then
		SetSpeakDetail( O_ID, "[SC_423450_01]" ) --(他似乎正在忙什麼...)
	else
		CloseSpeak( OwnerID() )
		WriteRoleValue( T_ID, EM_RoleValue_Register1, 1 )
		BeginPlot( T_ID, "Lua_423455_4", 0 )
	end
end

function Lua_423455_4()
	while true do			
		local QuestID = 423455
		local FinishFlagID = 544292
		local CheckBuffID = 507178
		local CheckRange = 70
		local DoScript = "Lua_423455_break"		
		local FlagGroup = 780595		
		CallPlot( OwnerID(), "ks_QuestAddBuff", QuestID, FinishFlagID, CheckBuffID, CheckRange, DoScript )
					
		local doo = LuaFunc_CreateObjByObj( 116020, OwnerID() )
		ks_ActSetMode( doo )		
		sleep(15)
		Lua_423455_msg( QuestID, CheckBuffID, 1 )
		sleep(25)
		Lua_423455_msg( QuestID, CheckBuffID, 2 )
		Say( doo, "[SC_423207_0]" )--!!
		sleep(35)
		Lua_423455_msg( QuestID, CheckBuffID, 4 )		
		sleep(25)
		Lua_423455_msg( QuestID, CheckBuffID, 5 )
		PlayMotion( doo, ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
		sleep(35)	
		Lua_423455_msg( QuestID, CheckBuffID, 6 )
		Say( doo, "[SC_423207_0]" )--!!
		sleep(35)
		Lua_423455_msg( QuestID, CheckBuffID, 1 )
		sleep(25)		
		Lua_423455_msg( QuestID, CheckBuffID, 3 )		
		sleep(30)
		Lua_423455_msg( QuestID, CheckBuffID, 7 )			
		sleep(25)
		PlayMotion( doo, ruFUSION_ACTORSTATE_EMOTE_APPROVAL )
		Say( doo, "[SC_423455_7]" )--培養出來的半龍人...
		sleep(20)
		CallPlot( OwnerID(), "ks_QuestEnd", QuestID, FinishFlagID, CheckBuffID, CheckRange, DoScript )		
		break
	end
end

function Lua_423455_msg( QuestID, CheckBuffID, Index )
	local player = {}
	local playerCount = 0
	local Color = "0xffffff00"	-- 強制訊息為黃色
	player = SearchRangePlayer ( OwnerID(), 100 ) 
	local Message = {}
	Message = {	
				[1] = "[SC_423455_50]";--[116001]的聲音傳來......
				[2] = "[SC_423455_51]";--咳......這是妳的家徽
				[3] = "[SC_423455_52]";--培養皿？是你找到我們的那間地下室嗎？
				[4] = "[SC_423455_60]";--[115892]的聲音傳來......
				[5] = "[SC_423455_61]";--他說的沒錯......現在的[115891]是我變成這個模樣後才找到他的。
				[6] = "[SC_423455_62]";--那個時候，他是被放在培養皿裡面的......
				[7] = "[SC_423455_63]";--吉兒的哭聲傳來......
				}
	for pry , obj in pairs( player ) do
		playerCount = playerCount + 1
	end
	for i= 0, playerCount-1 do
		if CheckAcceptQuest( player[i], QuestID ) == true and CheckBuff( player[i] , CheckBuffID ) == true then
			ScriptMessage( player[i], player[i], 1 , Message[Index], Color )
			ScriptMessage( player[i], player[i], 0 , Message[Index], Color )		
		end
	end		
end

function Lua_423455_break()
	local doo = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116020, 50, 0 )
	if doo ~= -1 then delobj(doo) end
	ks_resetObj( OwnerID(), nil )
end


--========================================================================================--

function Lua_423456_begin()
	local T_ID = TargetID()--火堆
	local O_ID = OwnerID() --玩家
	if ReadRoleValue( T_ID, EM_RoleValue_Register2 ) == 0 then	
		return 1
	else
		ScriptMessage( T_ID, O_ID , 1 , "[SYS_AUCTION_WAIT_NEXT]" , 0 )--忙碌中，請稍候再試。
		ScriptMessage( T_ID, O_ID , 0 , "[SYS_AUCTION_WAIT_NEXT]" , 0 )
		return 0
	end
end

function Lua_423456_start()
	WriteRoleValue( TargetID(), EM_RoleValue_Register2, 1 )
	BeginPlot( TargetID(), "Lua_423456_1", 0 )
	DisableQuest( TargetID() , true )
	return 1
end

function Lua_423456_say()
	local T_ID = TargetID() --摩瑞克
	local O_ID = OwnerID() --玩家		
	if CheckAcceptQuest( O_ID, 423456 ) == true and CheckFlag( O_ID, 544293 ) ~= true then
		SetSpeakDetail( O_ID, "[SC_423456_0]" )--你先去把柴木燒得旺一點，等等我們邊吃邊聊吧......
		AdjustFaceDir( T_ID, O_ID, 0 ) --面向目標
	else
		LoadQuestOption( O_ID )
		AdjustFaceDir( T_ID, O_ID, 0 ) --面向目標
	end
end

function Lua_423456_1()	
	while true do
		local QuestID = 423456
		local FinishFlagID = 544293
		local CheckBuffID = 507178
		local CheckRange = 100
		local DoScript = "Lua_423456_break"	
		CallPlot( OwnerID(), "ks_QuestAddBuff", QuestID, FinishFlagID, CheckBuffID, CheckRange, DoScript )
		
		local FlagGroup = 780595
		local doo = Lua_423208_obj( 116020, FlagGroup, 21 )
		local mo = LuaFunc_SearchNPCbyOrgID( OwnerID(), 115983, 100, 0 )
		local gill = LuaFunc_SearchNPCbyOrgID( OwnerID(), 115984, 100, 0 )
		local lobo = LuaFunc_SearchNPCbyOrgID( OwnerID(), 115998, 100, 0 )
		mo = LuaFunc_CreateObjByObj( 116102, mo )
		gill = LuaFunc_CreateObjByObj( 116101, gill )
		lobo = LuaFunc_CreateObjByObj( 116100, lobo )
		ks_ActSetMode( mo )
		ks_ActSetMode( gill )
		ks_ActSetMode( lobo )			
		AdjustFaceDir( mo, OwnerID(), 0 )
		while true do
			local time = ks_MoveToFlag( doo, FlagGroup, 22, 0 )			
			sleep(5+time)
			local  range = GetDistance( doo, OwnerID() )
			if range < 35 then	
				StopMove( doo, false )
				break
			end
		end			
		Say( doo, "[SC_423456_00]" )--哈！我來讓你們這些年輕人看看什麼叫真正的烤肉！
		AdjustFaceDir( doo, OwnerID(), 0 )
		sleep(5)
		PlayMotion( doo, ruFUSION_ACTORSTATE_CRAFTING_BEGIN )		
		AdjustFaceDir( mo, gill, 0 )
		Say( mo, "[SC_423456_01]" )--你本來是人類對吧？
		sleep(25)
		AdjustFaceDir( gill, mo, 0 )
		PlayMotion( gill, ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )--點頭
		Say( gill, "[SC_423456_02]" )--嗯......
		sleep(25)
		PlayMotion( mo, ruFUSION_ACTORSTATE_EMOTE_SPEAK )	--說話動作
		Say( mo, "[SC_423456_03]" )--是誰把你......變成半龍人的？	
		sleep(20)
		PlayMotion( gill, ruFUSION_ACTORSTATE_EMOTE_ANGRY )	--憤怒
		Say( gill, "[SC_423456_04]" )--真理之手......那群毫無人性的惡魔！他們根本就不在乎人命！他們......
		sleep(20)
		PlayMotion( mo, ruFUSION_ACTORSTATE_EMOTE_SPEAK )	--說話動作
		Say( mo, "[SC_423456_05]" )--冷靜點！......冷靜點......我們先說說那些追殺你們的人如何？他們也是真理之手的人？
		sleep(25)
		PlayMotion( gill, ruFUSION_ACTORSTATE_EMOTE_SURRENDER )	--悲憤
		Say( gill, "[SC_423456_06]" )--我不知道，我從來沒在真理之手的據點附近發現過他們......			
		sleep(25)
		Say( gill, "[SC_423456_07]" )--那時候，我們偽裝成盜賊，突然被他們偷襲.....		
		sleep(25)
		PlayMotion( gill, ruFUSION_ACTORSTATE_EMOTE_CRY )	--難過
		Say( gill, "[SC_423456_08]" )--醒來的時候......我們就已經被關起來..				
		sleep(15)
		ks_MoveToFlag( doo, FlagGroup, 23, 0 )		
		sleep(20)
		AdjustFaceDir( doo, gill, 0 )		
		Say( doo, "[SC_423456_09]" )--人死不能復生，我看過太多死亡了，先吃飽再打算吧！
		sleep(35)
		AdjustFaceDir( gill, doo, 0 )
		PlayMotion( doo, ruFUSION_ACTORSTATE_EMOTE_SPEAK )	--說話動作
		Say( doo, "[SC_423456_10]" )--當初龍王是靠著禁忌符文才能變成半龍半人
		AdjustFaceDir( mo, doo, 0 )
		sleep(25)
		PlayMotion( gill, ruFUSION_ACTORSTATE_EMOTE_POINT )--指向
		Say( gill, "[SC_423456_11]" )--血......那瓶血！
		sleep(35)
		PlayMotion( gill, ruFUSION_ACTORSTATE_EMOTE_CRY )	--難過
		Say( gill, "[SC_423456_12]" )--所有人都因實驗失敗而死去..		
		sleep(25)
		Say( mo, "[SC_423456_13]" )--什麼！
		AdjustFaceDir( doo, mo, 0 )
		AdjustFaceDir( mo, gill, 0 )
		sleep(10)		
		PlayMotion( doo, ruFUSION_ACTORSTATE_EMOTE_SPEAK )	--說話動作
		Say( doo, "[SC_423456_14]" )--嚇死人啊！叫那麼大聲！你的血啊！
		sleep(15)
		AdjustFaceDir( mo, doo, 0 )
		AdjustFaceDir( gill, mo, 0 )
		Say( mo, "[SC_423456_15]" )--......
		sleep(20)
		PlayMotion( doo, ruFUSION_ACTORSTATE_EMOTE_SPEAK )	--說話動作
		Say( doo, "[SC_423456_16]" )--真的是你的血？你也是半龍人？你看起來不像啊？
		sleep(10)
		CastSpell( mo, mo, 494222 ) ----閃光
		sleep(20)
		local mo1 = mo		
		mo = LuaFunc_CreateObjByObj( 116103, mo1 )
		DelObj(mo1)
		ks_ActSetMode( mo )
		AdjustFaceDir( mo, doo, 0 )
		sleep(15)
		PlayMotion( doo, ruFUSION_ACTORSTATE_EMOTE_LAUGH )
		sleep(20)
		Say( doo, "[SC_423456_17]" )--我真想看到佛南多．寇茲莫...
		sleep(25)
		Say( mo, "[SC_423456_18]" )--我天生就是這樣。
		sleep(25)
		Say( doo, "[SC_423456_19]" )--天生！難道你是龍和人的......
		CastSpell( mo, mo, 494222 ) ----閃光
		sleep(20)
		local mo1 = mo
		mo = LuaFunc_CreateObjByObj( 116102, mo1 )
		DelObj(mo1)
		ks_ActSetMode( mo )
		AdjustFaceDir( mo, doo, 0 )				
		sleep(25)
		PlayMotion( mo, ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )--搖頭
		Say( mo, "[SC_423456_20]" )--我本來不應該告訴你的		
		sleep(25)
		PlayMotion( doo, ruFUSION_ACTORSTATE_EMOTE_STRETCH )
		Say( doo, "[SC_423456_21]" )--嗯......看看吧！我跟你們又不熟
		sleep(25)
		CallPlot( OwnerID(), "ks_QuestEnd", QuestID, FinishFlagID, CheckBuffID, CheckRange, DoScript )
		break
	end
end

function Lua_423456_break()
	local mo1 = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116102, 50, 0 )
	local mo2 = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116103, 50, 0 )
	local gill = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116101, 50, 0 )
	local lobo = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116100, 50, 0 )
	local doo = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116020, 50, 0 )
		
	if mo1 ~= nil then delobj(mo1) end
	if mo2 ~= nil then delobj(mo2) end
	if gill ~= nil then delobj(gill) end
	if lobo ~= nil then delobj(lobo) end
	if doo ~= nil then delobj(doo) end
	ks_resetObj( OwnerID(), nil )
end
