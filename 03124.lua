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



--�۳�Ť�
function Lua_na_169_108614()
	local Owner = OwnerID()
	local RoomID = ReadRoleValue( Owner , EM_RoleValue_RoomID)
	local x,y,z,dir=DW_Location(Owner)
	local Wood
	Wood = CreateObj( 108658 , x , y , z+10 , dir, 1 )
	SetModeEx( Wood, EM_SetModeType_Strikback , false )--����
	SetModeEx( Wood, EM_SetModeType_SearchenemyIgnore , false )--�Q�j�M
	SetModeEx( Wood, EM_SetModeType_Obstruct , false )--����
	SetModeEx( Wood, EM_SetModeType_Mark , false )--�аO
	SetModeEx( Wood, EM_SetModeType_Move , true )--����
	SetModeEx( Wood, EM_SetModeType_Gravity, true )--���O
	SetModeEx( Wood, EM_SetModeType_Searchenemy , false )--����
	SetModeEx( Wood, EM_SetModeType_HideName , true )--�W��
	SetModeEx( Wood, EM_SetModeType_ShowRoleHead , false )--�Y����
	SetModeEx( Wood, EM_SetModeType_Fight , false )--�i�������
	SetModeEx( Wood, EM_SetModeType_Drag , false )--���O
	SetModeEx( Wood, EM_SetModeType_Show , true )--���
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
