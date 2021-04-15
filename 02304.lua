function FA_OnTheGround ()
	local Pos = {kg_GetPos(OwnerID())}
	Pos[2] = GetHeight(Pos[1],Pos[2],Pos[3])
	setpos( OwnerID() , Pos[1],Pos[2],Pos[3],Pos[4] )
end

function FA_Insert()
	local Pos = {kg_GetPos(OwnerID())}
	Pos[2] = GetHeight(Pos[1],Pos[2],Pos[3]) - 10
	setpos( OwnerID(), Pos[1],Pos[2],Pos[3],Pos[4] )
end

function FA_Insert20()
	local Pos = {kg_GetPos(OwnerID())}
	Pos[2] = GetHeight(Pos[1],Pos[2],Pos[3]) - 20
	setpos( OwnerID(), Pos[1],Pos[2],Pos[3],Pos[4] )
end

-- 如果你的NPC出現靈異現象無法正常讀取任務模版，用這個硬幹
function FA_LoadQuest()
	LoadQuestOption(OwnerID())
end

-- 通用_依照玩家任務進度說不同對話內容，只需要建字串就能用。
function FA_ChangeSays(...)
	local Player = OwnerID()
	local NPC = TargetID()
	local OrgID = ReadRoleValue( NPC, EM_RoleValue_OrgID )
	local Str_Num = table.getn(arg)
	local LastFlag
	local GetSpeaking = false

	if Str_Num == 0 or Str_Num == nil then
		Str_Num = 1
	end
	for i = Str_Num, 1, -1  do
		LastFlag = arg[i]
		if FA_CheckQuestOrFlag (Player, LastFlag, LastFlag,0) then
			SetSpeakDetail (Player, "[SC_"..OrgID.."_0"..i.."]")
			GetSpeaking = true
			break
		end
	end
	if not GetSpeaking then
		LoadQuestOption(Player)
	end
end

function FA_Idle_Carpenter()
	local NPC = OwnerID()
	local RandInt = 0
	local Counter = 0

	while 1 do
		Counter = 0
		RandInt = FA_Rand(5,8)
		PlayMotion( NPC ,ruFUSION_ACTORSTATE_EMOTE_IDLE0)
		Sleep(30)
		repeat
			PlayMotion( NPC ,ruFUSION_ACTORSTATE_EMOTE_IDLE2)
			Sleep(17)
			Counter = Counter + 1
		until Counter == RandInt
		PlayMotion( NPC ,ruFUSION_ACTORSTATE_EMOTE_IDLE1)
		Sleep(20)
	end
end

function FA_BeVisitor ()
	SetRoleCamp(OwnerID(),"Visitor")
end

function FA_Worker_01()
	local Owner = OwnerID()
	local ZoneID = ReadRoleValue(Owner,EM_RoleValue_RoomID)
	local Pos = kg_GetPosTable(Owner)

--	AdjustDir(Owner,0)
	SetModeEx(Owner, EM_SetModeType_Mark, true )
	SetModeEx(Owner, EM_SetModeType_NotShowHPMP, true )
	SetModeEx(Owner, EM_SetModeType_HideName, false )
	SetModeEx(Owner, EM_SetModeType_ShowRoleHead, true ) --頭像框

	WriteRoleValue( Owner, EM_RoleValue_Register3, Pos[1] )
	WriteRoleValue( Owner, EM_RoleValue_Register4, Pos[2] )
	WriteRoleValue( Owner, EM_RoleValue_Register5, Pos[3] )
	WriteRoleValue( Owner, EM_RoleValue_Register6, Pos[4] )

	Hide(Owner)
	Sleep(20)
	SetModeEx(Owner,EM_SetModeType_Show,true)
	Show(Owner,ZoneID)
end

function FA_Worker_01_P1( thing, dis, addy, angle, face, Action )
	local Owner = OwnerID()
	local ThingID
	local ZoneID = ReadRoleValue(Owner,EM_RoleValue_RoomID)

	PlayMotionEX( Owner, Action,Action + 1)
	Sleep(10)
	ThingID = kg_GetPosRX( Owner, thing, dis, addy, angle, face )
	SetModeEx(ThingID, EM_SetModeType_Mark, false )
	SetModeEx(ThingID, EM_SetModeType_NotShowHPMP, false )
	SetModeEx(ThingID, EM_SetModeType_HideName, true )
	SetModeEx(ThingID, EM_SetModeType_ShowRoleHead, false ) --頭像框
	Show(ThingID,ZoneID)
	WriteRoleValue( Owner, EM_RoleValue_Register1, ThingID )
	WriteRoleValue( Owner, EM_RoleValue_Register2, Action )
end

function FA_Worker_01_P2()
	local Owner = OwnerID()

	PlayMotion ( Owner, ReadRoleValue( Owner, EM_RoleValue_Register2 ) +2 )
	Sleep(5)
	DelObj(ReadRoleValue( Owner, EM_RoleValue_Register1 ))
end

function FA_Worker_01_End()
	local Owner = OwnerID()
	local ZoneID = ReadRoleValue(Owner,EM_RoleValue_RoomID)

	SetModeEx(Owner, EM_SetModeType_Mark, false )
	SetModeEx(Owner, EM_SetModeType_NotShowHPMP, false )
	SetModeEx(Owner, EM_SetModeType_HideName, true )
	SetModeEx(Owner, EM_SetModeType_ShowRoleHead, false ) --頭像框

	Hide(Owner)
	Sleep(20)
	SetModeEx(Owner,EM_SetModeType_Show,false)
	Show(Owner,ZoneID)
end

function FA_Worker_01_FixPos()
	local Owner = OwnerID()
	local Pos = {}

	for i = 1, 4 do
		Pos[i] = ReadRoleValue(Owner, EM_RoleValue_Register3 + i-1 )
	end

	SetPos(Owner, Unpack(Pos) )
end

function FA_Motion_Loop_Buff()
	PlayMotionEX(OwnerID(), ruFUSION_ACTORSTATE_BUFF_BEGIN, ruFUSION_ACTORSTATE_BUFF_LOOP)
	sleep(30)
end