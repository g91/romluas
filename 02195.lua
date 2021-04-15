function sueki_test03()
	local player = {800011,800012,800013,800014,800015,800016}
	local kill = {10,5,9,2,1,4}
	local placings = {}

		for i = 1,6-1 do
			for j = i+1,6 do
				if kill[i] > kill[j] then
					player[i] , player[j] = player[i] , player[j]
				elseif kill[i] < kill[j] then
					player[i] , player[j] = player[j] , player[i]
				end
			end
		end

	for i = 1,6 do 
		Say(OwnerID(),player[i])
		sleep(3)
	end	
end

---------------------------

function lua_suki_test()
	for i= 1,5,1 do
		WriteRoleValue(OwnerID(),EM_RoleValue_Register+i, 3)
		Say(OwnerID(), i)
		Sleep(20)
	end
end 


------------------------
function lua_suki_test04()
	local numberB={1, 2, 3, 4, 5}
	local numberC={}
	for x = 1, 5 do
		local i=table.getn ( numberB ) 
		Say(OwnerID(), "numberB="..i)
		local Wnumber=Rand(i)+1
		Say( OwnerID(), "Wnumber="..numberB[Wnumber] )
		table.insert ( numberC, numberB[Wnumber])
		table.remove( numberB, Wnumber )
	end
	WriteRoleValue (OwnerID(), EM_RoleValue_Register+1, numberC[1]..numberC[2]..numberC[3]..numberC[4]..numberC[5])
end 

--------------------------------------------------
function lua_suki_test_Register()
	WriteRoleValue(OwnerID(), EM_RoleValue_Register, 0)
	WriteRoleValue(OwnerID(), EM_RoleValue_Register+1,0)
	WriteRoleValue(OwnerID(), EM_RoleValue_Register+2,0)
	WriteRoleValue(OwnerID(), EM_RoleValue_Register+3,0)
	WriteRoleValue(OwnerID(), EM_RoleValue_Register+4,0)
	WriteRoleValue(OwnerID(), EM_RoleValue_Register+5,0)
	WriteRoleValue(OwnerID(), EM_RoleValue_Register+6,0)
	WriteRoleValue(OwnerID(), EM_RoleValue_Register+7,0)
	WriteRoleValue(OwnerID(), EM_RoleValue_Register+8,0)
	WriteRoleValue(OwnerID(), EM_RoleValue_Register+9,0)
end