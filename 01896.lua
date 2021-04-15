
--======================================================================================================

function LuaI_s7_207449()	--常春蕨的葉子
	Beginplot(TargetID(),"LuaI_s7_207449_1",0)
end

function LuaI_s7_207449_1()
	if	(CountBodyItem(TargetID(),207448))>0 then
		GiveBodyItem( TargetID() , 207447 , 1 )
		ScriptMessage(  TargetID()   , TargetID()    , 0 , "[SC_207447_0]" , 0 )		--你用[207449]將這把[207448]束綁成美麗的花束。
		UseItemDestroy()			--模版中要勾選_可消耗_，此指令可刪除使用中的物品，最好放在給了新物品之後，這樣才不會有舊物用掉，新物卻未入袋的窘況。
		DelBodyItem(TargetID(),207448,1)
	else
		ScriptMessage(  TargetID()   , TargetID()    , 0 , "[SC_207447_1]" , 0 )		--你需要[207448]。	
	end
end


--================================點地圖上3d物件，開啟任務======================================================================

--(1)先有觸碰劇情
function Lua_BeginCastBar_423377()--觸碰劇情115623
	SetPlot( OwnerID(),"touch","Lua_BeginCastBar_423377_1",30 )

end


--(2)執行BeginCastBar判斷
function Lua_BeginCastBar_423377_1() --
	local O_ID = OwnerID() 		-- 玩家
	local T_ID = TargetID()  	-- NPC

	DW_CancelTypeBuff(68,O_ID)
	--DW_CancelTypeBuff(BuffTypeNum,ObjID)
		--BuffTypeNum 輸入想解除的buff 類型
	--68 騎乘
	--58 變身
	--ObjID 輸入想解除的目標  若不填 預設為 OwnerID()
	--填1 則預設為 TargetID()

	if 	BeginCastBarEvent( O_ID, T_ID,"[SC_423377_OPEN]", 50, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "Lua_BeginCastBar_423377_2" ) ~= 1 then
		ScriptMessage( O_ID, O_ID, 0,"[SAY_NPC_BUSY]", 0 );		--目標忙碌中

	end
end


--(3)執行BeginCastBar後之結果

function Lua_BeginCastBar_423377_2(ObjID, CheckStatus)   -- <---() 內 參數一定要有
	local O_ID = OwnerID() 	-- 玩家
	local T_ID = TargetID()  	-- NPC





	if	CheckAcceptQuest(OwnerID(),423377)==false then
		if( CheckStatus ~= 0 ) then
			if( CheckStatus > 0 ) then
				-- 成功
				EndCastBar( O_ID, CheckStatus );
				DW_Border(423377)  	
			else
				-- 失敗
				EndCastBar( O_ID, CheckStatus );	
			end
		end
	end	
end			

--======================================================================================================

function LuaS_423376_END0()	--放在任務423376任務結束後 
	ScriptMessage(OwnerID(), TargetID() , 1 , "[SC_423376_E0]" , 0 )
	ScriptMessage(OwnerID(), TargetID() , 0 , "[SC_423376_E0]" , 0 )
	--鏮鏘！
	Sleep(20)
	ScriptMessage(OwnerID(), TargetID() , 1 , "[SC_423376_E1]" , 0 )
	ScriptMessage(OwnerID(), TargetID() , 0 , "[SC_423376_E1]" , 0 )
	--(一個空酒瓶飛進來，險之又險的沒砸到你)
	Sleep(30)
	ScriptMessage(OwnerID(), TargetID() , 2 , "[SC_423376_E2]" , 0 )
	ScriptMessage(OwnerID(), TargetID() , 0 , "[SC_423376_E2]" , 0 )
	--(酒瓶裡頭似乎有東西，你應該檢視一下這個酒瓶)
end

function LuaS_423376_1()
	SetSpeakDetail(OwnerID(),"[SC_423376_1]")
	--不，其實有一位比我更有希望勝出，他的名字是夏畢洛，只是今日他在第一輪比賽中受了重傷，已經無法繼續參加角逐。
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423376_2]","LuaS_423376_2",0)
	--「這對你來說是件好事啊。」
end

function LuaS_423376_2()
	SetSpeakDetail(OwnerID(),"[SC_423376_3]")
	--無法與敬重的對手正面比試，我不知道好在哪裡。
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423376_4]","LuaS_423376_3",0)
	--「不用說的這麼明白吧？失去最大的對手，勝利已在你手。」
end

function LuaS_423376_3()
	SetSpeakDetail(OwnerID(),"[SC_423376_5]")
	--我聽的出來你拐著彎暗指什麼，夏畢洛在這個時刻受傷，怎麼看，都是我的嫌疑最大，不過我不會退出角逐，讓真兇得償所願。
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423376_6]","LuaS_423376_4",0)
	--「真兇？你是說夏畢格的確被人所害，你知道是誰？」
end

function LuaS_423376_4()
	SetFlag(OwnerID(),544235,1)
	CloseSpeak( OwnerID() )
end



--(1)這是對話頁面引發的劇情表演
function Lua_423377_0()
	LoadQuestOption(OwnerID())
	if 	CheckAcceptQuest(OwnerID(),423376)==true 	and
		CheckCompleteQuest(OwnerID(),423376)==false	and
		Checkflag ( OwnerID(), 544235 )	==false		then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423376_0]","LuaS_423376_1",0)
		--「聽說貴國此次角逐大獵手，你的呼聲最高。」
	end
	
	if 	CheckAcceptQuest(OwnerID(),423377)==true 	and
		Checkflag ( OwnerID(), 544236 )	==false		then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423377_5]","LuaS_423377_1",0)
	end

end

--(2)在最後一句對話，即開啟劇情演出前，呼叫檢查掛演出的npc是否忙碌的function
function LuaS_423377_1()
	SetSpeakDetail(OwnerID(),"[SC_423377_0]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423377_1]","LuaS_423377_CheckBusy",0)
end

--(3)檢查掛演出的npc是否忙碌的function，以pid為判斷值，呼叫劇情演出function
function LuaS_423377_CheckBusy()	--判斷掛劇情演出的npc是否忙碌中，如果不忙則演出劇情，忙則送他一句話，請他等待，掛在連接演出script的當段函式
--Say(OwnerID(),"0..01")
--Say(TargetID(),"T..T1")

	if	ReadRoleValue( TargetID() ,EM_RoleValue_PID ) == 0	then
		writerolevalue( TargetID() , EM_RoleValue_PID , 1 )
		BeginPlot( TargetID() , "LuaS_423377_2" , 0 )
		CloseSpeak( OwnerID() )
	else
		SetSpeakDetail(OwnerID(),"[GATHER_MSG_OBJBUSY]")			--目標正在忙碌中。
	end
end


--(4)劇情演出script
function LuaS_423377_2()
	DisableQuest( OwnerID() , true )
	--一定要關上掛劇情演出的對話
--Say(OwnerID(),"0..02")
--Say(TargetID(),"T..T2")

	WriteRoleValue ( OwnerID() , EM_RoleValue_Register4 , TargetID() )
	--配合(5)的判斷
	AddBuff( TargetID()  , 506979 , 1 , 300 )	--做玩家是否離場的判斷buff
	--配合(5)的判斷給buff
	Beginplot(OwnerID(),"LuaS_423377_PlayerCHECK",0)
	--在此掛上(5)，將與劇情演出同步執行，每2秒檢查一次
	
		Local X = ReadRoleValue(OwnerID(),EM_RoleValue_X)
		Local Y = ReadRoleValue(OwnerID(),EM_RoleValue_Y)
		Local Z = ReadRoleValue(OwnerID(),EM_RoleValue_Z)
	
	local bcat1 = Lua_DW_CreateObj("flag" ,115743,780660,1)
	local bcat2 = Lua_DW_CreateObj("flag" ,115743,780660,1)
	DisableQuest( bcat1 , true )	--種出的npc同樣關上對話
	DisableQuest( bcat2 , true )
	--SetDefIdleMotion(bcat1,ruFUSION_MIME_ATTACK_BOW_SP_LOOP)
	--SetDefIdleMotion(bcat2,ruFUSION_MIME_ATTACK_BOW_SP_LOOP)
	Hide(bcat1)
	Show(bcat1,0)
	Hide(bcat2)
	Show(bcat2,0)
	Sleep(20)
	WriteRoleValue(bcat1, EM_RoleValue_IsWalk, 1)
	WriteRoleValue(bcat2, EM_RoleValue_IsWalk, 1)
	Yell(OwnerID(),"[SC_423377_2]",1)
	Sleep(30)
	BeginPlot(bcat1,"LuaS_423377_3",0)
	DW_MoveToFlag(bcat2,780660,3,0,1)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Adjustfacedir(OwnerID(),bcat1,0)
	Adjustfacedir(bcat1,OwnerID(),0)
	Adjustfacedir(bcat2,OwnerID(),0)

	PlayMotion(bcat2,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell(bcat2,"[SC_423377_3]",1)		--"庫克薩，在準備第二輪比賽啊？"
	Sleep(30)
	BeginPlot(bcat2,"LuaS_423377_6",0)
	PlayMotion(bcat1,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell(bcat1,"[SC_423377_4]",1)		--"我看，你還是別忙了，退出大獵手角逐賽吧！"
	Sleep(30)
	PlayMotion(OwnerID(),ruFUSION_MIME_EMOTE_POINT)
	Yell(OwnerID(),"[SC_423377_6]",1)	--"你們這些雜碎欠缺的是教訓！"
	BeginPlot(bcat1,"LuaS_423377_6",0)
	Sleep(30)
	DW_MoveToFlag(OwnerID(),780660,5,0,1)
	Adjustfacedir(OwnerID(),bcat1,0)
	Adjustfacedir(bcat1,OwnerID(),0)
	Adjustfacedir(bcat2,OwnerID(),0)
	if 	CheckAcceptQuest(TargetID(),423377)==true then		--判斷玩家是否仍在任務中，是則繼續執行劇情
		--Say(OwnerID(),"0..03")
		--Say(TargetID(),"T..T3")
		CastSpell(OwnerID(),bcat1,495235)
		--PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_ANGRY)	--打鬥
		
		Hide(bcat1)
		Show(bcat1,0)
		Hide(bcat2)
		Show(bcat2,0)
	
		Sleep(20)
		
		WriteRoleValue(bcat1, EM_RoleValue_IsWalk, 0)
		WriteRoleValue(bcat2, EM_RoleValue_IsWalk, 0)
		
		BeginPlot(bcat1,"LuaS_423377_4",0)
		Sleep(10)
		CastSpell(OwnerID(),bcat1,495235)		--打鬥，在模版中，效果範圍可設大一點，因為是演戲用，故有效類型選所有怪物
		Sleep(30)
		
		PlayMotion(bcat2,ruFUSION_ACTORSTATE_EMOTE_AMAZED)		--搖手	
		Yell(bcat2,"[SC_423377_7]",1)	--別打、別打，我們這就走。
		Sleep(30)
		BeginPlot(bcat2,"LuaS_423377_5",0)
		
	else
		Move(OwnerID(),X,Y,Z)
		DW_MoveToFlag(OwnerID(),780660,6,0,1)
		Delobj(bcat1)
		Delobj(bcat2)
		writerolevalue( OwnerID() , EM_RoleValue_PID , 0 )	
		--因為在判斷函式裡LuaS_423377_CheckBusy裡設為1
		DisableQuest( OwnerID() , false )
		
	end 
		
	if 	CheckAcceptQuest(TargetID(),423377)==true  then
		--Say(OwnerID(),"0..05")
		--Say(TargetID(),"T..T5")
		SetFlag( TargetID(), 544236, 1 )
	end
	Move(OwnerID(),X,Y,Z)
	DW_MoveToFlag(OwnerID(),780660,6,0,1)
	Sleep(50)
	Delobj(bcat1)
	Delobj(bcat2)
	writerolevalue( OwnerID() , EM_RoleValue_PID , 0 )	--因為在判斷函式裡LuaS_423377_CheckBusy裡設為1
	DisableQuest( OwnerID() , false )	
	
end

	
function LuaS_423377_3()
	DW_MoveToFlag(OwnerID(),780660,2,0,1)
end

function LuaS_423377_4()
	SetDefIdleMotion(OwnerID(),ruFUSION_MIME_DAZED	)
	Sleep(20)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_FEAR)	--打退pose
	Sleep(30)

	DW_MoveToFlag(OwnerID(),780660,4,0,1)
	Hide(OwnerID())
end

function LuaS_423377_5()
	DW_MoveToFlag(OwnerID(),780660,4,0,1)
	Hide(OwnerID())
end
	
function LuaS_423377_6()	
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_THINK)
end
	
	
--(5)檢查玩家是否仍在任務中，以buff為判斷標準，配合client，如：有此buff可看見的演戲npc/無此buff則隱藏的發任務npc
--		但此次任務的發任務npc(即ownerid)不做client
function LuaS_423377_PlayerCHECK()
	local Player = ReadRoleValue(OwnerID(),EM_RoleValue_Register4 )	
--Say(OwnerID(),"0..0check")
--Say(TargetID(),"T..Tcheck")
		for i = 0 , 100 , 1 do
			if	CheckAcceptQuest( Player, 423252 )==false		and	
				CheckBuff( Player , 506979) == true				then
				break
			end
			if	CheckBuff( Player , 506979) == false		then
				break
			end
			sleep( 20 )
		end
		CancelBuff( Player  , 506979  )	
end
	



--===============================點地圖上3d物件，開啟任務======================================================================

--(1)先有觸碰劇情
function Lua_BeginCastBar_423379()--觸碰劇情115623
	SetPlot( OwnerID(),"touch","Lua_BeginCastBar_423379_1",30 )

end


--(2)執行BeginCastBar判斷
function Lua_BeginCastBar_423379_1() --
	local O_ID = OwnerID() 		-- 玩家
	local T_ID = TargetID()  	-- NPC
	if	CheckAcceptQuest(O_ID,423379)==true 	and
		Checkflag(O_ID,544237)== false 		then
		if 	BeginCastBarEvent( O_ID, T_ID,"[SC_423379_6]", 50, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "Lua_BeginCastBar_423379_2" ) ~= 1 then
			ScriptMessage( O_ID, O_ID, 0,"[SAY_NPC_BUSY]", 0 );		--目標忙碌中

		end
	end
end


--(3)執行BeginCastBar後之結果
function Lua_BeginCastBar_423379_2(ObjID, CheckStatus)   -- <---() 內 參數一定要有
	local O_ID = OwnerID() 	-- 玩家
	local T_ID = TargetID()  	-- NPC

	
		if( CheckStatus ~= 0 ) then
			if( CheckStatus > 0 ) then
				-- 成功
				EndCastBar( O_ID, CheckStatus );
				Beginplot(T_ID,"Lua_423379_0",0) 	
			else
				-- 失敗
				EndCastBar( O_ID, CheckStatus );	
			end
		end
	
end			

--(4)執行呼叫怪的script，OwnerID是NPC
function Lua_423379_0()
	local Boca  = Lua_DW_CreateObj("flag" ,103977,780674,1)	

	DisableQuest(OwnerID(), true )
	DisableQuest(Boca, true )
	Yell(Boca,"[SC_423379_7]",2)
	PlayMotion(Boca,ruFUSION_ACTORSTATE_EMOTE_ANGRY)
	--喂！你破壞了我的陷阱？去死吧！
	Sleep(30)
	SetAttack(Boca  , TargetID())
	local player="here"
	local Monster="NotDead"
	local MonID="true"
	local quest="in"
	
		while 1 do
			if 	CheckAcceptQuest(TargetID(),423379)== false			then
				quest="out"
				break
			end
			
			if	ReadRoleValue(TargetID() , EM_RoleValue_IsDead)==1 	or
				CheckID(TargetID()) == false	or
				GetDistance( TargetID(), OwnerID()) >500 	then
				player="Nothere"
				break	
			end
			
			if 	(ReadRoleValue(Boca, EM_RoleValue_IsDead)==1 or  CheckID(Boca)== false)		then
				Monster="IsDead"
				break
			end
			Sleep(10)
		end
		
		if quest=="out" then
			SetStopAttack(Boca)
			Sleep(30)
			Delobj(Boca)
		end
		
		if player=="Nothere" then
			
			ScriptMessage(OwnerID(), TargetID() , 1 , "[SC_423379_8]" , 0 )		--任務失敗，請放棄重接
			ScriptMessage(OwnerID(), TargetID() , 0 , "[SC_423379_8]" , 0 )		--任務失敗，請放棄重接
			Sleep(30)
			ScriptMessage(OwnerID(), TargetID() , 1 , "[SC_423379_8]" , 0 )		--任務失敗，請放棄重接
			ScriptMessage(OwnerID(), TargetID() , 0 , "[SC_423379_8]" , 0 )		--任務失敗，請放棄重接
			SetStopAttack(Boca)
			Sleep(30)
			Delobj(Boca)	
		end
		
		if  (CheckAcceptQuest(TargetID(),423379)== true ) 		and
			(CheckCompleteQuest(TargetID(),423379)==  false)  	and
			(CheckAcceptQuest(TargetID(),423380)== false)		and 
			Checkflag(OwnerID(),544237)== false 		then
			if	Monster=="IsDead" or MonID=="false" then
				SetFlag(TargetID(), 544237, 1 )			--給任務完成旗標 
				Yell(Boca,"[SC_112077_OD_3]",1)
				Sleep(30)
				Yell(Boca,"[SC_423379_0]",1)		
				--好痛......[115627]你怎麼還活...著，我不是......殺了你嗎？
				ScriptMessage(OwnerID(), TargetID() , 2 , "[SC_423379_1]" , 0 )
				ScriptMessage(OwnerID(), TargetID() , 0 , "[SC_423379_1]" , 0 )
				--（[115581]渾濁的眼望著你，像是透過你看到枉死的[115627]......)
				Sleep(40)
				ScriptMessage(OwnerID(), TargetID() , 2 , "[SC_423379_2]" , 0 )
				ScriptMessage(OwnerID(), TargetID() , 0 , "[SC_423379_2]" , 0 )
				-- (最後，他不解的在血污中吐出最後一口氣。)
				Sleep(40)
				
				Sleep(40)

			end
		end
		DisableQuest( OwnerID() , false )
		--Delobj(Boca)	

end

function Lua_423379_1()	--掛在蒂魁雅的speak下
	LoadQuestOption(OwnerID())
	if 	CheckAcceptQuest(OwnerID(),423379)==true 		and
		CheckCompleteQuest(OwnerID(),423379)==false		and
		Checkflag(OwnerID(),544237)== false 		then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422871_12]","Lua_423379_2",0)
		--我答應你。
	end
end

function Lua_423379_2()
	SetSpeakDetail(OwnerID(),"[SC_423379_3]")
	--謝謝你。我們[115599]認為，親人死去的三日內，若能寸步不離陪在身邊，他永恆不滅的部份將會獲得極至的平靜。為了[115627]，我會待在這裡守著他，但是我的心不停的積蓄著仇恨的毒液，恨不得能手刃那小人，只要一想到他正參與第二輪的大獵手角逐賽，我就痛苦不堪，[$playername]，請你去殺了[115581]，將代表他的角逐資格的護符拿回來，解除我心

	AddSpeakOption(OwnerID(),TargetID(),"[SC_423379_4]","Lua_423379_3",0)
	--我要怎麼找到他？
end

function Lua_423379_3()
	SetSpeakDetail(OwnerID(),"[SC_423379_5]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423192_7]","Lua_423379_4",0)
end

function Lua_423379_4()
	CloseSpeak( OwnerID() )
end






	