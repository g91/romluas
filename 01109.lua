function LuaS_110243_0()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() ,421612 ) == true and CheckFlag(OwnerID(),542286) == false then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_110243_0]","LuaS_110243_1",0) --�Чi�D��������@�̪��@���C
	elseif  CheckFlag(OwnerID(),542286) == true then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_110243_1]","LuaS_110243_1",0) --�ڷQ�Ať�@��������@�̪��Ʊ��C
	end

	if CheckAcceptQuest( OwnerID() ,422666 ) == true and CheckFlag(OwnerID(),543265) == false then ----�Q�U�������
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422628_0]","LuaS_422666",0) --�o�ͤ���ơH
	end
end

function LuaS_110243_1()
	SetSpeakDetail( OwnerID(), "[SC_110243_2]"   );
	--�b�ʦL���ԥH��A�H�����F�קK��������A��O���X�F��ɪ��j�j�޳N�A�s�y�X�߳��W�ߩ�@�����~�A�֦��j�j�����H�L�k��ת��O�q�A�åB����ۧګ�ҤΥ[�H�P�_�������]��-���@�̡C
	--��ɪ��H���Ρu���@�̡v�ӷj���ݾl���]�ڡA�O�@�ʦL��ɪ��˸m�A�úʵ��]�ڴݯd�����~�A�H�Ψ���Q�ݥβŤ��]�k���H�̡C
	--���L�A��Ӧ]���@�ǿ��~�A�ɭP���@�̥�N�֦��]�k�P�Ť�O�q���j�N�����̷�@�R������H�A�Ӷ}�l�����C���m�զa�i��j�W�Ҫ��O���A�̫�A�j�N������A�N�b�u���@�̡v���}�a�U�A���`�F�K�K
	SetFlag( OwnerID() , 542286 , 1 )
	AddSpeakOption(OwnerID(),TargetID(),"[SO_BACK]","LuaS_110243_0",0) --�^�W�@��
end

function LuaQ_421602_Complete()
	DisableQuest( OwnerID() , true )
	local Flag = 780221
	local X = ReadRoleValue( OwnerID() , EM_RoleValue_X )
	local Y = ReadRoleValue( OwnerID() , EM_RoleValue_Y )
	local Z = ReadRoleValue( OwnerID() , EM_RoleValue_Z )
	local Dir = ReadRoleValue( OwnerID() , EM_RoleValue_Dir )
	local Mallsource = {}
	Mallsource[1] = CreateObjByFlag(110243,Flag,0,1)
	Mallsource[2] = CreateObjByFlag(110245,Flag,4,1)
	Mallsource[3] = CreateObjByFlag(110182,Flag,8,1)
	for i = 1 , 3 , 1 do
		DisableQuest( Mallsource[i] , true )
		WriteRoleValue( Mallsource[i] , EM_RoleValue_PID , 0 + (i-1)*4 )
		WriteRoleValue( Mallsource[i] , EM_RoleValue_IsWalk , 1 )
		MoveToFlagEnabled( Mallsource[i] , false )
		AddToPartition( Mallsource[i] , 0 )
		BeginPlot( Mallsource[i] , "Lua_Mallsource_MoveA" , 0 )
	end
	local FlagX = GetMoveFlagValue( Flag , 1 , EM_RoleValue_X )
	local FlagY = GetMoveFlagValue( Flag , 1 , EM_RoleValue_Y )
	for i = 0 , 120 , 1 do
		local Pos_X = ReadRoleValue( Mallsource[1] , EM_RoleValue_X )
		local Pos_Y = ReadRoleValue( Mallsource[1] , EM_RoleValue_Y )
		if Abs(FlagX-Pos_X) < 10 and Abs(FlagY-Pos_Y) < 10 then
			break
		end
		sleep(5)
	end

	sleep(15)
	Say( OwnerID() , "[SC_421602_0]") --�w��z���e�ӡA��̤������ѰO���A��������C
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	sleep(30)
	Say( Mallsource[1] , "[SC_421602_1]") --�ڤw�g�ݹL�H��A�Ʊ�o�����`�M�h�λP��̤������X�@�A������M��ǻ����C���i�צ��j��}�C
	PlayMotion( Mallsource[1], ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	sleep(30)
	Say( OwnerID() , "[SC_421602_2]") --�ڬ۫H���׷|�O�֩w���A���ڭ̦n�n���a�A�o��СC
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	sleep(15)
	MoveToFlagEnabled( OwnerID() , false )
	BeginPlot( Mallsource[1] , "Lua_Mallsource_MoveB" , 30)
	BeginPlot( Mallsource[2] , "Lua_Mallsource_MoveB" , 50)
	BeginPlot( Mallsource[3] , "Lua_Mallsource_MoveB" , 50)
	Hide( OwnerID() )
	WriteRoleValue( OwnerID() , EM_RoleValue_IsWalk , 1 )
	Show(OwnerID() , 0 )
	LuaFunc_MoveToFlag( OwnerID(), Flag , 2 ,0 )
	sleep( 10 )
	LuaFunc_MoveToFlag( OwnerID(), Flag , 3 ,0 )
	sleep( 10 )
	Hide( OwnerID() )
	sleep( 100 )
	WriteRoleValue( OwnerID() , EM_RoleValue_IsWalk , 1 )
	Show(OwnerID() , 0 )
	LuaFunc_MoveToFlag( OwnerID(), Flag , 2 ,0 )
	sleep(10)
	MoveDirect( OwnerID(), X , Y , Z )
	for i = 0 , 120 , 1 do
		local CLS_X = ReadRoleValue( OwnerID() , EM_RoleValue_X )
		local CLS_Y = ReadRoleValue( OwnerID() , EM_RoleValue_Y )
		if Abs(X-CLS_X) < 10 and Abs(Y-CLS_Y) < 10 then
			break
		end
		sleep(5)
	end
	MoveDirect( OwnerID(), X , Y , Z )
	sleep(10)
	SetDir( OwnerID(), Dir )
	sleep(10)
	MoveToFlagEnabled( OwnerID() , true )
	DisableQuest( OwnerID() , false )
end

function Lua_Mallsource_MoveA()
	local M = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local Flag = 780221
	LuaFunc_MoveToFlag( OwnerID(), Flag , 1+M ,0 )
end

function Lua_Mallsource_MoveB()
	local M = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local Flag = 780221
	for i = 2 , 3 , 1 do
		LuaFunc_MoveToFlag( OwnerID(), Flag , i+M ,0 )
		if M == 4 and i == 2 then
			sleep( 25 )	
		end
		sleep(10)
	end
	DelObj( OwnerID() )
end