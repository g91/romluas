--�b���a�e��C50�Z���إ�1�ӽc�l�@10�ӽc�l�A�b�c�l�W����10�Ӥ��@�˪�npc�A�C������W����npc�H�����t

function Teacat_homework2()
	local Owner = Role:new( OwnerID() )
	local Target=Role:new(TargetID())
	local BaseX = Owner:X()
 	local BaseY = Owner:Y();
 	local BaseZ = Owner:Z();
	local BaseDir =Target:Dir();
--	local RoomID = ReadRoleValue( me ,EM_RoleValue_RoomID)
	local n = 0
	local a = 0 
	local NPC = {114770; --�������U��
		         114383; --�Ӯa�ǰe�v
		         118501; --�ޯ�j�v
		         118502; --�g��j�v
		         118503;--�y�_�j�v
		         118504; --�e���j�v
		         110019; --�ڲ�D�s������
		         110022; --���Z
		         118580; --����ұ��s��
		         110072;}--����
	for C = 1 , 50 do
		local RNumber = DW_Rand(10) 
		local MNumber = table.remove( NpC , RNumber )
		table.insert( Npc, MNumber )
	end

	for i = 0, 9 do----�Х߽c�l
	n=n+50
	local box1 =  CreateObj( 110267 , BaseX+n, BaseY , BaseZ, BaseDir, 1)
	SetModeEx( box1   , EM_SetModeType_Mark, false )--�аO
	SetModeEx( box1  , EM_SetModeType_HideName, false )--�W��
	SetModeEx( box1 , EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( box1 , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( box1  , EM_SetModeType_Move, false)--����
	SetModeEx( box1 , EM_SetModeType_Obstruct, true )--����
	SetModeEx( box1 , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( box1 , EM_SetModeType_NotShowHPMP, true )--����ܦ��
--	WriteRoleValue( box1  , EM_RoleValue_Register , me) 
	AddToPartition( box1 , 0)
	end
	

--	while true do
--	sleep(20)
--	
		for C = 1 , 50 do
			local RNumber = DW_Rand(10) 
			local MNumber = table.remove( NpC , RNumber )
			table.insert( Npc, MNumber )
		end

	 	local R = 0
		for m=0, 9 do
		r=r+1
		a=a+50
		local renpc =  CreateObj( Npc[r] , BaseX+a,  BaseY+30, BaseZ, BaseDir, 1)
		SetModeEx( renpc   , EM_SetModeType_Mark, false )--�аO
		SetModeEx( renpc  , EM_SetModeType_HideName, false )--�W��
		SetModeEx( renpc , EM_SetModeType_ShowRoleHead, false )--�Y����
		SetModeEx( renpc , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( renpc  , EM_SetModeType_Move, false)--����
		SetModeEx( renpc,  EM_SetModeType_Gravity, true)--���O
		SetModeEx( renpc , EM_SetModeType_Obstruct, false )--����
		SetModeEx( renpc , EM_SetModeType_Searchenemy, false )--����
		SetModeEx( renpc , EM_SetModeType_NotShowHPMP, true )--����ܦ��
		AddToPartition( renpc , 0 )
		SetDefIdleMotion ( renpc , ruFUSION_MIME_SIT_CHAIR_LOOP)
		end
--	sleep(100)
--	DelObj(renpc)
--	end

end
