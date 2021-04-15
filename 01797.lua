function LuaI_115911_0()		------zone 133用
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Save = ReadInstanceArg( RoomID , 0 )
	if Zone133_TunnelControl== nil then
		Zone133_TunnelControl = {}
	end
	Zone133_TunnelControl[RoomID] = {}
	Zone133_TunnelControl[RoomID]["Tunnel"] = {}
	Zone133_TunnelControl[RoomID]["State"] = {}
	if Save == 0 then
		Zone133_TunnelControl[RoomID]["BossState"] = 0
	elseif Save ~= 0 then
		Zone133_TunnelControl[RoomID]["BossState"] = Save
	end	
	for i = 1 , 8 , 1 do
		Zone133_TunnelControl[RoomID]["Tunnel"][i] = 0
		Zone133_TunnelControl[RoomID]["State"][i] = 0
	end 	
end

function LuaI_133_TranPoint()
	local PID = ReadRoleValue( OwnerID() , EM_RoleValue_PID)
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Me = Role:new( OwnerID() )
	local Auro 
	Hide( OwnerID() )
 	Lua_ObjDontTouch( OwnerID() )
	sleep( 30 )
	Show( OwnerID() , RoomID )
	AddBuff( OwnerID() , 504098 , 0 , -1 )
----------SetPlot( OwnerID() , "range" , "LuaI_133_TranPoint_0" , 40 )
	Zone133_TunnelControl[RoomID]["State"][PID] = OwnerID()
	
	local Save = ReadInstanceArg(RoomID , 0)
	
	if PID > 1 then				
		for i=8 , 2 , -1 do
			if Save >= math.pow(10 , i-2) then
				Save = Save - math.pow(10 , i-2)
				if PID == i then
					Zone133_TunnelControl[RoomID]["Tunnel"][i] = 1
					Auro = CreateObj( 114296 ,Me:X(), Me:Y() ,Me:Z() ,Me:Dir() , 1 )
					SetPlot( Auro , "touch" , "LuaI_133_TranPoint_0" , 40 )
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
		Zone133_TunnelControl[RoomID]["Tunnel"][1] = 1
		Auro = CreateObj( 114296 ,Me:X(), Me:Y() ,Me:Z() ,Me:Dir() , 1 )
		SetPlot( Auro , "touch" , "LuaI_133_TranPoint_0" , 40 )
	end
--	Lua_ObjDontTouch( Auro )
	AddToPartition( Auro , RoomID )
end

function LuaI_104108_dead() --雅瓦卡
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local State = Zone133_TunnelControl[RoomID]["State"][2]

	Zone133_TunnelControl[RoomID]["BossState"] = Zone133_TunnelControl[RoomID]["BossState"]+1
	lua_star_BossKilledCount(104108)
	local Save = Zone133_TunnelControl[RoomID]["BossState"]
	--local Save = Zone133_TunnelControl[RoomID]["BossState"]
	WriteInstanceArg(0 , Save)	------寫入進度

	if CheckID( State ) == true then		
		Zone133_TunnelControl[RoomID]["Tunnel"][2] = 1
		BeginPlot( State , "LuaI_133_TranPoint_Change" , 0 )
	end
	return true
end

function LuaI_104140_dead() --夏高多洽
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local State = Zone133_TunnelControl[RoomID]["State"][3]

	Zone133_TunnelControl[RoomID]["BossState"] = Zone133_TunnelControl[RoomID]["BossState"]+10
	lua_star_BossKilledCount(104140)
	local Save = Zone133_TunnelControl[RoomID]["BossState"]
	WriteInstanceArg(0 , Save)	------寫入進度
	--Say(OwnerID() , Save)

	if CheckID( State ) == true then	
		Zone133_TunnelControl[RoomID]["Tunnel"][3] = 1
		BeginPlot( State , "LuaI_133_TranPoint_Change" , 0 )
	end
	return true
end

function LuaI_104141_dead() --帕伊察
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local State = Zone133_TunnelControl[RoomID]["State"][4]

	Zone133_TunnelControl[RoomID]["BossState"] = Zone133_TunnelControl[RoomID]["BossState"]+100
	lua_star_BossKilledCount(104141)
	local Save = Zone133_TunnelControl[RoomID]["BossState"]
	WriteInstanceArg(0 , Save)	------寫入進度

	if CheckID( State ) == true then
		Zone133_TunnelControl[RoomID]["Tunnel"][4] = 1
		BeginPlot( State , "LuaI_133_TranPoint_Change" , 0 )
	end
	return true
end

function LuaI_104142_dead() --利金旺達
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local State = Zone133_TunnelControl[RoomID]["State"][5]

	Zone133_TunnelControl[RoomID]["BossState"] = Zone133_TunnelControl[RoomID]["BossState"]+1000
	lua_star_BossKilledCount(104142)
	local Save = Zone133_TunnelControl[RoomID]["BossState"]
	WriteInstanceArg(0 , Save)	------寫入進度

	if CheckID( State ) == true then
		Zone133_TunnelControl[RoomID]["Tunnel"][5] = 1
		BeginPlot( State , "LuaI_133_TranPoint_Change" , 0 )
	end
	return true
end

function LuaI_104143_dead() --佩謝
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local State = Zone133_TunnelControl[RoomID]["State"][6]
	
	Zone133_TunnelControl[RoomID]["BossState"] = Zone133_TunnelControl[RoomID]["BossState"]+10000
	lua_star_BossKilledCount(104143)
	local Save = Zone133_TunnelControl[RoomID]["BossState"]
	WriteInstanceArg(0 , Save)	------寫入進度
	--Say(OwnerID() , Save)

	if CheckID( State ) == true then
		Zone133_TunnelControl[RoomID]["Tunnel"][6] = 1
		BeginPlot( State , "LuaI_133_TranPoint_Change" , 0 )
	end
	return true
end

function LuaI_104144_dead() --奈洛達斯
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local State = Zone133_TunnelControl[RoomID]["State"][7]
	
	Zone133_TunnelControl[RoomID]["BossState"] = Zone133_TunnelControl[RoomID]["BossState"]+100000
	lua_star_BossKilledCount(104144)
	local Save = Zone133_TunnelControl[RoomID]["BossState"]
	WriteInstanceArg(0 , Save)	------寫入進度
	--Say(OwnerID() , Save)

	if CheckID( State ) == true then
		Zone133_TunnelControl[RoomID]["Tunnel"][7] = 1
		BeginPlot( State , "LuaI_133_TranPoint_Change" , 0 )
	end
	return true
end

function LuaI_104090_dead() --泰德
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local State = Zone133_TunnelControl[RoomID]["State"][8]
	
	Zone133_TunnelControl[RoomID]["BossState"] = Zone133_TunnelControl[RoomID]["BossState"]+1000000
	lua_star_BossKilledCount(104090)
	local Save = Zone133_TunnelControl[RoomID]["BossState"]
	WriteInstanceArg(0 , Save)	------寫入進度
	--Say(OwnerID() , Save)

	if CheckID( State ) == true then
		Zone133_TunnelControl[RoomID]["Tunnel"][8] = 1
		BeginPlot( State , "LuaI_133_TranPoint_Change" , 0 )
	end
	return true
end


function LuaI_133_TranPoint_Change()
	local OldAuro = ReadRoleValue( OwnerID() , EM_RoleValue_Register )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Me = Role:new( OwnerID() )
	if CheckID( OldAuro ) == true and ReadRoleValue( OldAuro , EM_RoleValue_OrgID ) == 114295 then
		DelObj( OldAuro )
		local Auro = CreateObj( 114296 , Me:X(), Me:Y() ,Me:Z() ,Me:Dir() , 1 )
		SetPlot( Auro , "touch" , "LuaI_133_TranPoint_0" , 40 )
	--	Lua_ObjDontTouch( Auro )
		AddToPartition( Auro , RoomID )
	end
end

function LuaI_133_TranPoint_0()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Tunnel = Zone133_TunnelControl[RoomID]["Tunnel"] 
	local PID = ReadRoleValue( TargetID() , EM_RoleValue_PID )
	local Scriptname = {}
	
	if Tunnel[PID] == 0 then
		ScriptMessage(OwnerID(),OwnerID(), 1 , "[SC_114293_0]" , 0 )  --這個[113720]的功能已經被鎖住，不解除鎖定的話是無法使用的。
		ScriptMessage(OwnerID(),OwnerID(), 0 , "[SC_114293_0]" , C_Red )  
	else
		if CheckBuff( OwnerID() , 501570) == true then 
			ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );--視窗已經打開了
			return
		end
		local Count = 1
		DialogCreate( OwnerID() , EM_LuaDialogType_Select , "[SC_114293_DIALOG]" ) --這個[113720]已解除鎖定，你可以利用它前往其他地區。
		AddBuff(OwnerID() , 501570,0,-1);
		for pry , obj in pairs(Tunnel) do
			if obj > 0 and pry ~= PID then
				local String = "[SC_ZONE133_CRYSTAL"..pry.."]"
				Scriptname[Count] = "LuaI_133_TranPoint_"..pry
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

function LuaI_133_TranPoint_1()
	CastSpell( OwnerID() , OwnerID() , 491008 )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local State = Zone133_TunnelControl[RoomID]["State"][1]
	local Me = Role:new( State )
	ChangeZone( OwnerID() , Me:ZoneID() , RoomID  , Me:X() ,Me:Y()+5 ,Me:Z() ,Me:Dir() )
end

function LuaI_133_TranPoint_2()
	CastSpell( OwnerID() , OwnerID() , 491008 )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local State = Zone133_TunnelControl[RoomID]["State"][2]
	local Me = Role:new( State )
	ChangeZone( OwnerID() , Me:ZoneID() , RoomID  , Me:X() ,Me:Y()+5 ,Me:Z() ,Me:Dir() )
end

function LuaI_133_TranPoint_3()
	CastSpell( OwnerID() , OwnerID() , 491008 )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local State = Zone133_TunnelControl[RoomID]["State"][3]
	local Me = Role:new( State )
	ChangeZone( OwnerID() , Me:ZoneID() , RoomID  , Me:X() ,Me:Y()+5 ,Me:Z() ,Me:Dir() )
end

function LuaI_133_TranPoint_4()
	CastSpell( OwnerID() , OwnerID() , 491008 )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local State = Zone133_TunnelControl[RoomID]["State"][4]
	local Me = Role:new( State )
	ChangeZone( OwnerID() , Me:ZoneID() , RoomID  , Me:X() ,Me:Y()+5 ,Me:Z() ,Me:Dir() )
end

function LuaI_133_TranPoint_5()
	CastSpell( OwnerID() , OwnerID() , 491008 )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local State = Zone133_TunnelControl[RoomID]["State"][5]
	local Me = Role:new( State )
	ChangeZone( OwnerID() , Me:ZoneID() , RoomID  , Me:X() ,Me:Y()+5 ,Me:Z() ,Me:Dir() )
end

function LuaI_133_TranPoint_6()
	CastSpell( OwnerID() , OwnerID() , 491008 )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local State = Zone133_TunnelControl[RoomID]["State"][6]
	local Me = Role:new( State )
	ChangeZone( OwnerID() , Me:ZoneID() , RoomID  , Me:X() ,Me:Y()+5 ,Me:Z() ,Me:Dir() )
end

function LuaI_133_TranPoint_7()
	CastSpell( OwnerID() , OwnerID() , 491008 )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local State = Zone133_TunnelControl[RoomID]["State"][7]
	local Me = Role:new( State )
	ChangeZone( OwnerID() , Me:ZoneID() , RoomID  , Me:X() ,Me:Y()+5 ,Me:Z() ,Me:Dir() )
end

function LuaI_133_TranPoint_8()
	CastSpell( OwnerID() , OwnerID() , 491008 )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local State = Zone133_TunnelControl[RoomID]["State"][8]
	local Me = Role:new( State )
	ChangeZone( OwnerID() , Me:ZoneID() , RoomID  , Me:X() ,Me:Y()+5 ,Me:Z() ,Me:Dir() )
end