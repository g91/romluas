function LuaS_110262_0()
	--local n = 0
	--if CheckAcceptQuest( OwnerID() , 420285 ) then n = n + 1 end
	--if CheckAcceptQuest( OwnerID() , 420286 ) then n = n + 1 end
	--if CheckCompleteQuest( OwnerID() , 420285 ) then n = n + 1 end
	--if CheckCompleteQuest( OwnerID() , 420286 ) then n = 0 end

	if CheckAcceptQuest( OwnerID() , 420289 ) == true then
		if CountBodyItem( OwnerID() , 200691 ) > 0 then
			SetSpeakDetail( OwnerID(), GetString("ST_110262_0") );		--/*......�ڤ@�ͳ��ڷQ�۵o�j�]�A���ڳ̵h�W���ɭԳ��M�O�ڱo��o�ǰ]�I���ɭԡA�ӧڳ̻��P���ɭԫo�O��ڥ��h���̪��ɭ�......	--/*�u�O�ب�A���O�ܡH	
		elseif CountBodyItem( OwnerID() , 200691 ) == 0 and CountBodyItem( OwnerID() , 200739 ) > 0 then
			SetSpeakDetail( OwnerID(), GetString("ST_110262_10") );		--/*���ˡH���Ӱ���F�ܡH
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110262_2") , "LuaS_110262_2", 0 ); 		--/*���󨺭Ӱ���ڦ��@�ǨƱ��Q�ݧA�A�d���ե��͡C
		end
	elseif CheckCompleteQuest( OwnerID() , 420289 ) == true then
		SetSpeakDetail( OwnerID(), GetString("ST_110262_0") );		--/*......�ڤ@�ͳ��ڷQ�۵o�j�]�A���ڳ̵h�W���ɭԳ��M�O�ڱo��o�ǰ]�I���ɭԡA�ӧڳ̻��P���ɭԫo�O��ڥ��h���̪��ɭ�......	--/*�u�O�ب�A���O�ܡH	
	else
		LoadQuestOption( OwnerID() )
	end

	--if n > 0 and CountBodyItem( OwnerID() , 200909 ) == 0 then
	--	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110262_1") , "LuaS_110262_1", 0 ); 		--/*�_�ͤ����F
	--	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110262_0") , "LuaS_110262_EXIT", 0 );		--/*�������
	--end

end

function LuaS_110262_1()

	SetSpeakDetail( OwnerID(), GetString("ST_110262_1") );	--/*�A�u�O���p�ߡI���n�ߨ��_�ͪ��H�����٧ڤF�A�֧֧֡I���F�_�ͫỰ�����ڧ�Ʊ��B�z���I
	GiveBodyItem( OwnerID() , 200909 , 1 )
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110262_0") , "LuaS_110262_EXIT", 0 );	--/*�������

end	

function LuaS_110262_2()
	SetSpeakDetail( OwnerID(), GetString("ST_110262_2")   );	--/*�ڬO�ЧA�ӻ�������I�ڤ��O���L�F�ܡH�L�ץΥ����k���i�H�A�٦�����n�ݪ��I
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110262_3") , "LuaS_110262_3", 0 );	--/*�O���A���L�کM���Ӱ��Ĳ��A�o�{�@�Ǻ��I�A�ҥH�~�ӧ�d���ե��ͱz�C
end

function LuaS_110262_3()
	SetSpeakDetail( OwnerID(), GetString("ST_110262_3") );	--/*�O�ܡH�n�a�I�A�ݧa�I���L�ڥ����b�e�Y�A�ڹ墨�Ӱ���@�L�Ҫ��C
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110262_4") , "LuaS_110262_4", 0 );	--/*�ڸ򨺭Ӱ��Ĳ����A�ھڨ��Ӱ���z�S���T�����F�@�����K�K
end	

function LuaS_110262_4()
	SetSpeakDetail( OwnerID(), GetString("ST_110262_4") );	--/*�u�O���ưڡI���L�O���O�⨺�ӫ���w������L�N�|�w���H���ڵ��A�@�����A�A���֧�o��ƿ�n�C
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110262_5") , "LuaS_110262_5", 0 );	--/*���L�ڦb������騭�W�o�{�ݩ�d���ե��ͱz���F��C
end

function LuaS_110262_5()
	SetSpeakDetail( OwnerID(), GetString("ST_110262_5")   );	--/*����H���騭�W���ݩ�ڪ��F��H
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110262_6") , "LuaS_110262_6", 0 );	--/*�O���A�N�O�o�ư����A�g�L�ڮ��Ҫ������A�o�O�L�|�Ӥ�e���w����ͩҰU���z�@���C
end

function LuaS_110262_6()
	SetSpeakDetail( OwnerID(), GetString("ST_110262_6") );	--/*�]�y��a�ա^���K�K�����K�K�H�d���K�K�ڦ��˳o�ذ����K�K�H
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110262_7") , "LuaS_110262_7", 0 );	--/*�o�N�O�ڧƱ�z����ڸѨM�����I�A���󹳳o�ظ˦b����W���F��A�|�X�{�b�t�~�@�H������W�C
end

function LuaS_110262_7()
	SetSpeakDetail( OwnerID(), GetString("ST_110262_7") );	--/*��Ө��Ӱ���K�K�O�d���ե��͡K�K�H
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110262_8") , "LuaS_110262_8", 0 );	--/*�ڧƱ�A������o�y�ܪ��N��C
end

function LuaS_110262_8()

	SetSpeakDetail( OwnerID(), GetString("ST_110262_8") );	--/*�K�K�n�a�I�ڷQ�A�|�o�˰l�ݡA�@�w�O�L�����������Ӥw�g���D���Ʊ��F�A�ڴN�����եժ���@�����X�ӧa�I
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110262_9") , "LuaS_110262_9", 0 );	--/*�������N�ڧ�o�ǹ�ܵ��O�U�ӡH

end	

function LuaS_110262_9()

	SetSpeakDetail( OwnerID(), GetString("ST_110262_9") );	--/*�{�b�ڥu�����N��A���ӨS��k�ڵ��C
	--�ڷQ�A���Ӥ]�q��F�A�ڤ��O�u�����d���ե��͡A���L�ڤ]�S�`���d���ե��͡C

	--�ڥ��ӬO�q�J�|�}�ȨӪ��Ȧ�̡A�~����n�I�W�d���ե��ͳQ�j�s���A�ڥX��ϤF�L�F
	--��ɸI���ɧ��~�F�@�j���A�]���ڭ̨�Ӫ����ܹ��A�L�]�ܰ�����J��ڡA
	--�L���ۤv���`�����w��B�͡A�ݨ�ګo���ݨ���x���ˤH�@��A��O�K�ܧڦP��C

	--���N�b���񫢬��ҥ�������ɭԡA�L�]���Q�j�s��˪��ˤf�c�ƦӼ��šA
	--�ڷ�ɬ�M�ߥʹc���A�Q���d���ե��ʹ��i�D�ڥL�b�����ҥ�����S���ˤH�B�B�ͤ]�֡A
	--�Ӳ{�b�d���ե��ͦ��`���ƤS�u���ڪ��D�A�p�G�گ���̵۩M�d���ե��ͬ۹����o�i�y�A
	--�����w���F�L�Ҧ��H�A�o��d���ե��ͪ��]���F
	--�ҥH�ڴN���N�d���ե��ͮI���A�Ƹ˦��d���ե��ͪ��ˤl�^�쫢���ҡC

	--�S�Q���h�i���ɩФl�N�Q����ҫI�Z�A�@����{�b���٥������@�]�n�v�K�K
	--���L�������X�Ӥ���Pı���P�h�F�C

	--�ЧA�i�D�L���������A�ڷ|�b�o�̵��ݧ����o���B�m���C
	
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110262_10") , "LuaS_110262_EXIT", 0 );	--/*���§A���X�@�C
	GiveBodyItem( OwnerID() , 200691 , 1 )

end

function LuaS_110262_EXIT()
	CloseSpeak( OwnerID() );	--������ܵ���
end
