

----------------空出雙手來拿武器------------------------
function Lua_DW_ClearMyWeapan()
	SetRoleEquip(OwnerID(),EM_EQWearPos_MainHand,213217,1)
	SetRoleEquip(OwnerID(),EM_EQWearPos_SecondHand,213217,1)
end

----------NoDelay-----------------------------------

function Lua_NoDelay()
	SetDelayPatrolTime( OwnerID(), 0 )
end


----------idle-----------------------------------

function Lua_DW_Idle()
	local Obj = OwnerID()
	if	CheckBuff(Obj,509744)==false	then
		PlayMotion(Obj,ruFUSION_ACTORSTATE_EMOTE_IDLE)
		AddBuff(Obj,509744,0,12)
	end
end


-----------------------------吃喝-------------------------------------

function LuaP_DW_Eating()
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_EAT);
end

function LuaP_DW_Drinking()
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_DRINK);
end


---------------------思考----------------------------------

function LuaP_DW_Thinking()
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_THINK);
end

-----------------------Buff-----------------------------------
	
function Lua_KS_Buff()
	PlayMotion(OwnerID(), ruFUSION_ACTORSTATE_BUFF_BEGIN )
end

-----------------------Cast-----------------------------------
	
function Lua_KS_Cast()
	PlayMotion(OwnerID(), ruFUSION_ACTORSTATE_CAST_BEGIN )
end

---------工作------------------------

function Lua_DW_Craft()
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_CRAFTING_BEGIN)
end

function Lua_KS_Gather()
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_GATHER_BEGIN )
end

---------蹲下---------------------


function Lua_DW_Crouch()
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_CROUCH_BEGIN)
end


---------採礦---------------------


function Lua_DW_Mining()
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_MINING_BEGIN)
end


---------讀書-------------------------


function Lua_DW_Read()
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_READING_BEGIN)
end

---------說話-------------------------
function Lua_DW_Speak()
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_SPEAK)
end


---------大笑-------------------------
function Lua_DW_LAUGH()
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_LAUGH)
end



--------哭---------------

function LuaS_Discowood_Motion_Cry()
	PlayMotion(OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_CRY)
end



----------求饒----------------

function LuaS_Discowood_Motion_Beg()
	PlayMotion(OwnerID() , ruFUSION_ACTORSTATE_EMOTE_BEG)
end



---------鄉民--------------------------

function LuaS_Discowood_Viewers()
	local Motion={}
	local ran
	Motion[1] = ruFUSION_ACTORSTATE_EMOTE_VICTORY
	Motion[2] = ruFUSION_ACTORSTATE_EMOTE_PROVOKE
	Motion[3] = ruFUSION_ACTORSTATE_EMOTE_LAUGH
--	Motion[4] = ruFUSION_ACTORSTATE_EMOTE_DANCE
	math.randomseed(math.random(10000, 99999))
	ran = math.random(1,3)
	PlayMotion( OwnerID(), Motion[ran] )

	math.randomseed(math.random(10000, 99999))
	ran = math.random(2,5)
	sleep(ran*10)

	math.randomseed(math.random(10000, 99999))
	ran = math.random(1,3)
	PlayMotion( OwnerID(), Motion[ran] )

	math.randomseed(math.random(10000, 99999))
	ran = math.random(2,5)
	sleep(ran*10)

	math.randomseed(math.random(10000, 99999))
	ran = math.random(1,3)
	PlayMotion( OwnerID(), Motion[ran] )
end

--------------------揮手---------------------

function LuaP_dr_WAVE()   
	PlayMotionEX( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_WAVE,ruFUSION_ACTORSTATE_EMOTE_WAVE)
end

--------------------伸懶腰--------------------

function LuaP_dr_STRETCH()  
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_STRETCH,ruFUSION_ACTORSTATE_EMOTE_STRETCH)
end

----------------------空手招架----------------------

function LuaP_dr_PARRY() 
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_PARRY_UNARMED,ruFUSION_ACTORSTATE_PARRY_UNARMED)
end

----------------------指人----------------------

function LuaP_dr_POINT() 
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_POINT,ruFUSION_ACTORSTATE_EMOTE_POINT)
end


--------------------乞討--------------------

function LuaPG_BEG()
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_BEG)
end

---------------------恐懼-----------------------

function LuaP_dr_FEAR() 
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_FEAR)
end

-------------------------------------------------
function LuaP_dr_IDLE02() 
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_IDLE2,ruFUSION_ACTORSTATE_EMOTE_IDLE2)
end
-------------------------------------------------
function LuaP_dr_ROFL() 	--打滾
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_ROFL)
end
-------------------------------------------------
function LuaP_dr_TIRED() 	--疲累
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_TIRED)
end