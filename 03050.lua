------
------27PE�]�w
------
function Lua_ZonePE_Z27_Set()--�]�w(�C�Ӱϰ��ܧ�)
	Lua_ZonePE_Z27_Global()--�ܼƫŧi(�C�Ӱϰ��ܧ�)
	Lua_ZonePE_3th_PESet()--PE�]�w(�ä[����)
end

function Lua_ZonePE_Z27_Global()--�ܼƫŧi(�C�Ӱϰ��ܧ�)
	ZonePE_3th_Global = {}--(���ܧ�)
	ZonePE_3th_BonusTop = {}--�Ʀ�](���ܧ�)
	ZonePE_3th_JoinList = {}--�ѥ[�W��(���ܧ�)
	local Global = ZonePE_3th_Global--���ܧ�
	
	Global["MapID"] = 10027--�a��ID
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
	Global["Shop"][1] = 600492	--���Űө�
	Global["Shop"][2] = 600493	--���Ū����ө�
	Global["Shop"][3] = 600494	--���ũR���ө�
	Global["Shop"][4] = 600495	--���Űө�(���[
	Global["Shop"][5] = 600496	--���Ū����ө�(���[
	Global["Shop"][6] = 600497	--���ũR���ө�(���[
	
	Global["PE_Name"] = "SC_Z27_EVENT_NAME"--PE�W��
	Global["PE_Desc"] = "SC_Z27_EVENT_NAMEDES"--PE�y�z
	Global["PH_Name"] = {}--���q�W��
	Global["PH_Name"][1] = "SC_Z27_EVENT_RESET"	-- ���ݶ��q
	Global["PH_Name"][2] = "SC_Z27_EVENT_STATE"	-- �i�涥�q
	
	Global["PH_Desc"] = {}--���q�y�z
	Global["PH_Desc"][1] = "SC_Z27_EVENT_RESET_DESC"-- ���ݴy�z
	Global["PH_Desc"][2] = "SC_Z27_EVENT_STATE_DESC"-- �i��y�z
	
	Global["OB_Name"] = "SC_Z27_EVENT_CON"--�i�涥�q���\����
	Global["OB_Desc"] = "SC_Z27_EVENT_CONDESC"--�i�涥�q���\����y�z

	Global["StartMsg"] = "[SC_ZONE_PE_3TH_ST1START]"	--�ϰ�ƥ�{�b�}�l�I
	Global["FailMsg"] = "[SC_ZONE_PE_3TH_FAIL]"		--�ϰ�ƥ�S�������I
	Global["EndMsg"] = "[SC_ZONE_PE_3TH_ST1OVER]"		--�ϰ�ƥ�w�Q�����I
	
	Global["BonusMsg"] = "[SC_ZONE_PE_3TH_NAMELIST]"	--�����ϰ�ƥ󤤡A�A�^�m���n����[$VAR1]���A�ƦW��[$VAR2]�C
	Global["RankMsg"] = "[SC_ZONE_PE_3TH_NAMELIST_ALL]"	--�o�ǫ_�I�̪��W�r�N�|�����b[SC_ZONE_PE_SELLS]�����l�̡A�@���_�I�ۭ̮Īk���ؼСC
end

function Lua_ZonePE_Z28_Set()--�]�w(�C�Ӱϰ��ܧ�)
	Lua_ZonePE_Z28_Global()--�ܼƫŧi(�C�Ӱϰ��ܧ�)
	Lua_ZonePE_3th_PESet()--PE�]�w(�ä[����)
end

------
------28PE�]�w
------
function Lua_ZonePE_Z28_Global()--�ܼƫŧi(�C�Ӱϰ��ܧ�)
	ZonePE_3th_Global = {}--(���ܧ�)
	ZonePE_3th_BonusTop = {}--�Ʀ�](���ܧ�)
	ZonePE_3th_JoinList = {}--�ѥ[�W��(���ܧ�)
	local Global = ZonePE_3th_Global--���ܧ�
	
	Global["MapID"] = 10028--�a��ID
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
	Global["Shop"][1] = 600501	--���Űө�
	Global["Shop"][2] = 600502	--���Ū����ө�
	Global["Shop"][3] = 600503	--���ũR���ө�
	Global["Shop"][4] = 600504	--���Űө�(���[
	Global["Shop"][5] = 600505	--���Ū����ө�(���[
	Global["Shop"][6] = 600506	--���ũR���ө�(���[
	
	Global["PE_Name"] = "SC_Z28_EVENT_NAME"--PE�W��
	Global["PE_Desc"] = "SC_Z28_EVENT_NAMEDES"--PE�y�z
	Global["PH_Name"] = {}--���q�W��
	Global["PH_Name"][1] = "SC_Z28_EVENT_RESET"	-- ���ݶ��q
	Global["PH_Name"][2] = "SC_Z28_EVENT_STATE"	-- �i�涥�q
	
	Global["PH_Desc"] = {}--���q�y�z
	Global["PH_Desc"][1] = "SC_Z28_EVENT_RESET_DESC"-- ���ݴy�z
	Global["PH_Desc"][2] = "SC_Z28_EVENT_STATE_DESC"-- �i��y�z
	
	Global["OB_Name"] = "SC_Z28_EVENT_CON"--�i�涥�q���\����
	Global["OB_Desc"] = "SC_Z28_EVENT_CONDESC"--�i�涥�q���\����y�z

	Global["StartMsg"] = "[SC_ZONE_PE_3TH_ST1START]"	--�ϰ�ƥ�{�b�}�l�I
	Global["FailMsg"] = "[SC_ZONE_PE_3TH_FAIL]"		--�ϰ�ƥ�S�������I
	Global["EndMsg"] = "[SC_ZONE_PE_3TH_ST1OVER]"		--�ϰ�ƥ�w�Q�����I
	
	Global["BonusMsg"] = "[SC_ZONE_PE_3TH_NAMELIST]"	--�����ϰ�ƥ󤤡A�A�^�m���n����[$VAR1]���A�ƦW��[$VAR2]�C
	Global["RankMsg"] = "[SC_ZONE_PE_3TH_NAMELIST_ALL]"	--�o�ǫ_�I�̪��W�r�N�|�����b[SC_ZONE_PE_SELLS]�����l�̡A�@���_�I�ۭ̮Īk���ؼСC
end

------
------29PE�]�w
------
function Lua_ZonePE_Z29_Set()--�]�w(�C�Ӱϰ��ܧ�)
	Lua_ZonePE_Z29_Global()--�ܼƫŧi(�C�Ӱϰ��ܧ�)
	Lua_ZonePE_3th_PESet()--PE�]�w(�ä[����)
end

function Lua_ZonePE_Z29_Global()--�ܼƫŧi(�C�Ӱϰ��ܧ�)
	ZonePE_3th_Global = {}--(���ܧ�)
	ZonePE_3th_BonusTop = {}--�Ʀ�](���ܧ�)
	ZonePE_3th_JoinList = {}--�ѥ[�W��(���ܧ�)
	local Global = ZonePE_3th_Global--���ܧ�
	
	Global["MapID"] = 10029--�a��ID
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
	Global["Shop"][1] = 600514	--���Űө�
	Global["Shop"][2] = 600515	--���Ū����ө�
	Global["Shop"][3] = 600516	--���ũR���ө�
	Global["Shop"][4] = 600517	--���Űө�(���[
	Global["Shop"][5] = 600518	--���Ū����ө�(���[
	Global["Shop"][6] = 600519	--���ũR���ө�(���[
	
	Global["PE_Name"] = "SC_Z29_EVENT_NAME"--PE�W��
	Global["PE_Desc"] = "SC_Z29_EVENT_NAMEDES"--PE�y�z
	Global["PH_Name"] = {}--���q�W��
	Global["PH_Name"][1] = "SC_Z29_EVENT_RESET"	-- ���ݶ��q
	Global["PH_Name"][2] = "SC_Z29_EVENT_STATE"	-- �i�涥�q
	
	Global["PH_Desc"] = {}--���q�y�z
	Global["PH_Desc"][1] = "SC_Z29_EVENT_RESET_DESC"-- ���ݴy�z
	Global["PH_Desc"][2] = "SC_Z29_EVENT_STATE_DESC"-- �i��y�z
	
	Global["OB_Name"] = "SC_Z29_EVENT_CON"--�i�涥�q���\����
	Global["OB_Desc"] = "SC_Z29_EVENT_CONDESC"--�i�涥�q���\����y�z

	Global["StartMsg"] = "[SC_ZONE_PE_3TH_ST1START]"	--�ϰ�ƥ�{�b�}�l�I
	Global["FailMsg"] = "[SC_ZONE_PE_3TH_FAIL]"		--�ϰ�ƥ�S�������I
	Global["EndMsg"] = "[SC_ZONE_PE_3TH_ST1OVER]"		--�ϰ�ƥ�w�Q�����I
	
	Global["BonusMsg"] = "[SC_ZONE_PE_3TH_NAMELIST]"	--�����ϰ�ƥ󤤡A�A�^�m���n����[$VAR1]���A�ƦW��[$VAR2]�C
	Global["RankMsg"] = "[SC_ZONE_PE_3TH_NAMELIST_ALL]"	--�o�ǫ_�I�̪��W�r�N�|�����b[SC_ZONE_PE_SELLS]�����l�̡A�@���_�I�ۭ̮Īk���ؼСC
end