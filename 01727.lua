function lua_star_BossAI_102558_easy()
	while 1 do
		sleep(10)
		local Mode = 0
		local Skill = { 493932 }	
		----------------------------- 1.  �Ť����q				
		local SkillLv = {0}
		--local SkillString = { "[SC_102349_1]" , "[SC_102349_2]" , "[SC_102349_3]" }
		local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )		
		local LuckyPlayer = {} 		--------�s���ܨ������H���a
		local Lucky1 = 0
		local Lucky2 = 0
		local Lucky1Temp = 0
		local Lucky2Temp = 0
		local RobotBuff = 504343	--------�ܨ�Buff
		local RootBuff = 504374		--------�M���e���⪱�a�w��
		local BeginMode = 0			--------�P�_�B����ӼҦ����}�l
		local FlyFlag = 780422		-------���a�Ǩ�Ť����X��
		local Satellite = {}		-------�s��žԤp��
		local GroundBot = {}		-------�s��a���p��
		local GroundBotTemp = {}	-------�Ȧs
		local Eliminated = 0		-----�C�i�a���p�Ǧ��`�p��
		local EnterFight = 0		-----�P�_�O�_���i�J�L�԰�
		local counter1 = 0			-----�ޯ�p��
		
		while 1 do 
			sleep(10)
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
			--LuckyPlayer = star_HateListSort(OwnerID())					--------��XBoss�����Ƨ�
			if  ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then				
				Mode = ReadRoleValue( OwnerID() , EM_RoleValue_register1 )
				EnterFight = 1
				if Mode == 1 then														--------�B��Ҧ�1
					--Say( OwnerID() , "Now in Mode1")
					Eliminated = 0
					if BeginMode == 0 then	
						--PlayMotionEX( OwnerID() , ruFUSION_ACTORSTATE_CAST_LOOP , ruFUSION_ACTORSTATE_CAST_END )
						SetModeEx( OwnerID() , EM_SetModeType_Fight , true )		------�i���						
						SetModeEx( OwnerID() , EM_SetModeType_Mark , true )			------�i�I��
						if Lucky1Temp ~= 0 and Lucky2Temp ~= 0 then
							SetPosByFlag( Lucky1Temp , FlyFlag , 10 )				------�e���a�^��a��
							SetPosByFlag( Lucky2Temp , FlyFlag , 10 )				------�e���a�^��a��
							CancelBuff( Lucky1Temp , RobotBuff )
							CancelBuff( Lucky2Temp , RobotBuff )
							WriteRoleValue( OwnerID() , EM_RoleValue_register3 , 0 )		-----�S�����a�b�Ť�(Boss����P�_��)
							WriteRoleValue( OwnerID() , EM_RoleValue_register4 , 0 )
						end	
						for i = 1 , table.getn( Satellite ) do
							if CheckID( Satellite[i] ) == true and Satellite[i] ~= nil then
								DelObj( Satellite[i] )
							end
						end
					end	
					counter1 = counter1 + 1
					if counter1 >= 7 then
						star_102558_BossSkill_easy()										------�I��ۦ�
						counter1 = 0
					end	
					BeginMode = 1
				elseif Mode == 2 then													--------�B��Ҧ�2		
					--Say( OwnerID() , "Now in Mode2")		
					if BeginMode == 1 then											--------�žԹC���}�l
						ScriptMessage( OwnerID() , -1 , 2 , "[SC_102558_7]" , 1 )
						Yell( OwnerID() , "[SC_102558_7]" , 5)
						sleep(50)	
						CastSpellLV( OwnerID() , OwnerID() , Skill[1] , SkillLv[1] )	----------�Ť����q
							
						--PlayMotionEX( OwnerID() , ruFUSION_ACTORSTATE_CAST_BEGIN , ruFUSION_ACTORSTATE_CAST_LOOP )	
						--WriteRoleValue( OwnerID() , EM_RoleValue_AttackDelay , 300 )			------���𴶧�30��
						SetModeEx( OwnerID() , EM_SetModeType_Fight , false )		------���i���						
						SetModeEx( OwnerID() , EM_SetModeType_Mark , false )		------���i�I��
						
						LuckyPlayer = star_HateListSort(OwnerID())					--------��XBoss�����Ƨ�
						if table.getn(LuckyPlayer) > 2 then							--------�������ӤH�H�W�~�ǤH��Ť�
							while 1 do 												--------�H�����Ӫ��a	
								local Temp = Rand(table.getn(LuckyPlayer))+1								
								if CheckID(LuckyPlayer[Temp]) == true and 
									ReadRoleValue( LuckyPlayer[Temp] , EM_RoleValue_IsDead ) == 0  then	
									if LuckyPlayer[Temp] == AttackTarget then	
										table.remove(LuckyPlayer , Temp )
									elseif Lucky1 == 0 then
										Lucky1 = LuckyPlayer[Temp]																					
										table.remove(LuckyPlayer , Temp )
									elseif Lucky2 == 0	then
										Lucky2 = LuckyPlayer[Temp]
										--table.remove(LuckyPlayer , Temp )									
									elseif Lucky1 ~= 0 and Lucky2 ~= 0 then										 
										break
									end										
								else	
									table.remove(LuckyPlayer , Temp )
								end																		
							end							
							Lucky1Temp = Lucky1
							Lucky2Temp = Lucky2	
							WriteRoleValue( OwnerID() , EM_RoleValue_register3 , Lucky1Temp )		-----���F�b������Y���a�٬O�b�Ť��A�n��L�Ǧ^��
							WriteRoleValue( OwnerID() , EM_RoleValue_register4 , Lucky2Temp )
							AddBuff( Lucky1 , RootBuff , 0 , 2)
							AddBuff( Lucky2 , RootBuff , 0 , 2)	
							sleep(5)	
							AddBuff( Lucky1 , RobotBuff , 0 , 50)
							AddBuff( Lucky2 , RobotBuff , 0 , 50)
							sleep(10)	
							SetPosByFlag( Lucky1 , FlyFlag , 2 )
							SetPosByFlag( Lucky2 , FlyFlag , 3 )
							Lucky1 = 0
							Lucky2 = 0
						end
						Satellite = star_102558_Satellite_easy(OwnerID() , Room)					-------�ͥX�ìP�p��
						sleep(30)
						GroundBotTemp = star_102558_GroundWar_easy(OwnerID() , Room)				-------�ͥX�a���p��
						for ii=1 , table.getn(GroundBotTemp) do
							GroundBot[table.getn(GroundBot)+1] = GroundBotTemp[ii]
							--SetAttack( GroundBotTemp[ii] , AttackTarget )								-----���a���p�ǧ�H��
						end	
						BeginMode = 0
					end	
					
					if table.getn(GroundBotTemp) > 0 then								-----�P�_���i�a���p�ǳQ���F�X��
						for k=1 , table.getn(GroundBotTemp) do
							if GroundBotTemp[k] ~= -1 then
								if CheckID(GroundBotTemp[k]) == false then				-----�p�Ǧ��`�|����ر��ΡA( 1 )���F���W���� ( 2) ���F�����٦b
									Eliminated = Eliminated + 1
									GroundBotTemp[k] = -1								-----�аO�w�g�Q�����p��(���ΧR��table���ȡA�O�]���b�]for�j��|�]��index���ܦӦh�P�_�@��)				
								else	
									if ReadRoleValue( GroundBotTemp[k] , EM_RoleValue_IsDead ) == 1 then
										Eliminated = Eliminated + 1
										GroundBotTemp[k] = -1
									end
								end	
							end	
						end
					end	
														
					if Eliminated == 6 then
						sleep(20)
						GroundBotTemp = star_102558_GroundWar_easy(OwnerID() , Room)				-------�ͥX�a���p��
						for jj=1 , table.getn(GroundBotTemp) do
							GroundBot[table.getn(GroundBot)+1] = GroundBotTemp[jj]
						end
						Eliminated = 0
					end	
				end
			else
				if EnterFight == 1 then 
					for i = 1 , table.getn( Satellite ) do										-----���}�԰��M���Ť��p��
						if CheckID( Satellite[i] ) == true and Satellite[i] ~= nil then
							DelObj( Satellite[i] )
						end
					end 
					for j = 1 , table.getn( GroundBot ) do										-----���}�԰��M���a���p��		
						if CheckID( GroundBot[j] ) == true and GroundBot[j] ~= nil then
							DelObj( GroundBot[j] )
						end
					end
					if Lucky1Temp ~= 0 and Lucky2Temp ~= 0 then
							SetPosByFlag( Lucky1Temp , FlyFlag , 10 )				------�e���a�^��a��
							SetPosByFlag( Lucky2Temp , FlyFlag , 10 )				------�e���a�^��a��
							CancelBuff( Lucky1Temp , RobotBuff )
							CancelBuff( Lucky2Temp , RobotBuff )
							WriteRoleValue( OwnerID() , EM_RoleValue_register3 , 0 )		-----�S�����a�b�Ť�(Boss����P�_��)
							WriteRoleValue( OwnerID() , EM_RoleValue_register4 , 0 )
					end	
					local BossCounter = ReadRoleValue( OwnerID() , EM_RoleValue_register8 )
					WriteRoleValue( BossCounter , EM_RoleValue_register2 , 1 )					------�q��Counter�ABoss�n���m�F
					DelObj(OwnerID())						
					break
				end	
			end
		end
	end	
end

function star_102558_Satellite_easy(BossGID , Room)		-------���ͪŤ��p��
	local Satellite = {}
	local SatelliteID = 103208 	-------�ìP�p��ID
	local Distance = 100		-------��P�b�|
	local Angle = math.pi/8		-------����
	local BossObj = Role:new(BossGID)
	local PosX = BossObj:X() 
	local PosZ = BossObj:Z()
	local Height = BossObj:Y()+300			-------����
	for i=1 , 8 do
		local X = PosX + Distance*math.cos(i*2*Angle)
		local Z = PosZ + Distance*math.sin(i*2*Angle)
		Satellite[i] = CreateObj( SatelliteID , X , Height , Z , 0 , 1 )	------Y�b�վ㰪��
		SetModeEx( Satellite[i] , EM_SetModeType_Move , false )			------������
		SetModeEx( Satellite[i] , EM_SetModeType_Strikback , false )	------�������A0520.2010�ץ��p�Ǧb�Ť��٬O�i�H���𥴤H
		SetModeEx( Satellite[i] , EM_SetModeType_Searchenemy , false )	------�����ġA0520.2010�ץ��p�Ǧb�Ť��٬O�i�H���𥴤H
		SetModeEx( Satellite[i] , EM_SetModeType_Gravity , false )		------���O
		AddToPartition( Satellite[i] , Room )
		
		AddBuff( Satellite[i] , 505653 , 0 , -1)						------0520.2010�ץ��p�Ǧb�Ť��٬O�i�H���𥴤H
		CallPlot( Satellite[i] , "star_102558_SatelliteFire_easy" , BossGID )
		Setplot( Satellite[i] , "dead" , "star_102558_SatelliteDead_easy" , 30)
		WriteRoleValue( Satellite[i] , EM_RoleValue_register1 , BossGID )
		--Say(BossGID , Room)
	end
	return Satellite	
end

function star_102558_SatelliteDead_easy()
	local BossGID = ReadRoleValue( OwnerID() , EM_RoleValue_register1 )
	local MaxHP = ReadRoleValue( BossGID , EM_RoleValue_MaxHP )
	local NowHP = ReadRoleValue( BossGID , EM_RoleValue_HP ) 	
	--WriteRoleValue( BossGID , EM_RoleValue_HP , NowHP-MaxHP*0.02 )
	if NowHP > MaxHP*0.02 then
		AddRoleValue( BossGID , EM_RoleValue_HP , -MaxHP*0.02 )		-------���@���Ť��p�Ǧ�����
	else
		KillID(TargetID() , BossGID)
	end	
end

function star_102558_GroundWar_easy(BossGID , Room)			------���ͦa���p��
	local GroundBot = {}
	local GroundBotID = 103209	-----�a���p��ID
	local LuckyBotID = 103210	-----�|���j�O�l�u�p��ID
	local Spawn = 0				-----�O�_�ͥX�a���p��	
	local IsLucky = 0			-----�P�_�O�_�w�X�{���j�O�l�u�p��
	Eliminated = ReadRoleValue( BossGID , EM_RoleValue_register2 )	
	for i=1 , 6 do
		local LuckyBall = Rand(100)
		if (LuckyBall > 30 and LuckyBall < 61) 
			or (LuckyBall > 70 and LuckyBall < 100)then
			if IsLucky == 0 then
				GroundBot[i] = CreateObjByFlag( LuckyBotID , 780422 , i+3 , 1 )		-----�|���u�Ī��p��
				AddToPartition( GroundBot[i] , Room )	
				IsLucky = 1	
			elseif IsLucky == 1 then
				GroundBot[i] = CreateObjByFlag( GroundBotID , 780422 , i+3 , 1 )		
				AddToPartition( GroundBot[i] , Room )
			end	
			WriteRoleValue( GroundBot[i] , EM_RoleValue_register1 , BossGID )		-----Boss GID�g�J�p�Ǩ��W
			--Setplot( GroundBot[i] , "dead" , "star_102558_GroundDead_easy" , 30)		------���`�@���Ȯɤ��ϥ�	
		elseif LuckyBall >= 0 and LuckyBall <= 30 then	
			GroundBot[i] = CreateObjByFlag( GroundBotID , 780422 , i+3 , 1 )		
			AddToPartition( GroundBot[i] , Room )
			WriteRoleValue( GroundBot[i] , EM_RoleValue_register1 , BossGID )		-----Boss GID�g�J�p�Ǩ��W
			--Setplot( GroundBot[i] , "dead" , "star_102558_GroundDead_easy" , 30)
		elseif LuckyBall > 60 and LuckyBall <= 70 then	
			GroundBot[i] = CreateObjByFlag( GroundBotID , 780422 , i+3 , 1 )		
			AddToPartition( GroundBot[i] , Room )
			WriteRoleValue( GroundBot[i] , EM_RoleValue_register1 , BossGID )		-----Boss GID�g�J�p�Ǩ��W
			--Setplot( GroundBot[i] , "dead" , "star_102558_GroundDead_easy" , 30)
		end		
	end
	return GroundBot
end

function star_102558_GroundDead_easy()					------�a���p�Ǧ��`�@��
	local BossGID = ReadRoleValue( OwnerID() , EM_RoleValue_register1 )
	local Eliminated = ReadRoleValue( BossGID , EM_RoleValue_register2 )
	local Mode = ReadRoleValue( BossGID , EM_RoleValue_register1 )
	if Mode == 2 then
		WriteRoleValue( BossGID , EM_RoleValue_register2 , Eliminated+1 )
	elseif Mode == 1 then
		WriteRoleValue( BossGID , EM_RoleValue_register2 , 0 )
	end	
end

function star_102558_SatelliteFire_easy(BossGID)			-------�Ť��p�ǩۦ��I��
	local HeavenFire = 493946	
	local counter = 0
	local PlayerInHate = {}
	while 1 do
		sleep(10)
		if CheckID( OwnerID() ) == true and ReadRoleValue( OwnerID() , EM_RoleValue_IsDead ) == 0 then
			counter = counter + 1
			local Ready = Rand(100)
			if counter == 5 then
				if Ready > 30 and Ready < 61 then
					PlayerInHate = star_HateListSort(BossGID)
					if table.getn(PlayerInHate) > 0 then
						local Lucky = Rand(table.getn(PlayerInHate))+1
						CastSpellLV( OwnerID() , PlayerInHate[Lucky] , HeavenFire , 0 )
					end	
				end
				counter = 0
			end
		elseif CheckID( OwnerID() ) == false and ReadRoleValue( OwnerID() , EM_RoleValue_IsDead ) == 1 then	
			break
		end
	end		
end

function star_102558_BossSkill_easy()											------Boss�I��ۦ�
	local Skill = { 495353 , 493934 , 495354 }	
		-------------------------1.���x����	2.�Ť�ɤl����	3.�u�@�̭���			
	local SkillLv = {0 , 0 , 0 }
	local SkillString = { "[SC_102558_3]" , "[SC_102558_4]" , "[SC_102558_5]" }
	local Luck = Rand(100)
	local NoTank = 1										--------�P�_�O�_�ܤ֦��@�W���a�b�����o�쪺�d��
	local PlayerInHate = star_HateListSort(OwnerID())		--------�s�񪱮aGID
	for i=1 , table.getn(PlayerInHate) do
		if GetDistance( OwnerID() , PlayerInHate[i] ) < 275 then
			NoTank = 0
			break
		end	
	end
	if NoTank == 1 then
		local RandTarget3 = Rand(table.getn(PlayerInHate))+1
		BossTarget = PlayerInHate[RandTarget3]	
		ScriptMessage( OwnerID() , -1 , 2 , "[SC_102558_6]" , 1 )
		Yell( OwnerID() , "[SC_102558_6]" , 5)
		CastSpellLV( OwnerID() , BossTarget , Skill[1] , 30 )
		sleep(10)
	elseif NoTank == 0 then
		if (Luck >= 0 and Luck < 15) or (Luck >= 45 and Luck < 60) then
			SkillIndex = 1
			local RandTarget1 = Rand(table.getn(PlayerInHate))+1	
			BossTarget = PlayerInHate[RandTarget1]
		elseif (Luck >= 15 and Luck < 30) or (Luck >= 60 and Luck < 75) then	
			SkillIndex = 2
			local RandTarget2 = Rand(table.getn(PlayerInHate))+1
			BossTarget = PlayerInHate[RandTarget2]	
		elseif (Luck >= 30 and Luck < 45) or (Luck >= 75 and Luck < 100) then	
			SkillIndex = 3
			BossTarget = PlayerInHate[1]
		end	
		ScriptMessage( OwnerID() , -1 , 2 , SkillString[SkillIndex] , 1 )
		--Yell( OwnerID() , SkillString[SkillIndex] , 5)
		CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )					
		sleep(10)
	end	
end

function star_102558_BossDead_easy()												-------Boss���`�@��
	local UpperPart = ReadRoleValue( OwnerID() , EM_RoleValue_register7 )
	local BossCounter = ReadRoleValue( OwnerID() , EM_RoleValue_register8 )
	local Entrance = ReadRoleValue( OwnerID() , EM_RoleValue_register9 )
	local Exit = ReadRoleValue( OwnerID() , EM_RoleValue_register10 )
	local Lucky1 = ReadRoleValue( OwnerID() , EM_RoleValue_register3 )
	local Lucky2 = ReadRoleValue( OwnerID() , EM_RoleValue_register4 )
	if CheckID(Lucky1) == true and ReadRoleValue( Lucky1 , EM_RoleValue_IsDead ) == 0 then
		SetPosByFlag( Lucky1 , 780422 , 10 )								------�e���a�^��a��
	end
	if CheckID(Lucky2) == true and ReadRoleValue( Lucky2 , EM_RoleValue_IsDead ) == 0 then
		SetPosByFlag( Lucky2 , 780422 , 10 )								------�e���a�^��a��
	end	
	WriteRoleValue( BossCounter , EM_RoleValue_register1 , -1 )				------�q���p�ɾ�Boss�}�`
	SetModeEx( OwnerID() , EM_SetModeType_Fight , true )					------�i���						
	SetModeEx( OwnerID() , EM_SetModeType_Mark , true )						------�i�I��(�YBoss�b�Ť����q���`�~�i���_)
	KillID( OwnerID() , UpperPart )											------�Ԥ�[����		
	SetIdleMotion( Entrance , ruFUSION_ACTORSTATE_ACTIVATE_BEGIN )			------���}�e��
	SetModeEX( Entrance , EM_SetModeType_Obstruct , false )
	SetIdleMotion( Exit , ruFUSION_ACTORSTATE_ACTIVATE_BEGIN )				------���}���
	SetModeEX( Exit , EM_SetModeType_Obstruct , false )
end
 
function lua_star_102558_Counter_easy()	-----�Ҧ��p�ɾ�
	local counter1 = 0			-------�԰��p��
	local counter2 = 0			-------���`�p��
	local BerserkCounter = 0	-------�g�ɭp��
	local IsBerserk = 0			-------�g�ɶ}��
	local Mode = 0
	local ModeTime1 = 50		-------�Ҧ�1�ɶ����j
	local ModeTime2 = 50		-------�Ҧ�2�ɶ����j
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Boss = CreateObjByFlag( 103205 , 780422 , 1 , 1 )				-----Boss�D��
	SetModeEx( Boss , EM_SetModeType_Move , false )	------������
	AddToPartition( Boss , Room )
	BeginPlot( Boss , "lua_star_BossAI_102558_easy" , 0 )
	Setplot( Boss , "dead" , "star_102558_BossDead_easy" , 30)
	WriteRoleValue( Boss , EM_RoleValue_register8 , OwnerID() )
	
	local BossObj = Role:new(Boss)
	local PosX = BossObj:X() 
	local PosY = BossObj:Y()
	local PosZ = BossObj:Z()
	local UpperPart = CreateObj( 103206 , PosX , PosY , PosZ , 0 , 1 ) 		-----Boss��[
	SetModeEx( UpperPart , EM_SetModeType_Move , false )		------������
	SetModeEx( UpperPart , EM_SetModeType_Strikback , false )	------������
	SetModeEx( UpperPart , EM_SetModeType_Fight , false )		------���i���
	SetModeEx( UpperPart , EM_SetModeType_Searchenemy , false )	------������
	SetModeEx( UpperPart , EM_SetModeType_Mark , false )		------���i�I��
	SetModeEx( UpperPart , EM_SetModeType_NotShowHPMP , false )	------��show���
	SetModeEx( UpperPart , EM_SetModeType_Gravity , false )		------�S�����O
	AddToPartition( UpperPart , Room )
	WriteRoleValue( Boss , EM_RoleValue_register7 , UpperPart )
	
	local Exit = CreateObjByFlag( 103211 , 780422 , 11 , 1 )	-----���ת�(�X�f)
	SetModeEx( Exit , EM_SetModeType_Move , false )			------������
	SetModeEx( Exit , EM_SetModeType_Strikback , false )	------������
	SetModeEx( Exit , EM_SetModeType_Fight , false )		------���i���
	SetModeEx( Exit , EM_SetModeType_Searchenemy , false )	------������
	SetModeEx( Exit , EM_SetModeType_Mark , false )			------���i�I��
	SetModeEx( Exit , EM_SetModeType_NotShowHPMP , false )	------��show���
	SetModeEX( Exit , EM_SetModeType_Obstruct , true )		------����
	AddToPartition( Exit , Room )
	WriteRoleValue( Boss , EM_RoleValue_register10 , Exit )
	
	local Entrance
	local EnterFight = 0
	while 1 do
		sleep(10)
		local BossTarget = ReadRoleValue( Boss , EM_RoleValue_AttackTargetID )
		if  ( BossTarget ~= 0 ) and ( CheckID( Boss ) ) == true then
			if EnterFight == 0 then  
				Entrance = CreateObjByFlag( 103211 , 780422 , 12 , 1 )		-----���ת�(�J�f)
				SetModeEx( Entrance , EM_SetModeType_Move , false )			------������
				SetModeEx( Entrance , EM_SetModeType_Strikback , false )	------������
				SetModeEx( Entrance , EM_SetModeType_Fight , false )		------���i���
				SetModeEx( Entrance , EM_SetModeType_Searchenemy , false )	------������
				SetModeEx( Entrance , EM_SetModeType_Mark , false )			------���i�I��
				SetModeEx( Entrance , EM_SetModeType_NotShowHPMP , false )	------��show���
				SetModeEX( Entrance , EM_SetModeType_Obstruct , true )		------����
				AddToPartition( Entrance , Room )
				WriteRoleValue( Boss , EM_RoleValue_register9 , Entrance )
				Mode = 1
				WriteRoleValue( Boss , EM_RoleValue_register1 , 1 )
				EnterFight = 1
			end
			counter1 = counter1 + 1	
			BerserkCounter = BerserkCounter + 1
			--Say(OwnerID() , "counter1="..counter1)	
			if Mode == 1 then
				if counter1 >= ModeTime1 then
					Mode = 2
					WriteRoleValue( Boss , EM_RoleValue_register1 , 2 )
					counter1 = 0	
				end
			elseif Mode == 2 then
				if counter1 >= ModeTime2 then
					Mode = 1
					WriteRoleValue( Boss , EM_RoleValue_register1 , 1 )
					counter1 = 0
				end
			end		
			if BerserkCounter >= 480 then						-------8�����g��				
				if IsBerserk == 0 then
					--AddBuff( Boss , 504269 , 0 , -1 ) 			-------�������boss�Τ@��buff
					IsBerserk = 1
				end	
			end	
		else	
			local BossEnterFight = ReadRoleValue( OwnerID() , EM_RoleValue_register2 )
			if EnterFight == 1 or BossEnterFight == 1 then
				if Entrance ~= nil then
					DelObj(Entrance)
				end		
				for i=1 , 10 do
					local BossDead = ReadRoleValue( OwnerID() , EM_RoleValue_register1 )
					sleep(10)
					if CheckID( Boss ) == false and BossDead ~= -1 then
						counter2 = counter2 + 1
						--Say( OwnerID() , counter2 )
						if counter2 == 5 then
							Boss = CreateObjByFlag( 103205 , 780422 , 1 , 1 )				-----Boss�D��
							SetModeEx( Boss , EM_SetModeType_Move , false )	------������
							AddToPartition( Boss , Room )
							BeginPlot( Boss , "lua_star_BossAI_102558_easy" , 0 )
							Setplot( Boss , "dead" , "star_102558_BossDead_easy" , 30)
							WriteRoleValue( Boss , EM_RoleValue_register7 , UpperPart )
							WriteRoleValue( Boss , EM_RoleValue_register8 , OwnerID() )
							WriteRoleValue( Boss , EM_RoleValue_register10 , Exit )
							counter2 = 0
							break
						end	
					end
				end	
				WriteRoleValue( Boss , EM_RoleValue_register1 , 1 )
				counter1 = 0
				Mode = 1
				EnterFight = 0
				IsBerserk = 0
				BerserkCounter = 0
				WriteRoleValue( OwnerID() , EM_RoleValue_register2 , 0 )
			end	
		end	
	end	
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------�D��AI����(���������ݧ��A�ѷӭ�Ӫ����A�@�δ��q��function)




