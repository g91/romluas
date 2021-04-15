---------------------------------------------------------------
------------------------NPCtalking---------------------------
function lua_nehelia_Music_NPC()	--NPC
	local Player=OwnerID()
	local NPC=TargetID()

	local A=CheckFlag ( Player , 546497 )		--報名
	local B=CheckFlag ( Player , 546498 )		--傳送
	local C=CheckFlag ( Player , 546499 )		--完成
	local ItemA=CountBodyItem( Player , 241362 )	--剛接任務物品
	local ItemB=CountBodyItem( Player , 241363 )	--任務失敗物品
	local ItemC=CountBodyItem( Player , 241365 )	--任務成功物品

	if A==false and C==false then
		SetSpeakDetail ( Player,"[SC_MUSIC_2012NE_01]")						--嘿，[$playername]，你覺得我剛才演奏的音樂如何啊？
		AddSpeakOption( Player , NPC , "[SC_MUSIC_2012NE_02]" , "lua_nehelia_Music_NPC1", 0 )	--音符祭壇是什麼?
	elseif A==true and ItemA==0 and ItemB==0 and ItemC==0 then
		SetSpeakDetail ( Player,"[SC_MUSIC_2012NE_27]")
		AddSpeakOption( Player , NPC , "[SC_VALENTINE_2012NE_06]" , "lua_nehelia_Music_NPC4", 0 )	--沒問題，交給我吧！
		AddSpeakOption( Player , NPC , "[SC_MUSIC_2012NE_28]" , "lua_nehelia_Music_obj1", 0 )		--我不想幫了
	elseif ItemA>=1 then
		SetSpeakDetail ( Player,"[SC_MUSIC_2012NE_06]".."[SC_MUSIC_2012NE_07]")
			if B ==false then
			AddSpeakOption( Player , NPC , "[SC_MUSIC_2012NE_08]" , "lua_nehelia_Music_NPC3", 0 )		--請送我過去
			end
	elseif ItemB>=1 then
		SetSpeakDetail ( Player,"[SC_MUSIC_2012NE_24]")
		SetFlag( Player , 546499 , 1 )		--完成
		SetFlag( Player , 546497 , 0 )		--報名關閉
		GiveBodyItem ( Player , 202903 , 1 )	--給予獎勵**記得改
		DelBodyItem( Player , 241363 , 1 )	--刪除任務琴
	elseif ItemC>=1 then
		SetSpeakDetail ( Player,"[SC_MUSIC_2012NE_11]")
		SetFlag( Player , 546499 , 1 )		--完成
		SetFlag( Player , 546497 , 0 )		--報名關閉
		GiveBodyItem ( Player , 202903 , 1 )	--給予獎勵**記得改
		DelBodyItem( Player , 241365 , 1 )	--刪除任務琴
		SetFlag( Player , 546501 , 0 )		--任務完成祭壇對話關閉
	else
		SetSpeakDetail ( Player,"[SC_MUSIC_2012NE_18]")
	end

end


function lua_nehelia_Music_NPC1()
	local Player=OwnerID()
	local NPC=TargetID()
	SetSpeakDetail ( Player,"[SC_MUSIC_2012NE_03]".."[SC_MUSIC_2012NE_04]")		--每年這個時候，在凡瑞娜絲城附近會出現音符祭壇。	
	AddSpeakOption( Player , NPC , "[SC_VALENTINE_2012NE_06]" , "lua_nehelia_Music_NPC2", 0 )--沒問題，交給我吧！
end


function lua_nehelia_Music_NPC2()
	local Player=OwnerID()
	local NPC=TargetID()
	SetSpeakDetail ( Player,"[SC_MUSIC_2012NE_05]".."[SC_MUSIC_2012NE_06]".."[SC_MUSIC_2012NE_07]")--哇～真是太好了，這是我的琴，那就拜託你囉～！
	AddSpeakOption( Player , NPC , "[SC_MUSIC_2012NE_08]" , "lua_nehelia_Music_NPC3", 0 )		--請送我過去
	SetFlag( Player , 546497 , 1 )		--打開報名Flag
	GiveBodyItem( Player , 241362 , 1 )	--給予撒西拉拉的琴
end


function lua_nehelia_Music_NPC3()	--FLY
	local Player=OwnerID()
	local NPC=TargetID()
	SetFlag( Player , 546498 , 1 )		--打開傳送Flag
	ChangeZone( Player , 2 , -1 , 2374.0 , 30.4 , 259.2 , 20.7)
end

function lua_nehelia_Music_NPC4()	--GIVE
	local Player=OwnerID()
	local NPC=TargetID()
	GiveBodyItem( Player , 241362 , 1 )	--給予撒西拉拉的琴
end

---------------------------------------------------------------
--------------------------音符祭壇----------------------------
function lua_nehelia_Music_altar()	--音符祭壇
	local Player=OwnerID()
	local NPC=TargetID()
	local Check=CheckBuff ( Player , 622517 )
	local Point=FN_CountBuffLevel( Player , 622516 ) 
	local PlayerVoc = ReadRoleValue( Player , EM_RoleValue_VOC  )	--讀玩家職業(1.戰2.遊3.影4.法5.祭6.騎7.森8.神)


	SetSpeakDetail ( Player,"[SC_MUSIC_2012NE_22]")
	AddSpeakOption( Player , NPC , "[SC_MUSIC_2012NE_23]" , "lua_nehelia_Music_altar1", 0 )	--請傳送我回去

		if Point==4 and Check==false then	--5分
			if PlayerVoc==4 or PlayerVoc==5 or PlayerVoc==7 or PlayerVoc==8 then	--法系
				ScriptMessage(Player,Player,1,"[SC_MUSIC_2012NE_19]",C_SYSTEM)
				AddBuff ( Player , 622519 , 0 , -1 )
				AddBuff ( Player , 622596 , 0 , -1 )	--表演用Buff			
				CancelBuff ( Player , 622516 )
				DelBodyItem( Player , 241362 , 1 )	--刪除任務琴
				GiveBodyItem( Player , 241365 , 1 )	--給予祝福琴
				SetFlag( Player , 546501 , 1 )		--打開完成任務祭壇對話
			else
				ScriptMessage(Player,Player,1,"[SC_MUSIC_2012NE_19]",C_SYSTEM)
				AddBuff ( Player , 622518 , 0 , -1 )
				AddBuff ( Player , 622596 , 0 , -1 )	--表演用Buff			
				CancelBuff ( Player , 622516 )			
				DelBodyItem( Player , 241362 , 1 )	--刪除任務琴
				GiveBodyItem( Player , 241365 , 1 )	--給予祝福琴
				SetFlag( Player , 546501 , 1 )		--打開完成任務祭壇對話
			end
		elseif Point==4 and Check==true then	--5分+Bunus分數
			if PlayerVoc==4 or PlayerVoc==5 or PlayerVoc==7 or PlayerVoc==8 then	--法系
				ScriptMessage(Player,Player,1,"[SC_MUSIC_2012NE_19]",C_SYSTEM)
				AddBuff ( Player , 622593 , 0 , -1 )
				AddBuff ( Player , 622597 , 0 , -1 )	--表演用Buff			
				CancelBuff ( Player , 622516 )
				CancelBuff ( Player , 622517 )
				DelBodyItem( Player , 241362 , 1 )	--刪除任務琴
				GiveBodyItem( Player , 241365 , 1 )	--給予祝福琴
				SetFlag( Player , 546501 , 1 )		--打開完成任務祭壇對話
			else
				ScriptMessage(Player,Player,1,"[SC_MUSIC_2012NE_19]",C_SYSTEM)
				AddBuff ( Player , 622592 , 0 , -1 )
				AddBuff ( Player , 622597 , 0 , -1 )	--表演用Buff			
				CancelBuff ( Player , 622516 )
				CancelBuff ( Player , 622517 )
				DelBodyItem( Player , 241362 , 1 )	--刪除任務琴
				GiveBodyItem( Player , 241365 , 1 )	--給予祝福琴
				SetFlag( Player , 546501 , 1 )		--打開完成任務祭壇對話
			end
		else
			SetSpeakDetail ( Player,"[SC_MUSIC_2012NE_20]")
		end

end


function lua_nehelia_Music_altar1()	--祭壇幫你飛回去
	local Player=OwnerID()
	local NPC=TargetID()
--	Tell( Player , NPC , "Good Luck" )
	ChangeZone( Player , 2 , -1 , 3009.7 , 44.9 , 98.4 , 179.5)
end

---------------------------------------------------------------
----------------------------小精靈----------------------------

function lua_nehelia_Music_elf()		--小精靈
	local Player=OwnerID()
	local NPC=TargetID()
	SetSpeakDetail ( Player,"[SC_MUSIC_2012NE_12]")
	AddSpeakOption( Player , NPC , "[SC_MUSIC_2012NE_25]" , "lua_nehelia_Music_elf1", 0 )
end


function lua_nehelia_Music_elf1()	--小精靈1
	local Player=OwnerID()
	local NPC=TargetID()
	local CheckFly=CheckFlag ( Player , 546500 )
	local Buff=CheckBuff ( Player , 622516 )
	local Bonus=CheckBuff ( Player , 622517 )

	SetSpeakDetail ( Player,"[SC_MUSIC_2012NE_13]")
	if CheckFly==false then
		AddSpeakOption( Player , NPC , "[SC_MUSIC_2012NE_15]" , "lua_nehelia_Music_elf2", 0 )	--音符證明
	end
	AddSpeakOption( Player , NPC , "[SC_MUSIC_2012NE_16]" , "lua_nehelia_Music_elf3", 0 )		--傳送者符文
	if Buff==true or Bonus==true then
		AddSpeakOption( Player , NPC , "[SC_MUSIC_2012NE_29]" , "lua_nehelia_Music_elf4", 0 )	--我跳的好辛苦，有其他方法嗎
	end
end


function lua_nehelia_Music_elf2()	--小精靈飛2
	local Player=OwnerID()
	local NPC=TargetID()
	local Check=CheckBuff ( Player , 622516 )
	local Point=FN_CountBuffLevel( Player , 622516 ) 

	if Check==false then
		SetSpeakDetail ( Player,"[SC_MUSIC_2012NE_14]")
	end
--	if Point==0 then	--1分
--		SetFlag( Player , 546500 , 1 )
--		Tell( Player , NPC , "[SC_MUSIC_2012NE_21]" )
--		ChangeZone( Player , 2 , -1 , 2569.9 , 26.0 , 194.5 , 9.5)		--DO
--	elseif Point==1 then	--2分
--		SetFlag( Player , 546500 , 1 )
--		Tell( Player , NPC , "[SC_MUSIC_2012NE_21]" )
--		ChangeZone( Player , 2 , -1 , 2705.1 , 69.8 , 1.4 , 83.9)		--RE
	if Point==2 then	--3分
		SetFlag( Player , 546500 , 1 )
		Tell( Player , NPC , "[SC_MUSIC_2012NE_21]" )
		ChangeZone( Player , 2 , -1 , 2626.8 , 81.8 , -91.2 , 62.1)		--MI
	elseif Point==3 then	--4分
		SetFlag( Player , 546500 , 1 )
		Tell( Player , NPC , "[SC_MUSIC_2012NE_21]" )
		ChangeZone( Player , 2 , -1 , 2667 , 86.7 , -159.0 , 90.9)		--FA
	elseif Point==4 then	--5分
		SetFlag( Player , 546500 , 1 )
		Tell( Player , NPC , "[SC_MUSIC_2012NE_21]" )
		ChangeZone( Player , 2 , -1 , 2504.4 , 118.0 , -354.1 , 132.5)		--SO
	else
		SetSpeakDetail ( Player,"[SC_MUSIC_2012NE_14]")
	end
end


function lua_nehelia_Music_elf3()	--小精靈飛3
	local Player=OwnerID()
	local NPC=TargetID()
	local CheckItem=CountBodyItem( Player , 202903 )

	if CheckItem==0 then
		SetSpeakDetail ( Player,"[SC_MUSIC_2012NE_14]")
	elseif CheckItem>=5 then
		ChangeZone( Player , 2 , -1 , -1301.8 , 55.0 , -5581.1 , 130.7)
	end
end


function lua_nehelia_Music_elf4()	--小精靈4
	local Player=OwnerID()
	local NPC=TargetID()
	SetSpeakDetail ( Player,"[SC_MUSIC_2012NE_17]")						--真是難搞，才這一點苦就不行了啊？
	AddSpeakOption( Player , NPC , "[SC_FAIRYTALE_2011_11]" , "lua_nehelia_Music_elf5", 0 )	--好的
end

function lua_nehelia_Music_elf5()	--小精靈5
	local Player=OwnerID()
	local NPC=TargetID()
	DelBodyItem( Player , 241362 , 1 )	--刪除任務琴
	GiveBodyItem( Player , 241363 , 1 )	--給予失敗琴
	CancelBuff ( Player , 622516 )
	CancelBuff ( Player , 622517 )
	CloseSpeak ( Player )
end

---------------------------------------------------------------
-----------------------------刪除琴---------------------------
function lua_nehelia_Music_obj1()
	local Player=OwnerID()
	local Talk=CheckFlag ( Player , 546501 )

	if Talk==false then
		ScriptMessage(Player,Player,1,"[SC_421696]",C_SYSTEM)	--任務失敗
		SetFlag( Player , 546497 , 0 )		--報名關閉
		SetFlag( Player , 546499 , 1 )		--完成開啟
		CancelBuff ( Player , 622516 )
		CancelBuff ( Player , 622517 )
		Closespeak( Player )
	else
		SetFlag( Player , 546497 , 0 )		--報名關閉
		SetFlag( Player , 546499 , 1 )		--完成開啟
		Closespeak( Player )			
	end

end

---------------------------------------------------------------
------------------------------電梯----------------------------
---------------------------------------------------------------

function lua_nehelia_MusicR1()	--TEST跑來跑去
	local Stone= OwnerID()	--阻礙
	local flag = 781134	--貓貓旗標
	local flagcount = 1	--第一隻貓貓旗標
	MoveToFlagEnabled(Stone,FALSE)

		while TRUE do
		LuaFunc_MoveToFlag( Stone,flag , flagcount , 0 )	--移動BALL到旗子的亂數一個，並且在亂數範圍內。
		flagcount = flagcount +1
			if flagcount > 2 then			--2個旗標來回意味，0不算	
				flagcount = 1
			end
			Sleep(10)
		end
end

function lua_nehelia_MusicR2()	--TEST跑來跑去
	local Stone= OwnerID()	--阻礙
	local flag = 781135	--貓貓旗標
	local flagcount = 1	--第一隻貓貓旗標
	MoveToFlagEnabled(Stone,FALSE)

		while TRUE do
		LuaFunc_MoveToFlag( Stone,flag , flagcount , 0 )	--移動BALL到旗子的亂數一個，並且在亂數範圍內。
		flagcount = flagcount +1
			if flagcount > 2 then			--3個旗標來回意味，0不算	
				flagcount = 1
			end
			Sleep(10)
		end
end

function lua_nehelia_MusicR3()	--TEST跑來跑去
	local Stone= OwnerID()	--阻礙
	local flag = 781136	--貓貓旗標
	local flagcount = 1	--第一隻貓貓旗標
	MoveToFlagEnabled(Stone,FALSE)

		while TRUE do
		LuaFunc_MoveToFlag( Stone,flag , flagcount , 0 )	--移動BALL到旗子的亂數一個，並且在亂數範圍內。
		flagcount = flagcount +1
			if flagcount > 5 then			--5個旗標來回意味，0不算	
				flagcount = 1
			end
			Sleep(10)
		end
end

function lua_nehelia_MusicR4()	--大阻擋跑來跑去
	local Stone= OwnerID()	--阻礙
	local flag = 781138	--貓貓旗標
	local flagcount = 1	--第一隻貓貓旗標
	MoveToFlagEnabled(Stone,FALSE)

		while TRUE do
		LuaFunc_MoveToFlag( Stone,flag , flagcount , 0 )	--移動BALL到旗子的亂數一個，並且在亂數範圍內。
		flagcount = flagcount +1
			if flagcount > 10 then			--11個旗標來回意味，0不算	
				flagcount = 1
			end
			Sleep(10)
		end
end


---------------------------------------------------------------
--------------階梯咻咻消失又出現----------------------------
---------------------------------------------------------------

function lua_nehelia_Music01()	--TEST出現又消失3秒版
	local Stairs= OwnerID()	--阻礙
	local Time=0
	local HID = 0		--開關

	SetModeEx( Stairs , EM_SetModeType_Gravity , false )			--重力
	SetModeEx( Stairs  , EM_SetModeType_Strikback, false )			--反擊
	SetModeEx( Stairs  , EM_SetModeType_SearchenemyIgnore, false )	--被搜尋
	SetModeEx( Stairs  , EM_SetModeType_Mark, false )			--標記
	SetModeEx( Stairs  , EM_SetModeType_Move, false )			--移動


	While TRUE do
		if time%3 == 0 then		--判定餘數=0，做10秒循環的開關
			if HID == 0 then	--當前物件存在，消失
				SetModeEx( Stairs, EM_SetModeType_Show, false )			--顯示
				SetModeEx( Stairs  , EM_SetModeType_Obstruct, false )			--阻擋
				CastsPell( Stairs , Stairs , 499361 )						--階梯施法震退玩家
				HID = 1
			elseif HID ~= 0 then	--當前物件消失，出現
				SetModeEx( Stairs, EM_SetModeType_Show, true )			--顯示
				SetModeEx( Stairs  , EM_SetModeType_Obstruct, true )			--阻擋
				HID = 0
			end
		end

		Time=Time+1
		Sleep(10)
	end
end

function lua_nehelia_Music02()	--TEST出現又消失10秒版
	local Stairs= OwnerID()	--阻礙
	local Time=0
	local HID = 0		--開關

	SetModeEx( Stairs , EM_SetModeType_Gravity , false )			--重力
	SetModeEx( Stairs  , EM_SetModeType_Strikback, false )			--反擊
	SetModeEx( Stairs  , EM_SetModeType_SearchenemyIgnore, false )	--被搜尋
	SetModeEx( Stairs  , EM_SetModeType_Mark, false )			--標記
	SetModeEx( Stairs  , EM_SetModeType_Move, false )			--移動

	While TRUE do
		if time%10 == 0 then		--判定餘數=0，做10秒循環的開關
			if HID == 0 then	--當前物件存在，消失
				SetModeEx( Stairs, EM_SetModeType_Show, false )			--顯示
				SetModeEx( Stairs  , EM_SetModeType_Obstruct, false )			--阻擋
				CastsPell( Stairs , Stairs , 499361 )						--階梯施法震退玩家
				HID = 1
			elseif HID ~= 0 then	--當前物件消失，出現
				SetModeEx( Stairs, EM_SetModeType_Show, true )			--顯示
				SetModeEx( Stairs  , EM_SetModeType_Obstruct, true )			--阻擋
				HID = 0
			end
		end

		Time=Time+1
		Sleep(10)
	end
end

function lua_nehelia_Music03()	--TEST出現又消失6秒版
	local Stairs= OwnerID()	--阻礙
	local Time=0
	local HID = 0		--開關

	SetModeEx( Stairs , EM_SetModeType_Gravity , false )			--重力
	SetModeEx( Stairs  , EM_SetModeType_Strikback, false )			--反擊
	SetModeEx( Stairs  , EM_SetModeType_SearchenemyIgnore, false )	--被搜尋
	SetModeEx( Stairs  , EM_SetModeType_Mark, false )			--標記
	SetModeEx( Stairs  , EM_SetModeType_Move, false )			--移動

	While TRUE do
		if time%6 == 0 then		--判定餘數=0，做10秒循環的開關
			if HID == 0 then	--當前物件存在，消失
				SetModeEx( Stairs, EM_SetModeType_Show, false )			--顯示
				SetModeEx( Stairs  , EM_SetModeType_Obstruct, false )			--阻擋
				CastsPell( Stairs , Stairs , 499361 )						--階梯施法震退玩家
				HID = 1
			elseif HID ~= 0 then	--當前物件消失，出現
				SetModeEx( Stairs, EM_SetModeType_Show, true )			--顯示
				SetModeEx( Stairs  , EM_SetModeType_Obstruct, true )			--阻擋
				HID = 0
			end
		end

		Time=Time+1
		Sleep(10)
	end
end


function lua_nehelia_Music04()	--TEST出現又消失4秒版
	local Stairs= OwnerID()	--阻礙
	local Time=0
	local HID = 0		--開關

	SetModeEx( Stairs , EM_SetModeType_Gravity , false )			--重力
	SetModeEx( Stairs  , EM_SetModeType_Strikback, false )			--反擊
	SetModeEx( Stairs  , EM_SetModeType_SearchenemyIgnore, false )	--被搜尋
	SetModeEx( Stairs  , EM_SetModeType_Mark, false )			--標記
	SetModeEx( Stairs  , EM_SetModeType_Move, false )			--移動

	While TRUE do
		if time%4 == 0 then		--判定餘數=0，做10秒循環的開關
			if HID == 0 then	--當前物件存在，消失
				SetModeEx( Stairs, EM_SetModeType_Show, false )			--顯示
				SetModeEx( Stairs  , EM_SetModeType_Obstruct, false )			--阻擋
				CastsPell( Stairs , Stairs , 499361 )						--階梯施法震退玩家
				HID = 1
			elseif HID ~= 0 then	--當前物件消失，出現
				SetModeEx( Stairs, EM_SetModeType_Show, true )			--顯示
				SetModeEx( Stairs  , EM_SetModeType_Obstruct, true )			--阻擋
				HID = 0
			end
		end

		Time=Time+1
		Sleep(10)
	end
end




--------------------------------------------
-----------------光球劇情-----------------
--------------------------------------------

--Do光球
----------
function lua_nehelia_Music_BallA()	--Do光球
	local Ball= OwnerID()		--阻礙
	SetPlot( Ball ,"range","lua_nehelia_Music_BallA1",15 )  
end

function lua_nehelia_Music_BallA1()
	local Player=OwnerID()
	local Flag=CheckFlag( Player , 546497 )
	if Flag==true then
		if CheckBuff( Player , 622516 )  == false then
			local pos = Lua_BuffPosSearch( Player, 622516 )
			local lv = BuffInfo( Player, pos , EM_BuffInfoType_Power )
			KORS_buffUpDown( Player , 622516 , 0 , 1 ) 	-- 0是加, 1是減,最後的數字是層級
		end
	end
end

--Re光球
----------
function lua_nehelia_Music_BallB()	--Re光球
	local Ball= OwnerID()		--阻礙
	SetPlot( Ball ,"range","lua_nehelia_Music_BallB1",15 )  
end

function lua_nehelia_Music_BallB1()
	local Player=OwnerID()
 	local Point=FN_CountBuffLevel( Player , 622516 ) 
	local Flag=CheckFlag( Player , 546497 )

	if Flag==true then
		if Point==0 then
			local pos = Lua_BuffPosSearch( Player, 622516 )
			local lv = BuffInfo( Player, pos , EM_BuffInfoType_Power )
			KORS_buffUpDown( Player , 622516 , 0 , 1 ) -- 0是加, 1是減,最後的數字是層級
--			AddBuff ( Player , 622516 , 0 , -1 )	
		end
	end
end

--Mi光球
----------
function lua_nehelia_Music_BallC()	--Mi光球
	local Ball= OwnerID()		--阻礙
	SetPlot( Ball ,"range","lua_nehelia_Music_BallC1",15 )  
end

function lua_nehelia_Music_BallC1()
	local Player=OwnerID()
 	local Point=FN_CountBuffLevel( Player , 622516 ) 
	local Flag=CheckFlag( Player , 546497 )

	if Flag==true then
		if Point==1 then
			local pos = Lua_BuffPosSearch( Player, 622516 )
			local lv = BuffInfo( Player, pos , EM_BuffInfoType_Power )
			KORS_buffUpDown( Player , 622516 , 0 , 1 ) -- 0是加, 1是減,最後的數字是層級
--			AddBuff ( Player , 622516 , 0 , -1 )	
		end
	end
end


--Fa光球
----------
function lua_nehelia_Music_BallD()	--Fa光球
	local Ball= OwnerID()		--阻礙
	SetPlot( Ball ,"range","lua_nehelia_Music_BallD1",15 )  
end

function lua_nehelia_Music_BallD1()
	local Player=OwnerID()
 	local Point=FN_CountBuffLevel( Player , 622516 ) 
	local Flag=CheckFlag( Player , 546497 )

	if Flag==true then
		if Point==2 then
			local pos = Lua_BuffPosSearch( Player, 622516 )
			local lv = BuffInfo( Player, pos , EM_BuffInfoType_Power )
			KORS_buffUpDown( Player , 622516 , 0 , 1 ) -- 0是加, 1是減,最後的數字是層級
--			AddBuff ( Player , 622516 , 0 , -1 )	
		end
	end
end


--So光球
----------
function lua_nehelia_Music_BallE()	--So光球
	local Ball= OwnerID()		--阻礙
	SetPlot( Ball ,"range","lua_nehelia_Music_BallE1",15 )  
end

function lua_nehelia_Music_BallE1()
	local Player=OwnerID()
 	local Point=FN_CountBuffLevel( Player , 622516 ) 
	local Flag=CheckFlag( Player , 546497 )

	if Flag==true then
		if Point==3 then
			local pos = Lua_BuffPosSearch( Player, 622516 )
			local lv = BuffInfo( Player, pos , EM_BuffInfoType_Power )
			KORS_buffUpDown( Player , 622516 , 0 , 1 ) -- 0是加, 1是減,最後的數字是層級
--			AddBuff ( Player , 622516 , 0 , -1 )	
		end
	end
end

--La光球
----------
function lua_nehelia_Music_BallF()	--La光球
	local Ball= OwnerID()		--阻礙
	SetPlot( Ball ,"range","lua_nehelia_Music_BallF1",15 )  
end

function lua_nehelia_Music_BallF1()
	local Player=OwnerID()
	local Check=CheckBuff( Player , 622517 )
	local Flag=CheckFlag( Player , 546497 )

	if Flag==true then
		if Check==false then
		AddBuff ( Player , 622517 , 0 , -1 )	
		end
	end
end


----------------------------------------------------------------------------------
------------------以下為測試用--------------------------------------------------
----------------------------------------------------------------------------------

function lua_nehelia_Music_Ball01()	--光球觸碰給Buff劇情
	local Ball= OwnerID()		--阻礙
	SetPlot( Ball ,"range","lua_nehelia_Music_Ball02",15 )  
end


function lua_nehelia_Music_Ball02()
	local Player=OwnerID()
	AddBuff ( Player , 622442 , 0 , -1 )
end

function lua_nehelia_MusicBall03()	--TEST跑來跑去
	local Stone= OwnerID()	--阻礙
	local flag = 781113	--貓貓旗標
	local flagcount = 1	--第一隻貓貓旗標
	MoveToFlagEnabled(Stone,FALSE)

		while TRUE do
		LuaFunc_MoveToFlag( Stone,flag , flagcount , 0 )	--移動BALL到旗子的亂數一個，並且在亂數範圍內。
		flagcount = flagcount +1
			if flagcount > 5 then			--5個旗標來回意味	
				flagcount = 1
			end
			Sleep(10)
		end
end


function lua_nehelia_MusicBall04()
	local Player=OwnerID()
	local Stone=120721
	CastsPell( Stone , Stone , 499361 )						--階梯施法震退玩家
end

