
--��function�b���ɪ����ʸ��|����
function LuaS_103121_0()
	local EnemyList = {103123,103124}
	local RandOne = DW_Rand(table.getn(EnemyList))
	local RandTwo = 50+DW_Rand(50)
--���ͼĹ�ͪ��Ӿ԰�
	local Enemy = Lua_CreateObjByDir( OwnerID() , EnemyList[RandOne] , RandTwo , 0) 
	AddToPartition(Enemy,0)
	SetAttack(OwnerID(),Enemy)
--�۰ʼ@���ǻ�
	BeginPlot(Enemy,"LuaS_103121_1",0)
end
--�Ĥ@���s�X�Ӫ�����@��(�|��ǥ�)
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
--�ĤG���s�X�Ӫ�����@��
function LuaS_103121_2()
	while true do
		sleep(20)
		if	HateListCount( OwnerID())==0	then
			DelObj(OwnerID())
		end
	end
end

--��function�b���ɪ����ʸ��|����
function LuaS_103123_0()
	local EnemyList = {103121,103122}
	local RandOne = DW_Rand(table.getn(EnemyList))
	local RandTwo = 50+DW_Rand(50)
--���ͼĹ�ͪ��Ӿ԰�
	local Enemy = Lua_CreateObjByDir( OwnerID() , EnemyList[RandOne] , RandTwo , 0) 
	AddToPartition(Enemy,0)
	SetAttack(OwnerID(),Enemy)
	BeginPlot(Enemy,"LuaS_103121_1",0)
end