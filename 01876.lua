function bk_129_103937_count()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------
	local start = OwnerID()--------�������	
	local x=0---------�԰��p�ɾ�
	local gatime=0
	local gg=0
	local CombatBegin=0
	local door=0
	local door1=0
	local door2=0
	local door3=0
	local boss = CreateObjByFlag(103932,780665,2,1)------------------------------�Хߤ�
	SetModeEx( boss , EM_SetModeType_Gravity, true) ---���O
	SetModeEx( boss , EM_SetModeType_Mark, true)
-----------	SetModeEx( boss , EM_SetModeType_HideName, true)
	SetModeEx( boss , EM_SetModeType_ShowRoleHead, true)
	--------------SetModeEx( boss , EM_SetModeType_NotShowHPMP, true)
	SetModeEx( boss , EM_SetModeType_Obstruct, false)   -----���O
	SetModeEx( boss , EM_SetModeType_Strikback, true) ---����
	SetModeEx( boss , EM_SetModeType_Move, true) ---����	
	SetModeEx( boss , EM_SetModeType_Fight, true) ---�i���
	SetModeEx( boss , EM_SetModeType_SearchenemyIgnore, true) 
	SetModeEx( boss , EM_SetModeType_Searchenemy, true)
	SetModeEx( boss , EM_SetModeType_Show, true)
	AddToPartition( boss , RoomID )
	BeginPlot( boss ,"bk_129_103932",0)
	SetPlot( boss , "dead" , "bk_129_103932_dead" , 10 )
	WriteRoleValue(start,EM_RoleValue_PID,boss)---- �b������W��J����id
	WriteRoleValue(boss ,EM_RoleValue_PID,start)	---- �b�����W��J���id
	while 1 do 
		sleep(10)
		x=ReadRoleValue(start,EM_RoleValue_Register1)
		if x==1 then --�����b�԰�����
			if CombatBegin==0 then 
				door = CreateObjByFlag(102930,780665,1,1)
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
				door1 = CreateObjByFlag(102930,780665,1,1)
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
				door2 = CreateObjByFlag(102930,780665,1,1)
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
				door3 = CreateObjByFlag(102930,780665,1,1)
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
				CombatBegin=1
			end	
			gatime=gatime+1 ------�g�ɮɶ�
			if gatime >= 600 then 
				if gg==0 then 
					
					gg=1
				end
			end
		elseif x==2 then --���a���`�����}�԰�
			sleep(50)
			boss = CreateObjByFlag(103932,780665,2,1)
			AddToPartition( boss , RoomID )
			WriteRoleValue( boss, EM_RoleValue_PID,start)
			BeginPlot( boss ,"bk_129_103932",0)---------------------------------���@���Ҧ�
			SetPlot( boss , "dead" , "bk_129_103932_dead" , 10 )
			x=0
			sleep(10)
			DelObj(door)
			WriteRoleValue(start, EM_RoleValue_Register1,0)
			gatime=0	
		elseif x==3 then --���a�����`�]���`�@��
			Delobj(door)
			WriteRoleValue(start, EM_RoleValue_Register1,3)	
			gg=0
			gatime=0
		end	
	end		
end
function bk_129_103932()--------------������ai
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
	local boss = OwnerID()--------�������	
	local CombatBegin=0
	local skill1={495676,495678}------1.���a�� 2.�j�a�H��
	local SkillIndex=0
	local skilllv={15,15}----�ۦ��¤O
	local skilltime=0------�ޯ�I��ɶ�
	local Luck=0 -----�p��X����ۦ�
	local Play_Chose={}-----------��J�������
	local skplayer=0 -------�ޯ�I��ؼ�
	local mob=0
	local lp=0
	local kp=0
	local door=0
	local door1=0
	local door2=0
	local door3=0
	while 1 do 
		sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )   ------ ��M�ثe�������ؼ�
		local BossTarget=AttackTarget
		if HateListCount( boss ) ~= 0 then	---- �T�w�L�{�b�����H
			if CombatBegin==0 then
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
				WriteRoleValue(start ,EM_RoleValue_Register1,1)------------�g�J1����N������b�԰���
				WriteRoleValue(OwnerID() ,EM_RoleValue_Register9,door)
				WriteRoleValue(OwnerID() ,EM_RoleValue_Register6,door3)
				WriteRoleValue(OwnerID() ,EM_RoleValue_Register7,door2)
				WriteRoleValue(OwnerID() ,EM_RoleValue_Register8,door1)
				CombatBegin=1
				ScriptMessage( OwnerID() , -1 , 2 , "[SC_103932_01]" , 1 )----�S�O�@�s�ФH���p�ΡA���ڭ̧��I�����o�u�����v���C���a
				Say(OwnerID(),"[SC_103932_01]")
			end
			mob=mob+1
			skilltime=skilltime+1
			if mob>=30 then 
				BossTarget = AttackTarget
				local caball = Lua_DW_CreateObj("obj",103971,OwnerID(),0)
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
				WriteRoleValue(caball, EM_RoleValue_Livetime,6)
				ScriptMessage( OwnerID() , -1 , 2 , "[SC_103932_02]" , 1 )-----�P���@�U�j�a������I(�u��)drialra histana fer bashtei�I�I
				AddBuff( caball , 506888 , 1 , -1 )
				PlayMotion ( OwnerID(),ruFUSION_ACTORSTATE_CRAFTING_BEGIN )
				SetModeEx( OwnerID() , EM_SetModeType_Fight, false) ---�i���
				SetModeEx( OwnerID() , EM_SetModeType_Move, false) ---����	
				sleep(30)
				SetIdleMotion( OwnerID() ,ruFUSION_ACTORSTATE_CRAFTING_LOOP)-----------------------�O�����Ѫ����A
				CastSpellLV( OwnerID() , OwnerID() , 495677 , 0 )
				sleep(30)
				while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID ) ~= 0   do
					sleep(2)
				end
				SetIdleMotion( OwnerID() ,ruFUSION_ACTORSTATE_CRAFTING_LOOP)-----------------------�O�����Ѫ����A
				------------------CastSpellLV( OwnerID() , BossTarget , 495734 , 9 )---------------Ĳ�o
				PlayMotion ( OwnerID(), ruFUSION_ACTORSTATE_CRAFTING_END )---------------------����U��.
				ScriptMessage( OwnerID() , -1 , 2 , "[SC_103932_11]" , 1 )
				CastSpellLV( OwnerID() , BossTarget , 495734 , 9 )---------------Ĳ�o
				----------------------------say(OwnerID(),"boss"..BossTarget)
				SetModeEx( OwnerID() , EM_SetModeType_Fight, true) ---�i���
				SetModeEx( OwnerID() , EM_SetModeType_Move, true) ---����	
				SetIdleMotion( OwnerID() ,  ruFUSION_ACTORSTATE_NORMAL)--------�O���a�U�Ҧ�	
		---------------------	Debugmsg(0,0,"4")
				mob=0
			end
			if skilltime>= 7 then 
				Luck=DW_Rand(100)------------------- �üƨM�w�I��ۦ�
				if (Luck >= 0 and Luck < 25) or (Luck >= 50 and Luck < 75) then
					SkillIndex = 1
					BossTarget = AttackTarget
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_103932_04]" , 1 )-----�o�N���禺�@���p�Τ@�ˮe��
					CastSpellLV( OwnerID() , BossTarget , Skill1[SkillIndex] , skilllv[SkillIndex] )
					sleep(20)
				elseif (Luck >= 25 and Luck < 50) or (Luck >= 75 and Luck < 101) then	
					SkillIndex = 2------------------------------------------���饴���ˮ`
					Play_Chose=DW_HateRemain(0)-----------------������H   ��0�N�� ���ư��D�Z
					kp=DW_Rand(table.getn(Play_Chose))
					if kp==0 then --------0 �N��̭��S���H ���٥�����
					end
					if kp~=0 then --------�ݥ����ӭ˷���
					BossTarget = Play_Chose[kp]		
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_103932_03]" , 1 )-----�P���@�U�j�a������I
					CastSpellLV( OwnerID() , BossTarget , Skill1[SkillIndex] , skilllv[SkillIndex] )
					sleep(20)
					end
				end
				skilltime=0
			end	
		elseif HateListCount( boss )  == 0 then    ----�԰����}
			if CombatBegin==1 then 
				CombatBegin=0 
				WriteRoleValue(start, EM_RoleValue_Register1,0)		-------------------�����}�԰��^��0  	
				---sleep(30)
				Delobj(door)
				Delobj(door1)
				Delobj(door2)
				Delobj(door3)
				Delobj(boss)
				break
			end
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
					WriteRoleValue(start, EM_RoleValue_Register1,0)	
				---	sleep(50)
					lp=0
					Delobj(door)
					Delobj(door1)
					Delobj(door2)
					Delobj(door3)
					DelObj(boss)
					break
				end
			elseif PPL==0 then 
				WriteRoleValue(start, EM_RoleValue_Register1,0)	
			---	sleep(50)
				Delobj(door)
				Delobj(door1)
				Delobj(door2)
				Delobj(door3)
				DelObj(boss)
			end
		end
	end
end
function bk_129_103932_dead()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
	local boss=OwnerID()
	WriteRoleValue(start, EM_RoleValue_Register1,2)	
	ScriptMessage( OwnerID() , -1 , 2 , "[SC_103932_08]" , 1 )----�ש����q�}�d�����Ф�Ĳ��F......�A�̭n�p��.....����.....�k...�H�C
	local good=CreateObjByFlag(103840,780670,8,1)
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
	local door= ReadRoleValue(OwnerID(),EM_RoleValue_Register9)
	local door1= ReadRoleValue(OwnerID(),EM_RoleValue_Register8)
	local door2= ReadRoleValue(OwnerID(),EM_RoleValue_Register7)
	local door3= ReadRoleValue(OwnerID(),EM_RoleValue_Register6)
	Delobj(door)
	Delobj(door1)
	Delobj(door2)
	Delobj(door3)
	BeginPlot( boss ,"bk_129_103932_deadtime",20)-------------------
	-----DelObj(boss)
end
function bk_129_103932_deadtime()
	sleep(20)
	DelObj(OwnerID())
end
function bk_129_506818()----------------------�k�N�P�w
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local magic = OwnerID()
	local PX=0
	local PPL = SearchRangePlayer ( magic , 50 )	-------------------------Ū�����Ǫ����a�ƶq
	local x=table.getn(PPL)-----���X�Ӫ��O�ƶq
	local x1=0
	local name=0
	------say(OwnerID(),"x"..x)
	if x>=1 then 
		x1=x-1
		for i=0, x1 ,1 do
			-----say(OwnerID(),"dsa"..i)
			---name= GetName( PPL[i] )
			--say(OwnerID(),"ASD"..name)
			if ReadRoleValue( PPL[i] , EM_RoleValue_IsDead ) == 0 and ReadRoleValue( PPL[i], EM_RoleValue_VOC) ~= 0 then----------------------------------------�S����+���Ogm 
				PX=PX+1
				-----say(OwnerID(),"PX"..PX)
			end
			-----say(OwnerID(),"111111111111111")
		end
			---say(OwnerID(),"222222222222222")
		if PX==1 then 
			AddBuff(  OwnerID() , 506775 , 1 , 10)------------�ۤ�buff
		elseif PX>=2 then 
			CastSpellLV( OwnerID() , OwnerID() , 495680 , 20 )
		end
	elseif x==0 then 
		AddBuff(  OwnerID() , 506775 , 1 , 10)------------�ۤ�buff
	end
end
function Lua_bk_129_506783()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local PPL = SearchRangePlayer ( TargetID( ) , 60 )	-------------------------Ū�����Ǫ����a�ƶq
	local x=table.getn(PPL)-----���X�Ӫ��O�ƶq
	--------------------say(TargetID( ),"X"..x)
	local cab = Lua_DW_CreateObj("obj",103971,TargetID( ),0)
	SetModeEx( cab , EM_SetModeType_Show, true) ----�q�X
	SetModeEx( cab , EM_SetModeType_Mark, false) ----�аO
	SetModeEx( cab , EM_SetModeType_Strikback, false) ---����
	SetModeEx( cab , EM_SetModeType_Move, false) ---����	
	SetModeEx( cab , EM_SetModeType_Fight, false) ---�i���
	SetModeEx( cab , EM_SetModeType_SearchenemyIgnore, false) ---���󤣷|�Q�j�M
	SetModeEx( cab , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
	SetModeEx( cab , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
	SetModeEx( cab , EM_SetModeType_Searchenemy, false)  ---���
	AddToPartition(cab , RoomID )
	WriteRoleValue(cab, EM_RoleValue_Livetime,6)
	if x==6 then 
		CastSpellLV( cab , cab , 495466 , 19 )
	elseif x==5 then 
		CastSpellLV( cab , cab , 495466 , 23 )
	elseif x==4 then 
		CastSpellLV( cab , cab , 495466 , 29 )
	elseif x==3 then
		CastSpellLV( cab , cab , 495466 , 39 )
	elseif x==2 then
		CastSpellLV( cab , cab , 495466 , 59 )
	elseif x==1 then	
-------------------------	say(cab,"45645646")
		CastSpellLV( cab , cab , 495466 , 119 )
	end
end