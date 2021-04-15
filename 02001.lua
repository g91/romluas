
--======================================================================================================
--423528
--======================================================================================================

function LuaS_423528_0()
	LoadQuestOption(OwnerID())
		if 	(CheckAcceptQuest(OwnerID(),423528)== true ) 			and
			Checkflag(OwnerID(),544370)== false				then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423528_0]","LuaS_423528_1",0)
			--你知道哪裡可以找到他們嗎？
		end
end

function LuaS_423528_1()
	SetSpeakDetail(OwnerID(),"[SC_423528_1]")
	--若我掌握的消息無誤，岩鹽村附近出沒的那夥騙子、小賊，八成就是腐眼的人.....
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423528_2]","LuaS_423528_2",0)
	--陛下並未如此吩咐，還是謹慎行事為宜。
end

function LuaS_423528_2()
	SetSpeakDetail(OwnerID(),"[SC_423528_3]")
	--若我掌握的消息無誤，岩鹽村附近出沒的那夥騙子、小賊，八成就是腐眼的人.....
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423528_4]","LuaS_423528_3",0)
	--陛下並未如此吩咐，還是謹慎行事為宜。
end
	
function LuaS_423528_3()	
	if (CheckAcceptQuest(OwnerID(),423528)== true ) 	then
		Setflag(OwnerID(),544370,1)
	end
	CloseSpeak(OwnerID())
end


--======================================================================================================
--423531
--======================================================================================================

function LuaS_423531_0()
	LoadQuestOption(OwnerID())
		if 	(CheckAcceptQuest(OwnerID(),423531)== true ) 			and
			Checkflag(OwnerID(),544372)== false				then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423531_0]","LuaS_423531_CheckBusy0",0)
			--(給錢了事)
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423531_3]","LuaS_423531_2",0)
			--(無視於他)
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423531_5]","LuaS_423531_4",0)
			--幽魂草在哪裡？
		end
		
		if 	(CheckAcceptQuest(OwnerID(),423535)== true ) 			and
			Checkflag(OwnerID(),544374)== false				then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423535_4]","LuaS_423535_0",0)
			--請問，你認識剛剛離去的那名抱著貓的老婆婆嗎？
		end
end


--□□□□□□□□□□□□□□□□□(給錢了事)□□□□□□□□□□□□□□□□□□□□□□□--

function LuaS_423531_CheckBusy0()
	--判斷掛劇情演出的npc是否忙碌中，如果不忙則演出劇情，忙則送他一句話，請他等待，掛在連接演出script的當段函式
	--Say(OwnerID(),"0..01")
	--Say(TargetID(),"T..T1")

	if	ReadRoleValue( TargetID() ,EM_RoleValue_PID ) == 0	then
		
		BeginPlot( TargetID() , "LuaS_423531_1" , 0 )
		CloseSpeak( OwnerID() )
	else
		SetSpeakDetail(OwnerID(),"[GATHER_MSG_OBJBUSY]")			--目標正在忙碌中。	
	end
end

function LuaS_423531_1()
	DisableQuest( OwnerID() , true )
	--一定要關上掛劇情演出的對話
	writerolevalue( OwnerID() , EM_RoleValue_PID , 1 )
		if  ReadRoleValue(TargetID(),EM_RoleValue_Money )>49	then
			Adjustfacedir(OwnerID(),TargetID(),0)
			Say(OwnerID(),"[SC_423531_1]")
			--交了錢，你要找的東西就好找了，看我的！
			Sleep(30)
			CastSpell(OwnerID(),TargetID(),492669)
			Sleep(40)
			SetFlag(TargetID(),544372,1)
			AddRoleValue(TargetID(),EM_RoleValue_Money,-50)
			--刪掉玩家金錢50金
			


		else
			ScriptMessage( OwnerID(), TargetID(), 0,"[SC_423531_7]", 0 )
			ScriptMessage( OwnerID(), TargetID(), 1,"[SC_423531_7]", 0 )
		end	
	writerolevalue( OwnerID() , EM_RoleValue_PID , 0 )	--因為在判斷函式裡LuaS_423377_CheckBusy裡設為1
	DisableQuest( OwnerID() , false )
end


function LuaS_423531_2()
	Beginplot( TargetID() , "LuaS_423531_3" , 0 )
	CloseSpeak( OwnerID() )
end

function LuaS_423531_3()
	DisableQuest( OwnerID() , true )
	Adjustfacedir(OwnerID(),TargetID(),0)
	Say(OwnerID(),"[SC_423531_4]")
	--你就過去吧！不過你要找的東西，可不會這麼輕易被你找到。
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Sleep(30)
	DisableQuest( OwnerID() , false )
end
	
function LuaS_423531_4()
	Beginplot( TargetID() , "LuaS_423531_5" , 0 )
	CloseSpeak( OwnerID() )
end

function LuaS_423531_5()
	DisableQuest( OwnerID() , true )
	Adjustfacedir(OwnerID(),TargetID(),0)
	Say(OwnerID(),"[SC_423531_6]")
	--朋友，沒錢沒答案啊。
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Sleep(30)
	DisableQuest( OwnerID() , false )
end



--======================================================================================================
--423532
--======================================================================================================

function LuaI_s7_208137_0()	
	--幽魂草
	--掛在作用物品的模版下>物品使用>使用效果類型：Server端劇情>使用效果
	Beginplot(TargetID(),"LuaI_s7_208137_1",0)
end


function LuaI_s7_208137_1()
	if	(CountBodyItem(TargetID(),208137))>0 	then
		GiveBodyItem( TargetID() , 208138 , 1 )
		ScriptMessage(  TargetID()   , TargetID()    , 0 , "[SC_208137_0]" , 0 )	
		--你小心的將幽魂草籽摘下。
		UseItemDestroy()	
		--模版中不要勾選_可消耗_，此指令可刪除使用中的物品，最好放在給了新物品之後，這樣才不會有舊物用掉，新物卻未入袋的窘況。
		DelBodyItem(TargetID(),208137,1)
	end
end
	
	
function LuaI_s7_208139_0()
	--空布袋 
	--掛在作用物品的模版下>物品使用>使用效果類型：Server端劇情>使用效果
	Beginplot(TargetID(),"LuaI_s7_208139_1",0)
end


function LuaI_s7_208139_1()
	if	(CountBodyItem(TargetID(),208138))>9 	then
		GiveBodyItem( TargetID() , 208140 , 1 )
		ScriptMessage(  TargetID()   , TargetID()    , 0 , "[SC_208139_0]" , 0 )	
		--你將[207138]裝入[207139]。
		UseItemDestroy()	
		--模版中不要勾選_可消耗_，此指令可刪除使用中的物品，最好放在給了新物品之後，這樣才不會有舊物用掉，新物卻未入袋的窘況。
		DelBodyItem(TargetID(),208138,10)
		DelBodyItem(TargetID(),208139,1)
	else
		ScriptMessage(  TargetID()   , TargetID()    , 0 , "[SC_208139_1]" , 0 )
		--你擁有的[207138]數量不足以裝滿[207139]。
	end
end


--=====================================================================================================
--423533點地圖上3d物件，開啟任務(Burning Bag)
--=====================================================================================================

--(1)先有觸碰劇情
function Lua_BeginCastBar_423533()--觸碰劇情115623
	SetPlot( OwnerID(),"touch","Lua_BeginCastBar_423533_1",30 )

end


--(2)執行BeginCastBar判斷
function Lua_BeginCastBar_423533_1() --
	local O_ID = OwnerID() 	-- 玩家
	local T_ID = TargetID()  	-- NPC

	DW_CancelTypeBuff(68,O_ID)
	--DW_CancelTypeBuff(BuffTypeNum,ObjID)
	--BuffTypeNum 輸入想解除的buff 類型
	--68 騎乘
	--58 變身
	--ObjID 輸入想解除的目標  若不填 預設為 OwnerID()
	--填1 則預設為 TargetID()
	if	CheckAcceptQuest(OwnerID(),423533)==true			and
		CheckFlag(O_ID,544384)==false				then
		if 	BeginCastBarEvent( O_ID, T_ID,"[SC_423533_OPEN]", 50, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "Lua_BeginCastBar_423533_2" ) ~= 1 then
			ScriptMessage( O_ID, O_ID, 0,"[SAY_NPC_BUSY]", 0 );		--目標忙碌中

		end
	end
end


--(3)執行BeginCastBar後之結果

function Lua_BeginCastBar_423533_2(ObjID, CheckStatus)   -- <---() 內 參數一定要有
	local O_ID = OwnerID() 	-- 玩家
	local T_ID = TargetID()  	-- NPC

			if( CheckStatus ~= 0 ) then
					if( CheckStatus > 0 ) then
						-- 成功
						EndCastBar( O_ID, CheckStatus );
						AddBuff(T_ID,505471,1,10)	
						SetFlag(O_ID,544384,1)
						AddBuff(O_ID,507542,1,60)
						--判斷種出的貓咪是否看的見的buff
						BeginPlot(T_ID,"Lua_BeginCastBar_423533_3",0)
					else
						-- 失敗
						EndCastBar( O_ID, CheckStatus )
					end
			end
end	
		

function Lua_BeginCastBar_423533_3()
	DisableQuest(OwnerID(), true )
		local Mio  = Lua_DW_CreateObj("flag" ,116308,780736,1)	
		DisableQuest(Mio, true )
		Hide(Mio)
		Show(Mio,0)
		DW_MoveToFlag(Mio,780736,2,0,1)
		Delobj(Mio)
		CancelBuff(TargetID(),507542)
	
	DisableQuest(OwnerID(), false )
end


function LuaWS_423533_E0()	--780739.1
	DisableQuest(OwnerID(), true )
		AddBuff(TargetID(),507546,1,200)	
		
		Local Box  = LuaFunc_CreateObjByObj( 116370 , OwnerID() )
		Hide(Box)
		DisableQuest(Box, true )
		Show(Box,0)
		WriteRoleValue(Box, EM_RoleValue_IsWalk, 0)
		Sleep(30)
		Yell(Box,"[SC_423533_0]",2)
		DW_MoveToFlag(Box,780739,1,0,1)
		Delobj(Box)
		CancelBuff( TargetID()  , 507546  ) 
	DisableQuest(OwnerID(), false )
end
	
	
	
	

--======================================================================================================
--423535
--======================================================================================================

function LuaS_423535_0()
	SetSpeakDetail(OwnerID(),"[SC_423535_0]")
	--你說那個抱著貓，老是神經兮兮盯著人看的瘋老婆子？
	SetFlag(OwnerID(),544374,1)
end

function LuaS_423535_1()
	--愁苦的村民
	LoadQuestOption(OwnerID())
		if 	(CheckAcceptQuest(OwnerID(),423535)== true ) 			and
			Checkflag(OwnerID(),544375)== false				then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423535_4]","LuaS_423535_2",0)
			--請問，你認識剛剛離去的那名抱著貓的老婆婆嗎？
		end
end

function LuaS_423535_2()
	SetSpeakDetail(OwnerID(),"[SC_423535_1]")
	--喔，那個瘋瘋癲癲的老婆婆啊，我不知道她住哪裡，我不常在這裡見到她。
	SetFlag(OwnerID(),544375,1)
end

function LuaS_423535_3()
	--憂心的村民
	LoadQuestOption(OwnerID())
		if 	(CheckAcceptQuest(OwnerID(),423535)== true ) 			and
			Checkflag(OwnerID(),544376)== false				then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423535_4]","LuaS_423535_4",0)
			--請問，你認識剛剛離去的那名抱著貓的老婆婆嗎？
		end
end

function LuaS_423535_4()
	SetSpeakDetail(OwnerID(),"[SC_423535_2]")
	--那個瘋婆子，上次硬說我偷她的貓，躺在我家門口大哭大鬧
	SetFlag(OwnerID(),544376,1)
end

function LuaS_423535_5()
	--鹽工
	LoadQuestOption(OwnerID())
		if 	(CheckAcceptQuest(OwnerID(),423535)== true ) 			and
			Checkflag(OwnerID(),544377)== false				then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423535_4]","LuaS_423535_6",0)
			--請問，你認識剛剛離去的那名抱著貓的老婆婆嗎？
		end
		
		if 	CheckAcceptQuest(OwnerID(),423537)==true 			and
			CheckCompleteQuest(OwnerID(),423537)==false			and
			Checkflag(OwnerID(),544379)==false				then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423537_0]","LuaS_423537_0",0)
			--不屬於我們的財寶，我們不能收。
		end
		if 	(CheckCompleteQuest(OwnerID(),423535)== true ) 		and
			Checkflag(OwnerID(),544385)== false				then
			SetFlag(OwnerID(),544385,1)
		end
end

function LuaS_423535_6()
	SetSpeakDetail(OwnerID(),"[SC_423535_3]")
	--我知道那個老婆子，她可是有錢的不得了，不過呢，她的腦袋有點問題.....
	SetFlag(OwnerID(),544377,1)
	SetFlag(OwnerID(),544385,1)
end

function LuaWS_423535_end()
	if	Checkflag(TargetID(),544385)== false	 then
		SetFlag(TargetID(),544385,1)
	end
end

--======================================================================================================
--423536
--======================================================================================================

function LuaS_423536_0()
	--湯尼116226
	LoadQuestOption(OwnerID())
	if 	(CheckAcceptQuest(OwnerID(),423536)== true ) 			and
		Checkflag(OwnerID(),544378)== false				then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423536_0]","LuaS_423536_1",0)
		--陛下，那邊有一名萊慕恩鹽工給我們這樣的建議......
	end
end

function LuaS_423536_1()
	SetSpeakDetail(OwnerID(),"[SC_423536_1]")
	--什麼建議？
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423536_2]","LuaS_423536_2",0)
	--(你一五一十說出適才鹽工告訴你的提議)
end
	
function LuaS_423536_2()
	SetSpeakDetail(OwnerID(),"[SC_423536_3]")
	--騎士，若依從你的意志決定，你會選擇何者？
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423536_4]","LuaS_423536_3",0)
	--(收下財寶，再給那名可憐的工人錢財)
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423536_5]","LuaS_423536_4",0)
	--(不，貪沒財物不是一名光榮的騎士該做的事)
end	
	
function LuaS_423536_3()
	SetSpeakDetail(OwnerID(),"[SC_423536_6]")
	--騎士，非我之物豈能輕易收下？你若是憐憫那名鹽工，
	SetFlag(OwnerID(),544378,1)
end
	
function LuaS_423536_4()	
	SetSpeakDetail(OwnerID(),"[SC_423536_7]")
	--騎士，達拉尼斯以你的英勇與無私為傲！
	SetFlag(OwnerID(),544378,1)
end	
	
	
--======================================================================================================
--423537
--======================================================================================================
function LuaS_423537_0()
	SetSpeakDetail(OwnerID(),"[SC_423537_1]")
	--只要給我一些錢，就能把寶物收為已有......

		AddSpeakOption(OwnerID(),TargetID(),"[SC_423537_2]","LuaS_423537_1",0)
		--(贈予鹽工200金幣)
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423537_4]","LuaS_423537_3",0)
		--(不給鹽工錢)
	end

function LuaS_423537_1()
	BeginPlot( TargetID() , "LuaS_423537_2" , 0 )
	CloseSpeak( OwnerID() )
end

function LuaS_423537_2()
	if	Checkflag(TargetID(),544379)==false	then
		if  ReadRoleValue(TargetID(),EM_RoleValue_Money )>49	then
			Adjustfacedir(OwnerID(),TargetID(),0)
			Say(OwnerID(),"[SC_423537_3]")
			--你不拿財寶，卻還要給我錢？你人真好啊！
			SetFlag(TargetID(),544380,1)
			SetFlag(TargetID(),544379,1)
			AddRoleValue(TargetID(),EM_RoleValue_Money,-200)
		else
			ScriptMessage( OwnerID(), TargetID(), 0,"[SC_423531_7]", 0 )
			ScriptMessage( OwnerID(), TargetID(), 1,"[SC_423531_7]", 0 )
			--你身上的金錢不足，請準備充份再過來。
		end
	end
end


function LuaS_423537_3()	
	BeginPlot( TargetID() , "LuaS_423537_4" , 0 )
	CloseSpeak( OwnerID() )
end

function LuaS_423537_4()
	if	Checkflag(TargetID(),544379)==false	then
		Say(OwnerID(),"[SC_423537_5]")
		--不給錢就想打發我？好傢伙，你就隨時小心你的背後吧！
		AddBuff( TargetID()  , 507549 , 1 , 600 ) 
		--「盬工的記恨」被偷襲的旗標
		SetFlag(TargetID(),544379,1)
	end
end



function LuaWS_423537_C0()
	--範圍出怪、打怪
	Setplot(OwnerID(),"range","LuaWS_423537_C1",100)
end

function LuaWS_423537_C1()
	Setplot(OwnerID(),"range","LuaWS_423537_C1",0)
	if 	Checkbuff( OwnerID() , 507549)==true				and
		Checkbuff( OwnerID() ,507548)==false				and
		ReadRoleValue(OwnerID(),EM_RoleValue_PID )~=10		then
		Beginplot(TargetID(),"LuaWS_423537_C2",0)
	end
	Setplot(OwnerID(),"range","LuaWS_423537_C1",150)
end


function LuaWS_423537_C2()	--小孩放buff緩速、大人出來打人
	Setplot(OwnerID(),"range","",0)
	DisableQuest(OwnerID(), true )
	writerolevalue( TargetID() , EM_RoleValue_PID , 10 )	
	Local X = ReadRoleValue(TargetID(),EM_RoleValue_X)
	Local Y = ReadRoleValue(TargetID(),EM_RoleValue_Y)
	Local Z = ReadRoleValue(TargetID(),EM_RoleValue_Z)
		--local Kid = Lua_DW_CreateObj("flag" ,116367,780738,1)
		local Kid = CreateObj ( 116367 , X+50 , Y , Z+20 , 0 , 1) 
		Hide(Kid)
		Show(Kid,0)
		WriteRoleValue(Kid, EM_RoleValue_IsWalk, 0)
		DisableQuest(Kid, true )

		AdjustFaceDir(Kid,TargetID(),0)
		--AddBuff( TargetID()  , 507549 , 1 , 300 )
		MoveToFlagEnabled(Kid, false )
		--關閉巡邏劇情之動作，若npc不聽話，自己亂做多餘的動作：如自己轉向，試試看這個指令
		CastSpell(Kid,TargetID(),496118)	--494805
		Sleep(30)
		MoveToFlagEnabled(Kid, true )
		--關閉巡邏劇情之動作，若npc不聽話，自己亂做多餘的動作：如自己轉向，試試看這個指令
		Yell(Kid,"[SC_423537_C0]",2)
		PlayMotion(Kid,ruFUSION_ACTORSTATE_EMOTE_LAUGH	)
		Sleep(30)
		Beginplot(Kid,"LuaWS_423537_C3",0)
		Sleep(50)
		
		--回到掩體後
	Delobj(Kid)
	writerolevalue( TargetID() , EM_RoleValue_PID , 0 )	
	DisableQuest(OwnerID(), false )
	Setplot(OwnerID(),"range","LuaWS_423537_C1",150)
end

function LuaWS_423537_C3()
	Local N=RandRange( 1 , 5)  
	DW_MoveToFlag(OwnerID(),780738,N,0,1)
end


--======================================================================================================
--423537	玩家踏入，怪跳出攻擊
--======================================================================================================
function LuaS_423537_K0()	--種透明物件115265，掛範圍劇情
	Setplot(OwnerID(),"range","LuaS_423537_K1",60)	--設定觸發範圍：在進入該npc50內，執行Lua
end	

function LuaS_423537_K1()	--OWNER是玩家
	Setplot(OwnerID(),"range","",0)

	if 	Checkbuff( OwnerID() ,507548)== true 	and
		ReadRoleValue(OwnerID(),EM_RoleValue_IsAttackMode)==0		then
		Beginplot(TargetID(),"LuaS_423537_K2",0)

	end
	Setplot(OwnerID(),"range","LuaS_423537_K1",50)
end

function LuaS_423537_K2()	--OwnerID是103556

	Setplot(OwnerID(),"range","",0)

	local player="here"
	local So = LuaFunc_CreateObjByObj( 103556 , OwnerID() )	--種透明物件處直接生出打人的怪
	--		DisableQuest( So , true )					--關閉對話
	Yell(So,"[SC_423537_C2]",1)
	SetAttack(So , TargetID())
	
	while 1 do

		if 	GetDistance( TargetID(), OwnerID()) >300   or
			ReadRoleValue(TargetID() , EM_RoleValue_IsDead)==1 	or
			CheckID(TargetID()) == false	then
			player="Nothere"
			break	
		end
		if 	CheckID(So) == false	then
			break
		end
		Sleep(10)
	end
	
	if player=="Nothere" then
		Sleep(50)
		delobj(So)
	end
	Setplot(OwnerID(),"range","LuaS_423537_K1",50)
end






--======================================================================================================
--423538
--======================================================================================================

function LuaS_423538_0()
	LoadQuestOption(OwnerID())
	if 	(CheckAcceptQuest(OwnerID(),423538)== true ) 	and
		Checkflag(OwnerID(),544381)== false				then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423538_0]","LuaS_423538_1",0)
		--不好意思，請你列舉袋中五樣物品。
		WriteRoleValue( OwnerID() , EM_RoleValue_PID ,0)
	end
end

function LuaS_423538_1()
	SetSpeakDetail(OwnerID(),"[SC_423538_1]")
	--不不，這是應該的，做事仔細一點總是不會有錯。
	
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423538_2]","LuaS_423538_2",0)
	--請說吧。

end


function LuaS_423538_2()
		if	ReadRoleValue( OwnerID() ,EM_RoleValue_PID ) == 0	then
			local N=RandRange(1,2)
			WriteRoleValue( OwnerID() , EM_RoleValue_PID , N )
				if 	ReadRoleValue( OwnerID() ,EM_RoleValue_PID ) == 1	then
					SetSpeakDetail(OwnerID(),"[SC_423538_3]")
					--袋子裡有一柄鑲著藍寶石的拆信小刀，紅晶項鍊，紫鑽戒指，玫瑰金王冠，綠寶石純金腰帶
				end
				
				if 	ReadRoleValue( OwnerID() ,EM_RoleValue_PID ) == 2	then
					SetSpeakDetail(OwnerID(),"[SC_423538_4]")
					--袋子裡有翡翠短梳、流金指環、瑪瑙手鏡、黑鑽吊墜、白金耳環、粉藍珍珠胸針
				end
		else
			CloseSpeak(OwnerID())
			ScriptMessage( OwnerID(), OwnerID(), 2,"[SC_423538_29]", 0 )	
			ScriptMessage( OwnerID(), OwnerID(), 0,"[SC_423538_29]", 0 )			
			--你還未與伊崔妮確認失主的答案是否正確
		end
end



function LuaS_423538_3()
	--掛在伊崔妮116227對話之下
	LoadQuestOption(OwnerID())
	if 	(CheckAcceptQuest(OwnerID(),423538)== true ) 		and
		Checkflag(OwnerID(),544381)== false					then
		if	ReadRoleValue( OwnerID() ,EM_RoleValue_PID ) ~= 0	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423538_5]","LuaS_423538_4",0)
			--我帶著他的答案回來了。
		else
			CloseSpeak(OwnerID())
			ScriptMessage( OwnerID(), OwnerID(), 0,"[SC_423538_30]", 0 )
			ScriptMessage( OwnerID(), OwnerID(), 2,"[SC_423538_30]", 0 )
			--你還未與失主確認他的答案。
		end
	end
end

function LuaS_423538_4()
	SetSpeakDetail(OwnerID(),"[SC_423538_6]")
	--你說吧，我來對照袋中是否有對應的物品。
		if	ReadRoleValue( OwnerID() ,EM_RoleValue_PID ) == 1	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423538_7]","LuaS_423538_5",0)
			--X藍寶石拆信小刀、雪鑽戒指......
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423538_8]","LuaS_423538_5",0)
			--X綠寶石拆信小刀、紫鑽戒指......
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423538_9]","LuaS_423538_5",0)
			--X綠寶石拆信小刀、雪鑽戒指......
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423538_10]","LuaS_423538_6",0)
			--Ｏ藍寶石拆信小刀、紫鑽戒指......
		end
		if	ReadRoleValue( OwnerID() ,EM_RoleValue_PID ) == 2	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423538_19]","LuaS_423538_5",0)
			--X瑪瑙吊墜、翡翠短梳......
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423538_20]","LuaS_423538_5",0)
			--X白金吊墜、翡翠短梳......
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423538_21]","LuaS_423538_8",0)
			--Ｏ黑鑽吊墜、翡翠短梳......*
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423538_22]","LuaS_423538_5",0)
			--X白金吊墜、瑪瑙短梳......
		end
end		
	
function LuaS_423538_5()
	SetSpeakDetail(OwnerID(),"[SC_423538_18]")
	--似乎不太對，你再去確認一次。
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 )
end

function LuaS_423538_6()
	SetSpeakDetail(OwnerID(),"[SC_423538_11]")
	--嗯，還有呢？
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423538_12]","LuaS_423538_5",0)
			--X藍寶石純金腰帶、紫晶項鍊、玫瑰紅王冠。
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423538_13]","LuaS_423538_5",0)
			--X藍冰晶純金腰帶、 紫晶項鍊、玫瑰紅王冠。
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423538_14]","LuaS_423538_5",0)
			--X綠冰晶純金腰帶、紫晶項鍊、玫瑰金王冠。
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423538_15]","LuaS_423538_5",0)
			--X綠冰晶純金腰帶、紅晶項鍊、玫瑰金王冠。
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423538_16]","LuaS_423538_7",0)
			--Ｏ綠寶石純金腰帶 、紅晶項鍊、玫瑰金王冠。
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423538_17]","LuaS_423538_5",0)
			--X藍寶石純金腰帶、紅晶項鍊、玫瑰紅王冠。
end

function LuaS_423538_8()
	SetSpeakDetail(OwnerID(),"[SC_423538_11]")
	--嗯，還有呢？
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423538_23]","LuaS_423538_5",0)
			--X白金指環、粉紅珍珠胸針、瑪瑙手鏡、流金耳環。
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423538_24]","LuaS_423538_7",0)
			--Ｏ流金指環、粉藍珍珠胸針、瑪瑙手鏡、白金耳環。
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423538_25]","LuaS_423538_5",0)
			--X白金指環、粉紅珍珠袖扣、翡翠手鏡、流金耳環。
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423538_26]","LuaS_423538_5",0)
			--X流金指環、粉紅珍珠袖扣、翡翠手鏡、白金耳環。
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423538_27]","LuaS_423538_5",0)
			--X白金指環、粉藍珍珠胸針、瑪瑙手鏡、流金耳環。
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423538_28]","LuaS_423538_5",0)
			--X流金指環、粉紅珍珠胸針、瑪瑙手鏡、白金耳環。
end


function LuaS_423538_7()
	SetSpeakDetail(OwnerID(),"[SC_423538_31]")
	--嗯，正確無誤，看來他的確是失主。
	SetFlag(OwnerID(),544381,1)
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 )
end

--======================================================================================================
--423539任務後劇情
--======================================================================================================
function LuaS_423539_0()
	--Say(OwnerID(),"I'm O")
	--Say(TargetID(),"I'm T")
	DisableQuest(OwnerID(), true )
	AddBuff(TargetID(),507542,1,600)
		local Pu= LuaFunc_CreateObjByObj( 116363 , OwnerID() )	
		Hide(Pu)
		Show(Pu,0)
		WriteRoleValue(Pu, EM_RoleValue_IsWalk, 0)
		local Cu= Lua_DW_CreateObj("flag" ,116364,780737,1)
		Hide(Cu)
		local No= Lua_DW_CreateObj("flag" ,116365,780737,2)
		Hide(No)
		local Tu= Lua_DW_CreateObj("flag" ,116366,780737,3)
		Hide(Tu)
		DisableQuest(Pu, true )
		DisableQuest(Cu, true )
		DisableQuest(No, true )
		DisableQuest(Tu, true )
			ScriptMessage( TargetID(), TargetID(), 0,"[SC_423539_0]", 0 )
			ScriptMessage( TargetID(), TargetID(), 2,"[SC_423539_0]", 0 )
			--突然，遠處傳來急促的叫罵聲！
			Beginplot(Cu,"LuaS_423539_1",0)
			Beginplot(No,"LuaS_423539_2",0)
			PlayMotion(Pu,ruFUSION_ACTORSTATE_EMOTE_AMAZED)
			WriteRoleValue(Pu, EM_RoleValue_IsWalk, 0)
			Sleep(20)
			DW_MoveToFlag(Pu,780737,6,0,1)
			Beginplot(Tu,"LuaS_423539_3",0)
			Delobj(Pu)
			Yell(Cu,"[SC_423539_2]",1)
			--又讓那"沒有尾巴"的騙子跑了，該死的！
			Sleep(30)
			Yell(Tu,"[SC_423539_3]",1)
			--克敏頓生媽媽的氣嗎？媽媽又惹克敏頓生氣了嗎？]
			Sleep(30)
			PlayMotion(Tu,ruFUSION_ACTORSTATE_EMOTE_CRY)
			DW_MoveToFlag(Tu,780737,8,0,1)
				--SetFlag(TargetID(),544382,1)
				Delobj(Cu)
				Delobj(NO)
				Delobj(Tu)
			
	CancelBuff( TargetID()  , 507542 )	
	DisableQuest(OwnerID(), false )
end

function LuaS_423539_1()
	Show(OwnerID(),0)
	WriteRoleValue(OwnerID(), EM_RoleValue_IsWalk, 0)
	Yell(OwnerID(),"[SC_423539_1]",2)	
	--該死的騙子、欠揍的小偷，你別跑！
	DW_MoveToFlag(OwnerID(),780737,4,0,1)
end

function LuaS_423539_2()
	Show(OwnerID(),0)
	WriteRoleValue(OwnerID(), EM_RoleValue_IsWalk, 0)
	DW_MoveToFlag(OwnerID(),780737,5,0,1)
end

function LuaS_423539_3()
	Show(OwnerID(),0)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_AMAZED)
	DW_MoveToFlag(OwnerID(),780737,7,0,1)

end


function LuaS_423540_0()
	SetPlot( OwnerID(),"range","LuaS_423540_1",200 )
end

function LuaS_423540_1()
	if 	(CheckCompleteQuest(OwnerID(),423539)== true ) 		and
		Checkflag(OwnerID(),544382)==false					then
			SetFlag(OwnerID(),544382,1)
	end
end


























