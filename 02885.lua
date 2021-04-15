----------------------------------------------------------------------------------------------------
Function Z26_NPC122582_00()
	local NPC=OwnerID()
	SetDefIdleMotion( NPC, ruFUSION_MIME_IDLE_CROUCH )
	SetPlot( NPC, "range", "Z26_NPC122582_01", 150 ) 
End
Function Z26_NPC122582_01()
	local PID=OwnerID()
	local NPC=TargetID()
	if CheckAcceptQuest( PID, 426289 )==true and
	CheckFlag( PID, 548171 )==false then
		SetFlag( PID, 548171, 1 )
	end
End
----------------------------------------------------------------------------------------------------
Function Z26_Q426290_00()
	local PID=TargetID()
	local NPC=OwnerID()	
	SetFlag( PID, 548191, 0 )
	SetFlag( PID, 548192, 0 )
	SetFlag( PID, 548193, 0 )
	if ReadRoleValue( NPC, EM_RoleValue_Register1 )==0 then
		WriteRoleValue( NPC, EM_RoleValue_Register1, 1 )
		CallPlot( NPC, "Z26_Q426290_01", PID, NPC )
	else return
	end
End
Function Z26_Q426290_01( PID, NPC )
	local x, y, z, dir=DW_Location( NPC )
	local NewNPC=CreateObj( 122598, x, y, z, dir, 1 )
	SetModeEx( NewNPC, EM_SetModeType_Save, false )
	SetModeEx( NewNPC, EM_SetModeType_Gravity, false )
	MoveToFlagEnabled( NewNPC, false )
	AdjustFaceDir( NewNPC, PID, 0 )
	AddToPartition( NewNPC, 0 )
	PlayMotion( NewNPC, ruFUSION_ACTORSTATE_CROUCH_END )
	Sleep( 15 ) NpcSay( NewNPC, "[SC_Q426290_00]" )
	Sleep( 15 ) PlayMotion( NewNPC, ruFUSION_ACTORSTATE_EMOTE_IDLE1 )
	Sleep( 35 ) SetDefIdleMotion( NewNPC, ruFUSION_MIME_JUMP_LOOP )
	Sleep( 05 ) MoveDirect( NewNPC, x-10, y+20, z+10 )
	Sleep( 20 ) Delobj( NewNPC )
	WriteRoleValue( NPC, EM_RoleValue_Register1, 0 )
End
----------------------------------------------------------------------------------------------------
Function Z26_NPC122595_00()
	local NPC=OwnerID()
	SetPlot( NPC, "range", "Z26_NPC122595_01", 100 )
End
Function Z26_NPC122595_01()
	local PID=OwnerID()
	local NPC=TargetID()
	if CheckAcceptQuest( PID, 426290 )==true and
	CheckFlag( PID, 548191 )==false and
	CheckBuff( PID, 624482 )==false then
		ScriptMessage( PID, PID, 2, "[SC_NPC122595ARRIVE_01]", 0 )
		AddBuff ( PID, 624482, 0, 10 )
	end
End
Function Z26_NPC122596_00()
	local NPC=OwnerID()
	SetPlot( NPC, "range", "Z26_NPC122596_01", 100 )
End
Function Z26_NPC122596_01()
	local PID=OwnerID()
	local NPC=TargetID()
	if CheckAcceptQuest( PID, 426290 )==true and
	CheckFlag( PID, 548192 )==false and
	CheckBuff( PID, 624482 )==false then
		ScriptMessage( PID, PID, 2, "[SC_NPC122595ARRIVE_01]", 0 )
		AddBuff ( PID, 624523, 0, 10 )
	end
End
Function Z26_NPC122597_00()
	local NPC=OwnerID()
	SetPlot( NPC, "range", "Z26_NPC122597_01", 100 )
End
Function Z26_NPC122597_01()
	local PID=OwnerID()
	local NPC=TargetID()
	if CheckAcceptQuest( PID, 426290 )==true and
	CheckFlag( PID, 548193 )==false and
	CheckBuff( PID, 624482 )==false then
		ScriptMessage( PID, PID, 2, "[SC_NPC122595ARRIVE_01]", 0 )
		AddBuff ( PID, 624525, 0, 10 )
	end
End
----------------------------------------------------------------------------------------------------
Function Z26_CAST850967_00()
	local PID=OwnerID()
	local NPC=SearchRangeNPC( PID, 200 )
	for i=0, table.getn(NPC), 1 do
		if ReadRoleValue ( NPC[i], EM_RoleValue_OrgID )==122595 then
			return true
		end
	end
	ScriptMessage( PID, PID, 1, "[SC_NPC122595ARRIVE_02]!", 0 )
	return false
End
Function Z26_CAST850994_00()
	local PID=OwnerID()
	local NPC=SearchRangeNPC( PID, 200 )
	for i=0, table.getn(NPC), 1 do
		if ReadRoleValue ( NPC[i], EM_RoleValue_OrgID )==122596 then
			return true
		end
	end
	ScriptMessage( PID, PID, 1, "[SC_NPC122595ARRIVE_02]", 0 )
	return false
End
Function Z26_CAST850995_00()
	local PID=OwnerID()
	local NPC=SearchRangeNPC( PID, 200 )
	for i=0, table.getn(NPC), 1 do
		if ReadRoleValue ( NPC[i], EM_RoleValue_OrgID )==122597 then
			return true
		end
	end
	ScriptMessage( PID, PID, 1, "[SC_NPC122595ARRIVE_02]", 0 )
	return false
End
----------------------------------------------------------------------------------------------------
Function Z26_BUFF624520_00()
	local PID=OwnerID()
	SetFlag( PID, 548191, 1 )
	DW_QietKillOne( PID, 107843 )
End
Function Z26_BUFF624524_00()
	local PID=OwnerID()
	SetFlag( PID, 548192, 1 )
	DW_QietKillOne( PID, 107843 )
End
Function Z26_BUFF624526_00()
	local PID=OwnerID()
	SetFlag( PID, 548193, 1 )
	DW_QietKillOne( PID, 107843 )
End
----------------------------------------------------------------------------------------------------
Function Z26_NPC122584SPEAK_00()
	local PID=OwnerID()
	local NPC=TargetID()
	if CheckAcceptQuest( PID, 426291 )==true and
	CheckFlag( PID, 548172 )==false then
		AddSpeakOption( PID, NPC, "[SC_NPC122584SPEAK_00]", "Z26_NPC122584SPEAK_01", 0 )
	else	LoadquestOption( PID )
	end
	LoadquestOption( PID )
End
Function Z26_NPC122584SPEAK_01()
	local PID=OwnerID()
	SetFlag( PID, 548172, 1 )
	CloseSpeak( PID )
End
----------------------------------------------------------------------------------------------------
Function Z26_NPC122586SPEAK_00()
	local PID=OwnerID()
	local NPC=TargetID()
	if CheckAcceptQuest( PID, 426292 )==true and
	CheckFlag( PID, 548173 )==false then
		AddSpeakOption( PID, NPC, "[SC_NPC122586SPEAK_01]", "Z26_NPC122586SPEAK_01", 0 )
	else	LoadquestOption( PID )
	end
	if CheckAcceptQuest( PID, 426298 )==true and
	CheckFlag( PID, 548178 )==false then
		AddSpeakOption( PID, NPC, "[SC_NPC122586SPEAK_02]", "Z26_NPC122586SPEAK_02", 0 )
	else	LoadquestOption( PID )
	end
	LoadquestOption( PID )
End
Function Z26_NPC122586SPEAK_01()
	local PID=OwnerID()
	SetFlag( PID, 548173, 1 )
	CloseSpeak( PID )
End
Function Z26_NPC122586SPEAK_02()
	local PID=OwnerID()
	SetFlag( PID, 548178, 1 )
	CloseSpeak( PID )
End
----------------------------------------------------------------------------------------------------
Function Z26_NPC122587_00()
	local NPC=OwnerID()
	SetPlot( NPC, "range", "Z26_NPC122587_01", 100 )
End
Function Z26_NPC122587_01()
	local PID=OwnerID()
	local NPC=TargetID()
	if CheckAcceptQuest( PID, 426293 )==true and
	CheckFlag( PID, 548174 )==false then
		SetFlag( PID, 548174, 1 )
	end
End
----------------------------------------------------------------------------------------------------
Function Z26_NPC122588_00()
	local NPC=OwnerID()
	SetDefIdleMotion( NPC, ruFUSION_MIME_JUMP_LOOP )
End
----------------------------------------------------------------------------------------------------
Function Z26_NPC122537_00()
	local NPC=OwnerID()
	local PID=TargetID()
	SetDefIdleMotion( NPC, ruFUSION_MIME_IDLE_COMBAT_UNARMED )
End
----------------------------------------------------------------------------------------------------
Function Z26_NPC122537_IDLE00()
	local NPC=OwnerID()
	local x, y, z, dir=DW_Location( NPC )
	local SFX=CreateObj( 122748, x, y+5, z, dir, 1 )
	SetModeEx( SFX, EM_SetModeType_MARK, false )
	SetModeEx( SFX, EM_SetModeType_Gravity, false )
	AddToPartition( SFX, 0 )
	AddBuff( SFX, 624615, 0, 3 )
	Sleep( 30 )
	Delobj( SFX )
End
----------------------------------------------------------------------------------------------------
Function Z26_Q426295TOUCH_00()
	local PID=OwnerID()
	local NPC=TargetID()
	local x, y, z, dir=DW_Location( NPC )
	SetPos( PID, x, y, z, dir )
	CastSpell( PID, PID, 851051 )
	if ReadRoleValue( NPC, EM_RoleValue_Register1 )==0 then
		WriteRoleValue( NPC, EM_RoleValue_Register1, 1 )
		CallPlot( NPC, "Z26_Q426295SHOW_00", NPC, PID )
	end
	return true
End
----------------------------------------------------------------------------------------------------
Function Z26_Q426295SHOW_00( Ctrl, PID )
	local Npc=0
	local Role=0
	local Pool=SearchRangeNPC( Ctrl, 100 )
	for i=0, table.getn( Pool ), 1 do
		if ReadRoleValue ( Pool[i], EM_RoleValue_OrgID )==122587 then
			Npc=Pool[i]
		end
	end
	local x, y, z, dir=DW_Location( NPC )
	Role=CreateObj( 122750, x, y, z, dir, 1 )
	SetModeEx( Role, EM_SetModeType_Save, false )
	SetModeEx( Role, EM_SetModeType_Mark, true )
	SetModeEx( Role, EM_SetModeType_ShowRoleHead, false )
	SetModeEx( Role, EM_SetModeType_HideName, false )
	MoveToFlagEnabled( Role, false )
	AdjustFaceDir( Role, PID, 0 )
	AddToPartition( Role, 0 )
	NpcSay( Role, "[SC_NPC122750_00]" )
	PlayMotion( Role, ruFUSION_ACTORSTATE_EMOTE_WAVE )
	Sleep( 30 )
	DelObj( Role )
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, 0 )
End
----------------------------------------------------------------------------------------------------
Function Z26_Q426294COMPLETE_00()
	local PID=TargetID()
	SetFlag( PID, 548179, 1 )
End
----------------------------------------------------------------------------------------------------
Function Z26_NPC122589_00()
	local NPC=OwnerID()
	SetDefIdleMotion( NPC, ruFUSION_MIME_JUMP_LOOP )
End
----------------------------------------------------------------------------------------------------
Function Z26_Q426295ACCEPT_00()
	local PID=TargetID()
	SetFlag( PID, 548179, 0 )
End
----------------------------------------------------------------------------------------------------
Function Z26_NPC122590_00()
	local NPC=OwnerID()
	SetDefIdleMotion( NPC, ruFUSION_MIME_IDLE_CROUCH )
End
----------------------------------------------------------------------------------------------------
Function Z26_NPC122531_00()
	local NPC=OwnerID()
	AddBuff( NPC, 624549, 0, -1 )
	AddBuff( NPC, 624550, 0, -1 )
	SetDefIdleMotion( NPC, ruFUSION_MIME_CHANNEL_LOOP )
End
----------------------------------------------------------------------------------------------------
Function Z26_NPC122594_00()
	local NPC=OwnerID()
	AddBuff( NPC, 624551, 0, -1 )
	SetDefIdleMotion( NPC, ruFUSION_MIME_CAST_LOOP )
End
----------------------------------------------------------------------------------------------------
Function Z26_NPC122536_00()
	local NPC=OwnerID()
	SetPlot( NPC, "range", "Z26_NPC122536_01", 200 ) 
End
Function Z26_NPC122536_01()
	local PID=OwnerID()
	local NPC=TargetID()
	if CheckAcceptQuest( PID, 426295 )==true and
	CheckFlag( PID, 548175 )==false then
		SetFlag( PID, 548175, 1 )
		SetFlag( PID, 548179, 0 )
	end
End
----------------------------------------------------------------------------------------------------
Function Z26_Q426297ACCEPT_00()
	local PID=TargetID()
	ScriptMessage( PID, PID, 2, "[SC_Q426297_00]", 0 )--與摩瑞克對話可開始進行劇情事件！
End
----------------------------------------------------------------------------------------------------
Function Z26_NPC122590SPEAK_00()
	local PID=OwnerID()
	local NPC=TargetID()
	if CheckAcceptQuest( PID, 426297 )==true and
	CheckFlag( PID, 548177 )==false then
		if ReadRoleValue( NPC, EM_RoleValue_Register1 )==0 then
			AddSpeakOption( PID, NPC, "[SC_NPC122590SPEAK_01]", "Z26_NPC122590SPEAK_01", 0 )			
		else	AddSpeakOption( PID, NPC, "[SC_NPC122590SPEAK_02]", "Z26_NPC122590SPEAK_02", 0 )
		end
	else	LoadquestOption( PID )
	end
	LoadquestOption( PID )
End
----------------------------------------------------------------------------------------------------
Function Z26_NPC122590SPEAK_01()
	local PID=OwnerID()
	local NPC=TargetID()
	if ReadRoleValue( NPC, EM_RoleValue_Register1 )==0 then
		WriteRoleValue( NPC, EM_RoleValue_Register1, 1 )
		CallPlot( NPC, "Z26_Q426297SHOW_00", PID, NPC )
	else	ScriptMessage( PID, PID, 1, "[SC_NPC122590SPEAK_03]", 0 )
	end
	CloseSpeak( PID )
End
----------------------------------------------------------------------------------------------------
Function Z26_NPC122590SPEAK_02()
	local PID=OwnerID()
	local NPC=TargetID()
	SetFlag( PID, 548180, 1 )
	CloseSpeak( PID )
End
----------------------------------------------------------------------------------------------------
Function Z26_Q426297SHOW_00( PID, Ctrl )
	local Role={}
	local X, Y, Z, dir1=DW_Location( Ctrl )
	local L, M, N, dir2=DW_Location( 781284, 2 )
	local O, P, Q, dir3=DW_Location( 781284, 3 )
	Role[1]=CreateObj( 122449, X+4, Y, Z-5, dir1, 1 )--摩瑞克．渥林特
	Role[2]=CreateObj( 122599, L, M, N, dir2, 1 )--派特克洛斯
	Role[3]=CreateObj( 122600, O, P, Q, dir3, 1 )--奎蘭達
	Role[4]=CreateObj( 122502, L, M, N, dir2, 1 )--Q426297計數器
	Role[5]=CreateObj( 122620, O, P, Q, dir3, 1 )--火焰電流02
	for i=1, 3, 1 do
		SetModeEx( Role[i], EM_SetModeType_Save, false )
		SetModeEx( Role[i], EM_SetModeType_Mark, true )
		SetModeEx( Role[i], EM_SetModeType_ShowRoleHead, true )
		SetModeEx( Role[i], EM_SetModeType_HideName, false )
		MoveToFlagEnabled( Role[i], false )
		WriteRoleValue( Role[i], EM_RoleValue_IsWalk, 0 )
		AddToPartition( Role[i], 0 )
	end
	for j=4, 5, 1 do
		SetModeEx( Role[j], EM_SetModeType_Save, false )
		SetModeEx( Role[j], EM_SetModeType_Mark, false )
		SetModeEx( Role[j], EM_SetModeType_ShowRoleHead, false )
		SetModeEx( Role[j], EM_SetModeType_HideName, true )
		MoveToFlagEnabled( Role[j], false )
		AddToPartition( Role[j], 0 )
	end
	WriteRoleValue( Role[3], EM_RoleValue_Register1, Role[5] )
	AdjustFaceDir( Role[2], Role[3], 0 )
	AdjustFaceDir( Role[3], Role[2], 0 )
	AddBuff( Role[2], 624549, 0, -1 )
	AddBuff( Role[2], 624550, 0, -1 )
	AddBuff( Role[3], 624551, 0, -1 )
	SetDefIdleMotion( Role[2], ruFUSION_MIME_CHANNEL_LOOP )
	SetDefIdleMotion( Role[3], ruFUSION_MIME_CAST_LOOP )
	CastSpell( Ctrl, Role[1], 851026 )
	PlayMotion( Role[1], ruFUSION_ACTORSTATE_CROUCH_END )
	SetDefIdleMotion( Role[1], ruFUSION_MIME_IDLE_COMBAT_1H )
	SetFlag( PID, 548180, 1 )
	---------------------------------------------------------------------------------------
	CallPlot( Role[4], "Z26_NPC122502COUNT_00", Role[4] )
	AdjustFaceDir( Role[1], Role[2], 0 )
	Sleep( 10 ) LuaFunc_MoveToFlag( Role[1], 781284, 4, 0 )
	Sleep( 05 ) NpcSay( Role[1], "[SC_Q426297_21]" )--[$PLAYERNAME]！快跟上！
	Sleep( 10 ) LuaFunc_MoveToFlag( Role[1], 781284, 1, 0 )
	Sleep( 05 ) SetDefIdleMotion( Role[1], ruFUSION_MIME_IDLE_STAND )
	Sleep( 05 ) AdjustFaceDir( Role[1], Role[2], 0 )
	Sleep( 10 ) NpcSay( Role[1], "[SC_Q426297_01]" )--火龍之王！
	PlayMotion( Role[1], ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Sleep( 25 ) NpcSay( Role[2], "[SC_Q426297_02]" )--哼！又是你們這群渾身臭味的人類！
	Sleep( 30 ) NpcSay( Role[1], "[SC_Q426297_03]" )--你必須立刻停止消耗自己的力量！光龍他現在需要你的幫助！
	PlayMotion( Role[1], ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Sleep( 30 ) NpcSay( Role[2], "[SC_Q426297_04]" )--什麼！你是說邦喀雷姆斯！
	Sleep( 25 ) NpcSay( Role[2], "[SC_Q426297_05]" )--難道......
	Sleep( 05 ) ScriptMessage( Role[1], PID, 2, "[SC_Q426297_06]", 0 )--火龍之王保留住一部份的力量施展火之封印...
	Sleep( 30 ) CastSpell( Role[2], Role[3], 851024 )
	Sleep( 50 ) ScriptMessage( Role[1], PID, 2, "[SC_Q426297_07]", 0 )--魔將[122594]已經暫時被困入神殿的內部...但封印卻極不穩定...
	Sleep( 40 ) SetDefIdleMotion( Role[2], ruFUSION_MIME_IDLE_STAND )
	CancelBuff( Role[2], 624549 )
	AdjustFaceDir( Role[2], Role[1], 0 )
	NpcSay( Role[2], "[SC_Q426297_08]" )--好！我倒是可以聽聽看你們到底想說什麼！
	Sleep( 30 ) ScriptMessage( Role[1], PID, 2, "[SC_Q426297_09]", 0 )--摩瑞克向火龍之王解釋了有關光龍目前的情況...
	PlayMotion( Role[1], ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Sleep( 40 ) NpcSay( Role[2], "[SC_Q426297_10]" )--人類！憑什麼要我相信你們所說的話...
	Sleep( 35 ) NpcSay( Role[1], "[SC_Q426297_11]" )--火龍之王...你認為你是如何脫離魔將[122594]的禁錮...
	PlayMotion( Role[1], ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Sleep( 40 ) NpcSay( Role[1], "[SC_Q426297_12]" )--當然...你不一定需要相信我們...
	PlayMotion( Role[1], ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Sleep( 35 ) NpcSay( Role[1], "[SC_Q426297_13]" )--身為火龍之王...你自然會知道事情的真相...
	PlayMotion( Role[1], ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Sleep( 30 ) NpcSay( Role[2], "[SC_Q426297_14]" )--好...我就暫時留住你們的性命！
	CastSpell( Role[2], Role[2], 851032 )
	Sleep( 10 ) ScriptMessage( Role[1], PID, 2, "[SC_Q426297_16]", 0 )--火龍之王維持著人類形態展開行動...
	Sleep( 25 ) ScriptMessage( Role[1], PID, 2, "[SC_Q426297_17]", 0 )--似乎是火龍之王對幽龍已開始有所顧忌...
	Sleep( 30 ) NpcSay( Role[2], "[SC_Q426297_15]" )--告訴邦喀雷姆斯...龍族的事情我會親自去查清楚！
	Sleep( 30 ) CastSpell( Role[2], Role[2], 851035 )
	NpcSay( Role[2], "[SC_Q426297_18]" )--如果邦喀雷姆斯真的需要我的協助...他會知道我在哪裡！
	Sleep( 30 ) ScriptMessage( Role[1], PID, 2, "[SC_Q426297_19]", 0 )--火龍之王離開了[ZONE_FLAME_TEMPLE]......
	LuaFunc_MoveToFlag( Role[2], 781284, 5, 0 )
	AdjustFaceDir( Role[1], Role[2], 0 )
	CastSpell( Role[2], Role[2], 851032 )
	Delobj( Role[2] )
	ScriptMessage( Role[1], PID, 2, "[SC_Q426297_20]", 0 )--而火龍之王的表態似乎也讓摩瑞克放心了許多......
	Sleep( 20 ) DelObj( Role[1] )
	---------------------------------------------------------------------------------------
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, 0 )
End
----------------------------------------------------------------------------------------------------
Function Z26_BUFF624570_00()
	local NPC1=OwnerID()
	local NPC2=TargetID()
	local NPC3=ReadRoleValue( NPC2, EM_RoleValue_Register1 )
	SetDefIdleMotion( NPC1, ruFUSION_MIME_IDLE_COMBAT_1H )
	CallPlot( NPC2, "Z26_BUFF624570_01", NPC1, NPC2, NPC3 )
End
Function Z26_BUFF624570_01( NPC1, NPC2, NPC3 )
	Sleep( 15 ) NpcSay( NPC2, "[SC_122594_00]" )
	CancelBuff( NPC1, 624550 )
	Sleep( 15 )
	Delobj( NPC2 )
	Delobj( NPC3 )
End
----------------------------------------------------------------------------------------------------
Function Z26_NPC122502COUNT_00( NPC )
	local PID1={}
	local PID2={}
	local POS=0
	for i=1, 36, 1 do
		PID1=SearchRangePlayer( NPC, 400 )
		for j=0, table.getn( PID1 ), 1 do
			if CheckID( PID1[j] )==true and
			CheckAcceptQuest( PID1[j], 426297 )==true and
			CheckFlag( PID1[j], 548177 )==false and
			CheckFlag( PID1[j], 548180 )==true then
				AddBuff( PID1[j], 624583, 0, -1 )
			end
		end
		Sleep( 20 )
	end
	PID2=SearchRangePlayer( NPC, 400 )	
	for k=0, table.getn( PID2 ), 1 do
		if CheckID( PID2[k] )==true then
			POS=Lua_BuffPosSearch( PID2[k], 624583 )
			if POS~=-1 and
			BuffInfo( PID2[k], Pos, EM_BuffInfoType_Power )>=12 and
			CheckFlag( PID1[k], 548180 )==true then
				CancelBuff( PID2[k], 624583 )
				SetFlag( PID2[k], 548177, 1 )
				SetFlag( PID2[k], 548180, 0 )
			end
		end				
	end
	Delobj( NPC )	
end
----------------------------------------------------------------------------------------------------
Function Z26_NPC122617EFX_00()
	AddBuff( OwnerID(), 624570, 0, 4 )
End
----------------------------------------------------------------------------------------------------
Function Z26_NPC122737_00()
	local NPC=OwnerID()
	AddBuff( NPC, 622119, 0, -1 )
End
----------------------------------------------------------------------------------------------------
Function Z26_NPC122744FX_00()
	local NPC=OwnerID()
	local x, y, z, dir=DW_Location( NPC )
	SetModeEx( NPC, EM_SetModeType_Gravity, false )
	MoveToFlagEnabled( NPC, false )
	MoveDirect( NPC, x, y+55, z )
End
----------------------------------------------------------------------------------------------------
Function Z26_NPC122619_00()
	local NPC=OwnerID()
	AddBuff( NPC, 624601, 0, -1 )
	AddBuff( NPC, 624603, 0, -1 )
End
----------------------------------------------------------------------------------------------------
Function Z26_Q426296TOUCH_00()
	local NPC=TargetID()
	CallPlot( NPC, "Z26_Q426296TOUCH_01", NPC )
	return true
End
Function Z26_Q426296TOUCH_01( NPC )
	local SFX=SearchRangeNPC( NPC, 120 )
	local PID=SearchRangePlayer( NPC, 50 )
	for i=0, table.getn( SFX ), 1 do
		if ReadRoleValue ( SFX[i], EM_RoleValue_OrgID )==122619 then
			CallPlot( SFX[i], "LuaFunc_ResetObj", SFX[i] )
		end
	end
	for j=0, table.getn( PID ), 1 do
		if CheckAcceptQuest( PID[j], 426296 )==true and
		CheckFlag( PID[j], 548176 )==false then
			SetFlag( PID[j], 548176, 1 )
		end
	end
End
----------------------------------------------------------------------------------------------------
Function Z26_Q426295COMPLETE_00()
	local PID=TargetID()
	SetFlag( PID, 542195, 1 )
End
----------------------------------------------------------------------------------------------------
Function Z26_Q426296COMPLETE_00()
	local PID=TargetID()
	SetFlag( PID, 542195, 0 )
End
----------------------------------------------------------------------------------------------------
Function Z26_Q426297COMPLETE_00()
	local PID=TargetID()
	SetFlag( PID, 548177, 1 )
End
----------------------------------------------------------------------------------------------------
Function Z26_Q426298COMPLETE_00()
	local PID=TargetID()
	SetFlag( PID, 548177, 0 )
End
----------------------------------------------------------------------------------------------------
Function Z26_Q426291ACCEPT_00()
	local NPC=OwnerID()
	if ReadRoleValue( NPC, EM_RoleValue_Register1 )==0 then
		WriteRoleValue( NPC, EM_RoleValue_Register1, 1 )
		CallPlot( NPC, "Z26_Q426291ACCEPT_01", NPC )
	else	return
	end
End
Function Z26_Q426291ACCEPT_01( NPC )
	Sleep( 10 ) NpcSay( NPC, "[SC_Q426291_00]" )
	PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_IDLE1 )
	Sleep( 10 ) WriteRoleValue( NPC, EM_RoleValue_Register1, 0 )
End
----------------------------------------------------------------------------------------------------
Function Z26_Q426296ACCEPT_00()
	local Ctrl=OwnerID()
	if ReadRoleValue( Ctrl, EM_RoleValue_Register1 )==0 then
		WriteRoleValue( Ctrl, EM_RoleValue_Register1, 1 )
		CallPlot( Ctrl, "Z26_Q426296ACCEPT_01", Ctrl )
	else return
	end
End
Function Z26_Q426296ACCEPT_01( Ctrl )
	local x, y, z, dir=DW_Location( Ctrl )
	local NPC=CreateObj( 122756, x, y+1, z, dir, 1 )
	SetModeEx( NPC, EM_SetModeType_Save, false )
	SetModeEx( NPC, EM_SetModeType_Gravity, false )
	MoveToFlagEnabled( NPC, false )
	SetDefIdleMotion( NPC, ruFUSION_MIME_JUMP_LOOP )
	AddToPartition( NPC, 0 )
	Sleep( 05 ) NpcSay( NPC, "[SC_Q426296_00]" )
	Sleep( 05 ) MoveDirect( NPC, x-1, y+50, z+1 )
	Sleep( 20 ) DelObj( NPC )
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, 0 )
End
----------------------------------------------------------------------------------------------------