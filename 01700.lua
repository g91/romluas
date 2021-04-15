function LuaI_MonsterOfYear01( Option,MOYID)
	if ( Option == "CHECK" ) then
		local MonsterOfYearItem = true
		if CountBodyItem( OwnerID(), 206642 ) <= 0 then
			MonsterOfYearItem = false
		elseif CountBodyItem( OwnerID(), 206643 ) <= 0 then
			MonsterOfYearItem = false
		elseif CountBodyItem( OwnerID(), 206644 ) <= 0 then
			MonsterOfYearItem = false
		elseif CountBodyItem( OwnerID(), 206645 ) <= 0 then
			MonsterOfYearItem = false
		end
		if MonsterOfYearItem == false then
			return false
		else
			return true
		end

	elseif ( Option == "USE" ) then
		if MOYID ~= 206642 then
			DelBodyItem( OwnerID(), 206642, 1 )
		end
		if MOYID ~= 206643 then
			DelBodyItem( OwnerID(), 206643, 1 )
		end
		if MOYID ~= 206644 then
			DelBodyItem( OwnerID(), 206644, 1 )
		end
		if MOYID ~= 206645 then
			DelBodyItem( OwnerID(), 206645, 1 )
		end
		GiveBodyItem( OwnerID(), 725074, 1 )
	end
end

function LuaI_MonsterOfYear02()
	local TargetPlayer = Lua_RandomPlayerFromHateList(-1) --取得仇恨列表所有玩家
	for i= 1 ,table.getn(TargetPlayer) do
		GiveBodyItem(TargetPlayer[i], 206159, 1 ) --給予掉寶
	end
	return true
end

function LuaI_MonsterOfYear03(Option)
	local PlayerID = OwnerID()
	local PackageID = 206159
	local NeedSpace = 2
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem(PlayerID, 725071, 1 ) --給予掉寶
		GiveBodyItem(PlayerID, 725073, 1 ) --給予掉寶
	end
end

function LuaI_MonsterOfYear04()
		local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 

		local OwnerX = ReadRoleValue( OwnerID() , EM_RoleValue_X ) 
		local OwnerY = ReadRoleValue( OwnerID() , EM_RoleValue_Y ) 
		local OwnerZ = ReadRoleValue( OwnerID() , EM_RoleValue_Z ) 
		local OwnerDIR = ReadRoleValue( OwnerID() , EM_RoleValue_Dir ) 
		local PlayerGuildID = GetRoleCampID( OwnerID() )--玩家的陣營

		local Control = CreateObj( 113105 , OwnerX , OwnerY , OwnerZ , OwnerDIR , 1)--隱藏物件

		SetModeEx( Control  , EM_SetModeType_Strikback, false )--反擊
		SetModeEx( Control  , EM_SetModeType_Searchenemy, false )--索敵
		SetModeEx( Control , EM_SetModeType_Fight , false )--可砍殺攻擊
		SetModeEx( Control  , EM_SetModeType_Mark, false )--標記
		SetModeEx( Control   , EM_SetModeType_HideName, true )--名稱
		SetModeEx( Control , EM_SetModeType_ShowRoleHead, false )--頭像框
		SetModeEx( Control  , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
		SetModeEx( Control   , EM_SetModeType_Move, false )--移動
		SetModeEx( Control  , EM_SetModeType_Show , false ) --不顯示

		AddToPartition( Control, RoomID) 

		SetPlot( Control ,"range","Yu_noPK_Safe_01",300 )   

		local RebornStone = CreateObj( 110425 , OwnerX , OwnerY , OwnerZ , OwnerDIR , 1)--重生石
		SetModeEx( RebornStone  , EM_SetModeType_Strikback, false )--反擊
		SetModeEx( RebornStone  , EM_SetModeType_Searchenemy, false )--索敵
		SetModeEx( RebornStone , EM_SetModeType_Fight , false )--可砍殺攻擊
		SetModeEx( RebornStone  , EM_SetModeType_Mark, false )--標記
		SetModeEx( RebornStone   , EM_SetModeType_HideName, true )--名稱
		SetModeEx( RebornStone , EM_SetModeType_ShowRoleHead, false )--頭像框
		SetModeEx( RebornStone  , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
		SetModeEx( RebornStone   , EM_SetModeType_Move, false )--移動
		SetModeEx( RebornStone  , EM_SetModeType_Show , false ) --不顯示

		AddToPartition( RebornStone, RoomID) 

end