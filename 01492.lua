
function Lua_cang_mode_check()	---------------------�ˬdBoss�B����ӼҦ�
	local Mode1 = 504069	--���q1
	local Mode2 = 504070	--���q2
	if CheckBuff(OwnerID() , Mode1)	== true  then	--�p�G�b���q1
		CancelBuff( OwnerID() , Mode1 )		--�R��1
		AddBuff( OwnerID() , Mode2 , 0 , -1 )	--�i�J2
	elseif CheckBuff(OwnerID() , Mode2) == true then	--�p�G�b���q2
		CancelBuff( OwnerID() , Mode2 )		--�R��2
		AddBuff( OwnerID() , Mode1 , 0 , -1 )	--�i�J1	
	end
end

function Lua_cang_BossAi_Sword()

	while true do
		sleep(10)
		local Check_pet = 0  ---�P�_�d���i�J�԰���
		local Mode1 = 504069	--���q1
		local Mode2 = 504070	--���q2
		local ModeCheck = 504067	--�Ҧ��ˬd
		
		local CheckTime = 10
		local SkillDelay = { 2, 2, 2, 2, 2, 2, 2, 2}	-- �ޯੵ��ɶ�
		--�C�R,��������,�۶H�۴�,��q����,�q�����E,�P�K���C,�ȦB���C,�p�^���C
		local SkillID = {493734,493735,493746,493737,493742,493743,493744,493745}	-- �ۦ�ID	
		--1�C�R,2��������,3�۶H�۴�,4��q����,5�q�����E,6�P�K���C,7�ȦB���C,8�p�^���C
		local SkillLV = {5, 2, 1, 1, 1, 180 , 170 , 170}	--�ޯ൥��
		--�C�R,��������,�۶H�۴�,��q����,�q�����E,�P�K���C,�ȦB���C,�p�^���C
		local SkillSay = { "[SC_102421_1]", "[SC_102421_2]", "[SC_102421_3]", "[SC_102421_9]" , "[SC_102421_10]" , "[SC_102421_6]" , "[SC_102421_7]" , "[SC_102421_8]" , "[SC_102421_4]"}	-- �ۦ�����
		--�o��...�N�O�J�I�̪��X��...
		--��Q���������������I
		--�P����������a...
		--���J�I��...�ݬݯu�����O�q�a�I
		--��...��...�A�̦A�]�S�����|���}�o...
		--�|�|�Ӧۦa�������K�C
		--�g���O�@���o�c���}�ݡA���!
		--�����ѧڦu�@�C
		--���`�������J�I�̦Ӷ}�C
		
		local HP25 = 0	--25%�i�J�g�㶥�q
		local HP5 = 0	--5%�i�J�ɫ㶥�q
		local MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )	--Ū����q

		local SkillA = 0	--�ޯ�p�ɾ�
		local SkillB = 0	--
		local SkillC = 0	--
		local CombatBegin = 0	--�}���O��
		local CombatBegin1 = 0
		local Count1 = 1	--���k���ͭp��
		local Count2 = 0	--���k�R���p��
		local Count3 = 0	--��t�}��
		
		local Temp1, Temp2 --���k��
		local Temp3, Temp4 --��t�@��	
		local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)	--��ROOMID
		local PPL
		local Door
		
		--�Ұʦ��`�@��
		SetPlot( OwnerID() , "dead" , "Lua_cang_BossAi_SwordDead" , 1000 )
		
		--�إ̫᪺߳��
		local Door0 = CreateObjByFlag( 103577 , 780420 , 9 , 1 )
		SetModeEX( Door0  , EM_SetModeType_Gravity , false )--���O
		SetModeEx( Door0  , EM_SetModeType_ShowRoleHead, false )--���q�Y����
		SetModeEx( Door0  , EM_SetModeType_Obstruct, true )--����
		SetModeEx( Door0  , EM_SetModeType_Mark, false )--�аO
		
		AddToPartition( Door0 , RoomID )
		Hide( Door0 )
		Show( Door0 , RoomID )		
		WriteRoleValue( OwnerID() ,EM_RoleValue_Register1, Door0)						
		
		while true do
		sleep(10)
			
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
			if (  AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- �ˬd�O�_���}�԰�		
				
				if ReadRoleValue(AttackTarget,EM_RoleValue_IsPlayer) ~= 1 and Check_pet == 0 then ---�p�G�O�D���a�i�J�԰�
					local Pet_owner = ReadRoleValue( AttackTarget ,EM_RoleValue_OwnerGUID )
					SetPosByFlag( Pet_owner , 780430 , 0 )
					Check_pet = 1
				end
				
				--�Ұʪ��ת�
				if CombatBegin1 == 0 then
					ScriptMessage( OwnerID() , -1 , 2 ,  SkillSay[9], 1 )	--���`�������J�I�̦Ӷ}
					Say( OwnerID() , SkillSay[9] )	--���`����
					PPL = SetSearchAllPlayer(RoomID)
					local ID = {}
					for i = 1 , PPL , 1 do ---�⪱�a��J�ж��� 
						ID[i] = GetSearchResult() -- ���Ȧs��
						if ReadRoleValue( ID[i] , EM_RoleValue_IsDead ) ~= 1 and 
						GetDistance( ID[i] , OwnerID() ) > 250 and 
--						GetDistance( ID[i] , OwnerID() ) < 1000 and 
						ReadRoleValue( ID[i], EM_RoleValue_VOC) ~= 0 and 
						ReadRoleValue( ID[i] , EM_RoleValue_RoomID  ) == RoomID then
							SetPosByFlag( ID[i] , 780430 , 0 ) --�Ԩ�X�Ц�l
						end
					end	
					
					Door = CreateObjByFlag( 102642 , 780420 , 10 , 1 )
					SetModeEx( Door   , EM_SetModeType_Move, false )--����
					SetModeEx( Door   , EM_SetModeType_Fight , false )--���i�������
					SetModeEx( Door   , EM_SetModeType_Strikback, false )--����
					SetModeEx( Door   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
					SetModeEx( Door   , EM_SetModeType_Mark, false )--�аO
					SetModeEx( Door   , EM_SetModeType_Obstruct, true )--����	
					SetModeEx( Door   , EM_SetModeType_ShowRoleHead, false )--���q�Y����
					SetModeEx( Door   , EM_SetModeType_Searchenemy , false )	------������			
					AddToPartition( Door , RoomID )
					Hide( Door )
					Show( Door , RoomID )
					WriteRoleValue( Door ,EM_RoleValue_PID, OwnerID())						
					WriteRoleValue( OwnerID() ,EM_RoleValue_Register3, Door)						
					BeginPlot(Door , "Lua_cang_BossAi_SwordCraze",0)
					CombatBegin1 = 1
				end	
				local SkillRND =  Rand( 100 )+1	-- ���Ͷü�
				local SkillShow = 0
				local BossTarget = AttackTarget
				
				local NowHP = ReadRoleValue(  OwnerID() , EM_RoleValue_HP )
				local HPPercent = NowHP / MaxHP	--��q�ʤ���
				SkillA = SkillA + 1
				SkillB = SkillB + 1
				SkillC = SkillC + 1
				
				local TempPlayer = Lua_HateListPos( 2 )	--�N����Ƨ� ���X�e�G��
				if table.getn(TempPlayer) >= 2 then	--�p�G����W�L��H
					HLI2 = HateListInfo(OwnerID() , TempPlayer[2] , EM_HateListInfoType_GItemID )	--�b������ĤG��
					if GetDistance( OwnerID(), HateListInfo(OwnerID(), TempPlayer[2], EM_HateListInfoType_GItemID) ) > 100 then	--�ĤG����Z���j��50 ���D�Z
						HLI2 = AttackTarget
					end
				elseif table.getn(TempPlayer) < 2 then	--�p�G�֩��ӤH
					HLI2 = AttackTarget	--����e��H
				end

				if CombatBegin == 0 then	--�}���@��
					AddBuff( OwnerID() , ModeCheck , 0 , -1 )	--�WBoss�Ҧ��ˬdBuff
					AddBuff( OwnerID() , Mode1 , 0 , -1 )	--mode1  
					CombatBegin = 1
				end	
								
				if CheckBuff( OwnerID() , Mode2) == false and Count2 == 1 then  --�p�G���O�b�ĤG���q�B�p�ƾ��Q�Ұ�
					DelObj(Temp1)
					DelObj(Temp2)
					Count2 = 0
				end
				
				if ( HPPercent <= 0.25 ) then	--�ĤT���q�P�w�u�� 25�w��q
					if ( HP25 == 0 ) then
						CancelBuff( OwnerID() , Mode1 )		--�R��1
						CancelBuff( OwnerID() , Mode2 )		--�R��2
						CancelBuff( OwnerID() , ModeCheck )	--�R���Ҧ��ˬd
						ScriptMessage( OwnerID() , -1 , 2 ,  SkillSay[4], 1 )	--�J�I��...�ݬݯu�����O�q�a�I
						Say( OwnerID() , SkillSay[4] )	--�J�I��...�ݬݯu�����O�q�a�I
						Addbuff(OwnerID(), 504061, 1, -1 )	--�g��
						HP25 = 1
						if Count3 == 0 then
							Temp3 = CreateObj( 102412,-399.4, 1700.6, -1334, 90.4 , 1)
							SetModeEx( Temp3 , EM_SetModeType_Gravity, false) 
							SetModeEx( Temp3 , EM_SetModeType_Move, false )		--���|����
							AddToPartition( Temp3 , RoomID )					--�[�J�R�x
							Sleep(10)
							Temp4 = CreateObj(102413,-87.3, 1488, -1341.5, 90.4, 1)
							SetModeEx( Temp4 , EM_SetModeType_Gravity, false) 
							SetModeEx( Temp4 , EM_SetModeType_Move, false )		--���|����
							AddToPartition( Temp4 , RoomID )					--�[�J�R�x
							Sleep(10)
							CastSpellLV( OwnerID() , OwnerID() , 493820,1)	--��t�l��
							CastSpellLV( Temp3, OwnerID() , 493819 ,1)		--��t����
							CastSpellLV( Temp4, OwnerID() , 493819 ,1)		--��t����
							Count3 = 1
							Sleep(80)
							DelObj(Temp3)
							DelObj(Temp4)
						end
					end
					if SkillC >= 10 then					
						if SkillRND <= 100 and SkillRND > 70 then 
							SkillShow = 6	--6�P�K���C
							BossTarget = HLI2	-- ���ĤG�ؼ�
						elseif SkillRND <= 70 and SkillRND > 35 then
							SkillShow = 7	--7�ȦB���C				
							BossTarget = AttackTarget	-- ���ؼ�	
						elseif SkillRND <= 35 and SkillRND > 0 then 
							SkillShow = 8 	--8�p�^���C
							BossTarget = HLI2	-- ���ĤG�ؼ�
						end
						SkillC = 0
						ScriptMessage( OwnerID() , -1 , 2 ,  SkillSay[SkillShow], 1 )
						CastSpellLV( OwnerID() , BossTarget , SkillID[SkillShow] , SkillLV[SkillShow] )
						Sleep( SkillDelay[SkillShow] * CheckTime )	
						SkillShow = 0	
					end

					if ( HPPercent <= 0.05 ) then	--�g�㶥�q�ޯ�
						if ( HP5 == 0 ) then
							ScriptMessage( OwnerID() , -1 , 2 , "[SC_102421_10]", 1 )	--��....��....
							Say( OwnerID() , "[SC_102421_10]" )	--��....��....
							Addbuff( OwnerID(),	504062, 1, -1)
							HP5 = 1
						end	
					end	
				end
				
				if CheckBuff(OwnerID() , Mode1) == true then	--mode1 �C�����q
					if SkillA >= 7 then
						if SkillRND <= 100 and SkillRND > 75 then 
							SkillShow = 1	--�C�R
							BossTarget = OwnerID()
						elseif SkillRND <= 75 and SkillRND > 50 then 
							SkillShow = 2	--��������
							BossTarget = HLI2	--���ĤG����
						elseif SkillRND <= 50 and SkillRND > 25 then 
							SkillShow = 1	--�C�R
							BossTarget = OwnerID()
						elseif SkillRND <= 25 and SkillRND > 0 then 
							SkillShow = 2	--��������
							BossTarget = HLI2	--���ĤG����
						end
						SkillA = 0	
						ScriptMessage( OwnerID() , -1 , 2 , SkillSay[SkillShow], 10 )	
						CastSpellLV( OwnerID() , BossTarget , SkillID[SkillShow] , SkillLV[SkillShow] )
						Sleep( SkillDelay[SkillShow] * CheckTime )	
						SkillShow = 0	
					end	
					if SkillC >= 15 then
						ScriptMessage( OwnerID() , -1 , 2 ,  SkillSay[3], 1 )
						Say( OwnerID() , SkillSay[3] )
						if  GetDistance( Door , OwnerID() ) >= 430 then
							BeginPlot(OwnerID(),"Lua_cang_BossAi_SwordSkillA1",0)	--����
						elseif  GetDistance( Door , OwnerID() ) < 430 then
							BeginPlot(OwnerID(),"Lua_cang_BossAi_SwordSkillA2",0)	--����
						end	
						SkillC = 0
					end
					Count1 = 0
				end	
				
				if CheckBuff (OwnerID() , Mode2) == true then	--mode2 ��q���q
					if Count1 == 0 then
						Temp1 = CreateObj( 102412,-399.4, 1700.6, -1334, 90.4 , 1)
						SetModeEx( Temp1 , EM_SetModeType_Gravity, false) 						
						SetModeEx( Temp1 , EM_SetModeType_Move, false )		--���|����
						AddToPartition( Temp1 , RoomID )					--�[�J�R�x
						Addbuff( Temp1, 503704, 1 , -1)						--������
						BeginPlot(Temp1,"Lua_cang_BossAi_Swordleft",0)		--�g�J����AI
						WriteRoleValue( Temp1 ,EM_RoleValue_PID, OwnerID())	--�g�JPID						
						sleep(10)

						Temp2 = CreateObj(102413,-87.3, 1488, -1341.5, 90.4, 1)
						SetModeEx( Temp2 , EM_SetModeType_Gravity, false) 
						SetModeEx( Temp2 , EM_SetModeType_Move, false )		--���|����
						AddToPartition( Temp2 , RoomID )					--�[�J�R�x
						Addbuff( Temp2, 503704, 1 , -1)						--������
						BeginPlot(Temp2,"Lua_cang_BossAi_Swordright",0)		--�g�J�k��AI
						WriteRoleValue( Temp2 ,EM_RoleValue_PID, OwnerID())	--�g�JPID
						sleep(10)
						Count1 = 1
						Count2 = 1
					end	
					if SkillB >= 7 then
						if SkillRND <= 100 and SkillRND > 75 then 
							SkillShow = 1	--�C�R
							BossTarget = OwnerID()
						elseif SkillRND <= 75 and SkillRND > 50 then 
							SkillShow = 2	--��������
							BossTarget = HLI2	--���ĤG����
						elseif SkillRND <= 50 and SkillRND > 25 then 
							SkillShow = 1	--�C�R
							BossTarget = OwnerID()
						elseif SkillRND <= 25 and SkillRND > 0 then 
							SkillShow = 2	--��������
							BossTarget = HLI2	--���ĤG����
						end
						SkillB = 0	
						ScriptMessage( OwnerID() , -1 , 2 ,  SkillSay[SkillShow], 1 )
						CastSpellLV( OwnerID() , BossTarget , SkillID[SkillShow] , SkillLV[SkillShow] )
						Sleep( SkillDelay[SkillShow] * CheckTime )	
						SkillShow = 0	
					end
				end	
			else
				if CombatBegin1 == 1 then
					SetPosByFlag( OwnerID(), 780420 , 11 )
					Delobj(Door)
					--�R������(�O�I��)
					--local Boss1 = ReadRoleValue( OwnerID() ,EM_RoleValue_Register4)	
					--local Boss2 = ReadRoleValue( OwnerID() ,EM_RoleValue_Register5)
					--local Boss3 = ReadRoleValue( OwnerID() ,EM_RoleValue_Register6)
					--Delobj(Boss1)
					--Delobj(Boss2)
					--Delobj(Boss3)
					Sleep(50)
					--�s��BOSS
					local king = Lua_DW_CreateObj( "flag" ,102421, 780420 , 11,1,1)---�NBoss�ͤ@���s��
					Sleep(10)					
					DelObj(Door0)
					Delobj(OwnerID())	
				end	
			end	
		end
	end
end




function Lua_cang_BossAi_Swordleft()

	local CheckTime = 10	-- �C��P�_
	local SkillDelay = { 4, 4, 4}		-- �ޯੵ��ɶ�
	local SkillID = { 493738, 493739, 493740 }	-- �ۦ�ID	
	--��q���B��q�B�B��q�q
	local SkillLV = { 7, 7, 7 }	-- �ۦ�LV

	while true do
		Sleep(10)
		local HT = ReadRoleValue( OwnerID() ,EM_RoleValue_PID) --����GID
		local AttackTarget = ReadRoleValue( HT , EM_RoleValue_AttackTargetID )
		if (  AttackTarget ~= 0 ) and ( CheckID( HT ) == true ) then  -- �ˬd�O�_���}�԰�
			local TempPlayer = SetSearchAllPlayer(ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)) --���{�b�ӰϤ����Ҧ����a
			local ThesePlayer = {}
			for i=1,TempPlayer do
				ThesePlayer[i] = GetSearchResult() -- ���Ȧs��
			end

			local SkillRND =  Rand( 100 )+1	-- ���Ͷü�
			local SkillShow = 1			
			
			if SkillRND <= 100 and SkillRND > 60 then
				SkillShow = 1
			elseif SkillRND <= 60 and SkillRND > 30 then
				SkillShow = 2
			elseif SkillRND <= 30 and SkillRND > 0 then
				SkillShow = 3
			end
						
			local anyone = Rand(table.getn(ThesePlayer))+1				--rand 
			CastSpellLV( OwnerID() , ThesePlayer[anyone] , SkillID[SkillShow] , SkillLV[SkillShow] )
			Sleep( SkillDelay[SkillShow] * CheckTime )
		elseif (  AttackTarget == 0 ) and ( CheckID( OwnerID() ) == true ) then
			DelObj(OwnerID())	
		end	
	end
end





function Lua_cang_BossAi_Swordright()

	local SkillID = 493741	-- �ۦ�ID	
	
	local SkillLV = 7 	-- �ۦ�LV
	local SkillA = 0	--�p��
	local SkillB = 0
	
	while true do
	Sleep(10)
		local HT = ReadRoleValue( OwnerID() ,EM_RoleValue_PID) --����GID
		local AttackTarget = ReadRoleValue( HT , EM_RoleValue_AttackTargetID )
		SkillA = SkillA + 1
		SkillB = SkillB + 1
		if (  AttackTarget ~= 0 ) and ( CheckID( HT ) == true ) then  -- �ˬd�O�_���}�԰�
			if SkillB >= 7 then
				CastSpellLV( OwnerID() , AttackTarget , 493742, 1 )
				Sleep(20)
				SkillB = 0	--�k0
			elseif SkillA >= 10	then	--�p��
				CastSpellLV( OwnerID() , OwnerID() , SkillID, SkillLV )
				Sleep(20)
				SkillA = 0	--�k0
			end	
		elseif (  AttackTarget == 0 ) and ( CheckID( OwnerID() ) == true ) then
			DelObj(OwnerID())
		end	
	end
end



function Lua_cang_BossAi_SwordSkillA1()

	local Boss1, Boss2, Boss3, Charge1, Charge2, Charge3
	local SkillRND =  Rand( 100 )+1	-- ���Ͷü�
	local SkillShow = 0				
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)	--��ROOMID
	
	Boss1 = CreateObjByFlag( 102414, 780420, 0, 1)	--�۴�����
	SetModeEx( Boss1   , EM_SetModeType_Strikback, false )--����
	SetModeEx( Boss1   , EM_SetModeType_Searchenemy, false )--����
	AddToPartition( Boss1 , RoomID )				--�[�J�R�x
	SetFightMode ( Boss1 , 0, 1, 0 ,0 )				--�԰��Ҧ�
	
	Boss2 = CreateObjByFlag( 102414, 780420, 1, 1)	--�۴�����
	SetModeEx( Boss2   , EM_SetModeType_Strikback, false )--����
	SetModeEx( Boss2   , EM_SetModeType_Searchenemy, false )--����
	AddToPartition( Boss2 , RoomID )				--�[�J�R�x
	SetFightMode ( Boss2 , 0, 1, 0 ,0 )				--�԰��Ҧ�
	
	Boss3 = CreateObjByFlag( 102414, 780420, 2, 1)	--�۴�����
	SetModeEx( Boss3   , EM_SetModeType_Strikback, false )--����
	SetModeEx( Boss3   , EM_SetModeType_Searchenemy, false )--����
	AddToPartition( Boss3 , RoomID )				--�[�J�R�x
	SetFightMode ( Boss3 , 0, 1, 0 ,0 )				--�԰��Ҧ�
	
	WriteRoleValue( OwnerID() ,EM_RoleValue_Register4, Boss1)						
	WriteRoleValue( OwnerID() ,EM_RoleValue_Register5, Boss2)						
	WriteRoleValue( OwnerID() ,EM_RoleValue_Register6, Boss3)	
	WriteRoleValue( Boss1 ,EM_RoleValue_Register9, OwnerID())
	WriteRoleValue( Boss2 ,EM_RoleValue_Register9, OwnerID())
	WriteRoleValue( Boss3 ,EM_RoleValue_Register9, OwnerID())

	BeginPlot( Boss1, "Cang_117_SkillDead", 0)
	BeginPlot( Boss2, "Cang_117_SkillDead", 0)
	BeginPlot( Boss3, "Cang_117_SkillDead", 0)
	
	Charge1 = CreateObjByFlag( 102640, 780420, 6, 1)	--�۴�
	SetModeEx( Charge1   , EM_SetModeType_Strikback, false )--����
	SetModeEx( Charge1   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( Charge1   , EM_SetModeType_Mark, false )--�аO
	SetModeEx( Charge1   , EM_SetModeType_Move, false )--����
	SetModeEx( Charge1   , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( Charge1   , EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( Charge1   , EM_SetModeType_HideName, false )--�W��
	SetModeEx( Charge1   , EM_SetModeType_Show, false )--���
	AddToPartition( Charge1 ,    RoomID )	--�[�i�R�x
	
	Charge2 = CreateObjByFlag( 102640, 780420, 7, 1)	--�۴�
	SetModeEx( Charge2   , EM_SetModeType_Strikback, false )--����
	SetModeEx( Charge2   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( Charge2   , EM_SetModeType_Mark, false )--�аO
	SetModeEx( Charge2   , EM_SetModeType_Move, false )--����
	SetModeEx( Charge2   , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( Charge2   , EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( Charge2   , EM_SetModeType_HideName, false )--�W��	
	SetModeEx( Charge2   , EM_SetModeType_Show, false )--���
	AddToPartition( Charge2 ,    RoomID )	--�[�i�R�x

	Charge3 = CreateObjByFlag( 102640, 780420, 8, 1)	--�۴�
	SetModeEx( Charge3   , EM_SetModeType_Strikback, false )--����
	SetModeEx( Charge3   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( Charge3   , EM_SetModeType_Mark, false )--�аO
	SetModeEx( Charge3   , EM_SetModeType_Move, false )--����
	SetModeEx( Charge3   , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( Charge3   , EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( Charge3   , EM_SetModeType_HideName, false )--�W��	
	SetModeEx( Charge3   , EM_SetModeType_Show, false )--���
	AddToPartition( Charge3 ,    RoomID )	--�[�i�R�x
	
	if SkillRND <= 100 and SkillRND > 84 then
		SkillShow = 1
	elseif SkillRND <= 84 and SkillRND > 68 then
		SkillShow = 2		
	elseif SkillRND <= 68 and SkillRND > 52 then
		SkillShow = 3
	elseif SkillRND <= 52 and SkillRND > 36 then
		SkillShow = 1
	elseif SkillRND <= 36 and SkillRND > 20 then
		SkillShow = 2		
	elseif SkillRND <= 20 and SkillRND > 0 then
		SkillShow = 3
	end	
	
	if SkillShow == 1 then --12
		CastSpellLV( Boss1, Charge1 , 493982,1 ) 	 ----�ľW	
		CastSpellLV( Boss2, Charge2 , 493982,1 ) 	 ----�ľW	
		CastSpellLV( Boss3, Charge3 , 493982,1 ) 	 ----�ľW			
		Sleep(30)		
		DelObj(Boss3)
		BeginPlot(Boss1, "Lua_cang_BossAi_SwordSkillB",0)
		BeginPlot(Boss2, "Lua_cang_BossAi_SwordSkillC",0)
		Sleep(45)
		DelObj(Boss1)	--�R��
		DelObj(Boss2)	--�R��
		DelObj(Charge1)	--�R��
		DelObj(Charge2)	--�R��		
		DelObj(Charge3)	--�R��
	elseif	SkillShow == 2 then --23
		CastSpellLV( Boss1, Charge1 , 493982,1 ) 	 ----�ľW	
		CastSpellLV( Boss2, Charge2 , 493982,1 ) 	 ----�ľW	
		CastSpellLV( Boss3, Charge3 , 493982,1 ) 	 ----�ľW	
		Sleep(30)
		DelObj(Boss1)
		BeginPlot(Boss2, "Lua_cang_BossAi_SwordSkillC",0)
		BeginPlot(Boss3, "Lua_cang_BossAi_SwordSkillD",0)
		Sleep(45)
		DelObj(Boss2)	--�R��
		DelObj(Boss3)	--�R��
		DelObj(Charge1)	--�R��
		DelObj(Charge2)	--�R��		
		DelObj(Charge3)	--�R��

	elseif	SkillShow == 3 then --13
		CastSpellLV( Boss1, Charge1 , 493982,1 ) 	 ----�ľW	
		CastSpellLV( Boss2, Charge2 , 493982,1 ) 	 ----�ľW				
		CastSpellLV( Boss3, Charge3 , 493982,1 ) 	 ----�ľW	
		Sleep(30)
		DelObj(Boss2)
		BeginPlot(Boss1, "Lua_cang_BossAi_SwordSkillB",0)
		BeginPlot(Boss3, "Lua_cang_BossAi_SwordSkillD",0)
		Sleep(45)
		DelObj(Boss1)	--�R��
		DelObj(Boss3)	--�R��
		DelObj(Charge1)	--�R��
		DelObj(Charge2)	--�R��		
		DelObj(Charge3)	--�R��
	end
end		

function Lua_cang_BossAi_SwordSkillA2()

	local Boss1, Boss2, Boss3, Charge1, Charge2, Charge3
	local SkillRND =  Rand( 100 )+1	-- ���Ͷü�
	local SkillShow = 0				
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)	--��ROOMID
	
	Boss1 = CreateObjByFlag( 102414, 780420, 3, 1)	--�۴�����
	SetModeEx( Boss1   , EM_SetModeType_Strikback, false )--����
	SetModeEx( Boss1   , EM_SetModeType_Searchenemy, false )--����
	AddToPartition( Boss1 , RoomID )				--�[�J�R�x
	SetFightMode ( Boss1 , 0, 1, 0 ,0 )				--�԰��Ҧ�
	
	Boss2 = CreateObjByFlag( 102414, 780420, 4, 1)	--�۴�����
	SetModeEx( Boss2   , EM_SetModeType_Strikback, false )--����
	SetModeEx( Boss2   , EM_SetModeType_Searchenemy, false )--����
	AddToPartition( Boss2 , RoomID )				--�[�J�R�x
	SetFightMode ( Boss2 , 0, 1, 0 ,0 )				--�԰��Ҧ�
	
	Boss3 = CreateObjByFlag( 102414, 780420, 5, 1)	--�۴�����
	SetModeEx( Boss3   , EM_SetModeType_Strikback, false )--����
	SetModeEx( Boss3   , EM_SetModeType_Searchenemy, false )--����
	AddToPartition( Boss3 , RoomID )				--�[�J�R�x
	SetFightMode ( Boss3 , 0, 1, 0 ,0 )				--�԰��Ҧ�
	
	WriteRoleValue( OwnerID() ,EM_RoleValue_Register4, Boss1)						
	WriteRoleValue( OwnerID() ,EM_RoleValue_Register5, Boss2)						
	WriteRoleValue( OwnerID() ,EM_RoleValue_Register6, Boss3)
	WriteRoleValue( Boss1 ,EM_RoleValue_Register9, OwnerID())
	WriteRoleValue( Boss2 ,EM_RoleValue_Register9, OwnerID())
	WriteRoleValue( Boss3 ,EM_RoleValue_Register9, OwnerID())

	BeginPlot( Boss1, "Cang_117_SkillDead", 0)
	BeginPlot( Boss2, "Cang_117_SkillDead", 0)
	BeginPlot( Boss3, "Cang_117_SkillDead", 0)	
	
	Charge1 = CreateObjByFlag( 102640, 780420, 6, 1)	--�۴�
	SetModeEx( Charge1   , EM_SetModeType_Strikback, false )--����
	SetModeEx( Charge1   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( Charge1   , EM_SetModeType_Mark, false )--�аO
	SetModeEx( Charge1   , EM_SetModeType_Move, false )--����
	SetModeEx( Charge1   , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( Charge1   , EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( Charge1   , EM_SetModeType_HideName, false )--�W��
	SetModeEx( Charge1   , EM_SetModeType_Show, false )--���
	AddToPartition( Charge1 ,    RoomID )	--�[�i�R�x
	
	Charge2 = CreateObjByFlag( 102640, 780420, 7, 1)	--�۴�
	SetModeEx( Charge2   , EM_SetModeType_Strikback, false )--����
	SetModeEx( Charge2   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( Charge2   , EM_SetModeType_Mark, false )--�аO
	SetModeEx( Charge2   , EM_SetModeType_Move, false )--����
	SetModeEx( Charge2   , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( Charge2   , EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( Charge2   , EM_SetModeType_HideName, false )--�W��	
	SetModeEx( Charge2   , EM_SetModeType_Show, false )--���
	AddToPartition( Charge2 ,    RoomID )	--�[�i�R�x

	Charge3 = CreateObjByFlag( 102640, 780420, 8, 1)	--�۴�
	SetModeEx( Charge3   , EM_SetModeType_Strikback, false )--����
	SetModeEx( Charge3   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( Charge3   , EM_SetModeType_Mark, false )--�аO
	SetModeEx( Charge3   , EM_SetModeType_Move, false )--����
	SetModeEx( Charge3   , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( Charge3   , EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( Charge3   , EM_SetModeType_HideName, false )--�W��	
	SetModeEx( Charge3   , EM_SetModeType_Show, false )--���
	AddToPartition( Charge3 ,    RoomID )	--�[�i�R�x

	if SkillRND <= 100 and SkillRND > 84 then
		SkillShow = 1
	elseif SkillRND <= 84 and SkillRND > 68 then
		SkillShow = 2		
	elseif SkillRND <= 68 and SkillRND > 52 then
		SkillShow = 3
	elseif SkillRND <= 52 and SkillRND > 36 then
		SkillShow = 1
	elseif SkillRND <= 36 and SkillRND > 20 then
		SkillShow = 2		
	elseif SkillRND <= 20 and SkillRND > 0 then
		SkillShow = 3
	end	
	
	if SkillShow == 1 then --12
		CastSpellLV( Boss1, Charge1 , 493982,1 ) 	 ----�ľW	
		CastSpellLV( Boss2, Charge2 , 493982,1 ) 	 ----�ľW	
		CastSpellLV( Boss3, Charge3 , 493982,1 ) 	 ----�ľW			
		Sleep(30)		
		DelObj(Boss3)
		BeginPlot(Boss1, "Lua_cang_BossAi_SwordSkillB",0)
		BeginPlot(Boss2, "Lua_cang_BossAi_SwordSkillC",0)
		Sleep(45)
		DelObj(Boss1)	--�R��
		DelObj(Boss2)	--�R��
		DelObj(Charge1)	--�R��
		DelObj(Charge2)	--�R��		
		DelObj(Charge3)	--�R��
	elseif	SkillShow == 2 then --23
		CastSpellLV( Boss1, Charge1 , 493982,1 ) 	 ----�ľW	
		CastSpellLV( Boss2, Charge2 , 493982,1 ) 	 ----�ľW	
		CastSpellLV( Boss3, Charge3 , 493982,1 ) 	 ----�ľW	
		Sleep(30)
		DelObj(Boss1)
		BeginPlot(Boss2, "Lua_cang_BossAi_SwordSkillC",0)
		BeginPlot(Boss3, "Lua_cang_BossAi_SwordSkillD",0)
		Sleep(45)
		DelObj(Boss2)	--�R��
		DelObj(Boss3)	--�R��
		DelObj(Charge1)	--�R��
		DelObj(Charge2)	--�R��		
		DelObj(Charge3)	--�R��

	elseif	SkillShow == 3 then --13
		CastSpellLV( Boss1, Charge1 , 493982,1 ) 	 ----�ľW	
		CastSpellLV( Boss2, Charge2 , 493982,1 ) 	 ----�ľW				
		CastSpellLV( Boss3, Charge3 , 493982,1 ) 	 ----�ľW	
		Sleep(30)
		DelObj(Boss2)
		BeginPlot(Boss1, "Lua_cang_BossAi_SwordSkillB",0)
		BeginPlot(Boss3, "Lua_cang_BossAi_SwordSkillD",0)
		Sleep(45)
		DelObj(Boss1)	--�R��
		DelObj(Boss3)	--�R��
		DelObj(Charge1)	--�R��
		DelObj(Charge2)	--�R��		
		DelObj(Charge3)	--�R��
	end
end		

function Lua_cang_BossAi_SwordSkillB()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local Temp = CreateObjByFlag( 102585, 780421, 0, 1)	--�۴�
	SetModeEx( Temp   , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( Temp   , EM_SetModeType_Strikback, false )--����
	SetModeEx( Temp   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( Temp   , EM_SetModeType_Mark, false )--�аO
	SetModeEx( Temp   , EM_SetModeType_Move, false )--����
	SetModeEx( Temp   , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( Temp   , EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( Temp   , EM_SetModeType_HideName, false )--�W��
	AddToPartition( Temp ,    RoomID )	--�[�i�R�x
	AddBuff( Temp ,504167,1 ,-1 )
	BeginPlot(Temp,"Lua_cang_BossAi_SwordSkillB1",0)
	local Temp1 = CreateObjByFlag( 102585, 780421, 1, 1)	--�۴�
	SetModeEx( Temp1  , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( Temp1  , EM_SetModeType_Strikback, false )--����
	SetModeEx( Temp1  , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( Temp1  , EM_SetModeType_Mark, false )--�аO
	SetModeEx( Temp1  , EM_SetModeType_Move, false )--����
	SetModeEx( Temp1  , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( Temp1  , EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( Temp1  , EM_SetModeType_HideName, false )--�W��
	AddToPartition( Temp1 ,    RoomID )	--�[�i�R�x
	AddBuff( Temp1 ,504167,1 ,-1 )
	BeginPlot(Temp1,"Lua_cang_BossAi_SwordSkillB1",0)
	local Temp2 = CreateObjByFlag( 102585, 780421, 2, 1)	--�۴�
	SetModeEx( Temp2   , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( Temp2   , EM_SetModeType_Strikback, false )--����
	SetModeEx( Temp2   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( Temp2   , EM_SetModeType_Mark, false )--�аO
	SetModeEx( Temp2   , EM_SetModeType_Move, false )--����
	SetModeEx( Temp2   , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( Temp2   , EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( Temp2   , EM_SetModeType_HideName, false )--�W��
	AddToPartition( Temp2 ,    RoomID )	--�[�i�R�x
	AddBuff( Temp2 ,504167,1 ,-1 )
	BeginPlot(Temp2,"Lua_cang_BossAi_SwordSkillB1",0)
	local Temp3 = CreateObjByFlag( 102585, 780421, 3, 1)	--�۴�
	SetModeEx( Temp3   , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( Temp3   , EM_SetModeType_Strikback, false )--����
	SetModeEx( Temp3   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( Temp3   , EM_SetModeType_Mark, false )--�аO
	SetModeEx( Temp3   , EM_SetModeType_Move, false )--����
	SetModeEx( Temp3   , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( Temp3   , EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( Temp3   , EM_SetModeType_HideName, false )--�W��
	AddToPartition( Temp3 ,    RoomID )	--�[�i�R�x
	AddBuff( Temp3 ,504167,1 ,-1 )
	BeginPlot(Temp3,"Lua_cang_BossAi_SwordSkillB1",0)
	Sleep(10)
	local Temp4 = CreateObjByFlag( 102585, 780421, 4, 1)	--�۴�
	SetModeEx( Temp4   , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( Temp4   , EM_SetModeType_Strikback, false )--����
	SetModeEx( Temp4   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( Temp4   , EM_SetModeType_Mark, false )--�аO
	SetModeEx( Temp4   , EM_SetModeType_Move, false )--����
	SetModeEx( Temp4   , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( Temp4   , EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( Temp4   , EM_SetModeType_HideName, false )--�W��
	AddToPartition( Temp4 ,    RoomID )	--�[�i�R�x
	AddBuff( Temp4 ,504167,1 ,-1 )
	BeginPlot(Temp4,"Lua_cang_BossAi_SwordSkillB1",0)
	local Temp5 = CreateObjByFlag( 102585, 780421, 5, 1)	--�۴�
	SetModeEx( Temp5   , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( Temp5   , EM_SetModeType_Strikback, false )--����
	SetModeEx( Temp5   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( Temp5   , EM_SetModeType_Mark, false )--�аO
	SetModeEx( Temp5   , EM_SetModeType_Move, false )--����
	SetModeEx( Temp5   , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( Temp5   , EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( Temp5   , EM_SetModeType_HideName, false )--�W��
	AddToPartition( Temp5 ,    RoomID )	--�[�i�R�x
	AddBuff( Temp5 ,504167,1 ,-1 )
	BeginPlot(Temp5,"Lua_cang_BossAi_SwordSkillB1",0)
	local Temp6 = CreateObjByFlag( 102585, 780421, 6, 1)	--�۴�
	SetModeEx( Temp6   , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( Temp6   , EM_SetModeType_Strikback, false )--����
	SetModeEx( Temp6   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( Temp6   , EM_SetModeType_Mark, false )--�аO
	SetModeEx( Temp6   , EM_SetModeType_Move, false )--����
	SetModeEx( Temp6   , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( Temp6   , EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( Temp6   , EM_SetModeType_HideName, false )--�W��
	AddToPartition( Temp6 ,    RoomID )	--�[�i�R�x
	AddBuff( Temp6 ,504167,1 ,-1 )
	BeginPlot(Temp6,"Lua_cang_BossAi_SwordSkillB1",0)
	local Temp7 = CreateObjByFlag( 102585, 780421, 7, 1)	--�۴�
	SetModeEx( Temp7   , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( Temp7   , EM_SetModeType_Strikback, false )--����
	SetModeEx( Temp7   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( Temp7   , EM_SetModeType_Mark, false )--�аO
	SetModeEx( Temp7   , EM_SetModeType_Move, false )--����
	SetModeEx( Temp7   , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( Temp7   , EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( Temp7   , EM_SetModeType_HideName, false )--�W��
	AddToPartition( Temp7 ,    RoomID )	--�[�i�R�x
	AddBuff( Temp7 ,504167,1 ,-1 )
	BeginPlot(Temp7,"Lua_cang_BossAi_SwordSkillB1",0)
	local Temp8 = CreateObjByFlag( 102585, 780421, 8, 1)	--�۴�
	SetModeEx( Temp8   , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( Temp8   , EM_SetModeType_Strikback, false )--����
	SetModeEx( Temp8   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( Temp8   , EM_SetModeType_Mark, false )--�аO
	SetModeEx( Temp8   , EM_SetModeType_Move, false )--����
	SetModeEx( Temp8  , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( Temp8   , EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( Temp8   , EM_SetModeType_HideName, false )--�W��
	AddToPartition( Temp8 ,    RoomID )	--�[�i�R�x
	AddBuff( Temp8 ,504167,1 ,-1 )
	BeginPlot(Temp8,"Lua_cang_BossAi_SwordSkillB1",0)
	local Temp9 = CreateObjByFlag( 102585, 780421, 9, 1)	--�۴�
	SetModeEx( Temp9   , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( Temp9   , EM_SetModeType_Strikback, false )--����
	SetModeEx( Temp9   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( Temp9   , EM_SetModeType_Mark, false )--�аO
	SetModeEx( Temp9   , EM_SetModeType_Move, false )--����
	SetModeEx( Temp9   , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( Temp9   , EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( Temp9   , EM_SetModeType_HideName, false )--�W��
	AddToPartition( Temp9 ,    RoomID )	--�[�i�R�x
	AddBuff( Temp9 ,504167,1 ,-1 )
	BeginPlot(Temp9,"Lua_cang_BossAi_SwordSkillB1",0)
	return true
end

function Lua_cang_BossAi_SwordSkillB1()
	sleep(100)
	Delobj(OwnerID())
end

function Lua_cang_BossAi_SwordSkillC()

	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local Temp = CreateObjByFlag( 102585, 780421, 10, 1)	--�۴�
	SetModeEx( Temp   , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( Temp   , EM_SetModeType_Strikback, false )--����
	SetModeEx( Temp   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( Temp   , EM_SetModeType_Mark, false )--�аO
	SetModeEx( Temp   , EM_SetModeType_Move, false )--����
	SetModeEx( Temp   , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( Temp   , EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( Temp   , EM_SetModeType_HideName, false )--�W��
	AddToPartition( Temp ,    RoomID )	--�[�i�R�x
	AddBuff( Temp ,504167,1 ,-1 )
	BeginPlot(Temp,"Lua_cang_BossAi_SwordSkillB1",0)
	local Temp1 = CreateObjByFlag( 102585, 780421, 11, 1)	--�۴�
	SetModeEx( Temp1  , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( Temp1  , EM_SetModeType_Strikback, false )--����
	SetModeEx( Temp1  , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( Temp1  , EM_SetModeType_Mark, false )--�аO
	SetModeEx( Temp1  , EM_SetModeType_Move, false )--����
	SetModeEx( Temp1  , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( Temp1  , EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( Temp1  , EM_SetModeType_HideName, false )--�W��
	AddToPartition( Temp1 ,    RoomID )	--�[�i�R�x
	AddBuff( Temp1 ,504167,1 ,-1 )
	BeginPlot(Temp1,"Lua_cang_BossAi_SwordSkillB1",0)
	local Temp2 = CreateObjByFlag( 102585, 780421, 12, 1)	--�۴�����
	SetModeEx( Temp2   , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( Temp2   , EM_SetModeType_Strikback, false )--����
	SetModeEx( Temp2   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( Temp2   , EM_SetModeType_Mark, false )--�аO
	SetModeEx( Temp2   , EM_SetModeType_Move, false )--����
	SetModeEx( Temp2   , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( Temp2   , EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( Temp2   , EM_SetModeType_HideName, false )--�W��
	AddToPartition( Temp2 ,    RoomID )	--�[�i�R�x
	AddBuff( Temp2 ,504167,1 ,-1 )
	BeginPlot(Temp2,"Lua_cang_BossAi_SwordSkillB1",0)
	local Temp3 = CreateObjByFlag( 102585, 780421, 13, 1)	--�۴�
	SetModeEx( Temp3   , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( Temp3   , EM_SetModeType_Strikback, false )--����
	SetModeEx( Temp3   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( Temp3   , EM_SetModeType_Mark, false )--�аO
	SetModeEx( Temp3   , EM_SetModeType_Move, false )--����
	SetModeEx( Temp3   , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( Temp3   , EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( Temp3   , EM_SetModeType_HideName, false )--�W��
	AddToPartition( Temp3 ,    RoomID )	--�[�i�R�x
	AddBuff( Temp3 ,504167,1 ,-1 )
	BeginPlot(Temp3,"Lua_cang_BossAi_SwordSkillB1",0)
	Sleep(10)
	local Temp4 = CreateObjByFlag( 102585, 780421, 14, 1)	--�۴�
	SetModeEx( Temp4   , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( Temp4   , EM_SetModeType_Strikback, false )--����
	SetModeEx( Temp4   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( Temp4   , EM_SetModeType_Mark, false )--�аO
	SetModeEx( Temp4   , EM_SetModeType_Move, false )--����
	SetModeEx( Temp4   , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( Temp4   , EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( Temp4   , EM_SetModeType_HideName, false )--�W��
	AddToPartition( Temp4 ,    RoomID )	--�[�i�R�x
	AddBuff( Temp4 ,504167,1 ,-1 )
	BeginPlot(Temp4,"Lua_cang_BossAi_SwordSkillB1",0)
	local Temp5 = CreateObjByFlag( 102585, 780421, 15, 1)	--�۴�
	SetModeEx( Temp5   , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( Temp5   , EM_SetModeType_Strikback, false )--����
	SetModeEx( Temp5   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( Temp5   , EM_SetModeType_Mark, false )--�аO
	SetModeEx( Temp5   , EM_SetModeType_Move, false )--����
	SetModeEx( Temp5   , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( Temp5   , EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( Temp5   , EM_SetModeType_HideName, false )--�W��
	AddToPartition( Temp5 ,    RoomID )	--�[�i�R�x
	AddBuff( Temp5 ,504167,1 ,-1 )
	BeginPlot(Temp5,"Lua_cang_BossAi_SwordSkillB1",0)
	local Temp6 = CreateObjByFlag( 102585, 780421, 16, 1)	--�۴�
	SetModeEx( Temp6   , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( Temp6   , EM_SetModeType_Strikback, false )--����
	SetModeEx( Temp6   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( Temp6   , EM_SetModeType_Mark, false )--�аO
	SetModeEx( Temp6   , EM_SetModeType_Move, false )--����
	SetModeEx( Temp6   , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( Temp6   , EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( Temp6   , EM_SetModeType_HideName, false )--�W��
	AddToPartition( Temp6 ,    RoomID )	--�[�i�R�x
	AddBuff( Temp6 ,504167,1 ,-1 )
	BeginPlot(Temp6,"Lua_cang_BossAi_SwordSkillB1",0)
	local Temp7 = CreateObjByFlag( 102585, 780421, 17, 1)	--�۴�
	SetModeEx( Temp7   , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( Temp7   , EM_SetModeType_Strikback, false )--����
	SetModeEx( Temp7   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( Temp7   , EM_SetModeType_Mark, false )--�аO
	SetModeEx( Temp7   , EM_SetModeType_Move, false )--����
	SetModeEx( Temp7   , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( Temp7   , EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( Temp7   , EM_SetModeType_HideName, false )--�W��
	AddToPartition( Temp7 ,    RoomID )	--�[�i�R�x
	AddBuff( Temp7 ,504167,1 ,-1 )
	BeginPlot(Temp7,"Lua_cang_BossAi_SwordSkillB1",0)
	local Temp8 = CreateObjByFlag( 102585, 780421, 18, 1)	--�۴�
	SetModeEx( Temp8   , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( Temp8   , EM_SetModeType_Strikback, false )--����
	SetModeEx( Temp8   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( Temp8   , EM_SetModeType_Mark, false )--�аO
	SetModeEx( Temp8   , EM_SetModeType_Move, false )--����
	SetModeEx( Temp8  , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( Temp8   , EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( Temp8   , EM_SetModeType_HideName, false )--�W��
	AddToPartition( Temp8 ,    RoomID )	--�[�i�R�x
	AddBuff( Temp8 ,504167,1 ,-1 )
	BeginPlot(Temp8,"Lua_cang_BossAi_SwordSkillB1",0)
	local Temp9 = CreateObjByFlag( 102585, 780421, 19, 1)	--�۴�
	SetModeEx( Temp9   , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( Temp9   , EM_SetModeType_Strikback, false )--����
	SetModeEx( Temp9   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( Temp9   , EM_SetModeType_Mark, false )--�аO
	SetModeEx( Temp9   , EM_SetModeType_Move, false )--����
	SetModeEx( Temp9   , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( Temp9   , EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( Temp9   , EM_SetModeType_HideName, false )--�W��
	AddToPartition( Temp9 ,    RoomID )	--�[�i�R�x
	AddBuff( Temp9 ,504167,1 ,-1 )
	BeginPlot(Temp9 ,"Lua_cang_BossAi_SwordSkillB1",0)	
	return true
end

function Lua_cang_BossAi_SwordSkillD()

	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local Temp = CreateObjByFlag( 102585, 780421, 20, 1)	--�۴�
	SetModeEx( Temp   , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( Temp   , EM_SetModeType_Strikback, false )--����
	SetModeEx( Temp   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( Temp   , EM_SetModeType_Mark, false )--�аO
	SetModeEx( Temp   , EM_SetModeType_Move, false )--����
	SetModeEx( Temp   , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( Temp   , EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( Temp   , EM_SetModeType_HideName, false )--�W��
	AddToPartition( Temp ,    RoomID )	--�[�i�R�x
	AddBuff( Temp ,504167,1 ,-1 )
	BeginPlot(Temp,"Lua_cang_BossAi_SwordSkillB1",0)
	local Temp1 = CreateObjByFlag( 102585, 780421, 21, 1)	--�۴�
	SetModeEx( Temp1  , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( Temp1  , EM_SetModeType_Strikback, false )--����
	SetModeEx( Temp1  , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( Temp1  , EM_SetModeType_Mark, false )--�аO
	SetModeEx( Temp1  , EM_SetModeType_Move, false )--����
	SetModeEx( Temp1  , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( Temp1  , EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( Temp1  , EM_SetModeType_HideName, false )--�W��
	AddToPartition( Temp1 ,    RoomID )	--�[�i�R�x
	AddBuff( Temp1 ,504167,1 ,-1 )
	BeginPlot(Temp1,"Lua_cang_BossAi_SwordSkillB1",0)
	local Temp2 = CreateObjByFlag( 102585, 780421, 22, 1)	--�۴�����
	SetModeEx( Temp2   , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( Temp2   , EM_SetModeType_Strikback, false )--����
	SetModeEx( Temp2   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( Temp2   , EM_SetModeType_Mark, false )--�аO
	SetModeEx( Temp2   , EM_SetModeType_Move, false )--����
	SetModeEx( Temp2   , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( Temp2   , EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( Temp2   , EM_SetModeType_HideName, false )--�W��
	AddToPartition( Temp2 ,    RoomID )	--�[�i�R�x
	AddBuff( Temp2 ,504167,1 ,-1 )
	BeginPlot(Temp2,"Lua_cang_BossAi_SwordSkillB1",0)
	local Temp3 = CreateObjByFlag( 102585, 780421, 23, 1)	--�۴�
	SetModeEx( Temp3   , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( Temp3   , EM_SetModeType_Strikback, false )--����
	SetModeEx( Temp3   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( Temp3   , EM_SetModeType_Mark, false )--�аO
	SetModeEx( Temp3   , EM_SetModeType_Move, false )--����
	SetModeEx( Temp3   , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( Temp3   , EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( Temp3   , EM_SetModeType_HideName, false )--�W��
	AddToPartition( Temp3 ,    RoomID )	--�[�i�R�x
	AddBuff( Temp3 ,504167,1 ,-1 )
	BeginPlot(Temp3,"Lua_cang_BossAi_SwordSkillB1",0)
	Sleep(10)
	local Temp4 = CreateObjByFlag( 102585, 780421, 24, 1)	--�۴�
	SetModeEx( Temp4   , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( Temp4   , EM_SetModeType_Strikback, false )--����
	SetModeEx( Temp4   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( Temp4   , EM_SetModeType_Mark, false )--�аO
	SetModeEx( Temp4   , EM_SetModeType_Move, false )--����
	SetModeEx( Temp4   , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( Temp4   , EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( Temp4   , EM_SetModeType_HideName, false )--�W��
	AddToPartition( Temp4 ,    RoomID )	--�[�i�R�x
	AddBuff( Temp4 ,504167,1 ,-1 )
	BeginPlot(Temp4,"Lua_cang_BossAi_SwordSkillB1",0)
	local Temp5 = CreateObjByFlag( 102585, 780421, 25, 1)	--�۴�
	SetModeEx( Temp5   , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( Temp5   , EM_SetModeType_Strikback, false )--����
	SetModeEx( Temp5   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( Temp5   , EM_SetModeType_Mark, false )--�аO
	SetModeEx( Temp5   , EM_SetModeType_Move, false )--����
	SetModeEx( Temp5   , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( Temp5   , EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( Temp5   , EM_SetModeType_HideName, false )--�W��
	AddToPartition( Temp5 ,    RoomID )	--�[�i�R�x
	AddBuff( Temp5 ,504167,1 ,-1 )
	BeginPlot(Temp5,"Lua_cang_BossAi_SwordSkillB1",0)
	local Temp6 = CreateObjByFlag( 102585, 780421, 26, 1)	--�۴�
	SetModeEx( Temp6   , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( Temp6   , EM_SetModeType_Strikback, false )--����
	SetModeEx( Temp6   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( Temp6   , EM_SetModeType_Mark, false )--�аO
	SetModeEx( Temp6   , EM_SetModeType_Move, false )--����
	SetModeEx( Temp6   , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( Temp6   , EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( Temp6   , EM_SetModeType_HideName, false )--�W��
	AddToPartition( Temp6 ,    RoomID )	--�[�i�R�x
	AddBuff( Temp6 ,504167,1 ,-1 )
	BeginPlot(Temp6,"Lua_cang_BossAi_SwordSkillB1",0)
	local Temp7 = CreateObjByFlag( 102585, 780421, 27, 1)	--�۴�
	SetModeEx( Temp7   , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( Temp7   , EM_SetModeType_Strikback, false )--����
	SetModeEx( Temp7   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( Temp7   , EM_SetModeType_Mark, false )--�аO
	SetModeEx( Temp7   , EM_SetModeType_Move, false )--����
	SetModeEx( Temp7   , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( Temp7   , EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( Temp7   , EM_SetModeType_HideName, false )--�W��
	AddToPartition( Temp7 ,    RoomID )	--�[�i�R�x
	AddBuff( Temp7 ,504167,1 ,-1 )
	BeginPlot(Temp7,"Lua_cang_BossAi_SwordSkillB1",0)
	local Temp8 = CreateObjByFlag( 102585, 780421, 28, 1)	--�۴�
	SetModeEx( Temp8   , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( Temp8   , EM_SetModeType_Strikback, false )--����
	SetModeEx( Temp8   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( Temp8   , EM_SetModeType_Mark, false )--�аO
	SetModeEx( Temp8   , EM_SetModeType_Move, false )--����
	SetModeEx( Temp8  , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( Temp8   , EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( Temp8   , EM_SetModeType_HideName, false )--�W��
	AddToPartition( Temp8 ,    RoomID )	--�[�i�R�x
	AddBuff( Temp8 ,504167,1 ,-1 )
	BeginPlot(Temp8,"Lua_cang_BossAi_SwordSkillB1",0)
	local Temp9 = CreateObjByFlag( 102585, 780421, 29, 1)	--�۴�
	SetModeEx( Temp9   , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( Temp9   , EM_SetModeType_Strikback, false )--����
	SetModeEx( Temp9   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( Temp9   , EM_SetModeType_Mark, false )--�аO
	SetModeEx( Temp9   , EM_SetModeType_Move, false )--����
	SetModeEx( Temp9   , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( Temp9   , EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( Temp9   , EM_SetModeType_HideName, false )--�W��
	AddToPartition( Temp9 ,    RoomID )	--�[�i�R�x
	AddBuff( Temp9 ,504167,1 ,-1 )
	BeginPlot(Temp9 ,"Lua_cang_BossAi_SwordSkillB1",0)	
	return true
end


------------------------------------------------------------------------
		
		
function Lua_cang_BossAi_SwordDead()
	---���`����
	--local PlayerLV = ReadRoleValue( TargetID() , EM_RoleValue_LV )
	--local PlayerSUBLV = ReadRoleValue( TargetID() , EM_RoleValue_LV_SUB )
	--DesignLog( OwnerID() , 102421 , " Killer Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )

	--�}�ҳ̫᪺��
	local Door = ReadRoleValue( OwnerID() ,EM_RoleValue_Register1)
	PlayMotionEX( Door ,  ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP  )
	SetModeEX( Door , EM_SetModeType_Obstruct , false )

	--�R�����Y���ת�
	local Door1 = ReadRoleValue( OwnerID() ,EM_RoleValue_Register3)
	DelObj(Door1)
	return true
end
		
	
function Lua_cang_BossAi_SwordCraze()

	local Craze = 0
	local SkillA = 0
	
	while true do
	Sleep(10)
		local HT = ReadRoleValue( OwnerID() ,EM_RoleValue_PID) --GID
		local AttackTarget = ReadRoleValue( HT , EM_RoleValue_AttackTargetID )
		if (  AttackTarget ~= 0 ) and ( CheckID( HT ) == true ) then  -- �ˬd�O�_���}�԰�
			Craze = Craze + 1	
			
			if SkillA == 0 then
				if Craze >= 600 then --�g�ɾ���
					ScriptMessage( HT , -1 , 2 , "[SC_102421_10]", 10 )	--��....��....
					Say( HT , "[SC_102421_10]")	--��....��....
					Addbuff(HT, 504269, 1, -1)	--�g��
					BeginPlot(OwnerID(), "Lua_cang_BossAi_SwordSkillB",0)
					BeginPlot(OwnerID(), "Lua_cang_BossAi_SwordSkillC",0)
					BeginPlot(OwnerID(), "Lua_cang_BossAi_SwordSkillD",0)
					Craze = 0
					SkillA = 1
				end	
			end
		end
	end		
end

function Cang_117_SkillDead()
	
	local Boss = ReadRoleValue( OwnerID() , EM_RoleValue_Register9 )	
	while true do 
		sleep(10)
		local AttackTarget = ReadRoleValue( Boss , EM_RoleValue_AttackTargetID )
		if (  AttackTarget == 0 ) and ( CheckID( Boss ) == true ) then  -- �ˬd�O�_���}�԰�	
			DelObj( OwnerID() )
		elseif ( CheckID( Boss ) == false ) or ReadRoleValue( Boss ,EM_RoleValue_IsDead ) == 1 then
			DelObj( OwnerID() )
		end
	end
end	