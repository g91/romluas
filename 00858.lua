function LuaI_111367()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Mat );
	SetShop( OwnerID() , 600127 , "Test_Shop_Close" );
end

function LuaS_111367()

	LoadQuestOption( OwnerID() )	--���J���ȼҪO

	if CheckCompleteQuest( OwnerID(), 421450 ) == true then
		AddSpeakOption( OwnerID(), TargetID(), GetString("SC_OLDBRINGNEW_12") , "LuaS_111367_intro" , 0 )		-- �ﶵ�A�p��i��a�A�ն��H
		AddSpeakOption( OwnerID(), TargetID(), GetString("SC_OLDBRINGNEW_07") , "LuaS_111367_BUY" , 0 )		-- �ﶵ�A�ʶR�u�ɮv�ҩ��v
		AddSpeakOption( OwnerID(), TargetID(), GetString("SC_OLDBRINGNEW_02") , "LuaS_111367_ADDPoint" , 0 )	-- �ﶵ�A�I���ä[�W�[���I��
	end
	if CheckCompleteQuest( OwnerID(), 421457 ) == true then
		AddSpeakOption( OwnerID(), TargetID(), GetString("SC_MAGICBOXEX_01") , "LuaS_111367_MagicBoxEx" , 0 )	-- �ﶵ�A�I���]���_����q
	end
	AddSpeakOption( OwnerID(), TargetID(), "[SC_111367_0]" , "LuaS_111367_1" , 0 )	-- �ﶵ�A�߰ݷ��ѥ�
end

-- �ﶵ�A�߰ݷ��ѥ�
function LuaS_111367_1()
	SetSpeakDetail( OwnerID(), "[SC_111367_1]"   )
	AddSpeakOption( OwnerID(), TargetID(), "[SO_110068_2]" , "LuaS_111367" , 0 )	-- �ﶵ�A�^��W�@��
end

function LuaS_111367_intro()
	SetSpeakDetail( OwnerID(), "[SC_OLDBRINGNEW_13]"   )
	AddSpeakOption( OwnerID(), TargetID(), "[SO_110068_2]" , "LuaS_111367" , 0 )	-- �ﶵ�A�^��W�@��
end


--�ﶵ - �ʶR�ɮv�ҩ�1
function LuaS_111367_BUY()
	if CheckFlag( OwnerID() , 541800 ) == true and CheckFlag( OwnerID() , 541801 ) == true then
		CloseSpeak( OwnerID() )	--������ܵ���
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_OLDBRINGNEW_11]" , 0 )	--�e�������T�� �A�L�k�A�ʶR�A�@�ѥu���ʶR 2 �i�ɮv�ҩ��I
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_OLDBRINGNEW_11]" , 0 )	--�T����
	else
		SetSpeakDetail( OwnerID(), "[SC_OLDBRINGNEW_08]"   ) 	-- �ɮv�ҩ��@�i�u�� 5000 ���A�A�Q�n�ʶR�ܡH
		AddSpeakOption( OwnerID(), TargetID(), "[SC_OLDBRINGNEW_09]" , "LuaS_111367_BUY2" , 0 )	-- �S���D�A�ڭn�R�I
		AddSpeakOption( OwnerID(), TargetID(), "[SO_110068_2]" , "LuaS_111367" , 0 )	-- �ﶵ�A�^��W�@��
	end
end

function LuaS_111367_BUY2()
	CloseSpeak( OwnerID() )	--������ܵ���
	local Money = Read_Role_Money( OwnerID() )
	if ( Money < 5000 ) then
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SO_111082_5]" , 0 )	--�e�������T��  �A���W�����������A�ڵL�k�浹�A�I
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SO_111082_5]" , 0 )	--�T����
	else
		Role_MoneyChange( OwnerID(), -5000 )
		if CheckFlag( OwnerID() , 541800 ) == false then
			SetFlag( OwnerID() , 541800 , 1 )
		elseif CheckFlag( OwnerID() , 541800 ) == true then
			SetFlag( OwnerID() , 541801 , 1 )
		end
		GiveBodyItem ( OwnerID() , 202879 , 1 )	-- �ɮv�ҩ�
	end
end

-- �ﶵ�A�I���ä[�W�[���I��
function LuaS_111367_ADDPoint()
	local STR = ReadRoleValue( OwnerID() , EM_RoleValue_STR )  --�O�q
	local AGI = ReadRoleValue( OwnerID() , EM_RoleValue_AGI )  --�ӱ�
	local STA = ReadRoleValue( OwnerID() , EM_RoleValue_STA )  --�@�O
	local INT = ReadRoleValue( OwnerID() , EM_RoleValue_INT )  --���z
	local MND = ReadRoleValue( OwnerID() , EM_RoleValue_MND ) --�믫
	local time1 = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem15 )  --�ѱa�s�t�� �I���O�q����
	local time2 = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem16 )  --�ѱa�s�t�� �I���ӱ�����
	local time3 = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem17 )  --�ѱa�s�t�� �I���@�O����
	local time4 = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem18 )  --�ѱa�s�t�� �I�����z����
	local time5 = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem19 )  --�ѱa�s�t�� �I���믫����

	local LV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )   -- �D¾����

--	LoadQuestOption( OwnerID() )	--���J���ȼҪO
	if LV < 50 then  --���ŧC��50
		if  time1 == 50 and time2 == 50 and time3  == 50 and time4 == 50 and time5 == 50  then  --�U���ƭȳ��[��50
			SetSpeakDetail( OwnerID(), "[SC_OLDBRINGNEW_ALLCHANGE]"   )   --�S���i�I�������ءA�Ҧ����ت���O�Ȥw�I�������C
		else
			SetSpeakDetail( OwnerID(), "[SC_OLDBRINGNEW_MENU]"   )  --�A�ݭn�I�����@�ض��ةO�H
			if time1 <50 then
				AddSpeakOption(OwnerID(), TargetID(), "[SC_OLDBRINGNEW_03_01STR]" , "LuaS_111367_ADDSTR", 0 ) -- �H�a�A�n���I���O�q
			end
			if time2 <50 then
				AddSpeakOption(OwnerID(), TargetID(), "[SC_OLDBRINGNEW_03_02AGI]" , "LuaS_111367_ADDAGI", 0 ) -- �H[�a�A�n���I���ӱ�
			end
			if time3 <50 then
				AddSpeakOption(OwnerID(), TargetID(), "[SC_OLDBRINGNEW_03_03STA]" , "LuaS_111367_ADDSTA", 0 ) -- �H�a�A�n���I���@�O
			end
			if time4 <50 then
				AddSpeakOption(OwnerID(), TargetID(), "[SC_OLDBRINGNEW_03_04INT]" , "LuaS_111367_ADDINT", 0 ) -- �H�a�A�n���I�����z
			end
			if time5 <50 then
				AddSpeakOption(OwnerID(), TargetID(), "[SC_OLDBRINGNEW_03_05MND]" , "LuaS_111367_ADDMND", 0 ) -- �H�a�A�n���I���믫
			end
		end
	else -- �D¾�j��50
		SetSpeakDetail( OwnerID(), "[SC_OLDBRINGNEW_MENU]"   )  --�A�ݭn�I�����@�ض��ةO�H
		if time1 <50 then
			AddSpeakOption(OwnerID(), TargetID(), "[SC_OLDBRINGNEW_03_01STR]" , "LuaS_111367_ADDSTR", 0 ) -- �H�a�A�n���I���O�q
		end
		if time2 <50 then
			AddSpeakOption(OwnerID(), TargetID(), "[SC_OLDBRINGNEW_03_02AGI]" , "LuaS_111367_ADDAGI", 0 ) -- �H[�a�A�n���I���ӱ�
		end
		if time3 <50 then
			AddSpeakOption(OwnerID(), TargetID(), "[SC_OLDBRINGNEW_03_03STA]" , "LuaS_111367_ADDSTA", 0 ) -- �H�a�A�n���I���@�O
		end
		if time4 <50 then
			AddSpeakOption(OwnerID(), TargetID(), "[SC_OLDBRINGNEW_03_04INT]" , "LuaS_111367_ADDINT", 0 ) -- �H�a�A�n���I�����z
		end
		if time5 <50 then
			AddSpeakOption(OwnerID(), TargetID(), "[SC_OLDBRINGNEW_03_05MND]" , "LuaS_111367_ADDMND", 0 ) -- �H�a�A�n���I���믫
		end
		AddSpeakOption(OwnerID(), TargetID(), "[SC_OLDBRINGNEW_03_06TPEXP]" , "LuaS_111367_ADDTP", 0 ) -- �H�a�A�n���I���ޯ��I��
	end
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaS_111367", 0 ) --�^��W�@�h
end





--�ɮv�ҩ�
function OldBringNew_Tech( Option )
	local PlayerID = OwnerID()
	local PackageID = 202879   -- �ɮv�ҩ�

	if ( Option == "CHECK" ) then
		if CountBodyItem( PlayerID , PackageID ) >= 1 then
			local TechTime = ReadRoleValue( OwnerID() , EM_RoleValue_TimeFlag + EM_TimeFlagEffect_HonorParty )
			local PartyNum = GetPartyID( OwnerID() , -1 )
			if ( PartyNum > 0 ) then
				ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_OLDBRINGNEW_15]" , C_DEFAULT )	-- ��������A�U�A�L�k�ϥΦ����~�C
				return false
			elseif TechTime > 0 or CheckBuff( PlayerID , 506841) == true  then
				--Say( OwnerID() , "TechTime = "..TechTime )
				ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_OLDBRINGNEW_01") , C_DEFAULT )	-- �L�k�ϥΡA�A�ثe�ٳB�b�a�A�ն����ĪG�����I�I
				return false
			elseif TechTime <= 0 then
				return true
			else
			--	Say( OwnerID() , "Something Error !!")
			end
		else
			return false
		end
	elseif ( Option == "USE" ) then
		WriteRoleValue( OwnerID() , EM_RoleValue_TimeFlag + EM_TimeFlagEffect_HonorParty , 180 )		-- 180�� = 3�p��
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_OLDBRINGNEW_14]" , C_SYSTEM )	--�e�������T��  �A��o�F�a�A�ն��ĪG�A�{�b�i�a��s�⪱�a�i��a�A�ն��F�I
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_OLDBRINGNEW_14]" , C_SYSTEM )	--�T����
		CancelBuff(OwnerID(), 506841)	--20141008�s�W
		AddBuff( OwnerID() , 506841 , 0 , 10800 )  --3�p��
	end
end


function lua_mika_delhonorparty()  --�����a�A�ն����A 506841������Ĳ�o
	WriteRoleValue( OwnerID() , EM_RoleValue_TimeFlag + EM_TimeFlagEffect_HonorParty , -1 )
--	Say(OwnerID(), "Cacel honor party ")
	CancelBuff(OwnerID(), 506841)
end