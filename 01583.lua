
-- �s���ٸ��t��NPC

-- NPC��l��ܼ@��

function lua_titledevelop_npc_0()
	local npc = TargetID()
	local player = OwnerID()
	
	local openkey = Checkflag(player, 545679 )  --�}�Һٸ��˳Ƥ������
 
	LoadQuestOption(player)

	SetSpeakDetail( player, "[SC_TITLEQUEST_NPC_1]"   ) 

	if openkey == true then -- �w�}�Ҹ�� (�i���C�����)
		AddSpeakOption( player, npc, "[SC_TITLEQUEST_NPC_4]" , "lua_titledevelop_npc_2", 0 ) -- �����V�m
		AddSpeakOption( player, npc, "[SC_TITLEQUEST_NPC_3]" , "lua_titledevelop_npc_1", 0 ) -- ����O���������H 
		AddSpeakOption( player, npc, "[SC_TITLEQUEST_NPC_24]" , "lua_titledevelop_npc_3", 0 ) -- �ڷQ������������������
	end
end


function lua_titledevelop_npc_1()  --�t�λ���  
	local npc = TargetID()
	local player = OwnerID()

	SetSpeakDetail( player, "[SC_TITLEQUEST_NPC_5]"   )   -- �t�λ����W���r
	AddSpeakOption( player, npc, "[SC_TITLEQUEST_NPC_29]" , "lua_titledevelop_npc_s1", 0 ) -- ��������1
	AddSpeakOption( player, npc, "[SC_TITLEQUEST_NPC_31]" , "lua_titledevelop_npc_s2", 0 ) -- ��������2
--	AddSpeakOption( player, npc, "[SC_TITLEQUEST_NPC_13]" , "lua_titledevelop_npc_s3", 0 ) -- ��������3
	AddSpeakOption( player, npc, "[SO_BACK]", "lua_titledevelop_npc_0", 0)             --�^��W�@��
end

function lua_titledevelop_npc_2()  --��������
	local npc = TargetID()
	local player = OwnerID()

	SetSpeakDetail( player, "[SC_TITLEQUEST_NPC_6]"   )   -- ���ȥD������r
	AddSpeakOption( player, npc, "[SC_TITLEQUEST_NPC_7]" , "lua_mika_titlequest_keycheck1", 0 ) -- �������u����
	AddSpeakOption( player, npc, "[SC_TITLEQUEST_NPC_8]" , "lua_mika_titlequest_keycheck2", 0 ) -- �����Žu����
	AddSpeakOption( player, npc, "[SC_TITLEQUEST_NPC_9]" , "lua_mika_titlequest_keycheck3", 0 ) -- �������u����
	AddSpeakOption( player, npc, "[SC_TITLEQUEST_NPC_10]" , "lua_mika_titlequest_keycheck4", 0 ) -- ������u����
	AddSpeakOption( player, npc, "[SO_BACK]", "lua_titledevelop_npc_0", 0)             --�^��W�@��
end

function lua_titledevelop_npc_3()  --�p�󴣤���������
	local npc = TargetID()
	local player = OwnerID()
	local Req = {}
		Req[1] = { 1000 , 10 }	-- �ݨD�������šB�ݨD�g��ȡB�ݨD���������Ū��ƶq
		Req[2] = { 1500 , 15 }
		Req[3] = { 2250 , 35 }
		Req[4] = { 3375 , 100 }
	local Lv , Exp = Lua_Hao_TitleSys_Return_Lv_Exp(Player)
	local Count = Lua_Hao_TitleSys_Q_Check_Rare(Player , Lv)
	local String = {}
		String[1] = "[SC_TITLEQUEST_NPC_26][$SETVAR4="..Exp.."][$SETVAR5="..Req[Lv][1].."]"
		--�g��� <CY>[$VAR1]</CY> / <CY>[$VAR2]</CY>
		String[2] = "[SC_TITLEQUEST_NPC_27][$SETVAR1="..Req[Lv][2].."][$SETVAR2="..Lv.."][$SETVAR3="..Count.."]"
		--�j��<CR>[$VAR1]</CR>��<CR>[$VAR2]</CR>�������ٸ��A
		--�ثe�A�w���o��<CR>[$VAR2]</CR>�������ٸ��ƶq��<CR>[$VAR3]</CR>�ӡC

	if Lv <= 3 then
		SetSpeakDetail( player , "[SC_TITLEQUEST_NPC_25]"..String[1]..String[2] )   -- �p�󴣤���������
	elseif Lv == 4 then
		SetSpeakDetail( player , "[SC_TITLEQUEST_NPC_28]" )
	end

	if Exp == Req[Lv][1] and Count >= Req[Lv][2] and Lv ~= 4 then
		AddSpeakOption( player, npc, "[SC_TITLEQUEST_NPC_33]", "lua_titledevelop_npc_4", 0)	-- ������������
	else
		AddSpeakOption( player, npc, "[SO_BACK]", "lua_titledevelop_npc_0", 0)	--�^��W�@��
	end
end

function lua_titledevelop_npc_4()  --�ɯ�

	local Player = OwnerID()
	local Lv , Exp = Lua_Hao_TitleSys_Return_Lv_Exp(Player)
	local NewLv = Lv+1 
	WriteRoleValue( Player , EM_RoleValue_TitleSys_Lv , NewLv )
	WriteRoleValue( Player , EM_RoleValue_TitleSys_Exp , 0 )
	CastSpell( Player , Player , 491010 )
	--���ߧA�A�A�w�g���\�N�����ٸ����������Ŵ�����[$VAR1]
	ScriptMessage( Player , Player , 1 , "[SC_TITLEQUEST_NPC_22][$SETVAR1="..NewLv.."]" , C_SYSTEM )
	CloseSpeak( Player )
end

function lua_titledevelop_npc_5()		-- �g�J������������1

	local Player = TargetID()
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local Value = {}
	Value[1] = ReadRoleValue( Player , EM_RoleValue_TitleSys_Lv )	-- �¦���������
	WriteRoleValue( Player , EM_RoleValue_TitleSys_Lv , Value[1]+1 )	-- ��������
	Value[2] = ReadRoleValue( Player , EM_RoleValue_TitleSys_Lv )	-- �ק���������
	DebugMsg( Player , Room , "Lv = "..Value[1].." , New Lv = "..Value[2] )
end

function lua_titledevelop_npc_s1()  --�t�λ��� 1
	local npc = TargetID()
	local player = OwnerID()

	SetSpeakDetail( player, "[SC_TITLEQUEST_NPC_30]"   )   -- �t�λ������e1
	AddSpeakOption (player, npc, "[SO_BACK]", "lua_titledevelop_npc_1", 0)             --�^��W�@��
end

function lua_titledevelop_npc_s2()  --�t�λ��� 2
	local npc = TargetID()
	local player = OwnerID()

	SetSpeakDetail( player, "[SC_TITLEQUEST_NPC_32]"   )   -- �t�λ������e2
	AddSpeakOption (player, npc, "[SO_BACK]", "lua_titledevelop_npc_1", 0)             --�^��W�@��
end

function lua_titledevelop_npc_s3()  --�t�λ��� 3
	local npc = TargetID()
	local player = OwnerID()

	SetSpeakDetail( player, "[SC_TITLEQUEST_NPC_23]"   )   -- �t�λ������e3
	AddSpeakOption (player, npc, "[SO_BACK]", "lua_titledevelop_npc_1", 0)             --�^��W�@��
end


----------------------------------------------------------------------------------------------------------
-- �s���ٸ��t�ΨC����� ������@���ҪO

function lua_titlequest_setkey1(setkey)
	local playerID = TargetID()
	local npc = OwnerID()

	Setflag(playerID, setkey, 0 )
	Setflag(playerID, 545680, 1 )   --  ��Ѥw�����������(�D��)
	DW_QietKillOne(playerID, 106262 )
--	Say(playerID, "ok1" )
	DisableQuest(npc, false )
end

function lua_titlequest_setkey2(setkey)
	local playerID = TargetID()
	local npc = OwnerID()

	Setflag(playerID, setkey, 0 )
	Setflag(playerID, 545681, 1 )   --  ��Ѥw�����Ŧ����(����)
	DW_QietKillOne(playerID, 106263 )
--	Say(playerID, "ok2" )
	DisableQuest(npc, false )
end

function lua_titlequest_setkey3(setkey)
	local playerID = TargetID()
	local npc = OwnerID()

	Setflag(playerID, setkey, 0 )
	Setflag(playerID, 545682, 1 )   --  ��Ѥw�����������(����)
	DW_QietKillOne(playerID, 106264 )
--	Say(playerID, "ok3" )
	DisableQuest(npc, false )
end

function lua_titlequest_setkey4(setkey)
	local playerID = TargetID()
	local npc = OwnerID()

	Setflag(playerID, setkey, 0 )

	-- �M���U�غ�u���ȶi�椤��key
	local QuestTypeKey = { 545647, 545648, 545649, 545650 }

	for i = 1, table.getn(QuestTypeKey) do
		Setflag(playerID, QuestTypeKey[i], 0)
	end

	Setflag(playerID, 545683, 1 )   --  ��Ѥw����������(�t��)
	DW_QietKillOne(playerID, 106265 )
--	Say(playerID, "ok4" )
	DisableQuest(npc, false )
end