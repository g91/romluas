--台灣扭蛋活動NPC
--2011-0210 咆嘯戰熊轉蛋
--2011-0106 龍魂戰駒轉蛋
--2010-1122 暴風鷹馬獸扭蛋活動
--2010-1022 銀河天馬扭蛋活動
--2010-0923 鷹眼扭蛋活動
--serverscript 2077

-- 20100923 橘子鷹眼蛋活動 npc兌換 
function Lua_mika_eagleegg_01()  --中央廣場 艾芙蕾
	AdjustFaceDir( TargetID() , OwnerID() , 0 ) -- 面向
	BeginPlot( TargetID() , "LuaS_NPC_Ranger_na" , 0 )  --檢查NPC與玩家的距離
	SetSpeakDetail( OwnerID(), "[SC_EAGLEEGG_00]" ) --你在購買的轉蛋中，是否有得到想要的東西呢？....
	AddSpeakOption( OwnerID(), TargetID(), "[SC_EAGLEEGG_02][$SETVAR1=[226295]]", "Lua_mika_eagleegg_04",0 )--我想兌換[$VAR1]--蔚藍羽翼(飛輪蛋活動)
	AddSpeakOption( OwnerID(), TargetID(), "[SC_EAGLEEGG_02][$SETVAR1=[204513]]", "Lua_mika_eagleegg_02",0 )--我想兌換[$VAR1]--寵物開通(鷹眼蛋活動)
	AddSpeakOption( OwnerID(), TargetID(), "[SC_EAGLEEGG_02][$SETVAR1=[224989]]", "Lua_mika_eagleegg_06",0 )--我想兌換[$VAR1]--銀空之翼(銀河天馬活動)
	AddSpeakOption( OwnerID(), TargetID(), "[SC_EAGLEEGG_02][$SETVAR1=[225306]]", "Lua_mika_eagleegg_09",0 )--我想兌換[$VAR1]--暖冬慶典精靈翅膀(暴風鷹馬獸扭蛋活動)
	AddSpeakOption( OwnerID(), TargetID(), "[SC_EAGLEEGG_02][$SETVAR1=[224865]]", "Lua_gamaegg_na_10",0 )--我想兌換[$VAR1]--璀璨之翼(龍魂戰駒扭蛋活動)
	AddSpeakOption( OwnerID(), TargetID(), "[SC_EAGLEEGG_02][$SETVAR1=[224866]]", "Lua_gamaegg_na_11",0 )--我想兌換[$VAR1]--紫晶之翼(咆嘯戰熊扭蛋活動)
end

---兌換蔚藍羽翼(飛輪蛋活動)------------------------------------------------------------------
function Lua_mika_eagleegg_04()  --我想兌換[$VAR1]--蔚藍羽翼(飛輪蛋活動)
	SetSpeakDetail( OwnerID(), "[SC_EAGLEEGG_05]" ) --凡購買飛輪蛋....
	AddSpeakOption( OwnerID(), TargetID(), "[SC_EAGLEEGG_04]", "Lua_mika_eagleegg_05",0 )--確定兌換
end

function Lua_mika_eagleegg_05()  --閃耀光芒的蛋殼碎片x5 換 蔚藍羽翼x1
	local eggid = 205684 --閃耀光芒的蛋殼碎片
	local count =CountBodyItem( OwnerID(), eggid) --檢查玩家身上的蛋殼碎片數量
	local rewardid = 226295 --蔚藍羽翼
	CloseSpeak ( OwnerID()) 
	if count >=5 then
		DelBodyItem( OwnerID(), eggid, 5)  -- 刪 蛋殼碎片x5
		GiveBodyItem( OwnerID(), rewardid, 1)  --給兌換的物品
		ScriptMessage ( OwnerID() , OwnerID(), 1, "[SC_EAGLEEGG_03][$SETVAR1=[226295]]" , C_SYSTEM )  --恭喜你獲得[$VAR1]！
	else 
		ScriptMessage ( OwnerID() , OwnerID(), 1, "[SC_XMASGOODERROR]" , 0 )  --您所持有物品數量不足，還不能兌換喔。
	end
end

---兌換寵物開通(鷹眼蛋活動)------------------------------------------------------------------
function Lua_mika_eagleegg_02()  --兌換寵物開通(鷹眼蛋活動)
	SetSpeakDetail( OwnerID(), "[SC_EAGLEEGG_01]" ) --凡購買鷹眼蛋....
	AddSpeakOption( OwnerID(), TargetID(), "[SC_EAGLEEGG_04]", "Lua_mika_eagleegg_03",0 )--確定兌換
end

function Lua_mika_eagleegg_03()
	local eggid = 208321 --蛋殼碎片
	local count =CountBodyItem( OwnerID(), eggid) --檢查玩家身上的蛋殼碎片數量
	local rewardid = 204513 --培育欄開通券
	CloseSpeak ( OwnerID()) 
	if count >=5 then
		DelBodyItem( OwnerID(), eggid, 5)  -- 刪 蛋殼碎片x5
		GiveBodyItem( OwnerID(), rewardid, 1)  --給兌換的物品
		ScriptMessage ( OwnerID() , OwnerID(), 1, "[SC_EAGLEEGG_03][$SETVAR1=[204513]]" , C_SYSTEM )  --恭喜你獲得[$VAR1]！
	else 
		ScriptMessage ( OwnerID() , OwnerID(), 1, "[SC_XMASGOODERROR]" , 0 )  --您所持有物品數量不足，還不能兌換喔。
	end
end


---兌換銀空之翼(銀河天馬活動)------------------------------------------------------------------
function Lua_mika_eagleegg_06()  
	SetSpeakDetail( OwnerID(), "[SC_GALAXYEGG_01]" ) --凡購買銀河天馬蛋 ...
	AddSpeakOption( OwnerID(), TargetID(), "[SC_EAGLEEGG_04]", "Lua_mika_eagleegg_07",0 )--確定兌換
end

function Lua_mika_eagleegg_07()
	local eggid = 208300 --蛋殼碎片
	local count =CountBodyItem( OwnerID(), eggid) --檢查玩家身上的蛋殼碎片數量
	local rewardid = 224989 --銀空之翼
	CloseSpeak ( OwnerID()) 
	if count >=5 then
		DelBodyItem( OwnerID(), eggid, 5)  -- 刪 蛋殼碎片x5
		GiveBodyItem( OwnerID(), rewardid, 1)  --給兌換的物品
		ScriptMessage ( OwnerID() , OwnerID(), 1, "[SC_EAGLEEGG_03][$SETVAR1=[224989]]" , C_SYSTEM )  --恭喜你獲得[$VAR1]！
	else 
		ScriptMessage ( OwnerID() , OwnerID(), 1, "[SC_XMASGOODERROR]" , 0 )  --您所持有物品數量不足，還不能兌換喔。
	end
end

---兌換暖冬慶典精靈翅膀(暴風鷹馬獸扭蛋活動)------------------------------------------------------------------
function Lua_mika_eagleegg_09()  
	SetSpeakDetail( OwnerID(), "[SC_TWMALLEGG_01]" ) --凡購買....
	AddSpeakOption( OwnerID(), TargetID(), "[SC_TWMALLEGG_02]", "Lua_mika_eagleegg_091",0 )--兌換男性角色用裝備
	AddSpeakOption( OwnerID(), TargetID(), "[SC_TWMALLEGG_03]", "Lua_mika_eagleegg_092",0 )--兌換女性角色用裝備
end

function Lua_mika_eagleegg_091()  ---兌換暖冬慶典精靈翅膀(男性)
	local eggid = 208334 --飄落的鷹馬獸羽毛
	local count =CountBodyItem( OwnerID(), eggid) --檢查玩家身上的飄落的鷹馬獸羽毛數量
	local rewardid_1 = 225311 --暖冬慶典精靈翅膀 (男性)
	CloseSpeak ( OwnerID()) 
	if count >=5 then
		DelBodyItem( OwnerID(), eggid, 5)  -- 刪 蛋殼碎片x5
		GiveBodyItem( OwnerID(), rewardid_1, 1)  --給兌換的物品
		ScriptMessage ( OwnerID() , OwnerID(), 1, "[SC_EAGLEEGG_03][$SETVAR1=[225311]]" , C_SYSTEM )  --恭喜你獲得[$VAR1]！
	else 
		ScriptMessage ( OwnerID() , OwnerID(), 1, "[SC_XMASGOODERROR]" , 0 )  --您所持有物品數量不足，還不能兌換喔。
	end
end

function Lua_mika_eagleegg_092()  ---兌換暖冬慶典精靈翅膀 (女性)
	local eggid = 208334 --飄落的鷹馬獸羽毛
	local count =CountBodyItem( OwnerID(), eggid) --檢查玩家身上的飄落的鷹馬獸羽毛數量
	local rewardid_2 = 225306 --暖冬慶典精靈翅膀 (女性)
	CloseSpeak ( OwnerID()) 
	if count >=5 then
		DelBodyItem( OwnerID(), eggid, 5)  -- 刪 蛋殼碎片x5
		GiveBodyItem( OwnerID(), rewardid_2, 1)  --給兌換的物品
		ScriptMessage ( OwnerID() , OwnerID(), 1, "[SC_EAGLEEGG_03][$SETVAR1=[225306]]" , C_SYSTEM )  --恭喜你獲得[$VAR1]！
	else 
		ScriptMessage ( OwnerID() , OwnerID(), 1, "[SC_XMASGOODERROR]" , 0 )  --您所持有物品數量不足，還不能兌換喔。
	end
end



---兌換璀璨之翼(龍駒戰魂活動)------------------------------------------------------------------
function Lua_gamaegg_na_10()  
	SetSpeakDetail( OwnerID(), "[SC_GAMAEGG_01]" ) --凡購買龍駒戰魂蛋 ...
	AddSpeakOption( OwnerID(), TargetID(), "[SC_EAGLEEGG_04]", "Lua_gamaegg_na_10_1",0 )--確定兌換
end

function Lua_gamaegg_na_10_1()  
	local eggid = 208672 --堅硬的龍魂戰駒指甲
	local count =CountBodyItem( OwnerID(), eggid) --檢查玩家身上的蛋殼碎片數量
	local rewardid = 224865 --璀璨之翼
	CloseSpeak ( OwnerID()) 
	if count >=5 then
		DelBodyItem( OwnerID(), eggid, 5)  -- 刪 堅硬的龍魂戰駒指甲x5
		GiveBodyItem( OwnerID(), rewardid, 1)  --給兌換的物品
		ScriptMessage ( OwnerID() , OwnerID(), 1, "[SC_EAGLEEGG_03][$SETVAR1=[224865]]" , C_SYSTEM )  --恭喜你獲得[$VAR1]！
	else 
		ScriptMessage ( OwnerID() , OwnerID(), 1, "[SC_XMASGOODERROR]" , 0 )  --您所持有物品數量不足，還不能兌換喔。
	end
end




---兌換紫晶之翼(咆嘯戰熊活動)------------------------------------------------------------------
function Lua_gamaegg_na_11()  
	SetSpeakDetail( OwnerID(), "[SC_GAMAEGG_02]" ) --凡購買咆嘯戰熊蛋 ...
	AddSpeakOption( OwnerID(), TargetID(), "[SC_EAGLEEGG_04]", "Lua_gamaegg_na_11_1",0 )--確定兌換
end

function Lua_gamaegg_na_11_1()  
	local eggid = 209167 --粗糙的咆嘯戰熊絨毛
	local count =CountBodyItem( OwnerID(), eggid) --檢查玩家身上的絨毛數量
	local rewardid = 224866 --紫晶之翼
	CloseSpeak ( OwnerID()) 
	if count >=5 then
		DelBodyItem( OwnerID(), eggid, 5)  -- 刪 粗糙的咆嘯戰熊絨毛x5
		GiveBodyItem( OwnerID(), rewardid, 1)  --給兌換的物品
		ScriptMessage ( OwnerID() , OwnerID(), 1, "[SC_EAGLEEGG_03][$SETVAR1=[224866]]" , C_SYSTEM )  --恭喜你獲得[$VAR1]！
	else 
		ScriptMessage ( OwnerID() , OwnerID(), 1, "[SC_XMASGOODERROR]" , 0 )  --您所持有物品數量不足，還不能兌換喔。
	end
end