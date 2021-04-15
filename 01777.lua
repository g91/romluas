function LuaI_114899_0()		------zone 117用
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Save = ReadInstanceArg( RoomID , 0 )
	if Zone117_TunnelControl == nil then
		Zone117_TunnelControl = {}
	end
	Zone117_TunnelControl[RoomID] = {}
	Zone117_TunnelControl[RoomID]["Tunnel"] = {}
	Zone117_TunnelControl[RoomID]["State"] = {}
	
	for i = 1 , 8 , 1 do
		Zone117_TunnelControl[RoomID]["Tunnel"][i] = 0
		Zone117_TunnelControl[RoomID]["State"][i] = 0
	end 	
end

function LuaI_117_TranPoint()
	local PID = ReadRoleValue( OwnerID() , EM_RoleValue_PID)
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Me = Role:new( OwnerID() )
	local Auro 
	Hide( OwnerID() )
 	Lua_ObjDontTouch( OwnerID() )
	sleep( 30 )
	Show( OwnerID() , RoomID )
	AddBuff( OwnerID() , 504098 , 0 , -1 )
	SetPlot( OwnerID() , "range" , "LuaI_117_TranPoint_0" , 40 )
	Zone117_TunnelControl[RoomID]["State"][PID] = OwnerID()
	
	local Save = ReadInstanceArg(RoomID , 0)
	
	if PID > 1 then				
		for i=8 , 2 , -1 do
			if Save >= math.pow(10 , i-2) then
				Save = Save - math.pow(10 , i-2)
				if PID == i then
					Zone117_TunnelControl[RoomID]["Tunnel"][i] = 1
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
		Zone117_TunnelControl[RoomID]["Tunnel"][1] = 1
		Auro = CreateObj( 114296 ,Me:X(), Me:Y() ,Me:Z() ,Me:Dir() , 1 )
	end
	Lua_ObjDontTouch( Auro )
	AddToPartition( Auro , RoomID )
end

function LuaI_102421_dead() --安特爾
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local State = Zone117_TunnelControl[RoomID]["State"][2]

	lua_star_BossKilledCount( 102421)
	local Save = ReadInstanceArg( RoomID , 0 )
	Save = Save + 1
	WriteInstanceArg(0 , Save)	------寫入進度

	if CheckID( State ) == true then		
		Zone117_TunnelControl[RoomID]["Tunnel"][2] = 1
		BeginPlot( State , "LuaI_117_TranPoint_Change" , 0 )
	end
	return true
end

function LuaI_102475_dead() --格拉默
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local State = Zone117_TunnelControl[RoomID]["State"][3]

	lua_star_BossKilledCount( 102475)
	local Save = ReadInstanceArg( RoomID , 0 )
	Save = Save + 10
	WriteInstanceArg(0 , Save)	------寫入進度
	--Say(OwnerID() , Save)

	if CheckID( State ) == true then	
		Zone117_TunnelControl[RoomID]["Tunnel"][3] = 1
		BeginPlot( State , "LuaI_117_TranPoint_Change" , 0 )
	end
	return true
end

function LuaI_102395_dead() --戈爾帝姆
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local State = Zone117_TunnelControl[RoomID]["State"][4]

	lua_star_BossKilledCount( 102395)
	local Save = ReadInstanceArg( RoomID , 0 )
	Save = Save + 100
	WriteInstanceArg(0 , Save)	------寫入進度

	if CheckID( State ) == true then
		Zone117_TunnelControl[RoomID]["Tunnel"][4] = 1
		BeginPlot( State , "LuaI_117_TranPoint_Change" , 0 )
	end
	return true
end

function LuaI_102558_dead() --瓦爾哈拉
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local State = Zone117_TunnelControl[RoomID]["State"][5]

	lua_star_BossKilledCount( 102558)
	local Save = ReadInstanceArg( RoomID , 0 )
	Save = Save + 1000
	WriteInstanceArg(0 , Save)	------寫入進度

	if CheckID( State ) == true then
		Zone117_TunnelControl[RoomID]["Tunnel"][5] = 1
		BeginPlot( State , "LuaI_117_TranPoint_Change" , 0 )
	end
	return true
end

function LuaI_102425_dead() --西格爾
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local State = Zone117_TunnelControl[RoomID]["State"][6]

	lua_star_BossKilledCount( 102425)
	local Save = ReadInstanceArg( RoomID , 0 )
	Save = Save + 10000
	WriteInstanceArg(0 , Save)	------寫入進度
	--Say(OwnerID() , Save)

	if CheckID( State ) == true then
		Zone117_TunnelControl[RoomID]["Tunnel"][6] = 1
		BeginPlot( State , "LuaI_117_TranPoint_Change" , 0 )
	end
	return true
end

function LuaI_102446_dead() --齊歐菲
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local State = Zone117_TunnelControl[RoomID]["State"][7]

	lua_star_BossKilledCount( 102446)
	local Save = ReadInstanceArg( RoomID , 0 )
	Save = Save + 100000
	WriteInstanceArg(0 , Save)	------寫入進度
	--Say(OwnerID() , Save)

	if CheckID( State ) == true then
		Zone117_TunnelControl[RoomID]["Tunnel"][7] = 1
		BeginPlot( State , "LuaI_117_TranPoint_Change" , 0 )
	end
	return true
end

function LuaI_102430_dead() --安德弗利姆
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local State = Zone117_TunnelControl[RoomID]["State"][8]

	lua_star_BossKilledCount( 102430)
	local Save = ReadInstanceArg( RoomID , 0 )
	Save = Save + 1000000
	WriteInstanceArg(0 , Save)	------寫入進度
	--Say(OwnerID() , Save)

	if CheckID( State ) == true then
		Zone117_TunnelControl[RoomID]["Tunnel"][8] = 1
		BeginPlot( State , "LuaI_117_TranPoint_Change" , 0 )
	end
	return true
end


function LuaI_117_TranPoint_Change()
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

function LuaI_117_TranPoint_0()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Tunnel = Zone117_TunnelControl[RoomID]["Tunnel"] 
	local PID = ReadRoleValue( TargetID() , EM_RoleValue_PID )
	local Scriptname = {}
	
	if Tunnel[PID] == 0 then
		ScriptMessage(OwnerID(),OwnerID(), 1 , "[SC_114293_0]" , 0 )  --這個[113720]的功能已經被鎖住，不解除鎖定的話是無法使用的。
		ScriptMessage(OwnerID(),OwnerID(), 0 , "[SC_114293_0]" , C_Red )  
	else
		local Count = 1
		if CheckBuff( OwnerID() , 501570) == true then 
			ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );--視窗已經打開了
			return
		end
		DialogCreate( OwnerID() , EM_LuaDialogType_Select , "[SC_114293_DIALOG]" ) --這個[113720]已解除鎖定，你可以利用它前往其他地區。
		AddBuff(OwnerID() , 501570,0,-1);
		for pry , obj in pairs(Tunnel) do
			if obj > 0 and pry ~= PID then
				local String = "[SC_ZONE117_CRYSTAL"..pry.."]"
				Scriptname[Count] = "LuaI_117_TranPoint_"..pry
				Count = Count + 1
				DialogSelectStr( OwnerID() , String) 
			end
		end
		DialogSelectStr( OwnerID() , "[SO_EXIT]" )
		if( DialogSendOpen( OwnerID() ) == false ) then 
			ScriptMessage( OwnerID(),OwnerID(),1,GetString("SYS_FIXEQ_DATA_ERROR"),0)	
			--資料送出有問題
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

function LuaI_117_TranPoint_1()
	CastSpell( OwnerID() , OwnerID() , 491008 )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local State = Zone117_TunnelControl[RoomID]["State"][1]
	local Me = Role:new( State )
	ChangeZone( OwnerID() , Me:ZoneID() , RoomID  , Me:X() ,Me:Y()+5 ,Me:Z() ,Me:Dir() )
end

function LuaI_117_TranPoint_2()
	CastSpell( OwnerID() , OwnerID() , 491008 )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local State = Zone117_TunnelControl[RoomID]["State"][2]
	local Me = Role:new( State )
	ChangeZone( OwnerID() , Me:ZoneID() , RoomID  , Me:X() ,Me:Y()+5 ,Me:Z() ,Me:Dir() )
end

function LuaI_117_TranPoint_3()
	CastSpell( OwnerID() , OwnerID() , 491008 )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local State = Zone117_TunnelControl[RoomID]["State"][3]
	local Me = Role:new( State )
	ChangeZone( OwnerID() , Me:ZoneID() , RoomID  , Me:X() ,Me:Y()+5 ,Me:Z() ,Me:Dir() )
end

function LuaI_117_TranPoint_4()
	CastSpell( OwnerID() , OwnerID() , 491008 )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local State = Zone117_TunnelControl[RoomID]["State"][4]
	local Me = Role:new( State )
	ChangeZone( OwnerID() , Me:ZoneID() , RoomID  , Me:X() ,Me:Y()+5 ,Me:Z() ,Me:Dir() )
end

function LuaI_117_TranPoint_5()
	CastSpell( OwnerID() , OwnerID() , 491008 )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local State = Zone117_TunnelControl[RoomID]["State"][5]
	local Me = Role:new( State )
	ChangeZone( OwnerID() , Me:ZoneID() , RoomID  , Me:X() ,Me:Y()+5 ,Me:Z() ,Me:Dir() )
end

function LuaI_117_TranPoint_6()
	CastSpell( OwnerID() , OwnerID() , 491008 )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local State = Zone117_TunnelControl[RoomID]["State"][6]
	local Me = Role:new( State )
	ChangeZone( OwnerID() , Me:ZoneID() , RoomID  , Me:X() ,Me:Y()+5 ,Me:Z() ,Me:Dir() )
end

function LuaI_117_TranPoint_7()
	CastSpell( OwnerID() , OwnerID() , 491008 )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local State = Zone117_TunnelControl[RoomID]["State"][7]
	local Me = Role:new( State )
	ChangeZone( OwnerID() , Me:ZoneID() , RoomID  , Me:X() ,Me:Y()+5 ,Me:Z() ,Me:Dir() )
end

function LuaI_117_TranPoint_8()
	CastSpell( OwnerID() , OwnerID() , 491008 )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local State = Zone117_TunnelControl[RoomID]["State"][8]
	local Me = Role:new( State )
	ChangeZone( OwnerID() , Me:ZoneID() , RoomID  , Me:X() ,Me:Y()+5 ,Me:Z() ,Me:Dir() )
end


