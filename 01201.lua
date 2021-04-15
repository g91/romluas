------------------------------無懼AE----------------------
function DW_DontFearAE(Target)
	local Obj
	if	Target==nil	then
		Obj = OwnerID()
	else
		Obj = Target
	end
	AddBuff(Obj,508481,1,-1)
end


----------------雙手武器戰鬥預備動作 -----------------------
function LuaS_Discowood_Combat_2H()
	PlayMotionEX( OwnerID(),ruFUSION_ACTORSTATE_COMBAT_2H, ruFUSION_ACTORSTATE_COMBAT_2H)
end
function LuaS_DW_Combat_2H()
	local Obj = OwnerID()
	SetDefIdleMotion(Obj,ruFUSION_MIME_IDLE_COMBAT_2H)
end
----------------單手武器戰鬥預備動作-----------------------
function LuaS_Discowood_Combat_1H()
	PlayMotionEX( OwnerID(),ruFUSION_ACTORSTATE_COMBAT_1H, ruFUSION_ACTORSTATE_COMBAT_1H)
end
function LuaS_DW_Combat_1H()
	local Obj = OwnerID()
	SetDefIdleMotion(Obj,ruFUSION_MIME_IDLE_COMBAT_1H)
end
----------------空手武器戰鬥預備動作-----------------------
function LuaS_Discowood_Combat_UNARMED()
	PlayMotionEX( OwnerID(),ruFUSION_ACTORSTATE_COMBAT_UNARMED, ruFUSION_ACTORSTATE_COMBAT_UNARMED)
end
function LuaS_DW_Combat_UNARMED()
	local Obj = OwnerID()
	SetDefIdleMotion(Obj,ruFUSION_MIME_IDLE_COMBAT_UNARMED)
end



--------空手戰鬥(表演)---------
function LuaS_Discowood_Show_UnArmed()
	local Search = SearchRangeNPC ( OwnerID() , 20 )
	for i = 0 , table.getn(Search)+1 do
		if Search[i] ~= OwnerID() then
			if Search[i] == -1 then
				SetIdleMotion( OwnerID(),ruFUSION_ACTORSTATE_NORMAL)
				return
			end
			break
		end
	end
	SetIdleMotion( OwnerID(),ruFUSION_ACTORSTATE_COMBAT_UNARMED)
	sleep(10)
	for i=1 , 5 do
		if LuaS_Discowood_Callfunction_UnArmed() == false then
			return
		else
			if i ~= 5 then
				sleep(20)
			end
		end
	end
end


function LuaS_Discowood_Callfunction_UnArmed()
	local Motion = {}
	Motion[1] = ruFUSION_ACTORSTATE_SHIELD_BASH
	Motion[2] = ruFUSION_ACTORSTATE_ATTACK_UNARMED
	Motion[3] = ruFUSION_ACTORSTATE_ATTACK_UNARMED_SP
	Motion[4] = ruFUSION_ACTORSTATE_SP_SPINKICK
	
	if ReadRoleValue(OwnerID() , EM_RoleValue_AttackTargetID) ~= 0 then
		SetIdleMotion( OwnerID(),ruFUSION_ACTORSTATE_NORMAL)
		return false
	else
		math.randomseed(math.random(10000, 99999))
		local ran = math.random(1,4)
		PlayMotion( OwnerID(), Motion[ran] )
		return true
	end
end


------------------------------空手戰鬥真槍實彈--------------------------------
function LuaS_Discowood_TrueFight_1()
	local Tar
	local Search = SearchRangeNPC ( OwnerID() , 20 )
	for i = 0 , table.getn(Search)+1 do
		if Search[i] ~= OwnerID() then
			if Search[i] == -1 then
--DeBugMSG(0,0,"Search[i] == -1")
--				SetIdleMotion( OwnerID(),ruFUSION_ACTORSTATE_NORMAL)
				return
			end
			if	ReadRoleValue(Search[i],EM_RoleValue_CampID)==3	and
				ReadRoleValue(Search[i],EM_RoleValue_IsDead)==0	then
				Tar = Search[i]
--DeBugMSG(0,0,"TargetID = "..Tar)
				break
			end
		end
	end
	SetIdleMotion( OwnerID(),ruFUSION_ACTORSTATE_COMBAT_UNARMED)
	sleep(10)
	for i=1 , 4 do
		if LuaS_Discowood_TrueFight_2(Tar) == false then
			return
		else
			if i ~= 4 then
				SetIdleMotion( OwnerID(),ruFUSION_ACTORSTATE_COMBAT_UNARMED)
				sleep(30)
				SetIdleMotion( OwnerID(),ruFUSION_ACTORSTATE_COMBAT_UNARMED)
			end
		end
	end
end


function LuaS_Discowood_TrueFight_2(Tar)
--DeBugMSG(0,0,"My Haste List = "..HateListCount( OwnerID()))
	if 	HateListCount( OwnerID())~=0 or
		ReadRoleValue(Tar,EM_RoleValue_IsDead)==1	then
		SetIdleMotion( OwnerID(),ruFUSION_ACTORSTATE_NORMAL)
		return false
	else
		CastSpell(OwnerID() , Tar , 492489 )
	end
end
-----------------------------單手武器戰鬥----------------------------------
Function LuaP_1H_BATTLE()
	MoveToFlagEnabled( OwnerID(), false );
	
	sleep(30)
	Local Battle={}
	Local Motion
	Battle[0] = ruFUSION_ACTORSTATE_PARRY_1H -- 1/5 機率做出格檔動作
	Battle[1] = ruFUSION_ACTORSTATE_ATTACK_1H
	Battle[2] = ruFUSION_ACTORSTATE_ATTACK_1H
	Battle[3] = ruFUSION_ACTORSTATE_ATTACK_1H
	Battle[4] = ruFUSION_ACTORSTATE_ATTACK_1H

	for n = 1 , 2  do
		Local i = rand(4)
		Motion = Battle[i]
		PlayMotion( OwnerID(),Motion )
		sleep(30)
	end

	MoveToFlagEnabled( OwnerID(), True );
end

-------------------------單手武器練刀------------


function Lua_1H_onlyone()
	CastSpell(OwnerID(),OwnerID(),492757)
end

function Lua_set_1hCombat()
	if	ReadRoleValue(OwnerID(), EM_RoleValue_IsAttackMode)==1	then
		AddBuff(OwnerID(),502383,1,1)
		return false
	else
		SetIdleMotion( OwnerID(),ruFUSION_ACTORSTATE_COMBAT_1H)
		return true
	end
end

-------前面中箭---------------------

function Lua_FaceArrow()
	AddBuff(OwnerID(),503165,0,-1)
end

-------背面中箭---------------

function Lua_BackArrow()
	AddBuff(OwnerID(),503219,0,-1)
end

--------------停止回血---------------------
function DW_StopRecovery()
	AddBuff(OwnerID(),502707,1,-1)
end