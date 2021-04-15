--------------------------------------- 奪寶遊戲
function LuaYU_MalaTina2_01()

	local Key =  CountBodyItem( OwnerID() , 203477 )  --特殊劇情觸發
	local play =  CheckFlag( OwnerID()  , 542991 ) --今天已經來過
	local UseItem3 = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem3)


	if Key >= 1 then

		SetSpeakDetail( OwnerID(), "[SC_113120_MALA2_03]"   )--呦～唧唧唧唧～冒險者，這次，我想和你玩個遊戲...一個簡單的遊戲~唧唧唧唧，只要你能在限定時間內通過重重障礙，取得寶箱的鑰匙並開啟寶箱，那麼寶藏就是你的！只要花費<CS>30個必爾汀代幣</CS>，就能參加，你要...接受挑戰嗎？...冒險者！？
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_02]" , "LuaYU_MalaTina2_02", 0 ) --接受挑戰
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_03]" , "LuaYU_111813_3", 0 ) --裝做沒聽到
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_111813_0", 0 ) --回上一頁

	elseif  play == true then

		SetSpeakDetail( OwnerID(), "[SC_111813_YU_34]"   )--呦～唧唧唧唧～是意猶未盡嗎？每人每天只有一次機會唷！明天再來吧！
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_111813_0", 0 ) --回上一頁

	elseif play == false then

		SetSpeakDetail( OwnerID(), "[SC_113120_MALA2_03]"   )
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_02]" , "LuaYU_MalaTina2_02", 0 ) --接受挑戰
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_03]" , "LuaYU_111813_3 ", 0 ) --裝做沒聽到
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_111813_0", 0 ) --回上一頁

	end

end
---------------------------------瑪拉2必爾汀計算
function LuaYU_MalaTina2_02()
	local Cash =  CountBodyItem( OwnerID() , 203038 )  --必爾汀代幣
	local Key =  CountBodyItem( OwnerID() , 203477 )  --特殊劇情觸發
	SetFlag( OwnerID()  , 542992 , 0 ) --打開重置旗標

	if Key >= 1 then


		BeginPlot( OwnerID() , "LuaYU_MalaTina2_03" , 0 )  


	elseif Cash >= 30 then


		BeginPlot( OwnerID() , "LuaYU_MalaTina2_03" , 0 )  

	else
		SetSpeakDetail( OwnerID(), "[SC_111813_YU_36]"   )--你沒有足夠的必爾汀代幣
	end
end

-------------------------------瑪拉2 縮小傳送
function LuaYU_MalaTina2_03()
	CloseSpeak( OwnerID() )      
	-- 2013.08.30 阿浩:修正玩家於瑪拉蒂娜-生存遊戲時，在遊戲時間結束又還在執行觸碰劇情施法條的情況下被傳出遊戲後，會無法執行其他觸碰劇情的問題。
	Hao_SetPlot_Touch_Reset( OwnerID() )
	--
	ScriptMessage( TargetID() , OwnerID() , 1 , "|cffff00ff" .."[SC_111813_YU_04]".. "|r" , 0 ) --呦～唧唧唧唧～果然有冒險者的勇氣呀～唧唧唧唧～等等你是會笑還是會哭呢？我迫不及待想看到了！唧唧唧唧～！
	ScriptMessage( TargetID() , OwnerID() , 0 , "|cffff00ff" .."[SC_111813_YU_04]".. "|r" , 0 ) 
	CastSpell( OwnerID(), OwnerID(), 491272)
	sleep(40)

	BeginPlot( OwnerID() , "LuaYU_MalaTina2_04" , 0 )  

end

------------------------傳送術
function LuaYU_MalaTina2_04()

	if ChangeZone( OwnerID(), 353 , -1 , 4081.6, 18.7 , 3335.8, 269.5) then   --ChangeZone( OwnerID(), ZoneID 區域ID , 第幾層 0 為第0層 -1代表只跑副本規則 , x, y, z, Dir)  
		local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					--取得玩家等級
		local PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				--取得玩家副職等級
		DesignLog(OwnerID(),353," last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)	--紀錄進入人次

	end

end


--*****************副本內


function LuaYU_Mala2_rANGE() --初始範圍劇情

	SetPlot( OwnerID(),"range","LuaYU_Mala2_rANGE2",50 )                                                                     --給一個空個function，取消再次觸發範圍劇情的可能。     
end

function LuaYU_Mala2_rANGE2()

	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 

	Hide( TargetID() )
	Show(  TargetID() ,RoomID)

--OwnerID  玩家
--TargetID   任務瑪拉NPC
	local play =  CheckFlag( OwnerID()  , 542992 ) 

	if play ~= true then	--今天第一次進副本   啟動重置機制。
		SetModeEx(  TargetID()  , EM_SetModeType_Show , true ) --顯示
		BeginPlot(  OwnerID()  , "Lua_Clockending" , 0 )  --關閉計時器
		SetFlag( OwnerID()  , 542992 , 1 ) --關閉重複觸發範圍劇情
		WriteRoleValue( OwnerID()  , EM_RoleValue_Register+6 , 0 ) --玩家有付巫咒卷軸時會做的記號
		WriteRoleValue( OwnerID()  , EM_RoleValue_PID , 0 )  --PClass 玩家身上的PID清空
		WriteRoleValue( OwnerID()  , EM_RoleValue_Register+4 , 0 )  --特殊KEY取得時限清空
		WriteRoleValue( OwnerID() , EM_RoleValue_Register+3 , 0  )   --玩家返回寶箱區，不可使用"瞬移捲軸"的旗標。
		WriteRoleValue( TargetID()  , EM_RoleValue_Register+3 , 0 ) --紀錄玩家不在進行教學模式
	--重生機制  需加入：重置寶箱、重置任務瑪拉蒂那、刪除隱藏關卡瑪拉蒂那


		local MALATINA = LuaFunc_SearchNPCbyOrgID(OwnerID(), 113120, 200 , 1)       --範圍劇情：若有HIDE的瑪拉蒂娜則叫出來

		local ToDel = {}

		ToDel[1] = LuaFunc_SearchNPCbyOrgID( TargetID() , 111813, 300 , 1)     --重置機制，重複觸碰時，刪掉關卡者計算關卡、表演瑪拉蒂那
		ToDel[2] = LuaFunc_SearchNPCbyOrgID( TargetID() , 100044, 60 , 1)     --教學用NPC
		ToDel[3] = LuaFunc_SearchNPCbyOrgID( TargetID() , 113114, 300 , 1)     --寶箱
		ToDel[4] = LuaFunc_SearchNPCbyOrgID( TargetID() , 113137, 300 , 1)     --特別寶箱
		ToDel[5] = LuaFunc_SearchNPCbyOrgID( TargetID() , 113110, 300 , 1)     
		ToDel[6] = LuaFunc_SearchNPCbyOrgID( TargetID() , 113104, 300 , 1)     
		ToDel[7] = LuaFunc_SearchNPCbyOrgID( TargetID() , 113108, 300 , 1)     
		ToDel[8] = LuaFunc_SearchNPCbyOrgID( TargetID() , 102382, 300 , 1)     
		ToDel[9] = LuaFunc_SearchNPCbyOrgID( TargetID() , 113109, 300 , 1)  
		ToDel[10] = LuaFunc_SearchNPCbyOrgID( TargetID() , 113103, 300 , 1)     
		ToDel[11] = LuaFunc_SearchNPCbyOrgID( TargetID() , 102382, 300 , 1)     
		ToDel[12] = LuaFunc_SearchNPCbyOrgID( TargetID() , 113115, 300 , 1)  
		ToDel[13] = LuaFunc_SearchNPCbyOrgID( TargetID() , 113111, 300 , 1)     
		ToDel[14] = LuaFunc_SearchNPCbyOrgID( TargetID() , 102368, 300 , 1)     
		ToDel[15] = LuaFunc_SearchNPCbyOrgID( TargetID() , 113113, 300 , 1)  
		ToDel[16] = LuaFunc_SearchNPCbyOrgID( TargetID() , 113107, 300 , 1)     
		ToDel[17] = LuaFunc_SearchNPCbyOrgID( TargetID() , 102369, 300 , 1)     
		ToDel[18] = LuaFunc_SearchNPCbyOrgID( TargetID() , 113112, 300 , 1)  
		ToDel[19] = LuaFunc_SearchNPCbyOrgID( TargetID() , 113106, 300 , 1)    
		ToDel[20] = LuaFunc_SearchNPCbyOrgID( TargetID() , 113118, 300 , 1)    
		ToDel[21] = LuaFunc_SearchNPCbyOrgID( TargetID() , 111814, 300 , 1)    --希爾喬克


 
		for i=1 , table.getn(ToDel) do	

			if ToDel[i] ~= -1 then
				for j = 0 ,table.getn(ToDel[i])  do

					Delobj(ToDel[i][j])
				end
			end
		end

		local door = LuaFunc_SearchNPCbyOrgID( TargetID() , 101473, 300 , 1)--大門
		PlayMotion( door[0], 133) --門關閉狀態
--		sleep(10)
		SetModeEx( door[0] , EM_SetModeType_Obstruct, true )--阻擋
		Hide( door[0] )
		Show(  door[0] , RoomID )

--		sleep(10)
		
		if CheckID( MALATINA[0] ) == true then
			SetModeEx( MALATINA[0]   , EM_SetModeType_Show , true ) --不顯示
			SetModeEx( MALATINA[0]  , EM_SetModeType_Mark, true )--標記

			Hide(MALATINA[0])
			Show(  MALATINA[0],RoomID)

		end

		local Chest = {}
		for j = 1 , 10 do
			Chest[j] = CreateObjByFlag( 113114, 780309 , j+14 , 1 );

			Hide(Chest[j])
			Show(  Chest[j],RoomID)
			AddToPartition( Chest[j] , RoomID )  
			Beginplot( Chest[j]  ,"LuaYU_Mala2_Treasure", 0 )
		end

		ScriptMessage( OwnerID() , -1 , 1 , "|cffff00ff" .."[SC_113120_MALA2_04]".. "|r" , 0 ) --呦～唧唧唧唧～冒險者...看看四周的寶箱，心動了嗎！？先來和我對話吧！
		ScriptMessage( OwnerID() , -1 , 0 , "|cffff00ff" .."[SC_113120_MALA2_04]".. "|r" , 0 ) 

		AddBuff( OwnerID() ,502864 ,1 , -1 ); --定身
		AddBuff( OwnerID() ,503995 ,1 , -1 ); --步履沉重
	end
end

function LuaYU_Mala2_00()

	local Key =  CountBodyItem( OwnerID() , 203477 )  --特殊劇情觸發
	local play =  CheckFlag( OwnerID()  , 542991 ) --今天已經來過
	local playover =  CheckFlag( OwnerID()  , 543170 ) --通關
	local RoomID = ReadRoleValue( TargetID() ,EM_RoleValue_RoomID) 
	local Cash =  CountBodyItem( OwnerID() , 203038 )  --必爾汀代幣

	local Teach = ReadRoleValue( TargetID() ,EM_RoleValue_Register+3 )  --玩家是否在進行教學模式

	if playover == true then -- 通關時瑪姐姐的選項

		SetSpeakDetail(  OwnerID(), "[SC_113120_MALA2_68]"  ) --唧唧唧唧～居然破關了
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_42]" , "LuaYU_Mala2_leave", 0 ) --我要離開

	elseif Teach > 0 then
		SetSpeakDetail(  OwnerID(), "[SC_113120_MALA2_99]"  ) --唧唧唧唧～專心看教學喔
	elseif Key >= 1 then
		PlayMotion( TargetID(), 121)  --idel03

		SetSpeakDetail(  OwnerID(), "[SC_113120_MALA2_05]"  ) --呦～唧唧唧唧～冒險者～歡迎來到...瑪拉蒂娜的...奪寶遊戲～呦～唧唧唧唧～。
		AddSpeakOption( OwnerID(), TargetID(), "[SC_113120_MALA2_69]" , "LuaYU_Mala2_01", 0 )--規則說明
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_02]" , "LuaYU_Mala2_star", 0 ) --接受挑戰
		AddSpeakOption( OwnerID(), TargetID(), "[SC_113120_MALA2_58]" , "LuaYU_Mala2_exchange", 0 ) --兌換特殊獎勵
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_42]" , "LuaYU_Mala2_leave", 0 ) --我要離開
	elseif Cash >= 30 then
		PlayMotion( TargetID(), 121)  --idel03

		SetSpeakDetail(  OwnerID(), "[SC_113120_MALA2_05]"   ) --
		AddSpeakOption( OwnerID(), TargetID(), "[SC_113120_MALA2_69]" , "LuaYU_Mala2_01", 0 )--規則說明
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_02]" , "LuaYU_Mala2_star", 0 ) --接受挑戰
		AddSpeakOption( OwnerID(), TargetID(), "[SC_113120_MALA2_58]" , "LuaYU_Mala2_exchange", 0 ) --兌換特殊獎勵
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_42]" , "LuaYU_Mala2_leave", 0 ) --我要離開
	else
		SetSpeakDetail( OwnerID(), "[SC_111813_YU_36]"   )--你沒有足夠的必爾汀代幣
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_42]" , "LuaYU_Mala2_leave", 0 ) --我要離開
	end

end

function LuaYU_Mala2_star()--規則說明
		PlayMotion( TargetID() , 120) 
		SetSpeakDetail(  OwnerID(), "[SC_113120_MALA2_80]"   ) --準備好了嗎？
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_27]" , "LuaYU_Mala2_04", 0 ) --直接挑戰
		AddSpeakOption( OwnerID(), TargetID(), "[SC_113120_MALA2_57]" , "LuaYU_Mala2_other_01", 0 ) -- 使用巫咒卷軸進行挑戰
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_Mala2_00", 0 ) --回上一頁
end


function LuaYU_Mala2_01()--規則說明

	SetSpeakDetail(  OwnerID(), "[SC_113120_MALA2_06]"  ) --規則很簡單，只要在限定時間內，穿越障礙奪取每回合指定數量的鑰匙並且穿越傳送門回到這裡，就可以盡情的開啟寶箱！唧唧唧唧～
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113120_MALA2_07]" , "LuaYU_Mala2_Showlearn", 0 ) -- 遊戲提示
	AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_Mala2_00", 0 ) --回上一頁
end

function LuaYU_Mala2_other_01()--使用巫咒卷軸時限延長進行挑戰

	local Card =  CountBodyItem( OwnerID() , 203032 )  --巫咒卷軸

	if Card >= 1 then

		SetSpeakDetail(  OwnerID(), "[SC_113120_MALA2_59]"  ) --呦～唧唧唧唧～你居然拿到了這個！那麼，你將擁有<CM>20分鐘</CM>的充裕挑戰時間！你確定使用嗎？
		AddSpeakOption( OwnerID(), TargetID(), "[SC_GETTITLE_1]" , "LuaYU_Mala2_other_02", 0 ) -- 確定
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_Mala2_00", 0 ) --回上一頁

	else

		SetSpeakDetail(  OwnerID(), "[SC_113120_MALA2_60]"  ) --唧唧唧唧～我怎麼沒看到任何<CM>[203032]</CM>呢？

	end

end

function LuaYU_Mala2_other_02()--使用巫咒卷軸時限延長進行挑戰

	CloseSpeak( OwnerID() ) 
	WriteRoleValue( OwnerID()  , EM_RoleValue_Register+6 , 666 ) 
	Beginplot( TargetID() ,"LuaYU_Mala2_04_2", 0 )
	WriteRoleValue( OwnerID()  , EM_RoleValue_PID , 0 ) 

	DelBodyItem( OwnerID() , 203032 , 1 )
	DelBodyItem( OwnerID() , 203038 , 30 )
	SetFlag( OwnerID()  , 542991 , 1 ) -- 重要物品


end

function LuaYU_Mala2_04()--進行遊戲的表演

	CloseSpeak( OwnerID() ) 
	Beginplot( TargetID() ,"LuaYU_Mala2_04_2", 0 )
	WriteRoleValue( OwnerID()  , EM_RoleValue_PID , 0 ) 

	DelBodyItem( OwnerID() , 203038 , 30 )
	SetFlag( OwnerID()  , 542991 , 1 ) -- 重要物品
end


function LuaYU_Mala2_04_2()--進行遊戲的表演

--Say( OwnerID(),"OwnerID()_2" )   --任務瑪拉蒂那
--Say( TargetID(),"TargetID()_2" )   --玩家

	local MalaTina = OwnerID()
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
	SetModeEx( MalaTina  , EM_SetModeType_Move, false )--移動
	SetModeEx( MalaTina  , EM_SetModeType_Mark, false )--標記
	Hide(MalaTina)
	Show(MalaTina , RoomID )

	PlayMotion( MalaTina, 112)  --說話
	Say( MalaTina , "[SC_113120_MALA2_40] ") -- 呦～唧唧唧唧～我也迫不及待要開始了！讓我看看你的本事吧！
	sleep(20)	
	PlayMotion( MalaTina, 122)  --idel03
	sleep(10)
	AddBuff( MalaTina ,503993 ,1 , 1 ); --傳送特效
	sleep(10)


	SetModeEx( MalaTina  , EM_SetModeType_Show , false )--不顯示
	
	Hide( MalaTina)
	MalaGOGO = CreateObjByFlag( 111813, 780309 , 0 , 1 );--表演 & 計算關卡用
--	SetModeEx( MalaGOGO  , EM_SetModeType_Move, false )--移動
	SetModeEx( MalaGOGO  , EM_SetModeType_HideName, true )--名稱
	SetModeEx( MalaGOGO , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( MalaGOGO  , EM_SetModeType_Mark, false )--標記
	SetModeEx( MalaGOGO , EM_SetModeType_Fight , false )--可砍殺攻擊

	AddToPartition( MalaGOGO , RoomID )  

	WriteRoleValue( MalaTina , EM_RoleValue_Register+1 , MalaGOGO )   --記住 (計算關卡用)的瑪拉蒂娜
	WriteRoleValue( MalaTina , EM_RoleValue_Register+2 , TargetID() )   --記住 玩家
	WriteRoleValue( MalaGOGO , EM_RoleValue_Register+1 , MalaTina )   --記住 任務瑪拉蒂娜
	WriteRoleValue( MalaGOGO , EM_RoleValue_Register+2 , TargetID() )   --記住 玩家

	sleep(10)
	PlayMotion( MalaGOGO, 122)  --idel03
	sleep(10)
	Say( MalaGOGO , "[SC_113120_MALA2_41]") -- 那麼就開始吧！我的僕人們，出來招呼這位冒險者吧~呦～唧唧唧唧～
	sleep(10)
	PlayMotion( MalaGOGO, 121)  --idel03	
	sleep(45)
	Show(  MalaTina ,RoomID)
	SetModeEx( MalaTina  , EM_SetModeType_Show , false )--不顯示

	Magiccirle = CreateObjByFlag( 113118, 780309 , 0 , 1 );--特效魔法陣
	SetModeEx( Magiccirle  , EM_SetModeType_HideName, true )--名稱
	SetModeEx( Magiccirle , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( Magiccirle  , EM_SetModeType_Mark, false )--標記
	AddToPartition( Magiccirle , RoomID )  

	WriteRoleValue( MalaTina , EM_RoleValue_Register+4 , Magiccirle )   --記住 特效魔法陣


	BeginPlot( MalaGOGO , "LuaYU_111813_00" , 0 )
	local Jok = {}
	for i = 2, 7 do

		Jok[i] = CreateObjByFlag( 111814, 780309 , 9 , 1 );
		AddToPartition( Jok[i] , RoomID )  

		SetModeEx( Jok[i]   , EM_SetModeType_HideName, true )--名稱
		SetModeEx( Jok[i] , EM_SetModeType_ShowRoleHead, false )--頭像框
		SetModeEx( Jok[i]    , EM_SetModeType_Mark, false )--標記
		SetModeEx( Jok[i]  , EM_SetModeType_Fight , false )--可砍殺攻擊
		SetModeEx( Jok[i]  , EM_SetModeType_Show , false )--顯示

		MoveToFlagEnabled(Jok[i] , false )
		WriteRoleValue( Jok[i]  ,EM_RoleValue_IsWalk , 1 )

		Hide(Jok[i])  
		Show(Jok[i] , RoomID )

		WriteRoleValue(  Jok[i]  , EM_RoleValue_PID ,  i ) 
		Beginplot( Jok[i]  ,"LuaYU_Mala2_04_3", 0 )	

	end
	
--	Show(MalaTina , RoomID )
	sleep(100)
	BeginPlot(  MalaTina  , "LuaYU_Mala2_02" , 0 )  


end

function LuaYU_Mala2_04_3()--希爾喬克走路


	local NUM = ReadRoleValue( OwnerID()  ,EM_RoleValue_PID) 
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 

	if NUM == 4 or NUM == 5  then

		sleep(20)
--		AddBuff( OwnerID()  ,503993 ,1 , 1 ); --傳送特效
		sleep(10)

	end


	if NUM == 6 or NUM == 7  then

		sleep(40)
--		AddBuff( OwnerID()  ,503993 ,1 , 1 ); --傳送特效
		sleep(10)

	end

	SetModeEx( OwnerID()  , EM_SetModeType_Show , true )--顯示
	Hide(OwnerID() )  
	Show(OwnerID() , RoomID )	


	LuaFunc_MoveToFlag( OwnerID() , 780309 , NUM , 0 )
	SetPosByFlag( OwnerID(), 780309 , NUM )
	Beginplot( OwnerID() ,"LuaYU_Mala2_04_4", 0 )

--	Say(  OwnerID() , NUM.."  5" )



end

function LuaYU_Mala2_04_4()--希爾喬克表演
	local NUM = ReadRoleValue( OwnerID()  ,EM_RoleValue_PID) 
	while true do

		if NUM == 2 or NUM ==  4 or NUM ==  6 then
			PlayMotion( OwnerID(), 123) 
			sleep(40)
		else

			PlayMotion( OwnerID(), 121) 
			sleep(20)
			PlayMotion( OwnerID(), 122) 
			sleep(30)

		end
	end

end

function LuaYU_Mala2_04_killed()--殺光希爾喬克
	local Jok = LuaFunc_SearchNPCbyOrgID( OwnerID() , 111814, 60 , 1)     


	for i = 0 ,table.getn(Jok)  do

		Delobj(Jok[i])
	end

end


function LuaYU_Mala2_02()--準備完畢開門劇情

--Say( OwnerID(),"OwnerID()_2".."GOGO" )   --任務瑪拉蒂那


	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
 -- 	local PlayerID = ReadRoleValue( OwnerID() , EM_RoleValue_Register  )  	
  --	local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_PID  )  
	local BoxMala = ReadRoleValue( OwnerID() ,EM_RoleValue_Register+1) --關卡計算的瑪拉蒂那
	local PlayerID = ReadRoleValue( OwnerID() ,EM_RoleValue_Register+2) --玩家
	local PlayerLV = ReadRoleValue( PlayerID , EM_RoleValue_LV )
	local Magiccirle = ReadRoleValue( OwnerID() ,EM_RoleValue_Register+4) --特效魔法陣

	Delobj(Magiccirle)

	local ffdeler = CreateObjByFlag( 100044, 780309 , 12 , 1 );
	SetModeEx( ffdeler  , EM_SetModeType_Show , false ) --不顯示

	AddToPartition( ffdeler , RoomID )  

	WriteRoleValue( ffdeler  , EM_RoleValue_Register , PlayerLV ) --記住玩家等級
	BeginPlot( ffdeler , "LuaYu_Ma2floor_Del" , 0 )  --預先清除所有地板

	sleep(10)

	local floors = CreateObjByFlag( 113105, 780309 , 11 , 1 );
	SetModeEx( floors  , EM_SetModeType_Mark, false )--標記
	SetModeEx( floors   , EM_SetModeType_HideName, true )--名稱
	SetModeEx( floors , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( floors , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( floors  , EM_SetModeType_Show , false ) --不顯示
	AddToPartition( floors , RoomID )  
	WriteRoleValue( floors , EM_RoleValue_PID , OwnerID() )   --記住任務瑪拉蒂娜
	BeginPlot( floors , "LuaYU_Mala2_hidemala3" , 0 )  -- 執行地板布置後 再開門
end

function LuaYU_Mala2_03()--開始計時

	local PlayerID = ReadRoleValue( OwnerID() ,EM_RoleValue_Register+2) --玩家
	local GOGOticket = ReadRoleValue( PlayerID ,EM_RoleValue_Register+6) --判斷玩家是否使用了延長時間的巫咒卷軸

	ScriptMessage( OwnerID() , -1 , 1 , "|cffff00ff" .."[SC_113120_MALA2_42]".. "|r" , 0 ) --那麼就開始計時吧！呦～唧唧唧唧～跑起來吧！冒險者！
	Say(  OwnerID(), "[SC_113120_MALA2_42]") 

	CancelBuff( PlayerID ,502864 ); --定身


	if GOGOticket == 666 then

		ClockOpen( PlayerID ,EM_ClockCheckValue_2,1200,1200,0,"Lua_Clockending","Lua_Clockending")

		sleep(11990)--正規遊戲時間：20分鐘  20*60 = 1200  1200-1 = 1199       11990毫秒
		-- 2013.08.30 阿浩:修正玩家於瑪拉蒂娜-生存遊戲時，在遊戲時間結束又還在執行觸碰劇情施法條的情況下被傳出遊戲後，會無法執行其他觸碰劇情的問題。
			Hao_SetPlot_Touch_Reset( PlayerID )
		--
		ScriptMessage( OwnerID() , -1 , 1 , "|cffff00ff" .."[SC_111813_YU_33]".. "|r" , 0 ) --呦～唧唧唧唧～時間到出去吧！
		ScriptMessage( OwnerID() , -1 , 0 , "|cffff00ff" .."[SC_111813_YU_33]".. "|r" , 0 ) 
		sleep(10)

		ChangeZone( PlayerID, 2 , 0 , 4871.9, 104.9, -1885.2, 92)

	else

		ClockOpen( PlayerID ,EM_ClockCheckValue_2,900,900,0,"Lua_Clockending","Lua_Clockending")

		sleep(8990)--正規遊戲時間：15分鐘  15*60 = 900  900-1 = 899       8990毫秒
		-- 2013.08.30 阿浩:修正玩家於瑪拉蒂娜-生存遊戲時，在遊戲時間結束又還在執行觸碰劇情施法條的情況下被傳出遊戲後，會無法執行其他觸碰劇情的問題。
			Hao_SetPlot_Touch_Reset( PlayerID )
		--		
		ScriptMessage( OwnerID() , -1 , 1 , "|cffff00ff" .."[SC_111813_YU_33]".. "|r" , 0 ) --呦～唧唧唧唧～時間到出去吧！
		ScriptMessage( OwnerID() , -1 , 0 , "|cffff00ff" .."[SC_111813_YU_33]".. "|r" , 0 ) 
		sleep(10)

		ChangeZone( PlayerID, 2 , 0 , 4871.9, 104.9, -1885.2, 92)

	end

end

function LuaYU_Mala2_doorclose()--關門劇情   TargetID是 floors + 記錄

--Say( OwnerID(),"OwnerID()_1" )--玩家
--Say( TargetID(),"TargetID()_1" )--生成地板NPC
	SetPlot( TargetID(),"range","",70 )    


	local Malatina = ReadRoleValue( TargetID() ,EM_RoleValue_PID) --任務瑪拉
	local BoxMala = ReadRoleValue( Malatina ,EM_RoleValue_Register+1) --隱藏計關瑪拉
	local Class = ReadRoleValue( BoxMala ,EM_RoleValue_PID) --關卡瑪拉身上的PID  第幾關
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
	local door = LuaFunc_SearchNPCbyOrgID( TargetID() , 101473, 200 , 1)--大門
	PlayMotion( door[0], 147) 
	sleep(5)
	SetModeEx( door[0] , EM_SetModeType_Obstruct, true )--阻擋
	Hide( door[0] )
	Show(  door[0] , RoomID )

	AddBuff( OwnerID() ,503993 ,1 , 1 ); --傳送特效
	SetPosByFlag( OwnerID() , 780309 , 10 )--傳送到 X 號旗子

	BeginPlot( Malatina , "LuaYU_Mala2_04_killed" , 0 )  -- 殺光希爾喬克
	SetModeEx( BoxMala  , EM_SetModeType_Show , false ) --不顯示
	Hide( BoxMala )
	Show(  BoxMala , RoomID )
	sleep(10)

	WriteRoleValue( OwnerID() , EM_RoleValue_Register+3 , 1314  )   --玩家正在闖關，可使用"瞬移捲軸"的旗標。

	local CountClass = ReadRoleValue( BoxMala ,EM_RoleValue_PID) 

	WriteRoleValue( BoxMala , EM_RoleValue_PID , CountClass+1 )   --紀錄關卡號碼，第一關 PID為 0


	local MRclass = CreateObjByFlag( 113105, 780309 , 13 , 1 ); -- 傳送門下的隱型物件

	SetModeEx( MRclass  , EM_SetModeType_Mark, false )--標記
	SetModeEx( MRclass   , EM_SetModeType_HideName, true )--名稱
	SetModeEx( MRclass , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( MRclass , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( MRclass  , EM_SetModeType_Show , false ) --不顯示

	AddToPartition( MRclass , RoomID )  

	local CountClass = ReadRoleValue( BoxMala ,EM_RoleValue_PID) 


	WriteRoleValue( MRclass , EM_RoleValue_PID , CountClass  )   --記住瑪拉蒂娜關卡
	WriteRoleValue( MRclass , EM_RoleValue_Register+7 , BoxMala  )   --記住隱藏瑪拉蒂娜

	SetPlot( MRclass,"range","LuaYU_Mala2_trans",20 )  --傳送至門口

	SetPlot( BoxMala,"range","LuaYU_Mala2_hidemala",50 )  

--	Say(OwnerID() ,"CLASS=".. Class)

	if Class == 3 then

		--** 通關 秀出瑪拉蒂娜
		SetModeEx( Malatina  , EM_SetModeType_Mark, true )--標記   
		SetModeEx( Malatina  , EM_SetModeType_Show , true ) --不顯示
		Hide(Malatina)
		Show( Malatina ,RoomID )

		--BeginPlot( Malatina , "LuaYU_111813_00" , 0 )
		SetFlag( OwnerID()  , 543170 , 1 ) -- 通關

	end

end

function LuaYU_Mala2_hidemala()--隱形計算關卡的瑪拉蒂那劇情

--Say( OwnerID(),"OwnerID()_1" )--玩家
--Say( TargetID(),"TargetID()_1" )--隱藏計關瑪拉
	
	SetPlot( TargetID() ,"range","",50 )  
	local Class = ReadRoleValue( TargetID() ,EM_RoleValue_PID) --關卡瑪拉身上的PID  第幾關
	local RoomID = ReadRoleValue( TargetID() ,EM_RoleValue_RoomID) 
	local Malatina = ReadRoleValue( TargetID() ,EM_RoleValue_Register+1) --任務瑪拉
	local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )

	if Class < 4 then
		local ffdeler = CreateObjByFlag( 100044, 780309 , 12 , 1 )
		SetModeEx( ffdeler  , EM_SetModeType_Show , false ) --不顯示
		AddToPartition( ffdeler , RoomID )  
		WriteRoleValue( ffdeler  , EM_RoleValue_Register , PlayerLV ) --記住玩家等級
		BeginPlot( ffdeler , "LuaYu_Ma2floor_Del" , 0 )  --預先清除所有地板

		sleep(10)

		local floors = CreateObjByFlag( 113105, 780309 , 11 , 1 );
		SetModeEx( floors  , EM_SetModeType_Mark, false )--標記
		SetModeEx( floors   , EM_SetModeType_HideName, true )--名稱
		SetModeEx( floors , EM_SetModeType_ShowRoleHead, false )--頭像框
		SetModeEx( floors , EM_SetModeType_Fight , false )--可砍殺攻擊
		SetModeEx( floors  , EM_SetModeType_Show , false ) --不顯示
		AddToPartition( floors , RoomID )  
		WriteRoleValue( floors , EM_RoleValue_PID , Malatina )   --記住任務瑪拉蒂娜
		BeginPlot( floors , "LuaYU_Mala2_hidemala2" , 0 )  -- 地板布置 再開門
   
	end
end

-- 先把地板布置完 再開門
function LuaYU_Mala2_hidemala2()  --觸發者floor
	local floors = OwnerID()

	LuaYu_Ma2floor_matrix()  -- Floor 執行地板布置劇情
		
	local door = LuaFunc_SearchNPCbyOrgID( floors , 101473, 200 , 1)--大門
	SetModeEx( door[0] , EM_SetModeType_Obstruct, false )--阻擋
	PlayMotion( door[0], 145) 
	SetPlot( floors ,"range","LuaYU_Mala2_doorclose",100 )       
end

-- 先把地板布置完 再開門 , 然後再開計時器
function LuaYU_Mala2_hidemala3()  --觸發者floor
	local floors = OwnerID()
	local Malatina = ReadRoleValue( floors ,EM_RoleValue_PID) --任務 瑪拉
	local BoxMala = ReadRoleValue( Malatina ,EM_RoleValue_Register+1) --隱藏觸發用瑪拉

	LuaYu_Ma2floor_matrix()  -- Floor 執行地板布置劇情
		
	local door = LuaFunc_SearchNPCbyOrgID( floors , 101473, 200 , 1)--大門
	SetModeEx( door[0] , EM_SetModeType_Obstruct, false )--阻擋
	PlayMotion( door[0], 145) 
	SetPlot( floors ,"range","LuaYU_Mala2_doorclose",100 )       

	sleep(10)
	BeginPlot( BoxMala , "LuaYU_Mala2_03" , 0 )
end

function LuaYU_Mala2_trans()--過關傳送到門口，OwnerID 是玩家   TargetID  物件

	local Class = ReadRoleValue( TargetID() ,EM_RoleValue_PID) --關卡瑪拉身上的PID
	local BoxMala = ReadRoleValue( TargetID() ,EM_RoleValue_Register+7) --關卡瑪拉
	local SPPASS = ReadRoleValue( OwnerID() ,EM_RoleValue_Register+9) --是否通過特別目標
	local Malatina = ReadRoleValue( BoxMala ,EM_RoleValue_Register+1) --任務瑪拉

	local PClass = ReadRoleValue( OwnerID() ,EM_RoleValue_PID) --玩家身上的PID
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
	local Timecount = ClockRead(OwnerID(),EM_ClockValueType_NowTime) -- 回傳玩家身上的計時器數值。
	local GOGOticket = ReadRoleValue( OwnerID() ,EM_RoleValue_Register+6) --判斷玩家是否使用了延長時間的巫咒卷軸
	local KEYTIME = ReadRoleValue( OwnerID() ,EM_RoleValue_Register+4) --奪取鑰匙的時間
	local Player = OwnerID()
	local PlayerLV = ReadRoleValue( Player , EM_RoleValue_LV )	
--	Say(OwnerID(), "SPPASS="..SPPASS )
	if Class == 1 then
		if PClass == 1 then
-------------------------------------------------2013.03.14 (6.0.0)貨幣整合調整 ------------------------------------------------
			if PlayerLV >= 50 then
				Hao_Monetary_Union_240181(Player , 10)
			end
--------------------------------------------------------------------------------------------------------------------------------------		
			AddBuff( OwnerID() ,503993 ,1 , 1 ); --傳送特效
			SetPosByFlag( OwnerID() , 780309 , 14 )--傳送到 X 號旗子
			WriteRoleValue( OwnerID()  , EM_RoleValue_PID , 0 )  --PClass 玩家身上的PID清空
			WriteRoleValue( OwnerID() , EM_RoleValue_Register+3 , 0  )   --玩家返回寶箱區，不可使用"瞬移捲軸"的旗標。
			WriteRoleValue(  TargetID() , EM_RoleValue_Register+1 , 168  )   --本關通關
		elseif PClass < 1 then
			ScriptMessage( OwnerID() , -1 , 1 , "[SC_113120_MALA2_44]" , 0 ) 
			ScriptMessage( OwnerID() , -1 , 0 , "[SC_113120_MALA2_44]" , 0 ) 
		end
	elseif Class == 2 then

		if PClass == 2 then
-------------------------------------------------2013.03.14 (6.0.0)貨幣整合調整 ------------------------------------------------
			if PlayerLV >= 50 then
				Hao_Monetary_Union_240181(Player , 10)
			end
-------------------------------------------------------------------------------------------------------------------------------------
			if GOGOticket == 666 then --計時器從 20分鐘 開始倒數    從1200 秒倒數

				if Timecount >=840 then  --6分鐘內通過第二關出現特殊寶箱一個 ( 1200 - X = 360(6分鐘= 60*6=360) ， X = 840 )

					if SPPASS ~= 5566 then --如果玩家沒有用"瞬移捲軸"

						local SPBOX = CreateObjByFlag( 113137, 780309 , 25 , 1 )

						SetModeEx( SPBOX  , EM_SetModeType_Mark, true )--標記
						SetModeEx( SPBOX   , EM_SetModeType_HideName, false )--名稱
						SetModeEx( SPBOX , EM_SetModeType_ShowRoleHead, false )--頭像框

						AddToPartition( SPBOX , RoomID )  

						Beginplot( SPBOX  ,"LuaYU_Mala2_Treasure2", 0 )

						WriteRoleValue( OwnerID() , EM_RoleValue_Register+4 , Timecount )   --記住現在的時間
						WriteRoleValue( OwnerID() , EM_RoleValue_Register+9 , 2222 )   --第一特別目標記號

						ScriptMessage( OwnerID() , -1 , 1 , "[SC_113120_MALA2_64]" , 0 ) --特別目標達成！出現特殊寶箱！5分鐘內突破第四回合你將額外獲得寶箱的鑰匙！
						ScriptMessage( OwnerID() , -1 , 0 , "[SC_113120_MALA2_64]" , 0 ) 
					end


				end

			else--計時器從 15分鐘 開始倒數   從900 秒倒數

				if Timecount >=540 then  --6分鐘內通過第二關出現特殊寶箱一個 ( 900 - X = 360(6分鐘= 60*6=360) ， X = 540 )

					if SPPASS ~= 5566 then --如果玩家沒有用"瞬移捲軸"

						local SPBOX = CreateObjByFlag( 113137, 780309 , 25 , 1 )

						SetModeEx( SPBOX  , EM_SetModeType_Mark, true )--標記
						SetModeEx( SPBOX   , EM_SetModeType_HideName, false )--名稱
						SetModeEx( SPBOX , EM_SetModeType_ShowRoleHead, false )--頭像框

						AddToPartition( SPBOX , RoomID )  

						Beginplot( SPBOX  ,"LuaYU_Mala2_Treasure2", 0 )

						WriteRoleValue( OwnerID() , EM_RoleValue_Register+4 , Timecount )   --記住現在的時間
						WriteRoleValue( OwnerID() , EM_RoleValue_Register+9 , 2222 )   --第一特別目標記號

						ScriptMessage( OwnerID() , -1 , 1 , "[SC_113120_MALA2_64]" , 0 ) --特別目標達成！出現特殊寶箱！5分鐘內突破第四回合你將額外獲得寶箱的鑰匙！
						ScriptMessage( OwnerID() , -1 , 0 , "[SC_113120_MALA2_64]" , 0 ) 
			
					end

				end


			end

			AddBuff( OwnerID() ,503993 ,1 , 1 ); --傳送特效
			SetPosByFlag( OwnerID() , 780309 , 14 )--傳送到 X 號旗子
			WriteRoleValue( OwnerID()  , EM_RoleValue_PID , 0 )  --PClass 玩家身上的PID清空
			WriteRoleValue( OwnerID() , EM_RoleValue_Register+3 , 0  )   --玩家返回寶箱區，不可使用"瞬移捲軸"的旗標。
			WriteRoleValue(  TargetID() , EM_RoleValue_Register+1 , 168  )   --本關通關


		elseif PClass < 2 then
			ScriptMessage( OwnerID() , -1 , 1 , "[SC_113120_MALA2_44]" , 0 ) 
			ScriptMessage( OwnerID() , -1 , 0 , "[SC_113120_MALA2_44]" , 0 ) 
		end
	elseif Class == 3 then
		if PClass == 3 then
-------------------------------------------------2013.03.14 (6.0.0)貨幣整合調整 ------------------------------------------------
			if PlayerLV >= 50 then
				Hao_Monetary_Union_240181(Player , 10)
			end
--------------------------------------------------------------------------------------------------------------------------------------
			if GOGOticket == 666 then --計時器從 20分鐘 開始倒數 從1200 秒倒數

				if Timecount >=660 then  --9分鐘內通過第三關出現特殊寶箱一個 ( 1200 - X = 540(9分鐘= 60*9=540) ， X = 660 )

					if SPPASS ~= 5566 then --如果玩家沒有用"瞬移捲軸"

						local SPBOX = CreateObjByFlag( 113137, 780309 , 26 , 1 )

						SetModeEx( SPBOX  , EM_SetModeType_Mark, true )--標記
						SetModeEx( SPBOX   , EM_SetModeType_HideName, false )--名稱
						SetModeEx( SPBOX , EM_SetModeType_ShowRoleHead, false )--頭像框

						AddToPartition( SPBOX , RoomID )  

						Beginplot( SPBOX  ,"LuaYU_Mala2_Treasure2", 0 )

						WriteRoleValue( OwnerID() , EM_RoleValue_Register+4 , Timecount )   --記住現在的時間
						WriteRoleValue( OwnerID() , EM_RoleValue_Register+9 , 3333 )   --第二特別目標記號

						ScriptMessage( OwnerID() , -1 , 1 , "[SC_113120_MALA2_65]" , 0 ) --特別目標達成！出現特殊寶箱！5分鐘內突破第四回合你將額外獲得寶箱的鑰匙！
						ScriptMessage( OwnerID() , -1 , 0 , "[SC_113120_MALA2_65]" , 0 ) 

					end

				end

			else--計時器從 15分鐘 開始倒數 從900 秒倒數

				if Timecount >=360 then  --9分鐘內通過第三關出現特殊寶箱一個 ( 900 - X = 540(9分鐘= 60*9=540) ， X = 360 )

					if SPPASS ~= 5566 then --如果玩家沒有用"瞬移捲軸"

						local SPBOX = CreateObjByFlag( 113137, 780309 , 26 , 1 )

						SetModeEx( SPBOX  , EM_SetModeType_Mark, true )--標記
						SetModeEx( SPBOX   , EM_SetModeType_HideName, false )--名稱
						SetModeEx( SPBOX , EM_SetModeType_ShowRoleHead, false )--頭像框

						AddToPartition( SPBOX , RoomID )  

						Beginplot( SPBOX  ,"LuaYU_Mala2_Treasure2", 0 )

						WriteRoleValue( OwnerID() , EM_RoleValue_Register+4 , Timecount )   --記住現在的時間
						WriteRoleValue( OwnerID() , EM_RoleValue_Register+9 , 3333 )   --第二特別目標記號

						ScriptMessage( OwnerID() , -1 , 1 , "[SC_113120_MALA2_65]" , 0 ) --特別目標達成！出現特殊寶箱！5分鐘內突破第四回合你將額外獲得寶箱的鑰匙！
						ScriptMessage( OwnerID() , -1 , 0 , "[SC_113120_MALA2_65]" , 0 ) 
					end
				end
			end

			if SPPASS == 2222 then

				if Timecount >= (KEYTIME-180)  then--如果現在的時間 大於 當時記錄的時間-3分鐘

					GiveBodyItem( OwnerID() , 205791  , 1 )  

					ScriptMessage( OwnerID() , -1 , 1 , "|cffff00ff" .."[SC_113120_MALA2_66]".."|r" , 0 ) --特別條件達成！奪得貴重的鑰匙！
					ScriptMessage( OwnerID() , -1 , 0 , "|cffff00ff" .."[SC_113120_MALA2_66]".. "|r" , 0 ) 

				end
			end
			AddBuff( OwnerID() ,503993 ,1 , 1 ); --傳送特效
			SetPosByFlag( OwnerID() , 780309 , 14 )--傳送到 X 號旗子
			WriteRoleValue( OwnerID()  , EM_RoleValue_PID , 0 )  --PClass 玩家身上的PID清空
			WriteRoleValue( OwnerID() , EM_RoleValue_Register+3 , 0  )   --玩家返回寶箱區，不可使用"瞬移捲軸"的旗標。
			WriteRoleValue(  TargetID() , EM_RoleValue_Register+1 , 168  )   --本關通關


		elseif PClass < 3 then
			ScriptMessage( OwnerID() , -1 , 1 , "[SC_113120_MALA2_44]" , 0 ) 
			ScriptMessage( OwnerID() , -1 , 0 , "[SC_113120_MALA2_44]" , 0 ) 
		end
	elseif Class == 4 then
		if PClass == 4 then
-------------------------------------------------2013.03.14 (6.0.0)貨幣整合調整 ------------------------------------------------
			if PlayerLV >= 50 then
				Hao_Monetary_Union_240181(Player , 20)
			end
--------------------------------------------------------------------------------------------------------------------------------------		
-------------------------------------------------2011.08.22 新增稱號給予判斷---------------------------------------------------
			if CountBodyItem( Player , 530087 ) < 1 then
				DebugMsg( Player , RoomID , "Get new title" )
				GiveBodyItem( Player , 530087 , 1 )
			else
				DebugMsg( Player , RoomID , "You already have the title." )
			end
--------------------------------------------------------------------------------------------------------------------------------------
--	Say(OwnerID(), "SPPASS3="..SPPASS )

			if SPPASS == 3333 then
				if Timecount >= (KEYTIME-180) then --如果現在的時間 小於 當時記錄的時間-3分鐘

					GiveBodyItem( OwnerID() , 205791  , 1 )  

					ScriptMessage( OwnerID() , -1 , 1 , "|cffff00ff" .."[SC_113120_MALA2_66]".."|r" , 0 ) --特別條件達成！奪得貴重的鑰匙！
					ScriptMessage( OwnerID() , -1 , 0 , "|cffff00ff" .."[SC_113120_MALA2_66]".. "|r" , 0 ) 

				end
			end


			AddBuff( OwnerID() ,503993 ,1 , 1 ); --傳送特效
			SetPosByFlag( OwnerID() , 780309 , 14 )--傳送到 X 號旗子
			WriteRoleValue( OwnerID()  , EM_RoleValue_PID , 0 )  --PClass 玩家身上的PID清空
			WriteRoleValue( OwnerID() , EM_RoleValue_Register+3 , 0  )   --玩家返回寶箱區，不可使用"瞬移捲軸"的旗標。
			WriteRoleValue(  TargetID() , EM_RoleValue_Register+1 , 168  )   --本關通關



		elseif PClass < 4 then
			ScriptMessage( OwnerID() , -1 , 1 , "[SC_113120_MALA2_44]" , 0 ) 
			ScriptMessage( OwnerID() , -1 , 0 , "[SC_113120_MALA2_44]" , 0 ) 
		end
	end

	local PassOK = ReadRoleValue( TargetID() ,EM_RoleValue_Register+1 )  --本關通關?

	if PassOK == 168 then

		local ffdeler = CreateObjByFlag( 100044, 780309 , 12 , 1 );


		SetModeEx( ffdeler  , EM_SetModeType_Show , false ) --不顯示

		AddToPartition( ffdeler , RoomID )  


		WriteRoleValue( ffdeler  , EM_RoleValue_Register , PlayerLV ) --記住玩家等級
		BeginPlot( ffdeler , "LuaYu_Ma2floor_Del" , 0 )  --預先清除所有地板

	end

end

function LuaYU_Mala2_leave()--我要離開

	SetSpeakDetail( OwnerID(), "[SC_111813_YU_43]"   )  --你真的確定要離開？那好吧？隨時歡迎你再來挑戰！唧唧唧唧～
	AddSpeakOption( OwnerID(), TargetID(), "[SC_GETTITLE_1]" , "LuaYU_Mala2_leaveOK", 0 ) --確定

end

function LuaYU_Mala2_leaveOK()

	CloseSpeak( OwnerID() )
	SetFlag( OwnerID()  , 542992 , 0 ) --打開重置旗標
	CancelBuff( OwnerID() ,502859 ); --定身
	CancelBuff( OwnerID() ,503995 ); --步履沉重
	ChangeZone( OwnerID() , 2 , 0 , 4871.9, 104.9, -1885.2, 92)

end


function LuaYU_Mala2_JOKDEL()--關卡內的希爾喬克

	SetSpeakDetail(  OwnerID(), "[SC_113120_MALA2_83]"   ) --噢！怎麼啦～親愛的冒險者？難道...你操作火砲轟炸錯目標，沒辦法繼續囉？～唧唧唧唧～要看清楚再轟炸呀～！

	AddSpeakOption( OwnerID(), TargetID(), "[SO_110989_1]" , "LuaYU_Mala2_leave", 0 ) --我想放棄
	AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_11]" , "LuaYU_Mala2_JOKDEL_01", 0 ) --其他協議

end

function LuaYU_Mala2_JOKDEL_01()--關卡內的希爾喬克其他協議

	SetSpeakDetail(  OwnerID(), "[SC_113120_MALA2_82]"   ) --唧唧唧唧～如果你是因為<CM>時間不夠</CM>了，想要直接出去開寶箱的話，你可以使用<CM>[203030]</CM>...但是如果你沒有的話...唧唧唧唧～給我<CM>3個[202903]</CM>我偷偷讓你溜出去吧！

	AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_13]" , "LuaYU_Mala2_JOKDEL_02", 0 ) --達成協議

end

function LuaYU_Mala2_JOKDEL_02()--關卡內的希爾喬克其他協議
	local RoomID = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID )   -- 2013.04.19 補上
	local transport =  CountBodyItem( OwnerID() , 202903 )    --傳送者符文
	local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )

	if transport >=3 then		

		CloseSpeak( OwnerID() )

		ScriptMessage( OwnerID() , -1 , 1 , "|cffff00ff" .."[SC_113120_MALA2_81]".. "|r" , 0 ) --快出去吧
		ScriptMessage( OwnerID() , -1 , 0 , "|cffff00ff" .."[SC_113120_MALA2_81]".. "|r" , 0 ) --快出去吧
		sleep(10)


		AddBuff( OwnerID() ,503993 ,1 , 1 ); --傳送特效
		SetPosByFlag( OwnerID() , 780309 , 14 )--傳送到 X 號旗子
		WriteRoleValue( OwnerID()  , EM_RoleValue_PID , 0 )  --PClass 玩家身上的PID清空

		DelBodyItem( OwnerID() , 202903 , 3 )

		local ffdeler = CreateObjByFlag( 100044, 780309 , 12 , 1 );

		SetModeEx( ffdeler  , EM_SetModeType_Show , false ) --不顯示

		AddToPartition( ffdeler , RoomID )  

		WriteRoleValue( ffdeler  , EM_RoleValue_Register , PlayerLV ) --記住玩家等級
		BeginPlot( ffdeler , "LuaYu_Ma2floor_Del" , 0 )  --預先清除所有地板

	else

		SetSpeakDetail(  OwnerID(), "[SC_112502_NO]"  ) --你所持的物品數量不足
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_Mala2_JOKDEL_01", 0 ) --回上一頁

	end

end