function LuaS_204861()
	local BuffA = Lua_BuffPosSearch( OwnerID() , 504225 )
	local BuffB = Lua_BuffPosSearch( OwnerID() , 504226 )
	if ( BuffA == -1 or BuffInfo( OwnerID()  ,BuffA, EM_BuffInfoType_Time ) < 1 ) and ( BuffB == -1 or BuffInfo( OwnerID()  ,BuffB, EM_BuffInfoType_Time ) < 1 ) then
		GiveBodyItem( OwnerID(), 204862, 1 )
	end
--	if BuffA ~= -1 then
--		CancelBuff_NoEvent( OwnerID()  , 504225 )
--	end
--	if BuffB ~= -1 then
--		CancelBuff_NoEvent( OwnerID()  , 504226 )
--	end
end

-- 2013.06.17 阿浩:重新調整寫法，嘗試修正符文汲能鍊(204861)的汲能時間結束時， 不會獲得符文釋能鍊(204862)的問題並追加Designlog供後續追蹤用
function LuaI_204861()	-- 符文汲能鍊

	local Player = OwnerID()
	if CheckBuff( Player , 504225 ) == false then	-- 符文汲能鍊、符文汲能鍊計時
		GiveBodyItem( Player , 204862 , 1 )
		DesignLog( Player , 204861 , "ok" )
	else
		local Pos = Lua_BuffPosSearch( Player , 504225 )	-- 抓出身上的法術代號
		local BuffTime = BuffInfo( Player , Pos , EM_BuffInfoType_Time )	-- 抓出法術的持續時間
		DesignLog( Player , 2048611 , "Count 204861 = "..CountItem( Player , 204861 ).." , 504225 Time = "..BuffTime )
	end
	CancelBuff_NoEvent( Player , 504225 )
end

function LuaI_204870()	-- 必爾汀汲能鍊

	local Player = OwnerID()
	if CheckBuff( Player , 504226 ) == false then	-- 必爾汀付費符文汲能鍊、必爾汀付費符文汲能鍊計時
		GiveBodyItem( Player , 204862 , 1 )
		DesignLog( Player , 204870 , "ok" )
	else
		local Pos = Lua_BuffPosSearch( Player , 504226 )	-- 抓出身上的法術代號
		local BuffTime = BuffInfo( Player , Pos , EM_BuffInfoType_Time )	-- 抓出法術的持續時間
		DesignLog( Player , 2048701 , "Count 204870 = "..CountItem( Player , 204870 ).." , 504226 Time = "..BuffTime )
	end
	CancelBuff_NoEvent( Player , 504226 )
end

function LuaI_206629()	-- 測試用汲能鍊

	local Player = OwnerID()
	if CheckBuff( Player , 504225 ) == false then	-- 必爾汀付費符文汲能鍊、必爾汀付費符文汲能鍊計時
		GiveBodyItem( Player , 204862 , 1 )
		DesignLog( Player , 206629 , "ok" )
	else
		local Pos = Lua_BuffPosSearch( Player , 504225 )	-- 抓出身上的法術代號
		local BuffTime = BuffInfo( Player , Pos , EM_BuffInfoType_Time )	-- 抓出法術的持續時間
		DesignLog( Player , 2066291 , "Count 206629 = "..CountItem( Player , 206629 ).." , 504225 Time = "..BuffTime )
	end
	CancelBuff_NoEvent( Player , 504225 )
end

function LuaS_422363_0() --掛在檢查
	if	ReadRoleValue(TargetID(),EM_RoleValue_OrgID)~=100374	then
		DebugMsg( 0 , 0 , ReadRoleValue(TargetID(),EM_RoleValue_OrgID) )
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_421101_0]" , C_SYSTEM )
		return false
	end

	if	not CheckDistance( OwnerID(), TargetID(), 200 )		then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204637_2]" , C_SYSTEM )
		return false
	end

	if	ReadRoleValue(TargetID(),EM_RoleValue_HP)/ReadRoleValue(TargetID(),EM_RoleValue_MaxHP)	> 0.5	then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_101614_2]" , C_SYSTEM )
		return false
	end

	return true
end

function LuaS_422363_1() --掛在使用
	GiveBodyItem(OwnerID(),204880,1)
	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422363_0]" , C_SYSTEM )
end


function LuaS_422374_0()--掛在檢查
	if	ReadRoleValue(TargetID(),EM_RoleValue_OrgID)~=101584	then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_421101_0]" , C_SYSTEM )
		return false
	end

	if	not CheckDistance( OwnerID(), TargetID(), 200 )		then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204637_2]" , C_SYSTEM )
		return false
	end

	if	ReadRoleValue(TargetID(),EM_RoleValue_HP)/ReadRoleValue(TargetID(),EM_RoleValue_MaxHP)	> 0.5	then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_101614_2]" , C_SYSTEM )
		return false
	end

	return true
end

function LuaS_422374_1()--掛在使用
	GiveBodyItem(OwnerID(),204879,1)
	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422374_0]" , C_SYSTEM )
end