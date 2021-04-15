function LuaYU_NPC2009helloween_transport_01()

	SetSpeakDetail( OwnerID(), "[SC_RUNRUNPUMPKIN_25]"   )
--呦～唧唧唧唧～依照主人的吩咐，在這個人人裝神弄鬼的慶典中，我們要和冒險者們玩個遊戲。如果你有意願的話，不用任何代價，我們將用快馬帶你到活動現場，唧唧唧唧～
	AddSpeakOption( OwnerID(), TargetID(), "[SC_111577_YU_17]" , "LuaYU_NPC2009helloween_transport_02", 0 ) --送我過去

end

function LuaYU_NPC2009helloween_transport_02()
	CloseSpeak( OwnerID() )      

	ScriptMessage( OwnerID() , OwnerID() , 1 , "|cffff00ff" .."[SC_RUNRUNPUMPKIN_26]".. "|r" , 0 ) --要出發囉，坐好啦~！
	ScriptMessage( OwnerID() , OwnerID() , 0 , "|cffff00ff" .."[SC_RUNRUNPUMPKIN_26]".. "|r" , 0 ) 
	sleep(15)
	BeginPlot(  OwnerID()  , "LuaYU_NPC2009helloween_transport_03" , 0 )  
end

function LuaYU_NPC2009helloween_transport_03()

	ChangeZone( OwnerID(), 2, 0, 1776.1, -36.5, 9153.6, 228 )

end


function LuaYU_NPC2009helloween_01()

	local play =  CheckFlag( OwnerID()  , 543293 ) --今天已經來過
	local ISGM = ReadRoleValue( OwnerID() , EM_RoleValue_VOC)

	if ISGM == 0 then

		ScriptMessage( OwnerID() , OwnerID() , 1 , "|cffff00ff" .."GM! You're GM ! SO PASS".. "|r" , 0 ) 
		ScriptMessage( OwnerID() , OwnerID() , 0 , "|cffff00ff" .."GM ! You're GM ! SO PASS".. "|r" , 0 ) 

		SetSpeakDetail( OwnerID(), "[SC_RUNRUNPUMPKIN_10]"   )

		AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_08]" , "LuaYU_NPC2009helloween_02", 0 ) --關於遊戲規則
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_02]" , "LuaYU_NPC2009helloween_04", 0 ) --接受挑戰
		AddSpeakOption( OwnerID(), TargetID(), "[SC_CLICKFUNGO24]" , "LuaYU_NPC2009helloween_05", 0 ) --獎勵兌換


	elseif  play == true then

		SetSpeakDetail( OwnerID(), "[SC_111813_YU_34]"   )--呦～唧唧唧唧～是意猶未盡嗎？每人每天只有一次機會唷！明天再來吧！
		AddSpeakOption( OwnerID(), TargetID(), "[SC_CLICKFUNGO24]" , "LuaYU_NPC2009helloween_05", 0 ) --獎勵兌換
--		AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_11]" , "LuaYU_NPC2009helloween_03 ", 0 ) --其他協議


	elseif CheckBuff( OwnerID() , 504979) == true  then

		SetSpeakDetail( OwnerID(), "[SC_RUNRUNPUMPKIN_14]"   )
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_08]" , "LuaYU_NPC2009helloween_02", 0 ) --關於遊戲規則

	elseif play == false then

		SetSpeakDetail( OwnerID(), "[SC_RUNRUNPUMPKIN_10]"   )
--呦～唧唧唧唧～依照主人的吩咐，在這個人人裝神弄鬼的慶典中，我們要和冒險者們玩個遊戲。
--我是 詭譎的小丑。瑪拉蒂娜 派遣來的使者，這次，我們帶來了更加有挑戰的機關-阿密特狂熱！
-- 如果你通過了考驗，將有機會收集到全套的詭譎小丑套裝或其他不錯的獎勵，唧唧唧唧～
--準備接受來自阿密特的挑戰了嗎！？唧唧唧唧～
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_08]" , "LuaYU_NPC2009helloween_02", 0 ) --關於遊戲規則
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_02]" , "LuaYU_NPC2009helloween_04 ", 0 ) --接受挑戰
		AddSpeakOption( OwnerID(), TargetID(), "[SC_CLICKFUNGO24]" , "LuaYU_NPC2009helloween_05", 0 ) --獎勵兌換


	end

end

function LuaYU_NPC2009helloween_02()--關於遊戲規則

		SetSpeakDetail( OwnerID(), "[SC_RUNRUNPUMPKIN_11]"   )


--規則很簡單，當中央的大南瓜-狂熱核心開始轉動後，便會產生 詭異的南瓜 ，在詭異的南瓜竄動時點擊他，
--你將成功揪出小南瓜怪，並使核心受到一定程度的傷害、且隨機產生三種顏色的惡魔南瓜籽，在那稍縱即逝
--的瞬間，若沒有及時點擊，便會產生三種顏色的魔瓜攻擊你，唧唧唧唧～你可是沒辦法攻擊他的呦！
--但是投擲與魔瓜相同顏色的惡魔南瓜籽卻可以讓魔瓜承受惡魔的封印，當堆疊三道封印時，魔瓜將會吐出火焰
--反噬狂熱核心！如此，將會產生更多的惡魔南瓜籽。

--當成功摧毀狂熱核心時，將有機率出現狂熱魔瓜王，任何顏色的南瓜籽都可以對他投擲喔！
--(越短的時間摧毀狂熱核心，魔瓜王出現的機率也就越高！)

--計分方式：

--揪出小南瓜怪，得1分。
--成功投擲出南瓜籽，得1分。

--兌獎方式：
--依分數配獎。

		AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_02]" , "LuaYU_NPC2009helloween_04 ", 0 ) --接受挑戰
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_NPC2009helloween_01", 0 ) --回上一頁

end

function LuaYU_NPC2009helloween_03()--其他協議

		SetSpeakDetail( OwnerID(), "[SC_113120_MALA2_03]"   )
--如果還想再玩一次的話，

		AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_02]" , "LuaYU_NPC2009helloween_02", 0 ) --關於遊戲規則

end

function LuaYU_NPC2009helloween_04()--挑受挑戰

	CloseSpeak( OwnerID() )      

	AddBuff(OwnerID(), 504979,0,-1)

	ScriptMessage( OwnerID() , OwnerID() , 1 , "|cffff00ff" .."[SC_RUNRUNPUMPKIN_13]".. "|r" , 0 ) 
	ScriptMessage( OwnerID() , OwnerID() , 0 , "|cffff00ff" .."[SC_RUNRUNPUMPKIN_13]".. "|r" , 0 ) 

	local Score = 0

	ClockOpen( OwnerID()  ,EM_ClockCheckValue_2,300,300,0,"LuaYU_NPC2009helloween_end","LuaYU_NPC2009helloween_end")--倒數計時器 (後面的兩個呼叫函式： "換區消失"，"時間到時呼叫函式")

	SetSmallGameMenuType( OwnerID() , 5 , 1 ) --開啟介面( 使用者,字串序號,1開/2關 )
	SetSmallGameMenuStr( OwnerID() , 5 , 1 , "[SC_RUNRUNPUMPKIN_12]" ) -- TIPS 活動標題
	SetSmallGameMenuStr( OwnerID() , 5 , 2 , "[SC_BEERDAY_49][$SETVAR1="..Score.."]"  ) -- Change grade (++String數字"))  數字  SC_BEERDAY_49 = 分數 <-- Tips

	WriteRoleValue( OwnerID()  , EM_RoleValue_Register+9 ,  0  ) --記錄分數

--	SetSmallGameMenuType( OwnerID() , 2 ,2 ) -- 關閉介面

--	INSTANCE_STATE_05  =  阿密特狂熱
--	INSTANCE_SCORE_05 = 分數
--	INSTANCE_TIPS_05 = 請在計時內，根據提出的問題，點選提供的按鈕作答。答題正確將加<CY> 1 </CY>點分數，答題錯誤則扣<CS> 2 </CS>點分數。

--	02 = OwnerID() 之後的 2


end

function LuaYU_NPC2009helloween_end()--挑受挑戰

	ClockClose(OwnerID())
	ScriptMessage( OwnerID() , OwnerID() , 1 , "|cffff00ff" .."[SC_RUNRUNPUMPKIN_24]".. "|r" , 0 ) 
	ScriptMessage( OwnerID() , OwnerID() , 0 , "|cffff00ff" .."[SC_RUNRUNPUMPKIN_24]".. "|r" , 0 ) 

	CancelBuff( OwnerID(), 504979 );	
	CancelBuff( OwnerID(),  504940);	
	CancelBuff( OwnerID(),  504941);	
	CancelBuff( OwnerID(),  504942);	
	CancelBuff( OwnerID(),  504943);	
	CancelBuff( OwnerID(),  504944);	
	CancelBuff( OwnerID(),  504945);	

	local Score = ReadRoleValue( OwnerID()  ,EM_RoleValue_Register+9 ) 

--	Say( OwnerID() ,  Score )

	GiveBodyItem( OwnerID() , 206021  , Score ) --狂熱戰果

	WriteRoleValue( OwnerID()  , EM_RoleValue_Register+9 ,  0  ) --清空分數
	SetSmallGameMenuType( OwnerID() , 5 , 2) -- 關閉介面	

	SetFlag( OwnerID() , 543293, 1)

end

function LuaYU_NPC2009helloween_05()--獎勵兌換

	local ISGM = ReadRoleValue( OwnerID() , EM_RoleValue_VOC)

	if ISGM == 0 then

--		ScriptMessage( OwnerID() , OwnerID() , 1 , "|cffff00ff" .."GM! You're GM ! SO PASS".. "|r" , 0 ) 
--		ScriptMessage( OwnerID() , OwnerID() , 0 , "|cffff00ff" .."GM ! You're GM ! SO PASS".. "|r" , 0 ) 


		SetSpeakDetail(  OwnerID(), "[SC_RUNRUNPUMPKIN_17]"  ) --呦～唧唧唧唧～來吧，告訴我你想兌換什麼？

		AddSpeakOption( OwnerID(), TargetID(), "Give me [206021]" , "LuaYU_NPC2009helloween_GM_01", 0 ) -- 給我狂熱之焰
		AddSpeakOption( OwnerID(), TargetID(), "NickName  Del" , "LuaYU_NPC2009helloween_GM_02", 0 ) -- 幫我清除南瓜節所有稱號
		AddSpeakOption( OwnerID(), TargetID(), "[SC_RUNRUNPUMPKIN_18]" , "LuaYU_NPC2009helloween_05_01", 0 ) -- 兌換禮物
		AddSpeakOption( OwnerID(), TargetID(), "[SC_RUNRUNPUMPKIN_19]" , "LuaYU_NPC2009helloween_05_02", 0 ) -- 隨便什麼都好
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_NPC2009helloween_01", 0 ) --回上一頁

	else

		SetSpeakDetail(  OwnerID(), "[SC_RUNRUNPUMPKIN_17]"  ) --呦～唧唧唧唧～來吧，告訴我你想兌換什麼？

		AddSpeakOption( OwnerID(), TargetID(), "[SC_RUNRUNPUMPKIN_18]" , "LuaYU_NPC2009helloween_05_01", 0 ) -- 兌換禮物
		AddSpeakOption( OwnerID(), TargetID(), "[SC_RUNRUNPUMPKIN_19]" , "LuaYU_NPC2009helloween_05_02", 0 ) -- 隨便什麼都好
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_NPC2009helloween_01", 0 ) --回上一頁

	end
end

function LuaYU_NPC2009helloween_GM_01()
	CloseSpeak( OwnerID() )      
	GiveBodyItem(  OwnerID()  , 206021 , 999 )--狂熱之焰

	ScriptMessage( OwnerID() , OwnerID() , 1 , "|cffff00ff" .."GM! OK".. "|r" , 0 ) 
end

function LuaYU_NPC2009helloween_GM_02()-- 幫我清除南瓜節所有稱號
	CloseSpeak( OwnerID() )      

	DelBodyItem(  OwnerID()  , 530003 , 1 ) 
	DelBodyItem(  OwnerID()  , 530004 , 1 ) 
	DelBodyItem(  OwnerID()  , 530364 , 1 ) 
	DelBodyItem(  OwnerID()  , 530365 , 1 ) 
	DelBodyItem(  OwnerID()  , 530366 , 1 ) 

	SetFlag( OwnerID() , 543293, 0)

	ScriptMessage( OwnerID() , OwnerID() , 1 , "|cffff00ff" .."GM! OK".. "|r" , 0 ) 

end

function LuaYU_NPC2009helloween_05_01()--兌換禮物

	local Fire =  CountBodyItem( OwnerID() , 206021 ) --狂熱之焰

	if Fire > 49 then

		SetSpeakDetail(  OwnerID(), "[SC_RUNRUNPUMPKIN_20]"  ) --你想要禮物呀？給我50個狂熱之焰，我從禮物袋裡面抽一個禮物給你。
		AddSpeakOption( OwnerID(), TargetID(), "[SC_RUNRUNPUMPKIN_18]" , "LuaYU_NPC2009helloween_05_01_01", 0 ) -- 兌換禮物
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_NPC2009helloween_05", 0 ) --回上一頁

	else

		SetSpeakDetail(  OwnerID(), "[SC_RUNRUNPUMPKIN_22]"  ) --你想要禮物呀？但是需要50個狂熱之焰，我才能從禮物袋裡面抽一個禮物給你喔。
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_NPC2009helloween_05", 0 ) --回上一頁

	end

end

function LuaYU_NPC2009helloween_05_01_01()
	local PlayerID = OwnerID()
	local Fire =  CountBodyItem( OwnerID() , 206021 ) --狂熱之焰
	local Amit =  CountBodyItem( OwnerID() , 530004 ) --稱號：搖滾吧！阿密特


	CloseSpeak( OwnerID() )      

	DelBodyItem( PlayerID , 206021 , 50 ) --狂熱之焰

	ScriptMessage( OwnerID() , OwnerID() , 1 , "|cffff00ff" .."[E2008HELL_K_2]".. "|r" , 0 ) --南瓜節快樂
	ScriptMessage( OwnerID() , OwnerID() , 0 , "|cffff00ff" .."[E2008HELL_K_2]".. "|r" , 0 ) 

	local P = 100
	local XX = Rand( P )      

	if XX>=70 and XX<100 then
		GiveBodyItem( PlayerID , 203142 , 1 )--驚喜禮盒
	elseif XX>=35 and XX<70 then
		GiveBodyItem( PlayerID , 203240 , 5 )--南瓜補給禮盒

	elseif XX>=5 and XX<35 then
		GiveBodyItem( PlayerID , 203239 , 1 )--神秘禮盒
	else
		GiveBodyItem( PlayerID , 206007, 1 )--狂熱酷裝禮盒
	end

	if Amit == 0 and Fire >= 250 then

		GiveBodyItem( PlayerID , 530004, 1 )

		ScriptMessage( OwnerID() , OwnerID() , 1 , "|cffff00ff" .."[SC_QTITLENPC_014]".."[530004]".. "|r" , 0 ) --恭喜取得稱號
		ScriptMessage( OwnerID() , OwnerID() , 0 , "|cffff00ff" .."[SC_QTITLENPC_014]".."[530004]".. "|r" , 0 ) --恭喜取得稱號

	end

end

function LuaYU_NPC2009helloween_05_02()--隨便什麼都好


	local Fire =  CountBodyItem( OwnerID() , 206021 ) --狂熱之焰

	if Fire > 24 then

		SetSpeakDetail(  OwnerID(), "[SC_RUNRUNPUMPKIN_21]"  ) --隨便什麼都好呀？那麼給我25個狂熱之焰，我就隨便給你個什麼吧。
		AddSpeakOption( OwnerID(), TargetID(), "[SC_RUNRUNPUMPKIN_19]" , "LuaYU_NPC2009helloween_05_02_01", 0 ) -- 隨便什麼都好
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_NPC2009helloween_05", 0 ) --回上一頁

	else


		SetSpeakDetail(  OwnerID(), "[SC_RUNRUNPUMPKIN_23]"  ) --隨便什麼都好呀？那麼至少要有25個狂熱之焰，我才能給你喔。
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_NPC2009helloween_05", 0 ) --回上一頁

	end


end

function LuaYU_NPC2009helloween_05_02_01()
	local PlayerID = OwnerID()
	CloseSpeak( OwnerID() )      
	local Fire =  CountBodyItem( OwnerID() , 206021 ) --狂熱之焰
	local Amit =  CountBodyItem( OwnerID() , 530003 ) --稱號：阿密特狂熱

	DelBodyItem( PlayerID , 206021 , 25 )

	ScriptMessage( OwnerID() , OwnerID() , 1 , "|cffff00ff" .."[E2008HELL_K_2]".. "|r" , 0 ) --南瓜節快樂
	ScriptMessage( OwnerID() , OwnerID() , 0 , "|cffff00ff" .."[E2008HELL_K_2]".. "|r" , 0 ) 

	local P = 100
	local XX = Rand( P )      

	if XX>=60 and XX<100 then--40
		GiveBodyItem( PlayerID , 203240 , 3 )--南瓜補給禮盒
	elseif XX>=30 and XX<60 then--30
		GiveBodyItem( PlayerID , 203239, 1 )--南瓜神秘禮盒
	elseif XX>=15 and XX<30 then--15
		GiveBodyItem( PlayerID , 203142, 1 )--南瓜驚喜禮盒
	elseif XX>=10 and XX<15 then--5
		GiveBodyItem( PlayerID , 203178, 1 )--古老KEY
	else--10
		GiveBodyItem( PlayerID , 203090, 1 )--小南瓜變身
	end

	if Amit == 0 and Fire >= 150 then

		GiveBodyItem( PlayerID , 530003, 1 )

		ScriptMessage( OwnerID() , OwnerID() , 1 , "|cffff00ff" .."[SC_QTITLENPC_014]".."[530003]".. "|r" , 0 ) --恭喜取得稱號
		ScriptMessage( OwnerID() , OwnerID() , 0 , "|cffff00ff" .."[SC_QTITLENPC_014]".."[530003]".. "|r" , 0 ) --恭喜取得稱號

	end

end




function LuaI_helloCool2( Option )
	local PlayerID = OwnerID()
	local PackageID = 206007		--狂熱酷裝禮盒
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	local KEY =  CountBodyItem( PlayerID , 203178 ) --古老的鑰匙
	local SEX = ReadRoleValue( OwnerID()  ,EM_RoleValue_SEX) 


	local Item = {	724055,		-- 酷面具
			724880,		-- 男狂熱裝
			724881	}		-- 女狂熱裝

	local probability = {	55,		-- 
				45	}       	-- 

	local RAND = rand(100)

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) and ( CountBodyItem( PlayerID , 203178 ) >= 1 ) then
			return true
		else
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_DAN_111700_30]" , 0 ) 
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_DAN_111700_30]" , 0 ) 
			return false
		end
	elseif ( Option == "USE" ) then
		if RAND > (100 - probability[1]) then
			GiveBodyItem( PlayerID , Item[1] , 1 )	
			DelBodyItem( PlayerID , 203178 , 1 )
				
		else
			if SEX == 0 then
			GiveBodyItem( PlayerID , Item[2] , 1 )	
			DelBodyItem( PlayerID , 203178 , 1 )
			else
			GiveBodyItem( PlayerID , Item[3] , 1 )	
			DelBodyItem( PlayerID , 203178 , 1 )	
			end	
		end
	end
end