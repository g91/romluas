function LuaI_114289_0()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Save = ReadInstanceArg( RoomID , 0 )
	if Zone122_TunnelControl == nil then 
		Zone122_TunnelControl = {}
	end
	Zone122_TunnelControl[RoomID] = {}
	Zone122_TunnelControl[RoomID]["Tunnel"] = {}
	Zone122_TunnelControl[RoomID]["State"] = {}
	
	for i = 1 , 6 , 1 do
		Zone122_TunnelControl[RoomID]["Tunnel"][i] = 0
		Zone122_TunnelControl[RoomID]["State"][i] = 0
	end

  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop );
	SetShop( OwnerID() , 600162 , "Test_Shop_Close" ); --�ө�
	AddBuff( OwnerID() , 504345 , 0 , -1 )
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_CROUCH_BEGIN,ruFUSION_ACTORSTATE_CROUCH_LOOP)
end

function LuaI_122_TranPoint()
	local PID = ReadRoleValue( OwnerID() , EM_RoleValue_PID)
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Me = Role:new( OwnerID() )
	local Auro 
	Hide( OwnerID() )
 	Lua_ObjDontTouch( OwnerID() )
	sleep( 30 )
	Show( OwnerID() , RoomID )
	AddBuff( OwnerID() , 504098 , 0 , -1 )
	SetPlot( OwnerID() , "range" , "LuaI_122_TranPoint_0" , 40 )
	Zone122_TunnelControl[RoomID]["State"][PID] = OwnerID()
	
	local Save = ReadInstanceArg(RoomID , 0)
	
	if PID > 1 then				
		for i=6 , 2 , -1 do
			if Save >= math.pow(10 , i-2) then
				Save = Save - math.pow(10 , i-2)
				if PID == i then
					Zone122_TunnelControl[RoomID]["Tunnel"][i] = 1
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
		Zone122_TunnelControl[RoomID]["Tunnel"][1] = 1
		Auro = CreateObj( 114296 ,Me:X(), Me:Y() ,Me:Z() ,Me:Dir() , 1 )
	end

	Lua_ObjDontTouch( Auro )
	AddToPartition( Auro , RoomID )
end

function LuaI_102701_dead() --���ڴ�
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local State = Zone122_TunnelControl[RoomID]["State"][2]

	lua_star_BossKilledCount( 102701)
	local Save = ReadInstanceArg( RoomID , 0 )
	Save = Save + 1
	WriteInstanceArg(0 , Save)	------�g�J�i��

	if CheckID( State ) == true then		
		Zone122_TunnelControl[RoomID]["Tunnel"][2] = 1
		BeginPlot( State , "LuaI_122_TranPoint_Change" , 0 )
	end
	return true
end

function LuaI_102969_dead() --�ȨF
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local State = Zone122_TunnelControl[RoomID]["State"][3]

	lua_star_BossKilledCount( 102969)
	local Save = ReadInstanceArg( RoomID , 0 )
	Save = Save + 10
	WriteInstanceArg(0 , Save)	------�g�J�i��

	if CheckID( State ) == true then	
		Zone122_TunnelControl[RoomID]["Tunnel"][3] = 1
		BeginPlot( State , "LuaI_122_TranPoint_Change" , 0 )
	end
	return true
end

function LuaI_102705_dead() --�ڰ򥧨�
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local State = Zone122_TunnelControl[RoomID]["State"][4]

	lua_star_BossKilledCount( 102705)
	local Save = ReadInstanceArg( RoomID , 0 )
	Save = Save + 100
	WriteInstanceArg(0 , Save)	------�g�J�i��

	if CheckID( State ) == true then
		Zone122_TunnelControl[RoomID]["Tunnel"][4] = 1
		BeginPlot( State , "LuaI_122_TranPoint_Change" , 0 )
	end
	return true
end

function LuaI_102707_dead() --�w�h�Q��
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local State = Zone122_TunnelControl[RoomID]["State"][5]

	lua_star_BossKilledCount( 102707)
	local Save = ReadInstanceArg( RoomID , 0 )
	Save = Save + 1000
	WriteInstanceArg(0 , Save)	------�g�J�i��

	if CheckID( State ) == true then
		Zone122_TunnelControl[RoomID]["Tunnel"][5] = 1
		BeginPlot( State , "LuaI_122_TranPoint_Change" , 0 )
	end
	return true
end

function LuaI_102438_dead() --�ƺ�������
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local State = Zone122_TunnelControl[RoomID]["State"][6]

	lua_star_BossKilledCount( 102438)
	local Save = ReadInstanceArg( RoomID , 0 )
	Save = Save + 10000
	WriteInstanceArg(0 , Save)	------�g�J�i��

	if CheckID( State ) == true then
		Zone122_TunnelControl[RoomID]["Tunnel"][6] = 1
		BeginPlot( State , "LuaI_122_TranPoint_Change" , 0 )
	end
	local RuneBall = Lua_DW_CreateObj( "obj" , 113583 , OwnerID() , 0 , 1 )
	 Lua_ObjDontTouch(RuneBall ) 
	SetModeEX( RuneBall , EM_SetModeType_Gravity , false )
	WriteRoleValue( RuneBall  , EM_RoleValue_IsWalk , 1 )
	AddToPartition( RuneBall , RoomID )
	BeginPlot(  RuneBall , "LuaI_102438_Dead_Drama" , 0 )

	return true
end

function LuaI_102438_Dead_Drama()
	local Me = Role:new( OwnerID() )
	local Room = Me:RoomID()
	local Flag = 780017
	local MuscleRianPos = {GetMoveFlagValue( Flag  , 1 , EM_RoleValue_X ) , GetMoveFlagValue( Flag  , 1 , EM_RoleValue_Y ) + 100, GetMoveFlagValue( Flag  , 1 , EM_RoleValue_Z ) , GetMoveFlagValue( Flag  , 1 , EM_RoleValue_Dir ) }
	local CardMossPos = {GetMoveFlagValue( Flag  , 2 , EM_RoleValue_X ) , GetMoveFlagValue( Flag  , 2 , EM_RoleValue_Y ) + 100, GetMoveFlagValue( Flag  , 2 , EM_RoleValue_Z ) , GetMoveFlagValue( Flag  , 2 , EM_RoleValue_Dir ) }
	local MistPos = {GetMoveFlagValue( Flag  , 3 , EM_RoleValue_X ) , GetMoveFlagValue( Flag  , 3 , EM_RoleValue_Y ) + 80, GetMoveFlagValue( Flag  , 3 , EM_RoleValue_Z ) , GetMoveFlagValue( Flag  , 3 , EM_RoleValue_Dir ) }
	local SleepTime = 0
	local MuscleRian =CreateObj ( 113729 , MuscleRianPos[1] , MuscleRianPos[2] , MuscleRianPos[3] , MuscleRianPos[4] , 1)
	local CardMoss= CreateObj ( 113724 , CardMossPos[1] , CardMossPos[2] , CardMossPos[3] , CardMossPos[4] , 1)
	local Mist= CreateObj ( 112307 , MistPos[1] , MistPos[2] , MistPos[3] , MistPos[4] , 1)
	SetModeEx(  MuscleRian   , EM_SetModeType_Mark, false) 
	SetModeEx(  MuscleRian  , EM_SetModeType_ShowRoleHead, false) 
	SetModeEx(  MuscleRian   , EM_SetModeType_NotShowHPMP, false )
	SetModeEX( MuscleRian , EM_SetModeType_Gravity , false )	
	SetModeEx(  CardMoss   , EM_SetModeType_Mark, false) 
	SetModeEx(  CardMoss  , EM_SetModeType_ShowRoleHead, false) 
	SetModeEx(  CardMoss  , EM_SetModeType_NotShowHPMP, false )	
	SetModeEX( CardMoss , EM_SetModeType_Gravity , false )
	 Lua_ObjDontTouch(Mist ) 
	SetModeEX( Mist , EM_SetModeType_Gravity , false )
	MoveToFlagEnabled( OwnerID() , false )
	SleepTime = MoveDirect( OwnerID(), Me:X(), Me:Y() + 20 , Me:Z() )
	sleep( SleepTime + 1 )
	AddBuff( OwnerID() , 505498 , 0 , 600 )
	SleepTime =  MoveDirect( OwnerID(), Me:X(), Me:Y() + 100 , Me:Z() )	
	sleep( SleepTime + 20 )
	AddBuff( OwnerID() , 502924  , 0 , -1 )
	sleep( 10 )
	CancelBuff( OwnerID() , 505498 )
	AddToPartition( MuscleRian , Room  )
	AddToPartition( CardMoss , Room  )
	AddToPartition( Mist , Room  )
	MoveToFlagEnabled( MuscleRian , false )
	MoveToFlagEnabled( CardMoss , false )
	Addbuff( Mist  , 505130 , 0 , -1 )
	AdjustFaceDir( MuscleRian , OwnerID() , 0 ) 
	AdjustFaceDir( CardMoss , OwnerID() , 0 ) 
	sleep( 10 )
	local Dir = ReadRoleValue( MuscleRian  ,EM_RoleValue_Dir)
	local Cal = (math.pi/180)*(Dir) 
	local X_Shift = MuscleRianPos[1] +(20*math.cos(Cal))
	local Y_Shift = MuscleRianPos[2] 
	local Z_Shift = MuscleRianPos[3] - (20*math.sin(Cal))
	SleepTime =  MoveDirect( OwnerID(), X_Shift   , Y_Shift  , Z_Shift  )	
	sleep( SleepTime  + 30 )
	PlayMotion( MuscleRian , ruFUSION_ACTORSTATE_CAST_INSTANT )
	sleep( 30 )
	Hide( OwnerID() )
	ScriptMessage( OwnerID() , -1 , 1 , "[SC_102438_DRAMA_0] " , "0xff6fb7ff" ) --[113724]�G[102438]���O�A���n���Ѥl�ܡH�N�o�˳Q���ǤZ�H�̵������F�A���I�ڬݧA�o���s���w�p�e�F�C
	ScriptMessage( OwnerID() , -1 , 0 , "[SC_102438_DRAMA_0] " , "0xff6fb7ff" )
	PlayMotion( CardMoss , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep( 40 )
	ScriptMessage( OwnerID() , -1 , 1 , "[SC_102438_DRAMA_1] " , "0xffeacc95" ) --[113729]�G���A�@�����b�p�e�����C
	ScriptMessage( OwnerID() , -1 , 0 , "[SC_102438_DRAMA_1] " , "0xffeacc95" )
	PlayMotion( MuscleRian , ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )
	sleep( 20 )
	ScriptMessage( OwnerID() , -1 , 1 , "[SC_102438_DRAMA_2] " , "0xff6fb7ff" ) --[113724]�G����H
	ScriptMessage( OwnerID() , -1 , 0 , "[SC_102438_DRAMA_2] " , "0xff6fb7ff" ) 
	AdjustFaceDir( CardMoss , MuscleRian , 0 ) 
	sleep( 20 )
	ScriptMessage( OwnerID() , -1 , 1 , "[SC_102438_DRAMA_3] " , "0xffeacc95" ) --[113729]�G�L�u�O�Ӥp����A���w�n���ѡA�u�O�b�L���ѫe�ണ�Ѧh�ֻ��ȵ��ڧQ�ΡC�ݨ��ǫ_�I��.......
	ScriptMessage( OwnerID() , -1 , 0 , "[SC_102438_DRAMA_3] " , "0xffeacc95" ) 
	PlayMotion( MuscleRian , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep( 30 )
	PlayMotion( MuscleRian , ruFUSION_ACTORSTATE_EMOTE_POINT )
	sleep( 10 )
	ScriptMessage( OwnerID() , -1 , 1 , "[SC_102438_DRAMA_4] " , "0xffeacc95" ) --[113729]�G�L��ޥX�o���u�q���Ѥl�A�w�g��O�R���F��L���Q�λ��ȤF�C
	ScriptMessage( OwnerID() , -1 , 0 , "[SC_102438_DRAMA_4] " , "0xffeacc95" ) 
	SetDir( CardMoss , ReadRoleValue( MuscleRian  ,EM_RoleValue_Dir) ) 
	sleep( 30 )
	ScriptMessage( OwnerID() , -1 , 1 , "[SC_102438_DRAMA_5] " , "0xff6fb7ff" ) --[113724]�G���I�A�N�o�ˤj�f�f���������ǤZ�Hť�ڡI
	ScriptMessage( OwnerID() , -1 , 0, "[SC_102438_DRAMA_5] " , "0xff6fb7ff" )
	PlayMotion( CardMoss  , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep( 30 )
	ScriptMessage( OwnerID() , -1 , 1 , "[SC_102438_DRAMA_6] " , "0xffeacc95" ) --[113729]�G�S���Y�A�L�̤w�g��i�ڪ��ѽL�����A���i�����}�F�C
	ScriptMessage( OwnerID() , -1 , 0, "[SC_102438_DRAMA_6] " , "0xffeacc95" )
	PlayMotion( MuscleRian , ruFUSION_ACTORSTATE_EMOTE_IDLE1 )
	sleep( 30 )
	ScriptMessage( OwnerID() , -1 , 1 , "[SC_102438_DRAMA_7] " , "0xff6fb7ff") --[113724]�G��H�u�O��ź�ƪ��H���ڡI
	ScriptMessage( OwnerID() , -1 , 0 , "[SC_102438_DRAMA_7] " , "0xff6fb7ff")
	PlayMotion( CardMoss ,ruFUSION_ACTORSTATE_EMOTE_APPLAUSE )
	sleep( 20 )
	ScriptMessage( OwnerID() , -1 , 1 , "[SC_102438_DRAMA_8] " , "0xffeacc95" ) --[113729]�G�u�H���v�o�ӦW���Φb�ڨ��W���G���ӧ���a�I���......
	ScriptMessage( OwnerID() , -1 , 0 , "[SC_102438_DRAMA_8] " , "0xffeacc95" )
	AdjustDir( MuscleRian , 180 )
	sleep( 30 )
	ScriptMessage( OwnerID() , -1 , 1 , "[SC_102438_DRAMA_9] " , "0xffeacc95" ) --[113729]�G���a�I[102438]���W���T�ҲŤ�w�g�^���A�}�l�i��U�@�B�p�e�F�C
	ScriptMessage( OwnerID() , -1 , 0 , "[SC_102438_DRAMA_9] " , "0xffeacc95" )
	CastSpell( MuscleRian , MuscleRian , 492359 )
	sleep( 10 )
	DelObj( MuscleRian ) 
	Sleep( 10 )
	Setdir( CardMoss  , Dir )
	Sleep( 10 )
	ScriptMessage( OwnerID() , -1 , 1 , "[SC_102438_DRAMA_10] " , "0xff6fb7ff" ) --[113724]�G�A�|�F�A�Z�H�̡A�C���{�b�~���n�}�l�A�i�O���ڤӥ���ڡI
	ScriptMessage( OwnerID() , -1 , 0 , "[SC_102438_DRAMA_10] " , "0xff6fb7ff" )
	PlayMotion( CardMoss  , ruFUSION_ACTORSTATE_EMOTE_POINT )
	sleep( 30 )
	CastSpell( CardMoss , CardMoss , 492359 )
	sleep( 10 )
	DelObj( CardMoss )
	DelObj( Mist )
	ScriptMessage( OwnerID() , -1 , 1 , "[SC_102438_DRAMA_11] " , "0xff6fb7ff" ) --[113724]�G������......
	ScriptMessage( OwnerID() , -1 , 0 , "[SC_102438_DRAMA_11] " , "0xff6fb7ff" )
	DelObj( OwnerID() )
end

function LuaI_122_TranPoint_Change()
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

function LuaI_122_TranPoint_0()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Tunnel = Zone122_TunnelControl[RoomID]["Tunnel"] 
	local PID = ReadRoleValue( TargetID() , EM_RoleValue_PID )
	local Scriptname = {}
	
	local Save = 0
	Save = ReadInstanceArg(RoomID , 0)

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
				local String = "[SC_114293_"..pry.."]"
				Scriptname[Count] = "LuaI_122_TranPoint_"..pry
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

function LuaI_122_TranPoint_1()
	CastSpell( OwnerID() , OwnerID() , 491008 )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local State = Zone122_TunnelControl[RoomID]["State"][1]
	local Me = Role:new( State )
	ChangeZone( OwnerID() , Me:ZoneID() , RoomID  , Me:X() ,Me:Y()+5 ,Me:Z() ,Me:Dir() )
end

function LuaI_122_TranPoint_2()
	CastSpell( OwnerID() , OwnerID() , 491008 )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local State = Zone122_TunnelControl[RoomID]["State"][2]
	local Me = Role:new( State )
	ChangeZone( OwnerID() , Me:ZoneID() , RoomID  , Me:X() ,Me:Y()+5 ,Me:Z() ,Me:Dir() )
end

function LuaI_122_TranPoint_3()
	CastSpell( OwnerID() , OwnerID() , 491008 )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local State = Zone122_TunnelControl[RoomID]["State"][3]
	local Me = Role:new( State )
	ChangeZone( OwnerID() , Me:ZoneID() , RoomID  , Me:X() ,Me:Y()+5 ,Me:Z() ,Me:Dir() )
end

function LuaI_122_TranPoint_4()
	CastSpell( OwnerID() , OwnerID() , 491008 )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local State = Zone122_TunnelControl[RoomID]["State"][4]
	local Me = Role:new( State )
	ChangeZone( OwnerID() , Me:ZoneID() , RoomID  , Me:X() ,Me:Y()+5 ,Me:Z() ,Me:Dir() )
end

function LuaI_122_TranPoint_5()
	CastSpell( OwnerID() , OwnerID() , 491008 )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local State = Zone122_TunnelControl[RoomID]["State"][5]
	local Me = Role:new( State )
	ChangeZone( OwnerID() , Me:ZoneID() , RoomID  , Me:X() ,Me:Y()+5 ,Me:Z() ,Me:Dir() )
end

function LuaI_122_TranPoint_6()
	CastSpell( OwnerID() , OwnerID() , 491008 )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local State = Zone122_TunnelControl[RoomID]["State"][6]
	local Me = Role:new( State )
	ChangeZone( OwnerID() , Me:ZoneID() , RoomID  , Me:X() ,Me:Y()+5 ,Me:Z() ,Me:Dir() )
end

function LuaS_DNG_122_GOGO()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	for i = 1 , 6 , 1 do
		Zone122_TunnelControl[RoomID]["Tunnel"][i] = 1
	end
end

function LuaI_Zone9_To_Zone122()
	SetPlot( OwnerID() , "range" , "LuaI_Zone9_To_Zone122_1" , 75 )
end

function LuaI_Zone9_To_Zone122_1()
	if CheckFlag( OwnerID() , 543529 ) == true or CheckFlag( OwnerID() , 543533 ) == true then 						
		if ChangeZone( OwnerID() , 122 , -1 , -282, 756 , 714 , 180  ) then			
			local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					-- ���o���a����
			local PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				-- ���o���a��¾����
			DesignLog( OwnerID() , 122, " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )		-- �����i�J�H��		
		else
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_ZONE9_TO_NAGA_ERROR]" , 0 ) --�A��̭��@�L�Ҫ��A�̦n���n�T�M���J
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_ZONE9_TO_NAGA_ERROR]" , 0 )
	end
end

function LuaI_Zone122_To_Zone9_0()
	SetPlot( OwnerID() , "Collision" , "LuaI_Zone122_To_Zone9_1" , 0 )
end

function LuaI_Zone122_To_Zone9_1()
	if ChangeZone( OwnerID() , 9 , 0 , -21004 , 1988 , 41023 , 75 ) then
	else
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
	end
end

function LuaI_206589_Check()
	if ReadRoleValue( OwnerID() , EM_RoleValue_IsAttackMode ) == 1 or ReadRoleValue( OwnerID() , EM_RoleValue_IsDead ) == 1  then
		ScriptMessage( OwnerID() , OwnerID()  , 1 ,"[SC_206589_0]" , 0 ) 	--�A�L�k�b�ثe�����A�U�ϥΦ����~
		ScriptMessage( OwnerID() , OwnerID()  , 0 ,"[SC_206589_0]" , 0 )
		return false
	end
	if CheckFlag( OwnerID() , 543569 ) == true  then
		ScriptMessage( OwnerID() , OwnerID()  , 1 ,"[SC_206589_1]" , 0 ) 	--�A�w�g��ٹL�]�s����G�F
		ScriptMessage( OwnerID() , OwnerID()  , 0 ,"[SC_206589_1]" , 0 )
		return false
	end
	return true
end

function LuaI_206589_Use()
	ScriptMessage( OwnerID() , OwnerID()  , 1 ,"[SC_206589_2]" , C_YELLOW ) 	--�A�N�]�s��Ŧ����G��٦b�ۤv���W
	ScriptMessage( OwnerID() , OwnerID()  , 0 ,"[SC_206589_2]" , 0 )
	BeginPlot( OwnerID() , "LuaI_206589_GETFLAG" , 0 )
end

function LuaI_206589_GETFLAG()
	AddBuff( OwnerID() , 503977 ,0 , 5 )
	AddBuff( OwnerID() , 505494 , 0 , 5 )
	sleep( 10 )
	ScriptMessage( OwnerID() , OwnerID()  , 1 ,"[SC_206589_3]" , C_YELLOW ) 	--�A�Pı�@�Ѩ`�����O�q���z��A���F���
	ScriptMessage( OwnerID() , OwnerID()  , 0 ,"[SC_206589_3]" , 0 )
	sleep( 30 )
	ScriptMessage( OwnerID() , OwnerID()  , 1 ,"[SC_206589_4]" , 0 ) 	--�b�A��������M�X�{�F�@����¶�ۤ��K�����j���]���ۧA���۶H
	ScriptMessage( OwnerID() , OwnerID()  , 0 ,"[SC_206589_4]" , 0 )
	sleep( 10 )
	ScriptMessage( OwnerID() , OwnerID()  , 1 ,"[SC_206589_5]" , 0 ) 	--�A���ѦۥD�a�P��@�}�w�t�H�ή���
	ScriptMessage( OwnerID() , OwnerID()  , 0 ,"[SC_206589_5]" , 0 )
	AddBuff( OwnerID() , 502730 , 0 , 1 )
	if CheckCompleteQuest( OwnerID() , 422874 ) ~= true then
		SetFlag( OwnerID() , 543504 ,1 ) 
	end
	SetFlag( OwnerID() , 543569 , 1 )
	if CountBodyItem( OwneRID() , 206589 ) > 0 then
		DelBodyItem( OwnerID() , 206589 , 1 )
	end
	ScriptMessage( OwnerID() , OwnerID()  , 2 ,"[SC_206589_6]" , 0 ) 	--�A����N���A����[114294]���]�k�ĪG�Ҽv�T
	ScriptMessage( OwnerID() , OwnerID()  , 0 ,"[SC_206589_6]" , 0 )
end

function LuaI_114294_0()
	SetPlot( OwnerID() , "range" , "LuaI_114294_1" , 150 )
end

function LuaI_114294_1()
	if CheckFlag( OwnerID() , 543569) == false then
		AddBuff( OwnerID() , 502730 , 0 , 1 )
		ScriptMessage( OwnerID() , OwnerID()  , 1 ,"[SC_114294_0]" , 0 ) 	--�A�b[114294]���e�P��L�k�����ߡA�A�L�k�A���e���ʥ���@�B
		ScriptMessage( OwnerID() , OwnerID()  , 0 ,"[SC_114294_0]" , 0 )
		if CheckFlag( OwnerID() , 543319 ) == true or CheckCompleteQuest( OwnerID() , 420959 ) == true then
			sleep( 30 )
			ScriptMessage( OwnerID() , OwnerID()  , 1 ,"[SC_114294_1]"  ,"0xFFBE60D2" ) 	--�A�Q�_���g�b[ZONE_BLOODBOIL OUTPOST]�~���u�@�̨��̱o������A[102670]��Ŧ����G�i�H���U�A�J�A[114294]
			ScriptMessage( OwnerID() , OwnerID()  , 0 ,"[SC_114294_1]","0xFFBE60D2" )
		end
	end
end

function LuaQ_422874_Accept() --�����ȫe�w�g�����]�s���ܡA���������X��
	if CheckFlag( TargetID() , 543569 ) == true and CheckFlag( TargetID() , 543504 ) == false then
		SetFlag( TargetID() , 543504 , 1 )
	end
end