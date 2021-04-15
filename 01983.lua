--啤酒節活動 其他npc

--隱藏物件跑劇情 115818
-----判斷活動NPC活動開放報名.開始.結束狀態 
-----執行跑馬燈出現劇情
-----執行活動開始時出現木桶劇情
function lua_mika_beercontest_cast()  -- 活動時間判斷
	local npc = LuaFunc_SearchNPCbyOrgID(OwnerID() , 121168, 100 , 0)       --活動NPC
	while true do
		Sleep(600)   --一分鐘跑一次
		local hour = GetSystime(1)
		local min = GetSystime(2)

		local pid = ReadRoleValue ( npc , EM_RoleValue_PID )  --NPCPID
		local ZoneID = ReadRoleValue(OwnerID() , EM_RoleValue_RealZoneID)				
		if ZoneID <= 1000 then
			if pid == 99 then -- 測試用寫入報名
				RunningMsgEx( OwnerID() , 2 , 3 , "[SC_BEERDAY_NEW_CAST01]" )   --廣播開始  --2012.08.21 廣播改版
				WriteRoleValue( npc , EM_RoleValue_PID , 1) --把數值改為1 報名期間 (npc)
				local pid = ReadRoleValue ( npc , EM_RoleValue_PID )  --NPCPID
				Say(npc, "test - come on join, pid = "..pid)
			elseif pid == 100 then -- 測試用寫入報名
				RunningMsgEx( OwnerID() , 2 , 3 , "[SC_BEERDAY_NEW_CAST02]" )   --廣播開始  --2012.08.21 廣播改版
				Beginplot(OwnerID(), "lua_mika_beercontest_boxborn" , 0 )   --木桶出現劇情
				WriteRoleValue( npc , EM_RoleValue_PID , 2) --把數值改為2  活動開始 (npc)
				WriteRoleValue( npc , EM_RoleValue_Register+1 , 0 ) --將npc改回沒人第一名
				local pid = ReadRoleValue ( npc , EM_RoleValue_PID )  --NPCPID
				Say(npc, "test -start,  pid = "..pid)
				Beginplot(OwnerID(), "lua_mika_beercontest_testev" , 0 )   -- 測試用的活動時間到 , 4分鐘提醒, 5分鐘後結束

			elseif hour == 1 or hour == 3 or hour == 5 or hour == 7 or hour == 9 or hour == 11 or hour == 13 or hour == 15 or hour == 17 or hour == 19 or hour == 21 or hour == 23 then
				if  min == 50 then  
					RunningMsgEx( OwnerID() , 2 , 3 , "[SC_BEERDAY_NEW_CAST01]" )   --廣播開始  --2012.08.21 廣播改版

					-- 想奪得冠軍獲得獨一無二的獎杯武器嗎？啤酒節活動『運酒快手』現在開放報名囉！截止時間為整點，有興趣者請立即前往[SC_ZONE_DAELANIS]城門口向[115819]報名參加！
					WriteRoleValue( npc , EM_RoleValue_PID , 1) --把數值改為1 報名期間 (npc)
					local pid = ReadRoleValue ( npc , EM_RoleValue_PID )  --NPCPID
				--	Say(OwnerID(), pid)
				end
			elseif hour == 0 or hour == 2 or hour == 4 or hour == 6 or hour == 8 or hour == 10 or hour == 12 or hour == 14 or hour == 16 or hour == 18 or hour == 20 or hour == 22 then      
				if min == 0 then
					RunningMsgEx( OwnerID() , 2 , 3 , "[SC_BEERDAY_NEW_CAST02]" )   --廣播開始  --2012.08.21 廣播改版
					--啤酒節活動『運酒快手』開始囉！請至[SC_ZONE_DAELANIS]城內各處啤酒桶收集啤酒，第一個達成指定數量並回報主持人者，將可獲得冠軍！
					Beginplot(OwnerID(), "lua_mika_beercontest_boxborn" , 0 )   --木桶出現劇情
					local pid = ReadRoleValue ( npc , EM_RoleValue_PID )  --NPCPID
					WriteRoleValue( npc , EM_RoleValue_PID , 2) --把數值改為2  活動開始 (npc)
					WriteRoleValue( npc , EM_RoleValue_Register+1 , 0 ) --將npc改回沒人第一名
				--	local pid = ReadRoleValue ( npc , EM_RoleValue_PID )  --NPCPID
				--	Say(OwnerID(), pid)
				elseif min == 9 then
					RunningMsgEx( OwnerID() , 2 , 3 , "[SC_BEERDAY_NEW_CAST03]" )   --廣播開始  --2012.08.21 廣播改版
					--啤酒節活動『運酒快手』即將於1分鐘後結束，加快你的腳步完成達成目標吧！
				elseif min == 10 then 
					RunningMsgEx( OwnerID() , 2 , 3 , "[SC_BEERDAY_NEW_CAST04]" )   --廣播開始  --2012.08.21 廣播改版
					Beginplot(OwnerID(), "lua_mika_beercontest_boxkill" , 0 )  --刪除木桶劇情
					--感謝各位熱情參與，本場次啤酒節活動『運酒快手』已結束，下場活動將於2小時後開始。
					local pid = ReadRoleValue ( npc , EM_RoleValue_PID )  --NPCPID
					WriteRoleValue( npc , EM_RoleValue_PID , 0 ) --把數值改為0  活動結束
				--	local pid = ReadRoleValue ( npc , EM_RoleValue_PID )  --NPCPID
				--	Say(OwnerID(), pid)
				end
			end
		end
	end
end

-- 測試用 - 使用測試指令讓活動開始的計時器, 活動的時間提示 和活動結束用
function lua_mika_beercontest_testev()
	local OID = OwnerID()  -- Hidebox
	local npc = LuaFunc_SearchNPCbyOrgID(OID , 121168, 100 , 0)       --活動NPC
	local time1 = 240
	local time2 = 300
	local timer = 0 
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
	
	while true do 
		timer = timer +1 
		say(npc, "time ="..timer )
		if timer%60 == 0 then -- 60秒才進來一次
			if timer == time2 then  -- 活動開始10分鐘 
				if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
					RunningMsgEx( OID , 2 , 3 , "[SC_BEERDAY_NEW_CAST04]" )   --廣播提示  
				end
				Beginplot(OID, "lua_mika_beercontest_boxkill" , 0 )  --刪除木桶劇情
				WriteRoleValue( npc , EM_RoleValue_PID , 0 ) --把數值改為0  活動結束
				break
			elseif timer == time1 then  -- 活動開始9分鐘
				if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
					RunningMsgEx( OID , 2 , 3 , "[SC_BEERDAY_NEW_CAST03]" )   --廣播結束 
				end
			end
		end
		sleep(10)
	end
end

--活動開始時木桶出現劇情
function lua_mika_beercontest_boxborn()  
	local X = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99}  --100個
	local Y = 0
	local Y5 = {}
	for i = 1 , 50 do   -- 產生50個
		Y = Rand(table.getn(X))+1
		Y5[i] = X[Y]
		table.remove(X,Y)
		local box = {}
		box[i] = CreateObjByFlag(115820 , 780323, Y5[i] ,1) --使用旗子產生木桶 npc 旗子編號 數量 
		SetModeEx( box[i]    , EM_SetModeType_Strikback, false )--反擊
		SetModeEx( box[i]    , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
		SetModeEx( box[i]    , EM_SetModeType_Obstruct, false )--阻擋
		SetModeEx( box[i]    , EM_SetModeType_Mark, true )--標記
		SetModeEx( box[i]    , EM_SetModeType_Move, false )--移動
		SetModeEx( box[i]    , EM_SetModeType_Searchenemy, false )--索敵
		SetModeEx( box[i]    , EM_SetModeType_HideName, false )--名稱
		SetModeEx( box[i] , EM_SetModeType_ShowRoleHead, false )--頭像框
		SetModeEx( box[i] , EM_SetModeType_Fight , false )--可砍殺攻擊
		AddToPartition( box[i], 0 )	--讓木桶產生
		SetPlot(box[i], "Touch" , "lua_mika_beercontest_box2" , 50 )
	--	Say(OwnerID(),"Y5 "..i.." = "..Y5[i])-- i = 第幾個 ,  y5[i]  = 數字
	end
--	Say(OwnerID(), "BORN OK")
end


--活動開始時木桶刪除劇情
function lua_mika_beercontest_boxkill()  
	local TempObj = {115820}
	for i = 1 ,table.getn(TempObj) do
		Lua_DavisDelObj(TempObj[i])
	end
--	Say(OwnerID(), "KILL OK")
end

--木桶劇情 115820
function lua_mika_beerbox_buff()
	Addbuff(OwnerID(), 506936 , 0 , -1 ) --節慶活動BUFF
end

function lua_mika_beercontest_box()
	SetPlot( OwnerID() , "Touch" , "lua_mika_beercontest_box2" , 50 )
end

function lua_mika_beercontest_box2()
	local O_ID = OwnerID() 	-- 玩家
	local T_ID = TargetID()  	-- NPC
	if BeginCastBarEvent( O_ID, T_ID,"[SC_BEERDAY_NEW25]", 20, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "lua_mika_beercontest_box3" ) ~= 1 then
		ScriptMessage( O_ID, O_ID, 0,"[SAY_NPC_BUSY]", 0 )--目標忙碌中
		return
	end
end

function lua_mika_beercontest_box3(O_ID, CheckStatus)   -- <---() 內 參數一定要有
	local O_ID = OwnerID() 	 -- 玩家
	local T_ID = TargetID()  	-- NPC

	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			-- 成功
			EndCastBar( O_ID, CheckStatus );
		--	ScriptMessage(O_ID, O_ID , 1 , "OK" , "0xffffff00" )  --BeginCastBar成功了。
		--	ScriptMessage(O_ID, O_ID , 0 , "OK" , "0xffffff00" )  
			local join = Checkbuff(OwnerID(), 506907 ) --已參加狀態buff
			local needbeer = 15  --需求啤酒數量
			if join == true then --為有報名狀態
				local beercount = ReadRoleValue ( OwnerID() , EM_LuaValueFlag_UseItem10 ) -- 啤酒的數量(Player)
				if beercount >= needbeer then
					ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_BEERDAY_NEW_BOX01]" , C_SYSTEM )	--畫面中間訊息  你已達成目標，請盡速回報活動主持人，祝你獲得冠軍！
					ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_BEERDAY_NEW_BOX01]" , C_SYSTEM )	--訊息欄
				else
					local beercount = ReadRoleValue ( OwnerID() , EM_LuaValueFlag_UseItem10 ) -- 啤酒的數量(Player)
				--	Say(OwnerID(), beercount)
					AddRoleValue(OwnerID(), EM_LuaValueFlag_UseItem10, 1)  --分數+1
					local beercount = ReadRoleValue ( OwnerID() , EM_LuaValueFlag_UseItem10 ) -- 啤酒的數量(Player)
				--	Say(OwnerID(), beercount) 
					Beginplot(TargetID(), "lua_mika_beercontest_hide" , 0 )
					ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_BEERDAY_NEW_BOX02][$SETVAR1="..beercount.."][$SETVAR2="..needbeer.."]" , C_SYSTEM ) 
				--畫面中間訊息  已取得啤酒瓶數量：[$VAR1] / [$VAR2] 。
					ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_BEERDAY_NEW_BOX02][$SETVAR1="..beercount.."][$SETVAR2="..needbeer.."]" , C_SYSTEM )	--訊息欄
					if beercount >= needbeer then
						ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_BEERDAY_NEW_BOX03]" , C_SYSTEM )	--畫面中間訊息  恭喜你達成目標，請盡速回報活動主持人！
						ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_BEERDAY_NEW_BOX03]" , C_SYSTEM )	--訊息欄
					end
				end
			else
				ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_BEERDAY_NEW_BOX04]" , 0 )	--畫面中間訊息  你尚未參加『運酒快手』活動，請於報名時間報名參加。
				ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_BEERDAY_NEW_BOX04]" , 0 )	--訊息欄
			end

		else
			-- 失敗
			EndCastBar( O_ID, CheckStatus );
		--	ScriptMessage(O_ID, O_ID , 1 , "Fail" , "0xffffff00" )  --BeginCastBar失敗了。
		--	ScriptMessage(O_ID, O_ID , 0 , "Fail" , "0xffffff00" )  
		end
	end
end

function lua_mika_beercontest_hide()
--	Say(OwnerID(), "11")  --npc
--	Say(TargetID(), "21")  --plyaer
	Hide(OwnerID() )
	local ran = rand(100)   
	if ran <= 20  then   -- 0 -20
		Sleep(200)  --
	elseif ran >= 21 and ran <= 50  then   -- 21 -40
		Sleep(300)  --
	elseif ran >= 51 and ran <= 75  then   -- 41 -60
		Sleep(350)  --
	elseif ran >= 76 and ran <= 90  then   -- 61 -80
		Sleep(350)  --
	elseif ran >= 91  then   --  up 81
		Sleep(400)  --
	end
	Show(OwnerID(), 0)
end