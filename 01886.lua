function Lua_423210_say()
	local T_ID = TargetID() --摩瑞克
	local O_ID = OwnerID() --玩家	
	if CheckAcceptQuest( O_ID, 423210 ) == true and ReadRoleValue( T_ID, EM_RoleValue_Register1 ) > 0 then
		SetSpeakDetail( O_ID, "[SC_422693_7]" ) --請稍等我一下。
	elseif CheckAcceptQuest( O_ID, 423210 ) == true and CheckFlag( O_ID, 544286 ) ~= true then
		SetSpeakDetail( O_ID, "[SC_423210_0]" ) --你準備好要去拜訪鎮長[115752]了嗎？
		AddSpeakOption( O_ID, T_ID, "[SC_111796_0]", "Lua_423210_1",0) --我準備好了。
	else
		LoadQuestOption( O_ID )
	end
end

function Lua_423210_1()
	local T_ID = TargetID() --摩瑞克
	local O_ID = OwnerID() --玩家
	CloseSpeak( OwnerID() )
	
	WriteRoleValue( O_ID, EM_RoleValue_Register1, 1 )
	BeginPlot( T_ID, "Lua_423210_2", 0 )
end

function Lua_423210_2()
	while true do
		local QuestID = 423210
		local FinishFlagID = 544286
		local CheckBuffID = 507178
		local CheckRange = 50
		local DoScript = "Lua_423210_break"		
		local FlagGroup = 780595
		ks_AddBuff( QuestID, FinishFlagID, CheckBuffID, CheckRange, DoScript )		
				
		local mo = Lua_423208_obj( 115895, FlagGroup, 11 )		
		local old = LuaFunc_SearchNPCbyOrgID( OwnerID(), 115939, 100, 0 )
		old = LuaFunc_CreateObjByObj( 115897, old )
		ks_ActSetMode( old )
		ks_ActSetMode( mo )
		Lua_423210_setPos()
		CallPlot( mo, "ks_QuestCheck", QuestID, FinishFlagID, CheckBuffID, CheckRange, DoScript )
		
		AdjustFaceDir( mo, old, 0 ) --面向目標
		PlayMotion( mo, ruFUSION_ACTORSTATE_EMOTE_SPEAK )	--說話動作
		Say( mo, "[SC_423210_1]" ) --你好，請問你見過這個嗎？
		sleep(25)
		AdjustFaceDir( old, mo, 0 ) --面向目標
		PlayMotion( old, ruFUSION_ACTORSTATE_SHIELD_BLOCK )	--說話動作
		Say( old, "[SC_423210_2]" ) --這!! 你從哪裡找到這塊家徽的？它的主人呢！你有見到她嗎！
		sleep(5)
		PlayMotion( mo, ruFUSION_ACTORSTATE_PARRY_UNARMED )	--迴避
		sleep(20)
		Say( mo, "[SC_423210_3]" ) --冷靜下來！冷靜下來！你知道[115893]這個姓氏？
		sleep(35)
		PlayMotion( old, ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )	--點頭
		Say( old, "[SC_423210_4]" ) --呼...... 對不起，我沒想到還會再看到這塊家徽，你們知道這裡以前是座小城嗎？		
		sleep(25)
		PlayMotion( mo, ruFUSION_ACTORSTATE_EMOTE_SPEAK )	--說話動作
		Say( mo, "[SC_423210_5]" ) --我想起來了！原來是城牆，我以前到這裡的時候城牆還在。		
		sleep(25)
		PlayMotion( old, ruFUSION_ACTORSTATE_EMOTE_SPEAK )	--說話動作
		Say( old, "[SC_423210_6]" ) --嗯，那是三年前的事了，...
		sleep(25)
		Say( mo, "[SC_423210_7]" ) --那麼你知道......		
		sleep(25)
		PlayMotion( old, ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )	--搖頭
		Say( old, "[SC_423210_8]" ) --不好意思.......我說得太多了，我想好好陪我的女兒走完最後一程，請你們先出去吧。
		sleep(25)
		PlayMotion( mo, ruFUSION_ACTORSTATE_EMOTE_SPEAK )	--說話動作
		Say( mo, "[SC_423210_9]" ) --令媛怎麼了？
		sleep(25)
		PlayMotion( old, ruFUSION_ACTORSTATE_EMOTE_CRY )	--說話動作
		Say( old, "[SC_423210_10]" ) --她在田裡的時候被一種罕見的毒蛇咬了...		
		sleep(25)
		ks_MoveToFlag( mo, FlagGroup, 12, 0 )
		sleep(20)
		CallPlot( mo, "ks_QuestEnd", QuestID, FinishFlagID, CheckBuffID, CheckRange, DoScript )		
		break
	end
end

function Lua_423210_break()
	local Obj = LuaFunc_SearchNPCbyOrgID( OwnerID(), 115894, 100, 0 )
	local old = LuaFunc_SearchNPCbyOrgID( OwnerID(), 115897, 100, 0 )
	
	if old ~= nil then delobj(old) end		
	ks_resetObj( Obj, nil )
	delobj( OwnerID())
end

function Lua_423210_setPos()
	local player = {}
	local playerCount = 0
	local FlagGroup = 780595	
	local x = GetMoveFlagValue( FlagGroup, 13, EM_RoleValue_X ) 
	local y = GetMoveFlagValue( FlagGroup, 13, EM_RoleValue_Y )
	local z = GetMoveFlagValue( FlagGroup, 13, EM_RoleValue_Z )
	player = SearchRangePlayer ( OwnerID(), 60 ) 
	
	for pry , obj in pairs( player ) do
		playerCount = playerCount + 1
	end
	for i= 0, playerCount-1 do
		if CheckAcceptQuest( player[i], 423210 ) == true and CheckBuff( player[i], 507178 ) == true then 
			AddBuff( player[i], 506098, 0, -1 )--畫面一黑
			sleep(3)
			x = x + rand(10) - rand(10)
			z = z + rand(10) - rand(10)
			SetPos( player[i], x, y, z, 0 )
			CancelBuff( player[i], 506098 )
		end
	end
end


--========================================================================================--

function Lua_423444_get()
	local T_ID = TargetID()--剎牙血
	local O_ID = OwnerID() --玩家	
	
	if CountBodyItem( O_ID, 207713 ) < 5 then
		GiveBodyItem( O_ID, 207713, 1 )
		sleep(1)
		if CountBodyItem( O_ID, 207713 ) == 5 then
			SetFlag( O_ID, 544328, 1 )
		end
	end
	return 1
end

--========================================================================================--

function Lua_423445_say()
	local T_ID = TargetID() --摩瑞克
	local O_ID = OwnerID() --玩家	
	if CheckAcceptQuest( O_ID, 423445 ) == true and ReadRoleValue( T_ID, EM_RoleValue_Register1 ) > 0 then
		SetSpeakDetail( O_ID, "[SC_422693_7]" ) --請稍等我一下。
	elseif CheckAcceptQuest( O_ID, 423445 ) == true and CheckFlag( O_ID, 544285 ) ~= true then
		SetSpeakDetail( O_ID, "[SC_422161_22]" ) --你準備好了嗎？
		AddSpeakOption( O_ID, T_ID, "[SC_111796_0]", "Lua_423445_1",0) --我準備好了。
	else
		LoadQuestOption( O_ID )
	end
end

function Lua_423445_sleep()
	SetDefIdleMotion( OwnerID(), ruFUSION_MIME_IDLE_DEAD )
end

function Lua_423445_do()
	if CheckCompleteQuest( OwnerID(), 423445 ) == true or CheckFlag( OwnerID(), 544285 ) == true then
		SetSpeakDetail( OwnerID(), "[SC_423445_3]" ) --她的眉頭舒展開來，高燒神奇的消失，就像什麼事也沒發生過的安穩睡著了，看來是已經脫離險境。
	elseif CheckBuff( TargetID(), 507178 ) == true then
		SetSpeakDetail( OwnerID(), "[SC_423445_1]" ) --這個女孩發著高燒，額頭上掛滿了汗珠，神智不清，完全沒有辦法和你交談。
		AddSpeakOption( OwnerID(), TargetID(), "[SC_423445_2]", "Lua_423445_end",0) --讓她吸入剎牙血的味道
	else
		SetSpeakDetail( OwnerID(), "[SC_423445_1]" ) --這個女孩發著高燒，額頭上掛滿了汗珠，神智不清，完全沒有辦法和你交談。
	end	
end

function Lua_423445_1()
	local T_ID = TargetID() --摩瑞克
	local O_ID = OwnerID() --玩家
	CloseSpeak( OwnerID() )

	WriteRoleValue( T_ID, EM_RoleValue_Register1, 1 )
	BeginPlot( T_ID, "Lua_423445_2", 0 )
end

function Lua_423445_2()
	while true do
		local QuestID = 423445
		local FinishFlagID = 544285
		local CheckBuffID = 507178
		local CheckRange = 50
		local DoScript = "Lua_423445_break"		
		CallPlot( OwnerID(), "ks_QuestAddBuff", QuestID, FinishFlagID, CheckBuffID, CheckRange, DoScript )
		
		local mo = LuaFunc_CreateObjByObj( 116095, OwnerID() )
		ks_ActSetMode( mo )
		local dau = LuaFunc_SearchNPCbyOrgID( OwnerID(), 115896, 50, 0 )
		local old = LuaFunc_SearchNPCbyOrgID( OwnerID(), 115939, 50, 0 )
		old = LuaFunc_CreateObjByObj( 116096, old )
		ks_ActSetMode( old )
		AdjustFaceDir( mo, dau, 0 )
		AdjustFaceDir( old, dau, 0 )
		
		sleep(15)
		Say( mo, "[SC_423445_01]" ) --我現在開始施法，記得把[207713]拿給她聞
		AddBuff( mo, 502662, 1, 15 ) --手發光
		PlayMotionEX( mo,ruFUSION_ACTORSTATE_CHANNEL_BEGIN, ruFUSION_ACTORSTATE_CHANNEL_LOOP )
		sleep(25)
		AddBuff( dau, 507178, 1, 12 )
		Say( mo, "[SC_423445_02]" ) --就是現在!!
		sleep(120)
		CallPlot( OwnerID(), "ks_QuestEnd", QuestID, nil, CheckBuffID, CheckRange, DoScript )
		break
	end
end

function Lua_423445_end()
	local mo = LuaFunc_SearchNPCbyOrgID( OwnerID(), 115930, 50, 0 )
	CloseSpeak( OwnerID() )
	BeginPlot( mo, "Lua_423445_3", 0 )
end
	
function Lua_423445_3()
	local QuestID = 423445
	local FinishFlagID = 544285
	local CheckBuffID = 507178
	local CheckRange = 50
	local DoScript = "Lua_423445_break"	
	
	local Color = "0xffffff00"	-- 強制訊息為黃色
	local player = {}
	local playerCount = 0	
	local mo = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116095, 50, 0 )
	local dau = LuaFunc_SearchNPCbyOrgID( OwnerID(), 115896, 50, 0 )
	CancelBuff( dau, 507178 )
	player = SearchRangePlayer ( OwnerID(), 50 )
	
	for pry , obj in pairs( player ) do
		playerCount = playerCount + 1
	end
	for i= 0, playerCount-1 do
		if CheckAcceptQuest( player[i], QuestID ) == true and CheckBuff( player[i], CheckBuffID ) == true then 
			ScriptMessage( player[i], player[i], 1 , "[SC_423445_3]", Color )
			ScriptMessage( player[i], player[i], 0 , "[SC_423445_3]", Color )				
		end
	end
	CallPlot( OwnerID(), "ks_QuestEnd", QuestID, FinishFlagID, CheckBuffID, CheckRange, DoScript )	
end

function Lua_423445_break()
	debugmsg( 0,0, "Do break" )
	local dau = LuaFunc_SearchNPCbyOrgID( OwnerID(), 115896, 50, 0 )
	local mo = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116095, 50, 0 )
	local old = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116096, 50, 0 )
	
	CancelBuff( dau, 507178 )
	if mo ~= nil then delobj(mo) end
	if old ~= nil then delobj(old) end
	ks_resetObj( OwnerID(), nil )
end

--========================================================================================--

function Lua_423446_say()
	local T_ID = TargetID() --鎮長
	local O_ID = OwnerID() --玩家	
	if	CheckAcceptQuest( O_ID, 423446 ) == true then
		SetSpeakDetail( O_ID, "[SC_423446_00]" ) --我安頓小女之後，就會過去找你們。
	elseif CheckCompleteQuest( O_ID, 423445 ) == true and CheckCompleteQuest( O_ID, 423446 ) == true then		
		SetSpeakDetail( O_ID, "[SC_423446_0]" ) --十分感謝...
	else
		LoadQuestOption( O_ID )
	end
end

function Lua_423446_set()
	SetDefIdleMotion( OwnerID(), ruFUSION_MIME_ACTIVATE_LOOP )
	local x = ReadRoleValue( OwnerID(), EM_RoleValue_X )
	local y = ReadRoleValue( OwnerID(), EM_RoleValue_Y ) - 5
	local z = ReadRoleValue( OwnerID(), EM_RoleValue_Z )	
	SetModeEx( OwnerID() , EM_SetModeType_Gravity , false )
	SetModeEx( OwnerID() , EM_SetModeType_Move , false )
	sleep(1)
	SetPos( OwnerID(), x, y, z, 0 )
	Hide(OwnerID())
	Show(OwnerID(), 0 )
end

function Lua_423446_start()
	local T_ID = TargetID()--火堆
	local O_ID = OwnerID() --玩家
	if CheckFlag( O_ID, 544287) ~= true then	
		BeginPlot( T_ID, "Lua_423446_1", 0 )
		SetModeEx( T_ID, EM_SetModeType_Mark , false )
		DisableQuest( T_ID, true )
	end	
	return 1
end

function Lua_423446_1()
	while true do			
		local QuestID = 423446
		local FinishFlagID = 544287
		local CheckBuffID = 507178
		local CheckRange = 100
		local DoScript = "Lua_423446_break"		
		local FlagGroup = 780595
		CallPlot( OwnerID(), "ks_QuestAddBuff", QuestID, FinishFlagID, CheckBuffID, CheckRange, DoScript )
		
		local T_ID = TargetID()	--玩家
		local O_ID = OwnerID()	--火盆
		local old = Lua_423208_obj( 115897, FlagGroup, 15 )
		local mo = LuaFunc_SearchNPCbyOrgID( OwnerID(), 115940, 50, 0 )
		mo = LuaFunc_CreateObjByObj( 115895, mo )
		ks_ActSetMode( mo )
		AdjustFaceDir( old, O_ID, 0 ) --面向目標
		AdjustFaceDir( mo, O_ID, 0 ) --面向目標
		SetDefIdleMotion( OwnerID(), ruFUSION_MIME_IDLE_STAND )
		Lua_423446_setPos( QuestID, CheckBuffID )
		
		sleep(10)
		AdjustFaceDir( old, mo, 0 ) --面向目標
		PlayMotion( old, ruFUSION_ACTORSTATE_EMOTE_SALUTE2 )	--說話動作
		Say( old, "[SC_423446_1]" ) --再次感謝你們。你們可知為什麼我要你們到這來？
		sleep(25)
		AdjustFaceDir( mo, O_ID, 0 ) --面向目標
		PlayMotion( mo, ruFUSION_ACTORSTATE_EMOTE_POINT )	--指向
		Say( mo, "[SC_423446_2]") --難道這火盆有什麼特殊用途？
		sleep(25)
		PlayMotion( old, ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )	--說話動作
		Say( old, "[SC_423446_3]" ) --的確，當初[ZONE_ZARAMONDE]為了..		
		AdjustFaceDir( mo, old, 0 ) --面向目標
		sleep(50)
		AdjustFaceDir( old, O_ID, 0 ) --面向目標
		Say( old, "[SC_423446_4]" ) --他們擊潰[ZONE_ZARAMONDE]在這裡的駐軍..		
		sleep(25)
		PlayMotion( old, ruFUSION_ACTORSTATE_EMOTE_POINT )	--指向
		sleep(25)
		PlayMotion( mo, ruFUSION_ACTORSTATE_EMOTE_SPEAK )	--說話動作
		Say( mo, "[SC_423446_5]" ) --那支游擊隊現在何處？		
		sleep(25)
		AdjustFaceDir( old, mo, 0 ) --面向目標
		PlayMotion( old, ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )	--搖頭
		Say( old, "[SC_423446_6]" ) --唉......已經有三年沒有任何的消息...		
		sleep(35)
		Say( mo, "[SC_423446_7]" ) --那麼[115868]呢？他在哪？		
		sleep(25)
		PlayMotion( old, ruFUSION_ACTORSTATE_EMOTE_SPEAK )	--說話動作
		Say( old, "[SC_423446_8]" ) --你知道[115891]？我之前不是說..
		sleep(35)
		AdjustFaceDir( old, O_ID, 0 ) --面向目標
		PlayMotion( old, ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )	--搖頭
		Say( old, "[SC_423446_9]" ) --唉，往事不堪回首...		
		sleep(25)
		PlayMotion( mo, ruFUSION_ACTORSTATE_EMOTE_SALUTE2 )	--敬禮
		Say( mo, "[SC_423446_10]" )--你能告知這些
		sleep(10)		
		while true do
			local time = ks_MoveToFlag( old, FlagGroup, 17, 0 )--移動
			sleep(5+time)
			if DW_CheckDis( old, FlagGroup, 17, rand(10) ) == true then
				StopMove( old, false )
				break
			end
		end
		sleep(20)
		CallPlot( OwnerID(), "ks_QuestEnd", QuestID, FinishFlagID, CheckBuffID, CheckRange, DoScript )
		break
	end	
end

function Lua_423446_setPos( QuestID, CheckBuffID )
	local player = {}
	local playerCount = 0
	local FlagGroup = 780595
	local x = GetMoveFlagValue( FlagGroup, 16, EM_RoleValue_X ) 
	local y = GetMoveFlagValue( FlagGroup, 16, EM_RoleValue_Y )
	local z = GetMoveFlagValue( FlagGroup, 16, EM_RoleValue_Z )
	player = SearchRangePlayer ( OwnerID(), 50 ) 
	
	for pry , obj in pairs( player ) do
		playerCount = playerCount + 1
	end
	for i= 0, playerCount-1 do
		if CheckAcceptQuest( player[i], QuestID ) == true and CheckBuff( player[i], CheckBuffID ) == true then 
			AddBuff( player[i], 506098, 0, -1 )--畫面一黑
			sleep(3)
			x = x + rand(20) - rand(20)
			z = z + rand(20) - rand(20)
			SetPos( player[i], x, y, z, 0 )
			CancelBuff( player[i], 506098 )
		end
	end
end

function Lua_423446_break()
	local mo = LuaFunc_SearchNPCbyOrgID( OwnerID(), 115895, 50, 0 )
	local old = LuaFunc_SearchNPCbyOrgID( OwnerID(), 115897, 100, 0 )
		
	if mo ~= nil then delobj(mo) end
	if old ~= nil then delobj(old) end
	ks_resetObj( OwnerID(), nil )	
end

--========================================================================================--

function Lua_423447_set()
	local EM = {	[1]=EM_RoleValue_Register1,
					[2]=EM_RoleValue_Register2,
					[3]=EM_RoleValue_Register3	}
	for i=1, 3 do		
		WriteRoleValue( TargetID(), EM[i], 0 )
	end
end

function Lua_423447_say()
	local T_ID = TargetID() --村民
	local O_ID = OwnerID() --玩家
	local reg = {}
	reg[1] = ReadRoleValue( O_ID, EM_RoleValue_Register1 )
	reg[2] = ReadRoleValue( O_ID, EM_RoleValue_Register2 )
	reg[3] = ReadRoleValue( O_ID, EM_RoleValue_Register3 )
	local pid = ReadRoleValue( T_ID, EM_RoleValue_PID )
	LoadQuestOption( O_ID )
	
	if CheckAcceptQuest( O_ID, 423447 ) == true then
		for i=1, 3 do
			if reg[i] == 0 then			
				if reg[i] ~= pid then
					AddSpeakOption( O_ID, T_ID, "[SC_423447_1]", "Lua_423447_1",0) --詢問和[ZONE_SLEY]有關的訊息
					break
				end
			elseif reg[i] ~= 0 then
				debugmsg(0,0,"reg = "..reg[i])
				--break
			end
		end
	end
end

function Lua_423447_1()
	local T_ID = TargetID() --村民
	local O_ID = OwnerID() --玩家
	local reg = {}
	local count = 0
	local EM = {	[1]=EM_RoleValue_Register1,
					[2]=EM_RoleValue_Register2,
					[3]=EM_RoleValue_Register3	}
	local pid = ReadRoleValue( T_ID, EM_RoleValue_PID )
	
	for i=1, 3 do
		reg[i] = ReadRoleValue( O_ID, EM[i] )
		if reg[i] == 0 then
			WriteRoleValue( O_ID, EM[i], pid )
			DW_QietKillOne( 0, 104111 )
			for j=1, 3 do
				reg[j] = ReadRoleValue( O_ID, EM[j] )
				if reg[j] ~= 0 then
					count = count + 1
					if count == 3 then
						SetFlag( O_ID, 544297, 1 )
					end
				end
			end
			break
		end
	end
	SetSpeakDetail( O_ID, "[SC_423447_2]" ) --[ZONE_SLEY]？你說那個農鎮嗎？
end

--========================================================================================--