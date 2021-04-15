function Dy_z25_bossshow()
	SetDefIdleMotion(OwnerID(),ruFUSION_ACTORSTATE_idle03) 
	sleep(30)
end
-----------------------------
function Dy_z25_bossAIC() --控制器
	local fight --戰鬥判斷
	local fight1 = 0 --開戰判斷
	local rush = 0 --狂暴記數
	local roomid = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) --讀出物件在哪一層
	local Door = CreateObjByFlag( 103044 , 781152 , 2 , 1 ) ---編號要改 之 Boss後門 
	local Door3 = CreateObjByFlag( 103044 , 781152 , 4 , 1 ) ---編號要改 之 Boss後門	
	local Door2 --前門
--※※前門※※
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
		SetModeEx( Door3 , EM_SetModeType_Show, true) ----秀出
	SetModeEx( Door3 , EM_SetModeType_Mark, false) ----標記
	SetModeEx( Door3 , EM_SetModeType_Strikback, false) ---反擊
	SetModeEx( Door3 , EM_SetModeType_Move, false) ---移動	
	SetModeEx( Door3 , EM_SetModeType_Fight, false) ---可砍殺
	SetModeEx( Door3 , EM_SetModeType_SearchenemyIgnore, true) ---物件不會被搜尋
	SetModeEx( Door3 , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
	SetModeEx( Door3 , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
	SetModeEx( Door3 , EM_SetModeType_Searchenemy, false)  ---索敵
	SetModeEx( Door3   , EM_SetModeType_Obstruct, true )--阻擋
	local buffid = {622692,622693,622694,622695,622696,622697,622716,622717,622736}  --結束戰鬥要刪除的Buff
	AddToPartition( Door3,roomid )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register4 , Door3)
	WriteRoleValue( OwnerID(), EM_RoleValue_Register2, 0)
	local ZoneID = ReadRoleValue ( OwnerID() , EM_RoleValue_ZoneID )
	local BossID
	if ZoneID == 151 then
		BossID = 106890
	elseif ZoneID == 152 then
		BossID = 107589
	elseif ZoneID == 153 then
		BossID = 107605
	end
--※※BOSS※※
	local Boss = CreateObjByFlag( BossID , 781152 , 1 , 1 ) ---生出Boss (BOSS編號  ,旗標編號 第N隻旗標 生出幾個怪)
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
	SetPlot( Boss,"dead","Dy_Z25_dead",10 )----Boss 死亡劇情
	--MoveToFlagEnabled( Boss, false ) --關掉巡邏劇情
	--WriteRoleValue(Boss,EM_RoleValue_IsWalk,0) --設定跑步動作 --0為跑步 1為走路
	WriteRoleValue( Boss, EM_RoleValue_PID, OwnerID()) --將控制器寫入BOSS裡
	WriteRoleValue( OwnerID(), EM_RoleValue_Register1, Boss) --將Boss寫入控制器中的Register1
	AddToPartition( Boss,roomid )

	BeginPlot( Boss, "Dy_Z25BOSSAI", 10)
	
--※※戰鬥設置
	--戰鬥開始控制器要做的事情
	while 1  do
		local MaxHP = ReadRoleValue( Boss , EM_RoleValue_MaxHP )
		local NowHP = ReadRoleValue( Boss , EM_RoleValue_HP )
		local HPPercent =( NowHP / MaxHP)*100
		sleep(10)
		fight = ReadRoleValue( OwnerID() , EM_RoleValue_Register2 )	 --讀取寫入控制器第2格的數字

		if fight == 1 then --戰鬥中
		--say (OwnerID() , "333")
			if fight1 == 0 then --避免每次迴圈重跑一直生門
				ScriptMessage( Boss, -1 , 2 , "[SC_106890_open]" , 2 ) --喊話放這邊才不會一直跑
				Door2 = CreateObjByFlag( 103044 , 781152 , 3 , 1 ) ---編號要改 之 Boss前門  
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
				AddToPartition(Door2,roomid )
				--BeginPlot( Boss, "Dy_Z25BOSSAI", 10)
				WriteRoleValue( OwnerID() , EM_RoleValue_Register3 , Door2)--將此物件的GID儲存至控制器的Register3中，以方便日後刪除用
				fight1 = 1
			end
			rush = rush+1 --狂暴記數
	
			--say (Boss, "rush = "..rush)
			
			--※※枯骨的分佈※※

			
			if rush >= 480 then  --修改時間狂暴用
				AddBuff(Boss , 623851 , 0 , -1) --狂暴Buff 需要修改編號
				ScriptMessage( Boss, -1 , 2 , "[SC_106890_DRUG]" , 2 )
			end
					
		--滅團時
		elseif fight == 2 then
			ScriptMessage( Boss, -1 , 2 , "[SC_106890_BONES]" , 2 )
			
			local player = SetSearchAllPlayer(RoomID)      --讀取此層zone所有玩家數量
			local playername                               --先宣告要取出掃zone後的玩家
			for i = 1 , player do                          --幾個玩家執行幾次for迴圈，判斷所有玩家
				playername = GetSearchResult()             --取出掃zone後取得的玩家GID
				for a =1 , #buffid do
					if checkbuff(playername,buffid[a]) == true then
						CancelBuff_NoEvent( playername,buffid[a] )
					end	
				end
			end
			sleep (30)
			Delobj(Door2) --刪除掉前門
			Delobj(Boss) --刪除掉Boss
			sleep(50)
			
			--Boss重生
			Boss = CreateObjByFlag( BossID , 781152 , 1 , 1 ) ---生出Boss (BOSS編號  ,旗標編號 第N隻旗標 生出幾個怪) 
			SetPlot( Boss,"dead","Dy_Z25_dead",10 )----Boss 死亡劇情
			WriteRoleValue( Boss, EM_RoleValue_PID, OwnerID()) --將控制器寫入BOSS裡
			WriteRoleValue( OwnerID(), EM_RoleValue_Register1, Boss) --將Boss寫入控制器中的Register1
			AddToPartition(Boss,roomid )
			BeginPlot( Boss, "Dy_Z25BOSSAI", 10) ---Boss的戰鬥Function (  BOSS BOSS的LUA_AI  秒\每10=1秒)
			WriteRoleValue( OwnerID(), EM_RoleValue_Register2, 0)	

			--WriteRoleValue( OwnerID(), EM_RoleValue_Register2, 0) 
			fight1 = 0
			weakp = 0
			rush = 0 --狂暴記數歸零
		--Boss死亡時
		elseif fight == 3 then
		ScriptMessage( Boss, -1 , 2 , "[SC_106890_END]" , 2 )
		local player = SetSearchAllPlayer(RoomID)      --讀取此層zone所有玩家數量
			local playername                               --先宣告要取出掃zone後的玩家
			for i = 1 , player do                          --幾個玩家執行幾次for迴圈，判斷所有玩家
				playername = GetSearchResult()             --取出掃zone後取得的玩家GID
				for a =1 , #buffid do
					if checkbuff(playername,buffid[a]) == true then
						CancelBuff_NoEvent( playername,buffid[a] )
					end	
				end
			end
			Delobj(Door)
			Delobj(Door3)
			Delobj(Door2)
			WriteRoleValue( OwnerID(), EM_RoleValue_Register2, 0)
			break
		end
	end	
end
function Dy_Z25BOSSAI()
	local own = OwnerID()
	local time1 = 0 --招式記數
	local luck
	local skill = {850255 , 850254 ,850209 ,850210} ------------單體傷害 , 扇形傷害 , 30%~100%的毒液,0~30%的毒液
	local skill2 = {850209 ,850210,850616,850615,850211,850617} ------------單體傷害 , 扇形傷害 , 30%~100%的毒液,0~30%的毒液
	local skillspeak = {"[SC_106890_SKILL1]" , "[SC_106890_SKILL2]", "[SC_106890_SKILL3]"}
	local skillLV = { 0 , 0 ,0,0 }
	local chapter = 1 --階段判斷
	local bosshate = {}
	local AttackTarget 
	local CH1 = ReadRoleValue( own , EM_RoleValue_PID ) 	--讀出控制器的GID
	local roomID = ReadRoleValue(own , EM_RoleValue_RoomID ) --讀出Boss在哪一層
	local fight = 0 --戰鬥開關
	local ZoneID = ReadRoleValue ( own , EM_RoleValue_ZoneID )
	local zoneup 
	if ZoneID == 151 then
		zoneup = 4
	elseif ZoneID == 152 then
		zoneup = 4
	elseif ZoneID == 153 then
		zoneup = 2
	end
	while 1 do
	sleep(10)
	local MaxHP = ReadRoleValue( own , EM_RoleValue_MaxHP )
	local NowHP = ReadRoleValue( own , EM_RoleValue_HP )
	local HPPercent =( NowHP / MaxHP)*100	
	
	--用血量判斷階段
	if HPPercent <= 30 then
		chapter = 2	
	end
	--Say(own,"chapterh = "..chapter)
	AttackTarget = ReadRoleValue( own , EM_RoleValue_AttackTargetID ) --讀正在攻擊的目標
		if  AttackTarget ~= 0  and ( CheckID( own ) ) == true then	--如果目標人數>0，而且自己存在時，判定進入戰鬥
			fight = 1 --表示正在戰鬥中
			WriteRoleValue( CH1, EM_RoleValue_Register2, 1) --回傳控制器說已經在戰鬥中了
			--say (OwnerID() , "111")
			time1 = time1 +1
			--出招
			if time1 %7 == 0 then 
				luck = Rand(100)+1
				while 	ReadRoleValue(own , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
						sleep(2)
				end			
				if luck % 2 == 0 then --施放單體傷害
					ScriptMessage( own, -1 , 2 , skillspeak[1] , 2 )
					CastSpellLV( own , AttackTarget , skill[1] , skillLV[1] )
					--say(own,"skill = 1")
				elseif luck % 2 ==1 then --施放扇型傷害
					ScriptMessage( own, -1 , 2 , skillspeak[2] , 2 )
					CastSpellLV( own , own , skill[2] , skillLV[2] )
					--say(own,"skill = 2")
				end
			elseif time1 % 20 == 0 then
				local player_00 = {} --先抓出仇恨表內的玩家
				local player_01 = {} 
				--local choose_p
				local choose_P2
				local luck1
				local luck2 
				ScriptMessage( own, -1 , 2 , skillspeak[3] , 2 )
				player_01 = DW_HateRemain(0) --仇恨表找人   填0代表 不排除主坦
				luck2 = table.getn(player_01)
				for i = 1 ,luck2,1 do --排寵
					--say(player_01[i],"hay"..i)
					if ReadRoleValue(player_01[i],EM_RoleValue_IsPlayer) == 1 then
						--say(player_01[i],"h8888"..i)
						table.insert( player_00, player_01[i] )
					end
				end
				--ReadRoleValue(EM_RoleValue_IsPlayer)  
				--choose_p = table.getn(player_00) --取出Player的數量
				--say (own , "choose_p = "..choose_p )
				--[[for i = 1 , choose_p , 1 do --檢查玩家身上有沒有Buff
					for a = 0 , 5 , 1 do
						if CheckBuff(player_00[i] , 622692+a ) == false then
							table.insert( player_01, player_00[i] ) --塞進player_01集合內
							break
						end
					end
				end--]]
				choose_p2 = table.getn(player_00) --取出沒有Buff的玩家數量
				--say(own,"num"..choose_p2)				
				if chapter == 1 then --第一階段
					if choose_p2 == 0 or choose_p2 >= zoneup then --如果沒有Buff的人是0，表示大家都有buff 隨機抓4個人施放
						for i = 1 , zoneup , 1 do --對四個人施放
						luck1 = DW_Rand(table.getn(player_00))			--RAND到的數字	
							if ( player_00[luck1] ~= nil ) and ( ReadRoleValue( player_00[luck1] , EM_RoleValue_IsDead ) == 0 ) then						
								SysCastSpellLv(own,player_00[luck1],skill2[i],skillLV[3]) 
								--say(player_00[luck1],"hay = "..i)
								table.remove( player_00 , luck1 ) --放完後刪除掉table裡面的玩家資料
								sleep(1)								
							end
						end
					elseif choose_p2 > 0 and  choose_p2 < zoneup then --人數小於4個
						--say (own , "choose_p2 = "..choose_p2)
						for i = 1 , choose_p2 , 1 do --對choose_p2有幾個人就對幾個人施放
						--luck2 = Rand(table.getn(player_01))+1			--RAND到的數字	
							if ( player_00[i] ~= nil ) and ( ReadRoleValue( player_00[i] , EM_RoleValue_IsDead ) == 0 ) then						
								SysCastSpellLv(own,player_00[i],skill2[i],skillLV[3]) 
								--say(player_00[i],"hay = "..i)
								table.remove( player_00 , i ) --放完後刪除掉table裡面的玩家資料
								sleep(1)								
							end
						end						
					end
				elseif chapter == 2 then --第二階段 
					if choose_p2 == 0 or choose_p2 >= 6 then --如果沒有Buff的人是0，表示大家都有buff 隨機抓4個人施放
						for i = 1 , 6 , 1 do --對四個人施放
						luck1 = DW_Rand(table.getn(player_00))			--RAND到的數字	
							if ( player_00[luck1] ~= nil ) and ( ReadRoleValue( player_00[luck1] , EM_RoleValue_IsDead ) == 0 ) then						
								SysCastSpellLv(own,player_00[luck1],skill2[i],skillLV[3])
								--say(player_00[luck1],"hay = "..i)								
								table.remove( player_00 , luck1 ) --放完後刪除掉table裡面的玩家資料
								sleep(1)								
							end
						end
					elseif choose_p2 > 0 and  choose_p2 < 6 then --人數小於4個
						--say (own , "choose_p2 = "..choose_p2)
						for i = 1 , choose_p2 , 1 do --對choose_p2有幾個人就對幾個人施放
						--luck2 = Rand(table.getn(player_01))+1			--RAND到的數字	
							if ( player_00[i] ~= nil ) and ( ReadRoleValue( player_00[i] , EM_RoleValue_IsDead ) == 0 ) then						
								SysCastSpellLv(own,player_00[i],skill2[i],skillLV[3]) 
								--say(player_00[i],"hay = "..i)	
								table.remove( player_00 , i ) --放完後刪除掉table裡面的玩家資料
								sleep(1)								
							end
						end						
					end
				end
			end
		elseif fight == 1 and AttackTarget == 0 then
			WriteRoleValue( CH1 , EM_RoleValue_Register2, 2)
		end
	end
			
end
function Dy_Z25_dead()
local CH1 = ReadRoleValue( OwnerID() , EM_RoleValue_PID ) 
WriteRoleValue( CH1 , EM_RoleValue_Register2, 3)
end
--※※每2秒堆疊
function Dy_Z25_OWN2(BUFFID)
	local Pos = Lua_BuffPosSearch( OwnerID() , BUFFID )                      ---------------------抓出身上的法術代號
	local PLV = BuffInfo( OwnerID() , Pos , EM_BuffInfoType_Power )			 -------------------------此法術的等級
	local T = BuffInfo( OwnerID(), Pos ,EM_BuffInfoType_Time) --讀取剩餘時間
	--say (OwnerID() , "T = "..T)
	if Checkbuff (OwnerID() ,BUFFID ) == true  then --如果自己有Buff
		if T < 2 or T >= 20 then
		
		else
			CancelBuff_NoEvent(OwnerID() , BUFFID )
			Addbuff (OwnerID() , BUFFID , PLV+1 , T )
		end
	end
end

--※※傳染的Buff
function Dy_Z25_BUFFAD()
local own = OwnerID()
local tar = TargetID()
	local buffA = 622692
	local buffD = 622695
	local PosA = Lua_BuffPosSearch( own , buffA )
	local PosD = Lua_BuffPosSearch( own , buffD )
	local TA = BuffInfo( own, PosA ,EM_BuffInfoType_Time)
	local TD = BuffInfo( own, PosD ,EM_BuffInfoType_Time)
	local otherbuff = { 622693 , 622694 , 622696 , 622697 }
	if ReadRoleValue(tar,EM_RoleValue_IsPlayer) == true then
	--say (OwnerID() , "BUFF1 ="..otherbuff[1])
		for i = 1 , 4 , 1 do --先檢查要不要給生命輓歌
			if Checkbuff (tar , otherbuff[i]) == true then --如果BCEF存在的話
				CancelBuff_NoEvent(tar , otherbuff[i]) --刪除掉
				Addbuff (tar , 622717 , 0 , -1) --給與生命輓歌BUFF
			elseif Checkbuff (tar , otherbuff[i]) == false then --如果BCEF不存在的話
				if Checkbuff(tar , buffA ) == false then--如果A不存在
					if own ~= tar and Checkbuff(own,buffA)==true and Checkbuff(tar,buffD)==true then
						CancelBuff_NoEvent(own , buffA)
						CancelBuff_NoEvent(tar , buffD)
						return
					end
					if own ~= tar and Checkbuff(own,buffA)==true then
						Addbuff (tar, buffA , 0 , 20) --給B
					end
				elseif Checkbuff(tar , buffD ) == false  then --如果D不存在
					if own ~= tar and Checkbuff(own,buffD)==true and Checkbuff(tar,buffA)==true then
						CancelBuff_NoEvent(own , buffD)
						CancelBuff_NoEvent(tar , buffA)
						return
					end
					if own ~= tar and Checkbuff(own,buffD)==true then
						Addbuff (tar, buffD , 0 , 20) --給B
					end
				end
			end
		end
	end	
end 
function Dy_Z25_BUFFBE()
	local buffB = 622693
	local buffE = 622696
	local own=OwnerID()
	local tar=TargetID()
	local otherbuff = { 622692 , 622694 , 622695 , 622697 }
	if ReadRoleValue(tar,EM_RoleValue_IsPlayer) == true then
		for i = 1 , 4 , 1 do
			if Checkbuff (tar , otherbuff[i]) == true then --如果ACDF存在的話
				CancelBuff_NoEvent(tar , otherbuff[i]) --刪除掉
				Addbuff (tar , 622717, 0 , -1) --給與生命輓歌BUFF
			elseif Checkbuff (tar , otherbuff[i]) == false then --如果ACDF不存在的話
				if Checkbuff(tar , buffB ) == false then--如果B不存在
					if own ~= tar and Checkbuff(own,buffB)==true and Checkbuff(tar,buffE)==true then
						CancelBuff_NoEvent(own , buffB)
						CancelBuff_NoEvent(tar , buffE)
						return
					end
					if own ~= tar and Checkbuff(own,buffB)==true then
						Addbuff (tar, buffB , 0 , 20) --給B
					end
				elseif Checkbuff(tar, buffE ) == false  then --如果E不存在
					if own ~= tar and Checkbuff(own,buffE)==true and Checkbuff(tar,buffB)==true then
						CancelBuff_NoEvent(own , buffE)
						CancelBuff_NoEvent(tar , buffB)
						return
					end
					if own ~= tar and Checkbuff(own,buffE)==true then
						Addbuff (tar, buffE , 0 , 20) --給E
					end
				end
			end
		end
	end	
end
function Dy_Z25_BUFFCF()
	local buffC = 622694
	local buffF = 622697
	local own=OwnerID()
	local tar=TargetID()
	local otherbuff = { 622692 , 622693 , 622695 , 622696 }
	if ReadRoleValue(tar,EM_RoleValue_IsPlayer) == true then
		for i = 1 , 4 , 1 do
			if Checkbuff (tar, otherbuff[i]) == true then --如果ACDF存在的話
				CancelBuff_NoEvent(tar, otherbuff[i]) --刪除掉
				Addbuff (tar, 622717, 0 , -1) --給與生命輓歌BUFF
			elseif Checkbuff (tar , otherbuff[i]) == false then --如果ACDF不存在的話	
				if Checkbuff(tar , buffC ) == false then--如果C不存在
					if own ~= tar and Checkbuff(own,buffC)==true and Checkbuff(tar,buffF)==true then
						CancelBuff_NoEvent(own , buffC)
						CancelBuff_NoEvent(tar , buffF)
						return
					end
					if own ~= tar and Checkbuff(own,buffC)==true then
						Addbuff (tar, buffC , 0 , 20) --給C
					end	
				elseif Checkbuff(tar, buffF ) == false  then --如果F不存在
					if own ~= tar and Checkbuff(own,buffF)==true and Checkbuff(tar,buffC)==true then
						CancelBuff_NoEvent(own , buffF)
						CancelBuff_NoEvent(tar , buffC)
						return
					end
					if own ~= tar and Checkbuff(own,buffF)==true then
						Addbuff (tar , buffF , 0 , 20) --給F
					end	
				end
			end
		end
	end	
end
function UN_z25boss2_BUFF(buffid)

	if checkbuff(TargetID(),buffid) == true then
		return false
	else
		return true
	end
end