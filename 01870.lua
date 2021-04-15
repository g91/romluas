-- ¼t°Ó¦@¥Î¬¡°Ê-©Çª«¥l³ê
--¥l³ê¦Uµ¥¯Å©Çª«
-----------------------------------------------------------------------------------------------------------------------
function Lua_mika_monstersum_move()   ---©Çª«©P³ò²¾°Ê
	local X = ReadRoleValue ( OwnerID(), EM_RoleValue_X)
	local Y = ReadRoleValue ( OwnerID(), EM_RoleValue_Y)
	local Z = ReadRoleValue ( OwnerID(), EM_RoleValue_Z)   ---------³o¨½¬O®»¥XAttackplayer¨½­±ªº¨º­Ó¤Hªº®y¼Ð
	while 1 do
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
		if (  AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- ÀË¬d¬O§_Â÷¶}¾Ô¤æ
			Sleep(10)
		else
			lua_DavisRandMove(OwnerID(),X,Y,Z,50,1)  --50 ¨C¦¸²¾°Ê¶ZÂ÷
			Sleep(50)
		end
	--	Say(OwnerID(), "move")	
	end
end


function Lua_mika_monstersum_lv10born()   -- ¥l³ê©Çª«lv10
	local RoomID = ReadRoleValue(  OwnerID() ,EM_RoleValue_RoomID) 
	local X = ReadRoleValue( OwnerID() , EM_RoleValue_X )
	local Y = ReadRoleValue( OwnerID()  , EM_RoleValue_Y )
	local Z = ReadRoleValue( OwnerID()  , EM_RoleValue_Z )
	local Dir  = ReadRoleValue(OwnerID()  , EM_RoleValue_Dir )
	local BuffA = ReadRoleValue(OwnerID() , EM_RoleValue_Register+1  )
	local BuffB = ReadRoleValue(OwnerID() , EM_RoleValue_Register+2  )
	local treasure = ReadRoleValue(OwnerID() , EM_RoleValue_Register+3  )

	if BuffB == 110 then  --power
		local monsterlv10 = CreateObj( 103925 , X+20 , Y , Z-20 , Dir  , 1 )
		SetModeEx( monsterlv10    , EM_SetModeType_Strikback, true )--¤ÏÀ»
		SetModeEx( monsterlv10    , EM_SetModeType_SearchenemyIgnore, false )--³Q·j´M
		SetModeEx( monsterlv10    , EM_SetModeType_Obstruct, false )--ªý¾×
		SetModeEx( monsterlv10    , EM_SetModeType_Mark, true )--¼Ð°O
		SetModeEx( monsterlv10    , EM_SetModeType_Move, true )--²¾°Ê
		SetModeEx( monsterlv10    , EM_SetModeType_Searchenemy, true )--¯Á¼Ä
		SetModeEx( monsterlv10   , EM_SetModeType_HideName, false )--¦WºÙ
		SetModeEx( monsterlv10 , EM_SetModeType_ShowRoleHead, true )--ÀY¹³®Ø
		SetModeEx( monsterlv10, EM_SetModeType_Fight , true )--¥i¬å±þ§ðÀ»
		AddToPartition(monsterlv10 , RoomID) 
--		SetRandMove( monsterlv10 , 100 ,300,50 )
		BeginPlot(monsterlv10, "Lua_mika_monstersum_move" , 0 )
		Hide(monsterlv10)
		if BuffA == 10 then  --power
			Addbuff( monsterlv10, 506607, 0, -1) --power lv1
		elseif BuffA == 20 then 
			Addbuff( monsterlv10, 506608, 0, -1) --power lv2
		elseif BuffA == 30 then 
			Addbuff( monsterlv10, 506609, 0, -1) --power lv3
		end 
		sleep(10)
		if treasure == 10 then
			SetPlot( monsterlv10 , "dead","Lua_mika_monstersum_lv10trea",0 )  --Ä_½c1
		elseif treasure == 20 then
			SetPlot( monsterlv10 , "dead","Lua_mika_monstersum_lv20trea",0 )  --Ä_½c2
		elseif treasure == 30 then
			SetPlot( monsterlv10 , "dead","Lua_mika_monstersum_lv30trea",0 )  --Ä_½c3
		end
		sleep(10)
		Show( monsterlv10,RoomID )
	elseif BuffB == 120 then 
		local monsterlv102 = CreateObj( 103926 , X+20 , Y , Z-20 , Dir  , 1 )
		SetModeEx( monsterlv102    , EM_SetModeType_Strikback, true )--¤ÏÀ»
		SetModeEx( monsterlv102    , EM_SetModeType_SearchenemyIgnore, false )--³Q·j´M
		SetModeEx( monsterlv102    , EM_SetModeType_Obstruct, false )--ªý¾×
		SetModeEx( monsterlv102    , EM_SetModeType_Mark, true )--¼Ð°O
		SetModeEx( monsterlv102    , EM_SetModeType_Move, true )--²¾°Ê
		SetModeEx( monsterlv102    , EM_SetModeType_Searchenemy, true )--¯Á¼Ä
		SetModeEx( monsterlv102   , EM_SetModeType_HideName, false )--¦WºÙ
		SetModeEx( monsterlv102 , EM_SetModeType_ShowRoleHead, true )--ÀY¹³®Ø
		SetModeEx( monsterlv102, EM_SetModeType_Fight , true )--¥i¬å±þ§ðÀ»
		AddToPartition(monsterlv102 , RoomID) 
	--	SetRandMove( monsterlv102 , 100 ,300,50 )
		BeginPlot(monsterlv102, "Lua_mika_monstersum_move" , 0 )
		Hide(monsterlv102)
		if BuffA == 10 then  --power
			Addbuff( monsterlv102, 506607, 0, -1) --power lv1
		elseif BuffA == 20 then 
			Addbuff( monsterlv102, 506608, 0, -1) --power lv2
		elseif BuffA == 30 then 
			Addbuff( monsterlv102, 506609, 0, -1) --power lv3
		end 
		sleep(10)
		if treasure == 10 then
			SetPlot( monsterlv102 , "dead","Lua_mika_monstersum_lv10trea",0 )  --Ä_½c1
		elseif treasure == 20 then
			SetPlot( monsterlv102 , "dead","Lua_mika_monstersum_lv20trea",0 )  --Ä_½c2
		elseif treasure == 30 then
			SetPlot( monsterlv102 , "dead","Lua_mika_monstersum_lv30trea",0 )  --Ä_½c3
		end
		sleep(10)
		Show( monsterlv102,RoomID )
	elseif BuffB == 130 then 
		local monsterlv103 = CreateObj( 103927 , X+20 , Y , Z-20 , Dir  , 1 )
		SetModeEx( monsterlv103    , EM_SetModeType_Strikback, true )--¤ÏÀ»
		SetModeEx( monsterlv103    , EM_SetModeType_SearchenemyIgnore, false )--³Q·j´M
		SetModeEx( monsterlv103    , EM_SetModeType_Obstruct, false )--ªý¾×
		SetModeEx( monsterlv103    , EM_SetModeType_Mark, true )--¼Ð°O
		SetModeEx( monsterlv103    , EM_SetModeType_Move, true )--²¾°Ê
		SetModeEx( monsterlv103    , EM_SetModeType_Searchenemy, true )--¯Á¼Ä
		SetModeEx( monsterlv103   , EM_SetModeType_HideName, false )--¦WºÙ
		SetModeEx( monsterlv103 , EM_SetModeType_ShowRoleHead, true )--ÀY¹³®Ø
		SetModeEx( monsterlv103, EM_SetModeType_Fight , true )--¥i¬å±þ§ðÀ»
		AddToPartition(monsterlv103 , RoomID) 
--		SetRandMove( monsterlv103 , 100 ,300,50 )
		BeginPlot(monsterlv103, "Lua_mika_monstersum_move" , 0 )
		Hide(monsterlv103)
		if BuffA == 10 then  --power
			Addbuff( monsterlv103, 506607, 0, -1) --power lv1
		elseif BuffA == 20 then 
			Addbuff( monsterlv103, 506608, 0, -1) --power lv2
		elseif BuffA == 30 then 
			Addbuff( monsterlv103, 506609, 0, -1) --power lv3
		end 
		sleep(10)
		if treasure == 10 then
			SetPlot( monsterlv103 , "dead","Lua_mika_monstersum_lv10trea",0 )  --Ä_½c1
		elseif treasure == 20 then
			SetPlot( monsterlv103 , "dead","Lua_mika_monstersum_lv20trea",0 )  --Ä_½c2
		elseif treasure == 30 then
			SetPlot( monsterlv103 , "dead","Lua_mika_monstersum_lv30trea",0 )  --Ä_½c3
		end
		sleep(10)
		Show( monsterlv103,RoomID )
	elseif BuffB == 140 then 
		local monsterlv104 = CreateObj( 103928 , X+20 , Y , Z-20 , Dir  , 1 )
		SetModeEx( monsterlv104    , EM_SetModeType_Strikback, true )--¤ÏÀ»
		SetModeEx( monsterlv104    , EM_SetModeType_SearchenemyIgnore, false )--³Q·j´M
		SetModeEx( monsterlv104    , EM_SetModeType_Obstruct, false )--ªý¾×
		SetModeEx( monsterlv104    , EM_SetModeType_Mark, true )--¼Ð°O
		SetModeEx( monsterlv104    , EM_SetModeType_Move, true )--²¾°Ê
		SetModeEx( monsterlv104    , EM_SetModeType_Searchenemy, true )--¯Á¼Ä
		SetModeEx( monsterlv104   , EM_SetModeType_HideName, false )--¦WºÙ
		SetModeEx( monsterlv104 , EM_SetModeType_ShowRoleHead, true )--ÀY¹³®Ø
		SetModeEx( monsterlv104, EM_SetModeType_Fight , true )--¥i¬å±þ§ðÀ»
		AddToPartition(monsterlv104 , RoomID) 
--		SetRandMove( monsterlv104 , 100 ,300,50 )
		BeginPlot(monsterlv104, "Lua_mika_monstersum_move" , 0 )
		Hide(monsterlv104)
		if BuffA == 10 then  --power
			Addbuff( monsterlv104, 506607, 0, -1) --power lv1
		elseif BuffA == 20 then 
			Addbuff( monsterlv104, 506608, 0, -1) --power lv2
		elseif BuffA == 30 then 
			Addbuff( monsterlv104, 506609, 0, -1) --power lv3
		end 
		sleep(10)
		if treasure == 10 then
			SetPlot( monsterlv104 , "dead","Lua_mika_monstersum_lv10trea",0 )  --Ä_½c1
		elseif treasure == 20 then
			SetPlot( monsterlv104 , "dead","Lua_mika_monstersum_lv20trea",0 )  --Ä_½c2
		elseif treasure == 30 then
			SetPlot( monsterlv104 , "dead","Lua_mika_monstersum_lv30trea",0 )  --Ä_½c3
		end
		sleep(10)
		Show( monsterlv104,RoomID )
	elseif BuffB == 150 then 
		local monsterlv105 = CreateObj( 103929 , X+20 , Y , Z-20 , Dir  , 1 )
		SetModeEx( monsterlv105    , EM_SetModeType_Strikback, true )--¤ÏÀ»
		SetModeEx( monsterlv105    , EM_SetModeType_SearchenemyIgnore, false )--³Q·j´M
		SetModeEx( monsterlv105    , EM_SetModeType_Obstruct, false )--ªý¾×
		SetModeEx( monsterlv105    , EM_SetModeType_Mark, true )--¼Ð°O
		SetModeEx( monsterlv105    , EM_SetModeType_Move, true )--²¾°Ê
		SetModeEx( monsterlv105    , EM_SetModeType_Searchenemy, true )--¯Á¼Ä
		SetModeEx( monsterlv105   , EM_SetModeType_HideName, false )--¦WºÙ
		SetModeEx( monsterlv105 , EM_SetModeType_ShowRoleHead, true )--ÀY¹³®Ø
		SetModeEx( monsterlv105, EM_SetModeType_Fight , true )--¥i¬å±þ§ðÀ»
		AddToPartition(monsterlv105 , RoomID) 
--		SetRandMove( monsterlv105 , 100 ,300,50 )
		BeginPlot(monsterlv105, "Lua_mika_monstersum_move" , 0 )
		Hide(monsterlv105)
		if BuffA == 10 then  --power
			Addbuff( monsterlv105, 506607, 0, -1) --power lv1
		elseif BuffA == 20 then 
			Addbuff( monsterlv105, 506608, 0, -1) --power lv2
		elseif BuffA == 30 then 
			Addbuff( monsterlv105, 506609, 0, -1) --power lv3
		end 
		sleep(10)
		if treasure == 10 then
			SetPlot( monsterlv105 , "dead","Lua_mika_monstersum_lv10trea",0 )  --Ä_½c1
		elseif treasure == 20 then
			SetPlot( monsterlv105 , "dead","Lua_mika_monstersum_lv20trea",0 )  --Ä_½c2
		elseif treasure == 30 then
			SetPlot( monsterlv105 , "dead","Lua_mika_monstersum_lv30trea",0 )  --Ä_½c3
		end
		sleep(10)
		Show( monsterlv105,RoomID )
	elseif BuffB == 160 then 
		local monsterlv106 = CreateObj( 103930 , X+20 , Y , Z-20 , Dir  , 1 )
		SetModeEx( monsterlv106    , EM_SetModeType_Strikback, true )--¤ÏÀ»
		SetModeEx( monsterlv106    , EM_SetModeType_SearchenemyIgnore, false )--³Q·j´M
		SetModeEx( monsterlv106    , EM_SetModeType_Obstruct, false )--ªý¾×
		SetModeEx( monsterlv106    , EM_SetModeType_Mark, true )--¼Ð°O
		SetModeEx( monsterlv106    , EM_SetModeType_Move, true )--²¾°Ê
		SetModeEx( monsterlv106    , EM_SetModeType_Searchenemy, true )--¯Á¼Ä
		SetModeEx( monsterlv106   , EM_SetModeType_HideName, false )--¦WºÙ
		SetModeEx( monsterlv106 , EM_SetModeType_ShowRoleHead, true )--ÀY¹³®Ø
		SetModeEx( monsterlv106, EM_SetModeType_Fight , true )--¥i¬å±þ§ðÀ»
		AddToPartition(monsterlv106 , RoomID) 
--		SetRandMove( monsterlv106 , 100 ,300,50 )
		BeginPlot(monsterlv106, "Lua_mika_monstersum_move" , 0 )
		Hide(monsterlv106)
		if BuffA == 10 then  --power
			Addbuff( monsterlv106, 506607, 0, -1) --power lv1
		elseif BuffA == 20 then 
			Addbuff( monsterlv106, 506608, 0, -1) --power lv2
		elseif BuffA == 30 then 
			Addbuff( monsterlv106, 506609, 0, -1) --power lv3
		end 
		sleep(10)
		if treasure == 10 then
			SetPlot( monsterlv106 , "dead","Lua_mika_monstersum_lv10trea",0 )  --Ä_½c1
		elseif treasure == 20 then
			SetPlot( monsterlv106 , "dead","Lua_mika_monstersum_lv20trea",0 )  --Ä_½c2
		elseif treasure == 30 then
			SetPlot( monsterlv106 , "dead","Lua_mika_monstersum_lv30trea",0 )  --Ä_½c3
		end
		sleep(10)
		Show( monsterlv106,RoomID )
	end 
end

function Lua_mika_monstersum_lv20born()   -- ¥l³ê©Çª«lv20
	local RoomID = ReadRoleValue(  OwnerID() ,EM_RoleValue_RoomID) 
	local X = ReadRoleValue( OwnerID() , EM_RoleValue_X )
	local Y = ReadRoleValue( OwnerID()  , EM_RoleValue_Y )
	local Z = ReadRoleValue( OwnerID()  , EM_RoleValue_Z )
	local Dir  = ReadRoleValue(OwnerID()  , EM_RoleValue_Dir )
	local BuffA = ReadRoleValue(OwnerID() , EM_RoleValue_Register+1  )
	local BuffB = ReadRoleValue(OwnerID() , EM_RoleValue_Register+2  )
	local treasure = ReadRoleValue(OwnerID() , EM_RoleValue_Register+3  )

	if BuffB == 110 then  --power
		local monsterlv20 = CreateObj( 104023 , X+20 , Y , Z-20 , Dir  , 1 )
		SetModeEx( monsterlv20    , EM_SetModeType_Strikback, true )--¤ÏÀ»
		SetModeEx( monsterlv20    , EM_SetModeType_SearchenemyIgnore, false )--³Q·j´M
		SetModeEx( monsterlv20    , EM_SetModeType_Obstruct, false )--ªý¾×
		SetModeEx( monsterlv20    , EM_SetModeType_Mark, true )--¼Ð°O
		SetModeEx( monsterlv20    , EM_SetModeType_Move, true )--²¾°Ê
		SetModeEx( monsterlv20    , EM_SetModeType_Searchenemy, true )--¯Á¼Ä
		SetModeEx( monsterlv20   , EM_SetModeType_HideName, false )--¦WºÙ
		SetModeEx( monsterlv20 , EM_SetModeType_ShowRoleHead, true )--ÀY¹³®Ø
		SetModeEx( monsterlv20, EM_SetModeType_Fight , true )--¥i¬å±þ§ðÀ»
		AddToPartition(monsterlv20 , RoomID) 
--		SetRandMove( monsterlv20 , 100 ,300,50 )
		BeginPlot(monsterlv20, "Lua_mika_monstersum_move" , 0 )
		Hide(monsterlv20)
		if BuffA == 10 then  --power
			Addbuff( monsterlv20, 506607, 0, -1) --power lv1
		elseif BuffA == 20 then 
			Addbuff( monsterlv20, 506608, 0, -1) --power lv2
		elseif BuffA == 30 then 
			Addbuff( monsterlv20, 506609, 0, -1) --power lv3
		end 
		sleep(10)
		if treasure == 10 then
			SetPlot( monsterlv20 , "dead","Lua_mika_monstersum_lv10trea",0 )  --Ä_½c1
		elseif treasure == 20 then
			SetPlot( monsterlv20 , "dead","Lua_mika_monstersum_lv20trea",0 )  --Ä_½c2
		elseif treasure == 30 then
			SetPlot( monsterlv20 , "dead","Lua_mika_monstersum_lv30trea",0 )  --Ä_½c3
		end
		sleep(10)
		Show( monsterlv20,RoomID )
	elseif BuffB == 120 then 
		local monsterlv202 = CreateObj( 104024 , X+20 , Y , Z-20 , Dir  , 1 )
		SetModeEx( monsterlv202    , EM_SetModeType_Strikback, true )--¤ÏÀ»
		SetModeEx( monsterlv202    , EM_SetModeType_SearchenemyIgnore, false )--³Q·j´M
		SetModeEx( monsterlv202    , EM_SetModeType_Obstruct, false )--ªý¾×
		SetModeEx( monsterlv202    , EM_SetModeType_Mark, true )--¼Ð°O
		SetModeEx( monsterlv202    , EM_SetModeType_Move, true )--²¾°Ê
		SetModeEx( monsterlv202    , EM_SetModeType_Searchenemy, true )--¯Á¼Ä
		SetModeEx( monsterlv202   , EM_SetModeType_HideName, false )--¦WºÙ
		SetModeEx( monsterlv202 , EM_SetModeType_ShowRoleHead, true )--ÀY¹³®Ø
		SetModeEx( monsterlv202, EM_SetModeType_Fight , true )--¥i¬å±þ§ðÀ»
		AddToPartition(monsterlv202 , RoomID) 
--		SetRandMove( monsterlv202 , 100 ,300,50 )
		BeginPlot(monsterlv202, "Lua_mika_monstersum_move" , 0 )
		Hide(monsterlv202)
		if BuffA == 10 then  --power
			Addbuff( monsterlv202, 506607, 0, -1) --power lv1
		elseif BuffA == 20 then 
			Addbuff( monsterlv202, 506608, 0, -1) --power lv2
		elseif BuffA == 30 then 
			Addbuff( monsterlv202, 506609, 0, -1) --power lv3
		end 
		sleep(10)
		if treasure == 10 then
			SetPlot( monsterlv202 , "dead","Lua_mika_monstersum_lv10trea",0 )  --Ä_½c1
		elseif treasure == 20 then
			SetPlot( monsterlv202 , "dead","Lua_mika_monstersum_lv20trea",0 )  --Ä_½c2
		elseif treasure == 30 then
			SetPlot( monsterlv202 , "dead","Lua_mika_monstersum_lv30trea",0 )  --Ä_½c3
		end
		sleep(10)
		Show( monsterlv202,RoomID )
	elseif BuffB == 130 then 
		local monsterlv203 = CreateObj( 104025 , X+20 , Y , Z-20 , Dir  , 1 )
		SetModeEx( monsterlv203    , EM_SetModeType_Strikback, true )--¤ÏÀ»
		SetModeEx( monsterlv203    , EM_SetModeType_SearchenemyIgnore, false )--³Q·j´M
		SetModeEx( monsterlv203    , EM_SetModeType_Obstruct, false )--ªý¾×
		SetModeEx( monsterlv203    , EM_SetModeType_Mark, true )--¼Ð°O
		SetModeEx( monsterlv203    , EM_SetModeType_Move, true )--²¾°Ê
		SetModeEx( monsterlv203    , EM_SetModeType_Searchenemy, true )--¯Á¼Ä
		SetModeEx( monsterlv203   , EM_SetModeType_HideName, false )--¦WºÙ
		SetModeEx( monsterlv203 , EM_SetModeType_ShowRoleHead, true )--ÀY¹³®Ø
		SetModeEx( monsterlv203, EM_SetModeType_Fight , true )--¥i¬å±þ§ðÀ»
		AddToPartition(monsterlv203 , RoomID) 
--		SetRandMove( monsterlv203 , 100 ,300,50 )
		BeginPlot(monsterlv203, "Lua_mika_monstersum_move" , 0 )
		Hide(monsterlv203)
		if BuffA == 10 then  --power
			Addbuff( monsterlv203, 506607, 0, -1) --power lv1
		elseif BuffA == 20 then 
			Addbuff( monsterlv203, 506608, 0, -1) --power lv2
		elseif BuffA == 30 then 
			Addbuff( monsterlv203, 506609, 0, -1) --power lv3
		end 
		sleep(10)
		if treasure == 10 then
			SetPlot( monsterlv203 , "dead","Lua_mika_monstersum_lv10trea",0 )  --Ä_½c1
		elseif treasure == 20 then
			SetPlot( monsterlv203 , "dead","Lua_mika_monstersum_lv20trea",0 )  --Ä_½c2
		elseif treasure == 30 then
			SetPlot( monsterlv203 , "dead","Lua_mika_monstersum_lv30trea",0 )  --Ä_½c3
		end
		sleep(10)
		Show( monsterlv203,RoomID )
	elseif BuffB == 140 then 
		local monsterlv204 = CreateObj( 104026 , X+20 , Y , Z-20 , Dir  , 1 )
		SetModeEx( monsterlv204    , EM_SetModeType_Strikback, true )--¤ÏÀ»
		SetModeEx( monsterlv204    , EM_SetModeType_SearchenemyIgnore, false )--³Q·j´M
		SetModeEx( monsterlv204    , EM_SetModeType_Obstruct, false )--ªý¾×
		SetModeEx( monsterlv204    , EM_SetModeType_Mark, true )--¼Ð°O
		SetModeEx( monsterlv204    , EM_SetModeType_Move, true )--²¾°Ê
		SetModeEx( monsterlv204    , EM_SetModeType_Searchenemy, true )--¯Á¼Ä
		SetModeEx( monsterlv204   , EM_SetModeType_HideName, false )--¦WºÙ
		SetModeEx( monsterlv204 , EM_SetModeType_ShowRoleHead, true )--ÀY¹³®Ø
		SetModeEx( monsterlv204, EM_SetModeType_Fight , true )--¥i¬å±þ§ðÀ»
		AddToPartition(monsterlv204 , RoomID) 
--		SetRandMove( monsterlv204 , 100 ,300,50 )
		BeginPlot(monsterlv204, "Lua_mika_monstersum_move" , 0 )
		Hide(monsterlv204)
		if BuffA == 10 then  --power
			Addbuff( monsterlv204, 506607, 0, -1) --power lv1
		elseif BuffA == 20 then 
			Addbuff( monsterlv204, 506608, 0, -1) --power lv2
		elseif BuffA == 30 then 
			Addbuff( monsterlv204, 506609, 0, -1) --power lv3
		end 
		sleep(10)
		if treasure == 10 then
			SetPlot( monsterlv204 , "dead","Lua_mika_monstersum_lv10trea",0 )  --Ä_½c1
		elseif treasure == 20 then
			SetPlot( monsterlv204 , "dead","Lua_mika_monstersum_lv20trea",0 )  --Ä_½c2
		elseif treasure == 30 then
			SetPlot( monsterlv204 , "dead","Lua_mika_monstersum_lv30trea",0 )  --Ä_½c3
		end
		sleep(10)
		Show( monsterlv204,RoomID )
	elseif BuffB == 150 then 
		local monsterlv205 = CreateObj( 104027 , X+20 , Y , Z-20 , Dir  , 1 )
		SetModeEx( monsterlv205    , EM_SetModeType_Strikback, true )--¤ÏÀ»
		SetModeEx( monsterlv205    , EM_SetModeType_SearchenemyIgnore, false )--³Q·j´M
		SetModeEx( monsterlv205    , EM_SetModeType_Obstruct, false )--ªý¾×
		SetModeEx( monsterlv205    , EM_SetModeType_Mark, true )--¼Ð°O
		SetModeEx( monsterlv205    , EM_SetModeType_Move, true )--²¾°Ê
		SetModeEx( monsterlv205    , EM_SetModeType_Searchenemy, true )--¯Á¼Ä
		SetModeEx( monsterlv205   , EM_SetModeType_HideName, false )--¦WºÙ
		SetModeEx( monsterlv205 , EM_SetModeType_ShowRoleHead, true )--ÀY¹³®Ø
		SetModeEx( monsterlv205, EM_SetModeType_Fight , true )--¥i¬å±þ§ðÀ»
		AddToPartition(monsterlv205 , RoomID) 
--		SetRandMove( monsterlv205 , 100 ,300,50 )
		BeginPlot(monsterlv205, "Lua_mika_monstersum_move" , 0 )
		Hide(monsterlv205)
		if BuffA == 10 then  --power
			Addbuff( monsterlv205, 506607, 0, -1) --power lv1
		elseif BuffA == 20 then 
			Addbuff( monsterlv205, 506608, 0, -1) --power lv2
		elseif BuffA == 30 then 
			Addbuff( monsterlv205, 506609, 0, -1) --power lv3
		end 
		sleep(10)
		if treasure == 10 then
			SetPlot( monsterlv205 , "dead","Lua_mika_monstersum_lv10trea",0 )  --Ä_½c1
		elseif treasure == 20 then
			SetPlot( monsterlv205 , "dead","Lua_mika_monstersum_lv20trea",0 )  --Ä_½c2
		elseif treasure == 30 then
			SetPlot( monsterlv205 , "dead","Lua_mika_monstersum_lv30trea",0 )  --Ä_½c3
		end
		sleep(10)
		Show( monsterlv205,RoomID )
	elseif BuffB == 160 then 
		local monsterlv206 = CreateObj( 104028 , X+20 , Y , Z-20 , Dir  , 1 )
		SetModeEx( monsterlv206    , EM_SetModeType_Strikback, true )--¤ÏÀ»
		SetModeEx( monsterlv206    , EM_SetModeType_SearchenemyIgnore, false )--³Q·j´M
		SetModeEx( monsterlv206    , EM_SetModeType_Obstruct, false )--ªý¾×
		SetModeEx( monsterlv206    , EM_SetModeType_Mark, true )--¼Ð°O
		SetModeEx( monsterlv206    , EM_SetModeType_Move, true )--²¾°Ê
		SetModeEx( monsterlv206    , EM_SetModeType_Searchenemy, true )--¯Á¼Ä
		SetModeEx( monsterlv206   , EM_SetModeType_HideName, false )--¦WºÙ
		SetModeEx( monsterlv206 , EM_SetModeType_ShowRoleHead, true )--ÀY¹³®Ø
		SetModeEx( monsterlv206, EM_SetModeType_Fight , true )--¥i¬å±þ§ðÀ»
		AddToPartition(monsterlv206 , RoomID) 
--		SetRandMove( monsterlv206 , 100 ,300,50 )
		BeginPlot(monsterlv206, "Lua_mika_monstersum_move" , 0 )
		Hide(monsterlv206)
		if BuffA == 10 then  --power
			Addbuff( monsterlv206, 506607, 0, -1) --power lv1
		elseif BuffA == 20 then 
			Addbuff( monsterlv206, 506608, 0, -1) --power lv2
		elseif BuffA == 30 then 
			Addbuff( monsterlv206, 506609, 0, -1) --power lv3
		end 
		sleep(10)
		if treasure == 10 then
			SetPlot( monsterlv206 , "dead","Lua_mika_monstersum_lv10trea",0 )  --Ä_½c1
		elseif treasure == 20 then
			SetPlot( monsterlv206 , "dead","Lua_mika_monstersum_lv20trea",0 )  --Ä_½c2
		elseif treasure == 30 then
			SetPlot( monsterlv206 , "dead","Lua_mika_monstersum_lv30trea",0 )  --Ä_½c3
		end
		sleep(10)
		Show( monsterlv206,RoomID )
	end 
end

function Lua_mika_monstersum_lv30born()   -- ¥l³ê©Çª«lv30
	local RoomID = ReadRoleValue(  OwnerID() ,EM_RoleValue_RoomID) 
	local X = ReadRoleValue( OwnerID() , EM_RoleValue_X )
	local Y = ReadRoleValue( OwnerID()  , EM_RoleValue_Y )
	local Z = ReadRoleValue( OwnerID()  , EM_RoleValue_Z )
	local Dir  = ReadRoleValue(OwnerID()  , EM_RoleValue_Dir )
	local BuffA = ReadRoleValue(OwnerID() , EM_RoleValue_Register+1  )
	local BuffB = ReadRoleValue(OwnerID() , EM_RoleValue_Register+2  )
	local treasure = ReadRoleValue(OwnerID() , EM_RoleValue_Register+3  )

	if BuffB == 110 then  --power
		local monsterlv30 = CreateObj( 104029 , X+20 , Y , Z-20 , Dir  , 1 )
		SetModeEx( monsterlv30    , EM_SetModeType_Strikback, true )--¤ÏÀ»
		SetModeEx( monsterlv30    , EM_SetModeType_SearchenemyIgnore, false )--³Q·j´M
		SetModeEx( monsterlv30    , EM_SetModeType_Obstruct, false )--ªý¾×
		SetModeEx( monsterlv30    , EM_SetModeType_Mark, true )--¼Ð°O
		SetModeEx( monsterlv30    , EM_SetModeType_Move, true )--²¾°Ê
		SetModeEx( monsterlv30    , EM_SetModeType_Searchenemy, true )--¯Á¼Ä
		SetModeEx( monsterlv30   , EM_SetModeType_HideName, false )--¦WºÙ
		SetModeEx( monsterlv30 , EM_SetModeType_ShowRoleHead, true )--ÀY¹³®Ø
		SetModeEx( monsterlv30, EM_SetModeType_Fight , true )--¥i¬å±þ§ðÀ»
		AddToPartition(monsterlv30 , RoomID) 
--		SetRandMove( monsterlv30 , 100 ,300,50 )
		BeginPlot(monsterlv30, "Lua_mika_monstersum_move" , 0 )
		Hide(monsterlv30)
		if BuffA == 10 then  --power
			Addbuff( monsterlv30, 506607, 0, -1) --power lv1
		elseif BuffA == 20 then 
			Addbuff( monsterlv30, 506608, 0, -1) --power lv2
		elseif BuffA == 30 then 
			Addbuff( monsterlv30, 506609, 0, -1) --power lv3
		end 
		sleep(10)
		if treasure == 10 then
			SetPlot( monsterlv30 , "dead","Lua_mika_monstersum_lv10trea",0 )  --Ä_½c1
		elseif treasure == 20 then
			SetPlot( monsterlv30 , "dead","Lua_mika_monstersum_lv20trea",0 )  --Ä_½c2
		elseif treasure == 30 then
			SetPlot( monsterlv30 , "dead","Lua_mika_monstersum_lv30trea",0 )  --Ä_½c3
		end
		sleep(10)
		Show( monsterlv30,RoomID )
	elseif BuffB == 120 then 
		local monsterlv302 = CreateObj( 104030 , X+20 , Y , Z-20 , Dir  , 1 )
		SetModeEx( monsterlv302    , EM_SetModeType_Strikback, true )--¤ÏÀ»
		SetModeEx( monsterlv302    , EM_SetModeType_SearchenemyIgnore, false )--³Q·j´M
		SetModeEx( monsterlv302    , EM_SetModeType_Obstruct, false )--ªý¾×
		SetModeEx( monsterlv302    , EM_SetModeType_Mark, true )--¼Ð°O
		SetModeEx( monsterlv302    , EM_SetModeType_Move, true )--²¾°Ê
		SetModeEx( monsterlv302    , EM_SetModeType_Searchenemy, true )--¯Á¼Ä
		SetModeEx( monsterlv302   , EM_SetModeType_HideName, false )--¦WºÙ
		SetModeEx( monsterlv302 , EM_SetModeType_ShowRoleHead, true )--ÀY¹³®Ø
		SetModeEx( monsterlv302, EM_SetModeType_Fight , true )--¥i¬å±þ§ðÀ»
		AddToPartition(monsterlv302 , RoomID) 
--		SetRandMove( monsterlv302 , 100 ,300,50 )
		BeginPlot(monsterlv302, "Lua_mika_monstersum_move" , 0 )
		Hide(monsterlv302)
		if BuffA == 10 then  --power
			Addbuff( monsterlv302, 506607, 0, -1) --power lv1
		elseif BuffA == 20 then 
			Addbuff( monsterlv302, 506608, 0, -1) --power lv2
		elseif BuffA == 30 then 
			Addbuff( monsterlv302, 506609, 0, -1) --power lv3
		end 
		sleep(10)
		if treasure == 10 then
			SetPlot( monsterlv302 , "dead","Lua_mika_monstersum_lv10trea",0 )  --Ä_½c1
		elseif treasure == 20 then
			SetPlot( monsterlv302 , "dead","Lua_mika_monstersum_lv20trea",0 )  --Ä_½c2
		elseif treasure == 30 then
			SetPlot( monsterlv302 , "dead","Lua_mika_monstersum_lv30trea",0 )  --Ä_½c3
		end
		sleep(10)
		Show( monsterlv302,RoomID )
	elseif BuffB == 130 then 
		local monsterlv303 = CreateObj( 104031 , X+20 , Y , Z-20 , Dir  , 1 )
		SetModeEx( monsterlv303    , EM_SetModeType_Strikback, true )--¤ÏÀ»
		SetModeEx( monsterlv303    , EM_SetModeType_SearchenemyIgnore, false )--³Q·j´M
		SetModeEx( monsterlv303    , EM_SetModeType_Obstruct, false )--ªý¾×
		SetModeEx( monsterlv303    , EM_SetModeType_Mark, true )--¼Ð°O
		SetModeEx( monsterlv303    , EM_SetModeType_Move, true )--²¾°Ê
		SetModeEx( monsterlv303    , EM_SetModeType_Searchenemy, true )--¯Á¼Ä
		SetModeEx( monsterlv303   , EM_SetModeType_HideName, false )--¦WºÙ
		SetModeEx( monsterlv303 , EM_SetModeType_ShowRoleHead, true )--ÀY¹³®Ø
		SetModeEx( monsterlv303, EM_SetModeType_Fight , true )--¥i¬å±þ§ðÀ»
		AddToPartition(monsterlv303 , RoomID) 
--		SetRandMove( monsterlv303 , 100 ,300,50 )
		BeginPlot(monsterlv303, "Lua_mika_monstersum_move" , 0 )
		Hide(monsterlv303)
		if BuffA == 10 then  --power
			Addbuff( monsterlv303, 506607, 0, -1) --power lv1
		elseif BuffA == 20 then 
			Addbuff( monsterlv303, 506608, 0, -1) --power lv2
		elseif BuffA == 30 then 
			Addbuff( monsterlv303, 506609, 0, -1) --power lv3
		end 
		sleep(10)
		if treasure == 10 then
			SetPlot( monsterlv303 , "dead","Lua_mika_monstersum_lv10trea",0 )  --Ä_½c1
		elseif treasure == 20 then
			SetPlot( monsterlv303 , "dead","Lua_mika_monstersum_lv20trea",0 )  --Ä_½c2
		elseif treasure == 30 then
			SetPlot( monsterlv303 , "dead","Lua_mika_monstersum_lv30trea",0 )  --Ä_½c3
		end
		sleep(10)
		Show( monsterlv303,RoomID )
	elseif BuffB == 140 then 
		local monsterlv304 = CreateObj( 104032 , X+20 , Y , Z-20 , Dir  , 1 )
		SetModeEx( monsterlv304    , EM_SetModeType_Strikback, true )--¤ÏÀ»
		SetModeEx( monsterlv304    , EM_SetModeType_SearchenemyIgnore, false )--³Q·j´M
		SetModeEx( monsterlv304    , EM_SetModeType_Obstruct, false )--ªý¾×
		SetModeEx( monsterlv304    , EM_SetModeType_Mark, true )--¼Ð°O
		SetModeEx( monsterlv304    , EM_SetModeType_Move, true )--²¾°Ê
		SetModeEx( monsterlv304    , EM_SetModeType_Searchenemy, true )--¯Á¼Ä
		SetModeEx( monsterlv304   , EM_SetModeType_HideName, false )--¦WºÙ
		SetModeEx( monsterlv304 , EM_SetModeType_ShowRoleHead, true )--ÀY¹³®Ø
		SetModeEx( monsterlv304, EM_SetModeType_Fight , true )--¥i¬å±þ§ðÀ»
		AddToPartition(monsterlv304 , RoomID) 
--		SetRandMove( monsterlv304 , 100 ,300,50 )
		BeginPlot(monsterlv304, "Lua_mika_monstersum_move" , 0 )
		Hide(monsterlv304)
		if BuffA == 10 then  --power
			Addbuff( monsterlv304, 506607, 0, -1) --power lv1
		elseif BuffA == 20 then 
			Addbuff( monsterlv304, 506608, 0, -1) --power lv2
		elseif BuffA == 30 then 
			Addbuff( monsterlv304, 506609, 0, -1) --power lv3
		end 
		sleep(10)
		if treasure == 10 then
			SetPlot( monsterlv304 , "dead","Lua_mika_monstersum_lv10trea",0 )  --Ä_½c1
		elseif treasure == 20 then
			SetPlot( monsterlv304 , "dead","Lua_mika_monstersum_lv20trea",0 )  --Ä_½c2
		elseif treasure == 30 then
			SetPlot( monsterlv304 , "dead","Lua_mika_monstersum_lv30trea",0 )  --Ä_½c3
		end
		sleep(10)
		Show( monsterlv304,RoomID )
	elseif BuffB == 150 then 
		local monsterlv305 = CreateObj( 104033 , X+20 , Y , Z-20 , Dir  , 1 )
		SetModeEx( monsterlv305    , EM_SetModeType_Strikback, true )--¤ÏÀ»
		SetModeEx( monsterlv305    , EM_SetModeType_SearchenemyIgnore, false )--³Q·j´M
		SetModeEx( monsterlv305    , EM_SetModeType_Obstruct, false )--ªý¾×
		SetModeEx( monsterlv305    , EM_SetModeType_Mark, true )--¼Ð°O
		SetModeEx( monsterlv305    , EM_SetModeType_Move, true )--²¾°Ê
		SetModeEx( monsterlv305    , EM_SetModeType_Searchenemy, true )--¯Á¼Ä
		SetModeEx( monsterlv305   , EM_SetModeType_HideName, false )--¦WºÙ
		SetModeEx( monsterlv305 , EM_SetModeType_ShowRoleHead, true )--ÀY¹³®Ø
		SetModeEx( monsterlv305, EM_SetModeType_Fight , true )--¥i¬å±þ§ðÀ»
		AddToPartition(monsterlv305 , RoomID) 
--		SetRandMove( monsterlv305 , 100 ,300,50 )
		BeginPlot(monsterlv305, "Lua_mika_monstersum_move" , 0 )
		Hide(monsterlv305)
		if BuffA == 10 then  --power
			Addbuff( monsterlv305, 506607, 0, -1) --power lv1
		elseif BuffA == 20 then 
			Addbuff( monsterlv305, 506608, 0, -1) --power lv2
		elseif BuffA == 30 then 
			Addbuff( monsterlv305, 506609, 0, -1) --power lv3
		end 
		sleep(10)
		if treasure == 10 then
			SetPlot( monsterlv305 , "dead","Lua_mika_monstersum_lv10trea",0 )  --Ä_½c1
		elseif treasure == 20 then
			SetPlot( monsterlv305 , "dead","Lua_mika_monstersum_lv20trea",0 )  --Ä_½c2
		elseif treasure == 30 then
			SetPlot( monsterlv305 , "dead","Lua_mika_monstersum_lv30trea",0 )  --Ä_½c3
		end
		sleep(10)
		Show( monsterlv305,RoomID )
	elseif BuffB == 160 then 
		local monsterlv306 = CreateObj( 104034 , X+20 , Y , Z-20 , Dir  , 1 )
		SetModeEx( monsterlv306    , EM_SetModeType_Strikback, true )--¤ÏÀ»
		SetModeEx( monsterlv306    , EM_SetModeType_SearchenemyIgnore, false )--³Q·j´M
		SetModeEx( monsterlv306    , EM_SetModeType_Obstruct, false )--ªý¾×
		SetModeEx( monsterlv306    , EM_SetModeType_Mark, true )--¼Ð°O
		SetModeEx( monsterlv306    , EM_SetModeType_Move, true )--²¾°Ê
		SetModeEx( monsterlv306    , EM_SetModeType_Searchenemy, true )--¯Á¼Ä
		SetModeEx( monsterlv306   , EM_SetModeType_HideName, false )--¦WºÙ
		SetModeEx( monsterlv306 , EM_SetModeType_ShowRoleHead, true )--ÀY¹³®Ø
		SetModeEx( monsterlv306, EM_SetModeType_Fight , true )--¥i¬å±þ§ðÀ»
		AddToPartition(monsterlv306 , RoomID) 
--		SetRandMove( monsterlv306 , 100 ,300,50 )
		BeginPlot(monsterlv306, "Lua_mika_monstersum_move" , 0 )
		Hide(monsterlv306)
		if BuffA == 10 then  --power
			Addbuff( monsterlv306, 506607, 0, -1) --power lv1
		elseif BuffA == 20 then 
			Addbuff( monsterlv306, 506608, 0, -1) --power lv2
		elseif BuffA == 30 then 
			Addbuff( monsterlv306, 506609, 0, -1) --power lv3
		end 
		sleep(10)
		if treasure == 10 then
			SetPlot( monsterlv306 , "dead","Lua_mika_monstersum_lv10trea",0 )  --Ä_½c1
		elseif treasure == 20 then
			SetPlot( monsterlv306 , "dead","Lua_mika_monstersum_lv20trea",0 )  --Ä_½c2
		elseif treasure == 30 then
			SetPlot( monsterlv306 , "dead","Lua_mika_monstersum_lv30trea",0 )  --Ä_½c3
		end
		sleep(10)
		Show( monsterlv306,RoomID )
	end 
end
