

function LuaSpeak_110378()

	-- �]�w��ܤ��e
		SetSpeakDetail( OwnerID(), "SD_110378_1"   );--#���Ѫ��Ѯ�u���ܾA�X���K�O��
							     --#�A�Q�ǥ��K�ܡH
							     --#���ڭ̤@�_���x�C�K�������a�I	
	
	-- �[�J��ܿﶵ
		-- �[�J�ǲ߱��q
		local MaxLV = ReadRoleValue( OwnerID(), EM_RoleValue_SkillMax_BlackSmith );
		
		if( MaxLV == 0 ) then
			AddSpeakOption( OwnerID(), TargetID( ), "SO_110378_1" , "LuaSO_110378_1", 0 );--#�бЧڥ��K
		else
			AddSpeakOption( OwnerID(), TargetID( ), "SO_110378_6" , "LuaSO_110378_LEAVE", 0 );--#�ڦ��N�|�F

		end

		AddSpeakOption( OwnerID(), TargetID( ), "SO_110378_4" , "LuaSO_110378_LEAVE", 0 );--#�ڦA�Ҽ{�ݬ�


end





--------------------------------------------------------------------------------------------------------------------------
function LuaSO_110378_1()

	-- �ǲߥ��K

	SetSpeakDetail( OwnerID(), "SD_110378_2"   );--#���K�u�O���q���ߪ����ʡA�O�o�N�Ӿa���K�o�F�F�A�n�n�n�^���ڳo�Ӯ��H�C�A�ǳƦn�ǥ��K�F�ܡH
	AddSpeakOption( OwnerID(), TargetID( ), "SO_110378_2", 	"LuaSO_110378_2", 	0 );	-- �O --#�ڷǳƦn�F�I
	AddSpeakOption( OwnerID(), TargetID( ), "SO_110378_3", 	"LuaSO_110378_LEAVE", 	0 );	-- �_ --#���ڤ��ǤF�I

end
--------------------------------------------------------------------------------------------------------------------------
function LuaSO_110378_2()
	SetSpeakDetail( OwnerID(), "SD_110378_3"   );--#�A�{�b�i�H���K�F�I
						     --#�ڥ��L�����A�@��ӥ��K���覡�A����n�Ǩ�L�����K�s�y�A��ڶR�ޯ�ѴN�i�H�F�C
						     --#���K�����Ƥj�h�n�a���q�����A��M�A�]�i�H�Q��k�ʶR�C
	SetScriptFlag( OwnerID(), 540068, 1 );	-- �������K��ߥ͸��
	GiveBodyItem ( OwnerID(), 540085, 1 ) -- �����ޯ�G�P��
	GiveBodyItem ( OwnerID(), 540092, 1 ) -- �����ޯ�G���C
	GiveBodyItem ( OwnerID(), 540106, 1 ) -- �����ޯ�G�K��
	GiveBodyItem ( OwnerID(), 540110, 1 ) -- �����ޯ�G�۶�
	AddSpeakOption( OwnerID(), TargetID( ), "SO_110378_5", 	"LuaSO_110378_LEAVE", 	0 );	--#���§A�I�A���I
end
--------------------------------------------------------------------------------------------------------------------------


function LuaSO_110378_LEAVE()
	CloseSpeak( OwnerID() );
end
--------------------------------------------------------------------------------------------------------------------------