function LuaS_110266_0()
	
	SetSpeakDetail( OwnerID(), GetString("ST_110266_0")   );	--/*�w����{�A�ڤڮ��Ҫ������i�V�z�O�ҡA�O�����ҥ�������̭ȱo�������C	--/*�ݱz�O�n�b���ҤW�Ϊ����[�W���O�A�٬O�Q���Ӻ�o�������H
	if CountBodyItem( OwnerID() , 200992 ) > 1 then
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110266_1") , "LuaS_110266_1", 0 ); 		--/*�d�����D���X�i�D�ڧA�i�H���ڧ�쬣�S�D���X�C
	end
	if CheckAcceptQuest( OwnerID() , 420288 ) == true and CountBodyItem( OwnerID() , 200739 ) > 0 then
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110266_2") , "LuaS_110266_2", 0 ); 		--/*�L���������ЧڨӰݧA�������D�o�Ӱ����|�O���@�W���K�Ұ����H
	end		
	--AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110266_0") , "LuaS_110266_EXIT", 0 );	--/*�������
end

function LuaS_110266_1()
	SetSpeakDetail( OwnerID(), GetString("ST_110266_1")   );
	--/*��H�A�O�ӧ䬣�S���Ѥp�l���ڡH���D�ڡI�ڪ��D�L�]�h���̤F�A�N�O�����ڡI
	--/*�A���D�����a�H������᭱���@�j���N�O�����F�A�����I�b�̭���H�i���e���O�I
	--/*�ڴN�A�i�D�A�ԲӤ@�I�n�F�A���S���n�h�H�]����M�s�����ơA�p�G�L�����B�A�γ\�w�g�쨺�̤F�C
	--/*�p�G�A��쪺�O�L������A�O�ˤߡA�����M���|�s�@�Z�ҡA�����ݤu���ڥi�O�ܦb�檺�I�ڥi�H�ЧA�@�ǡA��������
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110266_0") , "LuaS_110266_EXIT", 0 );
	--/*�������
end	

function LuaS_110266_2()
	SetSpeakDetail( OwnerID(), GetString("ST_110266_2") );	--/*�x�H�L���������n�ݳo�������O�ְ����H
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110266_3") , "LuaS_110266_3", 0 );	--/*�O���C
end

function LuaS_110266_3()
	SetSpeakDetail( OwnerID(), GetString("ST_110266_3") );	--/*�����H�N�b�A���e�ڡI
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110266_4") , "LuaS_110266_4", 0 );	--/*�O�A�����H
end	

function LuaS_110266_4()
	SetSpeakDetail( OwnerID(), GetString("ST_110266_4") );	--/*�O�ڡI�O�w����v�|�Ӥ뤧�e�Чڰ����F�L���L���@�ӱw�̭n�e���Z��ǵ����A�Ʊ氵�@�ư����B���L�E���������A��ɧ��ٮ���@�j�����A�Q�n�D���X�̦n�̬��������C
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110266_5") , "LuaS_110266_5", 0 );	--/*�A�T�w�H
end

function LuaS_110266_5()
	SetSpeakDetail( OwnerID(), GetString("ST_110266_5") );	--/*�ڰO�o�ܲM���A�o�Ӱ����i�O�ڦۻ����ּƳǧ@���@�ڡI
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110266_6") , "LuaS_110266_6", 0 );	--/*���A�ٰO�o���Ӹ˰������H�O�ֶܡH
end

function LuaS_110266_6()
	SetSpeakDetail( OwnerID(), GetString("ST_110266_6") );	--/*�O�o�ڡI�ڬQ���٬ݨ�L�A�N�O�j�I���d���ե��͡F���L�A�̬O���q�d���ե��ͪ��f������o�Ӱ������H
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110266_7") , "LuaS_110266_7", 0 );	--/*�o�Ӱ����O���d���ե��Ͱ����H
end

function LuaS_110266_7()
	SetSpeakDetail( OwnerID(), GetString("ST_110266_7") );	--/*�O�ڡI�쩳���F�H
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110266_8") , "LuaS_110266_8", 0 );	--/*�S�ơA���§A���X�@�C
end

function LuaS_110266_8()
	CloseSpeak( OwnerID() );	--������ܵ���
	SetFlag( OwnerID() , 540208 , 1 )
end	

function LuaS_110266_EXIT()
	CloseSpeak( OwnerID() );	--������ܵ���
end