function LuaS_110757()	-- ���y�޾ɭ�
	LoadQuestOption( OwnerID() )
	--SetSpeakDetail( OwnerID(), GetString ( "ST_CHANGEPARALLED_MSG" )   )
	--�o�ӥ@�ɤW����Ť�O�q���v�T�A���ɶ����y�ʦb�Y�Ǧa�貣�ͤF���[�A���Ǧ]���Ӥ������@�ɧڭ̺٬����y�A
	--�o�Ǥ��y�P�ڭ̪��@�ɴN�p�P�@�ӹ���b���P���u�U���ͪ����P�v�l�A�o�]�O�ڭ̰g�~�����ұ��Q���������@�C

	--�{�b�ڭ̰g�~�����o�{�Y�ǯS�w�a�I�i�H���H�e�����P�����y�A�L�h���ǤH�b�o�ӥ@�ɧ䤣��ۤv����V�A�N�O
	--�]���L�u�����ӥh���a����O�b��L�����y�W�A�A�O�_�]�g���ۤv����V�H�p�G�O���ܡA�A�γ\�i�H�e����L
	--�����y�ݬݡA�ӧڭ̰g�~�����N�|���U�A�i��o�q�ȵ{�C
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_CHANGEPARALLED") , "LuaS_ChangeParalledID_1", 0 ) --/*�ڭn�e����L���y
end

function LuaS_110077()	-- �j�šA�����Ĥ��ӤH��NPC
	--if ( CheckCompleteQuest( OwnerID() , 420079 ) == true ) then
	--	SetSpeakDetail( OwnerID() , "���F�Ĥ�����A�ڪ��y�w�g������h�F�A���§A���ڳo�ӦѤH�a�A���ڶ]���@��C\n\n�ڸ�A���ڡA�ܤB�i�f���Ĥ��~��@�V�ܦn�A���ݭn���ܡA�A�i�H�h�h���U�A�~���H�b�~�Ȧ�A�`�O�|���Ӷˤ��򪺡K�`�����ƴN�L�w�A��a�H" )
	--else
		LoadQuestOption( OwnerID() )	--���J���ȼҪO
		SetSpeakDetail( OwnerID() , "����~���@�j�A����N��ť�ϳ�F�A���Ѹy�S�h�F�K" )
	--end
end

function LuaS_110018()	-- �����A�@����Ȫ�NPC
	LoadQuestOption( OwnerID() )	--���J���ȼҪO
	--if ( CheckCompleteQuest( OwnerID() , 420077 ) == true ) then
	--	SetSpeakDetail( OwnerID() , "���Ѫ������٬O�t���o��h���U�l�ڡA�ݨӱo�����@�I���ɶ��L�o�B�z�F�C" )
	--else
	--	SetSpeakDetail( OwnerID() , "���Ѫ������٬O�t���o��h���U�l�ڡA�ݨӱo�����@�I���ɶ��L�o�B�z�F�C" )
	--end
end

function LuaS_110657()	-- ����ӤH�s��
	--if ( CheckCompleteQuest( OwnerID() , 420717 ) == true ) then	-- ���ȡG����״_
	--	SetSpeakDetail( OwnerID() , GetString("ST_NEW_08") )	-- �ڷǳƤF�@�ǤW�n����ҡB�֥�������A�A�n���n���[�ݬݡH\n\n�Y�O�A�Q�n����B�k�T�����㪺�ܡA�i�H��ڪ��d�l�����A�o�N�b�ڪ����ǡA�ڭ̷P���ܦn���
	--	AddSpeakOption( OwnerID() , TargetID() , GetString("SO_OPENSHOP") , "LuaS_110657_OpenShop" , 0 )	-- �W�[�@�ӿﶵ�G�}�Ұө�
	--elseif ( CheckAcceptQuest( OwnerID() , 420717 ) == true or CheckCompleteQuest( OwnerID() , 420717 ) == true ) then	-- ���ȡG�V���_�s�A���~�G�²ʥ���
		LoadQuestOption( OwnerID() )	--���J���ȼҪO
		--SetSpeakDetail( OwnerID() , "�Ť�Ŷ��������ʥ���H\n\n���ڬݬݡA�p�G�O���Ӱ��D�A�ڤ@�w�i�H�צn�C" )
		--AddSpeakOption( OwnerID() , TargetID() , GetString("SO_110657_YES") , "LuaS_110657_Yes" , 0 )	-- �W�[�@�ӿﶵ�G�n���A�ЧA���ڭײz�ݬ�
	--else
	--	SetSpeakDetail( OwnerID() , GetString("ST_NEW_08") )	-- �ڷǳƤF�@�ǤW�n����ҡB�֥�������A�A�n���n���[�ݬݡH\n\n�Y�O�A�Q�n����B�k�T�����㪺�ܡA�i�H��ڪ��d�l�����A�o�N�b�ڪ����ǡA�ڭ̷P���ܦn���
		AddSpeakOption( OwnerID() , TargetID() , GetString("SO_OPENSHOP") , "LuaS_110657_OpenShop" , 0 )	-- �W�[�@�ӿﶵ�G�}�Ұө�
	--end
end
function LuaS_110657_OpenShop()	-- ����ӤH�s���@��}�ө�
	CloseSpeak( OwnerID() )			-- ������ܵ���
	OpenShop()				-- ���}�ө�
end
function LuaS_110657_Yes()	-- ����ӤH�s��
	SetFlag( TargetID() , 540807 , 1 )		-- �״_�n�ʥ��窺�Ť�Ŷ�
	--DelBodyItem ( OwnerID() , 201287 , 1 )	-- �²ʥ���
	GiveBodyItemEx( TargetID() , 220098 ,  1 , 1 , 0 ,0 ,0 , 0 , 0 )	-- ���@�}���ʥ���
	--SetSpeakDetail( OwnerID() , "�G�M�O�]���Ť�V�áA�~�ɭP�Ť�Ŷ������A�ڤw�g���A�צn�F�C\n\n���L�A�A�̦n�٬O���֥h��Ť�ӤH�i�S���͡A�R�ӲŤ��^�O�i�h�A��������Ť�Ŷ�í�w�U�ӡC" )
end

function LuaS_110656()	-- ����ӤH����
	--if ( CheckAcceptQuest( OwnerID() , 420619 ) == true and CountBodyItem( OwnerID() , 201288 ) < 1 ) then	-- ���ȡG�ǹF�R�N�A���~�G���Ŧ����
	--	SetSpeakDetail( OwnerID() , "�̮�q�s�������ڡA���W�ڤ~�谵�n�O�I\n\n�L�o���O�R�W�ǰe�v�J�Q���ŬO�a�A���O�ڦb���A�L�`�O���ۨ�A���k�ʦ��S�O�����R�K�٦��ڡA�L�����򤣯�M���@�I�A�N���ڸ�ڪ��V�Ҥ@�ˡK�ڡI�藍�_�A����ȤH���Ʊ��ڤ����ӳo���誺�C\n\n�ӡA�ڧ�̮�q�s�������浹�A�C" )
	--	AddSpeakOption( OwnerID() , TargetID() , "�n���A�ڷ|�t�d�N�����e�L�h���̮�" , "LuaS_110656_Yes" , 0 )	-- �W�[�@�ӿﶵ�G�n���A�ڷ|�t�d�N�����e�L�h���̮�
	--else
		SetSpeakDetail( OwnerID() , GetString("ST_NEW_18") )	-- �ڷǳƤF�@�ǽ�a�ӽo������B�k�T������A�n���n�H�K�ѦҬݬݡH\n\n�Y�O�A�Q�n��ҡB�֥������㪺�ܡA�i�H��ڪ��V�Ҥs���A�L�N�b�ڪ����ǡA�ڭ̷P���ܦn���
		AddSpeakOption( OwnerID() , TargetID() , GetString("SO_OPENSHOP") , "LuaS_110656_OpenShop" , 0 )	-- �W�[�@�ӿﶵ�G�}�Ұө�
	--end
end
function LuaS_110656_OpenShop()	-- ����ӤH�����@��}�ө�
	CloseSpeak( OwnerID() )			-- ������ܵ���
	OpenShop()				-- ���}�ө�
end
function LuaS_110656_Yes()	-- ����ӤH����
	CloseSpeak( OwnerID() )			-- ������ܵ���
	GiveBodyItem ( OwnerID() , 201288 , 1 )	-- ���Ŧ����
	-- Say( TargetID() , "�·ЧA�F�I�t�~�A�p�G�n�R�ҫ`�B�k�T�A�Шӧڭ̤Ұ����ө���I" )
end

function LuaQ_420674_Complete()	-- ��������ɥR���q
	CastSpell( TargetID() , TargetID() , 491010 )
	ScriptMessage( TargetID(), TargetID(), 2, GetString("MSG_GET_MINE_1"), C_SYSTEM );--�e�������T���G�A�w���o���q�Ǯ{���
	ScriptMessage( TargetID(), TargetID(), 0, GetString("MSG_GET_MINE_1_D"), "0xFFFF8000");--�T�������T���G�A�w���o���q�Ǯ{���A���q���ŤW����20�šC
	ScriptMessage( TargetID(), TargetID(), 0, GetString("MSG_GET_FORMULA_MINE_1"), C_YELLOW);--�T�������T���G�A�w�߱o�u�t��-���ɬ�v�C
	return true
end
function LuaQ_420673_Complete()	-- ��������ɥR���
	CastSpell( TargetID() , TargetID() , 491010 )
	ScriptMessage( TargetID(), TargetID(), 2, GetString("MSG_GET_WOOD_1"), C_SYSTEM );--�e�������T���G�A�w���o��쪺�Ǯ{���
	ScriptMessage( TargetID(), TargetID(), 0, GetString("MSG_GET_WOOD_1_D"),"0xFFFF8000");--�T�������T���G�A�w���o��쪺�Ǯ{���A���q���ŤW����20�šC
	ScriptMessage( TargetID(), TargetID(), 0, GetString("MSG_GET_FORMULA_WOOD_1"), C_YELLOW);--�T�������T���G�A�w�߱o�u�t��-������v�C
	return true
end
function LuaQ_420672_Complete()	-- ��������ɥR����
	CastSpell( TargetID() , TargetID() , 491010 )
	ScriptMessage( TargetID(), TargetID(), 2, GetString("MSG_GET_HERB_1"), C_SYSTEM );--�e�������T���G�A�w���o���Ī��Ǯ{���
	ScriptMessage( TargetID(), TargetID(), 0, GetString("MSG_GET_HERB_1_D"), "0xFFFF8000");--�T�������T���G�A�w���o���Ī��Ǯ{���A���ĵ��ŤW����20�šC
	ScriptMessage( TargetID(), TargetID(), 0, GetString("MSG_GET_FORMULA_HERB_1"), C_YELLOW);--�T�������T���G�A�w�߱o�u�t��-�s�]������v�C
	return true
end

function AlreadySkillDePose()	-- �������ѳN
	if ( CheckFlag( TargetID() , 540002 ) == true ) then	-- ���n���~�G���ѳN
	else
		SetFlag( TargetID() , 540002 , 1 )
	end
end
