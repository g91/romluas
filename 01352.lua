
function LuaS_G5_Weapon_CHECK()
	if CheckFlag( OwnerID() , 543200 ) == true then
		return true
	else
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_G5WEAPON_01]"  , C_DEFAULT )	-- �e�������T���G�A�å���o�{�P�A���æb�o��Z���̪��F��ڵ��A���I��I
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_G5WEAPON_01]" , 0 )		-- �A�å���o�{�P�A���æb�o��Z���̪��F��ڵ��A���I��I
		return false
	end
end

function LuaS_205810_CHECK()
	return true
end

function LuaS_205810_DO()
	CastSpell( OwnerID() , OwnerID() , 493800 )
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_G5WEAPON_02]"  , C_SYSTEM )	-- �e�������T���G�A��o�ᮦ�������{�P�A����A�i�H�o��Z���I��X�ᮦ�����I
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_G5WEAPON_02]" , 0 )		-- �A��o�ᮦ�������{�P�A����A�i�H�o��Z���I��X�ᮦ�����I
	SetFlag( OwnerID() , 543200 , 1 ) 
end

function LuaI_G52_SHOP()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop )
	SetShop( OwnerID() , 600163 , "Test_Shop_Close" )	-- ��D�N��
end
--SC_G5WEAPON_03�A�������i�H�P����̭����@���D�ʪ��F��b�b����...
function LuaS_113397()	-- ��D�N��
	if
	CountItem( OwnerID() , 211943 ) >= 1 or
	CountItem( OwnerID() , 211944 ) >= 1 or
	CountItem( OwnerID() , 211945 ) >= 1 or
	CountItem( OwnerID() , 211946 ) >= 1 or
	CountItem( OwnerID() , 211947 ) >= 1 or
	CountItem( OwnerID() , 211948 ) >= 1 or
	CountItem( OwnerID() , 211949 ) >= 1 or
	CountItem( OwnerID() , 211950 ) >= 1 or
	CountItem( OwnerID() , 211951 ) >= 1 or
	CountItem( OwnerID() , 211952 ) >= 1 or
	CountItem( OwnerID() , 211953 ) >= 1 or
	CountItem( OwnerID() , 211954 ) >= 1
	then
		SetFlag( OwnerID() , 543202 , 1 )
	end

	LoadQuestOption( OwnerID() )	--���J���ȼҪO
	if CheckFlag( OwnerID() , 543202 ) == true then
		if CheckCompleteQuest( OwnerID() , 422660 ) == true then
			AddSpeakOption( OwnerID() , TargetID( ) , "[SC_G5WEAPON_04]" , "LuaS_G52_OpenShop", 0 )	-- ����ᮦ�������t��
		end
	end
end

function LuaS_G52_OpenShop()	-- ��Z�G���t��
	CloseSpeak( OwnerID() )		-- ������ܵ���
	OpenShop()			-- ���}�ө�
end