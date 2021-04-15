
----------------------------NPC 移動的機制 -------------------------------
function Lua_na_6thYears_change(Ru2)
	local Owner = OwnerID()
	local Num2 = 0
	local Round = DW_Rand(2)+3
	for j = 1 , Round do
		if j%2 == 0 then
			local Num = { 1, 2, 3, 4, 5, 6 }
			local Num3 = { 7, 8, 9, 10, 11, 12 }
			for i = 1 , #Num3 do
				local R = DW_Rand(#Num3)
				Num2 = Num3[R]-6
				WriteRoleValue( Ru2[i] , EM_RoleValue_PID , Num2 )  --讓要互換位置的NPC，寫入自己的旗標位置
				WriteRoleValue( Ru2[Num3[R]], EM_RoleValue_PID, Num3[R]) --在自己的PID寫下要移動過去的旗標位置
				BeginPlot( Ru2[i] , "Lua_na_Move",10)
				BeginPlot( Ru2[Num3[R]] , "Lua_na_Move",10)
				table.remove( Num3 , R)
			end
		else
			local Num = { 1, 2, 3, 4, 5, 6 }
			local Num3 = { 7, 8, 9, 10, 11, 12 }
			for i = 1 , #Num do
				local R = DW_Rand(#Num)
				Num2 = Num[R]+6
				WriteRoleValue( Ru2[i] , EM_RoleValue_PID, Num2) --在自己的PID寫下要移動過去的旗標位置
				WriteRoleValue( Ru2[Num2] , EM_RoleValue_PID , i )  --讓要互換位置的NPC，寫入自己的旗標位置
				BeginPlot( Ru2[i] , "Lua_na_Move",10)
				BeginPlot( Ru2[Num2] , "Lua_na_Move",10)
				table.remove( Num , R)
			end	
		end
		sleep(30)
	end
end


function Lua_na_Move()
	local Owner = OwnerID()
	local PID =  ReadRoleValue(Owner , EM_RoleValue_PID)
	MoveToFlagEnabled( Owner, false )
	LuaFunc_MoveToFlag( Owner , 781357 , PID, 0 )
end


function Lua_na_6thYears_Move1(Ru2)
	local Owner = OwnerID()
	local R = DW_Rand(4)+2
	for i = 1 , #Ru2 do
		CallPlot( Ru2[i], "Lua_na_Move2", R)
	end
end

function Lua_na_Move2(R)
	local Owner = OwnerID()
	local PID =  ReadRoleValue(Owner , EM_RoleValue_PID)
	local Num = R
	if PID <= (12-Num) then
		WriteRoleValue( Owner , EM_RoleValue_PID, PID+Num)
		local NEW_PID =  ReadRoleValue(Owner , EM_RoleValue_PID)
		LuaFunc_MoveToFlag( Owner , 781357 , NEW_PID , 0 )	
	else
		WriteRoleValue( Owner , EM_RoleValue_PID, PID-(12-Num))
		local NEW_PID =  ReadRoleValue(Owner , EM_RoleValue_PID)
		LuaFunc_MoveToFlag( Owner , 781357 , NEW_PID , 0 )	
	end
	Sleep(20)
end

function Lua_na_6thYears_Move2(Ru2)
	local Owner = OwnerID()
	local R = DW_Rand(4)+2
	for i = 1 , #Ru2 do
		CallPlot( Ru2[i], "Lua_na_Move3", R)
	end
end

function Lua_na_Move3(R)
	local Owner = OwnerID()
	local PID =  ReadRoleValue(Owner , EM_RoleValue_PID)
	local Num = R
	if PID <= Num then
		WriteRoleValue( Owner , EM_RoleValue_PID, PID+(12-num))
		local NEW_PID =  ReadRoleValue(Owner , EM_RoleValue_PID)
	--	Say( Owner , "My NEW_PID is = "..NEW_PID)
		LuaFunc_MoveToFlag( Owner , 781357 , NEW_PID , 0 )	
	else
		WriteRoleValue( Owner , EM_RoleValue_PID, PID-Num )
		local NEW_PID =  ReadRoleValue(Owner , EM_RoleValue_PID)
--		Say( Owner , "My NEW_PID is = "..NEW_PID)
		LuaFunc_MoveToFlag( Owner , 781357 , NEW_PID , 0 )	
	end
	Sleep(20)
end
