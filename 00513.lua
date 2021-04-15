function LuaS_110752_HomeBUY_Dialog_Backup()

	local n = 0
	local DialogResult = ""

	DialogCreate( TargetID() , EM_LuaDialogType_YesNo  , GetString("SO_PAYHOMEMONEYDIALOG") );
	DialogSelectStr( TargetID() , GetString("SO_HOME_PAY") )		-- 支付
	DialogSelectStr( TargetID() , GetString("SO_HOME_CANCAL") )	-- 取消

	if( DialogSendOpen( TargetID() ) == false ) then 
		ScriptMessage( OwnerID() , TargetID() , 1 , GetString("SYS_FIXEQ_DATA_ERROR") , 0 )	--資料送出有問題
		return 0
	end
	
	while 1 do
		sleep( 2 );
		local DialogStatus = DialogGetResult( TargetID() );
		n = n + 1
		if n > 600 then -- 防無窮迴圈，600 = 一分鐘
			ScriptMessage( TargetID(), TargetID(), 0, "無窮迴圈", 0 )
			DialogClose( TargetID() )
			break
		else
			--ScriptMessage( TargetID(), TargetID(), 0, "合法迴圈", 0 )
		end

		if ( DialogStatus ~= -1 ) then 
			if ( DialogStatus == 0 ) then -- 成功
				DialogResult = "Yes"
				DialogClose( TargetID() )
				break;
			elseif ( DialogStatus == 1 ) then -- 失敗
				DialogResult = "No"
				DialogClose( TargetID() )
				break;
			end
		end
	end

	if ( DialogResult == "Yes" ) then
		Say(OwnerID(), GetString("SO_YOUWANTBUYHOME") )	-- 你想申請購買房屋！
			--ScriptMessage( OwnerID(), TargetID(), 0, "你想申請購買房屋！", 0 )
		local Money = Read_Role_Money( TargetID() )
			--ScriptMessage( OwnerID(), TargetID(), 0, "你身上的金錢數目為："..Money , 0 )

		if (Money < 10000) then
			Say(OwnerID(), GetString("SO_YOUBUYHOMENOMONEY") )	-- 你身上的金錢不夠支付申請購買房屋的行政手續費，我無法為你辦理申請！
				--ScriptMessage( OwnerID(), TargetID(), 0, "你身上的金錢不夠支付申請購買房屋的行政手續費，我無法為你辦理申請！", 0 )
		else
			Say(OwnerID(), GetString("SO_YOUBUYHOMEHAVEMONEY") )	-- 你身上的金錢足夠支付申請購買房屋的行政手續費，我馬上為你辦理申請！
				--ScriptMessage( OwnerID(), TargetID(), 0, "你身上的金錢足夠支付申請購買房屋的行政手續費，我馬上為你辦理申請！", 0 )
			Role_MoneyChange( TargetID(), -10000 )
			local Ret = BuildHouse( TargetID() , 575523 );
			if( Ret == false ) then
				Tell( OwnerID() , TargetID() , GetString("SO_NOBUILDHOME") )	-- "無法申請房屋！！
			end
			Sleep( 50 )
			local homenumber = Read_Role_HomeNumber( TargetID() )
			local Str = "[SO_SAYHOMENUMBER][$SETVAR1="..homenumber.."]"
			Say(OwnerID(), Str )		-- 申請已經完成，你的房屋門牌號碼是
				--ScriptMessage( OwnerID(), TargetID(), 0, "申請已經完成，你的房屋門牌號碼是"..homenumber , 0 )
			Sleep( 20 )
			Say(OwnerID(), GetString("SO_SAYBUYHOMEBONUS") )	-- 現在申請購買房屋，將贈送一張家具抽獎券，請收下！
			GiveBodyItem ( TargetID() , 201291 , 1 )	-- 家具抽獎券
		end

	elseif ( DialogResult == "No" ) then
		Say(OwnerID(), GetString("SO_NOBUYHOME") )	-- 你目前不想申請購買房屋！
			--ScriptMessage( OwnerID(), TargetID(), 0, "你目前不想申請購買房屋！", 0 )
		Sleep( 20 )
		Say(OwnerID(), GetString("SO_NOBUYHOMEWELCOME") )	-- 等你想申請購買房屋的時候，歡迎再來找我！
			--ScriptMessage( OwnerID(), TargetID(), 0, "等你想申請購買房屋的時候，歡迎再來找我！", 0 )
	else
		Say(OwnerID(), GetString("SO_BUYTHINKTOLONG") )	-- 你考慮過久，等你想申請購買房屋的時候，歡迎再來找我！
			--ScriptMessage( OwnerID(), TargetID(), 0, "你考慮過久，等你想申請購買房屋的時候，歡迎再來找我！", 0 )
	end
end
