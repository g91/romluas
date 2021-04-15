----------------------------------------------------------------------------------------------------
Function Z25_Q425572_00()
	local PID=OwnerID()
	local NPC=TargetID()
	--主線任務：426083，夢的化身-給即效百花精油。
	if CheckAcceptQuest( PID,426083 )==true and CountBodyItem( OwnerID(), 242357 )==0 then
		AdjustFaceDir( NPC, PID, 0 )
		SetSpeakDetail( PID,"[SC_Z25Q426083_2]" )	--我身上的這瓶[242357]，就請先拿去用吧
		AddSpeakOption( PID, NPC, "[SC_Z25Q426083_3]", "lua_Z25Q426083_1", 0 )
		return
	end
	if CheckAcceptQuest( PID, 425572 )==true and CheckScriptFlag( PID, 547355 )==false then
		AddSpeakOption( PID, NPC, "[SC_KITEM547355_00]", "Z25_KITEM547355_00", 0 )
	else	LoadQuestOption( PID )
	end
	if CheckAcceptQuest( PID, 426080 )==true and CheckScriptFlag( PID, 547708 )==false then
		AddSpeakOption( PID, NPC, "[SC_KITEM547708_00]", "Z25_KITEM547708_00", 0 )
	else	LoadQuestOption( PID )
	end
	LoadQuestOption( PID )
End
Function Z25_KITEM547355_00()
	local PID=OwnerID()
	local NPC=TargetID()
	SetScriptFlag( PID, 547355, 1 )
	LoadQuestOption( PID )
End
Function Z25_KITEM547708_00()
	local PID=OwnerID()
	local NPC=TargetID()
	SetScriptFlag( PID, 547708, 1 )
	LoadQuestOption( PID )
End
----------------------------------------------------------------------------------------------------
Function Z25_Q425573_00()
	local PID=OwnerID()
	local NPC=TargetID()
	CastSpell( PID, NPC, 850590 )
	return true
End
Function Z25_Q425573_01()
	local PID=OwnerID()
	local NPC=TargetID()
	DW_QietKillOne( PID, 107562 )
	return true
End
----------------------------------------------------------------------------------------------------
Function Z25_ITEM241360_00()
	local PID=OwnerID()
	local NPC=TargetID()
	AdjustFaceDir( PID, NPC, 0 )
	PlayMotion( PID, ruFUSION_ACTORSTATE_CRAFTING_LOOP )
	return true
End
Function Z25_ITEM241360_01()
	local PID=OwnerID()
	local NPC=TargetID()
	PlayMotion( PID, ruFUSION_ACTORSTATE_CRAFTING_END )
	if CheckDistance( PID, NPC, 30 )==true then
		if ReadRoleValue( NPC, EM_RoleValue_OrgID)==107215 and CheckBuff( NPC, 623856 )==true then
			DW_QietKillOne( PID, 107214 )
			CancelBuff( NPC, 623856 )
			CastSpell( NPC, NPC, 850589 )
			AdjustFaceDir( NPC, PID, 0 )
			PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_APPROVAL )
			PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_VICTORY )
		else ScriptMessage( PID, PID, 1, "[SC_Z24ITEM241208_02]", 0 )
		end
	else ScriptMessage( PID, PID, 1, "[SC_Z24ITEM241208_01]", 0 )
	end
End
----------------------------------------------------------------------------------------------------
Function Z25_NPC121690_00()
	local NPC=OwnerID()
	MoveToFlagEnabled( NPC, false )
	SetDefIdleMotion( NPC, ruFUSION_MIME_DEATH_LOOP )
End
----------------------------------------------------------------------------------------------------
Function Z25_ITEM242106_00()
	local PID=OwnerID()
	local CHK=Lua_CreateObjByDir( PID, 119875, 25, 0 )
	local NPC=Lua_CreateObjByDir( PID, 107558, 25, 0 )
	MoveToFlagEnabled( CHK, false )
	MoveToFlagEnabled( NPC, false )
	SetModeEx( CHK, EM_SetModeType_Mark, false )
	SetModeEx( CHK, EM_SetModeType_Save, false )
	AddToPartition( CHK, 0 )
	DW_QietKillOne( PID, 107540 )
	CallPlot( CHK, "Z25_ITEM242106_01", NPC, PID )
	return
End
Function Z25_ITEM242106_01(NPC, PID)
	local CHK=OwnerID()
	local NUM=0
	ScriptMessage( PID, PID, 1, "[SC_ITEM242106_00]", C_SYSTEM )
	Sleep(10) CastSpell( CHK, CHK, 850582 )
	Sleep(05) AddToPartition( NPC, 0 )
	Sleep(05) PlayMotion( NPC, ruFUSION_ACTORSTATE_BUFF_SP02 )
	SetAttack( NPC, PID )
	Sleep(15)
	while 1 do
		NUM=0
		if CheckID( PID )==true and CheckID( NPC )==true then
			NUM=NUM+1
		end
		if CheckDistance( CHK, NPC, 500 )==true and CheckDistance( CHK, PID, 500 )==true then
			NUM=NUM+1
		end
		if CheckDistance( PID, NPC, 400 )==true then
			NUM=NUM+1
		end
		if ReadRoleValue( NPC, EM_RoleValue_IsAttackMode )==1 then
			NUM=NUM+1
		end
		if NUM==4 then
			SetAttack( NPC, PID )
		else 	Delobj( NPC ) DelObj( CHK )
		end
		Sleep(10)
	end
end
----------------------------------------------------------------------------------------------------
Function Z25_NPC121748_00()
	local PID=OwnerID()
	local NPC=TargetID()
	if CheckAcceptQuest( PID, 425824 )==true and
	CheckScriptFlag( PID, 547376 )==false then
		AddSpeakOption( PID, NPC, "[SC_KITEM547376_00]", "Z25_KITEM547376_00", 0 )
	else	LoadQuestOption( PID )
	end
End
Function Z25_KITEM547376_00()
	local PID=OwnerID()
	local NPC=TargetID()
	if CountBodyItem( PID, 242107 )~=0 then
		SetScriptFlag( PID, 547376, 1 )
		DelBodyItem( PID, 242107, -1 )
	end
	LoadQuestOption( PID )
End
----------------------------------------------------------------------------------------------------
Function Z25_MushroomInBagFx_00()
	AddBuff ( OwnerID(), 623980, 0, -1 )
End
----------------------------------------------------------------------------------------------------
Function Z25_BUFF623825_00()
	Callplot( OwnerID(), "Z25_BUFF623825_01", 0 )
End
Function Z25_BUFF623825_01()
	local SDR=OwnerID()
	local NUM=DW_Rand(4)*100
	Sleep(200+NUM)
	AddBuff( SDR, 623856, 0, -1 )
	CancelBuff( SDR, 623825 )
End
----------------------------------------------------------------------------------------------------
Function Z25_Q425738_00()
	local PID=OwnerID()
	local NPC=TargetID()
	if CountBodyItem( PID, 241360 )==0 then
		GiveBodyItem( PID, 241360, 1 ) return true
	else ScriptMessage( PID, PID, 1, "[SC_Z25NPC121779_00]", 0 ) return false
	end
End
Function Z25_Q425738_01()
	CastSpell( OwnerID(), OwnerID(), 850586 )
End
Function Z25_Q425738_02()
	CastSpell( OwnerID(), OwnerID(), 850586 )
	Z25_sound_play_Set()
End
----------------------------------------------------------------------------------------------------
Function Z25_Q425822_00()
	local PID=TargetID()
	local NPC=OwnerID()
	CancelBuff( PID, 623982 )
	AddBuff( PID, 623982, 2, -1 )
End
Function Z25_Q425822_01()
	local PID=OwnerID()
	local NPC=TargetID()
	if CountBodyItem( PID, 242105 )>=1 then
		return true
	else	if CheckBuff( PID, 623982 )==false then
			GiveBodyItem( PID, 242105, 1 ) return true
		else	local BPS=Lua_BuffPosSearch( PID, 623982 )
			local BLV=BuffInfo( PID, BPS, EM_BuffInfoType_Power )
			local NUM=0
			if BLV==2 then
				CancelBuff( PID, 623982 )
				NUM=DW_Rand(9)
				if NUM==1 then
					GiveBodyItem( PID, 242105, 1 )
				else 	AddBuff( PID, 623982, 1, -1 )
					ScriptMessage( PID, PID, 1, "[SC_Q425822_00]", C_SYSTEM )
				end
			end
			if BLV==1 then
				CancelBuff( PID, 623982 )
				NUM=DW_Rand(6)
				if NUM==1 then
					GiveBodyItem( PID, 242105, 1 )
				else 	AddBuff( PID, 623982, 0, -1 )
					ScriptMessage( PID, PID, 1, "[SC_Q425822_00]", C_SYSTEM )
				end
			end
			if BLV==0 then
				CancelBuff( PID, 623982 )
				NUM=DW_Rand(3)
				if NUM==1 then
					GiveBodyItem( PID, 242105, 1 )
				else	ScriptMessage( PID, PID, 1, "[SC_Q425822_00]", C_SYSTEM )
				end
			end
		end
	return true
	end
end
----------------------------------------------------------------------------------------------------