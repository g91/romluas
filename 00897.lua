function LuaS_111367_MagicBoxEx()		--�]���_����q�I��

	--LoadQuestOption( OwnerID() )	--���J���ȼҪO
	SetSpeakDetail( OwnerID() , GetString("SC_MAGICBOXEX_07") )
	
--	AddSpeakOption( OwnerID(), TargetID(), GetString("SC_MAGICBOXEX_02") , "LuaS_111367_MagicBoxEx_1" , 0 )	-- �ﶵ�A�H 3 �T�N���I�� 1 �I�]���_����q
--	AddSpeakOption( OwnerID(), TargetID(), GetString("SC_MAGICBOXEX_03") , "LuaS_111367_MagicBoxEx_2" , 0 )	-- �ﶵ�A�H 15 �T�N���I�� 5 �I�]���_����q
--	AddSpeakOption( OwnerID(), TargetID(), GetString("SC_MAGICBOXEX_04") , "LuaS_111367_MagicBoxEx_3" , 0 )	-- �ﶵ�A�H 30 �T�N���I�� 10 �I�]���_����q
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_THEMONEY_SHOP]" , "LuaS_ComShop_1", 0 ); 

end

function LuaS_111367_MagicBoxEx_1()
	CloseSpeak( OwnerID() )

	if DelBodyItem( OwnerID() , 203038 , 3 ) then		-- �����ťN��
		local MessageString = ReplaceString( GetString("SC_MAGICBOXEX_05") , "Point" , "1" )	
		ScriptMessage( OwnerID(), OwnerID(), 1, MessageString , C_SYSTEM )	-- �A���]���_����q�W�[�F Point �I�I�I 
		AddRoleValue( OwnerID() , EM_RoleValue_BoxEnergy , 1 )
	else
		ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_MAGICBOXEX_06") , C_DEFAULT )	-- �L�k�I���A�A�S�������������ťN���I�I
	end
end

function LuaS_111367_MagicBoxEx_2()
	CloseSpeak( OwnerID() )

	if DelBodyItem( OwnerID() , 203038 , 15 ) then		-- �����ťN��
		local MessageString = ReplaceString( GetString("SC_MAGICBOXEX_05") , "Point" , "5" )	
		ScriptMessage( OwnerID(), OwnerID(), 1, MessageString , C_SYSTEM )	-- �A���]���_����q�W�[�F Point �I�I�I 
		AddRoleValue( OwnerID() , EM_RoleValue_BoxEnergy , 5 )
	else
		ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_MAGICBOXEX_06") , C_DEFAULT )	-- �L�k�I���A�A�S�������������ťN���I�I
	end
end

function LuaS_111367_MagicBoxEx_3()
	CloseSpeak( OwnerID() )

	if DelBodyItem( OwnerID() , 203038 , 30 ) then		-- �����ťN��
		local MessageString = ReplaceString( GetString("SC_MAGICBOXEX_05") , "Point" , "10" )	
		ScriptMessage( OwnerID(), OwnerID(), 1, MessageString , C_SYSTEM )	-- �A���]���_����q�W�[�F Point �I�I�I 
		AddRoleValue( OwnerID() , EM_RoleValue_BoxEnergy , 10 )
	else
		ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_MAGICBOXEX_06") , C_DEFAULT )	-- �L�k�I���A�A�S�������������ťN���I�I
	end
end