function Lua_Hao_Pumpkin_GhostParade( Select )	-- ���իn�ʸ`�ʰ��C��A���W��A�������C���}�l�C
	-- 101289 �k �B 101290 �k
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Count = SetSearchAllNPC( RoomID )

	if  Count ~= 0 then
		for i= 1 , Count , 1 do
			local ID = GetSearchResult()
		--	Obj=Role:New(ID)
		--	if Obj:IsNPC() == true then
			local Name = ReadRoleValue( ID , EM_RoleValue_OrgID )--�T�{�Ҧ�NPC���s��
			--	for j = 1 , table.getn( NPC ) , 1 do
					if Select == 0 and Name == 101289 then  --�Y���}�C������
						BeginPlot( ID , "yuyu_111612_0" , 0 )
						break
					elseif Select == 1 and Name == 101290 then  --�Y���}�C������
						BeginPlot( ID , "yuyu_111611_0" , 0 )
						break
					end
			--	end
		--	end
		end
	end
end

function Lua_na_2008_tourist_check(num)	--�ʰ��j�C��NPC�԰��ˬd�@��
	local Leader = OwnerID()
	local _timer = 0;
	While true do
		sleep(10)
		_timer = _timer +1;
--		DebugMsg( 0, 0, "_timer =".._timer )
--		if CheckID( Monster01[1] ) == false and CheckID( Monster01[2] ) == false and CheckID( Monster01[3] ) == false and CheckID( Monster01[4] ) == false then
		local GOGO = ReadRoleValue( Leader , EM_RoleValue_Register  )  
--		SAY( Leader , "GO = "..GOGO)
--		DebugMsg( 0, 0, "GOGO="..GOGO)
		if GOGO >= num or _timer >= 600 then
			SetStopAttack( Leader) 
			ScriptMessage( Leader , 0 , 1 , "[SC_YU_HW_111611_2]" , C_SYSTEM ) --�n�o�I�ڭ̨��a�I
			Say( Leader , "[SC_YU_HW_111611_2]" )  
			WriteRoleValue(Leader ,EM_RoleValue_IsWalk , 0 ) --�b�]
		--	SetFightMode(  Leadergirl , 0, 1, 0, 0 )

			SetModeEx( Leader  , EM_SetModeType_Searchenemy, false )--����
			SetModeEx( Leader , EM_SetModeType_Fight , false )--�i�������
			SetModeEx( Leader  , EM_SetModeType_Strikback, false )--����
			WriteRoleValue(  Leader  , EM_RoleValue_Register , 0 ) --�M�žɹC
			break
		end
	end
end



function Lua_na_2008_monster_check()
	local Owner = OwnerID()
	local NPC = ReadRoleValue( Owner, EM_RoleValue_PID)
	local Time = 0
--	Say( Owner , "CHECK!" )
	if CheckID( NPC) == true  then
		SetAttack( Owner , NPC)
		DebugMsg( 0,0, "ghost attack!")
	end	
--	DebugMsg( 0, 0, "ATTACK"..NPC)
end


function Lua_na_2008_monster_check2()
	local Owner = OwnerID()
	local Time = 0
	while true do
		local NPC_ATTACK = ReadRoleValue( Owner , EM_RoleValue_IsAttackMode)
	--	Say( Owner , "TIME = "..Time )
		if NPC_ATTACK == 0 then
			Time = Time + 1
			if Time == 30 then
				DebugMsg( 0,0, "ghost delete!")
				DelObj( Owner)
				break
			end
		else
			Time = 0 
		end
		sleep(10)
	end	
end


function Lua_na_2008_test_reg()
	local Owner = OwnerID()
	local NPC = SearchRangeNPC( Owner , 30)
	for i = 0 , #NPC do
		local Name = ReadRoleValue( NPC[i] , EM_RoleValue_OrgID)
		local REG = ReadRoleValue( NPC[i] , EM_RoleValue_Register)
		ScriptMessage( NPC[i] , Owner, 0, "I'm "..Name.." , MY REG = ".. REG,  0)
	end
end

function Lua_na_2008_tourist_check2(num) --���b�A�԰����q�]���@��
	local Owner = OwnerID()
	local Time = 0
	sleep(100)
	DebugMsg( 0,0," check in" )
	while true do  
		local attack = ReadRoleValue( Owner , EM_RoleValue_IsAttackMode )
		local Reg = ReadRoleValue( Owner , EM_RoleValue_Register) 
		if attack == 0  and Reg ~= 0 then   --�P�_�O�_�i�J�԰� 1= �O 0= �_
			DebugMsg( 0,0,"OCT_event tourist stop count = "..Time )
			Time = Time+1	
			if Time == 15 then
				WriteRoleValue( Owner, EM_RoleValue_Register , num )
				break
			end
		elseif attack == 0 and Reg == 0 then
			DebugMsg( 0,0," check off" )
			break			 
		end
		sleep(10)
	end
end