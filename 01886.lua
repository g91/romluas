function Lua_423210_say()
	local T_ID = TargetID() --����J
	local O_ID = OwnerID() --���a	
	if CheckAcceptQuest( O_ID, 423210 ) == true and ReadRoleValue( T_ID, EM_RoleValue_Register1 ) > 0 then
		SetSpeakDetail( O_ID, "[SC_422693_7]" ) --�еy���ڤ@�U�C
	elseif CheckAcceptQuest( O_ID, 423210 ) == true and CheckFlag( O_ID, 544286 ) ~= true then
		SetSpeakDetail( O_ID, "[SC_423210_0]" ) --�A�ǳƦn�n�h���X���[115752]�F�ܡH
		AddSpeakOption( O_ID, T_ID, "[SC_111796_0]", "Lua_423210_1",0) --�ڷǳƦn�F�C
	else
		LoadQuestOption( O_ID )
	end
end

function Lua_423210_1()
	local T_ID = TargetID() --����J
	local O_ID = OwnerID() --���a
	CloseSpeak( OwnerID() )
	
	WriteRoleValue( O_ID, EM_RoleValue_Register1, 1 )
	BeginPlot( T_ID, "Lua_423210_2", 0 )
end

function Lua_423210_2()
	while true do
		local QuestID = 423210
		local FinishFlagID = 544286
		local CheckBuffID = 507178
		local CheckRange = 50
		local DoScript = "Lua_423210_break"		
		local FlagGroup = 780595
		ks_AddBuff( QuestID, FinishFlagID, CheckBuffID, CheckRange, DoScript )		
				
		local mo = Lua_423208_obj( 115895, FlagGroup, 11 )		
		local old = LuaFunc_SearchNPCbyOrgID( OwnerID(), 115939, 100, 0 )
		old = LuaFunc_CreateObjByObj( 115897, old )
		ks_ActSetMode( old )
		ks_ActSetMode( mo )
		Lua_423210_setPos()
		CallPlot( mo, "ks_QuestCheck", QuestID, FinishFlagID, CheckBuffID, CheckRange, DoScript )
		
		AdjustFaceDir( mo, old, 0 ) --���V�ؼ�
		PlayMotion( mo, ruFUSION_ACTORSTATE_EMOTE_SPEAK )	--���ܰʧ@
		Say( mo, "[SC_423210_1]" ) --�A�n�A�аݧA���L�o�ӶܡH
		sleep(25)
		AdjustFaceDir( old, mo, 0 ) --���V�ؼ�
		PlayMotion( old, ruFUSION_ACTORSTATE_SHIELD_BLOCK )	--���ܰʧ@
		Say( old, "[SC_423210_2]" ) --�o!! �A�q���̧��o���a�����H�����D�H�O�I�A������o�ܡI
		sleep(5)
		PlayMotion( mo, ruFUSION_ACTORSTATE_PARRY_UNARMED )	--�j��
		sleep(20)
		Say( mo, "[SC_423210_3]" ) --�N�R�U�ӡI�N�R�U�ӡI�A���D[115893]�o�өm��H
		sleep(35)
		PlayMotion( old, ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )	--�I�Y
		Say( old, "[SC_423210_4]" ) --�I...... �藍�_�A�ڨS�Q���ٷ|�A�ݨ�o���a���A�A�̪��D�o�̥H�e�O�y�p���ܡH		
		sleep(25)
		PlayMotion( mo, ruFUSION_ACTORSTATE_EMOTE_SPEAK )	--���ܰʧ@
		Say( mo, "[SC_423210_5]" ) --�ڷQ�_�ӤF�I��ӬO����A�ڥH�e��o�̪��ɭԫ����٦b�C		
		sleep(25)
		PlayMotion( old, ruFUSION_ACTORSTATE_EMOTE_SPEAK )	--���ܰʧ@
		Say( old, "[SC_423210_6]" ) --��A���O�T�~�e���ƤF�A...
		sleep(25)
		Say( mo, "[SC_423210_7]" ) --����A���D......		
		sleep(25)
		PlayMotion( old, ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )	--�n�Y
		Say( old, "[SC_423210_8]" ) --���n�N��.......�ڻ��o�Ӧh�F�A�ڷQ�n�n���ڪ��k�ਫ���̫�@�{�A�ЧA�̥��X�h�a�C
		sleep(25)
		PlayMotion( mo, ruFUSION_ACTORSTATE_EMOTE_SPEAK )	--���ܰʧ@
		Say( mo, "[SC_423210_9]" ) --�O�D���F�H
		sleep(25)
		PlayMotion( old, ruFUSION_ACTORSTATE_EMOTE_CRY )	--���ܰʧ@
		Say( old, "[SC_423210_10]" ) --�o�b�и̪��ɭԳQ�@�بu�����r�D�r�F...		
		sleep(25)
		ks_MoveToFlag( mo, FlagGroup, 12, 0 )
		sleep(20)
		CallPlot( mo, "ks_QuestEnd", QuestID, FinishFlagID, CheckBuffID, CheckRange, DoScript )		
		break
	end
end

function Lua_423210_break()
	local Obj = LuaFunc_SearchNPCbyOrgID( OwnerID(), 115894, 100, 0 )
	local old = LuaFunc_SearchNPCbyOrgID( OwnerID(), 115897, 100, 0 )
	
	if old ~= nil then delobj(old) end		
	ks_resetObj( Obj, nil )
	delobj( OwnerID())
end

function Lua_423210_setPos()
	local player = {}
	local playerCount = 0
	local FlagGroup = 780595	
	local x = GetMoveFlagValue( FlagGroup, 13, EM_RoleValue_X ) 
	local y = GetMoveFlagValue( FlagGroup, 13, EM_RoleValue_Y )
	local z = GetMoveFlagValue( FlagGroup, 13, EM_RoleValue_Z )
	player = SearchRangePlayer ( OwnerID(), 60 ) 
	
	for pry , obj in pairs( player ) do
		playerCount = playerCount + 1
	end
	for i= 0, playerCount-1 do
		if CheckAcceptQuest( player[i], 423210 ) == true and CheckBuff( player[i], 507178 ) == true then 
			AddBuff( player[i], 506098, 0, -1 )--�e���@��
			sleep(3)
			x = x + rand(10) - rand(10)
			z = z + rand(10) - rand(10)
			SetPos( player[i], x, y, z, 0 )
			CancelBuff( player[i], 506098 )
		end
	end
end


--========================================================================================--

function Lua_423444_get()
	local T_ID = TargetID()--�b����
	local O_ID = OwnerID() --���a	
	
	if CountBodyItem( O_ID, 207713 ) < 5 then
		GiveBodyItem( O_ID, 207713, 1 )
		sleep(1)
		if CountBodyItem( O_ID, 207713 ) == 5 then
			SetFlag( O_ID, 544328, 1 )
		end
	end
	return 1
end

--========================================================================================--

function Lua_423445_say()
	local T_ID = TargetID() --����J
	local O_ID = OwnerID() --���a	
	if CheckAcceptQuest( O_ID, 423445 ) == true and ReadRoleValue( T_ID, EM_RoleValue_Register1 ) > 0 then
		SetSpeakDetail( O_ID, "[SC_422693_7]" ) --�еy���ڤ@�U�C
	elseif CheckAcceptQuest( O_ID, 423445 ) == true and CheckFlag( O_ID, 544285 ) ~= true then
		SetSpeakDetail( O_ID, "[SC_422161_22]" ) --�A�ǳƦn�F�ܡH
		AddSpeakOption( O_ID, T_ID, "[SC_111796_0]", "Lua_423445_1",0) --�ڷǳƦn�F�C
	else
		LoadQuestOption( O_ID )
	end
end

function Lua_423445_sleep()
	SetDefIdleMotion( OwnerID(), ruFUSION_MIME_IDLE_DEAD )
end

function Lua_423445_do()
	if CheckCompleteQuest( OwnerID(), 423445 ) == true or CheckFlag( OwnerID(), 544285 ) == true then
		SetSpeakDetail( OwnerID(), "[SC_423445_3]" ) --�o�����Y�ήi�}�ӡA���N���_�������A�N������Ƥ]�S�o�͹L���wí�εۤF�A�ݨӬO�w�g�����I�ҡC
	elseif CheckBuff( TargetID(), 507178 ) == true then
		SetSpeakDetail( OwnerID(), "[SC_423445_1]" ) --�o�Ӥk�ĵo�۰��N�A�B�Y�W�����F���]�A�������M�A�����S����k�M�A��͡C
		AddSpeakOption( OwnerID(), TargetID(), "[SC_423445_2]", "Lua_423445_end",0) --���o�l�J�b���媺���D
	else
		SetSpeakDetail( OwnerID(), "[SC_423445_1]" ) --�o�Ӥk�ĵo�۰��N�A�B�Y�W�����F���]�A�������M�A�����S����k�M�A��͡C
	end	
end

function Lua_423445_1()
	local T_ID = TargetID() --����J
	local O_ID = OwnerID() --���a
	CloseSpeak( OwnerID() )

	WriteRoleValue( T_ID, EM_RoleValue_Register1, 1 )
	BeginPlot( T_ID, "Lua_423445_2", 0 )
end

function Lua_423445_2()
	while true do
		local QuestID = 423445
		local FinishFlagID = 544285
		local CheckBuffID = 507178
		local CheckRange = 50
		local DoScript = "Lua_423445_break"		
		CallPlot( OwnerID(), "ks_QuestAddBuff", QuestID, FinishFlagID, CheckBuffID, CheckRange, DoScript )
		
		local mo = LuaFunc_CreateObjByObj( 116095, OwnerID() )
		ks_ActSetMode( mo )
		local dau = LuaFunc_SearchNPCbyOrgID( OwnerID(), 115896, 50, 0 )
		local old = LuaFunc_SearchNPCbyOrgID( OwnerID(), 115939, 50, 0 )
		old = LuaFunc_CreateObjByObj( 116096, old )
		ks_ActSetMode( old )
		AdjustFaceDir( mo, dau, 0 )
		AdjustFaceDir( old, dau, 0 )
		
		sleep(15)
		Say( mo, "[SC_423445_01]" ) --�ڲ{�b�}�l�I�k�A�O�o��[207713]�����o�D
		AddBuff( mo, 502662, 1, 15 ) --��o��
		PlayMotionEX( mo,ruFUSION_ACTORSTATE_CHANNEL_BEGIN, ruFUSION_ACTORSTATE_CHANNEL_LOOP )
		sleep(25)
		AddBuff( dau, 507178, 1, 12 )
		Say( mo, "[SC_423445_02]" ) --�N�O�{�b!!
		sleep(120)
		CallPlot( OwnerID(), "ks_QuestEnd", QuestID, nil, CheckBuffID, CheckRange, DoScript )
		break
	end
end

function Lua_423445_end()
	local mo = LuaFunc_SearchNPCbyOrgID( OwnerID(), 115930, 50, 0 )
	CloseSpeak( OwnerID() )
	BeginPlot( mo, "Lua_423445_3", 0 )
end
	
function Lua_423445_3()
	local QuestID = 423445
	local FinishFlagID = 544285
	local CheckBuffID = 507178
	local CheckRange = 50
	local DoScript = "Lua_423445_break"	
	
	local Color = "0xffffff00"	-- �j��T��������
	local player = {}
	local playerCount = 0	
	local mo = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116095, 50, 0 )
	local dau = LuaFunc_SearchNPCbyOrgID( OwnerID(), 115896, 50, 0 )
	CancelBuff( dau, 507178 )
	player = SearchRangePlayer ( OwnerID(), 50 )
	
	for pry , obj in pairs( player ) do
		playerCount = playerCount + 1
	end
	for i= 0, playerCount-1 do
		if CheckAcceptQuest( player[i], QuestID ) == true and CheckBuff( player[i], CheckBuffID ) == true then 
			ScriptMessage( player[i], player[i], 1 , "[SC_423445_3]", Color )
			ScriptMessage( player[i], player[i], 0 , "[SC_423445_3]", Color )				
		end
	end
	CallPlot( OwnerID(), "ks_QuestEnd", QuestID, FinishFlagID, CheckBuffID, CheckRange, DoScript )	
end

function Lua_423445_break()
	debugmsg( 0,0, "Do break" )
	local dau = LuaFunc_SearchNPCbyOrgID( OwnerID(), 115896, 50, 0 )
	local mo = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116095, 50, 0 )
	local old = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116096, 50, 0 )
	
	CancelBuff( dau, 507178 )
	if mo ~= nil then delobj(mo) end
	if old ~= nil then delobj(old) end
	ks_resetObj( OwnerID(), nil )
end

--========================================================================================--

function Lua_423446_say()
	local T_ID = TargetID() --���
	local O_ID = OwnerID() --���a	
	if	CheckAcceptQuest( O_ID, 423446 ) == true then
		SetSpeakDetail( O_ID, "[SC_423446_00]" ) --�ڦw�y�p�k����A�N�|�L�h��A�̡C
	elseif CheckCompleteQuest( O_ID, 423445 ) == true and CheckCompleteQuest( O_ID, 423446 ) == true then		
		SetSpeakDetail( O_ID, "[SC_423446_0]" ) --�Q���P��...
	else
		LoadQuestOption( O_ID )
	end
end

function Lua_423446_set()
	SetDefIdleMotion( OwnerID(), ruFUSION_MIME_ACTIVATE_LOOP )
	local x = ReadRoleValue( OwnerID(), EM_RoleValue_X )
	local y = ReadRoleValue( OwnerID(), EM_RoleValue_Y ) - 5
	local z = ReadRoleValue( OwnerID(), EM_RoleValue_Z )	
	SetModeEx( OwnerID() , EM_SetModeType_Gravity , false )
	SetModeEx( OwnerID() , EM_SetModeType_Move , false )
	sleep(1)
	SetPos( OwnerID(), x, y, z, 0 )
	Hide(OwnerID())
	Show(OwnerID(), 0 )
end

function Lua_423446_start()
	local T_ID = TargetID()--����
	local O_ID = OwnerID() --���a
	if CheckFlag( O_ID, 544287) ~= true then	
		BeginPlot( T_ID, "Lua_423446_1", 0 )
		SetModeEx( T_ID, EM_SetModeType_Mark , false )
		DisableQuest( T_ID, true )
	end	
	return 1
end

function Lua_423446_1()
	while true do			
		local QuestID = 423446
		local FinishFlagID = 544287
		local CheckBuffID = 507178
		local CheckRange = 100
		local DoScript = "Lua_423446_break"		
		local FlagGroup = 780595
		CallPlot( OwnerID(), "ks_QuestAddBuff", QuestID, FinishFlagID, CheckBuffID, CheckRange, DoScript )
		
		local T_ID = TargetID()	--���a
		local O_ID = OwnerID()	--����
		local old = Lua_423208_obj( 115897, FlagGroup, 15 )
		local mo = LuaFunc_SearchNPCbyOrgID( OwnerID(), 115940, 50, 0 )
		mo = LuaFunc_CreateObjByObj( 115895, mo )
		ks_ActSetMode( mo )
		AdjustFaceDir( old, O_ID, 0 ) --���V�ؼ�
		AdjustFaceDir( mo, O_ID, 0 ) --���V�ؼ�
		SetDefIdleMotion( OwnerID(), ruFUSION_MIME_IDLE_STAND )
		Lua_423446_setPos( QuestID, CheckBuffID )
		
		sleep(10)
		AdjustFaceDir( old, mo, 0 ) --���V�ؼ�
		PlayMotion( old, ruFUSION_ACTORSTATE_EMOTE_SALUTE2 )	--���ܰʧ@
		Say( old, "[SC_423446_1]" ) --�A���P�§A�̡C�A�̥i��������ڭn�A�̨�o�ӡH
		sleep(25)
		AdjustFaceDir( mo, O_ID, 0 ) --���V�ؼ�
		PlayMotion( mo, ruFUSION_ACTORSTATE_EMOTE_POINT )	--���V
		Say( mo, "[SC_423446_2]") --���D�o���֦�����S��γ~�H
		sleep(25)
		PlayMotion( old, ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )	--���ܰʧ@
		Say( old, "[SC_423446_3]" ) --���T�A���[ZONE_ZARAMONDE]���F..		
		AdjustFaceDir( mo, old, 0 ) --���V�ؼ�
		sleep(50)
		AdjustFaceDir( old, O_ID, 0 ) --���V�ؼ�
		Say( old, "[SC_423446_4]" ) --�L������[ZONE_ZARAMONDE]�b�o�̪��n�x..		
		sleep(25)
		PlayMotion( old, ruFUSION_ACTORSTATE_EMOTE_POINT )	--���V
		sleep(25)
		PlayMotion( mo, ruFUSION_ACTORSTATE_EMOTE_SPEAK )	--���ܰʧ@
		Say( mo, "[SC_423446_5]" ) --����������{�b��B�H		
		sleep(25)
		AdjustFaceDir( old, mo, 0 ) --���V�ؼ�
		PlayMotion( old, ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )	--�n�Y
		Say( old, "[SC_423446_6]" ) --��......�w�g���T�~�S�����󪺮���...		
		sleep(35)
		Say( mo, "[SC_423446_7]" ) --����[115868]�O�H�L�b���H		
		sleep(25)
		PlayMotion( old, ruFUSION_ACTORSTATE_EMOTE_SPEAK )	--���ܰʧ@
		Say( old, "[SC_423446_8]" ) --�A���D[115891]�H�ڤ��e���O��..
		sleep(35)
		AdjustFaceDir( old, O_ID, 0 ) --���V�ؼ�
		PlayMotion( old, ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )	--�n�Y
		Say( old, "[SC_423446_9]" ) --���A���Ƥ����^��...		
		sleep(25)
		PlayMotion( mo, ruFUSION_ACTORSTATE_EMOTE_SALUTE2 )	--�q§
		Say( mo, "[SC_423446_10]" )--�A��i���o��
		sleep(10)		
		while true do
			local time = ks_MoveToFlag( old, FlagGroup, 17, 0 )--����
			sleep(5+time)
			if DW_CheckDis( old, FlagGroup, 17, rand(10) ) == true then
				StopMove( old, false )
				break
			end
		end
		sleep(20)
		CallPlot( OwnerID(), "ks_QuestEnd", QuestID, FinishFlagID, CheckBuffID, CheckRange, DoScript )
		break
	end	
end

function Lua_423446_setPos( QuestID, CheckBuffID )
	local player = {}
	local playerCount = 0
	local FlagGroup = 780595
	local x = GetMoveFlagValue( FlagGroup, 16, EM_RoleValue_X ) 
	local y = GetMoveFlagValue( FlagGroup, 16, EM_RoleValue_Y )
	local z = GetMoveFlagValue( FlagGroup, 16, EM_RoleValue_Z )
	player = SearchRangePlayer ( OwnerID(), 50 ) 
	
	for pry , obj in pairs( player ) do
		playerCount = playerCount + 1
	end
	for i= 0, playerCount-1 do
		if CheckAcceptQuest( player[i], QuestID ) == true and CheckBuff( player[i], CheckBuffID ) == true then 
			AddBuff( player[i], 506098, 0, -1 )--�e���@��
			sleep(3)
			x = x + rand(20) - rand(20)
			z = z + rand(20) - rand(20)
			SetPos( player[i], x, y, z, 0 )
			CancelBuff( player[i], 506098 )
		end
	end
end

function Lua_423446_break()
	local mo = LuaFunc_SearchNPCbyOrgID( OwnerID(), 115895, 50, 0 )
	local old = LuaFunc_SearchNPCbyOrgID( OwnerID(), 115897, 100, 0 )
		
	if mo ~= nil then delobj(mo) end
	if old ~= nil then delobj(old) end
	ks_resetObj( OwnerID(), nil )	
end

--========================================================================================--

function Lua_423447_set()
	local EM = {	[1]=EM_RoleValue_Register1,
					[2]=EM_RoleValue_Register2,
					[3]=EM_RoleValue_Register3	}
	for i=1, 3 do		
		WriteRoleValue( TargetID(), EM[i], 0 )
	end
end

function Lua_423447_say()
	local T_ID = TargetID() --����
	local O_ID = OwnerID() --���a
	local reg = {}
	reg[1] = ReadRoleValue( O_ID, EM_RoleValue_Register1 )
	reg[2] = ReadRoleValue( O_ID, EM_RoleValue_Register2 )
	reg[3] = ReadRoleValue( O_ID, EM_RoleValue_Register3 )
	local pid = ReadRoleValue( T_ID, EM_RoleValue_PID )
	LoadQuestOption( O_ID )
	
	if CheckAcceptQuest( O_ID, 423447 ) == true then
		for i=1, 3 do
			if reg[i] == 0 then			
				if reg[i] ~= pid then
					AddSpeakOption( O_ID, T_ID, "[SC_423447_1]", "Lua_423447_1",0) --�߰ݩM[ZONE_SLEY]�������T��
					break
				end
			elseif reg[i] ~= 0 then
				debugmsg(0,0,"reg = "..reg[i])
				--break
			end
		end
	end
end

function Lua_423447_1()
	local T_ID = TargetID() --����
	local O_ID = OwnerID() --���a
	local reg = {}
	local count = 0
	local EM = {	[1]=EM_RoleValue_Register1,
					[2]=EM_RoleValue_Register2,
					[3]=EM_RoleValue_Register3	}
	local pid = ReadRoleValue( T_ID, EM_RoleValue_PID )
	
	for i=1, 3 do
		reg[i] = ReadRoleValue( O_ID, EM[i] )
		if reg[i] == 0 then
			WriteRoleValue( O_ID, EM[i], pid )
			DW_QietKillOne( 0, 104111 )
			for j=1, 3 do
				reg[j] = ReadRoleValue( O_ID, EM[j] )
				if reg[j] ~= 0 then
					count = count + 1
					if count == 3 then
						SetFlag( O_ID, 544297, 1 )
					end
				end
			end
			break
		end
	end
	SetSpeakDetail( O_ID, "[SC_423447_2]" ) --[ZONE_SLEY]�H�A�����ӹA��ܡH
end

--========================================================================================--