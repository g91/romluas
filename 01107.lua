function LuaQ_421610_Accept()
	DisableQuest( OwnerID() , True )
	Hide( OwnerID() )
	local BathShowWear = LuaFunc_CreateObjByObj ( 101386 , OwnerID() )
	SetAttack( BathShowWear , TargetID() )
	SetPlot( BathShowWear , "dead" , "Lua_101386_Dead" , 0 )
	BeginPlot( BathShowWear , "Lua_BathShowWear_Battle" , 0 )
	WriteRoleValue( BathShowWear , EM_RoleValue_PID , OwnerID() )
end

function Lua_101386_Dead()
	local Mala_rake = LuaFunc_CreateObjByObj ( 111829 , OwnerID() )
	local BathShowWear = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	WriteRoleValue( Mala_rake , EM_RoleValue_PID , BathShowWear )
	WriteRoleValue( Mala_rake , EM_RoleValue_Register , TargetID() )
	DisableQuest(Mala_rake,True )
	BeginPlot( Mala_rake , "Lua_Mala_rake_111829" , 0 )
	return true
end

function Lua_BathShowWear_Battle()
	Local Owner = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	Sleep(150)

	while 1 do
		sleep(1)
		if ReadRoleValue( OwnerID(), EM_RoleValue_AttackTargetID ) ~= 0 then 
			sleep(60)	-- �����ˬd�@��	
		else
			if ReadRoleValue( OwnerID() , EM_RoleValue_IsDead)  == 0 then
				Hide( OwnerID() )
				Show( Owner , 0 )
				DisableQuest(  Owner, False )	
				DelObj( OwnerID() )
			end
			break		
		end
	sleep(1)
	end
end

function Lua_Mala_rake_111829()
	local Player = ReadRoleValue( OwnerID() , EM_RoleValue_Register)
	local BathShowWear = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	sleep(30)
	Say( OwnerID() , "[SC_111829_00]" ) --�����@�@�O���ǳX�ȡA�S��ڱH�J�����鵹���a�H
	AdjustFaceDir( OwnerID(), Player, 0 ) 
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_CAST_BEGIN)	
	sleep(40)
	Say( OwnerID() , "[SC_111829_01]" ) --�A�̦b�M�䨺��j�j���Ť�C�H
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_CAST_END)
	sleep(30)
	Say( OwnerID() , "[SC_111829_02]" ) --����O�i�D�ڡu�大§�g�v�o�ӦW�r�A�ڬO���|�ӻ{��......
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_BUFF_INSTANT)
	sleep(20)
	Say( OwnerID() , "[SC_111829_03]" ) --�o��ѧڶɺɥ��O�s�y�X�Ӫ��Ť�C�A�L�Ӧ����W�r�O�u�Ť�C�E���Է�J�v�C
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_COMBAT_UNARMED)
	sleep(30)
	Say( OwnerID() , "[SC_111829_04]" ) --���藍�|�O���Ӧw�w�Ĵ���©�L�Ҩ����W�r�K�K
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_ATTACK_UNARMED)
	sleep(50)
	Say( OwnerID() , "[SC_111829_05]" ) --���M�A�A�̯�����o�̬O�@��ȱo�g�઺�Ʊ��C
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_IDLE1)
	sleep(20)
	Say( OwnerID() , "[SC_111829_06]" ) --���O�u�Ť�C�E���Է�J�v�w�g���b�ڤ�W�C
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_CAST_BEGIN)
	sleep(20)
	Say( OwnerID() , "[SC_111829_07]" ) --���A�b�ʦL���ԫe�A�w�w�Ĵ��T��˱�F����C�A����S�Q�ڮ��^��......
	PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_CAST_END)
	sleep(20)
	Say( OwnerID() , "[SC_111829_08]" ) --���O�A���@�̡A���ǥi�c�����@��......
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_BUFF_INSTANT)
	sleep(30)
	Say( OwnerID() , "[SC_111829_09]" ) --�o�b�j�O���ɷ��a�F�ڪ�����A�åB�ܨ��Ť�C�I
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_IDLE0)
	sleep(30)
	Say( OwnerID() , "[SC_111829_10]" ) --�ӧڡA�u��Q���ƥ޸̳Ѿl���]�k��q�A���ۤv���F��H�J��o�ǫ�ӥ��h�ʤO�����@�̨��W�K�K
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_IDLE1)
	sleep(50)
	Say( OwnerID() , "[SC_111829_11]" ) --��������w�w�Ĵ����]�ƷQ����A���L�ݱ��ڪ��P��̹ܨ����Ť�C�A�̫�o��������L���˿ժܪ��Z���a��
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_BUFF_INSTANT)
	sleep(30)
	Say( OwnerID() , "[SC_111829_12]" ) --�o�N�O�ڪ��A�G�A�A�G�K�K
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_DYING)
	sleep(15)
	Hide(OwnerID() )
	sleep( 150 )
	Show( BathShowWear , 0 )
	DisableQuest( BathShowWear, False )	
	DelObj( OwnerID() )
end

function LuaS_111797_0()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 421610 ) == true and CheckCompleteQuest( OwnerID() , 421610 ) == false then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_111797_0]","LuaS_111797_1",0)
	end
end

function LuaS_111797_1()
	CloseSpeak( OwnerID() )
	Say( TargetID() , "[SC_111797_1]" ) --�大§�g�I�大§�g�I�大§�g�I�q~~~~~
	BeginPlot( TargetID() , "LuaQ_421610_Accept" , 0)
end