function cl_762_19105AI() -------->�R��ﱱ�  Register1 Register2 Register3 Register4 Register5 780767
    local AI = OwnerID() ------->�R�W����s��AI
    local RoomID = ReadRoleValue( AI , EM_RoleValue_RoomID ) ---�ŧi�o�Ӧa��~�O�ڲ{�bŪ�쪺�a��
	local go = 0   ---��y�����ܼ�
	local open = 0 ---�ͪ����ܼ�
	local door2	---�ŧi�@�ӫe��
	local door3 ---�e�e��
	local b_door
	local b_door2
	local carzy_time = 0
	local bt ---�ŧi��y�����
	local a = 0 --104975�T�{��NPC�O�_�٦s����
	---local lock = 0 ---�ˬdBOSS�O�_�������]�X�h
	local lock2 = {}
	local IDnpc
	local ID
	local ID2
	local ch_door = 0
	local a105114 = 0
	local kide_time = 0
	local ch_door_flag = 0
	local boss = CreateObjByFlag( 104984 , 780816 , 1 , 1 )   -------�α���N���ͦb�o�ӺX�Ъ���m
	SetModeEx( boss , EM_SetModeType_Fight, false) ---�i���
	SetModeEx( boss , EM_SetModeType_Move, false) ---����	(�_)
	AddToPartition ( boss,RoomID )  ---------�⪫��[�J������----�n�b�o�Ӧa�貣�ͤ@�ӷs���F�賣�����n���o�Ӱʧ@��
	WriteRoleValue ( boss , EM_RoleValue_PID, AI )  -----�b����PID���W�g�J�o�ӭ�,�i�D���֬O���
	BeginPlot( boss,"cl_19105boss", 10 ) ---------�����԰�
	WriteRoleValue ( AI , EM_RoleValue_Register1, boss ) ---�ǻ��ȵ��Ҧ��H�i�D�oBOSS�O��~�Τ@�O���b��������Register1���Ҧ�����hŪ��
	local door1 = CreateObjByFlag( 105117 , 780820 , 7 , 1 )  ----���
	SetModeEx ( door1 , EM_SetModeType_Obstruct, true) 		---����(�O)
	SetModeEx( door1 , EM_SetModeType_Strikback, false) ---����(�_)
	SetModeEx( door1 , EM_SetModeType_Move, false) ---����	(�_)
	SetModeEx( door1 , EM_SetModeType_Searchenemy, false)--����(�_)
	SetModeEx( door1 , EM_SetModeType_Mark, false)			---�i�I��(�O)
	SetModeEx( door1 , EM_SetModeType_ShowRoleHead, false) 		---�Y����(�O)
	SetModeEx( door1 , EM_SetModeType_Fight, false) ---�i���(�O)
	SetModeEx( door1 , EM_SetModeType_NotShowHPMP , false) ----����ܼg��
	AddToPartition( door1 , RoomID ) ----�Ϫ���X�{�b�����W
	while 1 do  ----�q�o�̶}�l�]�^��
		sleep ( 10 )
		local p = ReadRoleValue( AI , EM_RoleValue_Register2 ) ---p=����C�@��Ū��Register2������
		if p == 1 then -----���i�J�԰���^��1�o�ӭȨ�
			carzy_time = carzy_time + 1
			if carzy_time >= 480 then
				Addbuff (  boss , 508659 , 0 , -1 )
			end
			if open == 0 then  ---�p�G�i�J�԰���Ū����open����0�N�|���ͫe���N���a���_��
				door2 = CreateObjByFlag( 105117 , 780820 , 6 , 1 )  ----�e��
				SetModeEx ( door2 , EM_SetModeType_Obstruct, true) 		---����(�O)
				SetModeEx( door2 , EM_SetModeType_Strikback, false) ---����(�_)
				SetModeEx( door2 , EM_SetModeType_Move, false) ---����	(�_)
				SetModeEx( door2 , EM_SetModeType_Searchenemy, false)--����(�_)
				SetModeEx( door2 , EM_SetModeType_Mark, false)			---�i�I��(�O)
				SetModeEx( door2 , EM_SetModeType_ShowRoleHead, false) 		---�Y����(�O)
				SetModeEx( door2 , EM_SetModeType_Fight, false) ---�i���(�O)
				SetModeEx( door2 , EM_SetModeType_NotShowHPMP , false) ----����ܼg��
				AddToPartition( door2 , RoomID ) ----�Ϫ���X�{�b�����W
				door3 = CreateObjByFlag( 105117 , 780820 , 8 , 1 )  ----�j�e��
				SetModeEx ( door3 , EM_SetModeType_Obstruct, true) 		---����(�O)
				SetModeEx( door3 , EM_SetModeType_Strikback, false) ---����(�_)
				SetModeEx( door3 , EM_SetModeType_Move, false) ---����	(�_)
				SetModeEx( door3 , EM_SetModeType_Searchenemy, false)--����(�_)
				SetModeEx( door3 , EM_SetModeType_Mark, false)			---�i�I��(�O)
				SetModeEx( door3 , EM_SetModeType_ShowRoleHead, false) 		---�Y����(�O)
				SetModeEx( door3 , EM_SetModeType_Fight, false) ---�i���(�O)
				SetModeEx( door3 , EM_SetModeType_NotShowHPMP , false) ----����ܼg��
				AddToPartition( door3 , RoomID ) ----�Ϫ���X�{�b�����W
				for i = 1 , 5 , 1 do ---���X�Ӧh�ּƶq�N���h�֦�
					local lock = CreateObjByFlag( 105219 , 780855 , i , 1 )  ----���
					SetModeEx( lock , EM_SetModeType_Show, false) ----�q�X
					SetModeEx ( lock , EM_SetModeType_Obstruct, false) 		---����(�O)
					SetModeEx( lock , EM_SetModeType_Strikback, false) ---����(�_)
					SetModeEx( lock , EM_SetModeType_Move, false) ---����	(�_)
					SetModeEx( lock , EM_SetModeType_Searchenemy, false)--����(�_)
					SetModeEx( lock , EM_SetModeType_Mark, false)			---�i�I��(�O)
					SetModeEx( lock , EM_SetModeType_ShowRoleHead, false) 		---�Y����(�O)
					SetModeEx( lock , EM_SetModeType_Fight, false) ---�i���(�O)
					SetModeEx( lock , EM_SetModeType_NotShowHPMP , false) ----����ܼg��
					AddToPartition( lock , RoomID ) ----�Ϫ���X�{�b�����W
					WriteRoleValue ( lock , EM_RoleValue_Register1, boss )
					BeginPlot( lock,"cl_191_104988", 10 ) ---------�����԰�
					table.insert( lock2 , lock )
					sleep ( 1 )
				end
				open = 1 ---������ͫᥲ���Nopen �g��0�_�h�|���_���ͪ�
			end
			local MaxHP = ReadRoleValue( boss , EM_RoleValue_MaxHP )					--Ū��BOSS�`��q
			local NowHP = ReadRoleValue( boss , EM_RoleValue_HP )						--Ū��BOSS��e��q
			local HPPercent = ( NowHP / MaxHP )*100	
			if HPPercent <= 80 and go == 0 then   -----��HP�C��60%�H��go=0���ɭ�~�n�}�l�ͦ�y������ 
				bt = CreateObjByFlag( 104988 , 780816 , 1 , 1 )  ----�ͦ�y�������Ϊ�
				SetModeEx( bt , EM_SetModeType_Show, false) ----�q�X
				SetModeEx( bt , EM_SetModeType_Mark, false) ----�аO
				SetModeEx( bt , EM_SetModeType_Strikback, false) ---����
				SetModeEx( bt , EM_SetModeType_Move, false) ---����	
				SetModeEx( bt , EM_SetModeType_Fight, false) ---�i���
				SetModeEx( bt , EM_SetModeType_SearchenemyIgnore, false) ---���󤣷|�Q�j�M
				SetModeEx( bt , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
				SetModeEx( bt , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
				SetModeEx( bt , EM_SetModeType_Searchenemy, false)  ---���
				AddToPartition( bt , RoomID ) ----�Ϫ���X�{�b�����W
				WriteRoleValue ( bt , EM_RoleValue_PID, AI )   -----�b��y�Ѥj��PID�g�i������
				WriteRoleValue ( bt , EM_RoleValue_Register1, boss )  ----�b��y�Ѥj��Register1�g�iBOSS
				BeginPlot( bt,"cl_762BT_BALL", 10 )  -----------�N����scpipt��i�h�����W,��������
				local kk = SetSearchAllNPC(RoomID )---���ϰ��NPC
				--ID=GetSearchResult()  ---�N���쪺���󳣦s�J�o�ӭ�
				--local ID2=ReadRoleValue(ID,EM_RoleValue_OrgID) ---�A�hŪ��¾������Ʈw���X
				for i = 0 , kk do ---kk����Ū���쪺�ƶq�N��n���X��
					ID=GetSearchResult() 
					ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
					if ID2 == 104975 then ---�p�GŪ���쪺�ƶq�����o��NPC
						if a105114 == 0 then
							a105114 = 1
						end
					end
				end ---���X�o�Ӱj�驹�U����L�Ʊ�
				if a105114 == 1 then ----��a=1���ɭ�
					b_door = CreateObjByFlag( 105115 , 780820 , 4 , 1 ) --i = �ǰe��
					SetModeEx( b_door , EM_SetModeType_Strikback, false) ---����(�_)
					SetModeEx( b_door , EM_SetModeType_Move, false) ---����	(�_)
					SetModeEx( b_door , EM_SetModeType_Searchenemy, false)--����(�_)
					SetModeEx( b_door , EM_SetModeType_Mark, false)			---�i�I��(�O)
					SetModeEx( b_door , EM_SetModeType_ShowRoleHead, false) 		---�Y����(�O)
					SetModeEx( b_door , EM_SetModeType_Fight, false) ---�i���(�O)
					SetModeEx( b_door , EM_SetModeType_NotShowHPMP , false) ----����ܼg��
					AddToPartition( b_door , RoomID )
					WriteRoleValue ( b_door , EM_RoleValue_PID, AI )
					WriteRoleValue ( b_door , EM_RoleValue_Register1, boss )
					BeginPlot( b_door,"cl_105114", 10 )
					b_door2 = CreateObjByFlag( 105115 , 780820 , 5 , 1 ) --i = �ǰe��
					SetModeEx( b_door2 , EM_SetModeType_Strikback, false) ---����(�_)
					SetModeEx( b_door2 , EM_SetModeType_Move, false) ---����	(�_)
					SetModeEx( b_door2 , EM_SetModeType_Searchenemy, false)--����(�_)
					SetModeEx( b_door2 , EM_SetModeType_Mark, false)			---�i�I��(�O)
					SetModeEx( b_door2 , EM_SetModeType_ShowRoleHead, false) 		---�Y����(�O)
					SetModeEx( b_door2 , EM_SetModeType_Fight, false) ---�i���(�O)
					SetModeEx( b_door2 , EM_SetModeType_NotShowHPMP , false) ----����ܼg��
					AddToPartition( b_door2 , RoomID )
					WriteRoleValue ( b_door , EM_RoleValue_Register2, b_door2 )
				elseif a105114 == 0 then ----�Ya������1����
					b_door = CreateObjByFlag( 105115 , 780820 , 4 , 1 ) --i = �ǰe��
					SetModeEx( b_door , EM_SetModeType_Strikback, false) ---����(�_)
					SetModeEx( b_door , EM_SetModeType_Move, false) ---����	(�_)
					SetModeEx( b_door , EM_SetModeType_Searchenemy, false)--����(�_)
					SetModeEx( b_door , EM_SetModeType_Mark, false)			---�i�I��(�O)
					SetModeEx( b_door , EM_SetModeType_ShowRoleHead, false) 		---�Y����(�O)
					SetModeEx( b_door , EM_SetModeType_Fight, false) ---�i���(�O)
					SetModeEx( b_door , EM_SetModeType_NotShowHPMP , false) ----����ܼg��
					AddToPartition( b_door , RoomID )
					WriteRoleValue ( b_door , EM_RoleValue_PID, AI )
					WriteRoleValue ( b_door , EM_RoleValue_Register1, boss )
					BeginPlot( b_door,"cl_105113", 10 )
					b_door2 = CreateObjByFlag( 105115 , 780820 , 5 , 1 ) --i = �ǰe��
					SetModeEx( b_door2 , EM_SetModeType_Strikback, false) ---����(�_)
					SetModeEx( b_door2 , EM_SetModeType_Move, false) ---����	(�_)
					SetModeEx( b_door2 , EM_SetModeType_Searchenemy, false)--����(�_)
					SetModeEx( b_door2 , EM_SetModeType_Mark, false)			---�i�I��(�O)
					SetModeEx( b_door2 , EM_SetModeType_ShowRoleHead, false) 		---�Y����(�O)
					SetModeEx( b_door2 , EM_SetModeType_Fight, false) ---�i���(�O)
					SetModeEx( b_door2 , EM_SetModeType_NotShowHPMP , false) ----����ܼg��
					AddToPartition( b_door2 , RoomID )
					WriteRoleValue ( b_door , EM_RoleValue_Register2, b_door2 )
				end
				go = 1 ---�Ngo�g��0���M����|�@����
			end
		elseif p == 2 then -----��Ū����P=2���ܴN�OBOSS�w�g���`~�n�N���W���Ҧ����ӥX�{���F�賣�R��
			DelObj(door1) ---�R�����
			DelObj(door2) ---�R���e��
			DelObj( door3 )
			kide_time = kide_time + 1
			go = 0 ---�n�NGO�g�^�h0
			carzy_time = 0
			for i = 0 , table.getn(lock2) , 1 do
				if lock2[i] ~= nil then
					DelObj ( lock2[i] )
				end
			end
			if ch_door_flag == 0 then
				ch_door_flag = 1
			end
			if ch_door_flag == 1 then
				ch_door=CreateObjByFlag(105040,780816,1,1)
				SetModeEx( ch_door , EM_SetModeType_Mark, false)
				SetModeEx( ch_door , EM_SetModeType_ShowRoleHead, false) 	
				SetModeEx( ch_door , EM_SetModeType_Obstruct, true) 
				SetModeEx( ch_door , EM_SetModeType_Strikback, false) ---����
				SetModeEx( ch_door , EM_SetModeType_Move, false) ---����	
				SetModeEx( ch_door , EM_SetModeType_Fight, false) ---�i���
				SetModeEx( ch_door , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( ch_door , EM_SetModeType_Searchenemy, false)
				AddToPartition(ch_door,RoomID)
				SetPlot( ch_door,"collision","cl_780796_playfly_",30 )
				ch_door_flag = 2
			end
			--Lua_Un191_Clocktest_1()       --�����ƻs�K�W  �|��Գ��ɶ��ܦ�5����   ���a���W�������]�|��
			if kide_time >= 240 then
				local playcount = SetSearchAllPlayer(RoomID)
				for i=1 , playcount do
					local NpcGID = GetSearchResult()					
					--Lua_bk_warplayerpoint( NpcGID , 363 )
					addbuff ( NpcGID , 508480 , 0 , -1 )
					if ReadRoleValue( NpcGID , EM_RoleValue_IsDead)==1 then
						Revive( NpcGID, 2 , 2690, 54, -966, 0 )
					else
						ChangeZone( NpcGID , 2 , 0, 2690 , 54 , -966 , 240 )
					end	
				end
				kide_time = 230
			end
			--WriteRoleValue ( AI , EM_RoleValue_Register2 , 0 ) ----Register2�n�g�^�h0���m
		elseif p == 3 then  -----------��Ū����P=3���ܴN�OBOSS�w�g���}�԰��F~�n�N���W���Ҧ����ӥX�{���F�賣�R��
			DelObj( door2 )
			DelObj( door3 )
			DelObj( boss )
			for i = 0 , table.getn(lock2) , 1 do
				if lock2[i] ~= nil then
					DelObj ( lock2[i] )
				end
			end
			WriteRoleValue ( AI , EM_RoleValue_Register2 , 0 )
			go = 0
			open = 0
			a = 0
			a105114 = 0
			carzy_time = 0
			sleep ( 50 )
			boss = CreateObjByFlag( 104984 , 780816 , 1 , 1 )   -------�α���N���ͦb�o�ӺX�Ъ���m
			SetModeEx( boss , EM_SetModeType_Fight, false) ---�i���
			SetModeEx( boss , EM_SetModeType_Move, false) ---����	(�_)
			AddToPartition ( boss,RoomID )  ---------�⪫��[�J������----�n�b�o�Ӧa�貣�ͤ@�ӷs���F�賣�����n���o�Ӱʧ@��
			WriteRoleValue ( boss , EM_RoleValue_PID, AI )  -----�b����PID���W�g�J�o�ӭ�,�i�D���֬O���
			BeginPlot( boss,"cl_19105boss", 10 ) ---------�����԰�
			WriteRoleValue ( AI , EM_RoleValue_Register1, boss ) ---�ǻ��ȵ��Ҧ��H�i�D�oBOSS�O��~�Τ@�O���b��������Register1���Ҧ�����hŪ��
			WriteRoleValue ( AI , EM_RoleValue_Register5, 0 )
		end
	end
end
function cl_762BT_BALL() ---��y����
	local bt = OwnerID()
	local RoomID = ReadRoleValue( bt , EM_RoleValue_RoomID )
	local AI = ReadRoleValue( bt , EM_RoleValue_PID )
	local boss = ReadRoleValue( bt , EM_RoleValue_Register1 )
	local fiag = 0
	local fiag2 = 0
	for i=1 , 5 , 1 do   ---BOSS�i�J�԰���}�l�ͦ�z,�@�@�n��10��
		fiag = DW_Rand(254)
		local ball = CreateObjByFlag( 104985 ,780817 ,148, 1 ) --i = �X�нs��  
		SetModeEx(ball,EM_SetModeType_Mark, false)--�i�аO/�I��(�i�H�����a�I��)
		SetModeEx(ball,EM_SetModeType_HideName, false)--NPC �Ϊ����Y�W���W�٬O�_���
		SetModeEx(ball,EM_SetModeType_NotShowHPMP, false)--����ܦ��
		SetModeEx(ball,EM_SetModeType_Strikback, false)--����
		SetModeEx(ball,EM_SetModeType_Move, true)--����
		SetModeEx(ball,EM_SetModeType_Fight, false)--�i�������
		SetModeEx(ball,EM_SetModeType_Searchenemy, false)--�j�M�ĤH
		SetModeEx(ball,EM_SetModeType_Obstruct, false)--�|����(���ר�L������)
		AddToPartition( ball, RoomID)
		WriteRoleValue ( ball , EM_RoleValue_PID, bt )
		WriteRoleValue ( ball , EM_RoleValue_Register1, boss )
		WriteRoleValue ( ball , EM_RoleValue_Register2, AI )
		--table.insert( ball_table , ball )
		fiag2 = DW_Rand(254)
		local ball2 = CreateObjByFlag( 105123 ,780817 ,163, 1 ) --i = �X�нs��  
		SetModeEx(ball2,EM_SetModeType_Mark, false)--�i�аO/�I��(�i�H�����a�I��)
		SetModeEx(ball2,EM_SetModeType_HideName, false)--NPC �Ϊ����Y�W���W�٬O�_���
		SetModeEx(ball2,EM_SetModeType_NotShowHPMP, false)--����ܦ��
		SetModeEx(ball2,EM_SetModeType_Strikback, false)--����
		SetModeEx(ball2,EM_SetModeType_Move, true)--����
		SetModeEx(ball2,EM_SetModeType_Fight, false)--�i�������
		SetModeEx(ball2,EM_SetModeType_Searchenemy, false)--�j�M�ĤH
		SetModeEx(ball2,EM_SetModeType_Obstruct, false)--�|����(���ר�L������)
		AddToPartition( ball2, RoomID)
		WriteRoleValue (ball2 , EM_RoleValue_PID, bt )
		WriteRoleValue ( ball2 , EM_RoleValue_Register1, boss )
		WriteRoleValue ( ball2 , EM_RoleValue_Register2, AI )
		--table.insert( ball2_table , ball2 )
		BeginPlot(ball2 ,"cl_762_19205ball" , 0) --�����X��+����H���P�_
		sleep ( 2 )
		BeginPlot(ball ,"cl_762_19205ball" , 0) --�����X��+����H���P�_
	end
	while 1 do
		sleep ( 10 )
		local p = ReadRoleValue ( AI , EM_RoleValue_Register2 )
		if p ~= 1 then
			delobj ( bt )
		end
	end
end
function cl_762_104985() -------->��z--��������
	local ball = OwnerID()
	local RoomID = ReadRoleValue( ball , EM_RoleValue_RoomID ) ---�ŧi�o�Ӧa��~�O�ڲ{�bŪ�쪺�a��
	local bt = ReadRoleValue( ball , EM_RoleValue_PID )
	local fiag = 0
	Addbuff (  ball , 508123 , 0 , -1 )
	while 1 do   ------�����԰��j��,�o�̭n�i�D���C�j�h�[�N�ˬd�@��
		sleep ( 5 )
		fiag = DW_Rand(254)
		if fiag ~= ( fiag >= 0 and fiag <= 54) or( fiag >=60 and fiag <= 76 ) or
		   ( fiag >= 91 and fiag <= 92 ) or ( fiag >= 107 and fiag <= 108 ) or
		   ( fiag >= 123 and fiag <= 124 ) or ( fiag >= 139 and fiag <= 140 ) or
		   ( fiag >= 155 and fiag <= 156 ) or ( fiag >= 171 and fiag <= 172 ) or
		   ( fiag >= 187 and fiag <= 188 ) or ( fiag >= 203 and fiag <= 204 ) or
		   ( fiag >= 219 and fiag <= 220 ) or ( fiag >= 236 and fiag <= 254 ) then      ------------>���H���X�Ӫ��ȵ���H�W���üƴN�I��Ĥ@��
			MoveToFlagEnabled(ball, false) ---�t�Τ��ت����|����
			WriteRoleValue(  ball,EM_RoleValue_IsWalk,1)
			Hide(ball)
			Show(ball,RoomID)
			DW_MoveToFlag( ball , 780817 , fiag , 0 ) ----�H��Rand�X�l��
		else
			fiag = DW_Rand(254)
		end
	end
end
function cl_762_105123() -------->��z--��������
	local ball = OwnerID()
	local RoomID = ReadRoleValue( ball , EM_RoleValue_RoomID ) ---�ŧi�o�Ӧa��~�O�ڲ{�bŪ�쪺�a��
	local bt = ReadRoleValue( ball , EM_RoleValue_PID )
	local fiag = 0
	Addbuff (  ball , 508123 , 0 , -1 )
	while 1 do   ------�����԰��j��,�o�̭n�i�D���C�j�h�[�N�ˬd�@��
		sleep ( 5 )
		fiag = DW_Rand(254)
		if fiag == ( fiag >= 0 and fiag <= 54) or( fiag >=60 and fiag <= 76 ) or
		   ( fiag >= 91 and fiag <= 92 ) or ( fiag >= 107 and fiag <= 108 ) or
		   ( fiag >= 123 and fiag <= 124 ) or ( fiag >= 139 and fiag <= 140 ) or
		   ( fiag >= 155 and fiag <= 156 ) or ( fiag >= 171 and fiag <= 172 ) or
		   ( fiag >= 187 and fiag <= 188 ) or ( fiag >= 203 and fiag <= 204 ) or
		   ( fiag >= 219 and fiag <= 220 ) or ( fiag >= 236 and fiag <= 254 ) then
			MoveToFlagEnabled(ball, false) ---�t�Τ��ت����|����
			WriteRoleValue( ball,EM_RoleValue_IsWalk,1)
			Hide(ball)
			Show(ball,RoomID)
			DW_MoveToFlag( ball , 780817 , fiag , 0 ) ----�H��Rand�X�l����
		else
			fiag = DW_Rand(254)
		end
	end
end
function cl_762_19205ball() -------->��z--��������
	local ball = OwnerID()
	local RoomID = ReadRoleValue( ball , EM_RoleValue_RoomID ) ---�ŧi�o�Ӧa��~�O�ڲ{�bŪ�쪺�a��
	local bt = ReadRoleValue( ball , EM_RoleValue_PID )
	local boss = ReadRoleValue( ball , EM_RoleValue_Register1 )
	local AI = ReadRoleValue( ball , EM_RoleValue_Register2 )
	SetPlot( ball, "range","cl_191ball_collision", 30 )
	while 1 do   ------�����԰��j��,�o�̭n�i�D���C�j�h�[�N�ˬd�@��
		sleep ( 5 )
		local p = ReadRoleValue ( AI , EM_RoleValue_Register2 )
		if p == 1 then
			local oo = GetDistance( ball , boss );
			if oo <= 35 then
				StopMove(ball,false)
				SetModeEx(ball,EM_SetModeType_Move, false)--����
				local MaxHP = ReadRoleValue( boss , EM_RoleValue_MaxHP )		--Ū��BOSS�`��q
				local NowHP = ReadRoleValue( boss , EM_RoleValue_HP )	
				local HPPercent = ( NowHP / MaxHP )*100	
				if HPPercent > 99 then
					CastSpelllv ( ball , boss , 496862 , 0 )	
				elseif HPPercent < 99 then
					if CheckBuff( boss , 508339 ) == true then
						local SK = Lua_BuffPosSearch( boss, 508339 )  ---Ū��BOSS�ۤv���W���X�hbuff
						local SKX=0
						sleep(10)
						SK= Lua_BuffPosSearch( boss , 508339 )
						SKX=BuffInfo( boss, SK , EM_BuffInfoType_Power )---Ū���ޯ൥��
						CastSpelllv (ball , boss , 496579 , SKX+1 ) 
					else
						CastSpelllv (ball , boss , 496579 , 0 ) 
					end
				end				
				sleep ( 10 )
				killid ( ball , ball )
				DelObj(ball)
			end
			local most = {}
			local mostbon = {}
			most = SearchRangeNPC ( ball , 30 )
			local mostno = table.getn(most)
			for i=1 , mostno , 1 do
				if ReadRoleValue( most[i] , EM_RoleValue_OrgID ) == 105114 then
					CastSpelllv ( most[i] , most[i], 496772 , 0 )
					CastSpelllv ( ball , ball, 496568 , 0 )
					sleep ( 10 )
					killid ( most[i] , most[i])
					killid ( ball , ball)
					sleep ( 5 )
					delobj ( most[i] )
					DelObj ( ball )
				end
			end
		else
			DelObj ( ball )
		end
	end
end

function cl_762_19205B_dead() ----Boss �������@��-
	local AI = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local RoomID = ReadRoleValue ( OwnerID() , EM_RoleValue_RoomID )
	WriteRoleValue ( AI , EM_RoleValue_Register2 , 2 )
	ScriptMessage( OwnerID() , -1 , 2 ,"[SC_1910505]" , 2 )--�ڻݡD�D�n��h���D�D�D��D�D�D
	star_WorldBattle_ScoreCal( 1 , 2 )
	local playcount = SetSearchAllPlayer(RoomID)
	for i=1 , playcount do
		local NpcGID = GetSearchResult()		
		Lua_bk_warplayerpoint( NpcGID , 363 )
		ScriptMessage( NpcGID , NpcGID , 0 ,"[SC_ZONE190_WIN05]" , 2 )--�@�ɾԳ�2�ӧQ�r��(�ӤH
	end
	--WriteRoleValue ( OwnerID()  , EM_RoleValue_Register3 , 0 )
	ScriptMessage( OwnerID() , -1 , 2 ,"[SC_ZONE190_WIN02]" , 2 )--�@�ɾԳ�2�ӧQ�r��
end
function cl_191gokulo_dead() --�u�\���`��b��������N�nŪ���L��BUFF�h�ƵM��R���@�h
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) 
	local boss = ReadRoleValue( OwnerID() , EM_RoleValue_PID)
	local gokulo2 = ReadRoleValue( boss , EM_RoleValue_Register3 )
	local X1 = 0
	local Y1 = 0
	local Z1 = 0
	WriteRoleValue ( boss , EM_RoleValue_Register3 , gokulo2-1 )
	local oo = GetDistance( OwnerID(), boss );
	if oo <= 50 then
		local BUFF = Lua_BuffPosSearch( boss, 508339 )
		local BUFFX=1
		BUFF= Lua_BuffPosSearch( boss , 508339 )
		BUFFX=BuffInfo( boss, BUFF , EM_BuffInfoType_Power )---Ū���ޯ൥��
		CancelBuff(	boss, 508339 )
		BUFFXX = BUFFX-1
		if BUFFXX >= 0 then
			Addbuff ( boss  , 508339 , BUFFXX , -1 )
		end	
	end
	sleep ( 20 )
	DelObj ( OwnerID() )
end
function cl_191ball_collision() ---PlotType Ĳ�o���� (����"touch"Ĳ�I�B"range"�d��B"dead"���`�B"collision"�I���|��)
	local ball = TargetID()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ---�ŧi�o�Ӧa��~�O�ڲ{�bŪ�쪺�a��
	local bt = ReadRoleValue( ball , EM_RoleValue_PID )
	local boss = ReadRoleValue( ball , EM_RoleValue_Register1 )
	if ReadRoleValue( OwnerID() , EM_RoleValue_VOC ) ~= 0 then
		if ReadRoleValue( OwnerID() , EM_RoleValue_IsDead ) ~=  1 then
			CastSpell ( ball , ball, 496568  )
			sleep ( 10 )
			killid ( ball , ball)
			sleep ( 5 )
			DelObj ( ball )
		end
	end
end
function cl_762_ball_dead() ----��y�������@��--�n�R�������W����y
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local bt = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local boss = ReadRoleValue( OwnerID() , EM_RoleValue_Register1 )
	local AI = ReadRoleValue( OwnerID() , EM_RoleValue_Register2 )
	local fiag = 0
	fiag = DW_Rand(254)
	local ball = CreateObjByFlag( 104985 ,780817 ,fiag, 1 ) --i = �X�нs��  
	SetModeEx(ball,EM_SetModeType_Mark, false)--�i�аO/�I��(�i�H�����a�I��)
	SetModeEx(ball,EM_SetModeType_HideName, false)--NPC �Ϊ����Y�W���W�٬O�_���
	SetModeEx(ball,EM_SetModeType_NotShowHPMP, false)--����ܦ��
	SetModeEx(ball,EM_SetModeType_Strikback, false)--����
	SetModeEx(ball,EM_SetModeType_Move, true)--����
	SetModeEx(ball,EM_SetModeType_Fight, false)--�i�������
	SetModeEx(ball,EM_SetModeType_Searchenemy, false)--�j�M�ĤH
	SetModeEx(ball,EM_SetModeType_Obstruct, false)--�|����(���ר�L������)
	AddToPartition( ball, RoomID)
	WriteRoleValue ( ball , EM_RoleValue_PID, bt )
	WriteRoleValue ( ball , EM_RoleValue_Register1, boss )
	WriteRoleValue ( ball , EM_RoleValue_Register2, AI )
	BeginPlot(ball ,"cl_762_19205ball" , 0) --�����X��+����H���P�_
end
function cl_Randball_dead() ----��y�������@��--�n�R�������W����y
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local bt = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local boss = ReadRoleValue( OwnerID() , EM_RoleValue_Register1 )
	local AI = ReadRoleValue( OwnerID() , EM_RoleValue_Register2 )
	local fiag = 0
	fiag = DW_Rand(254)
	local ball = CreateObjByFlag( 105123 ,780817 ,fiag, 1 ) --i = �X�нs��
	SetModeEx(ball,EM_SetModeType_Mark, false)--�i�аO/�I��(�i�H�����a�I��)
	SetModeEx(ball,EM_SetModeType_HideName, false)--NPC �Ϊ����Y�W���W�٬O�_���
	SetModeEx(ball,EM_SetModeType_NotShowHPMP, false)--����ܦ��
	SetModeEx(ball,EM_SetModeType_Strikback, false)--����
	SetModeEx(ball,EM_SetModeType_Move, true)--����
	SetModeEx(ball,EM_SetModeType_Fight, false)--�i�������
	SetModeEx(ball,EM_SetModeType_Searchenemy, false)--�j�M�ĤH
	SetModeEx(ball,EM_SetModeType_Obstruct, false)--�|����(���ר�L������)
	AddToPartition( ball, RoomID)
	WriteRoleValue ( ball , EM_RoleValue_PID, bt )
	WriteRoleValue ( ball , EM_RoleValue_Register1, boss )
	WriteRoleValue ( ball , EM_RoleValue_Register2, AI )
	BeginPlot(ball ,"cl_762_19205ball" , 0) --�����X��+����H���P�_
end
function cl_191gokulo() ----�u�\���԰�
	local kulo = OwnerID()
	local RoomID = ReadRoleValue( kulo , EM_RoleValue_RoomID )
	local boss = ReadRoleValue( kulo , EM_RoleValue_PID)
	local skill = 0
	local skill1 = 0
	local CombatBegin = 0
	local Attackplayer = Lua_AP_HateTargetID( boss )
	SetPlot( kulo,"dead","cl_191gokulo_dead", 0 )
	SetAttack( kulo , Attackplayer)
	CastSpell ( kulo , boss, 496734  )
	sleep ( 30 )
	Addbuff ( boss , 508339 , 0 , -1 )
	while 1 do
		sleep (10)
		local AttackTarget = ReadRoleValue( kulo , EM_RoleValue_AttackTargetID )-----�C�@���M����������ؼ�
		if HateListCount( boss ) ~= 0 then ---�p�G������������H�N�~��԰�
			if CombatBegin == 0 then   -----�p�G������������H~�N�N�o�ӭȧ���
				CombatBegin = 1       ------�N�����԰��}�l���A�ȧ令1~�N��N�O���i�J�԰��F
			end
			if CombatBegin == 1 then
				skill = skill + 1
				if skill >= 3 then ----�C����I��@���ޯ�(�w�t��)
					CastSpelllv ( kulo , kulo , 496742 , 0 )
					sleep ( 10 )
					skill = 0
				end
				if skill1 >= 12 then
					Attackplayer = Lua_AP_HateTargetID( boss )
					SetAttack( kulo , Attackplayer)
					skill1 = 0
				end
				local MaxHP = ReadRoleValue( kulo , EM_RoleValue_MaxHP )					--Ū��BOSS�`��q
				local NowHP = ReadRoleValue( kulo , EM_RoleValue_HP )						--Ū��BOSS��e��q
				local HPPercent = ( NowHP / MaxHP )*100	
				if HPPercent <= 50 then   -----��HP�C��10%�n�X�{�ϼu�y
					CastSpelllv ( kulo , kulo, 496740 , 0 )
					sleep ( 10 )
				end
			end
		elseif HateListCount ( boss ) == 0 then ---�p�G����������S���H�N�n�Ǧ^��������
			if CombatBegin == 1 then  ----�p�G��������S���H�F~�N�N�o�ӭȧ���
				CombatBegin = 0
				--delobj ( kulo )
			end
		end
	end
end
function cl_19105Bon() ----�u�\�ͥX���z���D�I��AE��R���ۤv
	local Bon = OwnerID()
	local RoomID = ReadRoleValue( Bon , EM_RoleValue_RoomID )
	CastSpell ( Bon , Bon, 496735  )
	sleep ( 20 )
	DelObj ( Bon )
end
function cl_19105boss() ----BOSS��ۦ����Ҧ�
	local boss = OwnerID()
	local RoomID = ReadRoleValue( boss , EM_RoleValue_RoomID )
	local AI = ReadRoleValue( boss , EM_RoleValue_PID)
	local CombatBegin = 0
	local skill = 0
	local skill1 = 0
	local skill2 = 0
	local gokulo = 0
	local Flag_OP = 780839
	local cosl
	local kulo
	local kuio_table = {}
	local kuio_No = 0
	local Six_Table = {}
	local six = 0
	local ch_Table = {}
	local chin = 0
	SetPlot( boss,"dead","cl_762_19205B_dead", 10 )  ---�������`�@��
	while 1 do
		sleep (10)
		local AttackTarget = ReadRoleValue( boss , EM_RoleValue_AttackTargetID )-----�C�@���M����������ؼ�
		local gokulo2 = ReadRoleValue ( boss , EM_RoleValue_Register3 )
		if HateListCount( boss ) ~= 0 then ---�p�G������������H�N�~��԰�
			if CombatBegin == 0 then   -----�p�G������������H~�N�N�o�ӭȧ���
				CombatBegin = 1       ------�N�����԰��}�l���A�ȧ令1~�N��N�O���i�J�԰��F
				WriteRoleValue ( AI , EM_RoleValue_Register2 , 1 )
				local PPL = SetSearchAllPlayer(RoomID )
				local Flag = 1
				for i = 1 , PPL , 1 do ---�⪱�a��J�ж��� 
					local ID = GetSearchResult()
					if ReadRoleValue( ID , EM_RoleValue_IsDead ) ~= 1 and 
						ReadRoleValue( ID, EM_RoleValue_VOC) ~= 0  and 
						ReadRoleValue( ID , EM_RoleValue_RoomID  ) == RoomID then
						SetPosByFlag( ID , Flag_OP , Flag ) 
						Flag = Flag + 1
						if Flag > GetMoveFlagCount(Flag_OP) -1 then
							Flag = 1
						end
						sysCastSpelllv ( ID , boss , 496773 , 0 )
					end
				end
				ScriptMessage( boss , -1 , 2 ,"[SC_1910501]" , 2 ) ----�A�̳��M��쪺�F�o�̡A���N���ڦn�n�a�۫ݦU��a
				for i = 1 , 3 do   ---BOSS�i�J�԰���}�l�;u�\,�@�@�n��3��
					cosl = CreateObjByFlag( 105077 , 780820 , i , 1 ) --i = �X�нs��
					SetModeEx( cosl , EM_SetModeType_Strikback, false) ---����(�_)
					SetModeEx( cosl , EM_SetModeType_Move, false) ---����	(�_)
					SetModeEx( cosl , EM_SetModeType_Searchenemy, false)--����(�_)
					SetModeEx( cosl , EM_SetModeType_Mark, false)			---�i�I��(�O)
					SetModeEx( cosl , EM_SetModeType_ShowRoleHead, false) 		---�Y����(�O)
					SetModeEx( cosl , EM_SetModeType_Fight, false) ---�i���(�O)
					SetModeEx( cosl , EM_SetModeType_NotShowHPMP , false) ----����ܼg��
					AddToPartition( cosl , RoomID )
					BeginPlot( cosl , "cl_cosl" , 10 )
				end
				sleep ( 20 )
				for i=1 , 3  do   ---BOSS�i�J�԰���}�l�;u�\,�@�@�n��3�� cl_bon
					kulo = CreateObjByFlag( 104986 , 780820 , i , 1 ) --i = �X�нs��
					AddToPartition( kulo , RoomID )
					WriteRoleValue ( kulo , EM_RoleValue_PID, boss )
					gokulo2 = ReadRoleValue ( boss , EM_RoleValue_Register3 )
					WriteRoleValue ( boss  , EM_RoleValue_Register3 , gokulo2+1 )
					BeginPlot( kulo , "cl_191gokulo" , 10 )
					table.insert( kuio_table , kulo )
					sleep ( 2 )
				end
				sleep ( 10 )
				SetModeEx( boss , EM_SetModeType_Fight, true) ---�i���
				SetModeEx( boss , EM_SetModeType_Move, true) ---����	(�_)
			end
			if CombatBegin == 1 then
				skill1 = skill1 + 1
				skill2 = skill2 + 1
				gokulo = gokulo + 1
				if skill >= 7 then
					Luck = DW_Rand(100)  ----->��100�Ӷüƥh�H���@�ӭȥX��
					if ( Luck >= 1 and Luck <= 10) or( Luck >=21 and Luck <= 30 ) or
					   ( Luck >= 41 and Luck <= 50 ) or ( Luck >= 61 and Luck <= 70 ) or
					   ( Luck >= 81 and Luck <= 90 ) then      ------------>���H���X�Ӫ��ȵ���H�W���üƴN�I��Ĥ@��
					   CastSpelllv ( boss , AttackTarget , 496738 , 0  )----���e�ؼ�����@�ӥ��j�ˮ`
					   sleep ( 10 )   --------->�񪱪k�N���Ӱj�鰱���
					elseif ( Luck >= 11 and Luck <= 20 ) or( Luck >= 31 and Luck <= 40 ) or
					   ( Luck >= 51 and Luck <= 60 ) or( Luck >= 70 and Luck <= 80 ) or
					   ( Luck >= 91 and Luck <= 100 ) then   ------------>���H���X�Ӫ��ȵ���H�W���üƴN�I��ĤG��
					   CastSpelllv ( boss , boss , 496739 , 0 )----�e�记��
					   sleep ( 20 )
					end
					sleep ( 10 )
					skill = 0
				end
				if skill1 >= 9 then
					--sysCastSpelllv ( boss , boss , 496743 , 0 )----����3�W���a
					Six_Table = DW_HateRemain(0)  ----�N����������a�̷Ӥ��밪�C�ƦC�åB�ư��D�Z
					six=table.getn(Six_Table) ----����o��Table
					if six > 0 then
						for i = 1 , 3 , 1 do ---���X�Ӧh�ּƶq�N���h�֦�
							Rand_Num = DW_Rand(six)
							table.insert( ch_Table , Six_Table[Rand_Num] )
							table.remove ( Six_Table , Rand_Num )
							six=table.getn(Six_Table)
						end
					end
					chin=table.getn(ch_Table) ----����o��Table
					if chin > 0 then
						for i = 1 , chin , 1 do
							Addbuff (  ch_Table[i] , 508352 , 0 , 10 ) ---
						end
					end
					sleep ( 10 )
					skill1 = 0
					ch_Table = {}
					Six_Table = {}
					chin = 0
					six = 0
				end
				if skill2 >= 15 then
					while 	ReadRoleValue( boss , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
						sleep(10)
					end
					ScriptMessage( boss , -1 , 2 ,"[SC_1910503]" , 2 ) ----�V�ڰ^�m�A�̪��A��a�A���O�h�򪺴��i��
					local MaxHP = ReadRoleValue( boss , EM_RoleValue_MaxHP )		--Ū��BOSS�`��q
					local NowHP = ReadRoleValue( boss , EM_RoleValue_HP )	
					local HPPercent = ( NowHP / MaxHP )*100	
					if HPPercent > 99 then
						CastSpelllv ( boss , boss , 496863 , 0 )	---�I�񰲪��ɦ�N
						sleep ( 30 )
					elseif HPPercent < 99 then
						CastSpelllv ( boss , boss , 496736 , 0  )  ---Ū��X�h�N�I��X�Ū��ɦ�N
						sleep ( 30 )
					end
					sleep ( 10 )
					skill2 = 0
				end
				if gokulo >= 30 then
					if gokulo2 <= 2 then
						for i = 1 , 3 do   ---BOSS�i�J�԰���}�l�;u�\,�@�@�n��3��
							cosl = CreateObjByFlag( 105077 , 780820 , i , 1 ) --i = �X�нs��
							SetModeEx( cosl , EM_SetModeType_Strikback, false) ---����(�_)
							SetModeEx( cosl , EM_SetModeType_Move, false) ---����	(�_)
							SetModeEx( cosl , EM_SetModeType_Searchenemy, false)--����(�_)
							SetModeEx( cosl , EM_SetModeType_Mark, false)			---�i�I��(�O)
							SetModeEx( cosl , EM_SetModeType_ShowRoleHead, false) 		---�Y����(�O)
							SetModeEx( cosl , EM_SetModeType_Fight, false) ---�i���(�O)
							SetModeEx( cosl , EM_SetModeType_NotShowHPMP , false) ----����ܼg��
							AddToPartition( cosl , RoomID )
							BeginPlot( cosl , "cl_cosl" , 10 )
							sleep ( 2 )
						end
						sleep ( 20 )
						for i=1 , 3  do   ---BOSS�i�J�԰���}�l�;u�\,�@�@�n��3�� cl_bon
							kulo = CreateObjByFlag( 104986 , 780820 , i , 1 ) --i = �X�нs��
							AddToPartition( kulo , RoomID )
							WriteRoleValue ( kulo , EM_RoleValue_PID, boss )
							gokulo2 = ReadRoleValue ( boss , EM_RoleValue_Register3 )
							WriteRoleValue ( boss  , EM_RoleValue_Register3 , gokulo2+1 )
							BeginPlot( kulo , "cl_191gokulo" , 10 )
							table.insert( kuio_table , kulo )
							sleep ( 2 )
						end
					end
					gokulo = 0
				end
			end
		elseif HateListCount ( boss ) == 0 then ---�p�G����������S���H�N�n�Ǧ^��������
			if CombatBegin == 1 then  ----�p�G��������S���H�F~�N�N�o�ӭȧ���
				CombatBegin = 0
				skill = 0
				skill1 = 0
				skill2 = 0
				for i = 0 , table.getn(kuio_table) , 1 do
					if kuio_table[i] ~= nil then
						DelObj ( kuio_table[i] )
					end
				end
				WriteRoleValue ( AI , EM_RoleValue_Register2 , 3 )
			end
		end
	end
end
function cl_chckbuff() ----�u�\���`�n�ɨD�I��ޯ�
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local X1 = 0
	local Y1 = 0
	local Z1 = 0
	X1 = ReadRoleValue ( OwnerID(), EM_RoleValue_X)
	Y1 = ReadRoleValue ( OwnerID(), EM_RoleValue_Y)
	Z1 = ReadRoleValue ( OwnerID(), EM_RoleValue_Z)   ---------�o�̬O���XAttackplayer�̭������ӤH���y��
	local Bon = CreateObj( 105076 , X1, Y1 , Z1 , 0 , 1 )  ------------�n�ͥX�z���D�I��d��100��AE
	SetModeEx( Bon , EM_SetModeType_Strikback, false) ---����(�_)
	SetModeEx( Bon , EM_SetModeType_Move, false) ---����	(�_)
	SetModeEx( Bon , EM_SetModeType_Searchenemy, false)--����(�_)
	SetModeEx( Bon , EM_SetModeType_Mark, false)			---�i�I��(�O)
	SetModeEx( Bon , EM_SetModeType_ShowRoleHead, false) 		---�Y����(�O)
	SetModeEx( Bon , EM_SetModeType_Fight, false) ---�i���(�O)
	SetModeEx( Bon , EM_SetModeType_NotShowHPMP , false) ----����ܼg��
	AddToPartition( Bon , RoomID )
	BeginPlot( Bon,"cl_19105Bon", 0 )
end
function cl_cosl() -----��t�βy
	CastSpelllv ( OwnerID() , OwnerID() , 496764 , 0 )
	sleep ( 30 )
	DelObj ( OwnerID() )
end
function cl_105113() ----�u�\
	local boss_gg = OwnerID()
	local RoomID = ReadRoleValue( boss_gg , EM_RoleValue_RoomID )
	local AI = ReadRoleValue( boss_gg , EM_RoleValue_PID)
	local boss = ReadRoleValue( boss_gg , EM_RoleValue_Register1 )
	local b_door2 = ReadRoleValue( boss_gg , EM_RoleValue_Register2 )
	local CombatBegin = 0
	local boo = 0
	local b_door
	local may
	local may2
	local may_table = {}
	local t1 = ReadRoleValue ( boss_gg , EM_RoleValue_Register4 )
	may = CreateObjByFlag( 105113 , 780820 , 4 , 1 ) --i = �X�нs��
	AddToPartition( may , RoomID )
	WriteRoleValue ( may , EM_RoleValue_PID, boss_gg )
	WriteRoleValue ( may , EM_RoleValue_Register1, boss )
	t1 = ReadRoleValue ( boss_gg , EM_RoleValue_Register4 )
	WriteRoleValue ( boss_gg  , EM_RoleValue_Register4 , t1+1 )
	table.insert( may_table , may )
	may2 = CreateObjByFlag( 105113 , 780820 , 5 , 1 ) --i = �X�нs��
	AddToPartition( may2 , RoomID )
	WriteRoleValue ( may2 , EM_RoleValue_PID, boss_gg )
	WriteRoleValue ( may2 , EM_RoleValue_Register1, boss )
	t1 = ReadRoleValue ( boss_gg , EM_RoleValue_Register4 )
	WriteRoleValue ( boss_gg  , EM_RoleValue_Register4 , t1+1 )
	table.insert( may_table , may2 )
	BeginPlot( may2 , "cl_105113attack" , 10 )
	sleep ( 2 )
	BeginPlot( may , "cl_105113attack" , 10 )
	while 1 do
		sleep (10)
		local p = ReadRoleValue ( AI , EM_RoleValue_Register2 )
		if p == 1 then
			t1 = ReadRoleValue ( boss_gg , EM_RoleValue_Register4 )
			boo = boo + 1
			if boo >= 40 then
				if t1 <= 1 then
					may = CreateObjByFlag( 105113 , 780820 , 4 , 1 ) --i = �X�нs��
					AddToPartition( may , RoomID )
					WriteRoleValue ( may , EM_RoleValue_PID, boss_gg )
					WriteRoleValue ( may , EM_RoleValue_Register1, boss )
					t1 = ReadRoleValue ( boss_gg , EM_RoleValue_Register4 )
					WriteRoleValue ( boss_gg  , EM_RoleValue_Register4 , t1+1 )
					table.insert( may_table , may )
					may2 = CreateObjByFlag( 105113 , 780820 , 5 , 1 ) --i = �X�нs��
					AddToPartition( may2 , RoomID )
					WriteRoleValue ( may2 , EM_RoleValue_PID, boss_gg )
					WriteRoleValue ( may2 , EM_RoleValue_Register1, boss )
					t1 = ReadRoleValue ( boss_gg , EM_RoleValue_Register4 )
					WriteRoleValue ( boss_gg  , EM_RoleValue_Register4 , t1+1 )
					table.insert( may_table , may2 )
					BeginPlot( may2 , "cl_105113attack" , 10 )
					sleep ( 2 )
					BeginPlot( may , "cl_105113attack" , 10 )
				end
				boo = 0
			end
		elseif p ~= 1 then
			for i = 0 , table.getn(may_table) , 1 do
				if may_table[i] ~= nil then
					DelObj ( may_table[i] )
				end
			end
			delobj (boss_gg)
			delobj (b_door2)
		end
	end
end
function cl_105114() ----�ͧ�
	local boss_gg = OwnerID()
	local RoomID = ReadRoleValue( boss_gg , EM_RoleValue_RoomID )
	local AI = ReadRoleValue( boss_gg , EM_RoleValue_PID)
	local boss = ReadRoleValue( boss_gg , EM_RoleValue_Register1 )
	local b_door2 = ReadRoleValue( boss_gg , EM_RoleValue_Register2 )
	local CombatBegin = 0
	local boo = 0
	local b_door
	local may
	local may2
	local may_table = {}
	local t1 = ReadRoleValue ( boss_gg , EM_RoleValue_Register4 )
	may = CreateObjByFlag( 105114 , 780820 , 4 , 1 ) --i = �X�нs��
	AddToPartition( may , RoomID )
	WriteRoleValue ( may , EM_RoleValue_PID, boss_gg )
	WriteRoleValue ( may , EM_RoleValue_Register1, boss )
	t1 = ReadRoleValue ( boss_gg , EM_RoleValue_Register4 )
	WriteRoleValue ( boss_gg  , EM_RoleValue_Register4 , t1+1 )
	WriteRoleValue ( may  , EM_RoleValue_Register4 , AI )
	table.insert( may_table , may )
	may2 = CreateObjByFlag( 105114 , 780820 , 5 , 1 ) --i = �X�нs��
	AddToPartition( may2 , RoomID )
	WriteRoleValue ( may2 , EM_RoleValue_PID, boss_gg )
	WriteRoleValue ( may2 , EM_RoleValue_Register1, boss )
	t1 = ReadRoleValue ( boss_gg , EM_RoleValue_Register4 )
	WriteRoleValue ( boss_gg  , EM_RoleValue_Register4 , t1+1 )
	WriteRoleValue ( may2  , EM_RoleValue_Register4 , AI )
	table.insert( may_table , may2 )
	may3 = CreateObjByFlag( 105114 , 780820 , 4 , 1 ) --i = �X�нs��
	AddToPartition( may3 , RoomID )
	WriteRoleValue ( may3 , EM_RoleValue_PID, boss_gg )
	WriteRoleValue ( may3 , EM_RoleValue_Register1, boss )
	t1 = ReadRoleValue ( boss_gg , EM_RoleValue_Register4 )
	WriteRoleValue ( boss_gg  , EM_RoleValue_Register4 , t1+1 )
	WriteRoleValue ( may3  , EM_RoleValue_Register4 , AI )
	table.insert( may_table , may3 )
	may4 = CreateObjByFlag( 105114 , 780820 , 5 , 1 ) --i = �X�нs��
	AddToPartition( may4 , RoomID )
	WriteRoleValue ( may4 , EM_RoleValue_PID, boss_gg )
	WriteRoleValue ( may4 , EM_RoleValue_Register1, boss )
	t1 = ReadRoleValue ( boss_gg , EM_RoleValue_Register4 )
	WriteRoleValue ( boss_gg  , EM_RoleValue_Register4 , t1+1 )
	WriteRoleValue ( may4  , EM_RoleValue_Register4 , AI )
	table.insert( may_table , may4 )
	BeginPlot( may2 , "cl_105114attack" , 10 )
	sleep ( 2 )
	BeginPlot( may , "cl_105114attack" , 10 )
	sleep ( 2 )
	BeginPlot( may3 , "cl_105114attack" , 10 )
	sleep ( 2 )
	BeginPlot( may4 , "cl_105114attack" , 10 )
	ScriptMessage( boss_gg , -1 , 2 ,"[SC_1910504]" , 2 )--�ڪ����q�̡A�n�n���ک۫ݳo�ǫȤH��
	while 1 do
		sleep (10)
		local p = ReadRoleValue ( AI , EM_RoleValue_Register2 )
		if p == 1 then
			t1 = ReadRoleValue ( boss_gg , EM_RoleValue_Register4 )
			boo = boo + 1
			if boo >= 40 then
				if t1 <= 3 then
					may = CreateObjByFlag( 105114 , 780820 , 4 , 1 ) --i = �X�нs��
					AddToPartition( may , RoomID )
					WriteRoleValue ( may , EM_RoleValue_PID, boss_gg )
					WriteRoleValue ( may , EM_RoleValue_Register1, boss )
					t1 = ReadRoleValue ( boss_gg , EM_RoleValue_Register4 )
					WriteRoleValue ( boss_gg  , EM_RoleValue_Register4 , t1+1 )
					WriteRoleValue ( may  , EM_RoleValue_Register4 , AI )
					table.insert( may_table , may )
					may2 = CreateObjByFlag( 105114 , 780820 , 5 , 1 ) --i = �X�нs��
					AddToPartition( may2 , RoomID )
					WriteRoleValue ( may2 , EM_RoleValue_PID, boss_gg )
					WriteRoleValue ( may2 , EM_RoleValue_Register1, boss )
					t1 = ReadRoleValue ( boss_gg , EM_RoleValue_Register4 )
					WriteRoleValue ( boss_gg  , EM_RoleValue_Register4 , t1+1 )
					WriteRoleValue ( may2  , EM_RoleValue_Register4 , AI )
					table.insert( may_table , may2 )
					may3 = CreateObjByFlag( 105114 , 780820 , 4 , 1 ) --i = �X�нs��
					AddToPartition( may3 , RoomID )
					WriteRoleValue ( may3 , EM_RoleValue_PID, boss_gg )
					WriteRoleValue ( may3 , EM_RoleValue_Register1, boss )
					t1 = ReadRoleValue ( boss_gg , EM_RoleValue_Register4 )
					WriteRoleValue ( boss_gg  , EM_RoleValue_Register4 , t1+1 )
					WriteRoleValue ( may3  , EM_RoleValue_Register4 , AI )
					table.insert( may_table , may3 )
					may4 = CreateObjByFlag( 105114 , 780820 , 5 , 1 ) --i = �X�нs��
					AddToPartition( may4 , RoomID )
					WriteRoleValue ( may4 , EM_RoleValue_PID, boss_gg )
					WriteRoleValue ( may4 , EM_RoleValue_Register1, boss )
					t1 = ReadRoleValue ( boss_gg , EM_RoleValue_Register4 )
					WriteRoleValue ( boss_gg  , EM_RoleValue_Register4 , t1+1 )
					WriteRoleValue ( may4  , EM_RoleValue_Register4 , AI )
					table.insert( may_table , may4 )
					BeginPlot( may2 , "cl_105114attack" , 10 )
					sleep ( 2 )
					BeginPlot( may , "cl_105114attack" , 10 )
					sleep ( 2 )
					BeginPlot( may3 , "cl_105114attack" , 10 )
					sleep ( 2 )
					BeginPlot( may4 , "cl_105114attack" , 10 )
				end
				boo = 0
			end
		elseif p ~= 1 then
			for i = 0 , table.getn(may_table) , 1 do
				if may_table[i] ~= nil then
					DelObj ( may_table[i] )
				end
			end
			delobj ( boss_gg )
			delobj (b_door2)
		end
	end
end
function cl_105113_dead()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) 
	local boss_gg = ReadRoleValue( OwnerID() , EM_RoleValue_PID)
	local t1 = ReadRoleValue( boss_gg , EM_RoleValue_Register4 )
	WriteRoleValue ( boss_gg , EM_RoleValue_Register4 , t1-1 )
	DelObj ( OwnerID() )
end
function cl_105113attack() ----�e���çL���԰�
	local kulo = OwnerID()
	local RoomID = ReadRoleValue( kulo , EM_RoleValue_RoomID )
	local door = ReadRoleValue( kulo , EM_RoleValue_PID)
	local boss = ReadRoleValue( kulo , EM_RoleValue_Register1)
	local skill = 0
	local skill1 = 0
	local CombatBegin = 0
	local Attackplayer = Lua_AP_HateTargetID( boss )
	SetPlot( kulo,"dead","cl_105113_dead", 0 )
	SetAttack( kulo , Attackplayer)
	while 1 do
		sleep (10)
		local AttackTarget = ReadRoleValue( kulo , EM_RoleValue_AttackTargetID )-----�C�@���M����������ؼ�
		if HateListCount( kulo ) ~= 0 then ---�p�G������������H�N�~��԰�
			if CombatBegin == 0 then   -----�p�G������������H~�N�N�o�ӭȧ���
				CombatBegin = 1       ------�N�����԰��}�l���A�ȧ令1~�N��N�O���i�J�԰��F
			end
			if CombatBegin == 1 then
				skill1 = skill1+1
				skill = skill+1
				if skill1 >= 5 then
					Attackplayer = Lua_AP_HateTargetID( boss )
					SetAttack( kulo , Attackplayer)
					CastSpelllv ( kulo , Attackplayer , 496831 , 0 )
					skill1 = 0
				end
				if skill >= 9 then ----�C����I��@���ޯ�(�w�t��)
					CastSpelllv ( kulo , kulo , 496832 , 0 )
					sleep ( 60 )
					skill = 0
				end
			end
		elseif HateListCount ( kulo ) == 0 then ---�p�G����������S���H�N�n�Ǧ^��������
			if CombatBegin == 1 then  ----�p�G��������S���H�F~�N�N�o�ӭȧ���
				CombatBegin = 0
				skill = 0
			end
		end
	end
end
function cl_105114attack() ----�ͧ����԰�
	local kulo = OwnerID()
	local RoomID = ReadRoleValue( kulo , EM_RoleValue_RoomID )
	local door = ReadRoleValue( kulo , EM_RoleValue_PID)
	local boss = ReadRoleValue( kulo , EM_RoleValue_Register1)
	local skill = 0
	local skill1 = 0
	local CombatBegin = 0
	local Attackplayer = Lua_AP_HateTargetID( boss )
	SetPlot( kulo,"dead","cl_105113_dead", 0 )
	SetAttack( kulo , Attackplayer)
	while 1 do
		sleep (10)
		local AttackTarget = ReadRoleValue( kulo , EM_RoleValue_AttackTargetID )-----�C�@���M����������ؼ�
		if HateListCount( kulo ) ~= 0 then ---�p�G������������H�N�~��԰�
			if CombatBegin == 0 then   -----�p�G������������H~�N�N�o�ӭȧ���
				CombatBegin = 1       ------�N�����԰��}�l���A�ȧ令1~�N��N�O���i�J�԰��F
			end
			if CombatBegin == 1 then
				skill = skill + 1
				skill1 = skill1 + 1
				if skill >= 3 then ----�C����I��@���ޯ�(�w�t��)
					CastSpelllv ( kulo , kulo , 496830 , 0 )
					sleep ( 10 )
					skill = 0
				end
				if skill1 >= 12 then
					Attackplayer = Lua_AP_HateTargetID( boss )
					SetAttack( kulo , Attackplayer)
					CastSpelllv ( kulo , Attackplayer , 496831 , 0 )
					skill1 = 0
				end
			end
		elseif HateListCount ( kulo ) == 0 then ---�p�G����������S���H�N�n�Ǧ^��������
			if CombatBegin == 1 then  ----�p�G��������S���H�F~�N�N�o�ӭȧ���
				CombatBegin = 0
				skill = 0
			end
		end
	end 
end
function cl_762_496870() ----�P�_�ɦ��496870
	local MaxHP = ReadRoleValue( TargetID() , EM_RoleValue_MaxHP )					--Ū��BOSS�`��q
	local NowHP = ReadRoleValue( TargetID() , EM_RoleValue_HP )						--Ū��BOSS��e��q
	local HPPercent = ( NowHP / MaxHP )*100	
	if HPPercent > 99 then
		CastSpelllv ( OwnerID() , TargetID() , 496862 , 0 )
	elseif HPPercent < 99 then
		local SK = Lua_BuffPosSearch( TargetID(), 508339 )  ---Ū��BOSS�ۤv���W���X�hbuff
		local SKX=0
		sleep(10)
		SK= Lua_BuffPosSearch( TargetID() , 508339 )
		SKX=BuffInfo( TargetID(), SK , EM_BuffInfoType_Power )---Ū���ޯ൥��
		CastSpelllv ( OwnerID() , TargetID() , 496579 , SKX )  ---Ū��X�h�N�I��X�Ū��ɦ�N
	end
end
function cl_191_104988()
	local luck = OwnerID() ----�ڥs��boss
	local RoomID = ReadRoleValue( luck , EM_RoleValue_RoomID ) ---�ŧi�o�Ӧa��~�O�ڲ{�bŪ�쪺�a��
	local boss = ReadRoleValue( luck , EM_RoleValue_Register1)
	while 1 do
		sleep ( 10 )
		local AttackTarget = ReadRoleValue( boss , EM_RoleValue_AttackTargetID )-----�C�@���M����������ؼ�
		local oo = GetDistance( luck , boss );
		if oo <= 25 then
			if ReadRoleValue( boss , EM_RoleValue_RoomID  ) == RoomID then
				SetPosByFlag( AttackTarget, 780839 , 1 )
				ScriptMessage( boss , -1 , 2 ,"[SC_1910502]" , 2 ) ----���M�ӤF�N�n�n�a�ݵۧa
			end
		end
	end
end
function cl_496871()
	local SK = Lua_BuffPosSearch( OwnerID(), 508339 )  ---Ū��BOSS�ۤv���W���X�hbuff
	local SKX=0
	if CheckBuff( OwnerID() , 508339 ) == true then
		SK = Lua_BuffPosSearch( OwnerID() , 508339 )
		SKX=BuffInfo( OwnerID(), SK , EM_BuffInfoType_Power )---Ū���ޯ൥�� 
		sysCastSpelllv ( OwnerID() , OwnerID() , 496737 , SKX+1 )
	else
		sysCastSpelllv ( OwnerID() , OwnerID() , 496737 , 0 )
	end
end
function cl_780796_playfly_()  ---�ǰe����
	addbuff ( OwnerID() , 508480 , 0 , -1 )
	ChangeZone( OwnerID() , 2 , 0, 2690 , 54 , -966 , 240 )
end