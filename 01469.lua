function lua_star_BossAI_102349()
	while 1 do 
		sleep(10)
		local counter1 = 0												-------------���ΦM���o�ʭp�ɾ�	
		local counter2 = 0												-------------�@��ޯ�X�ۭp�ɾ�
		local counter3 = 0												-------------���߭p�ɾ�
		local ModeCheck = 503981										-------------�Ҧ��ˬd��				
		local Mode1 = 503983											-------------�Ҧ�1		
		local Mode2 = 503984											-------------�Ҧ�2	
		local CombatBegin = 0											-------------�԰��}�l�X��
		local Skill = { 493663 , 493664 , 493665 , 493787 , 493788 }	--------------- 1.�y�����   	2.���a	3.���ξ_��		4.�Фg����		5.�{��(���ϥ�)		
		local SkillLv = {0 , 0 , 0 , 0 , 0}
		local SkillString = { "[SC_102349_1]" , "[SC_102349_2]" , "[SC_102349_3]" }
		
		local LittleWormID = 102351		----------���z�p��
		local LittleWorm = {}			----------���z�p��GID�s���
		local FakeBossID = 102350		----------Boss����
		local WormHoleFlag = 780396		----------�ά}�X�l( ��J�a�U)
		local Earthquake = 1			----------�O�_��t�p�J�g��
		local ControlSpell = 493666			---------�F��s��	
		local NowHP = 0
			
		while 1 do	
			sleep(10)	
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
			if  ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then	
				if CombatBegin == 0 then							---------------�u���}����@��
					AddBuff( OwnerID() , ModeCheck , 0 , -1 )		----------------------------�WBoss�Ҧ��ˬdBuff
					AddBuff( OwnerID() , Mode1 , 0 , -1 )		----------------------------Boss�Ҧ�1  
					CombatBegin = 1
				end	
				counter1 = counter1 + 1							----------���ΦM���}�l�p��
				counter2 = counter2 + 1							----------�@��ޯ�ޯ�
				counter3 = counter3 + 1							---------���߭p��
				local partymember = LuaFunc_PartyData(AttackTarget)				
				local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
				local Luck = Rand( 100 )		--------- �X�۶ü�
				local SkillIndex = 1
				local BossTarget = AttackTarget

				if CheckBuff(OwnerID() , Mode1) == true then							-----------------�B��Ҧ�1
					Earthquake = 1					
				elseif CheckBuff(OwnerID() , Mode2) == true then							-----------------�B��Ҧ�2
					if Earthquake == 1 then
						local BeControlled = 0
						WriteRoleValue( OwnerID() , EM_RoleValue_AttackDelay , 20 )			------���𴶧�2��( �n�T�w�\�ೣok )
						SetModeEx( OwnerID() , EM_SetModeType_Move , false )			------�Ĩį��ۼ��S��
						CastSpellLV( OwnerID() , AttackTarget , ControlSpell , 0 )			-------�F��s���j�H
						sleep(30)
						while 1 do
							BeControlled = Rand(table.getn(partymember))+1
							if ReadRoleValue( partymember[BeControlled] , EM_RoleValue_IsDead ) == 0  then								
								AddBuff( partymember[BeControlled] , 504033 , 0 , -1 )								
								break
							else
								table.remove( partymember , partymember[BeControlled] )
							end	
						end	
						WriteRoleValue( OwnerID() , EM_RoleValue_register1 , partymember[BeControlled] )						
						CastSpellLV( OwnerID() , OwnerID() , Skill[4] , SkillLv[4] )		-------------------��t��J�g��
						sleep(15)
						SetModeEx( OwnerID() , EM_SetModeType_Move , true )	
						local Hole = {1 , 2 , 3 , 4 , 5 , 6}
						local HoleNumber = Rand(6)+1
						table.remove( Hole , HoleNumber )
						local HoleNumber1 = Rand(table.getn( Hole ) ) + 1												
						SetPosByFlag( OwnerID(), WormHoleFlag , HoleNumber )						
						NowHP = ReadRoleValue( OwnerID() , EM_RoleValue_HP )	-------��������e��q
						local FakeBoss = CreateObjByFlag( FakeBossID , WormHoleFlag , Hole[HoleNumber1] , 1 )		---------------�����X�{
						AddToPartition( FakeBoss , Room )
						SetAttack( FakeBoss , AttackTarget )
						AddBuff( FakeBoss , 504034 , 0 , -1 )
						WriteRoleValue( FakeBoss , EM_RoleValue_register1 , AttackTarget )
						WriteRoleValue( FakeBoss , EM_RoleValue_register3 , NowHP )
						CallPlot( FakeBoss , "lua_star_BossAI_FakeBoss" , OwnerID() )
						Earthquake = 2
					end	
				end					
				if counter2 >= 7 then					-----------Boss�@��ޯ�I��
					if (Luck >= 0 and Luck < 25) or (Luck >= 50 and Luck < 75) then
						SkillIndex = 1
						BossTarget = AttackTarget
					elseif (Luck >= 25 and Luck < 50) or (Luck >= 75 and Luck < 100) then	
						SkillIndex = 2
						BossTarget = HateTargetID()									
					end	
					ScriptMessage( OwnerID() , -1 , 2 , SkillString[SkillIndex] , 1 )
					--Yell( OwnerID() , SkillString[SkillIndex] , 5)
					CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )					
					sleep(10)
					counter2 = 0
				elseif counter3 >= 15 and CheckBuff(OwnerID() , Mode2) == false then		-------Boss�I����
					SkillIndex = 3
					BossTarget = OwnerID()
					
					ScriptMessage( OwnerID() , -1 , 2 , SkillString[SkillIndex] , 1 )
					--Yell( OwnerID() , SkillString[SkillIndex] , 5)
					CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )					
					sleep(20)
					counter3 = 0					
				end									
				
				if counter1 == 20 then							--------���ΦM���o��
					for i = 1 , partymember[0] , 1 do
						if ReadRoleValue( partymember[i] , EM_RoleValue_IsDead ) == 0  then 						
							local LittleWormTemp = lua_star_CreateNPC( partymember[i] , 0 , LittleWormID , 200 , Room )	--------�ͥX���z��
							LittleWorm[table.getn( LittleWorm )+1] = LittleWormTemp									--------�ñNGID�s�Jtable	
							Setplot( LittleWormTemp , "range" , "lua_star_BossAI_BigWorm_2" , 40)
							--Setplot( LittleWormTemp , "dead" , "lua_star_BossAI_LittleDead" , 30)					-----���F�R���p�Ϋ���
							SetAttack( LittleWormTemp , partymember[i] )
						end
					end
					counter1 = 0
				end	
			else
				for i = 1 , table.getn( LittleWorm ) do
					if CheckID( LittleWorm[i] ) == true and LittleWorm[i] ~= nil then
						DelObj( LittleWorm[i] )
					end
				end
				break		------------------------���}�԰����X��e�j��A���m�Ҧ��ܼ�
			end	
		end		
	end
end

function lua_star_BossAI_BigWorm_2()		------------���z�μ@��
	BeginPlot( TargetID(), "lua_star_BossAI_BigWorm_3", 1 )	
end

function lua_star_BossAI_BigWorm_3()		------------���z�μ@��
	Setplot( OwnerID() , "range" , "" , 0)		-------�קK����Ĳ�o
	local BombSpell = 493667		--------�z��
	CastSpell( OwnerID() , OwnerID() , BombSpell)		
end

function lua_star_BossModeCheck()	---------------------�ˬdBoss�B����ӼҦ�
	local Mode1 = 503983
	local Mode2 = 503984
	if CheckBuff(OwnerID() , Mode1)	== true and CheckBuff(OwnerID() , Mode2) == false then
		CancelBuff( OwnerID() , Mode1 )
		AddBuff( OwnerID() , Mode2 , 0 , -1 )	
	elseif CheckBuff(OwnerID() , Mode1)	== false and CheckBuff(OwnerID() , Mode2) == true then
		CancelBuff( OwnerID() , Mode2 )
		AddBuff( OwnerID() , Mode1 , 0 , -1 )		
	end
end

function lua_star_BossAI_FakeBoss(Boss)		------Boss�����@��
	local HP = ReadRoleValue( OwnerID() , EM_RoleValue_register3 )	
	--WriteRoleValue( OwnerID() , EM_RoleValue_HP , HP )	---------7/21����Boss��q�Ȯɥ�����
	WriteRoleValue( OwnerID() , EM_RoleValue_register2 , Boss )
	--local player = ReadRoleValue( OwnerID() , EM_RoleValue_register1 )
	--local partymember = LuaFunc_PartyData( player )
	local BeControlled = ReadRoleValue( Boss , EM_RoleValue_register1 )
	local counter = 0
	 
	WriteRoleValue( OwnerID() , EM_RoleValue_register1 , BeControlled )
	Setplot( OwnerID() , "dead" , "lua_star_BossAI_FakeDead" , 30)
	for i=1 , 50 do
		if CheckID(OwnerID()) == true then
			counter = counter + 1
			sleep(10)
			if counter == 40 then
				DelObj(OwnerID())
				break
			end
		else
			break	
		end	
	end	
end

function lua_star_BossAI_FakeDead()			-------�������`�@��
	local ControllBuff = 504033
	local Boss = ReadRoleValue( OwnerID() , EM_RoleValue_register2 )
	local BeControlled = ReadRoleValue( OwnerID() , EM_RoleValue_register1 )
	CancelBuff( BeControlled , ControllBuff )
end

function lua_star_102349_TransferDM()	--------�]��Ĳ�o�k�N���Q����Ĳ�o�u�����z�����~��Ĳ�o�A�ҥH��ΨC���ͪk�N�Ӱ�( 504034�s�򲣥ͥ� )
	local ControllBuff = 504033
	local LastDamage = ReadRoleValue( OwnerID() , EM_RoleValue_LastDHp )	-------�̫�@���Q�ˮ`��( �o�ӭȨä��|�ۤv�M�� )
	local LastTemp = 0														-------�Ȧs�e�@�����̫�Q�ˮ`��
	if ReadRoleValue( OwnerID() , EM_RoleValue_register5 ) == 0 then  		-------register5�ΨӧP�_�O�����Q�ˮ`���٬O�e�@����
		WriteRoleValue( OwnerID() , EM_RoleValue_register5 , 1 )
		WriteRoleValue( OwnerID() , EM_RoleValue_register6 , LastDamage )	-------register6�s����Q�ˮ`��
		LastTemp = ReadRoleValue( OwnerID() , EM_RoleValue_register7 )
	elseif ReadRoleValue( OwnerID() , EM_RoleValue_register5 ) == 1 then
		WriteRoleValue( OwnerID() , EM_RoleValue_register5 , 0 )
		WriteRoleValue( OwnerID() , EM_RoleValue_register7 , LastDamage )	-------register7�s��e�@���Q�ˮ`��
		LastTemp = ReadRoleValue( OwnerID() , EM_RoleValue_register6 )
	end		 
	local TransDamage = LastDamage*0.5										--------�ಾ���a���������ˮ`���
	local TD = math.floor(abs(TransDamage))	
	local BeControlled = ReadRoleValue( OwnerID() , EM_RoleValue_register1 )
	if LastDamage ~= LastTemp then
		SysCastSpellLV(OwnerID() , BeControlled , 493696 , TD )
	end	
end

