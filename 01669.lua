function Lua_apon_120_PAT1()

	local dis = 15
	local count = 5 --�}�C���j�p�A��J3 �|�O 3*3 ���}�C�F���L�]����ƥ������_�ơA�ҥH��J 4 �|�O 5*4 ���}�C�C
	local checktime = 10 --�P�_���ɶ����Z�A�ƭȷU�C�A�P�_���W�v�U���A�U�۵M�A���Ӫ��귽�]�U�h
	local ReviveTime = 600000  --��}�C����������������ɡA�i��}�C���m���ʧ@�A�p�G�� -1 �A�N�|���� OwnerID() �]�w�����ͮɶ����m
	local circle = 6000  --�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	
	local SkillRND =  Rand( 100 )+1	-- ���Ͷü�
	if SkillRND <= 100 and SkillRND > 80 then
		checktime = checktime + 1
	elseif SkillRND <= 80 and SkillRND > 60 then
		checktime = checktime + 2		
	elseif SkillRND <= 60 and SkillRND > 40 then
		checktime = checktime + 3
	elseif SkillRND <= 40 and SkillRND > 20 then
		checktime = checktime + 4
	elseif SkillRND <= 20 and SkillRND > 0 then
		checktime = checktime + 5
	end	
	
	local ObjMatrix ={}
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(102688,Matrix,1,0)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(102689,Matrix,2,-1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(102689,Matrix,2,1)

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_apon_120_PAT2" , 0 )
end

function Lua_apon_120_PAT2()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_apon_120_PAT1" , 0 )
end
-------�e�P�v�M��
----------�i�H�Q����A���O���|�h���H�A�C���@�ӥe�P�v�A�h�������������y�h�|��֦�q�A����e�P�v�����A�����y�~�|����
function Lua_bk_gg_touch_1_102966()
	ScriptMessage( TargetID() , -1 , 2 , "[SC_102706_16]" , 1 )---------------�����Ұ�
	BeginPlot(TargetID(),"Lua_bk_gg_touch_2_102966",10)
end
function Lua_bk_gg_touch_2_102966()
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------�}�l���ж�
	local boss=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local door1=ReadRoleValue(boss,EM_RoleValue_Register4)
	local door2=ReadRoleValue(boss,EM_RoleValue_Register5)
	local ga=0
----	PlayMotionEX( door1,ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP )
	SetDefIdleMotion( door1,ruFUSION_MIME_ACTIVATE_LOOP)
	SetModeEx(door1,EM_SetModeType_Obstruct, true )--����
----	PlayMotionEX( door2,ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP )
	SetDefIdleMotion( door2,ruFUSION_MIME_ACTIVATE_LOOP)
	SetModeEx(door2,EM_SetModeType_Obstruct, true )--����
	local ggm1 = CreateObjByFlag( 102934 , 780363 , 1 , 1 ) 
	SetModeEx( ggm1 , EM_SetModeType_Show, true) ----�q�X
	SetModeEx( ggm1 , EM_SetModeType_Mark, true) ----�аO
	SetModeEx( ggm1 , EM_SetModeType_Strikback, false) ---����
	SetModeEx( ggm1 , EM_SetModeType_Move, false) ---����	
	SetModeEx( ggm1 , EM_SetModeType_Fight, false) ---�i���
	SetModeEx( ggm1 , EM_SetModeType_Searchenemy, false)  ---����
	AddToPartition( ggm1,RoomID)
	WriteRoleValue(ggm1,EM_RoleValue_PID,OwnerID())
	BeginPlot(ggm1,"Lua_bk_120_102970",50)
	local PPL = SetSearchAllPlayer(RoomID)
	local Flag = 1
	for i = 1 , PPL , 1 do ---�⪱�a��J�ж��� 
		local ID = GetSearchResult()
		if ReadRoleValue( ID , EM_RoleValue_IsDead ) ~= 1 and ReadRoleValue( ID, EM_RoleValue_VOC) ~= 0  and ReadRoleValue( ID , EM_RoleValue_RoomID  ) == RoomID then
			AddBuff( ID , 505456 ,0,-1)
			SetPosByFlag( ID , 780428 , Flag ) 
			Flag = Flag + 1
			if Flag > GetMoveFlagCount(780428) -1 then
				Flag = 1
			end
		end
	end
	
	CastSpellLV( ggm1 , ggm1 , 494734 , 0 )
	sleep(30)
	--local ggm2 = CreateObjByFlag( 102970 , 780363 , 10 , 1 ) 
--	SetModeEx( ggm2 , EM_SetModeType_Show, true) ----�q�X
---	SetModeEx( ggm2 , EM_SetModeType_Mark, true) ----�аO
	---SetModeEx( ggm2 , EM_SetModeType_Strikback, true) ---����
	---SetModeEx( ggm2 , EM_SetModeType_Move, true) ---����	
---	SetModeEx( ggm2 , EM_SetModeType_Fight, true) ---�i���
	---SetModeEx( ggm2 , EM_SetModeType_Searchenemy, true)  ---����
	--AddToPartition( ggm2,RoomID)	
	---WriteRoleValue(ggm2,EM_RoleValue_PID,OwnerID())
	---BeginPlot(ggm2,"Lua_bk_120_102970",50)
	while 1 do 
	sleep(10)
		ga=ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
		if ga==0 then 
		elseif ga==1 then 	
		SetModeEx(door1, EM_SetModeType_Obstruct, false )--����
	---	PlayMotionEX(door1,ruFUSION_ACTORSTATE_activate_end,ruFUSION_ACTORSTATE_activate_loop)
		SetDefIdleMotion(door1,ruFUSION_MIME_IDLE_STAND)
		SetModeEx(door2, EM_SetModeType_Obstruct, false )--����
	---	PlayMotionEX(door2,ruFUSION_ACTORSTATE_activate_end,ruFUSION_ACTORSTATE_activate_loop)
		SetDefIdleMotion(door2,ruFUSION_MIME_IDLE_STAND)
		DelObj(ggm1)
	---DelObj(ggm2)
		WriteRoleValue(OwnerID(),EM_RoleValue_Register1,0)	
		----WriteRoleValue(boss,EM_RoleValue_Register6,1)
		break
		end
	end
end

function Lua_bk_gg_touch_102966()
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------�}�l���ж�
	local boss=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local door1=ReadRoleValue(boss,EM_RoleValue_Register4)
	local door2=ReadRoleValue(boss,EM_RoleValue_Register5)
	local ga=0
----	PlayMotionEX( door1,ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP )
	SetDefIdleMotion( door1,ruFUSION_MIME_ACTIVATE_LOOP)
	SetModeEx(door1,EM_SetModeType_Obstruct, true )--����
---	PlayMotionEX( door1,ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP )
	SetDefIdleMotion( door2,ruFUSION_MIME_ACTIVATE_LOOP)
	SetModeEx(door2,EM_SetModeType_Obstruct, true )--����
	--local PPL = SetSearchAllPlayer(RoomID)
---	local Flag = 1
--	for i = 1 , PPL , 1 do ---�⪱�a��J�ж��� 
	--	local ID = GetSearchResult()
--		if ReadRoleValue( ID , EM_RoleValue_IsDead ) ~= 1 and ReadRoleValue( ID, EM_RoleValue_VOC) ~= 0  and ReadRoleValue( ID , EM_RoleValue_RoomID  ) == RoomID then
	--		SetPosByFlag( ID , 780428 , Flag ) 
	---		Flag = Flag + 1
	---		if Flag > GetMoveFlagCount(780428) -1 then
	---			Flag = 1
	---		end
	--	end
	---end
	local ggm1 = CreateObjByFlag( 102934 , 780363 , 1 , 1 ) 
	SetModeEx( ggm1 , EM_SetModeType_Show, true) ----�q�X
	SetModeEx( ggm1 , EM_SetModeType_Mark, true) ----�аO
	SetModeEx( ggm1 , EM_SetModeType_Strikback, false) ---����
	SetModeEx( ggm1 , EM_SetModeType_Move, false) ---����	
	SetModeEx( ggm1 , EM_SetModeType_Fight, false) ---�i���
	SetModeEx( ggm1 , EM_SetModeType_Searchenemy, false)  ---����
	AddToPartition( ggm1,RoomID)
	WriteRoleValue(ggm1,EM_RoleValue_PID,OwnerID())
	BeginPlot(ggm1,"Lua_bk_120_102970",30)
	sleep(20)
	CastSpellLV( ggm1 , ggm1 , 494734 , 0 )
	sleep(30)
--	local ggm2 = CreateObjByFlag( 102970 , 780363 , 10 , 1 ) 
--	SetModeEx( ggm2 , EM_SetModeType_Show, true) ----�q�X
---	SetModeEx( ggm2 , EM_SetModeType_Mark, true) ----�аO
--	SetModeEx( ggm2 , EM_SetModeType_Strikback, true) ---����
--	SetModeEx( ggm2 , EM_SetModeType_Move, true) ---����	
--	SetModeEx( ggm2 , EM_SetModeType_Fight, true) ---�i���
--	SetModeEx( ggm2 , EM_SetModeType_Searchenemy, true)  ---����
	--AddToPartition( ggm2,RoomID)	
--	WriteRoleValue(ggm2,EM_RoleValue_PID,OwnerID())
--	BeginPlot(ggm2,"Lua_bk_120_102970",50)
	while 1 do 
	sleep(10)
		ga=ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
		if ga==0 then 
		
		elseif ga==1 then 	
		SetModeEx(door1, EM_SetModeType_Obstruct, false )--����
	---	PlayMotionEX(door1,ruFUSION_ACTORSTATE_activate_end,ruFUSION_ACTORSTATE_activate_loop)
		SetDefIdleMotion(door1,ruFUSION_MIME_IDLE_STAND)
		SetModeEx(door2, EM_SetModeType_Obstruct, false )--����
		----PlayMotionEX(door2,ruFUSION_ACTORSTATE_activate_end,ruFUSION_ACTORSTATE_activate_loop)
		SetDefIdleMotion(door2,ruFUSION_MIME_IDLE_STAND)
		DelObj(ggm1)
	---	DelObj(ggm2)
		WriteRoleValue(OwnerID(),EM_RoleValue_Register1,0)	
		WriteRoleValue(boss,EM_RoleValue_Register6,1)
		break
		end
	end
end

function Lua_bk_120_102970()
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------�}�l���ж�
	local thgg=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local gg=0
	---while 1 do 
	---sleep(10)
	--	gg=ReadRoleValue(thgg,EM_RoleValue_Register1)
	--	if HateListCount(OwnerID()) ~= 0 then
		---elseif HateListCount(OwnerID()) == 0 then 	
		--	gg=gg+1
	WriteRoleValue(thgg,EM_RoleValue_Register1,1)	
		---	sleep(50)
		---	DelObj(OwnerID())
	-----	end	
---	end
end
function Lua_apon_Zone120_102966_dead()
	local Boss = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
	local dead = ReadRoleValue(BOSS,EM_RoleValue_Register2)
	dead=dead+1
	WriteRoleValue( Boss, EM_RoleValue_Register2, dead)
end
function Lua_apon_Zone120_102966()
	SetModeEx( OwnerID() , EM_SetModeType_Show, true) ----�q�X
	SetModeEx( OwnerID() , EM_SetModeType_Mark, true) ----�аO
	SetModeEx( OwnerID() , EM_SetModeType_Strikback, false) ---����
	SetModeEx( OwnerID() , EM_SetModeType_Move, false) ---����	
	SetModeEx( OwnerID() , EM_SetModeType_Fight, false) ---�i���
	SetModeEx( OwnerID() , EM_SetModeType_Searchenemy, true)  ---����
	local Mob_all={}
	local ma={}
	local ga=0
	local gx=0
	local ggs=0
	local SP_mob = 1
	local SP_check = 1
	local ch=0
	local dead=0
	local bx=0
	local Flag_mob = 780363
	local ID_Mob_1 = 102963
	local ID_Mob_2 = 102965
	local Mob_2_flag = 2
	local counter1 = 0
	local counter2 = 0
	local counter3 = 0
	local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )	
	local thgg=CreateObjByFlag( 102966 , Flag_mob , 7 , 1 )
		SetModeEx( thgg , EM_SetModeType_Show, false) ----�q�X
		SetModeEx( thgg , EM_SetModeType_Mark, false) ----�аO
		SetModeEx( thgg , EM_SetModeType_Strikback, false) ---����
		SetModeEx( thgg , EM_SetModeType_Move, false) ---����	
		SetModeEx( thgg , EM_SetModeType_Fight, false) ---�i���
		SetModeEx( thgg , EM_SetModeType_Searchenemy, false)  ---����
		AddToPartition( thgg,roomid1 )
		WriteRoleValue(thgg,EM_RoleValue_PID,OwnerID())
		SetPlot( thgg , "range" , "Lua_bk_gg_touch_1_102966" , 150 )----�g�J�����@��
	local door1 = CreateObjByFlag(102959,780363,8,1)----------------------�X�{����Ĳ�I�@��
		SetModeEx( door1 , EM_SetModeType_Gravity, false) ---���O
		SetModeEx( door1 , EM_SetModeType_Mark, false)
		SetModeEx( door1 , EM_SetModeType_HideName, false)
		SetModeEx( door1 , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( door1 , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( door1 , EM_SetModeType_Obstruct, false)   -----�|����(���ר�L������)
		SetModeEx( door1 , EM_SetModeType_Strikback, false) ---����
		SetModeEx( door1 , EM_SetModeType_Move, false) ---����	
		SetModeEx( door1 , EM_SetModeType_Fight, false) ---�i���
		SetModeEx( door1 , EM_SetModeType_SearchenemyIgnore, false) 
		SetModeEx( door1 , EM_SetModeType_Searchenemy, false)
		SetModeEx( door1 , EM_SetModeType_Show, true)
		AddToPartition( door1 , roomid1 )
		WriteRoleValue(door1,EM_RoleValue_PID,OwnerID())
		WriteRoleValue( OwnerID(), EM_RoleValue_Register4, door1)		
	local door2 = CreateObjByFlag(102959,780363,9,1)----------------------�X�{����Ĳ�I�@��
		SetModeEx(door2 , EM_SetModeType_Gravity, false) ---���O
		SetModeEx( door2 , EM_SetModeType_Mark, false)
		SetModeEx( door2 , EM_SetModeType_HideName, false)
		SetModeEx( door2 , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( door2 , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( door2 , EM_SetModeType_Obstruct, false)   -----�|����(���ר�L������)
		SetModeEx( door2 , EM_SetModeType_Strikback, false) ---����
		SetModeEx( door2 , EM_SetModeType_Move, false) ---����	
		SetModeEx( door2 , EM_SetModeType_Fight, false) ---�i���
		SetModeEx( door2 , EM_SetModeType_SearchenemyIgnore, false) 
		SetModeEx( door2 , EM_SetModeType_Searchenemy, false)
		SetModeEx( door2 , EM_SetModeType_Show, true)
		AddToPartition( door2 , roomid1 )
		WriteRoleValue(door2,EM_RoleValue_PID,OwnerID())
		WriteRoleValue( OwnerID(), EM_RoleValue_Register5, door2)		
	while 1 do 
	sleep(20)
		gg= ReadRoleValue(OwnerID(),EM_RoleValue_Register3)
		if gg==0 then 
			local no1 = CreateObjByFlag( ID_Mob_1 , Flag_mob , 1 , 1 ) 
			SetModeEx( no1 , EM_SetModeType_Show, true) ----�q�X
			SetModeEx( no1 , EM_SetModeType_Mark, true) ----�аO
			SetModeEx( no1 , EM_SetModeType_Strikback, true) ---����
			SetModeEx( no1 , EM_SetModeType_Move, false) ---����	
			SetModeEx( no1 , EM_SetModeType_Fight, true) ---�i���
			SetModeEx( no1 , EM_SetModeType_Searchenemy, true)  ---����
			AddToPartition( no1,roomid1 )
			BeginPlot(no1,"Lua_bk_120_505404",0)
			SetPlot( no1 , "dead" , "Lua_apon_Zone120_102966_dead" ,0)
			WriteRoleValue( no1, EM_RoleValue_Register1, OwnerID())	
			table.insert( Mob_all , no1 )
			local no11 = CreateObjByFlag( 102935 ,Flag_mob, 1 , 1 ) 
			SetModeEx( no11 , EM_SetModeType_Show, true) ----�q�X
			SetModeEx( no11 , EM_SetModeType_Mark, false) ----�аO
			SetModeEx( no11 , EM_SetModeType_Strikback, false) ---����
			SetModeEx( no11 , EM_SetModeType_Move, false) ---����	
			SetModeEx( no11 , EM_SetModeType_Fight, false) ---�i���
			SetModeEx( no11 , EM_SetModeType_Searchenemy, false)  ---����
			AddToPartition( no11,roomid1 )	
			AddBuff(no11,505398,0,-1)-------------------�k�N�S��		
			table.insert( ma , no11 )			
			local no2 = CreateObjByFlag( ID_Mob_1 , Flag_mob , 2 , 1 ) 
			SetModeEx( no2 , EM_SetModeType_Show, true) ----�q�X
			SetModeEx( no2 , EM_SetModeType_Mark, true) ----�аO
			SetModeEx( no2 , EM_SetModeType_Strikback, true) ---����
			SetModeEx( no2 , EM_SetModeType_Move, false) ---����	
			SetModeEx( no2 , EM_SetModeType_Fight, true) ---�i���
			SetModeEx( no2 , EM_SetModeType_Searchenemy, true)  ---����
			AddToPartition( no2,roomid1 )
			BeginPlot(no2,"Lua_bk_120_505405",0)
			SetPlot( no2 , "dead" , "Lua_apon_Zone120_102966_dead" ,0)
			WriteRoleValue( no2, EM_RoleValue_Register1, OwnerID())	
			table.insert( Mob_all , no2 )
			local no22 = CreateObjByFlag( 102935 , Flag_mob , 2 , 1 ) 
			SetModeEx( no22 , EM_SetModeType_Show, true) ----�q�X
			SetModeEx( no22 , EM_SetModeType_Mark, false) ----�аO
			SetModeEx( no22 , EM_SetModeType_Strikback, false) ---����
			SetModeEx( no22 , EM_SetModeType_Move, false) ---����	
			SetModeEx( no22 , EM_SetModeType_Fight, false) ---�i���
			SetModeEx( no22 , EM_SetModeType_Searchenemy, false)  ---����
			AddToPartition( no22,roomid1 )	
			AddBuff(no22,505399,0,-1)-------------------�k�N�S��	
			table.insert( ma , no22 )
			local no3 = CreateObjByFlag( ID_Mob_1 , Flag_mob , 3 , 1 ) 
			SetModeEx( no3 , EM_SetModeType_Show, true) ----�q�X
			SetModeEx( no3 , EM_SetModeType_Mark, true) ----�аO
			SetModeEx( no3 , EM_SetModeType_Strikback, true) ---����
			SetModeEx( no3 , EM_SetModeType_Move, false) ---����	
			SetModeEx( no3 , EM_SetModeType_Fight, true) ---�i���
			SetModeEx( no3 , EM_SetModeType_Searchenemy, true)  ---����
			AddToPartition( no3,roomid1 )
			BeginPlot(no3,"Lua_bk_120_505406",0)
			SetPlot( no3 , "dead" , "Lua_apon_Zone120_102966_dead" ,0)
			WriteRoleValue( no3, EM_RoleValue_Register1, OwnerID())	
			table.insert( Mob_all , no3 )
			local no33 = CreateObjByFlag( 102935 , Flag_mob , 3 , 1 ) 
			SetModeEx( no33 , EM_SetModeType_Show, true) ----�q�X
			SetModeEx( no33 , EM_SetModeType_Mark, false) ----�аO
			SetModeEx( no33 , EM_SetModeType_Strikback, false) ---����
			SetModeEx( no33 , EM_SetModeType_Move, false) ---����	
			SetModeEx( no33 , EM_SetModeType_Fight, false) ---�i���
			SetModeEx( no33 , EM_SetModeType_Searchenemy, false)  ---����
			AddToPartition( no33,roomid1 )	
			AddBuff(no33,505400,0,-1)-------------------�k�N�S��	
			table.insert( ma , no33 )
			local no4 = CreateObjByFlag( ID_Mob_2 , Flag_mob , 4 , 1 ) 
			SetModeEx( no4 , EM_SetModeType_Show, true) ----�q�X
			SetModeEx( no4 , EM_SetModeType_Mark, true) ----�аO
			SetModeEx( no4 , EM_SetModeType_Strikback, true) ---����
			SetModeEx( no4 , EM_SetModeType_Move, false) ---����	
			SetModeEx( no4 , EM_SetModeType_Fight, true) ---�i���
			SetModeEx( no4 , EM_SetModeType_Searchenemy, true)  ---����
			AddToPartition( no4,roomid1 )
			BeginPlot(no4,"Lua_bk_120_505408",0)
			SetPlot( no4 , "dead" , "Lua_apon_Zone120_102966_dead" ,0)
			WriteRoleValue( no4, EM_RoleValue_Register1, OwnerID())	
			table.insert( Mob_all , no4 )
			local no44 = CreateObjByFlag( 102935 , Flag_mob , 4 , 1 ) 
			SetModeEx( no44 , EM_SetModeType_Show, true) ----�q�X
			SetModeEx( no44 , EM_SetModeType_Mark, false) ----�аO
			SetModeEx( no44 , EM_SetModeType_Strikback, false) ---����
			SetModeEx( no44, EM_SetModeType_Move, false) ---����	
			SetModeEx( no44 , EM_SetModeType_Fight, false) ---�i���
			SetModeEx( no44 , EM_SetModeType_Searchenemy, false)  ---����
			AddToPartition( no44,roomid1 )	
			AddBuff(no44,505401,0,-1)-------------------�k�N�S��	
			table.insert( ma , no44 )
			local no5 = CreateObjByFlag( ID_Mob_2 , Flag_mob , 5 , 1 ) 
			SetModeEx( no5 , EM_SetModeType_Show, true) ----�q�X
			SetModeEx( no5 , EM_SetModeType_Mark, true) ----�аO
			SetModeEx( no5 , EM_SetModeType_Strikback, true) ---����
			SetModeEx( no5 , EM_SetModeType_Move, false) ---����	
			SetModeEx( no5 , EM_SetModeType_Fight, true) ---�i���
			SetModeEx( no5 , EM_SetModeType_Searchenemy, true)  ---����
			AddToPartition( no5,roomid1 )
			BeginPlot(no5,"Lua_bk_120_505409",0)
			SetPlot( no5 , "dead" , "Lua_apon_Zone120_102966_dead" ,0)
			WriteRoleValue( no5, EM_RoleValue_Register1, OwnerID())	
			table.insert( Mob_all , no5 )
			local no55 = CreateObjByFlag( 102935 , Flag_mob , 5 , 1 ) 
			SetModeEx( no55 , EM_SetModeType_Show, true) ----�q�X
			SetModeEx( no55 , EM_SetModeType_Mark, false) ----�аO
			SetModeEx( no55 , EM_SetModeType_Strikback, false) ---����
			SetModeEx( no55 , EM_SetModeType_Move, false) ---����	
			SetModeEx( no55 , EM_SetModeType_Fight, false) ---�i���
			SetModeEx( no55 , EM_SetModeType_Searchenemy, false)  ---����
			AddToPartition( no55,roomid1 )	
			AddBuff(no55,505402,0,-1)-------------------�k�N�S��	
			table.insert( ma , no55 )
			local no6 = CreateObjByFlag( ID_Mob_2 , Flag_mob , 6 , 1 ) 
			SetModeEx( no6 , EM_SetModeType_Show, true) ----�q�X
			SetModeEx( no6 , EM_SetModeType_Mark, true) ----�аO
			SetModeEx( no6 , EM_SetModeType_Strikback, true) ---����
			SetModeEx( no6 , EM_SetModeType_Move, false) ---����	
			SetModeEx( no6 , EM_SetModeType_Fight, true) ---�i���
			SetModeEx( no6 , EM_SetModeType_Searchenemy, true)  ---����
			AddToPartition( no6,roomid1 )
			BeginPlot(no6,"Lua_bk_120_505410",0)
			SetPlot( no6 , "dead" , "Lua_apon_Zone120_102966_dead" ,0)
			WriteRoleValue( no6, EM_RoleValue_Register1, OwnerID())	
			table.insert( Mob_all , no6 )
			local no66 = CreateObjByFlag( 102935 , Flag_mob , 6 , 1 ) 
			SetModeEx( no66 , EM_SetModeType_Show, true) ----�q�X
			SetModeEx( no66 , EM_SetModeType_Mark, false) ----�аO
			SetModeEx( no66 , EM_SetModeType_Strikback, false) ---����
			SetModeEx( no66 , EM_SetModeType_Move, false) ---����	
			SetModeEx( no66 , EM_SetModeType_Fight, false) ---�i���
			SetModeEx( no66 , EM_SetModeType_Searchenemy, false)  ---����
			AddToPartition( no66,roomid1 )	
			AddBuff(no66,505403,0,-1)-------------------�k�N�S��	
			table.insert( ma , no66 )
			while 1 do 
				sleep(10)
				dead = ReadRoleValue(OwnerID(),EM_RoleValue_Register2)
			---	say(ownerid(),"dead"..dead)
				if dead<= 5 then 
					bx=BuffCount(OwnerID())
				---	say(ownerid(),"bx"..bx)
					if bx<=5 then 
				---		say(ownerid(),"ch"..ch)
						ch=ch+1
						if ch==3 then 
							ScriptMessage( OwnerID() , -1 , 2 , "[SC_102706_14]" , 1 )---------------�����Ұ�
						end
						if ch>=8 then 
							if gx==0 then 
								ScriptMessage( OwnerID() , -1 , 2 , "[SC_102706_15]" , 1 )---------------�����Ұ�
								CastSpellLV( OwnerID() , OwnerID() , 494734 , 0 )
								BeginPlot(thgg,"Lua_bk_gg_touch_102966",0)
								---WriteRoleValue(OwnerID(), EM_RoleValue_Register6,1)
								gx=1
							end
							ggs=ReadRoleValue(OwnerID(),EM_RoleValue_Register6)
							if ggs==1 then 
								for i = 1 , table.getn(Mob_all), 1 do
									if Mob_all[i] ~= nil and CheckID(Mob_all[i] ) == true then ----�N�쥻���e�P�v�R��
										Delobj(Mob_all[i])
									end	
								end
								for i = 1 , table.getn(ma), 1 do
									if ma[i] ~= nil and CheckID(ma[i] ) == true then ----�R���a�W�v��
										Delobj(ma[i])
									end	
								end
								sleep(30)
								----WriteRoleValue(thgg,EM_RoleValue_Register1,0)	
								WriteRoleValue(OwnerID(), EM_RoleValue_Register2,0)
								WriteRoleValue(OwnerID(), EM_RoleValue_Register6,0)
								ch=0
								gx=0
								break
							end
						end
					elseif bx>=6 then 
						ch=0
						for j=1,bx do
							bi=BuffInfo(OwnerID(),j,EM_BuffInfoType_BuffID)
							if CheckBuff(OwnerID(), 505404)==true and 
								CheckBuff(OwnerID(), 505405)==true and 
								CheckBuff(OwnerID(), 505406)==true and 
								CheckBuff(OwnerID(), 505408)==true and
								CheckBuff(OwnerID(), 505409)==true and 
								CheckBuff(OwnerID(), 505410)==true then			
								sleep(50)-----5���A�ˬd�@��
							end
						end
					end
					
				elseif dead==6 then 
				ch=0
				WriteRoleValue( OwnerID(), EM_RoleValue_Register3, 1)	
					break
					-------���������F
				end
			end
		elseif gg==1 then 
		ScriptMessage( TargetID() , -1 , 2 , "[SC_102706_17]" , 1 )---------------�����Ұ�
		sleep(20)
		SetModeEx(door1, EM_SetModeType_Obstruct, false )--����
		PlayMotionEX(door1,ruFUSION_ACTORSTATE_activate_end,ruFUSION_ACTORSTATE_activate_loop  )
		----SetDefIdleMotion(door1,ruFUSION_MIME_ACTIVATE_END,ruFUSION_MIME_ACTIVATE_LOOP)
		SetModeEx(door2, EM_SetModeType_Obstruct, false )--����
		PlayMotionEX(door2,ruFUSION_ACTORSTATE_activate_end,ruFUSION_ACTORSTATE_activate_loop  )
	-------	SetDefIdleMotion(door2,ruFUSION_MIME_ACTIVATE_END,ruFUSION_MIME_ACTIVATE_LOOP)
		DelObj(thgg)
		break
		end
	end
end

function Lua_bk_120_ch_505407()
	if CheckBuff(OwnerID(), 505404)==true then
		local npcpl = SearchRangeNPC (OwnerID(),100)
		local y=table.getn(npcpl)-----���X�Ӫ��O�ƶq
		for i=0 , y ,1 do 
			if ReadRoleValue( npcpl[i] , EM_RoleValue_OrgID ) == 102966 then
				AddBuff( npcpl[i] , 505404 ,0, -1)
			end
		end
	elseif CheckBuff(OwnerID(), 505405)==true then
		local npcpl = SearchRangeNPC (OwnerID(),100)
		local y=table.getn(npcpl)-----���X�Ӫ��O�ƶq
		for i=0 , y ,1 do 
			if ReadRoleValue( npcpl[i] , EM_RoleValue_OrgID ) == 102966 then
				AddBuff( npcpl[i] , 505405 ,0,-1)
			end
		end
	elseif CheckBuff(OwnerID(), 505406)==true then
		local npcpl = SearchRangeNPC (OwnerID(),100)
		local y=table.getn(npcpl)-----���X�Ӫ��O�ƶq
		for i=0 , y ,1 do 
			if ReadRoleValue( npcpl[i] , EM_RoleValue_OrgID ) == 102966 then
				AddBuff( npcpl[i] , 505406 ,0,-1)
			end
		end
	elseif CheckBuff(OwnerID(), 505408)==true then
		local npcpl = SearchRangeNPC (OwnerID(),100)
		local y=table.getn(npcpl)-----���X�Ӫ��O�ƶq
		for i=0 , y ,1 do 
			if ReadRoleValue( npcpl[i] , EM_RoleValue_OrgID ) == 102966 then
				AddBuff( npcpl[i] , 505408 ,0,-1)
			end
		end
	elseif CheckBuff(OwnerID(), 505409)==true then
		local npcpl = SearchRangeNPC (OwnerID(),100)
		local y=table.getn(npcpl)-----���X�Ӫ��O�ƶq
		for i=0 , y ,1 do 
			if ReadRoleValue( npcpl[i] , EM_RoleValue_OrgID ) == 102966 then
				AddBuff( npcpl[i] , 505409 ,0,-1)
			end
		end
	elseif CheckBuff(OwnerID(), 505410)==true then 
		local npcpl = SearchRangeNPC (OwnerID(),100)
		local y=table.getn(npcpl)-----���X�Ӫ��O�ƶq
		for i=0 , y ,1 do 
			if ReadRoleValue( npcpl[i] , EM_RoleValue_OrgID ) == 102966 then
				AddBuff( npcpl[i] , 505410 ,0,-1)
			end
		end
	else
		-----�F�Sbuff���P
	end		
end
function Lua_bk_120_505404()
local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------�}�l���ж�
local sm=OwnerID()
local Boss = ReadRoleValue(OwnerID(),EM_RoleValue_Register1) 
local st=0
	while 1 do 
	sleep(10)
		if HateListCount( sm ) ~= 0 then
			if st==0 then 
			SetModeEx( sm , EM_SetModeType_Move, true) ---����	
			st=1
			end
		elseif HateListCount( sm ) == 0 then 	
			if st==0 then 
			CastSpellLV( OwnerID() , OwnerID() , 494755 , 0 )
			AddBuff( Boss , 505404 ,0,-1)
			elseif st==1 then 
			end	
		end	
	end	
end
function Lua_bk_120_505405()
local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------�}�l���ж�
local sm=OwnerID()
local Boss = ReadRoleValue(OwnerID(),EM_RoleValue_Register1) 
local st=0
	while 1 do 
	sleep(10)
		if HateListCount( sm ) ~= 0 then
			if st==0 then 
			SetModeEx( sm , EM_SetModeType_Move, true) ---����	
			st=1
			end
		elseif HateListCount( sm ) == 0 then 	
			if st==0 then 
			CastSpellLV( OwnerID() , OwnerID() , 494755 , 0 )
			AddBuff( Boss , 505405 ,0,-1)
			elseif st==1 then 
			end	
		end	
	end	
end
function Lua_bk_120_505406()
local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------�}�l���ж�
local sm=OwnerID()
local Boss = ReadRoleValue(OwnerID(),EM_RoleValue_Register1) 
local st=0
	while 1 do 
	sleep(10)
		if HateListCount( sm ) ~= 0 then
			if st==0 then 
			SetModeEx( sm , EM_SetModeType_Move, true) ---����	
			st=1
			end
		elseif HateListCount( sm ) == 0 then 	
			if st==0 then 
			CastSpellLV( OwnerID() , OwnerID() , 494755 , 0 )
			AddBuff( Boss , 505406 ,0,-1)
			elseif st==1 then 
			end	
		end	
	end	
end
function Lua_bk_120_505408()
local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------�}�l���ж�
local sm=OwnerID()
local Boss = ReadRoleValue(OwnerID(),EM_RoleValue_Register1) 
local st=0
	while 1 do 
	sleep(10)
		if HateListCount( sm ) ~= 0 then
			if st==0 then 
			SetModeEx( sm , EM_SetModeType_Move, true) ---����	
			st=1
			end
		elseif HateListCount( sm ) == 0 then 	
			if st==0 then 
			CastSpellLV( OwnerID() , OwnerID() , 494755 , 0 )
			AddBuff( Boss , 505408 ,0,-1)
			elseif st==1 then 
			end	
		end	
	end	
end
function Lua_bk_120_505409()
local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------�}�l���ж�
local sm=OwnerID()
local Boss = ReadRoleValue(OwnerID(),EM_RoleValue_Register1) 
local st=0
	while 1 do 
	sleep(10)
		if HateListCount( sm ) ~= 0 then
			if st==0 then 
			SetModeEx( sm , EM_SetModeType_Move, true) ---����	
			st=1
			end
		elseif HateListCount( sm ) == 0 then 	
			if st==0 then 
			CastSpellLV( OwnerID() , OwnerID() , 494755 , 0 )
			AddBuff( Boss , 505409 ,0,-1)
			elseif st==1 then 
			end	
		end	
	end	
end
function Lua_bk_120_505410()
local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------�}�l���ж�
local sm=OwnerID()
local Boss = ReadRoleValue(OwnerID(),EM_RoleValue_Register1) 
local st=0
	while 1 do 
	sleep(10)
		if HateListCount( sm ) ~= 0 then
			if st==0 then 
			SetModeEx( sm , EM_SetModeType_Move, true) ---����	
			st=1
			end
		elseif HateListCount( sm ) == 0 then 	
			if st==0 then 
			CastSpellLV( OwnerID() , OwnerID() , 494755 , 0 )
			AddBuff( Boss , 505410 ,0,-1)
			elseif st==1 then 
			end	
		end	
	end	
end