--422688軍事情報

function LuaS_422688_0()	
		LoadQuestOption(OwnerID())	
	if (CheckAcceptQuest(OwnerID(),422688)==true )and( CheckFlag( OwnerID(),543009)==false)and( CheckFlag( OwnerID(),543344)==true) and( CheckFlag( OwnerID(),543345)==true) then 
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422688_0]","LuaS_422688_1",0) --我看完了...
	end
	
	if 	(CheckAcceptQuest(OwnerID(),422688)==true )and( CheckFlag( OwnerID(),543009)==false) 	then 
		AddSpeakOption(OwnerID(),TargetID(),"[SC_205763_0]","LuaS_205763_1",0)
	end
	
	if 	(CheckAcceptQuest(OwnerID(),422688)==true )and( CheckFlag( OwnerID(),543009)==false) 	then 
		AddSpeakOption(OwnerID(),TargetID(),"[SC_205764_0]","LuaS_205764_1",0)
	end

	if 	(CheckAcceptQuest(OwnerID(),422695)==true )and( CheckFlag( OwnerID(),543330)==false) and( CheckFlag( OwnerID(),543187)==true) then 
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422695_0]","LuaS_422695_1",0)		 --我看完了。
	end

end

function LuaS_422688_1()
	SetSpeakDetail(OwnerID(),"[SC_422688_1]")					--精彩嗎？毫無防備將這種報告隨身攜帶...				
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422688_2]","LuaS_422688_2",0)		--嗯，我知道。
end

function LuaS_422688_2()
	SetSpeakDetail(OwnerID(),"[SC_422688_3]")	
	BeginPlot( OwnerID(), "LuaS_422688_3", 0 )												
end

function LuaS_422688_3()								
	SetFlag( TargetID(), 543009, 1 )
end

function LuaS_205763_1()	--信件內容
	SetSpeakDetail(OwnerID(),"[SC_205763_1]")
	BeginPlot( OwnerID(), "LuaS_205763_2", 0 )
end

function LuaS_205763_2()
	SetFlag( TargetID()  , 543344, 1 )
end

function LuaS_205764_1()
	SetSpeakDetail(OwnerID(),"[SC_205764_1]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_205764_2]","LuaS_205764_2",0)
end

function LuaS_205764_2()
	SetSpeakDetail(OwnerID(),"[SC_205764_3]")
	BeginPlot( OwnerID(), "LuaS_205764_3", 0 )
	
end

function LuaS_205764_3()
	SetFlag( TargetID()  , 543345, 1 )
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--422689竄改密函780353 3號

--function LuaS_422689_0()	（搬到422687）
--		LoadQuestOption(OwnerID())	
--	if 	(CheckAcceptQuest(OwnerID(),422689)==true )and(ReadRoleValue( TargetID() , EM_RoleValue_PID )  == 0) and(CheckCompleteQuest( OwnerID(), 422689 )==false) then 
--		AddSpeakOption(OwnerID(),TargetID(),"[SC_422689_0]","LuaS_422689_1",0)			 --我來了，亞榭娜隊長交給我[205765]和[205909]。
--	else
--		AddSpeakOption(OwnerID(),TargetID(),"[SC_422687_0]","LuaS_422689_3",0)			 --我來了，亞榭娜隊長交給我[205765]和[205909]。
--end

function LuaS_422689_1()
	closespeak(OwnerID())
	say(TargetID(),"[SC_422689_1]")						--沒問題，我去把屍體搬出來。
	WriteRoleValue( TargetID() , EM_RoleValue_Register , 1 )
	--WriteRoleValue( TargetID() , EM_RoleValue_PID , 1 )
	BeginPlot( TargetID(), "LuaS_422689_2", 0 )		
end

function LuaS_422689_2()
	local RED = Lua_DW_CreateObj("flag" ,113517,780353,3)	
	WriteRoleValue ( RED  ,  EM_RoleValue_Register , OwnerID())	--將OwnerID()<威廉>寫進RED赤蛇裡
	sleep(300)
	Local NPC= ReadRoleValue(RED  ,EM_RoleValue_Register )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
--	WriteRoleValue( NPC , EM_RoleValue_PID , 0 )	
	delobj(RED)	
end

function LuaS_422689_3()
	SetSpeakDetail(OwnerID(),"[SC_422689_2]")	--[113517]的屍體就在旁邊，快趁現在沒人注意時放置[205765]和[205909]！	
end


function LuaS_113517_0()--有任務沒旗標 點擊物品後

	if 	(CheckAcceptQuest(OwnerID(),422689)==true ) then
		if ( CheckFlag( OwnerID(),542977) ==false) and CountBodyItem( OwnerID(), 205765) > 0	then	--沒有旗標有物品
			DelBodyItem( OwnerID(), 205765, 1 )
			SetFlag( OwnerID()  , 542977, 1 )
		end
		if  CheckFlag( OwnerID(),543186)==false and CountBodyItem( OwnerID(), 205909 ) >0 then	--沒有旗標有物品
			DelBodyItem( OwnerID(), 205909, 1 )	 
			SetFlag( OwnerID(),543186,1)		
		end
		
		if (CheckFlag( OwnerID(),542977)==false) and  (CheckFlag( OwnerID(),543186)== false) and CountBodyItem( OwnerID(), 205765) <1 and CountBodyItem( OwnerID(), 205909 ) <1	then											ScriptMessage( OwnerID() , OwnerID(), 2, "[SC_112217_0]" , 0 ) --你必須擁有[205765]和[205909]
		end

		if  CheckFlag( OwnerID(),542977)==false and CountBodyItem( OwnerID(), 205765 )<1 then	--沒有旗標沒有物品
			ScriptMessage( OwnerID() , OwnerID(), 2, "[SC_112217_1]" , 0 ) --你必須擁有[205765]	
		end

		if CheckFlag( OwnerID(),543186)==false  and CountBodyItem( OwnerID(), 205909 ) <1 then	--沒有旗標沒有物品
			ScriptMessage( OwnerID() , OwnerID(), 2, "[SC_112217_2]" , 0 ) --你必須擁有[205909]	
		end
	end	

	if 	(CheckAcceptQuest(OwnerID(),422689)==true )and( CheckFlag( OwnerID(),542977) ==true)and CheckFlag( OwnerID(),543186)==true	then
			ScriptMessage( OwnerID() , OwnerID(), 2, "[SC_112217_3]" , 0 ) --你已經把[205765]和[205909]安置到屍體上了
--			return -1
	end
	return 1
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--馬弗爾的祕密

function LuaS_113507_0()	--檢查同一封信只能擁有一個 
	if	CountItem( OwnerID(), 205910 )==0	then
		GiveBodyItem(OwnerID (), 205910, 1 )
		ScriptMessage( OwnerID() , OwnerID(), 2, "[SC_113507_1]" , 0 ) --箱子裡還有信件
		Return 1
	end

	if 	CountItem( OwnerID(), 205911 )==0	then
		GiveBodyItem(OwnerID (), 205911, 1 )
		ScriptMessage( OwnerID() , OwnerID(), 2, "[SC_113507_1]" , 0 ) 
		Return 1
	end

	if 	CountItem( OwnerID(), 205912 )==0	then
		GiveBodyItem(OwnerID (), 205912, 1 )
		ScriptMessage( OwnerID() , OwnerID(), 2, "[SC_113507_1]" , 0 ) 
		Return 1
	end

	if 	CountItem( OwnerID(), 205914 )==0	then
		GiveBodyItem(OwnerID (), 205914, 1 )
		SetFlag( OwnerID(),543187,1)
		Return 1
	end
	Return -1
end

--function LuaS_422695_0()	（搬到422688）
--	if 	(CheckAcceptQuest(OwnerID(),422695)==true )and( CheckFlag( OwnerID(),543330)==false) and( CheckFlag( OwnerID(),543187)==true) then 
--		AddSpeakOption(OwnerID(),TargetID(),"[SC_422695_0]","LuaS_422695_1",0)		 --我看完了。
--	end
--end

function LuaS_422695_1()
	SetSpeakDetail(OwnerID(),"[SC_422695_1]")					       	--接下來的計畫稍後我會告訴你，你先休息一下吧。
	SetFlag( OwnerID(),543330,1)				
end

function LuaS_205910()
	ClearBorder( OwnerID())	--初始化石碑介面
	AddBorderPage( OwnerID(), "[SC_205910]" )
	ShowBorder( OwnerID(), 0, "[205910]", "ScriptBorder_Texture_Paper" )	
End

function LuaS_205911()
	ClearBorder( OwnerID())	--初始化石碑介面
	AddBorderPage( OwnerID(), "[SC_205911]" )
	ShowBorder( OwnerID(), 0, "[205911]", "ScriptBorder_Texture_Paper" )	
End

function LuaS_205912()
	ClearBorder( OwnerID())	--初始化石碑介面
	AddBorderPage( OwnerID(), "[SC_205912]" )
	ShowBorder( OwnerID(), 0, "[205912]", "ScriptBorder_Texture_Paper" )	
End

function LuaS_205914()
	ClearBorder( OwnerID())	--初始化石碑介面
	AddBorderPage( OwnerID(), "[SC_205914]" )
	ShowBorder( OwnerID(), 0, "[205914]",  "ScriptBorder_Texture_Paper" )	
End

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--422690窺看進展 780350 

function LuaI_422690_1()		--「要創立一個檢查範圍的隱形物件EX.113331」
	if CheckBuff( OwnerID() , 504761) == false then
		SetPosByFlag( OwnerID(), 780350 , 1)
	end
end

function LuaM_504765_0()--BUFF檢查傳送
	SetPosByFlag( OwnerID(), 780350 , 1)
--	種出負傷的威廉
end

--function LuaS_422690_0() --掛在威廉身上	（移到422678）
--	if 	(CheckAcceptQuest(OwnerID(),422690)==true )and( CheckFlag( OwnerID(),543332)==false) 	then 
--		AddSpeakOption(OwnerID(),TargetID(),"[SC_422690_0]","LuaS_422690_1",0)		 --...可以把我塞進箱子裡了...
--	end
--end

function LuaS_422690_1()
	closespeak(OwnerID())
	if ReadRoleValue( TargetID() , EM_RoleValue_Register+9 ) == 0 then
		say(TargetID(),"[SC_422690_1]")						--噢！好～沒問題，我待會就躲在你旁邊的箱子，見機行事！	
		WriteRoleValue ( TargetID()  , EM_RoleValue_Register+9, OwnerID())			--將OwnerID()<玩家>寫進TargetID()威廉裡
		BeginPlot( TargetID(), "LuaS_422690_2", 0 )					-- TargetID()是威廉							    	    
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SAY_NPC_BUSY]" , 0 )
		tell(OwnerID() ,TargetID(), "[SC_422690_2]" )			 --現在還不能把你塞進箱子內，我剛看見蛇人在巡邏。
	end
end

function LuaS_422690_2()
	DisableQuest( OwnerID(), true )						--OwnerID是威廉
	Yell( OwnerID() , "[SC_422690_3]" , 3 ) 		--準備行動，待會你可別滾出去了～				--告誡 OwnerID,TargetID是威廉
	sleep( 20 )
	local player = ReadRoleValue(OwnerID(),EM_RoleValue_Register+9)							--設定玩家的宣告
	if CheckID( player ) == true then
		SetPosByFlag( player  , 780350 , 2 )										--傳送玩家
		AddBuff( player  , 504761 , 1 , -1 )										--給玩家BUFF 偽裝
		AddBuff( player  , 503977 , 1 , 60 )										--給玩家BUFF 乖乖看戲
		ScriptMessage(  player , player, 2 , "[SC_422690_4]" , 0 ) 	--箱子因為你的潛入而略微晃動，蛇人似乎沒發現異樣。	
	--	ScriptMessage(  player , player, 0 , "[SC_422690_4]" , 0 ) 
		local MA = CreateObjByFlag( 113574 , 780350 , 3 , 1 )							--種出演戲NPC
		WriteRoleValue(MA , EM_RoleValue_IsWalk, 1 )									--走路
		SetRoleCamp(  MA , "Visitor" )	
		AddToPartition( MA , 0 )									--改變陣營，免得玩家被打，也把追逐調低
		tell(player ,OwnerID() , "[SC_422690_5]")		--小心！他們來了～
		MoveToFlagEnabled( MA  , false )	
		BeginPlot( MA , "LuaI_113488_2" , 0 )	
	else
			WriteRoleValue(OwnerID(),EM_RoleValue_Register+9 , 0 )
	end
	DisableQuest( OwnerID(), false )
end

function LuaI_113488_1()
	say( TargetID() , "[SC_422690_2]" )			 --現在還不能把你塞進箱子內，我剛看見蛇人在巡邏。
end

function LuaI_113488_2()
	local SNAKE,WASN ,AIDE = 0
	local player = ReadRoleValue(TargetID(),EM_RoleValue_Register+9)							--巡邏關閉 			
	sleep(10)
	DW_MoveToFlag( OwnerID() , 780350 , 4, 0 )	
	AIDE = CreateObjByFlag( 113575 , 780350 , 3, 1 )
	WriteRoleValue(AIDE , EM_RoleValue_IsWalk, 1 )
	Hide( AIDE )
	Show( AIDE ,0)	
	SetRoleCamp(  AIDE , "Visitor" )
	AddToPartition( AIDE , 0 )
	MoveToFlagEnabled( AIDE , false )
	BeginPlot( AIDE, "LuaI_113488_3", 0 )	
	Yell( AIDE , "[SC_422690_18]" , 3 )	 	--將軍！									
	DW_MoveToFlag( OwnerID() , 780350 , 5, 0 )
	SetFightMode( AIDE , 0 , 0 , 0 , 0)										--設定戰鬥特徵 不索敵、不逃跑、不移動、不攻擊
	sleep( 10)
	AdjustFaceDir( OwnerID() ,AIDE , 0 ) 										--面向
	sleep( 5 )
	Yell( OwnerID() , "[SC_422690_6]" , 3 ) 		--同樣的話別讓我再說第二次！
	sleep(20)
	Yell( AIDE , "[SC_422690_7]" , 3 )	 	--將軍，赤蛇將軍特地派他的親衛過來，也許確有其事。
	sleep(25)
	Yell( OwnerID() , "[SC_422690_8]" , 3 )		--命令是由韓絲翠女士親自發佈，你質疑這項宣告意味著你認為沙利德真的暗中做了什麼？
	sleep(35)
	Yell( AIDE , "[SC_422690_9]" , 3 ) 		--...將軍...原諒屬下冒犯，我不是最近才擔任您的副官，這件事情的發展真的很可疑...
	sleep(20)
	Yell( AIDE , "[SC_422690_10]" , 3 ) 		--而且密函上也提出想進一步確認可以向赤蛇將軍尋求證據...
	sleep(25)
	Yell( OwnerID() , "[SC_422690_11]" , 3 ) 		--從他成為蛇人王那一天起，我已決定獻上我的忠誠，別再讓這種流言擴散。
	sleep(25)
	Yell( OwnerID() , "[SC_422690_12]" , 3 ) 		-- 你只要記得他是我們的王，明白？
	sleep(30)
	Yell( AIDE , "[SC_422690_13]" , 3 )		--但是...我的將軍是你...而蛇人王之位原本應該也是...
	sleep(20)
	Yell( OwnerID() , "[SC_422690_14]" , 3 ) 		--你是我最信任的下屬，你對我的忠誠我很清楚，已經接近違紀的話別輕易說出口。
	sleep(35)
	Yell( AIDE , "[SC_422690_15]" , 3 ) 		--...將軍，赤蛇將軍的親衛不幸遇害，請容許屬下代替將軍前去血沸哨站表達慰問。
	sleep(30)
	Yell( OwnerID() , "[SC_422690_16]" , 3 )		 --你...
	ScriptMessage(  player , player, 2 , "[SC_422690_33]" , 0 ) 	--[102509]幾不可聞地嘆了一口氣..
	sleep(10)
	Yell( OwnerID() , "[SC_422690_34]" , 3 ) 		--好吧，卡喀翁的親衛隊在我的營地遭到殺害，你代替我走一趟血沸哨站。
	sleep(20)
	Yell( AIDE , "[SC_422690_17]" , 3 )		--是！屬下領命！
--	DW_MoveToFlag( OwnerID(), 780350 , 8, 0 )									--（往炮烙鐵橋走）
	sleep(20)			
	DelObj( AIDE )
	if CheckID(player) then
		if CheckAcceptQuest( player , 422690) == true then
			SetFlag( player , 543332  , 1 )
		end
	end
	sleep(30)	
	BeginPlot( AIDE, "LuaI_113488_4", 0 )
	Yell( OwnerID() , "[SC_422690_19]" , 3 ) 			--現在，誰能為我說明，是哪一個在我巡視時擅自決定處置了「索雷爾頓」的人？
	SNAKE  = CreateObjByFlag( 113573 , 780350 , 3 , 1 )								--種出演戲NPC
	WriteRoleValue(SNAKE , EM_RoleValue_IsWalk, 0 )								--跑步
	SetRoleCamp( SNAKE , "Visitor" )										--改變陣營，免得玩家被打，也把追逐調低
	AddToPartition(  SNAKE, 0 )
	MoveToFlagEnabled( SNAKE  , false )	
	DW_MoveToFlag( SNAKE , 780350 , 4, 0 )
	AdjustFaceDir( SNAKE  ,OwnerID() , 0 ) 										--面向
	sleep(10)
	Yell( SNAKE , "[SC_422690_20]" , 3 ) 			   --將軍...我、我...是我...
	sleep(20)
	ScriptMessage(  player , player, 2 , "[SC_422690_21]" , 0 )   	   --周遭似乎靜默下來，緊繃氣氛讓蛇人不敢多說一句話。
	sleep(30)
	Yell( OwnerID(), "[SC_422690_22]" , 3 )  			   --解釋。
	sleep(20)
	Yell( SNAKE , "[SC_422690_23]" , 3 )			   --是！他們、索雷爾頓幾個傢伙趁大家沒注意時放火燒了一些物資，屬下一時氣憤才會、才會...
	sleep(25)
	Yell( OwnerID(), "[SC_422690_24]" , 3 )  			   --你們親眼看見？
	sleep(20)
	Yell( SNAKE , "[SC_422690_25]" , 3 )			   --呃...稟告將軍...沒有...但是營地裡就只有見不得光的他們，一定是他們...
	sleep(25)
	Yell( OwnerID(), "[SC_422690_26]" , 3 )  			   --你們在營地駐守，卻沒能親眼看見犯人，沒有任何證據卻一口咬定是索雷爾頓，是嗎？
	sleep(20)
	Yell( SNAKE , "[SC_422690_27]" , 3 )			   --將軍饒命！將軍饒命！
	sleep(15)
	Yell( OwnerID(), "[SC_422690_28]" , 3 )  			   --下去吧，掌握證據之前別讓我再看見這種幾乎是逞一時之快的舉動。
	sleep(20)
	Yell( SNAKE , "[SC_422690_29]" , 3 )			   --是、是！謝謝將軍。
	sleep(20)
	DW_MoveToFlag( OwnerID() , 780350 , 6, 0 )
	sleep(10)
	tell(player ,TargetID(),"[SC_422690_30]")	                   --太好了！他背對我們～暗殺時機就是現在！
	sleep(10)
	ScriptMessage(  player , player, 2 , "[SC_422690_36]" , 0 )   	   --[113488]舉劍衝了出去！
	WASN = CreateObjByFlag( 113576 , 780350 , 7 , 1 )
	AddToPartition(  WASN , 0 )
	sleep(20)
	Yell( SNAKE , "[SC_422690_31]" , 3 )			   --是誰？索雷爾頓！
	sleep(10)
	SetAttack(WASN,OwnerID())
	PlayMotion( WASN, ruFUSION_ACTORSTATE_ATTACK_1H)
	sleep(10)
	AdjustFaceDir( OwnerID() , WASN, 0 )
	SetAttack(OwnerID(),WASN)
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_ATTACK_1H)
	sleep(20)
	Yell( WASN, "[SC_422690_35]" , 3 )  			   --嗚...
	sleep(15)
	if CheckID(player) then
		tell(player ,TargetID(),"[SC_422690_32]")	           	   --糟糕！不行...先撤退、你快走、快走...
		if CheckAcceptQuest( player , 422690) == true then
			SetFlag( player , 543332  , 1 )
			SetFlag( player , 543349  , 1 )
		end
		CancelBuff_NoEvent( player  , 503977 )									--取消BUFF
		CancelBuff( player  , 504761 )
	end
	WriteRoleValue ( TargetID()  , EM_RoleValue_Register+9, 0 )
	DelObj( SNAKE )
	DelObj( WASN )
	DelObj( OwnerID() )
end


function LuaI_113488_3()
	DW_MoveToFlag( OwnerID(), 780350 , 4, 0 )	
	Yell( OwnerID(), "[SC_422690_18]" , 3 )		--將軍！
end


--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--422774謝幕煙火	旗子：780356


function LuaI_113508_Use()
	local Fire = {}	
	local amount = 20
	For i=1, amount  do
		Fire[i] = Lua_DW_CreateObj("flag" ,112399, 780356, i )
		CastSpell( Fire[i], Fire[i], 493828 )
		AddBuff(Fire[i] , 503605 , 1 , -1 )	
--		Lua_ObjDontTouch( Fire ) 
--		AddToPartition( Fire , 0 )
--		AddBuff( Fire , 503605 , 1 , -1 )
		BeginPlot( Fire[i]  , "LuaI_113508_Play" , 0 )
		if CheckAcceptQuest( OwnerID() , 422774) == true then
			SetFlag( OwnerID() , 543331 , 1 )
		ScriptMessage(  OwnerID(), OwnerID(), 1 , "[SC_422774_0]" , 0 )   	   --你引爆了炸藥！
		end
	end
	return 1
end

function LuaI_113508_Play()
	local Me = Role:new( OwnerID() )
	AddBuff( OwnerID() , 502724 , 1 , -1 )
	CastSpell( OwnerID(), OwnerID(), 493828 )
	local Count = GetMoveFlagCount(780356)
	local Dis = 20
	local Fire = {}
	local num = 1
	local FirePoint = {}
	for i = 1 , Count-4 , 1 do
		FirePoint[i] = i + 3
	end
--	SetFlag( OwnerID() , 543349 , 1 )
	while table.getn( Fire ) < Count -4 do
		for pry , obj in pairs(FirePoint) do
			if obj ~= 0 then
				local X = GetMoveFlagValue( 780356 , obj , EM_RoleValue_X )
				local Y = GetMoveFlagValue( 780356 , obj , EM_RoleValue_Y )
				local Z = GetMoveFlagValue( 780356 , obj , EM_RoleValue_Z )
				if ( ( Me:X() - X ) ^ 2 + ( Me:Z() - Z ) ^ 2 ) < Dis^2 then
					Fire[num] = CreateObj( 112399 , X , Y , Z , 0 , 1 )
					Lua_ObjDontTouch( Fire[num] ) 
					AddToPartition( Fire[num] , 0 )
--					BeginPlot( Fire[num] , "LuaI_205579_Fire" , 0 )
					WriteRoleValue(  Fire[num]  , EM_RoleValue_LiveTime , 60 )
					num = num + 1
					FirePoint[pry] = 0
				end
			end
		end
		Dis =Dis + 20
		if Dis > 320 then
			break
		end
		sleep( 30 )
	end
	sleep( 60 )
	CancelBuff_NoEvent( OwnerID() , 502724 )
	sleep( 50 )
--	SetFlag( TargetID() , 543350 , 1 )
	DelObj( OwnerID() )
end


--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--狙殺馬弗爾 旗子：780353	 1-2號
function LuaS_113550_0()
		LoadQuestOption(OwnerID())	
	if 	(CheckAcceptQuest(OwnerID(),422697)==true )and( CheckCompleteQuest( OwnerID(),422697)==false)and (CheckBuff( OwnerID() , 504781 ) == true) then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422697_0]","LuaS_113550_1",0)		 --將軍，我找到這只箱子
	end
end

function LuaS_113550_1()
	closespeak(OwnerID())
	BeginPlot( TargetID() , "LuaS_113550_2" , 0 )
	
	if	CountBodyItem( OwnerID(), 205930 )>0	then
		DelBodyItem( OwnerID(), 205930, 1 )
	end
	local BOX =  LuaFunc_SearchNPCbyOrgID( OwnerID() , 113572 , 100 )
	if CheckID(BOX ) == false then
		local box=CreateObjByFlag( 113572 , 780353 , 1, 1 )
		AddToPartition(  box, 0 )
	end
	say(TargetID(),"[SC_422697_1]")				--外觀沒錯..你在哪裡找到它？	
end

function LuaS_113550_2()
	sleep(25)
	ScriptMessage( TargetID() , TargetID(), 2, "[SC_422697_2]" , 0 ) 	--趁馬弗爾察看箱子，這是一個攻擊的好時機！
	sleep(30)
	local BA,Player=0							
	Hide(OwnerID())		--OwnerID是馬弗爾
	local MA = Lua_DW_CreateObj("obj" , 102509 , OwnerID() )	
	ScriptMessage( TargetID() , TargetID(), 1, "[SC_422697_7]" , 0 ) 	--你的偽裝被識破了！
	CancelBuff_NoEvent( TargetID() , 504781 )							
	SetPlot(MA,"dead","LuaS_422697_3",0 )
	BeginPlot(MA, "LuaS_Discowood_CheckPeace" , 0 )
	sleep(10)
	BA= CreateObjByFlag( 102551 , 780353 , 2 , 1 )	
	AddToPartition(  BA, 0 )
	SetAttack(MA,TargetID())
	SetAttack(BA,MA)
	sleep(30)
	local YA=CreateObjByFlag( 102552 , 780353 ,2, 1 )
	AddToPartition(  YA, 0 )
	WriteRoleValue (YA , EM_RoleValue_PID,BA  ) 
	WriteRoleValue (BA , EM_RoleValue_PID,YA  ) 
	say(YA,"[SC_422697_3]")--我來支援你們！
	WriteRoleValue (MA , EM_RoleValue_PID,YA  ) 
	SetAttack(YA,MA)
	SetAttack(MA,YA)
	while true do
		sleep(10)
		if CheckID(MA)==false then
			Show(OwnerID() , 0)
			break
		end
	end
end


--function LuaS_422697_2() --亞榭娜登場
--	local YA=CreateObjByFlag( 102552 , 780353 , 2, 1 )
--	AddToPartition(  YA, 0 )
--	say(OwnerID(),"888")
--	say(YA,"[SC_422697_3]")--我來支援你們！
--	WriteRoleValue (OwnerID() , EM_RoleValue_PID,YA  ) 
--	SetAttack(YA,OwnerID())
--end

function LuaS_422697_3() --怪的死亡劇情
	local YA = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local BA = ReadRoleValue(YA,EM_RoleValue_PID)
	local Player 
	for i=0, HateListCount( OwnerID() )-1 do
		Player = HateListInfo(OwnerID() , i , EM_HateListInfoType_GItemID )
		if	CheckAcceptQuest ( Player   , 422697 )	then
			SetFlag( Player   , 540799, 1 )
		end
		if	CountBodyItem( Player , 205964 )>0	then
			DelBodyItem( Player , 205964, 1 )
		end
		ScriptMessage( Player  , Player , 2, "[SC_422697_5]" , 0 ) --	--營地出現一陣騷動，黑蛇副官似乎回來了。
	end

	if CheckID(YA) == true and ReadRoleValue( YA , EM_RoleValue_OrgID ) == 102552 and ReadRoleValue( YA , EM_RoleValue_IsDead ) == 0 then
		BeginPlot( YA , "LuaS_422697_4" , 0)
	else
		if CheckID(BA) == true and ReadRoleValue( BA , EM_RoleValue_OrgID ) == 102551 then
			delobj(BA)
		end
	end

	return true
End

function LuaS_422697_4() 
	local BA = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	Lua_CancelAllBuff( OwnerID()  ) 
	SetStopAttack( OwnerID() )
	SetRoleCamp( OwnerID() , "Visitor" )
	if CheckID(BA) == true and ReadRoleValue( BA , EM_RoleValue_OrgID ) == 102551 then
		Lua_CancelAllBuff( BA) 
		SetStopAttack( BA)
		SetRoleCamp( BA, "Visitor" )
	end
	Say(OwnerID(), "[SC_422697_4]")	--馬弗爾...
	sleep(30)
	Say(OwnerID(), "[SC_422697_6]")	--走吧，離開這裡～
	sleep(30)
	if CheckID(BA) == true and ReadRoleValue( BA , EM_RoleValue_OrgID ) == 102551 then
		DelObj(BA)
	end
	DelObj( OwnerID())
end

--變身蛇人藥劑
function LuaI_205964_Check()	--掛在偽裝蛇人藥劑

	if CheckBuff( OwnerID() , 504781 ) == true then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_205964_0]" , 0 ) --你已經偽裝成蛇人
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_205964_0]" , 0 ) 
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

	if	CheckAcceptQuest(OwnerID(),422697)== false then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_205964_1]" , 0 ) --只能在狙殺馬弗爾的行動中使用
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_205964_1]" , 0 ) 
		return false
	end
	if CheckMapID(  X ,Y ,Z , 717 ) == false  then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_205760_1]" , 0 ) --必須靠近[ZONE_THE MOLTEN BRIDGE]附近的黑蛇營地使用
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_205760_1]" , 0 ) 
		return false
	end
	ScriptMessage( OwnerID() , OwnerID(), 2, "[SC_205964_2]" , 0 ) 	--偽裝成蛇人的時間短暫，盡快將[205930]送去黑蛇將軍營帳！
	sleep(10)
	ScriptMessage( OwnerID() , OwnerID(), 1, "[SC_205964_3]" , 0 ) 	--注意備戰！隨時有被發現的危險！
end

function Lua_ObjAreaCheck_504782_0() --偽裝偵測地點
		if	Lua_ObjAreaCheck(OwnerID() , 717 ) == false 	then
			CancelBuff_NoEvent( OwnerID() , 504781 )
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_205760_1]" , 0 ) --必須靠近[ZONE_THE MOLTEN BRIDGE]附近的黑蛇營地使用
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_205760_1]" , 0 ) 
		end
end


--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--混帳甘諾德 旗子780352 1-16

function LuaM_422684_Range_0() --請掛在檢查點上
	writerolevalue( OwnerID() , EM_RoleValue_PID , 0 )
	SetPlot( OwnerID() , "range" , "LuaM_422684_Range_1" , 30 ) --調整最後的數字以改變偵測範圍
end

function LuaM_422684_0()--接任務後
	if	CheckAcceptQuest( TargetID() , 422684 ) == true and CheckFlag( TargetID() , 543347 ) == false then
	ScriptMessage( TargetID() , TargetID() , 0 , "[SC_422684_25]" , 0 ) --[113487]原本站的位置似乎有一些微弱的亮光，也許可以過去瞧瞧！
	ScriptMessage( TargetID() , TargetID() , 2 , "[SC_422684_25]" , 0 )
	end
end

function LuaM_422684_Range_1()
	if	CheckAcceptQuest( OwnerID() , 422684 ) == true and 
		CheckFlag( OwnerID() , 543347 ) == false and
		CheckBuff( OwnerID() , 504319)== false then   --定身BUFF
		
		AddBuff( OwnerID() , 504319 , 1 , -1 ) --定身BUFF
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422684_0]" , 0 ) --[113487]在地上設置了一個的套索，看得出是倉促之下做出，套索效用制止你前進的步伐。
		ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_422684_0]" , 0 )
		sleep(30)
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422684_1]" , 0 ) 	--遺留在地上的一張紙籤凌亂字跡寫著：「事跡敗露，走～快走！別來找我～」
		ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_422684_1]" , 0 )
		if ReadRoleValue( TargetID() , EM_RoleValue_PID ) == 0 then
			BeginPlot(TargetID() , "LuaM_422684_1" , 0) 	
		end
		SetPosByFlag( OwnerID(), 780355 ,1 )
	end
end

function LuaM_422684_1()
	writerolevalue( OwnerID() , EM_RoleValue_PID , 1 )
	sleep(20)
	ScriptMessage( TargetID() , TargetID() , 0 , "[SC_422684_26]" , 0 ) 		--一陣騷動
	ScriptMessage( TargetID() , TargetID() , 1 , "[SC_422684_26]" , 0 )
	sleep(10)

	local Player = {}
	local snake = {}
	for i=1,4,1 do
		snake[i] = CreateObjByFlag( 113564 , 780352 , i , 0 ) --4蛇
		AddToPartition( snake[i] , 0 )
		MoveToFlagEnabled( snake[i] , false )
		WriteRoleValue( snake[i] , EM_RoleValue_PID , i+5 )
	end
	local NPC = CreateObjByFlag( 113565 , 780352 , 5 , 0 )  --1蛇
	AddToPartition( NPC , 0 )
	MoveToFlagEnabled( NPC , false )


	yell( snake[1] , "[SC_422684_2]",3 )         --  抓到了！
	sleep(10)
	yell( snake[2] , "[SC_422684_3]",3 )         --  抓到兇手了～
	sleep(10)
	yell( snake[3] , "[SC_422684_4]",3 )         --  是索雷爾頓的人！
	sleep(20)	
	yell( snake[4] , "[SC_422684_5]",3 )         --  燒死他！燒死他～
	for i = 1, 4 , 1 do
		WriteRoleValue( snake[i] , EM_RoleValue_Register , 0 )
		beginplot( snake[i] , "LuaM_422684_3" , 0 )
	end
	LuaFunc_MoveToFlag( NPC , 780352 , 10 ,  0 )

	local NOD = CreateObjByFlag( 113566 , 780352 , 11 , 0 )  --甘諾德
	AddToPartition( NOD , 0 )
	SetDefIdleMotion( NOD , ruFUSION_MIME_DEATH_LOOP)
	AddBuff(NOD  ,503605 , 1 , 45 )  --燒火特效	
	AdjustFaceDir( snake[2] ,NOD, 0 ) 
	sleep(20)
	AdjustFaceDir( snake[1] ,NOD, 0 ) 
	yell( NPC , "[SC_422684_6]" ,5) --快說！索雷爾頓的！誰讓你來破壞我們的東西？
	AdjustFaceDir( snake[3] ,NOD, 0 ) 
	AdjustFaceDir( snake[4] ,NOD, 0 ) 
	sleep(20)
	yell( NOD, "[SC_422684_7]" ,5)  --啊～～啊～...
	sleep(20)

	yell( NPC , "[SC_422684_8]" ,5) --還不說？嘴硬！看誰比較能撐！看你這模樣應該不是主謀吧？
	sleep(20)
	yell( NPC , "[SC_422684_9]" ,5) --你那龜縮的頭頭在哪？
	sleep(20)
	ScriptMessage( TargetID() , TargetID() , 1 , "[SC_422684_10]" , 0 ) --皮膚與火接觸的焦灼味逐漸蔓延開來...
	ScriptMessage( TargetID() , TargetID() , 0 , "[SC_422684_10]" , 0 )
	sleep(30)
	yell( NOD, "[SC_422684_11]",5)  --不准...污辱...啊～
	sleep(20)
	yell( NPC , "[SC_422684_12]" ,5) --哈哈～你們聽聽，他還想抗辯！
	sleep(20)
	yell( NPC , "[SC_422684_13]" ,5)--就憑你？
	sleep(20)
	yell( NOD, "[SC_422684_14]" ,5)  --住手，滾......
	sleep(20)
	yell( snake[1] , "[SC_422684_15]" ,5)         -- 哇！燒慢一點，你看他的皮膚～還不夠爛～
	sleep(20)
	yell( snake[2] , "[SC_422684_16]" ,5)         --  哈哈～別壓著他～滾一圈來看看～
	sleep(20)
	yell( snake[3] , "[SC_422684_17]" ,5)         --  讓他跳舞、跳舞～燒他的腳！
	sleep(20)	
	yell( snake[4] , "[SC_422684_18]" ,5)         --  你看他，還想反抗，掙扎吧～再叫啊！
	sleep(20)
	ScriptMessage( TargetID() , TargetID() , 1 , "[SC_422684_19]" , 0 ) --甘諾德的掙扎與哀嚎停止了......
	ScriptMessage( TargetID() , TargetID() , 0 , "[SC_422684_19]" , 0 )
	sleep(30)
	yell( snake[1] , "[SC_422684_20]",5 )         -- 啊...死了？
	sleep(20)
	yell( snake[2] , "[SC_422684_21]" ,5)         --  這麼快？
	sleep(20)
	yell( snake[3] , "[SC_422684_22]" ,5)         --  人類就是沒用～
	sleep(20)	
	yell( snake[4] , "[SC_422684_23]" ,5)         --  把他丟了吧～

	LuaFunc_MoveToFlag( NPC , 780352 , 12 ,  0 )
	for i = 1, 4 , 1 do
		WriteRoleValue( snake[i] , EM_RoleValue_Register , 1 )
		beginplot( snake[i] , "LuaM_422684_3" , 0 )
	end

	Delobj( NPC ) --刪掉大蛇
--	for i=1,4,1 do
--		Delobj( snake[i] )  --刪掉4蛇
--	end
	Delobj( NOD ) --刪掉甘諾德

	--檢查條件給完成任務旗標
	Player = SearchRangePlayer(OwnerID() , 200)
	For i=0,table.getn(Player)-1 do
		If	CheckAcceptQuest( Player[i], 422684 ) == true	and
			CheckFlag( Player[i] , 543347 ) == false then   --定身BUFF

			SetFlag(Player[i] , 543347 , 1)
			ScriptMessage( Player[i] , Player[i] , 1 , "[SC_422684_24]" , 0 ) --快把這邊發生的事情回報給[113488]!
			ScriptMessage( Player[i] , Player[i] , 0 , "[SC_422684_24]" , 0 )
		end
		if CheckBuff( Player[i] , 504319 ) == true then
			CancelBuff( Player[i] , 504319 )  --解除定身Buff
		end
	end
	writerolevalue( OwnerID() , EM_RoleValue_PID , 0 )
	
end

function LuaM_422684_3()
	local Flag
	if ReadRoleValue( OwnerID() , EM_RoleValue_Register ) == 0 then
		Flag = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	else
		Flag = ReadRoleValue( OwnerID() , EM_RoleValue_PID ) +7
	end
	LuaFunc_MoveToFlag(OwnerID(), 780352 , Flag,  0 )
	if ReadRoleValue( OwnerID() , EM_RoleValue_Register ) ~= 0 then
		DelObj( OwnerID() )
	end
end
