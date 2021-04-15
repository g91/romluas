--============================
-- 主持人身上的Register
--			+1	偵測比賽是否進行中的開關 0是可玩 1是正在進行
--			+2

-- Model身上的Register
--			+1	紀錄主持人
--			+2	紀錄選擇此Model的玩家
--			+3	紀錄此Model是第幾回合產的
--			+4	紀錄是什麼顏色

-- 旗標781305		1~4	每回合四個Model出現的位置
--			5	評審出現的位置
--			6~9	四個玩家的位置
--============================

function FN_textile2013_NPC()
	local Player = OwnerID()
	local NPC = TargetID()

	if ReadRoleValue( NPC, EM_RoleValue_Register+1 ) == 0 then
		SetSpeakDetail( Player, "[TEXTILE2013_FN_SPEAK_01]" )
	--	AddSpeakOption( Player, NPC, "Let's solo play!", "FN_textile2013_Solo", 0 )
		AddSpeakOption( Player, NPC, "[TEXTILE2013_FN_SPEAK_01_2]", "FN_textile2013_Team", 0 )
	else
		SetSpeakDetail( Player, "[TEXTILE2013_FN_SPEAK_ING]" )
	end
	AddSpeakOption( Player, NPC, "[TEXTILE2013_FN_SPEAK_01_1]", "FN_textile2013_GameRule", 0 )
end

function FN_textile2013_GameRule()
	local Player = OwnerID()
	local NPC = TargetID()

	SetSpeakDetail( Player, "[TEXTILE2013_FN_SPEAK_02]" )
	AddSpeakOption( Player, NPC, "[TEXTILE2013_FN_SPEAK_02_1]", "FN_textile2013_GameRule2", 0 )
	AddSpeakOption( Player, NPC, "[TEXTILE2013_FN_SPEAK_02_2]", "FN_textile2013_GameRule3", 0 )
	AddSpeakOption( Player, NPC, "[TEXTILE2013_FN_SPEAK_BACK]", "FN_textile2013_NPC", 0 )
end

function FN_textile2013_GameRule2()
	local Player = OwnerID()
	local NPC = TargetID()

	SetSpeakDetail( Player, "[TEXTILE2013_FN_SPEAK_04]" )
	AddSpeakOption( Player, NPC, "[TEXTILE2013_FN_SPEAK_BACK]", "FN_textile2013_GameRule", 0 )
end

function FN_textile2013_GameRule3()
	local Player = OwnerID()
	local NPC = TargetID()

	SetSpeakDetail( Player, "[TEXTILE2013_FN_SPEAK_05]" )
	AddSpeakOption( Player, NPC, "[TEXTILE2013_FN_SPEAK_BACK]", "FN_textile2013_GameRule", 0 )
end

function FN_textile2013_Solo()
	local Player = OwnerID()
	local NPC = TargetID()

	SetSpeakDetail( Player, "About solo play" )
	AddSpeakOption( Player, NPC, "I sure solo", "FN_textile2013_Speak(1)", 0 )	
	AddSpeakOption( Player, NPC, "[TEXTILE2013_FN_SPEAK_BACK]", "FN_textile2013_NPC", 0 )
end
function FN_textile2013_Team()
	local Player = OwnerID()
	local NPC = TargetID()

	SetSpeakDetail( Player, "[TEXTILE2013_FN_SPEAK_03]" )
	AddSpeakOption( Player, NPC, "[TEXTILE2013_FN_SPEAK_03_1]", "FN_textile2013_Speak(2)", 0 )
	AddSpeakOption( Player, NPC, "[TEXTILE2013_FN_SPEAK_BACK]", "FN_textile2013_NPC", 0 )
end

function FN_textile2013_Speak( PlayStyleCheck )
	local Player = OwnerID()
	local NPC = TargetID()
	local PartyNum = GetPartyID( Player , -1 )

	if PartyNum == 0 then
		ScriptMessage( Player, Player, 1 , "[FN_FAIRYTALE2012_NOTTEAM]" , C_SYSTEM ) --你不在一個隊伍中
	elseif ReadRoleValue( NPC, EM_RoleValue_Register+1 ) == 0 then	--開關是打開的
		local ZoneID = ReadRoleValue( NPC, EM_RoleValue_ZoneID )
		local AllZoneCheck = true
		local AllLiveCheck = true
		for i = 1, PartyNum do
			local PartyPlayer = GetPartyID( Player , i )
			if ReadRoleValue( PartyPlayer, EM_RoleValue_ZoneID ) ~= ZoneID then
				AllZoneCheck = false
			end
			if ReadRoleValue( PartyPlayer, EM_RoleValue_IsDead ) == 1 then
				AllLiveCheck = false
			end
		end
		if AllZoneCheck == true and AllLiveCheck == true then
			for i = 1, PartyNum do
				local PartyPlayer = GetPartyID( Player , i )
				DW_CancelTypeBuff( 68,  PartyPlayer ) --騎乘坐騎時，下馬
			end
			WriteRoleValue( NPC, EM_RoleValue_Register+1, 1 )
			CallPlot( NPC, "FN_textile2013_Main", Player, PlayStyleCheck )
		elseif AllZoneCheck == false then
			ScriptMessage( NPC, Player, 1, "[TEXTILE2013_FN_SPEAK_PARTY]", 0 )	--仍然有參賽者未到齊，要請他們趕快過來比賽才可以開始喔！
		elseif AllLiveCheck == false then
			ScriptMessage( NPC, Player, 1, "[TEXTILE2013_FN_SPEAK_ALLLIVE]", 0 )	--參賽者當中有人正處於死亡狀態！
		end
	end
	CloseSpeak( Player )
end

function FN_textile2013_Main( Player, PlayStyleCheck )
	DebugMsg( 0 , 0 , "FN_textile2013_Main" );
	--local Player = OwnerID()
	local NPC = OwnerID()
	local RoomID = ReadRoleValue( NPC, EM_RoleValue_RoomID )

	local PartyTable = {}
-- 	如果 PlayStyleCheck 是1=Solo, 2=Team
--	if PlayStyleCheck == 1 then
		
--	elseif PlayStyleCheck == 2 then

	if PlayStyleCheck == 2 then
		local PartyNum = GetPartyID( Player , -1 )
		for i = 1, PartyNum do
			if i <= 4 then						--最多只能有4個玩家參與
				PartyTable[i] = GetPartyID( Player , i )
				SetPosByFlag( PartyTable[i], 781305, (5+i) )	--把玩家移動過去固定
				AddBuff( PartyTable[i], 505340, 0, -1 )		--給予玩家活動BUFF
			end
		end
	end
	--
	local MasterTable = { 122532, 122533, 122534, 122535 }	--評審
	local Round = 0			--回合數	
	local StyleTable = { 5, 5, 5, 5 }		--銀、紅、綠、紫
	local AllModelTable = {}		--Model總表
	--產出該回合評審
	local Ax, Ay, Az, Adir = DW_Location( 781305, 5 )
	local MasterOrgID = MasterTable[DW_Rand(4)]
	local Master = CreateObj( MasterOrgID, Ax, Ay, Az, Adir, 1 )
	AddToPartition( Master, RoomID )
	Yell(NPC, "[TEXTILE2013_FN_001][$SETVAR1=".."["..MasterOrgID.."]".."]", 2)
	Sleep(20)
	--
	Yell( NPC, "[TEXTILE2013_FN_002]", 2 )
	--
	while true do
		Round = Round + 1
		DebugMsg( 0 , 0 , "--Round : "..Round );
		--把離線的玩家移除掉
		for x = #PartyTable, 1, -1 do
			if CheckID( PartyTable[x] ) == false then
				table.remove( PartyTable, x )
			end
		end
		--產出該回合要給玩家選的模特
--		Say( NPC, "--------------------------------------CreatModel" )
		local ModelTable = {}
		StyleTable, ModelTable  = FN_textile2013_CreatModel( Round, StyleTable, NPC )
--		Say( NPC, "--------------------------------------CreatModel Over" )
		AllModelTable = FN_TableCombine( AllModelTable, ModelTable )	--把出場的Model加到Model總表裡頭
		--玩家選擇
--		Say( NPC, "-----------------------Player Choose" )
		Yell( NPC, "[TEXTILE2013_FN_003][$SETVAR1="..Round.."]", 2 )
		Sleep(20)
		for i = 1, #PartyTable do						--每個參與的玩家各動一次
				DebugMsg( 0 , 0 , "--Rotary : "..PartyTable[i] );
				SetFlag( PartyTable[i], 544955, 1 )				--拿到這個Flag的玩家才算輪到他，可以跟Model作互動
				if FN_textile2013_PlayerTurn( PartyTable[i], NPC ) == 2 then	--玩家時間到沒有選，所以隨機幫他選一個
					for r = 1, #ModelTable do
						if ReadRoleValue( ModelTable[r], EM_RoleValue_Register+2 ) == 0 then
							WriteRoleValue( ModelTable[r], EM_RoleValue_Register+2, PartyTable[i] )
							--
							local x,y,z,Dir = DW_Location( PartyTable[i] )
							local Nx,Ny,Nz,Ndir = DW_NewLocation( (60+40*Round),10,x,y,z,Dir)
							SetPos( ModelTable[r], Nx, Ny, Nz, Ndir )				--把玩家選上的Model移動到他旁邊排好
							SetModeEx( ModelTable[r], EM_SetModeType_Mark, false )
							break
						end
					end
	--			elseif  FN_textile2013_PlayerTurn( PartyTable[i], NPC ) == 1 then
				end
		end
		--每個玩家都選完後，便把這回合的所有模特取消觸碰劇情，且把沒人選的隱藏
--		Say( NPC, "Model no one choose go Hide" )
		for m = 1, #ModelTable do						
			SetPlot( ModelTable[m], "touch", "", 0 )
			if ReadRoleValue( ModelTable[m], EM_RoleValue_Register+2 ) == 0 then
				Hide( ModelTable[m] )
			end
		end
		Yell( NPC, "[TEXTILE2013_FN_008][$SETVAR1="..Round.."]", 2 )
		--如果到了第五回合表示這次比賽結束了
		if Round == 5 then
			Yell( NPC, "[TEXTILE2013_FN_009]", 2 )
			Sleep(20)
			Yell( NPC, "[TEXTILE2013_FN_010]", 2 )
			Sleep(20)
			local WinnerTable = FN_textile2013_CountScore( AllModelTable, MasterOrgID, PartyTable )
			--
			Yell( NPC, "[TEXTILE2013_FN_012]", 2 )
			Sleep(20)
			if #WinnerTable == 1 then
				Yell( NPC, "[TEXTILE2013_FN_013]", 2 )
				Sleep(15)
				Yell( NPC, "[TEXTILE2013_FN_014][$SETVAR1="..GetName( WinnerTable[1] ).."]", 2 )
			elseif #WinnerTable > 1 then
				Yell( NPC, "[TEXTILE2013_FN_015]", 2 )
				Sleep(15)
				--
				local NameString = ""
				for s = 1, #WinnerTable do
					NameString = NameString..GetName( WinnerTable[s] )..", "
				end
				--
				Yell( NPC, "[TEXTILE2013_FN_016][$SETVAR1="..NameString.."]", 2 )
			end
			--給獎，贏家拿比較好的獎勵
			for p = 1, #PartyTable do
				if CheckFlag( PartyTable[p], 548131 ) == false then
					if FN_InTableCheck( PartyTable[p], WinnerTable ) == true then
						GiveBodyItem( PartyTable[p], 241646, 1 )	--女神紡織材料包
					else
						GiveBodyItem( PartyTable[p], 241645, 1 )	--實用紡織材料包
					end
					SetFlag( PartyTable[p], 548131, 1 )
				end
				Lua_Festival_07_All(PartyTable[p]) 			--全勤獎
			end
			--
			FN_textile2013_AllClear( AllModelTable, Master, NPC )
			DebugMsg( 0 , 0 , "--5 Round End : " );
			return
		end
		--把PartyTable裡頭的第一個人移到table最後面 好讓下回合可以換人當第一個動的
		local TempPlayer = PartyTable[1]
		table.remove( PartyTable, 1 )
		table.insert( PartyTable, TempPlayer )
		--
		Sleep(10)
	end
end

--===================================================
--				其他函式
--===================================================

function FN_textile2013_CreatModel( Round, StyleTable, NPC )	--創造Model
	local RoomID = ReadRoleValue( NPC, EM_RoleValue_RoomID )

	local RoundTable = { [1]= {122508, 122513, 122518, 122523};
				[2]= {122509, 122514, 122519, 122524};
				[3]= {122510, 122515, 122520, 122525};
				[4]= {122511, 122516, 122521, 122526};
				[5]= {122512, 122517, 122522, 122527}	}

	local TempTable = { 0, 0, 0, 0 }			--4個Model出場是什麼顏色
	local Modelable = {}				--記錄產出的Model用，最後要回傳

	local whileTemp = 0
	while whileTemp < 4 do			--選這回合要出什麼顏色
		local TempRand = DW_Rand(4)	--Rand出其中一個顏色 1,2,3,4 對應 銀,紅,綠,紫
		if StyleTable[TempRand] >= 1 then	--確認該顏色是否還有剩
			whileTemp = whileTemp + 1
			StyleTable[TempRand] = StyleTable[TempRand] - 1	--該顏色能出場的次數-1
			TempTable[whileTemp] = TempRand			--紀錄Model出場是什麼顏色
		end
		--該顏色不能出場的話就繼續Rand到有為止
	end
	--
	local ModelTable = {}
	for i = 1, 4 do
		local x, y, z, dir = DW_Location( 781305, i )
		local ColorStyle = TempTable[i]					--方便閱讀所以local一下
		ModelTable[i] = CreateObj( RoundTable[Round][ColorStyle], x, y, z, dir, 1 )
		AddToPartition( ModelTable[i], RoomID )
		SetPlot( ModelTable[i], "touch", "FN_textile2013_ModelPlot", 150 )
		WriteRoleValue( ModelTable[i], EM_RoleValue_Register+1, NPC )
		WriteRoleValue( ModelTable[i], EM_RoleValue_Register+3, Round )
		WriteRoleValue( ModelTable[i], EM_RoleValue_Register+4, ColorStyle )
		SetModeEx( ModelTable[i], EM_SetModeType_Move, false )
	end
	return StyleTable, ModelTable
end

function FN_textile2013_ModelPlot()	--Model的觸碰事件
	local Player = OwnerID()
	local Model = TargetID()
	local MainNPC = ReadRoleValue( Model, EM_RoleValue_Register+1 )
	local Round = ReadRoleValue( Model, EM_RoleValue_Register+3 )
	local FlagCheck = CheckFlag( Player, 544955 )

	if FlagCheck == true then	--碰觸的玩家如果是這輪可行動的玩家，就會有Flag
		SetFlag( Player, 544955, 0 )					--玩家選取了，把他這輪可行動資格拿掉
		--
		WriteRoleValue( Model, EM_RoleValue_Register+2, Player )	--玩家選擇了這個Model，把玩家記上
		--
		local x,y,z,Dir = DW_Location( Player )
		local Nx,Ny,Nz,Ndir = DW_NewLocation( (60+40*Round),10,x,y,z,Dir)
		SetPos( Model, Nx, Ny, Nz, Ndir )				--把玩家選上的Model移動到他旁邊排好
		SetFlag( Player, 548123, 1 )					--玩家選取了，給他一個記號
		SetModeEx( Model, EM_SetModeType_Mark, false )
	else
		ScriptMessage( Player, Player, 1, "[TEXTILE2013_FN_017]", 0 )
		return
	end
end
 
function FN_textile2013_PlayerTurn( Player, NPC )	--輪到該玩家的回合
	if CheckID( Player ) == false then
		return 1
	end
	Yell( NPC, "[TEXTILE2013_FN_004][$SETVAR1="..GetName( Player ).."]", 2 )
	ScriptMessage( Player, Player, 2, "[TEXTILE2013_FN_005]", C_SYSTEM )
	StartClientCountDown( Player, 20, 0, 0, 0, 0, "Time" )	--倒數計時，讓玩家知道還剩下多少時間可以做決定
	--
	local TimeCount = 0
	while true do
		Sleep( 10 )
		TimeCount = TimeCount + 1
		--
		if CheckFlag( Player, 548123 ) == true then	--玩家拿到Flag
			Yell( NPC, "[TEXTILE2013_FN_006][$SETVAR1="..GetName( Player ).."]", 2 )
			StartClientCountDown( Player, 0, 0, 0, 0, 0, "Time" )	--倒數計時歸零
			SetFlag( Player, 548123, 0 )				--把玩家選取過的記號拿掉
--			SetFlag( Player, 544955, 0 )				--玩家的選取資格拿掉
			return 1
		elseif TimeCount == 20 then			--20秒沒選幫玩家隨機拿一個
			SetFlag( Player, 544955, 0 )				--玩家的選取資格拿掉
			StartClientCountDown( Player, 0, 0, 0, 0, 0, "Time" )	--倒數計時歸零
			return 2
		end
		--
		if TimeCount % 5 == 0 then
			Say( NPC, "[TEXTILE2013_FN_007][$SETVAR1="..GetName( Player ).."][$SETVAR2="..(20-TimeCount).."]")
		end
	end
end

function FN_textile2013_CountScore( AllModelTable, MasterOrgID, PartyTable )	--計算玩家得分
	local MasterCount ={ [122532] = { 3, 2, 2, 1 };
				[122533] = { 1, 3, 2, 2 };
				[122534] = { 2, 1, 3, 2 };
				[122535] = { 2, 2, 1, 3 }; }
	--
	DEBUGMsg(0,0,"P1")
	local PlayerChoose = {}
	for i = 1, #PartyTable do
		DEBUGMsg(0,0,"Player="..PartyTable[i])
		PlayerChoose[PartyTable[i]] = {}
	end
	--
	DEBUGMsg(0,0,"P2")
	for i = 1, #AllModelTable do						--所有出場的Model都掃過一次，讀取這些Model被哪個玩家所選擇
		local PlayerID = ReadRoleValue( AllModelTable[i], EM_RoleValue_Register+2 )
		local ColorStyle = ReadRoleValue( AllModelTable[i], EM_RoleValue_Register+4 )
		if PlayerID ~= 0 and CheckID( PlayerID ) == true then
			table.insert( PlayerChoose[PlayerID], ColorStyle )			--以玩家ID為索引，在裡頭紀錄玩家選擇了那些顏色
		end
	end
	--現在到這邊每個玩家所選擇的顏色都整理好了 該開始算分
	--格式 ex: PlayerChoose[PlayerID]={ 1,2,1,4,3 }	1,2,3,4 對應 銀,紅,綠,紫
	local PlayerStyle = {}
	--
	DEBUGMsg(0,0,"P3")
	local ScoreTable = {}
	for i = 1, #PartyTable do
		DEBUGMsg(0,0,"P4 - "..i.." - 1")
		local PlayerID = PartyTable[i]
		local BaseScore = 0
		PlayerStyle[PlayerID] = {0, 0, 0, 0}		
		for s = 1, 5 do							--玩家會選5次模特，所以做5次
			local Color = PlayerChoose[PlayerID][s]			--得出這個模特是什麼顏色
			local MasterGive = MasterCount[MasterOrgID][Color]	--從顏色去得出評審給多少分
			BaseScore = BaseScore + MasterGive
			--if PlayerStyle[PlayerID] == nil then
			--	PlayerStyle[PlayerID] = {}
			--end
			--if PlayerStyle[PlayerID][Color] == nil then
			--	PlayerStyle[PlayerID][Color] = 1
			--else
				PlayerStyle[PlayerID][Color] = PlayerStyle[PlayerID][Color]+1	--這邊是統計玩家四種顏色的比例，好在後面作加權分的計算
			--end
		end
		--現在到這邊知道每個玩家所選擇的顏色比例
		--格式 ex: PlayerStyle[PlayerID]={ 2,2,0,1 }	每個索引 對應 銀,紅,綠,紫 各拿幾個
		DEBUGMsg(0,0,"P4 - "..i.." - 2")
		local MultiCheck = true			--多元素 加權判定
		local SingleCheck = false		--單元素 加權判定
		local AntiCheck = false			--反指標 加權判定
		for c = 1, 4 do
			local ColorStringTable = { "Silver", "Red", "Green", "Purple" }
--			Say( PlayerID, "I pick"..PlayerStyle[PlayerID][c].." "..ColorStringTable[c] )
			if PlayerStyle[PlayerID][c] == 2 then	--特定風格有2個，+4分
				BaseScore = BaseScore + 4
				SingleCheck = false	--有2表示玩家不可能只拿一種顏色，不符合單元素的加權判定
			elseif PlayerStyle[PlayerID][c] == 5 then
				SingleCheck = true	--有5表示玩家只拿一種顏色，符合單元素的加權判定
				if MasterCount[MasterOrgID][c] == 1 then
					AntiCheck = true	--評審最低分拿3個或以上，符合反指標的加權判定
				end
			elseif PlayerStyle[PlayerID][c] >= 3 then	--特定風格有3個以上，+6分
				BaseScore = BaseScore + 6
				if MasterCount[MasterOrgID][c] == 1 then
					AntiCheck = true	--評審最低分拿3個或以上，符合反指標的加權判定
				end
			elseif PlayerStyle[PlayerID][c] == 0 then
				MultiCheck = false	--有0表示玩家少拿一種顏色，不符合多元素的加權判定
			end
		end
		DEBUGMsg(0,0,"P4 - "..i.." - 3")
		if MultiCheck == true then
			BaseScore = BaseScore + 8
		end
		if SingleCheck == true then
			BaseScore = BaseScore + 11			
		end
		if AntiCheck == true then
			BaseScore = BaseScore + 12
		end
		--
		ScoreTable[PlayerID] = BaseScore
	end
	DEBUGMsg(0,0,"P5")
--	return ScoreTable
	--計算贏家是誰，處理有可能會出現的平手狀況
	local TopScore = 0
	for i = 1, #PartyTable do
		local ScorePlayer = PartyTable[i]
		ScriptMessage( ScorePlayer, ScorePlayer, 3, "[TEXTILE2013_FN_011][$SETVAR1="..ScoreTable[ScorePlayer].."]" , 0 )
		if ScoreTable[ScorePlayer] > TopScore then
			TopScore = ScoreTable[ScorePlayer]
		end
		--
		CancelBuff( PartyTable[i], 505340 )
	end
	DEBUGMsg(0,0,"TopScore="..TopScore)
	--先求出最高分，然後看看有沒有多人同時最高分的平手狀況
	local WinnerTable = {}
	for i = 1, #PartyTable do
		local TopPlayer = PartyTable[i]
		if ScoreTable[TopPlayer] == TopScore then
			DEBUGMsg(0,0,"Player"..GetName(TopPlayer).."="..ScoreTable[TopPlayer])
			table.insert( WinnerTable, TopPlayer )
		end
	end
	return WinnerTable
end

function FN_textile2013_AllClear( AllModelTable, Master, NPC )
	DelObj( Master )
	for i = #AllModelTable, 1, -1 do
		DelObj( AllModelTable[i] )
	end
	WriteRoleValue( NPC, EM_RoleValue_Register+1, 0 )
end


--===================================================
--				額外函式
--===================================================

function FN_TableCombine( table1, table2 )	--把table2內的東西合併到table1內
	for i = 1, #table2 do
		table.insert( table1, table2[i] )
	end
	return table1
end

function FN_textile2013_Del()
	local RoundTable = { [1]= {122508, 122513, 122518, 122523};
				[2]= {122509, 122514, 122519, 122524};
				[3]= {122510, 122515, 122520, 122525};
				[4]= {122511, 122516, 122521, 122526};
				[5]= {122512, 122517, 122522, 122527}	}

	for i = 1, #RoundTable do
		for h = 1, #RoundTable[i] do
			Lua_DavisDelObj( RoundTable[i][h] )
		end
	end
end