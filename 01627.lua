
-- 2011.11.23 修改兌換禮物所需憑證數量，改成10個。

function Lua_Dan_Xams2009_114039_0() --活動和說明新活動的NPC

	SetSpeakDetail(OwnerID(), "[SC_2009_XAMS_ANDREAS_0]" )--[Sys111828_szquestnpctext]，在暖冬節的氣氛下，是不該獨自渡過的，朋友都聚在一起，暖冬節來時，真的很有趣，樹下有許多[112015]，....
	--AddSpeakOption(OwnerID(), TargetID(), "Do you know about Santa?", "Lua_Dan_Xams2009_114039_3", 0) --關於聖誕老人的傳說在24, 25會出現
	AddSpeakOption(OwnerID(), TargetID(), "[SC_2009_XAMS_ANDREAS_1]", "Lua_Dan_Xams2009_114039_1", 0) --我聽說必爾汀執行長[114076]
	AddSpeakOption(OwnerID(), TargetID(), "[SC_0908SEANSON_03]", "Lua_Dan_Xams2009_114039_2", 0) --我想兌換獎勵 
	--AddSpeakOption(OwnerID(), TargetID(), "I've heard a activity in Logar city and zone 6 zone 10", "Lua_Dan_Xams2009_114039_2", 0) --聖誕老人的神秘禮品
	--AddSpeakOption(OwnerID(), TargetID(), "Do you know how to pant Christmas Tree?", "Lua_Dan_Xams2009_114039_4", 0) --聖誕紅和聖誕樹的種植
end
------------------------------------------------------------------
function Lua_Dan_Xams2009_114039_1() --聖誕老人的位置和發生什麼事，敘述給玩家知道

	SetSpeakDetail(OwnerID(), "[SC_2009_XAMS_ANDREAS_2]" )--這下糟了，.........
	AddSpeakOption(OwnerID(), TargetID(), "[SC_2009_XAMS_ANDREAS_3]", "Lua_Dan_Xams2009_Collect_SliceofSledge", 0) --[114076]的請託 - 蒐集[206399]
	AddSpeakOption(OwnerID(), TargetID(), "[SC_2009_XAMS_ANDREAS_4]", "Lua_Dan_Xams2009_LookforflyingStone", 0) --[114076]的請託－蒐集[206324]	
	AddSpeakOption(OwnerID(), TargetID(), "[SC_2009_XAMS_ANDREAS_5]", "Lua_Dan_Xams2009_LookforReindeer", 0) --[114076]的請託 - 尋找[206441]
	AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "Lua_Dan_Xams2009_114039_0", 0)         --回到上一頁

end
------------------------------------------------------------------
function Lua_Dan_Xams2009_Collect_SliceofSledge() --聖誕老人的每日委託一：收集雪橇碎片

	SetSpeakDetail(OwnerID(), "[SC_2009_XAMS_ANDREAS_6]" )--[114076]的[114078]似乎缺少了很多部分，需要找回零碎的[206399]，或許你可以直接去詢問他，可以知道更多的情況...
	AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "Lua_Dan_Xams2009_114039_1", 0)         --回到上一頁


end
------------------------------------------------------------------
function Lua_Dan_Xams2009_LookforflyingStone() --聖誕老人的每日委託二－尋找浮石

	SetSpeakDetail(OwnerID(), "[SC_2009_XAMS_ANDREAS_7]" )--[114076]的[114078]因為撞擊的關係，似乎無法像以往一樣能夠浮空前進了，我記得有一種具有神秘力量的[206324]，可能會有所幫助....
	AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "Lua_Dan_Xams2009_114039_1", 0)         --回到上一頁

end
------------------------------------------------------------------
function Lua_Dan_Xams2009_LookforReindeer() --聖誕老人的每日委託三－找回馴鹿

	SetSpeakDetail(OwnerID(), "[SC_2009_XAMS_ANDREAS_8]" )--哎呀呀，我剛從[ZONE_HYBORA HIGHLANDS]的[ZONE_ASLAN]附近旅行回來，見到了許多[206441]，聽說這些[206441]很喜愛聆聽清脆的銀鈴聲響...
	AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "Lua_Dan_Xams2009_114039_1", 0)         --回到上一頁

end
------------------------------------------------------------------
function Lua_Dan_Xams2009_114039_2() --我想兌換獎勵 
	local needcount = 10  -- 需要乖寶寶憑証數量
	local needcount2 = 2   -- 需求傳送門符文數量

	SetSpeakDetail(OwnerID(), "[SC_2009_XAMS_ANDREAS_9]" )--[Sys421558_szquest_complete_detail]，這下我可以繼續我的旅程了，你已經蒐集這麼多的[206437]，你果然是個乖孩子，這個[206464]就送給你當做獎勵吧！
	AddSpeakOption(OwnerID(), TargetID(), "[SC_2009_XAMS_ANDREAS_10][$SETVAR1="..needcount.."]", "Lua_Dan_Xams2009_114039_ConvertReward", 0) --我要用X個[206437]兌換獎勵
	AddSpeakOption(OwnerID(), TargetID(), "[SC_2011_XAMS_NPCSPEAK][$SETVAR1="..needcount2.."]", "lua_mika_Xmas_ticketget", 0) --我要用[$VAR1]個[202904]兌換[205944]
	AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "Lua_Dan_Xams2009_114039_0", 0)         --回到上一頁

end

function lua_mika_Xmas_ticketget()
	local OID = OwnerID()
	local needitem = 202904  -- 兌換需求物品 - 傳送門符文
	local needcount = 2
	local count = CountBodyItem( OID , needitem )   -- 玩家持有的需求物品數量
	local giveitem =  205944

	if count >= needcount then 
		SetSpeakDetail( OID, "[Sys111828_szquestnpctext]") --暖冬節快樂我的朋友
		DelBodyItem( OID , needitem , needcount ) --刪除背包中的數量
		GiveBodyItem( OID , giveitem  , 1 ) --暖冬節活動重置券
	else
		SetSpeakDetail( OwnerID(), "[K_08MID_DIALOG7]") --您所持有的數量不足，還不能兌換喔。 
		AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "Lua_Dan_Xams2009_114039_2", 0)--回到上一頁
	end

end

------------------------------------------------------------------
function Lua_Dan_Xams2009_114039_ConvertReward() --我想兌換獎勵 206464	安德魯史的禮盒　用 [206437]兌換
	local needcount = 10  -- 需要乖寶寶憑証數量
	local Owner = OwnerID()
	local Target = TargetID()

	if EmptyPacketCount(Owner ) >= 1 and QueuePacketCount( Owner ) == 0 then 

		 if CountBodyItem( Owner , 206437) >= needcount then  --計算身上有多少個乖寶寶憑証
			SetSpeakDetail( Owner , "[Sys111828_szquestnpctext]") --暖冬節快樂我的朋友
			ScriptMessage( Owner  , Target , 1 , "[Sys111828_szquestnpctext]" , C_SYSTEM )
			ScriptMessage( Owner , Target , 0 , "[Sys111828_szquestnpctext]" , C_SYSTEM )
			PlayMotion(Target, 128)		
			CastSpell( Target, Owner, 494690 ); --暖冬老公公的祝福
			DelBodyItem( Owner  , 206437 , needcount ) --刪除背包中的數量
			GiveBodyItem( Owner , 241481 , 15 ) --烈火元素 x 15
			if DW_Rand(100) >= 97 then  -- 3%機率額外獲得射手幻獸結晶
				GiveBodyItem( Owner , 241462 , 1 )
			end
			 GiveBodyItem( Owner , 242094 , 1 ) --安德魯史的禮盒
		   --	GiveBodyItem( Owner , 206464  , 1 ) --安德魯史的禮盒  --2013年要遮蔽
			AddSpeakOption (Owner , Target, "[SO_BACK]", "Lua_Dan_Xams2009_114039_2", 0)--回到上一頁
		else
			 SetSpeakDetail( Owner , "[K_08MID_DIALOG7]") --您所持有的數量不足，還不能兌換喔。 
		    		 AddSpeakOption (Owner , Target, "[SO_BACK]", "Lua_Dan_Xams2009_114039_2", 0)--回到上一頁
		end
	else

	       	     SetSpeakDetail( OwnerID(), "[SC_DAN_111700_22]") --你的背包空間不足
	   	      AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "Lua_Dan_Xams2009_114039_2", 0)--回到上一頁

	end

end
------------------------------------------------------------------
--function Lua_Dan_Xams2009_114039_2() --尋找襪子，聖誕老人的神秘禮品（三個時段，分次限時15分鐘。）

--	SetSpeakDetail ( OwnerID(), "Ho...Ho...Ho... Lots socks... Do you know what it is??? heee" )--基本對話。
--	AddSpeakOption ( OwnerID(), TargetID(), "Game Rules, Where, When", "Lua_Dan_Xams2009_Ruleoflookingforsocks", 0) --說明遊戲規則
--	AddSpeakOption ( OwnerID(), TargetID(), "I would like to go there by NPC", "Lua_Dan_Xams2009_Transport_LogarCity", 0) --我可以把你傳去活動地點哦
	--AddSpeakOption ( OwnerID(), TargetID(), "I would like to know about the clue", "", 0) --我想要了解金色襪子可能出現的線索（商城點）
	--AddSpeakOption ( OwnerID(), TargetID(), "I'm good baby, i would like to play this game with good of item shop", "", 0) --我是乖寶寶，我要在玩一次這個活動(商城重置）
--	AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "Lua_Dan_Xams2009_114039_0", 0)         --回到上一頁

--end
------------------------------------------------------------------
--function Lua_Dan_Xams2009_Ruleoflookingforsocks() --說明遊戲規則

--	SetSpeakDetail ( OwnerID(), "How to play this game..." )--基本對話。
--	AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "Lua_Dan_Xams2009_114039_2", 0)         --回到上一頁

--end
------------------------------------------------------------------
--function Lua_Dan_Xams2009_Transport_LogarCity() --我可以把你傳去活動地點哦(需10元金幣）多加Dialog。讓玩家點

--		CloseSpeak( OwnerID())
--		BeginPlot(OwnerID(),"Lua_Dan_Xams2009_Transport_LogarCity_1",0)
	
--end
------------------------------------------------------------------
--function Lua_Dan_Xams2009_Transport_LogarCity_1()
		
--		DialogCreate( OwnerID() , EM_LuaDialogType_YesNo ,"Would you like to pay 10 gold to transport?")
--		DialogSelectStr( OwnerID() , "[SC_GETTITLE_1]" );
--		DialogSelectStr( OwnerID() , "[SC_CANCEL]" );
--		if( DialogSendOpen( OwnerID() ) == false ) then 
--			ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_FIXEQ_DATA_ERROR]",0)	
			--資料送出有問題
--			return
--		end
--		for i = 0 , 100 , 1 do
--			Sleep( 1 );
--			SelectID = DialogGetResult( TargetID() );
--			if ( SelectID ~= -2 ) and ( SelectID ~= -1 ) and i < 100 then
--				if ( SelectID == 0 ) then
----					
--					if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) >= 10 then
--						ScriptMessage( OwnerID(),OwnerID(), 1, "Merry Christmas",0)
--						AddRoleValue( OwnerID() , EM_RoleValue_Money , -10 )
--						ChangeZone( OwnerID() , 1 , 0, 6372, 61, -3106, 50) --只傳到羅格鎮
--					else
--						SetSpeakDetail( OwnerID(), "[ST_110989_3_2]"   ) --您的金錢不足
--					end				
--					DialogClose( OwnerID() )
--					break;
--				elseif ( SelectID == 1 ) then
--					ScriptMessage( OwnerID(),OwnerID(), 1, "OH NO... okay... just go by yourself, alright?",0)
--					DialogClose( OwnerID() )		
--					break
--				end
--			elseif i == 100 then
--				DialogClose( OwnerID() )		
--				break
--			end
--		end
--end
------------------------------------------------------------------
--function Lua_Dan_Xams2009_114039_3() --關於聖誕老人的傳說

--	SetSpeakDetail ( OwnerID(), "About the Santa......?" )--聖誕老人都會在24, 25出沒........。
--	AddSpeakOption ( OwnerID(), TargetID(), "I wanna know where santa is... right now... ?", "Lua_Dan_Xams2009_SantaLocation", 0) --聖誕老人目前的行蹤
--	AddSpeakOption ( OwnerID(), TargetID(), "I wanna mail to Santa...?", "Lua_Dan_Xams2009_MailtoSanta", 0) --寄信給聖誕老人 (每天可得一個糖果) 拿去給信箱後，可得旗標。
--	AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "Lua_Dan_Xams2009_114039_0", 0)         --回到上一頁
--end
------------------------------------------------------------------
--function Lua_Dan_Xams2009_SantaLocation() --聖誕老人目前的行蹤

--	SetSpeakDetail ( OwnerID(), "Santa is in zone 2 or 3 or 4........?" )--用Random字串，報告每天聖誕老人大概跑去哪
--	AddSpeakOption ( OwnerID(), TargetID(), "I wanna know where santa is by good of item shop", "", 0) --判斷日期，並告知玩家聖誕老人可能出現的地點
--	AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "Lua_Dan_Xams2009_114039_3", 0)         --回到上一頁

--end
------------------------------------------------------------------
--function Lua_Dan_Xams2009_MailtoSanta() --寄信給聖誕老人 (每天可得一個糖果) 拿去給信箱後，可得每日旗標。

--	SetSpeakDetail ( OwnerID(), "Take this mail to mailbox for santa.....?" )--把信給信箱後，上面的socks會發亮，並給予玩家糖果。
--	Sleep(10)
	--Givebodyitem(TargetID(),530185 ,1 ) --給糖果
	--Setflag( TargetID(), 540764, 1) -- 每日領
	--DelBodyItem( TargetID() , 200167 , 1 ) --刪除信
	--AddSpeakOption ( OwnerID(), TargetID(), "I wanna know where santa is... right now... ?", "", 0) --聖誕老人目前的行蹤
--	AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "Lua_Dan_Xams2009_114039_3", 0)         --回到上一頁

--end

------------------------------------------------------------------
--function Lua_Dan_Xams2009_114039_4() --如何種植聖誕紅和樹教學

--	SetSpeakDetail ( OwnerID(), "About the Christmas Tree and  Common poinsettia,......?" )--基本對話。
--	AddSpeakOption ( OwnerID(), TargetID(), "How to plant Christmas Tree and Common poinsettia?", "Lua_Dan_Xams2009_HowtoPlant", 0) --如何種植聖誕樹和聖誕紅
--	AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "Lua_Dan_Xams2009_114039_0", 0)         --回到上一頁

--end
------------------------------------------------------------------
--function Lua_Dan_Xams2009_HowtoPlant() --如何種植聖誕樹和聖誕紅

--	SetSpeakDetail ( OwnerID(), "About the Christmas Tree and  Common poinsettia, ......" )--基本對話。
--	AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "Lua_Dan_Xams2009_114039_4", 0)         --回到上一頁

--end