function Lua_apon_102891_check() ---�ҰʳD�k����t��
	local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	while 1 do
		sleep(10)
		local Boss = ReadRoleValue(OwnerID(),EM_RoleValue_PID)--�NBoss��GIDŪ�X��
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
		if  ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then
			local PPL = SetSearchAllPlayer(roomid1 )
			for i = 1 , PPL , 1 do ---��C�@�Ӫ��a�W�@�ӡu���Ρv
				local ID = GetSearchResult()
				if ReadRoleValue( ID , EM_RoleValue_IsDead ) ~= 1 and ReadRoleValue( ID, EM_RoleValue_VOC) ~= 0 and ReadRoleValue( ID , EM_RoleValue_RoomID  ) == roomid1 then
					AddBuff (ID , 505222 , 0 , 15)
				end
			end
			ScriptMessage(OwnerID() , -1 , 2 , "[SC_102683_1]" , 1 ) ----���D�ӨӪ��X�ȰڡI�A�̥i�����L���ڶܡH
			sleep(30)
			WriteRoleValue( Boss, EM_RoleValue_Register5, 1)
			Delobj(OwnerID())
		end
	end	
end

function Lua_apon_102683_Start()
	SetModeEx( OwnerID() , EM_SetModeType_Mark, false) ----�аO
	SetModeEx( OwnerID() , EM_SetModeType_Strikback, false) ---����
	SetModeEx( OwnerID() , EM_SetModeType_Move, false) ---����	
	SetModeEx( OwnerID() , EM_SetModeType_Fight, false) ---�i���
	SetModeEx( OwnerID() , EM_SetModeType_SearchenemyIgnore, true) ---���󤣷|�Q�j�M
	SetModeEx( OwnerID() , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
	SetModeEx( OwnerID() , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
	SetModeEx( OwnerID() , EM_SetModeType_Searchenemy, false)  ---����
	SetModeEx( OwnerID()   , EM_SetModeType_Obstruct, false )--����

	local Step_1 = 1 ----�ةǡB�}��
	local Step_2 = 0 ---�ԤH�B����
	local Step_3 = 0 --- �}�l�ڹ�Boss�Ҧ�
	local Step_4 = 0 ---�ڹ�Boss �� �G
	local Step_5 = 0
	local Step_6 = 0
	local Step_Over = 0
	local Step_Return = 0
	local Check_DK_Num = 0
	local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Table_jail = {} ----�x�s�K���}��
	local DK_all = {} ----�x�s�ܦ�DK���H��
	local DK_all_1 = 0 ---�֭p DK �ƶq��
	local Door_all = {}
	local Table_Dream_show = {} ----�x�s��t�ڹҪ��S�Ĳy
	local Step ---�P�_Boss�����q
	local CombatBegin = 0	-------------�԰��}�l�P�_
	local king_rebon = 0 -------Boss���m�P�_
	
	local Flag_jailer = 780385 ---�K���}�ǥ�
	local Flag_Timer = 780386 --- �p�ɾ��ϥ�
	local Flag_Door = 780387 ---�e����M��
	local Flag_King = 780388 ---Boss �M��
	local Flag_OP = 780389 ----��H�Զi�Ӫ��X��
	local Flag_OP_die = 780393
	
	local All_jail = {102857,102858,102859,102860,102861,102862,102863,102864} ---�K���}�� 
	local All_Dreamking = {102850,102851,102852,102853,102854,102855,102856} ---�C���ڹ�Boss
	local Check_dream = 0
	local dreamking_counter = 0 -----�֭p�T���ڹҤ�
	local DK_chose = 0
	local JK_chose = 0
	local JA
	local RD_boss
	local SP_1 = 0
	local Over = 1
	local counter_p1_1 = 0   
	local counter_p1_2 = 0
	local counter_p1_3 = 0
	local counter_p1_4 = 0
	
	
	while 1 do 
		sleep(10)
		Step_2 = ReadRoleValue(OwnerID(),EM_RoleValue_Register5) ---�P�_��t�Ϊ�
		Step_Return = ReadRoleValue(OwnerID(),EM_RoleValue_PID) ----�������}�԰����m��
		Step_Over = ReadRoleValue(OwnerID(),EM_RoleValue_Register3) ---Boss ���`�@��
		
		if Checkbuff(OwnerID(),505228) == true then ----��U�D�k����ޯ�ۤ���
			while 1 do
				sleep(10)
				
				Step_Return = ReadRoleValue(OwnerID(),EM_RoleValue_PID) ----�������}�԰����m��
				Step_Over = ReadRoleValue(OwnerID(),EM_RoleValue_Register3) ---Boss ���`�@��
				
				if Step_Return == 1 or Step_Over == 1 then ---�p�G���m���ܡA�n�����X���j��
					break
				end
				
				if Checkbuff(OwnerID(),504826) == true then
					Cancelbuff(OwnerID(),504826)
					local Boss_2 = ReadRoleValue(OwnerID(),EM_RoleValue_Register7)
					
					JA = table.getn(Table_jail)
					if JA >= 1 then
						JA = table.getn(Table_jail)
						RD_boss = Rand(JA)+1
						ScriptMessage( OwnerID() , -1 , 2 , "[SC_102683_8]" , 1 )---�^�W�A������I�����j���D�k�������A�a�I�ڪ������I
						CastSpell( Boss_2 , Boss_2 , 494598) ----��t����N
						sleep(30)
						local Ball = star_CreateObj( Boss_2 , 102924 , 0 , 0 , 0 , roomid1 , 0) ---�ͥX�@�ӯS�Ĳy
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
						WriteRoleValue( Ball , EM_RoleValue_IsWalk , 0 )
						WriteRoleValue(Ball, EM_RoleValue_Livetime,5)	
						
						CastSpell( Ball , Table_jail[RD_boss] , 494554)----������t�z��
						table.remove ( Table_jail , RD_boss)
					else
						if Over == 1 then
							Boss_2 = ReadRoleValue(OwnerID(),EM_RoleValue_Register7)
							Over = 0
							-----------�p�G�}�ǳ������F�A�N�����i�J�g�z����------------
							SetFightMode(OwnerID(),0,0,0,0)
							ScriptMessage( OwnerID() , -1 , 2 , "[SC_102683_01]" , 1 )---���I���I�ڪ��������Q�A�̳o�Ǩ��⪺���Ư}�a�F�I�I
							sleep(10)
							ScriptMessage( OwnerID() , -1 , 2 , "[SC_102683_02]" , 1 )--�b���ߤ����ƺ����������������U�I
							sleep(10)
							AddBuff (Boss_2 , 505224 , 0 , 600)
							sleep(10)
							ScriptMessage( OwnerID() , -1 , 2 , "[SC_102683_03]" , 1 )----���������A�s�������a�I
							sleep(10)
							SetFightMode(OwnerID(),1, 1, 1,1 ) ---�N�Ҧ����\��}��
						end
					end
				end
			end
		end
		
		if Step_Over == 1 then
			local Door_end = ReadRoleValue(OwnerID(),EM_RoleValue_Register2)
			SetModeEx( Door_end   , EM_SetModeType_Obstruct, false )--����
			SetDefIdleMotion(Door_end,ruFUSION_MIME_IDLE_STAND)----�U�h
			--PlayMotionEX( Door_end ,  ruFUSION_ACTORSTATE_activate_end,ruFUSION_ACTORSTATE_activate_loop  )
			
			local timer = ReadRoleValue(OwnerID(),EM_RoleValue_Register4)
			Delobj(timer)
			
			for i = 1 , table.getn(Table_jail), 1 do
				if Table_jail[i] ~= nil and CheckID(Table_jail[i] ) == true then
					Delobj(Table_jail[i])
				end	
			end
			
			for i = 1 , table.getn(DK_all), 1 do
				if DK_all[i] ~= nil and CheckID(DK_all[i] ) == true then
					Delobj(DK_all[i])
				end	
			end
			
			for i = 1 , table.getn(Table_Dream_show), 1 do
				if Table_Dream_show[i] ~= nil and CheckID(Table_Dream_show[i] ) == true then
					Delobj(Table_Dream_show[i])
				end	
			end
			
			for i = 1 , table.getn(Door_all), 1 do
				if Door_all[i] ~= nil and CheckID(Door_all[i] ) == true then
					Delobj(Door_all[i])
				end	
			end
			sleep(30)
			Delobj(OwnerID())
		end
		
		if Step_Return == 1 then
			local Door_end = ReadRoleValue(OwnerID(),EM_RoleValue_Register2)
			SetModeEx( Door_end   , EM_SetModeType_Obstruct, false )--����
			SetDefIdleMotion(Door_end,ruFUSION_MIME_IDLE_STAND)----�U�h
			--PlayMotionEX( Door_end ,  ruFUSION_ACTORSTATE_activate_end,ruFUSION_ACTORSTATE_activate_loop  )
			
			local timer = ReadRoleValue(OwnerID(),EM_RoleValue_Register4) 
			Delobj(timer)
			local Boss_1 = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
			Delobj(Boss_1)
			local Boss_2 = ReadRoleValue(OwnerID(),EM_RoleValue_Register7)
			Delobj(Boss_2)
			
			for i = 1 , table.getn(Table_jail), 1 do
				if Table_jail[i] ~= nil and CheckID(Table_jail[i] ) == true then
					Delobj(Table_jail[i])
				end	
			end
			
			for i = 1 , table.getn(DK_all), 1 do
				if DK_all[i] ~= nil and CheckID(DK_all[i] ) == true then
					Delobj(DK_all[i])
				end	
			end
			
			for i = 1 , table.getn(Table_Dream_show), 1 do
				if Table_Dream_show[i] ~= nil and CheckID(Table_Dream_show[i] ) == true then
					Delobj(Table_Dream_show[i])
				end	
			end
			
			for i = 1 , table.getn(Door_all), 1 do
				if Door_all[i] ~= nil and CheckID(Door_all[i] ) == true then
					Delobj(Door_all[i])
				end	
			end
			
			local Rebon_boss = star_CreateObj( OwnerID() , 102929 , 0 , 0 , 0 , roomid1 , 0)
			sleep(10)
			Delobj(OwnerID())
		end
		
		if Step_1 == 1 then ----AI ���ǳƤu�@
			Step_1 = 0
			
			local Door_1 = CreateObjByFlag( 102808 , Flag_Door , 1 , 1 ) ---�ؤU�e���A���ʪ�
			SetModeEx( Door_1 , EM_SetModeType_Show, true) ----�q�X
			SetModeEx( Door_1 , EM_SetModeType_Mark, false) ----�аO
			SetModeEx( Door_1 , EM_SetModeType_Strikback, false) ---����
			SetModeEx( Door_1 , EM_SetModeType_Move, false) ---����	
			SetModeEx( Door_1 , EM_SetModeType_Fight, false) ---�i���
			SetModeEx( Door_1 , EM_SetModeType_SearchenemyIgnore, true) ---���󤣷|�Q�j�M
			SetModeEx( Door_1 , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
			SetModeEx( Door_1 , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
			SetModeEx( Door_1 , EM_SetModeType_Searchenemy, false)  ---����
			SetModeEx( Door_1   , EM_SetModeType_Obstruct, false )--����
			AddToPartition( Door_1,roomid1 )
			Show(Door_1,roomid1)
			WriteRoleValue( OwnerID(), EM_RoleValue_Register2, Door_1)
			table.insert( Door_all , Door_1 ) ----�N���s�J table ��
			
			local Door_2 = CreateObjByFlag( 102930 , Flag_Door , 2 , 1 ) ---�ؤU���
			SetModeEx( Door_2 , EM_SetModeType_Show, true) ----�q�X
			SetModeEx( Door_2 , EM_SetModeType_Mark, false) ----�аO
			SetModeEx( Door_2 , EM_SetModeType_Strikback, false) ---����
			SetModeEx( Door_2 , EM_SetModeType_Move, false) ---����	
			SetModeEx( Door_2 , EM_SetModeType_Fight, false) ---�i���
			SetModeEx( Door_2 , EM_SetModeType_SearchenemyIgnore, true) ---���󤣷|�Q�j�M
			SetModeEx( Door_2 , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
			SetModeEx( Door_2 , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
			SetModeEx( Door_2 , EM_SetModeType_Searchenemy, false)  ---����
			SetModeEx( Door_2   , EM_SetModeType_Obstruct, true )--����
			AddToPartition( Door_2,roomid1 )
			Show(Door_2,roomid1)
			table.insert( Door_all , Door_2 ) ----�N���s�J table ��
			
			for i = 1 , 8 , 1 do ---�N�K���}�ǥͥX��
				Table_jail[i] = CreateObjByFlag( All_jail[i] , Flag_jailer , i , 1 )
				SetModeEx( Table_jail[i] , EM_SetModeType_Show, true)  ----�q�X
				SetModeEx( Table_jail[i] , EM_SetModeType_Mark, true) ----�аO
				SetModeEx( Table_jail[i] , EM_SetModeType_Strikback, false) ---����
				SetModeEx( Table_jail[i] , EM_SetModeType_Move, false) ---����	
				SetModeEx( Table_jail[i] , EM_SetModeType_Fight, false) ---�i���
				SetModeEx( Table_jail[i] , EM_SetModeType_SearchenemyIgnore, true) ---���󤣷|�Q�j�M
				SetModeEx( Table_jail[i] , EM_SetModeType_HideName, true)  ---�����Y�W�O�_��ܦW��
				SetModeEx( Table_jail[i] , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
				SetModeEx( Table_jail[i] , EM_SetModeType_Searchenemy, false)  ---����
				AddToPartition( Table_jail[i],roomid1 )
				Show(Table_jail[i],roomid1)
				WriteRoleValue( Table_jail[i], EM_RoleValue_PID, OwnerID()) ---�NBoss �� GID �g�J�C�@���Ǫ� PID ��
			end
			
			local Check_show = star_CreateObj( OwnerID() , 102891 , 0 , 0 , 0 , roomid1 , 0) ----�ͥX�P�_��t���S�ղy
			SetModeEx( Check_show , EM_SetModeType_Mark, false) ----�аO
			SetModeEx( Check_show , EM_SetModeType_ShowRoleHead, false) ----������Y����
			SetModeEx( Check_show , EM_SetModeType_Strikback, false) ---����
			SetModeEx( Check_show , EM_SetModeType_Move, false) ---����	
			SetModeEx( Check_show , EM_SetModeType_Fight, false) ---�i���
			SetModeEx( Check_show , EM_SetModeType_SearchenemyIgnore, true) ---���󤣷|�Q�j�M
			SetModeEx( Check_show , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
			SetModeEx( Check_show , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
			SetModeEx( Check_show , EM_SetModeType_Searchenemy, true)  ---����
			AddToPartition( Check_show,roomid1 )
			Show(Check_show,roomid1)
			WriteRoleValue( Check_show, EM_RoleValue_PID, OwnerID())
			
			local Boss_1 = CreateObjByFlag( 102683 , Flag_King , 1 , 1 ) ---�[���Boss
			SetModeEx( Boss_1 , EM_SetModeType_Show, true) ----�q�X
			SetModeEx( Boss_1 , EM_SetModeType_Mark, true) ----�аO
			SetModeEx( Boss_1 , EM_SetModeType_Searchenemy, false)  ---����
			SetModeEx( Boss_1 , EM_SetModeType_Strikback, false) ---����
			SetModeEx( Boss_1 , EM_SetModeType_Move, false) ---����	
			SetModeEx( Boss_1 , EM_SetModeType_Fight, false) ---�i���
			SetModeEx( Boss_1   , EM_SetModeType_Obstruct, false )--����
			AddToPartition( Boss_1,roomid1 )
			Show(Boss_1,roomid1)
			WriteRoleValue( OwnerID(), EM_RoleValue_Register1, Boss_1)
			sleep(50)
			Step_1 = 0
		end
		
		if Step_2 == 1 then
			WriteRoleValue( OwnerID(), EM_RoleValue_Register5, 0)
			Step_3 = 1
			local Boss_1 = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
			ScriptMessage(OwnerID() , -1 , 2 , "[SC_102683_2]" , 1 ) ----�N�������A�Ӭ��U��s´�X�y�å����Ѫ����ڡz�a�I�I
			sleep(30)
			CastSpellLV( Boss_1 , Boss_1 , 494551 , 1 ) ---��Boss�e�{�ڹҼҦ�	
			sleep(40)
			
			local PPL = SetSearchAllPlayer(roomid1 )
			local Flag = 1
			for i = 1 , PPL , 1 do ---�⪱�a��J�ж��� 
				local ID = GetSearchResult()
				if ReadRoleValue( ID , EM_RoleValue_IsDead ) ~= 1 and ReadRoleValue( ID, EM_RoleValue_VOC) ~= 0  and ReadRoleValue( ID , EM_RoleValue_RoomID  ) == roomid1 then
					SetPosByFlag( ID , Flag_OP , Flag ) 
					Flag = Flag + 1
					if Flag > GetMoveFlagCount(Flag_OP) -1 then
						Flag = 1
					end
				end
			end
			
			----------�N�۰ʪ��[�J���סA�åB�ɤW��-------------------------------------------------------------------
			local Door_start = ReadRoleValue(OwnerID(),EM_RoleValue_Register2)
			SetDefIdleMotion( Door_start,ruFUSION_MIME_ACTIVATE_LOOP)------�_��
			--PlayMotionEX( Door_start ,  ruFUSION_ACTORSTATE_activate_begin,ruFUSION_ACTORSTATE_activate_loop  )
			SetModeEx( Door_start   , EM_SetModeType_Obstruct, true )--����
		
			for i = 1 , table.getn(Table_jail), 1 do
				if Table_jail[i] ~= nil and CheckID(Table_jail[i] ) == true then
					Table_Dream_show[i] = star_CreateObj( Table_jail[i] , 102894 , 0 , 0 , 0 , roomid1 , 0)---�b�C�@�ӥ}�Ǫ���m�ͤ@�ӳz���y
					SetModeEx( Table_Dream_show[i] , EM_SetModeType_Mark, false) ----�аO
					SetModeEx( Table_Dream_show[i] , EM_SetModeType_Searchenemy, false)---����
					SetModeEx( Table_Dream_show[i] , EM_SetModeType_Strikback, false) ---����
					SetModeEx( Table_Dream_show[i] , EM_SetModeType_Move, false) ---����	
					SetModeEx( Table_Dream_show[i] , EM_SetModeType_Fight, false) ---�i���
					AddBuff (Table_Dream_show[i] , 505130 , 0 , 200)---�N�C�@�ӯS�Ĳy�W�@�ӹڹүS��
					Hide( Table_jail[i] )---�N�C�@���}�����ð_��
				end	
			end
			ScriptMessage(OwnerID() , -1 , 2 , "[SC_102683_3]" , 1 ) ----�n�n���ɨ��a�I�I�ڳo�X��i�R���p�ȤH�I�I
			sleep(30)
			SetPosByFlag( Boss_1, 780388 , 3 )
			sleep(10)
		end
		
		if Step_3 == 1 then
			Step_3 = 0
			Step_4 = 1 
			Step_5 = 0
			for i = 1 , table.getn(All_Dreamking), 1 do ---���j��O�Ψӱq�C�ӹڹ�Boss����@�ӥX�Өϥ�
				local Chose_DreamKing = Rand(table.getn( All_Dreamking ) ) + 1
				if All_Dreamking[Chose_DreamKing] ~= nil then
					DK_chose = Chose_DreamKing
					----yell(OwnerID(),"123456789"..DK_chose,5)
					break
				end
			end
			
			for i = 1 , table.getn(Table_jail), 1 do ---���j��O�Ψӱq�K�ӥ}�Ǥ���@�Ө��ܦ��W�@�Ӱj�骺�ڹ�Boss
				local Chose_jailer = Rand(table.getn( Table_jail ) ) + 1
				if Table_jail[Chose_jailer] ~= nil and CheckID(Table_jail[Chose_jailer] ) == true then
					JK_chose = Chose_jailer
					
					ScriptMessage(OwnerID() , -1 , 2 , "[SC_102683_12]" , 1 )----�A�I�N�M�w�O�A�F�I�Ӧ����ڭ̳o�X��X�Ȫ����ڧa�I�I
					sleep(25)
					ScriptMessage(OwnerID() , -1 , 2 , "[SC_102683_13]" , 1 )----�@�Ѹ޲����]�O�q�c�Ф��j���F�X��
					sleep(35)
					----yell(OwnerID(),"123456789"..All_Dreamking[DK_chose],5)
					local DK = star_CreateObj( Table_jail[JK_chose] , All_Dreamking[DK_chose] , 0 , 0 , 0 , roomid1 , 0) ---�b�ؼХ}�Ǫ���m�ͥX�ڹ�Boss
					--local DK = star_CreateObj( Table_jail[JK_chose] , 102851 , 0 , 0 , 0 , roomid1 , 0) ---�b�ؼХ}�Ǫ���m�ͥX�ڹ�Boss
					dreamking_counter = dreamking_counter + 1
					--WriteRoleValue( DK, EM_RoleValue_PID, Table_jail[Chose_jailer]) ---��}�Ǫ�GID �g�J�ӹڹ�Boss�� PID ���A�H��K��ڹ�Boss�����ɭԡAkill �}��
					WriteRoleValue( DK, EM_RoleValue_Register1, OwnerID()) -----��Boss��GID�s�JRegister1
					table.insert( DK_all , DK ) ----�N�ڹҤ��s�Jtable��
					WriteRoleValue(Table_jail[JK_chose], EM_RoleValue_Livetime,5)----�N�Q�襤���ǤH�A5���A�h�|�����ۤv
					DK_all_1 = ReadRoleValue(OwnerID(),EM_RoleValue_Register6)-----�֭p�ͥX�ڹ�Boss���ƶq  
					WriteRoleValue( OwnerID(), EM_RoleValue_Register6, DK_all_1+1)
					
					table.remove ( Table_jail , JK_chose)
					table.remove ( All_Dreamking , DK_chose)
					break
				end
			end
		end
		
		if Step_4 == 1 and Step_5 == 0 then
			for i = 1 ,185 , 1 do
				sleep(10)
				counter_p1_1 = counter_p1_1 + 1
				counter_p1_2 = counter_p1_2 + 1	
				counter_p1_3 = counter_p1_3 + 1	
				counter_p1_4 = counter_p1_4 + 1
				--say(OwnerID(),"counter_p1_3 == "..counter_p1_3)
				
				Step_Return = ReadRoleValue(OwnerID(),EM_RoleValue_PID) ----�������}�԰����m��
				Check_dream = ReadRoleValue(OwnerID(),EM_RoleValue_Register9) ---�ΨӧP�_�ڹ�Boss���`��
				
				--say(OwnerID(),"Step_Return ="..Step_Return)
				--say(OwnerID(),"Check_dream ="..Check_dream)
				
				if Step_Return == 1 or Step_Over == 1 then ---�p�G�b�ڹҼҦ����ΡA�h���X�o�Ӱj��
					--say(OwnerID(),"Step_Return_111 ="..Step_Return)
					--say(OwnerID(),"Check_dream_222 ="..Check_dream)
					break
				end
				
				-----------���b�A����a�j���ABoss���m��A���a�@���_�ӡA�S���W�Q����A�ݭn���ݳo�Ӱj��]�������D�C---------------
				if counter_p1_4 == 25 then
					--say(OwnerID(),"Dai Dai !!")
					local ID = {}
					local ID_2 = {}
					local ID_2_all = 0
					local PPL = SetSearchAllPlayer(roomid1)
					local PPLX = 0
					
					if PPL==0 then
						Addbuff(OwnerID(),505140,0,600)
						Step_5 = 1
						break
					elseif PPL ~= 0 then
						for i = 1 , PPL , 1 do 
							ID[i] = GetSearchResult()
							if ReadRoleValue( ID[i] , EM_RoleValue_IsDead ) == 1 or  ------�h�ˬd�̭����H�O�_�O���H�Ϊ�gm
								ReadRoleValue( ID[i], EM_RoleValue_VOC) == 0 or 
								GetDistance( OwnerID(), ID[i]) >=1300 then 
								PPLX=PPLX+1
							else
								table.insert( ID_2 , ID[i] ) 
							end
						end
						Check_ID = table.getn(ID)	
					end
					if PPL<=PPLX then ---------���۵�  ����̭����O���H�Ϊ�gm  �ҥH���m
						Addbuff(OwnerID(),505140,0,600)
						Step_5 = 1
						break
					end
					counter_p1_4 = 0 
				end
				---------------------------------------------------------
				
				
				-----------���X�@�Ө��b������------------
				DK_all_1 = ReadRoleValue(OwnerID(),EM_RoleValue_Register6)-----�֭p�ͥX�ڹ�Boss���ƶq  
				if DK_all_1 == 0 and dreamking_counter == 3 then
					Addbuff(OwnerID(),505140,0,600)
					Step_5 = 1
					break
				end
				--------------------------------------------------
				
				if Check_dream == 1 then
					--WriteRoleValue( OwnerID(), EM_RoleValue_Register9, 0)
					for i = 1 , table.getn(DK_all), 1 do ---���s�p����W���h�ֹڹҤ�
						if DK_all[i] ~= nil and ReadRoleValue( DK_all[i] , EM_RoleValue_IsDead) == 1 then
							table.remove ( DK_all , i)
						end	
					end
					Check_DK_Num = table.getn(DK_all)
					sleep(10)
				end
				
				if Check_dream == 1 and Check_DK_Num == 0 then ---�p�G�ڹ�Boss���` and ���W�S������@���ڹ�Boss
					Check_dream = 0
					if dreamking_counter >= 3 then
						Addbuff(OwnerID(),505140,0,600)
						Step_5 = 1
						break
					end
					
					for i = 1 , table.getn(All_Dreamking), 1 do ---���j��O�Ψӱq�C�ӹڹ�Boss����@�ӥX�Өϥ�
						local Chose_DreamKing = Rand(table.getn( All_Dreamking ) ) + 1
						if All_Dreamking[Chose_DreamKing] ~= nil then
							DK_chose = Chose_DreamKing
							break
						end
					end
					
					for i = 1 , table.getn(Table_jail), 1 do ---���j��O�Ψӱq�K�ӥ}�Ǥ���@�Ө��ܦ��W�@�Ӱj�骺�ڹ�Boss
						local Chose_jailer = Rand(table.getn( Table_jail ) ) + 1
						if Table_jail[Chose_jailer] ~= nil and CheckID(Table_jail[Chose_jailer] ) == true then
							JK_chose = Chose_jailer
							sleep(25)
							ScriptMessage(OwnerID() , -1 , 2 , "[SC_102683_17]" , 1 )---��....�S���a�F�@��....
							sleep(25)
							ScriptMessage(OwnerID() , -1 , 2 , "[SC_102683_14]" , 1 )----���ڪ��ɨ��`�O�e�����u�I
							sleep(25)
							ScriptMessage(OwnerID() , -1 , 2 , "[SC_102683_15]" , 1 )----���p�A�N�������A�A���U��s´�@�q�a�I�I
							sleep(25)
							ScriptMessage(OwnerID() , -1 , 2 , "[SC_102683_12]" , 1 )----�A�I�N�M�w�O�A�F�I�Ӧ����ڭ̳o�X��X�Ȫ����ڧa�I�I
							sleep(25)
							ScriptMessage(OwnerID() , -1 , 2 , "[SC_102683_13]" , 1 )----�@�Ѹ޲����]�O�q�c�Ф��j���F�X��
							sleep(35)
							
							local DK = star_CreateObj( Table_jail[JK_chose] , All_Dreamking[DK_chose] , 0 , 0 , 0 , roomid1 , 0) ---�b�ؼХ}�Ǫ���m�ͥX�ڹ�Boss 
							
							dreamking_counter = dreamking_counter + 1
							WriteRoleValue(Table_jail[JK_chose], EM_RoleValue_Livetime,5) ----�N�Q�襤���ǤH�A5���A�h�|�����ۤv
							WriteRoleValue( DK, EM_RoleValue_Register1, OwnerID()) -----��Boss��GID�s�JRegister1
							table.insert( DK_all , DK ) ----�N�ڹҤ��s�Jtable��
							
							DK_all_1 = ReadRoleValue(OwnerID(),EM_RoleValue_Register6)-----�֭p�ͥX�ڹ�Boss���ƶq  
							WriteRoleValue( OwnerID(), EM_RoleValue_Register6, DK_all_1+1)
							
							table.remove ( Table_jail , JK_chose)
							table.remove ( All_Dreamking , DK_chose)
							break
						end
					end
					
				elseif counter_p1_1 == 60 and dreamking_counter <= 2 then ---�ɶ���A�h�A�ͤ@���X���A�쥻60��
					if dreamking_counter >= 3 then
						--WriteRoleValue( OwnerID(), EM_RoleValue_Register6, 1) ----��Boss���X�@�ӧP�_�}�l�i�J�԰���Buff
						Addbuff(OwnerID(),505140,0,60)
						Step_5 = 1
						break
					end
					
					for i = 1 , table.getn(All_Dreamking), 1 do ---���j��O�Ψӱq�C�ӹڹ�Boss����@�ӥX�Өϥ�
						local Chose_DreamKing = Rand(table.getn( All_Dreamking ) ) + 1
						if All_Dreamking[Chose_DreamKing] ~= nil then
							DK_chose = Chose_DreamKing
							break
						end
					end
					
					for i = 1 , table.getn(Table_jail), 1 do ---���j��O�Ψӱq�K�ӥ}�Ǥ���@�Ө��ܦ��W�@�Ӱj�骺�ڹ�Boss
						local Chose_jailer = Rand(table.getn( Table_jail ) ) + 1
						if Table_jail[Chose_jailer] ~= nil and CheckID(Table_jail[Chose_jailer] ) == true then
							JK_chose = Chose_jailer
							
							sleep(25)
							ScriptMessage(OwnerID() , -1 , 2 , "[SC_102683_17]" , 1 )---��....�S���a�F�@��....
							sleep(25)
							ScriptMessage(OwnerID() , -1 , 2 , "[SC_102683_14]" , 1 )----���ڪ��ɨ��`�O�e�����u�I
							sleep(25)
							ScriptMessage(OwnerID() , -1 , 2 , "[SC_102683_15]" , 1 )----���p�A�N�������A�A���U��s´�@�q�a�I�I
							sleep(25)
							ScriptMessage(OwnerID() , -1 , 2 , "[SC_102683_12]" , 1 )----�A�I�N�M�w�O�A�F�I�Ӧ����ڭ̳o�X��X�Ȫ����ڧa�I�I
							sleep(25)
							ScriptMessage(OwnerID() , -1 , 2 , "[SC_102683_13]" , 1 )----�@�Ѹ޲����]�O�q�c�Ф��j���F�X��
							sleep(35)
							
							local DK = star_CreateObj( Table_jail[JK_chose] , All_Dreamking[DK_chose] , 0 , 0 , 0 , roomid1 , 0) ---�b�ؼХ}�Ǫ���m�ͥX�ڹ�Boss 
							dreamking_counter = dreamking_counter + 1
							WriteRoleValue( DK, EM_RoleValue_Register1, OwnerID()) -----��Boss��GID�s�JRegister1
							table.insert( DK_all , DK ) ----�N�ڹҤ��s�Jtable��
							WriteRoleValue(Table_jail[JK_chose], EM_RoleValue_Livetime,5)----�N�Q�襤���ǤH�A5���A�h�|�����ۤv
							DK_all_1 = ReadRoleValue(OwnerID(),EM_RoleValue_Register6)-----�֭p�ͥX�ڹ�Boss���ƶq  
							WriteRoleValue( OwnerID(), EM_RoleValue_Register6, DK_all_1+1)
							
							table.remove ( Table_jail , JK_chose)
							table.remove ( All_Dreamking , DK_chose)
							break
						end
					end
					
				elseif counter_p1_2 == 120 and dreamking_counter <= 2 then ---�ɶ���A�h�A�ͤ@���X���A�쥻120��
					if dreamking_counter >= 3 then
						--WriteRoleValue( OwnerID(), EM_RoleValue_Register6, 1) ----��Boss���X�@�ӧP�_�}�l�i�J�԰���Buff
						Addbuff(OwnerID(),505140,0,60)
						Step_5 = 1
						break
					end
					
					for i = 1 , table.getn(All_Dreamking), 1 do ---���j��O�Ψӱq�C�ӹڹ�Boss����@�ӥX�Өϥ�
						local Chose_DreamKing = Rand(table.getn( All_Dreamking ) ) + 1
						if All_Dreamking[Chose_DreamKing] ~= nil then
							DK_chose = Chose_DreamKing
							break
						end
					end
					
					for i = 1 , table.getn(Table_jail), 1 do ---���j��O�Ψӱq�K�ӥ}�Ǥ���@�Ө��ܦ��W�@�Ӱj�骺�ڹ�Boss
						local Chose_jailer = Rand(table.getn( Table_jail ) ) + 1
						if Table_jail[Chose_jailer] ~= nil and CheckID(Table_jail[Chose_jailer] ) == true then
							JK_chose = Chose_jailer
							
							sleep(25)
							ScriptMessage(OwnerID() , -1 , 2 , "[SC_102683_17]" , 1 )---��....�S���a�F�@��....
							sleep(25)
							ScriptMessage(OwnerID() , -1 , 2 , "[SC_102683_14]" , 1 )----���ڪ��ɨ��`�O�e�����u�I
							sleep(25)
							ScriptMessage(OwnerID() , -1 , 2 , "[SC_102683_15]" , 1 )----���p�A�N�������A�A���U��s´�@�q�a�I�I
							sleep(25)
							ScriptMessage(OwnerID() , -1 , 2 , "[SC_102683_12]" , 1 )----�A�I�N�M�w�O�A�F�I�Ӧ����ڭ̳o�X��X�Ȫ����ڧa�I�I
							sleep(25)
							ScriptMessage(OwnerID() , -1 , 2 , "[SC_102683_13]" , 1 )----�@�Ѹ޲����]�O�q�c�Ф��j���F�X��
							sleep(35)
							
							local DK = star_CreateObj( Table_jail[JK_chose] , All_Dreamking[DK_chose] , 0 , 0 , 0 , roomid1 , 0) ---�b�ؼХ}�Ǫ���m�ͥX�ڹ�Boss 
							
							dreamking_counter = dreamking_counter + 1
							WriteRoleValue( DK, EM_RoleValue_Register1, OwnerID()) -----��Boss��GID�s�JRegister1
							table.insert( DK_all , DK ) ----�N�ڹҤ��s�Jtable��
							WriteRoleValue(Table_jail[JK_chose], EM_RoleValue_Livetime,5)----�N�Q�襤���ǤH�A5���A�h�|�����ۤv
							DK_all_1 = ReadRoleValue(OwnerID(),EM_RoleValue_Register6)-----�֭p�ͥX�ڹ�Boss���ƶq  
							WriteRoleValue( OwnerID(), EM_RoleValue_Register6, DK_all_1+1)
							
							table.remove ( Table_jail , JK_chose)
							table.remove ( All_Dreamking , DK_chose)
							break
						end
					end
				elseif counter_p1_3 == 180 then ---�ɶ���A���ڹҰj�鵲���A�쥻180��
					Addbuff(OwnerID(),505140,0,60)
					Step_5 = 1
					break
				end
			end
		end
		
		if Step_5 == 1 or CheckBuff(OwnerID(),505140) == true then
			Step_4 = 0
			Step_5 = 0
			CancelBuff(OwnerID(),505140)
			ScriptMessage(OwnerID() , -1 , 2 , "[SC_102683_4]" , 1 ) ----�ݤF�ݦU�쪺�~���I�o�@�W���Ӥ]�u���y�̧���z�i�H�M�U��۴��ýסI�I
			sleep(25)
			local Boss_1 = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
			Delobj(Boss_1)
			
			local Boss_2 = CreateObjByFlag( 102683 , Flag_King , 3 , 1 ) ---Fight �� Boss
			SetModeEx( Boss_2 , EM_SetModeType_Show, true) ----�q�X
			SetModeEx( Boss_2 , EM_SetModeType_Mark, true) ----�аO
			SetModeEx( Boss_2 , EM_SetModeType_Searchenemy, true)  ---����
			SetModeEx( Boss_2 , EM_SetModeType_Strikback, true) ---����
			SetModeEx( Boss_2 , EM_SetModeType_Move, true) ---����	
			SetModeEx( Boss_2 , EM_SetModeType_Fight, true) ---�i���
			SetModeEx( Boss_2   , EM_SetModeType_Obstruct, false )--����
			AddToPartition( Boss_2,roomid1 )
			Show(Boss_2,roomid1)
			WriteRoleValue( OwnerID(), EM_RoleValue_Register7, Boss_2)
			WriteRoleValue( Boss_2, EM_RoleValue_Register9, OwnerID())
			BeginPlot(Boss_2,"Lua_apon_102683_fight",30)
			for i = 1 , table.getn(Table_jail), 1 do ----�N�Ҧ����}�ǦA�� Show �X��
				if Table_jail[i] ~= nil and CheckID(Table_jail[i] ) == true then
					Show( Table_jail[i],roomid1 )
					WriteRoleValue( Table_jail[i], EM_RoleValue_PID, Boss_2)
				end	
			end
			
			for i = 1 , table.getn(Table_Dream_show), 1 do ----�R���Ҧ����S�Ĳy
				if Table_Dream_show[i] ~= nil and CheckID(Table_Dream_show[i] ) == true then
					Delobj(Table_Dream_show[i])
				end	
			end
			ScriptMessage(OwnerID() , -1 , 2 , "[SC_102683_5]" , 1 )---�p���୮���ͪ��I�~�M����J�����A�����I�I
			sleep(25)
			ScriptMessage(OwnerID() , -1 , 2 , "[SC_102683_6]" , 1 ) ---�y�F�Q�w�z���S�Ϊ��F��I�~�M���p���୮���ͪ��ȤF�i�ӡI
			sleep(25)
			ScriptMessage(OwnerID() , -1 , 2 , "[SC_102683_7]" , 1 ) ---�J�M�i�ӤF�I���N�����ڨ��ǥ}�Ǫ�³���a�I�I
			sleep(25)
			local Mob_timer = CreateObjByFlag( 102809 , Flag_timer , 1 , 1 )----�ͥX�@�ӭp�ɾ�
			WriteRoleValue( OwnerID() , EM_RoleValue_Register4, Mob_timer )
			WriteRoleValue( Mob_timer, EM_RoleValue_PID, Boss_2 )
			SetModeEx( Mob_timer , EM_SetModeType_Show, true) ----�q�X
			SetModeEx( Mob_timer , EM_SetModeType_Mark, false) ----�аO
			SetModeEx( Mob_timer , EM_SetModeType_Strikback, false) ---����
			SetModeEx( Mob_timer , EM_SetModeType_Move, false) ---����	
			SetModeEx( Mob_timer , EM_SetModeType_Fight, false) ---�i���
			SetModeEx( Mob_timer , EM_SetModeType_SearchenemyIgnore, false) ---���󤣷|�Q�j�M
			SetModeEx( Mob_timer , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
			SetModeEx( Mob_timer , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
			SetModeEx( Mob_timer , EM_SetModeType_Searchenemy, false)  ---����
			AddToPartition( Mob_timer,roomid1 )
			Show(Mob_timer,roomid1)
		end
	end
end