function LuaS_421019()
	LoadQuestOption( OwnerID() )	-- 載入任務模板
	if CheckAcceptQuest( OwnerID() , 421019 ) == true and CountBodyItem( OwnerID() , 202187 ) < 1 then
		AddSpeakOption( OwnerID(), TargetID(), GetString("SC_421019_0") ,      "LuaS_421019_Matsuri",     0 )	-- 準備完成，進行儀式
	end
end

function LuaS_421019_Matsuri()
	CloseSpeak( OwnerID() )	-- 關閉對話視窗
	BeginPlot( TargetID() , "LuaS_421019_MatsuriStart" , 0 )
end

function LuaS_421019_MatsuriStart()

	local Fire1, Fire2 , Fire3 , Fire4 , Fire5 , Fire6
	local M11 , M21 , M22 , M31 , M32 , M33 , M41 , M42 , M43 , M44 , M51 , M52 , M53 , M54 , M55

	DisableQuest( OwnerID() , true )
	MoveToFlagEnabled( OwnerID() , false )

	LuaFunc_MoveToFlag( OwnerID() , 780082 , 1 , 0 )
	Sleep( 5 )
	local Fire1a = CreateMonsterByBOSSBatch( 111061 , OwnerID() , 0 , 4 )
	AddToPartition( Fire1a , 0 )
	PlayMotionEX( OwnerID() , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_LOOP )
	Sleep( 50 )
	Fire1 = LuaFunc_CreateObjByObj ( 111062 , Fire1a )
	DelObj( Fire1a )
	Sleep( 10 )
	PlayMotionEX( OwnerID() , ruFUSION_ACTORSTATE_CRAFTING_LOOP , ruFUSION_ACTORSTATE_CRAFTING_END )

	M11 = LuaFunc_CreateObjByObj ( 100812 , Fire1 )
	SetAttack( M11 , TargetID() )

	--say(TargetID() , GetDistance( OwnerID() , TargetID() ))

	if ReadRoleValue( TargetID() , EM_RoleValue_IsDead ) == 0 and GetDistance( OwnerID() , TargetID() ) <= 300 then
		LuaFunc_MoveToFlag( OwnerID() , 780082 , 2 , 0 )
		Sleep( 5 )
		local Fire2a = CreateMonsterByBOSSBatch( 111061 , OwnerID() , 3 , 2 )
		AddToPartition( Fire2a , 0 )
		PlayMotionEX( OwnerID() , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_LOOP )
		Sleep( 50 )
		Fire2 = LuaFunc_CreateObjByObj ( 111062 , Fire2a )
		DelObj( Fire2a )
		Sleep( 10 )
		PlayMotionEX( OwnerID() , ruFUSION_ACTORSTATE_CRAFTING_LOOP , ruFUSION_ACTORSTATE_CRAFTING_END )

		M21 = LuaFunc_CreateObjByObj ( 100812 , Fire2 )
		SetAttack( M21 , TargetID() )
		M22 = LuaFunc_CreateObjByObj ( 100812 , Fire2 )
		SetAttack( M22 , TargetID() )
	end

	if ReadRoleValue( TargetID() , EM_RoleValue_IsDead ) == 0 and GetDistance( OwnerID() , TargetID() ) <= 300 then
		LuaFunc_MoveToFlag( OwnerID() , 780082 , 3 , 0 )
		Sleep( 5 )
		local Fire3a = CreateMonsterByBOSSBatch( 111061 , OwnerID() , 4 , -1 )
		AddToPartition( Fire3a , 0 )
		PlayMotionEX( OwnerID() , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_LOOP )
		Sleep( 50 )
		Fire3 = LuaFunc_CreateObjByObj ( 111062 , Fire3a )
		DelObj( Fire3a )
		Sleep( 10 )
		PlayMotionEX( OwnerID() , ruFUSION_ACTORSTATE_CRAFTING_LOOP , ruFUSION_ACTORSTATE_CRAFTING_END )

		M31 = LuaFunc_CreateObjByObj ( 100812 , Fire3 )
		SetAttack( M31 , TargetID() )
		M32 = LuaFunc_CreateObjByObj ( 100812 , Fire3 )
		SetAttack( M32 , TargetID() )
		M33 = LuaFunc_CreateObjByObj ( 100812 , Fire3 )
		SetAttack( M33 , TargetID() )
	end

	if ReadRoleValue( TargetID() , EM_RoleValue_IsDead ) == 0 and GetDistance( OwnerID() , TargetID() ) <= 300 then
		LuaFunc_MoveToFlag( OwnerID() , 780082 , 4 , 0 )
		Sleep( 5 )
		local Fire4a = CreateMonsterByBOSSBatch( 111061 , OwnerID() , 2 , -4 )
		AddToPartition( Fire4a , 0 )
		PlayMotionEX( OwnerID() , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_LOOP )
		Sleep( 50 )
		Fire4 = LuaFunc_CreateObjByObj ( 111062 , Fire4a )
		DelObj( Fire4a )
		Sleep( 10 )
		PlayMotionEX( OwnerID() , ruFUSION_ACTORSTATE_CRAFTING_LOOP , ruFUSION_ACTORSTATE_CRAFTING_END )

		M41 = LuaFunc_CreateObjByObj ( 100812 , Fire4 )
		SetAttack( M41 , TargetID() )
		M42 = LuaFunc_CreateObjByObj ( 100812 , Fire4 )
		SetAttack( M42 , TargetID() )
		M43 = LuaFunc_CreateObjByObj ( 100812 , Fire4 )
		SetAttack( M43 , TargetID() )
		M44 = LuaFunc_CreateObjByObj ( 100812 , Fire4 )
		SetAttack( M44 , TargetID() )
	end

	if ReadRoleValue( TargetID() , EM_RoleValue_IsDead ) == 0 and GetDistance( OwnerID() , TargetID() ) <= 300 then
		LuaFunc_MoveToFlag( OwnerID() , 780082 , 5 , 0 )
		Sleep( 5 )
		local Fire5a = CreateMonsterByBOSSBatch( 111061 , OwnerID() , -3 , -3 )
		AddToPartition( Fire5a , 0 )
		PlayMotionEX( OwnerID() , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_LOOP )
		Sleep( 50 )
		Fire5 = LuaFunc_CreateObjByObj ( 111062 , Fire5a )
		DelObj( Fire5a )
		Sleep( 10 )
		PlayMotionEX( OwnerID() , ruFUSION_ACTORSTATE_CRAFTING_LOOP , ruFUSION_ACTORSTATE_CRAFTING_END )

		M51 = LuaFunc_CreateObjByObj ( 100812 , Fire5 )
		SetAttack( M51 , TargetID() )
		M52 = LuaFunc_CreateObjByObj ( 100812 , Fire5 )
		SetAttack( M52 , TargetID() )
		M53 = LuaFunc_CreateObjByObj ( 100812 , Fire5 )
		SetAttack( M53 , TargetID() )
		M54 = LuaFunc_CreateObjByObj ( 100812 , Fire5 )
		SetAttack( M54 , TargetID() )
		M55 = LuaFunc_CreateObjByObj ( 100812 , Fire5 )
		SetAttack( M55 , TargetID() )
	end

	if ReadRoleValue( TargetID() , EM_RoleValue_IsDead ) == 0 and GetDistance( OwnerID() , TargetID() ) <= 300 then
		LuaFunc_MoveToFlag( OwnerID() , 780082 , 0 , 0 )
		Sleep( 5 )
		local Fire6a = CreateMonsterByBOSSBatch( 111061 , OwnerID() , -3 , 1 )
		AddToPartition( Fire6a , 0 )
		PlayMotionEX( OwnerID() , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_LOOP )
		Sleep( 50 )
		Fire6 = LuaFunc_CreateObjByObj ( 111062 , Fire6a )
		DelObj( Fire6a )
		Sleep( 10 )
		PlayMotionEX( OwnerID() , ruFUSION_ACTORSTATE_CRAFTING_LOOP , ruFUSION_ACTORSTATE_CRAFTING_END )
	end

	MoveToFlagEnabled( OwnerID() , true )
	Sleep( 25 )

	if Fire1 ~= nil then
		if CheckID( Fire1 ) == true then DelObj( Fire1 ) end
	end
	if Fire2 ~= nil then
		if CheckID( Fire2 ) == true then DelObj( Fire2 ) end
	end
	if Fire3 ~= nil then
		if CheckID( Fire3 ) == true then DelObj( Fire3 ) end
	end
	if Fire4 ~= nil then
		if CheckID( Fire4 ) == true then DelObj( Fire4 ) end
	end
	if Fire5 ~= nil then
		if CheckID( Fire5 ) == true then DelObj( Fire5 ) end
	end
	if Fire6 ~= nil then
		if CheckID( Fire6 ) == true then DelObj( Fire6 ) end
	end
	if M11 ~= nil then
		if CheckID( M11 ) == true then DelObj( M11 ) end	
	end
	if M21 ~= nil then
		if CheckID( M21 ) == true then DelObj( M21 ) end
	end
	if M22 ~= nil then
		if CheckID( M22 ) == true then DelObj( M22 ) end
	end
	if M31 ~= nil then
		if CheckID( M31 ) == true then DelObj( M31 ) end
	end
	if M32 ~= nil then
		if CheckID( M32 ) == true then DelObj( M32 ) end
	end
	if M33 ~= nil then
		if CheckID( M33 ) == true then DelObj( M33 ) end
	end
	if M41 ~= nil then
		if CheckID( M41 ) == true then DelObj( M41 ) end
	end
	if M42 ~= nil then
		if CheckID( M42 ) == true then DelObj( M42 ) end
	end
	if M43 ~= nil then
		if CheckID( M43 ) == true then DelObj( M43 ) end
	end
	if M44 ~= nil then
		if CheckID( M44 ) == true then DelObj( M44 ) end
	end
	if M51 ~= nil then
		if CheckID( M51 ) == true then DelObj( M51 ) end
	end
	if M52 ~= nil then
		if CheckID( M52 ) == true then DelObj( M52 ) end
	end
	if M53 ~= nil then
		if CheckID( M53 ) == true then DelObj( M53 ) end
	end
	if M54 ~= nil then
		if CheckID( M54 ) == true then DelObj( M54 ) end
	end
	if M55 ~= nil then
		if CheckID( M55 ) == true then DelObj( M55 ) end
	end

	DisableQuest( OwnerID() , false )
	if ReadRoleValue( TargetID() , EM_RoleValue_IsDead ) == 0 and GetDistance( OwnerID() , TargetID() ) <= 300 then
		GiveBodyItem( TargetID() , 202187 , 1 )
	end

	--AdjustDir( OwnerID() , 90 )
	LuaFunc_ResetObj( OwnerID() )

end
