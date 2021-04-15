function LuaS_112621_0() --�n������NPC 112621 ���¡D�����y �ҪO����ܼ@�����禡�A��ܼ@����OwnerID()�O���a�ATargetID()�ONPC

	LoadQuestOption( OwnerID() ) --���J���� NPC ���ҪO��T(���o�@�q�~�|�X�{���ȥH�μҪO�����@���ܤ��e)

	if CheckAcceptQuest( OwnerID() , 422185 ) == true then --�ˬd�O�_�w�g���F���� 422185 �j�ǳ��P����
		AddSpeakOption( OwnerID(), TargetID(),  "[SC_112621_0]", "LuaS_112621_1",0 ); --���͹�ܿﶵ�A���F�H�����禡 LuaS_112621_1
		--/*��ܿ�ܡG�]ť�Ѻ������z�����F�����L�h���G�ơ^
	end

	if CheckAcceptQuest( OwnerID() , 422188 ) == true then --�ˬd�O�_�w�g���F����
		AddSpeakOption( OwnerID(), TargetID(),  "[SC_112621_2]", "LuaS_112621_2",0 ); --/*�ڷQ�V�z�б�����@�إs�������ɪ��������Ʊ�
	end

	if CheckAcceptQuest( OwnerID() , 422192 ) == true then --�ˬd�O�_�w�g���F���� 
		AddSpeakOption( OwnerID(), TargetID(),  "[SC_112621_4]", "LuaS_112621_3",0 ); --/*ť�Ѻ��Ү���?�����y���z�����F���ҭ̪��ǻ�
	end
	if CheckAcceptQuest( OwnerID() , 422196) == true and CheckFlag( OwnerID() , 542507 ) == false then --�ˬd�O�_�w�g���F���ȨåB�S���o��X�� 542507 �L 
		AddSpeakOption( OwnerID(), TargetID(),  "[SC_112621_6]", "LuaS_112621_4",0 ); --/*�A�Ҽ{�F�@�U�A�M�w�i�D�L�����Q�}�a���u��
		AddSpeakOption( OwnerID(), TargetID(),  "[SC_112621_7]", "LuaS_112621_5",0 ); --/*�A�M�F�M���V�A�M�w�յۻ��A�L���ܤU���~�s
	end
	--/*�w�]�N�����}��ܿﶵ
end

function LuaS_112621_1() --�ﶵ���U�h����n���檺�禡�A�Q��ܿﶵ�I�s���禡 OwnerID()�O���a�ATargetID()�ONPC

	SetSpeakDetail( OwnerID(), "[SC_112621_1]" ) --���ͦ�����ܤ��e���禡
	--/*��~�A���F�������Y�@�Ӻ��ҡF�Ĥ@���b���̵o�{�o�Ǥj�ǳ��]�|���۳����M���e�쳽���ɭ�......�]�H�U���^

	SetFlag( OwnerID() , 542504 , 1 ) --���}���n�X��542504�A 0 �O���� �A 1 �O���}�A�u�n�@���}�����N�|����

	AddSpeakOption( OwnerID(), TargetID(),  "[SO_BACK]", "LuaS_112621_0",0 ); --���ͤ@�ӿﶵ�A���F�������禡 LuaS_112621_0
	--/*��^�W�@��
end

function LuaS_112621_2() 
	SetSpeakDetail( OwnerID(), "[SC_112621_3]" ) --/*�����H�������I�ڨSť���a�H���M���H�Ⱘ���ɷ������H......�]�H�U���^
	SetFlag( OwnerID() , 542505 , 1 ) --���}���n�X��
	AddSpeakOption( OwnerID(), TargetID(),  "[SO_BACK]", "LuaS_112621_0",0 ); --/*��^�W�@��
end

function LuaS_112621_3() 
	SetSpeakDetail( OwnerID(), "[SC_112621_5]" ) --/*����o�Ӷǻ��A�i�O�q�ܦ����e�N�y�ǤU�Ӫ�......�]�H�U���^
	SetFlag( OwnerID() , 542506, 1 ) --���}���n�X��
	AddSpeakOption( OwnerID(), TargetID(),  "[SO_BACK]", "LuaS_112621_0",0 ); --/*��^�W�@��
end

function LuaS_112621_4() 
	SetSpeakDetail( OwnerID(), "[SC_112621_8]" ) --/*�]�A�N��D��}�a�H�γ��Ԫ��W�J���i�D�F�o�ӦѺ��ҡA�o�ӦѤH�R�R��ť���A���ԭz��A�I�q�F�\�[�^......�]�H�U���^
	SetFlag( OwnerID() , 542507, 1 ) --���}���n�X��
	AddSpeakOption( OwnerID(), TargetID(),  "[SO_BACK]", "LuaS_112621_0",0 ); --/*��^�W�@��
end

function LuaS_112621_5() 
	SetSpeakDetail( OwnerID(), "[SC_112621_9]" ) --/*�]�Ѻ��ҥΥL�����w���ګo���M�ẫ���Ų����n�ۧA�A�R�Rť�ۧA���A�L���ܤU���~�s�������A���M�A�L�o�X�@�}�n�Ԫ����n�^......�]�H�U���^
	SetFlag( OwnerID() , 542507, 1 ) --���}���n�X��
	AddSpeakOption( OwnerID(), TargetID(),  "[SO_BACK]", "LuaS_112621_0",0 ) --/*��^�W�@��
end

--�_�������e
function LuaI_204322_Quest() --���~����� Server �ݼ@���A��禡�W�ٶ�b�ϥήĪG����줺
	ClearBorder( OwnerID());	--��l�ƥ۸O����
	AddBorderPage( OwnerID(), GetQuestDetail( 422220, 1 )) --�W�[�@���۸O�A���e�O���ۥ��� 422220 �����ȱԭz
	local str = "["..GetUseItemGUID(OwnerID()).."]"
	ShowBorder( OwnerID(), 422220,str , "ScriptBorder_Texture_Paper" )	 --�]�w�۸O��L����
end