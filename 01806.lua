function bk_127_103830()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------
	local start = OwnerID()--------�������	
	local x=0---------�԰��p�ɾ�
	local gatime=0
	local gg=0
	local CombatBegin=0
	local door=0
	local afdoor = CreateObjByFlag(103822,780613,1,1)
	SetModeEx( afdoor , EM_SetModeType_Gravity, false) ---���O
	SetModeEx( afdoor , EM_SetModeType_Mark, false)
	SetModeEx( afdoor , EM_SetModeType_HideName, false)
	SetModeEx( afdoor , EM_SetModeType_ShowRoleHead, false)
	SetModeEx( afdoor , EM_SetModeType_NotShowHPMP, false)
	SetModeEx( afdoor , EM_SetModeType_Obstruct, true)   -----���O
	SetModeEx( afdoor , EM_SetModeType_Strikback, false) ---����
	SetModeEx( afdoor , EM_SetModeType_Move, false) ---����	
	SetModeEx( afdoor , EM_SetModeType_Fight, false) ---�i���
	SetModeEx( afdoor , EM_SetModeType_SearchenemyIgnore, false) 
	SetModeEx( afdoor , EM_SetModeType_Searchenemy, false)
	SetModeEx( afdoor , EM_SetModeType_Show, true)
	BeginPlot( afdoor ,"bk_127_103825",0)
	AddToPartition( afdoor , RoomID )
	local boss = CreateObjByFlag(103171,780613,3,1)------------------------------�Хߤ�
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
	BeginPlot( boss ,"bk_127_103171",0)
	SetPlot( boss , "dead" , "bk_127_103171_dead" , 10 )
	WriteRoleValue(start,EM_RoleValue_PID,boss)---- �b������W��J����id
	WriteRoleValue(boss ,EM_RoleValue_PID,start)	---- �b�����W��J���id
	while 1 do 
		sleep(10)
		x=ReadRoleValue(start,EM_RoleValue_Register1)
		if x==1 then --�����b�԰�����
			if CombatBegin==0 then 
				door = CreateObjByFlag(103822,780613,2,1)
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
			gatime=gatime+1 ------�g�ɮɶ�
			if gatime >= 600 then 
				if gg==0 then 
					AddBuff(boss, 506335 , 1 , -1 )
					ScriptMessage( boss , -1 , 2 , "[SC_103171_04]" , 1 )
					gg=1
				end
			end
		elseif x==2 then --���a���`�����}�԰�
			sleep(50)
			boss = CreateObjByFlag(103171,780613,3,1)
			SetModeEx( boss , EM_SetModeType_Gravity, true) ---���O
			SetModeEx( boss , EM_SetModeType_Mark, true)
			SetModeEx( boss , EM_SetModeType_HideName, true)
			SetModeEx( boss , EM_SetModeType_ShowRoleHead, true)
			----SetModeEx( boss , EM_SetModeType_NotShowHPMP, true)
			SetModeEx( boss , EM_SetModeType_Obstruct, false)   -----����
			SetModeEx( boss , EM_SetModeType_Strikback, true) ---����
			SetModeEx( boss , EM_SetModeType_Move, true) ---����	
			SetModeEx( boss , EM_SetModeType_Fight, true) ---�i���
			SetModeEx( boss , EM_SetModeType_SearchenemyIgnore, true) 
			SetModeEx( boss , EM_SetModeType_Searchenemy, true)
			SetModeEx( boss , EM_SetModeType_Show, true)
			AddToPartition( boss , RoomID )
			WriteRoleValue( boss, EM_RoleValue_PID,start)
			BeginPlot( boss ,"bk_127_103171",0)---------------------------------���@���Ҧ�
			SetPlot( boss , "dead" , "bk_127_103171_dead" , 10 )
			x=0
			sleep(10)
			DelObj(door)
			WriteRoleValue(start, EM_RoleValue_Register1,0)
			gg=0
			gatime=0
			CombatBegin=0
		elseif x==3 then --���a�����`�]���`�@��
			Delobj(afdoor)----------------���}�q���ƥ�����
			Delobj(door)
			WriteRoleValue(start, EM_RoleValue_Register1,3)	
			gg=0
			gatime=0
			CombatBegin=0
		end	
	end		
end
function bk_127_103171()--------------������ai
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local boss = OwnerID()--------�������	
	local CombatBegin=0
	local skill1={495526,495521}------1.�����s�� 2. �������u
	local SkillIndex=0
	local skilllv={3,90}----�ۦ��¤O
	local skilltime=0------�ޯ�I��ɶ�
	local Luck=0 -----�p��X����ۦ�
	local Play_Chose={}-----------��J�������
	local skplayer=0 -------�ޯ�I��ؼ�
	local mob=0
	local mob1=0
	local mob2=0
	local tar1=0
	local tar2=0
	local Ls1=0
	local Ls2=0
	local Ls3=0
	local Ls4=0
	local ms=0
	while 1 do 
		sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )   ------ ��M�ثe�������ؼ�
		local BossTarget=AttackTarget
		if HateListCount( boss ) ~= 0 then	---- �T�w�L�{�b�����H
			if CombatBegin==0 then
				CombatBegin=1
				WriteRoleValue(start ,EM_RoleValue_Register1,1)------------�g�J1����N������b�԰���
				ScriptMessage( OwnerID() , -1 , 2 , "[SC_103171_01]" , 1 )
			end
			if mob == 0 then 
				mob1=mob1+1
				skilltime=skilltime+1
				if mob1>= 5 then
					if ms==0 then 
						Ls1=DW_Rand(20)
						tar1=CreateObjByFlag(103856,780599,Ls1,1)
						SetModeEx( tar1 , EM_SetModeType_Gravity, false) ---���O
						SetModeEx( tar1 , EM_SetModeType_Mark, false)
						SetModeEx( tar1 , EM_SetModeType_HideName, false)
						SetModeEx( tar1 , EM_SetModeType_ShowRoleHead, false)
						SetModeEx( tar1 , EM_SetModeType_NotShowHPMP, false)
						SetModeEx( tar1 , EM_SetModeType_Obstruct, false)   -----���O
						SetModeEx( tar1 , EM_SetModeType_Strikback, false) ---����
						SetModeEx( tar1 , EM_SetModeType_Move, false) ---����	
						SetModeEx( tar1 , EM_SetModeType_Fight, false) ---�i���
						SetModeEx( tar1 , EM_SetModeType_SearchenemyIgnore, false) 
						SetModeEx( tar1 , EM_SetModeType_Searchenemy, false)
						SetModeEx( tar1 , EM_SetModeType_Show, true)
						AddToPartition( tar1 , RoomID )
						WriteRoleValue(tar1, EM_RoleValue_Livetime,50)	---------------�s�b�ɶ�livetime
						AddBuff(tar1, 506631 , 1 , -1 )
						BeginPlot( tar1 ,"bk_127_495522",0)
						Ls2=DW_Rand(20)
						ms=1
					elseif ms==1 then 					
						if Ls1==Ls2 then 
						Ls2=DW_Rand(20)
						elseif Ls1~=Ls2 then 
							tar2=CreateObjByFlag(103856,780599,Ls2,1)
							SetModeEx( tar2 , EM_SetModeType_Gravity, false) ---���O
							SetModeEx( tar2 , EM_SetModeType_Mark, false)
							SetModeEx( tar2 , EM_SetModeType_HideName, false)
							SetModeEx( tar2 , EM_SetModeType_ShowRoleHead, false)
							SetModeEx( tar2 , EM_SetModeType_NotShowHPMP, false)
							SetModeEx( tar2 , EM_SetModeType_Obstruct, false)   -----���O
							SetModeEx( tar2 , EM_SetModeType_Strikback, false) ---����
							SetModeEx( tar2 , EM_SetModeType_Move, false) ---����	
							SetModeEx( tar2 , EM_SetModeType_Fight, false) ---�i���
							SetModeEx( tar2 , EM_SetModeType_SearchenemyIgnore, false) 
							SetModeEx( tar2 , EM_SetModeType_Searchenemy, false)
							SetModeEx( tar2 , EM_SetModeType_Show, true)
							AddToPartition( tar2 , RoomID )
							WriteRoleValue(tar2, EM_RoleValue_Livetime,50)	---------------�s�b�ɶ�livetime
							AddBuff(tar2, 506632 , 1 , -1 )
							BeginPlot( tar2 ,"bk_127_495523",0)
							Ls3=DW_Rand(20)
							ms=2
						end
					elseif ms==2 then 	
						if Ls1==Ls3 or Ls2==Ls3 then 
							Ls3=DW_Rand(20)
						elseif Ls1~=Ls3 and Ls2~=Ls3 then 
							tar3=CreateObjByFlag(103856,780599,Ls3,1)
							SetModeEx( tar3 , EM_SetModeType_Gravity, false) ---���O
							SetModeEx( tar3 , EM_SetModeType_Mark, false)
							SetModeEx( tar3 , EM_SetModeType_HideName, false)
							SetModeEx( tar3 , EM_SetModeType_ShowRoleHead, false)
							SetModeEx( tar3 , EM_SetModeType_NotShowHPMP, false)
							SetModeEx( tar3 , EM_SetModeType_Obstruct, false)   -----���O
							SetModeEx( tar3 , EM_SetModeType_Strikback, false) ---����
							SetModeEx( tar3 , EM_SetModeType_Move, false) ---����	
							SetModeEx( tar3 , EM_SetModeType_Fight, false) ---�i���
							SetModeEx( tar3 , EM_SetModeType_SearchenemyIgnore, false) 
							SetModeEx( tar3 , EM_SetModeType_Searchenemy, false)
							SetModeEx( tar3 , EM_SetModeType_Show, true)
							AddToPartition( tar3 , RoomID )
							WriteRoleValue(tar3, EM_RoleValue_Livetime,50)	---------------�s�b�ɶ�livetime
							AddBuff(tar3, 506632 , 1 , -1 )
							BeginPlot( tar3 ,"bk_127_495523",0)
							Ls4=DW_Rand(20)
							ms=3
						end
					elseif ms==3 then 	
						if Ls1==Ls4 or Ls2==Ls4 or Ls3==LS4 then 
							Ls4=DW_Rand(20)
						elseif Ls1~=Ls3 and Ls2~=Ls3 and Ls3~=LS4 then 
							tar4=CreateObjByFlag(103856,780599,Ls4,1)
							SetModeEx( tar4 , EM_SetModeType_Gravity, false) ---���O
							SetModeEx( tar4 , EM_SetModeType_Mark, false)
							SetModeEx( tar4 , EM_SetModeType_HideName, false)
							SetModeEx( tar4 , EM_SetModeType_ShowRoleHead, false)
							SetModeEx( tar4 , EM_SetModeType_NotShowHPMP, false)
							SetModeEx( tar4 , EM_SetModeType_Obstruct, false)   -----���O
							SetModeEx( tar4 , EM_SetModeType_Strikback, false) ---����
							SetModeEx( tar4 , EM_SetModeType_Move, false) ---����	
							SetModeEx( tar4 , EM_SetModeType_Fight, false) ---�i���
							SetModeEx( tar4 , EM_SetModeType_SearchenemyIgnore, false) 
							SetModeEx( tar4 , EM_SetModeType_Searchenemy, false)
							SetModeEx( tar4 , EM_SetModeType_Show, true)
							AddToPartition( tar4 , RoomID )
							WriteRoleValue(tar4, EM_RoleValue_Livetime,50)	---------------�s�b�ɶ�livetime
							AddBuff(tar4, 506632 , 1 , -1 )
							BeginPlot( tar4 ,"bk_127_495523",0)
							mob=1
							mob1=0
							ms=0
						end
					end
				end			
			if skilltime>= 8 then 
				Luck=DW_Rand(100)------------------- �üƨM�w�I��ۦ�
				if (Luck >= 0 and Luck < 25) or (Luck >= 50 and Luck < 75) then
					SkillIndex = 1
					BossTarget = AttackTarget
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_103171_02]" , 1 )
					CastSpellLV( OwnerID() , BossTarget , Skill1[SkillIndex] , skilllv[SkillIndex])
					sleep(20)
				elseif (Luck >= 25 and Luck < 50) or (Luck >= 75 and Luck < 101) then	
					SkillIndex = 2------------------------------------------���饴���ˮ`
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
				skilltime=0
			end	
			elseif mob== 1 then 
				mob2=mob2+1
				skilltime=skilltime+1
				if mob2>=30 then 
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_103171_03]" , "0xff6fb7ff" )
					CastSpellLV(OwnerID() ,OwnerID(),495525 , 8 )---------------------------------�@�P������
					mob=0
					mob2=0
				end
				if skilltime>= 10 then 
					Luck=DW_Rand(100)------------------- �üƨM�w�I��ۦ�
					if (Luck >= 0 and Luck < 25) or (Luck >= 50 and Luck < 75) then
						SkillIndex = 1
						BossTarget = AttackTarget
						CastSpellLV( OwnerID() , BossTarget , Skill1[SkillIndex] , skilllv[SkillIndex])
						sleep(20)
					elseif (Luck >= 25 and Luck < 50) or (Luck >= 75 and Luck < 101) then	
						SkillIndex = 2------------------------------------------���饴���ˮ`
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
					skilltime=0
				end	
			end
		elseif HateListCount( boss )  == 0 then    ----�԰����}
			if CombatBegin==1 then 
				CombatBegin=0 
				WriteRoleValue(start, EM_RoleValue_Register1,2)			
				sleep(30)
				Delobj(OwnerID())
			end
		end
	end
end
function bk_127_103171_dead()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local boss=OwnerID()
	WriteRoleValue(start, EM_RoleValue_Register1,3)	
end
function bk_127_495522()
	while 1 do 
		sleep(20)
		CastSpellLV( OwnerID() , OwnerID() , 495522 , 1 )
	end
end
function bk_127_495523()
	while 1 do 
		sleep(20)
		CastSpellLV( OwnerID() , OwnerID() , 495523 , 1 )
	end
end
function bk_127_check_495527()
	if CheckBuff(OwnerID() , 506623) == true then
	
	elseif CheckBuff(OwnerID() , 506623) == false then 
		if CheckBuff(OwnerID() , 506550) == true then	--�G�ƪ�buff	
			CancelBuff(OwnerID() , 506550 )
			CancelBuff(OwnerID() , 506549 )
			AddBuff(OwnerID(), 506548 , 1 , 5 )--------------
		end
	end
end