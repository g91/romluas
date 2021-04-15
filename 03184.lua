--�ˬd���a���W�����Ȫ��A
function CheckZ33Quest( Player, QuestID )
	if ( Player == nil or QuestID == nil ) then
		return false
	end
	if ( CheckID( Player ) == false or--���a���s�b 
	ReadRoleValue( Player, EM_RoleValue_IsDead ) == 1 or--���a���`
	CheckAcceptQuest( Player, QuestID ) == false ) then--���a�����o����
		return false
	else
		return true
	end
end
--�b���w�������m�гy�@��NPC
function CreateZ33NPCforShow( PosID, OrgID )
	if ( PosID == nil or OrgID == nil ) then
		return false
	end
	local KeyItem = 544801
	local x, y, z, dir = DW_Location( PosID )
	local NpcID = CreateObj( OrgID, x, y, z, dir, 1 )
	AddToPartition( NpcID, 0 )
	MoveToFlagEnabled( NpcID, false )
	SetFlag( NpcID, KeyItem, 1 )--���ͩ��_��
	return NpcID
end
--��겣��
function Z33_CreateNpcbyCircle_00( ObjID, Radius, Num )--����s��, �b�|, �����`��
	local Ctrl = OwnerID()
	local baseX, baseY, baseZ, dir = DW_Location( Ctrl )
	local Poly = math.ceil( 360/Num )
	local Angle = 0
	local StopMove = 623132
	local x, y, z = 0
	local NewObj = {}
	if ( ObjID == nil or Radius == nil or Num == nil ) then
		return
	end
	for i = 1, Num, 1 do
		Angle = Angle+Poly
		x = baseX+radius*math.cos( Angle*math.pi/180 )
		y = baseY
		z = baseZ+radius*math.sin( Angle*math.pi/180 )
		NewObj[ i ] = CreateObj( ObjID, x, y, z, dir, 1 )
		AddToPartition( NewObj[ i ], 0 )
		MoveToFlagEnabled( NewObj[ i ], false )
		AdjustFaceDir( NewObj[ i ], Ctrl, 0 )
		AddBuff( NewObj[ i ], StopMove, 0, 3 )
	end
	return NewObj
end
function Z33_Q427256NpcINI()
	local Ctrl = OwnerID()
	local CurrentNpc = {}
	local SearchDis = 0
	SetDefIdleMotion( Ctrl, ruFUSION_MIME_IDLE_COMBAT_1H )
	MoveToFlagEnabled( Ctrl, false )
	while true do
		SearchDis = SearchDis + 100
		CurrentNpc = SearchRangeNPC( Ctrl, SearchDis )
		for i = 0, #CurrentNpc, 1 do
			if ( CurrentNpc[ i ] ~= nil and CheckID( CurrentNpc[ i ] ) == true ) then
				if ReadRoleValue( CurrentNpc[ i ], EM_RoleValue_OrgID ) == 124092 then
					AdjustFaceDir( Ctrl, CurrentNpc[ i ], 0 )
					CastSpell( Ctrl, CurrentNpc[ i ], 490873 )
					return
				end
			end
		end
		Sleep( 5 )
	end
end
function Z33_GuardianNpcINI()--�ͤ�԰���tNPC��l�@��
	local Ctrl = OwnerID()
	MoveToFlagEnabled( Ctrl, true )
	SetCursorType( Ctrl, eCursor_Speak )
	SetPlot( Ctrl, "touch", "Z33_GuardianNpcSK", 40 )
	return
end
function Z33_GuardianNpcSK()
	local Player = OwnerID()
	local Ctrl = TargetID()
	local CtrlID = ReadRoleValue( Ctrl, EM_RoleValue_OrgID )
	local SpeakStr = {}
	local RandNum = DW_Rand( 5 )
	if CtrlID == 124056 then
		SpeakStr[ 1 ] = "[SC_Z33_EVENT1_1]"--�i�h
		SpeakStr[ 2 ] = "[SC_Z33_EVENT1_2]"
		SpeakStr[ 3 ] = "[SC_Z33_EVENT1_3]"
		SpeakStr[ 4 ] = "[SC_Z33_EVENT1_4]"
		SpeakStr[ 5 ] = "[SC_Z33_EVENT1_5]"
	elseif ( CtrlID == 124066 or CtrlID == 124070 ) then
		SpeakStr[ 1 ] = "[SC_Z33_EVENT2_1]"--�C���G�H
		SpeakStr[ 2 ] = "[SC_Z33_EVENT2_2]"
		SpeakStr[ 3 ] = "[SC_Z33_EVENT2_3]"
		SpeakStr[ 4 ] = "[SC_Z33_EVENT2_4]"
		SpeakStr[ 5 ] = "[SC_Z33_EVENT2_5]"
	elseif ( CtrlID == 124102 or CtrlID == 124103 ) then
		SpeakStr[ 1 ] = "[SC_Z33_EVENT3_1]"--�ǭ^�n��
		SpeakStr[ 2 ] = "[SC_Z33_EVENT3_2]"
		SpeakStr[ 3 ] = "[SC_Z33_EVENT3_3]"
		SpeakStr[ 4 ] = "[SC_Z33_EVENT3_4]"
		SpeakStr[ 5 ] = "[SC_Z33_EVENT3_5]"
	elseif ( CtrlID == 124053 or CtrlID == 124054 ) then
		SpeakStr[ 1 ] = "[SC_Z33_EVENT4_1]"--�h�A
		SpeakStr[ 2 ] = "[SC_Z33_EVENT4_2]"
		SpeakStr[ 3 ] = "[SC_Z33_EVENT4_3]"
		SpeakStr[ 4 ] = "[SC_Z33_EVENT4_4]"
		SpeakStr[ 5 ] = "[SC_Z33_EVENT4_5]"
	else
		return
	end
	SetPlot( Ctrl, "touch", "", 0 )
	NpcSay( Ctrl, SpeakStr[ RandNum ] )
	BeginPlot( Ctrl, "Z33_NpcResetSK", 40 )
	return
end
function Z33_NpcResetSK()
	local Ctrl = OwnerID()
	SetCursorType( Ctrl, eCursor_Speak )
	SetPlot( Ctrl, "touch", "Z33_GuardianNpcSK", 40 )
	return
end
function Z33_GuardianNpcMove()
	local Ctrl = OwnerID()
	local Index, RandNum = nil
	local IdleMotion = {}
	IdleMotion[ 1 ] = ruFUSION_ACTORSTATE_EMOTE_IDLE
	IdleMotion[ 2 ] = ruFUSION_ACTORSTATE_EMOTE_IDLE0
	IdleMotion[ 3 ] = ruFUSION_ACTORSTATE_EMOTE_IDLE1
	IdleMotion[ 4 ] = ruFUSION_ACTORSTATE_EMOTE_IDLE2
	MoveToFlagEnabled( Ctrl, false )
	RangeNpc = SearchRangeNPC( Ctrl, 200 )
	for Index = 0, #RangeNpc, 1 do
		if RangeNpc[ Index ] ~= nil then
			if ReadRoleValue( RangeNpc[ Index ], EM_RoleValue_CampID ) == 3 then
				AdjustFaceDir( Ctrl, RangeNpc[ Index ], 0 )--��{ĵ�٥��i�J�԰�
				break
			end
		end
	end
	RandNum = DW_Rand( 4 )
	PlayMotion( Ctrl, IdleMotion[ RandNum ] )
	Sleep( 40 )
	MoveToFlagEnabled( Ctrl, true )
	return
end
function Z33_Npc109059OnCombat()
	local Ctrl = OwnerID()
	LockHP( Ctrl, ReadRoleValue( Ctrl, EM_RoleValue_MaxHP )*0.25, "Lua_424225_LockHP" )
end
function Z33_Npc109059CombatEnd()
	local Ctrl = OwnerID()
	MoveToFlagEnabled( Ctrl, true )
	return
end
function Npc109225Move()--�w�f���l
	local Ctrl = OwnerID()
	local RangeNpc = {}
	local SearchDis = nil
	local Index = nil
	for SearchDis = 40, 200, 40 do
		RangeNpc = SearchRangeNPC( Ctrl, SearchDis )
		for Index = 0, #RangeNpc, 1 do
			if ( RangeNpc[ Index ] ~= nil and ReadRoleValue( RangeNpc[ Index ], EM_RoleValue_OrgID ) == 124056 ) then
				AdjustFaceDir( Ctrl, RangeNpc[ Index ], 0 )
				PlayMotion( Ctrl, ruFUSION_ACTORSTATE_COMBAT_1H )
				return
			end
		end
	end
end
function Z33_Spell852274Check()
	local Player = OwnerID()
	local CurrentBuff, Index = nil
	local BuffID = { 502589, 502624, 502348, 502603, 502318, 502607, 502608, 502609, 502623 }--�ݭn�Q�ˬd��Buff
	for Index = 0, #BuffID, 1 do
		if BuffID[ Index ] ~= nil then
			if CheckBuff( Player, BuffID[ Index ] ) == true then
				CurrentBuff = BuffID[ Index ]
				break
			end
		end
	end
	if CurrentBuff ~= nil then
		if CurrentBuff == 502579 then
			if CheckAcceptQuest( Player, 427247 ) == false then--�����������H���L��Client
				CancelBuff( Player, 502579 )
			end
		elseif CurrentBuff == 502348 then
			if CheckAcceptQuest( Player, 427241 ) == false then--�����^�h�A�͹L��Client
				CancelBuff( Player, 502348 )
			end
		elseif CurrentBuff == 502624 then
			if CheckAcceptQuest( Player, 427248 ) == false then--����ű�C�H��L��Client
				CancelBuff( Player, 502624 )
			end
		elseif CurrentBuff == 502589 then
			if CheckAcceptQuest( Player, 427249 ) == false then--�����ƤH�q���L��Client
				CancelBuff( Player, 502589 )
			end
		elseif CurrentBuff == 502603 then
			if CheckAcceptQuest( Player, 427252 ) == false then--�������P�l�L��Client
				CancelBuff( Player, 502603 )
			end
		elseif CurrentBuff == 502318 then
			if CheckAcceptQuest( Player, 427252 ) == false then--���P�l�ƥ��t���ѻP�ɶ��ˬd
				CancelBuff( Player, 502318 )
			end
		elseif CurrentBuff == 502607 then
			if CheckAcceptQuest( Player, 427265 ) == false then--�����^�����묹�L��Client
				CancelBuff( Player, 502607 )
			end
		elseif CurrentBuff == 502608 then
			if CheckAcceptQuest( Player, 427265 ) == false then--�^�����묹�ƥ��tClient
				CancelBuff( Player, 502608 )
			end
		elseif CurrentBuff == 502609 then
			if CheckAcceptQuest( Player, 427267 ) == false then--�������J���[�J�L��Client
				CancelBuff( Player, 502609 )
			end
		elseif ( CurrentBuff == 502623 or CurrentBuff == 502337 ) then--�ťܹε��ƥ��tClient &
			if CheckAcceptQuest( Player, 427268 ) == false then--�ťܹε��ƥ��t���ѻP�ɶ��ˬd
				CancelBuff( Player, 502623 )
				CancelBuff( Player, 502337 )
			end
		end
	end
	return
end