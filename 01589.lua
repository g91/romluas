function LuaI_102670_Dead()
	lua_star_BossKilledCount( 102670 )
	
	for i = 1 , HateListCount( OwnerID() ) , 1 do --�����]�s����
		local ID = HateListInfo(OwnerID() ,i-1 , EM_HateListInfoType_GItemID );
		if CountBodyItem( ID , 206589 ) == 0 and CheckFlag( ID , 543569 ) == false then
			GiveBodyItem( ID , 206589 , 1 )
		end
	end

	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local X = GetMoveFlagValue( 780007 , 1 , EM_RoleValue_X )
	local Y = GetMoveFlagValue( 780007 , 1 , EM_RoleValue_Y)
	local Z = GetMoveFlagValue( 780007 , 1 , EM_RoleValue_Z )
	local Dir = GetMoveFlagValue( 780007 , 1 , EM_RoleValue_Dir )
	local KARDAMOTH = CreateObj( 113724 , X , Y+30 , Z ,  Dir , 1 )
	AddToPartition( KARDAMOTH  , Room )
	SetModeEX(KARDAMOTH , EM_SetModeType_Gravity, false )
--	AdjustFaceDir( KARDAMOTH  , TargetID(), 0 ) 
	Setfightmode( KARDAMOTH  , 0 , 0 , 0 , 0 )
	BeginPlot( KARDAMOTH  , "LuaI_113724_Play" , 0 )
	return true
end

function LuaI_113724_Play()
	CastSpell( OwnerID() , OwnerID()  , 492359 )
	sleep( 30 )
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_APPLAUSE )
	ScriptMessage( OwnerID() , -1 , 2 , "[SC_113724_0]" , 0 ) --�d�w�����G�������{�I�Z�H��......
	ScriptMessage( OwnerID() , -1 , 0 , "[SC_113724_0]" , 0 ) --�d�w�����G�������{�I�Z�H��......
	sleep( 30 )
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	ScriptMessage( OwnerID() , -1 , 2 , "[SC_113724_1]" , 0 ) --�d�w�����G���Q���A�̤]�w�g�F�ѱ��`���s��ǩҥ������諸���D......
	ScriptMessage( OwnerID() , -1 , 0 , "[SC_113724_1]" , 0 ) --�d�w�����G���Q���A�̤]�w�g�F�ѱ��`���s��ǩҥ������諸���D......
	sleep( 25 )
	AdjustDir( OwnerID(), 180 )
	sleep( 30 )
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_LAUGH )
	ScriptMessage( OwnerID() , -1 , 2 , "[SC_113724_2]" , 0 ) --�d�w�����G����������گu���ݧA�̻P���s�����������@��......
	ScriptMessage( OwnerID() , -1 , 0 , "[SC_113724_2]" , 0 ) --�d�w�����G����������گu���ݧA�̻P���s�����������@��......
	sleep( 20 )
	CastSpell( OwnerID() , OwnerID() , 492359 )
	sleep( 10 )
	Hide( OwnerID() )
	ScriptMessage( OwnerID() , -1 , 2 , "[SC_113724_3]" , 0 ) --�d�w�����G���@�w�ܦ��N��...����.......��������........
	ScriptMessage( OwnerID() , -1 , 0 , "[SC_113724_3]" , 0 ) --�d�w�����G���@�w�ܦ��N��...����.......��������........
	sleep( 30 )
	DelObj (OwnerID() )
end