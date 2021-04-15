function LuaS_111256_0()
	local Area = LuaS_111256_ZoneID( ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID ) )
	local Flag = {[1] = 541313 ,[2] = 541314 , [3] = 542297 , [4] = 541315 ,[5] = 541316 ,[6] = 541317 ,[7]=542498, [8] = 542744 ,[9] = 542997 , [10] = 541318 ,[11] = 541319 , [12] = 542557, [31]=546255 }
	if Area > 99 or Area < 1 then
		LoadQuestOption( OwnerID() )		
	else
		SetSpeakDetail( OwnerID() , GetString("SC_111256_0") )--呼～小子，你想做什麼快說；我，可是很沒耐心的。
		if CheckFlag( OwnerID() , Flag[Area] ) == false then
			SetFlag( OwnerID() , Flag[Area] , 1)
			ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_111256_OT"), C_SYSTEM );
		end
		if CheckFlag( OwnerID()  , 540001 ) == false then
			SetFlag( OwnerID()  , 540001 , 1 )
		end
		--2012/09/17新增解決流浪在外的矮人身上沒有回家旗標時，用阿狗給回家旗標。
		local Race = ReadRoleValue( OwnerID(), EM_RoleValue_RACE ) 
		local goHomeFlag = CheckFlag( OwnerID()  , 546255 ) 
		if Race == 2 and goHomeFlag == false then
			SetFlag( OwnerID()  , 546255, 1 )
		end
		--2012/09/17 end
		AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SC_111256_Q") , "LuaS_111256_Q", 0 ); --傳送是什麼？
		AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SC_111256_S") , "LuaS_111256_S", 0 ); --我要將回程術地點登記於此
		if CheckBuff( OwnerID() , 501638 ) == false then
			LuaS_Area_List(Area,Flag)
		end
	end
	--2012/09/04，為解決zone2項目條爆炸問題，重新切分了zone2的區域，將較少傳送的區域加入下一頁,LuaS_111256_Additional
	--這個只是暫時解決zone2的部份，將來如果還要新增區域，請加入下一頁之中，或重新寫作這個script
	--此暫時用版本回修至5.0.0	以上 by 阿準
	if Area == 2 then
		if 	CheckFlag( OwnerID() , Flag[3] ) == true or
			CheckFlag( OwnerID() , Flag[4] ) == true or
			CheckFlag( OwnerID() , Flag[12] ) == true then
			AddSpeakOption( OwnerID(), TargetID(),  "[SC_205764_2]" ,"LuaS_111256_Additional", 0 ); --下一頁
		end
	end
end
--2012/09/04，為解決zone2項目條爆炸問題，重新切分了zone2的區域，將較少傳送的區域加入下一頁,LuaS_111256_Additional
--這個只是暫時解決zone2的部份，將來如果還要新增區域，請加入下一頁之中，或重新寫作這個script
--此暫時用版本回修至5.0.0
function LuaS_111256_Additional()
	local Flag = {[3] = 542297 , [4] = 541315 , [12] = 542557 }
		SetSpeakDetail( OwnerID() , GetString("SC_111256_0") )--呼～小子，你想做什麼快說；我，可是很沒耐心的。
		if CheckFlag( OwnerID() , Flag[4] ) == true then
			AddSpeakOption( OwnerID(), TargetID(), GetString ( "SC_111256_4") , "LuaS_111256_4", 0 ); --傳送到銀瀑村
		end
		if CheckFlag( OwnerID() , Flag[3] ) == true then
			AddSpeakOption( OwnerID(), TargetID(), GetString ( "SC_111256_3") , "LuaS_111256_3", 0 ); --傳送到廢棄城寨
		end
		if CheckFlag( OwnerID() , Flag[12] ) == true then
			AddSpeakOption( OwnerID(), TargetID(),  "[SC_111256_12]"  , "LuaS_111256_12", 0 ); --傳送到遠行之點
		end
		AddSpeakOption( OwnerID(), TargetID(),  "[SO_110068_2]" ,"LuaS_111256_0", 0 ); --返回上一頁
end
--2012/09/04 end by 準
function LuaS_118586_0()
	LoadQuestOption(OwnerID())
	if CheckFlag( OwnerID() , 541314 ) == true then
		AddSpeakOption( OwnerID(), TargetID(), GetString ( "SC_111256_2") , "LuaS_111256_2", 0 ); --傳送到凡瑞娜絲城
	end
	if CheckBuff( OwnerID() , 501638 ) == false then
		AddSpeakOption( OwnerID(), TargetID(), GetString ( "SC_111256_10") , "LuaS_111256_10", 0 ); --傳送到艾爾恩商隊
		AddSpeakOption( OwnerID(), TargetID(), GetString ( "SC_111256_6") , "LuaS_111256_6", 0 ); --傳送到黑曜石要塞
	end
end
function LuaS_111256_Q()

	SetSpeakDetail( OwnerID(), GetString("SC_111256_QD"));
	--你想知道老子是做啥的？
	--呼～我啊，是艾力克研究團的傳送師；名字...已經不重要了。
	--
	--你只要知道你很幸運，艾力克研究團允許你使用我們的傳送裝置，這個寶貝啊～只要你知道其他裝置的位置，它就可以讓你傳送到鄰近的同類型裝置。
	--不過因為每次使用會耗費一定的魔力，所以我們只限定特定人士可以使用，而且必須付費來平衡我們的支出；我，就是負責把關、收費、操縱的人。
	--小子，像你們這種常常跑來跑去的冒險者能夠被允許使用這個寶貝，要心懷感激！知道嗎？
	--
	--呼～還有，你知道回程術嗎？艾力克研究團就是因為你天生擁有這樣的力量所以才會允許你使用我們的傳送裝置。
	--...雖然很麻煩，但我還是說明一下好了。
	--回程術可以使你回到你魔力紀錄的地點，但一個人的魔力只能記錄在一個地方；而要紀錄必須找到有某個特殊技能的人；
	--再次的，你要感激，因為我就有這種技術。
	--
	--不過有件事讓我很不爽，我為什麼得免費提供這項服務...呼～算了，總之這些技術是很珍貴的，你要珍惜著使用啊！

	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACKTALK") , "LuaS_111256_0", 0 ); 	--我想回到剛剛的對話

end

function LuaS_111256_S()

	local Area = LuaS_111256_ZoneID( ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID ) )

	if Area > 99 or Area < 1 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SYS_TOUCH_TARGET_TOFAR]" , 0 )
		CloseSpeak( OwnerID() );
		return
	end
	if GetDistance( OwnerID() , TargetID() ) > 50 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SYS_TOUCH_TARGET_TOFAR]" , 0 )
		CloseSpeak( OwnerID() );
		return
	end
	local Point = {[1] = "ST_TRANSFER_2" , [2] = "ST_TRANSFER_9" , [3] = "ST_TRANSFER_13", [4] = "ST_TRANSFER_4" , [5] = "ST_TRANSFER_5" , [6] = "ST_TRANSFER_10" , [7] = "ST_TRANSFER_14" , [8] = "ST_TRANSFER_16" ,[9] = "ST_TRANSFER_17" , [10] = "ST_TRANSFER_11" ,[11] = "ST_TRANSFER_12" , [12] = "ST_TRANSFER_15" }
	local SHP = SaveHomePoint( OwnerID() );
	if (SHP == true) then

		if CheckAcceptQuest( OwnerID() , 420664 ) == true then	-- for 新手導引任務
			SetFlag( OwnerID() , 540866 , 1 )	-- 做完回程地點登記
		end

		CastSpell( OwnerID() , OwnerID() , 491008 )
		ScriptMessage( OwnerID(), OwnerID(), 2, GetString(Point[Area])  , C_SYSTEM )	--畫面中間訊息：您將回程地點登記在開墾聚落！
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString(Point[Area]) , 0 )	--您將回程地點登記在開墾聚落！
	else
		ScriptMessage( OwnerID(), OwnerID(), 2, GetString("ST_TRANSFER_FAIL")  , C_SYSTEM )	--畫面中間訊息：回程地點登記失敗！
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_TRANSFER_FAIL") , 0 )	--回程地點登記失敗！
	end

	CloseSpeak( OwnerID() );	--關閉對話視窗

end

function LuaI_111272_0()
	SetPlot(OwnerID() , "Range" , "LuaI_111272_1" , 20 )
end
function LuaI_111272_1()
	local n = 0
	local DialogStatus = 0
	local Area = LuaS_111256_ZoneID( ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID ) )
	local Flag = {[1] = 541313 ,[2] = 541314 , [3] = 542297 , [4] = 541315 ,[5] = 541316 ,[6] = 541317 ,[7]=542498, [8] = 542744 ,[9] = 542997 , [10] = 541318 ,[11] = 541319 , [12] = 542557 }
	if CheckFlag( OwnerID() , Flag[Area] ) == false then
		SetFlag( OwnerID() , Flag[Area] , 1)
	end
	if CheckBuff( OwnerID() , 501570) == false then  --增加檢查判斷

		DialogCreate( OwnerID(), EM_LuaDialogType_Select , "Go TO Where ?" )
		local ResultGO = LuaS_Area_ListDialog(Area,Flag)
		AddBuff(OwnerID() , 501570,0,-1);--然後給予BUFF

		if( DialogSendOpen(OwnerID() ) == false ) then 
			ScriptMessage(OwnerID() ,OwnerID() , 1 , GetString("SYS_FIXEQ_DATA_ERROR") , 0 )	--資料送出有問題
			return 0
		end

		while 1 do
			sleep( 1 )
			n = n + 1
			DialogStatus = DialogGetResult( OwnerID() )
			if n > 300 then -- 防無窮迴圈，300 = 三十秒
				DialogClose( OwnerID() )
				CancelBuff( OwnerID(), 501570 );--最後清除BUFF
				break
			end
			
			if ( DialogStatus == 0 ) or ( DialogStatus == -1 ) then
				DialogClose( OwnerID() )
				CancelBuff( OwnerID(), 501570 );--最後清除BUFF

				break
			elseif ( DialogStatus ~= -2 ) then
				--DialogStatus = DialogStatus + 1
				DialogClose(OwnerID() )
				CancelBuff( OwnerID(), 501570 );--最後清除BUFF
				BeginPlot(OwnerID() , ResultGO[DialogStatus] , 0)
				break
			end
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	end
end

function LuaS_111272_Close()
	--NO Action
	DialogClose(OwnerID() )
	CancelBuff( OwnerID(), 501570 );--最後清除BUFF
end