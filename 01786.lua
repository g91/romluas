----------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_KR_203038_Bonus_00() -- 當天未接任務過 可看到此選項

--	前幾天，我們的研究人員發現了一種新的物質 - 聚合源種，這種物質的能量脈動引起了研究人員的高度興趣。
--	因此我們發起了尋找聚合源種的活動，在此活動期間，只要你交給我們一定數量的聚合源種提供研究，我就會給你豐富的報酬喔。

--	Say( OwnerID() , "1" ) -- 玩家
--	Say( TargetID() , "2" ) -- NPC

	BeginPlot( TargetID() , "Lua_Hao_KR_203038_Bonus_Range" , 0 ) -- 距離超過50即關閉對話視窗

	local Key = Checkflag(OwnerID() , 543959 ) 	-- 任務Key
	local Accept = Checkflag(OwnerID() , 543960 ) 	-- 任務進行中
	local Over = Checkflag(OwnerID() , 543961 ) 	-- 任務完成
	if Over == true then
		AdjustFaceDir( TargetID() , OwnerID() , 0 ) --面向
		PlayMotion( TargetID() , 254 ) -- 伸懶腰
		SetSpeakDetail( OwnerID() , "[SC_THANKSGIVING_16]" ) -- 你今天已經完成了這個任務，請你明天再來吧。
	--	LoadQuestOption(OwnerID())  --載入任務模板
	else
		PlayMotion( TargetID() , 106 ) -- 點頭
		AdjustFaceDir( TargetID(), OwnerID() , 0 ) --面向
		if Key == true then -- 任務Key，可挑戰時才載入
		--	PlayMotion( TargetID() , 112 ) -- 比劃
			LoadQuestOption(OwnerID())  --載入任務模板
			AddSpeakOption(  OwnerID() , TargetID() , "[SC_KOREA_BONUS_04]" ,  "Lua_Hao_KR_203038_Bonus_01",  0 ) -- 我該去哪裡才能夠找到[207224]呢？
		else -- 任務Key，不可挑戰
			if Accept == false then -- 未領到任務進行中的Key
			--	PlayMotion( TargetID() , 106 ) -- 點頭
				SetSpeakDetail( OwnerID() , "[SC_KOREA_BONUS_00]" ) -- 你好，我是必爾汀商會的商人[114785]，有件好事想跟你一起分享... 
				AddSpeakOption(  OwnerID() , TargetID( ) , "[SC_KOREA_BONUS_01]" ,  "Lua_Hao_KR_203038_Bonus_02",  0 ) -- 是什麼事情呢？
			end
		end
	end
end
----------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_KR_203038_Bonus_01() -- 選項 我該去哪才能取得[207222]呢？

	AdjustFaceDir( TargetID() , OwnerID() , 0 ) --面向
	SetSpeakDetail( OwnerID() , "[SC_THAILAND_SONGKRAN_007]" ) --只要擊倒與你的主職等級相近的怪物，就有機會於拾取物品時取得。
	AddSpeakOption( OwnerID() , TargetID( ) , GetString("SO_BACK") , "Lua_Hao_KR_203038_Bonus_00", 0 ) --回到上一頁
end
----------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_KR_203038_Bonus_02() --選項  是什麼事情呢？

	local Over = Checkflag(OwnerID() , 543961 ) 	-- 任務完成

--	Say( OwnerID() , "02 = 1" ) -- 玩家
--	Say( TargetID() , "02 = 2" ) -- NPC
	CloseSpeak( OwnerID() )

--	if Over == true then
--		AdjustFaceDir( TargetID() , OwnerID() , 0 ) --面向 
--		PlayMotion( TargetID() , 254 ) -- 伸懶腰
--		SetSpeakDetail( OwnerID() , "[SC_THANKSGIVING_16]" ) -- 你今天已經完成了這個任務，請你明天再來吧。
--		AddSpeakOption(  OwnerID() , TargetID() , "[SC_KOREA_BONUS_04]" ,  "Lua_Hao_KR_203038_Bonus_01",  0 ) -- 我該去哪才能取得[207222]呢？
--	else
		AdjustFaceDir( TargetID() , OwnerID() , 0 ) --面向
		PlayMotion( TargetID() , 112 ) -- 比劃
		Setflag( OwnerID() , 543959 , 1 ) -- 任務Key 
		LoadQuestOption( OwnerID() )  --載入任務模板
		AddSpeakOption(  OwnerID() , TargetID() , "[SC_KOREA_BONUS_04]" ,  "Lua_Hao_KR_203038_Bonus_01",  0 ) -- 我該去哪才能取得[207222]呢？
--	end
end
----------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_KR_203038_Bonus_03() --接受任務後，再執行的Script。

--	Say( OwnerID() , "03 = 1" ) -- NPC
--	Say( TargetID() , "03 = 2" ) -- 玩家
	AdjustFaceDir( OwnerID() , TargetID() , 0 ) --面向
	PlayMotion( OwnerID() , 106 ) -- 點頭
	Setflag( TargetID() , 543960, 1 ) -- 任務進行中
end
----------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_KR_203038_Bonus_04() -- 完成任務後，再執行的Script。

	AdjustFaceDir( OwnerID(), TargetID() , 0 ) --面向
	PlayMotion( OwnerID() , 102 )

--	Say( TargetID() , "1" )	-- 玩家
--	Say( OwnerID() , "2" )	-- NPC

	SetFlag( TargetID() , 543959 , 0 ) -- 刪除任務Key
	SetFlag( TargetID() , 543960 , 0 ) -- 刪除任務進行中
	SetFlag( TargetID() , 543961 , 1 ) -- 給予當日已領取禮包旗標
--	GiveBodyItem( TargetID() , 203038 , 100 ) -- 給予100個必爾汀代幣
--	Sleep(20)
--	PlayMotion( OwnerID() , 103 )  -- 舉臂

end
----------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_KR_203038_Bonus_Range() -- 距離超過50即關閉對話視窗

--	say(OwnerID() , "3" ) --NPC
--	say(TargetID() , "4" ) --玩家

	while true do
		if GetDistance( OwnerID() , TargetID() )  >= 50 then
			CloseSpeak( TargetID() )
			AdjustFaceDir( OwnerID(), TargetID() , 0 ) -- 面向
			local Count = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
			X = Count + 1 
			WriteRoleValue( OwnerID() , EM_RoleValue_PID , X )

			if CheckAcceptQuest( TargetID() , 423077 ) == true then
				if Count == 1 then
					tell( TargetID() , OwnerID() ,"[SC_KOREA_BONUS_02]" ) --　期待你的好消息。
					PlayMotion( OwnerID() , 116 ) -- 再見
					break
				elseif Count == 2 then
					tell( TargetID() , OwnerID() , "[Sys423077_szquest_uncomplete_detail]" ) -- 別浪費一分一秒，時間就是金錢。
					PlayMotion( OwnerID() , 103 ) -- 舉臂
					break
				elseif Count > 2 then
					WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 )
					PlayMotion( OwnerID() , 116 ) -- 再見
					break
				end
			elseif CheckAcceptQuest( TargetID() , 423077 ) == false and Checkflag( TargetID() , 543961 ) == false then
				tell( TargetID() , OwnerID() ,"[SC_KOREA_BONUS_03]" ) --　你...別懷疑，就是你，難道你不想知道所謂的好情報嗎？
				PlayMotion( OwnerID() , 109 ) -- 指名
				break
			end
		end
		sleep(5)
	end
end