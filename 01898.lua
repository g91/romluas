function sasa_16PE_trap()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)	--�ŧi�a��
	local trap							--�ŧi								
	
	trap = LuaFunc_CreateObjByObj ( 104037, TargetID() )	--���ͪ���(�и�, �ؼ�)
	SetModeEx( trap , EM_SetModeType_Strikback, false)		--����
	SetModeEx( trap , EM_SetModeType_Move, false) 		--����	
	SetModeEx( trap , EM_SetModeType_Fight, false) 		--�i���
	SetModeEx( trap , EM_SetModeType_Searchenemy, false )	--����
	SetModeEx( trap  , EM_SetModeType_NotShowHPMP, true )
	AddToPartition( trap , RoomID )				--�ͨ�a�ϤW
	WriteRoleValue( trap , EM_RoleValue_Livetime, 10 )		--�g�J����s�b�ɶ�
	
	Addbuff( trap, 506650, 0,5)					--�W�@��buff( ��H, buff�s��, ����, �ɶ� )
	--��s�򲣥ͪ�buff
	sleep(50)
	Addbuff( trap, 506848, 0,-1)		-----�ܨ��L�ަ�
end