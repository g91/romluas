function LuaSpeak_110377()

	-- �]�w��ܤ��e
		SetSpeakDetail( OwnerID(), "SD_110377_1"   );--#�A�n�I�A�Q�ǲ߫��q�ܡH
							     --#���q�i�H���ȿ����
							     --#�A�ݧڡA���O�@�Ʀ������ˤl�ܡH	
	
	-- �[�J��ܿﶵ
		-- �[�J�ǲ߱��q
		local MaxLV = ReadRoleValue( OwnerID(), EM_RoleValue_SkillMax_Mining );
		
		if( MaxLV == 0 ) then

			AddSpeakOption( OwnerID(), TargetID( ), "SO_110377_1" , "LuaSO_110377_1", 0 );--#�бЧګ��q
			AddSpeakOption( OwnerID(), TargetID( ), "SO_110377_4" , "LuaSO_110377_LEAVE", 0 );--#�ڦA�Ҽ{�ݬ�
		else
			AddSpeakOption( OwnerID(), TargetID( ), "SO_110377_6" , "LuaSO_110377_LEAVE", 0 );--#�ڦ��N�|�F
		
		end

		


end





--------------------------------------------------------------------------------------------------------------------------
function LuaSO_110377_1()

	-- �ǲ߱��q

	SetSpeakDetail( OwnerID(), "SD_110377_2"   );--#�Q�n���q�A���F�n���}�n����O�~�A�٭n�����ȦY�W���믫�C�A�ǳƦn�F�ܡH
	AddSpeakOption( OwnerID(), TargetID( ), "SO_110377_2", 	"LuaSO_110377_2", 	0 );	-- �O --#�ڷǳƦn�F�I
	AddSpeakOption( OwnerID(), TargetID( ), "SO_110377_3", 	"LuaSO_110377_LEAVE", 	0 );	-- �_ --#���ڤ��ǤF�I

end
--------------------------------------------------------------------------------------------------------------------------
function LuaSO_110377_2()
	SetSpeakDetail( OwnerID(), "SD_110377_3"   );--#�A�{�b�i�H���q�F�I
						     --#�b�ګ�観�ӧ|�D�A�̭����Ǫ�Ū��q���A�A�i�H�h�����ݡC
						     --#���O�O�o���˳ƤW�ڵ��A�����q�u��C
	SetScriptFlag( OwnerID(), 540069, 1 );	-- ������ū��q����
	GiveBodyItem ( OwnerID(), 210371, 1 ) -- �������q�u��  Ex: GiveBodyItem( OwnerID(), 210368, 1 );
	AddSpeakOption( OwnerID(), TargetID( ), "SO_110377_5", 	"LuaSO_110377_LEAVE", 	0 );	--#���§A�I�A���I
end
--------------------------------------------------------------------------------------------------------------------------


function LuaSO_110377_LEAVE()
	CloseSpeak( OwnerID() );
end
--------------------------------------------------------------------------------------------------------------------------