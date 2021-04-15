----------------------------------------------------------------------------------------------------01肩ヱ诀[426426]
Function Z26_Q426426ACCEPT_00()
	local NPC=OwnerID()
	local PID=TargetID()
	AddBuff( PID, 624711, 0, 4 )
	ScriptMessage( PID, PID, 2, "[SC_Q426426_00]", 0 )
End
Function Z27_BUFF624712_00()
	local PID=OwnerID()
	ChangeZone( PID, 15, 0, -8965.3, -114.7, 9955.0, 268.0 )
End
Function Z27_NPC122764SPEAK_00()
	local PID=OwnerID()
	local NPC=TargetID()
	if CheckAcceptQuest( PID, 426426 )==true and
	CheckFlag( PID, 548195 )==false then
		AddSpeakOption( PID, NPC, "[SC_Q426426_01]", "Z27_NPC122764SPEAK_02", 0 )
	else	LoadquestOption( PID )
	end
	LoadquestOption( PID )
End
Function Z27_NPC122764SPEAK_02()
	local PID=OwnerID()
	LoadquestOption( PID )
	SetFlag( PID, 548195, 1 )
End
----------------------------------------------------------------------------------------------------02ㄏ牡[426427]
Function Z27_NPC122767SPEAK_00()
	local PID=OwnerID()
	local NPC=TargetID()
	if CheckAcceptQuest( PID, 426427 )==true then
		AddSpeakOption( PID, NPC, "[SC_Q426427_00]", "Z27_NPC122767SPEAK_01", 0 )
	else	LoadquestOption( PID )
	end
	LoadquestOption( PID )
End
Function Z27_NPC122767SPEAK_01()
	local PID=OwnerID()
	local NPC=TargetID()
	SetSpeakDetail( PID, "[SC_Q426427_01]" )
	if CheckFlag( PID, 548197 )==false then
		SetFlag( PID, 548197, 1 )
	end
	CloseSpeak( PID )
End
----------------------------------------------------------------------------------------------------03程ㄎ匡[426428]
Function Z27_NPC122768SPEAK_00()
	local PID=OwnerID()
	local NPC=TargetID()
	if CheckAcceptQuest( PID, 426428 )==true and
	CheckFlag( PID, 548198 )==false then
		AddSpeakOption( PID, NPC, "[SC_Q426428_00]", "Z27_NPC122768SPEAK_01", 0 )
	else	LoadquestOption( PID )
	end
	LoadquestOption( PID )
End
Function Z27_NPC122768SPEAK_01()
	local PID=OwnerID()
	LoadquestOption( PID )
	SetFlag( PID, 548198, 1 )
End
----------------------------------------------------------------------------------------------------04磝差搽[426429]
Function Z27_NPC122769RANGE_00()
	local NPC=OwnerID()
	SetPlot( NPC, "range", "Z27_NPC122769RANGE_01", 150 ) 
End
Function Z27_NPC122769RANGE_01()
	local PID=OwnerID()
	local NPC=TargetID()
	if CheckAcceptQuest( PID, 426429 )==true and
	CheckFlag( PID, 548199 )==false then
		SetFlag( PID, 548199, 1 )
	end
End
----------------------------------------------------------------------------------------------------05币︺祍[426430]
Function Z27_NPC122791SPEAK_00()
	local PID=OwnerID()
	local NPC=TargetID()
	if CheckAcceptQuest( PID, 426430 )==true and CheckFlag( PID, 548200 )==false then
		AddSpeakOption( PID, NPC, "[SC_Q426430_00]", "Z27_NPC122791SPEAK_01", 0 )
	elseif CheckCompleteQuest( PID,426430) ==true then	--10/14 非干玡┕穝畄垃
		SetSpeakDetail( PID,"[SC_122791_1]")		--10/14 非干
		AddSpeakOption( PID, PID, "[SC_122791_2]", "Z27_NPC122791SPEAK_KK", 0 )	--10/14 非干
		return
	else	
		LoadquestOption( PID )
	end
	LoadquestOption( PID )
End
function Z27_NPC122791SPEAK_KK()					--10/14 非干
	AddBuff( OwnerID(), 507646, 0, 3 )				--10/14 非干
	AddBuff( OwnerID(), 620001, 0, 3 )				--10/14 非干
	ChangeZone( OwnerID(), 27, 0, -3870.3, -20.8, -167.1, 214.5 )	--10/14 非干
end
Function Z27_NPC122791SPEAK_01()
	local PID=OwnerID()
	LoadquestOption( PID )
	SetFlag( PID, 548200, 1 )	
End
Function Z27_Q426430COMPLETE_00()
	local NPC=OwnerID()
	local PID=TargetID()
	AddBuff( PID, 624719, 0, 4 )
	ScriptMessage( PID, PID, 2, "[SC_Q426430_01]", 0 )
End
Function Z27_BUFF624720_00()
	local PID=OwnerID()
	AddBuff( PID, 624721, 0, -1 )
	SetFlag( PID, 548380, 1 )
	ChangeZone( PID, 27, 0, -3870.3, -20.8, -167.1, 214.5 )
End
Function Z27_BUFF624722_00()
	local PID=OwnerID()
	ScriptMessage( PID, PID, 2, "[SC_Q426430_02]", 0 )
End
----------------------------------------------------------------------------------------------------06穿毕玆父[426431]
Function Z27_Q426431TOUCH_END00()
	local PID=OwnerID()
	local NPC=TargetID()
	local Num=0
	local Sailor=SearchRangeNPC( NPC, 15 )
	for i=0, table.getn( Sailor ), 1 do
		if ReadRoleValue ( Sailor[i], EM_RoleValue_OrgID )==122800 or
		ReadRoleValue ( Sailor[i], EM_RoleValue_OrgID )==122801 then
			Num=DW_Rand(3)
			if Num==1 then
				NpcSay( Sailor[i], "[SC_Q426431_01]" )
			elseif Num==2 then
				NpcSay( Sailor[i], "[SC_Q426431_02]" )
			else 	NpcSay( Sailor[i], "[SC_Q426431_03]" )
			end
			CallPlot( Sailor[i], "LuaFunc_ResetObj", Sailor[i] )
			DW_QietKillOne( PID, 108112 )
		end
	end
	return true
End
----------------------------------------------------------------------------------------------------07讽叭ぇ[426432]
Function Z27_NPC122793SPEAK_00()
	local PID=OwnerID()
	local NPC=TargetID()
	if CheckAcceptQuest( PID, 426432 )==true and
	CheckFlag( PID, 548338 )==false then
		AddSpeakOption( PID, NPC, "[SC_Q426432_00]", "Z27_NPC122793SPEAK_01", 0 )
	else	LoadquestOption( PID )
	end
	LoadquestOption( PID )
End
Function Z27_NPC122793SPEAK_01()
	local PID=OwnerID()
	LoadquestOption( PID )
	SetFlag( PID, 548338, 1 )
End
----------------------------------------------------------------------------------------------------08毕焊[426433]
Function Z27_Q426433TOUCH_END00()
	local PID=OwnerID()
	local NPC=TargetID()
	SetFlag( PID, 548339, 1 )
	return true
End
Function Z27_Q426433COMPLETE_00()
	local NPC=OwnerID()
	local PID=TargetID()
	SetFlag( PID, 548194, 1 )
End
----------------------------------------------------------------------------------------------------09礚┮Τ[426434]
Function Z27_NPC122795SPEAK_00()
	local PID=OwnerID()
	local NPC=TargetID()
	if CheckAcceptQuest( PID, 426434 )==true and
	CheckFlag( PID, 548340 )==false then
		LoadquestOption( PID )
		AddSpeakOption( PID, NPC, "[SC_Q426434_00]", "Z27_NPC122795SPEAK_01", 0 )
	elseif DW_CheckQuestAccept("or",PID,426461)==true and CheckFlag(PID, 548347)==false then
		SetSpeakDetail(PID, "[SC_Z27Q426461_01]")
		SetFlag(PID, 548347, 1)			
	else	LoadquestOption( PID )
	end
End
Function Z27_NPC122795SPEAK_01()
	local PID=OwnerID()
	LoadquestOption( PID )
	SetFlag( PID, 548340, 1 )
End
Function Z27_Q426434COMPLETE_00()
	local NPC=OwnerID()
	local PID=TargetID()
	SetFlag( PID, 548194, 0 )
End
----------------------------------------------------------------------------------------------------10砐[426435]
Function Z27_NPC122796SPEAK_00()
	local PID=OwnerID()
	local NPC=TargetID()
	if CheckAcceptQuest( PID, 426435 )==true and CheckFlag( PID, 548341 )==false then
		LoadquestOption( PID )
		AddSpeakOption( PID, NPC, "[SC_Q426435_00]", "Z27_NPC122796SPEAK_01", 0 )
	elseif DW_CheckQuestAccept("or",PID,426457)==true and CheckFlag(PID, 548344)==false then
		SetSpeakDetail(PID, "[SC_Z27Q426457_01]")
		AddSpeakOption(PID,NPC, "[SC_Z27Q426457_02]", "LuaPG_426457_TalktoNicholas(2)", 0 )
	else	LoadquestOption( PID )
	end
End
Function Z27_NPC122796SPEAK_01()
	local PID=OwnerID()
	LoadquestOption( PID )
	SetFlag( PID, 548341, 1 )
End
----------------------------------------------------------------------------------------------------ㄤウ
Function Z27_NPC122804IDLE_00()
	local NPC=OwnerID()
	local Num=0
	while 1 do
		Num=DW_Rand( 8 )
		if Num<=3 then
			PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_IDLE1 )
		else	PlayMotion( NPC, ruFUSION_ACTORSTATE_CRAFTING_END )
		end
		Sleep( 35 )
	end
End
Function Z27_NPC122804IDLE_01()
	local NPC=OwnerID()
	SetDefIdleMotion( NPC, ruFUSION_MIME_SIT_LOOP )
End
----------------------------------------------------------------------------------------------------
Function Z27_NPC122802IDEL_00()
	local NPC=OwnerID()
	local Num=Rand( 3 )
	if Num==0 then
		PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_IDLE )
	else	PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	end
End
----------------------------------------------------------------------------------------------------
Function Z27_NPC122803IDEL_00()
	local NPC=OwnerID()
	local Num=Rand( 5 )
	if Num==0 then
		PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
	elseif Num==1 then
		PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )
	else	PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	end
End
----------------------------------------------------------------------------------------------------
Function Z27_NPC122803IDEL_01()
	local NPC=OwnerID()
	local Num=0
	while 1 do
		PlayMotion( NPC, ruFUSION_ACTORSTATE_CRAFTING_BEGIN )
		Sleep( 15 ) PlayMotion( NPC, ruFUSION_ACTORSTATE_CRAFTING_LOOP )
		Sleep( 90 ) PlayMotion( NPC, ruFUSION_ACTORSTATE_CRAFTING_END )
		Sleep( 15 )
		Num=Rand( 3 )
		if Num==0 then
			PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_STRETCH )
		else	PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_IDLE )	
		Sleep( 30 )
		end
	end
End
----------------------------------------------------------------------------------------------------