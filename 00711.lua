function LuaS_421014()
	LoadQuestOption( OwnerID() )	-- 載入任務模板
	if CheckAcceptQuest( OwnerID() , 421014 ) == true and CountBodyItem( OwnerID() , 202186 ) < 1 then
		AddSpeakOption( OwnerID(), TargetID(), GetString("SC_421014_0") ,      "LuaS_421014_Matsuri",     0 )	-- 準備完成，進行儀式
	end
end

function LuaS_421014_Matsuri()
	CloseSpeak( OwnerID() )	-- 關閉對話視窗
	BeginPlot( TargetID() , "LuaS_421014_MatsuriStart" , 0 )
end

function LuaS_421014_MatsuriStart()

	local M11 , M12 , M13 , M14 , M21 , M22 , M23 , M24 , M31 , M32 , M33 , M34 , M35 , M36 , M37

	DisableQuest( OwnerID() , true )
	MoveToFlagEnabled( OwnerID() , false )

	LuaFunc_MoveToFlag( OwnerID() , 780081 , 8 , 0 )
	Sleep( 5 )
	PlayMotionEX( OwnerID() , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_LOOP )
	Sleep( 10 )

	if ReadRoleValue( TargetID() , EM_RoleValue_IsDead ) == 0 and GetDistance( OwnerID() , TargetID() ) <= 300 then
		M11 = CreateObjByFlag( 100811 , 780081 , 1 , 1 )
		AddToPartition( M11 , 0 )
		SetAttack( M11 , TargetID() )
		M12 = CreateObjByFlag( 100811 , 780081 , 3 , 1 )
		AddToPartition( M12 , 0 )
		SetAttack( M12 , TargetID() )
		M13 = CreateObjByFlag( 100811 , 780081 , 5 , 1 )
		AddToPartition( M13 , 0 )
		SetAttack( M13 , TargetID() )
		M14 = CreateObjByFlag( 100811 , 780081 , 7 , 1 )
		AddToPartition( M14 , 0 )
		SetAttack( M14 , TargetID() )
	end
	Sleep( 100 )

	if ReadRoleValue( TargetID() , EM_RoleValue_IsDead ) == 0 and GetDistance( OwnerID() , TargetID() ) <= 300 then
		M21 = CreateObjByFlag( 100811 , 780081 , 0 , 1 )
		AddToPartition( M21 , 0 )
		SetAttack( M21 , TargetID() )
		M22 = CreateObjByFlag( 100811 , 780081 , 2 , 1 )
		AddToPartition( M22 , 0 )
		SetAttack( M22 , TargetID() )
		M23 = CreateObjByFlag( 100811 , 780081 , 4 , 1 )
		AddToPartition( M23 , 0 )
		SetAttack( M23 , TargetID() )
		M24 = CreateObjByFlag( 100811 , 780081 , 6 , 1 )
		AddToPartition( M24 , 0 )
		SetAttack( M24 , TargetID() )
	end
	Sleep( 100 )

	if ReadRoleValue( TargetID() , EM_RoleValue_IsDead ) == 0 and GetDistance( OwnerID() , TargetID() ) <= 300 then
		M31 = CreateObjByFlag( 100811 , 780081 , 1 , 1 )
		AddToPartition( M31 , 0 )
		SetAttack( M31 , TargetID() )
		M32 = CreateObjByFlag( 100811 , 780081 , 2 , 1 )
		AddToPartition( M32 , 0 )
		SetAttack( M32 , TargetID() )
		M33 = CreateObjByFlag( 100811 , 780081 , 3 , 1 )
		AddToPartition( M33 , 0 )
		SetAttack( M33 , TargetID() )
		M34 = CreateObjByFlag( 100811 , 780081 , 4 , 1 )
		AddToPartition( M34 , 0 )
		SetAttack( M34 , TargetID() )
		M35 = CreateObjByFlag( 100811 , 780081 , 5 , 1 )
		AddToPartition( M35 , 0 )
		SetAttack( M35 , TargetID() )
		M36 = CreateObjByFlag( 100811 , 780081 , 6 , 1 )
		AddToPartition( M36 , 0 )
		SetAttack( M36 , TargetID() )
		M37 = CreateObjByFlag( 100811 , 780081 , 7 , 1 )
		AddToPartition( M37 , 0 )
		SetAttack( M37 , TargetID() )
	end
	Sleep( 200 )

	PlayMotionEX( OwnerID() , ruFUSION_ACTORSTATE_CRAFTING_LOOP , ruFUSION_ACTORSTATE_CRAFTING_END )
	Sleep( 10 )
	MoveToFlagEnabled( OwnerID() , true )
	Sleep( 100 )

	if M11 ~= nil then
		if CheckID( M11 ) == true then DelObj( M11 ) end
	end
	if M12 ~= nil then
		if CheckID( M12 ) == true then DelObj( M12 ) end
	end
	if M13 ~= nil then
		if CheckID( M13 ) == true then DelObj( M13 ) end
	end
	if M14 ~= nil then
		if CheckID( M14 ) == true then DelObj( M14 ) end
	end
	if M21 ~= nil then
		if CheckID( M21 ) == true then DelObj( M21 ) end
	end
	if M22 ~= nil then
		if CheckID( M22 ) == true then DelObj( M22 ) end
	end
	if M23 ~= nil then
		if CheckID( M23 ) == true then DelObj( M23 ) end
	end
	if M24 ~= nil then
		if CheckID( M24 ) == true then DelObj( M24 ) end
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
	if M34 ~= nil then
		if CheckID( M34 ) == true then DelObj( M34 ) end
	end
	if M35 ~= nil then
		if CheckID( M35 ) == true then DelObj( M35 ) end
	end
	if M36 ~= nil then
		if CheckID( M36 ) == true then DelObj( M36 ) end
	end
	if M37 ~= nil then
		if CheckID( M37 ) == true then DelObj( M37 ) end
	end

	DisableQuest( OwnerID() , false )
	if ReadRoleValue( TargetID() , EM_RoleValue_IsDead ) == 0 and GetDistance( OwnerID() , TargetID() ) <= 300 then
		GiveBodyItem( TargetID() , 202186 , 1 )
	end

	--AdjustDir( OwnerID() , 90 )
	LuaFunc_ResetObj( OwnerID() )

end
