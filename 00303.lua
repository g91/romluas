function LuaI_110041()
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 )
	SetPlot( OwnerID() , "Touch" , "LuaQ_420296_Summon" , 40 )
	local RFG = CreateObjByFlag( 100195 , 780036 , 2 , 1 ) --代用
	WriteRoleValue( RFG , EM_RoleValue_PID , 2 )
	AddToPartition( RFG , 0 )
end
-------------------------------------------------------------------------------------------------------------
function LuaI_RFG_HIDE() --瑞芬格的消失劇情，進入戰鬥後施法執行
	if CheckAcceptQuest( TargetID() ,420295 ) then --要寫成可以對全隊有任務的人作用
		SetFlag( TargetID() ,540222 ,1)
	end
--	ScriptMessage( OwnerID(), TargetID(), 0, GetString("EM_420296_0"), 2 );
	Say( OwnerID() , GetString("EM_420296_1") ) --/*瑞芬格突然消失在叢林之中。
	Hide( OwnerID() )
	SetStopAttack( OwnerID()  )
	BeginPlot( OwnerID() ,"LuaI_RFG_SHOW" , 0 )
end
-------------------------------------------------------------------------------------------------------------
function LuaI_RFG_SHOW() --瑞芬格的出現劇情
	sleep( 300 )
	local rand = Rand(7) + 2 
	if rand == ReadRoleValue( RFG , EM_RoleValue_PID) then
		if rand == 9 then
			rand = 2
		else
			rand = rand + 1
		end
	end
	SetPosByFlag( OwnerID(), 780036 , rand )
	WriteRoleValue( RFG , EM_RoleValue_PID , rand )
	Show( OwnerID() , 0 )
end
-------------------------------------------------------------------------------------------------------------
function LuaQ_420296_Summon()
	if CheckAcceptQuest( OwnerID() , 420296 ) and ReadRoleValue(TargetID(),Em_RoleValue_PID)==0 then
		if CountBodyItem( OwnerID() , 200744 ) < 5 then
--			ScriptMessage( OwnerID(), TargetID(), 0, GetString("EM_420296_0"), 0 );
			Say( OwnerID() , GetString("EM_420296_0") ) --/*鹿頭首領的頭顱數量不足。
		else
			SetPlot( TargetID() , "Touch" , "LuaFunc_Obj_BUSY" , 40 )
			DelBodyItem( OwnerID() , 200744 , 5 )
			BeginPlot( TargetID() , "LuaQ_420296_ATTACK" , 0)
		end	
	end			
end
-------------------------------------------------------------------------------------------------------------
function LuaQ_420296_ATTACK()
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 777 )
	local Head = CreateObjByFlag( 110261 , 780036 , 0, 1 ) --代用
	local RFG_B= CreateObjByFlag( 100197 , 780036 , 1 , 1 )
	AddToPartition( Head , 0 )
	sleep( 50 )
	AddToPartition( RFG_B, 0 )
--	ScriptMessage( OwnerID(), TargetID(), 0, GetString("EM_420296_0"), 2 );
	Say( OwnerID() , GetString("EM_420296_2") ) --/*瑞芬格發出一聲悲鳴～
	SetPlot( RFG_B , "Dead" , "LuaQ_420296_Dead", 40 )
	BeginPlot( RFG_B , "LuaQ_420296_Sui" , 0 )
	SetAttack( RFG_B, TargetID() )
	while 1 do
		if ReadRoleValue( OwnerID() , EM_RoleValue_PID) == 0 then
			DelObj( Head )
			SetPlot( OwnerID() , "Touch" , "LuaQ_420296_Summon" , 40 )
			break
		else
			sleep( 60 )
		end
	end
		
end
-------------------------------------------------------------------------------------------------------------
function LuaQ_420296_Sui()
	while 1 do
		sleep(1)
		if ReadRoleValue( OwnerID(), EM_RoleValue_AttackTargetID ) ~= 0 then 
			sleep(60)	-- 六秒檢查一次	
		else

			WriteRoleValue( TargetID() , EM_RoleValue_PID , 0 )
			DelObj( OwnerID() )
			break		
		end
	sleep(1)
	end

end
-------------------------------------------------------------------------------------------------------------
function LuaQ_420296_Dead()
	local Stone = LuaFunc_SearchNPCbyOrgID( OwnerID() , 110041 , 500 )
	WriteRoleValue( Stone , EM_RoleValue_PID , 0 )
	if CountBodyItem( TargetID() , 200745  ) == 0 and CheckAcceptQuest( TargetID() , 420296 ) == true then
		GiveBodyItem( TargetID() , 200745 , 1 )
	end
end
-------------------------------------------------------------------------------------------------------------
Function LuaQ_420296_Complete()
	SetPlot( OwnerID() , "touch","LuaFunc_Obj_BUSY" , 40 )
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_BEG ) --蹲下的動作
	local Head = CreateObjByFlag( 110261 , 780036 , 11 , 1 )
	AddToPartition( Head, 0 ) 
	sleep( 30 )
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_BEG ) --蹲下結束的動作
	sleep( 30 )
--	ScriptMessage( OwnerID(), TargetID(), 0, GetString("EM_420296_3"), 0 ); --/*疤眼對瑞芬格的頭顱吐口水。
	Say( OwnerID() , GetString("EM_420296_3") )
	sleep( 5 )
	Say( OwnerID() , GetString("SAY_110272_0") ) --/*哈哈哈～呃～你這傢伙……哇！
	sleep( 5 )
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_HURT_CRITICAL) 
	DelObj(Head)
	local Corpse = CreateObjByFlag( 110272 , 780036 , 11 , 1 )
	SetPlot( Corpse , "touch","LuaFunc_Obj_Nothing" , 40 )
	SetPosture( Corpse, 8 , ruFUSION_ACTORSTATE_DYING );
	AddToPartition( Corpse , 0 )
	sleep( 30 )
	Say( OwnerID() , GetString("SAY_110272_1") ) --/*這是怎麼回事？是妖術嗎？
	sleep( 10 )
	MoveToFlagEnabled( OwnerID(), false );
	WriteRoleValue( OwnerID() ,EM_RoleValue_IsWalk , 0  )
	LuaFunc_MoveToFlag( OwnerID(), 780036 , 12 ,0 )
	Say( OwnerID() , GetString("SAY_110272_2") ) --/*救命啊～
	sleep( 30 )
	SetPosture( OwnerID(), 8 , ruFUSION_ACTORSTATE_DYING );
	sleep( 30 )
--	CastSpell( Corpse , Corpse , xxxxxx ) --瑞芬格出現的特效
	DelObj( Corpse )
	local RFG = LuaFunc_CreateObjByObj ( 100195 , Corpse ) --代用
	SetRoleCamp( RFG , "SNPC" );
	MoveToFlagEnabled( RFG, false );
	WriteRoleValue( RFG ,EM_RoleValue_IsWalk , 1  )
	LuaFunc_MoveToFlag( RFG, 780036 , 12 ,0 )
	sleep( 30 )
	PlayMotion( RFG , ruFUSION_ACTORSTATE_DODGE) 
	sleep( 30 )
	WriteRoleValue( RFG ,EM_RoleValue_IsWalk , 0  )
	LuaFunc_MoveToFlag( RFG, 780036 , 13 ,0 )
	DelObj( RFG )
	Sleep( 50 )
	Hide( OwnerID() )
	SetPosture( OwnerID(), 0 , ruFUSION_ACTORSTATE_REVIVING);
	sleep( 50 )
	SetPlot( OwnerID() , "touch","" , 0 )
	SetPosByFlag( OwnerID(), 780036 , 10 )
	Show( OwnerID() , 0 )
end