function LuaS_110288_0()
	SetSpeakDetail( OwnerID(), GetString("ST_110288_0")   );
	--/*�w����{�A�аݻݭn����H
	if CheckAcceptQuest(OwnerID(),420306) == true then
		if CheckFlag(OwnerID(),540257) then
			LoadQuestOption( OwnerID() )
		else
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110288_1") , "LuaS_110288_1", 0 ); 
			--/*���w�Q�e�A������
		end
	end
	--AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110288_0") , "LuaS_110288_EXIT", 0 );
	--/*�������

end

function LuaS_110288_1()
	SetSpeakDetail( OwnerID(), GetString("ST_110288_1")   );
	--/*��������ڡ��I���T�b�ڳo�̡C
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110288_2") , "LuaS_110288_2", 0 ); 
	--/*�ڧƱ����R�U���A���椣�|���p����C
end

function LuaS_110288_2()
	SetSpeakDetail( OwnerID(), GetString("ST_110288_2")   );
	--/*���A���M�A�j�ѻ��]�ӫܨ��W�A���o�������ڬO����Ϊ����Ŷq���Ȫ��C
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110288_3") , "LuaS_110288_3", 0 ); 
	--/*���w�Q���ڥi�H�V�p�R�K�K
end

function LuaS_110288_3()
	SetSpeakDetail( OwnerID(), GetString("ST_110288_3")   );
	--/*���I�K�ߪ����w�Q�A�L�{���o�˥i�H���ڱa�Ӥ@�p���]�I�F���L��ڨӻ��A���L�e�ڳo��������߷N�ڴN�����F�A�o������H�x�L��ڪ��R�A���D�A�{���R�O�i�H�R�檺�ܡH
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110288_4") , "LuaS_110288_4", 0 ); 
	--/*�γ\���w�Q���|�b�N�A�O�L�i�D�ڥi�H�V�p�ʶR�o�Ӧ����K�K
end

function LuaS_110288_4()
	SetSpeakDetail( OwnerID(), GetString("ST_110288_4")   );
	--/*�o�N�O�k�H�M�k�H���P���a���o�I�A���ӤF�ѧa�H�k�H�`�O���b�G�Y�ǪF��A���u���k�H�~���D�o�ǪF��O�h���_�Q�C
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110288_5") , "LuaS_110288_5", 0 ); 
	--/*�ڨ��H���U�ӶR�o������A�ӳo�ӥ���ڱq�ݪݩԤҤH���̶}�l�A�w�g����]�F�n�X�Ӧa��A�Ʊ�p����̡K�K
end

function LuaS_110288_5()
	SetSpeakDetail( OwnerID(), GetString("ST_110288_5")   );
	--/*���@�U�A�ݪݩԤҤH�H�A���O�q���w�Q���̱o���������ܡH
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110288_6") , "LuaS_110288_6", 0 ); 
	--/*�O�ڡI���L�ڬO���h��ݪݩԤҤH�A�~���D�o������e�����w�Q�A�M��ڤ~�h�䫢�w�Q���C
end

function LuaS_110288_6()
	SetSpeakDetail( OwnerID(), GetString("ST_110288_6")   );
	--/*�o������O�ݪݩԤҤH�e�����w�Q���I�H
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110288_7") , "LuaS_110288_7", 0 ); 
	--/*��A��������D�ܡH
end

function LuaS_110288_7()
	SetSpeakDetail( OwnerID(), GetString("ST_110288_7")   );
	--/*�A�����I�L���o�O�L�s�F�ܤ[�����R���A�L�S���o�O�t�@�Ӥk�H�e�L���F��I�I
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110288_8") , "LuaS_110288_8", 0 ); 
	--/*�k�h�A�o�O�ӫV�d�I�ڻ����ܩp�j�i�V�ݪݩԤҤH�D�ҡC
end

function LuaS_110288_8()
	SetSpeakDetail( OwnerID(), GetString("ST_110288_8")   );
	--/*��p�K�K�ڦ��ǿE�ʡA���ݨ�L���o����Q�������ڴNı�o�_�ǡA��ӳ��Q�����ᨥ���y���F�F�K�K��ӬO���ӿ����e���L���I
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110288_9") , "LuaS_110288_9", 0 ); 
	--/*�p�~��ڤF�F�γ\�L�̤����u�O�{�ѡK�K
end

function LuaS_110288_9()
	SetSpeakDetail( OwnerID(), GetString("ST_110288_9")   );
	--/*�u�O�{�ѡH��I�A��M�����D�A�ব��ݪݩ�§�����u����ؤH�A�@�جO�o�����H�A�t�@�جO�N�����o���H���H�I�A�{�����w�Q�O���@�ءH
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110288_10") , "LuaS_110288_10", 0 ); 
	--/*�γ\�p���ӦA�H�����w�Q�@���A�N�����e����H���L�@��C
end

function LuaS_110288_10()
	SetSpeakDetail( OwnerID(), GetString("ST_110288_10")   );
	--/*�H���H�L�F�F�ڭC�I�L�����Ӥk�H���F����F���ڪ��H���I
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110288_11") , "LuaS_110288_11", 0 ); 
	--/*�γ\�L�u�O���Q���p�~�|�K�K
end

function LuaS_110288_11()
	SetSpeakDetail( OwnerID(), GetString("ST_110288_11")   );
	--/*��f�I�A�O�n�ӶR�o�Ӧ����٬O�n���w�Q�����ȡI�n�o�Ӧ����N�O�A���ڴ���L���ơI
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110288_12") , "LuaS_110288_12", 0 ); 
	--/*�O���A�k�h�A�ڧƱ��o��o������C
end

function LuaS_110288_12()
	Setflag( OwnerID() , 540257 , 1 )
	LoadQuestOption( OwnerID() )
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110288_0") , "LuaS_110288_EXIT", 0 );
	--/*�������
end

function LuaS_110288_EXIT()
	CloseSpeak( OwnerID() );	--������ܵ���
end