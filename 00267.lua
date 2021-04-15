function LuaI_420233()
	SetPlot(OwnerID(),"Range","LuaI_420233_1",50)
end
function LuaI_420233_1()
	BeginPlot(TargetID(),"LuaQ_420233",0)
end
function LuaQ_420233() --這個實際上要放開啟門的物件上，觸碰劇情，在開啟門的時候判斷

	local Baecy = LuaFunc_SearchNPCbyOrgID( OwnerID() , 110122 , 5000 )	
	if ReadRoleValue( Baecy , EM_RoleValue_PID) == 5000  then
		SetPlot( OwnerID(),"Range","",0 ) 
		BeginPlot( Baecy , "LuaQ_420233_0" , 0 ) 
	end
	-- !! 這裡要插開門的劇情 !! ------
	sleep( 20 )

end
--------------------------------------------------------------------------------------------------------------
function LuaQ_420233_0()
	
	sleep( 50 )	
	SetPosByFlag( OwnerID(), 780027 , 1 )	
	LuaFunc_MoveToFlag( OwnerID(), 780027 , 2 ,0 )	
	Hide( OwnerID() )
	sleep( 30 )

	local TrueBaecy = CreatObjbyObj( 110132 ,OwnerID(),1 )
	SetPlot( TrueBaecy,"touch","LuaFunc_Obj_BUSY",40 ) 
	local MobA = LuaFunc_SearchNPCbyOrgID( OwnerID() , 100049 , 500 )--代100261
	local MobB = LuaFunc_SearchNPCbyOrgID( OwnerID() , 100050, 500 )--代100262
--	CastSpell( TrueBaecy , MobA, 123456 )	
	NPCDead( MobA, TrueBaecy )
--	CastSpell( TrueBaecy , MobB , 123456 )
	NPCDead( MobB, TrueBaecy )

	sleep( 30 )	
	local Saerlohas = CreateObjByFlag( 100119 , 780027 , 3 , 1 )--代100260
	AddToPartition( Saerlohas,ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) )
	SetRoleCamp( Saerlohas , "Visitor" ) --別讓玩家給他秒了

	Say( Searlohas , GetString("SAY_100260_Q1_1") ) --/*我還在想怎麼找不到那次戰爭後留下的守護者之心......原來如此，那個守護者最後還是存活下來了啊......
	FaceObj( TrueBaecy , Saerlohas )
	sleep( 30 )
	Say( TrueBaecy , GetString("SAY_110132_1") ) --/*魔族，吾所背負之責乃消滅汝等黑暗之力，直至末日。	
	sleep( 30 )
	Say( Searlohas , GetString("SAY_100260_Q1_2") ) --/*很好，讓未完的戰爭繼續吧！
	sleep( 30 )
	local Mob1 = CreateObjByFlag( 100261 , 780027 , 4 , 1 )
	AddToPartition( Mob1,ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ))
	SetRoleCamp( Mob1 , "Visitor" ) 
	local Mob2 = CreateObjByFlag( 100262 , 780027, 5 , 1 )
	AddToPartition( Mob2,ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ))
	SetRoleCamp( Mob2 , "Visitor" )

	SetRoleCamp( Mob1 , "Monster" )
	SetRoleCamp( Mob2 ,"Monster" )

	WriteRoleValue( Searlohas , EM_RoleValue_PID, 20 )
	WriteRoleValue( TrueBaecy , EM_RoleValue_PID, 20 )
	BeginPlot( Searlohas , " LauQ_420233_1", 0 )
	BeginPlot( TrueBaecy , " LauQ_420233_2", 0 )
	SetAttack( Searlohas , TrueBaecy )

	while 1 do
		sleep( 60 )
		if CheckID(Mob1) == False and CheckID(Mob2) == False then
			WriteRoleValue( Saerlohas , EM_RoleValue_PID, 0 )
			WriteRoleValue( TrueBaecy , EM_RoleValue_PID, 0 )
			break
		end
	end
		
end
----------------------------------------------------------------------------------------------------------------
function LauQ_420233_1()

	local TrueBaecy = LuaFunc_SearchNPCbyOrgID( OwnerID() , 110132 , 300 )
	while 1 do
		sleep( 60 )
		if ReadRoleValue( OwnerID() , EM_RoleValue_PID ) == 0 then
			break
		end
	end

--	CastSpell( TrueBaecy, OwnerID() , 123456 )
	sleep( 50 )
	Say( OwnerID() , GetString("SAY_100260_Q1_3") ) --/*咳咳！這個傷……看來是沒辦法戰鬥了……
	sleep( 30 )
--	CastSpell( OwnerID() , OwnerID() , 234567 )
	sleep( 20 )
	Delobj(OwnerID)

end
----------------------------------------------------------------------------------------------------------------
function LauQ_420233_2()

	local Saerlohas = LuaFunc_SearchNPCbyOrgID( OwnerID() , 100119 , 300 )--代100260
	while 1 do
		sleep( 60 )
		if ReadRoleValue( OwnerID() , EM_RoleValue_PID ) == 0 then
			break
		end
	end

--	CastSpell( Saerlohas, OwnerID() , 123456 )
	sleep( 50 )
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_DYING)
	sleep( 100 )
	SetPlot( TrueBaecy , "touch" , "" , 0 )

end
---------------------------------------------------------------------------------------------------------------
function LuaQ_420231_Complete()

	if ReadRoleValue( OwnerID() , EM_RoleValue_PID ) ~= 5000 then
		CastSpell( OwnerID(), OwnerID(), 490102 )	 --讓貝絲發光
	end
	WriteRoleValue( OwnerID() , EM_RoleValue_PID, 5000 ) --只要有被完成任務，就會觸發劇情

end