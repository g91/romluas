-- �]�w�|��ΰ}�C�A�^�� Table ( �ѦҪ���B�_�l�Z���B���ਤ�סB���Ʀ�ơB��Ʀ�ơB���ƶ��Z�B��ƶ��Z )
function Lua_SetQuadrangleFormation( ObjID, OffSetDis, Rotation, Straight, Transverse, StraightDis, TransverseDis )

	local Owner = ObjID or OwnerID();
	local Room = ReadRoleValuefloat( Owner, EM_RoleValue_RoomID );
	local OwnerPos = Vector_GetRolePos( Owner );	-- �y��
	local Dir = ReadRoleValue( Owner, EM_RoleValue_Dir );	-- ����
	local StraightVec = Vector_DirToVector( Dir + Rotation + 90 );	-- ������V�q�A���V�V�q
	local TransverseVec = Vector_DirToVector( Dir + Rotation + 180 );	-- ������V�q�A��V�V�q
--	DebugMsg( Owner, Room, "\n".."Location = "..tostring( OwnerPos ).."\n".."Dir = "..Dir.."\n".."Vec1 = "..tostring( StraightVec ).."\n".."Vec2  = "..tostring( TransverseVec ) );
	local StraightOffsetDis = -( (Straight-1)*StraightDis )/2;	-- ���V�����I��m
	local TransverseOffsetDis = -( (Transverse-1)*TransverseDis )/2;	-- ��V�����I��m
--	DebugMsg( Owner, Room, "StraightOffsetDis = "..tostring( StraightOffsetDis ).." , TransverseOffsetDis  = "..tostring( TransverseOffsetDis ) );

	local PosList = {}	-- ���ͦ�m���y�вM��

	for X = 0, Straight - 1 do	-- ���V
		for Y = 0, Transverse - 1 do	-- ��V
			local Straight = X * StraightDis + StraightOffsetDis;	-- ���V�����Z�� + �����q
			local Transverse = Y * TransverseDis + TransverseOffsetDis;	-- ��V�����Z�� + �����q
		--	DebugMsg( Owner, Room, "Straight = "..tostring( Straight ).." , Transverse  = "..tostring( Transverse ) );
			local Pos = OwnerPos + StraightVec * (Straight + OffSetDis);	-- �[�J���V�����P�ۭq�_�l�Z�����y��
			Pos = Pos + TransverseVec * (Transverse + OffSetDis);	-- �[�W��V�����P�ۭq�_�l�Z�����y��
			table.insert( PosList, Pos );
		end
	end
	return PosList;
end

-- �гy�I�k����
function Hao_CreateSpellObj( Obj, Dir, LiveTime )

	local Obj = Obj or OwnerID();
	local Dir = Dir or ReadRoleValue( Obj, EM_RoleValue_Dir );
	local LiveTime = LiveTime or 6;	-- �ͦs�ɶ��w�] 6 ��
	local ObjPos = Vector_GetRolePos( Obj );
	local Room = ReadRoleValue( Obj, EM_RoleValue_RoomID );
	local SpellObj = CreateObj( 107071, ObjPos.x, ObjPos.y, ObjPos.z, Dir, 1 );
--	SetModeEx( SpellObj, EM_SetModeType_Show, false );	-- ���
	SetModeEx( SpellObj, EM_SetModeType_Mark, false );	-- �аO
	SetModeEx( SpellObj, EM_SetModeType_Fight, false );	-- ���
	SetModeEx( SpellObj, EM_SetModeType_Strikback, false );	-- ����
	SetModeEx( SpellObj, EM_SetModeType_Searchenemy, false );	-- ����
	SetModeEx( SpellObj, EM_SetModeType_Move, false );	-- ��������
	WriteRoleValue( SpellObj, EM_RoleValue_LiveTime, LiveTime );	-- �z������ͦs�ɶ�
	AddToPartition( SpellObj, Room );
	return SpellObj;
end