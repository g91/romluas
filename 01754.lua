function Cang_Z15_callhelp()

	sleep(30)
	local NPC = SearchRangeNPC ( OwnerID() , 100 )
	local Player = SearchRangePlayer ( OwnerID() , 100 )
	for i=0,table.getn(NPC)-1 do
		if CheckID( Player[0] ) == true and ReadRoleValue( Player[0] , EM_RoleValue_IsDead ) == 0 and ReadRoleValue( Player[0] , EM_RoleValue_IsPlayer ) == 1 then	--檢查玩家是不是還在；檢查是否死亡；檢查是不是玩家
			SetAttack( NPC[i] , Player[0] ) --要求怪物攻擊玩家
		end	
	end	
end


function Cang_Z15_bomb()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local bomb = LuaFunc_CreateObjByObj ( 103560, TargetID() )
	SetModeEX( bomb  , EM_SetModeType_Gravity , false )--重力
	SetModeEx( bomb  , EM_SetModeType_ShowRoleHead, false )--不秀頭像框
	SetModeEx( bomb  , EM_SetModeType_Mark, false )--標記
	SetModeEx( bomb  , EM_SetModeType_Move, false )--移動
	SetModeEx( bomb  , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( bomb  , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( bomb  , EM_SetModeType_Strikback, false )--反擊				
	AddToPartition( bomb , RoomID )	
	Sleep(30)
	CastSpellLV(bomb, bomb, 495277 , 1 )
	sleep(50)
	DelObj(bomb)
end	