function lua_star_Room2_1()
	--local temp_man = TargetID()
	SetPlot( OwnerID()  ,"touch", "" ,0 )	
	local pid = ReadRoleValue( OwnerID() , EM_RoleValue_PID  )	     -----Boss��q�Ȧs
	local player_temp = ReadRoleValue( OwnerID() , EM_RoleValue_Register1 ) 
	local fighter = LuaFunc_CreateObjByObj(101002 , OwnerID() )		
	WriteRoleValue( fighter , EM_RoleValue_PID , pid )              ----�NBoss��q�O����s���i�h��
	WriteRoleValue( fighter , EM_RoleValue_Register1 , player_temp )  ----�N���a��ưO����s���i�h��
	BeginPlot( fighter , "lua_star_Room2_2", 1 )
	Delobj( OwnerID() )			
end

function lua_star_Room2_2()
	local player_talk = ReadRoleValue( OwnerID() , EM_RoleValue_Register1 )
	local roomid3 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )	
	local pid = ReadRoleValue( OwnerID() , EM_RoleValue_PID  )
	local Obj = Role:new( OwnerID() ) 
	local BaseX = Obj :X()
	local BaseY = Obj :Y()
	local BaseZ = Obj :Z()
	local BaseDir = Obj:Dir()	
	Yell( OwnerID() , GetString("SC_111401_1") , 5)
	sleep(50)	
	Yell( OwnerID() , GetString("SC_111401_2") , 5)	                    ----�ڷ��]�O���F�o�ӥت��ӬD���N�J���A���N�p�A�{�b�ݨ쪺�A�ڥ��ѤF
	sleep(50)
	Yell( OwnerID() , GetString("SC_111401_3") , 5)	                    ----�A�̭n�p�ߥL���i�Ȫ����K�k�N�A��..........�����A�ڷP�즳�ѤO�q�b����
	sleep(20)
	local boss = CreateObj(100998, BaseX , BaseY, BaseZ, BaseDir -180, 1 )
	AddToPartition( boss , roomid3 )				
	WriteRoleValue( boss , EM_RoleValue_PID , 1 )
	BeginPlot( boss , "luaI_starboss1" , 0 )
	WriteRoleValue( boss , EM_RoleValue_HP , pid )	
	SetAttack( boss , player_talk )
	WriteRoleValue( boss , EM_RoleValue_PID , OwnerID() )            ----/*�����i�h����ID�A���F�P�_�̫����
	SetPlot( boss ,"dead","lua_star_bossdead2",500 )	
	ScriptMessage( boss , -1 , 2 , GetString("SC_100998_10") , 1 )
	Yell( boss, GetString("SC_100998_10") , 5)                         ----�N�J���n�����o�@���I
	sleep(20)
	Yell( OwnerID() , GetString("SC_111401_5") , 5)		               ----�ڨ����U�A�I
	--SetAttack( OwnerID() , boss )
	sleep(20)
	Yell( OwnerID() , GetString("SC_111401_8") , 5)	                   ----�ᤣ~���H�i�H�v���ڶ�?
	--SetModeEx( OwnerID() , EM_SetModeType_IgnoreNpcKill , true )  	------����NPC�����Ǫ�
end

function lua_star_Room3_1()
	--local temp_man = TargetID()
	SetPlot( OwnerID()  ,"touch", "" ,0 )
	local roomid3 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	--local temp_man = LuaFunc_CreateObjByObj( 101002 , TargetID() )
	local player_talk = ReadRoleValue( OwnerID() , EM_RoleValue_Register1 )
	local party_player = LuaFunc_PartyData( player_talk )
	local pid = ReadRoleValue( OwnerID() , EM_RoleValue_PID  )
	local Obj = Role:new( OwnerID() ) 
	local BaseX = Obj :X()
	local BaseY = Obj :Y()
	local BaseZ = Obj :Z()
	local BaseDir = Obj:Dir()
	--Delobj( TargetID() )
	Yell( OwnerID() , GetString("SC_111401_1") , 5)	                    ----�A�̬O���F�_�æӨӶܡH
	sleep(50)		
	Yell( OwnerID() , GetString("SC_111401_2") , 5)	                    ----�ڷ��]�O���F�o�ӥت��ӬD���N�J���A���N�p�A�{�b�ݨ쪺�A�ڥ��ѤF
	sleep(50)
	Yell( OwnerID() , GetString("SC_111401_3") , 5)	                    ----�A�̭n�p�ߥL���i�Ȫ����K�k�N�A��..........�����A�ڷP�즳�ѤO�q�b����
	sleep(20)				
	--CastSpell(OwnerID() , player_talk , 491307 )                      -----�i�h������	
	for i=1 , party_player[0] do
		AddBuff( party_player[i] , 502120 , 0 , -1 )
	end			
	local boss  = CreateObj(100998, BaseX , BaseY, BaseZ, BaseDir -180, 1 )
	AddToPartition( boss , roomid3 )			
	WriteRoleValue( boss , EM_RoleValue_PID , 1 )
	BeginPlot( boss , "luaI_starboss1" , 0 )
	WriteRoleValue( boss , EM_RoleValue_HP , pid )
	SetAttack( boss , player_talk )
	SetPlot( boss ,"dead","lua_star_bossdead",500 )
	ScriptMessage( boss , -1 , 2 , GetString("SC_100998_11") , 1 )
	Yell( boss, GetString("SC_100998_11") , 5)                         ----[���j�G�y] An'Sola  Shale	
	Yell( OwnerID() , GetString("SC_111401_6") , 5) 	                    ----�گవ���u���o�ˤF�A�O���I
	sleep(30)
	Delobj( OwnerID() )
end

function lua_star_Create(bossid , NowHP1 , artifactid , Xordinator , roomid2)
	local Obj = Role:new( bossid ) 
	local BaseX = Obj :X()
	local BaseY = Obj :Y()
	local BaseZ = Obj :Z()
	local BaseDir = Obj:Dir()
	local artifact1  = CreateObj(artifactid, BaseX +Xordinator, BaseY, BaseZ, BaseDir , 1 )	
	--local man = CreateObj(111401, BaseX +10, BaseY, BaseZ, BaseDir -180, 1 )
	AddToPartition( artifact1 , roomid2 )	
	WriteRoleValue( artifact1 , EM_RoleValue_PID , NowHP1 ) 
	DelFromPartition( bossid )
	return artifact1
end

function lua_star_createbox(temp_player1 , deadboss , boxid)	
	local roomid_player = ReadRoleValue( temp_player1 , EM_RoleValue_RoomID )
	local Obj = Role:new( deadboss ) 
	local BaseX = Obj :X()
	local BaseY = Obj :Y()
	local BaseZ = Obj :Z()
	local BaseDir = Obj:Dir()
	local treasurebox  = CreateObj(boxid, BaseX, BaseY, BaseZ, BaseDir , 1 )
	AddToPartition( treasurebox , roomid_player )
	return treasurebox
end

function lua_star_bossdead()
	local temp_player = TargetID()	
	local treasure1 = lua_star_createbox(temp_player , OwnerID() , 101033)
	SetFightMode( treasure1 , 0 , 0 , 0 , 0 )
	SetCursorType( treasure1 , 0)
	WriteRoleValue( treasure1 , EM_RoleValue_PID , temp_player )
	SetPlot( treasure1 ,"touch","lua_star_bossdead_1",40 )
end

function lua_star_bossdead_1()
	BeginPlot( TargetID(), "lua_star_bossdead_2", 1 )
end

function lua_star_bossdead_2()
	SetPlot( OwnerID() ,"touch", "" ,0 )
	local player_temp = ReadRoleValue( OwnerID() , EM_RoleValue_PID  )
	local party_killboss = LuaFunc_PartyData( player_temp )	 
	if( KillID( OwnerID() , OwnerID() ) == true ) then 
		for i = 1 , party_killboss[0] , 1 do
			lua_star_randomprize(party_killboss[i])
		end
	end	
end

function lua_star_bossdead2()
	local fighter1 = ReadRoleValue( OwnerID() , EM_RoleValue_PID  )	
	local roomid_fighter1 = ReadRoleValue( fighter1 , EM_RoleValue_RoomID )
	local treasure2 = lua_star_createbox( TargetID() , OwnerID() , 101033 )
	SetFightMode( treasure2 , 0 , 0 , 0 , 0 )
	SetCursorType( treasure2 , 0)
	SetPlot( treasure2 ,"touch","lua_star_bossdead_1",40 )
	WriteRoleValue( treasure2 , EM_RoleValue_PID , TargetID() )	
	if CheckID( fighter1 ) == true and ReadRoleValue( fighter1 , EM_RoleValue_IsDead ) == 0 then
		local original_man = lua_star_Create( fighter1 , 0 , 111401 , 0 , roomid_fighter1)	
		local player_now = ReadRoleValue( fighter1 , EM_RoleValue_Register1 )	
		SetCursorType( original_man , 1)
		WriteRoleValue( original_man  , EM_RoleValue_PID , player_now )	   ----�O�����a���
		SetPlot( original_man ,"touch","lua_star_bossdead2_1",40 )			
	end	
end

function lua_star_bossdead2_1()
	BeginPlot( TargetID() , "lua_star_bossdead2_2", 1 )
end

function lua_star_bossdead2_2()	
	SetPlot( OwnerID() ,"touch","",0 )
	local player_temp = ReadRoleValue( OwnerID() , EM_RoleValue_PID  )
	local party_killboss1 = LuaFunc_PartyData( player_temp )
	local random_reward1 = rand(99)
	Yell( OwnerID() , GetString("SC_111401_7") , 5)				
	for i = 1 , party_killboss1[0] , 1 do
		if random_reward1 >= 0 and random_reward1 < 9 then
			GiveBodyItem( party_killboss1[i] , 203017, 1 )  --��������	
			GiveBodyItem( party_killboss1[i] , 202985, 3 )
			GiveBodyItem( party_killboss1[i] , 202984, 3 )	
		else				
			GiveBodyItem( party_killboss1[i] , 202988, 1 )  --���V����
			GiveBodyItem( party_killboss1[i] , 202987, 1 )  --��մ���
			GiveBodyItem( party_killboss1[i] , 202986, 1 )  --���۸H��
			GiveBodyItem( party_killboss1[i] , 202989, 1 )  --�Q�d�H��
			GiveBodyItem( party_killboss1[i] , 203014, 1 )  --�������W���_��							
		end
	end
	Delobj( OwnerID() )	
end

function lua_star_bossdead3()
	local temp_player = TargetID()	
	local treasure3 = lua_star_createbox(temp_player , OwnerID() , 101034 )
	SetFightMode( treasure3 , 0 , 0 , 0 , 0 )
	SetCursorType( treasure3 , 0)
	WriteRoleValue( treasure3 , EM_RoleValue_PID , temp_player )
	SetPlot( treasure3 ,"touch","lua_star_bossdead3_1",40 )
end

function lua_star_bossdead3_1()
	BeginPlot( TargetID() , "lua_star_bossdead3_2", 1 )
end

function lua_star_bossdead3_2()
	SetPlot( OwnerID() ,"touch", "" ,0 )
	local player_temp = ReadRoleValue( OwnerID() , EM_RoleValue_PID  )
	local party_killboss = LuaFunc_PartyData( player_temp )
	if( KillID( OwnerID() , OwnerID() ) == true ) then 	 
		for i = 1 , party_killboss[0] , 1 do
			lua_star_randomprize(party_killboss[i])
		end
	end
end