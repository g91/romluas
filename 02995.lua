--�a����Ĩۣ�H--107860--
--�� ����3�H�� ��--

function Nana_157_jelly_group()
	local Zone = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID)
	local ZoneID = { 157 , 158 , 159} --Raid , Normal, easy
	local Monster = { 107884 , 108219 , 108228 } --��Ħ�p����
	local dis = 5	--�i�ݪ���j�p�վ�Z���e��
	local count = 5 --�}�C���j�p�A��J3 �|�O 3*3 ���}�C�F���L�]����ƥ������_�ơA�ҥH��J 4 �|�O 5*4 ���}�C�C
	local checktime = 10 --�P�_���ɶ����Z�A�ƭȷU�C�A�P�_���W�v�U���A�U�۵M�A���Ӫ��귽�]�U�h
	local ReviveTime = 600000  --��}�C����������������ɡA�i��}�C���m���ʧ@�A�p�G�� -1 �A�N�|���� OwnerID() �]�w�����ͮɶ����m
	local circle = 6000  --�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local SkillRND =  Rand( 100 )+1	-- ���Ͷü�
	if SkillRND <= 100 and SkillRND > 80 then
		checktime =	checktime + 1
	elseif SkillRND <= 80 and SkillRND > 60 then
		checktime = checktime + 2		
	elseif  SkillRND <= 60 and SkillRND > 40 then
		checktime = checktime + 3
	elseif SkillRND <= 40 and SkillRND > 20 then
		checktime = checktime + 4
	elseif SkillRND <= 20 and SkillRND > 0 then
		checktime = checktime + 5
	end	
	local ObjMatrix ={}

	for i = 1 , #ZoneID do
		if Zone == ZoneID[i] then	
			ObjMatrix[1] = LuaFunc_CreateNPCByMatrix( Monster[i] , Matrix , 1 , 0 )
			ObjMatrix[2] = LuaFunc_CreateNPCByMatrix( Monster[i] , Matrix , 3 , 1 )
			ObjMatrix[3] = LuaFunc_CreateNPCByMatrix( Monster[i] , Matrix , 2 , -1 )
			break
		end
	end

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix )
	BeginPlot( OwnerID() , "Nana_157_jelly_walk" , 0 )
end
function Nana_157_jelly_walk()
	sleep( 10 )
	BeginPlot( OwnerID() , "Nana_jelly_group" , 0 )
end

------------------------------------------------------------------------------------------------------
--�p�Ǭ���
------------------------------------------------------------------------------------------------------
function Lua_na_107878_skill1() --���s���eĵ�٧L�A���q�C��1/3�ɡA�|�D��
	local Owner = OwnerID() --ĵ�٧L
	local Target = TargetID() --���a
	local NPC = SearchRangeNPC( Owner , 200)
	for i = 0 , #NPC do
		if ReadRoleValue( NPC[i] , EM_RoleValue_OrgID) == 107879 or ReadRoleValue( NPC[i] , EM_RoleValue_OrgID) == 107878 then
			SetAttack( NPC[i]  ,HateListInfo(Owner , 0 , EM_HateListInfoType_GItemID ) ) 
		end
	end
end


function Lua_na_107878_reset() --���m�Ǫ��������
--	DebugMsg( 0 , 0 , "CLEAR")
	ClearHateList( OwnerID() ,-1)
end


function Lua_na_107884_skill1() --�p�������z
	local Owner = OwnerID()
--	Say( Owner , "ABC")
	DebugMsg( 0,0,"CDE")
	killId( Owner , Owner)
end
