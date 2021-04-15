function Lua_120992_00()	--外區的莉莉亞
	local Owner = OwnerID()
	local Target = TargetID()
	local PlayerLv = ReadRoleValue( Owner , EM_RoleValue_LV) --讀取玩家主職等級，等級50(含)以上，每回合給予5個必爾汀圓貝
	local Daily = 548115 --活動每日
	local Reward = 548116 --領獎憑證
	local ScoreBase = ReadRoleValue( Owner , EM_LuaValueFlag_UseItem40)
	local Round = math.floor(ScoreBase / 1000)  --玩家達成的回合
	local Score = ScoreBase%1000  -- 取餘數，此為答對的分數
	AdjustFaceDir( Target, Owner , 0) 
	if CountBodyItem( Owner , 530968 ) >= 1 then
		AddSpeakOption( Owner , Owner, "[SC_120992_GACHA]", "Lua_FindMistake_GACHA" , 0 ) --我想兌換家具轉蛋
	end

	if CheckFlag( Owner, Daily ) == true and ScoreBase ~= 0 then --已經完成任務，尚未領取獎勵
		if Score == 0 then
			SetSpeakDetail( Owner , "[SC_120993_09][$SETVAR2="..Score.."]" )
			GiveBodyItem( Owner , 724266 , 1 )
		else
			SetSpeakDetail( Owner , "[SC_120993_07][$SETVAR1="..Round.."][$SETVAR2="..Score.."]" )
			Lua_FindMistake_Reward(Owner, Round ,Score)
		end
			SetFlag( Owner , Reward , 1 ) --給予已經領獎的旗標
			WriteRoleValue( Owner , EM_LuaValueFlag_UseItem40 , 0 ) --將分數重置

	elseif CheckFlag( Owner, Daily ) == true and CheckFlag( Owner, Reward ) == true then	
		SetSpeakDetail( Owner, "[SC_120993_08]" )

	elseif ScoreBase ~= 0 then
		if Score == 0 then
			SetSpeakDetail( Owner , "[SC_120993_09][$SETVAR2="..Score.."]" )
			GiveBodyItem( Owner , 724266 , 1 )
		else
			SetSpeakDetail( Owner , "[SC_120993_07][$SETVAR1="..Round.."][$SETVAR2="..Score.."]" )
			Lua_FindMistake_Reward(Owner, Round ,Score)	
		end
		WriteRoleValue( Owner , EM_LuaValueFlag_UseItem40 , 0 ) --將分數重置

	else
		SetSpeakDetail( Owner , "[SC_120992_OUT]" )	--[$playername]，歡迎來到我的奇幻屋！在這裡，我想向你的觀察力與記憶力提出挑戰。你是否願意接受我的考驗呢？
		AddSpeakOption( Owner, Owner , "[SC_120992_YES]" , "Lua_FindMistake_Trans" , 0 )		--我已經準備好接受挑戰了！
		AddSpeakOption( Owner, Owner , "[SO_110378_4]" , "Lua_FindMistake_SpeakClose" , 0 )	--我再考慮看看
	end
end

function Lua_FindMistake_Reward(Owner, Round ,Score)
	local PlayerLv = ReadRoleValue( Owner, EM_RoleValue_LV)
--	local RList = {	[1] = 726834 , [2] = 726135 , [3] = 204555, 
		--	[4]= 726944 , [5] = 205817	} --1.公會資源 / 2. 公會工具箱配方 / 3.魔法樂器素材包 / 4. 特殊材製造材料 / 5.征服者的戰利品
	if PlayerLv >= 50 and  Round > 3 then --檢查是否給予必爾汀圓貝	第三回合之後才給予
		local Monetary = Round*5
		Hao_Monetary_Union_240181(Owner , Monetary)
	--	GiveBodyItem( Owner , 201014 , 1 ) --大師萬能修理鎚
	--	GiveBodyItem( Owner , 203487 , 1 ) --魔幻寶盒能量1點
	end

	if Score >= 200 then --給稱號 
		GiveBodyItem( Owner , 530966, 1 ) --就算化成灰我也認得！
		GiveBodyItem( Owner , 530965, 1 ) --亮晶晶的大眼睛
	elseif Score >= 40 then
		GiveBodyItem( Owner , 530965, 1 ) --亮晶晶的大眼睛
	end

	if Round == 9 then
		GiveBodyItem( Owner , 726944 , 1 ) --特殊製造材料 726944
		GiveBodyItem( Owner , 205817 , 1 ) --征服者的戰利品 205817
		GiveBodyItem( Owner, 242757 , 3 ) -- 彩色玻璃珠 2
	elseif Round == 8 then
		GiveBodyItem( Owner , 726944 , 1 ) --特殊製造材料 726944
		GiveBodyItem( Owner , 726135 , 1 )--公會工具箱配方 726135 
		GiveBodyItem( Owner, 242756 , 3 ) -- 透明玻璃珠 3
	elseif Round == 7 then
		GiveBodyItem( Owner , 205817 , 1 ) --征服者的戰利品 205817
		GiveBodyItem( Owner, 242757 , 2 ) -- 彩色玻璃珠 2
	elseif Round == 6 then
		GiveBodyItem( Owner, 204555 , 1 ) --魔法樂器素材包204555
		GiveBodyItem( Owner , 726834, 1 ) --公會資源 726834
		GiveBodyItem( Owner, 242756 , 2 ) --透明玻璃珠 2
	elseif  Round == 5 then
		GiveBodyItem( Owner, 204555 , 1 ) --魔法樂器素材包204555
		GiveBodyItem( Owner, 242757 , 1 ) --彩色玻璃珠 1
	elseif Round >= 4 then
		GiveBodyItem( Owner , 726135, 1 ) --公會工具箱配方 726135
		GiveBodyItem( Owner, 242756 , 1 ) --透明玻璃珠 1	
	elseif Round == 3 then
		GiveBodyItem( Owner , 726135 , 1 ) --公會工具箱配方 726135
	elseif Round <= 2 then
		GiveBodyItem( Owner , 726834, 1 )
	end
end


function Lua_FindMistake_GACHA() --兌換轉蛋
	local Owner = OwnerID()
	SetSpeakDetail( Owner , "[SC_120992_GACHA1]" )
	AddSpeakOption(Owner , Owner ,"[SC_120992_GACHA2]" , "Lua_FindMistake_Reward1(1)" , 0 )
	AddSpeakOption(Owner , Owner ,"[SC_120992_GACHA3]" , "Lua_FindMistake_Reward1(2)", 0 )
end


function Lua_FindMistake_Reward1(TYPE)
	local Owner = OwnerID()
	if Type == 1 then
		if CountBodyItem( Owner , 242756) >= 30 then
			SetSpeakDetail( Owner , "[SC_120992_GACHA5]" )
			DelBodyItem(Owner , 242756, 30 )
			GiveBodyItem( Owner , 242761 , 1 ) --給予一般家具轉蛋
			Designlog( Owner , 361 , "Furniture Gacha Exchange" ) 
		else	
			CloseSpeak( Owner)
			ScriptMessage( Owner , Owner , 1 , "[SC_120992_GACHA4]" , 0 )
		end
	elseif Type == 2 then
		if CountBodyItem( Owner , 242757) >= 30 then
			SetSpeakDetail( Owner , "[SC_120992_GACHA5]" )
			DelBodyItem( Owner , 242757, 30)
			GiveBodyItem( Owner , 242762 , 1 ) --給予節慶家具轉蛋
			Designlog( Owner , 361 , "Festival Furniture Gacha Exchange" ) 
		else	
			CloseSpeak( Owner)
			ScriptMessage( Owner , Owner , 1 , "[SC_120992_GACHA4]" , 0 )
		end
	end		
end


function Lua_FindMistake_SpeakClose()
	CloseSpeak( OwnerID() )
end


function Lua_FindMistake_Trans() --傳送至副本內
	local Owner = OwnerID()
	ChangeZone( Owner, 361, -1, 3802, 3013.5, 3760, 270 )
end


function Lua_FindMistake_Enter() --進入副本後給予buff不能使用職業技能
	local Owner = OwnerID()
	AddBuff( Owner , 624582 , 0 , -1 )
end





------------------------------------------
--副本內的莉莉亞 初始劇情
------------------------------------------
function Lua_na_120993_NpcBorn() 
	local Owner = OwnerID()
	local Target = TargetID()
	WriteRoleValue( Owner , EM_RoleValue_Register1 , 1 )--進行開關
	WriteRoleValue( Owner , EM_RoleValue_Register2  , 0) -- 回合
	local Reg = ReadRoleValue( Owner , EM_RoleValue_Register1) --活動開關
	local Reg2 = ReadRoleValue( Owner , EM_RoleValue_Register2) --階段
--	DebugMsg( 0,0, "Lylia Reg = "..Reg.." Reg2 = "..Reg2)
end


function Lua_na_120993_speak() --莉莉亞對話劇情
	local Owner = OwnerID() --玩家
	local Target = TargetID() --NPC
	local Switch = ReadRoleValue( Target , EM_RoleValue_Register1 ) -- Switch
	local R = ReadRoleValue( Target , EM_RoleValue_Register2 ) --任務NPC上面記錄的遊戲階段，初始為0
	local BuffID = 624295
	local Score = ReadRoleValue( Owner, EM_LuaValueFlag_UseItem40)
--	DebugMsg( 0, 0 , "Switch = "..Switch)
	AdjustFaceDir( Target, Owner , 0) 
	local UIFlag = ReadRoleValue( Owner , EM_LuaValueFlag_UseItem45) 
	if UIFlag == 30 then  --給予稱號莉莉亞的好朋友
		GiveBodyItem( Owner , 530968 , 1 )
	elseif UIFlag == 100 then  --給予稱號名偵探之眼
		GiveBodyItem( Owner , 530967 , 1 )
	end

	if Switch == 3 then --記憶倒數中的莉莉亞對話
		SetSpeakDetail( Owner ,"[SC_120993_06]" )	 --你都記憶好了嗎？時間可是一分一秒的過去囉！	
	elseif CheckBuff( Owner , BuffID ) == true then --如果玩家身上還在進行遊戲
		if  R == 9 then --已經完美達成
			CancelBuff( Owner , BuffID) -- 刪除辨識緩衝值
			SetSpeakDetail( Owner ,"[SC_120993_END1]" )	
			GiveBodyItem( Owner, 530964 , 1 )
			AddSpeakOption( Owner, Target , "[SC_120993_QUIT]" , "Lua_na_FindMistake_QUIT" , 0 ) --離開奇幻屋
		else
			Score = Score%1000
			local BuffLV = FN_CountBuffLevel(Owner, BuffID )
			if BuffLV >= 7 then
				SetSpeakDetail( Owner , "[SC_120993_03][$SETVAR1="..Score.."]") 	
			elseif BuffLV >= 3 then
				SetSpeakDetail( Owner , "[SC_120993_04][$SETVAR1="..Score.."]") 
			elseif BuffLV == 0 then
				SetSpeakDetail( Owner , "[SC_120993_05][$SETVAR1="..Score.."]") 	
			end
		--	DebugMsg( Owner , 0 , BuffLV )
			AddSpeakOption( Owner, Owner , "[SC_120993_OPT1]" , "Lua_na_FindMistakeRule" , 0 )
			AddSpeakOption( Owner, Owner , "[SC_120993_START] ", "Lua_na_FM_begin1" , 0 )
			AddSpeakOption( Owner, Owner , "[SC_120993_LEAVE] ", "Lua_na_FindMistake_Leave" , 0 )
		end	
	else
		if R == 0 then 
		--	WriteRoleValue( Owner , EM_LuaValueFlag_UseItem40 , 0) --清空分數
			SetSpeakDetail( Owner , "[SC_120993_01]") 
			AddSpeakOption( Owner, Owner , "[SC_120993_OPT1]" , "Lua_na_FindMistakeRule" , 0 )
			AddSpeakOption( Owner, Owner , "[SC_120993_START] ", "Lua_na_FM_begin" , 0 )
			AddSpeakOption( Owner, Owner , "[SC_120993_LEAVE] ", "Lua_na_FindMistake_Leave" , 0 )
		elseif  CheckBuff( Owner , BuffID ) == false then --玩家可挑戰的次數已經用完
			SetSpeakDetail( Owner , "[SC_120993_END]") 	
			AddSpeakOption( Owner, Owner , "[SC_120993_QUIT] ", "Lua_na_FindMistake_QUIT" , 0 )	
		end
	end
end


function Lua_na_FindMistakeRule()
	local Owner = OwnerID()
	SetSpeakDetail( Owner , "[SC_120993_RULE]")	
	AddSpeakOption( Owner, Owner , "[SC_120993_START] ", "Lua_na_FM_begin" , 0 )
end

function Lua_na_FindMistake_Leave() --離開活動副本
	local Owner = OwnerID()
	local Target = TargetID()
	SetSpeakDetail( Owner , "[SC_120993_LEAVEMES]" ) --離開副本
	AddSpeakOption( Owner, Target , "[SC_120993_QUIT]" , "Lua_na_FindMistake_QUIT" , 0 ) --離開奇幻屋
	AddSpeakOption( Owner, Target , "[SO_BACK]" , "Lua_na_120993_speak" , 0 ) --回到上一頁
end


function Lua_na_FindMistake_QUIT()
	local Owner = OwnerID()
	local NPC = SearchRangeNPC( Owner , 50)
	local Lylia = 120993
	for i = 0 , #NPC do
		if ReadRoleValue( Npc[i] , EM_RoleValue_OrgID ) == Lylia then
		--	Say( NPC[i] , " Lylia" )
			WriteRoleValue( NPC[i]  , EM_RoleValue_Register1 , 1 )--進行開關
			WriteRoleValue( NPC[i]  , EM_RoleValue_Register2 , 0) -- 回合
			local Reg = ReadRoleValue( NPC[i]  , EM_RoleValue_Register1) --活動開關
			local Reg2 = ReadRoleValue( NPC[i]  , EM_RoleValue_Register2) --階段
			break
		end
	end
--	DebugMsg(0, 0, "LEAVE!" )	
	Sleep(20)
	ChangeZone( Owner, 2, 0 , 4829, 103, -1875, 77.3 )
	
end

function Lua_na_reward_mes()  --將玩家傳送出活動副本後，用來提示獎勵領取的訊息
	local Owner = OwnerID()
	ScriptMessage( Owner , Owner, 3, "[SC_120992_REWARD_MES]" , 0 )  --請與中央廣場的莉莉亞對話，領取獎勵。
end


-----------------------------
--遊戲機制
-------------------------------
function Lua_na_FM_begin() --活動開始，扣除必爾汀代幣
	local Owner = OwnerID() --player
	local Target = TargetID() --NPC
	local BuffID = 624295
	local Lv = ReadRoleValue( OwnerID() , EM_RoleValue_Lv )
	local SubLv = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )
	WriteRoleValue( Owner, EM_RoleValue_Register10 , Target)  --讓莉莉亞記住玩家
	WriteRoleValue( Target, EM_RoleValue_Register10 , Owner)  --讓玩家記住莉莉亞
	local Switch = ReadRoleValue( Target  , EM_RoleValue_Register1) --NPC身上的值
	local R = ReadRoleValue( Target , EM_RoleValue_Register2)
	Designlog( Owner , 361 , "Lv = "..Lv.."  SubLv = "..SubLv.." Game Start" ) 
--	DebugMsg( 0, 0,"R="..R)
	if R == 0 then
		if CountBodyItem( Owner , 203038) >= 30 then
 			ScriptMessage( Owner, Owner , 0 ,"[SC_120992_START]", 0)
			DelBodyItem( Owner , 203038 , 30 )
			SetFlag( Owner , 548115, 1) --活動完成每日旗標
			AddBuff( Owner , BuffID , 9 , -1) --加上判斷失敗次數的BUFF，先給10層
			AddBuff( Owner , 624483 , 0, -1 ) --BUFF消失後，顯示獎勵領取訊息
			Lua_na_FM_begin1()		
		else
			CloseSpeak( Owner)
 			ScriptMessage( Owner, Owner , 1, "[SC_BUY_TOKEN]" , 0 )
		end
	else
		Lua_na_FM_begin1()			
	end		
end

function Lua_na_FM_begin1()
	local Owner = OwnerID() --玩家
	local Target = TargetID() --NPC
	local Switch = ReadRoleValue( Target , EM_RoleValue_Register1 ) -- Switch
	local R = ReadRoleValue( Target , EM_RoleValue_Register2 ) --任務NPC上面記錄的遊戲階段，初始為0
	WriteRoleValue( Target , EM_RoleValue_Register2 , R+1)
	local NewR = ReadRoleValue( Target , EM_RoleValue_Register2)

	CloseSpeak( Owner)	
	if Switch == 1 then --如果活動進行中
		ScriptMessage( Owner , Owner , 1 , "[SC_120993_ROUND][$SETVAR1="..NewR.."]", C_SYSTEM ) 
		StartClientCountDown(Owner, 20, 0, 0, 0, 1, "[SC_120993_START_MES]")
 		----第1~3 是找出多出來的家具
		if NewR == 1 or NewR == 2 or NewR  == 3 then -- 
			ScriptMessage(Owner ,Owner , 2 , "[SC_120993_GAMETYPE1_1]",0)
			BeginPlot( Target , "Lua_na_FindMistake_Q1",0)
			---第4~6 是位置移動的家具
		elseif NewR  == 4 or NewR  == 5 or NewR == 6 then
			ScriptMessage(Owner ,Owner , 2 , "[SC_120993_GAMETYPE3_1]",0)
			BeginPlot( Target , "Lua_na_FindMistake_Q3",0)
		----第7~9 外型改變的家具
		elseif NewR  == 7 or NewR == 8 or NewR  == 9 then
			ScriptMessage(Owner ,Owner , 2 , "[SC_120993_GAMETYPE2_1]",0)
			BeginPlot( Target , "Lua_na_FindMistake_Q2",0)
		end
		WriteRoleValue( Target , EM_RoleValue_Register1 , 3 )  --關閉莉莉亞的對話
	end
end




function Lua_na_FindMistake_obj()  --莉莉亞消失之後，產生的隱藏物件，用來作為判斷玩家是否提早找出所有的答案
	local Owner = OwnerID()
	local OrgID = ReadRoleValue(  Owner , EM_RoleValue_OrgID)
	local RoomID = ReadRoleValue( Owner , EM_RoleValue_RoomID )
	local Lylia = Role:new( Owner )  -- 取得莉莉亞X.Y.Z.Dir值
	local BaseX = Lylia :X()
 	local BaseY = Lylia :Y();
 	local BaseZ = Lylia :Z();
	local BaseDir = Lylia:Dir();
	local Obj = CreateObj( 120994 , BaseX, BaseY, BaseZ, BaseDir, 1 ) --在莉莉亞座標 X.Y.Z.Dir 創立物件
	SetModeEx( Obj , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( Obj , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( Obj , EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( Obj , EM_SetModeType_Mark, false )--標記
	SetModeEx( Obj , EM_SetModeType_Move, false )--移動
	SetModeEx( Obj , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( Obj , EM_SetModeType_HideName, false )--名稱
	SetModeEx( Obj , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( Obj , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( Obj , EM_SetModeType_Drag , false )--阻力
	SetModeEx( Obj , EM_SetModeType_Show, false )--顯示
	WriteRoleValue( Obj , EM_RoleValue_Register9 , Owner) --讓隱藏物件記得莉莉亞
	AddToPartition( Obj ,  RoomID) -- 建立隱藏物件，檢查答題狀況
	Sleep(10)
	Hide(Owner) --隱藏莉莉亞
end




---------------------------------------------------------
--檢查答案是否被找到的隱藏物件
---------------------------------------------------------
function Lua_na_FindMistake_obj1()
	local Owner = OwnerID()
	local Lylia = ReadRoleValue ( Owner , EM_RoleValue_Register9 )
	local Player = ReadRoleValue( Lylia , EM_RoleValue_Register10) --讀取玩家
	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID ) 
	local Time = 0
--	Say( Player, "Player is me? ")
	while true do	
		local Answer = {}
		local allNPC = SearchRangeNPC( Owner , 700) --
		for i = 0 , #allNPC do --
			if ReadRoleValue ( allNPC[i] , EM_RoleValue_Register1 ) == 2 then
				table.insert( Answer , allNPC[i] )
			end
		end
		
		if #Answer < 1 then  --所有答案已經被找出來
			ClockClose(Player)
			CancelBuff( Player , 622634 )	 --放大鏡技能刪除
			Lua_na_FindMistake_DelAll()
			sleep(10)
			Show(Lylia , RoomID)
			ScriptMessage( Player , Player , 2 ,"[SC_120993_END3]" ,0) --向莉莉亞回報辨識的結果
			if ReadRoleValue( Lylia , EM_RoleValue_Register1) == 3 then
				WriteRoleValue( Lylia , EM_RoleValue_Register1 , 1 )  --開啟莉莉亞的對話
			end
			DelObj( Owner)
			local Score = ReadRoleValue( Player , EM_LuaValueFlag_UseItem40 )
		--	Say( Player , "Score = "..Score )
			local PlayerLv = ReadRoleValue( Player , EM_RoleValue_LV) 
			if Score >= 4000 and Score < 5000 and PlayerLv >= 50 then 
				GiveBodyItem( Player , 201014 , 1 ) --大師萬能修理鎚
				GiveBodyItem( Player , 203487 , 1 ) --魔幻寶盒能量1點
			elseif Score >= 6000 and Score < 7000 then
				local UI = ReadRoleValue( Player , EM_LuaValueFlag_UseItem45)
				WriteRoleValue( Player, EM_LuaValueFlag_UseItem45 , UI +1 ) --通過第六關的計次
				ScriptMessage( Player, Player , 2 , "[SC_120993_10]", 0 )
			end
		end	

		if FN_CountBuffLevel( Player , 624295) < 0 then --玩家的辨識失敗度已經用完
			CancelBuff( Player , 624306 )					
			WriteRoleValue( Lylia , EM_RoleValue_Register1, 0 ) -- 莉莉亞，結束活動
			ClockClose(Player)
			CancelBuff( Player , 622634 )	 --放大鏡技能刪除
			Lua_na_FindMistake_DelAll()
			sleep(10)
			Show(Lylia , RoomID)
			ScriptMessage( Player , Player , 2 ,"[SC_120993_END3]" ,0) --向莉莉亞回報辨識的結果
			local Score = ReadRoleValue( Player , EM_LuaValueFlag_UseItem40 )
		--	Say( Player , "Score = "..Score )		
		end
		if Time == 31 then
			local Y = FN_CountBuffLevel( Player , 624295) --挑戰次數
			ScriptMessage( Player, Player, 1 ,"[SC_120993_MISS][$SETVAR1="..#Answer.."]" , 0 )
			if #Answer < Y then
				CancelBuff_NoEvent( Player , 624295 )
				AddBuff( Player, 624295 , (Y - #Answer) , -1 )
			--	Say( Owner , #Answer )
			else
				CancelBuff( Player , 624295 )	
				CancelBuff( Player , 624306 )					
				WriteRoleValue( Lylia , EM_RoleValue_Register1, 0 ) -- 莉莉亞，結束活動
			end
			local Score = ReadRoleValue( Player , EM_LuaValueFlag_UseItem40 )
		--	Say( Player , "Score = "..Score )	
		end		
		sleep(10)
		Time = Time +1
	end
end




-----------------------------------------
--使用技能
-----------------------------------------
function Lua_na_FM_checkobj() --使用前檢查，不可對自己使用
	local Owner = OwnerID()
	local Target = TargetID()
	if Owner == Target or CheckBuff( Owner , 624295) == false then
		ScriptMessage( Owner , Owner , 1 , "[SC_204592_1]" , 0 )
		return false
	else
		return true
	end
end 


function Lua_na_FM_checkobj_1() 
	local Owner = OwnerID()
	local Target = TargetID()
	local CheckReg = ReadRoleValue( Target , EM_RoleValue_Register1)
	local Score = ReadRoleValue( Owner , EM_LuaValueFlag_UseItem40 )
	local ExtraPoint = 624306	--額外加分用BUFF
	local Mistake = 624295  --錯誤容許次數
	local StringTable1 = {	[1] = "[SC_FINDMISTAKE_CHECK_1]" ,
				[2] = "[SC_FINDMISTAKE_CHECK_2]" ,
				[3] = "[SC_FINDMISTAKE_CHECK_3]" ,
				[4] = "[SC_FINDMISTAKE_CHECK_4]" , } --答對的對話
	local StringTable2 = {	[1] = "[SC_FINDMISTAKE_CHECK_5]" ,
				[2] = "[SC_FINDMISTAKE_CHECK_6]" ,
				[3] = "[SC_FINDMISTAKE_CHECK_7]" ,
				[4] = "[SC_FINDMISTAKE_CHECK_8]" , } --答錯的對話

--	if Owner ~= Target then
		if CheckReg == 2 then --答對，加分
			local X = FN_CountBuffLevel( Owner , ExtraPoint ) -- --1層等於0 ， 沒有等於-1
			SysCastSpellLv( Target , Owner , 850926 , 0)
			if X >= 0  then   --如果玩家連續答對
				AddBuff( Owner , ExtraPoint, 0,-1)
				X = (X+1)*1 --額外加分用，每層BUFFx1分，全部正確將會得到780分
				DebugMsg( 0,0, "ExtraPoint ="..X) 
				WriteRoleValue( Owner , EM_LuaValueFlag_UseItem40 , Score+1+X)				
			else
				WriteRoleValue( Owner , EM_LuaValueFlag_UseItem40 , Score+1)
				AddBuff( Owner , ExtraPoint, 0 ,-1)
			end
			DelObj( Target)
			local RanMes = DW_Rand( #StringTable1)
			ScriptMessage( Owner , Owner , 1 , StringTable1[RanMes] , C_SYSTEM ) 
	--	SC_FINDMISTAKE_CHECK_1~4 答對
		else --答錯
			local Y = FN_CountBuffLevel( Owner , Mistake ) -- --1層等於0 ， 沒有等於-1	
			if Y == 0 then
				CancelBuff( Owner , Mistake)
			else	
				CancelBuff_NoEvent( Owner , Mistake)
				AddBuff( Owner , Mistake , Y -1 , -1)
			end
			CancelBuff( Owner , ExtraPoint)		
			local RanMes = DW_Rand( #StringTable2)
			ScriptMessage( Owner , Owner , 1 , StringTable2[RanMes] , 0 ) 
		end
--	else
--		return false
--	end
	local new = ReadRoleValue( Owner , EM_LuaValueFlag_UseItem40 )
--	say( Owner , "ScoreNew ="..new)
end




---------------------------------------------
--刪除家具NPC
---------------------------------------------
function Lua_na_FindMistake_DelAll() 
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Count = SetSearchAllNPC( RoomID )
	local Obj
	local F = {  	111915, 111916, 111917, 113879, 113885, 113651, 111919, 111921, 118394, 118395, 
			118396, 118397, 118398, 118399, 118400, 118401, 118402, 113847, 113848, 113849, 
			113855, 113856, 113857, 113858, 113859, 113860, 113861, 113862, 114156, 114157, 
			114165, 113912, 113707, 113708, 113738, 113739, 113737, 113740,
			111857, 111860, 111862, 113894, 113895, 113882, 113883, 113890, 113891, 113892, 
			114143, 114144, 114145, 114146, 114147, 114153, 114154, 114155, 114196, 114197, 
			114198, 114152, 114148, 114149, 114151	 }  --刪除所有家具

	if  Count ~= 0 then
		for i=1 , Count , 1 do
		local ID = GetSearchResult()
			Obj=Role:New(ID)
			if Obj:IsNPC() == true then
				local Name = ReadRoleValue( ID , EM_RoleValue_OrgID )--確認所有NPC的編號
				for j = 1 , table.getn( F ) , 1 do
					if Name == F[j] then  --若為陣列中的值
						Delobj( ID) --阻擋牆
					end
				end
			end
		end
	end
end


 --顯示答案的特效
function Lua_na_showans()
	local Owner = OwnerID()
	sleep(310)
	addbuff( Owner , 622846, 1 , 5 )
	Sleep(50)
	Lua_na_FindMistake_DelAll()
end




--------------------------------
--測試指令
--------------------------------
function Lua_na_FM_addbuff()
	AddBuff( OwnerID() , 624295 , 9 , -1 )
end

function Lua_361_reset()
	local Owner = OwnerID()
	SetFlag(Owner , 548115 , 0 )
	SetFlag(Owner , 548116 , 0 )
	WriteRoleValue( Owner,EM_LuaValueFlag_UseItem40, 0 )
end

function Lua_361_check()
	local Owner = OwnerID()
	local Score = ReadRoleValue( Owner,EM_LuaValueFlag_UseItem40 )
	Say( Owner , "Score = "..Score)
	local Perfect = ReadRoleValue( Owner, EM_LuaValueFlag_UseItem45 )
	Say( Owner , "PassLv6= "..Perfect )
end


function Lua_361_Score(Score)
	WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem40, Score)
end

function Lua_na_361_cheat()
	local Owner = OwnerID()
--	local RoomID = ReadRoleValue( Owner , EM_RoleValue_RoomID )
	local Count = SearchRangeNPC( Owner , 700)
	local Obj = {}
	local F = {  	111915, 111916, 111917, 113879, 113885, 113651, 111919, 111921, 118394, 118395, 
			118396, 118397, 118398, 118399, 118400, 118401, 118402, 113847, 113848, 113849, 
			113855, 113856, 113857, 113858, 113859, 113860, 113861, 113862, 114156, 114157, 
			114165, 113912, 113707, 113708, 113738, 113739, 113737, 113740,
			111857, 111860, 111862, 113894, 113895, 113882, 113883, 113890, 113891, 113892, 
			114143, 114144, 114145, 114146, 114147, 114153, 114154, 114155, 114196, 114197, 
			114198, 114152, 114148, 114149, 114151	 }  --所有家具
	for i = 0 , #Count do
		for j = 1 , #F do
			local OrgID = ReadRoleValue( Count[i] , EM_RoleValue_OrgID )
			if OrgID == F[j]  then
			table.insert( obj, Count[i])
			end
		end
	end

	for i = 1 , #obj do
		if ReadRoleValue( obj[i] , EM_RoleValue_Register1 ) == 2 then
			addbuff( obj[i] , 620015, 1 , -1 )
		end
	end
end

function Lua_361_title_test(Count)
	local Owner = OwnerID()
	WriteRoleValue( Owner , EM_LuaValueFlag_UseItem45 , Count)
	local C = ReadRoleValue( Owner , EM_LuaValueFlag_UseItem45)
	DebugMsg( 0 , 0 , "PassLv6 = ".. C )
end

function Lua_361_Round(R)
	local Owner = OwnerID()
	local Lylia = 120993
	local NPC = SearchRangeNPC( Owner , 300)
	local Score = ReadRoleValue( Owner, EM_LuaValueFlag_UseItem40)
	for i = 0 , #NPC do
		if ReadRoleValue( NPC[i] , EM_RoleValue_OrgID) == Lylia then
			WriteRoleValue(NPC[i] , EM_RoleValue_Register2 , R )
			WriteRoleValue( Owner , EM_LuaValueFlag_UseItem40 , (R*1000)+Score )
			local NewR = ReadRoleValue( Owner , EM_LuaValueFlag_UseItem40)
			Say( NPC[i] , "Round = "..R )
			Say( Owner ,  " Now Score is "..NewR )
			break
		end
	end
end



-------------------------
--家具轉蛋
-------------------------
function Lua_242761() --精緻家具轉蛋
	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 727036 , 1 } }
	return BaseTressureProc(   itemset , 1 )
end

function Lua_242762() --節慶家具轉蛋
	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 727037 , 1 } }
	return BaseTressureProc(   itemset , 1 )
end