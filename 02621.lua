-----�q�γ��~�Ǫ��H���j�ƮĪG�q�Ψ禡------------
function Cl_ZoneMonster_RandBuff() ---�N����ܱ������󲣥ͼ@���W
	local OwnerID = OwnerID()
	local Buff_Table = { 620148 , 620149 , 620150 , 620151 } ---�q�|�ؤ��P��BUFF�ĪG�H������A�o�̬O�@��TABLE
	local RandBuff = DW_Rand ( 100 )
	if RandBuff <= 5 then--1.2.3.4.5
		AddBuff( OwnerID , Buff_Table[1] , 0 , -1 )	
	elseif RandBuff > 35 and RandBuff <= 40 then--36.37.38.39.40
		AddBuff( OwnerID , Buff_Table[2] , 0 , -1 )	
	elseif RandBuff > 60 and RandBuff <= 65 then--61.62.63.64.65
		AddBuff( OwnerID , Buff_Table[3] , 0 , -1 )	
	elseif RandBuff > 95 and RandBuff <= 100 then--96.97.98.99.100
		AddBuff( OwnerID , Buff_Table[4] , 0 , -1 )	
	end
	for i = 1 , table.getn( Buff_Table ) , 1 do --�ˬdTABLE�����Ҧ��s���A�O�_���W���s�b����@��
		if CheckBuff ( OwnerID , Buff_Table[i] ) == true then
			SetPlot( OwnerID , "dead" , "Cl_ZoneMonster_dead" , 0 ) ---���W��TABLE�����@��BUFF�ɡA�����Ǫ����`�@��
			break
		end
	end
end
function Cl_RandBuff_For_ObjID(ZoneID) ---�s��ϰ�һݭn���ͪ������U�l�A�C�ӳU�l�U�����P���_��A��}�ҷs�����Ȱϰ�A�h�b���U�s�W�ϰ�s��
	local Obj_Table = {} --�o�̬��}�C
	Obj_Table[937] = 107217 ---937=���հ�
	Obj_Table[23] = 107217 ---Z23 �_���S�Ԧ㮦��
	return Obj_Table[ZoneID]
end
function Cl_ZoneMonster_dead()---�Ǫ����`�@����������U�l
	local OwnerID = OwnerID()
	local ZoneID = ReadRoleValue ( OwnerID , EM_RoleValue_ZoneID ) --�O���_�Ǫ��ҳB�b���ϰ�ZoneID
	local RoomID = ReadRoleValue ( OwnerID , EM_RoleValue_RoomID )
	local hate_Num = HateListCount( OwnerID ) --���X�Ǫ�����C��ƶq
	local Obj_Table = Cl_RandBuff_For_ObjID(ZoneID) ---���X�Ǫ��Ҧb�ϰ�A�M�ݪ������U�lID
	local hateID = 0
	local Luck = 0
	for i = 0 , hate_Num-1 , 1 do
		hateID = HateListInfo( OwnerID , i , EM_HateListInfoType_GItemID ) --�̷Ӷ��Ǩ��X����C����ID
		if ReadRoleValue( hateID , EM_RoleValue_IsPlayer ) == 1 then ---�ˬd���󶶧Q�O�_�����a�A�קK��NPC�ұ������Ǫ��]�|�����U�l
			Luck = DW_Rand(100)
			if Luck >= 75 and Luck <= 80 then ---��F�����v��F�A�h���ͯ����U�l
				local Npc_X , Npc_Y , Npc_Z = Cl_Read_OwnerXYZ( OwnerID )
				local mob = CreateObj( Obj_Table , Npc_X, Npc_Y , Npc_Z , 0 , 1 )
				SetModeEx( mob , EM_SetModeType_Mark, true)			---�i�I��(�_)
				SetModeEx( mob , EM_SetModeType_Obstruct, true) 			--����(�O)
				SetModeEx( mob , EM_SetModeType_Strikback, false) ---����
				SetModeEx( mob , EM_SetModeType_Move, false) ---����	
				SetModeEx( mob , EM_SetModeType_Fight, false) ---�i���
				SetModeEx( mob , EM_SetModeType_SearchenemyIgnore, false)---�O�_�Q�j�M(�_)
				SetModeEx( mob , EM_SetModeType_Searchenemy, false)			--����(�_)	
				SetModeEx( mob , EM_SetModeType_NotShowHPMP, true) --
				WriteRoleValue ( mob , EM_RoleValue_LiveTime , 60 ) ---�קK���W�U�l�ƶq�Ӧh�A�]�w�ͦs�ɶ�
				WriteRoleValue ( mob , EM_RoleValue_Register1 , hateID ) ---�b���󤺬����}�Ǫ�
				AddToPartition( mob , RoomID )
				break ---�u�ݭn����@���A�ҥH���}��Ӱj��
			end	
		end
	end
end
function Cl_ZoneMonster_TreasureBox()  --�����U�l���ͼ@��
	local OwnerID = OwnerID()
	local Right_Time = 0
	SetPlot( OwnerID ,"touch", "Cl_ZoneMonster_TreasureBox_true" ,40 )  --���������U�lĲ�I�@���A�����a�ߨ����e��
	SetCursorType( OwnerID , eCursor_Pickup )
	while ReadRoleValue ( OwnerID , EM_RoleValue_PID ) ~= 1 do ---��PID�����a�Ȥ�����1�~����j��
		sleep ( 10 )
		Right_Time = Right_Time + 1 ---�o�Ӯɶ����C��+1�A�ت��O��}�Ǫ̿�𤣾ߨ��ɡA�i������L���a�ߨ�
		if Right_Time >= 40 then
			WriteRoleValue ( OwnerID , EM_RoleValue_PID , 1 )
		end
	end
end
function Cl_ZoneMonster_TreasureBox_true() ---���a���ߨ��@��
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	if ReadRoleValue ( TargetID , EM_RoleValue_PID ) ~= 1 then ---���ˬd�ߨ��v
		if ReadRoleValue ( TargetID , EM_RoleValue_Register1 ) == OwnerID then ---�Y�j�w�˨��v�ɶ����A�ˬd�ߨ����a�O�_���}�Ǫ�
			KillID( OwnerID , TargetID )
		else
			ScriptMessage ( OwnerID , OwnerID , 1 , "[SC_THIS_NOT_YOU_ITEM]" , 0 ) ---�Y�j�w�˨��v�ɶ����A�h�������a�T��
		end
	else ----�ߨ��v�ɶ��L��A�}�񵹩Ҧ����a�ߨ�
		KillID( OwnerID , TargetID )
	end
end