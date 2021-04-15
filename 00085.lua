----------------------------------------------------------------------------------------------------
Function Z30_NPC117246SPEAK_00()
	local PID=OwnerID()
	local NPC=TargetID()
	local NPCID=ReadRoleValue( NPC, EM_RoleValue_OrgID )
	if CheckAcceptQuest( PID, 421654 )==true and
	CheckFlag( PID, 541875 )==false then
		AddSpeakOption( PID, NPC, "[SC_Q421654_00]", "Z30_NPC117246SPEAK_01", 0 )
	end
	if CheckAcceptQuest( PID, 422654 )==true and
	CheckFlag( PID, 541879 )==false then
		AddSpeakOption( PID, NPC, "[SC_Q422654_00]", "Z30_NPC117246SPEAK_02", 0 )
	end
	if CheckAcceptQuest( PID, 426803 )==true	and
	CheckFlag(PID, 548804)==false		then
		AddSpeakOption( PID, NPC, "[SC_Z30Q426803_3]", "LuaPG_426803_Tell( "..NPCID.." )", 0 )
	end
	LoadquestOption( PID )
End
Function Z30_NPC117246SPEAK_01()
	local PID=OwnerID()
	local NPC=TargetID()
	SetFlag( PID, 541875, 1 )
	LoadquestOption( PID )
End
Function Z30_NPC117246SPEAK_02()
	local PID=OwnerID()
	local NPC=TargetID()
	SetFlag( PID, 541879, 1 )
	DelBodyItem( PID, 240972, 1 )
	LoadquestOption( PID )
End
----------------------------------------------------------------------------------------------------
Function Z30_NPC117247SPEAK_00()
	local PID=OwnerID()
	local NPC=TargetID()
	if CheckAcceptQuest( PID, 421655 )==true and
	CountBodyItem( PID, 201553 )==0 then
		AddSpeakOption( PID, NPC, "[SC_Q421655_00]", "Z30_NPC117247SPEAK_01", 0 )
	end
	LoadquestOption( PID )
End
Function Z30_NPC117247SPEAK_01()
	local PID=OwnerID()
	local NPC=TargetID()
	SetSpeakDetail( PID, GetString("SC_Q421655_01") )
	AddSpeakOption( PID, NPC, "[SC_Q421655_02]", "Z30_NPC117247SPEAK_02", 0 )
End
Function Z30_NPC117247SPEAK_02()
	local PID=OwnerID()
	local NPC=TargetID()
	SetSpeakDetail( PID, GetString("SC_Q421655_03") )
	GiveBodyItem( PID, 201553, 1 )
	AddBuff( PID, 623132, 0, 3 )
	ScriptMessage( PID, PID, 1, "[SC_Q421655_04]", C_SYSTEM )
End
----------------------------------------------------------------------------------------------------
Function Z30_NPC118568SPEAK_00()
	local PID=OwnerID()
	local NPC=TargetID()
	if ( CheckAcceptQuest( PID, 421658 )==true and
	CountBodyItem( PID, 201555 )==1 and
	CheckFlag( PID, 541876 )==false ) then
		AddSpeakOption( PID, NPC, "[SC_Q421658_00]", "Z30_NPC118568SPEAK_01", 0 )
	end
	LoadquestOption( PID )
End
Function Z30_NPC118568SPEAK_01()
	local PID=OwnerID()
	local NPC=TargetID()
	SetFlag( PID, 541876, 1 )
	DelBodyItem( PID, 201555, 1 )
	LoadquestOption( PID )
End
----------------------------------------------------------------------------------------------------
Function Z29_NPC118569_00()
	local PID=OwnerID()
	local NPC=TargetID()
	WriteRoleValue( NPC, EM_RoleValue_Register1, 0 )
	SetPlot( PID, "range", "Z29_Q422557RANGE_00", 100 )
End
Function Z29_Q422557RANGE_00()
	local PID=OwnerID()
	local NPC=TargetID()
	if CheckAcceptQuest( PID, 422557 )==true and
	CheckFlag( PID, 541877 )==false then
		SetFlag( PID, 541877, 1 )
	else	return
	end	
End
----------------------------------------------------------------------------------------------------
Function Z30_NPC118569SPEAK_00()
	local Player = OwnerID()
	local Ctrl = TargetID()
	if ( CheckAcceptQuest( Player, 422653 )==true and CheckFlag( Player, 541878 )==false ) then
		AddSpeakOption( Player, Ctrl, "[SC_Q422653_00]", "Z30_NPC118569SPEAK_01", 0 )
	end
	LoadquestOption( Player )
End
Function Z30_NPC118569SPEAK_01()
	local Player = OwnerID()
	local Ctrl = TargetID()
	local QuestCheckBuff = 502632
	local ClientKeyItem = 542587
	if ReadRoleValue( Ctrl, EM_RoleValue_Register1 ) == 1 then
		ScriptMessage( Ctrl, Player, 0, "[SC_Q422653_04]", 0 )
		ScriptMessage( Ctrl, Player, 1, "[SC_Q422653_04]", 0 )
		AddSpeakOption( Player, Ctrl, "[SC_Q422653_05]", "Z30_NPC118569SPEAK_02", 0 )
		LoadquestOption( Player )
	else
		WriteRoleValue( Ctrl, EM_RoleValue_Register1, 1 )
		CancelBuff( Player, QuestCheckBuff )
		SetFlag( Player, ClientKeyItem, 1 )
		BeginPlot( Ctrl, "Z30_Q422653EventCheck", 0 )
		CallPlot( Ctrl, "Z30_Q422653EventShow", Player )
		CloseSpeak( Player )
	end
	return
End
Function Z30_NPC118569SPEAK_02()
	local Player = OwnerID()
	local Ctrl = TargetID()
	local QuestCheckBuff = 502632
	local ClientBuff = 500435
	local ClientKeyItem = 542587
	CancelBuff( Player, QuestCheckBuff )
	SetFlag( Player, ClientKeyItem, 1 )
	if ReadRoleValue( Ctrl, EM_RoleValue_Register1 ) == 1 then
		AddBuff( Player, ClientBuff, 0, 2 )
	else
		WriteRoleValue( Ctrl, EM_RoleValue_Register1, 1 )		
		BeginPlot( Ctrl, "Z30_Q422653EventCheck", 0 )
		CallPlot( Ctrl, "Z30_Q422653EventShow", Player )
	end
	CloseSpeak( Player )
	return
End
Function Z30_Q422653EventCheck()
	local Ctrl = OwnerID()
	local ClientKeyItem = 542587
	local RequireQuest = 422653
	local ShowCounter = 0
	local KeyItem = 541878
	local QuestCheckBuff = 502632
	local ClientBuff = 500435
	local Cutscene = 500429
	local RangePlayer = nil
	local SearchingRange = 250
	while true do
		if ShowCounter > 11 then
			break
		end
		RangePlayer = {}
		RangePlayer = SearchRangePlayer( Ctrl, SearchingRange )
		for i =0, #RangePlayer, 1 do
			if ( RangePlayer[ i ] ~= nil and CheckID( RangePlayer[ i ] ) == true ) and
			CheckAcceptQuest( RangePlayer[ i ], RequireQuest ) == true and
			CheckFlag( RangePlayer[ i ], ClientKeyItem ) == true then
				AddBuff( RangePlayer[ i ], ClientBuff, 0, 2 )
				AddBuff( RangePlayer[ i ], QuestCheckBuff, 0, -1 )
			end
		end
		ShowCounter = ShowCounter + 1
		Sleep( 20 )
	end
	RangePlayer = {}
	RangePlayer = SearchRangePlayer( Ctrl, SearchingRange )
	for j = 0, #RangePlayer, 1 do
		if ( RangePlayer[ j ] ~= nil and CheckID( RangePlayer[ j ] ) == true ) and
		CheckAcceptQuest( RangePlayer[ j ], RequireQuest ) == true and
		CheckFlag( RangePlayer[ j ], ClientKeyItem ) == true and
		CheckBuff( RangePlayer[ j ], QuestCheckBuff ) == true then
			AddBuff( RangePlayer[ j ], Cutscene, 0, 2 )
		end
	end
	Sleep( 10 )
	RangePlayer = {}
	RangePlayer = SearchRangePlayer( Ctrl, SearchingRange )
	for k =0, #RangePlayer, 1 do
		if ( RangePlayer[ k ] ~= nil and CheckID( RangePlayer[ k ] ) == true ) then
			SetFlag( RangePlayer[ k ], ClientKeyItem, 0 )
			if ( CheckAcceptQuest( RangePlayer[ k ], RequireQuest ) == true and
			CheckBuff( RangePlayer[ k ], QuestCheckBuff ) == true ) then
				BuffLv = KS_CheckBuffLV( RangePlayer[ k ], QuestCheckBuff )
				if BuffLv >= 5 then
					SetFlag( RangePlayer[ k ], KeyItem, 1 )					
					CancelBuff( RangePlayer[ k ], QuestCheckBuff )
				end
			end
		end
	end
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, 0 )
End
Function Z30_Q422653EventShow( Player )
	local Ctrl = OwnerID()
	local CastFX = 490602
	local RequireQuest = 422653
	local RangePlayer = {}
	local SearchingRange = 250
	local FlagID = 781383
	local x, y, z, dir = DW_Location( Ctrl )
	local NpcID = 121258
	local Npc = CreateObj( NpcID, x, y, z, dir, 1 )
	LockHP( Npc, ReadRoleValue( Npc, EM_RoleValue_MaxHP )*1, "Lua_424225_LockHP" )
	WriteRoleValue( Npc, EM_RoleValue_IsWalk , 0 )
	MoveToFlagEnabled( Npc, false )
	AddToPartition( Npc, 0 )
	Sleep( 10 )
	if ( Player ~= nil and CheckID( Player ) == true ) then
		AdjustFaceDir( Npc, Player, 0 )
	end
	PlayMotion( Npc, ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
	Sleep( 10 ) NpcSay( Npc, "[SC_NPC121258_00]" )
	Sleep( 20 ) FaceFlag( Npc, FlagID, 1 ) AdjustDir( Npc, 0 )
	Sleep( 05 ) LuaFunc_MoveToFlag( Npc, FlagID, 1, 0 )
	Sleep( 05 ) FaceFlag( Npc, FlagID, 2 ) AdjustDir( Npc, 0 )
	Sleep( 10 ) SetDefIdleMotion( Npc, ruFUSION_MIME_CRAFTING_LOOP )
	Sleep( 05 ) CastSpell( Npc, Npc, CastFX )
	RangePlayer = SearchRangePlayer( Ctrl, SearchingRange )
	for i = 0, #RangePlayer, 1 do
		if ( RangePlayer[ i ] ~= nil and CheckID( RangePlayer[ i ] ) == true ) and
		CheckAcceptQuest( RangePlayer[ i ], RequireQuest ) == true then
			ScriptMessage( Npc, RangePlayer[ i ], 0, "[SC_Q422653_01]", 0 )
			ScriptMessage( Npc, RangePlayer[ i ], 2, "[SC_Q422653_01]", 0 )
		end
	end
	Sleep( 40 )
	RangePlayer = {}
	RangePlayer = SearchRangePlayer( Ctrl, SearchingRange )
	for j =0, #RangePlayer, 1 do
		if ( RangePlayer[ j ] ~= nil and CheckID( RangePlayer[ j ] ) == true ) and
		CheckAcceptQuest( RangePlayer[ j ], RequireQuest ) == true then
			ScriptMessage( Npc, RangePlayer[ j ], 0, "[SC_Q422653_02]", 0 )
			ScriptMessage( Npc, RangePlayer[ j ], 2, "[SC_Q422653_02]", 0 )
		end
	end
	Sleep( 40 )
	RangePlayer = {}
	RangePlayer = SearchRangePlayer( Ctrl, SearchingRange )
	for k =0, #RangePlayer, 1 do
		if ( RangePlayer[ k ] ~= nil and CheckID( RangePlayer[ k ] ) == true ) and
		CheckAcceptQuest( RangePlayer[ k ], RequireQuest ) == true then
			ScriptMessage( Npc, RangePlayer[ k ], 0, "[SC_Q422653_03]", 0 )
			ScriptMessage( Npc, RangePlayer[ k ], 2, "[SC_Q422653_03]", 0 )
		end
	end
	Sleep( 25 ) SetDefIdleMotion( Npc, ruFUSION_MIME_IDLE_STAND )
	Sleep( 05 ) PlayMotion( Npc, ruFUSION_ACTORSTATE_EMOTE_VICTORY )
	Sleep( 15 )
	RangePlayer = {}
	RangePlayer = SearchRangePlayer( Ctrl, SearchingRange )
	for r =0, #RangePlayer, 1 do
		if ( RangePlayer[ r ] ~= nil and CheckID( RangePlayer[ r ] ) == true ) and
		CheckAcceptQuest( RangePlayer[ r ], RequireQuest ) == true then
			AdjustFaceDir( Npc, RangePlayer[ r ], 0 )
		end
	end
	Sleep( 10 ) PlayMotion( Npc, ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
	Sleep( 20 ) DelObj( Npc )
End
----------------------------------------------------------------------------------------------------
Function Z30_NPC123338SPEAK_00()
	local Player = OwnerID()
	local Npc = TargetID()
	local NpcID = ReadRoleValue( Npc, EM_RoleValue_OrgID )
	if ( CheckAcceptQuest( Player, 422655 ) == true and CountBodyItem( Player, 243103 ) >= 1 and CheckFlag( Player, 543901 ) == false ) then	
		AddSpeakOption( Player, Npc, "[SC_Q422655_00]", "Z30_Q422655SPEAK_00( "..NpcID.." )", 0 )
	end
	if CheckAcceptQuest( Player, 426803 ) == true and CheckFlag( Player, 548805 ) == false then
		AddSpeakOption( Player, Npc, "[SC_Z30Q426803_3]", "LuaPG_426803_Tell( "..NpcID.." )", 0 )
	end
	LoadquestOption( Player )
End
Function Z30_NPC121164SPEAK_00()
	local Player = OwnerID()
	local Npc = TargetID()
	local NpcID = ReadRoleValue( Npc, EM_RoleValue_OrgID )
	if ( CheckAcceptQuest( Player, 422655 )==true and CountBodyItem( Player, 243103 )>=1 and CheckFlag( Player, 543902 )==false ) then
		AddSpeakOption( Player, Npc, "[SC_Q422655_00]", "Z30_Q422655SPEAK_00( "..NpcID.." )", 0 )
	end
	LoadquestOption( Player )
End
Function Z30_Q422655SPEAK_00( NpcID )
	local Player = OwnerID()
	local Npc = TargetID()
	local RandNum = DW_Rand( 3 )
	CloseSpeak( Player )
	if ( CheckAcceptQuest( Player, 422655 ) == false or CountBodyItem( Player, 243103 ) == 0 ) then
		return
	end
	if ( NpcID == 123312 and CheckFlag( Player, 543903 ) == false ) then--¥j§V¨à
		SetFlag( Player, 543903, 1 )
	elseif ( NpcID == 121164 and CheckFlag( Player, 543902 ) == false ) then--·RÄR²ï
		SetFlag( Player, 543902, 1 )
	elseif ( NpcID == 123338 and CheckFlag( Player, 543901 ) == false ) then--¦N¯Çºû¤Ò
		SetFlag( Player, 543901, 1 )
	else
		return
	end
	DelBodyItem( Player, 243103, 1 )
	AdjustFaceDir( Npc, Player, 0 )
	if RandNum==1 then
		NpcSay( Npc, "[SC_Q422557_00]" )
	elseif RandNum==2 then
		NpcSay( Npc, "[SC_Q422557_01]" )
	else	NpcSay( Npc, "[SC_Q422557_02]" )
	end
	PlayMotion( Npc, ruFUSION_ACTORSTATE_EMOTE_SPEAK )
End
----------------------------------------------------------------------------------------------------
Function Z30_Q422557TOUCH_00()
	local PID=OwnerID()
	local NPC=TargetID()
	local Key=0
	local Index=ReadRoleValue( NPC, EM_RoleValue_PID )
	if Index==1 then Key=541880
	elseif Index==2 then Key=541881
	else Key=542580
	end
	if CheckAcceptQuest( PID, 422557 )==true and
	CheckFlag( PID, Key )==false then
		DW_QietKillOne( PID, 103399 )
		SetFlag( PID, Key, 1 )
	end
	return true
End
----------------------------------------------------------------------------------------------------
Function Z30_Q421655COMPLETE_00()
	local Ctrl=OwnerID()
	local PID=TargetID()
	AddBuff( PID, 500429, 0, 3 )
End
----------------------------------------------------------------------------------------------------
Function Z30_Q421657COMPLETE_00()
	local Ctrl=OwnerID()
	local PID=TargetID()
	local NPC=0
	local x, y, z, dir=DW_Location( Ctrl )
	if ReadRoleValue( Ctrl, EM_RoleValue_Register1 )==0 then
		WriteRoleValue( Ctrl, EM_RoleValue_Register1, 1 )
		NPC=CreateObj( 118571, x, y, z, dir, 1 )
		MoveToFlagEnabled( NPC, false )
		AdjustFaceDir( NPC, PID, 0 )
		AddToPartition( NPC, 0 )
		AddBuff( PID, 500433, 0, 7 )
		PlayMotion( NPC, ruFUSION_ACTORSTATE_CRAFTING_BEGIN )
		Sleep( 30 ) PlayMotion( NPC, ruFUSION_ACTORSTATE_CRAFTING_END )
		Sleep( 10 ) PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_APPROVAL )
		Sleep( 20 ) AddBuff( PID, 500429, 0, 2 )
		Sleep( 10 ) DelObj( NPC )
		WriteRoleValue( Ctrl, EM_RoleValue_Register1, 0 )
	else	return
	end
End
----------------------------------------------------------------------------------------------------
Function Z30_Q422557ACCEPT_00()
	local Ctrl=OwnerID()
	local PID=TargetID()
	local NPC=0
	local x, y, z, dir=DW_Location( Ctrl )
	if ReadRoleValue( Ctrl, EM_RoleValue_Register1 )==0 then
		WriteRoleValue( Ctrl, EM_RoleValue_Register1, 1 )
		NPC=CreateObj( 121257, x, y, z, dir, 1 )
		MoveToFlagEnabled( NPC, false )
		AddToPartition( NPC, 0 )
		AddBuff( PID, 500434, 0, 6 )
		Sleep( 15 ) NpcSay( NPC, "[SC_NPC121257_00]" )
		Sleep( 20 ) SetDefIdleMotion( NPC, ruFUSION_MIME_RUN_FORWARD )
		Sleep( 10 ) DelObj( NPC )
		WriteRoleValue( Ctrl, EM_RoleValue_Register1, 0 )
	else	return
	end
End
----------------------------------------------------------------------------------------------------
Function Z30_Q422654COMPLETE_00()
	local Ctrl=OwnerID()
	local PID=TargetID()
	local NPC=0
	local x, y, z, dir=DW_Location( Ctrl )
	if ReadRoleValue( Ctrl, EM_RoleValue_Register2 )==0 then
		CloseSpeak( PID )
		WriteRoleValue( NPC, EM_RoleValue_Register2, 1 )
		NPC=CreateObj( 121259, x, y, z, dir, 1 )
		MoveToFlagEnabled( NPC, false )
		AdjustFaceDir( NPC, PID, 0 )
		Sleep( 10 )ScriptMessage( Ctrl, PID, 2, "[SC_Q422654_01]", 0 )
		Sleep( 20 ) AddToPartition( NPC, 0 )
		AddBuff( PID, 500436, 0, 4 )
		PlayMotion( NPC, ruFUSION_ACTORSTATE_CRAFTING_BEGIN )
		Sleep( 35 ) AddBuff( PID, 500429, 0, 2 )
		Sleep( 10 ) PlayMotion( NPC, ruFUSION_ACTORSTATE_CRAFTING_END )
		DelObj( NPC )
		WriteRoleValue( Ctrl, EM_RoleValue_Register2, 0 )
	end
End
----------------------------------------------------------------------------------------------------
Function Z30_NPC122130SPEAK_00()
	local PID=OwnerID()
	local NPC=TargetID()
	if CheckFlag( PID, 542588 )==true then
		AddSpeakOption( PID, NPC, "[SC_Q422656_00]", "Z30_NPC122130SPEAK_01", 0 )
	end
	LoadquestOption( PID )
End
Function Z30_NPC122130SPEAK_01()
	local PID=OwnerID()
	local NPC=TargetID()
	if ReadRoleValue( NPC, EM_RoleValue_Register1 )==0 then
		CloseSpeak( PID )
		WriteRoleValue( NPC, EM_RoleValue_Register1, 1 )
		CallPlot( NPC, "Z30_NPC122130SPEAK_02", PID )
	else 	SetSpeakDetail( PID, GetString("SC_Q422656_03") )
	end
End
Function Z30_NPC122130SPEAK_02( PID )
	local Ctrl=OwnerID()
	local AllPlayers={}
	local NPC={}
	local x1, y1, z1, dir1=DW_Location( 781384, 2 )
	local x2, y2, z2, dir2=DW_Location( Ctrl )
	local x3, y3, z3, dir3=DW_Location( 781384, 4 )
	NPC[1]=CreateObj( 122131, x1, y1, z1, dir1, 1 )
	NPC[2]=CreateObj( 121530, x2, y2, z2, dir2, 1 )
	NPC[3]=CreateObj( 122133, x3, y3-10, z3, dir3, 1 )
	for i=1, 2, 1 do
		AddToPartition( NPC[ i ], 0 )
		MoveToFlagEnabled( NPC[ i ], false )
	end
	AllPlayers=SearchRangePlayer( Ctrl, 500 )
	for j=0, table.getn( AllPlayers ), 1 do
		if CheckFlag( AllPlayers[ j ], 542588 )==true then
			AddBuff( AllPlayers[ j ], 500437, 0, 30 )
		end
	end
	Sleep( 20 )
	FaceFlag ( NPC[2], 781384, 2 ) AdjustDir( NPC[2], 0 )
	Sleep( 15 ) NpcSay( NPC[2], "[SC_Q422656_05]" )
	Sleep( 35 ) NpcSay( NPC[1], "[SC_Q422656_01]" )
	Sleep( 15 ) FaceFlag ( NPC[1], 781384, 3 ) AdjustDir( NPC[1], 0 )
	Sleep( 15 ) SetDefIdleMotion( NPC[1], ruFUSION_MIME_CRAFTING_LOOP ) CastSpell( NPC[ 1 ], NPC[ 1 ], 490603 )
	Sleep( 15 ) AddToPartition( NPC[ 3 ], 0 ) MoveToFlagEnabled( NPC[ 3 ], false ) AddBuff( NPC[ 3 ], 500439, 0, -1 )
	Sleep( 15 ) NpcSay( NPC[2], "[SC_Q422656_04]" )
	Sleep( 25 ) LuaFunc_MoveToFlag( NPC[2], 781384, 4, 0 )
	Sleep( 10 ) FaceFlag ( NPC[2], 781384, 4 ) AdjustDir( NPC[1], 0 )
	Sleep( 15 ) NpcSay( NPC[1], "[SC_Q422656_02]" )
	Sleep( 10 ) SetDefIdleMotion( NPC[2], ruFUSION_MIME_SWIM_IDLE )
	Sleep( 20 ) CastSpell( NPC[ 3 ], NPC[ 3 ], 490513 )
	Sleep( 30 )
	AllPlayers=SearchRangePlayer( NPC[2], 50 )
	for k=0, table.getn( AllPlayers ), 1 do
		if CheckID( AllPlayers[ k ] )==true and CheckFlag( AllPlayers[ k ], 542588 )==true then
			AddBuff( AllPlayers[ k ], 500429, 0, 3 )
		end
	end
	AllPlayers=SearchRangePlayer( NPC[2], 50 )
	for n=0, table.getn( AllPlayers ), 1 do
		if CheckID( AllPlayers[ n ] )==true and CheckFlag( AllPlayers[ n ], 542588 )==true then
			SetFlag( AllPlayers[ n ], 542589, 1 )
			SetPosByFlag( AllPlayers[ n ], 781384, 1 )
		end
	end
	for p=1, 3, 1 do
		DelObj( NPC[ p ] )
	end
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, 0 )
	return
End
----------------------------------------------------------------------------------------------------
Function Z30_NPC122130_00()
	local PID=OwnerID()
	SetPlot( PID, "range", "Z30_NPC122130_01", 100 )
End
Function Z30_NPC122130_01()
	local PID=OwnerID()
	local NPC=TargetID()
	if CheckAcceptQuest( PID, 422656 )==true and CheckFlag( PID, 542588 )==false then
		SetFlag( PID, 542588, 1 )
	end
End
----------------------------------------------------------------------------------------------------
Function Z30_Q422656ACCEPT_00()
	local Ctrl=OwnerID()
	local PID=TargetID()
	local NPC=0
	local x, y, z, dir=DW_Location( Ctrl )
	if ReadRoleValue( Ctrl, EM_RoleValue_Register1 )==0 then
		WriteRoleValue( Ctrl, EM_RoleValue_Register1, 1 )
		NPC=CreateObj( 122132, x, y, z, dir, 1 )
		MoveToFlagEnabled( NPC, false )
		AddToPartition( NPC, 0 )
		AddBuff( PID, 500438, 0, 6 )
		Sleep( 15 ) NpcSay( NPC, "[SC_NPC122132_00]" )
		Sleep( 20 ) SetDefIdleMotion( NPC, ruFUSION_MIME_WALK_FORWARD )
		Sleep( 10 ) DelObj( NPC )
		WriteRoleValue( Ctrl, EM_RoleValue_Register1, 0 )
	else	return
	end
End
----------------------------------------------------------------------------------------------------
Function Z30_Q421654Completed_00()
	local NPC=OwnerID()
	local Player=TargetID()
	SetFlag( Player, 542602, 0 )
End
----------------------------------------------------------------------------------------------------
Function Z30_NPC121516SPEAK_00()
	local Player=OwnerID()
	local NPC=TargetID()
	if CheckAcceptQuest( Player, 421654 )==true then
		AddSpeakOption( Player, NPC, GetString("SC_Q421654_01"), "Z30_NPC121516SPEAK_01", 0 )
	end
	LoadQuestOption( Player )
End
----------------------------------------------------------------------------------------------------
Function Z30_NPC118568_00()
	local NPC=OwnerID()
	SetDefIdleMotion( NPC, ruFUSION_MIME_SNEAK_FORWARD )
End
----------------------------------------------------------------------------------------------------
Function Z30_Q422358KILLNPC_00()
	local NPC=OwnerID()
	local Player=TargetID()
	if ( CheckAcceptquest( Player, 422358 )==true and
	ReadRoleValue( NPC, EM_RoleValue_PID )==1 ) then
		DW_QietKillOne( Player, 103429 )
	end
	return true
End
----------------------------------------------------------------------------------------------------
Function Z30_NPC121254_00()
	local Ctrl = OwnerID()
	local x, y, z, dir = DW_Location( Ctrl )
	local ArrowID = 123983
	local ArrowObj = CreateObj( ArrowID, x, y+30, z, dir, 1 )
	MoveToFlagEnabled( ArrowObj, false )
	SetModeEx( ArrowObj, EM_SetModeType_Mark, false )
	SetModeEx( ArrowObj, EM_SetModeType_Gravity, false )
	AddToPartition( ArrowObj, 0 )
End
----------------------------------------------------------------------------------------------------