-- 5.0.6�B§�t��-�B§�d��

-- 1. LV5 - LV10 �ҩd�ն��k�N�@��
-- ���ܪ��a����d��

function lua_mika_weddingpet_01()
	local Player = OwnerID()
	local todaykey = 545684  -- ���Ѥw��o �B§�d���T��
	local gotlv1key = 545685  -- �w����L�B§�d�� 

	if CheckFlag(player, gotlv1key ) == false then -- �S  �w����L�B§�d��
		if CheckFlag(player, todaykey ) == false then  --  �S ���Ѥw��o�B§�d���T��
			ScriptMessage( player, player, 1, "[SC_MERRYPET_01]", C_SYSTEM )
			ScriptMessage( player, player, 0, "[SC_MERRYPET_01]", C_SYSTEM )
			Setflag(player, todaykey, 1)   -- GOT ���Ѥw��o�B§�d���T��
		end
	end
end


-- ����NPC -  115000 ��R�D���p��  �d�����NPC
function lua_mika_weddingpet_NPC_01()
	local Player = OwnerID()
	local NPC = TargetID()
	local todaykey = 545684  -- ���Ѥw��o �B§�d���T��
	local gotlv1key = 545685  -- �w����L�B§�d�� 

	if CheckFlag(player, gotlv1key ) == false then   -- �S�� �w����L�B§�d��  key
		if CheckFlag(player, todaykey ) == true then  -- �����Ѥw��o�B§�d���T�� key
			SetSpeakDetail(Player, "[SC_MERRYPET_04]" )
			AddSpeakOption( Player, Player, "[SC_MERRYPET_05]" , "lua_mika_weddingpet_NPC_02", 0 ) -- �ڭn���[SC_MERRYPET_00]
		else  -- ���ŦX������
			SetSpeakDetail(Player, "[SC_MERRYPET_02]" )  -- 
		end
	else  -- �w��L�F
		SetSpeakDetail(Player, "[SC_MERRYPET_08]" )   -- �� �w����L�B§�d��  key
		AddSpeakOption( Player, Player, "[SC_MERRYPET_09]" , "lua_mika_weddingpet_NPC_03", 0 ) -- �ڷQ�F��[SC_MERRYPET_00]�����|�覡
	end
end

function lua_mika_weddingpet_NPC_02()
	local Player = OwnerID()
	local NPC = TargetID()
	local todaykey = 545684  -- ���Ѥw��o �B§�d���T��
	local gotlv1key = 545685  -- �w����L�B§�d�� 
	local petid =  241971  

	SetSpeakDetail(Player, "[SC_MERRYPET_10]" )   -- ����ɹ��
	SetFlag(Player, gotlv1key, 1 ) -- ���Pkey 1 
	GiveBodyItem(Player, petid, 1  )
 
end

-- �ĦX�覡
function lua_mika_weddingpet_NPC_03()
	local Player = OwnerID()
	local NPC = TargetID()

	SetSpeakDetail(Player, "[SC_MERRYPET_10]" )   --  �ĦX�覡
end