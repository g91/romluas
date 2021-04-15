--20098月童話節

--npc say

function Lua_Mik_FairyTale_Festival_NPCmotion() --天使說
	local RR = rand(100)
	AddBuff(  TargetID(),  503217, 1, -1) 
	while 1 do
		PlayMotion( OwnerID(),165 )
		Sleep(10)
		PlayMotion( OwnerID(),166 )
		Say(OwnerID(),"[SC_0908SEANSON_NPCSAY01]")  --有誰能幫我這個忙？
		Sleep(1800+RR)
	end
end

function Lua_Mik_FairyTale_Festival_NPCmotion_bad() --惡魔說
	local RR = rand(100)
	AddBuff(  TargetID(),  503217, 1, -1) 
	while 1 do
		PlayMotion( OwnerID(),165 )
		Sleep(10)
		PlayMotion( OwnerID(),166 )
		Say(OwnerID(),"[SC_0908SEANSON_NPCSAY02]")  --嘿嘿，好期待這次的表演啊！
		Sleep(1800+RR)
	end
end


--NPC對話劇情
function LuaN_mika_09summerlove_good() --npc初始對話劇情
	if CheckFlag(OwnerID()  , 542978 ) == true then  --今天已完成(天使)
		SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_01]" )--今天能得到你的幫忙實在太好了(後略)  過完了
	elseif CheckBuff(OwnerID() , 504156) == true or CheckBuff(OwnerID() , 504180 ) == true then --有愛戀之吻技能
		SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_05]" )--什麼？你問我剛剛做了什麼事嗎？(後略)  進行中 
	elseif CheckBuff(OwnerID() , 504160 ) == true or CheckBuff(OwnerID() , 504181 ) == true or Checkflag(OwnerID(), 542979) then  --有青蛙之吻 Buff  and 已完成小惡魔keyitem
		SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_06]" )--我感覺到你身上殘留著青蛙的味道，你一定是那傢伙的同伴對吧，我沒猜錯吧！走開走開！
	else
		SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_43]" )--<CN>[$PLAYERNAME]</CN>，為了制止小惡魔的惡作劇..
		AddSpeakOption(OwnerID(), TargetID(), "[SC_0908SEANSON_53]", "LuaN_mika_09summerlove_good_joincheck", 0) --好，讓我來幫你吧！
	end
	AddSpeakOption(OwnerID(), TargetID(), "[SC_0908SEANSON_60]", "LuaN_mika_09summerlove_good_story", 0) --我想知道童話節的由來
	AddSpeakOption(OwnerID(), TargetID(), "[SC_0908SEANSON_27]", "LuaN_mika_09summerlove_good_angel", 0) --關於「小天使的愛心」
	AddSpeakOption(OwnerID(), TargetID(), "[SC_0908SEANSON_03]", "LuaN_mika_09summerlove_good_change", 0) --我想兌換禮物
	AddSpeakOption(OwnerID(), TargetID(), "[SC_0908SEANSON_04]", "LuaN_mika_09summerlove_good_gambling", 0) --我想參加抽獎
	AddSpeakOption(OwnerID(), TargetID(), "[SC_0908SEANSON_45]", "LuaN_mika_09summerlove_good_getbook", 0) --我想取得[205732]
end
------------------------------------------------
function LuaN_mika_09summerlove_good_joincheck() --確認有沒有要參加 - 天
	SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_62]" )-- 你確定要參加嗎？
	AddSpeakOption(OwnerID(), TargetID(), "[SC_0908SEANSON_65]" , "LuaN_mika_09summerlove_joingood", 0 ) --確定
	AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_good", 0 ) --回到上一頁
end
------------------------------------------------
function LuaN_mika_09summerlove_good_joincheck01() --確認兌換 - 童話禮盒
	SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_64]" )-- 你確定要兌換嗎？
	AddSpeakOption(OwnerID(), TargetID(), "[SC_0908SEANSON_65]" , "LuaN_mika_09summerlove_good_gift01", 0 ) --確定
	AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_good_change", 0 ) --回到上一頁
end
------------------------------------------------
function LuaN_mika_09summerlove_good_joincheck02() --確認兌換 - 情人禮盒
	SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_66]" )-- 你確定要兌換嗎？
	AddSpeakOption(OwnerID(), TargetID(), "[SC_0908SEANSON_65]" , "LuaN_mika_09summerlove_good_gift02", 0 ) --確定
	AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_good_change", 0 ) --回到上一頁
end
------------------------------------------------
function LuaN_mika_09summerlove_good_joincheck03() --確認兌換 - 熱戀之心情侶裝
	SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_67]" )-- 你確定要兌換嗎？
	AddSpeakOption(OwnerID(), TargetID(), "[SC_0908SEANSON_65]" , "LuaN_mika_09summerlove_good_gift03", 0 ) --確定
	AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_good_change", 0 ) --回到上一頁
end
------------------------------------------------
function LuaN_mika_09summerlove_good_joincheck04() --確認兌換 - 兌換稱號--對你愛不完
	SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_68]" )-- 你確定要兌換嗎？
	AddSpeakOption(OwnerID(), TargetID(), "[SC_0908SEANSON_65]" , "LuaN_mika_09summerlove_good_gift04", 0 ) --確定
	AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_good_change", 0 ) --回到上一頁
end
------------------------------------------------
function LuaN_mika_09summerlove_good_joincheck05() --確認兌換 - 兌換永久邱比特寶寶寵物蛋
	SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_69]" )-- 你確定要兌換嗎？
	AddSpeakOption(OwnerID(), TargetID(), "[SC_0908SEANSON_65]" , "LuaN_mika_09summerlove_good_gift05", 0 ) --確定
	AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_good_change", 0 ) --回到上一頁
end
------------------------------------------------
function LuaN_mika_09summerlove_good_story() --我想知道童話節的由來
	SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_61]" ) --背景內容
	AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_good", 0 ) --回到上一頁
end
------------------------------------------------
function LuaN_mika_09summerlove_good_angel() --關於「小天使的愛心」
	SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_29]" )--<CN>~小天使的愛心~</CN>(後略)
	AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_good", 0 ) --回到上一頁
end
------------------------------------------------
function LuaN_mika_09summerlove_good_change() --我想兌換禮物
	SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_07]" )--你想兌換什麼？
	AddSpeakOption(OwnerID(), TargetID(), "[SC_0908SEANSON_09]", "LuaN_mika_09summerlove_good_joincheck01", 0) --兌換童話禮盒
	AddSpeakOption(OwnerID(), TargetID(), "[SC_0908SEANSON_39]", "LuaN_mika_09summerlove_good_joincheck02", 0) --兌換情人禮盒
	AddSpeakOption(OwnerID(), TargetID(), "[SC_0908SEANSON_55]", "LuaN_mika_09summerlove_good_joincheck03", 0) --兌換熱戀之心情侶裝
	AddSpeakOption(OwnerID(), TargetID(), "[SC_0908SEANSON_41]", "LuaN_mika_09summerlove_good_joincheck04", 0) --兌換稱號--對你愛不完
	AddSpeakOption(OwnerID(), TargetID(), "[SC_0908SEANSON_56]", "LuaN_mika_09summerlove_good_joincheck05", 0) --兌換永久邱比特寶寶寵物蛋
	AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_good", 0 ) --回到上一頁
end
------------------------------------------------
function LuaN_mika_09summerlove_good_gambling()--我想參加抽獎
	SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_21]" )--嘿嘿，來試試看手氣吧！只要你有<CN>20枚[205790]</CN>就可以參加抽獎！
	AddSpeakOption(OwnerID(), TargetID(), "[SC_0908SEANSON_24]", "LuaN_mika_09summerlove_good_gamblego", 0) --參加抽獎
	AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_good", 0 ) --回到上一頁
end
------------------------------------------------
function LuaN_mika_09summerlove_good_gamblego() --參加抽獎
	local coin_angel = CountBodyItem( OwnerID() , 205725 ) --小天使徽章數量

	if coin_angel >= 5 then
		DelBodyItem( OwnerID() , 205725 , 5 ) --小天使徽章x5
		GiveBodyItem( OwnerID() , 720540  , 1 ) --抽獎掉寶
		SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_01]" )--今天的手氣如何呢？歡迎你明天再來參加！
		AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_good", 0 ) --回到上一頁
	else
		SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_26]" )--你所持的物品數量不足，無法參加抽獎。
		AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_good", 0 ) --回到上一頁
	end

end
------------------------------------------------
function LuaN_mika_09summerlove_good_getbook()
	SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_47]" )--你說你想再取得愛戀之吻的技能嗎？
	AddSpeakOption(OwnerID(), TargetID(), "[SC_0908SEANSON_49]" , "LuaN_mika_09summerlove_good_book", 0 ) --取得<CS>[205732]</CS>
	AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_good", 0 ) --回到上一頁
end
------------------------------------------------
function LuaN_mika_09summerlove_good_book()
	local runestone = CountBodyItem( OwnerID() , 202904 ) --傳送門符文數量

	if runestone >= 1 then
		GiveBodyItem( OwnerID() , 205732  , 2 ) --愛戀之吻魔法書x1
		DelBodyItem( OwnerID() , 202904 , 1 ) --傳送門符文x1
		SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_51]" )--再去尋找那些需要你幫忙的人吧！祝你順利！
		AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_good_getbook", 0 ) --回到上一頁
	else
		SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_26]" )--你所持的物品數量不足。
		AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_good_getbook", 0 ) --回到上一頁
	end

end
------------------------------------------------
function LuaN_mika_09summerlove_good_gift01()  --兌換童話禮盒
	if CheckFlag(OwnerID()  , 542985) == true then
		SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_11]" )--我手邊能提供的物品數量有限，請你明天再來換吧。
		AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_good_change", 0 ) --回到上一頁
	else
		if CheckFlag(OwnerID(), 542980) == true then 		
			GiveBodyItem( OwnerID() , 205734  , 1 ) --童話禮盒x1  
			SetFlag( OwnerID()  , 542985 , 1 ) -- 給 今天已兌換過禮盒
			SetFlag( OwnerID()  , 542980 , 0 ) -- 刪 持有可兌換童話禮盒資格
			SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_12]" )--你真的幫了我一個大忙，這點東西你就收下吧，希望明天還再能看到你！
			AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_good_change", 0 ) --回到上一頁
		else
			SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_13]" )--你還沒達成兌換條件！
			AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_good_change", 0 ) --回到上一頁
		end
	end
end
------------------------------------------------
function LuaN_mika_09summerlove_good_gift02()  --兌換情人禮盒
	local coin_angel = CountBodyItem( OwnerID() , 205790 ) --小天使徽章數量

	if coin_angel >= 50 then 		
		GiveBodyItem( OwnerID() , 205735  , 1 ) --情人禮盒x1 
		DelBodyItem( OwnerID() , 205790  , 50 ) --刪 小天使徽章x50
		SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_12]" )--你真的幫了我一個大忙，這點東西你就收下吧，希望明天還再能看到你！
		AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_good_change", 0 ) --回到上一頁
	else
		SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_13]" )--你還沒達成兌換條件！
		AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_good_change", 0 ) --回到上一頁
	end

end
------------------------------------------------
function LuaN_mika_09summerlove_good_gift03()  --兌換熱戀之心
	local coin_angel = CountBodyItem( OwnerID() , 205790 ) --小天使徽章數量

	if CheckFlag(OwnerID()  , 542993) == true then
		SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_59]" )--你已經兌換過囉！
		AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_good_change", 0 ) --回到上一頁
	else
		if coin_angel >= 100 then 
			local BorG = ReadRoleValue( OwnerID() , EM_RoleValue_SEX  )  
			sleep(10)
			if BorG == 0 then
				GiveBodyItem( OwnerID() , 223377  , 1 ) --給男生
			elseif BorG == 1 then
				GiveBodyItem( OwnerID() , 223379  , 1 ) --給女生
			end
			DelBodyItem( OwnerID() , 205790  , 100 ) --刪 小天使徽章x100
			SetFlag( OwnerID()  , 542993 , 1 ) -- 給 已兌換過熱戀之心酷裝
			SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_12]" )--你真的幫了我一個大忙，這點東西你就收下吧，希望明天還再能看到你！
			AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_good_change", 0 ) --回到上一頁 		
		else
			SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_13]" )--你還沒達成兌換條件！
			AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_good_change", 0 ) --回到上一頁
		end
	end
end
------------------------------------------------
function LuaN_mika_09summerlove_good_gift04()  --兌換稱號---對你愛不完
	local title_good01 = CountBodyItem( OwnerID() , 530001 ) ---對你愛不完稱號
	local coin_angel = CountBodyItem( OwnerID() , 205790 ) --小天使徽章數量

	if title_good01 == 1 then
		SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_34]" )--你已經有這個稱號囉！
		AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_good_change", 0 ) --回到上一頁
	else
		if coin_angel >= 150 then 		
			GiveBodyItem( OwnerID() , 530001  , 1 ) --給 稱號--對你愛不完 
			DelBodyItem( OwnerID() , 205790  , 150 ) --刪 小天使徽章x150
			SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_36]" )--這陣子你真的幫了我不少忙
			AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_good_change", 0 ) --回到上一頁
		else
			SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_13]" )--你還沒達成兌換條件！
			AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_good_change", 0 ) --回到上一頁
		end
	end
end
------------------------------------------------
function LuaN_mika_09summerlove_good_gift05()  --兌換永久邱比特寶寶寵物蛋
	local coin_angel = CountBodyItem( OwnerID() , 205790 ) --小天使徽章數量

	if CheckFlag(OwnerID()  , 542995) == true then
		SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_59]" )--你已經兌換過囉！
		AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_good_change", 0 ) --回到上一頁
	else
		if coin_angel >= 350 then 		
			GiveBodyItem( OwnerID() , 205743 , 1 ) --給 永久邱比特寶寶寵物蛋
			SetFlag( OwnerID()  , 542995 , 1 ) -- 給 已兌換過小天使寵物
			DelBodyItem( OwnerID() , 205790  , 350 ) --刪 小天使徽章x350
			SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_12]" )--你真的幫了我一個大忙，這點東西你就收下吧，希望明天還再能看到你！
			AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_good_change", 0 ) --回到上一頁
		else
			SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_13]" )--你還沒達成兌換條件！
			AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_good_change", 0 ) --回到上一頁
		end
	end
end
------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------
function LuaN_mika_09summerlove_bad() --npc對話劇情 bad
	if CheckFlag(OwnerID(), 542979 ) == true then --當天已過完青蛙之吻
		SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_14]" )--哼哼，你表現得還不錯嘛！想拿好東西的話，明天就再來為我工作吧！
	elseif CheckBuff(OwnerID(), 504160) == true or CheckBuff(OwnerID(), 504181) == true  then --身上有青蛙之吻技能
		SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_15]" )--每年到這種時候(後略)
	elseif  CheckBuff(OwnerID() , 504156) == true or CheckBuff(OwnerID() , 504180 ) == true  or CheckFlag(OwnerID()  , 542978 ) == true then --有愛戀之吻 或當天已過完一般
		SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_16]" )--你身上那什麼噁心的氣味..
	else
		SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_44]" )--<CN>[$PLAYERNAME]</CN>，想和我一起惡作劇嗎？
		AddSpeakOption(OwnerID(), TargetID(), "[SC_0908SEANSON_54]", "LuaN_mika_09summerlove_bad_joincheck", 0) --我想參加惡作劇
	end
	AddSpeakOption(OwnerID(), TargetID(), "[SC_0908SEANSON_60]", "LuaN_mika_09summerlove_bad_story", 0) --我想知道童話節的由來
	AddSpeakOption(OwnerID(), TargetID(), "[SC_0908SEANSON_28]", "LuaN_mika_09summerlove_bad_devil", 0) --關於「小惡魔的惡作劇」
	AddSpeakOption(OwnerID(), TargetID(), "[SC_0908SEANSON_03]", "LuaN_mika_09summerlove_bad_change", 0) --我想兌換禮物
	AddSpeakOption(OwnerID(), TargetID(), "[SC_0908SEANSON_04]", "LuaN_mika_09summerlove_bad_gambling", 0) --我想參加抽獎
	AddSpeakOption(OwnerID(), TargetID(), "[SC_0908SEANSON_46]", "LuaN_mika_09summerlove_bad_getbook", 0) --我想重新取得<CB>青蛙之吻</CB>
end
------------------------------------------------
function LuaN_mika_09summerlove_bad_joincheck() --確認有沒有要參加 - 天
	SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_63]" )-- 你確定要參加嗎？
	AddSpeakOption(OwnerID(), TargetID(), "[SC_0908SEANSON_65]" , "LuaN_mika_09summerlove_joinbad", 0 ) --確定
	AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_bad", 0 ) --回到上一頁
end
------------------------------------------------
function LuaN_mika_09summerlove_bad_joincheck01() --確認兌換 - 童話禮盒
	SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_64]" )-- 你確定要兌換嗎？
	AddSpeakOption(OwnerID(), TargetID(), "[SC_0908SEANSON_65]" , "LuaN_mika_09summerlove_bad_gift01", 0 ) --確定
	AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_bad_change", 0 ) --回到上一頁
end
------------------------------------------------
function LuaN_mika_09summerlove_bad_joincheck02() --確認兌換 - 情人禮盒
	SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_70]" )-- 你確定要兌換嗎？
	AddSpeakOption(OwnerID(), TargetID(), "[SC_0908SEANSON_65]" , "LuaN_mika_09summerlove_bad_gift02", 0 ) --確定
	AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_bad_change", 0 ) --回到上一頁
end
------------------------------------------------
function LuaN_mika_09summerlove_bad_joincheck03() --確認兌換 - 熱戀之心情侶裝
	SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_71]" )-- 你確定要兌換嗎？
	AddSpeakOption(OwnerID(), TargetID(), "[SC_0908SEANSON_65]" , "LuaN_mika_09summerlove_bad_gift03", 0 ) --確定
	AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_bad_change", 0 ) --回到上一頁
end
------------------------------------------------
function LuaN_mika_09summerlove_bad_joincheck04() --確認兌換 - 兌換稱號--對你愛不完
	SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_72]" )-- 你確定要兌換嗎？
	AddSpeakOption(OwnerID(), TargetID(), "[SC_0908SEANSON_65]" , "LuaN_mika_09summerlove_bad_gift04", 0 ) --確定
	AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_bad_change", 0 ) --回到上一頁
end
------------------------------------------------
function LuaN_mika_09summerlove_bad_joincheck05() --確認兌換 - 兌換永久邱比特寶寶寵物蛋
	SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_73]" )-- 你確定要兌換嗎？
	AddSpeakOption(OwnerID(), TargetID(), "[SC_0908SEANSON_65]" , "LuaN_mika_09summerlove_bad_gift05", 0 ) --確定
	AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_bad_change", 0 ) --回到上一頁
end
------------------------------------------------
function LuaN_mika_09summerlove_bad_story() --我想知道童話節的由來
	SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_61]" ) --背景內容
	AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_bad", 0 ) --回到上一頁
end
------------------------------------------------
function LuaN_mika_09summerlove_bad_devil() --關於「小惡魔的惡作劇」
	SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_30]" )--<CN>~小惡魔的惡作劇~</CN>(後略)
	AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_bad", 0 ) --回到上一頁
end
------------------------------------------------
function LuaN_mika_09summerlove_bad_change() --我想兌換禮物
	SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_33]" )--你要兌換什麼？
	AddSpeakOption(OwnerID(), TargetID(), "[SC_0908SEANSON_09]", "LuaN_mika_09summerlove_bad_joincheck01", 0) --兌換童話禮盒
	AddSpeakOption(OwnerID(), TargetID(), "[SC_0908SEANSON_40]", "LuaN_mika_09summerlove_bad_joincheck02", 0) --兌換青蛙禮盒
	AddSpeakOption(OwnerID(), TargetID(), "[SC_0908SEANSON_57]", "LuaN_mika_09summerlove_bad_joincheck03", 0) --兌換忌妒之心情侶裝
	AddSpeakOption(OwnerID(), TargetID(), "[SC_0908SEANSON_42]", "LuaN_mika_09summerlove_bad_joincheck04", 0) --兌換稱號--青蛙變變變
	AddSpeakOption(OwnerID(), TargetID(), "[SC_0908SEANSON_58]", "LuaN_mika_09summerlove_bad_joincheck05", 0) --兌換永久小惡魔寶寶寵物蛋
	AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_bad", 0 ) --回到上一頁
end
------------------------------------------------
function LuaN_mika_09summerlove_bad_gambling()--我想參加抽獎
	SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_22]" )--嘿嘿，來試試看手氣吧！只要你有<CN>20枚[205790]</CN>就可以參加抽獎！
	AddSpeakOption(OwnerID(), TargetID(), "[SC_0908SEANSON_24]", "LuaN_mika_09summerlove_bad_gamblego", 0) --參加抽獎
	AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_bad", 0 ) --回到上一頁
end
------------------------------------------------
function LuaN_mika_09summerlove_bad_gamblego() --參加抽獎
	local coin_devil = CountBodyItem( OwnerID() , 205724 ) --小惡魔徽章數量


	if coin_devil >= 5 then
		DelBodyItem( OwnerID() , 205724 , 5 ) --惡作劇使者憑證x5
		GiveBodyItem( OwnerID() , 724745  , 1 ) --抽獎掉寶
		SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_14]" )--今天的手氣如何呢？歡迎你明天再來參加！
		AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_bad", 0 ) --回到上一頁
	else
		SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_26]" )--你所持的物品數量不足，無法參加抽獎。
		AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_bad", 0 ) --回到上一頁
	end
end
------------------------------------------------
function LuaN_mika_09summerlove_bad_getbook()
	SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_48]" )--什麼？你還想繼續惡作劇啊？
	AddSpeakOption(OwnerID(), TargetID(), "[SC_0908SEANSON_50]" , "LuaN_mika_09summerlove_bad_book", 0 ) --取得<CS>[205733]</CS>
	AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_bad", 0 ) --回到上一頁
end
------------------------------------------------
function LuaN_mika_09summerlove_bad_book()
	local runestone = CountBodyItem( OwnerID() , 202904 ) --傳送門符文數量

	if runestone >= 1 then
		GiveBodyItem( OwnerID() , 205733  , 2 ) --青蛙之吻魔法書x1
		DelBodyItem( OwnerID() , 202904 , 1 ) --傳送門符文x1
		SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_52]" )--嘿嘿嘿，繼續享受惡作劇的樂趣吧！
		AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_bad_getbook", 0 ) --回到上一頁
	else
		SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_26]" )--你所持的物品數量不足。
		AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_bad_getbook", 0 ) --回到上一頁
	end

end
------------------------------------------------
function LuaN_mika_09summerlove_bad_gift() --兌換條件
	SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_33]" )--bad 兌換條件內容
	AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_bad_change", 0 ) --回到上一頁
end
------------------------------------------------
function LuaN_mika_09summerlove_bad_gift01()  --兌換童話禮盒
	if CheckFlag(OwnerID(), 542974) == true then
		SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_17]" )--想拿東西的話，就等明天再幫我繼續惡作劇吧，嘿嘿！
		AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_bad_change", 0 ) --回到上一頁
	else
		if CheckFlag(OwnerID(), 542973) == true then 		
			GiveBodyItem( OwnerID() , 205734  , 1 ) --童話禮盒x1  
			SetFlag( OwnerID()  , 542974 , 1 ) -- 給 今天已兌換過禮盒
			SetFlag( OwnerID()  , 542973 , 0 ) -- 刪 持有可兌換童話禮盒資格
			SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_14]" )--哼哼，你表現得還不錯嘛！想拿好東西的話，明天就再來為我工作吧！
			AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_bad_change", 0 ) --回到上一頁
		else
			SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_18]" )--你還沒達成我的條件吧，快去好好整整那些傢伙吧！
			AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_bad_change", 0 ) --回到上一頁
		end
	end
end
------------------------------------------------
function LuaN_mika_09summerlove_bad_gift02()  --青蛙禮盒
	local coin_devil = CountBodyItem( OwnerID() , 205789 ) --小惡魔徽章數量

	if coin_devil >= 50 then		
		GiveBodyItem( OwnerID() , 205736  , 1 ) --青蛙禮盒x1  
		DelBodyItem( OwnerID() , 205789  , 50 ) --刪 小惡魔徽章x50
		SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_14]" )--哼哼，你表現得還不錯嘛！想拿好東西的話，明天就再來為我工作吧！
		AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_bad_change", 0 ) --回到上一頁
	else
		SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_18]" )--你還沒達成我的條件吧，快去好好整整那些傢伙吧！
		AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_bad_change", 0 ) --回到上一頁
	end

end
----------------------------------------------------
function LuaN_mika_09summerlove_bad_gift03()  --兌換忌妒之心
	local coin_devil = CountBodyItem( OwnerID() , 205789 ) --小天使徽章數量

	if CheckFlag(OwnerID()  , 542994) == true then
		SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_59]" )--你已經兌換過囉！
		AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_bad_change", 0 ) --回到上一頁
	else
		if coin_devil >= 100 then 
			local BorG = ReadRoleValue( OwnerID() , EM_RoleValue_SEX  )  
			Sleep(10)
			if BorG == 0 then
				GiveBodyItem( OwnerID() , 223376  , 1 ) --給男生
			elseif BorG == 1 then
				GiveBodyItem( OwnerID() , 223378  , 1 ) --給女生
			end
			DelBodyItem( OwnerID() , 205789  , 100 ) --刪 小天使徽章x100
			SetFlag( OwnerID()  , 542994 , 1 ) -- 給 已兌換過忌妒之心酷裝
			SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_14]" )--哼哼，你表現得還不錯嘛！想拿好東西的話，明天就再來為我工作吧！
			AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_bad_change", 0 ) --回到上一頁		
		else
			SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_18]" )--你還沒達成我的條件吧，快去好好整整那些傢伙吧！
			AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_bad_change", 0 ) --回到上一頁
		end
	end
end
------------------------------------------------
function LuaN_mika_09summerlove_bad_gift04()  --兌換稱號---青蛙變變變
	local title_bad01 = CountBodyItem( OwnerID() , 530002 ) --青蛙變變變稱號
	local coin_devil = CountBodyItem( OwnerID() , 205789 ) --小惡魔徽章數量

	if title_bad01 == 1 then
		SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_34]" )--你已經有這個稱號囉！
		AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_bad_change", 0 ) --回到上一頁
	else
		if coin_devil >= 150 then 		
			GiveBodyItem( OwnerID() , 530002  , 1 ) --給 稱號--青蛙變變變 
			DelBodyItem( OwnerID() , 205789  , 150 ) --刪 小惡魔徽章x150
			SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_38]" )--哼，看不出來你這麼快就能收集到這些數量啊！
			AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_bad_change", 0 ) --回到上一頁
		else
			SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_18]" )--你還沒達成我的條件吧，快去好好整整那些傢伙吧！
			AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_bad_change", 0 ) --回到上一頁
		end
	end
end
------------------------------------------------
function LuaN_mika_09summerlove_bad_gift05()  --兌換永久小惡魔寶寶寵物蛋
	local coin_devil = CountBodyItem( OwnerID() , 205789 ) --小惡魔徽章數量

	if CheckFlag(OwnerID(), 542996) == true then
		SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_59]" )--你已經兌換過囉！
		AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_bad_change", 0 ) --回到上一頁
	else
		if coin_devil >= 350 then 	
			GiveBodyItem( OwnerID() , 205747 , 1 ) --給 永久小惡魔寶寶寵物蛋
			SetFlag( OwnerID()  , 542996 , 1 ) -- 給 已兌換過惡魔寵物
			DelBodyItem( OwnerID() , 205789  , 350 ) --刪 小惡魔徽章x350
			SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_14]" )--哼哼，你表現得還不錯嘛！想拿好東西的話，明天就再來為我工作吧！
			AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_bad_change", 0 ) --回到上一頁
		else
			SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_18]" )--你還沒達成我的條件吧，快去好好整整那些傢伙吧！
			AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_mika_09summerlove_bad_change", 0 ) --回到上一頁
		end
	end
end