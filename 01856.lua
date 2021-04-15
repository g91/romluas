--=========================================================--
-- 待命用--> 安特克羅(115486) 卡拉維(115485) 赫蒂爾(115488)
-- 表演用--> 安特克羅(115484) 卡拉維(115487) 赫蒂爾(115501)
--
--=========================================================--

function Lua_423270()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 423270 ) == true and CheckFlag( OwnerID(), 543911 )==false then	
		AddSpeakOption( OwnerID(), TargetID(), "[SC_423270_0]", "Lua_423270_do", 0 ) --有一些話要對我們說？
	end
end

function Lua_423270_reset( player )
	local cala_Idle = LuaFunc_SearchNPCbyOrgID( OwnerID(), 115485, 200, 0)	--卡拉維(接任務)
	CancelBuff_NoEvent( player, 506710 ) --移除護盾
	CancelBuff_NoEvent( player, 503977 ) --解除定身
	CancelBuff_NoEvent( player, 506112 ) --解除標記	
	WriteRoleValue( cala_Idle, EM_RoleValue_Register, 0 )
end

function Lua_423270_test( )
	local cala_Idle = LuaFunc_SearchNPCbyOrgID( OwnerID(), 115485, 200, 0)--卡拉維(接任務)
	local princess = LuaFunc_SearchNPCbyOrgID( OwnerID(), 115501, 200, 0) --赫蒂爾
	CancelBuff_NoEvent( OwnerID(), 506710 ) --移除護盾
	CancelBuff_NoEvent( OwnerID(), 503977 ) --解除定身
	CancelBuff_NoEvent( OwnerID(), 506112 ) --解除標記
	LuaFunc_ResetObj( princess )		
	WriteRoleValue( cala_Idle, EM_RoleValue_Register, 0 )
end

function Lua_423270_do()
	
	local player = OwnerID() --玩家本身
	if ReadRoleValue( cala_Idle, EM_RoleValue_Register ) == 0 then
		CloseSpeak( player )
		local cala_Idle = LuaFunc_SearchNPCbyOrgID( player, 115485, 200, 0)	--卡拉維(接任務)
		local cala_Act = LuaFunc_SearchNPCbyOrgID( player, 115487, 200, 0)	--卡拉維(演戲用)
		local ant_Act = LuaFunc_SearchNPCbyOrgID( player, 115484, 200, 0) --安特克羅
		local princess = LuaFunc_SearchNPCbyOrgID( player, 115501, 200, 0) --赫蒂爾
		DisableQuest(cala_Act ,true)
		DisableQuest(ant_Act ,true)
		DisableQuest(princess ,true)
		MoveToFlagEnabled( princess, false )
		AddBuff( player, 506112, 1, 300 ) --client用BUFF
		CallPlot( cala_Act, "Lua_423270_0", player, cala_Idle, cala_Act, ant_Act, princess ) 		-- 玩家 卡拉維I 卡拉維A 安特A 領主
		WriteRoleValue( cala_Idle, EM_RoleValue_Register, 1 )
	else
		SetSpeakDetail( player, "[SC_423270_00]" )--是啊！讓我想想該怎麼開口...
	end
end

function Lua_423270_check( player, cala )
	if CheckDistance( player, cala, 200 ) ==false then
		CancelBuff_NoEvent( player, 503977 ) 
		return false
	end
	if  CheckAcceptQuest( player, 423270 ) == false then
		CancelBuff_NoEvent( player, 503977 ) 
		return false
	end
	return true
end

function Lua_423270_0( player, cala_Idle, cala_Act, ant, princess )
	local FlagGroup = 780620
	local Color = "0xffffff00"	-- 強制訊息為黃色
	local x , y , z = 0 , 0 , 0
	WriteRoleValue( princess, EM_RoleValue_IsWalk, 1 )
	MoveToFlagEnabled( princess, false )
	
	Sleep(20)
	AdjustFaceDir( princess, cala_Act, 0 ) --使自己面向目標	
	AdjustFaceDir( ant, cala_Act, 0 ) --使自己面向目標	
	
	Setposbyflag(player  , 780620, 12 ) 					 --傳送玩家
	CastSpell( player, player, 495597 )--玩家被定住(503977)	
	
	if Lua_423270_check( player, cala_Idle )==true then
		PlayMotion( cala_Act, ruFUSION_ACTORSTATE_EMOTE_SPEAK ) --說話動作	
		Say( cala_Act, "[SC_423270_1]" ) --我的自保能力不足...
		Sleep(50)
		Say( cala_Act, "[SC_423270_2]" ) --衝動、輕忽引來許多麻煩...	
		Sleep(40)
	else
		Lua_423270_reset( player )
	end
	
	if Lua_423270_check( player, cala_Idle )==true then	
		PlayMotion( ant, ruFUSION_ACTORSTATE_EMOTE_SPEAK ) --說話動作	
		Say( ant, "[SC_423270_3]" ) --故人之後代...
		AdjustFaceDir( cala_Act, ant, 0 ) --使自己面向目標
		Sleep(30)
	
		PlayMotion( cala_Act, ruFUSION_ACTORSTATE_EMOTE_SPEAK ) --說話動作	
		Say( cala_Act, "[SC_423270_4]" ) --有良好的應對方式...
		Sleep(30)
	
		ScriptMessage( ant, player, 1, "[SC_423270_Sys]", Color ) --聞言，安特克羅雲淡風輕的神情顯露一抹淺笑。
		ScriptMessage( ant, player, 0, "[SC_423270_Sys]", Color )
		PlayMotion( cala_Act, ruFUSION_ACTORSTATE_EMOTE_IDLE ) --閒置動作	
		Sleep(40)
	else
		Lua_423270_reset( player )
	end
	
	if Lua_423270_check( player, cala_Idle )==true then
		PlayMotion( ant, ruFUSION_ACTORSTATE_EMOTE_SPEAK ) --說話動作	
		Say( ant, "[SC_423270_5]" ) --萊慕犬人德銳克．怒牙....
		Sleep(50)
		
		PlayMotion( cala_Act, ruFUSION_ACTORSTATE_EMOTE_SPEAK ) --說話動作	
		Say( cala_Act, "[SC_423270_6]" ) --我明白，雖然不清楚他接連挑釁的目的...
		Sleep(40)

		AdjustFaceDir( cala_Act, princess, 0 ) --使自己面向目標
		PlayMotion( cala_Act, ruFUSION_ACTORSTATE_EMOTE_SPEAK ) --說話動作	
		Say( cala_Act, "[SC_423270_7]" ) --夏多爾統治者...
		Sleep(40)
	else
		Lua_423270_reset( player )
	end
	
	if Lua_423270_check( player, cala_Idle )==true then
		PlayMotion( cala_Act, ruFUSION_ACTORSTATE_EMOTE_SPEAK ) --說話動作	
		Say( cala_Act, "[SC_423270_8]" ) --我曾聽說女英雄潔妮．吉昂特...s
		Sleep(50)
		PlayMotion( cala_Act, ruFUSION_ACTORSTATE_EMOTE_SPEAK ) --說話動作	
		Say( cala_Act, "[SC_423270_9]" ) --別讓假諭令事件再次重演....

		Sleep(20)
	--	ks_MoveToFlag( princess, FlagGroup, 10, 0 )
		Sleep(10)
		x , y , z  =GetMoveFlagValue( FlagGroup , 10 , EM_RoleValue_X ), GetMoveFlagValue( FlagGroup , 10 , EM_RoleValue_Y) , GetMoveFlagValue( FlagGroup , 10 , EM_RoleValue_Z)
		while true do
			local Time = MoveDirect( princess , x , y , z  )
			sleep(Time+1)
	--		LuaFunc_MoveToFlag( princess, FlagGroup, 10, 0 )
			if DW_CheckDis( princess, FlagGroup, 10, 5 ) == true then	
				StopMove( princess  ,false )
				break
			end
		end
	else
		Lua_423270_reset( player )
	end

	if Lua_423270_check( player, cala_Idle )==true then
		--sleep( 10 )
		AdjustFaceDir( princess, cala_Act , 0 ) --使自己面向目標
		--WriteRoleValue( princess, EM_RoleValue_IsWalk, 0 )

		Sleep(10)
		PlayMotion( princess, ruFUSION_ACTORSTATE_CROUCH_BEGIN ) --跪下
		Say( princess, "[SC_423270_10]" ) --是，夏多爾對人王的忠誠不會改變
		Sleep(40)

		--WriteRoleValue( princess, EM_RoleValue_IsWalk, 1 )
		--LuaFunc_MoveToFlag( princess, FlagGroup, 11, 0 )
		x , y , z  =GetMoveFlagValue( FlagGroup , 11 , EM_RoleValue_X ), GetMoveFlagValue( FlagGroup , 11 , EM_RoleValue_Y) , GetMoveFlagValue( FlagGroup , 11 , EM_RoleValue_Z)
		while true do
			local Time = MoveDirect( princess , x , y , z  )
			sleep(Time+1)
			if DW_CheckDis( princess, FlagGroup, 11, 5 ) == true then	
				StopMove( princess  ,false )
				break
			end
		end
		Sleep(20)

		CancelBuff_NoEvent( player, 506112 ) --解除client
		CancelBuff_NoEvent( player, 503977 ) --解除定身
		SetFlag( player, 543911, 1 )	--取得完成條件
		AdjustFaceDir( princess, cala_Act , 0 ) --使自己面向目標
		MoveToFlagEnabled( princess, true )
		sleep(10)
		LuaFunc_ResetObj( princess )					
		WriteRoleValue( cala_Idle, EM_RoleValue_Register, 0 )
	else
		Lua_423270_reset( player )
	end
end






