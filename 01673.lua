--Flag 780518 1~7 石窟一樓
--Flag 780518 8~12 石窟二樓
--Flag 780518 13~26 達馬蓋之石
function LuaI_114100_0()
	SetPlot( OwnerID() , "range" , "LuaI_114100_1" , 100 )
end

function LuaI_114100_1()
	if CheckAcceptQuest( OwnerID() , 422880 ) == true and CheckFlag( OwnerID() , 543511 ) == false and ReadRoleValue( TargetID() , EM_RoleValue_Register ) == 0 then
		WriteRoleValue( TargetID() , EM_RoleValue_Register , 777 )
		BeginPlot( TargetID() , "LuaI_114100_2" , 0 )
	end
end

function LuaI_114100_2()
	local Flag = 780518 
	local Me = Role:new( OwnerID() )
	local RuffleDick = CreateObj(114126 ,  Me:X() , Me:Y() , Me:Z() , Me:Dir() , 1  )
	local AntClown= CreateObjByFlag( 114127 , Flag , 1 , 0 )
	Lua_ObjDontTouch( RuffleDick ) 
	Lua_ObjDontTouch(  AntClown  ) 
	AddToPartition( RuffleDick , 0 )
	AddToPartition( AntClown , 0 )
	AdjustFaceDir( RuffleDick , AntClown , 0 ) 
	AdjustFaceDir(  AntClown , RuffleDick ,0 ) 
	MoveToflagEnabled( RuffleDick ,false )
	MoveToflagEnabled( AntClown ,false )
	sleep( 10 )
	PlayMotion( RuffleDick , ruFUSION_ACTORSTATE_EMOTE_POINT )
	Yell(  RuffleDick , "[SC_422880]" , 3 )
	sleep(30 )
	PlayMotion( AntClown  , ruFUSION_ACTORSTATE_EMOTE_IDLE2 )
	sleep( 20 )
	PlayMotion( AntClown  , ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell(  AntClown  , "[SC_422880_1]" , 3 )
	sleep( 30 )
	PlayMotion( RuffleDick  , ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell(  RuffleDick , "[SC_422880_2]" , 3 )
	sleep( 30 )
	Yell(  RuffleDick  , "[SC_422880_3]" , 3 )
	PlayMotion( RuffleDick , ruFUSION_ACTORSTATE_EMOTE_PROVOKE )
	sleep( 20 )
	PlayMotion(  AntClown   , ruFUSION_ACTORSTATE_EMOTE_IDLE0)
	sleep( 20 )
	Yell(  AntClown  , "[SC_422880_4]" , 3 )	
	LuaFunc_MoveToFlag( AntClown ,Flag,2,0)
	AdjustFaceDir(  AntClown , RuffleDick ,0 ) 
	sleep( 10)
	Yell(  AntClown  , "[SC_422880_5]" , 3 )
	PlayMotion( AntClown  , ruFUSION_ACTORSTATE_EMOTE_APPROVAL	)
	sleep( 30 )
	local  AntClown_Org = LuaFunc_SearchNPCbyOrgID( AntClown , 114101, 50 )
	local Dir = ReadRoleValue( AntClown_Org , EM_RoleValue_Dir )
--	SetPlot( AntClown , "range" , "LuaI_114100_3" , 200 )
	SetPlot( RuffleDick , "range" , "LuaI_114100_3" , 200 )
	SetDir( AntClown  , Dir )
	sleep( 10 )
	DelObj(AntClown )
	DelObj(RuffleDick )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
end

function LuaI_114100_3()
	if CheckAcceptQuest( OwnerID() , 422880 ) == true and CheckFlag( OwnerID() , 543511 ) == false then
		SetFlag( OwnerID() , 543511 , 1)
	end
end

function LuaQ_422881_OnClick()
	if CheckFlag( OwnerID() , 543512) == true then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422506_0]" , 0 )
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422506_0]" , 0 )
		return -1
	end
	return 1
end

function LuaQ_422881_AfterClick()
	if ReadRoleValue(  TargetID(), EM_RoleValue_Register ) == 0 then
		SetPlot( TargetID() , "touch" , "LuaFunc_Obj_BUSY" , 50 )
		BeginPlot( TargetID() , "LuaQ_422881_PLAY" , 0 )
	end
	return 1
end

function LuaQ_422881_PLAY()
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 7 )
	local Flag = 780518
	if CheckID( TargetID() ) == true then
		AddBuff( TargetID() , 503977 , 0 , 60 )
	end
	local AndSars = CreateObjByFlag( 114116 , Flag , 3 , 1 )
	local DamnGay = CreateObjByFlag( 114109, Flag , 4, 1 )
	local CheckPoint = CreateObjByFlag(112399, Flag , 3, 1 )
	Lua_ObjDontTouch( AndSars) 
	Lua_ObjDontTouch( DamnGay ) 
	Lua_ObjDontTouch( CheckPoint ) 
	AddToPartition(CheckPoint , 0 )
	MoveToflagEnabled( AndSars , false )
	MoveToflagEnabled( DamnGay , false )
	AdjustFaceDir( AndSars ,DamnGay , 180 )
	AdjustFaceDir( DamnGay , AndSars ,0 )
	CastSpell( CheckPoint , CheckPoint , 491276 )
	sleep( 35 )
	AddToPartition( AndSars , 0 )
	AddToPartition( DamnGay , 0 )
	Yell( AndSars , "[SC_422881]" , 3 )
	PlayMotion( AndSars , ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	sleep( 30 )
	Yell( DamnGay  , "[SC_422881_1]" , 3 )	
	PlayMotion( DamnGay , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep( 30 )
	Yell( AndSars , "[SC_422881_2]" , 3 )
	PlayMotion( AndSars , ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)
	sleep( 30 )
	Yell( DamnGay  , "[SC_422881_3]" , 3 )	
	PlayMotion( DamnGay , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep( 30 )
	Yell( AndSars , "[SC_422881_4]" , 3 )
	AdjustFaceDir(  AndSars ,DamnGay ,0 )
	sleep( 30 )
	Yell( DamnGay  , "[SC_422881_5]" , 3 )	
	PlayMotion( DamnGay , ruFUSION_ACTORSTATE_CROUCH_BEGIN)
	sleep( 30 )
	PlayMotion( DamnGay , ruFUSION_ACTORSTATE_CROUCH_END)
	Yell( AndSars , "[SC_422881_6]" , 3 )
	FaceObj(  AndSars ,DamnGay )
--	PlayMotion( AndSars , ruFUSION_ACTORSTATE_EMOTE_POINT)
	sleep( 30 )
	DelObj( DamnGay ) 
	DelObj( AndSars )
	CastSpell( CheckPoint , CheckPoint , 491276 )
	sleep( 35 )
	local AndSarsPlus = CreateObjByFlag( 113673 , Flag , 5 , 1 )
	local DamnGayPlus = CreateObjByFlag( 114109 , Flag , 6 , 1 )
	Lua_ObjDontTouch( AndSarsPlus ) 
	Lua_ObjDontTouch( DamnGayPlus  ) 
	AddToPartition( AndSarsPlus , 0 )
	AddToPartition( DamnGayPlus , 0 )
	MoveToflagEnabled( AndSarsPlus , false )
	MoveToflagEnabled( DamnGayPlus , false )
	AdjustFaceDir( AndSarsPlus ,DamnGayPlus , 180 )
	AdjustFaceDir( DamnGayPlus , AndSarsPlus ,0 )	
	Yell( DamnGayPlus  , "[SC_422881_7]" , 3 )	
	SetDefIdleMotion( DamnGayPlus ,ruFUSION_MIME_IDLE_COMBAT_2H)
	sleep( 20 )
	AdjustFaceDir( AndSarsPlus ,DamnGayPlus , 0 )	
	sleep( 30 )
	Yell(  AndSarsPlus, "[SC_422881_8]" , 3 )
	PlayMotion( AndSarsPlus , ruFUSION_ACTORSTATE_EMOTE_IDLE1)
	sleep( 30 )
	Yell( DamnGayPlus  , "[SC_422881_9]" , 3 )	
	SetDefIdleMotion(DamnGayPlus ,ruFUSION_MIME_NONE)
	sleep( 10 )
	PlayMotion( DamnGayPlus ,  ruFUSION_ACTORSTATE_EMOTE_SPEAK  )
	sleep( 20 )
	Yell(  AndSarsPlus, "[SC_422881_10]" , 3 )
	PlayMotion( DamnGayPlus ,  ruFUSION_ACTORSTATE_CROUCH_BEGIN )
	sleep( 10 )
	Yell( DamnGayPlus , "[SC_422881_11]" , 3 )
	sleep( 20 )
	Yell(AndSarsPlus  , "[SC_422881_12]" , 3 )	
	SetDefIdleMotion(AndSarsPlus ,ruFUSION_MIME_IDLE_COMBAT_2H)
	sleep( 30 )
	Yell( DamnGayPlus , "[SC_422881_13]" , 3 )
	sleep( 10 )
	Yell(AndSarsPlus  , "[SC_422881_14]" , 3 )
	PlayMotion( AndSarsPlus , ruFUSION_ACTORSTATE_BUFF_SP01 )
	sleep( 30 )
	Yell( DamnGayPlus , "[SC_422881_15]" , 3 )
--	PlayMotion( DamnGayPlus ,  ruFUSION_ACTORSTATE_CROUCH_END )
	CastSpell( CheckPoint , CheckPoint , 491276 )
	sleep( 10 )
	SetPlot( CheckPoint , "range" , "LuaQ_422881_PLAY_2" , 150 )
	sleep( 10 )
	Delobj( CheckPoint )
	Delobj( AndSarsPlus )
	Delobj( DamnGayPlus )
	SetPlot( OwnerID() , "touch" , "" , 0 )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
end

function LuaQ_422881_PLAY_2()
	if CheckAcceptQuest( OwnerID() , 422881 ) == true then
		SetFlag( OwnerID() , 543512 , 1 )
	end
	if CheckBuff( OwnerID() , 503977 )  == true then
		CancelBuff( OwnerID() , 503977 )
	end
end

function LuaQ_422881_Complete()
	if CheckID( TargetID() ) == true then
		AddBuff( TargetID() , 505457 , 0 , 15 )
	end
	if ReadRoleValue( OwnerID() , EM_RoleValue_Register ) > 0 then
		return
	end
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 7 )
	local Flag = 780518
	local RuffleDick = LuaFunc_SearchNPCbyOrgID( OwnerID(), 114100 , 150 )
	DisableQuest( OwnerID() ,true )
	Hide( OwnerID() )
	local Dmy_AntCrown = LuaFunc_CreateObjByObj( 114129 , OwnerID() )
	local Dmy_RuffleDick = LuaFunc_CreateObjByObj(  113558, RuffleDick )
	local TargetBall = CreateObjByFlag( 112399 , Flag , 7 , 1 )
	WriteRoleValue( TargetBall , EM_RoleValue_LiveTime , 10 )
	Hide( Dmy_AntCrown )
	Hide( Dmy_RuffleDick )
	WriteRoleValue( Dmy_AntCrown , EM_RoleValue_LiveTime , 12 )
	WriteRoleValue( Dmy_RuffleDick  , EM_RoleValue_LiveTime , 12 )
	WriteRoleValue( Dmy_AntCrown , EM_RoleValue_IsWalk , 0 )
	WriteRoleValue(Dmy_RuffleDick , EM_RoleValue_IsWalk , 0 )
	Lua_ObjDontTouch( Dmy_AntCrown ) 
	Lua_ObjDontTouch( Dmy_RuffleDick  ) 
	Lua_ObjDontTouch( TargetBall ) 
	AddToPartition( TargetBall , 0 )
	Show( Dmy_AntCrown , 0 )
	Show( Dmy_RuffleDick  , 0)
	MoveToflagEnabled( Dmy_AntCrown , false )
	MoveToflagEnabled( Dmy_RuffleDick , false )
	AdjustFaceDir( Dmy_AntCrown ,TargetBall , 0 )	
	sleep( 20 )
	Yell( Dmy_AntCrown , "[SC_422881_16]" , 3 ) --有股魔力由上方傳來，讓此地的空間出現違和感。--減少發話範圍，避免與2f的對話重疊
	PlayMotion( Dmy_AntCrown ,  ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	sleep( 20 )
	BeginPlot( Dmy_AntCrown , "LuaQ_422811_0" , 0 )
	sleep( 30 )
	Yell( Dmy_RuffleDick , "[SC_422881_17]" , 3 ) --我們也跟上去！--減少發話範圍，避免與2f的對話重疊
	BeginPlot(Dmy_RuffleDick , "LuaQ_422811_0" , 0 )
	sleep( 30 )
	Show( OwnerID() , 0 )
	DisableQuest( OwnerID() , false )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
end

function LuaQ_422811_0()
	local Flag = 780518
	LuaFunc_MoveToFlag(  OwnerID()  ,Flag , 7 ,0 )
--	SetPlot( OwnerID() , "range" , "LuaQ_422811_CancelBuff" , 100 )
--	Delobj( OwnerID() )
end

function LuaQ_422811_CancelBuff()
	CancelBuff_NoEvent( OwnerID() , 505457 )
end

function LuaS_114104_0()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 422882 ) == true and CheckFlag( OwnerID() , 543513) == false then
		AddSpeakOption(  OwnerID(), TargetID( ), "[SC_422882_0]",  "LuaS_114104_1",  0 ); --試著再次取得共鳴
	end
end

function LuaS_114104_1()
	CloseSpeak( OwnerID() )
	BeginPlot( TargetID() , "LuaQ_422882_Accept" , 0 )
end

function LuaQ_422882_Accept()
	if ReadRoleValue(   OwnerID() , EM_RoleValue_Register ) == 0 then
		SetPlot( OwnerID() , "touch" , "LuaFunc_Obj_BUSY" , 50 )
		BeginPlot( OwnerID() , "LuaQ_422882_PLAY" , 0 )
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SAY_NPC_BUSY]" , 0 )
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SAY_NPC_BUSY]" , 0 )		
	end
end

function LuaQ_422882_PLAY()
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 7 )
	DisableQuest( OwnerID() , true )
	local Flag = 780518
	local DamnGay = CreateObjByFlag( 114109 , Flag , 8 , 1 )
	local AntiMiss = CreateObjByFlag( 114115 , Flag , 9 , 1 )
	local CheckPoint = CreateObjByFlag(112399, Flag , 8, 1 )
 	Lua_ObjDontTouch( DamnGay ) 
	Lua_ObjDontTouch( AntiMiss ) 
	Lua_ObjDontTouch( CheckPoint  ) 
	MoveToflagEnabled( DamnGay , false )
	MoveToflagEnabled( AntiMiss , false )
	AddToPartition( CheckPoint  , 0 )
	CastSpell( CheckPoint  , CheckPoint  , 491276 )
	sleep( 30 )
	local BurningMind = CreateObjByFlag( 114114, Flag , 10 , 1 )	
	Lua_ObjDontTouch( BurningMind  ) 
	AddToPartition( BurningMind , 0 )
	MoveToflagEnabled(BurningMind  , false )
	AdjustFaceDir(  BurningMind  , DamnGay , 0 )	
	AddToPartition( DamnGay , 0 )
	AddToPartition( AntiMiss , 0 )
	AdjustFaceDir( DamnGay,BurningMind , 0 )	
	AdjustFaceDir(  AntiMiss ,BurningMind , 0 )	
	sleep( 10 )
	Yell( AntiMiss , "[SC_422882]" , 3 )
	PlayMotion( AntiMiss , ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)
	sleep( 20)
	PlayMotion( DamnGay , ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	sleep( 10 )
	Yell( DamnGay , "[SC_422882_1]" , 3 )
	sleep( 30)
	Yell(  AntiMiss , "[SC_422882_2]" , 3 )
	PlayMotion( AntiMiss , ruFUSION_ACTORSTATE_EMOTE_IDLE1 )
	sleep( 10 )
	AdjustFaceDir( DamnGay,AntiMiss , 0 )
	sleep( 10 )
	Yell( DamnGay , "[SC_422882_3]" , 3 )
	PlayMotion( DamnGay , ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	sleep( 30 )
	Yell( AntiMiss , "[SC_422882_4]" , 3 )
	PlayMotion( AntiMiss , ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)
	sleep( 30)
	Yell( AntiMiss , "[SC_422882_5]" , 3 )
	PlayMotion( AntiMiss , ruFUSION_ACTORSTATE_SHIELD_BASH)
	sleep( 20 )
	Yell( DamnGay , "[SC_422882_6]" , 3 )
	PlayMotion( DamnGay , ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)
	sleep(20)
	PlayMotion( DamnGay , ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	sleep( 30 )
	FaceObj( DamnGay,BurningMind  )	
	sleep( 40 )
	Yell( DamnGay , "[SC_422882_7]" , 3 )	
	PlayMotionEX( DamnGay ,  ruFUSION_ACTORSTATE_CROUCH_BEGIN ,  ruFUSION_ACTORSTATE_CROUCH_LOOP)
	CastSpell( CheckPoint  , CheckPoint  , 491276 )
	sleep( 20 )
	SetPlot( CheckPoint , "range" , "LuaQ_422882_PLAY_2" , 150 )
	sleep( 10)
	Delobj( 	DamnGay )
	Delobj( CheckPoint )
	Delobj( 	AntiMiss )
	DelObj(BurningMind  )
	SetPlot( OwnerID() , "touch" , "" , 0 )
	DisableQuest( OwnerID() , false )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
end

function LuaQ_422882_PLAY_2()
	if CheckAcceptQuest( OwnerID() , 422882 ) == true and CheckFlag( OwnerID() , 543513) == false then
		SetFlag( OwnerID() , 543513 , 1 )
	end
end

function LuaQ_422882_Complete()
	local RuffleDick = LuaFunc_SearchNPCbyOrgID( OwnerID(), 114124, 50 )
	Tell( TargetID() , RuffleDick , "[SC_422882_8]" ) --這是第一次……讓我感到與人類有相同的意志。捨棄軀體捍衛住榮耀……不變的榮耀將指引我們回歸自然……
	ScriptMessage( TargetID() , TargetID() , 2 , "[SC_422882_9]" , 0 ) --魯弗提克閉上眼睛，看起來像是在體悟著什麼……
	ScriptMessage( TargetID() , TargetID() , 0 , "[SC_422882_9]" , 0 ) --魯弗提克閉上眼睛，看起來像是在體悟著什麼……
end

function LuaS_114105_0()
	if  CheckAcceptQuest( OwnerID() , 422883 ) == false then
		LoadQuestOption( OwnerID() )
	else
		SetSpeakDetail( OwnerID(), "[SC_422883]"   );
		if CountBodyItem( OwnerID() , 206445 ) == 0 then
			AddSpeakOption(  OwnerID(), TargetID( ), "[SC_422883_1]",  "LuaS_114105_1",  0 );
		end
	end
end

function LuaS_114105_1()
	CloseSpeak( OwnerID() )
	if CountBodyItem( OwnerID() , 206445 ) == 0 then
		GiveBodyitem(OwnerID() , 206445,1)
	end
end

function LuaS_114134_0()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 422884 ) == true and CountBodyItem( OwnerID() , 206445) > 0 then
		AddSpeakOption(  OwnerID(), TargetID( ), "[SC_422884]",  "LuaS_114134_1",  0 );
	end
	if CheckAcceptQuest( OwnerID() , 422886 ) == true and ( CheckFlag( OwnerID() , 543251 ) == false or CheckFlag( OwnerID() , 543252 ) == false ) then
		AddSpeakOption(  OwnerID(), TargetID( ), "[SC_422886_0]",  "LuaS_114134_2",  0 ); --我準備好了！
		AddSpeakOption(  OwnerID(), TargetID( ), "[SC_422886_1]",  "LuaS_114134_3",  0 ); --我還沒準備好。
	end
	if CheckCompleteQuest( OwnerID() , 422884 ) == true and CheckAcceptQuest( OwnerID() , 422885 ) == false and CheckCompleteQuest( OwnerID() , 422885 ) == false then
		AddSpeakOption(  OwnerID(), TargetID( ), "[SC_DRAMA_REPLY]",  "LuaS_114134_4",  0 ); --（再次觀看劇情演出）		
	end
end

function LuaS_114134_1()
	SetSpeakDetail( OwnerID(), "[SC_422884_1]"   );
	if CheckAcceptQuest( OwnerID() , 422884 ) == true and CountBodyItem( OwnerID() , 206445) > 0 then
		DelBodyItem( OwnerID() , 206445 , 1 )
		Setflag( OwnerID() , 543514 , 1 )
	end	
	AddSpeakOption(  OwnerID(), TargetID( ), "[SO_BACK]",  "LuaS_114134_0",  0 );
end

function LuaS_114134_2()
	if ReadRoleValue( TargetID() , EM_RoleValue_Register+1 ) > 0 then
		SetSpeakDetail( OwnerID(), "[SC_422886_2]"   ); --你的信念還不夠堅定，只有堅定的信念才能讓你達成你所想要的結果。
		AddSpeakOption(  OwnerID(), TargetID( ), "[SO_BACK]",  "LuaS_114134_0",  0 );
	else
		CloseSpeak( OwnerID() )
		BeginPlot( TargetID() , "LuaQ_422886_PLAY" , 0 )
	end
end

function LuaS_114134_3()
	SetSpeakDetail( OwnerID(), "[SC_422886_3]"   ); --只有堅定的意志，才能陪伴你渡過所有難關。
	AddSpeakOption(  OwnerID(), TargetID( ), "[SO_BACK]",  "LuaS_114134_0",  0 );
end

function LuaS_114134_4()
	CloseSpeak( OwnerID() )
	BeginPlot( TargetID() , "LuaQ_422884_Complete" , 0 )
end

function LuaQ_422884_Complete()
	if CheckID( TargetID() ) == true then
		AddBuff( TargetID() , 505458 , 0 , 60 )
	end
	if ReadRoleValue( OwnerID() , EM_RoleValue_Register ) > 0 then
		return
	end
	DisableQuest( OwnerID() , true )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 777 )
	SetPlot( OwnerID() , "touch" ,  "LuaFunc_Obj_BUSY" , 50 )
	local RuffleDick_Org = LuaFunc_SearchNPCbyOrgID( OwnerID(), 114124 , 150 )
	local RuffleDick = LuaFunc_CreateObjByObj( 114125 ,RuffleDick_Org )
	local AntCrown = LuaFunc_CreateObjByObj( 114194 , OwnerID() )
	Lua_ObjDontTouch( RuffleDick  ) 
	Lua_ObjDontTouch( AntCrown  ) 
	local Dir_RuffleDick = ReadRoleValue( RuffleDick , EM_RoleValue_Dir )
	local Dir_AntCrown = ReadRoleValue(AntCrown , EM_RoleValue_Dir )
	MoveToflagEnabled( RuffleDick  , false )
	MoveToflagEnabled( AntCrown  , false )
	sleep( 10 )
	if CheckID( TargetID() ) == true then
		AdjustFaceDir( AntCrown ,TargetID() , 0 )
	end
	Yell( AntCrown , "[SC_422884_2]" , 3 )
	PlayMotion( AntCrown , ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	sleep( 30 )
	Yell( AntCrown , "[SC_422884_3]" , 3 )
	PlayMotion( AntCrown , ruFUSION_ACTORSTATE_EMOTE_POINT)
	sleep( 30 )
	Yell( AntCrown , "[SC_422884_4]" , 3 )
	AdjustFaceDir( RuffleDick , AntCrown ,0 )
	PlayMotion( AntCrown , ruFUSION_ACTORSTATE_EMOTE_IDLE1 )
	sleep( 30 )
	Yell( RuffleDick , "[SC_422884_5]" , 3 )
	PlayMotion( RuffleDick , ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	sleep( 30 )
	AdjustFaceDir( AntCrown ,RuffleDick , 0 )
	Yell( RuffleDick , "[SC_422884_6]" , 3 )
	PlayMotion( RuffleDick , ruFUSION_ACTORSTATE_ATTACK_1H )
	sleep( 30 )
	Yell( RuffleDick , "[SC_422884_7]" , 3 )
	PlayMotion( RuffleDick ,ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )
	sleep( 30 )
	Yell( RuffleDick , "[SC_422884_8]" , 3 )
	PlayMotion( AntCrown , ruFUSION_ACTORSTATE_EMOTE_IDLE1 )
	PlayMotion( RuffleDick ,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep( 30 )
	Yell( AntCrown , "[SC_422884_9]" , 3 )
	PlayMotion( AntCrown , ruFUSION_ACTORSTATE_EMOTE_APPROVAL )
	sleep( 30 )
	AdjustFaceDir( RuffleDick, AntCrown , 180 )
	Yell( RuffleDick, "[SC_422884_10]" , 3 )
	sleep( 30 )
	SetPlot( RuffleDick , "range" , "Lua_422884_CancelBuff" , 100 )
	SetPlot( AntCrown , "range" , "Lua_422884_CancelBuff" , 100 )
	SetDir( RuffleDick , Dir_RuffleDick )
	SetDir( AntCrown  , Dir_AntCrown )
	sleep( 10 )
	Delobj( AntCrown )
	Delobj( RuffleDick )
	SetPlot( OwnerID() , "touch" ,  "" , 0 )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
	DisableQuest( OwnerID() , false )
end

function Lua_422884_CancelBuff()
	CancelBuff_NoEvent( OwnerID() , 505458 )
end

function LuaI_206446_Check()
	local OrgID = 0
	if CheckAcceptQuest( OwnerID() , 422885 ) == false or CountBodyItem( OwnerID() , 206447 ) >= 5 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_206446_0]" , 0 ) --你不需要使用此物品
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_206446_0]" , 0 )
		return false
	end
	if Lua_ExGetZone( OwnerID() )  ~= 9 or Lua_ObjAreaCheck(OwnerID(), 718 ) == false then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_206446_1]" , 0 ) --你只能在[ZONE_TUMBLING VALLEY]使用此物品
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_206446_1]" , 0 )
		return false
	end
	if CheckID( TargetID() ) == true then
		OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	end
	if OrgID == 0 or ( OrgID ~= 102513 and OrgID ~= 102515 and OrgID ~= 102516 ) or CheckBuff( TargetID() , 504004 ) == true then
		if OrgID == 102517 then
			if ReadRoleValue( TargetID() , EM_RoleValue_IsDead ) == 1 then
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_206446_4]" , 0 ) --死亡的蛇人無法對儀式產生任何幫助
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_206446_4]" , 0 )
				return false
			else
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_206446_2]" , 0 ) --光憑[206446]可能無法困住[102517]
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_206446_2]" , 0 )
				return false
			end
		end
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_206446_3]" , 0 ) --此物品必須對蛇人使用
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_206446_3]" , 0 )
		return false
	end
	if ReadRoleValue( TargetID() , EM_RoleValue_IsDead ) == 1 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_206446_4]" , 0 ) --死亡的蛇人無法對儀式產生任何幫助
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_206446_4]" , 0 )
		return false
	end
	if ReadRoleValue( TargetID() , EM_RoleValue_HP ) > 0.5*ReadRoleValue( TargetID() , EM_RoleValue_MaxHP ) then
		local Name = "["..ReadRoleValue(TargetID() ,EM_RoleValue_OrgID).."]"
		local Str = "[SC_206446_5][$SETVAR1="..Name.."]"
		ScriptMessage( OwnerID() , OwnerID() , 1 ,Str , 0 ) --你試圖制服[$VAR1]，但目標巧妙地躲開了
		ScriptMessage( OwnerID() , OwnerID() , 0 , Str , 0 )
		if HateListCount( TargetID() ) == 0  then
			SetAttack( TargetID() , OwnerID() )
		end
		return false
	end
	return true
end

function LuaI_206446_Use()
	if GiveBodyItem( OwnerID() , 206447 , 1 ) then
		AddBuff( TargetID() , 504004 , 0 , 3 )
		UseItemDestroy( OwnerID() )
	end
	ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_206446_6]" , 0 ) --你成功捕捉到一名蛇人！
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_206446_6]" , 0 )
	CallPlot(TargetID(),"LuaFunc_ResetObj",TargetID())
end

function LuaS_114124_0()
	LoadQuestOption( OwnerID() )
	if CheckCompleteQuest( OwnerID() , 422885 ) == true and CheckAcceptQuest( OwnerID() , 422886 ) == false and CheckCompleteQuest( OwnerID() , 422886 ) == false then
		AddSpeakOption(  OwnerID(), TargetID( ), "[SC_DRAMA_REPLY]",  "LuaS_114124_1",  0 ); --（再次觀看劇情演出）		
	end
end

function LuaS_114124_1()
	CloseSpeak( OwnerID() )
	BeginPlot( TargetID() , "LuaQ_422885_Complete" , 0 )
end

function LuaQ_422885_Complete()
	if CheckID( TargetID() ) == true then
		AddBuff( TargetID() , 504004 , 0 , 60 )
	end
	if ReadRoleValue( OwnerID() , EM_RoleValue_Register ) > 0 then
		return
	end
	DisableQuest( OwnerID() , true )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 777 )
	SetPlot( OwnerID() , "touch" ,  "LuaFunc_Obj_BUSY" , 50 )
	local AntCrown_Org = LuaFunc_SearchNPCbyOrgID( OwnerID(), 114134 , 150 )
	local RuffleDick = LuaFunc_CreateObjByObj( 114216 ,OwnerID() )
	local AntCrown = LuaFunc_CreateObjByObj( 114217 , AntCrown_Org )
	Lua_ObjDontTouch( RuffleDick  ) 
	Lua_ObjDontTouch( AntCrown  ) 
	local Dir_RuffleDick = ReadRoleValue( RuffleDick , EM_RoleValue_Dir )
	local Dir_AntCrown = ReadRoleValue(AntCrown , EM_RoleValue_Dir )
	local Me = Role:new( OwnerID() )
	MoveToflagEnabled( RuffleDick  , false )
	MoveToflagEnabled( AntCrown  , false )
	AdjustFaceDir( AntCrown ,RuffleDick, 0 )
	FaceObj( RuffleDick , AntCrown )
	Yell( RuffleDick , "[SC_422885]" , 1 )
	sleep( 30)
	Yell( AntCrown , "[SC_422885_1]" , 1 )
	PlayMotion( AntCrown , ruFUSION_ACTORSTATE_EMOTE_IDLE1 )
	sleep( 30 )
	Yell( RuffleDick , "[SC_422885_2]" , 1)
	PlayMotion( RuffleDick , ruFUSION_ACTORSTATE_EMOTE_POINT)
	sleep( 30 )
	Yell( AntCrown , "[SC_422885_3]" , 1 )
	PlayMotion( AntCrown , ruFUSION_ACTORSTATE_EMOTE_POINT )
	sleep( 30 )
	Yell( RuffleDick , "[SC_422885_4]" , 1 )
	PlayMotion( RuffleDick , ruFUSION_ACTORSTATE_EMOTE_APPROVAL)
	sleep( 20 )
	Move( RuffleDick , Me:X() , Me:Y() , Me:Z() )
	Yell( AntCrown , "[SC_422885_5]" , 1 )
	PlayMotion( AntCrown , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep( 30 )
	PlayMotion( AntCrown , ruFUSION_ACTORSTATE_EMOTE_IDLE1 )
	sleep( 20 )
	SetDir( AntCrown  , Dir_AntCrown )
	sleep( 20 )
	SetDir( RuffleDick , Dir_RuffleDick )
	SetPlot( RuffleDick , "range" , "LuaQ_422885_CancelBuff" , 100 )
	sleep( 10 )
	DelObj( RuffleDick )
	DelObj( AntCrown )
	SetPlot( OwnerID() , "touch" ,  "" , 0 )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
	DisableQuest( OwnerID() , false )
end

function LuaQ_422885_CancelBuff()
	CancelBuff_NoEvent( OwnerID()  , 504004  )
end

function LuaQ_422886_PLAY()
	if ReadRoleValue( OwnerID() , EM_RoleValue_Register +1) > 0 then
		Tell( TargetID() , OwnerID() , "[SC_ 422886_2]" )
		return
	end
	WriteRoleValue( OwnerID() , EM_RoleValue_Register +1, 777 )
	local RuffleDick_Org = LuaFunc_SearchNPCbyOrgID( OwnerID(), 114124 , 150 )
	local AntCrown = LuaFunc_CreateObjByObj( 114138 , OwnerID() )
	local RuffleDick = LuaFunc_CreateObjByObj( 114131 , RuffleDick_Org )
	WriteRoleValue( AntCrown , EM_RoleValue_PID , RuffleDick )
	SetPlot(RuffleDick , "range" , "LuaQ_422886_AddBuff" , 150 )
	WriteRoleValue( AntCrown , EM_RoleValue_IsWalk , 1 )
	Lua_ObjDontTouch( AntCrown  ) 
	Lua_ObjDontTouch( RuffleDick  ) 
	MoveToflagEnabled( AntCrown  , false )
	MoveToflagEnabled( RuffleDick , false )
	if CheckID( TargetID() ) == true then
		AdjustFaceDir( AntCrown   ,TargetID() , 0 )		
	end
	sleep( 5 )
	Yell( AntCrown , "[SC_422886_19]" , 3 )
	PlayMotion(  AntCrown  , ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
	sleep( 20 )	
	BeginPlot( AntCrown ,"LuaQ_422886_PLAY_2" , 0 )
	BeginPlot( RuffleDick  , "LuaQ_422886_PLAY_GO" , 0 )
	local Time = 0
	while 1 do
		if CheckID( AntCrown ) == false then
			break
		end
		sleep( 10 )
		Time = Time + 1
		if Time >= 300 then --超過 300 秒就叫物件將自己刪除來結束劇情
			WriteRoleValue( AntCrown , EM_RoleValue_Register , 777  ) 
		end
	end
	WriteRoleValue( OwnerID() , EM_RoleValue_Register +1, 0 )
end

function LuaQ_422886_AddBuff()
	if CheckAcceptQuest( OwnerID() , 422886 ) == true and ( CheckFlag( OwnerID() , 543521 ) == false or  CheckFlag( OwnerID() , 543522 ) == false ) and CheckBuff( OwnerID() , 505459 ) == false then
		AddBuff( OwnerID() , 505459 , 0 , 330 )
		for i = 1 , 55 , 1 do
			sleep( 60 )
			if CheckID( TargetID() ) == false then
				CancelBuff_NoEvent(  OwnerID() , 505459 )
				break
			end
			if CheckAcceptQuest( OwnerID() , 422886 ) == false then
				CancelBuff_NoEvent(  OwnerID() , 505459 )
				break
			end
		end
	end
end

function LuaQ_422886_PLAY_GO()
	local Flag = 780518
	Hide( OwnerID() )
	MoveToFlagEnabled( OwnerID() , false )
	WriteRoleValue( OwnerID() , EM_RoleValue_IsWalk , 1 )
	SetRoleCamp( OwnerID() , "SNPC" )
	Show( OwnerID() , 0 )
	LuaFunc_MoveToFlag( OwnerID(), Flag , 13 ,0 )
	sleep( 1 )
	LuaFunc_MoveToFlag( OwnerID(), Flag , 14 ,0 )
	sleep( 1 )
	SetFightMode( OwnerID() , 1 , 1 , 1 , 1 )
end

function LuaQ_422886_PLAY_2()
	local Flag = 780518
	local DamnGay = CreateObjByFlag( 114130 ,Flag , 22 , 1 ) --與114136相同位置
	local Naga = {}
	local Ghost = {}
	local RuffleDick = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	LuaFunc_MoveToFlag( OwnerID(), Flag , 13 ,0 )
	sleep( 1 )
	LuaFunc_MoveToFlag( OwnerID(), Flag , 14 ,0 )
	sleep( 1 )
	LuaFunc_MoveToFlag( OwnerID(), Flag , 15 ,0 )
	AdjustFaceDir( OwnerID()  ,RuffleDick , 0 )
	LuaFunc_MoveToFlag( RuffleDick , Flag , 16 ,0 )
	local Auro = CreateObjByFlag( 113425,Flag , 22 , 1 ) 
	Lua_ObjDontTouch(Auro) 
	AdjustFaceDir( RuffleDick , OwnerID() , 0 )
	sleep( 5)
	Yell(  RuffleDick , "[SC_422886_18]" , 3 )
	PlayMotion(   RuffleDick , ruFUSION_ACTORSTATE_EMOTE_POINT )
	sleep( 10 )
	AdjustFaceDir( OwnerID()  ,RuffleDick , 0 )
	sleep( 5 )
	AdjustFaceDir( OwnerID()  , Auro , 0 )
	sleep( 5 )
	PlayMotionEX(OwnerID(),ruFUSION_ACTORSTATE_CHANNEL_BEGIN , ruFUSION_ACTORSTATE_CHANNEL_LOOP)
	sleep( 10 )
	AddToPartition( Auro , 0 )
	AdjustFaceDir( RuffleDick , Auro , 0 )
	AddBuff( OwnerID() , 504936 , 0 , -1 )
	AddBuff( OwnerID() , 505179 , 0 , 600)
	sleep( 10 )
	AddBuff( Auro ,505179 , 0 , 600 )
	for i = 1 , 5 , 1 do
		Naga[i] = CreateObjByFlag( 102513 ,Flag , 16+i , 1 )
		Lua_ObjDontTouch( Naga[i] ) 	
		SetRoleCamp( Naga[i] , "Visitor" )
		WriteRoleValue( Naga[i] ,EM_RoleValue_LiveTime , 20 )
		AddToPartition( Naga[i] , 0 )
		PlayMotionEX( Naga[i] , ruFUSION_ACTORSTATE_DYING,ruFUSION_ACTORSTATE_DEAD)
		CastSpell( Naga[i] , Auro , 493219 )
	end
	sleep( 50 )
	for i = 1 , 2 , 1 do
		if i == 1 then
			Ghost[i] = CreateObjByFlag( 102940 ,Flag , 23 , 1 )	
		else
			Ghost[i] = CreateObjByFlag( 102942 ,Flag , 24 , 1 )	
		end
		AddToPartition( Ghost[i] , 0 )
		SetPlot( Ghost[i] ,"dead" ,  "LuaQ_422886_DEAD" , 40 )
		SetAttack( Ghost[i] , RuffleDick )
		CastSpell( Ghost[i] , Ghost[i] , 493668 )
	end
	WriteRoleValue( Ghost[1] , EM_RoleValue_Register , Ghost[2] )
	WriteRoleValue( Ghost[2] , EM_RoleValue_Register , Ghost[1] )
	local Check 
	while 1 do
		Check = 0
		if CheckID( RuffleDick ) == 0 or ReadRoleValue( RuffleDick , EM_RoleValue_isDead ) == 1 then 
			WriteRoleValue( OwnerID() , EM_RoleValue_PID , 1 )
			break
		end
		if ReadRoleValue(OwnerID() , EM_RoleValue_Register ) > 0 then 
			WriteRoleValue( OwnerID() , EM_RoleValue_PID , 2 )
			break
		end
		for i = 1 , 2 , 1 do
			if CheckID( Ghost[i] ) == false or ReadRoleValue(Ghost[i] , EM_RoleValue_isDead ) == 1 then
				Check = Check + 1
			end
		end
		if Check >= 2 then --任務成功
			WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 )
			PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_CHANNEL_END)
			CancelBuff_NoEvent( OwnerID() , 504936 )
			CancelBuff_NoEvent( OwnerID() , 505179 )
			Lua_CancelAllBuff( RuffleDick )
			Castspell( Auro , Auro , 493688 )
			sleep( 10 )
			Delobj( Auro )
			break
		end
		sleep( 10 )
	end
	if Check >= 2 then
		SetRoleCamp( RuffleDick , "Visitor" )
		Lua_ObjDontTouch( RuffleDick ) 
		Lua_ObjDontTouch(DamnGay) 
		AddToPartition( DamnGay , 0 )
		AdjustFaceDir( DamnGay , OwnerID()  , 0 )
		sleep( 10 )
		Yell( DamnGay , "[SC_422886_6]" , 3 ) --石頭，是我的。誰也不能搶奪。你，是誰？
		PlayMotion(  DamnGay , ruFUSION_ACTORSTATE_EMOTE_POINT )
		sleep( 10 )
		Yell( RuffleDick , "[SC_422886_7]" , 3 ) --交出[206389]，否則……
		LuaFunc_MoveToFlag(RuffleDick , Flag , 26 , 0  )
		AdjustFaceDir( RuffleDick  , DamnGay , 0 )
		sleep( 10 )
		PlayMotionEX(RuffleDick ,ruFUSION_ACTORSTATE_CHANNEL_BEGIN , ruFUSION_ACTORSTATE_CHANNEL_LOOP)
		AddBuff( DamnGay , 503604 ,0 , -1 )
		sleep( 20 )
		Yell( DamnGay , "[SC_422886_8]" , 3 ) --[206389]？
		AdjustFaceDir( DamnGay , RuffleDick  , 0 )
		sleep( 10 )
		Yell( OwnerID() , "[SC_422886_17]" , 3 )
		PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_SHIELD_BASH ) 
		sleep( 10 )
		PlayMotion(RuffleDick ,ruFUSION_ACTORSTATE_CHANNEL_END)
		sleep( 10 )
		CancelBuff_NoEvent( DamnGay , 503604  )
		LuaFunc_MoveToFlag(OwnerID() , Flag , 20 , 0  )
		AdjustFaceDir( OwnerID()  , DamnGay , 0 )
		AdjustFaceDir( RuffleDick , OwnerID()  , 0 )
		sleep( 10 )
		Yell( OwnerID() , "[SC_422886_9]" , 3 ) --[114130]……
		sleep( 10 )
		Yell(  DamnGay, "[SC_422886_10]" , 3 ) --[114130]？
		AdjustFaceDir( DamnGay , OwnerID() , 0 )
		sleep( 20 )
		Yell( OwnerID() , "[SC_422886_11]" , 3 ) --你的名字。
		PlayMotion(  OwnerID()  , ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
		sleep( 20 )
		Yell(  DamnGay, "[SC_422886_12]" , 3 ) --不記得了……
		PlayMotion(  DamnGay , ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )
		sleep( 20 )
		Yell( OwnerID() , "[SC_422886_13]" , 3 ) --你還記得[113629]嗎？
		PlayMotion(  OwnerID()  , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
		PlayMotion(  DamnGay , ruFUSION_ACTORSTATE_EMOTE_ANGRY )
		AdjustFaceDir( RuffleDick  , DamnGay , 0 )
		sleep( 20 )
		Yell( RuffleDick , "[SC_422886_14]" , 3 ) --無論用什麼方法，都要從他的嘴中，問出[206389]的下落。
		PlayMotion(  RuffleDick   , ruFUSION_ACTORSTATE_EMOTE_POINT )
		PlayMotion(  DamnGay , ruFUSION_ACTORSTATE_EMOTE_CRY)
		sleep( 20 )
		Yell( OwnerID() , "[SC_422886_15]" , 3 ) --不，對過去的勇士需要更尊重的對待。	
		AdjustFaceDir( OwnerID(), RuffleDick  , 0 )
		sleep(10)
		PlayMotion(  OwnerID()  , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
		PlayMotion(  DamnGay , ruFUSION_ACTORSTATE_CROUCH_BEGIN)
		sleep( 10)
		AdjustFaceDir( RuffleDick  , OwnerID(), 0 )
		sleep( 10 )
		Yell( RuffleDick , "[SC_422886_16]" , 3 ) --勇士？充其份量不過是與其他生物的締結生命的低下生物罷了！如何與我族的性命相較？
		PlayMotion( RuffleDick , ruFUSION_ACTORSTATE_ATTACK_1H )
		sleep( 20 )
		PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_IDLE1 )
		sleep( 10 )
		Hide( RuffleDick )
		WriteRoleValue( RuffleDick , EM_RoleValue_IsWalk , 1 )
		Show( RuffleDick, 0 )
		LuaFunc_MoveToFlag( RuffleDick , Flag , 16, 0  )--與114168相同位置
		SetDir( OwnerID() , 196 )
		SetDir( RuffleDick , 221 )
		SetPlot( OwnerID() , "range" , "LuaQ_422886_CancelBuff" , 250 )
		sleep( 10 )
		Delobj( DamnGay )
		Delobj(RuffleDick )
		Delobj( OwnerID() )	
	else
		if CheckID(RuffleDick ) == true then
			Delobj(RuffleDick)
		end
		for i = 1 , 2 , 1 do
			if CheckID( Ghost[i] ) == true and ReadRoleValue(Ghost[i] , EM_RoleValue_isDead ) == 0 then
				Delobj(Ghost[i])
			end
		end
		SetPlot( OwnerID() , "range" , "LuaQ_422886_CancelBuff" , 250 )
		sleep( 10 )
		Delobj( Auro )
		Delobj( DamnGay)
		Delobj( OwnerID() )
	end
end

function LuaQ_422886_CancelBuff()
	if ReadRoleValue( TargetID() , EM_RoleValue_PID ) == 0 then
		if CheckAcceptQuest(  OwnerID() , 422886 ) == true and CheckFlag( OwnerID()  , 543521 ) == true and ReadRoleValue(OwnerID() , EM_RoleValue_IsDead) == 0 then
			SetFlag( OwnerID() , 543522 , 1 )
		end
	end
	if ReadRoleValue( TargetID() , EM_RoleValue_PID ) == 1 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422886_4]" , 0 ) --[114131]死亡，任務失敗
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422886_4]" , 0 )
		if CheckFlag( OwnerID()  , 543521 ) == true then
			SetFlag( OwnerID() , 543521  , 0 )
		end
	end
	if ReadRoleValue( TargetID() , EM_RoleValue_PID ) == 2 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422886_5]" , 0 ) --超過時間，任務失敗
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422886_5]" , 0 )
		if CheckFlag( OwnerID()  , 543521 ) == true  then
			SetFlag( OwnerID() , 543521  , 0 )
		end
	end
	CancelBuff( OwnerID() , 505459 )
end

function LuaQ_422886_DEAD()
	local AnotherOne = ReadRoleValue( OwnerID() , EM_RoleValue_Register )
	for i = 1 , HateListCount( OwnerID() ) , 1 do
		local ID = HateListInfo(OwnerID() ,i-1 , EM_HateListInfoType_GItemID )
		if CheckAcceptQuest( ID , 422886 ) == true and CheckFlag( ID , 543521 ) == false then
			SetFlag( ID , 543521 , 1 )
		end
	end
	return true
end

function LuaI_114136_0()
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_CROUCH_BEGIN,ruFUSION_ACTORSTATE_CROUCH_LOOP)
	sleep( 30 )
	local RuffleDick_Org = LuaFunc_SearchNPCbyOrgID( OwnerID(), 114168, 150 )
	local AntCrown_Org = LuaFunc_SearchNPCbyOrgID( OwnerID(), 114135, 150 )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+8  , RuffleDick_Org )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+9  , AntCrown_Org )
end

function LuaS_114136_0()
	if CheckAcceptQuest( OwnerID() , 422887 ) == true then
		SetSpeakDetail( OwnerID(), "[SC_422887_0]"   );
		AddSpeakOption(  OwnerID(), TargetID( ), "[SC_422887_1]",  "LuaS_114136_1",  0 ); --不，我不是來和你搶奪石頭，我是來幫助你。
	else
		LoadQuestOption( OwnerID() )
	end
end

function LuaS_114103_0()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 422888) == true and CountBodyItem( OwnerID() , 206448) == 0 then
		AddSpeakOption(  OwnerID(), TargetID( ), "[SC_422888_0]",  "LuaS_114103_1",  0 ); --你準備好了嗎？我要動手了......		
	end
end

function LuaS_114136_1()
	SetSpeakDetail( OwnerID(), "[SC_422887_2]"   ); --幫助我？石頭是我的，誰也不能奪走。
	if ReadRoleValue( TargetID() , EM_RoleValue_Register ) == 0  and CountBodyItem( OwnerID() , 206456 ) > 0 then
		AddSpeakOption(  OwnerID(), TargetID( ), "[SC_422887_3]",  "LuaS_114136_2",  0 ); --也許你可以仔細看著這份你所寫下的碑文。
		AddSpeakOption(  OwnerID(), TargetID( ), "[SO_BACK]",  "LuaS_114136_0",  0 );
	end
end

function LuaS_114136_2()
	CloseSpeak( OwnerID() )

	if ReadRoleValue( TargetID() , EM_RoleValue_Register ) == 0 then
		if CheckAcceptQuest( OwnerID() , 422887 ) == true  and CountBodyItem( OwnerID() , 206456 ) > 0 then
			DelBodyItem( OwnerID() , 206456 , 1 )
			BeginPlot( TargetID() , "LuaQ_422887_PLAY" , 0 )
			AddBuff( OwnerID() ,505460, 0 , 60 )
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SAY_NPC_BUSY]" , 0 )
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SAY_NPC_BUSY]" , 0 )
	end
end

function LuaS_114103_1()
	CloseSpeak( OwnerID() )
	if ReadRoleValue( TargetID() , EM_RoleValue_Register ) == 0 then
		BeginPlot( TargetID() , "LuaQ_422888_PLAY" , 0 )
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SAY_NPC_BUSY]" , 0 )
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SAY_NPC_BUSY]" , 0 )
	end
end

function LuaQ_422887_PLAY()
	local Flag = 780518
	SetPlot(  OwnerID() , "touch" , "LuaFunc_Obj_BUSY" , 40)
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 777 )
	DisableQuest( OwnerID() , true )
	local Me = Role:new( OwnerID() )
	local R_Org = Role:new( ReadRoleValue( OwnerID(), EM_RoleValue_Register+8) )
	local A_Org = Role:new( ReadRoleValue( OwnerID(), EM_RoleValue_Register+9) )
	local Dir = Me:Dir()
	local DamnGay = CreateObj( 114191 ,  Me:X() , Me:Y() , Me:Z() , Dir , 1 )
	local RuffleDick = LuaFunc_CreateObjByObj( 114133, ReadRoleValue( OwnerID(), EM_RoleValue_Register+8) )
	local AntCrown = LuaFunc_CreateObjByObj( 114190 , ReadRoleValue( OwnerID(), EM_RoleValue_Register+9))
	Lua_ObjDontTouch( DamnGay  ) 
	Lua_ObjDontTouch( RuffleDick   )
	Lua_ObjDontTouch( AntCrown   )
	MoveToFlagEnabled( DamnGay  , false) 
	MoveToFlagEnabled( RuffleDick   , false)
	MoveToFlagEnabled( AntCrown   , false)
	AddToPartition( DamnGay , 0 )
	Hide( RuffleDick  )
	WriteRoleValue( RuffleDick   , EM_RoleValue_IsWalk , 0 )
	Show(RuffleDick   , 0 )
	SetDefIdleMotion( DamnGay ,ruFUSION_MIME_CROUCH_LOOP)
	Yell(  DamnGay ,"[SC_422887_4]" , 3 ) --主人……自然之石，不能遺忘，艾德琳……艾德琳……
	sleep( 30 )
	Yell(  DamnGay ,"[SC_422887_5]" , 3 ) --自然之石，自然之石……
	SetDefIdleMotion( DamnGay ,ruFUSION_MIME_NONE)
	PlayMotion( DamnGay , ruFUSION_ACTORSTATE_CROUCH_END)
	sleep(30)
	LuaFunc_MoveToFlag( DamnGay, Flag , 25 ,0 )
	PlayMotion(  DamnGay , ruFUSION_ACTORSTATE_EMOTE_IDLE0 )
	AdjustFaceDir( RuffleDick  , DamnGay , 0 )	
	sleep( 10 )
	Yell(  RuffleDick ,"[SC_422887_6]" , 3 ) --你想起來了嗎？自然之石的真正位置？
	PlayMotion(  RuffleDick , ruFUSION_ACTORSTATE_EMOTE_POINT )
	AdjustFaceDir(  AntCrown   ,RuffleDick , 0 )
	sleep( 20 )
	Yell(   DamnGay,"[SC_422887_7]" , 3 ) --不能說……
	PlayMotion(  DamnGay , ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )
	sleep( 20 )
	Yell(  RuffleDick ,"[SC_422887_8]" , 3 ) --	不說，你將會再次進入死亡。
	AdjustFaceDir(  AntCrown   ,RuffleDick , 0 )
	LuaFunc_MoveToFlag( RuffleDick , Flag , 26 ,0 )
	AdjustFaceDir(  AntCrown   ,RuffleDick , 0 )
	PlayMotion( RuffleDick , ruFUSION_ACTORSTATE_CAST_INSTANT)
	sleep( 5 )
	CastSpell( DamnGay ,DamnGay ,491923 )
	sleep( 5 )
	PlayMotion( DamnGay , ruFUSION_ACTORSTATE_HURT_NORMAL)
	sleep( 10 )
	Yell( DamnGay , "[SC_422887_9]" , 3 ) --臭！你的身體，魔族？.......你和魔族一樣腐敗！
	AdjustFaceDir(  DamnGay ,RuffleDick  , 0 )
	PlayMotion( DamnGay , ruFUSION_ACTORSTATE_EMOTE_ANGRY)
	sleep( 20 )
	Yell( DamnGay , "[SC_422887_10]" , 3 ) --敵人！	
	PlayMotion( DamnGay , ruFUSION_ACTORSTATE_ATTACK_1H_SP)
	CastSpell( AntCrown, AntCrown, 494747 )
	SetPosByFlag( AntCrown, Flag , 24 )
	AdjustFaceDir( AntCrown ,DamnGay , 0 )
	sleep(  1 )
	PlayMotion( AntCrown ,ruFUSION_ACTORSTATE_SHIELD_BLOCK)
	sleep( 5 )
	AddBuff(RuffleDick ,500235 , 0 , 1)
	sleep( 20 )
	Yell( AntCrown , "[SC_422887_11]" , 3 ) --平息你的憤怒吧！達馬蓋。
	PlayMotion( AntCrown , ruFUSION_ACTORSTATE_SHIELD_BASH )
	sleep( 5 )
	CastSpell(  DamnGay,  DamnGay , 493688 )
	sleep( 15 )
	CallPlot(RuffleDick , "LuaQ_422887_GO_2", R_Org:Dir())
	PlayMotionEX( DamnGay , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_LOOP)	
	sleep( 30 )
	Yell(  DamnGay , "[SC_422887_12]" , 3 ) --你……是……我想起來，一樣的氣息，讓我清醒過來。是你，對吧？
	sleep( 20 )
	Yell(  AntCrown , "[SC_422887_13]" , 3 ) --達馬蓋，結界的崩毀促使你的生命開始步入倒數……
	PlayMotionEX( AntCrown , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_LOOP)
	sleep( 30 )
	Yell(  DamnGay , "[SC_422887_14]" , 3 ) --因為這是我的選擇。
	PlayMotion( DamnGay , ruFUSION_ACTORSTATE_CROUCH_END)
	sleep( 20 )
	PlayMotion( AntCrown , ruFUSION_ACTORSTATE_CROUCH_END)
	sleep( 30 )
	CallPlot( AntCrown  , "LuaQ_422887_GO_3", A_Org:Dir())
	sleep( 5  )
	LuaFunc_MoveToFlag( DamnGay , Flag , 22 ,0 )	
	SetDir( DamnGay , Dir )
	sleep(5)
	PlayMotionEX( DamnGay , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_LOOP)
	sleep( 30)
	SetPlot( DamnGay , "range" , "LuaQ_422887_QUEST_OK" , 120 )
	sleep( 10 )
	DelObj( DamnGay )
	DelObj( RuffleDick )
	DelObj( AntCrown )
	DisableQuest( OwnerID() , false )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
	SetPlot(  OwnerID() , "touch" , "" , 0)
end

function LuaQ_422887_GO_1()
	local Flag = 780518
	LuaFunc_MoveToFlag( OwnerID(), Flag , 25 ,0 )
end

function LuaQ_422887_GO_2(Dir)
	local Flag = 780518
	Hide(  OwnerID()  )
	WriteRoleValue(  OwnerID()   , EM_RoleValue_IsWalk ,1 )
	Show( OwnerID()  , 0 )
	LuaFunc_MoveToFlag( OwnerID(), Flag , 16 ,0 )
	sleep( 10 )
	SetDir( OwnerID() , Dir )
end

function LuaQ_422887_GO_3(Dir)
	local Flag = 780518
	LuaFunc_MoveToFlag( OwnerID(), Flag , 20 ,0 )
	sleep( 5 )
	SetDir( OwnerID() , Dir )
end

function LuaQ_422887_QUEST_OK()
	local Buff = 505460
	if CheckAcceptQuest( OwnerID() , 422887 ) == true then
		SetFlag( OwnerID() , 543520 , 1 )
	end
	if CheckBuff( OwnerID() , Buff  ) == true then
		CancelBuff_NoEvent( OwnerID() , Buff  )
	end
end

function LuaQ_422888_PLAY()
	Yell( OwnerID() , "[SC_422888_1]" , 3 ) --快動手，趁我還保留有理智。
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 777 )
	DisableQuest( OwnerID() , true )
	Hide( OwnerID() )
	local Me = Role:new( OwnerID() )
	local RuffleDick_Org = ReadRoleValue( OwnerID(), EM_RoleValue_Register+8) 
	local AntCrown_Org = ReadRoleValue( OwnerID(), EM_RoleValue_Register+9) 
	local DamnGay = CreateObj( 102939 , Me:X() , Me:Y() ,Me:Z() , Me:Dir() , 1 )
	--SetModeEX( DamnGay , EM_SetModeType_Strikback , false )
	SetModeEX( DamnGay , EM_SetModeType_Searchenemy , false )
	SetModeEX( DamnGay , EM_SetModeType_DisableRotate , true)
	SetModeEX( DamnGay , EM_SetModeType_Move , false)
	WriteRoleValue( DamnGay , EM_RoleValue_Register+8 , RuffleDick_Org  )
	WriteRoleValue( DamnGay , EM_RoleValue_Register+9 , AntCrown_Org   )
	AddToPartition( DamnGay , 0 )
	SetPlot( DamnGay ,"dead" , "LuaQ_422888_Dead" , 0 )
	SetDefIdleMotion( DamnGay ,ruFUSION_MIME_CROUCH_LOOP)
	AddBuff( DamnGay , 504113 , 0 , 60000 )
	for i = 1 , 300 , 1 do
		if CheckID( DamnGay ) == false then
			break
		end
		sleep( 10 )
	end
	Show( OwnerID() , 0 )
	if CheckID( DamnGay ) == true then
		Delobj( DamnGay )
		Yell( OwnerID() , "[SC_422888_2]" , 3 ) --藉由那一位的幫助，我......還能再壓抑變化一陣子.....
		sleep( 20 )
		Yell( OwnerID()  , "[SC_422888_3]" , 3 )--不過我無法維持太久的清醒，請儘快回來......
	end
	DisableQuest( OwnerID() , false )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
end

function LuaQ_422888_Dead()
	for i = 1 , HateListCount( OwnerID() ) , 1 do
		local ID = HateListInfo(OwnerID() ,i-1 , EM_HateListInfoType_GItemID )
		if CheckAcceptQuest( ID , 422888 ) == true and CountBodyItem(ID , 206448 ) < 1 then
			GiveBodyItem( ID , 206448 , 1 )
		end
	end
	Lua_CancelAllBuff( OwnerID() ) 
	SetStopAttack( OwnerID() )
	SetRoleCamp( OwnerID() , "Visitor" )
	BeginPlot( OwnerID() , "LuaQ_422888_Play_2" , 0 )
	return false
end

function LuaQ_422888_Play_2()
	local EffectBall= LuaFunc_CreateObjByObj(112399, OwnerID() )
	WriteRoleValue( EffectBall , EM_RoleValue_LiveTime , 5 )
	Lua_ObjDontTouch( EffectBall  ) 	
	CastSpell( EffectBall , EffectBall , 494222 )
--	PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_REVIVING )
	PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_DYING )
	sleep( 30 )
	Delobj( OwnerID() )
end

function LuaQ_422888_Complete()
	if ReadRoleValue( OwnerID() ,  EM_RoleValue_Register ) > 0 then
		return
	end
	DisableQuest( OwnerID() , true )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 777 )
	MoveToFlagEnabled( OwnerID() , false )
	Hide( OwnerID() )
	WriteRoleValue( OwnerID()  , EM_RoleValue_IsWalk , 1 )
	Show( OwnerID() , 0 )
	local RuffleDick = LuaFunc_SearchNPCbyOrgID( OwnerID(), 114168, 150 )
	local R_Dir = ReadRoleValue( RuffleDick , EM_RoleValue_Dir )
	local A_Dir = ReadRoleValue(OwnerID(), EM_RoleValue_Dir )

	Yell( RuffleDick , "[SC_422888_4]" , 3 ) --我是不是從頭到尾都沒有做對過……
	PlayMotion( RuffleDick ,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep( 10 )
	AdjustFaceDir( OwnerID(), RuffleDick ,  0 ) 
	sleep( 20 )
	Yell( OwnerID(), "[SC_422888_5]" , 3 ) --因為你從未正視你所擁有的與自然同步之心。
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
	sleep( 30 )
	Yell( OwnerID(), "[SC_422888_6]" , 3 ) --但，我仍要將達馬蓋守護的物品交給你。
	FaceObj( OwnerID() , RuffleDick )
	sleep( 20 )
	PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_POINT )
	Yell( RuffleDick , "[SC_422888_7]" , 3 ) --給我？
	AdjustFaceDir(  RuffleDick ,OwnerID(),  0 ) 
	sleep( 5 )
	PlayMotion( RuffleDick ,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep( 15 )	
	LuaFunc_MoveToFlag( OwnerID(), 780518, 20 ,0 )
	sleep( 5 )
	AdjustFaceDir( OwnerID(), RuffleDick ,  0 ) 	
	sleep( 10 )
	Yell( OwnerID(), "[SC_422888_8]" , 3 ) --聆聽靈魂的讚美歌，正視精靈之傲，你才能真正破蛹而出。
	PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_APPROVAL)
	sleep( 30 )
	SetDir( OwnerID() , A_Dir)
	SetDir( RuffleDick , R_Dir )
	sleep( 5 )
	MoveToFlagEnabled( OwnerID() , true )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
	DisableQuest( OwnerID() , false )
end