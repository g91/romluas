---------------------------------- 任務 422522生命垂危！ ---------------------------------------------
function LuaI_205426_Check()

	if CheckBuff( OwnerID() , 503968 ) == true then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_205426_0]" , 0 ) --你已經擁有波多的外型了
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_205426_0]" , 0 ) 
		return false
	end

	if ReadRoleValue( OwnerID() , EM_RoleValue_IsAttackMode ) ~= 0 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_205426_1]" , 0 ) --你正在戰鬥！
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_205426_1]" , 0 ) 
		return false
	end

	local X = ReadRoleValue( OwnerID() , EM_RoleValue_X )
	local Y = ReadRoleValue( OwnerID() , EM_RoleValue_Y )
	local Z = ReadRoleValue( OwnerID() , EM_RoleValue_Z )

	if X > 900 or X < -2170 or Z >23800 or Z< 22300 or Lua_ExGetZone( OwnerID()) ~= 8 or Y < 150 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_205426_2]" , 0 ) --必須在[ZONE_BODO OF FIRE]中使用
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_205426_2]" , 0 ) 
		return false
	end

	return true
end

function LuaI_503969and503971_CancelRide() --解除騎乘
	local BuffType = 0 
	local Count = BuffCount ( OwnerID())
	for i = 1 , Count do
		local BuffID = BuffInfo ( OwnerID() , Count-i , EM_BuffInfoType_BuffID )
		if GameObjInfo_int ( BuffID , "AssistType" ) == 55 then
			BuffType = GameObjInfo_int ( BuffID , "AssistType" )
			CancelBuff( OwnerID() , BuffID ) 
		end
	end
	return true
end

function LuaM_503969_0() --波多幻象偵測地點
	local X = ReadRoleValue( OwnerID() , EM_RoleValue_X )
	local Y = ReadRoleValue( OwnerID() , EM_RoleValue_Y )
	local Z = ReadRoleValue( OwnerID() , EM_RoleValue_Z )
	if X > 900 or X < -2170 or Z >23800 or Z< 22300 or Lua_ExGetZone(OwnerID()) ~= 8 or Y < 150 then
--		if X > 900 then Say( OwnerID() , " X too much ") end
--		if X < -2150 then Say( OwnerID() , " X too low ") end
--		if Z >23800 then Say( OwnerID() , " Z too much ") end
--		if Z< 22300 then Say( OwnerID() , " Z too low ") end
--		if ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID ) ~= 8 then Say( OwnerID() , "Wrong Zone") end
--		if  Y < 150  then Say( OwnerID() , " Y too low ") end
		CancelBuff_NoEvent( OwnerID() , 503968 )
	end
end

function LuaS_113218_0()	
	if CheckBuff( OwnerID() , 503968 ) == true or CheckCompleteQuest( OwnerID() , 422522 ) == true then
		LoadQuestOption(OwnerID())
		if CheckAcceptQuest( OwnerID() , 422523 ) == true and CheckFlag( OwnerID() , 542894 ) == false then
--		if CheckFlag( OwnerID() , 542894 ) == false then
			AddSpeakOption( OwnerID(), TargetID( ),"[SC_422523_0]" ,"LuaS_422523_1", 0 ) --嘩追薩滿說變身成波多模樣，你才不會一見到我就攻擊。
		end
	else
		SetSpeakDetail( OwnerID(),  "[SC_113218_0]" ) --外來者？離開吧！在我動手之前！看看這些生病的波多，不懂嗎？是你們人類的錯啊！

	end
end

--------------------任務 422523 自白機會--------------------------------------------------------------------------

function LuaS_422523_1()
	SetSpeakDetail( OwnerID(),  "[SC_422523_1]" ) --連嘩追薩滿的名字都搬出來用？那麼，他有跟你說如何證明？
	AddSpeakOption( OwnerID(), TargetID( ),"[SC_422523_2]" ,"LuaS_422523_2", 0 ) --.......沒有。
end

function LuaS_422523_2()
	CloseSpeak( OwnerID() )
	DisableQuest( TargetID() , true )
	BeginPlot( TargetID() , "LuaS_422523_3" , 0 ) 
end

function LuaS_422523_3()
	local Player = TargetID()
	local Dir  = ReadRoleValue( OwnerID() , EM_RoleValue_Dir )
	Yell( OwnerID() , "[SC_422523_3]" , 3 ) --又是一個騙子！
	if CheckID( Player ) == true then
		AdjustFaceDir( OwnerID(),  Player  , 0 ) 
		sleep( 5 )
		CastSpell( OwnerID() , Player , 493632 )
		sleep( 30 )
		AddBuff( Player , 	503972 , 1 , 3 )
	end
		sleep( 15 )
	Yell( OwnerID() , "[SC_422523_4]" , 3 ) --什麼！
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_BUFF_INSTANT )
	sleep( 50 )
	Yell( OwnerID() , "[SC_422523_5]" , 3 ) --嘩追薩滿竟然......
	if CheckAcceptQuest( player , 422523 ) == true then
		SetFlag( player , 542894 , 1 )
	end
	sleep( 20 )
	SetDir( OwnerID() , Dir )
	sleep( 10 )
	DisableQuest( OwnerID() , false )
end

------------------任務 422526他們沒權利這麼做 ---------------------------------------------------

function LuaS_113219_0()	
	LoadQuestOption(OwnerID())
	if CountBodyItem( OwnerID() ,205528) > 0 and CheckAcceptQuest( OwnerID() , 422526 ) == true then
--	if CountBodyItem( OwnerID() ,205528) > 0 then
		AddSpeakOption( OwnerID(), TargetID( ),"[SC_422526_0]" ,"LuaS_422526_1", 0 ) --給他[205528]
	end
end

function LuaS_422526_1()
	CloseSpeak( OwnerID() )
	if CountBodyItem( OwnerID() ,205528) > 0 then
		DelBodyItem(  OwnerID() ,205528 , 1 )
		DisableQuest( TargetID() , true )
		BeginPlot( TargetID() , "LuaS_422526_2" , 0 )
	end
end

function LuaS_422526_2()
	local Ball = Lua_CreateObjByDir( OwnerID()  , 112307 , 1 , 0 ) 
	local Bodo = Lua_CreateObjByDir( TargetID()  , 113220 , 0, 0 ) 
	Lua_ObjDontTouch( Ball ) 
	AddToPartition( Ball , 0 )
	CastSpell( Ball  , Ball , 491276 )
	sleep( 25 )
	Hide( OwnerID() )
	sleep( 5 )
	Show( Bodo , 0 )
	sleep( 15 )
	Delobj( ball )
	WriteRoleValue( bodo , EM_RoleValue_isWalk , 0 )
	MoveToFlagEnabled( Bodo , false )
	AdjustFaceDir( Bodo , TargetID()  , 0 ) 
	sleep( 5 )
	if DW_Rand( 50 ) > 25 then
		PlayMotion( Bodo , ruFUSION_ACTORSTATE_EMOTE_IDLE0 )
	else
		PlayMotion( Bodo , ruFUSION_ACTORSTATE_EMOTE_IDLE1 )
	end
	Yell( Bodo , "[SC_422526_1]" , 3 ) --你救了好波多！好波多高興！
	if  CheckAcceptQuest( TargetID() , 422526 ) == true and CountBodyItem(TargetID() , 205529 )< 10  then
--	if  CountBodyItem(TargetID() , 205529 )< 10  then
		GiveBodyItem( TargetID() , 205529 , 1 )
		ScriptMessage( TargetID() , TargetID() , 1 , "[SC_422526_2]" , 0 ) --你從[113220]那裡獲得了一個[205529]
		ScriptMessage( TargetID() , TargetID() , 0 , "[SC_422526_2]" , 0 ) 
	end
	sleep( 30 )
	Move( Bodo , -1192 , 221 , 23127 )
	sleep( 50 )
	Delobj( Bodo )
	sleep( 170 )
	Show( OwnerID() , 0 )
	DisableQuest( OwnerID() , false)

end

-------------------------------- 422527 可疑閃光 -------------------------------------

function LuaQ_422527_Complete()
	DisableQuest( OwnerID() , true )
	AddBuff( OwnerID() , 503974 , 1 , 3 )
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_HURT_NORMAL )
	sleep( 30 )
	DisableQuest( OwnerID() , false )	
end

-------------------------------- 422528準備進入礦坑  -------------------------------------

function LuaS_113313()  --沙奇司
		LoadQuestOption(OwnerID())
	if	(CheckAcceptQuest(OwnerID(),422528)== true )	and	( CheckCompleteQuest( OwnerID(),422528)== false) 	and	CountBodyItem( OwnerID(), 205535 )<1	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_113313_0]","LuaS_113313_1",0) 	--小金箍不見了...
	end
end

function LuaS_113313_1()
	SetSpeakDetail(OwnerID(),"[SC_113313_1]")		--嗯，我正在想你也該來找我了。牠被其他波多帶回來。					
	GiveBodyItem( OwnerID(), 205535, 1 )
end

function LuaS_113313_2()
	if	CountBodyItem( TargetID(), 205535 )<1	then
		GiveBodyItem( TargetID(), 205535, 1 )
	end
end

function LuaI_205535_Check()
	if ReadRoleValue( OwnerID() , EM_RoleValue_IsAttackMode ) ~= 0 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_205535_0]" , 0 ) --你正在戰鬥
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_205535_0]" , 0 ) 
		return false
	end
	if CheckBuff( OwnerID() , 503975 ) == true then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_205535_1]" , 0 ) --你已經把[113221]召喚出來了
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_205535_1]" , 0 ) 
		return false
	end
	if Lua_ExGetZone( OwnerID())  ~= 8 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_205535_2]" , 0 ) --你只能在[ZONE_SAVAGE LANDS]使用此物品
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_205535_2]" , 0 ) 
		return false
	end
	return true
end

function LuaI_205535_Use()
	local Ball = Lua_CreateObjByDir( OwnerID()  , 113221, 25 , 0 ) 
	local DBID = ReadRoleValue(OwnerID(),EM_RoleValue_DBID)
	AddToPartition( Ball , 0 )
	AddBuff( OwnerID() , 503975 , 1 , -1 )
	BeginPlot( Ball , "LuaI_113221_0" , 0 )
	WriteRoleValue( Ball , EM_RoleValue_PID , OwnerID() )
	WriteRoleValue( Ball , EM_RoleValue_Register , DBID )
end

function LuaI_113221_0()
	local Player = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local DBID = ReadRoleValue( OwnerID() , EM_RoleValue_Register )
	CastSpell( OwnerID() , OwnerID() , 493776 )
	SetFollow( OwnerID() ,Player )
	for i = 0 , 36  , 1 do
		if CheckID( Player  ) == false or ReadRoleValue( Player , EM_RoleValue_DBID ) ~= DBID then
			break
		end
		if ReadRoleValue( Player , EM_RoleValue_IsDead ) == 1 or CheckBuff( Player , 503975) == false then
			break
		end
		sleep( 50 )
	end
	if CheckID( Player ) == true and CheckBuff( Player  , 503975) == true and ReadRoleValue( Player , EM_RoleValue_DBID ) == DBID then
		CancelBuff_NoEvent( TargetID() , 503975 )
	end
	CastSpell( OwnerID() , OwnerID() , 493776  )
	sleep( 15 )
	DelObj( OwnerID() )
end

function LuaS_113221_0()

	local Player = ReadRoleValue(TargetID() , EM_RoleValue_PID )
	local DBID = ReadRoleValue( TargetID() , EM_RoleValue_Register )

	if OwnerID() ~= Player or ReadRoleValue(OwnerID(),EM_RoleValue_DBID) ~= DBID then
		SetSpeakDetail( OwnerID(),  "[SC_113221_0]" ) --你誰啊？我認識你嗎？
	else
		LoadQuestOption(OwnerID())
		if CheckAcceptQuest( OwnerID() , 422529 ) == true or  (CheckCompleteQuest( OwnerID() , 422529 ) == true and  CheckAcceptQuest( OwnerID() , 422528 ) == false) then
			AddSpeakOption( OwnerID(), TargetID( ),"[SC_422529_0]" ,"LuaS_422529_1", 0 ) --......「請問」變身藥水需要什麼材料......
		end

		if (CheckAcceptQuest(OwnerID(),422528)== true )and( CheckCompleteQuest( OwnerID(),422530)== true) 	and	CountBodyItem( OwnerID(), 205657 )<1	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422528_0]","LuaS_422528_1",0) 	--你還有神奇變身泥？
		end
	end
end

function LuaS_422529_1()
	SetSpeakDetail( OwnerID(),  "[SC_422529_1]" ) --關鍵的三種材料！.....（以下略）
	if CheckAcceptQuest( OwnerID() , 422529 ) == true and CheckFlag( OwnerID() , 542895 ) == false then
--	if CheckFlag( OwnerID() , 542895 ) == false then
		SetFlag( OwnerID() ,  542895  , 1 )
	end
end


function LuaS_422528_1()
	SetSpeakDetail(OwnerID(),"[SC_422528_1]")	--有多做一些，我本來要偷偷留給主人的！藏起來也被你發現？					
	if	CountBodyItem( OwnerID(), 205657 )<1	then
		GiveBodyItem( OwnerID(), 205657, 1 )
	end
end



------------------------------422532大河魚怪插過碎肉的利牙-----

function LuaI_422532_ItemUse()
	BeginPlot( OwnerID() ,  "LuaI_422532_ItemUse_2" , 0 )
end

function LuaI_422532_ItemUse_2()
	if CountBodyItem( OwnerID() , 205538 ) == 0 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422532_0]" , 0 ) --缺少[205538]
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422532_0]"  , 0 ) 
	elseif CountBodyItem( OwnerID() , 205537 ) == 0 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422532_1]" , 0 ) --缺少[205537]
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422532_1]"  , 0 ) 
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422532_2]" , 0 ) --你將[205538]穿過[205537]
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422532_2]"  , 0 ) 
		DelBodyItem( OwnerID() , 205537 , 1 )
		DelBodyItem( OwnerID() , 205538 , 1 )
		GiveBodyItem( OwnerID() , 205539 , 1 )
	end
end

--------------------------------422533原生拉扣獸的眼淚-------------------------

function LuaM_493633_Check()
	if ReadRoleValue( TargetID() , EM_RoleValue_IsDead ) == 1 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422533_0]" , 0 ) --你不能用[205536]來弔唁死者
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422533_0]"  , 0 ) 
		return false
	end
	if ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) ~= 102252 then
		local Name = GetName( TargetID() )
		local Str = "[SC_422533_1][$SETVAR1="..Name.."]"
		ScriptMessage( OwnerID() , OwnerID() , 1 , Str  , 0 ) --[$VAR1]並不想聽這篇故事
		ScriptMessage( OwnerID() , OwnerID() , 0 , Str  , 0 ) 
		return false
	end
	if CheckAcceptQuest( OwnerID() , 422533 ) == false then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422533_2]" , 0 ) --你目前並不需要這麼做
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422533_2]"  , 0 ) 
		return false
	end
	if  HateListCount(  TargetID() ) > 0 and CheckRelation( TargetID() , OwnerID()  , EM_CheckRelationType_InHateList ) == false then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422533_3]" , 0 ) --[102252]完全沒有注意到你
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422533_3]"  , 0 ) 
		return false
	end
	if CountBodyItem( OwnerID() , 205540 ) > 0 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422533_4]" , 0 ) --你已經取得了[205540]
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422533_4]" , 0 ) 
		return false
	end
	return true
end

function LuaM_503976_0()
	if ReadRoleValue( OwnerID() , EM_RoleValue_IsDead ) == 0 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422533_5]" , 0 ) --[102252]凶猛地嘶吼著
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422533_5]" , 0 ) 
		if HateListCount( TargetID() ) == 0 then
			SetAttack( TargetID() , OwnerID() )
		end
		if DW_Rand( 200 ) > 100 and ReadRoleValue( TargetID() , EM_RoleValue_Register ) > 1 then
			WriteRoleValue( TargetID() , EM_RoleValue_Register , 0 )
			BeginPlot( TargetID() , "LuaM_503976_1" , 2)
		else
			local Count = ReadRoleValue( TargetID() , EM_RoleValue_Register ) +1
			WriteRoleValue( TargetID() , EM_RoleValue_Register , Count )
		end
	end
end

function LuaM_503976_1()
	if CountBodyItem( TargetID() , 205536 ) > 0 then
		ScriptMessage( TargetID()  , TargetID() , 2 , "[SC_422533_6]" , 0 ) --你不耐煩地將[205536]狠狠地砸向[102252]
		ScriptMessage( TargetID() , TargetID()  , 0 , "[SC_422533_6]" , 0 ) 
		DelBodyItem( TargetID() , 205536 , 1 )
		GiveBodyItem( TargetID()  , 205540 , 1 )
		CastSpell( TargetID() , OwnerID() , 493155 )
		AddBuff( OwnerID() , 501036 , 1 , 3 )
	end
end

function LuaI_102252_0() --放在 102252 原生拉扣獸身上的初始劇情
	while 1 do
		if HateListCount( OwnerID() ) == 0 and ReadRoleValue(OwnerID() , EM_RoleValue_Register ) > 0 then
			WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0) 
		end
		sleep(10)
	end
end
---------------------------------- 422535探索哥布林礦坑 ------------------------------------------------------

function LuaM_503971_Back()
	local X = ReadRoleValue( OwnerID() , EM_RoleValue_X )
	local Y = ReadRoleValue( OwnerID() , EM_RoleValue_Y )
	local Z = ReadRoleValue( OwnerID() , EM_RoleValue_Z )
	if X > 1155 or X < -1345 or Z >29850 or Z< 27660 or Lua_ExGetZone(OwnerID()) ~= 8 or Y > 220  then
		CancelBuff_NoEvent( OwnerID() , 503970 )
	end
end

function LuaS_113302_0()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 422535) == true and CheckFlag( OwnerID() , 542897 ) == false then
--	if CheckFlag( OwnerID() , 542897 ) == false then
		AddSpeakOption( OwnerID(), TargetID( ),"[SC_422535_0]" ,"LuaS_113302_1", 0 )  --我準備出發了 
	end
end

function LuaI_422535_0()	--範圍
	SetPlot( OwnerID() , "range" , "LuaI_422535_1" , 50 )
end

function LuaI_422535_1()
	if CheckBuff( OwnerID() , 503970 ) == false then
		SetPosByFlag( OwnerID(), 780394 , 1)
	end
end

function LuaM_503971_0()
	SetPosByFlag( OwnerID(), 780394 , 1)
end

function LuaS_113302_1()
	CloseSpeak( OwnerID() )
	DisableQuest( TargetID(), true )
	SetPlot( TargetID(), "touch" , "LuaI_113302_3" , 30 )
	BeginPlot( TargetID() , "LuaI_113302_2" , 0 )
end

function LuaI_113302_2()
	local Bodo = CreateObjByFlag( 113222, 780394 , 3 , 1 )
	AddToPartition( Bodo , 0)
	PlayMotionEX( Bodo , ruFUSION_ACTORSTATE_DYING,ruFUSION_ACTORSTATE_DEAD)
	Yell( OwnerID() , "[SC_422535_6]" , 3 ) --聽[113302]的話，裝成紅皮傢伙去別亂動，否則你就會不像紅皮傢伙。
	PlayMotion(  OwnerID()  , ruFUSION_ACTORSTATE_BUFF_SP01)	
	sleep( 20 )
	local player = TargetID()
	SetPosByFlag( player  , 780394 , 2 )
	AddBuff( player  , 503970 , 1 , 60 )
	AddBuff( player  , 503977 , 1 , 60 )
	ScriptMessage(  player , player, 2 , "[SC_422535_7]" , 0 ) --你成功地潛入了礦坑的深處，並找到了被囚禁的[113222]
	ScriptMessage(  player , player, 0 , "[SC_422535_7]" , 0 ) 
	local NagaGuard = CreateObjByFlag( 102207 , 780394 , 4 , 1 )
	WriteRoleValue(NagaGuard , EM_RoleValue_IsWalk, 1 )
	SetRoleCamp(  NagaGuard , "Visitor" )
	AddToPartition( NagaGuard , 0 )
	MoveToFlagEnabled( NagaGuard  , false )
	DW_MoveToFlag( NagaGuard , 780394 , 5, 0 )
	local Goblin = CreateObjByFlag( 102213 , 780394 , 4, 1 )
--	WriteRoleValue( Goblin , EM_RoleValue_LiveTime , 60 )
	WriteRoleValue(Goblin  , EM_RoleValue_IsWalk, 1 )
	SetRoleCamp(  Goblin , "Visitor" )
	AddToPartition( Goblin , 0 )
	MoveToFlagEnabled( Goblin  , false )
	SetFollow( Goblin , NagaGuard )
	DW_MoveToFlag( NagaGuard , 780394 , 6, 0 )
	SetFightMode( Goblin , 0 , 0 , 0 , 0)
	sleep( 10)
	AdjustFaceDir( NagaGuard ,Goblin , 0 ) 
	sleep( 5 )
	Yell( NagaGuard , "[SC_422535_1]" , 3 ) --讓波多逃走......你們說誰該負責？
	PlayMotion(NagaGuard , ruFUSION_ACTORSTATE_EMOTE_IDLE0 )
	sleep( 30 )
	SetFightMode( Goblin , 0 , 1 , 0 , 0)
	AdjustFaceDir( NagaGuard , Bodo , 0 ) 
	sleep( 5 )
	PlayMotion( NagaGuard, ruFUSION_ACTORSTATE_ATTACK_1H )
	sleep(20)
	local X =GetMoveFlagValue( 780394 , 7, EM_RoleValue_X )
	local Y =GetMoveFlagValue( 780394 , 7 , EM_RoleValue_Y )
	local Z =GetMoveFlagValue( 780394 , 7 , EM_RoleValue_Z )
	local Dir =GetMoveFlagValue( 780394 , 7 , EM_RoleValue_Dir )
	local Weapon = CreateObj( 113217, X , Y+ 10 , Z , Dir , 1)
	Lua_ObjDontTouch( Weapon ) 
	SetModeEX( Weapon , EM_SetModeType_Gravity , false )
	AddToPartition( Weapon , 0 )
	AddBuff( Bodo  , 503974 , 1 , 60 )
	sleep( 10 )
	Yell( NagaGuard , "[SC_422535_2]" , 3 ) --好好做事......如果下場不想跟他一樣的話......
	PlayMotion(NagaGuard , ruFUSION_ACTORSTATE_EMOTE_IDLE1 )
	sleep( 20 )
	BeginPlot( Goblin , "LuaI_113222_3" , 0 )
	DW_MoveToFlag( NagaGuard ,780394 , 4  , 0 )
	Delobj( NagaGuard )
	sleep( 10 )
	Delobj( Goblin )
	sleep( 20 )
	if CheckID(player) then
		ScriptMessage(  player , player, 2 , "[SC_422535_4]" , 0 ) --你最好趕快把這邊發生的事情回報給[113302]
		ScriptMessage(  player , player, 0 , "[SC_422535_4]" , 0 ) 
		if CheckAcceptQuest( player , 422535) == true then
			SetFlag( player , 542897  , 1 )
		end
		CancelBuff_NoEvent( player  , 503977 )
		CancelBuff( player  , 503970 )
	end
	DelObj( Weapon )
	DelObj( Bodo )
	DisableQuest( OwnerID() , false )
	SetPlot( OwnerID() , "touch" , "" , 0 )
end

function LuaI_113222_3()
	sleep( 20 )
	Yell( OwnerID() , "[SC_422535_3]" , 3 ) --是、是！我們會好好看顧剩下的波多！
	Yell( OwnerID() , "[SC_422535_8]" , 3 ) --你！杵在這裡做什麼？還不快去工作！
end
function LuaI_113302_3()
	Yell( TargetID() , "[SC_422535_5]" , 3 ) --[113302]的朋友正在冒險幫[113302]調查，[113302]要等朋友回來。
end

------------------------------------422536 轟掉他們的腦袋！--------------

function LuaI_205552_Check()

	if CheckAcceptQuest( OwnerID() , 422536 ) == false then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422536_0]" , 0 ) --你目前不需要使用這顆炸彈
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422536_0]" , 0 ) 
		return false
	end

	return true
end


function LuaM_503978_0()
--	Say( OwnerID() , "Bomb Come !" )
	local Me = Role:new( OwnerID() )
	local Bomb = CreateObj( 113229 , Me:X() , Me:Y() , Me:Z() , Me:Dir() , 1 )
	SetModeEX( Bomb , EM_SetModeType_Searchenemy , false )
	SetModeEX( Bomb , EM_SetModeType_Fight , false )
	SetModeEX( Bomb , EM_SetModeType_Strikback	 , false )
	SetModeEX( Bomb , EM_SetModeType_Move  , false )
	Lua_ObjDontTouch( Bomb ) 
	WriteRoleValue( Bomb , EM_RoleValue_LiveTime , 20 )
	AddToPartition( Bomb , 0 )
	BeginPlot( Bomb , "LuaM_503978_1" , 0 )
end

function LuaM_503978_1()
	for i = 1 , 5 , 1 do
		sleep( 10 )
--		Say( OwnerID() , 5-i )
	end
	CastSpell( OwnerID() , OwnerID() , 493635 )
end

function LuaM_503979_0()
	Hide( OwnerID() )
	local GoblinTable = {102211,102212,102213,102214}
	local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) 
	for pry , obj in pairs( GoblinTable ) do
		if OrgID == obj and ReadRoleValue( TargetID() , EM_RoleValue_IsDead ) ~= 1 then
			Hide( TargetID() )
			local Goblin = CreateObjByObj( 113228 , TargetID() )
			WriteRoleValue( Goblin , EM_RoleValue_LiveTime , 60 )
			PlayMotionEX(  Goblin  , ruFUSION_ACTORSTATE_DYING,ruFUSION_ACTORSTATE_DEAD)
			BeginPlot( TargetID() , "LuaM_503979_1" , 0 )	
			break
		end
	end

end

function LuaM_503979_1()
	LuaFunc_ResetObj( OwnerID() ) 
end
---------------------------------- 422542燃盡罪孽 -------------------
function LuaS_113231_0()
	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),422541)==true )and( Checkflag( OwnerID() , 542946) == false)then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422541_0]","LuaS_422541_1",0) --
	end

	if CheckAcceptQuest( OwnerID() , 422542 ) == true and CheckFlag( OwnerID() , 542901 ) == false then
--	if CheckFlag( OwnerID() , 542901 ) == false then
		AddSpeakOption( OwnerID(), TargetID( ),"[SC_422542_0]" ,"LuaS_422542_1", 0 ) --......我要動手了。
	end
end

function LuaS_422542_1()
	CloseSpeak( OwnerID() )
	DisableQuest( TargetID() , true )
	Beginplot( TargetID() , "LuaS_422542_2", 0) 
end

function LuaS_422542_2()
	local Dummy =  LuaFunc_CreateobjByObj( 102339 , OwnerID() )
	local Result = "Fail"
	WriteRoleValue(Dummy , EM_RoleValue_PID , TargetID() )
	SetPlot( Dummy , "dead" , "LuaS_422542_dead" , 0 )
	Hide( OwnerID() )
	AddBuff( Dummy , 502550 , 180 , 180 )
	AddBuff( Dummy , 502707 , 1 , -1 )
	for i = 1 , 30 , 1 do
		if CheckID( Dummy ) == false or ReadRoleValue( Dummy , EM_RoleValue_OrgID ) ~= 102339 then
			Result = "Success"
			break
		end
		sleep( 60 )
	end
	if Result == "Fail" and ReadRoleValue( Dummy , EM_RoleValue_PID ) ~= 0 then
		Yell( Dummy , "[SC_422542_2]" , 3) --你沒辦法下手嗎......唉......
		Delobj( Dummy )
	end
	Show( OwnerID() , 0 )
	DisableQuest( OwnerID()  , false)
end

function LuaS_422542_dead()
	SetFightMode( OwnerID() , 0 , 0 , 0, 0 )
	Lua_CancelAllBuff( OwnerID() ) 
	SetStopAttack(OwnerID() )
	Yell( OwnerID() , "[SC_422542_1]" , 3) --希望[113231]的罪孽能伴隨著死亡滌淨......
	PlayMotionEX( OwnerID() , ruFUSION_ACTORSTATE_DYING,ruFUSION_ACTORSTATE_DEAD)
	BeginPlot( OwnerID() , "LuaS_422542_dead2" , 0 )
	return false
end

function LuaS_422542_dead2()
	local Bodo = CreateObjByFlag( 113232 , 780395 , 1 , 1 )
	local Player = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0)
	WriteRoleValue( Bodo , EM_RoleValue_IsWalk , 0 )
	AddToPartition( Bodo , 0 )
	PlayMotion( Bodo , ruFUSION_ACTORSTATE_BUFF_INSTANT )
	Yell( Bodo , "[SC_422542_3]" , 3)
	sleep( 20 )
	DW_MoveToFlag( Bodo ,780395 , 2  , 0 )
	AdjustFaceDir( Bodo , OwnerID(), 0 ) 	
	sleep( 10 )
	Delobj( Bodo )
	if CheckAcceptQuest( Player  , 422542 ) == true then
		SetFlag( Player , 542901 , 1 )
	end
	Delobj( OwnerID() )
end


--------------------------------------------------------

function LuaS_422541_1()  
	SetSpeakDetail(OwnerID(),"[SC_422541_1]")
	SetFlag(OwnerID() ,542946, 1 )
end

------------------------------------------------------------

function LuaS_422539_0()
	if (CheckAcceptQuest(OwnerID(),422539)==true )and( Checkflag( OwnerID() , 542939) == false)then
	CastSpell( OwnerID(), OwnerID(), 493775 )
	sleep(10)
	SetFlag(OwnerID() , 542939, 1 )
	End

end

----------------------------------------------------------
function LuaS_113238_0()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() ,422542 ) == false and CheckCompleteQuest( OwnerID() ,422542 ) == false and CheckFalg( OwnerID() , 542901) == true then
		SetFlag( OwnerID() , 542901, 0 )
	end
end





