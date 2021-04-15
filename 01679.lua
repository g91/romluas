function Lua_FN_DDR_NPCtalk() --掛在NPC上的開場跟終場對話事件
	--Owner是玩家 Target是NPC
	WriteRoleValue ( TargetID() , EM_RoleValue_Register1, OwnerID())
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register1, 0)

	SetSpeakDetail( OwnerID(), "[SC_DDR_STRING01_START]"  ) --NPC開始遊戲前台詞
	AddSpeakOption( OwnerID(), TargetID(), "[SC_RULE]"  , "Lua_FN_DDR_teach", 0 ) --選項:規則說明
	AddSpeakOption( OwnerID(), TargetID(), "[SC_DDR_STRING03]"  , "Lua_FN_DDR_Main", 0 ) --選項:開始跳舞
	AddSpeakOption( OwnerID(), TargetID(), "[SC_EXIT_EXAM]"  , "Lua_FN_DDR_leave", 0 ) --選項:離開

end

function Lua_FN_DDR_Main()
	WriteRoleValue( OwnerID() , EM_RoleValue_Register2 , 0 )  --2015/04/20 奈奈新增
	BeginPlot( TargetID(), "Lua_FN_DDR_Dance", 0 ) --Target是NPC
end

function Lua_DelItem10sec()			--讓加分物品刪除自己的function
	sleep( 100 )
	DelObj( OwnerID() )
end

function Lua_DelItem6sec()			--讓加分物品刪除自己的function
	sleep( 60 )
	DelObj( OwnerID() )
end

function Lua_DelItem4sec()			--讓加分物品刪除自己的function
	sleep( 40 )
	DelObj( OwnerID() )
end

function Lua_DDRBonus()
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register2, ReadRoleValue ( OwnerID() , EM_RoleValue_Register2)+5) --用玩家的Register2來記錄加分
end

--創造地板--
function Lua_FN_DDR_Dance()
	say (OwnerID(),"[SC_DDR_STRING05]") --OwnerID是指NPC
	local DDR_finish = true --true為沒還結束，false為結束
	local PLAYER = ReadRoleValue ( OwnerID() , EM_RoleValue_Register1 )
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )
	local GameLevel = 1 --紀錄關卡等級
	local GameWave = 12 --每關卡等級波數
	local GameWaveCheck = 0 --用來判斷玩家玩到第幾波
	local DDRScore = 0
	local slptime01 = 20 --從  發光 →     刺    的間隔
	local slptime02 = 10  --從   刺  →  下次發光 的間隔
	local Bonuslocation = 0
	SetFlag( PLAYER  , 542175 , 1 ) -- 記錄本日已經玩過
	SetSmallGameMenuType( PLAYER , 6 , 1 ) --記分板，填1為創造，填2為關閉
	SetSmallGameMenuStr( PLAYER , 6 , 1 , "[SC_DDR_STRING07_STATE][$SETVAR1="..DDRScore.."]" )
	SetSmallGameMenuStr( PLAYER , 6 , 2 , "[SC_DDR_STRING07_SCORE][$SETVAR1="..DDRScore.."]" )

	
--創造地板--
	local DDRfloor = Lua_MadeRectangleByXYZ(112046 , 2052 , 44 , 2579 , 269 , 39 , 39 , 5 , 5)
--	local DDRfloor = Lua_MadeByRectangle(112046 , 39 , 39 , 5 , 5)
	for x=1 , table.getn(DDRfloor) do	
		SetModeEx( DDRfloor[x] , EM_SetModeType_Strikback, false )--反擊
		SetModeEx( DDRfloor[x] , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
		SetModeEx( DDRfloor[x] , EM_SetModeType_Obstruct, false )--阻擋
		SetModeEx( DDRfloor[x] , EM_SetModeType_Mark, false )--標記
		SetModeEx( DDRfloor[x] , EM_SetModeType_Move, false )--移動
		SetModeEx( DDRfloor[x] , EM_SetModeType_Searchenemy, false )--索敵
		SetModeEx( DDRfloor[x] , EM_SetModeType_HideName, false )--名稱
		SetModeEx( DDRfloor[x] , EM_SetModeType_ShowRoleHead, false )--頭像框
		SetModeEx( DDRfloor[x] , EM_SetModeType_Fight , false )--可砍殺攻擊
		SetModeEx( DDRfloor[x] , EM_SetModeType_DisableRotate, false )--轉向
	end

--設定地板組合--
	local Hit = {}
	Hit[1] = {1,2,4,6,7,9,15,13,11,12,14,20,18,16,25,23,21}
	Hit[2] = {5,3,1,2,4,10,9,15,11,14,20,19,25,23,21,22,24}
	Hit[3] = {3,1,4,8,6,9,13,11,14,18,16,19,23,21,24}
	Hit[4] = {5,1,2,10,6,7,15,11,12,20,16,17,25,21,22}
	Hit[5] = {3,1,2,8,6,7,13,11,12,18,16,17,23,21,22}
	Hit[6] = {10,8,6,7,9,15,13,11,12,14,20,18,16,17,19}
	Hit[7] = {3,2,10,6,9,13,12,20,16,19,23,22}
	Hit[8] = {5,3,2,4,10,8,7,9,11,20,18,17,19,23,25,22,24}
	Hit[9] = {5,3,1,10,8,6,15,13,11,12,14,16,17,19,21,22,24}
	Hit[10] = {3,2,10,8,6,7,9,13,12,20,18,16,17,19,23,22}
	Hit[11] = {8,6,7,13,11,12,18,16,17}
	Hit[12] = {5,1,4,8,7,15,11,14,18,17,25,21,24}
	Hit[13] = {5,3,1,2,4,10,8,6,7,9,20,18,16,17,19}
	Hit[14] = {5,3,1,2,4,15,13,11,12,14,20,18,16,17,19}
	Hit[15] = {3,1,2,10,8,6,7,15,13,11,12,20,18,16,17}
	Hit[16] = {8,6,7,9,13,11,12,14,18,16,17,19,23,21,22}
	Hit[17] = {1,8,7,15,14,18,17,21,6,13,12,16}
	Hit[18] = {5,3,1,2,4,15,13,11,12,14,25,23,21,22,24}
	Hit[19] = {5,4,10,8,7,9,15,13,11,12,14,20,18,17,19,25,24}
	Hit[20] = {5,3,1,2,4,8,6,7,11,18,16,17,25,23,21,22,24}

	
	CloseSpeak( TargetID() )
	sleep(10)
	SetPos(TargetID(), 2049,45,2460,271)	--傳送玩家到場地中央
	AddBuff(TargetID(),505638,1 ,-1 );  --不讓玩家使用原本職業技能
	Hide( OwnerID() )

	sleep(50) 
--閃電護欄--
	local TempTable = {}
	local TempNPC =  SearchRangeNPC ( TargetID() , 300 )
	for i=0,table.getn(TempNPC) do
		if ReadRoleValue( TempNPC[i], EM_RoleValue_OrgID  ) == 101273 then
			local TempPID =  ReadRoleValue( TempNPC[i], EM_RoleValue_PID  ) 
			TempTable[TempPID] = TempNPC[i]
		end
	end
	
-------------
	for j=1,10 do
		if DDR_finish == true then
			for i=1,GameWave do 	--------------------------------------------------------------整個遊戲的主要過程↓
				local hitselect = Rand(table.getn(Hit))
				for x=1,table.getn(Hit[hitselect+1]) do --選取Hit內的每一個地板執行動作
					ChangeObjID(DDRfloor[Hit[hitselect+1][x]],114338)
				end
				sleep(1)
				for x=1,table.getn(Hit[hitselect+1]) do --選取Hit內的每一個地板執行動作
					ChangeObjID(DDRfloor[Hit[hitselect+1][x]],112046)
				end
				sleep(slptime01)
				for x=1,4 do --閃電護欄施法
					if x == 4 then
						CastSpellLv( TempTable[4],TempTable[1], 495328 , 20 )
					else
						CastSpellLv( TempTable[x],TempTable[x+1], 495328 , 20 )
					end
				end
				for x=1,table.getn(Hit[hitselect+1]) do --選取Hit內的每一個地板執行動作
					SysCastSpellLv(DDRfloor[Hit[hitselect+1][x]],DDRfloor[Hit[hitselect+1][x]],494798,1)-- 這邊是執行刺的動作
				end
				for x=1,4 do --閃電護欄施法
					if x == 4 then
						CastSpellLv( TempTable[4],TempTable[1], 495328 , 20 )
					else
						CastSpellLv( TempTable[x],TempTable[x+1], 495328 , 20 )
					end
				end

				if GameLevel >= 3 then	--給予加分物品
					if GameWaveCheck%4 == 0 then	--每當4的倍數波次才產出加分物品
						
						ScriptMessage( TargetID(), TargetID(), 1, "[SC_DDR_STRING13]","0xffffffff" );
						Bonuslocation = Rand(table.getn(Hit[hitselect+1]))+1
						local BonusItem = CreateObjByObj ( 205026 , DDRfloor[Hit[hitselect+1][Bonuslocation]])
						if GameLevel >= 6 then		--lv6 之後存在時間變長
							BeginPlot( BonusItem, "Lua_DelItem10sec", 0 ) 		--時間到刪掉加分物品
						else
							BeginPlot( BonusItem, "Lua_DelItem6sec", 0 ) 		--時間到刪掉加分物品
						end
					end
					if GameWaveCheck%3 == 0 then	--每當3的倍數波次才產出輔助物品，三選一
						Bonuslocation = Rand(table.getn(Hit[hitselect+1]))+1
						local DDRITEM = Rand(3)
						local BonusItem
						if DDRITEM == 0 then 
							BonusItem = CreateObjByObj ( 205027 , DDRfloor[Hit[hitselect+1][Bonuslocation]])
						elseif DDRITEM == 1 then 
							BonusItem = CreateObjByObj ( 205028 , DDRfloor[Hit[hitselect+1][Bonuslocation]])
						elseif DDRITEM == 2 then 
							BonusItem = CreateObjByObj ( 205029 , DDRfloor[Hit[hitselect+1][Bonuslocation]])
						end
						if GameLevel >= 6 then		--lv6 之後存在時間變長
							BeginPlot( BonusItem, "Lua_DelItem6sec", 0 ) 		--時間到刪掉加分物品
						else
							BeginPlot( BonusItem, "Lua_DelItem4sec", 0 ) 		--時間到刪掉加分物品
						end
					end
				end
				sleep(slptime02)
				if ReadRoleValue( TargetID() , EM_RoleValue_IsDead) == 1 or CheckID(TargetID()) == FALSE then  --判斷玩家是否死亡，死亡的話break
					--WriteRoleValue ( TargetID() , EM_RoleValue_Register2,2 )
					DDR_finish = false
					break
				else
					GameWaveCheck = GameWaveCheck + 1
					DDRScore = DDRScore + 1 + ReadRoleValue( TargetID() , EM_RoleValue_Register2) --加上玩家吃到加分物品的額外分數
					SetSmallGameMenuStr( PLAYER , 6 , 1 , "[SC_DDR_STRING07_STATE][$SETVAR1="..DDRScore.."]" ) --改變記分板
					WriteRoleValue ( TargetID() , EM_RoleValue_Register2, 0) --加分物品的額外分數因為已經算進去DDRScore了，所以歸0
				end
			end			--------------------------------------------------------------整個遊戲的主要過程↑

			if DDR_finish == true then --判斷玩家通過的波數，是否符合該等級波數，符合表示通過
				GameLevel = GameLevel + 1
				GameWaveCheck = 0

				if GameLevel == 1 or GameLevel == 3 or GameLevel == 5 or GameLevel == 7 or GameLevel == 9 then --判斷遊戲等級來提升難度
					slptime01 = slptime01-2
					slptime02 = slptime02-1
				end

				if GameLevel >= 11 then --判斷玩家是否完成整個試煉
					Show(OwnerID(),RoomID)
					sleep(50)
					ScriptMessage( TargetID(), TargetID(), 1, "[SC_DDR_STRING12]", "0xffffffff" )--令人驚訝!! 你通過了試煉!!
					--WriteRoleValue ( TargetID() , EM_RoleValue_Register2,2 )
					DDR_finish = false
					
					SetSmallGameMenuType( TargetID() , 6 ,2 )
					local RoomID = ReadRoleValue( TargetID() ,EM_RoleValue_RoomID)
--					AddRoleValue(TargetID(),EM_RoleValue_Honor,DDRScore)--給予榮譽值
					ScriptMessage( TargetID(), TargetID(), 0, "[SC_DDR_STRING14]", "0xffffffff" )
--					ScriptMessage( TargetID(), TargetID(), 0, "[SC_DDR_STRING15]"..DDRScore, "0xffffffff" )
					--------------------------------------------------------------------// 2013/04/23 FN進行校場統一獎勵
					FN_GuildGame_Honor( TargetID(), DDRScore )
--					local GuildGameLV = GuildGameLVArea[RoomID]
--					local Honor = DDRScore * (1+(0.1*GuildGameLV))
--					AddRoleValue(TargetID(), EM_RoleValue_Honor, Honor) -- 增加榮譽值
--					ScriptMessage( TargetID(), TargetID(), 3, "[SC_DDR_STRING15]"..Honor, C_SYSTEM )
					--------------------------------------------------------------------
					sleep(30)
					ChangeZone( TargetID(), 354 , RoomID , 5121.3, 13.4, 2515.2, 269.9 )
				else
					ScriptMessage( TargetID(), TargetID(), 1, "[SC_DDR_STRING06]"..GameLevel.."[SC_DDR_STRING08]", "0xffffffff" )
					SetSmallGameMenuStr( PLAYER , 6 , 2 , "[SC_DDR_STRING07_SCORE][$SETVAR1="..GameLevel.."]" )
					sleep(100)
				end
			else	--玩家如果死亡會跑這邊
				if CheckID(TargetID()) == TRUE then
					GameWaveCheck = GameWaveCheck+1
					SetSmallGameMenuType( TargetID() , 6 ,2 )
					local RoomID = ReadRoleValue( TargetID() ,EM_RoleValue_RoomID)
					--------------------------------------------------------------------// 2013/04/23 FN進行校場統一獎勵
					FN_GuildGame_Honor( TargetID(), DDRScore )
					--------------------------------------------------------------------
					CancelBuff_NoEvent( TargetID(), 505638 ) --cancel掉無法使用職業技能的狀態
					sleep(15)
					ScriptMessage( TargetID(), TargetID(), 0, "[SC_DDR_STRING14]", "0xffffffff" )
					ScriptMessage( TargetID(), TargetID(), 0, "[SC_DDR_STRING15]"..DDRScore, "0xffffffff" )
					ChangeZone( TargetID(), 354 , RoomID , 5121.3, 13.4, 2515.2, 269.9 )
					Revive( TargetID(), 354 , 5121.3, 13.4, 2515.2, 269.9 )
					sleep(15)
					ScriptMessage( TargetID(), TargetID(), 1, "[SC_DDR_STRING09]"..GameLevel.."[SC_DDR_STRING10]"..GameWaveCheck.."[SC_DDR_STRING11]", "0xffffffff" );
				end
				Show(OwnerID(),RoomID)
			end
		else
			break
		end
	end
	for y=1,table.getn(DDRfloor) do
		DelObj(DDRfloor[y])
	end
end

function Lua_FN_DDR_teach() --遊戲教學
	SetSpeakDetail( OwnerID(), "[SC_DDR_STRING01_TEACH]"  ) --NPC台詞
	--AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "Lua_FN_DDR_NPCtalk", 0 ) --回上一頁
end


function Lua_FN_DDR_leave() --離去
	CloseSpeak( OwnerID() )
	--WriteRoleValue ( OwnerID() , EM_RoleValue_Register2,1 )
	SetSmallGameMenuType( OwnerID() , 6 ,2 ) --記分板，填1為創造，填2為關閉
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
--	AddRoleValue(OwnerID(),EM_RoleValue_Honor,DDRScore)--給予榮譽值 2015/04/20  屏蔽此行，修正報錯問題
--	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_DDR_STRING14]", "0xffffffff" );
	ChangeZone( OwnerID(), 354 , RoomID , 5121.3, 13.4, 2515.2, 269.9 )	--ChangeZone( OwnerID(), ZoneID 區域ID , 第幾層 0 為第0層 -1代表只跑副本規則 , x, y, z, Dir)
end