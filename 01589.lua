function LuaI_102670_Dead()
	lua_star_BossKilledCount( 102670 )
	
	for i = 1 , HateListCount( OwnerID() ) , 1 do --給予魔龍之心
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
	ScriptMessage( OwnerID() , -1 , 2 , "[SC_113724_0]" , 0 ) --卡德摩斯：精采的表現！凡人們......
	ScriptMessage( OwnerID() , -1 , 0 , "[SC_113724_0]" , 0 ) --卡德摩斯：精采的表現！凡人們......
	sleep( 30 )
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	ScriptMessage( OwnerID() , -1 , 2 , "[SC_113724_1]" , 0 ) --卡德摩斯：但想必你們也已經了解殺害炎龍後裔所必須面對的問題......
	ScriptMessage( OwnerID() , -1 , 0 , "[SC_113724_1]" , 0 ) --卡德摩斯：但想必你們也已經了解殺害炎龍後裔所必須面對的問題......
	sleep( 25 )
	AdjustDir( OwnerID(), 180 )
	sleep( 30 )
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_LAUGH )
	ScriptMessage( OwnerID() , -1 , 2 , "[SC_113724_2]" , 0 ) --卡德摩斯：哈哈哈哈～我真期待你們與炎龍王見面的那一刻......
	ScriptMessage( OwnerID() , -1 , 0 , "[SC_113724_2]" , 0 ) --卡德摩斯：哈哈哈哈～我真期待你們與炎龍王見面的那一刻......
	sleep( 20 )
	CastSpell( OwnerID() , OwnerID() , 492359 )
	sleep( 10 )
	Hide( OwnerID() )
	ScriptMessage( OwnerID() , -1 , 2 , "[SC_113724_3]" , 0 ) --卡德摩斯：那一定很有意思...哼哼哼.......哈哈哈哈........
	ScriptMessage( OwnerID() , -1 , 0 , "[SC_113724_3]" , 0 ) --卡德摩斯：那一定很有意思...哼哼哼.......哈哈哈哈........
	sleep( 30 )
	DelObj (OwnerID() )
end