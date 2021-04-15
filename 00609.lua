
--- ���bnpc ���ͼ@��
function lua_mika_skillcraft_ev1_timer()
--	Say(OwnerID(), "OwnerID" )  --NPC
--	Say(TargetID(), "TargetID" ) --NPC
	local NPC = OwnerID()
	local eventhour = {2, 6, 10, 14, 18, 22 }  -- �ɶ�

	while true do  
		local hour = GetSystime(1)
		local min = GetSystime(2)
		local R5 = ReadRoleValue(NPC, EM_RoleValue_Register+5 )
	--	Say(OwnerID(), hour..":"..min ) -- say�X�{�b�ɶ� TEST MSG
		
		-- �����ʶ}�l
		for i = 1 , #eventhour do
			if hour == eventhour[i] and min == 0 then --  0�� (���ʦ@�P�s��)
				local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
				local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --�|Ū��u�ꪺ���y�ϰ�
				if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
					RunningMsgEx( OwnerID() , 2 , 3 , "[SC_SKILLEVENT_ALLCAST01]" )   -- 6.0.1 �����`���ʦ@�μs��
				end
			elseif hour == eventhour[i] and min == 30 then  -- 30�� (���ʶ}�l)  
				Beginplot(OwnerID(), "lua_mika_skillcraft_ev1_start" , 0 )

			elseif hour == eventhour[i] and min == 50 then  --  50�� (���ʵ���)  
				-- ��������. �M���D��.
				Beginplot(OwnerID(), "lua_mika_skillcraft_ev1_close" , 0 )

			end
	
		end
	
		sleep(600)  
	end
end


-- �����` ����1 �X�DNPC��l���
function lua_mika_skillcraft_ev1_speak()
--	Say(OwnerID(), "OwnerID" )  --Player
--	Say(TargetID(), "TargetID" )  -- NPC
	AdjustFaceDir( TargetID() , OwnerID() , 0 ) --NPC���V���a

	local Status = ReadRoleValue(TargetID(),  EM_RoleValue_Register )   --npc���A  ( 0 = ���ʥ��}�l , 1 = ���ʶi�椤 )

	if Status == 1 then  -- ���ʶi�椤
		local okbuff = CheckBuff(OwnerID(), 620241 )   -- �������BUFF��, �L�k���I��I���~  
		if okbuff == false then  -- ������������L
			local now_itemid = ReadRoleValue( TargetID(),  EM_RoleValue_Register+2 )  -- �O�bnpc���W���D�ت��~id���X
			SetSpeakDetail( OwnerID(), "[SC_SKILLEVENT_EV1_03][$SETVAR1=".."["..now_itemid.."]".."]"   )   -- �i�D���a�D��
			AddSpeakOption( OwnerID(), TargetID(), "[SC_SKILLEVENT_EV1_04]" , "lua_mika_skillcraft_ev1_rule", 0 ) -- ���ʻ���
			AddSpeakOption( OwnerID(), TargetID(), "[SC_SKILLEVENT_EV1_05]" , "lua_mika_skillcraft_ev1_back", 0 ) -- ��I���~
		else  -- ������w�����L
			SetSpeakDetail( OwnerID(), "[SC_SKILLEVENT_EV1_07]"   )  -- [$PLAYERNAME]�A�ڷQ�o���ݭn�����ƴN�A�t�@�I�N���F�A���§A�������C
		end
	else  -- ���ʥ��}�l
		SetSpeakDetail( OwnerID(), "[SC_SKILLEVENT_EV1_08]"   )   -- �M���a���Ь���
		AddSpeakOption( OwnerID(), TargetID(), "[SC_SKILLEVENT_EV1_04]" , "lua_mika_skillcraft_ev1_rule", 0 ) -- ���ʻ���
	end
end


 -- ���ʳW�h����
function lua_mika_skillcraft_ev1_rule()
	SetSpeakDetail( OwnerID(), "[SC_SKILLEVENT_EV1_06]"   )   -- ���ʳW�h���Ф��e
end


 -- ��I�ݨD���~
function lua_mika_skillcraft_ev1_back()
--	Say(OwnerID(), "OwnerID" )  -- player
--	Say(TargetID(), "TargetID" )    -- npc
	local Player = OwnerID()

	local now_itemid = ReadRoleValue( TargetID(),  EM_RoleValue_Register+2 )  -- �O�bnpc���W���D�ت��~id���X
	local count_player =  CountBodyItem(Player, now_itemid ) -- ���a���W���w���~���ƶq

--	Say(OwnerID(), "Now number is  "..now_itemid )
--	Say(OwnerID(), "Now item count is  "..count_player )

	if count_player > 0 then  -- �p�G���ݨD���~
		SetSpeakDetail( Player, "[SC_SKILLEVENT_EV1_09]"   )   -- �P�ª��a����
		DelBodyItem(Player, now_itemid,  1 )

		local key = Checkflag(Player, 543897 )   -- ��ѧ����Ĥ@������key	
		if key == false then
			GiveBodyItem(Player, 240060, 2)  --�� �����`�����w�y���� X2 (��ѲĤ@�������~��)
			GiveBodyItem(Player, 241642, 1)  --�� ���K���|���ƥ]
			Setflag(Player, 543897, 1 )  -- ��KEY
			Lua_Festival_06_All(Player)   -- ���������`���Լ�
		end

		GiveBodyItem(Player, 240061, 5 )  --�� ���K���P�ª� X5  (�C��������)
		AddBuff(Player, 620241, 0, 1800 )  -- �� ��������� buff 30 ����
		DesignLog( Player , 113922 , "craft festival - ev1 complete" ) -- �����`����1�����p�� (6.0.1��)

	else  -- ���~�ƶq����
--		Say(OwnerID(), " you have no item !" )
		SetSpeakDetail( Player, "[SC_SKILLEVENT_EV1_10]"   )   -- �i�D���a���~�ƶq����

	end

end


-- �}�񬡰�. ���D��
function lua_mika_skillcraft_ev1_start()
--	Say(OwnerID(), "OwnerID" )  -- npc
--	Say(TargetID(), "TargetID" ) -- npc
	local NPC = OwnerID()  -- ����npc

	-- �}�l����.���D��
	local register =  {   { 11 , 12, 13, 14, 15, 16},
	 		   { 21 , 22, 23, 24, 25, 26},
	 		   { 31 , 32, 33, 34, 35, 36},
	 		   { 41 , 42, 43, 44, 45, 46},
	 		   { 51 , 52, 53, 54, 55, 56} 	
			}

	local needid = {	{ 209720 , 209721 , 209722 , 209723, 241578, 241579 } ,
	 		{ 209728 , 209729 , 209730 , 209733, 241582, 241583 } ,
	 		{ 209738 , 209739 , 209740 , 209741, 241586, 241587 } ,
	 		{ 209746 , 209747 , 209748 , 209749, 241590, 241591 } ,
	 		{ 209754 , 209755 , 209756 , 209757, 241594, 241595 }	}

	WriteRoleValue(OwnerID() , EM_RoleValue_Register+1, 0 )    
	WriteRoleValue(OwnerID() , EM_RoleValue_Register+2, 0 ) 
	WriteRoleValue(OwnerID() , EM_RoleValue_Register+3, 0 )    
	WriteRoleValue(OwnerID() , EM_RoleValue_Register+4, 0 ) 

	-- �}�񬡰�
	WriteRoleValue(OwnerID() , EM_RoleValue_Register , 1 )    -- �g�JNPC register �Ȭ�1
	local Status = ReadRoleValue(OwnerID(),  EM_RoleValue_Register )   
--	Say(OwnerID(), "Status ="..Status )  --���X���A TEST MSG
	Sleep(5)
	-- ���D��
	local ran01 = rand(5)+1  -- 1~5  ��u, ���K ,���_, �Ҫ�, �s��
	local ran02 = rand(6)+1  -- 1~4 �D��1, �D��2 , �D��3 , �D��4  , �D��5  , �D��6
	WriteRoleValue(OwnerID() , EM_RoleValue_Register+3, ran01 )    -- �g�JNPC�D�� --����
	WriteRoleValue(OwnerID() , EM_RoleValue_Register+4, ran02 )    -- �g�JNPC�D�� -- �D��
	local theme1 = ReadRoleValue(OwnerID(),  EM_RoleValue_Register+3 )   -- Ū�����g�J���D�� -- ����
	local theme2 = ReadRoleValue(OwnerID(),  EM_RoleValue_Register+4 )   -- Ū�����g�J���D�� -- �D��
--	Say(OwnerID(), theme1 )
--	Say(OwnerID(), theme2 )

	local Qns1 = register[theme1][theme2]  -- 11~54 ��1�ӼƦr
	local Qns2 = needid[theme1][theme2]   -- �W���Ʀr�������~id
	WriteRoleValue(OwnerID() , EM_RoleValue_Register+1, Qns1 )    -- �g�JNPC  -- �D�ؼƦr(11~54��1�ӼƦr)  ex : 11 
	WriteRoleValue(OwnerID() , EM_RoleValue_Register+2, Qns2 )    -- �g�JNPC  -- �W�z�D�ع������ݨD���~�s��   ex : 209720

	local now_number = ReadRoleValue(OwnerID(),  EM_RoleValue_Register+1 )
	local now_itemid = ReadRoleValue(OwnerID(),  EM_RoleValue_Register+2 )

	NPCSAY(NPC, "[SC_SKILLEVENT_EV1_11][$SETVAR1=".."["..now_itemid.."]".."]" )
	Callplot(NPC, "lua_mika_skillcraft_ev1_msg", 0  )
	-- ���K��|�ثe�x�D�j�q��<CS>[$VAR1]</CS>�A�p�G�����ܥi�H���ѶܡH
--	Say(OwnerID(), "Now number is  "..now_number )
--	Say(OwnerID(), "Now needitem id is  "..now_itemid )

end

-- ���ʶi�椤 �C5�����i�D���a���ʻݨD���~
function lua_mika_skillcraft_ev1_msg()
	local NPC = OwnerID()  -- ����npc
	local timer = 0

	while True  do
		local now_itemid = ReadRoleValue(OwnerID(),  EM_RoleValue_Register+2 )
		if now_itemid <= 0 then
			break
		else
			timer = timer +1 
			if timer%300 == 0 then  -- 5����
				NPCSAY(NPC, "[SC_SKILLEVENT_EV1_11][$SETVAR1=".."["..now_itemid.."]".."]" )
			end
		end
		sleep(10)  
	end
end

-- ���ʵ���.��Ҧ��D�ج����ȲM��
function lua_mika_skillcraft_ev1_close()
--	Say(OwnerID(), "OwnerID" )  -- npc
--	Say(TargetID(), "TargetID" )  -- Player
	local NPC = OwnerID()
	NPCSAY(NPC, "[SC_SKILLEVENT_EV1_12]")  -- ���ʵ���SAY

	WriteRoleValue(OwnerID() , EM_RoleValue_Register , 0 )    -- �g�JNPC register �Ȭ�0
	local Status = ReadRoleValue(OwnerID(),  EM_RoleValue_Register )   
--	Say(OwnerID(), "Status = "..Status )  --���X���A TEST MSG

	WriteRoleValue(OwnerID() , EM_RoleValue_Register+1, 0 )    
	WriteRoleValue(OwnerID() , EM_RoleValue_Register+2, 0 ) 
	WriteRoleValue(OwnerID() , EM_RoleValue_Register+3, 0 )    
	WriteRoleValue(OwnerID() , EM_RoleValue_Register+4, 0 ) 
	WriteRoleValue(OwnerID() , EM_RoleValue_Register+5, 0 ) 
	local  R1 = ReadRoleValue(OwnerID(),  EM_RoleValue_Register+1 )
	local  R2 = ReadRoleValue(OwnerID(),  EM_RoleValue_Register+2 )
	local  R3 = ReadRoleValue(OwnerID(),  EM_RoleValue_Register+3 )
	local  R4 = ReadRoleValue(OwnerID(),  EM_RoleValue_Register+4 )
	local  R4 = ReadRoleValue(OwnerID(),  EM_RoleValue_Register+5 )
--	Say(OwnerID(), R1 )
--	Say(OwnerID(), R2 )
--	Say(OwnerID(), R3 )
--	Say(OwnerID(), R4 )
--	Say(OwnerID(), R5 )

end

-- ���եΫ��O

-- ���ʪ����}�l
function lua_mika_skillcraft_ev1_test01()
	local Player = OwnerID()
	local npc = LuaFunc_SearchNPCbyOrgID(Player , 113922, 100 , 0)       --����NPC  - �u�ڮR�D�J�|

	if min == 20 then 
		say(Player, "time error ")
	else
		CancelBuff(Player, 620241)
		Beginplot(npc, "lua_mika_skillcraft_ev1_start" , 0 )
		say(npc, "skill craft ev1 - test begin"  )
	end
end

-- ���ʪ�������
function lua_mika_skillcraft_ev1_test02()
	local Player = OwnerID()
	local npc = LuaFunc_SearchNPCbyOrgID(Player , 113922, 100 , 0)       --����NPC  - �u�ڮR�D�J�|
	local min = GetSystime(2)

	if min == 50 then 
		say(Player, "time error ")
	else
		Beginplot(npc, "lua_mika_skillcraft_ev1_close" , 0 )
		say(npc, "skill craft ev1 - test close . " )
	end
end

--�q�s��
function lua_mika_skillcraft_ev1_test03()
	local Player = OwnerID()
--	local npc = LuaFunc_SearchNPCbyOrgID(Player , 113922, 100 , 0)       --����NPC  - �u�ڮR�D�J�|

	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --�|Ū��u�ꪺ���y�ϰ�
	if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
		RunningMsgEx( OwnerID() , 2 , 3 , "[SC_SKILLEVENT_ALLCAST01]" )   -- 6.0.1 �����`���ʦ@�μs��
	end
end