-- 設定四邊形陣列，回傳 Table ( 參考物件、起始距離、選轉角度、直排行數、橫排行數、直排間距、橫排間距 )
function Lua_SetQuadrangleFormation( ObjID, OffSetDis, Rotation, Straight, Transverse, StraightDis, TransverseDis )

	local Owner = ObjID or OwnerID();
	local Room = ReadRoleValuefloat( Owner, EM_RoleValue_RoomID );
	local OwnerPos = Vector_GetRolePos( Owner );	-- 座標
	local Dir = ReadRoleValue( Owner, EM_RoleValue_Dir );	-- 角度
	local StraightVec = Vector_DirToVector( Dir + Rotation + 90 );	-- 角度轉向量，直向向量
	local TransverseVec = Vector_DirToVector( Dir + Rotation + 180 );	-- 角度轉向量，橫向向量
--	DebugMsg( Owner, Room, "\n".."Location = "..tostring( OwnerPos ).."\n".."Dir = "..Dir.."\n".."Vec1 = "..tostring( StraightVec ).."\n".."Vec2  = "..tostring( TransverseVec ) );
	local StraightOffsetDis = -( (Straight-1)*StraightDis )/2;	-- 直向中心點位置
	local TransverseOffsetDis = -( (Transverse-1)*TransverseDis )/2;	-- 橫向中心點位置
--	DebugMsg( Owner, Room, "StraightOffsetDis = "..tostring( StraightOffsetDis ).." , TransverseOffsetDis  = "..tostring( TransverseOffsetDis ) );

	local PosList = {}	-- 產生位置的座標清單

	for X = 0, Straight - 1 do	-- 直向
		for Y = 0, Transverse - 1 do	-- 橫向
			local Straight = X * StraightDis + StraightOffsetDis;	-- 直向偏移距離 + 偏移量
			local Transverse = Y * TransverseDis + TransverseOffsetDis;	-- 橫向偏移距離 + 偏移量
		--	DebugMsg( Owner, Room, "Straight = "..tostring( Straight ).." , Transverse  = "..tostring( Transverse ) );
			local Pos = OwnerPos + StraightVec * (Straight + OffSetDis);	-- 加入直向偏移與自訂起始距離的座標
			Pos = Pos + TransverseVec * (Transverse + OffSetDis);	-- 加上橫向偏移與自訂起始距離的座標
			table.insert( PosList, Pos );
		end
	end
	return PosList;
end

-- 創造施法物件
function Hao_CreateSpellObj( Obj, Dir, LiveTime )

	local Obj = Obj or OwnerID();
	local Dir = Dir or ReadRoleValue( Obj, EM_RoleValue_Dir );
	local LiveTime = LiveTime or 6;	-- 生存時間預設 6 秒
	local ObjPos = Vector_GetRolePos( Obj );
	local Room = ReadRoleValue( Obj, EM_RoleValue_RoomID );
	local SpellObj = CreateObj( 107071, ObjPos.x, ObjPos.y, ObjPos.z, Dir, 1 );
--	SetModeEx( SpellObj, EM_SetModeType_Show, false );	-- 顯示
	SetModeEx( SpellObj, EM_SetModeType_Mark, false );	-- 標記
	SetModeEx( SpellObj, EM_SetModeType_Fight, false );	-- 砍殺
	SetModeEx( SpellObj, EM_SetModeType_Strikback, false );	-- 反擊
	SetModeEx( SpellObj, EM_SetModeType_Searchenemy, false );	-- 索敵
	SetModeEx( SpellObj, EM_SetModeType_Move, false );	-- 關閉移動
	WriteRoleValue( SpellObj, EM_RoleValue_LiveTime, LiveTime );	-- 透明物件生存時間
	AddToPartition( SpellObj, Room );
	return SpellObj;
end