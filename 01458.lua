

function Lua_cang_Tree_modecheck()	---------------------�ˬdBoss�B����ӼҦ�
	local Mode1 = 504119	--���q1
	local Mode2 = 504120	--���q2
	if CheckBuff(OwnerID() , Mode1)	== true  then	--�p�G�b���q1
		CancelBuff( OwnerID() , Mode1 )		--�R��1
		AddBuff( OwnerID() , Mode2 , 0 , -1 )	--�i�J2
	elseif CheckBuff(OwnerID() , Mode2) == true then	--�p�G�b���q2
		CancelBuff( OwnerID() , Mode2 )		--�R��2
		AddBuff( OwnerID() , Mode1 , 0 , -1 )	--�i�J1	
	end
end




function Lua_cang_BossAi_Gtree()

	while true do
		sleep(10)
		local SkillDelay = { 20, 40, 30}	-- �ޯੵ��ɶ�
		--���𤧫�, �j�a����, �Y��
		local SkillID = { 493569, 493574, 493573, 493571, 493624, 493570}	-- �ۦ�ID	
		--���𤧫�, �j�a����, �Y��, ���u, ���R, �Ⱦ𤧫�
		local BuffID = { 503868, 503874, 503780, 503778, 503869}	-- BuffID
		--���𤧫�, �𤧽�, ���R, �𤧽�(��), �Ⱦ𤧫�
		local SkillLV = {1, 1, 10, 1}
		--���𤧫�, �j�a����, �Y��, ���u
		local SkillSay = { "[SC_102347_1]", "[SC_102347_2]", "[SC_102347_3]", "[SC_102347_4]" }	-- �ۦ�����
		-- �������箦�b�Ƥ��F�C
		-- ���ڬݬݧA�٦������@�C
		-- �����j�a������a!!!
		--�U�N�A���餺���۵M��q!!
		local SkillA = 0	--�� �}���k�N
		local SkillB = 0
		local SkillC = 0	--�j�a���ܭp�ɾ�
		local SkillD = 0	--�Y���p�ɾ�
		local SkillF = 0	--���u �}���ܼ�
		local Mode1 = 504119	--���q1
		local Mode2 = 504120	--���q2
		local CombatBegin = 0	--�}���@��
		local CountSay = 0
		
		while true do
			sleep(10)
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )	--��ؼЭ�
			if (  AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- �ˬd�O�_���}�԰�	
					
				local Useful = {}
				local Use2 = {}				
				
				SkillC = SkillC + 1
				SkillD = SkillD + 1
				local TreeTarget = AttackTarget
				local partymember = LuaFunc_PartyData( AttackTarget)	--��������				
				local SkillShow = 0	--�ޯ��ܾ�
				local TreeTarget = AttackTarget	--�����ؼ�
				local ThesePlayer = {}
				local HT = ReadRoleValue( OwnerID() ,EM_RoleValue_PID) --�Ⱦ�GID
				
								
				if CombatBegin == 0 then	--�}���@��
					Addbuff( OwnerID(), 503914, 1 , -1)    --�}����ۤv���ˬd
					Addbuff( OwnerID(), mode1, 1 , -1)    --�}����ۤv(p1)										
					CombatBegin = 1
				end					

				if CheckBuff(OwnerID() , Mode1) == true then	--mode1	
					if SkillA == 0 then
						CancelBuff( OwnerID() , BuffID[2] )
						SysCastSpellLV( OwnerID(), OwnerID() , SkillID[5], 0) ----���R
						sleep(10)
						for i = 1 , partymember[0] , 1 do
							if CheckID( partymember[i] ) == true and ReadRoleValue( partymember[i] , EM_RoleValue_IsDead ) == 0 and ReadRoleValue( partymember[i] , EM_RoleValue_IsPlayer ) == 1 then	--�ˬd���a�O���O�٦b�F�ˬd�O�_���`�F�ˬd�O���O���a
								if GetDistance( OwnerID(), partymember[i] ) <= 800 then
									Useful[table.getn(Useful)+1] = partymember[i]	
								end--��JUseful�̭�
							end
						end								
						
						local anyone1 = Rand(table.getn(Useful))+1				--rand Useful�̭����H
						ScriptMessage( OwnerID() , -1 , 2 , "[SC_102347_1]", 1 )
						SysCastSpellLV( Useful[anyone1], OwnerID(), 493569, 1)	--rand�X�Ӫ��H����J��
						SetAttack(OwnerID(),Useful[anyone1])						--���������Ӫ��a		
						sleep(10)
						if CheckID( HT ) == true then
							for j=1 , table.getn(Useful) do					
								if Useful[j] ~= Useful[anyone1] then		--��[J]������anyone1
									Use2[table.getn(Use2)+1] = Useful[j]	--��o�ǤH��JUse2
								end
							end		
							local any2 = Rand(table.getn(Use2))+1			--rand any2�̭����H
							if Use2[any2] ~= nil then
								ScriptMessage( HT , -1 , 2 , "[SC_102348_1]", 1 )
								SysCastSpellLV( Use2[any2] , HT , 493570, 1) 	--rand�X�Ӫ��H��Ⱦ�J��
								SetAttack( HT , Useful[any2] )						--�������Ӫ��a
								--Say(HT, "G>S_target="..Useful[any2])
								sleep(10)
							end
						end
						SkillA = 1							
					end	
														
					if SkillC >= 7 then --�j�a����
						SkillShow = 2
						TreeTarget = OwnerID()
						SkillC = 0						
					elseif SkillD >= 5 then --�Y��
						SkillShow = 3
						TreeTarget = AttackTarget
						SkillD = 0
					end	
					SkillF = 0	--�k�s�p��
					CountSay = 0
				elseif CheckBuff(OwnerID() , Mode2) == true then	--mode2
					if CountSay == 0 then
						ScriptMessage( OwnerID() , -1 , 2 , "[SC_102347_6]", 1 )
						Sleep(30)
						Addbuff( OwnerID(), BuffID[2], 1 , 20)    --��ۤv��
						CountSay = 1
					end
					if SkillF == 0 then  --�o�ʬ��u�Ĥ@��
						CastSpellLV( OwnerID(), TreeTarget, SkillID[4], 1)
						Sleep(10)
						SkillF = 1
					end
					if SkillC >= 7 then --�j�a����
						SkillShow = 2
						TreeTarget = OwnerID()
						SkillC = 0						
					elseif SkillD >= 5 then --�Y��
						SkillShow = 3
						TreeTarget = AttackTarget
						SkillD = 0
					end	
					SkillA = 0	--�k�s�p��
				end	
				if SkillShow ~= 0 then
					Say( OwnerID() , SkillSay[SkillShow] )
					CastSpellLV( OwnerID() , TreeTarget , SkillID[SkillShow] , SkillLV[SkillShow] )
					Sleep( SkillDelay[SkillShow])
					SkillShow = 0
				end							
			else
				break
			end
		end					
	end
end





function Lua_cang_BossAi_Stree()

	while true do
		sleep(10)
		local SkillDelay = { 10, 40, 30}	-- �ޯੵ��ɶ�
		--�Ⱦ𤧫�, �ͩR�I�z, §�g
		local SkillID = { 493570, 493576, 493575, 493624}	-- �ۦ�ID	
		--�Ⱦ𤧫�, �ͩR�I�z, §�g
		local SkillLV = {1, 2, 2}
		--�Ⱦ𤧫�, �ͩR�I�z, §�g
		local BuffID = { 503869, 503875, 503780}	-- BuffID
		--�Ⱦ𤧫�, �𤧽�, ���R
		local SkillSay = { "[SC_102348_1]", "[SC_102348_2]", "[SC_102348_3]", "[SC_102347_4]" }	-- �ۦ�����
		-- �������Y�b�ƧA�����F�C
		-- �p�߯�q���ϼ��C
		-- �ͩR�ѧڴx��!!!
		--�U�N�A���餺���۵M��q!!
		local SkillA = 1	--�ܼ� �}���k�N
		local SkillC = 0	--�ͩR�I�z�p�ɾ�
		local SkillD = 0	--§�g�p�ɾ�
		local SkillF = 0	--���u�p�ƾ�
		local Mode1 = 504119	--���q1
		local Mode2 = 504120	--���q2
		local CombatBegin = 0	--�}���@��
		local CountSay = 0	--�T���}�� 

		while true do
			sleep(10)
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )	--��ؼЭ�
			if (  AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- �ˬd�O�_���}�԰�				
			SkillC = SkillC + 1
			SkillD = SkillD + 1
			local SkillShow = 0			
			--Say(OwnerID() , SkillD)
			local TreeTarget = AttackTarget
			local partymember = LuaFunc_PartyData( AttackTarget)
			local Useful = {}
			local Use2 = {}					
		
			local TempPlayer = SetSearchAllPlayer(ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)) --���{�b�ӰϤ����Ҧ����a
			local ThesePlayer = {}
			local HT = ReadRoleValue( OwnerID() ,EM_RoleValue_PID) --����GID

				if CombatBegin == 0 then	--�}���@��
					Addbuff( OwnerID(), 503914, 1 , -1)     --�}����ۤv���ˬd
					Addbuff( OwnerID(), mode1, 1 , -1)		--�}����ۤv(p1)
					Addbuff( OwnerID(), 503704, 1 , -1)		--������
					CombatBegin = 1
				end		
				
				if CheckBuff(OwnerID() , Mode1) == true then	--mode1
					if SkillA == 0 then
						CancelBuff( OwnerID() , BuffID[2] )		--�R����			
						if CheckID( HT ) == false or ReadRoleValue( HT , EM_RoleValue_IsDead ) == 1 then
							SysCastSpellLV( OwnerID(), OwnerID() , SkillID[4], 0) ----���R
							sleep(10)
							for i = 1 , partymember[0] , 1 do
								if CheckID( partymember[i] ) == true and ReadRoleValue( partymember[i] , EM_RoleValue_IsDead ) == 0 then	--�ˬd���a�O���O�٦b�F�ˬd�O�_���`
									if GetDistance( OwnerID(), partymember[i] ) <= 800 then
										Useful[table.getn(Useful)+1] = partymember[i]
									end	--��JUseful�̭�
								end
							end							
							local anyone1 = Rand(table.getn(Useful))+1				--rand Useful�̭����H
							if Useful[anyone1] ~= nil then
								ScriptMessage( OwnerID() , -1 , 2 , "[SC_102348_1]", 1 )
								SysCastSpellLV( Useful[anyone1], OwnerID(), 493570, 1)	--rand�X�Ӫ��H����J��
								SetAttack(OwnerID(),Useful[anyone1])						--���������Ӫ��a	
								--Say(OwnerID(), "S_target="..Useful[anyone1])
								sleep(10)
								SkillA = 1
							end	
						end	
					end	
					
					if SkillC >= 5 then --�ͩR�I�z
						SkillShow = 2
						TreeTarget = OwnerID()
						SkillC = 0
					elseif SkillD >= 2 then --§�g
						SkillShow = 3
						TreeTarget = AttackTarget
						SkillD = 0
					end
					SkillF = 0
					CountSay = 0
				elseif CheckBuff(OwnerID() , Mode2) == true then	--mode2
					if CountSay == 0 then
						ScriptMessage( OwnerID() , -1 , 2 , "[SC_102347_6]", 1 )
						Sleep(30)
						Addbuff( OwnerID(), BuffID[2], 1 , 20)    --�}����ۤv��
						CountSay = 1
					end
					if CheckID( HT ) == false or ReadRoleValue( HT , EM_RoleValue_IsDead ) == 1 then
						if SkillF == 0 then  --�o�ʬ��u�Ĥ@��
							CastSpellLV( OwnerID(), TreeTarget, 493571, 1)
							Sleep(10)
							SkillF = 1
						end
					end

					if SkillC >= 5 then --�ͩR�I�z
						SkillShow = 2
						TreeTarget = OwnerID()
						SkillC = 0
					elseif SkillD >= 2 then --§�g
						SkillShow = 3
						TreeTarget = AttackTarget
						SkillD = 0
					end
					if CheckID( HT ) == false or ReadRoleValue( HT , EM_RoleValue_IsDead ) == 1 then
						SkillA = 0
					end
				end	
				if SkillShow ~= 0 then
					--Say(OwnerID(), TreeTarget)
					Say( OwnerID() , SkillSay[SkillShow] )
					CastSpellLV( OwnerID() , TreeTarget , SkillID[SkillShow] , SkillLV[SkillShow] )
					Sleep( SkillDelay[SkillShow])
					SkillShow = 0
				end
			else
				break	
			end
		end					
	end
end
			




function Lua_cang_BossAi_GSTree()


	local Pass = 0	--�Ĥ@�h��
	local Pass2 = 0	--�ĤG�h��
	local Temp1	--����
	local Temp2	--�Ⱦ�
	local Temp3 --�_�c
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local Door1, Door2, Door3
	local Count = 0
	local Count1 = 0
	local Craze = 0

	--���ͪ���
	Temp1 = CreateObjByFlag( 102347, 780402, 0, 1) 
	AddToPartition( Temp1 , RoomID )	
	BeginPlot(Temp1,"Lua_cang_BossAi_Gtree",0)
	sleep(10)
	
	--���ͻȾ�
	Temp2 = CreateObjByFlag( 102348, 780403, 0, 1)
	AddToPartition( Temp2 , RoomID )
	BeginPlot(Temp2,"Lua_cang_BossAi_Stree",0)
	sleep(10)

	WriteRoleValue( Temp2 ,EM_RoleValue_PID, Temp1)	--�g�JPID
	WriteRoleValue( Temp1 ,EM_RoleValue_PID, Temp2)	--�g�JPID
	
	--Door1 = CreateObjByFlag( 102460, 780419, 0, 1)	--���ת�
	--SetModeEx( Door1   , EM_SetModeType_Move, false )--����
	--SetModeEx( Door1   , EM_SetModeType_Fight , false )--���i�������
	--SetModeEx( Door1   , EM_SetModeType_Strikback, false )--����
	--SetModeEx( Door1   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	--SetModeEx( Door1   , EM_SetModeType_Mark, false )--�аO
	--SetModeEx( Door1   , EM_SetModeType_Obstruct, true )--����
	--AddToPartition( Door1 , RoomID )	
	Door2 = CreateObjByFlag( 102460, 780419, 1, 1) 
	SetModeEx( Door2   , EM_SetModeType_Move, false )--����
	SetModeEx( Door2   , EM_SetModeType_Fight , false )--���i�������
	SetModeEx( Door2   , EM_SetModeType_Strikback, false )--����
	SetModeEx( Door2   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( Door2   , EM_SetModeType_Mark, false )--�аO
	SetModeEx( Door2   , EM_SetModeType_Obstruct, true )--����
	AddToPartition( Door2 , RoomID )	
	--Door3 = CreateObjByFlag( 102460, 780419, 2, 1) 
	--SetModeEx( Door3   , EM_SetModeType_Move, false )--����
	--SetModeEx( Door3   , EM_SetModeType_Fight , false )--���i�������
	--SetModeEx( Door3   , EM_SetModeType_Strikback, false )--����
	--SetModeEx( Door3   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	--SetModeEx( Door3   , EM_SetModeType_Mark, false )--�аO
	--SetModeEx( Door3   , EM_SetModeType_Obstruct, true )--����
	--AddToPartition( Door3 , RoomID )	
	
	while 1 do	--����	--�����PASS >1 ����^��
		--Say(OwnerID(), "Count1="..Count1)
		sleep(10)
		Pass = 0
		Pass2 = 0		
		if GetDistance( Temp1, Temp2) >= 500 then
			pass2 = 1
 		end
		if HateListCount( Temp1 ) ~= 0 then 
			Craze = Craze +1
			if Craze == 360 then	
				Addbuff( Temp1, 503873, 1, -1)
				Addbuff( Temp2, 503873, 1, -1)
				Craze = 0
			end	
		elseif 	HateListCount( Temp1 ) == 0 and HateListCount( Temp2 ) == 0 then
			Craze = 0
		end		
		
		if	CheckID(Temp1)==false	or							--�ˬdTemp1�O�_�s�b
			ReadRoleValue(Temp1,EM_RoleValue_IsDead)==1	then	--�ˬdTemp1�O�_���`	
			Pass = Pass + 1										--�p�G������ pass+1
			Hide(Temp1)											--���ë���
			Count1 = Count1 + 1
			if	ReadRoleValue(Temp2,EM_RoleValue_IsDead)==0	and	--�ˬdTemp2�O���O�٬���
				CheckID(Temp2)==true and						--�ˬdTemp2�O���O�s�b
				HateListCount( Temp2 )  == 0 then				--�ˬdTemp2������٦��S���H
				Pass2 = Pass2 + 1								--���� Pass2 +1
			end
			if Count1 == 15 then
				Temp1 = CreateObjByFlag( 102347, 780402, 0, 1) 
				AddToPartition( Temp1 , RoomID )	
				BeginPlot(Temp1,"Lua_cang_BossAi_Gtree",0)
				WriteRoleValue( Temp1 ,EM_RoleValue_PID, Temp2)	--�g�JPID
				local TempPlayer = SetSearchAllPlayer(ReadRoleValue(TargetID(),EM_RoleValue_RoomID)) --���{�b�ӰϤ����Ҧ����a
				local ThesePlayer = {}
				for i=1,TempPlayer do
					ThesePlayer[i] = GetSearchResult() -- ���Ȧs��
					SetAttack( Temp1 , ThesePlayer[i] ) --�e�X�����ؼ�
				end	
				sleep(10)
				Count1 = 0
			end
		end		
		if	CheckID(Temp2)==false	or							--�ˬdTemp2�O�_�s�b
			ReadRoleValue(Temp2,EM_RoleValue_IsDead)==1	then	--�ˬdTemp2�O�_���`
			Pass = Pass + 1										--�p�G������ pass+1
			Hide(Temp2)											--���ë���		
			Count1 = Count1 + 1
			if	ReadRoleValue(Temp1,EM_RoleValue_IsDead)==0	and	--�ˬdTemp1�O�_���`
				CheckID(Temp1)==true and						--�ˬdTmep1�O���O�s�b
				HateListCount( Temp1 )  == 0 then				--�ˬdTemp1�O�_�԰���
				Pass2 = Pass2 + 1								--���� Pass2 +1
			end
			if Count1 == 15 then
				Temp2 = CreateObjByFlag( 102348, 780403, 0, 1) 
				AddToPartition( Temp2 , RoomID )	
				BeginPlot(Temp2,"Lua_cang_BossAi_Stree",0)
				WriteRoleValue( Temp2 ,EM_RoleValue_PID, Temp1)	--�g�JPID
				local TempPlayer = SetSearchAllPlayer(ReadRoleValue(TargetID(),EM_RoleValue_RoomID)) --���{�b�ӰϤ����Ҧ����a
				local ThesePlayer = {}
				for i=1,TempPlayer do
					ThesePlayer[i] = GetSearchResult() -- ���Ȧs��
					SetAttack( Temp2 , ThesePlayer[i] ) --�e�X�����ؼ�
				end	
				sleep(10)
				Count1 = 0
			end

		end
			--Pass2 �u�|��0��1, 0������ȳ���, 1������Ȩ�@���`�B�t�@���}�԰�
		if	Pass2 == 1 then	--pass2 = 1 
			Count1 = 0
			--�R���{�s��
			DelObj(Temp1)
			DelObj(Temp2)
			sleep(50)

			--�إ߷s����
			Temp1 = CreateObjByFlag( 102347, 780402, 0, 1)
			AddToPartition( Temp1 , RoomID )
			BeginPlot(Temp1,"Lua_cang_BossAi_Gtree", 10)
			sleep(10)

			Temp2 = CreateObjByFlag( 102348, 780403, 0, 1)
			AddToPartition( Temp2 , RoomID )
			BeginPlot(Temp2, "Lua_cang_BossAi_Stree", 10)
			sleep(10)
			WriteRoleValue( Temp2 ,EM_RoleValue_PID, Temp1)	--�g�JPID
			WriteRoleValue( Temp1 ,EM_RoleValue_PID, Temp2)	--�g�JPID
			Craze = 0
		end
		
		if	Pass == 2	then	--Pass��2 ���ȳ����`�ή���
			Count1 = 0
			local Temp5, Temp6
			
			Hide(Temp1)	--���ë���
			Hide(Temp2)	--���ë���
			sleep(50)
			--DelObj(Door1)
			DelObj(Door2)
			--DelObj(Door3)
			
			Temp5 = CreateObjByFlag( 113394, 780402, 0, 1)	--����SNPC
			AddToPartition( Temp5 , RoomID )
			ScriptMessage( Temp5 , -1 , 2 , "[SC_102347_5]", 1 )
			Say( Temp5 ,  "[SC_102347_5]")
			Temp6 = CreateObjByFlag( 102357, 780403, 0, 1)	--�Ⱦ�SNPC
			AddToPartition( Temp6 , RoomID )
			Say( Temp6 ,  "[SC_102348_4]")
			Temp3 = CreateObjByFlag( 102358, 780404, 0, 1)	--�_�c						
			--SetModeEx( Temp3  , EM_SetModeType_HideName, false )--�W��
			SetModeEx( Temp3  , EM_SetModeType_ShowRoleHead, false )--���q�Y����
			SetModeEx( Temp3  , EM_SetModeType_NotShowHPMP, true )
			--SetModeEx( Temp3  , EM_SetModeType_Mark, false )--�аO
			AddToPartition( Temp3 , RoomID )	--�԰��S�x 
			SetFightMode(Temp3, 0, 0, 0, 0)
			sleep(10)
			ScriptMessage( Temp6 , -1 , 2 , "[SC_102348_4]", 1 )
			break
		end
	end	
end