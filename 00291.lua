function LuaI_110280()
	SetPosture( OwnerID(), 8 , ruFUSION_ACTORSTATE_SLEEP_BEGIN ); --�n�令��ı
end

function LuaS_110280_0()
	SetSpeakDetail( OwnerID(), GetString("ST_110280_0")   );
	--/*�������n�Ϊ��s��K�K��
	--  �}�G���f�f��O���z�H�a������
	if CheckFlag( OwnerID() , 540254 ) then
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110280_1") , "LuaS_110280_1", 0 ); 
		--/*�d�ҥd���쪺����
	end
	--AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110280_0") , "LuaS_110280_EXIT", 0 );
	--/*�������

end

function LuaS_110280_1()
	SetSpeakDetail( OwnerID(), GetString("ST_110280_1")   );
	--/*�c�㶵��H�ڨS���K�K����A�c�㦳���ܴN�i�H�K�K��K�K��K�K�𥧬��Ҵ����K�K���Q�M�s�K�K�c��W�����Ӷ��K�K����N�ഫ�K�K����h�K�K�c��K�K��s�K�K

	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110280_2") , "LuaS_110280_EXIT", 0 );
	--/*�ݨӥ��p�d�⨺�Ӷ��쮳�h��𥧬��Ҵ��s�ܤF�C
	SetFlag( OwnerID() , 540256 , 1 )
end

function LuaS_110280_EXIT()

	CloseSpeak( OwnerID() );	--������ܵ���
	Say( TargetID() , GetString("SAY_110196_0") ) --/*Zzz......
end