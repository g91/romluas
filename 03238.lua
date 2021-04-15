function Z33_NPC123906SK_00()	-- �Ƿ�D���J��
	local player = OwnerID();
	local npc = TargetID();

	LoadQuestOption( player );	-- ���J���ȼҪO���
end

function Z34_NPC124156SK_00()	-- ���J���a�ڪ����q
	local player = OwnerID();
	local npc = TargetID();
	local QuestID = 427357;	-- �t�����p�H

	if CheckAcceptQuest( player , QuestID ) == true then
		AddSpeakOption( player , npc , "[SC_Z34_Q427357_03]" , "Z34_NPC124156SK_01" , 0 );	-- �@���H�ϦV�t���D���@�ơK�K
	end

	LoadQuestOption( player );	-- ���J���ȼҪO���
end

function Z34_NPC124156SK_01()	-- ���J���a�ڪ����q
	local player = OwnerID();
	local npc = TargetID();
	local QuestID = 427357;	-- �t�����p�H

	if CheckAcceptQuest( player , QuestID ) == true then
		SetSpeakDetail( player, "[SC_Z34_Q427357_04]" );		-- �ڷ|�N�t���ثe�����p�a�^���a�ڪ������K�K
	end
end

function Z34_NPC124157SK_00()	-- ��n�D�����w
	local player = OwnerID();
	local npc = TargetID();
	local QuestID = 427357;	-- �t�����p�H
	local KeyItem = 549381;	-- ���{����a���A�P��n�D�����w���

	if CheckAcceptQuest( player , QuestID ) == true and CheckFlag( player , KeyItem ) == false then
		SetSpeakDetail( player, "[SC_Z34_Q427357_02]" );		-- �ڷ|�N�t���ثe�����p�a�^���a�ڪ������K�K
		AddSpeakOption( player , npc , "[SC_Z34_Q427357_01]" , "Z34_NPC124157SK_01" , 0 );	-- �A�O�o����a���t�d�H�H
	else
		LoadQuestOption( player );	-- ���J���ȼҪO���
	end
end

function Z34_NPC124157SK_01()	-- ��n�D�����w
	local player = OwnerID();
	local npc = TargetID();
	local QuestID = 427357;	--  �t�����p�H
	local KeyItem = 549381;	-- ���{����a���A�P��n�D�����w���

	if CheckAcceptQuest( player , QuestID ) == true and CheckFlag( player , KeyItem ) == false then
		SetFlag( player , KeyItem , 1 );
		LoadQuestOption( player );	-- ���J���ȼҪO���
	end
end

function Z34_NPC124157SK_02()	-- ��n�D�����w
	local player = OwnerID();
	local npc = TargetID();
	local QuestID = 427358;	--  ���񪺦M���I
	local KeyItem = 549384;	-- ���ȧP�_3

	if CheckAcceptQuest( player , QuestID ) == true and CheckFlag( player , KeyItem ) == false then
	--	SetFlag( player , KeyItem , 1 );
		SetSpeakDetail( player, "[SC_Z34_Q427357_10]" );		-- ���]����~�O�Y�ӸT�ҲŤ�D��c�H�ݥΡK�K
		AddSpeakOption( player , npc , "[SC_Z34_Q427357_11]" , "Z34_NPC124158SK_03" , 0 );	-- �@�ϥ촵��ǡA�q���e��I
	end
end

function Z34_NPC124157SK_03()	-- ��n�D�����w
	local player = OwnerID();
	local npc = TargetID();
	local QuestID = 427358;	--  ���񪺦M���I
	local KeyItem = 549384;	-- ���ȧP�_3

	if CheckAcceptQuest( player , QuestID ) == true and CheckFlag( player , KeyItem ) == false then
		SetFlag( player , KeyItem , 1 );
		SetSpeakDetail( player, "[SC_Z34_Q427357_12]" );		-- �D�`�n�A���M�ڭ̱��U���٦��@�j�q�}�������~�n���K�K
	end
end

function Z34_NPC124158SK_00()	-- �J�p�D�ƺ�
	local player = OwnerID();
	local npc = TargetID();
	local QuestID = 427358;	-- ���񪺦M���I

	if CheckAcceptQuest( player , QuestID ) == true then
		AddSpeakOption( player , npc , "[SC_Z34_Q427357_05]" , "Z34_NPC124158SK_01" , 0 );	-- ��h����p�Ԩu���ت���T�C
	end

	LoadQuestOption( player )	-- ���J���ȼҪO���
end

function Z34_NPC124158SK_01()	-- �J�p�D�ƺ�
	local player = OwnerID();
	local npc = TargetID();
	local QuestID = 427358;	-- ���񪺦M���I
	local KeyItem = 549382;	-- ���ȧP�_1

	if CheckAcceptQuest( player , QuestID ) == true and CheckFlag( player , KeyItem ) == false then
		SetFlag( player , KeyItem , 1 );
	end

	SetSpeakDetail( player, "[SC_Z34_Q427357_06]" );		-- �̾ڽ�̤�������s�A�p�Ԩu���ت��X�{�ëD���M�K�K
end

function Z34_NPC124159SK_00()	-- ������
	local player = OwnerID();
	local npc = TargetID();
	local QuestID = 427358;	-- ���񪺦M���I

	if CheckAcceptQuest( player , QuestID ) == true then
		AddSpeakOption( player , npc , "[SC_Z34_Q427357_07]" , "Z34_NPC124159SK_01" , 0 );	-- ��O�J��s�ι��p�Ԩu���ت��լd���G�H
	end

	LoadQuestOption( player );	-- ���J���ȼҪO���
end

function Z34_NPC124159SK_01()	-- ������
	local player = OwnerID();
	local npc = TargetID();
	local QuestID = 427358;	-- ���񪺦M���I
	local KeyItem = 549383;	-- ���ȧP�_2

	if CheckAcceptQuest( player , QuestID ) == true and CheckFlag( player , KeyItem ) == false then
		SetFlag( player , KeyItem , 1 );
	end

	SetSpeakDetail( player, "[SC_Z34_Q427357_08]" );		-- �w��p�Ԩu���اڭ̤w�g�i��w��A�M�ᦳ�F��_���o�{�K�K

end

function Z34_NPC124160SK_00()	-- �f�g��
	local player = OwnerID();
	local npc = TargetID();

	LoadQuestOption( player );	-- ���J���ȼҪO���
end

function Z34_NPC124181SK_00()	-- ��n�D�����w
	local player = OwnerID();
	local npc = TargetID();

	LoadQuestOption( player );	-- ���J���ȼҪO���
end

function Z34_NPC124182SK_00()	-- �J�p�D�ƺ�
	local player = OwnerID();
	local npc = TargetID();

	LoadQuestOption( player );	-- ���J���ȼҪO���
end

function Z34_NPC124183SK_00()	--  ������
	local player = OwnerID();
	local npc = TargetID();

	LoadQuestOption( player );	-- ���J���ȼҪO���
end

function Z34_NPC124191SK_00()	-- ��n�D�����w
	local player = OwnerID();
	local npc = TargetID();

	LoadQuestOption( player );	-- ���J���ȼҪO���
end

function Z34_NPC124192SK_00()	-- �J�p�D�ƺ�
	local player = OwnerID();
	local npc = TargetID();

	LoadQuestOption( player );	-- ���J���ȼҪO���
end

function Z34_NPC124193SK_00()	--  ������
	local player = OwnerID();
	local npc = TargetID();

	LoadQuestOption( player );	-- ���J���ȼҪO���
end

function Z34_NPC124194SK_00()	-- ��n�D�����w
	local player = OwnerID();
	local npc = TargetID();

	LoadQuestOption( player );	-- ���J���ȼҪO���
end

function Z34_NPC124195SK_00()	-- �J�p�D�ƺ�
	local player = OwnerID();
	local npc = TargetID();

	LoadQuestOption( player );	-- ���J���ȼҪO���
end

function Z34_NPC124167SK_00()	-- �J�p�D�ƺ�
	local player = OwnerID();
	local npc = TargetID();

	LoadQuestOption( player );	-- ���J���ȼҪO���
end

function Z34_NPC124196_ClickBefore()
	local player = OwnerID();
	local npc = TargetID();
	local QuestID = 427364;	-- �ĤH���}�a
	local KeyItem = 549386;	-- ��X�ĤH����p�e����T

	if CheckAcceptQuest( player , QuestID ) == true then	-- ��������
		return true;		-- ���L
	end

	return false;			-- �����L

end

function Z34_NPC124196_ClickAfter()
	local player = OwnerID();
	local npc = TargetID();
	local QuestID = 427364;	-- �ĤH���}�a
	local KeyItem = 549386;	-- ��X�ĤH����p�e����T
	local Item = 243298;	-- ���ܤ��

	if CheckAcceptQuest( player , QuestID ) == true then	-- ��������
		if CheckFlag( player , KeyItem ) == false then	-- �S���n���~�����n���~
			SetFlag( player , KeyItem , 1 );
		end
		if CountBodyItem( player , Item ) < 1 then	-- �S���Ȫ��~�����Ȫ��~
			GiveBodyItem( player , Item , 1 );
		end
	end

	return true;
end

function Z34_NPC124172_ClickBefore()	-- �˳Ƥ�c
	local player = OwnerID();
	local npc = TargetID();
	local QuestID = 427384;	-- �}�a�ĤH���˳�

	if CheckAcceptQuest( player , QuestID ) == true then	-- ��������
		return true;		-- ���L
	end

	return false;			-- �����L

end

function Z34_NPC124172_ClickAfter()		-- �˳Ƥ�c
	local player = OwnerID();
	local npc = TargetID();
	local QuestID = 427384;		-- �}�a�ĤH���˳�
	local mob = 109315;		-- �}�a�˳Ƥ�c

	if CheckAcceptQuest( player , QuestID ) == true then	-- ��������
		DW_QietKillOne( player , mob )		--�R�R�������ǡA�e�̱�����̡A0�N�����a
		CallPlot( npc , "Z34_NPC124172_ClickAfter_2" , player );			-- ��������
	end
	
	return true;
end

function Z34_NPC124172_ClickAfter_2( player )		-- �˳Ƥ�c
	local npc = OwnerID();
	local pX = ReadRoleValue( npc , EM_RoleValue_X );
	local pY = ReadRoleValue( npc , EM_RoleValue_Y );
	local pZ = ReadRoleValue( npc , EM_RoleValue_Z );

--	say(player,"player")
--	say(npc,"npc")

	SysCastSpellLv_Pos( npc, pX, pY, pZ, 852288, 3 )		-- ���K�`�N
	sleep(20)
	CallPlot( npc , "LuaFunc_ResetObj", npc );			-- ��������
	
	return true;
end

function Z34_NPC124241_Initial()		-- �n�뤺��
	local npc = OwnerID();

	SetPlot( npc , "range" , "Z34_NPC124241_Range" , 100 )
	
	return true;
end

function Z34_NPC124241_Range()		-- �n�뤺��
	local player = OwnerID();
	local QuestID = 427374;		-- ���d�n�뤺��
	local Keyitem = 549388;		-- ���d�n�뤺��

	if CheckAcceptQuest( player , QuestID ) == true then	-- ��������
		SetFlag( player , KeyItem , 1 );
	end
	
	return true;
end