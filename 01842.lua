function LuaS_MK_MoveToObj(mode,ObjID,Tar,V1,V2,V3,V4,V5)
---��mod = obj
---ObjID =>�n�гy�ò��ʪ�����ID
---TargetID => ���ʪ���H
---V1 => �гy���ʪ��󪺰ѦҪ���
---V2 => ���ʦܥؼШð���̱���Z��
---V3 => "�гy���ʪ��󪺦�m"�P�ؼЪ��̻��Z��
---V4 => 1����,0�]�B,����w�]��0

---��mod = flag
---ObjID =>�n�гy�ò��ʪ�����ID
---TargetID => ���ʪ���H
---V1 => �гy���ʪ��󪺰ѦҺX��ID
---V2 => �гy���ʪ��󪺰ѦҺX��NUM
---V3 => ���ʦܥؼШð���̱���Z��
---V4 => "�гy���ʪ��󪺦�m"�P�ؼЪ��̻��Z��
---V5 => 1����,0�]�B,����w�]��0
	local moveobj 				---�p�Gmode���Oobj or flag ,return nil
	if	mode == nil	then
		return nil
	end

	if	type(mode )~="string"	then
		return nil
	end
	if mode == "obj" then
		if	V1 == nil	then				----��zV1~V4
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
		
		Local x1,y1,z1,x2,y2,z2,gox,goy,goz,startx,starty,startz		----get �Ѧ��I location
		x1 = ReadRoleValue ( V1, EM_RoleValue_X)
		y1 = ReadRoleValue ( V1,  EM_RoleValue_Y)
		z1 = ReadRoleValue ( V1,  EM_RoleValue_Z)
		
		local inf = Lua_DW_CreateObj("obj",115421,Tar)   --�v�氲�H
		AddBuff(inf,506984,10,-1)
		WriteRoleValue(inf , EM_RoleValue_IsWalk, 1 )	

		Callplot(inf,"LuaS_MK_testmove",x1,y1,z1)
		callPlot(inf,"LuaS_inf_time_dead")
		local time = 30
		local count = 0

		while true do						----�o��move ending location
			if GetDistance(inf,Tar) > V2 then
				
				gox = ReadRoleValue ( inf, EM_RoleValue_X)
				goy = ReadRoleValue ( inf, EM_RoleValue_Y)
				goz = ReadRoleValue ( inf, EM_RoleValue_Z)	
				break	
			end
			sleep(1)
			count = count +1
			if count > time then					----�ɶ����٨S�]��range��,�j���location
				gox = ReadRoleValue ( inf, EM_RoleValue_X)
				goy = ReadRoleValue ( inf, EM_RoleValue_Y)
				goz = ReadRoleValue ( inf, EM_RoleValue_Z)	
				break					
			end
		end

		count = 0
		while true do						----�o��move start location
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
		
		moveobj = Lua_DW_CreateObj( "xyz" , ObjID , array)			---�bstart�I�W����ObjID
		DisableQuest( moveobj , true )
		MoveToFlagEnabled(moveobj,false)	
--		sleep(20)
		if	V4 == 1	then						----�P�_���ζ]
			WriteRoleValue(moveobj , EM_RoleValue_IsWalk, 0 )	
		else
			WriteRoleValue(moveobj , EM_RoleValue_IsWalk, 1 )				
		end	
		CallPlot(moveobj,"DW_WaitMoveTo", moveobj , gox , goy  , goz )				----�]�Vending�I
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
		local inf = Lua_DW_CreateObj("obj",115421,Tar)   --�v�氲�H
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
		CallPlot(moveobj,"DW_WaitMoveTo", moveobj , gox , goy  , goz )				----�]�Vending�I		
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


function LuaS_MK_rangetest()					----���ե�,���b��l�@��
	SetPlot(OwnerID(),"touch","LuaS_115018",100)
end

function LuaS_115018()	---player=>owner ; bag=> target		---���պإX115014,
	local Target = LuaFunc_SearchNPCbyOrgID( OwnerID() ,115014 , 10000 , 0)	---search ball��m
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
	local ID = SearchRangePlayer ( Owner , range )		---������BUFF�S���t��BUFF�����a,�����t��BUFF
	say(OwnerID(),"player = " .. ID[i])
	while	ReadRoleValue( OwnerID(), EM_RoleValue_Register + V1)  == V2	do
		for i = 1 , table.getn(ID) , 1 do 
			say(ID[i],"i am check")
			if CheckID (ID[i] ) == true and 	CheckAcceptQuest( ID[i] , Quest ) == false	and	CheckBuff(ID[i] , Buff ) == true	then
				CancelBuff( ID[i]   , Buff  ) 	--
			end
			if	GetDistance( ID[i]  , Owner ) > range	and	CheckBuff(ID[i] , Buff ) == true	then
					CancelBuff( player[i]   , Buff  ) 	--
					ScriptMessage( ID[i]  , ID[i]  , 0 , "[SC_SOFAR]" , 0 ) --�A�w�g���}���ȡG[$VAR1] ���ˬd�d��
					ScriptMessage( ID[i]  , ID[i]  , 1 , "[SC_SOFAR]" , 0 ) --�A�w�g���}���ȡG[$VAR1] ���ˬd�d��
			end	
		end	
		sleep(10)

		--say(OwnerID(),ReadRoleValue( OwnerID(), EM_RoleValue_Register +V1).." = "..V2)
	end
end


function MK_MoveToFlag_End( ObjID , FlagObjID , FlagID,Range , Enable  )
--ObjID ���沾�ʪ���H
--FlagObjID �X�l����Ʈw�s��
--FlagID �X�l�s��
--Range �üƨM�w���ʨ�w�I���d��
--Enable  0�A������movotoflag   1�A����movetoflag
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
--ObjID ���沾�ʪ���H
--FlagObjID �X�l����Ʈw�s��
--FlagID �X�l�s��
--Range �üƨM�w���ʨ�w�I���d��
--Enable  0�A������movotoflag   1�A����movetoflag
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