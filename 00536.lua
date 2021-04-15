--以下是聲望給予的函式

--單次委託任務完成使凡瑞娜絲城的聲望增加

function LuaS_FA_FamousUp()
	AddRoleValue ( TargetID() , EM_RoleValue_Famous,10 )
end

--單次委託任務完成使黑曜石要塞的聲望增加

function LuaS_BL_FamousUp()
	AddRoleValue ( TargetID() , EM_RoleValue_Famous+1,10 )
end

--單次獎勵任務完成使凡瑞娜絲城的聲望下降

function LuaS_FA_FamousDown()
	AddRoleValue ( TargetID() , EM_RoleValue_Famous,10 )
end

--單次獎勵任務完成使黑曜石要塞的聲望下降

function LuaS_BL_FamousDown()
	AddRoleValue ( TargetID() , EM_RoleValue_Famous+1,10 )
end


--顯示聲望

function Lua_FamousSHOW()
	SAY(OwnerID(),"FA_famous is "..ReadRoleValue(OwnerID(),EM_RoleValue_Famous)..".")
	SAY(OwnerID(),"BL_famous is "..ReadRoleValue(OwnerID(),EM_RoleValue_Famous+1)..".")
end