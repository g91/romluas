function sasa_16PE_trap()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)	--宣告地圖
	local trap							--宣告								
	
	trap = LuaFunc_CreateObjByObj ( 104037, TargetID() )	--產生物件(標號, 目標)
	SetModeEx( trap , EM_SetModeType_Strikback, false)		--反擊
	SetModeEx( trap , EM_SetModeType_Move, false) 		--移動	
	SetModeEx( trap , EM_SetModeType_Fight, false) 		--可砍殺
	SetModeEx( trap , EM_SetModeType_Searchenemy, false )	--索敵
	SetModeEx( trap  , EM_SetModeType_NotShowHPMP, true )
	AddToPartition( trap , RoomID )				--生到地圖上
	WriteRoleValue( trap , EM_RoleValue_Livetime, 10 )		--寫入物件存在時間
	
	Addbuff( trap, 506650, 0,5)					--上一個buff( 對象, buff編號, 等級, 時間 )
	--填連續產生的buff
	sleep(50)
	Addbuff( trap, 506848, 0,-1)		-----變身印引行
end