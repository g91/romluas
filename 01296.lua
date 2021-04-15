function LuaS_101268_0()
	local Dis = 36
	local X = ReadRoleValue(OwnerID() , EM_RoleValue_X)
	local Y = ReadRoleValue(OwnerID() , EM_RoleValue_Y)
	local Z = ReadRoleValue(OwnerID() , EM_RoleValue_Z)
	local Dir
	local AntiDir
	if	ReadRoleValue(OwnerID() , EM_RoleValue_Dir)>=270 	then
		Dir = ReadRoleValue(OwnerID() , EM_RoleValue_Dir) -270
	else
		Dir = ReadRoleValue(OwnerID() , EM_RoleValue_Dir)+90
	end
	if	Dir>=180	then
		AntiDir = Dir - 180
	else
		AntiDir = Dir + 180
	end
	local DirArray = { Dir , AntiDir+35 , AntiDir -35}
	local DisArray = { Dis , Dis/3 , Dis/3}

	local XYZ = {}
	local Earth = {}
	for i = 1 , 3 do
		if	i==2	then
			X = XYZ[1]
			Y = XYZ[2]
			Z = XYZ[3]
		end
		XYZ = { X+DisArray [i]*math.sin(math.pi/180*DirArray[i]) , Y+20 , Z+DisArray [i]*math.cos(math.pi/180*DirArray[i]) }
		if CheckLine( OwnerID() , XYZ[1] , XYZ[2] , XYZ[3] ) == false	then
			Earth[i] = Lua_DW_CreateObj("obj" , 101782, OwnerID() )
		else
			XYZ[2] = GetHeight( XYZ[1] , XYZ[2] , XYZ[3] )+5;
			Earth[i] = Lua_DW_CreateObj("xyz" , 101782, XYZ ,1 , ReadRoleValue(OwnerID() , EM_RoleValue_Dir) )
		end
		BeginPlot( Earth[i]   , "LuaS_Discowood_CheckPeace" , 0)
	end

end


function LuaS_101268_1()
	if	CheckBuff(TargetID(),503108)	or
		CheckBuff(TargetID(),503434)	then
		return false
	else
		return true
	end
end