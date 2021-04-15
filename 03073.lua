----------------------------------------------------------------------------------------------------
Function Z27_ITEM242996USE_00()
	DW_Border( 426573 ) 
End
----------------------------------------------------------------------------------------------------
Function Z27_NPC122760SPEAK_00()
	local PID=OwnerID()
	local NPC=TargetID()
	if ( CheckAcceptQuest( PID, 426573 )==true and
	CountBodyItem( PID, 242996 )>=1 and
	CheckFlag( PID, 548337 )==false ) then
		AddSpeakOption( PID, NPC, "[SC_NPC122760SPEAK_00]", "Z27_NPC122760SPEAK_01", 0 )
	else	LoadquestOption( PID )
	end
	LoadquestOption( PID )
End
Function Z27_NPC122760SPEAK_01()
	local PID=OwnerID()
	LoadquestOption( PID )
	DelBodyItem( PID, 242996, 1 )
	SetFlag( PID, 548337, 1 )
End
----------------------------------------------------------------------------------------------------
Function Z27_NPC108173MOVE_01()
	local NPC=OwnerID()
	local Num=DW_Rand( 4 )
	PlayMotion( NPC, ruFUSION_ACTORSTATE_SIT_BEGIN )
	Sleep( 190 )
	PlayMotion( NPC, ruFUSION_ACTORSTATE_SIT_END )
	Sleep( 30 )
	if Num==1 then PlayMotion( NPC, ruFUSION_ACTORSTATE_BUFF_SP01 )
	elseif Num==2 then	PlayMotion( NPC, ruFUSION_ACTORSTATE_BUFF_SP02 )
	elseif Num==3 then	PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_IDLE0 )
	else PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_IDLE1 )
	end
End
Function Z27_NPC108173MOVE_02()
	local NPC=OwnerID()
	local Num=DW_Rand( 4 )
	if Num==1 then PlayMotion( NPC, ruFUSION_ACTORSTATE_BUFF_SP01 )
	elseif Num==2 then	PlayMotion( NPC, ruFUSION_ACTORSTATE_BUFF_SP02 )
	elseif Num==3 then	PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_IDLE0 )
	else PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_IDLE1 )
	end
End
----------------------------------------------------------------------------------------------------
Function Z27_NPC108174MOVE_00()
	local NPC=OwnerID()
	local Num1=DW_Rand( 20 )
	local Num2=DW_Rand( 8 )
	if Num1==1 then
		if Num2==1 then NpcSay( NPC, "[SC_NPC108174SPEAK_01]" )
		elseif Num2==2 then NpcSay( NPC, "[SC_NPC108174SPEAK_02]" )
		elseif Num2==3 then NpcSay( NPC, "[SC_NPC108174SPEAK_03]" )
		elseif Num2==4 then NpcSay( NPC, "[SC_NPC108174SPEAK_04]" )
		elseif Num2==5 then NpcSay( NPC, "[SC_NPC108174SPEAK_05]" )
		elseif Num2==6 then NpcSay( NPC, "[SC_NPC108174SPEAK_06]" )
		elseif Num2==7 then NpcSay( NPC, "[SC_NPC108174SPEAK_07]" )
		else NpcSay( NPC, "[SC_NPC108174SPEAK_08]" )
		end
	end
End
----------------------------------------------------------------------------------------------------
function Z27_Q426581TouchEnd()
	local Player = OwnerID()
	local TargetObj = TargetID()
	if EmptyPacketCount( Player ) >= 1 then
		return true
	end
	ScriptMessage( Player, Player, 0, "[MSG_SONGSONGBAGWARN]", 0 )
	ScriptMessage( Player, Player, 1, "[MSG_SONGSONGBAGWARN]", 0 )
	return false
end
----------------------------------------------------------------------------------------------------