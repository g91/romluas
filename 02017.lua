function bk_132_104095()---------------------------------------133RAID��
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------
	local start = OwnerID()--------�������	
	local x=0---------�԰��p�ɾ�
	local gatime=0
	local gg=0
	local CombatBegin=0
	local door=0
--	local afdoor = CreateObjByFlag(104089,780687,2,1)
--	SetModeEx( afdoor , EM_SetModeType_Gravity, false) ---���O
--	SetModeEx( afdoor , EM_SetModeType_Mark, false)
--	SetModeEx( afdoor , EM_SetModeType_HideName, false)
--	SetModeEx( afdoor , EM_SetModeType_ShowRoleHead, false)
--	SetModeEx( afdoor , EM_SetModeType_NotShowHPMP, false)
--	SetModeEx( afdoor , EM_SetModeType_Obstruct, true)   -----���O
---	SetModeEx( afdoor , EM_SetModeType_Strikback, false) ---����
--	SetModeEx( afdoor , EM_SetModeType_Move, false) ---����	
--	SetModeEx( afdoor , EM_SetModeType_Fight, false) ---�i���
--	SetModeEx( afdoor , EM_SetModeType_SearchenemyIgnore, false) 
--	SetModeEx( afdoor , EM_SetModeType_Searchenemy, false)
--	SetModeEx( afdoor , EM_SetModeType_Show, true)
--	AddToPartition( afdoor , RoomID )
	local boss = CreateObjByFlag(104094,780687,2,1)------------------------------�Хߤ�
	SetModeEx( boss , EM_SetModeType_Gravity, true) ---���O
	SetModeEx( boss , EM_SetModeType_Mark, true)
	SetModeEx( boss , EM_SetModeType_HideName, true)
	SetModeEx( boss , EM_SetModeType_ShowRoleHead, true)
	SetModeEx( boss , EM_SetModeType_NotShowHPMP, true)
	---SetModeEx( boss , EM_SetModeType_Obstruct, true)   -----���O
	SetModeEx( boss , EM_SetModeType_Strikback, true) ---����
	SetModeEx( boss , EM_SetModeType_Move, true) ---����	
	SetModeEx( boss , EM_SetModeType_Fight, true) ---�i���
	SetModeEx( boss , EM_SetModeType_SearchenemyIgnore, true) 
	SetModeEx( boss , EM_SetModeType_Searchenemy, true)
	SetModeEx( boss , EM_SetModeType_Show, true)
	AddToPartition( boss , RoomID )
	BeginPlot( boss ,"bk_132_104094",0)
	SetPlot( boss , "dead" , "bk_132_104094_dead" , 10 )
	WriteRoleValue(start,EM_RoleValue_PID,boss)---- �b������W��J����id
	WriteRoleValue(boss ,EM_RoleValue_PID,start)	---- �b�����W��J���id
	while 1 do 
		sleep(10)
		x=ReadRoleValue(start,EM_RoleValue_Register1)
		if x==1 then --�����b�԰�����
			if CombatBegin==0 then 
				door = CreateObjByFlag(104089,780687,1,1)
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
				CombatBegin=1
			end	
			gatime=gatime+1 ------�g�ɮɶ�
	--		if gatime >= 600 then 
		--		if gg==0 then 
		--			ScriptMessage( OwnerID() , -1 , 2 , "[SC_104090_08]" , 1 )
		--			AddBuff( boss , 507364 , 1 , 7 )
			--		gg=1
			--	end
		--	end
		elseif x==2 then --���a���`�����}�԰�
			sleep(50)
			boss = CreateObjByFlag(104094,780687,2,1)
			AddToPartition( boss , RoomID )
			WriteRoleValue( boss, EM_RoleValue_PID,start)
			BeginPlot( boss ,"bk_132_104094",0)---------------------------------���@���Ҧ�
			SetPlot( boss , "dead" , "bk_132_104094_dead" , 10 )
			x=0
			DelObj(door)
			WriteRoleValue(start, EM_RoleValue_Register1,0)
			gatime=0	
			CombatBegin=0
			local PPL = SetSearchAllPlayer(RoomID)
			for i = 1 , PPL , 1 do 
				local ID = GetSearchResult()
				if ReadRoleValue( ID, EM_RoleValue_VOC) ~= 0 and ReadRoleValue( ID , EM_RoleValue_RoomID  ) == RoomID then 
					CancelBuff(ID , 507114 )-------
					CancelBuff(ID , 507119 )-------
					CancelBuff(ID , 507116 )-------
				end
			end	
		elseif x==3 then --���a�����`�]���`�@��
			---Delobj(afdoor)----------------���}�q���ƥ�����
			Delobj(door)
			WriteRoleValue(start, EM_RoleValue_Register1,3)	
			gg=0
			gatime=0
			CombatBegin=0
			local PPL = SetSearchAllPlayer(RoomID)
			for i = 1 , PPL , 1 do 
				local ID = GetSearchResult()
				if ReadRoleValue( ID, EM_RoleValue_VOC) ~= 0 and ReadRoleValue( ID , EM_RoleValue_RoomID  ) == RoomID then 
					CancelBuff(ID , 507114 )-------
					CancelBuff(ID , 507119 )-------
					CancelBuff(ID , 507116 )-------
				end
			end	
		end	
	end		
end
function bk_132_104094()--------------������ai
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_PID)----Ū�����
	local boss = OwnerID()
	local CombatBegin=0
	local skill1={495855,495856,495857}------1.�F�Ѥ@��2.�ۮ��s��3.�_�a�i
	local SkillIndex=0
	local skilllv={5,1,0}----�ۦ��¤O
	local skilltime=0------�ޯ�I��ɶ�
	local Luck=0 -----�p��X����ۦ�
	local Play_Chose={}-----------��J�������
	local kp=0
	local mob=0
	local mo2co=0
	local mobt1=0
	local mobco1=0
	local mobt2=0
	local mb2=0
	local buff=0
	local Playtemp = {}
	local litime=0
	local playerchose={}
	local playch={}
	local P150={}------�p��15�����a�}�C
	local magic
	local pm=0 -----�ƶq
	local bsc=0 --------�p�y�X�Ц�m
	while 1 do 
		sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )   ------ ��M�ثe�������ؼ�
		local BossTarget=AttackTarget
		if HateListCount( boss ) ~= 0 then	---- �T�w�L�{�b�����H
			if CombatBegin==0 then
				CombatBegin=1
				WriteRoleValue(start ,EM_RoleValue_Register1,1)------------�g�J1����N������b�԰���
				ScriptMessage( OwnerID() , -1 , 2 , "[SC_104090_01]" , 0 )
			end
			if mob== 0 then 
				skilltime=skilltime+1
				mobt1=mobt1+1
			--	say(ownerid(),"xxx"..mobt1)
				if mobt1>=20 then 
					local PPL = SetSearchAllPlayer(RoomID)
					local Num = 0
					for i = 1 , PPL , 1 do
						local ID = GetSearchResult()
						if CheckID(ID) == true and ReadRoleValue( ID ,EM_RoleValue_IsDead ) == 0 and ReadRoleValue( ID , EM_RoleValue_VOC ) > 0 then
							Playtemp[Num] = ID
							Num = Num + 1
						end
					end
				---	say(ownerid(),"xxx"..Num)
					for i = 1 , Num , 1 do 	
						local play=DW_Rand(table.getn(Playtemp))
						if  ReadRoleValue(Playtemp[play], EM_RoleValue_IsDead) == 0 and 
							ReadRoleValue(Playtemp[play], EM_RoleValue_IsPlayer) == 1 and 
							ReadRoleValue(Playtemp[play], EM_RoleValue_VOC) ~= 0 then             --�P�_�O���Ogm
							buff=buff+1
							local bmod= buff % 4 
						--	say(ownerid(),"bmod"..bmod)
							if bmod == 1 then 
								AddBuff( Playtemp[play] , 507094 , 1 , 8 )
							elseif bmod == 2 then 
								AddBuff( Playtemp[play] , 507095 , 1 , 8 )
							elseif bmod == 3 then 
								AddBuff( Playtemp[play] , 507096 , 1 , 8 )
							elseif bmod == 0 then 
								AddBuff( Playtemp[play] , 507097 , 1 , 8 )
							end
						end
						table.remove (Playtemp, play)
						table.getn (Playtemp)
					end
					--sleep(20)
					---local magi = Lua_DW_CreateObj("obj",104093,OwnerID(),0)
					local magi = CreateObjByFlag(104093,780687,3,1)
					SetModeEx( magi , EM_SetModeType_Show, true) ----�q�X
					SetModeEx( magi , EM_SetModeType_Mark, false) ----�аO
					SetModeEx( magi , EM_SetModeType_Strikback, false) ---����
					SetModeEx( magi , EM_SetModeType_Move, false) ---����	
					SetModeEx( magi , EM_SetModeType_Fight, false) ---�i���
					SetModeEx( magi , EM_SetModeType_SearchenemyIgnore, false) ---���󤣷|�Q�j�M
					SetModeEx( magi , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
					SetModeEx( magi , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
					SetModeEx( magi , EM_SetModeType_Searchenemy, false)  ---���
					AddToPartition(magi , RoomID )
					magic=DW_Rand(4)
					if magic==1 then 
						BeginPlot( magi ,"bk_133_104093_mfin_ea",0)---------------------------------�k�}�@��
					elseif magic==2 then 
						BeginPlot( magi ,"bk_133_104093_mfin_ea",0)---------------------------------�k�}�@��
					elseif magic==3 then 
						BeginPlot( magi ,"bk_133_104093_mfin_ea",0)---------------------------------�k�}�@��
					elseif magic==4 then 
						BeginPlot( magi ,"bk_133_104093_mfin_ea",0)---------------------------------�k�}�@��
					end
					WriteRoleValue(magi, EM_RoleValue_Livetime,8)-----�k���6��
					sleep(20)
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_104090_03]" , 0 )
					CastSpellLV( OwnerID() , OwnerID() , 495871 , 1 )---------------�p�q��[   
					sleep(60)
					while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID ) ~= 0   do
						sleep(2)
					end
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_104090_03]" , 0 )
					sleep(20)
					CastSpellLV( OwnerID() , OwnerID() , 496141 , 1 )-----------�p�^�_��
					sleep(40)	
					AddBuff( OwnerID() , 507111 , 0 , -1 )-----------���ͥ��n
					sysCastSpellLV( OwnerID() , OwnerID() , 495869 , 1 )-----------���˹buff�����a���D�L���}���n�|����buff
					mobt1=0
					mob=1
					buff=0
				end	
				if skilltime>= 6 then 
					Luck=DW_Rand(100)------------------- �üƨM�w�I��ۦ�
					if (Luck >= 0 and Luck < 33) then
						SkillIndex = 1
						BossTarget = AttackTarget
						ScriptMessage( OwnerID() , -1 , 2 , "[SC_104090_06]" , 0 )
						CastSpellLV( OwnerID() , OwnerID() , Skill1[SkillIndex] , skilllv[SkillIndex] )
						sleep(20)
					elseif (Luck >= 33 and Luck < 66) then	
						SkillIndex = 2
						BossTarget = AttackTarget
						ScriptMessage( OwnerID() , -1 , 2 , "[SC_104090_05]" , 1 )
						CastSpellLV( OwnerID() , BossTarget , Skill1[SkillIndex] , skilllv[SkillIndex])
						sleep(20)
					elseif (Luck >= 66 and Luck < 101) then	
						SkillIndex = 3
						BossTarget = AttackTarget
						ScriptMessage( OwnerID() , -1 , 2 , "[SC_104090_07]" , 1 )
						CastSpellLV( OwnerID() , OwnerID() , Skill1[SkillIndex] , skilllv[SkillIndex] )
						sleep(20)
					end
					skilltime=0
				end	
			elseif mob== 1 then 
				skilltime=skilltime+1
				mobt2=mobt2+1
				mb2=mb2+1
				mo2co=mo2co+1
				litime=litime+1
				if litime >= 2 then 
					playch=DW_HateRemain(0)-----------------������H   ��0�N�� ���ư��D�Z
					pm=table.getn(playch)------------���X�ƶq~~~
					for i=1 , pm , 1 do 
						local x=GetDistance( OwnerID(), playch[i])
						if ReadRoleValue( playch[i] ,EM_RoleValue_IsDead) == 0 and ReadRoleValue( playch[i] , EM_RoleValue_VOC ) ~= 0 and x > 125 then
							AddBuff( playch[i] , 507116 , 1 , -1 )-----------�������a��q�z�Z��buff
						end
					end
					litime=0
				end	
				if mo2co<30 then 
					if mb2>=5 then 
						bsc=DW_Rand(50)
						local ball=CreateObjByFlag(104088,780686,bsc,1)--------------------�H�����W�X�{ 
						SetModeEx( ball , EM_SetModeType_Move, false) ---����
						AddToPartition(ball , RoomID )
						SetPlot( ball , "dead" , "bk_133_104088_daed" , 0 )
						WriteRoleValue(ball, EM_RoleValue_Livetime,12)-----�����y12��
						mb2=0
					end
					if mobt2>= 10 then 
						Play_Chose=DW_HateRemain(0)-----------------������H   ��0�N�� ���ư��D�Z
						pm=table.getn (Play_Chose)------------���X�ƶq~~~
						local nu=0
						if pm == 0 then 
						
						elseif pm ~=0 then 
							for i=1 , pm , 1 do 
								if CheckID(Play_Chose[i]) == true and ReadRoleValue( Play_Chose[i] ,EM_RoleValue_IsDead) == 0 and ReadRoleValue( Play_Chose[i] , EM_RoleValue_VOC ) > 0 and GetDistance( OwnerID(), Play_Chose[i]) <=125 then
									P150[i] = Play_Chose[i]
								end
							end
							
							kp=DW_Rand(table.getn(P150))
							if kp==0 then --------0 �N��̭��S���H ���٥�����
							
							end
							if kp~=0 then --------�ݥ����ӭ˷���
				--			say(ownerid(),"xx"..kp)
								if CheckRelation( Boss, P150[kp] , EM_CheckRelationType_Attackable ) == true then 
									local MessageString
									local PlayerName = GetName( P150[kp] )
									MessageString = "[SC_104090_02][$SETVAR1="..PlayerName.."]" ----�bstring���i�H�q�X���a���W�r
									ScriptMessage( Boss , -1 , 2 ,  MessageString, 1 )	
									BossTarget = P150[kp]	
									CastSpellLV( OwnerID() , BossTarget , 495865 , 8 )-------------���_�u
									sleep(20)
								end
							end
						end
						mobt2=0
					end
					if skilltime>= 6 then 
						Luck=DW_Rand(100)------------------- �üƨM�w�I��ۦ�
						if (Luck >= 0 and Luck < 33) then
							SkillIndex = 1
							BossTarget = AttackTarget
							ScriptMessage( OwnerID() , -1 , 2 , "[SC_104090_06]" , 0 )
							CastSpellLV( OwnerID() , OwnerID() , Skill1[SkillIndex] , skilllv[SkillIndex] )
							sleep(20)
						elseif (Luck >= 33 and Luck < 66) then	
							SkillIndex = 2
							BossTarget = AttackTarget
							ScriptMessage( OwnerID() , -1 , 2 , "[SC_104090_05]" , 1 )
							CastSpellLV( OwnerID() , BossTarget , Skill1[SkillIndex] , skilllv[SkillIndex])
							sleep(20)
						elseif (Luck >= 66 and Luck < 101) then	
							SkillIndex = 3
							BossTarget = AttackTarget
							ScriptMessage( OwnerID() , -1 , 2 , "[SC_104090_07]" , 1 )
							CastSpellLV( OwnerID() , OwnerID() , Skill1[SkillIndex] , skilllv[SkillIndex] )
							sleep(20)
						end
						skilltime=0
					end	
				elseif mo2co>=30 then 
					CancelBuff( OwnerID() ,507111 ) ----------------------------�M���L��buff
					mobt2=0
					mb2=0
					mob=0
					mo2co=0
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
function bk_132_104094_dead()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local boss=OwnerID()
	WriteRoleValue(start, EM_RoleValue_Register1,3)	
end
