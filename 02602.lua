--���s�� 
--BOSS�s�� 
--���޺X�� 781081
--���� 781079
--boxĲ�I�� 781080
function Dy_Z24_AIC() --�D�n���
	local fight --�԰��P�_
	local fight1 = 0 --�}�ԧP�_
	local weakp = 0 --�����z�I�O��
	local rush = 0 --�g�ɰO��
	local roomid = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) --Ū�X����b���@�h
	local Door = CreateObjByFlag( 102460 , 781079 , 2 , 1 ) ---�s���n�� �� Boss���  
	local Door2 --�e��
	local ball --�����P�_�Z����
	local ZoneID = ReadRoleValue ( OwnerID(), EM_RoleValue_ZoneID )
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
	WriteRoleValue( OwnerID(), EM_RoleValue_Register2, 0)
	local Boss
	if ZoneID == 149 then
		Boss = CreateObjByFlag( 106609 , 781081 , 1 , 1 ) ---�ͥXBoss (BOSS�s��  ,�X�нs�� ��N���X�� �ͥX�X�ө�) 
	else
		Boss = CreateObjByFlag( 107453 , 781081 , 1 , 1 )
	end
	SetModeEx( Boss , EM_SetModeType_Show, true) ----�q�X
	SetModeEx( Boss , EM_SetModeType_Mark, true) ----�аO
	SetModeEx( Boss , EM_SetModeType_Strikback, true) ---����
	SetModeEx( Boss , EM_SetModeType_Move, true) ---����	
	SetModeEx( Boss , EM_SetModeType_Fight, true) ---�i���
	SetModeEx( Boss , EM_SetModeType_SearchenemyIgnore, true) ---���󤣷|�Q�j�M
	SetModeEx( Boss , EM_SetModeType_HideName, true)  ---�����Y�W�O�_��ܦW��
	SetModeEx( Boss , EM_SetModeType_HideMinimap, true)  ---����O�_�b�p�a�ϤW���
	SetModeEx( Boss , EM_SetModeType_Searchenemy, true)  ---����
	SetModeEx( Boss   , EM_SetModeType_Obstruct, false )--����	
	WriteRoleValue(Boss,EM_RoleValue_IsWalk,1) --�]�w�����ʧ@ --0���]�B 1������
	SetPlot( Boss,"dead","Dy_Z24_dead",10 )----Boss ���`�@��
	WriteRoleValue( Boss, EM_RoleValue_PID, OwnerID()) --�N����g�JBOSS��
	WriteRoleValue( OwnerID(), EM_RoleValue_Register1, Boss) --�NBoss�g�J�������Register1
	AddToPartition( Boss,roomid )
	--�������޼@������
	BeginPlot( Boss, "Dy_Z24BOSSAI", 10) ---Boss���԰�Function (  BOSS BOSS��LUA_AI  ��\�C10=1��)
		
	--�԰��}�l����n�����Ʊ�
	while 1  do
		sleep(10)
		fight = ReadRoleValue( OwnerID() , EM_RoleValue_Register2 )	 --Ū���g�J�����2�檺�Ʀr
		if fight == 1 then --�԰���
		
			if fight1 == 0 then --�קK�C���j�魫�]�@���ͪ�
				ScriptMessage( Boss, -1 , 2 , "[SC_106609_FIGHT]" , 2 ) --�۸ܩ�o��~���|�@���]
				Door2 = CreateObjByFlag( 102460 , 781079 , 1 , 1 ) ---�s���n�� �� Boss�e�� 
				ball = CreateObjByFlag( 106105 , 781081 , 4 , 1 )				
				SetModeEx( Door2 , EM_SetModeType_Show, true) ----�q�X
				SetModeEx( Door2 , EM_SetModeType_Mark, false) ----�аO
				SetModeEx( Door2 , EM_SetModeType_Strikback, false) ---����
				SetModeEx( Door2 , EM_SetModeType_Move, false) ---����	
				SetModeEx( Door2 , EM_SetModeType_Fight, false) ---�i���
				SetModeEx( Door2 , EM_SetModeType_SearchenemyIgnore, true) ---���󤣷|�Q�j�M
				SetModeEx( Door2 , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
				SetModeEx( Door2 , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
				SetModeEx( Door2 , EM_SetModeType_Searchenemy, false)  ---����
				SetModeEx( Door2   , EM_SetModeType_Obstruct, true )--����
				SetModeEx( ball , EM_SetModeType_Show, false) ----�q�X
				SetModeEx( ball , EM_SetModeType_Mark, false) ----�аO
				SetModeEx( ball , EM_SetModeType_Strikback, false) ---����
				SetModeEx( ball , EM_SetModeType_Move, false) ---����	
				SetModeEx( ball , EM_SetModeType_Fight, false) ---�i���
				SetModeEx( ball , EM_SetModeType_SearchenemyIgnore, true) ---���󤣷|�Q�j�M
				SetModeEx( ball , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
				SetModeEx( ball , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
				SetModeEx( ball , EM_SetModeType_Searchenemy, false)  ---����
				SetModeEx( ball   , EM_SetModeType_Obstruct, false )--����
				AddToPartition( Door2,roomid )
				AddToPartition( ball,roomid )
				WriteRoleValue( OwnerID() , EM_RoleValue_Register3 , Door2)--�N������GID�x�s�ܱ����Register3���A�H��K���R����
				WriteRoleValue( OwnerID() , EM_RoleValue_Register5 , ball)
				fight1 = 1
				--BeginPlot( Boss, "Dy_Z24BOSSAI", 10) ---Boss���԰�Function (  BOSS BOSS��LUA_AI  ��\�C10=1��)
			end
			rush = rush+1 --�g�ɰO��
			weakp = weakp+1 --�����z�I�O��
			--say (Boss, "rush = "..rush)
			--say (Boss, "weakp = "..weakp)
			
			if rush >= 360 then
				if ZoneID==149 then
					AddBuff(Boss , 623667 , 0 , -1) --�g��Buff �ݭn�ק�s��
				end	
			end
			
			if weakp % 15 == 0 then
				local ran = Rand(100)+1
				if ran % 2 == 1 then
					ScriptMessage( Boss, -1 , 2 , "[SC_106609_WEAK1]" , 2 )
					sysCastSpellLv	( Boss,  Boss , 499075, 0 )  --�����z�I���z
					--say (OwnerID(), "weak01")
				elseif ran % 2 ==0 then
					ScriptMessage( Boss, -1 , 2 , "[SC_106609_WEAK2]" , 2 )
					sysCastSpellLv	( Boss,  Boss , 499076, 0 ) --�����z�I�k�N
					--say (OwnerID(), "weak02")
				end
			end

		--���ή�
		elseif fight == 2 then
			ScriptMessage( Boss, -1 , 2 , "[SC_106609_BYE]" , 2 )
			sleep (30)
			Delobj(Door2) --�R�����e��
			Delobj(Boss) --�R����Boss
			Delobj(ball) 
			sleep(50)
			--�R�����a���W���k�N	
			local npcp = {}
			npcp = SearchRangePlayer( OwnerID() , 1000 ) 
			local num = table.getn(npcp) 
			for i=0,num,1 do
				if CheckBuff (npcp[i] , 621935 ) == true 
				and ReadRoleValue( npcp[i] , EM_RoleValue_IsDead ) ~= 1 then
					CancelBuff	(npcp[i] , 621935 )
				end
				if CheckBuff (npcp[i] , 621937 ) == true 
				and ReadRoleValue( npcp[i] , EM_RoleValue_IsDead ) ~= 1 then
					CancelBuff	(npcp[i] , 621937 )
				end
			end			
			--Boss����
			if ZoneID == 149 then
				Boss = CreateObjByFlag( 106609 , 781081 , 1 , 1 ) ---�ͥXBoss (BOSS�s��  ,�X�нs�� ��N���X�� �ͥX�X�ө�) 
			else
				Boss = CreateObjByFlag( 107453 , 781081 , 1 , 1 )
			end 
			SetPlot( Boss,"dead","Dy_Z24_dead",10 )----Boss ���`�@��
			WriteRoleValue( Boss, EM_RoleValue_PID, OwnerID()) --�N����g�JBOSS��
			WriteRoleValue( OwnerID(), EM_RoleValue_Register1, Boss) --�NBoss�g�J�������Register1
			AddToPartition( Boss,roomid )
			BeginPlot( Boss, "Dy_Z24BOSSAI", 10) ---Boss���԰�Function (  BOSS BOSS��LUA_AI  ��\�C10=1��)
			WriteRoleValue( OwnerID(), EM_RoleValue_Register2, 0)	

			fight = 0 
			fight1 = 0
			weakp = 0
			rush = 0 --�g�ɰO���k�s
		--Boss���`��
		elseif fight == 3 then
			Delobj(Door)
			if Door2 ~= nil then
				Delobj(Door2)
				Delobj(ball) 
			end
			WriteRoleValue( OwnerID(), EM_RoleValue_Register2, 0)
			break
		end
	end	
end
function Dy_Z24BOSSAI()
	local Boss = OWnerID()
	local time1 = 0 --�j���O��
	local time2 = 0 --���۰O��
	local luck
	local skill = {499071 , 499070 } ------------AE�ˮ` , �嫬�b��
	local skillspeak = {"[SC_106609_02]" , "[SC_106609_03]" }
	local skillLV = { 0 , 0  } 
	local CH1 = ReadRoleValue( Boss , EM_RoleValue_PID ) 	--Ū�X�����GID
	local door = ReadRoleValue( CH1 , EM_RoleValue_Register3 ) --Ū�X�����GID
	local door2 = ReadRoleValue( CH1 , EM_RoleValue_Register4 ) --Ū�X�e����GID
	local ball = ReadRoleValue( CH1 , EM_RoleValue_Register5 )
	local roomID = ReadRoleValue(Boss , EM_RoleValue_RoomID ) --Ū�XBoss�b���@�h
	local fight = 0 --�԰��}��
	--say (OwnerID() , "111")
	--say (door , "door")
	--say (door , "door2")
	WriteRoleValue(Boss,EM_RoleValue_IsWalk,1) --�]�w�]�B�ʧ@ --0���]�B 1������
	BeginPlot( Boss, "Dy_Z24BOSSMOVE", 10) --���޼@��
	while 1 do
	sleep(10)
	local AttackTarget = ReadRoleValue( Boss , EM_RoleValue_AttackTargetID ) --Ū���b�������ؼ�
	
		if  AttackTarget ~= 0  and ( CheckID( Boss ) ) == true then	--�p�G�ؼФH��>0�A�ӥB�ۤv�s�b�ɡA�P�w�i�J�԰�
			fight = 1 --��ܥ��b�԰���
			WriteRoleValue(Boss ,EM_RoleValue_IsWalk,0) --�]�w�]�B�ʧ@ --0���]�B 1������
			WriteRoleValue( CH1, EM_RoleValue_Register2, 1) --�^�Ǳ�����w�g�b�԰����F
			time1 = time1 + 1
			time2 = time2 + 1
			if time1 %5 == 0 and GetDistance (Boss,AttackTarget)>=50 then --�C����P�_�ؼШS�b�Z��100���N�|�ܱj
				AddBuff( Boss , 621943 , 0 , -1)
			end
			
			--�j�����q
			if time1 % 23 ==0 then
				door = ReadRoleValue( CH1 , EM_RoleValue_Register3 ) --Ū�X�����GID
				door2 = ReadRoleValue( CH1 , EM_RoleValue_Register4 )
				ball = ReadRoleValue( CH1 , EM_RoleValue_Register5 )
				time2 = 0 --����۪��p��
				local time3 = 0 --�j�������p��
				local player2 ={}
				local player1 ={}  --�u���Z 
				local luck3 --�w������H
				--local luck4 --�îg����H
				local range1 = GetDistance (Boss , door)
				local range2 = GetDistance (Boss , door2)
				local range3 = GetDistance (Boss , ball)
				ScriptMessage( Boss, -1 , 2 , "[SC_106609_01]" , 2 )
				player2 = DW_HateRemain(1) --������H   ��0�N�� ���ư��D�Z
				player1 = DW_HateRemain(0)
				local choose = table.getn(player2)
				--say (player2[1] , "000")
				--say (player2[1] , "111")
				sleep(10)
				--�����Z���P�_����--
				--say(AttackTarget,"range1 = "..range1)
				--say(AttackTarget,"range2 = "..range2)
				--say(AttackTarget,"range3 = "..range3)
				
				if range1 > range2 then --�p�G����>��e���h�⪱�a�����
					if range2 < range3 then
						FA_FaceFlagEX ( Boss , 781079 , 2 , 0 , 0) 
						local ALLP = SetSearchAllPlayer(RoomID ) --�j�M�������a
						for i = 0 , ALLP ,1 do --�⪱�a��J�E�c��ϰ�
							local PID = GetSearchResult()
							if ReadRoleValue( PID , EM_RoleValue_IsDead ) ~= 1 and --�S��
							ReadRoleValue( PID, EM_RoleValue_VOC) ~= 0  and --���OGM
							ReadRoleValue( PID , EM_RoleValue_RoomID  ) == RoomID then --�b�P�h
							SetPosByFlag( PID , 781079 , 4 ) 
							end
						end
					else
						FA_FaceFlagEX ( Boss , 781079 , 2 , 0 , 0) 
						local ALLP = SetSearchAllPlayer(RoomID ) --�j�M�������a
						for i = 0 , ALLP ,1 do --�⪱�a��J�E�c��ϰ�
							local PID = GetSearchResult()
							if ReadRoleValue( PID , EM_RoleValue_IsDead ) ~= 1 and --�S��
							ReadRoleValue( PID, EM_RoleValue_VOC) ~= 0  and --���OGM
							ReadRoleValue( PID , EM_RoleValue_RoomID  ) == RoomID then --�b�P�h
							SetPosByFlag( PID , 781081 , 4 ) 
							end
						end
					end	
					--781081 �����I
				else --�p�G��e��>�����h�⪱�a���e��
					if range1 < range3 then
						FA_FaceFlagEX ( Boss , 781079 , 1 , 0 , 0) 
						local ALLP = SetSearchAllPlayer(RoomID ) --�j�M�������a
						for i = 0 , ALLP ,1 do --�⪱�a��J�E�c��ϰ�
							local PID = GetSearchResult()
							if ReadRoleValue( PID , EM_RoleValue_IsDead ) ~= 1 and --�S��
							ReadRoleValue( PID, EM_RoleValue_VOC) ~= 0  and --���OGM
							ReadRoleValue( PID , EM_RoleValue_RoomID  ) == RoomID then --�b�P�h
							SetPosByFlag( PID , 781081 , 4 ) 
							end
						end
					else
						FA_FaceFlagEX ( Boss , 781079 , 1 , 0 , 0) 
						local ALLP = SetSearchAllPlayer(RoomID ) --�j�M�������a
						for i = 0 , ALLP ,1 do --�⪱�a��J�E�c��ϰ�
							local PID = GetSearchResult()
							if ReadRoleValue( PID , EM_RoleValue_IsDead ) ~= 1 and --�S��
							ReadRoleValue( PID, EM_RoleValue_VOC) ~= 0  and --���OGM
							ReadRoleValue( PID , EM_RoleValue_RoomID  ) == RoomID then --�b�P�h
							SetPosByFlag( PID , 781079 , 3 ) 
							end
						end
					
					end	
				
				end
					
				
				
				--������������������������������������������--
				--�����]�wBoss�ʧ@����
				SetModeEx( Boss , EM_SetModeType_Move, false) ---���ۤv�L�k����
				local luck2 
					ScriptMessage( Boss, -1 , 2 , skillspeak[2] , 2 )
					sleep(30)
					if player1 == false then
						player1 = {}
					end
					luck2 = Rand(table.getn(player1))+1			--RAND�쪺�Ʀr	
					if ( player1[luck2] ~= nil ) and ( ReadRoleValue( player1[luck2] , EM_RoleValue_IsDead ) == 0 ) then
						CastSpellLv( Boss , player1[luck2] , skill[2] , skillLV[2])
					end
					sleep(20)
				--SetDefIdleMotion( OwnerID() , bow_ready )bow_channel  bow_release bow_ready
				--�����쪱�a�ƶq����
				if choose == 1 then
					AddBuff( player2[1] , 621939 , 0 , 8) --�w��8��
					AddBuff( player2[1] , 621940 , 0 , 10) --�аO
					sleep (50)
					sysCastSpellLv	( Boss,  player2[1] , 499746 , 0 ) 
				elseif choose == 2 then 
					AddBuff( player2[1] , 621939 , 0 , 8) --�w��8��
					AddBuff( player2[2] , 621940 , 0 , 10) --�аO
					sleep (50)
					sysCastSpellLv	( Boss,  player2[2] , 499746 , 0 )					
				elseif choose >= 3 then
					luck3 = Az_RND_Ary(1,choose,3) --�q1~6�����X3��
					AddBuff( player2[luck3[1]] , 621939 , 0 , 8) --�w��8��
					AddBuff( player2[luck3[2]] , 621939 , 0 , 8) --�w��8��
					AddBuff( player2[luck3[2]] , 621940 , 0 , 8) --�аO�ĤT�ӤH
					AddBuff( player2[luck3[2]] , 623765 , 0 , 5) --�аO�ĤT�ӤH
					AddBuff( player2[luck3[3]] , 621940, 0 , 10) --�аO�ĥ|�ӤH
					sleep (50)
					sysCastSpellLv	( Boss,  player2[luck3[2]] , 499746 , 0 ) 
					sysCastSpellLv	( Boss,  player2[luck3[3]] , skill[2] , skillLV[2] )
				elseif table.getn(player1) == 1 then  --���
					AddBuff( player1[1] , 621939 , 0 , 8) --�w��8��
					AddBuff( player1[1] , 621940 , 0 , 10) --�аO
					sleep (50)
					sysCastSpellLv	( Boss, player1[1] , 499746 , 0 )
				end
				--���Ԥ}����t��
				--Dy_Z24BOSSSHOT()		-- 
				time2 = 0
				sleep (20)
			end
			
			--���q�ۦ�
			if time2 > 5 then
				luck = Rand(100)+1
				while 	ReadRoleValue(Boss , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
						sleep(2)
				end			
				if luck % 2 == 0 then --�I��AE�ˮ`
					ScriptMessage( Boss, -1 , 2 , skillspeak[1] , 2 )
					CastSpellLV( Boss , Boss , skill[1] , skillLV[1] )
				elseif luck % 2 ==1 then --�I���嫬�ˮ`
					local player = {}
					local luck2 
					ScriptMessage( Boss, -1 , 2 , skillspeak[2] , 2 )
					sleep(10)
					
					player = DW_HateRemain(0) --������H   ��0�N�� ���ư��D�Z
					if player == false then
						player = {}
					end
					luck2 = Rand(table.getn(player))+1			--RAND�쪺�Ʀr	
					if ( player[luck2] ~= nil ) and ( ReadRoleValue( player[luck2] , EM_RoleValue_IsDead ) == 0 ) then
						CastSpellLv( Boss , player[luck2] , skill[2] , skillLV[2])
					end
					table.remove( player , luck2 ) --�񧹫�R����table�̭������a���
					sleep(1)
				end
				time2 = 0
			end
		elseif AttackTarget ==0 and fight ==1 then
			time1 = 0
			time2 = 0
			WriteRoleValue( CH1, EM_RoleValue_Register2, 2) --�^�Ǳ�����a����
		
		end
	end
end

function Dy_Z24_TOUCH()
end

function Dy_Z24_dead() ----Boss ���`�@��
	local CH1 = ReadRoleValue( OwnerID() , EM_RoleValue_PID )  --Ū�X�����ID
	local roomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID )
	ScriptMessage( CH1, -1 , 2 , "[SC_106609_DEAD]" , 2 ) --���`�r��

	--�R�����a���W���k�N	
	local npcp = {}
    npcp = SearchRangePlayer( OwnerID() , 1000 ) 
	local num = table.getn(npcp) 
	for i=0,num,1 do
		if CheckBuff (npcp[i] , 621935 ) == true then
			CancelBuff	(npcp[i] , 621935 )
		end
		if CheckBuff (npcp[i] , 621937 ) == true then
			CancelBuff	(npcp[i] , 621937 )
		end
	end
	WriteRoleValue( CH1, EM_RoleValue_Register2, 3)
end
function Dy_Z24BOSSMOVE () --���ʼ@��
	WriteRoleValue(OwnerID(),EM_RoleValue_IsWalk,1) --�]�w�]�B�ʧ@ --0���]�B 1������
	while 1 do 
		if  hatelistcount(OwnerID()) == 0 then
			for i = 2 , 4 , 1 do 
				WriteRoleValue(OwnerID(),EM_RoleValue_IsWalk,1) --�]�w�]�B�ʧ@ --0���]�B 1������
				LuaFunc_MoveToFlag	( OwnerID(), 781081 , i , 0)
				--LuaFunc_MoveAllFlag( OwnerID(), 781081 ) 
				sleep(30)
			end
		else
			break
			--MoveToFlagEnabled( OwnerID(), false ) --�������޼@��
		end
		sleep(10)
	end
end
function Dy_Z24BOSSSHOT () --��t�@��
	local time3 = 0
	local player3 ={}
	local CH1 = ReadRoleValue( OwnerID() , EM_RoleValue_PID ) 	--Ū�X�����GID
	local npcp = {}
	local luck5 = {}
	local num2
	while 1 do
		sleep(10)
		player3 = DW_HateRemain(0) --������H   ��0�N�� ���ư��D�Z
		npcp = SearchRangePlayer( OwnerID() , 100 )
		local num = table.getn(npcp)
		
		time3 = time3 +1 
		--say (OwnerID(), "time3 = "..time3)
		
		--�H���îg
		--10��S���H�bBOSS100�d�򤺫h+BOSS�����ˮ`
		--[[if num ~=0 then
			break
		end--]]
		if time3 % 5  == 0 then
			if num == 0 then
				AddBuff( OwnerID() , 621943 , 0 , -1)
			end
		elseif  time3 % 10 == 0 then -- ��l�ɶ��I��îg
			if player3 == false then
				player3 ={}
			end
			num2 = table.getn(player3)
			luck4 = DW_Rand(num2)				
			if num2 == 1 and 
			ReadRoleValue( player3[1] , EM_RoleValue_IsDead ) == 0 then
				sysCastSpellLv	( OwnerID(),  player3[luck4] , 499072 , 0 ) 
			elseif num2 > 1 then
				luck5 = Az_RND_Ary(1,num2,2)
				sysCastSpellLv	( OwnerID(),  player3[luck5[1]] , 499072 , 0 ) 
				sysCastSpellLv	( OwnerID(),  player3[luck5[2]] , 499072, 0 )
				sleep(10)
			end
		elseif hatelistcount(OwnerID()) == 0 then
			WriteRoleValue( CH1, EM_RoleValue_Register2, 2) --�^�Ǳ�����a����
		elseif time3 %13 == 0 then
			break
		end
	end
end
function Lua_un_bossfight2_149()    --���u�b�B
		local own = OwnerID()
		local ZoneID = ReadRoleValue ( own, EM_RoleValue_ZoneID )
		sleep(2)
		local RoomID=ReadRoleValue(own,EM_RoleValue_RoomID)
		--say(TargetID( ),"X"..x)
		local cab=Lua_DW_CreateObj("obj",107418,TargetID(),0)
		SetModeEx(cab,EM_SetModeType_Mark,false) ----�аO
		SetModeEx(cab,EM_SetModeType_Strikback,false) ---����
		SetModeEx(cab,EM_SetModeType_Move,false) ---����	
		SetModeEx(cab,EM_SetModeType_Fight,false) ---�i���
		SetModeEx(cab,EM_SetModeType_SearchenemyIgnore,false) ---���󤣷|�Q�j�M
		SetModeEx(cab,EM_SetModeType_HideName,false)  ---�����Y�W�O�_��ܦW��
		SetModeEx(cab,EM_SetModeType_HideMinimap,false)  ---����O�_�b�p�a�ϤW���
		SetModeEx(cab,EM_SetModeType_Searchenemy,false)  ---���
		SetModeEx(cab,EM_SetModeType_Show,false)
		AddToPartition(cab,RoomID )
		local PPL=SearchRangePlayer(TargetID(),90)	
		local x=table.getn(PPL)-----���X�Ӫ��O�ƶq
		WriteRoleValue(cab,EM_RoleValue_Livetime,3)
		if ZoneID == 149 then
			if x>=4 then
				CastSpellLV(cab,cab,499072,49)
			elseif x==3 then
				CastSpellLV(cab,cab,499072,79)
			elseif x==2 then
				CastSpellLV(cab,cab,499072,159)
			elseif x==1 then	
				CastSpellLV(cab,cab,499072,299)
			end
		else
			if x>=4 then
				CastSpellLV(cab,cab,499072,9)
			elseif x==3 then
				CastSpellLV(cab,cab,499072,19)
			elseif x==2 then
				CastSpellLV(cab,cab,499072,49)
			elseif x==1 then	
				CastSpellLV(cab,cab,499072,159)
			end
		end
end