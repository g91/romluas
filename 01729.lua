function Lua_bk_raid04_103266_easy()
	local alltime = 0
	local time1 = 1
	local time2 = 1
	local atk =0
	local ModeCheck = 504095
	local Mode1= 504085
	local Mode2= 504086
	local ma = {}
	local ball0 ={}
	local ball1 ={}
	local m0 =0
	local m1 =0
	local m2 =0
	local m3 =0
	local boss = OwnerID()
	local CombatBegin =0
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )	
	local smallball = 0
---	local sbs={}
	local door = CreateObjByFlag(103578,780425,3,1)
		SetModeEx( door , EM_SetModeType_SearchenemyIgnore, false) ---���󤣷|�Q�j�M
		SetModeEx( door , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
		SetModeEx( door , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
		SetModeEx( door , EM_SetModeType_Searchenemy, false)
		SetModeEx( door , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( door , EM_SetModeType_Mark, false)
		SetModeEx( door , EM_SetModeType_Obstruct, true)
		SetModeEx( door , EM_SetModeType_Gravity, false)
		SetModeEx( door ,EM_SetModeType_Strikback, false) ---����
		SetModeEx( door , EM_SetModeType_Move, false) ---����	
		SetModeEx( door , EM_SetModeType_Fight, false) ---�i���
		SetModeEx( door , EM_SetModeType_Show, true) ----�q�X
		AddToPartition(door , RoomID )
		WriteRoleValue(boss , EM_RoleValue_Register1,door)	
		SetPlot( OwnerID(),"dead","Lua_bk_rd04_dead_102563",50 )
	local door1 = CreateObj(102419, -1289.3,1266.2,928.4,357.4,1)
		SetModeEx( door1 , EM_SetModeType_SearchenemyIgnore, false) ---���󤣷|�Q�j�M
		SetModeEx( door1 , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
		SetModeEx( door1 , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
		SetModeEx( door1 , EM_SetModeType_Searchenemy, false)
		SetModeEx( door1 , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( door1 , EM_SetModeType_Mark, false)
		SetModeEx( door1 , EM_SetModeType_Obstruct, true)
		SetModeEx( door1 , EM_SetModeType_Gravity, false)
		SetModeEx( door1 , EM_SetModeType_Strikback, false) ---����
		SetModeEx( door1 , EM_SetModeType_Move, false) ---����	
		SetModeEx( door1 , EM_SetModeType_Fight, false) ---�i���
		SetModeEx( door1 , EM_SetModeType_Show, true) ----�q�X
		AddToPartition(door1 , RoomID )
		WriteRoleValue(boss , EM_RoleValue_Register4,door1)	
		BeginPlot( OwnerID(),"Lua_bk_rd04_op_door_103266",0 )
	local timecount = CreateObjByFlag(103272,780425,2,1)  -----�b�S�w�I�ͥX�ɶ��p�ɾ� ,�ɶ��p��10��
		SetModeEx( timecount , EM_SetModeType_Show, false) ----�q�X
		SetModeEx( timecount , EM_SetModeType_Mark, false) ----�аO
		SetModeEx( timecount , EM_SetModeType_Strikback, false) ---����
		SetModeEx( timecount , EM_SetModeType_Move, false) ---����	
		SetModeEx( timecount , EM_SetModeType_Fight, false) ---�i���
		SetModeEx( timecount , EM_SetModeType_SearchenemyIgnore, false) ---���󤣷|�Q�j�M
		SetModeEx( timecount , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
		SetModeEx( timecount , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
		SetModeEx( timecount , EM_SetModeType_Searchenemy, false)  ---���
		AddToPartition(timecount , RoomID )
		BeginPlot( timecount ,"Lua_black_raid04_alltime_103266",0)
		WriteRoleValue(timecount , EM_RoleValue_PID,boss)---- �A�j�y���W��J����pid  
		WriteRoleValue(boss , EM_RoleValue_Register2,timecount)	
	while 1 do 
		---PlayMotion ( OwnerID(), ruFUSION_ACTORSTATE_CAST_SP01 )
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )   ------ ��M�ثe�������ؼ�
		local BossTarget=AttackTarget
		---local aaaa=HateListCount( boss )
		if HateListCount( boss ) ~= 0 then	---- �T�w�L�{�b�����H
			if CombatBegin == 0 then							---------------�u���}����@��
				CombatBegin = 1
				WriteRoleValue(timecount , EM_RoleValue_Register1,CombatBegin)
				BeginPlot( OwnerID(),"Lua_bk_rd04_cl_door_102419",0 )
			end	
			--Say(OwnerID(),"alltime"..alltime.."%%##time1="..time1.."%%time2="..time2)
			alltime =alltime +1		
			local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )			
			if CheckBuff(OwnerID() , Mode2) == true then   ----��o�O�ĤG���q���ɭ�	
				time2=time2+1
			--	if time2== 1 or time2 ==16 or time2 ==31 or time2 ==46 then ----10��ͤ@���p�y
			--		m1=m1+1
			--		smallball=DW_Rand(11)
			--		ball1[m1]= CreateObjByFlag(103268,780426,smallball,12)
			--		SetModeEx( ball1[m1] , EM_SetModeType_Move, false) ---����
			--		AddToPartition(ball1[m1] , RoomID )	
			--		AddBuff( ball1[m1] , 504025 , 1 , -1 )
			--		SetPlot( ball1[m1] , "dead" , "Lua_black_ball_dead_103266" , 0 )
			--		WriteRoleValue(ball1[m1] , EM_RoleValue_Register3,boss)
			--		BeginPlot(ball1[m1],"Lua_bk_rd04_bossdead_103266",10)
			--	end
				if time2==10 then ----�ǰe�S��
					ScriptMessage( OwnerID(), -1 , 2 , "[SC_102395_04]" , 1 )
					CastSpell( boss , boss , 493995 )
					SetModeEx( boss   , EM_SetModeType_Move , false )
				end
				if time2 == 13 then    ---15��Ӥ@���j�y
					SetPos( boss, -1383.0, 1296.3 , 825.9 , 180.6 )---�N���Ǩ�@�Ӧa��h
					------SetPos( boss, -1020.8, -0.0 , -29.2, 180.6 )---�N���Ǩ�@�Ӧa��h
					--SetModeEx( boss   , EM_SetModeType_Move , false )-----���ಾ��
					---PlayMotion ( boss, ruFUSION_ACTORSTATE_CHANNEL_BEGIN )-- ����l���ʧ@
					local bigball = CreateObjByFlag(103267,780425,1,1)  -----�b�S�w�I�ͤj�y ,�ɶ��p��10��
					SetModeEx( bigball , EM_SetModeType_SearchenemyIgnore, true) ---���󤣷|�Q�j�M
					SetModeEx(bigball , EM_SetModeType_HideName, true)  ---�����Y�W�O�_��ܦW��
					SetModeEx( bigball , EM_SetModeType_HideMinimap, true)  ---����O�_�b�p�a�ϤW���
					SetModeEx( bigball , EM_SetModeType_Searchenemy, false)
					SetModeEx( bigball , EM_SetModeType_NotShowHPMP, true)
					SetModeEx( bigball , EM_SetModeType_Mark, true)
					SetModeEx( bigball , EM_SetModeType_Fight, true)
					SetModeEx( bigball , EM_SetModeType_ShowRoleHead, true)
					SetModeEx( bigball , EM_SetModeType_Strikback, false)
					AddToPartition(bigball , RoomID )
					SetPlot( bigball , "dead" , "Lua_bk_rd04_bigball_dead_103266" , 10 )
					BeginPlot( bigball , "Lua_black_raid04_bigball_103266" , 0 )
					AddBuff(boss,504334,0,50) --�ˬd�y�b���b
					AddBuff(bigball,504504,0,50) --------�����ϼu��
					WriteRoleValue(boss , EM_RoleValue_Register5,bigball)------
					WriteRoleValue(bigball , EM_RoleValue_PID,boss)---- �A�j�y���W��J����pid  
					WriteRoleValue(bigball , EM_RoleValue_Register3,boss)
					BeginPlot(bigball,"Lua_bk_rd04_bossdead_103266",10)					
				end
				if time2==40 then ----�ǰe�S��
					ScriptMessage( OwnerID(), -1 , 2 , "[SC_102395_04]" , 1 )
					CastSpell( boss , boss , 493995 )
					SetModeEx( boss   , EM_SetModeType_Move , false )
				end
				if time2 == 43 then     ---15��Ӥ@���j�y
					SetPos( boss,-1383.0, 1296.3 , 825.9 , 180.6 )---�N���Ǩ�@�Ӧa��h
					---SetPos( boss, -1020.8, -0.0 , -29.2, 180.6 )---�N���Ǩ�@�Ӧa��h
					--SetModeEx( boss   , EM_SetModeType_Move , false )-----���ಾ��
					---PlayMotion ( boss, ruFUSION_ACTORSTATE_CHANNEL_BEGIN )-- ����l���ʧ@
					local bigball = CreateObjByFlag(103267,780425,1,1)  -----�b�S�w�I�ͤj�y ,�ɶ��p��10��
					SetModeEx( bigball , EM_SetModeType_SearchenemyIgnore, true) ---���󤣷|�Q�j�M
					SetModeEx(bigball , EM_SetModeType_HideName, true)  ---�����Y�W�O�_��ܦW��
					SetModeEx( bigball , EM_SetModeType_HideMinimap, true)  ---����O�_�b�p�a�ϤW���
					SetModeEx( bigball , EM_SetModeType_Searchenemy, false)   
					SetModeEx( bigball , EM_SetModeType_NotShowHPMP, true)
					SetModeEx( bigball , EM_SetModeType_Mark, true)
					SetModeEx( bigball , EM_SetModeType_Fight, true)
					SetModeEx( bigball , EM_SetModeType_ShowRoleHead, true)
					SetModeEx( bigball , EM_SetModeType_Strikback, false)
					AddToPartition(bigball , RoomID )
				---	BeginPlot( bigball , "Lua_bk_rd04_move_102395" , 0 )
					SetPlot( bigball , "dead" , "Lua_bk_rd04_bigball_dead_103266" , 10 )
					BeginPlot( bigball , "Lua_black_raid04_bigball_103266" , 0 )
					AddBuff(boss,504334,0,50) --�ˬd�y�b���b
					AddBuff(bigball,504504,0,50)--------�����ϼu��
					WriteRoleValue(boss , EM_RoleValue_Register5,bigball)
					WriteRoleValue(bigball , EM_RoleValue_PID,boss)---- �A�j�y���W��J����pid  
					WriteRoleValue(bigball , EM_RoleValue_Register3,boss)
					BeginPlot(bigball,"Lua_bk_rd04_bossdead_103266",10)
				end
				if time2 == 60 then   ---�ѤU�̫�3��ɭԨӭӤj���ۥ��a�O
					ScriptMessage( OwnerID(), -1 , 2 , "[SC_102395_05]" , 1 )
					Say(boss,"[SC_102395_05]" )
					CastSpell( OwnerID() , OwnerID() , 494736 )
					for i = 1 , table.getn(ball1), 1 do				---�h��p�y   �ٳѦh�ֱ����L��
						if ball1[i] ~= nil and CheckID(ball1[i] ) == true  then
							KillID(ball1[i] , ball1[i] )  ---����npc���O
							Delobj(ball1[i])
						end		
					end
						time2 = 1
						alltime =0
						m1=0
					end
				end
		---------------------------------------------------�ĤG���q�}�l	����	
			if CheckBuff(OwnerID() , Mode1) == true then---�Ĥ@���q�P�w
				BossTarget=AttackTarget
				time1=time1+1
				local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )		
				if time1==8 or time1==16 or time1==24 or time1==32 or time1==40 or time1==48 or time1==56 then
					ScriptMessage( OwnerID(), -1 , 2 , "[SC_102395_02]" , 1 )  
					CastSpell( OwnerID() , BossTarget , 493791 )----���e�ؼ�����@�ӥ��j�ˮ`
				end
				if time1==18 or time1==36 or time1==54 then
					ScriptMessage( OwnerID(), -1 , 2 , "[SC_102395_03]" , 1 ) 
					CastSpell( OwnerID() , BossTarget , 495024 )----�ϥΥ���T���N
				end
				if time1==5 or time1==12 or time1==19 or time1==26 or time1==33 or time1==40 or time1==47 or time1==54 then    ---�C5��ͤ@���p�y�a
					m0=m0 +1
					smallball=DW_Rand(12)
					---sbs[m0]=smallball-----------------------------
					ball0[m0]= CreateObjByFlag(103268,780426,smallball,12)
					AddToPartition(ball0[m0] , RoomID )
					SetModeEx( ball0[m0] , EM_SetModeType_Move, false) ---����
					AddBuff(ball0[m0], 504025 , 1 , -1 )
					SetPlot( ball0[m0] , "dead" , "Lua_black_ball_dead_103266" , 10 )
					WriteRoleValue(ball0[m0] , EM_RoleValue_Register3,boss)
					BeginPlot(ball0[m0],"Lua_bk_rd04_bossdead_103266",10)
				end
				if time1==5 or time1==10 or time1==15 or time1==20 then  ----�e��20��,�C5��ͤ@�Ӫk
					m2 = m2+1
					ma[m2] =LuaFunc_CreateObjByObj ( 103271 , boss )
					DelFromPartition( ma[m2] )
					SetModeEx( ma[m2] , EM_SetModeType_SearchenemyIgnore, false) ---���󤣷|�Q�j�M
					SetModeEx( ma[m2] , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
					SetModeEx( ma[m2] , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
					SetModeEx( ma[m2] , EM_SetModeType_Searchenemy, false)
					SetModeEx( ma[m2] , EM_SetModeType_NotShowHPMP, false)
					SetModeEx( ma[m2] , EM_SetModeType_Mark, false)
					SetModeEx( ma[m2] , EM_SetModeType_Move, false)
					SetModeEx( ma[m2] , EM_SetModeType_Fight, false) ---�i���
					---SetModeEx( ma[m2] , EM_SetModeType_Show, false)
					AddToPartition(ma[m2] , RoomID )
					---CastSpell( ma[m2] , ma[m2] , 493923 )
					BeginPlot(  ma[m2] ,"Lua_bk_raid04_magic_103271",0)
					WriteRoleValue(ma[m2] , EM_RoleValue_Register3,boss)
					BeginPlot(ma[m2],"Lua_bk_rd04_bossdead_103266",10)
				end
				if time1== 60 then -----�ഫ�I   �o�t�a�L�ĥ��a�O
					ScriptMessage( OwnerID(), -1 , 2 , "[SC_102395_05]" , 1 ) 
					Say(boss,"[SC_102395_05]" )
					CastSpell( OwnerID() , OwnerID() , 494736 )
					for i = 1 , table.getn(ball0), 1 do				
						if ball0[i] ~= nil and CheckID(ball0[i] ) == true  then
							KillID(ball0[i] , ball0[i] )
							Delobj(ball0[i])
						end		
					end
					for i = 1 , table.getn(ma), 1 do				
						if ma[i] ~= nil and CheckID(ma[i] ) == true  then
							DelObj(ma[i])
						end		
					end
					time1=1
					m0=0
					m2=0
				end
			end
		elseif HateListCount( boss )  == 0 then		-------�������@�b���}�԰�
			PlayMotion ( OwnerID(), ruFUSION_ACTORSTATE_CAST_SP01 )
			---BeginPlot( OwnerID(),"Lua_bk_rd04_op_door_103266",0 )
			sleep(30)
			if CombatBegin==1 then
				for i = 1 , table.getn(ball1), 1 do				------�R���Ĥ@��q���y
					if ball1[i] ~= nil and CheckID(ball1[i] ) == true  then
						Delobj(ball1[i])
					end		
				end
				for i = 1 , table.getn(ball0), 1 do				-------�R���ĤG���q���y
					if ball0[i] ~= nil and CheckID(ball0[i] ) == true  then
						Delobj(ball0[i])
					end		
				end
				for i = 1 , table.getn(ma), 1 do				------�R���Ĥ@���q���k
					if ma[i] ~= nil and CheckID(ma[i] ) == true  then
						DelObj(ma[i])
					end		
				end
				time1=1
				time2=1
				alltime =0
				CombatBegin = 0
				WriteRoleValue(timecount , EM_RoleValue_Register1,CombatBegin)
				m0=0
				m1=0
				Hide(door1)
				local bking = CreateObjByFlag(103266,780425,4,1)---------------����ͦb4����m
				AddToPartition(bking , RoomID )
				SetModeEx( bking   , EM_SetModeType_Move , true)----�i�H����
				-------------BeginPlot( OwnerID(),"Lua_bk_rd04_op_door_103266",0 )
				BeginPlot( bking,"Lua_bk_raid04_103266_easy",0 )
				Delobj(timecount)
				Delobj(door)
				Delobj(door1)
				Delobj(boss)
			end
		end 
		sleep(10)
	end
end
--------------------------------------------------------------------------------------------------------------------------------
function Lua_black_ball_dead_103266()  ----�q�y���`�@��
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )	
	local ball=OwnerID()
	local bmball = Lua_DW_CreateObj("obj",102420,ball,0)
	--local bmball = LuaFunc_CreateObjByObj ( 102420, ball )
	--DelFromPartition( bmball )-------------------------------����L�i�J����
	SetModeEx( bmball , EM_SetModeType_Show, true) ----�q�X
	SetModeEx( bmball , EM_SetModeType_Mark, false) ----�аO
	SetModeEx( bmball , EM_SetModeType_Strikback, false) ---����
	SetModeEx( bmball , EM_SetModeType_Move, false) ---����	
	SetModeEx( bmball , EM_SetModeType_Fight, false) ---�i���
	SetModeEx( bmball , EM_SetModeType_SearchenemyIgnore, false) ---���󤣷|�Q�j�M
	SetModeEx( bmball , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
	SetModeEx( bmball , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
	SetModeEx( bmball , EM_SetModeType_Searchenemy, false)  ---���
	AddToPartition(bmball , RoomID )
	--------say(bmball,"xxxx")
	CastSpellLv(bmball,bmball,494738,1)
	BeginPlot( bmball ,"Lua_bk_raid04_bmball_easy",10)----��@����쨭�W�h
	DelObj(ball)
end
--------------------------------------------------------------------------------------------------------------------------------
function Lua_bk_rd04_bigball_dead_103266()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )	
	local bigball = OwnerID()
	local boss= ReadRoleValue(bigball ,EM_RoleValue_PID)
	CancelBuff( boss , 504334 )
	----------Delobj(bigball)
end
--------------------------------------------------------------------------------------------------------------------------------�I�������g�ɼ@�� ��j�y������
function Lua_black_raid04_bigball_103266()  -------��y�I����B�o�W�[�ˮ`�@��
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )	
	local bigball = OwnerID()
	local boss= ReadRoleValue(bigball ,EM_RoleValue_PID)
	---CastSpell( boss , bigball , 493921 )
	--for i=1 ,10 ,1 do
	---say(OwnerID(),"YYYYYYYY")
	CastSpell( boss , bigball , 493921 )-------����ʧ@
	MoveToFlagEnabled ( bigball,  false )
	
	LuaFunc_MoveToFlag( bigball, 780425 , 2 , 10)-------�j�����y���ʨ�ĤG�ӺX��
--	sleep(50)
	----sleep(100)
	--	if CheckBuff(boss ,504504 ) == false then
	--		SetModeEx( boss   , EM_SetModeType_Move , true)----�i�H����
	--		Delobj(bigball)
	--	end
	--end
	--SetModeEx( boss   , EM_SetModeType_Move , true)----�i�H����
	AddBuff( boss ,504088,0,-1 )
	---say(OwnerID(),"xxxxx")
	CancelBuff( boss , 504334 )------
	---KillID(bigball , bigball )
	---Delobj(bigball)
end
--function Lua_black_rd04_504504()---------�k�N�h�P�w�ɮɶ��������������`����
---	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )	
---	local boss = OwnerID()
---	local bigball= ReadRoleValue(boss ,EM_RoleValue_Register5)
---	SetModeEx( boss   , EM_SetModeType_Move , true)----�i�H����
---	Delobj(bigball)
------end
function Lua_black_raid04_alltime_103266()------------------------�ɶ��p�ɾ�  �ɶ���|�g��
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )	
	local boss = ReadRoleValue( OwnerID() , EM_RoleValue_PID )	
	local timecount = OwnerID()
	local alltime = 1
	while true do	
	local CombatBegin = ReadRoleValue( OwnerID() , EM_RoleValue_Register1 )	
		if CombatBegin==1 then 
			if 	alltime ==  1  or
				alltime == 121 or 
				alltime == 241 or 
				alltime == 361 or
				alltime == 481 then  
				CancelBuff(boss,504086)
				AddBuff(boss,504085,1,600)
			end
			if 	alltime ==  61 or 
				alltime == 181 or 
				alltime == 301 or 
				alltime == 421 or
				alltime == 541 then
				CancelBuff(boss,504085)
				AddBuff(boss,504086,1,600)
			end
			if alltime ==601 then
				alltime=0
			----	ScriptMessage( boss, -1 , 2 , "[SC_102395_01]" , 1 )
			---	Say(boss,"[SC_102395_01]")
			---	AddBuff (boss,504269,1,600)	----�g��!
			end
				alltime = alltime +1 
		end
		if CombatBegin == 0 then
			alltime =1
		end
		sleep(10)
	end	
end
function Lua_bk_raid04_magic_103271()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local magic = OwnerID()
	while 1 do 
		sleep(10)
	local npcpl = SearchRangeNPC (magic , 30)
	local y=table.getn(npcpl)-----���X�Ӫ��O�ƶq
		for i=0 , y ,1 do 
			if ReadRoleValue( npcpl[i] , EM_RoleValue_OrgID ) == 103266 then
				AddBuff( npcpl[i] , 504024 , 1 , 1)
			end
		end
	local PPL = SearchRangePlayer ( magic , 30 )	
	local x=table.getn(PPL)-----���X�Ӫ��O�ƶq
		if x == 0 then
		end
		if x ~= 0 then 
			AddBuff( PPL[0] , 504024 , 1 , 1)
		end
	end
end
function Lua_bk_raid04_bmball_easy()----------�p�������y���`���Უ���z���@��
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local bmball = OwnerID()
	sleep(20)
	DelObj(bmball)
end
function Lua_bk_rd04_move_103266()---------�����y�X �¤��ؼв��ʬI������l���N
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local bigball = OwnerID()
	local boss= ReadRoleValue(bigball ,EM_RoleValue_PID)
	CastSpell( boss , bigball , 493921 )
	MoveToFlagEnabled ( bigball,  false )
	LuaFunc_MoveToFlag( bigball, 780425 , 2 , 10)-------�j�����y���ʨ�ĤG�ӺX��
end
---function Lua_bk_rd04_dead_102563()------��������}��
	--local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
---	local boss = OwnerID()
----	local door = ReadRoleValue( boss , EM_RoleValue_Register1 )
	--PlayMotionEX( door ,  ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP  )
	--SetModeEX( door , EM_SetModeType_Obstruct , false )
--	Hide( door )
--	Show( door , RoomID )
---	DelObj(door)
---	local timecount = ReadRoleValue( boss , EM_RoleValue_Register2 )
---	DelObj(timecount)
---end
function Lua_bk_rd04_op_door_103266()--------open
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local boss = OwnerID()
	local door = ReadRoleValue( boss , EM_RoleValue_Register4 )	
	SetIdleMotion( door , ruFUSION_ACTORSTATE_ACTIVATE_LOOP  )
	SetModeEX( door , EM_SetModeType_Obstruct , false )
	--Hide( door )
--	Show( door , RoomID )
end
function Lua_bk_rd04_cl_door_103266()----------close
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local boss = OwnerID()
	local door = ReadRoleValue( boss , EM_RoleValue_Register4 )	
	SetIdleMotion( door ,  ruFUSION_ACTORSTATE_ACTIVATE_END)
	SetModeEX( door , EM_SetModeType_Obstruct , true )
--	Hide( door )
--	Show( door , RoomID )
end
function Lua_bk_rd04_bossdead_103266()-------BOSS���`����h�R����L����
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local boss= ReadRoleValue(OwnerID() ,EM_RoleValue_Register3)
	while 1 do
	sleep(10)
		if ReadRoleValue( boss , EM_RoleValue_IsDead) == 1 and
			ReadRoleValue( boss , EM_RoleValue_IsPlayer) == 0 then
			BeginPlot( boss,"Lua_bk_rd04_op_door_103266",0 )
			DelObj(OwnerID())
		end
	end
end