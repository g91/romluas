function Na_Test_Motion_169()
	local Owner = OwnerID()
	AddBuff( Owner , 625345,0,-1)
end

function Na_Test_Motion_1()
	local Owner = OwnerID()
	CancelBuff_NoEvent( Owner , 625345)
--	SetDefIdleMotion( Owner , 0)
--	WriteRoleValue( Owner , EM_RoleValue_IsWalk , 1 )
end



--招喚巫木
function Lua_na_169_108614()
	local Owner = OwnerID()
	local RoomID = ReadRoleValue( Owner , EM_RoleValue_RoomID)
	local x,y,z,dir=DW_Location(Owner)
	local Wood
	Wood = CreateObj( 108658 , x , y , z+10 , dir, 1 )
	SetModeEx( Wood, EM_SetModeType_Strikback , false )--反擊
	SetModeEx( Wood, EM_SetModeType_SearchenemyIgnore , false )--被搜尋
	SetModeEx( Wood, EM_SetModeType_Obstruct , false )--阻擋
	SetModeEx( Wood, EM_SetModeType_Mark , false )--標記
	SetModeEx( Wood, EM_SetModeType_Move , true )--移動
	SetModeEx( Wood, EM_SetModeType_Gravity, true )--重力
	SetModeEx( Wood, EM_SetModeType_Searchenemy , false )--索敵
	SetModeEx( Wood, EM_SetModeType_HideName , true )--名稱
	SetModeEx( Wood, EM_SetModeType_ShowRoleHead , false )--頭像框
	SetModeEx( Wood, EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( Wood, EM_SetModeType_Drag , false )--阻力
	SetModeEx( Wood, EM_SetModeType_Show , true )--顯示
	Sleep(2)
	AdjustFaceDir( Wood , Owner , 0 ) 
	AddToPartition( Wood , RoomID )
end

function Lua_na_169_wood()
	local Owner = OwnerID()
	for i = 1 , 5 do
		SysCastSpellLv( Owner , Owner, 851553,0 )
		Sleep(10)
	end
	DelObj( Owner)
end
