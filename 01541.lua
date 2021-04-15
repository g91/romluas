-----ù�w�s���᪺���
function LuaS_113460() 

	if CheckCompleteQuest( OwnerID() , 422698) == true then
		SetSpeakDetail(OwnerID(),"[SC_113460]") --�n���O���F�ϧڡA[113453]�ƶ����]���|�Q�]�L����.....
		PlayMotion(TargetID() , ruFUSION_ACTORSTATE_EMOTE_CRY)
	else
		LoadQuestOption( OwnerID() )
	end
end


------�m������
function LuaS_422673() 

	if CountBodyItem( OwnerID(), 205904 )>0  then
		return true
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422673_1]" , C_SYSTEM ) -- �A�ʤֳ����u��]�I
		return false
	end
end

function LuaS_422673_1() 

	local NPC = LuaFunc_CreateObjByObj ( 113474 , TargetID() )
	WriteRoleValue( NPC  , EM_RoleValue_LiveTime , 30 )
	AddToPartition( NPC , 0 )
	return true
end

-----�o��Z��
function LuaS_422675() 

	local R = Rand( 6 ) 
	if R==1  then
		GiveBodyItem( OwnerID(), 205905, 1 )
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422675]" , C_SYSTEM ) -- �o��Z���b�A��Ĳ�I�U�Ƭ�����
		BeginPlot( TargetID() , "LuaS_422675_1" , 0 )
		return false
	else
		return true
	end
end

function LuaS_422675_1() 
	Hide( OwnerID() )
	sleep(400)
	LuaFunc_ResetObj( OwnerID() )
end


------����������ܦ�
function LuaS_113455()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() ,422676 ) == true and CheckCompleteQuest( OwnerID() , 422676) == false then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_113455_1]","LuaS_113455_1",0) --�������A�A���p�e�O......
	end
	if CheckAcceptQuest( OwnerID() ,420947 ) == true and CheckCompleteQuest( OwnerID() , 420947) == false then
		AddSpeakOption(OwnerID(), TargetID( ), "[SC_113455_SUEZ_00]",  "LuaS_113455_Suez_0",  0 ) --ť�����󥸭ԳQ���]ŧ��������
	end
end

function LuaS_113455_1()
	SetSpeakDetail(OwnerID(),"[SC_113455_2]") --�p�G�{�b�n�H�x���M�D�H�j�x������ܡA���G���w�O���Ѫ�... 
	AddSpeakOption(OwnerID(),TargetID(),"[SC_113455_3]","LuaS_113455_2",0) --����A�ڸӫ�򰵡H
end

function LuaS_113455_2()
	SetSpeakDetail(OwnerID(),"[SC_113455_4]") --�ھڰ���L���^���A�Q�n��F�D�H�]���A�ߤ@���q�D......
	SetFlag(OwnerID() , 543298 , 1 )
end

----�F���\�����䴩
function LuaS_422698()
	if CheckCompleteQuest( OwnerID() , 422744) == true then
		SetSpeakDetail(OwnerID(),"[SC_422698_1]") --�ڰO�o�A�A���§A���g���U��......
		SetFlag(OwnerID() , 543325 , 1 )
	else
		SetSpeakDetail(OwnerID(),"[SC_422698_2]") --��U�H�ڦA�]���|�h���U�A�̳o�ǡu�~�Ӫ̡v......
		SetFlag(OwnerID() , 543325 , 1 )
	end
end

function LuaS_422698_complete()
--�X�l780441

	local NPC = CreateObjByFlag( 113528 , 780441 , 1 , 0 )  --���i�h�L
	writerolevalue( NPC , EM_RoleValue_IsWalk , 0 )
	AddToPartition( NPC , 0 )

	MoveToFlagEnabled( NPC , false )
	LuaFunc_MoveToFlag( NPC , 780441 , 2 ,  0 )
	Say( NPC , "[SC_422698_3]" )               -- �����x�A�ڦ��@��Ʊ��n���i......
	sleep(30)
	Say(OwnerID() , "[SC_422698_4]"  )     -- ����Ʊ��H�A���y����p���G�աH
	sleep(30)
	Say(NPC , "[SC_422698_5]"  )     -- �����ǨӮ����A[113453]�ƶ����A�L....
	sleep(30)
	Say( OwnerID() , "[SC_422698_6]" )               -- [113453]�H[113453]�L���F�H�I
	sleep(30)
	Say( NPC , "[SC_422698_7]" )               -- �ƶ����L....�]���Q�]�Lŧ��.....��¾�F......
	sleep(20)
	Say( OwnerID() , "[SC_422698_8]" ) 	-- ���I���I[113453]....
	PlayMotion(OwnerID() , ruFUSION_ACTORSTATE_EMOTE_CRY)
	sleep(30)
	DelObj(NPC)
end

---422699�V�^���P�q
function LuaS_422699()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() ,422699 ) == true and CheckFlag(OwnerID(),543340) == false  then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422699]","LuaS_422699_1",0) --�ڨӰe[113453]�@�{......
	end
end

function LuaS_422699_1()
	CloseSpeak( OwnerID() )
	if ReadRoleValue( TargetID() ,EM_RoleValue_PID ) == 0 then
		DisableQuest( TargetID() , true )
		writerolevalue( TargetID() , EM_RoleValue_PID , 1 )
		BeginPlot( TargetID() , "LuaS_422699_2" , 0 )
	else
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SAY_NPC_BUSY]" , 0 )  
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SAY_NPC_BUSY]" , C_SYSTEM )	
	end
end

--780442
function LuaS_422699_2()

	SetFlag(TargetID() , 543341 , 1 ) --�������t����
	local soldier = {}	
	for i =1, 10, 1 do
		soldier[i] = CreateObjByFlag( 113524 , 780442 , i , 0 )  
		AddToPartition( soldier[i] , 0 )
	end

	local NPC = CreateObjByFlag( 113530 , 780442 , 11 , 1 )  --������
	AddToPartition( NPC , 0 )

	MoveToFlagEnabled( NPC , false )
	LuaFunc_MoveToFlag( NPC , 780442 , 12 ,  0 )
	sleep(20)
	Say( NPC , "[SC_422699_1]" )         --  �ڨӨ��A�̫�@���F�A[113453]......

	for i =1, 10, 1 do
		PlayMotion( soldier[i] , ruFUSION_ACTORSTATE_EMOTE_SALUTE)
	end

	sleep(30)
	PlayMotionEX( NPC, ruFUSION_ACTORSTATE_CROUCH_BEGIN,ruFUSION_ACTORSTATE_CROUCH_LOOP)
	Say( NPC , "[SC_422699_2]" )         --  ���ƾ����b�ءA�ӧA�o�w�g�B�N�����b�o��......
	sleep(10)

	for i =1, 10, 1 do
		PlayMotionEX( soldier[i] , ruFUSION_ACTORSTATE_CROUCH_BEGIN,ruFUSION_ACTORSTATE_CROUCH_LOOP)
	end

	sleep(50)
	Say( NPC , "[SC_422699_3]" )         --  �ڷ|���A�������A�S�̡I�w�ߤW���a......
	LuaFunc_MoveToFlag( NPC , 780442 , 13 ,  0 )
	sleep(20)
	PlayMotion(NPC , ruFUSION_ACTORSTATE_EMOTE_POINT)
	sleep(20)
	local Fire = CreateObjByFlag( 113583 , 780442 , 14 , 0 ) --���K  
	Lua_ObjDontTouch( Fire ) 
	AddToPartition( Fire , 0 )
	AddBuff( Fire , 503605 , 1 , -1 )

	sleep(30)
	LuaFunc_MoveToFlag( NPC , 780442 , 15 ,  0 )
	LuaFunc_MoveToFlag( NPC , 780442 , 16 ,  0 )
	sleep(20)
	Say( NPC , "[SC_422699_4]" )         --  [113453]�ƶ����b����^�i��¾�A���L�����ݡA�N�|�û��y�s�b�ڭ̤ߤ��I
	AddBuff( Fire , 502724 , 1 , -1 )
	sleep(30)
	PlayMotion( NPC , ruFUSION_ACTORSTATE_EMOTE_SALUTE)
	sleep(50)
	SetFlag(TargetID() , 543340 , 1 )    --���ȧ���
	SetFlag(TargetID() , 543341 , 0) --���������t�F�I

	Delobj( NPC )
	Delobj( Fire )
	for i =1, 10, 1 do
		Delobj( soldier[i] )
	end

	DisableQuest( OwnerID() , false )
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 )
end























