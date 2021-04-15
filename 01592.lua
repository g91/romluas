function LuaI_113721_0()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Save = ReadInstanceArg( RoomID , 0 )
	if Zone120_TunnelControl == nil then 
		Zone120_TunnelControl = {}
	end
	Zone120_TunnelControl[RoomID] = {}
	Zone120_TunnelControl[RoomID]["Tunnel"] = {}
	Zone120_TunnelControl[RoomID]["State"] = {}

	for i = 1 , 5 , 1 do
		Zone120_TunnelControl[RoomID]["Tunnel"][i] = 0
		Zone120_TunnelControl[RoomID]["State"][i] = 0
	end

  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop );
	SetShop( OwnerID() , 600162 , "Test_Shop_Close" ); --商店
end

function LuaI_114287_0()
	AddBuff( OwnerID() ,502280,1 ,-1)
	PlayMotionEX( OwnerID(),ruFUSION_ACTORSTATE_COMBAT_UNARMED, ruFUSION_ACTORSTATE_COMBAT_UNARMED)
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop );
	SetShop( OwnerID() , 600162 , "Test_Shop_Close" ); --商店
end

function LuaS_113721_0()
	LoadQuestOption( OwnerID() )
	AddSpeakOption(OwnerID(),TargetID(), "[SC_113721_0]",  "LuaS_113721_1" ,0) --幫我補給
	AddSpeakOption(OwnerID(),TargetID(), "[SC_113721_1]",  "LuaS_113721_2" ,0) --帶我回[113503]所在之處
end

function LuaS_114287_0()
	LoadQuestOption( OwnerID() )
	AddSpeakOption(OwnerID(),TargetID(), "[SC_113721_0]",  "LuaS_113721_1" ,0) --幫我補給
	AddSpeakOption(OwnerID(),TargetID(), "[SC_114287_0]",  "LuaS_114287_1" ,0) --帶我前往[ZONE_NAGA ACROPOLIS]大殿入口
	AddSpeakOption(OwnerID(),TargetID(), "[SC_113721_1]",  "LuaS_113721_2" ,0) --帶我回[113503]所在之處
end

function LuaS_113721_1()
	CloseSpeak( OwnerID() )
	OpenShop()
end

function LuaS_114287_1()
	CloseSpeak( OwnerID() )
	ChangeZone( OwnerID() , 9 , 0 , -20640 , 1307  , 39774  , 160 )
end

function LuaS_113721_2()
	CloseSpeak( OwnerID() )
	ChangeZone( OwnerID() , 9 , 0 , -12629 , 1036  , 31803  , 45 )
end

function LuaI_113720()
	local PID = ReadRoleValue( OwnerID() , EM_RoleValue_PID)
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Me = Role:new( OwnerID() )
	local Auro 
	Hide( OwnerID() )
	sleep( 10 )
	Show( OwnerID() , RoomID )
	SetPlot( OwnerID() , "range" , "LuaS_113720_0" , 40 )
--	AddBuff( OwnerID() , 505013 , 0 , -1 )
	Zone120_TunnelControl[RoomID]["State"][PID] = OwnerID()

	local Save = ReadInstanceArg(RoomID , 0)
	
	if PID > 1 then				
		for i=5 , 2 , -1 do
			if Save >= math.pow(10 , i-2) then
				Save = Save - math.pow(10 , i-2)
				if PID == i then
					Zone120_TunnelControl[RoomID]["Tunnel"][i] = 1
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
		Zone120_TunnelControl[RoomID]["Tunnel"][1] = 1
		Auro = CreateObj( 114296 ,Me:X(), Me:Y() ,Me:Z() ,Me:Dir() , 1 )
	end

	--if PID > 1 then
		--Auro = CreateObj( 102454,Me:X(), Me:Y() ,Me:Z() ,Me:Dir() , 1 )
		--WriteRoleValue(OwnerID() , EM_RoleValue_Register , Auro )
	--else
		--Zone120_TunnelControl[RoomID]["Tunnel"][1] = 1
		--Auro = CreateObj( 102457,Me:X(), Me:Y() ,Me:Z() ,Me:Dir() , 1 )
	--end

	Lua_ObjDontTouch( Auro )
	AddToPartition( Auro , RoomID )
end

function LuaI_102706_dead()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local State = Zone120_TunnelControl[RoomID]["State"][2]
	Zone120_TunnelControl[RoomID]["Tunnel"][2] = 1

	lua_star_BossKilledCount( 102706)
	local Save = ReadInstanceArg( RoomID , 0 )
	Save = Save + 1
	WriteInstanceArg(0 , Save)	------寫入進度

	BeginPlot( State , "LuaI_113720_Change" , 0 )
	return true
end

function LuaI_102683_dead()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local State = Zone120_TunnelControl[RoomID]["State"][3]
	Zone120_TunnelControl[RoomID]["Tunnel"][3] = 1

	lua_star_BossKilledCount( 102683 )
	local Save = ReadInstanceArg( RoomID , 0 )
	Save = Save + 10
	WriteInstanceArg(0 , Save)	------寫入進度

	BeginPlot( State , "LuaI_113720_Change" , 0 )
	return true
end

function LuaI_102704_dead()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local State = Zone120_TunnelControl[RoomID]["State"][4]
	Zone120_TunnelControl[RoomID]["Tunnel"][4] = 1

	lua_star_BossKilledCount( 102704)
	local Save = ReadInstanceArg( RoomID , 0 )
	Save = Save + 100
	WriteInstanceArg(0 , Save)	------寫入進度

	BeginPlot( State , "LuaI_113720_Change" , 0 )
	return true
end

function LuaI_102708_dead()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local State = Zone120_TunnelControl[RoomID]["State"][5]
	Zone120_TunnelControl[RoomID]["Tunnel"][5] = 1

	lua_star_BossKilledCount( 102708)
	local Save = ReadInstanceArg( RoomID , 0 )
	Save = Save + 1000
	WriteInstanceArg(0 , Save)	------寫入進度

	for i = 0 , HateListCount( OwnerID() )-1 , 1 do
		local obj = HateListInfo(OwnerID() ,i , EM_HateListInfoType_GItemID );
		SetFlag( obj , 543529 , 1)
	end
	BeginPlot( State , "LuaI_113720_Change" , 0 )
	return true
end

function LuaI_113720_Change()
	local OldAuro = ReadRoleValue( OwnerID() , EM_RoleValue_Register )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Me = Role:new( OwnerID() )
	if CheckID( OldAuro ) == true and ReadRoleValue( OldAuro , EM_RoleValue_OrgID ) == 102454 then
		DelObj( OldAuro )
		local Auro = CreateObj( 102457 , Me:X(), Me:Y() ,Me:Z() ,Me:Dir() , 1 )
		Lua_ObjDontTouch( Auro )
		AddToPartition( Auro , RoomID )
	end
end

function LuaS_113720_0()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Tunnel = Zone120_TunnelControl[RoomID]["Tunnel"] 
	local PID = ReadRoleValue( TargetID() , EM_RoleValue_PID )
	local Scriptname = {}
	if Tunnel[PID] == 0 then
		ScriptMessage(OwnerID(),OwnerID(), 1 , "[SC_113720_0]" , 0 )  --這個[113720]的功能已經被鎖住，不解除鎖定的話是無法使用的。
		ScriptMessage(OwnerID(),OwnerID(), 0 , "[SC_113720_0]" , C_Red )  
	else
	
		if CheckBuff( OwnerID() , 501570) == true then  --增加檢查判斷
			ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
		else	
			AddBuff(OwnerID() , 501570,0,-1);--然後給予BUFF
		end
		
		local Count = 1
		DialogCreate( OwnerID() , EM_LuaDialogType_Select , "[SC_113720_DIALOG]" ) --這個[113720]已解除鎖定，你可以利用它前往其他地區。
		for pry , obj in pairs(Tunnel) do
			if obj > 0 and pry ~= PID then
				local String = "[SC_113720_"..pry.."]"
				Scriptname[Count] = "LuaS_113720_"..pry
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
		CancelBuff( OwnerID(), 501570 );--最後清除BUFF
		DialogClose( OwnerID() )
		if SelectID >= 0 and SelectID < table.getn(Scriptname) then
			BeginPlot( OwnerID() , Scriptname[SelectID+1] , 0 )
			return 1
		else
			return -1
		end
	end
end

function LuaS_113720_1()
--	CloseSpeak( OwnerID() )
	CastSpell( OwnerID() , OwnerID() , 491008 )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local State = Zone120_TunnelControl[RoomID]["State"][1]
	local Me = Role:new( State )
	ChangeZone( OwnerID() , Me:ZoneID() , RoomID  , Me:X() ,Me:Y()+5 ,Me:Z() ,Me:Dir() )
end

function LuaS_113720_2()
--	CloseSpeak( OwnerID() )
	CastSpell( OwnerID() , OwnerID() , 491008 )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local State = Zone120_TunnelControl[RoomID]["State"][2]
	local Me = Role:new( State )
	ChangeZone( OwnerID() , Me:ZoneID() , RoomID  , Me:X() ,Me:Y()+5 ,Me:Z() ,Me:Dir() )
end

function LuaS_113720_3()
--	CloseSpeak( OwnerID() )
	CastSpell( OwnerID() , OwnerID() , 491008 )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local State = Zone120_TunnelControl[RoomID]["State"][3]
	local Me = Role:new( State )
	ChangeZone( OwnerID() , Me:ZoneID() , RoomID  , Me:X() ,Me:Y()+5 ,Me:Z() ,Me:Dir() )
end

function LuaS_113720_4()
--	CloseSpeak( OwnerID() )
	CastSpell( OwnerID() , OwnerID() , 491008 )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local State = Zone120_TunnelControl[RoomID]["State"][4]
	local Me = Role:new( State )
	ChangeZone( OwnerID() , Me:ZoneID() , RoomID  , Me:X() ,Me:Y()+5 ,Me:Z() ,Me:Dir() )
end

function LuaS_113720_5()
--	CloseSpeak( OwnerID() )
	CastSpell( OwnerID() , OwnerID() , 491008 )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local State = Zone120_TunnelControl[RoomID]["State"][5]
	local Me = Role:new( State )
	ChangeZone( OwnerID() , Me:ZoneID() , RoomID  , Me:X() ,Me:Y()+5 ,Me:Z() ,Me:Dir() )
end

function LuaS_DNG_120_GOGO()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	for i = 1 , 5 , 1 do
		Zone120_TunnelControl[RoomID]["Tunnel"][i] = 1
	end
end

function LuaI_Zone9_To_Zone120_0()
	SetPlot( OwnerID() , "range" , "LuaI_Zone9_To_Zone120_1" , 75 )
end

function LuaI_Zone9_To_Zone120_1()
	--if CheckFlag( OwnerID() , 543533 ) == true then 
	if CheckCompleteQuest( OwnerID() , 422659 ) == true then   --判斷玩家是否有此任務
		    --擠查玩家是否完成任務
		if ChangeZone( OwnerID() , 120 , -1 , 604 , 1007 , 435 , 270  ) then
			local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					-- 取得玩家等級
			local PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				-- 取得玩家副職等級
			DesignLog( OwnerID() , 120, " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )		-- 紀錄進入人次	
		else
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_ZONE9_TO_NAGA_ERROR]" , 0 ) --你對裡面一無所知，最好不要貿然闖入
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_ZONE9_TO_NAGA_ERROR]" , 0 )
	end
end

function LuaI_Zone120_To_Zone9_0()
	SetPlot( OwnerID() , "Collision" , "LuaI_Zone120_To_Zone9_1" , 0 )
end

function LuaI_Zone120_To_Zone9_1()
	if ChangeZone( OwnerID() , 9 , 0 , -21276 , 1282 , 40395, 340 ) then
	else
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
	end
end