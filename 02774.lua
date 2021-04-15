------------------------------------------------------------
--�\��G�̱���]�̶Z���B�̤���^�ƧǸ��
--��J�G���a�s����B�����ƪ�B�ƧǱ���]0 = ���W�B1 = ����^
--��X�G�ƧǹL�����a�s����B�ƧǹL�������ƪ�
------------------------------------------------------------
function LUA_YOYO_Sequence(PlayerTable , ConditionTable , Lift)
	local GroupTable = {}
	local SortPlayerTable = {}
	local SortConditionTable = {}
	local TableComp

	for SN = 1 , table.getn(PlayerTable) do
		GroupTable[SN]={PlayerTable[SN] ,ConditionTable[SN]};
	end

	if Lift == 0 then
		TableComp = function (A,B) return A[2] < B[2] end --����]�����W�Ƨ�
	else
		TableComp = function (A,B) return A[2] > B[2] end --����]������Ƨ�
	end
	table.sort( GroupTable , TableComp) --�ӱ���Ƨ�Table�����

	for SN = 1 , table.getn(PlayerTable) do
		SortPlayerTable[SN] = GroupTable[SN][1];
		SortConditionTable[SN] = GroupTable[SN][2];
		--print(SortPlayerTable[SN].."  "..SortConditionTable[SN])
	end

	return SortPlayerTable , SortConditionTable
end

------------------------------------------------------------
--�\��G�N���W���Ҧ����a�s���C�iTable
--��J�G�������s��RoomID
--��X�G�j�M�X���Ҧ����a�s���M��
------------------------------------------------------------
function LUA_YOYO_GetAllPlayer( RoomID )
	local PlayerCount = SetSearchAllPlayer( RoomID ) --���W���a�M��
	local PlayerList = {}
	for Count = 1 , PlayerCount do
		PlayerList[Count] = GetSearchResult()
	end
	return PlayerList
end

------------------------------------------------------------
--�\��G�N���W���Ҧ��ŦX�Y�s����NPC
--��J�G�������s��RoomID�BNPC�s��
--��X�G�j�M�X���Ҧ��ŦX��NPC�s�����M��
------------------------------------------------------------
function LUA_YOYO_GetSpecificNPC( RoomID , NPCID )
	local NPCCount = SetSearchAllNPC( RoomID ) --���W�Ҧ�NPC�M��
	local SearchNPC
	local AllNPCList = {}
	local NPCList = {}
	for Count = 1 , NPCCount do
		AllNPCList[Count] = GetSearchResult()
		SearchNPC = ReadRoleValue( AllNPCList[Count] , EM_RoleValue_OrgID  )
		if SearchNPC == NPCID then
			table.insert( NPCList , AllNPCList[Count] )
			--DebugMsg( 0 , RoomID , "Search NPC OrgID is " .. SearchNPC )
		end
	end
	return NPCList
end
------------------------------------------------------------
--�\��G�q����C����o�H�����a�A�åB�n�ư�GM
--��J�GBoss�s���B�n���o�����a�ƶq�B�O�_�ݭn�ư��Z�J
--��X�G���X�����a�M��
------------------------------------------------------------
function LUA_YOYO_RandPlayerNotGM( BossID , HowMuch , AntiTank ) --HowMuch��J�h�ִN�O���h�֭Ӫ��a�AAntiTank��TRUE�N�O�n�ƩZ
	local Hate = KS_GetHateList( BossID , 4 ) --Type = 4 : �ư�GM
	local TargetPlayer = {} --���a�}�C
	local RPX = 0 --�ü�

	if AntiTank == "TRUE" then --�P�_�O�_�ݭn�ư��Z�J
		table.remove( Hate , 1 )	
	end

	local HateCount = table.getn( Hate )

	RPX = DW_Rand(HateCount)
	if HowMuch < HateCount then
		for Count = 1 , HowMuch do
			RPX = RPX + ( HateCount - 1 )
			if RPX <= HateCount then
				TargetPlayer[Count] = Hate[RPX]
			else
				RPX = RPX - HateCount
				TargetPlayer[Count] = Hate[RPX]
			end
		end
		return TargetPlayer
	else
		return Hate
	end
end
------------------------------------------------------------
--�\��G���o�d�򤺪����a�M��A�åB�n�ư��ۤv�PGM
--��J�G��ߪ���s���B�j�M�d�򪺥b�|�Z��
--��X�G���X�����a�M��
------------------------------------------------------------
function LUA_YOYO_RangePlayerNotGM( CenterID , Range )
	local RangePlayerTable = SearchRangePlayer( CenterID , Range ) --����ۤv�Z��30���Ҧ����a
	local FilterPlayerTable = {}
	
	for I = 0 , #RangePlayerTable do
		if ReadRoleValue( RangePlayerTable[ I ] , EM_RoleValue_VOC ) ~= 0 
		and RangePlayerTable[ I ] ~= CenterID then
			table.insert( FilterPlayerTable , RangePlayerTable[ I ] )	--�p�G�M�椤�����a���O�ۤv�]�DGM�A�h��g��FilterPlayerTable
		end
	end
	return FilterPlayerTable
end


--K.J. Aris 131204
--�\��G���o�d�򤺪����a�M��A�åB�n�ư��ۤv�PGM
--��J�G��ߪ���s���B�j�M�d�򪺥b�|�Z���B���`�ư�(Boolean)
--��X�G���X�����a�M��
------------------------------------------------------------
function LUA_YOYO_RangePlayerNotGM_EX( CenterID , Range , DeathPreclude )
	local RangePlayerTable = SearchRangePlayer( CenterID , Range ) --����ۤv�Z��30���Ҧ����a
	local FilterPlayerTable = {}
	local _deathPreclude =  DeathPreclude or false;
	
	for I = 0 , #RangePlayerTable do
		if ReadRoleValue( RangePlayerTable[ I ] , EM_RoleValue_VOC ) ~= 0 
		and RangePlayerTable[ I ] ~= CenterID  and ReadRoleValue( RangePlayerTable[ I ] , EM_SetModeType_Fight ) then


			if ( _deathPreclude ) then
				if ( ReadRoleValue( RangePlayerTable[ I ] , EM_RoleValue_IsDead ) ~= 1 ) then
					table.insert( FilterPlayerTable , RangePlayerTable[ I ] );
					--DebugMsg( 0 , 0 , "---Player alive : "..RangePlayerTable[ I ] );
				else
					--DebugMsg( 0 , 0 , "---Player is dead : "..RangePlayerTable[ I ] );
				end
			else
				table.insert( FilterPlayerTable , RangePlayerTable[ I ] );	--�p�G�M�椤�����a���O�ۤv�]�DGM�A�h��g��FilterPlayerTable
			end

			
		end


	end
	return FilterPlayerTable
end