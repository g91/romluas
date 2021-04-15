--�Ұʾ�
--EM_RoleValue_Register1 BOSS
--EM_RoleValue_Register2 �}�l�Ұʾ�
--EM_RoleValue_Register3 door
--EM_RoleValue_Register4 reset���m���q
--EM_RoleValue_Register5 boss���`�^��
--EM_RoleValue_Register6 Tornadomark�^�ǭ�

--BOSS
--EM_RoleValue_Register7 �Z���^��
--EM_RoleValue_Register8 �Z���^��
--EM_RoleValue_Register9 �Z���^��

function Lua_cang_banalloz_start()	--���ͭp�ƾ�
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)--���y�W����
	local Boss = CreateObjByFlag( 102704, 780485, 0, 1)	--�۴�	
	local Start	= 0
	local Dead = 0
	local CountDead = 0
	local loot
	local count_door = 0
	AddToPartition( Boss , RoomID )	--�[�i�R�x
	SetModeEx( boss , EM_SetModeType_Strikback, false) ---����
	SetModeEx( boss , EM_SetModeType_Move, false) ---����	
	SetModeEx( boss , EM_SetModeType_Fight, false) ---�i���
	SetModeEx( boss , EM_SetModeType_Show, true)
	SetModeEx( boss , EM_SetModeType_Searchenemy, false )--����

	local opener = CreateObjByFlag( 102881, 780485, 4, 1)	--�۴�	
	SetModeEx( opener   , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( opener   , EM_SetModeType_Strikback, false )--����
	SetModeEx( opener   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( opener   , EM_SetModeType_Mark, false )--�аO
	SetModeEx( opener   , EM_SetModeType_Move, false )--����
	SetModeEx( opener   , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( opener   , EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( opener   , EM_SetModeType_HideName, false )--�W��
	AddToPartition( opener , RoomID )	--�[�i�R�x	
	SetPlot( opener, "range" , "Lua_cang_banalloz_open" ,200 )	
	WriteRoleValue( opener ,EM_RoleValue_PID, OwnerID())
	
	local Door = CreateObjByFlag( 102925 , 780485 , 6 , 1 )
	SetModeEX( Door  , EM_SetModeType_Gravity , false )--���O
	SetModeEx( Door  , EM_SetModeType_ShowRoleHead, false )--���q�Y����
	SetModeEx( Door  , EM_SetModeType_Obstruct, true )--����
	SetModeEx( Door  , EM_SetModeType_Mark, false )--�аO
	SetModeEx( Door  , EM_SetModeType_Move, false )--����
	SetModeEx( Door  , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( Door  , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( Door  , EM_SetModeType_Strikback, false )--����	
	AddToPartition( Door , RoomID )	--�[�i�R�x
	WriteRoleValue( OwnerID() ,EM_RoleValue_Register3, Door)
	while true do
		sleep(10)
		Start = ReadRoleValue( OwnerID() , EM_RoleValue_Register2 )
		Dead = ReadRoleValue( OwnerID() , EM_RoleValue_Register5 )
		if Start == 1 then
			CastSpellLV(Boss, Boss, 494319 , 1 )
			ScriptMessage( Boss , -1 , 2 ,  "[SC_102721_1]", 1 )			
			Sleep(40)	
			DelObj(Boss)
			Sleep(30)
			local show = CreateObjByFlag( 102881, 780485, 4, 1)			
			SetModeEX( show  , EM_SetModeType_Gravity , false )--���O
			SetModeEx( show  , EM_SetModeType_ShowRoleHead, false )--���q�Y����
			SetModeEx( show  , EM_SetModeType_Obstruct, true )--����
			SetModeEx( show  , EM_SetModeType_Mark, false )--�аO
			SetModeEx( show  , EM_SetModeType_Move, false )--����
			SetModeEx( show  , EM_SetModeType_Searchenemy, false )--����
			SetModeEx( show  , EM_SetModeType_Fight , false )--�i�������
			SetModeEx( show  , EM_SetModeType_Strikback, false )--����				
			AddToPartition( show , RoomID )			
			local show1 = CreateObjByFlag( 102881, 780485, 9, 1)			
			SetModeEX( show1  , EM_SetModeType_Gravity , false )--���O
			SetModeEx( show1  , EM_SetModeType_ShowRoleHead, false )--���q�Y����
			SetModeEx( show1  , EM_SetModeType_Obstruct, true )--����
			SetModeEx( show1  , EM_SetModeType_Mark, false )--�аO
			SetModeEx( show1  , EM_SetModeType_Move, false )--����
			SetModeEx( show1  , EM_SetModeType_Searchenemy, false )--����
			SetModeEx( show1  , EM_SetModeType_Fight , false )--�i�������
			SetModeEx( show1  , EM_SetModeType_Strikback, false )--����				
			AddToPartition( show1 , RoomID )			
			CastSpellLV(show, show, 494319 , 1 )
			CastSpellLV(show1, show1, 494319 , 1 )
			if count_door == 0 then
				BeginPlot(Door , "Lua_cang_banalloz_door_open", 0)				
				count_door = 1
			end	
			local PPL = SetSearchAllPlayer(RoomID)					
			local ID = {}
			for i = 1 , PPL , 1 do ---�⪱�a��J�ж��� 
				ID[i] = GetSearchResult() -- ���Ȧs��
				if ReadRoleValue( ID[i] , EM_RoleValue_IsDead ) ~= 1 and GetDistance( ID[i] , show ) > 100 and GetDistance( ID[i] , show ) < 1000 
					and ReadRoleValue( ID[i], EM_RoleValue_VOC) ~= 0  and ReadRoleValue( ID[i] , EM_RoleValue_RoomID  ) == RoomID then
					SetPosByFlag( ID[i] , 780485 , 9 ) --�Ԩ�X�Ц�l
				end
			end	
			Sleep(30)			
			local Boss01 = CreateObjByFlag( 102704, 780485, 4, 1)	--�۴�	
			AddToPartition( Boss01 , RoomID )	--�[�i�R�x	
			WriteRoleValue( OwnerID() ,EM_RoleValue_Register1, Boss01 )--�Ȧs�@��BOSS
			WriteRoleValue( Boss01 ,EM_RoleValue_PID, OwnerID() )--�Ȧs�@��BOSS
			BeginPlot( OwnerID(), "Lua_cang_banalloz_time" , 0)
			BeginPlot( OwnerID(), "Lua_cang_banalloz" , 20)
			SetPlot( Boss01,"dead", "Lua_cang_banalloz_Boss_dead" ,0 )	
			WriteRoleValue( OwnerID() ,EM_RoleValue_Register2, 2)
			DelObj(show)
			DelObj(show1)
		end
		if Dead == 1 then
			if CountDead == 0 then
				BeginPlot(Door , "Lua_cang_banalloz_door_close", 0)
				ScriptMessage( OwnerID() , -1 , 2 ,  "[SC_102721_9]", 1 )
				sleep(50)
				DelObj(Door)
				loot = CreateObjByFlag( 102944, 780485, 4, 1)	--�_�c
				AddToPartition( loot , RoomID )	--�԰��S�x 
				SetFightMode(loot, 0, 0, 0, 0)
				sleep(50)
				DelObj(OwnerID())
			end	
		end
	end
end

function Lua_cang_banalloz_Boss_dead() --�������^��
	local dead = ReadRoleValue( OwnerID() ,EM_RoleValue_PID)
	WriteRoleValue( dead , EM_RoleValue_Register5 , 1)	--�g�JPID
end

function Lua_cang_banalloz_open()--Ĳ�o��������
	if ReadRoleValue( OwnerID() , EM_RoleValue_IsDead ) == 0 then--�ˬd�O�_���`
		SetPlot( TargetID(),"range", "" ,0 )
		BeginPlot( TargetID(), "Lua_cang_banalloz_open_01", 10)
	end
end

function Lua_cang_banalloz_open_01()--Ĳ�o��^��
	local Start = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	WriteRoleValue( Start ,EM_RoleValue_Register2, 1)
	sleep(50)
	DelObj(OwnerID())
end

function Lua_cang_banalloz_time()	--���ͭp�ƾ�

	local Mode1 = 505078	--���q1
	local Mode2 = 505079	--���q2
	local Mode3 = 505080	--���q3
	local Mode4 = 505224	--�g��
	local Time = 0		--�ɶ�
	local Boss
	local Time1 = 0

	while 1 do
		sleep(10)
		Boss = ReadRoleValue( OwnerID() , EM_RoleValue_Register1 )
		local AttackTarget = ReadRoleValue( Boss , EM_RoleValue_AttackTargetID )	--��ؼЭ�
		if (  AttackTarget ~= 0 ) and ( CheckID( Boss ) == true ) then  -- �ˬd�O�_���}�԰�
			Time = Time + 1
			Time1 = Time1 + 1
			if Time > 0 and Time < 30 then
				CancelBuff( Boss , Mode2 )		--�R��1	
				CancelBuff( Boss , Mode3 )		--�R��1			
				AddBuff( Boss , Mode1 , 0 , -1 )	--1
			elseif Time >= 30 and Time < 40 then	--���30 �����3
				CancelBuff( Boss , Mode1 )		--�R��1
				CancelBuff( Boss , Mode3 )		--�R��1
				AddBuff( Boss , Mode2 , 0 , -1 )	--1
			elseif Time >= 40 and Time < 70 then--���40 �����10
				CancelBuff( Boss , Mode1 )		--�R��1
				CancelBuff( Boss , Mode2 )		--�R��1
				AddBuff( Boss , Mode3 , 0 , -1 )	--1
			elseif Time == 70 then	--���70 �����20
				Time = 0
			end
			if Time1 >= 600 then
				AddBuff( Boss , Mode4 , 0 , -1 )
			end
		end
	end
end	

function Lua_cang_banalloz()	--�Q������

	local Mode1 = 505078	--���q1
	local Mode2 = 505079	--���q2
	local Mode3 = 505080	--���q3
	local Buff01 = 505081
	local Buff02 = 505082
	local Buff03 = 505083
	local Buff04 = 505084
	local count = 0
	local TimeMode1 = 0		--�Ĥ@���q�p�ƾ�
	local countmode2 = 0  	--�ĤG���q�}��
	local countmode3 = 0	--�ĤT���q�}��
	--local count_door = 0
	local NowHP			--��q
	local NowAttackTarget 	--�{�b�ؼ�
	local WHP
	local Boss 			--��
	--local Door
	local Dead			--BOSS���`�^��
	local reset	= 0		--���m���q
	local fight = 0		--�������O
	local Skillball
	local BossM3 = 0 	--�T���q���A
	local anyone
	local Weaponset = 0
	local Weapon = {}	--�Z��
	local Weapon2 = {}	--�Z��
	local Weapon3 = {}
	local W1, W2, W3	--�Z��
	local Weapon01, Weapon02, Weapon03	--�Z��
	local WeaponSoul01, WeaponSoul02, WeaponSoul03	--�Z��
	local NowX, NowY, NowZ ,NowDir
	local Castime1	--�ĤT���q�ޯ��˩w
	local Tornado	--�s����
	local Tornadomark = 0	--�s����Ĳ�I�s��
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	Boss = ReadRoleValue( OwnerID() , EM_RoleValue_Register1 )
	local SkillSay = {"[SC_102721_1]","[SC_102721_2]", "[SC_102721_3]", "[SC_102721_4]" , "[SC_102721_5]" ,"[SC_102721_6]","[SC_102721_7]","[SC_102721_8]","[SC_102721_9]"}	--�ۦ�����
--��..�x����J�Q��ù�������..
--���A�|�|..����s����j�����Y�C
--�A�̨��i�d�������O�L�k�ˮ`�Q��ù�����I�I
--�ڬ������ӥ͡I
--���Ѹӽ������Z������F�O�H�H
--�}�l�ڭ̪��C���a�I�I
--����I�I�����o�@�ɡI�I
--���ڭ̵����o���L�쪺�C���A�A�̸ө��t�~���@�ɱҵ{�C
--�ƺ�������...�O�ܰ��L�W��...
	while true do
		sleep(10)
		local AttackTarget = ReadRoleValue( Boss , EM_RoleValue_AttackTargetID )	--��ؼЭ�
		if (  AttackTarget ~= 0 ) and ( CheckID( Boss ) == true ) then  -- �ˬd�O�_���}�԰�
			fight = 1
			Boss = ReadRoleValue( OwnerID() , EM_RoleValue_Register1 )
			NowX = ReadRoleValue( Boss , EM_RoleValue_X )
			NowY = ReadRoleValue( Boss , EM_RoleValue_Y )
			NowZ = ReadRoleValue( Boss , EM_RoleValue_Z )
			NowDir = ReadRoleValue( Boss , EM_RoleValue_Dir )
			Door = ReadRoleValue( OwnerID() , EM_RoleValue_Register3 )			
			Dead = ReadRoleValue( OwnerID() , EM_RoleValue_Register5 )
			if CheckBuff (Boss , Mode1 ) == true then				
				if countmode3 == 1 then	
					Sleep(10)
					while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID ) ~= 0   do
						sleep(3)
					end
					CastSpellLV(Boss, Boss, 494482 , 1 )
					Sleep(30)
					NowHP = ReadRoleValue( Boss , EM_RoleValue_HP )	--���o�{�b��q
					NowHP = NowHP + 1
					NowAttackTarget = ReadRoleValue( Boss , EM_RoleValue_AttackTargetID )
					DelObj( boss )
					Boss = CreateObj( 102704 , NowX , NowY , NowZ , NowDir , 1 )
					AddToPartition( Boss , RoomID)
					WriteRoleValue( Boss , EM_RoleValue_HP , NowHP)	--�g�J
					WriteRoleValue( OwnerID(), EM_RoleValue_Register1, Boss)
					WriteRoleValue( Boss , EM_RoleValue_PID , OwnerID())	--�g�J
					SetAttack( Boss , NowAttackTarget )	
					SysCastSpellLV( NowAttackTarget, Boss, 494659, 1)					
					SetPlot( Boss,"dead", "Lua_cang_banalloz_Boss_dead" ,0 )			
					countmode3 = 2	
					WriteRoleValue( OwnerID(), EM_RoleValue_Register6, 0)				
				end				
				--�Ĥ@���q�Ĥ@��
				TimeMode1 = TimeMode1 + 1
				Castime = 0	
				WriteRoleValue( OwnerID(), EM_RoleValue_Register6, 0)	
				BossM3 = 0				
				if TimeMode1 == 1 then
					BeginPlot( Boss , "Lua_cang_banalloz_skill_M1" , 20)					
					local SkillRND = Rand( 100 )+1	-- ���Ͷü�
					if SkillRND <= 100 and SkillRND > 67 then
						AddBuff( Boss , Buff01 , 0 , -1 )	--1
						AddBuff( Boss , Buff04 , 0 , -1 )
						ScriptMessage( Boss , -1 , 2 ,  SkillSay[2], 1 )
					elseif SkillRND <= 67 and SkillRND > 34 then
						AddBuff( Boss , Buff02 , 0 , -1 )	--1
						ScriptMessage( Boss , -1 , 2 ,  SkillSay[3], 1 )
					elseif SkillRND <= 34 and SkillRND > 0 then
						AddBuff( Boss , Buff03 , 0 , -1 )	--1
						ScriptMessage( Boss , -1 , 2 ,  SkillSay[4], 1 )
					end					
				elseif TimeMode1 == 15 then
					CancelBuff( Boss , Buff01 )
					CancelBuff( Boss , Buff02 )
					CancelBuff( Boss , Buff03 )
					CancelBuff( Boss , Buff04 )
					local SkillRND = Rand( 100 )+1	-- ���Ͷü�					
					if SkillRND <= 100 and SkillRND > 67 then
						AddBuff( Boss , Buff01 , 0 , -1 )	--1
						AddBuff( Boss , Buff04 , 0 , -1 )
						ScriptMessage( Boss , -1 , 2 ,  SkillSay[2], 1 )			
					elseif SkillRND <= 67 and SkillRND > 34 then
						AddBuff( Boss , Buff02 , 0 , -1 )	--1
						ScriptMessage( Boss , -1 , 2 ,  SkillSay[3], 1 )
					elseif SkillRND <= 34 and SkillRND > 0 then
						AddBuff( Boss , Buff03 , 0 , -1 )	--1
						ScriptMessage( Boss , -1 , 2 ,  SkillSay[4], 1 )
					end								
				end	
				countmode2 = 0
				countmode3 = 0
			--�ĤG���q		
			elseif CheckBuff (Boss , Mode2 ) == true then	
				TimeMode1 = 0
				CancelBuff( Boss , Buff01 )
				CancelBuff( Boss , Buff02 )
				CancelBuff( Boss , Buff03 )
				CancelBuff( Boss , Buff04 )					
				--���ͤT�Z���A�H����l
				if countmode2 == 0 then		
					AddBuff(Boss, 505089 , 1 , -1)
					BeginPlot( OwnerID(), "Lua_cang_banalloz_Show" , 1)
					while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID ) ~= 0   do
						sleep(3)
					end	
					CastSpellLV(Boss, Boss, 494318 , 1 )
					ScriptMessage( Boss , -1 , 2 ,  SkillSay[5], 1 )
					WriteRoleValue( OwnerID(), EM_RoleValue_Register7, 0)
					WriteRoleValue( OwnerID(), EM_RoleValue_Register8, 0)
					WriteRoleValue( OwnerID(), EM_RoleValue_Register9, 0)				
					local SkillRND = Rand( 100 )+1	-- ���Ͷü�
					if SkillRND <= 100 and SkillRND > 67 then
						Weapon01 = CreateObjByFlag( 102875, 780485, 1, 1)
						Weapon02 = CreateObjByFlag( 102876, 780485, 2, 1)
						Weapon03 = CreateObjByFlag( 102877, 780485, 3, 1)
						--Weapon01 = CreateObj( 102875 , 1236 , 545 , 5022 , 90 , 1 )
						--Weapon02 = CreateObj( 102876 , 1236 , 545 , 5196 , 90 , 1 )
						--Weapon03 = CreateObj( 102877 , 1048 , 545 , 5104 , 90 , 1 )
						SetModeEx( Weapon01   , EM_SetModeType_Strikback, false )--����
						SetModeEx( Weapon01   , EM_SetModeType_Move, false )--����
						SetModeEx( Weapon01   , EM_SetModeType_Searchenemy, false )--����
						SetModeEX( Weapon01  , EM_SetModeType_Gravity , false )--���O
						AddToPartition( Weapon01 , RoomID )	--�[�i�R�x	
						WriteRoleValue( Weapon01 ,EM_RoleValue_PID, Boss)
						SetModeEx( Weapon02   , EM_SetModeType_Strikback, false )--����
						SetModeEx( Weapon02   , EM_SetModeType_Move, false )--����
						SetModeEx( Weapon02   , EM_SetModeType_Searchenemy, false )--����
						SetModeEX( Weapon02  , EM_SetModeType_Gravity , false )--���O	
						AddToPartition( Weapon02 , RoomID )	--�[�i�R�x	
						WriteRoleValue( Weapon02 ,EM_RoleValue_PID, Boss)
						SetModeEx( Weapon03   , EM_SetModeType_Strikback, false )--����
						SetModeEx( Weapon03   , EM_SetModeType_Move, false )--����
						SetModeEx( Weapon03   , EM_SetModeType_Searchenemy, false )--����
						SetModeEX( Weapon03  , EM_SetModeType_Gravity , false )--���O
						AddToPartition( Weapon03 , RoomID )	--�[�i�R�x	
						WriteRoleValue( Weapon03 ,EM_RoleValue_PID, Boss)
						Addbuff( Weapon01 , 504831 , 0 , -1 )	
						Addbuff( Weapon02 , 504831 , 0 , -1 )
						Addbuff( Weapon03 , 504831 , 0 , -1 )						
						SetPlot( Weapon01,"dead", "Lua_cang_banalloz_Weapon01_dead" ,0 )
						SetPlot( Weapon02,"dead", "Lua_cang_banalloz_Weapon02_dead" ,0 )
						SetPlot( Weapon03,"dead", "Lua_cang_banalloz_Weapon03_dead" ,0 )
						Weaponset = 1
					elseif SkillRND <= 67 and SkillRND > 34 then
						Weapon01 = CreateObjByFlag( 102875, 780485, 3, 1)
						Weapon02 = CreateObjByFlag( 102876, 780485, 1, 1)
						Weapon03 = CreateObjByFlag( 102877, 780485, 2, 1)
						--Weapon02 = CreateObj( 102875 , 1236 , 545 , 5022 , 90 , 1 )
						--Weapon03 = CreateObj( 102876 , 1236 , 545 , 5196 , 90 , 1 )
						--Weapon01 = CreateObj( 102877 , 1048 , 545 , 5104 , 90 , 1 )	
						SetModeEx( Weapon01   , EM_SetModeType_Strikback, false )--����
						SetModeEx( Weapon01   , EM_SetModeType_Move, false )--����
						SetModeEx( Weapon01   , EM_SetModeType_Searchenemy, false )--����
						SetModeEX( Weapon01   , EM_SetModeType_Gravity , false )--���O
						AddToPartition( Weapon01 , RoomID )	--�[�i�R�x	
						WriteRoleValue( Weapon01 ,EM_RoleValue_PID, Boss)
						SetModeEx( Weapon02   , EM_SetModeType_Strikback, false )--����
						SetModeEx( Weapon02   , EM_SetModeType_Move, false )--����
						SetModeEx( Weapon02   , EM_SetModeType_Searchenemy, false )--����
						SetModeEX( Weapon02  , EM_SetModeType_Gravity , false )--���O
						AddToPartition( Weapon02 , RoomID )	--�[�i�R�x	
						WriteRoleValue( Weapon02 ,EM_RoleValue_PID, Boss)
						SetModeEx( Weapon03   , EM_SetModeType_Strikback, false )--����
						SetModeEx( Weapon03   , EM_SetModeType_Move, false )--����
						SetModeEx( Weapon03   , EM_SetModeType_Searchenemy, false )--����
						SetModeEX( Weapon03   , EM_SetModeType_Gravity , false )--���O
						AddToPartition( Weapon03 , RoomID )	--�[�i�R�x	
						WriteRoleValue( Weapon03 ,EM_RoleValue_PID, Boss)	
						Addbuff( Weapon01 , 504831 , 0 , -1 )	
						Addbuff( Weapon02 , 504831 , 0 , -1 )
						Addbuff( Weapon03 , 504831 , 0 , -1 )						
						SetPlot( Weapon01,"dead", "Lua_cang_banalloz_Weapon01_dead" ,0 )
						SetPlot( Weapon02,"dead", "Lua_cang_banalloz_Weapon02_dead" ,0 )
						SetPlot( Weapon03,"dead", "Lua_cang_banalloz_Weapon03_dead" ,0 )
						Weaponset = 2
					elseif SkillRND <= 34 and SkillRND > 0 then
						Weapon01 = CreateObjByFlag( 102875, 780485, 2, 1)
						Weapon02 = CreateObjByFlag( 102876, 780485, 3, 1)
						Weapon03 = CreateObjByFlag( 102877, 780485, 1, 1)
						--Weapon03 = CreateObj( 102875 , 1236 , 545 , 5022 , 90 , 1 )
						--Weapon01 = CreateObj( 102876 , 1236 , 545 , 5196 , 90 , 1 )
						--Weapon02 = CreateObj( 102877 , 1048 , 545 , 5104 , 90 , 1 )
						SetModeEx( Weapon01   , EM_SetModeType_Strikback, false )--����
						SetModeEx( Weapon01   , EM_SetModeType_Move, false )--����
						SetModeEx( Weapon01   , EM_SetModeType_Searchenemy, false )--����
						SetModeEX( Weapon01  , EM_SetModeType_Gravity , false )--���O
						AddToPartition( Weapon01 , RoomID )	--�[�i�R�x	
						WriteRoleValue( Weapon01 ,EM_RoleValue_PID, Boss)
						SetModeEx( Weapon02   , EM_SetModeType_Strikback, false )--����
						SetModeEx( Weapon02   , EM_SetModeType_Move, false )--����
						SetModeEx( Weapon02   , EM_SetModeType_Searchenemy, false )--����
						SetModeEX( Weapon02  , EM_SetModeType_Gravity , false )--���O
						AddToPartition( Weapon02 , RoomID )	--�[�i�R�x	
						WriteRoleValue( Weapon02 ,EM_RoleValue_PID, Boss)
						SetModeEx( Weapon03   , EM_SetModeType_Strikback, false )--����
						SetModeEx( Weapon03   , EM_SetModeType_Move, false )--����
						SetModeEx( Weapon03   , EM_SetModeType_Searchenemy, false )--����
						SetModeEX( Weapon03   , EM_SetModeType_Gravity , false )--���O
						AddToPartition( Weapon03 , RoomID )	--�[�i�R�x	
						WriteRoleValue( Weapon03 ,EM_RoleValue_PID, Boss)
						Addbuff( Weapon01 , 504831 , 0 , -1 )	
						Addbuff( Weapon02 , 504831 , 0 , -1 )
						Addbuff( Weapon03 , 504831 , 0 , -1 )						
						SetPlot( Weapon01,"dead", "Lua_cang_banalloz_Weapon01_dead" ,0 )
						SetPlot( Weapon02,"dead", "Lua_cang_banalloz_Weapon02_dead" ,0 )
						SetPlot( Weapon03,"dead", "Lua_cang_banalloz_Weapon03_dead" ,0 )
						Weaponset = 3
					end
					countmode2 = 1
				end	
			elseif CheckBuff (Boss , Mode3 ) == true then
				Tornadomark = ReadRoleValue( OwnerID() , EM_RoleValue_Register6 )	
				W1 = ReadRoleValue( Boss ,EM_RoleValue_Register7)	
				W2 = ReadRoleValue( Boss ,EM_RoleValue_Register8)			
				W3 = ReadRoleValue( Boss ,EM_RoleValue_Register9)
				--�ˬd�T�Z��true or false
				--true ��Jtable rand�X�@�ӡA�����@BOSS
				--�R�����ͼC�F				
				Castime = Castime + 1
				if countmode3 == 0 then
					--Weapon = {}
					TimeMode1 = 0
					Weapon[1] = Weapon01	--�C
					Weapon[2] = Weapon02	--�l
					Weapon[3] = Weapon03	--��
					if W3 == 1 then
						table.remove (Weapon , 3)
					end	
					if W2 == 1 then
						table.remove (Weapon , 2)
					end		
					if W1 == 1 then--������Ĥ@��Z���^��
						table.remove (Weapon , 1)--�N�L�btable������
					end
					Weapon2 ={}
					for i = 1, table.getn(Weapon) do
						Weapon2[table.getn(Weapon2)+1] = Weapon[i]	--��o�ǤH��JUse2
					end						
					local RW = table.getn(Weapon2)--���ثetable�ثe�ƶq
					local Bossmod = Rand( RW )+1--���Ͷü�
					NowHP = ReadRoleValue( Boss , EM_RoleValue_HP )	--���o�{�b��q
					NowHP = NowHP + 1
					NowAttackTarget = ReadRoleValue( Boss , EM_RoleValue_AttackTargetID )
					if RW ~= 0 then
						if Weapon2[Bossmod] == Weapon01 then--��Z������C�A�������
							Sleep(10)
							Delobj(boss)
							Boss = CreateObj( 102872 , NowX , NowY , NowZ , NowDir , 1 )
							AddToPartition( Boss , RoomID)
							WriteRoleValue( Boss , EM_RoleValue_HP , NowHP)	--�g�J
							WriteRoleValue( OwnerID(), EM_RoleValue_Register1, Boss)
							WriteRoleValue( Boss , EM_RoleValue_PID , OwnerID())
							SetPlot( Boss,"dead", "Lua_cang_banalloz_Boss_dead" ,0 )
							SetAttack( Boss , NowAttackTarget )
							SysCastSpellLV( NowAttackTarget, Boss, 494659, 1)
							AddBuff( Boss , 504827 , 0 , -1 )
							BeginPlot( Boss , "Lua_cang_banalloz_skill_M3" , 20)
							ScriptMessage( Boss , -1 , 2 ,  "[SC_102721_10]", 1 )
							while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID ) ~= 0   do
							sleep(3)
							end
							CastSpellLV(Boss, Boss, 494482 , 1 )
							Sleep(30)							
							BossM3 = 1
						elseif Weapon2[Bossmod] == Weapon02 then--��Z������l�A�������
							Sleep(10)						
							Delobj(boss)
							Boss = CreateObj( 102873 , NowX , NowY , NowZ , NowDir , 1 )
							AddToPartition( Boss , RoomID)
							WriteRoleValue( Boss , EM_RoleValue_HP , NowHP)	--�g�J
							WriteRoleValue( OwnerID(), EM_RoleValue_Register1, Boss)
							WriteRoleValue( Boss , EM_RoleValue_PID , OwnerID())	
							SetPlot( Boss,"dead", "Lua_cang_banalloz_Boss_dead" ,0 )
							SetAttack( Boss , NowAttackTarget )
							SysCastSpellLV( NowAttackTarget, Boss, 494659, 1)
							AddBuff( Boss , 504829 , 0 , -1 )
							BeginPlot( Boss , "Lua_cang_banalloz_skill_M3" , 20)
							ScriptMessage( Boss , -1 , 2 ,  "[SC_102721_12]", 1 )
							while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID ) ~= 0   do
							sleep(3)
							end							
							CastSpellLV(Boss, Boss, 494482 , 1 )
							Sleep(30)							
							BossM3 = 2
						elseif Weapon2[Bossmod] == Weapon03 then--��Z�������A�������
							Sleep(10)						
							Delobj(boss)
							Boss = CreateObj( 102874 , NowX , NowY , NowZ , NowDir , 1 )
							AddToPartition( Boss , RoomID)
							WriteRoleValue( Boss , EM_RoleValue_HP , NowHP)	--�g�J
							WriteRoleValue( OwnerID(), EM_RoleValue_Register1, Boss)
							WriteRoleValue( Boss , EM_RoleValue_PID , OwnerID())
							SetPlot( Boss,"dead", "Lua_cang_banalloz_Boss_dead" ,0 )
							SetAttack( Boss , NowAttackTarget )
							SysCastSpellLV( NowAttackTarget, Boss, 494659, 1)
							AddBuff( Boss , 504828 , 0 , -1 )
							BeginPlot( Boss , "Lua_cang_banalloz_skill_M3" , 20)
							ScriptMessage( Boss , -1 , 2 ,  "[SC_102721_11]", 1 )
							while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID ) ~= 0   do
							sleep(3)
							end							
							CastSpellLV(Boss, Boss, 494482 , 1 )
							Sleep(30)							
							BossM3 = 3
						end
					elseif RW == 0 then 	--�p�G�Z�����Q����
						Delobj(boss)
						Boss = CreateObj( 102872 , NowX , NowY , NowZ , NowDir , 1 )
						AddToPartition( Boss , RoomID)
						WriteRoleValue( Boss , EM_RoleValue_HP , NowHP)	--�g�J
						WriteRoleValue( OwnerID(), EM_RoleValue_Register1, Boss)
						WriteRoleValue( Boss , EM_RoleValue_PID , OwnerID())
						SetPlot( Boss,"dead", "Lua_cang_banalloz_Boss_dead" ,0 )
						SetAttack( Boss , NowAttackTarget )
						AddBuff( Boss , 504827 , 0 , -1 )
						BeginPlot( Boss , "Lua_cang_banalloz_skill_M3" , 20)
						ScriptMessage( Boss , -1 , 2 ,  SkillSay[6], 1 )
						BossM3 = 1					
					end
					local TempPlayer = SetSearchAllPlayer(ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)) --���{�b�ӰϤ����Ҧ����a
					local ThesePlayer = {}
					local sway = {}
					for i=1,TempPlayer do
						ThesePlayer[i] = GetSearchResult() -- ���Ȧs��
						if CheckID( ThesePlayer[i] ) == true and ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then--�ˬd���a�O���O�٦b�F�ˬd�O�_���`
							sway[table.getn(sway)+1] = ThesePlayer[i]	--��JUseful�̭� 
						end					
					end	
					if W1 == 0 then--�C�F
						anyone = Rand(table.getn(sway))+1	--rand 
						WHP = ReadRoleValue( Weapon01 , EM_RoleValue_HP )
						WHP = WHP + 1	
						DelObj( Weapon01 )
						if Weaponset == 1 then
							WeaponSoul01 = CreateObjByFlag( 102878, 780485, 1, 1)
						elseif Weaponset == 2 then
							WeaponSoul01 = CreateObjByFlag( 102878, 780485, 1, 1)
						elseif Weaponset == 3 then
							WeaponSoul01 = CreateObjByFlag( 102878, 780485, 1, 1)
						end
						AddToPartition( WeaponSoul01 , RoomID )	--�[�i�R�x
						WriteRoleValue( WeaponSoul01 , EM_RoleValue_HP , WHP)
						SysCastSpellLV( sway[anyone], WeaponSoul01, 494484, 1)
						SetAttack(WeaponSoul01, sway[anyone] )	--rand�X�Ӫ��H�J��
						WriteRoleValue( WeaponSoul01 ,EM_RoleValue_PID, Boss)
						BeginPlot( WeaponSoul01, "Lua_cang_banalloz_W1" , 20)
					end
					if W2 == 0 then--�l�F
						anyone = Rand(table.getn(sway))+1 	--rand	
						WHP = ReadRoleValue( Weapon02 , EM_RoleValue_HP )
						WHP = WHP + 1
						DelObj( Weapon02 )	
						if Weaponset == 1 then
							WeaponSoul02 = CreateObjByFlag( 102879, 780485, 2, 1)
						elseif Weaponset == 2 then
							WeaponSoul02 = CreateObjByFlag( 102879, 780485, 3, 1)
						elseif Weaponset == 3 then
							WeaponSoul02 = CreateObjByFlag( 102879, 780485, 1, 1)
						end
						AddToPartition( WeaponSoul02 , RoomID )	--�[�i�R�x
						WriteRoleValue( WeaponSoul02 , EM_RoleValue_HP , WHP)
						SysCastSpellLV( sway[anyone], WeaponSoul02, 494484, 1)
						SetAttack(WeaponSoul02, sway[anyone] )	--rand�X�Ӫ��H�J��		
						WriteRoleValue( WeaponSoul02 ,EM_RoleValue_PID, Boss)
						BeginPlot( WeaponSoul02, "Lua_cang_banalloz_W2" , 20)
					end
					if W3 == 0 then--���F
						anyone = Rand(table.getn(sway))+1 	--rand
						WHP = ReadRoleValue( Weapon03 , EM_RoleValue_HP )
						WHP = WHP + 1
						DelObj( Weapon03 )
						if Weaponset == 1 then
							WeaponSoul03 = CreateObjByFlag( 102880, 780485, 3, 1)
						elseif Weaponset == 2 then
							WeaponSoul03 = CreateObjByFlag( 102880, 780485, 1, 1)
						elseif Weaponset == 3 then
							WeaponSoul03 = CreateObjByFlag( 102880, 780485, 2, 1)
						end						
						AddToPartition( WeaponSoul03 , RoomID )	--�[�i�R�x
						WriteRoleValue( WeaponSoul03 , EM_RoleValue_HP , WHP)
						SysCastSpellLV( sway[anyone], WeaponSoul03, 494484, 1)
						SetAttack(WeaponSoul03, sway[anyone] )	--rand�X�Ӫ��H�J��
						WriteRoleValue( WeaponSoul03 ,EM_RoleValue_PID, Boss)
						BeginPlot( WeaponSoul03, "Lua_cang_banalloz_W3" , 20)
					end					
				end			
				if Castime == 5 then--�s�����Ұ�					
					local TempPlayer = SetSearchAllPlayer(ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)) --���{�b�ӰϤ����Ҧ����a
					local ThesePlayer = {}	
					local sway = {}
					for i=1,TempPlayer do
						ThesePlayer[i] = GetSearchResult() -- ���Ȧs��
						if CheckID( ThesePlayer[i] ) == true and 
						ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and 
						ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then
						--�ˬd���a�O���O�٦b�F�ˬd�O�_���`
							if  ThesePlayer[i] ~= AttackTarget then
								sway[table.getn(sway)+1] = ThesePlayer[i]	
							end--��JUseful�̭� 
						end					
					end	
					if table.getn(sway) ~= 0 then	
						local anyone = Rand(table.getn(sway))+1	--rand
						local PX = ReadRoleValue( sway[anyone] , EM_RoleValue_X )
						local PY = ReadRoleValue( sway[anyone] , EM_RoleValue_Y )
						local PZ = ReadRoleValue( sway[anyone] , EM_RoleValue_Z )
						PDir = ReadRoleValue( sway[anyone] , EM_RoleValue_Dir )	
						Tornado = CreateObj( 102909 , PX , PY , PZ , PDir , 1 )
						SetModeEx( Tornado , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
						SetModeEx( Tornado , EM_SetModeType_Mark, false )--�аO
						SetModeEx( Tornado , EM_SetModeType_ShowRoleHead, false )--�Y����
						SetModeEx( Tornado , EM_SetModeType_HideName, false )--�W��			
						AddToPartition( Tornado , RoomID )	--�[�i�R�x
						AddBuff( Tornado , 504830 , 0, -1 )
						WriteRoleValue( Boss , EM_RoleValue_Register2 , Tornado)
						WriteRoleValue( Tornado	, EM_RoleValue_Register2 , Boss)
						WriteRoleValue( Tornado	, EM_RoleValue_Register1 , OwnerID())
						WriteRoleValue( Tornado , EM_RoleValue_Livetime, 20 )--�s�b�ɶ�
						Addbuff( Tornado , 505085 , 1 , -1 )
						SysCastSpellLV( sway[anyone], Tornado, 494659, 1)
						SetAttack(Tornado, sway[anyone] )	--rand�X�Ӫ��H�J��
						SetModeEx(Tornado , EM_SetModeType_Fight , false )--�i�������
					elseif table.getn(sway) == 0 then
						local PX = ReadRoleValue( AttackTarget , EM_RoleValue_X )
						local PY = ReadRoleValue( AttackTarget , EM_RoleValue_Y )
						local PZ = ReadRoleValue( AttackTarget , EM_RoleValue_Z )
						local PDir = ReadRoleValue( AttackTarget , EM_RoleValue_Dir )	
						Tornado = CreateObj( 102909 , PX , PY , PZ , PDir , 1 )
						SetModeEx( Tornado , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
						SetModeEx( Tornado , EM_SetModeType_Mark, false )--�аO
						SetModeEx( Tornado , EM_SetModeType_ShowRoleHead, false )--�Y����
						SetModeEx( Tornado , EM_SetModeType_HideName, false )--�W��			
						AddToPartition( Tornado , RoomID )	--�[�i�R�x
						AddBuff( Tornado , 504830 , 0, -1 )
						WriteRoleValue( Boss , EM_RoleValue_Register2 , Tornado)
						WriteRoleValue( Tornado	, EM_RoleValue_Register2 , Boss)
						WriteRoleValue( Tornado	, EM_RoleValue_Register1 , OwnerID())
						WriteRoleValue( Tornado , EM_RoleValue_Livetime, 20 )--�s�b�ɶ�
						Addbuff( Tornado , 505085 , 1 , -1 )						
						SysCastSpellLV( AttackTarget, Tornado, 494659, 1)
						SetAttack(Tornado, AttackTarget )	--rand�X�Ӫ��H�J��
						SetModeEx(Tornado , EM_SetModeType_Fight , false )--�i�������
					end
				end	
				if Tornadomark == 1 then
					NowHP = ReadRoleValue( Boss , EM_RoleValue_HP )	--���o�{�b��q
					NowHP = NowHP + 1
					NowAttackTarget = ReadRoleValue( Boss , EM_RoleValue_AttackTargetID )
					if BossM3 == 1 then
						DelObj( Boss )
						Boss = CreateObj( 102872 , NowX , NowY , NowZ , NowDir , 1 )
						WriteRoleValue( Boss , EM_RoleValue_HP , NowHP)	--�g�J
						WriteRoleValue( OwnerID(), EM_RoleValue_Register1, Boss)
						WriteRoleValue( Boss , EM_RoleValue_PID , OwnerID())
						AddToPartition( Boss , RoomID )
						SetPlot( Boss,"dead", "Lua_cang_banalloz_Boss_dead" ,0 )
						SetAttack( Boss , NowAttackTarget )
						SysCastSpellLV( NowAttackTarget, Boss, 494659, 1)
						AddBuff( Boss , 504827 , 0 , -1 )
						BeginPlot( Boss , "Lua_cang_banalloz_skill_M3" , 20)
						WriteRoleValue( OwnerID(), EM_RoleValue_Register6, 0)
					end						
					if BossM3 == 2 then
						DelObj( Boss )
						Boss = CreateObj( 102873 , NowX , NowY , NowZ , NowDir , 1 )
						WriteRoleValue( Boss , EM_RoleValue_HP , NowHP)	--�g�J
						WriteRoleValue( OwnerID(), EM_RoleValue_Register1, Boss)
						WriteRoleValue( Boss , EM_RoleValue_PID , OwnerID())
						AddToPartition( Boss , RoomID )
						SetPlot( Boss,"dead", "Lua_cang_banalloz_Boss_dead" ,0 )
						SetAttack( Boss , NowAttackTarget )
						SysCastSpellLV( NowAttackTarget, Boss, 494659, 1)
						AddBuff( Boss , 504828 , 0 , -1 )
						BeginPlot( Boss , "Lua_cang_banalloz_skill_M3" , 20)
						WriteRoleValue( OwnerID(), EM_RoleValue_Register6, 0)
					end
					if BossM3 == 3 then
						DelObj( Boss )
						Boss = CreateObj( 102874 , NowX , NowY , NowZ , NowDir , 1 )
						WriteRoleValue( Boss , EM_RoleValue_HP , NowHP)	--�g�J
						WriteRoleValue( OwnerID(), EM_RoleValue_Register1, Boss)
						WriteRoleValue( Boss , EM_RoleValue_PID , OwnerID())
						AddToPartition( Boss , RoomID )
						SetPlot( Boss,"dead", "Lua_cang_banalloz_Boss_dead" ,0 )
						SetAttack( Boss , NowAttackTarget )
						SysCastSpellLV( NowAttackTarget, Boss, 494659, 1)
						AddBuff( Boss , 504829 , 0 , -1 )
						BeginPlot( Boss , "Lua_cang_banalloz_skill_M3" , 20)
						WriteRoleValue( OwnerID(), EM_RoleValue_Register6, 0)
					end
				end		
				countmode3 = 1			
			end
		end
		--���m���q
		reset = ReadRoleValue( OwnerID() , EM_RoleValue_Register4 )			
		if reset == 1 then 	
			Boss = ReadRoleValue( OwnerID() , EM_RoleValue_Register1 )
			Dead = ReadRoleValue( OwnerID() , EM_RoleValue_Register5 )
			if fight == 1 then
				BeginPlot(Door , "Lua_cang_banalloz_door_close", 0)
				sleep(50)
				DelObj(Boss)
				DelObj(Door)
				if countmode2 == 1 then
					DelObj(Weapon01)
					DelObj(Weapon02)
					DelObj(Weapon03)
				end
				WriteRoleValue( OwnerID(), EM_RoleValue_Register1, 0)			
				WriteRoleValue( OwnerID(), EM_RoleValue_Register2, 0)			
				WriteRoleValue( OwnerID(), EM_RoleValue_Register3, 0)			
				WriteRoleValue( OwnerID(), EM_RoleValue_Register4, 0)			
				WriteRoleValue( OwnerID(), EM_RoleValue_Register5, 0)			
				WriteRoleValue( OwnerID(), EM_RoleValue_Register6, 0)			
				WriteRoleValue( OwnerID(), EM_RoleValue_Register7, 0)
				WriteRoleValue( OwnerID(), EM_RoleValue_Register8, 0)
				WriteRoleValue( OwnerID(), EM_RoleValue_Register9, 0)
				if Dead == 0 then
					BeginPlot( OwnerID(), "Lua_cang_banalloz_reopen", 10 )
				end
			end
		end
		--���`���q
		if Dead == 1 then
			if countmode2 == 1 then
				DelObj(Weapon01)
				DelObj(Weapon02)
				DelObj(Weapon03)
			end
		end	
	end	
end			
							
function Lua_cang_banalloz_Weapon01_dead() --�C���`�^��
	local Boss = ReadRoleValue( OwnerID() ,EM_RoleValue_PID)
	WriteRoleValue( Boss , EM_RoleValue_Register7 , 1)	--�g�JPID
	Hide(OwnerID())
end

function Lua_cang_banalloz_Weapon02_dead() --�l���`�^��
	local Boss = ReadRoleValue( OwnerID() ,EM_RoleValue_PID)
	WriteRoleValue( Boss , EM_RoleValue_Register8 , 1)	--�g�JPID
	Hide(OwnerID())
end

function Lua_cang_banalloz_Weapon03_dead() --�򦺤`�^��
	local Boss = ReadRoleValue( OwnerID() ,EM_RoleValue_PID)
	WriteRoleValue( Boss , EM_RoleValue_Register9 , 1)	--�g�JPID
	Hide(OwnerID())	
end

function Lua_cang_banalloz_reopen() --���m
	local opener = CreateObjByFlag( 104164, 780485, 5, 1)	--�۴�
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)--
	local Door = ReadRoleValue(OwnerID(),EM_RoleValue_Register3)--���y�W����	
	SetModeEx( opener   , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( opener   , EM_SetModeType_Strikback, false )--����
	SetModeEx( opener   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( opener   , EM_SetModeType_Mark, false )--�аO
	SetModeEx( opener   , EM_SetModeType_Move, false )--����
	SetModeEx( opener   , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( opener   , EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( opener   , EM_SetModeType_HideName, false )--�W��
	AddToPartition( opener , RoomID )	--�[�i�R�x
	BeginPlot( opener, "Lua_cang_banalloz_restart" , 10)
	DelObj(Door)
	DelObj(OwnerID())
end

function Lua_cang_banalloz_Tornado()--Ĳ�o�s��������
	local Boss = ReadRoleValue( OwnerID() , EM_RoleValue_Register2 )
	local close = ReadRoleValue( OwnerID() , EM_RoleValue_Register1 )
	while true do
		sleep(10)
		if GetDistance( OwnerID(), Boss ) <= 50 then
			WriteRoleValue( close ,EM_RoleValue_Register6, 1)
			sleep(10)	
			DelObj(OwnerID())
		end	
	end
end

function Lua_cang_banalloz_Show()	
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)		
	--local show1 = CreateObj( 102881 , 1236 , 530 , 5022 , 90 , 1 )
	--local show2 = CreateObj( 102881 , 1236 , 530 , 5196 , 90 , 1 )
	--local show3 = CreateObj( 102881 , 1048 , 530 , 5104 , 90 , 1 )
	local show1 = CreateObjByFlag( 102881, 780485, 1, 1)
	local show2 = CreateObjByFlag( 102881, 780485, 2, 1)
	local show3 = CreateObjByFlag( 102881, 780485, 3, 1)
	SetModeEX( show1  , EM_SetModeType_Gravity , false )--���O
	SetModeEx( show1  , EM_SetModeType_ShowRoleHead, false )--���q�Y����
	SetModeEx( show1  , EM_SetModeType_Mark, false )--�аO
	SetModeEx( show1  , EM_SetModeType_Move, false )--����
	SetModeEx( show1  , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( show1   , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( show1  , EM_SetModeType_Strikback, false )--����				
	AddToPartition( show1 , RoomID )											
	SetModeEX( show2  , EM_SetModeType_Gravity , false )--���O
	SetModeEx( show2  , EM_SetModeType_ShowRoleHead, false )--���q�Y����
	SetModeEx( show2  , EM_SetModeType_Mark, false )--�аO
	SetModeEx( show2  , EM_SetModeType_Move, false )--����
	SetModeEx( show2  , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( show2   , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( show2   , EM_SetModeType_Strikback, false )--����				
	AddToPartition( show2 , RoomID )											
	SetModeEX( show3  , EM_SetModeType_Gravity , false )--���O
	SetModeEx( show3  , EM_SetModeType_ShowRoleHead, false )--���q�Y����
	SetModeEx( show3  , EM_SetModeType_Mark, false )--�аO
	SetModeEx( show3  , EM_SetModeType_Move, false )--����
	SetModeEx( show3  , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( show3   , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( show3   , EM_SetModeType_Strikback, false )--����	
	AddToPartition( show3 , RoomID )	
	CastSpellLV(show1, show1, 494318 , 1 )								
	CastSpellLV(show2, show2, 494318 , 1 )
	CastSpellLV(show3, show3, 494318 , 1 )	
	WriteRoleValue(show1, EM_RoleValue_Livetime,15)
	WriteRoleValue(show2, EM_RoleValue_Livetime,15)
	WriteRoleValue(show3, EM_RoleValue_Livetime,15)
end