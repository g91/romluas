-- 2013.03.14 阿浩：6.0.0 配合貨幣整合重新撰寫
function Lua_mika_losttreasurebox_01() -- 古老寶箱(113617) 物件產生後執行的觸碰觸情
	SetPlot( OwnerID() , "touch" , "Hao_Zone355_Chest_1" , 10 )
end

function Lua_mika_losttreasurebox_03() -- 翡翠寶箱(113618) 物件產生後執行的觸碰觸情
	SetPlot( OwnerID() , "touch" , "Hao_Zone355_Chest_1" , 10 )
end

function Lua_mika_losttreasurebox_05() -- 紫晶寶箱(113619) 物件產生後執行的觸碰觸情
	SetPlot( OwnerID() , "touch" , "Hao_Zone355_Chest_1" , 10 )
end

function Hao_Zone355_Chest_1()

	local Player = OwnerID()	-- 玩家
	local Chest = TargetID()	-- 寶箱
	local Play_dead = 505297	-- 假死Buff
	local CastTime = 50
	local OrgID = ReadRoleValue( Chest , EM_RoleValue_OrgID )	-- 讀取資料庫設定的物件ID

	if CheckBuff( Player , Play_dead ) == true then
		ScriptMessage( Player , Player , 1 , "[SC_LOSTTREASURE_MSG02]" , C_SYSTEM )	--你處於裝死狀態無法行動。
		ScriptMessage( Player , Player , 0 , "[SC_LOSTTREASURE_MSG02]" , C_SYSTEM )
	else
		if BeginCastBarEvent( Player , Chest , "[SO_110195_1]" , CastTime , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_END , 0 , "Hao_Zone355_Chest_2" ) ~= 1 then
			ScriptMessage( Player , Player , 0 , "[SAY_NPC_BUSY]" , 0 )	--目標正在忙碌中
			return
		end
	end
end

function Hao_Zone355_Chest_2( Player , CheckStatus )	-- 活動副本 - 古代秘寶 古老寶箱劇情、執行者、執行結果(大於0是成功，小於0是失敗)

	local Chest = TargetID()	-- 寶箱
	local PlayerLv = ReadRoleValue( Player , EM_RoleValue_LV )	-- 讀取玩家等級
	local OrgID = ReadRoleValue( Chest , EM_RoleValue_OrgID )	-- 讀取資料庫設定的物件ID
	local Treasure = { [113617] = 725010 , [113618] = 725051 , [113619] = 725013 }	-- 古老寶箱(113617)、 翡翠寶箱(113618)、紫晶寶箱(113619)
	if CheckStatus ~= 0 then	-- 如果有施法條時
		if CheckStatus > 0 then	-- 施法成功
			if EmptyPacketCount(Player) >= 2 and QueuePacketCount(Player) == 0 then --檢查背包欄位
				PlayMotionEX( Chest , ruFUSION_ACTORSTATE_ACTIVATE_BEGIN , ruFUSION_ACTORSTATE_ACTIVATE_LOOP )  --寶箱持續播放145、146
				-- 6.0.1 新增特殊獎勵判斷條件 -----------------------------
				if PlayerLv >= 61 and CheckFlag(Player, 548091 ) == True then
					Setflag(Player, 548091, 0 )  -- 清空此key
					GiveBodyItem( Player , 203487 , 1 )   -- 魔幻寶盒能量1點。
					ScriptMessage( Player , Player , 1 , "[SC_LOSTTREASURE_SECRET]" , C_SYSTEM ) -- 達成特殊通關條件，獲得[203487]1個。
					ScriptMessage( Player , Player , 0 , "[SC_LOSTTREASURE_SECRET]" , C_SYSTEM ) -- 達成特殊通關條件，獲得[203487]1個。
				end
				GiveBodyItem( Player , Treasure[OrgID] , 1 )
				if PlayerLv >= 50 and Lua_Hao_Return_Buff_Lv( Player , 505590 ) == 1 then	-- 玩家等級>=50級、以及玩家當場次未領取過必爾汀圓貝時
					Hao_Monetary_Union_240181(Player , 30)
					AddBuff( Player , 505590 , 0 , -1 )	-- 利用此Buff堆疊的方式，避免玩家重複領取的問題
				end
				if OrgID == 113619 then
					DW_QietKillOne( Player , 106279 )	-- 徽章稱號系統 - 每日任務 開啟紫晶寶箱*5
				end
				SetPlot( Chest , "touch" , "" , 10 )
			else
				ScriptMessage( Player , Player , 1 , "[K_08MID_DIALOG8]" , 0 ) --您的背包空間不足，請清理一下再來吧。
			end
			EndCastBar( Player , CheckStatus )
		else	-- 施法失敗
			EndCastBar( Player , CheckStatus )
		end
	end
end
----------2013.03.14 阿浩，以上為此次整合部分
--石版
Function Lua_mika_losttreasurebox_08()
--	Say(TargetID(),"TargetID")
--	Say(OwnerID(),"OwnerID")
	if CheckBuff(OwnerID(), 505297) == true then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_LOSTTREASURE_MSG02]" , C_SYSTEM )	--你處於裝死狀態無法行動。
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_LOSTTREASURE_MSG02]"  , C_SYSTEM )
	else
		if BeginCastBar( OwnerID(), "[SC_LOSTTREASURE_25]", 30 , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_END , 0 ) == 1 then	--/*開始施法，使用者,時間條上的文字,進行時間,起始動作,結束動作,中斷條件(0為移動中斷)

			while true do
			sleep( 2 )
				local CastBarStatus = CheckCastBar( OwnerID() )
				if ( CastBarStatus ~= 0 ) then 
					if ( CastBarStatus > 0) then -- 成功
						result = "OKOK"
						EndCastBar( OwnerID() , CastBarStatus )
						break;
					elseif ( CastBarStatus < 0 ) then -- 失敗
						result = "DAME"
						EndCastBar( OwnerID() , CastBarStatus )
						break;
					end
				end
			end

			if ( result == "OKOK" ) then

				if CheckID( TargetID() ) == true then
					if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then --檢查背包欄位
						PlayMotionEX( TargetID(), ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP)  --寶箱持續播放145    146
						GiveBodyItem( OwnerID() ,206422 , 1 ) --破碎石版
						SetPlot( TargetID(),"touch","",0 )
						sleep(10)
					else
						ScriptMessage( TargetID() , OwnerID() , 1 , "[K_08MID_DIALOG8]" , 0 ) --您的背包空間不足，請清理一下再來吧。
						SetPlot( TargetID(),"touch","Lua_mika_losttreasurebox_08",10 )
					end	
				end
			elseif ( result == "DAME" ) then
				SetPlot( TargetID(),"touch","Lua_mika_losttreasurebox_08",10 )
			end
		end
	end
end