function Lua_bk_wd_102623()--------------------------���s���FAI
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local alltime=0-----����
	local time1=0------�j���ۭp��ɶ�
	local time2=0------�p�ۦ��p��ɶ�
	local time3=0
	local time4=0
	local time5=0
	local boss=OwnerID()
	local CombatBegin = 0
	local he=0 ----------�x����²��t��
	local skill_Rand={}--------------�ϥΩۦ�
	local ma_TargetID=0
	local Play_Chose={}---------------------------------------------------  ����Ҧ��H����m
	local PPL = SetSearchAllPlayer(RoomID )
	local kp=0
	local skill={494253,494254}------1.�B��N 2. ���� 
	local skilllv1={0,1}------------------------------²��Ҧ�
	local skilllv2={1,5}-------------------------------�����Ҧ�
	local skilllv3={2,2}-------------------------------�x���Ҧ�
	local MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )	--Ū����q
	local ma = ReadRoleValue( boss , EM_RoleValue_Register2 )----------------------Ū�����ϥΦ���
----	local ma=0
	local magic={}
	local mm0 =0
	local bossmagic={}
	local s1=0
	local s2=0
	local Luck=0
	local X=0
	local Y=0
	local Z=0
	local Dir=0
	local door=0
	local ball
	local sb=0
	local st=0------------------�����ഫ����
	local bbb={}
	local walk=0
	----local wb=0
	while 1 do 
		sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )   ------ ��M�ثe�������ؼ�
		local BossTarget=AttackTarget
		if Ver_Zone118_WaterDragon[ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)] == 2 then 
			-------------say(boss,"1111111111111111111111111111")
			BeginPlot( boss ,"Lua_bk_wd_dead_102623",0)--------------------------------------------�_��!!!!
			break
		end
		if HateListCount( boss ) ~= 0 then	---- �T�w�L�{�b�����H

			if CombatBegin == 0 then							---------------�u���}����@��
				CombatBegin = 1
				door = CreateObjByFlag(102462,780440,6,1)-----------------------�b�X��2�W����J���ת�
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
				WriteRoleValue(boss, EM_RoleValue_Register3,door)	
				---------WriteRoleValue(timecount , EM_RoleValue_Register1,CombatBegin) 
				--------------	say(boss,"CombatBegin"..CombatBegin)
			end	
			local NowHP = ReadRoleValue(  OwnerID() , EM_RoleValue_HP )
			local HPPercent = NowHP / MaxHP	--��q�ʤ���
			local partymember = LuaFunc_PartyData(AttackTarget)	
			he = ReadRoleValue( boss , EM_RoleValue_Register1 )---------Ū��he����
			if HPPercent <0.95 then
				if s1==0 then 
					if he ==1 then 
					end
					if he ==0 then 
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_102623_1]" , 1 )----------------- �C��Ū����q  ���q�C��95 %�۸�
					--------[102623]�w�g�����ٳơA���U�ӥu��a�A�̦ۤv�F......
					s1=1
					end
				end
				if s1 ==1 then 
				end
			end
			if HPPercent <=0.45 then 
				AddBuff(boss,504805,1,600)
			end
			if HPPercent < 0.5 then 
				if s2==0 then 
				ScriptMessage( OwnerID() , -1 , 2 , "[SC_102623_0]" , 1 )
				s2=1
				end
			end
			
			alltime = alltime + 1
			time1=time1+1--------------------------------------�򥻩ۦ�	
			time2=time2+1---------------------------------------�j�T�u
			time3=time3+1------------------------------------����ɶ�
			time4=time4+1----------------------------------����
			time5=time5+1-----------------------�j����
		---	say(boss,"he=="..he)
			if he ==1 then ------------- �ڭ̬O���ݧڭn²�楴   �o�̬O²�楴�Ҧ��ڿ�X�Ъ`�N
				if st==0 then 
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_102623_12]" , 1 )
					st=3
				end
				if time3==4 then --------------�C4���ͤ@��
					ball=DW_Rand(20)
					local wb=CreateObjByFlag(113594,780426,ball,1)---------------------------�b���s�����W���ͪ��~
					SetModeEx( wb , EM_SetModeType_Show, true)
					SetModeEx( wb , EM_SetModeType_Fight , false )
					AddToPartition( wb , RoomID )
					SetPlot( wb , "touch" , "Lua_bk_wb_113594" , 30 )-----���ͤ@�Ӫ��������a�h�ߨ����~
					BeginPlot( wb , "Lua_bk_wd_dd_206005",300)------------------------------------�R���@��----10��
					time3=0
				end
				if time2>=7 then
					Luck=DW_Rand(100)
					---say(boss,"Luck"..Luck)
					-----------if (Luck >= 0 and Luck < 34) then --- or (Luck >= 50 and Luck < 75) then
					if (Luck >= 0 and Luck < 25) or (Luck >= 50 and Luck < 75) then
						SkillIndex = 2-------------------------------------------���饴���ˮ`
						BossTarget = AttackTarget
						CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , skilllv1[SkillIndex] )
						ScriptMessage( OwnerID() , -1 , 2 , "[SC_102623_10]" , 1 )
						sleep(20)
					---------elseif (Luck >= 34 and Luck < 66) then ----or (Luck >= 75 and Luck < 100) then	
					elseif (Luck >= 25 and Luck < 50) or (Luck >= 75 and Luck < 101) then	
						SkillIndex = 1-------------------------------------------���饴���ˮ`
						Play_Chose=DW_HateRemain(1)----------�����h���D�Z
						kp=DW_Rand(table.getn(Play_Chose))
						if kp==0 then 
						end
						if kp~=0 then 
						BossTarget = Play_Chose[kp]		
						CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , skilllv1[SkillIndex] )
						ScriptMessage( OwnerID() , -1 , 2 , "[SC_102623_11]" , 1 )
						sleep(20)
						end
					---elseif (Luck >= 66 and Luck < 101) then 
					----	SkillIndex = 3-------------------------------------------���饴���ˮ`
					---	BossTarget = AttackTarget
					---	CastSpellLV( OwnerID() , boss , Skill[SkillIndex] , skilllv1[SkillIndex] )
					end
					time2=0
				end
				while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID ) ~= 0   do
						sleep(10)
				end
				if time4>=15 then----------------15��@��
					Play_Chose=DW_HateRemain(1)----------�����h���D�Z
					kp=DW_Rand(table.getn(Play_Chose))
					if kp==0 then 
					end
					if kp~=0 then 
					BossTarget = Play_Chose[kp]		
					CastSpellLV( OwnerID() , Play_Chose[kp] , 494298 , 0 )---------�H���դ@��
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_102623_9]" , 1 )
					sleep(20)
					end
					time4=0
				end
				while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID ) ~= 0   do
						sleep(10)
				end
				if time1>=20 then ------------20��@��
					if sb==0 then 
						BossTarget = AttackTarget
						CastSpellLV( OwnerID() , BossTarget , 494276 , 0 )
						ScriptMessage( OwnerID() , -1 , 2 , "[SC_102623_8]" , 1 )
						sleep(30)
						sb=1
					elseif sb==1 then 
					end
				end
				while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID ) ~= 0   do
						sleep(10)
				end
				if time1>=30 then 
					local dt = CreateObjByFlag(102461,780440,2,1)------------�Хߤ@�����Ϊ�����
					SetModeEx( dt , EM_SetModeType_HideName, false)
					SetModeEx( dt , EM_SetModeType_ShowRoleHead, false)---------�I�άO�_����Y����
					SetModeEx( dt , EM_SetModeType_NotShowHPMP, false)
					SetModeEx( dt , EM_SetModeType_Mark, false)  -----�i�_�I��
					SetModeEx( dt , EM_SetModeType_Strikback, false) ---����
					SetModeEx( dt , EM_SetModeType_Move, false) ---����	
					SetModeEx( dt , EM_SetModeType_Fight, false) ---�i���
					AddToPartition(dt , RoomID )----------------�����J�ж�
					sysCastSpellLV( OwnerID() , OwnerID() , 494144 , 0 )
					PlayMotion ( OwnerID(),ruFUSION_ACTORSTATE_CRAFTING_BEGIN )
					ScriptMessage( OwnerID(), -1 , 2 , "[SC_102623_7]" , 2 )---------------�H�p�S�O�����W�A���������a�I
					say(boss,"[SC_102623_7]")
					SetModeEx( OwnerID() , EM_SetModeType_Fight, false) ---�i���
					SetModeEx( OwnerID() , EM_SetModeType_Move, false) ---����	
					sleep(30)
					SetIdleMotion( OwnerID() ,ruFUSION_ACTORSTATE_CRAFTING_LOOP)-----------------------�O�����Ѫ����A
					CastSpellLV( OwnerID() , dt , 494145 , 0 )
					sleep(50)
					while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID ) ~= 0   do
						sleep(2)
					end
					Play_Chose=DW_HateRemain(0)
					kp=table.getn (Play_Chose)-----------------------------���Xtable���ƶq
					------------------------------------say(boss,"kp="..kp)
					for i=1 , kp , 1 do 
						if CheckBuff( Play_Chose[i] , 504613) == false  then --------------------�ˬd�O�_�s�b���@�Ӥ���buff
						SysCastSpellLV( boss ,Play_Chose[i] , 494250 , 0 )-------------���ꪺ
						end
					end
					SetIdleMotion( OwnerID() ,ruFUSION_ACTORSTATE_CRAFTING_LOOP)-----------------------�O�����Ѫ����A
					sleep(20)
					PlayMotion ( OwnerID(), ruFUSION_ACTORSTATE_CRAFTING_END )---------------------����U��
					SetModeEx( OwnerID() , EM_SetModeType_Fight, true) ---�i���
					SetModeEx( OwnerID() , EM_SetModeType_Move, true) ---����	
					SetIdleMotion( OwnerID() ,  ruFUSION_ACTORSTATE_NORMAL)--------�O���a�U�Ҧ�
				---------------------	Debugmsg(0,0,"4")
					DelObj(dt)
					time1=0
					sb=0
				end
			--	if alltime>=40 then ---------------------�R���k�}
			--		mm0=0
			--		alltime=0
			--	end	
			elseif he ==0 then ------------- �ڭ̬O����ڭn���`��  
			-------------------------------------------------------------------------------------------------------------------------------���`�ޯ�ϥ�
				ma = ReadRoleValue( boss , EM_RoleValue_Register2 )
			-----	say(boss,"ma=="..ma)
				if ma == 4 then 
					if st==0 then 
					ScriptMessage( OwnerID(), -1 , 2 , "[SC_102623_13]" , 2 )---------------�H�p�S�O�����W�A���������a�I
					st=1
					end
				end
		---		if ma == 7 then 
			---		if st==1 then 
			--		ScriptMessage( OwnerID(), -1 , 2 , "[SC_102623_14]" , 2 )---------------�H�p�S�O�����W�A���������a�I
			--		st=2
		--			end
		--		end
				if time3==4 then --------------�C4���ͤ@��
					if ma >= 0 and ma < 4 then 
						ball=DW_Rand(20)
						local wb=CreateObjByFlag(113594,780426,ball,1)---------------------------�b���s�����W���ͪ��~
						SetModeEx( wb , EM_SetModeType_Show, true)
						SetModeEx( wb , EM_SetModeType_Fight , false )
						AddToPartition(wb,RoomID)
						SetPlot( wb , "touch" , "Lua_bk_wb_113594" , 30 )-----���ͤ@�Ӫ��������a�h�ߨ����~
						BeginPlot( wb , "Lua_bk_wd_dd_206005",100 )------------------------------------�R���@��----10��
						time3=0
					elseif ma >= 4 and  ma < 7 then
						ball=DW_Rand(20)
						local wb=CreateObjByFlag(113594,780426,ball,1)---------------------------�b���s�����W���ͪ��~
						SetModeEx( wb , EM_SetModeType_Show, true)
						SetModeEx( wb , EM_SetModeType_Fight , false )
						AddToPartition(wb,RoomID)
						SetPlot( wb , "touch" , "Lua_bk_wb_113594" , 30 )-----���ͤ@�Ӫ��������a�h�ߨ����~
						BeginPlot( wb , "Lua_bk_wd_dd_206005",300 )------------------------------------�R���@��----10��
						time3=0
					end
				end
				if time2>=7 then
					ma = ReadRoleValue( boss , EM_RoleValue_Register2 )--------------------Ū���{�b�ݭn�ϥΪk�N����
					if ma >= 0 and  ma < 4 then --------------------�P�_���W��buff
					    Luck=DW_Rand(100)
						---if (Luck >= 0 and Luck < 34) then 
						if (Luck >= 0 and Luck < 25) or (Luck >= 50 and Luck < 75) then
							SkillIndex = 2------------------------------------------���饴���ˮ`
							BossTarget = AttackTarget
							CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv3[SkillIndex] )
							ScriptMessage( OwnerID() , -1 , 2 , "[SC_102623_10]" , 1 )
							sleep(20)
						---elseif (Luck >= 34 and Luck < 67) then 
						elseif (Luck >= 25 and Luck < 50) or (Luck >= 75 and Luck < 101) then	
							SkillIndex = 1-------------------------------------------���饴���ˮ`
							Play_Chose=DW_HateRemain(1)----------�����h���D�Z
							kp=DW_Rand(table.getn(Play_Chose))
							if kp==0 then 
							end
							if kp~=0 then 
							BossTarget = Play_Chose[kp]															
							CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv3[SkillIndex] )
							ScriptMessage( OwnerID() , -1 , 2 , "[SC_102623_11]" , 1 )
							sleep(20)
							end
						---elseif (Luck >= 67 and Luck < 101) then  
						--	SkillIndex = 3-------------------------------------------���饴���ˮ`
						---	BossTarget = AttackTarget
						--	CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv3[SkillIndex] )	
						end
					end
				
					if ma >= 4 and  ma < 7 then
						Luck=DW_Rand(100)
						---if (Luck >= 0 and Luck < 34) then 
						if (Luck >= 0 and Luck < 25) or (Luck >= 50 and Luck < 75) then
							SkillIndex = 2-------------------------------------------���饴���ˮ`
							BossTarget = AttackTarget
							CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv2[SkillIndex] )
							ScriptMessage( OwnerID() , -1 , 2 , "[SC_102623_10]" , 1 )
							sleep(20)
						----elseif (Luck >= 34 and Luck < 67) then 	
						elseif (Luck >= 25 and Luck < 50) or (Luck >= 75 and Luck < 101) then	
							SkillIndex = 1-------------------------------------------���饴���ˮ`
							Play_Chose=DW_HateRemain(1)----------�����h���D�Z
							kp=DW_Rand(table.getn(Play_Chose))
							if kp==0 then 
							end
							if kp~=0 then 
							BossTarget = Play_Chose[kp]		
							CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv2[SkillIndex] )
							ScriptMessage( OwnerID() , -1 , 2 , "[SC_102623_11]" , 1 )
							sleep(20)
							end
					---	elseif (Luck >= 67 and Luck < 101) then  	
						---	SkillIndex = 3-------------------------------------------���饴���ˮ`
						--	BossTarget = AttackTarget
						--	CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv2[SkillIndex] )
						end		
					end
					
					time2=0
				end
				while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID ) ~= 0   do
						sleep(10)
				end
				-------------------------------------------------------------------------------------------------------------------------------�s��ޯ�
				if time4>=15 then----------------15��@��
					SkillIndex = 3
					if ma >= 0 and  ma < 4 then---------------------------�̰�����
						Play_Chose=DW_HateRemain(1)----------�����h���D�Z
						kp=DW_Rand(table.getn(Play_Chose))
						if kp==0 then 
						end
						if kp~=0 then 
							BossTarget = Play_Chose[kp]		
							CastSpellLV( OwnerID() , Play_Chose[kp] , 494297 , 0 )---------�H���դ@��
							ScriptMessage( OwnerID() , -1 , 2 , "[SC_102623_9]" , 1 )	
							sleep(20)
						end
					end
					if ma >= 4 and  ma < 7 then---------------------------�̤�����
						Play_Chose=DW_HateRemain(1)----------�����h���D�Z
						kp=DW_Rand(table.getn(Play_Chose))
						if kp==0 then 
						end
						if kp~=0 then 
							BossTarget = Play_Chose[kp]		
							CastSpellLV( OwnerID() , Play_Chose[kp] , 494298 , 0 )---------�H���դ@��
							ScriptMessage( OwnerID() , -1 , 2 , "[SC_102623_9]" , 1 )	
							sleep(20)
						end
					end
					time4=0
				end
				while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID ) ~= 0   do
						sleep(10)
				end
				if time1 >= 20 then -----------------�ɶ���F�ڭn�ϥΧޯ��o
					if sb==0 then 
						ma = ReadRoleValue( boss , EM_RoleValue_Register2 )--------------------Ū���{�b�ݭn�ϥΪk�N����
						Play_Chose=DW_HateRemain(0)-------------------------------Ū�������Ҧ��H
						if ma >= 0 and  ma < 4 then---------------------------�̰�����
							BossTarget = AttackTarget
							CastSpellLV( OwnerID() , BossTarget , 494256 , 0 )
							ScriptMessage( OwnerID() , -1 , 2 , "[SC_102623_8]" , 1 )	
							sleep(30)
					-----------------------------	----
						end
						if ma >= 4 and  ma < 7 then---------------------------�̤�����
							BossTarget = AttackTarget
							CastSpellLV( OwnerID() , BossTarget , 494276 , 0 )
							ScriptMessage( OwnerID() , -1 , 2 , "[SC_102623_8]" , 1 )	
							sleep(30)
						end
						sb=1
					elseif sb==1 then 
					end
					-----time1=0
				end
				while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID ) ~= 0   do
						sleep(10)
				end
				if time1>=30 then 
					WriteRoleValue(boss , EM_RoleValue_Register4,0)
					local dt = CreateObjByFlag(102461,780440,2,1)------------�Хߤ@�����Ϊ�����
					-----local dt = CreateObjByFlag(100469,780440,2,1)------------�Хߤ@�����Ϊ�����
					SetModeEx( dt , EM_SetModeType_HideName, false)
					SetModeEx( dt , EM_SetModeType_ShowRoleHead, false)---------�I�άO�_����Y����
					SetModeEx( dt , EM_SetModeType_NotShowHPMP, false)
					SetModeEx( dt , EM_SetModeType_Mark, false)  -----�i�_�I��
					SetModeEx( dt , EM_SetModeType_Strikback, false) ---����
					SetModeEx( dt , EM_SetModeType_Move, false) ---����	
					SetModeEx( dt , EM_SetModeType_Fight, false) ---�i���
					AddToPartition(dt , RoomID )----------------�����J�ж�
					sysCastSpellLV( OwnerID() , OwnerID() , 494144 , 0 )
					PlayMotion ( OwnerID(),ruFUSION_ACTORSTATE_CRAFTING_BEGIN )
					ScriptMessage( OwnerID(), -1 , 2 , "[SC_102623_7]" , 2 )---------------�H�p�S�O�����W�A���������a�I
					say(boss,"[SC_102623_7]")
					SetModeEx( OwnerID() , EM_SetModeType_Fight, false) ---�i���
					SetModeEx( OwnerID() , EM_SetModeType_Move, false) ---����	
					sleep(30)
					SetIdleMotion( OwnerID() ,ruFUSION_ACTORSTATE_CRAFTING_LOOP)-----------------------�O�����Ѫ����A
					CastSpellLV( OwnerID() , dt , 494145 , 0 )
					sleep(50)
					while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID ) ~= 0   do
					sleep(2)
					end
					Play_Chose=star_HateListSort(boss)
					kp=table.getn (Play_Chose)-----------------------------���Xtable���ƶq
					---say(boss,"kp="..kp)
					if ma >= 0 and  ma < 4 then---------------------------�̰�����
						for i=1 , kp , 1 do 
							if CheckBuff( Play_Chose[i] , 504613) == false  then --------------------�ˬd�O�_�s�b���@�Ӥ���buff
						---	say(boss,"kp="..Play_Chose[i])
							SysCastSpellLV( boss ,Play_Chose[i] , 494249 , 0 )-------------������
							end
						end
					end
					if ma >= 4 and  ma < 7 then---------------------------�̤�����
						for i=1 , kp , 1 do 
							if CheckBuff( Play_Chose[i] , 504613) == false  then --------------------�ˬd�O�_�s�b���@�Ӥ���buff
							SysCastSpellLV( boss ,Play_Chose[i] , 494250 , 0 )-------------����
							end
						end
					end
					PlayMotion ( OwnerID(), ruFUSION_ACTORSTATE_CRAFTING_END )---------------------����U��
					SetModeEx( OwnerID() , EM_SetModeType_Move, true)
					SetModeEx( OwnerID() , EM_SetModeType_Fight, true) ---�i���
					SetIdleMotion( OwnerID() ,  ruFUSION_ACTORSTATE_NORMAL)--------�O���a�U�Ҧ�
					DelObj(dt)
					time1=0
					sb=0
					for i = 1 , partymember[0] , 1 do
						if ReadRoleValue( partymember[i] , EM_RoleValue_IsDead ) == 0 or CheckBuff( partymember[i] , 504689) == false or CheckBuff( partymember[i] , 504806) == false  then 						
							local bbbTemp = lua_star_CreateNPC( partymember[i] , 0 , 102649 , 10 , RoomID )	--------�ͥX���z��
							SetModeEx( bbbTemp , EM_SetModeType_Fight , false )--�i�������
							SetModeEx( bbbTemp , EM_SetModeType_Strikback, false )--����
							SetModeEx( bbbTemp , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
							SetModeEx( bbbTemp , EM_SetModeType_Mark, false )--�аO
							SetModeEx( bbbTemp , EM_SetModeType_Move, true )--����
							SetModeEx( bbbTemp , EM_SetModeType_Searchenemy, false )--����
							SetModeEx( bbbTemp , EM_SetModeType_ShowRoleHead, false )--�Y����
							SetModeEx( bbbTemp , EM_SetModeType_HideName, false )--�W��
							SetModeEx( bbbTemp , EM_SetModeType_Show, true )--�W��
							DelFromPartition( bbbTemp )
							AddToPartition( bbbTemp ,RoomID)	
							AddBuff(bbbTemp,504752,1,600)-----�ڴN���A�Wbuff
							bbb[table.getn( bbb )+1] = bbbTemp	
							WriteRoleValue(bbbTemp , EM_RoleValue_Register1,partymember[i])-------------------------
							BeginPlot(bbbTemp , "Lua_bk_bb_102649_5",20) -----�l��}�l
							
						---	Setplot( bbbTemp , "range" , "Lua_bk_bb_102649_2" , 40)-------------��J�d��@�����o�h��H������
						---	BeginPlot(bbbTemp , "Lua_bk_bb_102649_4",100)
						---	SetAttack( bbbTemp , partymember[i] )
						end
					end
				end
			end
		elseif HateListCount( boss ) == 0 then----------------���}�԰� �Ҧ��ȳ��Ӧ^�k
			if CombatBegin==1 then-------------------------------------------�ͥX������
				sleep(50)
				DelObj(door)
				time1=0
				time2=0
				time3=0
				time4=0
				time5=0
				alltime=0
				st=0
				CombatBegin=0
				if Ver_Zone118_WaterDragon[ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)] == 0 then 
					local bk=CreateObjByFlag(102623,780440,3,1)-----------------------------------���} �l�X��
					AddToPartition(bk , RoomID )----------------�����J�ж�
					Delobj(boss)
					BeginPlot( bk ,"Lua_bk_wd_102623",0)
				end
			end
		--	if walk==0 then 
		--		LuaFunc_MoveToFlag( boss, 780440 , 4 , 10)-------�j�����y���ʨ�ĤG�ӺX��
		--		PlayMotion ( OwnerID(), ruFUSION_ACTORSTATE_CAST_SP01 )
		---		sleep(20)
		--		walk=1
		--	elseif walk==1 then 
		---		LuaFunc_MoveToFlag( boss, 780440 , 5 , 10)-------�j�����y���ʨ�ĤG�ӺX��
		----		PlayMotion ( OwnerID(), ruFUSION_ACTORSTATE_CAST_SP01 )
		--		sleep(20)
		---		walk=2
		--	elseif walk==2 then 
		---		LuaFunc_MoveToFlag( boss, 780440 , 3 , 10)-------�j�����y���ʨ�ĤG�ӺX��
		--		PlayMotion ( OwnerID(), ruFUSION_ACTORSTATE_CAST_SP01 )
		--		sleep(20)
		--		walk=0
		--	end
		end
	end
end 
function Lua_bk_wd_ma1a_102649()
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local magic=OwnerID()
	SysCastSpellLV( magic , magic , 494146 , 5 )
	---AddBuff(magic,504770,1,600)
	BeginPlot(magic , "Lua_bk_wd_mg_dd_102649",350)
	while 1 do 
		sleep(20)
		SysCastSpellLV( magic , magic , 494295 , 5 )
	end
end
function Lua_bk_wd_ma1_102649()------------------------------------------------------------�x��
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local boss=OwnerID()
	local magic =LuaFunc_CreateObjByObj ( 102461 , TargetID() )
	SetModeEx( magic , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( magic , EM_SetModeType_Strikback, false )--����
	SetModeEx( magic , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( magic , EM_SetModeType_Mark, false )--�аO
	SetModeEx( magic , EM_SetModeType_Move, false )--����
	SetModeEx( magic , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( magic , EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( magic , EM_SetModeType_HideName, false )--�W��
	SetModeEx( magic , EM_SetModeType_Show, true )--�W��
	DelFromPartition( magic )
	AddToPartition( magic ,RoomID )	
---	WriteRoleValue(magic , EM_RoleValue_PID,boss)
	AddBuff(magic,504750,1,600)
	BeginPlot(magic,"Lua_bk_wd_ma1a_102649",10)
	local magicm=ReadRoleValue(boss,EM_RoleValue_Register4)--------------Ū��EM_RoleValue_Register4����
	if magicm < 3 then 
		AddBuff(magic,504770,1,600)-----�ڴN���A�Wbuff
		magicm=magicm+1
		WriteRoleValue(boss , EM_RoleValue_Register4,magicm)
	end
	---	SysCastSpellLV( magic , magic , 494146 , 0 )
---	BeginPlot(magic , "Lua_bk_wd_mg_dd_102649",200)
    
	
end
function Lua_bk_wd_ma2_102649()------------------------------------------------------------����
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local boss=OwnerID()
	local magic =LuaFunc_CreateObjByObj ( 102461 , TargetID() )
	SetModeEx( magic , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( magic , EM_SetModeType_Strikback, false )--����
	SetModeEx( magic , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( magic , EM_SetModeType_Mark, false )--�аO
	SetModeEx( magic , EM_SetModeType_Move, false )--����
	SetModeEx( magic , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( magic , EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( magic , EM_SetModeType_HideName, false )--�W��
	SetModeEx( magic , EM_SetModeType_Show, true )--�W��
	DelFromPartition( magic )
	AddToPartition( magic ,RoomID )	
---	SysCastSpellLV( magic , magic , 494147 , 0 )
	AddBuff(magic,504750,1,600)
	AddBuff(magic,504770,1,600)
----	BeginPlot(magic , "Lua_bk_wd_mg_dd_102649",200)
	BeginPlot(magic,"Lua_bk_wd_ma2a_102649",10)
	
end
function Lua_bk_wd_ma2a_102649()
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local magic=OwnerID()
-----	local boss =ReadRoleValue(m1count ,EM_RoleValue_PID)
	SysCastSpellLV( magic , magic , 494147 , 5 )
----	AddBuff(magic,504770,1,600)
	BeginPlot(magic , "Lua_bk_wd_mg_dd_102649",350)
	while 1 do 
		sleep(20)
		SysCastSpellLV( magic , magic , 494296 , 5 )
	end
end
function Lua_bk_wd_dead_102623()---------------------------------------�����������_�c��ܾ�
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local boss=OwnerID()
	local ma = ReadRoleValue( boss , EM_RoleValue_Register2 )----------------Ū���ϥΤF�X��
	local he = ReadRoleValue( boss , EM_RoleValue_Register1 )
	local door =ReadRoleValue( boss , EM_RoleValue_Register3 )
	local bg=0-----------------bg=�_��
	Delobj(door)
	LuaS_118toZone1_4()
	sleep(20)
	ScriptMessage( OwnerID() , -1 , 2 , "[SC_102623_15]" , 1 )
	if he == 0 then  ----------------------------------------���`�Ҧ����ӨϥΦ��ƨӧP�w�_�۵���
		if ma == 0 then 
			bg = CreateObjByFlag( 102564,780440,1,1)
			SetModeEx( bg , EM_SetModeType_Fight , false )--�i�������
			AddToPartition(bg , RoomID )
		end
		if ma >=1 then 
			bg = CreateObjByFlag( 102565,780440,1,1)
			SetModeEx( bg , EM_SetModeType_Fight , false )--�i�������
			AddToPartition(bg , RoomID )
		end
	elseif he == 1 then ---------------------------�i�J²��Ҧ��_�۴N�O�C����
			bg = CreateObjByFlag( 102565,780440,1,1)
			SetModeEx( bg , EM_SetModeType_Fight , false )--�i�������
			AddToPartition(bg , RoomID )
	end
	
end
function Lua_bk_wd_mg_dd_102649()
local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local magic=OwnerID()
	DelObj(magic)
end
function Lua_bk_wb_206005()------------------------------�b�a�W���ͤ@�ӦB�W�I�Υi�H�o�쪫�~
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	GiveBodyItem ( TargetID(), 206005, 1 )
	Hide(OwnerID())
	DelObj(OwnerID())
end
function Lua_bk_wd_dd_206005()
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local wb=OwnerID()
	DelObj(wb)
end
function Lua_bk_wbmg_206005()--------------�缾�a�ϥε������ߪ�buff
	CancelBuff(TargetID() , 504689 )----------------------------------�������a���Wbuff
	CancelBuff(TargetID() , 504806 )----------------------------------�������a���Wbuff
end
function Lua_bk_wbmgch_206005()
	if ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 102623 then
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
function Lua_bk_wb_113594()
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	SetPlot( TargetID()  ,"touch", "" ,0 )
	BeginPlot( TargetID() , "Lua_bk_wb_206005",0 )
end
function Lua_bk_bb_102649_2()		------------���z�μ@��
	BeginPlot( TargetID(), "Lua_bk_bb_102649_3", 1 )	
end

function Lua_bk_bb_102649_3()		------------���c�@��
	Setplot( OwnerID() , "range" , "" , 0)		-------�קK����Ĳ�o
	local bkball = 494299		--------���c
	CastSpell( OwnerID() , OwnerID() , bkball)	
	sleep(30)
	DelObj(OwnerID())
end
function Lua_bk_bb_102649_4()
	DelObj(OwnerID())---------------------------------�R���ۤv
end
function Lua_bk_bb_102649_5()
local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local play=ReadRoleValue(OwnerID(),EM_RoleValue_Register1)------�y�X�ؼ�
local bbbTemp=OwnerID()
	Setplot( bbbTemp , "range" , "Lua_bk_bb_102649_2" , 40)-------------��J�d��@�����o�h��H������
	BeginPlot(bbbTemp , "Lua_bk_bb_102649_4",150)
	SetAttack( bbbTemp , play )
	
end
