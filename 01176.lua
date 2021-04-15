function LuaZone_RACEGAME_Main()
	SetZoneReviveScript( "LuaZone_RACEGAME_Revive" );
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local Mark,hindrance = Lua_Race_BronFlagMiddle(OwnerID())
	local	pX, pY, pZ;
	-- 產生起點物件
	pX=2669
	pY=36
	pZ=2295
	local StartCOO = CreateObj( 112122, pX, pY, pZ, 187, 1)
	SetModeEx( StartCOO, EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( StartCOO, EM_SetModeType_Strikback, false )--反擊
	SetModeEx( StartCOO, EM_SetModeType_Mark, false )--標記
	SetModeEx( StartCOO, EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( StartCOO, EM_SetModeType_Obstruct, true )--阻擋
	SetModeEx( StartCOO, EM_SetModeType_Gravity, false )--重力
	SetModeEx( StartCOO, EM_SetModeType_Move, false )--移動
	SetModeEx( StartCOO, EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( StartCOO, EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( StartCOO, EM_SetModeType_Show, false )--顯示
	AddToPartition( StartCOO ,  RoomID  )
	--產生門
	pX=2658
	pY=36
	pZ=2297
	local StartDoor = CreateObj( 112123, pX, pY, pZ, 10, 1)
	SetModeEx( StartDoor, EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( StartDoor, EM_SetModeType_Strikback, false )--反擊
	SetModeEx( StartDoor, EM_SetModeType_Mark, false )--標記
	SetModeEx( StartDoor, EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( StartDoor, EM_SetModeType_Obstruct, true )--阻擋
	SetModeEx( StartDoor, EM_SetModeType_Gravity, false )--重力
	SetModeEx( StartDoor, EM_SetModeType_Move, false )--移動
	SetModeEx( StartDoor, EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( StartDoor, EM_SetModeType_Searchenemy, false )--索敵
	AddToPartition( StartDoor ,  RoomID  )
	BeginPlot( StartDoor , "Lua_RaceRideing" , 0 )
	-- 產生終點物件
	pX=4441
	pY=-29
	pZ=4250
	local FinalDoor = CreateObj( 112122, pX, pY, pZ, 28, 1)
	SetModeEx( FinalDoor, EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( FinalDoor, EM_SetModeType_Strikback, false )--反擊
	SetModeEx( FinalDoor, EM_SetModeType_Mark, false )--標記
	SetModeEx( FinalDoor, EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( FinalDoor, EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( FinalDoor, EM_SetModeType_Gravity, false )--重力
	SetModeEx( FinalDoor, EM_SetModeType_Move, false )--移動
	SetModeEx( FinalDoor, EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( FinalDoor, EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( FinalDoor, EM_SetModeType_Show, false )--顯示
	AddToPartition( FinalDoor ,  RoomID  )
	--在終點加上碰撞劇情
	SetPlot( FinalDoor , "Collision" , "Lua_Race_CollisionWin" , 50 )
	-- 檢查人數都滿了才開始倒數
	local CheckTime = 0;
	local CheckClock = 0
	local Setp = 0
	--戰場開啟60秒內檢查是否全數到齊
	while 1 do
		local CountOneTeam = GetNumEnterTeamMember(RoomID,1) --第一隊總和人數
		local CountTwoTeam = GetNumEnterTeamMember(RoomID,2) --第二隊總和人數
		local CountThreeTeam = GetNumEnterTeamMember(RoomID,3) --第三隊總和人數
		local CountFourTeam = GetNumEnterTeamMember(RoomID,4) --第四隊總和人數
		local CountFiveTeam = GetNumEnterTeamMember(RoomID,5) --第五隊總和人數
		local CountSexTeam = GetNumEnterTeamMember(RoomID,6) --第六隊總和人數
		local CountSevenTeam = GetNumEnterTeamMember(RoomID,7) --第七隊總和人數
		local CountEightTeam = GetNumEnterTeamMember(RoomID,8) --第八隊總和人數
		if (CountOneTeam + CountTwoTeam + CountThreeTeam + CountFourTeam + CountFiveTeam + CountSexTeam + CountSevenTeam + CountEightTeam) >= 8 then
			--人數全到齊
			ScriptMessage( OwnerID(), -1 , 2, "[SC_RACEGAME_EMFULL]" , 0 )	--所有玩家皆進入馳風大道，比賽即將開始
			DebugMsg( 0, RoomID ,"LuaZone_RACEGAME_CheckOK = 0 0 1")
			LuaZone_RACEGAME_CheckOK(70,1,1)
			Setp = 0
			break
		else	--人數未到齊
			DebugMsg( 0, RoomID ,"LuaZone_RACEGAME_CheckOK = 70 "..(70-CheckTime).." 1")
			LuaZone_RACEGAME_CheckOK(70,(70-CheckTime),1)	--玩家Client顯示倒數
			if CheckTime >= 69 then
				--超過60秒人數不足執行以下
				if (CountOneTeam + CountTwoTeam + CountThreeTeam + CountFourTeam + CountFiveTeam + CountSexTeam + CountSevenTeam + CountEightTeam) < 6 then
					--人數小於6人戰場結束
					ScriptMessage( OwnerID(),  -1, 2, "[SC_1V1PVP_COUNTERROR]" , 0 )	--參賽人數不足，比賽結束
					for i=1,8 do
						local CountPeople = GetNumEnterTeamMember(RoomID,i)		--該隊總和人數
						if CountPeople ~= 0 then
							SetScore( RoomID, i , 255 );			--設定該隊伍分數為失敗
						end
					end
					EndBattleGround( RoomID, -1 );
					Setp = 2
					break
				else	--人數超過6人戰場照常進行
					Setp = 0
					break			
				end
			elseif CheckTime < 70 then
				if CheckClock == 5 then
					ScriptMessage( OwnerID(), -1 , 2, "[SC_RACEGAME_WAITEM]" , 0 )	--等待其他對手進入馳風大道
					CheckClock = 0
				end
				--小於60秒人數不足時，顯示等待訊息
				local Obj
				local Count = SetSearchAllPlayer(RoomID)
				for i = 1 , Count , 1 do
					local ID = GetSearchResult()
					Obj = Role:New( ID )
					if Obj:IsPlayer() == true then
						Lua_PVPAllFull(ID)	--補滿狀態
					end
				end		
			end
		end
		CheckClock = CheckClock + 1
		CheckTime = CheckTime + 1
		Sleep(10)
	end
	local CheckTime2 = 0
	local CheckFlag = 0;

	if Setp == 0 then
		DebugMsg( 0, RoomID ,"LuaZone_RACEGAME_CheckOK = 10 10 0")
		LuaZone_RACEGAME_CheckOK(10,10,0)	--玩家Client顯示倒數
		local FirstTemp = 0
		local SecondTemp = 0
		local ThridTemp = 0
		local FourthTemp = 0
		local FifthTemp = 0
		local SixthTemp = 0
		local SeventhTemp = 0
		local EighthTemp = 0
		local WinnerCount = 0
		local CheckFlagBig = 0 
		While 1 do
			if Setp == 0 then	--倒數階段
				if CheckTime2 <= 10 then		
					--檢查是否有隊伍脫離
					local CountNomalTeam = 0
					local CountLeaveTeam = 0
					local ThisTeam = {}
					for i=1,8 do
						local CountTeam = GetNumEnterTeamMember(RoomID,i)		--該隊總和人數
						if CountTeam == 0 then
							if GetScore( RoomID, i ) ~= 0 then
								SetScore( RoomID, i , 255 );			--設定分數為失敗
							end
							ThisTeam[i] = 0
							CountLeaveTeam = CountLeaveTeam + 1
						elseif CountTeam ~= 0 then
							ThisTeam[i] = 1
							CountNomalTeam = CountNomalTeam + 1
						end
					end
					if CountNomalTeam == 1 then
						for k=1,8 do
							if ThisTeam[k] == 1 then
								SetScore( RoomID, k , 1 );	--設定分數為第一名
								EndBattleGround( RoomID, k )
								--給予獎勵
								AddTeamItem(RoomID, k , 203038 , 100)
							end
						end
						Setp = 2
						break
					end
					if CheckTime2 == 8 then
						DelObj(StartCOO)
					end
				else
					Setp = 1
					LuaZone_RACEGAME_cancelbuff()	--扣門票
					-- 倒數結束，打開柵門
					--ScriptMessage( OwnerID(),  -1, 2, "[SC_RACEGAME_START]" , 0 )	--比賽開始
					PlayMotionEX( StartDoor, ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP)
				end
				CheckTime2 = CheckTime2 + 1
			end
			if Setp == 1 then	--比賽階段
				-- 檢查是否有隊伍脫離
				local CountNomalTeam = 0
				local CountLeaveTeam = 0
				local ThisTeam = {}
				for i=1,8 do
					local CountTeam = GetNumEnterTeamMember(RoomID,i)	--該隊總和人數
					if CountTeam == 0 then
						if GetScore( RoomID, i ) ~= 0 then
							SetScore( RoomID, i , 255 );			--設定分數為失敗
						end
						ThisTeam[i] = 0
						CountLeaveTeam = CountLeaveTeam + 1
					elseif CountTeam ~= 0 then
						ThisTeam[i] = 1
						CountNomalTeam = CountNomalTeam + 1
					end
				end
				DebugMsg( 0, RoomID ,"CountNomalTeam ="..CountNomalTeam.."CountLeaveTeam ="..CountLeaveTeam)
				if CountNomalTeam == 1 then	--剩下一位參賽者
					for k=1,8 do
						if ThisTeam[k] == 1 then
							SetScore( RoomID, k , 1 );	--設定分數為第一名
							EndBattleGround( RoomID, k )
							--給予獎勵
							AddTeamItem(RoomID, k , 203038 , 100)
						end
					end
					Setp = 2
					break
				end
				-- 主要迴圈, 檢查有無獲勝者
				-- 檢查有無陣營穫勝
				--DebugMsg( 0, RoomID ,"Starting Checking Winner !")
				for i=1, 8, 1 do	
					if( GetScore( RoomID, i ) == 1 ) and FirstTemp == 0 then
						DebugMsg( 0, RoomID ,"CheckFlag ="..CheckFlag.."FirstTemp is ="..i)
						SetVar(RoomID, i, CheckFlag)
						WinnerCount = WinnerCount + 1
						FirstTemp = i
					elseif ( GetScore( RoomID, i ) == 2 ) and SecondTemp == 0 then
						DebugMsg( 0, RoomID ,"CheckFlag ="..CheckFlag.."SecondTemp is ="..i)
						SetVar(RoomID, i, CheckFlag)
						WinnerCount = WinnerCount + 1
						SecondTemp = i
					elseif ( GetScore( RoomID, i ) == 3 ) and ThridTemp == 0 then
						DebugMsg( 0, RoomID ,"CheckFlag ="..CheckFlag.."ThridTemp is ="..i)
						SetVar(RoomID, i, CheckFlag)
						WinnerCount = WinnerCount + 1
						ThridTemp = i
					elseif ( GetScore( RoomID, i ) == 4 ) and FourthTemp == 0 then
						DebugMsg( 0, RoomID ,"CheckFlag ="..CheckFlag.."FourthTemp is ="..i)
						SetVar(RoomID, i, CheckFlag)
						WinnerCount = WinnerCount + 1
						FourthTemp = i
					elseif ( GetScore( RoomID, i ) == 5 ) and FifthTemp == 0 then
						DebugMsg( 0, RoomID ,"CheckFlag ="..CheckFlag.."FifthTemp is ="..i)
						SetVar(RoomID, i, CheckFlag)
						WinnerCount = WinnerCount + 1
						FifthTemp = i
					elseif ( GetScore( RoomID, i ) == 6 ) and SixthTemp == 0 then
						DebugMsg( 0, RoomID ,"CheckFlag ="..CheckFlag.."SixthTemp is ="..i)
						SetVar(RoomID, i, CheckFlag)
						WinnerCount = WinnerCount + 1
						SixthTemp = i
					elseif ( GetScore( RoomID, i ) == 7 ) and SeventhTemp == 0 then
						DebugMsg( 0, RoomID ,"CheckFlag ="..CheckFlag.."SeventhTemp is ="..i)
						SetVar(RoomID, i, CheckFlag)
						WinnerCount = WinnerCount + 1
						SeventhTemp = i
					elseif ( GetScore( RoomID, i ) == 8 ) and EighthTemp == 0 then
						DebugMsg( 0, RoomID ,"CheckFlag ="..CheckFlag.."EighthTemp is ="..i)
						SetVar(RoomID, i, CheckFlag)
						WinnerCount = WinnerCount + 1
						EighthTemp = i
					end
				end
				--DebugMsg( 0, RoomID ,"Checking Winner End!")
				--所有場上玩家皆有名次, 使用劇情, 將所有有害的 buff 消除, 等待, 
				DebugMsg( 0, RoomID ,"WinnerCount ="..WinnerCount.."CountNomalTeam ="..CountNomalTeam)
				if WinnerCount >= CountNomalTeam then
				DebugMsg( 0, RoomID ,"Now ! WinnerCount >= CountNomalTeam")
					local Obj
					local Count = SetSearchAllPlayer(RoomID)
					if Count ~= 0 then
						for i = 1 , Count , 1 do
							local ID = GetSearchResult()
							Obj = Role:New( ID )
							if Obj:IsPlayer() == true and ID ~= OwnerID() then
								AddBuff(ID,502690,0,-1)		--等待比賽結束
							end
						end	
					end	
					-- 清除所有印記
					for i=0, table.getn(Mark) do
						DelObj(Mark[i])
					end
					for i=0, table.getn(hindrance) do
						for j=0, table.getn(hindrance[i]) do
							DelObj(hindrance[i][j])
						end
					end
					--CheckBGWinner()---檢查是否有人中離..不管跑完與否..重新排名次
					local CountWinnerF = {}
					for i=1, 8 do
						local CountTeam = GetNumEnterTeamMember(RoomID,i)	--該隊總和人數
						if CountTeam == 0 then
								SetScore( RoomID, i , 255 );			--設定分數為失敗
								CountWinnerF[i] = {i,255}
						else
							CountWinnerF[i] = {i,GetScore( RoomID, i )}
						end
					end
					local Min = {}
					local MinTeam = {}
					local BaseTeam = {}
					for j=1, 8 do  
						for i=1, table.getn(CountWinnerF) do
							if Min[j] == nil then
								Min[j] = CountWinnerF[i][2]
								MinTeam[j] = CountWinnerF[i][1]
								BaseTeam[j] = i
								DebugMsg( 0, RoomID ,"1MinTeam[j]="..MinTeam[j])
								DebugMsg( 0, RoomID ,"1CountWinnerF[i]="..CountWinnerF[i][2])
							end
							if CountWinnerF[i][2] ~= 0 then
								if CountWinnerF[i][2] > 0 and CountWinnerF[i][2] < Min[j] then
									Min[j] = CountWinnerF[i][2]
									MinTeam[j] = CountWinnerF[i][1]
									BaseTeam[j] = i
									DebugMsg( 0, RoomID ,"3MinTeam[j]="..MinTeam[j])
									DebugMsg( 0, RoomID ,"3CountWinnerF[i]="..CountWinnerF[i][2])
								end
							end
						end
						DebugMsg( 0, RoomID ,"4MinTeam[j]="..MinTeam[j])
						DebugMsg( 0, RoomID ,"5Min[j]="..Min[j])
						local Remo = BaseTeam[j]
						DebugMsg( 0, RoomID ,"========!!Team ="..MinTeam[j].." Score ="..CountWinnerF[Remo][2])
						SetScore( RoomID, MinTeam[j], CountWinnerF[Remo][2] );	--設定第一名分數
						table.remove(CountWinnerF,Remo)
					end
					Sleep(15)
					EndBattleGround( RoomID, MinTeam[1] );
					if GetServerDataLanguage() == "kr" then
					else
						if MinTeam[1] ~= 0 and GetScore( RoomID, MinTeam[1] ) < 9 then
						AddTeamItem(RoomID, MinTeam[1] , 203038 , 45)
						end
						if MinTeam[2] ~= 0 and GetScore( RoomID, MinTeam[2] ) < 9 then
						AddTeamItem(RoomID, MinTeam[2] , 203038 , 25)
						end
						if MinTeam[3] ~= 0 and GetScore( RoomID, MinTeam[3] ) < 9 then
						AddTeamItem(RoomID, MinTeam[3] , 203038 , 15)
						end
						if MinTeam[4] ~= 0 and GetScore( RoomID, MinTeam[4] ) < 9 then
						AddTeamItem(RoomID, MinTeam[4] , 203038 , 5)
						end
					end
					Setp = 2
					break
				end
				-- 檢查戰場開始時間至今已多久, 若達五分鐘仍未完成, 則關閉戰場
				if CheckFlagBig == 1 then
					ScriptMessage( OwnerID(),  -1, 2, "---[SC_RACEGAME_TIMETOOLONG_60]---" , 0 )	--比賽時間過久
				elseif CheckFlagBig == 30 then
					ScriptMessage( OwnerID(),  -1, 2, "---[SC_RACEGAME_TIMETOOLONG_30]---" , 0 )	--比賽時間過久
				elseif CheckFlagBig == 55 then
					ScriptMessage( OwnerID(),  -1, 2, "---[SC_RACEGAME_TIMETOOLONG_5]---" , 0 )	--比賽時間過久
				elseif CheckFlagBig == 56 then
					ScriptMessage( OwnerID(),  -1, 2, "---[SC_RACEGAME_TIMETOOLONG_4]---" , 0 )	--比賽時間過久
				elseif CheckFlagBig == 57 then
					ScriptMessage( OwnerID(),  -1, 2, "---[SC_RACEGAME_TIMETOOLONG_3]---" , 0 )	--比賽時間過久
				elseif CheckFlagBig == 58 then
					ScriptMessage( OwnerID(),  -1, 2, "---[SC_RACEGAME_TIMETOOLONG_2]---" , 0 )	--比賽時間過久
				elseif CheckFlagBig == 59 then
					ScriptMessage( OwnerID(),  -1, 2, "---[SC_RACEGAME_TIMETOOLONG_1]---" , 0 )	--比賽時間過久
				elseif CheckFlagBig == 60 then
					ScriptMessage( OwnerID(),  -1, 2, "---[SC_RACEGAME_TIMETOOLONG_0]---" , 0 )	--比賽時間過久
					-- 時間已到, 使用劇情, 將所有有害的 buff 消除, 等待, 
					local Obj
					local Count = SetSearchAllPlayer(RoomID)
					if Count ~= 0 then
						for i = 1 , Count , 1 do
							local ID = GetSearchResult()
							Obj = Role:New( ID )
							if Obj:IsPlayer() == true and ID ~= OwnerID() then
								AddBuff(ID,502690,0,-1)		--等待比賽結束
							end
						end	
					end
					for i=1, 8 do
						if GetScore( RoomID, i ) == 0 then
							SetScore( RoomID, i , 100 );		--設定分數為失敗
						end
					end
					---- 清除所有印記
					--for i=0, table.getn(Mark) do
					--	DelObj(Mark[i])
					--end
					--for i=0, table.getn(hindrance) do
					--	for j=0, table.getn(hindrance[i]) do
					--		DelObj(hindrance[i][j])
					--	end
					--end
					--CheckBGWinner();
					---檢查是否有人中離..不管跑完與否..重新排名次
					local CountWinnerF = {}
					for i=1,8 do
						local CountTeam = GetNumEnterTeamMember(RoomID,i)	--該隊總和人數
						if CountTeam == 0 then
							if GetScore( RoomID, i ) ~= 0 then
								SetScore( RoomID, i , 255 );			--設定分數為失敗
								CountWinnerF[i] = {i,255}
							end
						else
							CountWinnerF[i] = {i,GetScore( RoomID, i )}
						end
					end
					local Min = {}
					local MinTeam = {}
					local BaseTeam = {}
					for j=1, 8 do  
						for i=1, table.getn(CountWinnerF) do
							if Min[j] == nil then
								Min[j] = CountWinnerF[i][2]
								MinTeam[j] = CountWinnerF[i][1]
								BaseTeam[j] = i
								DebugMsg( 0, RoomID ,"1MinTeam[j]="..MinTeam[j])
								DebugMsg( 0, RoomID ,"1CountWinnerF[i]="..CountWinnerF[i][2])
							end
							if CountWinnerF[i][2] ~= 0 then
								if CountWinnerF[i][2] > 0 and CountWinnerF[i][2] < Min[j] then
									Min[j] = CountWinnerF[i][2]
									MinTeam[j] = CountWinnerF[i][1]
									BaseTeam[j] = i
									DebugMsg( 0, RoomID ,"3MinTeam[j]="..MinTeam[j])
									DebugMsg( 0, RoomID ,"3CountWinnerF[i]="..CountWinnerF[i][2])
								end
							end
						end
						DebugMsg( 0, RoomID ,"4MinTeam[j]="..MinTeam[j])
						DebugMsg( 0, RoomID ,"5Min[j]="..Min[j])
						local Remo = BaseTeam[j]
						DebugMsg( 0, RoomID ,"========!!Team ="..MinTeam[j].." Score ="..CountWinnerF[Remo][2])
						SetScore( RoomID, MinTeam[j], CountWinnerF[Remo][2] );	--設定第一名分數
						table.remove(CountWinnerF,Remo)
					end
					Sleep(15)
					EndBattleGround( RoomID, MinTeam[1] );

					if MinTeam[1] ~= 0 and GetScore( RoomID, MinTeam[1] ) < 9 then
					AddTeamItem(RoomID, MinTeam[1] , 203038 , 45)
					end
					if MinTeam[2] ~= 0 and GetScore( RoomID, MinTeam[2] ) < 9 then
					AddTeamItem(RoomID, MinTeam[2] , 203038 , 25)
					end
					if MinTeam[3] ~= 0 and GetScore( RoomID, MinTeam[3] ) < 9 then
					AddTeamItem(RoomID, MinTeam[3] , 203038 , 15)
					end
					if MinTeam[4] ~= 0 and GetScore( RoomID, MinTeam[4] ) < 9 then
					AddTeamItem(RoomID, MinTeam[4] , 203038 , 5)
					end
					Setp = 2
					break
				end
				if FirstTemp ~= 0 then
					CheckFlagBig = CheckFlagBig + 1	
				end
				CheckFlag = CheckFlag + 1;
			end
			Sleep(10)
		end
	end
	if Setp == 2 then	--結束階段
		ScriptMessage( OwnerID(),  -1, 2, "[SC_RACEGAME_CLOSEGROUND]" , 0 )	--比賽已結束，競技場將在兩分鐘後關閉
		Sleep(1200)
		CloseBattleGround(RoomID)
	end
end

function LuaZone_RACEGAME_Revive()
	-- 區域重生劇情
	local	X 	= 2378
	local	Y	= 55
	local	Z 	= 2338
	local	Dir	= 19
	WriteRoleValue( OwnerID(), EM_RoleValue_X, X );
	WriteRoleValue( OwnerID(), EM_RoleValue_Y, Y );
	WriteRoleValue( OwnerID(), EM_RoleValue_Z, Z );
	WriteRoleValue( OwnerID(), EM_RoleValue_Dir, Dir );

end

function LuaZone_RACEGAME_JoinQueue( dbid, isTeam, numTeamPeople )

	local totalteam 		= GetNumTeam();	-- 取得這戰場最多允許的隊伍數量
	local lowestTeamID		= nil;
	local lowestTeamPeopleNumer	= nil;

	for i = 1, totalteam, 1 do
		
		local TeamPeopleNumber = GetNumQueueMember( i ); --取得

		if( lowestTeamID == nil ) then
			lowestTeamID 		= i;
			lowestTeamPeopleNumer	= TeamPeopleNumber;
		elseif( TeamPeopleNumber < lowestTeamPeopleNumer ) then
			lowestTeamID 		= i;
			lowestTeamPeopleNumer	= TeamPeopleNumber;
		end
	end

	return lowestTeamID;	-- 傳回該人物要進那個佇列
end
function LuaZone_RACEGAME_World_JoinQueue( dbid, BattleGroundType, WorldGroupID, LevelGroupID )


	local totalteam 		= GetNumTeam();	-- 取得這戰場最多允許的隊伍數量
	local lowestTeamID		= nil;
	local lowestTeamPeopleNumer	= nil;

	for i = 1, totalteam, 1 do
		
		local TeamPeopleNumber = GetNumQueueMember(LevelGroupID, i ); --取得

		if( lowestTeamID == nil ) then
			lowestTeamID 		= i;
			lowestTeamPeopleNumer	= TeamPeopleNumber;
		elseif( TeamPeopleNumber < lowestTeamPeopleNumer ) then
			lowestTeamID 		= i;
			lowestTeamPeopleNumer	= TeamPeopleNumber;
		end
	end

	return lowestTeamID;	-- 傳回該人物要進那個佇列
end
function LuaZone_RACEGAME_AssignLevelGroup( dbid, lv, worldid )
	return 1
end
function LuaZone_RACEGAME_RoleEnterBattleGround( dbid, teamID )
	local Owner = GetGUIDByDBID(dbid)
	--CancelBuff(Owner, 503080)
	SetHourseColor(Owner,0,0,0,0)
	SetBattleGroundObjCampID( dbid, 6 );	--設為中立陣營
end

function LuaZone_RACEGAME_MoveRoleToBattleGround( WorldID, ZoneID, dbid, teamid, roomid )
	if teamid == 1 then
		MoveRoleToBattleGround( WorldID, ZoneID, dbid, roomid, 2378, 60, 2338, 19 );	--設定出生點
	elseif teamid == 2 then
		MoveRoleToBattleGround( WorldID, ZoneID, dbid, roomid, 2380, 60, 2351, 19 );	--設定出生點
	elseif teamid == 3 then
		MoveRoleToBattleGround( WorldID, ZoneID, dbid, roomid, 2383, 60, 2363, 19 );	--設定出生點
	elseif teamid == 4 then
		MoveRoleToBattleGround( WorldID, ZoneID, dbid, roomid, 2386, 60, 2384, 19 );	--設定出生點
	elseif teamid == 5 then
		MoveRoleToBattleGround( WorldID, ZoneID, dbid, roomid, 2387, 60, 2391, 19 );	--設定出生點
	elseif teamid == 6 then
		MoveRoleToBattleGround( WorldID, ZoneID, dbid, roomid, 2375, 60, 2318, 19 );	--設定出生點
	elseif teamid == 7 then
		MoveRoleToBattleGround( WorldID, ZoneID, dbid, roomid, 2373, 60, 2306, 19 );	--設定出生點
	elseif teamid == 8 then
		MoveRoleToBattleGround( WorldID, ZoneID, dbid, roomid, 2371, 60, 2288, 19 );	--設定出生點
	end
end

function LuaZone_RACEGAME_CheckOK(Time,NowTime,type)
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local Obj
	local Count = SetSearchAllPlayer(RoomID)
	if Count ~= 0 then
		for i = 1 , Count , 1 do
			local ID = GetSearchResult()
			Obj = Role:New( ID )
			if Obj:IsPlayer() == true then
				StartClientCountDown ( ID, Time, NowTime, 0, 0, type, "[SC_1V1PVP_COUNTDOWN]" )	--玩家Client顯示倒數10秒
			end
		end	
	end
end

function LuaZone_RACEGAME_cancelbuff()
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local Obj
	local Count = SetSearchAllPlayer(RoomID)
	if Count ~= 0 then
		for i = 1 , Count , 1 do
			local ID = GetSearchResult()
			Obj = Role:New( ID )
			if Obj:IsPlayer() == true then
				CancelBuff(ID, 503080)
			end
		end	
	end
end
function LuaZone_PCall_350_CheckJoinBattleGround( iObjID, iBattleGroundID, iPartyID, iSrvID )
	local Party = LuaFunc_PartyData(iObjID)
	if Party[0] == 1 then
	else
		ScriptMessage( iObjID, iObjID, 2, "[SC_1V1PVP_PARTYERROR]" , 0 )	--請先脫離隊伍在報名
		return 1;	-- 不加入
	end	
	if (CheckBuff( iObjID , 503080 ) == false) then
		CallPlot( iObjID, "LuaZone_PCall_350_JoinBattleGround", iObjID, iBattleGroundID, iPartyID, iSrvID )
		return 1;	-- 不加入
	else
		return 0;	-- 直接加入
	end	
end

function LuaZone_PCall_350_JoinBattleGround( iObjID, iBattleGroundID, iPartyID, iSrvID )
	if CheckBuff( iObjID, 501570) == false then  --增加檢查判斷
		AddBuff( iObjID, 501570,0,-1);--然後給予BUFF
		
		DialogCreate( iObjID , EM_LuaDialogType_YesNo ,"[SC_RACEGAME_GETTACKT]")
		DialogSelectStr( iObjID , "[SC_GETTITLE_1]" );
		DialogSelectStr( iObjID , "[SC_CANCEL]" );
		if( DialogSendOpen( iObjID ) == false ) then 
			ScriptMessage( iObjID,iObjID,1,"[SYS_FIXEQ_DATA_ERROR]",0)	
			--資料送出有問題
			return
		end
		for i = 0 , 100 , 1 do
			Sleep( 1 );
			SelectID = DialogGetResult( iObjID );
			if ( SelectID ~= -2 ) and ( SelectID ~= -1 ) and i < 100 then
				if ( SelectID == 0 ) then
					if (CountBodyitem(iObjID,203038) >= 15 )then
						AddBuff(iObjID, 503080, 0, -1)		--取得票據
						DelBodyitem(iObjID,203038,15)
						CancelBuff( iObjID, 501570 );--最後清除BUFF
						DialogClose( iObjID )
						--要求開啟公會戰競標介面, 資訊傳給 DC, DC 在將資訊轉給 Client
						JoinBattleGround( iObjID, iBattleGroundID, iPartyID, iSrvID )
						break;
					else
						ScriptMessage( iObjID,iObjID,1,"[SC_111813_YU_36]",0)	
						--
						CancelBuff( iObjID, 501570 );--最後清除BUFF
						DialogClose( iObjID )
						-- 2012.07.16 修正玩家於報名跨伺服器競賽 - 馳風大道(Zone 441)時，在必爾汀代幣(203038)持有不足的情況下，重覆點擊確定報名後，會於對話視窗顯示「已經開啟一個對話選項」的問題。					
						break;
					end
				elseif ( SelectID == 1 ) then
					CancelBuff( iObjID, 501570 );--最後清除BUFF
					DialogClose( iObjID )		
					break
				end
			elseif i == 100 then
				CancelBuff( iObjID, 501570 );--最後清除BUFF
				DialogClose( iObjID )		
				break
			end
		end
	else
		ScriptMessage( iObjID, iObjID, 0, "[SC_WINDOW_OPENED]", 0 );
	end
end