function lua_kenny_AI_blood1()
		local SkillID = {493720,493721,493722,493723,493724,493725} 	--�大�w�ޡA�大�f�]�A�大�}�ҡA�大�v���L�ġA�大����b
		local SkillLV = {1,1,1,1,1,1}			-- �ۦ�LV1
		local CheckTime = 0	--�C��P�_
		local Mode = 1
		local Smode = 40	--���q���ܬ��
		local M1Time = 0
		local M2Time = 0
		local HateList = {}
		local FlagID = 780413	
		local Check_blood = 0
		local Counter = 0	--�b�B�p�ɾ�
		local SafeBuff = 504307 --�大�@��
		local CzTime = 0
		local Door = {} --����
		local Door_Flag = 780414
		local CombatBegin1 = 0
	while 1 do
		SetPlot( OwnerID() , "dead" , "Lua_kenny_Opendoor" , 1000 )
		sleep(10) --1��
		local RoomID = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID ) --����e�ؼмƭ�		
		if (  AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- �ˬd�O�_���}�԰�	
			--�Ұʪ��ת�
			if CombatBegin1 == 0 then
				Door[1] = CreateObjByFlag( 102460 , Door_Flag , 1 , 1 )
				Door[2] = CreateObjByFlag( 102460 , Door_Flag , 2 , 1 )				
				for i = 1 , 2 , 1 do					
					SetModeEx( Door[i]   , EM_SetModeType_Move, false )--����
					SetModeEx( Door[i]   , EM_SetModeType_Fight , false )--���i�������
					SetModeEx( Door[i]   , EM_SetModeType_Strikback, false )--����
					SetModeEx( Door[i]   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
					SetModeEx( Door[i]   , EM_SetModeType_Mark, false )--�аO
					SetModeEx( Door[i]   , EM_SetModeType_Obstruct, true )--����		
					AddToPartition( Door[i] , RoomID )
					WriteRoleValue( Door[i] , EM_RoleValue_PID , OwnerID() )
				end
				WriteRoleValue( OwnerID() ,EM_RoleValue_Register1, door[1])
				WriteRoleValue( OwnerID() ,EM_RoleValue_Register2, door[2])
				CombatBegin1 = 1				
			end	
			
		local PlayerNum = SetSearchAllPlayer(ReadRoleValue(OwnerID(), EM_RoleValue_RoomID))	--���ƥ����P�h���a�Ҧ����
		local RoomID = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)	
		local CzBuff = 504049
			CheckTime = CheckTime + 1
			CzTime = CzTime + 1
			Counter = Counter+1
			if Counter == 15 then			--15��νb�B	
				CastSpellLV( OwnerID() , OwnerID(), SkillID[6], SkillLV[6])
				Counter = 0
			end			
			if CzTime == 600 then	--10�N���g�z
				AddBuff(OwnerID(),CzBuff, 1, 40)
				CzTime = 0
			end		
			if CheckTime >= Smode then	--���q����				
				if mode == 1 then	--�i�J�ĤG���q
					local GoShow = 503693
					mode = 2
					M1Time = 0
					AddBuff( OwnerID(),GoShow ,1 , 1 ) --�ǰe�S��
					sleep(20)
					SetPosByFlag( OwnerID(), FlagID , 1 )	--����X�l
					AddBuff(OwnerID(),SafeBuff, 1, 40)	--��大�@��
					SetFightMode( OwnerID(), 1, 0, 0, 0)	--�|���ġA�����ʡA���k�]�A���i�Q����
				else	--�i�J�Ĥ@���q
					mode = 1
					M2Time = 0					
					--DeBugMsg(0,0,"mode="..mode)
					CancelBuff_NoEvent( OwnerID() , SafeBuff )	--�����大�@��
					SetFightMode( OwnerID(), 1, 1, 1, 1)
				end
				CheckTime = 0
			end	
			--***********************************************************************************************************************************************--			
			if mode == 1 then 	--�Ĥ@���q
				local PoTime = 10	--�C10���}��
				local MoTime = 15	--�L�k�v��
				local UoTime = 20	--�fspmp
				local SoTime = 30	--�w
				local HeatListM1 = {}
				local HeatListM2 = {}
				Check_blood = 1
			----------------------------------------------------------------Ū�J�����(�Z�J����J)-------------------------------------------------------------------------------------	
				for i = 1,HateListCount(OwnerID()),1 do
					local obj = HateListInfo(OwnerID() ,i-1 , EM_HateListInfoType_GItemID )
					if obj ~= ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID ) then
						HateList[i] = obj
					else
						HateList[i] = 0
					end
				end
			------------------------------------------------------------------------------------------------------------------------------------------------------------			
				M1Time = M1Time+1
				if M1Time >= 2 and M1Time < 10 then	--�ϥί}��
					CastSpellLV( OwnerID() , AttackTarget, SkillID[3], SkillLV[1])						
				end		
				
				if M1Time >= 11 and M1Time < 16 then	--�L�k�v��	
					CastSpellLV( OwnerID() , AttackTarget, SkillID[4], SkillLV[1])					
				end		
				
				if M1Time >= 17 and M1Time < 24 then	--�ϥ��fspmp
					HeatListM2 = DW_HateRemain( 1 )	--�����Ĥ@�줣��		
					local HeatList_New1 = {}
					local x = 0					
					for i = 1,3,1 do	--�H����3�H
						x = rand(table.getn(HeatListM2))+1
						if HeatListM2[x] ~= nil then						
							SysCastSpellLV( OwnerID() , HeatListM2[x], SkillID[2], SkillLV[1])							
							table.remove(HeatListM2,HeatListM2[x])
						end
					end														
				end	
				
				if M1Time >= 25 and M1Time < 32 then	--�大�w��
					HeatListM1 = DW_HateRemain( 1 )
					local x = 0					
					for i = 1,3,1 do	--�H����w3�H
						x = rand(table.getn(HeatListM1))+1
						if HeatListM1[x] ~= nil then						
							SysCastSpellLV( OwnerID() , HeatListM1[x], SkillID[1], SkillLV[1])							
							table.remove(HeatListM1,HeatListM1[x])
						end
					end
				end	
				if M1Time >= 33 and M1Time < 38 then	--�ϥί}��
					CastSpellLV( OwnerID() , AttackTarget, SkillID[3], SkillLV[1])	
				end		
			end	
			--***********************************************************************************************************************************************--			
			
			if mode == 2 then	--�ĤG���q		
				local BloodBuffID = 504046	--�大����bbuff
				local Blood1 = {102426,102441,102427,102428,102429,102442,102637,102638}	--���j�x-�Ԥh�A�C�L�A��̡A�k�v�A���q�A�M�h
				local Blood1_1	
				local Blood_cast = {}
				M2Time = M2Time+1
				if Check_blood == 1 then
					local PlayerID = {}
					local x = 0
					
					for	i=1,PlayerNum,1	do	
						PlayerID[i] = GetSearchResult()	--Ū���a�Ҧ����						
						Blood_cast = DW_HateRemain(0) --��������
						for i = 1,3,1 do	--�H����w3�H
							x = rand(table.getn(Blood_cast))+1
							if Blood_cast[x] ~= nil then
								AddBuff(Blood_cast[x],BloodBuffID, 1, 20)
								table.remove(Blood_cast,Blood_cast[x])
							end
						end										
						if	CheckBuff(PlayerID[i], BloodBuffID ) == true and PlayerID[i] ~= nil then	--�靈buff���H�X�@����r�j�x														
							local job = ReadRoleValue( PlayerID[i], EM_RoleValue_VOC )
							local BloodShow = 504048
							if job == 1 then --�Ԥh							
								Blood1_1 = LuaFunc_CreateObjByObj ( Blood1[1] , PlayerID[i] )																
								WriteRoleValue( Blood1_1 , EM_RoleValue_PID , OwnerID() )
								AddToPartition( Blood1_1,RoomID)
								setplot(Blood1_1 , "Dead" , "lua_kenny_Blood_dead_03" , 50 )	--���j�x���`�@��
								BeginPlot(Blood1_1,"LuaS_Discowood_CheckPeace",0)--�Y�O8.5�����i�J�԰����A�N�|���� 
							end							
							if job == 2 then --�C�L
								Blood1_1=LuaFunc_CreateObjByObj ( Blood1[2] , PlayerID[i] )							
								WriteRoleValue( Blood1_1 , EM_RoleValue_PID , OwnerID() )								
								AddToPartition( Blood1_1,RoomID)
								setplot( Blood1_1 , "Dead" , "lua_kenny_Blood_dead_03" , 50 )	--���j�x���`�@��
								BeginPlot(Blood1_1,"LuaS_Discowood_CheckPeace",0)--�Y�O8.5�����i�J�԰����A�N�|����
							end
							if job == 3 then --���
								Blood1_1=LuaFunc_CreateObjByObj ( Blood1[3] , PlayerID[i] )	
								WriteRoleValue( Blood1_1 , EM_RoleValue_PID , OwnerID() )								
								AddToPartition( Blood1_1,RoomID)
								setplot( Blood1_1 , "Dead" , "lua_kenny_Blood_dead_03" , 50 )	--���j�x���`�@��
								BeginPlot(Blood1_1,"LuaS_Discowood_CheckPeace",0)--�Y�O8.5�����i�J�԰����A�N�|����
							end
							if job == 4 then --�k�v
								Blood1_1=LuaFunc_CreateObjByObj ( Blood1[4] , PlayerID[i] )							
								WriteRoleValue( Blood1_1 , EM_RoleValue_PID , OwnerID() )
								AddToPartition( Blood1_1,RoomID)
								setplot( Blood1_1 , "Dead" , "lua_kenny_Blood_dead_03" , 50 )	--���j�x���`�@��
								BeginPlot(Blood1_1,"LuaS_Discowood_CheckPeace",0)--�Y�O8.5�����i�J�԰����A�N�|����
							end
							if job == 5 then --���q
								Blood1_1=LuaFunc_CreateObjByObj ( Blood1[5] , PlayerID[i] )							
								WriteRoleValue( Blood1_1 , EM_RoleValue_PID , OwnerID() )
								AddToPartition( Blood1_1,RoomID)
								setplot( Blood1_1 , "Dead" , "lua_kenny_Blood_dead_03" , 50 )	--���j�x���`�@��
								BeginPlot(Blood1_1,"LuaS_Discowood_CheckPeace",0)--�Y�O8.5�����i�J�԰����A�N�|����
							end
							if job == 6 then --�C�L
								Blood1_1=LuaFunc_CreateObjByObj ( Blood1[6] , PlayerID[i] )							
								WriteRoleValue( Blood1_1 , EM_RoleValue_PID , OwnerID() )
								AddToPartition( Blood1_1,RoomID)
								setplot( Blood1_1 , "Dead" , "lua_kenny_Blood_dead_03" , 50 )	--���j�x���`�@��
								BeginPlot(Blood1_1,"LuaS_Discowood_CheckPeace",0)--�Y�O8.5�����i�J�԰����A�N�|����
							end
							if job == 7 then --����
								Blood1_1=LuaFunc_CreateObjByObj ( Blood1[7] , PlayerID[i] )							
								WriteRoleValue( Blood1_1 , EM_RoleValue_PID , OwnerID() )
								AddToPartition( Blood1_1,RoomID)
								setplot( Blood1_1 , "Dead" , "lua_kenny_Blood_dead_03" , 50 )	--���j�x���`�@��
								BeginPlot(Blood1_1,"LuaS_Discowood_CheckPeace",0)--�Y�O8.5�����i�J�԰����A�N�|����
							end
							if job == 8 then --���x
								Blood1_1=LuaFunc_CreateObjByObj ( Blood1[8] , PlayerID[i] )							
								WriteRoleValue( Blood1_1 , EM_RoleValue_PID , OwnerID() )
								AddToPartition( Blood1_1,RoomID)
								setplot( Blood1_1 , "Dead" , "lua_kenny_Blood_dead_3" , 50 )	--���j�x���`�@��
								BeginPlot(Blood1_1,"LuaS_Discowood_CheckPeace",0)--�Y�O8.5�����i�J�԰����A�N�|����
							end
						end 
						
					end	
					Check_blood = 2
				end
			end
		else 
			CheckTime = 0
			Counter =0   --���}�԰��k0	
			SetFightMode( OwnerID(), 1, 1, 1, 1)
			M1Time = 0
			M2Time = 0
			CzTime = 0
			if CombatBegin1 == 1 then
				for i = 1 , 2 , 1 do					
					DelObj (Door[i])
				end
				CombatBegin1 = 0
			end	
			
		end		
	end
end


function lua_kenny_Blood_dead_03()	--�������j�x��boss����q
	local Boss = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local BossMaxHP = ReadRoleValue(Boss , EM_RoleValue_MaxHP)
	local BossNowHP = ReadRoleValue(Boss , EM_RoleValue_HP)	
	WriteRoleValue(Boss , EM_RoleValue_HP , BossNowHP-BossMaxHP*0.05)
end 

function Lua_kenny_Opendoor1()
	--�R����
	Door = {}
	Door[1] = ReadRoleValue( OwnerID() ,EM_RoleValue_Register1)
	Door[2] = ReadRoleValue( OwnerID() ,EM_RoleValue_Register2)
	for i = 1 , 2 , 1 do					
		DelObj (Door[i])
	end
	return true
end
