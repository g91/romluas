function Cang_Z15_callhelp()

	sleep(30)
	local NPC = SearchRangeNPC ( OwnerID() , 100 )
	local Player = SearchRangePlayer ( OwnerID() , 100 )
	for i=0,table.getn(NPC)-1 do
		if CheckID( Player[0] ) == true and ReadRoleValue( Player[0] , EM_RoleValue_IsDead ) == 0 and ReadRoleValue( Player[0] , EM_RoleValue_IsPlayer ) == 1 then	--�ˬd���a�O���O�٦b�F�ˬd�O�_���`�F�ˬd�O���O���a
			SetAttack( NPC[i] , Player[0] ) --�n�D�Ǫ��������a
		end	
	end	
end


function Cang_Z15_bomb()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local bomb = LuaFunc_CreateObjByObj ( 103560, TargetID() )
	SetModeEX( bomb  , EM_SetModeType_Gravity , false )--���O
	SetModeEx( bomb  , EM_SetModeType_ShowRoleHead, false )--���q�Y����
	SetModeEx( bomb  , EM_SetModeType_Mark, false )--�аO
	SetModeEx( bomb  , EM_SetModeType_Move, false )--����
	SetModeEx( bomb  , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( bomb  , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( bomb  , EM_SetModeType_Strikback, false )--����				
	AddToPartition( bomb , RoomID )	
	Sleep(30)
	CastSpellLV(bomb, bomb, 495277 , 1 )
	sleep(50)
	DelObj(bomb)
end	