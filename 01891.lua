
function Lua_423206_get()
	local T_ID = TargetID()--猧瑿玭
	local O_ID = OwnerID() --產	
	
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
	local T_ID = TargetID() --集风
	local O_ID = OwnerID() --產	
	if CheckAcceptQuest( O_ID, 423207 ) == true and ReadRoleValue( T_ID, EM_RoleValue_Register1 ) > 0 then
		SetSpeakDetail( O_ID, "[SC_422693_7]" ) --叫祔单и
	elseif CheckAcceptQuest( O_ID, 423207 ) == true then
		SetSpeakDetail( O_ID, "[SC_422161_22]" ) --非称盾
		AddSpeakOption( O_ID, T_ID, "[SC_111796_0]", "Lua_423207_1",0) --и非称
	else
		LoadQuestOption( O_ID )
	end
end

function Lua_423207_1()
	local T_ID = TargetID() --集风
	local O_ID = OwnerID() --產
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
		SetModeEx( gill , EM_SetModeType_HideName , true )	-- 嘿
		Show( gill, 0)
		SetDefIdleMotion( gill, ruFUSION_MIME_IDLE_DEAD )
		AdjustFaceDir( mo, gill, 0 ) --ヘ夹
		Sleep(25)		
		local lobo = Lua_423207_obj( 115868, x3, y3+80, z3 )
		Hide(lobo)
		SetModeEx( lobo , EM_SetModeType_Gravity , false )
		Show(lobo, 0 )
		AdjustFaceDir( lobo, gill, 0 ) --ヘ夹
		SetDefIdleMotion( lobo, ruFUSION_MIME_RUN_FORWARD )
		AddBuff( lobo, 506984, 10, -1 )	
		MoveDirect( lobo, x2-15 , y2 , a*(x2-15)+b )
		sleep(15)
		Say( mo, "[SC_423207_1]" ) --Τつ......		
		sleep(30)
		PlayMotion( lobo, ruFUSION_ACTORSTATE_CROUCH_END )
		sleep(10)
		CancelBuff( lobo, 506984 )
		PlayMotion( lobo, ruFUSION_ACTORSTATE_CROUCH_BEGIN )		
		Say( lobo, "[SC_423207_2]") --﹏﹏﹏﹏眶眶﹏﹏						
		ks_MoveToFlag( mo, FlagGroup, 0, 0 )
		Sleep(20)
		delObj(gill)
		SetDefIdleMotion( lobo, ruFUSION_MIME_IDLE_STAND )	 --ミ
		PlayMotion( lobo, ruFUSION_ACTORSTATE_NORMAL )		
		Say( mo, "[SC_423207_3]") --﹏﹏⊿ㄆê琌璶琵ㄓほ禜		
		AdjustFaceDir( lobo, mo, 0 ) --ヘ夹
		sleep(20)
		Say( lobo, "[SC_423207_4]") --腇ии癚菇		
		Hide(mo)
		SetModeEx( mo, EM_SetModeType_Gravity, false )
		Show(mo, 0)
		SetDefIdleMotion( lobo, ruFUSION_MIME_JUMP_LOOP )			
		sleep(15)
		MoveDirect( lobo, x2-25, y2+25, a*(x2-25)+b ) --骋玨锣ō瞒		
		sleep(10)
		SetDefIdleMotion( mo, ruFUSION_MIME_JUMP_LOOP )		
		CastSpell( mo, lobo, 495116 ) --集风ю阑		
		sleep(10)		
		SetPos( mo, x2-30, y2+25, a*(x2-30)+b ,0 )
		Say( lobo, "[SC_423207_0]") -- !!
		AdjustFaceDir( mo, lobo, 0 ) --ヘ夹
		sleep(10)
		CastSpell( mo, lobo, 495778 ) --集风侥網吊		
		sleep(10)
		Hide(lobo)
		SetModeEx( lobo, EM_SetModeType_Mark , false )
		SetModeEx( lobo, EM_SetModeType_ShowRoleHead , false )
		SetModeEx( lobo, EM_SetModeType_HideName , false )
		Show(lobo,0)
		PlayMotion( lobo, ruFUSION_ACTORSTATE_DEAD ) --骋玨
		sleep(3)
		SetPos( mo, x2-15, y2+15, a*(x2-15)+b, 0 )
		delObj( lobo )-- 骋玨ア
		sleep(2)		
		SetPos( mo, x2, y2, z2, 0 )
		SetDefIdleMotion( mo, ruFUSION_MIME_IDLE_STAND )	 --ミ
		AdjustFaceDir( mo, TargetID(), 0 ) --ヘ夹
		sleep(5)		
		Say( mo, "[SC_423207_5]") --и┬т酵酵
		sleep(25)
		CallPlot( OwnerID(), "ks_QuestEnd", QuestID, FinishFlagID, CheckBuffID, CheckRange, DoScript )
		break
	end
end

function Lua_423207_obj( ObjID, x, y, z )
	local obj = CreateObj( ObjID, x, y, z, 0 , 1 ) --骋玨		
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
	local T_ID = TargetID() --集风
	local O_ID = OwnerID() --產
	AdjustFaceDir( T_ID, O_ID, 0 )
	
	if CheckAcceptQuest( O_ID, 423208 ) == true and ReadRoleValue( T_ID, EM_RoleValue_Register1 ) > 0 then
		SetSpeakDetail( O_ID, "[SC_422693_7]" ) --叫祔单и
	elseif CheckAcceptQuest( O_ID, 423208 ) == true and ReadRoleValue( T_ID, EM_RoleValue_Register1 ) == 0 then
		SetSpeakDetail( O_ID, "[SC_422161_22]" ) --非称盾
		AddSpeakOption( O_ID, T_ID, "[SC_111796_0]", "Lua_423208_1",0) --и非称
	else
		LoadQuestOption( O_ID )
	end
end

function Lua_423208_1()
	local T_ID = TargetID() --集风
	local O_ID = OwnerID() --產
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
	AdjustFaceDir( lobo, mo, 0 ) --ヘ夹
	AdjustFaceDir( mo, lobo, 0 ) --ヘ夹
	ks_ActSetMode( door )
	sleep(3)		
	Lua_423208_setPos( x1, y1, z1 )	
	
	sleep(5)
	CallPlot( c1, "ks_QuestCheck", QuestID, FinishFlagID, CheckBuffID, CheckRange+100, DoScript )
	sleep(10)
	Say( lobo, "[SC_423208_1]" ) --糑琌街и盾
	sleep(25)
	PlayMotion( lobo, ruFUSION_ACTORSTATE_EMOTE_SPEAK )	--弧杠笆
	Say( mo, "[SC_423208_2]" ) --讽礛⊿ㄆ	
	local x,y,z,dir=GetLoc(FlagGroup, 7);
	sleep(5+Move(mo,x,y,z));
	AdjustFaceDir( mo, lobo, 0 ) --ヘ夹
	sleep(10)		
	PlayMotion( mo,ruFUSION_ACTORSTATE_CRAFTING_BEGIN )
	sleep(15)
	PlayMotion( mo,ruFUSION_ACTORSTATE_CRAFTING_END )
	sleep(10)
	BeginPlot( door, "LuaS_DW_Activating", 0 )--秨
	sleep(10)
	local x,y,z,dir=GetLoc(FlagGroup, 6);
	sleep(Move(lobo,x,y,z));--ǐ
	sleep(20)
	AdjustFaceDir( mo, lobo, 0 ) --ヘ夹
	if TargetID() ~= nil then
		AdjustFaceDir( lobo, TargetID(), 0 ) --ヘ夹
		PlayMotion( lobo, ruFUSION_ACTORSTATE_EMOTE_POINT )	--弧杠笆
	else
		AdjustFaceDir( lobo, mo, 0 ) --ヘ夹
		PlayMotion( lobo, ruFUSION_ACTORSTATE_EMOTE_SPEAK )	--弧杠笆		
	end		
	Say( lobo, "[SC_423208_3]" ) --и筁ê㎝胊琌癬		
	sleep(30)
	if TargetID() ~= nil then
		AdjustFaceDir( mo, TargetID(), 0 ) --ヘ夹
		PlayMotion( mo, ruFUSION_ACTORSTATE_EMOTE_POINT )	
	else
		AdjustFaceDir( mo, lobo, 0 ) --ヘ夹
		PlayMotion( mo, ruFUSION_ACTORSTATE_EMOTE_SPEAK )	--弧杠笆			
	end		
	Say( mo, "[SC_423208_4]" ) --琌р闽癬ㄓ
	sleep(30)
	AdjustFaceDir( lobo, mo, 0 ) --ヘ夹
	PlayMotion( lobo, ruFUSION_ACTORSTATE_EMOTE_SPEAK )	--弧杠笆
	Say( lobo, "[SC_423208_5]" ) --......и⊿Ω琌......		
	sleep(30)
	AdjustFaceDir( mo, lobo, 0 ) --ヘ夹
	PlayMotion( mo, ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )	--弧杠笆
	Say( mo, "[SC_423208_6]" ) --胊Ω稱р闽癬ㄓ
	sleep(30)
	PlayMotion( lobo, ruFUSION_ACTORSTATE_EMOTE_SPEAK )	--弧杠笆
	Say( lobo, "[SC_423208_7]" ) --......胊Ω琌...琌......
	sleep(10)
	CastSpell( mo, mo, 494222 ) ----皗	
	sleep(10)
	local mo1 =  LuaFunc_CreateObjByObj( 116110, mo )
	ks_ActSetMode( mo1 )
	DelObj(mo)
	sleep(5)
	AdjustFaceDir( mo1, lobo, 0 ) --ヘ夹
	PlayMotion( mo1, ruFUSION_ACTORSTATE_EMOTE_SALUTE )	--弧杠笆
	Say( mo1, "[SC_423208_8]" ) --иぃ琌璶р闽癬ㄓ~琌稱蛤弧弧杠τ
	sleep(25)
	AdjustFaceDir( lobo, mo1, 0 ) --ヘ夹
	Say( lobo, "[SC_423208_9]" ) --......Τ﹏﹏ê贺媚		
	sleep(30)
	PlayMotion( mo1, ruFUSION_ACTORSTATE_EMOTE_LAUGH )	--弧杠笆
	Say( mo1, "[SC_423208_10]" ) --ぃ琌翅и琌ぱネ碞跑てи琌[115876]ぐ或
	sleep(30)
	PlayMotion( lobo, ruFUSION_ACTORSTATE_EMOTE_SPEAK )	--弧杠笆
	Say( lobo, "[SC_423208_11]" ) --и[115891][116094]			
	sleep(30)
	PlayMotion( mo1, ruFUSION_ACTORSTATE_EMOTE_SPEAK )	--弧杠笆
	Say( mo1, "[SC_423208_12]" ) --蛤癬ê碞琌﹏﹏盾
	sleep(30)
	PlayMotion( lobo, ruFUSION_ACTORSTATE_EMOTE_SALUTE )	--弧杠笆
	Say( lobo, "[SC_423208_13]" )--垛[115892]琌и﹏﹏		
	sleep(15)
	local gill = Lua_423208_obj( 115888, FlagGroup, 10 )
	AddToPartition(gill,ReadRoleValue(OwnerID(),EM_RoleValue_RoomID));
	CallPlot( c1, "Lua_423208_msg", QuestID, CheckBuffID )
	MoveToFlagEnabled(gill,false);
	AdjustFaceDir( lobo, gill, 0 ) --ヘ夹
	x,y,z,dir=GetLoc(FlagGroup,9);
	sleep(Move(gill,x,y,z));--簿笆
	AdjustFaceDir( mo1, gill, 0 ) --ヘ夹
	sleep(5)
	Say( lobo, "[SC_423208_15]" ) --﹏﹏硂柑硂柑		
	sleep(20)
	Yell( gill, "[SC_423208_16]",1) --筁ㄓие翴瞒秨硂柑
	WriteRoleValue( lobo, EM_RoleValue_IsWalk, 0 )
	AddBuff( lobo, 506984, 2, -1 )
	AddBuff( gill, 506984, 1, -1 )
	sleep(10)
	AdjustFaceDir( lobo, mo1, 0 ) --ヘ夹
	Say( lobo, "[SC_423208_17]" ) --[115887]~
	AdjustFaceDir( mo1, lobo, 0 ) --ヘ夹
	SetModeEx( lobo , EM_SetModeType_Gravity , false )
	SetDefIdleMotion( lobo, ruFUSION_MIME_RUN_FORWARD )
	x,y,z,dir=GetLoc(FlagGroup,10)
	sleep(Move(gill,x,y,z));--瞒秨
	AdjustFaceDir( lobo, gill, 0 ) --ヘ夹
	x,y,z,dir=GetLoc(FlagGroup, 9);
	sleep(Move(lobo,x,y,z));--瞒秨
	AdjustFaceDir( mo1, lobo, 0 ) --ヘ夹
	sleep(5)			
	DelObj(gill)
	x,y,z,dir=GetLoc(FlagGroup,10);
	sleep(Move(lobo,x,y,z));--瞒秨
	debugmsg( 0,0, "end" )
	CallPlot( c1, "ks_QuestEnd", QuestID, FinishFlagID, CheckBuffID, CheckRange+100, DoScript )
	SetPos(OwnerID(),1729,420,28372,48);
	SetModeEx(OwnerID(),EM_SetModeType_Move,false);
end

function Lua_423208_msg( QuestID, CheckBuffID )
	local player = {}
	local playerCount = 0
	local Color = "0xffffff00"	-- 眏癟独︹
	player = SearchRangePlayer ( OwnerID(), 100 ) 
	local Message = "[SC_423208_14]" --[115891][115891]
	
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
			AddBuff( player[i], 506098, 0, -1 )--礶堵
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