----���������
function LuaS_113503()
--	if CheckCompleteQuest( OwnerID() , 422710 ) == false then
		LoadQuestOption( OwnerID() )
--	else
--		SetSpeakDetail(OwnerID(),"[SC_113503_TIME_ERROR]") 
--	end
	if CheckAcceptQuest( OwnerID() ,422708 ) == true and CheckFlag(OwnerID(),543338) == false then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_113503_1]","LuaS_113503_1",0) --�o�̦��i�Q�Ϊ��a�ζܡH
		AddSpeakOption(OwnerID(),TargetID(),"[SC_113503_2]","LuaS_113503_1",0) --�󤣸ոձq�B��u����i�h�H
		AddSpeakOption(OwnerID(),TargetID(),"[SC_113503_3]","LuaS_113503_1",0) --�A������p�e�H[113503]......
	end
end

function LuaS_113503_1()

	SetSpeakDetail(OwnerID(),"[SC_113503_4]") --�o�̨�B�O����s���A���M���D�H�����S�ܱo��L���R......
	SetFlag(OwnerID() , 543338 , 1 )
end

-----��m�ﯸ�����Ȧ�����

function LuaS_422709()

	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() ,422709 ) == true and CheckFlag(OwnerID(),543339) == false then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422709]","LuaS_422709_1",0) --�ڷǳƦn�F�I���a�I���ڭ̤@�_�h�@�@�D�H�b�d���򰭡I
	end
end

function LuaS_422709_1()

	CloseSpeak(OwnerID())
	DisableQuest(TargetID() ,true )
	BeginPlot( TargetID() , "LuaS_422709_2" , 0 )
end

function LuaS_422709_2()
	local NPC = LuaFunc_CreateObjByOBj( 102675, OwnerID() )
	Hide(OwnerID())
	WriteRoleValue( NPC , EM_RoleValue_PID , TargetID() )
	BeginPlot( NPC , "LuaS_422709_3" , 0 )
	BeginPlot( NPC , "LuaS_422709_4" , 0 )
	for i = 0 , 100 , 1 do
		if CheckID(NPC) == false or ReadRoleValue( NPC , EM_RoleValue_OrgID ) ~= 102675 then
			break
		end
		sleep( 60 )
	end
	Show( OwnerID() , 0 )
	DisableQuest(OwnerID() ,false )	
end

--�ˬd��(�ק襤)
function LuaS_422709_3()
	Local NPC = OwnerID() 
	local Player = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local Result = "Success"	
	local Party = LuaFunc_PartyData(Player)
	SetPlot( OwnerID() , "Dead" , "LuaS_422709_Dead" , 0 )
	for i = 1 , Party[0] , 1 do
		if 	CheckAcceptQuest( Party[i] , 422709 ) == true and
 			CheckFlag(Party[i] , 543339 ) == false and
			GetDistance(Party[i] , OwnerID() ) < 100 and 
			ReadRoleValue(Party[i] ,EM_RoleValue_IsDead) == 0 then
			AddBuff( Party[i] , 504769 , 1 , -1 ) --�����BUFF
		end
	end

	while true do
		sleep(10)

		if	not CheckID(Player)	then
			Result = "Fail"
			break
		end
		if	ReadRoleValue(Player,EM_RoleValue_IsDead) == 1	then
			Result = "Fail"
			CancelBuff(Player, 504769)
			break
		end
		if	not	CheckDistance( OwnerID(), Player , 200 )	then
			Result = "Fail"
			CancelBuff(Player, 504769)
			break
		end
		if	ReadRoleValue(OwnerID(),EM_RoleValue_Register) > 0	then
			CancelBuff(Player, 504769)
			Result = "Fail"
			break
		end
	end
	
	
	if Result == "Fail" then

		for i = 1 , Party[0] , 1 do
			if CheckAcceptQuest( Party[i] , 422709 ) == true and CheckFlag(Party[i] , 543339 ) == false then
				ScriptMessage( Party[i] , Party[i] , 1 , "[SC_422709_1]" , 0 ) --����ѡI
				ScriptMessage( Party[i] , Party[i] , 0 , "[SC_422709_1]" , 0 )
			end
		end
		SetStopAttack( OwnerID() ) --�������
		Lua_CancelAllBuff( OwnerID())  --�M�����W��BUFF
		SetRoleCamp( OwnerID() , "Visitor" ) --���ܰ}��
		Tell(Player,OwnerID(),"[SC_422709_2]") --�ӦM�I�F�I�ڥ��^�h���i[113503]�����A�ڭ̦b���̷|�X......
	end
	Move( OwnerID() , -12973 , 942 , 31919 )
	sleep( 10 )
	Delobj( OwnerID() )
end

function LuaS_422709_Dead()
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 1 )
	return false
end
--�@����
function LuaS_422709_4()
	
	MoveToFlagEnabled( OwnerID() , false )
	local Player = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	
	Tell(Player,OwnerID(),"[SC_422709_3]") --��ڨӧa�I
	LuaFunc_MoveToFlag(OwnerID() , 780439 , 1 ,  0 )
	LuaFunc_MoveToFlag(OwnerID() , 780439 , 2 ,  0 )
	WriteRoleValue(OwnerID() , EM_RoleValue_IsWalk, 1 )
	Hide( OwnerID() )
	Show( OwnerID() ,0)	

	sleep(20)
	Tell(Player,OwnerID(),"[SC_422709_4]") --���̦��@�ǭ����L�A���ڭ̾a�L�h�@�ǰ���a�I
	sleep(10)

	LuaFunc_MoveToFlag(OwnerID() , 780439 , 3 ,  0 )
	WriteRoleValue(OwnerID() , EM_RoleValue_IsWalk, 1 )
	Hide( OwnerID() )
	Show( OwnerID() ,0)	

	sleep(20)
	Tell(Player,OwnerID(),"[SC_422709_5]") --���I�����K��ֽ��������L....���i�_�{�A�L�̪����y�޳N�u�����I
	sleep(40)	
	Tell(Player,OwnerID(),"[SC_422709_6]") --�n���O���o�ǭ����L�����A�D�H���Z���s�y�t�ױN�|�C�W�\�h...
	sleep(40)
	Tell(Player,OwnerID(),"[SC_422709_7]") --�ڭ̯u���ӧ�Ӿ��|�A�_���o�ǭ����L�I
	sleep(30)
	LuaFunc_MoveToFlag(OwnerID() , 780439 , 4 ,  0 )
	WriteRoleValue(OwnerID() , EM_RoleValue_IsWalk, 1 )
	Hide( OwnerID() )
	Show( OwnerID() ,0)	

	local MonA = CreateObjByFlag( 102518 , 780439 , 5 , 0 )  
	local MonB = CreateObjByFlag( 102518 , 780439 , 6 , 0 )  
	AddToPartition( MonA ,    0 )
	AddToPartition( MonB ,    0 )
	SetAttack( MonA , Player )
	SetAttack( MonB , Player )
	SetAttack( OwnerID() , MonA )
	SetAttack( OwnerID() , MonB )
	Say( MonA , "[SC_422709_12]" ) --  ���J�I�̡I

	while true do
		if ReadRoleValue( MonA , EM_RoleValue_AttackTargetID ) ~= 0 and CheckID( MonA ) == true then  --�ˬd�O�_���}�԰�
			Sleep( 10 )	-- �@���ˬd�@��	
		else
			if CheckID( MonA ) == true then	DelObj( MonA )	end 
			break
		end
	end

	while true do
		if ReadRoleValue( MonB , EM_RoleValue_AttackTargetID ) ~= 0 and CheckID( MonB ) == true then  --�ˬd�O�_���}�԰�
			Sleep( 10 )	-- �@���ˬd�@��	
		else
			if CheckID( MonB ) == true then	DelObj( MonB )	end 
			break
		end
	end
	
	MoveToFlagEnabled( OwnerID() , false )

	sleep(20)
	Tell(Player,OwnerID(),"[SC_422709_13]") --�~��e�i�a�I
	LuaFunc_MoveToFlag(OwnerID() , 780439 , 7 ,  0 )
	WriteRoleValue(OwnerID() , EM_RoleValue_IsWalk, 1 )
	Hide( OwnerID() )
	Show( OwnerID() ,0)	
	LuaFunc_MoveToFlag(OwnerID() , 780439 , 8 ,  0 )
	WriteRoleValue(OwnerID() , EM_RoleValue_IsWalk, 1 )
	Hide( OwnerID() )
	Show( OwnerID() ,0)
	MoveToFlagEnabled( OwnerID() , false )	
	Tell(Player,OwnerID(),"[SC_422709_14]") --�V�a��D�H�V�M�I�A�p�߸�W�I
	

	LuaFunc_MoveToFlag(OwnerID() , 780439 , 9 ,  0 )
	WriteRoleValue(OwnerID() , EM_RoleValue_IsWalk, 1 )
	MoveToFlagEnabled( OwnerID() , false )
	Hide( OwnerID() )
	Show( OwnerID() ,0)	
	LuaFunc_MoveToFlag(OwnerID() , 780439 , 10 ,  0 )
	WriteRoleValue(OwnerID() , EM_RoleValue_IsWalk, 1 )
	Hide( OwnerID() )
	Show( OwnerID() ,0)	
	sleep(30)
	Tell(Player,OwnerID(),"[SC_422709_8]") --���p���y���å�P�D�H�I
	sleep(30)
	Tell(Player,OwnerID(),"[SC_422709_9]") --�u�Qť�M���L�̦b������......
	sleep(30)
	Tell(Player,OwnerID(),"[SC_422709_10]") --�ݰ_�ӳD�H���Gť�R�󨺨ǯ��p���y���å�A�o�γ\�O�Ӧ��Ϊ������I
	sleep(30)
	Tell(Player,OwnerID(),"[SC_422709_11]") --�ڭn�A��`�J�h�լd�D�H���欰�A�A���^�h�V�������������i�A�ڭ̦^�Y��......
	SetFlag(Player , 543339 , 1 )
	sleep(20)
	CancelBuff(Player, 504769)
	LuaFunc_MoveToFlag(OwnerID() , 780439 , 12 ,  0 )
	Delobj( OwnerID() )
end
-----------��J�D�H�]��
function LuaS_113680_0()
	if ReadRoleValue( OwnerID() , EM_RoleValue_IsAttackMode ) > 0 or ReadRoleValue( OwnerID() , EM_RoleValue_IsDead ) > 0 or CheckBuff( OwnerID() , 504948) == true then
		SetSpeakDetail(OwnerID(),"[SC_113680_5]") 
	else
		LoadQuestOption( OwnerID() )
		AddSpeakOption(OwnerID(),TargetID(),"[SC_113680_0]","LuaS_113680_1",0)  --�ڭn�i�J[ZONE_NAGA ACROPOLIS]
	end
end

function LuaS_113680_1()
	CloseSpeak( OwnerID() )
	if ReadRoleValue( OwnerID() , EM_RoleValue_IsAttackMode ) == 0 and ReadRoleValue( OwnerID() , EM_RoleValue_IsDead ) == 0 and CheckBuff( OwnerID() , 504948) == false then
		DisableQuest( TargetID() , true )
		SetPlot( TargetID() , "touch" ,"LuaFunc_Obj_BUSY" , 40 )
		BeginPlot( TargetID() , "LuaS_113680_2" , 0 )
	end
end

function LuaS_113680_2()
	if CheckID( TargetID() ) == true then
		BeginPlot( TargetID() , "LuaS_113680_3" , 0 )
	end
	sleep( 100)
	DisableQuest( OwnerID() , false )
	SetPlot(  OwnerID()  , "touch" ,"" , 0 )
end
function LuaS_113680_3()

	local Wagon = CreateObjByFlag( 113682 , 780443 , 2 , 1 )
	local Zone = ReadRoleValue( OwneRID() , EM_RoleValue_ZoneID )
--	local Me= Role:new( OwnerID() )
--	local Dir = ReadRoleValue( TargetID() , EM_RoleValue_Dir )
	WriteRoleValue( Wagon , EM_RoleValue_LiveTime , 30 )
	WriteRoleValue( Wagon , EM_RoleValue_IsWalk , 1 )
	Lua_ObjDontTouch( Wagon ) 
	AddToPartition( Wagon , 0 )
	MoveToFlagEnabled( Wagon , false )
	BeginPlot( Wagon , "LuaS_113680_4" , 0 )
	PlayMotion( TargetID() , ruFUSION_ACTORSTATE_EMOTE_POINT )
	Say( TargetID() ,"......" )
	tell( OwnerID()  , TargetID() , "[SC_113680_1]" ) --�b�o�å먭�W��Ӧa����n�A�e�|�t�d�a�A�L�h�C
--	SetPos( OwnerID() , Me:X() , Me:Y() , Me:Z() , Dir )
	sleep( 30 )
	local Count = BuffCount ( OwnerID())
	local BuffType
	for i = 1 , Count do
		local BuffID = BuffInfo ( OwnerID() , Count-i , EM_BuffInfoType_BuffID )
		BuffType = GameObjInfo_int ( BuffID , "AssistType" )
		if GameObjInfo_int ( BuffID , "AssistType" ) == 68 then
			CancelBuff( OwnerID() , BuffID )
		end
	end
	AddBuff( OwnerID() , 504948 , 0 , 30 )
	ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_113680_2]" , 0 ) --�A�b[113682]�W��F�@�Ӧa��N�ۤv�äF�_��
	ScriptMessage( OwnerID() , OwnerID(), 0 , "[SC_113680_2]" , 0 )
	sleep( 20 )
	Say( TargetID() ,"......" )
	tell( OwnerID()  , TargetID() ,  "[SC_113680_3]" ) --�ڥu�����A��o�̡A���U�ӴN�ݧA�ۤv�F�A���A���B�C
	sleep( 150 )
	local X = GetMoveFlagValue( 780443 , 1 , EM_RoleValue_X )
	local Y = GetMoveFlagValue( 780443 , 1 , EM_RoleValue_Y )
	local Z = GetMoveFlagValue( 780443 , 1 , EM_RoleValue_Z )
	local Dir = GetMoveFlagValue( 780443 , 1 , EM_RoleValue_Dir )
	ChangeZone( OwnerID() , Zone , 0 , X , Y , Z , Dir )
	sleep( 10 )
	CancelBuff_NoEvent( OwnerID() , 504948 )
end

function LuaS_113680_4()
	sleep( 70 )
	if CheckID( TargetID() ) == true then
		ScriptMessage( TargetID() , TargetID() , 2 , "[SC_113680_4]" , 0 ) --[113680]�}�l�w�w�a�V[ZONE_NAGA ACROPOLIS]����V����
		ScriptMessage( TargetID() , TargetID() , 0 , "[SC_113680_4]" , 0 )
	end
	DW_MoveToFlag( OwnerID() , 780443 , 3 , 0 )
	Delobj( OwnerID() )
end