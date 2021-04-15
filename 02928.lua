----------------------------------------------------------------------------------------------------
Function Z26_NPC122150MOVE_00()
	local NPC=OwnerID()
	Sleep(10)	PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_IDLE )
	Sleep(40)	PlayMotion( NPC, ruFUSION_ACTORSTATE_CRAFTING_BEGIN )
	Sleep(10)	PlayMotion( NPC, ruFUSION_ACTORSTATE_CRAFTING_LOOP )
	Sleep(320) PlayMotion( NPC, ruFUSION_ACTORSTATE_CRAFTING_END )
	Sleep(20)	PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_STRETCH )
end
Function Z26_NPC122150SPEAK_00()
	local PID=OwnerID()
	LoadQuestOption( PID )
end
----------------------------------------------------------------------------------------------------
Function Z26_NPC122154_00()
	local NPC=OwnerID()
	while 1 do
		AddBuff( NPC, 506168, 0, -1 )
		PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_PLAY_GUITAR )
		Sleep(40)
	end
End
----------------------------------------------------------------------------------------------------
Function Z26_NPCTREESSLOW_00()
	AddBuff( OwnerID(), 624177, 0, -1 ) 
End
----------------------------------------------------------------------------------------------------
Function Z26_HORSEMOVE_00()
	local NPC=OwnerID()
	local NUM=0
	for i=1, 3, 1 do
		Sleep(10)
		PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_IDLE )
		NUM=Rand(3)+2
		Sleep(NUM)
	end
End
----------------------------------------------------------------------------------------------------
Function Z26_NPC122163MOVE_00()
	local NPC=OwnerID()
	local NUM=Rand(4)+1
	Sleep( 20 ) PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_IDLE )
	Sleep( 40 )
	if NUM==1 then
		PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_THINK )
	end
	if NUM==2 then
		PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_IDLE )
	end
	if NUM>=3 then
		return
	end
End
----------------------------------------------------------------------------------------------------
Function Z26_NPC122163SPEAK_00()
	local PID=OwnerID()
	LoadQuestOption( PID )
end
----------------------------------------------------------------------------------------------------
Function Z26_NPC122194_00()
	local NPC=OwnerID()
	AddBuff( NPC, 622119, 0, -1 )
end
----------------------------------------------------------------------------------------------------
Function Z26_NPC122198MOVE_00()
	local NPC=OwnerID()
	local NUM=Rand( 3 )
	Sleep( 10 ) 
	PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_IDLE )
	Sleep( 50 )
	PlayMotion( NPC, ruFUSION_ACTORSTATE_MINING_BEGIN )
	Sleep( 60 )
	PlayMotion( NPC, ruFUSION_ACTORSTATE_MINING_END )
	Sleep( 10 ) 
	if NUM==0 then
		PlayMotion( NPC, ruFUSION_ACTORSTATE_GATHER_BEGIN )
		Sleep( 50 )
		PlayMotion( NPC, ruFUSION_ACTORSTATE_GATHER_END )
	else
		PlayMotion( NPC, ruFUSION_ACTORSTATE_MINING_BEGIN )
		Sleep( 60 )
		PlayMotion( NPC, ruFUSION_ACTORSTATE_MINING_END )
	end
End
----------------------------------------------------------------------------------------------------
Function Z26_NPC122199MOVE_00()
	local NPC=OwnerID()
	local NUM=Rand( 3 )
	Sleep( 10 ) 
	PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_IDLE )
	Sleep( 50 )
	PlayMotion( NPC, ruFUSION_ACTORSTATE_GATHER_BEGIN )
	Sleep( 60 )
	PlayMotion( NPC, ruFUSION_ACTORSTATE_GATHER_END )
	Sleep( 10 ) 
	if NUM==0 then
		PlayMotion( NPC, ruFUSION_ACTORSTATE_GATHER_BEGIN )
		Sleep( 50 )
		PlayMotion( NPC, ruFUSION_ACTORSTATE_GATHER_END )
	else
		PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_THINK )
		Sleep( 60 )
		PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_IDLE )
	end
End
----------------------------------------------------------------------------------------------------
Function Z26_NPC122195_00()
	AddBuff( OwnerID(), 624266, 0, -1 )
End
----------------------------------------------------------------------------------------------------
Function Z26_NPC122212_00()
	AddBuff( OwnerID(), 620133, 0, -1 )
End
----------------------------------------------------------------------------------------------------
Function Z26_NPC122169_00()
	local NPC=OwnerID()
	SetDefIdleMotion( NPC, ruFUSION_MIME_READING_LOOP ) 
	AddBuff( NPC, 502086, 0, -1 )
End
----------------------------------------------------------------------------------------------------
Function Z26_NPCOLDAWAYTAR_00()
	local NPC=OwnerID()
	LockHP( NPC, ReadRoleValue( NPC, EM_RoleValue_MaxHP )*0.05 , "Lua_424225_LockHP" )
	SetDefIdleMotion( NPC, ruFUSION_MIME_IDLE_COMBAT_1H )	
	AddBuff( NPC, 623132, 0, -1 )
	local Num1=DW_Rand(30)
	local Num2=0
	local IDX={}
	IDX[1]="[SC_Z26BATTLESPEAK_00]"
	IDX[2]="[SC_Z26BATTLESPEAK_01]"
	IDX[3]="[SC_Z26BATTLESPEAK_02]"
	IDX[4]="[SC_Z26BATTLESPEAK_03]"
	IDX[5]="[SC_Z26BATTLESPEAK_04]"
	IDX[6]="[SC_Z26BATTLESPEAK_05]"
	IDX[7]="[SC_Z26BATTLESPEAK_06]"
	IDX[8]="[SC_Z26BATTLESPEAK_07]"
	IDX[9]="[SC_Z26BATTLESPEAK_08]"
	IDX[10]="[SC_Z26BATTLESPEAK_09]"
	IDX[11]="[SC_Z26BATTLESPEAK_10]"
	IDX[12]="[SC_Z26BATTLESPEAK_11]"
	IDX[13]="[SC_Z26BATTLESPEAK_12]"
	IDX[14]="[SC_Z26BATTLESPEAK_13]"
	IDX[15]="[SC_Z26BATTLESPEAK_14]"	
	IDX[16]="[SC_Z26BATTLESPEAK_15]"
	if Num1==1 then
		Num2=DW_Rand( 16 )
		NpcSay( NPC, IDX[Num2] )
	else	return
	end
End
------------------------------------------------------------------------
Function Z26_NPCCRAFTING_00()
	local NPC=OwnerID()
	Sleep( 10 )
	PlayMotion( NPC, ruFUSION_ACTORSTATE_CRAFTING_BEGIN )
	Sleep( 100 )
	PlayMotion( NPC, ruFUSION_ACTORSTATE_CRAFTING_END )	
	Sleep( 10 )
End
------------------------------------------------------------------------
Function Z26_NPC107733_00()
	SetDefIdleMotion( OwnerID(), ruFUSION_MIME_IDLE_COMBAT_1H )
End
------------------------------------------------------------------------
Function Z26_NPC122401_00()
	local NPC=OwnerID()
	local x, y, z, dir=DW_Location( NPC )
	local Guardian=CreateObj( 122420, x, y+150, z, dir, 1 )
	local VFX={}
	local Num=0
	SetModeEx( Guardian, EM_SetModeType_Save, false )
	SetModeEx( Guardian, EM_SetModeType_Mark, false )
	SetModeEx( Guardian, EM_SetModeType_Gravity, false )
	SetModeEx( Guardian, EM_SetModeType_NotShowHPMP, true )
	MoveToFlagEnabled( Guardian, false )
	SetDefIdleMotion( Guardian, ruFUSION_MIME_IDLE_CROUCH )
	AddToPartition( Guardian, 0 )
	for i=0, 2, 1 do
		VFX[i]=CreateObj( 121363, x, y+Num, z, dir, 1 )
		SetModeEx( VFX[i], EM_SetModeType_Save, false )	
		SetModeEx( VFX[i], EM_SetModeType_Mark, false )	
		SetModeEx( VFX[i], EM_SetModeType_Gravity, false )	
		SetModeEx( VFX[i], EM_SetModeType_NotShowHPMP, true )	
		MoveToFlagEnabled( VFX[i], false )	
		AddToPartition( VFX[i], 0 )
		Num=Num+60
	end
End
------------------------------------------------------------------------
Function Z26_NPC122451_00()
	local NPC=OwnerID()
	WriteRoleValue( NPC, EM_RoleValue_Register1, 0 )
	SetPlot( NPC, "range", "Z26_NPC122451_01", 50 )
End
Function Z26_NPC122451_01()
	local PID=OwnerID()
	local NPC=TargetID()
	local Num=DW_Rand(2)
	if ReadRoleValue( NPC, EM_RoleValue_Register1 )==0 and Num==1 then
		CallPlot( NPC, "Z26_NPC122451_02", NPC, PID )
	else 	return
	end
End
Function Z26_NPC122451_02( NPC, PID )
	WriteRoleValue( NPC, EM_RoleValue_Register1, 1 )
	local OBJ=SearchRangeNPC( NPC, 80 )
	for i=0, table.getn( OBJ ), 1 do
		if ReadRoleValue( OBJ[i], EM_RoleValue_OrgID )==122400 and
		ReadRoleValue( OBJ[i], EM_RoleValue_Register1 )==0 then
			CallPlot( OBJ[i], "Z26_NPC122451_03", NPC, PID, OBJ[i] )
		end
	end
End
Function Z26_NPC122451_03( NPC, PID, OBJ )
	WriteRoleValue( OBJ, EM_RoleValue_Register1, 1 )
	AdjustFaceDir( OBJ, PID, 0 )
	NpcSay( OBJ, "[SC_NPC122400_00]" )
	PlayMotion( OBJ, ruFUSION_ACTORSTATE_EMOTE_SALUTE )
	Sleep(20)
	AdjustFaceDir( OBJ, NPC, 0 )
	WriteRoleValue( OBJ, EM_RoleValue_Register1, 0 )
	WriteRoleValue( NPC, EM_RoleValue_Register1, 0 )
End
------------------------------------------------------------------------
Function Z26_NPCNotShowHPMP_00()
	SetModeEx( OwnerID(), EM_SetModeType_NotShowHPMP, true )
End
------------------------------------------------------------------------
function Z26_npc107773pos_00()--使自己回到正確座標位置
	local npc = OwnerID()
	local BaseX, BaseY, BaseZ = -23285, 645, -2479 --資料庫所記錄的座標
	local CurrentX, CurrentY, CurrentZ, CurrentDir = DW_Location( npc ) --目前的座標
	if CurrentX ~= BaseX or CurrentY ~= BaseY or CurrentZ ~= BaseZ then
		CallPlot( npc, "LuaFunc_ResetObj", npc ) --重置自己
	end
end
------------------------------------------------------------------------