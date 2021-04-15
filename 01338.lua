--節慶活動 5月愛樂節  音符階梯
--建立時間: 2009/04/16
--修改日期: 2009/04/30
--建立者  : 活動企劃 潘晉佳
------------------------------------------------------------------------------
--4/30 修改 音符x3
------------------------------------------------------------------------------
--初始劇情 任務NPC 112591 漢克．皮耶羅 Z2凡瑞納絲城外  Z6 黑曜石要塞北方 魔法陣旁
------------------------------------------------------------------------------
function LuaN_musicfes_magicintro()
	SetSpeakDetail(OwnerID(), "[SC_MUSICFES_CODE23]" )--聽說最近這裡每天一到<CS>14：00</CS>(略)
end
------------------------------------------------------------------------------
--掛在 任務NPC 112590 維納斯．雷特  凡瑞娜絲城   CODE
------------------------------------------------------------------------------
function LuaN_musicfes_code00() --NPC 維納斯
	SetSpeakDetail(OwnerID(), "[SC_MUSICFES_CODE00]" )--NPC對話 來看看今年的愛樂節有哪些活動吧～！
	AddSpeakOption(OwnerID(), TargetID(), "[SC_MUSICFES_CODE01]", "LuaN_musicfes_code01", 0) --關於音符階梯活動
	AddSpeakOption(OwnerID(), TargetID(), "[SC_MUSICFES_CODE02]", "LuaN_musicfes_code02", 0) --關於魔法陣護衛活動
end
------------------------------------------------------------------------------
function LuaN_musicfes_code01() --關於音符階梯活動
	local Aeasy= CheckFlag(OwnerID()  , 542521) -- 接下挑戰簡單  
	local Ahard= CheckFlag(OwnerID()  , 542522) -- 接下挑戰困難  
	local todayH= CheckFlag(OwnerID()  , 542526) -- 今天過完困難Flag 
	local todayE= CheckFlag(OwnerID()  , 542525) -- 今天過完簡單Flag 
	local Dhard  = CheckFlag(OwnerID()  , 542524) -- 達成目標 困難Flag 
	local Deasy= CheckFlag(OwnerID()  , 542523) -- 達成目標 簡單 Flag  
	if todayH == false or todayE == false then
		if Aeasy == false and Ahard == false then
			SetSpeakDetail(OwnerID(), "[SC_MUSICFES_CODE06]" )--NPC對話 音符階梯活動介紹
			if Dhard == false and Deasy == false then --
				AddSpeakOption(OwnerID(), TargetID(), "[SC_MUSICFES_CODE03]", "LuaN_musicfes_code03", 0) --報名音符階梯活動
			end
		end
	else
			SetSpeakDetail(OwnerID(), "[SC_MUSICFES_CODE06]" )--NPC對話 音符階梯活動介紹
	end
	if  Dhard == true or Deasy == true then --
		SetSpeakDetail(OwnerID(), "[SC_MUSICFES_CODE31]" )--你已經完成演奏了嗎？
		AddSpeakOption(OwnerID(), TargetID(), "[SC_MUSICFES_CODE04]", "LuaN_musicfes_code04", 0) --回報音符階梯活動
	end
	if Aeasy == true or Ahard == true then
			SetSpeakDetail(OwnerID(), "[SC_MUSICFES_CODE31]" )--你已經完成演奏了嗎？
			AddSpeakOption(OwnerID(), TargetID(), "[SC_MUSICFES_CODE05]", "LuaN_musicfes_code07", 0) --我想再看一次題目
			AddSpeakOption(OwnerID(), TargetID(), "[SC_MUSICFES_CODE26]", "LuaN_musicfes_code08", 0) --我想放棄這個題目
	end
	AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_musicfes_code00", 0 ) --回到上一頁 
end
------------------------------------------------------------------------------
function LuaN_musicfes_code02() --關於魔法陣護衛活動
	SetSpeakDetail( OwnerID(), "[SC_MUSICFES_CODE07]" )--NPC對話 魔法陣護衛活動介紹
	AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_musicfes_code00", 0 ) --回到上一頁 
end
------------------------------------------------------------------------------
function LuaN_musicfes_code03() --報名音符階梯活動
	local todayH= CheckFlag(OwnerID()  , 542526) -- 今天過完困難Flag 
	local todayE= CheckFlag(OwnerID()  , 542525) -- 今天過完簡單Flag 
	SetSpeakDetail( OwnerID(), "[SC_MUSICFES_CODE08]" )--你想挑戰哪種難度呢？
	if todayE == false then
		AddSpeakOption( OwnerID(), TargetID(), "[SC_MUSICFES_CODE09]", "LuaN_musicfes_code05", 0) --簡單旋律
	end
	if todayH == false then
		AddSpeakOption( OwnerID(), TargetID(), "[SC_MUSICFES_CODE10]", "LuaN_musicfes_code06", 0) --困難旋律
	end
	AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_musicfes_code01", 0 ) --回到上一頁 
end
------------------------------------------------------------------------------
function LuaN_musicfes_code04() --回報音符階梯活動
	local Deasy= CheckFlag(OwnerID()  , 542523) -- 達成目標 簡單 Flag  刪除點:回報活動時
	local Dhard  = CheckFlag(OwnerID()  , 542524) -- 達成目標 困難Flag   刪除點:回報活動時
	if Deasy == true then	
		SetSpeakDetail(OwnerID(), "[SC_MUSICFES_CODE12]" )--這真是一段美妙的旋律啊！為表示我的感謝，請你收下這些音符吧～！
		GiveBodyItem(OwnerID(), 204428 , 1 ) --音符x1
		SetFlag(OwnerID()  , 542525 , 1 ) -- 給玩家 今天已完成過活動旗標-簡單
		SetFlag( OwnerID()  , 542523 , 0 ) -- 刪 達成目標 簡單Flag 
		SetFlag( OwnerID()  , 542521 , 0 ) -- 刪 接下挑戰簡單
		SetFlag( OwnerID()  , 542542 , 0 ) -- 刪 簡單Q1
		SetFlag( OwnerID()  , 542543 , 0 ) -- 刪 簡單Q2
		SetFlag( OwnerID()  , 542544 , 0 ) -- 刪 簡單Q3
	elseif Dhard == true then
		SetSpeakDetail(OwnerID(), "[SC_MUSICFES_CODE13]" )-- 好久沒有聽到這麼出色的演奏啊！為表示我的感謝，請你收下這些音符吧～！
		GiveBodyItem(OwnerID(), 204428 , 3 ) --音符x3
		SetFlag(OwnerID()  , 542526 , 1 ) -- 給玩家 今天已完成過活動旗標-困難
		SetFlag( OwnerID()  , 542522 , 0 ) -- 刪 接下挑戰困難
		SetFlag( OwnerID()  , 542524 , 0 ) -- 刪 達成目標 困難Flag
		SetFlag( OwnerID()  , 542545 , 0 ) -- 刪 困難Q1
		SetFlag( OwnerID()  , 542546 , 0 ) -- 刪 困難Q2
		SetFlag( OwnerID()  , 542547 , 0 ) -- 刪 困難Q3
	end
end

------------------------------------------------------------------------------
function LuaN_musicfes_code05() --報名簡單旋律
	local Aeasy= CheckFlag(OwnerID() , 542521) -- 接下挑戰簡單  刪除點:完成最後階段時
	local Ahard= CheckFlag(OwnerID() , 542522) -- 接下挑戰困難  刪除點: 完成最後階段時
	local todayE= CheckFlag(OwnerID() , 542525) -- 今天過完簡單Flag  刪除點: 完成最後階段時
	local Deasy= CheckFlag(OwnerID()  , 542523) -- 達成目標 簡單 Flag  刪除點:回報活動時

	if todayE == true then
		SetSpeakDetail(OwnerID(), "[SC_MUSICFES_CODE15]" )--你今天已經挑戰過囉～！
		AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_musicfes_code00", 0 ) --回到上一頁 
	else
		if Aeasy == true then
			SetSpeakDetail(OwnerID(), "[SC_MUSICFES_CODE16]" )--你已經報名過囉～！
			AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_musicfes_code00", 0 ) --回到上一頁 
		else
			if Ahard == true then
				SetSpeakDetail(OwnerID(), "[SC_MUSICFES_CODE20]" )--你正在進行其他難度的活動囉，請結束後再來挑戰。
				AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_musicfes_code00", 0 ) --回到上一頁 
			else
				if Deasy == true then
					SetSpeakDetail(OwnerID(), "[SC_MUSICFES_CODE16]" )--你已經報名過囉～！
					AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_musicfes_code00", 0 ) --回到上一頁 
				else

					local RANDOWN = rand(100)
					if RANDOWN >= 0 and  RANDOWN <=30  then  -- easy 1
						SetSpeakDetail(OwnerID(), "[SC_MUSICFES_CODE17_1]" )-- 簡單版題目1  " DO～RE MI DO～MI DO MI～～ "
						SetFlag(OwnerID()  , 542542 , 1 ) -- 接下挑戰簡單Q1 
						SetFlag(OwnerID()  , 542521 , 1 ) -- 接下挑戰簡單 
						SetFlag(OwnerID()  , 542530 , 1 ) -- step 00 
						BeginPlot(OwnerID() , "LuaN_musicfes_close1" , 100 )   
					elseif RANDOWN >= 31 and  RANDOWN <=60 then  --easy 2
						SetSpeakDetail(OwnerID(), "[SC_MUSICFES_CODE17_2]" )--  簡單版題目2  " DO DO SO SO RA RA SO～～ "
						SetFlag(OwnerID()  , 542543 , 1 ) -- 接下挑戰簡單Q2
						SetFlag(OwnerID()  , 542521 , 1 ) -- 接下挑戰簡單
						SetFlag(OwnerID()  , 542530 , 1 ) -- step 00 
						BeginPlot(OwnerID() , "LuaN_musicfes_close1" , 100 )   
					elseif RANDOWN >= 61 and  RANDOWN <=100 then  --easy 3
						SetSpeakDetail(OwnerID(), "[SC_MUSICFES_CODE17_3]" )--  簡單版題目3  " DO～DO MI SO SHI RA RA～～ "
						SetFlag( OwnerID()  , 542544 , 1 ) -- 接下挑戰簡單Q3
						SetFlag( OwnerID()  , 542521 , 1 ) -- 接下挑戰簡單 
						SetFlag( OwnerID()  , 542530 , 1 ) -- step 00 
						BeginPlot(OwnerID() , "LuaN_musicfes_close1" , 100 )   
					end
				end

			end
		end
	end
end
------------------------------------------------------------------------------
function LuaN_musicfes_code06() --報名困難旋律  
	local Aeasy= CheckFlag(OwnerID()  , 542521) -- 接下挑戰簡單  刪除點:完成最後階段時
	local Ahard= CheckFlag(OwnerID()  , 542522) -- 接下挑戰困難  
	local todayH= CheckFlag(OwnerID()  , 542526) -- 今天過完困難Flag 
	local Dhard  = CheckFlag(OwnerID()  , 542524) -- 達成目標 困難Flag   刪除點:回報活動時

	if todayH == true then
		SetSpeakDetail(OwnerID(), "[SC_MUSICFES_CODE15]" )--你今天已經挑戰過囉～！
		AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_musicfes_code00", 0 ) --回到上一頁 
	else
		if Ahard == true then
			SetSpeakDetail(OwnerID(), "[SC_MUSICFES_CODE16]" )--你已經報名過囉～！
			AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_musicfes_code00", 0 ) --回到上一頁 
		else
			if Aeasy == true then
				SetSpeakDetail(OwnerID(), "[SC_MUSICFES_CODE20]" )--你正在進行其他難度的活動囉，請結束後再來挑戰。
				AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_musicfes_code00", 0 ) --回到上一頁 
			else
				if Dhard == true then
					SetSpeakDetail(OwnerID(), "[SC_MUSICFES_CODE16]" )--你已經報名過囉～！
					AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_musicfes_code00", 0 ) --回到上一頁 
				else
					local RANDOWN = rand(100)
					if RANDOWN >= 0 and  RANDOWN <=30  then  -- 困難Q1
						SetSpeakDetail(OwnerID(), "[SC_MUSICFES_CODE18_1]" )-- 困難版題目1  " SO～SO RA SO FA MI～～MI～MI FA MI RE DO～～ "
						SetFlag( OwnerID()  , 542545 , 1 ) -- 接下挑戰困難Q1 
						SetFlag( OwnerID()  , 542522 , 1 ) -- 接下挑戰困難 
						SetFlag( OwnerID()  , 542530 , 1 ) -- step 00 
						BeginPlot(OwnerID() , "LuaN_musicfes_close1" , 100 )   
					elseif RANDOWN >= 31 and  RANDOWN <=60 then  --困難2
						SetSpeakDetail(OwnerID(), "[SC_MUSICFES_CODE18_2]" )--  困難版題目2  " MI MI SO～MI MI SO～MI SO DO SHI RA SO～～ "
						SetFlag( OwnerID()  , 542546 , 1 ) -- 接下挑戰困難Q2
						SetFlag( OwnerID()  , 542522 , 1 ) -- 接下挑戰困難
						SetFlag( OwnerID()  , 542530 , 1 ) -- step 00 
						BeginPlot(OwnerID() , "LuaN_musicfes_close1" , 100 )   
					elseif RANDOWN >= 61 and  RANDOWN <=100 then  --困難3
						SetSpeakDetail(OwnerID(), "[SC_MUSICFES_CODE18_3]" )--  困難版題目3  " DO SO SO SO FA MI RE DO～DO RA RA RA～～ "
						SetFlag( OwnerID()  , 542547 , 1 ) -- 接下挑戰困難Q3
						SetFlag( OwnerID()  , 542522 , 1 ) -- 接下挑戰困難 
						SetFlag( OwnerID()  , 542530 , 1 ) -- step 00 
						BeginPlot(OwnerID() , "LuaN_musicfes_close1" , 100 )   
					end
				end

			end
		end
	end
end
------------------------------------------------------------------------------
function LuaN_musicfes_code07() --我想再看一次題目
	local Qhard01= CheckFlag(OwnerID()  , 542545) -- 接下挑戰困難Q1   刪除點: 完成最後階段時
	local Qhard02= CheckFlag(OwnerID()  , 542546) -- 接下挑戰困難Q2  
	local Qhard03= CheckFlag(OwnerID()  , 542547) -- 接下挑戰困難Q3   
	local Qeasy01= CheckFlag(OwnerID()  , 542542) -- 接下挑戰簡單Q1   
	local Qeasy02= CheckFlag(OwnerID()  , 542543) -- 接下挑戰簡單Q2   
	local Qeasy03= CheckFlag(OwnerID()  , 542544) -- 接下挑戰簡單Q3  
	local Aeasy= CheckFlag(OwnerID()  , 542521) -- 接下挑戰簡單  刪除點:完成最後階段時
	local Ahard= CheckFlag(OwnerID()  , 542522) -- 接下挑戰困難  
	local todayH= CheckFlag(OwnerID()  , 542526) -- 今天過完困難Flag 
	local Aeasy= CheckFlag(OwnerID()  , 542521) -- 接下挑戰簡單  
	local Ahard= CheckFlag(OwnerID()  , 542522) -- 接下挑戰困難  
	local todayE= CheckFlag(OwnerID()  , 542525) -- 今天過完簡單Flag  
	local hard2= CheckFlag(OwnerID()  , 542558) -- 今天看過第二次困難版題目
	local hard3= CheckFlag(OwnerID()  , 542559) -- 今天看過第三次困難版題目


	if todayH == true and todayE == true then
		SetSpeakDetail(OwnerID(), "[SC_MUSICFES_CODE15]" )--你今天已經挑戰過囉～！
		AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_musicfes_code01", 0 ) --回到上一頁 
	elseif Ahard == true then --如果身上有困難版旗標
		if hard3 == true then --今天看過第三次困難版題目
			SetSpeakDetail(OwnerID(), "[SC_MUSICFES_CODE19]" )--抱歉，你今天觀看題目的次數已經用完了喔！
			AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_musicfes_code01", 0 ) --回到上一頁 
		elseif hard2 == true then --今天看過第二次困難版題目
			if  Qhard01 == true then
				SetSpeakDetail(OwnerID(), "[SC_MUSICFES_CODE18_1]" )-- 困難版題目1  " SO～SO RA SO FA MI～～MI～MI FA MI RE DO～～ "
				SetFlag(OwnerID()  , 542559 , 1 ) -- 給 今天看過第三次困難版題目
				BeginPlot(OwnerID() , "LuaN_musicfes_close1" , 100 )   
			elseif Qhard02 == true then
				SetSpeakDetail(OwnerID(), "[SC_MUSICFES_CODE18_2]" )-- 困難版題目2  " MI MI SO～MI MI SO～MI SO DO SHI RA SO～～ "
				SetFlag(OwnerID()  , 542559 , 1 ) -- 給 今天看過第三次困難版題目
				BeginPlot(OwnerID() , "LuaN_musicfes_close1" , 100 )   
			elseif Qhard03 == true then
				SetSpeakDetail(OwnerID(), "[SC_MUSICFES_CODE18_3]" )-- 困難版題目3  " DO SO SO SO FA MI RE DO～DO RA RA RA～～ "
				SetFlag(OwnerID()  , 542559 , 1 ) -- 給 今天看過第三次困難版題目
				BeginPlot(OwnerID() , "LuaN_musicfes_close1" , 100 )   
			end
		else
			if  Qhard01 == true then
				SetSpeakDetail(OwnerID(), "[SC_MUSICFES_CODE18_1]" )-- 困難版題目1  " SO～SO RA SO FA MI～～MI～MI FA MI RE DO～～ "
				SetFlag(OwnerID()  , 542558 , 1 ) -- 給 今天看過第二次困難版題目
				BeginPlot(OwnerID() , "LuaN_musicfes_close1" , 100 )   
			elseif Qhard02 == true then
				SetSpeakDetail(OwnerID(), "[SC_MUSICFES_CODE18_2]" )-- 困難版題目2  " MI MI SO～MI MI SO～MI SO DO SHI RA SO～～ "
				SetFlag(OwnerID()  , 542558 , 1 ) -- 給 今天看過第二次困難版題目
				BeginPlot(OwnerID() , "LuaN_musicfes_close1" , 100 )   
			elseif Qhard03 == true then
				SetSpeakDetail(OwnerID(), "[SC_MUSICFES_CODE18_3]" )-- 困難版題目3  " DO SO SO SO FA MI RE DO～DO RA RA RA～～ "
				SetFlag(OwnerID()  , 542558 , 1 ) -- 給 今天看過第二次困難版題目
				BeginPlot(OwnerID() , "LuaN_musicfes_close1" , 100 )   
			end
		end
	elseif Aeasy == true then --如果身上有簡單版旗標
		if Qeasy01 == true then		
			SetSpeakDetail(OwnerID(), "[SC_MUSICFES_CODE17_1]" )-- 簡單版題目1  " DO～RE MI DO～MI DO MI～～ "
			BeginPlot(OwnerID() , "LuaN_musicfes_close1" , 100 )   
		elseif Qeasy02 == true then
			SetSpeakDetail(OwnerID(), "[SC_MUSICFES_CODE17_2]" )--  簡單版題目2  " DO DO SO SO RA RA SO～～ "
			BeginPlot(OwnerID() , "LuaN_musicfes_close1" , 100 )   
		elseif Qeasy03 == true then
			SetSpeakDetail(OwnerID(), "[SC_MUSICFES_CODE17_3]" )--  簡單版題目3  " DO～DO MI SO SHI RA RA～～ 
			BeginPlot(OwnerID() , "LuaN_musicfes_close1" , 100 )    				
		end
	else
		SetSpeakDetail(OwnerID(), "[SC_MUSICFES_CODE21]" )--你還沒參加這個活動喔！
		AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_musicfes_code01", 0 ) --回到上一頁 

	end
end
------------------------------------------------------------------------------
function LuaN_musicfes_close1() --關掉視窗
	CloseSpeak(OwnerID())   --關閉對話視窗
end
------------------------------------------------------------------------------
function LuaN_musicfes_code08() --我想放棄這個題目
	local Qhard01= CheckFlag(OwnerID()  , 542545) -- 接下挑戰困難Q1   刪除點: 完成最後階段時
	local Qhard02= CheckFlag(OwnerID()  , 542546) -- 接下挑戰困難Q2  
	local Qhard03= CheckFlag(OwnerID()  , 542547) -- 接下挑戰困難Q3  
 
	local Qeasy01= CheckFlag(OwnerID()  , 542542) -- 接下挑戰簡單Q1   
	local Qeasy02= CheckFlag(OwnerID()  , 542543) -- 接下挑戰簡單Q2   
	local Qeasy03= CheckFlag(OwnerID()  , 542544) -- 接下挑戰簡單Q3  

	local Aeasy= CheckFlag(OwnerID()  , 542521) -- 接下挑戰簡單  刪除點:完成最後階段時
	local Ahard= CheckFlag(OwnerID()  , 542522) -- 接下挑戰困難  

	local hard2= CheckFlag(OwnerID()  , 542558) -- 今天看過第二次困難版題目
	local hard3= CheckFlag(OwnerID()  , 542559) -- 今天看過第三次困難版題目

	local step00=  CheckFlag(OwnerID()  , 542530) -- 第0個音符 
	local step01=  CheckFlag(OwnerID()  , 542531) -- 第1個音符 
	local step02=  CheckFlag(OwnerID()  , 542532) -- 第2個音符 
	local step03=  CheckFlag(OwnerID()  , 542533) -- 第3個音符 
	local step04=  CheckFlag(OwnerID()  , 542534) -- 第4個音符 
	local step05=  CheckFlag(OwnerID()  , 542535) -- 第5個音符 
	local step06=  CheckFlag(OwnerID()  , 542536) -- 第6個音符 
	local step07=  CheckFlag(OwnerID()  , 542537) -- 第7個音符 
	local step08=  CheckFlag(OwnerID()  , 542538) -- 第8個音符 
	local step09=  CheckFlag(OwnerID()  , 542539) -- 第9個音符 
	local step10=  CheckFlag(OwnerID()  , 542540) -- 第10個音符 
	local step11=  CheckFlag(OwnerID()  , 542541) -- 第11個音符 

	if Aeasy == false and Ahard == false then --沒flag
		SetSpeakDetail(OwnerID(), "[SC_MUSICFES_CODE24]" )--你沒有參加任何一個難度的活動喔！
	elseif Ahard == true then --有困難版flag
		SetSpeakDetail(OwnerID(), "[SC_MUSICFES_CODE25]" )--你已經放棄這個難度的活動囉！
		SetFlag(OwnerID()  , 542545 , 0 ) -- 刪玩家 困難Q1 Flag 
		SetFlag(OwnerID()  , 542546 , 0 ) -- 刪玩家 困難Q2 Flag 
		SetFlag(OwnerID()  , 542547 , 0 ) -- 刪玩家 困難Q3 Flag 
		SetFlag(OwnerID()  , 542522 , 0 ) -- 刪玩家 困難 Flag
		SetFlag(OwnerID()  , 542530 , 0 ) -- 刪玩家 題目00 Flag
		SetFlag(OwnerID()  , 542531 , 0 ) -- 刪玩家 題目01 Flag
		SetFlag(OwnerID()  , 542532 , 0 ) -- 刪玩家 題目02 Flag
		SetFlag(OwnerID()  , 542533 , 0 ) -- 刪玩家 題目03 Flag
		SetFlag(OwnerID()  , 542534 , 0 ) -- 刪玩家 題目04 Flag
		SetFlag(OwnerID()  , 542535 , 0 ) -- 刪玩家 題目05 Flag
		SetFlag(OwnerID()  , 542536 , 0 ) -- 刪玩家 題目06 Flag
		SetFlag(OwnerID()  , 542537 , 0 ) -- 刪玩家 題目07 Flag
		SetFlag(OwnerID()  , 542538 , 0 ) -- 刪玩家 題目08 Flag
		SetFlag(OwnerID()  , 542539 , 0 ) -- 刪玩家 題目09 Flag
		SetFlag(OwnerID()  , 542540 , 0 ) -- 刪玩家 題目10 Flag
		SetFlag(OwnerID()  , 542541 , 0 ) -- 刪玩家 題目11 Flag
		SetFlag(OwnerID()  , 542558 , 0 ) -- 今天看過第二次困難版題目
		SetFlag(OwnerID()  , 542559 , 0 ) -- 今天看過第三次困難版題目
		SetFlag(OwnerID()  , 542524 , 0 ) -- 刪玩家 達成目標 困難Flag
	elseif Aeasy == true then --有簡單版flag
		SetSpeakDetail(OwnerID(), "[SC_MUSICFES_CODE25]" )--你已經放棄這個難度的活動囉！
		SetFlag(OwnerID()  , 542542 , 0 ) -- 刪玩家 簡單Q1 Flag 
		SetFlag(OwnerID()  , 542543 , 0 ) -- 刪玩家 簡單Q2 Fla 
		SetFlag(OwnerID()  , 542544 , 0 ) -- 刪玩家 簡單Q3 Fla
		SetFlag(OwnerID()  , 542521 , 0 ) -- 刪玩家 簡單 Flag
		SetFlag(OwnerID()  , 542530 , 0 ) -- 刪玩家 題目00 Flag
		SetFlag(OwnerID()  , 542531 , 0 ) -- 刪玩家 題目01 Flag
		SetFlag(OwnerID()  , 542532 , 0 ) -- 刪玩家 題目02 Flag
		SetFlag(OwnerID()  , 542533 , 0 ) -- 刪玩家 題目03 Flag
		SetFlag(OwnerID()  , 542534 , 0 ) -- 刪玩家 題目04 Flag
		SetFlag(OwnerID()  , 542535 , 0 ) -- 刪玩家 題目05 Flag
		SetFlag(OwnerID()  , 542536 , 0 ) -- 刪玩家 題目06 Flag
		SetFlag(OwnerID()  , 542537 , 0 ) -- 刪玩家 題目07 Flag
		SetFlag(OwnerID()  , 542538 , 0 ) -- 刪玩家 題目08 Flag
		SetFlag(OwnerID()  , 542539 , 0 ) -- 刪玩家 題目09 Flag
		SetFlag(OwnerID()  , 542540 , 0 ) -- 刪玩家 題目10 Flag
		SetFlag(OwnerID()  , 542541 , 0 ) -- 刪玩家 題目11 Flag
		SetFlag(OwnerID()  , 542523 , 0 ) -- 刪玩家 達成目標 簡單Flag
	end		
end
------------------------------------------------------------------------------