--節慶活動 2009年3月歡舞節
--建立時間: 2009/02/13
--修改日期: 2009/03/12
--建立者  : 活動企劃 潘晉佳
------------------------------------------------------------------------------
--物品 收件者清單 204114

------------------------------------------------------------------------------
function LuaS_112312_list()
	ClearBorder( OwnerID() );
	AddBorderPage( OwnerID(), "[SC_112312_112]" );
	ShowBorder( OwnerID(), 0, "[SC_112312_111]" , "ScriptBorder_Texture_Paper" )
end

------------------------------------------------------------------------------
--活動3 限時送信

------------------------------------------------------------------------------
function LuaN_112312_0() --此Script寫在NPC瑞恩上
	--LoadQuestOption( OwnerID() )
	local today= CheckFlag(OwnerID()  , 542396) -- 今日已解過此任務
	local allpass= CheckFlag(OwnerID()  , 542395) -- 已送給npc5
	local getnpc4= CheckFlag(OwnerID()  , 542394) -- 已送給npc4
	local getnpc3= CheckFlag(OwnerID()  , 542393) -- 已送給npc3
	local getnpc2= CheckFlag(OwnerID()  , 542392) -- 已送給npc2
	local getnpc1= CheckFlag(OwnerID()  , 542391) -- 已送給npc1
	local getnpc0= CheckFlag(OwnerID()  , 542390) -- 和npc0接了
	local letter =  CountBodyItem( OwnerID() , 203865 ) --舞會邀請函
	local clock = ClockRead( OwnerID() , EM_ClockValueType_NowTime ) --倒數秒數

	if EmptyPacketCount( OwnerID() ) >= 2  and QueuePacketCount( OwnerID() ) == 0 then
		if  clock > 0  then --讀取時鐘資料 計時秒數不= 0
			if today== true then
				SetSpeakDetail( OwnerID(), "[SC_112312_TODAY]" )-- 今天真是辛苦你了。有興趣的話，明天再繼續請你幫忙喔！
			elseif allpass== true then--如果已完成全部(已送給npc5)
					ClockClose( OwnerID() )
					SetSpeakDetail( OwnerID(), "[SC_112312_5]" )-- 您的速度真是驚人啊，為了感謝您的辛勞，這禮物就請你收下吧！
					GiveBodyItem( OwnerID() , 203864  , 1 ) --舞會禮盒
					if letter > 0 then
						DelBodyItem(OwnerID() ,203865 , letter) --收走玩家身上所有舞會邀請函
					end
					SetFlag( OwnerID()  , 542396 , 1 ) -- 給玩家 today Flag
			elseif getnpc4 ==false or getnpc3 ==false or getnpc2 ==false or getnpc1 ==false then
				SetSpeakDetail( OwnerID(), "[SC_112312_001]" )--要請你幫忙寄送的收件者有：(略)
			end
		elseif clock == 0 then   --讀取時鐘資料 clock =0  未於任務狀態or中途失敗.1~4階段領獎勵)  
			if today== true then --如果今天已解過
                		SetSpeakDetail( OwnerID(), "[SC_112312_TODAY]" )-- 今天真是辛苦你了。有興趣的話，明天再繼續請你幫忙喔！
			else
				if getnpc4== true then --如果已送給npc4
					SetSpeakDetail( OwnerID(), "[SC_112312_4]" )-- 就差這麼一點了，(略)
					GiveBodyItem( OwnerID() , 520122  , 1 ) --符文體力II X1 
					GiveBodyItem( OwnerID() , 203295  , 5 ) --星雲瀰漫煙火x5
					SetFlag( OwnerID()  , 542396 , 1 ) -- 給玩家 today Flag
				else      
					if getnpc3== true then --如果已送給npc3
						SetSpeakDetail( OwnerID(), "[SC_112312_123]" )-- 也許您路途中有些擔誤了吧。(略)
						GiveBodyItem( OwnerID() , 203868  , 5 ) --紅色魔法藥水X5
						GiveBodyItem( OwnerID() , 203294  , 5 ) --金碧輝煌煙火X5
						SetFlag( OwnerID()  , 542396 , 1 ) -- 給玩家 today Flag
					else
						if getnpc2== true then--如果已送給npc2
							SetSpeakDetail( OwnerID(), "[SC_112312_123]" )-- 也許您路途中有些擔誤了吧。(略)
							GiveBodyItem( OwnerID() , 200154  , 10 ) --基礎醫療藥水 X10
							GiveBodyItem( OwnerID() , 203295  , 2 ) --星雲瀰漫煙火 X2
							SetFlag( OwnerID()  , 542396 , 1 ) -- 給玩家 today Flag
						else
							if getnpc1== true then--如果已送給npc1
								SetSpeakDetail( OwnerID(), "[SC_112312_123]" )-- 也許您路途中有些擔誤了吧。(略)
								GiveBodyItem( OwnerID() , 200154  , 5 ) --基礎醫療藥水 X5
								GiveBodyItem( OwnerID() , 203294  , 2 ) --金碧輝煌煙火 X2
								SetFlag( OwnerID()  , 542396 , 1 ) -- 給玩家 today Flag
							else
								if getnpc0== true then--如果接任務
									SetSpeakDetail( OwnerID(), "[SC_112312_NOT]" )-- 天啊，你該不會把這件事忘光了吧！(略)
									if letter > 0 then
										DelBodyItem(OwnerID() ,203865 , letter) --收走玩家身上所有舞會邀請函
									end
									SetFlag( OwnerID()  , 542396 , 1 ) -- 給玩家 today Flag
								else -- 活動初始
									SetSpeakDetail( OwnerID(), "[SC_112312_0]" )-- 慘了！這裡竟然還有5封邀請函還沒寄出去！(略)
									AddSpeakOption( OwnerID(), OwnerID( ), "[SC_112312_01]" , "LuaN_112312_go", 0 ) --接受委託「限時送信」
								end
									
							end
						end 
					end
					
				end
			end
		end
	else
		SetSpeakDetail( OwnerID(), "[SC_112311_8]"   )--您的背包空間不足，請清理一下再來吧。  SC_112311_8
	end
end
----------------------------------------------------------------------------------------------
function LuaN_112312_go() -- 接受委託
	SetSpeakDetail( OwnerID(), "[SC_112312_001]" )-- 要請你幫忙寄送的收件者有：(...略)
	GiveBodyItem( OwnerID() , 203865  , 5 ) --舞會邀請函x5
	GiveBodyItem( OwnerID() , 204114  , 1 ) --收件者清單x1
	ClockOpen( OwnerID(), EM_ClockCheckValue_3 , 480, 480 , 0  , "" , "Lua_112312clock_close" ); --設定計時器開始,8分鐘
	SetFlag( OwnerID()  , 542390 , 1 ) -- 給玩家 getnpc0 Flag
end
--------------------------------------
function Lua_112312clock_close()  --計時器停止
	local letter =  CountBodyItem( OwnerID() , 203865 ) --舞會邀請函
	ClockClose( OwnerID() )
	if letter > 0 then
		DelBodyItem(OwnerID() ,203865 , letter) --收走玩家身上所有舞會邀請函
	end
	ScriptMessage( OwnerID(),  OwnerID(), 2, "[SC_112312_BACK]" , 0 )	--時間倒數停止，請回中央廣場找瑞恩回報。
end
----------------------------------------------------------------------------------------------
function LuaN_112314_1() -- npc1
	local getnpc1= CheckFlag(OwnerID() , 542391) -- 已送給npc1
	local getnpc0= CheckFlag(OwnerID() , 542390) -- 和npc0接了
	local letter =  CountBodyItem( OwnerID() , 203865 ) --舞會邀請函
	if getnpc1 == true then --npc1已經送了
		SetSpeakDetail( OwnerID(), "[SC_112314_03]" )--  [完成]唔…到底該買上次在西街看到的套裝還是旅行商人的外套好呢？ (略)
	else  -- false
		if getnpc0 == true then --已和npc0接(任務進行中)
			if letter > 0 then
				SetSpeakDetail( OwnerID(), "[SC_112314_02]" )-- [進行]竟然現在才送到，你也不看看是哪時候了。(略)
				DelBodyItem( OwnerID() , 203865 , 1 ) --邀請函
				SetFlag( OwnerID()  , 542391 , 1 ) -- 給玩家 getnpc1 Flag
			else
				SetSpeakDetail( OwnerID(), "[SC_1123_LOST]" )-- 什麼？你說把邀請函搞丟了？我沒聽錯吧？
			end
		else -- false (未接此活動狀態)
			SetSpeakDetail( OwnerID(), "[SC_112314_01]" )-- [未接]今年的舞會籌辦委員會是哪些人啊，到現在連張邀請函都沒寄出去！
		end
	end
end
-----------------------------------------------------------------------------------------
function LuaN_112315_1() -- npc2
	local getnpc2= CheckFlag(OwnerID()  , 542392) -- 已送給npc2
	local getnpc1= CheckFlag(OwnerID()  , 542391) -- 和npc1接了
	local letter =  CountBodyItem( OwnerID() , 203865 ) --舞會邀請函

	if getnpc2 == true then --npc2已經送了
		SetSpeakDetail( OwnerID(), "[SC_112315_03]" )--  [完成]看來最近又開始熱鬧起來囉。(略)
	else  -- false
		if getnpc1 == true then --已和npc1接(任務進行中)
			if letter > 0 then
				SetSpeakDetail( OwnerID(), "[SC_112315_02]" )-- [進行]給我的邀請函？(略)
				SetFlag( OwnerID()  , 542392 , 1 ) -- 給玩家 getnpc2 Flag
			else
				SetSpeakDetail( OwnerID(), "[SC_1123_LOST]" )-- 什麼？你說把邀請函搞丟了？我沒聽錯吧？
			end
		else -- false (未接此活動狀態)
			SetSpeakDetail( OwnerID(), "[SC_112315_01]" )-- [未接] 要是你早個十年拿來，我說不定就直接收下這邀請函囉。(略)
		end
	end
end
-----------------------------------------------------------------------------------------
function LuaN_112316_1() -- npc3
	local getnpc3= CheckFlag(OwnerID()  , 542393) -- 已送給npc3
	local getnpc2= CheckFlag(OwnerID()  , 542392) -- 和npc2接了
	local letter =  CountBodyItem( OwnerID() , 203865 ) --舞會邀請函

	if getnpc3 == true then --npc3已經送了
		SetSpeakDetail( OwnerID(), "[SC_112316_03]" )--  [完成]感謝你特地跑這麼遠拿給我，回去的路請小心啊。
	else  -- false
		if getnpc2 == true then --已和npc2接(任務進行中)
			if letter > 0 then --如果身上有邀請函
				SetSpeakDetail( OwnerID(), "[SC_112316_02]" )-- [進行]說到舞會我還真的忘得一乾二淨，差不多該回去準備才行。
				DelBodyItem( OwnerID() , 203865 , 1 ) --邀請函
				SetFlag( OwnerID()  , 542393 , 1 ) -- 給玩家 getnpc3 Flag
			else
				SetSpeakDetail( OwnerID(), "[SC_1123_LOST]" )-- 什麼？你說把邀請函搞丟了？我沒聽錯吧？
			end
		else -- false (未接此活動狀態)
			SetSpeakDetail( OwnerID(), "[SC_112316_01]" )-- [未接]這裡是我最喜歡的地方。(略)
		end
	end
end
-----------------------------------------------------------------------------------------
function LuaN_112317_1() -- npc4
	local getnpc4= CheckFlag(OwnerID()  , 542394) -- 已送給npc4
	local getnpc3= CheckFlag(OwnerID()  , 542393) -- 和npc3接了
	local letter =  CountBodyItem( OwnerID() , 203865 ) --舞會邀請函

	if getnpc4 == true then --npc4已經送了
		SetSpeakDetail( OwnerID(), "[SC_112317_03]" )--  [完成]今年的舞會籌備的水準希望別讓大家失望啊。 
	else  -- false
		if getnpc3 == true then --已和npc3接(任務進行中)
			if letter > 0 then
				SetSpeakDetail( OwnerID(), "[SC_112317_02]" )-- [進行]邀請函啊，感謝你特地送過來。
				DelBodyItem( OwnerID() , 203865 , 1 ) --邀請函
				SetFlag( OwnerID()  , 542394 , 1 ) -- 給玩家 getnpc4 Flag
			else
				SetSpeakDetail( OwnerID(), "[SC_1123_LOST]" )-- 什麼？你說把邀請函搞丟了？我沒聽錯吧？
			end
		else -- false (未接此活動狀態)
			SetSpeakDetail( OwnerID(), "[SC_112317_01]" )-- [未接]你有看到一位穿著紅色長裙的少女嗎？(略)
		end
	end
end
-----------------------------------------------------------------------------------------
function LuaN_112318_1() -- npc5
	local getnpc5= CheckFlag(OwnerID()  , 542395) -- 已送給npc5
	local getnpc4= CheckFlag(OwnerID()  , 542394) -- 和npc0接了
	local letter =  CountBodyItem( OwnerID() , 203865 ) --舞會邀請函

	if getnpc5 == true then --npc5已經送了
		SetSpeakDetail( OwnerID(), "[SC_112318_03]" )--  [完成]如果知道哪裡有舞會服裝出借的話，就通知我一聲吧。
	else  -- false
		if getnpc4 == true then --已完成npc4(任務進行中)
			if letter > 0 then
				SetSpeakDetail( OwnerID(), "[SC_112318_02]" )-- [進行]舞會的邀請函嗎？(略)
				DelBodyItem( OwnerID() , 203865 , 1 ) --邀請函
				SetFlag( OwnerID()  , 542395 , 1 ) -- 給玩家 allpass Flag
			else
				SetSpeakDetail( OwnerID(), "[SC_1123_LOST]" )-- 什麼？你說把邀請函搞丟了？我沒聽錯吧？
			end
		else -- false (未接此活動狀態)
			SetSpeakDetail( OwnerID(), "[SC_112318_01]" )-- [未接] 關於這方面的資料，不知道這裡多不多啊。
		end
	end
end
-----------------------------------------------------------------------------------------