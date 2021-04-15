--703115
function Lua_na_166_red_effect()	--�ĦX�˸m����l�@�� 108524 / 108542 / 108553
	local Owner = OwnerID()
	AddBuff( Owner , 625263 , 0 , -1 )
	BeginPlot( Owner, "Lua_na_166_red_effect_1" , 0 )
end

function Lua_na_166_red_effect_1() --�ĦX�˸m�缾�a�y���ˮ`
	local Owner = OwnerID()
	while true do
		SysCastSpellLv( Owner , Owner , 851489 , 0 )
		sleep(30)
	end
end

function Lua_166_equipment_dead()  --�ĦX�˸m���`
	local Owner = OwnerID()
	local Zone = ReadRoleValue( Owner, EM_RoleValue_ZoneID)
	local Monster =	{	[166] = { 108521 , 108522 } , 
				[167] = { 108540 , 108541 },
				[168] = { 108551 , 108552 } 	}
	local x,y,z,dir=DW_Location(OwnerID());--�ھڪ����m
	local Npc = SearchRangeNPC( Owner , 20)
	local Room = ReadRoleValue( Owner, EM_RoleValue_RoomID)
	
	
	for i = 0 , #Npc do
		DeBugMsg( 0 , 0 , #Npc)
		if ReadRoleValue( Npc[i] , EM_RoleValue_OrgID) == 123331 then
			local Obj=CreateObj(Monster[Zone][1] , x , y , z , dir , 1)
			AddToPartition(Obj,Room);
			DelObj( Npc[i] )
			break
		elseif ReadRoleValue( Npc[i] , EM_RoleValue_OrgID) == 123332 then 
			local Obj=CreateObj(Monster[Zone][2] , x , y , z , dir , 1 )
			AddToPartition(Obj,Room);
			DelObj( Npc[i] )
			break
		end
	end
	return true
end 

function Lua_na_166_attack_01() --�d�F�����ʧ@
	local Owner = OwnerID()
	local R1 = DW_Rand(30)
	AddBuff( Owner , 625186 , 0 , -1 )
	Sleep(R1)
	while CheckBuff(Owner , 625186 ) == true do
		local R = DW_Rand(20)
		if R < 2 then
			PlayMotion( Owner , ruFUSION_ACTORSTATE_CAST_INSTANT )
		elseif R < 6 then
			PlayMotion( Owner ,ruFUSION_ACTORSTATE_BUFF_SP01)
		else
			PlayMotion( Owner ,ruFUSION_ACTORSTATE_ATTACK_UNARMED)
		end
		sleep(25)
	end
end

function Lua_na_166_attack_02()  --�d�F�若��
	local Owner = OwnerID()
	local R1 = DW_Rand(30)
	AddBuff( Owner , 625186 , 0 , -1 )
	Sleep(R1)
	while CheckBuff(Owner , 625186 ) == true do
		local R = DW_Rand(20)
		if R < 1 then
			PlayMotion( Owner ,ruFUSION_ACTORSTATE_PARRY_1H)
		elseif R < 4 then
			PlayMotion( Owner , ruFUSION_ACTORSTATE_CAST_SP01)
		elseif R < 6 then
			PlayMotion( Owner , ruFUSION_ACTORSTATE_CAST_INSTANT )
		elseif R < 8 then
			PlayMotion( Owner ,ruFUSION_ACTORSTATE_BUFF_SP01)
		else
			PlayMotion( Owner ,ruFUSION_ACTORSTATE_ATTACK_UNARMED)
		end
		sleep(25)
	end
end


function Lua_na_166_Scout()  --���J����
	local Owner = OwnerID()
	addbuff( Owner , 625187 , 0 , -1 )
end


--101823 �a����Ĩۣ�H
function na_166_walkP1()
	local Owner = OwnerID()
	local Zone = ReadRoleValue( Owner , EM_RoleValue_ZoneID)
	local Monster =	{	[166] = { 108443 , 108522 } , 
			  	[167] = { 108533 , 108541 } ,
				[168] = { 108544 , 108552 }	}  --�d�F�j�ƨ��d�L / ���T�ĦX������
	local dis = 15  --�i�ݪ���j�p�վ�Z���e��
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
	elseif SkillRND <= 60 and SkillRND > 40 then
		checktime = checktime + 3
	elseif SkillRND <= 40 and SkillRND > 20 then
		checktime = checktime + 4
	elseif SkillRND <= 20 and SkillRND > 0 then
		checktime = checktime + 5
	end	
	local ObjMatrix ={}
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix( Monster[Zone][1], Matrix , 1 , 0 )
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix( Monster[Zone][2] , Matrix , 3 , 1 )

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix )
	BeginPlot( Owner , "na_166_walk01" , 0 )
end

function na_166_walk01()
	sleep( 10 )
	BeginPlot( OwnerID() , "na_166_walkP1" , 0 )
end
	

function Lua_na_166_Scout_trap() --�����A�b���J���䲣��6�ӳ���
	local Owner = OwnerID()
	local RoomID = ReadRoleValue( Owner, EM_RoleValue_RoomID) --�T�{���A�������y
	local Obj = Role:new( Owner )
	local BaseX = Obj :X()
	local BaseY = Obj :Y()
	local BaseZ = Obj :Z()
	local BaseDir = Obj :Dir()
	local NPCGroup = {}
	local X = { 6 }-- �X�䫬
	local dis = { 20 } -- �Z����ߪ��Z��
	local Count = 1

	for i = 1 , #X do
		for j = 1 , X[i] , 1 do
			NPCGroup[Count] = CreateObj( 108555, BaseX-dis[i]*math.cos(math.pi*2*(j/X[i])) , BaseY , BaseZ+dis[i]*math.sin(math.pi*2*(j/X[i])) , BaseDir , 1 )
			WriteRoleValue( NPCGroup[Count] , EM_RoleValue_PID , Count )
			Count = Count + 1
		end
	end
	for i = 1 , #NPCGroup do
		SetModeEx( NPCGroup[i] , EM_SetModeType_Strikback , false )--����
		SetModeEx( NPCGroup[i] , EM_SetModeType_SearchenemyIgnore , false )--�Q�j�M
		SetModeEx( NPCGroup[i] , EM_SetModeType_Obstruct , false )--����
		SetModeEx( NPCGroup[i] , EM_SetModeType_Mark , false )--�аO
		SetModeEx( NPCGroup[i] , EM_SetModeType_Move , true )--����
		SetModeEx( NPCGroup[i], EM_SetModeType_Gravity, true )--���O
		SetModeEx( NPCGroup[i] , EM_SetModeType_Searchenemy , false )--����
		SetModeEx( NPCGroup[i] , EM_SetModeType_HideName , true )--�W��
		SetModeEx( NPCGroup[i] , EM_SetModeType_ShowRoleHead , false )--�Y����
		SetModeEx( NPCGroup[i] , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( NPCGroup[i] , EM_SetModeType_Drag , false )--���O
		SetModeEx( NPCGroup[i] , EM_SetModeType_Show , true )--���
		Sleep(2)
		AdjustFaceDir( NPCGroup[i] , Owner , 0 ) 
		AddToPartition( NPCGroup[i] , RoomID )
	end
end

function Lua_na_166_Scout_trap2()  --�������᪺ͫ�@��
	local Owner = OwnerID()
	Sleep(10)
	Castspell( Owner, Owner, 851494)
	PlayMotionEX( Owner, ruFUSION_ACTORSTATE_DYING, ruFUSION_ACTORSTATE_DEAD)
	sleep(10)
	DelObj( Owner)
end 


function Lua_na_166_meteor_search()
	local Owner = OwnerID()
	local Player = SearchRangePlayer( Owner , 100)
--	Say( Owner , "Player = "..#Player )
	local R = Rand(#Player)
	FaceObj( Owner , Player[R] )
	SysCastSpellLV( Owner , Player[R] , 851500 , 0 ) --�ᬵ�u	
end