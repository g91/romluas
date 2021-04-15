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
		ScriptMessage( Player , Player , 1 , GetString("SYS_FIXEQ_DATA_ERROR") , 0 )	--資料送出有問題
		return 0
	end
	while true do
		Sleep( 5 )
		n = n + 1
		DialogStatus = DialogGetResult( Player )
		if n > 600 then -- 防無窮迴圈，600 = 一分鐘
			ScriptMessage( Player , Player , 0, "無窮迴圈或閒置過久", 0 )
			DialogClose( Player )
			break
		else
			--ScriptMessage( Player , Player , 0, "合法迴圈", 0 )
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

	DialogCreate( Player , EM_LuaDialogType_YesNo  , GetString("SO_111082_2") )	-- 想買沼地蕨？ 10 棵的價格是 50 銀，你要買嗎？
	DialogSelectStr( Player , GetString("SO_111082_3") )	-- 沒問題，我買了！
	DialogSelectStr( Player , GetString("SO_111082_4") )	-- 太貴了不想買！

	if( DialogSendOpen( Player ) == false ) then 
		ScriptMessage( Player , Player , 1 , GetString("SYS_FIXEQ_DATA_ERROR") , 0 )	--資料送出有問題
		return 0
	end
	
	while true do
		Sleep( 5 )
		local DialogStatus = DialogGetResult( Player )
		n = n + 1
		if n > 60 then -- 防無窮迴圈，60 = 半分鐘
			--ScriptMessage( Player, Player, 0, "無窮迴圈", 0 )
			DialogClose( Player )
			break
		else
			--ScriptMessage( Player, Player, 0, "合法迴圈", 0 )
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
		ScriptMessage( Player, Player, 0, "You Have Money："..Money , 0 )

		if ( Money < SelectOption * UnitPrice ) then
			Say ( Player , GetString("SO_111082_5") )	-- 你身上的金錢不足，我無法賣給你！
		else
			Role_MoneyChange( Player , -SelectOption * UnitPrice )
			AddRoleValue( Player , EM_RoleValue_TpExp , TPList[SelectOption] )
		end
	elseif ( DialogResult == "No" ) then

	else
		Say ( Player , GetString("SO_111082_6") )	-- 還是下次再來買吧！
	end
end