--�a����Ĩۣ�H--107860--
--�� ��������3�H�� ��--

function Nana_160_slave_group()
	local Zone = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID)
	local ZoneID = { 160, 161 , 162 } --Raid , Normal, easy
	local Monster = { 	[1] ={108210 , 107957 , 107957 , 108208 } , 
				[2] ={108355 , 108351 , 108351 , 108353 } , 								
				[3] ={108370 , 108366 , 108366 , 108368 } 	} -- ������ڷ��� / ������ڥ���/ ������ڥ��� / �춥�t�����K

	local dis = 15	--�i�ݪ���j�p�վ�Z���e��
	local count = 3 --�}�C���j�p�A��J3 �|�O 3*3 ���}�C�F���L�]����ƥ������_�ơA�ҥH��J 4 �|�O 5*4 ���}�C�C
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
			ObjMatrix[1] = LuaFunc_CreateNPCByMatrix( Monster[i][1] , Matrix , 1 , 0 )  --������ڷ���
			ObjMatrix[2] = LuaFunc_CreateNPCByMatrix( Monster[i][2] , Matrix , 2 , 1 ) -- ������ڥ���
			ObjMatrix[3] = LuaFunc_CreateNPCByMatrix( Monster[i][3] , Matrix , 2 , -1 ) -- ������ڥ���
			ObjMatrix[4] = LuaFunc_CreateNPCByMatrix( Monster[i][4] , Matrix , 3 , 0 ) -- �춥�t�����K
			break
		end
	end

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix )
	BeginPlot( OwnerID() , "Nana_160_slave_walk" , 0 )
end
function Nana_160_slave_walk()
	sleep( 10 )
	BeginPlot( OwnerID() , "Nana_160_slave_group" , 0 )
end



function Nana_160_Uro_group()
	local Zone = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID)
	local ZoneID = { 160, 161 , 162 } --Raid , Normal, easy
	local Monster = { 	[1] ={108208 , 108289 } , 
				[2] ={108353 , 108357 } , 								
				[3] ={108368 , 108372 } 	} -- �춥�t�����K/ ���߰�¦�u�K/ ���߰�¦�u�K/ ���߰�¦�u�K
	local dis = 15	--�i�ݪ���j�p�վ�Z���e��
	local count = 3 --�}�C���j�p�A��J3 �|�O 3*3 ���}�C�F���L�]����ƥ������_�ơA�ҥH��J 4 �|�O 5*4 ���}�C�C
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
			ObjMatrix[1] = LuaFunc_CreateNPCByMatrix( Monster[i][1]  , Matrix , 1 , 0 )  --�춥�t�����K
			ObjMatrix[2] = LuaFunc_CreateNPCByMatrix( Monster[i][2] , Matrix , 2 , 1 ) -- ���߰�¦�u�K
			ObjMatrix[3] = LuaFunc_CreateNPCByMatrix( Monster[i][2], Matrix , 2 , -1 ) -- ���߰�¦�u�K
			ObjMatrix[4] = LuaFunc_CreateNPCByMatrix( Monster[i][2], Matrix , 2 , 0 ) -- ���߰�¦�u�K
			break
		end
	end
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix )
	BeginPlot( OwnerID() , "Nana_160_Uro_walk" , 0 )
end
function Nana_160_Uro_walk()
	sleep( 10 )
	BeginPlot( OwnerID() , "Nana_160_Uro_group" , 0 )
end

------------------------------------------------------------------------------------------------------
--�p�Ǭ���
------------------------------------------------------------------------------------------------------

function Nana_160_108288_attack() --���ߤu�K�i�J�԰���X�{�T�����߰�¦�u�K
	local Owner = OwnerID() --���ߤu�K
	local MonOrg = {	[160] = 108289 ,
				[161] =	108357 , 
				[162] = 108372		}
	local Zone = ReadRoleValue( Owner , EM_RoleValue_ZoneID)
	local RoomID = ReadRoleValue( Owner , EM_RoleValue_RoomID)
	local Monster = {} 
	local x,y,z,dir = DW_Location( Owner )
	for i = 1, 3 do
		local Angle = 100+40*i
		local Nx,Ny,Nz,Ndir = DW_NewLocation(Angle,30,x,y,z,Dir)
		Monster[i] = CreateObj( MonOrg[Zone] , Nx, Ny, Nz, Ndir, 1 ) --���߰�¦�u�K
		SetModeEx( Monster[i], EM_SetModeType_Mark, true )	--�аO
		AddToPartition( Monster[i], RoomID )
		BeginPlot( Monster[i] , "Nana_160_108289_Check" , 50)
	end
end
		

function Nana_160_108289_Check() --���߰�¦�u�K�A�ˬd�O�_�b�԰���
	local Owner = OwnerID()
	while true do
		if ReadRoleValue( Owner , EM_RoleValue_IsAttackMode ) == 0 then  --�P�_�O�_�i�J�԰� 1= �O 0= �_
			DelObj( Owner )
		end
		sleep(10)
	end
end


function Lua_160_Uro_heal_check() --��ù���ߤu�K�A�v¡���ˬd�P��
	local Owner = OwnerID()
	local Target = TargetID()
	local Orgid = ReadRoleValue( Target , EM_RoleValue_OrgID )
	if Orgid == 108208 or Orgid == 108209 or Orgid == 108288 or Orgid == 108289 or Orgid == 103380 or Orgid == 107424 or Orgid == 107959 or Orgid == 107960 or Orgid == 107961 or Orgid == 107962 or Orgid == 107963 then
		return true 
	else
		return false
	end
end		


function Lua_160_108289_Buff() --
	local Owner = OwnerID()
	AddBuff( Owner , 624987 , 0 , -1) 
end