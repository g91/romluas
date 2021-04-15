--門編號 
--BOSS編號 
--巡邏旗標 781081
--門標 781079
--box觸碰用 781080
function Dy_Z24_AIC() --主要控制器
	local fight --戰鬥判斷
	local fight1 = 0 --開戰判斷
	local weakp = 0 --偵測弱點記數
	local rush = 0 --狂暴記數
	local roomid = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) --讀出物件在哪一層
	local Door = CreateObjByFlag( 102460 , 781079 , 2 , 1 ) ---編號要改 之 Boss後門  
	local Door2 --前門
	local ball --中場判斷距離用
	local ZoneID = ReadRoleValue ( OwnerID(), EM_RoleValue_ZoneID )
	SetModeEx( Door , EM_SetModeType_Show, true) ----秀出
	SetModeEx( Door , EM_SetModeType_Mark, false) ----標記
	SetModeEx( Door , EM_SetModeType_Strikback, false) ---反擊
	SetModeEx( Door , EM_SetModeType_Move, false) ---移動	
	SetModeEx( Door , EM_SetModeType_Fight, false) ---可砍殺
	SetModeEx( Door , EM_SetModeType_SearchenemyIgnore, true) ---物件不會被搜尋
	SetModeEx( Door , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
	SetModeEx( Door , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
	SetModeEx( Door , EM_SetModeType_Searchenemy, false)  ---索敵
	SetModeEx( Door   , EM_SetModeType_Obstruct, true )--阻擋
	AddToPartition( Door,roomid )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register4 , Door)--將此物件的GID儲存至控制器的Register4中，以方便日後刪除用
	WriteRoleValue( OwnerID(), EM_RoleValue_Register2, 0)
	local Boss
	if ZoneID == 149 then
		Boss = CreateObjByFlag( 106609 , 781081 , 1 , 1 ) ---生出Boss (BOSS編號  ,旗標編號 第N隻旗標 生出幾個怪) 
	else
		Boss = CreateObjByFlag( 107453 , 781081 , 1 , 1 )
	end
	SetModeEx( Boss , EM_SetModeType_Show, true) ----秀出
	SetModeEx( Boss , EM_SetModeType_Mark, true) ----標記
	SetModeEx( Boss , EM_SetModeType_Strikback, true) ---反擊
	SetModeEx( Boss , EM_SetModeType_Move, true) ---移動	
	SetModeEx( Boss , EM_SetModeType_Fight, true) ---可砍殺
	SetModeEx( Boss , EM_SetModeType_SearchenemyIgnore, true) ---物件不會被搜尋
	SetModeEx( Boss , EM_SetModeType_HideName, true)  ---物件頭上是否顯示名稱
	SetModeEx( Boss , EM_SetModeType_HideMinimap, true)  ---物件是否在小地圖上顯示
	SetModeEx( Boss , EM_SetModeType_Searchenemy, true)  ---索敵
	SetModeEx( Boss   , EM_SetModeType_Obstruct, false )--阻擋	
	WriteRoleValue(Boss,EM_RoleValue_IsWalk,1) --設定走路動作 --0為跑步 1為走路
	SetPlot( Boss,"dead","Dy_Z24_dead",10 )----Boss 死亡劇情
	WriteRoleValue( Boss, EM_RoleValue_PID, OwnerID()) --將控制器寫入BOSS裡
	WriteRoleValue( OwnerID(), EM_RoleValue_Register1, Boss) --將Boss寫入控制器中的Register1
	AddToPartition( Boss,roomid )
	--※※巡邏劇情※※
	BeginPlot( Boss, "Dy_Z24BOSSAI", 10) ---Boss的戰鬥Function (  BOSS BOSS的LUA_AI  秒\每10=1秒)
		
	--戰鬥開始控制器要做的事情
	while 1  do
		sleep(10)
		fight = ReadRoleValue( OwnerID() , EM_RoleValue_Register2 )	 --讀取寫入控制器第2格的數字
		if fight == 1 then --戰鬥中
		
			if fight1 == 0 then --避免每次迴圈重跑一直生門
				ScriptMessage( Boss, -1 , 2 , "[SC_106609_FIGHT]" , 2 ) --喊話放這邊才不會一直跑
				Door2 = CreateObjByFlag( 102460 , 781079 , 1 , 1 ) ---編號要改 之 Boss前門 
				ball = CreateObjByFlag( 106105 , 781081 , 4 , 1 )				
				SetModeEx( Door2 , EM_SetModeType_Show, true) ----秀出
				SetModeEx( Door2 , EM_SetModeType_Mark, false) ----標記
				SetModeEx( Door2 , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( Door2 , EM_SetModeType_Move, false) ---移動	
				SetModeEx( Door2 , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( Door2 , EM_SetModeType_SearchenemyIgnore, true) ---物件不會被搜尋
				SetModeEx( Door2 , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
				SetModeEx( Door2 , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
				SetModeEx( Door2 , EM_SetModeType_Searchenemy, false)  ---索敵
				SetModeEx( Door2   , EM_SetModeType_Obstruct, true )--阻擋
				SetModeEx( ball , EM_SetModeType_Show, false) ----秀出
				SetModeEx( ball , EM_SetModeType_Mark, false) ----標記
				SetModeEx( ball , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( ball , EM_SetModeType_Move, false) ---移動	
				SetModeEx( ball , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( ball , EM_SetModeType_SearchenemyIgnore, true) ---物件不會被搜尋
				SetModeEx( ball , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
				SetModeEx( ball , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
				SetModeEx( ball , EM_SetModeType_Searchenemy, false)  ---索敵
				SetModeEx( ball   , EM_SetModeType_Obstruct, false )--阻擋
				AddToPartition( Door2,roomid )
				AddToPartition( ball,roomid )
				WriteRoleValue( OwnerID() , EM_RoleValue_Register3 , Door2)--將此物件的GID儲存至控制器的Register3中，以方便日後刪除用
				WriteRoleValue( OwnerID() , EM_RoleValue_Register5 , ball)
				fight1 = 1
				--BeginPlot( Boss, "Dy_Z24BOSSAI", 10) ---Boss的戰鬥Function (  BOSS BOSS的LUA_AI  秒\每10=1秒)
			end
			rush = rush+1 --狂暴記數
			weakp = weakp+1 --偵測弱點記數
			--say (Boss, "rush = "..rush)
			--say (Boss, "weakp = "..weakp)
			
			if rush >= 360 then
				if ZoneID==149 then
					AddBuff(Boss , 623667 , 0 , -1) --狂暴Buff 需要修改編號
				end	
			end
			
			if weakp % 15 == 0 then
				local ran = Rand(100)+1
				if ran % 2 == 1 then
					ScriptMessage( Boss, -1 , 2 , "[SC_106609_WEAK1]" , 2 )
					sysCastSpellLv	( Boss,  Boss , 499075, 0 )  --偵測弱點物理
					--say (OwnerID(), "weak01")
				elseif ran % 2 ==0 then
					ScriptMessage( Boss, -1 , 2 , "[SC_106609_WEAK2]" , 2 )
					sysCastSpellLv	( Boss,  Boss , 499076, 0 ) --偵測弱點法術
					--say (OwnerID(), "weak02")
				end
			end

		--滅團時
		elseif fight == 2 then
			ScriptMessage( Boss, -1 , 2 , "[SC_106609_BYE]" , 2 )
			sleep (30)
			Delobj(Door2) --刪除掉前門
			Delobj(Boss) --刪除掉Boss
			Delobj(ball) 
			sleep(50)
			--刪除玩家身上的法術	
			local npcp = {}
			npcp = SearchRangePlayer( OwnerID() , 1000 ) 
			local num = table.getn(npcp) 
			for i=0,num,1 do
				if CheckBuff (npcp[i] , 621935 ) == true 
				and ReadRoleValue( npcp[i] , EM_RoleValue_IsDead ) ~= 1 then
					CancelBuff	(npcp[i] , 621935 )
				end
				if CheckBuff (npcp[i] , 621937 ) == true 
				and ReadRoleValue( npcp[i] , EM_RoleValue_IsDead ) ~= 1 then
					CancelBuff	(npcp[i] , 621937 )
				end
			end			
			--Boss重生
			if ZoneID == 149 then
				Boss = CreateObjByFlag( 106609 , 781081 , 1 , 1 ) ---生出Boss (BOSS編號  ,旗標編號 第N隻旗標 生出幾個怪) 
			else
				Boss = CreateObjByFlag( 107453 , 781081 , 1 , 1 )
			end 
			SetPlot( Boss,"dead","Dy_Z24_dead",10 )----Boss 死亡劇情
			WriteRoleValue( Boss, EM_RoleValue_PID, OwnerID()) --將控制器寫入BOSS裡
			WriteRoleValue( OwnerID(), EM_RoleValue_Register1, Boss) --將Boss寫入控制器中的Register1
			AddToPartition( Boss,roomid )
			BeginPlot( Boss, "Dy_Z24BOSSAI", 10) ---Boss的戰鬥Function (  BOSS BOSS的LUA_AI  秒\每10=1秒)
			WriteRoleValue( OwnerID(), EM_RoleValue_Register2, 0)	

			fight = 0 
			fight1 = 0
			weakp = 0
			rush = 0 --狂暴記數歸零
		--Boss死亡時
		elseif fight == 3 then
			Delobj(Door)
			if Door2 ~= nil then
				Delobj(Door2)
				Delobj(ball) 
			end
			WriteRoleValue( OwnerID(), EM_RoleValue_Register2, 0)
			break
		end
	end	
end
function Dy_Z24BOSSAI()
	local Boss = OWnerID()
	local time1 = 0 --大絕記數
	local time2 = 0 --普招記數
	local luck
	local skill = {499071 , 499070 } ------------AE傷害 , 鍊型箭矢
	local skillspeak = {"[SC_106609_02]" , "[SC_106609_03]" }
	local skillLV = { 0 , 0  } 
	local CH1 = ReadRoleValue( Boss , EM_RoleValue_PID ) 	--讀出控制器的GID
	local door = ReadRoleValue( CH1 , EM_RoleValue_Register3 ) --讀出後門的GID
	local door2 = ReadRoleValue( CH1 , EM_RoleValue_Register4 ) --讀出前門的GID
	local ball = ReadRoleValue( CH1 , EM_RoleValue_Register5 )
	local roomID = ReadRoleValue(Boss , EM_RoleValue_RoomID ) --讀出Boss在哪一層
	local fight = 0 --戰鬥開關
	--say (OwnerID() , "111")
	--say (door , "door")
	--say (door , "door2")
	WriteRoleValue(Boss,EM_RoleValue_IsWalk,1) --設定跑步動作 --0為跑步 1為走路
	BeginPlot( Boss, "Dy_Z24BOSSMOVE", 10) --巡邏劇情
	while 1 do
	sleep(10)
	local AttackTarget = ReadRoleValue( Boss , EM_RoleValue_AttackTargetID ) --讀正在攻擊的目標
	
		if  AttackTarget ~= 0  and ( CheckID( Boss ) ) == true then	--如果目標人數>0，而且自己存在時，判定進入戰鬥
			fight = 1 --表示正在戰鬥中
			WriteRoleValue(Boss ,EM_RoleValue_IsWalk,0) --設定跑步動作 --0為跑步 1為走路
			WriteRoleValue( CH1, EM_RoleValue_Register2, 1) --回傳控制器說已經在戰鬥中了
			time1 = time1 + 1
			time2 = time2 + 1
			if time1 %5 == 0 and GetDistance (Boss,AttackTarget)>=50 then --每五秒判斷目標沒在距離100內就會變強
				AddBuff( Boss , 621943 , 0 , -1)
			end
			
			--大絕階段
			if time1 % 23 ==0 then
				door = ReadRoleValue( CH1 , EM_RoleValue_Register3 ) --讀出後門的GID
				door2 = ReadRoleValue( CH1 , EM_RoleValue_Register4 )
				ball = ReadRoleValue( CH1 , EM_RoleValue_Register5 )
				time2 = 0 --停止普招的計時
				local time3 = 0 --大絕結束計時
				local player2 ={}
				local player1 ={}  --只有坦 
				local luck3 --定身的抓人
				--local luck4 --亂射的抓人
				local range1 = GetDistance (Boss , door)
				local range2 = GetDistance (Boss , door2)
				local range3 = GetDistance (Boss , ball)
				ScriptMessage( Boss, -1 , 2 , "[SC_106609_01]" , 2 )
				player2 = DW_HateRemain(1) --仇恨表找人   填0代表 不排除主坦
				player1 = DW_HateRemain(0)
				local choose = table.getn(player2)
				--say (player2[1] , "000")
				--say (player2[1] , "111")
				sleep(10)
				--※※距離判斷※※--
				--say(AttackTarget,"range1 = "..range1)
				--say(AttackTarget,"range2 = "..range2)
				--say(AttackTarget,"range3 = "..range3)
				
				if range1 > range2 then --如果到後門>到前門則把玩家踢到後門
					if range2 < range3 then
						FA_FaceFlagEX ( Boss , 781079 , 2 , 0 , 0) 
						local ALLP = SetSearchAllPlayer(RoomID ) --搜尋全部玩家
						for i = 0 , ALLP ,1 do --把玩家抓入九宮格區域
							local PID = GetSearchResult()
							if ReadRoleValue( PID , EM_RoleValue_IsDead ) ~= 1 and --沒死
							ReadRoleValue( PID, EM_RoleValue_VOC) ~= 0  and --不是GM
							ReadRoleValue( PID , EM_RoleValue_RoomID  ) == RoomID then --在同層
							SetPosByFlag( PID , 781079 , 4 ) 
							end
						end
					else
						FA_FaceFlagEX ( Boss , 781079 , 2 , 0 , 0) 
						local ALLP = SetSearchAllPlayer(RoomID ) --搜尋全部玩家
						for i = 0 , ALLP ,1 do --把玩家抓入九宮格區域
							local PID = GetSearchResult()
							if ReadRoleValue( PID , EM_RoleValue_IsDead ) ~= 1 and --沒死
							ReadRoleValue( PID, EM_RoleValue_VOC) ~= 0  and --不是GM
							ReadRoleValue( PID , EM_RoleValue_RoomID  ) == RoomID then --在同層
							SetPosByFlag( PID , 781081 , 4 ) 
							end
						end
					end	
					--781081 中間點
				else --如果到前門>到後門則把玩家踢到前門
					if range1 < range3 then
						FA_FaceFlagEX ( Boss , 781079 , 1 , 0 , 0) 
						local ALLP = SetSearchAllPlayer(RoomID ) --搜尋全部玩家
						for i = 0 , ALLP ,1 do --把玩家抓入九宮格區域
							local PID = GetSearchResult()
							if ReadRoleValue( PID , EM_RoleValue_IsDead ) ~= 1 and --沒死
							ReadRoleValue( PID, EM_RoleValue_VOC) ~= 0  and --不是GM
							ReadRoleValue( PID , EM_RoleValue_RoomID  ) == RoomID then --在同層
							SetPosByFlag( PID , 781081 , 4 ) 
							end
						end
					else
						FA_FaceFlagEX ( Boss , 781079 , 1 , 0 , 0) 
						local ALLP = SetSearchAllPlayer(RoomID ) --搜尋全部玩家
						for i = 0 , ALLP ,1 do --把玩家抓入九宮格區域
							local PID = GetSearchResult()
							if ReadRoleValue( PID , EM_RoleValue_IsDead ) ~= 1 and --沒死
							ReadRoleValue( PID, EM_RoleValue_VOC) ~= 0  and --不是GM
							ReadRoleValue( PID , EM_RoleValue_RoomID  ) == RoomID then --在同層
							SetPosByFlag( PID , 781079 , 3 ) 
							end
						end
					
					end	
				
				end
					
				
				
				--↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑--
				--※※設定Boss動作※※
				SetModeEx( Boss , EM_SetModeType_Move, false) ---讓自己無法移動
				local luck2 
					ScriptMessage( Boss, -1 , 2 , skillspeak[2] , 2 )
					sleep(30)
					if player1 == false then
						player1 = {}
					end
					luck2 = Rand(table.getn(player1))+1			--RAND到的數字	
					if ( player1[luck2] ~= nil ) and ( ReadRoleValue( player1[luck2] , EM_RoleValue_IsDead ) == 0 ) then
						CastSpellLv( Boss , player1[luck2] , skill[2] , skillLV[2])
					end
					sleep(20)
				--SetDefIdleMotion( OwnerID() , bow_ready )bow_channel  bow_release bow_ready
				--※※抓玩家數量※※
				if choose == 1 then
					AddBuff( player2[1] , 621939 , 0 , 8) --定身8秒
					AddBuff( player2[1] , 621940 , 0 , 10) --標記
					sleep (50)
					sysCastSpellLv	( Boss,  player2[1] , 499746 , 0 ) 
				elseif choose == 2 then 
					AddBuff( player2[1] , 621939 , 0 , 8) --定身8秒
					AddBuff( player2[2] , 621940 , 0 , 10) --標記
					sleep (50)
					sysCastSpellLv	( Boss,  player2[2] , 499746 , 0 )					
				elseif choose >= 3 then
					luck3 = Az_RND_Ary(1,choose,3) --從1~6中取出3個
					AddBuff( player2[luck3[1]] , 621939 , 0 , 8) --定身8秒
					AddBuff( player2[luck3[2]] , 621939 , 0 , 8) --定身8秒
					AddBuff( player2[luck3[2]] , 621940 , 0 , 8) --標記第三個人
					AddBuff( player2[luck3[2]] , 623765 , 0 , 5) --標記第三個人
					AddBuff( player2[luck3[3]] , 621940, 0 , 10) --標記第四個人
					sleep (50)
					sysCastSpellLv	( Boss,  player2[luck3[2]] , 499746 , 0 ) 
					sysCastSpellLv	( Boss,  player2[luck3[3]] , skill[2] , skillLV[2] )
				elseif table.getn(player1) == 1 then  --單刷
					AddBuff( player1[1] , 621939 , 0 , 8) --定身8秒
					AddBuff( player1[1] , 621940 , 0 , 10) --標記
					sleep (50)
					sysCastSpellLv	( Boss, player1[1] , 499746 , 0 )
				end
				--→拉弓的表演←
				--Dy_Z24BOSSSHOT()		-- 
				time2 = 0
				sleep (20)
			end
			
			--普通招式
			if time2 > 5 then
				luck = Rand(100)+1
				while 	ReadRoleValue(Boss , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
						sleep(2)
				end			
				if luck % 2 == 0 then --施放AE傷害
					ScriptMessage( Boss, -1 , 2 , skillspeak[1] , 2 )
					CastSpellLV( Boss , Boss , skill[1] , skillLV[1] )
				elseif luck % 2 ==1 then --施放鍊型傷害
					local player = {}
					local luck2 
					ScriptMessage( Boss, -1 , 2 , skillspeak[2] , 2 )
					sleep(10)
					
					player = DW_HateRemain(0) --仇恨表找人   填0代表 不排除主坦
					if player == false then
						player = {}
					end
					luck2 = Rand(table.getn(player))+1			--RAND到的數字	
					if ( player[luck2] ~= nil ) and ( ReadRoleValue( player[luck2] , EM_RoleValue_IsDead ) == 0 ) then
						CastSpellLv( Boss , player[luck2] , skill[2] , skillLV[2])
					end
					table.remove( player , luck2 ) --放完後刪除掉table裡面的玩家資料
					sleep(1)
				end
				time2 = 0
			end
		elseif AttackTarget ==0 and fight ==1 then
			time1 = 0
			time2 = 0
			WriteRoleValue( CH1, EM_RoleValue_Register2, 2) --回傳控制器玩家滅團
		
		end
	end
end

function Dy_Z24_TOUCH()
end

function Dy_Z24_dead() ----Boss 死亡劇情
	local CH1 = ReadRoleValue( OwnerID() , EM_RoleValue_PID )  --讀出控制器的ID
	local roomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID )
	ScriptMessage( CH1, -1 , 2 , "[SC_106609_DEAD]" , 2 ) --死亡字串

	--刪除玩家身上的法術	
	local npcp = {}
    npcp = SearchRangePlayer( OwnerID() , 1000 ) 
	local num = table.getn(npcp) 
	for i=0,num,1 do
		if CheckBuff (npcp[i] , 621935 ) == true then
			CancelBuff	(npcp[i] , 621935 )
		end
		if CheckBuff (npcp[i] , 621937 ) == true then
			CancelBuff	(npcp[i] , 621937 )
		end
	end
	WriteRoleValue( CH1, EM_RoleValue_Register2, 3)
end
function Dy_Z24BOSSMOVE () --移動劇情
	WriteRoleValue(OwnerID(),EM_RoleValue_IsWalk,1) --設定跑步動作 --0為跑步 1為走路
	while 1 do 
		if  hatelistcount(OwnerID()) == 0 then
			for i = 2 , 4 , 1 do 
				WriteRoleValue(OwnerID(),EM_RoleValue_IsWalk,1) --設定跑步動作 --0為跑步 1為走路
				LuaFunc_MoveToFlag	( OwnerID(), 781081 , i , 0)
				--LuaFunc_MoveAllFlag( OwnerID(), 781081 ) 
				sleep(30)
			end
		else
			break
			--MoveToFlagEnabled( OwnerID(), false ) --關掉巡邏劇情
		end
		sleep(10)
	end
end
function Dy_Z24BOSSSHOT () --表演劇情
	local time3 = 0
	local player3 ={}
	local CH1 = ReadRoleValue( OwnerID() , EM_RoleValue_PID ) 	--讀出控制器的GID
	local npcp = {}
	local luck5 = {}
	local num2
	while 1 do
		sleep(10)
		player3 = DW_HateRemain(0) --仇恨表找人   填0代表 不排除主坦
		npcp = SearchRangePlayer( OwnerID() , 100 )
		local num = table.getn(npcp)
		
		time3 = time3 +1 
		--say (OwnerID(), "time3 = "..time3)
		
		--隨機亂射
		--10秒沒有人在BOSS100範圍內則+BOSS攻擊傷害
		--[[if num ~=0 then
			break
		end--]]
		if time3 % 5  == 0 then
			if num == 0 then
				AddBuff( OwnerID() , 621943 , 0 , -1)
			end
		elseif  time3 % 10 == 0 then -- 其餘時間施放亂射
			if player3 == false then
				player3 ={}
			end
			num2 = table.getn(player3)
			luck4 = DW_Rand(num2)				
			if num2 == 1 and 
			ReadRoleValue( player3[1] , EM_RoleValue_IsDead ) == 0 then
				sysCastSpellLv	( OwnerID(),  player3[luck4] , 499072 , 0 ) 
			elseif num2 > 1 then
				luck5 = Az_RND_Ary(1,num2,2)
				sysCastSpellLv	( OwnerID(),  player3[luck5[1]] , 499072 , 0 ) 
				sysCastSpellLv	( OwnerID(),  player3[luck5[2]] , 499072, 0 )
				sleep(10)
			end
		elseif hatelistcount(OwnerID()) == 0 then
			WriteRoleValue( CH1, EM_RoleValue_Register2, 2) --回傳控制器玩家滅團
		elseif time3 %13 == 0 then
			break
		end
	end
end
function Lua_un_bossfight2_149()    --分攤箭雨
		local own = OwnerID()
		local ZoneID = ReadRoleValue ( own, EM_RoleValue_ZoneID )
		sleep(2)
		local RoomID=ReadRoleValue(own,EM_RoleValue_RoomID)
		--say(TargetID( ),"X"..x)
		local cab=Lua_DW_CreateObj("obj",107418,TargetID(),0)
		SetModeEx(cab,EM_SetModeType_Mark,false) ----標記
		SetModeEx(cab,EM_SetModeType_Strikback,false) ---反擊
		SetModeEx(cab,EM_SetModeType_Move,false) ---移動	
		SetModeEx(cab,EM_SetModeType_Fight,false) ---可砍殺
		SetModeEx(cab,EM_SetModeType_SearchenemyIgnore,false) ---物件不會被搜尋
		SetModeEx(cab,EM_SetModeType_HideName,false)  ---物件頭上是否顯示名稱
		SetModeEx(cab,EM_SetModeType_HideMinimap,false)  ---物件是否在小地圖上顯示
		SetModeEx(cab,EM_SetModeType_Searchenemy,false)  ---鎖敵
		SetModeEx(cab,EM_SetModeType_Show,false)
		AddToPartition(cab,RoomID )
		local PPL=SearchRangePlayer(TargetID(),90)	
		local x=table.getn(PPL)-----取出來的是數量
		WriteRoleValue(cab,EM_RoleValue_Livetime,3)
		if ZoneID == 149 then
			if x>=4 then
				CastSpellLV(cab,cab,499072,49)
			elseif x==3 then
				CastSpellLV(cab,cab,499072,79)
			elseif x==2 then
				CastSpellLV(cab,cab,499072,159)
			elseif x==1 then	
				CastSpellLV(cab,cab,499072,299)
			end
		else
			if x>=4 then
				CastSpellLV(cab,cab,499072,9)
			elseif x==3 then
				CastSpellLV(cab,cab,499072,19)
			elseif x==2 then
				CastSpellLV(cab,cab,499072,49)
			elseif x==1 then	
				CastSpellLV(cab,cab,499072,159)
			end
		end
end