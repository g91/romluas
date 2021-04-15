------------------------------------------------------------------------
Function Z24_NPC121123_00()--約翰．海克爾
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Sleep(40)
End
------------------------------------------------------------------------
Function Z24_NPC107126_01()--聯盟戰士工匠
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_CRAFTING_BEGIN )
	sleep(40)
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_CRAFTING_LOOP )
	sleep(190)
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_CRAFTING_END )
	sleep(10)
End
Function Z24_NPC107126_02()--聯盟戰士工匠
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_IDLE2 )
	sleep(40)
End
------------------------------------------------------------------------
Function Z24_NPC107127_01()--聯盟戰士鼠人
	local delay=Rand(2)+1
	local num=Rand(5)+1
	sleep(10+delay*10)
	if num==1 then
		PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_IDLE0 )
		sleep(60)
		PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_IDLE0 )
		sleep(30)
	end
	if num==2 then
		PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_IDLE0 )
		sleep(60)
		PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_IDLE1 )
		sleep(30)
	end
	if num==3 then
		PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_IDLE1 )
		sleep(60)
		PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_IDLE0 )
		sleep(30)
	end
	if num==4 then
		PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_IDLE1 )
		sleep(60)
		PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_IDLE1 )
		sleep(30)
	end
	if num==5 then
		PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_IDLE0 )
		sleep(60)
		PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_VICTORY )
		sleep(30)
	end
End
------------------------------------------------------------------------
Function Z24_NPC107125_01()--聯盟戰士犀牛人
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_IDLE1 )
End
Function Z24_NPC107125_02()--聯盟戰士犀牛人
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_SIT_BEGIN )
	sleep(20)
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_SIT_LOOP )
	sleep(1200)
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_SIT_END )
	sleep(20)
End
------------------------------------------------------------------------
Function Z24_NPC106851_01()--聯盟戰士黑曜石
	local num=rand(2)
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_CRAFTING_BEGIN )
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_CRAFTING_LOOP )
	Sleep(160)
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_CRAFTING_END )
	Sleep(10)
	if num==0 then
		PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_IDLE )
	else	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_STRETCH )
	end
	Sleep(35)
end
------------------------------------------------------------------------
Function Z24_NpcCombatMotion_00()
	local elf=ownerid()
	SetDefIdleMotion( elf, ruFUSION_MIME_IDLE_COMBAT_1H )
	if ReadRoleValue( elf, EM_RoleValue_OrgID)==106811 or
	ReadRoleValue( elf, EM_RoleValue_OrgID)==121121 then
		AddBuff( elf, 623132, 0, -1 )
	end
	LockHP( elf, ReadRoleValue( elf, EM_RoleValue_MaxHP)*0.20, "Lua_424225_LockHP" )
End
------------------------------------------------------------------------
Function Z24_NpcCombatMotion_01()
	local elf=ownerid()
	local num=rand(3)
	if num==0 then
		PlayMotion( elf, ruFUSION_ACTORSTATE_CROUCH_BEGIN )
	else	PlayMotion( elf, ruFUSION_ACTORSTATE_COMBAT_1H )
	end
end
------------------------------------------------------------------------
Function z24_BUFF623744_00()
	Say( OwnerID(), "OwnerID" )
	Say( TargetID(), "TargetID" )
End
------------------------------------------------------------------------
Function z24_Cast623807_00()
	Say( OwnerID(), "OwnerID" )
	Say( TargetID(), "TargetID" )
End
------------------------------------------------------------------------