-------�ڹҤ������`�@��---------------------
function Lua_apon_Zone120_DK_dead()
	local Boss = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
	local JK = ReadRoleValue(OwnerID(),EM_RoleValue_PID) 
	WriteRoleValue( Boss, EM_RoleValue_Register9, 1) ---���U�@���ڹҤ��n����
	
	local DK_all_1 = 0
	DK_all_1 = ReadRoleValue(Boss,EM_RoleValue_Register6)-----�֭p�ͥX�ڹ�Boss���ƶq  
	WriteRoleValue( Boss, EM_RoleValue_Register6, DK_all_1 - 1)
	
	SetFightMode( JK , 0 , 0 , 0 , 0 )
	PlayMotionEX(JK, ruFUSION_ACTORSTATE_DYING , ruFUSION_ACTORSTATE_DEAD)
	ScriptMessage(OwnerID() , -1 , 2 , "[SC_102683_16]" , 1 )----�쥻�b�c�Ф����𮧡A���������F
end


-----�ڹ�Boss---�Ǥ�-----------------------------------------------
-----�O�d���ޯ঳1. �o��C2.�����C3.��a�s�����C
function Lua_apon_102856_dreamking()
	SetPlot(OwnerID(),"dead","Lua_apon_Zone120_DK_dead",10 )
	local ID = {}
	local Boss = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
	local pos = 1 
	Move( OwnerID() , 2525 , 874 , 4443 )
	local PPLX = 0
	local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local PPL = SetSearchAllPlayer(roomid1 )
	local Check_ID = 0
	for i = 1 , PPL , 1 do 
		ID[i] = GetSearchResult()
		if ReadRoleValue( ID[i] , EM_RoleValue_IsDead ) ~= 1 and ReadRoleValue( ID[i], EM_RoleValue_VOC) ~= 0  and ReadRoleValue( ID[i] , EM_RoleValue_RoomID  ) == roomid1 and GetDistance( OwnerID(), ID[i]) <=1300 then
			SetAttack( OwnerID() , ID[i] )
		end
		Check_ID = table.getn(ID)
	end
	
	local Check_life = 0
	while 1 do
		local counter1 = 0
		local counter2 = 0
		local counter3 = 0
		local counter4 = 0
		local counter5 = 0
		local pid = 0
		sleep(10)
		while 1 do
		PPLX = 0
			sleep(10)
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
			--if ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then	
			if HateListCount( OwnerID() ) ~= 0 then
				local partymember = LuaFunc_PartyData( AttackTarget)				
				sleep(10)
				--counter1 = counter1 + 1 
				--counter2 = counter2 + 1
				counter3 = counter3 + 1
				counter4 = counter4 + 1
				counter5 = counter5 + 1
				Check_life = 1
				if counter3 >= 15 then
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_102063_3]", 1 )    --�r��n�s�W
					Say( OwnerID() , "[SC_102063_3]" )	----�q �I ���M�Pı��@�}�ѷn�a�� �I�I
					CastSpell( OwnerID() , OwnerID() , 493188) 	 ----���i�_�q					
					sleep(10)	
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_102063_5]", 1 )    --�r��n�s�W
					Say( OwnerID() , "[SC_102063_5]" )	----�S�Ǥڥͮ𪺤H �I���Ӧ� �I [ �೽�H�y ]
					sleep(10)
					CastSpell( OwnerID() , OwnerID() , 493187) 	 ----�Ǥڤ���
					SetFightMode ( OwnerID(),1, 0, 0,1 )	-----0617�p�ʷs�W�A�����L��]���
					sleep(10)
					SetFightMode ( OwnerID(),1, 1, 1,1 )
					counter3 = 0
								
				elseif counter4 >= 10 then
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_102063_4]", 1 )    --�r��n�s�W
					Say( OwnerID() , "[SC_102063_4]" )	----  �����j���̱j�j���}�a�O�a �I�I[ �೽�H�y ]
					sleep(20)
					CastSpellLV( OwnerID() , OwnerID() , 493221 , 40) 	 ----�x���j��--����					
					counter4 = 0
								
				elseif counter5 >= 5 then
					local anyone = Rand(partymember[0]-1)+1    --�]��partymember �O �q 0 �}�l
					CastSpell( OwnerID() , partymember[anyone] , 493499) 	 ----�Ǥںx��---�s�X�x��					
					sleep(10)							
					counter5 = 0
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
			end
		end
	end
end

------------------------------------------------------------------------------------------------------
------�ڹ�Boss-----��������--------------
-----�O�d�ޯ�----

function Lua_apon_102855_dreamking()
	SetPlot(OwnerID(),"dead","Lua_apon_Zone120_DK_dead",10 )
	local ID = {}
	local Boss = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
	Move( OwnerID() , 2525 , 874 , 4443 )
	local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local PPL = SetSearchAllPlayer(roomid1 )
	local PPLX = 0
	for i = 1 , PPL , 1 do 
		ID[i] = GetSearchResult()
		if ReadRoleValue( ID[i] , EM_RoleValue_IsDead ) ~= 1 and ReadRoleValue( ID[i], EM_RoleValue_VOC) ~= 0  and ReadRoleValue( ID[i] , EM_RoleValue_RoomID  ) == roomid1 and GetDistance( OwnerID(), ID[i]) <=1300 then
			SetAttack( OwnerID() , ID[i] )
		end
	end
	local Check_life = 0
	while 1 do		
		local counter1 = 0
		local counter2 = 0
		local counter3 = 0
		sleep(10)
		while 1 do	
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
			--if  ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then	
			if HateListCount( OwnerID() ) ~= 0 then
				local partymember = LuaFunc_PartyData( AttackTarget)				
				sleep(10)
				counter1 = counter1 + 1
				counter2 = counter2 + 1
				counter3 = counter3 + 1
				Check_life = 1		
				if counter1 >= 10 then
					for i = 1 , partymember[0] , 1 do
						if ReadRoleValue( partymember[i] , EM_RoleValue_VOC ) == 5 and ReadRoleValue( partymember[i] , EM_RoleValue_IsDead ) ~= 1  then       							
							ScriptMessage( OwnerID() , -1 , 2 , "[SC_100998_1]" , 1 )
							--Say( OwnerID() , "[SC_100998_1]")	----�N�J���S�X�޲����L��
							sleep(20)
							CastSpell( OwnerID() , partymember[i] , 491308) 	 -----�k�O�y��						
							sleep(10)							
						end
					end
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_100998_2]", 1 )
					--Say( OwnerID() , "[SC_100998_2]")  ----�N���A��!!
					sleep(10)
					CastSpell( OwnerID() , TargetID() , 494723)			  ----���K�z���N
					sleep(10)
					counter1 = 0
				end
				if counter2 >= 6 then 
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_100998_3]", 1 )
					Yell( OwnerID() , "[SC_100998_3]" , 5)----�A�̨S���ӧQ�����|!!
					sleep(20)
					CastSpell( OwnerID() , OwnerID() , 494715) 	--������
					counter2 = 0
					sleep(10)					
				end	
				if counter3 >= 18 then 
				    ScriptMessage( OwnerID() , -1 , 2 , "[SC_100998_4]" , 1 )
					Yell( OwnerID() , "[SC_100998_4]" , 5) ----���㪺���K!!
					sleep(20)
					CastSpell( OwnerID() , OwnerID() ,  492016) --���B
					SetFightMode ( OwnerID(),1, 0, 0,1 )
					counter3 = 0
					sleep(30)	
					SetFightMode ( OwnerID(),1, 1, 1,1 )				
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
			end
		end
	end
end

------------------------------------------------------------------------------------------------------
------�ڹ�Boss-----�׹D�|���w�d����--------------
-----�O�d�ޯ�----
function Lua_apon_102854_dreamking()
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
	local MonsterID = 102869	-- �ͧ�
	local MonsterNumber1 = 2
	local MonsterNumber2 = 2
	local MonsterNumber3 = 2
	local HPMonsterNumber = 2
	local HPMonsterID = 102807	-- ���w�k�v
	local FirstMagicID = 490636	-- �s��ɧ�
	local BuffID = 501014 	-- �s��ɧ�Buff
	local SecondMagicID = 494174	-- ���y�N
	local SecondMagicLV = 2000
	local thirdMagicID = 494175		-- �j�z��
	local thirdMagicLV = 50

	local HPMagicID = 493997	-- �p���M��50%��_�N�]���50%, 25%�ɨϥΡ^
	local MaxHP = ReadRoleValue(  OwnerID() , EM_RoleValue_MaxHP )

	local CheckTime = 10	-- �@���ˬd�@��
	local FTM = "NoCall"	-- �԰����A
	local F2M = "NoCall"	-- �԰����A
	local F4M = "NoCall"	-- �԰����A
	local HPM2 = "NoCall"	-- �^�媬�A
	local HPM4 = "NoCall"	-- �^�媬�A
	local Monster1 = {}
	local Monster2 = {}
	local Monster3 = {}


	while true do
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
		--if (  AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- �ˬd�O�_���}�԰�
		if HateListCount( OwnerID() ) ~= 0 then
			--Say( OwnerID(), "Fighting! AttackTarget = "..AttackTarget.." n = "..n )
			Check_life = 1
			if ( CheckBuff( AttackTarget , BuffID ) == true ) then
				CastSpellLV( OwnerID(), AttackTarget, SecondMagicID , SecondMagicLV ) 
			else
				local RND =  Rand( 99 ) + 1	-- ���� 1~100 ���ü�
				    if ( RND >  0 and RND <= 45 ) then
					CastSpell( OwnerID(), AttackTarget, FirstMagicID )
				elseif ( RND > 60 and RND <= 85 ) then
					if ( CastSpellLV( OwnerID(), AttackTarget, thirdMagicID , thirdMagicLV ) ) then
					Say( OwnerID(), GetString("MT_ANKARIA4") )
						Say( OwnerID(), GetString("MT_ANKARIA5") )
						Sleep( 100 )
					end
				end
			end

			local NowHP = ReadRoleValue(  OwnerID() , EM_RoleValue_HP )
			local HPPercent = NowHP / MaxHP

			-- �԰��}�l�s��
			if (FTM == "NoCall" ) then	FTM, Monster1 = CallMonsterAtFightStart( OwnerID() , AttackTarget , MonsterID , MonsterNumber1 , GetString("MT_ANKARIA1") )	end
			-- �� 1/2 �s��
			if ( HPPercent <= 0.5 ) and (F2M == "NoCall" ) then	F2M, Monster2 = CallMonsterAtFightStart( OwnerID() , AttackTarget , MonsterID , MonsterNumber2 , GetString("MT_ANKARIA1") )	end
			-- �� 1/4 �s��
			if ( HPPercent <= 0.25 ) and (F4M == "NoCall" ) then	F4M, Monster3 = CallMonsterAtFightStart( OwnerID() , AttackTarget , MonsterID , MonsterNumber3 , GetString("MT_ANKARIA1") )	end

			-- �� 1/2 �s�Ǹɦ�
			if (HPM2 == "NoCall" ) then	HPM2 = CallMonsterForRecovery( OwnerID() , 0.5 , 102807, 493997 , "Yes" , GetString("MT_ANKARIA2") , HPMonsterNumber , GetString("MT_ANKARIA3") )	end
			-- �� 1/4 �s�Ǹɦ�
			if (HPM4 == "NoCall" ) then	HPM4 = CallMonsterForRecovery( OwnerID() , 0.25 , 102807, 493997 , "Yes" , GetString("MT_ANKARIA2") , HPMonsterNumber , GetString("MT_ANKARIA3")  )	end
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
			--Say( OwnerID(), "NoFight n = "..n )

			FTM = "NoCall"		-- �D�԰��A�k�s�O��
			F2M = "NoCall"		-- �D�԰��A�k�s�O��
			F4M = "NoCall"		-- �D�԰��A�k�s�O��
			HPM2 = "NoCall"		-- �D�԰��A�k�s�O��
			HPM4 = "NoCall"		-- �D�԰��A�k�s�O��


			for i = 1, table.getn( Monster1 ) do	-- ���}�԰��ɡA�R���i�J�԰��ɥs�X�Ӫ��ͧ�
				if ( ( Monster1[i] ~= nil ) and ( CheckID( Monster1[i] ) == true ) ) then		DelObj( Monster1[i] )	end
			end
			for i = 1, table.getn( Monster2 ) do	-- ���}�԰��ɡA�R���i�J�԰��ɥs�X�Ӫ��ͧ�
				if ( ( Monster2[i] ~= nil ) and ( CheckID( Monster2[i] ) == true ) ) then		DelObj( Monster2[i] )	end
			end
			for i = 1, table.getn( Monster3 ) do	-- ���}�԰��ɡA�R���i�J�԰��ɥs�X�Ӫ��ͧ�
				if ( ( Monster3[i] ~= nil ) and ( CheckID( Monster3[i] ) == true ) ) then		DelObj( Monster3[i] )	end
			end

			if ( Monster1 ~= nil ) then	Monster1 = {}	end
			if ( Monster2 ~= nil ) then	Monster2 = {}	end
			if ( Monster3 ~= nil ) then	Monster3 = {}	end

		end

	Sleep( CheckTime )
	end
end


------------------------------------------------------------
------�ڹ�Boss-----���_�k��--------------
-----�O�d�ޯ�----�Ԧ^�B�k�����u 

function Lua_apon_102852_dreamking()
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
		local skill_1 = 494309 ---�k���l�O
		local skill_2 = 494308 --- ���i���R
		local skill_3 = 494310 --- �����ˤf
		
		local counter1 = 0
		local counter2 = 0
		local counter3 = 0
		local counter4 = 0
		local counter5 = 0
		sleep(10)
		while 1 do
			sleep(10)
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
			local BossTarget = AttackTarget
			--if ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then
			if HateListCount( OwnerID() ) ~= 0 then
				local partymember = LuaFunc_PartyData( AttackTarget)				
				sleep(10)
				counter1 = counter1 + 1		
				counter2 = counter2 + 1
				counter3 = counter3 + 1
				--counter4 = counter4 + 1
				--counter5 = counter5 + 1
				Check_life = 1
				if counter1 >= 8 then
					CastSpellLV( OwnerID() , OwnerID() , skill_2 , 29 ) ---���i���R
					SetFightMode ( OwnerID(),1, 0, 0,1 ) --�ت������L��]���
					sleep(10)
					SetFightMode ( OwnerID(),1, 1, 1,1 )
					sleep(10)
					counter1 = 0
							
				elseif counter2 >= 12 then
					CastSpellLV( OwnerID() , OwnerID() , skill_1 , 70 ) --�k���l�O
					sleep(50)
					counter2 = 0
				
				elseif counter3 >= 10 then
					for i = 1 , 3 , 1 do 
						--say(OwnerID(),i)
						BossTarget = HateTargetID() ---��������H���@�ӥؼ�
						CastSpellLV( OwnerID() , BossTarget , skill_3 , 49 )
						sleep(10)
					end
					sleep(10)
					counter3 = 0
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
			end
		end
	end
end				
	

------------------------------------------------------------
------�ڹ�Boss-----�B�G����--------------
-----�O�d�ޯ�----�ܨ� 	

function Lua_apon_102851_dreamking()
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
	AddBuff( OwnerID() , 503399 , 1 , -1 )
	--SetModeEX( OwnerID() , EM_SetModeType_Move , false )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Count = 0
	local Timer = 0
	local Pos = {}
	local Orb = {}
	local NowTarget
	local BurnOut = 0
	local Reset = 0
	while 1 do
		Count = HateListCount( OwnerID() )
		if Count > 0 then
			Check_life = 1
			
			if Reset == 0 then
				Reset = 1 
			end 
			NowTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
			
			if ( Timer == 8 or Timer == 18 or Timer == 28 or Timer == 38 or Timer == 48 ) then
				
				local Target = {}
				
				for i = 0 , Count - 1 , 1 do
					local Player = HateListInfo(OwnerID() ,i , EM_HateListInfoType_GItemID )
					if ReadRoleValue( Player , EM_RoleValue_IsDead ) == 0 and CheckBuff( Player , 503103 ) == false then
						table.insert(Target, Player)
					end
				end
				
				local n = DW_Rand( table.getn(Target) )
				if Target[n] ~= nil and  CheckID( Target[n] ) == true  then
					CastSpellLV( OwnerID() , Target[n] , 492848 , 200 ) --���F�̰�
				end
				
				Timer = Timer + 2
			else
				if DW_Rand( 1000 ) > 150 and BurnOut ~= 1 then
					CastSpellLV( OwnerID() , OwnerID() , 492847 , 1300 ) --���j�����N�쥻200�ק令1300 
				end
			end
			Timer = Timer + 1
			if Timer > 60 then
				Timer = 1
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
							DeBugMsg(0,0,"ID ="..ID[i])
							DeBugMsg(0,0,"PPLX = "..PPLX)
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
			if Reset == 1 then
				Timer = 0
				BurnOut = 0
				Lua_CancelAllBuff( OwnerID() ) 
				Reset  = 0
				AddBuff( OwnerID() , 503399 , 1 , -1 )
			end
		end
		sleep( 10 )
	end
end