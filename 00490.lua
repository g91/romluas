-- the Light of the Lost ( �g�~���� )

function LuaS_lol()
	SetSpeakDetail( OwnerID() , "�A�ݭn����A�ȩO�H" )

	AddSpeakOption( OwnerID() , TargetID() ,  "����b���̡H�]�e�R�^"     , "LuaS_lol_Augur" , 0 )	-- �W�[�@�ӿﶵ�G
	AddSpeakOption( OwnerID() , TargetID() ,  "������Ȱ��F�S�H�]���ޡ^" , "LuaS_lol_Quest" , 0 )	-- �W�[�@�ӿﶵ�G
	AddSpeakOption( OwnerID() , TargetID() ,  "�ڭn�Ʊ椧���I�]�Ĥ��^"     , "LuaS_lol_Potion" , 0 )	-- �W�[�@�ӿﶵ�G

end

function LuaS_lol_Augur()
	SetSpeakDetail( OwnerID() , "�o�̬O�e�R" )	-- 
end

function LuaS_lol_Quest()
	CloseSpeak( OwnerID() )		-- ������ܵ���

	local Zone1Quest = {}
	Zone1Quest = LuaS_lol_LoadZone1Quest()

	local job = ReadRoleValue( TargetID() , EM_RoleValue_VOC )

	local QuestTotal = table.getn( Zone1Quest )
	for i = 1 , QuestTotal do
		if ( CheckAcceptQuest( OwnerID() , Zone1Quest[i][1] ) == true ) then	-- �ˬd���ȬO�_����
			    if ( Zone1Quest[i][1] == 420711 or Zone1Quest[i][1] == 420716 or Zone1Quest[i][1] == 420724 or Zone1Quest[i][1] == 420725 or Zone1Quest[i][1] == 420726 or Zone1Quest[i][1] == 420624 or Zone1Quest[i][1] == 420625 ) then		-- (���ǡB�Ķ��B�I��)��������
				--Say( OwnerID() , "i = "..i )
				--Say( OwnerID() , "test4" )
				Say( TargetID() , "�A�w�g�����F����|cff00ff00"..Zone1Quest[i][2].."|r�A�A�ݭn���o|cffff00ff"..Zone1Quest[i][5].."|r�浹|cffffff00"..Zone1Quest[i][4].."|r�K" )
			elseif ( Zone1Quest[i][1] == 420712 ) then	-- �a�I����
				--Say( OwnerID() , "i = "..i )
				--Say( OwnerID() , "test6" )
				Say( TargetID() , "�A�w�g�����F����|cff00ff00"..Zone1Quest[i][2].."|r�A�A�i�H��|cffffff00"..Zone1Quest[i][4].."|r�h�ݬݡK" )
			else	-- �@��B��H����
				--Say( OwnerID() , "i = "..i )
				--Say( OwnerID() , "test5" )
				Say( TargetID() , "�A�w�g�����F����|cff00ff00"..Zone1Quest[i][2].."|r�A�A�ݭn�h����|cffffff00"..Zone1Quest[i][4].."|r�K" )
			end
			break;
		else	-- ���Ȥw�����άO������
			    if ( CheckCompleteQuest( OwnerID() , Zone1Quest[i][1] ) == true ) then
			elseif ( job == 1 and ( Zone1Quest[i][1] == 420702 or Zone1Quest[i][1] == 420703 or Zone1Quest[i][1] == 420704 or Zone1Quest[i][1] == 420705 or Zone1Quest[i][1] == 420706 or Zone1Quest[i][1] == 420707 or Zone1Quest[i][1] == 420708 ) ) then	-- �s��¾�~��Ԥh
			elseif ( job == 2 and ( Zone1Quest[i][1] == 420701 or Zone1Quest[i][1] == 420703 or Zone1Quest[i][1] == 420704 or Zone1Quest[i][1] == 420705 or Zone1Quest[i][1] == 420706 or Zone1Quest[i][1] == 420707 or Zone1Quest[i][1] == 420708 ) ) then	-- �s��¾�~��C�L
			elseif ( job == 3 and ( Zone1Quest[i][1] == 420701 or Zone1Quest[i][1] == 420702 or Zone1Quest[i][1] == 420704 or Zone1Quest[i][1] == 420705 or Zone1Quest[i][1] == 420706 or Zone1Quest[i][1] == 420707 or Zone1Quest[i][1] == 420708 ) ) then	-- �s��¾�~��s��
			elseif ( job == 4 and ( Zone1Quest[i][1] == 420701 or Zone1Quest[i][1] == 420702 or Zone1Quest[i][1] == 420703 or Zone1Quest[i][1] == 420705 or Zone1Quest[i][1] == 420706 or Zone1Quest[i][1] == 420707 or Zone1Quest[i][1] == 420708 ) ) then	-- �s��¾�~��k�v
			elseif ( job == 5 and ( Zone1Quest[i][1] == 420701 or Zone1Quest[i][1] == 420702 or Zone1Quest[i][1] == 420703 or Zone1Quest[i][1] == 420704 or Zone1Quest[i][1] == 420706 or Zone1Quest[i][1] == 420707 or Zone1Quest[i][1] == 420708 ) ) then	-- �s��¾�~�ﲽ�q
			elseif ( job == 6 and ( Zone1Quest[i][1] == 420701 or Zone1Quest[i][1] == 420702 or Zone1Quest[i][1] == 420703 or Zone1Quest[i][1] == 420704 or Zone1Quest[i][1] == 420705 or Zone1Quest[i][1] == 420707 or Zone1Quest[i][1] == 420708 ) ) then	-- �s��¾�~���M�h
			elseif ( job == 7 and ( Zone1Quest[i][1] == 420701 or Zone1Quest[i][1] == 420702 or Zone1Quest[i][1] == 420703 or Zone1Quest[i][1] == 420704 or Zone1Quest[i][1] == 420705 or Zone1Quest[i][1] == 420706 or Zone1Quest[i][1] == 420708 ) ) then	-- �s��¾�~�逸�F��
			elseif ( job == 8 and ( Zone1Quest[i][1] == 420701 or Zone1Quest[i][1] == 420702 or Zone1Quest[i][1] == 420703 or Zone1Quest[i][1] == 420704 or Zone1Quest[i][1] == 420705 or Zone1Quest[i][1] == 420706 or Zone1Quest[i][1] == 420707 ) ) then	-- �s��¾�~��w�|��
			else
				    if ( Zone1Quest[i][1] == 420712 ) then	-- �a�I����
					--Say( OwnerID() , "i = "..i )
					--Say( OwnerID() , "test1" )
					Say( TargetID() , "|cffffff00"..Zone1Quest[i][3].."|r���G���I���p�A�A�i�H�յۥh�ݬݡK|cf0f00000"..Zone1Quest[i][2].."|r" )
				else
			--    if ( i == 1 or CheckCompleteQuest( OwnerID() , Zone1Quest[i][1] ) == true ) then
					--Say( OwnerID() , "i = "..i )
					--Say( OwnerID() , "test1" )
					Say( TargetID() , "|cffffff00"..Zone1Quest[i][3].."|r�ݭn��U�A�A�i�H�յۥh�����L�K|cf0f00000"..Zone1Quest[i][2].."|r" )
				end
				break;
			end

			--elseif ( CheckFlag( OwnerID() , 540808 ) == true and ( Zone1Quest[i][1] == 420722 or Zone1Quest[i][1] == 420723 or Zone1Quest[i][1] == 420725 or Zone1Quest[i][1] == 420726 ) ) then	-- ���n���~�G�ݭn�q��
			--elseif ( CheckFlag( OwnerID() , 540809 ) == true and ( Zone1Quest[i][1] == 420721 or Zone1Quest[i][1] == 420723 or Zone1Quest[i][1] == 420724 or Zone1Quest[i][1] == 420726 ) ) then	-- ���n���~�G�ݭn���Y
			--elseif ( CheckFlag( OwnerID() , 540810 ) == true and ( Zone1Quest[i][1] == 420721 or Zone1Quest[i][1] == 420722 or Zone1Quest[i][1] == 420724 or Zone1Quest[i][1] == 420725 ) ) then	-- ���n���~�G�ݭn����
			--else
			--end
		end
	end
end

function LuaS_lol_Potion()
	-- SetSpeakDetail( OwnerID() , "�o�̬O���Ĥ�" )
	CloseSpeak( OwnerID() )		-- ������ܵ���
	OpenShop()			-- ���}�ө�
end

-- ���Ĥ�
function LuaFunc_Shop_lol()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop )
   	SetShop( OwnerID() , 600088 , "Test_Shop_Close" );
end