--function setNewRoleJobFlag()	-- �s��¾�~���檺���n���~

--	if ( CheckCompleteQuest( TargetID() , 420701 ) == false and CheckCompleteQuest( TargetID() , 420702 ) == false and CheckCompleteQuest( TargetID() , 420703 ) == false and CheckCompleteQuest( TargetID() , 420704 ) == false and CheckCompleteQuest( TargetID() , 420705 ) == false and CheckCompleteQuest( TargetID() , 420706 ) == false and CheckCompleteQuest( TargetID() , 420707 ) == false and CheckCompleteQuest( TargetID() , 420708 ) == false ) then
--		local job = ReadRoleValue( TargetID() , EM_RoleValue_VOC )
	
--		    if ( job == 0 ) then
--			-- return "�޲z��"
--		elseif  ( job == 1 ) then
--			SetFlag( TargetID() , 540811 , 1 )	-- �s��¾�~��Ԥh
--		elseif  ( job == 2 ) then
--			SetFlag( TargetID() , 540812 , 1 )	-- �s��¾�~��C�L
--		elseif  ( job == 3 ) then
--			SetFlag( TargetID() , 540813 , 1 )	-- �s��¾�~��s��
--		elseif  ( job == 4 ) then
--			SetFlag( TargetID() , 540814 , 1 )	-- �s��¾�~��k�v
--		elseif  ( job == 5 ) then
--			SetFlag( TargetID() , 540815 , 1 )	-- �s��¾�~�ﲽ�q
--		elseif  ( job == 6 ) then
--			SetFlag( TargetID() , 540816 , 1 )	-- �s��¾�~���M�h
--		elseif  ( job == 7 ) then
--			SetFlag( TargetID() , 540817 , 1 )	-- �s��¾�~�逸�F��
--		elseif  ( job == 8 ) then
--			SetFlag( TargetID() , 540818 , 1 )	-- �s��¾�~��w�|��
--		end
--		return true
--	end
--end
--function RandomsLivingFlag()	-- �üƲ��ͤ@�ӥͲ��ɮv���Ȫ����n���~
--	local RND = Rand( 9 ) + 1	-- ���� 1~10 ���ü�
--	    if ( RND > 0 and RND <= 4 ) then
--		SetFlag( TargetID() , 540808 , 1 )	-- �ݭn�q��( ���v 2/5 )
--	elseif ( RND > 4 and RND <= 8 ) then
--		SetFlag( TargetID() , 540809 , 1 )	-- �ݭn���Y( ���v 2/5 )
--	elseif ( RND > 8 and RND <= 10 ) then
--		SetFlag( TargetID() , 540810 , 1 )	-- �ݭn�į�( ���v 1/5 )
--	end
--end

--function LuaS_110583()	-- �}���E���i�ܪO
--	LoadQuestOption( OwnerID() )	--���J���ȼҪO
--	if ( CheckAcceptQuest( OwnerID() , 420712 ) == true ) then	-- ���ȡG�e�U�i�K
--	elseif ( CheckAcceptQuest( OwnerID() , 420713 ) == true or CheckCompleteQuest( OwnerID() , 420713 ) == true ) then	-- ���ȡG�R���x�Z
--		if ( CheckFlag( OwnerID() , 540804 ) == true ) then	-- ���n���~�G�e�U���Ȫ��e
--		else
--			SetFlag( OwnerID() , 540804 , 1 )
--		end
--	end
--end

--function AlreadyGiveWeapon()	-- �����Z���������
--	if ( CheckFlag( TargetID() , 540805 ) == true ) then	-- ���n���~�G��Z���ӤH������Z��
--	else
--		SetFlag( TargetID() , 540805 , 1 )
--	end
--	if ( CheckFlag( TargetID() , 540806 ) == true ) then	-- ���n���~�G�w������t����}�Z��
--	else
--		SetFlag( TargetID() , 540806 , 1 )
--	end
--end

function LuaS_110658()	-- �Z���ӤH����
	--if ( CheckFlag( OwnerID() , 540805 ) == true ) then	-- ���n���~�G��Z���ӤH������Z��
		LoadQuestOption( OwnerID() )	--���J���ȼҪO
		AddSpeakOption( OwnerID() , TargetID() , GetString("SO_OPENSHOP") , "LuaS_110658_OpenShop" , 0 )	-- �W�[�@�ӿﶵ�G�}�Ұө�
	--elseif (CountBodyItem( OwnerID() , 201164 ) >= 1 ) then
	--	SetSpeakDetail( OwnerID() , GetString("ST_NEW_02") )	-- �p�y�����ЧA�L�Ӫ��ܡH\n\n�L�e�U�����C��s��_�I�̷ǳƤ@���}���Z���A���L�O��A�b��Z���浹�A���e�A�n���n���ѦҬݬݧڽ檺�Z���ڡH�ڳo�ӪZ���ӤH�檺�Z���i�O�O�ҫK�y����I
	--	AddSpeakOption( OwnerID() , TargetID() ,  GetString("SO_110658_YES") , "LuaS_110658_Yes" , 0 )	-- �W�[�@�ӿﶵ�G�n�A�ڷQ�ѦҬݬ�
	--	AddSpeakOption( OwnerID() , TargetID() ,  GetString("SO_110658_NO") ,  "LuaS_110658_No"  , 0 )	-- �W�[�@�ӿﶵ�G���F�A�ڷQ���ֻ���ڤ��t�쪺�Z��
	--else
	--	SetSpeakDetail( OwnerID() , GetString("ST_NEW_03") )	-- �A�O�s��_�I�̰ڡA�Q����ʶR�Z���ܡH\n\n���L�ڷQ�b�o���e�A�A���ӥ��h�����}�������p�y�����~�O�C
	--end

end
--function LuaS_110658_Yes()	-- �Z���ӤH����
	--SetFlag( OwnerID() , 540805 , 1 )		-- ���n���~�G��Z���ӤH������Z��
	--local RND = Rand( 99 ) + 1	-- ���� 1~100 ���ü�
	--    if ( RND > 0 and RND <= 95 ) then
	--elseif ( RND > 95 and RND <= 100 ) then
	--	Say( TargetID() , GetString("ST_NEW_04") )	-- �ѦҬݬݡA�ڳo�ӪZ���ӤH�檺�Z���i�O�O�ҫK�y����I( ���v 1/210 )
	--end
	--CloseSpeak( OwnerID() )			-- ������ܵ���
	--OpenShop()				-- ���}�ө�
--end
--function LuaS_110658_No()	-- �Z���ӤH����
--	SetFlag( OwnerID() , 540805, 1 )	-- ���n���~�G��Z���ӤH������Z��
--	SetSpeakDetail( OwnerID() , GetString("ST_NEW_05") )	-- �u�O�i���K\n\n�n�a�A�S���Y�A���ڷǳƤ@�U���t���A���Z���A�A���@�U�A�ӧ�ڡC
--end
function LuaS_110658_OpenShop()	-- �Z���ӤH�����@��}�ө�
	CloseSpeak( OwnerID() )			-- ������ܵ���
	OpenShop()				-- ���}�ө�
end

function LuaS_110482()	-- �p�y
	LoadQuestOption( OwnerID() )	--���J���ȼҪO

--	if ( CheckCompleteQuest( OwnerID() , 420701 ) == false and CheckCompleteQuest( OwnerID() , 420702 ) == false and CheckCompleteQuest( OwnerID() , 420703 ) == false and CheckCompleteQuest( OwnerID() , 420704 ) == false and CheckCompleteQuest( OwnerID() , 420705 ) == false and CheckCompleteQuest( OwnerID() , 420706 ) == false and CheckCompleteQuest( OwnerID() , 420707 ) == false and CheckCompleteQuest( OwnerID() , 420708 ) == false ) then
--		local job = ReadRoleValue( OwnerID() , EM_RoleValue_VOC )	-- �p�G������A�@�}�l�N�ӸѪ���
	
--		    if ( job == 0 ) then
--			-- return "�޲z��"
--		elseif  ( job == 1 ) then
--			SetFlag( OwnerID() , 540811 , 1 )	-- �s��¾�~��Ԥh
--		elseif  ( job == 2 ) then
--			SetFlag( OwnerID() , 540812 , 1 )	-- �s��¾�~��C�L
--		elseif  ( job == 3 ) then
--			SetFlag( OwnerID() , 540813 , 1 )	-- �s��¾�~��s��
--		elseif  ( job == 4 ) then
--			SetFlag( OwnerID() , 540814 , 1 )	-- �s��¾�~��k�v
--		elseif  ( job == 5 ) then
--			SetFlag( OwnerID() , 540815 , 1 )	-- �s��¾�~�ﲽ�q
--		elseif  ( job == 6 ) then
--			SetFlag( OwnerID() , 540816 , 1 )	-- �s��¾�~���M�h
--		elseif  ( job == 7 ) then
--			SetFlag( OwnerID() , 540817 , 1 )	-- �s��¾�~�逸�F��
--		elseif  ( job == 8 ) then
--			SetFlag( OwnerID() , 540818 , 1 )	-- �s��¾�~��w�|��
--		end
--	end

end

function LuaS_110489()	-- �Ĥ��ӤH�ܤB
--	if ( CheckAcceptQuest( OwnerID() , 420714 ) == true ) then

		LoadQuestOption( OwnerID() )	--���J���ȼҪO
-- and CountBodyItem( OwnerID() , 200595 ) < 1 ) then	-- ���ȡG��v�y�h�A���~�G�ά��Ĥ�
--		SetSpeakDetail( OwnerID() , "�j�ŦѧB���Ĥ��ڡH���ڡA�ڤw�g���L�R�^�ӤF�A�u�O�@���ѤF�e�L�h���L�A�A�i�H���ڰe�L�h���L�ܡH" )
--		AddSpeakOption( OwnerID() , TargetID() , GetString("SO_110489_YES") , "LuaS_110489_Yes" , 0 )	-- �W�[�@�ӿﶵ�G�n���A�ڥi�H�N�Ĥ��L�h���j�ŦѧB
--	else
--		SetSpeakDetail( OwnerID() , GetString("ST_NEW_06") )	-- ��Aı�o�ͩR����¯١A�A�̦n�ܭӤ@�~����Ĥ��I\n\n��Aı�o�k�N�L�k�I�i�A�A�̦n�ܭӤ@�~�]�O�Ĥ��I\n\nı�o�ڪ��ܦ��D�z�ܡH�֨ӶR�ӴX�~�Ĥ��H����a�a�I
		AddSpeakOption( OwnerID() , TargetID() , GetString("SO_OPENSHOP") , "LuaS_110489_OpenShop" , 0 )	-- �W�[�@�ӿﶵ�G�}�Ұө�
--	end
end

