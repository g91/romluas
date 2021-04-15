function LuaI_103_ControlTable()
	SetPlot( OwnerID() , "touch" , "LuaI_103_Transport" , 40);
end

function LuaI_103_Transport()
	if CheckAcceptQuest( OwnerID() , 420560 ) == true or CheckCompleteQuest( OwnerID() , 420560 ) == true then
		BeginPlot( TargetID(), "Enter_103_PlayMotion" , 0);
	else
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_103_TRANSPORT_1") , 0 )
	end
end

function Enter_103_PlayMotion()
		local SandGlass = LuaFunc_SearchNPCbyOrgID( TargetID() , 110367 , 300 )
		PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP )
		PlayMotionEX( SandGlass, ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP )
		sleep(10)
		SetPlot( SandGlass , "range" , "Enter_103_Transport" , 203 )
		SetPlot( OwnerID() , "touch" , "" , 0 )
		sleep( 300 )
		PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_ACTIVATE_END )
		PlayMotion( SandGlass, ruFUSION_ACTORSTATE_ACTIVATE_END )
		SetPlot( SandGlass , "range" , "" , 0 )
		SetPlot( OwnerID() , "touch" , "LuaI_103_Transport" , 40 )
--		SAY( OwnerID() ,"reset" )
end

function Enter_103_Transport()
		local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					--取得玩家等級
		local PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				--取得玩家副職等級
	if PlayerLV <= 40 then
			AddBuff( OwnerID() ,502042,1 ,1200);							--加入計時
	end
	sleep(5)
	CastSpell( OwnerID() , OwnerID() , 491008 )
	sleep(5)
	CastSpell( OwnerID(), OwnerID(), 490102 );
	sleep(5)
	if ChangeZone( OwnerID() , 104, -1, 568, 983, 1785, 359) then

		DesignLog(OwnerID(),104,"last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)	--紀錄進入人次
	else
		ScriptMessage( OwnerID(), OwnerID(), 0, "[WARRING_ZONE_NOT_OPEN]", 0 );
	end
	CancelBuff( OwnerID(), 500902 );
	sleep(5)
end

Function LuaI_Activating_SandGlass()
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP )
	sleep(40)
	SetPlot( OwnerID() , "range" , "LuaFunc_TransPort_Zone5A", 203 )
end

function LuaI_TransPort_Zone5A()
	SetPlot( OwnerID() , "Collision" , "LuaFunc_TransPort_Zone5A" , 0);	
end
function LuaFunc_TransPort_Zone5A()
	CastSpell( OwnerID() , OwnerID() , 491008 )
	sleep(5)
	CastSpell( OwnerID(), OwnerID(), 490102 );
	sleep(5)
	ChangeZone( OwnerID() , 5 , 0 , -13668, 1849, -12341 , 283 );
	CancelBuff( OwnerID(), 500902 );
	sleep(5)
end
