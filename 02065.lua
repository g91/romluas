function sasa_clear_monster_newzone()									-------------�ϥΤ���b�}�l��M�Ǫ��ˬd�X��
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
function sasa_clear_monster_208223() 									-------------��b�ˬd���������T�w�L�ण��ϥ� 
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )   	-------------Ū�X�{�b��room 
	if RoomID == 0 then 
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_CANTHOME]" , 1 )
		return false
	elseif RoomID ~= 0 then 	
		---���T(²),������(²),�_�y(²),�d�F�R���a��(²)
		local Zone={ 159,162 ,165, 168  }					-----------�P�_���ƥ�zone (²��6�H)
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
function sasa_clear_monster_208224()									-----------��b�ˬd���������T�w�L�ण��ϥ�
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )  	-----------Ū�X�{�b��room 
	if RoomID == 0 then 
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_CANTHOME]" , 1 )
		return false
	elseif RoomID ~= 0 then 	
		---���T,������,�_�y,�d�F�R���a��
		local Zone={ 158,161,164,167 }					-----------�P�_���ƥ���zone (���q6�H)
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
function sasa_clear_monster_208225()									------------��b�ˬd���������T�w�L�ण��ϥ�
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )   	------------Ū�X�{�b��room .
	if RoomID == 0 then 
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_CANTHOME]" , 1 )
		return false
	elseif RoomID ~= 0 then 	
		---���T(�x),������(�x),�_�y(�x),�d�F�R���a��(�x)
		local Zone={ 157,160 , 163, 166 }												------------�P�_���ƥ���zone (�x��12�H)
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