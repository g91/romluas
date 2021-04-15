-- 2013�����`_npc�P�Ѥl

		
-- npc�M�μ@�� (�N���ʭ��s�}����W / �M�Ťw�ѥ[�H��)
function lua_mika_fireday_chess_npc_00()
	local NPC = OwnerID()

	AddBuff(  NPC,  503217, 1, -1) 
	FireDayChessPlayers = {}  -- �ŧi�����ܼ�
	WriteRoleValue(NPC, EM_RoleValue_Register+3, 0 )  -- �ثe�ѤU�˼Ʈɶ�
	WriteRoleValue(NPC, EM_RoleValue_Register+1, 0 )  -- ���ʬO�_�}����W, 0 ���i�H���W , 1�����i���W
end

-- NPC��l��ܼ@��
function lua_mika_fireday_chess_npc_01()
	local Player = OwnerID()
	local NPC = TargetID()

	local Open = ReadRoleValue(NPC, EM_RoleValue_Register+1 )  -- ���ʬO�_�}����W, 0 ���i�H���W , 1�����i���W
	local LimitCount = 4  -- ����H�� 4
	local LessCount = 1  -- �ܤ֤H�� 2
	local todayKey = 547380  -- ���Ѥw�ѥ[�L���ʪ�key 
	local JoinBuff = 623962  -- ���W����buff

	if Open == 1 then  -- ���i���W (���ʶ}�l�F)
		SetSpeakDetail(Player, "[SC_2013FIRE_EV1_07]")   -- �ثe�C�����b�i�椤�A�е�������A���W�ѥ[�C
	else  -- �i�H���W
	--	say(NPC, "join count ="..#FireDayChessPlayers )
		if CheckFlag(player, todayKey ) == true then  -- ���Ѱѥ[�L�F

			local Language = GetServerDataLanguage() 
		--	if Language ~= "rw" then  -- �x���M�ݨS�����m�ﶵ  ���ե�
			if Language ~= "tw" then  -- �x���M�ݨS�����m�ﶵ  ������
				SetSpeakDetail(Player, "[SC_2013FIRE_EV1_06]")  --  �A���Ѥw�g�ѥ[�L�o�I���o�ٺɿ��ܡH (��)
			else
				SetSpeakDetail(Player, "[SC_2013FIRE_EV1_06_TW]")  -- �x���S����
			end

		--	if Language ~= "rw" then  -- �x���M�ݨS�����m�ﶵ  ���ե�
			if Language ~= "tw" then  -- �x���M�ݨS�����m�ﶵ  ������
				AddSpeakOption(Player, Player, "[SC_2013FIRE_EV1_10]" , "lua_mika_fireday_chess_npc_05" , 0  )  -- �I�������`���m��
			end

		else  -- �٨S�����L
			if CheckBuff(Player, JoinBuff  ) == true then  -- �������Wbuff 
				SetSpeakDetail(Player, "[SC_2013FIRE_EV1_03][$SETVAR1="..#FireDayChessPlayers.."]")   -- �ثe�w���W���H�Ʀ�[$VAR1]�W�C (��)
			else
				if #FireDayChessPlayers > (LimitCount-1) then  -- �W�L�H��
					SetSpeakDetail(Player, "[SC_2013FIRE_EV1_05]" )  -- ��p�A�������C�����W�H�Ƥw���A�е����A�ӧa�C
					AddSpeakOption(Player, Player, "[SC_2013FIRE_EV1_09]" , "lua_mika_fireday_chess_npc_04" , 0  )  -- �ڷQ�F�ѹC���W�h
				else  -- �٦��ѥ[�W�B
					SetSpeakDetail(Player, "[SC_2013FIRE_EV1_02]")   -- ������ӬD�ԲŤ�ѽL�ܡH
					AddSpeakOption(Player, Player, "[SC_2013FIRE_EV1_09]" , "lua_mika_fireday_chess_npc_04" , 0  )  -- �ڷQ�F�ѹC���W�h
					AddSpeakOption(Player, Player, "[SC_2013FIRE_EV1_08]", "lua_mika_fireday_chess_npc_02" , 0  )  -- �ڷQ�D�ԲŤ�ѽL
				end
			end
		end
	end
end

-- ���ʳW�h���� 
function lua_mika_fireday_chess_npc_04()
	local Player = OwnerID()

	SetSpeakDetail(Player, "[SC_2013FIRE_EV1_01]")  -- �k�d����
end

-- �I�����m��
function lua_mika_fireday_chess_npc_05()
	local Player = OwnerID()

	SetSpeakDetail(Player, "[SC_2013FIRE_EV1_11]")  -- �T�w�n�H<CS>[202904]1��</CS>�I��[208919]1��</CS>�H
	AddSpeakOption(Player, Player, "[SC_0908SEANSON_65]", "lua_mika_fireday_chess_npc_06" , 0  )  -- �T�w
end

-- �I�����m��2
function lua_mika_fireday_chess_npc_06()
	local Player = OwnerID()
	local runeid = 202904   -- �I������
	local ticketid = 208919  -- �I����

	if CountBodyItem(Player, runeid ) >= 1 then  
		CloseSpeak(Player)
		DelBodyItem(Player, runeid, 1 )
		GiveBodyItem(Player,ticketid, 1)
	else
		SetSpeakDetail(Player, "[SC_XMASGOODERROR]")  -- �z�ҫ������~�ƶq�����A�٤���I����C
	end

end

-- �ﶵ- �ѥ[����
function lua_mika_fireday_chess_npc_02()
	local Player = OwnerID()
	local NPC = TargetID()

	local Open = ReadRoleValue(NPC, EM_RoleValue_Register+1 )  -- ���ʬO�_�}����W, 0 ���i�H���W , 1�����i���W
	local fulltime = 60 -- ���W�ɶ����� 60
	local LimitCount = 4  -- ����H��
	local todayKey = 547380  -- ���Ѥw�ѥ[�L���ʪ�key 
	local JoinBuff = 623962  -- ���W����buff	

--	say(NPC, "join count =".. #FireDayChessPlayers )

	if Open == 1 then  -- ���i���W (���ʶ}�l�F)
		SetSpeakDetail(Player, "[SC_2013FIRE_EV1_07]")   -- �ثe�C�����b�i�椤�A�е�������A���W�ѥ[�C
	elseif #FireDayChessPlayers > (LimitCount-1) then  -- �W�L�H��
		SetSpeakDetail(Player, "[SC_2013FIRE_EV1_05]" )  -- ��p�A�������C�����W�H�Ƥw���A�е����A�ӧa�C
		AddSpeakOption(Player, Player, "[SC_2013FIRE_EV1_09]" , "lua_mika_fireday_chess_npc_04" , 0  )  -- �ڷQ�F�ѹC���W�h
	else  -- �i�H���W
		CloseSpeak(Player)
		table.insert(FireDayChessPlayers, Player)  -- ��ѥ[�����a�[�JTable

	--	say(NPC, "now join count ="..#FireDayChessPlayers )

		local joinTime = ReadRoleValue(NPC, EM_RoleValue_Register+3 )  -- �ثe�ѤU�˼Ʈɶ�
		Callplot(Player, "lua_mika_fireday_chess_rangecheck", NPC )  -- ���a���� �ˬd���a�Pnpc�������Z�� (�W�L�N�R�����Wbuff)

		if #FireDayChessPlayers == 1  then  -- ��� �����a���������Ĥ@�Ӱѥ[�����a
			WriteRoleValue(NPC, EM_RoleValue_Register+3, 0 )  -- �ɶ��k0
			Callplot(NPC, "lua_mika_fireday_chess_npc_03", 0  )  -- 120��P�_�O�_�}�Ҭ��� ( �H�� >= 2 ) 
		--	say(NPC, "first join,  120 sec check " )
			AddBuff(Player, JoinBuff, 0, fulltime )  -- �����W��buff 
		else
			AddBuff(Player, JoinBuff, 0, (fulltime-joinTime+1))  -- �����W��buff 
		end

		ScriptMessage( Player , Player , 1 , "[SC_2013FIRE_EV1_MSG_01]" , C_SYSTEM )   -- ���W���\�I�Ф��n���}���ʰϰ�εn�X�A�_�h�N�|�ॢ�ѥ[���C
		ScriptMessage( Player , Player , 0 , "[SC_2013FIRE_EV1_MSG_01]" , C_SYSTEM )   -- ���W���\�I�Ф��n���}���ʰϰ�εn�X�A�_�h�N�|�ॢ�ѥ[���C
	end
end

-- ���a���� - �ˬd�ۤv�P����npc �����Z��
function lua_mika_fireday_chess_rangecheck(NPC)
	local player = OwnerID()

	local limitrange = 300  -- ���a�Pnpc���������ܶZ��
	local joinbuff = 623962  -- ���W��buff
	local buffid = {623956, 623957, 623958 }  -- �Ť��buff ( �� �� ��)
	local gamebuff = 623959  -- ���ʶi�椤buff

	while true do 
		local dis =  GetDistance(NPC, player ) 
	--	say(player, "dis = "..dis )

		if CheckBuff(player, joinbuff)  == true or CheckBuff(Player, gamebuff ) == true then   -- �����Wbuff or �}�lbuff
			if CheckID(NPC) == false then  -- �䤣��npc -- �������
				Callplot(Player, "lua_mika_fireday_chess_endvent" , 0 )
				ScriptMessage( Player , Player , 1 , "[SC_2013FIRE_EV1_MSG_02]" , 0  )   --�A���}�F�Ť�ѽL�����ʰϰ�A�ѥ[���w�����C
				ScriptMessage( Player , Player , 0 , "[SC_2013FIRE_EV1_MSG_02]" , 0  )   --�A���}�F�Ť�ѽL�����ʰϰ�A�ѥ[���w�����C
				break
			elseif dis >= limitrange then  -- �Z���W�L200  -- �������
				Callplot(Player, "lua_mika_fireday_chess_endvent" , 0 )
				ScriptMessage( Player , Player , 1 , "[SC_2013FIRE_EV1_MSG_02]" , 0  )   --�A���}�F�Ť�ѽL�����ʰϰ�A�ѥ[���w�����C
				ScriptMessage( Player , Player , 0 , "[SC_2013FIRE_EV1_MSG_02]" , 0  )   --�A���}�F�Ť�ѽL�����ʰϰ�A�ѥ[���w�����C
				break
	  		elseif dis >= (limitrange-50) then  -- �Z���W�L150  -- ĵ�i�T��	 
				ScriptMessage( Player , Player , 1 , "[SC_2013FIRE_EV1_MSG_03]" , 0  )   -- �`�N�A�A�Y�N���}�Ť�ѽL�����ʰϰ�I
				ScriptMessage( Player , Player , 0 , "[SC_2013FIRE_EV1_MSG_03]" , 0  )   -- �`�N�A�A�Y�N���}�Ť�ѽL�����ʰϰ�I
			end
		else  
			Callplot(Player, "lua_mika_fireday_chess_endvent" , 0 )
			break
		end
		sleep(15)  -- �C���ˬd�@��
	end
end

-- ���a�����W�P����buff ������Ĳ�olua  (���� +���u / �W�L�d�� / ���`  / ���ʵ���)
function lua_mika_fireday_chess_endvent()
	local player = OwnerID()
	local joinbuff = 623962  -- ���W��buff
	local gamebuff = 623959  -- ���ʶi�椤buff
	local buffid = {623956, 623957, 623958 }  -- �Ť��buff ( �� �� ��)

	ClockClose(Player)
	for j = 1 , #buffid do				
		CancelBuff(Player, buffid[j])  --  �R���Ѥlbuff
	end

	for i = 1, #FireDayChessPlayers do
	--	say(FireDayChessPlayers[i], "player -"..i )
		if FireDayChessPlayers[i] == Player then
			table.remove(FireDayChessPlayers, i )
		end
	end
	WriteRoleValue(Player, EM_RoleValue_Register10, 0 )  --  �M�����a���W����npc
	CancelBuff_Noevent(Player, joinbuff )  -- �R�����Wbuff
	CancelBuff_Noevent(Player, gamebuff )  -- �R�����Wbuff
--	say(Player, "buff end")
end

-- ������ �Ĥ@�Ӫ��a���W�� �p����W�ɶ�  == > ���W�ɶ����� ���ʶ}�l
function lua_mika_fireday_chess_npc_03()
	local NPC = OwnerID()

	local fulltime = 59  -- ���W�ɶ� 60
	local LessCount = 1  -- �ܤ֤H�� 2
	local buffid = {623956, 623957, 623958 }  -- �Ť��buff ( �� �� ��)
	local limitrange = 300  -- ���ʽd���Z��
	local todayKey = 547380  -- ���Ѥw�ѥ[�L���ʪ�key 
	local gametime = 180

	for k = 1, fulltime do  -- 120 sec ���W�ɶ� 
		AddRoleValue(NPC, EM_RoleValue_Register+3, 1 )  -- �ɶ�
		local joinTime = ReadRoleValue(NPC, EM_RoleValue_Register+3 )  -- �ثe�ѤU�˼Ʈɶ�
	--	say(NPC, "Join time  ="..joinTime )
	
		if #FireDayChessPlayers == 0 then
			break
		end

		if k == fulltime then  -- ���ʮɶ��}�l 
			if #FireDayChessPlayers > 0  then   -- ���H���W
				WriteRoleValue(NPC, EM_RoleValue_Register+1 , 1 )  -- �g�Jnpc�����i���W

				for i = 1, #FireDayChessPlayers do
					DesignLog( FireDayChessPlayers[i] , 1217371 , " 2013Firegame Chess , join player count = "..#FireDayChessPlayers )	--  �����������ѥ[�H��
					ClockOpen( FireDayChessPlayers[i] ,EM_ClockCheckValue_21, gametime, gametime, 0,"Lua_Clockending", "Lua_Clockending") --�˼ƭp�ɾ�  (�᭱����өI�s�禡�G "���Ϯ���"�A"�ɶ���ɩI�s�禡")
					WriteRoleValue(FireDayChessPlayers[i], EM_RoleValue_Register10, NPC )  --  �N����NPC�g�J���aR10
					SetFlag(FireDayChessPlayers[i], 547380, 1 )  -- ��key - ���Ѱѥ[�L�C��
					CancelBuff_Noevent(FireDayChessPlayers[i], 623962)  -- �R�����Wbuff
					AddBuff(FireDayChessPlayers[i], 623959, 0,  -1 )  -- �����ѥ[���ʪ�buff
					AddBuff(FireDayChessPlayers[i], buffid[Rand(3)+1], 0, -1  )  -- �����H���@�شѤl�� BUFF
					ScriptMessage( FireDayChessPlayers[i] , FireDayChessPlayers[i] , 1 , "[SC_2013FIRE_EV1_MSG_05]" , C_SYSTEM  )   -- �Ť�ѽL�C���}�l�I�I��²b�Ť�����A�ɥi��N�P�⪺�Ť�����s�������u�a�I
					ScriptMessage( FireDayChessPlayers[i] , FireDayChessPlayers[i] , 0 , "[SC_2013FIRE_EV1_MSG_05]" , C_SYSTEM  )   -- �Ť�ѽL�C���}�l�I�I��²b�Ť�����A�ɥi��N�P�⪺�Ť�����s�������u�a�I
				end
				Callplot(NPC, "lua_mika_fireday_chess_start", 0 )  -- ���ʶ}�l

			end
		end
		sleep(10)
	end
end

-- ���ʶ}�l
function lua_mika_fireday_chess_start()
	local NPC = OwnerID()
	local limitrange = 300  -- ���ʽd���Z��
	local gametime = 180  -- ���ʮɶ� 180

	-- �M��npc���W��
	WriteRoleValue(NPC, EM_RoleValue_Register8 , 0 )  
	WriteRoleValue(NPC, EM_RoleValue_Register9, 0 )  
	WriteRoleValue(NPC, EM_RoleValue_Register10, 0 ) 

	for i = 1 , gametime do
		if i == gametime then  -- ���ʮɶ���
			Callplot(NPC, "lua_mika_fireday_chess_end", 0 )
		elseif ReadRoleValue(NPC, EM_RoleValue_Register8)  == 25 then  -- �P�_����
			FireDay2013_Chess_Reboot()  -- �N���������^�զ����
			local score =  ReadRoleValue(NPC, EM_RoleValue_Register10 ) 
			if score < 10 then  -- �{�b���ƬO�_�p��10��
				AddRoleValue( NPC, EM_RoleValue_Register10, -(score) )   -- �����ثe������
			else
				AddRoleValue( NPC, EM_RoleValue_Register10, -10 )   -- ��10��
			end
			WriteRoleValue(NPC, EM_RoleValue_Register8, 0  )  -- R8 �k0
			for p = 1, #FireDayChessPlayers do
				Callplot(FireDayChessPlayers[p], "lua_mika_fireday_chess_deadmsg", 0 )   -- ���ѰT��
			end
		else

			if #FireDayChessPlayers  == 0 then  -- table ���S�����a �Ҧ��H�����}�F
				FireDay2013_Chess_Reboot()  -- �N���������^�զ����
				FireDayChessPlayers = {}  -- ���s�ŧi�����ܼ�
				WriteRoleValue(NPC, EM_RoleValue_Register+3, 0 )  -- �ثe�ѤU�˼Ʈɶ�
				WriteRoleValue(NPC, EM_RoleValue_Register+1, 0 )  --  �g�Jnpc���i���W
				break
			end
		end
		sleep(10)
	end
end

function lua_mika_fireday_chess_deadmsg()
	local Player = OwnerID()
	local NPC = ReadRoleValue(Player, EM_RoleValue_Register10 )  -- ���a��r10�Onpc
	local OrgScroe = ReadRoleValue( NPC, EM_RoleValue_Register10 )		-- NPC���W�ҰO���{������

	-- �ѩ�L�k�A�i��C���A�Ҧ������w�Q�٭쬰�²b�Ť�����æ����ζ�����10��
	ScriptMessage( Player , Player , 1 , "[SC_2013FIRE_EV1_MSG_10]", 0 ) 
	ScriptMessage( Player , Player , 0 , "[SC_2013FIRE_EV1_MSG_10]", 0 ) 
	sleep(10)
	-- �����g�@�A�ζ����Ƥw�Q����10���A�ثe�����Ƭ�[$VAR1]��
	ScriptMessage( Player , Player , 1 , "[SC_2013FIRE_EV1_MSG_11][$SETVAR1="..OrgScroe.."]" , C_SYSTEM  )  
	ScriptMessage( Player , Player , 0 , "[SC_2013FIRE_EV1_MSG_11][$SETVAR1="..OrgScroe.."]" , C_SYSTEM  )  

end


function lua_mika_fireday_chess_end()
	local NPC = OwnerID()
	local buffid = {623956, 623957, 623958 }  -- �Ť��buff ( �� �� ��)

	FireDay2013_Chess_Reboot()  -- �N���������^�զ����

	-- �R���ѥ[���a��buff  / �������y
	for p = 1, #FireDayChessPlayers do
	--	say(FireDayChessPlayers[p], "player -"..p )

		Callplot(FireDayChessPlayers[p], "lua_mika_fireday_chess_endvent" , 0 )

		local score = ReadRoleValue( NPC, EM_RoleValue_Register10 )		-- NPC���W�ҰO���{������
		DesignLog( FireDayChessPlayers[p] , 121737 , " 2013Firegame Chess Complete, group socre = "..score )	--�O���ѥ[�H��
		if score > 0 then
			ScriptMessage( FireDayChessPlayers[p] , FireDayChessPlayers[p] , 1 , "[SC_2013FIRE_EV1_MSG_06][$SETVAR1="..score.."]", C_SYSTEM ) 
			ScriptMessage( FireDayChessPlayers[p] , FireDayChessPlayers[p] , 0 , "[SC_2013FIRE_EV1_MSG_06][$SETVAR1="..score.."]", C_SYSTEM ) 
			GiveBodyItem(FireDayChessPlayers[p], 240996, 2 )	
			if score >= 201 then
				GiveBodyItem(FireDayChessPlayers[p], 208918, 2 )	 
				GiveBodyItem(FireDayChessPlayers[p], 203487, 2 )  -- �]���_��1�I
				DesignLog( FireDayChessPlayers[p] , 1217372 , " 2013Firegame Chess , most high score level, group socre = "..score  )	--  �����̰��϶����ƨ��o��
			elseif score >= 101 and score <= 200 then	
				GiveBodyItem(FireDayChessPlayers[p], 208918, 1 )	 
				GiveBodyItem(FireDayChessPlayers[p], 240378, 3 )  -- �����]��
			elseif score >= 51 and score <= 100 then	
				GiveBodyItem(FireDayChessPlayers[p], 208918, 1 )	 
				GiveBodyItem(FireDayChessPlayers[p], 725654, 1 )
			elseif score >= 11 and score <= 50 then	
				GiveBodyItem(FireDayChessPlayers[p], 208918, 1 )	
			elseif score <= 10 then
				GiveBodyItem(FireDayChessPlayers[p], 725654, 1 )	
			end 
		else  -- �S������
			GiveBodyItem(FireDayChessPlayers[p], 725654, 1 )		
			ScriptMessage( FireDayChessPlayers[p] , FireDayChessPlayers[p] , 1 , "[SC_2013FIRE_EV1_MSG_08]", C_SYSTEM ) 
			ScriptMessage( FireDayChessPlayers[p] , FireDayChessPlayers[p] , 0 , "[SC_2013FIRE_EV1_MSG_08]", C_SYSTEM ) 
		end
		Lua_Festival_01_All(FireDayChessPlayers[p])  -- �����Լ�
	end

	FireDayChessPlayers = {}  -- �ŧi�����ܼ�
	WriteRoleValue(NPC, EM_RoleValue_Register+3, 0 )  -- �ثe�ѤU�˼Ʈɶ�
	WriteRoleValue(NPC, EM_RoleValue_Register10,  0 )   -- �M�Ū��a����
	WriteRoleValue(NPC, EM_RoleValue_Register+1, 0 )  --  �g�Jnpc���i���W

	--	say(NPC, "game over ,  now join ok ")
end

 ---------------------------���եΫ��O  ---------------------------

------------- �g�J���ƫ��O -------------
-- ���ʶi�椤�~��ϥ�

function lua_mika_fireday_chess_score(score) 
	local Player = OwnerID()
	local NPC = ReadRoleValue( Player, EM_RoleValue_Register10 )	-- NPC


	if CheckID(NPC) == false then  -- �O�_�ˬd�o��npc
		say(Player, "commend error ")
	else
		WriteRoleValue( NPC, EM_RoleValue_Register10, score )
		local nowScore = ReadRoleValue( NPC, EM_RoleValue_Register10 )	--  ����
		say(Player, "now score = "..nowScore)
	end
end


-- ���եε��S�w�C�⪺buff  �� = 1 , �� = 2 , �� = 3
function lua_mika_fireday_chess_buffget(colorid)  
	local Player = OwnerID()
	local buffid = {623956, 623957, 623958 }  -- �Ť��buff ( �� �� ��)  
	
	for i = 1, #buffid do
		CancelBuff(Player, buffid[i])
	end
	AddBuff(Player, buffid[colorid], 0, -1  )  -- �����H���@�شѤl�� BUFF
end