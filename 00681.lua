function LuaS_420968_CheckItemAndCallMonster()
	if ( CountBodyItem( OwnerID() , 201974 ) >= 1 ) then
		DelBodyItem( OwnerID(), 201974 , 1 )
		ScriptMessage( OwnerID(), OwnerID(), 2 ,GetString("SAY_420968_0"),1)--�u�ñ_�ު����H�������A�K�K
		local Cap = CreateObj ( 100725, ReadRoleValue( OwnerID(), EM_RoleValue_X) , ReadRoleValue( OwnerID(), EM_RoleValue_Y) ,     ReadRoleValue( OwnerID(), EM_RoleValue_Z) , 0 , 1 ) --�s�O�w!
		AddToPartition( Cap ,    0 ) --��O�w��i����
		WriteRoleValue ( Cap , EM_RoleValue_PID , OwnerID()  )
		BeginPlot( Cap , "LuaS_420968_Dis", 0 )	--�R�O�O�w����{��
		return true
	else
		ScriptMessage( OwnerID(), OwnerID() , 1 ,GetString("SAY_420968_1"),1)--�S�����i�H��F�I
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
				DelObj(OwnerID())--��ۤv�R��
			end
		end
	end
end