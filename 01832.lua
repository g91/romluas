function LuaS_eatgulo()
	Local target = LuaFunc_SearchNPCbyOrgID( OwnerID() , 103895 , 150 , 0)
	say(OwnerID(),target)
	if target ~= -1	then
		MoveToFlagEnabled(OwnerID(),false)
		SetAttack(OwnerID(),target)


		say(OwnerID(),"I attack you~")
		Local time=0
		for i=1,30,1 do
			say(target,"I will be kill")
			say(OwnerID(),time)
			if time > 20 then				---�ɶ��W�L������
				SetStopAttack(OwnerID())
				MoveToFlagEnabled(OwnerID(),true)	
				break		
			end
			if ReadRoleValue( target , EM_RoleValue_IsDead ) == 1 then
				PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_BUFF_SP01)
				sleep(20)
				MoveToFlagEnabled(OwnerID(),true)	
				say(OwnerID(),"I kill you~")
				break
			end
			sleep(10)
			time = time +1
		end
	end
end
--------------------------------�i��s��Y��-----------------------
function Lua_DW_Idle_loop()
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_IDLE)
	sleep(25)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_IDLE)
	sleep(25)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_IDLE)
end
-----------------------------�p�w�d�~�H�s��u�d---------------------
function Lua_DW_see_loop()
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_IDLE2)
	sleep(35)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_IDLE2)
	sleep(35)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_IDLE2)
end
--------------------------�p�w�d�~�Hdo some thing---------------------
function Lua_DW_dosomething()
--	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_KNOCKDOWN_LOOP)
	SetDefIdleMotion( OwnerID() ,ruFUSION_MIME_BUFF_LOOP)		
end

------------------------�p�w�d�~�Hjump
function Lua_DW_Idle_anytime()
	while true do
		PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_BUFF_SP01)
		sleep(20)	
	end
end

function LuaS_MK_CRY()
	PlayMotion( OwnerID()  ,ruFUSION_ACTORSTATE_EMOTE_CRY)	
end