function LuaI_114899_0_easy()		
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Save = ReadInstanceArg( RoomID , 0 )
	if Zone123_TunnelControl == nil then
		Zone123_TunnelControl = {}
	end	
	Zone123_TunnelControl[RoomID] = {}
	Zone123_TunnelControl[RoomID]["Tunnel"] = {}
	Zone123_TunnelControl[RoomID]["State"] = {}
	
	for i = 1 , 8 , 1 do
		Zone123_TunnelControl[RoomID]["Tunnel"][i] = 0
		Zone123_TunnelControl[RoomID]["State"][i] = 0
	end 	
end

function LuaI_123_TranPoint()
	local PID = ReadRoleValue( OwnerID() , EM_RoleValue_PID)
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Me = Role:new( OwnerID() )
	local Auro 
	Hide( OwnerID() )
 	Lua_ObjDontTouch( OwnerID() )
	sleep( 30 )
	Show( OwnerID() , RoomID )
	AddBuff( OwnerID() , 504098 , 0 , -1 )
	SetPlot( OwnerID() , "range" , "LuaI_123_TranPoint_0" , 40 )
	Zone123_TunnelControl[RoomID]["State"][PID] = OwnerID()
	
	local Save = ReadInstanceArg(RoomID , 0)
	
	if PID > 1 then				
		for i=8 , 2 , -1 do
			if Save >= math.pow(10 , i-2) then
				Save = Save - math.pow(10 , i-2)
				if PID == i then
					Zone123_TunnelControl[RoomID]["Tunnel"][i] = 1
					Auro = CreateObj( 114296 ,Me:X(), Me:Y() ,Me:Z() ,Me:Dir() , 1 )
					break
				end
			end	
			if Save == 0 then
				Auro = CreateObj( 114295 , Me:X(), Me:Y() ,Me:Z() ,Me:Dir() , 1 )
				WriteRoleValue(OwnerID() , EM_RoleValue_Register , Auro )
				break		
			end									
		end		
	else
		Zone123_TunnelControl[RoomID]["Tunnel"][1] = 1
		Auro = CreateObj( 114296 ,Me:X(), Me:Y() ,Me:Z() ,Me:Dir() , 1 )
	end
	Lua_ObjDontTouch( Auro )
	AddToPartition( Auro , RoomID )
end

function LuaI_103263_dead() --�w�S��
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local State = Zone123_TunnelControl[RoomID]["State"][2]

	lua_star_BossKilledCount( 103263)
	local Save = ReadInstanceArg( RoomID , 0 )
	Save = Save + 1
	WriteInstanceArg(0 , Save)	------�g�J�i��

	if CheckID( State ) == true then		
		Zone123_TunnelControl[RoomID]["Tunnel"][2] = 1
		BeginPlot( State , "LuaI_123_TranPoint_Change" , 0 )
	end
	return true
end

function LuaI_103241_dead() --����q
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local State = Zone123_TunnelControl[RoomID]["State"][3]
	
	lua_star_BossKilledCount( 103241)
	local Save = ReadInstanceArg( RoomID , 0 )
	Save = Save + 10
	WriteInstanceArg(0 , Save)	------�g�J�i��
	--Say(OwnerID() , Save)

	if CheckID( State ) == true then	
		Zone123_TunnelControl[RoomID]["Tunnel"][3] = 1
		BeginPlot( State , "LuaI_123_TranPoint_Change" , 0 )
	end
	return true
end

function LuaI_103266_dead() --�ຸ�ҩi
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local State = Zone123_TunnelControl[RoomID]["State"][4]

	lua_star_BossKilledCount( 103266)
	local Save = ReadInstanceArg( RoomID , 0 )
	Save = Save + 100
	WriteInstanceArg(0 , Save)	------�g�J�i��

	if CheckID( State ) == true then
		Zone123_TunnelControl[RoomID]["Tunnel"][4] = 1
		BeginPlot( State , "LuaI_123_TranPoint_Change" , 0 )
	end
	return true
end

function LuaI_103205_dead() --�˺�����
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local State = Zone123_TunnelControl[RoomID]["State"][5]

	lua_star_BossKilledCount( 103205)
	local Save = ReadInstanceArg( RoomID , 0 )
	Save = Save + 1000
	WriteInstanceArg(0 , Save)	------�g�J�i��

	if CheckID( State ) == true then
		Zone123_TunnelControl[RoomID]["Tunnel"][5] = 1
		BeginPlot( State , "LuaI_123_TranPoint_Change" , 0 )
	end
	return true
end

function LuaI_103230_dead() --��溸
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local State = Zone123_TunnelControl[RoomID]["State"][6]

	lua_star_BossKilledCount( 103230)
	local Save = ReadInstanceArg( RoomID , 0 )
	Save = Save + 10000
	WriteInstanceArg(0 , Save)	------�g�J�i��
	--Say(OwnerID() , Save)

	if CheckID( State ) == true then
		Zone123_TunnelControl[RoomID]["Tunnel"][6] = 1
		BeginPlot( State , "LuaI_123_TranPoint_Change" , 0 )
	end
	return true
end

function LuaI_103198_dead() --���ڵ�
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local State = Zone123_TunnelControl[RoomID]["State"][7]

	lua_star_BossKilledCount( 103198)
	local Save = ReadInstanceArg( RoomID , 0 )
	Save = Save + 100000
	WriteInstanceArg(0 , Save)	------�g�J�i��
	--Say(OwnerID() , Save)

	if CheckID( State ) == true then
		Zone123_TunnelControl[RoomID]["Tunnel"][7] = 1
		BeginPlot( State , "LuaI_123_TranPoint_Change" , 0 )
	end
	return true
end

function LuaI_103212_dead() --�w�w���Q�i
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local State = Zone123_TunnelControl[RoomID]["State"][8]

	lua_star_BossKilledCount( 103212)
	local Save = ReadInstanceArg( RoomID , 0 )
	Save = Save + 1000000
	WriteInstanceArg(0 , Save)	------�g�J�i��
	--Say(OwnerID() , Save)

	if CheckID( State ) == true then
		Zone123_TunnelControl[RoomID]["Tunnel"][8] = 1
		BeginPlot( State , "LuaI_123_TranPoint_Change" , 0 )
	end
	return true
end


function LuaI_123_TranPoint_Change()
	local OldAuro = ReadRoleValue( OwnerID() , EM_RoleValue_Register )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Me = Role:new( OwnerID() )
	if CheckID( OldAuro ) == true and ReadRoleValue( OldAuro , EM_RoleValue_OrgID ) == 114295 then
		DelObj( OldAuro )
		local Auro = CreateObj( 114296 , Me:X(), Me:Y() ,Me:Z() ,Me:Dir() , 1 )
		Lua_ObjDontTouch( Auro )
		AddToPartition( Auro , RoomID )
	end
end

function LuaI_123_TranPoint_0()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Tunnel = Zone123_TunnelControl[RoomID]["Tunnel"] 
	local PID = ReadRoleValue( TargetID() , EM_RoleValue_PID )
	local Scriptname = {}
	
	if Tunnel[PID] == 0 then
		ScriptMessage(OwnerID(),OwnerID(), 1 , "[SC_114293_0]" , 0 )  --�o��[113720]���\��w�g�Q���A���Ѱ���w���ܬO�L�k�ϥΪ��C
		ScriptMessage(OwnerID(),OwnerID(), 0 , "[SC_114293_0]" , C_Red )  
	else
		if CheckBuff( OwnerID() , 501570) == true then 
			ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );--�����w�g���}�F
			return
		end
		local Count = 1
		DialogCreate( OwnerID() , EM_LuaDialogType_Select , "[SC_114293_DIALOG]" ) --�o��[113720]�w�Ѱ���w�A�A�i�H�Q�Υ��e����L�a�ϡC
		AddBuff(OwnerID() , 501570,0,-1);
		for pry , obj in pairs(Tunnel) do
			if obj > 0 and pry ~= PID then
				local String = "[SC_ZONE117_CRYSTAL"..pry.."]"
				Scriptname[Count] = "LuaI_123_TranPoint_"..pry
				Count = Count + 1
				DialogSelectStr( OwnerID() , String) 
			end
		end
		DialogSelectStr( OwnerID() , "[SO_EXIT]" )
		if( DialogSendOpen( OwnerID() ) == false ) then 
			ScriptMessage( OwnerID(),OwnerID(),1,GetString("SYS_FIXEQ_DATA_ERROR"),0)	
			--��ưe�X�����D
			return 0
		end
		local SelectID = EX_GetDialogResoult( OwnerID(), 30 , 50 , TargetID() )
		DialogClose( OwnerID() )
		CancelBuff( OwnerID(), 501570 );--
		if SelectID >= 0 and SelectID < table.getn(Scriptname) then
			BeginPlot( OwnerID() , Scriptname[SelectID+1] , 0 )
			return 1
		else
			return -1
		end
	end
end

function LuaI_123_TranPoint_1()
	CastSpell( OwnerID() , OwnerID() , 491008 )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local State = Zone123_TunnelControl[RoomID]["State"][1]
	local Me = Role:new( State )
	ChangeZone( OwnerID() , Me:ZoneID() , RoomID  , Me:X() ,Me:Y()+5 ,Me:Z() ,Me:Dir() )
end

function LuaI_123_TranPoint_2()
	CastSpell( OwnerID() , OwnerID() , 491008 )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local State = Zone123_TunnelControl[RoomID]["State"][2]
	local Me = Role:new( State )
	ChangeZone( OwnerID() , Me:ZoneID() , RoomID  , Me:X() ,Me:Y()+5 ,Me:Z() ,Me:Dir() )
end

function LuaI_123_TranPoint_3()
	CastSpell( OwnerID() , OwnerID() , 491008 )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local State = Zone123_TunnelControl[RoomID]["State"][3]
	local Me = Role:new( State )
	ChangeZone( OwnerID() , Me:ZoneID() , RoomID  , Me:X() ,Me:Y()+5 ,Me:Z() ,Me:Dir() )
end

function LuaI_123_TranPoint_4()
	CastSpell( OwnerID() , OwnerID() , 491008 )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local State = Zone123_TunnelControl[RoomID]["State"][4]
	local Me = Role:new( State )
	ChangeZone( OwnerID() , Me:ZoneID() , RoomID  , Me:X() ,Me:Y()+5 ,Me:Z() ,Me:Dir() )
end

function LuaI_123_TranPoint_5()
	CastSpell( OwnerID() , OwnerID() , 491008 )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local State = Zone123_TunnelControl[RoomID]["State"][5]
	local Me = Role:new( State )
	ChangeZone( OwnerID() , Me:ZoneID() , RoomID  , Me:X() ,Me:Y()+5 ,Me:Z() ,Me:Dir() )
end

function LuaI_123_TranPoint_6()
	CastSpell( OwnerID() , OwnerID() , 491008 )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local State = Zone123_TunnelControl[RoomID]["State"][6]
	local Me = Role:new( State )
	ChangeZone( OwnerID() , Me:ZoneID() , RoomID  , Me:X() ,Me:Y()+5 ,Me:Z() ,Me:Dir() )
end

function LuaI_123_TranPoint_7()
	CastSpell( OwnerID() , OwnerID() , 491008 )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local State = Zone123_TunnelControl[RoomID]["State"][7]
	local Me = Role:new( State )
	ChangeZone( OwnerID() , Me:ZoneID() , RoomID  , Me:X() ,Me:Y()+5 ,Me:Z() ,Me:Dir() )
end

function LuaI_123_TranPoint_8()
	CastSpell( OwnerID() , OwnerID() , 491008 )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local State = Zone123_TunnelControl[RoomID]["State"][8]
	local Me = Role:new( State )
	ChangeZone( OwnerID() , Me:ZoneID() , RoomID  , Me:X() ,Me:Y()+5 ,Me:Z() ,Me:Dir() )
end


