
function Lua_423206_get()
	local T_ID = TargetID()--�i�C�n
	local O_ID = OwnerID() --���a	
	
	if CountBodyItem( O_ID, 207712 ) < 10 then
		GiveBodyItem( O_ID, 207712, 1 )
		if CountBodyItem( O_ID, 207712 ) == 10 then
			SetFlag( O_ID, 544326, 1 )
		end
	end
	return 1
end

--========================================================================================--

function Lua_423207_say()
	local T_ID = TargetID() --����J
	local O_ID = OwnerID() --���a	
	if CheckAcceptQuest( O_ID, 423207 ) == true and ReadRoleValue( T_ID, EM_RoleValue_Register1 ) > 0 then
		SetSpeakDetail( O_ID, "[SC_422693_7]" ) --�еy���ڤ@�U�C
	elseif CheckAcceptQuest( O_ID, 423207 ) == true then
		SetSpeakDetail( O_ID, "[SC_422161_22]" ) --�A�ǳƦn�F�ܡH
		AddSpeakOption( O_ID, T_ID, "[SC_111796_0]", "Lua_423207_1",0) --�ڷǳƦn�F�C
	else
		LoadQuestOption( O_ID )
	end
end

function Lua_423207_1()
	local T_ID = TargetID() --����J
	local O_ID = OwnerID() --���a
	CloseSpeak( OwnerID() )
	
	WriteRoleValue( T_ID, EM_RoleValue_Register1, 1 )
	BeginPlot( T_ID, "Lua_423207_2", 0 )
end

function Lua_423207_2()
	while true do	
		local O_ID = OwnerID()	
		local QuestID = 423207
		local FinishFlagID = 544284
		local CheckBuffID = 507178
		local CheckRange = 50
		local DoScript = "Lua_423207_break"		
		local FlagGroup = 780595		
		CallPlot( OwnerID(), "ks_QuestAddBuff", QuestID, FinishFlagID, CheckBuffID, CheckRange, DoScript )
		
		local x2 = GetMoveFlagValue( FlagGroup, 1 , EM_RoleValue_X )
		local y2 = GetMoveFlagValue( FlagGroup, 1 , EM_RoleValue_Y )	
		local z2 = GetMoveFlagValue( FlagGroup, 1 , EM_RoleValue_Z )
		local x3 = GetMoveFlagValue( FlagGroup, 2 , EM_RoleValue_X )
		local y3 = GetMoveFlagValue( FlagGroup, 2 , EM_RoleValue_Y )	
		local z3 = GetMoveFlagValue( FlagGroup, 2 , EM_RoleValue_Z )
		local a = ( z3-z2) / (x3-x2)
		local b = z2 - a*x2 
		local mo = LuaFunc_CreateObjByObj( 115887, OwnerID() )
		ks_ActSetMode( mo )
		local gill = Lua_423207_obj( 115888, x2, y2, z2 )
		Hide( gill)
		SetModeEx( gill , EM_SetModeType_HideName , true )	-- �W��
		Show( gill, 0)
		SetDefIdleMotion( gill, ruFUSION_MIME_IDLE_DEAD )
		AdjustFaceDir( mo, gill, 0 ) --���V�ؼ�
		Sleep(25)		
		local lobo = Lua_423207_obj( 115868, x3, y3+80, z3 )
		Hide(lobo)
		SetModeEx( lobo , EM_SetModeType_Gravity , false )
		Show(lobo, 0 )
		AdjustFaceDir( lobo, gill, 0 ) --���V�ؼ�
		SetDefIdleMotion( lobo, ruFUSION_MIME_RUN_FORWARD )
		AddBuff( lobo, 506984, 10, -1 )	
		MoveDirect( lobo, x2-15 , y2 , a*(x2-15)+b )
		sleep(15)
		Say( mo, "[SC_423207_1]" ) --���H�W�ĤF......		
		sleep(30)
		PlayMotion( lobo, ruFUSION_ACTORSTATE_CROUCH_END )
		sleep(10)
		CancelBuff( lobo, 506984 )
		PlayMotion( lobo, ruFUSION_ACTORSTATE_CROUCH_BEGIN )		
		Say( lobo, "[SC_423207_2]") --�n�n�I�n�n�I�����r�n�n�I						
		ks_MoveToFlag( mo, FlagGroup, 0, 0 )
		Sleep(20)
		delObj(gill)
		SetDefIdleMotion( lobo, ruFUSION_MIME_IDLE_STAND )	 --����
		PlayMotion( lobo, ruFUSION_ACTORSTATE_NORMAL )		
		Say( mo, "[SC_423207_3]") --�A���n�n�S�ơI���ӥu�O�n���A���U�Ӫ��۶H�C		
		AdjustFaceDir( lobo, mo, 0 ) --���V�ؼ�
		sleep(20)
		Say( lobo, "[SC_423207_4]") --�A�F�ڡA�ڰQ���A�C		
		Hide(mo)
		SetModeEx( mo, EM_SetModeType_Gravity, false )
		Show(mo, 0)
		SetDefIdleMotion( lobo, ruFUSION_MIME_JUMP_LOOP )			
		sleep(15)
		MoveDirect( lobo, x2-25, y2+25, a*(x2-25)+b ) --�ҫk�ਭ���h		
		sleep(10)
		SetDefIdleMotion( mo, ruFUSION_MIME_JUMP_LOOP )		
		CastSpell( mo, lobo, 495116 ) --����J����		
		sleep(10)		
		SetPos( mo, x2-30, y2+25, a*(x2-30)+b ,0 )
		Say( lobo, "[SC_423207_0]") -- !!
		AdjustFaceDir( mo, lobo, 0 ) --���V�ؼ�
		sleep(10)
		CastSpell( mo, lobo, 495778 ) --����J�ľW���a		
		sleep(10)
		Hide(lobo)
		SetModeEx( lobo, EM_SetModeType_Mark , false )
		SetModeEx( lobo, EM_SetModeType_ShowRoleHead , false )
		SetModeEx( lobo, EM_SetModeType_HideName , false )
		Show(lobo,0)
		PlayMotion( lobo, ruFUSION_ACTORSTATE_DEAD ) --�ҫk�ˤU
		sleep(3)
		SetPos( mo, x2-15, y2+15, a*(x2-15)+b, 0 )
		delObj( lobo )-- �ҫk����
		sleep(2)		
		SetPos( mo, x2, y2, z2, 0 )
		SetDefIdleMotion( mo, ruFUSION_MIME_IDLE_STAND )	 --����
		AdjustFaceDir( mo, TargetID(), 0 ) --���V�ؼ�
		sleep(5)		
		Say( mo, "[SC_423207_5]") --�n�F�A�ڭ̥h�a�U���}�Ч�L�ͽͧa�I
		sleep(25)
		CallPlot( OwnerID(), "ks_QuestEnd", QuestID, FinishFlagID, CheckBuffID, CheckRange, DoScript )
		break
	end
end

function Lua_423207_obj( ObjID, x, y, z )
	local obj = CreateObj( ObjID, x, y, z, 0 , 1 ) --�ҫk		
	AddToPartition( obj, 0 )
	ks_ActSetMode( obj )	
	return obj
end

function Lua_423207_break()
	local gill = LuaFunc_SearchNPCbyOrgID( OwnerID(), 115888, 150, 0 )
	local lobo = LuaFunc_SearchNPCbyOrgID( OwnerID(), 115868, 400, 0 )
	local mo = LuaFunc_SearchNPCbyOrgID( OwnerID(), 115887, 150, 0 )
	
	if gill ~= nil then delobj(gill) end
	if lobo ~= nil then delobj(lobo) end
	if mo ~= nil then delobj(mo) end
	ks_resetObj( OwnerID(), nil )
end

--========================================================================================--

function Lua_423208_say()
	local T_ID = TargetID() --����J
	local O_ID = OwnerID() --���a
	AdjustFaceDir( T_ID, O_ID, 0 )
	
	if CheckAcceptQuest( O_ID, 423208 ) == true and ReadRoleValue( T_ID, EM_RoleValue_Register1 ) > 0 then
		SetSpeakDetail( O_ID, "[SC_422693_7]" ) --�еy���ڤ@�U�C
	elseif CheckAcceptQuest( O_ID, 423208 ) == true and ReadRoleValue( T_ID, EM_RoleValue_Register1 ) == 0 then
		SetSpeakDetail( O_ID, "[SC_422161_22]" ) --�A�ǳƦn�F�ܡH
		AddSpeakOption( O_ID, T_ID, "[SC_111796_0]", "Lua_423208_1",0) --�ڷǳƦn�F�C
	else
		LoadQuestOption( O_ID )
	end
end

function Lua_423208_1()
	local T_ID = TargetID() --����J
	local O_ID = OwnerID() --���a
	CloseSpeak( OwnerID() )

	WriteRoleValue( O_ID, EM_RoleValue_Register1, 1 )
	BeginPlot( T_ID, "Lua_423208_2", 0 )
end

function Lua_423208_2()
	local GetLoc=function(GUID_or_FlagID,FlagNum)
		local x,y,z,dir
		if	FlagNum==nil	then
			--Obj
			local Obj = GUID_or_FlagID;
			x=ReadRoleValueFloat(Obj,EM_RoleValue_X);
			y=ReadRoleValueFloat(Obj,EM_RoleValue_Y);
			z=ReadRoleValueFloat(Obj,EM_RoleValue_Z);
			dir=ReadRoleValueFloat(Obj,EM_RoleValue_Dir);
		else
			--Flag
			local FlagID = GUID_or_FlagID
			x=GetMoveFlagValue(FlagID,FlagNum,EM_RoleValue_X);
			y=GetMoveFlagValue(FlagID,FlagNum,EM_RoleValue_Y);
			z=GetMoveFlagValue(FlagID,FlagNum,EM_RoleValue_Z);
			dir=GetMoveFlagValue(FlagID,FlagNum,EM_RoleValue_Dir);
		end
		return x,y,z,dir;
	end
	SetPos(OwnerID(),1729,420,28372,48);
	SetModeEx(OwnerID(),EM_SetModeType_Move,false);			
	local QuestID = 423208
	local FinishFlagID = 544288
	local CheckBuffID = 507178--503977
	local CheckRange = 65
	local DoScript = "Lua_423208_break"
	local FlagGroup = 780595

	local x1 = GetMoveFlagValue( FlagGroup, 5 , EM_RoleValue_X )
	local y1 = GetMoveFlagValue( FlagGroup, 5 , EM_RoleValue_Y )	
	local z1 = GetMoveFlagValue( FlagGroup, 5 , EM_RoleValue_Z )
	local x2 = GetMoveFlagValue( FlagGroup, 6 , EM_RoleValue_X )
	local y2 = GetMoveFlagValue( FlagGroup, 6 , EM_RoleValue_Y )	
	local z2 = GetMoveFlagValue( FlagGroup, 6 , EM_RoleValue_Z )		
	local a = ( z2-z1) / (x2-x1)
	local b = z1 - a*x1 
	
	ks_AddBuff( QuestID, FinishFlagID, CheckBuffID, CheckRange )			
	
	local c1 = Lua_423208_obj( 115506, FlagGroup, 5 )
	local door = LuaFunc_SearchNPCbyOrgID( c1, 115737, 100, 0 )
	door = LuaFunc_CreateObjByObj( 115736, door )		
	SetModeEx( door, EM_SetModeType_Obstruct , true )
	Hide(c1)
	SetModeEx( c1, EM_SetModeType_Mark , false )
	SetModeEx( c1, EM_SetModeType_Show, false )		
	Show(c1,0)
			
	local mo = Lua_423208_obj( 115735, FlagGroup, 5 )
	local lobo = LuaFunc_SearchNPCbyOrgID( c1, 115738, 100, 0 )
	lobo = LuaFunc_CreateObjByObj( 116094, lobo )
	ks_ActSetMode( lobo )
	MoveToFlagEnabled(lobo,false);
	MoveToFlagEnabled(mo,false);
	AdjustFaceDir( lobo, mo, 0 ) --���V�ؼ�
	AdjustFaceDir( mo, lobo, 0 ) --���V�ؼ�
	ks_ActSetMode( door )
	sleep(3)		
	Lua_423208_setPos( x1, y1, z1 )	
	
	sleep(5)
	CallPlot( c1, "ks_QuestCheck", QuestID, FinishFlagID, CheckBuffID, CheckRange+100, DoScript )
	sleep(10)
	Say( lobo, "[SC_423208_1]" ) --�K�I�A�̬O�֡H�i�H��ڥX�h�ܡH
	sleep(25)
	PlayMotion( lobo, ruFUSION_ACTORSTATE_EMOTE_SPEAK )	--���ܰʧ@
	Say( mo, "[SC_423208_2]" ) --��M�I�A�S�Ƨa�H	
	local x,y,z,dir=GetLoc(FlagGroup, 7);
	sleep(5+Move(mo,x,y,z));
	AdjustFaceDir( mo, lobo, 0 ) --���V�ؼ�
	sleep(10)		
	PlayMotion( mo,ruFUSION_ACTORSTATE_CRAFTING_BEGIN )
	sleep(15)
	PlayMotion( mo,ruFUSION_ACTORSTATE_CRAFTING_END )
	sleep(10)
	BeginPlot( door, "LuaS_DW_Activating", 0 )--�}��
	sleep(10)
	local x,y,z,dir=GetLoc(FlagGroup, 6);
	sleep(Move(lobo,x,y,z));--���X
	sleep(20)
	AdjustFaceDir( mo, lobo, 0 ) --���V�ؼ�
	if TargetID() ~= nil then
		AdjustFaceDir( lobo, TargetID(), 0 ) --���V�ؼ�
		PlayMotion( lobo, ruFUSION_ACTORSTATE_EMOTE_POINT )	--���ܰʧ@
	else
		AdjustFaceDir( lobo, mo, 0 ) --���V�ؼ�
		PlayMotion( lobo, ruFUSION_ACTORSTATE_EMOTE_SPEAK )	--���ܰʧ@		
	end		
	Say( lobo, "[SC_423208_3]" ) --�ڬݹL���ӤH�A�L�M�a�H�O�@�_���I		
	sleep(30)
	if TargetID() ~= nil then
		AdjustFaceDir( mo, TargetID(), 0 ) --���V�ؼ�
		PlayMotion( mo, ruFUSION_ACTORSTATE_EMOTE_POINT )	
	else
		AdjustFaceDir( mo, lobo, 0 ) --���V�ؼ�
		PlayMotion( mo, ruFUSION_ACTORSTATE_EMOTE_SPEAK )	--���ܰʧ@			
	end		
	Say( mo, "[SC_423208_4]" ) --�O�L��A���_�Ӫ��H
	sleep(30)
	AdjustFaceDir( lobo, mo, 0 ) --���V�ؼ�
	PlayMotion( lobo, ruFUSION_ACTORSTATE_EMOTE_SPEAK )	--���ܰʧ@
	Say( lobo, "[SC_423208_5]" ) --�c......�ڭ�~�S�ݨ�L�C�L�W���O�n�H......		
	sleep(30)
	AdjustFaceDir( mo, lobo, 0 ) --���V�ؼ�
	PlayMotion( mo, ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )	--���ܰʧ@
	Say( mo, "[SC_423208_6]" ) --�a�H�W���]�Q��A���_�ӡH
	sleep(30)
	PlayMotion( lobo, ruFUSION_ACTORSTATE_EMOTE_SPEAK )	--���ܰʧ@
	Say( lobo, "[SC_423208_7]" ) --�c......�a�H�W���]�O�n�H...�i�O......
	sleep(10)
	CastSpell( mo, mo, 494222 ) ----�{��	
	sleep(10)
	local mo1 =  LuaFunc_CreateObjByObj( 116110, mo )
	ks_ActSetMode( mo1 )
	DelObj(mo)
	sleep(5)
	AdjustFaceDir( mo1, lobo, 0 ) --���V�ؼ�
	PlayMotion( mo1, ruFUSION_ACTORSTATE_EMOTE_SALUTE )	--���ܰʧ@
	Say( mo1, "[SC_423208_8]" ) --�ڤ��O�n��A���_��~�u�O�Q��A�����ܦӤw
	sleep(25)
	AdjustFaceDir( lobo, mo1, 0 ) --���V�ؼ�
	Say( lobo, "[SC_423208_9]" ) --�A...�A...�A�]���n�n�������ġH		
	sleep(30)
	PlayMotion( mo1, ruFUSION_ACTORSTATE_EMOTE_LAUGH )	--���ܰʧ@
	Say( mo1, "[SC_423208_10]" ) --���O��I�ڬO�ѥʹN���ܤơC�ڬO[115876]�A�A�s����W�r�H
	sleep(30)
	PlayMotion( lobo, ruFUSION_ACTORSTATE_EMOTE_SPEAK )	--���ܰʧ@
	Say( lobo, "[SC_423208_11]" ) --�ڥs[115891]�C[116094]�C			
	sleep(30)
	PlayMotion( mo1, ruFUSION_ACTORSTATE_EMOTE_SPEAK )	--���ܰʧ@
	Say( mo1, "[SC_423208_12]" ) --��A�@�_�����ӴN�O�A�n�n�ܡH
	sleep(30)
	PlayMotion( lobo, ruFUSION_ACTORSTATE_EMOTE_SALUTE )	--���ܰʧ@
	Say( lobo, "[SC_423208_13]" )--��I[115892]�O�کn�n�I		
	sleep(15)
	local gill = Lua_423208_obj( 115888, FlagGroup, 10 )
	AddToPartition(gill,ReadRoleValue(OwnerID(),EM_RoleValue_RoomID));
	CallPlot( c1, "Lua_423208_msg", QuestID, CheckBuffID )
	MoveToFlagEnabled(gill,false);
	AdjustFaceDir( lobo, gill, 0 ) --���V�ؼ�
	x,y,z,dir=GetLoc(FlagGroup,9);
	sleep(Move(gill,x,y,z));--����
	AdjustFaceDir( mo1, gill, 0 ) --���V�ؼ�
	sleep(5)
	Say( lobo, "[SC_423208_15]" ) --�n�n�I�o�̳o�̡I		
	sleep(20)
	Yell( gill, "[SC_423208_16]",1) --�L�ӡI�ڭ̧��I���}�o�̡I
	WriteRoleValue( lobo, EM_RoleValue_IsWalk, 0 )
	AddBuff( lobo, 506984, 2, -1 )
	AddBuff( gill, 506984, 1, -1 )
	sleep(10)
	AdjustFaceDir( lobo, mo1, 0 ) --���V�ؼ�
	Say( lobo, "[SC_423208_17]" ) --[115887]����~
	AdjustFaceDir( mo1, lobo, 0 ) --���V�ؼ�
	SetModeEx( lobo , EM_SetModeType_Gravity , false )
	SetDefIdleMotion( lobo, ruFUSION_MIME_RUN_FORWARD )
	x,y,z,dir=GetLoc(FlagGroup,10)
	sleep(Move(gill,x,y,z));--���}
	AdjustFaceDir( lobo, gill, 0 ) --���V�ؼ�
	x,y,z,dir=GetLoc(FlagGroup, 9);
	sleep(Move(lobo,x,y,z));--���}
	AdjustFaceDir( mo1, lobo, 0 ) --���V�ؼ�
	sleep(5)			
	DelObj(gill)
	x,y,z,dir=GetLoc(FlagGroup,10);
	sleep(Move(lobo,x,y,z));--���}
	debugmsg( 0,0, "end" )
	CallPlot( c1, "ks_QuestEnd", QuestID, FinishFlagID, CheckBuffID, CheckRange+100, DoScript )
	SetPos(OwnerID(),1729,420,28372,48);
	SetModeEx(OwnerID(),EM_SetModeType_Move,false);
end

function Lua_423208_msg( QuestID, CheckBuffID )
	local player = {}
	local playerCount = 0
	local Color = "0xffffff00"	-- �j��T��������
	player = SearchRangePlayer ( OwnerID(), 100 ) 
	local Message = "[SC_423208_14]" --[115891]�I[115891]�I
	
	for pry , obj in pairs( player ) do
		playerCount = playerCount + 1
	end
	for i= 0, playerCount-1 do
		if CheckAcceptQuest( player[i], QuestID ) == true and CheckBuff( player[i] , CheckBuffID ) == true then
			ScriptMessage( player[i], player[i], 1 , Message, Color )
			ScriptMessage( player[i], player[i], 0 , Message, Color )		
		end
	end		
end

function Lua_423208_obj( ObjID, FlagGroup, FlagID )
	local obj = CreateObjByFlag( ObjID, FlagGroup, FlagID, 1 ) 
	AddToPartition( obj, 0 )
	ks_ActSetMode( obj )	
	return obj
end

function Lua_423208_setPos( x, y, z )
	local player = {}
	local playerCount = 0
	local count = 0	
	player = SearchRangePlayer ( OwnerID(), 100 ) 
	
	for pry , obj in pairs( player ) do
		playerCount = playerCount + 1
	end
	for i= 0, playerCount-1 do
		if CheckAcceptQuest( player[i], 423208 ) == true and CheckBuff( player[i], 507178 ) == true then 
			AddBuff( player[i], 506098, 0, -1 )--�e���@��
			sleep(3)
			x = x + rand(15) - rand(15)
			z = z + rand(15) - rand(15)
			SetPos( player[i], x, y, z, 0 )
			CancelBuff( player[i], 506098 )
		end
	end
end

function Lua_423208_break()
	local gill = LuaFunc_SearchNPCbyOrgID( OwnerID(), 115888, 150, 0 )
	local lobo = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116094, 150, 0 )
	local mo = LuaFunc_SearchNPCbyOrgID( OwnerID(), 115735, 100, 0 )
	local mo1 = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116110, 100, 0 )
	local door = LuaFunc_SearchNPCbyOrgID( OwnerID(), 115736, 100, 0 )
	local Obj = LuaFunc_SearchNPCbyOrgID( OwnerID(), 115878, 260, 0 )
	
	if gill ~= nil then delobj(gill) end
	if lobo ~= nil then delobj(lobo) end
	if mo1 ~= nil then delobj(mo1) end
	if mo ~= nil then delobj(mo) end
	if door ~= nil then delobj(door) end
	ks_resetObj( Obj, nil )
	delobj(OwnerID())
end

--========================================================================================--