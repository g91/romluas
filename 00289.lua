function LuaS_110276_0()
	if CheckAcceptQuest(OwnerID(),420300) == true or CheckCompleteQuest(OwnerID(),420300) == true then
		LoadQuestOption( OwnerID() )
	elseif CountBodyItem( OwnerID(),200873 ) < 1 and CheckCompleteQuest( OwnerID() , 420299 ) == false then
		SetSpeakDetail( OwnerID(), GetString("ST_110276_1")   );
		--/*�ޡI�ޡI�ڦ��Ӧn�F��A�A���S������ڡH�]���ڤ@�ݨ�A�Nı�o�ܿˤ��A�ҥH�u�i�D�A��I
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110276_1") , "LuaS_110276_2", 0 ); 
		--/*���ӬݬݡC
--		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110276_0") , "LuaS_110276_EXIT", 0 );
		--/*�������
	else
		SetSpeakDetail( OwnerID(), GetString("ST_110276_2")   );
		--/*���٦��t�~�@�Ӧn�F��......�x�H�_�ǡA�ڬO�����̥h�F�H
--		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110276_0") , "LuaS_110276_EXIT", 0 );
		--/*�������
	end
end

function LuaS_110276_1()

	SetSpeakDetail( OwnerID(), GetString("ST_110276_0")   );
	--/*�ڳo�̦��@���_�͡A�O���e�ڭ̻P���Y�H����������ԮɡA
	--�ڱq�@�Ӥ��Y�H���W��쪺�C

	--�F�ѳo�O����N��ܡH
	--�N��o���_�ͬO���Y�H���_�͡A
	--���_�ͬO�ΨӰ����򪺩O�H�O�ΨӶ}�ꪺ�C
	--����O�ΨӰ����򪺩O�H�O���F�������n���F��Q��L�H�����C

	--���Y�H������F��ݭn��_�Ӫ��H
	--�Ať�L�����s�����_�öܡH
	--�o�_�ͤ@�w�O���Y�H�b�����s�����_�c���_�͡I

	--����i���ڭn���ȭn����A�ҥH����h�_�I�C
	--���L�ڬݧA���G������@���A�����w�A�ள�쨺���_�ó�I

	--���ӧڥ����10�ȡA���L�ڮ��Y��A���A�ͱ���3�ȴN�n�I
	--�p�G�A���n���ܧڴN���h��O�H�o�I���|���o�A�֨M�w�a�I
	
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110276_2") , "LuaS_110276_2", 0 ); 
		--/*���ڬݬ�
end

function LuaS_110276_2()
	CloseSpeak( OwnerID() ); 
	OpenShop()
end

function LuaSI_110276()
	SetShop( OwnerID() , 600077 , "Test_Shop_Close" );
end

function LuaS_110276_EXIT()

	CloseSpeak( OwnerID() );	--������ܵ���
end