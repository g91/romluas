function Lua_na_jackbox_use()  --�ϥΪ��~�A����@��
	BeginPlot( OwnerID(), "Lua_na_jackbox_01" , 0 )
end


function Lua_na_jackbox_01() --�쪱�a�y�в��ͪ���
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Obj = Role:new( OwnerID() )  -- ���o���a X.Y.Z.Dir��
	local BaseX = Obj :X()
 	local BaseY = Obj :Y();
 	local BaseZ = Obj :Z();
	local BaseDir = Obj:Dir();
	local NPC = CreateObj(  114966  , BaseX, BaseY, BaseZ, BaseDir, 1 ) --�b���a�y�� X.Y.Z.Dir ���W�ǳƳХߪ���  �~�H�ǧJ�c
	SetModeEx( NPC, EM_SetModeType_Strikback, false )--����
	SetModeEx( NPC, EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( NPC, EM_SetModeType_Obstruct, false )--����
	SetModeEx( NPC, EM_SetModeType_Mark, true )--�аO
	SetModeEx( NPC, EM_SetModeType_Move, false )--����
	SetModeEx( NPC, EM_SetModeType_Searchenemy, false )--����
	SetModeEx( NPC, EM_SetModeType_HideName, false )--�W��
	SetModeEx( NPC, EM_SetModeType_ShowRoleHead, true )--�Y����
	SetModeEx( NPC, EM_SetModeType_Fight , false )--�i�������
	SetModeEx( NPC, EM_SetModeType_Drag , false )--���O
	SetModeEx( NPC, EM_SetModeType_Show, true )--���
	AddToPartition( NPC , RoomID) -- �إߪ���

end
	 

--�~�H�ǧJ�c��l�@��
function Lua_na_jackbox()
	PlayMotion( OwnerID() , 148 )
	sleep(50)  --���d5����
	PlayMotion( OwnerID(),  15 )  --����ʧ@   
	CastSpell( OwnerID(), TargetID(), 497644 )  --�I��5��d���ߪk�N 150��50�W���a
	Npcsay( TargetID(), "[SC_240192_02]" )
	sleep(30)
	DelObj( OwnerID()) --�R��
end 



function Lua_na_jackbox_message()
	ScriptMessage( TargetID() , TargetID() , 0 , "[SC_240192_01]" ,0 )
	ScriptMessage( TargetID() , TargetID() , 1 , "[SC_240192_01]" ,0)	
end