---�I�s������

function AP_Ocean_callBoss_Easy()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	--local Boss = OwnerID()
	--CastSpell( OwnerID() , OwnerID() , 493492) --�u���S�ġA�S���ĪG���k�N
	sleep(15) --���y 1.5 ���~�N�����s�X
	local Boss_other = LuaFunc_CreateObjByObj ( 103478, OwnerID() )  --�N�����s�X
	WriteRoleValue( Boss_other , EM_RoleValue_PID , OwnerID() )
	local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
	WriteRoleValue( Boss_other , EM_RoleValue_Register1   , AttackTarget )
	BeginPlot(Boss_other,"LuaS_Discowood_CheckPeace",0)  --�Y�O8.5�����i�J�԰����A�N�|����
	SetAttack( Boss_other , AttackTarget )		------0618�p�ʷs�W
end


----�����Ǥ�²�� AI --���c�N --

function Lua_AP_jail_Easy()
	while 1 do		
		local counter1 = 0
		local counter2 = 0
		local counter3 = 0
		local counter4 = 0
		local Tank_Num = 0
		sleep(10)
	
		while 1 do	
			sleep(10)
			SetPlot( OwnerID(),"dead","AP_jail_2_Easy",10 )   --���`�@��
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
			if  ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then					
				local partymember = LuaFunc_PartyData( AttackTarget)		--Ū��e�ؼЪ�partydata		
				sleep(10)
				counter1 = counter1 + 1
				counter2 = counter2 + 1
				counter3 = counter3 + 1
				counter4 = counter4 + 1
				local Boss_1 = OwnerID()
				if counter1 == 1 then
					for i = 1 , partymember[0] , 1 do
						
						local Boss_Target = ReadRoleValue( OwnerID() , EM_RoleValue_Register1 )
						if partymember[i] == Boss_Target then
							Tank_Num = i  --�N Boss_taget ���s���g�J Tank_Num
							--Say(OwnerID(),Tank_Num)
							break	--���X�o�@�Ӱj��
						end
					end
					for j = 1 , 100 do
						local jail = Rand(partymember[0]-1)+1    --�]��partymember �O �q 0 �}�l
						if jail ~= Tank_Num then
							ScriptMessage( OwnerID() , -1 , 2 , "[SC_102063_6]", 1 )    --�r��n�s�W
							Say( OwnerID() , "[SC_102063_6]" )	---�w�R���ݦb�o�a �I�I  ((�೽�H�y )
							sleep(10)
							CastSpell( OwnerID() , partymember[jail] , 493491) -----���c�N
							WriteRoleValue( Boss_1 , EM_RoleValue_Register2   , partymember[jail] )
							break
						end
					end	
				end	
				
				--if counter2 == 22 then      --�N�����|�ɦ媺�ޯ���Ȯɩް�
				--local Boss_Heal = ReadRoleValue( OwnerID() , EM_RoleValue_PID )	
					--CastSpell( OwnerID() , Boss_Heal, 493493)   --��ǤڬI��"�೽�H������"
					--counter2 = 0
					--sleep(10)
				--end
				
				if counter3 == 9 then
					
					CastSpell( OwnerID() , TargetID() , 493217)  --��ؼЬI��"���O�s��"
					counter3 = 0
					sleep(10)
				
				end
			end
		end
	end
end
	
	
function AP_jail_2_Easy()
	local OP = ReadRoleValue(OwnerID(),EM_RoleValue_Register2)  
	CancelBuff( OP, 503730 )   --�N����Q���c�ҧx�����a�Ѱ�
end

	
	

------------���έ��C -----------------------------	
function AP_sword_1_Easy()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local sword = LuaFunc_CreateObjByObj ( 103479, OwnerID() )  --�N���Ϊ��Ǫ��s�X��
	SetModeEx( sword   , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( sword  ,  EM_SetModeType_Strikback, false )--����
	SetModeEx( sword   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( sword   , EM_SetModeType_Searchenemy, true) --�j�M�ĤH
	SetModeEx( sword   , EM_SetModeType_Mark, false )--�аO
	SetModeEx( sword   , EM_SetModeType_ShowRoleHead, false )--�Y����
	--SetModeEx( sword   , EM_SetModeType_Show, false )--������
	--SetModeEx( sword   , EM_SetModeType_Show, true )--�A�q�X�A�ت��O���F�i�H���T����W�C���\��ϥΥX��
	Hide( sword )
	--WriteRoleValue(sword, EM_RoleValue_Livetime,30)
	AddToPartition( sword ,    RoomID )	--�[�i�R�x
	local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
end


--------------------------------------------�Ǥڧ��� AI -------------------------------------------------

function AP_OceanBoss_4_Easy()	
	while 1 do		
		local counter1 = 0
		local counter2 = 0
		local counter3 = 0
		local counter4 = 0
		local counter5 = 0
		--WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 ) 
		local pid = 0
		--Say( OwnerID(),  AttackTarget ) 
		sleep(10)
		while 1 do
			sleep(10)
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
			if  ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then					
				local partymember = LuaFunc_PartyData( AttackTarget)				
				sleep(10)
				--counter1 = counter1 + 1		0617�p�ʼȮɨ����ľW
				counter2 = counter2 + 1
				counter3 = counter3 + 1
				counter4 = counter4 + 1
				counter5 = counter5 + 1
				if counter1 == 10 then
					for i = 1 , partymember[0] , 1 do
						if ReadRoleValue( partymember[i] , EM_RoleValue_VOC ) == 5 and ReadRoleValue( partymember[i] , EM_RoleValue_IsDead ) ~= 1  then       							
							ScriptMessage( OwnerID() , -1 , 2 , "[SC_102063_1]", 1 )    --�r��n�s�W
							Say( OwnerID() , "[SC_102063_1]" )	----�o���O�A�̸ӨӪ��a��I�H���I(�೽�H�y)
							sleep(10)
							CastSpell( OwnerID() , partymember[i] , 493189) 	 ----�ǤڽľW						
						end
					end	
					counter1 = 0
				end
				if counter2 == 25 then
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_102063_2]", 1 )    --�r��n�s�W
					Say( OwnerID() , "[SC_102063_2]" )	----   �Ǥڪ����W���o�X�޲����]�O�i�� �I�I
					sleep(10)
					CastSpell( OwnerID() , OwnerID() , 495327) 	 ----�Ǥگ��N						
					sleep(10)
					counter2 = 0
				end
				if 	counter3 == 58 then
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_102063_3]", 1 )    --�r��n�s�W
					Say( OwnerID() , "[SC_102063_3]" )	----�q �I ���M�Pı��@�}�ѷn�a�� �I�I
					CastSpell( OwnerID() , OwnerID() , 493188) 	 ----���i�_�q					
					sleep(10)	
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_102063_5]", 1 )    --�r��n�s�W
					Say( OwnerID() , "[SC_102063_5]" )	----�S�Ǥڥͮ𪺤H �I���Ӧ� �I [ �೽�H�y ]
					sleep(10)
					CastSpell( OwnerID() , OwnerID() , 495346) 	 ----�Ǥڤ���
					SetFightMode ( OwnerID(),1, 0, 0,1 )	-----0617�p�ʷs�W�A�����L��]���
					sleep(10)
					SetFightMode ( OwnerID(),1, 1, 1,1 )
					counter3 = 0
				end
				if counter4 == 13 then
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_102063_4]", 1 )    --�r��n�s�W
					Say( OwnerID() , "[SC_102063_4]" )	----  �����j���̱j�j���}�a�O�a �I�I[ �೽�H�y ]
					sleep(20)
					CastSpellLV( OwnerID() , OwnerID() , 493221 , 40) 	 ----�x���j��					
					counter4 = 0
				end
				
				if counter5 == 7 then
					local anyone = Rand(partymember[0]-1)+1    --�]��partymember �O �q 0 �}�l
					CastSpell( OwnerID() , partymember[anyone] , 495136) 	 ----�Ǥںx��					
					sleep(10)							
					counter5 = 0
				end
			else
				break		-------0617�p�ʷs�W�A���A���mcounter	
			end
		end
	end
end
	

											