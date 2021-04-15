function LuaS_423200_accept()
	DisableQuest(OwnerID(),true)
	AddBuff(TargetID(),506733,1,-1)				----�W�t��BUFF
	local mo = Lua_DW_CreateObj("obj",115479,OwnerID())   --mo���H
	DisableQuest( mo , true )
	sleep(10)	
	MoveToFlagEnabled(mo,false)
	AdjustFaceDir( mo ,TargetID(), 0 )
	sleep(10)
	WriteRoleValue(mo , EM_RoleValue_IsWalk, 0 )		---�ζ]��
	Yell(mo,"[SC_423200_0]",3)
	sleep(20)
	DW_MoveToFlag(mo,780653 , 23,0 ,1)
	DW_MoveToFlag(mo,780653 , 24,0 ,1)
	delobj(mo)	
	sleep(20)	
	CancelBuff( TargetID()  , 506733  ) 	--
	DisableQuest(OwnerID(),false)	
end

function LuaS_115455_range()					----�d��@��
	SetPlot(OwnerID() , "range","LuaS_423200_check",150)
end

function LuaS_423200_check()
	if 	CheckAcceptQuest( OwnerID() , 423200 ) == true	and	----����423194
		CheckFlag( OwnerID() , 544003) == false	then	----�S������flag
		BeginPlot(TargetID(),"LuaS_423200_1",1)		
	end 
end
function LuaS_423200_1()
	SetPlot(OwnerID() , "range","",0)				-----�����d��@��		
	WriteRoleValue( OwnerID() , EM_RoleValue_Register + 1 , 0 )		----+1�Ω�Ǫ����`��
	
	Local jill =    Lua_DW_CreateObj("flag" ,103896,780653,1)			----�إX�N��,�ҫk,����J�ó]�w��visitor
	Local lb =    Lua_DW_CreateObj("flag" ,103897,780653,2)	
	Local mo =    Lua_DW_CreateObj("flag" ,103911,780653,3)
	SetRoleCamp( jill , "Visitor" )	
	SetRoleCamp( lb , "Visitor" )	
	SetRoleCamp( mo , "Visitor" )	
	MoveToFlagEnabled(mo,false)
	MoveToFlagEnabled(jill,false)
	MoveToFlagEnabled(lb,false)
	local hand = {}									----�]�w�u�z����

	for i = 0 , 7 , 1 do
		hand[i] =  Lua_DW_CreateObj("flag" ,103905,780653,i+4)				----�إX

		SetPlot(hand[i] , "Dead","LuaS_115458_dead_2",100)				----���`�@��
		DelFromPartition(hand[i])
		SetRoleCamp(hand[i],"Visitor")						----�]�w��visitor
		AddToPartition(hand[i],ReadRoleValue(TargetID(),EM_RoleValue_RoomID))
		SetIdleMotion( hand[i],ruFUSION_ACTORSTATE_COMBAT_UNARMED)		----�԰�����	
		MoveToFlagEnabled(hand[i],false)						----
	end

	sleep(20)
	for i = 0 , 7 , 1 do									----�����ζ]��
		WriteRoleValue(hand[i] , EM_RoleValue_IsWalk, 0 )
	end
	Yell(jill,"[SC_423200_1]",3)	
	SetIdleMotion( jill ,ruFUSION_ACTORSTATE_COMBAT_UNARMED)
	SetIdleMotion( mo ,ruFUSION_ACTORSTATE_COMBAT_UNARMED)	
	SetIdleMotion( lb ,ruFUSION_ACTORSTATE_COMBAT_UNARMED)
	sleep(20)
	for i = 0 , 7 , 1 do									----�u�z����]�V�T�w�I�B����T�H
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
	SetRoleCamp( jill , "SNPC" )				----�]�w���Ĺ�}��
	SetRoleCamp( lb , "SNPC" )	
	SetRoleCamp( mo , "SNPC" )	
	for i = 0 , 7 , 1 do					----�u�z����]�w���Ǫ��}��B�����T�H
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

	while ReadRoleValue(OwnerID() , EM_RoleValue_Register + 1  ) < 8 do		---�Ǫ����`�ƨ�8�h���\�ήɶ���60��Y����

		player = 	SearchRangePlayer ( mo , 400 )			----�P��L���a�ήɶ���60�Y����
		playernum = 0
		for i = 0 , table.getn(Player) do
			if	abs(ReadRoleValue (mo , EM_RoleValue_Y) - ReadRoleValue ( player[i], EM_RoleValue_Y)) < 100 	then
				playernum = playernum+1
			end
		end	
		if	playernum == 0	or	count > time	then
			WriteRoleValue( OwnerID() , EM_RoleValue_Register + 1 , 0 )	---���`���k0
			delobj(jill)				----�T�H�R��
			delobj(lb)
			delobj(mo)
			for i = 0 , 7 , 1 do			----�u�z����R��
				delobj(hand[i] )
			end	
			SetPlot(OwnerID() , "range","LuaS_423200_check",150)	----�}�ҽd��@��
			return
		else

		end
		sleep(10)
		count = count +1
	end
	PlayMotion( lb ,ruFUSION_ACTORSTATE_CROUCH_BEGIN)	   --LB���U		
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
	CastSpell(jill,jill,495668)			----JILL��k�N�k��
	AdjustFaceDir( mo ,jill, 0 )		
	sleep(15)
	local x = ReadRoleValue ( jill, EM_RoleValue_X)
	local y = ReadRoleValue ( jill, EM_RoleValue_Y)
	local z = ReadRoleValue ( jill, EM_RoleValue_Z)
	delobj(jill)
	delobj(lb)
	sleep(5)

	Move(mo,x,y,z)					----����J�]��JILL��Ӫ���m
	
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

	local Player2 = SearchRangePlayer ( OwnerID() , 300 )			----���񦳺t��BUFF�����a�����X��
	for i = 0 , table.getn(Player2) do
		if	CheckBuff(player2[i] , 506734) == true	and	CheckAcceptQuest ( Player2[i]   , 423200 )	 == true	then
			SetFlag(player2[i],544003,1)	--give mission flag
		end
	end	

	local Player4 = SearchRangePlayer ( OwnerID() , 15000 )			----�����Ҧ����a���t��BUFF
	for i = 0 , table.getn(Player4) do
		if	CheckBuff(player4[i] , 506734) == true	then
			CancelBuff( player4[i]  , 506734  ) 	--
		end
	end

	WriteRoleValue( OwnerID() , EM_RoleValue_Register + 1 , 0 )		----���`���k0
	SetPlot(OwnerID() , "range","LuaS_423200_check",150)			----�}�ҽd��@��
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
	if 	CheckAcceptQuest( OwnerID() , 423200 ) == true	and	----����423194
		CheckFlag( OwnerID() , 544003) == true	then	----������flag
			tell(OwnerID()  ,TargetID()  , "[SC_423200_8]")			
	end 
end


function LuaS_423200_complete()
	AddBuff(TargetID(),506733,1,-1)				----�W�t��BUFF
	Local liba =    Lua_DW_CreateObj("flag" ,115430,780653,21)
	local mo = Lua_DW_CreateObj("obj",115479,OwnerID())   --mo���H
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