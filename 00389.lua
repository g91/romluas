function LuaI_201167_Check()
	local Target = ReadRoleValue( TargetID() , EM_RoleValue_OrgID)
	if CheckAcceptQuest( OwnerID() , 420458 ) == false or CheckCompleteQuest( OwnerID() , 420458 ) == true then
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_201167_0"), 0 ); --/*任務不符合。
		return false
	elseif CountBodyItem( OwnerID() , 201166 ) >= 1 then
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_201167_1"), 0 ); --/*五隻幼狼在籠子裡騷動著。
		return false
	end
	if CheckID( TargetID() ) == false or TargetID() == OwnerID() then
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_201167_2"), 0 ); --/*你沒有目標。
		return false
	else
		if Target ~= 100458 then 
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_201167_3"), 0 ); --/*目標錯誤。
			return false	
		elseif ReadRoleValue( TargetID() , EM_RoleValue_AttackTargetID ) ~= OwnerID() then
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_201167_4"), 0 ); --/*你必須先讓幼狼攻擊你，才能誘捕牠。
			return false
		else
			return true
		end
	end
end

function LuaC_201167_Effect()
	if  Rand(20) > 10 then
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_201167_5"), 0 ); --/*唉呀！差一點就抓到了！
	else
		BeginPlot(TargetID() , "LuaI_201167_Reset" , 0 )
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_201167_6"), 0 ); --/*你成功地抓到了一隻幼狼！
		GiveBodyItem(OwnerID() ,201166 , 1 )
	end	
end
function LuaI_201167_Reset()
	LuaFunc_ResetObj( OwnerID() )	
end

function LuaQ_420459_AfterClick()
	if rand( 100 ) < 35 then
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_420459_1"), 0 ); 
		local Goblin = LuaFunc_CreateObjByObj ( 100107 , TargetID() )
		SetAttack( Goblin , OwnerID() )
		BeginPlot(Goblin,"LuaQ_420459_Sui",0)
		return 1
	else
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_420459_2"), 0 ); --/*你把箱子拆了開來，但什麼也沒發現。
		BeginPlot( TargetID() , "LuaQ_420459_AfterClick_Reset" , 0 )
		return -1
	end
end

function LuaQ_420459_AfterClick_Reset()
	LuaFunc_ResetObj( OwnerID() )
end

function LuaQ_420459_Sui() 
	LuaFunc_Obj_Suicide(10)
end

function LuaI_110384_0()
	local i = rand(3)
	if i == 1 then
		PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_SIT_BEGIN,ruFUSION_ACTORSTATE_SIT_LOOP)
	elseif i == 2 then 
		PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_CROUCH_BEGIN,ruFUSION_ACTORSTATE_CROUCH_LOOP)
	end
	sleep(30)
	SetPlot( OwnerID() , "touch" , "LuaI_110384_1" , 40 )
end

function LuaI_110384_1()
	
	BeginPlot( TargetID() , "LuaI_110384_2" , 0 )
end

function LuaI_110384_2()
	MoveToFlagEnabled( OwnerID(), false )
	local i = Rand( 6 )
	if i == 0 then
		Say( OwnerID() , GetString("SAY_420459_1") ) 
	elseif i == 1 then
		Say( OwnerID() , GetString("SAY_420459_2") ) 
	elseif i == 2 then
		Say( OwnerID() , GetString("SAY_420459_3") ) 
	elseif i == 3 then
		Say( OwnerID() , GetString("SAY_420459_4") ) 
	elseif i == 4 then
		Say( OwnerID() , GetString("SAY_420459_5") ) 
	elseif i == 5 then
		Say( OwnerID() , GetString("SAY_420459_6") ) 
	else 
		Say( OwnerID() , GetString("SAY_420459_0") ) 
	end
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep( 30 )
	MoveToFlagEnabled( OwnerID(), true )
end