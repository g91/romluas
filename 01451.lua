function Lua_apon_HolytreeAI()
	while 1 do	
		sleep(10)
		local Check_pet = 0  ---�P�_�d���i�J�԰���
		local Mode1 = 503909
		local Mode2 = 503910
		local Mode3 = 503911
		local ModeCheck = 503938  ----�s�򲣥ͪk�N���XCheck���q
		local CombatBegin = 0	-------------�԰��}�l�X��
		local counter_p1_1 = 0   ----�p��L��
		local counter_p1_2 = 0    ---p1 �k�N_1
		local counter_p1_3 = 0     ---p1 �k�N_2
		local counter_p1_4 = 0      -----p1�k�N����
		local counter_p1_0 = 0 
		local switch = 0  ---- �}��
		local counter_p3_1 = 0  ----�N�ݦs���·t����ѳ��  
		local counter_p3_2 = 0    ----P3 �k�N_1
		local counter_p3_3 = 0      ----P3 �k�N_2
		local counter_p3_4 = 0        ----P3 �k�N_3
		local counter_p2_1 = 0
		local counter_p2_2 = 0
		local free_tree = {}
		
		local Count = 0
		local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		local PPL = SetSearchAllPlayer(roomid1 )
		SetPlot( OwnerID(),"dead","Lua_apon_Holytree_dead_1",50 )  --��������`�@��
		while 1 do	
			sleep(10)
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
			if  ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then	
					
				if ReadRoleValue(AttackTarget,EM_RoleValue_IsPlayer) ~= 1 and Check_pet == 0 then ---�p�G�O�D���a�i�J�԰�
					local Pet_owner = ReadRoleValue( AttackTarget ,EM_RoleValue_OwnerGUID )
					SetPosByFlag( Pet_owner , 780444 , 1 )
					Check_pet = 1
				end
				
				if switch == 0 then	
					--AddBuff( OwnerID() , ModeCheck , 0 , -1 )
					AddBuff( OwnerID() , Mode1 , 0 , -1 )
					switch = 1
					local Flag = 1
					for i = 1 , PPL , 1 do ---�⪱�a��J�ж��� 
						local ID = GetSearchResult()
						if ReadRoleValue( ID , EM_RoleValue_IsDead ) ~= 1 and GetDistance( ID , OwnerID() ) > 250 and GetDistance( ID , OwnerID() ) < 1000 
							and ReadRoleValue( ID, EM_RoleValue_VOC) ~= 0  and ReadRoleValue( ID , EM_RoleValue_RoomID  ) == roomid1 then
							SetPosByFlag( ID , 780418 , Flag ) 
							Flag = Flag + 1
							if Flag > GetMoveFlagCount(780418) -1 then
								Flag = 1
							end
						end
					end

					local Timer = Lua_DW_CreateObj( "flag" ,102493, 780418 ,7 )  ---�إX�ɶ��O�ƾ�
					WriteRoleValue( Timer , EM_RoleValue_PID , OwnerID() ) ---�NBoss��GID�g�J�p�ƾ���PID��
					WriteRoleValue( OwnerID() , EM_RoleValue_Register6   , Timer ) ---�N�p�ɾ�GID�g�JBoss�� Register6 ��   
					SetModeEx( Timer   , EM_SetModeType_Show, false )
					SetModeEx( Timer  , EM_SetModeType_Mark, false )
				end
				
				
				
				
				if CheckBuff (OwnerID() , Mode1) == true then
					counter_p1_0 = counter_p1_0 + 1
					counter_p1_1 = counter_p1_1 + 1
					counter_p1_2 = counter_p1_2 + 1
					counter_p1_3 = counter_p1_3 + 1
					counter_p1_4 = counter_p1_4 + 1
					--Say (OwnerID() , "counter_p1_1="..counter_p1_1)
					--Say (OwnerID() , "counter_p1_2="..counter_p1_2)
					--Say (OwnerID() , "counter_p1_3="..counter_p1_3)
					--Say (OwnerID() , "counter_p1_4="..counter_p1_4)

					if counter_p1_0 == 1 then  -----���j��O���F���ץΡA���������ͪ�
						--for i = 1 , 50 do
							--free_tree[i] = Lua_DW_CreateObj( "flag" ,102392, 780408 ,i )   
							--free_tree = CreateObjByFlag( 102392, 780408 ,i , 1)
							--AddToPartition( free_tree[i] )
							--SetModeEx( free_tree[i]   , EM_SetModeType_Show, false )
							--SetModeEx( free_tree[i]   , EM_SetModeType_Mark, false )
							--SetModeEx( free_tree[i]   , EM_SetModeType_NotShowHPMP, false )
						--end

						ScriptMessage( OwnerID() , -1 , 2 , "[SC_102307_05]", 1 )---�Τl...����...�A��...�e��...���p...�t�a... 
						sleep(10)
						ScriptMessage( OwnerID() , -1 , 2 , "[SC_102307_15]", 1 )---�t��k���ը��W�X���X�j�j���]�k��q�A�o�ѯ�q�ϩ��]��F��y���� 
						sleep(15)
						
						local Tree_1 = Lua_DW_CreateObj( "flag" ,102303, 780385 ,1)   ---objid , flagid , flagnum , �ƶq
						WriteRoleValue( OwnerID() , EM_RoleValue_Register7   , Tree_1 )  
						local Tree_2 = Lua_DW_CreateObj( "flag" ,102304, 780386 , 1)  ---objid , flagid , flagnum , �ƶq
						WriteRoleValue( OwnerID() , EM_RoleValue_Register8   , Tree_2 )  
						local Tree_3 = Lua_DW_CreateObj( "flag" ,102305, 780387 , 1)  ---objid , flagid , flagnum , �ƶq
						WriteRoleValue( OwnerID() , EM_RoleValue_Register9   , Tree_3 )  
						local Tree_4 = Lua_DW_CreateObj( "flag" ,102306, 780388 , 1)  ---objid , flagid , flagnum , �ƶq�A�H�W�|�C���N�|�� Visitor������ѺإX��
						WriteRoleValue( OwnerID() , EM_RoleValue_Register10   , Tree_4 )  
						WriteRoleValue( Tree_4 , EM_RoleValue_PID , OwnerID() )   --�NBoss��ID �g�J�ĥ|�����Ѫ�PID��
						sleep(10)
					end
					
					if counter_p1_1 == 30 and counter_p1_4 <= 100 then     -------�C�j15��N�s�X�y�p��L���z
						ScriptMessage( OwnerID() , -1 , 2 , "[SC_102307_06]", 1 ) ---����...��...����...����...��H...��...�O�q �I�I
						sleep(10)
						--BeginPlot(TargetID() , "Lua_apon_attacktree" , 10)
						CastSpellLV( OwnerID(), AttackTarget, 493582 , 0)   ----��ؼХ�X�۳�p��H���k�N�C
						--sleep(20)
						counter_p1_1 = 0
					end
							
					if counter_p1_2 == 5 and counter_p1_4 <= 108 then     --------�C�j 5 ��A��ؼЩ�@�Ӫk�N
						CastSpellLV( OwnerID(), AttackTarget, 493649 , 4)   ----��ؼЬI��@�Ӷˮ`���k�N�C
						sleep(10)
						counter_p1_2 = 0
					end
						
					if counter_p1_3 == 8 and counter_p1_4 <= 102 then     ------�C�j 10 ��A������@�Ӫk�N
						ScriptMessage( OwnerID() , -1 , 2 , "[SC_102307_07]", 1 ) ---�i�d...��...����...�A��...��...����...�ۤv...��...�ͩR...�F!�I
						sleep(15)
						CastSpellLV( OwnerID(), OwnerID(), 493650 , 0)   ----�����I��@��Dot���k�N�C
						sleep(10)
						counter_p1_3 = 0
					end
					
				elseif 	CheckBuff (OwnerID() , Mode2) == true then
					sleep(10)
					counter_p2_1 = counter_p2_1 + 1
					counter_p2_2 = counter_p2_2 + 1
					--Say (OwnerID() , "counter_p2_1="..counter_p2_1)
					--Say (OwnerID() , "counter_p2_2="..counter_p2_2)
					
					if counter_p2_1 == 1 then    -----�ҰʲĤG���q�ΡA�ҥH���[�W�y�p�ⶥ�q�ɶ��z���P�_�C��counter ���k�s�C
						local del_tree1 = ReadRoleValue(OwnerID(),EM_RoleValue_Register7)
						DelObj ( del_tree1  ) 
						local Tree_11 = Lua_DW_CreateObj( "flag" , 102313 , 780385 , 1 )
						WriteRoleValue( Tree_11 , EM_RoleValue_PID , OwnerID() )
						WriteRoleValue( OwnerID() , EM_RoleValue_Register1   , Tree_11 )   -----�N����Ѫ�ID�g�J�����Register��
						SetModeEx( Tree_11   , EM_SetModeType_Move, false )--����      ---- �ت����F�����·t����Ѳ��ʡA���O�i�H����
						SetModeEx( Tree_11   , EM_SetModeType_Fight , false )--���i�������
						SetModeEx( Tree_11   , EM_SetModeType_Strikback, true )--����
						SetModeEx( Tree_11   , EM_SetModeType_SearchenemyIgnore, true )--�Q�j�M
						SetModeEx( Tree_11   , EM_SetModeType_Mark, true )--�аO
						SetAttack( Tree_11 , AttackTarget )
						sleep(10)
						local del_tree2 = ReadRoleValue(OwnerID(),EM_RoleValue_Register8)
						DelObj ( del_tree2  ) 
						local Tree_22 = Lua_DW_CreateObj( "flag" , 102314 , 780386 , 1 )   ----�ͥX�|�Ӷ·t����ѡA�b������Ѫ���m
						WriteRoleValue( Tree_22 , EM_RoleValue_PID , OwnerID() )
						WriteRoleValue( OwnerID() , EM_RoleValue_Register2   , Tree_22 )
						SetModeEx( Tree_22   , EM_SetModeType_Move, false )--����
						SetModeEx( Tree_22   , EM_SetModeType_Fight , false )--���i�������
						SetModeEx( Tree_22   , EM_SetModeType_Strikback, true )--����
						SetModeEx( Tree_22   , EM_SetModeType_SearchenemyIgnore, true )--�Q�j�M
						SetModeEx( Tree_22   , EM_SetModeType_Mark, true )--�аO
						SetAttack( Tree_22 , AttackTarget )
						sleep(10)
						local del_tree3 = ReadRoleValue(OwnerID(),EM_RoleValue_Register9)
						DelObj ( del_tree3  )
						local Tree_33 = Lua_DW_CreateObj( "flag" , 102315 , 780387 , 1 )
						WriteRoleValue( Tree_33 , EM_RoleValue_PID , OwnerID() )                   -----�åB�N����� ID ���O�J�C�Ӿ���Ѫ�PID���A�]������Ѧ�����A�|���������C
						WriteRoleValue( OwnerID() , EM_RoleValue_Register3   , Tree_33 )
						SetModeEx( Tree_33   , EM_SetModeType_Move, false )--����
						SetModeEx( Tree_33   , EM_SetModeType_Fight , false )--���i�������
						SetModeEx( Tree_33   , EM_SetModeType_Strikback, true )--����
						SetModeEx( Tree_33   , EM_SetModeType_SearchenemyIgnore, true )--�Q�j�M
						SetModeEx( Tree_33   , EM_SetModeType_Mark, true )--�аO
						SetAttack( Tree_33 , AttackTarget )
						sleep(10)
						local del_tree4 = ReadRoleValue(OwnerID(),EM_RoleValue_Register10)
						DelObj ( del_tree4  ) 
						local Tree_44 = Lua_DW_CreateObj( "flag" , 102336 , 780388 , 1 )
						WriteRoleValue( Tree_44 , EM_RoleValue_PID , OwnerID() )
						WriteRoleValue( OwnerID() , EM_RoleValue_Register4   , Tree_44 )
						SetModeEx( Tree_44   , EM_SetModeType_Move, false )--����
						SetModeEx( Tree_44   , EM_SetModeType_Fight , false )--���i�������
						SetModeEx( Tree_44   , EM_SetModeType_Strikback, true )--����
						SetModeEx( Tree_44   , EM_SetModeType_SearchenemyIgnore, true )--�Q�j�M
						SetModeEx( Tree_44   , EM_SetModeType_Mark, true )--�аO
						SetAttack( Tree_44 , AttackTarget )
						sleep(10)
						BeginPlot(Tree_11,"LuaS_Discowood_CheckPeace",0)     -------------�H�U�|�欰�A�p�G�|�Ӿ���Ѧb 8.5 ��
						BeginPlot(Tree_22,"LuaS_Discowood_CheckPeace",0)
						BeginPlot(Tree_33,"LuaS_Discowood_CheckPeace",0)
						BeginPlot(Tree_44,"LuaS_Discowood_CheckPeace",0)
						SetPlot( Tree_11,"dead","Lua_apon_TreeLeader_dead_HP",50 )  --���`�@��
						SetPlot( Tree_22,"dead","Lua_apon_TreeLeader_dead_HP",50 )  --���`�@��
						SetPlot( Tree_33,"dead","Lua_apon_TreeLeader_dead_HP",50 )  --���`�@��
						SetPlot( Tree_44,"dead","Lua_apon_TreeLeader_dead_HP",50 )  --���`�@��
					end	
					
					if counter_p2_2 == 6 then     -----�q�o�@��_�}�l�ĤG���q�A�|�Ӷ·t���Ѫ������ԡA�·t���Ѫ��s�b�ɶ��M�s�X�ɶ��ѤU�誺for�j�鱱��
						local T1 = ReadRoleValue(OwnerID() , EM_RoleValue_Register1)   ----�N����� Register Ū�X�� 
						local T2 = ReadRoleValue(OwnerID() , EM_RoleValue_Register2)
						local T3 = ReadRoleValue(OwnerID() , EM_RoleValue_Register3)
						local T4 = ReadRoleValue(OwnerID() , EM_RoleValue_Register4)
						local Boss_chose = { T1 , T2 , T3 , T4 }  ----���X�@�ӥi�H��ܪ��}�C
						SetModeEx( OwnerID()   , EM_SetModeType_Move, false )--����
						SetModeEx( OwnerID()   , EM_SetModeType_Fight , false )--���i�������
						SetModeEx( OwnerID()   , EM_SetModeType_Strikback, false )----���i����
						ScriptMessage( OwnerID() , -1 , 2 , "[SC_102307_08]", 1 ) ---���έ�...�N...��...�A��...�@�@...���ѭ�...�u����...�O�q�a�I�I
						sleep(15)
						CastSpell( OwnerID(), OwnerID(), 493584 )  ----�ǰe�N���S��
						AddBuff (OwnerID() , 503888 , 0 , 90)    ----�����ۤv�W�@�Ӥ��|����Buff
						sleep(15)
						SetPosByFlag( OwnerID(), 780389 , 1 )
						CancelBuff ( OwnerID() , 503888)
						sleep(30)
						local Tree_leader = 0
						for i = 1 , table.getn ( Boss_chose) , 1 do     -----�۷��O for i = 1 , 4 , 1 do �A �ϥ����j��]�u�]�|���A�b�}�C���A���h�֪F��A�N�]�X��
							local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
							if  ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then	
								Tree_leader = DW_Rand( table.getn ( Boss_chose))   ----�hRand�b Boss_chose �}�C�����|�ӭ�
			
								if Boss_chose[Tree_leader] == T1 then
									CastSpell( OwnerID(), Boss_chose[Tree_leader] , 493589 )   -----����� Rand �쪺����ѬI��@�Ӫk�N
								end
			
								if Boss_chose[Tree_leader] == T2 then
									CastSpell( OwnerID(), Boss_chose[Tree_leader] , 493589 )   -----����� Rand �쪺����ѬI��@�Ӫk�N
								end
			
								if Boss_chose[Tree_leader] == T3 then
									CastSpell( OwnerID(), Boss_chose[Tree_leader] , 493589 )   -----����� Rand �쪺����ѬI��@�Ӫk�N
								end
			
								if Boss_chose[Tree_leader] == T4 then
									CastSpell( OwnerID(), Boss_chose[Tree_leader] , 493589 )   -----����� Rand �쪺����ѬI��@�Ӫk�N
								end
							else
								break
							end	
								
							table.remove ( Boss_chose , Tree_leader)  -----�N Rand �X�Ӫ��� �q ��Ӱ}�C���R��  ----�w�g�i�H���T����ܨ�
							table.getn ( Boss_chose)    -------�b�W�椤�A�w�N�}�C�����@�ӭȧR���A�ҥH�}�C�����סA�n���sŪ�L�C
							sleep(300)   -----�[�W�·t����ѻ��ܩM�ޯ઺�ɶ��A�ҥH�A�@�Ӱj��sleep 40 �� 
						end
						
					end
							
				elseif 	CheckBuff (OwnerID() , Mode3) == true then
					--Say( OwnerID() , "Mode3 !!" )
					sleep(10)
					counter_p3_1 = counter_p3_1 + 1
					counter_p3_2 = counter_p3_2 + 1
					counter_p3_3 = counter_p3_3 + 1
					counter_p3_4 = counter_p3_4 + 1       -----�o�O���_���|��Debuff
					--Say (OwnerID() , "counter_p3_1="..counter_p3_1)
					--Say (OwnerID() , "counter_p3_2="..counter_p3_2)
					--Say (OwnerID() , "counter_p3_3="..counter_p3_3)
					--Say (OwnerID() , "counter_p3_4="..counter_p3_4)
				
					if counter_p3_1 == 1 then
						--say(OwnerID() , "P_3 Start")
						ScriptMessage( OwnerID() , -1 , 2 , "[SC_102307_09]", 1 ) ---�O...�ɭԤF....�ڪ�...�B��...
						sleep(10)
						ScriptMessage( OwnerID() , -1 , 2 , "[SC_102307_10]", 1 ) ---��...�o��...�Ӧ���...�Τl...���D...��ڪ�...��O....�a�I�I
						sleep(15)
						CastSpell (OwnerID() , OwnerID() , 493592 )---�N�� Buff �K�b�|�Ӫ��Ѩ��W�A������Ѧb�ĤT���q�ɤ]�i�H���X�ۦ��C
						SetModeEx( OwnerID()   , EM_SetModeType_Move, true )--����
						SetModeEx( OwnerID()   , EM_SetModeType_Fight , true )--���i�������
						SetModeEx( OwnerID()   , EM_SetModeType_Strikback, true )----���i����
						Hide(OwnerID() )
						Show(OwnerID(),roomid1 )
						sleep(10)
					end
					
					if counter_p3_2 == 4 then
						CastSpellLV( OwnerID(), AttackTarget, 493590 , 4 )----����ˮ`��
						counter_p3_2 = 0
						sleep(10)
					end
					
					if counter_p3_3 == 6 then
						ScriptMessage( OwnerID() , -1 , 2 , "[SC_102307_11]", 1 ) ---���⪺...����...����...�o�ۡI�I
						sleep(15)
						CastSpellLV( OwnerID(), OwnerID(), 493652 , 0 )---AE�� 
						counter_p3_3 = 0
						sleep(10)
					end
					
					if counter_p3_4 == 7 then
						ScriptMessage( OwnerID() , -1 , 2 , "[SC_102307_12]", 1 ) ---�L��...��...�Τl�I�I
						sleep(10)
						ScriptMessage( OwnerID() , -1 , 2 , "[SC_102307_13]", 1 ) ---�N...��...�A��...�F��...��H...���j��....����...�a�I�I
						sleep(15)
						CastSpellLV( OwnerID(), OwnerID(), 493651 , 0 )----�|���|��Debuff
						counter_p3_4 = 0
						sleep(10)
					end
				end
			else
				CancelBuff ( OwnerID() , 503888)
				--Say(OwnerID(),"1")
				SetPosByFlag( OwnerID(), 780389 , 1 )
				--Say(OwnerID(),"2")
				SetFightMode ( OwnerID(),1, 1, 1,1 )
				--Say(OwnerID(),"3")
				SetModeEx( OwnerID()   , EM_SetModeType_Move, true )--����
				SetModeEx( OwnerID()   , EM_SetModeType_Fight , true )--���i�������
				SetModeEx( OwnerID()   , EM_SetModeType_Strikback, true )--����
				sleep(10)
				--if switch == 1 then
					--for i = 1 , 50 , 1 do
						--if free_tree[i] ~= nil then 
							--if ( CheckID( free_tree[i] ) ) == true then	
								--DelObj ( free_tree[i]  )
							--end	
						--else
							--break
						--end
					--end
				--end
				--free_tree = 0
				--local D1 = ReadRoleValue(OwnerID(),EM_RoleValue_Register7)
				--local D2 = ReadRoleValue(OwnerID(),EM_RoleValue_Register8)
				--local D3 = ReadRoleValue(OwnerID(),EM_RoleValue_Register9)
				--local D4 = ReadRoleValue(OwnerID(),EM_RoleValue_Register10)
				--local D5 = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
				--local D6 = ReadRoleValue(OwnerID(),EM_RoleValue_Register2)
				--local D7 = ReadRoleValue(OwnerID(),EM_RoleValue_Register3)
				--local D8 = ReadRoleValue(OwnerID(),EM_RoleValue_Register4)
				--local D9 = ReadRoleValue(OwnerID(),EM_RoleValue_Register6)
				--DelObj ( D1  ) 
				--DelObj ( D2  ) 
				--DelObj ( D3  ) 
				--DelObj ( D4  )
				--DelObj ( D5  )
				--DelObj ( D6  )
				--DelObj ( D7  )
				--DelObj ( D8  )
				--Delobj ( D9 )
				--CastSpell( OwnerID(), OwnerID(), 493588 )  ------�p�G���a�b�Ĥ@���q�N���ΡA�񦹧ޯ�A�h�i�H���|�ӥ�������Ѧ۱�
				sleep(10)
				break
			end
		end
	end
end


function Lua_apon_Tree_timer() ---�p�ɾ��Ǫ��M��
	local switch = 0
	local free_tree = {}
	local Boss = ReadRoleValue(OwnerID(),EM_RoleValue_PID)--�NPID����Boss��GIDŪ�X��
	local Boss_die = ReadRoleValue(OwnerID(),EM_RoleValue_Register6)
	while 1 do 
		sleep(10)
		local counter1 = 0
		local counter2 = 0
		local Mode1 = 503909
		local Mode2 = 503910
		local Mode3 = 503911
		while 1 do
			sleep(10)
			counter1 = counter1 + 1
			counter2 = counter2 + 1
			--say (Boss,"Counter1="..counter1)
			--say (Boss,"Counter2="..counter2)
			
			if counter1 == 30 then ---�쥻120
				if CheckBuff(Boss , Mode1)	== true  then
					CancelBuff( Boss , Mode1 )
					AddBuff( Boss , Mode2 , 0 , -1 )
				end
			
			elseif counter2 == 60 then ---�쥻240
				if CheckBuff(Boss , Mode2) == true then
					CancelBuff( Boss , Mode2 )
					AddBuff( Boss , Mode3 , 0 , -1 )
				end
			end
			
			if Boss_die == 1 then
				for i = 1 , 50 , 1 do
					if free_tree[i] ~= nil then 
						if ( CheckID( free_tree[i] ) ) == true then	
							DelObj ( free_tree[i]  )
						end	
					else
						break
					end
				end
				sleep(20)
				Delobj(OwnerID())
			end
		
			local AttackTarget = ReadRoleValue( Boss , EM_RoleValue_AttackTargetID ) --- �p�G���i�J�԰�
			if  ( AttackTarget ~= 0 ) and ( CheckID(Boss) ) == true then
				sleep(30)
				if switch == 0 then
					switch = 1
					for i = 1 , 50 do ---�N���ת��ͥX��
						free_tree[i] = Lua_DW_CreateObj( "flag" ,102392, 780408 ,i )   
						SetModeEx( free_tree[i]   , EM_SetModeType_Show, false )
						SetModeEx( free_tree[i]   , EM_SetModeType_Mark, false )
					end
				end	
			
			else
				if switch == 1 then
					for i = 1 , 50 , 1 do
						if free_tree[i] ~= nil then 
							if ( CheckID( free_tree[i] ) ) == true then	
								DelObj ( free_tree[i]  )
								--Say(OwnerID(),"del door")
							end	
						else
							break
						end
					end
				end
				
				local D1 = ReadRoleValue(Boss,EM_RoleValue_Register7)
				local D2 = ReadRoleValue(Boss,EM_RoleValue_Register8)
				local D3 = ReadRoleValue(Boss,EM_RoleValue_Register9)
				local D4 = ReadRoleValue(Boss,EM_RoleValue_Register10)
				local D5 = ReadRoleValue(Boss,EM_RoleValue_Register1)
				local D6 = ReadRoleValue(Boss,EM_RoleValue_Register2)
				local D7 = ReadRoleValue(Boss,EM_RoleValue_Register3)
				local D8 = ReadRoleValue(Boss,EM_RoleValue_Register4)
				DelObj ( D1  ) 
				DelObj ( D2  ) 
				DelObj ( D3  ) 
				DelObj ( D4  )
				DelObj ( D5  )
				DelObj ( D6  )
				DelObj ( D7  )
				DelObj ( D8  )
				sleep(20)
				Delobj(OwnerID())
			end
		end
	end
end

			
function Lua_apon_killflag()  ----���ת��I��
	while 1 do
		sleep(10) 
		SetPlot( OwnerID(),"Collision","Lua_apon_leave_check_1",0 ) ---�I���ǰe
	end
end


function Lua_apon_leave_check_1()  ---�g�L�I����A�N���a�ǰe��@�өw�I
	ScriptMessage( OwnerID() , -1 , 2 , "[SC_102307_14]", 1 )---�Q...�k...�ܡH�A...�o...�L��...��...����
	SetPosByFlag( OwnerID(), 780389 , 3 )
end



function Lua_apon_TreeLeader_dead_HP()   -------����Ѫ����`�@���A�|���������q�C

	local Boss = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local BossMaxHP = ReadRoleValue(Boss , EM_RoleValue_MaxHP)
	local BossNowHP = ReadRoleValue(Boss , EM_RoleValue_HP)
	local Check_HP = (BossNowHP/BossMaxHP)*100
	
	if Check_HP >= 6 then
		WriteRoleValue(Boss , EM_RoleValue_HP , BossNowHP-BossMaxHP*0.05)
	else
		KillID(TargetID(),Boss)
	end
end

function Lua_apon_Holytree_dead_1()  ----���������N�����N���ͥX��
	Hide(OwnerID())
	local Door_leader = ReadRoleValue(OwnerID(),EM_RoleValue_Register6)---Ū�X�p�ɾ�
	WriteRoleValue( Door_leader , EM_RoleValue_Register2   , 1 ) ----�p�G�����F�A�N�p�ɾ���Register2 �令 1 
	local King_1 = Lua_DW_CreateObj( "flag" ,102119, 780389 ,1)
	SetModeEx( King_1   , EM_SetModeType_Show , false )
end

function Lua_apon_Holytree_dead_2()  ----�N���@�����b�������ܪ̨��W
	sleep(50)
	local King = Lua_DW_CreateObj( "flag" ,102338, 780389 ,1)
	AddBuff(King,503888,1,-1) --�W�@�Ӥ��������Buff
	local GoodTree_1 = Lua_DW_CreateObj( "flag" ,102337, 780385 ,1)   ---objid , flagid , flagnum , �ƶq
	local GoodTree_2 = Lua_DW_CreateObj( "flag" ,102389, 780386 , 1)  ---objid , flagid , flagnum , �ƶq
	local GoodTree_3 = Lua_DW_CreateObj( "flag" ,102390, 780387 , 1)  ---objid , flagid , flagnum , �ƶq
	local GoodTree_4 = Lua_DW_CreateObj( "flag" ,102391, 780388 , 1)  ---objid , flagid , flagnum , �ƶq�A�H�W�|�Ӭ��������ͥX�Ӫ�
	sleep(30)
	ScriptMessage( OwnerID() , -1 , 2 , "[SC_102307_01]", 1 )  ----��...��...��...�O...���...�F�H
	sleep(20)
	ScriptMessage( OwnerID() , -1 , 2 , "[SC_102307_02]", 1 )  ----�H���I�O...�A��...�ѱ�...�ڭ�...��....�ܡH
	sleep(20)
	ScriptMessage( OwnerID() , -1 , 2 , "[SC_102307_03]", 1 )  ------�H��...��...��...�B��
	sleep(20)
	ScriptMessage( OwnerID() , -1 , 2 , "[SC_102307_16]", 1 )----�M�N��...�j�Τl
	sleep(20)
	ScriptMessage( OwnerID() , -1 , 2 , "[SC_102307_17]", 1 )----�A...�{��...�A�٥i�H...����...�h�[ ? 
	sleep(20)
	sysCastSpellLV( King , King  , 493900 , 1 )---���Τ��{��
	sleep(10)
	local Bug_king = Lua_DW_CreateObj( "flag" ,102568, 780393 ,2)---�ͥX���Τ�
	SetModeEx( Bug_king , EM_SetModeType_Move, false )--���� ���i    
	AddBuff(Bug_king,503888,1,-1) --�W�@�Ӥ��������Buff
	sleep(20)
	CancelBuff( King, 503888 )
	SetAttack( King , Bug_king )
	SetAttack( Bug_king , King )
	sleep(50)
	ScriptMessage( OwnerID() , -1 , 2 , "[SC_102307_18]", 1 )  ----�t��k���ժ�...�s�b...���O�A...�ҥi�H...�ʷn��
	sleep(10)
	CastSpellLV( King , Bug_king  , 493785 , 1 )---�t�𤧫�
	sleep(10)
	Delobj(King)
	local King_1 = Lua_DW_CreateObj( "flag" ,113387, 780389 ,1)---�ͥX���ȥ�NPC
	ScriptMessage( OwnerID() , -1 , 2 , "[SC_102307_04]", 1 )----�t��k����...�b��...�^�W...�ڭ�...��...��§
	sleep(10)
	local Box =  Lua_DW_CreateObj( "flag" ,102388, 780393 ,1) ---�_�c���ͥX�I
end