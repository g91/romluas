
function Lua_cang_119_wall3_01()	--�o�� Ĳ�o
	SetPlot( OwnerID() , "range" , "Lua_cang_119_wall3_02" , 150 )
end

function Lua_cang_119_wall3_02()
	SetPlot( TargetID(),"range", "" ,0 )
	BeginPlot( TargetID(), "Lua_cang_119_wall3_03", 10)
end

function Lua_cang_119_wallclose3_01()	--���� Ĳ�o
	SetPlot( OwnerID() , "range" , "Lua_cang_119_wallclose3_02" , 50 )
end
	
function Lua_cang_119_wallclose3_02()	--���� �R���Ұʪ���
	WriteRoleValue( TargetID() ,EM_RoleValue_Register1, 1)	
	Sleep(300)
	DelObj(TargetID())
end

function Lua_cang_119_wall3_03()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local Close = CreateObjByFlag( 102819, 780483, 0, 1)	--�۴�
	SetModeEx( Close   , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( Close   , EM_SetModeType_Strikback, false )--����
	SetModeEx( Close   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( Close   , EM_SetModeType_Mark, false )--�аO
	SetModeEx( Close   , EM_SetModeType_Move, false )--����
	SetModeEx( Close   , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( Close   , EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( Close   , EM_SetModeType_HideName, false )--�W��
	DelFromPartition( Close )
	AddToPartition( Close , RoomID )	--�[�i�R�x	
	BeginPlot(Close,"Lua_cang_119_wallclose3_01",0)
	BeginPlot(Close,"Lua_cang_119_wall3_04_1",0)
	WriteRoleValue( Close ,EM_RoleValue_Register1, 0)
end	

function Lua_cang_119_wall3_04_1()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local Temp = {}
	for i=1,32,1 do 
		Sleep(10)	
		Temp[i]=CreateObjByFlag( 102820, 780483, i,1)
		SetModeEx( Temp[i] , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( Temp[i] , EM_SetModeType_Strikback, false )--����
		SetModeEx( Temp[i] , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
		SetModeEx( Temp[i] , EM_SetModeType_Mark, false )--�аO
		SetModeEx( Temp[i] , EM_SetModeType_Move, false )--����
		SetModeEx( Temp[i] , EM_SetModeType_Searchenemy, false )--����
		SetModeEx( Temp[i] , EM_SetModeType_ShowRoleHead, false )--�Y����
		SetModeEx( Temp[i] , EM_SetModeType_HideName, false )--�W��
		SetModeEx( Temp[i] , EM_SetModeType_Show,true )--�W��
		AddToPartition( Temp[i] , RoomID )
	end
	while true do
		Sleep(10)
		local Close = ReadRoleValue( OwnerID() ,EM_RoleValue_Register1)	
		local FireRND =  Rand( 100 )+1	-- ���Ͷü�			
		if Close == 0 then
			if FireRND <= 100 and FireRND > 75 then
				CastSpellLV( Temp[1]  , OwnerID() , 494449 , 1 )
			elseif FireRND <= 75 and FireRND > 50 then
				CastSpellLV( Temp[2] , OwnerID() , 494449 , 1 )
			elseif FireRND <= 50 and FireRND > 25 then
				CastSpellLV( Temp[3] , OwnerID() , 494449 , 1 )
			elseif FireRND <= 25 and FireRND > 0 then
				CastSpellLV( Temp[4] , OwnerID() , 494449 , 1 )
			end		
			if FireRND <= 100 and FireRND > 75 then
				CastSpellLV( Temp[5]  , OwnerID() , 494449 , 1 )
			elseif FireRND <= 75 and FireRND > 50 then
				CastSpellLV( Temp[6] , OwnerID() , 494449 , 1 )
			elseif FireRND <= 50 and FireRND > 25 then
				CastSpellLV( Temp[7] , OwnerID() , 494449 , 1 )
			elseif FireRND <= 25 and FireRND > 0 then
				CastSpellLV( Temp[8] , OwnerID() , 494449 , 1 )
			end				
			if FireRND <= 100 and FireRND > 75 then
				CastSpellLV( Temp[9]  , OwnerID() , 494449 , 1 )
			elseif FireRND <= 75 and FireRND > 50 then
				CastSpellLV( Temp[10] , OwnerID() , 494449 , 1 )
			elseif FireRND <= 50 and FireRND > 25 then
				CastSpellLV( Temp[11] , OwnerID() , 494449 , 1 )
			elseif FireRND <= 25 and FireRND > 0 then
				CastSpellLV( Temp[12] , OwnerID() , 494449 , 1 )
			end		
			if FireRND <= 100 and FireRND > 75 then
				CastSpellLV( Temp[13]  , OwnerID() , 494449 , 1 )
			elseif FireRND <= 75 and FireRND > 50 then
				CastSpellLV( Temp[14] , OwnerID() , 494449 , 1 )
			elseif FireRND <= 50 and FireRND > 25 then
				CastSpellLV( Temp[15] , OwnerID() , 494449 , 1 )
			elseif FireRND <= 25 and FireRND > 0 then
				CastSpellLV( Temp[16] , OwnerID() , 494449 , 1 )
			end
			if FireRND <= 100 and FireRND > 75 then
				CastSpellLV( Temp[17]  , OwnerID() , 494449 , 1 )
			elseif FireRND <= 75 and FireRND > 50 then
				CastSpellLV( Temp[18] , OwnerID() , 494449 , 1 )
			elseif FireRND <= 50 and FireRND > 25 then
				CastSpellLV( Temp[19] , OwnerID() , 494449 , 1 )
			elseif FireRND <= 25 and FireRND > 0 then
				CastSpellLV( Temp[20] , OwnerID() , 494449 , 1 )
			end	
			if FireRND <= 100 and FireRND > 75 then
				CastSpellLV( Temp[21]  , OwnerID() , 494449 , 1 )
			elseif FireRND <= 75 and FireRND > 50 then
				CastSpellLV( Temp[22] , OwnerID() , 494449 , 1 )
			elseif FireRND <= 50 and FireRND > 25 then
				CastSpellLV( Temp[23] , OwnerID() , 494449 , 1 )
			elseif FireRND <= 25 and FireRND > 0 then
				CastSpellLV( Temp[24] , OwnerID() , 494449 , 1 )
			end		
			if FireRND <= 100 and FireRND > 75 then
				CastSpellLV( Temp[25]  , OwnerID() , 494449 , 1 )
			elseif FireRND <= 75 and FireRND > 50 then
				CastSpellLV( Temp[26] , OwnerID() , 494449 , 1 )
			elseif FireRND <= 50 and FireRND > 25 then
				CastSpellLV( Temp[27] , OwnerID() , 494449 , 1 )
			elseif FireRND <= 25 and FireRND > 0 then
				CastSpellLV( Temp[28] , OwnerID() , 494449 , 1 )
			end
			if FireRND <= 100 and FireRND > 75 then
				CastSpellLV( Temp[29]  , OwnerID() , 494449 , 1 )
			elseif FireRND <= 75 and FireRND > 50 then
				CastSpellLV( Temp[30] , OwnerID() , 494449 , 1 )
			elseif FireRND <= 50 and FireRND > 25 then
				CastSpellLV( Temp[31] , OwnerID() , 494449 , 1 )
			elseif FireRND <= 25 and FireRND > 0 then
				CastSpellLV( Temp[32] , OwnerID() , 494449 , 1 )
			end
		elseif Close == 1 then
			for i=1,32,1 do
				Sleep(10)	
				Delobj( Temp[i] )
			end	
		end		
	end
end	

-----------------------------------------------------------------------------

function Lua_cang_119_wall4_01()	--�o�� Ĳ�o
	SetPlot( OwnerID() , "range" , "Lua_cang_119_wall4_02" , 150 )
end

function Lua_cang_119_wall4_02()
	SetPlot( TargetID(),"range", "" ,0 )
	BeginPlot( TargetID(), "Lua_cang_119_wall4_03", 10)
end

function Lua_cang_119_wallclose4_01()	--���� Ĳ�o
	SetPlot( OwnerID() , "range" , "Lua_cang_119_wallclose4_02" , 50 )
end
	
function Lua_cang_119_wallclose4_02()	--���� �R���Ұʪ���
	WriteRoleValue( TargetID() ,EM_RoleValue_Register1, 1)	
	Sleep(300)
	DelObj(TargetID())
end

function Lua_cang_119_wall4_03()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local Close = CreateObjByFlag( 102819, 780484, 0, 1)	--�۴�
	SetModeEx( Close   , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( Close   , EM_SetModeType_Strikback, false )--����
	SetModeEx( Close   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( Close   , EM_SetModeType_Mark, false )--�аO
	SetModeEx( Close   , EM_SetModeType_Move, false )--����
	SetModeEx( Close   , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( Close   , EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( Close   , EM_SetModeType_HideName, false )--�W��
	DelFromPartition( Close )
	AddToPartition( Close , RoomID )	--�[�i�R�x	
	BeginPlot(Close,"Lua_cang_119_wallclose4_01",0)
	BeginPlot(Close,"Lua_cang_119_wall4_04_1",0)
	WriteRoleValue( Close ,EM_RoleValue_Register1, 0)
end	


function Lua_cang_119_wall4_04_1()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local Temp = {}
	for i=1,32,1 do 
		Sleep(10)
		Temp[i]=CreateObjByFlag( 102820, 780484, i,1)
		SetModeEx( Temp[i] , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( Temp[i] , EM_SetModeType_Strikback, false )--����
		SetModeEx( Temp[i] , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
		SetModeEx( Temp[i] , EM_SetModeType_Mark, false )--�аO
		SetModeEx( Temp[i] , EM_SetModeType_Move, false )--����
		SetModeEx( Temp[i] , EM_SetModeType_Searchenemy, false )--����
		SetModeEx( Temp[i] , EM_SetModeType_ShowRoleHead, false )--�Y����
		SetModeEx( Temp[i] , EM_SetModeType_HideName, false )--�W��
		SetModeEx( Temp[i] , EM_SetModeType_Show,true )--�W��
		AddToPartition( Temp[i] , RoomID )
	end
	while true do
		Sleep(10)
		local Close = ReadRoleValue( OwnerID() ,EM_RoleValue_Register1)	
		local FireRND =  Rand( 100 )+1	-- ���Ͷü�			
		if Close == 0 then
			if FireRND <= 100 and FireRND > 75 then
				CastSpellLV( Temp[1]  , OwnerID() , 494449 , 1 )
			elseif FireRND <= 75 and FireRND > 50 then
				CastSpellLV( Temp[2] , OwnerID() , 494449 , 1 )
			elseif FireRND <= 50 and FireRND > 25 then
				CastSpellLV( Temp[3] , OwnerID() , 494449 , 1 )
			elseif FireRND <= 25 and FireRND > 0 then
				CastSpellLV( Temp[4] , OwnerID() , 494449 , 1 )
			end		
			if FireRND <= 100 and FireRND > 75 then
				CastSpellLV( Temp[5]  , OwnerID() , 494449 , 1 )
			elseif FireRND <= 75 and FireRND > 50 then
				CastSpellLV( Temp[6] , OwnerID() , 494449 , 1 )
			elseif FireRND <= 50 and FireRND > 25 then
				CastSpellLV( Temp[7] , OwnerID() , 494449 , 1 )
			elseif FireRND <= 25 and FireRND > 0 then
				CastSpellLV( Temp[8] , OwnerID() , 494449 , 1 )
			end				
			if FireRND <= 100 and FireRND > 75 then
				CastSpellLV( Temp[9]  , OwnerID() , 494449 , 1 )
			elseif FireRND <= 75 and FireRND > 50 then
				CastSpellLV( Temp[10] , OwnerID() , 494449 , 1 )
			elseif FireRND <= 50 and FireRND > 25 then
				CastSpellLV( Temp[11] , OwnerID() , 494449 , 1 )
			elseif FireRND <= 25 and FireRND > 0 then
				CastSpellLV( Temp[12] , OwnerID() , 494449 , 1 )
			end		
			if FireRND <= 100 and FireRND > 75 then
				CastSpellLV( Temp[13]  , OwnerID() , 494449 , 1 )
			elseif FireRND <= 75 and FireRND > 50 then
				CastSpellLV( Temp[14] , OwnerID() , 494449 , 1 )
			elseif FireRND <= 50 and FireRND > 25 then
				CastSpellLV( Temp[15] , OwnerID() , 494449 , 1 )
			elseif FireRND <= 25 and FireRND > 0 then
				CastSpellLV( Temp[16] , OwnerID() , 494449 , 1 )
			end
			if FireRND <= 100 and FireRND > 75 then
				CastSpellLV( Temp[17]  , OwnerID() , 494449 , 1 )
			elseif FireRND <= 75 and FireRND > 50 then
				CastSpellLV( Temp[18] , OwnerID() , 494449 , 1 )
			elseif FireRND <= 50 and FireRND > 25 then
				CastSpellLV( Temp[19] , OwnerID() , 494449 , 1 )
			elseif FireRND <= 25 and FireRND > 0 then
				CastSpellLV( Temp[20] , OwnerID() , 494449 , 1 )
			end	
			if FireRND <= 100 and FireRND > 75 then
				CastSpellLV( Temp[21]  , OwnerID() , 494449 , 1 )
			elseif FireRND <= 75 and FireRND > 50 then
				CastSpellLV( Temp[22] , OwnerID() , 494449 , 1 )
			elseif FireRND <= 50 and FireRND > 25 then
				CastSpellLV( Temp[23] , OwnerID() , 494449 , 1 )
			elseif FireRND <= 25 and FireRND > 0 then
				CastSpellLV( Temp[24] , OwnerID() , 494449 , 1 )
			end		
			if FireRND <= 100 and FireRND > 75 then
				CastSpellLV( Temp[25]  , OwnerID() , 494449 , 1 )
			elseif FireRND <= 75 and FireRND > 50 then
				CastSpellLV( Temp[26] , OwnerID() , 494449 , 1 )
			elseif FireRND <= 50 and FireRND > 25 then
				CastSpellLV( Temp[27] , OwnerID() , 494449 , 1 )
			elseif FireRND <= 25 and FireRND > 0 then
				CastSpellLV( Temp[28] , OwnerID() , 494449 , 1 )
			end
			if FireRND <= 100 and FireRND > 75 then
				CastSpellLV( Temp[29]  , OwnerID() , 494449 , 1 )
			elseif FireRND <= 75 and FireRND > 50 then
				CastSpellLV( Temp[30] , OwnerID() , 494449 , 1 )
			elseif FireRND <= 50 and FireRND > 25 then
				CastSpellLV( Temp[31] , OwnerID() , 494449 , 1 )
			elseif FireRND <= 25 and FireRND > 0 then
				CastSpellLV( Temp[32] , OwnerID() , 494449 , 1 )
			end
		elseif Close == 1 then
			for i=1,32,1 do
				Sleep(10)
				Delobj( Temp[i] )
			end	
		end		
	end
end	