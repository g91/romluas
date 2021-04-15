function LuaS_110770()	-- ����ұ��s�����º�
	LoadQuestOption( OwnerID() )
  	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_OPENAC") , "LuaS_110770_OpenAC" , 0 )	-- �}�ҥ����
  	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110049_1") , "LuaS_110770_Intro" , 0 )		-- ����Ҥ���
end

function LuaS_110770_Intro() 
	SetSpeakDetail( OwnerID(), GetString( "ST_110049_1" ) )
	--/����ҬO���ѫ_�I�̪��~��y���a��C\n\n�p�G�A�b�Ȧ檺�L�{���o�즳���Ȫ��Z���B�˳ơB�Ť�Ψ�L���~�A�A�i�H����ڭ̥���Ҩӳc��F�P�˦a�A�p�G�A�ݭn�o�ǪF��A�]�i�ӧڭ̥���ҴM��C\n\n/�o�䪺�ӫ~���O�ѫ_�I�̴��Ѫ��A���M�����O�һ���@�w�K�y�A���O�����c�h�A�p�G�h�ӳ}�}���ܡA�٬O�`�`�|��쪫�G�������F����
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACKTALK") , "LuaS_110770", 0 ); --/�ڷQ�^���誺���
end

function LuaS_110770_OpenAC()
	CloseSpeak( OwnerID() )	-- ������ܵ���
	OpenAC()		-- �}�ҥ����
end


function LuaS_110771()	-- ù����H�c
	LoadQuestOption( OwnerID() )
  	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_OPENMAIL") , "LuaS_110771_OpenMail" , 0 )	-- �}�ҫH�c
end

function LuaS_110771_OpenMail()
	CloseSpeak( OwnerID() )	-- ������ܵ���
	OpenMail()		-- �}�ҫH�c
end

function LuaS_110078()

	LoadQuestOption( OwnerID() )

	if ( CheckFlag( OwnerID() , 540804 ) == false ) then

		local job = ReadRoleValue( OwnerID() , EM_RoleValue_VOC )	-- �p�G������A�@�}�l�N�ӸѪ���
	
		    if ( job == 0 ) then
			-- return "�޲z��"
		elseif  ( job == 1 ) then
			SetFlag( OwnerID() , 540811 , 1 )	-- �s��¾�~��Ԥh
		elseif  ( job == 2 ) then
			SetFlag( OwnerID() , 540812 , 1 )	-- �s��¾�~��C�L
		elseif  ( job == 3 ) then
			SetFlag( OwnerID() , 540813 , 1 )	-- �s��¾�~��s��
		elseif  ( job == 4 ) then
			SetFlag( OwnerID() , 540814 , 1 )	-- �s��¾�~��k�v
		elseif  ( job == 5 ) then
			SetFlag( OwnerID() , 540815 , 1 )	-- �s��¾�~�ﲽ�q
		elseif  ( job == 6 ) then
			SetFlag( OwnerID() , 540816 , 1 )	-- �s��¾�~���M�h
		elseif  ( job == 7 ) then
			SetFlag( OwnerID() , 540817 , 1 )	-- �s��¾�~�逸�F��
		elseif  ( job == 8 ) then
			SetFlag( OwnerID() , 540818 , 1 )	-- �s��¾�~��w�|��
		end

		SetFlag( OwnerID() , 540804 , 1 )	-- �s��¾�~�w��
	end
end