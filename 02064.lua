function sasa_clear_monster()											-------------�ϥΤ���b�}�l��M�Ǫ��ˬd�X��
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )		-------------Ū�X�{�b��room 
	local dbid=0                                                      	-------------�]�w�@���ܼƥL�N���O�o�Ӫ����Ʈwid 
	local dbcl=0     												  	-------------Ū���o�Ӫ��������{���ҰO�����@�ӭ�
	if RoomID == 0 then 
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_CANTHOME]" , 1 )
	elseif RoomID ~= 0 then 
		local npcm=SetSearchAllNPC(RoomID)----------------------���X�ƶq  -------------��M�o��room�Ҧ�npc�����b�@��table�̡A�M��npcm�N��o�Ӹ�Ƹ̭����h�֭�npc 
		for i=1 , npcm, 1 do 											  -------------���h�֪���N���h�֦�
		local npcde = GetSearchResult()									  -------------�v�@���C��npc�s��	
		dbid=ReadRoleValue( npcde,EM_RoleValue_OrgID )                    -------------dbidŪ�����󪺸�ƮwID
		dbcl=GameObjInfo_Int(dbid,"NpcMode")                              -------------dbcl�o�Ӫ���npcmode���X�ХN�X
			if CheckBit( dbcl, 21 ) == true then                          -------------Ū�X�Ӫ��N�XCheckBit�h�ˬd�L����m �q�W����U�ӱq0�}�l��21��n�O�p�ǰ��Ǩ����X���ˬd�L�O�_���İ_��
				DelObj(npcde)                                             -------------true�N��İ_�ӧR���o�Ӫ���
			elseif CheckBit( dbcl, 21 ) == false then                     -------------flase�N��S�İ_�Ӥ��R����
				
			end
		end
	end
end
function sasa_clear_monster_208220() 									-------------��b�ˬd���������T�w�L�ण��ϥ� 
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )   	-------------Ū�X�{�b��room 
	if RoomID == 0 then 
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_CANTHOME]" , 1 )
		return false
	elseif RoomID ~= 0 then 	
		---�d�U�J(²),��Ԥ�(²),�ĺ��h��(²),�C�^��(²),�ë�(²),�w�ǩ_(²),�ʻk��(²),������(²)
		local Zone={ 135,138,140,143,145,148,150,153 }					-----------�P�_���ƥ�zone (6�H²��)
		local ID=table.getn(Zone)										-----------���o��zone��table Ū���L���ƶq
		for i=1 , ID , 1 do												-----------�v�@���X�o�Ӱ}�C�̭�����
			if ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID) == Zone[i] then-----�P�_�C�Ө��X�Ӫ�zone ��
				return true                                             -----------�n�O���@�Ӭ۵��N�N��i�H�ϥγo�Ӫ��~
			end
		end
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_CANTHOME]" , 1 )-----------�����ˬd�����O�N��L���A����ϥμ�~
		return false													-----------�^��������ϥ�
	end
end
function sasa_clear_monster_208221()									-----------��b�ˬd���������T�w�L�ण��ϥ�
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )  	-----------Ū�X�{�b��room 
	if RoomID == 0 then 
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_CANTHOME]" , 1 )
		return false
	elseif RoomID ~= 0 then 	
		---�d�U�J����,��Ԥҥj��,�ĺ��h��,�C�^��,�ë�k�},�w�ǩ_,�ʻk��,������
		local Zone={ 134,137,139,142,144,147,149,151 }					-----------�P�_���ƥ���zone (���q6�H+12�H²��)
		local ID=table.getn(Zone)										-----------���o��zone��table Ū���L���ƶq
		for i=1 , ID , 1 do												-----------�v�@���X�o�Ӱ}�C�̭�����
			if ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID) == Zone[i] then-----�P�_�C�Ө��X�Ӫ�zone ��
				return true                                             -----------�n�O���@�Ӭ۵��N�N��i�H�ϥγo�Ӫ��~
			end
		end	
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_CANTHOME]" , 1 )-----------�����ˬd�����O�N��L���A����ϥμ�~
		return false                                                    -----------�^��������ϥ�
	end
end
function sasa_clear_monster_208222()									------------��b�ˬd���������T�w�L�ण��ϥ�
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )   	------------Ū�X�{�b��room .
	if RoomID == 0 then 
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_CANTHOME]" , 1 )
		return false
	elseif RoomID ~= 0 then 	
		---��Ԥҥj��(�x),�C�^��(�x),�w�ǩ_(�x),������(�x)
		local Zone={ 136,141,146,152 }									------------�P�_���ƥ���zone (�x��+12�H���q)
		local ID=table.getn(Zone)										------------���o��zone��table Ū���L���ƶq
		for i=1 , ID , 1 do												------------�v�@���X�o�Ӱ}�C�̭�����
			if ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID) == Zone[i] then------�P�_�C�Ө��X�Ӫ�zone ��
				return true                                             ------------�n�O���@�Ӭ۵��N�N��i�H�ϥγo�Ӫ��~
			end
		end	
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_CANTHOME]" , 1 )------------�����ˬd�����O�N��L���A����ϥμ�~
		return false                                                    ------------�^��������ϥ�
	end
end