--/gm ? createFlag 780777 0 
--/gm ? delflaglist 780777

--NPC的Register1 是記錄玩家的通關等級
--NPC的Register2 是記錄玩家全破的次數
--NPC的Register3 是記錄玩家生存時間
--NPC的Register4 是記錄玩家現在的房間號碼
--NPC的Register5 是記錄玩家現在是否在戰鬥中，0為未開始遊戲，1為戰鬥中，2為休息中，3為結束
--NPC的Register6 是記錄玩家有沒有使用增幅魔石
function Lua_AncientDreamSpace_DoorInSet()
	SetSpeakDetail(OwnerID(),"[ADS_DOOR]")
	
	AddSpeakOption(OwnerID(), TargetID(), "[ADS_DOOR_OPTION]", "Lua_AncientDreamSpace_DoorIN", 0) --正常進入夢境
end

function Lua_AncientDreamSpace_DoorIn()
	ChangeZone( OwnerID(), 356 , -1 , 4795, 8.5, 907, 269)
end

function Lua_AncientDreamSpace_DoorOutSet()
	SetPlot(OwnerID() ,"touch","Lua_AncientDreamSpace_DoorOut",150) 
end

function Lua_AncientDreamSpace_DoorOut()
	ChangeZone( OwnerID(), 2 , 0 , -1343, -370, 2117, 359)
end

function Lua_AncientDreamSpace_NPC_creat()
	WriteRoleValue(OwnerID(),EM_RoleValue_Register1,0)
	WriteRoleValue(OwnerID(),EM_RoleValue_Register2,0)
	WriteRoleValue(OwnerID(),EM_RoleValue_Register3,0)
	WriteRoleValue(OwnerID(),EM_RoleValue_Register4,0)
	WriteRoleValue(OwnerID(),EM_RoleValue_Register5,0)
	WriteRoleValue(OwnerID(),EM_RoleValue_Register6,0)
end

function Lua_AncientDreamSpace_intro()
	local RoomID = ReadRoleValue( TargetID() , EM_RoleValue_RoomID)
	if CheckFlag( OwnerID()  , 544419 ) == TRUE then	--確認玩家是否今天已經玩過
		SetSpeakDetail( OwnerID(), "[ADS_HAVEPLAY]"   )	--已經玩過
	else
		SetSpeakDetail( OwnerID(), "[ADS_INTRO]"   )
		AddSpeakOption(OwnerID(), TargetID(), "[ADS_STRING01_1]", "Lua_AncientDreamSpace_Enter01", 0) --正常進入夢境
		if ReadRoleValue(TargetID() , EM_RoleValue_Register5) == 0 then
			AddSpeakOption(OwnerID(), TargetID(), "[ADS_STRING01_2]", "Lua_AncientDreamSpace_Enter02", 0) --使用增幅魔石後進入夢境
		end
		AddSpeakOption(OwnerID(), TargetID(), "[ADS_STRING02]", "Lua_AncientDreamSpace_Rule", 0) --
	end
	--固定清掉隊伍不在的人
	if ADSPartyMember ~= nil and ADSPartyMember[RoomID] ~= nil then
		for i=1,table.getn(ADSPartyMember[RoomID]) do
			if ADSPartyMember[RoomID][i] ~= nil and CheckID(ADSPartyMember[RoomID][i]) ==FALSE then
				table.remove(ADSPartyMember[RoomID],i)
			end
		end
	end
end

function Lua_AncientDreamSpace_Rule()
	SetSpeakDetail( OwnerID(), "[ADS_RULE]"   )
	AddSpeakOption(OwnerID(), TargetID(), "[ADS_STRING03]", "Lua_AncientDreamSpace_intro", 0)
end

function Lua_AncientDreamSpace_Enter01() --正常進入夢境
	local NPC = TargetID()
	WriteRoleValue(NPC,EM_RoleValue_Register6,0)
	Lua_AncientDreamSpace_Start(TargetID(),OwnerID())
end

function Lua_AncientDreamSpace_Enter02() --使用增幅魔石後進入夢境
	local NPC = TargetID()
	if CountBodyItem( OwnerID(), 208680 ) >= 1 then
		WriteRoleValue(NPC,EM_RoleValue_Register6,1)	
		Lua_AncientDreamSpace_Start(TargetID(),OwnerID())
	else
		ScriptMessage( OwnerID(), OwnerID(), 1, "[ADS_STRING14]", 0 )
		CloseSpeak(OwnerID())
	end
end

function Lua_AncientDreamSpace_Start(NPC,Player)
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID)
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID)
	--local NPC = TargetID()
	--local Player = OwnerID()
	local TempID
	local PartyNum = GetPartyID(Player , -1)	--讀取玩家隊伍人數
	--檢查玩家隊伍
	CloseSpeak(Player)
	if PartyNum == 0 then
		ScriptMessage(OwnerID(), OwnerID() , 1 , "[ADS_NOTINPARTY]" , C_SYSTEM ) --你不在一個隊伍中
		return
	else
		if ReadRoleValue(NPC , EM_RoleValue_Register5) == 0 then
			for i=1,PartyNum do
				TempID = GetPartyID(OwnerID() , i )
				
				if ReadRoleValue( TempID , EM_RoleValue_ZoneID) ~= ZoneID or ReadRoleValue( TempID , EM_RoleValue_RoomID) ~= RoomID then
					ScriptMessage(OwnerID(), OwnerID() , 1 , "[ADS_PARTYNOTREADY]" , C_SYSTEM ) --你的隊伍成員尚未到齊
					return
				elseif CheckFlag( TempID  , 544419 ) == TRUE then	--確認玩家是否今天已經玩過
					ScriptMessage(OwnerID(), OwnerID() , 1 , "[ADS_CHECKFLAG]" , C_SYSTEM ) --隊伍當中有人身上所累積的夢境能量波動已到達安全標準
					return
				end
			end
		end
	end
	--檢查通過之後
	--建立用來計算存活次數的全域變數
	if ADSSurviveTimes == nil then
		ADSSurviveTimes = {}
	end
	if ADSSurviveTimes[RoomID] == nil then
		ADSSurviveTimes[RoomID] = 3
	end
	--建立記錄隊伍的全域變數
	if ADSPartyMember == nil then
		ADSPartyMember = {}
	end
	if ADSPartyMember[RoomID] == nil then
		ADSPartyMember[RoomID] = {}
	end
	--建立記錄當前版本角色最高等級的全域變數
	if ADSPlayerMaxLV == nil then
		ADSPlayerMaxLV = ReadRoleValue( Player, EM_RoleValue_MaxLv )
	end
	--塞入Table
	if ReadRoleValue(NPC , EM_RoleValue_Register5) == 0 then
		--判斷玩家是否有用增幅魔石來增加時間
		if ReadRoleValue(NPC , EM_RoleValue_Register6) == 1 then
			DelBodyItem(OwnerID(),208680,1)
			WriteRoleValue(NPC,EM_RoleValue_Register3,3600)
		else
			WriteRoleValue(NPC,EM_RoleValue_Register3,1800)
		end
		--
		for i=1,PartyNum do
			TempID= GetPartyID(Player , i )	--讀取指定玩家的第i個隊友
			table.insert(ADSPartyMember[RoomID],TempID)
			Lua_AncientDreamSpace_PlayerSet(TempID,NPC)
			CloseSpeak(TempID)	--把所有人開啟的視窗都關掉免的產生問題
		end
		Lua_AncientDreamSpace_Teleport(ADSPartyMember[RoomID],NPC)	--群體傳送
	else
		if CheckFlag(Player,544419) == FALSE then
			table.insert(ADSPartyMember[RoomID],Player)
			Lua_AncientDreamSpace_PlayerSet(Player,NPC)
			--
			if ReadRoleValue(NPC , EM_RoleValue_Register5) == 1 then	--檢查是否戰鬥中
				SetSpeakDetail( OwnerID(), "[ADS_PARTYINFIGHT]")
			elseif ReadRoleValue(NPC , EM_RoleValue_Register5) == 2 then --檢查是否休息中
				Lua_AncientDreamSpace_Teleport(Player,NPC)	--單體傳送
			end
		end
	end

	--
	if ReadRoleValue(NPC , EM_RoleValue_Register1) == 0 then
		BeginPlot(NPC,"Lua_AncientDreamSpace_Main",0)
	end
end

function Lua_AncientDreamSpace_Main()
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID)
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID)
	local NPC = OwnerID()
	local Player = TargetID()
	local ADSCheck = TRUE
	local TempX
	local TempY
	local TempZ
	--=========主要的進行，從頭開始打才跑這段，進入迴圈=========--
	if ReadRoleValue(NPC , EM_RoleValue_Register1) == 0 then
		BeginPlot( NPC,"Lua_AncientDreamSpace_NPCSet",0)	--開始生存時間倒數
		while TRUE do
			ADSCheck = Lua_AncientDreamSpace_Spawn(NPC)
			if ADSCheck == TRUE then
				for i=1,table.getn(ADSPartyMember[RoomID]) do	--更新計分板
					Timer = ReadRoleValue( NPC , EM_RoleValue_Register3)
					TempX = ReadRoleValue(NPC , EM_RoleValue_Register1) 
					TempY = ReadRoleValue(NPC , EM_RoleValue_Register2)
					TempZ = TempX+TempY*30
					SetSmallGameMenuType( ADSPartyMember[RoomID][i] , 10 , 1 )
					SetSmallGameMenuStr( ADSPartyMember[RoomID][i] , 10 , 1 , "[ADS_BOARD_STATE][$SETVAR1="..ADSSurviveTimes[RoomID].."]" )
					SetSmallGameMenuStr( ADSPartyMember[RoomID][i] , 10 , 2 , "[ADS_BOARD_SCORE][$SETVAR1="..TempZ.."]" )
					ClockOpen( ADSPartyMember[RoomID][i] , EM_ClockCheckValue_15  , Timer , Timer , 0  ,"Lua_Clockending"  , "Lua_Clockending" );--時間以秒算
				end

				Lua_AncientDreamSpace_Teleport(ADSPartyMember[RoomID],NPC)
			elseif ADSCheck == FALSE then
				WriteRoleValue(NPC,EM_RoleValue_Register5,3) --記錄玩家現在是否在戰鬥中，3為結束
				Lua_AncientDreamSpace_END(NPC)
				return
			end
			Sleep(50)	--休息時間
--			Sleep(100)
		end
	end
end
--=======================================================================================--
--									玩者設定
--=======================================================================================--
function Lua_AncientDreamSpace_PlayerSet(Player,NPC)
	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID)
	local Timer = ReadRoleValue( NPC , EM_RoleValue_Register3)
	local TempX = ReadRoleValue(NPC , EM_RoleValue_Register1)
	local TempY = ReadRoleValue(NPC , EM_RoleValue_Register2)
	local TempZ = TempX+TempY*30
	if CheckFlag(Player,544419) == FALSE then
		SetFlag( Player, 544419 , 1 )
		AddBuff(Player,508008,0,-1)
		SetSmallGameMenuType( Player , 10 , 1 ) --記分板，填1為創造，填2為關閉
		SetSmallGameMenuStr( Player , 10 , 1 , "[ADS_BOARD_STATE][$SETVAR1="..ADSSurviveTimes[RoomID].."]" )	--隊員死亡次數
		SetSmallGameMenuStr( Player , 10 , 2 , "[ADS_BOARD_SCORE][$SETVAR1="..TempZ.."]" )	--突破層數
		ClockOpen( Player , EM_ClockCheckValue_15  , Timer , Timer , 0  ,"Lua_Clockending"  , "Lua_Clockending" );--時間以秒算
	end
end
-- INSTANCE_SCORE_10 跟 INSTANCE_STATE_10
--=======================================================================================--
--									NPC時鐘
--=======================================================================================--
function Lua_AncientDreamSpace_NPCSet()
	local NPC = OwnerID()
	local RoomID = ReadRoleValue( NPC , EM_RoleValue_RoomID)
	local Timer = ReadRoleValue( NPC , EM_RoleValue_Register3)
	--
	while TRUE do
		Sleep(10)
		--
		if Timer == 0 then
			return
		else
			Timer = Timer -1
			WriteRoleValue(NPC,EM_RoleValue_Register3,Timer)
			if ReadRoleValue(NPC,EM_RoleValue_Register5) == 3 then
				return
			end
		end
	end
end
--=======================================================================================--
--									傳送到房間的函式
--=======================================================================================--
function Lua_AncientDreamSpace_Teleport(Party,NPC)
	local ZoneID = ReadRoleValue( NPC , EM_RoleValue_ZoneID)
	local RoomID = ReadRoleValue( NPC , EM_RoleValue_RoomID)
	--傳送
	if type(Party) == "table" then	--群體
		local NUM = DW_Rand(4)	--隨機選要把玩家傳送到哪個房間
		WriteRoleValue(NPC , EM_RoleValue_Register4, NUM)	--NPC的Register4是記錄玩家現在的房間號碼
		--
		for i=1,table.getn(Party) do
			if Party[i] ~= nil then
				if ReadRoleValue( Party[i] , EM_RoleValue_ZoneID) == ZoneID then
					AddBuff( Party[i] ,503693 ,1 , 1 )
					FN_ChangeZoneByFlag(Party[i] , 780777 ,NUM)
				else
					table.remove(Party,i)
				end
			end
		end
	else	--單體
		local NUM = ReadRoleValue(NPC,EM_RoleValue_Register4)
		AddBuff( Party ,503693 ,1 , 1 )
		FN_ChangeZoneByFlag(Party, 780777 ,NUM)		
	end
end

--=======================================================================================--
--									產怪函式
--=======================================================================================--
function Lua_AncientDreamSpace_Spawn(NPC)
	local RoomID = ReadRoleValue( NPC , EM_RoleValue_RoomID)
	local ADS_Level = ReadRoleValue(NPC , EM_RoleValue_Register1)
	local ADS_HARD = ReadRoleValue( NPC , EM_RoleValue_Register2)
	local MonsterGroup = {}
	local MonsterID
	local TempX
	local TempY
	local RandX
	local FlagNum
	local RoomNum = ReadRoleValue(NPC,EM_RoleValue_Register4)
	local MonsterTable = {[1] = {104827,104828,104829};
				[2] = {104830,104831,104832};
				[3] = {104833,104834,104835};
				[4] = {104836,104837,104838};
				[5] = {104839,104840,104841};	
				[6] = {104827,104828,104829,104830,104831,104832,104833,104834,104835,104836,104837,104838,104839,104840,104841};
				}--這邊記錄要出的怪物↑
	local BossTable = {104821,104822,104823,104824,104825,104826} --記錄要出的王

	--計算並寫入玩家現在的層數，NPC的Register1是記錄玩家的通關等級
	ADS_Level = ADS_Level+1
	--這邊是計算玩家全破之後的新一輪難度
	if ADS_Level >= 31 then 
		ADS_Level = 1
		ADS_HARD = ADS_HARD+1
	end --如果是第31層
	WriteRoleValue(NPC , EM_RoleValue_Register1, ADS_Level)	--寫入通關等級
	WriteRoleValue(NPC , EM_RoleValue_Register2, ADS_HARD)	--寫入破關次數
	--NPC的Register5是記錄玩家現在是否在戰鬥中，0為未開始遊戲，1為戰鬥中，2為休息中
	WriteRoleValue(NPC , EM_RoleValue_Register5, 1)	
	--
	if ADS_Level%5 == 0 then --出王↓
		TempX = ADS_Level/5 --決定要用哪一個強度list
		FlagNum = (RoomNum*10)+1	--房間FLAG是1~9，EX 11就是指1號房間裡頭的其他位置
--		MonsterID = Lua_DW_CreateObj( "flag" , BossTable[TempX] , 780777 , FlagNum , 1 , 1 )
		local fx, fy, fz, fdir = DW_Location( 780777, FlagNum )
		MonsterID = CreateObj( BossTable[TempX], fx, fy, fz, fdir, 1 )
		WriteRoleValue( MonsterID, EM_RoleValue_Lv, ADSPlayerMaxLV )
		AddToPartition( MonsterID, RoomID )

		if ADS_HARD >= 1 then AddBuff(MonsterID,508010,ADS_HARD-1,-1) end
		table.insert(MonsterGroup,MonsterID)
	else	--出小怪↓

		TempX = (math.floor(ADS_Level/5))+1 --決定要用哪一個強度list
		for i=1,5 do
			TempY = table.getn(MonsterTable[TempX])
			RandX = DW_Rand(TempY)	--從list裡頭抓怪出來產
			FlagNum = (RoomNum*10)+i	--判定要用哪個房間的旗子來生怪
			if type(MonsterTable[TempX][RandX]) == "table" then
				for j=1,table.getn(MonsterTable[TempX][RandX]) do
--					MonsterID = Lua_DW_CreateObj( "flag" , MonsterTable[TempX][RandX][j] , 780777 , FlagNum , 1 , 1 )
					local fx, fy, fz, fdir = DW_Location( 780777, FlagNum )
					MonsterID = CreateObj( MonsterTable[TempX][RandX][j], fx, fy, fz, fdir, 1 )
					WriteRoleValue( MonsterID, EM_RoleValue_Lv, ADSPlayerMaxLV )
					AddToPartition( MonsterID, RoomID )
					table.insert(MonsterGroup,MonsterID)
				end
			else
--				MonsterID = Lua_DW_CreateObj( "flag" , MonsterTable[TempX][RandX] , 780777 , FlagNum , 1 , 1 )
				local fx, fy, fz, fdir = DW_Location( 780777, FlagNum )
				MonsterID = CreateObj( MonsterTable[TempX][RandX], fx, fy, fz, fdir, 1 )
				WriteRoleValue( MonsterID, EM_RoleValue_Lv, ADSPlayerMaxLV )
				AddToPartition( MonsterID, RoomID )
				table.insert(MonsterGroup,MonsterID)
			end
			if ADS_HARD >= 1 then AddBuff(MonsterID,508011,ADS_HARD-1,-1) end
		end
	end

	--

	while TRUE do	--怪物創造出來之後，每秒檢查
		if ADSSurviveTimes[RoomID] > 4 or ReadRoleValue( NPC , EM_RoleValue_Register3) == 0 then
			for i=1,table.getn(MonsterGroup) do

					if MonsterGroup[i] ~= nil then
						local DelGroup= SearchRangeNPC ( MonsterGroup[i] , 500 )
						for j=0,table.getn(DelGroup) do

							if DelGroup[j] ~= nil and ReadRoleValue(DelGroup[j],EM_RoleValue_OwnerGUID) ==-1 then
								NPCDead( DelGroup[j],DelGroup[j])
								Hide(DelGroup[j])
								DelObj(DelGroup[j])
							end
						end
						--
						--DelObj(MonsterGroup[i])
					end
			end
			--特別處理--
			for i=1,table.getn(ADSPartyMember[RoomID]) do
					local Player = ADSPartyMember[RoomID][i]
					local BuffTable = {508153,508013,508158}
					for v=1,table.getn(BuffTable) do
						if CheckBuff(Player,BuffTable[v]) == TRUE then
							CancelBuff(Player,BuffTable[v])
						end
					end
			end
			-------------
			return FALSE	--如果用光了機會，回傳FALSE
		else
			if table.getn(MonsterGroup) == 0 then --檢查怪物死光光
				WriteRoleValue(NPC , EM_RoleValue_Register5, 2)	--NPC的Register5是記錄玩家現在是否在戰鬥中，0為未開始遊戲，1為戰鬥中，2為休息中
				for i=1,table.getn(ADSPartyMember[RoomID]) do
					local Player = ADSPartyMember[RoomID][i]
					ScriptMessage(Player, Player , 1 , "[ADS_PASS][$SETVAR1="..ADS_Level+(ADS_HARD*30).."]" , C_SYSTEM )
				end
				Sleep(50)
				return TRUE	--死光了回傳TRUE
			else
				for i=1,table.getn(MonsterGroup) do
					if MonsterGroup[i] ~= nil then
						if CheckID(MonsterGroup[i]) == FALSE then
							table.remove(MonsterGroup,i)
--						elseif ReadRoleValue( MonsterGroup[i],EM_RoleValue_IsDead) == 1 then
--							DelObj(MonsterGroup[i])
--							table.remove(MonsterGroup,i)
						end
					end
				end
			end
		end
		--
		Sleep(10)
	end
end

--=======================================================================================--
--									結束的函式
--=======================================================================================--
function Lua_AncientDreamSpace_END(NPC)
	local RoomID = ReadRoleValue( NPC , EM_RoleValue_RoomID)
	local ZoneID = ReadRoleValue( NPC , EM_RoleValue_ZoneID)
	local ADS_Level = ReadRoleValue(NPC , EM_RoleValue_Register1)
	for i=1,table.getn(ADSPartyMember[RoomID]) do
		local Player = ADSPartyMember[RoomID][i]
		SetSmallGameMenuType( Player , 10 , 2 )
		ScriptMessage(Player, Player , 0 , "[ADS_END]" , C_SYSTEM )
		ClockClose( Player)
		CancelBuff_NoEvent(Player,508008)
	end
	Sleep(100)
	for i=1,table.getn(ADSPartyMember[RoomID]) do
		if ReadRoleValue( ADSPartyMember[RoomID][i] , EM_RoleValue_ZoneID) == ZoneID then
			FN_ChangeZoneByFlag(ADSPartyMember[RoomID][i] , 780777 ,0)
		end
	end
	--
	WriteRoleValue(NPC,EM_RoleValue_Register1,0)
	WriteRoleValue(NPC,EM_RoleValue_Register2,0)
	WriteRoleValue(NPC,EM_RoleValue_Register3,0)
	WriteRoleValue(NPC,EM_RoleValue_Register4,0)
	WriteRoleValue(NPC,EM_RoleValue_Register5,0)
	WriteRoleValue(NPC,EM_RoleValue_Register6,0)
	ADSSurviveTimes[RoomID] = nil
	ADSPartyMember[RoomID] = nil
end

--=======================================================================================--
--									意志之壁觸發
--=======================================================================================--
function Lua_AncientDreamSpace_SurviveTimes()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID)
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID)
	local Player = OwnerID()
	local OnlineCheck = FALSE

	if ZoneID == 356 then
		for v=1,table.getn(ADSPartyMember[RoomID]) do
			if ADSPartyMember[RoomID][v] == Player then
				OnlineCheck = TRUE
				break
			end
		end
		if OnlineCheck == TRUE then
			if ADSSurviveTimes[RoomID] > 0 then
				ADSSurviveTimes[RoomID] = ADSSurviveTimes[RoomID] -1
			elseif ADSSurviveTimes[RoomID] == 0 then
				ADSSurviveTimes[RoomID] = 99
			end
			for i=1,table.getn(ADSPartyMember[RoomID]) do
				local TempID = ADSPartyMember[RoomID][i]
				ScriptMessage(TempID, TempID , 1 , "[ADS_DIE]" , C_SYSTEM )
				if ADSSurviveTimes[RoomID] >= 0 and ADSSurviveTimes[RoomID] < 4 then
					SetSmallGameMenuStr( TempID , 10 , 1 , "[ADS_BOARD_STATE][$SETVAR1="..ADSSurviveTimes[RoomID].."]" )	--隊員死亡次數
				end
			end
			--
			ScriptMessage(OwnerID(), OwnerID() , 1 , "[ADS_PRE_REVIVE]" , C_SYSTEM )
			AddBuff(OwnerID(),508239,0,3)
			Sleep(25)
			AddBuff(OwnerID(),508008,0,-1)
			ScriptMessage(OwnerID(), OwnerID() , 1 , "[ADS_REVIVE]" , C_SYSTEM )
		else
			for i=1,table.getn(ADSPartyMember[RoomID]) do
				if CheckID(ADSPartyMember[RoomID][i]) ==FALSE then
					table.remove(ADSPartyMember[RoomID],i)
				end
			end
			table.insert(ADSPartyMember[RoomID],Player)
			AddBuff(OwnerID(),508008,0,-1)
		end
	else
		SetSmallGameMenuType( Player , 10 , 2 )
	end
end

--=======================================================================================--
--									先遣者奸奇
--=======================================================================================--
function Lua_AncientDreamSpace_NPC115697()
	if CheckAcceptQuest(OwnerID(),426472)==true then
		LoadQuestOption(OwnerID())		
	end
	SetSpeakDetail( OwnerID(), "[ADS_NPC115697]" )
	AddSpeakOption(OwnerID(), TargetID(), "[ADS_STRING04_1]", "Lua_AncientDreamSpace_NPC115697_1_1", 0) --有沒有辦法去除我身上的夢境能量波動？
	AddSpeakOption(OwnerID(), TargetID(), "[ADS_STRING04_2]", "Lua_AncientDreamSpace_NPC115697_2_1", 0) --有沒有辦法讓我在夢境當中可以探尋更久？
end
--------------------------
function Lua_AncientDreamSpace_NPC115697_1_1()
	SetSpeakDetail( OwnerID(), "[ADS_NPC115697_1]" )
	AddSpeakOption(OwnerID(), TargetID(), "[ADS_STRING05_1]", "Lua_AncientDreamSpace_NPC115697_1_2", 0) --
	AddSpeakOption(OwnerID(), TargetID(), "[ADS_STRING05_2]", "Lua_AncientDreamSpace_NPC115697_1_4", 0) --
	AddSpeakOption(OwnerID(), TargetID(), "[ADS_STRING06]", "Lua_AncientDreamSpace_NPC115697_1_3", 0) --
end

function Lua_AncientDreamSpace_NPC115697_1_2()
	if CountBodyItem( OwnerID(), 208682 ) >= 20 then
		DelBodyItem( OwnerID(), 208682, 20 )
		Lua_AncientDreamSpace_NPC115697_1_5(OwnerID(),TargetID())
	else
		ScriptMessage( OwnerID(), OwnerID(), 1, "[ADS_STRING07]", 0 )
	end
	CloseSpeak(OwnerID())
end

function Lua_AncientDreamSpace_NPC115697_1_3()
	if CountBodyItem( OwnerID(), 207919 ) >= 2 then
		DelBodyItem( OwnerID(), 207919, 2 )
		Lua_AncientDreamSpace_NPC115697_1_5(OwnerID(),TargetID())
	else
		ScriptMessage( OwnerID(), OwnerID(), 1, "[ADS_STRING08]", 0 )
	end
	CloseSpeak(OwnerID())
end

function Lua_AncientDreamSpace_NPC115697_1_4()
	if CountBodyItem( OwnerID(), 208679 ) >= 4 then
		DelBodyItem( OwnerID(), 208679, 4 )
		Lua_AncientDreamSpace_NPC115697_1_5(OwnerID(),TargetID())
	else
		ScriptMessage( OwnerID(), OwnerID(), 1, "[ADS_STRING13]", 0 )
	end
	CloseSpeak(OwnerID())
end

function Lua_AncientDreamSpace_NPC115697_1_5(Player,NPC)
	ScriptMessage(Player, Player , 1 , "[ADS_NPC115697_3]" , C_SYSTEM )
	ScriptMessage(Player, Player , 0 , "[ADS_NPC115697_3]" , C_SYSTEM )
	SetFlag( Player, 544419 , 0 )
end
--------------------------
function Lua_AncientDreamSpace_NPC115697_2_1()
	SetSpeakDetail( OwnerID(), "[ADS_NPC115697_2]" )	--強化"意志之壁"的力量使持續時間延長
	AddSpeakOption(OwnerID(), TargetID(), "[ADS_STRING09_1]", "Lua_AncientDreamSpace_NPC115697_2_2", 0) --
	AddSpeakOption(OwnerID(), TargetID(), "[ADS_STRING09_2]", "Lua_AncientDreamSpace_NPC115697_2_4", 0) --
	AddSpeakOption(OwnerID(), TargetID(), "[ADS_STRING10]", "Lua_AncientDreamSpace_NPC115697_2_3", 0) --
end

function Lua_AncientDreamSpace_NPC115697_2_2()
	if CountBodyItem( OwnerID(), 208682 ) >= 15 then
		DelBodyItem( OwnerID(), 208682, 15 )
		GiveBodyItem(OwnerID(),208680,1)
	else
		ScriptMessage( OwnerID(), OwnerID(), 1, "[ADS_STRING07]", 0 )
	end
	CloseSpeak(OwnerID())
end

function Lua_AncientDreamSpace_NPC115697_2_3()
	if CountBodyItem( OwnerID(), 207919 ) >= 1 then
		DelBodyItem( OwnerID(), 207919, 1 )
		GiveBodyItem(OwnerID(),208680,1)
	else
		ScriptMessage( OwnerID(), OwnerID(), 1, "[ADS_STRING08]", 0 )
	end
	CloseSpeak(OwnerID())
end

function Lua_AncientDreamSpace_NPC115697_2_4()
	if CountBodyItem( OwnerID(), 208679 ) >= 2 then
		DelBodyItem( OwnerID(), 208679, 2 )
		GiveBodyItem(OwnerID(),208680,1)
	else
		ScriptMessage( OwnerID(), OwnerID(), 1, "[ADS_STRING13]", 0 )
	end
	CloseSpeak(OwnerID())
end

--=======================================================================================--
--									先遣者暮光
--=======================================================================================--
function Lua_AncientDreamSpace_NPC115696()
	SetSpeakDetail( OwnerID(), "[ADS_NPC115696]" )
--	AddSpeakOption(OwnerID(), TargetID(), "[ADS_SHOP]", "Lua_ADS_NPC115696_shop_1", 0) --
--	AddSpeakOption(OwnerID(), TargetID(), "[ADS_SHOP_MAGICTOOLS]", "Lua_ADS_NPC115696_shop_2", 0) --
	--交換夢境先遣印記
	AddSpeakOption(OwnerID(), TargetID(), "[ADS_STRING11_1]", "Lua_AncientDreamSpace_NPC115696_1_1", 0) 
	AddSpeakOption(OwnerID(), TargetID(), "[ADS_STRING11_2]", "Lua_AncientDreamSpace_NPC115696_1_2", 0) 
	AddSpeakOption(OwnerID(), TargetID(), "[ADS_STRING11_3]", "Lua_AncientDreamSpace_NPC115696_1_3", 0) 
	AddSpeakOption(OwnerID(), TargetID(), "[ADS_STRING12_1]", "Lua_AncientDreamSpace_NPC115696_2_1", 0) 
	AddSpeakOption(OwnerID(), TargetID(), "[ADS_STRING12_2]", "Lua_AncientDreamSpace_NPC115696_2_2", 0) 
end

function Lua_AncientDreamSpace_NPC115696_1_1()
	local NeedSpaceStatus  = Check_Bag_Space( OwnerID() , 1 )
	if NeedSpaceStatus == TRUE then
		if CountBodyItem( OwnerID(), 208682 ) >= 5 then
			DelBodyItem( OwnerID(), 208682, 5 )
			YOYO_GetTokenValue( 3 , 1 ) --給予夢境先遣印記貨幣數值
		else
			ScriptMessage( OwnerID(), OwnerID(), 1, "[ADS_STRING07]", 0 )
		end
	else
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_111490_DIALOG10]", 0 )
	end
	CloseSpeak(OwnerID())
end

function Lua_AncientDreamSpace_NPC115696_1_2()
	local NeedSpaceStatus  = Check_Bag_Space( OwnerID() , 1 )
	if NeedSpaceStatus == TRUE then
		if CountBodyItem( OwnerID(), 208682 ) >= 10 then
			DelBodyItem( OwnerID(), 208682, 10 )
			YOYO_GetTokenValue( 3 , 2 ) --給予夢境先遣印記貨幣數值
		else
			ScriptMessage( OwnerID(), OwnerID(), 1, "[ADS_STRING07]", 0 )
		end
	else
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_111490_DIALOG10]", 0 )
	end
	CloseSpeak(OwnerID())
end

function Lua_AncientDreamSpace_NPC115696_1_3()
	local NeedSpaceStatus  = Check_Bag_Space( OwnerID() , 1 )
	if NeedSpaceStatus == TRUE then
		if CountBodyItem( OwnerID(), 208682 ) >= 20 then
			DelBodyItem( OwnerID(), 208682, 20 )
			YOYO_GetTokenValue( 3 , 4 ) --給予夢境先遣印記貨幣數值
		else
			ScriptMessage( OwnerID(), OwnerID(), 1, "[ADS_STRING07]", 0 )
		end
	else
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_111490_DIALOG10]", 0 )
	end
	CloseSpeak(OwnerID())
end

function Lua_AncientDreamSpace_NPC115696_2_1()
	local NeedSpaceStatus  = Check_Bag_Space( OwnerID() , 1 )
	if NeedSpaceStatus == TRUE then
		if CountBodyItem( OwnerID(), 208679 ) >= 1 then
			DelBodyItem( OwnerID(), 208679, 1 )
			YOYO_GetTokenValue( 3 , 2 ) --給予夢境先遣印記貨幣數值
		else
			ScriptMessage( OwnerID(), OwnerID(), 1, "[ADS_STRING13]", 0 )
		end
	else
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_111490_DIALOG10]", 0 )
	end
	CloseSpeak(OwnerID())
end

function Lua_AncientDreamSpace_NPC115696_2_2()
	local NeedSpaceStatus  = Check_Bag_Space( OwnerID() , 1 )
	if NeedSpaceStatus == TRUE then
		if CountBodyItem( OwnerID(), 208679 ) >= 5 then
			DelBodyItem( OwnerID(), 208679, 5 )
			YOYO_GetTokenValue( 3 , 10 ) --給予夢境先遣印記貨幣數值
		else
			ScriptMessage( OwnerID(), OwnerID(), 1, "[ADS_STRING13]", 0 )
		end
	else
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_111490_DIALOG10]", 0 )
	end
	CloseSpeak(OwnerID())
end

function Lua_ADS_NPC115696_shop_1()
	SetShop( TargetID() , 600267 , "Test_Shop_Close" )
	CloseSpeak( OwnerID() );  --關閉對話視窗
	OpenShop()
end

function Lua_ADS_NPC115696_shop_2()
	SetShop( TargetID() , 600320 , "Test_Shop_Close" )
	CloseSpeak( OwnerID() );  --關閉對話視窗
	OpenShop()
end
--=======================================================================================--
--									路人NPC
--=======================================================================================--
function Lua_AncientDreamSpace_NPCTalk01()
	local X = DW_Rand(3)
	local StringTable = {[1]="[ADS_NPC_TALK01]";
				[2]="[ADS_NPC_TALK02]";
				[3]="[ADS_NPC_TALK03]";
				}
	SetSpeakDetail(OwnerID(), StringTable[X])
end

function Lua_AncientDreamSpace_NPCTalk02()
	local X = DW_Rand(3)
	local StringTable = {[1]="[ADS_NPC_TALK04]";
				[2]="[ADS_NPC_TALK05]";
				[3]="[ADS_NPC_TALK06]";
				}
	SetSpeakDetail(OwnerID(), StringTable[X])
end
--=======================================================================================--
--									物品
--=======================================================================================--
function ADS_Item_208744()
	local ZoneID = ReadRoleValue(OwnerID(),EM_RoleValue_ZoneID)
	if ZoneID == 356 then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_CANTHOME]" , 0 )
	else
		ChangeZone( OwnerID(), 2 , 0 , -1343, -370, 2117, 359)
	end
end
--=======================================================================================--
--									測試後門
--=======================================================================================--
function Lua_ADS_BD()
	local X = ReadRoleValue(TargetID() , EM_RoleValue_Register1)
	local Y = ReadRoleValue(TargetID() , EM_RoleValue_Register2)
	X = X+1
	if X >= 31 then
		X = 1
		Y = Y+1
	end
	WriteRoleValue(TargetID() , EM_RoleValue_Register1, X)
	WriteRoleValue(TargetID() , EM_RoleValue_Register2, Y)
	X = ReadRoleValue(TargetID() , EM_RoleValue_Register1)
	Y = ReadRoleValue(TargetID() , EM_RoleValue_Register2)
	local Z = X+30*Y
end