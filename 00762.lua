function LuaS_111307()

	LoadQuestOption( OwnerID() )	--���J���ȼҪO

	SetSpeakDetail( OwnerID(), GetString("ST_111307_0") )
	AddSpeakOption( OwnerID(), TargetID(), GetString("SC_111307_1") , "LuaS_111307_1" , 0 )	--�ﶵ�A�ڭn�洫�եh���ιέ��֪��ٸ�
	AddSpeakOption( OwnerID(), TargetID(), GetString("SC_111307_2") , "LuaS_111307_2" , 0 )	--�ﶵ�A�ڭn�洫�եh���h���ιέ��֪��ٸ�
	AddSpeakOption( OwnerID(), TargetID(), GetString("SC_111307_3") , "LuaS_111307_3" , 0 )	--�ﶵ�A�ڭn�洫�էڬO�n�H�֪��ٸ�
	AddSpeakOption( OwnerID(), TargetID(), GetString("SC_111307_4") , "LuaS_111307_4" , 0 )	--�ﶵ�A�ڭn�洫�էڬO��n�H�֪��ٸ�

end

function LuaS_111307_1()
	CloseSpeak( OwnerID() )	-- ������ܵ���
	if CountBodyItem( OwnerID() , 202694 ) >= 10 then	-- �R�N����
		if DelBodyItem( OwnerID() , 202694 , 10 ) then
			GiveBodyItem( OwnerID() , 530354 , 1 )	-- �h���ιέ�
		end
	else
		Say( TargetID() , ReplaceString( GetString("SC_111307_33") , "ItemName" , GetString("SC_111307_32") ) )	-- �藍�_�A�A�S��������ItemName�A�L�k�I���o�Ӻٸ��I
	end
end

function LuaS_111307_2()
	CloseSpeak( OwnerID() )	-- ������ܵ���
	if CountBodyItem( OwnerID() , 202694 ) >= 100 then	-- �R�N����
		if DelBodyItem( OwnerID() , 202694 , 100 ) then
			GiveBodyItem( OwnerID() , 530355 , 1 )	-- �h���h���ιέ�
		end
	else
		Say( TargetID() , ReplaceString( GetString("SC_111307_33") , "ItemName" , GetString("SC_111307_32") ) )	-- �藍�_�A�A�S��������ItemName�A�L�k�I���o�Ӻٸ��I
	end
end

function LuaS_111307_3()
	CloseSpeak( OwnerID() )	-- ������ܵ���
	if CountBodyItem( OwnerID() , 202695 ) >= 10 then	-- �n�H�d
		if DelBodyItem( OwnerID() , 202695 , 10 ) then
			GiveBodyItem( OwnerID() , 530356 , 1 )	-- �ڬO�n�H
		end
	else
		Say( TargetID() , ReplaceString( GetString("SC_111307_33") , "ItemName" , GetString("SC_111307_31") ) )	-- �藍�_�A�A�S��������ItemName�A�L�k�I���o�Ӻٸ��I
	end
end

function LuaS_111307_4()
	CloseSpeak( OwnerID() )	-- ������ܵ���
	if CountBodyItem( OwnerID() , 202695 ) >= 100 then	-- �n�H�d
		if DelBodyItem( OwnerID() , 202695 , 100 ) then
			GiveBodyItem( OwnerID() , 530357 , 1 )	-- �ڬO��n�H
		end
	else
		Say( TargetID() , ReplaceString( GetString("SC_111307_33") , "ItemName" , GetString("SC_111307_31") ) )	-- �藍�_�A�A�S��������ItemName�A�L�k�I���o�Ӻٸ��I
	end
end

function LuaS_202691( Option )	-- ���G

	local PlayerID = OwnerID()
	local PackageID = 202691		-- ���G

	if ( Option == "CHECK" ) then
		if CheckFlag( OwnerID(), 541325 ) == false then
			ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_111307_29") , 0 )	-- �A�L�����m�C�i�էڬO�u���̷R�A�֥��ȡI
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		SetFlag( OwnerID(), 541325 , 0 )
		ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_111307_28") , C_SYSTEM )	-- �A�w�g�i�H���s�����C�i�էڬO�u���̷R�A�֥��ȡC
	end

end

function LuaS_202692( Option )	-- �C�i���H§�]

	local PlayerID = OwnerID()
	local PackageID = 202692		-- �C�i���H§�]
	local NeedSpace = 3
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	local Item1 = 202691	-- ���G
	local Item2 = 201445	-- �@���W�D�۸ܻ�

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		if ( Item1 ~= nil  ) then		GiveBodyItem( PlayerID , Item1 , 1 )			end
		if ( Item2 ~= nil  ) then		GiveBodyItem( PlayerID , Item2 , 7 )			end
		AddRoleValue( PlayerID , EM_RoleValue_Money , 70707 )
	end


end


