---------------------------------------------------------------------------
--423779解毒劑任務
---------------------------------------------------------------------------
function LuaP_423779_01()	
	if (CheckAcceptQuest(OwnerID(),423779)==true )and( CheckCompleteQuest( OwnerID() , 423779) == false) then
		SetSpeakDetail(OwnerID(),"[SC_423779_01]")       ----有事嗎？我很忙，沒事的話不要吵我！
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423779_02]","LuaP_423779_02",0)       ----請你幫我製作解毒劑
	else
		LoadQuestOption( OwnerID() )
	end
end

function LuaP_423779_02()	
		SetSpeakDetail(OwnerID(),"[SC_423779_03]")       ----要就趕快把材料給我，不要浪費我寶貴的時間！
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423779_04]","LuaP_423779_03",0)       ----把藥草給狄特爾
end

function LuaP_423779_03()	
	if CountBodyItem( OwnerID(), 208922 )>=5 then
			DelBodyitem( OwnerID(),208922, 5 )
			GiveBodyitem( OwnerID(), 208978, 1 )
	elseif CountBodyItem( OwnerID(), 208922 )<5 then
			ScriptMessage(TargetID(), OwnerID(), 1, "[SC_423779_05]",  "0xffbf0b2b")
			ScriptMessage(TargetID(), OwnerID(), 0, "[SC_423779_05]",  "0xffbf0b2b")
	end
	CloseSpeak( OwnerID())
end

---------------------------------------------------------------------------
Function LuaP_117311_0()
	LoadQuestOption(OwnerID())
	AdjustFaceDir( TargetID(),OwnerID(), 0 )
	PlayMotion( TargetID(),ruFUSION_ACTORSTATE_emote_head_nod)	
end
---------------------------------------------------------------------------
--423900 ARGUE OF TWO BROTHER
----------------------------------------------------------------------------
function LuaP_423900_01()	
	if (CheckAcceptQuest(OwnerID(),423900)==true )and( CheckCompleteQuest( OwnerID() , 423900) == false) then
		SetSpeakDetail(OwnerID(),"[SC_423900_01]")       ----你說是查爾德叫你來的？想和好？
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423900_02]","LuaP_423900_02",0)      ----你說嚇到是怎麼回事？ 
	else
		LoadQuestOption( OwnerID() )
	end
end

function LuaP_423900_02()	
		SetSpeakDetail(OwnerID(),"[SC_423900_03]")       ----其實，前幾天剛來到福羅斯特島上時......
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423900_04]","LuaP_423900_03",0)    ----可以跟我說說其他營地發生的事嗎？
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423900_05]","LuaP_423900_04",0)    ----我覺得你也許該心平氣和的聽你弟弟解釋
end

function LuaP_423900_03()
		SetSpeakDetail(OwnerID(),"[SC_423900_06]")      ---- 海爾芬隊長沒跟你說嗎？
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423900_05]","LuaP_423900_04",0)  	 ----我覺得你也許該心平氣和的聽你弟弟解釋
end

function LuaP_423900_04()
		SetSpeakDetail(OwnerID(),"[SC_423900_07]")      ---- 解釋？懦弱還能有什麼解釋？
		SetFlag(OwnerID() ,544729, 1 )
end

---------------------------------------------------------------------------
--423928 SPECIAL SEEDS
----------------------------------------------------------------------------
function LuaP_423928_01()	
	AdjustFaceDir( TargetID(),OwnerID(), 0 )
	if (CheckAcceptQuest(OwnerID(),423928)==true )and( CheckCompleteQuest( OwnerID() , 423928) == false) then
		SetSpeakDetail(OwnerID(),"[SC_423928_01]")       ----找我有什麼事嗎？
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423928_02]","LuaP_423928_02",0)      ----我可以跟妳拿些植物種子嗎？ 
	else
		LoadQuestOption( OwnerID() )
	end
end

function LuaP_423928_02()	
		SetSpeakDetail(OwnerID(),"[SC_423928_03]")       ----植物種子……你要種子做什麼呢？
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423928_04]","LuaP_423928_03",0)    ----不是
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423928_05]","LuaP_423928_05",0)    ----沒錯，是他拜託我的
end

function LuaP_423928_03()
	SetSpeakDetail(OwnerID(),"[SC_423928_06]")      ---- 阿……這樣阿，抱歉，我不該懷疑你。
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423928_07]","LuaP_423928_04",0)  	 ----是，我非常明白
end

function LuaP_423928_04()
		SetSpeakDetail(OwnerID(),"[SC_423928_09]")      ---- 你能明白真是太好了。
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423928_11]","LuaP_423928_07",0)  ----（你將裘可耶珞絲的話記在心中）
end

function LuaP_423928_05()
		SetSpeakDetail(OwnerID(),"[SC_423928_08]")      ---- 果然是這樣……我就知道艾力克的人員沒有這麼容易就放棄。
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423928_07]","LuaP_423928_04",0)  	 ----是，我非常明白
end

function LuaP_423928_06()
		AdjustFaceDir( OwnerID(),TargetID(), 0 )
		PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_emote_point)
		say(OwnerID(), "[SC_423928_10]")
		GiveBodyitem( TargetID(), 209000, 1 )
end	

function LuaP_423928_07()
	 CloseSpeak( OwnerID())        -----注意TargetID和OwnerID各是誰
	 BeginPlot( TargetID(), "LuaP_423928_06",10)
end

---------------------------------------------------------------------------
--423922 HER PRESENT
-----------------------------------------------------------------------------
function LuaP_423922_01()	
	if (CheckAcceptQuest(OwnerID(),423922)==true )and( CheckCompleteQuest( OwnerID() , 423922) == false)
	and CountBodyItem( OwnerID(), 209012 )==5 and  CountBodyItem( OwnerID(), 209013 )==1 then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423922_01]","LuaP_423922_02",0)       ----請你幫我把這個符文和項鍊嵌在一起
	else
		LoadQuestOption( OwnerID() )
	end
end

function LuaP_423922_02()	
	DelBodyitem( OwnerID(),209013, 1 )
	DelBodyitem( OwnerID(), 209012, 5 )
	GiveBodyitem( OwnerID(), 209011, 1 )
	CloseSpeak( OwnerID())
end
---------------------------------------------------------------------------
function LuaP_423922_03()
	local Obj = OwnerID() --任務npc
	local Target = TargetID() --玩家
	if	ReadRoleValue(Obj,EM_RoleValue_Register1)==0	then  --檢查 EM_RoleValue_Register1(檢查npc的暫存值)
		CallPlot(Obj,"LuaP_423922_04",Target)
	end
end

function LuaP_423922_04(Target)
	local Obj = OwnerID() --任務NPC的ID
	--Target =  --玩家ID
	WriteRoleValue(Obj,EM_RoleValue_Register1,999) --開始演出的標記
	CloseSpeak(Target) --面板消失
--少女出現走到冒險者旁
	local Girl = Lua_DW_CreateObj("flag",117516,780863,0)  --使用顯像棋子
	DW_MoveToFlag( Girl , 780863,1,0 ,1)  
--對話
	AdjustFaceDir(Obj,Girl,0) --面對
	Say(Obj,"[SC_423922_02]")
	PlayMotion(Obj, ruFUSION_ACTORSTATE_emote_wave)
	sleep(15) --等......

	Say(Girl,"[SC_423922_03]")
	PlayMotion(Girl, ruFUSION_ACTORSTATE_emote_point)
	sleep(25)

	Say(Obj,"[SC_423922_04]")
	PlayMotion(Obj,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	sleep(25)

	Say(Girl,"[SC_423922_05]")
	PlayMotion(Girl,ruFUSION_ACTORSTATE_emote_angry)
	sleep(20)

--退場
	WriteRoleValue(Girl  ,EM_RoleValue_IsWalk , 0 ) --奔跑
	DW_MoveToFlag( Girl , 780863,0,0 ,1) --這是迴圈  到了才跑下一行
	DelObj(Girl) --刪除少女
	WriteRoleValue(Obj,EM_RoleValue_Register1,0) --結束演出的標記
end

---------------------------------------------------------------------------
function LuaP_423923_01()	
	AdjustFaceDir( TargetID(),OwnerID(), 0 )
	if (CheckAcceptQuest(OwnerID(),423923)==true )and( CheckCompleteQuest( OwnerID() , 423923) == false)  
		and CountBodyItem(OwnerID(),209011)== 1 then
		SetSpeakDetail(OwnerID(),"[SC_423923_01]")       ----你是剛剛的人，是蒙克叫你來的嗎？
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423923_02]","LuaP_423923_02",0)      ----為什麼剛剛會這麼生氣？	
	else
		LoadQuestOption( OwnerID() )
	end	
end

function LuaP_423923_02()	
		SetSpeakDetail(OwnerID(),"[SC_423923_03]")       ----其實我也不想跟他發脾氣......
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423923_04]","LuaP_423923_03",0)    ----把項鍊交給阿斯珞苻蘭
end

function LuaP_423923_03()
	DelBodyitem( OwnerID(),209011, 1)
	SetFlag(OwnerID() ,544789, 1 )
	CloseSpeak( OwnerID())
	LoadQuestOption( OwnerID() )
end

---------------------------------------------------------------------------
--423922 MISSING MEMBER'S SERIES
-----------------------------------------------------------------------------
function LuaP_423904_01()
		local Target = TargetID()
		AddEXP(Target,8500)	
		PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_crafting_loop)
		sleep(15)
		PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_eat)
		sleep(15)
		say(OwnerID(), "[SC_423904_02]")
		ScriptMessage( OwnerID(), TargetID(), 0, "[SC_423904_01]",  "0xffbf0b2b"  )
		ScriptMessage( OwnerID(), TargetID(), 1, "[SC_423904_01]",  "0xffbf0b2b"  )  ----法西可的臉上手上出現大片的紅色浮腫
end

------------------------------------------------------------------------------------
function LuaP_423903_01()	----獲得和法西可說話的flag
		SetFlag(TargetID(),544788, 1 )
end
	
------------------------------------------------------------------------------------
function LuaP_423905_01()	
	if (CheckAcceptQuest(OwnerID(),423905)==true )and( CheckCompleteQuest( OwnerID() , 423905) == false) then
		Adjustfacedir(TargetID(),OwnerID(),0)
		SetSpeakDetail(OwnerID(),"[SC_423905_01]")       ----你好，新來的冒險者嗎？看看我這邊的貨物吧......
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423905_02]","LuaP_423905_02",0)       ----請給我一罐止癢藥
	else
		LoadQuestOption( OwnerID() )
	end
end

function LuaP_423905_02()
	SetSpeakDetail(OwnerID(),"[SC_423905_03]")       ----真巧，最近我剛好有進貨......
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423905_04]","LuaP_423905_03",0)       ----好像有點貴，不知道可不可以算便宜點
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423905_05]","LuaP_423905_04",0)       ----拿去，這是400金
end
	
function LuaP_423905_03()
	SetSpeakDetail(OwnerID(),"[SC_423905_06]")       ----這已經很便宜了，再便宜我豈不虧本？
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423905_05]","LuaP_423905_04",0)       ----拿去，這是400金
end

function LuaP_423905_04()
		if  ReadRoleValue(OwnerID(),EM_RoleValue_Money )>399	then
			AddRoleValue(OwnerID(),EM_RoleValue_Money, -400)
			GiveBodyitem( OwnerID(), 209040, 1 )
		else
			CallPlot(OwnerID(), "LuaS_423905_06", O_ID )
		end
	SetSpeakDetail(OwnerID(),"[SC_423905_07]")       ----謝謝惠顧，本店期待你的下次光臨。
end

function LuaS_423905_05()
		SetFlag(TargetID(), 544787, 1 )
		AddRoleValue(TargetID(),EM_RoleValue_Money, 200)
end

function LuaS_423905_06()
		ScriptMessage( OwnerID(), TargetID(), 1,"[SC_423905_08]",  "0xffbf0b2b"   )
		ScriptMessage( OwnerID(), TargetID(), 0,"[SC_423905_08]",  "0xffbf0b2b"   )
end

---------------------------------------------------------------------------
--423907 catching  hermit crab
-----------------------------------------------------------------------------
function LuaP_423907_01()-----掛在物品SERVER端劇情，捉寄居蟹劇情
	local OrgID = 0
	if CheckAcceptQuest( OwnerID() , 423907 ) == false or CountBodyItem( OwnerID() , 209051 ) >= 1 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_206446_0]" , 0 ) --你不需要使用此物品
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_206446_0]" , 0 )
		return false
	end

	if CheckID( TargetID() ) == true then
		OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	end
	
	if  OrgID ~= 105193 then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423907_01]", 0 ); -----這個[209052]只能對[105193]使用
		return false
	end
	
	if GetDistance(TargetID(), OwnerID() ) > 120  then -------距離
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422810_1]", 0 ); -----距離太過遙遠，無法使用。
			return false
	end

	if	ReadRoleValue(TargetID(),EM_RoleValue_HP)/ReadRoleValue(TargetID(),EM_RoleValue_MaxHP)	>0.5	then
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423907_02]", 0 ); ----[105193]極力掙扎中，你無法順利使用[209052]。
			return false
	end
		
	if	ReadRoleValue( TargetID(), EM_RoleValue_IsDead) == 1  then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_423048_6]" , 0 ) --牠已經死了。
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_423048_6]" , 0 )
			return false
	end
	return true
end

function LuaP_423907_02()
	if GiveBodyItem( OwnerID() , 209051 , 1 ) then
		UseItemDestroy( OwnerID() )---正在使用的物品
	end
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423907_03]", 0 ); -------你捉到[105193]了了！
	CallPlot(TargetID(),"LuaFunc_ResetObj",TargetID())
end



function LuaPG_tip()   -------海爾芬給的書頁提示

	FA_Border( OwnerID(), "[SC_423908_01]" )

end


---------------------------------------------------------------------------
--423926 mifaso series
-----------------------------------------------------------------------------
function LuaP_423926_01()
	AdjustFaceDir( TargetID(),OwnerID(), 0 )
	if (CheckAcceptQuest(OwnerID(),423926)==true )and(CheckFlag( OwnerID(), 544790 ) == false) then			
		SetSpeakDetail(OwnerID(),"[SC_423926_11]")       ----你準備好了沒？我可要念囉？
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422974_0]","LuaP_423926_06",0)        ----準備好了
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423926_12]","LuaP_423926_02",0)      ----我已經記下來了
	else	
		LoadQuestOption( OwnerID() )
	end
	if  (CheckAcceptQuest(OwnerID(),423927)==true )and( CheckCompleteQuest( OwnerID() , 423927) == false) then
		Adjustfacedir(TargetID(),OwnerID(),0)
		SetSpeakDetail(OwnerID(),"[SC_423927_01]")       ----你想知道嗎
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423927_02]","LuaP_423927_02",0)       ----請告訴我
	end	
end

function LuaP_423926_02()	
		SetSpeakDetail(OwnerID(),"[SC_423926_06]")       ----你記下來了嗎？按照順序告訴我吧
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423926_07]","LuaP_423926_04",0)    ----正確
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423926_08]","LuaP_423926_05",0)    ----錯誤
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423926_09]","LuaP_423926_05",0)    ----錯誤
end

function LuaP_423926_06()
		BeginPlot( TargetID(), "LuaP_423926_03",0)
end

function LuaP_423926_03()
	CloseSpeak( TargetID())        

	say(OwnerID(), "[SC_423926_01]")
	sleep(15)
	say(OwnerID(), "[SC_423926_02]")
	sleep(15)
	say(OwnerID(), "[SC_423926_03]")
	sleep(15)
	say(OwnerID(), "[SC_423926_04]")
	sleep(15)
	say(OwnerID(), "[SC_423926_05]")
end

function LuaP_423926_04()
	 CloseSpeak( OwnerID())        -----注意TargetID和OwnerID各是誰
	 SetFlag(OwnerID() ,544790, 1 )
end

function LuaP_423926_05()
		SetSpeakDetail(OwnerID(),"[SC_423926_10]")       ----總覺得怪怪的……
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423926_07]","LuaP_423926_04",0)    ----正確
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423926_08]","LuaP_423926_05",0)    ----錯誤
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423926_09]","LuaP_423926_05",0)    ----錯誤
end

------------------------------------------------------------------------------
function LuaP_423927_02()
		SetSpeakDetail(OwnerID(),"[SC_423927_03]")       ----沒想到你也有求知慾……
		SetFlag(OwnerID(), 544794, 1 )
end



---------------------------------------------------------------------------
--423920 big cats! 
-----------------------------------------------------------------------------
function LuaP_423920_01()
	local NPC=TargetID()
	local player = OwnerID() --玩家

	if CheckAcceptQuest( player, 423920 ) == true and CheckCompleteQuest( player , 423920) == false
	and 	CheckFlag(player,544798)==false	then
		SetSpeakDetail( player, "[SC_423920_02]" )	
		AddSpeakOption(  player, NPC , "[SC_423920_03]", "LuaP_423920_03",0)
	else
		LoadQuestOption(player)
	end
end

function LuaP_423920_03()
	local NPC=TargetID()
	local player = OwnerID() --玩家

--	say(NPC,"00")
	local num=ReadRoleValue( NPC, EM_RoleValue_Register1 ) 
	if	num> 0	then
		SetSpeakDetail( player, "[SC_423920_04]" ) 
	else
		CloseSpeak( player )	--關閉所有對話視窗
		CallPlot( NPC, "LuaP_423920_04", player,NPC )	--呼叫下一段函式
	end
end

function LuaP_423920_04(player,NPC)
	DisableQuest(NPC,true)
	sleep(25)
	say (NPC, "[SC_423920_01]")
	sleep(15)	
	local TIGER1 = Lua_DW_CreateObj("flag",105271,780864,0) ----生出劍牙虎
	local TIGER2 = Lua_DW_CreateObj("flag",105271,780864,1) 
	local Killcats = {0, 0}
	SetAttack(TIGER1 , player )
	SetAttack(TIGER2 , player )
	WriteRoleValue(NPC,EM_RoleValue_Register1,999)	

--	DebugMsg(0,0,"1")
	while 1 DO
--	DebugMsg(0,0,"2")
		if 	CheckAcceptQuest( player, 423920 ) == false 		then
--			DebugMsg(0,0,"3")
			while 1 DO
--				DebugMsg(0,0,"4")
				if	(CHECKID(TIGER1) == false OR ReadRoleValue(TIGER1,EM_RoleValue_IsDead) == 1)	AND
					(CHECKID(TIGER2) == false OR ReadRoleValue(TIGER2,EM_RoleValue_IsDead) == 1)	THEN
--					DebugMsg(0,0,"12")				
					DisableQuest(NPC,false)
					break			
				end
--				DebugMsg(0,0,"5")
			end
			Sleep(10)
--			DebugMsg(0,0,"6")	
			break
		end

--		DebugMsg(0,0,"7")
--		DebugMsg(0,0,ReadRoleValue(TIGER1 , EM_RoleValue_IsDead).."__"..Killcats[1])
		sleep(20)

		if ReadRoleValue(TIGER1 , EM_RoleValue_IsDead) == 1 and Killcats[1] <1 then
--			DebugMsg(0,0,"8")
			TIGER1 = Lua_DW_CreateObj("flag",105271,780864,0)
			SetAttack(TIGER1 , player )
			Killcats[1] = Killcats[1] + 1
		end

--		DebugMsg(0,0,"9")
--		DebugMsg(0,0,ReadRoleValue(TIGER2 , EM_RoleValue_IsDead).."__"..Killcats[2])

		if ReadRoleValue(TIGER2 , EM_RoleValue_IsDead) == 1 and Killcats[2] <1 then
			TIGER2 = Lua_DW_CreateObj("flag",105271,780864,1)
			SetAttack(TIGER2 , player )
			Killcats[2] = Killcats[2] + 1
		end

		Sleep(20)

		IF	Killcats[1] == 1 and Killcats[2] == 1	AND
			(CHECKID(TIGER1) == false OR ReadRoleValue(TIGER1,EM_RoleValue_IsDead) == 1)	AND
			(CHECKID(TIGER2) == false OR ReadRoleValue(TIGER2,EM_RoleValue_IsDead) == 1)	THEN
--				DebugMsg(0,0,"10")
				SetFlag(player, 544798,1)
				DisableQuest(NPC,false)
				break
		end

--		DebugMsg(0,0,ReadRoleValue(TIGER1 , EM_RoleValue_IsDead).."__"..Killcats[1])
--		DebugMsg(0,0,"11")
	END

--	DebugMsg(0,0,NPC)
	WriteRoleValue(NPC,EM_RoleValue_Register1,0)
	--say(player,"22")
--	CallPlot(Owner, "LuaP_423920_03",player,TIGER1 ,TIGER2,Owner )

end

-----------------------------------------------------------------------------
function LuaQ_PG_delmonster()
	sleep(100)
 	while 1 do
		if 	HateListCount( OwnerID() )==0	then	----檢查仇很列表，沒有人的話
			DelObj(OwnerID())				----刪掉自己
			return
		end
		sleep(15)
	end	
end
-----------------------------------------------------------------------------
function LuaP_423920_02()
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_CROUCH_BEGIN)
	Sleep(15)	
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_CROUCH_LOOP)		
	Sleep(35)		
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_CROUCH_END)		
end


---------------------------------------------------------------------------
--423918 NATURAL POWER
-----------------------------------------------------------------------------
function LuaP_423918_01()
	CastSpell( OwnerID(), OwnerID(), 490098 )
	PlayMotion(OwnerID(), ruFUSION_ACTORSTATE_crafting_loop)
	sleep(20)
	ScriptMessage( OwnerID() , TargetID(), 1 , "[SC_423918_01]" , 0 ) 
	ScriptMessage( OwnerID() , TargetID(), 0 , "[SC_423918_01]" , 0 )
end


---------------------------------------------------------------------------
--423919 NATURAL POWER 2
-----------------------------------------------------------------------------
function LuaP_423919_01()-----掛在物品SERVER端劇情...
	local OrgID = 0
	
	if CheckAcceptQuest( OwnerID() , 423919 ) == false  then  
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_206446_0]" , 0 ) --你不需要使用此物品
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_206446_0]" , 0 )
		return false
	end
	
	if CheckID( TargetID() ) == true then
		OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	end
	
	if  OrgID ~= 105272 then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423919_01]", 0 ); -----這個[209074]似乎只能對[105272]使用。
		return false
	end
	
	if GetDistance(TargetID(), OwnerID() ) > 120  then -------距離
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422810_1]", 0 ); -----距離太過遙遠，無法使用。
			return false
	end

	if	ReadRoleValue(TargetID(),EM_RoleValue_HP)/ReadRoleValue(TargetID(),EM_RoleValue_MaxHP)	>0.5	then
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423919_02]", 0 )  ----IT CAN'T NOT BE GUIET
			return false
	end
		
	if	ReadRoleValue( TargetID(), EM_RoleValue_IsDead) == 1 or  CheckBuff( TargetID() , 504004 ) == true  then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_423048_6]" , 0 ) --牠已經死了。
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_423048_6]" , 0 )
			return false
	end
	return true
end


function LuaP_423919_02()
	--if GiveBodyItem( OwnerID() , 209074 , 1 ) then
	--	UseItemDestroy(OwnerID())---刪除正在使用的物品
	--end
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423919_03]", 0 )  -------[105272] HAVE BEEN QUIET！
	DELOBJ(TargetID())
	DW_QietKillOne(0,105331)   ---靜靜的殺死怪
end

-----------------------------------------------------------------------------
function LuaP_423919_03()    ---掛在隱形物件上。	
		SetPlot( OwnerID(), "range","LuaPG_423919_04", 150 )	
		--SAY (OwnerID(),"A")
end

function LuaPG_423919_04() 
--	if CheckFlag(OwnerID(), 544811)  == true  then
		--SAY (OwnerID(),"B")
--		SetFlag(OwnerID() ,544811,0)
--		BeginPlot(OwnerID(),"LuaPG_423919_05",0)
--	end
	local AttackStatue = ReadRoleValue( OwnerID() , EM_RoleValue_IsAttackMode )			--判斷是否進入戰鬥 1= 是 0= 否

	if	CheckAcceptQuest(OwnerID(),423919)==true	then
		if	CheckBuff(OwnerID(),509813)==false	and	AttackStatue==0          	then 	--no buff is normal can to begin the show
			AddBuff(OwnerID(),509813,1,-1)
			BeginPlot(OwnerID(),"LuaPG_423919_05",0)
		elseif	AttackStatue==1	then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_205535_0]" , 0 ) 			
		end
	end
end

function LuaPG_423919_05()
		ScriptMessage( TargetID() , TargetID() , 1 , "[SC_423919_04]" , 0 )    --你察覺附近的植物騷動了起來
		sleep(20)
		--SAY (OwnerID(),"C")
		if	CheckAcceptQuest(TargetID(),423919)==false	then
			CancelBuff(OwnerID(),509813) --finish process by no quest , so del the buff
		end
		--SAY (OwnerID(),"C")
		local PLANT_MONSTER = {} --To save the ID of PLANT_MONSTER
		local IfFinishLoop = false
		for i=1,5,1 do
			 PLANT_MONSTER[i]= Lua_DW_CreateObj( "flag" , 105272 , 780865 , i ) ----生出第 i 隻植物怪
			SetAttack(PLANT_MONSTER[i] , OwnerID())	  ----主動攻擊玩家
			for CheckTimes=1,9,1 do
				sleep(5)
				if	CheckAcceptQuest(TargetID(),423919)==false	then
					IfFinishLoop = true -- Really want to finish loop , change the boolin value
					break
				end
			end
			if	IfFinishLoop==true	then
				break
			end
		end
		CancelBuff(OwnerID(),509813) --finish process normally, so del the buff
end

----給一個flag，掛在接受任務後
function LuaPG_423919_06()
	SetFlag(TargetID(),544811,1)
	--if CheckFlag(OwnerID(),544811) == true  then
	--	say(OwnerID(),"Got")
	--end
	--SetPlot( 117464, "range","LuaPG_423919_04", 150 )	
	--SAY (OwnerID(),"D")
end


----------------------------------------------------------------------------
function LuaPG_test_01()
	CastSpell( OwnerID(), TargetID(), 509030 )
	sleep(20)
end


function LuaQ_PG_423919_delmonster()
	LockHP( OwnerID() , 500 , "LuaQ_PG_423919_delmonster_02" )  
	sleep(100)
 	while 1 do
		if 	HateListCount( OwnerID() )==0	then	----檢查仇很列表，沒有人的話
			DelObj(OwnerID())				----刪掉自己
			return
		end
		sleep(15)
	end	
end

function LuaQ_PG_423919_delmonster_02()
	SetAttack(OwnerID(),TargetID())
	return false
end



