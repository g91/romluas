function un_191littlemonster_01() --------�H�����ޤp�Ǥ�AI
	local alltime = 0
	local CombatBegin = 0
	local ran
	local Targ
	beginplot(OwnerID(),"un_191littlemonster_04",0)
	while true do
	sleep(10)
	alltime=alltime+1
		if hatelistcount(OwnerID())~=0 then
			if CombatBegin==0 then
				CombatBegin=1			
			end
			if CombatBegin==1 then
				if alltime%7 ==0 then
					RND=DW_Rand(2)
						if RND == 1 then   									--����
							Targ=ReadRoleValue(OwnerID(),EM_RoleValue_AttackTargetID)
							--say(OwnerID(),"1"..Targ)						
							while ReadRoleValue(OWnerID(),EM_RoleValue_SpellMagicID)~=0 do
								sleep(2)
							end
								CastSpelllv( OwnerID(), Targ,496515 ,0 )--����
								--ScriptMessage( Boss, -1 , 2 , Sktalk[1] , 2 )
								sleep(10)
						end
						if RND == 2 then                                     --����
							Targ=ReadRoleValue(OwnerID(),EM_RoleValue_AttackTargetID)
							--say(OwnerID(),"2")
							while ReadRoleValue(OWnerID(),EM_RoleValue_SpellMagicID)~=0 do
								sleep(2)
							end
							--BeginPlot(OwnerID(),"Lua_un_bossfight1_134",0)
							
							CastSpelllv( OwnerID(), OwnerID(),496516 ,1 )		 --����
							--ScriptMessage( Boss, -1 , 2 , Sktalk[2] , 1 )
							sleep(20)
						end
					elseif 	alltime%20 ==0 then
						while ReadRoleValue(OWnerID(),EM_RoleValue_SpellMagicID)~=0 do
							sleep(2)
						end
						hatelist = hatelistcount(OwnerID())
						--ScriptMessage( Boss, -1 , 2 , Sktalk[2] , 1 )
						if hatelist > 2 then
							TargetPlayer1= Lua_RandomPlayerFromHateList(OwnerID(),2)
							addbuff(TargetPlayer1[1],508104,0,2)
							--if table.getn(firelose)
							addbuff(TargetPlayer1[2],508104,0,2)
						else
							Targ=ReadRoleValue(OwnerID(),EM_RoleValue_AttackTargetID)
							addbuff(Targ,508104,0,2)
						end
							sleep(25)
						if hatelist > 2 then
							CastSpelllv( OwnerID(),  targetplayer1[1], 496513,3 )
							sysCastSpelllv( OwnerID(),  targetplayer1[2], 496513,3 )
						else
							CastSpelllv( OwnerID(),  Targ, 496513,3 )
						end
								
					end
			end
		end
		if hatelistcount(OwnerID())==0 and CombatBegin==1 then
			CombatBegin = 0
			alltime = 0
		end
	end
end
function un_191littlemonster_02()--�}�����Y�@��
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	--�۸O116921   �X��780814
	local doorchick2 = CreateObjByFlag( 104964 , 780814 , 0 , 1 )
	SetModeEx(doorchick2,EM_SetModeType_Mark, false)
	SetModeEx(doorchick2,EM_SetModeType_HideName, false)
	SetModeEx(doorchick2,EM_SetModeType_NotShowHPMP, false)
	SetModeEx(doorchick2,EM_SetModeType_Strikback, false)
	SetModeEx(doorchick2,EM_SetModeType_Move, false)
	SetModeEx(doorchick2,EM_SetModeType_Fight, false)
	SetModeEx(doorchick2,EM_SetModeType_Searchenemy, false)
	SetModeEx(doorchick2,EM_SetModeType_Obstruct, true)
	AddToPartition( doorchick2, RoomID)
	SetDefIdleMotion(doorchick2,ruFUSION_MIME_ACTIVATE_END)
	WriteRoleValue(doorchick2,EM_RoleValue_register1,doorchick2)
	WriteRoleValue(OwnerID(),EM_RoleValue_register1,doorchick2)
	SetCursorType(OwnerID(),3)
	SetPlot(OwnerID(),"touch","un_191littlemonster_03",50)
end
function un_191littlemonster_02_2()--�}�����Y�@��
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	--�۸O116921   �X��780814
	local doorchick2 = CreateObjByFlag( 104964 , 780814 , 1 , 1 )
	SetModeEx(doorchick2,EM_SetModeType_Mark, false)
	SetModeEx(doorchick2,EM_SetModeType_HideName, false)
	SetModeEx(doorchick2,EM_SetModeType_NotShowHPMP, false)
	SetModeEx(doorchick2,EM_SetModeType_Strikback, false)
	SetModeEx(doorchick2,EM_SetModeType_Move, false)
	SetModeEx(doorchick2,EM_SetModeType_Fight, false)
	SetModeEx(doorchick2,EM_SetModeType_Searchenemy, false)
	SetModeEx(doorchick2,EM_SetModeType_Obstruct, true)
	AddToPartition( doorchick2, RoomID)
	SetDefIdleMotion(doorchick2,ruFUSION_MIME_ACTIVATE_END)
	WriteRoleValue(doorchick2,EM_RoleValue_register1,doorchick2)
	WriteRoleValue(OwnerID(),EM_RoleValue_register1,doorchick2)
	SetCursorType(OwnerID(),3)
	SetPlot(OwnerID(),"touch","un_191littlemonster_03",50)
end

function un_191littlemonster_03(Seat,UpDown)			--�}�����Y�@��
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local ItemCount=CountBodyItem(OwnerID(),208468)
	local atk =ReadRoleValue(OwnerID(),EM_RoleValue_IsAttackMode)
	local door = ReadRoleValue(TargetID(),EM_RoleValue_register1)
	--say(OWnerID(),"Oatk = "..atk)
	--say(targetID(),"tar")
		if atk==1 then
			ScriptMessage(OwnerID(),OwnerID(),0,"[SC_ZONE190_STKING]",0)
		elseif atk == 0 then
			if ItemCount<1 then
				ScriptMessage(OwnerID(),OwnerID(),0,"[SC_ZONE191_DOOROPEN]",0)
		--		say(TargetID(),"Not Enough")
			else
				ScriptMessage(TargetID(),OwnerID(),0,"[SC_ZONE191_DOOROPEN01]",0)
				SetDefIdleMotion(door,ruFUSION_MIME_ACTIVATE_BEGIN)
				DelBodyItem (OwnerID(),208468,1)
				SetModeEx(TargetID(),EM_SetModeType_Mark, false)
			end
		end	
end
function un_191littlemonster_04()
--�X�� 780815
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local mob9898=ReadRoleValue(OwnerID(),EM_RoleValue_Register3)		
	while true do
		mob9898=ReadRoleValue(OwnerID(),EM_RoleValue_Register3)
		if hatelistcount(OwnerID())~=0 	then
			StopMove(OwnerID(),false)
		elseif hatelistcount(OwnerID())==0 	then
			MoveToFlagEnabled(OwnerID(), false)
			--say(OwnerID(),"mob9898="..mob9898)
			if ReadRoleValue( OwnerID() , EM_RoleValue_IsDead)==0	then
				if mob9898==0 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,0)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780815 ,0,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_Register3,mob9898+1)
				--SetPosByFlag( OwnerID() , 780716, 2 )
				sleep(10)
				elseif mob9898==1 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,0)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780815 ,1,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_Register3,mob9898+1)
				elseif mob9898==2 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,0)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780815 ,2,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_Register3,mob9898+1)
				elseif mob9898==3 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,0)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780815 ,3,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_Register3,mob9898+1)
				elseif mob9898==4 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,0)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780815 ,4,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_Register3,mob9898+1)
				elseif mob9898==5 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,0)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780815 ,5,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_Register3,mob9898+1)
				elseif mob9898==6 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,0)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780815 ,6,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_Register3,0)
				end
			end
		end	
		sleep(10)
	end
end
function un_191littlemonster_05()  --�ϸ˦�
	addbuff(OwnerID(),508761,0,-1)
	local player= {}
	while true do		
		player = SearchRangePlayer ( OwnerID() , 50 )		
		if table.getn(player)>0 then				
			for i=0,table.getn(player) do
				if CheckBuff(player[i],508122) == true then--�ˬdBUFF 
					say(OwnerID(),"[SC_ZONE191_HELP]") --�A�o���˪��J�I��
					CancelBuff( player[i] , 508122 )
				end	
			end
		end
		sleep(10)
	end
end
function un_191littlemonster_06()	--���b���Ȫ��~����l�@�����U
	--�Գ�����116922
	SetPlot( OwnerID(),"touch","un_191littlemonster_07",30 )--Ĳ�I�@��
end

function un_191littlemonster_07()
	if CountBodyItem( OwnerID(), 208469 )==0 then 
		BeginPlot( TargetID(), "un_191littlemonster_08", 0 )--�����˨��@��
	else
		ScriptMessage(OwnerID(),OwnerID(),0,"[SC_ZONE191_08]",0)
		BeginPlot(TargetID(),"un_191littlemonster_06",0)
	end
end
function un_191littlemonster_08()	
	local O_ID = OwnerID()	--�I������
	local T_ID = TargetID()	--���a
	--local QuestID = 422080 			--##�һݪ����Ƚs��
	local item = 208469			--##��o���~
	local num = 1 					--##��o�ƶq
	local time = 0 --���󭫥ͮɶ�  �@��ة� �ݭn�񭫥ͮɶ�  script���Ƕ�0
	--if CheckQuest( T_ID, QuestID , 0 ) == true then
		CallPlot( O_ID, "ks_SquatGetItem", T_ID, item, num, 300) -- �ؼ�(target���a) ��o���~(item) �ƶq(num) �ɶ�(time)					
	--else
		--ScriptMessage( O_ID, T_ID, 1, "[SC_Z16_REQUIRE]" , 0 ) --�S���ŦX���e�U����
	--end
end
--*****************************************************************************************************************
														--�H�U���p��PAT��ޯ�
--*****************************************************************************************************************
function un_191littlemonster_09() --PAT�H��
	local dis = 15
	local count = 5 --�}�C���j�p�A��J3 �|�O 3*3 ���}�C�F���L�]����ƥ������_�ơA�ҥH��J 4 �|�O 5*4 ���}�C�C
	local checktime = 10 --�P�_���ɶ����Z�A�ƭȷU�C�A�P�_���W�v�U���A�U�۵M�A���Ӫ��귽�]�U�h
	local ReviveTime = 600000  --��}�C����������������ɡA�i��}�C���m���ʧ@�A�p�G�� -1 �A�N�|���� OwnerID() �]�w�����ͮɶ����m
	local circle = 6000  --�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local SkillRND =  Rand( 100 )+1	-- ���Ͷü�
	if SkillRND <= 100 and SkillRND > 80 then
		checktime =	checktime + 1
		
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(104973,Matrix,1,1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(104973,Matrix,1,-1)

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "un_191littlemonster_09_1" , 0 )
end
function un_191littlemonster_09_1()
	sleep( 10 )
	BeginPlot( OwnerID() , "un_191littlemonster_09" , 0 )
end
function un_191littlemonster_10() --PAT�ͧ�
	local dis = 15
	local count = 5 --�}�C���j�p�A��J3 �|�O 3*3 ���}�C�F���L�]����ƥ������_�ơA�ҥH��J 4 �|�O 5*4 ���}�C�C
	local checktime = 10 --�P�_���ɶ����Z�A�ƭȷU�C�A�P�_���W�v�U���A�U�۵M�A���Ӫ��귽�]�U�h
	local ReviveTime = 600000  --��}�C����������������ɡA�i��}�C���m���ʧ@�A�p�G�� -1 �A�N�|���� OwnerID() �]�w�����ͮɶ����m
	local circle = 6000  --�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local SkillRND =  Rand( 100 )+1	-- ���Ͷü�
	if SkillRND <= 100 and SkillRND > 80 then
		checktime =	checktime + 1
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(104971,Matrix,1,0)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(104970,Matrix,2,-1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(104965,Matrix,2,1)

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "un_191littlemonster_10_1" , 0 )
end
function un_191littlemonster_10_1()
	sleep( 10 )
	BeginPlot( OwnerID() , "un_191littlemonster_10" , 0 )
end
function un_191littlemonster_11()
	Beginplot(TargetID(),"un_191littlemonster_12",0)
end
function un_191littlemonster_12()
	local dottime = 0
	addbuff(OwnerID(),508479,0,5)
	while true do
		dottime=dottime+1
		sleep(10)
		if dottime%2==0  then
			sysCastSpellLv(OwnerID(),OwnerID(),496692,3)
		elseif 	dottime == 5 then
			break
		end
	end
end
-----*********************************************************************************************************
                                          --���u
--************************************************************************************************************
function Lua_Un_117166()	--���b���Ȫ��~����l�@�����U
	SetPlot( OwnerID(),"touch","un_117166_do",30 )--Ĳ�I�@��
end

function un_117166_do()
	BeginPlot( TargetID(), "un_117166_Get", 0 )--�����˨��@��
end
function un_117166_Get()	
	local O_ID = OwnerID()	--�I������
	local T_ID = TargetID()	--���a
	--local QuestID = 422080 			--##�һݪ����Ƚs��
	local item = 208686 			--##��o���~
	local num = 1 					--##��o�ƶq
	local time = 60 --���󭫥ͮɶ�  �@��ة� �ݭn�񭫥ͮɶ�  script���Ƕ�0
	--if CheckQuest( T_ID, QuestID , 0 ) == true then
		CallPlot( O_ID, "ks_SquatGetItem", T_ID, item, num, time ) -- �ؼ�(target���a) ��o���~(item) �ƶq(num) �ɶ�(time)					
	--else
		--ScriptMessage( O_ID, T_ID, 1, "[SC_Z16_REQUIRE]" , 0 ) --�S���ŦX���e�U����
	--end
end
function un_191littlemonster_13()
	local tableA={}
	local x = 0
	tableA = SearchRangeNPC ( OwnerID() , 20 )
	--say(OwnerID(),"tableA = "..table.getn(tableA))
		for i=0, table.getn(tableA) do
			--say(OwnerID(),"tableA"..i+1 .."= "..ReadRoleValue( tableA[i] , EM_RoleValue_OrgID))
			if	ReadRoleValue( tableA[i] , EM_RoleValue_OrgID) == 104975 then
				x=x+1
			else
				--ScriptMessage( OwnerID(), 0 , 2 ,"[SC_104140_08]" , 2 )
			end
		end
		--say(OwnerID(),X)
		if x ~=0 then
			return true
		else
			ScriptMessage( OwnerID(), 0 , 2 ,"[SC_ZONE191_BUMP]" , 2 )
			return false
		end	
end
function un_191littlemonster_14()
	if ReadRoleValue(TargetID() , EM_RoleValue_OrgID) == 104974 then
		AddBuff( TargetID() ,508132 ,0 ,-1 )
	elseif ReadRoleValue(TargetID() , EM_RoleValue_OrgID) == 104965 or 
		   ReadRoleValue(TargetID() , EM_RoleValue_OrgID) == 104970 or 
		   ReadRoleValue(TargetID() , EM_RoleValue_OrgID) == 104975 or
		   ReadRoleValue(TargetID() , EM_RoleValue_OrgID) == 104971 then
			NPCDead( TargetID() , TargetID() )
			delobj(TargetID())
	end
end
function un_191littlemonster_15()
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local x1 = ReadRoleValue (OwnerID(), EM_RoleValue_X)   --�O��littlemonster��X
	local y1 = ReadRoleValue (OwnerID(), EM_RoleValue_Y)   --�O��littlemonster��y
	local z1 = ReadRoleValue (OwnerID(), EM_RoleValue_Z)   --�O��littlemonster��z
	--local bump = LuaFunc_CreateObjByObj ( 104976 , OwnerID() ) 
	local bump = CreateObj (104976 , x1 , y1 , z1 , 0 , 1)
	--say(OwnerID(),"Owner"..OwnerID())
		SetModeEx(bump,EM_SetModeType_Mark, false)
		SetModeEx(bump,EM_SetModeType_HideName, false)
		SetModeEx(bump,EM_SetModeType_NotShowHPMP, false)
		SetModeEx(bump,EM_SetModeType_Strikback, false)
		SetModeEx(bump,EM_SetModeType_Move, false)
		SetModeEx(bump,EM_SetModeType_Fight, false)
		SetModeEx(bump,EM_SetModeType_Searchenemy, false)
		AddToPartition( bump, RoomID)
		--BeginPlot(bump ,"un_191littlemonster_16" , 0)
end
function un_191littlemonster_16()
	local time1 = 0 
	while 1 do
		time1=time1+1
		sleep(10)
		if time1 == 5 then
			CastSpelllv( OwnerID(), OwnerID(), 496696,0 )
			sleep(20)
			delobj(OwnerID())
		end
	end
end
function un_191littlemonster_17()
	ScriptMessage( OwnerID(), 0 , 2 ,"[SC_ZONE191_01]" , 2 )
end
function un_191littlemonster_18()
	SetPlot( OwnerID(),"range","un_191littlemonster_19",150 )--Ĳ�I�@��
end
function un_191littlemonster_19()
	ScriptMessage( OwnerID(), 0 , 2 ,"[SC_ZONE191_02]" , 2 )
end
-------------------------------------------------------------------------------------�H�U����**********************
zone191_allusingtime = {}
function Lua_Un191_Clockstart()             ------------------------------�Գ��p�ɾ�~�p����
local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local resettime = 0
	local playcount= 0	
	local optime = 0 
	local skill = 0
	zone191_allusingtime[RoomID] = {}
	zone191_allusingtime[RoomID][1] = 3599
	--zone191_allusingtime = 3599
	while 1 do
	sleep(10)
	resettime=resettime+1
	if resettime%30==0 then
		--DebugMsg(0,RoomID, "Nowtime = "..zone191_allusingtime[RoomID][1])
		
	end
	--if 	optime == 0 then 
		if zone191_allusingtime[RoomID][1] > 0 then
			zone191_allusingtime[RoomID][1]=zone191_allusingtime[RoomID][1]-1
		end
		--say(OwnerID(),"time = "..alltime)
			if resettime%20==0 then
				playcount = SetSearchAllPlayer(RoomID)
				for i=1 , playcount do
				local NpcGID = GetSearchResult()
				--ClockClose( NpcGID)
				ClockOpen( NpcGID , EM_ClockCheckValue_19 ,zone191_allusingtime[RoomID][1] ,zone191_allusingtime[RoomID][1] , 0 ,"Lua_Un191_Clockclose","Lua_Un191_Clocktimeup") 
				---SAY(NpcGID,"123")
				end
				if zone191_allusingtime[RoomID][1] <=0 then

					playcount = SetSearchAllPlayer(RoomID)
					for i=1 , playcount do
					local NpcGID = GetSearchResult()
						if skill == 0 then
							Lua_bk_warplayerpoint( NpcGID , 121 )
						end
						addbuff(NpcGID,508480,0,600)
						if ReadRoleValue( NpcGID , EM_RoleValue_IsDead)==1 then
							Revive( NpcGID, 2 , 2690, 54, -966, 0 )
						else
							ChangeZone( NpcGID , 2 , 0, 2690 , 54 , -966 , 240 )
						end
					end
					if skill == 0 then
						star_WorldBattle_ScoreCal( 0 , 2 )
						skill =1
					end
					--optime = 1 	
				end
			end

		--end	
	end	
end

function Lua_Un191_Clockclose()
	local ZoneID= ReadRoleValue(OwnerID(),EM_RoleValue_ZoneID)-----------------
	if ZoneID ~= 190 then 
		ClockClose( OwnerID())
	end
end
function Lua_Un191_Clocktest()
local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	zone191_allusingtime[RoomID][1] = 20
end
function Lua_Un191_Clocktimeup()
	addbuff(OwnerID(),508480,0,600)
	--Lua_bk_warplayerpoint( OWnerID() , playpoint )  --�����a����playpoint = ����
	--star_WorldBattle_ScoreCal(  0 )  --�N����
	Lua_bk_warplayerpoint( OWnerID() , 121 )
	if ReadRoleValue( OWnerID() , EM_RoleValue_IsDead)==1 then
		Revive( OWnerID(), 2 , 2690, 54, -966, 0 )
	else
		ChangeZone( OWnerID() , 2 , 0, 2690 , 54 , -966 , 240 )
	end
end
--*************************