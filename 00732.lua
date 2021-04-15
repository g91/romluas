
------------下面是依旗標召喚怪物-----------------------
function LuaS_Discowood_FlagShowMonster( MonsterID , AttackTarget , FlagID , FlagNum , Lua )
	local ID = CreateObjByFlag( MonsterID , FlagID , FlagNum , 1 )
	WriteRoleValue( ID , EM_RoleValue_PID , FlagID )
	if Lua~=nil then
		BeginPlot( ID , lua, 0 )
	end
	AddToPartition( ID ,    0 )	--加進舞台
	if AttackTarget ~= "NoTarget" then
		SetAttack( ID , AttackTarget)	--下令攻擊
	end
	return ID
end
-----------下面是依座標召喚怪物---------------------
function LuaS_Discowood_CreateMonster( MonsterID , AttackTarget , Show_X , Show_Y , Show_Z , Show_Dir , Lua , Camp) --怪物ID , 要打的目標 , X , Y , Z , Dir , 在創造之後跑的script
	local ID = CreateObj( MonsterID , Show_X, Show_Y, Show_Z, Show_Dir , 1)	--創造
	if Camp ~= nil then
		SetRoleCamp( ID , Camp )
	end
	if Lua~=nil then
		BeginPlot( ID , lua, 0 )
	end
	AddToPartition( ID ,    0 )	--加進舞台
	if AttackTarget ~= nil then
		SetAttack( ID , AttackTarget)	--下令攻擊
	end
	return ID
end
----------若是8.5秒內未進入戰鬥狀態就會消失-------------
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
