function bk_129_104044()--------------������ai
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
	local boss = OwnerID()--------�������	
	local CombatBegin=0
	local skill1={495467,495674}------1.�B�M 2.��������
	local SkillIndex=0
	local skilllv={6,7}----�ۦ��¤O
	local skilltime=0------�ޯ�I��ɶ�
	local Luck=0 -----�p��X����ۦ�
	local Play_Chose={}-----------��J�������
	local skplayer=0 -------�ޯ�I��ؼ�
	local mob=0
	local n1=0
	local PPL=0
	local lp=0
	local lp2=0
	local kp=0
	local door=0
	local door1=0
	local door2=0
	local door3=0
	local mob1=0
	local MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )	--Ū����q 
	local nco=0
	local bx=0
	local by=0
	local bz=0
	local bd=0
	while 1 do 
		sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )   ------ ��M�ثe�������ؼ�
		local BossTarget=AttackTarget
		if HateListCount( boss ) ~= 0 then	---- �T�w�L�{�b�����H
			if CombatBegin==0 then
				CombatBegin=1
				door = CreateObjByFlag(104016,780668,4,1)
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
				SetDefIdleMotion( door,ruFUSION_MIME_ACTIVATE_LOOP)
				door1 = CreateObjByFlag(104016,780668,5,1)
				SetModeEx( door1 , EM_SetModeType_Gravity, false) ---���O
				SetModeEx( door1 , EM_SetModeType_Mark, false)
				SetModeEx( door1 , EM_SetModeType_HideName, false)
				SetModeEx( door1 , EM_SetModeType_ShowRoleHead, false)
				SetModeEx( door1 , EM_SetModeType_NotShowHPMP, false)
				SetModeEx( door1 , EM_SetModeType_Obstruct, true)   -----���O
				SetModeEx( door1 , EM_SetModeType_Strikback, false) ---����
				SetModeEx( door1 , EM_SetModeType_Move, false) ---����	
				SetModeEx( door1 , EM_SetModeType_Fight, false) ---�i���
				SetModeEx( door1 , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( door1 , EM_SetModeType_Searchenemy, false)
				SetModeEx( door1 , EM_SetModeType_Show, true)
				AddToPartition( door1 , RoomID )
				SetDefIdleMotion( door1,ruFUSION_MIME_ACTIVATE_LOOP)
				door2 = CreateObjByFlag(104016,780668,6,1)
				SetModeEx( door2 , EM_SetModeType_Gravity, false) ---���O
				SetModeEx( door2 , EM_SetModeType_Mark, false)
				SetModeEx( door2 , EM_SetModeType_HideName, false)
				SetModeEx( door2 , EM_SetModeType_ShowRoleHead, false)
				SetModeEx( door2 , EM_SetModeType_NotShowHPMP, false)
				SetModeEx( door2 , EM_SetModeType_Obstruct, true)   -----���O
				SetModeEx( door2 , EM_SetModeType_Strikback, false) ---����
				SetModeEx( door2 , EM_SetModeType_Move, false) ---����	
				SetModeEx( door2 , EM_SetModeType_Fight, false) ---�i���
				SetModeEx( door2 , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( door2 , EM_SetModeType_Searchenemy, false)
				SetModeEx( door2 , EM_SetModeType_Show, true)
				AddToPartition( door2 , RoomID )
				SetDefIdleMotion( door2,ruFUSION_MIME_ACTIVATE_LOOP)
				door3 = CreateObjByFlag(104016,780668,7,1)
				SetModeEx( door3 , EM_SetModeType_Gravity, false) ---���O
				SetModeEx( door3 , EM_SetModeType_Mark, false)
				SetModeEx( door3 , EM_SetModeType_HideName, false)
				SetModeEx( door3 , EM_SetModeType_ShowRoleHead, false)
				SetModeEx( door3 , EM_SetModeType_NotShowHPMP, false)
				SetModeEx( door3 , EM_SetModeType_Obstruct, true)   -----���O
				SetModeEx( door3 , EM_SetModeType_Strikback, false) ---����
				SetModeEx( door3 , EM_SetModeType_Move, false) ---����	
				SetModeEx( door3 , EM_SetModeType_Fight, false) ---�i���
				SetModeEx( door3 , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( door3 , EM_SetModeType_Searchenemy, false)
				SetModeEx( door3 , EM_SetModeType_Show, true)
				AddToPartition( door3 , RoomID )
				SetDefIdleMotion( door3 ,ruFUSION_MIME_ACTIVATE_LOOP)
				WriteRoleValue(OwnerID() ,EM_RoleValue_Register8,door)
				WriteRoleValue(OwnerID() ,EM_RoleValue_Register5,door3)
				WriteRoleValue(OwnerID() ,EM_RoleValue_Register6,door2)
				WriteRoleValue(OwnerID() ,EM_RoleValue_Register7,door1)
				local PPL = SetSearchAllPlayer(RoomID)
				for i = 1 , PPL , 1 do 
					local ID = GetSearchResult()
					if CheckAcceptQuest( ID , 423273 ) == true then -----------------�ˬd�O�_������  �n�����Ȫ���
						n1 = CreateObjByFlag(103954,780669,1,1)------------------�b�w�I ����npc
						SetModeEx( n1 , EM_SetModeType_Gravity, true) ---���O
						SetModeEx( n1 , EM_SetModeType_Mark, true)
					---------------	SetModeEx( n1 , EM_SetModeType_HideName, true)
						SetModeEx( n1 , EM_SetModeType_ShowRoleHead, true)
						------------SetModeEx( n1 , EM_SetModeType_NotShowHPMP, true)
						SetModeEx( n1 , EM_SetModeType_Obstruct, false)   -----���O
						SetModeEx( n1 , EM_SetModeType_Strikback, true) ---����
						SetModeEx( n1 , EM_SetModeType_Move, true) ---����	
						SetModeEx( n1 , EM_SetModeType_Fight, false) ---�i���
						SetModeEx( n1 , EM_SetModeType_SearchenemyIgnore, true) 
						SetModeEx( n1 , EM_SetModeType_Searchenemy, true)
						SetModeEx( n1 , EM_SetModeType_Show, true)
						AddToPartition( n1 , RoomID )
						AddBuff( n1 , 506956 , 1 , -1 )
						local n1co = Lua_DW_CreateObj("obj",103971,OwnerID(),0)
						SetModeEx( n1co , EM_SetModeType_Show, true) ----�q�X
						SetModeEx( n1co , EM_SetModeType_Mark, false) ----�аO
						SetModeEx( n1co , EM_SetModeType_Strikback, false) ---����
						SetModeEx( n1co , EM_SetModeType_Move, false) ---����	
						SetModeEx( n1co , EM_SetModeType_Fight, false) ---�i���
						SetModeEx( n1co , EM_SetModeType_SearchenemyIgnore, false) ---���󤣷|�Q�j�M
						SetModeEx( n1co , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
						SetModeEx( n1co , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
						SetModeEx( n1co , EM_SetModeType_Searchenemy, false)  ---���
						AddToPartition(n1co , RoomID )
						WriteRoleValue(n1co ,EM_RoleValue_PID,n1)
						BeginPlot( n1co ,"bk_129_103954_3",0)
						WriteRoleValue( n1 ,EM_RoleValue_IsWalk , 1 )
						WriteRoleValue(boss, EM_RoleValue_Register9,n1)	
						MoveToFlagEnabled ( n1,  false )
						LuaFunc_MoveToFlag( n1, 780669 , 2 , 10)--------------------------------����ڷQ�h����m�ǳƧ���
						SetModeEx( n1 , EM_SetModeType_Mark, true)
						SetModeEx( n1 , EM_SetModeType_Strikback, true) ---����
						SetModeEx( n1 , EM_SetModeType_Fight, false) ---�i���
						SetModeEx( n1 , EM_SetModeType_SearchenemyIgnore, true) 
						SetModeEx( n1 , EM_SetModeType_Searchenemy, true)
						ScriptMessage( n1 , -1 , 2 , "[SC_423273_1]" , 1 )
						Yell(n1,"[SC_423273_1]",5)
						SetAttack( n1 , boss)
						break
					end
				end	
				WriteRoleValue(start ,EM_RoleValue_Register1,3)------------�g�J1����N������b�԰���
			end
			local NowHP = ReadRoleValue(  OwnerID() , EM_RoleValue_HP )
			local HPPercent = NowHP / MaxHP	--��q�ʤ���
			if HPPercent<=0.5 then 	
				if n1 ~=0 then --------------��q�U����50%�H�U�h��᭱�h������
					if nco == 0 then 
						SetModeEx( n1 , EM_SetModeType_Mark, false)
						SetModeEx( n1 , EM_SetModeType_Strikback, false) ---����
						SetModeEx( n1 , EM_SetModeType_Fight, false) ---�i���
						SetModeEx( n1 , EM_SetModeType_SearchenemyIgnore, false) 
						SetModeEx( n1 , EM_SetModeType_Searchenemy, false)
						SetStopAttack( n1 )
						---ScriptMessage( n1 , -1 , 2 , "[SC_423273_2]" , 1 )
						Yell(n1,"[SC_423273_2]",5)
						sleep(20)
						Yell( n1,"[SC_423273_3]",5)
						sleep(10)
						PlayMotion ( n1, ruFUSION_ACTORSTATE_CROUCH_BEGIN )
						Yell( n1,"[SC_423273_4]",5)
						sleep(10)
						WriteRoleValue( n1 ,EM_RoleValue_IsWalk , 1 )
						sleep(20)
						---Yell( n1,"[SC_423273_4]",5)
						MoveToFlagEnabled ( n1,  false )
						BeginPlot( n1 ,"bk_129_103954_1",10)------------����@��
					---	LuaFunc_MoveToFlag( n1, 780669 , 3 , 10)--------------------------------�h�����h������
					---	sleep(20)
					----	SetPosByFlag( n1, 780669 , 3 )
						nco=1
					end
				end
			end
			mob=mob+1
			mob1=mob1+1
			skilltime=skilltime+1
			if mob>=25 then ---------------�j���ۥ��d�򭰧C��q
				ScriptMessage( OwnerID() , -1 , 2 , "[SC_103933_02]" , "0xff6fb7ff" )
				----Say(OwnerID(),"[SC_103933_02]")
				CastSpellLV( OwnerID() , OwnerID() , 495673 , 8 )---------------------------------��q�U��
				sleep(20)
				mob=0
			end
			if mob1>= 15 then 
				ScriptMessage( OwnerID() , -1 , 2 , "[SC_103933_06]" , "0xff6fb7ff" )
				bx=ReadRoleValue(boss ,EM_RoleValue_X)
				by=ReadRoleValue(boss ,EM_RoleValue_Y)
				bz=ReadRoleValue(boss ,EM_RoleValue_Z)
				bd=ReadRoleValue(boss ,EM_RoleValue_Dir)
				sleep(20)
				PPL = SetSearchAllPlayer(RoomID)
				for i=0 , PPL , 1 do
					local ID = GetSearchResult()
					if ReadRoleValue( ID , EM_RoleValue_IsDead ) ~= 1 and ReadRoleValue( ID, EM_RoleValue_VOC) ~= 0  and ReadRoleValue( ID , EM_RoleValue_RoomID  ) == RoomID then
						SetPos( ID , bx, by , bz , bd )
						----say(ownerid(),"11111111111111")
					end
				end
				CastSpellLV( OwnerID() , OwnerID() , 495675 , 3 )
				sleep(30)
				mob1=0
			end		
			if skilltime>= 7 then 
				Luck=DW_Rand(100)------------------- �üƨM�w�I��ۦ�
				if (Luck >= 0 and Luck < 25) or (Luck >= 50 and Luck < 75) then
					SkillIndex = 1
					BossTarget = AttackTarget
					CastSpellLV( OwnerID() , OwnerID() , Skill1[SkillIndex] , skilllv[SkillIndex] )
				elseif (Luck >= 25 and Luck < 50) or (Luck >= 75 and Luck < 101) then	
					SkillIndex = 2------------------------------------------���饴���ˮ`
					Play_Chose=DW_HateRemain(0)-----------------������H   ��0�N�� ���ư��D�Z
					kp=DW_Rand(table.getn(Play_Chose))
					if kp==0 then --------0 �N��̭��S���H ���٥�����
					end
					if kp~=0 then --------�ݥ����ӭ˷���
					BossTarget = Play_Chose[kp]		
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_103933_04]" , "0xff6fb7ff" )
					CastSpellLV( OwnerID() , BossTarget , Skill1[SkillIndex] , skilllv[SkillIndex] )
					sleep(20)
					end
				end
				skilltime=0
			end	
		elseif HateListCount( boss )  == 0 then    ----�ˬd�����ѤU1��
			---if PPL == 0 then --------------------------------�S�����a
				if CombatBegin==1 then 
					CombatBegin=0 
					WriteRoleValue(start, EM_RoleValue_Register1,2)	
					DelObj(n1)
					Delobj(door)
					Delobj(door1)
					Delobj(door2)
					Delobj(door3)
					DelObj(boss)
					break
				end
			---end
			PPL = SetSearchAllPlayer(RoomID)
			if PPL >= 1 then ------------�����L
				for i = 1 , PPL , 1 do ---�⪱�a��J�ж��� 
					local ID = GetSearchResult()
					if ReadRoleValue( ID , EM_RoleValue_IsDead ) ~= 1 and ReadRoleValue( ID, EM_RoleValue_VOC) ~= 0  and ReadRoleValue( ID , EM_RoleValue_RoomID  ) == RoomID then
						SetAttack( boss , ID)
						break
					elseif ReadRoleValue( ID , EM_RoleValue_IsDead ) == 1 or ReadRoleValue( ID, EM_RoleValue_VOC) == 0  then 
						lp2=lp2+1
					end
				end
				if PPL==lp2 then 
					WriteRoleValue(start, EM_RoleValue_Register1,2)	
					lp2=0
					DelObj(n1)
					Delobj(door)
					Delobj(door1)
					Delobj(door2)
					Delobj(door3)
					DelObj(boss)
					break
				end
			elseif PPL==0 then 
				WriteRoleValue(start, EM_RoleValue_Register1,2)	
				sleep(50)
				DelObj(n1)
				Delobj(door)
				Delobj(door1)
				Delobj(door2)
				Delobj(door3)
				DelObj(boss)
				break
			end
		end
	end
end
function bk_129_104044_dead()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
	local n1 = ReadRoleValue(OwnerID(),EM_RoleValue_Register9)---------�j���h���`
	local boss=OwnerID()
	WriteRoleValue(start, EM_RoleValue_Register1,4)	
	local good=CreateObjByFlag(104045,780670,9,1)
	SetModeEx( good , EM_SetModeType_Gravity, false) ---���O
	SetModeEx( good , EM_SetModeType_Mark, true)
	SetModeEx( good , EM_SetModeType_HideName, false)
	SetModeEx( good , EM_SetModeType_ShowRoleHead, false)
	SetModeEx( good , EM_SetModeType_NotShowHPMP, false)
	SetModeEx( good , EM_SetModeType_Obstruct, false)   -----���O
	SetModeEx( good , EM_SetModeType_Strikback, false) ---����
	SetModeEx( good , EM_SetModeType_Move, false) ---����	
	SetModeEx( good , EM_SetModeType_Fight, true) ---�i���
	SetModeEx( good , EM_SetModeType_SearchenemyIgnore, false) 
	SetModeEx( good , EM_SetModeType_Searchenemy, false)
	SetModeEx( good , EM_SetModeType_Show, true)
	AddToPartition( good , RoomID )
	BeginPlot( n1 ,"bk_129_103954",20)------------����@��
	local door= ReadRoleValue(OwnerID(),EM_RoleValue_Register8)
	local door1= ReadRoleValue(OwnerID(),EM_RoleValue_Register7)
	local door2= ReadRoleValue(OwnerID(),EM_RoleValue_Register6)
	local door3= ReadRoleValue(OwnerID(),EM_RoleValue_Register5)
	Delobj(door)
	Delobj(door1)
	Delobj(door2)
	Delobj(door3)
	sleep(10)
	BeginPlot( boss ,"bk_129_104044_dead_1",20)-------------------
end





