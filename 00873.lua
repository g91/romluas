function yuyu_Treasure_cobo_00()

	SetPlot( OwnerID() , "Touch" , "yuyu_Treasure_cobo_01" , 50 );
end

function yuyu_Treasure_cobo_01()                                                      

	local PlayerTeam = LuaFunc_PartyData( OwnerID() )                              --�P�_TargetID() ���Ҧ��ն����������(�ư����b�P�a�Ϫ̦����ư����`��)�A PlayerTeam[0] �Ĥ@����Ƭ������H�ơB�ĤG���H�ᬰ������ơC	



--	if( KillID( OwnerID() , TargetID() ) == true ) then        --�}�_�cĲ�I�_�c�_�c�N�����a���o�_��

		ScriptMessage(OwnerID(), 0 , 1 , GetString("SC_YU_111301_0") , C_SYSTEM )	-- �}�c�T���C
  
		local NN = LuaFunc_SearchNPCbyOrgID(OwnerID(), 101028, 200 , 1)   --�M��id

		local BOX = LuaFunc_SearchNPCbyOrgID(OwnerID(), 111301, 200 , 1)   --�M��id
		local RoomID = ReadRoleValue( NN[0] , EM_RoleValue_RoomID )  --�P�_�Ҧb���a�h
		Hide( BOX[0] )

		local A = 0
		for i = 1 , PlayerTeam[0] , 1 do


			if 	CheckID( PlayerTeam[i] ) == true and 
				ReadRoleValue(  PlayerTeam[i] , EM_RoleValue_IsPlayer ) == 1 and
				ReadRoleValue(  PlayerTeam[i] , EM_RoleValue_RoomID ) == ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) then          --�T�w�Ӫ��a�Mowner�P�@�h�B�s�b


				CastSpelllv( NN[0] , OwnerID() , 490642, 80)                                                              --�I��k�N&LV(�I�k��,��Hid,�k�Nid,LV)  
				sleep(10)

				local P = 100
				local XX = Rand( P )      
	
				if XX >= 70 and XX <= 100 then   --30%
					GiveBodyItem( PlayerTeam[i] , 203008 , 2 );   --���O���ޥ�
					GiveBodyItem( PlayerTeam[i] , 203010 , 2 );   --�}�l���w�f�k�T
					GiveBodyItem( PlayerTeam[i] , 203011 , 2 );  --�ݯ}�������L��


				elseif XX <= 10 then  --10%
					GiveBodyItem( PlayerTeam[i] , 203013 , 1 );  --�w�f���a���H��
					GiveBodyItem( PlayerTeam[i] , 203016 , 1 );  --�B�ժ��I�]


				elseif XX < 19 and XX > 10 then   -- 10%
					GiveBodyItem( PlayerTeam[i] , 203014 , 1 );  --�������W���_��
					GiveBodyItem( PlayerTeam[i] , 203015 , 1 );  --�t���̪��C�`


				elseif XX < 50 and XX >= 30 then   -- 20%
					GiveBodyItem( PlayerTeam[i] , 203009 , 2 );  --�l�a���w�f�ԩ�
					GiveBodyItem( PlayerTeam[i] , 203012 , 2 );   --�l������o�s��
					GiveBodyItem( PlayerTeam[i] , 203010 , 1 );   --�}�l���w�f�k�T

				elseif XX < 70 and XX >= 50 then   -- 20%
					GiveBodyItem( PlayerTeam[i] , 203008 , 2 );   --���O���ޥ�
					GiveBodyItem( PlayerTeam[i] , 203009 , 2 );  --�l�a���w�f�ԩ�

				elseif XX < 30 and XX >= 19 then  --10%
					GiveBodyItem( PlayerTeam[i] , 203016 , 1 );  --�B�ժ��I�]
					GiveBodyItem( PlayerTeam[i] , 203015 , 1 );  --�t���̪��C�`
				end	
			end	
		end



--	end


		sleep(10)		

		local GOBOLIN  = CreateObjByFlag( 100634, 780183, 0 , 1 );            --���ͩ�     
		local NN = LuaFunc_SearchNPCbyOrgID(OwnerID(), 101028, 200 , 1)   --�M��id           	        	
		local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )  --�P�_�Ҧb���a�h
--	Say( OwnerID(), GetString("YU_OWNER") )    
--	 Say( TargetID() , GetString("YU_TARGET") )  

		sleep(10)
		AddToPartition( GOBOLIN  , RoomID )       --�ƥ��n�μ@�����ͩǥ����n�P�@�Ӧa�h�A�]���n�ΥH�s�����Ϊ���ӧP�_���ͪ��ǬO�_�P�@�a�h�ӥ[�i�R�x
		BeginPlot(GOBOLIN, "LuaYuyu_gobolin_matrix" , 0 )        --����X�ͪ��Ǳ��}��
		local GOBOLIN = LuaFunc_SearchNPCbyOrgID(OwnerID(), 100634, 200 , 1) 
		 Say( GOBOLIN[0] , GetString("SC_YUYU_GOBOLIN_0") )   
	sleep(36000)
			Show( BOX[0],0 )

end