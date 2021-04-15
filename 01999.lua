function Cang_t()
	local RoomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID)
	local SpellCaster = star_CreateObj( OwnerID() , 104194 , 0 , 0 , 0 , RoomID , 90)
	SetModeEx( SpellCaster  , EM_SetModeType_HideName, false )--名稱
	SetModeEX( SpellCaster  , EM_SetModeType_Gravity , false )--重力
	SetModeEx( SpellCaster  , EM_SetModeType_NotShowHPMP, true )--血條
	SetModeEx( SpellCaster  , EM_SetModeType_ShowRoleHead, false )--不秀頭像框
	SetModeEx( SpellCaster  , EM_SetModeType_Mark, false )--標記
	SetModeEx( SpellCaster  , EM_SetModeType_Move, false )--移動
	SetModeEx( SpellCaster  , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( SpellCaster  , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( SpellCaster  , EM_SetModeType_Strikback, false )--反擊		
	AddToPartition( SpellCaster , RoomID )	--加進舞台	
	CastSpellLV( SpellCaster , SpellCaster , 496002 , 10 )
	--DelObj(SpellCaster)
end

function Cang_t1()

	SetPlot( OwnerID(),"dead", "Cang_t" ,0 )	
	
end