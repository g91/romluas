
function Lua_423450_Say()
	local T_ID = TargetID() --�ҫk
	local O_ID = OwnerID() --���a	
	if CheckAcceptQuest( O_ID, 423450 ) == true and CheckFlag( O_ID, 544298 ) ~= true and ReadRoleValue( T_ID, EM_RoleValue_Register1 ) > 0 then
		SetSpeakDetail( O_ID, "[SC_423450_01]" ) --(�L���G���b������...)
	elseif CheckAcceptQuest( O_ID, 423450 ) == true and CheckFlag( O_ID, 544298 ) ~= true then
		SetSpeakDetail( O_ID, "[SC_423450_00]" ) --(�L���G�b�Q�ۤ���...)
		AddSpeakOption( O_ID, T_ID, "[SC_423450_0]", "Lua_423450_1",0) --��L���۩I
	else
		LoadQuestOption( O_ID )
	end
end

function Lua_423450_1()
	local T_ID = TargetID() --�ҫk
	local O_ID = OwnerID() --���a
	CloseSpeak( OwnerID() )
	
	WriteRoleValue( O_ID, EM_RoleValue_Register1, 1 )
	BeginPlot( T_ID, "Lua_423450_2", 0 )
end

function Lua_423450_2()
	while true do
		local QuestID = 423450
		local FinishFlagID = 544298
		local CheckBuffID = 507178
		local CheckRange = 100
		local DoScript = "Lua_423450_break"		
		local FlagGroup = 780595
		local T_ID = TargetID()--���a
		CallPlot( OwnerID(), "ks_QuestAddBuff", QuestID, FinishFlagID, CheckBuffID, CheckRange, DoScript )
		
		local gill = LuaFunc_SearchNPCbyOrgID( OwnerID(), 115984, 80, 0 )
		lobo = LuaFunc_CreateObjByObj( 115999, OwnerID() )
		gill = LuaFunc_CreateObjByObj( 116000, gill )
		ks_ActSetMode( lobo )
		ks_ActSetMode( gill )		
		
		sleep(10)
		AdjustFaceDir( lobo, T_ID, 0 ) --���V�ؼ�
		AdjustFaceDir( gill, T_ID, 0 ) --���V�ؼ�
		Say( lobo, "[SC_423450_1]" )--�n�H�I�A�ӬݧکM�n�n�ܡH
		sleep(20)
		PlayMotion( gill, ruFUSION_ACTORSTATE_EMOTE_POINT )	--���V
		Say( gill, "[SC_423450_2]" )--�A�����o�̪��H
		sleep(20)
		local mo = LuaFunc_SearchNPCbyOrgID( OwnerID(), 115981, 50, 0 )
		mo = LuaFunc_CreateObjByObj( 116002, mo )
		AdjustFaceDir( mo, gill, 0 ) --���V�ؼ�
		PlayMotion( mo, ruFUSION_ACTORSTATE_EMOTE_SALUTE2 )	--�q§
		Say( mo, "[SC_423450_3]" )--�O�ڧ�쪺�C
		AdjustFaceDir( gill, mo, 0 ) --���V�ؼ�
		AdjustFaceDir( lobo, mo, 0 ) --���V�ؼ�
		sleep(25)
		PlayMotion( gill, ruFUSION_ACTORSTATE_EMOTE_SPEAK )	--���ܰʧ@
		Say( gill, "[SC_423450_4]" )--�A......�ڧ̻��A�ѥͥi�H���ܥ~�[�A�u���ܡH
		sleep(35)
		CastSpell( mo, mo, 494222 ) ----�{��				
		sleep(10)
		Say( mo, "[SC_423450_5]" )--�ڥi�S�ܥ���F��C
		PlayMotion( mo, ruFUSION_ACTORSTATE_EMOTE_SALUTE2 )	--�q§
		sleep(10)
		local mo1 = LuaFunc_CreateObjByObj( 116001, mo )
		DelObj(mo)
		ks_ActSetMode( mo1 )
		AdjustFaceDir( mo1, gill, 0 ) --���V�ؼ�
		sleep(20)
		Say( gill, "[SC_421543_5]" )--.......
		sleep(15)
		PlayMotion( gill, ruFUSION_ACTORSTATE_EMOTE_SPEAK )	--���ܰʧ@
		Say( gill, "[SC_423450_6]" )--�A��򰵨쪺�I�ЧڡA�D�D�A�I				
		sleep(20)
		Lua_423450_msg()--(�}�̶ǨӤj�s)��ڥX�h�I�K�I�A�̨�ӡI��ڥX�h�I		
		sleep(10)
		SetDir( mo1, 351 )
		sleep(15)
		Say( mo1, "[SC_423450_8]" )--���O�֡H
		PlayMotion( gill, ruFUSION_ACTORSTATE_EMOTE_POINT )	--���V
		sleep(25)
		PlayMotion( gill, ruFUSION_ACTORSTATE_EMOTE_SURRENDER ) --�Y�h
		Say( gill, "[SC_423450_9]" )--�@�ө_�Ǫ��å�
		sleep(20)
		CallPlot( OwnerID(), "ks_QuestEnd", QuestID, FinishFlagID, CheckBuffID, CheckRange, DoScript )
		break
	end
end

function Lua_423450_msg()
	local player = {}
	local playerCount = 0
	local Color = "0xffffff00"	-- �j��T��������
	player = SearchRangePlayer ( OwnerID(), 100 ) 
	
	for pry , obj in pairs( player ) do
		playerCount = playerCount + 1
	end
	for i= 0, playerCount-1 do
		if CheckAcceptQuest( player[i], 423450 ) == true and CheckBuff( player[i] , 507178 ) == true then 
			ScriptMessage( player[i], player[i], 1 , "[SC_423450_7]", Color )
			ScriptMessage( player[i], player[i], 0 , "[SC_423450_7]", Color )
		end
	end
end

function Lua_423450_break()
	local gill = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116000, 80, 0 )
	local lobo = LuaFunc_SearchNPCbyOrgID( OwnerID(), 115999, 80, 0 )
	local mo = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116001, 80, 0 )
	local mo1 = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116002, 80, 0 )
	
	if gill ~= nil then delobj(gill) end
	if lobo ~= nil then delobj(lobo) end
	if mo ~= nil then delobj(mo) end
	if mo1 ~= nil then delobj(mo1) end
	ks_resetObj( OwnerID(), nil )
end


--========================================================================================--

function Lua_423452_begin()
	local T_ID = TargetID()--����
	local O_ID = OwnerID() --���a	
	if CountBodyItem( O_ID, 207714 ) > 0 then
		return 1
	else
		ScriptMessage( T_ID, O_ID , 1 , "[SC_423452_0]" , 0 )--�S��[207714]�C
		ScriptMessage( T_ID, O_ID , 0 , "[SC_423452_0]" , 0 )		
		return 0
	end
end

function Lua_423452_end()
	local T_ID = TargetID()--����
	local O_ID = OwnerID() --���a	
	
	BeginPlot( T_ID, "Lua_423452_get", 0 )
	return 1
end

function Lua_423452_get()
	local O_ID = OwnerID() --����
	local T_ID = TargetID()--���a
	local gill = LuaFunc_SearchNPCbyOrgID( O_ID, 115984, 50, 0 )
	local lobo = LuaFunc_SearchNPCbyOrgID( O_ID, 115998, 50, 0 )
	Say( lobo, "[SC_423452_1]" ) --�j�j�A�ڨ{�l�j�C
	sleep(10)
	Say( gill, "[SC_423452_2]" )--�A���Ԥ@�ԧa�A���|�A�h��F��Y�C
	sleep(10)
	if CheckAcceptQuest( T_ID, 423452 ) == true and CountBodyItem( T_ID, 207714 ) > 0 then
		GiveBodyItem( T_ID, 207717, 1 )
		DelBodyItem( T_ID, 207714, 1 )
	end
end

function Lua_423452_say()
	local T_ID = TargetID() --����J
	local O_ID = OwnerID() --���a	

	if CheckAcceptQuest( O_ID, 423452 ) == true and CheckFlag( O_ID, 544198 ) ~= true then
		LoadQuestOption( O_ID )
		AddSpeakOption( O_ID, T_ID, "[SC_423452_3]", "Lua_423452_re",0 ) --��z�}�Ǫ��n�D		
	else
		LoadQuestOption( O_ID )
	end
end

function Lua_423452_re()
	local T_ID = TargetID() --����J
	local O_ID = OwnerID() --���a
	SetSpeakDetail( O_ID, "[SC_423452_4]" ) --�J�M�L�O�u���Q���_��...
end

function Lua_423452_say1()
	local T_ID = TargetID() --�_�Ǫ��}��
	local O_ID = OwnerID() --���a	

	if CheckAcceptQuest( O_ID, 423452 ) == true and CheckFlag( O_ID, 544198 ) ~= true and CountBodyItem( O_ID, 207717 ) > 0 then
		LoadQuestOption( O_ID )
		AddSpeakOption( O_ID, T_ID, "[SC_423452_5]", "Lua_423452_1",0 ) --�N[207717]���L
	else
		LoadQuestOption( O_ID )
	end
end

function Lua_423452_1()
	local T_ID = TargetID() --�_�Ǫ��}��
	local O_ID = OwnerID() --���a
		
	SetSpeakDetail( O_ID, "[SC_423452_6]" ) --���I�ڪ��ѰڡI...
	AddSpeakOption( O_ID, T_ID, "[SC_423452_7]", "Lua_423452_2",0) --�߰ݩM�L��������
end

function Lua_423452_2()
	local T_ID = TargetID() --�_�Ǫ��}��
	local O_ID = OwnerID() --���a
	
	SetSpeakDetail( O_ID, "[SC_423452_8]" ) --�~���H�N�O����§��...
	SetFlag( O_ID, 544198, 1 )
	DelBodyItem( O_ID, 207717, 1 )
end

--========================================================================================--

function Lua_423453_get()
	local T_ID = TargetID()--�P����
	local O_ID = OwnerID() --���a	
	
	if CountBodyItem( O_ID, 207466 ) < 5 then
		GiveBodyItem( O_ID, 207466, 1 )
		if CountBodyItem( O_ID, 207466 ) == 5 then
			SetFlag( O_ID, 544233, 1 )
		end
	end
	return 1
end

--========================================================================================--

function Lua_423454_say()
	local T_ID = TargetID() --�h��w
	local O_ID = OwnerID() --���a
	
	if CheckAcceptQuest( O_ID, 423454 ) == true and CheckFlag( O_ID, 544199 ) ~= true and CountBodyItem( O_ID, 207465 ) > 0 and ReadRoleValue( T_ID, EM_RoleValue_Register1 ) > 0 then
		SetSpeakDetail( O_ID, "[SC_423450_01]" ) --(�L���G���b������...)
	elseif CheckAcceptQuest( O_ID, 423454 ) == true and CheckFlag( O_ID, 544199 ) ~= true and CountBodyItem( O_ID, 207465 ) > 0 then
		LoadQuestOption( O_ID )
		AddSpeakOption( O_ID, T_ID, "[SC_423454_0]", "Lua_423454_1",0 ) --��[207465]���L��
	else
		LoadQuestOption( O_ID )
	end
end

function Lua_423454_1()
	local T_ID = TargetID() --�h��w
	local O_ID = OwnerID() --���a
	CloseSpeak( OwnerID() )
	
	DelBodyItem( O_ID, 207465, 1 )
	WriteRoleValue( T_ID, EM_RoleValue_Register1, 1 )
	BeginPlot( T_ID, "Lua_423454_2", 0 )
end	

function Lua_423454_2()	
	while true do
		local T_ID = TargetID() --���a
		local QuestID = 423454
		local FinishFlagID = 544199
		local CheckBuffID = 507178
		local CheckRange = 100
		local DoScript = "Lua_423454_break"		
		local FlagGroup = 780595
		CallPlot( OwnerID(), "ks_QuestAddBuff", QuestID, FinishFlagID, CheckBuffID, CheckRange, DoScript )
		
		
		local gill = LuaFunc_SearchNPCbyOrgID( OwnerID(), 115984, 80, 0 )
		local lobo = LuaFunc_SearchNPCbyOrgID( OwnerID(), 115998, 80, 0 )
		local mo = LuaFunc_SearchNPCbyOrgID( OwnerID(), 115981, 80, 0 )
		gill = LuaFunc_CreateObjByObj( 116098, gill )
		lobo = LuaFunc_CreateObjByObj( 116097, lobo )
		mo = LuaFunc_CreateObjByObj( 116099, mo )
		doo = LuaFunc_CreateObjByObj( 116016, OwnerID() )
		SetDefIdleMotion( lobo, ruFUSION_MIME_IDLE_STAND_02 )
		ks_ActSetMode( gill )
		ks_ActSetMode( lobo )
		ks_ActSetMode( mo )
		ks_ActSetMode( doo )
				
		sleep(15)
		if T_ID ~= nil then
			AdjustFaceDir( doo, T_ID, 0 ) --���V�ؼ�
		else
			AdjustFaceDir( doo, mo, 0 ) --���V�ؼ�
		end
		Say( doo, "[SC_423454_01]" ) --�o����H
		PlayMotion( doo, ruFUSION_ACTORSTATE_EMOTE_DRINK )	--���ܰʧ@
		sleep(30)
		PlayMotion( doo, ruFUSION_ACTORSTATE_EMOTE_DANCE )	--���ܰʧ@
		Say( doo, "[SC_423454_02]" ) --��šI�o���N��n�C...		
		sleep(30)
		AdjustFaceDir( mo, doo, 0 ) --���V�ؼ�
		AdjustFaceDir( gill, doo, 0 ) --���V�ؼ�
		AdjustFaceDir( lobo, doo, 0 ) --���V�ؼ�
		PlayMotion( mo, ruFUSION_ACTORSTATE_EMOTE_SPEAK )	--���ܰʧ@
		Say( mo, "[SC_423454_03]" )--�o�ӵy�ԦA�͡A�аݤ@�U�z�s���X���F�H			
		sleep(35)
		AdjustFaceDir( doo, mo, 0 ) --���V�ؼ�
		PlayMotion( doo, ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )	--���ܰʧ@
		Say( doo, "[SC_423454_04]" )--�c......�ڤ��O�o		
		sleep(25)
		PlayMotion( doo, ruFUSION_ACTORSTATE_EMOTE_SPEAK )	--���ܰʧ@
		Say( doo, "[SC_423454_05]" )--�o�˻��a...			
		sleep(15)
		Say( mo, "[SC_423207_0]" )--!!
		Say( gill, "[SC_423207_0]" )--!!
		sleep(5)
		Say( lobo, "[SC_423454_06]" )--??		
		sleep(25)
		PlayMotion( mo, ruFUSION_ACTORSTATE_SHIELD_BASH )	--���}
		Say( mo, "[SC_423454_07]" )--�K�I����...		
		sleep(35)
		PlayMotion( doo, ruFUSION_ACTORSTATE_EMOTE_STRETCH )	--���i�y
		Say( doo, "[SC_423454_08]" )--��M..		
		sleep(35)
		PlayMotion( mo, ruFUSION_ACTORSTATE_EMOTE_SPEAK )	--���ܰʧ@
		Say( mo, "[SC_423454_09]" )--�A�쩳�s����H
		sleep(25)
		PlayMotion( doo, ruFUSION_ACTORSTATE_EMOTE_PROVOKE )	--�D�]
		Say( doo, "[SC_423454_10]" )--[115751]�C�H�e���q�ɶ�...		
		sleep(25)
		AdjustFaceDir( lobo, gill, 0 ) --���V�ؼ�		
		Say( lobo, "[SC_423454_11]" )--�n�n�A�گu���j�F......
		sleep(15)
		AddBuff( lobo, 506984, 5, -1 )		
		SetModeEx( lobo , EM_SetModeType_Gravity , false )
		SetDefIdleMotion( lobo, ruFUSION_MIME_RUN_FORWARD )		
		sleep(5)
		local x = GetMoveFlagValue( FlagGroup, 20, EM_RoleValue_X ) 
		local y = GetMoveFlagValue( FlagGroup, 20, EM_RoleValue_Y )
		local z = GetMoveFlagValue( FlagGroup, 20, EM_RoleValue_Z )
		MoveDirect( lobo, x , y+40 , z )
		sleep(10)
		AdjustFaceDir( doo, lobo, 0 ) --���V�ؼ�
		DelObj(lobo)
		Say( doo, "[SC_423454_12]" )--���r�I��{�l�̭��n��...
		sleep(10)
		ks_MoveToFlag( doo, FlagGroup, 21, 0 )
		sleep(20)
		CallPlot( OwnerID(), "ks_QuestEnd", QuestID, FinishFlagID, CheckBuffID, CheckRange, DoScript )
		break
	end
end

function Lua_423454_break()
	local gill = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116098, 100, 0 )
	local lobo = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116097, 150, 0 )
	local mo = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116099, 100, 0 )
	local doo = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116016, 100, 0 )
		
	if gill ~= nil then delobj(gill) end
	if lobo ~= nil then delobj(lobo) end
	if mo ~= nil then delobj(mo) end
	if doo ~= nil then delobj(doo) end
	ks_resetObj( OwnerID(), nil )
end




--========================================================================================--

function Lua_423455_say()
	local T_ID = TargetID() --�h��w
	local O_ID = OwnerID() --���a	
	
	if CheckAcceptQuest( O_ID, 423455 ) == true and CheckFlag( O_ID, 544292 ) ~= true and ReadRoleValue( T_ID, EM_RoleValue_Register1 ) > 0 then
		SetSpeakDetail( O_ID, "[SC_423450_01]" ) --(�L���G���b������...)
	elseif CheckAcceptQuest( O_ID, 423455 ) == true and CheckFlag( O_ID, 544292 ) ~= true then
		LoadQuestOption( O_ID )		
		AddSpeakOption( O_ID, T_ID, "[SC_423455_0]", "Lua_423455_1",0 ) --�ݥL�b������
		AdjustFaceDir( T_ID, O_ID, 0 ) --���V�ؼ�
	else
		LoadQuestOption( O_ID )
		AdjustFaceDir( T_ID, O_ID, 0 ) --���V�ؼ�
	end
end

function Lua_423455_1()
	local T_ID = TargetID() --�h��w
	local O_ID = OwnerID() --���a
	SetSpeakDetail( O_ID, "[SC_423455_1]" )--��~���٦b�Q...
	AddSpeakOption( O_ID, T_ID, "[SC_423455_2]", "Lua_423455_2",0)--��L�D�p
end

function Lua_423455_2()
	local T_ID = TargetID() --�h��w
	local O_ID = OwnerID() --���a
	SetSpeakDetail( O_ID, "[SC_423455_3]" )--��F�A�������F
	AddSpeakOption( O_ID, T_ID, "[SC_423455_4]", "Lua_423455_3",0)--SC_423455_4
end
	
function Lua_423455_3()
	local T_ID = TargetID() --�h��w
	local O_ID = OwnerID() --���a	
	
	if ReadRoleValue( T_ID, EM_RoleValue_Register1 ) > 0 then
		SetSpeakDetail( O_ID, "[SC_423450_01]" ) --(�L���G���b������...)
	else
		CloseSpeak( OwnerID() )
		WriteRoleValue( T_ID, EM_RoleValue_Register1, 1 )
		BeginPlot( T_ID, "Lua_423455_4", 0 )
	end
end

function Lua_423455_4()
	while true do			
		local QuestID = 423455
		local FinishFlagID = 544292
		local CheckBuffID = 507178
		local CheckRange = 70
		local DoScript = "Lua_423455_break"		
		local FlagGroup = 780595		
		CallPlot( OwnerID(), "ks_QuestAddBuff", QuestID, FinishFlagID, CheckBuffID, CheckRange, DoScript )
					
		local doo = LuaFunc_CreateObjByObj( 116020, OwnerID() )
		ks_ActSetMode( doo )		
		sleep(15)
		Lua_423455_msg( QuestID, CheckBuffID, 1 )
		sleep(25)
		Lua_423455_msg( QuestID, CheckBuffID, 2 )
		Say( doo, "[SC_423207_0]" )--!!
		sleep(35)
		Lua_423455_msg( QuestID, CheckBuffID, 4 )		
		sleep(25)
		Lua_423455_msg( QuestID, CheckBuffID, 5 )
		PlayMotion( doo, ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
		sleep(35)	
		Lua_423455_msg( QuestID, CheckBuffID, 6 )
		Say( doo, "[SC_423207_0]" )--!!
		sleep(35)
		Lua_423455_msg( QuestID, CheckBuffID, 1 )
		sleep(25)		
		Lua_423455_msg( QuestID, CheckBuffID, 3 )		
		sleep(30)
		Lua_423455_msg( QuestID, CheckBuffID, 7 )			
		sleep(25)
		PlayMotion( doo, ruFUSION_ACTORSTATE_EMOTE_APPROVAL )
		Say( doo, "[SC_423455_7]" )--���i�X�Ӫ��b�s�H...
		sleep(20)
		CallPlot( OwnerID(), "ks_QuestEnd", QuestID, FinishFlagID, CheckBuffID, CheckRange, DoScript )		
		break
	end
end

function Lua_423455_msg( QuestID, CheckBuffID, Index )
	local player = {}
	local playerCount = 0
	local Color = "0xffffff00"	-- �j��T��������
	player = SearchRangePlayer ( OwnerID(), 100 ) 
	local Message = {}
	Message = {	
				[1] = "[SC_423455_50]";--[116001]���n���Ǩ�......
				[2] = "[SC_423455_51]";--�y......�o�O�p���a��
				[3] = "[SC_423455_52]";--���i�סH�O�A���ڭ̪������a�U�ǶܡH
				[4] = "[SC_423455_60]";--[115892]���n���Ǩ�......
				[5] = "[SC_423455_61]";--�L�����S��......�{�b��[115891]�O���ܦ��o�ӼҼ˫�~���L���C
				[6] = "[SC_423455_62]";--���ӮɭԡA�L�O�Q��b���i�׸̭���......
				[7] = "[SC_423455_63]";--�N�઺���n�Ǩ�......
				}
	for pry , obj in pairs( player ) do
		playerCount = playerCount + 1
	end
	for i= 0, playerCount-1 do
		if CheckAcceptQuest( player[i], QuestID ) == true and CheckBuff( player[i] , CheckBuffID ) == true then
			ScriptMessage( player[i], player[i], 1 , Message[Index], Color )
			ScriptMessage( player[i], player[i], 0 , Message[Index], Color )		
		end
	end		
end

function Lua_423455_break()
	local doo = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116020, 50, 0 )
	if doo ~= -1 then delobj(doo) end
	ks_resetObj( OwnerID(), nil )
end


--========================================================================================--

function Lua_423456_begin()
	local T_ID = TargetID()--����
	local O_ID = OwnerID() --���a
	if ReadRoleValue( T_ID, EM_RoleValue_Register2 ) == 0 then	
		return 1
	else
		ScriptMessage( T_ID, O_ID , 1 , "[SYS_AUCTION_WAIT_NEXT]" , 0 )--���L���A�еy�ԦA�աC
		ScriptMessage( T_ID, O_ID , 0 , "[SYS_AUCTION_WAIT_NEXT]" , 0 )
		return 0
	end
end

function Lua_423456_start()
	WriteRoleValue( TargetID(), EM_RoleValue_Register2, 1 )
	BeginPlot( TargetID(), "Lua_423456_1", 0 )
	DisableQuest( TargetID() , true )
	return 1
end

function Lua_423456_say()
	local T_ID = TargetID() --����J
	local O_ID = OwnerID() --���a		
	if CheckAcceptQuest( O_ID, 423456 ) == true and CheckFlag( O_ID, 544293 ) ~= true then
		SetSpeakDetail( O_ID, "[SC_423456_0]" )--�A���h����N�o���@�I�A�����ڭ���Y���a......
		AdjustFaceDir( T_ID, O_ID, 0 ) --���V�ؼ�
	else
		LoadQuestOption( O_ID )
		AdjustFaceDir( T_ID, O_ID, 0 ) --���V�ؼ�
	end
end

function Lua_423456_1()	
	while true do
		local QuestID = 423456
		local FinishFlagID = 544293
		local CheckBuffID = 507178
		local CheckRange = 100
		local DoScript = "Lua_423456_break"	
		CallPlot( OwnerID(), "ks_QuestAddBuff", QuestID, FinishFlagID, CheckBuffID, CheckRange, DoScript )
		
		local FlagGroup = 780595
		local doo = Lua_423208_obj( 116020, FlagGroup, 21 )
		local mo = LuaFunc_SearchNPCbyOrgID( OwnerID(), 115983, 100, 0 )
		local gill = LuaFunc_SearchNPCbyOrgID( OwnerID(), 115984, 100, 0 )
		local lobo = LuaFunc_SearchNPCbyOrgID( OwnerID(), 115998, 100, 0 )
		mo = LuaFunc_CreateObjByObj( 116102, mo )
		gill = LuaFunc_CreateObjByObj( 116101, gill )
		lobo = LuaFunc_CreateObjByObj( 116100, lobo )
		ks_ActSetMode( mo )
		ks_ActSetMode( gill )
		ks_ActSetMode( lobo )			
		AdjustFaceDir( mo, OwnerID(), 0 )
		while true do
			local time = ks_MoveToFlag( doo, FlagGroup, 22, 0 )			
			sleep(5+time)
			local  range = GetDistance( doo, OwnerID() )
			if range < 35 then	
				StopMove( doo, false )
				break
			end
		end			
		Say( doo, "[SC_423456_00]" )--���I�ڨ����A�̳o�Ǧ~���H�ݬݤ���s�u�����N�סI
		AdjustFaceDir( doo, OwnerID(), 0 )
		sleep(5)
		PlayMotion( doo, ruFUSION_ACTORSTATE_CRAFTING_BEGIN )		
		AdjustFaceDir( mo, gill, 0 )
		Say( mo, "[SC_423456_01]" )--�A���ӬO�H����a�H
		sleep(25)
		AdjustFaceDir( gill, mo, 0 )
		PlayMotion( gill, ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )--�I�Y
		Say( gill, "[SC_423456_02]" )--��......
		sleep(25)
		PlayMotion( mo, ruFUSION_ACTORSTATE_EMOTE_SPEAK )	--���ܰʧ@
		Say( mo, "[SC_423456_03]" )--�O�֧�A......�ܦ��b�s�H���H	
		sleep(20)
		PlayMotion( gill, ruFUSION_ACTORSTATE_EMOTE_ANGRY )	--����
		Say( gill, "[SC_423456_04]" )--�u�z����......���s�@�L�H�ʪ��c�]�I�L�̮ڥ��N���b�G�H�R�I�L��......
		sleep(20)
		PlayMotion( mo, ruFUSION_ACTORSTATE_EMOTE_SPEAK )	--���ܰʧ@
		Say( mo, "[SC_423456_05]" )--�N�R�I�I......�N�R�I......�ڭ̥��������ǰl���A�̪��H�p��H�L�̤]�O�u�z���⪺�H�H
		sleep(25)
		PlayMotion( gill, ruFUSION_ACTORSTATE_EMOTE_SURRENDER )	--�d��
		Say( gill, "[SC_423456_06]" )--�ڤ����D�A�ڱq�ӨS�b�u�z���⪺���I����o�{�L�L��......			
		sleep(25)
		Say( gill, "[SC_423456_07]" )--���ɭԡA�ڭ̰��˦��s��A��M�Q�L�̰�ŧ.....		
		sleep(25)
		PlayMotion( gill, ruFUSION_ACTORSTATE_EMOTE_CRY )	--���L
		Say( gill, "[SC_423456_08]" )--���Ӫ��ɭ�......�ڭ̴N�w�g�Q���_��..				
		sleep(15)
		ks_MoveToFlag( doo, FlagGroup, 23, 0 )		
		sleep(20)
		AdjustFaceDir( doo, gill, 0 )		
		Say( doo, "[SC_423456_09]" )--�H������_�͡A�ڬݹL�Ӧh���`�F�A���Y���A����a�I
		sleep(35)
		AdjustFaceDir( gill, doo, 0 )
		PlayMotion( doo, ruFUSION_ACTORSTATE_EMOTE_SPEAK )	--���ܰʧ@
		Say( doo, "[SC_423456_10]" )--����s���O�a�۸T�ҲŤ�~���ܦ��b�s�b�H
		AdjustFaceDir( mo, doo, 0 )
		sleep(25)
		PlayMotion( gill, ruFUSION_ACTORSTATE_EMOTE_POINT )--���V
		Say( gill, "[SC_423456_11]" )--��......���~��I
		sleep(35)
		PlayMotion( gill, ruFUSION_ACTORSTATE_EMOTE_CRY )	--���L
		Say( gill, "[SC_423456_12]" )--�Ҧ��H���]���祢�ѦӦ��h..		
		sleep(25)
		Say( mo, "[SC_423456_13]" )--����I
		AdjustFaceDir( doo, mo, 0 )
		AdjustFaceDir( mo, gill, 0 )
		sleep(10)		
		PlayMotion( doo, ruFUSION_ACTORSTATE_EMOTE_SPEAK )	--���ܰʧ@
		Say( doo, "[SC_423456_14]" )--�~���H�ڡI�s����j�n�I�A����ڡI
		sleep(15)
		AdjustFaceDir( mo, doo, 0 )
		AdjustFaceDir( gill, mo, 0 )
		Say( mo, "[SC_423456_15]" )--......
		sleep(20)
		PlayMotion( doo, ruFUSION_ACTORSTATE_EMOTE_SPEAK )	--���ܰʧ@
		Say( doo, "[SC_423456_16]" )--�u���O�A����H�A�]�O�b�s�H�H�A�ݰ_�Ӥ����ڡH
		sleep(10)
		CastSpell( mo, mo, 494222 ) ----�{��
		sleep(20)
		local mo1 = mo		
		mo = LuaFunc_CreateObjByObj( 116103, mo1 )
		DelObj(mo1)
		ks_ActSetMode( mo )
		AdjustFaceDir( mo, doo, 0 )
		sleep(15)
		PlayMotion( doo, ruFUSION_ACTORSTATE_EMOTE_LAUGH )
		sleep(20)
		Say( doo, "[SC_423456_17]" )--�گu�Q�ݨ��n�h�D�F����...
		sleep(25)
		Say( mo, "[SC_423456_18]" )--�ڤѥʹN�O�o�ˡC
		sleep(25)
		Say( doo, "[SC_423456_19]" )--�ѥ͡I���D�A�O�s�M�H��......
		CastSpell( mo, mo, 494222 ) ----�{��
		sleep(20)
		local mo1 = mo
		mo = LuaFunc_CreateObjByObj( 116102, mo1 )
		DelObj(mo1)
		ks_ActSetMode( mo )
		AdjustFaceDir( mo, doo, 0 )				
		sleep(25)
		PlayMotion( mo, ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )--�n�Y
		Say( mo, "[SC_423456_20]" )--�ڥ��Ӥ����ӧi�D�A��		
		sleep(25)
		PlayMotion( doo, ruFUSION_ACTORSTATE_EMOTE_STRETCH )
		Say( doo, "[SC_423456_21]" )--��......�ݬݧa�I�ڸ�A�̤S����
		sleep(25)
		CallPlot( OwnerID(), "ks_QuestEnd", QuestID, FinishFlagID, CheckBuffID, CheckRange, DoScript )
		break
	end
end

function Lua_423456_break()
	local mo1 = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116102, 50, 0 )
	local mo2 = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116103, 50, 0 )
	local gill = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116101, 50, 0 )
	local lobo = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116100, 50, 0 )
	local doo = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116020, 50, 0 )
		
	if mo1 ~= nil then delobj(mo1) end
	if mo2 ~= nil then delobj(mo2) end
	if gill ~= nil then delobj(gill) end
	if lobo ~= nil then delobj(lobo) end
	if doo ~= nil then delobj(doo) end
	ks_resetObj( OwnerID(), nil )
end
