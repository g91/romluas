-- 2012 �`�y���� �n�ʸ` ���Ը��R�睊

-----------------------------�~������NPC
function lua_mika_2012hallow_npc01()
	local OID = OwnerID() -- ���a
	local TID = TargetID()  -- npc
	local Today =  CheckFlag(OID, 547086 ) --���ѧ����L
	local joined = Checkflag(OID, 547085 )  -- ���Ѧ��ѥ[
	local pass = CheckBuff(OID, 623459 )  -- ����

	if Today == true then  -- ���Ѥw�����L
		SetSpeakDetail( OwnerID(), "[SC_2012HALLOW_MALA_04]"   )  -- ��Ѥw����
		local Language = GetServerDataLanguage() 
	--	if Language ~= "rw" then  -- �x���M�ݨS�����m�ﶵ  ���ե�
		if Language ~= "tw" then  -- �x���M�ݨS�����m�ﶵ  ������
			AddSpeakOption( OwnerID(), TargetID(), "[SC_2012HALLOW_MALA_33]" , "lua_mika_2012hallow_restart", 0 ) --   �ڷQ���s�D��
		end
	else
		if joined == false then  -- �����٨S�}�ҹC�� (�i�H�i�h)
			if pass == True then  -- ������
				SetSpeakDetail( OwnerID(), "[SC_2012HALLOW_MALA_36]"    )  -- ����(��)
				AddSpeakOption( OwnerID(), TargetID(), "[SC_2012HALLOW_MALA_02]" , "lua_mika_2012hallow_npc02", 0 ) -- �ڭn�D�� 
			else 
				SetSpeakDetail( OwnerID(), "[SC_2012HALLOW_MALA_01]"    )  -- ����(��)
				AddSpeakOption( OwnerID(), TargetID(), "[SC_2012HALLOW_MALA_02]" , "lua_mika_2012hallow_npc02", 0 ) -- �ڭn�D�� 
			end
		else  -- ���Ѱѥ[�L ���٨S�^��
			SetSpeakDetail( OwnerID(), "[SC_2012HALLOW_MALA_06]"    )  -- �^������(��)
			AddSpeakOption( OwnerID(), TargetID(), "[SC_2012HALLOW_MALA_03]" , "lua_mika_2012hallow_npc03", 0 ) -- �^�����G
		end
	end

end

-- ���m -----------------------------------------------------
function lua_mika_2012hallow_restart()
	local OID = OwnerID()  -- ���a
	local TID = TargetID()  -- npc
	SetSpeakDetail( OwnerID(), "[SC_2012HALLOW_MALA_35]"   )  -- ��Ѥw����
	--���Ѫ���{���٤��p�A�w���ܡH�p�G�Q���s�D�ԡA�A������<CS>[202903]2��</CS>�����洫����A�A�T�w�n�A���D�ԶܡH

	AddSpeakOption( OwnerID(), TargetID(), "[SC_OKAY]" , "lua_mika_2012hallow_restart2", 0 ) --  ���m�ﶵ
end

function lua_mika_2012hallow_restart2()
	local OID = OwnerID()  -- ���a
	local TID = TargetID()  -- npc
	local item = 202903  -- �ǰe�̲Ť�
	local Count = CountBodyItem(OID, item )

	if Count >= 2 then 
		DelBodyItem(OID, item , 2 )  -- �R��
		Beginplot(OID, "lua_mika_2012hallow_npc02", 0 )  -- �ǤJ�ƥ�
	else
		SetSpeakDetail( OwnerID(), "[SC_BEERDAY_34]"   )  -- �A�֦������~�ƶq�����C

	end
end
-----------------------------------------------------

-- �ǤJ���ʰƥ���
function lua_mika_2012hallow_npc02()  
	local OID = OwnerID()  -- ���a
	local TID = TargetID()  -- npc

	CloseSpeak( OID )      
	Setflag(OID, 547085, 0 )
	Setflag(OID, 547086, 0 )
	Setflag(OID, 546865, 0 )  -- �����d��@��
	CancelBuff_NoEvent(OID, 623536 )  -- ���ܰT����buff 
	Hao_SetPlot_Touch_Reset(OID)   -- �M���W�@��Ĳ�I�@�� 2013.09.24
	DesignLog(OID, 121409, "Pumpkin mala event start" )	--�O���i�J�H��
	ScriptMessage( OID , OID , 1 , "|cffff00ff" .."[SC_2012HALLOW_MALA_05]".. "|r" , 0 ) 
	ScriptMessage( OID , OID , 0 , "|cffff00ff" .."[SC_2012HALLOW_MALA_05]".. "|r" , 0 ) 
	Addbuff(OID, 623459, 0, 1800 ) -- ���ΰѥ[����, ��buff ����ɶ��]�A���u�ɶ� 2�p��
	CastSpell( TID, OID, 850402 )  -- �Y�p�ǰe�N   �I��k�N(�I�k��,��Hid,�k�Nid) 
end

-- �Y�p�ǰe�N+�ǰe�N
function lua_mika_2012hallow_npc022()
	local OID = OwnerID()  -- npc
	local TID = TargetID()   -- ���a

	ChangeZone( TID, 351 , -1 , 2519, 9.2, 2593, 290)   --ChangeZone( OwnerID(), ZoneID �ϰ�ID , �ĴX�h 0 ����0�h -1�N��u�]�ƥ��W�h , x, y, z, Dir)  
end


-- ��ѧ��� �^���D�Ԧ��G
function lua_mika_2012hallow_npc03()
	local OID = OwnerID()  -- ���a
	local TID = TargetID()  -- npc

	local score = ReadRoleValue(OID, EM_LuaValueFlag_UseItem42)  -- ���a�}�a�a�j��

	------------------ �U���y�϶� ---------------------
	if score > 0 then -- ����0��
		-- �a�j���}��
		if score >= 36 then
			SetSpeakDetail( OwnerID(), "[SC_2012HALLOW_MALA_31]"    )  -- ����(��)
			GiveBodyItem(OID, 209433, 3 )   -- �n�ʵw��
			local R = Rand(100)+1
			if R >= 70 then -- 30%
				GiveBodyItem(OID, 240742, 1 )   -- �����n�ʿL��
			else
				GiveBodyItem(OID, 240741, 1 )   -- �n�ʬ�§��
			end
		elseif score >= 31 and score <= 35 then  --  ��3
			SetSpeakDetail( OwnerID(), "[SC_2012HALLOW_MALA_30][$SETVAR1="..score.."]"    )  -- ����(��)
			GiveBodyItem(OID, 209433, 3 )   -- �n�ʵw��
		elseif score >= 21 and score <= 30 then  --  ��3
			SetSpeakDetail( OwnerID(), "[SC_2012HALLOW_MALA_30][$SETVAR1="..score.."]"    )  -- ����(��)
			GiveBodyItem(OID, 209433, 2 )   -- �n�ʵw��
		elseif score >= 11 and score <= 20 then  --  ��2 
			SetSpeakDetail( OwnerID(), "[SC_2012HALLOW_MALA_29][$SETVAR1="..score.."]"    )  -- ����(��)
			GiveBodyItem(OID, 209433, 1 )   -- �n�ʵw��
			GiveBodyItem(OID, 724059, 1 )   -- �ܨ��Ĥ�
		elseif score >= 1 and score <= 10 then   --   ��1 
			SetSpeakDetail( OwnerID(), "[SC_2012HALLOW_MALA_29][$SETVAR1="..score.."]"    )  -- ����(��)
			GiveBodyItem(OID, 209433, 1 )   -- �n�ʵw��
		end

	else  -- 0�� �w����
		SetSpeakDetail( OwnerID(), "[SC_2012HALLOW_MALA_28]"    )  
		GiveBodyItem(OID, 724059, 1 )   -- �ܨ��Ĥ�
	end

	DesignLog(OID, 1214091, "Pumpkin mala event complete ="..score )	--�O���i�J�H��
	Setflag(OID, 547086, 1  ) --���ѧ����L
	Setflag(OID, 547085, 0  ) --���ѧ����L
	Lua_Festival_10_All(OID)   -- 2012�n�ʸ`���Լ�

end


------------------------------- �p�G��buff, �ƺ���J���S����ܼ@��

--SPVer - �W�h����
function lua_mika_2012hallow_choc_01()
	SetSpeakDetail( OwnerID(), "[SC_2012HALLOW_MALA_10]"    )   --SPVer �W�h�������e(��)
	AddSpeakOption( OwnerID(), TargetID(), "[SC_2012HALLOW_MALA_09]" , "lua_mika_2012hallow_choc_02", 0 ) --�ǳƧ���
	AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_42]" , "lua_mika_2012hallow_choc_leave", 0 ) --�ڭn���}
end

-- SPVer. �ڭn���}
function lua_mika_2012hallow_choc_leave()
	SetSpeakDetail( OwnerID(), "[SC_111813_YU_43]"   )  --�A�u���T�w�n���}�H���n�a�H�H���w��A�A�ӬD�ԡI�A�A�A�A��
	AddSpeakOption( OwnerID(), TargetID(), "[SC_GETTITLE_1]" , "lua_mika_2012hallow_choc_leave2", 0 ) --�T�w
end

function lua_mika_2012hallow_choc_leave2()
	local OID = OwnerID()
	CloseSpeak(OID)
	CancelBuff(OID, 623459)
	ChangeZone( OID , 2 , 0 , 4871.9, 104.9, -1885.2, 92)
end


--SPVer - �ǳƧ���
function lua_mika_2012hallow_choc_02()	
	local PlayerID = OwnerID()
	local NPC = TargetID()	
	local RoomID = ReadRoleValue( PlayerID, EM_RoleValue_RoomID) 
	local door = LuaFunc_SearchNPCbyOrgID( NPC , 101473, 200 , 1)       --�j��

	CloseSpeak(PlayerID)      

	ScriptMessage( NPC , -1 , 1 , "|cffff00ff" .."[SC_2012HALLOW_MALA_11]".. "|r" , 0 ) 
	ScriptMessage( NPC , -1 , 0 , "|cffff00ff" .."[SC_2012HALLOW_MALA_11]".. "|r" , 0 )
	WriteRoleValue(PlayerID, EM_LuaValueFlag_UseItem42, 0 )
	WriteRoleValue(PlayerID, EM_RoleValue_Register+9, 0 )
	CancelBuff(PlayerID, 623459 )  -- �M���ǲ����άD�Ծ���
	SetFlag( PlayerID  , 547085 , 1 ) -- ���n���~ SPVer - ���Ѱѥ[�L
	AddBuff(PlayerID , 623504 , 0, -1 )  --�S��ޯ�

	-- �M¾�~�ޯ঳����
	local MyPet = ReadRoleValue ( PlayerID , EM_RoleValue_PetID ) ------���d��ID
	DelObj ( MyPet ) ---�R���d��
	CancelBuff( PlayerID, 500675 ) --�s�� ���
	CancelBuff( PlayerID, 500535 ) --���q �t�F�}��

	WriteRoleValue(NPC, EM_RoleValue_Register+1, PlayerID )  -- �NPlayer �g�J NPC��R1��
	BeginPlot(NPC, "lua_mika_2012hallow_choc_03", 0 )  -- �}�Ҭ���

end

--�}�Ҭ���
function lua_mika_2012hallow_choc_03()
	local NPC = OwnerID()  -- �ƥ���npc
	local RoomID = ReadRoleValue( NPC, EM_RoleValue_RoomID) 
	local PlayerID = ReadRoleValue(NPC, EM_RoleValue_Register+1 )  -- ���a
	local door = LuaFunc_SearchNPCbyOrgID( NPC , 101473, 200 , 1)       --�j��
	local range = 400

	lua_mika_2012hallow_objreset()  -- �M������᭫��

	-- �ͪ��� - ���ê��󤤱�
	local Jok = CreateObjByFlag( 113105, 780235, 21 , 1 );  --���ê��󤤱�
	SetModeEx( Jok  , EM_SetModeType_Strikback, false )--����
	SetModeEx( Jok  , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( Jok , EM_SetModeType_Obstruct, false )--����
	SetModeEx( Jok  , EM_SetModeType_Mark, false )--�аO
	SetModeEx( Jok   , EM_SetModeType_Move, false )--����
	SetModeEx( Jok  , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( Jok   , EM_SetModeType_HideName, true )--�W��
	SetModeEx( Jok , EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( Jok , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( Jok  , EM_SetModeType_Show , false ) --���
	AddToPartition( Jok, RoomID) 

	-- ���}��, �Ѱ�����
	PlayMotion( door[0], 145)   -- �}��
	SetModeEx( door[0] , EM_SetModeType_Obstruct, false )--����
              SetPlot( jok, "range", "lua_mika_2012hallow_111814_05" , 100 )  -- �d��@��,�ǰe���a�i�h   
	WriteRoleValue(PlayerID, EM_RoleValue_Register+1 , Jok)  -- �Njok �g�J���aR1��
	WriteRoleValue( Jok , EM_RoleValue_Register+1 , PlayerID )    -- �N���a�g�JJOK ��R1��
end

-------------------------------------------------------

-- �d��@��,�ǰe���a�i�h  
function lua_mika_2012hallow_111814_05()
	local OID = OwnerID()  --���a
	local TID = TargetID()  -- ���ê���

	SetPlot( TID,"range","",100 )    
	BeginPlot( TID , "lua_mika_2012hallow_111814_06" , 0 )   -- �}�ҹC��
end

-- �}�ҹC��
function lua_mika_2012hallow_111814_06()
	local Jok = OwnerID()  -- ���ê���

	local PlayerID = ReadRoleValue( Jok , EM_RoleValue_Register+1 )   -- ���a
	local RoomID = ReadRoleValue( Jok , EM_RoleValue_RoomID) 
	local door = LuaFunc_SearchNPCbyOrgID( Jok , 101473, 300 , 1)       --�j��

	PlayMotion( door[0], 147) 
	sleep(10)
	SetModeEx( door[0] , EM_SetModeType_Obstruct, true )--����
	Hide( door[0] )
	Show( door[0] ,RoomID)

	AddBuff( PlayerID ,503693 ,1 , 1 ); --�ǰe�S��
	SetPosByFlag( PlayerID , 780235 , 21 )--�ǰe�� X ���X�l

	ScriptMessage( Jok  , -1 , 1 , "|cffff00ff" .."[SC_2012HALLOW_MALA_12]".. "|r" , 0 ) --�[�o�o��_�I�̡㭭��10������}�l�I�A�A�A�A��
	ScriptMessage( Jok  , -1 , 0 , "|cffff00ff" .."[SC_2012HALLOW_MALA_12]".. "|r" , 0 ) --�[�o�o��_�I�̡㭭��10������}�l�I�A�A�A�A��
	sleep(10)
	ScriptMessage( Jok  , -1 , 1 , "|cffff00ff" .."[SC_2012HALLOW_MALA_34]".. "|r" , 0 ) --�I���u�ʪ�[121413]�i�H�������Ǫ��ɧA���å�̾��I�A�A�A�A��
	ScriptMessage( Jok  , -1 , 0 , "|cffff00ff" .."[SC_2012HALLOW_MALA_34]".. "|r" , 0 ) --�I���u�ʪ�[121413]�i�H�������Ǫ��ɧA���å�̾��I�A�A�A�A��

	ClockOpen( PlayerID ,EM_ClockCheckValue_30, 420,420, 0,"Lua_Clockending","lua_mika_2012hallow_timeup01")  -- �˼ƭp�ɾ�  (�᭱����өI�s�禡�G "���Ϯ���"�A"�ɶ���ɩI�s�禡")
	BeginPlot( Jok , "lua_mika_2012hallow_111814_03" , 0 )  --  ����C���ˬd�a�O���S�����V��

end

---------------------------------------------------------
-- �ɶ���Ĳ�o�@��
function lua_mika_2012hallow_timeup01()
	local Player =OwnerID()
	local score = ReadRoleValue(Player, EM_LuaValueFlag_UseItem42)  -- ���a�V���a�j��
	local treasure = ReadRoleValue(Player, EM_RoleValue_Register+9)  -- ���a�}���_�c��
	local Jok = ReadRoleValue(Player, EM_RoleValue_Register+1 )  -- jok�Oplayer��r1
	-- 2013.10.03 ���E:�ץ��n�ʸ`���� - �X�Ը��R���ΡA���a�}�ҩҦ��a�j�ɡA�b�˼Ʈɶ��w�k�s�����p�U�A���|�Q�ǥX�ϰ�A��������}�ҩҦ��_�c��~�|�ǥX�h�����D�C
--	if score < 36 then
		ScriptMessage( Player , Player , 1 , "|cffff00ff" .."[SC_111813_YU_33]".. "|r" , 0 ) --���A�A�A�A��ɶ���X�h�a�I
		BeginPlot(jok, "lua_mika_2012hallow_timeup02", 0 )
--	end
end

function lua_mika_2012hallow_timeup02()
	local jok = OwnerID()
	local Player = ReadRoleValue(jok, EM_RoleValue_Register+1 )  -- Player�O JOK��R1��

	Hao_SetPlot_Touch_Reset(Player)   -- �M���W�@��Ĳ�I�@�� 2013.09.24
	Sleep(20)  -- ����̬Ojok�ҥH�i�Hsleep
	ChangeZone( Player , 2 , 0 , 4871.9, 104.9, -1885.2, 92 )
	AddBuff(Player, 623536, 0, -1 )  -- �����ܰT����buff ���ʫ����
	BeginPlot( Player  , "Lua_Clockending" , 0 )
--	say(player, "time up")

end

---------------------------------------------------------
-- ���ʤ�����(���` ) ���u�ƥ�  ( BUFF�R����Ĳ�o�ƥ�)
function lua_mika_2012hallow_close()
	local Player = OwnerID()

	Hao_SetPlot_Touch_Reset(Player)   -- �M���W�@��Ĳ�I�@�� 2013.09.24
	AddBuff(Player, 623536, 0, -1 )  -- �����ܰT����buff ���ʫ����
	BeginPlot( Player, "Lua_Clockending" , 0 )	
end

---------------------------------------------------------

-- ���ʮɶ��� , ���Ϯɵ���buff, ���ʮ���Ĳ�o�ƥ�
function lua_mika_2012hallow_msg()
	local Player = OwnerID()
	ScriptMessage( Player , Player , 1 , "[SC_2012HALLOW_MALA_26]" , C_System ) --�h�V[121409]�^���A���D�Ԧ��G�a�I
end

---------------------------------------------------------

-- ���Үɶ����, Ĳ�o�^��zone2
function lua_mika_2012hallow_goout()
	local Player = OwnerID()
	local ZoneID = ReadRoleValue(Player, EM_RoleValue_ZoneID )

	if ZoneID == 351 then
		Hao_SetPlot_Touch_Reset(Player)   -- �M���W�@��Ĳ�I�@�� 2013.09.24
		ScriptMessage( Player , Player , 1 , "[SC_2012HALLOW_MALA_37]" , C_System ) -- �ɶ�����A�A�A�A��X�h�a�I
		ScriptMessage( Player , Player , 0 , "[SC_2012HALLOW_MALA_37]" , C_System ) 
		ChangeZone( Player , 2 , 0 , 4871.9, 104.9, -1885.2, 92 )
	--	say(Player, "go out 1")
	end
--	say(Player, "go out 2")
end


--------------------------------------------------------

--SP ver. ����C���ˬd�a�O���S�����V�� & ���a�b���b
function lua_mika_2012hallow_111814_03()
	local jok = OwnerID()
	local Player = ReadRoleValue(jok, EM_RoleValue_Register+1 )  -- Player�O JOK��R1��
	local door = LuaFunc_SearchNPCbyOrgID( Jok , 101473, 300 , 1)       --�j��

	WriteRoleValue(Player, EM_LuaValueFlag_UseItem42, 0 )
	WriteRoleValue(Player, EM_RoleValue_Register+9, 0 )

	while true do
		local score = ReadRoleValue(Player, EM_LuaValueFlag_UseItem42)  -- ���a�V���a�j��
		local treasure = ReadRoleValue(Player, EM_RoleValue_Register+9)  -- ���a�}���_�c��

		if score == 36 and treasure == 10 then
			 --���A�A�A�A��u�O�F�`�r�I�~�M����������}�F�I�ҿױj�̴N�O�p���a�I�A���F�I  (�r�ꥼ��)
			ScriptMessage( OwnerID() , -1 , 1 , "|cffff00ff" .."[SC_111813_YU_37]".. "|r" , 0 )
			ScriptMessage( OwnerID() , -1 , 0 , "|cffff00ff" .."[SC_111813_YU_37]".. "|r" , 0 ) --
			sleep(30)
			AddBuff(Player, 623536, 0, -1 )  -- �����ܰT����buff ���ʫ����
			BeginPlot(  Player  , "Lua_Clockending" , 0 )
			ChangeZone( Player , 2 , 0 , 4871.9, 104.9, -1885.2, 92 )

			break
		end
		sleep(10)
	end
end

----------------------------------------------------------------
-- �ޯ� - ���w

function lua_mika_2012hallow_skill01()  
	local OID = OwnerID()  -- ���a
	local TID = TargetID() 
	local ghostlist = {107346, 107347, 107348}
	local Orgid = ReadRoleValue(TID, EM_RoleValue_OrgID )
	if Orgid == 107346 or Orgid == 107347 or Orgid == 107348 then
	--	say(TID, "effect" )
		AddBuff(TID, 623537, 0, 6 )  -- ���w�ĪG�ɶ�
	end
end

function lua_mika_2012hallow_skill02()  --check
	local OID = OwnerID()  -- ���a
	local TID = TargetID()   -- �ؼ�
	local Orgid = ReadRoleValue(TID, EM_RoleValue_OrgID )

	if ReadRoleValue(TID, EM_RoleValue_IsPlayer )  == 1 then -- �p�G�O���a
		ScriptMessage( OID , OID , 1 , "[SC_2012HALLOW_MALA_38]" , 0 )
		return false
	else
	--	say(TID, "orgid = "..Orgid )
		if Orgid == 107346 or Orgid == 107347 or Orgid == 107348 then
			return true
		else
			ScriptMessage( OID , OID , 1 , "[SC_2012HALLOW_MALA_38]" , 0 )
			return false
		end
	end

end

----------------------------------------------------------------
-- �J�����m����
function lua_mika_2012hallow_reset01() -- �����d�򤺪��a���p�ɾ�   �ƥ������m����
	SetPlot( OwnerID() ,"range",  "lua_mika_2012hallow_reset02" , 50 )  
end

function lua_mika_2012hallow_reset02() 
	-- 2012 �n�ʸ`���� ���ιC�� �ƥ������m����1
	local OID = OwnerID()   -- player
	local TID = TargetID()   -- BOX
	local pass = CheckBuff(OID, 623459 )  -- ����

	local eventplay =  CheckFlag( OID  , 546865 ) 
	local play =  CheckFlag( OwnerID()  , 543270 ) 

--	if pass == true then
--		say(OID, " pass = true")
--	else
--		say(OID,  "pass = false")
--	end

--	if eventplay == true then
--		say(OID, "event play = true ")
--	else
--		say(OID, "event play = false")
--	end
--
--	if play == true then
--		say(OID, "mala play = true ")
--	else
--		say(OID, "mala play = false")
--	end

	if pass == true then
		if  eventplay ~= true then    -- ���ʪ�
			SetFlag( OID  , 546865 , 1 ) --��������Ĳ�o�d��@��
			lua_mika_2012hallow_delall2()  -- �R���Ҧ�����
			BeginPlot( OID, "Lua_Clockending" , 0 )
			local door = LuaFunc_SearchNPCbyOrgID( OID , 101473, 300 , 1)       --�j��
			PlayMotion( door[0], 133) 
			SetModeEx( door[0] , EM_SetModeType_Obstruct, true )--����
	--		say(OID, "ghost house reset")
		end

	end

	if pass == false then
		if CheckBuff(OID, 623504 ) == false then  --�S�����ιC���ѻP��
			if  play == false then	--���ѲĤ@���i�ƥ�   �Ұʭ��m����C
				SetFlag( OID, 543270 , 1 ) --��������Ĳ�o�d��@��
				lua_mika_2012hallow_delall2()  -- �R���Ҧ�����
				BeginPlot( OwnerID()  , "Lua_Clockending" , 0 )
				local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
				local door = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101473, 300 , 1)       --�j��
				PlayMotion( door[0], 133) 
				SetModeEx( door[0] , EM_SetModeType_Obstruct, true )--����
				WriteRoleValue( OwnerID() , EM_RoleValue_Register+8 , 0 )   --���O���A���H�O�_�}���F   �O�G99
			--	say(OwnerID(), "mala 1 reset")
			end

		end
	end

end

----------------------------------------------------------------
-- TEST ���ե� 

-- ���ի��O
function lua_mika_2012hallow_test_99()
	ClockOpen( OwnerID() , EM_ClockCheckValue_30, 20,20, 0,"Lua_Clockending","lua_mika_2012hallow_test_991")  -- �˼ƭp�ɾ�  (�᭱����өI�s�禡�G "���Ϯ���"�A"�ɶ���ɩI�s�禡")
end

function lua_mika_2012hallow_test_991()
	local O_ID = OwnerID()
	Say(O_ID, "123")
end

-- ���m������
function lua_mika_2012hallow_test_01()
	local O_ID = OwnerID()
	Setflag(O_ID, 547085, 0 )
	Setflag(O_ID, 547086, 0 )
	Setflag(O_ID, 546865, 0 )
	CancelBuff_NoEvent(O_ID, 623536 )  -- ���ܰT����buff 

	Say(O_ID, "event reset ok")
end

-- �g�J�S�w����
function lua_mika_2012hallow_test_02(Value)
	local O_ID = OwnerID()
	Setflag(O_ID, 547085, 1 )  -- �����Ѥw���W
	Setflag(O_ID, 547086, 0 ) -- �R ���Ѥw����

	WriteRoleValue(O_ID, EM_LuaValueFlag_UseItem42, Value)
	local score = ReadRoleValue(O_ID, EM_LuaValueFlag_UseItem42 )
	Say(O_ID, "Now socre is "..score )
end

-- �g�J�_�c�}�Ҽ�
function lua_mika_2012hallow_test_03(Value)
	local O_ID = OwnerID()

	WriteRoleValue(O_ID, EM_RoleValue_Register+9, Value)
	local treasure = ReadRoleValue(O_ID, EM_RoleValue_Register+9)  -- ���a�}���_�c��
	Say(O_ID, "Now treasure count is "..treasure )
end

function lua_mika_2012hallow_test_buff()
	local OID = OwnerID()
	Addbuff(OID, 623459, 0, 30 ) -- ���ΰѥ[����, ���ծɶ������@��
end

--�a�j�M�ΦU���I���@��
function lua_mika_2012hallow_test_touch1()
	SetCursorType( OwnerID() , eCursor_Mine );
	SetPlot( OwnerID() ,"touch",  "lua_mika_2012hallow_obj1_01" , 30 )   -- �n��
end

function lua_mika_2012hallow_test_touch2()
	SetCursorType( OwnerID() , eCursor_Mine );
	SetPlot( OwnerID() ,"touch",  "lua_mika_2012hallow_obj2_01" , 30 )   -- �Q����
end

function lua_mika_2012hallow_test_touch3()
	SetCursorType( OwnerID() , eCursor_Mine );
	SetPlot( OwnerID() ,"touch",  "lua_mika_2012hallow_obj3_01" , 30 )   -- ���u��
end

function lua_mika_2012hallow_test_touch4()
	SetCursorType( OwnerID() , eCursor_Mine );
	SetPlot( OwnerID() ,"touch",  "lua_mika_2012hallow_obj4_01" , 30 )   -- ����
end

function lua_mika_2012hallow_test_touch5()
	SetCursorType( OwnerID() , eCursor_Mine );
	SetPlot( OwnerID() ,"touch",  "lua_mika_2012hallow_obj5_01" , 30 )   -- �X��
end

function lua_mika_2012hallow_test_touch6()
	SetCursorType( OwnerID() , eCursor_Mine );
	SetPlot( OwnerID() ,"touch",  "lua_mika_2012hallow_obj6_01" , 30 )   --  �v��
end

function lua_mika_2012hallow_objreset()
--	lua_mika_2012hallow_delall2()
--	sleep(5)
	lua_mika_2012hallow_floor_01()    --  702758  - �ͦa�O
	sleep(5)
	lua_mika_2012hallow_fire01()    --  702758  -  �ͼQ����
end