-- Z2 �B�s�֤� ����NPC
function lua_mika_beercontest_Z2_01()  
	PlayMotion( TargetID(), 118) --Cast��t
	SetSpeakDetail( OwnerID(), "[SC_BEERDAY_01]"   )  
	AddSpeakOption( OwnerID(), TargetID(), "[SC_BEERDAY_02]" , "lua_mika_beercontest_02", 0 ) --�ڷQ���D��s�`���ѨӡC
	AddSpeakOption( OwnerID(), TargetID(), "[SC_BEERDAY_NEW02]" , "lua_mika_beercontest_03", 0 ) --����y�B�s�֤�z
end

--z15����npc��l���  115819
function lua_mika_beercontest_01()  --z15����npc��l���  115819
	PlayMotion( TargetID(), 118) --Cast��t
	SetSpeakDetail( OwnerID(), "[SC_BEERDAY_01]"   )  
	AddSpeakOption( OwnerID(), TargetID(), "[SC_BEERDAY_02]" , "lua_mika_beercontest_02", 0 ) --�ڷQ���D��s�`���ѨӡC
	AddSpeakOption( OwnerID(), TargetID(), "[SC_BEERDAY_NEW01]" , "lua_mika_beercontest_04", 0 ) --����y�~�|�s�s�z
end

---------------�ڷQ���D��s�`���ѨӡC---------------
function lua_mika_beercontest_02() -- �ڷQ���D��s�`���ѨӡC
	SetSpeakDetail( OwnerID(), "[SC_BEERDAY_07]"   )  --���ʤ��e����
	AddSpeakOption(OwnerID(), TargetID(), "[SC_111490_DIALOG7_2]" , "lua_mika_beercontest_022", 0 ) --�M��O
end

function lua_mika_beercontest_022() -- �ڷQ���D��s�`���Ѩ�-2
	SetSpeakDetail( OwnerID(), "[SC_BEERDAY_07_01]"   )  --���ʤ��e����-2
--	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "lua_mika_beercontest_01", 0 ) --�^��W�@�h
end

---------------����~�|�s�s---------------
function lua_mika_beercontest_04() ---����~�|�s�s
	SetSpeakDetail( OwnerID(), "[SC_BEERDAY_NEW11]"   ) -- �o�̥��b�|��s�s���~�|�|...
	AddSpeakOption( OwnerID(), TargetID(), "[SC_LOSTTREASURE_02]" , "lua_mika_beercontest_041", 0 ) --�W�h����
	AddSpeakOption(OwnerID(), TargetID(), "[SC_BEERDAY_NEW04]" , "lua_mika_beercontest_042", 0 ) --���[507452] �Űs�M
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "lua_mika_beercontest_01", 0 ) --�^��W�@�h
end

function lua_mika_beercontest_041() --�~�|�s�s �W�h����
	SetSpeakDetail( OwnerID(), "[SC_BEERDAY_NEW03]"   )  --�~�|�s�s�W�h���e
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "lua_mika_beercontest_04", 0 ) --�^��W�@�h
end 

function lua_mika_beercontest_042() ---�~�|�s�s-����Űs�M
	CloseSpeak(OwnerID())
	if Checkflag(OwnerID(), 544057 ) == True then -- �p�G���ѻ�L�F
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_BEERDAY_NEW05]" , 0 )	--�e�������T�� 
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_BEERDAY_NEW05]" , 0 )	--�T����
	else
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_BEERDAY_NEW24]" , C_SYSTEM )	--�e�������T�� 
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_BEERDAY_NEW24]" , C_SYSTEM )	--�T����
		Addbuff(OwnerID(), 507452 , 0 , 1800 ) --�Űs�MBUFF  30����
		Setflag(OwnerID(), 544057, 1 ) --�����Ѥw����LFLAG
	end
end


---------------����B�s�֤�---------------
function lua_mika_beercontest_03() --����B�s�֤�
 	local NPCPID = ReadRoleValue ( TargetID() , EM_RoleValue_PID )  --NPCPID
	if NPCPID == 0 then  --���b���ʮɶ���
		SetSpeakDetail( OwnerID(), "[SC_BEERDAY_NEW10]"   )   -- ������ѥ[�B�s�֤⬡�ʶܡH
		AddSpeakOption( OwnerID(), TargetID(), "[SC_LOSTTREASURE_02]" , "lua_mika_beercontest_rule", 0 ) --���ʳW�h
		AddSpeakOption( OwnerID(), TargetID(), "[SC_BEERDAY_NEW06]" , "lua_mika_beercontest_reward", 0 ) --������M
		AddSpeakOption( OwnerID(), TargetID(), "[SC_BEERDAY_NEW07]" , "lua_mika_beercontest_mount", 0 ) --�ʶR�S���M
	elseif NPCPID == 1 then  --���W����
		SetSpeakDetail( OwnerID(), "[SC_BEERDAY_NEW10]"   )   -- ������ѥ[�B�s�֤⬡�ʶܡH
		AddSpeakOption( OwnerID(), TargetID(), "[SC_BEERDAY_NEW08]" , "lua_mika_beercontest_join", 0 ) --�ѥ[����
		AddSpeakOption( OwnerID(), TargetID(), "[SC_LOSTTREASURE_02]" , "lua_mika_beercontest_rule", 0 ) --���ʳW�h
		AddSpeakOption( OwnerID(), TargetID(), "[SC_BEERDAY_NEW06]" , "lua_mika_beercontest_reward", 0 ) --������M
		AddSpeakOption( OwnerID(), TargetID(), "[SC_BEERDAY_NEW07]" , "lua_mika_beercontest_mount", 0 ) --�ʶR�S���M
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "lua_mika_beercontest_Z2_01", 0 ) --�^��W�@�h
	elseif NPCPID == 2 then  --���ʶ}�l�� (������W)
		SetSpeakDetail( OwnerID(), "[SC_BEERDAY_NEW10]"   )   -- ������ѥ[�B�s�֤⬡�ʶܡH
		if CheckBuff(OwnerID(), 506907 ) == True then --���ѥ[����buff
			AddSpeakOption( OwnerID(), TargetID(), "[SC_BEERDAY_NEW09]" , "lua_mika_beercontest_back", 0 ) --�^������
		end
		AddSpeakOption( OwnerID(), TargetID(), "[SC_LOSTTREASURE_02]" , "lua_mika_beercontest_rule", 0 ) --���ʳW�h
		AddSpeakOption( OwnerID(), TargetID(), "[SC_BEERDAY_NEW06]" , "lua_mika_beercontest_reward", 0 ) --������M
		AddSpeakOption( OwnerID(), TargetID(), "[SC_BEERDAY_NEW07]" , "lua_mika_beercontest_mount", 0 ) --�ʶR�S���M
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "lua_mika_beercontest_Z2_01", 0 ) --�^��W�@�h
	end
end

---�W�h����-------------------------------
function lua_mika_beercontest_rule() --�B�s�֤� �W�h
	SetSpeakDetail( OwnerID(), "[SC_BEERDAY_NEW12]"   )  --�W�h���e
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "lua_mika_beercontest_03", 0 ) --�^��W�@�h
end 


---���M�I��-------------------------------
function lua_mika_beercontest_reward() --���M�I��
	SetSpeakDetail( OwnerID(), "[SC_BEERDAY_NEW13]"   )  --�Y�A����[507446]�ĪG�A���ĪG���Ŭ�1, 3��7�ɡA�A�N�i��o�S�s�����M�~�[�˹��Z���C�{�b�n����ܡH
	AddSpeakOption(OwnerID(), TargetID(), "[SC_BEERDAY_NEW14]" , "lua_mika_beercontest_reward2", 0 ) --����S�s���M�Z��
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "lua_mika_beercontest_03", 0 ) --�^��W�@�h
end

function lua_mika_beercontest_reward2() --���M�I��
	Closespeak(OwnerID())
	local Count = BuffCount ( OwnerID())
	if Checkbuff(OwnerID(), 507466 ) == true then --�p�G���o��buff
		for i = 0 , Count do
			local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
			if BuffID == 507466 then -- �i�I������
				BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )
				BuffNumber = BuffLv
			end
		end
		if BuffNumber == 6 then  --lv7 
			if Checkflag( OwnerID(), 542193 ) == true and Checkflag( OwnerID(), 542192 ) == true and Checkflag( OwnerID(), 542191 ) == true then
				ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_BEERDAY_NEW15]" , 0 )	--�e�������T�� �A�ثe�S���i��������M
				ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_BEERDAY_NEW15]" , 0 )	--�T����
			else
				if Checkflag( OwnerID(), 542193 ) == false then
					GivebodyItem(OwnerID(), 212711 , 1 ) --���M�Z��
					Setflag( OwnerID(), 542193 , 1 ) --�����KEYITEM
				end
				if Checkflag( OwnerID(), 542192 ) == false then
					GivebodyItem(OwnerID(), 212712 , 1 ) --���M�Z��
					Setflag( OwnerID(), 542192 , 1 ) --�����KEYITEM
				end
				if Checkflag( OwnerID(), 542191 ) == false then
					GivebodyItem(OwnerID(), 212713 , 1 ) --���M�Z��
					Setflag( OwnerID(), 542191 , 1 ) --�����KEYITEM
				end
			end
		elseif BuffNumber >= 2 then --lv3
			if  Checkflag( OwnerID(), 542192 ) == true and Checkflag( OwnerID(), 542191 ) == true then
				ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_BEERDAY_NEW15]" , 0 )	--�e�������T�� �A�ثe�S���i��������M
				ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_BEERDAY_NEW15]" , 0 )	--�T����
			else
				if Checkflag( OwnerID(), 542192 ) == false then
					GivebodyItem(OwnerID(), 212712 , 1 ) --���M�Z��
					Setflag( OwnerID(), 542192 , 1 ) --�����KEYITEM
				end
				if Checkflag( OwnerID(), 542191 ) == false then
					GivebodyItem(OwnerID(), 212713 , 1 ) --���M�Z��
					Setflag( OwnerID(), 542191 , 1 ) --�����KEYITEM
				end
			end
		elseif BuffNumber >= 0 then --lv1
			if Checkflag( OwnerID(), 542191 ) == true then
				ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_BEERDAY_NEW15]" , 0 )	--�e�������T��  �A�ثe�S���i��������M
				ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_BEERDAY_NEW15]" , 0 )	--�T����
			else
				GivebodyItem(OwnerID(), 212713 , 1 ) --���M�Z��
				Setflag( OwnerID(), 542191 , 1 ) --�����KEYITEM
			end
		end
	else
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_BEERDAY_NEW17]" , 0 )	--�e�������T��  �A���W�S��[507466]�ĪG�A�L�k������M�C
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_BEERDAY_NEW17]" , 0 )	--�T����
	end

end

----���M�ʶR-------------------------------
function lua_mika_beercontest_mount() --���M�ʶR
	SetSpeakDetail( OwnerID(), "[SC_BEERDAY_NEW18]"   )  --����[207958]�ݭn��I5�T[203038]�A����1�p�ɡA�T�w���ɶܡH
	AddSpeakOption(OwnerID(), TargetID(), "[SC_0908SEANSON_65]" , "lua_mika_beercontest_mountbuy", 0 ) --�T�w
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "lua_mika_beercontest_03", 0 ) --�^��W�@�h
end


function lua_mika_beercontest_mountbuy() --�ʶR
	local coin = CountBodyItem(OwnerID(), 203038 ) --�����ťN��
	CloseSpeak(OwnerID())
	if coin >= 5 then 
		Delbodyitem(OwnerID(), 203038 , 5 ) -- ���� �����ťN��X5
		GiveBodyItem(OwnerID(), 207958 , 1 ) --�����M*1
	else
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_111813_YU_36]" , 0 )	--�e�������T��  �A�S��������<CS>[203038]</CS>�I
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_111813_YU_36]" , 0 )	--�T����
	end
end

----�ѥ[����-------------------------------
function lua_mika_beercontest_join() --�ѥ[
	local join = Checkflag(OwnerID(), 542190 ) --�����W
	CloseSpeak(OwnerID())
	if join == true then --���ѳ��W�L�F
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_BEERDAY_13]" , 0 )	--�e�������T��  �A���Ѥw�g�ѥ[�L�o�C
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_BEERDAY_13]" , 0 )	--�T����
	else
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_BEERDAY_NEW19]" , C_SYSTEM )	--�e�������T��  �A�����W�w�g�ӽЧ����A�бK���`�N�s�����ʶ}�l�T���C
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_BEERDAY_NEW19]" , C_SYSTEM )	--�T����
		WriteRoleValue(OwnerID(), EM_LuaValueFlag_UseItem10, 0 )  -- �M���W������
		Addbuff(OwnerID(), 506907 , 0 , 1260 ) -- �ѥ[����Buff  20��
		Setflag( OwnerID(), 542190, 1) --���ѥ[����flag
	end
end


----�^������-------------------------------
function lua_mika_beercontest_back() --�^������
	local beercount = ReadRoleValue ( OwnerID() , EM_LuaValueFlag_UseItem10 ) -- ��s���ƶq
	local needmount = 15 --�ݨD�ƶq

--	Say(OwnerID(), beercount )
--	Say(OwnerID(), needmount )
	if beercount < needmount  then --�p��npc�ݨD�ƶq
		CloseSpeak(OwnerID())
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_BEERDAY_NEW20]" , 0 )	--�e�������T��  �A�٨S�����o�����ƶq����s�A�L�k�^�����ʡC
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_BEERDAY_NEW20]" , 0 )	--�T����
	elseif beercount >= needmount  then  --�j��ݨD�ƶq
		CloseSpeak(OwnerID())
		Beginplot (TargetID(), "lua_mika_beercontest_back2" , 0)
	end
end

function  lua_mika_beercontest_back2() --�^������2
	local beercount = ReadRoleValue ( TargetID() , EM_LuaValueFlag_UseItem10 ) -- ��s���ƶq(Player)
	local numberone = ReadRoleValue(OwnerID() , EM_RoleValue_Register+1 )     --�O�_�w���Ĥ@�W����  0���S��, 1���� (npc)
--	Say(OwnerID(), "ownerid" ) --npc
--	Say(TargetID(), "targetid" )  --player

	if numberone == 1 then  --�w���H���Ĥ@�W
		ScriptMessage( TargetID(), TargetID(), 2, "[SC_BEERDAY_NEW21]" , C_SYSTEM )	--�e�������T��  ���ߧA�F�����ʥؼСA����A�U������o�Ĥ@�W�I
		ScriptMessage( TargetID(), TargetID(), 0, "[SC_BEERDAY_NEW21]" , C_SYSTEM )	--�T����
		--�������ʪ��A
		Cancelbuff(TargetID(), 506907 )
		--���D��
		GiveBodyItem(TargetID(), 205941 , 1 ) --��s�`���ʰѥ[����
	else  --�٨S��
		ScriptMessage( TargetID(), TargetID(), 2, "[SC_BEERDAY_NEW22]" , C_SYSTEM )	--�e�������T��  ���ߧA�A�A�O�������Ĥ@�Ӧ^�����ʪ̡A
		ScriptMessage( TargetID(), TargetID(), 0, "[SC_BEERDAY_NEW22]" , C_SYSTEM )	--�T����
		Sleep(10)
		ScriptMessage( TargetID(), TargetID(), 2, "[SC_BEERDAY_NEW23]" , C_SYSTEM )	--�e�������T��  �A�N�i��o�H�x�a�x���S��ĪG�I
		ScriptMessage( TargetID(), TargetID(), 0, "[SC_BEERDAY_NEW23]" , C_SYSTEM )	--�T����
		WriteRoleValue( OwnerID() , EM_RoleValue_Register+1 , 1) --�Nnpc�אּ�w���H�Ĥ@�W (npc)
		local score = ReadRoleValue ( TargetID() , EM_LuaValueFlag_UseItem10 ) -- ��s���ƶq(Player)
		local numberone = ReadRoleValue(OwnerID() , EM_RoleValue_Register+1 ) 
--		Say(OwnerID(), numberone )
--		Say(TargetID(), score)
		--�s��
		local Name =  GetName( TargetID() ) 
		local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
		local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --�|Ū��u�ꪺ���y�ϰ�
		if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
			RunningMsg( OwnerID() , 2 , "[SC_BEERDAY_NEW_CAST05][$SETVAR1="..Name.."]" )
		end
		-- ��s�`���ʡy�B�s�֤�z�a�x�X�l�o�A����[$VAR1]��o�����a�x �I
		--�������ʪ��A
		Cancelbuff(TargetID(), 506907 )
		--���D��
		GiveBodyItem(TargetID(), 205941 , 1 ) --��s�`���ʰѥ[����
		--��buff
		Sleep(10)
		local Count = BuffCount (TargetID())
		if Checkbuff(TargetID(), 507466 ) == true then --�p�G���o��buff
			for i = 0 , Count do
				local BuffID = BuffInfo ( TargetID() , i , EM_BuffInfoType_BuffID )
				if BuffID == 507466 then -- �i�I������
					BuffLv = BuffInfo ( TargetID() , i , EM_BuffInfoType_Power )
					BuffNumber = BuffLv
				end
			end
			if BuffNumber >= 6 then 
				ScriptMessage( TargetID(), TargetID(), 2, "[SC_BEERDAY_NEW26]" , 0 )	--�e�������T��  �A���a�x�ĪG���Ťw�F�W���A�L�k�A���ɵ��šC
				ScriptMessage( TargetID(), TargetID(), 0, "[SC_BEERDAY_NEW26]" , 0 )	--�T����
				CancelBuff( TargetID(),507466)		
				Addbuff( TargetID() , 507466 , BuffNumber , 604800 )  --7��
			else 
			--	Say( TargetID(), "Buff lv  up !" )
				CancelBuff( TargetID(),507466)		
				Addbuff( TargetID() , 507466 , BuffNumber+1 , 604800 )  --7��   --�a�xbuff
			end
		else
			Addbuff( TargetID() , 507466 , 0 , 604800 )  --7��  --�a�xbuff
		end
	end
end


-- ���ի��O 
function lua_mika_beercontest_score(number)  -- �g�J�ثe����

	 WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem10 , number ) -- +1
	local score = ReadRoleValue ( OwnerID() , EM_LuaValueFlag_UseItem10 ) -- ��s���ƶq
	Say(OwnerID(), "Score become "..score)
end

function lua_mika_beercontest_buffup() -- �[�a�xbuff   LV+1
	local Count = BuffCount ( OwnerID())
	if Checkbuff(OwnerID(), 507466 ) == true then --�p�G���o��buff
		for i = 0 , Count do
			local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
			if BuffID == 507466 then -- �i�I������
				BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )
				BuffNumber = BuffLv
			end
		end
		if BuffNumber >= 6 then 
			ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_BEERDAY_NEW26]" , 0 )	--�e�������T��  �A���a�x�ĪG���Ťw�F�W���A�L�k�A���ɵ��šC
			ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_BEERDAY_NEW26]" , 0 )	--�T����
			CancelBuff(OwnerID(),507466)		
			Addbuff( OwnerID() , 507466 , BuffNumber , 604800 )  --7��
		else 
			CancelBuff(OwnerID(),507466)		
			Addbuff( OwnerID() , 507466 , BuffNumber+1 , 604800 )  --7��
		end
	else
		Addbuff( OwnerID() , 507466 , 0 , 604800 )  --7��
	end
end

-- ���ʭ��m���O
function lua_mika_beercontest_reset()
	CancelBuff(OwnerID(),507466)   -- �����a�xbuff
	CancelBuff(OwnerID(), 506907) 
	Setflag( OwnerID(), 542190, 0 )  -- �R���C��X��-�B�s�֤�
	SetFlag( OwnerID() , 542191, 0)  --����L1�Ѽ��M
	SetFlag( OwnerID() , 542192, 0)  --����L3�Ѽ��M
	SetFlag( OwnerID() , 542193, 0)  --����L7�Ѽ��M
	Say(OwnerID(), "reset event")
end

-- ���ʶ}�l���ի��O (��J98�����ʶ}����W, ��J99�����ʶ}�l)
function lua_mika_beer_testbegin(value) --  
	local npc = LuaFunc_SearchNPCbyOrgID(OwnerID() , 121168, 200 , 0)       --����NPC
	WriteRoleValue(npc, EM_RoleValue_PID, value)
	local pid = ReadRoleValue ( npc , EM_RoleValue_PID )  --NPCPID
	Say(npc, "pid ="..pid)
end

-- ����buff�����ɧR������
function lua_mika_beercontest_scorezero()
	WriteRoleValue(OwnerID(), EM_LuaValueFlag_UseItem10, 0 )  -- �M���W������
end