function Lua_bk_wall_start_102469()
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------�}�l���ж�
	local door = CreateObjByFlag(104162,780470,9,1)----------------------�X�{����Ĳ�I�@��
	SetModeEx( door , EM_SetModeType_Gravity, false) ---���O
	SetModeEx( door , EM_SetModeType_Mark, false)
	SetModeEx( door , EM_SetModeType_HideName, false)
	SetModeEx( door , EM_SetModeType_ShowRoleHead, false)
	SetModeEx( door , EM_SetModeType_NotShowHPMP, false)
	SetModeEx( door , EM_SetModeType_Obstruct, false)   -----�|����(���ר�L������)
	SetModeEx( door , EM_SetModeType_Strikback, false) ---����
	SetModeEx( door , EM_SetModeType_Move, false) ---����	
	SetModeEx( door , EM_SetModeType_Fight, false) ---�i���
	SetModeEx( door , EM_SetModeType_SearchenemyIgnore, false) 
	SetModeEx( door , EM_SetModeType_Searchenemy, false)
	SetModeEx( door , EM_SetModeType_Show, false)
	AddToPartition(door,RoomID)
	SetPlot( door , "range" , "Lua_bk_wall_ran_102706" , 100 )----�g�J�d��@��
end
function Lua_bk_wall_ran_102706()
	SetPlot( TargetID()  ,"range", "" ,50 )
	sleep(10)
	BeginPlot( TargetID() , "Lua_bk_wall_102706",0 )---�}�lĲ�o���@��
end
function Lua_bk_wall_touch_102706()
	local start= ReadRoleValue(TargetID() ,EM_RoleValue_PID)
	SetPlot( TargetID()  ,"touch", "" ,40 )
	WriteRoleValue(start, EM_RoleValue_Register9,1)
	PlayMotionEX( TargetID() ,  ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP  )
end
function Lua_bk_wall_102706()
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------�}�l���ж�
	local start=OwnerID()
	local twice=0
	local gg=0
	local door={}
	local dm1=0
	local dm2=0
	local ggcount = CreateObjByFlag(113417,780470,8,1)----------------------�X�{����Ĳ�I�@��
	AddToPartition( ggcount , RoomID )
	WriteRoleValue(ggcount,EM_RoleValue_PID,start)
	SetPlot( ggcount , "touch" , "Lua_bk_wall_touch_102706" , 50 )----�g�J�����@��
	for i=1 , 7 do
		door[i] = CreateObjByFlag(104163,780470,i,1)----------------------�X�{����Ĳ�I�@��
		SetModeEx( door[i] , EM_SetModeType_Gravity, false) ---���O
		SetModeEx( door[i] , EM_SetModeType_Mark, false)
		SetModeEx( door[i] , EM_SetModeType_HideName, false)
		SetModeEx( door[i] , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( door[i] , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( door[i] , EM_SetModeType_Obstruct, false)   -----�|����(���ר�L������)
		SetModeEx( door[i] , EM_SetModeType_Strikback, false) ---����
		SetModeEx( door[i] , EM_SetModeType_Move, false) ---����	
		SetModeEx( door[i] , EM_SetModeType_Fight, false) ---�i���
		SetModeEx( door[i] , EM_SetModeType_SearchenemyIgnore, false) 
		SetModeEx( door[i] , EM_SetModeType_Searchenemy, false)
		SetModeEx( door[i] , EM_SetModeType_Show, true)
		AddToPartition( door[i] , RoomID )
	end
	ScriptMessage( OwnerID() , -1 , 2 , "[SC_102706_05]" , 1 )---------------�����Ұ�
	sleep(20)
	while 1 do 
	sleep(15)
	twice=twice+1
		gg=ReadRoleValue(OwnerID(),EM_RoleValue_Register9)
		if gg==0 then 
			if twice<=7 then 
				---PlayMotionEX( door[twice], ruFUSION_ACTORSTATE_activate_begin,ruFUSION_ACTORSTATE_activate_loop  )
				SetDefIdleMotion(door[twice],ruFUSION_MIME_ACTIVATE_LOOP)
				SetModeEx(door[twice],EM_SetModeType_Obstruct, true )--����
			end
			if twice >= 16 then 
			WriteRoleValue(OwnerID(), EM_RoleValue_Register9,2)
			end
		end
		if gg==1 then 
			ScriptMessage( OwnerID() , -1 , 2 , "[SC_102706_06]" , 1 )---------------�����Ұ�
			for j=7,1,-1 do 
				SetModeEx(door[j], EM_SetModeType_Obstruct, false )--����
				SetDefIdleMotion(door[j],ruFUSION_MIME_IDLE_STAND)
				--PlayMotionEX(door[j],ruFUSION_ACTORSTATE_activate_end,ruFUSION_ACTORSTATE_activate_loop  )
				sleep(10)
				DelObj(door[j])
			end
			sleep(20)
			break
		end
		if gg==2 then 
		ScriptMessage( OwnerID() , -1 , 2 , "[SC_102706_07]" , 1 )---------------�����Ұ�
			for j=7,1,-1 do 
				SetModeEx(door[j], EM_SetModeType_Obstruct, false )--����
				--PlayMotionEX(door[j],ruFUSION_ACTORSTATE_activate_end,ruFUSION_ACTORSTATE_activate_loop  )
				SetDefIdleMotion(door[j],ruFUSION_MIME_IDLE_STAND)
				sleep(10)
				DelObj(door[j])
			end
			dm1= CreateObjByFlag(102810,780470,10,1)----------------------�p��
			SetModeEx( dm1 , EM_SetModeType_Gravity, true) ---���O
			SetModeEx( dm1 , EM_SetModeType_Mark, true)
			SetModeEx( dm1 , EM_SetModeType_HideName, true)
			SetModeEx( dm1 , EM_SetModeType_ShowRoleHead, true)
			SetModeEx( dm1 , EM_SetModeType_NotShowHPMP, true)
			SetModeEx( dm1 , EM_SetModeType_Obstruct, false)   -----�|����(���ר�L������)
			SetModeEx( dm1 , EM_SetModeType_Strikback, true) ---����
			SetModeEx( dm1 , EM_SetModeType_Move, true) ---����	
			SetModeEx( dm1 , EM_SetModeType_Fight, true) ---�i���
			SetModeEx( dm1 , EM_SetModeType_SearchenemyIgnore, true) 
			SetModeEx( dm1 , EM_SetModeType_Searchenemy, true)
			SetModeEx( dm1 , EM_SetModeType_Show, true)
			AddToPartition(dm1 , RoomID )
			dm2= CreateObjByFlag(102810,780470,11,1)----------------------�p��
			SetModeEx( dm2 , EM_SetModeType_Gravity, true) ---���O
			SetModeEx( dm2 , EM_SetModeType_Mark, true)
			SetModeEx( dm2 , EM_SetModeType_HideName, true)
			SetModeEx( dm2 , EM_SetModeType_ShowRoleHead, true)
			SetModeEx( dm2 , EM_SetModeType_NotShowHPMP, true)
			SetModeEx( dm2 , EM_SetModeType_Obstruct, false)   -----�|����(���ר�L������)
			SetModeEx( dm2 , EM_SetModeType_Strikback, true) ---����
			SetModeEx( dm2 , EM_SetModeType_Move, true) ---����	
			SetModeEx( dm2 , EM_SetModeType_Fight, true) ---�i���
			SetModeEx( dm2 , EM_SetModeType_SearchenemyIgnore, true) 
			SetModeEx( dm2 , EM_SetModeType_Searchenemy, true)
			SetModeEx( dm2 , EM_SetModeType_Show, true)
			AddToPartition(dm2 , RoomID )
			sleep(20)
			break
		end
	end
	DelObj(OwnerID())
end
function Lua_bk_fire0_206467()
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------�}�l���ж�
	local fire=Lua_CreateObjByDir( OwnerID() , 102953 , 50 , 0) --�ѦҪ���A���ͪ�����id�A�Z�� �A���V �G 0 ���ܬO���V�ѦҪ���A180 ���ܬO�I�V�ѦҪ���
	SetModeEx( fire , EM_SetModeType_Show, true) ----�q�X
	SetModeEx( fire , EM_SetModeType_Mark, false) ----�аO
	SetModeEx( fire , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
	SetModeEx( fire , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
	SetModeEx( fire , EM_SetModeType_Strikback, false) ---����
	SetModeEx( fire , EM_SetModeType_Move, false) ---����	
	SetModeEx( fire , EM_SetModeType_Fight, false) ---�i���
	SetModeEx( fire , EM_SetModeType_SearchenemyIgnore, false) ---���󤣷|�Q�j�M
	SetModeEx( fire , EM_SetModeType_Searchenemy, false)  ---���
	AddToPartition( fire , RoomID )
	BeginPlot( fire,"Lua_bk_fire1_206467",0)
end
function Lua_bk_fire1_206467()
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------�}�l���ж�
	local x={}
	for i=1,9 do 
		if i==1 then 
			x[i]=star_CreateObj_NoAdd(OwnerID(),102953,0,0,0,RoomID,90)
			SetModeEx( x[i] , EM_SetModeType_Show, true) ----�q�X
			SetModeEx( x[i] , EM_SetModeType_Mark, false) ----�аO
			SetModeEx( x[i] , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
			SetModeEx( x[i] , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
			SetModeEx( x[i] , EM_SetModeType_Strikback, false) ---����
			SetModeEx( x[i] , EM_SetModeType_Move, false) ---����	
			SetModeEx( x[i] , EM_SetModeType_Fight, false) ---�i���
			SetModeEx( x[i] , EM_SetModeType_SearchenemyIgnore, false) ---���󤣷|�Q�j�M
			SetModeEx( x[i] , EM_SetModeType_Searchenemy, false)  ---���
			AddToPartition( x[i] , RoomID )
			AddBuff(x[i],505333,1,600)--------------��a���
			WriteRoleValue(x[i], EM_RoleValue_Livetime,5)	---------------�s�b�ɶ�livetime
		end
		if i==2 then 
			x[i]=star_CreateObj_NoAdd(OwnerID(),102953,30,0,0,RoomID,90)
			SetModeEx( x[i] , EM_SetModeType_Show, true) ----�q�X
			SetModeEx( x[i] , EM_SetModeType_Mark, false) ----�аO
			SetModeEx( x[i] , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
			SetModeEx( x[i] , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
			SetModeEx( x[i] , EM_SetModeType_Strikback, false) ---����
			SetModeEx( x[i] , EM_SetModeType_Move, false) ---����	
			SetModeEx( x[i] , EM_SetModeType_Fight, false) ---�i���
			SetModeEx( x[i] , EM_SetModeType_SearchenemyIgnore, false) ---���󤣷|�Q�j�M
			SetModeEx( x[i] , EM_SetModeType_Searchenemy, false)  ---���
			AddToPartition( x[i] , RoomID )
			AddBuff(x[i],505333,1,600)--------------��a���
			WriteRoleValue(x[i], EM_RoleValue_Livetime,5)	---------------�s�b�ɶ�livetime
		end
		if i==3 then 
			x[i]=star_CreateObj_NoAdd(OwnerID(),102953,-30,0,0,RoomID,0)
			SetModeEx( x[i] , EM_SetModeType_Show, true) ----�q�X
			SetModeEx( x[i] , EM_SetModeType_Mark, false) ----�аO
			SetModeEx( x[i] , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
			SetModeEx( x[i] , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
			SetModeEx( x[i] , EM_SetModeType_Strikback, false) ---����
			SetModeEx( x[i] , EM_SetModeType_Move, false) ---����	
			SetModeEx( x[i] , EM_SetModeType_Fight, false) ---�i���
			SetModeEx( x[i] , EM_SetModeType_SearchenemyIgnore, false) ---���󤣷|�Q�j�M
			SetModeEx( x[i] , EM_SetModeType_Searchenemy, false)  ---���
			AddToPartition( x[i] , RoomID )
			AddBuff(x[i],505333,1,600)--------------��a���
			WriteRoleValue(x[i], EM_RoleValue_Livetime,5)	---------------�s�b�ɶ�livetime
		end
		if i==4 then 
			x[i]=star_CreateObj_NoAdd(OwnerID(),102953,0,0,30,RoomID,0)
			SetModeEx( x[i] , EM_SetModeType_Show, true) ----�q�X
			SetModeEx( x[i] , EM_SetModeType_Mark, false) ----�аO
			SetModeEx( x[i] , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
			SetModeEx( x[i] , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
			SetModeEx( x[i] , EM_SetModeType_Strikback, false) ---����
			SetModeEx( x[i] , EM_SetModeType_Move, false) ---����	
			SetModeEx( x[i] , EM_SetModeType_Fight, false) ---�i���
			SetModeEx( x[i] , EM_SetModeType_SearchenemyIgnore, false) ---���󤣷|�Q�j�M
			SetModeEx( x[i] , EM_SetModeType_Searchenemy, false)  ---���
			AddToPartition( x[i] , RoomID )
			AddBuff(x[i],505333,1,600)--------------��a���
			WriteRoleValue(x[i], EM_RoleValue_Livetime,5)	---------------�s�b�ɶ�livetime
		end
		if i==5 then 
			x[i]=star_CreateObj_NoAdd(OwnerID(),102953,30,0,30,RoomID,0)
			SetModeEx( x[i] , EM_SetModeType_Show, true) ----�q�X
			SetModeEx( x[i] , EM_SetModeType_Mark, false) ----�аO
			SetModeEx( x[i] , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
			SetModeEx( x[i] , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
			SetModeEx( x[i] , EM_SetModeType_Strikback, false) ---����
			SetModeEx( x[i] , EM_SetModeType_Move, false) ---����	
			SetModeEx( x[i] , EM_SetModeType_Fight, false) ---�i���
			SetModeEx( x[i] , EM_SetModeType_SearchenemyIgnore, false) ---���󤣷|�Q�j�M
			SetModeEx( x[i] , EM_SetModeType_Searchenemy, false)  ---���
			AddToPartition( x[i] , RoomID )
			AddBuff(x[i],505333,1,600)--------------��a���
			WriteRoleValue(x[i], EM_RoleValue_Livetime,5)	---------------�s�b�ɶ�livetime
		end
		if i==6 then 
			x[i]=star_CreateObj_NoAdd(OwnerID(),102953,-30,0,30,RoomID,90)
			SetModeEx( x[i] , EM_SetModeType_Show, true) ----�q�X
			SetModeEx( x[i] , EM_SetModeType_Mark, false) ----�аO
			SetModeEx( x[i] , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
			SetModeEx( x[i] , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
			SetModeEx( x[i] , EM_SetModeType_Strikback, false) ---����
			SetModeEx( x[i] , EM_SetModeType_Move, false) ---����	
			SetModeEx( x[i] , EM_SetModeType_Fight, false) ---�i���
			SetModeEx( x[i] , EM_SetModeType_SearchenemyIgnore, false) ---���󤣷|�Q�j�M
			SetModeEx( x[i] , EM_SetModeType_Searchenemy, false)  ---���
			AddToPartition( x[i] , RoomID )
			AddBuff(x[i],505333,1,600)--------------��a���
			WriteRoleValue(x[i], EM_RoleValue_Livetime,5)	---------------�s�b�ɶ�livetime
		end
		if i==7 then 
			x[i]=star_CreateObj_NoAdd(OwnerID(),102953,0,0,-30,RoomID,90)
			SetModeEx( x[i] , EM_SetModeType_Show, true) ----�q�X
			SetModeEx( x[i] , EM_SetModeType_Mark, false) ----�аO
			SetModeEx( x[i] , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
			SetModeEx( x[i] , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
			SetModeEx( x[i] , EM_SetModeType_Strikback, false) ---����
			SetModeEx( x[i] , EM_SetModeType_Move, false) ---����	
			SetModeEx( x[i] , EM_SetModeType_Fight, false) ---�i���
			SetModeEx( x[i] , EM_SetModeType_SearchenemyIgnore, false) ---���󤣷|�Q�j�M
			SetModeEx( x[i] , EM_SetModeType_Searchenemy, false)  ---���
			AddToPartition( x[i] , RoomID )
			AddBuff(x[i],505333,1,600)--------------��a���
			WriteRoleValue(x[i], EM_RoleValue_Livetime,5)	---------------�s�b�ɶ�livetime
		end
		if i==8 then 
			x[i]=star_CreateObj_NoAdd(OwnerID(),102953,30,0,-30,RoomID,90)
			SetModeEx( x[i] , EM_SetModeType_Show, true) ----�q�X
			SetModeEx( x[i] , EM_SetModeType_Mark, false) ----�аO
			SetModeEx( x[i] , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
			SetModeEx( x[i] , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
			SetModeEx( x[i] , EM_SetModeType_Strikback, false) ---����
			SetModeEx( x[i] , EM_SetModeType_Move, false) ---����	
			SetModeEx( x[i] , EM_SetModeType_Fight, false) ---�i���
			SetModeEx( x[i] , EM_SetModeType_SearchenemyIgnore, false) ---���󤣷|�Q�j�M
			SetModeEx( x[i] , EM_SetModeType_Searchenemy, false)  ---���
			AddToPartition( x[i] , RoomID )
			AddBuff(x[i],505333,1,600)--------------��a���
			WriteRoleValue(x[i], EM_RoleValue_Livetime,5)	---------------�s�b�ɶ�livetime
		end
		if i==9 then 
			x[i]=star_CreateObj_NoAdd(OwnerID(),102953,-30,0,-30,RoomID,90)
			SetModeEx( x[i] , EM_SetModeType_Show, true) ----�q�X
			SetModeEx( x[i] , EM_SetModeType_Mark, false) ----�аO
			SetModeEx( x[i] , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
			SetModeEx( x[i] , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
			SetModeEx( x[i] , EM_SetModeType_Strikback, false) ---����
			SetModeEx( x[i] , EM_SetModeType_Move, false) ---����	
			SetModeEx( x[i] , EM_SetModeType_Fight, false) ---�i���
			SetModeEx( x[i] , EM_SetModeType_SearchenemyIgnore, false) ---���󤣷|�Q�j�M
			SetModeEx( x[i] , EM_SetModeType_Searchenemy, false)  ---���
			AddToPartition( x[i] , RoomID )
			AddBuff(x[i],505333,1,600)--------------��a���
			WriteRoleValue(x[i], EM_RoleValue_Livetime,5)	---------------�s�b�ɶ�livetime
		end
	end	
end
function Lua_bk_hand_102686()
	SetDefIdleMotion( OwnerID(),ruFUSION_MIME_CRAFTING_LOOP)---����˦b�a�W�ʧ@-------------�ä㪺�ʧ@ 
	sleep(40)
	SetDefIdleMotion( OwnerID(),ruFUSION_MIME_IDLE_STAND)
end
function Lua_cang_speak_102686()
	SetDefIdleMotion( OwnerID(),ruFUSION_MIME_EMOTE_SPEAK)
	sleep(100)
	SetDefIdleMotion( OwnerID(),ruFUSION_MIME_IDLE_STAND)
end
----------102948  ���Ϊ��Ǫ�
----------102949  �{�X�Ӫ����Ϊ��Ǫ�
function Lua_bk_fire_ch_206467()
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------�}�l���ж�
	if ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 102948 then ----------102949  ���Ϊ��Ǫ�
		AddBuff( TargetID(), 504838 , 0 , -1)---------------����buff	
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_102706_08]" , 1 )
		CancelBuff( TargetID() , 505370 )
		SetModeEx( TargetID() , EM_SetModeType_HideName, true)
		SetModeEx( TargetID() , EM_SetModeType_Mark, true) ----�аO
	end
end
function Lua_bk_fire_505333()
	if ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 102953 or 
		ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 113379 or 
		ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 113336 or ----------102949  ���Ϊ��Ǫ�
		ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 114295 or
		ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 114296 or
		ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 113721 or
		ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 102680 or
		ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 104162 or
		ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 113720 then
		return false
	else
		return true
	end
end

function Lua_bk_chan_505338()-------------------�@���Ǫ�
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------�}�l���ж�
	if ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 102952 then ----------102949  ���Ϊ��Ǫ�
		local x=star_CreateObj_NoAdd(TargetID(),114123,0,0,0,RoomID,0)
		AddToPartition( x , RoomID )
		BeginPlot( x , "Lua_bk_chnpc_1_114123",0)----�����ܦ�����npc ���L���q
		DelObj(TargetID())
	else 
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_102706_13]" , 1 )
	end
	
end
function Lua_bk_chnpc_1_114123()
--	if	CountBodyItem(OwnerID(),206467)>0	then
--		SetSpeakDetail(OwnerID(),"[SC_102706_12]")
---	else
	if CheckBuff( OwnerID() , 505358) then 
		SetSpeakDetail(OwnerID(),"[SC_102706_09]")
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_102706_10]","Lua_bk_chnpc_2_114123", 0 )
	end
---	end
end


function Lua_bk_chnpc_2_114123()
	closespeak(OwnerID())
	GiveBodyItem(OwnerID(),206467,1)
	DisableQuest(TargetID(),true)
	if ReadRoleValue(TargetID(), EM_RoleValue_PID) ~=5 then 
		WriteRoleValue(TargetID(), EM_RoleValue_Livetime,5)
		say( TargetID(),"[SC_102706_11]")
		SetDelayPatrolTime( OwnerID(), 0 )--------------------------��npc�]�w�ɶ��]�w  ��0
		WriteRoleValue(TargetID(), EM_RoleValue_PID,5)	
		---DW_MoveToFlag(TargetID(),780000,1,0,1)
	end
end
function Lua_bk_lowdm_102948()
	while 1 do	
	AddBuff( OwnerID() , 501055 , 1 , 3600 ) 
	AddBuff( OwnerID(), 505370 , 0 , -1)---------------���C�ˮ`
	SetModeEx( OwnerID() , EM_SetModeType_HideName, false)
	SetModeEx( OwnerID() , EM_SetModeType_Mark, false) ----�аO	
		for i = 0 , 30 do	
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
			sleep(10)			 	
			if ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then					
				sleep(150)				
			end				
		end
	end
end
function lua_bk_505376_TransferDM()	--------�]��Ĳ�o�k�N���Q����Ĳ�o�u�����z�����~��Ĳ�o�A�ҥH��ΨC���ͪk�N�Ӱ�( 504034�s�򲣥ͥ� )
	local LastDamage = ReadRoleValue( OwnerID() , EM_RoleValue_LastDHp )	-------�̫�@���Q�ˮ`��( �o�ӭȨä��|�ۤv�M�� )
	local LastTemp = 0														-------�Ȧs�e�@�����̫�Q�ˮ`��
	if ReadRoleValue( OwnerID() , EM_RoleValue_register5 ) == 0 then  		-------register5�ΨӧP�_�O�����Q�ˮ`���٬O�e�@����
		WriteRoleValue( OwnerID() , EM_RoleValue_register5 , 1 )
		WriteRoleValue( OwnerID() , EM_RoleValue_register6 , LastDamage )	-------register6�s����Q�ˮ`��
		LastTemp = ReadRoleValue( OwnerID() , EM_RoleValue_register7 )
	elseif ReadRoleValue( OwnerID() , EM_RoleValue_register5 ) == 1 then
		WriteRoleValue( OwnerID() , EM_RoleValue_register5 , 0 )
		WriteRoleValue( OwnerID() , EM_RoleValue_register7 , LastDamage )	-------register7�s��e�@���Q�ˮ`��
		LastTemp = ReadRoleValue( OwnerID() , EM_RoleValue_register6 )
	end		 
	local TransDamage = LastDamage*1										--------�ಾ���a���������ˮ`���
	local TD = math.floor(abs(TransDamage))	
	-----local BeControlled = ReadRoleValue( OwnerID() , EM_RoleValue_register1 )
	if LastDamage ~= LastTemp then
		SysCastSpellLV(OwnerID() , OwnerID() , 494730 , TD )
	end	
end
function Lua_bk_120_206467()------------------------�ˬd�ؼ�  
	if ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID) == 120 then
		return true
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_CANTHOME]" , 1 )	
		return false
	end	
end
