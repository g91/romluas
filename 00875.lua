function yuyu_Treasure_cobo2_00()
	SetCursorType( OwnerID() , 0)
	SetPlot( OwnerID() , "Touch" , "yuyu_Treasure_cobo2_01" , 50 );
end

function yuyu_Treasure_cobo2_01()                                                      

	local PlayerTeam = LuaFunc_PartyData( OwnerID() )                              --�P�_TargetID() ���Ҧ��ն����������(�ư����b�P�a�Ϫ̦����ư����`��)�A PlayerTeam[0] �Ĥ@����Ƭ������H�ơB�ĤG���H�ᬰ������ơC	



	if( KillID( OwnerID() , TargetID() ) == true ) then 

		local A = 0
		for i = 1 , PlayerTeam[0] , 1 do

		sleep(10)


			if CheckID( PlayerTeam[i] ) == true and ReadRoleValue(  PlayerTeam[i] , EM_RoleValue_IsPlayer ) == 1 and  ReadRoleValue(  PlayerTeam[i] , EM_RoleValue_RoomID ) == ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) then          --�T�w�Ӫ��a�Mowner�P�@�h�B�s�b
			sleep(10)

				local P = 100
				local XX = Rand( P )      
	
				if XX >= 70 and XX <= 100 then   --30%
					GiveBodyItem( PlayerTeam[i] , 200230 , 2 );  --�����q
					GiveBodyItem( PlayerTeam[i] , 200335 , 2 );  --�s�]����
					GiveBodyItem( PlayerTeam[i] , 200853, 1 );  --����
					GiveBodyItem( PlayerTeam[i] , 200807, 2 );  --����Ĥ�
					GiveBodyItem( PlayerTeam[i] , 201046, 2 );  --�]�O�Ĥ�

				elseif XX <= 15 and XX > 10 then  --5%
					GiveBodyItem( PlayerTeam[i] , 200855, 1 );  --�V�X
					GiveBodyItem( PlayerTeam[i] , 200854, 1 );  --�¤�
					GiveBodyItem( PlayerTeam[i] , 200807, 5 );  --����Ĥ�
					GiveBodyItem( PlayerTeam[i] , 201046, 5 );  --�]�O�Ĥ�

				elseif XX <= 10 and XX > 5 then  --5%
					GiveBodyItem( PlayerTeam[i] , 200506 , 1 );  --�ŦB��
					GiveBodyItem( PlayerTeam[i] , 201762 , 1 );  --�h���
					GiveBodyItem( PlayerTeam[i] , 200807, 5 );  --����Ĥ�
					GiveBodyItem( PlayerTeam[i] , 201046, 5 );  --�]�O�Ĥ�

				elseif XX <= 5 and XX > 0 then  --5%
					GiveBodyItem( PlayerTeam[i] , 200507 , 1 );  --���K��
					GiveBodyItem( PlayerTeam[i] , 201724 , 1 );  --����
					GiveBodyItem( PlayerTeam[i] , 200807, 5 );  --����Ĥ�
					GiveBodyItem( PlayerTeam[i] , 201046, 5 );  --�]�O�Ĥ�


				elseif XX < 50 and XX >= 25 then   -- 25%
					GiveBodyItem( PlayerTeam[i] , 201723 , 1 );  --���ɶ�
					GiveBodyItem( PlayerTeam[i] , 201785 , 1 );  --�s�]�����
					GiveBodyItem( PlayerTeam[i] , 200807, 2 );  --����Ĥ�
					GiveBodyItem( PlayerTeam[i] , 201046, 2 );  --�]�O�Ĥ�


				elseif XX < 70 and XX >= 50 then   -- 20%
					GiveBodyItem( PlayerTeam[i] , 200851, 1 );  --�N�o
					GiveBodyItem( PlayerTeam[i] , 201761 , 2 );  --�����
					GiveBodyItem( PlayerTeam[i] , 200807, 2 );  --����Ĥ�
					GiveBodyItem( PlayerTeam[i] , 201046, 2 );  --�]�O�Ĥ�

				elseif XX < 25 and XX > 15 then  --10%

					GiveBodyItem( PlayerTeam[i] , 200852, 1 );  --����
					GiveBodyItem( PlayerTeam[i] , 201800 , 1 );  --���߯��
					GiveBodyItem( PlayerTeam[i] , 200807, 3 );  --����Ĥ�
					GiveBodyItem( PlayerTeam[i] , 201046, 3 );  --�]�O�Ĥ�

				end	
			end	
		end



	end
end