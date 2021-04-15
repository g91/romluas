function LuaM_Bag_5_check()
	if ReadRoleValue( OwnerID() , EM_RoleValue_BodyCount ) <=55 then
		ScriptMessage( OwnerID(), OwnerID(), 1, GetString("MSG_BAGADD_5"), C_SYSTEM );--畫面中間訊息：背包已擴增5格欄位
		return true
	else
		ScriptMessage( OwnerID(), OwnerID(), 1, GetString("MSG_BAGMAX_60"), C_DEFAULT);--擴增失敗！背包上限為60個欄位
		return false
	end	
end

function LuaM_Bag_5_Effect()
	AddRoleValue( OwnerID() , EM_RoleValue_BodyCount , 5 )
end

function LuaM_Bag_check( Count )

	local MAX = 160	-- 背包最大上限
	local Package = ReadRoleValue( OwnerID() , EM_RoleValue_BodyCount )

	if ( Package == MAX ) then
		ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("MSG_BAGADDFAIL_MAX") , C_DEFAULT )		-- 畫面中間訊息：擴增失敗，背包欄位已達最大上限，無法再擴增！
		return false
	elseif ( Package == Count - 10 ) then
		ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("MSG_BAGADD_"..Count-60 ) , C_SYSTEM )		-- 畫面中間訊息：背包欄位已擴增至50格
		return true
	elseif ( Package >= Count ) then
		ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("MSG_BAGADD_SAME" ) , C_DEFAULT )			-- 畫面中間訊息：擴增失敗，無法擴增成相同或小於現在的格數！
		return false
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("MSG_BAGADDFAIL_"..Count-60 ) , C_DEFAULT )		-- 擴增失敗！背包欄位必須先擴增至40格
		return false
	end	
end

function LuaM_Bag_Effect( Count )
	WriteRoleValue( OwnerID() , EM_RoleValue_BodyCount , Count )
end