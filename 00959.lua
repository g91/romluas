function LuaS_111509()

	LoadQuestOption( OwnerID() )	--���J���ȼҪO
	AddSpeakOption( OwnerID(), TargetID(), GetString("SC_111509_01") , "Out_South_Gate" , 0 )	-- �ﶵ�A�ڭn�q�L�n��̻�

end

function Out_South_Gate()

	CloseSpeak( OwnerID() )		-- ������ܵ���
	if ReadRoleValue( OwnerID() , EM_RoleValue_LV ) >= 15 then
		SetPos( OwnerID() , -28089 , -370 , -773 , 330 )
	else
		Say( TargetID() , GetString("SC_111509_02") )	-- �藍�_�A�A��¾�~���ũ|����F 20 �šA���F�A���w���A�ڭ̤��|���A�q�L�o�D���C
	end

end

function LuaS_111510()

	LoadQuestOption( OwnerID() )	--���J���ȼҪO
	AddSpeakOption( OwnerID(), TargetID(), GetString("SC_111510_01") , "In_South_Gate" , 0 )	-- �ﶵ�A�ڭn�i�J�n��̻�

end

function In_South_Gate()

	CloseSpeak( OwnerID() )		-- ������ܵ���
	SetPos( OwnerID() , -28263 , -358 , -662 , 160 )
end