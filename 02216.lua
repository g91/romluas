--Boss�X��&�z���y�X�� 780696
--���ת��P��X�� 780860 
--�諬�X�� 780877
--���l�X�� 780845
--�йv�X�� 780859
--Boss�s�� 105200
--�Ų��l�s�� 105201
--�����l�s�� 105202
--�����l�s�� 105203
--�e����ת��s�� 103044
--���k���ת��s�� 103085
function Dy_Z19_BOSS1_AIC()
	local roomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID) --Ū�X����b���@�h
	local madtime = 0
	local Fight --�԰��P�_
	local Fight1 = 0--��ܧP�_
	local Q3 --�諬�ˮ`�H��
	local ALLP_2 = {}
	local blue = {} --�Q�Ť��a ��
	local purple = {} --�_�ध�a ��
	local red = {} --�������a ��
	local Fwall = {} --�|�P������ 103044
	local dart_1 --�йv�z���y1
	local dart_2 --�йv�z���y2
	local BossDoor1 = 0 --�e��
	local BossDoor2 --���
	local Bossr
	local Boss = CreateObjByFlag( 105200 , 780696 , 1, 1 ) -- (BOSS�s��  ,�X�нs�� ��N���X�� �ͥX�X�ө�)
		WriteRoleValue( Boss, EM_RoleValue_PID, OwnerID()) --�N����g�JBoss
		WriteRoleValue( OwnerID(), EM_RoleValue_Register1, Boss) --�NBoss�g�J���
		AddToPartition( Boss , roomID )
		setplot( Boss , "dead" , "Dy_Z19_BOSS1_DEAD", 0)
		BeginPlot( Boss, "Dy_Z19_BOSS1_AI", 10) ---Boss���԰�Function (  BOSS BOSS��LUA_AI  ��\�C10=1��)
		BossDoor2 = CreateObjByFlag( 105253 , 780860 , 1, 1 ) --����X��1
		
		SetModeEx( BossDoor2 , EM_SetModeType_Show, true) ----�q�X
		SetModeEx( BossDoor2 , EM_SetModeType_Mark, false) ----�аO
		SetModeEx( BossDoor2 , EM_SetModeType_Strikback, false) ---����
		SetModeEx( BossDoor2 , EM_SetModeType_Move, false) ---����	
		SetModeEx( BossDoor2 , EM_SetModeType_Fight, false) ---�i���
		SetModeEx( BossDoor2 , EM_SetModeType_SearchenemyIgnore, true) ---���󤣷|�Q�j�M
		SetModeEx( BossDoor2 , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
		SetModeEx( BossDoor2 , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
		SetModeEx( BossDoor2 , EM_SetModeType_Searchenemy, false)  ---����
		SetModeEx( BossDoor2   , EM_SetModeType_Obstruct, true )--����
		AddToPartition( BossDoor2 , roomID )
		
		dart_1 = CreateObjByFlag( 105286 , 780696 , 2, 1 ) --�йv1
		WriteRoleValue( Boss, EM_RoleValue_Register3, dart_1)
		WriteRoleValue( dart_1, EM_RoleValue_Register3, Boss)
		
		SetModeEx( dart_1 , EM_SetModeType_Show, false) ----�q�X
		SetModeEx( dart_1 , EM_SetModeType_Mark, false) ----�аO
		SetModeEx( dart_1 , EM_SetModeType_Strikback, false) ---����
		SetModeEx( dart_1 , EM_SetModeType_Move, false) ---����	
		SetModeEx( dart_1 , EM_SetModeType_Fight, true) ---�i���
		SetModeEx( dart_1 , EM_SetModeType_SearchenemyIgnore, true) ---���󤣷|�Q�j�M
		SetModeEx( dart_1 , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
		SetModeEx( dart_1 , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
		SetModeEx( dart_1 , EM_SetModeType_Searchenemy, false)  ---����
		SetModeEx( dart_1   , EM_SetModeType_Obstruct, false )--����
		AddToPartition( dart_1 , roomID )

		dart_2 = CreateObjByFlag( 105286 , 780696 , 3, 1 ) --�йv2
		WriteRoleValue( Boss, EM_RoleValue_Register4, dart_2)
		WriteRoleValue( dart_2, EM_RoleValue_Register4, Boss)
		
		SetModeEx( dart_2 , EM_SetModeType_Show, false) ----�q�X
		SetModeEx( dart_2 , EM_SetModeType_Mark, false) ----�аO
		SetModeEx( dart_2 , EM_SetModeType_Strikback, false) ---����
		SetModeEx( dart_2 , EM_SetModeType_Move, false) ---����	
		SetModeEx( dart_2 , EM_SetModeType_Fight, true) ---�i���
		SetModeEx( dart_2 , EM_SetModeType_SearchenemyIgnore, true) ---���󤣷|�Q�j�M
		SetModeEx( dart_2 , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
		SetModeEx( dart_2 , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
		SetModeEx( dart_2 , EM_SetModeType_Searchenemy, false)  ---����
		SetModeEx( dart_2   , EM_SetModeType_Obstruct, false )--����
		AddToPartition( dart_2 , roomID )
		
		while 1 do
		sleep(10)
		Fight = ReadRoleValue(OwnerID(), EM_RoleValue_Register2) --�԰��P�_
		--say(OwnerID() , "Fight = "..Fight)
		if Fight == 1 then --Boss�԰���
			madtime = madtime + 1
			--say (OwnerID() , "madtime = "..madtime)
			if madtime == 480  then
				ScriptMessage( Boss, -1 , 2 , "[SC_105200_07] " , 2 )
				sleep(10)
				AddBuff ( Boss, 507744  , 0 , -1 )
				
				madtime = 0 
			end
			if Fight1 == 0 then
				ScriptMessage( OwnerID(), -1 , 2 , "[SC_105200_00] " , 2 )
				--�إX�e��
				BossDoor1 = CreateObjByFlag( 105253 , 780860 , 2, 1 ) --�e���X��2
				
				SetModeEx( BossDoor1 , EM_SetModeType_Show, true) ----�q�X
				SetModeEx( BossDoor1 , EM_SetModeType_Mark, false) ----�аO
				SetModeEx( BossDoor1 , EM_SetModeType_Strikback, false) ---����
				SetModeEx( BossDoor1 , EM_SetModeType_Move, false) ---����	
				SetModeEx( BossDoor1 , EM_SetModeType_Fight, false) ---�i���
				SetModeEx( BossDoor1 , EM_SetModeType_SearchenemyIgnore, true) ---���󤣷|�Q�j�M
				SetModeEx( BossDoor1 , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
				SetModeEx( BossDoor1 , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
				SetModeEx( BossDoor1 , EM_SetModeType_Searchenemy, false)  ---����
				SetModeEx( BossDoor1   , EM_SetModeType_Obstruct, true )--����
				AddToPartition( BossDoor1 , roomID )
				--�إX�|�P������ 103044
				for i = 4 , 7 ,1 do 
					Fwall[i-3] = CreateObjByFlag( 103044 , 780860 , i, 1 ) --�|�P������
					
					SetModeEx( Fwall[i-3] , EM_SetModeType_Show, true) ----�q�X
					SetModeEx( Fwall[i-3] , EM_SetModeType_Mark, false) ----�аO
					SetModeEx( Fwall[i-3] , EM_SetModeType_Strikback, false) ---����
					SetModeEx( Fwall[i-3] , EM_SetModeType_Move, false) ---����	
					SetModeEx( Fwall[i-3] , EM_SetModeType_Fight, false) ---�i���
					SetModeEx( Fwall[i-3] , EM_SetModeType_SearchenemyIgnore, true) ---���󤣷|�Q�j�M
					SetModeEx( Fwall[i-3] , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
					SetModeEx( Fwall[i-3] , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
					SetModeEx( Fwall[i-3] , EM_SetModeType_Searchenemy, false)  ---����
					SetModeEx( Fwall[i-3]   , EM_SetModeType_Obstruct, true )--����		
					AddToPartition( Fwall[i-3] , roomID )
				end
				
				--�إX�_�ध�a -��
				for i = 1 , 3 ,1 do 
					purple[i] = CreateObjByFlag( 105286 , 780877 , i, 1 ) --�Ŧ��ζˮ`
					
					SetModeEx( purple[i] , EM_SetModeType_Show, false) ----�q�X
					SetModeEx( purple[i] , EM_SetModeType_Mark, false) ----�аO
					SetModeEx( purple[i] , EM_SetModeType_Strikback, false) ---����
					SetModeEx( purple[i] , EM_SetModeType_Move, false) ---����	
					SetModeEx( purple[i] , EM_SetModeType_Fight, false) ---�i���
					SetModeEx( purple[i] , EM_SetModeType_SearchenemyIgnore, true) ---���󤣷|�Q�j�M
					SetModeEx( purple[i] , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
					SetModeEx( purple[i] , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
					SetModeEx( purple[i] , EM_SetModeType_Searchenemy, false)  ---����
					SetModeEx( purple[i]   , EM_SetModeType_Obstruct, false )--����	
					AddToPartition( purple[i] , roomID )					
					AddBuff ( purple[i], 508613, 0, -1 )
				end
				
				--�إX�Q�Ť��a -��
				for i = 4 , 6 ,1 do 
					blue[i-3] = CreateObjByFlag( 105286 , 780877 , i, 1 ) --�����ζˮ`
					
					SetModeEx( blue[i-3] , EM_SetModeType_Show, false) ----�q�X
					SetModeEx( blue[i-3] , EM_SetModeType_Mark, false) ----�аO
					SetModeEx( blue[i-3] , EM_SetModeType_Strikback, false) ---����
					SetModeEx( blue[i-3] , EM_SetModeType_Move, false) ---����	
					SetModeEx( blue[i-3] , EM_SetModeType_Fight, false) ---�i���
					SetModeEx( blue[i-3] , EM_SetModeType_SearchenemyIgnore, true) ---���󤣷|�Q�j�M
					SetModeEx( blue[i-3] , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
					SetModeEx( blue[i-3] , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
					SetModeEx( blue[i-3] , EM_SetModeType_Searchenemy, false)  ---����
					SetModeEx( blue[i-3]   , EM_SetModeType_Obstruct, false )--����
					AddToPartition( blue[i-3] , roomID )
					AddBuff ( blue[i-3] , 508611, 0, -1 )
					end
				
				--�إX�������a -��
				for i = 7 , 9 ,1 do
					red[i-6] = CreateObjByFlag( 105286 , 780877 , i, 1 ) --�����ζˮ`
					SetModeEx( red[i-6] , EM_SetModeType_Show, false) ----�q�X
					SetModeEx( red[i-6] , EM_SetModeType_Mark, false) ----�аO
					SetModeEx( red[i-6] , EM_SetModeType_Strikback, false) ---����
					SetModeEx( red[i-6] , EM_SetModeType_Move, false) ---����	
					SetModeEx( red[i-6] , EM_SetModeType_Fight, false) ---�i���
					SetModeEx( red[i-6] , EM_SetModeType_SearchenemyIgnore, true) ---���󤣷|�Q�j�M
					SetModeEx( red[i-6] , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
					SetModeEx( red[i-6] , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
					SetModeEx( red[i-6] , EM_SetModeType_Searchenemy, false)  ---����
					SetModeEx( red[i-6]   , EM_SetModeType_Obstruct, false )--����
					AddToPartition( red[i-6] , roomID )
					AddBuff ( red[i-6] , 508925, 0, -1 )

				end
				
				--��������a
				local ALLP = SetSearchAllPlayer(RoomID ) --�j�M�������a
				for i = 1 , ALLP ,1 do --�⪱�a��J�E�c��ϰ�
					local PID = GetSearchResult()
					if ReadRoleValue( PID , EM_RoleValue_IsDead ) ~= 1 and --�S��
					ReadRoleValue( PID, EM_RoleValue_VOC) ~= 0  and --���OGM
					ReadRoleValue( PID , EM_RoleValue_RoomID  ) == RoomID then --�b�P�h
					SetPosByFlag( PID , 780877 , 2 ) --����쥿����
					end
				end
				Fight1 = 1 
			end

		elseif Fight == 2 then --���a����
			ScriptMessage( OwnerID(), -1 , 2 , "[SC_105200_09]" , 2 )
			DelObj ( Boss )
			DelObj ( BossDoor1 )
			DelObj ( dart_1 )
			DelObj ( dart_2 )
			for i = 1 , 3 , 1 do
				
				DelObj ( blue[i] )
				DelObj ( purple[i] )
				DelObj ( red[i] )
				
			end
			for i = 1 , 4 ,1 do
				DelObj (Fwall[i])
			end
			--say(OwnerID() , "Boss again")
			sleep(50)
			Boss =CreateObjByFlag( 105200 , 780696 , 1, 1 ) -- (BOSS�s��  ,�X�нs�� ��N���X�� �ͥX�X�ө�)
			WriteRoleValue( Boss, EM_RoleValue_PID, OwnerID()) --�N����g�JBoss
			WriteRoleValue( OwnerID(), EM_RoleValue_Register1, Boss) --�NBoss�g�J���
			AddToPartition( Boss , roomID )
			setplot( Boss , "dead" , "Dy_Z19_BOSS1_DEAD", 0) --���`�@��
			BeginPlot( Boss, "Dy_Z19_BOSS1_AI", 10) ---Boss���԰�Function (  BOSS BOSS��LUA_AI  ��\�C10=1��)
			--say(Boss,"123")
			Fight = 0 
			Fight1 = 0
			WriteRoleValue( OwnerID(), EM_RoleValue_Register2, Fight)
			
			dart_1 = CreateObjByFlag( 105286 , 780696 , 2, 1 ) --�йv1
			WriteRoleValue( Boss, EM_RoleValue_Register3, dart_1)
			WriteRoleValue( dart_1, EM_RoleValue_Register3, Boss)
			
			SetModeEx( dart_1 , EM_SetModeType_Show, false) ----�q�X
			SetModeEx( dart_1 , EM_SetModeType_Mark, false) ----�аO
			SetModeEx( dart_1 , EM_SetModeType_Strikback, false) ---����
			SetModeEx( dart_1 , EM_SetModeType_Move, false) ---����	
			SetModeEx( dart_1 , EM_SetModeType_Fight, true) ---�i���
			SetModeEx( dart_1 , EM_SetModeType_SearchenemyIgnore, true) ---���󤣷|�Q�j�M
			SetModeEx( dart_1 , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
			SetModeEx( dart_1 , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
			SetModeEx( dart_1 , EM_SetModeType_Searchenemy, false)  ---����
			SetModeEx( dart_1   , EM_SetModeType_Obstruct, false )--����
			AddToPartition( dart_1 , roomID )
			
			dart_2 = CreateObjByFlag( 105286 , 780696 , 3, 1 ) --�йv2
			WriteRoleValue( Boss, EM_RoleValue_Register4, dart_2)
			WriteRoleValue( dart_2, EM_RoleValue_Register4, Boss)
			
			SetModeEx( dart_2 , EM_SetModeType_Show, false) ----�q�X
			SetModeEx( dart_2 , EM_SetModeType_Mark, false) ----�аO
			SetModeEx( dart_2 , EM_SetModeType_Strikback, false) ---����
			SetModeEx( dart_2 , EM_SetModeType_Move, false) ---����	
			SetModeEx( dart_2 , EM_SetModeType_Fight, true) ---�i���
			SetModeEx( dart_2 , EM_SetModeType_SearchenemyIgnore, true) ---���󤣷|�Q�j�M
			SetModeEx( dart_2 , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
			SetModeEx( dart_2 , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
			SetModeEx( dart_2 , EM_SetModeType_Searchenemy, false)  ---����
			SetModeEx( dart_2   , EM_SetModeType_Obstruct, false )--����
			AddToPartition( dart_2 , roomID )

				
			madtime = 0 
		elseif Fight == 3 then --Boss���`
			--DeBugMSG(0,0,"����1 = "..BossDoor1) 
			--DeBugMSG(0,0,"����2 = "..dart_1)
			--DeBugMSG(0,0,"����3 = "..dart_2)
			if checkID(BossDoor1) ~= nil then
				DelObj ( BossDoor1 )
				DelObj ( BossDoor2 )
			end
			
			if checkID(dart_1) ==true then
				DelObj ( dart_1 )
			end
			
			if checkID(dart_2) ==true then
				DelObj ( dart_2 )
			end
			--DeBugMSG(0,0,"�z�a...�Sbreak���O����")
			break
		elseif Fight == 4 then --�����ϰ쪺��ζˮ`�H��
			ScriptMessage( Boss, -1 , 2 , "[SC_105200_11] " , 2 )
			Q3 = Rand(4)
			if Q3 == 0 then --2
				--�إX�_�ध�a -�� P-B �� B-C �� R-A
				for i = 1 , 3 ,1 do 
					AddBuff ( purple[i], 508613, 0, -1 )
					--�R��508613�H�~��Buff--
					if CheckBuff(purple[i],  508611 ) == true then
						CancelBuff( purple[i] ,  508611 ) --�R���Ŧ�B-A
						--say (TargetID() , "P_B")
					else
					
					end
					if CheckBuff( TargetID() ,  509171 ) == true then
						CancelBuff( TargetID() ,  509171 ) --�R���Ŧ�B-B
						--say (TargetID() , "P_B")
					else
					
					end
					if CheckBuff( purple[i] ,  509173 ) == true then
						CancelBuff( purple[i] ,  509173  ) --�R���Ŧ�B-C
						--say (TargetID() , "P_B")
					else
					
					end
					if CheckBuff(purple[i] ,  509166 ) == true then
						CancelBuff( purple[i] ,  509166 ) --�R������P-A
						--say (TargetID() , "P_B")
					else
					
					end
					if CheckBuff( purple[i] ,  509168 ) == true then
						CancelBuff( purple[i] ,  509168 ) --�R������P-C
						--say (TargetID() , "P_B")
					else
					
					end
					if CheckBuff( purple[i] ,  509164 ) == true then
						CancelBuff( purple[i] ,  509164 ) --�R������R-A
						--say (TargetID() , "P_B")
					else
					
					end
					if CheckBuff( purple[i] ,  509162 ) == true then
						CancelBuff( purple[i] ,  509162 ) --�R������R-B
						--say (TargetID() , "P_B")
					else
					
					end
					if CheckBuff( purple[i] ,  508925 ) == true then
						CancelBuff(purple[i] ,  508925 ) --�R������R-C
						--say (TargetID() , "P_B")
					else
					
					end
					--
					AddBuff ( blue[i] , 509173 , 0, -1 )
					--�R��509173�H�~��Buff--
					if CheckBuff( blue[i] ,  508611 ) == true then
						CancelBuff( blue[i] ,  508611 ) --�R���Ŧ�B-A
						--say (TargetID() , "B_C")
					else
					
					end
					if CheckBuff( blue[i] ,  509171 ) == true then
						CancelBuff( blue[i] ,  509171 ) --�R���Ŧ�B-B
						--say (TargetID() , "B_C")
					else
					
					end
					if CheckBuff( blue[i] ,  509166 ) == true then
						CancelBuff( blue[i] ,  509166 ) --�R������P-A
						--say (TargetID() , "B_C")
					else
					
					end
					if CheckBuff( blue[i] ,  508613 ) == true then
						CancelBuff( blue[i] ,  508613 ) --�R������P-B
						--say (TargetID() , "B_C")
					else
					
					end
					if CheckBuff( blue[i] ,  509168 ) == true then
						CancelBuff( blue[i] ,  509168 ) --�R������P-C
						--say (TargetID() , "B_C")
					else
					
					end
					if CheckBuff( blue[i] ,  509164 ) == true then
						CancelBuff( blue[i] ,  509164 ) --�R������R-A
						--say (TargetID() , "B_C")
					else
					
					end
					if CheckBuff( blue[i] ,  509162 ) == true then
						CancelBuff( blue[i],  509162 ) --�R������R-B
						--say (TargetID() , "B_C")
					else
					
					end
					if CheckBuff( blue[i] ,  508925 ) == true then
						CancelBuff( blue[i] ,  508925 ) --�R������R-C
						--say (TargetID() , "B_C")
					else
					
					end					
					--
					AddBuff ( red[i] , 509164, 0, -1 )
					----�R��509164�H�~��Buff--
					if CheckBuff( red[i]  ,  508611 ) == true then
						CancelBuff( red[i] ,  508611 ) --�R���Ŧ�B-A
						--say (TargetID() , "R_A")
					else
					
					end
					if CheckBuff( red[i] ,  509171 ) == true then
						CancelBuff( red[i]  ,  509171 ) --�R���Ŧ�B-B
						--say (TargetID() , "R_A")
					else
					
					end
					if CheckBuff( red[i]  ,  509173 ) == true then
						CancelBuff( red[i]  ,  509173  ) --�R���Ŧ�B-C
						--say (TargetID() , "R_A")
					else
					
					end
					if CheckBuff( red[i]  ,  509166 ) == true then
						CancelBuff( red[i]  ,  509166 ) --�R������P-A
						--say (TargetID() , "R_A")
					else
					
					end
					if CheckBuff( red[i]  ,  508613 ) == true then
						CancelBuff( red[i]  ,  508613 ) --�R������P-B
						--say (TargetID() , "R_A")
					else
					
					end
					if CheckBuff(red[i]  ,  509168 ) == true then
						CancelBuff( red[i]  ,  509168 ) --�R������P-C
						--say (TargetID() , "R_A")
					else
					
					end
					if CheckBuff( red[i]  ,  509162 ) == true then
						CancelBuff( red[i]  ,  509162 ) --�R������R-B
						--say (TargetID() , "R_A")
					else
					
					end
					if CheckBuff( red[i]  ,  508925 ) == true then
						CancelBuff( red[i]  ,  508925 ) --�R������R-C
						--say (TargetID() , "R_A")
					else
					
					end					
					--
				end
				
			elseif Q3 == 1 then --4
				--�إX�_�ध�a -�� P-A �� B-B �� R-C
				for i = 1 , 3 ,1 do 
					AddBuff ( purple[i], 509166, 0, -1 )
				--�R��509166�H�~��Buff--
					if CheckBuff( purple[i] ,  508611 ) == true then
						CancelBuff(purple[i] ,  508611 ) --�R���Ŧ�B-A
						--say ( TargetID() , "P_A")
					else
					
					end
					if CheckBuff( purple[i] ,  509171 ) == true then
						CancelBuff( purple[i] ,  509171 ) --�R���Ŧ�B-B
						--say (TargetID() , "P_A")
					else
					
					end
					if CheckBuff(purple[i] ,  509173 ) == true then
						CancelBuff( purple[i] ,  509173  ) --�R���Ŧ�B-C
						--say (TargetID() , "P_A")
					else
					
					end
					if CheckBuff( purple[i] ,  508613 ) == true then
						CancelBuff( purple[i] ,  508613 ) --�R������P-B
						--say (TargetID() , "P_A")
					else
					
					end
					if CheckBuff( purple[i] ,  509168 ) == true then
						CancelBuff( purple[i] ,  509168 ) --�R������P-C
						--say (TargetID() , "P_A")
					else
					
					end
					if CheckBuff( purple[i] ,  509164 ) == true then
						CancelBuff( purple[i] ,  509164 ) --�R������R-A
						--say (TargetID() , "P_A")
					else
					
					end
					if CheckBuff( purple[i] ,  509162 ) == true then
						CancelBuff( purple[i] ,  509162 ) --�R������R-B
						--say (TargetID() , "P_A")
					else
					
					end
					if CheckBuff( purple[i] ,  508925 ) == true then
						CancelBuff(purple[i] ,  508925 ) --�R������R-C
						--say (TargetID() , "P_A")
					else
					
					end
				--
					AddBuff ( blue[i] , 509171 , 0, -1 )
					--�R��509171�H�~��Buff--
						if CheckBuff( blue[i] ,  508611 ) == true then
							CancelBuff( blue[i] ,  508611 ) --�R���Ŧ�B-A
							--say (TargetID() , "B_B")
						else
						
						end
						if CheckBuff( blue[i] ,  509173 ) == true then
							CancelBuff( blue[i] ,  509173  ) --�R���Ŧ�B-C
							--say (TargetID() , "B_B")
						else
						
						end
						if CheckBuff( blue[i] ,  509166 ) == true then
							CancelBuff( blue[i] ,  509166 ) --�R������P-A
							--say (TargetID() , "B_B")
						else
						
						end
						if CheckBuff( blue[i] ,  508613 ) == true then
							CancelBuff( blue[i] ,  508613 ) --�R������P-B
							--say (TargetID() , "B_B")
						else
						
						end
						if CheckBuff( blue[i] ,  509168 ) == true then
							CancelBuff( blue[i] ,  509168 ) --�R������P-C
							--say (TargetID() , "B_B")
						else
						
						end
						if CheckBuff( blue[i] ,  509164 ) == true then
							CancelBuff( blue[i] ,  509164 ) --�R������R-A
							--say (TargetID() , "B_B")
						else
						
						end
						if CheckBuff( blue[i] ,  509162 ) == true then
							CancelBuff( blue[i],  509162 ) --�R������R-B
							--say (TargetID() , "B_B")
						else
						
						end
						if CheckBuff( blue[i] ,  508925 ) == true then
							CancelBuff( blue[i] ,  508925 ) --�R������R-C
							--say (TargetID() , "B_B")
						else
						
						end
					--
					AddBuff ( red[i] , 508925, 0, -1 )
					--�R��508925�H�~��Buff--
						if CheckBuff( red[i] ,  508611 ) == true then
							CancelBuff( red[i] ,  508611 ) --�R���Ŧ�B-A
							--say (TargetID() , "R_C")
						else
						
						end
						if CheckBuff( red[i] ,  509171 ) == true then
							CancelBuff( red[i] ,  509171 ) --�R���Ŧ�B-B
							--say (TargetID() , "R_C")
						else
						
						end
						if CheckBuff( red[i] ,  509173 ) == true then
							CancelBuff( red[i] ,  509173  ) --�R���Ŧ�B-C
							--say (TargetID() , "R_C")
						else
						
						end
						if CheckBuff( red[i] ,  509166 ) == true then
							CancelBuff( red[i] ,  509166 ) --�R������P-A
							--say (TargetID() , "R_C")
						else
						
						end
						if CheckBuff( red[i] ,  508613 ) == true then
							CancelBuff( red[i] ,  508613 ) --�R������P-B
							--say (TargetID() , "R_C")
						else
						
						end
						if CheckBuff( red[i] ,  509168 ) == true then
							CancelBuff( red[i] ,  509168 ) --�R������P-C
							--say (TargetID() , "R_C")
						else
						
						end
						if CheckBuff( red[i] ,  509164 ) == true then
							CancelBuff( red[i] ,  509164 ) --�R������R-A
							--say (TargetID() , "R_C")
						else
						
						end
						if CheckBuff( red[i] ,  509162 ) == true then
							CancelBuff( red[i] ,  509162 ) --�R������R-B
							--say (TargetID() , "R_C")
						else
						
						end
					--
				end
				
			elseif Q3 == 2 then --3
				--�إX�_�ध�a -�� P-A �� B-C �� R-B
				for i = 1 , 3 ,1 do 
					AddBuff ( purple[i], 509166, 0, -1 )
				--�R��509166�H�~��Buff--
					if CheckBuff( purple[i] ,  508611 ) == true then
						CancelBuff(purple[i] ,  508611 ) --�R���Ŧ�B-A
						--say ( TargetID() , "P_A")
					else
					
					end
					if CheckBuff( purple[i] ,  509171 ) == true then
						CancelBuff( purple[i] ,  509171 ) --�R���Ŧ�B-B
						--say (TargetID() , "P_A")
					else
					
					end
					if CheckBuff(purple[i] ,  509173 ) == true then
						CancelBuff( purple[i] ,  509173  ) --�R���Ŧ�B-C
						--say (TargetID() , "P_A")
					else
					
					end
					if CheckBuff( purple[i] ,  508613 ) == true then
						CancelBuff( purple[i] ,  508613 ) --�R������P-B
						--say (TargetID() , "P_A")
					else
					
					end
					if CheckBuff( purple[i] ,  509168 ) == true then
						CancelBuff( purple[i] ,  509168 ) --�R������P-C
						--say (TargetID() , "P_A")
					else
					
					end
					if CheckBuff( purple[i] ,  509164 ) == true then
						CancelBuff( purple[i] ,  509164 ) --�R������R-A
					--�R��509164�H�~��Buff--
						if CheckBuff( red[i]  ,  508611 ) == true then
							CancelBuff( red[i] ,  508611 ) --�R���Ŧ�B-A
							--say (TargetID() , "R_A")
						else
						
						end
						if CheckBuff( red[i] ,  509171 ) == true then
							CancelBuff( red[i]  ,  509171 ) --�R���Ŧ�B-B
							--say (TargetID() , "R_A")
						else
						
						end
						if CheckBuff( red[i]  ,  509173 ) == true then
							CancelBuff( red[i]  ,  509173  ) --�R���Ŧ�B-C
							--say (TargetID() , "R_A")
						else
						
						end
						if CheckBuff( red[i]  ,  509166 ) == true then
							CancelBuff( red[i]  ,  509166 ) --�R������P-A
							--say (TargetID() , "R_A")
						else
						
						end
						if CheckBuff( red[i]  ,  508613 ) == true then
							CancelBuff( red[i]  ,  508613 ) --�R������P-B
							--say (TargetID() , "R_A")
						else
						
						end
						if CheckBuff(red[i]  ,  509168 ) == true then
							CancelBuff( red[i]  ,  509168 ) --�R������P-C
							--say (TargetID() , "R_A")
						else
						
						end
						if CheckBuff( red[i]  ,  509162 ) == true then
							CancelBuff( red[i]  ,  509162 ) --�R������R-B
							--say (TargetID() , "R_A")
						else
						
						end
						if CheckBuff( red[i]  ,  508925 ) == true then
							CancelBuff( red[i]  ,  508925 ) --�R������R-C
							--say (TargetID() , "R_A")
						else
						
						end
						--say (TargetID() , "P_A")
					else
					
					end
					if CheckBuff( purple[i] ,  509162 ) == true then
						CancelBuff( purple[i] ,  509162 ) --�R������R-B
						--say (TargetID() , "P_A")
					else
					
					end
					if CheckBuff( purple[i] ,  508925 ) == true then
						CancelBuff(purple[i] ,  508925 ) --�R������R-C
						--say (TargetID() , "P_A")
					else
					
					end
				--
					AddBuff ( blue[i] , 509173 , 0, -1 )
					--�R��509173�H�~��Buff--
					if CheckBuff( blue[i] ,  508611 ) == true then
						CancelBuff( blue[i] ,  508611 ) --�R���Ŧ�B-A
						--say (TargetID() , "B_C")
					else
					
					end
					if CheckBuff( blue[i] ,  509171 ) == true then
						CancelBuff( blue[i] ,  509171 ) --�R���Ŧ�B-B
						--say (TargetID() , "B_C")
					else
					
					end
					if CheckBuff( blue[i] ,  509166 ) == true then
						CancelBuff( blue[i] ,  509166 ) --�R������P-A
						--say (TargetID() , "B_C")
					else
					
					end
					if CheckBuff( blue[i] ,  508613 ) == true then
						CancelBuff( blue[i] ,  508613 ) --�R������P-B
						--say (TargetID() , "B_C")
					else
					
					end
					if CheckBuff( blue[i] ,  509168 ) == true then
						CancelBuff( blue[i] ,  509168 ) --�R������P-C
						--say (TargetID() , "B_C")
					else
					
					end
					if CheckBuff( blue[i] ,  509164 ) == true then
						CancelBuff( blue[i] ,  509164 ) --�R������R-A
						--say (TargetID() , "B_C")
					else
					
					end
					if CheckBuff( blue[i] ,  509162 ) == true then
						CancelBuff( blue[i],  509162 ) --�R������R-B
						--say (TargetID() , "B_C")
					else
					
					end
					if CheckBuff( blue[i] ,  508925 ) == true then
						CancelBuff( blue[i] ,  508925 ) --�R������R-C
						--say (TargetID() , "B_C")
					else
					
					end					
					--
					AddBuff ( red[i] , 509162, 0, -1 )
					--�R��509162�H�~��Buff--
						if CheckBuff( red[i] ,  508611 ) == true then
							CancelBuff( red[i] ,  508611 ) --�R���Ŧ�B-A
							--say (TargetID() , "R_B")
						else
						
						end
						if CheckBuff( red[i] ,  509171 ) == true then
							CancelBuff( red[i] ,  509171 ) --�R���Ŧ�B-B
							--say (TargetID() , "R_B")
						else
						
						end
						if CheckBuff( red[i] ,  509173 ) == true then
							CancelBuff( red[i] ,  509173  ) --�R���Ŧ�B-C
							--say (TargetID() , "R_B")
						else
						
						end
						if CheckBuff( red[i] ,  509166 ) == true then
							CancelBuff( red[i] ,  509166 ) --�R������P-A
							--say (TargetID() , "R_B")
						else
						
						end
						if CheckBuff( red[i] ,  508613 ) == true then
							CancelBuff( red[i] ,  508613 ) --�R������P-B
							--say (TargetID() , "R_B")
						else
						
						end
						if CheckBuff( red[i] ,  509168 ) == true then
							CancelBuff( red[i] ,  509168 ) --�R������P-C
							--say (TargetID() , "R_B")
						else
						
						end
						if CheckBuff( red[i] ,  509164 ) == true then
							CancelBuff( red[i] ,  509164 ) --�R������R-A
							--say (TargetID() , "R_B")
						else
						
						end
						if CheckBuff( red[i] ,  508925 ) == true then
							CancelBuff( red[i] ,  508925 ) --�R������R-C
							--say (TargetID() , "R_B")
						else
						
						end
					--
				end
				
			elseif Q3 == 3 then --5
				--�إX�_�ध�a -�� P-C �� B-B �� R-A
				for i = 1 , 3 ,1 do 
					AddBuff ( purple[i], 509168, 0, -1 )
					--�R��509168�H�~��Buff--
						if CheckBuff( purple[i] ,  508611 ) == true then
							CancelBuff( purple[i] ,  508611 ) --�R���Ŧ�B-A
							--say (TargetID() , "P_C")
						else
						
						end
						if CheckBuff( purple[i] ,  509171 ) == true then
							CancelBuff( purple[i] ,  509171 ) --�R���Ŧ�B-B
							--say (TargetID() , "P_C")
						else
						
						end
						if CheckBuff( purple[i] ,  509173 ) == true then
							CancelBuff( purple[i] ,  509173  ) --�R���Ŧ�B-C
							--say (TargetID() , "P_C")
						else
						
						end
						if CheckBuff( purple[i] ,  509166 ) == true then
							CancelBuff( purple[i] ,  509166 ) --�R������P-A
							--say (TargetID() , "P_C")
						else
						
						end
						if CheckBuff( purple[i] ,  508613 ) == true then
							CancelBuff( purple[i] ,  508613 ) --�R������P-B
							--say (TargetID() , "P_C")
						else
						
						end
						if CheckBuff( purple[i] ,  509164 ) == true then
							CancelBuff( purple[i] ,  509164 ) --�R������R-A
							--say (TargetID() , "P_C")
						else
						
						end
						if CheckBuff( purple[i] ,  509162 ) == true then
							CancelBuff( purple[i] ,  509162 ) --�R������R-B
							--say (TargetID() , "P_C")
						else
						
						end
						if CheckBuff( purple[i] ,  508925 ) == true then
							CancelBuff( purple[i] ,  508925 ) --�R������R-C
							--say (TargetID() , "P_C")
						else
						
						end
					--
					AddBuff ( blue[i] , 509171 , 0, -1 )
				--�R��509171�H�~��Buff--
					if CheckBuff( blue[i] ,  508611 ) == true then
						CancelBuff( blue[i] ,  508611 ) --�R���Ŧ�B-A
						--say (TargetID() , "B_B")
					else
					
					end
					if CheckBuff( blue[i] ,  509173 ) == true then
						CancelBuff( blue[i] ,  509173  ) --�R���Ŧ�B-C
						--say (TargetID() , "B_B")
					else
					
					end
					if CheckBuff( blue[i] ,  509166 ) == true then
						CancelBuff( blue[i] ,  509166 ) --�R������P-A
						--say (TargetID() , "B_B")
					else
					
					end
					if CheckBuff( blue[i] ,  508613 ) == true then
						CancelBuff( blue[i] ,  508613 ) --�R������P-B
						--say (TargetID() , "B_B")
					else
					
					end
					if CheckBuff( blue[i] ,  509168 ) == true then
						CancelBuff( blue[i] ,  509168 ) --�R������P-C
						--say (TargetID() , "B_B")
					else
					
					end
					if CheckBuff( blue[i] ,  509164 ) == true then
						CancelBuff( blue[i] ,  509164 ) --�R������R-A
						--say (TargetID() , "B_B")
					else
					
					end
					if CheckBuff( blue[i] ,  509162 ) == true then
						CancelBuff( blue[i],  509162 ) --�R������R-B
						--say (TargetID() , "B_B")
					else
					
					end
					if CheckBuff( blue[i] ,  508925 ) == true then
						CancelBuff( blue[i] ,  508925 ) --�R������R-C
						--say (TargetID() , "B_B")
					else
					
					end
				--
					AddBuff ( red[i] , 509164, 0, -1 )
					----�R��509164�H�~��Buff--
					if CheckBuff( red[i]  ,  508611 ) == true then
						CancelBuff( red[i] ,  508611 ) --�R���Ŧ�B-A
						--say (TargetID() , "R_A")
					else
					
					end
					if CheckBuff( red[i] ,  509171 ) == true then
						CancelBuff( red[i]  ,  509171 ) --�R���Ŧ�B-B
						--say (TargetID() , "R_A")
					else
					
					end
					if CheckBuff( red[i]  ,  509173 ) == true then
						CancelBuff( red[i]  ,  509173  ) --�R���Ŧ�B-C
						--say (TargetID() , "R_A")
					else
					
					end
					if CheckBuff( red[i]  ,  509166 ) == true then
						CancelBuff( red[i]  ,  509166 ) --�R������P-A
						--say (TargetID() , "R_A")
					else
					
					end
					if CheckBuff( red[i]  ,  508613 ) == true then
						CancelBuff( red[i]  ,  508613 ) --�R������P-B
						--say (TargetID() , "R_A")
					else
					
					end
					if CheckBuff(red[i]  ,  509168 ) == true then
						CancelBuff( red[i]  ,  509168 ) --�R������P-C
						--say (TargetID() , "R_A")
					else
					
					end
					if CheckBuff( red[i]  ,  509162 ) == true then
						CancelBuff( red[i]  ,  509162 ) --�R������R-B
						--say (TargetID() , "R_A")
					else
					
					end
					if CheckBuff( red[i]  ,  508925 ) == true then
						CancelBuff( red[i]  ,  508925 ) --�R������R-C
						--say (TargetID() , "R_A")
					else
					
					end					
					--					
				end

			elseif Q3 == 4 then --6
				--�إX�_�ध�a -�� P-C ��B-A ��R-B
				for i = 1 , 3 ,1 do 
					AddBuff ( purple[i], 509168, 0, -1 )
					--�R��509168�H�~��Buff--
						if CheckBuff( purple[i] ,  508611 ) == true then
							CancelBuff( purple[i] ,  508611 ) --�R���Ŧ�B-A
							--say (TargetID() , "P_C")
						else
						
						end
						if CheckBuff( purple[i] ,  509171 ) == true then
							CancelBuff( purple[i] ,  509171 ) --�R���Ŧ�B-B
							--say (TargetID() , "P_C")
						else
						
						end
						if CheckBuff( purple[i] ,  509173 ) == true then
							CancelBuff( purple[i] ,  509173  ) --�R���Ŧ�B-C
							--say (TargetID() , "P_C")
						else
						
						end
						if CheckBuff( purple[i] ,  509166 ) == true then
							CancelBuff( purple[i] ,  509166 ) --�R������P-A
							--say (TargetID() , "P_C")
						else
						
						end
						if CheckBuff( purple[i] ,  508613 ) == true then
							CancelBuff( purple[i] ,  508613 ) --�R������P-B
							--say (TargetID() , "P_C")
						else
						
						end
						if CheckBuff( purple[i] ,  509164 ) == true then
							CancelBuff( purple[i] ,  509164 ) --�R������R-A
							--say (TargetID() , "P_C")
						else
						
						end
						if CheckBuff( purple[i] ,  509162 ) == true then
							CancelBuff( purple[i] ,  509162 ) --�R������R-B
							--say (TargetID() , "P_C")
						else
						
						end
						if CheckBuff( purple[i] ,  508925 ) == true then
							CancelBuff( purple[i] ,  508925 ) --�R������R-C
							--say (TargetID() , "P_C")
						else
						
						end
					--
					AddBuff ( blue[i] , 508611 , 0, -1 )
				--�R��508611�H�~��Buff--
					if CheckBuff( blue[i] ,  509171 ) == true then
						CancelBuff( blue[i] ,  509171 ) --�R���Ŧ�B-B
						--say (TargetID() , "B_A")
					else
					
					end
					if CheckBuff( blue[i] ,  509173 ) == true then
						CancelBuff( blue[i] ,  509173  ) --�R���Ŧ�B-C
						--say (TargetID() , "B_A")
					else
					
					end
					if CheckBuff( blue[i] ,  509166 ) == true then
						CancelBuff( blue[i] ,  509166 ) --�R������P-A
						--say (TargetID() , "B_A")
					else
					
					end
					if CheckBuff( blue[i] ,  508613 ) == true then
						CancelBuff( blue[i] ,  508613 ) --�R������P-B
						--say (TargetID() , "B_A")
					else
					
					end
					if CheckBuff( blue[i] ,  509168 ) == true then
						CancelBuff( blue[i] ,  509168 ) --�R������P-C
						--say (TargetID() , "B_A")
					else
					
					end
					if CheckBuff( blue[i] ,  509164 ) == true then
						CancelBuff( Tblue[i] ,  509164 ) --�R������R-A
						--say (TargetID() , "B_A")
					else
					
					end
					if CheckBuff( blue[i] ,  509162 ) == true then
						CancelBuff( blue[i] ,  509162 ) --�R������R-B
						--say (TargetID() , "B_A")
					else
					
					end
					if CheckBuff( blue[i] ,  508925 ) == true then
						CancelBuff( blue[i],  508925 ) --�R������R-C
						--say (TargetID() , "B_A")
					else
					
					end
				--
					AddBuff ( red[i] , 509162, 0, -1 )
					--�R��509162�H�~��Buff--
						if CheckBuff( red[i] ,  508611 ) == true then
							CancelBuff( red[i] ,  508611 ) --�R���Ŧ�B-A
							--say (TargetID() , "R_B")
						else
						
						end
						if CheckBuff( red[i] ,  509171 ) == true then
							CancelBuff( red[i] ,  509171 ) --�R���Ŧ�B-B
							--say (TargetID() , "R_B")
						else
						
						end
						if CheckBuff( red[i] ,  509173 ) == true then
							CancelBuff( red[i] ,  509173  ) --�R���Ŧ�B-C
							--say (TargetID() , "R_B")
						else
						
						end
						if CheckBuff( red[i] ,  509166 ) == true then
							CancelBuff( red[i] ,  509166 ) --�R������P-A
							--say (TargetID() , "R_B")
						else
						
						end
						if CheckBuff( red[i] ,  508613 ) == true then
							CancelBuff( red[i] ,  508613 ) --�R������P-B
							--say (TargetID() , "R_B")
						else
						
						end
						if CheckBuff( red[i] ,  509168 ) == true then
							CancelBuff( red[i] ,  509168 ) --�R������P-C
							--say (TargetID() , "R_B")
						else
						
						end
						if CheckBuff( red[i] ,  509164 ) == true then
							CancelBuff( red[i] ,  509164 ) --�R������R-A
							--say (TargetID() , "R_B")
						else
						
						end
						if CheckBuff( red[i] ,  508925 ) == true then
							CancelBuff( red[i] ,  508925 ) --�R������R-C
							--say (TargetID() , "R_B")
						else
						
						end
					--
				end
			end
		end
	end
end




 	