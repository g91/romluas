function Lua_GetPos_Obj( ObjID )

	local Owner = ObjID or OwnerID();
	local OwnerPos = Vector_GetRolePos(Owner);
	local Room = ReadRoleValue( Owner, EM_RoleValue_RoomID );
	local Dir = ReadRoleValue( Owner, EM_RoleValue_Dir );

--	DebugMsg( Owner, Room, tostring(OwnerPos)..", Dir = "..Dir );
	return OwnerPos.X, OwnerPos.Y, OwnerPos.Z, Dir;
end

function Lua_GetPos_Flag( FlagID, FlagNum )	-- 回傳旗標的座標

	if FlagID == nil or FlagNum == nil then return end;

	local X = GetMoveFlagValue( FlagID, FlagNum, EM_RoleValue_X );
	local Y = GetMoveFlagValue( FlagID, FlagNum, EM_RoleValue_Y );
	local Z = GetMoveFlagValue( FlagID, FlagNum, EM_RoleValue_Z );
	local Dir = GetMoveFlagValue( FlagID, FlagNum, EM_RoleValue_Dir );
	return X , Y , Z , Dir;
end

-- 輸入距離與角度( 以參考物件面向為基準，0為前方、90為右方、-90為左方、180為後方 )
function Lua_GetPos_ObjPos( ObjID, Distance, Angle, Switch )	-- 回傳以參考物件為原點，指定距離與角度的座標點，該座標點違法時，回傳參考物件的原座標點
	-- Switch 不填時，不做打線檢查，為 true 時做打線檢查。
	local ObjID = ObjID or OwnerID();
	local ObjIDPos = Vector_GetRolePos( ObjID );
	local Dir = ReadRoleValue( ObjID, EM_RoleValue_Dir );
	local Height = 20;	-- 打線高度，配合檢查提高高度，避免兩點以水平面做打線檢查時總是回傳False的問題
	local VecDir = Vector_DirToVector( Dir + 90 + Angle );	-- 當前角度 + 指定偏移角度 的向量

	local EndPos = ObjIDPos + VecDir * Distance;	-- 指定座標點
	EndPos.Y = GetHeight( EndPos.X, EndPos.Y, EndPos.Z );	-- 求地表
	
	if ( EndPos.Y - ObjIDPos.Y ) > 100 or ( EndPos.Y - ObjIDPos.Y ) < -100 then
		EndPos.Y = ObjIDPos.Y;
	end
	
	if not Switch then
		DebugMsg( 0, 0, tostring(EndPos)..", Dir = "..Dir );
		return EndPos.X, EndPos.Y, EndPos.Z, Dir;
	else
		if CheckLine( ObjIDPos.X, ObjIDPos.Y+Height, ObjIDPos.Z, EndPos.X, EndPos.Y+Height, EndPos.Z ) == true then
			DebugMsg( 0, 0, tostring(EndPos)..", Dir = "..Dir );
			return EndPos.X, EndPos.Y, EndPos.Z, Dir;
		end
	end
	DebugMsg( 0, 0, tostring(ObjIDPos)..", Dir = "..Dir );
	return ObjIDPos.X, ObjIDPos.Y, ObjIDPos.Z, Dir;
end

function Lua_GetDistance( X1, Y1, Z1, X2, Y2, Z2 )	-- 回傳兩座標點的距離

	return Math.Sqrt( (X1-X2)*(X1-X2) + (Y1-Y2)*(Y1-Y2) + (Z1-Z2)*(Z1-Z2) );	-- 開更號，取兩點距離
end

function Lua_GetDistancePlus( StartPos, EndPos )

	return Lua_GetDistance( StartPos.X, StartPos.Y, StartPos.Z, EndPos.X, EndPos.Y, EndPos.Z );	-- 回傳兩座標點的距離
end

function Lua_GetDistance_ObjtoFlag( ObjID, FlagID, FlagNum )	-- 回傳參考物件至參考旗標指定號碼的距離

	local X1 , Y1 , Z1 = Lua_GetPos_Obj( ObjID );
	local X2 , Y2 , Z2 = Lua_GetPos_Flag( FlagID, FlagNum );
	return Lua_GetDistance( X1 , Y1 , Z1 , X2 , Y2 , Z2 );	-- 開更號，取兩點距離
end

function Lua_GetAngle( X1 , Z1 , X2 , Z2 )	-- 回傳以座標點 1 向座標點 2 看過去的角度

	return Math.atan2( X2-X1 , Z2-Z1 ) / math.pi * 180;	-- 角度
end

function Lua_FaceFlag( ObjID, FlagID, FlagNum, Angle )	-- 讓參考物件面向參考旗標，Angle 設為 0 時面向目標、Angle 設為 180 時背向目標

	local ObjID = ObjID or OwnerID();
	local ObjIDPos = Vector_GetRolePos(ObjID);
	local Dir = ReadRoleValue( ObjID, EM_RoleValue_Dir );

	local FlagPos = {};
	FlagPos.X, FlagPos.Y, FlagPos.Z = Lua_GetPos_Flag( FlagID, FlagNum )	-- 目標座標

	local RotationAngle = Lua_GetAngle( ObjIDPos.X, ObjIDPos.Z, FlagPos.X, FlagPos.Z );	-- 夾角
	AdjustDir( ObjID, Dir+RotationAngle+Angle );	-- 參考物件角度 + 參考物件與指定旗標間的角度 + 指定角度
end

function Lua_WaitMoveto( ObjID, X, Y, Z )	-- 讓參考物件走到指定座標才執行下個動作

	local ObjID = ObjID or OwnerID();
	local Room = ReadRoleValue( ObjID, EM_RoleValue_RoomID );
	local Dir = ReadRoleValue( ObjID, EM_RoleValue_Dir );
	MoveToFlagEnabled( ObjID , false );    -- 關閉巡邏點功能
--	DebugMsg( 0, 0, "EndPos, X = " ..X..", Y = "..Y.." Z = "..Z );
	local EndPos = CVector:new( X, Y, Z );
	MoveDirect( ObjID, EndPos.X, EndPos.Y, EndPos.Z );

	local DeviationDis = 10;	-- 當前座標與指定座標可允許的誤差距離
	local FightStatus = false;	-- 戰鬥狀態
	local Count = 0;	-- 計數器

	while Count < 120 do	-- 每0.5秒檢查一次ObjID的當前座標與指定座標相差的距離，檢查至60秒時，ObjID若沒有至指定座標點，則將ObjID傳送至指定作標點
		local HateCount = HateListCount( ObjID );	-- 查詢仇恨列表中是否有目標
		local ObjIDPos = Vector_GetRolePos( ObjID );	-- 當前座標
	--	取得兩座標點相差距離，目標於戰鬥中時，會暫停60秒倒數，直到目標脫離戰鬥，才重新倒數
		if Lua_GetDistancePlus( ObjIDPos, EndPos ) < DeviationDis then
		--	DebugMsg( 0, Room, "The End" )
			return true;
		end

	--	DebugMsg( 0, 0, "Count = "..Count.." , Hate Count = "..HateCount );

		if HateCount == 0 then	-- 仇恨列表中沒人時
	--	if ReadRoleValue( ObjID , EM_RoleValue_IsAttackMode ) == 0 then	-- 脫離戰鬥，需等待系統的脫離戰鬥時間。
			Count = Count + 1
		else
			FightStatus = true;
		end
		if FightStatus and HateCount == 0 then	-- 當ObjID進入戰鬥後，重新脫離戰鬥時，再次執行移動，避免ObjID呆滯的情況
			MoveDirect( ObjID, EndPos.X, EndPos.Y, EndPos.Z );
			FightStatus = false;
		end
	--	DebugMsg( 0, Room, "FightStatus = "..FightStatus );
		Sleep(5);
	--	DebugMsg( 0, Room, "Count = "..Count );
	end
	SetPos( ObjID, X , Y, Z, Dir );
	return true;
end

function Lua_WaitMovetoFlag( ObjID, FlagID, FlagNum )	-- 讓參考物件移動到指定的座標點才執行下個動作

	local X, Y, Z = Lua_GetPos_Flag( FlagID, FlagNum );	-- 回傳參考旗標指定編號的 X , Y , Z
--	DebugMsg( 0, 0, "Flag, X = " ..X..", Y = "..Y.." Z = "..Z );
	Lua_WaitMoveto( ObjID , X , Y , Z );
end


-- 以下為工具
-----------------------------------------------------------------------------------
function Lua_Jumper( Distance, Height, Angle )	-- 移動工具、瞬間移動至指定距離、高度、角度
--/? pcall %s_id "Lua_Jumper(100,100,90)"
	local Owner = OwnerID();
	local OwnerPos = Vector_GetRolePos(Owner);
	local Dir = ReadRoleValue( Owner, EM_RoleValue_Dir );
	local Room = ReadRoleValue( Owner, EM_RoleValue_RoomID );
	local VecDir = Vector_DirToVector( Dir + 90 + Angle );	-- 角度轉向量
	local TargetPos = OwnerPos + VecDir * Distance;
	local Y = GetHeight( TargetPos.X, TargetPos.Y, TargetPos.Z );
	TargetPos.Y = TargetPos.Y + Height;
	
	if (TargetPos.Y - Y) > 100 or (TargetPos.Y - Y) < - 100 then
		Y = TargetPos.Y + Height;
	end
	TargetPos.Y = Y;
	SetPos( Owner, TargetPos.X, TargetPos.Y, TargetPos.Z, Dir );
end