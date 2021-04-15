--�X��     	781015
--������   	106101
--150_Boss	107462
--150_�p��	107463
--150_��t�p�� 	107364
--��    		102642 
--���_1       	107464       6
--���_2      	107467       6
--�W�ۦh�����_    107465
--7~10 ����A��		15A�}
--11~14  �k��B��  	16B�}
------------------------
--�ޯ�(Boss)
--499874  	����AE     
--499765	�ˮ`+���� 
--499766	�ˮ`+Dot
--499767 	�ˮ`+�w�t
--�ޯ�(�p��)
--499875  	50AE
--499876  	�p�ˮ`AE
--499855 	�]���j��
-----------------------------
--Ctrl
--PID   
--1
--2         0        1
--3        hole2	
--7        boss	
--8        doorchick2
--9        doorchick1
--10      monstershow
----------------------------
--Boss
--PID     ctrl
--1
--2
--3
---------------------------
--hole2
--PID     ctrl
---------------------------
--monster
--PID     ctrl
--1         boss
--------------------------
--monstershowai
--PID     ctrl




function bico_Z24ez_Boss4_ctrl ()
	local Ctrl = OwnerID()					                      --���
	local CombatBegin = 0						      --�}�ԺX��
	local RoomID = ReadRoleValue(Ctrl,EM_RoleValue_RoomID)
	local opendoor = 0
	local monster = CreateObjByFlag(107463,781015,6,1)                                  ---�p��     5
	local Monster_Table = {}
	local Boss = CreateObjByFlag(107462,781015,2,1)                                         ---BOSS   2
	local hole2 = CreateObjByFlag(107467,781015,6,1)    
	local Hp  = ReadRoleValue(Boss,EM_RoleValue_HP)
	local maxhp = ReadRoleValue(Boss,EM_RoleValue_MaxHP)
	local Hp1  = (Hp / maxhp) *100 
	local Treasure = CreateObjByFlag( 107465 , 781015 , 1 , 1 )	--���_�}�������_�c

 	AddToPartition(Boss,RoomID)
	WriteRoleValue(Boss,EM_RoleValue_PID,Ctrl)                                                       --  ctrl        PID   ctrl
	WriteRoleValue(hole2,EM_RoleValue_PID,Ctrl)                                                     --  hole2   PID   ctrl
	WriteRoleValue(ctrl,EM_RoleValue_Register2,0)                                                   --  crtl        r2     0
	WriteRoleValue(Ctrl , EM_RoleValue_Register1 , Boss )
	local hole1 = CreateObjByFlag(107464,781015,6,1)     --���ɵ��_   6
	SetModeEx(hole1,EM_SetModeType_Mark, false)
	SetModeEx(hole1,EM_SetModeType_HideName, false)
	SetModeEx(hole1,EM_SetModeType_NotShowHPMP, false)
	SetModeEx(hole1,EM_SetModeType_Strikback, false)
	SetModeEx(hole1,EM_SetModeType_Move, false)
	SetModeEx(hole1,EM_SetModeType_Fight, false)
	SetModeEx(hole1,EM_SetModeType_Searchenemy, false)
	SetModeEx(hole1,EM_SetModeType_Obstruct, false)
	AddToPartition( hole1, RoomID)
	WriteRoleValue( Boss , EM_RoleValue_Register10 , hole1 )		
	local hole2 = CreateObjByFlag(107467,781015,6,1)                              --�i��������ɵ��_   6 
	local doorchick1 = CreateObjByFlag(102642,781015,3,1)                    --���     3
	SetModeEx(doorchick1,EM_SetModeType_Mark, false)
	SetModeEx(doorchick1,EM_SetModeType_HideName, false)
	SetModeEx(doorchick1,EM_SetModeType_NotShowHPMP, false)
	SetModeEx(doorchick1,EM_SetModeType_Strikback, false)
	SetModeEx(doorchick1,EM_SetModeType_Move, false)
	SetModeEx(doorchick1,EM_SetModeType_Fight, false)
	SetModeEx(doorchick1,EM_SetModeType_Searchenemy, false)
	SetModeEx(doorchick1,EM_SetModeType_Obstruct, true)
	AddToPartition( doorchick1, RoomID)
	WriteRoleValue(ctrl,EM_RoleValue_Register9,doorchick1)              ---- ctrl r9 ���
	local doorchick2 = CreateObjByFlag(102642,781015,4,1)              ----�e��        4
	local PlayerNum = SetSearchAllPlayer( ReadRoleValue( ctrl , EM_RoleValue_RoomID ) )	--���ƥ����P�h���a�Ҧ����
	local PlayerID = {}

	while  1 do
		sleep(10)
		if ReadRoleValue(hole2,EM_RoleValue_IsDead)== 1 then   --���_�Q���} �|�����_�c���_
				LockHP(boss,0,"")
				sleep(10)
				KillID(boss , boss )
				DelObj(boss)
				DelObj(doorchick1)   --�R�����
				DelObj(doorchick2)   --�R���e��
				Boss = ReadRoleValue(Ctrl , EM_RoleValue_Register1)
				ScriptMessage( Boss, -1, 3,"[SC_106900_11]" ,0 )
				Treasure = CreateObjByFlag( 107465 , 781015 , 1 , 1 )
				SetModeEx( Treasure , EM_SetModeType_Searchenemy, false)   	    --����
				SetModeEx( Treasure , EM_SetModeType_Fight, false) 		    --���
				SetModeEx( Treasure , EM_SetModeType_Move, false)		    --����
				SetModeEx( Treasure , EM_SetModeType_Strikback, false)	    --����
				SetModeEx(Treasure,EM_SetModeType_NotShowHPMP,true)           --����ܦ��
				AddToPartition( Treasure , RoomID )
				local player = SetSearchAllPlayer(RoomID)      --Ū�����hzone�Ҧ����a�ƶq
				local playername                               --���ŧi�n���X��zone�᪺���a
				for i = 1 , player do                          --�X�Ӫ��a����X��for�j��A�P�_�Ҧ����a
				playername = GetSearchResult()             --���X��zone����o�����aGID
				if CheckAcceptQuest( playername, 425684 ) == true and   --�P�_���a�O�_��������
				CheckCompleteQuest( playername, 425684 ) ~= true and    --���d���a�O�_��������
				CheckFlag( playername, 547281 ) ~= true then            --�P�_���a�O�_�����������Ȫ��X��
				SetFlag(playername,547281,1)                        --�����a��������
				end
				end		
				BeginPlot( Treasure , "Z24ez_107465_Treasure", 0 )
				return
		end
		if HateListCount( boss ) ~= 0 then  --��������H
			if CombatBegin == 0 then   
				BeginPlot(Boss , "bico_Z24ez_Boss4_ai" , 0)
				if opendoor == 0 then
					doorchick2 = CreateObjByFlag(102642,781015,4,1)
					SetModeEx(doorchick2,EM_SetModeType_Mark, false)
					SetModeEx(doorchick2,EM_SetModeType_HideName, false)
					SetModeEx(doorchick2,EM_SetModeType_NotShowHPMP, false)
					SetModeEx(doorchick2,EM_SetModeType_Strikback, false)
					SetModeEx(doorchick2,EM_SetModeType_Move, false)
					SetModeEx(doorchick2,EM_SetModeType_Fight, false)
					SetModeEx(doorchick2,EM_SetModeType_Searchenemy, false)
					SetModeEx(doorchick2,EM_SetModeType_Obstruct, true)
					AddToPartition( doorchick2, RoomID)
					WriteRoleValue(ctrl,EM_RoleValue_Register8,doorchick2)     ---ctrl r8 �e�� 
				opendoor =1
				end
			end
			if Hp1 >= 50 then
				if ReadRoleValue(ctrl,EM_RoleValue_register7) == 1 then
					local player = {}
					player = SearchRangePlayer( Boss, 500 )
						if CheckBuff(Boss,623551) == true then
							for i = 0 , table.getn(player) do
								if CheckBuff( player[i], 623545 ) == true then
--								DebugMsg(0,0,"player="..i)
								CancelBuff(player[i], 623545 )
								end
							end
						end
				end
			end
			if  	ReadRoleValue(ctrl,EM_RoleValue_register2) == 1 then 	-----BOSS�Ĥ@���������ͥi�Q���������_		
				hole2 = CreateObjByFlag(107467,781015,6,1)
				SetModeEx( hole2,EM_SetModeType_Mark, true)		--�i�аO	
				SetModeEx( hole2,EM_SetModeType_HideName, false)		--�����æW�r
				SetModeEx( hole2,EM_SetModeType_NotShowHPMP, false)	--�q���
	--			SetModeEx( hole2, EM_SetModeType_ShowRoleHead, true )	
				SetModeEx( hole2,EM_SetModeType_Strikback, false)		--�������
				SetModeEx( hole2,EM_SetModeType_Move, false)		--���ಾ��
				SetModeEx( hole2,EM_SetModeType_Fight, true)		--�i�Q���
				SetModeEx( hole2,EM_SetModeType_Searchenemy, false)	--������
				SetModeEx( hole2,EM_SetModeType_Obstruct, false)		--������
				AddToPartition( hole2, RoomID)
				AddBuff( hole2 , 623802 , 0 , -1 )				--���^��
				KS_ScriptMessage("[SC_106900_05]")    --[�o�K�K���I����l�K�K]
				WriteRoleValue(ctrl,EM_RoleValue_Register6,hole2)  
				local holeA = ReadRoleValue ( Boss , EM_RoleValue_Register1 )
				local holeB = ReadRoleValue ( Boss , EM_RoleValue_Register2 )
				local MonsterA = ReadRoleValue ( Boss , EM_RoleValue_Register3 )
				local MonsterB = ReadRoleValue ( Boss , EM_RoleValue_Register4 )
				DelObj(MonsterA)
				DelObj(MonsterB)
				DelObj(holeA)
				DelObj(holeB)
				DelObj(hole1)			
				WriteRoleValue(ctrl,EM_RoleValue_Register2,0)
				WriteRoleValue(hole2,EM_RoleValue_PID,ctrl)
				BeginPlot(hole2,"bico_Z24ez_Hole2AI",0)	
				if (checkid(hole2)==true and ReadRoleValue(hole2,EM_RoleValue_IsDead)== 1) or checkid(hole2)==false then
				ClearHateList(boss,-1)
				end							
			end
		CombatBegin = 1      --�԰��}�l		
		end
		if HateListCount( boss ) == 0 then  --������S�H  
			if ReadRoleValue(boss,EM_RoleValue_IsDead)== 0 then		--���Ϊ��p�U
				if opendoor == 1 then
				delobj(doorchick2)
				opendoor = 0
				end
				if CombatBegin == 1 then
					Monster_Table = SearchRangeNPC(ctrl,500)
						for i = 1 , table.getn(Monster_Table) do
							if ReadRoleValue(Monster_Table[i],EM_RoleValue_OrgID) == 107463  then
							DelObj ( Monster_Table[i] )
							end
						end
					holeA = ReadRoleValue ( Boss , EM_RoleValue_Register1 )
					holeB = ReadRoleValue ( Boss , EM_RoleValue_Register2 )
					MonsterA = ReadRoleValue ( Boss , EM_RoleValue_Register3 )
					MonsterB = ReadRoleValue ( Boss , EM_RoleValue_Register4 )
					DelObj(MonsterA)
					DelObj(MonsterB)
					DelObj(hole1)
					DelObj(holeA)
					DelObj(holeB)
					P2Pick = 0
					hole1 = CreateObjByFlag(107464,781015,6,1)     --���ɵ��_   6
					SetModeEx(hole1,EM_SetModeType_Mark, false)
					SetModeEx(hole1,EM_SetModeType_HideName, false)
					SetModeEx(hole1,EM_SetModeType_NotShowHPMP, false)
					SetModeEx(hole1,EM_SetModeType_Strikback, false)
					SetModeEx(hole1,EM_SetModeType_Move, false)
					SetModeEx(hole1,EM_SetModeType_Fight, false)
					SetModeEx(hole1,EM_SetModeType_Searchenemy, false)
					SetModeEx(hole1,EM_SetModeType_Obstruct, false)
					AddToPartition( hole1, RoomID)								
					DelObj(hole2)
					local monster2 = ReadRoleValue(Ctrl,EM_RoleValue_Register10)                     ---��t�p��
					DelObj(monster2)
					delobj(boss)
					KS_ScriptMessage("[SC_106900_10]")    --[������������u�O�@�s�z�p���_�I�̡I�I�I]
					sleep(50)
					Boss=CreateObjByFlag(107462,781015,2,1)
					AddToPartition(Boss,RoomID)
					WriteRoleValue( Boss , EM_RoleValue_Register10 , hole1 )	
					WriteRoleValue(Boss,EM_RoleValue_PID,Ctrl)
					WriteRoleValue(Ctrl , EM_RoleValue_Register1 , Boss )
				monstertime = 0
				CombatBegin = 0 --�԰�����
				end
			end
			if ReadRoleValue(boss,EM_RoleValue_IsDead)== 1  then		--Boss���`	 
				for	i=1 , PlayerNum , 1	do
				PlayerID[i] = GetSearchResult()		
					if CheckAcceptQuest( PlayerID[i] , 425684 ) == true and   --�P�_���a�O�_��������
					CheckCompleteQuest( PlayerID[i] , 425684 ) ~= true and
					CheckFlag( PlayerID[i] , 547281 ) ~= true then		
					SetScriptFlag( PlayerID[i] , 547281 , 1 )	
					end
				end			
				DelObj(doorchick1)----�R�����
				DelObj(doorchick2)----�R���e��
				Delobj(hole1)	---�R�����_1
				if CombatBegin == 0 then
				KS_ScriptMessage("[SC_106900_08]")    --[�_�I�̡K�K�ڪ��k��N�浹�A�̤F�K�K]
				return
				end
				if CombatBegin == 1 then
				Monster_Table = SearchRangeNPC(ctrl,500)
					for i = 1 , table.getn(Monster_Table) do
						if ReadRoleValue(Monster_Table[i],EM_RoleValue_OrgID) == 107463  then
						DelObj ( Monster_Table[i] )
						end
					end
				monstertime = 0
				CombatBegin = 0 --�԰�����
				KS_ScriptMessage("[SC_106900_08]")    --[�_�I�̡K�K�ڪ��k��N�浹�A�̤F�K�K]
				return
				end
			end
		end
	end
end

function bico_Z24ez_Boss4_ai ()  --BossAI****************************
	local RoomID= ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local ctrl  = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local Boss  = OwnerID()
	local maxhp = ReadRoleValue(Boss,EM_RoleValue_MaxHP)
	local CombatBegin = 0
	local skilltime  = 0
	local Hp2  = ReadRoleValue(Boss,EM_RoleValue_HP)
	local Hp3  = (hp2 / maxhp) *100
	local rand = DW_rand(3)
	local monster = 0
	local P2Pick = 0
	local monstershow = CreateObjByFlag(107364,781015,6,1)
--	local hole1 = ReadRoleValue(Boss , EM_RoleValue_Register10 )
	LockHP( Boss,1,"" )	
	KS_ScriptMessage("[SC_106900_01]")    --[�ͩR���N�q�O�褣�L�ɶ����L���I�I�I��ԧa�I�_�I�̡I]	
	while 1 do
		sleep(10)
		skilltime=skilltime+1	
			if P2Pick ~= 1 then
			if skilltime % 15 == 0 then 	--�C15���ͤ@���]����
				KS_ScriptMessage("[SC_106900_04]")    --[���]���̧]���A�̪��ɶ��P�ͩR�a�I]
				monster = CreateObjByFlag(107463,781015,6,1)     --�p��  6
				AddToPartition ( monster , RoomID ) -----�⪫��[�J������
				SetModeEx(monster , EM_SetModeType_Searchenemy, false)   --������
				AddBuff( monster , 509476 , 0 , 0 )				--���^��
				WriteRoleValue(monster,EM_RoleValue_register1,Boss)
				BeginPlot(monster,"bico_zone24ez_MonsterAi",0)				
			end
			end
	--		if skilltime == 480 then
	--		AddBuff(boss,623667,0,-1)
	--		end
		local NowHp = ReadRoleValue(Boss,EM_RoleValue_HP)
		local Hp1 = (NowHp / maxhp) *100	
			if Hp1 >= 50 and P2Pick == 0 then                       			  --50%�H�e
				if skilltime % 6 ==0 then                              --6��@��rand3��
				KS_ScriptMessage("[SC_106900_02]")       --[�L�����_�I�̡I�Ψ������|�ڪ��j�N�a�I]
					while ReadRoleValue(Boss,EM_RoleValue_SpellMagicID)~=0 do --�ˬd�٦��S���b�I�k
					sleep(2)
					end
					local PlayerID = CL_RandHata_TargetTable( 0 , 3 ) ---Value_TanK�O�_�ƩZ0=���� 1=��    Play_Num�̧C�ݨD���a�ƶq�A���F���ƶq�h������X�{���ƶq
					if PlayerID == nil or PlayerID == 0 then
					PlayerID = {}
					end
					local Target_Num = table.getn( PlayerID )
					local rand = DW_rand(3)
						for i = 1,Target_Num do
							if rand == 1 then
							SyscastSpellLv( boss,PlayerID[i] ,499765,0 )
							sleep(10)
							elseif rand ==  2 then
							SysCastSpellLv( boss, PlayerID[i],499766,0 )
							sleep(10)
							elseif rand ==  3 then
							SysCastSpellLv( boss,PlayerID[i],499767,0 )
							sleep(10)
							end
						end
				elseif	skilltime % 13 ==0 then                   		     --13��I�����AE
					KS_ScriptMessage("[SC_106900_03]")    --[��ԡ��ԡI�A�̳��b�o���U�a�I]
					while ReadRoleValue(Boss,EM_RoleValue_SpellMagicID)~=0 do--�ˬd�٦��S���b�I�k
					sleep(2)
					end
				SysCastSpellLv(boss,boss,499874,0)
				end
			else
					if ReadRoleValue(boss,EM_RoleValue_HP)== 1 then
					SetModeEx(boss,EM_SetModeType_Strikback, false)
					SetModeEx(boss,EM_SetModeType_Move, false)
					SetModeEx(boss,EM_SetModeType_Fight, false)
					SetModeEx(boss,EM_SetModeType_Searchenemy, false)
					SyscastSpellLv(boss,boss,499774,0)
					AddBuff(boss,623544,0,0)							
					PlayMotion(Boss,ruFUSION_ACTORSTATE_DEAD)		
	 				WriteRoleValue(ctrl,EM_RoleValue_Register7,boss)
	 				WriteRoleValue(ctrl,EM_RoleValue_register2,1)
	 				return
	 				end
				AddBuff(Boss,623359,0,-1)
				if skilltime % 6 ==0 then                               	 --6��@��rand3��
					while ReadRoleValue(Boss,EM_RoleValue_SpellMagicID)~=0 do--�ˬd�٦��S���b�I�k
					sleep(2)
					end
					local PlayerID = CL_RandHata_TargetTable( 0 , 3 ) ---Value_TanK�O�_�ƩZ0=���� 1=��    Play_Num�̧C�ݨD���a�ƶq�A���F���ƶq�h������X�{���ƶq
					if PlayerID == nil or PlayerID == 0 then
					PlayerID = {}
					end
					local Target_Num = table.getn( PlayerID )
					local rand = DW_rand(3)
						for i = 1,Target_Num do
							if rand == 1 then
							SyscastSpellLv( boss,PlayerID[i] ,499767,5 )
							sleep(10)
							elseif rand ==  2 then
							SysCastSpellLv( boss, PlayerID[i],499766,5 )
					--		sleep(10)
					--		elseif rand ==  3 then
					--		SysCastSpellLv( boss,PlayerID[i],499765,5 )
							sleep(10)
							end
						end
				elseif	skilltime % 13 ==0 then                   		     --13��I�����AE
					while ReadRoleValue(Boss,EM_RoleValue_SpellMagicID)~=0 do--�ˬd�٦��S���b�I�k
					sleep(2)
					end
				SysCastSpellLv(boss,boss,499874,0)
				end
				if P2Pick == 0 then
				local hole1 = ReadRoleValue(Boss , EM_RoleValue_Register10 )
--				say( hole1 , "hole="..hole1 )

				CallPlot( hole1 ,"Z24ez_hole1_P2AI" , 0 )
				local holeA = CreateObjByFlag( 107440 , 781015 , 15 , 1 )			--A�յ��_
					SetModeEx(holeA,EM_SetModeType_Mark, false)
					SetModeEx(holeA,EM_SetModeType_HideName, false)
					SetModeEx(holeA,EM_SetModeType_NotShowHPMP, false)
					SetModeEx(holeA,EM_SetModeType_Strikback, false)
					SetModeEx(holeA,EM_SetModeType_Move, false)
					SetModeEx(holeA,EM_SetModeType_Fight, false)
					SetModeEx(holeA,EM_SetModeType_Searchenemy, false)
					SetModeEx(holeA,EM_SetModeType_Obstruct, false)
					AddToPartition( holeA, RoomID)
					WriteRoleValue( Boss , EM_RoleValue_Register1 , holeA )
					BeginPlot( holeA , "Z24ez_HoleA_AI" , 10 )
				local holeB =CreateObjByFlag( 107440 , 781015 , 16 , 1 )			--B�յ��_
					SetModeEx(holeB,EM_SetModeType_Mark, false)
					SetModeEx(holeB,EM_SetModeType_HideName, false)
					SetModeEx(holeB,EM_SetModeType_NotShowHPMP, false)
					SetModeEx(holeB,EM_SetModeType_Strikback, false)
					SetModeEx(holeB,EM_SetModeType_Move, false)
					SetModeEx(holeB,EM_SetModeType_Fight, false)
					SetModeEx(holeB,EM_SetModeType_Searchenemy, false)
					SetModeEx(holeB,EM_SetModeType_Obstruct, false)
					AddToPartition( holeB, RoomID)
					WriteRoleValue( Boss , EM_RoleValue_Register2 , holeB)
					BeginPlot( holeB , "Z24ez_HoleB_AI" , 10 )
				local MonsterA = CreateObjByFlag( 107439 , 781015 , 7 , 1 )		--A�p�ǰ_�l�I7��
					SetModeEx(MonsterA,EM_SetModeType_Show, false)
					SetModeEx(MonsterA,EM_SetModeType_Mark, false)
					SetModeEx(MonsterA,EM_SetModeType_HideName, false)
					SetModeEx(MonsterA,EM_SetModeType_NotShowHPMP, true)
					SetModeEx(MonsterA,EM_SetModeType_Strikback, false)
					SetModeEx(MonsterA,EM_SetModeType_Move, true)
					SetModeEx(MonsterA,EM_SetModeType_Fight, false)
					SetModeEx(MonsterA,EM_SetModeType_Searchenemy, false)
					SetModeEx(MonsterA,EM_SetModeType_Obstruct, false)
					SetModeEx(MonsterA,EM_SetModeType_Gravity,FALSE)
					SetModeEx(MonsterA,EM_SetModeType_AlignToSurface,FALSE)					
					AddToPartition( MonsterA, RoomID)
					MoveToFlagEnabled( MonsterA , false )
					WriteRoleValue( Boss , EM_RoleValue_Register3 , MonsterA )
					WriteRoleValue( holeA , EM_RoleValue_PID , MonsterA )
					BeginPlot( MonsterA , "Z24ez_monsterA_AI" , 0 )
				local MonsterB = CreateObjByFlag( 107438 , 781015 , 14 , 1 )		--B�p�ǰ_�l�I14��
					SetModeEx(MonsterB,EM_SetModeType_Show, false)
					SetModeEx(MonsterB,EM_SetModeType_Mark, false)
					SetModeEx(MonsterB,EM_SetModeType_HideName, false)
					SetModeEx(MonsterB,EM_SetModeType_NotShowHPMP, true)
					SetModeEx(MonsterB,EM_SetModeType_Strikback, false)
					SetModeEx(MonsterB,EM_SetModeType_Move, true)
					SetModeEx(MonsterB,EM_SetModeType_Fight, false)
					SetModeEx(MonsterB,EM_SetModeType_Searchenemy, false)
					SetModeEx(MonsterB,EM_SetModeType_Obstruct, false)
					SetModeEx(MonsterB,EM_SetModeType_Gravity,FALSE)
					SetModeEx(MonsterB,EM_SetModeType_AlignToSurface,FALSE)
					AddToPartition( MonsterB, RoomID)
					MoveToFlagEnabled( MonsterB , false )
					WriteRoleValue( Boss , EM_RoleValue_Register4 , MonsterB )
					WriteRoleValue( holeB , EM_RoleValue_PID , MonsterB )
					BeginPlot( MonsterB , "Z24ez_monsterB_AI" , 0 )
				P2Pick = 1
				end				
			end
	end
end

function bico_zone24ez_MonsterAi()  --�p��Ai***********************
	local Boss = ReadRoleValue(OwnerID(),EM_RoleValue_register1)
	local hate_table1 = HateListCount( Boss )
	local hate_table2 = HateListCount(OwnerID())
	local TempGID = 0
	local rand1 = rand(hate_table1)
		SysCastSpellLv(OwnerID(),OwnerID(),499876,0)		--�ɪŬ���
		SysCastSpellLv(OwnerID(),OwnerID(),499801,0)		--�ɥ��y�u
		TempGID = HateListInfo( Boss,rand1,EM_HateListInfoType_GItemID)    --Boss������H�N�@�Ӫ��a
		while 1 do
			sleep(10)
			if ReadRoleValue( TempGID , EM_RoleValue_IsDead)==1 or ReadRoleValue( TempGID , EM_RoleValue_IsPlayer )~=1 then --���a���`�Ϊ̿�ܨ��d��
				hate_table1 = HateListCount( Boss )
				TempGID = 0
				rand1 = rand(hate_table1)	
				TempGID = HateListInfo( Boss,rand1,EM_HateListInfoType_GItemID)				
			elseif ReadRoleValue( TempGID , EM_RoleValue_IsDead)==0 then  --��
				SetAttack( OwnerID(),TempGID )
				SysCastSpellLv( OwnerID(),TempGID,499800,0 )
				SysCastSpellLv(TempGID,OwnerID(),499799,0)
			end
		end	
end

function bico_Z24ezmonsterdie()
	CancelBuff(OwnerID(), 623519)
end

function bico_Z24ez_Hole2AI()
	local RoomID= ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local ctrl = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local boss = ReadRoleValue(ctrl,EM_RoleValue_PID)
	local doorchick1 = ReadRoleValue(ctrl,EM_RoleValue_Register9)
	local doorchick2 = ReadRoleValue(ctrl,EM_RoleValue_Register8)
	local monster2 = CreateObjByFlag(107364,781015,6,1)
	local holetime = 0
	local hole2 = OwnerID()
	hole2 = ReadRoleValue(ctrl,EM_RoleValue_Register6)  
	local monstercheck = 0
	while 1  do
 		sleep(10)
		holetime = holetime + 1 
			if holetime % 20 == 0 and monstercheck ==0 then
			 	monster2 = CreateObjByFlag(107364,781015,6,1)
				SetModeEx(monster2,EM_SetModeType_Mark, false)
				SetModeEx(monster2,EM_SetModeType_HideName, true)
				SetModeEx(monster2,EM_SetModeType_NotShowHPMP, true)
				SetModeEx(monster2,EM_SetModeType_Strikback, false)
				SetModeEx(monster2,EM_SetModeType_Move, true)
				SetModeEx(monster2,EM_SetModeType_Fight, false)
				SetModeEx(monster2,EM_SetModeType_Searchenemy, false)
				SetModeEx(monster2,EM_SetModeType_Obstruct, false)
				AddToPartition (monster2 , RoomID )
				KS_ScriptMessage("[SC_106900_09]")    --[�R��R��A��A��R���]
				DelObj(hole2)
				WriteRoleValue(ctrl,EM_RoleValue_Register10,monster2)
				WriteRoleValue(monster2,EM_RoleValue_PID,Ctrl)
				BeginPlot(monster2,"bico_Z24ez_monstershowAI",0)
				monstercheck = 1
			end
	end
end

function bico_Z24ez_monstershowAI()
	local monster2= OwnerID()
	local ctrl = ReadRoleValue(monster2,EM_RoleValue_PID)
--	say(ctrl,"ctrl")
	local boss = ReadRoleValue(ctrl,EM_RoleValue_register7)
	local x = ReadRoleValue(boss,EM_RoleValue_X)
	local y = ReadRoleValue(boss,EM_RoleValue_Y)
	local z = ReadRoleValue(boss,EM_RoleValue_Z)
	SysCastSpellLv(monster2,monster2,499857,0)
	WriteRoleValue(ctrl,EM_RoleValue_register7,1)     ---------�P�w�O�_�������ɾ_��
	MoveToFlagEnabled(monster2, false )
	local time = Move( monster2,x,y,z)*3.5
	DebugMsg(0,0,"time="..time)
	Sleep(time)
	DebugMsg(0,0,"timeout")
	SysCastSpellLv(boss,boss,499855,0)
	AddBuff(boss,623551,0,-1)
	CancelBuff(boss,623544)
	CancelBuff(boss,623726)
	CancelBuff(boss,623359)
	PlayMotion(boss,ruFUSION_ACTORSTATE_KNOCKDOWN_RECOVER)
	KS_ScriptMessage("[SC_106900_06]")   --[�o�K�K�O�K�K���ɪ��K�K�O�q�K�K]
	SetModeEx(boss,EM_SetModeType_Strikback, true)
	SetModeEx(boss,EM_SetModeType_Move, true)
	SetModeEx(boss,EM_SetModeType_Fight, true)
	SetModeEx(boss,EM_SetModeType_Searchenemy, true)
	KS_ScriptMessage("[SC_106900_07]")   --[�L�k�K�K�ۡK�K�ڡK�K����K�K]
	DelObj(monster2)
	LockHP( boss , 0 , "" )	
end

function bico_Z24ez_Bossround2AI()
	say(OwnerID(),"good")
end

function bico_z24ez_givecancelbuff()
	local player = {}
	player = SearchRangePlayer( OwnerID(), 300 )
--	say(OwnerID(),"me")
	if CheckBuff(OwnerID(),623551) == true then
	for i = 0,table.getn(player) do
		if CheckBuff( player[i], 623545 ) == true then
		DebugMsg(0,0,"player="..i)
		CancelBuff(player[i], 623545 )
		end
	end
	end
end

function Z24ez_107465_Treasure()
	SetPlot( OwnerID() ,"touch", "Z24_107465ez_Treasure_open" ,40 )
end

function Z24_107465ez_Treasure_open()
	SetPlot( TargetID() ,"touch", "" ,0 )
	Sleep(20)
	KillID( OwnerID() , TargetID() )
end

function Z24ez_mustdie_true()
	return true
end

function Z24ez_monsterA_AI()
	local own = OwnerID()
while 1 do 
sleep(10)
	LuaFunc_MoveToFlag( own , 781015 , 10 , 0 )
	LuaFunc_MoveToFlag( own , 781015 , 9 , 0 )
	LuaFunc_MoveToFlag( own , 781015 , 8 , 0 )
	LuaFunc_MoveToFlag( own , 781015 , 7 , 0 )
end
end

function Z24ez_monsterB_AI()
	local own = OwnerID()
while 1 do 
sleep(10)
	LuaFunc_MoveToFlag( own , 781015 , 11 , 0 )
	LuaFunc_MoveToFlag( own , 781015 , 12 , 0 )
	LuaFunc_MoveToFlag( own , 781015 , 13 , 0 )
	LuaFunc_MoveToFlag( own , 781015 , 14 , 0 )
end
end

function Z24ez_Boss_TimeLight_Player()	--�ˮ`��Boss�L��	
	local own =OwnerID()
	local tar =TargetID()
	local Boss = ReadRoleValue( tar , EM_RoleValue_OrgID )
	local Monster = ReadRoleValue( tar , EM_RoleValue_OrgID )
	local Ctrl = ReadRoleValue( tar , EM_RoleValue_OrgID )
	local Job = ReadRoleValue( tar , EM_RoleValue_VOC )
	if Job ==0 or Monster ==102642 or Boss == 107462 or own == tar or Monster == 107438 or Ctrl == 106101 or Monster == 107439 or Monster ==107400 or Monster ==107403 or Monster == 107401 or Monster == 107402 or Monster ==107440 then
	return false
	else
	return true
	end	
end

function Z24ez_Boss_TimeLight_Boss()	--�v���缾�a�S����
	local own =OwnerID()
	local tar =TargetID()
	local Boss = ReadRoleValue( tar , EM_RoleValue_OrgID )
	if Boss == 107462 then
	return true
	else
	return false
	end	
end

function Z24ez_HoleA_AI()
	local own = OwnerID()
	local MonsterA = ReadRoleValue ( own , EM_RoleValue_PID )
	SysCastSpellLv( own , MonsterA , 499768 , 0 )
while 1 do
sleep(5)
SysCastSpellLv( own , MonsterA , 850492 , 0 )
end
end

function Z24ez_HoleB_AI()
	local own = OwnerID()
	local MonsterB = ReadRoleValue ( own , EM_RoleValue_PID )
	SysCastSpellLv( own , MonsterB , 499768 , 0 )
while 1 do
sleep(5)
SysCastSpellLv( own , MonsterB , 850492 , 0 )
end
end

function Z24ez_hole1_P2AI()
	local own = OwnerID()
	while 1 do
	sleep(10)
	SysCastSpellLv( own , own , 499769 , 0 )
	end
end