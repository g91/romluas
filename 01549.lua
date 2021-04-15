function LuaS_113467_0()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 420945 ) == true then
		AddSpeakOption(  OwnerID(), TargetID( ), "[SC_113467_A00]",  "LuaS_113467_A1",  0 ) --聽[ZONE_TITANS HILL]的傳說
	end
	if CheckAcceptQuest( OwnerID() , 420948 ) == true then
		AddSpeakOption(  OwnerID(), TargetID( ), "[SC_113467_B00]",  "LuaS_113467_B1",  0 ) --詢問關於火之族的事情
	end
end

function LuaS_113468_0()
	LoadQuestOption( OwnerID() )
	if CheckCompleteQuest( OwnerID() , 420944 ) == false and CountBodyItem( OwnerID() , 205946 ) == 0 then
		AddSpeakOption(  OwnerID(), TargetID( ), "[SC_113468_0]",  "LuaS_113468_1",  0 ) --檢查是什麼東西在發光
	end
end

function LuaS_113468_1()
	CloseSpeak( OwnerID() )
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_113468_1]" , C_SYSTEM ) --你從沙塵中撿起一個[205946]
	GivebodyItem( OwnerID() , 205946 , 1 )
end

function LuaS_113467_A1()
	SetSpeakDetail( OwnerID(),"[SC_113467_A01]")
	--那是很久很久之前的事情，那個時候[ZONE_THE GREAT BARRIER]的神秘力量阻擋了蛇人越過[ZONE_DAEMONS MOUTH]，使我們能夠在這塊土地上生存著，那個時候我們的族人能夠安全地生活在地面上，附近有著豐富的草木與獵物，融岩只在[ZONE_DAEMONS MOUTH]內流動。

	--但直到有一天，巨神來了，一切就改變了。

	AddSpeakOption(  OwnerID(), TargetID( ), "[SC_113467_A02]",  "LuaS_113467_A2",  0 ) --詢問巨神是什麼
end

function LuaS_113467_A2()
	SetSpeakDetail(OwnerID(),"[SC_113467_A03]")
	--巨神就是你看到[ZONE_TITANS HILL]上遺留的那些巨大石像。

	--它們是活著的石像，有著靈魂以及巨大的力量，它們是來清除這塊地方殘存的罪惡，追蹤著過去惡魔們留下的足跡而來。

	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113467_A04]",  "LuaS_113467_A3",  0 ) --詢問什麼是殘存的罪惡
end

function LuaS_113467_A3()
	SetSpeakDetail(OwnerID(),"[SC_113467_A05]")
	--你們外來者看來並不知道這個世界的過去。

	--過去，這個世界有著一場人類和其盟友對抗著惡魔的戰爭，在依格儂，統治著這塊陸地的惡魔最後的堡壘就在此處，人們雖然摧毀了堡壘以及惡魔，但此地的邪惡卻無法根除，所以只好建造了[[ZONE_THE GREAT BARRIER]]，將所有邪惡封印在這塊土地上。

	--我們的祖先就是為了確保[ZONE_THE GREAT BARRIER]的建立而留在此處，阻擋著邪惡軍團的英雄。

	--對了，我剛剛說到哪了？

	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113467_A06]",  "LuaS_113467_A4",  0 ) --回到巨神的話題
end

function LuaS_113467_A4()
	SetSpeakDetail(OwnerID(),"[SC_113467_A07]")
	--喔！巨神，它們來這裡找尋過去惡魔留下的力量而來，它們要將那些力量封印起來，避免邪惡再次復甦。

	--不過巨神們不知道這裡有一頭沉睡的火龍，巨神們無意間驚醒了牠，牠的憤怒將岩漿從地表喚醒，火之族從牠的力量中出現，植物因此乾枯，獵物也遭受焚燒，巨神們則被源源不絕的火之族所吞噬。

	--我們的祖先因為躲在地下而逃過了一劫，後來祖先們離開洞穴，看到的只剩下一片焦土以及巨神們散落的遺骸，就連[ZONE_DAEMONS MOUTH]對面的蛇人也完全失去了蹤跡。

	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113467_A08]",  "LuaS_113467_A5",  0 ) --詢問火龍的事
end

function LuaS_113467_A5()
	SetSpeakDetail(OwnerID(),"[SC_113467_A09]")

	--這條火龍是瘋狂的，牠不顧一切的釋放力量，不是為了打敗敵人，也不是為了保護自己，單純是為了破壞，為了釋放自己心中的怒氣。
	--火龍的力量不斷從牠的體內釋放出來，大地上到處遍布了火焰。
	--最後，牠耗盡了所有的力量，墜落在[ZONE_TOWER OF RAGE]的附近，對了！就是你們所說的......[ZONE_GESTEROS SHRINE]。
	--但牠的力量仍留在這塊大地，那些灼熱的熔岩就是牠的血液，尖銳的黑色岩石就是牠的鱗片。

	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113467_A10]",  "LuaS_113467_A6",  0 ) --詢問火之族的事
end

function LuaS_113467_A6()
	SetSpeakDetail(OwnerID(),"[SC_113467_A11]")

	--火之族，出現之後就沒有再回到地底，現在仍統治著融岩，你甚至可以在[ZONE_DAEMONS MOUTH]看見它們的蹤跡，你們稱它們為炎魔。
	--為了生存，我們族人後來學會與火之族相處的方法，我們向它們表示敬畏，而它們則告訴我們在這塊大地生存的知識。
	--由於龍的怒火還在它們體內燃燒，因此它們仍期待戰鬥。
	--但它們根本不削一顧你們與蛇人的戰爭，只有強大的敵人才能滿足它們破壞的渴望。

	if CheckAcceptQuest( OwnerID() , 420945 ) == true then
		SetFlag( OwnerID() , 543312 , 1 )
	end

end

function LuaS_113467_B1()
	SetSpeakDetail(OwnerID(),"[SC_113467_B01]")
	--你想問火之族為何會襲擊你們的人吧......
	--火之族本來就是掌管破壞的力量，它們本來就既好戰又危險。
	--但只要不侵犯它們的領域，多半不會受到攻擊，甚至只要對它們表示敬畏，它們還會傳授你知識，教你如何避開危險。
	--不過就算它們會襲擊人，我也從沒聽說過它們會奪取物品......因為物品對它們來說沒有意義，所有東西最終都會在它們手中熔化。
	--而且我也不認為火之族是受到其他人的指使，它們誕生於龍火之中，有著龍的驕傲，不可能甘於被指揮。
	--嗯......或許只有實際詢問火之族才知道它們為什麼要這麼做。
	--能與火之族溝通的方法只有兩個，一個是火之族召喚你，你經由火之族的通道到達它們的領地。
	--另一個就是透過巫醫坎雅以及她的儀式召喚火之族的使者到來。
	--用其他方式遇到火之族，它們只會將你燒成焦炭......
	--
	--如果你們能找到巫醫坎雅並說服她舉行儀式，說不定有機會得到你們想要的答案。
	if CheckAcceptQuest( OwnerID() , 420948 ) == true then
		SetFlag( OwnerID() , 543314 , 1 )
	end
end

function LuaI_113467_SPEAK()
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , DW_Rand(3) )
end

function LuaS_113467_SPEAK()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 420948 ) == true then
		AddSpeakOption(  OwnerID(), TargetID( ), "[SC_113467_B00]",  "LuaS_113467_B2",  0 ) --詢問關於火之族襲擊人的事情
	end
end

function LuaS_113467_B2()
	local Str = {"[SC_113467_B02]" , "[SC_113467_B03]" , "[SC_113467_B04]"}
	local PID = ReadRoleValue( TargetID() , EM_RoleValue_PID )
	--火之族？它們是[ZONE_DAEMONS MOUTH]的住民，只要不靠近就不會受到攻擊......難道你們這些外來者不知道嗎？我們遇到不知道的事情都會去找長老學習，或許你們也應該學著向長者學習才對。
	--村長說火之族是我們的盟友，但如果我們侵犯了它們的領域，它們就會變成敵人，所以我們被禁止太接近火之族的領地......詳細的情形你問長老可能會比較清楚。
	--火之族很恐怖的！雖然長老說它們是我們的盟友，但它們真的好恐怖啊！就連蛇人也會畏懼它們呢！
	SetSpeakDetail(OwnerID(), Str[PID])
end

function LuaI_113468_0()
	SetModeEX( OwnerID() , EM_SetModeType_ShowRoleHead , false )	
	SetCursorType( OwnerID() , 37)
	AddBuff( OwnerID() , 502840 , 1 , -1 )	
end

function LuaI_113492_0()
	SetModeEX( OwnerID() , EM_SetModeType_ShowRoleHead , false )
	SetCursorType( OwnerID() , 37)
	AddBuff( OwnerID() , 504345 , 1 , -1 )
	AddBuff( OwnerID() , 504098 , 1 , -1 )
end

function LuaI_113495_0()
	AddBuff( OwnerID() , 504345 , 1 , -1 )
	local Me = Role:new( OwnerID() )
	local Auro = CreateObj( 113531 , Me:X() , Me:Y() , Me:Z() , Me:Dir() , 1 )
	Lua_ObjDontTouch( Auro ) 
	AddToPartition( Auro , 0 )
end

function LuaS_113455_SUEZ_0()
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+9 , 0 ) --初始化玩家身上的暫存值

	SetSpeakDetail(OwnerID(), "[SC_113455_SUEZ_01]") 
	--關於炎魔我們所知的不多，不過它們是與火有關的元素生物這點是無庸置疑的。
	--因為我們的目標是蛇人，因此對於這些元素生物我們採取人不犯我，我不犯人的準則，盡量與它們保持距離。
	--嗯.......
	--這次的事件中，我的斥候在索雷爾頓研究地點潛伏時得到了他們重要的研究材料，而後就在[ZONE_INFERNAL GATE]附近遭到炎魔攻擊。
	--後來就像你知道的，東西被奪走，而我的斥候受了重傷。
	--如果是我的斥候侵犯到炎魔的領地而受到攻擊，那還容易解釋，但這邊有幾個疑點。
	--第一，過去沒有過[ZONE_INFERNAL GATE]附近有出現炎魔的報告，我們的人之前也常常經過這條路，並沒有發生過類似的事情。
	--第二，如果真的是侵犯到炎魔的領地，那應該只有人會受傷，沒有道理東西也被搶走，這與之前所知的情報不符。
	--關於這個事件你有什麼想法？
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113455_SUEZ_02]",  "LuaS_113455_SUEZ_1",  0 ) --表達意見
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113455_SUEZ_03]",  "LuaS_113455",  0 ) --沒有特別的想法
end

function LuaS_113455_SUEZ_1()
	SetSpeakDetail(OwnerID(), "[SC_113455_SUEZ_04]") --你的意見是？
	local Check = ReadRoleValue( OwnerID() , EM_RoleValue_Register+9 )
	if Check - 10*math.floor( Check / 10 ) < 1 then
		AddSpeakOption(OwnerID(), TargetID( ), "[SC_113455_SUEZ_05]",  "LuaS_113455_SUEZ_2",  0 ) 
		--意見：炎魔的領地正在擴張
	end
	if Check - 100*math.floor( Check / 100 ) < 10 then
		--意見：炎魔的主要目的是取得那個研究材料
		AddSpeakOption(OwnerID(), TargetID( ), "[SC_113455_SUEZ_06]",  "LuaS_113455_SUEZ_3",  0 ) 
	end
	if Check - 1000*math.floor( Check / 1000 ) < 100 then
		AddSpeakOption(OwnerID(), TargetID( ), "[SC_113455_SUEZ_07]",  "LuaS_113455_SUEZ_4",  0 ) 
		--意見：炎魔受到索雷爾頓的操控
	end
	if Check - 10000*math.floor( Check / 10000 ) < 1000 then
		AddSpeakOption(OwnerID(), TargetID( ), "[SC_113455_SUEZ_08]",  "LuaS_113455_SUEZ_5",  0 ) 
		--意見：某個未知的人物指使炎魔襲擊斥候
	end
	if Check - 100000*math.floor( Check / 100000 ) < 10000 then
		AddSpeakOption(OwnerID(), TargetID( ), "[SC_113455_SUEZ_09]",  "LuaS_113455_SUEZ_6",  0 ) 
		--意見：炎魔的行為因為某些原因發生異變
	end
	if (Check - 100*math.floor( Check / 100 ) >= 10) and (Check - 10000*math.floor( Check / 10000 ) >= 1000) then
		AddSpeakOption(OwnerID(), TargetID( ), "[SC_113455_SUEZ_10]",  "LuaS_113455_SUEZ_7",  0 ) 
		--意見：應該先蒐集更多關於這個區域炎魔的情報
	end
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113455_SUEZ_11]",  "LuaS_113455_SUEZ_0",  0 ) --重新聽取情報
end

function LuaS_113455_SUEZ_2()
	SetSpeakDetail(OwnerID(), "[SC_113455_SUEZ_13]") 
	--炎魔的領地正在擴張......
	--這一點雖然不是不可能，但這無法解釋為何它們除了攻擊人以外還搶走了那個研究材料。
	AddRoleValue( OwnerID() , EM_RoleValue_Register + 9 , 1 )
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113455_SUEZ_12]",  "LuaS_113455_SUEZ_1",  0 ) --重新思考
end

function LuaS_113455_SUEZ_3()
	SetSpeakDetail(OwnerID(), "[SC_113455_SUEZ_14]") 
	--我也是這麼認為！
	--不過根據情報，那個研究材料似乎是索雷爾頓從這裡的古老石像身上取下的。
	--我不明白炎魔需要這個研究材料做什麼？
	--或許這個東西上面有什麼秘密，但既然已經被奪走了，現在我們也不可能知道了。
	AddRoleValue( OwnerID() , EM_RoleValue_Register + 9 , 10 )
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113455_SUEZ_12]",  "LuaS_113455_SUEZ_1",  0 ) --重新思考
end

function LuaS_113455_SUEZ_4()
	SetSpeakDetail(OwnerID(), "[SC_113455_SUEZ_15]") 
	--......如果敵人真的掌握了強大的元素生物，這對我們來說實在不是個好消息。
	--不過[ZONE_TUMBLING VALLEY]的情報顯示，蛇人雖然奴役了一部分炎魔，但這些炎魔並非拿來作戰，而是被當作鎔爐的熱量來源。
	--其實我們曾經試過破壞蛇人束縛炎魔的裝置，脫離的炎魔會對蛇人展開攻擊，這代表敵人只能拘束炎魔的行動，而無法操縱它們。
	--當然，不排除索雷爾頓的技術與蛇人的不同，不過目前關於索雷爾頓的情報中並未顯示任何他們有研究操控炎魔的方法。
	--而且......我重新派遣的斥候回報說這個研究材料似乎並沒有回到他們手中。
	AddRoleValue( OwnerID() , EM_RoleValue_Register + 9 , 100 )
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113455_SUEZ_12]",  "LuaS_113455_SUEZ_1",  0 ) --重新思考
end

function LuaS_113455_SUEZ_5()
	SetSpeakDetail(OwnerID(), "[SC_113455_SUEZ_16]") 
	--未知人物啊......這是最頭痛的。
	--沒有情報的傢伙我們根本沒辦法判定......
	--不過我覺得很有可能，因為根據最新的情報，這個研究材料似乎並沒有回到索雷爾頓的手中。
	--但這裡除了我們與蛇人以外，還有誰呢？
	--如果是敵人的話，沒道理得知我們的消息還不進行攻擊。
	--如果是友軍的話，這件事更沒有道理。
	AddRoleValue( OwnerID() , EM_RoleValue_Register + 9 , 1000 )
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113455_SUEZ_12]",  "LuaS_113455_SUEZ_1",  0 ) --重新思考
end

function LuaS_113455_SUEZ_6()
	SetSpeakDetail(OwnerID(), "[SC_113455_SUEZ_17]") 
	--某些原因啊......是什麼原因會讓炎魔離開自己的領地來搶奪我們的斥候呢？
	--而且，我們的斥候來來往往，但只有這一次遭受到炎魔的襲擊。
	--怎麼想都應該和這次得到的研究材料有關......
	--或許炎魔的行為真的有與之前不同的地方，但我認為應該有更直接的理由說明這次的事件。
	AddRoleValue( OwnerID() , EM_RoleValue_Register + 9 , 10000 )
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113455_SUEZ_12]",  "LuaS_113455_SUEZ_1",  0 ) --重新思考
end

function LuaS_113455_SUEZ_7()
	SetSpeakDetail(OwnerID(), "[SC_113455_SUEZ_18]") 
	--情報不足啊......
	--如果能獲得更多關於炎魔的情報，的確能夠釐清一些疑點。
	--不過書上記載的知識並沒辦法解釋目前我們遇到的情況......如果有對這個地方的炎魔熟悉的人能詢問是最好。
	--.......
	--你既然提出這一點，該不會有得到一些相關的情報吧？
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113455_SUEZ_19]",  "LuaS_113455_SUEZ_8",  0 ) --告訴[113455]長老[113467]告訴你的傳說
end

function LuaS_113455_SUEZ_8()
	SetSpeakDetail(OwnerID(), "[SC_113455_SUEZ_20]") 
	--喔？這件事我倒是第一次聽說。
	--這樣說來，[ZONE_DIMARKA]至今應該仍與炎魔有所關聯......
	if CheckAcceptQuest( OwnerID() , 420947 ) == true then
		SetFlag( OwnerID() , 543313 , 1 )
	end
end

function LuaS_113470_0()
	LoadQuestOption( OwnerID() ) 
	if CheckAcceptQuest( OwnerID() , 420950 ) == true  and CheckFlag( OwnerID() , 543315 ) == false then
		AddSpeakOption(OwnerID(), TargetID( ), "[SC_113470_0]",  "LuaS_113470_1",  0 ) --開始調查
	end
end

function LuaS_113470_1()
	CloseSpeak( OwnerID() )
	if ReadRoleValue( TargetID() , EM_RoleValue_PID ) ~= 1 then
		DisableQuest( TargetID() , true )
		WriteRoleValue( TargetID() , EM_RoleValue_PID , 0 )
		BeginPlot( TargetID() , "LuaS_113470_2" , 0 )
	else
		ScriptMessage( OwnerID(), OwnerID(), 0,"[SAY_NPC_BUSY]", 0 );
		ScriptMessage( OwnerID(), OwnerID(), 1,"[SAY_NPC_BUSY]", 0 );
	end
end

function LuaS_113470_2()
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 1 )
	BeginPlot( TargetID() , "LuaS_113470_3" , 0 )
	local Result = "false"
	for i = 1 , 180 , 1 do
		if CheckID( TargetID() ) == false or ReadRoleValue( TargetID() , EM_RoleValue_IsDead ) == 1 or ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) == 0 then
			break
		end
		if ReadRoleValue( OwnerID() , EM_RoleValue_PID ) == 2 then
			Result = "ok"
			break
		end
		if ReadRoleValue( OwnerID() , EM_RoleValue_PID ) == 0 then
			Result = "false"
			break
		end
		sleep(10)
	end
	if Result ~= "false" then
		local Flag = 780435
		local Fire = CreateObjByFlag( 102665 , Flag , 1 , 1 )
		AddToPartition( Fire , 0 )
		SetPlot( Fire , "dead" , "LuaS_113470_Dead" , 0 )
		CallPlot( Fire , "LuaFunc_Obj_Suicide" , 30 )
		SetAttack( Fire , TargetID() )
		for i = 1 , 600 , 1 do
			if CheckID( TargetID() ) == false or ReadRoleValue( TargetID() , EM_RoleValue_IsDead ) == 1 or ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) ~= 1 then
				break
			end
			if CheckID( Fire ) == false or ReadRoleValue( Fire , EM_RoleValue_OrgID ) ~= 102665 then
				break 
			end
			sleep(10)
		end
	end
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 )
	DisableQuest( OwnerID() , false )
end

function LuaS_113470_Dead()
	if CheckAcceptQuest( TargetID() , 420950 ) == true  and CheckFlag( TargetID() , 543315 ) == false then
		SetFlag( TargetID() , 543315 , 1 ) 
	end
	SetStopAttack(OwnerID() )
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_DYING)
	BeginPlot( OwnerID() , "LuaFunc_DeadPlay_Sub" , 0 )
	return false
end

function LuaS_113470_3()
	local result = ""
	if BeginCastBar( OwnerID(), "[SC_113470_1]", 30 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0 ) ~= 1 then
		return
	end	
	while 1 do
		sleep( 2 );
		local CastBarStatus = CheckCastBar( OwnerID() );
		if ( CastBarStatus ~= 0 ) then 
			if ( CastBarStatus > 0) then -- 成功
				result = "OKOK"
				EndCastBar( OwnerID() , CastBarStatus )
				break;
			elseif ( CastBarStatus < 0 ) then -- 失敗
				result = "DAME"
				EndCastBar( OwnerID() , CastBarStatus )
				break;
			end
		end
	end
	if result == "OKOK" then
		WriteRoleValue( TargetID() , EM_RoleValue_PID , 2 )
	else
		WriteRoleValue( TargetID() , EM_RoleValue_PID , 0 )
	end
end

function LuaS_113471_0()
	if CheckAcceptQuest( OwnerID() , 420951 ) == true  and CheckFlag( OwnerID() , 543316 ) == false then
		SetSpeakDetail(OwnerID(), "[SC_113471_00]") --你現在準備好回答我的問題了嗎？
		AddSpeakOption(OwnerID(), TargetID( ), "[SC_113471_01]",  "LuaS_113471_1",  0 ) --請她發問
	else
		LoadQuestOption( OwnerID() )
		if CheckCompleteQuest( OwnerID() , 420953 ) == true or CheckFlag( OwnerID() , 543342 ) == true then
			AddSpeakOption(OwnerID(), TargetID( ), "[SC_113471_28]",  "LuaS_113471_HOWGO",  0 ) --詢問如何到達炎魔的所在地
		end
	end
end

function LuaS_113471_HOWGO()
	SetSpeakDetail(OwnerID(), "[SC_113471_29]") --火之族已經准許你使用它們的道路，只要踏入前方的融岩之中，火焰就會送你抵達火之族的領地。
end

function LuaQ_420950_Complete()
	DisableQuest( OwnerID() , true )
	local Flag = 780435
	AddBuff( TargetID() , 504004 , 1 , -1 )
	sleep(20)
	local Kenya = CreateObjByFlag( 113504 , Flag , 2 , 1 )
	AddToPartition( Kenya , 0 )
	MoveToFlagEnabled( Kenya , false )
	WriteRoleValue( Kenya , EM_RoleValue_IsWalk , 0 )
	Hide( Kenya )
	Show( Kenya , 0 )
	sleep( 10 )
	DW_MoveToFlag( Kenya ,Flag , 3  , 0 )
	AdjustFaceDir( Kenya , OwnerID(), 0 )
	sleep( 10 )
	CancelBuff_NoEvent( TargetID() , 504004 )
	Delobj( Kenya )
	DisableQuest( OwnerID() , false )
end

function LuaS_113471_1()
	SetSpeakDetail(OwnerID(), "[SC_113471_02]") 
	--關於這塊碎片，請你告訴我為何要取走這塊碎片？
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113471_03]",  "LuaS_113471_2",  0 ) --回答：自己並沒有取走這塊碎片的打算
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113471_04]",  "LuaS_113471_3",  0 ) --回答：受[113455]所託前來調查
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113471_05]",  "LuaS_113471_4",  0 ) --回答：只是好奇
end

function LuaS_113471_2()
	SetSpeakDetail(OwnerID(), "[SC_113471_06]") 
	--那我改變我的說法，你會特別來此應該是為了這塊碎片，請你告訴我原因。
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113471_04]",  "LuaS_113471_3",  0 ) --回答：受[113455]所託前來調查
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113471_07]",  "LuaS_113471_4",  0 ) --回答：只是剛好路過
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113471_08]",  "LuaS_113471_4",  0 ) --回答：為了世界和平
end

function LuaS_113471_3()
	SetSpeakDetail(OwnerID(), "[SC_113471_09]") 
	--那個外來者的首領？我知道他。
	--他為什麼要調查這個碎片？
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113471_10]",  "LuaS_113471_4",  0 ) --回答：告訴她[113455]要求自己保密
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113471_11]",  "LuaS_113471_5",  0 ) --回答：告訴她事情的經過
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113471_12]",  "LuaS_113471_6",  0 ) --回答：編造一個可歌可泣的故事告訴她
end

function LuaS_113471_4()
	SetSpeakDetail(OwnerID(), "[SC_113471_16]") 
	--......
	--如果你不願意告訴我原因的話，那就算了。
	--但我有責任看管這塊碎片，火之族也會看著它，因此請你放棄打這塊碎片的主意。
end

function LuaS_113471_5()
	SetSpeakDetail(OwnerID(), "[SC_113471_13]") 
	--原來如此，是因為火之族攻擊你們的人並搶走這個碎片，所以你們希望知道原因。
	--嗯......
	if CheckAcceptQuest( OwnerID() , 420951 ) == true then
		SetFlag( OwnerID() , 543316 , 1 )
	end
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113471_15]",  "LuaS_113471_0",  0 ) --詢問她是否還有其他問題
end

function LuaS_113471_6()
	SetSpeakDetail(OwnerID(), "[SC_113471_14]") 
	--（[113471]眼角泛著淚光）
	--抱歉，我有責任看管這塊碎片，火之族也會看著它，所以......真的很抱歉。
end

function LuaQ_420952_Complete()
	DisableQuest( OwnerID() , true )
	MoveToFlagEnabled( OwnerID() , false )
	local Flag = 780435
	AddBuff( TargetID() , 504004 , 1 , -1 )
	local Ball = CreateObjByFlag( 112307 , Flag , 1 , 1 )
	WriteRoleValue( Ball , EM_RoleValue_LiveTime , 30 )
	Lua_ObjDontTouch( Ball ) 
	AddToPartition( Ball , 0 )
	CastSpell( OwnerID() , Ball , 493632 )
	sleep(35)
	MoveToFlagEnabled( OwnerID() , true )
	CastSpell( Ball , Ball , 493894 )
	sleep(20)
	CancelBuff_NoEvent( TargetID() , 504004 )
	DisableQuest( OwnerID() , false )
end

function LuaQ_420953_Accept()
	DisableQuest( OwnerID() , true )
	Hide( OwnerID() )
	local Dummy = CreateObjByObj( 113473 , OwnerID() )
	AddBuff(Dummy , 504345 , 0 , -1 )
	MoveToFlagEnabled( Dummy , false )
	sleep( 10 )
	DW_MoveToFlag( Dummy  , 780435 , 1 , 20 , 1)
	sleep( 5 )
	CastSpell( Dummy , Dummy , 493919 )
	sleep( 5 )
	Delobj( Dummy )
	DisableQuest( OwnerID() , false )
	Show( OwnerID() , 0 )
end

function LuaM_504342_0()
	if ReadRoleValue( TargetID() , EM_RoleValue_HP ) < ReadRoleValue( TargetID() , EM_RoleValue_MaxHP )/10  then
		return false
	end
	if ReadRoleValue( TargetID() , EM_RoleValue_IsNPC ) == 1 then
		return false
	end
	if CheckCompleteQuest(  TargetID(), 420953 ) == true then
		return false
	end
end

function LuaM_504344_0()
	if CheckFlag( TargetID() , 543342 ) == true then
		return true
	end
	if CheckAcceptQuest(  TargetID(), 420953 ) == true and CheckCompleteQuest(  TargetID(), 420953 ) == false then
		local HPRate = ReadRoleValue( TargetID() , EM_RoleValue_MaxHP ) / 2
		if ReadRoleValue( TargetID() , EM_RoleValue_HP ) < HPRate then
			SetFlag( TargetID() , 543342 , 1 )
			return true
		else
			ScriptMessage( TargetID() , TargetID() , 2 , "[SC_420953_0]" , 1 )
			ScriptMessage( TargetID() , TargetID() , 0 , "[SC_420953_0]" , 1 )
			--從火焰之中傳來了吵雜的聲音：燒吧！燒吧！繼續燒吧！讓對火焰的敬畏烙印在靈魂之上！
			return false
		end
	end

	if CheckCompleteQuest(  TargetID(), 420953 ) == true or CheckCompleteQuest(TargetID(), 420956 ) == true then
		return true
	end
	return false
end

function LuaM_504344_1()
	if ( CheckAcceptQuest( TargetID(), 420953 ) == true or CheckCompleteQuest(  TargetID(), 420953 ) == true ) and CheckCompleteQuest(  TargetID(), 420955 ) == false then
		if CastSpell( TargetID() , TargetID() , 493919 ) then
			ChangeZone( TargetID() , 9 , 0 , -11938 , 181 , 28533 , 320 )
		end
		return
	end
	if ( CheckAcceptQuest(  TargetID(), 420956 ) == true or CheckCompleteQuest(TargetID(), 420956 ) == true  ) and CheckCompleteQuest(  TargetID(), 420959 ) == false then
		if CastSpell( TargetID() , TargetID() , 493919 ) then
			ChangeZone( TargetID() , 9 , 0 , -18523 , 628 , 30144 , 300 )
		end
		return
	end
	if CheckCompleteQuest(  TargetID(), 420955 ) == true and CheckCompleteQuest(  TargetID(), 420959 ) == true and CheckBuff(TargetID() , 504004) == false then
		CallPlot( TargetID() , "LuaM_504344_2" , OwnerID() )
	end
end

function LuaM_504344_2(obj)
	if CheckBuff( OwnerID() , 501570) == false then  --增加檢查判斷
		AddBuff(OwnerID() , 501570,0,-1);--然後給予BUFF
		
		if CheckBuff( OwnerID() , 504004 ) == false then
			AddBuff( OwnerID() , 504004 , 0 , 30 )
		end
		DialogCreate( OwnerID() , EM_LuaDialogType_YesNo  , "[SC_504344_0]"); --你想經由[ZONE_INFERNAL GATE]抵達哪位炎魔的所在地？
		DialogSelectStr( OwnerID() , "[113473]");
		DialogSelectStr( OwnerID() , "[113491]");

		if( DialogSendOpen( OwnerID() ) == false ) then 
			ScriptMessage( OwnerID(),OwnerID(),1,GetString("SYS_FIXEQ_DATA_ERROR"),0)	
			--資料送出有問題
			return 0
		end
	
		local SelectID = EX_GetDialogResoult( OwnerID(), 30 , 150 , obj )
		CancelBuff( OwnerID(), 501570 );--最後清除BUFF
		DialogClose( OwnerID() )
		
		if SelectID == 0  then
			if CastSpell( OwnerID(),OwnerID(), 493919 ) then
				sleep(5)
				ChangeZone( OwnerID(), 9 , 0 , -11938 , 181 , 28533 , 320 )
				CancelBuff_NoEvent( OwnerID() , 504004 )
			end
			return 1
		elseif SelectID == 1  then
			if CastSpell(OwnerID(),OwnerID(), 493919 ) then
				sleep(5)
				ChangeZone( OwnerID(), 9 , 0 , -18523 , 628 , 30144 , 300 )
				CancelBuff_NoEvent( OwnerID() , 504004 )
			end
			return 1
		else 
			CancelBuff_NoEvent( OwnerID() , 504004 )
			return 0
		end
		
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	end
end

function LuaI_113472_0()
	AddBuff( OwnerID() , 504345 , 0 , -1 )
	local FireDoor = CreateObjByFlag( 113510 , 780435 , 1 , 1 )
	SetModeEX( FireDoor , EM_SetModeType_Gravity , false )
	SetModeEX( FireDoor  , EM_SetModeType_Fight , false )
	SetModeEX( FireDoor  , EM_SetModeType_Searchenemy, false )
	SetModeEX( FireDoor  , EM_SetModeType_Strikback, false )
	Lua_ObjDontTouch( FireDoor  )
	AddToPartition( FireDoor , 0 )
	AddBuff( FireDoor , 504351 , 0 , -1 )
end

function LuaS_113473_0()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 420954 ) == true and CheckFlag( OwnerID() , 543318 ) == false then
		AddSpeakOption(OwnerID(), TargetID( ), "[SC_113473_00]",  "LuaS_113473_1",  0 ) --恭敬地詢問關於斥候被襲擊的事情
	end
	if CheckAcceptQuest( OwnerID() , 420955 ) == true then
		AddSpeakOption(OwnerID(), TargetID( ), "[SC_113473_FIGHT]",  "LuaS_113473_FIGHT",  0 ) --再一次化為炎魔到[ZONE_TUMBLING VALLEY]戰鬥
	end
--判斷能不能重給
	if	CheckCompleteQuest(OwnerID(),422950)	and
		CountBodyItem(OwnerID(),206555)==0	then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_PE_9_1_45]","LuaPE_9_1_DW52", 0 )
	end
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113473_BACK]",  "LuaS_113473_BACK",  0 ) --請求[113473]送自己回[ZONE_INFERNAL GATE]
end

function LuaS_113473_BACK()
	CloseSpeak( OwnerID() )
	BeginPlot( OwnerID() , "LuaS_113473_GateReturn" , 0 )
end

function LuaS_113473_GateReturn()
	sleep(5)
	if CastSpell(OwnerID(),OwnerID(), 493919 ) then
		sleep(5)
		ChangeZone( OwnerID(), 9 , 0 , -11153 , 905 , 22598 , 350 )
	end
end
function LuaS_113473_FIGHT()
	CloseSpeak( OwnerID() )
	BeginPlot( OwnerID() , "LuaS_113473_FIGHT_2" , 0 )
end
function LuaQ_420955_Accept()
	BeginPlot( TargetID() , "LuaS_113473_FIGHT_2" , 0 )
end
function LuaS_113473_FIGHT_2()
	if CastSpell(OwnerID(),OwnerID(), 493919 ) then
		sleep(5)
		ChangeZone( OwnerID(), 9 , 0 , -15896 , 5 , 23282 , 270 )
		BeginPlot( OwnerID(), "Lua_420955_0" , 0 )
	end
end

function Lua_420955_0()
	AddBuff( OwnerID() , 504316 , 60 , 600 )
	AddBuff( OwnerID() , 504946 , 0 , 600 )
	sleep(30)
	for i = 1 , 6000 , 1 do
		sleep( 5+DW_Rand(5) )
		if Lua_ObjAreaCheck(OwnerID() , 718 ) == false then
			break
		end
		if CheckBuff( OwnerID()  , 504316 ) == false then
			break
		end
		if CheckAcceptQuest( OwnerID() , 420955 ) == false then
			break
		end
	end
	if CheckBuff( OwnerID()  , 504316 ) == true then
		CancelBuff( OwnerID()  , 504316 )
	end
end

function LuaS_113473_1()
	SetSpeakDetail(OwnerID(), "[SC_113473_01]") --只要冒犯了我們，就會受到火焰的制裁！你還有問題嗎？
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113473_02]",  "LuaS_113473_2",  0 ) --辯解斥候並沒有冒犯炎魔
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113473_03]",  "LuaS_113473_3",  0 ) --補充事情與[113470]有關
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113473_04]",  "LuaS_113473_4",  0 ) --指責[113473]的傲慢
end

function LuaS_113473_2()
	SetSpeakDetail(OwnerID(), "[SC_113473_05]") --喔？你敢駁斥我？很好！我就給你一個機會，你把那傢伙做的事情說給我聽！如果那傢伙的確冒犯了我們，你應該知道自己的下場！
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113473_06]",  "LuaS_113473_5",  0 ) --先平息[113473]的怒氣
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113473_07]",  "LuaS_113473_3",  0 ) --補充炎魔搶奪[113470]的部分
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113473_08]",  "LuaS_113473_5",  0 ) --恭敬的道歉
end

function LuaS_113473_3()
	SetSpeakDetail(OwnerID(), "[SC_113473_09]") 
	--喔？的確！我族平常不會奪取人們的物品，但那個物品除外。
	--對我們來說，不能讓那個物品落入操控符文的人手中！不過我們無法完全銷毀它，所以我們必須取得它！
	--你剛剛說那個被我們攻擊的傢伙沒死是吧？這是因為我們的目的不是他，而是那個東西，對我族來說那個傢伙根本微不足道。
	--我想以你的見識大概也不會知道這件事，我就寬恕你剛才對我的冒犯吧！
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113473_10]",  "LuaS_113473_6",  0 ) --試探關於[113470]的事情
end

function LuaS_113473_4()
	SetSpeakDetail(OwnerID(), "[SC_113473_12]") 
	--（你的話還沒說出口，[113473]突然散發出強大的氣勢以及大量的熱力，壓的你喘不過氣來。）
	--你！你那是什麼眼神？是想挑戰偉大的[113473]嗎？
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113473_08]",  "LuaS_113473_5",  0 ) --恭敬的道歉
end

function LuaS_113473_5()
	SetSpeakDetail(OwnerID(), "[SC_113473_13]") 
	--很好！看來你並沒有忘記對我們的敬畏之心，我就再給你一個機會！
	--你把那傢伙做的事情說給我聽！如果那傢伙的確冒犯了我們，你應該知道自己的下場！
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113473_07]",  "LuaS_113473_3",  0 ) --補充炎魔搶奪[113470]的部分
end

function LuaS_113473_6()
	SetSpeakDetail(OwnerID(), "[SC_113473_14]") 
	--怎麼？你對那個東西有興趣？
	--嗯......
	--我看你也有能夠操控符文的資質，你也是個「操控符文的人」......你該不會也想利用那個東西吧？
	--哼哼......
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113473_11]",  "LuaS_113473_7",  0 ) --請教什麼是「操控符文的人」
end

function LuaS_113473_7()
	SetSpeakDetail(OwnerID(), "[SC_113473_15]") 
	--噗哈哈哈！你真是個有趣的傢伙！
	--既然你連自己是什麼都不清楚，我看你也不會知道那個東西是什麼。
	--聽好了！小傢伙！
	--符文的力量很強大，每個人也都可以使用符文，但大部分人發揮出來的力量就像熄滅前的火星一樣微弱，而「操控符文的人」才能發揮出如烈火般燃燒的力量。
	--那些石頭傢伙就是像「操控符文的人」利用符文的力量製造出來的。
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113473_16]",  "LuaS_113473_8",  0 ) --詢問他索雷爾頓是不是「操控符文的人」
end

function LuaS_113473_8()
	SetSpeakDetail(OwnerID(), "[SC_113471_17]") 
	--索雷爾頓？你們這些小傢伙之間的區別對我們來說不值得一提。
	--只要對我們抱持著敬畏之心，不冒犯我族，你們對我族來說都是一樣的。
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113473_18]",  "LuaS_113473_9",  0 ) --告訴他[113470]是索雷爾頓研究品的情報
end

function LuaS_113473_9()
	SetSpeakDetail(OwnerID(), "[SC_113471_19]") 
	--喔？原來是他們想要那個東西啊！哼哼......
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113473_20]",  "LuaS_113473_10",  0 ) --再告訴他[102512]的情報
end

function LuaS_113473_10()
	SetSpeakDetail(OwnerID(), "[SC_113471_21]") 
	--這件事我知道，我族中有一些個體被卑微的生物所奴役，哼！力量不夠維持自己的尊嚴，這樣的弱者我不屑一顧！
	--不過你說那些什麼索雷爾頓的和那些長鱗片的小傢伙是一夥的，這可有意思，是想對我族宣戰是嗎？
	--哼哼！他們根本沒有搞清楚自己的微小！
	--我族馬上就能夠讓這個[ZONE_MOUNT AL TURAJ]上的一切化為熔岩裡的殘渣！
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113473_22]",  "LuaS_113473_11",  0 ) --極力贊同他
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113473_23]",  "LuaS_113473_12",  0 ) --想辦法阻止他
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113473_24]",  "LuaS_113473_13",  0 ) --什麼也不說
end

function LuaS_113473_11()
	SetSpeakDetail(OwnerID(), "[SC_113471_25]") 
	--哈哈！我喜歡你這小子！
	--噢！我想到一個好點子！你說你正在和那些傢伙打仗吧？
	--如果用我族的力量，在他們感到敬畏之前他們就完了......這樣太便宜他們了！
	--最好讓他們知道就算我族不親自出馬也能給予他們恐懼！
	--我決定由你來代表我降下制裁！
	if CheckAcceptQuest( OwnerID() , 420954) == true then
		SetFlag( OwnerID() , 543317 , 1 )
	end
end

function LuaS_113473_12()
	SetSpeakDetail(OwnerID(), "[SC_113471_26]") 
	--喔？你說這些微不足道的傢伙不需要我族親自動手由你們來就好？
	--嗯......你說的很好！我很滿意！
	--你不但對我族表示敬畏，還願意為我族教訓那些無知的傢伙......很好！
	--就由你來代表我降下制裁！
	if CheckAcceptQuest( OwnerID() , 420954) == true then
		SetFlag( OwnerID() , 543317 , 1 )
	end
end

function LuaS_113473_13()
	SetSpeakDetail(OwnerID(), "[SC_113471_27]") 
	--嗯？怎麼？看你嚇得一點聲音也發不出來，哈哈哈！
	--這才叫做敬畏！那些無禮的傢伙應該要向你學習什麼才是對我族的敬畏之心！
	--好！我決定了！要先讓他們知道什麼是敬畏再毀滅他們！
	--你！就當我的使者！到他們的面前彰顯我的力量！
	if CheckAcceptQuest( OwnerID() , 420954) == true then
		SetFlag( OwnerID() , 543317 , 1 )
	end
end

function LuaM_504346_0()
	if CheckBuff( TargetID() , 504348 ) == true then
		CancelBuff( TargetID() , 504348)
	end	
end

function LuaM_504315_0()
	if CheckBuff( TargetID() , 504316 ) == true then
		CancelBuff_NoEvent( TargetID() , 504316 )
	end
	if CheckBuff( TargetID() , 504347 ) == true then
		CancelBuff_NoEvent( TargetID() , 504347 )
	end
	if CheckBuff( TargetID() , 504946 ) == true then
		CancelBuff_NoEvent( TargetID() , 504946 )
	end
	BeginPlot( TargetID() , "LuaS_113473_GateReturn" , 0 )
end

function LuaM_504315_Check()
	if ReadRoleValue( TargetID() , EM_RoleValue_IsDead ) == 1 then
		return false
	end
	if ReadRoleValue( TargetID() , EM_RoleValue_IsNPC ) == 1 then
		return false
	end
	return true
end

function LuaS_113492_0()
	if CheckAcceptQuest( OwnerID() , 420957 ) == true then
		SetSpeakDetail(OwnerID(), "[SC_113492_0]") 
		--（看著光球的閃爍，你腦海中慢慢浮現了一陣模糊的聲音。）
		--收到......訊息者......沙沙......請......
		--重新開啟......沙沙......訊息傳達.....機能......
		--必須......沙沙......能源核心......沙沙......
		SetFlag( OwnerID() , 543318 , 1 )
	else
		LoadQuestOption( OwnerID() )
	end
end

function LuaS_113495_0()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 420959 ) == true then
		AddSpeakOption(OwnerID(), TargetID( ), "[SC_113495_00]", "LuaS_113495_1",  0 ) --詢問他醒來的目的
	end
	if CheckCompleteQuest( OwnerID() , 420959 ) == true then
		AddSpeakOption(OwnerID(), TargetID( ), "[SC_113495_34]", "LuaS_113495_Q",  0 ) --再次詢問情報
	end
end

function LuaS_113495_1()
	SetSpeakDetail(OwnerID(), "[SC_113495_01]") 
	--在回答你的問題之前，我必須先確認你的身分。
	--你是[102438]的手下嗎？
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113495_02]", "LuaS_113495_2",  0 ) --回答自己不知道誰是[102438]
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113495_03]", "LuaS_113495_2",  0 ) --回答自己是[102438]的敵人
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113495_04]", "LuaS_113495_3",  0 ) --回答自己是[102438]的手下
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113495_05]", "LuaS_113495_4",  0 ) --回答自己就是[102438]
end

function LuaS_113495_2()
	SetSpeakDetail(OwnerID(), "[SC_113495_06]") 
	--回答分析中......
	--我接受你的答案，讓我回答你的疑問吧！
	--[102438]，是[ZONE_MOUNT AL TURAJ]目前的統治者，魔族，我的敵人。
	--我被喚醒的目的就是為了將對抗他的方法傳達給將對抗他的人。
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+9 , 0)
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113495_10]", "LuaS_113495_5",  0 ) --詢問誰是對抗[102438]的人
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113495_11]", "LuaS_113495_6",  0 ) --詢問對抗[102438]的方法
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113495_12]", "LuaS_113495_7",  0 ) --詢問與[102438]為敵的原因
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113495_13]", "LuaS_113495_8",  0 ) --詢問他與炎魔之間的關係
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113495_14]", "LuaS_113495_9",  0 ) --對目前[ZONE_MOUNT AL TURAJ]的統治者這點提出質疑
end

function LuaS_113495_3()
	SetSpeakDetail(OwnerID(), "[SC_113495_07]") 
	--回答分析中......
	--我無法接受你的答案，請告訴我你真正的身分。
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113495_02]", "LuaS_113495_2",  0 ) --回答自己不知道誰是[102438]
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113495_03]", "LuaS_113495_2",  0 ) --回答自己是[102438]的敵人
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113495_05]", "LuaS_113495_4",  0 ) --回答自己就是[102438]
end

function LuaS_113495_4()
	SetSpeakDetail(OwnerID(), "[SC_113495_08]") 
	--請問這是一種幽默的表現嗎？我是否應該哈哈大笑？
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113495_09]", "LuaS_113495_1",  0 ) --重新回答
end

function LuaS_113495_5()
	SetSpeakDetail(OwnerID(), "[SC_113495_17]") 
	--任何即將與[102438]對抗的人。
	--這個訊息我無法明確的回答你，因為我得到的指令是等待這樣的人到來，並沒有得到其他關於這些人的訊息。
	--命運終將引導這樣的人到我的面前......
	AddRoleValue( OwnerID() , EM_RoleValue_Register+9 , 1)
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113495_16]", "LuaS_113495_Q",  0 ) --詢問其他的問題
end

function LuaS_113495_6()
	SetSpeakDetail(OwnerID(), "[SC_113495_18]") 
	--[102438]，他現在以恐懼之王的名字統治此地，藉由強大的符文之力，他在自己的週遭建構了一堵魔法障壁。
	--這個障壁反映了他的力量，敵人內心最深的恐懼將化為無法忽視的幻象。
	--這個幻象將帶給他的敵人無法抑制的恐懼，這是魔法帶來的力量，不是普通人的意志能夠抵抗的。
	--但就算是恐懼之王也有恐懼的事物，墮落的火龍[102670]曾帶給[102438]無法磨滅的記憶。
	--找到[102670]，並將[102670]心臟中的血液塗滿全身，只要接觸到[102438]的魔法障壁，他將從幻象中看到[102670]的靈魂。
	--而[102670]的幻象將會藉由魔法的連結進入他的內心，讓恐懼反噬他自身，這將會迫使他解除障壁。
	--只要能夠使[102438]失去讓人完全恐懼的力量，就有擊敗他的機會。
	AddRoleValue( OwnerID() , EM_RoleValue_Register+9 , 10)
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113495_16]", "LuaS_113495_Q",  0 ) --詢問其他的問題
end

function LuaS_113495_7()
	SetSpeakDetail(OwnerID(), "[SC_113495_19]") 
	--魔族，將強大的符文之力與自身結合的人們，我等必須追捕並清除的對象。
	--只有將魔族滅盡，並引導所有禁忌符文重新歸於造物者的控制之下，才能使世界免於受到貪欲與邪念的掌控。
	--
	--[102438]為魔族，並竊取了我等所保護的禁忌符文，已符合將對世界有重大危害者的標準。
	--
	--所有可能對世界造成重大危害之人，即為我等的敵人。
	AddRoleValue( OwnerID() , EM_RoleValue_Register+9 , 100)
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113495_16]", "LuaS_113495_Q",  0 ) --詢問其他的問題
end

function LuaS_113495_8()
	SetSpeakDetail(OwnerID(), "[SC_113495_20]") 
	--炎魔，你剛剛與之交談的元素生物。
	--我等來此之後與火龍[102670]遭遇，這些元素生物便從其力量中誕生，並與我等戰鬥。
	--它們是[102670]破碎靈魂的一部份，反映了[102670]的憤怒以及毀滅的渴望。
	--我等的使命是對抗魔族以及回收禁忌符文，對我等而言，它們是自然界所創生的阻礙，但並非敵人。
	--但若它們被魔族所操控，則亦為我等必須清除的對象。
	AddRoleValue( OwnerID() , EM_RoleValue_Register+9 , 1000)
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113495_16]", "LuaS_113495_Q",  0 ) --詢問其他的問題
end

function LuaS_113495_9()
	SetSpeakDetail(OwnerID(), "[SC_113495_21]") 
	--在我等面世之前，蛇人就是過去統治此地的魔族所擁有的僕役，也是他的士兵。
	--[102438]取走我保護之禁忌符文時已繼承了這支軍隊。
	--而現今我甦醒之後所見，[102438]的力量仍包圍著此地，蛇人軍隊佔領的範圍也擴大了。
	--因此可判定此地的統治者仍為[102438]。
	AddRoleValue( OwnerID() , EM_RoleValue_Register+9 , 10000)
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113495_16]", "LuaS_113495_Q",  0 ) --詢問其他的問題
end

function LuaS_113495_10()
	SetSpeakDetail(OwnerID(), "[SC_113495_22]") 
	--過去的事情已經被人們遺忘，但過去的邪惡仍留存了下來。
	--自從我的身軀損毀嚴重，就已經被解除了對抗邪惡的使命。
	--我現在的使命是這些警告的話語傳達給你們，而今你的到來，讓我的使命得以完成。
	--但你們的使命才正要開始。
	--今天你所聽到的話語將幫助你們擊敗[102438]。
	--把這些話語傳達出去，讓這個世界的符文力量脫離無知之人的控制吧！
	if CheckAcceptQuest( OwnerID() , 420959 ) == true then
		SetFlag( OwnerID() , 543319 , 1 )
	end
end

function LuaS_113495_Q()
	SetSpeakDetail(OwnerID(), "[SC_113495_23]") 
	--[102438]，是[ZONE_MOUNT AL TURAJ]目前的統治者，魔族，我的敵人。
	--我被喚醒的目的就是為了將對抗他的方法傳達給將對抗他的人。
	local Check = ReadRoleValue( OwnerID() , EM_RoleValue_Register+9 )
	if Check >= 11111 then
		AddSpeakOption(OwnerID(), TargetID( ), "[SC_113495_15]", "LuaS_113495_10",  0 ) --詢問他還有沒有什麼事情要說
	end
	if Check - 10*math.floor( Check / 10 ) < 1 then
		AddSpeakOption(OwnerID(), TargetID( ), "[SC_113495_10]", "LuaS_113495_5",  0 ) --詢問誰是對抗[102438]的人
	else
		AddSpeakOption(OwnerID(), TargetID( ), "[SC_113495_24]", "LuaS_113495_13",  0 ) --詢問自己是不是他在等待的人
	end
	if Check - 100*math.floor( Check / 100 ) < 10 then
		AddSpeakOption(OwnerID(), TargetID( ), "[SC_113495_11]", "LuaS_113495_6",  0 ) --詢問對抗[102438]的方法
	else
		AddSpeakOption(OwnerID(), TargetID( ), "[SC_113495_25]", "LuaS_113495_14",  0 ) --詢問怎麼找到[102670]
	end
	if Check - 1000*math.floor( Check / 1000 ) < 100 then
		AddSpeakOption(OwnerID(), TargetID( ), "[SC_113495_12]", "LuaS_113495_7",  0 ) --詢問與[102438]為敵的原因
	else
		AddSpeakOption(OwnerID(), TargetID( ), "[SC_113495_26]", "LuaS_113495_15",  0 ) --詢問禁忌符文的事情
	end
	if Check - 10000*math.floor( Check / 10000 ) < 1000 then
		AddSpeakOption(OwnerID(), TargetID( ), "[SC_113495_13]", "LuaS_113495_8",  0 ) --詢問他與炎魔之間的關係
	else
		AddSpeakOption(OwnerID(), TargetID( ), "[SC_113495_27]", "LuaS_113495_16",  0 ) --詢問[102670]的事情
	end
	if Check - 100000*math.floor( Check / 100000 ) < 10000 then
		AddSpeakOption(OwnerID(), TargetID( ), "[SC_113495_14]", "LuaS_113495_9",  0 ) --對目前[ZONE_MOUNT AL TURAJ]的統治者這點提出質疑
	else
		AddSpeakOption(OwnerID(), TargetID( ), "[SC_113495_28]", "LuaS_113495_17",  0 ) --詢問[ZONE_MOUNT AL TURAJ]過去與魔族的關係
	end
end

function LuaS_113495_13()
	SetSpeakDetail(OwnerID(), "[SC_113495_29]") 
	--如果你將與[102438]對抗，那你就是我在等待的人。
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113495_16]", "LuaS_113495_Q",  0 ) --詢問其他的問題
end

function LuaS_113495_14()
	SetSpeakDetail(OwnerID(), "[SC_113495_30]") 
	--[102670]，在我到達此地之後與我等發生戰鬥，我等因此墜落於此地，眾人皆損毀，只餘我仍可維持部分機能並探知外界。
	--牠亦放盡力氣而於此地的[ZONE_DRAGONS NEST]之中沉睡。
	--[102438]從我身上取走我所守護之禁制符文之後，亦曾想奪取[102670]之力，但反而受[102670]所傷。
	--因恐懼[102670]完全恢復力量後對其報復，[102438]便趁[102670]仍虛弱時以重重結界將[102670]封印於[ZONE_DRAGONS NEST]。
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113495_16]", "LuaS_113495_Q",  0 ) --詢問其他的問題
end

function LuaS_113495_15()
	SetSpeakDetail(OwnerID(), "[SC_113495_31]") 
	--禁忌符文，是擁有強大力量的符石，部分文獻中視其為神諭的一部份。
	--其擁有的力量絕非一般使用的符文所能媲美，因此若放任其落入無知貪婪之輩手中，將對世界造成極大危害。
	--過去魔族之亂便是不爭的事實。
	--我們的使命之一就是回收這些禁忌符文並保管，避免再被任何人所妄用。
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113495_16]", "LuaS_113495_Q",  0 ) --詢問其他的問題
end

function LuaS_113495_16()
	SetSpeakDetail(OwnerID(), "[SC_113495_32]") 
	--[102670]，火龍之子，應為人類之友卻反叛至魔族的墮落之龍。
	--記載中牠被火龍之王擊敗並以法術束縛，使其使用能力時亦被其能力所燒灼，但之後被魔族所救而不知去向。
	--直到我等來到此地，才發現牠一直在此地地下沉眠。
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113495_16]", "LuaS_113495_Q",  0 ) --詢問其他的問題
end

function LuaS_113495_17()
	SetSpeakDetail(OwnerID(), "[SC_113495_33]") 
	--[ZONE_MOUNT AL TURAJ]，過去是[ZONE_YGGNO LAND]統治者巴奈齊亞斯的領地，蛇人是他的軍隊，而[102670]是他的盟友。
	--他最後死於部將安德薩斯的反叛，而其剩餘勢力之後也被人類之王卡薩姆所率領的軍隊所擊敗。
	--封印之戰後，其佔有的數個禁忌符文不知去向，我等來此的目的即為尋找並回收這些禁忌符文。
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113495_16]", "LuaS_113495_Q",  0 ) --詢問其他的問題
end

function LuaQ_420958_Complete()
	DisableQuest( OwnerID() , true )
	local Flag = 780435
	AddBuff( TargetID() , 504004 , 1 , -1 )
	MoveToFlagEnabled(  OwnerID() , false )
	WriteRoleValue( OwnerID() , EM_RoleValue_IsWalk , 1 )
	sleep( 10 )
	DW_MoveToFlag(  OwnerID() ,Flag , 5  , 0 )
	AdjustDir( OwnerID(), -90 )
	sleep( 10 )
	Yell( OwnerID() , "[SC_113491_0]" , 3 ) --我記得好像是從這裡被拿出來的......
	PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_CAST_SP01 )
	sleep( 30 )
	Yell( OwnerID() , "[SC_113491_1]" , 3 ) --好啦！給我發生作用吧！
	PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_IDLE1 )
	sleep( 50 )
	Yell( OwnerID() , "[SC_113491_2]" , 3 ) --......
	sleep( 20 )
	Yell( OwnerID() , "[SC_113491_3]" , 3 ) --動起來啊！混帳傢伙！
	PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_CAST_INSTANT )
	sleep( 10 )
	CancelBuff_NoEvent( TargetID() , 504004 )
	sleep( 10 )
	DW_MoveToFlag(  OwnerID() ,Flag , 4  , 0 )
	AdjustDir( OwnerID(), -90 )
	sleep( 10 )
	Yell( OwnerID() , "[SC_113491_4]" , 3 ) --真是欠打......
	DisableQuest( OwnerID() , false )
	MoveToFlagEnabled(  OwnerID() , true )
end

function LuaS_113491_0()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 420958 ) == true and CountBodyItem( OwnerID() , 205950 ) < 1 then
		AddSpeakOption(OwnerID(), TargetID( ), "[SC_113491_5]",  "LuaS_113491_2",  0 ) --請求[113491]將自己送到附近的地面上
	end
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_113491_6]",  "LuaS_113473_BACK",  0 ) --請求[113491]送自己回[ZONE_INFERNAL GATE]
end

function LuaS_113491_2()
	CloseSpeak( OwnerID() )
	BeginPlot( OwnerID() , "LuaS_113491_3" , 0 )
end

function LuaS_113491_3()
	if CastSpell(OwnerID(),OwnerID(), 493919 ) then
		sleep(5)
		ChangeZone( OwnerID(), 9 , 0 , -17649 , 839 , 29976 , 250 )
	end
end

function LuaI_205953_Check()
	if Lua_ExGetZone( OwnerID())  ~= 9 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_205953_0]" , 1 ) --你不能在[ZONE_MOUNT AL TURAJ]之外的地方使用此物品
		return false
	end
	if ReadRoleValue( OwnerID() , EM_RoleValue_IsAttackMode ) ~= 0 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_205953_1]" , 1 ) --你不能在戰鬥中使用此物品
		return false
	end
	return true
end

function LuaI_205953_Use()
	if CastSpell( OwnerID() , OwnerID() , 493919 ) then
		UseItemDestroy()
		ChangeZone( OwnerID(), 9 , 0 , -18523 , 628 , 30144 , 300 )
	end
end

function LuaQ_420959_Complete()
	SetFlag(TargetID() , 543319 , 1 )
end

function LuaQ_420952_OnClick()
	if CountBodyItem( OwnerID() , 205947 ) >= 3 and CountBodyItem( OwnerID() , 205948 ) >= 5 then
		ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_420952_0]" , 0 ) --你已經收集到足夠的物品了
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_420952_0]" , 0 )
		return -1
	else
		return 1
	end
end

function LuaQ_420952_AfterClick()
	local Num = DW_Rand(1000)
	if Num > 700 and CountBodyItem( OwnerID() , 205947 ) < 3 then
		GiveBodyItem( OwnerID() , 205947 , 1 )
	elseif Num < 500 and CountBodyItem( OwnerID() , 205948 ) < 5 then
		GiveBodyItem( OwnerID() , 205948 , 1 )
	else
		GiveBodyItem( OwnerID() , 205949 , 1 )
	end
	return 1
end

function LuaI_113467_0()
	local NPC = LuaFunc_SearchNPCbyOrgID( OwnerID() , 113467 , 70)
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , NPC )
	SetPlot( OwnerID(),"collision","LuaI_113467_1",40 )
end

function LuaI_113467_1()
	local NPC = ReadRoleValue( TargetID() , EM_RoleValue_PID )
	if CheckID( NPC ) == true then
		tell( OwnerID() , NPC , "[SC_113467_0]" )
	end
end
function Lua_Test_504316()
	AddBuff( OwnerID() , 504316 , 60 , -1)
end

function LuaM_504349_Check()
	local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	if OrgID == 102512 or OrgID == 102669 or OrgID == 102500 or OrgID == 102543 then
		local Name = GetName(TargetID())
		local Str = "[SC_504349_0][$SETVAR1="..Name.."]"--[$VAR1]吸收了[494191]的傷害
		local MaxHP = ReadRoleValue( TargetID() , EM_RoleValue_MaxHP )
		if ReadRoleValue( TargetID() , EM_RoleValue_HP ) ~= MaxHP and ReadRoleValue( TargetID() , EM_RoleValue_IsDead ) == 0 then
		AddRoleValue( TargetID() , EM_RoleValue_HP , MaxHP)
		ScriptMessage( OwnerID() , OwnerID() , 0 , Str , 0 )
		end
		return false
	end
	return true
end