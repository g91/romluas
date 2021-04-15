function LuaS_110609()	-- ù�K

	local hour = GetSystime(1)
	--local min = GetSystime(2)

	if CheckFlag( OwnerID() , 541325 ) == true then
		SetSpeakDetail( OwnerID(), GetString("SC_111307_26") )
	elseif  ( hour >= 18 and hour < 20 ) and ( CheckFlag( OwnerID() , 541324 ) == false ) then
		LoadQuestOption( OwnerID() )	--���J���ȼҪO
		--SetSpeakDetail( OwnerID(), GetString("SC_111307_9") )
		-- ���e�]����P�����x�b�A�ڨS���n�n���ñ������A�����o�D�`���ˤߡC
		-- �{�b�ڲש���M�F�ۤv���߷N�A���F���^�ڭ̤������P���A�ڭq�ʤF�@�T�ǻ����R�N���٭n�e�������C
		-- �ݮɶ��]�t���h�Ӱe��F�A�ЧA��Z��R�������f�A��F�J���o�R�N���١A�M�����ڱN���浹�����A�n�ܡH
		--AddSpeakOption( OwnerID(), TargetID(), GetString("SC_111307_8") , "LuaS_110609_1" , 0 )		-- �ﶵ�A��������-�ڬO�u���̷R�A
	elseif ( CountBodyItem( OwnerID() , 202696 ) >= 1 ) and ( CheckFlag( OwnerID() , 541324 ) == false )  then		-- �C�i����ĳ�_��
		LoadQuestOption( OwnerID() )	--���J���ȼҪO
		--SetSpeakDetail( OwnerID(), GetString("SC_111307_9") )
		--AddSpeakOption( OwnerID(), TargetID(), GetString("SC_111307_8") , "LuaS_110609_1" , 0 )		-- �ﶵ�A��������-�ڬO�u���̷R�A
	elseif ( CheckFlag( OwnerID() , 541324 ) == true ) and ( CheckFlag( OwnerID() , 541326 ) == false ) and CheckAcceptQuest( OwnerID() , 421346 ) == false then
		SetFlag( OwnerID() , 541324 , 0 )
		LoadQuestOption( OwnerID() )	--���J���ȼҪO
	elseif CheckFlag( OwnerID() , 541324 ) == true and CheckFlag( OwnerID() , 541326 ) == true then
		SetSpeakDetail( OwnerID(), GetString("SC_111307_6") )	-- �����A�藍�_�K�ڡK�ڡK�ڬO�u���K�藍�_�A�藍�_�A�ڳ��w���H�K�u���O�p�ڡI
	elseif CheckFlag( OwnerID() , 541324 ) == true then
		SetSpeakDetail( OwnerID(), GetString("SC_111307_15") )
	else
		SetSpeakDetail( OwnerID(), GetString("SC_111307_6") )	-- �����A�藍�_�K�ڡK�ڡK�ڬO�u���K�藍�_�A�藍�_�A�ڳ��w���H�K�u���O�p�ڡI
	end

end

function LuaS_110609_1()
	CloseSpeak( OwnerID() )	-- ������ܵ���
	SetFlag( OwnerID() , 541324 , 1 )	-- 2008�C�i���H���ȱ���
end

function LuaS_110610()	-- ����
	if CheckFlag( OwnerID() , 541323 ) == true then
		LoadQuestOption( OwnerID() )	--���J���ȼҪO
	elseif CheckFlag( OwnerID() , 541325 ) == true and CheckFlag( OwnerID() , 541326 ) == false then
		SetSpeakDetail( OwnerID(), GetString("SC_111307_27") )
	elseif CheckFlag( OwnerID() , 541326 ) == true then 
		SetSpeakDetail( OwnerID(), GetString("SC_111307_21") )
		AddSpeakOption( OwnerID(), TargetID(), GetString("SC_111307_22") , "LuaS_110610_1" , 0 )
		AddSpeakOption( OwnerID(), TargetID(), GetString("SC_111307_23") , "LuaS_110610_2" , 0 )
	else
		SetSpeakDetail( OwnerID(), GetString("SC_111307_7") )
	end
end

function LuaS_110610_1()
	CloseSpeak( OwnerID() )	-- ������ܵ���
	if DelBodyItem( OwnerID() , 202694 , 1 ) then	-- �R�N����
		GiveBodyItem( OwnerID() , 202695 , 1 )	-- �n�H�d
		tell( OwnerID() , TargetID() , GetString("SC_111307_24") )
		SetFlag( OwnerID(), 541323 , 1 )
		SetFlag( OwnerID(), 541324 , 0 )
		SetFlag( OwnerID(), 541325 , 1 )
		SetFlag( OwnerID() , 541326 , 0 )
	end
end

function LuaS_110610_2()
	CloseSpeak( OwnerID() )	-- ������ܵ���
	if DelBodyItem( OwnerID() , 202694 , 1 ) then	-- �R�N����
		if ReadRoleValue( OwnerID() , EM_RoleValue_SEX ) == 0 then
			GiveBodyItem( OwnerID() , 221391 , 1 )	-- �C�i����
		elseif ReadRoleValue( OwnerID() , EM_RoleValue_SEX ) == 1 then
			GiveBodyItem( OwnerID() , 221392 , 1 )	-- �C�i�٫�
		end
		tell( OwnerID() , TargetID() , GetString("SC_111307_25") )
		SetFlag( OwnerID(), 541323 , 1 )
		SetFlag( OwnerID(), 541324 , 0 )
		SetFlag( OwnerID(), 541325 , 1 )
		SetFlag( OwnerID() , 541326 , 0 )
	end
end

function LuaS_110020()	-- �F�J
	local hour = GetSystime(1)
	--local min = GetSystime(2)

	if ( hour >= 18 and hour < 20 ) and CheckFlag( OwnerID() , 541324 ) == true and CheckFlag( OwnerID() , 541326 ) == false then		-- 2008�C�i���H���ȱ���
		SetSpeakDetail( OwnerID(), GetString("SC_111307_10") )
		AddSpeakOption( OwnerID(), TargetID(), GetString("SC_111307_11") , "LuaS_110020_1" , 0 )		-- �ﶵ�A��������-�@�e�K�y�]�q
	elseif CountBodyItem( OwnerID() , 202696 ) >= 1 and CheckFlag( OwnerID() , 541324 ) == true and CheckFlag( OwnerID() , 541326 ) == false then
		SetSpeakDetail( OwnerID(), GetString("SC_111307_10") )
		AddSpeakOption( OwnerID(), TargetID(), GetString("SC_111307_11") , "LuaS_110020_1" , 0 )		-- �ﶵ�A��������-�@�e�K�y�]�q
	else
		LoadQuestOption( OwnerID() )	--���J���ȼҪO
	end
end

function LuaS_110020_1()
	CloseSpeak( OwnerID() )	-- ������ܵ���
	if ( EmptyPacketCount( OwnerID() ) < 1 ) and QueuePacketCount( OwnerID() ) == 0 then
		tell( OwnerID() , TargetID() , GetString("SC_111307_16") )		-- �A���I�]���G�w�g�S���Ŧ�F�A�вM�z�@�U�A�L�ӧ�ڡI
	else

		local MessageString = ReplaceString( GetString("SC_111307_19") , "PlayerName" , GetName( OwnerID() ) )
		local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
		local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --�|Ū��u�ꪺ���y�ϰ�
		if CountBodyItem( OwnerID() , 202693 ) < 1 then
			tell( OwnerID() , TargetID() , GetString("SC_111307_18") )
			-- �о��t�N�o�ӫ_�I��|�K�y�]�q�A�e��Z��R������¾�~�j�U�A�浹�F�����|���C
			GiveBodyItem( OwnerID() , 202693 , 1 )	-- �_�I��|�K�y�]�q
			CastSpell( TargetID() , OwnerID() , 491270 )
			if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
				RunningMsg( OwnerID() , 2 , MessageString )
			end
		else
			tell( OwnerID() , TargetID() , GetString("SC_111307_17") )
			-- �A�����W�w���_�I��|�K�y�]�q�A�о��t�e��Z��R������¾�~�j�U�A�浹�F�����|���C
			CastSpell( TargetID() , OwnerID() , 491270 )
			--if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
				-- RunningMsg( OwnerID() , 2 , MessageString )
			--end
		end
	end
end

function LuaS_110167_6()	-- �F����
	CloseSpeak( OwnerID() )	-- ������ܵ���

	local MessageString = ReplaceString( GetString("SC_111307_20") , "PlayerName" , GetName( OwnerID() ) )

	if CheckBuff( OwnerID() , 501666 ) == true or CheckFlag( OwnerID() , 541327 ) == true then
		if DelBodyItem( OwnerID() , 202693 , 1 ) then 	-- �_�I��|�K�y�]�q
			CancelBuff( OwnerID() , 501666 ) --����BUFF
			CancelBuff( OwnerID() , 501668 )
			GiveBodyItem( OwnerID() , 202694 , 1 )	-- �R�N����
			tell( OwnerID() , TargetID() , GetString("SC_111307_14") )
			SetFlag( OwnerID() , 541326 , 1 )
			SetFlag( OwnerID(), 541327 , 0 )
			local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
			local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --�|Ū��u�ꪺ���y�ϰ�
			if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
				RunningMsg( OwnerID() , 2 , MessageString )
			end
		--else --�W�L�ɶ��^�Ӫ��T��
		--	ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SAY_110989_1"), 0 );
		end
	end
end


function LuaPK_Love_Action_Killer()

	local MessageString = ""
	MessageString = ReplaceString( GetString("SC_111307_30") , "KillerName" , GetName( TargetID() ) )
	MessageString = ReplaceString( MessageString  , "PlayerName" , GetName( OwnerID() ) )

	if CountBodyItem( OwnerID() , 202695 ) >= 1 then	-- �n�H�d
		if DelBodyItem( OwnerID() , 202695 , 1 ) then
			GiveBodyItem( TargetID() , 202695 , 1 )
			SetFlag( OwnerID(), 541327 , 1 )
			MessageString = ReplaceString( MessageString  , "ItemName" , GetString("SC_111307_31") )
		end
	elseif CountBodyItem( OwnerID() , 202693 ) >= 1 then 	-- �_�I��|�K�y�]�q
		if DelBodyItem( OwnerID() , 202693 , 1 ) then
			GiveBodyItem( TargetID() , 202694 , 1 )	-- �R�N����
			MessageString = ReplaceString( MessageString  , "ItemName" , GetString("SC_111307_32") )
		end
	end

	SetFlag( OwnerID(), 541324 , 0 )
	SetFlag( OwnerID(), 541325 , 1 )
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --�|Ū��u�ꪺ���y�ϰ�
	if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
		RunningMsg( TargetID() , 2 , MessageString )
	end
end