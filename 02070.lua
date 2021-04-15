--感恩節 2010 活動  - 彩羽祈願

--隱藏物件npc劇情
------------------------------------------------------------------------------------
function lua_mika_thankday_hidebox() --隱藏物件生鶴鴕和判斷距離用box
	Say(OwnerID(), "ostrich born !" )
	Beginplot(OwnerID(), "Lua_mika_thankday_ostrichborn", 0 ) --生鶴鴕
	Say(OwnerID(), "box born !" )
	Beginplot(OwnerID(), "Lua_mika_thankday_boxborn", 0 ) --生box
end

--隱藏物件生鶴鴕 
function Lua_mika_thankday_ostrichborn() --
	local ostrich={}
	for i = 0, 29 do  --30
		ostrich[i] = CreateObjByFlag(116038, 780769, i ,1) --使用旗子產生 npc 旗子編號 數量 
		SetModeEx( ostrich[i]  , EM_SetModeType_Strikback, false )--反擊
		SetModeEx( ostrich[i]  , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
		SetModeEx( ostrich[i]  , EM_SetModeType_Obstruct, false )--阻擋
		SetModeEx( ostrich[i]  , EM_SetModeType_Fight , false )--可砍殺攻擊
		SetModeEx( ostrich[i]  , EM_SetModeType_Searchenemy, false )--索敵
		SetModeEx( ostrich[i]  , EM_SetModeType_Mark, true )--標記
		SetModeEx( ostrich[i]  , EM_SetModeType_Move, true )--移動
		SetModeEx( ostrich[i]  , EM_SetModeType_HideName, true )--名稱
		SetModeEx( ostrich[i]  , EM_SetModeType_ShowRoleHead, true )--頭像框
		AddToPartition( ostrich[i],0 )	--
		WriteRoleValue( ostrich[i] , EM_RoleValue_PID , i )
		Beginplot(ostrich[i], "lua_mika_thankday_ostrich" , 0 )
		Beginplot(ostrich[i], "lua_mika_thankday_range" , 0 )
	end
end

--隱藏物件生判斷距離用箱子
function Lua_mika_thankday_boxborn() --
	local box={}
	for i = 0, 29 do  --30
		box[i] = CreateObjByFlag(115826, 780769, i ,1) --使用旗子產生 npc 旗子編號 數量 
		SetModeEx( box[i], EM_SetModeType_Fight , false )--可砍殺攻擊
		SetModeEx( box[i], EM_SetModeType_Strikback, false )--反擊
		SetModeEx( box[i], EM_SetModeType_Mark, false )--標記
		SetModeEx( box[i], EM_SetModeType_SearchenemyIgnore, false )--被搜尋
		SetModeEx( box[i], EM_SetModeType_Obstruct, false )--阻擋
		SetModeEx( box[i], EM_SetModeType_Gravity, false )--重力
		SetModeEx( box[i], EM_SetModeType_Move, false )--移動
		SetModeEx( box[i], EM_SetModeType_ShowRoleHead, false )--頭像框
		SetModeEx( box[i], EM_SetModeType_Searchenemy, false )--索敵
		SetModeEx( box[i], EM_SetModeType_Show, false )--顯示  隱藏物件
		AddToPartition( box[i], 0 )
	end
end

function lua_mika_thankday_ostrich()
	local ID = OwnerID()--鶴鴕
	while true do 
		local Player = SearchRangePlayer( ID , 60) --判斷附近是否有玩家
		if CheckBuff(ID, 507707 ) == false then  --沒有進食中BUFF
			if CheckID( Player[0] ) == true then	--如果附近XX內有玩家		
				local dis = Rand( 50 )    --有玩家則移動距離20-50
				if dis < 30 then
					dis = 30
				end
	--			Say(ID, "Move="..dis )
				AdjustFaceDir(ID, Player[0] , 180 ) --面向 背對
				WriteRoleValue( ID  ,EM_RoleValue_IsWalk , 0  )--用跑的
				sleep(5)
				Lua_MoveLine( ID , Dis ) --參考物件，向前移動到Dis距離的位置 (Dis 填 負數 為 向後移動)
				sleep(10)
			else
				local TempNPC =  SearchRangeNPC( OwnerID() , 30 ) 	--掃周圍範圍內的npc
				for i=1,table.getn(TempNPC) do		
					if ReadRoleValue( TempNPC[i], EM_RoleValue_OrgID ) == 116039 then  --如果附近有乾糧
				--		Say(ID, "Find food !")
						Npcsay(ID, "[SC_THANKSGIVING_2010_10]" )  --鶴鴕發現食物時說話
						AdjustFaceDir(ID, TempNPC[i], 0 ) --面向
						PlayMotion( ID, ruFUSION_ACTORSTATE_PARRY_UNARMED )  --動作
						Addbuff(ID, 507707, 0, 15 )  --給BUFF 進食中 15sec
						sleep(50)
						DelObj(TempNPC[i])
						break
					end
				end
			end
		end

		sleep(10)   --掃
	end
end

-- 判斷鶴鴕與HIDEBOX間距離 (掛在鶴鴕身上)
function lua_mika_thankday_range()
	local ID = OwnerID()--鶴鴕
	local PID = ReadRoleValue( ID , EM_RoleValue_PID )  --PID值代表在哪一根FLAG旁邊
	local Box = LuaFunc_SearchNPCbyOrgID( ID , 115826, 200 , 0)       --判斷距離用隱藏物件
	while true do 
		local range =  GetDistance( ID , Box  )  --鶴鴕和隱藏物件之間的距離
	--	Say(ID, "range="..range )
	--	Say(ID, "PID="..PID )
		DW_MoveRand(ID, 30 )  --ObjID 想進行移動的物件   RandRange 想隨機移動的范圍(直徑)
		if range >= 100 then
	--		Say(ID, "go back" )
			WriteRoleValue( ID, EM_RoleValue_IsWalk, 0) 			--RUN
			LuaFunc_MoveToFlag( ID, 780769, PID, 0)        			--移動到指定的棋子 第0個
		--	WriteRoleValue( ID, EM_RoleValue_IsWalk, 2 ) 			--WALK
		end
		sleep(80)   --8秒掃一次
	end
end