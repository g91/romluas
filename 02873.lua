--���q�@���ϥΥ����ܼƦp�U�G

--Global_Run_426127
--�o�Otable, �u����t�i��ɦs�b�A��t�����h�]��nil

--Global_player_queue
--�o�Otable, �����a�b�ƶ����۬ݪ�t�ɤ~�|�s�b

--Global_Morake_426127
--�o�O����J��GUID, ���a�M��NPC��ܡA�M���I����ܿﶵ�HĲ�o����(���|�Q�M��)

--�����Ȫ��i��y�{�O�M����J(122067)��ܡA�Y���Ȫ��A���T�A�|���@�ӹ�ܿﶵ�i��
--�I����ܿﶵ�A�Y�S����t�b�i��A�s����t�ߨ����C�Y���A�߰ݪ��a�O�_�i�J��C
--�i��C�����a�|���ɦ���T���A�|���h�[��t�N���s�}�l
--��t�����|�T�{��C���O�_�����a�b���ݡA�Y���A�h���s�}�l��t
--�}�l�ɡA��C�������a�h�|�Q�ǰe����w��m

--�����������ի��O�A�зj�M Lua_426127_clear
--����󤤪��y�k  Global_Run_426127.waiting_player  �M Global_Run_426127[waiting_player] �O�ۦP�N��
--�u�O�� [ ] ������ ���� . ���Ҧ��AŪ�_�Ӥ�����P
function Lua_122067_szLuaScript()--����J��ܼ@��
	local Player,Morake=OwnerID(),TargetID();
	Global_Morake_426127=Morake;
	
	--�ˬd���Ȫ��A�G���ŦX�N�e�{�D���Ȭ������e
	local IsNormalState=true;
	local Quest_TwoVoice=426127;
	if ( CheckAcceptQuest(Player, Quest_TwoVoice) == true ) then
		IsNormalState = false;
	end

	if ( CheckFlag(Player, 547725) == true ) then
		IsNormalState = true;
	end

	if IsNormalState == true then
		LoadQuestOption(Player);
		return;
	end
	
	--���F����n��(426127)���᪺���A
	SetSpeakDetail(Player, "[SC_Z25Q426127_AN_1]");	
	AddSpeakOption(Player, Morake, "[SC_Z25Q426127_AN_2]", "Lua_122067_sz_option", 0);
end
function Lua_122067_sz_option()--�i����Ȫ��ﶵ
	local Player, Morake=OwnerID(), TargetID();
	local Quest_TwoVoice=426127;
	
	--�T�{���Ȫ��A
	local IsQuestRunning;
	local InQueue;
	if ( Global_Run_426127 ~= nil ) then
		IsQuestRunning=true;
	else
		IsQuestRunning=false;
	end
	
	--�����}�l��t
	if IsQuestRunning == false then
		Global_Run_426127={ waiting_player=1 };
		Global_player_queue = Global_player_queue or {};
		table.insert(Global_player_queue, Player);
		BeginPlot(Morake, "Lua_426127_execution", 0);
		CloseSpeak(Player);
		return;
	end
	
	--�קK���Ƴ��W
	for pos=1, table.getn( Global_player_queue ), 1 do
		local who = Global_player_queue[pos];
		if Player == who then
			InQueue = true;
		end
	end
	if InQueue == true then
		ScriptMessage( Player, Player, 1, "[SC_QUESTSTRING_16]" , 0);
		return;
	end
	
	--�߰ݬO�_�n�i�J��C
	BeginPlot(Player, "Lua_426127_AddQueue_option", 0);
	CloseSpeak(Player);
end
function Lua_426127_AddQueue_option()--���a�e���X�{�߰ݮءG�O�_�n�i�J��C
	
	--�ѼƳ]�w
	local str_main="[SC_QUESTSTRING_13]";
	local str_lOption="[SO_GETVOC_YES]";
	local str_rOption="[SO_NEWHANDNO]";
	local longest_dis=70;
	
	--�ܼƫŧi
	local Player=OwnerID();
	Morake=Global_Morake_426127;
	
	--�}�Ҹ߰ݵ���
	DialogCreate(Player, EM_LuaDialogType_YesNo, str_main);
	DialogSelectStr(Player, str_lOption);
	DialogSelectStr(Player, str_rOption);
	
	--���ݪ��a��ܡA�ܦh120��
	local choice_player=LuaS_DialogRePort_TwoChoose(Player);
	
	--�����ܡA���s�P�_
	if ( choice_player == "Yes" ) then
		if Global_Run_426127==nil then
			Global_Run_426127={ waiting_player=1 };
			Global_player_queue = Global_player_queue or {};
			table.insert(Global_player_queue, Player);
			BeginPlot(Morake, "Lua_426127_execution", 0);
		else
			Global_Run_426127.waiting_player = Global_Run_426127.waiting_player + 1;
			Lua_426127_queue();
		end
	end
end
function Lua_426127_queue()--�[�J���ݦ�C; ����C�����a�|����Ѿl���
	
	--��GUID
	local Morake=Global_Morake_426127;
	local Player=OwnerID();
	
	Global_player_queue = Global_player_queue or {};
	--�i�J��C
	table.insert(Global_player_queue, Player);
	ScriptMessage(Player, Player, 3, "[SC_QUESTSTRING_16]", 0);--�A�[�J�F���ݼ@���t�X����C
	
	--�ɶ��i�ੵ��A�A���չ��t���A
	local IsQuestRunning;
	if Global_Run_426127 == nil then
		IsQuestRunning = false;
	else
		IsQuestRunning = true;
	end
	
	--��t�i�椤�A�⪱�a�e�i��C
	if IsQuestRunning == true then
		Global_Run_426127.waiting_player = Global_Run_426127.waiting_player + 1;
		return;
	end
	
	--��t�w�����A�������s�}�l; ���s�إߥ����ܼ�
	if IsQuestRunning == false then
		Global_Run_426127={waiting_player=1};
		BeginPlot(Morake, "Lua_426127_execution", 0);
	end
end
function Lua_426127_execution()--��t�y�{
	
	--�ܼƫŧi�G
	local list={};
	Global_Run_426127.playerlist = {};
	local move_flag=781272;
	local quest_flag=547725;
	local client_buff=624065;
	local blind_buff=620001;
	local x,y,z,dir;
	local music_track={}
	local IsAnyPlayerInQueue;
	if  #Global_player_queue ~= 0 then
		IsAnyPlayerInQueue = true;
	else
		IsAnyPlayerInQueue = false;
	end
	
	--����s��
	local orgid={morake=122112, jill=122111, kadmose=122068, light_dragon=122074, dark_dragon=122073};
	
	--�ƨ禡�ŧi
	--����t�y�{�Ψ�T�ذƨ禡: KickLeaverOut,  msg_toList ,DelObjTable_msg_toList
	--�o�T�Ө禡�|�զX�ϥΡA�q�`�A�|�ݨ쥦�̤@�_�X�{
	--�Ҧ��O���L�o���a�W��A�A�γ̷s�����T�W��Ӱ�����B�z
	
	--KickLeaverOut �O�ΨӽT�{���a���ŦX���Ȫ��A�A�S�������ȡA���o�ӻ��Aetc.
	--�ݨ즹�禡�е��P��table �@��: �����Ϊk�º�O��table��i�h�A�^�ǹL�o�������G�A�^��nil�N�O�S�H
	local KickLeaverOut = function (player_table)--�簣�L�Ī��a
		if player_table==nil then
			return nil;
		end
		local list={};
		local client_buff=624065;
		for pos=1, table.getn(player_table), 1 do
			local IsGone=false;
			local Player=player_table[pos];
			
			--�˴�����
			if ( Player == nil ) then
				IsGone = true;
			end
			if IsGone==false and ( CheckID(Player) == false ) then
				IsGone = true;
			end
			if IsGone==false and ( GetDistance( Global_Morake_426127, Player)>150 ) then
				CancelBuff_NoEvent( Player, client_buff );
				ScriptMessage(Player, Player, 3, "[SC_QUESTSTRING_15]", 0);
				IsGone = true;
			end
			if IsGone==false and CheckAcceptQuest(Player, 426127)==false then
				CancelBuff_NoEvent( Player, client_buff );
				IsGone = true;
			end
			if ( IsGone == false ) then
				table.insert( list, Player);
			end
		end
		if table.getn(list)==0 then
			return nil;
		end
		return list;
	end
	--msg_toList�M���Ψӳq�����b�ƶ������a�A�٦��X���t�N�n�}�l
	--�Ĥ@�ӰѼƶ񪺬Otable, �ӥB���F�׳����A �|���� KickLeaverOut �i��L�o, �ĤG�ӰѼƬO�Ѿl���
	local msg_toList = function (player_table, remain_sec)--�ƨ禡:�ǰT��C�������a�ثe�i��
		if player_table==nil then
			return;
		end
		if remain_sec==nil then
			return;
		end
		local _msg="[SC_QUESTSTRING_14][$SETVAR1="..remain_sec.."]";
		for pos=1, table.getn(player_table),1 do
			ScriptMessage(player_table[pos], player_table[pos], 2, _msg, 0);
		end
	end
	--��t���|�O���[���t�����a�M��A�M��g�L KickLeaverOut�L�o�����G�Y�Onil �N��N�S�H
	--DelObjTable_msg_toList �|�M���Ҧ����ͪ�����A�åB�ǰT�������b�ƶ������a�A�q���L�̤U�@���n�}�l
	local DelObjTable_msg_toList = function ( ObjTable, queue_table )--�ƨ禡:�M���Ҧ����ͪ����� + �ǰT�i���U���n�}�l
		--�M���Ҧ�����
		for pos=1, table.getn(ObjTable),1 do
			DelObj( ObjTable[pos] );
		end
		
		--�L�H�ƶ�; reset
		if queue_table == nil then
			Global_Run_426127 = nil;
			return;
		end
		
		--���H�ƶ�; �ǰT;
		local _msg="[SC_QUESTSTRING_14][$SETVAR1=5".."]";
		for pos=1, table.getn(queue_table),1 do
			ScriptMessage(queue_table[pos], queue_table[pos], 2, _msg, 0);
		end
		
		--�ǳƭ��s�}�l
		BeginPlot(Global_Morake_426127, "Lua_426127_repeated", 0);
	end
	
	--��ƪ�l��
	if  IsAnyPlayerInQueue then
		Global_Run_426127.playerlist = KickLeaverOut(Global_player_queue);
		--��C�L�H
		if Global_Run_426127.playerlist==nil then
			Global_Run_426127 = nil;
			return;
		end
		
		--�p�⯸���T
		local list_length=table.getn(Global_Run_426127.playerlist);
		local equal_angle=180/list_length;
		local x,y,z,dir=DW_Location(Global_Morake_426127);
		
		--�]�w��T; �ǰe�ܫ��w��m; ����;
		for pos=1, list_length, 1 do
			local player=Global_Run_426127.playerlist[pos];
			AddBuff(player, blind_buff, 0, 2);
			AddBuff(player, client_buff, 0, -1);
			SetPos(player, DW_NewLocation( 60+( pos*equal_angle ), 50, x,y,z,dir) );
			Lua_StopBGM( player );
			music_track[player] = PlayMusicToPlayer(player,"music/zone/005/zone005_mystic_altar_outside.mp3", false)
		end
		sleep(10);
		
		--�M�Ŧ�C
		Global_player_queue = {};
		Global_Run_426127.waiting_player = 0;
	else
		return;
	end
	--�����l��
	x,y,z,dir=DW_Location(move_flag, 50);
	local Kadmose=CreateObj(orgid.kadmose, x,y,z,dir, 1);
	MoveToFlagEnabled(Kadmose, false);
	SetDefIdleMotion(Kadmose, ruFUSION_MIME_SLEEP_LOOP);
	AddToPartition(Kadmose, 0);
	
	x,y,z,dir=DW_Location(move_flag, 51);
	local Light_Dragon=CreateObj(orgid.light_dragon, x,y,z,dir, 1);
	MoveToFlagEnabled(Light_Dragon, false);
	AddToPartition(Light_Dragon, 0);
	
	x,y,z,dir=DW_Location(move_flag, 54);
	local Dark_Dragon=CreateObj(orgid.dark_dragon, x,y,z,dir, 1);
	MoveToFlagEnabled(Dark_Dragon, false);
	PlayMotionEX(Dark_Dragon, ruFUSION_ACTORSTATE_CROUCH_BEGIN, ruFUSION_ACTORSTATE_CROUCH_LOOP);
	
	x,y,z,dir=DW_Location(move_flag, 52);
	local Jill=CreateObj(orgid.jill, x,y,z,dir, 1);
	MoveToFlagEnabled(Jill, false);
	AddToPartition(Jill, 0);
	
	x,y,z,dir=DW_Location(move_flag, 53);
	local Morake=CreateObj(orgid.morake, x,y,z,dir, 1);
	MoveToFlagEnabled(Morake, false);
	AddToPartition(Morake, 0);
	
	--�O������GUID, �H�ƧR���ɨϥ�
	local ObjTable={Kadmose, Light_Dragon, Dark_Dragon, Jill, Morake};
	
	--�����}�l
	--���s����X��8:�K�K�ѩ�ڪ������~���p���͡K�K�{�b��ı��F�A�N�����p�A���ұ����K�K�C
	sleep(15);
	PlayMotion(Light_Dragon, ruFUSION_ACTORSTATE_EMOTE_SPEAK);
	sleep(10);
	Yell(Light_Dragon, "[SC_Z25Q426127_1]", 3);
	sleep(30);
	x,y,z,dir=DW_Location(move_flag, 55);
	sleep( Move(Light_Dragon, x,y,z) );
	sleep(10);
	
	--���s�ͮ�ʧ@�GruFUSION_ACTORSTATE_EMOTE_ANGRY
	--�����Ŧ�r��Gê�ơI���Y�A�O�����ä�F�A��󪺸ܡA�ڭ̳��i�H���P�I�I
	--���_�ˬd
	Global_Run_426127.playerlist = KickLeaverOut(Global_Run_426127.playerlist);
	list=KickLeaverOut(Global_player_queue);
	if Global_Run_426127.playerlist == nil then 
		DelObjTable_msg_toList(ObjTable, list);
		return;
	else
		msg_toList( list, 45 ); 
	end
	StopMove(Light_Dragon, true);
	PlayMotion(Light_Dragon, ruFUSION_ACTORSTATE_EMOTE_ANGRY);
	sleep(15);
	ScriptMessage(Light_Dragon, -1, 0, "[SC_Z25Q426127_2]", "0xFF75BEFB");
	ScriptMessage(Light_Dragon, -1, 2, "[SC_Z25Q426127_2]", "0xFF75BEFB");
	sleep(30);
	
	--���s����X��7
	--���s�n�Y�ʧ@�GruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE
	--���s�G���F�����·t���\���ӡA����n�ʦL�p......�I
	x,y,z,dir=DW_Location(move_flag, 54);
	sleep( Move(Light_Dragon, x,y,z));
	sleep(10);
	StopMove(Light_Dragon, true);
	PlayMotion(Light_Dragon, ruFUSION_ACTORSTATE_SHIELD_BASH);
	sleep(10);
	Yell(Light_Dragon, "[SC_Z25Q426127_3]", 3);
	sleep(30);
	
	--���s����X��8
	--���s�J���ʧ@�GruFUSION_ACTORSTATE_EMOTE_LAUGH
	--���s�G�����A���Y�A�A�ζ̤F�ܡH�A�w�g�ӹL��z�A�Ӥ��ΤF�I
	--���_�ˬd
	Global_Run_426127.playerlist = KickLeaverOut(Global_Run_426127.playerlist);
	list=KickLeaverOut(Global_player_queue);
	if Global_Run_426127.playerlist == nil then 
		DelObjTable_msg_toList(ObjTable, list);
		return;
	else
		msg_toList( list, 35 ); 
	end
	
	x,y,z,dir=DW_Location(move_flag, 55);
	sleep( Move(Light_Dragon, x,y,z));
	sleep(10);
	StopMove(Light_Dragon, true);
	PlayMotion(Light_Dragon, ruFUSION_ACTORSTATE_EMOTE_LAUGH);
	sleep(20);
	ScriptMessage(Light_Dragon, -1, 0, "[SC_Z25Q426127_4]", "0xFF75BEFB");
	ScriptMessage(Light_Dragon, -1, 2, "[SC_Z25Q426127_4]", "0xFF75BEFB");
	sleep(30);
	
	--���s����X��7
	--���s�ͮ�ʧ@�GruFUSION_ACTORSTATE_EMOTE_ANGRY
	--���s�G�i�c�K�K���ڰڰڡI
	x,y,z,dir=DW_Location(move_flag, 54);
	sleep( Move(Light_Dragon, x,y,z));
	sleep(30);
	PlayMotion(Light_Dragon, ruFUSION_ACTORSTATE_EMOTE_ANGRY);
	sleep(10);
	Yell(Light_Dragon, "[SC_Z25Q426127_5]", 3);
	--���_�ˬd
	Global_Run_426127.playerlist = KickLeaverOut(Global_Run_426127.playerlist);
	list=KickLeaverOut(Global_player_queue);
	if Global_Run_426127.playerlist == nil then 
		DelObjTable_msg_toList(ObjTable, list);
		return;
	else
		msg_toList( list, 25 ); 
	end
	sleep(15);
	
	--���s���U�ʧ@�GruFUSION_ACTORSTATE_CRAFTING_LOOP
	--�H���s�����ߩ�X�t�t�S�ġA�S�ĵ������ܦ����s�]�]�N�O���ͦb�X��7����m�^
	PlayMotionEX(Light_Dragon, ruFUSION_ACTORSTATE_CROUCH_BEGIN, ruFUSION_ACTORSTATE_CROUCH_LOOP);
	local DarkShowEffect=496177
	sleep(10);
	SysCastSpellLv(Light_Dragon, Light_Dragon, DarkShowEffect, 1);
	sleep(10);
	AddToPartition(Dark_Dragon, 0);
	PlayMotionEX(Dark_Dragon, ruFUSION_ACTORSTATE_CROUCH_LOOP, ruFUSION_ACTORSTATE_CRAFTING_END)
	Hide(Light_Dragon);
	
	--���F���s�H�~�����H�GruFUSION_ACTORSTATE_DODGE
	--���F���s���~�����H�G�I
	PlayMotion(Morake, ruFUSION_ACTORSTATE_DODGE);
	PlayMotion(Jill, ruFUSION_ACTORSTATE_DODGE);
	PlayMotionEX(Kadmose, ruFUSION_ACTORSTATE_SLEEP_END, ruFUSION_ACTORSTATE_COMBAT_UNARMED);
	SetDefIdleMotion(Kadmose, ruFUSION_MIME_IDLE_COMBAT_UNARMED);
	Yell(Morake, "[SC_Z25Q426127_6]", 3);
	Yell(Jill, "[SC_Z25Q426127_6]", 3);
	--���a�]���X����
	Global_Run_426127.playerlist = KickLeaverOut(Global_Run_426127.playerlist);
	for pos=1, table.getn(Global_Run_426127.playerlist), 1 do
		NPCSay( Global_Run_426127.playerlist[pos], "[SC_Z25Q426127_6]");
		PlayMotion( Global_Run_426127.playerlist[pos], ruFUSION_ACTORSTATE_DODGE);
	end
	
	--���s�_���ʧ@�GruFUSION_ACTORSTATE_CROUCH_END
	--���s�G�H�H�H�H�I
	PlayMotion(Dark_Dragon, ruFUSION_ACTORSTATE_CROUCH_END);
	Yell(Dark_Dragon, "[SC_Z25Q426127_7]", 3);
	sleep(20);
	PlayMotion(Kadmose, ruFUSION_ACTORSTATE_HURT_NORMAL);
	
	--���s�G�{�b�Aê�ƪ����Y�εۤF�A�Ӧ����]�o�h���F�I
	--���s�ϥηt�t�k�N���B�s�̫�@���A�쥻���۪��B�s���`
	Yell(Dark_Dragon, "[SC_Z25Q426127_8]", 3);
	local PowerDarkFlyEffect=850739;
	sleep(20);
	CastSpell(Dark_Dragon, Kadmose, PowerDarkFlyEffect);
	sleep(10);
	PlayMotionEX(Kadmose, ruFUSION_ACTORSTATE_DYING, ruFUSION_ACTORSTATE_DEAD);
	SetDefIdleMotion(Kadmose, ruFUSION_MIME_IDLE_DEAD);
	
	--����J�G���I
	--����J�M�N�੹���s����V�ĥh�]��ڤW�O�]��S�w�X�l�^
	Yell(Morake, "[SC_Z25Q426127_13]", 3);
	sleep(15);
	x,y,z,dir=DW_Location(move_flag, 57);
	WriteRoleValue(Morake, EM_RoleValue_IsWalk, 0);
	Move(Morake, x,y,z);
	x,y,z,dir=DW_Location(move_flag, 56);
	WriteRoleValue(Jill, EM_RoleValue_IsWalk, 0);
	Move(Jill, x,y,z);
	sleep(15);
	
	--���s��X�d��t�t�k�N�A�N��M����J���U
	--���s�ܦ��s���A���X���d�Ť��ʧ@
	SysCastSpellLv(Morake, Morake, 850322, 1);
	SysCastSpellLv(Jill, Jill, 850322, 1);
	sleep(5);
	StopMove(Morake, true);
	StopMove(Jill, true);
	PlayMotionEX(Morake, ruFUSION_ACTORSTATE_CROUCH_BEGIN, ruFUSION_ACTORSTATE_CROUCH_LOOP);
	PlayMotionEX(Jill, ruFUSION_ACTORSTATE_CROUCH_BEGIN, ruFUSION_ACTORSTATE_CROUCH_LOOP);
	x,y,z,dir=DW_Location(Kadmose);

	--���s��B�s�I�i�@�ӧl�������t�t�k�N
	--�k�N������B�s����
	--���s�G[122068]���O�q�A�ڦ��U�o�I
	ScriptMessage(Dark_Dragon, -1, 0, "[SC_Z25Q426127_9]", "0xFF75BEFB");
	ScriptMessage(Dark_Dragon, -1, 2, "[SC_Z25Q426127_9]", "0xFF75BEFB");
	PlayMotionEX(Dark_Dragon, ruFUSION_ACTORSTATE_BUFF_INSTANT,ruFUSION_ACTORSTATE_BUFF_INSTANT);
	CastSpell(Kadmose, Dark_Dragon, 850753);
	--PlayMotion(Dark_Dragon, ruFUSION_ACTORSTATE_CAST_SP02);
	sleep(35);
	Hide(Kadmose);
	--���_�ˬd
	Global_Run_426127.playerlist = KickLeaverOut(Global_Run_426127.playerlist);
	list=KickLeaverOut(Global_player_queue);
	if Global_Run_426127.playerlist == nil then 
		DelObjTable_msg_toList(ObjTable, list);
		return;
	else
		msg_toList( list, 15 ); 
	end
	
	--���s�G�I�I�I�A�Pı��F�A[122068]���O�q�b�餺«�ʵۡI
	--���s�G�ڴN�֭n�u�����u�s�b�v�F�K�K�C
	--���s�G�H�H�I����J�A�ڻ��L�F�a�I�s�ڪ��u����v�@�w�|�Ӫ��I 
	--���s����
	local Dark_Dragon_Form=CreateObj(122114, x,y+30,z,dir+45, 1);
	SetModeEx(Dark_Dragon_Form, EM_SetModeType_Gravity, false);
	AddBuff(Dark_Dragon_Form, 506984, 10, -1);
	AddToPartition(Dark_Dragon_Form, 0);
	table.insert(ObjTable, Dark_Dragon_Form);
	--x,y,z,dir=DW_Location(Dark_Dragon_Form);
	--MoveDirect(Dark_Dragon_Form, x,y+100,z);
	--sleep(5)
	Hide(Dark_Dragon);
	sleep(15)
	PlayMotionEX(Dark_Dragon_Form, ruFUSION_ACTORSTATE_FLY_LOOP, ruFUSION_ACTORSTATE_FLY_LOOP);
	SetDefIdleMotion(Dark_Dragon_Form, ruFUSION_MIME_FLY_LOOP);
	ScriptMessage(Dark_Dragon_Form, -1, 0, "[SC_Z25Q426127_10]", "0xFF75BEFB");
	ScriptMessage(Dark_Dragon_Form, -1, 2, "[SC_Z25Q426127_10]", "0xFF75BEFB");
	sleep(30)
	ScriptMessage(Dark_Dragon_Form, -1, 0, "[SC_Z25Q426127_11]", "0xFF75BEFB");
	ScriptMessage(Dark_Dragon_Form, -1, 2, "[SC_Z25Q426127_11]", "0xFF75BEFB");
	sleep(20);
	ScriptMessage(Dark_Dragon_Form, -1, 0, "[SC_Z25Q426127_12]", "0xFF75BEFB");
	ScriptMessage(Dark_Dragon_Form, -1, 2, "[SC_Z25Q426127_12]", "0xFF75BEFB");
	PlayMotionEX(Dark_Dragon_Form, ruFUSION_ACTORSTATE_SPIRAL_LOOP, ruFUSION_ACTORSTATE_SPIRAL_LOOP);
	SetDefIdleMotion(Dark_Dragon_Form, ruFUSION_MIME_SPIRAL_LOOP);
	SetModeEx(Dark_Dragon_Form, EM_SetModeType_Drag, false);
	x,y,z,dir=DW_Location(Dark_Dragon_Form);
	x,y,z,dir=DW_NewLocation(0,2000, x,y,z,dir);
	MoveDirect(Dark_Dragon_Form, x,y+700,z);
	sleep(30);

	--��z���a���A
	Global_Run_426127.playerlist = KickLeaverOut(Global_Run_426127.playerlist);
	if Global_Run_426127.playerlist and #Global_Run_426127.playerlist~=0 then
		for pos=1, table.getn(Global_Run_426127.playerlist), 1 do
			local player=Global_Run_426127.playerlist[pos];
			CancelBuff_NoEvent(player, client_buff);
			SetFlag(player, quest_flag, 1);--���ȧ���
			StopSound( player, music_track[player]);
			Lua_PlayBGM( player );
		end
	end
	--������t
	list=KickLeaverOut(Global_player_queue);
	DelObjTable_msg_toList(ObjTable, list);
end
function Lua_426127_repeated()--�����°��������; ���s�i������
	sleep(50);
	BeginPlot(Global_Morake_426127, "Lua_426127_execution", 0);
end
function Lua_426127_TestFunc()--���ե�(%t_id)�b�D���a����W����; ���P�N�ۤv�[�J��C
	Global_Morake_426127=OwnerID();
	Global_Run_426127={waiting_player=1};
	Global_player_queue = Global_player_queue or {};
	table.insert( Global_player_queue, TargetID());
end
--[[
/gm ? runplot %T_ID Lua_426127_TestFunc
/gm ? runplot Lua_426127_clear
/gm ? runplot Lua_426127_queue
--���Ȧ�m
/gm ? zone 25 0 -11998 1485 -2133 0
--]]
function Lua_426127_clear()--���ե�; �M����������
	
	local player=TargetID();
	local roomid=ReadRoleValue(player, EM_RoleValue_RoomID);
	SetFlag(player, 547725, 0);
	CancelBuff_NoEvent(player, 624065);
	CancelBuff_NoEvent(player, 620001);
	
	--�M���W�@�������G
	Global_Run_426127=nil;
	
	--�ŧi�ܼ�
	local _trash={122068, 122074, 122073, 122111, 122112, 122114};
	local time=table.getn(_trash);
	local total = SetSearchAllNPC(roomid);
	for pos=1, total, 1 do
		local who=GetSearchResult();
		local orgid=ReadRoleValue(who, EM_RoleValue_OrgID);
		for i=1, time, 1 do
			if orgid==_trash[i] then
				DelObj(who)
			end
		end
	end
end