-- 2012�~ 7�� ��´�` ���ʸ`�y�I�� �@�Ψ禡

function lua_mika_weave_story()
	SetSpeakDetail(OwnerID(),"[SC_COLORWEAVE_02]")
end

-- 2012 7�� ��´�` ���� - �]�k���_�v

-- npc���
-- pid =  0 = �D���W�ɬq , 1 = ���W�}�� , 
-- EM_RoleValue_Register = npc R1 �Ω�P�_�������w���W�H��

function lua_mika_weave_npc01()
	local OID = OwnerID()  --player
	local TID = TargetID()  -- Target
	local PID = ReadRoleValue(TID, EM_RoleValue_PID )  --  0 = �D���W�ɬq , 1 = ���W�}�� , 

	if PID == 1 then -- ���ʶ}�����
		SetSpeakDetail( OID , "[SC_WEAVE_TAILOR_11]" )   -- ���
		AddSpeakOption( OID, OID, "[SC_COLORWEAVE_01]","lua_mika_weave_story",0) --��´�`���Ѩ�
		AddSpeakOption( OID, OID, "[SC_WEAVE_TAILOR_12]" , "lua_mika_weave_npc02" , 0)    -- rule �ڸӦp���U�A�H 
		if CheckBuff(OID, 623044 ) == false then   -- �S���Wbuff
			AddSpeakOption( OID , OID , "[SC_WEAVE_TAILOR_13]" , "lua_mika_weave_npc03" , 0)    -- join ���ڨ����Ӧ��a�I
		end
	else
		AddSpeakOption( OID, OID, "[SC_COLORWEAVE_01]","lua_mika_weave_story",0) --��´�`���Ѩ�
		SetSpeakDetail( OID , "[SC_WEAVE_TAILOR_14]" )   -- ���
		AddSpeakOption( OID , OID , "[SC_WEAVE_TAILOR_12]" , "lua_mika_weave_npc02" , 0)    -- rule �ڸӦp���U�A�H 
	end
end

function lua_mika_weave_npc02()
	local OID = OwnerID()  --player
	local TID = TargetID()  -- Target

	SetSpeakDetail( OID , "[SC_WEAVE_TAILOR_15]" )   -- ��� RULE
	AddSpeakOption( OID , OID , "[SO_BACK]" , "lua_mika_weave_npc01" , 0)    --back 
end

function lua_mika_weave_npc03()
	local OID = OwnerID()  --player
	local TID = TargetID()  -- Target
	local R1 = ReadRoleValue(TID, EM_RoleValue_Register) -- npc R1 �Ω�P�_�������w���W�H��
	local today = Checkflag(OID, 546863 )  --��Ѥw���L�]�k���_�v

	if today == true then
		SetSpeakDetail( OID , "[SC_WEAVE_TAILOR_17]" )  --  ���Ѥw�g���L
		AddSpeakOption( OID , OID , "[SO_BACK]" , "lua_mika_weave_npc01" , 0)    --back 
	else 
		if R1 > 9  then -- ���� 
			SetSpeakDetail( OID , "[SC_WEAVE_TAILOR_16]" )  -- �H�Ƥw��
			AddSpeakOption( OID , OID , "[SO_BACK]" , "lua_mika_weave_npc01" , 0)    --back 
		else
			AddRoleValue(TID, EM_RoleValue_Register , 1) 	--NPC�O��R1��+1
			CloseSpeak(OID)  -- ������ܵ���
			ScriptMessage( OID , OID , 1 , "[SC_WEAVE_TAILOR_26]" , C_SYSTEM )  
			ScriptMessage( OID , OID , 0 , "[SC_WEAVE_TAILOR_26]" , C_SYSTEM )

			local R1 = ReadRoleValue(TID, EM_RoleValue_Register) 
	--		Say(TID, "Join count  ="..R1 )
			Addbuff(OID, 623044, 0 , 900 ) -- �������W�ҩ�BUFF
		end
	end

end



------ ���a�ޯ�  ----------

-- �k�N1.2 �I�k�ˬd
function lua_mika_weave_skill01_check()
	local player = OwnerID()
	local Tailor = LuaFunc_SearchNPCbyOrgID( Player , 120889 , 160 , 0 ) --�H���󬰤��ߡA�V�P��N�X�j�M�S�wIDNPC
	local Colormode = ReadRoleValue(Tailor, EM_RoleValue_PID )  -- colormode = PID ,  1 = �� , 2 = �� ,  3 = ��
	local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )  -- �I�k�ؼЪ�Orgid

--	Say(player, "colormode ="..Colormode ) 
	if ( CheckID( TargetID() ) == false ) then  --�S����H
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_WEAVE_TAILOR_20]" , 0 )  --  �S���I�k�ؼ�
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_WEAVE_TAILOR_20]"  , 0 )
		return false
	else

		if ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) == 1 then --�I�k��H�O���a
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_WEAVE_TAILOR_21]" , 0 )   --�L�k�缾�a�ϥ�
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_WEAVE_TAILOR_21]"  , 0 )
			return false
		else  --���O���a
			if ( OrgID == 103013 ) or ( OrgID == 103014 ) or ( OrgID == 103015 )  or ( OrgID == 106548 ) then
				return true
			else 
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_WEAVE_TAILOR_22]" , 0 )   --�ؼп��~�A�й��]�k�����ϥ�
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_WEAVE_TAILOR_22]"  , 0 )
				return false
			end
		end
	end
end


-- �k�N1 �I��
function lua_mika_weave_skill01_use()
	local OID = OwnerID()  -- player
	local ball = TargetID()
	local Tailor = LuaFunc_SearchNPCbyOrgID( OID , 120889 , 160 , 0 ) --�H���󬰤��ߡA�V�P��N�X�j�M�S�wIDNPC
	local Colormode = ReadRoleValue(Tailor, EM_RoleValue_PID )  -- colormode = PID ,  1 = �� , 2 = �� ,  3 = ��
	local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )  -- �I�k�ؼЪ�Orgid
	local flag = 781158 -- balls
	local ballid = {103013, 103014, 103015, 106548 }

	if CheckID(ball) == true then
		if CheckBuff(ball, 623208 ) == true then
			-- do nothing
		else
		 	if Colormode == 1 then  -- ��
				if ( OrgID == ballid[1] ) then  
					Addbuff(ball, 623208, 0 , 2)
					sleep(5)
					 lua_mika_weave_ballreset( TargetID() )  --���m�çR��

					Addbuff(OID, 623045 , 0 , 180 ) -- ���a��o����
					ScriptMessage( OID , OID , 1 , "[SC_WEAVE_TAILOR_18]" , C_SYSTEM )  --�I�񦨥\�A��o����1�I
					AddBuff(OID, 623242, 0, 3)  -- �o���S��
				else
					local playerscore = FN_CountBuffLevel(OID, 623045 )  -- ���a����
					if playerscore >= 1 then 
						CancelBuff(OID, 623045)
						Addbuff(OID, 623045 , playerscore-1 , 180 ) -- ���a������
						ScriptMessage( OID , OID , 1 , "[SC_WEAVE_TAILOR_19]" , 0 )   --�I����~�A���h����1�I
						AddBuff(OID, 623243, 0, 3)  -- �����S��
					else
						CancelBuff(OID, 623045)
						ScriptMessage( OID , OID , 1 , "[SC_WEAVE_TAILOR_19]" , 0 )   --�I����~�A���h����1�I
					end
				end
			elseif Colormode == 2 then
				if ( OrgID == ballid[2] ) then  
					Addbuff(ball, 623208, 0 , 2)
					sleep(5)
					 lua_mika_weave_ballreset( TargetID() )  --���m�çR��

					Addbuff(OID, 623045 , 0 , 180 ) -- ���a��o����
					ScriptMessage( OID , OID , 1 , "[SC_WEAVE_TAILOR_18]" , C_SYSTEM )  --�I�񦨥\�A��o����1�I
					AddBuff(OID, 623242, 0, 3)  -- �o���S��
				else
					local playerscore = FN_CountBuffLevel(OID, 623045 )  -- ���a����
					if playerscore >= 1 then 
						CancelBuff(OID, 623045)
						Addbuff(OID, 623045 , playerscore-1 , 180 ) -- ���a������
						ScriptMessage( OID , OID , 1 , "[SC_WEAVE_TAILOR_19]" , 0 )   --�I����~�A���h����1�I
						AddBuff(OID, 623243, 0, 3)  -- �����S��
					else
						CancelBuff(OID, 623045)
						ScriptMessage( OID , OID , 1 , "[SC_WEAVE_TAILOR_19]" , 0 )   --�I����~�A���h����1�I
					end
				end
			elseif Colormode == 3 then
				if ( OrgID == ballid[3] ) then  
					Addbuff(ball, 623208, 0 , 2)
					sleep(5)
					 lua_mika_weave_ballreset( TargetID() )  --���m�çR��

					Addbuff(OID, 623045 , 0 , 180 ) -- ���a��o����
					ScriptMessage( OID , OID , 1 , "[SC_WEAVE_TAILOR_18]" , C_SYSTEM )  --�I�񦨥\�A��o����1�I
					AddBuff(OID, 623242, 0, 3)  -- �o���S��
				else
					local playerscore = FN_CountBuffLevel(OID, 623045 )  -- ���a����
					if playerscore >= 1 then 
						CancelBuff(OID, 623045)
						Addbuff(OID, 623045 , playerscore-1 , 180 ) -- ���a������
						ScriptMessage( OID , OID , 1 , "[SC_WEAVE_TAILOR_19]" , 0 )   --�I����~�A���h����1�I
						AddBuff(OID, 623243, 0, 3)  -- �����S��
					else
						CancelBuff(OID, 623045)
						ScriptMessage( OID , OID , 1 , "[SC_WEAVE_TAILOR_19]" , 0 )   --�I����~�A���h����1�I
					end
				end
			end
		end
	end
end


-- �k�N2 �I��
function lua_mika_weave_skill02_use()
	local OID = OwnerID()  -- player
	local ball = TargetID()
	local Tailor = LuaFunc_SearchNPCbyOrgID( OID , 120889 , 160 , 0 ) --�H���󬰤��ߡA�V�P��N�X�j�M�S�wIDNPC
	local Colormode = ReadRoleValue(Tailor, EM_RoleValue_PID )  -- colormode = PID ,  1 = �� , 2 = �� ,  3 = ��
	local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )  -- �I�k�ؼЪ�Orgid
	local flag = 781174
	local flagpos = {30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49}
	local R = RAND(20)+1
	local ballid = {103013, 103014, 103015, 106548 }

	if CheckID(ball) == true then

		if CheckBuff(ball, 623208 ) == true then
			-- do nothing
		else
			if Colormode == 1 then  -- ��
				if ( OrgID == ballid[2] ) or ( OrgID == ballid[3] ) or ( OrgID == ballid[4] )  then  
					Addbuff(ball, 623208, 0 , 2)
					sleep(5)
					 lua_mika_weave_ballreset( TargetID() )  --���m�çR��

					Addbuff(OID, 623045 , 0 , 180 ) -- ���a��o����
					ScriptMessage( OID , OID , 1 , "[SC_WEAVE_TAILOR_18]" , C_SYSTEM )  --�I�񦨥\�A��o����1�I
					AddBuff(OID, 623242, 0, 3)  -- �o���S��
				else
					local playerscore = FN_CountBuffLevel(OID, 623045 )  -- ���a����
					if playerscore >= 1 then 
						CancelBuff(OID, 623045)
						Addbuff(OID, 623045 , playerscore-1 , 180 ) -- ���a������
						ScriptMessage( OID , OID , 1 , "[SC_WEAVE_TAILOR_19]" , 0 )   --�I����~�A���h����1�I
						AddBuff(OID, 623243, 0, 3)  -- �����S��
					else
						CancelBuff(OID, 623045)
						ScriptMessage( OID , OID , 1 , "[SC_WEAVE_TAILOR_19]" , 0 )   --�I����~�A���h����1�I
					end
				end
			elseif Colormode == 2 then
				if ( OrgID == ballid[1] ) or ( OrgID == ballid[3] ) or ( OrgID == ballid[4] ) then  
					Addbuff(ball, 623208, 0 , 2)
					sleep(5)
					 lua_mika_weave_ballreset( TargetID() )  --���m�çR��

					Addbuff(OID, 623045 , 0 , 180 ) -- ���a��o����
					ScriptMessage( OID , OID , 1 , "[SC_WEAVE_TAILOR_18]" , C_SYSTEM )  --�I�񦨥\�A��o����1�I
					AddBuff(OID, 623242, 0, 3)  -- �o���S��
				else
					local playerscore = FN_CountBuffLevel(OID, 623045 )  -- ���a����
					if playerscore >= 1 then 
						CancelBuff(OID, 623045)
						Addbuff(OID, 623045 , playerscore-1 , 180 ) -- ���a������
						ScriptMessage( OID , OID , 1 , "[SC_WEAVE_TAILOR_19]" , 0 )   --�I����~�A���h����1�I
						AddBuff(OID, 623243, 0, 3)  -- �����S��
					else
						CancelBuff(OID, 623045)
						ScriptMessage( OID , OID , 1 , "[SC_WEAVE_TAILOR_19]" , 0 )   --�I����~�A���h����1�I
					end

				end
			elseif Colormode == 3 then
				if ( OrgID == ballid[1] ) or ( OrgID == ballid[2] ) or ( OrgID == ballid[4] ) then  
					Addbuff(ball, 623208, 0 , 2)
					sleep(5)
					 lua_mika_weave_ballreset( TargetID() )  --���m�çR��

					Addbuff(OID, 623045 , 0 , 180 ) -- ���a��o����
					ScriptMessage( OID , OID , 1 , "[SC_WEAVE_TAILOR_18]" , C_SYSTEM )  --�I�񦨥\�A��o����1�I
					AddBuff(OID, 623242, 0, 3)  -- �o���S��
				else
					local playerscore = FN_CountBuffLevel(OID, 623045 )  -- ���a����
					if playerscore >= 1 then 
						CancelBuff(OID, 623045)
						Addbuff(OID, 623045 , playerscore-1 , 180 ) -- ���a������
						ScriptMessage( OID , OID , 1 , "[SC_WEAVE_TAILOR_19]" , 0 )   --�I����~�A���h����1�I
						AddBuff(OID, 623243, 0, 3)  -- �����S��
					else
						CancelBuff(OID, 623045)
						ScriptMessage( OID , OID , 1 , "[SC_WEAVE_TAILOR_19]" , 0 )   --�I����~�A���h����1�I
					end

				end
			end
		end
	end
end



--------- ���եΫ��O

function lua_mika_weave_W99()
	local player = OwnerID()
	local NPC = LuaFunc_SearchNPCbyOrgID( player , 120888 , 100 , 0 ) --�H���󬰤��ߡA�V�P��N�X�j�M�S�wIDNPC

	WriteRoleValue(NPC, EM_RoleValue_Register2, 99 )
	local RR = ReadRoleValue(NPC, EM_RoleValue_Register2 )  -- ���եγ��W�}��
	Say(Player, "Weave Tailor ="..RR )

end

function lua_mika_weave_W100()
	local player = OwnerID()
	local NPC = LuaFunc_SearchNPCbyOrgID( player , 120888 , 100 , 0 ) --�H���󬰤��ߡA�V�P��N�X�j�M�S�wIDNPC

	WriteRoleValue(NPC, EM_RoleValue_Register2, 100 )
	local RR = ReadRoleValue(NPC, EM_RoleValue_Register2 )  -- ���եγ��W�}��
	Say(Player, "Weave Tailor  ="..RR )

end

function lua_mika_weave_W0()
	local player = OwnerID()
	local NPC = LuaFunc_SearchNPCbyOrgID( player , 120888 , 100 , 0 ) --�H���󬰤��ߡA�V�P��N�X�j�M�S�wIDNPC

	WriteRoleValue(NPC, EM_RoleValue_Register2, 0 )
	local RR = ReadRoleValue(NPC, EM_RoleValue_Register2 )  -- ���եγ��W�}��
	Say(Player, "weave Tailor - W ="..RR )

end
