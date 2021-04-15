--¼t°Ó¦@¦P¬¡°Ê-¥l³ê©Ç (LV40-60)

function Lua_mika_monstersum_lv40born()   -- ¥l³ê©Çª«lv40
	local RoomID = ReadRoleValue(  OwnerID() ,EM_RoleValue_RoomID) 
	local X = ReadRoleValue( OwnerID() , EM_RoleValue_X )
	local Y = ReadRoleValue( OwnerID()  , EM_RoleValue_Y )
	local Z = ReadRoleValue( OwnerID()  , EM_RoleValue_Z )
	local Dir  = ReadRoleValue(OwnerID()  , EM_RoleValue_Dir )
	local BuffA = ReadRoleValue(OwnerID() , EM_RoleValue_Register+1  )
	local BuffB = ReadRoleValue(OwnerID() , EM_RoleValue_Register+2  )
	local treasure = ReadRoleValue(OwnerID() , EM_RoleValue_Register+3  )
	if BuffB == 110 then  --power
		local monsterlv40 = CreateObj( 104017 , X+20 , Y , Z-20 , Dir  , 1 )
		SetModeEx( monsterlv40    , EM_SetModeType_Strikback, true )--¤ÏÀ»
		SetModeEx( monsterlv40    , EM_SetModeType_SearchenemyIgnore, false )--³Q·j´M
		SetModeEx( monsterlv40    , EM_SetModeType_Obstruct, false )--ªý¾×
		SetModeEx( monsterlv40    , EM_SetModeType_Mark, true )--¼Ð°O
		SetModeEx( monsterlv40    , EM_SetModeType_Move, true )--²¾°Ê
		SetModeEx( monsterlv40    , EM_SetModeType_Searchenemy, true )--¯Á¼Ä
		SetModeEx( monsterlv40   , EM_SetModeType_HideName, false )--¦WºÙ
		SetModeEx( monsterlv40 , EM_SetModeType_ShowRoleHead, true )--ÀY¹³®Ø
		SetModeEx( monsterlv40, EM_SetModeType_Fight , true )--¥i¬å±þ§ðÀ»
		AddToPartition(monsterlv40 , RoomID) 
	--	SetRandMove( monsterlv40 , 100 ,300,50 )
		BeginPlot(monsterlv40, "Lua_mika_monstersum_move" , 0 )
		Hide(monsterlv40)
		if BuffA == 10 then  --power
			Addbuff( monsterlv40, 506607, 0, -1) --power lv1
		elseif BuffA == 20 then 
			Addbuff( monsterlv40, 506608, 0, -1) --power lv2
		elseif BuffA == 30 then 
			Addbuff( monsterlv40, 506609, 0, -1) --power lv3
		end 
		sleep(10)
		if treasure == 10 then
			SetPlot( monsterlv40 , "dead","Lua_mika_monstersum_lv10trea",0 )  --Ä_½c1
		elseif treasure == 20 then
			SetPlot( monsterlv40 , "dead","Lua_mika_monstersum_lv20trea",0 )  --Ä_½c2
		elseif treasure == 30 then
			SetPlot( monsterlv40 , "dead","Lua_mika_monstersum_lv30trea",0 )  --Ä_½c3
		end
		sleep(10)
		Show( monsterlv40,RoomID )
	elseif BuffB == 120 then 
		local monsterlv402 = CreateObj( 104018 , X+20 , Y , Z-20 , Dir  , 1 )
		SetModeEx( monsterlv402    , EM_SetModeType_Strikback, true )--¤ÏÀ»
		SetModeEx( monsterlv402    , EM_SetModeType_SearchenemyIgnore, false )--³Q·j´M
		SetModeEx( monsterlv402    , EM_SetModeType_Obstruct, false )--ªý¾×
		SetModeEx( monsterlv402    , EM_SetModeType_Mark, true )--¼Ð°O
		SetModeEx( monsterlv402    , EM_SetModeType_Move, true )--²¾°Ê
		SetModeEx( monsterlv402    , EM_SetModeType_Searchenemy, true )--¯Á¼Ä
		SetModeEx( monsterlv402   , EM_SetModeType_HideName, false )--¦WºÙ
		SetModeEx( monsterlv402 , EM_SetModeType_ShowRoleHead, true )--ÀY¹³®Ø
		SetModeEx( monsterlv402, EM_SetModeType_Fight , true )--¥i¬å±þ§ðÀ»
		AddToPartition(monsterlv402 , RoomID) 
--		SetRandMove( monsterlv402 , 100 ,300,50 )
		BeginPlot(monsterlv402, "Lua_mika_monstersum_move" , 0 )
		Hide(monsterlv402)
		if BuffA == 10 then  --power
			Addbuff( monsterlv402, 506607, 0, -1) --power lv1
		elseif BuffA == 20 then 
			Addbuff( monsterlv402, 506608, 0, -1) --power lv2
		elseif BuffA == 30 then 
			Addbuff( monsterlv402, 506609, 0, -1) --power lv3
		end 
		sleep(10)
		if treasure == 10 then
			SetPlot( monsterlv402 , "dead","Lua_mika_monstersum_lv10trea",0 )  --Ä_½c1
		elseif treasure == 20 then
			SetPlot( monsterlv402 , "dead","Lua_mika_monstersum_lv20trea",0 )  --Ä_½c2
		elseif treasure == 30 then
			SetPlot( monsterlv402 , "dead","Lua_mika_monstersum_lv30trea",0 )  --Ä_½c3
		end
		sleep(10)
		Show( monsterlv402,RoomID )
	elseif BuffB == 130 then 
		local monsterlv403 = CreateObj( 104019 , X+20 , Y , Z-20 , Dir  , 1 )
		SetModeEx( monsterlv403    , EM_SetModeType_Strikback, true )--¤ÏÀ»
		SetModeEx( monsterlv403    , EM_SetModeType_SearchenemyIgnore, false )--³Q·j´M
		SetModeEx( monsterlv403    , EM_SetModeType_Obstruct, false )--ªý¾×
		SetModeEx( monsterlv403    , EM_SetModeType_Mark, true )--¼Ð°O
		SetModeEx( monsterlv403    , EM_SetModeType_Move, true )--²¾°Ê
		SetModeEx( monsterlv403    , EM_SetModeType_Searchenemy, true )--¯Á¼Ä
		SetModeEx( monsterlv403   , EM_SetModeType_HideName, false )--¦WºÙ
		SetModeEx( monsterlv403 , EM_SetModeType_ShowRoleHead, true )--ÀY¹³®Ø
		SetModeEx( monsterlv403, EM_SetModeType_Fight , true )--¥i¬å±þ§ðÀ»
		AddToPartition(monsterlv403 , RoomID) 
--		SetRandMove( monsterlv403 , 100 ,300,50 )
		BeginPlot(monsterlv403, "Lua_mika_monstersum_move" , 0 )
		Hide(monsterlv403)
		if BuffA == 10 then  --power
			Addbuff( monsterlv403, 506607, 0, -1) --power lv1
		elseif BuffA == 20 then 
			Addbuff( monsterlv403, 506608, 0, -1) --power lv2
		elseif BuffA == 30 then 
			Addbuff( monsterlv403, 506609, 0, -1) --power lv3
		end 
		sleep(10)
		if treasure == 10 then
			SetPlot( monsterlv403 , "dead","Lua_mika_monstersum_lv10trea",0 )  --Ä_½c1
		elseif treasure == 20 then
			SetPlot( monsterlv403 , "dead","Lua_mika_monstersum_lv20trea",0 )  --Ä_½c2
		elseif treasure == 30 then
			SetPlot( monsterlv403 , "dead","Lua_mika_monstersum_lv30trea",0 )  --Ä_½c3
		end
		sleep(10)
		Show( monsterlv403,RoomID )
	elseif BuffB == 140 then 
		local monsterlv404 = CreateObj( 104020 , X+20 , Y , Z-20 , Dir  , 1 )
		SetModeEx( monsterlv404    , EM_SetModeType_Strikback, true )--¤ÏÀ»
		SetModeEx( monsterlv404    , EM_SetModeType_SearchenemyIgnore, false )--³Q·j´M
		SetModeEx( monsterlv404    , EM_SetModeType_Obstruct, false )--ªý¾×
		SetModeEx( monsterlv404    , EM_SetModeType_Mark, true )--¼Ð°O
		SetModeEx( monsterlv404    , EM_SetModeType_Move, true )--²¾°Ê
		SetModeEx( monsterlv404    , EM_SetModeType_Searchenemy, true )--¯Á¼Ä
		SetModeEx( monsterlv404   , EM_SetModeType_HideName, false )--¦WºÙ
		SetModeEx( monsterlv404 , EM_SetModeType_ShowRoleHead, true )--ÀY¹³®Ø
		SetModeEx( monsterlv404, EM_SetModeType_Fight , true )--¥i¬å±þ§ðÀ»
		AddToPartition(monsterlv404 , RoomID) 
--		SetRandMove( monsterlv404 , 100 ,300,50 )
		BeginPlot(monsterlv404, "Lua_mika_monstersum_move" , 0 )
		Hide(monsterlv404)
		if BuffA == 10 then  --power
			Addbuff( monsterlv404, 506607, 0, -1) --power lv1
		elseif BuffA == 20 then 
			Addbuff( monsterlv404, 506608, 0, -1) --power lv2
		elseif BuffA == 30 then 
			Addbuff( monsterlv404, 506609, 0, -1) --power lv3
		end 
		sleep(10)
		if treasure == 10 then
			SetPlot( monsterlv404 , "dead","Lua_mika_monstersum_lv10trea",0 )  --Ä_½c1
		elseif treasure == 20 then
			SetPlot( monsterlv404 , "dead","Lua_mika_monstersum_lv20trea",0 )  --Ä_½c2
		elseif treasure == 30 then
			SetPlot( monsterlv404 , "dead","Lua_mika_monstersum_lv30trea",0 )  --Ä_½c3
		end
		sleep(10)
		Show( monsterlv404,RoomID )
	elseif BuffB == 150 then 
		local monsterlv405 = CreateObj( 104021 , X+20 , Y , Z-20 , Dir  , 1 )
		SetModeEx( monsterlv405    , EM_SetModeType_Strikback, true )--¤ÏÀ»
		SetModeEx( monsterlv405    , EM_SetModeType_SearchenemyIgnore, false )--³Q·j´M
		SetModeEx( monsterlv405    , EM_SetModeType_Obstruct, false )--ªý¾×
		SetModeEx( monsterlv405    , EM_SetModeType_Mark, true )--¼Ð°O
		SetModeEx( monsterlv405    , EM_SetModeType_Move, true )--²¾°Ê
		SetModeEx( monsterlv405    , EM_SetModeType_Searchenemy, true )--¯Á¼Ä
		SetModeEx( monsterlv405   , EM_SetModeType_HideName, false )--¦WºÙ
		SetModeEx( monsterlv405 , EM_SetModeType_ShowRoleHead, true )--ÀY¹³®Ø
		SetModeEx( monsterlv405, EM_SetModeType_Fight , true )--¥i¬å±þ§ðÀ»
		AddToPartition(monsterlv405 , RoomID) 
	--	SetRandMove( monsterlv405 , 100 ,300,50 )
		BeginPlot(monsterlv405, "Lua_mika_monstersum_move" , 0 )
		Hide(monsterlv405)
		if BuffA == 10 then  --power
			Addbuff( monsterlv405, 506607, 0, -1) --power lv1
		elseif BuffA == 20 then 
			Addbuff( monsterlv405, 506608, 0, -1) --power lv2
		elseif BuffA == 30 then 
			Addbuff( monsterlv405, 506609, 0, -1) --power lv3
		end 
		sleep(10)
		if treasure == 10 then
			SetPlot( monsterlv405 , "dead","Lua_mika_monstersum_lv10trea",0 )  --Ä_½c1
		elseif treasure == 20 then
			SetPlot( monsterlv405 , "dead","Lua_mika_monstersum_lv20trea",0 )  --Ä_½c2
		elseif treasure == 30 then
			SetPlot( monsterlv405 , "dead","Lua_mika_monstersum_lv30trea",0 )  --Ä_½c3
		end
		sleep(10)
		Show( monsterlv405,RoomID )
	elseif BuffB == 160 then 
		local monsterlv406 = CreateObj( 104022 , X+20 , Y , Z-20 , Dir  , 1 )
		SetModeEx( monsterlv406    , EM_SetModeType_Strikback, true )--¤ÏÀ»
		SetModeEx( monsterlv406    , EM_SetModeType_SearchenemyIgnore, false )--³Q·j´M
		SetModeEx( monsterlv406    , EM_SetModeType_Obstruct, false )--ªý¾×
		SetModeEx( monsterlv406    , EM_SetModeType_Mark, true )--¼Ð°O
		SetModeEx( monsterlv406    , EM_SetModeType_Move, true )--²¾°Ê
		SetModeEx( monsterlv406    , EM_SetModeType_Searchenemy, true )--¯Á¼Ä
		SetModeEx( monsterlv406   , EM_SetModeType_HideName, false )--¦WºÙ
		SetModeEx( monsterlv406 , EM_SetModeType_ShowRoleHead, true )--ÀY¹³®Ø
		SetModeEx( monsterlv406, EM_SetModeType_Fight , true )--¥i¬å±þ§ðÀ»
		AddToPartition(monsterlv406 , RoomID) 
	--	SetRandMove( monsterlv406 , 100 ,300,50 )
		BeginPlot(monsterlv406, "Lua_mika_monstersum_move" , 0 )
		Hide(monsterlv406)
		if BuffA == 10 then  --power
			Addbuff( monsterlv406, 506607, 0, -1) --power lv1
		elseif BuffA == 20 then 
			Addbuff( monsterlv406, 506608, 0, -1) --power lv2
		elseif BuffA == 30 then 
			Addbuff( monsterlv406, 506609, 0, -1) --power lv3
		end 
		sleep(10)
		if treasure == 10 then
			SetPlot( monsterlv406 , "dead","Lua_mika_monstersum_lv10trea",0 )  --Ä_½c1
		elseif treasure == 20 then
			SetPlot( monsterlv406 , "dead","Lua_mika_monstersum_lv20trea",0 )  --Ä_½c2
		elseif treasure == 30 then
			SetPlot( monsterlv406 , "dead","Lua_mika_monstersum_lv30trea",0 )  --Ä_½c3
		end
		sleep(10)
		Show( monsterlv406,RoomID )
	end
end

function Lua_mika_monstersum_lv50born()   -- ¥l³ê©Çª«lv50
	local RoomID = ReadRoleValue(  OwnerID() ,EM_RoleValue_RoomID) 
	local X = ReadRoleValue( OwnerID() , EM_RoleValue_X )
	local Y = ReadRoleValue( OwnerID()  , EM_RoleValue_Y )
	local Z = ReadRoleValue( OwnerID()  , EM_RoleValue_Z )
	local Dir  = ReadRoleValue(OwnerID()  , EM_RoleValue_Dir )
	local BuffA = ReadRoleValue(OwnerID() , EM_RoleValue_Register+1  )
	local BuffB = ReadRoleValue(OwnerID() , EM_RoleValue_Register+2  )
	local treasure = ReadRoleValue(OwnerID() , EM_RoleValue_Register+3  )
	if BuffB == 110 then  --power
		local monsterlv50 = CreateObj( 104113 , X+20 , Y , Z-20 , Dir  , 1 )
		SetModeEx( monsterlv50    , EM_SetModeType_Strikback, true )--¤ÏÀ»
		SetModeEx( monsterlv50    , EM_SetModeType_SearchenemyIgnore, false )--³Q·j´M
		SetModeEx( monsterlv50    , EM_SetModeType_Obstruct, false )--ªý¾×
		SetModeEx( monsterlv50    , EM_SetModeType_Mark, true )--¼Ð°O
		SetModeEx( monsterlv50    , EM_SetModeType_Move, true )--²¾°Ê
		SetModeEx( monsterlv50    , EM_SetModeType_Searchenemy, true )--¯Á¼Ä
		SetModeEx( monsterlv50   , EM_SetModeType_HideName, false )--¦WºÙ
		SetModeEx( monsterlv50 , EM_SetModeType_ShowRoleHead, true )--ÀY¹³®Ø
		SetModeEx( monsterlv50, EM_SetModeType_Fight , true )--¥i¬å±þ§ðÀ»
		AddToPartition(monsterlv50 , RoomID) 
	--	SetRandMove( monsterlv50 , 100 ,300,50 )
		BeginPlot(monsterlv50, "Lua_mika_monstersum_move" , 0 )
		Hide(monsterlv50)
		if BuffA == 10 then  --power
			Addbuff( monsterlv50, 506607, 0, -1) --power lv1
		elseif BuffA == 20 then 
			Addbuff( monsterlv50, 506608, 0, -1) --power lv2
		elseif BuffA == 30 then 
			Addbuff( monsterlv50, 506609, 0, -1) --power lv3
		end 
		sleep(10)
		if treasure == 10 then
			SetPlot( monsterlv50 , "dead","Lua_mika_monstersum_lv10trea",0 )  --Ä_½c1
		elseif treasure == 20 then
			SetPlot( monsterlv50 , "dead","Lua_mika_monstersum_lv20trea",0 )  --Ä_½c2
		elseif treasure == 30 then
			SetPlot( monsterlv50 , "dead","Lua_mika_monstersum_lv30trea",0 )  --Ä_½c3
		end
		sleep(10)
		Show( monsterlv50,RoomID )
	elseif BuffB == 120 then 
		local monsterlv501 = CreateObj( 104114 , X+20 , Y , Z-20 , Dir  , 1 )
		SetModeEx( monsterlv501    , EM_SetModeType_Strikback, true )--¤ÏÀ»
		SetModeEx( monsterlv501    , EM_SetModeType_SearchenemyIgnore, false )--³Q·j´M
		SetModeEx( monsterlv501    , EM_SetModeType_Obstruct, false )--ªý¾×
		SetModeEx( monsterlv501    , EM_SetModeType_Mark, true )--¼Ð°O
		SetModeEx( monsterlv501    , EM_SetModeType_Move, true )--²¾°Ê
		SetModeEx( monsterlv501   , EM_SetModeType_Searchenemy, true )--¯Á¼Ä
		SetModeEx( monsterlv501  , EM_SetModeType_HideName, false )--¦WºÙ
		SetModeEx( monsterlv501, EM_SetModeType_ShowRoleHead, true )--ÀY¹³®Ø
		SetModeEx( monsterlv501, EM_SetModeType_Fight , true )--¥i¬å±þ§ðÀ»
		AddToPartition(monsterlv501 , RoomID) 
	--	SetRandMove( monsterlv501 , 100 ,300,50 )
		BeginPlot(monsterlv501, "Lua_mika_monstersum_move" , 0 )
		Hide(monsterlv501)
		if BuffA == 10 then  --power
			Addbuff( monsterlv501, 506607, 0, -1) --power lv1
		elseif BuffA == 20 then 
			Addbuff( monsterlv501, 506608, 0, -1) --power lv2
		elseif BuffA == 30 then 
			Addbuff( monsterlv501, 506609, 0, -1) --power lv3
		end 
		sleep(10)
		if treasure == 10 then
			SetPlot( monsterlv501 , "dead","Lua_mika_monstersum_lv10trea",0 )  --Ä_½c1
		elseif treasure == 20 then
			SetPlot( monsterlv501 , "dead","Lua_mika_monstersum_lv20trea",0 )  --Ä_½c2
		elseif treasure == 30 then
			SetPlot( monsterlv501 , "dead","Lua_mika_monstersum_lv30trea",0 )  --Ä_½c3
		end
		sleep(10)
		Show( monsterlv501,RoomID )
	elseif BuffB == 130 then 
		local monsterlv502 = CreateObj( 104115 , X+20 , Y , Z-20 , Dir  , 1 )
		SetModeEx( monsterlv502    , EM_SetModeType_Strikback, true )--¤ÏÀ»
		SetModeEx( monsterlv502    , EM_SetModeType_SearchenemyIgnore, false )--³Q·j´M
		SetModeEx( monsterlv502    , EM_SetModeType_Obstruct, false )--ªý¾×
		SetModeEx( monsterlv502    , EM_SetModeType_Mark, true )--¼Ð°O
		SetModeEx( monsterlv502    , EM_SetModeType_Move, true )--²¾°Ê
		SetModeEx( monsterlv502   , EM_SetModeType_Searchenemy, true )--¯Á¼Ä
		SetModeEx( monsterlv502  , EM_SetModeType_HideName, false )--¦WºÙ
		SetModeEx( monsterlv502, EM_SetModeType_ShowRoleHead, true )--ÀY¹³®Ø
		SetModeEx( monsterlv502, EM_SetModeType_Fight , true )--¥i¬å±þ§ðÀ»
		AddToPartition(monsterlv502 , RoomID) 
	--	SetRandMove( monsterlv502 , 100 ,300,50 )
		BeginPlot(monsterlv502, "Lua_mika_monstersum_move" , 0 )
		Hide(monsterlv502)
		if BuffA == 10 then  --power
			Addbuff( monsterlv502, 506607, 0, -1) --power lv1
		elseif BuffA == 20 then 
			Addbuff( monsterlv502, 506608, 0, -1) --power lv2
		elseif BuffA == 30 then 
			Addbuff( monsterlv502, 506609, 0, -1) --power lv3
		end 
		sleep(10)
		if treasure == 10 then
			SetPlot( monsterlv502 , "dead","Lua_mika_monstersum_lv10trea",0 )  --Ä_½c1
		elseif treasure == 20 then
			SetPlot( monsterlv502 , "dead","Lua_mika_monstersum_lv20trea",0 )  --Ä_½c2
		elseif treasure == 30 then
			SetPlot( monsterlv502 , "dead","Lua_mika_monstersum_lv30trea",0 )  --Ä_½c3
		end
		sleep(10)
		Show( monsterlv502,RoomID )
	elseif BuffB == 140 then 
		local monsterlv503 = CreateObj( 104116 , X+20 , Y , Z-20 , Dir  , 1 )
		SetModeEx( monsterlv503    , EM_SetModeType_Strikback, true )--¤ÏÀ»
		SetModeEx( monsterlv503    , EM_SetModeType_SearchenemyIgnore, false )--³Q·j´M
		SetModeEx( monsterlv503    , EM_SetModeType_Obstruct, false )--ªý¾×
		SetModeEx( monsterlv503    , EM_SetModeType_Mark, true )--¼Ð°O
		SetModeEx( monsterlv503    , EM_SetModeType_Move, true )--²¾°Ê
		SetModeEx( monsterlv503   , EM_SetModeType_Searchenemy, true )--¯Á¼Ä
		SetModeEx( monsterlv503  , EM_SetModeType_HideName, false )--¦WºÙ
		SetModeEx( monsterlv503, EM_SetModeType_ShowRoleHead, true )--ÀY¹³®Ø
		SetModeEx( monsterlv503, EM_SetModeType_Fight , true )--¥i¬å±þ§ðÀ»
		AddToPartition(monsterlv503 , RoomID) 
--		SetRandMove( monsterlv503 , 100 ,300,50 )
		BeginPlot(monsterlv503, "Lua_mika_monstersum_move" , 0 )
		Hide(monsterlv503)
		if BuffA == 10 then  --power
			Addbuff( monsterlv503, 506607, 0, -1) --power lv1
		elseif BuffA == 20 then 
			Addbuff( monsterlv503, 506608, 0, -1) --power lv2
		elseif BuffA == 30 then 
			Addbuff( monsterlv503, 506609, 0, -1) --power lv3
		end 
		sleep(10)
		if treasure == 10 then
			SetPlot( monsterlv503 , "dead","Lua_mika_monstersum_lv10trea",0 )  --Ä_½c1
		elseif treasure == 20 then
			SetPlot( monsterlv503 , "dead","Lua_mika_monstersum_lv20trea",0 )  --Ä_½c2
		elseif treasure == 30 then
			SetPlot( monsterlv503 , "dead","Lua_mika_monstersum_lv30trea",0 )  --Ä_½c3
		end
		sleep(10)
		Show( monsterlv503,RoomID )
	elseif BuffB == 150 then 
		local monsterlv504 = CreateObj( 104117 , X+20 , Y , Z-20 , Dir  , 1 )
		SetModeEx( monsterlv504    , EM_SetModeType_Strikback, true )--¤ÏÀ»
		SetModeEx( monsterlv504    , EM_SetModeType_SearchenemyIgnore, false )--³Q·j´M
		SetModeEx( monsterlv504    , EM_SetModeType_Obstruct, false )--ªý¾×
		SetModeEx( monsterlv504    , EM_SetModeType_Mark, true )--¼Ð°O
		SetModeEx( monsterlv504    , EM_SetModeType_Move, true )--²¾°Ê
		SetModeEx( monsterlv504   , EM_SetModeType_Searchenemy, true )--¯Á¼Ä
		SetModeEx( monsterlv504  , EM_SetModeType_HideName, false )--¦WºÙ
		SetModeEx( monsterlv504, EM_SetModeType_ShowRoleHead, true )--ÀY¹³®Ø
		SetModeEx( monsterlv504, EM_SetModeType_Fight , true )--¥i¬å±þ§ðÀ»
		AddToPartition(monsterlv504 , RoomID) 
--		SetRandMove( monsterlv504 , 100 ,300,50 )
		BeginPlot(monsterlv504, "Lua_mika_monstersum_move" , 0 )
		Hide(monsterlv504)
		if BuffA == 10 then  --power
			Addbuff( monsterlv504, 506607, 0, -1) --power lv1
		elseif BuffA == 20 then 
			Addbuff( monsterlv504, 506608, 0, -1) --power lv2
		elseif BuffA == 30 then 
			Addbuff( monsterlv504, 506609, 0, -1) --power lv3
		end 
		sleep(10)
		if treasure == 10 then
			SetPlot( monsterlv504 , "dead","Lua_mika_monstersum_lv10trea",0 )  --Ä_½c1
		elseif treasure == 20 then
			SetPlot( monsterlv504 , "dead","Lua_mika_monstersum_lv20trea",0 )  --Ä_½c2
		elseif treasure == 30 then
			SetPlot( monsterlv504 , "dead","Lua_mika_monstersum_lv30trea",0 )  --Ä_½c3
		end
		sleep(10)
		Show( monsterlv504,RoomID )
	elseif BuffB == 160 then 
		local monsterlv505 = CreateObj( 104118 , X+20 , Y , Z-20 , Dir  , 1 )
		SetModeEx( monsterlv505    , EM_SetModeType_Strikback, true )--¤ÏÀ»
		SetModeEx( monsterlv505    , EM_SetModeType_SearchenemyIgnore, false )--³Q·j´M
		SetModeEx( monsterlv505    , EM_SetModeType_Obstruct, false )--ªý¾×
		SetModeEx( monsterlv505    , EM_SetModeType_Mark, true )--¼Ð°O
		SetModeEx( monsterlv505    , EM_SetModeType_Move, true )--²¾°Ê
		SetModeEx( monsterlv505   , EM_SetModeType_Searchenemy, true )--¯Á¼Ä
		SetModeEx( monsterlv505  , EM_SetModeType_HideName, false )--¦WºÙ
		SetModeEx( monsterlv505, EM_SetModeType_ShowRoleHead, true )--ÀY¹³®Ø
		SetModeEx( monsterlv505, EM_SetModeType_Fight , true )--¥i¬å±þ§ðÀ»
		AddToPartition(monsterlv505 , RoomID) 
	--	SetRandMove( monsterlv505 , 100 ,300,50 )
		BeginPlot(monsterlv505, "Lua_mika_monstersum_move" , 0 )
		Hide(monsterlv505)
		if BuffA == 10 then  --power
			Addbuff( monsterlv505, 506607, 0, -1) --power lv1
		elseif BuffA == 20 then 
			Addbuff( monsterlv505, 506608, 0, -1) --power lv2
		elseif BuffA == 30 then 
			Addbuff( monsterlv505, 506609, 0, -1) --power lv3
		end 
		sleep(10)
		if treasure == 10 then
			SetPlot( monsterlv505 , "dead","Lua_mika_monstersum_lv10trea",0 )  --Ä_½c1
		elseif treasure == 20 then
			SetPlot( monsterlv505 , "dead","Lua_mika_monstersum_lv20trea",0 )  --Ä_½c2
		elseif treasure == 30 then
			SetPlot( monsterlv505 , "dead","Lua_mika_monstersum_lv30trea",0 )  --Ä_½c3
		end
		sleep(10)
		Show( monsterlv505,RoomID )
	end
end

function Lua_mika_monstersum_lv60born()   -- ¥l³ê©Çª«lv60
	local RoomID = ReadRoleValue(  OwnerID() ,EM_RoleValue_RoomID) 
	local X = ReadRoleValue( OwnerID() , EM_RoleValue_X )
	local Y = ReadRoleValue( OwnerID()  , EM_RoleValue_Y )
	local Z = ReadRoleValue( OwnerID()  , EM_RoleValue_Z )
	local Dir  = ReadRoleValue(OwnerID()  , EM_RoleValue_Dir )
	local BuffA = ReadRoleValue(OwnerID() , EM_RoleValue_Register+1  )
	local BuffB = ReadRoleValue(OwnerID() , EM_RoleValue_Register+2  )
	local treasure = ReadRoleValue(OwnerID() , EM_RoleValue_Register+3  )
	if BuffB == 110 then  --power
		local monsterlv60 = CreateObj( 104119 , X+20 , Y , Z-20 , Dir  , 1 )
		SetModeEx( monsterlv60    , EM_SetModeType_Strikback, true )--¤ÏÀ»
		SetModeEx( monsterlv60    , EM_SetModeType_SearchenemyIgnore, false )--³Q·j´M
		SetModeEx( monsterlv60    , EM_SetModeType_Obstruct, false )--ªý¾×
		SetModeEx( monsterlv60    , EM_SetModeType_Mark, true )--¼Ð°O
		SetModeEx( monsterlv60    , EM_SetModeType_Move, true )--²¾°Ê
		SetModeEx( monsterlv60    , EM_SetModeType_Searchenemy, true )--¯Á¼Ä
		SetModeEx( monsterlv60   , EM_SetModeType_HideName, false )--¦WºÙ
		SetModeEx( monsterlv60 , EM_SetModeType_ShowRoleHead, true )--ÀY¹³®Ø
		SetModeEx( monsterlv60, EM_SetModeType_Fight , true )--¥i¬å±þ§ðÀ»
		AddToPartition(monsterlv60 , RoomID) 
	--	SetRandMove( monsterlv60 , 100 ,300,50 )
		BeginPlot(monsterlv60, "Lua_mika_monstersum_move" , 0 )
		Hide(monsterlv60)
		if BuffA == 10 then  --power
			Addbuff( monsterlv60, 506607, 0, -1) --power lv1
		elseif BuffA == 20 then 
			Addbuff( monsterlv60, 506608, 0, -1) --power lv2
		elseif BuffA == 30 then 
			Addbuff( monsterlv60, 506609, 0, -1) --power lv3
		end 
		sleep(10)
		if treasure == 10 then
			SetPlot( monsterlv60 , "dead","Lua_mika_monstersum_lv10trea",0 )  --Ä_½c1
		elseif treasure == 20 then
			SetPlot( monsterlv60 , "dead","Lua_mika_monstersum_lv20trea",0 )  --Ä_½c2
		elseif treasure == 30 then
			SetPlot( monsterlv60 , "dead","Lua_mika_monstersum_lv30trea",0 )  --Ä_½c3
		end
		sleep(10)
		Show( monsterlv60,RoomID )
	elseif BuffB == 120 then 
		local monsterlv602 = CreateObj( 104120 , X+20 , Y , Z-20 , Dir  , 1 )
		SetModeEx( monsterlv602    , EM_SetModeType_Strikback, true )--¤ÏÀ»
		SetModeEx( monsterlv602    , EM_SetModeType_SearchenemyIgnore, false )--³Q·j´M
		SetModeEx( monsterlv602    , EM_SetModeType_Obstruct, false )--ªý¾×
		SetModeEx( monsterlv602    , EM_SetModeType_Mark, true )--¼Ð°O
		SetModeEx( monsterlv602    , EM_SetModeType_Move, true )--²¾°Ê
		SetModeEx( monsterlv602    , EM_SetModeType_Searchenemy, true )--¯Á¼Ä
		SetModeEx( monsterlv602   , EM_SetModeType_HideName, false )--¦WºÙ
		SetModeEx( monsterlv602 , EM_SetModeType_ShowRoleHead, true )--ÀY¹³®Ø
		SetModeEx( monsterlv602, EM_SetModeType_Fight , true )--¥i¬å±þ§ðÀ»
		AddToPartition(monsterlv602 , RoomID) 
	--	SetRandMove( monsterlv602 , 100 ,300,50 )
		BeginPlot(monsterlv602, "Lua_mika_monstersum_move" , 0 )
		Hide(monsterlv602)
		if BuffA == 10 then  --power
			Addbuff( monsterlv602, 506607, 0, -1) --power lv1
		elseif BuffA == 20 then 
			Addbuff( monsterlv602, 506608, 0, -1) --power lv2
		elseif BuffA == 30 then 
			Addbuff( monsterlv602, 506609, 0, -1) --power lv3
		end 
		sleep(10)
		if treasure == 10 then
			SetPlot( monsterlv602 , "dead","Lua_mika_monstersum_lv10trea",0 )  --Ä_½c1
		elseif treasure == 20 then
			SetPlot( monsterlv602 , "dead","Lua_mika_monstersum_lv20trea",0 )  --Ä_½c2
		elseif treasure == 30 then
			SetPlot( monsterlv602 , "dead","Lua_mika_monstersum_lv30trea",0 )  --Ä_½c3
		end
		sleep(10)
		Show( monsterlv602,RoomID )
	elseif BuffB == 130 then 
		local monsterlv603 = CreateObj( 104121 , X+20 , Y , Z-20 , Dir  , 1 )
		SetModeEx( monsterlv603    , EM_SetModeType_Strikback, true )--¤ÏÀ»
		SetModeEx( monsterlv603    , EM_SetModeType_SearchenemyIgnore, false )--³Q·j´M
		SetModeEx( monsterlv603    , EM_SetModeType_Obstruct, false )--ªý¾×
		SetModeEx( monsterlv603    , EM_SetModeType_Mark, true )--¼Ð°O
		SetModeEx( monsterlv603    , EM_SetModeType_Move, true )--²¾°Ê
		SetModeEx( monsterlv603    , EM_SetModeType_Searchenemy, true )--¯Á¼Ä
		SetModeEx( monsterlv603   , EM_SetModeType_HideName, false )--¦WºÙ
		SetModeEx( monsterlv603 , EM_SetModeType_ShowRoleHead, true )--ÀY¹³®Ø
		SetModeEx( monsterlv603, EM_SetModeType_Fight , true )--¥i¬å±þ§ðÀ»
		AddToPartition(monsterlv603 , RoomID) 
	--	SetRandMove( monsterlv603 , 100 ,300,50 )
		BeginPlot(monsterlv603, "Lua_mika_monstersum_move" , 0 )
		Hide(monsterlv603)
		if BuffA == 10 then  --power
			Addbuff( monsterlv603, 506607, 0, -1) --power lv1
		elseif BuffA == 20 then 
			Addbuff( monsterlv603, 506608, 0, -1) --power lv2
		elseif BuffA == 30 then 
			Addbuff( monsterlv603, 506609, 0, -1) --power lv3
		end 
		sleep(10)
		if treasure == 10 then
			SetPlot( monsterlv603 , "dead","Lua_mika_monstersum_lv10trea",0 )  --Ä_½c1
		elseif treasure == 20 then
			SetPlot( monsterlv603 , "dead","Lua_mika_monstersum_lv20trea",0 )  --Ä_½c2
		elseif treasure == 30 then
			SetPlot( monsterlv603 , "dead","Lua_mika_monstersum_lv30trea",0 )  --Ä_½c3
		end
		sleep(10)
		Show( monsterlv603,RoomID )
	elseif BuffB == 140 then 
		local monsterlv604 = CreateObj( 104122 , X+20 , Y , Z-20 , Dir  , 1 )
		SetModeEx( monsterlv604    , EM_SetModeType_Strikback, true )--¤ÏÀ»
		SetModeEx( monsterlv604    , EM_SetModeType_SearchenemyIgnore, false )--³Q·j´M
		SetModeEx( monsterlv604    , EM_SetModeType_Obstruct, false )--ªý¾×
		SetModeEx( monsterlv604    , EM_SetModeType_Mark, true )--¼Ð°O
		SetModeEx( monsterlv604    , EM_SetModeType_Move, true )--²¾°Ê
		SetModeEx( monsterlv604    , EM_SetModeType_Searchenemy, true )--¯Á¼Ä
		SetModeEx( monsterlv604   , EM_SetModeType_HideName, false )--¦WºÙ
		SetModeEx( monsterlv604 , EM_SetModeType_ShowRoleHead, true )--ÀY¹³®Ø
		SetModeEx( monsterlv604, EM_SetModeType_Fight , true )--¥i¬å±þ§ðÀ»
		AddToPartition(monsterlv604 , RoomID) 
	--	SetRandMove( monsterlv604 , 100 ,300,50 )
		BeginPlot(monsterlv604, "Lua_mika_monstersum_move" , 0 )
		Hide(monsterlv604)
		if BuffA == 10 then  --power
			Addbuff( monsterlv604, 506607, 0, -1) --power lv1
		elseif BuffA == 20 then 
			Addbuff( monsterlv604, 506608, 0, -1) --power lv2
		elseif BuffA == 30 then 
			Addbuff( monsterlv604, 506609, 0, -1) --power lv3
		end 
		sleep(10)
		if treasure == 10 then
			SetPlot( monsterlv604 , "dead","Lua_mika_monstersum_lv10trea",0 )  --Ä_½c1
		elseif treasure == 20 then
			SetPlot( monsterlv604 , "dead","Lua_mika_monstersum_lv20trea",0 )  --Ä_½c2
		elseif treasure == 30 then
			SetPlot( monsterlv604 , "dead","Lua_mika_monstersum_lv30trea",0 )  --Ä_½c3
		end
		sleep(10)
		Show( monsterlv604,RoomID )
	elseif BuffB == 150 then 
		local monsterlv605 = CreateObj( 104123 , X+20 , Y , Z-20 , Dir  , 1 )
		SetModeEx( monsterlv605    , EM_SetModeType_Strikback, true )--¤ÏÀ»
		SetModeEx( monsterlv605    , EM_SetModeType_SearchenemyIgnore, false )--³Q·j´M
		SetModeEx( monsterlv605    , EM_SetModeType_Obstruct, false )--ªý¾×
		SetModeEx( monsterlv605    , EM_SetModeType_Mark, true )--¼Ð°O
		SetModeEx( monsterlv605    , EM_SetModeType_Move, true )--²¾°Ê
		SetModeEx( monsterlv605    , EM_SetModeType_Searchenemy, true )--¯Á¼Ä
		SetModeEx( monsterlv605   , EM_SetModeType_HideName, false )--¦WºÙ
		SetModeEx( monsterlv605 , EM_SetModeType_ShowRoleHead, true )--ÀY¹³®Ø
		SetModeEx( monsterlv605, EM_SetModeType_Fight , true )--¥i¬å±þ§ðÀ»
		AddToPartition(monsterlv605 , RoomID) 
--		SetRandMove( monsterlv605 , 100 ,300,50 )
		BeginPlot(monsterlv605, "Lua_mika_monstersum_move" , 0 )
		Hide(monsterlv605)
		if BuffA == 10 then  --power
			Addbuff( monsterlv605, 506607, 0, -1) --power lv1
		elseif BuffA == 20 then 
			Addbuff( monsterlv605, 506608, 0, -1) --power lv2
		elseif BuffA == 30 then 
			Addbuff( monsterlv605, 506609, 0, -1) --power lv3
		end 
		sleep(10)
		if treasure == 10 then
			SetPlot( monsterlv605 , "dead","Lua_mika_monstersum_lv10trea",0 )  --Ä_½c1
		elseif treasure == 20 then
			SetPlot( monsterlv605 , "dead","Lua_mika_monstersum_lv20trea",0 )  --Ä_½c2
		elseif treasure == 30 then
			SetPlot( monsterlv605 , "dead","Lua_mika_monstersum_lv30trea",0 )  --Ä_½c3
		end
		sleep(10)
		Show( monsterlv605,RoomID )
	elseif BuffB == 160 then 
		local monsterlv606 = CreateObj( 104124 , X+20 , Y , Z-20 , Dir  , 1 )
		SetModeEx( monsterlv606    , EM_SetModeType_Strikback, true )--¤ÏÀ»
		SetModeEx( monsterlv606    , EM_SetModeType_SearchenemyIgnore, false )--³Q·j´M
		SetModeEx( monsterlv606    , EM_SetModeType_Obstruct, false )--ªý¾×
		SetModeEx( monsterlv606    , EM_SetModeType_Mark, true )--¼Ð°O
		SetModeEx( monsterlv606    , EM_SetModeType_Move, true )--²¾°Ê
		SetModeEx( monsterlv606    , EM_SetModeType_Searchenemy, true )--¯Á¼Ä
		SetModeEx( monsterlv606   , EM_SetModeType_HideName, false )--¦WºÙ
		SetModeEx( monsterlv606 , EM_SetModeType_ShowRoleHead, true )--ÀY¹³®Ø
		SetModeEx( monsterlv606, EM_SetModeType_Fight , true )--¥i¬å±þ§ðÀ»
		AddToPartition(monsterlv606 , RoomID) 
	--	SetRandMove( monsterlv606 , 100 ,300,50 )
		BeginPlot(monsterlv606, "Lua_mika_monstersum_move" , 0 )
		Hide(monsterlv606)
		if BuffA == 10 then  --power
			Addbuff( monsterlv606, 506607, 0, -1) --power lv1
		elseif BuffA == 20 then 
			Addbuff( monsterlv606, 506608, 0, -1) --power lv2
		elseif BuffA == 30 then 
			Addbuff( monsterlv606, 506609, 0, -1) --power lv3
		end 
		sleep(10)
		if treasure == 10 then
			SetPlot( monsterlv606 , "dead","Lua_mika_monstersum_lv10trea",0 )  --Ä_½c1
		elseif treasure == 20 then
			SetPlot( monsterlv606 , "dead","Lua_mika_monstersum_lv20trea",0 )  --Ä_½c2
		elseif treasure == 30 then
			SetPlot( monsterlv606 , "dead","Lua_mika_monstersum_lv30trea",0 )  --Ä_½c3
		end
		sleep(10)
		Show( monsterlv606,RoomID )
	end
end