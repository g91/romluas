------------------------------------------------------------
------�ڹ�Boss-----�ب������Ĩ��w--------------
-----�O�d�ޯ�----�����B�A�d�U��ӤH�C

function Lua_apon_102850_dreamking()
	SetPlot(OwnerID(),"dead","Lua_apon_Zone120_DK_dead",10 )
	local ID = {}
	local Boss = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
	local Check_life = 0
	Move( OwnerID() , 2525 , 874 , 4443 )
	local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local PPLX = 0
	local PPL = SetSearchAllPlayer(roomid1 )
	for i = 1 , PPL , 1 do 
		ID[i] = GetSearchResult()
		if ReadRoleValue( ID[i] , EM_RoleValue_IsDead ) ~= 1 and ReadRoleValue( ID[i], EM_RoleValue_VOC) ~= 0  and ReadRoleValue( ID[i] , EM_RoleValue_RoomID  ) == roomid1 and GetDistance( OwnerID(), ID[i]) <=1300 then
			SetAttack( OwnerID() , ID[i] )
		end
	end
	local CheckTime = 10	-- �C��P�_
	local WiDiMark = 0
	local WuDiTime = 10 *30	-- �L��30��
	local IceMark = 0
	local IceTime = 10 *15	-- �C15��B�@��
	local SkillTime = 2.5		-- �ޯੵ��ɶ�
	local HammerFlagID = 780286
	local HammerFlag = {}
	local Hammer = {}
	local HammerID = 112324
	local IceDistance = 500
	local BuffID = 502826	-- ���T����
	local StartHammer = 0

	local SkillID = { 492379, 492380, 492381, 492382, 502826, 492573 }
	local SkillLV = { 15, 30 , 1800 , 20 , 1 , 1 }
	local SkillSay = { "[SC_101501_01]", "[SC_101501_02]", "[SC_101501_03]", "[SC_101501_04]", "[SC_101501_05]", "[SC_101501_06]" }
	
	for f = 1, 	GetMoveFlagCount( HammerFlagID )-1 do
		table.insert( HammerFlag , f )
	end

	while true do
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
		--if (  AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- �ˬd�O�_���}�԰�
		if HateListCount( OwnerID() ) ~= 0 then
			Check_life = 1
			if StartHammer == 0 then
				HammerFlag = Lua_MixTable( HammerFlag )
				local thisHammerFlag = HammerFlag[1]
				local thisHammerID = Lua_DW_CreateObj( "flag" , HammerID , HammerFlagID , thisHammerFlag , 1 , 1 )
				table.insert( Hammer  , thisHammerID )
				SetPlot( thisHammerID , "Touch" , "LuaS_112324_GetHammer" , 25 )
				AddBuff( thisHammerID , 502840 , 1 , 600 )		-- �G����
				StartHammer = 1
			end


			if WiDiMark >= 40 then
				local SkillShow = 6	-- �L��
				local IceTarget = 0

				WiDiMark = WiDiMark + SkillTime
				IceMark = IceMark + SkillTime
				Sleep( SkillTime*CheckTime*2 )
				WuDiTime = HateListCount( OwnerID() )*50 			--�H�H�ƨM�w�L�Įɶ����u  (�p�ʭץ�)
				Buff_WuDiTime = WuDiTime / 10				--�L��Buff�ɶ� (�p�ʭץ�)

				ScriptMessage( OwnerID() , 0 , 2 ,  SkillSay[SkillShow], C_SYSTEM )		-- �}�l�L��
				SetFightMode(  OwnerID() , 1, 0, 1, 1 )		-- ������
				Sleep( 2 )
				
				AddBuff( OwnerID() , 502827 , 1 , Buff_WuDiTime  )					-- �ֽ��w�� (�p�ʭץ�,����L�Ħ��ɭԬI�񥢱�)	
				
				for i = 1, table.getn( Hammer ) do	-- ���R�����W�����}�B����
					if ( ( Hammer[i] ~= nil ) and ( CheckID( Hammer[i] ) == true ) ) then		DelObj( Hammer[i] )	end
				end
				
				if ( Hammer ~= nil ) then	
					Hammer = {}	
				end

				HammerFlag = Lua_MixTable( HammerFlag )
				local HateListRand = HateListRandom( OwnerID() )
				for t = 1, table.getn( HateListRand ) - 3 do	-- -3 �N�O(�̫�)��Ӫ��a���B
					local SkillShow = 5	-- �B
					local thisHammerFlag = HammerFlag[t]
					local thisHammerID = Lua_DW_CreateObj( "flag" , HammerID , HammerFlagID , thisHammerFlag+2 , 1 , 1 )	
					table.insert( Hammer  , thisHammerID )
					SetPlot( thisHammerID , "Touch" , "LuaS_112324_GetHammer" , 25 )
					AddBuff( thisHammerID , 502840 , 1 , 600 )		-- �G����

					IceTarget = HateListRand[t]
					if GetDistance( OwnerID() , IceTarget ) <= IceDistance then
						ScriptMessage( OwnerID() , IceTarget , 1 ,  SkillSay[SkillShow], C_SYSTEM )	-- �B�H
						AddBuff( IceTarget , SkillID[SkillShow] , 1 , 600 )		-- 10 ����
					end
				end
				
				------�ˬd�O���O���B�F�A�O�����H���@�ӸѦB--------
				sleep(10)
				
				local AllIceCheck = 0
				local Freeman = 0
				for i = 1 , table.getn( HateListRand ) , 1 do
					if CheckBuff( HateListRand[i] , 502826 ) == true then
						AllIceCheck = AllIceCheck + 1
					end
				end
				if HateListCount( OwnerID() ) > 1 and AllIceCheck == table.getn( HateListRand ) then
					Freeman = HateListRand[ table.getn( HateListRand )]
					for i = 1 , table.getn( HateListRand ) -3 , 1 do -------�ˬd�@�w�n�O�����H�~�񱼡A���p�G�u���@�Ӭ��H�A�B���L��
						if ReadRoleValue( Freeman , EM_RoleValue_IsDead ) == 1 then
							Freeman = HateListRand[ table.getn( HateListRand )-i]
						else
							break
						end
					end							
					CancelBuff( Freeman , 502826 )
				end				
				-----------------------------------------------------------------------
				Sleep( WuDiTime-20 )
				ScriptMessage( OwnerID() , 0 , 2 ,  "[SC_101501_07]", C_SYSTEM )		-- �Ѱ��L��
				WiDiMark  = 0			
				SetFightMode(  OwnerID() , 1, 1, 1, 1 )						-- ��_���`				
				SkillShow = 4
				WiDiMark = WiDiMark + SkillTime
				IceMark = IceMark + SkillTime
				Sleep( SkillTime*CheckTime - 10 )
				CastSpellLV( OwnerID() , HateTargetID() , SkillID[SkillShow] , SkillLV[SkillShow] )	-- �L�ĲM��
			end

				local SkillRND =  Rand( 100 )+1	-- ���Ͷü�
				--Say( OwnerID() , SkillRND .." %" )
				local SkillShow = 1
				if SkillRND <= 100 and SkillRND > 75 then
					SkillShow = 1
				elseif SkillRND <= 75 and SkillRND > 50 then
					SkillShow = 2
				elseif SkillRND <= 50 and SkillRND > 5 then
					SkillShow = 3
				elseif SkillRND <= 5 and SkillRND > 0 then
					SkillShow = 1
					--SkillShow = 4
				end

				WiDiMark = WiDiMark + SkillTime
				IceMark = IceMark + SkillTime
				Sleep( SkillTime*CheckTime )
				--Say( OwnerID() ,  SkillSay[SkillShow] )
				CastSpellLV( OwnerID() , HateTargetID() , SkillID[SkillShow] , SkillLV[SkillShow] )

			--end
			WiDiMark = WiDiMark + 1
			IceMark = IceMark + 1
		elseif HateListCount( OwnerID() ) == 0 then
			--SetPosByFlag( OwnerID(), 780388 , 1 )----�N DK �Ǩ������
			local ID = {}
			local ID_2 = {}
			local ID_2_all = 0
			--local Boss = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
			--local AttackTarget = ReadRoleValue( Boss , EM_RoleValue_AttackTargetID )
			--if  ( AttackTarget ~= 0 ) then
				--SetAttack(OwnerID(),AttackTarget)
			--end
			
			if Check_life == 1 then
				local PPL = SetSearchAllPlayer(roomid1)
				--sleep(10)
				--DeBugMsg(0,0,"PPL = "..PPL)
				if PPL==0 then-----------------------------�ˬd�̭��O�_ ���S���H
					for i = 1, table.getn( Hammer ) do	-- ���R�����W�����}�B����
						if ( ( Hammer[i] ~= nil ) and ( CheckID( Hammer[i] ) == true ) ) then	
							DelObj( Hammer[i] )
						end
					end
					
					if ( Hammer ~= nil ) then	
						Hammer = {}	
					end
					
					WriteRoleValue( Boss, EM_RoleValue_PID, 1)
					sleep(30)
					Delobj(OwnerID())
				
				elseif PPL ~= 0 then  -----------------------------���H���O�i�঳gm�Ϊ̦��H
					for i = 1 , PPL , 1 do 
						ID[i] = GetSearchResult()
						if ReadRoleValue( ID[i] , EM_RoleValue_IsDead ) == 1 or  ------�h�ˬd�̭����H�O�_�O���H�Ϊ�gm
							ReadRoleValue( ID[i], EM_RoleValue_VOC) == 0 or
							GetDistance( OwnerID(), ID[i]) >=1300 then
							PPLX=PPLX+1
							--DeBugMsg(0,0,"ID ="..ID[i])
							--DeBugMsg(0,0,"PPLX = "..PPLX)
						else
							table.insert( ID_2 , ID[i] ) 
						end
						Check_ID = table.getn(ID)	
						--say(OwnerID(),"Check_ID_2 =="..Check_ID)
					end
					
					if PPL<=PPLX then ---------���۵�  ����̭����O���H�Ϊ�gm  �ҥH���m
						for i = 1, table.getn( Hammer ) do	-- ���R�����W�����}�B����
							if ( ( Hammer[i] ~= nil ) and ( CheckID( Hammer[i] ) == true ) ) then		
								DelObj( Hammer[i] )	
							end
						end
						
						if ( Hammer ~= nil ) then	
							Hammer = {}	
						end
						
						WriteRoleValue( Boss, EM_RoleValue_PID, 1) ----�n�O�۵����ܦ^���D��A�i�歫�m
						sleep(30)
						Delobj(OwnerID())
						break
					elseif PPL > PPLX then ----�N����W�٦����H�A�~��԰�
						ID_2_all = table.getn(ID_2)
						for i = 1 , ID_2_all , 1 do
						--for i = 1 , PPL , 1 do 
							--ID[i] = GetSearchResult()
							--if ReadRoleValue( ID[i] , EM_RoleValue_IsDead ) ~= 1 and 
								--ReadRoleValue( ID[i], EM_RoleValue_VOC) ~= 0 and 
								--ReadRoleValue( ID[i] , EM_RoleValue_RoomID  ) == roomid1 then
								SetAttack( OwnerID() , ID_2[i] )
								PPLX = 0
								PPL = 0
								--pos = 1
							--end
						end
					end
				end
			end	
		else

			WiDiMark = 0
			IceMark = 0
			StartHammer = 0

			for i = 1, table.getn( Hammer ) do	-- ���}�԰��R�}�B����
				if ( ( Hammer[i] ~= nil ) and ( CheckID( Hammer[i] ) == true ) ) then		DelObj( Hammer[i] )	end
			end
			if ( Hammer ~= nil ) then	Hammer = {}	end

		end

		Sleep( CheckTime )
	end

end


----------------------------------------
---------�ڹ�Boss-----�p����-------

function Lua_apon_102853_dreamking()
	SetPlot(OwnerID(),"dead","Lua_apon_Zone120_DK_dead",10 )
	local ID = {}
	local Boss = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
	local Check_life = 0
	Move( OwnerID() , 2525 , 874 , 4443 )
	local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local PPLX = 0
	local PPL = SetSearchAllPlayer(roomid1 )
	for i = 1 , PPL , 1 do 
		ID[i] = GetSearchResult()
		if ReadRoleValue( ID[i] , EM_RoleValue_IsDead ) ~= 1 and ReadRoleValue( ID[i], EM_RoleValue_VOC) ~= 0  and ReadRoleValue( ID[i] , EM_RoleValue_RoomID  ) == roomid1 and GetDistance( OwnerID(), ID[i]) <=1300 then
			SetAttack( OwnerID() , ID[i] )
		end
	end
	while 1 do 
		sleep(10)
		local counter1 = 0												-------------���ΦM���o�ʭp�ɾ�	
		local counter2 = 0												-------------�@��ޯ�X�ۭp�ɾ�
		local ModeCheck = 503981										-------------�Ҧ��ˬd��				
		local Mode1 = 503983											-------------�Ҧ�1		
		local Mode2 = 503984											-------------�Ҧ�2	
		local CombatBegin = 0											-------------�԰��}�l�X��
		local Skill = { 493663 , 493664 , 493665 , 493787 , 493788 }	--------------- 1.�y�����   	2.���a	3.���ξ_��		4.�Фg����		5.�{��(���ϥ�)		
		local SkillLv = {0 , 0 , 0 , 0 , 0}
		local SkillString = { "[SC_102349_1]" , "[SC_102349_2]" , "[SC_102349_3]" }
		
		local LittleWormID = 102351		----------���z�p��
		local LittleWorm = {}			----------���z�p��GID�s���
		local FakeBossID = 102890		----------Boss����
		local WormHoleFlag = 780396		----------�ά}�X�l( ��J�a�U)
		local Earthquake = 1			----------�O�_��t�p�J�g��
		local ControlSpell = 493666			---------�F��s��	
		local NowHP = 0
			
		while 1 do	
			sleep(10)	
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
			--if  ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then	
			if HateListCount( OwnerID() ) ~= 0 then
				Check_life = 1
			
				if CombatBegin == 0 then							---------------�u���}����@��
					AddBuff( OwnerID() , ModeCheck , 0 , -1 )		----------------------------�WBoss�Ҧ��ˬdBuff
					AddBuff( OwnerID() , Mode1 , 0 , -1 )		----------------------------Boss�Ҧ�1  
					CombatBegin = 1
				end	
				counter1 = counter1 + 1							----------���ΦM���}�l�p��
				counter2 = counter2 + 1							----------�@��ޯ�ޯ�
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
								AddBuff( partymember[BeControlled] , 504825 , 0 , -1 )								
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
						AddBuff( FakeBoss , 504823 , 0 , -1 )
						WriteRoleValue( FakeBoss , EM_RoleValue_register1 , AttackTarget )
						WriteRoleValue( FakeBoss , EM_RoleValue_register3 , NowHP )
						CallPlot( FakeBoss , "Lua_apon_102853_dreamking_1" , OwnerID() )
						Earthquake = 2
					end	
				end	

				if counter1 == 25 then							--------���ΦM���o��
					for i = 1 , partymember[0] , 1 do
						if ReadRoleValue( partymember[i] , EM_RoleValue_IsDead ) == 0  then 						
							local LittleWormTemp = lua_star_CreateNPC( partymember[i] , 0 , LittleWormID , 450 , Room )	--------�ͥX���z��
							LittleWorm[table.getn( LittleWorm )+1] = LittleWormTemp									--------�ñNGID�s�Jtable	
							Setplot( LittleWormTemp , "range" , "lua_star_BossAI_BigWorm_2" , 40)
							BeginPlot(LittleWormTemp,"LuaS_Discowood_CheckPeace",0) ---�S���i�J�԰��h�|����
							--Setplot( LittleWormTemp , "dead" , "lua_star_BossAI_LittleDead" , 30)					-----���F�R���p�Ϋ���
							SetAttack( LittleWormTemp , partymember[i] )
						end
					end
					counter1 = 0
				end	
				
				if counter2 >= 10 then					-----------Boss�@��ޯ�I��
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
				end	
			elseif HateListCount( OwnerID() ) == 0 then
				--SetPosByFlag( OwnerID(), 780388 , 1 )----�N DK �Ǩ������
				local ID = {}
				local ID_2 = {}
				local ID_2_all = 0
				--local Boss = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
				--local AttackTarget = ReadRoleValue( Boss , EM_RoleValue_AttackTargetID )
				--if  ( AttackTarget ~= 0 ) then
					--SetAttack(OwnerID(),AttackTarget)
				--end
				
				if Check_life == 1 then
					local PPL = SetSearchAllPlayer(roomid1)
					--sleep(10)
					--DeBugMsg(0,0,"PPL = "..PPL)
					if PPL==0 then-----------------------------�ˬd�̭��O�_ ���S���H
						--DeBugMsg(0,0,"MOB_1  ")
						WriteRoleValue( Boss, EM_RoleValue_PID, 1)
						sleep(30)
						Delobj(OwnerID())
					
					elseif PPL ~= 0 then  -----------------------------���H���O�i�঳gm�Ϊ̦��H
						for i = 1 , PPL , 1 do 
							ID[i] = GetSearchResult()
							if ReadRoleValue( ID[i] , EM_RoleValue_IsDead ) == 1 or  ------�h�ˬd�̭����H�O�_�O���H�Ϊ�gm
								ReadRoleValue( ID[i], EM_RoleValue_VOC) == 0 or
								GetDistance( OwnerID(), ID[i]) >=1300 then
								PPLX=PPLX+1
								--DeBugMsg(0,0,"ID ="..ID[i])
								--DeBugMsg(0,0,"PPLX = "..PPLX)
							else
								table.insert( ID_2 , ID[i] ) 
							end
							Check_ID = table.getn(ID)	
							--say(OwnerID(),"Check_ID_2 =="..Check_ID)
						end
						
						if PPL<=PPLX then ---------���۵�  ����̭����O���H�Ϊ�gm  �ҥH���m
							--DeBugMsg(0,0,"MOB_2 ")
							WriteRoleValue( Boss, EM_RoleValue_PID, 1) ----�n�O�۵����ܦ^���D��A�i�歫�m
							sleep(30)
							Delobj(OwnerID())
							break
						elseif PPL > PPLX then ----�N����W�٦����H�A�~��԰�
							ID_2_all = table.getn(ID_2)
							for i = 1 , ID_2_all , 1 do
							--for i = 1 , PPL , 1 do 
								--ID[i] = GetSearchResult()
								--if ReadRoleValue( ID[i] , EM_RoleValue_IsDead ) ~= 1 and 
									--ReadRoleValue( ID[i], EM_RoleValue_VOC) ~= 0 and 
									--ReadRoleValue( ID[i] , EM_RoleValue_RoomID  ) == roomid1 then
									SetAttack( OwnerID() , ID_2[i] )
									PPLX = 0
									PPL = 0
									--pos = 1
								--end
							end
						end
					end
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


function Lua_apon_102853_dreamking_1(Boss)		------Boss�����@��
	local HP = ReadRoleValue( OwnerID() , EM_RoleValue_register3 )	
	--WriteRoleValue( OwnerID() , EM_RoleValue_HP , HP )	---------7/21����Boss��q�Ȯɥ�����
	WriteRoleValue( OwnerID() , EM_RoleValue_register2 , Boss )
	--local player = ReadRoleValue( OwnerID() , EM_RoleValue_register1 )
	--local partymember = LuaFunc_PartyData( player )
	local BeControlled = ReadRoleValue( Boss , EM_RoleValue_register1 )
	local counter = 0
	 
	WriteRoleValue( OwnerID() , EM_RoleValue_register1 , BeControlled )
	Setplot(OwnerID() , "dead" , "Lua_apon_102853_dreamking_2" , 30)
	for i=1 , 35 do
		if CheckID(OwnerID()) == true then
			counter = counter + 1
			sleep(10)
			if counter == 20 then
				DelObj(OwnerID())
				break
			end
		else
			break	
		end	
	end	
end

function Lua_apon_102853_dreamking_2()			-------�������`�@��
	local ControllBuff = 504825
	local Boss = ReadRoleValue( OwnerID() , EM_RoleValue_register2 )
	local BeControlled = ReadRoleValue( OwnerID() , EM_RoleValue_register1 )
	CancelBuff( BeControlled , ControllBuff )
end



function lua_apon_102853_TransferDM()	--------�]��Ĳ�o�k�N���Q����Ĳ�o�u�����z�����~��Ĳ�o�A�ҥH��ΨC���ͪk�N�Ӱ�( 504034�s�򲣥ͥ� )
	local ControllBuff = 504825
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