function LuaS_110752_HomeBUY_Dialog_Backup()

	local n = 0
	local DialogResult = ""

	DialogCreate( TargetID() , EM_LuaDialogType_YesNo  , GetString("SO_PAYHOMEMONEYDIALOG") );
	DialogSelectStr( TargetID() , GetString("SO_HOME_PAY") )		-- ��I
	DialogSelectStr( TargetID() , GetString("SO_HOME_CANCAL") )	-- ����

	if( DialogSendOpen( TargetID() ) == false ) then 
		ScriptMessage( OwnerID() , TargetID() , 1 , GetString("SYS_FIXEQ_DATA_ERROR") , 0 )	--��ưe�X�����D
		return 0
	end
	
	while 1 do
		sleep( 2 );
		local DialogStatus = DialogGetResult( TargetID() );
		n = n + 1
		if n > 600 then -- ���L�a�j��A600 = �@����
			ScriptMessage( TargetID(), TargetID(), 0, "�L�a�j��", 0 )
			DialogClose( TargetID() )
			break
		else
			--ScriptMessage( TargetID(), TargetID(), 0, "�X�k�j��", 0 )
		end

		if ( DialogStatus ~= -1 ) then 
			if ( DialogStatus == 0 ) then -- ���\
				DialogResult = "Yes"
				DialogClose( TargetID() )
				break;
			elseif ( DialogStatus == 1 ) then -- ����
				DialogResult = "No"
				DialogClose( TargetID() )
				break;
			end
		end
	end

	if ( DialogResult == "Yes" ) then
		Say(OwnerID(), GetString("SO_YOUWANTBUYHOME") )	-- �A�Q�ӽ��ʶR�ЫΡI
			--ScriptMessage( OwnerID(), TargetID(), 0, "�A�Q�ӽ��ʶR�ЫΡI", 0 )
		local Money = Read_Role_Money( TargetID() )
			--ScriptMessage( OwnerID(), TargetID(), 0, "�A���W�������ƥج��G"..Money , 0 )

		if (Money < 10000) then
			Say(OwnerID(), GetString("SO_YOUBUYHOMENOMONEY") )	-- �A���W������������I�ӽ��ʶR�ЫΪ���F����O�A�ڵL�k���A��z�ӽСI
				--ScriptMessage( OwnerID(), TargetID(), 0, "�A���W������������I�ӽ��ʶR�ЫΪ���F����O�A�ڵL�k���A��z�ӽСI", 0 )
		else
			Say(OwnerID(), GetString("SO_YOUBUYHOMEHAVEMONEY") )	-- �A���W������������I�ӽ��ʶR�ЫΪ���F����O�A�ڰ��W���A��z�ӽСI
				--ScriptMessage( OwnerID(), TargetID(), 0, "�A���W������������I�ӽ��ʶR�ЫΪ���F����O�A�ڰ��W���A��z�ӽСI", 0 )
			Role_MoneyChange( TargetID(), -10000 )
			local Ret = BuildHouse( TargetID() , 575523 );
			if( Ret == false ) then
				Tell( OwnerID() , TargetID() , GetString("SO_NOBUILDHOME") )	-- "�L�k�ӽЩЫΡI�I
			end
			Sleep( 50 )
			local homenumber = Read_Role_HomeNumber( TargetID() )
			local Str = "[SO_SAYHOMENUMBER][$SETVAR1="..homenumber.."]"
			Say(OwnerID(), Str )		-- �ӽФw�g�����A�A���ЫΪ��P���X�O
				--ScriptMessage( OwnerID(), TargetID(), 0, "�ӽФw�g�����A�A���ЫΪ��P���X�O"..homenumber , 0 )
			Sleep( 20 )
			Say(OwnerID(), GetString("SO_SAYBUYHOMEBONUS") )	-- �{�b�ӽ��ʶR�ЫΡA�N�ذe�@�i�a������A�Ц��U�I
			GiveBodyItem ( TargetID() , 201291 , 1 )	-- �a������
		end

	elseif ( DialogResult == "No" ) then
		Say(OwnerID(), GetString("SO_NOBUYHOME") )	-- �A�ثe���Q�ӽ��ʶR�ЫΡI
			--ScriptMessage( OwnerID(), TargetID(), 0, "�A�ثe���Q�ӽ��ʶR�ЫΡI", 0 )
		Sleep( 20 )
		Say(OwnerID(), GetString("SO_NOBUYHOMEWELCOME") )	-- ���A�Q�ӽ��ʶR�ЫΪ��ɭԡA�w��A�ӧ�ڡI
			--ScriptMessage( OwnerID(), TargetID(), 0, "���A�Q�ӽ��ʶR�ЫΪ��ɭԡA�w��A�ӧ�ڡI", 0 )
	else
		Say(OwnerID(), GetString("SO_BUYTHINKTOLONG") )	-- �A�Ҽ{�L�[�A���A�Q�ӽ��ʶR�ЫΪ��ɭԡA�w��A�ӧ�ڡI
			--ScriptMessage( OwnerID(), TargetID(), 0, "�A�Ҽ{�L�[�A���A�Q�ӽ��ʶR�ЫΪ��ɭԡA�w��A�ӧ�ڡI", 0 )
	end
end
