function bk_130_he_104461()  ---- -----���˥d
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )   -------------Ū�X�{�b��room 
	local Count = SetSearchAllNPC(RoomID)
	local kill=TargetID()
	local x=0
	local bg=0    --- 1 ���S���_�c�ϥάݤ��쪺�p�ǨӰO������������
	for i=1 , Count do
		NpcGID = GetSearchResult()
		if ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 116466				-----������ת�����
			and ReadRoleValue( NpcGID , EM_RoleValue_IsDead ) == 0 then 
			x= ReadRoleValue( NpcGID,EM_RoleValue_Register1)
		end
	end 
	if x==1 then 
		bg = CreateObjByFlag( 104739,780770,1,1)
        SetModeEx( bg , EM_SetModeType_Mark, false)
		SetModeEx( bg , EM_SetModeType_Searchenemy, false)
		SetModeEx( bg , EM_SetModeType_HideName, false)
		SetModeEx( bg , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( bg , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( bg , EM_SetModeType_Strikback, false) ---����
		SetModeEx( bg , EM_SetModeType_Move, false) ---����	
		SetModeEx( bg , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( bg , EM_SetModeType_Show, false)
		AddToPartition(bg , RoomID )	
		KillID(kill,bg)
	elseif x==2 then 
		bg = CreateObjByFlag( 104748,780770,1,1)
		SetModeEx( bg , EM_SetModeType_Mark, false)
		SetModeEx( bg , EM_SetModeType_Searchenemy, false)
		SetModeEx( bg , EM_SetModeType_HideName, false)
		SetModeEx( bg , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( bg , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( bg , EM_SetModeType_Strikback, false) ---����
		SetModeEx( bg , EM_SetModeType_Move, false) ---����	
		SetModeEx( bg , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( bg , EM_SetModeType_Show, false)
		AddToPartition(bg , RoomID )
		KillID(kill,bg)
	elseif x==3 then 
		bg = CreateObjByFlag( 104750,780770,1,1)
		SetModeEx( bg , EM_SetModeType_Mark, false)
		SetModeEx( bg , EM_SetModeType_Searchenemy, false)
		SetModeEx( bg , EM_SetModeType_HideName, false)
		SetModeEx( bg , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( bg , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( bg , EM_SetModeType_Strikback, false) ---����
		SetModeEx( bg , EM_SetModeType_Move, false) ---����	
		SetModeEx( bg , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( bg , EM_SetModeType_Show, false)
		AddToPartition(bg , RoomID )
		KillID(kill,bg)
	elseif x==4 then 
		bg = CreateObjByFlag( 104752,780770,1,1)
		SetModeEx( bg , EM_SetModeType_Mark, false)
		SetModeEx( bg , EM_SetModeType_Searchenemy, false)
		SetModeEx( bg , EM_SetModeType_HideName, false)
		SetModeEx( bg , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( bg , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( bg , EM_SetModeType_Strikback, false) ---����
		SetModeEx( bg , EM_SetModeType_Move, false) ---����	
		SetModeEx( bg , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( bg , EM_SetModeType_Show, false)
		AddToPartition(bg , RoomID )
		KillID(kill,bg)
	elseif x==5 then
		bg = CreateObjByFlag( 104754,780770,1,1)
		SetModeEx( bg , EM_SetModeType_Mark, false)
		SetModeEx( bg , EM_SetModeType_Searchenemy, false)
		SetModeEx( bg , EM_SetModeType_HideName, false)
		SetModeEx( bg , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( bg , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( bg , EM_SetModeType_Strikback, false) ---����
		SetModeEx( bg , EM_SetModeType_Move, false) ---����	
		SetModeEx( bg , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( bg , EM_SetModeType_Show, false)
		AddToPartition(bg , RoomID )	
		KillID(kill,bg)
	elseif x==6 then 
		bg = CreateObjByFlag( 104741,780770,1,1)
		SetModeEx( bg , EM_SetModeType_Mark, false)
		SetModeEx( bg , EM_SetModeType_Searchenemy, false)
		SetModeEx( bg , EM_SetModeType_HideName, false)
		SetModeEx( bg , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( bg , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( bg , EM_SetModeType_Strikback, false) ---����
		SetModeEx( bg , EM_SetModeType_Move, false) ---����	
		SetModeEx( bg , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( bg , EM_SetModeType_Show, false)
		AddToPartition(bg , RoomID )
		KillID(kill,bg)
	end	

end
function bk_130_he_103946()   ---------�L���h��
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )   -------------Ū�X�{�b��room 
	local Count = SetSearchAllNPC(RoomID)
	local kill=TargetID()
	local x=0
	local bg=0    --- 1 ���S���_�c�ϥάݤ��쪺�p�ǨӰO������������
	for i=1 , Count do
		NpcGID = GetSearchResult()
		if ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 116466				-----������ת�����
			and ReadRoleValue( NpcGID , EM_RoleValue_IsDead ) == 0 then 
			x= ReadRoleValue( NpcGID,EM_RoleValue_Register1)
		end
	end 
	if x==1 then 
		bg = CreateObjByFlag( 104740,780770,2,1)
		SetModeEx( bg , EM_SetModeType_Mark, false)
		SetModeEx( bg , EM_SetModeType_Searchenemy, false)
		SetModeEx( bg , EM_SetModeType_HideName, false)
		SetModeEx( bg , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( bg , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( bg , EM_SetModeType_Strikback, false) ---����
		SetModeEx( bg , EM_SetModeType_Move, false) ---����	
		SetModeEx( bg , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( bg , EM_SetModeType_Show, false)
		AddToPartition(bg , RoomID )
		KillID(kill,bg)
	elseif x==2 then 
		bg = CreateObjByFlag( 104749,780770,2,1)
		SetModeEx( bg , EM_SetModeType_Mark, false)
		SetModeEx( bg , EM_SetModeType_Searchenemy, false)
		SetModeEx( bg , EM_SetModeType_HideName, false)
		SetModeEx( bg , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( bg , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( bg , EM_SetModeType_Strikback, false) ---����
		SetModeEx( bg , EM_SetModeType_Move, false) ---����	
		SetModeEx( bg , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( bg , EM_SetModeType_Show, false)
		AddToPartition(bg , RoomID )
		KillID(kill,bg)
	elseif x==3 then 
		bg = CreateObjByFlag( 104751,780770,2,1)
		SetModeEx( bg , EM_SetModeType_Mark, false)
		SetModeEx( bg , EM_SetModeType_Searchenemy, false)
		SetModeEx( bg , EM_SetModeType_HideName, false)
		SetModeEx( bg , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( bg , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( bg , EM_SetModeType_Strikback, false) ---����
		SetModeEx( bg , EM_SetModeType_Move, false) ---����	
		SetModeEx( bg , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( bg , EM_SetModeType_Show, false)
		AddToPartition(bg , RoomID )
		KillID(kill,bg)
	elseif x==4 then 
		bg = CreateObjByFlag( 104753,780770,2,1)
		SetModeEx( bg , EM_SetModeType_Mark, false)
		SetModeEx( bg , EM_SetModeType_Searchenemy, false)
		SetModeEx( bg , EM_SetModeType_HideName, false)
		SetModeEx( bg , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( bg , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( bg , EM_SetModeType_Strikback, false) ---����
		SetModeEx( bg , EM_SetModeType_Move, false) ---����	
		SetModeEx( bg , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( bg , EM_SetModeType_Show, false)
		AddToPartition(bg , RoomID )
		KillID(kill,bg)
	elseif x==5 then
		bg = CreateObjByFlag( 104755,780770,2,1)
		SetModeEx( bg , EM_SetModeType_Mark, false)
		SetModeEx( bg , EM_SetModeType_Searchenemy, false)
		SetModeEx( bg , EM_SetModeType_HideName, false)
		SetModeEx( bg , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( bg , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( bg , EM_SetModeType_Strikback, false) ---����
		SetModeEx( bg , EM_SetModeType_Move, false) ---����	
		SetModeEx( bg , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( bg , EM_SetModeType_Show, false)
		AddToPartition(bg , RoomID )	
		KillID(kill,bg)
	elseif x==6 then 
		bg = CreateObjByFlag( 104742,780770,2,1)
		SetModeEx( bg , EM_SetModeType_Mark, false)
		SetModeEx( bg , EM_SetModeType_Searchenemy, false)
		SetModeEx( bg , EM_SetModeType_HideName, false)
		SetModeEx( bg , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( bg , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( bg , EM_SetModeType_Strikback, false) ---����
		SetModeEx( bg , EM_SetModeType_Move, false) ---����	
		SetModeEx( bg , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( bg , EM_SetModeType_Show, false)
		AddToPartition(bg , RoomID )
		KillID(kill,bg)
	end	
end
function bk_130_he_103947()----����d���_�c
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )   -------------Ū�X�{�b��room 
	local Count = SetSearchAllNPC(RoomID)
	local kill=TargetID()
	local x=0
	local bg=0
	for i=1 , Count do
		NpcGID = GetSearchResult()
		if ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 116466				-----������ת�����
			and ReadRoleValue( NpcGID , EM_RoleValue_IsDead ) == 0 then 
			x= ReadRoleValue( NpcGID,EM_RoleValue_Register1)
		end
	end 
	if x==1 then 
		bg = CreateObjByFlag( 104574,780770,3,1)
		SetModeEx( bg , EM_SetModeType_Mark, true)
		SetModeEx( bg , EM_SetModeType_Searchenemy, false)
		SetModeEx( bg , EM_SetModeType_HideName, false)
		SetModeEx( bg , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( bg , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( bg , EM_SetModeType_Strikback, false) ---����
		SetModeEx( bg , EM_SetModeType_Move, false) ---����	
		SetModeEx( bg , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( bg , EM_SetModeType_Show, true)
		AddToPartition(bg , RoomID )
	elseif x==2 then 
		bg = CreateObjByFlag( 104575,780770,3,1)
		SetModeEx( bg , EM_SetModeType_Mark, true)
		SetModeEx( bg , EM_SetModeType_Searchenemy, false)
		SetModeEx( bg , EM_SetModeType_HideName, false)
		SetModeEx( bg , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( bg , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( bg , EM_SetModeType_Strikback, false) ---����
		SetModeEx( bg , EM_SetModeType_Move, false) ---����	
		SetModeEx( bg , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( bg , EM_SetModeType_Show, true)
		AddToPartition(bg , RoomID )
	elseif x==3 then 
		bg = CreateObjByFlag( 104576,780770,3,1)
		SetModeEx( bg , EM_SetModeType_Mark, true)
		SetModeEx( bg , EM_SetModeType_Searchenemy, false)
		SetModeEx( bg , EM_SetModeType_HideName, false)
		SetModeEx( bg , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( bg , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( bg , EM_SetModeType_Strikback, false) ---����
		SetModeEx( bg , EM_SetModeType_Move, false) ---����	
		SetModeEx( bg , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( bg , EM_SetModeType_Show, true)
		AddToPartition(bg , RoomID )
	elseif x==4 then 
		bg = CreateObjByFlag( 104577,780770,3,1)
		SetModeEx( bg , EM_SetModeType_Mark, true)
		SetModeEx( bg , EM_SetModeType_Searchenemy, false)
		SetModeEx( bg , EM_SetModeType_HideName, false)
		SetModeEx( bg , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( bg , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( bg , EM_SetModeType_Strikback, false) ---����
		SetModeEx( bg , EM_SetModeType_Move, false) ---����	
		SetModeEx( bg , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( bg , EM_SetModeType_Show, true)
		AddToPartition(bg , RoomID )
	elseif x==5 then
		bg = CreateObjByFlag( 104578,780770,3,1)
		SetModeEx( bg , EM_SetModeType_Mark, true)
		SetModeEx( bg , EM_SetModeType_Searchenemy, false)
		SetModeEx( bg , EM_SetModeType_HideName, false)
		SetModeEx( bg , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( bg , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( bg , EM_SetModeType_Strikback, false) ---����
		SetModeEx( bg , EM_SetModeType_Move, false) ---����	
		SetModeEx( bg , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( bg , EM_SetModeType_Show, true)
		AddToPartition(bg , RoomID )	
	elseif x==6 then
		bg = CreateObjByFlag( 104743,780770,3,1)
		SetModeEx( bg , EM_SetModeType_Mark, false)
		SetModeEx( bg , EM_SetModeType_Searchenemy, false)
		SetModeEx( bg , EM_SetModeType_HideName, false)
		SetModeEx( bg , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( bg , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( bg , EM_SetModeType_Strikback, false) ---����
		SetModeEx( bg , EM_SetModeType_Move, false) ---����	
		SetModeEx( bg , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( bg , EM_SetModeType_Show, false)
		AddToPartition(bg , RoomID )	
		KillID(kill,bg)
	end	
end
function bk_130_he_103948()----�Q�����F���_�c
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )   -------------Ū�X�{�b��room 
	local Count = SetSearchAllNPC(RoomID)
	local kill=TargetID()
	local x=0
	local bg=0
	for i=1 , Count do
		NpcGID = GetSearchResult()
		if ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 116466				-----������ת�����
			and ReadRoleValue( NpcGID , EM_RoleValue_IsDead ) == 0 then 
			x= ReadRoleValue( NpcGID,EM_RoleValue_Register1)
		end
	end 
	if x==1 then 
		bg = CreateObjByFlag( 104672,780770,4,1)
		SetModeEx( bg , EM_SetModeType_Mark, true)
		SetModeEx( bg , EM_SetModeType_Searchenemy, false)
		SetModeEx( bg , EM_SetModeType_HideName, false)
		SetModeEx( bg , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( bg , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( bg , EM_SetModeType_Strikback, false) ---����
		SetModeEx( bg , EM_SetModeType_Move, false) ---����	
		SetModeEx( bg , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( bg , EM_SetModeType_Show, true)
		AddToPartition(bg , RoomID )
	elseif x==2 then 
		bg = CreateObjByFlag( 104676,780770,4,1)
		SetModeEx( bg , EM_SetModeType_Mark, true)
		SetModeEx( bg , EM_SetModeType_Searchenemy, false)
		SetModeEx( bg , EM_SetModeType_HideName, false)
		SetModeEx( bg , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( bg , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( bg , EM_SetModeType_Strikback, false) ---����
		SetModeEx( bg , EM_SetModeType_Move, false) ---����	
		SetModeEx( bg , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( bg , EM_SetModeType_Show, true)
		AddToPartition(bg , RoomID )
	elseif x==3 then 
		bg = CreateObjByFlag( 104680,780770,4,1)
		SetModeEx( bg , EM_SetModeType_Mark, true)
		SetModeEx( bg , EM_SetModeType_Searchenemy, false)
		SetModeEx( bg , EM_SetModeType_HideName, false)
		SetModeEx( bg , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( bg , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( bg , EM_SetModeType_Strikback, false) ---����
		SetModeEx( bg , EM_SetModeType_Move, false) ---����	
		SetModeEx( bg , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( bg , EM_SetModeType_Show, true)
		AddToPartition(bg , RoomID )
	elseif x==4 then 
		bg = CreateObjByFlag( 104684,780770,4,1)
		SetModeEx( bg , EM_SetModeType_Mark, true)
		SetModeEx( bg , EM_SetModeType_Searchenemy, false)
		SetModeEx( bg , EM_SetModeType_HideName, false)
		SetModeEx( bg , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( bg , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( bg , EM_SetModeType_Strikback, false) ---����
		SetModeEx( bg , EM_SetModeType_Move, false) ---����	
		SetModeEx( bg , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( bg , EM_SetModeType_Show, true)
		AddToPartition(bg , RoomID )
	elseif x==5 then
		bg = CreateObjByFlag( 104688,780770,4,1)
		SetModeEx( bg , EM_SetModeType_Mark, true)
		SetModeEx( bg , EM_SetModeType_Searchenemy, false)
		SetModeEx( bg , EM_SetModeType_HideName, false)
		SetModeEx( bg , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( bg , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( bg , EM_SetModeType_Strikback, false) ---����
		SetModeEx( bg , EM_SetModeType_Move, false) ---����	
		SetModeEx( bg , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( bg , EM_SetModeType_Show, true)
		AddToPartition(bg , RoomID )	
	elseif x==6 then
		bg = CreateObjByFlag( 104744,780770,4,1)
		SetModeEx( bg , EM_SetModeType_Mark, false)
		SetModeEx( bg , EM_SetModeType_Searchenemy, false)
		SetModeEx( bg , EM_SetModeType_HideName, false)
		SetModeEx( bg , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( bg , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( bg , EM_SetModeType_Strikback, false) ---����
		SetModeEx( bg , EM_SetModeType_Move, false) ---����	
		SetModeEx( bg , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( bg , EM_SetModeType_Show, false)
		AddToPartition(bg , RoomID )	
		KillID(kill,bg)
	end	
end
function bk_130_he_103949()----�غk���_�c
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )   -------------Ū�X�{�b��room 
	local Count = SetSearchAllNPC(RoomID)
	local kill=TargetID()
	local x=0
	local bg=0
	for i=1 , Count do
		NpcGID = GetSearchResult()
		if ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 116466				-----������ת�����
			and ReadRoleValue( NpcGID , EM_RoleValue_IsDead ) == 0 then 
			x= ReadRoleValue( NpcGID,EM_RoleValue_Register1)
		end
	end 
	if x==1 then 
		bg = CreateObjByFlag( 104673,780770,5,1)
		SetModeEx( bg , EM_SetModeType_Mark, true)
		SetModeEx( bg , EM_SetModeType_Searchenemy, false)
		SetModeEx( bg , EM_SetModeType_HideName, false)
		SetModeEx( bg , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( bg , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( bg , EM_SetModeType_Strikback, false) ---����
		SetModeEx( bg , EM_SetModeType_Move, false) ---����	
		SetModeEx( bg , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( bg , EM_SetModeType_Show, true)
		AddToPartition(bg , RoomID )
	elseif x==2 then 
		bg = CreateObjByFlag( 104677,780770,5,1)
		SetModeEx( bg , EM_SetModeType_Mark, true)
		SetModeEx( bg , EM_SetModeType_Searchenemy, false)
		SetModeEx( bg , EM_SetModeType_HideName, false)
		SetModeEx( bg , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( bg , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( bg , EM_SetModeType_Strikback, false) ---����
		SetModeEx( bg , EM_SetModeType_Move, false) ---����	
		SetModeEx( bg , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( bg , EM_SetModeType_Show, true)
		AddToPartition(bg , RoomID )
	elseif x==3 then 
		bg = CreateObjByFlag( 104681,780770,5,1)
		SetModeEx( bg , EM_SetModeType_Mark, true)
		SetModeEx( bg , EM_SetModeType_Searchenemy, false)
		SetModeEx( bg , EM_SetModeType_HideName, false)
		SetModeEx( bg , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( bg , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( bg , EM_SetModeType_Strikback, false) ---����
		SetModeEx( bg , EM_SetModeType_Move, false) ---����	
		SetModeEx( bg , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( bg , EM_SetModeType_Show, true)
		AddToPartition(bg , RoomID )
	elseif x==4 then 
		bg = CreateObjByFlag( 104685,780770,5,1)
		SetModeEx( bg , EM_SetModeType_Mark, true)
		SetModeEx( bg , EM_SetModeType_Searchenemy, false)
		SetModeEx( bg , EM_SetModeType_HideName, false)
		SetModeEx( bg , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( bg , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( bg , EM_SetModeType_Strikback, false) ---����
		SetModeEx( bg , EM_SetModeType_Move, false) ---����	
		SetModeEx( bg , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( bg , EM_SetModeType_Show, true)
		AddToPartition(bg , RoomID )
	elseif x==5 then
		bg = CreateObjByFlag( 104689,780770,5,1)
		SetModeEx( bg , EM_SetModeType_Mark, true)
		SetModeEx( bg , EM_SetModeType_Searchenemy, false)
		SetModeEx( bg , EM_SetModeType_HideName, false)
		SetModeEx( bg , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( bg , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( bg , EM_SetModeType_Strikback, false) ---����
		SetModeEx( bg , EM_SetModeType_Move, false) ---����	
		SetModeEx( bg , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( bg , EM_SetModeType_Show, true)
		AddToPartition(bg , RoomID )	
	elseif x==6 then
		bg = CreateObjByFlag( 104745,780770,5,1)
		SetModeEx( bg , EM_SetModeType_Mark, false)
		SetModeEx( bg , EM_SetModeType_Searchenemy, false)
		SetModeEx( bg , EM_SetModeType_HideName, false)
		SetModeEx( bg , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( bg , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( bg , EM_SetModeType_Strikback, false) ---����
		SetModeEx( bg , EM_SetModeType_Move, false) ---����	
		SetModeEx( bg , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( bg , EM_SetModeType_Show, false)
		AddToPartition(bg , RoomID )	
		KillID(kill,bg)
	end	
end
function bk_130_he_104465()----�`���F�����_�c
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )   -------------Ū�X�{�b��room 
	local Count = SetSearchAllNPC(RoomID)
	local kill=TargetID()
	local x=0
	local bg=0
	for i=1 , Count do
		NpcGID = GetSearchResult()
		if ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 116466				-----������ת�����
			and ReadRoleValue( NpcGID , EM_RoleValue_IsDead ) == 0 then 
			x= ReadRoleValue( NpcGID,EM_RoleValue_Register1)
		end
	end 
	if x==1 then 
		bg = CreateObjByFlag( 104674,780770,6,1)
		SetModeEx( bg , EM_SetModeType_Mark, true)
		SetModeEx( bg , EM_SetModeType_Searchenemy, false)
		SetModeEx( bg , EM_SetModeType_HideName, false)
		SetModeEx( bg , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( bg , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( bg , EM_SetModeType_Strikback, false) ---����
		SetModeEx( bg , EM_SetModeType_Move, false) ---����	
		SetModeEx( bg , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( bg , EM_SetModeType_Show, true)
		AddToPartition(bg , RoomID )
	elseif x==2 then 
		bg = CreateObjByFlag( 104678,780770,6,1)
		SetModeEx( bg , EM_SetModeType_Mark, true)
		SetModeEx( bg , EM_SetModeType_Searchenemy, false)
		SetModeEx( bg , EM_SetModeType_HideName, false)
		SetModeEx( bg , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( bg , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( bg , EM_SetModeType_Strikback, false) ---����
		SetModeEx( bg , EM_SetModeType_Move, false) ---����	
		SetModeEx( bg , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( bg , EM_SetModeType_Show, true)
		AddToPartition(bg , RoomID )
	elseif x==3 then 
		bg = CreateObjByFlag( 104682,780770,6,1)
		SetModeEx( bg , EM_SetModeType_Mark, true)
		SetModeEx( bg , EM_SetModeType_Searchenemy, false)
		SetModeEx( bg , EM_SetModeType_HideName, false)
		SetModeEx( bg , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( bg , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( bg , EM_SetModeType_Strikback, false) ---����
		SetModeEx( bg , EM_SetModeType_Move, false) ---����	
		SetModeEx( bg , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( bg , EM_SetModeType_Show, true)
		AddToPartition(bg , RoomID )
	elseif x==4 then 
		bg = CreateObjByFlag( 104686,780770,6,1)
		SetModeEx( bg , EM_SetModeType_Mark, true)
		SetModeEx( bg , EM_SetModeType_Searchenemy, false)
		SetModeEx( bg , EM_SetModeType_HideName, false)
		SetModeEx( bg , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( bg , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( bg , EM_SetModeType_Strikback, false) ---����
		SetModeEx( bg , EM_SetModeType_Move, false) ---����	
		SetModeEx( bg , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( bg , EM_SetModeType_Show, true)
		AddToPartition(bg , RoomID )
	elseif x==5 then
		bg = CreateObjByFlag( 104690,780770,6,1)
		SetModeEx( bg , EM_SetModeType_Mark, true)
		SetModeEx( bg , EM_SetModeType_Searchenemy, false)
		SetModeEx( bg , EM_SetModeType_HideName, false)
		SetModeEx( bg , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( bg , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( bg , EM_SetModeType_Strikback, false) ---����
		SetModeEx( bg , EM_SetModeType_Move, false) ---����	
		SetModeEx( bg , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( bg , EM_SetModeType_Show, true)
		AddToPartition(bg , RoomID )	
	elseif x==6 then
		bg = CreateObjByFlag( 104746,780770,6,1)
		SetModeEx( bg , EM_SetModeType_Mark, false)
		SetModeEx( bg , EM_SetModeType_Searchenemy, false)
		SetModeEx( bg , EM_SetModeType_HideName, false)
		SetModeEx( bg , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( bg , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( bg , EM_SetModeType_Strikback, false) ---����
		SetModeEx( bg , EM_SetModeType_Move, false) ---����	
		SetModeEx( bg , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( bg , EM_SetModeType_Show, false)
		AddToPartition(bg , RoomID )	
		KillID(kill,bg)
	end	
end
function bk_130_he_fi()----���w���_�c
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )   -------------Ū�X�{�b��room 
	local Count = SetSearchAllNPC(RoomID)
	local kill=TargetID()
	local x=0
	local bg=0
	for i=1 , Count do
		NpcGID = GetSearchResult()
		if ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 116466				-----������ת�����
			and ReadRoleValue( NpcGID , EM_RoleValue_IsDead ) == 0 then 
			x= ReadRoleValue( NpcGID,EM_RoleValue_Register1)
		end
	end 
	if x==1 then 
		local PPL = SetSearchAllPlayer(RoomID) ---��ж����H
		for i = 1 , PPL , 1 do  
			local ID = GetSearchResult()
			if ReadRoleValue( ID, EM_RoleValue_VOC) ~= 0 and ReadRoleValue( ID , EM_RoleValue_RoomID  ) == RoomID then
				GiveBodyItem( ID, 530644, 1 )
			end	
		end
		bg = CreateObjByFlag( 104675,780770,7,1)
		SetModeEx( bg , EM_SetModeType_Mark, true)
		SetModeEx( bg , EM_SetModeType_Searchenemy, false)
		SetModeEx( bg , EM_SetModeType_HideName, false)
		SetModeEx( bg , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( bg , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( bg , EM_SetModeType_Strikback, false) ---����
		SetModeEx( bg , EM_SetModeType_Move, false) ---����	
		SetModeEx( bg , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( bg , EM_SetModeType_Show, true)
		AddToPartition(bg , RoomID )
	elseif x==2 then 
		local PPL = SetSearchAllPlayer(RoomID) ---��ж����H
		for i = 1 , PPL , 1 do  
			local ID = GetSearchResult()
			if ReadRoleValue( ID, EM_RoleValue_VOC) ~= 0 and ReadRoleValue( ID , EM_RoleValue_RoomID  ) == RoomID then
				GiveBodyItem( ID, 530645, 1 )
			end	
		end
		bg = CreateObjByFlag( 104679,780770,7,1)
		SetModeEx( bg , EM_SetModeType_Mark, true)
		SetModeEx( bg , EM_SetModeType_Searchenemy, false)
		SetModeEx( bg , EM_SetModeType_HideName, false)
		SetModeEx( bg , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( bg , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( bg , EM_SetModeType_Strikback, false) ---����
		SetModeEx( bg , EM_SetModeType_Move, false) ---����	
		SetModeEx( bg , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( bg , EM_SetModeType_Show, true)
		AddToPartition(bg , RoomID )
	elseif x==3 then 
		local PPL = SetSearchAllPlayer(RoomID) ---��ж����H
		for i = 1 , PPL , 1 do  
			local ID = GetSearchResult()
			if ReadRoleValue( ID, EM_RoleValue_VOC) ~= 0 and ReadRoleValue( ID , EM_RoleValue_RoomID  ) == RoomID then
				GiveBodyItem( ID, 530646, 1 )
			end	
		end
		bg = CreateObjByFlag( 104683,780770,7,1)
		SetModeEx( bg , EM_SetModeType_Mark, true)
		SetModeEx( bg , EM_SetModeType_Searchenemy, false)
		SetModeEx( bg , EM_SetModeType_HideName, false)
		SetModeEx( bg , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( bg , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( bg , EM_SetModeType_Strikback, false) ---����
		SetModeEx( bg , EM_SetModeType_Move, false) ---����	
		SetModeEx( bg , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( bg , EM_SetModeType_Show, true)
		AddToPartition(bg , RoomID )
	elseif x==4 then 
		local PPL = SetSearchAllPlayer(RoomID) ---��ж����H
		for i = 1 , PPL , 1 do  
			local ID = GetSearchResult()
			if ReadRoleValue( ID, EM_RoleValue_VOC) ~= 0 and ReadRoleValue( ID , EM_RoleValue_RoomID  ) == RoomID then
				GiveBodyItem( ID, 530647, 1 )
			end	
		end
		bg = CreateObjByFlag( 104687,780770,7,1)
		SetModeEx( bg , EM_SetModeType_Mark, true)
		SetModeEx( bg , EM_SetModeType_Searchenemy, false)
		SetModeEx( bg , EM_SetModeType_HideName, false)
		SetModeEx( bg , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( bg , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( bg , EM_SetModeType_Strikback, false) ---����
		SetModeEx( bg , EM_SetModeType_Move, false) ---����	
		SetModeEx( bg , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( bg , EM_SetModeType_Show, true)
		AddToPartition(bg , RoomID )
	elseif x==5 then
		local PPL = SetSearchAllPlayer(RoomID) ---��ж����H
		for i = 1 , PPL , 1 do  
			local ID = GetSearchResult()
			if ReadRoleValue( ID, EM_RoleValue_VOC) ~= 0 and ReadRoleValue( ID , EM_RoleValue_RoomID  ) == RoomID then
				GiveBodyItem( ID, 530648, 1 )
			end	
		end
		bg = CreateObjByFlag( 104691,780770,7,1)
		SetModeEx( bg , EM_SetModeType_Mark, true)
		SetModeEx( bg , EM_SetModeType_Searchenemy, false)
		SetModeEx( bg , EM_SetModeType_HideName, false)
		SetModeEx( bg , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( bg , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( bg , EM_SetModeType_Strikback, false) ---����
		SetModeEx( bg , EM_SetModeType_Move, false) ---����	
		SetModeEx( bg , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( bg , EM_SetModeType_Show, true)
		AddToPartition(bg , RoomID )
	elseif x==6 then
		bg = CreateObjByFlag( 104747,780770,7,1)
		SetModeEx( bg , EM_SetModeType_Mark, false)
		SetModeEx( bg , EM_SetModeType_Searchenemy, false)
		SetModeEx( bg , EM_SetModeType_HideName, false)
		SetModeEx( bg , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( bg , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( bg , EM_SetModeType_Strikback, false) ---����
		SetModeEx( bg , EM_SetModeType_Move, false) ---����	
		SetModeEx( bg , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( bg , EM_SetModeType_Show, false)
		AddToPartition(bg , RoomID )
		KillID(kill,bg)		
	end	
end