
--此function在平時的移動路徑執行
function LuaS_103121_0()
	local EnemyList = {103123,103124}
	local RandOne = DW_Rand(table.getn(EnemyList))
	local RandTwo = 50+DW_Rand(50)
--產生敵對生物來戰鬥
	local Enemy = Lua_CreateObjByDir( OwnerID() , EnemyList[RandOne] , RandTwo , 0) 
	AddToPartition(Enemy,0)
	SetAttack(OwnerID(),Enemy)
--自動劇情傳遞
	BeginPlot(Enemy,"LuaS_103121_1",0)
end
--第一隻叫出來的執行劇情(會找怪打)
function LuaS_103121_1()
	local EnemyList = {}
	while true do
		sleep(30)
		if	ReadRoleValue(OwnerID(),EM_RoleValue_IsAttackMode)==0	then
			EnemyList = SearchRangeNPC ( OwnerID() , 200 )
			for i= 0,table.getn(EnemyList),1 do
				if	CheckRelation( OwnerID() , EnemyList[i] , EM_CheckRelationType_Attackable )==true 	then
					SetAttack(OwnerID(),EnemyList[i])
					--BeginPlot(EnemyList[i],"LuaS_103121_2",0)
					break
				end
			end
			DelObj(OwnerID())
		end
	end
end
--第二隻叫出來的執行劇情
function LuaS_103121_2()
	while true do
		sleep(20)
		if	HateListCount( OwnerID())==0	then
			DelObj(OwnerID())
		end
	end
end

--此function在平時的移動路徑執行
function LuaS_103123_0()
	local EnemyList = {103121,103122}
	local RandOne = DW_Rand(table.getn(EnemyList))
	local RandTwo = 50+DW_Rand(50)
--產生敵對生物來戰鬥
	local Enemy = Lua_CreateObjByDir( OwnerID() , EnemyList[RandOne] , RandTwo , 0) 
	AddToPartition(Enemy,0)
	SetAttack(OwnerID(),Enemy)
	BeginPlot(Enemy,"LuaS_103121_1",0)
end