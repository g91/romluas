--啟動器
--EM_RoleValue_Register1 BOSS
--EM_RoleValue_Register2 開始啟動器
--EM_RoleValue_Register3 door
--EM_RoleValue_Register4 reset重置階段
--EM_RoleValue_Register5 boss死亡回傳
--EM_RoleValue_Register6 Tornadomark回傳值

--BOSS
--EM_RoleValue_Register7 武器回傳
--EM_RoleValue_Register8 武器回傳
--EM_RoleValue_Register9 武器回傳

function Lua_cang_banalloz_start()	--產生計數器
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)--王座上的王
	local Boss = CreateObjByFlag( 102704, 780485, 0, 1)	--招換	
	local Start	= 0
	local Dead = 0
	local CountDead = 0
	local loot
	local count_door = 0
	AddToPartition( Boss , RoomID )	--加進舞台
	SetModeEx( boss , EM_SetModeType_Strikback, false) ---反擊
	SetModeEx( boss , EM_SetModeType_Move, false) ---移動	
	SetModeEx( boss , EM_SetModeType_Fight, false) ---可砍殺
	SetModeEx( boss , EM_SetModeType_Show, true)
	SetModeEx( boss , EM_SetModeType_Searchenemy, false )--索敵

	local opener = CreateObjByFlag( 102881, 780485, 4, 1)	--招換	
	SetModeEx( opener   , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( opener   , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( opener   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( opener   , EM_SetModeType_Mark, false )--標記
	SetModeEx( opener   , EM_SetModeType_Move, false )--移動
	SetModeEx( opener   , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( opener   , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( opener   , EM_SetModeType_HideName, false )--名稱
	AddToPartition( opener , RoomID )	--加進舞台	
	SetPlot( opener, "range" , "Lua_cang_banalloz_open" ,200 )	
	WriteRoleValue( opener ,EM_RoleValue_PID, OwnerID())
	
	local Door = CreateObjByFlag( 102925 , 780485 , 6 , 1 )
	SetModeEX( Door  , EM_SetModeType_Gravity , false )--重力
	SetModeEx( Door  , EM_SetModeType_ShowRoleHead, false )--不秀頭像框
	SetModeEx( Door  , EM_SetModeType_Obstruct, true )--阻擋
	SetModeEx( Door  , EM_SetModeType_Mark, false )--標記
	SetModeEx( Door  , EM_SetModeType_Move, false )--移動
	SetModeEx( Door  , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( Door  , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( Door  , EM_SetModeType_Strikback, false )--反擊	
	AddToPartition( Door , RoomID )	--加進舞台
	WriteRoleValue( OwnerID() ,EM_RoleValue_Register3, Door)
	while true do
		sleep(10)
		Start = ReadRoleValue( OwnerID() , EM_RoleValue_Register2 )
		Dead = ReadRoleValue( OwnerID() , EM_RoleValue_Register5 )
		if Start == 1 then
			CastSpellLV(Boss, Boss, 494319 , 1 )
			ScriptMessage( Boss , -1 , 2 ,  "[SC_102721_1]", 1 )			
			Sleep(40)	
			DelObj(Boss)
			Sleep(30)
			local show = CreateObjByFlag( 102881, 780485, 4, 1)			
			SetModeEX( show  , EM_SetModeType_Gravity , false )--重力
			SetModeEx( show  , EM_SetModeType_ShowRoleHead, false )--不秀頭像框
			SetModeEx( show  , EM_SetModeType_Obstruct, true )--阻擋
			SetModeEx( show  , EM_SetModeType_Mark, false )--標記
			SetModeEx( show  , EM_SetModeType_Move, false )--移動
			SetModeEx( show  , EM_SetModeType_Searchenemy, false )--索敵
			SetModeEx( show  , EM_SetModeType_Fight , false )--可砍殺攻擊
			SetModeEx( show  , EM_SetModeType_Strikback, false )--反擊				
			AddToPartition( show , RoomID )			
			local show1 = CreateObjByFlag( 102881, 780485, 9, 1)			
			SetModeEX( show1  , EM_SetModeType_Gravity , false )--重力
			SetModeEx( show1  , EM_SetModeType_ShowRoleHead, false )--不秀頭像框
			SetModeEx( show1  , EM_SetModeType_Obstruct, true )--阻擋
			SetModeEx( show1  , EM_SetModeType_Mark, false )--標記
			SetModeEx( show1  , EM_SetModeType_Move, false )--移動
			SetModeEx( show1  , EM_SetModeType_Searchenemy, false )--索敵
			SetModeEx( show1  , EM_SetModeType_Fight , false )--可砍殺攻擊
			SetModeEx( show1  , EM_SetModeType_Strikback, false )--反擊				
			AddToPartition( show1 , RoomID )			
			CastSpellLV(show, show, 494319 , 1 )
			CastSpellLV(show1, show1, 494319 , 1 )
			if count_door == 0 then
				BeginPlot(Door , "Lua_cang_banalloz_door_open", 0)				
				count_door = 1
			end	
			local PPL = SetSearchAllPlayer(RoomID)					
			local ID = {}
			for i = 1 , PPL , 1 do ---把玩家抓入房間用 
				ID[i] = GetSearchResult() -- 接暫存值
				if ReadRoleValue( ID[i] , EM_RoleValue_IsDead ) ~= 1 and GetDistance( ID[i] , show ) > 100 and GetDistance( ID[i] , show ) < 1000 
					and ReadRoleValue( ID[i], EM_RoleValue_VOC) ~= 0  and ReadRoleValue( ID[i] , EM_RoleValue_RoomID  ) == RoomID then
					SetPosByFlag( ID[i] , 780485 , 9 ) --拉到旗標位子
				end
			end	
			Sleep(30)			
			local Boss01 = CreateObjByFlag( 102704, 780485, 4, 1)	--招換	
			AddToPartition( Boss01 , RoomID )	--加進舞台	
			WriteRoleValue( OwnerID() ,EM_RoleValue_Register1, Boss01 )--暫存一為BOSS
			WriteRoleValue( Boss01 ,EM_RoleValue_PID, OwnerID() )--暫存一為BOSS
			BeginPlot( OwnerID(), "Lua_cang_banalloz_time" , 0)
			BeginPlot( OwnerID(), "Lua_cang_banalloz" , 20)
			SetPlot( Boss01,"dead", "Lua_cang_banalloz_Boss_dead" ,0 )	
			WriteRoleValue( OwnerID() ,EM_RoleValue_Register2, 2)
			DelObj(show)
			DelObj(show1)
		end
		if Dead == 1 then
			if CountDead == 0 then
				BeginPlot(Door , "Lua_cang_banalloz_door_close", 0)
				ScriptMessage( OwnerID() , -1 , 2 ,  "[SC_102721_9]", 1 )
				sleep(50)
				DelObj(Door)
				loot = CreateObjByFlag( 102944, 780485, 4, 1)	--寶箱
				AddToPartition( loot , RoomID )	--戰鬥特徵 
				SetFightMode(loot, 0, 0, 0, 0)
				sleep(50)
				DelObj(OwnerID())
			end	
		end
	end
end

function Lua_cang_banalloz_Boss_dead() --王死掉回傳
	local dead = ReadRoleValue( OwnerID() ,EM_RoleValue_PID)
	WriteRoleValue( dead , EM_RoleValue_Register5 , 1)	--寫入PID
end

function Lua_cang_banalloz_open()--觸發王的機制
	if ReadRoleValue( OwnerID() , EM_RoleValue_IsDead ) == 0 then--檢查是否死亡
		SetPlot( TargetID(),"range", "" ,0 )
		BeginPlot( TargetID(), "Lua_cang_banalloz_open_01", 10)
	end
end

function Lua_cang_banalloz_open_01()--觸發後回傳
	local Start = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	WriteRoleValue( Start ,EM_RoleValue_Register2, 1)
	sleep(50)
	DelObj(OwnerID())
end

function Lua_cang_banalloz_time()	--產生計數器

	local Mode1 = 505078	--階段1
	local Mode2 = 505079	--階段2
	local Mode3 = 505080	--階段3
	local Mode4 = 505224	--狂暴
	local Time = 0		--時間
	local Boss
	local Time1 = 0

	while 1 do
		sleep(10)
		Boss = ReadRoleValue( OwnerID() , EM_RoleValue_Register1 )
		local AttackTarget = ReadRoleValue( Boss , EM_RoleValue_AttackTargetID )	--抓目標值
		if (  AttackTarget ~= 0 ) and ( CheckID( Boss ) == true ) then  -- 檢查是否離開戰鬥
			Time = Time + 1
			Time1 = Time1 + 1
			if Time > 0 and Time < 30 then
				CancelBuff( Boss , Mode2 )		--刪除1	
				CancelBuff( Boss , Mode3 )		--刪除1			
				AddBuff( Boss , Mode1 , 0 , -1 )	--1
			elseif Time >= 30 and Time < 40 then	--原先30 改測試3
				CancelBuff( Boss , Mode1 )		--刪除1
				CancelBuff( Boss , Mode3 )		--刪除1
				AddBuff( Boss , Mode2 , 0 , -1 )	--1
			elseif Time >= 40 and Time < 70 then--原先40 改測試10
				CancelBuff( Boss , Mode1 )		--刪除1
				CancelBuff( Boss , Mode2 )		--刪除1
				AddBuff( Boss , Mode3 , 0 , -1 )	--1
			elseif Time == 70 then	--原先70 改測試20
				Time = 0
			end
			if Time1 >= 600 then
				AddBuff( Boss , Mode4 , 0 , -1 )
			end
		end
	end
end	

function Lua_cang_banalloz()	--霸拿螺絲

	local Mode1 = 505078	--階段1
	local Mode2 = 505079	--階段2
	local Mode3 = 505080	--階段3
	local Buff01 = 505081
	local Buff02 = 505082
	local Buff03 = 505083
	local Buff04 = 505084
	local count = 0
	local TimeMode1 = 0		--第一階段計數器
	local countmode2 = 0  	--第二階段開關
	local countmode3 = 0	--第三階段開關
	--local count_door = 0
	local NowHP			--血量
	local NowAttackTarget 	--現在目標
	local WHP
	local Boss 			--王
	--local Door
	local Dead			--BOSS死亡回傳
	local reset	= 0		--重置階段
	local fight = 0		--攻擊指令
	local Skillball
	local BossM3 = 0 	--三階段型態
	local anyone
	local Weaponset = 0
	local Weapon = {}	--武器
	local Weapon2 = {}	--武器
	local Weapon3 = {}
	local W1, W2, W3	--武器
	local Weapon01, Weapon02, Weapon03	--武器
	local WeaponSoul01, WeaponSoul02, WeaponSoul03	--武器
	local NowX, NowY, NowZ ,NowDir
	local Castime1	--第三階段技能檢定
	local Tornado	--龍捲風
	local Tornadomark = 0	--龍捲風觸碰編號
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	Boss = ReadRoleValue( OwnerID() , EM_RoleValue_Register1 )
	local SkillSay = {"[SC_102721_1]","[SC_102721_2]", "[SC_102721_3]", "[SC_102721_4]" , "[SC_102721_5]" ,"[SC_102721_6]","[SC_102721_7]","[SC_102721_8]","[SC_102721_9]"}	--招式說話
--誰..膽敢踏入霸拿羅茲的領域..
--讓你嚐嚐..什麼叫砂鍋大的拳頭。
--你們那可悲的攻擊是無法傷害霸拿羅茲的！！
--我為殺戮而生！
--今天該輪到哪把武器飲血了呢？？
--開始我們的遊戲吧！！
--末日！！毀滅這世界！！
--讓我們結束這場無趣的遊戲，你們該往另外的世界啟程。
--希爾洛奧斯...是至高無上的...
	while true do
		sleep(10)
		local AttackTarget = ReadRoleValue( Boss , EM_RoleValue_AttackTargetID )	--抓目標值
		if (  AttackTarget ~= 0 ) and ( CheckID( Boss ) == true ) then  -- 檢查是否離開戰鬥
			fight = 1
			Boss = ReadRoleValue( OwnerID() , EM_RoleValue_Register1 )
			NowX = ReadRoleValue( Boss , EM_RoleValue_X )
			NowY = ReadRoleValue( Boss , EM_RoleValue_Y )
			NowZ = ReadRoleValue( Boss , EM_RoleValue_Z )
			NowDir = ReadRoleValue( Boss , EM_RoleValue_Dir )
			Door = ReadRoleValue( OwnerID() , EM_RoleValue_Register3 )			
			Dead = ReadRoleValue( OwnerID() , EM_RoleValue_Register5 )
			if CheckBuff (Boss , Mode1 ) == true then				
				if countmode3 == 1 then	
					Sleep(10)
					while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID ) ~= 0   do
						sleep(3)
					end
					CastSpellLV(Boss, Boss, 494482 , 1 )
					Sleep(30)
					NowHP = ReadRoleValue( Boss , EM_RoleValue_HP )	--取得現在血量
					NowHP = NowHP + 1
					NowAttackTarget = ReadRoleValue( Boss , EM_RoleValue_AttackTargetID )
					DelObj( boss )
					Boss = CreateObj( 102704 , NowX , NowY , NowZ , NowDir , 1 )
					AddToPartition( Boss , RoomID)
					WriteRoleValue( Boss , EM_RoleValue_HP , NowHP)	--寫入
					WriteRoleValue( OwnerID(), EM_RoleValue_Register1, Boss)
					WriteRoleValue( Boss , EM_RoleValue_PID , OwnerID())	--寫入
					SetAttack( Boss , NowAttackTarget )	
					SysCastSpellLV( NowAttackTarget, Boss, 494659, 1)					
					SetPlot( Boss,"dead", "Lua_cang_banalloz_Boss_dead" ,0 )			
					countmode3 = 2	
					WriteRoleValue( OwnerID(), EM_RoleValue_Register6, 0)				
				end				
				--第一階段第一次
				TimeMode1 = TimeMode1 + 1
				Castime = 0	
				WriteRoleValue( OwnerID(), EM_RoleValue_Register6, 0)	
				BossM3 = 0				
				if TimeMode1 == 1 then
					BeginPlot( Boss , "Lua_cang_banalloz_skill_M1" , 20)					
					local SkillRND = Rand( 100 )+1	-- 產生亂數
					if SkillRND <= 100 and SkillRND > 67 then
						AddBuff( Boss , Buff01 , 0 , -1 )	--1
						AddBuff( Boss , Buff04 , 0 , -1 )
						ScriptMessage( Boss , -1 , 2 ,  SkillSay[2], 1 )
					elseif SkillRND <= 67 and SkillRND > 34 then
						AddBuff( Boss , Buff02 , 0 , -1 )	--1
						ScriptMessage( Boss , -1 , 2 ,  SkillSay[3], 1 )
					elseif SkillRND <= 34 and SkillRND > 0 then
						AddBuff( Boss , Buff03 , 0 , -1 )	--1
						ScriptMessage( Boss , -1 , 2 ,  SkillSay[4], 1 )
					end					
				elseif TimeMode1 == 15 then
					CancelBuff( Boss , Buff01 )
					CancelBuff( Boss , Buff02 )
					CancelBuff( Boss , Buff03 )
					CancelBuff( Boss , Buff04 )
					local SkillRND = Rand( 100 )+1	-- 產生亂數					
					if SkillRND <= 100 and SkillRND > 67 then
						AddBuff( Boss , Buff01 , 0 , -1 )	--1
						AddBuff( Boss , Buff04 , 0 , -1 )
						ScriptMessage( Boss , -1 , 2 ,  SkillSay[2], 1 )			
					elseif SkillRND <= 67 and SkillRND > 34 then
						AddBuff( Boss , Buff02 , 0 , -1 )	--1
						ScriptMessage( Boss , -1 , 2 ,  SkillSay[3], 1 )
					elseif SkillRND <= 34 and SkillRND > 0 then
						AddBuff( Boss , Buff03 , 0 , -1 )	--1
						ScriptMessage( Boss , -1 , 2 ,  SkillSay[4], 1 )
					end								
				end	
				countmode2 = 0
				countmode3 = 0
			--第二階段		
			elseif CheckBuff (Boss , Mode2 ) == true then	
				TimeMode1 = 0
				CancelBuff( Boss , Buff01 )
				CancelBuff( Boss , Buff02 )
				CancelBuff( Boss , Buff03 )
				CancelBuff( Boss , Buff04 )					
				--產生三武器，隨機位子
				if countmode2 == 0 then		
					AddBuff(Boss, 505089 , 1 , -1)
					BeginPlot( OwnerID(), "Lua_cang_banalloz_Show" , 1)
					while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID ) ~= 0   do
						sleep(3)
					end	
					CastSpellLV(Boss, Boss, 494318 , 1 )
					ScriptMessage( Boss , -1 , 2 ,  SkillSay[5], 1 )
					WriteRoleValue( OwnerID(), EM_RoleValue_Register7, 0)
					WriteRoleValue( OwnerID(), EM_RoleValue_Register8, 0)
					WriteRoleValue( OwnerID(), EM_RoleValue_Register9, 0)				
					local SkillRND = Rand( 100 )+1	-- 產生亂數
					if SkillRND <= 100 and SkillRND > 67 then
						Weapon01 = CreateObjByFlag( 102875, 780485, 1, 1)
						Weapon02 = CreateObjByFlag( 102876, 780485, 2, 1)
						Weapon03 = CreateObjByFlag( 102877, 780485, 3, 1)
						--Weapon01 = CreateObj( 102875 , 1236 , 545 , 5022 , 90 , 1 )
						--Weapon02 = CreateObj( 102876 , 1236 , 545 , 5196 , 90 , 1 )
						--Weapon03 = CreateObj( 102877 , 1048 , 545 , 5104 , 90 , 1 )
						SetModeEx( Weapon01   , EM_SetModeType_Strikback, false )--反擊
						SetModeEx( Weapon01   , EM_SetModeType_Move, false )--移動
						SetModeEx( Weapon01   , EM_SetModeType_Searchenemy, false )--索敵
						SetModeEX( Weapon01  , EM_SetModeType_Gravity , false )--重力
						AddToPartition( Weapon01 , RoomID )	--加進舞台	
						WriteRoleValue( Weapon01 ,EM_RoleValue_PID, Boss)
						SetModeEx( Weapon02   , EM_SetModeType_Strikback, false )--反擊
						SetModeEx( Weapon02   , EM_SetModeType_Move, false )--移動
						SetModeEx( Weapon02   , EM_SetModeType_Searchenemy, false )--索敵
						SetModeEX( Weapon02  , EM_SetModeType_Gravity , false )--重力	
						AddToPartition( Weapon02 , RoomID )	--加進舞台	
						WriteRoleValue( Weapon02 ,EM_RoleValue_PID, Boss)
						SetModeEx( Weapon03   , EM_SetModeType_Strikback, false )--反擊
						SetModeEx( Weapon03   , EM_SetModeType_Move, false )--移動
						SetModeEx( Weapon03   , EM_SetModeType_Searchenemy, false )--索敵
						SetModeEX( Weapon03  , EM_SetModeType_Gravity , false )--重力
						AddToPartition( Weapon03 , RoomID )	--加進舞台	
						WriteRoleValue( Weapon03 ,EM_RoleValue_PID, Boss)
						Addbuff( Weapon01 , 504831 , 0 , -1 )	
						Addbuff( Weapon02 , 504831 , 0 , -1 )
						Addbuff( Weapon03 , 504831 , 0 , -1 )						
						SetPlot( Weapon01,"dead", "Lua_cang_banalloz_Weapon01_dead" ,0 )
						SetPlot( Weapon02,"dead", "Lua_cang_banalloz_Weapon02_dead" ,0 )
						SetPlot( Weapon03,"dead", "Lua_cang_banalloz_Weapon03_dead" ,0 )
						Weaponset = 1
					elseif SkillRND <= 67 and SkillRND > 34 then
						Weapon01 = CreateObjByFlag( 102875, 780485, 3, 1)
						Weapon02 = CreateObjByFlag( 102876, 780485, 1, 1)
						Weapon03 = CreateObjByFlag( 102877, 780485, 2, 1)
						--Weapon02 = CreateObj( 102875 , 1236 , 545 , 5022 , 90 , 1 )
						--Weapon03 = CreateObj( 102876 , 1236 , 545 , 5196 , 90 , 1 )
						--Weapon01 = CreateObj( 102877 , 1048 , 545 , 5104 , 90 , 1 )	
						SetModeEx( Weapon01   , EM_SetModeType_Strikback, false )--反擊
						SetModeEx( Weapon01   , EM_SetModeType_Move, false )--移動
						SetModeEx( Weapon01   , EM_SetModeType_Searchenemy, false )--索敵
						SetModeEX( Weapon01   , EM_SetModeType_Gravity , false )--重力
						AddToPartition( Weapon01 , RoomID )	--加進舞台	
						WriteRoleValue( Weapon01 ,EM_RoleValue_PID, Boss)
						SetModeEx( Weapon02   , EM_SetModeType_Strikback, false )--反擊
						SetModeEx( Weapon02   , EM_SetModeType_Move, false )--移動
						SetModeEx( Weapon02   , EM_SetModeType_Searchenemy, false )--索敵
						SetModeEX( Weapon02  , EM_SetModeType_Gravity , false )--重力
						AddToPartition( Weapon02 , RoomID )	--加進舞台	
						WriteRoleValue( Weapon02 ,EM_RoleValue_PID, Boss)
						SetModeEx( Weapon03   , EM_SetModeType_Strikback, false )--反擊
						SetModeEx( Weapon03   , EM_SetModeType_Move, false )--移動
						SetModeEx( Weapon03   , EM_SetModeType_Searchenemy, false )--索敵
						SetModeEX( Weapon03   , EM_SetModeType_Gravity , false )--重力
						AddToPartition( Weapon03 , RoomID )	--加進舞台	
						WriteRoleValue( Weapon03 ,EM_RoleValue_PID, Boss)	
						Addbuff( Weapon01 , 504831 , 0 , -1 )	
						Addbuff( Weapon02 , 504831 , 0 , -1 )
						Addbuff( Weapon03 , 504831 , 0 , -1 )						
						SetPlot( Weapon01,"dead", "Lua_cang_banalloz_Weapon01_dead" ,0 )
						SetPlot( Weapon02,"dead", "Lua_cang_banalloz_Weapon02_dead" ,0 )
						SetPlot( Weapon03,"dead", "Lua_cang_banalloz_Weapon03_dead" ,0 )
						Weaponset = 2
					elseif SkillRND <= 34 and SkillRND > 0 then
						Weapon01 = CreateObjByFlag( 102875, 780485, 2, 1)
						Weapon02 = CreateObjByFlag( 102876, 780485, 3, 1)
						Weapon03 = CreateObjByFlag( 102877, 780485, 1, 1)
						--Weapon03 = CreateObj( 102875 , 1236 , 545 , 5022 , 90 , 1 )
						--Weapon01 = CreateObj( 102876 , 1236 , 545 , 5196 , 90 , 1 )
						--Weapon02 = CreateObj( 102877 , 1048 , 545 , 5104 , 90 , 1 )
						SetModeEx( Weapon01   , EM_SetModeType_Strikback, false )--反擊
						SetModeEx( Weapon01   , EM_SetModeType_Move, false )--移動
						SetModeEx( Weapon01   , EM_SetModeType_Searchenemy, false )--索敵
						SetModeEX( Weapon01  , EM_SetModeType_Gravity , false )--重力
						AddToPartition( Weapon01 , RoomID )	--加進舞台	
						WriteRoleValue( Weapon01 ,EM_RoleValue_PID, Boss)
						SetModeEx( Weapon02   , EM_SetModeType_Strikback, false )--反擊
						SetModeEx( Weapon02   , EM_SetModeType_Move, false )--移動
						SetModeEx( Weapon02   , EM_SetModeType_Searchenemy, false )--索敵
						SetModeEX( Weapon02  , EM_SetModeType_Gravity , false )--重力
						AddToPartition( Weapon02 , RoomID )	--加進舞台	
						WriteRoleValue( Weapon02 ,EM_RoleValue_PID, Boss)
						SetModeEx( Weapon03   , EM_SetModeType_Strikback, false )--反擊
						SetModeEx( Weapon03   , EM_SetModeType_Move, false )--移動
						SetModeEx( Weapon03   , EM_SetModeType_Searchenemy, false )--索敵
						SetModeEX( Weapon03   , EM_SetModeType_Gravity , false )--重力
						AddToPartition( Weapon03 , RoomID )	--加進舞台	
						WriteRoleValue( Weapon03 ,EM_RoleValue_PID, Boss)
						Addbuff( Weapon01 , 504831 , 0 , -1 )	
						Addbuff( Weapon02 , 504831 , 0 , -1 )
						Addbuff( Weapon03 , 504831 , 0 , -1 )						
						SetPlot( Weapon01,"dead", "Lua_cang_banalloz_Weapon01_dead" ,0 )
						SetPlot( Weapon02,"dead", "Lua_cang_banalloz_Weapon02_dead" ,0 )
						SetPlot( Weapon03,"dead", "Lua_cang_banalloz_Weapon03_dead" ,0 )
						Weaponset = 3
					end
					countmode2 = 1
				end	
			elseif CheckBuff (Boss , Mode3 ) == true then
				Tornadomark = ReadRoleValue( OwnerID() , EM_RoleValue_Register6 )	
				W1 = ReadRoleValue( Boss ,EM_RoleValue_Register7)	
				W2 = ReadRoleValue( Boss ,EM_RoleValue_Register8)			
				W3 = ReadRoleValue( Boss ,EM_RoleValue_Register9)
				--檢查三武器true or false
				--true 放入table rand出一個，替換作BOSS
				--刪除產生劍靈				
				Castime = Castime + 1
				if countmode3 == 0 then
					--Weapon = {}
					TimeMode1 = 0
					Weapon[1] = Weapon01	--劍
					Weapon[2] = Weapon02	--槌
					Weapon[3] = Weapon03	--斧
					if W3 == 1 then
						table.remove (Weapon , 3)
					end	
					if W2 == 1 then
						table.remove (Weapon , 2)
					end		
					if W1 == 1 then--接收到第一把武器回傳
						table.remove (Weapon , 1)--將他在table中移除
					end
					Weapon2 ={}
					for i = 1, table.getn(Weapon) do
						Weapon2[table.getn(Weapon2)+1] = Weapon[i]	--把這些人放入Use2
					end						
					local RW = table.getn(Weapon2)--取目前table目前數量
					local Bossmod = Rand( RW )+1--產生亂數
					NowHP = ReadRoleValue( Boss , EM_RoleValue_HP )	--取得現在血量
					NowHP = NowHP + 1
					NowAttackTarget = ReadRoleValue( Boss , EM_RoleValue_AttackTargetID )
					if RW ~= 0 then
						if Weapon2[Bossmod] == Weapon01 then--當武器等於劍，執行替換
							Sleep(10)
							Delobj(boss)
							Boss = CreateObj( 102872 , NowX , NowY , NowZ , NowDir , 1 )
							AddToPartition( Boss , RoomID)
							WriteRoleValue( Boss , EM_RoleValue_HP , NowHP)	--寫入
							WriteRoleValue( OwnerID(), EM_RoleValue_Register1, Boss)
							WriteRoleValue( Boss , EM_RoleValue_PID , OwnerID())
							SetPlot( Boss,"dead", "Lua_cang_banalloz_Boss_dead" ,0 )
							SetAttack( Boss , NowAttackTarget )
							SysCastSpellLV( NowAttackTarget, Boss, 494659, 1)
							AddBuff( Boss , 504827 , 0 , -1 )
							BeginPlot( Boss , "Lua_cang_banalloz_skill_M3" , 20)
							ScriptMessage( Boss , -1 , 2 ,  "[SC_102721_10]", 1 )
							while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID ) ~= 0   do
							sleep(3)
							end
							CastSpellLV(Boss, Boss, 494482 , 1 )
							Sleep(30)							
							BossM3 = 1
						elseif Weapon2[Bossmod] == Weapon02 then--當武器等於槌，執行替換
							Sleep(10)						
							Delobj(boss)
							Boss = CreateObj( 102873 , NowX , NowY , NowZ , NowDir , 1 )
							AddToPartition( Boss , RoomID)
							WriteRoleValue( Boss , EM_RoleValue_HP , NowHP)	--寫入
							WriteRoleValue( OwnerID(), EM_RoleValue_Register1, Boss)
							WriteRoleValue( Boss , EM_RoleValue_PID , OwnerID())	
							SetPlot( Boss,"dead", "Lua_cang_banalloz_Boss_dead" ,0 )
							SetAttack( Boss , NowAttackTarget )
							SysCastSpellLV( NowAttackTarget, Boss, 494659, 1)
							AddBuff( Boss , 504829 , 0 , -1 )
							BeginPlot( Boss , "Lua_cang_banalloz_skill_M3" , 20)
							ScriptMessage( Boss , -1 , 2 ,  "[SC_102721_12]", 1 )
							while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID ) ~= 0   do
							sleep(3)
							end							
							CastSpellLV(Boss, Boss, 494482 , 1 )
							Sleep(30)							
							BossM3 = 2
						elseif Weapon2[Bossmod] == Weapon03 then--當武器等於斧，執行替換
							Sleep(10)						
							Delobj(boss)
							Boss = CreateObj( 102874 , NowX , NowY , NowZ , NowDir , 1 )
							AddToPartition( Boss , RoomID)
							WriteRoleValue( Boss , EM_RoleValue_HP , NowHP)	--寫入
							WriteRoleValue( OwnerID(), EM_RoleValue_Register1, Boss)
							WriteRoleValue( Boss , EM_RoleValue_PID , OwnerID())
							SetPlot( Boss,"dead", "Lua_cang_banalloz_Boss_dead" ,0 )
							SetAttack( Boss , NowAttackTarget )
							SysCastSpellLV( NowAttackTarget, Boss, 494659, 1)
							AddBuff( Boss , 504828 , 0 , -1 )
							BeginPlot( Boss , "Lua_cang_banalloz_skill_M3" , 20)
							ScriptMessage( Boss , -1 , 2 ,  "[SC_102721_11]", 1 )
							while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID ) ~= 0   do
							sleep(3)
							end							
							CastSpellLV(Boss, Boss, 494482 , 1 )
							Sleep(30)							
							BossM3 = 3
						end
					elseif RW == 0 then 	--如果武器都被殺掉
						Delobj(boss)
						Boss = CreateObj( 102872 , NowX , NowY , NowZ , NowDir , 1 )
						AddToPartition( Boss , RoomID)
						WriteRoleValue( Boss , EM_RoleValue_HP , NowHP)	--寫入
						WriteRoleValue( OwnerID(), EM_RoleValue_Register1, Boss)
						WriteRoleValue( Boss , EM_RoleValue_PID , OwnerID())
						SetPlot( Boss,"dead", "Lua_cang_banalloz_Boss_dead" ,0 )
						SetAttack( Boss , NowAttackTarget )
						AddBuff( Boss , 504827 , 0 , -1 )
						BeginPlot( Boss , "Lua_cang_banalloz_skill_M3" , 20)
						ScriptMessage( Boss , -1 , 2 ,  SkillSay[6], 1 )
						BossM3 = 1					
					end
					local TempPlayer = SetSearchAllPlayer(ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)) --取現在該區內的所有玩家
					local ThesePlayer = {}
					local sway = {}
					for i=1,TempPlayer do
						ThesePlayer[i] = GetSearchResult() -- 接暫存值
						if CheckID( ThesePlayer[i] ) == true and ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then--檢查玩家是不是還在；檢查是否死亡
							sway[table.getn(sway)+1] = ThesePlayer[i]	--放入Useful裡面 
						end					
					end	
					if W1 == 0 then--劍靈
						anyone = Rand(table.getn(sway))+1	--rand 
						WHP = ReadRoleValue( Weapon01 , EM_RoleValue_HP )
						WHP = WHP + 1	
						DelObj( Weapon01 )
						if Weaponset == 1 then
							WeaponSoul01 = CreateObjByFlag( 102878, 780485, 1, 1)
						elseif Weaponset == 2 then
							WeaponSoul01 = CreateObjByFlag( 102878, 780485, 1, 1)
						elseif Weaponset == 3 then
							WeaponSoul01 = CreateObjByFlag( 102878, 780485, 1, 1)
						end
						AddToPartition( WeaponSoul01 , RoomID )	--加進舞台
						WriteRoleValue( WeaponSoul01 , EM_RoleValue_HP , WHP)
						SysCastSpellLV( sway[anyone], WeaponSoul01, 494484, 1)
						SetAttack(WeaponSoul01, sway[anyone] )	--rand出來的人嘲諷
						WriteRoleValue( WeaponSoul01 ,EM_RoleValue_PID, Boss)
						BeginPlot( WeaponSoul01, "Lua_cang_banalloz_W1" , 20)
					end
					if W2 == 0 then--槌靈
						anyone = Rand(table.getn(sway))+1 	--rand	
						WHP = ReadRoleValue( Weapon02 , EM_RoleValue_HP )
						WHP = WHP + 1
						DelObj( Weapon02 )	
						if Weaponset == 1 then
							WeaponSoul02 = CreateObjByFlag( 102879, 780485, 2, 1)
						elseif Weaponset == 2 then
							WeaponSoul02 = CreateObjByFlag( 102879, 780485, 3, 1)
						elseif Weaponset == 3 then
							WeaponSoul02 = CreateObjByFlag( 102879, 780485, 1, 1)
						end
						AddToPartition( WeaponSoul02 , RoomID )	--加進舞台
						WriteRoleValue( WeaponSoul02 , EM_RoleValue_HP , WHP)
						SysCastSpellLV( sway[anyone], WeaponSoul02, 494484, 1)
						SetAttack(WeaponSoul02, sway[anyone] )	--rand出來的人嘲諷		
						WriteRoleValue( WeaponSoul02 ,EM_RoleValue_PID, Boss)
						BeginPlot( WeaponSoul02, "Lua_cang_banalloz_W2" , 20)
					end
					if W3 == 0 then--斧靈
						anyone = Rand(table.getn(sway))+1 	--rand
						WHP = ReadRoleValue( Weapon03 , EM_RoleValue_HP )
						WHP = WHP + 1
						DelObj( Weapon03 )
						if Weaponset == 1 then
							WeaponSoul03 = CreateObjByFlag( 102880, 780485, 3, 1)
						elseif Weaponset == 2 then
							WeaponSoul03 = CreateObjByFlag( 102880, 780485, 1, 1)
						elseif Weaponset == 3 then
							WeaponSoul03 = CreateObjByFlag( 102880, 780485, 2, 1)
						end						
						AddToPartition( WeaponSoul03 , RoomID )	--加進舞台
						WriteRoleValue( WeaponSoul03 , EM_RoleValue_HP , WHP)
						SysCastSpellLV( sway[anyone], WeaponSoul03, 494484, 1)
						SetAttack(WeaponSoul03, sway[anyone] )	--rand出來的人嘲諷
						WriteRoleValue( WeaponSoul03 ,EM_RoleValue_PID, Boss)
						BeginPlot( WeaponSoul03, "Lua_cang_banalloz_W3" , 20)
					end					
				end			
				if Castime == 5 then--龍捲風啟動					
					local TempPlayer = SetSearchAllPlayer(ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)) --取現在該區內的所有玩家
					local ThesePlayer = {}	
					local sway = {}
					for i=1,TempPlayer do
						ThesePlayer[i] = GetSearchResult() -- 接暫存值
						if CheckID( ThesePlayer[i] ) == true and 
						ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and 
						ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then
						--檢查玩家是不是還在；檢查是否死亡
							if  ThesePlayer[i] ~= AttackTarget then
								sway[table.getn(sway)+1] = ThesePlayer[i]	
							end--放入Useful裡面 
						end					
					end	
					if table.getn(sway) ~= 0 then	
						local anyone = Rand(table.getn(sway))+1	--rand
						local PX = ReadRoleValue( sway[anyone] , EM_RoleValue_X )
						local PY = ReadRoleValue( sway[anyone] , EM_RoleValue_Y )
						local PZ = ReadRoleValue( sway[anyone] , EM_RoleValue_Z )
						PDir = ReadRoleValue( sway[anyone] , EM_RoleValue_Dir )	
						Tornado = CreateObj( 102909 , PX , PY , PZ , PDir , 1 )
						SetModeEx( Tornado , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
						SetModeEx( Tornado , EM_SetModeType_Mark, false )--標記
						SetModeEx( Tornado , EM_SetModeType_ShowRoleHead, false )--頭像框
						SetModeEx( Tornado , EM_SetModeType_HideName, false )--名稱			
						AddToPartition( Tornado , RoomID )	--加進舞台
						AddBuff( Tornado , 504830 , 0, -1 )
						WriteRoleValue( Boss , EM_RoleValue_Register2 , Tornado)
						WriteRoleValue( Tornado	, EM_RoleValue_Register2 , Boss)
						WriteRoleValue( Tornado	, EM_RoleValue_Register1 , OwnerID())
						WriteRoleValue( Tornado , EM_RoleValue_Livetime, 20 )--存在時間
						Addbuff( Tornado , 505085 , 1 , -1 )
						SysCastSpellLV( sway[anyone], Tornado, 494659, 1)
						SetAttack(Tornado, sway[anyone] )	--rand出來的人嘲諷
						SetModeEx(Tornado , EM_SetModeType_Fight , false )--可砍殺攻擊
					elseif table.getn(sway) == 0 then
						local PX = ReadRoleValue( AttackTarget , EM_RoleValue_X )
						local PY = ReadRoleValue( AttackTarget , EM_RoleValue_Y )
						local PZ = ReadRoleValue( AttackTarget , EM_RoleValue_Z )
						local PDir = ReadRoleValue( AttackTarget , EM_RoleValue_Dir )	
						Tornado = CreateObj( 102909 , PX , PY , PZ , PDir , 1 )
						SetModeEx( Tornado , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
						SetModeEx( Tornado , EM_SetModeType_Mark, false )--標記
						SetModeEx( Tornado , EM_SetModeType_ShowRoleHead, false )--頭像框
						SetModeEx( Tornado , EM_SetModeType_HideName, false )--名稱			
						AddToPartition( Tornado , RoomID )	--加進舞台
						AddBuff( Tornado , 504830 , 0, -1 )
						WriteRoleValue( Boss , EM_RoleValue_Register2 , Tornado)
						WriteRoleValue( Tornado	, EM_RoleValue_Register2 , Boss)
						WriteRoleValue( Tornado	, EM_RoleValue_Register1 , OwnerID())
						WriteRoleValue( Tornado , EM_RoleValue_Livetime, 20 )--存在時間
						Addbuff( Tornado , 505085 , 1 , -1 )						
						SysCastSpellLV( AttackTarget, Tornado, 494659, 1)
						SetAttack(Tornado, AttackTarget )	--rand出來的人嘲諷
						SetModeEx(Tornado , EM_SetModeType_Fight , false )--可砍殺攻擊
					end
				end	
				if Tornadomark == 1 then
					NowHP = ReadRoleValue( Boss , EM_RoleValue_HP )	--取得現在血量
					NowHP = NowHP + 1
					NowAttackTarget = ReadRoleValue( Boss , EM_RoleValue_AttackTargetID )
					if BossM3 == 1 then
						DelObj( Boss )
						Boss = CreateObj( 102872 , NowX , NowY , NowZ , NowDir , 1 )
						WriteRoleValue( Boss , EM_RoleValue_HP , NowHP)	--寫入
						WriteRoleValue( OwnerID(), EM_RoleValue_Register1, Boss)
						WriteRoleValue( Boss , EM_RoleValue_PID , OwnerID())
						AddToPartition( Boss , RoomID )
						SetPlot( Boss,"dead", "Lua_cang_banalloz_Boss_dead" ,0 )
						SetAttack( Boss , NowAttackTarget )
						SysCastSpellLV( NowAttackTarget, Boss, 494659, 1)
						AddBuff( Boss , 504827 , 0 , -1 )
						BeginPlot( Boss , "Lua_cang_banalloz_skill_M3" , 20)
						WriteRoleValue( OwnerID(), EM_RoleValue_Register6, 0)
					end						
					if BossM3 == 2 then
						DelObj( Boss )
						Boss = CreateObj( 102873 , NowX , NowY , NowZ , NowDir , 1 )
						WriteRoleValue( Boss , EM_RoleValue_HP , NowHP)	--寫入
						WriteRoleValue( OwnerID(), EM_RoleValue_Register1, Boss)
						WriteRoleValue( Boss , EM_RoleValue_PID , OwnerID())
						AddToPartition( Boss , RoomID )
						SetPlot( Boss,"dead", "Lua_cang_banalloz_Boss_dead" ,0 )
						SetAttack( Boss , NowAttackTarget )
						SysCastSpellLV( NowAttackTarget, Boss, 494659, 1)
						AddBuff( Boss , 504828 , 0 , -1 )
						BeginPlot( Boss , "Lua_cang_banalloz_skill_M3" , 20)
						WriteRoleValue( OwnerID(), EM_RoleValue_Register6, 0)
					end
					if BossM3 == 3 then
						DelObj( Boss )
						Boss = CreateObj( 102874 , NowX , NowY , NowZ , NowDir , 1 )
						WriteRoleValue( Boss , EM_RoleValue_HP , NowHP)	--寫入
						WriteRoleValue( OwnerID(), EM_RoleValue_Register1, Boss)
						WriteRoleValue( Boss , EM_RoleValue_PID , OwnerID())
						AddToPartition( Boss , RoomID )
						SetPlot( Boss,"dead", "Lua_cang_banalloz_Boss_dead" ,0 )
						SetAttack( Boss , NowAttackTarget )
						SysCastSpellLV( NowAttackTarget, Boss, 494659, 1)
						AddBuff( Boss , 504829 , 0 , -1 )
						BeginPlot( Boss , "Lua_cang_banalloz_skill_M3" , 20)
						WriteRoleValue( OwnerID(), EM_RoleValue_Register6, 0)
					end
				end		
				countmode3 = 1			
			end
		end
		--重置階段
		reset = ReadRoleValue( OwnerID() , EM_RoleValue_Register4 )			
		if reset == 1 then 	
			Boss = ReadRoleValue( OwnerID() , EM_RoleValue_Register1 )
			Dead = ReadRoleValue( OwnerID() , EM_RoleValue_Register5 )
			if fight == 1 then
				BeginPlot(Door , "Lua_cang_banalloz_door_close", 0)
				sleep(50)
				DelObj(Boss)
				DelObj(Door)
				if countmode2 == 1 then
					DelObj(Weapon01)
					DelObj(Weapon02)
					DelObj(Weapon03)
				end
				WriteRoleValue( OwnerID(), EM_RoleValue_Register1, 0)			
				WriteRoleValue( OwnerID(), EM_RoleValue_Register2, 0)			
				WriteRoleValue( OwnerID(), EM_RoleValue_Register3, 0)			
				WriteRoleValue( OwnerID(), EM_RoleValue_Register4, 0)			
				WriteRoleValue( OwnerID(), EM_RoleValue_Register5, 0)			
				WriteRoleValue( OwnerID(), EM_RoleValue_Register6, 0)			
				WriteRoleValue( OwnerID(), EM_RoleValue_Register7, 0)
				WriteRoleValue( OwnerID(), EM_RoleValue_Register8, 0)
				WriteRoleValue( OwnerID(), EM_RoleValue_Register9, 0)
				if Dead == 0 then
					BeginPlot( OwnerID(), "Lua_cang_banalloz_reopen", 10 )
				end
			end
		end
		--死亡階段
		if Dead == 1 then
			if countmode2 == 1 then
				DelObj(Weapon01)
				DelObj(Weapon02)
				DelObj(Weapon03)
			end
		end	
	end	
end			
							
function Lua_cang_banalloz_Weapon01_dead() --劍死亡回傳
	local Boss = ReadRoleValue( OwnerID() ,EM_RoleValue_PID)
	WriteRoleValue( Boss , EM_RoleValue_Register7 , 1)	--寫入PID
	Hide(OwnerID())
end

function Lua_cang_banalloz_Weapon02_dead() --槌死亡回傳
	local Boss = ReadRoleValue( OwnerID() ,EM_RoleValue_PID)
	WriteRoleValue( Boss , EM_RoleValue_Register8 , 1)	--寫入PID
	Hide(OwnerID())
end

function Lua_cang_banalloz_Weapon03_dead() --斧死亡回傳
	local Boss = ReadRoleValue( OwnerID() ,EM_RoleValue_PID)
	WriteRoleValue( Boss , EM_RoleValue_Register9 , 1)	--寫入PID
	Hide(OwnerID())	
end

function Lua_cang_banalloz_reopen() --重置
	local opener = CreateObjByFlag( 104164, 780485, 5, 1)	--招換
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)--
	local Door = ReadRoleValue(OwnerID(),EM_RoleValue_Register3)--王座上的王	
	SetModeEx( opener   , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( opener   , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( opener   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( opener   , EM_SetModeType_Mark, false )--標記
	SetModeEx( opener   , EM_SetModeType_Move, false )--移動
	SetModeEx( opener   , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( opener   , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( opener   , EM_SetModeType_HideName, false )--名稱
	AddToPartition( opener , RoomID )	--加進舞台
	BeginPlot( opener, "Lua_cang_banalloz_restart" , 10)
	DelObj(Door)
	DelObj(OwnerID())
end

function Lua_cang_banalloz_Tornado()--觸發龍捲風機制
	local Boss = ReadRoleValue( OwnerID() , EM_RoleValue_Register2 )
	local close = ReadRoleValue( OwnerID() , EM_RoleValue_Register1 )
	while true do
		sleep(10)
		if GetDistance( OwnerID(), Boss ) <= 50 then
			WriteRoleValue( close ,EM_RoleValue_Register6, 1)
			sleep(10)	
			DelObj(OwnerID())
		end	
	end
end

function Lua_cang_banalloz_Show()	
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)		
	--local show1 = CreateObj( 102881 , 1236 , 530 , 5022 , 90 , 1 )
	--local show2 = CreateObj( 102881 , 1236 , 530 , 5196 , 90 , 1 )
	--local show3 = CreateObj( 102881 , 1048 , 530 , 5104 , 90 , 1 )
	local show1 = CreateObjByFlag( 102881, 780485, 1, 1)
	local show2 = CreateObjByFlag( 102881, 780485, 2, 1)
	local show3 = CreateObjByFlag( 102881, 780485, 3, 1)
	SetModeEX( show1  , EM_SetModeType_Gravity , false )--重力
	SetModeEx( show1  , EM_SetModeType_ShowRoleHead, false )--不秀頭像框
	SetModeEx( show1  , EM_SetModeType_Mark, false )--標記
	SetModeEx( show1  , EM_SetModeType_Move, false )--移動
	SetModeEx( show1  , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( show1   , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( show1  , EM_SetModeType_Strikback, false )--反擊				
	AddToPartition( show1 , RoomID )											
	SetModeEX( show2  , EM_SetModeType_Gravity , false )--重力
	SetModeEx( show2  , EM_SetModeType_ShowRoleHead, false )--不秀頭像框
	SetModeEx( show2  , EM_SetModeType_Mark, false )--標記
	SetModeEx( show2  , EM_SetModeType_Move, false )--移動
	SetModeEx( show2  , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( show2   , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( show2   , EM_SetModeType_Strikback, false )--反擊				
	AddToPartition( show2 , RoomID )											
	SetModeEX( show3  , EM_SetModeType_Gravity , false )--重力
	SetModeEx( show3  , EM_SetModeType_ShowRoleHead, false )--不秀頭像框
	SetModeEx( show3  , EM_SetModeType_Mark, false )--標記
	SetModeEx( show3  , EM_SetModeType_Move, false )--移動
	SetModeEx( show3  , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( show3   , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( show3   , EM_SetModeType_Strikback, false )--反擊	
	AddToPartition( show3 , RoomID )	
	CastSpellLV(show1, show1, 494318 , 1 )								
	CastSpellLV(show2, show2, 494318 , 1 )
	CastSpellLV(show3, show3, 494318 , 1 )	
	WriteRoleValue(show1, EM_RoleValue_Livetime,15)
	WriteRoleValue(show2, EM_RoleValue_Livetime,15)
	WriteRoleValue(show3, EM_RoleValue_Livetime,15)
end