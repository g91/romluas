function LuaS_420968_CheckItemAndCallMonster()
	if ( CountBodyItem( OwnerID() , 201974 ) >= 1 ) then
		DelBodyItem( OwnerID(), 201974 , 1 )
		ScriptMessage( OwnerID(), OwnerID(), 2 ,GetString("SAY_420968_0"),1)--守衛巢穴的蕈人打算阻止你……
		local Cap = CreateObj ( 100725, ReadRoleValue( OwnerID(), EM_RoleValue_X) , ReadRoleValue( OwnerID(), EM_RoleValue_Y) ,     ReadRoleValue( OwnerID(), EM_RoleValue_Z) , 0 , 1 ) --叫保安!
		AddToPartition( Cap ,    0 ) --把保安放進場景
		WriteRoleValue ( Cap , EM_RoleValue_PID , OwnerID()  )
		BeginPlot( Cap , "LuaS_420968_Dis", 0 )	--命令保安執行程序
		return true
	else
		ScriptMessage( OwnerID(), OwnerID() , 1 ,GetString("SAY_420968_1"),1)--沒有毛蛙可以放了！
		return false
	end
end


function LuaS_420968_Dis()
	while true do
		Sleep(50)
		local HP = ReadRoleValue ( OwnerID() , EM_RoleValue_HP )
		local MaxHP = ReadRoleValue ( OwnerID() , EM_RoleValue_MaxHP )
		local Player = ReadRoleValue ( OwnerID() , EM_RoleValue_AttackTargetID)

		if HP == MaxHP  then
			if CheckID(Player) then

			else
				DelObj(OwnerID())--把自己刪掉
			end
		end
	end
end