function LuaS_110489_OpenShop()	-- �Ĥ��ӤH�ܤB�@��}�ө�
	CloseSpeak( OwnerID() )			-- ������ܵ���
	OpenShop()				-- ���}�ө�
end
function LuaS_110489_Complete()	-- �Ĥ��ӤH�ܤB
	-- CloseSpeak( OwnerID() )			-- ������ܵ���
	GiveBodyItem ( TargetID() , 221253 , 1 )	-- ���Ŧ����
	--Say( TargetID() , "���N�·ЧA���ڧ�o�~�X�n�Ĥ��e�L�h����Ťp�j�o�A���¡I" )
end

function LuaS_110073()	-- ��šA���Ш���ӤH��NPC
	--if ( CheckCompleteQuest( OwnerID() , 420700 ) == true ) then	-- ���ȡG�e������
		LoadQuestOption( OwnerID() )	--���J���ȼҪO
	--else
	--	SetSpeakDetail( OwnerID() , GetString("ST_NEW_07") )	-- �u�r�A�����F�A�����F�����F�K�A�n��p�y�j���H\n\n���U�A�n���n�A�ڭ��̬ݰ_�ӹ��j���H�I�ڲ{�b�ܦ��A�ЧA�O�ӥ��Z�ڦn���n�I\n\n�n���D�j���b���A�A�̦n�O�h�ݻE���e���f�������I
	--end
end

function LuaS_110073_Complete()	-- ���
	GiveBodyItem ( TargetID() , 201287 , 1 )	-- �¥���
	--Say( TargetID() , "���N�·ЧA���ڧ�o�~�X�n�Ĥ��e�L�h����Ťp�j�o�A���¡I" )
	--Say( OwnerID() , "��F�A���~�W�Y�����۪��~�����C" )
	--Sleep( 20 )
	--Say( OwnerID() , "���ɭԧA�i�H���}�I�]�ݬݡA���ӹ�A�H�᪺�ȵ{�|�ܦ����U�C" )
end

function LuaS_110076()	-- �մ��d�A���Щe�U�i�ܪO��NPC
	if ( CheckFlag( OwnerID() , 540804) == true ) then
		if ( CheckAcceptQuest( OwnerID() , 420457 ) == true ) or ( CheckAcceptQuest( OwnerID() , 420466 ) == true ) or ( CheckAcceptQuest( OwnerID() , 420467 ) == true ) then
			SetSpeakDetail( OwnerID() , GetString("ST_NEW_09") )	-- ��A�A�w�g���F�i�ܪO�W���e�U���ȤF�ڡK�u�F�`�I\n\n���򧹦����Ȫ��ܡA�N�i�H�o�줣�������ȳ��S�C\n\n�n�n�[�o�a�I
		else
			SetSpeakDetail( OwnerID() , GetString("ST_NEW_10") )	-- �A���ݨ�ګe���o�ӧi�ܪO�a�H\n\nť�����ɭԷ|�����񪺦���N�Q�n�e�U�O�H�N�����檺���ȶK�b�W���A�p�G�����ǤH�������Ȫ��ܡA�N�|�o�줣�������S�C\n\n�ڥ��ӬO�Q���ǥ������I�~�֪��A���L�ثe�K�b�W�������Ȥ��e��ڨӻ����ӧx���F�A�u�O�V�|�K\n\nť�p�y�������A����O�n�����������A�A�n���n���ӥ��ȸոլݡH
		end
	else
		SetSpeakDetail( OwnerID() , GetString("ST_NEW_11") )	-- �A���ݨ�ګe���o�ӧi�ܪO�a�H\n\nť�����ɭԷ|�����񪺦���N�Q�n�e�U�O�H�N�����檺���ȶK�b�W���A�p�G�����ǤH�������Ȫ��ܡA�N�|�o�줣�������S�C\n\n�ڥ��ӬO�Q�ݬݯण�౵�ǥ������I�~�֪��A���L�ثe�n���S���H�ݭn�e�U���ˤl�K
	end
end

function LuaS_110591_Intro()	-- �ǰe�v�J�Q����
	--local RND = Rand( 99 ) + 1	-- ���� 1~100 ���ü�
	--    if ( RND > 0 and RND <= 95 ) then
	--elseif ( RND > 95 and RND <= 100 ) then
	--	Say( TargetID() , GetString("ST_NEW_12") )	-- �A�n�A�ݭn���^�{�N���n�O�ܡH( ���v 1/20 )
	--end
end

function LuaS_110069()	-- �̮�A���жǰe�v��NPC
	--if ( CheckAcceptQuest( OwnerID() , 420619 ) == true ) then	-- ���ȡG�ǹF�R�N
	--	if ( CountBodyItem( OwnerID() , 201288 ) < 1 ) then	-- ���~�G���Ŧ����
	--		SetSpeakDetail( OwnerID() , "�A�{�ѪA�������Ӫ������ܡH\n\n�o�������D�`�륩�A�ҥH�ڽЦo�s�@�@�ƥi�H�f�t�J�Q���Ťp�j���Ŧ�A�˪��S�s�����A���ɶ��A�o���Ӥw�g�s�@�����F�C\n\n�c�K���ٷQ�b�J�Q���Ťp�j���Ǧh�ݤ@�U�A�A�i�H���ڥh���^�q�s��§���ܡH" )
	--	else
	--		SetSpeakDetail( OwnerID() , "���\�O�����A�s�@���i�u�륩�C\n\n�ڱo��Ӿ��|�e���J�Q���Ťp�j�A�n���o��گd�U�`�誺�L�H�A������o�n�O�ǰe�I���_�I�̹�b�Ӧh�F�K" )
	--	end
	--else
		SetSpeakDetail( OwnerID() , GetString("ST_NEW_13") )	-- �J�Q���Ťp�j�u�O�Ӭ��R�F�A���ڳ��ѤF�ڬO�ӧ�o���ǰe�N�n�O���K
	--end
end

function LuaS_110068()	-- ���R�A���Ф��y�޾ɭ���NPC
	if ( CheckCompleteQuest( OwnerID() , 420700 ) == true ) then
		--if ( CheckCompleteQuest( OwnerID() , 420077 ) == true ) then
		--	SetSpeakDetail( OwnerID() , "���§A���ڧ��ï]�A�u�n��L�H�]���ڧ�쪺�ܡA�N�i�H�ЪA�������Ӫ������n�n���ڭ׸ɦ^��ˤF�C\n\n���§A��I" )
		--elseif ( CheckAcceptQuest( OwnerID() , 420077 ) == true ) then
		--	LoadQuestOption( OwnerID() )	--���J���ȼҪO
		--	AddSpeakOption( OwnerID() , TargetID() ,  GetString("SO_110068_0") , "LuaS_110068_Detail" , 0 )		--�W�[�@�ӿﶵ�A���H���ߩ�
		--else
		--	LoadQuestOption( OwnerID() )	--���J���ȼҪO
		--end
		SetSpeakDetail( OwnerID() , GetString("ST_NEW_14") )	-- ���y�u�O�ӯ��_�������K
	else
		SetSpeakDetail( OwnerID() , GetString("ST_NEW_15") )	-- �A�n��ڤ��˹p�y�ܡH�L���ӴN�b�E���̪������s���C
	end
end

function LuaS_110490()	-- �Ť�ӤH�i�S
	LoadQuestOption( OwnerID() )	--���J���ȼҪO
	--if ( CheckFlag( OwnerID() , 540819 ) == true ) then	-- ���n���~�G�w��o����W���~�Ť�
	--else
	--	if ( CheckCompleteQuest( OwnerID() , 420719 ) == true ) then
	--		AddSpeakOption( OwnerID() , TargetID() , GetString("ST_NEW_16") , "LuaS_110490_GiveUnicon" , 0 )	-- �ڭn����^�O�Ť�W���~
	--	end
	--end
  	--AddSpeakOption( OwnerID() , TargetID() , GetString("SO_110490_1") , "LuaS_110490_OpenShop" , 0 )	-- �A�֦����ǲŤ�H
	AddSpeakOption( OwnerID() , TargetID() , GetString("SO_110490_2") , "LuaS_110490_2" , 0 )		-- ����O�Ť�H
	AddSpeakOption( OwnerID() , TargetID() , GetString("SO_110490_3") , "LuaS_110490_3" , 0 )		-- �ڮ���_�Ǫ��Ť�A���O�n�F�����H
end
function LuaS_110490_OpenShop()	-- �Ť�ӤH�i�S�@��}�ө�
	CloseSpeak( OwnerID() )			-- ������ܵ���
	OpenShop()				-- ���}�ө�
end
function LuaS_110490_2()	-- �Ť�ӤH�i�S�о�
	SetSpeakDetail( OwnerID() , GetString("ST_110490_2") )					-- �Ť�i�H���O�c���o�@�ɪ������A�Ӥ@��ڭ̩Ҩ���۶������Ť�A�h�O�@�زŤ媺������C/n���P���Ť�۶��B�Ϊ��a�褣�P�A�]�|�a�Ӥ��P���O�q�C
	AddSpeakOption( OwnerID() , TargetID() , GetString("SO_LOOKOTHER") , "LuaS_110490" , 0 )	-- �ݬݨ�L����
end
function LuaS_110490_3()	-- �Ť�ӤH�i�S
	SetSpeakDetail( OwnerID() , GetString("ST_110490_3") )					-- �A�i�H�ݬݲŤ媺�����A�A���쪺���ӬO�Ͳ��Ť�A�o�ǲŤ�b��᪺�Ͳ����ʤ����ܭ��n���a��A�i�H���O�d�_�ӡF/n�p�G�A�O����Z���Ť�A�����ߧA�I���A�Y����㦳�Ť�Ŷ����Z���A�N�i�H��o�Z���Ť��^�O�i�h�A�W�[�A�Z������O�F/n�p�G�A�O�����Y���B�W���ΤU���Ť�A�P�˦a�i�H�^�O�J�㦳�Ť�Ŷ����˳ơC
	AddSpeakOption( OwnerID() , TargetID() , GetString("SO_LOOKOTHER") , "LuaS_110490" , 0 )	-- �ݬݨ�L����
end

function LuaS_110490_GiveUnicon()	-- �Ť�ӤH�i�S�e�W���~
	CloseSpeak( OwnerID() )			-- ������ܵ���
	Say( TargetID() , GetString("ST_NEW_17") )	-- ���§A���ڰe�L�h�A�o�O�������A�^�O�Ť�W���~�C
	SetFlag( OwnerID() , 540819 , 1 )
	GiveBodyItem ( OwnerID() , 520911 , 1 )	-- �W���~
end

