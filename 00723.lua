function DelPackage()

	local PackageCount = ReadRoleValue( OwnerID() , EM_RoleValue_BodyCount )

	local n = 0
	local DialogResult = ""

	DialogCreate( OwnerID() , EM_LuaDialogType_YesNo  , "Do You Want to DELETE Items in Your Package ?" )
	DialogSelectStr( OwnerID() , "YES" )
	DialogSelectStr( OwnerID() , "NO" )

	if( DialogSendOpen( OwnerID() ) == false ) then 
		ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("SYS_FIXEQ_DATA_ERROR") , 0 )	--資料送出有問題
		return 0
	end
	
	while true do
		Sleep( 5 )
		local DialogStatus = DialogGetResult( OwnerID() );
		n = n + 1
		if n > 60 then -- 防無窮迴圈，60 = 半分鐘
			--ScriptMessage( OwnerID(), OwnerID(), 0, "無窮迴圈", 0 )
			DialogClose( OwnerID() )
			break
		else
			--ScriptMessage( OwnerID(), OwnerID(), 0, "合法迴圈", 0 )
		end

		if ( DialogStatus >= 0 ) then 
			if ( DialogStatus == 0 ) then
				DialogResult = "Yes"
				DialogClose( OwnerID() )
				break;
			elseif ( DialogStatus == 1 ) then
				DialogResult = "No"
				DialogClose( OwnerID() )
				break;
			end
		end
	end

	if ( DialogResult == "Yes" ) then
		ScriptMessage( OwnerID(), OwnerID(), 0, "Clear Your Package !!", 0 )
		for i = 60, PackageCount do
			local ItemID = GetItemInfo( OwnerID() , EM_ItemPacketType_Body , i-1 , EM_ItemValueType_OrgObjID )
			DelBodyItem( OwnerID() , ItemID , CountBodyItem( OwnerID() , ItemID ) )
		end
	elseif ( DialogResult == "No" ) then

	else
		Say ( OwnerID() , "This Script Cancel !!" )
	end

end

function DelBag()
	Beginplot( OwnerID() , "DelPackage" , 0 )
end

function DelMallItem()

	local PackageCount = ReadRoleValue( OwnerID() , EM_RoleValue_BodyCount )

	local n = 0
	local DialogResult = ""

	DialogCreate( OwnerID() , EM_LuaDialogType_YesNo  , "Do You Want to DELETE Items in Your Mall Package ?" )
	DialogSelectStr( OwnerID() , "YES" )
	DialogSelectStr( OwnerID() , "NO" )

	if( DialogSendOpen( OwnerID() ) == false ) then 
		ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("SYS_FIXEQ_DATA_ERROR") , 0 )	--資料送出有問題
		return 0
	end
	
	while true do
		Sleep( 5 )
		local DialogStatus = DialogGetResult( OwnerID() );
		n = n + 1
		if n > 60 then -- 防無窮迴圈，60 = 半分鐘
			--ScriptMessage( OwnerID(), OwnerID(), 0, "無窮迴圈", 0 )
			DialogClose( OwnerID() )
			break
		else
			--ScriptMessage( OwnerID(), OwnerID(), 0, "合法迴圈", 0 )
		end

		if ( DialogStatus >= 0 ) then 
			if ( DialogStatus == 0 ) then
				DialogResult = "Yes"
				DialogClose( OwnerID() )
				break;
			elseif ( DialogStatus == 1 ) then
				DialogResult = "No"
				DialogClose( OwnerID() )
				break;
			end
		end
	end

	if ( DialogResult == "Yes" ) then
		ScriptMessage( OwnerID(), OwnerID(), 0, "Clear Your Mall Package !!", 0 )
		for i = 1, 49 do
			local ItemID = GetItemInfo( OwnerID() , EM_ItemPacketType_Body , i-1 , EM_ItemValueType_OrgObjID )
			DelBodyItem( OwnerID() , ItemID , CountBodyItem( OwnerID() , ItemID ) )
		end
	elseif ( DialogResult == "No" ) then

	else
		Say ( OwnerID() , "This Script Cancel !!" )
	end

end