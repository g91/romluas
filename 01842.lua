function LuaS_MK_MoveToObj(mode,ObjID,Tar,V1,V2,V3,V4,V5)
---當mod = obj
---ObjID =>要創造並移動的物件ID
---TargetID => 移動的對象
---V1 => 創造移動物件的參考物件
---V2 => 移動至目標並停止的最接近距離
---V3 => "創造移動物件的位置"與目標的最遠距離
---V4 => 1走路,0跑步,不填預設為0

---當mod = flag
---ObjID =>要創造並移動的物件ID
---TargetID => 移動的對象
---V1 => 創造移動物件的參考旗標ID
---V2 => 創造移動物件的參考旗標NUM
---V3 => 移動至目標並停止的最接近距離
---V4 => "創造移動物件的位置"與目標的最遠距離
---V5 => 1走路,0跑步,不填預設為0
	local moveobj 				---如果mode不是obj or flag ,return nil
	if	mode == nil	then
		return nil
	end

	if	type(mode )~="string"	then
		return nil
	end
	if mode == "obj" then
		if	V1 == nil	then				----整理V1~V4
			return nil
		end
		if	V2 == nil	or V2 < 0 then
			V2 = 15
		end
		if	V3 == nil	or V3 < 0 then
			V3 = 70
		end
		if	V4 == nil	or V4 > 1 or V4 < 0 then
			V4 = 0
		end
		
		Local x1,y1,z1,x2,y2,z2,gox,goy,goz,startx,starty,startz		----get 參考點 location
		x1 = ReadRoleValue ( V1, EM_RoleValue_X)
		y1 = ReadRoleValue ( V1,  EM_RoleValue_Y)
		z1 = ReadRoleValue ( V1,  EM_RoleValue_Z)
		
		local inf = Lua_DW_CreateObj("obj",115421,Tar)   --影行假人
		AddBuff(inf,506984,10,-1)
		WriteRoleValue(inf , EM_RoleValue_IsWalk, 1 )	

		Callplot(inf,"LuaS_MK_testmove",x1,y1,z1)
		callPlot(inf,"LuaS_inf_time_dead")
		local time = 30
		local count = 0

		while true do						----得到move ending location
			if GetDistance(inf,Tar) > V2 then
				
				gox = ReadRoleValue ( inf, EM_RoleValue_X)
				goy = ReadRoleValue ( inf, EM_RoleValue_Y)
				goz = ReadRoleValue ( inf, EM_RoleValue_Z)	
				break	
			end
			sleep(1)
			count = count +1
			if count > time then					----時間到還沒跑到range時,強制取location
				gox = ReadRoleValue ( inf, EM_RoleValue_X)
				goy = ReadRoleValue ( inf, EM_RoleValue_Y)
				goz = ReadRoleValue ( inf, EM_RoleValue_Z)	
				break					
			end
		end

		count = 0
		while true do						----得到move start location
			if GetDistance(inf,Tar) > V3 then	
				startx = ReadRoleValue ( inf, EM_RoleValue_X)
				starty = ReadRoleValue ( inf, EM_RoleValue_Y)
				startz = ReadRoleValue ( inf, EM_RoleValue_Z)	
				delobj(inf)
				break	
			end
			sleep(1)
			count = count +1
			if count > time then
				startx = ReadRoleValue ( inf, EM_RoleValue_X)
				starty = ReadRoleValue ( inf, EM_RoleValue_Y)
				startz = ReadRoleValue ( inf, EM_RoleValue_Z)	
				delobj(inf)
				break					
			end
		end


	
		local  Array = { startx , starty , startz }				
		
		moveobj = Lua_DW_CreateObj( "xyz" , ObjID , array)			---在start點上產生ObjID
		DisableQuest( moveobj , true )
		MoveToFlagEnabled(moveobj,false)	
--		sleep(20)
		if	V4 == 1	then						----判斷走或跑
			WriteRoleValue(moveobj , EM_RoleValue_IsWalk, 0 )	
		else
			WriteRoleValue(moveobj , EM_RoleValue_IsWalk, 1 )				
		end	
		CallPlot(moveobj,"DW_WaitMoveTo", moveobj , gox , goy  , goz )				----跑向ending點
		return moveobj
	end


	if mode == "flag" then
		if	V1 == nil	then
			return nil
		end

		if	V2 == nil	or type(V2 ) ~= "number"	then
			return nil
		end
		if	V3 == nil	or V3 < 0 then
			V3 = 15
		end
		if	V4 == nil	or V4 < 0 then
			V4 = 70
		end
		if	V5 == nil	or V5 > 1 or V5 < 0 then
			V5 = 0
		end

		Local x1,y1,z1,x2,y2,z2,gox,goy,goz,startx,starty,startz
		x1 = GetMoveFlagValue( V1 , V2 , EM_RoleValue_X )
		y1 = GetMoveFlagValue( V1 , V2 , EM_RoleValue_Y )
		z1 = GetMoveFlagValue(V1 , V2 , EM_RoleValue_Z )
		---say(TargetID,"x="..x1..",y="..y1..",z="..z1)		
		local inf = Lua_DW_CreateObj("obj",115421,Tar)   --影行假人
		AddBuff(inf,506984,10,-1)
		WriteRoleValue(inf , EM_RoleValue_IsWalk, 1 )	

		Callplot(inf,"LuaS_MK_testmove",x1,y1,z1)
		callPlot(inf,"LuaS_inf_time_dead")
		------say(TargetID,"inf = "..inf)

		local time = 30
		local count = 0
		
		while true do
			if GetDistance(inf,Tar) > V3 then
				
				gox = ReadRoleValue ( inf, EM_RoleValue_X)
				goy = ReadRoleValue ( inf, EM_RoleValue_Y)
				goz = ReadRoleValue ( inf, EM_RoleValue_Z)	
				break	
			end
			--------say(Tar,"count = "..count)
			sleep(1)
			count = count +1
			if count > time then
				gox = ReadRoleValue ( inf, EM_RoleValue_X)
				goy = ReadRoleValue ( inf, EM_RoleValue_Y)
				goz = ReadRoleValue ( inf, EM_RoleValue_Z)	
				break					
			end
		end

		count = 0
		while true do
			if GetDistance(inf,Tar) > V4 then	
				startx = ReadRoleValue ( inf, EM_RoleValue_X)
				starty = ReadRoleValue ( inf, EM_RoleValue_Y)
				startz = ReadRoleValue ( inf, EM_RoleValue_Z)	
				delobj(inf)
				break	
			end
			sleep(1)
			-----say(TargetID,"count = "..count )
			count = count +1
			if count > time then
				startx = ReadRoleValue ( inf, EM_RoleValue_X)
				starty = ReadRoleValue ( inf, EM_RoleValue_Y)
				startz = ReadRoleValue ( inf, EM_RoleValue_Z)
				delobj(inf)	
				break					
			end
		end

		local  Array = { startx , starty , startz }
		
		moveobj = Lua_DW_CreateObj( "xyz" , ObjID , array)
		DisableQuest( moveobj , true )	
		MoveToFlagEnabled(moveobj,false)	
		
		----say(TargetID,"obj = "..moveobj )
--		sleep(20)

		if	V5 == 1	then
			WriteRoleValue(moveobj , EM_RoleValue_IsWalk, 1 )
		else
			WriteRoleValue(moveobj , EM_RoleValue_IsWalk, 0 )				
		end
		CallPlot(moveobj,"DW_WaitMoveTo", moveobj , gox , goy  , goz )				----跑向ending點		
		return moveobj 
	end


end

function LuaS_inf_time_dead()
	sleep(31)
	delobj(OwnerID())
end

function LuaS_MK_testmove(x,y,z)				
	DW_WaitMoveTo( OwnerID() , x , y  , z )	
end

function LuaS_MK_moveface(x,y,z,target)				
	DW_WaitMoveTo( OwnerID() , x , y  , z )
	AdjustFaceDir( OwnerID() ,target, 0 )		
end


function LuaS_MK_rangetest()					----測試用,掛在初始劇情
	SetPlot(OwnerID(),"touch","LuaS_115018",100)
end

function LuaS_115018()	---player=>owner ; bag=> target		---測試種出115014,
	local Target = LuaFunc_SearchNPCbyOrgID( OwnerID() ,115014 , 10000 , 0)	---search ball位置
	say(OwnerID(),Target)
	local inf = LuaS_MK_MoveToObj("flag",115014,TargetID(),780594,0,15,70,0)
	sleep(10)
	say(OwnerID(),inf)
	delobj(inf)
	
end



function Lua_Check_Drama_Extra_OneTime_noword( ObjID , QuestID , Range ) 
	if Range == nil or Type( Range ) ~= "number" then
		Range = 250
	end
	local RoomID = ReadRoleValue( ObjID , EM_RoleValue_RoomID )
	local Players = SetSearchAllPlayer(RoomID )
	local Count = 0
	local Name = "[QuestID]"
	local Str = "[SC_QUEST_OVER_RANGE][$SETVAR1="..Name.."]"
	for i = 1 , Players , 1 do 
		local ID = GetSearchResult()
		if CheckID(ID) == true and CheckAcceptQuest(ID , QuestID ) == true then
			if GetDistance( ID , ObjID ) > Range then

			else
				Count = Count + 1
			end
		end
	end
	if Count == 0 then
		return false
	else
		return true
	end
end


function LuaS_Check_noquest( V1 , V2 , V3 , V4)
	local Players
	local ID	
	local Quest = V3
	local Buff = V4
	while	ReadRoleValue( OwnerID(), EM_RoleValue_Register + V1)  == V2	do
		Players = SetSearchAllPlayer ( 0 )
		for i = 1 , Players , 1 do 
			ID = GetSearchResult()
			if CheckID(ID) == true and 	CheckAcceptQuest( ID , Quest ) == false	and	CheckBuff(ID , Buff ) == true	then
				CancelBuff( ID  , Buff  ) 	--
			end
		end	
		sleep(10)
		--say(OwnerID(),ReadRoleValue( OwnerID(), EM_RoleValue_Register +I).." = "..V2)
	end
end

function LuaS_Check_noquest_single( V1 , V2 , V3 , V4 , player,Owner,range)
	local Quest = V3
	local Buff = V4	
	while	ReadRoleValue( OwnerID(), EM_RoleValue_Register + V1)  == V2	do
		if CheckID(player) == true and 	CheckAcceptQuest( player , Quest ) == false	and	CheckBuff(player , Buff ) == true	then
				CancelBuff( player  , Buff  ) 	--
		end	
		if	GetDistance( player , Owner ) > range	then
				CancelBuff( player  , Buff  ) 	--
		end
		sleep(10)
		--say(OwnerID(),ReadRoleValue( OwnerID(), EM_RoleValue_Register +I).." = "..V2)
	end

end

function LuaS_Check_noquest_multi( V1 , V2 , V3 , V4,Owner,range)
	say(OwnerID(),"V1 = "..V1)
	say(OwnerID(),"V2 = "..V2)
	say(OwnerID(),"V3 = "..V3)
	say(OwnerID(),"V4 = "..V4)
	say(OwnerID(),"Owner = "..Owner)
	say(OwnerID(),"range = "..range)
	local Quest = V3
	local Buff = V4
	local ID = SearchRangePlayer ( Owner , range )		---有等待BUFF沒有演戲BUFF的玩家,給予演戲BUFF
	say(OwnerID(),"player = " .. ID[i])
	while	ReadRoleValue( OwnerID(), EM_RoleValue_Register + V1)  == V2	do
		for i = 1 , table.getn(ID) , 1 do 
			say(ID[i],"i am check")
			if CheckID (ID[i] ) == true and 	CheckAcceptQuest( ID[i] , Quest ) == false	and	CheckBuff(ID[i] , Buff ) == true	then
				CancelBuff( ID[i]   , Buff  ) 	--
			end
			if	GetDistance( ID[i]  , Owner ) > range	and	CheckBuff(ID[i] , Buff ) == true	then
					CancelBuff( player[i]   , Buff  ) 	--
					ScriptMessage( ID[i]  , ID[i]  , 0 , "[SC_SOFAR]" , 0 ) --你已經離開任務：[$VAR1] 的檢查範圍
					ScriptMessage( ID[i]  , ID[i]  , 1 , "[SC_SOFAR]" , 0 ) --你已經離開任務：[$VAR1] 的檢查範圍
			end	
		end	
		sleep(10)

		--say(OwnerID(),ReadRoleValue( OwnerID(), EM_RoleValue_Register +V1).." = "..V2)
	end
end


function MK_MoveToFlag_End( ObjID , FlagObjID , FlagID,Range , Enable  )
--ObjID 執行移動的對象
--FlagObjID 旗子的資料庫編號
--FlagID 旗子編號
--Range 亂數決定移動到定點的範圍
--Enable  0，不關閉movotoflag   1，關閉movetoflag
	if	Enable ~= nil	then
		if	Enable == 1	then
			MoveToFlagEnabled( ObjID , false )
		end
	end
 	local X , Y , Z
	X = GetMoveFlagValue( FlagObjID , FlagID , EM_RoleValue_X )
	Y = GetMoveFlagValue( FlagObjID , FlagID , EM_RoleValue_Y )
	Z = GetMoveFlagValue( FlagObjID , FlagID , EM_RoleValue_Z )

	X = X + Rand( Range) * 2 - Range + 1
	Z = Z + Rand( Range) * 2 - Range + 1

	DW_WaitMoveTo( ObjID , X , Y  , Z )
	delobj(ObjID)
	return
end

function MK_MoveToFlag_Face( ObjID , FlagObjID , FlagID,Range , Enable,Target  )
--ObjID 執行移動的對象
--FlagObjID 旗子的資料庫編號
--FlagID 旗子編號
--Range 亂數決定移動到定點的範圍
--Enable  0，不關閉movotoflag   1，關閉movetoflag
	if	Enable ~= nil	then
		if	Enable == 1	then
			MoveToFlagEnabled( ObjID , false )
		end
	end
 	local X , Y , Z
	X = GetMoveFlagValue( FlagObjID , FlagID , EM_RoleValue_X )
	Y = GetMoveFlagValue( FlagObjID , FlagID , EM_RoleValue_Y )
	Z = GetMoveFlagValue( FlagObjID , FlagID , EM_RoleValue_Z )

	X = X + Rand( Range) * 2 - Range + 1
	Z = Z + Rand( Range) * 2 - Range + 1

	DW_WaitMoveTo( ObjID , X , Y  , Z )
	AdjustFaceDir( ObjID ,Target, 0 )	
	return
end


function LuaS_MK_test()
	CastSpell(OwnerID(),OwnerID(),495768)	
end

function LuaMK_test2()
	local a = LuaS_MK_MoveToObj("flag",100052,OwnerID(),780753,2,50,100,0)
	say(a,"i am "..a)
end

function LuaS_MK_Dark_BT_Move1()
	AddBuff( TargetID() , 506098, 0, -1 )
	sleep(10)
	CancelBuff( TargetID() , 506098 )	
end

function LuaS_MK_Dark_BT_Move2()
	AddBuff( TargetID() , 506098, 0, -1 )
	sleep(10)
	CancelBuff( TargetID() , 506098 )	
end