function Lua_apon_Zone122_TimerGate_AI_1() --�e�q
	local Check_String = 0 ---�P�_���Цr���
	while 1 do
		sleep(10)
		WriteRoleValue( OwnerID(), EM_RoleValue_Register1,0) ---�ت��Ω󭫸m
		WriteRoleValue( OwnerID(), EM_RoleValue_Register2,0)
		WriteRoleValue( OwnerID(), EM_RoleValue_Register3,0)
		WriteRoleValue( OwnerID(), EM_RoleValue_Register4,0)
		WriteRoleValue( OwnerID(), EM_RoleValue_Register5,0)
		WriteRoleValue( OwnerID(), EM_RoleValue_Register6,0)
		WriteRoleValue( OwnerID(), EM_RoleValue_Register7,0)
		WriteRoleValue( OwnerID(), EM_RoleValue_Register8,0)
		WriteRoleValue( OwnerID(), EM_RoleValue_Register9,0)
		WriteRoleValue( OwnerID(), EM_RoleValue_PID,0)
		
		local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		local Door = 103064 ----���Ϊ�
		local TimerGate_Boss = 103056 ---����AI
		
		--local Flag_Key_gate = 780524 ----���Ŧ�۬W��   
		local Flag_lastdoor = 780524 ---�̫᪺���ת�
		local Flag_Door = 780525 ----�C�@�����Ϊ�
		--local Flag_TimerGate_Boss = 780526 ---����AI ���X��
		--local Flag_TimerGate_Keydoor = 780526
		local Flag_Fin_door = 780526 --- �̫᪺�]�k��
		local Flag_Gate_Boss = 780527 ---- ������Boss �X�� --- 1 = �Ĥ@�� �� 2= �ĤG�� 
		local Flag_Gate_Boos_door = 780528 ---����Boss �ⰼ���� 1 2 = �Ĥ@�� �A 3 4 = �ĤG��
		
		local Table_Door = {}
		-----1. �o�{�i�äH���Iĵ�� �I ĵ�� �I     2. �ĤH�J�I�F�Iĵ�١Iĵ�١I 3. �ĤH�b���H�֧�L��X�ӡI  
		local All_String_1 = {"[SC_102969_12]","[SC_102969_13]","[SC_102969_14]"}
		
		for i = 1 , 7, 1 do ----�ͪ����j��
			--say(OwnerID(),"i="..i)
			Table_Door[i] = CreateObjByFlag( Door , Flag_Door , i , 1 )
			WriteRoleValue( Table_Door[i], EM_RoleValue_PID,OwnerID())
			--WriteRoleValue( OwnerID(), EM_RoleValue_Register[i], Table_Door[i])
			SetModeEx(Table_Door[i] , EM_SetModeType_Strikback , false )--����
			--SetModeEx(Table_Door[i] , EM_SetModeType_Show , false )--�q�X
			SetModeEx(Table_Door[i] , EM_SetModeType_Searchenemy , false )--����
			SetModeEx( Table_Door[i] , EM_SetModeType_Fight, false) ----�i�������
			SetModeEx( Table_Door[i] , EM_SetModeType_Mark, false) ----�аO
			SetModeEx( Table_Door[i] , EM_SetModeType_SearchenemyIgnore, false) ---���󤣷|�Q�j�M
			SetModeEx( Table_Door[i] , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
			SetModeEx( Table_Door[i] , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
			SetModeEx( Table_Door[i] , EM_SetModeType_Gravity, true) ----���O
			SetModeEx( Table_Door[i] , EM_SetModeType_ShowRoleHead, false) ----������Y����
			SetModeEx( Table_Door[i] , EM_SetModeType_AlignToSurface, false) ----�K����
			SetModeEx( Table_Door[i] , EM_SetModeType_Move, false) ----����
			AddToPartition( Table_Door[i],roomid1 )
			--BeginPlot( Table_Door[i] , "Lua_apon_Zone122_TimerGate_1",5 )
			SetPlot( Table_Door[i] , "Collision" , "Lua_apon_Zone122_TimerGate_1_1" , 10 ) ----�I���@���A�Ұ����Ϊ��ͤp��
		end
		
		local Check_FinDoor = CreateObjByFlag( Door , Flag_Fin_door , 2 , 1 )
		SetModeEx(Check_FinDoor , EM_SetModeType_Strikback , false )--����
		SetModeEx(Check_FinDoor , EM_SetModeType_Searchenemy , false )--����
		SetModeEx( Check_FinDoor , EM_SetModeType_Fight, false) ----�i�������
		SetModeEx( Check_FinDoor , EM_SetModeType_Mark, false) ----�аO
		SetModeEx( Check_FinDoor , EM_SetModeType_SearchenemyIgnore, false) ---���󤣷|�Q�j�M
		SetModeEx( Check_FinDoor , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
		SetModeEx( Check_FinDoor , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
		SetModeEx( Check_FinDoor , EM_SetModeType_Gravity, true) ----���O
		SetModeEx( Check_FinDoor , EM_SetModeType_ShowRoleHead, false) ----������Y����
		SetModeEx( Check_FinDoor , EM_SetModeType_AlignToSurface, false) ----�K����
		SetModeEx( Check_FinDoor , EM_SetModeType_Move, false) ----����
		AddToPartition( Check_FinDoor,roomid1 )
		table.insert( Table_Door , Check_FinDoor )
		SetPlot( Check_FinDoor , "Collision" , "Lua_apon_Zone122_CheckFindoor" , 0 ) ----�I���@���A�����۬W�W������
		BeginPlot( Check_FinDoor , "Lua_apon_Zone122_CheckFin",10 )
		
		local Boss_1 = CreateObjByFlag( 103088 , Flag_Gate_Boss , 1 , 1 )
		AddToPartition( Boss_1,roomid1 )
		BeginPlot( Boss_1 , "Lua_apon_Zone122_Gate_1_1",5 )
		SetPlot(Boss_1,"dead","Lua_apon_Zone122_Gate_Dead_1_1",10 )
		WriteRoleValue( OwnerID(), EM_RoleValue_Register3, Boss_1)
		
		local Boss_2 = CreateObjByFlag( 103089 , Flag_Gate_Boss , 2 , 1 )
		AddToPartition( Boss_2,roomid1 )
		BeginPlot( Boss_2 , "Lua_apon_Zone122_Gate_2_1",5 )
		SetPlot(Boss_2,"dead","Lua_apon_Zone122_Gate_Dead_1_1",10 )
		WriteRoleValue( OwnerID(), EM_RoleValue_Register4, Boss_2)
		
		local Gate_1 = CreateObj( 114342 , -2272 , 615 , 1723 , 358 ,1) ---�Ŧ�۬W
		SetModeEx(Gate_1 , EM_SetModeType_Strikback , false )--����
		SetModeEx(Gate_1 , EM_SetModeType_Searchenemy , false )--����
		SetModeEx( Gate_1 , EM_SetModeType_Fight, false) ----�i�������
		SetModeEx( Gate_1 , EM_SetModeType_Mark, true) ----�аO
		SetModeEx( Gate_1 , EM_SetModeType_SearchenemyIgnore, false) ---���󤣷|�Q�j�M
		SetModeEx( Gate_1 , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
		SetModeEx( Gate_1 , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
		SetModeEx( Gate_1 , EM_SetModeType_Gravity, false) ----���O
		SetModeEx( Gate_1 , EM_SetModeType_ShowRoleHead, false) ----������Y����
		SetModeEx( Gate_1 , EM_SetModeType_AlignToSurface, false) ----�K����
		SetModeEx( Gate_1 , EM_SetModeType_Move, false) ----����
		AddToPartition( Gate_1,roomid1 )
		BeginPlot( Gate_1 , "Lua_apon_Runwar_3",10 )
		WriteRoleValue( OwnerID(), EM_RoleValue_Register5, Gate_1)
		WriteRoleValue( Gate_1, EM_RoleValue_Register1, OwnerID())
		
		local Gate_2 = CreateObj( 114343 , -2272 , 615 , 1659 , 358 ,1 ) ---����۬W
		SetModeEx(Gate_2 , EM_SetModeType_Strikback , false )--����
		SetModeEx(Gate_2 , EM_SetModeType_Searchenemy , false )--����
		SetModeEx( Gate_2 , EM_SetModeType_Fight, false) ----�i�������
		SetModeEx( Gate_2 , EM_SetModeType_Mark, true) ----�аO
		SetModeEx( Gate_2 , EM_SetModeType_SearchenemyIgnore, false) ---���󤣷|�Q�j�M
		SetModeEx( Gate_2 , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
		SetModeEx( Gate_2 , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
		SetModeEx( Gate_2 , EM_SetModeType_Gravity, false) ----���O
		SetModeEx( Gate_2 , EM_SetModeType_ShowRoleHead, false) ----������Y����
		SetModeEx( Gate_2 , EM_SetModeType_AlignToSurface, false) ----�K����
		SetModeEx( Gate_2 , EM_SetModeType_Move, false) ----����
		AddToPartition( Gate_2,roomid1 )
		BeginPlot( Gate_2 , "Lua_apon_Runwar_4",10 )
		WriteRoleValue( OwnerID(), EM_RoleValue_Register6, Gate_2)
		WriteRoleValue( Gate_2, EM_RoleValue_Register1, OwnerID())
		
		local last_door = CreateObjByFlag( 103516 , Flag_lastdoor , 1 , 1 ) ---���ת�
		SetModeEx(last_door , EM_SetModeType_Strikback , false )--����
		SetModeEx(last_door , EM_SetModeType_Searchenemy , false )--����
		SetModeEx( last_door , EM_SetModeType_Fight, false) ----�i�������
		SetModeEx( last_door , EM_SetModeType_Mark, false) ----�аO
		SetModeEx( last_door , EM_SetModeType_SearchenemyIgnore, false) ---���󤣷|�Q�j�M
		SetModeEx( last_door , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
		SetModeEx( last_door , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
		SetModeEx( last_door , EM_SetModeType_Gravity, false) ----���O
		SetModeEx( last_door , EM_SetModeType_ShowRoleHead, false) ----������Y����
		SetModeEx( last_door , EM_SetModeType_AlignToSurface, false) ----�K����
		SetModeEx( last_door , EM_SetModeType_Move, false) ----����
		SetModeEx( last_door   , EM_SetModeType_Obstruct, true )--����
		AddToPartition( last_door,roomid1 )
		WriteRoleValue( OwnerID(), EM_RoleValue_Register9, last_door)
		--SetDefIdleMotion( last_door,ruFUSION_MIME_ACTIVATE_LOOP)------�ɤW��	
		
		local Check_start = 0 ----�@�������a�}�ҸI���@���A�h�}�l�w�ɱ��y
		local Check_Begin = 0 ----���y�}�l
		local Check_Counter = 0
		local String_Counter = 0 ----�r�ꪺ�ɶ��A���Ӯɶ����h����ܴ� string
		local String_Counter_1 = 0
		local String_key = 0 ---�P�_�n�έ��@�ӵ��Ū�String
		local Door_op = 0
		local Check_ALL_OP = 0
		local Check_run_1 = 0 ---�Ŧ�۬W�P�_��
		local Check_run_2 = 0 ---����۬W�P�_��
		local Check_table_1 = {}
		while 1 do 
			sleep(10)
			Check_start = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
			Check_Counter = Check_Counter + 1
			--say(OwnerID(),"Check_Counter =="..Check_Counter)
			--DeBugMsg(0,0,"Check_Counter =="..Check_Counter )	
			String_Counter = String_Counter + 1
			String_Counter_1 = String_Counter_1 + 1
			
			------------�P�_���I���A�O�_�n���ͥΪ��A���I���n���]�k���ӧe�{--------------------------------
			Check_run_1 = ReadRoleValue(OwnerID(),EM_RoleValue_Register7)
			Check_run_2 = ReadRoleValue(OwnerID(),EM_RoleValue_Register8)
			
			if Check_run_1 == 1 and Check_run_2 == 1 and Check_String == 0 then
				--if Check_String == 0 then
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_102969_25]" , 1 )----���M�@�ѯ�q�q��Ǫ��۬W��«�F�X�� .....
					Check_String = 1
				--end
				for i = 1 , 8 , 1 do ---�ͥX���Ӳפ�l�L���S�Ĳy
					local Over_Ball = CreateObjByFlag( 103056 , 780529 , i , 1 )
					SetModeEx(Over_Ball , EM_SetModeType_Strikback , false )--����
					SetModeEx(Over_Ball , EM_SetModeType_Searchenemy , false )--����
					SetModeEx( Over_Ball , EM_SetModeType_Fight, true) ----�i�������
					SetModeEx( Over_Ball , EM_SetModeType_Mark, false) ----�аO
					SetModeEx( Over_Ball , EM_SetModeType_SearchenemyIgnore, false) ---���󤣷|�Q�j�M
					SetModeEx( Over_Ball , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
					SetModeEx( Over_Ball , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
					SetModeEx( Over_Ball , EM_SetModeType_Gravity, false) ----���O
					SetModeEx( Over_Ball , EM_SetModeType_ShowRoleHead, false) ----������Y����
					SetModeEx( Over_Ball , EM_SetModeType_AlignToSurface, false) ----�K����
					SetModeEx( Over_Ball , EM_SetModeType_Move, false) ----����
					SetModeEx( Over_Ball , EM_SetModeType_Obstruct, false) ----����
					AddToPartition( Over_Ball,roomid1 )
					WriteRoleValue(Over_Ball, EM_RoleValue_Livetime,60)---�]�k���b120���A�h�|����
					BeginPlot( Over_Ball, "Lua_apon_Over_Ball_1", 0)
				end
				
				----------�ͥX�@�D�]�k���A���װl�L�A���|���_���I��d��k�N�A�p�G���o�Ӫk�N���Ǫ��A�h�|���d�b��a�A�åB30���A�R���C
				local Fin_Door = CreateObjByFlag( 102460 , Flag_Fin_door , 1 , 1 )
				SetModeEx(Fin_Door , EM_SetModeType_Strikback , false )--����
				SetModeEx(Fin_Door , EM_SetModeType_Searchenemy , false )--����
				SetModeEx( Fin_Door , EM_SetModeType_Fight, true) ----�i�������
				SetModeEx( Fin_Door , EM_SetModeType_Mark, false) ----�аO
				SetModeEx( Fin_Door , EM_SetModeType_SearchenemyIgnore, false) ---���󤣷|�Q�j�M
				SetModeEx( Fin_Door , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
				SetModeEx( Fin_Door , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
				SetModeEx( Fin_Door , EM_SetModeType_Gravity, true) ----���O
				SetModeEx( Fin_Door , EM_SetModeType_ShowRoleHead, false) ----������Y����
				SetModeEx( Fin_Door , EM_SetModeType_AlignToSurface, false) ----�K����
				SetModeEx( Fin_Door , EM_SetModeType_Move, false) ----����
				SetModeEx( Fin_Door , EM_SetModeType_Obstruct, false) ----����
				AddToPartition( Fin_Door,roomid1 )
				WriteRoleValue(Fin_Door, EM_RoleValue_Livetime,120)---�]�k���b120���A�h�|����
				--BeginPlot( Fin_Door, "Lua_apon_Runwar_findoor", 10)
				
				local Fin_Door_2 = ReadRoleValue( OwnerID() , EM_RoleValue_Register9 )
				--SetModeEx( Fin_Door_2   , EM_SetModeType_Obstruct, false )--����
				--SetDefIdleMotion(Fin_Door_2,ruFUSION_MIME_IDLE_STAND)----�U�h
				Delobj(Fin_Door_2)

				for i = 1 , table.getn(Table_Door) , 1 do
					WriteRoleValue( Table_Door[i], EM_RoleValue_Register4, 1)
					local D1 = ReadRoleValue(Table_Door[i],EM_RoleValue_Register5)
					sleep(10)
					Delobj(D1)
				end
				local D_1 = ReadRoleValue( OwnerID() , EM_RoleValue_Register3 )
				local D_2 = ReadRoleValue( OwnerID() , EM_RoleValue_Register4 )
				WriteRoleValue( D_1, EM_RoleValue_Register9, 1)
				WriteRoleValue( D_1, EM_RoleValue_Livetime, 5)
				WriteRoleValue( D_2, EM_RoleValue_Register9, 1)
				WriteRoleValue( D_2, EM_RoleValue_Livetime, 5)
				
				Delobj(OwnerID())
			end
			----------------------------------------------------------------------------------------------------------------------------
			
			if Check_start == 1 and Check_Begin == 0 then
				Check_Begin = 1
				Check_Counter = 0
				String_Counter = 0
				ScriptMessage( OwnerID() , -1 , 1 , All_String_1[1] , 1 )
			end
			
			if Check_Begin == 1 and String_Counter >= 30 then
				local String_luck = Rand(3)+1
				ScriptMessage( OwnerID() , -1 , 1 , All_String_1[String_luck] , 1 )
				String_Counter = 0
			end
			
			if Check_Begin == 1 and Check_Counter >= 15 then ----���y�U�O�����S�����a
				Check_Counter = 0
				
				local Check_table = {} ---�b��������d�򪺪��a
				local Check_num = 0
				local Check_all = {}
				
				for i = 1 , table.getn(Table_Door) , 1 do
					Check_table_1 = {}
					Check_table = SearchRangePlayer( Table_Door[i] , 400 )---�Z���n�令400
					for i = 0 , table.getn(Check_table)-1, 1 do ----�]�� SearchRangePlayer �����ޭȬO�q 0 �}�l�]�A�b�̫᭱�|�A��@�� [ -1 ] �I�I�ҥH�A�h�@�ӷs��Table
						if ReadRoleValue( Check_table[i] , EM_RoleValue_IsDead) ~= 1 then
							table.insert( Check_table_1 , Check_table[i] )
						end
					end
					
					--DeBugMsg(0,0,"Check_table_1  =="..table.getn(Check_table_1))
					
					for i = 1 , table.getn(Check_table_1), 1 do 
						if ReadRoleValue( Check_table_1[i] , EM_RoleValue_IsDead) == 1 and ReadRoleValue( Check_table_1[i] , EM_RoleValue_RoomID  ) == roomid1 then
							table.remove ( Check_table_1 , i)
							--say(Check_table_1[i],"1111111")
						elseif ReadRoleValue( Check_table_1[i], EM_RoleValue_VOC) == 0 and ReadRoleValue( Check_table_1[i] , EM_RoleValue_RoomID  ) == roomid1 then
							table.remove ( Check_table_1 , i)
							--say(Check_table_1[i],"22222222")
						end	
					end
					sleep(10)
					
					--DeBugMsg(0,0,"Check_table_1 _ 2 =="..table.getn(Check_table_1))
					Check_num = table.getn(Check_table_1)
					sleep(10)
					table.insert( Check_all , Check_num )
					Check_num = 0
				end
				
				--DeBugMsg(0,0,"Check_all =="..table.getn(Check_all))
				
				for i = 1 , table.getn(Check_all) , 1 do
					Door_op = Check_all[i]
					
					--DeBugMsg(0,0,"Door_op =="..Door_op)
					
					Check_ALL_OP = ReadRoleValue(OwnerID(),EM_RoleValue_Register2)
					local Add_op = Check_ALL_OP + Door_op
					--DeBugMsg(0,0,"Add_op =="..Add_op)
					WriteRoleValue( OwnerID(), EM_RoleValue_Register2, Add_op)
					Check_ALL_OP = ReadRoleValue(OwnerID(),EM_RoleValue_Register2)
					--DeBugMsg(0,0,"Check_ALL_OP ="..Check_ALL_OP)
				end
				Check_ALL_OP = ReadRoleValue(OwnerID(),EM_RoleValue_Register2)
				if Check_ALL_OP <= 0 then ---���m���m
					for i = 1 , table.getn(Table_Door) , 1 do
						WriteRoleValue( Table_Door[i], EM_RoleValue_Register3,1)
					end
					
					local D_1 = ReadRoleValue( OwnerID() , EM_RoleValue_Register3 )
					local D_2 = ReadRoleValue( OwnerID() , EM_RoleValue_Register4 )
					local D_3 = ReadRoleValue( OwnerID() , EM_RoleValue_Register5 )
					local D_4 = ReadRoleValue( OwnerID() , EM_RoleValue_Register6 )
					local D_5 = ReadRoleValue( OwnerID() , EM_RoleValue_Register9 )
					--Delobj(D_1)
					--Delobj(D_2)
					sleep(10)
					WriteRoleValue( D_1, EM_RoleValue_Register9, 1)
					WriteRoleValue( D_2, EM_RoleValue_Register9, 1)
					Delobj(D_3)
					Delobj(D_4)
					Delobj(D_5)
					sleep(50)
					--DeBugMsg(0,0,"Return Start !!!!")
					break ----���P�󭫶]�o��funtion ���m�F 
					--Delobj(OwnerID())
				elseif Check_ALL_OP > 0 then
					WriteRoleValue( OwnerID(), EM_RoleValue_Register2, 0)
				end
			end
		end
	end
end

function Lua_apon_Zone122_Gate_1_1() ---�p Boos �@��
	--SetPlot(OwnerID(),"dead","Lua_apon_Zone122_TimerGate_Boss_Dead_1",10 )
	local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Flag_Gate_Boos_door = 780528 ---����Boss �ⰼ���� 1 2 = �Ĥ@�� �A 3 4 = �ĤG��
	local Door = 102460
	local Start_war = 0 
	local Counter_1 = 0
	local Counter_2 = 0
	local Counter_3 = 0
	local Counter_4 = 0
	local Check_Re = 0 ---���m��
	while 1 do 
		sleep(10)
		Check_Re = ReadRoleValue( OwnerID() , EM_RoleValue_Register9 )
		if Check_Re == 1 then
			WriteRoleValue( OwnerID(), EM_RoleValue_Register9, 0)
			local D_1 = ReadRoleValue( OwnerID() , EM_RoleValue_Register1 )
			local D_2 = ReadRoleValue( OwnerID() , EM_RoleValue_Register2 )
			Delobj(D_1)
			Delobj(D_2)
			--WriteRoleValue(OwnerID(), EM_RoleValue_Livetime,5)
			Delobj(OwnerID())
		end
		
		if HateListCount( OwnerID() ) ~= 0 then
			Counter_1 = Counter_1 + 1 
			Counter_2 = Counter_2 + 1
			Counter_3 = Counter_3 + 1
			Counter_4 = Counter_4 + 1
			
			if Start_war == 0 then ----�N�ⰼ�������ͥX��
				Start_war = 1
				local Door_1 = CreateObjByFlag( Door , Flag_Gate_Boos_door , 1 , 1 )
				SetModeEx(Door_1 , EM_SetModeType_Strikback , false )--����
				SetModeEx(Door_1 , EM_SetModeType_Searchenemy , false )--����
				SetModeEx( Door_1 , EM_SetModeType_Fight, false) ----�i�������
				SetModeEx( Door_1 , EM_SetModeType_Mark, false) ----�аO
				SetModeEx( Door_1 , EM_SetModeType_SearchenemyIgnore, false) ---���󤣷|�Q�j�M
				SetModeEx( Door_1 , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
				SetModeEx( Door_1 , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
				SetModeEx( Door_1 , EM_SetModeType_Gravity, true) ----���O
				SetModeEx( Door_1 , EM_SetModeType_ShowRoleHead, false) ----������Y����
				SetModeEx( Door_1 , EM_SetModeType_AlignToSurface, false) ----�K����
				SetModeEx( Door_1 , EM_SetModeType_Move, false) ----����
				SetModeEx( Door_1 , EM_SetModeType_Obstruct, true) ----����
				AddToPartition( Door_1,roomid1 )
				WriteRoleValue( OwnerID(), EM_RoleValue_Register1, Door_1)
				
				local Door_2 = CreateObjByFlag( Door , Flag_Gate_Boos_door , 2 , 1 )
				SetModeEx(Door_2 , EM_SetModeType_Strikback , false )--����
				SetModeEx(Door_2 , EM_SetModeType_Searchenemy , false )--����
				SetModeEx( Door_2 , EM_SetModeType_Fight, false) ----�i�������
				SetModeEx( Door_2 , EM_SetModeType_Mark, false) ----�аO
				SetModeEx( Door_2 , EM_SetModeType_SearchenemyIgnore, false) ---���󤣷|�Q�j�M
				SetModeEx( Door_2 , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
				SetModeEx( Door_2 , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
				SetModeEx( Door_2 , EM_SetModeType_Gravity, true) ----���O
				SetModeEx( Door_2 , EM_SetModeType_ShowRoleHead, false) ----������Y����
				SetModeEx( Door_2 , EM_SetModeType_AlignToSurface, false) ----�K����
				SetModeEx( Door_2 , EM_SetModeType_Move, false) ----����
				SetModeEx( Door_2 , EM_SetModeType_Obstruct, true) ----����
				AddToPartition( Door_2,roomid1 )
				WriteRoleValue( OwnerID(), EM_RoleValue_Register2, Door_2)
				
			end
			
		else 
			if Start_war == 1 then
				--say(OwnerID(),"OVER_1")
				local D_1 = ReadRoleValue( OwnerID() , EM_RoleValue_Register1 )
				local D_2 = ReadRoleValue( OwnerID() , EM_RoleValue_Register2 )
				Delobj(D_1)
				Delobj(D_2)
				--WriteRoleValue(OwnerID(), EM_RoleValue_Livetime,5)
				Delobj(OwnerID())
			end
		end
	end
end

function Lua_apon_Zone122_Gate_2_1() ---�p Boos �G��
	--SetPlot(OwnerID(),"dead","Lua_apon_Zone122_TimerGate_Boss_Dead_1",10 )
	local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Flag_Gate_Boos_door = 780528 ---����Boss �ⰼ���� 1 2 = �Ĥ@�� �A 3 4 = �ĤG��
	local Door = 102460
	local Start_war = 0 
	local Counter_1 = 0
	local Counter_2 = 0
	local Counter_3 = 0
	local Counter_4 = 0
	local Check_Re --- ���m��
	while 1 do 
		sleep(10)
		Check_Re = ReadRoleValue( OwnerID() , EM_RoleValue_Register9 )
		if Check_Re == 1 then
			WriteRoleValue( OwnerID(), EM_RoleValue_Register9, 0)
			local D_1 = ReadRoleValue( OwnerID() , EM_RoleValue_Register1 )
			local D_2 = ReadRoleValue( OwnerID() , EM_RoleValue_Register2 )
			Delobj(D_1)
			Delobj(D_2)
			--WriteRoleValue(OwnerID(), EM_RoleValue_Livetime,5)
			Delobj(OwnerID())
		end
		
		if HateListCount( OwnerID() ) ~= 0 then
			Counter_1 = Counter_1 + 1 
			Counter_2 = Counter_2 + 1
			Counter_3 = Counter_3 + 1
			Counter_4 = Counter_4 + 1
			
			if Start_war == 0 then ----�N�ⰼ�������ͥX��
				Start_war = 1
				local Door_1 = CreateObjByFlag( Door , Flag_Gate_Boos_door , 3 , 1 )
				SetModeEx(Door_1 , EM_SetModeType_Strikback , false )--����
				SetModeEx(Door_1 , EM_SetModeType_Searchenemy , false )--����
				SetModeEx( Door_1 , EM_SetModeType_Fight, false) ----�i�������
				SetModeEx( Door_1 , EM_SetModeType_Mark, false) ----�аO
				SetModeEx( Door_1 , EM_SetModeType_SearchenemyIgnore, false) ---���󤣷|�Q�j�M
				SetModeEx( Door_1 , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
				SetModeEx( Door_1 , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
				SetModeEx( Door_1 , EM_SetModeType_Gravity, true) ----���O
				SetModeEx( Door_1 , EM_SetModeType_ShowRoleHead, false) ----������Y����
				SetModeEx( Door_1 , EM_SetModeType_AlignToSurface, false) ----�K����
				SetModeEx( Door_1 , EM_SetModeType_Move, false) ----����
				SetModeEx( Door_1 , EM_SetModeType_Obstruct, true) ----����
				AddToPartition( Door_1,roomid1 )
				WriteRoleValue( OwnerID(), EM_RoleValue_Register1, Door_1)
				
				local Door_2 = CreateObjByFlag( Door , Flag_Gate_Boos_door , 4 , 1 )
				SetModeEx(Door_2 , EM_SetModeType_Strikback , false )--����
				SetModeEx(Door_2 , EM_SetModeType_Searchenemy , false )--����
				SetModeEx( Door_2 , EM_SetModeType_Fight, false) ----�i�������
				SetModeEx( Door_2 , EM_SetModeType_Mark, false) ----�аO
				SetModeEx( Door_2 , EM_SetModeType_SearchenemyIgnore, false) ---���󤣷|�Q�j�M
				SetModeEx( Door_2 , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
				SetModeEx( Door_2 , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
				SetModeEx( Door_2 , EM_SetModeType_Gravity, true) ----���O
				SetModeEx( Door_2 , EM_SetModeType_ShowRoleHead, false) ----������Y����
				SetModeEx( Door_2 , EM_SetModeType_AlignToSurface, false) ----�K����
				SetModeEx( Door_2 , EM_SetModeType_Move, false) ----����
				SetModeEx( Door_2 , EM_SetModeType_Obstruct, true) ----����
				AddToPartition( Door_2,roomid1 )
				WriteRoleValue( OwnerID(), EM_RoleValue_Register2, Door_2)
			end
			
		else 
			if Start_war == 1 then
				--say(OwnerID(),"OVER_2")
				local D_1 = ReadRoleValue( OwnerID() , EM_RoleValue_Register1 )
				local D_2 = ReadRoleValue( OwnerID() , EM_RoleValue_Register2 )
				Delobj(D_1)
				Delobj(D_2)
				--WriteRoleValue(OwnerID(), EM_RoleValue_Livetime,5)
				Delobj(OwnerID())
			end
		end
	end
end


function Lua_apon_Zone122_Gate_Dead_1_1() ---�϶��pBoss �����`�@��
	local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Ball = star_CreateObj( OwnerID() , 103056 , 0 , 0 , 0 , roomid1 , 0) ---�ͥX�@�ӯS�Ĳy�A�O�o�����S�Ĳy��ID:102924
	-------------�S�Ĳy�M��-----------------------------------------------------------------------------------------------------------------
	SetModeEx(Ball , EM_SetModeType_Strikback , false )--����
	SetModeEx(Ball , EM_SetModeType_Searchenemy , false )--����
	SetModeEx( Ball , EM_SetModeType_Fight, false) ----�i�������
	SetModeEx( Ball , EM_SetModeType_Mark, false) ----�аO
	SetModeEx( Ball , EM_SetModeType_SearchenemyIgnore, false) ---���󤣷|�Q�j�M
	SetModeEx( Ball , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
	SetModeEx( Ball , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
	SetModeEx( Ball , EM_SetModeType_Gravity, false) ----���O
	SetModeEx( Ball , EM_SetModeType_ShowRoleHead, false) ----������Y����
	SetModeEx( Ball , EM_SetModeType_AlignToSurface, false) ----�K����
	SetModeEx( Ball , EM_SetModeType_Move, false) ----����
	Hide(Ball)
	Show(Ball,roomid1)
	WriteRoleValue(Ball, EM_RoleValue_Livetime,10)
	WriteRoleValue( Ball, EM_RoleValue_Register1, OwnerID())
	BeginPlot(Ball,"Lua_apon_Zone122_Gate_Dead_2_1",5)
end

function Lua_apon_Zone122_Gate_Dead_2_1()	
	local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Boss = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
	ScriptMessage( OwnerID() , -1 , 2 , "[SC_102969_20]" , 1 )
	local Door_1 = ReadRoleValue(Boss,EM_RoleValue_Register1)
	local Door_2 = ReadRoleValue(Boss,EM_RoleValue_Register2)
	Delobj(Door_1)
	Delobj(Door_2)
end



-----���a = owner
------�� = target
function Lua_apon_Zone122_TimerGate_1_1()
	SetPlot( TargetID() , "Collision" , "" , 0 )
	local TimerGate_AI = ReadRoleValue(TargetID(),EM_RoleValue_PID)
	
	if ReadRoleValue( OwnerID(), EM_RoleValue_VOC) == 0 then
		ScriptMessage( OwnerID() , OwnerID() , 2 , "GM can`t start this`s game !!" , 1 )
	elseif ReadRoleValue( OwnerID(), EM_RoleValue_VOC) ~= 0 then	
		WriteRoleValue( TimerGate_AI, EM_RoleValue_Register1,1)
		BeginPlot( TargetID() , "Lua_apon_Zone122_TimerGate_2_1",0 )
	end
end


-----�� -- owner
------���a -- Target
-------EM_RoleValue_Register3 = ���m��
-------EM_RoleValue_Register4 = �R���ǰe���׵���
-------EM_RoleValue_Register5 = �ǰe��
---------�@�Ӫ��̦h�|�b���W���� 15 �Ӫ���

function Lua_apon_Zone122_TimerGate_2_1() ----�ت��b��ͤp��
	local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local TimerGate_Boss = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local Luck_string = Rand(3)+1
	local Mob_1 = 103068 
	local Mob_2 = 103084
	local Table_mob = {}
	local Counter_mob = 0
	local STEP = 0
	local Door_Return = 0 ----���m��
	local Door_over = 0 --- �̫���}�ҮɡA�N�ǰe���R����
	local Door_Seed = 0
	local Mob_Num = 0 ----�p��o�Ӫ��{�b�����ʹX����
	while 1 do
		sleep(10)
		Door_Return = ReadRoleValue(OwnerID(),EM_RoleValue_Register3)
		Door_over = ReadRoleValue(OwnerID(),EM_RoleValue_Register4)
		--DeBugMsg(0,0,"Door_over ="..Door_over)
		Counter_mob = Counter_mob + 1
		if Door_Return == 1 then
			for i = 1 , table.getn(Table_mob) , 1 do
				Delobj(Table_mob[i])
			end
			Delobj(OwnerID())
		end
		
		if Door_over == 1 then
			for i = 1 , table.getn(Table_mob) , 1 do
				WriteRoleValue(Table_mob[i], EM_RoleValue_Livetime,30)
			end
			Delobj(OwnerID())
		end
		
		-----------------------�N�w���`���Ǫ��qtable������-----------------------------------
		for i = 1 , table.getn(Table_mob), 1 do
			if Table_mob[i] ~= nil and ReadRoleValue( Table_mob[i] , EM_RoleValue_IsDead) == 1 then
				table.remove ( Table_mob , i)
			end	
		end
		-------------------------------------------------------------------------------------------------------
		Mob_Num = table.getn(Table_mob)

		
		if Counter_mob >= 6 and Door_Seed == 0 then
			Door_Seed = 1
			local Seed_Door = star_CreateObj( OwnerID() , 103065 , 0 , 10 , 0 , roomid1 , 0)
			SetModeEx(Seed_Door , EM_SetModeType_Strikback , false )--����
			SetModeEx(Seed_Door , EM_SetModeType_Searchenemy , false )--����
			SetModeEx( Seed_Door , EM_SetModeType_Fight, false) ----�i�������
			SetModeEx( Seed_Door , EM_SetModeType_Mark, false) ----�аO
			SetModeEx( Seed_Door , EM_SetModeType_SearchenemyIgnore, false) ---���󤣷|�Q�j�M
			SetModeEx( Seed_Door , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
			SetModeEx( Seed_Door , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
			SetModeEx( Seed_Door , EM_SetModeType_Gravity, false) ----���O
			SetModeEx( Seed_Door , EM_SetModeType_ShowRoleHead, false) ----������Y����
			SetModeEx( Seed_Door , EM_SetModeType_AlignToSurface, false) ----�K����
			SetModeEx( Seed_Door , EM_SetModeType_Move, false) ----����
			Hide(Seed_Door)
			Show(Seed_Door,roomid1)
			table.insert( Table_mob , Seed_Door )
			WriteRoleValue( OwnerID(), EM_RoleValue_Register5, Seed_Door)
		end
		
		if Counter_mob >= 10 and STEP == 0 and Mob_Num <= 10 then
			STEP = 1
			for i = 1 , 2 , 1 do
				local Mob_1 = star_CreateObj( OwnerID() , Mob_1 , 0 , 0 , 0 , roomid1 , 0)
				BeginPlot( Mob_1 , "Lua_apon_Runwar_mob_1",10 )
				table.insert( Table_mob , Mob_1 )
			end
		
		elseif Counter_mob >= 35 and STEP == 1 and Mob_Num <= 10 then
			STEP = 0
			local Mob_2 = star_CreateObj( OwnerID() , Mob_2 , 0 , 0 , 0 , roomid1 , 0)
			BeginPlot( Mob_2 , "Lua_apon_Runwar_mob_1",10 )
			table.insert( Table_mob , Mob_2 )
			Counter_mob = 0
		end
	end
end

----206725 : �Ŧ�ť�
-----206726 : ����ť�
-------114342 : �Ŧ�۬W
--------114343 : ����۬W

function Lua_apon_Runwar_3() ---�Ŧ�ť۬W�ˬd��
	SetPlot( OwnerID() , "touch" , "Lua_apon_Runwar_3_1" , 20 )
end

----Own = ���a
----Tar = �ť�
function Lua_apon_Runwar_3_1()
	if CheckBuff(TargetID(),505626) == true then
		--say(OwnerID(),"It is Over")
		ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_102969_21]" , 1 )---�۬W�W�������w�Q�ҰʤF �I 
		
	else
		if CountBodyItem( OwnerID(), 206725 ) >= 1 then
				SetPlot( OwnerID() , "touch" , "" , 0 )
				ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_102969_22]" , 1 )-------�A�C�C���N�⤤���ť۴O�i�۬W���� ....
				BeginPlot( TargetID() , "Lua_apon_Runwar_3_2",0 )
				--say(OwnerID(),"Check_1")
		elseif CountBodyItem( OwnerID(), 206726 ) >= 1 then
			ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_102969_23]" , 1 )----------�A�յ۱N�⤤�ť۴O�i�۬W�� ......  ���O�Ϊ����G���Ӥ@��
		else
			ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_102969_24]" , 1 )-------�A�J�Ӫ�Ĳ�N�ۥ۬W�A���G���ӥW�ѥi�H��i�Y�Ӫ��~......
		end
	end
end

------Own = �ť�
---------Tar = ���a
function Lua_apon_Runwar_3_2()
	local Gate_AI = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
	AddBuff (OwnerID() , 505626 , 0 , -1)---�P�_��
	DelBodyItem( TargetID(), 206725, 1 )
	WriteRoleValue( Gate_AI, EM_RoleValue_Register7, 1)
	WriteRoleValue( OwnerID(), EM_RoleValue_Register1, 1) ----���᪱�a�A�I��A�h�|�i�D���a�A���۬W�w�g�Q�ҰʤF
end

-------------------------------------------------------------------------------------------------------------------------------
function Lua_apon_Runwar_4() ---����ť۬W�ˬd��
	SetPlot( OwnerID() , "touch" , "Lua_apon_Runwar_2_4_1" , 20 )
end

----Own = ���a
----Tar = �ť�
function Lua_apon_Runwar_2_4_1()
	if CheckBuff(TargetID(),505626) == true then
		ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_102969_21]" , 1 )---�۬W�W�������w�Q�ҰʤF �I 
		
	else
		if CountBodyItem( OwnerID(), 206726 ) >= 1 then
				SetPlot( OwnerID() , "touch" , "" , 0 )
				ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_102969_22]" , 1 )-------�A�C�C���N�⤤���ť۴O�i�۬W���� ....
				BeginPlot( TargetID() , "Lua_apon_Runwar_4_2",0 )
		elseif CountBodyItem( OwnerID(), 206725 ) >= 1 then
			ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_102969_23]" , 1 )----------�A�յ۱N�⤤�ť۴O�i�۬W�� ......  ���O�Ϊ����G���Ӥ@��
		else
			ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_102969_24]" , 1 )-------�A�J�Ӫ�Ĳ�N�ۥ۬W�A���G���ӥW�ѥi�H��i�Y�Ӫ��~......
		end
	end
end

------Own = �ť�
---------Tar = ���a
function Lua_apon_Runwar_4_2()
	local Gate_AI = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
	AddBuff (OwnerID() , 505626 , 0 , -1)---�P�_��
	DelBodyItem( TargetID(), 206726, 1 )
	WriteRoleValue( Gate_AI, EM_RoleValue_Register8, 1)
	WriteRoleValue( OwnerID(), EM_RoleValue_Register1, 1) ----���᪱�a�A�I��A�h�|�i�D���a�A���۬W�w�g�Q�ҰʤF
end


function Lua_apon_Runwar_mob_1() ----���Ϊ��A�Ҳ��ͪ��Ǫ��ϥ�
	local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local All_String_1 = {"[SC_102969_26]","[SC_102969_27]","[SC_102969_28]"} ----�Q���ת��Ǫ��s�ۥΪ�
	local Begin = 0
	local Time = 0
	local PPL = SetSearchAllPlayer(roomid1 )
	for i = 1 , PPL , 1 do  
		local ID = GetSearchResult()
		if ReadRoleValue( ID , EM_RoleValue_IsDead ) ~= 1 and ReadRoleValue( ID, EM_RoleValue_VOC) ~= 0  
			and ReadRoleValue( ID , EM_RoleValue_RoomID  ) == roomid1 and CheckDistance( OwnerID(), ID, 800 ) == true then
			SetAttack( OwnerID() , ID )
			break
		end	
	end
	
	while 1 do
		sleep(10)
		Time = Time + 1
		if CheckBuff(OwnerID(),505669) == true and Begin == 0 then
			Begin = 1
			SetFightMode ( OwnerID(),0,0,0,0 )
			SetModeEx(OwnerID() , EM_SetModeType_Strikback , false )--����
			SetModeEx(OwnerID() , EM_SetModeType_Searchenemy , false )--����
			SetModeEx( OwnerID() , EM_SetModeType_Fight, false) ----�i�������
			Hide(OwnerID())
			Show(OwnerID(),roomid1)
			sleep(10)
			WriteRoleValue(OwnerID(), EM_RoleValue_Livetime,5)
			local String_luck = Rand(3)+1
			Yell( OwnerID() , All_String_1[String_luck] , 5)
		end
		if Time >= 15 and CheckBuff(OwnerID(),505669) == true then
			Time = 0
			local String_luck = Rand(3)+1
			Yell( OwnerID() , All_String_1[String_luck] , 5)
		end
	end
end

function Lua_apon_Runwar_findoor_1()-----�̫᪺�]�k���Ϊ��A���_���I��k�N�A�v�T�Ҧ����Ǫ�
	while 1 do
		sleep(10)
		CastSpellLV( OwnerID() , OwnerID() , 494737 , 0 )
	end
end

function Lua_apon_Over_Ball_1()
	while 1 do
		sleep(5)
		CastSpellLV( OwnerID() , OwnerID() , 494737 , 0 )
	end
end

function Lua_apon_Zone122_CheckFindoor()
	SetPlot( TargetID() , "Collision" , "" , 0 )
	local roomid1 = ReadRoleValue( TargetID() , EM_RoleValue_RoomID )
	if ReadRoleValue( OwnerID(), EM_RoleValue_VOC) == 0 then
		ScriptMessage( OwnerID() , OwnerID() , 2 , "GM can`t start this`s game !!" , 1 )
	elseif ReadRoleValue( OwnerID(), EM_RoleValue_VOC) ~= 0 then	
		local Ball = star_CreateObj( TargetID() , 103056 , 0 , 0 , 0 , roomid1 , 0) 
		-------------�S�Ĳy�M��-----------------------------------------------------------------------------------------------------------------
		SetModeEx(Ball , EM_SetModeType_Strikback , false )--����
		SetModeEx(Ball , EM_SetModeType_Searchenemy , false )--����
		SetModeEx( Ball , EM_SetModeType_Fight, false) ----�i�������
		SetModeEx( Ball , EM_SetModeType_Mark, false) ----�аO
		SetModeEx( Ball , EM_SetModeType_SearchenemyIgnore, false) ---���󤣷|�Q�j�M
		SetModeEx( Ball , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
		SetModeEx( Ball , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
		SetModeEx( Ball , EM_SetModeType_Gravity, false) ----���O
		SetModeEx( Ball , EM_SetModeType_ShowRoleHead, false) ----������Y����
		SetModeEx( Ball , EM_SetModeType_AlignToSurface, false) ----�K����
		SetModeEx( Ball , EM_SetModeType_Move, false) ----����
		Hide(Ball)
		Show(Ball,roomid1)
		WriteRoleValue(Ball, EM_RoleValue_Livetime,5)
		BeginPlot( Ball , "Lua_apon_Zone122_CheckFindoor_1",0 )
	end
end

function Lua_apon_Zone122_CheckFindoor_1()
	ScriptMessage( OwnerID() , -1 , 1 , "[SC_102969_19]" , 1 ) ----�@�������Ť��q�q��Ǫ��۬W�����o�X��........
end

function Lua_apon_Zone122_CheckFin()
	local Door_over = 0
	while 1 do
		sleep(10)
		Door_over = ReadRoleValue(OwnerID(),EM_RoleValue_Register3)
		if Door_over == 1 then
			Delobj(OwnerID())
		end
	end
end

function Lua_apon_Zone122_checkpet() ---�P�_�ɶ��l�v�Ե�����i�H�v�T�쪺�Ǫ�ID
	local Mob_ID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	if Mob_ID == 103068 or Mob_ID == 103083 or Mob_ID == 103084 or Mob_ID == 103087 then
		return true
	else
		return false
	end	
end

