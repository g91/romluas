function LuaS_Z21_DragonMeeting_SetSpeak()--巨龍會議
	local T_ID = TargetID() --摩瑞克
	local O_ID = OwnerID() --玩家
	local QuestID = 424203				--任務編號
	local FinishFlagID = 545466			--完成任務獲得的旗標	

	if CheckAcceptQuest( O_ID, QuestID ) == true and ReadRoleValue( T_ID, EM_RoleValue_Register1 ) > 0 then --檢查玩家是否有任務 並且現在是否正在演戲
		SetSpeakDetail( O_ID, "[SC_422693_7]" ) --請稍等我一下。   (正在演戲情況下 給予告知)
	elseif CheckAcceptQuest( O_ID, QuestID ) == true and CheckFlag( O_ID, FinishFlagID ) == false  then
		SetSpeakDetail( O_ID, "[SC_422161_22]" ) --你準備好了嗎？ (可以演戲情況下 給予告知)
		AddSpeakOption( O_ID, T_ID, "[SC_111796_0]", "LuaS_Z21_DragonMeeting",0) --我準備好了。 (玩家確定要開始演戲)
	else
		LoadQuestOption( O_ID )
	end
end

function LuaS_Z21_DragonMeeting()--開始演
	local T_ID = TargetID() --摩瑞克
	local O_ID = OwnerID() --玩家
	CloseSpeak( OwnerID() )--關閉對話視窗
	
	WriteRoleValue( T_ID, EM_RoleValue_Register1, 1 )--上鎖 表示正在演戲
	BeginPlot( T_ID, "LuaS_Z21_DragonMeeting_Start", 0 )--執行演戲
end

function LuaS_Z21_DragonMeeting_Start()--開始演
	local Ctrl = OwnerID()				
	local QuestID = 424203				--任務編號
	local FinishFlagID = 545466			--完成任務獲得的旗標
	local CheckBuffID = 620664			--檢查是否正在演戲的BUFF
	local CheckRange = 400				--演戲的檢查範圍
	local ActorArray = {}				--(新版修改)演員陣列表
	
	local FlagID = 781003				--旗標ID
	-- 事先把所有會用到的演原產生出來 可以不AddToPartition(只需要GUID)
	ActorArray[1] = CreateObjByFlag( 119006, FlagID, 1, 1 ) --摩瑞克(B1)
	ActorArray[2] = CreateObjByFlag( 119007, FlagID, 2, 1 ) --洛迦恩斯(A1)
	ActorArray[3] = CreateObjByFlag( 119008, FlagID, 3, 1 ) --火龍之王(C1)
	ActorArray[4] = CreateObjByFlag( 119009, FlagID, 4, 1 ) --冰龍卡德摩斯(D1)
	ActorArray[5] = CreateObjByFlag( 119398, FlagID, 5, 1 ) --地龍之后(E1) 龍型
	
	ActorArray[6] = CreateObjByFlag( 119010, FlagID, 6, 1 ) --地龍之后(E1) 人型
	ActorArray[7] = CreateObjByFlag( 119399, FlagID, 7, 1 ) --火龍之王(C1) 龍型
	ActorArray[8] = CreateObjByFlag( 119483, FlagID, 8, 1 ) --冰龍卡德摩斯(D1) 龍型

	for i=1, 8 do
		ks_ActSetMode( ActorArray[i], true )
		if i < 6 then
			AddToPartition( ActorArray[i], 0 )
		end
	end
	--AddBuff( ActorArray[5], 620722, 0, -1 )--龍后人型
	SetPos( ActorArray[5], ReadRoleValue( ActorArray[5], EM_RoleValue_X ), ReadRoleValue( ActorArray[5], EM_RoleValue_Y )+900, ReadRoleValue( ActorArray[5], EM_RoleValue_Z ), ReadRoleValue( ActorArray[5], EM_RoleValue_Dir ) )
	WriteRoleValue( ActorArray[5], EM_RoleValue_IsWalk, 0 )
	
	ks_AddBuffEx( QuestID, FinishFlagID, CheckBuffID, 150 )--給予任務用BUFF
	KS_QuestSetPos( QuestID, CheckBuffID, 170, ActorArray[1], 50 )--演戲用的轉場傳送
	
	Sleep(30)
	CallPlot( ActorArray[1], "ks_QuestCheckEx", QuestID, FinishFlagID, CheckBuffID, CheckRange, ActorArray, Ctrl  )--範圍看戲用的檢查函式
	
	--演戲中
	LuaS_Z21_DragonMeeting_Message( ActorArray[1], CheckRange, CheckBuffID, "[SC_Z21_424290_1]" )--中央訊息：一陣強烈的風壓襲來，巨大的黑影出現在空中......
	SetModeEx( ActorArray[5], EM_SetModeType_Gravity, false )
	SetDefIdleMotion( ActorArray[5], ruFUSION_MIME_SPIRAL_LOOP)
	PlayMotionEX( ActorArray[5], ruFUSION_ACTORSTATE_SPIRAL_LOOP , ruFUSION_ACTORSTATE_SPIRAL_LOOP)
	AddBuff( ActorArray[5], 506984, 9, -1 )--加速
	Sleep(10)
	KS_Move( ActorArray[5], 0, FlagID, 6 )--移動
	
	local X2 = GetMoveFlagValue( FlagID , 6 , EM_RoleValue_X )
	local Y2 = GetMoveFlagValue( FlagID , 6 , EM_RoleValue_Y )
	local Z2 = GetMoveFlagValue( FlagID , 6 , EM_RoleValue_Z )
	while true do
		Sleep(15)
		local X1 = ReadRoleValue( ActorArray[5] , EM_RoleValue_X )
	 	local Z1 = ReadRoleValue( ActorArray[5] , EM_RoleValue_Z )
		local DisX = ( X2 - X1 )^2
		local DisZ = ( Z2 - Z1 )^2
		local Dis = math.floor( (DisX+DisZ)^0.5)
		if Dis < 150 then	-- 走到定點設定下一點位置
			break
		end
	end
	
	PlayMotion( ActorArray[5], ruFUSION_ACTORSTATE_FLY_END)
	SetDefIdleMotion( ActorArray[5], ruFUSION_MIME_IDLE_STAND )
	--SetModeEx( ActorArray[5], EM_SetModeType_Gravity, true )
	sleep(20)
	StopMove( ActorArray[5], true )
	SetPos( ActorArray[5], X2, Y2+900, Z2, 0 )
	DelObj( ActorArray[5] )
	Sleep(5)
	AddToPartition( ActorArray[6], 0 )
	AdjustFaceDir( ActorArray[6], ActorArray[3], 0 )
	
	Yell( ActorArray[6], "[SC_Z21_424290_2]", 3 )--地龍之后(E2)：為什麼卡德摩斯會在這裡？
	Sleep(20)
	Yell( ActorArray[3], "[SC_Z21_424290_3]", 3 )--火龍之王(C1)：是我提議的。既然召開會議，就連艾伊那藍的死一起討論吧。
	Sleep(25)	
	Yell( ActorArray[6], "[SC_Z21_424290_4]", 3 )--地龍之后(E2)：何需商議！卡德摩斯違反禁令殺死同族，必須付出代價！
	PlayMotion( ActorArray[6], ruFUSION_ACTORSTATE_EMOTE_ANGRY )--憤怒
	Sleep(25)
	Yell( ActorArray[4], "[SC_Z21_424290_5]", 3 )--卡德摩斯(D1)：這說不過去！我原本要殺的是那個混血的雜種，誤殺艾伊那藍只是誤會…
	PlayMotion( ActorArray[4], ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )--搖頭
	Sleep(35)
	Yell( ActorArray[6], "[SC_Z21_424290_6]", 3 )--地龍之后(E2)：荒謬！即使這樣也是同罪，遠古巨龍會議早已承認摩瑞克同為真龍的一份子！
	PlayMotion( ActorArray[6], ruFUSION_ACTORSTATE_EMOTE_ANGRY )--憤怒
	Sleep(30)
	Yell( ActorArray[3], "[SC_Z21_424290_7]", 3 )--火龍之王(C1)：那是在他對真龍一族絕對忠誠的前提之下，但是有消息說他和其他的混血往來甚密…
	PlayMotion( ActorArray[3], ruFUSION_ACTORSTATE_EMOTE_SPEAK )--說話
	Sleep(35)
	--(中央黃字訊息)洛迦恩斯：各位先冷靜一下，我們現在有更嚴重的事要面對，有人正計畫要釋放元素領主…
	LuaS_Z21_DragonMeeting_Message( ActorArray[1], CheckRange, CheckBuffID, "[SC_Z21_424290_8]" )
	Sleep(25)
	Yell( ActorArray[3], "[SC_Z21_424290_9]", 3 )--火龍之王(C1)：正是如此！元素領主的消息是完全保密的，要怎麼確定不是摩瑞克把消息告訴外人？
	PlayMotion( ActorArray[3], ruFUSION_ACTORSTATE_EMOTE_POINT )--指向
	Sleep(30)
	Yell( ActorArray[6], "[SC_Z21_424290_10]", 3 )--地龍之后(E2)：什麼！你竟然…
	Sleep(20)
	LuaS_Z21_DragonMeeting_Message( ActorArray[1], CheckRange, CheckBuffID, "[SC_Z21_424290_11]" )--(中央黃字訊息)洛迦恩斯：夠了！這樣的爭執要持續到什麼時候！
	Sleep(25)
	Yell( ActorArray[3], "[SC_Z21_424290_12]", 3 )--火龍之王(C1)：火龍一族不可能和有嫌疑的對象一起合作！既是這樣，我們會自己找到那些狂妄之徒，將他們化為灰燼！
	PlayMotion( ActorArray[3], ruFUSION_ACTORSTATE_EMOTE_ANGRY )--憤怒
	Sleep(20)
	
	KS_Move( ActorArray[3], 0, FlagID, 7 )--火龍之王(c1)離開
	KS_Move( ActorArray[4], 0, FlagID, 8 )--卡德摩斯(d1)離開
	
	local site = { 7, 8 }
	while true do
		Sleep(10)
		local isOK = 0
		for i=1, 2 do
			if CheckID( ActorArray[i+2] ) then
				local X1 = ReadRoleValue( ActorArray[i+2] , EM_RoleValue_X )
		 		local Z1 = ReadRoleValue( ActorArray[i+2] , EM_RoleValue_Z )
		 		local X2 = GetMoveFlagValue( FlagID , site[i] , EM_RoleValue_X )
		 		local Z2 = GetMoveFlagValue( FlagID , site[i] , EM_RoleValue_Z )
				local DisX = ( X2 - X1 )^2
				local DisZ = ( Z2 - Z1 )^2
				if math.floor( (DisX+DisZ)^0.5) < 40 then
					StopMove( ActorArray[i+2], true )
					SetPos( ActorArray[i+2], X2, ReadRoleValue( ActorArray[i+2] , EM_RoleValue_Y )+500, Z2, 0 )
					-- 走到定點設定下一點位置
					DelObj( ActorArray[i+2])
					AddToPartition( ActorArray[i+6], 0 )
					--AddBuff( ActorArray[i+2], 620722+i, 0, -1 )--火龍龍型/卡德摩斯龍型
					CallPlot( ActorArray[i+6], "LuaS_Z21_DragonMeeting_Fly", FlagID , site[i]+2 )
				end
			else
				isOK = isOK+1
			end
		end
		if isOK >= 2 then
			break
		end
	end
	sleep(70)
	
	--戲演完了
	ks_QuestEndEx( QuestID, FinishFlagID, CheckBuffID, CheckRange, ActorArray, ActorArray[1] ) -- 給予旗標\物品
end

function LuaS_Z21_DragonMeeting_Message( Sayer, CheckRange, CheckBuffID, Msg )
	local player = SearchRangePlayer( Sayer, CheckRange )
	for i= 0, #player do
		if CheckBuff(player[i] , CheckBuffID ) then
			ScriptMessage( Sayer, player[i], 1 , Msg, "0xffffff80" )--中央訊息：一陣強烈的風壓襲來，巨大的黑影出現在空中......
			ScriptMessage( Sayer, player[i], 0 , Msg, "0xffffff80" )--中央訊息：一陣強烈的風壓襲來，巨大的黑影出現在空中......
		end
	end
end

function LuaS_Z21_DragonMeeting_Fly( FlagID, site )
	local Obj =OwnerID()
	--SetModeEx( Obj, EM_SetModeType_Drag, false )
	SetModeEx( Obj, EM_SetModeType_Gravity, false )
	WriteRoleValue( Obj, EM_RoleValue_IsWalk, 0 )
	PlayMotionEX( Obj, ruFUSION_ACTORSTATE_FLY_LOOP , ruFUSION_ACTORSTATE_FLY_LOOP)
	PlayMotion( Obj, ruFUSION_ACTORSTATE_FLY_BEGIN)
	SetDefIdleMotion( Obj, ruFUSION_MIME_SPIRAL_LOOP)
	AddBuff( Obj, 506984, 9, -1 )--加速
	Sleep(20)
	local X = GetMoveFlagValue( FlagID , site , EM_RoleValue_X )
	local Y = GetMoveFlagValue( FlagID , site , EM_RoleValue_Y )
	local Z = GetMoveFlagValue( FlagID , site , EM_RoleValue_Z )
	PlayMotionEX( Obj, ruFUSION_ACTORSTATE_SPIRAL_LOOP , ruFUSION_ACTORSTATE_SPIRAL_LOOP)				
	--SetDefIdleMotion( ActorArray[i+2], ruFUSION_MIME_SPIRAL_LOOP )
	MoveDirect( Obj, X, Y+900, Z )
end