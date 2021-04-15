function LuaYU_SummberFrog_0()   --�C��޾ɪ�
	
	local CallWhat = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local RoomID = ReadRoleValue(  OwnerID() ,EM_RoleValue_RoomID ) 

	local Frog = LuaFunc_CreateObjByObj ( 100044 , OwnerID() )

	SetModeEx( Frog , EM_SetModeType_Strikback , false )--����
	SetModeEx( Frog , EM_SetModeType_SearchenemyIgnore , false )--�Q�j�M
	SetModeEx( Frog , EM_SetModeType_Obstruct , false )--����
	SetModeEx( Frog , EM_SetModeType_Mark , false )--�аO
	SetModeEx( Frog , EM_SetModeType_Move , false )--����
	SetModeEx( Frog , EM_SetModeType_Searchenemy , false )--����
	SetModeEx( Frog , EM_SetModeType_HideName , true )--�W��
	SetModeEx( Frog , EM_SetModeType_ShowRoleHead , false )--�Y����
	SetModeEx( Frog , EM_SetModeType_Show , false ) --�����
	SetModeEx( Frog , EM_SetModeType_Fight , false )--�i�������

	Hide( Frog )
	Show( Frog ,RoomID )

	if CallWhat == 100 then
		Beginplot( Frog ,"LuaYU_SummberFrog_00", 0 )
	elseif CallWhat == 110 then
		Beginplot( Frog ,"LuaYU_SummberFrog_01", 0 )
	elseif CallWhat == 120 then
		Beginplot( Frog ,"LuaYU_SummberFrog_02", 0 )
	elseif CallWhat == 130 then
		Beginplot( Frog ,"LuaYU_SummberFrog_03", 0 )
	elseif CallWhat == 140 then
		Beginplot( Frog ,"LuaYU_SummberFrog_04", 0 )
	elseif CallWhat == 150 then
		Beginplot( Frog ,"LuaYU_SummberFrog_05", 0 )
	elseif CallWhat == 160 then
		Beginplot( Frog ,"LuaYU_SummberFrog_06", 0 )
	elseif CallWhat == 170 then
		Beginplot( Frog ,"LuaYU_SummberFrog_07", 0 )
	elseif CallWhat == 180 then
		Beginplot( Frog ,"LuaYU_SummberFrog_08", 0 )
	elseif CallWhat == 190 then
		Beginplot( Frog ,"LuaYU_SummberFrog_09", 0 )
	end

end

function LuaYU_SummberFrog_00()   --Lv10  ��C��

	local Obj = Role:new( OwnerID() )
	local ZoneID = Obj:ZoneID() -1000*math.floor(Obj:ZoneID() / 1000 )
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID ) 
	local Frog = 105079

	local Obj = Role:new( OwnerID() )
	local BaseX = Obj :X()
	local BaseY = Obj :Y()
	local BaseZ = Obj :Z()
	local BaseDir = Obj :Dir()
	local MonsterGroup = {}
	local X = { 10 }-- �X�䫬
	local dis = { 50 } -- �Z����ߪ��Z��
	local Count = 1

	for i = 1 , table.getn(X) do
		for j = 1 , X[i] , 1 do
			--CreateObj ( ObjID , X , Y , Z , Dir , Count )  
			MonsterGroup[Count] = CreateObj( Frog , BaseX-dis[i]*math.cos(math.pi*2*(j/X[i])) , BaseY , BaseZ+dis[i]*math.sin(math.pi*2*(j/X[i])) , BaseDir , 1 )
			Count = Count + 1
		end
	end
	for i = 1 , table.getn(MonsterGroup) do
		AddToPartition( MonsterGroup[i] , RoomID )
		SetModeEx( MonsterGroup[i] , EM_SetModeType_Revive , true )--�i����
		SetRandMove( MonsterGroup[i] , 100 , 50 , 50 )
	end
	Delobj( OwnerID()  )
end

function LuaYU_SummberFrog_01()   --Lv20  ��C��

	local Obj = Role:new( OwnerID() )
	local ZoneID = Obj:ZoneID() -1000*math.floor(Obj:ZoneID() / 1000 )
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID ) 
	local Frog = 105080

	local Obj = Role:new( OwnerID() )
	local BaseX = Obj :X()
	local BaseY = Obj :Y()
	local BaseZ = Obj :Z()
	local BaseDir = Obj :Dir()
	local MonsterGroup = {}
	local X = { 10 }-- �X�䫬
	local dis = { 50 } -- �Z����ߪ��Z��
	local Count = 1

	for i = 1 , table.getn(X) do
		for j = 1 , X[i] , 1 do
			--CreateObj ( ObjID , X , Y , Z , Dir , Count )  
			MonsterGroup[Count] = CreateObj( Frog , BaseX-dis[i]*math.cos(math.pi*2*(j/X[i])) , BaseY , BaseZ+dis[i]*math.sin(math.pi*2*(j/X[i])) , BaseDir , 1 )
			Count = Count + 1
		end
	end
	for i = 1 , table.getn(MonsterGroup) do
		AddToPartition( MonsterGroup[i] , RoomID )
		SetModeEx( MonsterGroup[i] , EM_SetModeType_Revive , true )--�i����
		SetRandMove( MonsterGroup[i] , 100 , 50 , 50 )
	end
	Delobj( OwnerID()  )

end

function LuaYU_SummberFrog_02()   --LV30  ��C��

	local Obj = Role:new( OwnerID() )
	local ZoneID = Obj:ZoneID() -1000*math.floor(Obj:ZoneID() / 1000 )
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID ) 
	local Frog = 105081

	local Obj = Role:new( OwnerID() )
	local BaseX = Obj :X()
	local BaseY = Obj :Y()
	local BaseZ = Obj :Z()
	local BaseDir = Obj :Dir()
	local MonsterGroup = {}
	local X = { 10 }-- �X�䫬
	local dis = { 50 } -- �Z����ߪ��Z��
	local Count = 1

	for i = 1 , table.getn(X) do
		for j = 1 , X[i] , 1 do
			--CreateObj ( ObjID , X , Y , Z , Dir , Count )  
			MonsterGroup[Count] = CreateObj( Frog , BaseX-dis[i]*math.cos(math.pi*2*(j/X[i])) , BaseY , BaseZ+dis[i]*math.sin(math.pi*2*(j/X[i])) , BaseDir , 1 )
			Count = Count + 1
		end
	end
	for i = 1 , table.getn(MonsterGroup) do
		AddToPartition( MonsterGroup[i] , RoomID )
		SetModeEx( MonsterGroup[i] , EM_SetModeType_Revive , true )--�i����
		SetRandMove( MonsterGroup[i] , 100 , 50 , 50 )
	end
	Delobj( OwnerID()  )

end

function LuaYU_SummberFrog_03()    --Lv40  ��C��

	local Obj = Role:new( OwnerID() )
	local ZoneID = Obj:ZoneID() -1000*math.floor(Obj:ZoneID() / 1000 )
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID ) 
	local Frog = 105082

	local Obj = Role:new( OwnerID() )
	local BaseX = Obj :X()
	local BaseY = Obj :Y()
	local BaseZ = Obj :Z()
	local BaseDir = Obj :Dir()
	local MonsterGroup = {}
	local X = { 10 }-- �X�䫬
	local dis = { 50 } -- �Z����ߪ��Z��
	local Count = 1

	for i = 1 , table.getn(X) do
		for j = 1 , X[i] , 1 do
			--CreateObj ( ObjID , X , Y , Z , Dir , Count )  
			MonsterGroup[Count] = CreateObj( Frog , BaseX-dis[i]*math.cos(math.pi*2*(j/X[i])) , BaseY , BaseZ+dis[i]*math.sin(math.pi*2*(j/X[i])) , BaseDir , 1 )
			Count = Count + 1
		end
	end
	for i = 1 , table.getn(MonsterGroup) do
		AddToPartition( MonsterGroup[i] , RoomID )
		SetModeEx( MonsterGroup[i] , EM_SetModeType_Revive , true )--�i����
		SetRandMove( MonsterGroup[i] , 100 , 50 , 50 )
	end
	Delobj( OwnerID()  )

end

function LuaYU_SummberFrog_04()   --Lv50  ��C��

	local Obj = Role:new( OwnerID() )
	local ZoneID = Obj:ZoneID() -1000*math.floor(Obj:ZoneID() / 1000 )
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID ) 
	local Frog = 105083

	local Obj = Role:new( OwnerID() )
	local BaseX = Obj :X()
	local BaseY = Obj :Y()
	local BaseZ = Obj :Z()
	local BaseDir = Obj :Dir()
	local MonsterGroup = {}
	local X = { 10 }-- �X�䫬
	local dis = { 50 } -- �Z����ߪ��Z��
	local Count = 1

	for i = 1 , table.getn(X) do
		for j = 1 , X[i] , 1 do
			--CreateObj ( ObjID , X , Y , Z , Dir , Count )  
			MonsterGroup[Count] = CreateObj( Frog , BaseX-dis[i]*math.cos(math.pi*2*(j/X[i])) , BaseY , BaseZ+dis[i]*math.sin(math.pi*2*(j/X[i])) , BaseDir , 1 )
			Count = Count + 1
		end
	end
	for i = 1 , table.getn(MonsterGroup) do
		AddToPartition( MonsterGroup[i] , RoomID )
		SetModeEx( MonsterGroup[i] , EM_SetModeType_Revive , true )--�i����
		SetRandMove( MonsterGroup[i] , 100 , 50 , 50 )
	end
	Delobj( OwnerID()  )
end

function LuaYU_SummberFrog_05()   --Lv10  ���C��

	local Obj = Role:new( OwnerID() )
	local ZoneID = Obj:ZoneID() -1000*math.floor(Obj:ZoneID() / 1000 )
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID ) 
	local Frog = 105084

	local Obj = Role:new( OwnerID() )
	local BaseX = Obj :X()
	local BaseY = Obj :Y()
	local BaseZ = Obj :Z()
	local BaseDir = Obj :Dir()
	local MonsterGroup = {}
	local X = { 10 }-- �X�䫬
	local dis = { 50 } -- �Z����ߪ��Z��
	local Count = 1

	for i = 1 , table.getn(X) do
		for j = 1 , X[i] , 1 do
			--CreateObj ( ObjID , X , Y , Z , Dir , Count )  
			MonsterGroup[Count] = CreateObj( Frog , BaseX-dis[i]*math.cos(math.pi*2*(j/X[i])) , BaseY , BaseZ+dis[i]*math.sin(math.pi*2*(j/X[i])) , BaseDir , 1 )
			Count = Count + 1
		end
	end
	for i = 1 , table.getn(MonsterGroup) do
		AddToPartition( MonsterGroup[i] , RoomID )
		SetModeEx( MonsterGroup[i] , EM_SetModeType_Revive , true )--�i����
		SetRandMove( MonsterGroup[i] , 100 , 50 , 50 )
	end
	Delobj( OwnerID()  )

end

function LuaYU_SummberFrog_06()   --Lv20  ���C��

	local Obj = Role:new( OwnerID() )
	local ZoneID = Obj:ZoneID() -1000*math.floor(Obj:ZoneID() / 1000 )
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID ) 
	local Frog = 105085

	local Obj = Role:new( OwnerID() )
	local BaseX = Obj :X()
	local BaseY = Obj :Y()
	local BaseZ = Obj :Z()
	local BaseDir = Obj :Dir()
	local MonsterGroup = {}
	local X = { 10 }-- �X�䫬
	local dis = { 50 } -- �Z����ߪ��Z��
	local Count = 1

	for i = 1 , table.getn(X) do
		for j = 1 , X[i] , 1 do
			--CreateObj ( ObjID , X , Y , Z , Dir , Count )  
			MonsterGroup[Count] = CreateObj( Frog , BaseX-dis[i]*math.cos(math.pi*2*(j/X[i])) , BaseY , BaseZ+dis[i]*math.sin(math.pi*2*(j/X[i])) , BaseDir , 1 )
			Count = Count + 1
		end
	end
	for i = 1 , table.getn(MonsterGroup) do
		AddToPartition( MonsterGroup[i] , RoomID )
		SetModeEx( MonsterGroup[i] , EM_SetModeType_Revive , true )--�i����
		SetRandMove( MonsterGroup[i] , 100 , 50 , 50 )
	end
	Delobj( OwnerID()  )

end

function LuaYU_SummberFrog_07()   --Lv30  ���C��

	local Obj = Role:new( OwnerID() )
	local ZoneID = Obj:ZoneID() -1000*math.floor(Obj:ZoneID() / 1000 )
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID ) 
	local Frog = 105086

	local Obj = Role:new( OwnerID() )
	local BaseX = Obj :X()
	local BaseY = Obj :Y()
	local BaseZ = Obj :Z()
	local BaseDir = Obj :Dir()
	local MonsterGroup = {}
	local X = { 10 }-- �X�䫬
	local dis = { 50 } -- �Z����ߪ��Z��
	local Count = 1

	for i = 1 , table.getn(X) do
		for j = 1 , X[i] , 1 do
			--CreateObj ( ObjID , X , Y , Z , Dir , Count )  
			MonsterGroup[Count] = CreateObj( Frog , BaseX-dis[i]*math.cos(math.pi*2*(j/X[i])) , BaseY , BaseZ+dis[i]*math.sin(math.pi*2*(j/X[i])) , BaseDir , 1 )
			Count = Count + 1
		end
	end
	for i = 1 , table.getn(MonsterGroup) do
		AddToPartition( MonsterGroup[i] , RoomID )
		SetModeEx( MonsterGroup[i] , EM_SetModeType_Revive , true )--�i����
		SetRandMove( MonsterGroup[i] , 100 , 50 , 50 )
	end
	Delobj( OwnerID()  )
end

function LuaYU_SummberFrog_08()   --Lv40  ���C��

	local Obj = Role:new( OwnerID() )
	local ZoneID = Obj:ZoneID() -1000*math.floor(Obj:ZoneID() / 1000 )
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID ) 
	local Frog = 105087

	local Obj = Role:new( OwnerID() )
	local BaseX = Obj :X()
	local BaseY = Obj :Y()
	local BaseZ = Obj :Z()
	local BaseDir = Obj :Dir()
	local MonsterGroup = {}
	local X = { 10 }-- �X�䫬
	local dis = { 50 } -- �Z����ߪ��Z��
	local Count = 1

	for i = 1 , table.getn(X) do
		for j = 1 , X[i] , 1 do
			--CreateObj ( ObjID , X , Y , Z , Dir , Count )  
			MonsterGroup[Count] = CreateObj( Frog , BaseX-dis[i]*math.cos(math.pi*2*(j/X[i])) , BaseY , BaseZ+dis[i]*math.sin(math.pi*2*(j/X[i])) , BaseDir , 1 )
			Count = Count + 1
		end
	end
	for i = 1 , table.getn(MonsterGroup) do
		AddToPartition( MonsterGroup[i] , RoomID )
		SetModeEx( MonsterGroup[i] , EM_SetModeType_Revive , true )--�i����
		SetRandMove( MonsterGroup[i] , 100 , 50 , 50 )
	end
	Delobj( OwnerID()  )

end

function LuaYU_SummberFrog_09()   --Lv50  ���C��

	local Obj = Role:new( OwnerID() )
	local ZoneID = Obj:ZoneID() -1000*math.floor(Obj:ZoneID() / 1000 )
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID ) 
	local Frog = 105088

	local Obj = Role:new( OwnerID() )
	local BaseX = Obj :X()
	local BaseY = Obj :Y()
	local BaseZ = Obj :Z()
	local BaseDir = Obj :Dir()
	local MonsterGroup = {}
	local X = { 10 }-- �X�䫬
	local dis = { 50 } -- �Z����ߪ��Z��
	local Count = 1

	for i = 1 , table.getn(X) do
		for j = 1 , X[i] , 1 do
			--CreateObj ( ObjID , X , Y , Z , Dir , Count )  
			MonsterGroup[Count] = CreateObj( Frog , BaseX-dis[i]*math.cos(math.pi*2*(j/X[i])) , BaseY , BaseZ+dis[i]*math.sin(math.pi*2*(j/X[i])) , BaseDir , 1 )
			Count = Count + 1
		end
	end
	for i = 1 , table.getn(MonsterGroup) do
		AddToPartition( MonsterGroup[i] , RoomID )
		SetModeEx( MonsterGroup[i] , EM_SetModeType_Revive , true )--�i����
		SetRandMove( MonsterGroup[i] , 100 , 50 , 50 )
	end
	Delobj( OwnerID()  )

end