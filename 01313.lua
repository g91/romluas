function LuaS_112627_0() --��ù�D�Ǻ��˹�ܼ@��

	LoadQuestOption( OwnerID() ) --���J����NPC�ҪO���e
	if CheckAcceptQuest( OwnerID() , 422206) == true and CountBodyItem(OwnerID() , 204328 ) < 1 then --�ˬd�O�_�w�g���F���� 422206 �A�åB���W�S�� 204328 ���b����
		AddSpeakOption( OwnerID(), TargetID(),  "[SC_112627_0]", "LuaS_112627_1",0 )	--/*�n�J���b����
	end

end

function LuaS_112627_1() --��ù�D�Ǻ��˹�ܼ@��
	SetSpeakDetail( OwnerID(), "[SC_112627_1]" ) --/*���ܡH�ڳo�̭�n���@�J�A���L......�][112627]��[112632]����V�ݤF�@���^�n�a�I�o�J���A�N���h�a�I
	GiveBodyItem( OwnerID() , 204328 , 1 ) --��OwnerID 204328 �@��
	AddSpeakOption( OwnerID(), TargetID(),  "[SO_BACK]", "LuaS_112627_0",0 ); --/*��^�W�@��
end

function LuaS_112701_0() --��D�Ժ�����ܼ@��

	LoadQuestOption( OwnerID() ) --���J����NPC�ҪO���e
	if CheckAcceptQuest( OwnerID() , 422206) == true and CountBodyItem(OwnerID() , 204328 ) < 1 then --�ˬd�O�_�w�g���F���� 422206 �A�åB���W�S�� 204328 ���b����
		AddSpeakOption( OwnerID(), TargetID(),  "[SC_112627_0]", "LuaS_112701_1",0 )	--/*�n�J���b����
	end

end

function LuaS_112701_1() --��D�Ժ�����ܼ@��
	SetSpeakDetail( OwnerID(), "[SC_112701_0]" ) --/*���b�����H�o���񦳴򦳪e���h�A�A�N�O�S���i�H�����ӶQ�ڳܪ�"���b����" �C
	AddSpeakOption( OwnerID(), TargetID(),  "[SO_BACK]", "LuaS_112701_0",0 ); --/*��^�W�@��
end

function LuaS_112702_0() --�d���J�D�����ܼ@��

	LoadQuestOption( OwnerID() ) --���J����NPC�ҪO���e
	if CheckAcceptQuest( OwnerID() , 422206) == true and CountBodyItem(OwnerID() , 204328 ) < 1 then --�ˬd�O�_�w�g���F���� 422206 �A�åB���W�S�� 204328 ���b����
		AddSpeakOption( OwnerID(), TargetID(),  "[SC_112627_0]", "LuaS_112702_1",0 )	--/*�n�J���b����
	end

end

function LuaS_112702_1() --�d���J�D�����ܼ@��
	SetSpeakDetail( OwnerID(), "[SC_112702_0]" ) --/*�c....���H�c�I���@����.....�ڰ��W���X�ӵ��A.....
	AddSpeakOption( OwnerID(), TargetID(),  "[SO_BACK]", "LuaS_112702_0",0 ); --/*��^�W�@��
end

function LuaQ_422207_AfterClick() --���i���h�L�H�I����Ĳ�o�@��
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422207_0]" , 0 ) --/*��ܮ���ܰT���G�A�o�{�F�@��ݯʤ������h�L����......
	return true 	--�^�� true �H��o���~
end

function LuaQ_422208_AfterClick() --��X����
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422208_0]" , 0 ) --/*��ܮ���ܰT���G�A�o�{�@�ǥ��j���}�L�A�ǥ��[��......
	return true	--�^�� true �H��o���~
end

function LuaQ_422215_Complete() --422215 �������ȫ���檺Script ,OwnerID() �O�^���Ȫ����� �ATargetID() �O���a
	DisableQuest( OwnerID() , true)--���� OwnerID() �����ȼҦ�
	Hide( OwnerID() ) --�� OwnerID() ����
	local NPC = LuaFunc_CreateObjByObj( 112634 , OwnerID() ) --�b OwnerID() ����m���ͪ��� 112634 ��w�D����  
	MoveToFlagEnabled( NPC , false ) --���� NPC ���t�α���ʪ��\��A�קK�t�η|�b NPC ���}�X���I�ӻ����ɭԤU�O NPC �]�^�X���I
	WriteRoleValue( NPC , EM_RoleValue_IsWalk , 0 ) --�]�w NPC �����ʬO�ζ]��
	AdjustFaceDir( NPC , TargetID(), 0 ) --�� NPC ���� TargetID() ( �ĤT�ӰѼƬ��઺���סA���V�ؼЬ� 0 �� )
	sleep( 20 ) --���� 3.0 ���� NPC �����X�{
	PlayMotion( NPC , ruFUSION_ACTORSTATE_EMOTE_CRY ) --NPC ��������ʧ@
	Say( NPC , "[SC_112634_0]" ) --/*NPC���ܡG�����ڤ��O�b�@�ڧa�I�ӷP�§A�F�A���ͤH�A�ڭn���W���}�o�Ӱ��a��A����ɵ��٬O�l�諸�Ƨڳ����ޤF�A�ڥu�Q�^�a�h�I
	sleep( 30 ) --���� 3.0 �����ʧ@���񧹲�
	Move( NPC , 14300 , -83 , 25995 ) --�R�O NPC ���ʨ�T�w�I�]�|�M����|�A���F��w�I�e���i�����L�R�O�^
	sleep( 100 ) --���� 10.0 ��
	DelObj( NPC ) --�R�� NPC
	sleep(150) --���� 15.0 ��
	Show( OwnerID() , 0 ) --�� OwnerID() �X�{
	DisableQuest( OwnerID() , false) --�}�� OwnerID() �����ȼҦ�
end