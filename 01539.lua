function Lua_Hao_BeerDDR_Action() --對話視窗
	SetSpeakDetail( OwnerID(), "[SC_BEERDAY_35]"   ) -- 
	PlayMotion( TargetID(), ruFUSION_ACTORSTATE_EMOTE_DRINK ) --
	AddSpeakOption( OwnerID(), TargetID(), "[SC_BEERDAY_05]" , "Lua_Hao_BeerDDR_AboutRules", 0 ) -- 關於啤酒大賽
	AddSpeakOption( OwnerID(), TargetID(), "[SC_BEERDAY_12]" , "Lua_Hao_BeerDDR_GetReady", 0 ) -- 參加
--	AddSpeakOption( OwnerID(), TargetID(), "[SC_BEERDAY_36]" , "Lua_Hao_BeerDDR_Close", 0 ) --  不要
end
--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_BeerDDR_AboutRules() -- 選擇關於遊戲規則
	SetSpeakDetail( OwnerID(), "[SC_BEERDAY_ACT03C]"   ) 
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "Lua_Hao_BeerDDR_Action", 0 ) --回到上一層
end
--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_BeerDDR_GetReady() -- 判定玩家是否有接 一日服務生 這個任務。
		local today= CheckFlag(OwnerID()  , 543322) -- 今天參加過

		if CheckBuff( OwnerID() , 504627  ) == true then
			CloseSpeak( OwnerID() )  
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BEERDAY_59]" , C_SYSTEM )  -- 你無法同時參與兩個啤酒節活動
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_59]" , C_SYSTEM )  -- 你無法同時參與兩個啤酒節活動
		elseif CheckBuff( OwnerID() ,504656  ) == true then
			CloseSpeak( OwnerID() )  
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BEERDAY_60]" , C_SYSTEM )  -- 這個活動已在進行中
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_60]" , C_SYSTEM )  -- 這個活動已在進行中
		elseif today == true then
			SetSpeakDetail( OwnerID(), "[SC_BEERDAY_13]"   )  --你今天已經參加過了
			AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "Lua_Hao_BeerDDR_Action", 0 ) --回到上一層
		else
			CloseSpeak( OwnerID() )  
			WriteRoleValue( OwnerID() , EM_RoleValue_Register+7 , TargetID() ) --讓玩家記住茱莉亞‧葛倫
			Beginplot( OwnerID() , "Lua_Hao_BeerDDR_Give_Buff" , 0  )
		end
end
--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_BeerDDR_Give_Buff() --啤酒大師給予Buff   -- OwnerID 玩家  --TargetID 任務NPC

	-- 2012.08.22 新增查詢 DesignLog
	DesignLog( OwnerID() , 111667 , "Accept" )
	--
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID ) -- 讀取玩家room值
	local Obj = Role:new( OwnerID() )  -- 取得玩家 X.Y.Z.Dir值
	local BaseX = Obj :X()
 	local BaseY = Obj :Y();
 	local BaseZ = Obj :Z();
	local BaseDir = Obj:Dir();
	local NPC = CreateObj( 113105, BaseX, BaseY, BaseZ, BaseDir, 1 ) --在玩家座標 X.Y.Z.Dir 身上準備創立物件
	SetModeEx( NPC, EM_SetModeType_Strikback, false )--反擊
	SetModeEx( NPC, EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( NPC, EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( NPC, EM_SetModeType_Mark, false )--標記
	SetModeEx( NPC, EM_SetModeType_Move, false )--移動
	SetModeEx( NPC, EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( NPC, EM_SetModeType_HideName, false )--名稱
	SetModeEx( NPC, EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( NPC, EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( NPC, EM_SetModeType_Drag , false )--阻力
	SetModeEx( NPC, EM_SetModeType_Show, false )--顯示
	AddToPartition( NPC , RoomID) -- 建立物件
	BeginPlot ( NPC , "Lua_Hao_DelNPC" , 0 )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+9 , NPC ) --讓玩家記住隱藏物件
	WriteRoleValue( NPC , EM_RoleValue_Register+8 , OwnerID() ) --讓隱藏物件記住玩家
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register+5 , 1 ) --將玩家身上 Register+5 設定為 1
	AddBuff( OwnerID() ,504796 , 1, -1)  --定身
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BEERDAY_52]" , C_SYSTEM ) --你正專注的思考如何答題，似乎忘卻了移動...
	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_52]" , C_SYSTEM ) --你正專注的思考如何答題，似乎忘卻了移動...
	--提示玩家
--	ScriptMessage( OwnerID() , OwnerID() , 0 , "5" , 0 ) --對話視窗
	ScriptMessage( OwnerID() , OwnerID() , 1 , "5" , C_SYSTEM ) --畫面中間
	sleep(10)
--	ScriptMessage( OwnerID() , OwnerID() , 0 , "4" , 0 ) --對話視窗
	ScriptMessage( OwnerID() , OwnerID() , 1 , "4" , C_SYSTEM ) --畫面中間
	sleep(10)
--	ScriptMessage( OwnerID() , OwnerID() , 0 , "3" , 0 ) --對話視窗
	ScriptMessage( OwnerID() , OwnerID() , 1 , "3" , 0 ) --畫面中間
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BEERDAY_58]" , C_SYSTEM  ) --請在計時內，根據提出的問題，點選提供的按鈕作答。答題正確將加 1 點分數，答題錯誤則扣 2 點分數。
	sleep(10)
--	ScriptMessage( OwnerID() , OwnerID() , 0 , "2" , 0 ) --對話視窗
	ScriptMessage( OwnerID() , OwnerID() , 1 , "2" , 0 ) --畫面中間
	sleep(10)
	ScriptMessage( OwnerID() , OwnerID() , 0 , GetString("SC_BEERDAY_51") , C_SYSTEM ) -- <CS>請注意：如果遊戲進行中按下放棄按鈕，將不能取得獎勵。</CS>
--	ScriptMessage( OwnerID() , OwnerID() , 0 , "1" , 0 ) --對話視窗
	ScriptMessage( OwnerID() , OwnerID() , 1 , "1" , 0 ) --畫面中間
	sleep(10)
	AddBuff( OwnerID() ,504656 , 1, -1)
	sleep(1)
	AddBuff( OwnerID() ,504657 , 1, -1)
	sleep(1)
	AddBuff( OwnerID() ,504658 , 1, -1)
	sleep(1)
	AddBuff( OwnerID() ,504659 , 1, -1)
	sleep(1)
	AddBuff( OwnerID() ,504660 , 1, -1)
	sleep(1)
	ScriptMessage( OwnerID() ,  OwnerID() , 0 , "[SC_BEERDAY_16]" , C_SYSTEM ) -- 遊戲開始
	ScriptMessage( OwnerID() ,  OwnerID() , 1 , "[SC_BEERDAY_16]" , C_SYSTEM )  
	sleep(1)
	ClockOpen( OwnerID() ,EM_ClockCheckValue_8,60,60,0,"Lua_Hao_BeerDDR_Buff_ClockClose3","Lua_Hao_BeerDDR_Buff_ClockClose") --倒數計時器  (後面的兩個呼叫函式： "換區消失"，"時間到時呼叫函式")
--	ScriptMessage( OwnerID() , OwnerID() , 0 , "GO" , 0 ) --對話視窗
--	ScriptMessage( OwnerID() , OwnerID() , 1 , "GO" , 0 ) --畫面中間
	BeginPlot ( OwnerID() , "Lua_Hao_BeerDDR_Start" , 0 )
end
----------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_BeerDDR_Start() --出題

	SetFlag ( OwnerID(), 543322, 1 ) -- 判斷玩家旗標
--	local Player = ReadRoleValue( NPC , EM_RoleValue_Register+8 ) --讓NPC 知道 Register+8 為玩家
	local NPC = ReadRoleValue( OwnerID() , EM_RoleValue_Register+9 ) --讓玩家知道 Register+9 為NPC
	local LastAnswer = ReadRoleValue( NPC , EM_RoleValue_Register+2 ) --讓NPC知道 Register+2 為LastAnswer
--------------------------------------------------------------------------------------------------------------------------------------------
	SetSmallGameMenuType( OwnerID() , 2 , 1 ) --開啟介面 
	local Score = ReadRoleValue( OwnerID() , EM_RoleValue_Register+4 )
--	SetSmallGameMenuStr( OwnerID() , 2 , 1 , "Beer Day" ) -- Change Stage((++)) 關卡
	SetSmallGameMenuStr( OwnerID() , 2 , 1 , "[SC_BEERDAY_45]" ) -- Change Stage((++)) 關卡
--	SetSmallGameMenuStr( OwnerID(), 2 , 2 , Score ) -- Change grade (++String數字"))  數字
	SetSmallGameMenuStr( OwnerID() , 2 , 2 , "[SC_BEERDAY_49][$SETVAR1="..Score.."]"  ) -- Change grade (++String數字"))  數字
--	Say( OwnerID() , "Score=" ..Score )
--------------------------------------------------------------------------------------------------------------------------------------------
	local X = Rand(4) + 1

			if ( LastAnswer == X ) and ( X~=4 ) then
				X=X+1
			elseif (LastAnswer == X) and ( X==4 ) then
				X =  Rand(3) + 1
			end

			WriteRoleValue ( NPC , EM_RoleValue_Register+2 , X ) --出題

			if X == 1 then
				Addbuff( OwnerID() , 504690 , 0 , -1)
--				ScriptMessage( OwnerID() , OwnerID() , 0 , "UP" , C_YELLOW  ) -- 上
--				ScriptMessage( OwnerID() , OwnerID() , 1 , "UP" ,  C_YELLOW  ) 
			elseif X == 2 then
				Addbuff( OwnerID() , 504691 , 0 , -1 )
--				ScriptMessage( OwnerID() , OwnerID() , 0 , "Down" , C_Red ) -- 下
--				ScriptMessage( OwnerID() , OwnerID() , 1 , "Down" , C_Red ) 
			elseif X == 3 then
				Addbuff( OwnerID() , 504692 , 0 , -1 )
--				ScriptMessage( OwnerID() , OwnerID() , 0 , "Left" , C_Blue ) -- 左
--				ScriptMessage( OwnerID() , OwnerID() , 1 , "Left" , C_Blue ) 
			elseif X == 4 then
				Addbuff( OwnerID() , 504693 , 0 , -1)
--				ScriptMessage( OwnerID() , OwnerID() , 0 , "Right" , C_DEFAULT  ) -- 右
--				ScriptMessage( OwnerID() , OwnerID() , 1 , "Right" , C_DEFAULT  ) 
			end
end
--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_BeerDDR_Buff_ClockClose()

	local NPC = ReadRoleValue( OwnerID() , EM_RoleValue_Register+9 )
	local Score = ReadRoleValue( OwnerID() , EM_RoleValue_Register+4 )
	local Target = ReadRoleValue( OwnerID() , EM_RoleValue_Register+7 ) --寫入茱莉亞‧葛倫值給玩家
 
		ScriptMessage( OwnerID() ,  OwnerID() , 0 , "[SC_BEERDAY_23]" , C_SYSTEM )
		ScriptMessage( OwnerID() ,  OwnerID() , 1 , "[SC_BEERDAY_23]" , C_SYSTEM )  
		AttachCastMotionTool( OwnerID() , 212076 ) -- 將武器置換成空手
		DelObj( NPC )
		ClockClose( OwnerID() ) 
--		sleep(10)

		if  Score <= 10 then
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BEERDAY_24][$SETVAR1="..Score.."]" , C_SYSTEM )
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_24][$SETVAR1="..Score.."]" , C_SYSTEM )
--			Tell( OwnerID() , Target , "[SC_BEERDAY_38]"..Score )
			Tell( OwnerID() , Target , "[SC_BEERDAY_39]") -- 無獎勵
		elseif  Score >10 and Score <= 30 then
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BEERDAY_24][$SETVAR1="..Score.."]" , C_SYSTEM )
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_24][$SETVAR1="..Score.."]" , C_SYSTEM )
--			Tell( OwnerID() , Target , "[SC_BEERDAY_38]"..Score )
			Tell( OwnerID() , Target , "[SC_BEERDAY_40]") -- 安慰獎
			GiveBodyItem( OwnerID() , 205898 , 1 )
		elseif  Score >30 and Score <= 50 then
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BEERDAY_24][$SETVAR1="..Score.."]" , C_SYSTEM )
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_24][$SETVAR1="..Score.."]" , C_SYSTEM )
--			Tell( OwnerID() , Target , "[SC_BEERDAY_38]"..Score )
			Tell( OwnerID() , Target, "[SC_BEERDAY_41]") --  普獎
			GiveBodyItem( OwnerID() , 205941 , 1 ) -- 啤酒節活動參加憑證
			GiveBodyItem( OwnerID() , 205898 , 1 ) -- 焰火啤酒
		elseif  Score >50 and Score <= 80 then -- 二獎
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BEERDAY_24][$SETVAR1="..Score.."]" , C_SYSTEM )
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_24][$SETVAR1="..Score.."]" , C_SYSTEM )
--			Tell( OwnerID() , Target , "[SC_BEERDAY_38]"..Score )
			Tell( OwnerID() , Target, "[SC_BEERDAY_42]")
			GiveBodyItem( OwnerID() , 205941 , 1 )
			GiveBodyItem( OwnerID() , 205898 , 3 )
		elseif  Score >80  then -- 首獎
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BEERDAY_24][$SETVAR1="..Score.."]" , C_SYSTEM )
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_24][$SETVAR1="..Score.."]" , C_SYSTEM )
--			Tell( OwnerID() , Target , "[SC_BEERDAY_38]"..Score )
			Tell( OwnerID() , Target, "[SC_BEERDAY_44]")
			GiveBodyItem( OwnerID() , 205941 , 2 )
			GiveBodyItem( OwnerID() , 205898 , 5 )
--		elseif  Score >91 then -- 特獎
--			Tell( OwnerID() , Target , "[SC_BEERDAY_38]"..Score )
--			Tell( OwnerID() , Target, "[SC_BEERDAY_44]")
--			GiveBodyItem( OwnerID() , 205941 , 3 )
		end

		Writerolevalue ( OwnerID() , EM_RoleValue_Register+1 , 0 ) -- 將Register+1歸零
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register+2 , 0 ) -- 將Register+2歸零
		Writerolevalue ( OwnerID() , EM_RoleValue_Register+3 , 0 ) --將Register+3歸零
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register+4 , 0 ) --將Register+4歸零
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register+5 , 0 ) --將Register+5歸零
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register+7 , 0 ) --將Register+7歸零
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register+8 , 0 ) --將Register+8歸零
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register+9 , 0 ) --將Register+9歸零
		sleep(5)
		Beginplot ( OwnerID() , "Lua_Hao_BeerDDR_Buff_ClockClose2" , 0 )
end

function Lua_Hao_BeerDDR_Buff_ClockClose2()

	local NPC = ReadRoleValue( OwnerID() , EM_RoleValue_Register+9 )

		sleep(10)
--------------------------------------------------------------------------------------------------------------------------------------------
		SetSmallGameMenuType( OwnerID() , 2 ,2 ) -- 關閉介面
--------------------------------------------------------------------------------------------------------------------------------------------
--		ClockClose( OwnerID() ) 
--		DelObj( NPC )
		local BUFFALL = {	504690,
				 	504691,
			               	504692,
			               	504693,
					504656,
			               	504657,
			               	504658,
			               	504659,
			               	504660,
				 	504652,
				 	504653,
				 	504654,
				 	504655, 	
					504661,
					504796		}
		for i = 1 , 15 do

			if  CheckBuff( OwnerID() , BUFFALL[i]  ) == true then

				CancelBuff( OwnerID() ,  BUFFALL[i]  ) -- 

			end
		end
--		ClockClose( OwnerID() ) 
--		DelObj( NPC )
end
--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_BeerDDR_Buff_ClockClose3() -- 放棄

	local NPC = ReadRoleValue( OwnerID() , EM_RoleValue_Register+9 )
	local Score = ReadRoleValue( OwnerID() , EM_RoleValue_Register+4 )
	local Target = ReadRoleValue( OwnerID() , EM_RoleValue_Register+7 ) --寫入茱莉亞‧葛倫值給玩家

		DelObj( NPC )
		ClockClose( OwnerID() ) 
 		sleep(10)
		ScriptMessage( OwnerID() ,  OwnerID() , 0 , "[SC_BEERDAY_50]" , C_SYSTEM )
		ScriptMessage( OwnerID() ,  OwnerID() , 1 , "[SC_BEERDAY_50]" , C_SYSTEM )  
--		Tell( OwnerID() ,  NPC ,"[SC_BEERDAY_50]") --扣分
		AttachCastMotionTool( OwnerID() , 212076 ) -- 將武器置換成空手
--		DelObj( NPC )
--		ClockClose( OwnerID() ) 
		Writerolevalue ( OwnerID() , EM_RoleValue_Register+1 , 0 ) -- 將Register+1歸零
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register+2 , 0 ) -- 將Register+2歸零
		Writerolevalue ( OwnerID() , EM_RoleValue_Register+3 , 0 ) --將Register+3歸零
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register+4 , 0 ) --將Register+4歸零
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register+5 , 0 ) --將Register+5歸零
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register+7 , 0 ) --將Register+7歸零
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register+8 , 0 ) --將Register+8歸零
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register+9 , 0 ) --將Register+9歸零
--		sleep(5)
		Beginplot ( OwnerID() , "Lua_Hao_BeerDDR_Buff_ClockClose2" , 0 )
end

--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_BeerDDR_up()--↑

	local NPC = ReadRoleValue( OwnerID() , EM_RoleValue_Register+9 ) --讓玩家知道 Register+9 為NPC
--	local Target = ReadRoleValue( OwnerID() , EM_RoleValue_Register+7 ) --讓玩家知道 Register+7 為Target
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register+3 , 1 ) 
	local Q = ReadRoleValue ( NPC , EM_RoleValue_Register+2  ) --題目
	local A = ReadRoleValue ( OwnerID() , EM_RoleValue_Register+3 ) --玩家答案
	local Enter = ReadRoleValue( OwnerID() , EM_RoleValue_Register+5 ) -- 判斷時限後不可輸入指令

	if Enter == 1 then
--	Say ( OwnerID() , A )
		if Q == A then
--			sleep(3)
			CancelBuff( OwnerID() , 504690 )
			PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_DRINK )
			AttachCastMotionTool( OwnerID() , 212075 ) --置換武器為啤酒杯
--			Tell( OwnerID() ,  NPC ,"Good") --加分
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_47]" , C_YELLOW ) -- 正確訊息
			AddRoleValue (OwnerID() ,  EM_RoleValue_Register+4 , 1 ) 
			local Score = ReadRoleValue( OwnerID() , EM_RoleValue_Register+4 )
--			Tell( OwnerID() , NPC , Score )
			Beginplot ( OwnerID() , "Lua_Hao_BeerDDR_Start" , 0 )
		else
			if Q==1 then
			CancelBuff( OwnerID() , 504690 )
			elseif Q==2 then
			CancelBuff( OwnerID() , 504691 )
			elseif Q==3 then
			CancelBuff( OwnerID() , 504692 )
			elseif Q==4 then
			CancelBuff( OwnerID() , 504693 )
			end
--			Tell( OwnerID() ,  NPC ,"[SC_BEERDAY_48]") --扣分
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_48]" , C_Red ) -- 錯誤訊息
			PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )
				if ReadRoleValue( OwnerID() , EM_RoleValue_Register+4 ) >= 2 then 
					AddRoleValue ( OwnerID() ,  EM_RoleValue_Register+4 , -2 ) 
				elseif ReadRoleValue( OwnerID() , EM_RoleValue_Register+4 ) < 2  and ReadRoleValue( OwnerID() , EM_RoleValue_Register+4 ) >= 1 then
					AddRoleValue ( OwnerID() ,  EM_RoleValue_Register+4 , -1 )
				elseif ReadRoleValue( OwnerID() , EM_RoleValue_Register+4 ) == 0 then
					AddRoleValue ( OwnerID() ,  EM_RoleValue_Register+4 , 0  )
				end
			local Score2 = ReadRoleValue( OwnerID() , EM_RoleValue_Register+4 )
--			Tell( OwnerID() , NPC , Score2 )
			Beginplot ( OwnerID() , "Lua_Hao_BeerDDR_Start" , 0 )
		end
	else
		CancelBuff( OwnerID() , 504690 )
		CancelBuff( OwnerID() , 504691 )
		CancelBuff( OwnerID() , 504692 )
		CancelBuff( OwnerID() , 504693 )
	end
end
--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_BeerDDR_down()--↓

	local NPC = ReadRoleValue( OwnerID() , EM_RoleValue_Register+9 ) --讓玩家知道 Register+9 為NPC
--	local Target = ReadRoleValue( OwnerID() , EM_RoleValue_Register+7 ) --讓玩家知道 Register+7 為Target
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register+3 , 2 ) 
	local Q = ReadRoleValue ( NPC , EM_RoleValue_Register+2  ) --題目
	local A = ReadRoleValue ( OwnerID() , EM_RoleValue_Register+3 ) --玩家答案
	local Enter = ReadRoleValue( OwnerID() , EM_RoleValue_Register+5 ) -- 判斷時限後不可輸入指令
--	Say ( OwnerID() , A )
	if Enter == 1 then
		if Q == A then
	--		sleep(3)
			CancelBuff( OwnerID() , 504691 )
			PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_DRINK )
			AttachCastMotionTool( OwnerID() , 212075 ) --置換武器為啤酒杯
	--		Tell( OwnerID() ,  NPC ,"[SC_BEERDAY_47]") --加分 --密語.受話人.發話人.string
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_47]" , C_YELLOW  ) --- 下
			AddRoleValue (OwnerID() ,  EM_RoleValue_Register+4 , 1 ) 
			local Score = ReadRoleValue( OwnerID() , EM_RoleValue_Register+4 )
	--		Tell( OwnerID() , NPC  , Score )
			Beginplot ( OwnerID() , "Lua_Hao_BeerDDR_Start" , 0 )
		else
			if Q==1 then
			CancelBuff( OwnerID() , 504690 )
			elseif Q==2 then
			CancelBuff( OwnerID() , 504691 )
			elseif Q==3 then
			CancelBuff( OwnerID() , 504692 )
			elseif Q==4 then
			CancelBuff( OwnerID() , 504693 )
			end
	--		Tell( OwnerID() ,  NPC ,"[SC_BEERDAY_48]") --扣分
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_48]" , C_Red ) -- 錯誤訊息
			PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )
				if ReadRoleValue( OwnerID() , EM_RoleValue_Register+4 ) >= 2 then 
					AddRoleValue ( OwnerID() ,  EM_RoleValue_Register+4 , -2 ) 
				elseif ReadRoleValue( OwnerID() , EM_RoleValue_Register+4 ) < 2  and ReadRoleValue( OwnerID() , EM_RoleValue_Register+4 ) >= 1 then
					AddRoleValue ( OwnerID() ,  EM_RoleValue_Register+4 , -1 )
				elseif ReadRoleValue( OwnerID() , EM_RoleValue_Register+4 ) == 0 then
					AddRoleValue ( OwnerID() ,  EM_RoleValue_Register+4 , 0  )
				end
			local Score2 = ReadRoleValue( OwnerID() , EM_RoleValue_Register+4 )
	--		Tell( OwnerID() , NPC , Score2 )
			Beginplot ( OwnerID() , "Lua_Hao_BeerDDR_Start" , 0 )
		end
	else
		CancelBuff( OwnerID() , 504690 )
		CancelBuff( OwnerID() , 504691 )
		CancelBuff( OwnerID() , 504692 )
		CancelBuff( OwnerID() , 504693 )
	end
end
--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_BeerDDR_Left()--←
	
	local NPC = ReadRoleValue( OwnerID() , EM_RoleValue_Register+9 ) --讓玩家知道 Register+9 為NPC
--	local Target = ReadRoleValue( OwnerID() , EM_RoleValue_Register+7 ) --讓玩家知道 Register+7 為Target
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register+3 , 3 ) 
	local Q = ReadRoleValue ( NPC , EM_RoleValue_Register+2  ) --題目
	local A = ReadRoleValue ( OwnerID() , EM_RoleValue_Register+3 ) --玩家答案
	local Enter = ReadRoleValue( OwnerID() , EM_RoleValue_Register+5 ) -- 判斷時限後不可輸入指令
--	Say ( OwnerID() , A )
	if Enter ==1 then
		if Q == A then
	--		sleep(3)
			CancelBuff( OwnerID() , 504692 )
			PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_DRINK ) --播放喝的動作
			AttachCastMotionTool( OwnerID() , 212075 ) --置換武器為啤酒杯
	--		Tell( OwnerID() ,  NPC ,"[SC_BEERDAY_47]") --加分
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_47]" , C_YELLOW  ) --- 左
			AddRoleValue (OwnerID() ,  EM_RoleValue_Register+4 , 1 ) 
			local Score = ReadRoleValue( OwnerID() , EM_RoleValue_Register+4 )
	--		Tell( OwnerID() , NPC , Score )
			Beginplot ( OwnerID() , "Lua_Hao_BeerDDR_Start" , 0 )
		else
			if Q==1 then
			CancelBuff( OwnerID() , 504690 )
			elseif Q==2 then
			CancelBuff( OwnerID() , 504691 )
			elseif Q==3 then
			CancelBuff( OwnerID() , 504692 )
			elseif Q==4 then
			CancelBuff( OwnerID() , 504693 )
			end
	--		Tell( OwnerID() ,  NPC ,"[SC_BEERDAY_48]") --扣分
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_48]" , C_Red ) -- 錯誤訊息
			PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )
				if ReadRoleValue( OwnerID() , EM_RoleValue_Register+4 ) >= 2 then 
					AddRoleValue ( OwnerID() ,  EM_RoleValue_Register+4 , -2 ) 
				elseif ReadRoleValue( OwnerID() , EM_RoleValue_Register+4 ) < 2  and ReadRoleValue( OwnerID() , EM_RoleValue_Register+4 ) >= 1 then
					AddRoleValue ( OwnerID() ,  EM_RoleValue_Register+4 , -1 )
				elseif ReadRoleValue( OwnerID() , EM_RoleValue_Register+4 ) == 0 then
					AddRoleValue ( OwnerID() ,  EM_RoleValue_Register+4 , 0  )
				end
			local Score2 = ReadRoleValue( OwnerID() , EM_RoleValue_Register+4 )
	--		Tell( OwnerID() , NPC , Score2 )
			Beginplot ( OwnerID() , "Lua_Hao_BeerDDR_Start" , 0 )
		end
		else
			CancelBuff( OwnerID() , 504690 )
			CancelBuff( OwnerID() , 504691 )
			CancelBuff( OwnerID() , 504692 )
			CancelBuff( OwnerID() , 504693 )
		end
end
--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_BeerDDR_right()--→

	local NPC = ReadRoleValue( OwnerID() , EM_RoleValue_Register+9 ) --讓玩家知道 Register+9 為NPC
--	local Target = ReadRoleValue( OwnerID() , EM_RoleValue_Register+7 ) --讓玩家知道 Register+7 為Target
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register+3 , 4 ) 
	local Q = ReadRoleValue ( NPC , EM_RoleValue_Register+2  ) --題目
	local A = ReadRoleValue ( OwnerID() , EM_RoleValue_Register+3 ) --玩家答案
	local Enter = ReadRoleValue( OwnerID() , EM_RoleValue_Register+5 ) -- 判斷時限後不可輸入指令
--	Say ( OwnerID() , A )
	if Enter == 1 then
		if Q == A then
	--		sleep(3)
			CancelBuff( OwnerID() , 504693 )
			PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_DRINK )
			AttachCastMotionTool( OwnerID() , 212075 ) --置換武器為啤酒杯
	--		Tell( OwnerID() , NPC , "[SC_BEERDAY_47]") --加分
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_47]" , C_YELLOW  ) -- 右
			AddRoleValue (OwnerID() ,  EM_RoleValue_Register+4 , 1 ) 
			local Score = ReadRoleValue( OwnerID() , EM_RoleValue_Register+4 )
	--		Tell( OwnerID() , NPC , Score )
			Beginplot ( OwnerID() , "Lua_Hao_BeerDDR_Start" , 0 )
		else
			if Q==1 then
			CancelBuff( OwnerID() , 504690 )
			elseif Q==2 then
			CancelBuff( OwnerID() , 504691 )
			elseif Q==3 then
			CancelBuff( OwnerID() , 504692 )
			elseif Q==4 then
			CancelBuff( OwnerID() , 504693 )
			end
	--		Tell( OwnerID() ,  NPC ,"[SC_BEERDAY_48]") --扣分
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_48]" , C_Red ) -- 錯誤訊息
			PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )
				if ReadRoleValue( OwnerID() , EM_RoleValue_Register+4 ) >= 2 then 
					AddRoleValue ( OwnerID() ,  EM_RoleValue_Register+4 , -2 ) 
				elseif ReadRoleValue( OwnerID() , EM_RoleValue_Register+4 ) < 2  and ReadRoleValue( OwnerID() , EM_RoleValue_Register+4 ) >= 1 then
					AddRoleValue ( OwnerID() ,  EM_RoleValue_Register+4 , -1 )
				elseif ReadRoleValue( OwnerID() , EM_RoleValue_Register+4 ) == 0 then
					AddRoleValue ( OwnerID() ,  EM_RoleValue_Register+4 , 0  )
				end
			local Score2 = ReadRoleValue( OwnerID() , EM_RoleValue_Register+4 )
	--		Tell( OwnerID() , NPC , Score2 )
			Beginplot ( OwnerID() , "Lua_Hao_BeerDDR_Start" , 0 )
		end
		else
			CancelBuff( OwnerID() , 504690 )
			CancelBuff( OwnerID() , 504691 )
			CancelBuff( OwnerID() , 504692 )
			CancelBuff( OwnerID() , 504693 )
		end
end
--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_BeerDDR_Buff_PlayerDead() -- 玩家死亡

	local NPC = ReadRoleValue( OwnerID() , EM_RoleValue_Register+9 )
	local Score = ReadRoleValue( OwnerID() , EM_RoleValue_Register+4 )
	local Target = ReadRoleValue( OwnerID() , EM_RoleValue_Register+7 ) --寫入茱莉亞‧葛倫值給玩家

		DelObj( NPC )
		ClockClose( OwnerID() ) 
		SetSmallGameMenuType( OwnerID() , 2 ,2 ) -- 關閉介面
		AttachCastMotionTool( OwnerID() , 212076 ) -- 將武器置換成空手
		Writerolevalue ( OwnerID() , EM_RoleValue_Register+1 , 0 ) -- 將Register+1歸零
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register+2 , 0 ) -- 將Register+2歸零
		Writerolevalue ( OwnerID() , EM_RoleValue_Register+3 , 0 ) --將Register+3歸零
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register+4 , 0 ) --將Register+4歸零
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register+5 , 0 ) --將Register+5歸零
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register+7 , 0 ) --將Register+7歸零
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register+8 , 0 ) --將Register+8歸零
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register+9 , 0 ) --將Register+9歸零

		local BUFFALL = {	504690,
				 	504691,
			               	504692,
			               	504693,
					504656,
			               	504657,
			               	504658,
			               	504659,
			               	504660,
				 	504652,
				 	504653,
				 	504654,
				 	504655, 	
					504661,
					504796		}
		for i = 1 , 15 do

			if  CheckBuff( OwnerID() , BUFFALL[i]  ) == true then

				CancelBuff( OwnerID() ,  BUFFALL[i]  ) -- 

			end
		end
end
--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_BeerDDR_test1()
	SetFlag ( OwnerID(), 543322, 0 )
	SetFlag ( OwnerID(), 543323, 0 )
end
--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_DelNPC()
	Sleep(900)
	DelObj( OwnerID() )
end
--------------------------------------------------------------------------------------------------------------------------------------------