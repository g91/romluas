function LuaS_110172_0()

	if CheckAcceptQuest( OwnerID(), 420217 ) == true then  
		SetSpeakDetail( OwnerID(), GetString("ST_110172_0")   );
		--/*�������Ȧ̴��k���O�ڤ���A�i�O�]���Q�Q�A�o�򦳦W���s��N���ڤ@�Ӥp�L�B�e�A�|�X�Ƥ]���O�H�N�~�a�I
		--
		--�{�b���M��Ҧ����L����������Y�W�㤧�e���F�T�~���j���A�n���e���ɨ�ĵ�ƶ��A���G�{�b�S�Q�@�^�ӤF�A�u�O�˷��I
		--
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110172_1") , "LuaS_110172_1", 0 ) --/*�A���ݨ�Ȧ̴������Ӥ�V�k�ܡH
	else
		SetSpeakDetail( OwnerID(), GetString("ST_110172_2")   );
		--/*�_�I�̡H�w��Ө�Z��R��...����i���h�a�I�O�z��...����
	end
	
--	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110172_0") , "LuaS_110172_EXIT", 0 ); --/*�������

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110172_1()

	SetSpeakDetail( OwnerID(), GetString("ST_110172_1")   );
	--/*�ڳQ���˪��@�����A�n���ݨ�L����樺����V�k�h...

--	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110172_0") , "LuaS_110172_EXIT", 0 ); --/*�������

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110172_EXIT()

	CloseSpeak( OwnerID() );	--������ܵ���
end