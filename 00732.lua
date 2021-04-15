
------------�U���O�̺X�Хl��Ǫ�-----------------------
function LuaS_Discowood_FlagShowMonster( MonsterID , AttackTarget , FlagID , FlagNum , Lua )
	local ID = CreateObjByFlag( MonsterID , FlagID , FlagNum , 1 )
	WriteRoleValue( ID , EM_RoleValue_PID , FlagID )
	if Lua~=nil then
		BeginPlot( ID , lua, 0 )
	end
	AddToPartition( ID ,    0 )	--�[�i�R�x
	if AttackTarget ~= "NoTarget" then
		SetAttack( ID , AttackTarget)	--�U�O����
	end
	return ID
end
-----------�U���O�̮y�Хl��Ǫ�---------------------
function LuaS_Discowood_CreateMonster( MonsterID , AttackTarget , Show_X , Show_Y , Show_Z , Show_Dir , Lua , Camp) --�Ǫ�ID , �n�����ؼ� , X , Y , Z , Dir , �b�гy����]��script
	local ID = CreateObj( MonsterID , Show_X, Show_Y, Show_Z, Show_Dir , 1)	--�гy
	if Camp ~= nil then
		SetRoleCamp( ID , Camp )
	end
	if Lua~=nil then
		BeginPlot( ID , lua, 0 )
	end
	AddToPartition( ID ,    0 )	--�[�i�R�x
	if AttackTarget ~= nil then
		SetAttack( ID , AttackTarget)	--�U�O����
	end
	return ID
end
----------�Y�O8.5�����i�J�԰����A�N�|����-------------
function LuaS_Discowood_CheckPeace()
	while true do
		sleep(85)
		local AttackTarget = ReadRoleValue(OwnerID() , EM_RoleValue_AttackTargetID )
		if AttackTarget == 0 then
			DelObj(OwnerID())
			break
		end
	end	
end
