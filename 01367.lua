function LuaS_113353()

	local MaxLv = ReadRoleValue( OwnerID() , EM_RoleValue_MaxLv )
	--WriteRoleValue( OwnerID() , EM_RoleValue_MaxLv , 50 )
	--Say( OwnerID() , MaxLv )
	if MaxLv < 55 then
		LoadQuestOption( OwnerID() )  --���J���ȼҪO
		AddSpeakOption( OwnerID() , OwnerID() , "[SC_113353_01]" , "LuaS_MAXLV_UP_1" , 0 )	-- �n���A�Ш�U�ڴ��ɧڪ����Ŭɭ��C
	else
		SetSpeakDetail( OwnerID() , "[SC_113353_02]" )		-- �A�����Ŭɭ��w�g����......�h�a�I�ڲ{�b�٤�����z�|����������u���A�ѵ��ݭn�a�A�ۤv�V�O�h�l�M......
	end
end

function LuaS_MAXLV_UP_1()
	CloseSpeak( OwnerID() )	-- ������ܵ���
	CastSpell( TargetID() , OwnerID() , 493800 )
	ScriptMessage( OwnerID(), OwnerID() , 2 , "[SC_113353_03]"  , C_SYSTEM )	-- [113353]�������O�q�N�A�����Ŭɭ����ɦ� LV55
	ScriptMessage( OwnerID(), OwnerID() , 0 , "[SC_113353_03]"  , 0 )
	WriteRoleValue( OwnerID() , EM_RoleValue_MaxLv , 55 )
	return true
end