function bk_127_103827()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------
	local start = OwnerID()--------�������	
	local x=0---------�԰��p�ɾ�
	local gatime=0
	local gg=0
	local CombatBegin=0
	local door=0
	local afdoor = CreateObjByFlag(103825,780589,1,1)-----------------1�����
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
	local boss = CreateObjByFlag(103169,780589,3,1)------------------------------�Хߤ�  2����
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
	BeginPlot( boss ,"bk_127_103169",0)
	SetPlot( boss , "dead" , "bk_127_103169_dead" , 10 )
	WriteRoleValue(start,EM_RoleValue_PID,boss)---- �b������W��J����id
	WriteRoleValue(boss ,EM_RoleValue_PID,start)	---- �b�����W��J���id
	while 1 do 
		sleep(10)
		x=ReadRoleValue(start,EM_RoleValue_Register1)
		if x==1 then --�����b�԰�����
			if CombatBegin==0 then 
				door = CreateObjByFlag(103825,780589,2,1)   ---------3���e��
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
				AddToPartition( door , RoomID )
				BeginPlot( door ,"bk_127_103825",0)
				CombatBegin=1
			end	
			gatime=gatime+1 ------�g�ɮɶ�
			if gatime >= 600 then 
				if gg==0 then 
					AddBuff(boss, 506335 , 1 , -1 )
					ScriptMessage( boss , -1 , 2 , "[SC_103169_04]" , 1 )
					gg=1
				end
			end
		elseif x==2 then --���a���`�����}�԰�
			sleep(50)
			boss = CreateObjByFlag(103169,780589,3,1)
			SetModeEx( boss , EM_SetModeType_Gravity, true) ---���O
			SetModeEx( boss , EM_SetModeType_Mark, true)
			SetModeEx( boss , EM_SetModeType_HideName, true)
			SetModeEx( boss , EM_SetModeType_ShowRoleHead, true)
			--SetModeEx( boss , EM_SetModeType_NotShowHPMP, false)
			SetModeEx( boss , EM_SetModeType_Obstruct, false)   -----����
			SetModeEx( boss , EM_SetModeType_Strikback, true) ---����
			SetModeEx( boss , EM_SetModeType_Move, true) ---����	
			SetModeEx( boss , EM_SetModeType_Fight, true) ---�i���
			SetModeEx( boss , EM_SetModeType_SearchenemyIgnore, true) 
			SetModeEx( boss , EM_SetModeType_Searchenemy, true)
			SetModeEx( boss , EM_SetModeType_Show, true)
			AddToPartition( boss , RoomID )
			WriteRoleValue( boss, EM_RoleValue_PID,start)
			BeginPlot( boss ,"bk_127_103169",0)---------------------------------���@���Ҧ�
			SetPlot( boss , "dead" , "bk_127_103169_dead" , 10 )
			x=0
			sleep(10)
			DelObj(door)
			WriteRoleValue(start, EM_RoleValue_Register1,0)
			gatime=0	
			gg=0
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
function bk_127_103169()--------------������ai
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local boss = OwnerID()--------�������	
	local CombatBegin=0
	local skill1={495515,495551,495554}------1.�Q�b��2.�V�í��i
	local SkillIndex=0
	local skilllv={18,4,100}----�ۦ��¤O
	local skilltime=0------�ޯ�I��ɶ�
	local mob=0
	local mobtime= 0
	local mobtime1=0
	local skilltarget=0
	local skillbigtime=0
	local Luck=0 -----�p��X����ۦ�
	local Play_Chose={}-----------��J�������
	local skplayer=0 -------�ޯ�I��ؼ�
	local lp=0
	local kp=0
	local X=0 
	local Y=0
	local Z=0
	----local Dir=0
	while 1 do 
		sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )   ------ ��M�ثe�������ؼ�
		local BossTarget=AttackTarget
		if HateListCount( boss ) ~= 0 then	---- �T�w�L�{�b�����H
			if CombatBegin==0 then
				CombatBegin=1
				ScriptMessage( OwnerID() , -1 , 2 , "[SC_103169_01]" , 1 )
				WriteRoleValue(start ,EM_RoleValue_Register1,1)------------�g�J1����N������b�԰���
			end
			skilltime=skilltime+1
			if mob == 0 then
				mobtime=mobtime+1
			---	say( OwnerID(),"mobtime"..mobtime)
				if mobtime >= 10 then ---------�ļ�
					for i=1 , 20 ,1 do 
						local tar = CreateObjByFlag(103827,780598,i,1)
						SetModeEx( tar , EM_SetModeType_Gravity, false) ---���O
						SetModeEx( tar , EM_SetModeType_Mark, false)
						SetModeEx( tar , EM_SetModeType_HideName, false)
						SetModeEx( tar , EM_SetModeType_ShowRoleHead, false)
						SetModeEx( tar , EM_SetModeType_NotShowHPMP, false)
						SetModeEx( tar , EM_SetModeType_Obstruct, false)   -----���O
						SetModeEx( tar , EM_SetModeType_Strikback, false) ---����
						SetModeEx( tar , EM_SetModeType_Move, false) ---����	
						SetModeEx( tar , EM_SetModeType_Fight, false) ---�i���
						SetModeEx( tar , EM_SetModeType_SearchenemyIgnore, false) 
						SetModeEx( tar , EM_SetModeType_Searchenemy, false)
						SetModeEx( tar , EM_SetModeType_Show, true)
						AddToPartition( tar , RoomID )
						if GetDistance( OwnerID(), tar) > 170 then						
							WriteRoleValue(skilltarget, EM_RoleValue_Livetime,5)
							CastSpellLV( OwnerID() , skilltarget , 495516 , 1 )--------��ؼЬI��ۦ�
							ScriptMessage( OwnerID() , -1 , 2 , "[SC_103169_02]" , 1 )
							say( boss,"[SC_103169_02]")
							AddBuff(boss, 506543 , 1 , -1 )-------�W�¦�ľWbuff
							---say( OwnerID(),"mob"..mob)
							sleep(20)
							CancelBuff(boss , 506543)----------------------------------����m�X��
							mob=1
							mobtime=0
							break
						end
					end
				end
				if skilltime>= 7 then 
				Luck=DW_Rand(100)------------------- �üƨM�w�I��ۦ�
					if (Luck >= 0 and Luck < 25) or (Luck >= 50 and Luck < 75) then
						SkillIndex = 1
						BossTarget = AttackTarget
						CastSpellLV( OwnerID() , BossTarget , Skill1[SkillIndex] , skilllv[SkillIndex] )
						sleep(20)
					elseif (Luck >= 25 and Luck < 50) or (Luck >= 75 and Luck <101) then		
						SkillIndex = 3------------------------------------------���饴���ˮ`
						Play_Chose=DW_HateRemain(0)-----------------������H   ��0�N�� ���ư��D�Z
						kp=DW_Rand(table.getn(Play_Chose))
						if kp==0 then --------0 �N��̭��S���H ���٥�����
						end
						if kp~=0 then --------�ݥ����ӭ˷���
						BossTarget = Play_Chose[kp]		
						---ScriptMessage( OwnerID() , -1 , 2 , "[SC_102707_05]" , 1 )
						CastSpellLV( OwnerID() , BossTarget , Skill1[SkillIndex] , skilllv[SkillIndex] )
						sleep(20)
						end
					end
					skilltime=0
				end
			end
			if mob == 1 then 
				mobtime1=mobtime1+1
				-----say(OwnerID(),"xxxxx"..mobtime1)
				if mobtime1 >= 10 then 
					----say(OwnerID(),"yyyyy")
					SetModeEx( boss , EM_SetModeType_Obstruct, false)
					SetModeEx( boss , EM_SetModeType_Move, false) ---����
					SetModeEx( boss , EM_SetModeType_Fight, false) ---�i���
					SetModeEx( boss , EM_SetModeType_Mark, false)
					----SetModeEx( boss , EM_SetModeType_Gravity, false) ---���O
					SysCastSpellLV( OwnerID() , boss , 495518 , 1 )--------�ϥΪ��������_��
					sleep(10)
					CastSpellLV( OwnerID() , OwnerID() , 495517 , 1 )--------�ۤv�I����D
					-------sysCastSpellLV( OwnerID() , OwnerID() , 495595 , 1 )--------�w
					------AddBuff(boss, 506546 , 1 , -1 )-------����ð_��							
					sleep(10)-----���d��
					AddBuff(boss, 506546 , 1 , -1 )-------����ð_��	
					Play_Chose=DW_HateRemain(0)-----------------������H   ��0�N�� ���ư��D�Z
					kp=DW_Rand(table.getn(Play_Chose))
					if kp==0 then --------0 �N��̭��S���H ���٥�����
						local skilltarget = Lua_DW_CreateObj("obj",103827,boss,0)
						SetModeEx( skilltarget , EM_SetModeType_Gravity, false) ---���O
						SetModeEx( skilltarget , EM_SetModeType_Mark, false)
						SetModeEx( skilltarget , EM_SetModeType_HideName, false)
						SetModeEx( skilltarget , EM_SetModeType_ShowRoleHead, false)
						SetModeEx( skilltarget , EM_SetModeType_NotShowHPMP, false)
						SetModeEx( skilltarget , EM_SetModeType_Obstruct, false)   -----����
						SetModeEx( skilltarget , EM_SetModeType_Strikback, false) ---����
						SetModeEx( skilltarget , EM_SetModeType_Move, false) ---����	
						SetModeEx( skilltarget , EM_SetModeType_Fight, false) ---�i���
						SetModeEx( skilltarget , EM_SetModeType_SearchenemyIgnore, false) 
						SetModeEx( skilltarget , EM_SetModeType_Searchenemy, false)
						SetModeEx( skilltarget , EM_SetModeType_Show, true)	
						AddToPartition( skilltarget , RoomID )
						WriteRoleValue(skilltarget, EM_RoleValue_Livetime,8)
						AddBuff(skilltarget, 506540 , 1 , -1 )-------�W�¦⳱�v��buff.
						ScriptMessage( OwnerID() , -1 , 2 , "[SC_103169_03]" , 1 )
						----say( boss,"[SC_103169_03]")
						sleep(20)
						X=ReadRoleValue(skilltarget ,EM_RoleValue_X)
						Y=ReadRoleValue(skilltarget ,EM_RoleValue_Y)
						Z=ReadRoleValue(skilltarget ,EM_RoleValue_Z)
						--- Dir=ReadRoleValue(boss ,EM_RoleValue_Dir)
						SetPos( boss, X, Y , Z , 20 )--------
						sleep(10)
						AddBuff(skilltarget, 506541 , 1 , -1 )-------���U�a�O�}��
						sysCastSpellLV( skilltarget , skilltarget , 495535 , 8 )
						CancelBuff(boss , 506546)----------------------------------����m�X��
						sleep(30)
						SetModeEx( boss , EM_SetModeType_Move, true) ---����
						SetModeEx( boss , EM_SetModeType_Fight, true) ---�i���
						SetModeEx( boss , EM_SetModeType_Mark, true)
					end
					if kp~=0 then --------�ݥ����ӭ˷���
						-------say(boss,"1111")
					---	BossTarget = Play_Chose[kp]	
						local skilltarget = Lua_DW_CreateObj("obj",103827,Play_Chose[kp],0)
						SetModeEx( skilltarget , EM_SetModeType_Gravity, false) ---���O
						SetModeEx( skilltarget , EM_SetModeType_Mark, false)
						SetModeEx( skilltarget , EM_SetModeType_HideName, false)
						SetModeEx( skilltarget , EM_SetModeType_ShowRoleHead, false)
						SetModeEx( skilltarget , EM_SetModeType_NotShowHPMP, false)
						SetModeEx( skilltarget , EM_SetModeType_Obstruct, false)   -----����
						SetModeEx( skilltarget , EM_SetModeType_Strikback, false) ---����
						SetModeEx( skilltarget , EM_SetModeType_Move, false) ---����	
						SetModeEx( skilltarget , EM_SetModeType_Fight, false) ---�i���
						SetModeEx( skilltarget , EM_SetModeType_SearchenemyIgnore, false) 
						SetModeEx( skilltarget , EM_SetModeType_Searchenemy, false)
						SetModeEx( skilltarget , EM_SetModeType_Show, true)	
						AddToPartition( skilltarget , RoomID )
						WriteRoleValue(skilltarget, EM_RoleValue_Livetime,8)
						AddBuff(skilltarget, 506540 , 1 , -1 )-------�W�¦⳱�v��buf
						ScriptMessage( OwnerID() , -1 , 2 , "[SC_103169_03]" , 1 )
						say( boss,"[SC_103169_03]")
						sleep(20)
						X=ReadRoleValue(skilltarget ,EM_RoleValue_X)
						Y=ReadRoleValue(skilltarget ,EM_RoleValue_Y)
						Z=ReadRoleValue(skilltarget ,EM_RoleValue_Z)
						---Dir=ReadRoleValue(Play_Chose[kp] ,EM_RoleValue_Dir)
						SetPos( boss, X, Y , Z , 20 )--------
						sleep(10)
						AddBuff(skilltarget, 506541 , 1 , -1 )-------���U�a�O�}��
						sysCastSpellLV( skilltarget , skilltarget , 495535 , 300 )
						CancelBuff(boss , 506546)----------------------------------����m�X��
						sleep(30)
						SetModeEx( boss , EM_SetModeType_Move, true) ---����
						SetModeEx( boss , EM_SetModeType_Fight, true) ---�i���
						SetModeEx( boss , EM_SetModeType_Mark, true)
					end
					mob=0
					mobtime1=0
				end				
				if skilltime>= 7 then 
				Luck=DW_Rand(100)------------------- �üƨM�w�I��ۦ�
					if (Luck >= 0 and Luck < 25) or (Luck >= 50 and Luck < 75) then
						SkillIndex = 1
						BossTarget = AttackTarget
						CastSpellLV( OwnerID() , BossTarget , Skill1[SkillIndex] , skilllv[SkillIndex] )
						sleep(20)
					elseif (Luck >= 25 and Luck < 50) or (Luck >= 75 and Luck <101) then	
						SkillIndex = 2------------------------------------------���饴���ˮ`
						CastSpellLV( OwnerID() , OwnerID() , Skill1[SkillIndex] , skilllv[SkillIndex] )
						sleep(20)
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
function bk_127_103169_dead()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local boss=OwnerID()
	CancelBuff(boss , 506546)----------------------------------����m�X��
	SetModeEx( boss , EM_SetModeType_Move, true) ---����
	SetModeEx( boss , EM_SetModeType_Fight, true) ---�i���
	SetModeEx( boss , EM_SetModeType_Mark, true)
	WriteRoleValue(start, EM_RoleValue_Register1,3)	
end
function bk_127_103825()
	SetDefIdleMotion(OwnerID(),ruFUSION_MIME_ACTIVATE_LOOP)
end
