function Lua_bk_122_start_102707()------------------�׺ݱ��
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local start = OwnerID()
	local mob=0
	local model=0
	local magictime=0
	local ggtime=0
	local gg=0
	local skillpower=0
	local skillseact=0
	local powerbuff=505599
	local magicball={}
	local door=0
	local power=0
	local bosspower=0
	local CombatBegin=0
	local bufftime=0
	local x=0
	local boss=0
	local afdoor = CreateObjByFlag(102930,780427,2,1)
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
	local afdoor1 = CreateObjByFlag(103086,780427,4,1)
	SetModeEx( afdoor1 , EM_SetModeType_Gravity, false) ---���O
	SetModeEx( afdoor1 , EM_SetModeType_Mark, false)
	SetModeEx( afdoor1 , EM_SetModeType_HideName, false)
	SetModeEx( afdoor1 , EM_SetModeType_ShowRoleHead, false)
	SetModeEx( afdoor1 , EM_SetModeType_NotShowHPMP, false)
	SetModeEx( afdoor1 , EM_SetModeType_Obstruct, true)   -----���O
	SetModeEx( afdoor1, EM_SetModeType_Strikback, false) ---����
	SetModeEx( afdoor1 , EM_SetModeType_Move, false) ---����	
	SetModeEx( afdoor1 , EM_SetModeType_Fight, false) ---�i���
	SetModeEx( afdoor1, EM_SetModeType_SearchenemyIgnore, false) 
	SetModeEx( afdoor1 , EM_SetModeType_Searchenemy, false)
	SetModeEx( afdoor1 , EM_SetModeType_Show, true)
	AddToPartition( afdoor1 , RoomID )
	BeginPlot( afdoor1 ,"Lua_bk_door_102707",0)
	local afdoor2 = CreateObjByFlag(103086,780427,5,1)
	SetModeEx( afdoor2 , EM_SetModeType_Gravity, false) ---���O
	SetModeEx( afdoor2 , EM_SetModeType_Mark, false)
	SetModeEx( afdoor2 , EM_SetModeType_HideName, false)
	SetModeEx( afdoor2 , EM_SetModeType_ShowRoleHead, false)
	SetModeEx( afdoor2 , EM_SetModeType_NotShowHPMP, false)
	SetModeEx( afdoor2 , EM_SetModeType_Obstruct, true)   -----���O
	SetModeEx( afdoor2, EM_SetModeType_Strikback, false) ---����
	SetModeEx( afdoor2 , EM_SetModeType_Move, false) ---����	
	SetModeEx( afdoor2 , EM_SetModeType_Fight, false) ---�i���
	SetModeEx( afdoor2, EM_SetModeType_SearchenemyIgnore, false) 
	SetModeEx( afdoor2 , EM_SetModeType_Searchenemy, false)
	SetModeEx( afdoor2 , EM_SetModeType_Show, true)
	AddToPartition( afdoor2 , RoomID )
	BeginPlot( afdoor2 ,"Lua_bk_door_102707",0)
	boss = CreateObjByFlag(102707,780427,1,1)
	AddToPartition( boss , RoomID )
	WriteRoleValue( boss, EM_RoleValue_PID,start)
	BeginPlot( boss ,"Lua_bk_122_boss0_102707",0)---------------------------------���@���Ҧ�
	SetPlot( boss , "dead" , "Lua_bk_122_dead_102707" , 10 )
	local x=0
	while 1 do 
	sleep(10)
		x=ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
		if x==1 then
			sleep(50)
			boss = CreateObjByFlag(102707,780427,1,1)
			AddToPartition( boss , RoomID )
			WriteRoleValue( boss, EM_RoleValue_PID,start)
			BeginPlot( boss ,"Lua_bk_122_boss0_102707",0)---------------------------------���@���Ҧ�
			SetPlot( boss , "dead" , "Lua_bk_122_dead_102707" , 10 )
			x=0
			sleep(10)
			DelObj(door)
			WriteRoleValue(start, EM_RoleValue_Register1,0)
			WriteRoleValue(start, EM_RoleValue_Register2,0)
			gg=0
			ggtime=0
			model=0
			mob=0
			magictime=0
			CombatBegin=0
			bufftime=0
		end
		if x==2 then 	------�i�J�԰�
			if CombatBegin==0 then
				door = CreateObjByFlag(102930,780427,3,1)-----------------------�b�X��2�W����J���ת�
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
			power=ReadRoleValue(OwnerID(),EM_RoleValue_Register2)--------------------�O���ϥΦ���
			ggtime=ggtime+1
			if ggtime<=600 then 
				magictime=magictime+1
				bufftime=bufftime+1
				if magictime>=30 then -----------------------------�]�w �F��
					while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID ) ~= 0   do------------�ˬd�O�_�A��o�өۦ����ɭ� �٦���L�ۦ�����
							sleep(5)
					end
					for i = 1 , 6 , 1 do
						magic1=DW_Rand(50)
						magicball[i]= CreateObjByFlag(114313,780426,magic1,1)
						AddToPartition(magicball[i] , RoomID )
						WriteRoleValue( magicball[i], EM_RoleValue_PID,start)
						AddBuff(magicball[i], 505620 , 1 , -1 )
						BeginPlot(magicball[i],"Lua_bk_122_move_114313",10)
						SetPlot( magicball[i] , "touch" , "Lua_bk_122_boss_114313" , 60 )-----���ͤ@�Ӫ��������a�h�ߨ����~
					end
					magictime=0-------
				end
				if bufftime>=20 then 
					local PPL = SetSearchAllPlayer(RoomID)
					for i = 1 , PPL , 1 do 
						local ID = GetSearchResult()
						AddBuff(ID,505597,0,-1)----�L�k�ϥΪ��~
					end	
					bufftime=0
				end
				if mob==0 then 
					model =model+1 
					bosspower=ReadRoleValue(boss,EM_RoleValue_Register2)--------------------�O���ϥΦ���
					if power~=bossbower then 
						bosspower=power
						WriteRoleValue(boss, EM_RoleValue_Register2,power)
						CancelBuff( boss ,  powerbuff )
						for i=1,power do 
							AddBuff( boss , powerbuff , 0 , -1 )
						end	
					end
					skillseact=Lua_BuffPosSearch( boss ,  powerbuff )---------------------�磌��h�ˬd�o���ؼ�buff
					if skillseact>=0 then   
						skillpower=BuffInfo( boss , skillseact , EM_BuffInfoType_Power )
						if skillpower>=9 then 
							while 	ReadRoleValue(boss , EM_RoleValue_SpellMagicID ) ~= 0   do------------�ˬd�O�_�A��o�өۦ����ɭ� �٦���L�ۦ�����
								sleep(5)
							end
							CancelBuff( boss ,  powerbuff )
							for i=1,skillpower-10 do 
								AddBuff( boss , powerbuff , 0 , -1 )
							end
							ScriptMessage( boss , -1 , 2 , "[SC_102707_04]" , 1 )
							say( boss,"[SC_102707_04]")
							WriteRoleValue(boss, EM_RoleValue_Register2,skillpower-10)
							WriteRoleValue(start, EM_RoleValue_Register2,skillpower-10)
							CastSpellLV( boss , boss , 494880 , 1 )------------------�j����
							sleep(50)
						end
					end
					if model>=45 then ------------�Ĥ@���q
						----ScriptMessage( boss , -1 , 2 , "[SC_102707_08]" , 1 )
						local AttackTarget = ReadRoleValue( boss , EM_RoleValue_AttackTargetID )
						mob=1
						model=0
						boss_nowhp=ReadRoleValue( boss, EM_RoleValue_HP)----Ū��boss�{�b����q
						boss1=LuaFunc_CreateObjByObj(103041,boss)
						AddBuff(boss1, 505637 , 1 , -1 )------------------------------���}�԰�����^��
						ScriptMessage( boss1 , -1 , 2 , "[SC_102707_08]" , 1 )
						SetAttack( boss1 , AttackTarget)
						--say(OwnerID(),"boss1"..boss1)
						--say(OwnerID(),"boss"..boss)
						WriteRoleValue( boss1, EM_RoleValue_PID,start)
						WriteRoleValue( boss1, EM_RoleValue_HP,boss_nowhp)
						Delobj(boss)
						BeginPlot(boss1,"Lua_bk_122_boss2_102707",50)
						CastSpellLV( boss1 , boss1 , 494883 , 1 )---------����@�Ӱ��y���k�N.
						SetPlot( boss1 , "dead" , "Lua_bk_122_dead_102707" , 10 )
					end
				end
				if mob==1 then 
					model =model+1 
					---say(OwnerID(),"model"..model)
					bosspower=ReadRoleValue(boss1,EM_RoleValue_Register2)--------------------�O���ϥΦ���
					if power~=bossbower then 
						bosspower=power
						WriteRoleValue(boss1, EM_RoleValue_Register2,power)
						CancelBuff( boss1 ,  powerbuff )
						for i=1,power do 
							AddBuff( boss1 , powerbuff , 0 , -1 )
						end	
					end
					skillseact=Lua_BuffPosSearch( boss1 ,  powerbuff )---------------------�磌��h�ˬd�o���ؼ�buff
					if skillseact>=0 then   --------------�����L�k�ϥΪ��~��buff
						skillpower=BuffInfo( boss1 , skillseact , EM_BuffInfoType_Power )
						if skillpower>=9 then 
							while 	ReadRoleValue(boss1 , EM_RoleValue_SpellMagicID ) ~= 0   do------------�ˬd�O�_�A��o�өۦ����ɭ� �٦���L�ۦ�����
								sleep(5)
							end
							CancelBuff( boss1 ,  powerbuff )
							for i=1,skillpower-10 do 
								AddBuff( boss1 , powerbuff , 0 , -1 )
							end
							ScriptMessage( boss1 , -1 , 2 , "[SC_102707_04]" , 1 )
							say( boss1,"[SC_102707_04]")
							WriteRoleValue(boss1, EM_RoleValue_Register2,skillpower-10)
							WriteRoleValue(start, EM_RoleValue_Register2,skillpower-10)
							CastSpellLV( boss1 , boss1 , 494880 , 1 )------------------�j����
							sleep(50)
						end
					end
					if model>=45 then ------------�ĤG���q
						ScriptMessage( boss1 , -1 , 2 , "[SC_102707_08]" , 1 )
						local AttackTarget = ReadRoleValue( boss , EM_RoleValue_AttackTargetID )
						mob=0
						model=0
						boss_nowhp=ReadRoleValue( boss1, EM_RoleValue_HP)----Ū��boss�{�b����q
						boss=LuaFunc_CreateObjByObj(103079,boss1)
						AddBuff(boss, 505637 , 1 , -1 )------------------------------���}�԰�����^��
						ScriptMessage( boss , -1 , 2 , "[SC_102707_08]" , 1 )
						SetAttack( boss , AttackTarget)
						WriteRoleValue( boss, EM_RoleValue_PID,start)
						WriteRoleValue( boss, EM_RoleValue_HP,boss_nowhp)
						Delobj(boss1)
						BeginPlot(boss , "Lua_bk_122_boss1_102707",50)
						CastSpellLV( boss , boss , 494883 , 1 )---------����@�Ӱ��y���k�N
						SetPlot( boss , "dead" , "Lua_bk_122_dead_102707" , 10 )
					end	
				end
			elseif ggtime>600 then
				if gg==0 then 
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_102707_07]" , 1 )
					gg=1
				end
					AddBuff(boss, 505224 , 1 , -1 )--------------
					AddBuff(boss1, 505224 , 1 , -1 )--------------
			end
		end	
		if x==3 then 	----------���}�԰�
			CombatBegin=0
			local PPL = SetSearchAllPlayer(RoomID)
			for i = 1 , PPL , 1 do 
				local ID = GetSearchResult()
				if ReadRoleValue( ID, EM_RoleValue_VOC) ~= 0 and ReadRoleValue( ID , EM_RoleValue_RoomID  ) == RoomID then 
					CancelBuff(ID , 505597 )-------�M������ϥΪ��~��buff
					SetFlag( ID, 543622, 1 )
				end
			end	
			Lua_bk_122_boss_530426()
			Delobj(afdoor)
			Delobj(afdoor1)
			Delobj(afdoor2)
			DelObj(door)
			WriteRoleValue(start, EM_RoleValue_Register1,3)	
			WriteRoleValue(start, EM_RoleValue_Register2,0)
			gg=0
			ggtime=0
			model=0
			mob=0
			magictime=0
		end	
		
	end
end
function Lua_bk_122_boss0_102707()
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------�}�l���ж�
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local boss=OwnerID()
	local magicball={}
	local CombatBegin = 0
	local skill1={494878,494885}------1.�B��N 2. ���B
	local SkillIndex=0
	local skilllv={0,1}----�ۦ��¤O
	local ctime1=0
	local ctime2=0 
	local btime=0------buff�ɶ�
	local magictime=0--------�ͥXmagicball���ɶ�
	local powerbuff=504374
	local skillpower=0
	local nowskillpower=0
	local skillseact=0
	local Luck=0
	local Play_Chose={}
	local kp=0
	local magic1=0
	local magic2=0
	local lp=0
	local x=0
	while 1 do 
		sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )   ------ ��M�ثe�������ؼ�
		local BossTarget=AttackTarget
		if HateListCount( boss ) ~= 0 then	---- �T�w�L�{�b�����H
			ctime1=ctime1+1
			btime=btime+1 
			if CombatBegin == 0 then							---------------�u���}����@��
				CombatBegin = 1
				ScriptMessage( OwnerID() , -1 , 2 , "[SC_102707_01]" , 1 )
				local PPL = SetSearchAllPlayer(RoomID)
				for i = 1 , PPL , 1 do 
					local ID = GetSearchResult()
					if ReadRoleValue( ID, EM_RoleValue_VOC) ~= 0 then 
						AddBuff(ID,505597,0,-1)----�L�k�ϥΪ��~
					end
				end	
				--door = CreateObjByFlag(102462,780440,6,1)-----------------------�b�X��2�W����J���ת�
			--	SetModeEx( door , EM_SetModeType_Gravity, false) ---���O
			--	SetModeEx( door , EM_SetModeType_Mark, false)
			--	SetModeEx( door , EM_SetModeType_HideName, false)
			--	SetModeEx( door , EM_SetModeType_ShowRoleHead, false)
			--	SetModeEx( door , EM_SetModeType_NotShowHPMP, false)
			--	SetModeEx( door , EM_SetModeType_Obstruct, true)   -----���O
			--	SetModeEx( door , EM_SetModeType_Strikback, false) ---����
			--	SetModeEx( door , EM_SetModeType_Move, false) ---����	
			--	SetModeEx( door , EM_SetModeType_Fight, false) ---�i���
			--	SetModeEx( door , EM_SetModeType_SearchenemyIgnore, false) 
			--	SetModeEx( door , EM_SetModeType_Searchenemy, false)
			--	SetModeEx( door , EM_SetModeType_Show, true)
			--	AddToPartition( door , RoomID )
			--	WriteRoleValue(boss, EM_RoleValue_Register1,door)	
				WriteRoleValue(start, EM_RoleValue_Register1,2)	
			end		
			if btime>= 3 then 
				if x==0 then 
				SkillIndex = 1------------------------------------------���饴���ˮ`
				BossTarget = AttackTarget
				ScriptMessage( OwnerID() , -1 , 2 , "[SC_102707_06]" , 1 )
				---say( OwnerID(),"[SC_102707_06]")
				CastSpellLV( OwnerID() , BossTarget , Skill1[SkillIndex] , 1 )
				x=1
				end
			end	
			if ctime1>=15 then 
				Luck=DW_Rand(100)
				if (Luck >= 0 and Luck < 25) or (Luck >= 50 and Luck < 75) then
					SkillIndex = 1------------------------------------------���饴���ˮ`
					BossTarget = AttackTarget
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_102707_05]" , 1 )
				--	say( OwnerID(),"[SC_102707_05]")
					CastSpellLV( OwnerID() , BossTarget , Skill1[SkillIndex] , 1 )
					sleep(20)
				elseif (Luck >= 25 and Luck < 50) or (Luck >= 75 and Luck < 101) then	
					SkillIndex = 2-------------------------------------------���饴���ˮ`
					Play_Chose=DW_HateRemain(0)---------
					kp=DW_Rand(table.getn(Play_Chose))
					if kp==0 then 
					end
					if kp~=0 then 
					BossTarget = Play_Chose[kp]	
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_102707_02]" , 1 )	
					say( OwnerID(),"[SC_102707_02]")					
					local caball = Lua_DW_CreateObj("obj",102420,BossTarget,0)
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
					CastSpellLv(caball,caball,494885,1)
					WriteRoleValue(caball, EM_RoleValue_Livetime,10)	---------------�s�b�ɶ�livetime
					sleep(20)
					end
				end
				ctime1=0
			end
		elseif HateListCount( boss ) == 0 then----------------���}�԰� �Ҧ��ȳ��Ӧ^�k
			if CombatBegin == 1 then
			--	say(OwnerID(),"gg")
				sleep(30)
				lp=0
				local PPL = SetSearchAllPlayer(RoomID)
				if PPL>=1 then ------------�����L
					for i = 1 , PPL , 1 do ---�⪱�a��J�ж��� 
						local ID = GetSearchResult()
						if ReadRoleValue( ID , EM_RoleValue_IsDead ) ~= 1 and 
						ReadRoleValue( ID, EM_RoleValue_VOC) ~= 0  and 
						ReadRoleValue( ID , EM_RoleValue_RoomID  ) == RoomID and 
						GetDistance( ID , boss ) < 800 then
							SetAttack( boss , ID)
							break
						elseif ReadRoleValue( ID , EM_RoleValue_IsDead ) == 1 or ReadRoleValue( ID, EM_RoleValue_VOC) == 0  then 
							lp=lp+1
						end
					end
					if PPL==lp then 
						WriteRoleValue(start, EM_RoleValue_Register1,1)	
						sleep(50)
						DelObj(boss)
						CombatBegin=0
						lp=0
					end
				elseif PPL==0 then 
					WriteRoleValue(start, EM_RoleValue_Register1,1)	
					sleep(50)
					DelObj(boss)
					CombatBegin=0
				end
			end
		end
	end
end
function Lua_bk_122_boss1_102707()
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------�}�l���ж�
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local boss=OwnerID()
	local magicball={}
	local CombatBegin = 0
	local skill1={494878,494885}------1.�B��N 2. ���� 
	local SkillIndex=0
	local skilllv={0,1}----�ۦ��¤O
	local ctime1=0
	local ctime2=0 
	local btime=0------buff�ɶ�
	local magictime=0--------�ͥXmagicball���ɶ�
	local powerbuff=504374
	local skillpower=0
	local nowskillpower=0
	local skillseact=0
	local Luck=0
	local Play_Chose={}
	local kp=0
	local magic1=0
	local magic2=0
	local lp=0
	local x=0
	while 1 do 
		sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )   ------ ��M�ثe�������ؼ�
		local BossTarget=AttackTarget
		if HateListCount( boss ) ~= 0 then	---- �T�w�L�{�b�����H
			magictime=magictime+1
			ctime1=ctime1+1
			btime=btime+1 
			if btime>= 3 then 
				if x==0 then 
				SkillIndex = 1------------------------------------------���饴���ˮ`
				BossTarget = AttackTarget
				ScriptMessage( OwnerID() , -1 , 2 , "[SC_102707_06]" , 1 )
				---say( OwnerID(),"[SC_102707_06]")
				CastSpellLV( OwnerID() , BossTarget , Skill1[SkillIndex] , 1 )
				x=1
				end
			end	
	--		if CombatBegin == 0 then							---------------�u���}����@��
		---		CombatBegin = 1
		---		door = CreateObjByFlag(102462,780440,6,1)-----------------------�b�X��2�W����J���ת�
		---		SetModeEx( door , EM_SetModeType_Gravity, false) ---���O
		--		SetModeEx( door , EM_SetModeType_Mark, false)
		---		SetModeEx( door , EM_SetModeType_HideName, false)
		--		SetModeEx( door , EM_SetModeType_ShowRoleHead, false)
		----		SetModeEx( door , EM_SetModeType_NotShowHPMP, false)
		---		SetModeEx( door , EM_SetModeType_Obstruct, true)   -----���O
		---		SetModeEx( door , EM_SetModeType_Strikback, false) ---����
		---		SetModeEx( door , EM_SetModeType_Move, false) ---����	
		----		SetModeEx( door , EM_SetModeType_Fight, false) ---�i���
		---		SetModeEx( door , EM_SetModeType_SearchenemyIgnore, false) 
		---		SetModeEx( door , EM_SetModeType_Searchenemy, false)
		---		SetModeEx( door , EM_SetModeType_Show, true)
		---		AddToPartition( door , RoomID )
		---		WriteRoleValue(boss, EM_RoleValue_Register1,door)	
				WriteRoleValue(start, EM_RoleValue_Register1,2)	
		--	end	
			if ctime1>=15 then 
				Luck=DW_Rand(100)
				if (Luck >= 0 and Luck < 25) or (Luck >= 50 and Luck < 75) then
					SkillIndex = 1------------------------------------------���饴���ˮ`
					BossTarget = AttackTarget
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_102707_05]" , 1 )
					---say( OwnerID(),"[SC_102707_05]")
					CastSpellLV( OwnerID() , BossTarget , Skill1[SkillIndex] , 1 )
					sleep(20)
				elseif (Luck >= 25 and Luck < 50) or (Luck >= 75 and Luck < 101) then	
					SkillIndex = 2-------------------------------------------���饴���ˮ`
					Play_Chose=DW_HateRemain(0)---------
					kp=DW_Rand(table.getn(Play_Chose))
					if kp==0 then 
					end
					if kp~=0 then 
					BossTarget = Play_Chose[kp]		
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_102707_02]" , 1 )
					say( OwnerID(),"[SC_102707_02]")
					local caball = Lua_DW_CreateObj("obj",102420,BossTarget,0)
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
					CastSpellLv(caball,caball,494885,1)
					WriteRoleValue(caball, EM_RoleValue_Livetime,10)	---------------�s�b�ɶ�livetime
					sleep(20)
					end
				end
				ctime1=0
			end			
		elseif HateListCount( boss ) == 0 then----------------���}�԰� �Ҧ��ȳ��Ӧ^�k
		--	if CombatBegin == 1 then
			--say(OwnerID(),"gg")
				sleep(30)
				lp=0
				local PPL = SetSearchAllPlayer(RoomID)
				if PPL>=1 then ------------�����L
					for i = 1 , PPL , 1 do ---�⪱�a��J�ж��� 
						local ID = GetSearchResult()
						if ReadRoleValue( ID , EM_RoleValue_IsDead ) ~= 1 and ReadRoleValue( ID, EM_RoleValue_VOC) ~= 0  and ReadRoleValue( ID , EM_RoleValue_RoomID  ) == RoomID then
							SetAttack( boss , ID)
							break
						elseif ReadRoleValue( ID , EM_RoleValue_IsDead ) == 1 or ReadRoleValue( ID, EM_RoleValue_VOC) == 0  then 
							lp=lp+1
						end
					end
					if PPL==lp then 
						WriteRoleValue(start, EM_RoleValue_Register1,1)	
						sleep(50)
						DelObj(boss)
						CombatBegin=0
						lp=0
					end
				elseif PPL==0 then 
					WriteRoleValue(start, EM_RoleValue_Register1,1)	
					sleep(50)
					DelObj(boss)
				end
		---	end
		end
	end
end
function Lua_bk_122_boss2_102707()
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------�}�l���ж�
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local boss=OwnerID()
	local magicball={}
	local CombatBegin = 0
	local skill1={494879,494886}------1.�B��N 2. ���� 
	local SkillIndex=0
	local skilllv={0,1}----�ۦ��¤O
	local ctime1=0
	local ctime2=0 
	local btime=0------buff�ɶ�
	local magictime=0--------�ͥXmagicball���ɶ�
	local powerbuff=504374
	local skillpower=0
	local nowskillpower=0
	local skillseact=0
	local Luck=0
	local Play_Chose={}
	local kp=0
	local magic1=0
	local magic2=0
	local lp=0
	local x=0
	while 1 do 
		sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )   ------ ��M�ثe�������ؼ�
		local BossTarget=AttackTarget
		if HateListCount( boss ) ~= 0 then	---- �T�w�L�{�b�����H
			magictime=magictime+1
			ctime1=ctime1+1
			btime=btime+1 
			if btime>= 3 then 
				if x==0 then 
				SkillIndex = 1------------------------------------------���饴���ˮ`
				BossTarget = AttackTarget
				ScriptMessage( OwnerID() , -1 , 2 , "[SC_102707_06]" , 1 )
				---say( OwnerID(),"[SC_102707_06]")
				CastSpellLV( OwnerID() , BossTarget , Skill1[SkillIndex] , 1 )
				x=1
				end
			end		
	--		if CombatBegin == 0 then							---------------�u���}����@��
		---		CombatBegin = 1
		---		door = CreateObjByFlag(102462,780440,6,1)-----------------------�b�X��2�W����J���ת�
		---		SetModeEx( door , EM_SetModeType_Gravity, false) ---���O
		--		SetModeEx( door , EM_SetModeType_Mark, false)
		---		SetModeEx( door , EM_SetModeType_HideName, false)
		--		SetModeEx( door , EM_SetModeType_ShowRoleHead, false)
		----		SetModeEx( door , EM_SetModeType_NotShowHPMP, false)
		---		SetModeEx( door , EM_SetModeType_Obstruct, true)   -----���O
		---		SetModeEx( door , EM_SetModeType_Strikback, false) ---����
		---		SetModeEx( door , EM_SetModeType_Move, false) ---����	
		----		SetModeEx( door , EM_SetModeType_Fight, false) ---�i���
		---		SetModeEx( door , EM_SetModeType_SearchenemyIgnore, false) 
		---		SetModeEx( door , EM_SetModeType_Searchenemy, false)
		---		SetModeEx( door , EM_SetModeType_Show, true)
		---		AddToPartition( door , RoomID )
		---		WriteRoleValue(boss, EM_RoleValue_Register1,door)	
				WriteRoleValue(start, EM_RoleValue_Register1,2)	
		--	end	
			if ctime1>=15 then 
				Luck=DW_Rand(100)
				if (Luck >= 0 and Luck < 25) or (Luck >= 50 and Luck < 75) then
					SkillIndex = 1------------------------------------------���饴���ˮ`
					BossTarget = AttackTarget
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_102707_06]" , 1 )
				---	say( OwnerID(),"[SC_102707_06]")
					CastSpellLV( OwnerID() , BossTarget , Skill1[SkillIndex] , 1 )
					sleep(20)
				elseif (Luck >= 25 and Luck < 50) or (Luck >= 75 and Luck < 101) then	
					SkillIndex = 2-------------------------------------------���饴���ˮ`
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_102707_03]" , 1 )
				---	say( OwnerID(),"[SC_102707_03]")
					CastSpellLV( OwnerID() , OwnerID() , Skill1[SkillIndex] , 1 )
					sleep(10)
				end
				ctime1=0
			end			
		elseif HateListCount( boss ) == 0 then----------------���}�԰� �Ҧ��ȳ��Ӧ^�k
			--say(OwnerID(),"gg")
		--	if CombatBegin == 1 then
				sleep(30)
				lp=0
				local PPL = SetSearchAllPlayer(RoomID)
				if PPL>=1 then ------------�����L
					for i = 1 , PPL , 1 do ---�⪱�a��J�ж��� 
						local ID = GetSearchResult()
						if ReadRoleValue( ID , EM_RoleValue_IsDead ) ~= 1 and ReadRoleValue( ID, EM_RoleValue_VOC) ~= 0  and ReadRoleValue( ID , EM_RoleValue_RoomID  ) == RoomID then
							SetAttack( boss , ID)
							break
						elseif ReadRoleValue( ID , EM_RoleValue_IsDead ) == 1 or ReadRoleValue( ID, EM_RoleValue_VOC) == 0  then 
							lp=lp+1
						end
					end
					if PPL==lp then 
						WriteRoleValue(start, EM_RoleValue_Register1,1)	
						sleep(50)
						DelObj(boss)
						CombatBegin=0
						lp=0
					end
				elseif PPL==0 then 
					WriteRoleValue(start, EM_RoleValue_Register1,1)	
					sleep(50)
					DelObj(boss)
				end
		---	end
		end
	end
end
function Lua_bk_122_dead_102707()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local boss=OwnerID()
--	local door=ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
	WriteRoleValue(start, EM_RoleValue_Register1,3)	
end
function Lua_bk_122_boss_114313()
	local RoomID = ReadRoleValue( TargetID() , EM_RoleValue_RoomID )	
	local magicball = TargetID()
	local power=0--------�]�w�������W��buff
	local start = ReadRoleValue(TargetID(),EM_RoleValue_PID)
	SetPlot( TargetID()  ,"touch", "" ,0 )
	AddBuff( OwnerID() , 505598, 0 , -1 )----�^�]�O��BUFF
	power=ReadRoleValue(start,EM_RoleValue_Register2)--------------Register2���O�����¤O��.
	power=power+1
	WriteRoleValue(start, EM_RoleValue_Register2,power)	
	AddBuff( start , 505599, power , -1 )----�����֭p�@��
	sleep(10)
	CastSpellLv(TargetID(),TargetID(),494884,1)-----------���񣸭ӯ}�����k�N
	sleep(10)
	Delobj(TargetID())
end
function Lua_bk_122_move_114313()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )	
	local magicball = OwnerID()
	local magic2=0 
	magic2=DW_Rand(50)
	MoveToFlagEnabled ( magicball,  false )
	LuaFunc_MoveToFlag( magicball, 780425 , magic2 , 10)-------���ʨ�ڷQ�쪺�a��h
	sleep(20)
	DelObj(magicball)
end
function Lua_bk_check_505617()
	if CheckBuff(OwnerID() , 505601) == true then	--�ˬd��buff
		AddBuff( OwnerID() , 505605, 0 , -1 )
		---SysCastSpellLV( OwnerID() , OwnerID() , 494881 ,1)	--		
	end
end
function Lua_bk_door_102707()
	SetDefIdleMotion(OwnerID(),ruFUSION_MIME_ACTIVATE_LOOP)
end
