function Lua_GetPos_Obj( ObjID )

	local Owner = ObjID or OwnerID();
	local OwnerPos = Vector_GetRolePos(Owner);
	local Room = ReadRoleValue( Owner, EM_RoleValue_RoomID );
	local Dir = ReadRoleValue( Owner, EM_RoleValue_Dir );

--	DebugMsg( Owner, Room, tostring(OwnerPos)..", Dir = "..Dir );
	return OwnerPos.X, OwnerPos.Y, OwnerPos.Z, Dir;
end

function Lua_GetPos_Flag( FlagID, FlagNum )	-- �^�ǺX�Ъ��y��

	if FlagID == nil or FlagNum == nil then return end;

	local X = GetMoveFlagValue( FlagID, FlagNum, EM_RoleValue_X );
	local Y = GetMoveFlagValue( FlagID, FlagNum, EM_RoleValue_Y );
	local Z = GetMoveFlagValue( FlagID, FlagNum, EM_RoleValue_Z );
	local Dir = GetMoveFlagValue( FlagID, FlagNum, EM_RoleValue_Dir );
	return X , Y , Z , Dir;
end

-- ��J�Z���P����( �H�ѦҪ��󭱦V����ǡA0���e��B90���k��B-90������B180����� )
function Lua_GetPos_ObjPos( ObjID, Distance, Angle, Switch )	-- �^�ǥH�ѦҪ��󬰭��I�A���w�Z���P���ת��y���I�A�Ӯy���I�H�k�ɡA�^�ǰѦҪ��󪺭�y���I
	-- Switch ����ɡA�������u�ˬd�A�� true �ɰ����u�ˬd�C
	local ObjID = ObjID or OwnerID();
	local ObjIDPos = Vector_GetRolePos( ObjID );
	local Dir = ReadRoleValue( ObjID, EM_RoleValue_Dir );
	local Height = 20;	-- ���u���סA�t�X�ˬd�������סA�קK���I�H�����������u�ˬd���`�O�^��False�����D
	local VecDir = Vector_DirToVector( Dir + 90 + Angle );	-- ��e���� + ���w�������� ���V�q

	local EndPos = ObjIDPos + VecDir * Distance;	-- ���w�y���I
	EndPos.Y = GetHeight( EndPos.X, EndPos.Y, EndPos.Z );	-- �D�a��
	
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

function Lua_GetDistance( X1, Y1, Z1, X2, Y2, Z2 )	-- �^�Ǩ�y���I���Z��

	return Math.Sqrt( (X1-X2)*(X1-X2) + (Y1-Y2)*(Y1-Y2) + (Z1-Z2)*(Z1-Z2) );	-- �}�󸹡A�����I�Z��
end

function Lua_GetDistancePlus( StartPos, EndPos )

	return Lua_GetDistance( StartPos.X, StartPos.Y, StartPos.Z, EndPos.X, EndPos.Y, EndPos.Z );	-- �^�Ǩ�y���I���Z��
end

function Lua_GetDistance_ObjtoFlag( ObjID, FlagID, FlagNum )	-- �^�ǰѦҪ���ܰѦҺX�Ы��w���X���Z��

	local X1 , Y1 , Z1 = Lua_GetPos_Obj( ObjID );
	local X2 , Y2 , Z2 = Lua_GetPos_Flag( FlagID, FlagNum );
	return Lua_GetDistance( X1 , Y1 , Z1 , X2 , Y2 , Z2 );	-- �}�󸹡A�����I�Z��
end

function Lua_GetAngle( X1 , Z1 , X2 , Z2 )	-- �^�ǥH�y���I 1 �V�y���I 2 �ݹL�h������

	return Math.atan2( X2-X1 , Z2-Z1 ) / math.pi * 180;	-- ����
end

function Lua_FaceFlag( ObjID, FlagID, FlagNum, Angle )	-- ���ѦҪ��󭱦V�ѦҺX�СAAngle �]�� 0 �ɭ��V�ؼСBAngle �]�� 180 �ɭI�V�ؼ�

	local ObjID = ObjID or OwnerID();
	local ObjIDPos = Vector_GetRolePos(ObjID);
	local Dir = ReadRoleValue( ObjID, EM_RoleValue_Dir );

	local FlagPos = {};
	FlagPos.X, FlagPos.Y, FlagPos.Z = Lua_GetPos_Flag( FlagID, FlagNum )	-- �ؼЮy��

	local RotationAngle = Lua_GetAngle( ObjIDPos.X, ObjIDPos.Z, FlagPos.X, FlagPos.Z );	-- ����
	AdjustDir( ObjID, Dir+RotationAngle+Angle );	-- �ѦҪ��󨤫� + �ѦҪ���P���w�X�ж������� + ���w����
end

function Lua_WaitMoveto( ObjID, X, Y, Z )	-- ���ѦҪ��󨫨���w�y�Ф~����U�Ӱʧ@

	local ObjID = ObjID or OwnerID();
	local Room = ReadRoleValue( ObjID, EM_RoleValue_RoomID );
	local Dir = ReadRoleValue( ObjID, EM_RoleValue_Dir );
	MoveToFlagEnabled( ObjID , false );    -- ���������I�\��
--	DebugMsg( 0, 0, "EndPos, X = " ..X..", Y = "..Y.." Z = "..Z );
	local EndPos = CVector:new( X, Y, Z );
	MoveDirect( ObjID, EndPos.X, EndPos.Y, EndPos.Z );

	local DeviationDis = 10;	-- ��e�y�лP���w�y�Хi���\���~�t�Z��
	local FightStatus = false;	-- �԰����A
	local Count = 0;	-- �p�ƾ�

	while Count < 120 do	-- �C0.5���ˬd�@��ObjID����e�y�лP���w�y�Ьۮt���Z���A�ˬd��60��ɡAObjID�Y�S���ܫ��w�y���I�A�h�NObjID�ǰe�ܫ��w�@���I
		local HateCount = HateListCount( ObjID );	-- �d�ߤ���C���O�_���ؼ�
		local ObjIDPos = Vector_GetRolePos( ObjID );	-- ��e�y��
	--	���o��y���I�ۮt�Z���A�ؼЩ�԰����ɡA�|�Ȱ�60��˼ơA����ؼв����԰��A�~���s�˼�
		if Lua_GetDistancePlus( ObjIDPos, EndPos ) < DeviationDis then
		--	DebugMsg( 0, Room, "The End" )
			return true;
		end

	--	DebugMsg( 0, 0, "Count = "..Count.." , Hate Count = "..HateCount );

		if HateCount == 0 then	-- ����C���S�H��
	--	if ReadRoleValue( ObjID , EM_RoleValue_IsAttackMode ) == 0 then	-- �����԰��A�ݵ��ݨt�Ϊ������԰��ɶ��C
			Count = Count + 1
		else
			FightStatus = true;
		end
		if FightStatus and HateCount == 0 then	-- ��ObjID�i�J�԰���A���s�����԰��ɡA�A�����沾�ʡA�קKObjID�b�������p
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

function Lua_WaitMovetoFlag( ObjID, FlagID, FlagNum )	-- ���ѦҪ��󲾰ʨ���w���y���I�~����U�Ӱʧ@

	local X, Y, Z = Lua_GetPos_Flag( FlagID, FlagNum );	-- �^�ǰѦҺX�Ы��w�s���� X , Y , Z
--	DebugMsg( 0, 0, "Flag, X = " ..X..", Y = "..Y.." Z = "..Z );
	Lua_WaitMoveto( ObjID , X , Y , Z );
end


-- �H�U���u��
-----------------------------------------------------------------------------------
function Lua_Jumper( Distance, Height, Angle )	-- ���ʤu��B�������ʦܫ��w�Z���B���סB����
--/? pcall %s_id "Lua_Jumper(100,100,90)"
	local Owner = OwnerID();
	local OwnerPos = Vector_GetRolePos(Owner);
	local Dir = ReadRoleValue( Owner, EM_RoleValue_Dir );
	local Room = ReadRoleValue( Owner, EM_RoleValue_RoomID );
	local VecDir = Vector_DirToVector( Dir + 90 + Angle );	-- ������V�q
	local TargetPos = OwnerPos + VecDir * Distance;
	local Y = GetHeight( TargetPos.X, TargetPos.Y, TargetPos.Z );
	TargetPos.Y = TargetPos.Y + Height;
	
	if (TargetPos.Y - Y) > 100 or (TargetPos.Y - Y) < - 100 then
		Y = TargetPos.Y + Height;
	end
	TargetPos.Y = Y;
	SetPos( Owner, TargetPos.X, TargetPos.Y, TargetPos.Z, Dir );
end