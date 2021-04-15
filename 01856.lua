--=========================================================--
-- �ݩR��--> �w�S�Jù(115486) �d�Ժ�(115485) ������(115488)
-- ��t��--> �w�S�Jù(115484) �d�Ժ�(115487) ������(115501)
--
--=========================================================--

function Lua_423270()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 423270 ) == true and CheckFlag( OwnerID(), 543911 )==false then	
		AddSpeakOption( OwnerID(), TargetID(), "[SC_423270_0]", "Lua_423270_do", 0 ) --���@�Ǹܭn��ڭ̻��H
	end
end

function Lua_423270_reset( player )
	local cala_Idle = LuaFunc_SearchNPCbyOrgID( OwnerID(), 115485, 200, 0)	--�d�Ժ�(������)
	CancelBuff_NoEvent( player, 506710 ) --�����@��
	CancelBuff_NoEvent( player, 503977 ) --�Ѱ��w��
	CancelBuff_NoEvent( player, 506112 ) --�Ѱ��аO	
	WriteRoleValue( cala_Idle, EM_RoleValue_Register, 0 )
end

function Lua_423270_test( )
	local cala_Idle = LuaFunc_SearchNPCbyOrgID( OwnerID(), 115485, 200, 0)--�d�Ժ�(������)
	local princess = LuaFunc_SearchNPCbyOrgID( OwnerID(), 115501, 200, 0) --������
	CancelBuff_NoEvent( OwnerID(), 506710 ) --�����@��
	CancelBuff_NoEvent( OwnerID(), 503977 ) --�Ѱ��w��
	CancelBuff_NoEvent( OwnerID(), 506112 ) --�Ѱ��аO
	LuaFunc_ResetObj( princess )		
	WriteRoleValue( cala_Idle, EM_RoleValue_Register, 0 )
end

function Lua_423270_do()
	
	local player = OwnerID() --���a����
	if ReadRoleValue( cala_Idle, EM_RoleValue_Register ) == 0 then
		CloseSpeak( player )
		local cala_Idle = LuaFunc_SearchNPCbyOrgID( player, 115485, 200, 0)	--�d�Ժ�(������)
		local cala_Act = LuaFunc_SearchNPCbyOrgID( player, 115487, 200, 0)	--�d�Ժ�(�t����)
		local ant_Act = LuaFunc_SearchNPCbyOrgID( player, 115484, 200, 0) --�w�S�Jù
		local princess = LuaFunc_SearchNPCbyOrgID( player, 115501, 200, 0) --������
		DisableQuest(cala_Act ,true)
		DisableQuest(ant_Act ,true)
		DisableQuest(princess ,true)
		MoveToFlagEnabled( princess, false )
		AddBuff( player, 506112, 1, 300 ) --client��BUFF
		CallPlot( cala_Act, "Lua_423270_0", player, cala_Idle, cala_Act, ant_Act, princess ) 		-- ���a �d�Ժ�I �d�Ժ�A �w�SA ��D
		WriteRoleValue( cala_Idle, EM_RoleValue_Register, 1 )
	else
		SetSpeakDetail( player, "[SC_423270_00]" )--�O�ڡI���ڷQ�Q�ӫ��}�f...
	end
end

function Lua_423270_check( player, cala )
	if CheckDistance( player, cala, 200 ) ==false then
		CancelBuff_NoEvent( player, 503977 ) 
		return false
	end
	if  CheckAcceptQuest( player, 423270 ) == false then
		CancelBuff_NoEvent( player, 503977 ) 
		return false
	end
	return true
end

function Lua_423270_0( player, cala_Idle, cala_Act, ant, princess )
	local FlagGroup = 780620
	local Color = "0xffffff00"	-- �j��T��������
	local x , y , z = 0 , 0 , 0
	WriteRoleValue( princess, EM_RoleValue_IsWalk, 1 )
	MoveToFlagEnabled( princess, false )
	
	Sleep(20)
	AdjustFaceDir( princess, cala_Act, 0 ) --�Ϧۤv���V�ؼ�	
	AdjustFaceDir( ant, cala_Act, 0 ) --�Ϧۤv���V�ؼ�	
	
	Setposbyflag(player  , 780620, 12 ) 					 --�ǰe���a
	CastSpell( player, player, 495597 )--���a�Q�w��(503977)	
	
	if Lua_423270_check( player, cala_Idle )==true then
		PlayMotion( cala_Act, ruFUSION_ACTORSTATE_EMOTE_SPEAK ) --���ܰʧ@	
		Say( cala_Act, "[SC_423270_1]" ) --�ڪ��۫O��O����...
		Sleep(50)
		Say( cala_Act, "[SC_423270_2]" ) --�İʡB�����ިӳ\�h�·�...	
		Sleep(40)
	else
		Lua_423270_reset( player )
	end
	
	if Lua_423270_check( player, cala_Idle )==true then	
		PlayMotion( ant, ruFUSION_ACTORSTATE_EMOTE_SPEAK ) --���ܰʧ@	
		Say( ant, "[SC_423270_3]" ) --�G�H����N...
		AdjustFaceDir( cala_Act, ant, 0 ) --�Ϧۤv���V�ؼ�
		Sleep(30)
	
		PlayMotion( cala_Act, ruFUSION_ACTORSTATE_EMOTE_SPEAK ) --���ܰʧ@	
		Say( cala_Act, "[SC_423270_4]" ) --���}�n������覡...
		Sleep(30)
	
		ScriptMessage( ant, player, 1, "[SC_423270_Sys]", Color ) --�D���A�w�S�Jù���H�������������S�@�ٲL���C
		ScriptMessage( ant, player, 0, "[SC_423270_Sys]", Color )
		PlayMotion( cala_Act, ruFUSION_ACTORSTATE_EMOTE_IDLE ) --���m�ʧ@	
		Sleep(40)
	else
		Lua_423270_reset( player )
	end
	
	if Lua_423270_check( player, cala_Idle )==true then
		PlayMotion( ant, ruFUSION_ACTORSTATE_EMOTE_SPEAK ) --���ܰʧ@	
		Say( ant, "[SC_423270_5]" ) --�ܼ}���H�w�U�J�D���....
		Sleep(50)
		
		PlayMotion( cala_Act, ruFUSION_ACTORSTATE_EMOTE_SPEAK ) --���ܰʧ@	
		Say( cala_Act, "[SC_423270_6]" ) --�ک��աA���M���M���L���s�D�]���ت�...
		Sleep(40)

		AdjustFaceDir( cala_Act, princess, 0 ) --�Ϧۤv���V�ؼ�
		PlayMotion( cala_Act, ruFUSION_ACTORSTATE_EMOTE_SPEAK ) --���ܰʧ@	
		Say( cala_Act, "[SC_423270_7]" ) --�L�h���Ϊv��...
		Sleep(40)
	else
		Lua_423270_reset( player )
	end
	
	if Lua_423270_check( player, cala_Idle )==true then
		PlayMotion( cala_Act, ruFUSION_ACTORSTATE_EMOTE_SPEAK ) --���ܰʧ@	
		Say( cala_Act, "[SC_423270_8]" ) --�ڴ�ť���k�^����g�D�N���S...s
		Sleep(50)
		PlayMotion( cala_Act, ruFUSION_ACTORSTATE_EMOTE_SPEAK ) --���ܰʧ@	
		Say( cala_Act, "[SC_423270_9]" ) --�O�����٥O�ƥ�A�����t....

		Sleep(20)
	--	ks_MoveToFlag( princess, FlagGroup, 10, 0 )
		Sleep(10)
		x , y , z  =GetMoveFlagValue( FlagGroup , 10 , EM_RoleValue_X ), GetMoveFlagValue( FlagGroup , 10 , EM_RoleValue_Y) , GetMoveFlagValue( FlagGroup , 10 , EM_RoleValue_Z)
		while true do
			local Time = MoveDirect( princess , x , y , z  )
			sleep(Time+1)
	--		LuaFunc_MoveToFlag( princess, FlagGroup, 10, 0 )
			if DW_CheckDis( princess, FlagGroup, 10, 5 ) == true then	
				StopMove( princess  ,false )
				break
			end
		end
	else
		Lua_423270_reset( player )
	end

	if Lua_423270_check( player, cala_Idle )==true then
		--sleep( 10 )
		AdjustFaceDir( princess, cala_Act , 0 ) --�Ϧۤv���V�ؼ�
		--WriteRoleValue( princess, EM_RoleValue_IsWalk, 0 )

		Sleep(10)
		PlayMotion( princess, ruFUSION_ACTORSTATE_CROUCH_BEGIN ) --���U
		Say( princess, "[SC_423270_10]" ) --�O�A�L�h����H�������ۤ��|����
		Sleep(40)

		--WriteRoleValue( princess, EM_RoleValue_IsWalk, 1 )
		--LuaFunc_MoveToFlag( princess, FlagGroup, 11, 0 )
		x , y , z  =GetMoveFlagValue( FlagGroup , 11 , EM_RoleValue_X ), GetMoveFlagValue( FlagGroup , 11 , EM_RoleValue_Y) , GetMoveFlagValue( FlagGroup , 11 , EM_RoleValue_Z)
		while true do
			local Time = MoveDirect( princess , x , y , z  )
			sleep(Time+1)
			if DW_CheckDis( princess, FlagGroup, 11, 5 ) == true then	
				StopMove( princess  ,false )
				break
			end
		end
		Sleep(20)

		CancelBuff_NoEvent( player, 506112 ) --�Ѱ�client
		CancelBuff_NoEvent( player, 503977 ) --�Ѱ��w��
		SetFlag( player, 543911, 1 )	--���o��������
		AdjustFaceDir( princess, cala_Act , 0 ) --�Ϧۤv���V�ؼ�
		MoveToFlagEnabled( princess, true )
		sleep(10)
		LuaFunc_ResetObj( princess )					
		WriteRoleValue( cala_Idle, EM_RoleValue_Register, 0 )
	else
		Lua_423270_reset( player )
	end
end






