 --=====================================================--
 -- 出場人物 115482 第三王女(演戲用) 115424安特克羅(待命用) 115423 安特克羅(演戲用) 
 -- Lua_423269_2 處理最後一段劇情
 -- 移動旗標 FlagGroup = 780595 預設值走到編號1 
 -- ks_MoveToFlag( Obj, FlagGroup, FlagNum, Range ) 
 --             要移動角色                移動的亂數範圍 
 --=====================================================--
function Lua_423269()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() ,423269 ) == true then	
		AddSpeakOption( OwnerID(), TargetID(), "[SC_422509_2]", "Lua_423269_do", 0 ) --我該怎麼做？	
	end
end

function Lua_423269_test()
	local princess = LuaFunc_SearchNPCbyOrgID( OwnerID(), 115482, 200, 0) --第三王女
	local ant_Idle = LuaFunc_SearchNPCbyOrgID( OwnerID(), 115424, 200, 0)
	CancelBuff_NoEvent( OwnerID(), 506710 ) --移除護盾
	CancelBuff_NoEvent( OwnerID(), 503977 ) --解除定身
	CancelBuff_NoEvent( princess, 506710 ) --移除護盾
	CancelBuff_NoEvent( OwnerID(), 506112 )
	WriteRoleValue( ant_Idle, EM_RoleValue_Register, 0 )
	local reg = ReadRoleValue( ant_Idle, EM_RoleValue_Register )
	WriteRoleValue( princess, EM_RoleValue_Register, 0 )
	Say( OwnerID(), ReadRoleValue( ant_Idle, EM_RoleValue_Register ) )
end

function Lua_423269_do()
	local player = OwnerID() --玩家本身
	local ant_Idle = LuaFunc_SearchNPCbyOrgID( OwnerID(), 115424, 200, 0)	
	local ant_Act = LuaFunc_SearchNPCbyOrgID( OwnerID(), 115423, 200, 0)	
	if ReadRoleValue( ant_Idle, EM_RoleValue_Register ) == 0 then
		AddBuff( player, 506112, 1, 300 )
		BeginPlot( ant_Act, "Lua_423269_0", 0 ) 		 
		WriteRoleValue( ant_Idle, EM_RoleValue_Register, 1 )
	else
		SetSpeakDetail( player, "[SC_423269_0]" )--等待她周遭的紛亂氣息稍微平靜...
	end
end

function Lua_423269_0()
	local player = TargetID() --玩家
	local ant_Act = OwnerID() --安特克羅本身
	local princess = LuaFunc_SearchNPCbyOrgID( OwnerID(), 115482, 200, 0) --第三王女	
	DisableQuest(princess,true)
	WriteRoleValue( princess, EM_RoleValue_Register, 0 )
	WriteRoleValue( ant_Act, EM_RoleValue_IsWalk, 1 )
	CloseSpeak( player )
	
	Sleep(20)
	PlayMotion( ant_Act, ruFUSION_ACTORSTATE_EMOTE_SPEAK )	--說話動作
	Say( ant_Act, "[SC_423269_1]" )--交付信任，依照指示行動，你會毫髮無傷。
	Sleep(20)
	CastSpell( player, player, 495597 )--玩家被定住(503977)
	SetPosByFlag( player, 780608, 20 )
	Sleep(10)
	CallPlot( ant_Act, "Lua_423269_1", player ) --開始施法
	Say( ant_Act, "[SC_423269_2]" ) --褪去形體表象，凝聚靈魂意志，保有與自然同步之心。
	Sleep(30)
	Say( ant_Act, "[SC_423269_3]" ) --所求益深，執念將匯集紛亂氣息成形，蜜莉恩．吉昂特，影響妳的並非全然是千羽曆。	
end

function Lua_423269_1( player )
	local ant_Act = OwnerID() --安特克羅本身	
	local ant_Idle = LuaFunc_SearchNPCbyOrgID( OwnerID(), 115424, 200, 0)
	local princess = LuaFunc_SearchNPCbyOrgID( ant_Act, 115482, 200, 0) --第三王女
	local fireGroup = {}
	local time = 15
	AddBuff( ant_Act, 502662, 1, 300 ) --手發光	
	PlayMotionEX( ant_Act,ruFUSION_ACTORSTATE_CHANNEL_BEGIN, ruFUSION_ACTORSTATE_CHANNEL_LOOP ) --施法動作
	Sleep(20)
	CastSpell( ant_Act, princess, 495598 )
	sleep(30)
	BeginPlot( princess, "Lua_423269_princess", 0 )	
	Sleep(10)
	CancelBuff_NoEvent( ant_Act, 502662 ) --解除發光	
	Sleep(20)	
	PlayMotion( ant_Act, ruFUSION_ACTORSTATE_EMOTE_SPEAK )	--說話動作
	Say( ant_Act, "[SC_423269_4]" ) --此時她周遭的紛亂氣息稍微平靜，請你把力量挹注進熾熱烈焰中。	
	CancelBuff_NoEvent( player, 503977 ) --解除定身
	Sleep(20)
	for i=0, time do
		sleep(10)
		if ReadRoleValue( princess, EM_RoleValue_Register ) == 1 then 
			CallPlot( ant_Act, "Lua_423269_2", player )			
			break
		end
		if i == time/3 then
			Say( ant_Act, "[SC_423269_11]") --錯過此刻，便要等候下一次時機。
		elseif i == time then
			fireGroup = LuaFunc_SearchNPCbyOrgID( ant_Act, 115425, 200, 0) --火焰群
			Say( ant_Act, "[SC_423269_10]" ) --最好的時機已過，等待紛亂氣息稍微平靜時再次進行。
			for i=0, table.getn( fireGroup )-1 do							
				DelObj( fireGroup[i] )					
			end
			WriteRoleValue( ant_Idle, EM_RoleValue_Register, 0 )
			CancelBuff_NoEvent( player, 506112 )
		end
	end	
end

function Lua_423269_2( player )
	local ant_Act = OwnerID() --安特克羅本身	
	local ant_Idle = LuaFunc_SearchNPCbyOrgID( OwnerID(), 115424, 200, 0)
	local princess = LuaFunc_SearchNPCbyOrgID( ant_Act, 115482, 200, 0) --第三王女	
	local FlagGroup = 780608
	WriteRoleValue( ant_Act, EM_RoleValue_IsWalk, 1 )
	Sleep(40)
	Say( ant_Act, "[SC_423269_5]" ) --暫時先如此處理，紊亂根源仍出於千羽曆… 
	CancelBuff_NoEvent( princess, 506710 ) --移除護盾
	while true do
		ks_MoveToFlag( ant_Act, FlagGroup, 20, 0 ) --轉身走掉
		sleep(10)
		ks_MoveToFlag( ant_Act, FlagGroup, 21, 0 ) 
		sleep(10)
		if DW_CheckDis( ant_Act, FlagGroup, 21, 30 ) == true then
			Say( ant_Act, "[SC_423269_6]" ) --不，是伊利雅爾…
			SetFlag( player, 543908, 1 )	--取得完成條件
			ks_MoveToFlag( ant_Act, FlagGroup, 22, 0 ) 
			sleep(10)
			CancelBuff_NoEvent( player, 506112 )
			LuaFunc_ResetObj( ant_Act )
			WriteRoleValue( ant_Idle, EM_RoleValue_Register, 0 )
			WriteRoleValue( princess, EM_RoleValue_Register, 0 )
			break
		end
	end

end

function Lua_423269_princess()
	Lua_Davis_BornByMultilateral( 115425 , 8 , 15 )
end

function Lua_423269_fire()	
	SetPlot( OwnerID(),"touch", "Lua_423269_fire_d", 30 )
end

function Lua_423269_fire_d()	
	local player = OwnerID() --玩家
	local fire = TargetID() --火焰本身	
	local princess = LuaFunc_SearchNPCbyOrgID( fire, 115482, 200, 0) --第三王女
	WriteRoleValue( princess, EM_RoleValue_Register, 1 )
	CallPlot( fire, "Lua_423269_fire_do", player, fire )	
end

function Lua_423269_fire_do( player, fire )	
	local princess = LuaFunc_SearchNPCbyOrgID( fire, 115482, 200, 0) --第三王女
	local ant_Idle = LuaFunc_SearchNPCbyOrgID( fire, 115424, 200, 0) --安特克羅本身				
	local fireGroup = LuaFunc_SearchNPCbyOrgID( fire, 115425, 200, 0) --火焰群
	for i=0, table.getn( fireGroup )-1 do	
		SetModeEx( fireGroup[i], EM_SetModeType_Mark , false )
		SetPlot( fireGroup[i],"touch", "", 0 )
		sleep(2)
		if fireGroup[i] ~= fire then
			DelObj( fireGroup[i] )
		end
	end
	CastSpell( fire, princess, 495601 ) --風繚繞 582769
	Sleep(30)
	DelObj( fire )
end

