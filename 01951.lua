function bk_clear_sm_monster()   ----------------�ϥΤ���b�}�l��M�Ǫ��ˬd�X��
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )   -------------Ū�X�{�b��room 
	local dbid=0                                                      -------------�]�w�@���ܼƥL�N���O�o�Ӫ����Ʈwid 
	local dbcl=0     												  -------------Ū���o�Ӫ��������{���ҰO�����@�ӭ�
	if RoomID == 0 then 
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_CANTHOME]" , 1 )
	elseif RoomID ~= 0 then 
		local npcm=SetSearchAllNPC(RoomID)----------------------���X�ƶq  -------------��M�o��room �Ҧ�npc�����b�@��table �̭��M��npcm �N��o�Ӹ�Ƹ̭����h�֭�npc 
		for i=1 , npcm, 1 do 											  -------------���h�֪���N���h�֦�
		local npcde = GetSearchResult()									  -------------�v�@���C��npc�s��	
		dbid=ReadRoleValue( npcde,EM_RoleValue_OrgID )                    -------------dcidŪ�����󪺸�ƮwID
		dbcl=GameObjInfo_Int(dbid,"NpcMode")                              -------------abcl�o�Ӫ���npcmode���X�ХN�X
			if CheckBit( dbcl, 21 ) == true then                          -------------Ū�X�Ӫ��N�XCheckBit�h�ˬd�L����m �q�W����U�ӱq0�}�l��21��n�O�p�ǰ��Ǩ����X���ˬd�L�O�_���İ_��
				DelObj(npcde)                                             -------------true�N��İ_�ӧR���o�Ӫ���
			elseif CheckBit( dbcl, 21 ) == false then                     -------------flase�N��S�İ_�Ӥ��R����
				
			end
		end
	end
end
function bk_clear_sm0_207928() ---------------��b�ˬd���������T�w�L�ण��ϥ� 
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )   -------------Ū�X�{�b��room 
	if RoomID == 0 then 
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_CANTHOME]" , 1 )
		return false
	elseif RoomID ~= 0 then 	
		---251,250,102,113,103,104,106,252,114,107,108,126,128,132
		local Zone={251,250,102,113,103,104,106,252,114,107,108,126,128,132}----------�P�_���ƥ���zone (6�H²��)
		local ID=table.getn(Zone)-----------���o��zone��table Ū���L���ƶq
		for i=1 , ID , 1 do  -------------�v�@���X�o�Ӱ}�C�̭�����
			if ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID) == Zone[i] then----------------------------�P�_�C�Ө��X�Ӫ�zone ��
				return true                                                   --------�n�O���@�Ӭ۵��N�N��i�H�ϥγo�Ӫ��~
			end
		end	
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_CANTHOME]" , 1 )	-----------------------------�����ˬd�����O�N��L���A����ϥμ�~
		return false  
	end-----------------------------�^��������ϥ�
end
function bk_clear_sm1_207928() ---------------��b�ˬd���������T�w�L�ण��ϥ�
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )   -------------Ū�X�{�b��room 
	if RoomID == 0 then 
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_CANTHOME]" , 1 )
		return false
	elseif RoomID ~= 0 then 	
	---115,116,118,123,125,124,127,130
		local Zone={115,116,118,123,127,130}----------�P�_���ƥ���zone (���q+12�H²��)
		local ID=table.getn(Zone)-----------���o��zone��table Ū���L���ƶq
		for i=1 , ID , 1 do  -------------�v�@���X�o�Ӱ}�C�̭�����
			if ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID) == Zone[i] then----------------------------�P�_�C�Ө��X�Ӫ�zone ��
				return true                                                   --------�n�O���@�Ӭ۵��N�N��i�H�ϥγo�Ӫ��~
			end
		end	
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_CANTHOME]" , 1 )	-----------------------------�����ˬd�����O�N��L���A����ϥμ�~
		return false                                                        -----------------------------�^��������ϥ�
	end
end
function bk_clear_sm2_207928() ---------------��b�ˬd���������T�w�L�ण��ϥ�
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )   -------------Ū�X�{�b��room .
	if RoomID == 0 then 
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_CANTHOME]" , 1 )
		return false
	elseif RoomID ~= 0 then 	
		---117,119,120,122
		local Zone={117,119,120,122}----------�P�_���ƥ���zone (�x��)
		local ID=table.getn(Zone)-----------���o��zone��table Ū���L���ƶq
		for i=1 , ID , 1 do  -------------�v�@���X�o�Ӱ}�C�̭�����
			if ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID) == Zone[i] then----------------------------�P�_�C�Ө��X�Ӫ�zone ��
				return true                                                   --------�n�O���@�Ӭ۵��N�N��i�H�ϥγo�Ӫ��~
			end
		end	
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_CANTHOME]" , 1 )	-----------------------------�����ˬd�����O�N��L���A����ϥμ�~
		return false                                                        -----------------------------�^��������ϥ�
	end
end