function LuaS_423491_0()----
	if	CheckAcceptQuest( OwnerID() , 423491) == true  and CountBodyItem( OwnerID() ,208100 )>=5 and  (CheckFlag(OwnerID(),544340)==false) then
			if	ReadRoleValue( TargetID() , EM_RoleValue_Register1  ) >0 then
				LoadQuestOption( OwnerID() )
				AddSpeakOption(OwnerID(),TargetID()," [SC_423491_0]","LuaS_423491_1",0)---讓[116183]喝下[208100]。
			end
			if	ReadRoleValue( TargetID() , EM_RoleValue_Register1  ) == 0 then
				LoadQuestOption( OwnerID() )
				AddSpeakOption(OwnerID(),TargetID()," [SC_423491_0]","LuaS_423491_2",0)---讓[116183]喝下[208100]。
			end				
	elseif	CheckAcceptQuest( OwnerID() , 423491) == true  and CountBodyItem( OwnerID() ,208100 )<5   and  (CheckFlag(OwnerID(),544340)==false) then
		SetSpeakDetail(OwnerID(),"[SC_423491_3]")---(或許你該先取回5顆[<S>208100]，再轉送給[116183]喝下。)
	else	LoadQuestOption( OwnerID() )
	end
	
end
function LuaS_423491_1()----
   SetSpeakDetail(OwnerID(),"[SC_423491_2]")---這是什麼？水嗎？但是我還不渴，所以我不想喝，你要不要先喝呢？
 end
function LuaS_423491_2()----	
	CloseSpeak( OwnerID() )
	if CountBodyItem( OwnerID() ,208100 )>=5 and ReadRoleValue( TargetID() , EM_RoleValue_Register1  ) == 0 then
		DelBodyItem( OwnerID() , 208100 , 5)
		WriteRoleValue( TargetID(), EM_RoleValue_Register1 ,1) 
		BeginPlot( TargetID() , "LuaS_423491_3" , 0)
	end
end
function LuaS_423491_3()----BUFF507503 AddBuff(OwnerID(),507503,1,50)  FLAG--780698
	local KK = Lua_DW_CreateObj("flag" ,116187,780804,1,0 )---種出一個掌控全部的NPC的魔王。
	Lua_ObjDontTouch( KK )
	AddToPartition(KK , 0 )
	DisableQuest( KK ,true )
	WriteRoleValue( KK, EM_RoleValue_Register2 ,TargetID())---把玩家寫到裡頭
	BeginPlot( KK , "LuaS_423491_4" , 0 )
	while true do
		sleep(10)
			if 	CheckID( KK)== false  then
					WriteRoleValue( OwnerID() , EM_RoleValue_Register1 ,0) 
			break
		end
	end
end

function LuaS_423491_4()---CK 是康葛斯116184 LB是勞勃116185 MORK 是摩瑞克116186  	AddToPartition( MT , 0 )
	local player = ReadRoleValue(OwnerID(),EM_RoleValue_Register2)--
	AddBuff(player,507503,1,60)
	local CK = Lua_DW_CreateObj("flag" ,116184,780804,2,1)---
	local LB= Lua_DW_CreateObj("flag" ,116185,780804,3 ,1)---
	local MORK= Lua_DW_CreateObj("flag" ,116186,780804,5 ,0)---
	SetModeEx(MORK,EM_SetModeType_Gravity,false) 
	WriteRoleValue(MORK,EM_RoleValue_Y,850)	
	MoveToFlagEnabled(MORK, false)
	DisableQuest( CK ,true )
	DisableQuest( MORK ,true )
	DisableQuest( LB ,true )
	WriteRoleValue(OwnerID() , EM_RoleValue_Register3 ,CK) 
	WriteRoleValue(OwnerID() , EM_RoleValue_Register4 ,LB) 
	WriteRoleValue(OwnerID() , EM_RoleValue_Register5 ,MORK) 
	BeginPlot(  OwnerID(), "LuaS_423491_5" , 0 )
	Say(LB,"[SC_423491_1]")---好奇怪的感覺...心情.....
PlayMotion(LB,  ruFUSION_ACTORSTATE_EMOTE_SPEAK   )
	sleep(30)
PlayMotion(CK, ruFUSION_ACTORSTATE_EMOTE_APPLAUSE)
	Say(CK,"[SC_423491_4]")----呼～總算平靜下來了，沒有再發出奇怪頻率的聲音。
	AddToPartition( MORK,0)   
	AddBuff(MORK,506984,1,60)
	AddBuff(MORK,506984,1,60)
	AddBuff(MORK,506984,1,60)
	sleep(20)
------摩瑞克飛下的動作 
	SetDefIdleMotion(MORK, ruFUSION_MIME_RUN_FORWARD )
	MoveDirect( MORK, 5942 , 779.0 , 32656.3 )
	sleep(20)
	PlayMotion(MORK, ruFUSION_MIME_KNOCKDOWN_END  )
	SetDefIdleMotion(MORK, ruFUSION_MIME_IDLE_STAND     )---常時間的形態
	sleep(30)
----	DW_MoveToFlag(MORK ,780698,4, 0,1)
------勞勃衝向前的動作
	Say(LB,"[SC_423491_5]")----姐姐...姐姐，還好嗎？
	PlayMotion(LB,  ruFUSION_ACTORSTATE_EMOTE_SPEAK   )
	sleep(30)
	Say(MORK,"[SC_423491_6]")-----情況不樂觀，所以我回來想帶你們一同過去。在想想看有沒有治療她的辦法？
	PlayMotion(MORK,  ruFUSION_ACTORSTATE_EMOTE_SPEAK   )
	sleep(40)
	PlayMotion(CK, ruFUSION_ACTORSTATE_EMOTE_APPROVAL )
	Say(CK,"[SC_423491_7]")----------或許我辦得到！我活了這麼久的時間，什麼風浪沒看過？趕快帶我們過去吧！
	sleep(40)
	if 	CheckID( player)== true  and CheckAcceptQuest(  player,423491 ) == true and	CheckBuff(player , 507503 )== true then
		SetFlag(player ,544340, 1 ) 
		CancelBuff( player , 507503)
	end
	delobj(CK)
	delobj(MORK)
	delobj(LB)
	delobj(OwnerID())
end
	
function LuaS_423491_5()--
	local CK = ReadRoleValue(OwnerID(),EM_RoleValue_Register3)--
	local LB = ReadRoleValue(OwnerID(),EM_RoleValue_Register4)--
	local MORK = ReadRoleValue(OwnerID(),EM_RoleValue_Register5)--
	local player = ReadRoleValue(OwnerID(),EM_RoleValue_Register2)--
	for i=1, 60, 1 do
		if 	CheckID( player)== false or (CheckAcceptQuest(player,423491)==false) then
			break
		end
		if	CheckID( player)== true  and CheckAcceptQuest( player , 423491 ) == true	and CheckFlag( player, 544289) == false and GetDistance(  player , OwnerID() ) >250		then
			ScriptMessage( player, player, 1 , "[SC_423349_11]" , 0 ) --超出距離，您沒有完成任務。
			ScriptMessage( player , player, 0 , "[SC_423349_11]" , 0 ) --超出距離，您沒有完成任務。
			break
		end
		sleep(10)
	end
	if CheckID( player)== true then
			CancelBuff( player, 507503)
	end
	if 	CheckID( CK)== true then
			delobj(CK)
	end
	if 	CheckID( LB)== true then
					delobj(LB)
	end
	if 	CheckID( MORK)== true then
			delobj(MORK)
	end
	delobj(OwnerID())
end
--------------------------------------------------------------------------------------------------------------------------------
----------------
-----------------------------------------------------
function LuaS_423492_0()----544341
	LoadQuestOption( OwnerID() )				
	if	CheckAcceptQuest( OwnerID() ,423492 ) == true	then
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_422974_0]" , "LuaS_423492_1", 0 )----偷用別人的字串		
	end
end
function LuaS_423492_1()	
	CloseSpeak( OwnerID() )	
	if	ChangeZone( OwnerID() , 18 , 0 , 13343.3, -38.2 , 49953.9 , 11 )	then	
		SetFlag(OwnerID() , 544342 , 1 )---給看不看得見摩瑞克的分歧旗標
	end
end
----到達後的範圍劇情
function LuaS_423492_2()---115851--544253
 	SetPlot( OwnerID() , "Range" , "LuaS_423492_3" , 300 )
end
function LuaS_423492_3()
	if(CheckAcceptQuest( OwnerID() , 423492 ) == true ) and (CheckFlag(OwnerID(),544341)==false) and (CheckFlag(OwnerID(),544342)==true) then
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423492_0]" , 0 )---
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423492_0]" , 0 )---洞穴傳出了奇怪的聲音，引來摩瑞克的注目。
		sleep(30)
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423492_1]" , 0 )---年輕的嗓音：或許我們該談談這隻半龍人的事？
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423492_1]" , 0 )-- 年輕的嗓音：或許我們該談談這隻半龍人的事？
		sleep(30)
		SetFlag(OwnerID() ,544341, 1 )--
	end
end
---------------------------------------------------------------
---------------------------------------------------------------
function LuaS_423493_0()----
	LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest( OwnerID() , 423493) == true  and (CheckFlag(OwnerID(),544340)==false) then
			if	ReadRoleValue( TargetID() , EM_RoleValue_Register1  ) >0 then
				AddSpeakOption(OwnerID(),TargetID()," [SC_423493_0]","LuaS_423493_1",0)---嗯...我知道了。
			end
			if	ReadRoleValue( TargetID() , EM_RoleValue_Register1  ) == 0 then
				AddSpeakOption(OwnerID(),TargetID()," [SC_423493_0]","LuaS_423493_2",0)---嗯...我知道了。
			end				
	end	
end
function LuaS_423493_1()----
 	SetSpeakDetail(OwnerID(),"[SC_423493_1]")---等等，還是再等一下好了，讓我在確認一下洞穴內的動靜。
 end
function LuaS_423493_2()----	
	CloseSpeak( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 423493) == true  and (CheckFlag(OwnerID(),544340)==false) and ReadRoleValue( TargetID() , EM_RoleValue_Register1  ) == 0 then
		WriteRoleValue( TargetID(), EM_RoleValue_Register1 ,1) 
		BeginPlot( TargetID() , "LuaS_423493_3" , 0)
	end
end
function LuaS_423493_3()----BUFF507503 AddBuff(OwnerID(),507503,1,50)
	local KK = Lua_DW_CreateObj("flag" ,116187,780544,1,0 )---種出一個掌控全部的NPC的魔王。
	Lua_ObjDontTouch( KK )
	AddToPartition(KK , 0 )
	DisableQuest( KK ,true )
	WriteRoleValue( KK, EM_RoleValue_Register2 ,TargetID())---把玩家寫到裡頭
	BeginPlot( KK , "LuaS_423493_4" , 0 )
	while true do
		sleep(10)
			if 	CheckID( KK)== false  then
					WriteRoleValue( OwnerID() , EM_RoleValue_Register1 ,0) 
			break
		end
	end
end
function LuaS_423493_4()---CK 是康葛斯116192 LB是勞勃116193 MORK 是摩瑞克116194  	AddToPartition( MT , 0 )
	local player = ReadRoleValue(OwnerID(),EM_RoleValue_Register2)--
	AddBuff(player,507504,1,65)
	local COPYMORK = Lua_DW_CreateObj("flag" ,116195,780544,4,0)---
	local CK = Lua_DW_CreateObj("flag" ,116192,780544,2,1)---
	local LB= Lua_DW_CreateObj("flag" ,116193,780544,3 ,1)---
	local MORK= Lua_DW_CreateObj("flag" ,116194,780544,4 ,1)---
	DisableQuest( CK ,true )
	DisableQuest( MORK ,true )
	DisableQuest( LB ,true )
	WriteRoleValue(OwnerID() , EM_RoleValue_Register3 ,CK) 
	WriteRoleValue(OwnerID() , EM_RoleValue_Register4 ,LB) 
	WriteRoleValue(OwnerID() , EM_RoleValue_Register5 ,MORK) 
	WriteRoleValue(OwnerID() , EM_RoleValue_Register6 ,COPYMORK) 
	BeginPlot(  OwnerID(), "LuaS_423493_5" , 0 )
---摩瑞克做動作495918
---對所有人上BUFF (潛行的金色BUFF)507505	
--	AddBuff( player ,502280,1 ,30)
--	AddBuff( LB ,502280,1 ,30)
--	AddBuff( CK ,502280,1 ,30)
	AddBuff( player ,507505,1 ,30)
	AddBuff( LB ,507505,1 ,30)
	AddBuff( CK ,507505,1 ,30)
	Say(MORK,"[SC_423493_2]")---那麼我先進去探視情況...
	sleep(10)
--- 摩瑞克移動
	WriteRoleValue(MORK,EM_RoleValue_IsWalk,0)---用跑的
	Hide(  MORK )
	Show(   MORK  , 0 )
	DW_MoveToFlag(MORK ,780544,6, 1,1)--
	delobj(MORK)
	Say(CK,"[SC_423493_3]")---嗯...既然他這麼說，並沒有說非禮勿聽吧？
	sleep(30)
	Say(CK,"[SC_423493_4]")----把我們一個個都定在這？也得經過我的同意阿！
	sleep(30)
	Say(CK,"[SC_423493_5]")----呵~~讓我們來聽聽他們在訴說什麼樣的秘密？
----康葛斯做動作把BUFF消掉
	CastSpell( CK,  player, 496144)
	if CheckID( player)== true and CheckBuff( player ,507505) then
		CancelBuff( player, 507505)
		CancelBuff( player, 502280)
	end
	CancelBuff( LB, 507505)
	CancelBuff( CK, 507505)
	CancelBuff( LB, 502280)
	CancelBuff( CK, 502280)
----	AdjustDir( CK , 60 )
	sleep(20)
	SetDir( CK , 8.8 )
	ScriptMessage( player, player, 0, "[SC_423493_6]" , "0xFFFFFF00" )---年輕的嗓音：摩瑞克...既然已經找到那兩名半龍人了...
	ScriptMessage( player, player, 1, "[SC_423493_6]" , "0xFFFFFF00"  )---年輕的嗓音：摩瑞克...既然已經找到那兩名半龍人了...
	sleep(30)
	ScriptMessage( player, player, 0, "[SC_423493_7]" , "0xFFFFFF00"  )---年輕的嗓音：為什麼不直接他們送至母親的面前呢？你的善良，或許會害了你...
	ScriptMessage( player, player, 1, "[SC_423493_7]" , "0xFFFFFF00" )
	sleep(30)
	ScriptMessage( player, player, 0, "[SC_423493_8]" , "0xff008000")---摩瑞克：我不明白你的意思？
	ScriptMessage( player, player, 1, "[SC_423493_8]" ,"0xff008000")
	sleep(25)
	ScriptMessage( player, player, 0, "[SC_423493_9]" ,"0xFFFFFF00"  )---年輕的嗓音：叔叔，我想你一定很明白巴蘭薩瑟爾之戰所代表的意義...聽母親說起，那是一場因人類的野心席捲到龍身上的戰役？還記得佛南多．寇茲莫？
	ScriptMessage( player, player, 1, "[SC_423493_9]" ,"0xFFFFFF00"  )
	sleep(45)	
	ScriptMessage( player, player, 0, "[SC_423493_10]" , "0xFFFFFF00"  )---年輕的嗓音：或許他還存在在這世界上，他所研發的技術…一一出現在這個世界上，這半龍人正是人類想玷染我族的最佳證據...
	ScriptMessage( player, player, 1, "[SC_423493_10]" , "0xFFFFFF00"   )
	sleep(30)
	ScriptMessage( player, player, 0, "[SC_423493_11]" , "0xFFFFFF00"   )----年輕的嗓音：摩瑞克，為什麼你能容許他們繼續存在這世界上，龍族的尊嚴與自傲，你都不顧了嗎？
	ScriptMessage( player, player, 1, "[SC_423493_11]" , "0xFFFFFF00"   )
	sleep(30)	
	ScriptMessage( player, player, 0, "[SC_423493_12]" , "0xff008000" )----摩瑞克：[115351]...是你忘記了所有事物都有正反面？他們不過是野心家手下的受害者...
	ScriptMessage( player, player, 1, "[SC_423493_12]" , "0xff008000" )
	sleep(30)
	ScriptMessage( player, player, 0, "[SC_423493_13]" , "0xFFFFFF00"   )----年輕的嗓音：夠了，我不想聽見你說這些話，摩瑞克，你被那群怪物所迷惑了！分不清事實真相…你遺忘人類的貪婪，藐視我族的自尊…又置母親於何地…
	ScriptMessage( player, player, 1, "[SC_423493_13]" ,"0xFFFFFF00"  )	
	sleep(45)
	ScriptMessage( player, player, 0, "[SC_423493_14]" , "0xFFFFFF00"   )----年輕的嗓音：炎龍一族並不好相與…叔叔…你應該知道事情的嚴重性？
	ScriptMessage( player, player, 1, "[SC_423493_14]" , "0xFFFFFF00"   )
	sleep(25)
	ScriptMessage( player, player, 0, "[SC_423493_15]" , 0 )----嚴肅的嗓音：顧賀斯嘉，我都明白，你先回去吧！我會主動向女王商談此事…
	ScriptMessage( player, player, 1, "[SC_423493_15]" , 0 )
	Tell (player , COPYMORK ,  "[SC_423493_16]" )---你們可以進來了…
	sleep(25)
	Say(CK,"[SC_423493_17]")---走吧…我們可要大搖大擺的走進去…哼…
	BeginPlot(CK , "LuaS_423493_complete1" , 0 )
	BeginPlot(LB , "LuaS_423493_complete1" , 0 )	
	sleep(10)
	if 	CheckID( player)== true  and CheckAcceptQuest(  player,423493 ) == true and	CheckBuff(player , 507504 )== true then
		SetFlag(player ,544343, 1 ) 
		CancelBuff( player , 507504)
	end
	sleep(10)
	delobj(CK)
	delobj(LB)
	delobj(OwnerID())
end
function LuaS_423493_5()--
	local CK = ReadRoleValue(OwnerID(),EM_RoleValue_Register3)--
	local LB = ReadRoleValue(OwnerID(),EM_RoleValue_Register4)--
	local MORK = ReadRoleValue(OwnerID(),EM_RoleValue_Register5)--
	local player = ReadRoleValue(OwnerID(),EM_RoleValue_Register2)--
	local COPYMORK = ReadRoleValue(OwnerID(),EM_RoleValue_Register6)--
	for i=1, 70, 1 do
		if 	CheckID( player)== false or (CheckAcceptQuest(player,423493)==false) then
			break
		end
		if	CheckID( player)== true  and CheckAcceptQuest( player , 423493 ) == true	and CheckFlag( player, 544289) == false and GetDistance(  player , OwnerID() ) >300		then
			ScriptMessage( player, player, 1 , "[SC_423349_11]" , 0 ) --超出距離，您沒有完成任務。
			ScriptMessage( player , player, 0 , "[SC_423191_11]" , 0 ) --超出距離，您沒有完成任務。
			break
		end
		sleep(10)
	end
	if CheckID( player)== true then
			CancelBuff( player, 507504)
			CancelBuff( player, 507505)
	end
	if 	CheckID( CK)== true then
			delobj(CK)
	end
	if 	CheckID( LB)== true then
					delobj(LB)
	end
	if 	CheckID( MORK)== true then
			delobj(MORK)
	end
	if 	CheckID(  COPYMORK )== true then
					delobj( COPYMORK )
	end
	delobj(OwnerID())
end

---結束後演戲。捨棄不用
function LuaS_423493_complete()
	DisableQuest( OwnerID() ,true )
	AddBuff(TargetID(),507503,1,30)---利用這個BUFF  種出
	SetFlag( TargetID(),544344, 1 ) ---讓玩家再也看不到以前的勞伯、康葛斯
	SetPlot( OwnerID() , "touch" , "LuaFunc_Obj_BUSY" , 50 )
	local MORK = Lua_DW_CreateObj("flag" ,116195,780544,4,0)---
	local CK = Lua_DW_CreateObj("flag" ,116184,780544,2,1)---
	local LB= Lua_DW_CreateObj("flag" ,116186,780544,3 ,1)---
	DisableQuest( CK ,true )
	DisableQuest( LB ,true )
	Tell (TargetID() , MORK ,  "[SC_423493_16]" )---你們可以進來了…
	sleep(30)
	Say(CK,"[SC_423493_17]")---走吧…我們可要大搖大擺的走進去…哼…
	BeginPlot(CK , "LuaS_423493_complete1" , 0 )
	sleep(10)
	BeginPlot(LB , "LuaS_423493_complete1" , 0 )	
	sleep(40)
	if 	CheckID( TargetID() ) == true  then
			CancelBuff( TargetID() , 507503)
	end
	local Player = SearchRangePlayer( OwnerID() , 250 )
	for i=0,table.getn(Player)-1 do
		if CheckCompleteQuest( player[i] ,423493 )== true  and CheckAcceptQuest( player[i] , 423493 ) == false    then
			SetFlag( player[i] ,544344, 1 ) 
		end
	end
	sleep(10)
	DELOBJ(CK)
	DELOBJ(MORK)
	SetPlot( OwnerID() , "touch" , "" , 50 )
	DisableQuest( OwnerID() ,false )
end	
function LuaS_423493_complete1()
	WriteRoleValue(OwnerID() ,EM_RoleValue_IsWalk,0)---用跑的
	Hide(  OwnerID()  )
	Show(   OwnerID()  , 0 )
	DW_MoveToFlag(OwnerID() ,780544,6, 0,1)
	DELOBJ(OwnerID())
end
-----------------------------------------------------------
-------
------------------------
---如果有時間的話
function LuaS_423494()--掛在摩瑞克身上的對話劇情
	if	CheckAcceptQuest( OwnerID() , 423494) == true  and CountBodyItem( OwnerID() ,208102 )==0  then----
				LoadQuestOption( OwnerID() )
				AddSpeakOption(OwnerID(),TargetID()," [SC_423494_3]","LuaS_423494_2",0)---(轉告[[116196]]的說法。)
	elseif	CheckAcceptQuest( OwnerID() , 423494) == true  and CountBodyItem( OwnerID() ,208102 )<5  then----
			SetSpeakDetail(OwnerID(),"[SC_423494_4]")---
	elseif	CheckAcceptQuest( OwnerID() , 423494) == true  and CountBodyItem( OwnerID() ,208102 )>=5  then----
			LoadQuestOption( OwnerID() )
			AddSpeakOption(OwnerID(),TargetID()," [SC_423494_0]","LuaS_423494_1",0)---我已經收集完[<S>208102]。
	else 	LoadQuestOption( OwnerID() )

	end
end
function LuaS_423494_1()----
   	SetSpeakDetail(OwnerID(),"[SC_423494_2]")---恰巧，我與[116197]也剛好從外面收集完東西回來，那麼就交由你拿去給[116196]。
	if 	 CountBodyItem( OwnerID() ,208103 )<5 then 
   		GiveBodyItem(OwnerID(),208103,5)
	end
	if 	CountBodyItem( OwnerID() ,208101 )<5  then
   		GiveBodyItem(OwnerID(),208101,5)
	end
 end
function LuaS_423494_2()----
	SetSpeakDetail(OwnerID(),"[SC_423494_4]")---
end
function LuaS_423494_complete()----780565
	local Kargath=OwnerID();
	local RoomID=ReadRoleValue(Kargath,EM_RoleValue_RoomID);
	DisableQuest( Kargath ,true )
	AddBuff(TargetID(),507506,1,30)
	local x,y,z,dir=ReadRoleValue(Kargath,EM_RoleValue_X),ReadRoleValue(Kargath,EM_RoleValue_Y),ReadRoleValue(Kargath,EM_RoleValue_Z),ReadRoleValue(Kargath,EM_RoleValue_Dir);
	local CK = CreateObj(116242,x,y,z,dir,1);
	MoveToFlagEnabled(CK,false);
	WriteRoleValue(CK,EM_RoleValue_IsWalk,1);
	AddtoPartition(CK,RoomID);
	local GILL= Lua_DW_CreateObj("flag" ,116243,780565,3 ,1)---
	DisableQuest( CK ,true )
	DisableQuest( GILL ,true )
	AddBuff(GILL,507515,1,30)
---動作
	Say(CK,"[SC_423494_5]")
	PlayMotion(CK , ruFUSION_ACTORSTATE_CROUCH_BEGIN);
	SetDefIdleMotion(CK,ruFUSION_MIME_CROUCH_LOOP);
	sleep(30)
	PlayMotion( CK  , ruFUSION_ACTORSTATE_CROUCH_END);
	SetDefIdleMotion(CK,ruFUSION_MIME_IDLE_STAND);
	sleep(20)
	CancelBuff( GILL, 507515)
	Say(GILL,"[SC_423494_6]")---嗯…苦…頭好疼…好疼..
	sleep(30)
	Say(GILL,"[SC_423494_7]")--傑森。
	sleep(20)
	delobj(GILL)
	delobj(CK)
	CancelBuff(TargetID(),507506)
	DisableQuest( OwnerID() ,false )
end	

function LuaS_423494_KK()--特效---中毒的特效 (還未挑選適合ㄉ)-------493925   495916 496181
	Lua_ObjDontTouch( OwnerID())
	DisableQuest( OwnerID(),  true )
	while true do
		sleep(20)
		CastSpell( OwnerID(), OwnerID(),  495916)
	end
end

function LuaS_423494_LL()--特效---中毒的特效 (還未挑選適合ㄉ)------
	Lua_ObjDontTouch( OwnerID())
	DisableQuest( OwnerID(),  true )
	while true do
		sleep(20)
		CastSpell( OwnerID(), OwnerID(),  492667)
	end
end
----------------------------------------------------
------------------------------------------------------------------------------------
---使用507507BUFF
function LuaS_423497()--掛在康葛斯
	LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest( OwnerID() , 423497) == true  and   (CheckFlag(OwnerID(),544346)==false) then
			if	ReadRoleValue( TargetID() , EM_RoleValue_Register1  ) >0 then
				AddSpeakOption(OwnerID(),TargetID(),"[SC_422886_0]","LuaS_423497_1",0)---
			end
			if	ReadRoleValue( TargetID() , EM_RoleValue_Register1  ) == 0 then
				AddSpeakOption(OwnerID(),TargetID(),"[SC_422886_0]","LuaS_423497_2",0)---
			end				
	end
end
function LuaS_423497_1()----
   	SetSpeakDetail(OwnerID(),"[SC_423497_1]")---等等...我想先整理一下儀容，我們要帥氣的出場，給龍族滅滅威風，等都整理好後，再出發。
 end
function LuaS_423497_2()----	
	CloseSpeak( OwnerID() )
	if  ReadRoleValue( TargetID() , EM_RoleValue_Register1  ) == 0 then
		WriteRoleValue( TargetID(), EM_RoleValue_Register1 ,1) 
		BeginPlot( TargetID() , "LuaS_423497_3" , 0)
	end
end	
function LuaS_423497_3()----康葛斯成為大魔王
	AddBuff(TargetID(),507508,1,70)
	local KK = Lua_DW_CreateObj("flag" ,116246,780547,1,1 )---種出一個掌控全部的NPC的魔王。
	DisableQuest( KK ,true )
	WriteRoleValue( KK, EM_RoleValue_Register2 ,TargetID())---把玩家寫到裡頭
	BeginPlot( KK , "LuaS_423497_4" , 0 )
	while true do
		sleep(10)
			if 	CheckID( KK)== false  then
					WriteRoleValue( OwnerID() , EM_RoleValue_Register1 ,0) 
			break
		end
	end
end
function LuaS_423497_4()---780547
	local player = ReadRoleValue(OwnerID(),EM_RoleValue_Register2)--
	local CS = Lua_DW_CreateObj("flag" ,116247,780547,2,1)---卡薩希斯
	local MORK = Lua_DW_CreateObj("flag" ,116248,780547,3 ,1)---
	DisableQuest( CS ,true )
	DisableQuest( MORK ,true )
	WriteRoleValue(OwnerID() , EM_RoleValue_Register3 ,CS) 
	WriteRoleValue(OwnerID() , EM_RoleValue_Register4 ,MORK) 
	BeginPlot(OwnerID() , "LuaS_423497_7" , 0)
	Say(OwnerID(),"[SC_423497_2]")--那麼走吧…
CallPlot( MORK,"LuaS_423497_5",player)
CallPlot( CS,"LuaS_423497_6",player)
---	BeginPlot( CS , "LuaS_423497_6" , 0)
	sleep(30)
	DW_MoveToFlag(OwnerID() ,780547,4, 0,1)
	sleep(70)
	DW_MoveToFlag(OwnerID() ,780547,5, 0,1)
AdjustFaceDir( OwnerID()  , CS  ,  0 )
	Say(OwnerID(),"[SC_423497_3]")---原來是這麼一回事…呵…親愛的龍族，我可以告訴佛南多早已不復在了…封印之戰，他就已被封入了虛界中…
	PlayMotion(OwnerID(),  ruFUSION_ACTORSTATE_EMOTE_SALUTE2  )
	sleep(40)
AdjustFaceDir( CS ,OwnerID()  , 0 )
	Say(OwnerID(),"[SC_423497_4]")----你們應該很高興才對，心腹大患又少掉了一個，忘卻曾經他為你們所做的…
PlayMotion(OwnerID(), ruFUSION_ACTORSTATE_EMOTE_APPLAUSE)
	sleep(40)
	ScriptMessage( player, player, 1, "[SC_423497_5]" , "0xFFFFFF00"   )
	ScriptMessage( player, player, 0, "[SC_423497_5]" , "0xFFFFFF00"   )
	--------YELL(CS,"[SC_423497_5]",7)-----------這並非我族所願…只是不願世界再度失衡罷了…
PlayMotion(CS,   ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )
	sleep(40)
	Say(OwnerID(),"[SC_423497_6]")----您說的那些，我聽不懂！我只想知道你們想怎麼處置那兩個半龍人…
PlayMotion(OwnerID(),    ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )
	sleep(40)
	Say(MORK,"[SC_423497_7]")------[116246],這件事，我會給你答覆…
	PlayMotion(MORK,  ruFUSION_ACTORSTATE_EMOTE_SPEAK   )
	sleep(30)
	ScriptMessage( player, player, 1, "[SC_423497_8]" , "0xFFFFFF00"   )
	ScriptMessage( player, player, 0, "[SC_423497_8]" , "0xFFFFFF00"   )
	--------YELL(CS,"[SC_423497_8]",7)-------我懂你的看法，但在沒有更多的依據出來前，我無法給你答覆…只能盡我所能的庇護摩瑞克所信賴的對象…
	PlayMotion(CS,   ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD  )
	sleep(40)
	Say(MORK,"[SC_423497_9]")----父親…
	if 	CheckID( player)== true  and CheckAcceptQuest(  player,423497 ) == true and	CheckBuff(player , 507508 )== true then
		CancelBuff( player, 507508)
		SetFlag(player ,544346, 1 ) 
	end
	SLEEP(10)
	delobj(MORK)
	delobj(CS)
	if 	CheckID(OwnerID())==true then
		delobj(OwnerID())
	end
end
function LuaS_423497_5(player)---LB的演戲	
	sleep(30)
------	YELL(OwnerID(),"[SC_423497_10]",7)----父親，這件事到底該怎麼做才好？我不想讓女王為難…但同時我無法犧牲他們….
	PlayMotion(OwnerID(),  ruFUSION_ACTORSTATE_EMOTE_SPEAK   )
ScriptMessage(player, player, 0, "[SC_423497_10]", "0xffffffff"   )----
	sleep(30)
-----	YELL(OwnerID(),"[SC_423497_11]",7)----他們不過是被害者…因為我的血液而變成半龍半人…真要算起來我也等罪…
	PlayMotion(OwnerID(),  ruFUSION_ACTORSTATE_EMOTE_IDLE2     )
ScriptMessage(player, player, 0, "[SC_423497_11]", "0xffffffff"   )----
	sleep(80)
----	YELL(OwnerID(),"[SC_423497_12]",7)----父親…難道你也認可顧賀斯加的看法？
ScriptMessage(player, player, 0, "[SC_423497_12]", "0xffffffff"   )----
end
	
	
function LuaS_423497_6(player)----CS的演戲
	sleep(100)
	ScriptMessage( player, player, 1, "[SC_423497_13]" , "0xFFFFFF00"   )
	ScriptMessage( player, player, 0, "[SC_423497_13]" , "0xFFFFFF00"   )
---	YELL(OwnerID(),"[SC_423497_13]",7)---現在無法得知佛南多真正的下落…但他所進行的實驗一一出現在世界上，那時候的人們，別有企圖的靠近我族…
	PlayMotion(OwnerID(),  ruFUSION_ACTORSTATE_EMOTE_SPEAK   )
	sleep(30)
	ScriptMessage( player, player, 1, "[SC_423497_14]" , "0xFFFFFF00"   )
	ScriptMessage( player, player, 0, "[SC_423497_14]" , "0xFFFFFF00"   )
---	YELL(OwnerID(),"[SC_423497_14]",7)---甚至是控制我族，本應殺掉佛南多…但不幸的是…被他逃了…這樣危險的存在…
	PlayMotion(OwnerID(),   ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )
end
	
function LuaS_423497_7()--
	local player = ReadRoleValue(OwnerID(),EM_RoleValue_Register2)--
	local CS = ReadRoleValue(OwnerID(),EM_RoleValue_Register3)--
	local MORK = ReadRoleValue(OwnerID(),EM_RoleValue_Register4)--
	for i=1, 80, 1 do
		if 	CheckID( player)== false or (CheckAcceptQuest(player,423497)==false) then
			break
		end
		if	CheckID( player)== true  and CheckAcceptQuest( player , 423497 ) == true   and CheckFlag( player, 544346) == false and GetDistance(  player , OwnerID() ) >300		then
			ScriptMessage( player, player, 1 , "[SC_423349_11]" , 0 ) --超出距離，您沒有完成任務。
			ScriptMessage( player , player, 0 , "[SC_423191_11]" , 0 ) --超出距離，您沒有完成任務。
			break
		end
		if 	CheckID( MORK)== false then
			break
		end
	sleep(10)
	end
	if CheckID( player)== true then
			CancelBuff( player, 507508)
	end
	if 	CheckID(MORK)== true then
			delobj(MORK)
	end

	if 	CheckID( CS)== true then
			delobj(CS)
	end
	if 	CheckID(OwnerID())==true then
		delobj(OwnerID())
	end
end	

