function Cang_t()
	local RoomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID)
	local SpellCaster = star_CreateObj( OwnerID() , 104194 , 0 , 0 , 0 , RoomID , 90)
	SetModeEx( SpellCaster  , EM_SetModeType_HideName, false )--�W��
	SetModeEX( SpellCaster  , EM_SetModeType_Gravity , false )--���O
	SetModeEx( SpellCaster  , EM_SetModeType_NotShowHPMP, true )--���
	SetModeEx( SpellCaster  , EM_SetModeType_ShowRoleHead, false )--���q�Y����
	SetModeEx( SpellCaster  , EM_SetModeType_Mark, false )--�аO
	SetModeEx( SpellCaster  , EM_SetModeType_Move, false )--����
	SetModeEx( SpellCaster  , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( SpellCaster  , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( SpellCaster  , EM_SetModeType_Strikback, false )--����		
	AddToPartition( SpellCaster , RoomID )	--�[�i�R�x	
	CastSpellLV( SpellCaster , SpellCaster , 496002 , 10 )
	--DelObj(SpellCaster)
end

function Cang_t1()

	SetPlot( OwnerID(),"dead", "Cang_t" ,0 )	
	
end