----------------------------------------------------------Z18�j�ĩ�AI
function lua_Dy_Z18BossAI_1()
	while 1 do 
		sleep(10)
		local counter1 = 0 ----------�@��ޯ�p�ɾ�
		local counter2 = 0 ----------���Z�����u���
		local skill = {496194 , 496195 , 496196 , 496197 } ------------���餤�ˮ`�B�H���D�H�����ˮ`�B�ۨ����AE�B�����x���ˮ`
		local skillspeak = { 0 , "[SC_104458_1]" , 0 , "[SC_104458_2]"} 
		local skillLV = { 4 , 5 , 2 , 0 }
		local skilluse = 0
		local Luck = Rand( 100 ) --�ۦ��ü�
		local CH1 = ReadRoleValue( OwnerID() , EM_RoleValue_PID )  --Ū�X�����ID
		local CH1T = 0 --- ���q
		local roomid = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) --Ū�X����b���@�h
		local Table_mob = {} ---�p���x�s��
		local CombatBegin = 0 --BOSS���԰��}���ܼ�
		local CH1T_2_Start = 0 --�i�J�ĤG���q���ǰe�@��
		local Mob_Chose = 0 --�ĤG���q�ɡA�Q��쪺�p���Y�H
		while 1 do 
			sleep(10)
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID ) --Ū���b�������ؼ�
			if  ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then	
				WriteRoleValue( CH1, EM_RoleValue_Register9, 1)
				CH1T = ReadRoleValue( OwnerID() , EM_RoleValue_Register1 ) --Ū�X�Ĥ@�ӼȦs������
				counter1 = counter1 + 1
				counter2 = counter2 + 1
				--say (OwnerID(), "counter1 = "..counter1)
				--say (OwnerID(), "counter2 = "..counter2)
				CombatBegin = 1 --��ܥ��b�԰���
				if CH1T == 1 then -----Boss�Ĥ@���q�@��ۦ�
					if counter1 >= 6 then
						Luck = Rand( 100 ) --�ۦ��ü�
						if (Luck >=0 and Luck <40) then 
							skilluse = 1 --���餤�ˮ`
							BOSSTarget = AttackTarget
							CastSpellLV( OwnerID() , BOSSTarget , skill[skilluse] , skillLV[skilluse] )
						elseif (Luck >=40 and Luck <70) then
							skilluse = 3 --�ۨ����AE
							BOSSTarget = OwnerID()
							CastSpellLV( OwnerID() , BOSSTarget , skill[skilluse] , skillLV[skilluse] )
						elseif (Luck >=70 and Luck <=100) and counter2 < 45 then
							skilluse = 2 --�H���D�H�����ˮ`
							BOSSTarget = HateTargetID() --�i�H���줳��C�������@�H
							ScriptMessage( OwnerID() , -1 , 2 , skillspeak[skilluse] , 1 )
							sleep(10)
							CastSpellLV( OwnerID() , BOSSTarget , skill[skilluse] , skillLV[skilluse] )
						elseif counter2 >=45 then
							counter2 = 0
						end
						counter1 = 0
					end
					CH1T_2_Start = 0
				
				elseif CH1T == 2 then
					if CH1T_2_Start == 0 then
						Mob_Chose = ReadRoleValue( OwnerID() , EM_RoleValue_Register2 )
						sleep(15)
						ScriptMessage( OwnerID() , -1 , 2 , "[SC_104458_3]" , 1 ) -- �O�o��r��
						CastSpellLV( OwnerID() , OwnerID() , 496199 , 0 )
						-- Boss �@�ӬI�k�ʧ@�A�۪k�� 2 ��
						sleep(20)
						-- Addbuff �� Mob_Chose
						---�H�U���ǰe�A�ۦP�󲾧δ��v�A���O���ୱ�V---
						local Obj = Role:new( OwnerID() ) 
						local TargetObj = Role:new( Mob_Chose ) ---��Q���쪺�p���Y�H���y��
						local Dir --���V
						local Dx 
						local Dz 
						SetPos( OwnerID() , TargetObj:X() , TargetObj:Y() , TargetObj:Z() , TargetObj:Dir() ) -- (�N(OOO ,�Ǩ� XXX��, X , Y , Z  , Dir )��m XYZ DIR �i��Ʀr
						sleep(10)
						--CastSpellLV( OwnerID() , OwnerID() , 496200 , 0 )
						SysCastSpellLv(OwnerID(),OwnerID(),496200 , 0 )
						--say(OwnerID(),"496200")
						---------
						Killid( OwnerID() , Mob_Chose )
						--say(OwnerID(),"SetPos ok !!!")
						CH1T_2_Start = 1
					end	
					--AE�@��
					if counter1 >= 6 then -----Boss�ĤG���q�@��ۦ�
						Luck = Rand( 100 ) --�ۦ��ü�
						if (Luck >=0 and Luck <40) then 
							skilluse = 4 --�����x���ˮ`
							BOSSTarget = AttackTarget
							ScriptMessage( OwnerID() , -1 , 2 , skillspeak[skilluse] , 1 )
							sleep(20)
							CastSpellLV( OwnerID() , BOSSTarget  , skill[skilluse] , skillLV[skilluse] )
						elseif (Luck >=40 and Luck <55) then
							skilluse = 3 --�ۨ����AE
							BOSSTarget = OwnerID()
							CastSpellLV( OwnerID() , BOSSTarget, skill[skilluse] , skillLV[skilluse] )
						elseif (Luck >=55 and Luck <75) and counter2 < 45 then
							skilluse = 2 --�H���D�H�����ˮ`
							BOSSTarget = HateTargetID() --�i�H���줳��C�������@�H
							ScriptMessage( OwnerID() , -1 , 2 , skillspeak[skilluse] , 1 )
							sleep(10)
							CastSpellLV( OwnerID() , BOSSTarget , skill[skilluse] , skillLV[skilluse] )
						elseif (Luck >=75 and Luck <=100) then
							skilluse = 1 --���餤�ˮ`
							BOSSTarget = AttackTarget
							CastSpellLV( OwnerID() , BOSSTarget , skill[skilluse] , skillLV[skilluse] )
						elseif counter2 >=45 then
							counter2 = 0
						end
						counter1 = 0
					end
				end
				
			else --���}�԰�
				if CombatBegin == 1 then
					WriteRoleValue( CH1, EM_RoleValue_Register9, 2)
				end
				
			end		
		end			
	end			
end

----------------------------------------------------------Z18�j�ĩԱ��
-----104460 ���~��
-----104512 �j�ĩԱ��
-----104458 �j�ĩ�
-----780696 �p��X�СABoss & ����
-----780385 �p���Y�H�X��
function lua_Dy_Z18BossAIC_1()----���
---�ͥXBoss�Ъ����--�ݭn�`�N�O�_������--�ݭn�`�N�ͥX�Ӫ����O�_�M�������K��---
		local roomid = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) --Ū�X����b���@�h
		local Door = CreateObjByFlag( 104532 , 780386 , 2 , 1 ) ---Boss�Ъ���� --�u�ؤ@���ABOSS���`�~�ݭn����
		SetModeEx( Door , EM_SetModeType_Show, true) ----�q�X
		SetModeEx( Door , EM_SetModeType_Mark, false) ----�аO
		SetModeEx( Door , EM_SetModeType_Strikback, false) ---����
		SetModeEx( Door , EM_SetModeType_Move, false) ---����	
		SetModeEx( Door , EM_SetModeType_Fight, false) ---�i���
		SetModeEx( Door , EM_SetModeType_SearchenemyIgnore, true) ---���󤣷|�Q�j�M
		SetModeEx( Door , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
		SetModeEx( Door , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
		SetModeEx( Door , EM_SetModeType_Searchenemy, false)  ---����
		SetModeEx( Door   , EM_SetModeType_Obstruct, true )--����
		AddToPartition( Door,roomid )
		WriteRoleValue( OwnerID() , EM_RoleValue_Register4 , Door)--�N������GID�x�s�ܱ����Register4���A�H��K���R����
		WriteRoleValue( OwnerID(), EM_RoleValue_Register9, 0)
--��������������������---------------------------------
	while 1 do
		sleep(10)
		local roomid = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) --Ū�X����b���@�h
		local Boss = CreateObjByFlag( 104458 , 780696 , 1 , 1 ) ---�ͥXBoss (BOSS�s��  ,�X�нs�� ��N���X�� �ͥX�X�ө�)
		SetPlot( Boss,"dead","lua_Dy_Z18BossAI_1_dead",10 )----Boss ���`�@��
		WriteRoleValue( Boss, EM_RoleValue_PID, OwnerID())
		WriteRoleValue( OwnerID(), EM_RoleValue_Register1, Boss)
		AddToPartition( Boss,roomid )
		BeginPlot( Boss, "lua_Dy_Z18BossAI_1", 10) ---Boss���԰�Function (  BOSS BOSS��LUA_AI  ��\�C10=1��)
		local CombatBegin_Boss = 0
		local counter1 = 0
		local counter2 = 0 ---Boss�g�ɥέp��
		local Trap_Table = {}
		local Num_Rand = 0
		local Rand_Trap_Table = {}
		local Num_Rand_Trap_Table = 0
		local Trap_1 = 0
		local Trap_2 = 0
		local Trap_3 = 0
		local Trap_Num = 0
		local Mob_Flag = 0
		local All_Mob_Table = {} ---�N�Ҧ������Y�H�s�J��Table��
		local Mob_Num = 0
		local Mob_Chose = 0 ---�Q��ܨ쪺�p���Y�H
		local First_Door = 0 ---�Ĥ@���ͫe���P�_��
		local First_Trap = 0 ---�Ĥ@���͸��~���P�_��
		local GameOver = 0 ---�g�z�P�_��
		while 1 do
			sleep(10)
			CombatBegin_Boss = ReadRoleValue( OwnerID() , EM_RoleValue_Register9 )	
			--counter1 = counter1 + 1
			--say (OwnerID(), "counter1 = "..counter1)
			if  CombatBegin_Boss == 1 then	
				counter1 = counter1 + 1
				counter2 = counter2 + 1
				--say (OwnerID(), "counter1 = "..counter1)
				
				if GameOver == 0 and counter2 >= 480 then
					AddBuff(Boss , 507663 , 0 , -1) ---Boss �i�J�g��
				
				elseif counter1 == 1 then ---�P�_����1���q ����45��
				
---�ͥXBoss�Ъ��e��--�ݭn�`�N�O�_������--�ݭn�`�N�ͥX�Ӫ����O�_�M�������K��---
					if First_Door == 0 then --�[�J�o�ӧP�_�Ȫ���]�A�O���F���n�C�@����F�Ĥ@���q�A���|�ͤ@���e��
						local Door = CreateObjByFlag( 104532 , 780386 , 1 , 1 ) ---Boss�Ъ��e��
						SetModeEx( Door , EM_SetModeType_Show, true) ----�q�X
						SetModeEx( Door , EM_SetModeType_Mark, false) ----�аO
						SetModeEx( Door , EM_SetModeType_Strikback, false) ---����
						SetModeEx( Door , EM_SetModeType_Move, false) ---����	
						SetModeEx( Door , EM_SetModeType_Fight, false) ---�i���
						SetModeEx( Door , EM_SetModeType_SearchenemyIgnore, true) ---���󤣷|�Q�j�M
						SetModeEx( Door , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
						SetModeEx( Door , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
						SetModeEx( Door , EM_SetModeType_Searchenemy, false)  ---����
						SetModeEx( Door   , EM_SetModeType_Obstruct, true )--����
						AddToPartition( Door,roomid )
						WriteRoleValue( OwnerID() , EM_RoleValue_Register3 , Door)--�N������GID�x�s�ܱ����Register3���A�H��K���R����
						First_Door = 1
					end
--��������������������---------------------------------		
					Rand_Mob_Table = {}
					Rand_Trap_Table = {}
					--say (OwnerID(), "SP_1 !!!")
					WriteRoleValue( Boss, EM_RoleValue_Register1, 1)
					local Num = 0
---�b�H�U�j�餤�A�O���F�ƥ��]�w�T�ӳ����n�b���X�ӺX�Ц�m�ͥX------	
					while true do
						Num_Rand = Rand(15)+1 ---�q1~15�h�H����@�ӡA���ORand�O�q�u0�v�}�l�ơA�ҥH�O�o�n�u+1�v
						Num_Rand_Trap_Table = table.getn(Rand_Trap_Table)
						if Num_Rand_Trap_Table == 3 then
							Trap_1 = 0
							Trap_2 = 0
							Trap_3 = 0
							break
						elseif Trap_1 == 0 and Num_Rand ~= 1  then  ----�u ~=  �o�O������A���N��v
							Trap_1 = Num_Rand
							table.insert( Rand_Trap_Table , Trap_1 )
						elseif Trap_2 == 0 and Num_Rand ~= 1 and Num_Rand ~= Trap_1 then
							Trap_2 = Num_Rand
							table.insert( Rand_Trap_Table , Trap_2 )
						elseif Trap_3 == 0 and Num_Rand ~= 1 and Num_Rand ~= Trap_1 and Num_Rand ~= Trap_2 then
							Trap_3 = Num_Rand
							table.insert( Rand_Trap_Table , Trap_3 )
						end
					end
					if First_Trap == 0 then ---�ت��b����Boss�Ĥ@���}�ԮɡA�ݭn5���A�~�|�ͥX���~��
						sleep(50)
						First_Trap = 1
					end
--��������������������---------------------------------		
					for i = 1 , 3 , 1 do
						local BOSSTrap = CreateObjByFlag( 104460 , 780696 , Rand_Trap_Table[i] , 1 ) 
						SetModeEx( BOSSTrap , EM_SetModeType_Move , false )			------������
						SetModeEx( BOSSTrap , EM_SetModeType_Strikback , false )	------������
						SetModeEx( BOSSTrap , EM_SetModeType_Fight , false )		------���i���
						SetModeEx( BOSSTrap , EM_SetModeType_Searchenemy , false )	------������		
						SetModeEx( BOSSTrap , EM_SetModeType_Mark , false )			------���i�I��	(�u�n���o�ӴN�i�H���]�X���)
						SetModeEx( BOSSTrap , EM_SetModeType_NotShowHPMP , false )	------��show���
						--SetModeEx( BOSSTrap , EM_SetModeType_HideName , false ) 		-------����ܦW��
						AddToPartition( BOSSTrap,roomid )
						table.insert( Trap_Table , BOSSTrap ) --�⳴���X�Щ�i��
						AddBuff(BOSSTrap , 506964 , 0 , -1) --���~����idle�S��
						sysCastSpellLV( OwnerID() , BOSSTrap  , 496201 , 1 ) -------�������~������m�A��@�����Ϊ��a�p�C
						Beginplot(BossTrap,"AP_Zone134_104458_Trap_start",10) ---��Ĳ�o�@���ǥ�Beginplot�����Y�A����@��A�o��
						--SetPlot( BOSSTrap,"collision","AP_Zone134_104458_Trap",20 )
					end
					
				elseif counter1 == 10 or counter1 == 20  or counter1 == 30 or counter1 == 40 then ---�ͥX�p���Y�H���ɶ��y
					---�ˬd�bTable�����p���Y�H�O�_���ۡA�p�G���`�A�h�qTable������---
					for i = 1 , table.getn(All_Mob_Table), 1 do
						if All_Mob_Table[i] ~= nil then 
							if ReadRoleValue( All_Mob_Table[i] , EM_RoleValue_IsDead) == 1 or CheckID(All_Mob_Table[i] ) == false then
								table.remove ( All_Mob_Table , i)
							end
						end
					end
					----------------
					Mob_Num = table.getn(All_Mob_Table)
					--say(OwnerID(),"ALL Mob =="..Mob_Num)
					if Mob_Num >= 20 then ---�p���Y�H�b���W���̦h���ơA�ݭn����C
						--say(OwnerID(),"Mob Full!!")
						sleep(10)
					else
						--say(OwnerID(),"Start Mob !!")
						Mob_Flag = Rand(10)+1
						local Mob = CreateObjByFlag( 104459 , 780385 , Mob_Flag , 1 ) --�ͥX�p���Y�H(�s��  ,�X�нs�� ��N���X�� �ͥX�X�ө�)
						--SetPlot( Boss,"dead","lua_Dy_Z18BossAI_1_dead",10 )----Boss ���`�@��
						WriteRoleValue( Mob, EM_RoleValue_PID, OwnerID()) ---�N�����GID�s�J�p���Y�H��PID��
						WriteRoleValue( Mob, EM_RoleValue_Register1, Boss) --�NBoss��GID�s�J�p���Y�H�� Register1 ��
						AddToPartition( Mob,roomid )
						BeginPlot( Mob, "AP_Zone134_104458_hole", 10)
						SetPlot( Mob,"dead","AP_Zone134_Mob_dead",10 )----�p���Y�H���`�@���A�ت��b��A���`��A��Boss����q
						AddBuff(Mob , 506966 , 0 , -1) --�p���Y�H��˪�Buff
						AddBuff(Mob , 507721 , 0 , -1) --�p���Y�H�����ؼ���w��Buff�A���|�]��������ܥؼ�
						table.insert( All_Mob_Table , Mob )---�N�ͥX�Ӫ��p���Y�H���s�J All_Mob_Table ���A�H��K���m�� 
					end

				--elseif counter1 == 5 then --�P�_����2���q ����15��
				elseif counter1 == 46 then --�P�_����2���q ����15��
					--say (OwnerID(), "SP_2 !!!")
					Trap_Num = table.getn(Trap_Table) --Ū��Trap_Table�̭����ƶq
					--say (OwnerID(), "Trap_Num ="..Trap_Num)
					for i = 1 , Trap_Num ,1 do --�]�W�����ƶq������
						Delobj(Trap_Table[i]) --�R��Trap_Table�̪��F�� [i]��Trap_Table�ĴX��
					end
					Trap_Table = {} --���s���@�Ӱ��b��Table
					WriteRoleValue( Boss, EM_RoleValue_Register1, 2)
					-----�D��@���p���Y�H�ABoss�ǳƶǰe�ܤp���Y�H����m---
					for i = 1 , table.getn(All_Mob_Table), 1 do
						if All_Mob_Table[i] ~= nil then 
							if ReadRoleValue( All_Mob_Table[i] , EM_RoleValue_IsDead) == 1 or CheckID(All_Mob_Table[i] ) == false then
								table.remove ( All_Mob_Table , i)
							end
						end
					end
					Mob_Num = table.getn(All_Mob_Table)
					if Mob_Num >= 1 then  ----�p�G�ثe���p���Y�H�ƶq�j��1�A�h�N���p���Y�H��Gid�s�JBoss���Ȧs����
						Mob_Chose = Rand(Mob_Num)+1
						Mob_Chose_ID = All_Mob_Table[Mob_Chose]
						--say(OwnerID(),"Mob_Chose_ID ="..Mob_Chose_ID)
						WriteRoleValue( Boss, EM_RoleValue_Register2, Mob_Chose_ID)
					else ----�p�G�ثe�����S�����Y�H�A�h�ͥX�@�����Щʤp�ǡA�ñN����Gid�s�JBoss���Ȧs����
						local Chose_Rand = Rand(10)+2
						local No_Mob = CreateObjByFlag( 104762 , 780696 , Chose_Rand , 1 ) 		
						SetModeEx( No_Mob , EM_SetModeType_Move , false )			------������
						SetModeEx( No_Mob , EM_SetModeType_Strikback , false )	------������
						SetModeEx( No_Mob , EM_SetModeType_Fight , false )		------���i���
						SetModeEx( No_Mob , EM_SetModeType_Searchenemy , false )	------������		
						SetModeEx( No_Mob , EM_SetModeType_Mark , false )			------���i�I��	(�u�n���o�ӴN�i�H���]�X���)
						SetModeEx( No_Mob , EM_SetModeType_NotShowHPMP , false )	------��show���
						AddToPartition( No_Mob,roomid )
						WriteRoleValue(No_Mob, EM_RoleValue_Livetime,5)
						WriteRoleValue( Boss, EM_RoleValue_Register2, No_Mob)
					end
					----------------
					
				elseif counter1 == 60 then --�p�ɾ��k0�A�^���1���q
					counter1 = 0
				end
				
			elseif  CombatBegin_Boss == 2 then --���ήɪ�����
				--say(OwnerID(),"GG !!")
				AP_Zone134_cancelbuff_507618() --�M���Ҧ����a�����wBuff
				local Door_1 = ReadRoleValue( OwnerID() , EM_RoleValue_Register3 )
				--local Door_2 = ReadRoleValue( OwnerID() , EM_RoleValue_Register4 )
				Delobj(Door_1)
				--Delobj(Door_2)
				Trap_Num = table.getn(Trap_Table) 
				Mob_Num = table.getn(All_Mob_Table) 
				for i = 1 , Trap_Num ,1 do --�M���Ҧ�����
					Delobj(Trap_Table[i]) 
				end
				for i = 1 , Mob_Num ,1 do --�M���Ҧ��p���Y�H 
					Delobj(All_Mob_Table[i]) 
				end
				local Dead_Boss = ReadRoleValue( OwnerID() , EM_RoleValue_Register1 )
				sleep(50)
				WriteRoleValue( OwnerID(), EM_RoleValue_Register9, 0)
				Delobj(Dead_Boss)
				sleep(20)
				--say(OwnerID(),"Start New Game !!")
				break
			elseif CombatBegin_Boss == 3 then ----Boss ���`�@�� --- �ٻݭn�A�[�W�}�����ʧ@
				AP_Zone134_cancelbuff_507618() --�M���Ҧ����a�����wBuff
				local Door_1 = ReadRoleValue( OwnerID() , EM_RoleValue_Register3 )
				local Door_2 = ReadRoleValue( OwnerID() , EM_RoleValue_Register4 )
				Delobj(Door_1)
				Delobj(Door_2)
				Trap_Num = table.getn(Trap_Table) 
				Mob_Num = table.getn(All_Mob_Table)
				for i = 1 , Trap_Num ,1 do --�M���Ҧ����� 
					Delobj(Trap_Table[i]) 
				end
				for i = 1 , Mob_Num ,1 do --�M���Ҧ��p���Y�H 
					Delobj(All_Mob_Table[i]) 
				end
				--say(OwnerID(),"Boss DEAD !!!!!")
				WriteRoleValue( OwnerID(), EM_RoleValue_Register9, 0)
			end
		end
	end
end	

----------�H�U���A���~�� �� �u���a�v�A�ϥΪ��O�u�I���@���v�A�Y�ϥΦ��@���A�h�ؼЪ����i�H�]�w���u���סv�C--------------
function AP_Zone134_104458_Trap_start()--�����~����Ĳ�o�@���ǥ�Beginplot�����Y�A����@��A�o��
	SetPlot( OwnerID(),"collision","AP_Zone134_104458_Trap",20 )
end

function AP_Zone134_104458_Trap() --���ɪ��uOwnerID�v�O�����a�A�uTargetID�v�O�u���~�� 
	local Mob_Num = 0
	local Search = {}
	SetPlot( OwnerID(),"collision","",10 ) ---���F�קK����Ĳ�k�A�ҥH�A�bĲ�o����A���ݭn�A��@���u�Ū��v�@�������[
	Addbuff(TargetID(),506964,0,1)--�������~�����S�ĥ�
	Addbuff(OwnerID(),507627,0,5)
	BeginPlot( OwnerID(), "AP_Zone134_104458_Trap_2", 10)
	sleep(10)
	Delobj(TargetID())
end

function AP_Zone134_104458_Trap_2() ---�b���~��Ĳ�o��A�R���a�p
	local Mob_Num = 0
	local Search = SearchRangeNPC ( OwnerID() , 10 )
	Mob_Num = table.getn(Search)
	for i = 1 , Mob_Num , 1 do
		--say(Search[i],"i="..Search[i])
		if	ReadRoleValue(Search[i],EM_RoleValue_OrgID) == 	104540 then
			Delobj(Search[i])
		end
	end
end
--��������������������------------------------------------------		

----------�H�U���A���~�� �� �u�p���Y�H�v�A�]���n���X�IĲ�N�|���_�Ӫ��Pı�A�ҥH�ĥΦa�p���覡�s�@------
function AP_Zone134_ClearTrap() ---�����æb���~���U���a�p���z��AĲ�o���@���C
	local Mob_Num = 0
	local Search = SearchRangeNPC ( OwnerID() , 10 )
	Mob_Num = table.getn(Search)
	if Mob_Num >= 1 then
		for i = 1 , Mob_Num , 1 do 
			if	ReadRoleValue(Search[i],EM_RoleValue_OrgID) == 	104460 then
				SetPlot( Search[i],"collision","",10 )
				Addbuff(Search[i],506964,0,1)--�������~�����S�ĥ�
				BeginPlot( Search[i], "AP_Zone134_ClearTrap_2", 5)
				if	ReadRoleValue(TargetID(),EM_RoleValue_OrgID) == 104459 
					or ReadRoleValue(Search[i],EM_RoleValue_OrgID) == 104458 then
					CancelBuff( TargetID(), 506966 )
					Addbuff(TargetID(),507134,0,-1)--�ܨ��k�N
					say(TargetID(),"[SC_104459_01]")
				end
			end
		end
	end
end

function AP_Zone134_ClearTrap_2() ---�N��Ӫ��u�缾�a���v���~���R���C
	Delobj(OwnerID())
end
--��������������������-------------------------------------------------		

function lua_Dy_Z18BossAI_1_dead() ----Boss ���`�@��
	local CH1 = ReadRoleValue( OwnerID() , EM_RoleValue_PID )  --Ū�X�����ID
	WriteRoleValue( CH1, EM_RoleValue_Register9, 3)
end

---�H�U���A�p���Y�H�X���ˬd�A�p�G�A�ؼЪ��a���ۤƪ��A�A�h���i�H�ϥθөۦ��A��script�O���b�k�N���X�����u�ϥ��ˬdLUA�v
function AP_Zone134_Mob_104459() ---�p���Y�H�X�ۦ��e���ˬd
	local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID ) 
	if CheckBuff(AttackTarget , 507619) == true then
		return false
	else
		if CheckBuff(OwnerID() , 506966) == true then
			return true
		else
			return false
		end
	end
end
--��������������������-------------------------------------------------	
	
---------------�H�U���A�p���Y�H�����`�@���A���e���A�p���H���`�A�hBoss��ۤv�y���ˮ`�A�ݪ`�N�A�n����妩�L�Y��-----
function AP_Zone134_Mob_dead() -----�p���Y�H�����`�@��
	local Boss = ReadRoleValue( OwnerID() , EM_RoleValue_Register1 ) --Ū�XBoss��GID
	local BossMaxHP = ReadRoleValue(Boss , EM_RoleValue_MaxHP)
	local BossNowHP = ReadRoleValue(Boss , EM_RoleValue_HP)
	local Check_HP = (BossNowHP/BossMaxHP)*100
	if	ReadRoleValue(TargetID(),EM_RoleValue_OrgID) == 104458 then ---�p�G�p���Y�OBoss�������A�h������o�q���`�@���C
		return
	else
		if Check_HP >= 3 then ---�p�GBoss��q�j��u3%�v�~�i�H�~�����ʧ@
			SysCastSpellLv(Boss,Boss,496033 , 0 )--Boss�ۤv��ۤv�I��2.5%HP���ˮ`
		else  ----�p�G��q�����u3%�v�C�h�������Y�H�����a�A�h��Boss���F�C
			KillID(TargetID(),Boss)
		end
	end
end
--��������������������-------------------------------------------------		

function AP_Zone134_cancelbuff_507618()  ----�N�o�Ӱƥ����C�ӤH���M���o��Buff
	local roomid = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local PPL = SetSearchAllPlayer(roomid)---search �o�@���Zone�Ҧ����a���ƶq
	local Table_PC_1 = {}--�Ĥ@���j�M���a��Table
	for i = 1 , PPL , 1 do 
		Table_PC_1[i] = GetSearchResult() ---�^�ǰ���SetSearchAllPlayer����ҷj�M�쪺�Ҧ�����]��FOR�j��v�@���X�^
		CancelBuff( Table_PC_1[i], 507618 ) ---�\�����f
		CancelBuff( Table_PC_1[i], 507619 ) -----�ƥ۳N
		CancelBuff( Table_PC_1[i], 506967 ) -----��©�F
		CancelBuff( Table_PC_1[i], 507863 ) -----²������©�F
	end
end