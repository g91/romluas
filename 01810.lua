function bk_127_103872()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------
	local start = OwnerID()--------�������	
	local x=0---------�԰��p�ɾ�
	local gatime=0
	local gg=0
	local CombatBegin=0
	local door=0
	local s=0
	local y=0
	local s1=0
	local s2=0
	local s3=0
	local afdoor = CreateObjByFlag(103871,780597,2,1)
	SetModeEx( afdoor , EM_SetModeType_Gravity, false) ---���O
	SetModeEx( afdoor , EM_SetModeType_Mark, false)
	SetModeEx( afdoor , EM_SetModeType_HideName, false)
	SetModeEx( afdoor , EM_SetModeType_ShowRoleHead, false)
	SetModeEx( afdoor , EM_SetModeType_NotShowHPMP, false)
	SetModeEx( afdoor , EM_SetModeType_Obstruct, true)   -----����
	SetModeEx( afdoor , EM_SetModeType_Strikback, false) ---����
	SetModeEx( afdoor , EM_SetModeType_Move, false) ---����	
	SetModeEx( afdoor , EM_SetModeType_Fight, false) ---�i���
	SetModeEx( afdoor , EM_SetModeType_SearchenemyIgnore, false) 
	SetModeEx( afdoor , EM_SetModeType_Searchenemy, false)
	SetModeEx( afdoor , EM_SetModeType_Show, true)
	BeginPlot( afdoor ,"bk_127_103825",0)
	AddToPartition( afdoor , RoomID )
	local boss = CreateObjByFlag(103869,780597,3,1)------------------------------�Хߤ�
	SetModeEx( boss , EM_SetModeType_Gravity, true) ---���O
	SetModeEx( boss , EM_SetModeType_Mark, true)
	SetModeEx( boss , EM_SetModeType_HideName, true)
	SetModeEx( boss , EM_SetModeType_ShowRoleHead, true)
	---SetModeEx( boss , EM_SetModeType_NotShowHPMP, true)
	SetModeEx( boss , EM_SetModeType_Obstruct, false)   -----����
	SetModeEx( boss , EM_SetModeType_Strikback, true) ---����
	SetModeEx( boss , EM_SetModeType_Move, true) ---����	
	SetModeEx( boss , EM_SetModeType_Fight, true) ---�i���
	SetModeEx( boss , EM_SetModeType_SearchenemyIgnore, true) 
	SetModeEx( boss , EM_SetModeType_Searchenemy, true)
	SetModeEx( boss , EM_SetModeType_Show, true)
	AddToPartition( boss , RoomID )
	BeginPlot( boss ,"bk_127_103869",0)
	SetPlot( boss , "dead" , "bk_127_103869_dead" , 10 )
	WriteRoleValue(start,EM_RoleValue_PID,boss)---- �b������W��J����id
	WriteRoleValue(boss ,EM_RoleValue_PID,start)	---- �b�����W��J���id
	local Maxhp=ReadRoleValue( boss , EM_RoleValue_MaxHP )
	WriteRoleValue(start ,EM_RoleValue_Register4,Maxhp)--------------------------------������������q
	while 1 do 
		sleep(10)
		x=ReadRoleValue(start,EM_RoleValue_Register1)
		y=ReadRoleValue(start,EM_RoleValue_Register5)
		if x==1 then --�����b�԰�����
			if CombatBegin==0 then 
				door = CreateObjByFlag(103871,780597,1,1)
				SetModeEx( door , EM_SetModeType_Gravity, false) ---���O
				SetModeEx( door , EM_SetModeType_Mark, false)
				SetModeEx( door , EM_SetModeType_HideName, false)
				SetModeEx( door , EM_SetModeType_ShowRoleHead, false)
				SetModeEx( door , EM_SetModeType_NotShowHPMP, false)
				SetModeEx( door , EM_SetModeType_Obstruct, true)   -----���O
				SetModeEx( door , EM_SetModeType_Strikback, false) ---����
				SetModeEx( door , EM_SetModeType_Move, false) ---����	
				SetModeEx( door , EM_SetModeType_Fight, false) ---�i���
				SetModeEx( door , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( door , EM_SetModeType_Searchenemy, false)
				SetModeEx( door , EM_SetModeType_Show, true)
				BeginPlot( door ,"bk_127_103825",0)
				AddToPartition( door , RoomID )
				
				CombatBegin=1
				
			end	
			if y==1 then
				WriteRoleValue(start, EM_RoleValue_Register5,0)
				s=ReadRoleValue(start,EM_RoleValue_Register2)------------�^���L�̥����
				s1 = ReadRoleValue(start,EM_RoleValue_Register7)
				s2 = ReadRoleValue(start,EM_RoleValue_Register8)
				s3 = ReadRoleValue(start,EM_RoleValue_Register9)
				if s== 1 then 
					local Nowhp=ReadRoleValue(start,EM_RoleValue_Register3)
					WriteRoleValue(boss, EM_RoleValue_HP,Nowhp)
					WriteRoleValue(boss ,EM_RoleValue_Register3,0)
					SetModeEx( boss , EM_SetModeType_Fight, true) ---�i���
					SetModeEx( boss , EM_SetModeType_Mark, true)
					CancelBuff(boss , 506546)----------------------------------����m�X��
				elseif s==2 then 
					local Nowhp=ReadRoleValue(start,EM_RoleValue_Register3)
					local Maxhp=ReadRoleValue( start , EM_RoleValue_Register4)----------Ū�������̤j����q
					local HPPercent = Nowhp /  Maxhp	--��q�ʤ���
					if HPPercent <= 0.9 then
						HPPercent=HPPercent+0.1
						Nowhp=Maxhp*HPPercent
						WriteRoleValue( boss, EM_RoleValue_HP,Nowhp)
						WriteRoleValue(boss ,EM_RoleValue_Register3,0)
						SetModeEx( boss , EM_SetModeType_Fight, true) ---�i���
						SetModeEx( boss , EM_SetModeType_Mark, true)
						CancelBuff(boss , 506546)----------------------------------����m�X��
					elseif HPPercent > 0.9 then 
						WriteRoleValue( boss, EM_RoleValue_HP,Maxhp)
						WriteRoleValue(boss ,EM_RoleValue_Register3,0)
						SetModeEx( boss , EM_SetModeType_Fight, true) ---�i���
						SetModeEx( boss , EM_SetModeType_Mark, true)
						CancelBuff(boss , 506546)----------------------------------����m�X��
					end
				end
				WriteRoleValue(start, EM_RoleValue_Register2,0)	
				Delobj(s1)
				Delobj(s2)
				Delobj(s3)
			end
			gatime=gatime+1 ------�g�ɮɶ�
			if gatime >= 600 then 
				if gg==0 then 
					AddBuff(boss, 506335 , 1 , -1 )
					ScriptMessage( boss , -1 , 2 , "[SC_103170_03]" , 1 )
					gg=1
				end
			end
		elseif x==2 then --���a���`�����}�԰�
			sleep(50)
			s1 = ReadRoleValue(start,EM_RoleValue_Register7)
			s2 = ReadRoleValue(start,EM_RoleValue_Register8)
			s3 = ReadRoleValue(start,EM_RoleValue_Register9)
			boss = CreateObjByFlag(103869,780597,3,1)
			AddToPartition( boss , RoomID )
			WriteRoleValue( boss, EM_RoleValue_PID,start)
			BeginPlot( boss ,"bk_127_103869",0)---------------------------------���@���Ҧ�
			SetPlot( boss , "dead" , "bk_127_103869_dead" , 10 )
			x=0
			sleep(10)
			Delobj(s1)
			Delobj(s2)
			Delobj(s3)
			DelObj(door)
			WriteRoleValue(start, EM_RoleValue_Register1,0)
			gg=0
			gatime=0
			CombatBegin=0
		elseif x==3 then --���a�����`�]���`�@��
			s1 = ReadRoleValue(start,EM_RoleValue_Register7)
			s2 = ReadRoleValue(start,EM_RoleValue_Register8)
			s3 = ReadRoleValue(start,EM_RoleValue_Register9)
			Delobj(s1)
			Delobj(s2)
			Delobj(s3)
			Delobj(afdoor)----------------���}�q���ƥ�����
			Delobj(door)
			WriteRoleValue(start, EM_RoleValue_Register1,3)	
			gg=0
			gatime=0
			CombatBegin=0
		end	
	end		
end
function bk_127_103869()--------------������ai
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local boss = OwnerID()--------�������	
	local CombatBegin=0
	local skill1={495531,495532,495534}------1.���F���� 2. �G�k�i
	local SkillIndex=0
	local skilllv={0,5,20}----�ۦ��¤O
	local skilltime=0------�ޯ�I��ɶ�
	local Luck=0 -----�p��X����ۦ�
	local Play_Chose={}-----------��J�������
	local skplayer=0 -------�ޯ�I��ؼ�
	local mob=0  ----���q
	local mob1=0 ----�ɶ�
	local lp=0
	while 1 do 
		sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )   ------ ��M�ثe�������ؼ�
		local BossTarget=AttackTarget
		if HateListCount( boss ) ~= 0 then	---- �T�w�L�{�b�����H
			if CombatBegin==0 then
				CombatBegin=1
				WriteRoleValue(start ,EM_RoleValue_Register1,1)------------�g�J1����N������b�԰���
				ScriptMessage( OwnerID() , -1 , 2 , "[SC_103170_01]" , 1 )
			end
			mob=ReadRoleValue(boss,EM_RoleValue_Register3)
			if mob == 0 then
				mob1=mob1+1
				skilltime = skilltime+1
				if skilltime>= 8 then 
				Luck=DW_Rand(100)------------------- �üƨM�w�I��ۦ�
					if (Luck >= 0 and Luck < 33)  then
						SkillIndex = 1
						BossTarget = AttackTarget
						CastSpellLV( OwnerID() , BossTarget , Skill1[SkillIndex] , skilllv[SkillIndex] )
						sleep(20)
						skilltime=0 
					elseif (Luck >= 33 and Luck < 66) then	
						SkillIndex = 2-----------------------------------------���饴���ˮ`
						Play_Chose=DW_HateRemain(0)-----------------������H   ��0�N�� ���ư��D�Z
						kp=DW_Rand(table.getn(Play_Chose))
						if kp==0 then --------0 �N��̭��S���H ���٥�����
						end
						if kp~=0 then --------�ݥ����ӭ˷���
						BossTarget = Play_Chose[kp]		
						CastSpellLV( OwnerID() , BossTarget , Skill1[SkillIndex] , skilllv[SkillIndex] )
						sleep(20)
						end
						skilltime=0 
					elseif (Luck >= 66 and Luck < 101) then 
						SkillIndex = 3 -----------------------------------------���饴���ˮ`
						Play_Chose=DW_HateRemain(0)-----------------������H   ��0�N�� ���ư��D�Z
						kp=DW_Rand(table.getn(Play_Chose))
						if kp==0 then --------0 �N��̭��S���H ���٥�����
						end
						if kp~=0 then --------�ݥ����ӭ˷���
						BossTarget = Play_Chose[kp]		
						CastSpellLV( OwnerID() , BossTarget , Skill1[SkillIndex] , skilllv[SkillIndex] )
						sleep(20)
						end
						skilltime=0 
					end
				end	
				if mob1 >= 30 then 
					mob=1
					WriteRoleValue(boss ,EM_RoleValue_Register3,1)
					mob1=0
				end	
			end
			if mob == 1 then 
				ScriptMessage( OwnerID() , -1 , 2 , "[SC_103170_02]" , 1 )
				local NowHP = ReadRoleValue(OwnerID() , EM_RoleValue_HP )			
				local Temp = Lua_Davis_BornByMultilateral( 103870 , 3 , 25 )	--�b�ۤv���W�X4��
				WriteRoleValue( Temp[1] ,EM_RoleValue_PID, start)	--�g�JPID
				WriteRoleValue(start, EM_RoleValue_Register7,Temp[1])	
				SetPlot( Temp[1] , "dead" , "bk_127_103870_true" , 10 )
				BeginPlot( Temp[1] , "bk_127_103870_tu",20)---------------------------------�I��k�N�@��
				SetAttack( Temp[1] , AttackTarget) -- �����e�i����
				----AddBuff(Temp[1], 506757 , 1 , -1 )
				WriteRoleValue( Temp[2] ,EM_RoleValue_PID, start)	--�g�JPID
				WriteRoleValue(start, EM_RoleValue_Register8,Temp[2])	
				SetPlot( Temp[2] , "dead" , "bk_127_103870_flase" , 10 )
				BeginPlot( Temp[2] , "bk_127_103870",20)---------------------------------�I��k�N�@��
				SetAttack( Temp[2] , AttackTarget) -- �����e�i����
				WriteRoleValue( Temp[3] ,EM_RoleValue_PID, start)	--�g�JPID
				WriteRoleValue(start, EM_RoleValue_Register9,Temp[3])	
				SetPlot( Temp[3] , "dead" , "bk_127_103870_flase" , 10 )
				BeginPlot( Temp[3] , "bk_127_103870",20)---------------------------------�I��k�N�@��
				SetAttack( Temp[3] , AttackTarget) -- �����e�i����
				NowHP = ReadRoleValue(OwnerID() , EM_RoleValue_HP )-------------------------Ū���{�b����q
				WriteRoleValue(start, EM_RoleValue_Register3,NowHP)-------------------1  �O���q
				AddBuff(boss, 506546 , 1 , -1 )---------�ܦ��z���S�Ĳy!
				SetModeEx( boss , EM_SetModeType_Fight, false) ---�i���
				SetModeEx( boss , EM_SetModeType_Mark, false)
				WriteRoleValue(boss ,EM_RoleValue_Register3,2)
				mob=2
			end
			
		elseif HateListCount( boss )  == 0 then    ----�԰����}
			if CombatBegin==1 then
				WriteRoleValue(start, EM_RoleValue_Register1,2)	
				sleep(50)
				DelObj(boss)
				CombatBegin=0
			end
		end
	end
end
function bk_127_103869_dead()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local boss=OwnerID()
	SetModeEx( boss , EM_SetModeType_Fight, true) ---�i���
	SetModeEx( boss , EM_SetModeType_Mark, true)
	CancelBuff(boss , 506546)----------------------------------����m�X��
	WriteRoleValue(start, EM_RoleValue_Register1,3)	
end
function bk_127_103870_true()--------------�p�Ǽ@��
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	WriteRoleValue(start, EM_RoleValue_Register5,1)	
	WriteRoleValue(start, EM_RoleValue_Register2,1)	
	Delobj(OwnerID())
end
function bk_127_103870_flase()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local caball = Lua_DW_CreateObj("obj",103888,OwnerID(),0)
	SetModeEx( caball , EM_SetModeType_Show, true) ----�q�X
	SetModeEx( caball , EM_SetModeType_Mark, false) ----�аO
	SetModeEx( caball , EM_SetModeType_Strikback, false) ---����
	SetModeEx( caball , EM_SetModeType_Move, false) ---����	
	SetModeEx( caball , EM_SetModeType_Fight, false) ---�i���
	SetModeEx( caball , EM_SetModeType_SearchenemyIgnore, false) ---���󤣷|�Q�j�M
	SetModeEx( caball , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
	SetModeEx( caball , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
	SetModeEx( caball , EM_SetModeType_Searchenemy, false)  ---���
	AddToPartition(caball , RoomID )
	CastSpellLv(caball,caball,495529,40)
	WriteRoleValue(caball, EM_RoleValue_Livetime,5)	---------------�s�b�ɶ�livetime
	WriteRoleValue(start, EM_RoleValue_Register5,1)
	WriteRoleValue(start, EM_RoleValue_Register2,2)	
	Delobj(OwnerID())
end
function bk_127_103870()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local sm=OwnerID()
	local skill1={495586,495587,495588}------1.�I���L�O 2. �G�ѦL�O3.���u�L�O
	local skilllv={2,2,2}----�ۦ��¤O
	local SkillIndex=0
	local Luck=0
	local Play_Chose={}
	local kp=0
	local ti=0
	while 1 do 
	sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )   ------ ��M�ثe�������ؼ�
		local BossTarget=AttackTarget
		ti=ti+1
		if ti>=5 then 
			Luck=DW_Rand(100)------------------- �üƨM�w�I��ۦ�
			if (Luck >= 0 and Luck < 33)  then
				SkillIndex = 1
				BossTarget = AttackTarget
				CastSpellLV( OwnerID() , BossTarget , Skill1[SkillIndex] , skilllv[SkillIndex] )
				sleep(20)
			elseif (Luck >= 33 and Luck < 66) then	
				SkillIndex = 2-----------------------------------------���饴���ˮ`
				Play_Chose=DW_HateRemain(0)-----------------������H   ��0�N�� ���ư��D�Z
				kp=DW_Rand(table.getn(Play_Chose))
				if kp==0 then --------0 �N��̭��S���H ���٥�����
				end
				if kp~=0 then --------�ݥ����ӭ˷���
				BossTarget = Play_Chose[kp]		
				CastSpellLV( OwnerID() , BossTarget , Skill1[SkillIndex] , skilllv[SkillIndex] )
				sleep(20)
				end
			elseif (Luck >= 66 and Luck < 101) then
				SkillIndex = 3-----------------------------------------���饴���ˮ`
				Play_Chose=DW_HateRemain(0)-----------------������H   ��0�N�� ���ư��D�Z
				kp=DW_Rand(table.getn(Play_Chose))
				if kp==0 then --------0 �N��̭��S���H ���٥�����
				end
				if kp~=0 then --------�ݥ����ӭ˷���
				BossTarget = Play_Chose[kp]		
				CastSpellLV( OwnerID() , BossTarget , Skill1[SkillIndex] , skilllv[SkillIndex] )
				sleep(20)
				end
			end
			ti=0
		end	
	end	
end
function bk_127_103870_tu()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local sm=OwnerID()
	local skill1={495655,495587,495655}------1.�I���L�O 2. �G�ѦL�O3.���u�L�O
	local skilllv={2,2,2}----�ۦ��¤O
	local SkillIndex=0
	local Luck=0
	local Play_Chose={}
	local kp=0
	local ti=0
	while 1 do 
	sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )   ------ ��M�ثe�������ؼ�
		local BossTarget=AttackTarget
		ti=ti+1
		if ti>=5 then 
			Luck=DW_Rand(100)------------------- �üƨM�w�I��ۦ�
			if (Luck >= 0 and Luck < 33)  then
				SkillIndex = 1
				BossTarget = AttackTarget
				CastSpellLV( OwnerID() , BossTarget , Skill1[SkillIndex] , skilllv[SkillIndex] )
				sleep(20)
			elseif (Luck >= 33 and Luck < 66) then	
				SkillIndex = 2-----------------------------------------���饴���ˮ`
				Play_Chose=DW_HateRemain(0)-----------------������H   ��0�N�� ���ư��D�Z
				kp=DW_Rand(table.getn(Play_Chose))
				if kp==0 then --------0 �N��̭��S���H ���٥�����
				end
				if kp~=0 then --------�ݥ����ӭ˷���
				BossTarget = Play_Chose[kp]		
				CastSpellLV( OwnerID() , BossTarget , Skill1[SkillIndex] , skilllv[SkillIndex] )
				sleep(20)
				end
			elseif (Luck >= 66 and Luck < 101) then
				SkillIndex = 3-----------------------------------------���饴���ˮ`
				Play_Chose=DW_HateRemain(0)-----------------������H   ��0�N�� ���ư��D�Z
				kp=DW_Rand(table.getn(Play_Chose))
				if kp==0 then --------0 �N��̭��S���H ���٥�����
				end
				if kp~=0 then --------�ݥ����ӭ˷���
				BossTarget = Play_Chose[kp]		
				CastSpellLV( OwnerID() , BossTarget , Skill1[SkillIndex] , skilllv[SkillIndex] )
				sleep(20)
				end
			end
			ti=0
		end	
	end	
end

