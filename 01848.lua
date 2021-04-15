--�� �Y��(�ٸ�)SCRIPT ��--

function sasa_test(check)
	if check == 0 then
		Say( OwnerID() , "A" )
	elseif check == 1 then
		Say( OwnerID() , "B" )
	end
end

function lua_sasa_104083_Counter()			--�Ҧ��p�ɾ�
	local counter1 = 0			-------���q1�p��
	local counter2 = 0			-------���q2�p��
	local Mode = 0				-------�P�_�Ҧ���
	local ModeTime1 = 60		-------�Ҧ�1�ɶ����j
	local ModeTime2 = 60		-------�Ҧ�2�ɶ����j
	
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )		----Ū�b���@�h
	local Boss = CreateObjByFlag( 104084 , 780689 , 1 , 1 )				----�b�X�Хͪ���
	AddToPartition( Boss , Room )										----�⪫��[��Y�h
	BeginPlot( Boss , "lua_sasa_104084_Boss" , 0 )						----�s�������"���e",�l�ʬ��
	
	local EnterFight = 0												----�i�J�԰��}��
	
	while 1 do
		sleep(10)
		local BossTarget = ReadRoleValue( Boss , EM_RoleValue_AttackTargetID )	----Ū�����ؼ�
		if  ( BossTarget ~= 0 ) and ( CheckID( Boss ) == true) then			----�������ؼ�,���b���b
			counter1 = counter1 + 1											----�C��+1
			if EnterFight == 0 then											----0=�},1=��
				Mode = 1
				WriteRoleValue( Boss , EM_RoleValue_register1 , 1 )	----�Ȧs��(�q����������ӼҦ�,�Ʀr�O�Ҧ�)
				EnterFight = 1
			end	
			if Mode == 1 then												----���]�Ҧ�=1
				if counter1 >= ModeTime1 then								----�p�ɪ��ܼƤj��]�w�����
					Mode = 2
					WriteRoleValue( Boss , EM_RoleValue_register1 , 2 )
					counter1 = 0											----�n�k0,���M�|�W��
				end	
			elseif Mode == 2 then
				if counter1 >= ModeTime2 then
					Mode = 1
					WriteRoleValue( Boss , EM_RoleValue_register1 , 1 )
					counter1 = 0
				end
			end
			
		else																----���m
		
			EnterFight = 0													----�A�}�@��
			counter1 = 0													----�k0
			Mode = 1

			if ReadRoleValue( Boss , EM_RoleValue_register10) == 10 then
				sleep(50)
				Boss = CreateObjByFlag( 104084 , 780689 , 1 , 1 )
				AddToPartition( Boss , Room )
				BeginPlot( Boss , "lua_sasa_104084_Boss" , 0 )
			end
		end
	end		
end

function lua_sasa_104084_Skill_1()		-----Boss�ޯ�I��
	local Skill = { 495883 , 495884 }		-----�p�N���L,�߯��R��
	local SkillLv = { 20 , 0 }
	local SkillString = { "[SC_104084_01]" , "[SC_104084_02]" }				--�p��K�}�L�뺡��	--�ǥѿ߫}�������g�@�A���p�I
	local Luck = Rand(100)													----���üƩ�ޯ�
	local PlayerInHate = star_HateListSort(OwnerID())						----���X����������a
	local BossTarget 														----�sBOSS�n�����ؼ�
	local SkillIndex 														----��TABLE������m

	if (Luck >= 0 and Luck < 50) then										----�q0~ ���@�Ӽ�
		SkillIndex = 1
		local RandTarget1 = Rand(table.getn(PlayerInHate))+1				---�H���줳��������a
		BossTarget = PlayerInHate[RandTarget1]
	elseif (Luck >= 50 and Luck < 100) then
		SkillIndex = 2
		BossTarget = OwnerID()												---�ۨ��d��,PlayerInHate[1]=�Ĥ@��
	end
	ScriptMessage( OwnerID() , -1 , 2 , SkillString[SkillIndex] , 1 )		--�۸�(����,-1=���Ϫ��a,2=����ĵ�i(���|�Q�~��)
	--Yell( OwnerID() , SkillString[SkillIndex] , 5),�t�@�س۸�,�i�H�]�d��
	CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )	--�ޯ൥��(SysCastSpellLV=�t�Ω�)
	--Sleep(10)
end

function lua_sasa_104084_Skill_2()
	local Skill = { 495885 , 495886 }		-----�ƿߤb,����
	local SkillLv = { 0 , 0 }
	local SkillString = { "[SC_104084_03]" , "[SC_104084_04]" }				--�p��K�Ӫ��a�I�I	--���ΪG���J�ڨ{�A�p�N�ڨӿˤU�p�I
	local Luck = Rand(100)
	local PlayerInHate = star_HateListSort(OwnerID())
	local BossTarget
	local SkillIndex

	if (Luck >= 0 and Luck < 50) then
		SkillIndex = 1
		BossTarget = OwnerID()
	elseif (Luck >= 50 and Luck < 100) then
		SkillIndex = 2
		BossTarget = PlayerInHate[1]
	end
	ScriptMessage( OwnerID() , -1 , 2 , SkillString[SkillIndex] , 1 )
	CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )
	--Sleep(10)
end

function lua_sasa_104084_Boss()			------Boss����
	while 1 do
		Sleep(10)
		local Counter1 = 0						-------�p�ǭp��
		local Counter2 = 0						-------�ޯ�p��
		local mode = 0							-------�P�_�Ҧ���
		local mob1 = {}							-------�ͤp�Ǫ��ܼ�
		local mob2 = {}
		local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		
		while 1 do
			Sleep(10)
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )			--Ū�������ؼ�
			if  ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == true) then						--�������ؼ�,���b���b
				mode = ReadRoleValue( OwnerID() , EM_RoleValue_register1)					--Ū���e�g�J���Ҧ�
				WriteRoleValue( OwnerID() , EM_RoleValue_register10 , 10 )							--�i�D�p�ɾ��w�i�J�԰�
				if mode == 1 then
					counter1 = counter1 + 1
					counter2 = counter2 + 1
					if counter1 >= 20 then
						mob1[table.getn(mob1)+1] = CreateObjByFlag( 104085 , 780689 , 2 , 1 )
						AddToPartition( mob1[table.getn(mob1)] , Room )
						counter1 = 0
					elseif counter2 >= 6 then
						lua_sasa_104084_Skill_1()					
						counter2 = 0
					end
				elseif mode == 2 then
					counter1 = counter1 + 1
					counter2 = counter2 + 1
					if counter1 >= 10 then
						mob2[table.getn(mob2)+1] = CreateObjByFlag( 104086 , 780689 , 3 , 1 )
						AddToPartition( mob2[table.getn(mob2)] , Room )
						counter1 = 0
					elseif counter2 >= 6 then
						lua_sasa_104084_Skill_2()					
						counter2 = 0
					end
				end

			else																	--���}�԰�
			
				if ReadRoleValue( OwnerID() , EM_RoleValue_register10) == 10 then
					DelObj( OwnerID() )													--�R����
					for i = 1, table.getn(mob1)	do										--table.getn��TABLE�����`�ƶq
						if mob1[i] ~= nil and CheckID(mob1[i]) then						--�P�_�Ĥ@���q���p�ǬO�_�٦b���W
							DelObj(mob1[i])
						end
					end
					for i = 1, table.getn(mob2)	do
						if mob2[i] ~= nil and CheckID(mob2[i]) then
							DelObj(mob2[i])
						end
					end
				end
				
				break
			end
		end
	end
end


