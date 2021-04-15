function LuaS_110016_0()

	if CheckCompleteQuest( OwnerID(), 420416 ) == true then 
		SetSpeakDetail( OwnerID(), GetString("ST_110016_0")   ); --/*�h���U�쪺�^�m�A�Z��R�����~��p�����R�A�æz�ߤ��n�C
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110016_EXIT") , "LuaS_110016_EXIT", 0 ); --/*�������		
	else
		LoadQuestOption( OwnerID() );	--���J����
		if CheckAcceptQuest( OwnerID(), 420208 ) == true or CheckAcceptQuest( OwnerID(), 420413 ) == true or CheckAcceptQuest( OwnerID(), 420414 ) == true then 
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110016_1") , "LuaS_110016_1", 0 ) --/*�p����o�ɿ��H
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110016_2") , "LuaS_110016_2", 0 ) --/*�p����o�w����H
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110016_3") , "LuaS_110016_3", 0 ) --/*�p����o�W���ġH

		elseif CheckAcceptQuest( OwnerID(), 420209 ) == true or CheckAcceptQuest( OwnerID(), 420415 ) == true or CheckAcceptQuest( OwnerID(), 420416 ) == true then
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110016_4") , "LuaS_110016_4", 0 ) --/*�p����o�K���H
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110016_5") , "LuaS_110016_5", 0 ) --/*�p����o������H
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110016_6") , "LuaS_110016_6", 0 ) --/*�p����o�D�ï����H
		end
	end

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110016_1()

	SetSpeakDetail( OwnerID(), GetString("ST_110016_1")   );
	--/*�A�������쫰�����u¾�~�u�|�v�h���q�u�u�Y�ڸ��S�ǲ߫��q�A�åB��u��Хh�R��Q�r��A�M��N�i�H�쳥�~�h�M������q
	--  �F�C���o�����q��A�^�쫰������m�Υh�i���m�A�N�i�H�o��ɿ��C
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110016_RETURN"), "LuaS_110016_0", 0 ); --/*���٦���L���D�C
--	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110016_EXIT") , "LuaS_110016_EXIT", 0 ); --/*�������

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110016_2()

	SetSpeakDetail( OwnerID(), GetString("ST_110016_2")   );
	--/*�A�������쫰�����u¾�~�u�|�v�h�����Z����ǲߥ��A�åB��u��Хh�R�����A�M��쳥�~�h�M��A�X�����[�H
	--  ���A���o��i��A�^�쫰������m�Υh�i���m�A�N�i�H�o��w����C
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110016_RETURN"), "LuaS_110016_0", 0 ); --/*���٦���L���D�C
--	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110016_EXIT") , "LuaS_110016_EXIT", 0 ); --/*�������

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110016_3()

	SetSpeakDetail( OwnerID(), GetString("ST_110016_3")   );
	--/*�A�������쫰�����u¾�~�u�|�v�h����Įv�R��ǲ߱��ġA�åB��u��Хh�R���ľS�A�M��쳥�~�h�M������O�A�ѯ����O��
	--  �o�W�����A�^�쫰������m�Υh�i���m�A�N�i�H�o��W���ġC
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110016_RETURN"), "LuaS_110016_0", 0 ); --/*���٦���L���D�C
--	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110016_EXIT") , "LuaS_110016_EXIT", 0 ); --/*�������

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110016_4()

	SetSpeakDetail( OwnerID(), GetString("ST_110016_4")   );
	--/*�V�����u¾�~�u�|�v���q�u�u�Y�ڸ��S�ǲߨ���q��A�ñN���q�ޯണ�ɨ�u�K�A�N�i�H�Ķ��쨪�K�q�C���o���K�q��A�^�쫰
	--  ������m�Υh�i���m�A�N�i�H�o���K���C
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110016_RETURN"), "LuaS_110016_0", 0 ); --/*���٦���L���D�C
--	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110016_EXIT") , "LuaS_110016_EXIT", 0 ); --/*�������

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110016_5()

	SetSpeakDetail( OwnerID(), GetString("ST_110016_5")   );
	--/*�V�����u¾�~�u�|�v������Z����ǲߥ���A�ñN���ޯണ�ɨ�u�K�A�N�i�b�@�ǥ���I���췬��A�A�^�쫰��
	--  ����m�Υh�i���m�A�N�i�H�o�췬����C
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110016_RETURN"), "LuaS_110016_0", 0 ); --/*���٦���L���D�C
--	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110016_EXIT") , "LuaS_110016_EXIT", 0 ); --/*�������

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110016_6()

	SetSpeakDetail( OwnerID(), GetString("ST_110016_6")   );
	--/*�V�����u¾�~�u�|�v�����Įv�R��ǲ߱��ġA�åB�N���ħޯണ�ɨ�u�K�A�N�i�H�b���������O�Ĩ���D�îڡA�A�^�쫰������
	--  �m�Υh�i���m�N��o��D�ï����C
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110016_RETURN"), "LuaS_110016_0", 0 ); --/*���٦���L���D�C
--	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110016_EXIT") , "LuaS_110016_EXIT", 0 ); --/*�������

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110016_EXIT()

	CloseSpeak( OwnerID() );	--������ܵ���
end