function Dy_Z19_BOSSN_AI()
local Time01 = 0 --���ۭp�ɾ�
local Time02 = 0 --�йv�p�ɾ�
local Time03 = 0 --�j��AE�p�ɾ�
local Time04 = 0 --�R�����W���󪺭p�ɾ�
local bluebox = {}
local redbox = {}
local yellowbox = {}
local dart = {}
local skill = {496861 , 496864 , 496865 } ------------���M�ˮ` ��Z��AE80 �e�记�ζˮ`
local skillspeak = {0 , 0 , 0 , 0}
local skillLV = { 0 , 0 , 0 , 0 }
local skilluse = 0
local Luck
local Luck2
local BL
local PL
local RL
local Boss25 = 0 --25���I���l�P�w��
local CH1 = ReadRoleValue( OwnerID() , EM_RoleValue_PID )  --Ū�X�����ID
local roomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID ) --Ū�XBoss�b���@�h
local dart_1 = ReadRoleValue( OwnerID() , EM_RoleValue_Register3 ) --Ū�X�йv�z���y1
local dart_2 = ReadRoleValue( OwnerID() , EM_RoleValue_Register4 ) --Ū�X�йv�z���y2
local collect = {dart_1 , dart_2}
local FightON = 0 --�԰��}��
	while 1 do 
	sleep(10)
	local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID ) --Ū���b�������ؼ�
		if  AttackTarget ~= 0  and ( CheckID( OwnerID() ) ) == true then	--�p�G�ؼФH��>0�A�ӥB�ۤv�s�b�ɡA�P�w�i�J�԰�
			FightON = 1 --��ܥ��b�԰���
			Time01 = Time01 + 1
			if Boss25 ~= 0  then --�p�GBoss25�P�_������0 �hTime02 =26
				Time02 = 26
			elseif Boss25 == 0 then --�p�GBoss25�P�_����0 �ATime02�~��p��ɶ�
				Time02 = Time02 + 1
			end
			Time03 = Time03 + 1
			
			--say (OwnerID(), "counter1 = "..Time01)
			--say (OwnerID(), "counter2 = "..Time02)
			--say (OwnerID(), "counter3 = "..Time03)
			WriteRoleValue( CH1, EM_RoleValue_Register2, 1) --�^�Ǳ�����w�g�b�԰����F
		
				if Time03 == 40 then --���i�����j��
					ScriptMessage( OwnerID(), -1 , 2 , "[SC_105200_10] " , 2 )
					sleep(20)
					CastSpellLV( OwnerID() , OwnerID() , 496860 , 0 ) --�I��j���A�ˮ`���Ť��ݭn�վ�
					Time03 =0
					sleep(10)
				end
				
				if Time02 == 26 then --�ˬd�����W���L�E�c���ˬd
					if CheckBuff( OwnerID() ,  508612 ) == true then --�p�G�ˬd������W����Buff �h���򳣤���
					
					elseif CheckBuff( OwnerID() ,  508612 ) == false then --�p�G�S�����ܡA����H�U�Ʊ�
						if Boss25 == 1 then --�I���Ŧ⥼�I�ˮ`
							while ReadRoleValue(OwnerID(),EM_RoleValue_SpellMagicID)~=0 do
							sleep(2)
							end
							CastSpellLV( OwnerID() , OwnerID(), 497518 , 0 )
							--CancelBuff( TargetID() ,  508607 ) ----�R���E�c���ˬd
							
							Time02 = 0
							Boss25 = 0 --25���I���l�P�_��0
							WriteRoleValue( CH1, EM_RoleValue_Register2, 4) --�^�Ǿ԰��������ζˮ`�Ӵ��F
							--�R�����l
							delobj(bluebox)
							delobj(redbox)
							delobj(yellowbox)
							for i=1 , 2 do --�R�����йv
								delobj(dart[i])
							end

						elseif Boss25 == 2 then --�I�񵵦⥼�I�ˮ`
							while ReadRoleValue(OwnerID(),EM_RoleValue_SpellMagicID)~=0 do
							sleep(2)
							end
							CastSpellLV( OwnerID() , OwnerID() , 497520 , 0 )
							--CancelBuff( TargetID() ,  508607 ) ----�R���E�c���ˬd
							
							Time02 = 0
							Boss25 = 0 --25���I���l�P�_��0
							WriteRoleValue( CH1, EM_RoleValue_Register2, 4) --�^�Ǿ԰��������ζˮ`�Ӵ��F
							--�R�����l
							delobj(bluebox)
							delobj(redbox)
							delobj(yellowbox)
							for i=1 , 2 do --�R�����йv
								delobj(dart[i])
							end		
		
						elseif Boss25 == 3 then --�I��������I�ˮ`
							while ReadRoleValue(OwnerID(),EM_RoleValue_SpellMagicID)~=0 do
							sleep(2)
							end
							CastSpellLV( OwnerID() , OwnerID() , 497519 , 0 )
							--CancelBuff( TargetID() ,  508607 ) ----�R���E�c���ˬd
							
							Time02 = 0
							Boss25 = 0 --25���I���l�P�_��0
							WriteRoleValue( CH1, EM_RoleValue_Register2, 4) --�^�Ǿ԰��������ζˮ`�Ӵ��F
							--�R�����l
							delobj(bluebox)
							delobj(redbox)
							delobj(yellowbox)
							for i=1 , 2 do --�R�����йv
								delobj(dart[i])

							end	
						end
					end
				end

				if Time02 == 25 then --�g��v�I���l
					while ReadRoleValue(OwnerID(),EM_RoleValue_SpellMagicID)~=0 do
						sleep(2)
					end
					local boxflag = 780845
					local durtflag = 780696
						--�إX2�Ӽйv
						for i = 1 , 2 , 1 do
							dart[i] = CreateObjByFlag( 105202 , 780859 , i , 1 ) --780859 �йv�X��
							SetModeEx( dart[i] , EM_SetModeType_HideName, false )			--�W��
							SetModeEx( dart[i] , EM_SetModeType_ShowRoleHead, false )		--���q�Y����
							SetModeEx( dart[i] , EM_SetModeType_Mark, true )				--�аO
							SetModeEx( dart[i] , EM_SetModeType_Move , false )				--������
							SetModeEx( dart[i] , EM_SetModeType_Searchenemy , false )		--������
							SetModeEx( dart[i] , EM_SetModeType_Fight , false )			--�i�������
							SetModeEx( dart[i] , EM_SetModeType_Strikback, false )			--����
							SetModeEx( dart[i] , EM_SetModeType_NotShowHPMP , false )		--��show���
							AddToPartition( dart[i] , roomID )
						end
						
					--�����t+�۸�
					ScriptMessage( OwnerID(), -1 , 2 , "[SC_105200_02] " , 2 )
					sleep(10)
					SetModeEx( OwnerID() , EM_SetModeType_Fight, false) ---���i���
					SetModeEx( OwnerID() , EM_SetModeType_Move, false) ---����	
					CastSpellLV( OwnerID() , OwnerID() , 497015 , 0 )
					sleep(35)
					for i = 1 , 2 , 1 do
						sysCastSpellLV( OwnerID() , collect[i] , 497015 , 0 )
						--say(OwnerID() , "kuku")
					end
					sleep(10)
					SetModeEx( OwnerID() , EM_SetModeType_Fight, true) ---�i���
					SetModeEx( OwnerID() , EM_SetModeType_Move, true) ---����	
					SetIdleMotion( OwnerID() ,  ruFUSION_ACTORSTATE_NORMAL)--------�O���a�U�Ҧ�					

					local BLF
					BL = Rand(3)
						if BL == 1 then
							BLF = 1
						elseif BL == 2 then
							BLF = 2
						elseif BL == 0 or BL == 3 then
							BLF = 3
						end
						--say (OwnerID() , "BL = " ..BL)
						bluebox = CreateObjByFlag( 117261 , boxflag , BLF , 1 ) --780859 �йv�X��
						SetModeEx( bluebox , EM_SetModeType_HideName, false )			--�W��
						SetModeEx( bluebox , EM_SetModeType_ShowRoleHead, false )		--���q�Y����
						SetModeEx( bluebox , EM_SetModeType_Mark, true )				--�аO
						SetModeEx( bluebox , EM_SetModeType_Move , false )				--������
						SetModeEx( bluebox , EM_SetModeType_Searchenemy , false )		--������
						SetModeEx( bluebox , EM_SetModeType_Fight , false )			--�i�������
						SetModeEx( bluebox , EM_SetModeType_Strikback, false )			--����
						SetModeEx( bluebox , EM_SetModeType_NotShowHPMP , false )		--��show���
						AddToPartition( bluebox , roomID )
						AddBuff ( bluebox , 509345, 0, -1 ) --ADD�L�Ī�Buff 
						SetPlot( bluebox ,"touch","Dy_Z19_BOSSN_BLUE", 50 ) --��J�Ų��lĲ�I�@��
					
					local PLF
					PL = Rand(3)
						if PL == 1 then
							PLF = 4
						elseif PL == 0 or PL == 2 then
							PLF = 5
						elseif PL == 3 then
							PLF = 6
						end
						--say (OwnerID() , "PL = " ..PL)
						redbox = CreateObjByFlag( 117262 , boxflag , PLF , 1 ) --780859 �йv�X��
						SetModeEx( redbox , EM_SetModeType_HideName, false )			--�W��
						SetModeEx( redbox , EM_SetModeType_ShowRoleHead, false )		--���q�Y����
						SetModeEx( redbox , EM_SetModeType_Mark, true )				--�аO
						SetModeEx( redbox , EM_SetModeType_Move , false )				--������
						SetModeEx( redbox , EM_SetModeType_Searchenemy , false )		--������
						SetModeEx( redbox , EM_SetModeType_Fight , false )			--�i�������
						SetModeEx( redbox , EM_SetModeType_Strikback, false )			--����
						SetModeEx( redbox , EM_SetModeType_NotShowHPMP , false )		--��show���
						AddToPartition( redbox , roomID )
						AddBuff ( redbox , 509345, 0, -1 ) --ADD�L�Ī�Buff 
						SetPlot( redbox ,"touch","Dy_Z19_BOSSN_RED", 50 ) --��J�����lĲ�I�@��
					
					local RLF					
					RL = Rand(3)
						if RL == 0 or RL == 1 then
							RLF = 7
						elseif RL == 2 then
							RLF = 8
						elseif RL == 3 then
							RLF = 9
						end
						--say (OwnerID() , "RL = " ..RL)
						yellowbox = CreateObjByFlag( 117263 , boxflag , RLF , 1 ) --780859 �йv�X��
						SetModeEx( yellowbox , EM_SetModeType_HideName, false )			--�W��
						SetModeEx( yellowbox , EM_SetModeType_ShowRoleHead, false )		--���q�Y����
						SetModeEx( yellowbox , EM_SetModeType_Mark, true )				--�аO
						SetModeEx( yellowbox , EM_SetModeType_Move , false )				--������
						SetModeEx( yellowbox , EM_SetModeType_Searchenemy , false )		--������
						SetModeEx( yellowbox , EM_SetModeType_Fight , false )			--�i�������
						SetModeEx( yellowbox , EM_SetModeType_Strikback, false )			--����
						SetModeEx( yellowbox , EM_SetModeType_NotShowHPMP , false )		--��show���
						AddToPartition( yellowbox , roomID )
						AddBuff ( yellowbox , 509345, 0, -1 ) --ADD�L�Ī�Buff 
						SetPlot( yellowbox ,"touch","Dy_Z19_BOSSN_YELLOW", 50 ) --��J�����lĲ�I�@��
					
					Luck2 = Rand(30)
					while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
					sleep(2)
					end
					if Luck2 >= 0 and Luck2 <= 5 then
						ScriptMessage( OwnerID(), -1 , 2 , "[SC_105200_03]" , 2 )
						CastSpellLV( OwnerID() , OwnerID() , 496867 , 0 ) --�I���Ŧ��ˬd��Buff
						AddBuff ( OwnerID()  , 508612, 0, 8 )
						Boss25 = 1 --25���I�Ų��l�P�_��1
						sleep(15)
					elseif Luck2 >5 and Luck2 <= 10 then
						ScriptMessage( OwnerID(), -1 , 2 , "[SC_105200_04]" , 2 )
						CastSpellLV( OwnerID() , OwnerID() , 496868 , 0 ) --�I�񵵦��ˬd��Buff
						AddBuff ( OwnerID()  , 508612, 0, 8 )
						Boss25 = 2 --25���I�����l�P�_��2
						sleep(15)
					elseif Luck2 >10 and Luck2 <=15 then
						ScriptMessage( OwnerID(), -1 , 2 , "[SC_105200_05]" , 2 )
						CastSpellLV( OwnerID() , OwnerID() , 496869 , 0 ) --�I������ˬd��Buff
						AddBuff ( OwnerID()  , 508612, 0, 8 )
						Boss25 = 3 --25���I�������l�P�_��3
						sleep(15)
					elseif Luck2 >15 and Luck2 <= 20 then
						ScriptMessage( OwnerID(), -1 , 2 , "[SC_105200_03]" , 2 )
						CastSpellLV( OwnerID() , OwnerID() , 496867 , 0 ) --�I���Ŧ��ˬd��Buff
						AddBuff ( OwnerID()  , 508612, 0, 8 )
						Boss25 = 1 --25���I�Ų��l�P�_��1
						sleep(15)
					elseif Luck2 >20 and Luck2 <= 25 then
						ScriptMessage( OwnerID(), -1 , 2 , "[SC_105200_04]" , 2 )
						CastSpellLV( OwnerID() , OwnerID() , 496868 , 0 ) --�I�񵵦��ˬd��Buff
						AddBuff ( OwnerID()  , 508612, 0, 8 )
						Boss25 = 2 --25���I�����l�P�_��2
						sleep(15)
					elseif Luck2 >25 and Luck2 <=30 then
						ScriptMessage( OwnerID(), -1 , 2 , "[SC_105200_05]" , 2 )
						CastSpellLV( OwnerID() , OwnerID() , 496869 , 0 ) --�I������ˬd��Buff
						AddBuff ( OwnerID()  , 508612, 0, 8 )
						Boss25 = 3 --25���I�������l�P�_��3
						sleep(15)
					end
					--say (OwnerID() , "Luck2 = " ..Luck2)

				end
				
				if Time01 == 7 then --�I�񴶩�
					Luck = Rand(100)
					--say ( OwnerID() , "Luck = "..Luck)
					while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
					sleep(2)
					end	
					if Luck >= 0 and Luck <50 then --�I���H��3�H���M�ˮ`
						local player = {}
						local choose_p = 0
						local pm = 0
						local bosstargrt = {}
						player = DW_HateRemain(0) --������H   ��0�N�� ���ư��D�Z
						choose_p = table.getn(player) --���XPlayer���ƶq
						--say (OwnerID() , "choose_p = "..choose_p )
						if choose_p > 3 then
							ScriptMessage( OwnerID(), -1 , 2 , "[SC_105200_06]" , 2 )
							sleep(10)
							for i = 1 , 3 , 1 do 
								local Lucky2 = Rand(table.getn(player))+1			--RAND�쪺�Ʀr	
								if ( player[Lucky2] ~= nil ) and ( ReadRoleValue( player[Lucky2] , EM_RoleValue_IsDead ) == 0 ) then
									SysCastSpellLv( OwnerID() , player[Lucky2] , 497516 , 0 )
								end
								table.remove( player , Lucky2 )
								sleep(1)
							end
						elseif choose_p <=3 then
							ScriptMessage( OwnerID(), -1 , 2 , "[SC_105200_06]" , 2 )
							sleep(10)
							while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
							sleep(2)
							end	
							for i = 1 , table.getn(player) , 1 do
								sysCastSpellLV( OwnerID() , player[i] , 497516 , 0  )
								--say(player[i] , "<=3")
							end
						end
					elseif Luck >50  and Luck <=75 then --�I��ۨ�AE80
						ScriptMessage( OwnerID(), -1 , 2 , "[SC_105200_12]" , 2 )
						while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
						sleep(2)
						end	
						CastSpellLV( OwnerID() , OwnerID() , 496864 , 20 )
						sleep(30)
						--say( OwnerID(), "AE80")
					elseif Luck > 75 and Luck <=100 then --�I��e�记�ζˮ`
						while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
						sleep(2)
						end	
						CastSpellLV( OwnerID() , OwnerID() , 496865 , 35 )
						--say( OwnerID(), "Fan60")
					end
				Time01 = 0
				end
		else
			if FightON == 1 and  AttackTarget == 0 then --�p�G�b�԰����ӨS������ؼЪ���
				local Playbye
				Playbye = CreateObjByFlag( 105283 , 780860 , 3, 1 ) --�ͥX�R���F�誺�X��
			
				SetModeEx( Playbye , EM_SetModeType_Show, false) ----�q�X
				SetModeEx( Playbye , EM_SetModeType_Mark, false) ----�аO
				SetModeEx( Playbye , EM_SetModeType_Strikback, false) ---����
				SetModeEx( Playbye , EM_SetModeType_Move, false) ---����	
				SetModeEx( Playbye , EM_SetModeType_Fight, false) ---�i���
				SetModeEx( Playbye , EM_SetModeType_SearchenemyIgnore, true) ---���󤣷|�Q�j�M
				SetModeEx( Playbye , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
				SetModeEx( Playbye , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
				SetModeEx( Playbye , EM_SetModeType_Searchenemy, false)  ---����
				SetModeEx( Playbye   , EM_SetModeType_Obstruct, false )--����
				AddToPartition( Playbye , roomID )
				BeginPlot( Playbye, "Dy_Z19_BOSSN_DEAD_2", 10)
				Time01 = 0
				Time02 = 0
				Time03 = 0
				WriteRoleValue( CH1, EM_RoleValue_Register2, 2) --�^�Ǳ�������a���ΤF
			end	
		end
	end
end

function Dy_Z19_BOSSN_DEAD_2()
	local Playbye_2 = {}
	Playbye_2 = SearchRangeNPC ( OwnerID() , 1000 )
	for i=0,table.getn(Playbye_2) do
		if ReadRoleValue( Playbye_2[i] , EM_RoleValue_OrgID )==105202 or 
			ReadRoleValue( Playbye_2[i] , EM_RoleValue_OrgID )==105203 or 
			ReadRoleValue( Playbye_2[i] , EM_RoleValue_OrgID )==117261 or 
			ReadRoleValue( Playbye_2[i] , EM_RoleValue_OrgID )==117262 or 
			ReadRoleValue( Playbye_2[i] , EM_RoleValue_OrgID )==117263 or
			ReadRoleValue( Playbye_2[i] , EM_RoleValue_OrgID )==103044 or
			ReadRoleValue( Playbye_2[i] , EM_RoleValue_OrgID )==105286 then
			delobj(Playbye_2[i])
		end
		delobj(OwnerID())
	end
end

function Dy_Z19_BOSSN_DEAD()
	local CH1 = ReadRoleValue( OwnerID() , EM_RoleValue_PID )  --Ū�X�����ID
	local roomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID )
	local Playbye
	ScriptMessage( CH1, -1 , 2 , "[SC_105200_01] " , 2 )
	Playbye = CreateObjByFlag( 105283 , 780860 , 3, 1 ) --�ͥX�R���F�誺�X��
	
	SetModeEx( Playbye , EM_SetModeType_Show, false) ----�q�X
	SetModeEx( Playbye , EM_SetModeType_Mark, false) ----�аO
	SetModeEx( Playbye , EM_SetModeType_Strikback, false) ---����
	SetModeEx( Playbye , EM_SetModeType_Move, false) ---����	
	SetModeEx( Playbye , EM_SetModeType_Fight, false) ---�i���
	SetModeEx( Playbye , EM_SetModeType_SearchenemyIgnore, true) ---���󤣷|�Q�j�M
	SetModeEx( Playbye , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
	SetModeEx( Playbye , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
	SetModeEx( Playbye , EM_SetModeType_Searchenemy, false)  ---����
	SetModeEx( Playbye   , EM_SetModeType_Obstruct, false )--����
	AddToPartition( Playbye , roomID )
	BeginPlot( Playbye, "Dy_Z19_BOSSN_DEAD_2", 10)
	WriteRoleValue( CH1, EM_RoleValue_Register2, 3)
end
function Dy_Z19_BOSSN_BLUE() --�Ų��l���I���@�� 
	if CheckBuff( OwnerID() , 508608) == true then ---������Bff�ɤ��򳣤���
	elseif CheckBuff( OwnerID() , 508608) == false then --�S���ɦb����H�U�ˬd
		if CheckBuff( OwnerID() , 508604) == true then --�p�G�ˬd���Ŧ��ˬdBuff
			sysCastSpellLV( TargetID() , OwnerID() , 496859 , 0 ) --�I��-30%HP
			CancelBuff( OwnerID() ,  508604 ) --�R���Ŧ��ˬdBuff
			CancelBuff( OwnerID() ,  508607 ) ----�R���E�c���ˬd
			AddBuff ( OwnerID() , 509321, 0, 3 ) --�[�J�k�L�@�T��Buff 3��
		elseif CheckBuff( OwnerID() , 508604) == false then
			if CheckBuff( OwnerID() , 509321) == true then --���k�L�@�TBuff�Nԣ������
			
			elseif CheckBuff( OwnerID() , 509321) == false then
				sysCastSpellLV( TargetID() , OwnerID() , 497517 , 0 ) --�I���I�����k�N -80%HP
			end
		end
	end
end

function Dy_Z19_BOSSN_RED() --�����l���I���@��
	if CheckBuff( OwnerID() , 508608) == true then ---������Bff�ɤ��򳣤���
	elseif CheckBuff( OwnerID() , 508608) == false then --�S���ɦb����H�U�ˬd
		if CheckBuff( OwnerID() , 508605) == true then --�p�G�ˬd�쵵���ˬdBuff
			sysCastSpellLV(TargetID(), OwnerID() , 496859 , 0 ) --�I��-30%HP
			CancelBuff( OwnerID() ,  508605 ) --�R�������ˬdBuff
			CancelBuff( OwnerID() ,  508607 ) ----�R���E�c���ˬd
			AddBuff ( OwnerID() , 509321, 0, 3 ) --�[�J�k�L�@�T��Buff 3��
		elseif CheckBuff( OwnerID() , 508605) == false then
			if CheckBuff( OwnerID() , 509321) == true then --���k�L�@�TBuff�Nԣ������
			
			elseif CheckBuff( OwnerID() , 509321) == false then
				sysCastSpellLV( TargetID() , OwnerID() , 497517 , 0 ) --�I���I�����k�N -80%HP
			end
		end
	end
end

function Dy_Z19_BOSSN_YELLOW() --�������l���I���@��
	if CheckBuff( OwnerID() , 508608) == true then ---������Bff�ɤ��򳣤���
	elseif CheckBuff( OwnerID() , 508608) == false then --�S���ɦb����H�U�ˬd
		if CheckBuff( OwnerID() , 508606) == true then --�p�G�ˬd������ˬdBuff
			sysCastSpellLV( OwnerID() , OwnerID() , 496859 , 0 ) --�I��-30%HP
			CancelBuff( OwnerID() ,  508606 ) --�R�������ˬdBuff
			CancelBuff( OwnerID() ,  508607 ) --�R���E�c���ˬd
			AddBuff ( OwnerID() , 509321, 0, 3 ) --�[�J�k�L�@�T��Buff 3��
		elseif CheckBuff( OwnerID() , 508606) == false then
			if CheckBuff( OwnerID() , 509321) == true then --���k�L�@�TBuff�Nԣ������
			
			elseif CheckBuff( OwnerID() , 509321) == false then
				sysCastSpellLV( TargetID() , OwnerID() , 497517 , 0 ) --�I���I�����k�N -80%HP
			end
		end
	end
end
--�զXA��
function Dy_Z19_BOSSN_DQ1_B_A() --�����Ŧ��ΧR�����P����Debuff
	if CheckBuff( TargetID() ,  509509 ) == true then
		CancelBuff( TargetID() ,  509509 ) --�R���Ŧ�B-B
	else
	
	end
	if CheckBuff( TargetID() ,  509511 ) == true then
		CancelBuff( TargetID() ,  509511  ) --�R���Ŧ�B-C
		CancelBuff( TargetID() ,  509512  ) --�R���Ŧ�B-C
	else
	
	end
	if CheckBuff( TargetID() ,  509499 ) == true then
		CancelBuff( TargetID() ,  509499 ) --�R������P-A
	else
	
	end
	if CheckBuff( TargetID() ,  509497 ) == true then
		CancelBuff( TargetID() ,  509497 ) --�R������P-B
	else
	
	end
	if CheckBuff( TargetID() ,  509501 ) == true then
		CancelBuff( TargetID() ,  509501 ) --�R������P-C
		CancelBuff( TargetID() ,  509502 ) --�R������P-C
	else
	
	end
	if CheckBuff( TargetID() ,  509492 ) == true then
		CancelBuff( TargetID() ,  509492 ) --�R������R-A
	else
	
	end
	if CheckBuff( TargetID() ,  509490 ) == true then
		CancelBuff( TargetID() ,  509490 ) --�R������R-B
	else
	
	end
	if CheckBuff( TargetID() ,  509487 ) == true then
		CancelBuff( TargetID() ,  509487 ) --�R������R-C
		CancelBuff( TargetID() ,  509488 )
	else
	
	end

end
function Dy_Z19_BOSSN_DQ1_P_A() --���쵵���ΧR���ŻP����Debuff
	if CheckBuff( TargetID() ,  509507 ) == true then
		CancelBuff( TargetID() ,  509507 ) --�R���Ŧ�B-A
	else
	
	end
	if CheckBuff( TargetID() ,  509509 ) == true then
		CancelBuff( TargetID() ,  509509 ) --�R���Ŧ�B-B
	else
	
	end
	if CheckBuff( TargetID() ,  509511 ) == true then
		CancelBuff( TargetID() ,  509511  ) --�R���Ŧ�B-C
		CancelBuff( TargetID() ,  509512  ) --�R���Ŧ�B-C
	else
	
	end
	if CheckBuff( TargetID() ,  509497 ) == true then
		CancelBuff( TargetID() ,  509497 ) --�R������P-B
	else
	
	end
	if CheckBuff( TargetID() ,  509501 ) == true then
		CancelBuff( TargetID() ,  509501 ) --�R������P-C
		CancelBuff( TargetID() ,  509502 ) --�R������P-C
	else
	
	end
	if CheckBuff( TargetID() ,  509492 ) == true then
		CancelBuff( TargetID() ,  509492 ) --�R������R-A
	else
	
	end
	if CheckBuff( TargetID() ,  509490 ) == true then
		CancelBuff( TargetID() ,  509490 ) --�R������R-B
	else
	
	end
	if CheckBuff( TargetID() ,  509487 ) == true then
		CancelBuff( TargetID() ,  509487 ) --�R������R-C
		CancelBuff( TargetID() ,  509488 )
	else
	
	end

end
function Dy_Z19_BOSSN_DQ1_R_A() --���������ΧR�����P��Debuff
	if CheckBuff( TargetID() ,  509507 ) == true then
		CancelBuff( TargetID() ,  509507 ) --�R���Ŧ�B-A
	else
	
	end
	if CheckBuff( TargetID() ,  509509 ) == true then
		CancelBuff( TargetID() ,  509509 ) --�R���Ŧ�B-B
	else
	
	end
	if CheckBuff( TargetID() ,  509511 ) == true then
		CancelBuff( TargetID() ,  509511  ) --�R���Ŧ�B-C
		CancelBuff( TargetID() ,  509512  ) --�R���Ŧ�B-C
	else
	
	end
	if CheckBuff( TargetID() ,  509499 ) == true then
		CancelBuff( TargetID() ,  509499 ) --�R������P-A
	else
	
	end
	if CheckBuff( TargetID() ,  509497 ) == true then
		CancelBuff( TargetID() ,  509497 ) --�R������P-B
	else
	
	end
	if CheckBuff( TargetID() ,  509501 ) == true then
		CancelBuff( TargetID() ,  509501 ) --�R������P-C
		CancelBuff( TargetID() ,  509502 ) --�R������P-C
	else
	
	end
	if CheckBuff( TargetID() ,  509490 ) == true then
		CancelBuff( TargetID() ,  509490 ) --�R������R-B
	else
	
	end
	if CheckBuff( TargetID() ,  509487 ) == true then
		CancelBuff( TargetID() ,  509487 ) --�R������R-C
		CancelBuff( TargetID() ,  509488 )
	else
	
	end

end

--�զXB��
function Dy_Z19_BOSSN_DQ1_B_B() --�����Ŧ��ΧR�����P����Debuff
	if CheckBuff( TargetID() ,  509507 ) == true then
		CancelBuff( TargetID() ,  509507 ) --�R���Ŧ�B-A
	else
	
	end
	if CheckBuff( TargetID() ,  509511 ) == true then
		CancelBuff( TargetID() ,  509511  ) --�R���Ŧ�B-C
		CancelBuff( TargetID() ,  509512  ) --�R���Ŧ�B-C
	else
	
	end
	if CheckBuff( TargetID() ,  509499 ) == true then
		CancelBuff( TargetID() ,  509499 ) --�R������P-A
	else
	
	end
	if CheckBuff( TargetID() ,  509497 ) == true then
		CancelBuff( TargetID() ,  509497 ) --�R������P-B
	else
	
	end
	if CheckBuff( TargetID() ,  509501 ) == true then
		CancelBuff( TargetID() ,  509501 ) --�R������P-C
		CancelBuff( TargetID() ,  509502 ) --�R������P-C
	else
	
	end
	if CheckBuff( TargetID() ,  509492 ) == true then
		CancelBuff( TargetID() ,  509492 ) --�R������R-A
	else
	
	end
	if CheckBuff( TargetID() ,  509490 ) == true then
		CancelBuff( TargetID() ,  509490 ) --�R������R-B
	else
	
	end
	if CheckBuff( TargetID() ,  509487 ) == true then
		CancelBuff( TargetID() ,  509487 ) --�R������R-C
		CancelBuff( TargetID() ,  509488 )
	else
	
	end

end
function Dy_Z19_BOSSN_DQ1_P_B() --���쵵���ΧR���ŻP����Debuff
	if CheckBuff( TargetID() ,  509507 ) == true then
		CancelBuff( TargetID() ,  509507 ) --�R���Ŧ�B-A
	else
	
	end
	if CheckBuff( TargetID() ,  509509 ) == true then
		CancelBuff( TargetID() ,  509509 ) --�R���Ŧ�B-B
	else
	
	end
	if CheckBuff( TargetID() ,  509511 ) == true then
		CancelBuff( TargetID() ,  509511  ) --�R���Ŧ�B-C
		CancelBuff( TargetID() ,  509512  ) --�R���Ŧ�B-C
	else
	
	end
	if CheckBuff( TargetID() ,  509499 ) == true then
		CancelBuff( TargetID() ,  509499 ) --�R������P-A
	else
	
	end
	if CheckBuff( TargetID() ,  509501 ) == true then
		CancelBuff( TargetID() ,  509501 ) --�R������P-C
		CancelBuff( TargetID() ,  509502 ) --�R������P-C
	else
	
	end
	if CheckBuff( TargetID() ,  509492 ) == true then
		CancelBuff( TargetID() ,  509492 ) --�R������R-A
	else
	
	end
	if CheckBuff( TargetID() ,  509490 ) == true then
		CancelBuff( TargetID() ,  509490 ) --�R������R-B
	else
	
	end
	if CheckBuff( TargetID() ,  509487 ) == true then
		CancelBuff( TargetID() ,  509487 ) --�R������R-C
		CancelBuff( TargetID() ,  509488 )
	else
	
	end

end
function Dy_Z19_BOSSN_DQ1_R_B() --���������ΧR�����P��Debuff
	if CheckBuff( TargetID() ,  509507 ) == true then
		CancelBuff( TargetID() ,  509507 ) --�R���Ŧ�B-A
	else
	
	end
	if CheckBuff( TargetID() ,  509509 ) == true then
		CancelBuff( TargetID() ,  509509 ) --�R���Ŧ�B-B
	else
	
	end
	if CheckBuff( TargetID() ,  509511 ) == true then
		CancelBuff( TargetID() ,  509511  ) --�R���Ŧ�B-C
		CancelBuff( TargetID() ,  509512  ) --�R���Ŧ�B-C
	else
	
	end
	if CheckBuff( TargetID() ,  509499 ) == true then
		CancelBuff( TargetID() ,  509499 ) --�R������P-A
	else
	
	end
	if CheckBuff( TargetID() ,  509497 ) == true then
		CancelBuff( TargetID() ,  509497 ) --�R������P-B
	else
	
	end
	if CheckBuff( TargetID() ,  509501 ) == true then
		CancelBuff( TargetID() ,  509501 ) --�R������P-C
		CancelBuff( TargetID() ,  509502 ) --�R������P-C
	else
	
	end
	if CheckBuff( TargetID() ,  509492 ) == true then
		CancelBuff( TargetID() ,  509492 ) --�R������R-A
	else
	
	end
	if CheckBuff( TargetID() ,  509487 ) == true then
		CancelBuff( TargetID() ,  509487 ) --�R������R-C
		CancelBuff( TargetID() ,  509488 )
	else
	
	end

end

--�զXC��
function Dy_Z19_BOSSN_DQ1_B_C() --�����Ŧ��ΧR�����P����Debuff
	if CheckBuff( TargetID() ,  509507 ) == true then
		CancelBuff( TargetID() ,  509507 ) --�R���Ŧ�B-A
	else
	
	end
	if CheckBuff( TargetID() ,  509509 ) == true then
		CancelBuff( TargetID() ,  509509 ) --�R���Ŧ�B-B
	else
	
	end
	if CheckBuff( TargetID() ,  509499 ) == true then
		CancelBuff( TargetID() ,  509499 ) --�R������P-A
	else
	
	end
	if CheckBuff( TargetID() ,  509497 ) == true then
		CancelBuff( TargetID() ,  509497 ) --�R������P-B
	else
	
	end
	if CheckBuff( TargetID() ,  509501 ) == true then
		CancelBuff( TargetID() ,  509501 ) --�R������P-C
		CancelBuff( TargetID() ,  509502 ) --�R������P-C
	else
	
	end
	if CheckBuff( TargetID() ,  509492 ) == true then
		CancelBuff( TargetID() ,  509492 ) --�R������R-A
	else
	
	end
	if CheckBuff( TargetID() ,  509490 ) == true then
		CancelBuff( TargetID() ,  509490 ) --�R������R-B
	else
	
	end
	if CheckBuff( TargetID() ,  509487 ) == true then
		CancelBuff( TargetID() ,  509487 ) --�R������R-C
		CancelBuff( TargetID() ,  509488 )
	else
	
	end

end
function Dy_Z19_BOSSN_DQ1_P_C() --���쵵���ΧR���ŻP����Debuff
	if CheckBuff( TargetID() ,  509507 ) == true then
		CancelBuff( TargetID() ,  509507 ) --�R���Ŧ�B-A
	else
	
	end
	if CheckBuff( TargetID() ,  509509 ) == true then
		CancelBuff( TargetID() ,  509509 ) --�R���Ŧ�B-B
	else
	
	end
	if CheckBuff( TargetID() ,  509511 ) == true then
		CancelBuff( TargetID() ,  509511  ) --�R���Ŧ�B-C
		CancelBuff( TargetID() ,  509512  ) --�R���Ŧ�B-C
	else
	
	end
	if CheckBuff( TargetID() ,  509499 ) == true then
		CancelBuff( TargetID() ,  509499 ) --�R������P-A
	else
	
	end
	if CheckBuff( TargetID() ,  509497 ) == true then
		CancelBuff( TargetID() ,  509497 ) --�R������P-B
	else
	
	end
	if CheckBuff( TargetID() ,  509492 ) == true then
		CancelBuff( TargetID() ,  509492 ) --�R������R-A
	else
	
	end
	if CheckBuff( TargetID() ,  509490 ) == true then
		CancelBuff( TargetID() ,  509490 ) --�R������R-B
	else
	
	end
	if CheckBuff( TargetID() ,  509487 ) == true then
		CancelBuff( TargetID() ,  509487 ) --�R������R-C
		CancelBuff( TargetID() ,  509488 )
	else
	
	end

end

function Dy_Z19_BOSSN_DQ1_R_C() --���������ΧR�����P��Debuff
	if CheckBuff( TargetID() ,  509507 ) == true then
		CancelBuff( TargetID() ,  509507 ) --�R���Ŧ�B-A
	else
	
	end
	if CheckBuff( TargetID() ,  509509 ) == true then
		CancelBuff( TargetID() ,  509509 ) --�R���Ŧ�B-B
	else
	
	end
	if CheckBuff( TargetID() ,  509511 ) == true then
		CancelBuff( TargetID() ,  509511  ) --�R���Ŧ�B-C
		CancelBuff( TargetID() ,  509512  ) --�R���Ŧ�B-C
	else
	
	end
	if CheckBuff( TargetID() ,  509499 ) == true then
		CancelBuff( TargetID() ,  509499 ) --�R������P-A
	else
	
	end
	if CheckBuff( TargetID() ,  509497 ) == true then
		CancelBuff( TargetID() ,  509497 ) --�R������P-B
	else
	
	end
	if CheckBuff( TargetID() ,  509501 ) == true then
		CancelBuff( TargetID() ,  509501 ) --�R������P-C
		CancelBuff( TargetID() ,  509502 ) --�R������P-C
	else
	
	end
	if CheckBuff( TargetID() ,  509492 ) == true then
		CancelBuff( TargetID() ,  509492 ) --�R������R-A
	else
	
	end
	if CheckBuff( TargetID() ,  509490 ) == true then
		CancelBuff( TargetID() ,  509490 ) --�R������R-B
	else
	
	end
end


function Dy_Z19_BOSSN_DQ1_Check() --�ˬd����PGMssssssssssss
	if ReadRoleValue( TargetID(), EM_RoleValue_VOC) ~= 0 then --���OGM
		return true
	elseif ReadRoleValue( TargetID(), EM_RoleValue_VOC) == 0 then
		return false
	end
end
function Dy_Z19_BOSSN_25Check() --�I��-80%HP���ˬd
	if CheckBuff( TargetID() ,  508607 ) == true then
		return true
	elseif CheckBuff( TargetID() ,  508607 ) == false	then
		return false
	end
end
function Dy_Z19_BOSSN_25DEL() ----�R���E�c���ˬd
	CancelBuff( TargetID() ,  508607 ) ----�R���E�c���ˬd
	--say( TargetID() , "123")
end