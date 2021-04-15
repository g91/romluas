function LuaS_420611_check()
	local HP = ReadRoleValue(TargetID(),EM_RoleValue_HP)
	local MaxHP = ReadRoleValue(TargetID(),EM_RoleValue_MaxHP)
	local Timemy = HP/MaxHP
	if ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 100399 then
		if Timemy<0.3 then
			return true
		else
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_420611_3"), 0 );--再打他幾下！
			return false
		end
	else
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_420611_2"), 0 ); --這是拿來抓盜賊的，你是不是搞錯了？
		return false
	end
end

function LuaS_420611_use()
	BeginPlot( TargetID(), "LuaS_420611", 0 )
	GiveBodyItem( OwnerID(), 201438, 1 )--給一個
	ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_420611_0"), 0 ); --被打個半死的盜賊被抓進了箱子，一邊掙扎還一邊大罵！
end


function LuaS_420611()
	DelFromPartition( OwnerID() )
	Sleep(100)
	AddToPartition( OwnerID() , 0 )
	LuaFunc_ResetObj( OwnerID())
end