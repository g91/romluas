---------------------------------------424216-------------------------------------------
function LuaS_118277_1()
	local Player = OwnerID();
	local NPC = TargetID();
	LoadQuestOption(Player);
	if CheckAcceptQuest(Player,424216)==true and ReadRoleValue(NPC,EM_RoleValue_Register10)==0 and CheckFlag( Player,545103 )~=true then
		AddSpeakOption( Player, NPC, "[SC_424216_07]", "LuaS_118277_2",0 );--�u�j�N�x�v�����Ʊ�A�ɧֱҵ{�X�Ϧw�溸�A�i���Y�N�l�}�{�ɻ�D��|ĳ�@�ơC
	end
end

function LuaS_118277_2()
	local Player = OwnerID();
	local NPC = TargetID();
	if ReadRoleValue(NPC,EM_RoleValue_Register10)==0 then
		WriteRoleValue(NPC,EM_RoleValue_Register10,1);
		CallPlot(NPC,"Lua_118277_Show",NPC,Player );
	end
	CloseSpeak(Player);
end

function Lua_118277_Show( NPC ,Player )
	local RoomID = ReadRoleValue(NPC, EM_RoleValue_RoomID);
	--���ͼ@��������,�@���N���|���b�쥻��NPC���W
	local Ctrl=OwnerID();
	if ReadRoleValue( Ctrl , EM_RoleValue_OrgID )~=117201 then
		if type(Lua_Zone20_QuestObj)~="table" then
			Lua_Zone20_QuestObj={};
		end
		Lua_Zone20_QuestObj[424216]={};
		local Ctrl = kg_GetPosRX( NPC , 117201 );
		table.insert( Lua_Zone20_QuestObj[424216] , Ctrl );
		kg_InvisibleObjInit(Ctrl);
		AddToPartition( Ctrl , RoomID );
		CallPlot(Ctrl,"Lua_118277_Show",NPC,Player );
		return
	end
	--�`���ˬd������Ȫ��A
	CallPlot( NPC , "ks_QuestAddBuff" , 424216, 545103, 509848, 150, "LuaQ_424216_ShowEnd"  );
	--���ͪ�tNPC
	local NPCA = kg_GetPosRX( NPC, 118280 );
	table.insert( Lua_Zone20_QuestObj[424216] , NPCA );
	kg_ActorInit( NPCA );
	SetModeEx( NPCA , EM_SetModeType_Mark, false)	----�i�I��(�_)
	SetModeEx( NPCA , EM_SetModeType_ShowRoleHead, false) 	---�Y����(�_)
	AddToPartition(NPCA,RoomID);
	local NPCB = kg_GetPosRX( Zone20_kg_QuestNPC[118279] , 118281 );--�˶����S�D�w�o���S
	table.insert( Lua_Zone20_QuestObj[424216] , NPCB );
	kg_ActorInit( NPCB );
	SetModeEx( NPCB , EM_SetModeType_Mark, false)	----�i�I��(�_)
	SetModeEx( NPCB , EM_SetModeType_ShowRoleHead, false) 	---�Y����(�_)
	AddToPartition(NPCB,RoomID);
	
	Sleep(10);
	AdjustFaceDir( NPCA , Player,0 );
	Sleep(20);
	PlayMotion( NPCA,ruFUSION_ACTORSTATE_EMOTE_SPEAK );
	NPCSay( NPCA , "[SC_424216_ACT_01]" );--�X�B�X�Ϧw�溸�H�ɧֱҵ{�H�i�B�i�O......
	Sleep(30);
	AdjustFaceDir( NPCB , NPCA,0 );
	Sleep(20)
	PlayMotion( NPCB,ruFUSION_ACTORSTATE_EMOTE_SPEAK );
	NPCSay(NPCB,"[SC_424216_ACT_02]");	--�u����...
	Sleep(20);
	PlayMotion( NPCA,ruFUSION_ACTORSTATE_SLUMBER_BEGIN );
	NPCSay(NPCA,"[SC_424216_ACT_03]");	--��...�ک��դF...�ڷ|�ߨ�ǳƪ�......(2s)
	Sleep(30);
	AdjustFaceDir(NPCA,NPCB,0);
	Sleep(20);
	PlayMotion( NPCA,ruFUSION_ACTORSTATE_EMOTE_SPEAK );
	NPCSay(NPCA,"[SC_424216_ACT_04]");	--�p���F�ڡA�e�X�ѩ�����f�ƦܤU���F�ɡA���ѫo�y�����a�P�ڨ����A��H���ڧ�......(4s)
	Sleep(50);
	PlayMotion( NPCA,ruFUSION_ACTORSTATE_EMOTE_CRY );
	NPCSay(NPCA,"[SC_424216_ACT_05]");	--�p�������U�|�Q�p�V�ҵo�{���M�I�A�u�@�M�ڦb�@�_�A��...
	Sleep(30);
	PlayMotion( NPCB,ruFUSION_ACTORSTATE_EMOTE_CRY );
	NPCSay(NPCB,"[SC_424216_ACT_06]");	--�O�A���F�A�u����......
	Sleep(30);
	PlayMotion( NPCA,ruFUSION_ACTORSTATE_EMOTE_APPROVAL );
	NPCSay(NPCA,"[SC_424216_ACT_07]");	--�p�n���ڦ^�ӰڡA�ڬ��R���˶����S�I(���ܰʧ@)���ާڭ̬۹j�h���A�ڤ]�|�@���R�۩p���I
	Sleep(20);
	PlayMotion( NPCA ,ruFUSION_ACTORSTATE_EMOTE_SPEAK );
	Sleep(30);
	SetDefIdleMotion(NPCB , ruFUSION_MIME_EMOTE_CRY );--�@����
	NPCSay(NPCB, "[SC_424216_ACT_08]");	--��......�u���ǡI�I������A�O�u���ǡI�I
	Sleep(30);
	ks_QuestEnd( 424216, 545103, 509848, 150 );
end

function LuaQ_424216_ShowEnd( NPC )
	NPC = NPC or OwnerID();
	for i in pairs( Lua_Zone20_QuestObj[424216] ) do
		DelObj( Lua_Zone20_QuestObj[424216][i] );
	end;
	Lua_Zone20_QuestObj[424216]=nil;
	WriteRoleValue(NPC,EM_RoleValue_Register10,0);
end

function Lua_kg_Z20_GeneralNpcBorn()--�q�ΥX�ͼ@��
	local NPC  = OwnerID()
	local OrgID = ReadRoleValue(NPC,EM_RoleValue_OrgID);
	--Say(NPC,"OrgID="..OrgID);
	if Zone20_kg_QuestNPC==nil then
		Zone20_kg_QuestNPC = {};
	end
	Zone20_kg_QuestNPC[OrgID]=NPC;
end

--------------------------------------424218------------------------------------
function LuaQ_424218_RangeCheckBurn()--
	SetPlot(OwnerID(),"range",  "LuaQ_424218_RangeCheck" , 40);
end

function LuaQ_424218_RangeCheck()--���a�����Ȯ� , �@�X�X�f�N�ݤ�������
	local Player = OwnerID();
	if CheckAcceptQuest(Player,424218)==true and CheckFlag( Player,545106 )~=true then
		SetFlag( Player , 545227 , 1 );--�ݤ�������!!
	end
end

function LuaS_118442_1()
	local Player = OwnerID();
	local NPC = TargetID();--�����j�N�x
	LoadQuestOption(Player);
	if CheckAcceptQuest(Player,424218)==true and ReadRoleValue(NPC,EM_RoleValue_Register10)==0 and CheckFlag( Player,545106 )~=true then
		AddSpeakOption( Player, NPC, "[SC_424218_01]", "LuaS_118442_2",0 );--�ڤw�g�N�Ҧ��Ʊ��ǳƦn�F�C
	end
end

function LuaS_118442_2()
	local Player = OwnerID();
	local NPC = TargetID();--�����j�N�x
	if ReadRoleValue(NPC,EM_RoleValue_Register10)==0 then
		WriteRoleValue(NPC,EM_RoleValue_Register10,1);
		CallPlot(NPC,"Lua_118442_Show",NPC,Player );
	end
	CloseSpeak(Player);
end

function Lua_118442_Show(NPC,Player)
	local RoomID = ReadRoleValue(NPC, EM_RoleValue_RoomID);
	--���ͼ@��������,�@���N���|���b�쥻��NPC���W
	local Ctrl=OwnerID();
	if ReadRoleValue( Ctrl , EM_RoleValue_OrgID )~=117201 then
		if type(Lua_Zone20_QuestObj)~="table" then
			Lua_Zone20_QuestObj={};
		end
		Lua_Zone20_QuestObj[424218]={};
		local Ctrl = kg_GetPosRX( NPC , 117201 );
		table.insert( Lua_Zone20_QuestObj[424218] , Ctrl );
		kg_InvisibleObjInit(Ctrl);
		AddToPartition( Ctrl , RoomID );
		CallPlot(Ctrl,"Lua_118442_Show",NPC,Player );
		return
	end
	--���ͺt��
	local FlagID = 780954;
			--{OrgID , Gid , ���ʶ��� }
	local Actor = {	{118407,0,{1,1,2,26} },		--����		01,01,02,26
			{118410,0,{3,4,5,27} },		--�ǿ�		03,04,05,27
			{118411,0,{6,7,8,28} },		--������	06,07,08,28
			{118412,0,{9,10,11,30} },	--�e���R	09,10,14,30
			{118413,0,{12,13,14,29} },	--�ä�		12,13,11,29
			{118414,0,{24,25,31,32} },	--�_��		24,25,31,32
			{118409,0,{15,16,17} },	--����		15,16,17
			{118408,0,{18,19,20} },	--��Z�g	18,19,20
			{118415,0,{21,22,23} }	--�d����	21,22,23
			};
	--�`���ˬd������Ȫ��A
	CallPlot( NPC , "ks_QuestAddBuff" , 424218, 545106, 509849, 300, "LuaQ_424218_ShowEnd"  );
	local x,y,z;
	for i =1,6 do
		Actor[i][2]=kg_GetPosRX({ FlagID,Actor[i][3][1] },Actor[i][1] );
		table.insert( Lua_Zone20_QuestObj[424218] , Actor[i][2] );
		kg_ActorInit( Actor[i][2] );
		SetModeEx( Actor[i][2] , EM_SetModeType_Mark, false)	----�i�I��(�_)
		SetModeEx( Actor[i][2] , EM_SetModeType_ShowRoleHead, false) 	---�Y����(�_)
		AddToPartition(Actor[i][2],RoomID);
	end
	for i=2,6 do
		x,y,z,_ = kg_GetPosRX( {FlagID,Actor[i][3][2]} );
		Move(Actor[i][2],x,y,z);
	end
	
	Sleep(60);
	NPCSay( Actor[1][2],"[SC_424218_ACT_01]" );--�U��@���W���W�F�A�{�b�N�P�ڤ@�P�i���a�C
	Sleep(30);
	for i =1,6 do
		x,y,z,_ = kg_GetPosRX( {FlagID,Actor[i][3][3]} );
		Move(Actor[i][2],x,y,z);
	end
	--�����l��
	for i=7,9 do
		Actor[i][2]=kg_GetPosRX({ FlagID,Actor[i][3][1] },Actor[i][1] );
		table.insert( Lua_Zone20_QuestObj[424218] , Actor[i][2] );
		kg_ActorInit( Actor[i][2] );
		SetModeEx( Actor[i][2] , EM_SetModeType_Mark, false)	----�i�I��(�_)
		SetModeEx( Actor[i][2] , EM_SetModeType_ShowRoleHead, false) 	---�Y����(�_)
		AddToPartition(Actor[i][2],RoomID);
		x,y,z,_ = kg_GetPosRX( {FlagID,Actor[i][3][2]} );
		Move(Actor[i][2],x,y,z);
	end
	Sleep(15);
	NPCSay(Actor[7][2],"[SC_424218_ACT_02]"); --�����H�A���|�b�o�̡H
	PlayMotion( Actor[7][2],ruFUSION_ACTORSTATE_EMOTE_POINT );
	Sleep(20);
	for i=1,6 do
		AdjustFaceDir( Actor[i][2],Actor[7][2] ,0 );
	end
	Sleep(10);
	PlayMotion(Actor[1][2],ruFUSION_ACTORSTATE_EMOTE_SALUTE);--�q§
	NPCSay(Actor[1][2] , "[SC_424218_ACT_03]");--���U�A�ڨӦ��O�ﱵ�U���D�A�S�Q��z�]�b���ɦ^���C
	Sleep(30);
	PlayMotion( Actor[7][2],ruFUSION_ACTORSTATE_EMOTE_SPEAK );
	NPCSay(Actor[7][2],"[SC_424218_ACT_04]" );--��...�q�w�溸�Ӫ��o��O...�H
	Sleep(30);
	PlayMotion( Actor[4][2],ruFUSION_ACTORSTATE_EMOTE_SPEAK );
	NPCSay(Actor[4][2],"[SC_424218_ACT_05]");--���U�A�ڬO�ԮL�R���k��e���R�C
	Sleep(30);
	NPCSay(Actor[4][2],"[SC_424218_ACT_06]");--���˦��n�Ʀb���A�ҥH�N�b�~���媺�ڥl�^�A�N���o�ѻP�|ĳ�C
	Sleep(30);
	PlayMotion( Actor[7][2],ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD );
	NPCSay(Actor[7][2],"[SC_424218_ACT_07]");--��Ӧp���C
	Sleep(30);
	NPCSay(Actor[1][2],"[SC_424218_ACT_08]");--�U��Ф@�P�i�c�A�y���𮧧a�C
	Sleep(30);
	for i =1,9 do
		if i<7 then
			x,y,z,_ = kg_GetPosRX( {FlagID,Actor[i][3][4]} );
		else
			x,y,z,_ = kg_GetPosRX( {FlagID,Actor[i][3][3]} );
		end
		Move(Actor[i][2],x,y,z);
	end
	Sleep(10);
	local PlayerArray = SearchRangePlayer( NPC, 300 );
	for i =0 , #PlayerArray-1 do
		if CheckAcceptQuest(PlayerArray[i],424218)==true and CheckBuff(PlayerArray[i],509849)==true and kg_GetDis(PlayerArray[i],FlagID,1)<=250 then
			SetFlag( PlayerArray[i],545106 , 1 );--�������y
			SetFlag( PlayerArray[i] , 545227 , 0 );
		end
	end
end

function LuaQ_424218_ShowEnd(NPC)
	NPC = NPC or OwnerID();
	for i in pairs( Lua_Zone20_QuestObj[424218] ) do
		DelObj( Lua_Zone20_QuestObj[424218][i] );
	end;
	Lua_Zone20_QuestObj[424218]=nil;
	WriteRoleValue(NPC,EM_RoleValue_Register10,0);
end

-----------------------------------------------424219--------------------------------------------------------
function LuaS_118264_1()
	local Player = OwnerID();
	local NPC = TargetID();--��Z�g�D�N���S
	LoadQuestOption(Player);
	if CheckAcceptQuest(Player,424219)==true and CheckFlag( Player,545107 )~=true then
		if ReadRoleValue(NPC,EM_RoleValue_Register10)==0 then
			AddSpeakOption( Player, NPC, "[SC_424219_01]", "LuaS_118264_2",0 );--�ڤw�g�ǳƦn�ѻP�|ĳ�F�C
		else
			local Message = "[SAY_NPC_BUSY_02][$SETVAR1="..GetName(NPC).."]";
			ScriptMessage( Player, Player, 1,Message, 0 );--[$VAR1]���b���L���A�еy��A���դ@���C
		end
	elseif CheckAcceptQuest(Player,424221)==true  and CheckFlag( Player,545112 )~=true then
		if ReadRoleValue(NPC,EM_RoleValue_Register9)==0 then
			AddSpeakOption( Player, NPC, "[SC_424219_01]", "LuaS_118264_3",0 );--�ڤw�g�ǳƦn�ѻP�|ĳ�F�C
		else
			local Message = "[SAY_NPC_BUSY_02][$SETVAR1="..GetName(NPC).."]";
			ScriptMessage( Player, Player, 1,Message, 0 );--[$VAR1]���b���L���A�еy��A���դ@���C
		end
	elseif CheckAcceptQuest(Player,424222)==true and CheckFlag( Player,545113 )~=true then
		if ReadRoleValue(NPC,EM_RoleValue_Register8)==0 then
			AddSpeakOption( Player, NPC, "[SC_424222_01]", "LuaS_118264_4",0 );--�ڤw�ǳƦn�F�C
		else
			local Message = "[SAY_NPC_BUSY_02][$SETVAR1="..GetName(NPC).."]";
			ScriptMessage( Player, Player, 1,Message, 0 );--[$VAR1]���b���L���A�еy��A���դ@���C
		end
	end
end

function LuaS_118264_2()
	local Player = OwnerID();
	local NPC = TargetID();--��Z�g�D�N���S
	if ReadRoleValue(NPC,EM_RoleValue_Register10)==0 then
		WriteRoleValue(NPC,EM_RoleValue_Register10,1);
		CallPlot(NPC,"Lua_118264_Show",NPC,Player );
	end
	CloseSpeak(Player);
end

function Lua_118264_Show(NPC,Player)
	local FlagID = 780955;
	local RoomID = ReadRoleValue(NPC, EM_RoleValue_RoomID);
	--���ͼ@��������,�@���N���|���b�쥻��NPC���W
	local Ctrl=OwnerID();
	if ReadRoleValue( Ctrl , EM_RoleValue_OrgID )~=117201 then
		if type(Lua_Zone20_QuestObj)~="table" then
			Lua_Zone20_QuestObj={};
		end
		Lua_Zone20_QuestObj[424219]={};
		local Ctrl = kg_GetPosRX( NPC , 117201 );
		--table.insert( Lua_Zone20_QuestObj[424219] , Ctrl );
		WriteRoleValue( Ctrl , EM_RoleValue_Register1 , NPC );--�@���������O��NPC
		kg_InvisibleObjInit(Ctrl);
		AddToPartition( Ctrl , RoomID );
		CallPlot(Ctrl,"Lua_118264_Show",NPC,Player );
		return
	end
	
	local Actor = {	{118416,0,Zone20_kg_QuestNPC[114367]},	--����
			{118417,0,Zone20_kg_QuestNPC[118264]},	--��Z�g
			{118418,0,{FlagID,1}},				--�d�Ժ�
			{118419,0,{3,4}},				--�ǿ�
			{118420,0,{5,6}},				--������
			{118421,0,{7,8}},				--�e���R
			{118422,0,{9,10}},				--�ä�
			{118423,0,{11,12}},				--�_��
			{118424,0,{13,14}},				--�ɥ���
			};
			
	--�`���ˬd������Ȫ��A
	CallPlot( Ctrl , "ks_QuestAddBuff" , 424219, 545107, 509850, 300, "LuaQ_424219_ShowEnd"  );
	local x,y,z;
	for i =1,3 do
		Actor[i][2]=kg_GetPosRX( Actor[i][3],Actor[i][1] );
		table.insert( Lua_Zone20_QuestObj[424219] , Actor[i][2] );
		kg_ActorInit( Actor[i][2] );
		SetModeEx( Actor[i][2] , EM_SetModeType_Mark, false)	----�i�I��(�_)
		SetModeEx( Actor[i][2] , EM_SetModeType_ShowRoleHead, false) 	---�Y����(�_)
		AddToPartition(Actor[i][2],RoomID);
	end
	for i =4,#Actor do
		x,y,z,_ = kg_GetPosRX( {FlagID,Actor[i][3][2]} );
		Actor[i][2]=kg_GetPosRX(  {FlagID,Actor[i][3][1] },Actor[i][1] );
		table.insert( Lua_Zone20_QuestObj[424219] , Actor[i][2] );
		kg_ActorInit( Actor[i][2] );
		SetModeEx( Actor[i][2] , EM_SetModeType_Mark, false)	----�i�I��(�_)
		SetModeEx( Actor[i][2] , EM_SetModeType_ShowRoleHead, false) 	---�Y����(�_)
		AddToPartition(Actor[i][2],RoomID);
		Move(Actor[i][2],x,y,z);
	end
	Sleep(60);--����NPC����w��
	FaceFlag ( Actor[9][2], FlagID , 2 );
	AdjustDir( Actor[9][2], 0 );
	PlayMotion( Actor[3][2],ruFUSION_ACTORSTATE_EMOTE_SPEAK );
	Yell(Actor[3][2], "[SC_424219_ACT_01]",3 );--�U��A�ڬ۫H�ڭ̫ܲM���{�b���{���M���C
	Sleep(30);
	PlayMotion( Actor[3][2],ruFUSION_ACTORSTATE_EMOTE_SPEAK );
	Yell(Actor[3][2], "[SC_424219_ACT_02]",3 );--��R���ȡE��Ԥ����p���̡B�Z�å̦ͪw��A�ӳo�Ǩƥ󪺭I��A�ڵo�{���ӤH�b�ޱ��o�@���C
	Sleep(40);
	PlayMotion( Actor[3][2],ruFUSION_ACTORSTATE_EMOTE_SPEAK );
	Yell(Actor[3][2], "[SC_424219_ACT_03]",3 );--�L�O�оɦ�R���Ⱦޱ�����޳N���H�A�Q�o�L�٬��u�Ѯv�v�C
	Sleep(30);
	PlayMotion( Actor[3][2],ruFUSION_ACTORSTATE_EMOTE_SPEAK );
	Yell(Actor[3][2], "[SC_424219_ACT_04]",3 );--�o��u�Ѯv�v���ȱN�a�ӧ�j�����D�A�ڭ̥����ߧY�ѨM�o�ӫ¯١A�T�O�l�����M���C
	Sleep(40);
	PlayMotion( Actor[3][2] , ruFUSION_ACTORSTATE_EMOTE_APPROVAL  );--�٦P
	Yell(Actor[3][2], "[SC_424219_ACT_05]",3 );--�ЦU��N�A�̪��x���ɵ��ڡA�ߨ豽���o���Ƶ��ͩR���c�̡I
	Sleep(30)
	AdjustFaceDir( Actor[1][2],Actor[3][2],0 );
	Sleep(15);
	PlayMotion( Actor[1][2],ruFUSION_ACTORSTATE_EMOTE_SPEAK );
	Yell(Actor[1][2], "[SC_424219_ACT_06]",3 );--�T�M�X�L�u�|������D�A�ګ�ĳ�Ƚw�X�L�@�ơC
	Sleep(10);
	AdjustFaceDir( Actor[3][2],Actor[1][2],0 );
	Sleep(20);
	Yell(Actor[3][2], "[SC_424219_ACT_07]",3 );--��.....
	Sleep(30);
	AdjustFaceDir( Actor[9][2],Actor[3][2],0 );
	Sleep(15)
	PlayMotion( Actor[9][2],ruFUSION_ACTORSTATE_EMOTE_SPEAK );
	Yell(Actor[9][2], "[SC_424219_ACT_08]",3 );--�ڷQ�|���D�ਮ�ҹy�A�󤣥��Ȱ��|ĳ�A�y�������H
	Sleep(10);
	AdjustFaceDir( Actor[3][2],Actor[9][2],0 );
	Sleep(20);
	PlayMotion( Actor[3][2], ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD );
	Yell(Actor[3][2], "[SC_424219_ACT_09]" ,3 );--�N�ӦѮv�����a�U�쨯�W�F�C
	Sleep(10)
	FaceFlag ( Actor[3][2], FlagID , 2 );
	AdjustDir( Actor[3][2], 0 );
	Sleep(30);
	for i=4,#Actor do
		x,y,z,_ = kg_GetPosRX( {FlagID,Actor[i][3][1]} );
		Move(Actor[i][2],x,y,z);
	end
	Sleep(20);
	for i=4,8 do
		DelObj(Actor[i][2]);
	end
	Tell( Player , Actor[9][2]  , "[SC_424219_TIP_01]" );--�ɥ��������a��A���G�L�ӧ�ڤ@�U�A�ڴN�b���c�Ǥ����B�C
	Sleep(15);
	local PlayerArray = SearchRangePlayer( NPC, 300 );
	for i =0 , #PlayerArray-1 do
		if CheckAcceptQuest(PlayerArray[i],424219)==true and CheckBuff(PlayerArray[i],509850)==true and kg_GetDis(PlayerArray[i],FlagID , 2  )<=240 then
			SetFlag( PlayerArray[i],545107 , 1 );--�������y
		end
	end
	Sleep(15);
	--[[
	CancelBuff(Player, 509850);
	DelObj(Actor[1][2]);
	DelObj(Actor[2][2]);
	DelObj(Actor[3][2]);
	DelObj(Actor[9][2]);
	WriteRoleValue(NPC,EM_RoleValue_Register10,0);
	]]
end

function LuaQ_424219_ShowEnd()
	local Ctrl = OwnerID();
	local NPC = ReadRoleValue( Ctrl , EM_RoleValue_Register1 );
	for i in pairs( Lua_Zone20_QuestObj[424219] ) do
		DelObj( Lua_Zone20_QuestObj[424219][i] );
	end;
	Lua_Zone20_QuestObj[424219]=nil;
	WriteRoleValue(NPC,EM_RoleValue_Register10,0);
	Sleep(5); DelObj(Ctrl);
end

----------------------------------424221----------------------------------
function LuaS_118264_3()
	local Player = OwnerID();
	local NPC = TargetID();--��Z�g�D�N���S
	if ReadRoleValue(NPC,EM_RoleValue_Register9)==0 then
		WriteRoleValue(NPC,EM_RoleValue_Register9,1);
		CallPlot(NPC,"Lua_118264_Show2",NPC,Player );
	end
	CloseSpeak(Player);
end

function Lua_118264_Show2( NPC,Player )
	local FlagID = 780955;
	local RoomID = ReadRoleValue(NPC, EM_RoleValue_RoomID);
	--���ͼ@��������,�@���N���|���b�쥻��NPC���W
	local Ctrl=OwnerID();
	if ReadRoleValue( Ctrl , EM_RoleValue_OrgID )~=117201 then
		if type(Lua_Zone20_QuestObj)~="table" then
			Lua_Zone20_QuestObj={};
		end
		Lua_Zone20_QuestObj[424221]={};
		local Ctrl = kg_GetPosRX( NPC , 117201 );
		--table.insert( Lua_Zone20_QuestObj[424221] , Ctrl );
		WriteRoleValue( Ctrl , EM_RoleValue_Register1 , NPC );--�@���������O��NPC
		kg_InvisibleObjInit(Ctrl);
		AddToPartition( Ctrl , RoomID );
		CallPlot(Ctrl,"Lua_118264_Show2",NPC,Player );
		return
	end
	--�`���ˬd������Ȫ��A
	CallPlot( Ctrl , "ks_QuestAddBuff" , 424221, 545112, 509851, 300, "LuaQ_424221_ShowEnd"  );
	
	local Actor = {	{118425,0,Zone20_kg_QuestNPC[114367]},	--����
			{118426,0,Zone20_kg_QuestNPC[118264]},	--��Z�g
			{118427,0,{FlagID,1}},				--�d�Ժ�
			{118428,0,{3,4}},				--�ǿ�
			{118429,0,{5,6}},				--������
			{118430,0,{7,8}},				--�e���R
			{118431,0,{9,10}},				--�ä�
			{118432,0,{11,12}},				--�_��
			{118433,0,{13,14}},				--�ɥ���
			};
	local x,y,z;
	for i =1,3 do
		Actor[i][2]=kg_GetPosRX( Actor[i][3],Actor[i][1] );
		table.insert( Lua_Zone20_QuestObj[424221] , Actor[i][2] );
		kg_ActorInit( Actor[i][2] );
		SetModeEx( Actor[i][2] , EM_SetModeType_Mark, false)	----�i�I��(�_)
		SetModeEx( Actor[i][2] , EM_SetModeType_ShowRoleHead, false) 	---�Y����(�_)
		AddToPartition(Actor[i][2],RoomID);
	end
	for i =4,#Actor do
		x,y,z,_ = kg_GetPosRX( {FlagID,Actor[i][3][2]} );
		Actor[i][2]=kg_GetPosRX(  {FlagID,Actor[i][3][1] },Actor[i][1] );
		table.insert( Lua_Zone20_QuestObj[424221] , Actor[i][2] );
		kg_ActorInit( Actor[i][2] );
		SetModeEx( Actor[i][2] , EM_SetModeType_Mark, false)	----�i�I��(�_)
		SetModeEx( Actor[i][2] , EM_SetModeType_ShowRoleHead, false) 	---�Y����(�_)
		AddToPartition(Actor[i][2],RoomID);
		Move(Actor[i][2],x,y,z);
	end
	Sleep(60);--����NPC����w��
	FaceFlag ( Actor[9][2], FlagID , 2 );
	AdjustDir( Actor[9][2], 0 );
	PlayMotion( Actor[3][2],ruFUSION_ACTORSTATE_EMOTE_SPEAK );
	Yell(Actor[3][2],"[SC_424221_ACT_01]",3);--�A���l���U��A�O���󭫭n���Ʊ��ŧG�C
	Sleep(30);
	PlayMotion( Actor[3][2],ruFUSION_ACTORSTATE_EMOTE_SPEAK );
	Yell(Actor[3][2],"[SC_424221_ACT_02]",3);--�ڻP�ɥ����Ѯv�͹L�F�A���F��Գo�ӼĤH�A�ڭ̥��������V�m�C
	Sleep(40);
	PlayMotion( Actor[3][2],ruFUSION_ACTORSTATE_EMOTE_SPEAK );
	Yell(Actor[3][2],"[SC_424221_ACT_03]",3);--�o���V�m�O���F�E�o�X�U�쨭���j�N�C��^��������~�Ӫ̸Ӧ�����O�C
	Sleep(40);
	PlayMotion( Actor[3][2],ruFUSION_ACTORSTATE_EMOTE_SPEAK );
	Yell(Actor[3][2],"[SC_424221_ACT_04]",3);--�ܩ�V�m�����e�N�Ѱߤ@�P�C��^���P��L���u�����̡v�d�����M�w�C�U�쪺�N���O...�H
	Sleep(40);
	local FaceNum= kg_Rand(4,8);
	for i =4,7 do
		if i~= FaceNum then
			AdjustFaceDir( Actor[i][2] , Actor[FaceNum][2], 0 );
		end
	end
	Sleep(10)
	for i =4,7 do
		PlayMotion( Actor[i][2],ruFUSION_ACTORSTATE_EMOTE_SPEAK );
	end
	Sleep(30);
	for i =4,7 do
		AdjustFaceDir( Actor[i][2] , Actor[3][2], 0 );
	end
	Sleep(15);
	PlayMotion( Actor[4][2],ruFUSION_ACTORSTATE_EMOTE_SPEAK );
	Yell( Actor[4][2],"[SC_424221_ACT_05]",3 );--�ڭ̨S����ĳ�A���U�C
	Sleep(30);
	PlayMotion( Actor[3][2],ruFUSION_ACTORSTATE_EMOTE_VICTORY );
	Yell( Actor[3][2],"[SC_424221_ACT_06]",3 );--�n�I�F�ԥ����N�ѧڻP���������N��F��άO�Ǵ��F�L�h���O��Z�g�F�w�溸�P�ܼ}�����N��N�O�e���R�P�ä��C
	Sleep(40);
	PlayMotion( Actor[3][2],ruFUSION_ACTORSTATE_EMOTE_SPEAK );
	Yell( Actor[3][2],"[SC_424221_ACT_07]",3 );--�U��p�G���H��S������ĳ�A�ڭ̪��|ĳ�N�����a�C
	Sleep(30);
	for i=4,#Actor do
		x,y,z,_ = kg_GetPosRX( {FlagID,Actor[i][3][1]} );
		Move(Actor[i][2],x,y,z);
	end
	Sleep(20);
	for i=1,#Actor do
		DelObj(Actor[i][2]);
	end
	local PlayerArray = SearchRangePlayer( NPC, 300 );
	for i =0 , #PlayerArray-1 do
		if CheckAcceptQuest(PlayerArray[i],424221)==true and CheckBuff(PlayerArray[i],509851)==true and kg_GetDis(PlayerArray[i],FlagID , 2  )<=240 then
			SetFlag( PlayerArray[i],545112 , 1 );--�������y
		end
	end
end

function LuaQ_424221_ShowEnd()
	local Ctrl = OwnerID();
	local NPC = ReadRoleValue( Ctrl , EM_RoleValue_Register1 );
	for i in pairs( Lua_Zone20_QuestObj[424221] ) do
		DelObj( Lua_Zone20_QuestObj[424221][i] );
	end;
	Lua_Zone20_QuestObj[424221]=nil;
	WriteRoleValue(NPC,EM_RoleValue_Register9,0);
	Sleep(5); DelObj(Ctrl);
end

----------------------------------424222----------------------------------
function LuaS_118264_4()
	local Player = OwnerID();
	local NPC = TargetID();--��Z�g�D�N���S
	if ReadRoleValue(NPC,EM_RoleValue_Register8)==0 then
		WriteRoleValue(NPC,EM_RoleValue_Register8,1);
		CallPlot(NPC,"Lua_118264_Show3",NPC,Player );
	end
	CloseSpeak(Player);
end

function Lua_118264_Show3( NPC,Player )
	local RoomID = ReadRoleValue(NPC, EM_RoleValue_RoomID);
	--���ͼ@��������,�@���N���|���b�쥻��NPC���W
	local Ctrl=OwnerID();
	if ReadRoleValue( Ctrl , EM_RoleValue_OrgID )~=117201 then
		if type(Lua_Zone20_QuestObj)~="table" then
			Lua_Zone20_QuestObj={};
		end
		Lua_Zone20_QuestObj[424222]={};
		local Ctrl = kg_GetPosRX( NPC , 117201 );
		--table.insert( Lua_Zone20_QuestObj[424222] , Ctrl );
		kg_InvisibleObjInit(Ctrl);
		WriteRoleValue( Ctrl , EM_RoleValue_Register1 , NPC );--�@���������O��NPC
		AddToPartition( Ctrl , RoomID );
		CallPlot(Ctrl,"Lua_118264_Show3",NPC,Player );
		return
	end
	AddBuff( Player , 509852 , 0 ,-1 );--�����abuff
	CallPlot( Ctrl,"Lua_424222_CheckQuest", Player , 424222, 545113, 509852 );
	
	local FlagID = 780957;
	local Actor = {	{118434,0,Zone20_kg_QuestNPC[114367]},	--����
			{118435,0,Zone20_kg_QuestNPC[118264]},	--��Z�g
			{118436,0,{FlagID,1}},				--�d�Ժ�
			{118437,0,{3,4}},				--�ǿ�
			{118438,0,{5,6}},				--������
			{118439,0,{7,8}},				--�e���R
			{118440,0,{9,10}},				--�ä�
			{118441,0,{11,12}},				--�_��
			};
	local x,y,z;
	for i =1,3 do
		Actor[i][2]=kg_GetPosRX( Actor[i][3],Actor[i][1] );
		table.insert( Lua_Zone20_QuestObj[424222] , Actor[i][2] );
		kg_ActorInit( Actor[i][2] );
		SetModeEx( Actor[i][2] , EM_SetModeType_Mark, false)	----�i�I��(�_)
		SetModeEx( Actor[i][2] , EM_SetModeType_ShowRoleHead, false) 	---�Y����(�_)
		AddToPartition(Actor[i][2],RoomID);
	end
	for i =4,#Actor do
		x,y,z,_ = kg_GetPosRX( {FlagID,Actor[i][3][2]} );
		Actor[i][2]=kg_GetPosRX(  {FlagID,Actor[i][3][1] },Actor[i][1] );
		table.insert( Lua_Zone20_QuestObj[424222] , Actor[i][2] );
		kg_ActorInit( Actor[i][2] );
		SetModeEx( Actor[i][2] , EM_SetModeType_Mark, false)	----�i�I��(�_)
		SetModeEx( Actor[i][2] , EM_SetModeType_ShowRoleHead, false) 	---�Y����(�_)
		AddToPartition(Actor[i][2],RoomID);
		Move(Actor[i][2],x,y,z);
	end
	Sleep(50);--����NPC����w��
	Yell(Actor[1][2],"[SC_424222_ACT_01]",3);--�{�b�}�l�|��U�ʻ����C
	Sleep(30);
	local PlayerName = GetName(Player);
	Yell(Actor[1][2] , "[SC_424222_ACT_02][$SETVAR1="..PlayerName.."]"  , 3 );--�ѩ�A�h����{�u���A�ڨ�������M�h�ιΪ��A�M�w�V���U���ˡA���A�ʤɬ������M�h�C
	Sleep(50);
	PlayMotion(Actor[1][2], ruFUSION_ACTORSTATE_EMOTE_POINT );
	Yell(Actor[1][2] , "[SC_424222_ACT_03]" , 3 );--��e���ӡA�潥���b���U���e�C
	Sleep(10);
	ScriptMessage( Player , Player , 2 ,  "[SC_424222_TIP_01]" , "0xffff0000" );--�{�b�кɧ֨���d�Ժ����e
	Sleep(20);
	local timer = 0; 
	while 1 do
		Sleep(10);
		if kg_GetDis(Player,FlagID,2)<16 and timer<=10 then
			break
		elseif timer>10 then	--���a10���S����d��
			Yell(Actor[1][2] ,"[SC_424222_END_01]" ,3 );--�ݨӧA�٨S���ǳƦn...����U�ʻ�����ѦA�|��a�I
			Sleep(30);
			ScriptMessage( Player , Player , 2 ,  "[SC_424222_TIP_02]" , "0xffff0000" );--�A�S�����������A�Э��s�V��Z�g����
			CancelBuff(Player, 509852);
			for i=1,#Actor do
				DelObj(Actor[i][2]);
			end
			WriteRoleValue(NPC,EM_RoleValue_Register8,0);
			Sleep(5); DelObj(Ctrl);
			return
		end
		timer = timer+1;
	end
	AddBuff(Player,503977,0,-1);--�ĨĬ���
	AdjustFaceDir( Player , Actor[3][2],0 );
	Sleep(15);
	PlayMotion(Player,ruFUSION_ACTORSTATE_CROUCH_BEGIN);--���U
	Sleep(30);
	PlayMotion(Actor[3][2],ruFUSION_ACTORSTATE_EMOTE_POINT);
	NPCSay(Actor[3][2] , "[SC_424222_ACT_04][$SETVAR1="..PlayerName.."]" );--�q�{�b�_�A�A�N�O����M�h�Ϊ������M�h�C
	Sleep(30);
	NPCSay(Actor[3][2], "[SC_424222_ACT_05]");--�O���A��ڪ����ۤߡA���n�ѤF�A�����M�h���aģ�C
	Sleep(30);
	for i=1,2 do
		CallPlot( Actor[i][2] ,"Lua_424222_APPLAUSE", Actor[i][2]);
	end
	for i =4 , #Actor do
		CallPlot( Actor[i][2] ,"Lua_424222_APPLAUSE", Actor[i][2]);
	end
	Sleep(20);
	if CheckAcceptQuest(Player,424222)==true and CheckBuff(Player,509852)==true and kg_GetDis(Player,780955 , 2  )<=240 then
		PlayMotion(Player,ruFUSION_ACTORSTATE_CROUCH_END);--���U����
		SetFlag( Player,545113 , 1 );--�������y
	end
	Sleep(15);
	for i=4,#Actor do
		x,y,z,_ = kg_GetPosRX( {FlagID,Actor[i][3][1]} );
		Move(Actor[i][2],x,y,z);
	end
	Sleep(20);
	CancelBuff(Player,503977);
	CancelBuff(Player, 509852);
end

function Lua_424222_APPLAUSE( Obj )
	for i=1,3 do
		PlayMotion( Obj,ruFUSION_ACTORSTATE_EMOTE_APPLAUSE );
		Sleep(15);
	end
end

function Lua_424222_CheckQuest( Player , QuestID, FlagID, BuffID )
	local Ctrl = OwnerID();
	local NPC = ReadRoleValue( Ctrl , EM_RoleValue_Register1 );
	while 1 do
		if CheckID(Player) == true and  CheckAcceptQuest( Player, QuestID ) ~= true or --�ˬd���L����
		CheckBuff( Player, BuffID ) ~= true or --�ˬd���LBUFF
		--CheckFlag( Player, FlagID ) == true or --�ˬd���L���n���~
		CheckID(Player) ~= true or
		kg_GetDis(Player,780955 , 2  )>240 then --�ˬd�O�_�W�L�ˬd�d��
			CancelBuff( Player, BuffID );
			CancelBuff(Player,503977);
			break
		end
		Sleep(20);
	end
	for i in pairs( Lua_Zone20_QuestObj[424222] ) do
		DelObj( Lua_Zone20_QuestObj[424222][i] );
	end;
	Lua_Zone20_QuestObj[424222]=nil;
	WriteRoleValue(NPC,EM_RoleValue_Register8,0);
	Sleep(5); DelObj( Ctrl );
	DebugMsg(0,0,"424222_CheckQuest break");
end

----------------------------------424225----------------------------------
function Lua_424225_Tip01()--���a�d��Ĳ�o����
	local Player = OwnerID();
	local NpcA = TargetID();
	if CheckAcceptQuest(Player,424225)==true and CheckFlag( Player,545115 )~=true and ReadRoleValue(ReadRoleValue(NpcA,EM_RoleValue_Register9),EM_RoleValue_Register10 )==1 then
		ScriptMessage( NpcA,Player,2,"[SC_424225_TIP_01]","0xffff0000" );--�֪����H�����n�I
	end
end

function Lua_118273_CreateTalkGroup()--�������ܴ`��
	local Npc = OwnerID();
	WriteRoleValue(Npc,EM_RoleValue_Register10,1);--Part1
	local FlagID = 780958;
	local RoomID = ReadRoleValue(Npc,EM_RoleValue_RoomID);
	local NpcA  = kg_GetPosRX( {FlagID,3},118557 );
	kg_ActorInit(NpcA);
	WriteRoleValue(Npc , EM_RoleValue_Register9 , NpcA);
	WriteRoleValue(NpcA , EM_RoleValue_Register9 , Npc);
	AddToPartition( NpcA , RoomID );
	local NpcB = kg_GetPosRX( {FlagID,4},118558 );
	kg_ActorInit(NpcB);
	WriteRoleValue(Npc , EM_RoleValue_Register8 , NpcB);
	WriteRoleValue(NpcB , EM_RoleValue_Register9 , Npc);
	AddToPartition( NpcB , RoomID );
	
	SetPlot( NpcA, "range","Lua_424225_Tip01", 50 );
	local TalkString = {	{NpcA,"[SC_424225_ACT_01]",0},
				{NpcA,"[SC_424225_ACT_02]",ruFUSION_ACTORSTATE_EMOTE_POINT},
				{NpcB,"[SC_424225_ACT_03]",ruFUSION_ACTORSTATE_EMOTE_POINT},
				{NpcB,"[SC_424225_ACT_04]",0},
				{NpcB,"[SC_424225_ACT_05]",0},
				};
	local Step = 1;
	while 1 do
		if TalkString[Step][3]~=0 then
			PlayMotion( TalkString[Step][1] , TalkString[Step][3] );
		end
		NPCSay( TalkString[Step][1] ,TalkString[Step][2]);
		Step = Step+1;
		if Step>5 then Step=1; end
		Sleep(30);
	end
end

function LuaS_424225_1()--�Ĥ@�դH�@��
	local Player = OwnerID();
	local NpcAB = TargetID();
	local Npc = ReadRoleValue(NpcAB,EM_RoleValue_Register9);
	local SpeakString = {	"[SC_424225_SPK_01]",		--���n�A�n�F�I�I
				"[SC_424225_SPK_02]",		--���F�A�O�n�F�I�I
				"[SC_424225_SPK_03]",		--�A�̤��n�n�[�I
				"[SC_424225_SPK_04]",		--�H�M���Q�ڡI
				"[SC_424225_SPK_05]",		--�S���O�p�Ĥl�A�O�n�[�I
				"[SC_424225_SPK_06]",		--�A�̳��N�R�I�I
				};
	LoadQuestOption(Player);
	if CheckAcceptQuest(Player,424225)==true and CheckFlag( Player,545115 )~=true then
		AddSpeakOption( Player, NpcAB , SpeakString[kg_Rand(6)]  , "LuaS_424225_2",0 );
	end
end

function LuaS_424225_2()--�ƶ��i�JPart2
	local Player = OwnerID();
	local Npc = ReadRoleValue(TargetID() , EM_RoleValue_Register9);
	if ReadRoleValue(Npc , EM_RoleValue_Register10 )==1 then
		WriteRoleValue(Npc , EM_RoleValue_Register10 , 2 );
		local Ctrl = kg_GetPosRX( {780958,3},117201);
		kg_InvisibleObjInit(Ctrl);
		AddToPartition( Ctrl , RoomID );
		CallPlot( Ctrl ,"Lua_424225_Part2",Npc,Player );
		--CallPlot( Npc ,"Lua_424225_Part2",Npc,Player );
	else
		if ReadRoleValue(Npc,EM_RoleValue_Register6)==1 then--�U�[�ɾ������}��
			ScriptMessage(TargetID(),Player,2,"[SC_424225_TIP_04]","0xffff0000" );--�A�����U�[���j�n�ɾ��A�{�b�L�̤S�n�_�ӤF�C
		else
			ScriptMessage(TargetID(),Player,2,"[SC_424225_TIP_02]","0xffff0000" );--�L�S��A����ť�i�h�A�A�դ@���a
		end
	end
	CloseSpeak(Player);
end

function Lua_424225_Part2(Npc,Player)
	DebugMsg(0,0,"Quest424225_EnterPart2!!");
	local Ctrl = OwnerID();
	local FlagID = 780958;
	local RoomID = ReadRoleValue(Npc, EM_RoleValue_RoomID);
	
	--�гy�s�t��
	local NpcA2 = kg_GetPosRX( {FlagID,3},118443 );--���d�ڡD���
	kg_ActorInit(NpcA2);
	WriteRoleValue(NpcA2 , EM_RoleValue_Register9, Npc);
	DisableQuest( NpcA2 , true );
	AddToPartition( NpcA2 , RoomID );
	LockHP( NpcA2 , ReadRoleValue(NpcA2,EM_RoleValue_MaxHP)*0.25 , "Lua_424225_LockHP" );
	
	local NpcB2 = kg_GetPosRX( {FlagID,4},118444 );--�������D�w��
	kg_ActorInit(NpcB2);
	WriteRoleValue(NpcB2 , EM_RoleValue_Register9, Npc);
	DisableQuest( NpcB2 , true );
	AddToPartition( NpcB2 , RoomID );
	LockHP( NpcB2 , ReadRoleValue(NpcB2,EM_RoleValue_MaxHP)*0.25 , "Lua_424225_LockHP" );
	AddBuff(NpcB2,502707,1,-1);
	
	--�W�ٲ��k
	AddBuff( Player , 509853 , 0 ,-1 );
	Sleep(20);
	NPCSay( NpcA2 , "[SC_424225_FIG_01]" );--���F�I�ڥͮ�F�I
	PlayMotion(NpcA2,ruFUSION_ACTORSTATE_ATTACK_1H);
	Sleep(5);
	PlayMotion( NpcB2 , ruFUSION_ACTORSTATE_KNOCKDOWN_BEGIN );
	Sleep(13);
	NPCSay( NpcB2 , "[SC_424225_FIG_02]" );--�A�I�A���M�ʤ�I
	Sleep(20);
	
	--���[�`��
	ScriptMessage( Npc , Player , 2 , "[SC_424225_TIP_05]", "0xffff0000" );--�֧֪���L�̪������欰�I
	AddBuff(NpcA2,507532,0,-1);
	AddBuff(NpcA2,620034,0,-1);
	AddBuff(NpcB2,507532,0,-1);
	AddBuff(NpcB2,620034,0,-1);
	AddBuff(Player, 620032 , 0 ,-1);
	CallPlot( NpcA2 , "Lua_424225_NpcFight" , Npc , NpcA2 , NpcB2 );
	
	local Part2Check = ReadRoleValue( Npc , EM_RoleValue_Register7 );
	while 1 do
		if ReadRoleValue(Npc,EM_RoleValue_Register10)==3 then--���@NPC��q�C��25%�N���X�j��
			break
		end
		Part2Check = ReadRoleValue( Npc , EM_RoleValue_Register7 );
		Part2Check = Part2Check +1 ;
		if Part2Check>10 or CheckAcceptQuest(Player,424225)~=true or CheckID(Player)~=true or kg_GetDis( Player,780958 , 3  )>240 then	--���ˬd�Ȥj��10,�Y�W�L10��a�S�ʧ@,�N���s�����q
			DebugMsg(0,0,"424225 Fail")
			DelObj(NpcA2);
			DelObj(NpcB2);
			CancelBuff(Player,509853);
			CancelBuff(Player,620032);
			CallPlot(Npc,"Lua_424225_CloseHint",Npc);
			Sleep(10);--���R������
			local PlayerList = SearchRangePlayer( Ctrl , 150 );
			for i in pairs(PlayerList) do
				if CheckAcceptQuest( PlayerList[i] , 424225 )==true and CheckBuff(  PlayerList[i] ,509853 )~=true and CheckBuff(  PlayerList[i] ,620036 )~=true and CheckFlag( Player,545115 )~=true then
					ScriptMessage(Npc,PlayerList[i],2,"[SC_424225_TIP_03]", "0xffff0000" );--�{�b���O�U�[���n���|�I
				end
			end
			WriteRoleValue( Npc, EM_RoleValue_Register5 , 0 );--NPC�����}��
			WriteRoleValue(Npc,EM_RoleValue_Register6 , 1 );--�U�[�ɾ������}��
			WriteRoleValue(Npc,EM_RoleValue_Register7 , 0 );--�p���ˬd
			WriteRoleValue(Npc,EM_RoleValue_Register10 , 1);--��w�Ѱ�
			Sleep(5); DelObj(OwnerID());
			return
		else
			WriteRoleValue( Npc , EM_RoleValue_Register7 , Part2Check );
		end
		
		Sleep(10);
	end
	
	DebugMsg(0,0,"Quest424225_EnterPart3!!");
	CancelBuff(Player,620032);--�������a�ޯ�
	CancelBuff(NpcA2,620034);
	CancelBuff(NpcB2,620034);
	LockHP( NpcA2 , 0 , "" );
	LockHP( NpcB2 , 0 , "" );
	
	AddBuff( Player , 620036 , 0 ,-1 );--���F�ݨ��ĤT��,���K�ױ������Ȫ��ȤO�J�D�O��
	local Npc2 = kg_GetPosRX( {FlagID,1},118445 );
	kg_ActorInit(Npc2);
	SetModeEx( Npc2 , EM_SetModeType_Mark, false)	----�i�I��(�_)
	SetModeEx( Npc2 , EM_SetModeType_ShowRoleHead, false) 	---�Y����(�_)
	WriteRoleValue(Npc2,EM_RoleValue_IsWalk,0);
	AddToPartition(Npc2,RoomID);
	Sleep(10);
	LuaFunc_MoveToFlag( Npc2 , FlagID, 2,0 );
	WriteRoleValue( Npc, EM_RoleValue_Register5 , 1 );
	NPCSay( Npc2, "[SC_424225_FIG_03]");--���O���F�I�S�Ϥj�H�z�]�u�O..
	PlayMotion( Npc2,ruFUSION_ACTORSTATE_EMOTE_SPEAK );
	Sleep(10);
	AdjustFaceDir(NpcA2,Npc2,0);
	AdjustFaceDir(NpcB2,Npc2,0);
	Sleep(20);
	NPCSay(NpcA2,"[SC_424225_FIG_04]");--�S�B�S�ϡI�H
	PlayMotion( NpcA2,ruFUSION_ACTORSTATE_EMOTE_SPEAK );
	Sleep(20);
	
	--Part3
	local NpcA3 = kg_GetPosRX( NpcA2,118554 );
	kg_ActorInit( NpcA3 );
	SetModeEx( NpcA3 , EM_SetModeType_Mark, false)	----�i�I��(�_)
	SetModeEx( NpcA3 , EM_SetModeType_ShowRoleHead, false) 	---�Y����(�_)
	AddToPartition(NpcA3 ,RoomID);
	local NpcB3 = kg_GetPosRX(NpcB2 , 118555);
	kg_ActorInit( NpcB3 );
	SetModeEx( NpcB3 , EM_SetModeType_Mark, false)	----�i�I��(�_)
	SetModeEx( NpcB3 , EM_SetModeType_ShowRoleHead, false) 	---�Y����(�_)
	AddToPartition(NpcB3 ,RoomID);
	local Npc3 = kg_GetPosRX(Npc2,118556);
	kg_ActorInit( Npc3 );
	SetModeEx( Npc3 , EM_SetModeType_Mark, false)	----�i�I��(�_)
	SetModeEx( Npc3 , EM_SetModeType_ShowRoleHead, false) 	---�Y����(�_)
	AddToPartition(Npc3 ,RoomID);
	CallPlot(Npc3, "Lua_424225_Part3" , Npc , Player , Npc3 , NpcA3 , NpcB3  );
	CallPlot(Npc3, "Lua_424225_CheckPart3" , Npc , Player , Npc3 , NpcA3 , NpcB3  );
	--�����b�ƶ����H�ѻP
	DelObj(NpcA2);
	DelObj(NpcB2);
	DelObj(Npc2);
	Sleep(10);--���R������
	local PlayerList = SearchRangePlayer( Ctrl , 150 );
	for i in pairs(PlayerList) do
		if CheckAcceptQuest( PlayerList[i] , 424225 )==true and CheckBuff(  PlayerList[i] ,509853 )~=true and CheckBuff(  PlayerList[i] ,620036 )~=true and CheckFlag( Player,545115 )~=true then
			ScriptMessage(Npc,PlayerList[i],2,"[SC_424225_TIP_03]", "0xffff0000" );--�{�b���O�U�[���n���|�I
		end
	end
	WriteRoleValue( Npc, EM_RoleValue_Register5 , 0 );
	WriteRoleValue(Npc,EM_RoleValue_Register6,1);
	WriteRoleValue(Npc,EM_RoleValue_Register10,1);
	CallPlot(Npc,"Lua_424225_CloseHint",Npc);
	Sleep(5); DelObj(OwnerID());
end

function Lua_424225_NpcFight( Npc , NpcA2 , NpcB2 )--���NPC����
	local Step = 0;
	while 1 do
		if ReadRoleValue( Npc,EM_RoleValue_Register5 )==1 then--���@NPC��q�C��25%�N���X�j��
			return
		end
		if Step%2==0 then
			PlayMotion(NpcB2,ruFUSION_ACTORSTATE_ATTACK_1H);
		else
			PlayMotion(NpcA2,ruFUSION_ACTORSTATE_ATTACK_1H);
		end
		Step = Step+1;
		Sleep(10)
	end
end

function Lua_424225_Part3( Npc , Player , Npc3 , NpcA3 , NpcB3 )
	Sleep(20);
	CancelBuff(Player,509853);
	NPCSay(NpcB3,"[SC_424225_END_01]");--�o...���D�O���U���H���ڭ̤F...�H
	PlayMotion( NpcB3,ruFUSION_ACTORSTATE_EMOTE_SPEAK );
	Sleep(30);
	NPCSay(Npc3,"[SC_424225_END_02]");--���ξ�ߡA�S�Ϥj�H�u�O�ӤF�ѷ�a���p�C
	PlayMotion( Npc3,ruFUSION_ACTORSTATE_EMOTE_SPEAK );
	Sleep(35);
	NPCSay(NpcA3,"[SC_424225_END_03]");--�o�˧r......
	PlayMotion( NpcA3,ruFUSION_ACTORSTATE_EMOTE_SPEAK );
	Sleep(30);
	NPCSay(Npc3,"[SC_424225_END_04]");--���ϸ`�٬O���]�϶ˤf�B�𮧤@�U�a�H
	PlayMotion( Npc3,ruFUSION_ACTORSTATE_EMOTE_SPEAK );
	Sleep(35);
	NPCSay(NpcB3,"[SC_424225_END_05]");--�]�O......
	PlayMotion( NpcB3,ruFUSION_ACTORSTATE_EMOTE_SPEAK );
	Sleep(30);
	local FlagID = 780958;
	local x,y,z,_ = kg_GetPosRX( {FlagID , 3} , nil , 100 , 0 , 180 );
	Move( NpcA3 , x,y,z );
	x,y,z,_ = kg_GetPosRX( {FlagID , 4} , nil , 100 , 0 , 180 );
	Move( NpcB3 , x,y,z );
	Sleep(10);
	if CheckAcceptQuest(Player,424225)==true and CheckBuff(Player,620036)==true and kg_GetDis( Player,780958 , 3  )<=240 then
		SetFlag( Player,545115 , 1 );--�������y
	end
	Sleep(10);
	DelObj(NpcA3);
	DelObj(NpcB3);
	Hide(Npc3);
	Sleep(30);
	CancelBuff(Player,620036);
	DelObj( Npc3 );
end
function Lua_424225_CheckPart3( Npc , Player , Npc3 , NpcA3 , NpcB3 )
	while 1 do
		if CheckID(Player) == true and  CheckAcceptQuest( Player, 424225 ) ~= true or --�ˬd���L����
		CheckID(Player) ~= true or
		kg_GetDis(Player,780958 , 3  )>240 then --�ˬd�O�_�W�L�ˬd�d��
			CancelBuff( Player, 620036 );
			CancelBuff( Player, 509853 );
			break
		end
		Sleep(20);
	end
	DelObj(NpcA3); DelObj(NpcB3); DelObj(Npc3);
end
function Lua_424225_CloseHint(  Npc )
	Sleep(30);
	WriteRoleValue( Npc ,EM_RoleValue_Register6 ,0 );
end

function Lua_424225_LockHP()
	local Npc = ReadRoleValue(OwnerID(),EM_RoleValue_Register9);
	if ReadRoleValue(Npc,EM_RoleValue_Register10)==2 then
		WriteRoleValue(Npc,EM_RoleValue_Register10,3);
		DebugMsg(0,0,"Quest424225_ReadyToEnterPart3!!");
	end
end

function Lua_497854_Check()
	local Player = OwnerID();
	local OrgID = ReadRoleValue(TargetID(),EM_RoleValue_OrgID);
	if OrgID ==105805 or OrgID==105693 or OrgID==118443 or OrgID==118444  then
		return true
	end
	ScriptMessage( Player, Player, 1 , "[EM_200928_2]" , 0 )--�ؼп��~
	return false
end

function Lua_497854_WriteReg7()
	local Npc = ReadRoleValue( TargetID() ,EM_RoleValue_Register9 );
	WriteRoleValue( Npc,EM_RoleValue_Register7 , 0 );
end

----------------------------------424229----------------------------------
function LuaS_118498_1()
	local Player = OwnerID();
	local NPC = TargetID();--����M�h
	LoadQuestOption(Player);
	if CheckAcceptQuest(Player,424229)==true and CheckFlag( Player,545096 )~=true then
		AddSpeakOption( Player, NPC, "[SC_424229_01]", "LuaS_118498_2",0 );--�ڨөM�A�@�P�I��C
	end
end

function LuaS_118498_2()
	local Player = OwnerID();
	local NPC = TargetID();--����M�h
	if ReadRoleValue(NPC,EM_RoleValue_Register10)==0 then
		WriteRoleValue(NPC,EM_RoleValue_Register10,1);
		DebugMsg(0,0,"reg10="..ReadRoleValue(NPC,EM_RoleValue_Register10));
		CallPlot(NPC,"Lua_118498_Show",NPC,Player );
	else
		ScriptMessage(NPC,Player,2,"[SC_424229_TIP_04]","0xffff0000" );--�L�{�b�����ۨ�L�Ʊ��A�ߤ@�I�A�ӧ�L����n
	end
	CloseSpeak(Player);
end

function Lua_118498_Show(NPC,Player)
	local RoomID = ReadRoleValue(NPC, EM_RoleValue_RoomID);
	local Bucket = OwnerID();
	if ReadRoleValue(Bucket,EM_RoleValue_OrgID)~=117201 then
		local Bucket = kg_GetPosRX( NPC , 117201 , 15 );--���ͦA�M�h�e���A�Ω�P�w���a�O�_�b���Y�᭱
		kg_InvisibleObjInit( Bucket );
		AddToPartition( Bucket , RoomID );
		CallPlot( Bucket , "Lua_118498_Show" , NPC,Player);
		return
	end
	Tell( Player , NPC , "[SC_424229_TIP_01]" );--�S�Ϥj�H�A�Ш���Y�᭱���n�A�O���H�ݨ�F�C
	local timer =0;
	while 1 do
		if CheckAcceptQuest(Player,424229)~=true or kg_GetDis(Player,NPC  )>240 or CheckID(Player)~=true then
			DebugMsg(0,0,"Lua_118498_Show break");
			WriteRoleValue(NPC,EM_RoleValue_Register10,0);
			DelObj(Bucket);
			return
		end;
		if timer >10 then--���a�b10���S���b�d��
			Say( NPC , "[SC_424229_TIP_02]" );--�S�Ϥj�H�A�z�o�˶ö]�N���h�F�I�񪺷N�q�աI
			ScriptMessage(NPC,Player,2,"[SC_424229_TIP_03]","0xffff0000" );--�ЦA�@���P�M�h����
			WriteRoleValue(NPC,EM_RoleValue_Register10,0);
			DelObj(Bucket);
			return
		end;
		
		if kg_CheckTargetBack( Player , Bucket , 180 , 270 )==1 and kg_GetDis( Player , Bucket )<=60 then
			AddBuff(Player,503977,0,-1);--�ĨĬ���
			SetDir( Player , ReadRoleValue( NPC , EM_RoleValue_Dir ) );
			break;
		end;
		Sleep(10);
		timer = timer +1 ;
	end;
	
	local FlagID = 780959;
	local Actor = {	{OrgID=118499 , Gid = 0 },	--�t���M�h
			{OrgID=118500 , Gid = 0 },	--���J
			};
	Actor[1].Gid = kg_GetPosRX( NPC , Actor[1].OrgID );
	kg_ActorInit( Actor[1].Gid );
	SetModeEx( Actor[1].Gid , EM_SetModeType_Mark, false)	----�i�I��(�_)
	SetModeEx( Actor[1].Gid , EM_SetModeType_ShowRoleHead, false) 	---�Y����(�_)
	WriteRoleValue( Actor[1].Gid , EM_RoleValue_IsWalk , 0 );
	AddToPartition( Actor[1].Gid , RoomID );
	Actor[2].Gid = kg_GetPosRX( {FlagID,2} , Actor[2].OrgID );
	kg_ActorInit( Actor[2].Gid );
	SetModeEx( Actor[2].Gid , EM_SetModeType_Mark, false)	----�i�I��(�_)
	SetModeEx( Actor[2].Gid , EM_SetModeType_ShowRoleHead, false) 	---�Y����(�_)
	AddToPartition( Actor[2].Gid , RoomID );
	CallPlot( Bucket , "Lua_424229_CheckPlayer" , NPC, Player , Actor[1].Gid , Actor[2].Gid  );
	AddBuff( Player , 509854 , 0 ,-1 );
	
	Sleep(20);
	LuaFunc_MoveToFlag( Actor[2].Gid , FlagID , 3 , 0 );
	Sleep(10);
	AdjustDir( Actor[2].Gid , 45 );
	Sleep(15);
	AdjustDir( Actor[2].Gid , -90 );
	Sleep(15);
	LuaFunc_MoveToFlag( Actor[2].Gid , FlagID , 4 , 0 );
	Sleep(10);
	AdjustDir( Actor[2].Gid , 45 );
	Sleep(15);
	AdjustDir( Actor[2].Gid , -90 );
	Sleep(15);
	local x,y,z,_ = kg_GetPosRX( {FlagID,5} );
	Move(Actor[2].Gid,x,y,z);
	Sleep(20);
	CancelBuff( Player , 503977 );
	LuaFunc_MoveToFlag( Actor[1].Gid , FlagID , 1 , 0 );
	AdjustFaceDir( Actor[1].Gid , Actor[2].Gid , 0 );
	Sleep(10);
	PlayMotion( Actor[1].Gid ,  ruFUSION_ACTORSTATE_EMOTE_POINT);
	NPCSay( Actor[1].Gid , "[SC_424229_ACT_01]"  );--����A�A�o�i�ê��å�I
	Sleep(20);
	SetDefIdleMotion( Actor[1].Gid , ruFUSION_MIME_IDLE_COMBAT_2H );
	AdjustFaceDir( Actor[2].Gid , Actor[1].Gid , 0 );
	Sleep(10)
	local SpeakString = {	{2,"[SC_424229_ACT_02]",30,0 },	--�ݧA�o�����ҴN���D�O����M�h�Ϊ��H�A���o��S�W�x�C
				{2,"[SC_424229_ACT_03]",30,0 },	--�޳ޡA�ڬO�����ڧ̰l�d�@�ǨƱ��A�i���O�ӳo�̸�A���[���C
				{1,"[SC_424229_ACT_04]",20,0 },	--�A�̧�...
				{2,"[SC_424229_ACT_05]",40,ruFUSION_ACTORSTATE_EMOTE_SPEAK },--�ڥs���J�D�ͦ]���A�ڧ̴����U�ڱa�L�X���V�m�ҵ{�A�����D�A�b���b�������N�O�F�C
				{1,"[SC_424229_ACT_06]",40,ruFUSION_ACTORSTATE_EMOTE_SALUTE },--�A�o�˻��A�ڬO���ǦL�H�F�A�A�O�͡D�ͦ]���Ѯv���S���C�藍�_�A�ڥ�§�F�C
				{2,"[SC_424229_ACT_07]",40,ruFUSION_ACTORSTATE_EMOTE_SPEAK },--�ڧ̫��U�ڨӽլd�Ʊ��A���L�ݨ�A�̦b�o�̡A�ڷQ�A�̤j���]���D�o�ͤ���Ʊ��F�C
				{2,"[SC_424229_ACT_08]",40,ruFUSION_ACTORSTATE_EMOTE_SPEAK },--���Ӱe�f�ӤH�w�g���h�h�ɡA���H�۹L�h���b��R������l�d�A��O�Ө�o�̡C
				{2,"[SC_424229_ACT_09]",30,ruFUSION_ACTORSTATE_EMOTE_SPEAK },--�q������A���|�A�����礧�G�y�J���g�C���F�A�A�̤j�i��ߡC
				{2,"[SC_424229_ACT_10]",30,ruFUSION_ACTORSTATE_EMOTE_STRETCH },--�n�աA�S�O���Ʊ����ܡA�ڴN���F�C
				};
				
	for i =1 ,#SpeakString do
		if i==3 then
			SetDefIdleMotion( Actor[1].Gid ,ruFUSION_MIME_IDLE_STAND );
		end
		PlayMotion( Actor[SpeakString[i][1]].Gid , SpeakString[i][4] );
		NPCSay( Actor[ SpeakString[i][1] ].Gid , SpeakString[i][2] );
		Sleep( SpeakString[i][3] );
	end
	Sleep(20);
	x,y,z,_ = kg_GetPosRX({FlagID,5},nil,100,0,180);
	Move( Actor[2].Gid ,x,y,z);
	x,y,z,_ = kg_GetPosRX({FlagID,1},nil,100,0,180);
	Move( Actor[1].Gid ,x,y,z);
	Sleep(15);
	if CheckAcceptQuest(Player,424229)==true and CheckBuff(Player,509854)==true and kg_GetDis(Player,FlagID , 5  )<=240 then
		SetFlag( Player,545096 , 1 );--�������y
	end
	for i=1,#Actor do
		DelObj(Actor[i].Gid);
	end
	Sleep(10);
	CancelBuff(Player, 509854);
	WriteRoleValue(NPC,EM_RoleValue_Register10,0);
end

function Lua_424229_CheckPlayer( NPC,Player,Npc1,Npc2 )
	while 1 do
		if CheckID(Player) == true and  CheckAcceptQuest( Player, 424229 ) ~= true or --�ˬd���L����
		CheckID(Player)~=true or
		kg_GetDis(Player,Npc1  )>240 then --�ˬd�O�_�W�L�ˬd�d��
			CancelBuff( Player, 509854 );
			CancelBuff( Player , 503977 );
			break
		end
		Sleep(20);
	end
	WriteRoleValue(NPC,EM_RoleValue_Register10,0);
	DelObj(Npc1); DelObj(Npc2); DelObj(OwnerID());
end