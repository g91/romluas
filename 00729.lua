function TPExchange_Basic()

	local TPList = { 100, 500, 1000, 5000, 10000 }

	local n = 0
	local DialogStatus = 0

	local Player = OwnerID()

	DialogCreate( Player , EM_LuaDialogType_Select , "Do You Want to TPExchange ?" )
	for i = 1, table.getn( TPList ) do
		DialogSelectStr( Player , "You Exchange "..TPList[i].." TP !" )
	end
		DialogSelectStr( Player , "Exit Exchange" )

	if ( DialogSendOpen( Player ) == false ) then 
		ScriptMessage( Player , Player , 1 , GetString("SYS_FIXEQ_DATA_ERROR") , 0 )	--��ưe�X�����D
		return 0
	end
	while true do
		Sleep( 5 )
		n = n + 1
		DialogStatus = DialogGetResult( Player )
		if n > 600 then -- ���L�a�j��A600 = �@����
			ScriptMessage( Player , Player , 0, "�L�a�j��ζ��m�L�[", 0 )
			DialogClose( Player )
			break
		else
			--ScriptMessage( Player , Player , 0, "�X�k�j��", 0 )
		end

		Say( Player , DialogStatus )

		if ( DialogStatus == 5 ) or ( DialogStatus == -1 ) then
			DialogClose( Player )
			break
		elseif  ( DialogStatus ~= -2 ) then
			DialogClose( Player )
			Say( Player , "You Exchange "..TPList[DialogStatus+1].." TP !" )
			TPExchange_DO( DialogStatus+1 )
			break
		end
	end

end

function TPExchange_DO( SelectOption )
	local n = 0
	local DialogResult = ""
	local UnitPrice = 99

	local Player = OwnerID()

	DialogCreate( Player , EM_LuaDialogType_YesNo  , GetString("SO_111082_2") )	-- �Q�R�h�a���H 10 �ʪ�����O 50 �ȡA�A�n�R�ܡH
	DialogSelectStr( Player , GetString("SO_111082_3") )	-- �S���D�A�ڶR�F�I
	DialogSelectStr( Player , GetString("SO_111082_4") )	-- �ӶQ�F���Q�R�I

	if( DialogSendOpen( Player ) == false ) then 
		ScriptMessage( Player , Player , 1 , GetString("SYS_FIXEQ_DATA_ERROR") , 0 )	--��ưe�X�����D
		return 0
	end
	
	while true do
		Sleep( 5 )
		local DialogStatus = DialogGetResult( Player )
		n = n + 1
		if n > 60 then -- ���L�a�j��A60 = �b����
			--ScriptMessage( Player, Player, 0, "�L�a�j��", 0 )
			DialogClose( Player )
			break
		else
			--ScriptMessage( Player, Player, 0, "�X�k�j��", 0 )
		end

		if ( DialogStatus >= 0 ) then 
			if ( DialogStatus == 0 ) then
				DialogResult = "Yes"
				DialogClose( Player )
				break;
			elseif ( DialogStatus == 1 ) then
				DialogResult = "No"
				DialogClose( Player )
				break;
			end
		end
	end

	if ( DialogResult == "Yes" ) then
		local Money = Read_Role_Money( Player )
		ScriptMessage( Player, Player, 0, "You Have Money�G"..Money , 0 )

		if ( Money < SelectOption * UnitPrice ) then
			Say ( Player , GetString("SO_111082_5") )	-- �A���W�����������A�ڵL�k�浹�A�I
		else
			Role_MoneyChange( Player , -SelectOption * UnitPrice )
			AddRoleValue( Player , EM_RoleValue_TpExp , TPList[SelectOption] )
		end
	elseif ( DialogResult == "No" ) then

	else
		Say ( Player , GetString("SO_111082_6") )	-- �٬O�U���A�ӶR�a�I
	end
end