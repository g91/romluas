---------------------------st EM_RoleValue_Register1  �����}�l�p�Ǫ����`�@��,���`����N�|�}�l��J�@��
---------------------------fo  EM_RoleValue_Register2��������_�μ@���n�O���\�����s���O�q
---------------------------fm  EM_RoleValue_Register3��������_�μ@���n�O���\�����s���O�q
--------------------------- EM_RoleValue_Register4���������}�԰�
--------------------------- EM_RoleValue_Register5���������}����
--------------------------- EM_RoleValue_Register6
--------------------------- EM_RoleValue_Register7
--------------------------- EM_RoleValue_Register8
--------------------------- EM_RoleValue_Register9
function Lua_bk_fd00_102670()-----------------------�ͤp�Ƕ��q
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------�}�l���ж�
	local st=OwnerID()-------------------------------------------------------�}�l���
	local sd=0--------------�O���}�l�����ͼ@��
	local fm=0-------���_�O������
	local fo=0-------�}���O�O��
	local gg=0 ------�����}�԰�
	local dr0
	local dr1
	local dr2
	local door0
	local door1
	local nf1=0
	local nf2=0
	local nf3=0
	local nf4=0
	local cf1=0
	local cf2=0
	local cf3=0
	local cf4=0
	local bsm1=0
	local bsm2=0
	local bsm3=0
	local bsm4=0
	local m1count=0
	local m1door=0
	local m2count=0
	local fobe=0
	local ggboss=0
	local dead
	local sm1=CreateObjByFlag(102778,780470,14,1)-----------------------���ͨ��w�I�]�k�p�L
	WriteRoleValue(sm1,EM_RoleValue_PID,st)
	AddToPartition( sm1 , RoomID )
	SetPlot( sm1 , "dead" , "Lua_bk_fd01_01_102670" , 10 )-----------------------------------���`�O��
	local boss=CreateObjByFlag(102670,780470,9,1)----------------�b�X�гB�ͥX���s�Q�x�����i���
	SetModeEx( boss , EM_SetModeType_Strikback, false) ---����
	SetModeEx( boss , EM_SetModeType_Move, false) ---����	
	SetModeEx( boss , EM_SetModeType_Fight, false) ---�i���
	SetModeEx( boss , EM_SetModeType_Show, true)
	SetModeEx(  boss , EM_SetModeType_Searchenemy, false )--����
	PlayMotion ( boss, ruFUSION_ACTORSTATE_BUFF_SP03 )-----------------------����˦a�ʧ@
	SetDefIdleMotion( boss,ruFUSION_MIME_IDLE_STAND_02)---����˦b�a�W�ʧ@-------------�ä㪺�ʧ@ 
	AddToPartition( boss , RoomID )
	WriteRoleValue(boss,EM_RoleValue_PID,st)
	SetPlot( boss ,"dead", "Lua_bk_dead_fd_102670" ,50)----------------------------------------��J���`�@��
	local f1=CreateObjByFlag(113648,780470,5,1)----------------�ͥX�����--------------------------------�}���o��
	SetModeEx(  f1 , EM_SetModeType_ShowRoleHead, false )----------�Y����
	AddToPartition( f1 , RoomID )
	SetPlot( f1 , "touch" , "Lua_bk_fd_113648" , 50 )------------------�ߨ����~
	AddBuff(boss, 504995 , 1 , -1 )				
	local f2=CreateObjByFlag(113648,780470,6,1)----------------�ͥX�����--------------------------------�}���o��
	SetModeEx(  f2 , EM_SetModeType_ShowRoleHead, false )----------�Y����
	AddToPartition( f2 , RoomID )
	SetPlot( f2 , "touch" , "Lua_bk_fd_113648" , 50 )------------------�ߨ����~
	AddBuff(boss, 504851 , 1 , -1 )			
	local f3=CreateObjByFlag(113648,780470,7,1)----------------�ͥX�����--------------------------------�}���o��
	SetModeEx(  f3 , EM_SetModeType_ShowRoleHead, false )----------�Y����
	AddToPartition( f3 , RoomID )
	SetPlot( f3 , "touch" , "Lua_bk_fd_113648" , 50 )------------------�ߨ����~
	AddBuff(boss, 504997 , 1 , -1 )			
	local f4=CreateObjByFlag(113648,780470,8,1)----------------�ͥX�����--------------------------------�}���o��
	SetModeEx(  f4 , EM_SetModeType_ShowRoleHead, false)----------�Y����
	AddToPartition( f4 , RoomID )
	SetPlot( f4 , "touch" , "Lua_bk_fd_113648" , 50 )------------------�ߨ����~
	AddBuff(boss, 504996 , 1 , -1 )			
	while 1 do --------------------�C��h�ˬdRegister1�ݶ}�l���p�L�s���s�b
	sleep(10)
		sd=ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
		if sd==2 then 
		ScriptMessage( sm1 , -1 , 2 , "[SC_102670_00]" , 1 )---------------------�ĤH�J�I�F�I�ֳq�����D�N�x�I�I
		Say(sm1,"[SC_102670_00]")
		dr0 = CreateObjByFlag(102462,780470,12,1)-----------------------�b�X��2�W����J���ת�  -----5����ת�
		SetModeEx( dr0 , EM_SetModeType_Gravity, false) ---���O
		SetModeEx( dr0 , EM_SetModeType_Mark, false)
		SetModeEx( dr0 , EM_SetModeType_HideName, false)
		SetModeEx( dr0 , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( dr0 , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( dr0 , EM_SetModeType_Obstruct, true)   -----���O
		SetModeEx( dr0 , EM_SetModeType_Move, false) ---����	
		SetModeEx( dr0 , EM_SetModeType_Fight, false) ---�i���
		SetModeEx( dr0 , EM_SetModeType_SearchenemyIgnore, false) 
		SetModeEx( dr0 , EM_SetModeType_Searchenemy, false)
		SetModeEx( dr0 , EM_SetModeType_Show, true)
		AddToPartition( dr0 , RoomID )
		
		dr1 = CreateObjByFlag(102462,780470,16,1)-----------------------�b�X��2�W����J���ת�  -----5����ת�
		SetModeEx( dr1 , EM_SetModeType_Gravity, false) ---���O
		SetModeEx( dr1 , EM_SetModeType_Mark, false)
		SetModeEx( dr1 , EM_SetModeType_HideName, false)
		SetModeEx( dr1 , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( dr1 , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( dr1 , EM_SetModeType_Obstruct, true)   -----���O
		SetModeEx( dr1 , EM_SetModeType_Strikback, false) ---����
		SetModeEx( dr1 , EM_SetModeType_Move, false) ---����	
		SetModeEx( dr1 , EM_SetModeType_Fight, false) ---�i���
		SetModeEx( dr1 , EM_SetModeType_SearchenemyIgnore, false) 
		SetModeEx( dr1 , EM_SetModeType_Searchenemy, false)
		SetModeEx( dr1 , EM_SetModeType_Show, true)
		AddToPartition( dr1 , RoomID )
		dr2 = CreateObjByFlag(102462,780470,17,1)-----------------------�b�X��2�W����J���ת�  -----5����ת�
		SetModeEx( dr2 , EM_SetModeType_Gravity, false) ---���O
		SetModeEx( dr2 , EM_SetModeType_Mark, false)
		SetModeEx( dr2 , EM_SetModeType_HideName, false)
		SetModeEx( dr2 , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( dr2 , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( dr2 , EM_SetModeType_Obstruct, true)   -----���O
		SetModeEx( dr2 , EM_SetModeType_Strikback, false) ---����
		SetModeEx( dr2 , EM_SetModeType_Move, false) ---����	
		SetModeEx( dr2 , EM_SetModeType_Fight, false) ---�i���
		SetModeEx( dr2 , EM_SetModeType_SearchenemyIgnore, false) 
		SetModeEx( dr2 , EM_SetModeType_Searchenemy, false)
		SetModeEx( dr2 , EM_SetModeType_Show, true)
		AddToPartition( dr2 , RoomID )	
		m1count= CreateObjByFlag(102782,780470,9,1)---------------�ͥX�Ĥ@���q���
		SetModeEx( m1count , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( m1count , EM_SetModeType_Strikback, false) ---����
		SetModeEx( m1count , EM_SetModeType_Move, false) ---����	
		SetModeEx( m1count , EM_SetModeType_Fight, false) ---�i���
		SetModeEx(  m1count , EM_SetModeType_Searchenemy, false )--����
		SetModeEx( m1count , EM_SetModeType_Show, false)
		SetModeEx(  m1count , EM_SetModeType_ShowRoleHead, false)----------�Y����
		WriteRoleValue(m1count,EM_RoleValue_PID,st)
		AddToPartition( m1count , RoomID )
		BeginPlot( m1count , "Lua_bk_fd02_102670",20)---------------------------------�Ĥ@���q�����Ȫ��~���}�cŢ
		BeginPlot( m1count , "Lua_bk_fd_m1_102670",100)---------------------------------�P�_���}�԰�
		WriteRoleValue(OwnerID(),EM_RoleValue_Register1,0)
		m1door=CreateObjByFlag(102736,780470,12,1)----------------�ͥX�Ĥ@���q���
		SetModeEx( m1door , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( m1door , EM_SetModeType_Strikback, false) ---����
		SetModeEx( m1door , EM_SetModeType_Move, false) ---����	
		SetModeEx( m1door , EM_SetModeType_Fight, false) ---�i���
		SetModeEx(  m1door , EM_SetModeType_Searchenemy, false )--����
		SetModeEx(  m1door , EM_SetModeType_ShowRoleHead, false)----------�Y����
		SetModeEx( m1door , EM_SetModeType_Show, false)
		WriteRoleValue(m1door,EM_RoleValue_PID,st)
		AddToPartition( m1door , RoomID )---------	AddBuff(m1door, 505056 , 1 , -1 )			
		end	
		if CheckBuff( f1, 504848) then   ---------------------�Ѷ}�������|�������u
			nf1 =LuaFunc_CreateObjByObj ( 102801 , f1 )--------------������o��
			SetModeEx( nf1 , EM_SetModeType_ShowRoleHead, false )----------�Y����
			SetModeEx( nf1 , EM_SetModeType_Mark, true )----------�аO	
			SetModeEx( nf1 , EM_SetModeType_Strikback, false) ---����
			SetModeEx( nf1 , EM_SetModeType_Move, false) ---����	
			SetModeEx( nf1 , EM_SetModeType_Fight, false) ---�i���
			AddToPartition( nf1 , RoomID )
			DelObj(f1)
			fo=fo+1
			CancelBuff(boss , 504996 )----------------------------------�������a���Wbuff
		end
		if CheckBuff( f2, 504848) then 
			nf2 =LuaFunc_CreateObjByObj ( 102801 , f2 )--------------������o��.
			SetModeEx( nf2 , EM_SetModeType_ShowRoleHead, false )----------�Y����
			SetModeEx( nf2 , EM_SetModeType_Mark, true )----------�аO	
			SetModeEx( nf2 , EM_SetModeType_Strikback, false) ---����
			SetModeEx( nf2 , EM_SetModeType_Move, false) ---����	
			SetModeEx( nf2 , EM_SetModeType_Fight, false) ---�i���
			AddToPartition( nf2 , RoomID )
			DelObj(f2)
			fo=fo+1
			CancelBuff(boss , 504851 )----------------------------------�������a���Wbuff
		end
		if CheckBuff( f3, 504848) then 
			nf3 =LuaFunc_CreateObjByObj ( 102801 , f3 )--------------������o��
			SetModeEx( nf3 , EM_SetModeType_ShowRoleHead, false )----------�Y����
			SetModeEx( nf3 , EM_SetModeType_Mark, true )----------�аO	
			SetModeEx( nf3 , EM_SetModeType_Strikback, false) ---����
			SetModeEx( nf3 , EM_SetModeType_Move, false) ---����	
			SetModeEx( nf3 , EM_SetModeType_Fight, false) ---�i���
			AddToPartition( nf3 , RoomID )
			DelObj(f3)
			fo=fo+1
			CancelBuff(boss , 504997 )----------------------------------�������a���Wbuff
		end
		if CheckBuff( f4, 504848) then 
			nf4 =LuaFunc_CreateObjByObj ( 102801 , f4 )--------------������o��
			SetModeEx( nf4 , EM_SetModeType_ShowRoleHead, false )----------�Y����
			SetModeEx( nf4 , EM_SetModeType_Mark, true )----------�аO	
			SetModeEx( nf4 , EM_SetModeType_Strikback, false) ---����
			SetModeEx( nf4 , EM_SetModeType_Move, false) ---����	
			SetModeEx( nf4 , EM_SetModeType_Fight, false) ---�i���
			AddToPartition( nf4 , RoomID )
			DelObj(f4)
			fo=fo+1
			CancelBuff(boss , 504995 )----------------------------------�������a���Wbuff
		end
		if fo == 4 then ------------�Ѷ}�cŢ
			if fobe==0 then
			ScriptMessage( boss , -1 , 2 , "[SC_102670_01]" , 1 ) ---------. �q �� �K������y�����z�o��ӪŶ��I�L�ƪ����ަV�|�P�z�g�I�I
			sleep(10)
			sysCastSpellLV( boss , boss , 494277 , 0 )-----------�����10%��q
			sleep(20)
			ScriptMessage( boss , -1 , 2 , "[SC_102670_02]" , 1 )
			say(boss,"[SC_102670_02]")
			sleep(10)
			Delobj(m1count)
			Delobj(m1door)
			SetModeEx(  boss , EM_SetModeType_Searchenemy, true )--����
			SetModeEx( boss , EM_SetModeType_Strikback, true) ---����
			SetModeEx( boss , EM_SetModeType_Move, true) ---����	
			SetModeEx( boss , EM_SetModeType_Fight, true) ---�i���
			PlayMotion ( boss, ruFUSION_ACTORSTATE_BUFF_SP02 )-----------------------����ò檺�ʧ@
			ScriptMessage( boss , -1 , 2 , "[SC_102670_03]" , 1 )
			say(boss,"[SC_102670_03]")
			Hide(boss)
			Show(boss,RoomID)
			WriteRoleValue(boss,EM_RoleValue_PID,st)
			BeginPlot( boss ,"Lua_bk_fd_boss_102670",20)--------------------------------------------��J����ai
			m2count =CreateObjByFlag(102782,780470,15,1)-------�إߤ@�ӱ����������ɶ�
			SetModeEx( m2count , EM_SetModeType_Gravity, false) ---���O
			SetModeEx( m2count , EM_SetModeType_Mark, false)
			SetModeEx( m2count , EM_SetModeType_HideName, false)
			SetModeEx( m2count , EM_SetModeType_ShowRoleHead, false)
			SetModeEx( m2count , EM_SetModeType_NotShowHPMP, false)
			SetModeEx( m2count , EM_SetModeType_Obstruct, true)   -----����
			SetModeEx( m2count , EM_SetModeType_Strikback, false) ---����
			SetModeEx( m2count , EM_SetModeType_Move, false) ---����	
			SetModeEx( m2count , EM_SetModeType_Fight, false) ---�i���
			SetModeEx( m2count , EM_SetModeType_SearchenemyIgnore, false) 
			SetModeEx( m2count , EM_SetModeType_Searchenemy, false)
			SetModeEx( m2count , EM_SetModeType_Show, false)
			AddToPartition( m2count , RoomID )
			WriteRoleValue(m2count,EM_RoleValue_PID,st)
			WriteRoleValue(m2count,EM_RoleValue_Register1,boss)		
			BeginPlot( m2count ,"Lua_bk_df_m2count_102670",0)			
			door0=CreateObjByFlag(102782,780470,9,1)------�إ�2�Ӫ�   780470   1 �M2
			SetModeEx( door0 , EM_SetModeType_Gravity, false) ---���O
			SetModeEx( door0 , EM_SetModeType_Mark, false)
			SetModeEx( door0 , EM_SetModeType_HideName, false)
			SetModeEx( door0 , EM_SetModeType_ShowRoleHead, false)
			SetModeEx( door0 , EM_SetModeType_NotShowHPMP, false)
			SetModeEx( door0 , EM_SetModeType_Obstruct,false)   -----����
			SetModeEx( door0 , EM_SetModeType_Strikback, false) ---����
			SetModeEx( door0 , EM_SetModeType_Move, false) ---����	
			SetModeEx( door0 , EM_SetModeType_Fight, false) ---�i���
			SetModeEx( door0 , EM_SetModeType_SearchenemyIgnore, false) 
			SetModeEx( door0 , EM_SetModeType_Searchenemy, false)
			SetModeEx( door0 , EM_SetModeType_Show, false)
			AddToPartition( door0 , RoomID )
			AddBuff(door0, 505056 , 1 , -1 )	
			WriteRoleValue(door0,EM_RoleValue_Register5,boss)
			WriteRoleValue(door0,EM_RoleValue_PID,st)
			WriteRoleValue(door0,EM_RoleValue_Register6,nf1)
			WriteRoleValue(door0,EM_RoleValue_Register7,nf2)
			WriteRoleValue(door0,EM_RoleValue_Register8,nf3)
			WriteRoleValue(door0,EM_RoleValue_Register9,nf4)
			BeginPlot( door0 ,"Lua_bk_fd_fdoor_102736",20)--------------------------------------------��J4�Ӫ����@��
			----------------------------door1=CreateObjByFlag(102782,780470,11,1)-------�إ�2�Ӫ�   780470   1 �M2
			door1= CreateObjByFlag(102782,780470,9,1)-------�إ�2�Ӫ�   780470   1 �M2
			SetModeEx( door1 , EM_SetModeType_Gravity, false) ---���O
			SetModeEx( door1 , EM_SetModeType_Mark, false)
			SetModeEx( door1 , EM_SetModeType_HideName, false)
			SetModeEx( door1 , EM_SetModeType_ShowRoleHead, false)
			SetModeEx( door1 , EM_SetModeType_NotShowHPMP, false)
			SetModeEx( door1 , EM_SetModeType_Obstruct, false)   -----����
			SetModeEx( door1 , EM_SetModeType_Strikback, false) ---����
			SetModeEx( door1 , EM_SetModeType_Move, false) ---����	
			SetModeEx( door1 , EM_SetModeType_Fight, false) ---�i���
			SetModeEx( door1 , EM_SetModeType_SearchenemyIgnore, false) 
			SetModeEx( door1 , EM_SetModeType_Searchenemy, false)
			SetModeEx( door1 , EM_SetModeType_Show, false)
			AddToPartition( door1 , RoomID )
			AddBuff(door1, 505056 , 1 , -1 )	
			WriteRoleValue(door1,EM_RoleValue_PID,st)
			WriteRoleValue(door1,EM_RoleValue_Register5,boss)
			WriteRoleValue(door1,EM_RoleValue_Register6,nf1)
			WriteRoleValue(door1,EM_RoleValue_Register7,nf2)
			WriteRoleValue(door1,EM_RoleValue_Register8,nf3)
			WriteRoleValue(door1,EM_RoleValue_Register9,nf4)
			BeginPlot( door1 ,"Lua_bk_fd_fdoor1_102736",20)--------------------------------------------��J4�Ӫ����@��
			fobe=1
			end
		end	--------------------------�C��hŪ��504757 �o��buff����m,�M��}�l�hŪ���L���¤O,��¤O�F��10����N�|�}�l�h����@��
		bs1=Lua_BuffPosSearch( nf1 , 504757 )---------------------�磌��h�ˬd�o���ؼ�buff----buff�R�W���״_
		bs2=Lua_BuffPosSearch( nf2 , 504757 )---------------------�磌��h�ˬd�o���ؼ�buff----buff�R�W���״_
		bs3=Lua_BuffPosSearch( nf3 , 504757 )---------------------�磌��h�ˬd�o���ؼ�buff----buff�R�W���״_
		bs4=Lua_BuffPosSearch( nf4 , 504757 )---------------------�磌��h�ˬd�o���ؼ�buff----buff�R�W���״_
		-----------------------------------------------
		if bs1>=0 then
			bp1=BuffInfo( nf1 , bs1 , EM_BuffInfoType_Power )
			if bp1>=20 then 
				if bsm1==0 then 
				WriteRoleValue(nf1,EM_RoleValue_Register9,1)
				sleep(20)
				cf1=LuaFunc_CreateObjByObj (  113648 , nf1 )----------------�ͥX�����--------------------------------�o��
				AddToPartition( cf1 , RoomID )
				sleep(30)
				DelObj(nf1)
				fm=fm+1
				WriteRoleValue(st, EM_RoleValue_Register6,nf1)
				bsm1=1
				end
			end
		end
		if bs2>=0 then 
			bp2=BuffInfo( nf2 , bs2 , EM_BuffInfoType_Power )
			if bp2>=20 then 
				if bsm2==0 then 
				WriteRoleValue(nf2,EM_RoleValue_Register9,1)
				sleep(20)
				cf2=LuaFunc_CreateObjByObj (  113648 , nf2 )----------------�ͥX�����--------------------------------�o��
				AddToPartition( cf2 , RoomID )
				sleep(30)
				DelObj(nf2)
				fm=fm+1
				WriteRoleValue(st, EM_RoleValue_Register7,nf2)
				bsm2=1
				end
			end
		end
		if bs3>=0 then 
			bp3=BuffInfo( nf3 , bs3 , EM_BuffInfoType_Power )
			if bp3>=20 then 
				if bsm3==0 then 
				WriteRoleValue(nf3,EM_RoleValue_Register9,1)
				sleep(20)
				cf3=LuaFunc_CreateObjByObj (  113648 , nf3 )----------------�ͥX�����--------------------------------�o��
				AddToPartition( cf3 , RoomID )
				sleep(30)
				DelObj(nf3)
				fm=fm+1
				WriteRoleValue(st, EM_RoleValue_Register8,nf3)
				bsm3=1
				end
			end
		end
		if bs4>=0 then 
			bp4=BuffInfo( nf4 , bs4 , EM_BuffInfoType_Power )
			if bp4>=20 then 
				if bsm4==0 then 
				WriteRoleValue(nf4,EM_RoleValue_Register9,1)
				sleep(20)
				cf4=LuaFunc_CreateObjByObj (  113648 , nf4 )----------------�ͥX�����--------------------------------�o��
				AddToPartition( cf4 , RoomID )
				sleep(30)
				DelObj(nf4)
				fm=fm+1
				WriteRoleValue(st, EM_RoleValue_Register9,nf4)
				bsm4=1
				end
			end
		end		
		dead=ReadRoleValue(OwnerID(),EM_RoleValue_Register5)
		if dead==1 then 
			Delobj(ggboss)
			Delobj(dr0)
			Delobj(dr1)
			Delobj(dr2)
			Delobj(f1)
			Delobj(f2)
			Delobj(f3)
			Delobj(f4)
			Delobj(cf1)
			Delobj(cf2)
			Delobj(cf3)
			Delobj(cf4)
			Delobj(nf1)
			Delobj(nf2)
			Delobj(nf3)
			Delobj(nf4)
			Delobj(m1count)
			Delobj(m2count)
			Delobj(m1door)
			sleep(50)
			Delobj(st)
		end
		gg=ReadRoleValue(OwnerID(),EM_RoleValue_Register4)
		if gg==1 then 
		ggboss=ReadRoleValue(boss,EM_RoleValue_Register9)
		ScriptMessage( ggboss , -1 , 2 , "[SC_102670_11]" , 1 )
		Yell( ggboss ,  "[SC_102670_11]" , 5)
		sleep(20)
		PlayMotion ( boss, ruFUSION_ACTORSTATE_BUFF_SP03 )-----------------------����˦a�ʧ@
		SetDefIdleMotion( boss,ruFUSION_MIME_IDLE_STAND_02)---����˦b�a�W�ʧ@-------------�ä㪺�ʧ@ 
		SetModeEx( boss , EM_SetModeType_Strikback, false) ---����
		SetModeEx( boss , EM_SetModeType_Fight, false) ---�i���
		SetModeEx( boss , EM_SetModeType_SearchenemyIgnore, false) 
		SetModeEx( boss , EM_SetModeType_Searchenemy, false)----------------------------�o�̼g���m����...�����Ӭ媺���屼���ӴN�i�H���m�F 
		ScriptMessage(boss, -1 , 2 , "[SC_102670_12]" , 1 )
		sleep(50)
		local nst=CreateObjByFlag(113660,780470,15,1)--------------�o��ͥX�@�}�l�����
		SetModeEx( nst , EM_SetModeType_Gravity, false) ---���O
		SetModeEx( nst , EM_SetModeType_Mark, false)
		SetModeEx( nst , EM_SetModeType_HideName, false)
		SetModeEx( nst , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( nst , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( nst , EM_SetModeType_Obstruct, false)   -----����
		SetModeEx( nst , EM_SetModeType_Strikback, false) ---����
		SetModeEx( nst , EM_SetModeType_Move, false) ---����	
		SetModeEx( nst , EM_SetModeType_Fight, false) ---�i���
		SetModeEx( nst , EM_SetModeType_SearchenemyIgnore, false) 
		SetModeEx( nst , EM_SetModeType_Searchenemy, false)
		SetModeEx( nst , EM_SetModeType_Show, false)
		AddToPartition( nst , RoomID )
		BeginPlot( nst , "Lua_bk_fd00_102670",50)---------------------------------�P�_���}�԰�
		Delobj(ggboss)
		Delobj(dr0)
		Delobj(dr1)
		Delobj(dr2)
		Delobj(f1)
		Delobj(f2)
		Delobj(f3)
		Delobj(f4)
		Delobj(cf1)
		Delobj(cf2)
		Delobj(cf3)
		Delobj(cf4)
		Delobj(nf1)
		Delobj(nf2)
		Delobj(nf3)
		Delobj(nf4)
		Delobj(m1count)
		Delobj(m2count)
		Delobj(m1door)
		sleep(50)
		Delobj(boss)
		Delobj(st)
		break
		end
		if fm == 4 then
		WriteRoleValue(boss,EM_RoleValue_Register2,3)
		end
	end
end
function Lua_bk_fd_113648()
	SetPlot( TargetID()  ,"touch", "" ,0 )
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	BeginPlot( TargetID() , "Lua_bk_fd_ch_206138",0 )
end
function Lua_bk_fd_ch_206138()------------------------------���~�P�_
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local x=CountBodyItem ( TargetID(), 206138 )
	if x== 0 then
		ScriptMessage( TargetID() , TargetID() , 1 , "[SC_102670_08]" , 1 )------------------------------------�p�S���_��
		SetPlot( OwnerID() , "touch" , "Lua_bk_fd_113648" , 50 )------------------�ߨ����~
	elseif x>0 then 
		DelBodyItem ( TargetID(), 206138, 1 )
		AddBuff(OwnerID() , 504848,1,-1 )
		SetPlot( OwnerID()  ,"touch", "" ,0 )
	end
end
function Lua_bk_fd01_01_102670()-----------------------�p�L���`�@��
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------�}�l���ж�
	local st=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local sd=ReadRoleValue(st,EM_RoleValue_Register1)--------------------�������`
	sd=2
	WriteRoleValue(st,EM_RoleValue_Register1,sd)
end
function Lua_bk_fd_m1_102670()
local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------�}�l���ж�
local st=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
local m1count=OwnerID()
local CombatBegin=0
local voc
	while 1 do 
		sleep(50)
		local pm=SearchRangePlayer(m1count,400)
		local playx=0
		local px=table.getn(pm)-----���X�Ӫ��O�ƶq
		if px==0 then 
			WriteRoleValue(st,EM_RoleValue_Register4,1)
		end
		if px~=0 then 
			for i=0,px-1,1 do
				if ReadRoleValue( pm[i] , EM_RoleValue_VOC ) == 0  then
				playx=playx+1
				end
			end
			if px==playx then
				WriteRoleValue(st,EM_RoleValue_Register4,1)
			end
		end
	end
end
function Lua_bk_fd02_102670()------------------------���ͪ����J�@��   ----20��ͤ@���Ǫ�----------�Ĥ@���q�p�Ǫ�Ӽ@��
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------�}�l���ж�
	local m1count=OwnerID()
	local time1=0
	local s1={}----------------------�Ǫ�
	local s2=0
	local ma={}-----------------------------------------�Ĥ@���q�p�L
	local ma_num
	while 1 do 
	local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
	local BossTarget=AttackTarget
	sleep(10)
	time1=time1+1		
		if time1==15 then ------------------ �ͥX3���Ǫ�
			for i = 1 , table.getn(ma), 1 do
				if ma[i] ~= nil and ReadRoleValue( ma[i] , EM_RoleValue_IsDead) == 1 then
					table.remove ( ma , i)
				end	
			end
			ma_num = table.getn(ma)		
			if ma_num<=20 then 
				for i=1,2,1 do --------------�o�̤p�ǳ]�w���1000�X
					s1[i]=CreateObjByFlag(102779,780470,12,1)
					SetModeEx( s1[i] , EM_SetModeType_Searchenemy, true)
					SetModeEx( s1[i] , EM_SetModeType_Fight, true)
					AddToPartition( s1[i] , RoomID )
					BeginPlot( s1[i] ,"Lua_bk_fd_sm_102760",100)--------
					SetAttack( s1[i] , BossTarget)
					table.insert( ma , s1[i] )
				------------------ �ۤv���W�ˤ@�Ӽ@���s��o�{�ۤv���}�԰��N����
				end
			s2=CreateObjByFlag(102738,780470,12,1)
			SetModeEx( s2 , EM_SetModeType_Searchenemy, true)
			SetModeEx( s2 , EM_SetModeType_Fight, true)
			AddToPartition( s2 , RoomID )
			BeginPlot( s2 ,"Lua_bk_fd_sm_102760",100)--------��
			SetAttack( s2 , BossTarget)
			table.insert( ma , s2 )
			end
			time1=0
		end
	end
end
function Lua_bk_fd02_01_102670()
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------�}�l���ж�
	local s1=OwnerID()
	MoveToFlagEnabled ( s1,  false )
	LuaFunc_MoveToFlag( s1, 780470 , 12 , 10)-------���ʨ����
	SetModeEx( s1 , EM_SetModeType_Searchenemy, true)
	SetModeEx( s1 , EM_SetModeType_Fight, true)
	MoveToFlagEnabled ( s1,  true)
	BeginPlot( s1 ,"Lua_bk_fd_sm_102760",100)--------�p�����}�԰��N����
end
function Lua_bk_fd_sm_102760()-------------�p�Ǯ����@��
	while 1 do 
	sleep(30)
		if HateListCount( OwnerID() ) ~= 0 then 	
		elseif HateListCount( OwnerID() ) == 0 then 
			DelObj(OwnerID())
		end
	end
end
----------------------------fm     st    EM_RoleValue_Register3���buff�h�p�ƶq
----------------boss  EM_RoleValue_Register1���ת�id 
----------------mob EM_RoleValue_Register2 �������q�Ҧ�
----------------------------EM_RoleValue_Register6
--------------------------- EM_RoleValue_Register7
--------------------------- EM_RoleValue_Register8 ����
function Lua_bk_fd_boss_102670()
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------�}�l���ж�
	local st=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local sf=0--------------------------------------------------�ϥΤ��l�H���F��
	local gg=0
	local boss=OwnerID()
	local mob=0-------���q
	local skill={494459,494429}------1.�B��N 2. ���� 
	local skilllv={0,1}------------------------------²��Ҧ�
	local seat_chose={1,2,3,4}
	local time1=0
	local time2=0
	local time3=0
	local fwtime=0
	local t4=0
	local t3=0
	local fdpp=0---------------�������H������
	local pptime=0--------------���ѥ��H�ɶ�
	local alltime=0
	local bossx=0
	local bossy=0
	local bossz=0
	local bossdir=0
	local sball={}
	local Luck=0----------------�X���H��
	local ftime=0----------------------------------------------------------------���l�H�ɶ�
	local bs1=0------------------------buff����m
	local bs2=0------------------------buff����m
	local bs3=0------------------------buff����m
	local bs4=0------------------------buff����m
	local bp1=0
	local bp2=0
	local bp3=0
	local bp4=0
--	local door
	--local dr1
	---local dr2
	local firew=0
	local fm =0
	local Play_Chose={}
	local CombatBegin=0
	local baocount=0
	local bf=0
	local ggmob=0
	local ggboss=0
	local comob
	while 1 do 
	sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )   ------ ��M�ثe�������ؼ�
		local BossTarget=AttackTarget
		WriteRoleValue(boss, EM_RoleValue_Register5,BossTarget)
		if HateListCount( boss ) ~= 0 then	---- �T�w�L�{�b�����H
			pptime=pptime+1
			if CombatBegin == 0 then							---------------�u���}����@��
				CombatBegin = 1
				mob=0
		--		door = CreateObjByFlag(102462,780470,12,1)-----------------------�b�X��2�W����J���ת�  -----5����ת�
		---		SetModeEx( door , EM_SetModeType_Gravity, false) ---���O
		--		SetModeEx( door , EM_SetModeType_Mark, false)
		--		SetModeEx( door , EM_SetModeType_HideName, false)
		---		SetModeEx( door , EM_SetModeType_ShowRoleHead, false)
		--		SetModeEx( door , EM_SetModeType_NotShowHPMP, false)
		--		SetModeEx( door , EM_SetModeType_Obstruct, true)   -----���O
		--		SetModeEx( door , EM_SetModeType_Strikback, false) ---����
		--		SetModeEx( door , EM_SetModeType_Move, false) ---����	
		--		SetModeEx( door , EM_SetModeType_Fight, false) ---�i���
		--		SetModeEx( door , EM_SetModeType_SearchenemyIgnore, false) 
		--		SetModeEx( door , EM_SetModeType_Searchenemy, false)
		--		SetModeEx( door , EM_SetModeType_Show, true)
		--		AddToPartition( door , RoomID )
		--		WriteRoleValue(boss, EM_RoleValue_Register1,door)	---------------Register1   �A�ݭn�s����	
		--		dr1 = CreateObjByFlag(102462,780470,16,1)-----------------------�b�X��2�W����J���ת�  -----5����ת�
		--		SetModeEx( dr1 , EM_SetModeType_Gravity, false) ---���O
		--		SetModeEx( dr1 , EM_SetModeType_Mark, false)
		--		SetModeEx( dr1 , EM_SetModeType_HideName, false)
		--		SetModeEx( dr1 , EM_SetModeType_ShowRoleHead, false)
		--		SetModeEx( dr1 , EM_SetModeType_NotShowHPMP, false)
		--		SetModeEx( dr1 , EM_SetModeType_Obstruct, true)   -----���O
		--		SetModeEx( dr1 , EM_SetModeType_Strikback, false) ---����
		--		SetModeEx( dr1 , EM_SetModeType_Move, false) ---����	
		--		SetModeEx( dr1 , EM_SetModeType_Fight, false) ---�i���
		--		SetModeEx( dr1 , EM_SetModeType_SearchenemyIgnore, false) 
		--		SetModeEx( dr1 , EM_SetModeType_Searchenemy, false)
		--		SetModeEx( dr1 , EM_SetModeType_Show, true)
		--		AddToPartition( dr1 , RoomID )
		--		WriteRoleValue(boss, EM_RoleValue_Register6,dr1)	---------------Register3   �A�ݭn�s����	
		--		dr2 = CreateObjByFlag(102462,780470,17,1)-----------------------�b�X��2�W����J���ת�  -----5����ת�
		--		SetModeEx( dr2 , EM_SetModeType_Gravity, false) ---���O
		--		SetModeEx( dr2 , EM_SetModeType_Mark, false)
		--		SetModeEx( dr2 , EM_SetModeType_HideName, false)
		--		SetModeEx( dr2 , EM_SetModeType_ShowRoleHead, false)
		--		SetModeEx( dr2 , EM_SetModeType_NotShowHPMP, false)
		--		SetModeEx( dr2 , EM_SetModeType_Obstruct, true)   -----���O
		----		SetModeEx( dr2 , EM_SetModeType_Strikback, false) ---����
		--		SetModeEx( dr2 , EM_SetModeType_Move, false) ---����	
		--		SetModeEx( dr2 , EM_SetModeType_Fight, false) ---�i���
		--		SetModeEx( dr2 , EM_SetModeType_SearchenemyIgnore, false) 
		--		SetModeEx( dr2 , EM_SetModeType_Searchenemy, false)
		--		SetModeEx( dr2 , EM_SetModeType_Show, true)
		--		AddToPartition( dr2 , RoomID )
		--		WriteRoleValue(boss, EM_RoleValue_Register7,dr2)	---------------Register3   �A�ݭn�s����				
				sf =CreateObj( 102780 ,3809.4, 800 , 4326.8, 168.5 , 1)--------------------�n�Q�Ť�
				SetModeEx( sf , EM_SetModeType_Show, true) ----�q�X
				SetModeEx( sf , EM_SetModeType_Mark, false) ----�аO
				SetModeEx( sf , EM_SetModeType_Strikback, false) ---����
				SetModeEx( sf , EM_SetModeType_Move, false) ---����	
				SetModeEx( sf , EM_SetModeType_Fight, false) ---�i���
				SetModeEx( sf , EM_SetModeType_SearchenemyIgnore, false) ---���󤣷|�Q�j�M
				SetModeEx( sf , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
				SetModeEx( sf , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
				SetModeEx( sf , EM_SetModeType_Searchenemy, false)  ---���
				SetModeEx( sf , EM_SetModeType_Gravity, false) 
				SetModeEx( sf , EM_SetModeType_AlignToSurface, false) 
				WriteRoleValue(sf,EM_RoleValue_PID,boss)
				AddToPartition(sf , RoomID )
				mocount=CreateObjByFlag(100469,780470,15,1)
				SetModeEx( mocount , EM_SetModeType_Show, false) ----�q�X
				SetModeEx( mocount , EM_SetModeType_Mark, false) ----�аO
				SetModeEx( mocount , EM_SetModeType_Strikback, false) ---����
				SetModeEx( mocount , EM_SetModeType_Move, false) ---����	
				SetModeEx( mocount , EM_SetModeType_Fight, false) ---�i���
				SetModeEx( mocount , EM_SetModeType_SearchenemyIgnore, false) ---���󤣷|�Q�j�M
				SetModeEx( mocount , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
				SetModeEx( mocount , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
				SetModeEx( mocount , EM_SetModeType_Searchenemy, false)  ---���
				WriteRoleValue(mocount,EM_RoleValue_PID,boss)
				AddToPartition(mocount , RoomID )
				BeginPlot( mocount ,"Lua_fd_bao_113647",10)-------���@�n		
			end
			if CheckBuff(boss,505047) == true then 
				comob=1
				WriteRoleValue(boss,EM_RoleValue_Register8 ,comob)
			end 
			mob=ReadRoleValue(boss ,EM_RoleValue_Register2)
			if mob==0 then --------------------------�Ĥ@���q     �u�þ�   �ͥX�o�������@�n
				time1=time1+1
			---	time2=time2+1
				if time1>=8 then -------------------------------�򥻩ۦ�
				Luck=DW_Rand(100)
					if (Luck >= 0 and Luck < 25) or (Luck >= 50 and Luck < 75) then
						SkillIndex = 2------------------------------------------���饴���ˮ`
						BossTarget = AttackTarget
						CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )
						sleep(20)
					elseif (Luck >= 25 and Luck < 50) or (Luck >= 75 and Luck < 101) then	
						SkillIndex = 1-------------------------------------------���饴���ˮ`
						Play_Chose=DW_HateRemain(1)----------�����h���D�Z
						kp=DW_Rand(table.getn(Play_Chose))
						if kp==0 then 
						end
						if kp~=0 then 
						BossTarget = Play_Chose[kp]															
						CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )
						sleep(20)
						end
					end
					time1=0
				end
			-------	if time2>=25 then 
			----		CastSpellLV( OwnerID() , OwnerID() , 494458 , 0 )---------����d����
			---		ScriptMessage( OwnerID() , -1 , 2 , "[SC_102623_9]" , 1 )	
				---	sleep(20)
			--		time2=0
			---	end	       
			end
			if mob==1 then --------------------------�ĤG���q     ���l�H+������   -------�屼���@�n�ͥX�s��
				t4=0
				time3=0
				time1=time1+1
				time2=time2+1
				ftime=ftime+1------------------------���l�H
				fwtime=fwtime+1---------------------���W
				if ftime>=5 then 
					if t3==0 then 
					fm=ReadRoleValue(OwnerID(),EM_RoleValue_Register3)
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_102670_05]" , 1 )	
					BeginPlot( sf ,"Lua_bk_smfire_102780",10)-------------------------------------------��J���l�H�@��
					t3=1
					end
				end 
				if ftime>=20 then 
					if t3==1 then 
					fm=ReadRoleValue(OwnerID(),EM_RoleValue_Register3)
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_102670_05]" , 1 )	
					BeginPlot( sf ,"Lua_bk_smfire_102780",10)-------------------------------------------��J���l�H�@��
					end
				end
				if time1>=8 then  -------------------------------�򥻩ۦ�
				Luck=DW_Rand(100)
					if (Luck >= 0 and Luck < 25) or (Luck >= 50 and Luck < 75) then
						SkillIndex = 2------------------------------------------���饴���ˮ`
						BossTarget = AttackTarget
						CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )
						ScriptMessage( OwnerID() , -1 , 2 , "[SC_102623_03]" , 1 )
						sleep(20)
					elseif (Luck >= 25 and Luck < 50) or (Luck >= 75 and Luck < 101) then	
						SkillIndex = 1-------------------------------------------���饴���ˮ`
						Play_Chose=DW_HateRemain(1)----------�����h���D�Z
						kp=DW_Rand(table.getn(Play_Chose))
						if kp==0 then 
						end
						if kp~=0 then 
						BossTarget = Play_Chose[kp]															
						CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )
						sleep(20)
						end
					end
					time1=0
				end
			--	if time2>=25 then 
				---	CastSpellLV( OwnerID() , OwnerID() , 494458 , 0 )---------����d����
			---		ScriptMessage( OwnerID() , -1 , 2 , "[SC_102623_9]" , 1 )	
			---		sleep(20)
			---		time2=0
			---	end
			end
			if mob==2 then --------------------------�ĤT���q  ����
				t3=0
				ftime=0
				time1=time1+1
				time3=time3+1
				if time1>=8 then  -------------------------------�򥻩ۦ�
				Luck=DW_Rand(100)
					if (Luck >= 0 and Luck < 25) or (Luck >= 50 and Luck < 75) then
						SkillIndex = 2------------------------------------------���饴���ˮ`
						BossTarget = AttackTarget
						CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )
						sleep(20)
					elseif (Luck >= 25 and Luck < 50) or (Luck >= 75 and Luck < 101) then	
						SkillIndex = 1-------------------------------------------���饴���ˮ`
						Play_Chose=DW_HateRemain(1)----------�����h���D�Z
						kp=DW_Rand(table.getn(Play_Chose))
						if kp==0 then 
						end
						if kp~=0 then 
						BossTarget = Play_Chose[kp]															
						CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )
						sleep(20)
						end
					end
					time1=0
				end
				if time3>= 3 then ----------------����m
					if t4 ==0 then 
						ScriptMessage( boss , -1 , 2 , "[SC_102670_04]" , "#FF00CC" )
						sleep(50)
						local bbf=CreateObj( 102781 ,3809.4, 1000 , 4326.8, 168.5 , 1)--------------------�n�Q�Ť�--------------�b�Ť��X�{�@�ӯS�Ĳy
						SetModeEx( bbf , EM_SetModeType_Gravity, false) 
						SetModeEx( bbf , EM_SetModeType_AlignToSurface, false) 
						AddToPartition( bbf , RoomID )
						WriteRoleValue(bbf, EM_RoleValue_Livetime,15)	---------------�s�b�ɶ�livetime
						CastSpellLV( boss , bbf , 494461 , 0 )-------------�I���s���k��
						-----ScriptMessage( boss , -1 , 2 , "[SC_102670_04]" , 1 )
						AddBuff(bbf, 504994 , 1 , -1 )
						local seat =DW_Rand(table.getn(seat_chose))
						---------say(OwnerID(),"seat"..seat)
						if seat==1 then
							bf=CreateObjByFlag(102781,780470,seat_chose[seat],1)
							SetModeEx( bf , EM_SetModeType_Gravity, false) ---���O
							SetModeEx( bf , EM_SetModeType_Mark, false)
							SetModeEx( bf , EM_SetModeType_HideName, false)
							SetModeEx( bf , EM_SetModeType_ShowRoleHead, false)
							SetModeEx( bf , EM_SetModeType_NotShowHPMP, false)
							SetModeEx( bf , EM_SetModeType_Obstruct, true)   -----����
							SetModeEx( bf , EM_SetModeType_Strikback, false) ---����
							SetModeEx( bf , EM_SetModeType_Move, false) ---����	
							SetModeEx( bf , EM_SetModeType_Fight, false) ---�i���
							SetModeEx( bf , EM_SetModeType_SearchenemyIgnore, false) 
							SetModeEx( bf , EM_SetModeType_Searchenemy, false)
							SetModeEx( bf , EM_SetModeType_Show, true)
							AddToPartition( bf , RoomID )
							WriteRoleValue(bf, EM_RoleValue_Livetime,12)	---------------�s�b�ɶ�livetime
							BeginPlot( bf ,"Lua_bk_bfAB_102670",10)
						end
						if seat==2 then
							bf=CreateObjByFlag(102781,780470,seat_chose[seat],1)
							SetModeEx( bf , EM_SetModeType_Gravity, false) ---���O
							SetModeEx( bf , EM_SetModeType_Mark, false)
							SetModeEx( bf , EM_SetModeType_HideName, false)
							SetModeEx( bf , EM_SetModeType_ShowRoleHead, false)
							SetModeEx( bf , EM_SetModeType_NotShowHPMP, false)
							SetModeEx( bf , EM_SetModeType_Obstruct, true)   -----����
							SetModeEx( bf , EM_SetModeType_Strikback, false) ---����
							SetModeEx( bf , EM_SetModeType_Move, false) ---����	
							SetModeEx( bf , EM_SetModeType_Fight, false) ---�i���
							SetModeEx( bf , EM_SetModeType_SearchenemyIgnore, false) 
							SetModeEx( bf , EM_SetModeType_Searchenemy, false)
							SetModeEx( bf , EM_SetModeType_Show, true)
							AddToPartition( bf , RoomID )
							WriteRoleValue(bf, EM_RoleValue_Livetime,12)	---------------�s�b�ɶ�livetime
							BeginPlot( bf ,"Lua_bk_bfBA_102670",10)
						end
						if seat==3 then
							bf=CreateObjByFlag(102781,780470,seat_chose[seat],1)
							SetModeEx( bf , EM_SetModeType_Gravity, false) ---���O
							SetModeEx( bf , EM_SetModeType_Mark, false)
							SetModeEx( bf , EM_SetModeType_HideName, false)
							SetModeEx( bf , EM_SetModeType_ShowRoleHead, false)
							SetModeEx( bf , EM_SetModeType_NotShowHPMP, false)
							SetModeEx( bf , EM_SetModeType_Obstruct, true)   -----����
							SetModeEx( bf , EM_SetModeType_Strikback, false) ---����
							SetModeEx( bf , EM_SetModeType_Move, false) ---����	
							SetModeEx( bf , EM_SetModeType_Fight, false) ---�i���
							SetModeEx( bf , EM_SetModeType_SearchenemyIgnore, false) 
							SetModeEx( bf , EM_SetModeType_Searchenemy, false)
							SetModeEx( bf , EM_SetModeType_Show, true)
							AddToPartition( bf , RoomID )
							WriteRoleValue(bf, EM_RoleValue_Livetime,12)	---------------�s�b�ɶ�livetime
							BeginPlot( bf ,"Lua_bk_bfCD_102670",10)
						end
						if seat==4 then
							bf=CreateObjByFlag(102781,780470,seat_chose[seat],1)
							SetModeEx( bf , EM_SetModeType_Gravity, false) ---���O
							SetModeEx( bf , EM_SetModeType_Mark, false)
							SetModeEx( bf , EM_SetModeType_HideName, false)
							SetModeEx( bf , EM_SetModeType_ShowRoleHead, false)
							SetModeEx( bf , EM_SetModeType_NotShowHPMP, false)
							SetModeEx( bf , EM_SetModeType_Obstruct, true)   -----����
							SetModeEx( bf , EM_SetModeType_Strikback, false) ---����
							SetModeEx( bf , EM_SetModeType_Move, false) ---����	
							SetModeEx( bf , EM_SetModeType_Fight, false) ---�i���
							SetModeEx( bf , EM_SetModeType_SearchenemyIgnore, false) 
							SetModeEx( bf , EM_SetModeType_Searchenemy, false)
							SetModeEx( bf , EM_SetModeType_Show, true)
							AddToPartition( bf , RoomID )
							WriteRoleValue(bf, EM_RoleValue_Livetime,12)	---------------�s�b�ɶ�livetime
							BeginPlot( bf ,"Lua_bk_bfDC_102670",10)
						end
					-----	CastSpellLV( bbf , bf , 494462 , 1 )-------------�I���s���k��
					----	table.remove (seat_chose, seat)
					----	table.getn (seat_chose)
						t4=1
					end
				end
			---	if time3>=20 then
			---		if t4==1 then 
			---			ScriptMessage( boss , -1 , 2 , "[SC_102670_04]" , "#FF00CC" )
			---			local bbf=CreateObj( 102781 ,3809.4, 1000 , 4326.8, 168.5 , 1)--------------------�n�Q�Ť�--------------�b�Ť��X�{�@�ӯS�Ĳy
			---			SetModeEx( bbf , EM_SetModeType_Gravity, false) 
			---			SetModeEx( bbf , EM_SetModeType_AlignToSurface, false) 
			--			AddToPartition( bbf , RoomID )
			---			WriteRoleValue(bbf, EM_RoleValue_Livetime,15)	---------------�s�b�ɶ�livetime
			--			CastSpellLV( boss , bbf , 494461 , 0 )-------------�I���s���k��
						---ScriptMessage( boss , -1 , 2 , "[SC_102670_04]" , 1 )
			----			AddBuff(bbf, 504994 , 1 , -1 )					
			--			local seat =DW_Rand(table.getn(seat_chose))
			---			-----------------say(OwnerID(),"seat"..seat)
			---			if seat==1 then
			---			bf=CreateObjByFlag(102781,780470,seat_chose[seat],1)
			---			SetModeEx( bf , EM_SetModeType_Gravity, false) ---���O
			---			SetModeEx( bf , EM_SetModeType_Mark, false)
			---			SetModeEx( bf , EM_SetModeType_HideName, false)
			---			SetModeEx( bf , EM_SetModeType_ShowRoleHead, false)
			---			SetModeEx( bf , EM_SetModeType_NotShowHPMP, false)
			---			SetModeEx( bf , EM_SetModeType_Obstruct, true)   -----����
			---			SetModeEx( bf , EM_SetModeType_Strikback, false) ---����
			---			SetModeEx( bf , EM_SetModeType_Move, false) ---����	
			---			SetModeEx( bf , EM_SetModeType_Fight, false) ---�i���
			---			SetModeEx( bf , EM_SetModeType_SearchenemyIgnore, false) 
			---			SetModeEx( bf , EM_SetModeType_Searchenemy, false)
			---			SetModeEx( bf , EM_SetModeType_Show, true)
			---			AddToPartition( bf , RoomID )
			---			WriteRoleValue(bf, EM_RoleValue_Livetime,12)	---------------�s�b�ɶ�livetime
			---			BeginPlot( bf ,"Lua_bk_bfAB_102670",10)
			---			end
			---			if seat==2 then
			---			bf=CreateObjByFlag(102781,780470,seat_chose[seat],1)
			---			SetModeEx( bf , EM_SetModeType_Gravity, false) ---���O
			---			SetModeEx( bf , EM_SetModeType_Mark, false)
			---			SetModeEx( bf , EM_SetModeType_HideName, false)
			---			SetModeEx( bf , EM_SetModeType_ShowRoleHead, false)
			---			SetModeEx( bf , EM_SetModeType_NotShowHPMP, false)
			---			SetModeEx( bf , EM_SetModeType_Obstruct, true)   -----����
			---			SetModeEx( bf , EM_SetModeType_Strikback, false) ---����
			---			SetModeEx( bf , EM_SetModeType_Move, false) ---����	
			---			SetModeEx( bf , EM_SetModeType_Fight, false) ---�i���
			---			SetModeEx( bf , EM_SetModeType_SearchenemyIgnore, false) 
			---			SetModeEx( bf , EM_SetModeType_Searchenemy, false)
			---			SetModeEx( bf , EM_SetModeType_Show, true)
			---			AddToPartition( bf , RoomID )
			---			WriteRoleValue(bf, EM_RoleValue_Livetime,12)	---------------�s�b�ɶ�livetime
			---			BeginPlot( bf ,"Lua_bk_bfBA_102670",10)
			---			end
			---			if seat==3 then
			---			bf=CreateObjByFlag(102781,780470,seat_chose[seat],1)
			---			SetModeEx( bf , EM_SetModeType_Gravity, false) ---���O
			---			SetModeEx( bf , EM_SetModeType_Mark, false)
			---			SetModeEx( bf , EM_SetModeType_ShowRoleHead, false)
			---			SetModeEx( bf , EM_SetModeType_NotShowHPMP, false)
			---			SetModeEx( bf , EM_SetModeType_Obstruct, true)   -----����
			---			SetModeEx( bf , EM_SetModeType_Strikback, false) ---����
			---			SetModeEx( bf , EM_SetModeType_Move, false) ---����	
			---			SetModeEx( bf , EM_SetModeType_Fight, false) ---�i���
			---			SetModeEx( bf , EM_SetModeType_SearchenemyIgnore, false) 
			---			SetModeEx( bf , EM_SetModeType_Searchenemy, false)
			---			SetModeEx( bf , EM_SetModeType_Show, true)
			---			AddToPartition( bf , RoomID )
			---			WriteRoleValue(bf, EM_RoleValue_Livetime,12)	---------------�s�b�ɶ�livetime
			---			BeginPlot( bf ,"Lua_bk_bfCD_102670",10)
			---			end
			---			if seat==4 then
			---			bf=CreateObjByFlag(102781,780470,seat_chose[seat],1)
			---			SetModeEx( bf , EM_SetModeType_Gravity, false) ---���O
			---			SetModeEx( bf , EM_SetModeType_Mark, false)
			---			SetModeEx( bf , EM_SetModeType_HideName, false)
			---			SetModeEx( bf , EM_SetModeType_ShowRoleHead, false)
			---			SetModeEx( bf , EM_SetModeType_NotShowHPMP, false)
			---			SetModeEx( bf , EM_SetModeType_Obstruct, true)   -----����
			---			SetModeEx( bf , EM_SetModeType_Strikback, false) ---����
			---			SetModeEx( bf , EM_SetModeType_Move, false) ---����	
			---			SetModeEx( bf , EM_SetModeType_Fight, false) ---�i���
			---			SetModeEx( bf , EM_SetModeType_SearchenemyIgnore, false) 
			---			SetModeEx( bf , EM_SetModeType_Searchenemy, false)
			---			SetModeEx( bf , EM_SetModeType_Show, true)
			---			AddToPartition( bf , RoomID )
			---			WriteRoleValue(bf, EM_RoleValue_Livetime,12)	---------------�s�b�ɶ�livetime
			---			end
			------		-------	CastSpellLV( bbf , bf , 494462 , 0 )-------------�I���s���k��
			---			seat_chose={1,2,3,4}
			---			table.getn (seat_chose)
			---			time3=0
			---			t4=2
					----end
				------end
			end
			if mob ==3 then --------------------------------�۴��l�D�N�x!!!
				if ggmob==0 then
					ggboss=CreateObjByFlag(102802,780470,12,1)-----------------------�����l�D�N�x----------�b6�I
					AddToPartition( ggboss , RoomID )
					SetAttack( ggboss , BossTarget)
					sleep(10)
					ScriptMessage( ggboss , -1 , 2 , "[SC_102670_06]" , 1 )
					Yell( ggboss ,  "[SC_102670_06]" , 5)
					sleep(20)
					ScriptMessage( ggboss , -1 , 2 , "[SC_102670_09]" , 1 )
					Yell( ggboss ,  "[SC_102670_09]" , 5)
					sleep(20)	
					BeginPlot(ggboss,"Lua_bk_ggboss_102802",20)
					BeginPlot( ggboss ,"Lua_bk_fd_gb_102802",100)
					ScriptMessage( ggboss , -1 , 2 , "[SC_102670_10]" , 1 )
					Yell( ggboss ,  "[SC_102670_10]" , 5)
					ggmob=1
				end
				time1=time1+1
				if time1>=8 then -------------------------------�򥻩ۦ�
				Luck=DW_Rand(100)
					if (Luck >= 0 and Luck < 25) or (Luck >= 50 and Luck < 75) then
						SkillIndex = 2------------------------------------------���饴���ˮ`
						BossTarget = AttackTarget
						CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )
						sleep(20)
					elseif (Luck >= 25 and Luck < 50) or (Luck >= 75 and Luck < 101) then	
						SkillIndex = 1-------------------------------------------���饴���ˮ`
						Play_Chose=DW_HateRemain(1)----------�����h���D�Z
						kp=DW_Rand(table.getn(Play_Chose))
						if kp==0 then 
						end
						if kp~=0 then 
						BossTarget = Play_Chose[kp]															
						CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )
						sleep(20)
						end
					end
					time1=0
				end
			end
		elseif HateListCount( boss ) == 0 then----------------���}�԰� �Ҧ��ȳ��Ӧ^�k
			if CombatBegin==1 then-------------------------------------------�ͥX������
				sleep(50)
				SetModeEx( boss , EM_SetModeType_Strikback, false) ---����
				SetModeEx( boss , EM_SetModeType_Fight, false) ---�i���
				SetModeEx( boss , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( boss , EM_SetModeType_Searchenemy, false)----------------------------�o�̼g���m
				time1=0
				time2=0
				time3=0
				time4=0
				time5=0
				alltime=0
				CombatBegin=0
				gg=1 
				DelObj(sf)
				mob=4
				WriteRoleValue(boss, EM_RoleValue_Register2,mob)
				WriteRoleValue(boss, EM_RoleValue_Register4,1)
				WriteRoleValue(st, EM_RoleValue_Register4,1)------�����}�԰��o
				WriteRoleValue(boss, EM_RoleValue_Register9,ggboss)
			end
		end
	end
end
