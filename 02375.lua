function LuaS_118387_1()
	local Player = OwnerID();
	local NPC = TargetID();
	local StepCheck = ReadRoleValue(NPC,EM_RoleValue_Register10)--0: �٨S�}�l�i�J�`�� ,1:10��,2:��t��
	local PlayerMax = ReadRoleValue(NPC,EM_RoleValue_Register9)--���b��t�����H��
	if CheckAcceptQuest( Player, 424287 )==true and StepCheck~=2 and CheckFlag( Player,545065 )~=true  then
		LoadQuestOption(Player);
		AddSpeakOption( Player, NPC, "[SC_424287_1]", "LuaS_118387_2",0 ) --�ڡA�ڬݨ�L�̤F�C
	elseif CheckAcceptQuest( Player, 424287 )==true and StepCheck==2 and CheckFlag( Player,545065 )~=true then
		SetSpeakDetail( Player , "[SC_424287_3]" );
		CancelBuff( Player,509736 );
	else
		LoadQuestOption(Player);
	end
end

function LuaS_118387_2()--Ĳ�o10����t�@��
	local Player = OwnerID();
	local NPC = TargetID();
	if ReadRoleValue(NPC,EM_RoleValue_Register10)==0 then
		WriteRoleValue(NPC,EM_RoleValue_Register10,1)
		WriteRoleValue(NPC,EM_RoleValue_Register6,Player)--�O��}�������a
		CallPlot(NPC,"LuaS_118387_ShowTime",NPC )
	end
	if ReadRoleValue(NPC,EM_RoleValue_Register10)<2 then
		CancelBuff(Player,620146);--�����p��Buff
	end
	AddBuff(Player,509736,0,-1)
	CloseSpeak(Player)
	ScriptMessage(NPC,Player,2,"[SC_424287_MESSAGE_01]","0xffff0000" )--�Я���[118387]�����e��������N��X�{�C
	ScriptMessage(NPC,Player,0,"[SC_424287_2]","0xffffffff")--[118349]��A���G�y���@�U�A�L�̥��b���L�ӡC
end

function LuaQ_424287_ShowEndMessage( NPC )
	WriteRoleValue(NPC,EM_RoleValue_Register6,0);
	WriteRoleValue(NPC,EM_RoleValue_Register10,0);
	local PlayerArray = SearchRangePlayer( NPC,200 );
	for i=0,#PlayerArray-1 do
		CancelBuff( PlayerArray[i],620146 );--�����p��Buff
		if CheckAcceptQuest( PlayerArray[i], 424287 )==true and CheckFlag(PlayerArray[i],545065)~=true then
			if kg_GetDis(NPC,PlayerArray[i])<=140 then
				ScriptMessage(NPC,PlayerArray[i],0,"[SC_424287_4]","0xffffffff")--[118387]��A���G�ڬݨ�L���o�A�ֹL�ӡC
			else
				ScriptMessage(NPC,PlayerArray[i],2,"[SC_424287_5]","0xffff0000" )--[118349]�ݨ�U��N��F�A�ЧA�^�h��L�C
			end
		end
	end
end

function LuaQ_424287_CheckPlayer( NPC , Bucket )
	DebugMsg(0,0,"LuaQ_424287_CheckPlayer Start");
	local PlayerArray = Lua_Zone20_424287_QuestObj.PlayerArray;
	local PlayerCount = table.getn( PlayerArray );
	local CurrentCount = 0;
	while 1 do
		CurrentCount = 0;
		for i in pairs(PlayerArray) do
			if CheckID(PlayerArray[i]) == true and  CheckAcceptQuest( PlayerArray[i], 424287 ) ~= true or --�ˬd���L����
			CheckID(PlayerArray[i]) ~= true or
			CheckFlag( PlayerArray[i],545065 )==true or
			CheckBuff(PlayerArray[i],509736)~=true then
				CurrentCount = CurrentCount+1;
				CancelBuff(PlayerArray[i],509824);--���buff
				CancelBuff(PlayerArray[i],503977);--�ĨĬ���
				CancelBuff(PlayerArray[i],506098);--FadeIn FadeOut
				CancelBuff(PlayerArray[i],509736);--�ݪ�t�P�wbuff
			end;
		end;
		if CurrentCount>=PlayerCount then
			DebugMsg( 0,0," 424287_Show break" );
			break;
		end;
		Sleep(20);
	end;
	PlayerArray = Lua_Zone20_424287_QuestObj.Obj;	--�R���t��NPC
	for i in pairs(PlayerArray) do
		DelObj(PlayerArray[i]);
	end
	Lua_Zone20_424287_QuestObj=nil;
	Sleep(10);
	LuaQ_424287_ShowEndMessage( NPC );
	DebugMsg(0,0,"LuaQ_424287_CheckPlayer End");
end

function LuaS_118387_ShowTime( NPC )--NPC�i�J�@���˼�
	local RoomID = ReadRoleValue(NPC,EM_RoleValue_RoomID);
	local Bucket=OwnerID();
	if ReadRoleValue( Bucket , EM_RoleValue_OrgID )~=117201 then
		Lua_Zone20_424287_QuestObj={ Obj={},PlayerArray={} };
		local Bucket = kg_GetPosRX( NPC,117201,200,1);
		table.insert( Lua_Zone20_424287_QuestObj.Obj , Bucket );
		kg_InvisibleObjInit(Bucket);
		AddToPartition( Bucket,0 );
		CallPlot(Bucket,"LuaS_118387_ShowTime",NPC);
		return
	end
	
	Sleep(100);
	WriteRoleValue(NPC,EM_RoleValue_Register10,2)
	--Say(NPC,"Show Time!!")
	local FlagID = 780948;
	local TempArray = SearchRangePlayer( NPC,100 );
	local PlayerArray = {};
	if table.getn( TempArray )~=0 then
		for i=0,#TempArray-1 do
			CancelBuff(TempArray[i],620146);--�����p��Buff
			if kg_CheckTargetBack( TempArray[i],NPC,90,270 )==0 and CheckAcceptQuest( TempArray[i], 424287 )== true  then
				table.insert( PlayerArray ,TempArray[i]  );
			end;
		end;
	elseif table.getn( TempArray )==0 then
		PlayerArray=TempArray;
	end;
	--���p�S�����󪱮a�b�d�򤺪��B�z
	if table.getn( PlayerArray )==0 then
		Sleep(10);
		LuaQ_424287_ShowEndMessage( NPC );
		DelObj(Bucket);
		DebugMsg( 0,0," 424287_Show break" );
		return
	end;
	Lua_Zone20_424287_QuestObj.PlayerArray=PlayerArray;
	for i in pairs(PlayerArray) do
		if CheckID(PlayerArray[i])==true and 
		CheckAcceptQuest( PlayerArray[i], 424287 )==true and
		CheckBuff(PlayerArray[i],509736)==true then
			--Say(PlayerArray[i],"yo")
			AddBuff(PlayerArray[i] ,506098,0,-1)--FadeIn FadeOut
			AddBuff(PlayerArray[i],503977,0,-1)--�ĨĬ���
		end
	end
	Sleep(15)--���ݲH�J
	--�������i�J�����a
	NPCSay( NPC , "[SC_424287_31]" );--�u�r�A�ݿ��F�a�A�A���@���a�I
	TempArray = SearchRangePlayer( NPC,200 );
	for i=0,#TempArray-1 do
		if CheckID(TempArray[i])==true and 
		CheckAcceptQuest( TempArray[i], 424287 )==true and
		CheckBuff(TempArray[i],509736)==true and
		CheckBuff(TempArray[i],503977)~=true then
			--Say(TempArray[i],"oh no~");
			AddBuff( TempArray[i],620146,0,112 );
			ScriptMessage(NPC,TempArray[i],2,"[SC_424287_MESSAGE_02]","0xffff0000" )--�ЦA�@���P[118387]�͸ܫ�A���r��L�����e�C
		end
	end
	--���ͪ���P�]�w���a��m
	local ActorNPC={	{118349},	--�ϸ`A	1
				{118378},	--�ϸ`B	2
				{118379},	--�G�HA	3
				{118380},	--�G�HB	4
				{118381},	--�G�HC	5
				{118382},	--�R���HA	6
				{118383},	--�R���HB	7
				{118384},	--�R���HC	8
				{118385},	--���J�E�ͦ]��	9
				{118386}	--�R���H�Q��	10
				};
				
	--���ͺt��
	local MainActorDis = ReadRoleValue(NPC,EM_RoleValue_PID );	--�D�n�}�� (�G�HA�A�R���HA) �P�X�Ъ���l�Z��
	local SubActorDis = 30;		--��Z���P�D�����Z��(B,C)
	local x,y,z,d;
	ActorNPC[1][2]=kg_GetPosRX({FlagID,0},ActorNPC[1][1],20,0,90,-3);--�ϸ`A
	LuaS_118387_ActorInit( ActorNPC[1][2] )
	ActorNPC[2][2]=kg_GetPosRX({FlagID,0},ActorNPC[2][1],20,0,-90,-3);--�ϸ`B
	LuaS_118387_ActorInit( ActorNPC[2][2] )
	x,y,z,d=kg_GetPosRX({FlagID,1},nil, MainActorDis ,0,90,-1);--�G�HA
	ActorNPC[3][2] = CreateObj( ActorNPC[3][1] ,x,y,z,d,1)
	ActorNPC[3][3]={x,y,z,d}
	LuaS_118387_ActorInit( ActorNPC[3][2] )
	x,y,z,d=kg_GetPosRX( ActorNPC[3][2] ,nil,SubActorDis,0,90,-3 );--�G�HB
	ActorNPC[4][2]=CreateObj( ActorNPC[4][1] ,x,y,z,d,1)
	ActorNPC[4][3]={x,y,z,d}
	LuaS_118387_ActorInit( ActorNPC[4][2] )
	x,y,z,d=kg_GetPosRX( ActorNPC[3][2] , nil ,SubActorDis,0,-90,-3 );--�G�HC
	ActorNPC[5][2]=CreateObj( ActorNPC[5][1] ,x,y,z,d,1)
	ActorNPC[5][3]={x,y,z,d}
	LuaS_118387_ActorInit( ActorNPC[5][2] )
	x,y,z,d=kg_GetPosRX( {FlagID,1} , nil , MainActorDis ,0,-90,-1 );--�R���HA
	ActorNPC[6][2]=CreateObj( ActorNPC[6][1] ,x,y,z,d,1)
	ActorNPC[6][3]={x,y,z,d}
	LuaS_118387_ActorInit( ActorNPC[6][2] )
	x,y,z,d=kg_GetPosRX( ActorNPC[6][2] , nil ,SubActorDis,0,90,-3 );--�R���HB
	ActorNPC[7][2]=CreateObj( ActorNPC[7][1] ,x,y,z,d,1)
	ActorNPC[7][3]={x,y,z,d}
	LuaS_118387_ActorInit( ActorNPC[7][2] )
	x,y,z,d=kg_GetPosRX( ActorNPC[6][2] , nil ,SubActorDis,0,-90,-3 );--�R���HC
	ActorNPC[8][2]=CreateObj( ActorNPC[8][1] ,x,y,z,d,1)
	ActorNPC[8][3]={x,y,z,d}
	LuaS_118387_ActorInit( ActorNPC[8][2] )
	x,y,z,d=kg_GetPosRX( ActorNPC[1][2] ,nil,30,0,135,-3 );--���J
	ActorNPC[9][2]=CreateObj( ActorNPC[9][1] ,x,y,z,d,1)
	ActorNPC[9][3]={x,y,z,d}
	WriteRoleValue(ActorNPC[9][2],EM_RoleValue_IsWalk,0)
	LuaS_118387_ActorInit( ActorNPC[9][2] )
	
	--���󲣥ͧ�����N�����a�ݪ���
	for i in pairs(PlayerArray) do
		CancelBuff(PlayerArray[i],506098)--FadeIn FadeOut
	end
	CallPlot( NPC , "LuaQ_424287_CheckPlayer" , NPC,Bucket )--�`���@���P�_
	Sleep(20)--���ݲH�X
	
	--�}�l���
	PlayMotion( ActorNPC[1][2],ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Yell( ActorNPC[1][2], "[SC_424287_6][$SETVAR1="..GetName(ReadRoleValue(NPC,EM_RoleValue_Register6)).."]",3)--�ڭ̥��e���S�Ϥj�H[$playername]�e�X���ѫH���e�������ӳ��ݹL�F�A�ڭ̴N���حz�Ӹ`�C
	Sleep(40)
	PlayMotion( ActorNPC[2][2],ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Yell( ActorNPC[2][2],"[SC_424287_7]",3 )--�L�צp��A�J�M�o�O�L�H���ѩҬD�_���~�|�A�����ѧڭ̧Ʊ�U���H�M���Q�A����Ԫ�...
	Sleep(40)
	PlayMotion( ActorNPC[3][2] , ruFUSION_ACTORSTATE_EMOTE_ANGRY )--�G�H�b���a�e��,�L�ܥͮ�
	Yell( ActorNPC[3][2],"[SC_424287_8]",3 )--�ޡI�o�˸򦺤��Y�������b����I�����Y���F�ڭ̳o��h�H�i�O�ƹ�ڡI
	Sleep(40)
	PlayMotion( ActorNPC[7][2] , ruFUSION_ACTORSTATE_EMOTE_ANGRY )--�R���H�b���a�e��,�L�ܥͮ�
	Yell( ActorNPC[7][2], "[SC_424287_9]",3 )--�b�ݤH�ٴ����A�ڭ̦h�֧̥S���b�A�̤�W�A�o���b�N����F�b�ݤH��D�]�٤��M�I
	Sleep(40)
	SetDefIdleMotion( ActorNPC[3][2], ruFUSION_MIME_IDLE_COMBAT_1H )
	Yell( ActorNPC[3][2] ,"[SC_424287_10]",3 )--�Ӧ����b�͡I�L�ک񰮲b�I�I
	Sleep(25)
	SetDefIdleMotion( ActorNPC[7][2], ruFUSION_MIME_IDLE_COMBAT_1H )
	Yell(ActorNPC[7][2] , "[SC_424287_11]" ,3)--�i�c�I�ڱڤ~���O�b�͡I�ڭ̬O�٦a������ǡI�H���H�ڤ@�}���A�I
	Sleep(35)
	SetDefIdleMotion( ActorNPC[4][2], ruFUSION_MIME_IDLE_COMBAT_1H )
	SetDefIdleMotion( ActorNPC[5][2], ruFUSION_MIME_IDLE_COMBAT_1H )
	SetDefIdleMotion( ActorNPC[6][2], ruFUSION_MIME_IDLE_COMBAT_1H )
	SetDefIdleMotion( ActorNPC[8][2], ruFUSION_MIME_IDLE_COMBAT_1H )
	x,y,z,_=kg_GetPosRX({FlagID,1},nil,10,0,90);
	MoveDirect( ActorNPC[3][2] , x,y,z )
	x,y,z,_=kg_GetPosRX({FlagID,1},nil,10,0,-90);
	MoveDirect( ActorNPC[7][2] , x,y,z )
	x,y,z,_=kg_GetPosRX({FlagID,1});
	Yell(ActorNPC[3][2] , "[SC_424287_12]",3)--ԣ�I�䦺�I
	Yell(ActorNPC[7][2] , "[SC_424287_13]",3)--�q�I���a�I
	while 1 do
		--DebugMsg(0,0,kg_GetDis( ActorNPC[3][2],x,y,z).." , "..kg_GetDis( ActorNPC[7][2],x,y,z));
		if kg_GetDis( ActorNPC[3][2],x,y,z)<=16 and kg_GetDis( ActorNPC[7][2],x,y,z)<=16 then
			break
		end
		Sleep(10)
	end
	
	--Sleep(30)
	SetDefIdleMotion( ActorNPC[3][2], ruFUSION_MIME_IDLE_COMBAT_1H )--PlayMotion( ActorNPC[3][2] , ruFUSION_ACTORSTATE_ATTACK_1H )
	Yell(ActorNPC[3][2] , "[SC_424287_14]",3)--��W���u�N�x���W�A�A���A�I�X�N���I
	Sleep(5)
	SetDefIdleMotion( ActorNPC[7][2], ruFUSION_MIME_IDLE_COMBAT_1H )--PlayMotion( ActorNPC[7][2] , ruFUSION_ACTORSTATE_ATTACK_1H )
	Yell(ActorNPC[7][2] , "[SC_424287_15]",3)--���A���L§�A���A��߸o�I
	Sleep(5)
	CallPlot( ActorNPC[3][2],"LuaS_118387_ActorBattle",ActorNPC[3][2],ActorNPC[7][2] )--����
	
	--���J��t
	x,y,z,_= kg_GetPosRX( {FlagID,1},nil,35,0,160 )--��X�X��1���䪺�j����m
	WriteRoleValue(ActorNPC[9][2],EM_RoleValue_IsWalk,0)
	MoveDirect( ActorNPC[9][2] , x,y,z )--move�O�����m��쨺���I,�A��client�t�X,�G������move��Z������
	Sleep(10)
	Yell(ActorNPC[9][2] , "[SC_424287_16]",3)--�O�o�ˡI�N�R�I�I
	while 1 do
		--DebugMsg( 0,0,"Dis="..kg_GetDis( ActorNPC[9][2],x,y,z ) )
		if kg_GetDis( ActorNPC[9][2],x,y,z )<=15 then
			StopMove( ActorNPC[9][2],true )
			WriteRoleValue(ActorNPC[9][2],EM_RoleValue_IsWalk,1)
			--DebugMsg(0,0,"Actor92 break")
			break
		end
		Sleep(10)
	end
	
	--�R���H�Q�ڪ�t
	ActorNPC[10][2]=kg_GetPosRX( ActorNPC[2][2] ,ActorNPC[10][1],50,0,-135,-3 );--�Q��,�b�ϸ`B������
	WriteRoleValue( ActorNPC[10][2],EM_RoleValue_IsWalk,0 )
	LuaS_118387_ActorInit( ActorNPC[10][2] )
	x,y,z,_= kg_GetPosRX( {FlagID,1},nil,35,0,-150 )
	Hide(ActorNPC[10][2])
	SetModeEx(ActorNPC[10][2],EM_SetModeType_Show,false )
	WriteRoleValue( ActorNPC[10][2],EM_RoleValue_IsWalk,0 )
	Show( ActorNPC[10][2] , 0 )
	MoveDirect( ActorNPC[10][2] , x,y,z )
	Sleep(10)
	Yell( ActorNPC[10][2] , "[SC_424287_17]" ,3)--�A�̥����n�n�Ať�ڤ@���I
	WriteRoleValue(ActorNPC[3][2],EM_RoleValue_Register10,1)--�����
	while 1 do
		if kg_GetDis( ActorNPC[10][2],x,y,z )<=20 then
			StopMove( ActorNPC[10][2],true )
			--DebugMsg(0,0,"Actor102 break"  )
			break
		end
		Sleep(10)
	end
	SetDefIdleMotion(ActorNPC[7][2],ruFUSION_MIME_IDLE_STAND )
	SetDefIdleMotion(ActorNPC[3][2],ruFUSION_MIME_IDLE_STAND )
	AdjustFaceDir( ActorNPC[7][2] , ActorNPC[10][2] ,0 )
	AdjustFaceDir( ActorNPC[3][2] , ActorNPC[10][2] ,0 )
	--Sleep(15)
	PlayMotion( ActorNPC[10][2],ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Yell( ActorNPC[10][2] , "[SC_424287_18]" ,3 )--�j�a�N�R�@�I�A���ڭ̳��Q���뵹�X���F�I
	Sleep(30)
	PlayMotion( ActorNPC[10][2],ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Yell( ActorNPC[10][2] , "[SC_424287_19]",3  )--�o���Ԫ��O�H���ާ@���U�ҳy�����A�ڱڸ�[SC_ZONE20_01]���u�O�Q�Q�ΤF�C
	Sleep(35)
	PlayMotion( ActorNPC[10][2],ruFUSION_ACTORSTATE_EMOTE_POINT )
	Yell( ActorNPC[10][2] , "[SC_424287_32]"  ,3)--�A�̬ݡA�o���O�ڦn���e�����o���A���ĺ��h��D�˦L�����I
	Sleep(35);
	PlayMotion( ActorNPC[10][2],ruFUSION_ACTORSTATE_EMOTE_SPEAK );
	Yell( ActorNPC[10][2] , "[SC_424287_33]",3  );--�o���O�n�ڰꪺ[118310]�t�X�e���Ѩ��Q�ꪺ�t�������A�����ڰ�֥D�A�ڭӤH�]�Q��쨫�A�t�I����D�R�I�ڭ̳��O�o���Ѫ����`�̡I
	Sleep(45);
	PlayMotion( ActorNPC[10][2],ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Yell( ActorNPC[10][2] , "[SC_424287_20]" ,3 )--�ڳQ�쨫���o�q�����A�Ʀܿ˲��ظ@�L�̴_�������������ǥH���СA�ټJ���ڭ̥u�O����ާ˪��M���I
	Sleep(40)
	PlayMotion( ActorNPC[10][2],ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Yell( ActorNPC[10][2] , "[SC_424287_21]",3  )--�u�����ĤH�O�ĺ��h���I���u�B�̡ͭA�ڤH�̡A�A���ٷQ�~�򥴶ܡH
	AdjustFaceDir( ActorNPC[10][2] , ActorNPC[3][2] ,0 )--�Q����V
	Sleep(20);
	AdjustFaceDir( ActorNPC[10][2] , ActorNPC[7][2] ,0 )--�Q����V
	Sleep(20);
	
	PlayMotion( ActorNPC[7][2],ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Yell( ActorNPC[7][2] , "[SC_424287_22]",3 )--�o...[118311]�j�H�����ܡA����O�S�����D�A�i�c�I��b�O�뤣�o�N���ǤH�O�i����̡C
	Sleep(35)
	PlayMotion( ActorNPC[3][2],ruFUSION_ACTORSTATE_EMOTE_ANGRY )
	Yell( ActorNPC[3][2] , "[SC_424287_23]",3 )--�S�ϵ����H�̤]�o�򻡡A�p�G�o�O�u���A��b�O�i�c�ܷ��ڡI
	SetDefIdleMotion(ActorNPC[4][2],ruFUSION_MIME_IDLE_STAND )
	SetDefIdleMotion(ActorNPC[5][2],ruFUSION_MIME_IDLE_STAND )
	SetDefIdleMotion(ActorNPC[7][2],ruFUSION_MIME_IDLE_STAND )
	SetDefIdleMotion(ActorNPC[8][2],ruFUSION_MIME_IDLE_STAND )
	Sleep(30)
	PlayMotion( ActorNPC[5][2],ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Yell( ActorNPC[9][2] , "[SC_424287_24]",3 )--��������A���~�򥴤U�h�]�S�n�B�ڡI�A�̴N��b�o�ॴ�����A���S����ܨǤ���ڡH�I
	Sleep(35)
	PlayMotion( ActorNPC[2][2],ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Yell( ActorNPC[2][2] , "[SC_424287_34]",3 )--�A���~�򥴤U�h�A���h���P�񤣷|�^�ӡA���a���F��|�w���A���ӧ�u�|�y��h��A���h��h�٦񪺡I
	Sleep(35)
	PlayMotion( ActorNPC[1][2],ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Yell( ActorNPC[1][2] , "[SC_424287_35]" ,3)--�ѧg�A���_���ۼޥ�����A�]��U���ۧ�諸�٧a�I�ڭ��٦����ܻP���ɪ����|�r�I
	Sleep(40)
	AdjustFaceDir( ActorNPC[3][2] , ActorNPC[5][2] ,0 )
	AdjustFaceDir( ActorNPC[7][2] , ActorNPC[7][2] ,0 )
	Sleep(15)
	AdjustFaceDir( ActorNPC[3][2] , ActorNPC[4][2] ,0 )
	AdjustFaceDir( ActorNPC[7][2] , ActorNPC[8][2] ,0 )
	Sleep(15)
	AdjustFaceDir(ActorNPC[7][2],ActorNPC[3][2],0)--�R���HA�ݦV�G�HA
	AdjustFaceDir(ActorNPC[3][2],ActorNPC[7][2],0)--�G�HA�ݦV�R���HA
	Sleep(20)
	PlayMotion( ActorNPC[7][2] , ruFUSION_ACTORSTATE_EMOTE_THINK )--���Y...!?
	Yell( ActorNPC[7][2], "[SC_424287_26]" ,3)--�p�G��ϸ`�P�S�Ϥj�H�����@�ˡA���ڥi�H���A��b...[SC_ZONE20_01]�ʤ�......
	Sleep(35)
	PlayMotion( ActorNPC[3][2] , ruFUSION_ACTORSTATE_EMOTE_ANGRY );--�y��
	Yell( ActorNPC[3][2] , "[SC_424287_27]",3 )--�ڤ]���O�³J�I�J�M���D�O�ĤT�̪����ѡA�Z���~�򥴤U�h���D�z�I
	Sleep(30)
	PlayMotion( ActorNPC[4][2],ruFUSION_ACTORSTATE_EMOTE_SPEAK );
	Yell( ActorNPC[4][2] , "[SC_424287_36]",3 );--�کM�N�x���N�O�ӻ�D�����Ԥ��N�ӨӡA�u�O�����D�ج�����O���Q��?
	Sleep(35);
	PlayMotion( ActorNPC[6][2],ruFUSION_ACTORSTATE_EMOTE_SPEAK );
	Yell( ActorNPC[6][2] , "[SC_424287_37]",3 );--�J�M�o�O���Q�\�G���Ԫ��A�ڭ̴N�S�������z�ѤF�I�u�O�����h���ڤH�P�줣�ȰڡI���F�קK��h���묹�A�ڭ̴N���ԧa�I
	Sleep(40);
	
	for i in pairs(PlayerArray) do
		AddBuff( PlayerArray[i] , 509824,0,-1 )--���buff
		ScriptMessage(PlayerArray[i],PlayerArray[i],2,"[SC_424287_30]","0xffff0000" )--�P�D�T�_�@���x�n...
	end
	for i=1,8 do
		if i~=3 and i~=6 then
			PlayMotion( ActorNPC[i][2] , ruFUSION_ACTORSTATE_EMOTE_APPLAUSE )
			Sleep( math.random(3,10) )
		end
	end
	for i=1,8 do
		PlayMotion( ActorNPC[i][2] , ruFUSION_ACTORSTATE_EMOTE_APPLAUSE )
	end
	Sleep(20)
	PlayMotion( ActorNPC[7][2] , ruFUSION_MIME_EMOTE_ANGRY )
	Yell( ActorNPC[7][2] ,"[SC_424287_28]",3  )--�{�b���ĤH�ݰ_�ӬO�ĺ��h�������b�̡I�γ\�ڭ̸ӦA�Q�צp���L�̭n�Ӹ����I
	Sleep(35)
	PlayMotion( ActorNPC[3][2] , ruFUSION_MIME_EMOTE_ANGRY )
	Yell( ActorNPC[3][2] ,"[SC_424287_29]",3  )--���������N��L�̩�X�ӥ��I�ڭ̥��^�h�[���F�A���e���b�A�Ȯɥ���O�b�L���Y�W�a�I
	Sleep(35)
	AdjustDir( ActorNPC[3][2],180 )
	AdjustDir( ActorNPC[7][2],180 )
	Sleep(15)
	for i=3,9 do
		move( ActorNPC[i][2], ActorNPC[i][3][1], ActorNPC[i][3][2] , ActorNPC[i][3][3] )
	end
	Sleep(10)
	
	--�t������,���a�H�J
	for i in pairs(PlayerArray) do
		AddBuff(PlayerArray[i] ,506098,0,-1)--FadeIn FadeOut
	end
	Sleep(10)--���ݲH�J
	--�R����tNPC
	for i in pairs(ActorNPC) do
		if ActorNPC[i][2]~=nil then
			DelObj(ActorNPC[i][2])
			ActorNPC[i][2]=nil
		end
	end
	Sleep(20)--����Client����
	--�������a���y�P�Mbuff
	for i in pairs(PlayerArray) do
		if CheckAcceptQuest( PlayerArray[i], 424287 )==true and CheckBuff( PlayerArray[i] , 509736 )==true and CheckBuff( PlayerArray[i] , 503977 )==true then
			SetFlag( PlayerArray[i],545065,1 )--���X��
		end
		CancelBuff(PlayerArray[i],509824)--���buff
		CancelBuff(PlayerArray[i],503977)--�ĨĬ���
		CancelBuff(PlayerArray[i],506098)--FadeIn FadeOut
		CancelBuff(PlayerArray[i],509736)--�ݪ�t�P�wbuff
	end
	DelObj(Bucket)
	--Say(NPC,"End...")
end

function LuaS_118387_ActorBattle( Actor1 , Actor2 )--�t������
	DebugMsg(0,0,"ActorBattle Start")
	while 1 do
		if ReadRoleValue(Actor1,EM_RoleValue_Register10)==0 then
			PlayMotion( Actor1 , ruFUSION_ACTORSTATE_ATTACK_1H )
		else
			DebugMsg(0,0,"ActorBattle End")
			break
		end
		Sleep(10)
		PlayMotion( Actor2 , ruFUSION_ACTORSTATE_ATTACK_1H )
	end
end

function LuaS_118387_ActorInit( Actor )--���ͺt��
	table.insert( Lua_Zone20_424287_QuestObj.Obj , Actor );
	MoveToFlagEnabled( Actor, false )
	WriteRoleValue( Actor, EM_RoleValue_IsWalk, 1 )--����
	SetModeEx( Actor , EM_SetModeType_Strikback , false )	-- ����
	SetModeEx( Actor , EM_SetModeType_Fight, false )		-- �i�������
	SetModeEx( Actor , EM_SetModeType_Searchenemy , false )	-- ����
	SetModeEx( Actor , EM_SetModeType_Mark , false )	-- �аO
	SetModeEx( Actor , EM_SetModeType_HideName , false )
	SetModeEx( Actor , EM_SetModeType_ShowRoleHead , false )-- �Y����
	SetModeEx( Actor , EM_SetModeType_NotShowHPMP , true )	-- ����ܦ��
	AddToPartition(Actor,0)
end

function LuaS_118387_PlayerApplause()--���a���F�|���x
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_APPLAUSE )
	return true
end

function LuaS_118387_PlayerVictory()--���a���F�|�w�I
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_VICTORY )
	return true
end