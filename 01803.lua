function bk_127_103153()----------------�B�������ѱ��
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------
	local start = OwnerID()--------�������	
	local x=0---------�԰��p�ɾ�
	local gatime=0
	local mobtime=0
	local mob=0
	local gg=0
	local CombatBegin=0
	local door=0
	local afdoor = CreateObjByFlag(103824,780596,2,1)-------------------------------------------�_���ԫ��
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
	AddToPartition( afdoor , RoomID )
	BeginPlot( afdoor ,"bk_127_103825",0)
	local boss = CreateObjByFlag(103153,780596,3,1)------------------------------�Хߤ�
	SetModeEx( boss , EM_SetModeType_Gravity, true) ---���O
	SetModeEx( boss , EM_SetModeType_Mark, true)
	SetModeEx( boss , EM_SetModeType_HideName, true)
	SetModeEx( boss , EM_SetModeType_ShowRoleHead, true)
	--SetModeEx( boss , EM_SetModeType_NotShowHPMP, true)
	SetModeEx( boss , EM_SetModeType_Obstruct, false)   -----����
	SetModeEx( boss , EM_SetModeType_Strikback, true) ---����
	SetModeEx( boss , EM_SetModeType_Move, true) ---����	
	SetModeEx( boss , EM_SetModeType_Fight, true) ---�i���
	SetModeEx( boss , EM_SetModeType_SearchenemyIgnore, true) 
	SetModeEx( boss , EM_SetModeType_Searchenemy, true)
	SetModeEx( boss , EM_SetModeType_Show, true)
	AddToPartition( boss , RoomID )
	BeginPlot( boss ,"bk_127_103153_fire",0)
	SetPlot( boss , "dead" , "bk_127_103153_dead" , 10 )
	WriteRoleValue(start,EM_RoleValue_PID,boss)---- �b������W��J����id
	WriteRoleValue(boss ,EM_RoleValue_PID,start)	---- �b�����W��J���id
	while 1 do 
		sleep(10)
		x=ReadRoleValue(start,EM_RoleValue_Register1)
		if x==1 then --�����b�԰�����
			if CombatBegin==0 then 
				door = CreateObjByFlag(103824,780596,1,1)-------------------------------------------�_���ԫe��
				SetModeEx( door , EM_SetModeType_Gravity, false) ---���O
				SetModeEx( door , EM_SetModeType_Mark, false)
				SetModeEx( door , EM_SetModeType_HideName, false)
				SetModeEx( door , EM_SetModeType_ShowRoleHead, false)
				--SetModeEx( door , EM_SetModeType_NotShowHPMP, false)
				SetModeEx( door , EM_SetModeType_Obstruct, true)   -----���O
				SetModeEx( door , EM_SetModeType_Strikback, false) ---����
				SetModeEx( door , EM_SetModeType_Move, false) ---����	
				SetModeEx( door , EM_SetModeType_Fight, false) ---�i���
				SetModeEx( door , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( door , EM_SetModeType_Searchenemy, false)
				SetModeEx( door , EM_SetModeType_Show, true)
				AddToPartition( door , RoomID )
				BeginPlot( door ,"bk_127_103825",0)
				CombatBegin=1
			end	
			gatime=gatime+1 ------�g�ɮɶ�
			if gatime >= 600 then 
				if gg==0 then 
					AddBuff(boss, 506335 , 1 , -1 )
					ScriptMessage( boss , -1 , 2 , "[SC_103153_04]" , 1 )
					gg=1
				end
			end
		elseif x==2 then --���a���`�����}�԰�
			sleep(50)
			boss = CreateObjByFlag(103153,780596,3,1)
			SetModeEx( boss , EM_SetModeType_Mark, true)
			SetModeEx( boss , EM_SetModeType_HideName, true)
			SetModeEx( boss , EM_SetModeType_ShowRoleHead, true)
		--	SetModeEx( boss , EM_SetModeType_NotShowHPMP, true)
			SetModeEx( boss , EM_SetModeType_Obstruct, false)   -----����
			SetModeEx( boss , EM_SetModeType_Strikback, true) ---����
			SetModeEx( boss , EM_SetModeType_Move, true) ---����	
			SetModeEx( boss , EM_SetModeType_Fight, true) ---�i���
			SetModeEx( boss , EM_SetModeType_SearchenemyIgnore, true) 
			SetModeEx( boss , EM_SetModeType_Searchenemy, true)
			SetModeEx( boss , EM_SetModeType_Show, true)
			AddToPartition( boss , RoomID )
			WriteRoleValue( boss, EM_RoleValue_PID,start)
			BeginPlot( boss ,"bk_127_103153_fire",0)---------------------------------���@���Ҧ�
			SetPlot( boss , "dead" , "bk_127_103153_dead" , 10 )
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
function bk_127_103153_fire()--------------������ai �_����-��
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local boss = OwnerID()--------�������	
	local CombatBegin=0
	local skill1={495541,495547,495542,495548}------1.���K�Q�o2.�P�K�]��3.�B���R��4.���ﾮ��
	local SkillIndex=0
	local skilllv={80,9,80,9}----�ۦ��¤O
	local skilltime=0------�ޯ�I��ɶ�
	local Luck=0 -----�p��X����ۦ�
	local Play_Chose={}-----------��J�������
	local kp=0
	local skplayer=0 -------�ޯ�I��ؼ�
	local mob=0
	local mob1=0
	local mob2=0
	while 1 do 
		sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )   ------ ��M�ثe�������ؼ�
		local BossTarget=AttackTarget
		if HateListCount( boss ) ~= 0 then	---- �T�w�L�{�b�����H
			if CombatBegin==0 then
				CombatBegin=1
				WriteRoleValue(start ,EM_RoleValue_Register1,1)------------�g�J1����N������b�԰���
				ScriptMessage( OwnerID() , -1 , 2 , "[SC_103153_01]" , 1 )
			end
			if mob==0  then
				mob1=mob1+1
				skilltime=skilltime+1
				if skilltime>= 5 then 
					Luck=DW_Rand(100)------------------- �üƨM�w�I��ۦ�
					if (Luck >= 0 and Luck < 25) or (Luck >= 50 and Luck < 75) then
						SkillIndex = 1
						BossTarget = AttackTarget
						ScriptMessage( OwnerID() , -1 , 2 , "[SC_103153_02]" , "0xff6fb7ff" )
						CastSpellLV( OwnerID() , BossTarget , Skill1[SkillIndex] , skilllv[SkillIndex] )
						sleep(20)
					elseif (Luck >= 25 and Luck < 50) or (Luck >= 75 and Luck < 101) then	
						SkillIndex = 2------------------------------------------���饴���ˮ`
						Play_Chose=DW_HateRemain(1)-----------------������H   ��0�N�� ���ư��D�Z
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
				if mob1 >= 15 then
					---AddBuff(boss, 506574 , 1 , -1 )-----------------------------
					Play_Chose=DW_HateRemain(0)-----------------������H   ��0�N�� ���ư��D�Z
					kp=DW_Rand(table.getn(Play_Chose))
					if kp==0 then --------0 �N��̭��S���H ���٥�����
					end
					if kp~=0 then --------�ݥ����ӭ˷���
						BossTarget = Play_Chose[kp]		
						---ScriptMessage( OwnerID() , -1 , 2 , "[SC_102707_05]" , 1 )
						local caball = Lua_DW_CreateObj("obj",103829,BossTarget,0)
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
						CastSpellLv(caball,caball,495543,30)
						WriteRoleValue(caball, EM_RoleValue_Livetime,20)	---------------�s�b�ɶ�livetime
						sleep(20)
					end
					mob=1 
					mob2=0
				end		
			end
			if mob==1 then
				mob2=mob2+1
				skilltime=skilltime+1
				if skilltime>= 5 then 
					Luck=DW_Rand(100)------------------- �üƨM�w�I��ۦ�
					if (Luck >= 0 and Luck < 25) or (Luck >= 50 and Luck < 75) then
						SkillIndex = 3
						BossTarget = AttackTarget
						CastSpellLV( OwnerID() , BossTarget , Skill1[SkillIndex] , skilllv[SkillIndex] )
						sleep(20)
					elseif (Luck >= 25 and Luck < 50) or (Luck >= 75 and Luck < 101) then	
						SkillIndex = 4------------------------------------------���饴���ˮ`
						Play_Chose=DW_HateRemain(0)-----------------������H   ��0�N�� ���ư��D�Z
						kp=DW_Rand(table.getn(Play_Chose))
						if kp==0 then --------0 �N��̭��S���H ���٥�����
						end
						if kp~=0 then --------�ݥ����ӭ˷���
						BossTarget = Play_Chose[kp]		
						ScriptMessage( OwnerID() , -1 , 2 , "[SC_103153_03]" , "0xff6fb7ff" )
						CastSpellLV( OwnerID() , BossTarget , Skill1[SkillIndex] , skilllv[SkillIndex] )
						sleep(20)
						end
					end
					skilltime=0
				end
				if mob2>=15 then 
					---CancelBuff(boss , 506574 )-------�M���ܨ�BUFF
					Play_Chose=DW_HateRemain(0)-----------------������H   ��0�N�� ���ư��D�Z
					kp=DW_Rand(table.getn(Play_Chose))
					if kp==0 then --------0 �N��̭��S���H ���٥�����
					end
					if kp~=0 then --------�ݥ����ӭ˷���
						BossTarget = Play_Chose[kp]		
						---ScriptMessage( OwnerID() , -1 , 2 , "[SC_102707_05]" , 1 )
					---	say(boss,"xxxxxxxxx")
						local caball = Lua_DW_CreateObj("obj",103829,BossTarget,0)
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
						CastSpellLv(caball,caball,495544,30)
						WriteRoleValue(caball, EM_RoleValue_Livetime,20)	---------------�s�b�ɶ�livetime
						sleep(20)
					end
					mob=0
					mob1=0
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
function bk_127_103153_dead()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local boss=OwnerID()
	WriteRoleValue(start, EM_RoleValue_Register1,3)	
end
function bk_127_506575()
	GiveBodyItem( OwnerID() , 207175 , 1 )
	CancelBuff(TargetID() , 506563 )----------------------------------�������a���Wbuff
	CancelBuff(TargetID() , 506564 )----------------------------------�������a���Wbuff
	CancelBuff(TargetID() , 506565 )----------------------------------�������a���Wbuff
	CancelBuff(TargetID() , 506570 )----------------------------------�������a���Wbuff
	sysCastSpellLV( OwnerID() , OwnerID() , 495549 , 12 )
end
function bk_127_506576()
	GiveBodyItem( OwnerID() , 207176 , 1 )
	CancelBuff(TargetID() , 506567 )----------------------------------�������a���Wbuff
	CancelBuff(TargetID() , 506568 )----------------------------------�������a���Wbuff
	CancelBuff(TargetID() , 506569 )----------------------------------�������a���Wbuff
	CancelBuff(TargetID() , 506571 )----------------------------------�������a���Wbuff
	sysCastSpellLV( OwnerID() , OwnerID() , 495550 , 12 )
end
function bk_127_207175_ch()
	if ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) == 0 then -------------------------------------�ˬd�O�_�����a ���a����1
		ScriptMessage( OwnerID() , -1 , 1 , "[SC_102623_16]" , 1 )-------------------------------------�u��缾�a�ϥ�
		return false
	else
		if GetDistance( OwnerID(), TargetID()) < 301 then
			return true
		else
			ScriptMessage( OwnerID() , -1 , 1 , "[SC_102623_17]" , 1 )-------------------------------------�Z���L��
			return false
		end
	end
end
function bk_127_207175_magic()
	CancelBuff(TargetID() , 506573 )----------------------------------�������a���Wbuff
end
function bk_127_207176_ch()
	if ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) == 0 then -------------------------------------�ˬd�O�_�����a ���a����1
		ScriptMessage( OwnerID() , -1 , 1 , "[SC_102623_16]" , 1 )-------------------------------------�u��缾�a�ϥ�
		return false
	else
		if OwnerID()==TargetID() then
			return false
		else
			if GetDistance( OwnerID(), TargetID()) < 301 then
				return true
			else
				ScriptMessage( OwnerID() , -1 , 1 , "[SC_102623_17]" , 1 )-------------------------------------�Z���L��
				return false
			end
		end
	end
end
function bk_127_207176_magic()
	CancelBuff(TargetID() , 506572 )----------------------------------�������a���Wbuff
end
