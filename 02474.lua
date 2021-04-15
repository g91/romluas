--- Z21 �e�U���ȼ@�� (�̨�)


-------------- 424540 ���Ѩ��Ǥ��ꪺ�ǳ� ----------------

function lua_mika_z21_424540_end()
	Setflag(TargetID(), 545605, 1)   -- �����U�@�ӥ��Ȼݭn��KEY
	Lua_ZonePE_3th_GetScore(110)
end


-- ����NPC - �p�_�Ҥ���i�ܪO(119420) ��l��ܼ@��
function lua_mika_z21_Q424540_npc1()

	local quest = CheckAcceptQuest( OwnerID(), 424540 )  -- �ˬd�O�_�������� true = �� ,  false = �S

	if quest == true then -- ��������
		if Checkflag(OwnerID(), 545596 ) == false then  -- �Skey
			SetSpeakDetail(OwnerID(), "[SC_Z21_Q424540_03]")    -- �٦��o��
			AddSpeakOption(OwnerID(), TargetID(), "[SC_Z21_Q424540_01]", "lua_mika_z21_Q424540_npc11", 0) -- ���U�ǳ�
		else
			SetSpeakDetail(OwnerID(), "[SC_Z21_Q424540_02]")    -- �S�o���F
		end
	else
		SetSpeakDetail(OwnerID(), "[SC_Z21_Q424540_03]")    -- �٦��o��
	end
end


function lua_mika_z21_Q424540_npc2()
	local quest = CheckAcceptQuest( OwnerID(), 424540 )  -- �ˬd�O�_�������� true = �� ,  false = �S

	if quest == true then -- ��������
		if Checkflag(OwnerID(), 545597 ) == false then  -- �Skey
			SetSpeakDetail(OwnerID(), "[SC_Z21_Q424540_03]")    -- �٦��o��
			AddSpeakOption(OwnerID(), TargetID(), "[SC_Z21_Q424540_01]", "lua_mika_z21_Q424540_npc22", 0) -- ���U�ǳ�
		else
			SetSpeakDetail(OwnerID(), "[SC_Z21_Q424540_02]")    -- �S�o���F
		end
	else
		SetSpeakDetail(OwnerID(), "[SC_Z21_Q424540_03]")    -- �٦��o��
	end
end

function lua_mika_z21_Q424540_npc3()
	local quest = CheckAcceptQuest( OwnerID(), 424540 )  -- �ˬd�O�_�������� true = �� ,  false = �S

	if quest == true then -- ��������
		if Checkflag(OwnerID(), 545598 ) == false then  -- �Skey
			SetSpeakDetail(OwnerID(), "[SC_Z21_Q424540_03]")    -- �٦��o��
			AddSpeakOption(OwnerID(), TargetID(), "[SC_Z21_Q424540_01]", "lua_mika_z21_Q424540_npc33", 0) -- ���U�ǳ�
		else
			SetSpeakDetail(OwnerID(), "[SC_Z21_Q424540_02]")    -- �S�o���F
		end
	else
		SetSpeakDetail(OwnerID(), "[SC_Z21_Q424540_03]")    -- �٦��o��
	end
end




-- ���U�ǳ�
function lua_mika_z21_Q424540_npc11()
	CloseSpeak(OwnerID())
	SetFlag(OwnerID(), 545596, 1 )
end

function lua_mika_z21_Q424540_npc22()
	CloseSpeak(OwnerID())
	SetFlag(OwnerID(), 545597, 1 )
end

function lua_mika_z21_Q424540_npc33()
	CloseSpeak(OwnerID())
	SetFlag(OwnerID(), 545598, 1 )
end

-----------  424541 �������� ----------- 

---- ����NPC - ��f���ѤH(119423) ��l��ܼ@��
function lua_mika_z21_Q424541_npc01()

	local quest = CheckAcceptQuest( OwnerID(), 424541 )  -- �ˬd�O�_�������� true = �� ,  false = �S

	if quest == true then -- �������� 
		if  Checkflag( OwnerID(), 545599 )  == false then --  �Skey
			SetSpeakDetail(OwnerID(), "[SC_Z21_Q424541_05]")   -- �@����
			AddSpeakOption( OwnerID(), TargetID(), "[SC_Z21_Q424541_01]", "lua_mika_z21_Q424541_npc11", 0) -- (���ŶܡH�ڷQ�M�A���ӬG�ơK�C)
		else  --��key
			SetSpeakDetail(OwnerID(), "[SC_Z21_Q424541_02]")   -- �w�������
		end
	else
		SetSpeakDetail(OwnerID(), "[SC_Z21_Q424541_05]")   -- �@����
	end

end

function lua_mika_z21_Q424541_npc11()
	SetSpeakDetail(OwnerID(), "[SC_Z21_Q424541_02]")   -- �w�������
	Setflag(OwnerID(), 545599, 1)
end


---- ����NPC - �s�a���A�ȭ� (119424) ��l��ܼ@��
function lua_mika_z21_Q424541_npc02()

	local quest = CheckAcceptQuest( OwnerID(), 424541 )  -- �ˬd�O�_�������� true = �� ,  false = �S

	if quest == true then -- �������� 
		if  Checkflag( OwnerID(), 545600 )  == false then --  �Skey
			SetSpeakDetail(OwnerID(), "[SC_Z21_Q424541_06]")   -- �@����
			AddSpeakOption( OwnerID(), TargetID(), "[SC_Z21_Q424541_01]", "lua_mika_z21_Q424541_npc22", 0) -- (���ŶܡH�ڷQ�M�A���ӬG�ơK�C)
		else  --��key
			SetSpeakDetail(OwnerID(), "[SC_Z21_Q424541_03]")   -- �w�������
		end
	else
		SetSpeakDetail(OwnerID(), "[SC_Z21_Q424541_06]")   -- �@����
	end

end

function lua_mika_z21_Q424541_npc22()
	SetSpeakDetail(OwnerID(), "[SC_Z21_Q424541_03]")
	Setflag(OwnerID(), 545600, 1)
end



---- ����NPC - ���̪����k(119425) ��l��ܼ@��
function lua_mika_z21_Q424541_npc03()

	local quest = CheckAcceptQuest( OwnerID(), 424541 )  -- �ˬd�O�_�������� true = �� ,  false = �S

	if quest == true then -- �������� 
		if  Checkflag( OwnerID(), 545601 )  == false then --  �Skey
			SetSpeakDetail(OwnerID(), "[SC_Z21_Q424541_07]")   -- �@����
			AddSpeakOption( OwnerID(), TargetID(), "[SC_Z21_Q424541_01]", "lua_mika_z21_Q424541_npc33", 0) -- (���ŶܡH�ڷQ�M�A���ӬG�ơK�C)
		else  --��key
			SetSpeakDetail(OwnerID(), "[SC_Z21_Q424541_04]")   -- �w�������
		end
	else
		SetSpeakDetail(OwnerID(), "[SC_Z21_Q424541_07]")   -- �@����
	end

end

function lua_mika_z21_Q424541_npc33()
	SetSpeakDetail(OwnerID(), "[SC_Z21_Q424541_04]")
	Setflag(OwnerID(), 545601, 1)
end



--------------- 424542 �o�e���~�� ----------------

-- ���~ - 240643 ���ê��Ŷǳ� �ϥ��ˬd
function lua_mika_z21_240643_check()

	local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	-- �i�H�ϥΪ�NPC�C�� �s���W���~��
	local TargetNPC = { 119371, 119375, 119148, 119376, 119370, 119445, 119439, 119443, 119472, 119442, 119369, 119444,  119425, 114891, 119367 }

	local dis = GetDistance(OwnerID(), TargetID() )

	if Checkquest(OwnerID(), 424542, 0 )  == true then  -- ����������

		if dis <= 50 then
			if ( CheckID( TargetID() ) == false ) then  --�S����H
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_424142_1]" , 0 ) --�ϥΥؼп��~�I
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_424142_1]" , 0 ) 
				return false
			elseif ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) == 1 then --�I�k��H�O���a
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_424142_1]" , 0 ) --�ϥΥؼп��~�I
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_424142_1]" , 0 ) 
				return false
			else  
				for i = 1 , 15  do
					if OrgID == TargetNPC[i] and  CheckBuff( TargetID(), 620773 ) == true then
						-- �ܷ��١A�ǳ椰�򪺼Ȯɤ��n�A�����ڤF�C
						ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_Z21_Q424542_02]" , 0 )
						ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_Z21_Q424542_02]" , 0 )
						return false
					elseif OrgID == TargetNPC[i] and  CheckBuff( TargetNPC[i], 620773 ) == false then
						AddBuff(TargetID(), 620773 , 0 , 15 ) -- �ŶǹL�ĪG 15S

						local R = Rand(100)+1
						local R2 = Rand(100)+1
						if R > 45 then
							return true
						else
							if R2 > 60 then
								ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_Z21_Q424542_06]" , 0 )
								ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_Z21_Q424542_06]" , 0 )
								return false
							else
								ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_Z21_Q424542_07]" , 0 )
								ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_Z21_Q424542_07]" , 0 )
								return false
							end

						end


					end
				end
				-- �бN���ǳ�o��[ZONE_LATIFF_KINGDOM]�s���W���~���̡C
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_Z21_Q424542_01]" , 0 )
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_Z21_Q424542_01]" , 0 )
				return false
			end
		else
			-- �ЧA�M�ؼЪ��Z���ӻ��A�L�k�o�e�ǳ�C
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_Z21_Q424542_08]" , 0 )
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_Z21_Q424542_08]" , 0 )
			return false
		end
	else
		ScriptMessage( OwnerID(),  OwnerID(), 1, "[SC_424626_2]" , 0 )  -- �S��������
		ScriptMessage( OwnerID(),  OwnerID(), 0, "[SC_424626_2]" , 0 )  
		return false
	end
end

-- ���~ - 240643 ���ê��Ŷǳ� �ϥμ@��
function lua_mika_z21_240643_use()
--	say(OwnerID(), "OwnerID" ) -- player
--	say(TargetID(), "TargetID" )   -- NPC

	local R = Rand(100)+1
--	Say(OwnerID(), "R = "..R )

	if R > 45 then   -- ���\1
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_Z21_Q424542_04]" , C_SYSTEM )
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_Z21_Q424542_04]" , C_SYSTEM  )

	else 
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_Z21_Q424542_05]" , C_SYSTEM  )
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_Z21_Q424542_05]" , C_SYSTEM  )
	end
	DW_QietKillOne(OwnerID(), 103003  )
end
	

-- ����424542 �o�e���~�� ���ȫ� Ĳ�o�@��
function lua_mika_z21_424542_end()
	Setflag(TargetID(), 545605, 0 )
	Lua_ZonePE_3th_GetScore(340)  -- 2011.11.07 �U�׿n����100
end	

-----------  424539 �ϧܭx�������ǻ� ----------------------

-- Z21 ���Ȫ��~ - 240644 �ǰT�ηϤ� �ϥ��ˬd
function lua_mika_z21_240644_check()
	local count = Lua_Hao_NPC_Range_Search( OwnerID() , 119422 , 30 )  -- range �� �Ϥ��I���I����ƶq

	if Checkquest(OwnerID(), 424539 , 0 )  == true then  -- ����������
		if count > 0 then -- �p�G�����񦳷Ϥ��I���INPC
			return true
		else
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_Z21_Q424539_01]" , 0 )  --��[119422]�ӻ��A�٤���I��C
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_Z21_Q424539_01]" , 0 )
			return false
		end
	else
		ScriptMessage( OwnerID(),  OwnerID(), 1, "[SC_424626_2]" , 0 )  -- �S��������
		ScriptMessage( OwnerID(),  OwnerID(), 0, "[SC_424626_2]" , 0 )  
		return false
	end
end
		

-- Z21 ���Ȫ��~ - 240644 �ǰT�ηϤ� �ϥμ@��
function lua_mika_z21_240644_use()
	local fire = Lua_Hao_NPC_Closest_Search( OwnerID() , 119422  , 30 ) -- �HOwner�����߰��S��j�M�A�^�ǳ̱��񪺪���
	CastSpell(OwnerID(), OwnerID(), 492033 )  --�I��Ϥ��k�N
	DW_QietKillOne(OwnerID(), 103002  )  -- �t�t�����@��NPC - �I��ǰT�ηϤ�
	BeginPlot(fire, "lua_mika_z21_firehide", 0 )
end

function lua_mika_z21_firehide()
	local RoomID = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID )
	Hide(OwnerID())
	sleep(450)  -- 10S
	Show( OwnerID(), RoomID ) 

end