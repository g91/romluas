function Lua_bk_spid_102706()
local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------�}�l���ж�
local start = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
local boss=OwnerID()
local door
local CombatBegin=0
local m0t1=0-------�H��������aŪ�����W���
local m0tw=0
local m1t1=0
local m1t2=0
local time1=0
local time2=0
local Play_Chose={}
local Play_1ch={}
local Play_2ch={}
local Play_3ch={}
local mam -------------�سy�Ǫ�
local gg=0
local kp=0
local voc=0
local bklig
local bklight=0
local pm=0
local Luck
local skill={494585,494586}
local SkillIndex
local amonster
local bmonster
local cmonster
local m2be=0
local lighttar
local X0
local Y0
local Z0
local Dir0
local mob=0
local bk={1,2,3,4,5,6,7,8}
local alltime=0
	local ba1 = CreateObj(102843,2300.2,1100.5,2525.8,75.5,1)
		SetModeEx( ba1 , EM_SetModeType_Gravity, false) ---���O
		SetModeEx( ba1 , EM_SetModeType_Mark, false)
		SetModeEx( ba1 , EM_SetModeType_HideName, false)
		SetModeEx( ba1 , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( ba1 , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( ba1 , EM_SetModeType_Obstruct, true)   -----���O
		SetModeEx( ba1 , EM_SetModeType_Strikback, false) ---����
		SetModeEx( ba1 , EM_SetModeType_Move, false) ---����	
		SetModeEx( ba1 , EM_SetModeType_Fight, false) ---�i���
		SetModeEx( ba1 , EM_SetModeType_SearchenemyIgnore, false) 
		SetModeEx( ba1 , EM_SetModeType_Searchenemy, false)
		SetModeEx( ba1 , EM_SetModeType_Show, true)
		AddToPartition(ba1 , RoomID )
	local bam1 = CreateObj(102844,2300.2,1200.5,2525.8,75.5,1)
		SetModeEx( bam1 , EM_SetModeType_Gravity, false) ---���O
		SetModeEx( bam1 , EM_SetModeType_Mark, false)
		SetModeEx( bam1 , EM_SetModeType_HideName, false)
		SetModeEx( bam1 , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( bam1 , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( bam1 , EM_SetModeType_Obstruct, true)   -----���O
		SetModeEx( bam1 , EM_SetModeType_Strikback, false) ---����
		SetModeEx( bam1 , EM_SetModeType_Move, false) ---����	
		SetModeEx( bam1 , EM_SetModeType_Fight, false) ---�i���
		SetModeEx( bam1 , EM_SetModeType_SearchenemyIgnore, false) 
		SetModeEx( bam1 , EM_SetModeType_Searchenemy, false)
		SetModeEx( bam1 , EM_SetModeType_Show, true)
		AddToPartition(bam1 , RoomID )
	local ba2 = CreateObj(102843 ,2300.2,1100.5,2354.0, 75.5 , 1)
		SetModeEx( ba2 , EM_SetModeType_Gravity, false) ---���O
		SetModeEx( ba2 , EM_SetModeType_Mark, false)
		SetModeEx( ba2 , EM_SetModeType_HideName, false)
		SetModeEx( ba2 , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( ba2 , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( ba2 , EM_SetModeType_Obstruct, true)   -----���O
		SetModeEx( ba2 , EM_SetModeType_Strikback, false) ---����
		SetModeEx( ba2 , EM_SetModeType_Move, false) ---����	
		SetModeEx( ba2 , EM_SetModeType_Fight, false) ---�i���
		SetModeEx( ba2 , EM_SetModeType_SearchenemyIgnore, false) 
		SetModeEx( ba2 , EM_SetModeType_Searchenemy, false)
		SetModeEx( ba2 , EM_SetModeType_Show, true)
		AddToPartition(ba2 , RoomID )
	local bam2 = CreateObj( 102844 ,2300.2,1200.5,2354.0, 75.5 , 1)
		SetModeEx( bam2 , EM_SetModeType_Gravity, false) ---���O
		SetModeEx( bam2 , EM_SetModeType_Mark, false)
		SetModeEx( bam2 , EM_SetModeType_HideName, false)
		SetModeEx( bam2 , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( bam2 , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( bam2 , EM_SetModeType_Obstruct, true)   -----���O
		SetModeEx( bam2 , EM_SetModeType_Strikback, false) ---����
		SetModeEx( bam2 , EM_SetModeType_Move, false) ---����	
		SetModeEx( bam2 , EM_SetModeType_Fight, false) ---�i���
		SetModeEx( bam2 , EM_SetModeType_SearchenemyIgnore, false) 
		SetModeEx( bam2 , EM_SetModeType_Searchenemy, false)
		SetModeEx( bam2 , EM_SetModeType_Show, true)
		AddToPartition(bam2 , RoomID )
	local ba3 = CreateObj( 102843 ,2300.2,1100.5,2183.4, 75.5 , 1)
		SetModeEx( ba3 , EM_SetModeType_Gravity, false) ---���O
		SetModeEx( ba3 , EM_SetModeType_Mark, false)
		SetModeEx( ba3 , EM_SetModeType_HideName, false)
		SetModeEx( ba3 , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( ba3 , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( ba3 , EM_SetModeType_Obstruct, true)   -----���O
		SetModeEx( ba3 , EM_SetModeType_Strikback, false) ---����
		SetModeEx( ba3 , EM_SetModeType_Move, false) ---����	
		SetModeEx( ba3 , EM_SetModeType_Fight, false) ---�i���
		SetModeEx( ba3 , EM_SetModeType_SearchenemyIgnore, false) 
		SetModeEx( ba3 , EM_SetModeType_Searchenemy, false)
		SetModeEx( ba3 , EM_SetModeType_Show, true)
		AddToPartition(ba3 , RoomID )
	local bam3 = CreateObj( 102844 ,2300.2,1200,2183.4, 75.5 , 1)
		SetModeEx( bam3 , EM_SetModeType_Gravity, false) ---���O
		SetModeEx( bam3 , EM_SetModeType_Mark, false)
		SetModeEx( bam3 , EM_SetModeType_HideName, false)
		SetModeEx( bam3 , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( bam3 , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( bam3 , EM_SetModeType_Obstruct, true)   -----���O
		SetModeEx( bam3 , EM_SetModeType_Strikback, false) ---����
		SetModeEx( bam3 , EM_SetModeType_Move, false) ---����	
		SetModeEx( bam3 , EM_SetModeType_Fight, false) ---�i���
		SetModeEx( bam3 , EM_SetModeType_SearchenemyIgnore, false) 
		SetModeEx( bam3 , EM_SetModeType_Searchenemy, false)
		SetModeEx( bam3 , EM_SetModeType_Show, true)
		AddToPartition(bam3 , RoomID )
	local ba4 = CreateObj( 102843 ,2300.2,1100.5,2011.7, 75.5 , 1)
		SetModeEx( ba4 , EM_SetModeType_Gravity, false) ---���O
		SetModeEx( ba4 , EM_SetModeType_Mark, false)
		SetModeEx( ba4 , EM_SetModeType_HideName, false)
		SetModeEx( ba4 , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( ba4 , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( ba4 , EM_SetModeType_Obstruct, true)   -----���O
		SetModeEx( ba4 , EM_SetModeType_Strikback, false) ---����
		SetModeEx( ba4 , EM_SetModeType_Move, false) ---����	
		SetModeEx( ba4 , EM_SetModeType_Fight, false) ---�i���
		SetModeEx( ba4 , EM_SetModeType_SearchenemyIgnore, false) 
		SetModeEx( ba4 , EM_SetModeType_Searchenemy, false)
		SetModeEx( ba4 , EM_SetModeType_Show, true)
		AddToPartition(ba4 , RoomID )
	local bam4 = CreateObj( 102844 ,2300.2,1200.5,2011.7, 75.5 , 1)
		SetModeEx( bam4 , EM_SetModeType_Gravity, false) ---���O
		SetModeEx( bam4 , EM_SetModeType_Mark, false)
		SetModeEx( bam4 , EM_SetModeType_HideName, false)
		SetModeEx( bam4 , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( bam4 , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( bam4 , EM_SetModeType_Obstruct, true)   -----���O
		SetModeEx( bam4 , EM_SetModeType_Strikback, false) ---����
		SetModeEx( bam4 , EM_SetModeType_Move, false) ---����	
		SetModeEx( bam4 , EM_SetModeType_Fight, false) ---�i���
		SetModeEx( bam4 , EM_SetModeType_SearchenemyIgnore, false) 
		SetModeEx( bam4 , EM_SetModeType_Searchenemy, false)
		SetModeEx( bam4 , EM_SetModeType_Show, true)
		AddToPartition(bam4 , RoomID )
	local ba5 = CreateObj( 102843 ,2465.5,1170.4,2525.8, 75.5 , 1)
		SetModeEx( ba5 , EM_SetModeType_Gravity, false) ---���O
		SetModeEx( ba5 , EM_SetModeType_Mark, false)
		SetModeEx( ba5 , EM_SetModeType_HideName, false)
		SetModeEx( ba5 , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( ba5 , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( ba5 , EM_SetModeType_Obstruct, true)   -----���O
		SetModeEx( ba5 , EM_SetModeType_Strikback, false) ---����
		SetModeEx( ba5 , EM_SetModeType_Move, false) ---����	
		SetModeEx( ba5 , EM_SetModeType_Fight, false) ---�i���
		SetModeEx( ba5 , EM_SetModeType_SearchenemyIgnore, false) 
		SetModeEx( ba5 , EM_SetModeType_Searchenemy, false)
		SetModeEx( ba5 , EM_SetModeType_Show, true)
		AddToPartition(ba5 , RoomID )
	local bam5 = CreateObj( 102844 ,2465.5,1270.4,2525.8, 75.5 , 1)
		SetModeEx( bam5 , EM_SetModeType_Gravity, false) ---���O
		SetModeEx( bam5 , EM_SetModeType_Mark, false)
		SetModeEx( bam5 , EM_SetModeType_HideName, false)
		SetModeEx( bam5 , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( bam5 , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( bam5 , EM_SetModeType_Obstruct, true)   -----���O
		SetModeEx( bam5 , EM_SetModeType_Strikback, false) ---����
		SetModeEx( bam5 , EM_SetModeType_Move, false) ---����	
		SetModeEx( bam5 , EM_SetModeType_Fight, false) ---�i���
		SetModeEx( bam5 , EM_SetModeType_SearchenemyIgnore, false) 
		SetModeEx( bam5 , EM_SetModeType_Searchenemy, false)
		SetModeEx( bam5 , EM_SetModeType_Show, true)
		AddToPartition(bam5 , RoomID )
	local ba6 = CreateObj( 102843 ,2465.5,1170.4,2354.8, 75.5 , 1)
		SetModeEx( ba6 , EM_SetModeType_Gravity, false) ---���O
		SetModeEx( ba6 , EM_SetModeType_Mark, false)
		SetModeEx( ba6 , EM_SetModeType_HideName, false)
		SetModeEx( ba6 , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( ba6 , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( ba6 , EM_SetModeType_Obstruct, true)   -----���O
		SetModeEx( ba6 , EM_SetModeType_Strikback, false) ---����
		SetModeEx( ba6 , EM_SetModeType_Move, false) ---����	
		SetModeEx( ba6 , EM_SetModeType_Fight, false) ---�i���
		SetModeEx( ba6 , EM_SetModeType_SearchenemyIgnore, false) 
		SetModeEx( ba6 , EM_SetModeType_Searchenemy, false)
		SetModeEx( ba6 , EM_SetModeType_Show, true)
		AddToPartition(ba6 , RoomID )
	local bam6 = CreateObj( 102844 ,2465.5,1270.4,2354.8, 75.5 , 1)
		SetModeEx( bam6 , EM_SetModeType_Gravity, false) ---���O
		SetModeEx( bam6 , EM_SetModeType_Mark, false)
		SetModeEx( bam6 , EM_SetModeType_HideName, false)
		SetModeEx( bam6 , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( bam6 , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( bam6 , EM_SetModeType_Obstruct, true)   -----���O
		SetModeEx( bam6 , EM_SetModeType_Strikback, false) ---����
		SetModeEx( bam6 , EM_SetModeType_Move, false) ---����	
		SetModeEx( bam6 , EM_SetModeType_Fight, false) ---�i���
		SetModeEx( bam6 , EM_SetModeType_SearchenemyIgnore, false) 
		SetModeEx( bam6 , EM_SetModeType_Searchenemy, false)
		SetModeEx( bam6 , EM_SetModeType_Show, true)
		AddToPartition(bam6 , RoomID )
	local ba7 = CreateObj( 102843 ,2465.5,1170.4,2183.4, 75.5 , 1)
		SetModeEx( ba7 , EM_SetModeType_Gravity, false) ---���O
		SetModeEx( ba7 , EM_SetModeType_Mark, false)
		SetModeEx( ba7 , EM_SetModeType_HideName, false)
		SetModeEx( ba7 , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( ba7 , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( ba7 , EM_SetModeType_Obstruct, true)   -----���O
		SetModeEx( ba7 , EM_SetModeType_Strikback, false) ---����
		SetModeEx( ba7 , EM_SetModeType_Move, false) ---����	
		SetModeEx( ba7 , EM_SetModeType_Fight, false) ---�i���
		SetModeEx( ba7 , EM_SetModeType_SearchenemyIgnore, false) 
		SetModeEx( ba7 , EM_SetModeType_Searchenemy, false)
		SetModeEx( ba7 , EM_SetModeType_Show, true)
		AddToPartition(ba7 , RoomID )
	local bam7 = CreateObj( 102844 ,2465.5,1270.4,2183.4, 75.5 , 1)
		SetModeEx( bam7 , EM_SetModeType_Gravity, false) ---���O
		SetModeEx( bam7 , EM_SetModeType_Mark, false)
		SetModeEx( bam7 , EM_SetModeType_HideName, false)
		SetModeEx( bam7 , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( bam7 , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( bam7 , EM_SetModeType_Obstruct, true)   -----���O
		SetModeEx( bam7 , EM_SetModeType_Strikback, false) ---����
		SetModeEx( bam7 , EM_SetModeType_Move, false) ---����	
		SetModeEx( bam7 , EM_SetModeType_Fight, false) ---�i���
		SetModeEx( bam7 , EM_SetModeType_SearchenemyIgnore, false) 
		SetModeEx( bam7 , EM_SetModeType_Searchenemy, false)
		SetModeEx( bam7 , EM_SetModeType_Show, true)
		AddToPartition(bam7 , RoomID )
	local ba8 = CreateObj( 102843 ,2465.5,1170.4,2011.7, 75.5 , 1)
		SetModeEx( ba8 , EM_SetModeType_Gravity, false) ---���O
		SetModeEx( ba8 , EM_SetModeType_Mark, false)
		SetModeEx( ba8 , EM_SetModeType_HideName, false)
		SetModeEx( ba8 , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( ba8 , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( ba8 , EM_SetModeType_Obstruct, true)   -----���O
		SetModeEx( ba8 , EM_SetModeType_Strikback, false) ---����
		SetModeEx( ba8 , EM_SetModeType_Move, false) ---����	
		SetModeEx( ba8 , EM_SetModeType_Fight, false) ---�i���
		SetModeEx( ba8 , EM_SetModeType_SearchenemyIgnore, false) 
		SetModeEx( ba8 , EM_SetModeType_Searchenemy, false)
		SetModeEx( ba8 , EM_SetModeType_Show, true)
		AddToPartition(ba8 , RoomID )
	local bam8 = CreateObj( 102844 ,2465.5,1270.4,2011.7, 75.5 , 1)
		SetModeEx( bam8 , EM_SetModeType_Gravity, false) ---���O
		SetModeEx( bam8 , EM_SetModeType_Mark, false)
		SetModeEx( bam8 , EM_SetModeType_HideName, false)
		SetModeEx( bam8 , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( bam8 , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( bam8 , EM_SetModeType_Obstruct, true)   -----���O
		SetModeEx( bam8 , EM_SetModeType_Strikback, false) ---����
		SetModeEx( bam8 , EM_SetModeType_Move, false) ---����	
		SetModeEx( bam8 , EM_SetModeType_Fight, false) ---�i���
		SetModeEx( bam8 , EM_SetModeType_SearchenemyIgnore, false) 
		SetModeEx( bam8 , EM_SetModeType_Searchenemy, false)
		SetModeEx( bam8 , EM_SetModeType_Show, true)
		AddToPartition(bam8 , RoomID )
	while 1 do 
	sleep(10)
	local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )   ------ ��M�ثe�������ؼ�
	local BossTarget=AttackTarget
		if HateListCount( boss ) ~= 0 then	---- �T�w�L�{�b�����H
			if CombatBegin == 0 then							---------------�u���}����@��
				ScriptMessage( OwnerID() , -1 , 2 , "[SC_102706_00]" , 1 )
				CombatBegin = 1
				door = CreateObjByFlag(102925,780449,3,1)-----------------------�b�X��2�W����J���ת�
				SetModeEx( door , EM_SetModeType_Gravity, false) ---���O
				SetModeEx( door , EM_SetModeType_Mark, false)
				SetModeEx( door , EM_SetModeType_HideName, false)
				SetModeEx( door , EM_SetModeType_ShowRoleHead, false)
				SetModeEx( door , EM_SetModeType_NotShowHPMP, false)
				SetModeEx( door , EM_SetModeType_Obstruct, true)   -----�|����(���ר�L������)
				SetModeEx( door , EM_SetModeType_Strikback, false) ---����
				SetModeEx( door , EM_SetModeType_Move, false) ---����	
				SetModeEx( door , EM_SetModeType_Fight, false) ---�i���
				SetModeEx( door , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( door , EM_SetModeType_Searchenemy, false)
				SetModeEx( door , EM_SetModeType_Show, true)
				AddToPartition( door , RoomID )
				WriteRoleValue(boss, EM_RoleValue_Register1,door)	
			--	bklig = CreateObj(102935,1954.5,1350,2306.0,75.5,1)----------------���몺�a��
				------bklig = CreateObj(102935,-595.3,0,-204.3,75.5,1)----------------���հ�
			--	SetModeEx( bklig , EM_SetModeType_Gravity, false) ---���O
			--	SetModeEx( bklig , EM_SetModeType_Mark, false)
			---	SetModeEx( bklig , EM_SetModeType_HideName, false)
			---	SetModeEx( bklig , EM_SetModeType_ShowRoleHead, false)
			---	SetModeEx( bklig , EM_SetModeType_NotShowHPMP, false)
			---	SetModeEx( bklig , EM_SetModeType_Obstruct, true)   -----���O
			---	SetModeEx( bklig , EM_SetModeType_Strikback, false) ---����
			---	SetModeEx( bklig , EM_SetModeType_Move, false) ---����	
			----	SetModeEx( bklig , EM_SetModeType_Fight, false) ---�i���
			---	SetModeEx( bklig , EM_SetModeType_SearchenemyIgnore, false) 
			---	SetModeEx( bklig , EM_SetModeType_Searchenemy, false)
			---	SetModeEx( bklig , EM_SetModeType_Show, true)
			---	AddToPartition( bklig , RoomID )
			---	WriteRoleValue(bklig, EM_RoleValue_Register2,bklig)	
			end	
			if mob == 0 then 
			m0t1=m0t1+1
			time1=time1+1
				if m0t1>=40 then 				
					m0tw=m0tw+1
					if m0tw==1 then 
						ScriptMessage( OwnerID() , -1 , 2 , "[SC_102706_01]" , 1 )
						CastSpellLV( OwnerID() , OwnerID(), 494507 , 0 )
						sleep(20)
						bkluck=DW_Rand(table.getn(bk))
						if bk[bkluck]==1 then 
							SetIdleMotion( ba1 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam1)
						end
						if bk[bkluck]==2 then 
							SetIdleMotion( ba2 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam2)
						end
						if bk[bkluck]==3 then 
							SetIdleMotion( ba3 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam3)
						end
						if bk[bkluck]==4 then  
							SetIdleMotion( ba4 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam4)
						end
						if bk[bkluck]==5 then 
							SetIdleMotion( ba5 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam5)
						end
						if bk[bkluck]==6 then 
							SetIdleMotion( ba6 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam6)
						end
						if bk[bkluck]==7 then 
							SetIdleMotion( ba7 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam7)
						end
						if bk[bkluck]==8 then 
							SetIdleMotion( ba8 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam8)
						end
						table.remove (bk, bkluck)
						BeginPlot( boss,"Lua_bk_spid_voc_102706",0)
						m0t1=0
					end
					if m0tw==2 then 
						ScriptMessage( OwnerID() , -1 , 2 , "[SC_102706_01]" , 1 )
						CastSpellLV( OwnerID() , OwnerID(), 494507 , 0 )
						sleep(20)
						bkluck=DW_Rand(table.getn(bk))
						if bk[bkluck]==1 then 
							SetIdleMotion( ba1 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam1)
						end
						if bk[bkluck]==2 then 
							SetIdleMotion( ba2 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam2)
						end
						if bk[bkluck]==3 then 
							SetIdleMotion( ba3 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam3)
						end
						if bk[bkluck]==4 then  
							SetIdleMotion( ba4 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam4)
						end
						if bk[bkluck]==5 then 
							SetIdleMotion( ba5 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam5)
						end
						if bk[bkluck]==6 then 
							SetIdleMotion( ba6 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam6)
						end
						if bk[bkluck]==7 then 
							SetIdleMotion( ba7 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam7)
						end
						if bk[bkluck]==8 then 
							SetIdleMotion( ba8 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam8)
						end
						table.remove (bk, bkluck)
						BeginPlot( boss,"Lua_bk_spid_voc_102706",0)
						m0t1=0
					end
					if m0tw==3 then 
						ScriptMessage( OwnerID() , -1 , 2 , "[SC_102706_01]" , 1 )
						CastSpellLV( OwnerID() , OwnerID(), 494507 , 0 )
						sleep(20)
						bkluck=DW_Rand(table.getn(bk))
						if bk[bkluck]==1 then 
							SetIdleMotion( ba1 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam1)
						end
						if bk[bkluck]==2 then 
							SetIdleMotion( ba2 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam2)
						end
						if bk[bkluck]==3 then 
							SetIdleMotion( ba3 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam3)
						end
						if bk[bkluck]==4 then  
							SetIdleMotion( ba4 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam4)
						end
						if bk[bkluck]==5 then 
							SetIdleMotion( ba5 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam5)
						end
						if bk[bkluck]==6 then 
							SetIdleMotion( ba6 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam6)
						end
						if bk[bkluck]==7 then 
							SetIdleMotion( ba7 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam7)
						end
						if bk[bkluck]==8 then 
							SetIdleMotion( ba8 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam8)
						end
						table.remove (bk, bkluck)
						BeginPlot( boss,"Lua_bk_spid_voc_102706",0)
						m0t1=0
					end
					if m0tw==4 then 
						ScriptMessage( OwnerID() , -1 , 2 , "[SC_102706_01]" , 1 )
						CastSpellLV( OwnerID() , OwnerID(), 494507 , 0 )
						sleep(20)
						bkluck=DW_Rand(table.getn(bk))
						if bk[bkluck]==1 then 
							SetIdleMotion( ba1 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam1)
						end
						if bk[bkluck]==2 then 
							SetIdleMotion( ba2 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam2)
						end
						if bk[bkluck]==3 then 
							SetIdleMotion( ba3 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam3)
						end
						if bk[bkluck]==4 then  
							SetIdleMotion( ba4 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam4)
						end
						if bk[bkluck]==5 then 
							SetIdleMotion( ba5 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam5)
						end
						if bk[bkluck]==6 then 
							SetIdleMotion( ba6 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam6)
						end
						if bk[bkluck]==7 then 
							SetIdleMotion( ba7 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam7)
						end
						if bk[bkluck]==8 then 
							SetIdleMotion( ba8 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam8)
						end
						table.remove (bk, bkluck)
						BeginPlot( boss,"Lua_bk_spid_voc_102706",0)
						m0t1=0
					end
					if m0tw==5 then 
						ScriptMessage( OwnerID() , -1 , 2 , "[SC_102706_01]" , 1 )
						CastSpellLV( OwnerID() , OwnerID(), 494507 , 0 )
						sleep(20)
						bkluck=DW_Rand(table.getn(bk))
						if bk[bkluck]==1 then 
							SetIdleMotion( ba1 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam1)
						end
						if bk[bkluck]==2 then 
							SetIdleMotion( ba2 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam2)
						end
						if bk[bkluck]==3 then 
							SetIdleMotion( ba3 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam3)
						end
						if bk[bkluck]==4 then  
							SetIdleMotion( ba4 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam4)
						end
						if bk[bkluck]==5 then 
							SetIdleMotion( ba5 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam5)
						end
						if bk[bkluck]==6 then 
							SetIdleMotion( ba6 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam6)
						end
						if bk[bkluck]==7 then 
							SetIdleMotion( ba7 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam7)
						end
						if bk[bkluck]==8 then 
							SetIdleMotion( ba8 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam8)
						end
						table.remove (bk, bkluck)
						BeginPlot( boss,"Lua_bk_spid_voc_102706",0)
						m0t1=0
					end					
					if m0tw== 6 then 
						mob=1
						time1=0
					end
				end
				if time1>=8 then
				    Luck=DW_Rand(100)
					if (Luck >= 0 and Luck < 25) or (Luck >= 50 and Luck < 75) then
						SkillIndex = 2------------------------------------------���饴���ˮ`
						BossTarget = AttackTarget
						CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , 1 )
					elseif (Luck >= 25 and Luck < 50) or (Luck >= 75 and Luck < 101) then	
						SkillIndex = 1-------------------------------------------���饴���ˮ`
						Play_Chose=DW_HateRemain(1)----------�����h���D�Z
						kp=DW_Rand(table.getn(Play_Chose))
						if kp==0 then 
						end
						if kp~=0 then 
							BossTarget = Play_Chose[kp]															
							CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , 0 )
							sleep(20)
						end
					end
					time1=0
				end
			end
			if mob == 1 then 
			m1t1=m1t1+1
			m1t2=m1t2+1
			time1=time1+1
			alltime=alltime+1
				if time1>=8 then
				    Luck=DW_Rand(100)
					if (Luck >= 0 and Luck < 25) or (Luck >= 50 and Luck < 75) then
						SkillIndex = 2------------------------------------------���饴���ˮ`
						BossTarget = AttackTarget
						CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , 1 )
					sleep(20)
					elseif (Luck >= 25 and Luck < 50) or (Luck >= 75 and Luck < 101) then	
						SkillIndex = 1-------------------------------------------���饴���ˮ`
						Play_Chose=DW_HateRemain(1)----------�����h���D�Z
						kp=DW_Rand(table.getn(Play_Chose))
						if kp==0 then 
						end
						if kp~=0 then 
							BossTarget = Play_Chose[kp]															
							CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , 0 )
							sleep(20)
						end
					end
					time1=0
				end
				if m1t1>=25 then
					if bklight==0 then 
						Play_Chose=DW_HateRemain(0)---------
						pm=table.getn(Play_Chose)
						for i=1 ,pm do
							Play_1ch[i] = Play_Chose[i]
						end
						for i=1,pm do 				
							if CheckBuff(Play_Chose[i],505037) == true then
								for x=1,table.getn(Play_1ch) do 
									if Play_1ch[x]==Play_Chose[i] then
									table.remove (Play_1ch,x)
									end
								end
							end
						end
						kp=DW_Rand(table.getn(Play_1ch))
						if kp==0 then 
						end
						if kp~=0 then 
							CastSpellLV( OwnerID() , Play_1ch[kp] , 494509 , 0 )------------------------------�j��ĤH
							sleep(20)
						end
						bklight=1
					end
				end
				if m1t1 >=35 then 
					if bklight==1 then 
						ScriptMessage( OwnerID() , -1 , 2 , "[SC_102706_03]" , 1 )
						Play_2ch=DW_HateRemain(0)----------
						pm=table.getn(Play_2ch)
						Play_3ch={}
						for i=1 ,pm do
							Play_3ch[i] = Play_2ch[i]
						end			
						for j=1,table.getn(Play_2ch),1 do 
							if CheckBuff(Play_2ch[j],505037) == true then
								for x=1,table.getn(Play_3ch) do 
									if Play_3ch[x]==Play_2ch[j] then
									table.remove (Play_3ch,x)
									end
								end
							end
						end
						kp=DW_Rand(table.getn(Play_3ch))
						if kp==0 then 
						end
						if kp~=0 then 
						bklig = star_CreateObj_NoAdd(Play_3ch[kp],102935,0,300,0,0,RoomID)----------------���몺�a��
						SetModeEx( bklig , EM_SetModeType_Gravity, false) ---���O
						SetModeEx( bklig , EM_SetModeType_Mark, false)
						SetModeEx( bklig , EM_SetModeType_HideName, false)
						SetModeEx( bklig , EM_SetModeType_ShowRoleHead, false)
						SetModeEx( bklig , EM_SetModeType_NotShowHPMP, false)
						SetModeEx( bklig , EM_SetModeType_Obstruct, true)   -----���O
						SetModeEx( bklig , EM_SetModeType_Strikback, false) ---����
						SetModeEx( bklig , EM_SetModeType_Move, false) ---����	
						SetModeEx( bklig , EM_SetModeType_Fight, false) ---�i���
						SetModeEx( bklig , EM_SetModeType_SearchenemyIgnore, false) 
						SetModeEx( bklig , EM_SetModeType_Searchenemy, false)
						SetModeEx( bklig , EM_SetModeType_Show, true)
						AddToPartition( bklig , RoomID )
						WriteRoleValue(bklig, EM_RoleValue_Livetime,5)
						
						X0=ReadRoleValue(Play_3ch[kp],EM_RoleValue_X)
						Y0=ReadRoleValue(Play_3ch[kp],EM_RoleValue_Y)
						Z0=ReadRoleValue(Play_3ch[kp],EM_RoleValue_Z)
						Dir0=ReadRoleValue(Play_3ch[kp],EM_RoleValue_Dir)
						lighttar=CreateObj(102935,X0,Y0,Z0,Dir0,1)------------------�Ҽ{�W�ӼаO
						SetModeEx( lighttar , EM_SetModeType_Gravity, false) ---���O
						SetModeEx( lighttar , EM_SetModeType_Mark, false)
						SetModeEx( lighttar , EM_SetModeType_HideName, false)
						SetModeEx( lighttar , EM_SetModeType_ShowRoleHead, false)
						SetModeEx( lighttar , EM_SetModeType_NotShowHPMP, false)
						SetModeEx( lighttar , EM_SetModeType_Obstruct, false)   -----���O
						SetModeEx( lighttar , EM_SetModeType_Strikback, false) ---����
						SetModeEx( lighttar , EM_SetModeType_Move, false) ---����	
						SetModeEx( lighttar , EM_SetModeType_Fight, false) ---�i���
						SetModeEx( lighttar , EM_SetModeType_SearchenemyIgnore, false) 
						SetModeEx( lighttar , EM_SetModeType_Searchenemy, false)
						SetModeEx( lighttar , EM_SetModeType_Show, true)
						AddToPartition(lighttar , RoomID )
						AddBuff(lighttar,505299,0,-1)-------------------�k�N�S��
						WriteRoleValue(lighttar, EM_RoleValue_Livetime,3)
						CastSpellLV( bklig , lighttar , 494582 , 0 )------------------------------�j��ĤH
						sleep(20)
						bklight=0
						end
					end
					m1t1=0
				end
				if m1t2>=1 then ----------�إߤT�䥨�~
					if m2be==0 then 	
						ScriptMessage( OwnerID() , -1 , 2 , "[SC_102706_02]" , 1 )
						say(boss,"[SC_102706_02]" )
						CastSpellLV( OwnerID() , OwnerID(), 494507 , 0 )
						sleep(20)
						amonster=CreateObjByFlag(102840,780449,1,1)----------------------�]�t����60���i���������O����
						AddToPartition(amonster , RoomID )
						SetAttack( amonster , BossTarget) 
						WriteRoleValue(amonster, EM_RoleValue_PID,boss)
						SetPlot( amonster,"dead","Lua_bk_swsm_dead01_102706",10 )
						BeginPlot( amonster ,"Lua_bk_fd_sm_102760",100)
						bkluck=DW_Rand(table.getn(bk))
						if bk[bkluck]==1 then 
							SetIdleMotion( ba1 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam1)
						end
						if bk[bkluck]==2 then 
							SetIdleMotion( ba2 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam2)
						end
						if bk[bkluck]==3 then 
							SetIdleMotion( ba3 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam3)
						end
						if bk[bkluck]==4 then  
							SetIdleMotion( ba4 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam4)
						end
						if bk[bkluck]==5 then 
							SetIdleMotion( ba5 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam5)
						end
						if bk[bkluck]==6 then 
							SetIdleMotion( ba6 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam6)
						end
						if bk[bkluck]==7 then 
							SetIdleMotion( ba7 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam7)
						end
						if bk[bkluck]==8 then 
							SetIdleMotion( ba8 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam8)
						end
						table.remove (bk, bkluck)	------------------------
						bmonster=CreateObjByFlag(102842,780449,1,1)----------------------���z�K��+�Mbuff
						AddToPartition( bmonster , RoomID )
						SetAttack( bmonster , BossTarget)
						WriteRoleValue( bmonster, EM_RoleValue_PID,boss)
						AddBuff(bmonster,505108,0,-1)--------------���z�K��
						BeginPlot( bmonster , "Lua_bk_sw_102842",20)
						BeginPlot( bmonster ,"Lua_bk_fd_sm_102760",100)
						SetPlot( bmonster,"dead","Lua_bk_swsm_dead01_102706",10 )
						bkluck=DW_Rand(table.getn(bk))
						if bk[bkluck]==1 then 
							SetIdleMotion( ba1 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam1)
						end
						if bk[bkluck]==2 then 
							SetIdleMotion( ba2 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam2)
						end
						if bk[bkluck]==3 then 
							SetIdleMotion( ba3 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam3)
						end
						if bk[bkluck]==4 then  
							SetIdleMotion( ba4 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam4)
						end
						if bk[bkluck]==5 then 
							SetIdleMotion( ba5 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam5)
						end
						if bk[bkluck]==6 then 
							SetIdleMotion( ba6 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam6)
						end
						if bk[bkluck]==7 then 
							SetIdleMotion( ba7 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam7)
						end
						if bk[bkluck]==8 then 
							SetIdleMotion( ba8 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam8)
						end
						table.remove (bk, bkluck)--------------------------------------					
						cmonster=CreateObjByFlag(102841,780449,1,1)----------------------�k�N�K��+�Mbuff
						AddToPartition( cmonster , RoomID )
						SetAttack( cmonster , BossTarget)
						WriteRoleValue( cmonster, EM_RoleValue_PID,boss)
						AddBuff(cmonster,505109,0,-1)--------------�k�N�K��
						BeginPlot( cmonster , "Lua_bk_sw_102841",20)
						BeginPlot( cmonster ,"Lua_bk_fd_sm_102760",100)
						SetPlot( cmonster,"dead","Lua_bk_swsm_dead01_102706",10 )
						bkluck=DW_Rand(table.getn(bk))
						if bk[bkluck]==1 then 
							SetIdleMotion( ba1 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam1)
						end
						if bk[bkluck]==2 then 
							SetIdleMotion( ba2 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam2)
						end
						if bk[bkluck]==3 then 
							SetIdleMotion( ba3 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam3)
						end
						if bk[bkluck]==4 then  
							SetIdleMotion( ba4 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam4)
						end
						if bk[bkluck]==5 then 
							SetIdleMotion( ba5 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam5)
						end
						if bk[bkluck]==6 then 
							SetIdleMotion( ba6 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam6)
						end
						if bk[bkluck]==7 then 
							SetIdleMotion( ba7 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam7)
						end
						if bk[bkluck]==8 then 
							SetIdleMotion( ba8 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam8)
						end
						table.remove (bk, bkluck)	------------------------
						m2be=1
					end
				end
				if alltime>= 280 then 
					if gg==0 then 
						ScriptMessage( OwnerID() , -1 , 2 , "[SC_102706_04]" , 1 )
						AddBuff(boss,505224,0,-1)-------------------�g��	
						gg=1
					end
				end
			end			
		elseif HateListCount( boss ) == 0 then----------------���}�԰� �Ҧ��ȳ��Ӧ^�k
			if CombatBegin == 1 then
				sleep(30)
				DelObj(door)
				DelObj(ba1)
				DelObj(ba2)
				DelObj(ba3)
				DelObj(ba4)
				DelObj(ba5)
				DelObj(ba6)
				DelObj(ba7)
				DelObj(ba8)
				DelObj(bam1)
				DelObj(bam2)
				DelObj(bam3)
				DelObj(bam4)
				DelObj(bam5)
				DelObj(bam6)
				DelObj(bam7)
				DelObj(bam8)
				local PPL = SetSearchAllPlayer(RoomID)
				for i = 1 , PPL , 1 do ---�⪱�a��J�ж��� 
					local ID = GetSearchResult()
					if ReadRoleValue( ID , EM_RoleValue_IsDead ) ~= 1 and ReadRoleValue( ID, EM_RoleValue_VOC) ~= 0  and ReadRoleValue( ID , EM_RoleValue_RoomID  ) == RoomID then
						CancelBuff( ID , 505037 )
					end
				end
				WriteRoleValue(start, EM_RoleValue_Register1,1)	
				sleep(20)
				DelObj(boss)
				CombatBegin=0
			end
		end
	end
end
function Lua_bk_spid_voc_102706()
local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local boss=OwnerID()
local Play_Chose={}
local kp=0
local BossTarget
local voc
local war
local sco 
local rog
local mag
local pri
local kni
local warden
local dru
	Play_Chose=DW_HateRemain(0)
	kp=DW_Rand(table.getn(Play_Chose))
	if kp==0 then 
	end
	if kp~=0 then 	
		AddBuff(boss,505121,0,-1)-------------------�l����q��
		CastSpellLV( OwnerID() , Play_Chose[kp]	 , 494508 , 1 )---------------------��󣸭ӤH�h��������ʧ@
		AddBuff(Play_Chose[kp],505036,0,-1)-------------------�b���a���W�񣸭өۦ�
		voc = ReadRoleValue( Play_Chose[kp] , EM_RoleValue_VOC ) 
		if voc == 1 then ------------------�Ԥh
			war=CreateObjByFlag(102882,780449,1,1)----------------�b���i�Ѯ��䲣�ͩǪ�
			SetModeEx( war , EM_SetModeType_Strikback, false) ---����
			SetModeEx( war , EM_SetModeType_Move, false) ---����	
			SetModeEx( war , EM_SetModeType_Fight, false) ---�i���
			SetModeEx( war , EM_SetModeType_Searchenemy, false )--����
			AddToPartition( war , RoomID )
			WriteRoleValue( war, EM_RoleValue_PID,Play_Chose[kp])
			WriteRoleValue( war, EM_RoleValue_Register1,boss)
			BeginPlot( war,"Lua_bk_mam1_102882",0)
			SetPlot( war,"dead","Lua_bk_swsm_dead00_102706",10 )
		end
		if voc == 2 then ------------------�C�L
			sco=CreateObjByFlag(102883,780449,1,1)----------------�b���i�Ѯ��䲣�ͩǪ�
			SetModeEx( sco , EM_SetModeType_Strikback, false) ---����
			SetModeEx( sco , EM_SetModeType_Move, false) ---����	
			SetModeEx( sco , EM_SetModeType_Fight, false) ---�i���
			SetModeEx(  sco , EM_SetModeType_Searchenemy, false )--����
			AddToPartition( sco , RoomID )
			WriteRoleValue( sco, EM_RoleValue_PID,Play_Chose[kp])
			WriteRoleValue( sco, EM_RoleValue_Register1,boss)
			BeginPlot( sco,"Lua_bk_mam2_102883",0)
			SetPlot( sco,"dead","Lua_bk_swsm_dead00_102706",10 )
		end
		if voc == 3 then ------------------�v��
			rog=CreateObjByFlag(102884,780449,1,1)----------------�b���i�Ѯ��䲣�ͩǪ�
			SetModeEx( rog , EM_SetModeType_Strikback, false) ---����
			SetModeEx( rog , EM_SetModeType_Move, false) ---����	
			SetModeEx( rog , EM_SetModeType_Fight, false) ---�i���
			SetModeEx(  rog , EM_SetModeType_Searchenemy, false )--����
			AddToPartition( rog , RoomID )
			WriteRoleValue( rog, EM_RoleValue_PID,Play_Chose[kp])
			WriteRoleValue( rog, EM_RoleValue_Register1,boss)
			BeginPlot( rog,"Lua_bk_mam3_102884",0)		
			SetPlot( rog,"dead","Lua_bk_swsm_dead00_102706",10 )								
		end
		if voc == 4 then ------------------�k�v
			mag=CreateObjByFlag(102885,780449,1,1)----------------�b���i�Ѯ��䲣�ͩǪ�
			SetModeEx( mag , EM_SetModeType_Strikback, false) ---����
			SetModeEx( mag , EM_SetModeType_Move, false) ---����	
			SetModeEx( mag , EM_SetModeType_Fight, false) ---�i���
			SetModeEx(  mag , EM_SetModeType_Searchenemy, false )--����
			AddToPartition( mag , RoomID )
			WriteRoleValue( mag, EM_RoleValue_PID,Play_Chose[kp])
			WriteRoleValue(  mag, EM_RoleValue_Register1,boss)
			BeginPlot( mag,"Lua_bk_mam4_102885",0)		
			SetPlot( mag,"dead","Lua_bk_swsm_dead00_102706",10 )									
		end
		if voc == 5 then ------------------���v
			pri=CreateObjByFlag(102886,780449,1,1)----------------�b���i�Ѯ��䲣�ͩǪ�
			SetModeEx( pri , EM_SetModeType_Strikback, false) ---����
			SetModeEx( pri , EM_SetModeType_Move, false) ---����	
			SetModeEx( pri , EM_SetModeType_Fight, false) ---�i���
			SetModeEx(  pri , EM_SetModeType_Searchenemy, false )--����
			AddToPartition( pri , RoomID )
			WriteRoleValue( pri, EM_RoleValue_PID,Play_Chose[kp])
			WriteRoleValue( pri, EM_RoleValue_Register1,boss)
			BeginPlot( pri,"Lua_bk_mam5_102886",0)	
			SetPlot( pri,"dead","Lua_bk_swsm_dead00_102706",10 )
		end
		if voc == 6 then ------------------�M�h
			kni=CreateObjByFlag(102887,780449,1,1)----------------�b���i�Ѯ��䲣�ͩǪ�
			SetModeEx( kni , EM_SetModeType_Strikback, false) ---����
			SetModeEx( kni , EM_SetModeType_Move, false) ---����	
			SetModeEx( kni , EM_SetModeType_Fight, false) ---�i���
			SetModeEx(  kni , EM_SetModeType_Searchenemy, false )--����
			AddToPartition( kni , RoomID )
			WriteRoleValue( kni, EM_RoleValue_PID,Play_Chose[kp])
			WriteRoleValue( kni, EM_RoleValue_Register1,boss)
			BeginPlot( kni,"Lua_bk_mam6_102887",0)	
			SetPlot( kni,"dead","Lua_bk_swsm_dead00_102706",10 )
		end
		if voc == 7 then ------------------����
			warden=CreateObjByFlag(102888,780449,1,1)----------------�b���i�Ѯ��䲣�ͩǪ�
			SetModeEx( warden , EM_SetModeType_Strikback, false) ---����
			SetModeEx( warden , EM_SetModeType_Move, false) ---����	
			SetModeEx( warden , EM_SetModeType_Fight, false) ---�i���
			SetModeEx(  warden , EM_SetModeType_Searchenemy, false )--����
			AddToPartition( warden , RoomID )
			WriteRoleValue( warden, EM_RoleValue_PID,Play_Chose[kp])
			WriteRoleValue( warden, EM_RoleValue_Register1,boss)
			BeginPlot( warden,"Lua_bk_mam7_102888",0)	
			SetPlot( warden,"dead","Lua_bk_swsm_dead00_102706",10 )
		end
		if voc == 8 then ------------------���x
			dru=CreateObjByFlag(102889,780449,1,1)----------------�b���i�Ѯ��䲣�ͩǪ�
			SetModeEx( dru , EM_SetModeType_Strikback, false) ---����
			SetModeEx( dru , EM_SetModeType_Move, false) ---����	
			SetModeEx( dru , EM_SetModeType_Fight, false) ---�i���
			SetModeEx(  dru , EM_SetModeType_Searchenemy, false )--����
			AddToPartition( dru , RoomID )
			WriteRoleValue( dru, EM_RoleValue_PID,Play_Chose[kp])
			WriteRoleValue( dru, EM_RoleValue_Register1,boss)
			BeginPlot( dru,"Lua_bk_mam8_102889",0)		
			SetPlot( dru,"dead","Lua_bk_swsm_dead00_102706",10 )
		end
	sleep(20)
	end
end

