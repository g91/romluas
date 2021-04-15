

function LuaS_421097_0()
	local Target = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	local Target_HP = ReadRoleValue( TargetID() , EM_RoleValue_HP )
	if Target == 100801 then
		if Target_HP < 100 then
			return true
		else
			ScriptMessage( OwnerID(), OwnerID(), 1 ,GetString("SC_421097_1"),1)--現在抓它還太危險！
			return false
		end
	else
		ScriptMessage( OwnerID(), OwnerID(), 1 ,GetString("SC_421097_0"),1)--你是不是搞錯了什麼？
		return false
	end
end


function LuaS_421097_1()
	BeginPlot(TargetID() , "LuaS_421097_2" , 0 )
	ScriptMessage( OwnerID(), OwnerID(), 1 ,GetString("SC_421097_2"),1)--你抓到了葉球！
	GiveBodyItem(OwnerID() , 202507 ,1)
end

function LuaS_421097_2()
	LuaFunc_ResetObj( OwnerID() )
end
