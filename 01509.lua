function LuaS_422633()  --
	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),422633)== true )and( CheckCompleteQuest( OwnerID() , 422633) == false)then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422633_1]","LuaS_422633_0",0) --請告訴我吧！
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422578_2]","LuaS_422633_1",0) --不
end
end

function LuaS_422633_0()
                SetSpeakDetail(OwnerID(),"[SC_422633_2]") ---讓我來告訴你
                SetFlag(OwnerID() ,542998, 1 )
	AddSpeakOption(OwnerID(),TargetID(),"[SO_BACK]","LuaS_422633",0) 
end

function LuaS_422633_1()  
	SetSpeakDetail(OwnerID(),"[SC_422633_3]") --- 你......
               AddSpeakOption(OwnerID(),TargetID(),"[SO_BACK]","LuaS_422633",0) 
end


--===============================
function LuaQ_422637_Complete()
	DisableQuest( OwnerID() , true )
	local Dir = ReadRoleValue( OwnerID() , EM_RoleValue_Dir )
	MoveToFlagEnabled( OwnerID() , false )
	AdjustFaceDir( OwnerID(), TargetID(), 0 ) 
	Yell( OwnerID() , "[SC_422637_1]" , 3 ) --我記得父親曾經有給我看過有種神奇的小石子。
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep( 25 )
	Yell( OwnerID() , "[SC_422637_2]" , 3 ) --似乎叫做回音石，通常是用來緊急紀錄的東西......
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep( 25 )
	Yell( OwnerID() , "[SC_422637_3]" , 3 ) --也許父親......他有話想告訴我......
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep( 25 )
	Yell( OwnerID() , "[SC_422637_4]" , 3 ) --我必須聆聽，他所想要告訴我的話。
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
	sleep( 15 )
	SetDir( OwnerID(), Dir )
	sleep( 5 )
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_THROW )
	sleep( 10 )
	local Ball = Lua_CreateObjByDir( OwnerID() , 113372 , 10 , 0) 
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	Lua_ObjDontTouch( Ball ) 
	AddToPartition( Ball , RoomID )
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_CROUCH_BEGIN,ruFUSION_ACTORSTATE_CROUCH_LOOP)
	CastSpell( Ball , Ball , 493776 )
	sleep( 20 )
	ScriptMessage( Ball , 0 , 1 , "[SC_422637_5]" , "0xffffc600" ) --這是被困在遺民殿堂的第三天。
	ScriptMessage( Ball , 0 , 0 , "[SC_422637_5]" , "0xffffc600" ) --這是被困在遺民殿堂的第三天。
	sleep( 20 )
	ScriptMessage( Ball , 0 , 1 , "[SC_422637_6]" , "0xffffc600" ) --我們由[102444]拆除了一些零件。
	ScriptMessage( Ball , 0 , 0 , "[SC_422637_6]" , "0xffffc600" ) --我們由[102444]拆除了一些零件。
	sleep( 20 )
	ScriptMessage( Ball , 0 , 1 , "[SC_422637_7]" , "0xffffc600" ) --在那之後他便一直呈現不動的......咦......
	ScriptMessage( Ball , 0 , 0 , "[SC_422637_7]" , "0xffffc600" ) --在那之後他便一直呈現不動的......咦......
	sleep( 20 )
	ScriptMessage( Ball , 0 , 1 , "[SC_422637_8]" , "0xffff8000"  ) --動了！他動了！
	ScriptMessage( Ball , 0 , 0 , "[SC_422637_8]" , "0xffff8000"  ) --動了！他動了！
	sleep( 20 )
	ScriptMessage( Ball , 0 , 1 , "[SC_422637_9]" , "0xffff8000"  ) --德克，離他遠一點，快！別在他面前發楞。
	ScriptMessage( Ball , 0 , 0 , "[SC_422637_9]" , "0xffff8000"  ) --德克，離他遠一點，快！別在他面前發楞。
	sleep( 20 )
	ScriptMessage( Ball , 0 , 1 , "[SC_422637_10]" , "0xffffc600" ) --啊......
	ScriptMessage( Ball , 0 , 0 , "[SC_422637_10]" , "0xffffc600" ) --啊......
	sleep( 20 )
	ScriptMessage( Ball , 0 , 1 , "[SC_422637_11]" , "0xffff8000"  ) --天啊～
	ScriptMessage( Ball , 0 , 0 , "[SC_422637_11]" , "0xffff8000"  ) --天啊～
	sleep( 20 )
	CastSpell( Ball , Ball , 493776 )
	sleep( 10)
	Delobj( Ball )
	MoveToFlagEnabled( OwnerID() , true )
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_CROUCH_END)
	DisableQuest( OwnerID() , false )
end