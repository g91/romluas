-----------------------------�@������--------------------------------------
Function LuaP_Sitting()
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_SIT_BEGIN,ruFUSION_ACTORSTATE_SIT_LOOP)
	sleep(30)
end
Function Lua_Will_Sitting()
	SetDefIdleMotion( OwnerID(), ruFUSION_MIME_SIT_LOOP )
End
-----------------------------�@������(�Ȥl)--------------------------------------
Function LuaP_SittingChair()
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_SIT_CHAIR_BEGIN,ruFUSION_ACTORSTATE_SIT_CHAIR_LOOP)
	sleep(30)
end
---------------------------------------------------------------------------
-----------------------------�@������--------------------------------------
Function LuaP_Sleeping()
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_SLEEP_BEGIN,ruFUSION_ACTORSTATE_SLEEP_LOOP)
	sleep(30)
end
Function Lua_Will_Sleeping()
	SetDefIdleMotion( OwnerID(), ruFUSION_MIME_SLEEP_LOOP )
End
---------------------------------------------------------------------------
------------------------����ʧ@�@������------------------------------------
Function LuaP_Activating()
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP )
	sleep(40)
end

function LuaS_DW_Activating()
	SetDefIdleMotion(OwnerID(),ruFUSION_MIME_ACTIVATE_LOOP)
end
---------------------------------------------------------------------------------------
-----------------------------���骬�A--------------------------------------
function LuaP_DW_Dead() --�p������
	SetDefIdleMotion(OwnerID(),ruFUSION_MIME_DEATH_LOOP)
end

Function LuaP_Dead()
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_DYING,ruFUSION_ACTORSTATE_DEAD)
	sleep(30)
end

Function LuaP_Dead2()
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_DEAD, ruFUSION_ACTORSTATE_DEAD )
	sleep(30)
end

---------------------------------------------------------------------------
-----------------------------�@���u�@--------------------------------------
Function LuaP_Crafting()
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_CRAFTING_BEGIN,ruFUSION_ACTORSTATE_CRAFTING_LOOP)
	sleep(30)
end


function LuaS_DW_Crafting()
	SetDefIdleMotion(OwnerID(),ruFUSION_MIME_CRAFTING_LOOP)
end
---------------------------------------------------------------------------
-----------------------------�@���۵�--------------------------------------
Function LuaP_Crouch()
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_CROUCH_BEGIN,ruFUSION_ACTORSTATE_CROUCH_LOOP)
	sleep(30)
end
---------------------------------------------------------------------------
-----------------------------�@�����q--------------------------------------
Function LuaP_Mining()
	while 1 do
	sleep( 30 )
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_MINING_BEGIN )
	sleep(50)
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_MINING_END )
	sleep(50)
	end	
end
---------------------------------------------------------------------------
-----------------------------�@������--------------------------------------
Function LuaP_Fishing()
	while true do
		sleep( 30 )
		PlayMotionEX( OwnerID(),ruFUSION_ACTORSTATE_FISHING_CAST,ruFUSION_ACTORSTATE_FISHING_IDLE)
		sleep(60)
		PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_FISHING_REEL )
		sleep(30)
	end	
end
---------------------------------------------------------------------------
-----------------------------���۩��g--------------------------------------
Function LuaP_Slumber()
	PlayMotionEX( OwnerID(),ruFUSION_ACTORSTATE_SLUMBER_BEGIN,ruFUSION_ACTORSTATE_SLUMBER_LOOP )
	sleep(10)
end
---------------------------------------------------------------------------
-----------------------------���۷w�t--------------------------------------
Function LuaP_Dazed() 
	PlayMotionEX( OwnerID(),ruFUSION_ACTORSTATE_Dazed_BEGIN,ruFUSION_ACTORSTATE_Dazed_LOOP )
	sleep(10)
end
---------------------------------------------------------------------------
-----------------------------�@���I�k--------------------------------------
Function LuaP_Casting() 
	--PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_CAST_BEGIN )
	--sleep(10)
	while 1 do
		PlayMotionEX( OwnerID(),ruFUSION_ACTORSTATE_CHANNEL_BEGIN, ruFUSION_ACTORSTATE_CHANNEL_LOOP )
		sleep(200)
	end
end

---------------------------------------------------------------------------
-----------------------------���q���------------------------------------
Function LuaP_Speak_A()
	MoveToFlagEnabled( OwnerID(), false );
	Local Speak={}
	Local Motion
	Speak[0] = ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD -- 1/5 ���v���X�I�Y�ʧ@
	Speak[1] = ruFUSION_ACTORSTATE_EMOTE_SPEAK
	Speak[2] = ruFUSION_ACTORSTATE_EMOTE_SPEAK
	Speak[3] = ruFUSION_ACTORSTATE_EMOTE_SPEAK
	Speak[4] = ruFUSION_ACTORSTATE_EMOTE_SPEAK

	for n = 1 , 2  do 
		Local i = rand(5)
		Motion = Speak[i]
		PlayMotion( OwnerID(),Motion )
		sleep(30)
	end

	MoveToFlagEnabled( OwnerID(), true );
end
---------------------------------------------------------------------------
-----------------------------�u�@�ʧ@------------------------------------
Function LuaP_Craft_A()
	MoveToFlagEnabled( OwnerID(), false );
	sleep(30)
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_CRAFTING_BEGIN )
	sleep( 100 )
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_CRAFTING_END)
	sleep( 50 )
	MoveToFlagEnabled( OwnerID(), true );
end
---------------------------------------------------------------------------
-----------------------------���q�ʧ@------------------------------------
Function LuaP_Mining_A()
	MoveToFlagEnabled( OwnerID(), false );
	sleep( 30 )
	SetRoleEquip( OwnerID(), EM_EQWearPos_Manufactory, 210327, 1 );
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_MINING_BEGIN )
	sleep( 100 )
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_MINING_END)
	sleep(30)
	MoveToFlagEnabled( OwnerID(), true );
end
---------------------------------------------------------------------------
-----------------------------���U�𮧰ʧ@------------------------------------
Function LuaP_SitRest_A()
	MoveToFlagEnabled( OwnerID(), false );
	sleep( 30 )
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_SIT_BEGIN )
	sleep( 100 )
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_SIT_END)
	sleep( 30 )
	MoveToFlagEnabled( OwnerID(), true );
end
---------------------------------------------------------------------------
-----------------------------���U�𮧰ʧ@------------------------------------
Function LuaP_SleepRest_A()
	MoveToFlagEnabled( OwnerID(), false );
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_SLEEP_BEGIN )
	sleep( 100 )
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_SLEEP_END)
	sleep( 30 )
	MoveToFlagEnabled( OwnerID(), true );
end
---------------------------------------------------------------------------
-----------------------------�@������(�k��)------------------------------------
Function LuaP_Speak_B()

	sleep( 30 )
	Local Speak={}
	Local Motion
	Speak[1] = ruFUSION_ACTORSTATE_EMOTE_ANGRY
	Speak[2] = ruFUSION_ACTORSTATE_EMOTE_LAUGH
	Speak[3] = ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE
	for i = 4 , 10 , 1 do
		Speak[i] = ruFUSION_ACTORSTATE_EMOTE_SPEAK
		sleep(1)
	end

	While 1  do 
		Local j = rand(10) + 1
		Motion = Speak[j]
		PlayMotion( OwnerID(),Motion )
		sleep(50+Rand(20))
	end
end
---------------------------------------------------------------------------
-----------------------------�@������(�k��)------------------------------------
Function LuaP_Speak_C()
	
	sleep( 30 )
	Local Speak={}
	Local Motion
	Speak[1] = ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD
	Speak[2] = ruFUSION_ACTORSTATE_EMOTE_APPLAUSE
	Speak[3] = ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE

	for i = 4 , 10 , 1 do
		Speak[i] = ruFUSION_ACTORSTATE_EMOTE_SPEAK
	end

	While 1  do 
		Local j = rand(10) + 1
		Motion = Speak[j]
		PlayMotion( OwnerID(),Motion )
		sleep(50+Rand(20))
	end
end
---------------------------------------------------------------------------
-----------------------------�@������(�D�ȫ�����)------------------------------------
Function LuaP_Speak_D()
	While 1  do 
		PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_SPEAK )
		sleep(30+Rand(20))
	end
end

Function LuaP_Speak_E()
	SetDefIdleMotion( OwnerID(), ruFUSION_MIME_EMOTE_SPEAK)
end

Function LuaP_Speak_F()	--�榸
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_SPEAK)
end
---------------------------------------------------------------------------
-----------------------------�˹�NPC�ʧ@------------------------------------
Function LuaP_NPC_NOMAL()

--	While 1  do 

		PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_CROUCH)
		sleep(50+Rand(20))
--	end
end
-----------------------------�M�¦�x��--------------------------------------
Function LuaP_RidingBlackHouse()
	if CheckBuff( OwnerID() , 501634 ) == false then
		CastSpell( OwnerID() , OwnerID() , 491233 )
		sleep(30)
	end
end

-----------------------------�M��ήy�M--------------------------------------
Function LuaP_RidingDataniee()
	if CheckBuff( OwnerID() , 506238 ) == false then
		AddBuff( OwnerID() , 506238 , 0 , -1 )
	end
end
-----------------------------�M�L�h���y�M--------------------------------------
Function LuaP_RidingBolon()
	if CheckBuff( OwnerID() , 506239  ) == false then
		AddBuff( OwnerID() , 506239 , 0 , -1 )
	end
end
----------------------------�X�ͼ��-----------------------------------
function LuaS_Discowood_NowToHide()
	AddBuff( OwnerID() ,502280,1 ,-1)
end


-----------------�u�@----------------

function Lua_CraftingIdle()
	SetIdleMotion( OwnerID(),ruFUSION_ACTORSTATE_CRAFTING_LOOP)
end

function Lua_GatherIdle()
	SetDefIdleMotion( OwnerID() , ruFUSION_MIME_GATHER_LOOP )
end

function LuaP_IdelPlay_TypeA()
	PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_IDLE0 )
	sleep( 25 )
	if DW_Rand( 2 ) == 1 then
		PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_IDLE1)
	else
		PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_IDLE2 )
	end
end

-------------����------------

function Lua_Deadkeep()
	SetIdleMotion( OwnerID() , ruFUSION_ACTORSTATE_DEAD)
	sleep(10)
	for i =1,4 do
		if	ReadRoleValue(OwnerID(), EM_RoleValue_IsAttackMode) == 1	then
			SetIdleMotion( OwnerID() , ruFUSION_ACTORSTATE_NORMAL)
			break
		end
		if  i==4  then
			break
		end
		sleep(10)
	end
end

---------------------------

function Lua_akeymaker_dodge()
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_DODGE )
end

---------------------

function LuaWS_LAUGH()
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_LAUGH)
end

function LuaWS_COMBAT_1H()--�ƾ�

	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_COMBAT_1H)
end

---------------------
function LuaPG_Bow()	--�Ԥ}�ƾ�
	PlayMotionEX( OwnerID(),ruFUSION_ACTORSTATE_ATTACK_BOW_BEGIN,ruFUSION_ACTORSTATE_ATTACK_BOW_LOOP)
end
---------------------
function LuaP_An_run()	--�]�]�]�A�V�e�]
	SetDefIdleMotion(OwnerID(),ruFUSION_MIME_RUN_FORWARD)	
end




