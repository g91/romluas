function lua_kenny_AI_blood2_easy()
		local Check_pet = 0  ---�P�_�d���i�J�԰���
		local SkillID = {493720,493721,495351,494193,493724,495352} 	--��{�x���A���]�`�W�A����}�ҡA��z�b�A��{�b�B
		local SkillLV = {1,1,1,1,0,1}			-- �ۦ�LV1
		local CheckTime = 0	--�C��P�_
		
		local SkillSay = { "[SC_102425_1]", "[SC_102425_2]", "[SC_102425_3]", "[SC_102425_4]", "[SC_102425_5]" , "[SC_102425_6]"}	-- �ۦ�����
		--���H�b�A�大���a�I
		--���`�N�O�̲ת����R�C
		--�H������A�ƨ��������ġC
		--�A�̱NĲ�㯫���u��...
		--�A�̨��i�����v���N���_�s�b�I
		--���ڤ���~�b�@���o�c�C
		
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
		local Gohome = 780415
		local Spell1 = 0  --�大�w��on off
		local Rancounter = 0
		SetPlot( OwnerID() , "dead" , "Lua_kenny_Opendoor_easy" , 1000 )
	while 1 do
		
		sleep(10) --1��
		local RoomID = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID ) --����e�ؼмƭ�		
		if (  AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- �ˬd�O�_���}�԰�	
			--�Ұʪ��ת�

			if ReadRoleValue(AttackTarget,EM_RoleValue_IsPlayer) ~= 1 and Check_pet == 0 then ---�p�G�O�D���a�i�J�԰�
				local Pet_owner = ReadRoleValue( AttackTarget ,EM_RoleValue_OwnerGUID )
				SetPosByFlag( Pet_owner , 780444, 2 )
				Check_pet = 1
			end

			if CombatBegin1 == 0 then
				ScriptMessage( OwnerID() , -1 , 2 ,  SkillSay[1], 1 )	--���H�b�A�大���a�I(�]�ܼW�[���)
				Say( OwnerID() , SkillSay[1] )	--���H�b�A�大���a�I(�]�ܼW�[���)
				Door[1] = CreateObjByFlag( 102642 , Door_Flag , 1 , 1 )
				--Door[2] = CreateObjByFlag( 102460 , Door_Flag , 2 , 1 )				
				--for i = 1 , 2 , 1 do					
					SetModeEx( Door[1]   , EM_SetModeType_Move, false )--����
					SetModeEx( Door[1]   , EM_SetModeType_Fight , false )--���i�������
					SetModeEx( Door[1]   , EM_SetModeType_Strikback, false )--����
					SetModeEx( Door[1]   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
					SetModeEx( Door[1]   , EM_SetModeType_Mark, false )--�аO
					SetModeEx( Door[1]   , EM_SetModeType_Obstruct, true )--����		
					AddToPartition( Door[1] , RoomID )
					WriteRoleValue( Door[1] , EM_RoleValue_PID , OwnerID() )
				--end
				WriteRoleValue( OwnerID() ,EM_RoleValue_Register1, door[1])
				--WriteRoleValue( OwnerID() ,EM_RoleValue_Register2, door[2])
				CombatBegin1 = 1				
			end	
			
		local PlayerNum = SetSearchAllPlayer(ReadRoleValue(OwnerID(), EM_RoleValue_RoomID))	--���ƥ����P�h���a�Ҧ����
		local RoomID = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)	
		local CzBuff = 504269  ---���e�N�g�ɳN�����A�쥻��504049		
			CheckTime = CheckTime + 1
			--Say(OwnerID(), "CheckTime="..CheckTime)
			CzTime = CzTime + 1
			--Say(OwnerID(), "CzTime="..CzTime)
			Counter = Counter+1
			--Say(OwnerID(), "Counter="..Counter)
			Rancounter = Rancounter +1
			--Say(OwnerID(), "Rancounter="..Rancounter)
			if Counter == 15 then			--15��νb�B
				ScriptMessage( OwnerID() , -1 , 2 ,  SkillSay[6], 1 )	--���^���A��~�b�@���o�c�C(�]�ܼW�[���)
				Say( OwnerID() , SkillSay[6] )	--���^���A��~�b�@���o�c�C(�]�ܼW�[���)			
				CastSpellLV( OwnerID() , OwnerID(), SkillID[6], SkillLV[6])
				Rancounter = 0
				Counter = 0
			end			
			--if CzTime == 600 then	--10�N���g�z
			--	ScriptMessage( OwnerID() , -1 , 2 ,  SkillSay[4], 1 )	--����Ĳ�㯫���u��...(�]�ܼW�[���)
			--	Say( OwnerID() , SkillSay[4] )	--����Ĳ�㯫���u��...(�]�ܼW�[���)
			--	AddBuff(OwnerID(),CzBuff, 1, -1)
			--	CzTime = 0
			--end		
			if CheckTime >= Smode then	--���q����				
				if mode == 1 then	--�i�J�ĤG���q
					local GoShow = 504049
					mode = 2
					M1Time = 0
					Spell1 = 0
					AddBuff( OwnerID(),GoShow ,1 , 1 ) --�ǰe�S��
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
				if Rancounter == 5 then
					local skillRND =  Rand( 100 )+1 
					--Say(OwnerID(), "skillRND="..skillRND)
					if SkillRND <= 100 and SkillRND > 75 then
						ScriptMessage( OwnerID() , -1 , 2 ,  SkillSay[2], 1 )	--���`�N�O�̲ת����R�C(�]�ܼW�[���)
						--Say( OwnerID() , SkillSay[2] )	--���`�N�O�̲ת����R�C(�]�ܼW�[���)
						CastSpellLV( OwnerID() , AttackTarget, SkillID[3], SkillLV[1])
						Rancounter = 0
					elseif SkillRND <= 75 and SkillRND > 50 then
						ScriptMessage( OwnerID() , -1 , 2 ,  SkillSay[5], 1 )	--�������i�����v���N���_�s�b�I(�]�ܼW�[���)
						--Say( OwnerID() , SkillSay[5] )	--�������i�����v���N���_�s�b�I(�]�ܼW�[���)
						CastSpellLV( OwnerID() , AttackTarget, SkillID[4], SkillLV[1])
						Rancounter = 0
					elseif SkillRND <= 50 and SkillRND > 25 then
						HeatListM2 = DW_HateRemain( 1 )	--�����Ĥ@�줣��		
						local HeatList_New1 = {}
						local x = 0					
						for i = 1,3,1 do	--�H����3�H
							x = rand(table.getn(HeatListM2))+1
							if HeatListM2[x] ~= nil then						
								SysCastSpellLV( OwnerID() , HeatListM2[x], SkillID[2], SkillLV[1])
								Rancounter = 0								
								table.remove(HeatListM2,x)
							end
						end	
					elseif SkillRND <= 25 and SkillRND > 0 then
						if Spell1 == 0 then
							HeatListM1 = DW_HateRemain( 1 )
							local x = 0					
							for i = 1,3,1 do	--�H����w3�H
								x = rand(table.getn(HeatListM1))+1
								if HeatListM1[x] ~= nil then						
									SysCastSpellLV( OwnerID() , HeatListM1[x], SkillID[1], SkillLV[1])
									Rancounter = 0
									Spell1 = 1
									table.remove(HeatListM1,x)
								end
							end
						end
					end	
					skillRND = 0	
				end	
			end
		--***********************************************************************************************************************************************--			
			
			if mode == 2 then	--�ĤG���q		
				local BloodBuffID = 504046	--�大����bbuff
				local Blood1 = {103231,103235,103232,103233,103234,103236,103237,103238}	--���j�x-�Ԥh�A�C�L�A��̡A�k�v�A���q�A�M�h
				local Blood1_1	
				local Blood_cast = {}
				M2Time = M2Time+1
				if Check_blood == 1 then
				Blood_cast = DW_HateRemain(0) --��������
					for i = 1,5,1 do	--�H����3�H
						local x = 0
						x = rand(table.getn(Blood_cast))+1
						if Blood_cast[x] ~= nil then
							AddBuff(Blood_cast[x],BloodBuffID, 1, 10)
							table.remove(Blood_cast,x)
						end
					end				
					ScriptMessage( OwnerID() , -1 , 2 ,  SkillSay[3], 1 )	--�H������A�ƨ��������ġC(�]�ܼW�[���)
					Say( OwnerID() , SkillSay[3] )	--�H������A�ƨ��������ġC(�]�ܼW�[���)	
					local PlayerID = {}
					local j = 0
					j = SetSearchAllPlayer(RoomID)--Ū���a�Ҧ����
					for	i=1,j,1	do	
						PlayerID[i] = GetSearchResult()											
						if	CheckBuff(PlayerID[i], BloodBuffID ) == true and PlayerID[i] ~= nil then	--�靈buff���H�X�@����r�j�x														
							local job = ReadRoleValue( PlayerID[i], EM_RoleValue_VOC )
							if job == 1 then --�Ԥh							
								Blood1_1 = LuaFunc_CreateObjByObj ( Blood1[1] , PlayerID[i] )																
								WriteRoleValue( Blood1_1 , EM_RoleValue_PID , OwnerID() )
								AddToPartition( Blood1_1,RoomID)
								--setplot(Blood1_1 , "Dead" , "lua_kenny_Blood_dead_04_easy" , 50 )	--���j�x���`�@��
								
								setplot(Blood1_1 , "Dead" , "Lua_kenny_delobj_easy" , 50 )	--���j�x���`�R��
								BeginPlot(Blood1_1,"LuaS_Discowood_CheckPeace",0)--�Y�O8.5�����i�J�԰����A�N�|���� 
							end							
							if job == 2 then --�C�L
								Blood1_1=LuaFunc_CreateObjByObj ( Blood1[2] , PlayerID[i] )							
								WriteRoleValue( Blood1_1 , EM_RoleValue_PID , OwnerID() )								
								AddToPartition( Blood1_1,RoomID)
								--setplot( Blood1_1 , "Dead" , "lua_kenny_Blood_dead_04_easy" , 50 )	--���j�x���`�@��
								
								setplot(Blood1_1 , "Dead" , "Lua_kenny_delobj_easy" , 50 )	--���j�x���`�R��
								BeginPlot(Blood1_1,"LuaS_Discowood_CheckPeace",0)--�Y�O8.5�����i�J�԰����A�N�|����
							end
							if job == 3 then --���
								Blood1_1=LuaFunc_CreateObjByObj ( Blood1[3] , PlayerID[i] )	
								WriteRoleValue( Blood1_1 , EM_RoleValue_PID , OwnerID() )								
								AddToPartition( Blood1_1,RoomID)
								--setplot( Blood1_1 , "Dead" , "lua_kenny_Blood_dead_04_easy" , 50 )	--���j�x���`�@��
								
								setplot(Blood1_1 , "Dead" , "Lua_kenny_delobj_easy" , 50 )	--���j�x���`�R��
								BeginPlot(Blood1_1,"LuaS_Discowood_CheckPeace",0)--�Y�O8.5�����i�J�԰����A�N�|����
							end
							if job == 4 then --�k�v
								Blood1_1=LuaFunc_CreateObjByObj ( Blood1[4] , PlayerID[i] )							
								WriteRoleValue( Blood1_1 , EM_RoleValue_PID , OwnerID() )
								AddToPartition( Blood1_1,RoomID)
							--	setplot( Blood1_1 , "Dead" , "lua_kenny_Blood_dead_04_easy" , 50 )	--���j�x���`�@��
								
								setplot(Blood1_1 , "Dead" , "Lua_kenny_delobj_easy" , 50 )	--���j�x���`�R��
								BeginPlot(Blood1_1,"LuaS_Discowood_CheckPeace",0)--�Y�O8.5�����i�J�԰����A�N�|����
							end
							if job == 5 then --���q
								Blood1_1=LuaFunc_CreateObjByObj ( Blood1[5] , PlayerID[i] )							
								WriteRoleValue( Blood1_1 , EM_RoleValue_PID , OwnerID() )
								AddToPartition( Blood1_1,RoomID)
							--	setplot( Blood1_1 , "Dead" , "lua_kenny_Blood_dead_04_easy" , 50 )	--���j�x���`�@��
								
								setplot(Blood1_1 , "Dead" , "Lua_kenny_delobj_easy" , 50 )	--���j�x���`�R��
								BeginPlot(Blood1_1,"LuaS_Discowood_CheckPeace",0)--�Y�O8.5�����i�J�԰����A�N�|����
							end
							if job == 6 then --�C�L
								Blood1_1=LuaFunc_CreateObjByObj ( Blood1[6] , PlayerID[i] )							
								WriteRoleValue( Blood1_1 , EM_RoleValue_PID , OwnerID() )
								AddToPartition( Blood1_1,RoomID)
							--	setplot( Blood1_1 , "Dead" , "lua_kenny_Blood_dead_04_easy" , 50 )	--���j�x���`�@��
								
								setplot(Blood1_1 , "Dead" , "Lua_kenny_delobj_easy" , 50 )	--���j�x���`�R��
								BeginPlot(Blood1_1,"LuaS_Discowood_CheckPeace",0)--�Y�O8.5�����i�J�԰����A�N�|����
							end
							if job == 7 then --����
								Blood1_1=LuaFunc_CreateObjByObj ( Blood1[7] , PlayerID[i] )							
								WriteRoleValue( Blood1_1 , EM_RoleValue_PID , OwnerID() )
								AddToPartition( Blood1_1,RoomID)
							--	setplot( Blood1_1 , "Dead" , "lua_kenny_Blood_dead_04_easy" , 50 )	--���j�x���`�@��
							
								setplot(Blood1_1 , "Dead" , "Lua_kenny_delobj_easy" , 50 )	--���j�x���`�R��
								BeginPlot(Blood1_1,"LuaS_Discowood_CheckPeace",0)--�Y�O8.5�����i�J�԰����A�N�|����
							end
							if job == 8 then --���x
								Blood1_1=LuaFunc_CreateObjByObj ( Blood1[8] , PlayerID[i] )							
								WriteRoleValue( Blood1_1 , EM_RoleValue_PID , OwnerID() )
								AddToPartition( Blood1_1,RoomID)
							--	setplot( Blood1_1 , "Dead" , "lua_kenny_Blood_dead_04_easy" , 50 )	--���j�x���`�@��
							
								setplot(Blood1_1 , "Dead" , "Lua_kenny_delobj_easy" , 50 )	--���j�x���`�R��
								BeginPlot(Blood1_1,"LuaS_Discowood_CheckPeace",0)--�Y�O8.5�����i�J�԰����A�N�|����
							end
						end 
						
					end	
					Check_blood = 2
				end
			end
		elseif HateListCount(OwnerID()) == 0 then			
			CheckTime = 0
			Counter =0   --���}�԰��k0	
			SetFightMode( OwnerID(), 1, 1, 1, 1)
			SetPosByFlag( OwnerID(), Gohome , 1 )
			M1Time = 0
			M2Time = 0
			CzTime = 0
			Check_blood = 0
			Rancounter = 0
			if CombatBegin1 == 1 then
				--for i = 1 , 2 , 1 do					
					DelObj (Door[1])
				--end
				CombatBegin1 = 0
			end	
			
		end		
	end
end


function lua_kenny_Blood_dead_04_easy()	--�������j�x��boss����q
	local Boss = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local BossMaxHP = ReadRoleValue(Boss , EM_RoleValue_MaxHP)
	local BossNowHP = ReadRoleValue(Boss , EM_RoleValue_HP)	
	WriteRoleValue(Boss , EM_RoleValue_HP , BossNowHP-BossMaxHP*0.1)
end 

function Lua_kenny_Opendoor_easy()
	Door = {}
	Door[1] = ReadRoleValue( OwnerID() ,EM_RoleValue_Register1)		
		DelObj (Door[1])
	return true
end

function Lua_kenny_delobj_easy()
	sleep(20)
	Delobj(OwnerID())
end