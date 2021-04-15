function LuaS_423200_accept()
	DisableQuest(OwnerID(),true)
	AddBuff(TargetID(),506733,1,-1)				----上演戲BUFF
	local mo = Lua_DW_CreateObj("obj",115479,OwnerID())   --mo假人
	DisableQuest( mo , true )
	sleep(10)	
	MoveToFlagEnabled(mo,false)
	AdjustFaceDir( mo ,TargetID(), 0 )
	sleep(10)
	WriteRoleValue(mo , EM_RoleValue_IsWalk, 0 )		---用跑的
	Yell(mo,"[SC_423200_0]",3)
	sleep(20)
	DW_MoveToFlag(mo,780653 , 23,0 ,1)
	DW_MoveToFlag(mo,780653 , 24,0 ,1)
	delobj(mo)	
	sleep(20)	
	CancelBuff( TargetID()  , 506733  ) 	--
	DisableQuest(OwnerID(),false)	
end

function LuaS_115455_range()					----範圍劇情
	SetPlot(OwnerID() , "range","LuaS_423200_check",150)
end

function LuaS_423200_check()
	if 	CheckAcceptQuest( OwnerID() , 423200 ) == true	and	----有接423194
		CheckFlag( OwnerID() , 544003) == false	then	----沒有任務flag
		BeginPlot(TargetID(),"LuaS_423200_1",1)		
	end 
end
function LuaS_423200_1()
	SetPlot(OwnerID() , "range","",0)				-----取消範圍劇情		
	WriteRoleValue( OwnerID() , EM_RoleValue_Register + 1 , 0 )		----+1用於怪物死亡數
	
	Local jill =    Lua_DW_CreateObj("flag" ,103896,780653,1)			----種出吉兒,勞勃,摩瑞克並設定為visitor
	Local lb =    Lua_DW_CreateObj("flag" ,103897,780653,2)	
	Local mo =    Lua_DW_CreateObj("flag" ,103911,780653,3)
	SetRoleCamp( jill , "Visitor" )	
	SetRoleCamp( lb , "Visitor" )	
	SetRoleCamp( mo , "Visitor" )	
	MoveToFlagEnabled(mo,false)
	MoveToFlagEnabled(jill,false)
	MoveToFlagEnabled(lb,false)
	local hand = {}									----設定真理之手

	for i = 0 , 7 , 1 do
		hand[i] =  Lua_DW_CreateObj("flag" ,103905,780653,i+4)				----種出

		SetPlot(hand[i] , "Dead","LuaS_115458_dead_2",100)				----死亡劇情
		DelFromPartition(hand[i])
		SetRoleCamp(hand[i],"Visitor")						----設定為visitor
		AddToPartition(hand[i],ReadRoleValue(TargetID(),EM_RoleValue_RoomID))
		SetIdleMotion( hand[i],ruFUSION_ACTORSTATE_COMBAT_UNARMED)		----戰鬥姿勢	
		MoveToFlagEnabled(hand[i],false)						----
	end

	sleep(20)
	for i = 0 , 7 , 1 do									----全不用跑的
		WriteRoleValue(hand[i] , EM_RoleValue_IsWalk, 0 )
	end
	Yell(jill,"[SC_423200_1]",3)	
	SetIdleMotion( jill ,ruFUSION_ACTORSTATE_COMBAT_UNARMED)
	SetIdleMotion( mo ,ruFUSION_ACTORSTATE_COMBAT_UNARMED)	
	SetIdleMotion( lb ,ruFUSION_ACTORSTATE_COMBAT_UNARMED)
	sleep(20)
	for i = 0 , 7 , 1 do									----真理之手跑向固定點且面對三人
		local x = GetMoveFlagValue( 780653 , i+12 , EM_RoleValue_X )
		local y = GetMoveFlagValue( 780653 , i+12 , EM_RoleValue_Y )
		local z = GetMoveFlagValue(780653 , i+12 , EM_RoleValue_Z )
		if i < 3 then
			Callplot(hand[i],"LuaS_MK_moveface",x,y,z,jill)		
		else	
			if i < 6 then
				Callplot(hand[i],"LuaS_MK_moveface",x,y,z,lb)	
			else
				Callplot(hand[i],"LuaS_MK_moveface",x,y,z,mo)			
			end		
		end

	end
	sleep(30)	

	--AdjustFaceDir( mo ,TargetID(), 0 )
	--sleep(10)
	Yell(mo,"[SC_423200_2]",3)	
	sleep(30)
	SetRoleCamp( jill , "SNPC" )				----設定為敵對陣營
	SetRoleCamp( lb , "SNPC" )	
	SetRoleCamp( mo , "SNPC" )	
	for i = 0 , 7 , 1 do					----真理之手設定為怪物陣營且攻擊三人
		DelFromPartition(hand[i])
		SetRoleCamp(hand[i],"Monster")
		AddToPartition(hand[i],ReadRoleValue(TargetID(),EM_RoleValue_RoomID))

		--SetCursorType(hand[i],12)
		if i < 3 then
			SetAttack(hand[i],jill)	
		else	
			if i < 6 then
			SetAttack(hand[i],lb)
			else
			SetAttack(hand[i],mo)		
			end		
		end
	end

	local player	
	local time = 60
	local count = 0	
	local playernum 

	while ReadRoleValue(OwnerID() , EM_RoleValue_Register + 1  ) < 8 do		---怪物死亡數到8則成功或時間到60秒即失敗

		player = 	SearchRangePlayer ( mo , 400 )			----周圍無玩家或時間到60即停止
		playernum = 0
		for i = 0 , table.getn(Player) do
			if	abs(ReadRoleValue (mo , EM_RoleValue_Y) - ReadRoleValue ( player[i], EM_RoleValue_Y)) < 100 	then
				playernum = playernum+1
			end
		end	
		if	playernum == 0	or	count > time	then
			WriteRoleValue( OwnerID() , EM_RoleValue_Register + 1 , 0 )	---死亡數歸0
			delobj(jill)				----三人刪除
			delobj(lb)
			delobj(mo)
			for i = 0 , 7 , 1 do			----真理之手刪除
				delobj(hand[i] )
			end	
			SetPlot(OwnerID() , "range","LuaS_423200_check",150)	----開啟範圍劇情
			return
		else

		end
		sleep(10)
		count = count +1
	end
	PlayMotion( lb ,ruFUSION_ACTORSTATE_CROUCH_BEGIN)	   --LB跪下		
	sleep(15)
	PlayMotion( lb ,ruFUSION_ACTORSTATE_CROUCH_END)	
	sleep(10)
	AdjustFaceDir( lb ,jill, 0 )		
	Yell(lb,"[SC_423200_3]",3)	
	sleep(30)	
	AdjustFaceDir( jill , lb , 0 )	
	Yell(jill,"[SC_423200_4]",3)	
	sleep(20)	
	Yell(mo,"[SC_423200_5]",3)	
	AdjustFaceDir( mo ,lb, 0 )	
	sleep(20)	
	Yell(jill,"[SC_423200_6]",3)	
	AdjustFaceDir( jill ,lb, 0 )
	CastSpell(jill,jill,495668)			----JILL放法術逃離
	AdjustFaceDir( mo ,jill, 0 )		
	sleep(15)
	local x = ReadRoleValue ( jill, EM_RoleValue_X)
	local y = ReadRoleValue ( jill, EM_RoleValue_Y)
	local z = ReadRoleValue ( jill, EM_RoleValue_Z)
	delobj(jill)
	delobj(lb)
	sleep(5)

	Move(mo,x,y,z)					----摩瑞克跑到JILL原來的位置
	
	sleep(30)
	Yell(mo,"[SC_423200_7]",3)	
	AdjustFaceDir( mo ,TargetID(), 0 )	
	sleep(30)
	DW_MoveToFlag(mo,780653 , 20,0 ,1)


	delobj(jill)
	delobj(lb)
	delobj(mo)
	for i = 0 , 7 , 1 do
		delobj(hand[i] )
	end	

	local Player2 = SearchRangePlayer ( OwnerID() , 300 )			----附近有演戲BUFF的玩家給予旗標
	for i = 0 , table.getn(Player2) do
		if	CheckBuff(player2[i] , 506734) == true	and	CheckAcceptQuest ( Player2[i]   , 423200 )	 == true	then
			SetFlag(player2[i],544003,1)	--give mission flag
		end
	end	

	local Player4 = SearchRangePlayer ( OwnerID() , 15000 )			----消除所有玩家的演戲BUFF
	for i = 0 , table.getn(Player4) do
		if	CheckBuff(player4[i] , 506734) == true	then
			CancelBuff( player4[i]  , 506734  ) 	--
		end
	end

	WriteRoleValue( OwnerID() , EM_RoleValue_Register + 1 , 0 )		----死亡數歸0
	SetPlot(OwnerID() , "range","LuaS_423200_check",150)			----開啟範圍劇情
	return
end

function LuaS_115458_dead()

	SetPlot(OwnerID() , "Dead","LuaS_115458_dead_2",100)
end

function LuaS_115458_dead_2()
	local ball =  LuaFunc_SearchNPCbyOrgID( OwnerID() ,115455 , 10000 , 0)
	local Player 
	for i=0, HateListCount( OwnerID() )-1 do
		Player = HateListInfo(OwnerID() , i , EM_HateListInfoType_GItemID )
		if	CheckAcceptQuest ( Player   , 423200 )	 == true	and
			GetDistance(OwnerID(),player) < 200	then
			AddBuff(player,506734,1,-1)
		end	
	end
	SetStopAttack( OwnerID() )
	SetRoleCamp( OwnerID() , "Visitor" )	
	PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_ACTIVATE_BEGIN)	   
	WriteRoleValue( ball , EM_RoleValue_Register + 1 ,  ReadRoleValue(ball , EM_RoleValue_Register + 1  ) +1 )	
	return false
end

function LuaS_115437_range()
	SetPlot(OwnerID() , "range","LuaS_115437_range_2",100)
end

function LuaS_115437_range_2()
	if 	CheckAcceptQuest( OwnerID() , 423200 ) == true	and	----有接423194
		CheckFlag( OwnerID() , 544003) == true	then	----有任務flag
			tell(OwnerID()  ,TargetID()  , "[SC_423200_8]")			
	end 
end


function LuaS_423200_complete()
	AddBuff(TargetID(),506733,1,-1)				----上演戲BUFF
	Local liba =    Lua_DW_CreateObj("flag" ,115430,780653,21)
	local mo = Lua_DW_CreateObj("obj",115479,OwnerID())   --mo假人
	DisableQuest( mo , true )
	DisableQuest( liba , true )
	MoveToFlagEnabled(mo,false)
	MoveToFlagEnabled(liba,false)
	Yell(liba,"[SC_423200_9]",3)
	DW_MoveToFlag(liba,780653 , 22,0 ,1)
	Yell(mo,"[SC_423200_10]",3)
	AdjustFaceDir( mo ,liba, 0 )	
	sleep(30)	
	Yell(liba,"[SC_423200_11]",3)
	sleep(20)
	DW_MoveToFlag(liba,780653 , 21,0 ,1)	
	sleep(20)
	delobj(mo)
	delobj(liba)
	CancelBuff( TargetID()  , 506733  ) 	--

end
-------
function LuaI_115450_0()
	SetModeEX( OwnerID() , EM_SetModeType_ShowRoleHead , false )	
	SetCursorType( OwnerID() , 37)
	AddBuff( OwnerID() , 576977 , 1 , -1 )	
end