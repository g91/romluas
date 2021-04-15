function Lua_Complete_420620()
	if ReadRoleValue(OwnerID() , EM_RoleValue_Register ) > 0 then
		return
	end
	local Dir = ReadRoleValue( OwnerID() , EM_RoleValue_Dir )
	DisableQuest( OwnerID() , True )
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_CROUCH_END )
	AdjustFaceDir( OwnerID(), TargetID() , 0 )
	sleep(30)
	SetDir( OwnerID() , Dir)
	sleep( 5 )
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_CROUCH_BEGIN )
	Yell( OwnerID() , "[SC_420620_0]" , 2 ) --���ڲM�I�@�U......
	sleep( 30 )
	local Bag = Lua_CreateObjByDir( OwnerID() , 110080 , 5 , 0)
	SetModeEx( Bag , EM_SetModeType_Mark , false )
	SetModeEx( Bag , EM_SetModeType_HideMinimap , true )
	AddToPartition( Bag , 0 )
	sleep( 10 )
	Yell( OwnerID() , "[SC_420620_1]" , 2 ) --�G�M�٬O�S���e��......
	sleep( 10 )
	DelObj( Bag )
	DisableQuest( OwnerID() , false )
end

function LuaI_204431_check()
	
	if CheckAcceptQuest( OwnerID() , 420627 ) == false or CheckFlag( OwnerID() , 542556) == true then
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_420627_0]" , 0 ) --�ثe���ݭn�ϥγo�Ӫ��~
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_420627_0]" , 0 ) --�ثe���ݭn�ϥγo�Ӫ��~
		return  false
	end
	local Mob = 0
	Mob = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101841 , 35 )
	if CheckID( Mob) ~= true then
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_420627_1]" , 0 ) --�A��[101841]�٤�����
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_420627_1]" , 0 ) --�A��[101841]�٤�����
		return  false
	end
	if ReadRoleValue( Mob , EM_RoleValue_PID ) > 0 then
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_420627_2]" , 0 ) --�e�w�g���ӤF
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_420627_2]" , 0 ) --�e�w�g���ӤF
		return  false
	end
	return true
end

function LuaI_204431_Use()
	local Mob = 0
	Mob = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101841 , 50 )
	WriteRoleValue( Mob , EM_RoleValue_PID , 1 )
	BeginPlot( Mob , "LuaI_204431_Play" , 0 )
end

function LuaI_204431_Play()
	local NPC = LuaFunc_SearchNPCbyOrgID( OwnerID() , 112718 , 100 )
	local Me = Role:new(OwnerID() )
	local NPCPos = Role:new( NPC)
	local X, Y , Z , Dir = NPCPos:X() , NPCPos:Y() , NPCPos:Z() ,NPCPos:Dir() 
	local X2, Y2 , Z2 , Dir2 = Me:X() ,Me:Y() ,Me:Z() ,Me:Dir() 
	local Player = LuaFunc_PartyData(TargetID())
	WriteRoleValue( NPC, EM_RoleValue_Register ,1)
	DisableQuest( NPC , True )
	PlayMotion( NPC , ruFUSION_ACTORSTATE_CROUCH_END )
	sleep( 15 )
	PlayMotionEX( OwnerID() , ruFUSION_ACTORSTATE_NORMAL, ruFUSION_ACTORSTATE_NORMAL) --�^�_ Normal
	AdjustFaceDir( OwnerID(), NPC , 0 )
	sleep( 15 ) 
	Yell( NPC , "[SC_204431_0]" , 1) --�x�H
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_CAST_INSTANT )
	sleep( 5 )
	PlayMotion( NPC , ruFUSION_ACTORSTATE_HURT_CRITICAL )
	Yell( NPC , "[SC_204431_1]" , 1) --�ڡI
	sleep( 15 )
	PlayMotion( NPC, ruFUSION_ACTORSTATE_THROW)
	Yell( NPC , "[SC_204431_2]" , 2) --�i�c�I�Y�o�ǧa�I
	CastSpell( NPC , OwnerID() , 492907 )
	sleep( 10 )
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_HURT_NORMAL )
	sleep( 10 )
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_BUFF_INSTANT)
	Yell( NPC , "[SC_204431_3]" , 2) --����H�S�ΡH
	sleep( 10 )
	SetRoleCamp( NPC , "SNPC" )
	SetRoleCamp( OwnerID() , "Monster" )
	Hide( OwnerID() )
	Hide( NPC )
	SetModeEx( OwnerID() , EM_SetModeType_HideName, false )
	SetModeEx( OwnerID() , EM_SetModeType_Strikback , true )
	SetModeEx( OwnerID() , EM_SetModeType_Searchenemy , true )
	SetModeEx( OwnerID() , EM_SetModeType_Fight , true )
	Show( NPC , 0 )
	Show( OwnerID() , 0 )
	Yell( NPC , "[SC_204431_4]" , 2) --�p�ߡI
	SetAttack( NPC , OwnerID() )
	SetAttack( OwnerID() , TargetID() )
	for i = 0 , 60 , 1 do
		if HateListCount( OwnerID() ) == 0 or ReadRoleValue( OwnerID() , EM_RoleValue_PID ) > 1 then
			break
		end
		sleep( 10 )
		if i == 60 then
			WriteRoleValue( OwnerID() , EM_RoleValue_PID , 3 )
		end
	end
	if ReadRoleValue( OwnerID() , EM_RoleValue_PID ) > 2 or  ReadRoleValue( OwnerID() , EM_RoleValue_PID ) == 1 then
		Yell( NPC , "[SC_204431_2]" , 2) --�i�c�I�Y�o�ǧa�I
		PlayMotion(NPC , ruFUSION_ACTORSTATE_THROW)
		CastSpell( NPC , OwnerID() , 492907 )
		sleep( 10 )
	end
	SetRoleCamp( NPC , "Visitor" )
	SetRoleCamp( OwnerID() , "Visitor" )
	Hide( OwnerID() )
	Hide( NPC )
	SetModeEx( OwnerID() , EM_SetModeType_HideName, true )
	SetModeEx( OwnerID() , EM_SetModeType_Strikback , false )
	SetModeEx( OwnerID() , EM_SetModeType_Move , false )
	SetModeEx( OwnerID() , EM_SetModeType_Searchenemy , false )
	SetModeEx( OwnerID() , EM_SetModeType_Fight , false )
	Show( OwnerID() , 0 )
	Show( NPC , 0 )
	WriteRoleValue( NPC, EM_RoleValue_Register ,0)
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_DYING,ruFUSION_ACTORSTATE_DEAD)
	Yell( OwnerID() , "[SC_204431_5]" , 2) 
	LuaFunc_WaitMoveTo( NPC, X , Y , Z )
	sleep( 5 )
	SetDir( NPC , Dir )
	sleep( 5 )
	PlayMotionEX( NPC , ruFUSION_ACTORSTATE_CROUCH_BEGIN,ruFUSION_ACTORSTATE_CROUCH_LOOP)
	sleep(30)
	Hide( OwnerID() )
	sleep( 20 )
	SetPos( OwnerID(), X2 , Y2 , Z2 , Dir2)
	SetDir( OwnerID(),  Dir2 )
	Show( OwnerID() , 0 )
	sleep( 10 )
	DisableQuest( NPC , false )
	if ReadRoleValue( OwnerID() , EM_RoleValue_PID ) > 1 then
		for i = 1 , Player[0] , 1 do
			if CheckID(Player[i]) == true and CheckAcceptQuest( Player[i] , 420627 ) == true and ReadRoleValue( Player[i] , EM_RoleValue_IsDead ) == 0 and CheckFlag(Player[i] , 542556) == false and GetDistance( OwnerID() , Player[i] ) < 250 then
				SetFlag( Player[i] , 542556 , 1 )
			end
		end
		if CheckID( TargetID() ) == true then
			SetFlag( TargetID(), 542556 , 1 )
		end
	end
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 )
	WriteRoleValue( OwnerID() , EM_RoleValue_HP , ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP) )
end

function LuaI_101841()
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , ReadRoleValue( OwnerID() , EM_RoleValue_Dir ) )
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 1 )
	SetRoleCamp( OwnerID() , "Visitor" )
	Hide( OwnerID() )
	SetModeEx( OwnerID() , EM_SetModeType_HideName, true )
	SetModeEx( OwnerID() , EM_SetModeType_Strikback , false )
	SetModeEx( OwnerID() , EM_SetModeType_Move , false )
	SetModeEx( OwnerID() , EM_SetModeType_Searchenemy , false )
	SetModeEx( OwnerID() , EM_SetModeType_Fight , false )
	Show( OwnerID() , 0 )
	SetPlot( OwnerID() , "dead" , "LuaI_101841_dead" , 0 )
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_DYING,ruFUSION_ACTORSTATE_DEAD)
	sleep(30)
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 )
end

function LuaI_101841_dead()
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 2 )
	Lua_CancelAllBuff( OwnerID() ) 
	return false
end

function LuaI_101841_Kill()
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 3 )
	return false
end

function LuaI_112718()
	MoveToFlagEnabled( OwnerID() , false )
	SetPlot( OwnerID() , "dead" , "LuaI_112718_dead" , 0 )
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_CROUCH_BEGIN,ruFUSION_ACTORSTATE_CROUCH_LOOP)
	sleep(30)
end

function LuaI_112718_dead()
	return false
end

function LuaS_112718_0()
	if ( CheckAcceptQuest(OwnerID() , 420628 ) == true or CheckCompleteQuest(OwnerID() , 420628 ) == true ) and CheckCompleteQuest( OwnerID() , 420629 ) == false then
		SetSpeakDetail( OwnerID(), "[SC_112718_0]"  ) --[112718]���y��a�աA�@�Ƨ֭ˤU�h���ˤl�A�ݰ_�Ӧo�����˨ä���¡C
	else
		LoadQuestOption( OwnerID() )
	end
end

function LuaS_112780_0()
	LoadQuestOption( OwnerID() )
	AddSpeakOption(OwnerID(),TargetID(),"[SC_112780_0]","LuaS_112780_1",0) --�\Ū���e 
end

function LuaS_112780_1()
	CloseSpeak( OwnerID() )
	BeginPlot( OwnerID() , "LuaS_112780_2" , 0 )
end

function LuaS_112780_2()
	local str = "["..GetUseItemGUID(OwnerID()).."]"
	ClearBorder( OwnerID());	--��l�ƥ۸O����
	AddBorderPage( OwnerID(), "[SC_112780_1]" ) --���e
	AddBorderPage( OwnerID(), "[SC_112780_2]" ) --���e
	AddBorderPage( OwnerID(), "[SC_112780_3]" ) --���e
	AddBorderPage( OwnerID(), "[SC_112780_4]" ) --���e
	if CheckAcceptQuest(OwnerID(),420629)==true and CheckFlag( OwnerID() , 542554 ) == false then
		SetFlag( OwnerID() , 542554 , 1 )
	end
	ShowBorder( OwnerID(), 0 , str , "ScriptBorder_Texture_Paper" )	
end

function LuaS_420629_1()
	if CheckFlag( OwnerID() , 542554 ) == false then
		SetSpeakDetail( OwnerID(), "[SC_420629_1]"  ) --�D�H���Ʊ���......�n�a�I�J�M�A�w�g���D�L�̪��s�b�A����@�����i�D�A�]�n�C���L�ڱo���w�ƫ��[112718]���Ʊ��A�ڨ��ᦳ�@��[112780]�A�A�i�H���ݬݤ��e�A�̭��O�o�@���Ʊ����}�ݡC
	else
		SetSpeakDetail( OwnerID(), "[SC_420629_2]"  ) --��n�A�ڬO�Ф]�B�z��@�Ӭq���F�C�ݤF�������i�A�ڷQ�A���Ӥw�g���D�F�a�I���ӯ��L�����¼v�N�O�ڭ��һ����D�H�C
		AddSpeakOption(OwnerID(),TargetID(),"[SC_420629_3]","LuaS_420629_2",0) --�߰ݳD�H�O����
	end
end

function LuaS_420629_2()
	SetSpeakDetail( OwnerID(), "[SC_420629_4]"  ) --�ѹ껡�ڭ̤]���ӲM���A�u���D�L�̬O�ܥj�ѨåB�M�I���رڡA�ھڽ�̤��������O���A�L�̹L�h�M���F�O�J�ġA���o�ӥ@�ɦ��ܪ��@�q�ɶ��S������L�̪��O���A����̪�~�S��M�X�{�C
	AddSpeakOption(OwnerID(),TargetID(),"[SC_420629_5]","LuaS_420629_3",0) --�߰ݳD�H���ت�
end

function LuaS_420629_3()
	SetSpeakDetail( OwnerID(), "[SC_420629_6]"  ) --�o�Ӷ�......�ڨä���i�D�A�ӸԲӪ����e�A���ڥi�H�i�D�A�A�L�̱N�|�ް_�@���Ԫ��A���`�۶ħL�Τw�g�o�{�b��u���{�b�Ҧb�a�w�g�ܦ��D�H�����I�A�ڭ̺٤���[ZONE_NAGA OUTPOST]�A����E���F�@��D�H���x��......�Z����}�A�֦��b�H�h�L���x��.....�L�̪��ت��O�o�̡A�ڭ̤w�g�x���T���������A�೽�H�|ŧ���ڭ̻P�D�H���۷����p�C�گ໡���N�o��h�F�C
	if CheckFlag( OwnerID() , 542555 ) == false then
		SetFlag( OwnerID() , 542555 , 1 )
	end
	AddSpeakOption(OwnerID(),TargetID(),"[SC_420629_7]","LuaS_422060",0) --�����o�Ӹ��D
end