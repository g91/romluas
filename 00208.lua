function LuaS_110176_0()

	SetSpeakDetail( OwnerID(), GetString("ST_110176_0")   );--/*�w����{�I�n�Y�I���I����N��ڻ��A���W���z�ǳơI

	if CheckAcceptQuest( OwnerID(), 420220 ) == true then
	 	if CheckFlag( OwnerID(),540330 ) == true and CheckFlag(OwnerID(),540331)==false then --����ܹL  
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110176_5") , "LuaS_110176_5", 0 )
			--/*�i�H�ЧA�A��ڻ��@���|�w�F���U���ܡH
		else 
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110176_1") , "LuaS_110176_1", 0 ) 
			--/*�A���ݨ�@�ӦW�r�s�|�w�F�����`�M�h�Ψϸ`�ܡH
		end 
	end
	
--	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110176_0") , "LuaS_110176_EXIT", 0 ); --/*�������

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110176_1()

	SetSpeakDetail( OwnerID(), GetString("ST_110176_1")   );
	--/*���`�M�h�Ϊ��ϸ`�H����o�ӴN����I
	--  �Q�Ѫ��T���Ӷ��`�M�h�Ϊ��H�ӳܰs�A�@���ܨ쥴�L�~�Q�ںL�X�s�a�A�o�Ӥp�l���W�����٤����I�ڰs���O�I
	--  ���D�A����L�s�����I�F�A���M�O�Q�q�ڤf���o��ť���������I
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110176_4") , "LuaS_110176_4", 0 ) 
	--/*�n�a�I�`�@�h�ֿ��H
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110176_6") , "LuaS_110176_EXIT", 0 ); --/*���ڦҼ{�@�U�C

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110176_2()

	SetSpeakDetail( OwnerID(), GetString("ST_110176_2")   );--/*3�ӻɹ��[50�ӫC�ɹ��C
	if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) >= 350  then
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110176_3") , "LuaS_110176_3", 0 ) --/*���h�a�I�A���ݨ�L�����̥h�ܡH
	end
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110176_7") , "LuaS_110176_EXIT", 0 ); --/*�U���a�I�ڪ����]���Ӱ�...

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110176_3()
	
	local WinePay = ReadRoleValue( OwnerID() , EM_RoleValue_Money ) - 350
	SetSpeakDetail( OwnerID(), GetString("ST_110176_3")   );--/*�ںޥL����̥h�I�I 
	WriteRoleValue( OwnerID() , EM_RoleValue_Money , WinePay ) --�������a���W3��50�C��
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110176_4") , "LuaS_110176_4", 0 ) 
	--/*�Фp�n�@�I�I�o��ƥi��|�t�ܦ��@���Y�����~��ƥ�I
	SetFlag( OwnerID(),540330,1 ) 

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110176_4()

	SetSpeakDetail( OwnerID(), GetString("ST_110176_4")   );
	--/*�����Y�����~��ƥ�H�L�@�w�O�K�˦b���Ӱ����������F�A�A�h�Фl�᭱�άO����������A�@�w�i�H���o�K�~���I
	SetFlag( OwnerID(),540330,1 ) 
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110176_8") , "LuaS_110176_EXIT", 0 ); --/*���§A�������C

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110176_5()

	SetSpeakDetail( OwnerID(), GetString("ST_110176_5")   );
	--/*�Фl�᭱�άO����������A�U�O�s�K���H�U�|�������������h�A�u�O�_�ǡ�

	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110176_8") , "LuaS_110176_EXIT", 0 ); --/*���§A�������C

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110176_EXIT()

	CloseSpeak( OwnerID() );	--������ܵ���
end