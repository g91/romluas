----------------------------------------------------------BOSS�ů���
function lua_Dy_Z190_WWBOSSAI()
	--while 1 do 
		--sleep(10)
		local counter1 = 0 ----------�@��ޯ�p�ɾ�
		local fight = 0 --�}�Ԧr��}��
		--local counter2 = 0 ---------AE�p�ɾ�
		local skill = {496401 , 496402 , 496403 , 496400 } ------------����ˮ` 150AE ���Z��AE100 15S�|�s��
		local skillspeak = {0 , 0 , 0 , "[SC_104903_01"}
		local skillLV = { 0 , 0 , 0 , 0 }
		local skilluse = 0
		local Luck
		local CH1 = ReadRoleValue( OwnerID() , EM_RoleValue_PID )  --Ū�X�����ID
		--local CH1T = 0 --- ���q
		local roomid = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) --Ū�X����b���@�h
		local CombatBegin = 0 --BOSS���԰��}���ܼ�
		--AddBuff ( OwnerID() , 507951, 0 , -1 )
		while 1 do 
			sleep(10) 
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID ) --Ū���b�������ؼ�
			if  ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then	
				CancelBuff( OwnerID(),  507951 )
				--CH1T = ReadRoleValue( OwnerID() , EM_RoleValue_Register1 ) --Ū�X�Ĥ@�ӼȦs������
				counter1 = counter1 + 1
				if fight == 0 then
					ScriptMessage( OwnerID(), -1 , 2 , "[SC_104903_02] " , 2 )
					fight = 1 
				elseif fight ~= 0 then
					
				end
				--counter2 = counter2 + 1
				--say (OwnerID(), "counter1 = "..counter1)
				--say (OwnerID(), "counter2 = "..counter2)
				CombatBegin = 1 --��ܥ��b�԰���
				WriteRoleValue( CH1, EM_RoleValue_Register2, 1)
				if counter1 == 7 then
					Luck = Rand( 100 ) --�ۦ��ü�
						
					if (Luck >=0 and Luck <40) then 
						skilluse = 1
						BOSSTarget = AttackTarget
						CastSpellLV( OwnerID() , BOSSTarget , skill[skilluse] , skillLV[skilluse] )
						--say(OwnerID(),"01")
					elseif (Luck >=40 and Luck <=70) then
						skilluse = 2
						BOSSTarget = AttackTarget
						CastSpellLV( OwnerID() , BOSSTarget , skill[skilluse] , skillLV[skilluse] )
						--say(OwnerID(),"02")
					elseif (Luck >=70 and Luck <=100) then  --random range : 150~300
						local Play_Chose = {}               --newhatelistcount
						local Play_Chose2 = {}              --boss's hatelistcount 
						local Play_Chose1 = {}    -->150
						local Play_Chose1_2 = {}  --<150
						Play_Chose2 = DW_HateRemain(0)
						Play_Chose =KS_RegroupArray( Play_Chose2, num )
						if table.getn(Play_Chose)<7 then    --if boss's hatelistcount <7
							--say(OwnerID(),"player<6")
							for i=1 , table.getn(Play_Chose) do --get table(Play_Chose)'s number
								sysCastSpelllv(OWnerID(),Play_Chose[i],496403,0)
							end
						else
							for i=1 , table.getn(Play_Chose) , 1 do
									if CheckID(Play_Chose[i]) == true and
									ReadRoleValue( Play_Chose[i] ,EM_RoleValue_IsDead) == 0 and
									ReadRoleValue( Play_Chose[i] , EM_RoleValue_VOC ) > 0 and
									GetDistance( OwnerID(), Play_Chose[i])>150 and
									GetDistance( OwnerID(), Play_Chose[i])<500 then
										table.insert(Play_Chose1, Play_Chose[i])
									end
									if CheckID(Play_Chose[i]) == true and
									ReadRoleValue( Play_Chose[i] ,EM_RoleValue_IsDead) == 0 and
									ReadRoleValue( Play_Chose[i] , EM_RoleValue_VOC ) > 0 and
									GetDistance( OwnerID(), Play_Chose[i])<150 then
										table.insert(Play_Chose1_2, Play_Chose[i])
									end
							end
							if table.getn(Play_Chose1)>5 then
								for i=1 , table.getn(Play_Chose1) do --get table(Play_Chose)'s number
									sysCastSpelllv(OWnerID(),Play_Chose1[i],496403,0)
								end
							else
								for i=1 ,table.getn(Play_Chose1_2) do
									table.insert(Play_Chose1, Play_Chose1_2[i])
								end
								for i=1 , table.getn(Play_Chose1) do --get table(Play_Chose)'s number
									sysCastSpelllv(OWnerID(),Play_Chose1[i],496403,0)
								end
							end	
							
							--[[if table.getn(Play_Chose)<6 then    --if boss's hatelistcount <6
							--say(OwnerID(),"player<6")
							for i=1 , table.getn(Play_Chose) do --get table(Play_Chose)'s number
								sysCastSpelllv(OWnerID(),Play_Chose[i],496403,0)
							end
						else 
							say(OwnerID(),"player>6")
							for i=1 , table.getn(Play_Chose) do --get table(Play_Chose)'s number
								if table.getn(Play_Chose1)<6 then                        --�������H�~���
									if CheckID(Play_Chose[i]) == true and
									ReadRoleValue( Play_Chose[i] ,EM_RoleValue_IsDead) == 0 and
									ReadRoleValue( Play_Chose[i] , EM_RoleValue_VOC ) > 0 and
									GetDistance( OwnerID(), Play_Chose[i])>150 then
										table.insert(Play_Chose1, Play_Chose[i])         --�d�򤺥�itable.Play_Chose1
										
										--table.remove(Play_Chose,i)                       --��itable.Play_Chose1����������table
									end
									--say(Play_Chose1[i],"playerout = "..i)
								end
							end
							--say(OwnerID(),"playernum = "..table.getn(Play_Chose1))
							if table.getn(Play_Chose1)<6 then                            --�짹150�H�~���b�P�_�O�_�w�g�����H
								for i=table.getn(Play_Chose1) , table.getn(Play_Chose) do
									if table.getn(Play_Chose1)<6 then
										table.insert(Play_Chose1, Play_Chose[i])
										--say(Play_Chose1[i],"playerin = "..i)
									end
								end
							end
							for i=1 , table.getn(Play_Chose1) do --get table(Play_Chose)'s number
								sysCastSpelllv(OWnerID(),Play_Chose1[i],496403,0)
							end
						end--]]
						
						end	
						
					end	
				elseif counter1 == 14 then
					Luck = Rand( 100 ) --�ۦ��ü�
					
					if (Luck >=0 and Luck <40) then 
						skilluse = 1
						BOSSTarget = AttackTarget
						CastSpellLV( OwnerID() , BOSSTarget , skill[skilluse] , skillLV[skilluse] )
						--say(OwnerID(),"01")
					elseif (Luck >=40 and Luck <=70) then
						skilluse = 2
						BOSSTarget = AttackTarget
						CastSpellLV( OwnerID() , BOSSTarget , skill[skilluse] , skillLV[skilluse] )
						--say(OwnerID(),"02")
					elseif (Luck >=70 and Luck <=100) then 
						local Play_Chose = {}               --newhatelistcount
						local Play_Chose2 = {}              --boss's hatelistcount 
						local Play_Chose1 = {}    -->150
						local Play_Chose1_2 = {}  --<150
						Play_Chose2 = DW_HateRemain(0)
						Play_Chose =KS_RegroupArray( Play_Chose2, num )
						if table.getn(Play_Chose)<7 then    --if boss's hatelistcount <7
							--say(OwnerID(),"player<6")
							for i=1 , table.getn(Play_Chose) do --get table(Play_Chose)'s number
								sysCastSpelllv(OWnerID(),Play_Chose[i],496403,0)
							end
						else
							for i=1 , table.getn(Play_Chose) , 1 do
									if CheckID(Play_Chose[i]) == true and
									ReadRoleValue( Play_Chose[i] ,EM_RoleValue_IsDead) == 0 and
									ReadRoleValue( Play_Chose[i] , EM_RoleValue_VOC ) > 0 and
									GetDistance( OwnerID(), Play_Chose[i])>150 and
									GetDistance( OwnerID(), Play_Chose[i])<500 then
										table.insert(Play_Chose1, Play_Chose[i])
									end
									if CheckID(Play_Chose[i]) == true and
									ReadRoleValue( Play_Chose[i] ,EM_RoleValue_IsDead) == 0 and
									ReadRoleValue( Play_Chose[i] , EM_RoleValue_VOC ) > 0 and
									GetDistance( OwnerID(), Play_Chose[i])<150 then
										table.insert(Play_Chose1_2, Play_Chose[i])
									end
							end
							if table.getn(Play_Chose1)>5 then
								for i=1 , table.getn(Play_Chose1) do --get table(Play_Chose)'s number
									sysCastSpelllv(OWnerID(),Play_Chose1[i],496403,0)
								end
							else
								for i=1 ,table.getn(Play_Chose1_2) do
									table.insert(Play_Chose1, Play_Chose1_2[i])
								end
								for i=1 , table.getn(Play_Chose1) do --get table(Play_Chose)'s number
									sysCastSpelllv(OWnerID(),Play_Chose1[i],496403,0)
								end
							end	
						end	
						
					end
				elseif counter1 >= 15 then --��X�|�s��
					while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
					sleep(2)
					end			
			    	--say(OwnerID(),"7")
					ScriptMessage( OwnerID(), -1 , 2 , "[SC_104903_01]" , 2 )---------------�S���H�i�H�b�߱ڼ���U�ͦs�C---�j����
					sleep(20)
					PlayMotion ( OwnerID(),ruFUSION_ACTORSTATE_SLEEP_BEGIN	 )---------------��1�|�ʧ@
					---say(OwnerID(),"[SC_104108_02]")
					SetModeEx( OwnerID() , EM_SetModeType_Fight, false) ---���i���
					SetModeEx( OwnerID() , EM_SetModeType_Move, false) ---����	
					sleep(5)
					SetIdleMotion( OwnerID() ,ruFUSION_ACTORSTATE_SLEEP_LOOP	)-----------------------�����ʧ@
					CastSpellLV( OwnerID() , OwnerID()  , 496400 , 0 )
					sleep(30)
					while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
						sleep(2)
					end			
					PlayMotion ( OwnerID(), ruFUSION_ACTORSTATE_SLEEP_END )---------------------����U��
					SetModeEx( OwnerID() , EM_SetModeType_Fight, true) ---�i���
					SetModeEx( OwnerID() , EM_SetModeType_Move, true) ---����	
					SetIdleMotion( OwnerID() ,  ruFUSION_ACTORSTATE_NORMAL)--------�O���a�U�Ҧ�
					counter1 = 0
				end
			else
				if CombatBegin == 1 then --��BOSS�٦s�b�� ���a����---���s����BOSS
					fight = 0 
					WriteRoleValue( CH1, EM_RoleValue_Register2, 2)
				end
			end		
		end			
	    
end

-------------------------------------------BOSS���`�@��
function lua_Dy_Z190_WWBOSSAI_DIE()----BOSS���`�@��
	local CH1 = ReadRoleValue( OwnerID() , EM_RoleValue_PID )  --Ū�X�����ID
	ScriptMessage( OwnerID(), -1 , 2 , "[SC_104903_03] " , 2 )
	WriteRoleValue( CH1, EM_RoleValue_Register2, 3)
	WriteRoleValue( CH1, EM_RoleValue_Register3, 1) -- �^�Ǧ��`���T�����@��1������
end
----------------------------------------------------------BOSS�ů��Ա��
function lua_Dy_Z190_WWBOSSAIC()----���
	local roomid = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) --Ū�X����b���@�h
	local Boss = CreateObjByFlag( 104903 , 780696 , 1 , 1 ) ---�ͥXBoss (BOSS�s��  ,�X�нs�� ��N���X�� �ͥX�X�ө�)
	local BossRange = CreateObjByFlag( 105071 , 780696 , 1 , 1 ) --�ͥX�q�PBOSS�Z�����z���y
		SetModeEx( BossRange , EM_SetModeType_Show, true) ----�q�X
		SetModeEx( BossRange , EM_SetModeType_Mark, false) ----�аO
		SetModeEx( BossRange , EM_SetModeType_Strikback, false) ---����
		SetModeEx( BossRange , EM_SetModeType_Move, false) ---����	
		SetModeEx( BossRange , EM_SetModeType_Fight, false) ---�i���
		SetModeEx( BossRange , EM_SetModeType_SearchenemyIgnore, true) ---���󤣷|�Q�j�M
		SetModeEx( BossRange , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
		SetModeEx( BossRange , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
		SetModeEx( BossRange , EM_SetModeType_Searchenemy, false)  ---����
		SetModeEx( BossRange  , EM_SetModeType_Obstruct, false )--����
	local timeup --Ū���p�¦^�Ǫ�REGEST3
	local Far 
	WriteRoleValue( Boss, EM_RoleValue_PID, OwnerID())
	WriteRoleValue( OwnerID(), EM_RoleValue_Register1, Boss)
	WriteRoleValue( Boss, EM_RoleValue_Register9, BossRange)
	AddToPartition( Boss,roomid )
	WriteRoleValue( BossRange, EM_RoleValue_PID, OwnerID())
	WriteRoleValue( OwnerID(), EM_RoleValue_Register4, BossRange)
	WriteRoleValue( BossRange, EM_RoleValue_Register9, Boss)
	AddToPartition( BossRange,roomid )
	AddBuff ( Boss, 507951, 0 , -1 )
	setplot( Boss , "dead" , "lua_Dy_Z190_WWBOSSAI_DIE", 0)
	BeginPlot( Boss, "lua_Dy_Z190_WWBOSSAI", 10) ---Boss���԰�Function (  BOSS BOSS��LUA_AI  ��\�C10=1��)
	BeginPlot( BossRange, "lua_Dy_Z190_WWBOSSCheck", 10) --�y���q�Z��AI
	--say(OwnerID(),"123")
	while 1 do
	--say(OwnerID(),"456")
		sleep(10)
		Far = ReadRoleValue( OwnerID() , EM_RoleValue_Register5 ) --Ū���Z�����Ȧs��
		timeup =  ReadRoleValue( OwnerID() , EM_RoleValue_Register3 )
		if timeup ==2 then --2 = �@�ɾԳ��԰��ɶ�����
			delobj(Boss)
			delobj(BossRange)
			delobj(OwnerID())
		end
		local BOSSDO = ReadRoleValue( OwnerID(), EM_RoleValue_Register2)
		
		if BOSSDO == 1 then--BOSS�԰���
			if Far < 500 then			
			elseif Far > 500 then
				--say(Boss , "Far "..Far)
				local BossIsDead = ReadRoleValue( OwnerID() , EM_RoleValue_register1 )
				if BossIsDead ~= 1 then
					if Boss ~= nil then
						DelObj( Boss )
						DelObj( BossRange )
					end			
				sleep(50)
				Boss = CreateObjByFlag( 104903 , 780696 , 1 , 1 )
				BossRange = CreateObjByFlag( 105071 , 780696 , 1 , 1 )
				
				SetModeEx( BossRange , EM_SetModeType_HideName, true )			--�W��
				SetModeEx( BossRange , EM_SetModeType_ShowRoleHead, false )		--���q�Y����
				SetModeEx( BossRange , EM_SetModeType_Mark, false )				--�аO
				SetModeEx( BossRange , EM_SetModeType_Move , false )				--������
				SetModeEx( BossRange , EM_SetModeType_Searchenemy , false )		--������
				SetModeEx( BossRange , EM_SetModeType_Fight , false )			--�i�������
				SetModeEx( BossRange , EM_SetModeType_Strikback, false )			--����
				SetModeEx( BossRange , EM_SetModeType_NotShowHPMP , false )		--��show���
				
				AddToPartition( Boss , roomid )
				AddToPartition( BossRange , roomid )
				AddBuff ( Boss, 507951, 0 , -1 )
				WriteRoleValue( Boss, EM_RoleValue_PID, OwnerID())
				WriteRoleValue( OwnerID(), EM_RoleValue_Register1, Boss)
				WriteRoleValue( Boss , EM_RoleValue_Register9, BossRange )
				WriteRoleValue( BossRange, EM_RoleValue_PID, OwnerID())
				WriteRoleValue( OwnerID(), EM_RoleValue_Register4, BossRange)
				WriteRoleValue( BossRange, EM_RoleValue_Register9, Boss)

				setplot( Boss , "dead" , "lua_Dy_Z190_WWBOSSAI_DIE", 0)
				BeginPlot( Boss, "lua_Dy_Z190_WWBOSSAI", 10) ---Boss���԰�Function (  BOSS BOSS��LUA_AI  ��\�C10=1��)
				BeginPlot( BossRange, "lua_Dy_Z190_WWBOSSCheck", 10) --�y���q�Z��AI
				
			elseif BossIsDead == 1 then	
				WriteRoleValue( OwnerID() , EM_RoleValue_register2 , 3 )
				--DelObj( BossRange )
				return
			end
			BOSSDO = 0
			WriteRoleValue( OwnerID() , EM_RoleValue_register2 , BOSSDO )
		end
		elseif BOSSDO == 2 then --�����}�԰�
			delobj (Boss)
			delobj (BossRange)
			sleep(50)
			Boss = CreateObjByFlag( 104903 , 780696 , 1 , 1 )
			BossRange = CreateObjByFlag( 105071 , 780696 , 1 , 1 )
			
			SetModeEx( BossRange , EM_SetModeType_HideName, true )			--�W��
			SetModeEx( BossRange , EM_SetModeType_ShowRoleHead, false )		--���q�Y����
			SetModeEx( BossRange , EM_SetModeType_Mark, false )				--�аO
			SetModeEx( BossRange , EM_SetModeType_Move , false )				--������
			SetModeEx( BossRange , EM_SetModeType_Searchenemy , false )		--������
			SetModeEx( BossRange , EM_SetModeType_Fight , false )			--�i�������
			SetModeEx( BossRange , EM_SetModeType_Strikback, false )			--����
			SetModeEx( BossRange , EM_SetModeType_NotShowHPMP , false )		--��show���
				
			AddToPartition( Boss , roomid )
			AddToPartition( BossRange , roomid )
			AddBuff ( Boss, 507951, 0 , -1 )
			WriteRoleValue( Boss, EM_RoleValue_PID, OwnerID())
			WriteRoleValue( OwnerID(), EM_RoleValue_Register1, Boss)
			WriteRoleValue( Boss , EM_RoleValue_Register9, BossRange )
			WriteRoleValue( BossRange, EM_RoleValue_PID, OwnerID())
			WriteRoleValue( OwnerID(), EM_RoleValue_Register4, BossRange)
			WriteRoleValue( BossRange, EM_RoleValue_Register9, Boss)

			setplot( Boss , "dead" , "lua_Dy_Z190_WWBOSSAI_DIE", 0)
			BeginPlot( Boss, "lua_Dy_Z190_WWBOSSAI", 10) ---Boss���԰�Function (  BOSS BOSS��LUA_AI  ��\�C10=1��)
			BeginPlot( BossRange, "lua_Dy_Z190_WWBOSSCheck", 10) --�y���q�Z��AI
			BOSSDO = 0
			WriteRoleValue( OwnerID(), EM_RoleValue_Register2, BOSSDO)
		elseif BOSSDO == 3 then --BOSS���`
			delobj (BossRange)
			--delobj (OwnerID())
		end
		
	end
end	
function lua_Dy_Z190_WWBOSSCheck()
	local roomid = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local CH1 = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local Boss = ReadRoleValue( OwnerID() , EM_RoleValue_Register9 )
	local Far = GetDistance( OwnerID(), Boss )
	while 1 do
		Far= GetDistance( OwnerID(), boss )

		sleep (10)
		WriteRoleValue ( CH1 , EM_RoleValue_Register5 , Far )		
	end
end