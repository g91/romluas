--啟動器
--EM_RoleValue_PID BOSS
--EM_RoleValue_Register1
--EM_RoleValue_Register2 
--EM_RoleValue_Register3 dead
--EM_RoleValue_Register4 
--EM_RoleValue_Register5
--EM_RoleValue_Register6 weapon
--EM_RoleValue_Register7 door
--EM_RoleValue_Register8 anyone
--EM_RoleValue_Register9 reset

--Boss
--EM_RoleValue_PID 啟動器

--------------------------------------------------------------------------------啟動器
function Cang_127_edward_start()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local Boss01 = CreateObjByFlag( 103155, 780586, 0, 1)	--招換	
	AddToPartition( Boss01 , RoomID )	--加進舞台	
	WriteRoleValue( OwnerID() ,EM_RoleValue_PID, Boss01 )--BOSS存入計時器 R1
	WriteRoleValue( Boss01 ,EM_RoleValue_PID, OwnerID() )--計時器存入BOSS PID
	BeginPlot( OwnerID(), "Cang_127_edward_time" , 0)
	BeginPlot( OwnerID(), "Cang_127_edward" , 20)
	SetPlot( Boss01,"dead", "Cang_127_edward_dead" ,0 )	
	local Door
	Door = CreateObjByFlag( 103281, 780586, 5, 1)			
	SetModeEX( Door  , EM_SetModeType_Gravity , false )--重力
	SetModeEx( Door  , EM_SetModeType_ShowRoleHead, false )--不秀頭像框
	SetModeEx( Door  , EM_SetModeType_Mark, false )--標記
	SetModeEx( Door  , EM_SetModeType_Move, false )--移動
	SetModeEx( Door  , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( Door  , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( Door  , EM_SetModeType_Strikback, false )--反擊
	SetDefIdleMotion( Door , ruFUSION_MIME_IDLE_STAND )
	SetModeEx( Door  , EM_SetModeType_Obstruct, false )--阻擋
	AddToPartition( Door , RoomID )
	WriteRoleValue( OwnerID() ,EM_RoleValue_Register7, 	Door)
	
	local Dead = 0 
	local reset = 0	--重置階段 讀取boss是否離開戰鬥
	local CountDead = 0
	while true do
		sleep(10)
		reset = ReadRoleValue( OwnerID() ,EM_RoleValue_Register9 )--重置回傳值
		Dead = ReadRoleValue( OwnerID() ,EM_RoleValue_Register3 )--死亡回傳
		if Dead == 1 then
			reset = 2
			WriteRoleValue( OwnerID() ,EM_RoleValue_Register3, 	2)
			if CountDead == 0 then
				ScriptMessage( OwnerID() , -1 , 2 ,  "[SC_103155_05]", 1 )					
				sleep(50)
				SetDefIdleMotion( Door , ruFUSION_MIME_IDLE_STAND )
				SetModeEx( Door  , EM_SetModeType_Obstruct, false )--阻擋				
				DelObj(Door)				
				sleep(50)
				DelObj(OwnerID())
			end	
		end		
		if reset == 1 then
			sleep(30)
			DelObj( Boss01 )
			local start = CreateObjByFlag( 103492, 780586, 0, 1)
			SetModeEX( start  , EM_SetModeType_Gravity , false )--重力
			SetModeEx( start  , EM_SetModeType_ShowRoleHead, false )--不秀頭像框
			SetModeEx( start  , EM_SetModeType_Show, false )--顯示
			SetModeEx( start  , EM_SetModeType_Mark, false )--標記
			SetModeEx( start  , EM_SetModeType_Move, false )--移動
			SetModeEx( start  , EM_SetModeType_Searchenemy, false )--索敵
			SetModeEx( start  , EM_SetModeType_Fight , false )--可砍殺攻擊
			SetModeEx( start  , EM_SetModeType_Strikback, false )--反擊
			AddToPartition( start , RoomID )
			SetDefIdleMotion( Door , ruFUSION_MIME_IDLE_STAND )
			SetModeEx( Door  , EM_SetModeType_Obstruct, false )--阻擋
			DelObj( Door )
			BeginPlot( start, "Cang_127_edward_start" , 0)
			sleep( 30 )
			DelObj( OwnerID())
		end	
	end
end


--------------------------------------------------------------------------------死亡劇情
function Cang_127_edward_dead() --王死掉回傳	
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	SetModeEX( OwnerID()  , EM_SetModeType_Gravity , true )--重力
	local start = ReadRoleValue( OwnerID() ,EM_RoleValue_PID)
	WriteRoleValue( start , EM_RoleValue_Register3 , 1)	--寫入PID
	local air = ReadRoleValue( OwnerID() ,EM_RoleValue_Register1)
	if air == 1 then
		SetPosByFlag( OwnerID() , 780586 , 0 )
		air = 2
	end
	local out1 = CreateObj( 103277 , 4303, 401.5, 830, 314.1 , 1)
	SetModeEX( out1  , EM_SetModeType_Gravity , false )--重力
	--SetModeEx( out1  , EM_SetModeType_Mark, false )--標記
	SetModeEx( out1  , EM_SetModeType_ShowRoleHead, false )--不秀頭像框
	SetModeEx( out1  , EM_SetModeType_Hidename, false )--不秀頭像框
	SetModeEx( out1  , EM_SetModeType_Move, false )--移動
	SetModeEx( out1  , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( out1  , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( out1  , EM_SetModeType_Strikback, false )--反擊
	AddToPartition( out1 , RoomID )
	local out = CreateObj( 103889 , 4303, 381.1, 830, 314.1 , 1)
	SetModeEX( out  , EM_SetModeType_Gravity , false )--重力
	--SetModeEx( out  , EM_SetModeType_Mark, false )--標記
	SetModeEx( out  , EM_SetModeType_ShowRoleHead, false )--不秀頭像框
	SetModeEx( out  , EM_SetModeType_Hidename, false )--不秀頭像框
	SetModeEx( out  , EM_SetModeType_Move, false )--移動
	SetModeEx( out  , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( out  , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( out  , EM_SetModeType_Strikback, false )--反擊
	AddToPartition( out , RoomID )	
	BeginPlot( out, "zone_15_127_128_End", 0 )
end

--------------------------------------------------------------------------------第二次之後的script
function Cang_127_edward_restart()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local Boss01 = CreateObjByFlag( 103155, 780586, 0, 1)--招換	
	AddToPartition( Boss01 , RoomID )	--加進舞台	
	WriteRoleValue( OwnerID() ,EM_RoleValue_PID, Boss01 )--BOSS存入計時器 R1
	WriteRoleValue( Boss01 ,EM_RoleValue_PID, OwnerID() )--計時器存入BOSS PID
	BeginPlot( OwnerID(), "Cang_127_edward_time" , 0)
	BeginPlot( OwnerID(), "Cang_127_edward" , 20)
	SetPlot( Boss01,"dead", "Cang_127_edward_dead" ,0 )	
	--WriteRoleValue( OwnerID() ,EM_RoleValue_Register2, 2)
	local Door	
	Door = CreateObjByFlag( 103281, 780586, 5, 1)			
	SetModeEX( Door  , EM_SetModeType_Gravity , false )--重力
	SetModeEx( Door  , EM_SetModeType_ShowRoleHead, false )--不秀頭像框
	SetModeEx( Door  , EM_SetModeType_Mark, false )--標記
	SetModeEx( Door  , EM_SetModeType_Move, false )--移動
	SetModeEx( Door  , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( Door  , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( Door  , EM_SetModeType_Strikback, false )--反擊
	SetDefIdleMotion( Door , ruFUSION_MIME_IDLE_STAND )
	SetModeEx( Door  , EM_SetModeType_Obstruct, false )--阻擋	
	AddToPartition( Door , RoomID )
	WriteRoleValue( OwnerID() ,EM_RoleValue_Register7, 	Door)
	
	local Dead = 0 
	local reset = 0	--重置階段 讀取boss是否離開戰鬥
	local CountDead = 0
	while true do
		sleep(10)
		reset = ReadRoleValue( OwnerID() ,EM_RoleValue_Register9 )--重置回傳值
		Dead = ReadRoleValue( OwnerID() ,EM_RoleValue_Register3 )--死亡回傳
		if reset == 1 then
			sleep(30)		
			DelObj( Boss01 )
			local start = CreateObjByFlag( 103492, 780586, 0, 1)
			SetModeEX( start  , EM_SetModeType_Gravity , false )--重力
			SetModeEx( start  , EM_SetModeType_ShowRoleHead, false )--不秀頭像框
			SetModeEx( start  , EM_SetModeType_Show, false )--顯示
			SetModeEx( start  , EM_SetModeType_Mark, false )--標記
			SetModeEx( start  , EM_SetModeType_Move, false )--移動
			SetModeEx( start  , EM_SetModeType_Searchenemy, false )--索敵
			SetModeEx( start  , EM_SetModeType_Fight , false )--可砍殺攻擊
			SetModeEx( start  , EM_SetModeType_Strikback, false )--反擊
			AddToPartition( start , RoomID )
			SetDefIdleMotion( Door , ruFUSION_MIME_IDLE_STAND )
			SetModeEx( Door  , EM_SetModeType_Obstruct, false )--阻擋			
			DelObj( Door )			
			BeginPlot( start, "Cang_127_edward_restart" , 0)
			sleep( 30 )
			DelObj( OwnerID())
		end	
		if Dead == 1 then
			if CountDead == 0 then
				ScriptMessage( OwnerID() , -1 , 2 ,  "[SC_103155_05]", 1 )			
				sleep(50)
				SetDefIdleMotion( Door , ruFUSION_MIME_IDLE_STAND )
				SetModeEx( Door  , EM_SetModeType_Obstruct, false )--阻擋				
				DelObj(Door)				
				sleep(50)
				DelObj(OwnerID())
			end	
		end
	end
end
--------------------------------------------------------------------------------開場說話

--function Cang_127_Marsh_say()
	--Say( TargetID(), "1")
	--SetPlot( TargetID(), "range" , "" , 0 )
	--BeginPlot( TargetID(), "Cang_127_Marsh_say_01", 0 )
--end

--function Cang_127_Marsh_say_01()
	--Say( OwnerID(), "[SC_103155_01]")
	--local Boss = ReadRoleValue( OwnerID() ,EM_RoleValue_PID )
	--ScriptMessage( Boss , -1 , 2 ,  "[SC_103155_01]", 1 )
	--ScriptMessage( OwnerID() , -1 , 2 ,  "[SC_103155_01]", 1 )
	--sleep(50)
	--DelObj( OwnerID() )
--end

--------------------------------------------------------------------------------狂暴機制
function Cang_127_edward_time()--狂暴機制
	local Boss
	local Time = 0
	while true do
		sleep(10)
		Boss = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
		local AttackTarget = ReadRoleValue( Boss , EM_RoleValue_AttackTargetID )	--抓目標值
		if (  AttackTarget ~= 0 ) and ( CheckID( Boss ) == true ) then  -- 檢查是否離開戰鬥
			Time = Time + 1
			if Time >= 600 then
				AddBuff( Boss , 506335 , 0 , -1 )
			end
		end
	end	
end

--------------------------------------------------------------------------------主體SCRIPT
function Cang_127_edward()

	local RoomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID)
	local Boss = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local fight = 0		--1代表進入戰鬥
	local skillsp = 0
	local count = 0
	local count1 = 0
	local count2 = 0
	local count3 = 0 
	local anyone 
	local CheckTime = 10
	local BossTarget
	local SkillShow
	local countskill = 0
	local skyskill = 0
	local bskill = 0
	local Doorstart = 0
	local air = 0
	local SkillDelay = { 2 , 2 , 3 }	-- 技能延遲時間
		--
	local SkillID = { 495358, 495363, 495364 }	-- 招式ID	
		--地牙、招式1、招式2
	local SkillLV = { 4 , 4 , 4 }	--技能等級
		--
	local SkillSay = {"[SC_103155_02]"}
--這就是力量！超越人與龍真正的力量！	
	local CountSay = { "[SC_103155_01]",  "[SC_103155_03]", "[SC_103155_04]", "[SC_103155_05]"   }
--平民，是誰允許你們闖入我的宮殿...那些該死的真理之手研究員在哪裡？居然讓你們來到我的面前，到頭來還是要靠自己阿...平民，回答我，是蘭斯這鼠輩派你們來的嗎？也好，讓你們感受一下人與龍力量的結合吧！

--[$VAR1]，刺穿你的心臟，痛楚很快就過了，真理之手會讓你不再懼怕死亡。
--瞧，從高處向下望，你們不過是我腳底下的螻蟻，一踩即碎啊！
--不！！我擁有龍至高的力量阿！！你們這些平民是無法殺掉我的！！我是亞班諾之皇阿...
	
	
	local Door = ReadRoleValue( OwnerID() ,EM_RoleValue_Register7 )
	while true do
		sleep(10)
		local AttackTarget = ReadRoleValue( Boss , EM_RoleValue_AttackTargetID ) 	
		if (  AttackTarget ~= 0 ) and ( CheckID( Boss ) == true ) then  -- 檢查是否離開戰鬥
			if Doorstart == 0 then
				Say( Boss ,  CountSay[1] )			
				SetDefIdleMotion( Door,ruFUSION_MIME_ACTIVATE_LOOP)
				SetModeEx( Door , EM_SetModeType_Obstruct, true )--阻擋
				Doorstart = 1
			end	
			fight = 1
			skillsp = skillsp + 1
			countskill = countskill + 1 
			skyskill = skyskill + 1
			--Say(Boss, "skillsp="..skillsp )
			--Say(Boss, "count="..count)
--------------第一階段 普通攻擊 產生盾
			if skillsp >= 15 and count == 0 then
				if count1 == 0 then
					BeginPlot( OwnerID(), "Cang_127_edward_weapon" , 0)	--產生武器架
					count = 1
					count1 = 1
				end
			end	
--------------第二階段 特殊招				
			if skillsp >= 25 and count == 1 then	 
				if count2 == 0 then	--抓一個衰小玩家
					local TempPlayer = SetSearchAllPlayer(ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)) --取現在該區內的所有玩家
					local ThesePlayer = {}	
					local sway = {}
					for i=1,TempPlayer do
						ThesePlayer[i] = GetSearchResult() -- 接暫存值
						if CheckID( ThesePlayer[i] ) == true and 
						ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and 
						ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then
						--檢查玩家是不是還在；檢查是否死亡
							--if  ThesePlayer[i] ~= AttackTarget then
							sway[table.getn(sway)+1] = ThesePlayer[i]	
							--end--放入sway裡面 
						end					
					end	
					if table.getn(sway) ~= 0 then	
						anyone = DW_Rand(table.getn(sway))	--rand	
						WriteRoleValue( OwnerID() ,EM_RoleValue_Register8, sway[anyone]) 	--被抓的人
						CastSpellLV( Boss, sway[anyone], 495359 , 1 ) --綁人	
						
						local MessageString
						local PlayerName = GetName( sway[anyone] )
						MessageString = "[SC_103155_03][$SETVAR1="..PlayerName.."]" ----在string中可以秀出玩家的名字
						ScriptMessage( Boss , -1 , 2 ,  MessageString, 1 )
						Yell( Boss , MessageString , 5)						
					end
					SetModeEx( Boss , EM_SetModeType_Move, false )
					--CastSpellLV( Boss, Boss, 495360 , 1 ) --集氣
					--Sleep(50)
					while 	ReadRoleValue( Boss , EM_RoleValue_SpellMagicID ) ~= 0   do
						sleep(3)
					end					
					SetAttack( Boss , sway[anyone] )
					CastSpellLV( Boss, sway[anyone] , 495357 , 5 )
					sleep(20)
					SetModeEx( Boss , EM_SetModeType_Move, true )
					count2 = 1
				end	
			end	
--------------升空階段
			if skillsp >= 33 and count == 1 then
				count = 2
			end
			if skillsp >= 35 and count == 2 then	
				if count3 == 0 then
					air = 1
					WriteRoleValue( Boss ,EM_RoleValue_Register1, 	1)
					Addbuff(Boss , 506336 , 1, -1)
					SetModeEx( Boss   , EM_SetModeType_Move, false )--移動
					SetModeEX( Boss   , EM_SetModeType_Gravity , false )--重力
					SetModeEx( Boss  , EM_SetModeType_Fight , false )--可砍殺攻擊					
					--SetPosByFlag( Boss , 780586 , 0 )	--傳送王到這個攻擊點
					SetPos( Boss , 4277 , 450 , 956 , 0 )
					ScriptMessage( Boss , -1 , 2 ,  CountSay[3], 1 )
					count3 = 1
					bskill = 1
				end
			end
--------------回歸地面
			if skillsp >= 58 and count == 2 then
				count = 3				
			end
			if skillsp >= 60 and count == 3 then
				air = 0
				WriteRoleValue( Boss ,EM_RoleValue_Register1, 0)
				bskill = 0
				CancelBuff(Boss , 506336 )
				SetModeEx( Boss   , EM_SetModeType_Move, true )--移動
				SetModeEX( Boss   , EM_SetModeType_Gravity , true )--重力
				SetModeEx( Boss  , EM_SetModeType_Fight , true )--可砍殺攻擊
				SetPosByFlag( Boss , 780586 , 0 )	--傳送王到這個攻擊點			
			
				skillsp = 0
				count = 0
				count1 = 0
				count2 = 0
				count3 = 0
			end
		end
--------------普通技能施放		
		if countskill >= 5 then
			if count == 0 or count == 1 or count == 3 then
				local SkillRND = DW_Rand ( 100 ) 
				if SkillRND <= 100 and SkillRND > 75 then 
					SkillShow = 1	--
					BossTarget = Boss					
				elseif SkillRND <= 75 and SkillRND > 50 then 
					SkillShow = 2	--
					BossTarget = AttackTarget						
				elseif SkillRND <= 50 and SkillRND > 25 then 
					SkillShow = 3	--
					BossTarget = Boss										
				elseif SkillRND <= 25 and SkillRND > 0 then 
					SkillShow = 3	--
					BossTarget = Boss					
				end	
				SkillB = 0
				--Say( Boss , "SkillShow="..SkillShow)
				if SkillShow == 1 then
					ScriptMessage( Boss , -1 , 2 ,  SkillSay[1], 1 )
				end	
				while 	ReadRoleValue( Boss , EM_RoleValue_SpellMagicID ) ~= 0   do
					sleep(3)
				end
				CastSpellLV( Boss , BossTarget , SkillID[SkillShow] , SkillLV[SkillShow] )
				Sleep( SkillDelay[SkillShow] * CheckTime )	
				SkillShow = 0
				countskill = 0
			end	
			if count == 2 and bskill == 1 then
				local TempPlayer = SetSearchAllPlayer(ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)) --取現在該區內的所有玩家
				local ThesePlayer = {}	
				local sway = {}
				for i=1,TempPlayer do
					ThesePlayer[i] = GetSearchResult() -- 接暫存值
					if CheckID( ThesePlayer[i] ) == true and 
					ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and 
					ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then
					--檢查玩家是不是還在；檢查是否死亡
						--if  ThesePlayer[i] ~= AttackTarget then
						sway[table.getn(sway)+1] = ThesePlayer[i]	
						--end--放入sway裡面 
					end					
				end	
				if table.getn(sway) ~= 0 then	
					anyone = DW_Rand(table.getn(sway))		
					CastSpellLV( Boss, sway[anyone], 495366 , 1 ) 
				end	
				countskill = 0
			end	
		end
		if (  AttackTarget == 0 ) and ( CheckID( Boss ) == true ) and fight == 1 then
			count = 0
			count1 = 0
			count2 = 0
			count3 = 0
			fight = 0
			skillsp = 0
			WriteRoleValue( OwnerID() ,EM_RoleValue_Register9, 1) 
		end
	end	
end

--------------------------------------------------------------------------------產生武器架
function Cang_127_edward_weapon()
	local weapon01, weapon02, weapon03, weapon04	--四個武器架
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local SkillRND = DW_Rand ( 4 ) 	--產生武器架
	if SkillRND == 1 then
		weapon01 = CreateObjByFlag( 114951, 780586, 1, 1)			
		SetModeEx( weapon01  , EM_SetModeType_HideName, false )--名稱	
		SetModeEX( weapon01  , EM_SetModeType_Gravity , false )--重力
		SetModeEx( weapon01  , EM_SetModeType_ShowRoleHead, false )--不秀頭像框
		SetModeEx( weapon01  , EM_SetModeType_Move, false )--移動
		SetModeEx( weapon01  , EM_SetModeType_Searchenemy, false )--索敵
		SetModeEx( weapon01  , EM_SetModeType_Fight , false )--可砍殺攻擊
		SetModeEx( weapon01  , EM_SetModeType_Strikback, false )--反擊	
		AddToPartition( weapon01 , RoomID )	
		CastSpellLV( weapon01, weapon01, 494319 , 1 )
		SetPlot( weapon01, "touch" , "Cang_127_edward_shield" ,10 )
		AddBuff( weapon01, 506430, 0, -1)
		WriteRoleValue( weapon01 , EM_RoleValue_Livetime, 20 )	
		WriteRoleValue(	weapon01 , EM_RoleValue_PID, OwnerID() )
		BeginPlot( weapon01, "Cang_127_edward_wpend" ,10 )
	elseif SkillRND == 2 then
		weapon02 = CreateObjByFlag( 114951, 780586, 2, 1)			
		SetModeEx( weapon02  , EM_SetModeType_HideName, false )--名稱	
		SetModeEX( weapon02  , EM_SetModeType_Gravity , false )--重力
		SetModeEx( weapon02  , EM_SetModeType_ShowRoleHead, false )--不秀頭像框
		SetModeEx( weapon02  , EM_SetModeType_Move, false )--移動
		SetModeEx( weapon02  , EM_SetModeType_Searchenemy, false )--索敵
		SetModeEx( weapon02  , EM_SetModeType_Fight , false )--可砍殺攻擊
		SetModeEx( weapon02  , EM_SetModeType_Strikback, false )--反擊
		AddToPartition( weapon02 , RoomID )	
		CastSpellLV( weapon02, weapon02, 494319 , 1 )
		SetPlot( weapon02, "touch" , "Cang_127_edward_shield" ,10 )
		AddBuff( weapon02, 506430, 0, -1)
		WriteRoleValue( weapon02 , EM_RoleValue_Livetime, 20 )
		WriteRoleValue(	weapon02 , EM_RoleValue_PID, OwnerID() )
		BeginPlot( weapon02, "Cang_127_edward_wpend" ,10 )		
	elseif SkillRND == 3 then
		weapon03 = CreateObjByFlag( 114951, 780586, 3, 1)
		SetModeEx( weapon03  , EM_SetModeType_HideName, false )--名稱	
		SetModeEX( weapon03  , EM_SetModeType_Gravity , false )--重力
		SetModeEx( weapon03  , EM_SetModeType_ShowRoleHead, false )--不秀頭像框
		SetModeEx( weapon03  , EM_SetModeType_Move, false )--移動
		SetModeEx( weapon03  , EM_SetModeType_Searchenemy, false )--索敵
		SetModeEx( weapon03  , EM_SetModeType_Fight , false )--可砍殺攻擊
		SetModeEx( weapon03  , EM_SetModeType_Strikback, false )--反擊
		AddToPartition( weapon03 , RoomID )		
		CastSpellLV( weapon03, weapon03, 494319 , 1 )
		SetPlot( weapon03, "touch" , "Cang_127_edward_shield" ,10 )
		AddBuff( weapon03, 506430, 0, -1)	
		WriteRoleValue( weapon03 , EM_RoleValue_Livetime, 20 )
		WriteRoleValue(	weapon03 , EM_RoleValue_PID, OwnerID() )
		BeginPlot( weapon03, "Cang_127_edward_wpend" ,10 )		
	elseif SkillRND == 4 then
		weapon04 = CreateObjByFlag( 114951, 780586, 4, 1)				
		SetModeEx( weapon04  , EM_SetModeType_HideName, false )--名稱	
		SetModeEX( weapon04  , EM_SetModeType_Gravity , false )--重力
		SetModeEx( weapon04  , EM_SetModeType_ShowRoleHead, false )--不秀頭像框
		SetModeEx( weapon04  , EM_SetModeType_Move, false )--移動
		SetModeEx( weapon04  , EM_SetModeType_Searchenemy, false )--索敵
		SetModeEx( weapon04  , EM_SetModeType_Fight , false )--可砍殺攻擊
		SetModeEx( weapon04  , EM_SetModeType_Strikback, false )--反擊
		AddToPartition( weapon04 , RoomID )	
		CastSpellLV( weapon04, weapon04, 494319 , 1 )
		SetPlot( weapon04, "touch" , "Cang_127_edward_shield" ,10 )
		AddBuff( weapon04, 506430, 0, -1)	
		WriteRoleValue( weapon04 , EM_RoleValue_Livetime, 20 )	
		WriteRoleValue(	weapon04 , EM_RoleValue_PID, OwnerID() )
		BeginPlot( weapon04, "Cang_127_edward_wpend" ,10 )	
	end
end

--------------------------------------------------------------------------------武器架給玩家buff
function Cang_127_edward_shield()		
	local RoomID = ReadRoleValue( TargetID() , EM_RoleValue_RoomID )	
	SetPlot( TargetID()  ,"touch", "" ,0 )
	CancelBuff( TargetID() , 506430 )
	AddBuff( OwnerID(), 506327, 0 , 20)
	SetModeEx( TargetID() , EM_SetModeType_Mark, false )--標記
	Hide( TargetID() )
	sleep(10)
	DelObj( TargetID() )
end

--------------------------------------------------------------------------------技能檢查用
function Cang_127_edward_shieldcancel()
	CancelBuff( TargetID() , 506327 )
end

--------------------------------------------------------------------------------幽冥之霧產生
function Cang_127_edward_summom()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local SpellCaster = LuaFunc_CreateObjByObj ( 103280, TargetID() )
	SetModeEx( SpellCaster  , EM_SetModeType_HideName, false )--名稱
	SetModeEX( SpellCaster  , EM_SetModeType_Gravity , false )--重力
	SetModeEx( SpellCaster  , EM_SetModeType_ShowRoleHead, false )--不秀頭像框
	SetModeEx( SpellCaster  , EM_SetModeType_Mark, false )--標記
	SetModeEx( SpellCaster  , EM_SetModeType_Move, false )--移動
	SetModeEx( SpellCaster  , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( SpellCaster  , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( SpellCaster  , EM_SetModeType_Strikback, false )--反擊	
	AddToPartition( SpellCaster , RoomID )	--加進舞台	

	WriteRoleValue( SpellCaster , EM_RoleValue_Livetime, 25 )--存在時間	
	BeginPlot( SpellCaster , "Cang_127_edward_summomskill" , 0)
end

function Cang_127_edward_summomskill()
	AddBuff( OwnerID() , 506428 , 1 , -1 )
	sleep(50)
	CancelBuff( OwnerID() , 506428 )
	AddBuff( OwnerID() , 506429 , 1 , -1 )
end

--------------------------------------------------------------------------------武器架額外刪除設定
function Cang_127_edward_wpend()

	local start = ReadRoleValue( OwnerID() ,EM_RoleValue_PID )--回傳值
	while true do
		sleep(10)
		reset = ReadRoleValue( start ,EM_RoleValue_Register9 )--重置回傳值
		Dead = ReadRoleValue( start ,EM_RoleValue_Register3 )--死亡回傳	
		if reset == 1 or dead == 1 then
			DelObj( OwnerID() )
		end
	end
end