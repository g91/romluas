function LuaFA_423908_01()					-- �� 423908 ������ȼ@��
--	local Player = OwnerID()
--	local Target = TargetID()
	WriteRoleValue(OwnerID(),EM_RoleValue_Register3,0)			-- �H�~�ɽs���~���b
--	Tell( Target , Player , "[SC_423908_01]" )	-- ������򪱮a�մ����R01
--	sleep (20)						-- ���ܤ����n�𮧤@�U���M�Ӳ�
--	Tell( Target , Player , "[SC_423908_02]" )	-- ������򪱮a�մ����R02
end

function LuaFA_209051_01()										-- �ϥαH�~�ɡ]209051�^���ʧ@
	local CrabID
	local Player = OwnerID()
	local S_NotHere = "[SC_423908_03]"
	local S_JustHere = "[SC_423908_04]"
--	DebugMsg(0,0,FN_CountBuffLevel (Player,508836).."inPut")

	if CheckAcceptQuest (Player, 423908) ==  true						-- �p�G���ۥ���423908
	and CheckBuff(Player,508792) == false then						-- �B 508792 ���a�H�~�ɥ�buff���b���W
		if DW_CheckDis (Player, 780872, 0, 500) == false 
		and DW_CheckDis (Player, 780872, 1, 500) == false 
		and DW_CheckDis (Player, 780872, 2, 500) == false 
		and DW_CheckDis (Player, 780872, 3, 500) == false then				-- ���P�_�d���flag���Z���A�Y�ӻ�
			ScriptMessage( Player , Player , 1 , S_NotHere, C_Red )	-- �����ⶤ���������O�o��K
			ScriptMessage( Player , Player , 0 , S_NotHere, C_Red )	-- �����ⶤ���������O�o��K
		else											-- �b�d�򤺪���
			ScriptMessage( Player , Player , 1 , S_JustHere, C_Red )	-- �����ⶤ���������ӴN�O�o�̤F�C
			ScriptMessage( Player , Player , 0 , S_JustHere, C_Red )	-- �����ⶤ���������ӴN�O�o�̤F�C
			AddBuff(Player, 508836, 0, -1)						-- ���y�{�����buff
			CrabID =LuaFunc_CreateObjByObj(105193, Player)			-- ��H�~�ɺئb���a�}�U
			WriteRoleValue(Player,EM_RoleValue_Register3,CrabID)		-- ��ȼg�b���a���W
			WriteRoleValue(CrabID,EM_RoleValue_Register4,0)			-- �����Ψ쪺�H�~�ɨ����P�_����g�b�H�~�ɨ��W�w�]�s
			SetRoleCamp( CrabID , "Visitor" ); 				-- ��H�~�ɪ��}��令����NPC
			AddBuff(Player, 508792, 0, -1)					-- �����a�H�~�ɾ��a�ޯ�
			UseItemDestroy(Player) 						-- ��]�]�̭������V�m�H�~�ɬ屼
--			DebugMsg(0,0,"a. Player is "..Player)
			CallPlot(CrabID,"LuaFA_423908_CheckPCLocal", Player)			-- �}�l�P�_���a��m�� function
		end
	end
end


function LuaFA_423908_CheckPCLocal(Player)								-- �P�_���a��m�� function
--			DebugMsg(0,0,"b. Player is "..Player)
	local CrabID = OwnerID()
	local S_Abandon = "[SC_423908_ABANDON]"
	local S_TooFar = "[SC_423908_05]"
	-- DebugMsg(0,0,FN_CountBuffLevel (Player,508836).."inLocal")

	while 1 do											-- �i�j��
		sleep (10)										-- ��10��H�K�D���Ӧ�
		if CheckID(Player) == FALSE then
			DelObj(CrabID)							-- �F���H�~��
			return
		end
		if CheckAcceptQuest (Player, 423908) == false then					-- �p�G���a���o�����423908�����F
			ScriptMessage( Player , Player , 1 , S_Abandon, C_Red )	-- �A�����F[423908]�o�ӥ��ȡA���ȭ��m�C
			ScriptMessage( Player , Player , 0 , S_Abandon, C_Red )	-- �A�����F[423908]�o�ӥ��ȡA���ȭ��m�C
			LuaFA_209097_ResetQuest(Player)							-- Reset����
			return
		elseif CheckBuff(Player, 508792) == false then
			LuaFA_209097_ResetQuest(Player)							-- Reset����
			return
		elseif DW_CheckDis (Player, 780872, 0, 550) == false					-- �p�G���a�Z�������d�򤤤�flag ����350
		and DW_CheckDis (Player, 780872, 1, 550) == false
		and DW_CheckDis (Player, 780872, 2, 550) == false
		and DW_CheckDis (Player, 780872, 3, 550) == false
		and CountBodyItem (Player, 209087) == 0 then					-- �ӥB�L�٨S���o�Q�V�m�n���H�~��
			ScriptMessage( Player , Player , 1 , S_TooFar, C_Red )	-- ���b�����ⶤ�������a�谵�A�|�Q�|���C����H�~�ɦ��_�Ӧn�F�C
			ScriptMessage( Player , Player , 0 , S_TooFar, C_Red )	-- ���b�����ⶤ�������a�谵�A�|�Q�|���C����H�~�ɦ��_�Ӧn�F�C
			LuaFA_209097_ResetQuest(Player)							-- Reset����
			GiveBodyItem(Player, 209051, 1)						-- ���٨S�V�m���H�~�ɵ����a
			return										-- �����o�� func
		elseif CountBodyItem (Player, 209087) == 1 then					-- �p�G���W�w�g���V�m�n���H�~�ɤF
			return										-- �����o�� func
		end
	end
end

function LuaFA_508793_CrabAction(Player)											-- �H�~�ɰʧ@���� function
	local CrabID = OwnerID()
	-- DebugMsg(0,0,FN_CountBuffLevel (Player,508836).."inAction")
	local xyz = DW_GetObjXYZ (CrabID)									-- ��H�~�ɪ���m
	local xyz2 = {kg_GetRangePos(CrabID,nil,100,0)}				-- �W���H�~�ɲ��ʪ��ؼ�
	local ActionCheck = 0
	local Relocale = 0

	while 1 do													-- �i�j��
		sleep (10)												-- ��10��H�K�D���Ӧ�
		if Relocale == 1 and ReadRoleValue(CrabID,EM_RoleValue_Register4) == 1 then
			xyz = DW_GetObjXYZ (CrabID)									-- ��H�~�ɪ���m
			xyz2 = {kg_GetRangePos(CrabID,nil,100,0)}				-- �W���H�~�ɲ��ʪ��ؼ�
		end
		if CheckBuff(Player, 508792) == false or CheckAcceptQuest (Player, 423908) == false then	-- �p�G���a�ॢ�F����ޯ�
			return												-- �����o�� func
		elseif CheckBuff(CrabID, 508837) == false then						-- �H�~�ɨS�����Ĥ~�i�H�s�L��
			if ReadRoleValue(CrabID,EM_RoleValue_Register4) == 1 then								-- �Q�]�w���������A
				Relocale = 0
				-- DebugMsg(0,0,"inM")
				KS_Move (CrabID, 10, xyz2[1], xyz2[2], xyz2[3])				-- �h�h�H�~�ɨ�
				while  ReadRoleValue(CrabID,EM_RoleValue_Register4) == 1 and ActionCheck <= 2 do
					sleep (5)
					ActionCheck = ActionCheck + 1
				end
				ActionCheck = 0
				if  ReadRoleValue(CrabID,EM_RoleValue_Register4) == 1 then
					KS_Move (CrabID, 10, xyz[1], xyz[2], xyz[3])					-- �H�~�ɦ^��
				end
				while  ReadRoleValue(CrabID,EM_RoleValue_Register4) == 1 and ActionCheck <= 2 do
					sleep (5)
					ActionCheck = ActionCheck + 1
				end
				ActionCheck = 0
			elseif ReadRoleValue(CrabID,EM_RoleValue_Register4) == 2 then							-- �Q�]�w������
				-- DebugMsg(0,0,"inS")
				Relocale = 1
				StopMove (CrabID, false)							-- �H�~�ɤ���
			elseif ReadRoleValue(CrabID,EM_RoleValue_Register4) == 3 then							-- �Q�]�w�������V�m
				-- DebugMsg(0,0,"inA")
				Relocale = 1
				StopMove (CrabID, false)							-- �H�~�ɤ���
				PlayMotion(CrabID, ruFUSION_ACTORSTATE_ATTACK_UNARMED)		-- ���H�~�ɪŤ⥴�Ů�
				Sleep(10)
			end
		end
	end
end

function LuaFA_508793_Magic()									-- �s�H�~�ɲ��ʡ]�ޯ�^
	local Player = OwnerID()
	local Check = 0
	local CrabID = ReadRoleValue(Player,EM_RoleValue_Register3)
	local CrabAction = ReadRoleValue(CrabID,EM_RoleValue_Register4)
	-- DebugMsg(0,0,FN_CountBuffLevel (Player,508836).."doM")
	local Crabsay = {"[SC_423908_CRABSAY_01]", "[SC_423908_CRABSAY_02]", "[SC_423908_CRABSAY_03]", "[SC_423908_CRABSAY_04]"}
													-- �ŧi�H�~�ɥs�n�}�C
	local S_Move = {"[SC_423908_MOVE_01]","[SC_423908_MOVE_02]",["Doing"] = "[SC_423908_MOVE_DOING]"}
	local S_TooFar = "[SC_423908_TOOFAR]"
	local S_Ready = "[SC_423908_READY]"

	say(Player, S_Move[1])							-- �A�R�O�H�~�ɲ���
	Check = LuaFA_508793_CheckCrab(1,1)									-- �ˬd�H�~���٨Ĥ���
	if GetDistance( Player, CrabID) > 100 then					-- �p�G���a���H�~�ɶZ���W�L50
		ScriptMessage( Player , Player , 1 , S_TooFar, C_Red )	-- �H�~�ɦ��G���A�ӻ��Ať����A���R�O�K
		ScriptMessage( Player , Player , 0 , S_TooFar, C_Red )	-- �H�~�ɦ��G���A�ӻ��Ať����A���R�O�K
		return											-- ���� function
	elseif CrabAction == 0 then							-- �Y�H�~�ɨ����禡�٨S�}�l
		WriteRoleValue(CrabID,EM_RoleValue_Register4,1)								-- �]�w���H�~�ɨ���
		CallPlot (CrabID, "LuaFA_508793_CrabAction", Player)					-- �}�l�H�~�ɨ����禡
		if CheckBuff(CrabID, 508837) == false then						-- �p�G����
			say(CrabID, Crabsay[RandRange(1, 4)])					-- �q�}�C�̭���@�y�X�ӷ�H�~�ɪ��s�n
			ScriptMessage( Player , Player , 1 , S_Move[2], C_Red )	-- �H�~�ɨĨ�ť�A���R�O����
			ScriptMessage( Player , Player , 0 , S_Move[2], C_Red )	-- �H�~�ɨĨ�ť�A���R�O����
			if Check == "ok" then
				ScriptMessage( Player , Player , 1 , S_Ready, C_Red )	-- �H�~�����Ӥw�g�V�m�����A�i�H�a�^�h�F�C���e���U�ӧa�C
				ScriptMessage( Player , Player , 0 , S_Ready, C_Red )	-- �H�~�����Ӥw�g�V�m�����A�i�H�a�^�h�F�C���e���U�ӧa�C
			end
		end
	elseif CheckBuff(CrabID, 508837) == true then					-- �Y�H�~�ɤ��ĴNԣ�]�O��
		return											-- ���� function
	elseif CrabAction == 1 then							-- �Y�H�~�ɤw�g�Q�]�w������
		ScriptMessage( Player , Player , 1 , S_Move["Doing"], C_Red )	-- �H�~�ɤw�g�b�����o
		ScriptMessage( Player , Player , 0 , S_Move["Doing"], C_Red )	-- �H�~�ɤw�g�b�����o
	elseif CrabAction == 2 or CrabAction == 3 then			-- �Y�H�~�ɥثe�O�Q�H�R�O���U�Ϊ̽m�ߧ����ʧ@�����A
		WriteRoleValue(CrabID,EM_RoleValue_Register4,1)								-- �]�w�s�L��
		say(CrabID, Crabsay[RandRange(1, 4)])					-- �q�}�C�̭���@�y�X�ӷ�H�~�ɪ��s�n
		ScriptMessage( Player , Player , 1 , S_Move[2], C_Red )	-- �H�~�ɨĨ�ť�A���R�O����
		ScriptMessage( Player , Player , 0 , S_Move[2], C_Red )	-- �H�~�ɨĨ�ť�A���R�O����
		if Check == "ok" then
			ScriptMessage( Player , Player , 1 , S_Ready, C_Red )	-- �H�~�����Ӥw�g�V�m�����A�i�H�a�^�h�F�C���e���U�ӧa�C
			ScriptMessage( Player , Player , 0 , S_Ready, C_Red )	-- �H�~�����Ӥw�g�V�m�����A�i�H�a�^�h�F�C���e���U�ӧa�C
		end
	end
	LuaFA_508793_CheckCrab(2)									-- �ˬd���ȧ����S
end

function LuaFA_508794_Magic()									-- �s�H�~�ɰ���]�ޯ�^
	local Player = OwnerID()
	local CrabID = ReadRoleValue(Player,EM_RoleValue_Register3)
	local CrabAction = ReadRoleValue(CrabID,EM_RoleValue_Register4)
	-- DebugMsg(0,0,FN_CountBuffLevel (Player,508836).."doS")
	local Crabsay = {"[SC_423908_CRABSAY_01]", "[SC_423908_CRABSAY_02]", "[SC_423908_CRABSAY_03]", "[SC_423908_CRABSAY_04]"}
													-- �ŧi�H�~�ɥs�n�}�C
	local S_Stop = {"[SC_423908_STOP_01]","[SC_423908_STOP_02]",["Doing"] = "[SC_423908_STOP_DOING]"}
	local S_TooFar = "[SC_423908_TOOFAR]"

	say(Player, S_Stop[1])							-- �A�R�O�H�~�ɰ���
	LuaFA_508793_CheckCrab(1,2)									-- �ˬd�H�~���٨Ĥ���
	if GetDistance( Player, CrabID) > 100 then					-- �p�G���a���H�~�ɶZ���W�L50
		ScriptMessage( Player , Player , 1 , S_TooFar, C_Red )	-- �H�~�ɦ��G���A�ӻ��Ať����A���R�O�K
		ScriptMessage( Player , Player , 0 , S_TooFar, C_Red )	-- �H�~�ɦ��G���A�ӻ��Ať����A���R�O�K
		return											-- ���� function
	elseif CheckBuff(CrabID, 508837) == true then					-- �Y�H�~�ɤ��ĴNԣ�]�O��
		return											-- ���� function
	elseif CrabAction == 0 then
		WriteRoleValue(CrabID,EM_RoleValue_Register4,2)									-- �]�w���H�~�ɰ���
		CallPlot (CrabID, "LuaFA_508793_CrabAction", Player)						-- �}�l�H�~�ɨ����禡
		if CheckBuff(CrabID, 508837) == false then						-- �p�G����
			say(CrabID, Crabsay[RandRange(1, 4)])					-- �q�}�C�̭���@�y�X�ӷ�H�~�ɪ��s�n
			ScriptMessage( Player , Player , 1 , S_Stop[2], C_Red )	-- �H�~�ɨĨ�ť�A���R�O����
			ScriptMessage( Player , Player , 0 , S_Stop[2], C_Red )	-- �H�~�ɨĨ�ť�A���R�O����
		end
	elseif CrabAction == 2 then							-- �Y�H�~�ɥثe�w�g�O�Q�H�R�O���U�����A
		ScriptMessage( Player , Player , 1 , S_Stop["Doing"], C_Red )	-- �H�~�ɤw�g�O���۪��o
		ScriptMessage( Player , Player , 0 , S_Stop["Doing"], C_Red )	-- �H�~�ɤw�g�O���۪��o
	else												-- �H�~�ɥ��b��
		WriteRoleValue(CrabID,EM_RoleValue_Register4,2)								-- �s�H�~�ɰ��U
		say(CrabID, Crabsay[RandRange(1, 4)])					-- �q�}�C�̭���@�y�X�ӷ�H�~�ɪ��s�n
		ScriptMessage( Player , Player , 1 , S_Stop[2], C_Red )	-- �H�~�ɨĨ�ť�A���R�O����
		ScriptMessage( Player , Player , 0 , S_Stop[2], C_Red )	-- �H�~�ɨĨ�ť�A���R�O����
	end
	LuaFA_508793_CheckCrab(2)									-- �ˬd���ȧ����S
end

function LuaFA_508795_Magic()										-- �s�H�~�ɽm�ߥ��Ů�]�ޯ�^
	local Player = OwnerID()
	local Check = 0
	local CrabID = ReadRoleValue(Player,EM_RoleValue_Register3)
	local CrabAction = ReadRoleValue(CrabID,EM_RoleValue_Register4)
	-- DebugMsg(0,0,FN_CountBuffLevel (Player,508836).."doA")
	local Crabsay = {"[SC_423908_CRABSAY_01]", "[SC_423908_CRABSAY_02]", "[SC_423908_CRABSAY_03]", "[SC_423908_CRABSAY_04]"}
														-- �ŧi�H�~�ɥs�n�}�C
	local S_Attack = {"[SC_423908_ATTACK_01]","[SC_423908_ATTACK_02]",["Doing"] = "[SC_423908_ATTACK_DOING]"}
	local S_TooFar = "[SC_423908_TOOFAR]"
	local S_Ready = "[SC_423908_READY]"

	say(Player, S_Attack[1])								-- �A�R�O�H�~�ɰ���
	Check = LuaFA_508793_CheckCrab(1,3)										-- �ˬd�H�~���٨Ĥ���
	if GetDistance( Player, CrabID) > 100 then						-- �p�G���a���H�~�ɶZ���W�L50
		ScriptMessage( Player , Player , 1 , S_TooFar, C_Red )		-- �H�~�ɦ��G���A�ӻ��Ať����A���R�O�K
		ScriptMessage( Player , Player , 0 , S_TooFar, C_Red )		-- �H�~�ɦ��G���A�ӻ��Ať����A���R�O�K
		return												-- ���� function
	elseif CrabAction == 0 then								-- �Y�H�~�ɨ����禡�٨S�}�l
		WriteRoleValue(CrabID,EM_RoleValue_Register4,3)									-- �]�w���H�~�ɧ���
		CallPlot (CrabID, "LuaFA_508793_CrabAction", Player)						-- �}�l�H�~�ɨ����禡
		if CheckBuff(CrabID, 508837) == false then						-- �p�G����
			say(CrabID, Crabsay[RandRange(1, 4)])						-- �q�}�C�̭���@�y�X�ӷ�H�~�ɪ��s�n
			ScriptMessage( Player , Player , 1 , S_Attack[2], C_Red )		-- �H�~�ɨĨ�ť�A���R�O�m�ߧ����ʧ@
			ScriptMessage( Player , Player , 0 , S_Attack[2], C_Red )		-- �H�~�ɨĨ�ť�A���R�O�m�ߧ����ʧ@
			if Check == "ok" then
				ScriptMessage( Player , Player , 1 , S_Ready, C_Red )	-- �H�~�����Ӥw�g�V�m�����A�i�H�a�^�h�F�C���e���U�ӧa�C
				ScriptMessage( Player , Player , 0 , S_Ready, C_Red )	-- �H�~�����Ӥw�g�V�m�����A�i�H�a�^�h�F�C���e���U�ӧa�C
			end
		end
	elseif CheckBuff(CrabID, 508837) == true then						-- �Y�H�~�ɤ��ĴNԣ�]�O��
		return												-- ���� function
	elseif CrabAction == 3 then								-- �Y�H�~�ɤw�g�Q�]�w������
		ScriptMessage( Player , Player , 1 , S_Attack["Doing"], C_Red )	-- �H�~�ɤw�g�b�����o
		ScriptMessage( Player , Player , 0 , S_Attack["Doing"], C_Red )	-- �H�~�ɤw�g�b�����o
	elseif CrabAction == 1 or CrabAction == 2 then				-- �Y�H�~�ɥثe�O�Q�H�R�O�����Ϊ̰��U�����A
		WriteRoleValue(CrabID,EM_RoleValue_Register4,3)									-- �]�w�s�L�m�ߧ����ʧ@
		say(CrabID, Crabsay[RandRange(1, 4)])						-- �q�}�C�̭���@�y�X�ӷ�H�~�ɪ��s�n
		ScriptMessage( Player , Player , 1 , S_Attack[2], C_Red )		-- �H�~�ɨĨ�ť�A���R�O�m�ߧ����ʧ@
		ScriptMessage( Player , Player , 0 , S_Attack[2], C_Red )		-- �H�~�ɨĨ�ť�A���R�O�m�ߧ����ʧ@
		if Check == "ok" then
			ScriptMessage( Player , Player , 1 , S_Ready, C_Red )	-- �H�~�����Ӥw�g�V�m�����A�i�H�a�^�h�F�C���e���U�ӧa�C
			ScriptMessage( Player , Player , 0 , S_Ready, C_Red )	-- �H�~�����Ӥw�g�V�m�����A�i�H�a�^�h�F�C���e���U�ӧa�C
		end
	end
	LuaFA_508793_CheckCrab(2)										-- �ˬd���ȧ����S
end

function LuaFA_508793_CheckCrab(switch,act)									-- �ˬd�H�~�ɨĤ��Ī� function �����ǤJ��switch�ӨM�w������ơAact�P�_�O���U�����s
	local Player = OwnerID()
	local CrabID = ReadRoleValue(Player,EM_RoleValue_Register3)
	local CrabAction = ReadRoleValue(CrabID,EM_RoleValue_Register4)
	-- DebugMsg(0,0,FN_CountBuffLevel (Player,508836).."inCheck")
	local S_Failed = "[SC_423908_FAILED]"
	local S_Done = "[SC_423908_DONE]"

	if switch == 1 then												-- �ǤJ�Ȭ�1���ܴN���Ĥ@���
		if CheckBuff(CrabID, 508837) == true then						-- �p�G�H�~�ɤw�g���ĤF
			-- DebugMsg(0,0,"moBad")
			ScriptMessage( Player , Player , 1 , S_Failed, C_Red )	-- �� �H�~�ɤ��ĤF�A���L�Y���Z�L�i��N�|��
			ScriptMessage( Player , Player , 0 , S_Failed, C_Red )	-- �� �H�~�ɤ��ĤF�A���L�Y���Z�L�i��N�|��
		elseif FA_BuffInfo (Player,508836,3) <4 then	-- �p�G�H�~���٨Ħ��O���H�~�ɦY�F�誺���Ƥp��|��
			if Rand (2) ~= 1 then									-- 2/3���v�H�~�ɤ���
				-- DebugMsg(0,0,"beBad")
				-- DebugMsg(0,0,FN_CountBuffLevel (Player,508836))
				ScriptMessage( Player , Player , 1 , S_Failed, C_Red ) -- �� �H�~�ɤ��ĤF�A���L�Y���Z�L�i��N�|��
				ScriptMessage( Player , Player , 0 , S_Failed, C_Red ) -- �� �H�~�ɤ��ĤF�A���L�Y���Z�L�i��N�|��
				CallPlot (Player, "FA_MoveRandEx", CrabID, 60, "Loop",10, 20) 		-- ���H�~�ɺ��a�H�K����{���Ī��Pı
				AddBuff( CrabID, 508837, 0, -1)					-- ���Хܤ��Ī�buff
			end
		end
	else													-- �ǤJ�Ȥ��O1���ܴN���ĤG���
		if FA_BuffInfo (Player,508836,3) >=4 then						-- ���ˬd���W�y�{����buff�|���ƶq �O�_�ŦX�Y�����Z�����p
			if FA_BuffInfo (Player,508836,3) >= 7 then				-- �Y�y�{����buff�A�|�T���H�W�F�]�h���T���H�W�ʧ@�^
				if  CrabAction == 2 then
					ScriptMessage( Player , Player , 1 , S_Done, C_Red )	-- �H�~�ɬݰ_�Ӥw�g�ܨĤF�A�a�^�h�a�C
					ScriptMessage( Player , Player , 0 , S_Done, C_Red )	-- �H�~�ɬݰ_�Ӥw�g�ܨĤF�A�a�^�h�a�C
					LuaFA_209097_ResetQuest(Player)							-- Reset����
					GiveBodyItem(Player, 209087, 1)						-- ��V�m�n���H�~�ɵ����a
				else
					return "ok"
				end
			else											-- �Y�y�{����buff�٨S�A�|�T���]�h���T���ʧ@�^
				-- DebugMsg(0,0,FN_CountBuffLevel (Player,508836).."before_A")
				AddBuff(Player, 508836, 0, -1)						-- �~���|�y�{����buff
				-- DebugMsg(0,0,FN_CountBuffLevel (Player,508836).."added_A")
			end
		end
	end
end


function LuaFA_209097_01()
	local Player = OwnerID()
	local CrabID = ReadRoleValue(Player,EM_RoleValue_Register3)
	local CrabAction = ReadRoleValue(CrabID,EM_RoleValue_Register4)
	-- DebugMsg(0,0,FN_CountBuffLevel (Player,508836).."inUse")
	local S_CanEat = "[SC_423908_CANTEAT]"
	local S_CanFeed = "[SC_423908_CANTFEED]"
	local S_Fed = "[SC_423908_FED]"

	if CrabID == nil or CrabID == 0 then					-- �p�G�H�~�ɳQ�y�X�ӤF
		ScriptMessage( Player , Player , 0 , S_CanEat, C_Red )	-- �A�˵��F��W��[209097]�A�@�Ѹ{���A�����Dŧ�ӡK�o���ӬO�n���H�~�ɦY���a�C
	elseif GetDistance( Player, CrabID) > 30 then					-- ���H�~�ɶW�L30
		ScriptMessage( Player , Player , 1 , S_CanFeed, C_Red )	-- �A���H�~�ɤӻ��F�A������L�C
		ScriptMessage( Player , Player , 0 , S_CanFeed, C_Red )	-- �A���H�~�ɤӻ��F�A������L�C
	elseif GetDistance( Player, CrabID) <= 30 then					-- ���H�~�ɶZ��30�H��
		if CheckBuff(CrabID, 508837) == true then
			UseItemDestroy(Player)								-- �@�ӳ��Z����
			CancelBuff(CrabID, 508837)							-- �����H�~�ɤ���buff
			CancelBuff(CrabID, 508897)							-- ����FA_MoveRandEx�öè��禡������buff
			if CrabAction ~= 0 then
				if FA_BuffInfo (Player,508836,3) < 5 then					-- �p�G�y�{����buff�٨S�|��4��
					-- DebugMsg(0,0,FA_BuffInfo (Player,508836,3).."added_B")
					AddBuff(Player, 508836, 0, -1)						-- �|�y�{����buff
					-- DebugMsg(0,0,FA_BuffInfo (Player,508836,3).."added_B")
				end
				WriteRoleValue(CrabID,EM_RoleValue_Register4,2)								-- �H�~�ɤ���
			end
			ScriptMessage( Player , Player , 1 , S_Fed, C_Red )		-- �H�~�ɨĨĦa���U�ӦY�A�⤤��[209097]�C
			ScriptMessage( Player , Player , 0 , S_Fed, C_Red )		-- �H�~�ɨĨĦa���U�ӦY�A�⤤��[209097]�C
		else
			if CrabAction ~= 0 then
				WriteRoleValue(CrabID,EM_RoleValue_Register4,2)								-- �H�~�ɤ���
			end
			UseItemDestroy(Player)								-- �@�ӳ��Z����
			ScriptMessage( Player , Player , 1 , S_Fed, C_Red )		-- �H�~�ɨĨĦa���U�ӦY�A�⤤��[209097]�C
			ScriptMessage( Player , Player , 0 , S_Fed, C_Red )		-- �H�~�ɨĨĦa���U�ӦY�A�⤤��[209097]�C
		end
	end
end

function LuaFA_209097_ResetQuest(Player)
	local CrabID = OwnerID()

	CancelBuff(Player, 508836)							-- �������Ҧ�����buff
	CancelBuff(Player, 508792)
	CancelBuff(Player, 508793)
	CancelBuff(Player, 508794)
	CancelBuff(Player, 508795)
	CancelBuff(CrabID, 508837)							-- �����H�~�ɤ���buff
	CancelBuff(CrabID, 508897)							-- ����FA_MoveRandEx�öè��禡������buff
	DelObj(CrabID)							-- �F���H�~��
	WriteRoleValue(Player,EM_RoleValue_Register3,0)							-- �M�űH�~��GitemID�O��
--	WriteRoleValue(CrabID,EM_RoleValue_Register4,0)							-- �M�űH�~�ɱ���Ѽ�
end


function LuaFA_117288_01()
	local Player = OwnerID()
	local Target = TargetID()
	local S_MoreRoe = "[SC_423908_MOREROE]"

	if CheckAcceptQuest (Player, 423908) ==  true						-- �p�G���ۥ���423908
	and CountBodyItem (Player, 209097) == 0 then						-- �B���W�w�g�S��209097�F
		AddSpeakOption(Player,Target,S_MoreRoe,"LuaFA_117288_02",0)				-- �藍�_�K�ڨ��W�����Z�S�F�K
		 LoadQuestOption(Player)
	elseif CheckAcceptQuest (Player, 423915) ==  true and CheckFlag( Player, 544797) == false then		-- �^�������⪺�p�e
		SetSpeakDetail(Player,"[SC_423915_01]")					-- [$playername]�A�A���N�@�O�H
		AddSpeakOption(Player,Target,"[SC_423915_02]", "LuaP_423915_02",0)
	else
		 LoadQuestOption(Player)
	end	
end

function LuaFA_117288_02()
	local S_GiveRoe = "[SC_423908_GIVEROE]"
	local Player = OwnerID()
	DebugMsg(0,0,"GiveMeRoe")
	SetSpeakDetail(Player,S_GiveRoe)	-- ���O��A���n�ٵ��I�ΤF�ܡH���A�S��k�A�ڴN�A���A�@�ǧa�C�o�����n�A�Ψ���֤F�I
	GiveBodyItem(Player,209097,6)
end