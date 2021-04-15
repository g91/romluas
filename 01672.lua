--�i�J���s�@��
function CheckEnterGuildWar()
	--���˪��A����i�J�Գ�
	local Count = BuffCount ( OwnerID())
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID ) -- �򥻪k�NID
		if BuffID == 501387 then--�j�Ѩ�....
			CancelBuff_NoEvent(OwnerID(),505918)
			CancelBuff_NoEvent(OwnerID(),505919)
			CancelBuff_NoEvent(OwnerID(),505518)
			CancelBuff_NoEvent(OwnerID(),505920)
			CancelBuff_NoEvent(OwnerID(),506136)
			return true
		end
	end
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID ) -- �򥻪k�NID
		if BuffID == 505918 then--���˪��A....
			CancelBuff_NoEvent(OwnerID(),505918)
			AddBuff(OwnerID(),505919,0,600)
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_YU_GUILDWAR_BUILD_52]" , 0 );
			ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_YU_GUILDWAR_BUILD_52]" , 0 );
			return true
		elseif BuffID == 505919 then--���˪��A....
			CancelBuff_NoEvent(OwnerID(),505919)
			AddBuff(OwnerID(),505920,0,600)
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_YU_GUILDWAR_BUILD_52]" , 0 );
			ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_YU_GUILDWAR_BUILD_52]" , 0 );
			return true
		elseif BuffID == 505920 then--�a�a�@��....
--			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_YU_GUILDWAR_BUILD_51]" , 0 );
--			ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_YU_GUILDWAR_BUILD_51]" , 0 );
			return true
		end
	end
	return true
end

function Event_GuildWarInit(RoomID)	--���|���J������l�Ƽ@��
	local BB = CreateObj(100292,3117,1681,0,268,1)
	SetModeEx( BB, EM_SetModeType_Strikback, false )--����
	SetModeEx( BB, EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( BB, EM_SetModeType_Obstruct, false )--����
	SetModeEx( BB, EM_SetModeType_Mark, false )--�аO
	SetModeEx( BB, EM_SetModeType_Move, false )--����
	SetModeEx( BB , EM_SetModeType_NotShowHPMP, true )--����ܦ��
	SetModeEx( BB, EM_SetModeType_Searchenemy, false )--����
	SetModeEx( BB, EM_SetModeType_HideName, true )--�W��
	SetModeEx( BB, EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( BB, EM_SetModeType_Fight , false )--�i�������
	SetModeEx( BB, EM_SetModeType_Show, false )--���
	SetModeEx( BB, EM_SetModeType_Drag , false )--���O
	AddToPartition( BB , RoomID)
	BeginPlot(BB,"LuaZone_GUILDWAR_Main",0)
end

function LuaZone_GUILDWAR_BuildFlag()
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local LandMarkID = ReadRoleValue( OwnerID(), EM_RoleValue_PID );
	local CampID = GetRoleCampID( OwnerID() );
	if GuildWarSetting[RoomID]["FlagID"][LandMarkID] == nil then
		GuildWarSetting[RoomID]["FlagID"][LandMarkID] = {}
	end
	local FlagID
	if CampID == 7 then	--BLUE
		FlagID = 113701
	else	--RED
		FlagID = 113700
	end
	local Flag = {}
	Flag[1] = CreateObjByFlag( FlagID , 780235 , 2*(LandMarkID-2)-1 , 1 ) 
	Flag[2] = CreateObjByFlag( FlagID , 780235 , 2*(LandMarkID-2)-2 , 1 ) 
	for i = 1 , 2 do
		SetModeEx( Flag[i], EM_SetModeType_Strikback, false )--����
		SetModeEx( Flag[i], EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
		SetModeEx( Flag[i], EM_SetModeType_Obstruct, true )--����
		SetModeEx( Flag[i], EM_SetModeType_Mark, true )--�аO
		SetModeEx( Flag[i], EM_SetModeType_Move, false )--����
		SetModeEx( Flag[i], EM_SetModeType_Searchenemy, false )--����
		SetModeEx( Flag[i], EM_SetModeType_HideName, true )--�W��
		SetModeEx( Flag[i], EM_SetModeType_ShowRoleHead, false )--�Y����
		SetModeEx( Flag[i], EM_SetModeType_Fight , false )--�i�������
		SetModeEx( Flag[i], EM_SetModeType_Drag , true )--���O
		AddToPartition(Flag[i] , RoomID)
		BeginPlot( Flag[i] , "Yuyu_GuildWarBuliding_BigSP2_00" , 0)
		WriteRoleValue( Flag[i], EM_RoleValue_PID, LandMarkID );			--�N�����s���O���bpid
		GuildWarSetting[RoomID]["FlagID"][LandMarkID][i]= Flag[i]
		SetRoleCampID( Flag[i], CampID );
	end
	BeginPlot(OwnerID(),"LuaZone_GUILDWAR_BuildGuard",0)
end
function LuaZone_GUILDWAR_BuildGuard()
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local LandMarkID = ReadRoleValue( OwnerID(), EM_RoleValue_PID );
	local CampID = GetRoleCampID( OwnerID() );
	local ServerMaxLv = GetIniValueSetting("MaxRoleLevel")	-- Ū�����A���]�w�����ŤW��
	if GuildWarSetting[RoomID]["Guard"][LandMarkID] == nil then
		GuildWarSetting[RoomID]["Guard"][LandMarkID] = {}
	end
	local GuardID
	local GuardBoss
	if CampID == 7 then	--BLUE
		GuardBoss = 103144
		GuardID = 103314
	else	--RED
		GuardBoss = 103143
		GuardID = 103313
	end
	local Guard = {}
	Guard[1] = CreateObjByFlag( GuardID , 780329 , 3*(LandMarkID-2)-1 , 1 ) 
	Guard[2] = CreateObjByFlag( GuardID , 780329 , 3*(LandMarkID-2)-2 , 1 ) 
	Guard[3] = CreateObjByFlag( GuardBoss , 780329 , 3*(LandMarkID-2)-3 , 1 ) 
	for i = 1 , 3 do
		WriteRoleValue( Guard[i], EM_RoleValue_LV , ServerMaxLv )--���ŷ|�H���A�����Ŷ}�񪺤W���Ӧ���
		SetModeEx( Guard[i], EM_SetModeType_Strikback, true )--����
		SetModeEx( Guard[i], EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
		SetModeEx( Guard[i], EM_SetModeType_Obstruct, false )--����
		SetModeEx( Guard[i], EM_SetModeType_Mark, true )--�аO
		SetModeEx( Guard[i], EM_SetModeType_Move, true )--����
		SetModeEx( Guard[i], EM_SetModeType_Searchenemy, true )--����
		SetModeEx( Guard[i], EM_SetModeType_HideName, true )--�W��
		SetModeEx( Guard[i], EM_SetModeType_ShowRoleHead, true )--�Y����
		SetModeEx( Guard[i], EM_SetModeType_Fight , true )--�i�������
		SetModeEx( Guard[i], EM_SetModeType_Drag , true )--���O
		AddToPartition(Guard[i] , RoomID)
		SetRoleCampID( Guard[i], CampID );
		WriteRoleValue( Guard[i], EM_RoleValue_PID, LandMarkID );			--�N�����s���O���bpid
		GuildWarSetting[RoomID]["Guard"][LandMarkID][i]= Guard[i]
		SetPlot( Guard[i] , "dead" , "Lua_GUILDWAR_GuardDead" , 0 )
	end
	BeginPlot(OwnerID(),"Lua_GUILDWAR_GuardReviveClock",0)
end
function Lua_GUILDWAR_GuardReviveClock()
	local LandMarkID = ReadRoleValue( OwnerID(), EM_RoleValue_PID );
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local CampID = GetRoleCampID( OwnerID() );
	local GuardID
	local GuardBoss
	if CampID == 7 then	--BLUE
		GuardBoss = 103144
		GuardID = 103314
	else			--RED
		GuardBoss = 103143
		GuardID = 103313
	end
	local DeadClock = {-1,-1,-1}
	local Guard = {}
	while 1 do
		for i = 1 , 3 do
		--	DebugMsg( 0, RoomID ,"LandMarkID = "..LandMarkID.." DeadClock "..i.." ="..DeadClock[i])
			local GG = GuildWarSetting[RoomID]["Guard"][LandMarkID][i]
			local MonsterID = GuardID
			local index = i
			if i == 3 then
				MonsterID = GuardBoss
			end
			if DeadClock[i] ~= -1 then
			--	DebugMsg( 0, RoomID ," Reset ".."LandMarkID = "..LandMarkID.." DeadClock "..i.." ="..DeadClock[i])
				DeadClock[i] = DeadClock[i] + 1
			end
		--	Say(GG,"MyID = "..GG)
			if GG ~= 0 then
				if CheckID(GG) == true then
					if ReadRoleValue( GG ,EM_RoleValue_IsDead) == 1 then
					--	DebugMsg( 0, RoomID ," i am dead ".."LandMarkID = "..LandMarkID.." DeadClock "..i.." ="..DeadClock[i])
						if DeadClock[i] == -1 then
						--	DebugMsg( 0, RoomID ," Del Owner ".."LandMarkID = "..LandMarkID.." DeadClock "..i.." ="..DeadClock[i])
							DelObj(GG)
							GuildWarSetting[RoomID]["Guard"][LandMarkID][i] = 0
							DeadClock[i] = 0
						end
					end
				end
			end
			if DeadClock[i] >=300 then
				DeadClock[i] = -1
			--	DebugMsg( 0, RoomID ," CallPlot ######################")
			--	DebugMsg( 0, RoomID ," MonsterID = "..MonsterID.." index = "..index)
				local Obj = Role:new( OwnerID() ) 
				local BaseX = Obj :X()
			 	local BaseY = Obj :Y()
			 	local BaseZ = Obj :Z()
				local BaseDir = Obj:Dir()
				local BB = CreateObj( 100292 , BaseX, BaseY, BaseZ, BaseDir, 1 )
				SetModeEx( BB, EM_SetModeType_Strikback, false )--����
				SetModeEx( BB, EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
				SetModeEx( BB, EM_SetModeType_Obstruct, false )--����
				SetModeEx( BB, EM_SetModeType_Mark, false )--�аO
				SetModeEx( BB, EM_SetModeType_Move, false )--����
				SetModeEx( BB, EM_SetModeType_Searchenemy, false )--����
				SetModeEx( BB, EM_SetModeType_HideName, true )--�W��
				SetModeEx( BB, EM_SetModeType_ShowRoleHead, false )--�Y����
				SetModeEx( BB, EM_SetModeType_Fight , false )--�i�������
				SetModeEx( BB, EM_SetModeType_Show, false )--���
				SetModeEx( BB, EM_SetModeType_Drag , false )--���O
				SetModeEx( BB , EM_SetModeType_NotShowHPMP, true )--����ܦ��
				AddToPartition( BB , RoomID)
				CallPlot(BB,"Lua_GUILDWAR_GuardRevive",MonsterID,index,LandMarkID,CampID)
			end
		end
		Sleep(10)
	end
end

function Lua_GUILDWAR_GuardRevive(MonsterID,index,LandMarkID,CampID)	-- �u�í���
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local ServerMaxLv = GetIniValueSetting("MaxRoleLevel")	-- Ū�����A���]�w�����ŤW��
	local Guard = CreateObjByFlag( MonsterID , 780329 , 3*(LandMarkID-2)-index , 1 ) 
--	Debuglog(2 , "RoomID = "..RoomID.." CallPlot ###################### Susses")
--	DebugMsg( 0, RoomID ," CallPlot ###################### Susses")
--	Debuglog(2 , "RoomID = "..RoomID.." MonsterID = "..MonsterID.." index = "..index.." LandMarkID = "..LandMarkID)
--	DebugMsg( 0, RoomID ," MonsterID = "..MonsterID.." index = "..index)
	WriteRoleValue( Guard, EM_RoleValue_LV , ServerMaxLv )--���ŷ|�H���A�����Ŷ}�񪺤W���Ӧ���
	SetModeEx( Guard, EM_SetModeType_Strikback, true )--����
	SetModeEx( Guard, EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( Guard, EM_SetModeType_Obstruct, false )--����
	SetModeEx( Guard, EM_SetModeType_Mark, true )--�аO
	SetModeEx( Guard, EM_SetModeType_Move, true )--����
	SetModeEx( Guard, EM_SetModeType_Searchenemy, true )--����
	SetModeEx( Guard, EM_SetModeType_HideName, true )--�W��
	SetModeEx( Guard, EM_SetModeType_ShowRoleHead, true )--�Y����
	SetModeEx( Guard, EM_SetModeType_Fight , true )--�i�������
	SetModeEx( Guard, EM_SetModeType_Drag , true )--���O
	AddToPartition(Guard , RoomID)
	SetRoleCampID( Guard, CampID );
	WriteRoleValue( Guard, EM_RoleValue_PID, LandMarkID );			--�N�����s���O���bpid
	GuildWarSetting[RoomID]["Guard"][LandMarkID][index]= Guard
	SetPlot( Guard , "dead" , "Lua_GUILDWAR_GuardDead" , 0 )
	DelObj(OwnerID())
end

function LuaZone_GUILDWAR_Main()
	SetZoneReviveScript( "LuaZone_GUILDWAR_Revive" );
	SetZonePVPScript( "LuaZone_GUILDWAR_PVPDead" );
	local ZoneID =  ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID ) 
	local Zone = ZoneID -1000*math.floor( ZoneID / 1000 )
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )
	local ServerMaxLv = GetIniValueSetting("MaxRoleLevel")	-- Ū�����A���]�w�����ŤW��
	if RoomID == 0 then
		--return
	end
	if CrystalOwn == nil then
		CrystalOwn = {}
	end
	if GuildWarSetting == nil then
		GuildWarSetting = {}
	end
	--2012.06.12 �ץ����|����(Zone 402)�ؿv - �M�Ҽt�B�A�СB���t�A��������o�޳N���šA�|�b�U�@�����|�����~�Ӫ����D
	if Z402_AreaBuff == nil then
		Z402_AreaBuff = {}
	end
	Z402_AreaBuff[RoomID] = {}	-- �N�� Room �������ܼ��k�s�A�קK��o�޳N�����~�Ӫ����~�o��
	--
	CrystalOwn[RoomID]= {}
	GuildWarSetting[RoomID]= {}
	GuildWarSetting[RoomID]["FlagID"]= {}
	GuildWarSetting[RoomID]["Guard"]= {}
	GuildWarSetting[RoomID]["building"]= {}
	GuildWarSetting[RoomID]["vehicle"]= {}
	GuildWarSetting[RoomID]["Kill"]= {}
	GuildWarSetting[RoomID]["energy"]= {}
	GuildWarSetting[RoomID]["MainObj"] = {}
	GuildWarSetting[RoomID]["building"][1]		= 110	--�i�ؿv���j�෽�V���ɶ�
	GuildWarSetting[RoomID]["building"][2]		= 1	--�i�ؿv���j�෽�V���q
	GuildWarSetting[RoomID]["building"][3]		= 1	--�i�V���෽�j��o���Z�ƶq
	GuildWarSetting[RoomID]["vehicle"][1]		= 1	--�i����j�ؿv�ɶ�	
	GuildWarSetting[RoomID]["vehicle"][2]		= 1	--�i����j�һݯ෽	
	GuildWarSetting[RoomID]["vehicle"][3]		= 1	--�i����j�һݾ��Z	
	GuildWarSetting[RoomID]["Kill"][1]		= 20	--�i���H�j��o���Z�ƶq
	GuildWarSetting[RoomID]["Kill"][2]		= 50	--�i���x�Ϊ��j��o���Z�ƶq
	GuildWarSetting[RoomID]["Kill"][3]		= 100	--�i������I�j��o���Z�ƶq
	GuildWarSetting[RoomID]["Kill"][4]		= 200	--�i����j���I�j��o���Z�ƶq
	GuildWarSetting[RoomID]["Kill"][5]		= 100	--�i�����ŵ׭^�j��o���Z�ƶq
	GuildWarSetting[RoomID]["Kill"][6]		= 50	--�i���׭^�j��o���Z�ƶq
	GuildWarSetting[RoomID]["energy"][1]		= 	10	--�i�a�A������q�W�[�q�j7
	GuildWarSetting[RoomID]["energy"][2]		= 	10	--�i�a�A������q�W�[�q�j8
	GuildWarSetting[RoomID]["energy"][3]		= 	5000	--�i��q�`�ơj���|�J
	GuildWarSetting[RoomID]["energy"][4]		= 	5000	--�i��q�`�ơj���Ǽw
	GuildWarSetting[RoomID]["energy"][5]		= 	5000	--�i��q�`�ơj�ƺ��S
	GuildWarSetting[RoomID]["energy"][6]		= 	5000	--�i��q�`�ơj������
	GuildWarSetting[RoomID]["energy"][7]		= 	5000	--�i��q�`�ơj�R�ĩ_
	GuildWarSetting[RoomID]["energy"][8]		= 	5000	--�i��q�`�ơj�֥���
	GuildWarSetting[RoomID]["MainObj"][1]		= 0	--�a�A����
	GuildWarSetting[RoomID]["MainObj"][2]		= 0	--�a�A����
	GuildWarSetting[RoomID]["MainObj"][3]		= 0	--�@�ɩ_�[�p�ɾ�
	GuildWarSetting[RoomID]["MainObj"][4]		= 0	--�@�ɩ_�[�p�ɾ�
	
	local CheckOK = 0
	local GateID = {}
	local Setp = 0
	local CrystalObj = {}
	local CrystalMainObj = {}
	--���ͤ���
	--�p�� 111264
	--�p�� 111261
	--�p�� 111258
	--�p�� 114335
	--�p�� 114336
	for i=1, 6 do 
		if i%2 == 1 then
			CrystalObj[i] = CreateObjByFlag( 114336 , 780288 , i-1 , 1 ) 
		else
			CrystalObj[i] = CreateObjByFlag( 114335 , 780288 , i-1 , 1 ) 
		end
		SetModeEx( CrystalObj[i], EM_SetModeType_Strikback, false )--����
		SetModeEx( CrystalObj[i], EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
		SetModeEx( CrystalObj[i], EM_SetModeType_Obstruct, true )--����
		SetModeEx( CrystalObj[i], EM_SetModeType_Mark, true )--�аO
		SetModeEx( CrystalObj[i], EM_SetModeType_Move, false )--����
		SetModeEx( CrystalObj[i], EM_SetModeType_Searchenemy, false )--����
		SetModeEx( CrystalObj[i], EM_SetModeType_HideName, true )--�W��
		SetModeEx( CrystalObj[i], EM_SetModeType_ShowRoleHead, false )--�Y����
		SetModeEx( CrystalObj[i], EM_SetModeType_Fight , false )--�i�������
		SetModeEx( CrystalObj[i], EM_SetModeType_Drag , true )--���O
		SetModeEx( CrystalObj[i], EM_SetModeType_Gravity, true )--���O
		AddToPartition(CrystalObj[i] , RoomID)
		SetPosByFlag( CrystalObj[i] , 780288, i-1 )
		SetPlot( CrystalObj[i] , "touch" , "Lua_GUILDWAR_StealCrystal" , 25 )
		SetPlot( CrystalObj[i] , "range" , "Lua_GUILDWAR_CrystalRange" , 300 )
	--	Debuglog(2 , "Create CrystalObj = "..i.." and RoomID = "..RoomID)
		--�]�w�����������
		WriteRoleValue( CrystalObj[i], EM_RoleValue_PID, i+2 );			--�N�����s���O���bpid
		local OBJPID = ReadRoleValue(CrystalObj[i], EM_RoleValue_PID)
		local pX = ReadRoleValueFloat(CrystalObj[i],EM_RoleValue_X)
		local pY = ReadRoleValueFloat(CrystalObj[i],EM_RoleValue_Y)
		local pZ = ReadRoleValueFloat(CrystalObj[i],EM_RoleValue_Z)
		local pName = "GUILDWAR_LANDMARK_NAME_" ..OBJPID
		--�]�w�����֦��}��
		if i%2 == 1 then
			CrystalOwn[RoomID][i+2]=1
			SetMapMark ( RoomID , i+1 , pX , pY , pZ , pName , 59 )
		--	Debuglog(2 , "RoomID = "..RoomID.." i = "..i.." pX = "..pX.." pY = "..pY.." pZ = "..pZ.." pName = "..pName)
			SetRoleCampID( CrystalObj[i], 7 );	
		else
			CrystalOwn[RoomID][i+2]=2			
			SetMapMark ( RoomID , i+1 , pX , pY , pZ , pName , 58 )
		--	Debuglog(2 , "RoomID = "..RoomID.." i = "..i.." pX = "..pX.." pY = "..pY.." pZ = "..pZ.." pName = "..pName)
			SetRoleCampID( CrystalObj[i], 8 );	
		end
		BeginPlot( CrystalObj[i] , "LuaZone_GUILDWAR_BuildFlag" , 0)
	end
	local DefTower = {}
	for i=1, 8 do 
		if i<5 then
			DefTower[i] = CreateObjByFlag( 102756 , 780005 , i-1 , 1 ) 
		else
			DefTower[i] = CreateObjByFlag( 102756 , 780005 , i-1 , 1 ) 
		end
		WriteRoleValue( DefTower[i], EM_RoleValue_LV , ServerMaxLv )--���ŷ|�H���A�����Ŷ}�񪺤W���Ӧ���
		SetModeEx( DefTower[i], EM_SetModeType_Strikback, false )--����
		SetModeEx( DefTower[i], EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
		SetModeEx( DefTower[i], EM_SetModeType_Obstruct, false )--����
		SetModeEx( DefTower[i], EM_SetModeType_Mark, true )--�аO
		SetModeEx( DefTower[i], EM_SetModeType_Move, true )--����
		SetModeEx( DefTower[i], EM_SetModeType_Searchenemy, false )--����
		SetModeEx( DefTower[i], EM_SetModeType_HideName, true )--�W��
		SetModeEx( DefTower[i], EM_SetModeType_ShowRoleHead, true )--�Y����
		SetModeEx( DefTower[i], EM_SetModeType_Fight , true )--�i�������
		SetModeEx( DefTower[i], EM_SetModeType_Drag , false  )--���O
		AddToPartition(DefTower[i] , RoomID)
	--	SetPosByFlag( DefTower[i] , 780005, i-1 )
		--�]�w���m�b��������
		if i<5 then
			SetRoleCampID( DefTower[i], 8 );	
		else
			SetRoleCampID( DefTower[i], 7 );	
		end
	end
 --	//���M�ж����Y�ӥ����s�ժ�����
	--	int		SetSearchAllNPC_ByGroupID( int RoomID , int GroupID );
	--	//���󪺰Ѧ��I�W�ت���
	--	int		CreateObj_ByObjPoint	( int GItemID , int ObjID , const char* Point );
		--���ͥD������
	local CastleCampID = {}
	local Obj
	local Count = SetSearchAllNPC_ByGroupID(RoomID,1)	--�j�M�����s��npc
--	Debuglog(2 , "@@@@@@@@Count = "..Count)
	if Count ~= 0 then
		for i = 1 , Count , 1 do
			local ID = GetSearchResult()
			Obj = Role:New( ID )
			local CampID = GetRoleCampID(ID)
			-- 2013.10.24 ���E:�ץ�6.0.3��s�W�������~�[�A�b���|���Զ}�l��A������B�����I�P�o�ۥx�ؿv�I���|�X�{�����D
			-- ���|���D��(����)
			local Main_Building = {
						111415 ,	-- �@��
						114038 ,	-- �G��
						115908 ,	-- �T��
						120877 ,	-- �ӫ��~�[1
						121240 ,	-- �ӫ��~�[2
						121245 ,	-- �ӫ��~�[3
						121250 ,	-- �ӫ��~�[4
						122262 ,	-- �ӫ��~�[5
						122267 ,	-- �ӫ��~�[6
						122272	-- �ӫ��~�[7
								}
			--���|����ֹ(����)
			local Fortification = {
						111414 ,	-- �@��
						114215 ,	-- �G��
						115909 ,	-- �T��
						120876 ,	-- �ӫ��~�[1
						121239 ,	-- �ӫ��~�[2
						121244 ,	-- �ӫ��~�[3
						121249 ,	-- �ӫ��~�[4
						122261 ,	-- �ӫ��~�[5
						122266 ,	-- �ӫ��~�[6
						122271	-- �ӫ��~�[7
								}

			for GUID = 1 , #Main_Building , 1 do
				if ReadRoleValue( ID , EM_RoleValue_OrgID ) == Main_Building[GUID] then
					if CampID == 7 then
						CastleCampID[1] = ID	--�Ŷ��D��
					elseif  CampID == 8 then
						CastleCampID[2] = ID	--�����D��
					end
				end
			end

			for GUID = 1 , #Fortification , 1 do
				if ReadRoleValue( ID , EM_RoleValue_OrgID ) == Fortification[GUID] then
					if CampID == 7 then
						CastleCampID[3] = ID	--�Ŷ�����
					elseif  CampID == 8 then
						CastleCampID[4] = ID	--��������
					end
				end
			end
		end	
	end
	local AttackTower = {}
	local HideObj = {}
	for i=1, 2 do 
		local BarBette = {}
		if i%2 == 1 then
			AttackTower[i] = CreateObj_ByObjPoint( CastleCampID[1] , 103316 , "flag_01")	--������
			HideObj[i] = CreateObj_ByObjPoint( CastleCampID[1] , 113693 , "flag_01")	--���ê���
			CrystalMainObj[i] = CreateObj_ByObjPoint( CastleCampID[1] , 113697 , "flag_01")	--����
			BarBette[1] = CreateObj_ByObjPoint( CastleCampID[3] , 113695 , "barbette_1")	--�o�ۥx�ؿv�I1
			BarBette[2] = CreateObj_ByObjPoint( CastleCampID[3] , 113695 , "barbette_2")	--�o�ۥx�ؿv�I2
			BarBette[3] = CreateObj_ByObjPoint( CastleCampID[3] , 113695 , "barbette_3")	--�o�ۥx�ؿv�I3
			BarBette[4] = CreateObj_ByObjPoint( CastleCampID[3] , 113695 , "barbette_4")	--�o�ۥx�ؿv�I4
		else
			AttackTower[i] = CreateObj_ByObjPoint( CastleCampID[2] , 103315 , "flag_01")	--������
			HideObj[i] = CreateObj_ByObjPoint( CastleCampID[1] , 113693 , "flag_01")	--���ê���
			CrystalMainObj[i] = CreateObj_ByObjPoint( CastleCampID[2] , 113696 , "flag_01")	--����
			BarBette[1] = CreateObj_ByObjPoint( CastleCampID[4] , 113695 , "barbette_1")	--�o�ۥx�ؿv�I1
			BarBette[2] = CreateObj_ByObjPoint( CastleCampID[4] , 113695 , "barbette_2")	--�o�ۥx�ؿv�I2
			BarBette[3] = CreateObj_ByObjPoint( CastleCampID[4] , 113695 , "barbette_3")	--�o�ۥx�ؿv�I3
			BarBette[4] = CreateObj_ByObjPoint( CastleCampID[4] , 113695 , "barbette_4")	--�o�ۥx�ؿv�I4
		end

		SetModeEx( CrystalMainObj[i], EM_SetModeType_Strikback, false )--����
		SetModeEx( CrystalMainObj[i], EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
		SetModeEx( CrystalMainObj[i], EM_SetModeType_Obstruct, true )--����
		SetModeEx( CrystalMainObj[i], EM_SetModeType_Mark, true )--�аO
		SetModeEx( CrystalMainObj[i], EM_SetModeType_Move, false )--����
		SetModeEx( CrystalMainObj[i], EM_SetModeType_Searchenemy, false )--����
		SetModeEx( CrystalMainObj[i], EM_SetModeType_HideName, true )--�W��
		SetModeEx( CrystalMainObj[i], EM_SetModeType_ShowRoleHead, false )--�Y����
		SetModeEx( CrystalMainObj[i], EM_SetModeType_Fight , false )--�i�������
		SetModeEx( CrystalMainObj[i], EM_SetModeType_Drag , true )--���O
		SetModeEx( CrystalMainObj[i], EM_SetModeType_Show, true )--���
		AddToPartition(CrystalMainObj[i] , RoomID)
		WriteRoleValue( AttackTower[i], EM_RoleValue_LV , ServerMaxLv )--���ŷ|�H���A�����Ŷ}�񪺤W���Ӧ���
		SetModeEx( AttackTower[i], EM_SetModeType_Strikback, true )--����
		SetModeEx( AttackTower[i], EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
		SetModeEx( AttackTower[i], EM_SetModeType_Obstruct, true )--����
		SetModeEx( AttackTower[i], EM_SetModeType_Mark, true )--�аO
		SetModeEx( AttackTower[i], EM_SetModeType_Move, false )--����
		SetModeEx( AttackTower[i], EM_SetModeType_Searchenemy, true )--����
		SetModeEx( AttackTower[i], EM_SetModeType_HideName, true )--�W��
		SetModeEx( AttackTower[i], EM_SetModeType_ShowRoleHead, true )--�Y����
		SetModeEx( AttackTower[i], EM_SetModeType_Fight , true )--�i�������
		SetModeEx( AttackTower[i], EM_SetModeType_Drag , true )--���O
		SetModeEx( AttackTower[i], EM_SetModeType_Show, true )--���
		AddToPartition(AttackTower[i] , RoomID)
		SetModeEx( HideObj[i], EM_SetModeType_Strikback, false )--����
		SetModeEx( HideObj[i], EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
		SetModeEx( HideObj[i], EM_SetModeType_Obstruct, false )--����
		SetModeEx( HideObj[i], EM_SetModeType_Mark, false )--�аO
		SetModeEx( HideObj[i], EM_SetModeType_Move, false )--����
		SetModeEx( HideObj[i], EM_SetModeType_Searchenemy, false )--����
		SetModeEx( HideObj[i] , EM_SetModeType_NotShowHPMP, true )--����ܦ��
		SetModeEx( HideObj[i], EM_SetModeType_HideName, true )--�W��
		SetModeEx( HideObj[i], EM_SetModeType_ShowRoleHead, false )--�Y����
		SetModeEx( HideObj[i], EM_SetModeType_Fight , false )--�i�������
		SetModeEx( HideObj[i], EM_SetModeType_Drag , false )--���O
		SetModeEx( HideObj[i], EM_SetModeType_Show, false )--���
		AddToPartition(HideObj[i] , RoomID)
		AddBuff( CrystalMainObj[i] ,502707 ,1 ,-1 ); --�D�԰������^�媺buff (ownerID,buff,LV,Time)
		WriteRoleValue( CrystalMainObj[i], EM_RoleValue_PID, i );			--�N�����s���O���bpid
		WriteRoleValue( HideObj[i], EM_RoleValue_PID, i );			--�N�����s���O���bpid
		WriteRoleValue(CrystalMainObj[i], EM_RoleValue_Register9,i )
		SetPlot( CrystalMainObj[i] , "touch" , "Lua_GUILDWAR_StealMainCrystal" , 50 )
		SetPlot( HideObj[i] , "range" , "Lua_GUILDWAR_MainCrystalRange" , 300 )
		GuildWarSetting[RoomID]["MainObj"][i] = CrystalMainObj[i]
		--�]�w�����֦��}��
		local pX = ReadRoleValueFloat(CrystalMainObj[i],EM_RoleValue_X)
		local pY = ReadRoleValueFloat(CrystalMainObj[i],EM_RoleValue_Y)
		local pZ = ReadRoleValueFloat(CrystalMainObj[i],EM_RoleValue_Z)
		local pName =	"SC_YU_GUILDWAR_BUILD_50"
	--	Debuglog(2 , "Create CrystalMainObj = "..i.." and RoomID = "..RoomID)
		--�]�w�����֦��}��
		if i%2 == 1 then
			for j = 1 , table.getn(BarBette) do
				AddToPartition(BarBette[j] , RoomID)
			--	Debuglog(2 , "Create BarBette = "..j.." and RoomID = "..RoomID.." ID = "..BarBette[j])
				SetRoleCampID( BarBette[j], 7 );
			end
			CrystalOwn[RoomID][1]=1
			SetMapMark ( RoomID , 0 , pX , pY , pZ , pName , 59 )
			SetRoleCampID( CrystalMainObj[i], 7 );
			SetRoleCampID( AttackTower[i], 7 );
		--	Debuglog(2 , "Create AttackTower = "..i.." and RoomID = "..RoomID.." ID = "..AttackTower[i])
		else
			for j = 1 , table.getn(BarBette) do
				AddToPartition(BarBette[j] , RoomID)
		--		Debuglog(2 , "Create BarBette = "..j.." and RoomID = "..RoomID.." ID = "..BarBette[j])
				SetRoleCampID( BarBette[j], 8 );
			end
			CrystalOwn[RoomID][2]=2
			SetMapMark ( RoomID , 1 , pX , pY , pZ , pName , 58 )
			SetRoleCampID( CrystalMainObj[i], 8 );
			SetRoleCampID( AttackTower[i], 8 );
		--	Debuglog(2 , "Create AttackTower = "..i.." and RoomID = "..RoomID.." ID = "..AttackTower[i])
		end
	end

	-- 2013.07.11 YoYo�G�s�W�d�����׽u�����\��A�����d�����𥴤H�C
	local BlockLineFlag = 780234	--�d�����׽u�M�Ϊ��X��
	--���׽u�X�аƽs��������m�p�U�G
	--�~����
	--       �Ŷ�                            ����
	--[7]-[9]-[8]-[4]           [17]-[19][18]-[14]
	--[6]             [3]	          [16]                [13]
	--[5]             [2]	          [15]                [12]
	--[1]----------[0]	          [11]------------[10]
	--������
	--   �Ŷ�          ����
	--[35]-[37]    [40]-[38]
	--[34]-[36]    [41]-[39]
	
	local BPX = {}	--�X��X�y��Table
	local BPY = {}	--�X��Y�y��Table
	local BPZ = {}	--�X��Z�y��Table
	local BPDir = {}	--�X�Ш���Table
	
	for I = 0 , 41 do	--�ƽs���ثe��41��
		BPX[ I ] , BPY[ I ] , BPZ[ I ] , BPDir[ I ] = DW_Location( BlockLineFlag , I ) --���o���׽u�X�Ъ��y�лP���V
	end
	AddLineBlock( RoomID , 100 , BPX[ 0 ] , BPZ[ 0 ] , BPX[ 1 ] , BPZ[ 1 ] )	--�s�W���׽u�G�Ŷ� - ����
	AddLineBlock( RoomID , 101 , BPX[ 0 ] , BPZ[ 0 ] , BPX[ 2 ] , BPZ[ 2 ] )	--�s�W���׽u�G�Ŷ� - �k���� (���|�J)
	AddLineBlock( RoomID , 102 , BPX[ 3 ] , BPZ[ 3 ] , BPX[ 4 ] , BPZ[ 4 ] )	--�s�W���׽u�G�Ŷ� - �k�e�� (���|�J)
	AddLineBlock( RoomID , 103 , BPX[ 1 ] , BPZ[ 1 ] , BPX[ 5 ] , BPZ[ 5 ] )	--�s�W���׽u�G�Ŷ� - ������ (�R�ĩ_)
	AddLineBlock( RoomID , 104 , BPX[ 6 ] , BPZ[ 6 ] , BPX[ 7 ] , BPZ[ 7 ] )	--�s�W���׽u�G�Ŷ� - ���e�� (�R�ĩ_)
	AddLineBlock( RoomID , 105 , BPX[ 4 ] , BPZ[ 4 ] , BPX[ 8 ] , BPZ[ 8 ] )	--�s�W���׽u�G�Ŷ� - �e�k��
	AddLineBlock( RoomID , 106 , BPX[ 7 ] , BPZ[ 7 ] , BPX[ 9 ] , BPZ[ 9 ] )	--�s�W���׽u�G�Ŷ� - �e����
	
	AddLineBlock( RoomID , 200 , BPX[ 10 ] , BPZ[ 10 ] , BPX[ 11 ] , BPZ[ 11 ] )	--�s�W���׽u�G���� - ����
	AddLineBlock( RoomID , 201 , BPX[ 10 ] , BPZ[ 10 ] , BPX[ 12 ] , BPZ[ 12 ] )	--�s�W���׽u�G���� - �k���� (������)
	AddLineBlock( RoomID , 202 , BPX[ 13 ] , BPZ[ 13 ] , BPX[ 14 ] , BPZ[ 14 ] )	--�s�W���׽u�G���� - �k�e�� (������)
	AddLineBlock( RoomID , 203 , BPX[ 11 ] , BPZ[ 11 ] , BPX[ 15 ] , BPZ[ 15 ] )	--�s�W���׽u�G���� - ������ (���Ǽw)
	AddLineBlock( RoomID , 204 , BPX[ 16 ] , BPZ[ 16 ] , BPX[ 17 ] , BPZ[ 17 ] )	--�s�W���׽u�G���� - ���e�� (���Ǽw)
	AddLineBlock( RoomID , 205 , BPX[ 14 ] , BPZ[ 14 ] , BPX[ 18 ] , BPZ[ 18 ] )	--�s�W���׽u�G���� - �e�k��
	AddLineBlock( RoomID , 206 , BPX[ 17 ] , BPZ[ 17 ] , BPX[ 19 ] , BPZ[ 19 ] )	--�s�W���׽u�G���� - �e����
	
	AddLineBlock( RoomID , 110 , BPX[ 34 ] , BPZ[ 34 ] , BPX[ 35 ] , BPZ[ 35 ] )	--�s�W���׽u�G�Ŷ� - ��������
	AddLineBlock( RoomID , 111 , BPX[ 34 ] , BPZ[ 34 ] , BPX[ 36 ] , BPZ[ 36 ] )	--�s�W���׽u�G�Ŷ� - �����k�� (���|�J)
	AddLineBlock( RoomID , 112 , BPX[ 35 ] , BPZ[ 35 ] , BPX[ 37 ] , BPZ[ 37 ] )	--�s�W���׽u�G�Ŷ� - �������� (�R�ĩ_)
	AddLineBlock( RoomID , 113 , BPX[ 36 ] , BPZ[ 36 ] , BPX[ 37 ] , BPZ[ 37 ] )	--�s�W���׽u�G�Ŷ� - �����e��
	
	AddLineBlock( RoomID , 210 , BPX[ 38 ] , BPZ[ 38 ] , BPX[ 39 ] , BPZ[ 39 ] )	--�s�W���׽u�G���� - �������� 
	AddLineBlock( RoomID , 211 , BPX[ 38 ] , BPZ[ 38 ] , BPX[ 40 ] , BPZ[ 40 ] )	--�s�W���׽u�G���� - �����k�� (������)
	AddLineBlock( RoomID , 212 , BPX[ 39 ] , BPZ[ 39 ] , BPX[ 41 ] , BPZ[ 41 ] )	--�s�W���׽u�G���� - �������� (���Ǽw)
	AddLineBlock( RoomID , 213 , BPX[ 40 ] , BPZ[ 40 ] , BPX[ 41 ] , BPZ[ 41 ] )	--�s�W���׽u�G���� - �����e��

--	Debuglog(2 , "ScriptFinish "..AttackTower[1].." Camp = "..GetRoleCampID(AttackTower[1]).." and "..AttackTower[2].." Camp = "..GetRoleCampID(AttackTower[2]))
	--�ˬd�U������
	while 1 do
	--	Debuglog(2 , "inLoop")
--		for i = 1 , 2 do
--			Say(CrystalMainObj[i],"MM MyCamp = "..GetRoleCampID(CrystalMainObj[i]))
--			Say(AttackTower[i],"QQ MyCamp = "..GetRoleCampID(AttackTower[i]))
--		end
		--Debuglog(2 , "%%%%CheckING....")

		--Debuglog(2 , "%%%%CheckING....GuildID = "..GuildID.." CampID = "..CampID)
		if GuildID ~= 0 then
			if CampID == 7 then
				AddGuildWarEnergy( OwnerID() , GuildWarSetting[RoomID]["energy"][2] )
				--Debuglog(2 , "%%%%GETENERY....GuildID = "..GuildID.." CampID = "..CampID)
			elseif  CampID == 8 then
				AddGuildWarEnergy( OwnerID() , GuildWarSetting[RoomID]["energy"][1] )
				--Debuglog(2 , "%%%%GETENERY....GuildID = "..GuildID.." CampID = "..CampID)
			end
		end
		local T1S = GetGuildWarScore_ByID(RoomID,0)
		local T2S = GetGuildWarScore_ByID(RoomID,1)
	--	DebugMsg( 0, RoomID ,"T1S = "..T1S.." T2S = "..T2S)
		Sleep(50)
	end
end

function LuaZone_GUILDWAR_PVPDead( KillerID , DeadID , ZoneID , ParallelZoneID , pRoomID )
--	DeBugMSG(0,ReadRoleValue(KillerID,EM_RoleValue_RoomID),"run LuaZone_GUILDWAR_PVPDead:")
	local KillerTeamID = GetRoleCampID( KillerID );
--	Debuglog(2 , "KillerID = "..KillerID.." DeadID = "..DeadID.." ZoneID = "..ZoneID)
	if( KillerTeamID ~= GetRoleCampID( DeadID ) ) then

		local RoomID = ReadRoleValue( KillerID, EM_RoleValue_RoomID );
		local NearPlayer = SearchRangePlayer(KillerID,200)	--�j�M�P�򪱮a
		local Score = GuildWarSetting[RoomID]["Kill"][1] 	--�i���H�j��o���Z�ƶq
		local Count = BuffCount ( DeadID)
		local REi = 0
		for i = 0 , Count do
			--�ˬd�O�_���x�Ϊ�
			if BuffID == 502970 or BuffID == 502971 then--�x�Ϊ�buff
				Score = GuildWarSetting[RoomID]["Kill"][2] --�i���x�Ϊ��j��o���Z�ƶq
			end
		end
		for j = 0 , table.getn(NearPlayer)-1 do
			if GetRoleCampID( KillerID ) ~= GetRoleCampID( NearPlayer[j] ) then
				--DebugMsg( 0, RoomID ,"PlayerName = "..GetName(NearPlayer[j]).." Not Same CampID.")
				REi = REi + 1
			end
		end
		local RK_Count = math.ceil(Score/(table.getn(NearPlayer)-REi))
	--	DebugMsg( 0, RoomID ,"RK_Count = "..RK_Count.." REi = "..REi)
		for i=0,table.getn(NearPlayer)-1 do
			if GetRoleCampID( KillerID ) == GetRoleCampID( NearPlayer[i] ) then
			---*---�H�U�P�_���a�O�_���ǲߧ޳N
				local SetA = -1
				local Count = BuffCount ( NearPlayer[i])
				for j = 0 , Count do
					local BuffID = BuffInfo ( NearPlayer[i] , j , EM_BuffInfoType_BuffID ) -- �򥻪k�NID
					if BuffID == 505317 then--�a�A�N�ӡG���Z��o�q�[�j
						local BuffLv = BuffInfo ( NearPlayer[i] , j , EM_BuffInfoType_Power )--�ӫؿv�� j ��BUFF������
						SetA = BuffLv
					end
				end
				if SetA>-1 then -- ��ܦ��׷Ҧ��ޯ�
					RK_Count = RK_Count+(SetA+1)
				end
				--DebugMsg( 0, RoomID ,"PlayerName = "..GetName(NearPlayer[i]).." Get "..RK_Count.." Score.")
				AddGuildWarPlayerValue( NearPlayer[i] ,4 , RK_Count )
				GiveBodyItem( NearPlayer[i] , 206685 , RK_Count )
				if	NearPlayer[i]~=KillerID	then
					AddGuildWarPlayerValue( NearPlayer[i], 0 , 1 );
				end
			end
		end
	end
end

function LuaZone_GUILDWAR_Revive()
	local	RoomID	= ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );

	-- �ϰ쭫�ͼ@��
	local 	TeamID	= GetRoleCampID( OwnerID() )
	local	X	= 0;
	local	Y	= 0;
	local	Z	= 0;
	local	Dir	= 0;

	if( TeamID == 7 ) then	
		X 	= 3758
		Y	= 2150
		Z 	= -19.7
		Dir	= 180
	else		
		X 	= -3758.4
		Y	= 2150
		Z 	= 20.1
		Dir	= 0
	end
	WriteRoleValue( OwnerID(), EM_RoleValue_X, X );
	WriteRoleValue( OwnerID(), EM_RoleValue_Y, Y );
	WriteRoleValue( OwnerID(), EM_RoleValue_Z, Z );
	WriteRoleValue( OwnerID(), EM_RoleValue_Dir, Dir );
	Lua_PVPAllFull( OwnerID())		--�ɺ����A
	AddBuff(OwnerID(), 500667, 0 , 10)	--���a���͵L��10��
end

--���Ҧ���zone���P�}�窱�a�I��BuffID ����ɶ�BuffTime
function Lua_GUILDWAR_ShareBuff(BuffID , BuffTime , Select )
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local CampID = GetRoleCampID( OwnerID() )	-- ���o���󪺰}��
	local Obj
	local Count = SetSearchAllPlayer(RoomID)
-- 2011.11.21 ���t�ӭn�D�A�ƼƦP�ؿvBuff���i���|�A���M��ӫؿv�̰����� --
	local BuildingGuildID = ReadRoleValue( OwnerID() , EM_RoleValue_GuildID )
	if Select == nil then
		Select = 0
	end
--
	if Count ~= 0 then
		for i = 1 , Count , 1 do
			local ID = GetSearchResult()
			Obj = Role:New( ID )
		--	if Obj:IsPlayer() == true then
				if GetRoleCampID( ID ) == CampID then
				--	CallPlot( ID , "Lua_GuildWar_Recall_BuildLv" , BuffID )
					AddBuff( ID , BuffID , 0 , BuffTime )
				--	DebugMsg( 0, RoomID ,"AddBuff = "..BuffID.." BuffTime = "..BuffTime)
				end
		--	end
		end	
		if Select == 1 then
			Z402_AreaBuff[RoomID][BuildingGuildID][BuffID] = Z402_AreaBuff[RoomID][BuildingGuildID][BuffID] + 1 -- �� 701636 �ŧi�������ܼ�
		end
	end
end

---------------------------------------------------------------------------
Function LuaI_206770(Option)
	local PlayerID = OwnerID()
	local PackageID = 206770
	local NeedSpace = 4
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , 206772 , 1 ) --�S�Ÿ˳�§��
		GiveBodyItem( PlayerID , 206774 , 1 ) --���|�^�m�](�j)
		GiveBodyItem( PlayerID , 203065 , 1 ) --1000�I�ޯ�y

		-- 5.0.2 �s�W���|boss�a����� ------------
		GiveBodyItem( PlayerID , 205690 , 3 ) --  �aģ���� x3
		-----------------------------------------

		GiveBodyItem( PlayerID , 203276 , 1 ) --1�U�I�g��y
	end
end
Function LuaI_206771(Option)
	local PlayerID = OwnerID()
	local PackageID = 206771
	local NeedSpace = 3
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , 206773 , 1 ) --���Ÿ˳�§��
		GiveBodyItem( PlayerID , 206775 , 1 ) --���|�^�m�](�p)

		-- 5.0.2 �s�W���|boss�a����� ------------
		GiveBodyItem( PlayerID , 205690 , 1 ) --  �aģ���� x1
		-----------------------------------------

		GiveBodyItem( PlayerID , 203064 , 1 ) --100�I�ޯ�y
	end
end
Function LuaI_206772(Option)
	local PlayerID = OwnerID()
	local PackageID = 206772
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		local PlayerLv = ReadRoleValue( PlayerID , EM_RoleValue_LV )
		local LvTable = { 55 ,  57 , 60 , 62 , 65 , 67 , 70 , 72 , 75 , 77 , 80 , 82 , 85 , 87 , 90 , 92 , 95 , 97 , 100 }
		local EqTable = { 724913 ,  725219 , 726679 , 726680 , 726681 , 726682 , 726683 , 726684 , 726685 , 726686 , 726687 , 726688 , 726689 , 726690 , 726691 , 726692 , 726693 , 726694 , 726695 }
		for I = 1 , #LvTable do
			if PlayerLv <= LvTable[ I ] then
				GiveBodyItem( PlayerID , EqTable[ I ] , 1 ) --�����������Ū��H���Ÿ�
				return
			end
		end
	end
end
Function LuaI_206773(Option)
	local PlayerID = OwnerID()
	local PackageID = 206773
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		local PlayerLv = ReadRoleValue( PlayerID , EM_RoleValue_LV )
		local LvTable = { 55 ,  57 , 60 , 62 , 65 , 67 , 70 , 72 , 75 , 77 , 80 , 82 , 85 , 87 , 90 , 92 , 95 , 97 , 100 }
		local EqTable = { 726660 ,  726661 , 726662 , 726663 , 726664 , 726665 , 726666 , 726667 , 726668 , 726669 , 726670 , 726671 , 726672 , 726673 , 726674 , 726675 , 726676 , 726677 , 726678 }
		for I = 1 , #LvTable do
			if PlayerLv <= LvTable[ I ] then
				GiveBodyItem( PlayerID , EqTable[ I ] , 1 ) --�����������Ū��H�����
				return
			end
		end
	end
end
Function LuaI_206774(Option)
	local PlayerID = OwnerID()
	local PackageID = 206774
	local NeedSpace = 3
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , 202916 , 1 ) --�]�����
		GiveBodyItem( PlayerID , 202917 , 1 ) --���̮֤�
		GiveBodyItem( PlayerID , 725113 , 1 ) --�H������
	end
end
Function LuaI_206775(Option)
	local PlayerID = OwnerID()
	local PackageID = 206775
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , 725113 , 1 ) --�H������
	end
end
function Lua_GUILDWAR_BuildDScript_0()	--500��

	SetModeEx(OwnerID(), EM_SetModeType_Fight , false )--�i�������
	local ObjID 	= CreateObjByObj( 114740 , OwnerID() , 1);
	BeginPlot(ObjID ,"Lua_GUILDWAR_BuildDScript_3",0)
	-- 2013.06.28 ���E�G�s�W���`�ɡA���y�T�w�d�򤺫��w����A�N���w����Ԧܦa��
	CallPlot( ObjID  , "Hao_GuildWar_Build_Dead_Plot" , 60 )
	--
	Sleep(30)
	DelObj(OwnerID())
end
function Lua_GUILDWAR_BuildDScript_1()	--700��

	SetModeEx(OwnerID(), EM_SetModeType_Fight , false )--�i�������
	local ObjID 	= CreateObjByObj( 114741 , OwnerID() , 1);
	BeginPlot(ObjID ,"Lua_GUILDWAR_BuildDScript_3",0)
	-- 2013.06.28 ���E�G�s�W���`�ɡA���y�T�w�d�򤺫��w����A�N���w����Ԧܦa��	
	CallPlot( ObjID , "Hao_GuildWar_Build_Dead_Plot" , 120 )
	--
	Sleep(30)
	DelObj(OwnerID())
end
function Lua_GUILDWAR_BuildDScript_2()	--1000��

	SetModeEx(OwnerID(), EM_SetModeType_Fight , false )--�i�������
	local ObjID 	= CreateObjByObj( 113698 , OwnerID() , 1);
	BeginPlot(ObjID ,"Lua_GUILDWAR_BuildDScript_3",0)
	-- 2013.06.28 ���E�G�s�W���`�ɡA���y�T�w�d�򤺫��w����A�N���w����Ԧܦa��	
	CallPlot( ObjID , "Hao_GuildWar_Build_Dead_Plot" , 120 )
	--
	Sleep(30)
	DelObj(OwnerID())
end
function Lua_GUILDWAR_BuildDScript_3()
	Sleep(35)
	DelObj(OwnerID())
end
function Lua_GUILDWAR_Monster20()
	AddBuff( OwnerID() , 505513 , 79, -1 )	--80%--����NPC�ˮ`��z �k�N���� 0 = 1%
	SetRandMove(OwnerID(),70, 30, 50 )	--�ߤl�üƽd�򤺲���  (150=�d��, 100=10�� , 20=�C�����ʶZ��)
	SetPlot( OwnerID() , "dead" , "Lua_GUILDWAR_MonsterDead20" , 0 )
end
function Lua_GUILDWAR_MonsterDead20()
	local	RoomID	= ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local	PlayerCampID	= GetRoleCampID( TargetID() );
	local 	OrgID 		= ReadRoleValue( OwnerID(), EM_RoleValue_OrgID );
	local	Score		= 20
	local NearPlayer = SearchRangePlayer(TargetID(),200)	--�j�M�P�򪱮a
	local PeopleCount =  table.getn(NearPlayer)
	for i = 0 , table.getn(NearPlayer)-1 do
		if GetRoleCampID( TargetID() ) ~= GetRoleCampID( NearPlayer[i] ) then
		--	DebugMsg( 0, RoomID ,"PlayerName = "..GetName(NearPlayer[i]).." Not Same CampID.")
			PeopleCount = PeopleCount - 1
		end
	end
	Score = math.ceil(Score/PeopleCount)
	--	DebugMsg( 0, RoomID ,"PeopleCount = "..PeopleCount.." Same Camp.")
	for i=0,table.getn(NearPlayer)-1 do
		if GetRoleCampID( TargetID() ) == GetRoleCampID( NearPlayer[i] ) then
		---*---�H�U�P�_���a�O�_���ǲߧ޳N
			local SetA = -1
			local Count = BuffCount ( NearPlayer[i])
			for j = 0 , Count do
				local BuffID = BuffInfo ( NearPlayer[i] , j , EM_BuffInfoType_BuffID ) -- �򥻪k�NID
				if BuffID == 505317 then--�a�A�N�ӡG���Z��o�q�[�j
					local BuffLv = BuffInfo ( NearPlayer[i] , j , EM_BuffInfoType_Power )--�ӫؿv�� j ��BUFF������
					SetA = BuffLv
				end
			end
			if SetA>-1 then -- ��ܦ��׷Ҧ��ޯ�
				Score = Score+(SetA+1)
			end
		--	DebugMsg( 0, RoomID ,"PlayerName = "..GetName(NearPlayer[i]).." Get "..Score.." Score.")
			AddGuildWarPlayerValue( NearPlayer[i] ,4 , Score )
			GiveBodyItem( NearPlayer[i] , 206685 , Score )
		end
	end
	return true
end
function Lua_GUILDWAR_Monster5()
	AddBuff( OwnerID() , 505513 , 89, -1 )	--90%--����NPC�ˮ`��z �k�N���� 0 = 1%
	SetRandMove(OwnerID(),70, 30, 50 )	--�ߤl�üƽd�򤺲���  (150=�d��, 100=10�� , 20=�C�����ʶZ��)
	SetPlot( OwnerID() , "dead" , "Lua_GUILDWAR_MonsterDead5" , 0 )
end
function Lua_GUILDWAR_MonsterDead5()
	local	RoomID	= ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local	PlayerCampID	= GetRoleCampID( TargetID() );
	local 	OrgID 		= ReadRoleValue( OwnerID(), EM_RoleValue_OrgID );
	local	Score		= 5
	local NearPlayer = SearchRangePlayer(TargetID(),200)	--�j�M�P�򪱮a
	local PeopleCount =  table.getn(NearPlayer)
	for i = 0 , table.getn(NearPlayer)-1 do
		if GetRoleCampID( TargetID() ) ~= GetRoleCampID( NearPlayer[i] ) then
		--	DebugMsg( 0, RoomID ,"PlayerName = "..GetName(NearPlayer[i]).." Not Same CampID.")
			PeopleCount = PeopleCount - 1
		end
	end
	Score = math.ceil(Score/PeopleCount)
--	DebugMsg( 0, RoomID ,"PeopleCount = "..PeopleCount.." Same Camp.")
	for i=0,table.getn(NearPlayer)-1 do
		if GetRoleCampID( TargetID() ) == GetRoleCampID( NearPlayer[i] ) then
		---*---�H�U�P�_���a�O�_���ǲߧ޳N
			local SetA = -1
			local Count = BuffCount ( NearPlayer[i])
			for j = 0 , Count do
				local BuffID = BuffInfo ( NearPlayer[i] , j , EM_BuffInfoType_BuffID ) -- �򥻪k�NID
				if BuffID == 505317 then--�a�A�N�ӡG���Z��o�q�[�j
					local BuffLv = BuffInfo ( NearPlayer[i] , j , EM_BuffInfoType_Power )--�ӫؿv�� j ��BUFF������
					SetA = BuffLv
				end
			end
			if SetA>-1 then -- ��ܦ��׷Ҧ��ޯ�
				Score = Score+(SetA+1)
			end
		--	DebugMsg( 0, RoomID ,"PlayerName = "..GetName(NearPlayer[i]).." Get "..Score.." Score.")
			AddGuildWarPlayerValue( NearPlayer[i] ,4 , Score )
			GiveBodyItem( NearPlayer[i] , 206685 , Score )
		end
	end
	return true
end
function Lua_GUILDWAR_EnterScript()
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local CampID = GetRoleCampID( OwnerID() );
	local Obj
	local Count = SetSearchAllPlayer(RoomID)
	local T1 = 0
	local T2 = 0
	local GuildID1 = 0
	local GuildID2 = 0
	if CampID == 7 then
		SetBattleGroundObjGUIDForceFlag(OwnerID(),223090)	--�I��I�X
	else
		SetBattleGroundObjGUIDForceFlag(OwnerID(),223091)	--�I��I�X
	end
	if Count ~= 0 then
		for i = 1 , Count , 1 do
			local ID = GetSearchResult()
			Obj = Role:New( ID )
			if Obj:IsPlayer() == true then
				if GetRoleCampID( ID ) == 7 then
					GuildID1 = ReadRoleValue(ID,EM_RoleValue_GuildID)
				--	DebugMsg( 0, RoomID ,"GuildID1 = "..GuildID1)
					T1 = T1 + 1
				elseif GetRoleCampID( ID ) == 8 then
					GuildID2 = ReadRoleValue(ID,EM_RoleValue_GuildID)
				--	DebugMsg( 0, RoomID ,"GuildID2 = "..GuildID2)
					T2 = T2 + 1
				end
			end
		end	
	end
	SetFlag( OwnerID()  , 543769 , 0 )--���a�b����W���X��
	WriteRoleValue( OwnerID() , EM_RoleValue_PID ,0)
	WriteRoleValue( OwnerID() , EM_RoleValue_Register1, 0 )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register2, 0 )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register3, 0 )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register4, 0 )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register5, 0 )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register6, 0 )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register7, 0 )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register8, 0 )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register9, 0 )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register10, 0 )
	CancelBuff_NoEvent(OwnerID(),502941)	--�M���{���buff
	CancelBuff( OwnerID() , 502931 )
	CancelBuff( OwnerID() , 502932 )
	CancelBuff( OwnerID() , 502933 )
--	Debuglog(2 , "#####$$$$$GUILDID....T1 = "..T1.." T2 = "..T2)
--	DebugMsg( 0, RoomID ,"T1 = "..T1.." T2 = "..T2)
	if T1 > 0 and T2 > 0 and GuildID1 ~= 0 and GuildID2 ~= 0 then
		WriteRoleValue(GuildWarSetting[RoomID]["MainObj"][1] , EM_RoleValue_GuildID,GuildID1)
		WriteRoleValue(GuildWarSetting[RoomID]["MainObj"][2] , EM_RoleValue_GuildID,GuildID2)
	--	Debuglog(2 , "#####$$$$$GUILDID....T1 = "..T1.." T2 = "..T2)
	--	DebugMsg( 0, RoomID ,"T1 = "..T1.." T2 = "..T2)
	end
	--2011.11.24 ���a�i�J���|���ԮɡA�̷�"��e"�M�Ҽt�B�A�СB���t�ҤɯŪ���ޡA�����������a�۹�������� Lv�C
	CallPlot( OwnerID() , "Lua_GuildWar_Recall_BuildLv" , 0 , 1 )
	--Lua_GuildWar_Recall_BuildLv( 0 , 1 )
	--
end
function Lua_GUILDWAR_WinnerClock()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID );
	local GuildID = ReadRoleValue(OwnerID(),EM_RoleValue_GuildID)
	local	ObjCampID	= GetRoleCampID( OwnerID() );
	local	LandMarkID	= ReadRoleValue( OwnerID(), EM_RoleValue_PID );
	local BB = CreateObj(100292,3117,1681,0,268,1)
	SetModeEx( BB, EM_SetModeType_Strikback, false )--����
	SetModeEx( BB, EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( BB, EM_SetModeType_Obstruct, false )--����
	SetModeEx( BB, EM_SetModeType_Mark, false )--�аO
	SetModeEx( BB, EM_SetModeType_Move, false )--����
	SetModeEx( BB , EM_SetModeType_NotShowHPMP, true )--����ܦ��
	SetModeEx( BB, EM_SetModeType_Searchenemy, false )--����
	SetModeEx( BB, EM_SetModeType_HideName, true )--�W��
	SetModeEx( BB, EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( BB, EM_SetModeType_Fight , false )--�i�������
	SetModeEx( BB, EM_SetModeType_Show, false )--���
	SetModeEx( BB, EM_SetModeType_Drag , false )--���O
	AddToPartition( BB , RoomID)
	SetRoleCampID( BB, ObjCampID );
	WriteRoleValue(BB, EM_RoleValue_GuildID,GuildID)
	local EnemyGuildName
	local GuildName
	local PlayerName
	local FullKey
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --�|Ū��u�ꪺ���y�ϰ�
	if( ObjCampID == 8 ) then 
		EnemyGuildName =  "|cffff3232"..GetGuildName_ByID( RoomID , ((CrystalOwn[RoomID][LandMarkID]+1)%2+1)%2 ).."|r"
		local orgid = ReadRoleValue( OwnerID(),EM_RoleValue_OrgID)
		PlayerName 	= "|cffff3232".."["..orgid.."]".."|r"
		GuildName  =  "|cff00ffff"..GetGuildName_ByID( RoomID , CrystalOwn[RoomID][LandMarkID]-1 ).."|r"
		FullKey 		= "[SC_YU_GUILDWAR_BUILD_78]" .. "[$SETVAR1="..EnemyGuildName.."][$SETVAR2="..PlayerName.."][$SETVAR3=" .. GuildName .. "]"
		GuildWarSetting[RoomID]["MainObj"][3] = BB
		if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
			RunningMsg( OwnerID() , 3 , FullKey) --�Q����
		end
	else
		EnemyGuildName =  "|cff00ffff"..GetGuildName_ByID( RoomID , ((CrystalOwn[RoomID][LandMarkID]+1)%2+1)%2 ).."|r"
		local orgid = ReadRoleValue( OwnerID(),EM_RoleValue_OrgID)
		PlayerName 	= "|cff00ffff".."["..orgid.."]".."|r"
		GuildName  =  "|cffff3232"..GetGuildName_ByID( RoomID , CrystalOwn[RoomID][LandMarkID]-1 ).."|r"
		FullKey 		= "[SC_YU_GUILDWAR_BUILD_78]" .. "[$SETVAR1="..EnemyGuildName.."][$SETVAR2="..PlayerName.."][$SETVAR3=" .. GuildName .. "]"
		GuildWarSetting[RoomID]["MainObj"][4] = BB
		if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
			RunningMsg( OwnerID() , 3 , FullKey) --�Q����
		end
	end
	BeginPlot( BB , "Lua_GUILDWAR_WinnerClockCount" , 0)	--�Ұʥ@�ɩ_�[
end
function Lua_GUILDWAR_WinnerClockCount()
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local Obj
	local Count = SetSearchAllPlayer(RoomID)
	local ObjCampID = GetRoleCampID( OwnerID() );
	local TimeC = 0
	local WinnerState = 0
	local Enemy = 7
	if ObjCampID == 7 then
		Enemy = 8
	end
	while 1 do
		local Count = SetSearchAllPlayer(RoomID)
		if TimeC >=300 then
			WinnerState = 1
			break
		end
		if Count ~= 0 then
			for i = 1 , Count , 1 do
				local ID = GetSearchResult()
				Obj = Role:New( ID )
				if Obj:IsPlayer() == true then
					if GetRoleCampID( ID ) == Enemy and TimeC%5 == 0 then
					--	DebugMsg( 0, RoomID ,"!!!!!!SendTime Time = "..TimeC.." ID = "..ID)
						--Say(ID,"GetTimerTime = "..TimeC)
						ClockClose( ID )
						ClockOpen( ID , EM_ClockCheckValue_12  , 300-TimeC , 300-TimeC , 0  ,"Lua_Clockending"  , "Lua_Clockending" );--�ɶ��H���
					end
				end
			end	
		end
	--	DebugMsg( 0, RoomID ,"!!!!!!Time = "..TimeC)
		TimeC = TimeC + 1
		Sleep(10)
	end
	if WinnerState == 1 then
		AddGuildWarScore(OwnerID(),10000)
	end
end
function Lua_GUILDWAR_WinnerClockStop()
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local Obj
	local Count = SetSearchAllPlayer(RoomID)
	local ObjCampID = GetRoleCampID( OwnerID() );
--	DebugMsg( 0, RoomID ,"!!!!!!ObjCampID = "..ObjCampID)
	if Count ~= 0 then
		for i = 1 , Count , 1 do
			local ID = GetSearchResult()
			Obj = Role:New( ID )
			if Obj:IsPlayer() == true then
				if GetRoleCampID( ID ) == ObjCampID then
				--	DebugMsg( 0, RoomID ,"!!!!!!Stop TimeClock")
					ClockClose( ID )
				end
			end
		end	
	end
end