function LuaS_111397()

	LoadQuestOption( OwnerID() )	--���J���ȼҪO

	AddSpeakOption( OwnerID(), TargetID(), GetString("SC_111397_04") , "LuaS_111397_GetTP" , 0 )		-- �ﶵ�A�ڷQ�����u�ޯ୫�m�Ť�v
	AddSpeakOption( OwnerID(), TargetID(), GetString("SC_111397_05") , "LuaS_111397_GetDeb" , 0 )	-- �ﶵ�A�ڷQ�����u����ū�o��v

end

function LuaS_111397_GetTP()

	CloseSpeak( OwnerID() )

	local PlayerID = OwnerID()
	local PackageID = 203035		-- �ޯ୫�m�Ť�
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( NeedSpaceStatus  == false ) then
		ScriptMessage( PlayerID , PlayerID , 1, GetString("SC_111397_01") , C_DEFAULT )	-- �A���I�]�w���A�Х���z�A���I�]�I�I
	elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
		ScriptMessage( PlayerID , PlayerID , 1, GetString("SC_111397_02") , C_DEFAULT )	-- ��p�A�o�Ӫ��~�L�k�P�ɨ��o�@�ӥH�W�I�I
	else
		Say( TargetID() , GetString("SC_111397_03") )	-- �ӡA�o�O�ޯ୫�m�Ť�A�ϥΫ�N�|���m�A���ޯ�TP�I�ơA���A�i�H���s���t�C�Цn�n���ϥΡI�I
		GiveBodyItem( PlayerID , PackageID , 1 )
	end

end

function LuaS_111397_GetDeb()

	CloseSpeak( OwnerID() )

	local PlayerID = OwnerID()
	local PackageID = 203525		-- ����ū�o��
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( NeedSpaceStatus  == false ) then
		ScriptMessage( PlayerID , PlayerID , 1, GetString("SC_111397_01") , C_DEFAULT )	-- �A���I�]�w���A�Х���z�A���I�]�I�I
	elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
		ScriptMessage( PlayerID , PlayerID , 1, GetString("SC_111397_02") , C_DEFAULT )	-- ��p�A�o�Ӫ��~�L�k�P�ɨ��o�@�ӥH�W�I�I
	else
		Say( TargetID() , GetString("SC_111397_06") )	-- �ӡA�o�O����ū�o��A�ϥΫ�N�|�M�ŧA���t�šA�Цn�n���ϥΡI�I
		GiveBodyItem( PlayerID , PackageID , 1 )
	end

end
