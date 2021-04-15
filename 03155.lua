------
------32PE�]�w
------
function Lua_ZonePE_Z32_Set()--�]�w(�C�Ӱϰ��ܧ�)
	Lua_ZonePE_Z32_Global()--�ܼƫŧi(�C�Ӱϰ��ܧ�)
	Lua_ZonePE_3th_PESet()--PE�]�w(�ä[����)
end

function Lua_ZonePE_Z32_Global()--�ܼƫŧi(�C�Ӱϰ��ܧ�)
	ZonePE_3th_Global = {}--(���ܧ�)
	ZonePE_3th_BonusTop = {}--�Ʀ�](���ܧ�)
	ZonePE_3th_JoinList = {}--�ѥ[�W��(���ܧ�)
	local Global = ZonePE_3th_Global--���ܧ�
	
	Global["MapID"] = 10032--�a��ID
	Global["MaxScore"] = 6000--���\�`��
	Global["ExCha_Ratio"] = 100 --�I����v
	Global["ExCha_Max"] = 10--�I���W��
	Global["ItemID"] = EM_RoleValue_EnergyJusticeCoin--�N��
	
	Global["ExBonus"] = {}--�B�~���y
	Global["ExBonus"][1]=25
	Global["ExBonus"][2]=20
	Global["ExBonus"][3]=15
	Global["ExBonus"][4]=10 
	Global["ExBonus"][5]=5 -- 5~10
	
	Global["Shop"] = {}
	Global["Shop"][1] = 600550	--���Űө�
	Global["Shop"][2] = 600551	--���Ū����ө�
	Global["Shop"][3] = 600552	--���ũR���ө�
	Global["Shop"][4] = 600553	--���Űө�(���[
	Global["Shop"][5] = 600554	--���Ū����ө�(���[
	Global["Shop"][6] = 600555	--���ũR���ө�(���[
	
	Global["PE_Name"] = "SC_Z32_EVENT_NAME"--PE�W��
	Global["PE_Desc"] = "SC_Z32_EVENT_NAMEDES"--PE�y�z
	Global["PH_Name"] = {}--���q�W��
	Global["PH_Name"][1] = "SC_Z32_EVENT_RESET"	-- ���ݶ��q
	Global["PH_Name"][2] = "SC_Z32_EVENT_STATE"	-- �i�涥�q
	
	Global["PH_Desc"] = {}--���q�y�z
	Global["PH_Desc"][1] = "SC_Z32_EVENT_RESET_DESC"-- ���ݴy�z
	Global["PH_Desc"][2] = "SC_Z32_EVENT_STATE_DESC"-- �i��y�z
	
	Global["OB_Name"] = "SC_Z32_EVENT_CON"--�i�涥�q���\����
	Global["OB_Desc"] = "SC_Z32_EVENT_CONDESC"--�i�涥�q���\����y�z

	Global["StartMsg"] = "[SC_ZONE_PE_3TH_ST1START]"	--�ϰ�ƥ�{�b�}�l�I
	Global["FailMsg"] = "[SC_ZONE_PE_3TH_FAIL]"		--�ϰ�ƥ�S�������I
	Global["EndMsg"] = "[SC_ZONE_PE_3TH_ST1OVER]"		--�ϰ�ƥ�w�Q�����I
	
	Global["BonusMsg"] = "[SC_ZONE_PE_3TH_NAMELIST]"	--�����ϰ�ƥ󤤡A�A�^�m���n����[$VAR1]���A�ƦW��[$VAR2]�C
	Global["RankMsg"] = "[SC_ZONE_PE_3TH_NAMELIST_ALL]"	--�o�ǫ_�I�̪��W�r�N�|�����b[SC_ZONE_PE_SELLS]�����l�̡A�@���_�I�ۭ̮Īk���ؼСC
end




------
------33PE�]�w
------
function Lua_ZonePE_Z33_Set()--�]�w(�C�Ӱϰ��ܧ�)
	Lua_ZonePE_Z33_Global()--�ܼƫŧi(�C�Ӱϰ��ܧ�)
	Lua_ZonePE_3th_PESet()--PE�]�w(�ä[����)
end

function Lua_ZonePE_Z33_Global()--�ܼƫŧi(�C�Ӱϰ��ܧ�)
	ZonePE_3th_Global = {}--(���ܧ�)
	ZonePE_3th_BonusTop = {}--�Ʀ�](���ܧ�)
	ZonePE_3th_JoinList = {}--�ѥ[�W��(���ܧ�)
	local Global = ZonePE_3th_Global--���ܧ�
	
	Global["MapID"] = 10033--�a��ID
	Global["MaxScore"] = 6000--���\�`��
	Global["ExCha_Ratio"] = 100 --�I����v
	Global["ExCha_Max"] = 10--�I���W��
	Global["ItemID"] = EM_RoleValue_EnergyJusticeCoin--�N��
	
	Global["ExBonus"] = {}--�B�~���y
	Global["ExBonus"][1]=25
	Global["ExBonus"][2]=20
	Global["ExBonus"][3]=15
	Global["ExBonus"][4]=10 
	Global["ExBonus"][5]=5 -- 5~10
	
	Global["Shop"] = {}
	Global["Shop"][1] = 600580	--���Űө�
	Global["Shop"][2] = 600581	--���Ū����ө�
	Global["Shop"][3] = 600582	--���ũR���ө�
	Global["Shop"][4] = 600583	--���Űө�(���[
	Global["Shop"][5] = 600584	--���Ū����ө�(���[
	Global["Shop"][6] = 600585	--���ũR���ө�(���[
	
	Global["PE_Name"] = "SC_Z33_EVENT_NAME"--PE�W��
	Global["PE_Desc"] = "SC_Z33_EVENT_NAMEDES"--PE�y�z
	Global["PH_Name"] = {}--���q�W��
	Global["PH_Name"][1] = "SC_Z33_EVENT_RESET"	-- ���ݶ��q
	Global["PH_Name"][2] = "SC_Z33_EVENT_STATE"	-- �i�涥�q
	
	Global["PH_Desc"] = {}--���q�y�z
	Global["PH_Desc"][1] = "SC_Z33_EVENT_RESET_DESC"-- ���ݴy�z
	Global["PH_Desc"][2] = "SC_Z33_EVENT_STATE_DESC"-- �i��y�z
	
	Global["OB_Name"] = "SC_Z33_EVENT_CON"--�i�涥�q���\����
	Global["OB_Desc"] = "SC_Z33_EVENT_CONDESC"--�i�涥�q���\����y�z

	Global["StartMsg"] = "[SC_ZONE_PE_3TH_ST1START]"	--�ϰ�ƥ�{�b�}�l�I
	Global["FailMsg"] = "[SC_ZONE_PE_3TH_FAIL]"		--�ϰ�ƥ�S�������I
	Global["EndMsg"] = "[SC_ZONE_PE_3TH_ST1OVER]"		--�ϰ�ƥ�w�Q�����I
	
	Global["BonusMsg"] = "[SC_ZONE_PE_3TH_NAMELIST]"	--�����ϰ�ƥ󤤡A�A�^�m���n����[$VAR1]���A�ƦW��[$VAR2]�C
	Global["RankMsg"] = "[SC_ZONE_PE_3TH_NAMELIST_ALL]"	--�o�ǫ_�I�̪��W�r�N�|�����b[SC_ZONE_PE_SELLS]�����l�̡A�@���_�I�ۭ̮Īk���ؼСC
end
