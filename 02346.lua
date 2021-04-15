function Dy_Z19_BOSSN_AI()
local Time01 = 0 --普招計時器
local Time02 = 0 --標靶計時器
local Time03 = 0 --大絕AE計時器
local Time04 = 0 --刪除場上物件的計時器
local bluebox = {}
local redbox = {}
local yellowbox = {}
local dart = {}
local skill = {496861 , 496864 , 496865 } ------------飛刀傷害 近距離AE80 前方扇形傷害
local skillspeak = {0 , 0 , 0 , 0}
local skillLV = { 0 , 0 , 0 , 0 }
local skilluse = 0
local Luck
local Luck2
local BL
local PL
local RL
local Boss25 = 0 --25秒點盒子判定用
local CH1 = ReadRoleValue( OwnerID() , EM_RoleValue_PID )  --讀出控制器的ID
local roomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID ) --讀出Boss在哪一層
local dart_1 = ReadRoleValue( OwnerID() , EM_RoleValue_Register3 ) --讀出標靶透明球1
local dart_2 = ReadRoleValue( OwnerID() , EM_RoleValue_Register4 ) --讀出標靶透明球2
local collect = {dart_1 , dart_2}
local FightON = 0 --戰鬥開關
	while 1 do 
	sleep(10)
	local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID ) --讀正在攻擊的目標
		if  AttackTarget ~= 0  and ( CheckID( OwnerID() ) ) == true then	--如果目標人數>0，而且自己存在時，判定進入戰鬥
			FightON = 1 --表示正在戰鬥中
			Time01 = Time01 + 1
			if Boss25 ~= 0  then --如果Boss25判斷不等於0 則Time02 =26
				Time02 = 26
			elseif Boss25 == 0 then --如果Boss25判斷等於0 ，Time02繼續計算時間
				Time02 = Time02 + 1
			end
			Time03 = Time03 + 1
			
			--say (OwnerID(), "counter1 = "..Time01)
			--say (OwnerID(), "counter2 = "..Time02)
			--say (OwnerID(), "counter3 = "..Time03)
			WriteRoleValue( CH1, EM_RoleValue_Register2, 1) --回傳控制器說已經在戰鬥中了
		
				if Time03 == 40 then --不可躲的大絕
					ScriptMessage( OwnerID(), -1 , 2 , "[SC_105200_10] " , 2 )
					sleep(20)
					CastSpellLV( OwnerID() , OwnerID() , 496860 , 0 ) --施放大絕，傷害等級仍需要調整
					Time03 =0
					sleep(10)
				end
				
				if Time02 == 26 then --檢查王身上有無九宮格檢查
					if CheckBuff( OwnerID() ,  508612 ) == true then --如果檢查到王身上有此Buff 則什麼都不做
					
					elseif CheckBuff( OwnerID() ,  508612 ) == false then --如果沒有的話，執行以下事情
						if Boss25 == 1 then --施放藍色未點傷害
							while ReadRoleValue(OwnerID(),EM_RoleValue_SpellMagicID)~=0 do
							sleep(2)
							end
							CastSpellLV( OwnerID() , OwnerID(), 497518 , 0 )
							--CancelBuff( TargetID() ,  508607 ) ----刪除九宮格檢查
							
							Time02 = 0
							Boss25 = 0 --25秒點盒子判斷為0
							WriteRoleValue( CH1, EM_RoleValue_Register2, 4) --回傳戰鬥控制器說方形傷害該換了
							--刪除盒子
							delobj(bluebox)
							delobj(redbox)
							delobj(yellowbox)
							for i=1 , 2 do --刪除掉標靶
								delobj(dart[i])
							end

						elseif Boss25 == 2 then --施放紫色未點傷害
							while ReadRoleValue(OwnerID(),EM_RoleValue_SpellMagicID)~=0 do
							sleep(2)
							end
							CastSpellLV( OwnerID() , OwnerID() , 497520 , 0 )
							--CancelBuff( TargetID() ,  508607 ) ----刪除九宮格檢查
							
							Time02 = 0
							Boss25 = 0 --25秒點盒子判斷為0
							WriteRoleValue( CH1, EM_RoleValue_Register2, 4) --回傳戰鬥控制器說方形傷害該換了
							--刪除盒子
							delobj(bluebox)
							delobj(redbox)
							delobj(yellowbox)
							for i=1 , 2 do --刪除掉標靶
								delobj(dart[i])
							end		
		
						elseif Boss25 == 3 then --施放黃昏未點傷害
							while ReadRoleValue(OwnerID(),EM_RoleValue_SpellMagicID)~=0 do
							sleep(2)
							end
							CastSpellLV( OwnerID() , OwnerID() , 497519 , 0 )
							--CancelBuff( TargetID() ,  508607 ) ----刪除九宮格檢查
							
							Time02 = 0
							Boss25 = 0 --25秒點盒子判斷為0
							WriteRoleValue( CH1, EM_RoleValue_Register2, 4) --回傳戰鬥控制器說方形傷害該換了
							--刪除盒子
							delobj(bluebox)
							delobj(redbox)
							delobj(yellowbox)
							for i=1 , 2 do --刪除掉標靶
								delobj(dart[i])

							end	
						end
					end
				end

				if Time02 == 25 then --射鏢靶點盒子
					while ReadRoleValue(OwnerID(),EM_RoleValue_SpellMagicID)~=0 do
						sleep(2)
					end
					local boxflag = 780845
					local durtflag = 780696
						--種出2個標靶
						for i = 1 , 2 , 1 do
							dart[i] = CreateObjByFlag( 105202 , 780859 , i , 1 ) --780859 標靶旗標
							SetModeEx( dart[i] , EM_SetModeType_HideName, false )			--名稱
							SetModeEx( dart[i] , EM_SetModeType_ShowRoleHead, false )		--不秀頭像框
							SetModeEx( dart[i] , EM_SetModeType_Mark, true )				--標記
							SetModeEx( dart[i] , EM_SetModeType_Move , false )				--不移動
							SetModeEx( dart[i] , EM_SetModeType_Searchenemy , false )		--不索敵
							SetModeEx( dart[i] , EM_SetModeType_Fight , false )			--可砍殺攻擊
							SetModeEx( dart[i] , EM_SetModeType_Strikback, false )			--反擊
							SetModeEx( dart[i] , EM_SetModeType_NotShowHPMP , false )		--不show血條
							AddToPartition( dart[i] , roomID )
						end
						
					--飛鏢表演+喊話
					ScriptMessage( OwnerID(), -1 , 2 , "[SC_105200_02] " , 2 )
					sleep(10)
					SetModeEx( OwnerID() , EM_SetModeType_Fight, false) ---不可砍殺
					SetModeEx( OwnerID() , EM_SetModeType_Move, false) ---移動	
					CastSpellLV( OwnerID() , OwnerID() , 497015 , 0 )
					sleep(35)
					for i = 1 , 2 , 1 do
						sysCastSpellLV( OwnerID() , collect[i] , 497015 , 0 )
						--say(OwnerID() , "kuku")
					end
					sleep(10)
					SetModeEx( OwnerID() , EM_SetModeType_Fight, true) ---可砍殺
					SetModeEx( OwnerID() , EM_SetModeType_Move, true) ---移動	
					SetIdleMotion( OwnerID() ,  ruFUSION_ACTORSTATE_NORMAL)--------保持地下模式					

					local BLF
					BL = Rand(3)
						if BL == 1 then
							BLF = 1
						elseif BL == 2 then
							BLF = 2
						elseif BL == 0 or BL == 3 then
							BLF = 3
						end
						--say (OwnerID() , "BL = " ..BL)
						bluebox = CreateObjByFlag( 117261 , boxflag , BLF , 1 ) --780859 標靶旗標
						SetModeEx( bluebox , EM_SetModeType_HideName, false )			--名稱
						SetModeEx( bluebox , EM_SetModeType_ShowRoleHead, false )		--不秀頭像框
						SetModeEx( bluebox , EM_SetModeType_Mark, true )				--標記
						SetModeEx( bluebox , EM_SetModeType_Move , false )				--不移動
						SetModeEx( bluebox , EM_SetModeType_Searchenemy , false )		--不索敵
						SetModeEx( bluebox , EM_SetModeType_Fight , false )			--可砍殺攻擊
						SetModeEx( bluebox , EM_SetModeType_Strikback, false )			--反擊
						SetModeEx( bluebox , EM_SetModeType_NotShowHPMP , false )		--不show血條
						AddToPartition( bluebox , roomID )
						AddBuff ( bluebox , 509345, 0, -1 ) --ADD無敵的Buff 
						SetPlot( bluebox ,"touch","Dy_Z19_BOSSN_BLUE", 50 ) --塞入藍盒子觸碰劇情
					
					local PLF
					PL = Rand(3)
						if PL == 1 then
							PLF = 4
						elseif PL == 0 or PL == 2 then
							PLF = 5
						elseif PL == 3 then
							PLF = 6
						end
						--say (OwnerID() , "PL = " ..PL)
						redbox = CreateObjByFlag( 117262 , boxflag , PLF , 1 ) --780859 標靶旗標
						SetModeEx( redbox , EM_SetModeType_HideName, false )			--名稱
						SetModeEx( redbox , EM_SetModeType_ShowRoleHead, false )		--不秀頭像框
						SetModeEx( redbox , EM_SetModeType_Mark, true )				--標記
						SetModeEx( redbox , EM_SetModeType_Move , false )				--不移動
						SetModeEx( redbox , EM_SetModeType_Searchenemy , false )		--不索敵
						SetModeEx( redbox , EM_SetModeType_Fight , false )			--可砍殺攻擊
						SetModeEx( redbox , EM_SetModeType_Strikback, false )			--反擊
						SetModeEx( redbox , EM_SetModeType_NotShowHPMP , false )		--不show血條
						AddToPartition( redbox , roomID )
						AddBuff ( redbox , 509345, 0, -1 ) --ADD無敵的Buff 
						SetPlot( redbox ,"touch","Dy_Z19_BOSSN_RED", 50 ) --塞入紅盒子觸碰劇情
					
					local RLF					
					RL = Rand(3)
						if RL == 0 or RL == 1 then
							RLF = 7
						elseif RL == 2 then
							RLF = 8
						elseif RL == 3 then
							RLF = 9
						end
						--say (OwnerID() , "RL = " ..RL)
						yellowbox = CreateObjByFlag( 117263 , boxflag , RLF , 1 ) --780859 標靶旗標
						SetModeEx( yellowbox , EM_SetModeType_HideName, false )			--名稱
						SetModeEx( yellowbox , EM_SetModeType_ShowRoleHead, false )		--不秀頭像框
						SetModeEx( yellowbox , EM_SetModeType_Mark, true )				--標記
						SetModeEx( yellowbox , EM_SetModeType_Move , false )				--不移動
						SetModeEx( yellowbox , EM_SetModeType_Searchenemy , false )		--不索敵
						SetModeEx( yellowbox , EM_SetModeType_Fight , false )			--可砍殺攻擊
						SetModeEx( yellowbox , EM_SetModeType_Strikback, false )			--反擊
						SetModeEx( yellowbox , EM_SetModeType_NotShowHPMP , false )		--不show血條
						AddToPartition( yellowbox , roomID )
						AddBuff ( yellowbox , 509345, 0, -1 ) --ADD無敵的Buff 
						SetPlot( yellowbox ,"touch","Dy_Z19_BOSSN_YELLOW", 50 ) --塞入黃盒子觸碰劇情
					
					Luck2 = Rand(30)
					while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
					sleep(2)
					end
					if Luck2 >= 0 and Luck2 <= 5 then
						ScriptMessage( OwnerID(), -1 , 2 , "[SC_105200_03]" , 2 )
						CastSpellLV( OwnerID() , OwnerID() , 496867 , 0 ) --施放藍色檢查用Buff
						AddBuff ( OwnerID()  , 508612, 0, 8 )
						Boss25 = 1 --25秒點藍盒子判斷為1
						sleep(15)
					elseif Luck2 >5 and Luck2 <= 10 then
						ScriptMessage( OwnerID(), -1 , 2 , "[SC_105200_04]" , 2 )
						CastSpellLV( OwnerID() , OwnerID() , 496868 , 0 ) --施放紫色檢查用Buff
						AddBuff ( OwnerID()  , 508612, 0, 8 )
						Boss25 = 2 --25秒點紫盒子判斷為2
						sleep(15)
					elseif Luck2 >10 and Luck2 <=15 then
						ScriptMessage( OwnerID(), -1 , 2 , "[SC_105200_05]" , 2 )
						CastSpellLV( OwnerID() , OwnerID() , 496869 , 0 ) --施放黃昏檢查用Buff
						AddBuff ( OwnerID()  , 508612, 0, 8 )
						Boss25 = 3 --25秒點黃昏盒子判斷為3
						sleep(15)
					elseif Luck2 >15 and Luck2 <= 20 then
						ScriptMessage( OwnerID(), -1 , 2 , "[SC_105200_03]" , 2 )
						CastSpellLV( OwnerID() , OwnerID() , 496867 , 0 ) --施放藍色檢查用Buff
						AddBuff ( OwnerID()  , 508612, 0, 8 )
						Boss25 = 1 --25秒點藍盒子判斷為1
						sleep(15)
					elseif Luck2 >20 and Luck2 <= 25 then
						ScriptMessage( OwnerID(), -1 , 2 , "[SC_105200_04]" , 2 )
						CastSpellLV( OwnerID() , OwnerID() , 496868 , 0 ) --施放紫色檢查用Buff
						AddBuff ( OwnerID()  , 508612, 0, 8 )
						Boss25 = 2 --25秒點紫盒子判斷為2
						sleep(15)
					elseif Luck2 >25 and Luck2 <=30 then
						ScriptMessage( OwnerID(), -1 , 2 , "[SC_105200_05]" , 2 )
						CastSpellLV( OwnerID() , OwnerID() , 496869 , 0 ) --施放黃昏檢查用Buff
						AddBuff ( OwnerID()  , 508612, 0, 8 )
						Boss25 = 3 --25秒點黃昏盒子判斷為3
						sleep(15)
					end
					--say (OwnerID() , "Luck2 = " ..Luck2)

				end
				
				if Time01 == 7 then --施放普招
					Luck = Rand(100)
					--say ( OwnerID() , "Luck = "..Luck)
					while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
					sleep(2)
					end	
					if Luck >= 0 and Luck <50 then --施放隨機3人飛刀傷害
						local player = {}
						local choose_p = 0
						local pm = 0
						local bosstargrt = {}
						player = DW_HateRemain(0) --仇恨表找人   填0代表 不排除主坦
						choose_p = table.getn(player) --取出Player的數量
						--say (OwnerID() , "choose_p = "..choose_p )
						if choose_p > 3 then
							ScriptMessage( OwnerID(), -1 , 2 , "[SC_105200_06]" , 2 )
							sleep(10)
							for i = 1 , 3 , 1 do 
								local Lucky2 = Rand(table.getn(player))+1			--RAND到的數字	
								if ( player[Lucky2] ~= nil ) and ( ReadRoleValue( player[Lucky2] , EM_RoleValue_IsDead ) == 0 ) then
									SysCastSpellLv( OwnerID() , player[Lucky2] , 497516 , 0 )
								end
								table.remove( player , Lucky2 )
								sleep(1)
							end
						elseif choose_p <=3 then
							ScriptMessage( OwnerID(), -1 , 2 , "[SC_105200_06]" , 2 )
							sleep(10)
							while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
							sleep(2)
							end	
							for i = 1 , table.getn(player) , 1 do
								sysCastSpellLV( OwnerID() , player[i] , 497516 , 0  )
								--say(player[i] , "<=3")
							end
						end
					elseif Luck >50  and Luck <=75 then --施放自身AE80
						ScriptMessage( OwnerID(), -1 , 2 , "[SC_105200_12]" , 2 )
						while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
						sleep(2)
						end	
						CastSpellLV( OwnerID() , OwnerID() , 496864 , 20 )
						sleep(30)
						--say( OwnerID(), "AE80")
					elseif Luck > 75 and Luck <=100 then --施放前方扇形傷害
						while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
						sleep(2)
						end	
						CastSpellLV( OwnerID() , OwnerID() , 496865 , 35 )
						--say( OwnerID(), "Fan60")
					end
				Time01 = 0
				end
		else
			if FightON == 1 and  AttackTarget == 0 then --如果在戰鬥中而沒有任何目標的話
				local Playbye
				Playbye = CreateObjByFlag( 105283 , 780860 , 3, 1 ) --生出刪除東西的旗標
			
				SetModeEx( Playbye , EM_SetModeType_Show, false) ----秀出
				SetModeEx( Playbye , EM_SetModeType_Mark, false) ----標記
				SetModeEx( Playbye , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( Playbye , EM_SetModeType_Move, false) ---移動	
				SetModeEx( Playbye , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( Playbye , EM_SetModeType_SearchenemyIgnore, true) ---物件不會被搜尋
				SetModeEx( Playbye , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
				SetModeEx( Playbye , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
				SetModeEx( Playbye , EM_SetModeType_Searchenemy, false)  ---索敵
				SetModeEx( Playbye   , EM_SetModeType_Obstruct, false )--阻擋
				AddToPartition( Playbye , roomID )
				BeginPlot( Playbye, "Dy_Z19_BOSSN_DEAD_2", 10)
				Time01 = 0
				Time02 = 0
				Time03 = 0
				WriteRoleValue( CH1, EM_RoleValue_Register2, 2) --回傳控制器說玩家滅團了
			end	
		end
	end
end

function Dy_Z19_BOSSN_DEAD_2()
	local Playbye_2 = {}
	Playbye_2 = SearchRangeNPC ( OwnerID() , 1000 )
	for i=0,table.getn(Playbye_2) do
		if ReadRoleValue( Playbye_2[i] , EM_RoleValue_OrgID )==105202 or 
			ReadRoleValue( Playbye_2[i] , EM_RoleValue_OrgID )==105203 or 
			ReadRoleValue( Playbye_2[i] , EM_RoleValue_OrgID )==117261 or 
			ReadRoleValue( Playbye_2[i] , EM_RoleValue_OrgID )==117262 or 
			ReadRoleValue( Playbye_2[i] , EM_RoleValue_OrgID )==117263 or
			ReadRoleValue( Playbye_2[i] , EM_RoleValue_OrgID )==103044 or
			ReadRoleValue( Playbye_2[i] , EM_RoleValue_OrgID )==105286 then
			delobj(Playbye_2[i])
		end
		delobj(OwnerID())
	end
end

function Dy_Z19_BOSSN_DEAD()
	local CH1 = ReadRoleValue( OwnerID() , EM_RoleValue_PID )  --讀出控制器的ID
	local roomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID )
	local Playbye
	ScriptMessage( CH1, -1 , 2 , "[SC_105200_01] " , 2 )
	Playbye = CreateObjByFlag( 105283 , 780860 , 3, 1 ) --生出刪除東西的旗標
	
	SetModeEx( Playbye , EM_SetModeType_Show, false) ----秀出
	SetModeEx( Playbye , EM_SetModeType_Mark, false) ----標記
	SetModeEx( Playbye , EM_SetModeType_Strikback, false) ---反擊
	SetModeEx( Playbye , EM_SetModeType_Move, false) ---移動	
	SetModeEx( Playbye , EM_SetModeType_Fight, false) ---可砍殺
	SetModeEx( Playbye , EM_SetModeType_SearchenemyIgnore, true) ---物件不會被搜尋
	SetModeEx( Playbye , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
	SetModeEx( Playbye , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
	SetModeEx( Playbye , EM_SetModeType_Searchenemy, false)  ---索敵
	SetModeEx( Playbye   , EM_SetModeType_Obstruct, false )--阻擋
	AddToPartition( Playbye , roomID )
	BeginPlot( Playbye, "Dy_Z19_BOSSN_DEAD_2", 10)
	WriteRoleValue( CH1, EM_RoleValue_Register2, 3)
end
function Dy_Z19_BOSSN_BLUE() --藍盒子的碰撞劇情 
	if CheckBuff( OwnerID() , 508608) == true then ---有恐懼Bff時什麼都不做
	elseif CheckBuff( OwnerID() , 508608) == false then --沒有時在執行以下檢查
		if CheckBuff( OwnerID() , 508604) == true then --如果檢查到藍色檢查Buff
			sysCastSpellLV( TargetID() , OwnerID() , 496859 , 0 ) --施放-30%HP
			CancelBuff( OwnerID() ,  508604 ) --刪除藍色檢查Buff
			CancelBuff( OwnerID() ,  508607 ) ----刪除九宮格檢查
			AddBuff ( OwnerID() , 509321, 0, 3 ) --加入逃過一劫的Buff 3秒
		elseif CheckBuff( OwnerID() , 508604) == false then
			if CheckBuff( OwnerID() , 509321) == true then --有逃過一劫Buff就啥都不做
			
			elseif CheckBuff( OwnerID() , 509321) == false then
				sysCastSpellLV( TargetID() , OwnerID() , 497517 , 0 ) --施放點錯的法術 -80%HP
			end
		end
	end
end

function Dy_Z19_BOSSN_RED() --紫盒子的碰撞劇情
	if CheckBuff( OwnerID() , 508608) == true then ---有恐懼Bff時什麼都不做
	elseif CheckBuff( OwnerID() , 508608) == false then --沒有時在執行以下檢查
		if CheckBuff( OwnerID() , 508605) == true then --如果檢查到紫色檢查Buff
			sysCastSpellLV(TargetID(), OwnerID() , 496859 , 0 ) --施放-30%HP
			CancelBuff( OwnerID() ,  508605 ) --刪除紫色檢查Buff
			CancelBuff( OwnerID() ,  508607 ) ----刪除九宮格檢查
			AddBuff ( OwnerID() , 509321, 0, 3 ) --加入逃過一劫的Buff 3秒
		elseif CheckBuff( OwnerID() , 508605) == false then
			if CheckBuff( OwnerID() , 509321) == true then --有逃過一劫Buff就啥都不做
			
			elseif CheckBuff( OwnerID() , 509321) == false then
				sysCastSpellLV( TargetID() , OwnerID() , 497517 , 0 ) --施放點錯的法術 -80%HP
			end
		end
	end
end

function Dy_Z19_BOSSN_YELLOW() --黃昏盒子的碰撞劇情
	if CheckBuff( OwnerID() , 508608) == true then ---有恐懼Bff時什麼都不做
	elseif CheckBuff( OwnerID() , 508608) == false then --沒有時在執行以下檢查
		if CheckBuff( OwnerID() , 508606) == true then --如果檢查到黃昏檢查Buff
			sysCastSpellLV( OwnerID() , OwnerID() , 496859 , 0 ) --施放-30%HP
			CancelBuff( OwnerID() ,  508606 ) --刪除黃昏檢查Buff
			CancelBuff( OwnerID() ,  508607 ) --刪除九宮格檢查
			AddBuff ( OwnerID() , 509321, 0, 3 ) --加入逃過一劫的Buff 3秒
		elseif CheckBuff( OwnerID() , 508606) == false then
			if CheckBuff( OwnerID() , 509321) == true then --有逃過一劫Buff就啥都不做
			
			elseif CheckBuff( OwnerID() , 509321) == false then
				sysCastSpellLV( TargetID() , OwnerID() , 497517 , 0 ) --施放點錯的法術 -80%HP
			end
		end
	end
end
--組合A組
function Dy_Z19_BOSSN_DQ1_B_A() --走到藍色方形刪除紫與黃昏Debuff
	if CheckBuff( TargetID() ,  509509 ) == true then
		CancelBuff( TargetID() ,  509509 ) --刪除藍色B-B
	else
	
	end
	if CheckBuff( TargetID() ,  509511 ) == true then
		CancelBuff( TargetID() ,  509511  ) --刪除藍色B-C
		CancelBuff( TargetID() ,  509512  ) --刪除藍色B-C
	else
	
	end
	if CheckBuff( TargetID() ,  509499 ) == true then
		CancelBuff( TargetID() ,  509499 ) --刪除紫色P-A
	else
	
	end
	if CheckBuff( TargetID() ,  509497 ) == true then
		CancelBuff( TargetID() ,  509497 ) --刪除紫色P-B
	else
	
	end
	if CheckBuff( TargetID() ,  509501 ) == true then
		CancelBuff( TargetID() ,  509501 ) --刪除紫色P-C
		CancelBuff( TargetID() ,  509502 ) --刪除紫色P-C
	else
	
	end
	if CheckBuff( TargetID() ,  509492 ) == true then
		CancelBuff( TargetID() ,  509492 ) --刪除黃昏R-A
	else
	
	end
	if CheckBuff( TargetID() ,  509490 ) == true then
		CancelBuff( TargetID() ,  509490 ) --刪除黃昏R-B
	else
	
	end
	if CheckBuff( TargetID() ,  509487 ) == true then
		CancelBuff( TargetID() ,  509487 ) --刪除黃昏R-C
		CancelBuff( TargetID() ,  509488 )
	else
	
	end

end
function Dy_Z19_BOSSN_DQ1_P_A() --走到紫色方形刪除藍與黃昏Debuff
	if CheckBuff( TargetID() ,  509507 ) == true then
		CancelBuff( TargetID() ,  509507 ) --刪除藍色B-A
	else
	
	end
	if CheckBuff( TargetID() ,  509509 ) == true then
		CancelBuff( TargetID() ,  509509 ) --刪除藍色B-B
	else
	
	end
	if CheckBuff( TargetID() ,  509511 ) == true then
		CancelBuff( TargetID() ,  509511  ) --刪除藍色B-C
		CancelBuff( TargetID() ,  509512  ) --刪除藍色B-C
	else
	
	end
	if CheckBuff( TargetID() ,  509497 ) == true then
		CancelBuff( TargetID() ,  509497 ) --刪除紫色P-B
	else
	
	end
	if CheckBuff( TargetID() ,  509501 ) == true then
		CancelBuff( TargetID() ,  509501 ) --刪除紫色P-C
		CancelBuff( TargetID() ,  509502 ) --刪除紫色P-C
	else
	
	end
	if CheckBuff( TargetID() ,  509492 ) == true then
		CancelBuff( TargetID() ,  509492 ) --刪除黃昏R-A
	else
	
	end
	if CheckBuff( TargetID() ,  509490 ) == true then
		CancelBuff( TargetID() ,  509490 ) --刪除黃昏R-B
	else
	
	end
	if CheckBuff( TargetID() ,  509487 ) == true then
		CancelBuff( TargetID() ,  509487 ) --刪除黃昏R-C
		CancelBuff( TargetID() ,  509488 )
	else
	
	end

end
function Dy_Z19_BOSSN_DQ1_R_A() --走到黃昏方形刪除紫與藍Debuff
	if CheckBuff( TargetID() ,  509507 ) == true then
		CancelBuff( TargetID() ,  509507 ) --刪除藍色B-A
	else
	
	end
	if CheckBuff( TargetID() ,  509509 ) == true then
		CancelBuff( TargetID() ,  509509 ) --刪除藍色B-B
	else
	
	end
	if CheckBuff( TargetID() ,  509511 ) == true then
		CancelBuff( TargetID() ,  509511  ) --刪除藍色B-C
		CancelBuff( TargetID() ,  509512  ) --刪除藍色B-C
	else
	
	end
	if CheckBuff( TargetID() ,  509499 ) == true then
		CancelBuff( TargetID() ,  509499 ) --刪除紫色P-A
	else
	
	end
	if CheckBuff( TargetID() ,  509497 ) == true then
		CancelBuff( TargetID() ,  509497 ) --刪除紫色P-B
	else
	
	end
	if CheckBuff( TargetID() ,  509501 ) == true then
		CancelBuff( TargetID() ,  509501 ) --刪除紫色P-C
		CancelBuff( TargetID() ,  509502 ) --刪除紫色P-C
	else
	
	end
	if CheckBuff( TargetID() ,  509490 ) == true then
		CancelBuff( TargetID() ,  509490 ) --刪除黃昏R-B
	else
	
	end
	if CheckBuff( TargetID() ,  509487 ) == true then
		CancelBuff( TargetID() ,  509487 ) --刪除黃昏R-C
		CancelBuff( TargetID() ,  509488 )
	else
	
	end

end

--組合B組
function Dy_Z19_BOSSN_DQ1_B_B() --走到藍色方形刪除紫與黃昏Debuff
	if CheckBuff( TargetID() ,  509507 ) == true then
		CancelBuff( TargetID() ,  509507 ) --刪除藍色B-A
	else
	
	end
	if CheckBuff( TargetID() ,  509511 ) == true then
		CancelBuff( TargetID() ,  509511  ) --刪除藍色B-C
		CancelBuff( TargetID() ,  509512  ) --刪除藍色B-C
	else
	
	end
	if CheckBuff( TargetID() ,  509499 ) == true then
		CancelBuff( TargetID() ,  509499 ) --刪除紫色P-A
	else
	
	end
	if CheckBuff( TargetID() ,  509497 ) == true then
		CancelBuff( TargetID() ,  509497 ) --刪除紫色P-B
	else
	
	end
	if CheckBuff( TargetID() ,  509501 ) == true then
		CancelBuff( TargetID() ,  509501 ) --刪除紫色P-C
		CancelBuff( TargetID() ,  509502 ) --刪除紫色P-C
	else
	
	end
	if CheckBuff( TargetID() ,  509492 ) == true then
		CancelBuff( TargetID() ,  509492 ) --刪除黃昏R-A
	else
	
	end
	if CheckBuff( TargetID() ,  509490 ) == true then
		CancelBuff( TargetID() ,  509490 ) --刪除黃昏R-B
	else
	
	end
	if CheckBuff( TargetID() ,  509487 ) == true then
		CancelBuff( TargetID() ,  509487 ) --刪除黃昏R-C
		CancelBuff( TargetID() ,  509488 )
	else
	
	end

end
function Dy_Z19_BOSSN_DQ1_P_B() --走到紫色方形刪除藍與黃昏Debuff
	if CheckBuff( TargetID() ,  509507 ) == true then
		CancelBuff( TargetID() ,  509507 ) --刪除藍色B-A
	else
	
	end
	if CheckBuff( TargetID() ,  509509 ) == true then
		CancelBuff( TargetID() ,  509509 ) --刪除藍色B-B
	else
	
	end
	if CheckBuff( TargetID() ,  509511 ) == true then
		CancelBuff( TargetID() ,  509511  ) --刪除藍色B-C
		CancelBuff( TargetID() ,  509512  ) --刪除藍色B-C
	else
	
	end
	if CheckBuff( TargetID() ,  509499 ) == true then
		CancelBuff( TargetID() ,  509499 ) --刪除紫色P-A
	else
	
	end
	if CheckBuff( TargetID() ,  509501 ) == true then
		CancelBuff( TargetID() ,  509501 ) --刪除紫色P-C
		CancelBuff( TargetID() ,  509502 ) --刪除紫色P-C
	else
	
	end
	if CheckBuff( TargetID() ,  509492 ) == true then
		CancelBuff( TargetID() ,  509492 ) --刪除黃昏R-A
	else
	
	end
	if CheckBuff( TargetID() ,  509490 ) == true then
		CancelBuff( TargetID() ,  509490 ) --刪除黃昏R-B
	else
	
	end
	if CheckBuff( TargetID() ,  509487 ) == true then
		CancelBuff( TargetID() ,  509487 ) --刪除黃昏R-C
		CancelBuff( TargetID() ,  509488 )
	else
	
	end

end
function Dy_Z19_BOSSN_DQ1_R_B() --走到黃昏方形刪除紫與藍Debuff
	if CheckBuff( TargetID() ,  509507 ) == true then
		CancelBuff( TargetID() ,  509507 ) --刪除藍色B-A
	else
	
	end
	if CheckBuff( TargetID() ,  509509 ) == true then
		CancelBuff( TargetID() ,  509509 ) --刪除藍色B-B
	else
	
	end
	if CheckBuff( TargetID() ,  509511 ) == true then
		CancelBuff( TargetID() ,  509511  ) --刪除藍色B-C
		CancelBuff( TargetID() ,  509512  ) --刪除藍色B-C
	else
	
	end
	if CheckBuff( TargetID() ,  509499 ) == true then
		CancelBuff( TargetID() ,  509499 ) --刪除紫色P-A
	else
	
	end
	if CheckBuff( TargetID() ,  509497 ) == true then
		CancelBuff( TargetID() ,  509497 ) --刪除紫色P-B
	else
	
	end
	if CheckBuff( TargetID() ,  509501 ) == true then
		CancelBuff( TargetID() ,  509501 ) --刪除紫色P-C
		CancelBuff( TargetID() ,  509502 ) --刪除紫色P-C
	else
	
	end
	if CheckBuff( TargetID() ,  509492 ) == true then
		CancelBuff( TargetID() ,  509492 ) --刪除黃昏R-A
	else
	
	end
	if CheckBuff( TargetID() ,  509487 ) == true then
		CancelBuff( TargetID() ,  509487 ) --刪除黃昏R-C
		CancelBuff( TargetID() ,  509488 )
	else
	
	end

end

--組合C組
function Dy_Z19_BOSSN_DQ1_B_C() --走到藍色方形刪除紫與黃昏Debuff
	if CheckBuff( TargetID() ,  509507 ) == true then
		CancelBuff( TargetID() ,  509507 ) --刪除藍色B-A
	else
	
	end
	if CheckBuff( TargetID() ,  509509 ) == true then
		CancelBuff( TargetID() ,  509509 ) --刪除藍色B-B
	else
	
	end
	if CheckBuff( TargetID() ,  509499 ) == true then
		CancelBuff( TargetID() ,  509499 ) --刪除紫色P-A
	else
	
	end
	if CheckBuff( TargetID() ,  509497 ) == true then
		CancelBuff( TargetID() ,  509497 ) --刪除紫色P-B
	else
	
	end
	if CheckBuff( TargetID() ,  509501 ) == true then
		CancelBuff( TargetID() ,  509501 ) --刪除紫色P-C
		CancelBuff( TargetID() ,  509502 ) --刪除紫色P-C
	else
	
	end
	if CheckBuff( TargetID() ,  509492 ) == true then
		CancelBuff( TargetID() ,  509492 ) --刪除黃昏R-A
	else
	
	end
	if CheckBuff( TargetID() ,  509490 ) == true then
		CancelBuff( TargetID() ,  509490 ) --刪除黃昏R-B
	else
	
	end
	if CheckBuff( TargetID() ,  509487 ) == true then
		CancelBuff( TargetID() ,  509487 ) --刪除黃昏R-C
		CancelBuff( TargetID() ,  509488 )
	else
	
	end

end
function Dy_Z19_BOSSN_DQ1_P_C() --走到紫色方形刪除藍與黃昏Debuff
	if CheckBuff( TargetID() ,  509507 ) == true then
		CancelBuff( TargetID() ,  509507 ) --刪除藍色B-A
	else
	
	end
	if CheckBuff( TargetID() ,  509509 ) == true then
		CancelBuff( TargetID() ,  509509 ) --刪除藍色B-B
	else
	
	end
	if CheckBuff( TargetID() ,  509511 ) == true then
		CancelBuff( TargetID() ,  509511  ) --刪除藍色B-C
		CancelBuff( TargetID() ,  509512  ) --刪除藍色B-C
	else
	
	end
	if CheckBuff( TargetID() ,  509499 ) == true then
		CancelBuff( TargetID() ,  509499 ) --刪除紫色P-A
	else
	
	end
	if CheckBuff( TargetID() ,  509497 ) == true then
		CancelBuff( TargetID() ,  509497 ) --刪除紫色P-B
	else
	
	end
	if CheckBuff( TargetID() ,  509492 ) == true then
		CancelBuff( TargetID() ,  509492 ) --刪除黃昏R-A
	else
	
	end
	if CheckBuff( TargetID() ,  509490 ) == true then
		CancelBuff( TargetID() ,  509490 ) --刪除黃昏R-B
	else
	
	end
	if CheckBuff( TargetID() ,  509487 ) == true then
		CancelBuff( TargetID() ,  509487 ) --刪除黃昏R-C
		CancelBuff( TargetID() ,  509488 )
	else
	
	end

end

function Dy_Z19_BOSSN_DQ1_R_C() --走到黃昏方形刪除紫與藍Debuff
	if CheckBuff( TargetID() ,  509507 ) == true then
		CancelBuff( TargetID() ,  509507 ) --刪除藍色B-A
	else
	
	end
	if CheckBuff( TargetID() ,  509509 ) == true then
		CancelBuff( TargetID() ,  509509 ) --刪除藍色B-B
	else
	
	end
	if CheckBuff( TargetID() ,  509511 ) == true then
		CancelBuff( TargetID() ,  509511  ) --刪除藍色B-C
		CancelBuff( TargetID() ,  509512  ) --刪除藍色B-C
	else
	
	end
	if CheckBuff( TargetID() ,  509499 ) == true then
		CancelBuff( TargetID() ,  509499 ) --刪除紫色P-A
	else
	
	end
	if CheckBuff( TargetID() ,  509497 ) == true then
		CancelBuff( TargetID() ,  509497 ) --刪除紫色P-B
	else
	
	end
	if CheckBuff( TargetID() ,  509501 ) == true then
		CancelBuff( TargetID() ,  509501 ) --刪除紫色P-C
		CancelBuff( TargetID() ,  509502 ) --刪除紫色P-C
	else
	
	end
	if CheckBuff( TargetID() ,  509492 ) == true then
		CancelBuff( TargetID() ,  509492 ) --刪除黃昏R-A
	else
	
	end
	if CheckBuff( TargetID() ,  509490 ) == true then
		CancelBuff( TargetID() ,  509490 ) --刪除黃昏R-B
	else
	
	end
end


function Dy_Z19_BOSSN_DQ1_Check() --檢查屍體與GMssssssssssss
	if ReadRoleValue( TargetID(), EM_RoleValue_VOC) ~= 0 then --不是GM
		return true
	elseif ReadRoleValue( TargetID(), EM_RoleValue_VOC) == 0 then
		return false
	end
end
function Dy_Z19_BOSSN_25Check() --施放-80%HP的檢查
	if CheckBuff( TargetID() ,  508607 ) == true then
		return true
	elseif CheckBuff( TargetID() ,  508607 ) == false	then
		return false
	end
end
function Dy_Z19_BOSSN_25DEL() ----刪除九宮格檢查
	CancelBuff( TargetID() ,  508607 ) ----刪除九宮格檢查
	--say( TargetID() , "123")
end