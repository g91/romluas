----------------------------------------------------------Z18古薩拉AI
function lua_Dy_Z18BossAI_1()
	while 1 do 
		sleep(10)
		local counter1 = 0 ----------一般技能計時器
		local counter2 = 0 ----------遠距離直線防止器
		local skill = {496194 , 496195 , 496196 , 496197 } ------------單體中傷害、隨機挑人直接傷害、自身圓形AE、單體瀕死傷害
		local skillspeak = { 0 , "[SC_104458_1]" , 0 , "[SC_104458_2]"} 
		local skillLV = { 4 , 5 , 2 , 0 }
		local skilluse = 0
		local Luck = Rand( 100 ) --招式亂數
		local CH1 = ReadRoleValue( OwnerID() , EM_RoleValue_PID )  --讀出控制器的ID
		local CH1T = 0 --- 階段
		local roomid = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) --讀出物件在哪一層
		local Table_mob = {} ---小怪儲存器
		local CombatBegin = 0 --BOSS的戰鬥開關變數
		local CH1T_2_Start = 0 --進入第二階段的傳送劇情
		local Mob_Chose = 0 --第二階段時，被選到的小狗頭人
		while 1 do 
			sleep(10)
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID ) --讀正在攻擊的目標
			if  ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then	
				WriteRoleValue( CH1, EM_RoleValue_Register9, 1)
				CH1T = ReadRoleValue( OwnerID() , EM_RoleValue_Register1 ) --讀出第一個暫存器的值
				counter1 = counter1 + 1
				counter2 = counter2 + 1
				--say (OwnerID(), "counter1 = "..counter1)
				--say (OwnerID(), "counter2 = "..counter2)
				CombatBegin = 1 --表示正在戰鬥中
				if CH1T == 1 then -----Boss第一階段一般招式
					if counter1 >= 6 then
						Luck = Rand( 100 ) --招式亂數
						if (Luck >=0 and Luck <40) then 
							skilluse = 1 --單體中傷害
							BOSSTarget = AttackTarget
							CastSpellLV( OwnerID() , BOSSTarget , skill[skilluse] , skillLV[skilluse] )
						elseif (Luck >=40 and Luck <70) then
							skilluse = 3 --自身圓形AE
							BOSSTarget = OwnerID()
							CastSpellLV( OwnerID() , BOSSTarget , skill[skilluse] , skillLV[skilluse] )
						elseif (Luck >=70 and Luck <=100) and counter2 < 45 then
							skilluse = 2 --隨機挑人直接傷害
							BOSSTarget = HateTargetID() --可隨機抓仇恨列表中的任一人
							ScriptMessage( OwnerID() , -1 , 2 , skillspeak[skilluse] , 1 )
							sleep(10)
							CastSpellLV( OwnerID() , BOSSTarget , skill[skilluse] , skillLV[skilluse] )
						elseif counter2 >=45 then
							counter2 = 0
						end
						counter1 = 0
					end
					CH1T_2_Start = 0
				
				elseif CH1T == 2 then
					if CH1T_2_Start == 0 then
						Mob_Chose = ReadRoleValue( OwnerID() , EM_RoleValue_Register2 )
						sleep(15)
						ScriptMessage( OwnerID() , -1 , 2 , "[SC_104458_3]" , 1 ) -- 記得填字串
						CastSpellLV( OwnerID() , OwnerID() , 496199 , 0 )
						-- Boss 一個施法動作，唱法約 2 秒
						sleep(20)
						-- Addbuff 至 Mob_Chose
						---以下為傳送，相同於移形換影，但是不轉面向---
						local Obj = Role:new( OwnerID() ) 
						local TargetObj = Role:new( Mob_Chose ) ---抓被指到的小狗頭人的座標
						local Dir --面向
						local Dx 
						local Dz 
						SetPos( OwnerID() , TargetObj:X() , TargetObj:Y() , TargetObj:Z() , TargetObj:Dir() ) -- (將(OOO ,傳到 XXX的, X , Y , Z  , Dir )位置 XYZ DIR 可填數字
						sleep(10)
						--CastSpellLV( OwnerID() , OwnerID() , 496200 , 0 )
						SysCastSpellLv(OwnerID(),OwnerID(),496200 , 0 )
						--say(OwnerID(),"496200")
						---------
						Killid( OwnerID() , Mob_Chose )
						--say(OwnerID(),"SetPos ok !!!")
						CH1T_2_Start = 1
					end	
					--AE劇情
					if counter1 >= 6 then -----Boss第二階段一般招式
						Luck = Rand( 100 ) --招式亂數
						if (Luck >=0 and Luck <40) then 
							skilluse = 4 --單體瀕死傷害
							BOSSTarget = AttackTarget
							ScriptMessage( OwnerID() , -1 , 2 , skillspeak[skilluse] , 1 )
							sleep(20)
							CastSpellLV( OwnerID() , BOSSTarget  , skill[skilluse] , skillLV[skilluse] )
						elseif (Luck >=40 and Luck <55) then
							skilluse = 3 --自身圓形AE
							BOSSTarget = OwnerID()
							CastSpellLV( OwnerID() , BOSSTarget, skill[skilluse] , skillLV[skilluse] )
						elseif (Luck >=55 and Luck <75) and counter2 < 45 then
							skilluse = 2 --隨機挑人直接傷害
							BOSSTarget = HateTargetID() --可隨機抓仇恨列表中的任一人
							ScriptMessage( OwnerID() , -1 , 2 , skillspeak[skilluse] , 1 )
							sleep(10)
							CastSpellLV( OwnerID() , BOSSTarget , skill[skilluse] , skillLV[skilluse] )
						elseif (Luck >=75 and Luck <=100) then
							skilluse = 1 --單體中傷害
							BOSSTarget = AttackTarget
							CastSpellLV( OwnerID() , BOSSTarget , skill[skilluse] , skillLV[skilluse] )
						elseif counter2 >=45 then
							counter2 = 0
						end
						counter1 = 0
					end
				end
				
			else --離開戰鬥
				if CombatBegin == 1 then
					WriteRoleValue( CH1, EM_RoleValue_Register9, 2)
				end
				
			end		
		end			
	end			
end

----------------------------------------------------------Z18古薩拉控制器
-----104460 補獸夾
-----104512 古薩拉控制器
-----104458 古薩拉
-----780696 小橘旗標，Boss & 陷阱
-----780385 小狗頭人旗標
function lua_Dy_Z18BossAIC_1()----控制器
---生出Boss房的後門--需要注意是否有阻擋--需要注意生出來的門是否和場景有貼齊---
		local roomid = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) --讀出物件在哪一層
		local Door = CreateObjByFlag( 104532 , 780386 , 2 , 1 ) ---Boss房的後門 --只種一次，BOSS死亡才需要消除
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
		WriteRoleValue( OwnerID(), EM_RoleValue_Register9, 0)
--↑↑↑↑↑↑↑↑↑↑---------------------------------
	while 1 do
		sleep(10)
		local roomid = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) --讀出物件在哪一層
		local Boss = CreateObjByFlag( 104458 , 780696 , 1 , 1 ) ---生出Boss (BOSS編號  ,旗標編號 第N隻旗標 生出幾個怪)
		SetPlot( Boss,"dead","lua_Dy_Z18BossAI_1_dead",10 )----Boss 死亡劇情
		WriteRoleValue( Boss, EM_RoleValue_PID, OwnerID())
		WriteRoleValue( OwnerID(), EM_RoleValue_Register1, Boss)
		AddToPartition( Boss,roomid )
		BeginPlot( Boss, "lua_Dy_Z18BossAI_1", 10) ---Boss的戰鬥Function (  BOSS BOSS的LUA_AI  秒\每10=1秒)
		local CombatBegin_Boss = 0
		local counter1 = 0
		local counter2 = 0 ---Boss狂暴用計時
		local Trap_Table = {}
		local Num_Rand = 0
		local Rand_Trap_Table = {}
		local Num_Rand_Trap_Table = 0
		local Trap_1 = 0
		local Trap_2 = 0
		local Trap_3 = 0
		local Trap_Num = 0
		local Mob_Flag = 0
		local All_Mob_Table = {} ---將所有的狗頭人存入此Table中
		local Mob_Num = 0
		local Mob_Chose = 0 ---被選擇到的小狗頭人
		local First_Door = 0 ---第一次生前門判斷用
		local First_Trap = 0 ---第一次生補獸夾判斷用
		local GameOver = 0 ---狂爆判斷用
		while 1 do
			sleep(10)
			CombatBegin_Boss = ReadRoleValue( OwnerID() , EM_RoleValue_Register9 )	
			--counter1 = counter1 + 1
			--say (OwnerID(), "counter1 = "..counter1)
			if  CombatBegin_Boss == 1 then	
				counter1 = counter1 + 1
				counter2 = counter2 + 1
				--say (OwnerID(), "counter1 = "..counter1)
				
				if GameOver == 0 and counter2 >= 480 then
					AddBuff(Boss , 507663 , 0 , -1) ---Boss 進入狂暴
				
				elseif counter1 == 1 then ---判斷為第1階段 持續45秒
				
---生出Boss房的前門--需要注意是否有阻擋--需要注意生出來的門是否和場景有貼齊---
					if First_Door == 0 then --加入這個判斷值的原因，是為了不要每一次到了第一階段，都會生一次前門
						local Door = CreateObjByFlag( 104532 , 780386 , 1 , 1 ) ---Boss房的前門
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
						WriteRoleValue( OwnerID() , EM_RoleValue_Register3 , Door)--將此物件的GID儲存至控制器的Register3中，以方便日後刪除用
						First_Door = 1
					end
--↑↑↑↑↑↑↑↑↑↑---------------------------------		
					Rand_Mob_Table = {}
					Rand_Trap_Table = {}
					--say (OwnerID(), "SP_1 !!!")
					WriteRoleValue( Boss, EM_RoleValue_Register1, 1)
					local Num = 0
---在以下迴圈中，是為了事先設定三個陷阱要在哪幾個旗標位置生出------	
					while true do
						Num_Rand = Rand(15)+1 ---從1~15去隨機找一個，但是Rand是從「0」開始數，所以記得要「+1」
						Num_Rand_Trap_Table = table.getn(Rand_Trap_Table)
						if Num_Rand_Trap_Table == 3 then
							Trap_1 = 0
							Trap_2 = 0
							Trap_3 = 0
							break
						elseif Trap_1 == 0 and Num_Rand ~= 1  then  ----「 ~=  這是不等於，的意思」
							Trap_1 = Num_Rand
							table.insert( Rand_Trap_Table , Trap_1 )
						elseif Trap_2 == 0 and Num_Rand ~= 1 and Num_Rand ~= Trap_1 then
							Trap_2 = Num_Rand
							table.insert( Rand_Trap_Table , Trap_2 )
						elseif Trap_3 == 0 and Num_Rand ~= 1 and Num_Rand ~= Trap_1 and Num_Rand ~= Trap_2 then
							Trap_3 = Num_Rand
							table.insert( Rand_Trap_Table , Trap_3 )
						end
					end
					if First_Trap == 0 then ---目的在於讓Boss第一次開戰時，需要5秒後，才會生出捕獸夾
						sleep(50)
						First_Trap = 1
					end
--↑↑↑↑↑↑↑↑↑↑---------------------------------		
					for i = 1 , 3 , 1 do
						local BOSSTrap = CreateObjByFlag( 104460 , 780696 , Rand_Trap_Table[i] , 1 ) 
						SetModeEx( BOSSTrap , EM_SetModeType_Move , false )			------不移動
						SetModeEx( BOSSTrap , EM_SetModeType_Strikback , false )	------不反擊
						SetModeEx( BOSSTrap , EM_SetModeType_Fight , false )		------不可砍殺
						SetModeEx( BOSSTrap , EM_SetModeType_Searchenemy , false )	------不索敵		
						SetModeEx( BOSSTrap , EM_SetModeType_Mark , false )			------不可點選	(只要關這個就可以不跑出血條)
						SetModeEx( BOSSTrap , EM_SetModeType_NotShowHPMP , false )	------不show血條
						--SetModeEx( BOSSTrap , EM_SetModeType_HideName , false ) 		-------不顯示名稱
						AddToPartition( BOSSTrap,roomid )
						table.insert( Trap_Table , BOSSTrap ) --把陷阱旗標放進來
						AddBuff(BOSSTrap , 506964 , 0 , -1) --補獸夾的idle特效
						sysCastSpellLV( OwnerID() , BOSSTrap  , 496201 , 1 ) -------控制器對補獸夾的位置，放一個隱形的地雷。
						Beginplot(BossTrap,"AP_Zone134_104458_Trap_start",10) ---讓觸發劇情藉由Beginplot的關係，延後一秒再發動
						--SetPlot( BOSSTrap,"collision","AP_Zone134_104458_Trap",20 )
					end
					
				elseif counter1 == 10 or counter1 == 20  or counter1 == 30 or counter1 == 40 then ---生出小狗頭人的時間流
					---檢查在Table中的小狗頭人是否活著，如果死亡，則從Table中移除---
					for i = 1 , table.getn(All_Mob_Table), 1 do
						if All_Mob_Table[i] ~= nil then 
							if ReadRoleValue( All_Mob_Table[i] , EM_RoleValue_IsDead) == 1 or CheckID(All_Mob_Table[i] ) == false then
								table.remove ( All_Mob_Table , i)
							end
						end
					end
					----------------
					Mob_Num = table.getn(All_Mob_Table)
					--say(OwnerID(),"ALL Mob =="..Mob_Num)
					if Mob_Num >= 20 then ---小狗頭人在場上的最多隻數，需要控制。
						--say(OwnerID(),"Mob Full!!")
						sleep(10)
					else
						--say(OwnerID(),"Start Mob !!")
						Mob_Flag = Rand(10)+1
						local Mob = CreateObjByFlag( 104459 , 780385 , Mob_Flag , 1 ) --生出小狗頭人(編號  ,旗標編號 第N隻旗標 生出幾個怪)
						--SetPlot( Boss,"dead","lua_Dy_Z18BossAI_1_dead",10 )----Boss 死亡劇情
						WriteRoleValue( Mob, EM_RoleValue_PID, OwnerID()) ---將控制器的GID存入小狗頭人的PID中
						WriteRoleValue( Mob, EM_RoleValue_Register1, Boss) --將Boss的GID存入小狗頭人的 Register1 中
						AddToPartition( Mob,roomid )
						BeginPlot( Mob, "AP_Zone134_104458_hole", 10)
						SetPlot( Mob,"dead","AP_Zone134_Mob_dead",10 )----小狗頭人死亡劇情，目的在於，死亡後，扣Boss的血量
						AddBuff(Mob , 506966 , 0 , -1) --小狗頭人減傷的Buff
						AddBuff(Mob , 507721 , 0 , -1) --小狗頭人攻擊目標鎖定的Buff，不會因為仇恨改變目標
						table.insert( All_Mob_Table , Mob )---將生出來的小狗頭人都存入 All_Mob_Table 中，以方便重置用 
					end

				--elseif counter1 == 5 then --判斷為第2階段 持續15秒
				elseif counter1 == 46 then --判斷為第2階段 持續15秒
					--say (OwnerID(), "SP_2 !!!")
					Trap_Num = table.getn(Trap_Table) --讀取Trap_Table裡面的數量
					--say (OwnerID(), "Trap_Num ="..Trap_Num)
					for i = 1 , Trap_Num ,1 do --跑上面的數量的次數
						Delobj(Trap_Table[i]) --刪除Trap_Table裡的東西 [i]為Trap_Table第幾格
					end
					Trap_Table = {} --重新做一個乾淨的Table
					WriteRoleValue( Boss, EM_RoleValue_Register1, 2)
					-----挑選一隻小狗頭人，Boss準備傳送至小狗頭人的位置---
					for i = 1 , table.getn(All_Mob_Table), 1 do
						if All_Mob_Table[i] ~= nil then 
							if ReadRoleValue( All_Mob_Table[i] , EM_RoleValue_IsDead) == 1 or CheckID(All_Mob_Table[i] ) == false then
								table.remove ( All_Mob_Table , i)
							end
						end
					end
					Mob_Num = table.getn(All_Mob_Table)
					if Mob_Num >= 1 then  ----如果目前的小狗頭人數量大於1，則將此小狗頭人的Gid存入Boss的暫存器內
						Mob_Chose = Rand(Mob_Num)+1
						Mob_Chose_ID = All_Mob_Table[Mob_Chose]
						--say(OwnerID(),"Mob_Chose_ID ="..Mob_Chose_ID)
						WriteRoleValue( Boss, EM_RoleValue_Register2, Mob_Chose_ID)
					else ----如果目前完全沒有狗頭人，則生出一隻指標性小怪，並將它的Gid存入Boss的暫存器內
						local Chose_Rand = Rand(10)+2
						local No_Mob = CreateObjByFlag( 104762 , 780696 , Chose_Rand , 1 ) 		
						SetModeEx( No_Mob , EM_SetModeType_Move , false )			------不移動
						SetModeEx( No_Mob , EM_SetModeType_Strikback , false )	------不反擊
						SetModeEx( No_Mob , EM_SetModeType_Fight , false )		------不可砍殺
						SetModeEx( No_Mob , EM_SetModeType_Searchenemy , false )	------不索敵		
						SetModeEx( No_Mob , EM_SetModeType_Mark , false )			------不可點選	(只要關這個就可以不跑出血條)
						SetModeEx( No_Mob , EM_SetModeType_NotShowHPMP , false )	------不show血條
						AddToPartition( No_Mob,roomid )
						WriteRoleValue(No_Mob, EM_RoleValue_Livetime,5)
						WriteRoleValue( Boss, EM_RoleValue_Register2, No_Mob)
					end
					----------------
					
				elseif counter1 == 60 then --計時器歸0，回到第1階段
					counter1 = 0
				end
				
			elseif  CombatBegin_Boss == 2 then --滅團時的機制
				--say(OwnerID(),"GG !!")
				AP_Zone134_cancelbuff_507618() --清除所有玩家的指定Buff
				local Door_1 = ReadRoleValue( OwnerID() , EM_RoleValue_Register3 )
				--local Door_2 = ReadRoleValue( OwnerID() , EM_RoleValue_Register4 )
				Delobj(Door_1)
				--Delobj(Door_2)
				Trap_Num = table.getn(Trap_Table) 
				Mob_Num = table.getn(All_Mob_Table) 
				for i = 1 , Trap_Num ,1 do --清除所有陷阱
					Delobj(Trap_Table[i]) 
				end
				for i = 1 , Mob_Num ,1 do --清除所有小狗頭人 
					Delobj(All_Mob_Table[i]) 
				end
				local Dead_Boss = ReadRoleValue( OwnerID() , EM_RoleValue_Register1 )
				sleep(50)
				WriteRoleValue( OwnerID(), EM_RoleValue_Register9, 0)
				Delobj(Dead_Boss)
				sleep(20)
				--say(OwnerID(),"Start New Game !!")
				break
			elseif CombatBegin_Boss == 3 then ----Boss 死亡劇情 --- 還需要再加上開門的動作
				AP_Zone134_cancelbuff_507618() --清除所有玩家的指定Buff
				local Door_1 = ReadRoleValue( OwnerID() , EM_RoleValue_Register3 )
				local Door_2 = ReadRoleValue( OwnerID() , EM_RoleValue_Register4 )
				Delobj(Door_1)
				Delobj(Door_2)
				Trap_Num = table.getn(Trap_Table) 
				Mob_Num = table.getn(All_Mob_Table)
				for i = 1 , Trap_Num ,1 do --清除所有陷阱 
					Delobj(Trap_Table[i]) 
				end
				for i = 1 , Mob_Num ,1 do --清除所有小狗頭人 
					Delobj(All_Mob_Table[i]) 
				end
				--say(OwnerID(),"Boss DEAD !!!!!")
				WriteRoleValue( OwnerID(), EM_RoleValue_Register9, 0)
			end
		end
	end
end	

----------以下為，捕獸夾 對 「玩家」，使用的是「碰撞劇情」，若使用此劇情，則目標物不可以設定成「阻擋」。--------------
function AP_Zone134_104458_Trap_start()--讓捕獸夾的觸發劇情藉由Beginplot的關係，延後一秒再發動
	SetPlot( OwnerID(),"collision","AP_Zone134_104458_Trap",20 )
end

function AP_Zone134_104458_Trap() --此時的「OwnerID」是指玩家，「TargetID」是只捕獸夾 
	local Mob_Num = 0
	local Search = {}
	SetPlot( OwnerID(),"collision","",10 ) ---為了避免重複觸法，所以，在觸發之後，必需要再塞一次「空的」劇情給玩加
	Addbuff(TargetID(),506964,0,1)--結束補獸夾的特效用
	Addbuff(OwnerID(),507627,0,5)
	BeginPlot( OwnerID(), "AP_Zone134_104458_Trap_2", 10)
	sleep(10)
	Delobj(TargetID())
end

function AP_Zone134_104458_Trap_2() ---在補獸夾觸發後，刪除地雷
	local Mob_Num = 0
	local Search = SearchRangeNPC ( OwnerID() , 10 )
	Mob_Num = table.getn(Search)
	for i = 1 , Mob_Num , 1 do
		--say(Search[i],"i="..Search[i])
		if	ReadRoleValue(Search[i],EM_RoleValue_OrgID) == 	104540 then
			Delobj(Search[i])
		end
	end
end
--↑↑↑↑↑↑↑↑↑↑------------------------------------------		

----------以下為，捕獸夾 對 「小狗頭人」，因為要做出碰觸就會夾起來的感覺，所以採用地雷的方式製作------
function AP_Zone134_ClearTrap() ---當隱藏在捕獸夾下的地雷引爆後，觸發的劇情。
	local Mob_Num = 0
	local Search = SearchRangeNPC ( OwnerID() , 10 )
	Mob_Num = table.getn(Search)
	if Mob_Num >= 1 then
		for i = 1 , Mob_Num , 1 do 
			if	ReadRoleValue(Search[i],EM_RoleValue_OrgID) == 	104460 then
				SetPlot( Search[i],"collision","",10 )
				Addbuff(Search[i],506964,0,1)--結束補獸夾的特效用
				BeginPlot( Search[i], "AP_Zone134_ClearTrap_2", 5)
				if	ReadRoleValue(TargetID(),EM_RoleValue_OrgID) == 104459 
					or ReadRoleValue(Search[i],EM_RoleValue_OrgID) == 104458 then
					CancelBuff( TargetID(), 506966 )
					Addbuff(TargetID(),507134,0,-1)--變身法術
					say(TargetID(),"[SC_104459_01]")
				end
			end
		end
	end
end

function AP_Zone134_ClearTrap_2() ---將原來的「對玩家的」捕獸夾刪除。
	Delobj(OwnerID())
end
--↑↑↑↑↑↑↑↑↑↑-------------------------------------------------		

function lua_Dy_Z18BossAI_1_dead() ----Boss 死亡劇情
	local CH1 = ReadRoleValue( OwnerID() , EM_RoleValue_PID )  --讀出控制器的ID
	WriteRoleValue( CH1, EM_RoleValue_Register9, 3)
end

---以下為，小狗頭人出招檢查，如果，目標玩家為石化狀態，則不可以使用該招式，此script是掛在法術集合中的「使用檢查LUA」
function AP_Zone134_Mob_104459() ---小狗頭人出招式前的檢查
	local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID ) 
	if CheckBuff(AttackTarget , 507619) == true then
		return false
	else
		if CheckBuff(OwnerID() , 506966) == true then
			return true
		else
			return false
		end
	end
end
--↑↑↑↑↑↑↑↑↑↑-------------------------------------------------	
	
---------------以下為，小狗頭人的死亡劇情，內容為，小狗人死亡，則Boss對自己造成傷害，需注意，要防止扣血扣過頭的-----
function AP_Zone134_Mob_dead() -----小狗頭人的死亡劇情
	local Boss = ReadRoleValue( OwnerID() , EM_RoleValue_Register1 ) --讀出Boss的GID
	local BossMaxHP = ReadRoleValue(Boss , EM_RoleValue_MaxHP)
	local BossNowHP = ReadRoleValue(Boss , EM_RoleValue_HP)
	local Check_HP = (BossNowHP/BossMaxHP)*100
	if	ReadRoleValue(TargetID(),EM_RoleValue_OrgID) == 104458 then ---如果小狗頭是Boss殺死的，則不執行這段死亡劇情。
		return
	else
		if Check_HP >= 3 then ---如果Boss血量大於「3%」才可以繼續執行動作
			SysCastSpellLv(Boss,Boss,496033 , 0 )--Boss自己對自己施放扣2.5%HP的傷害
		else  ----如果血量不足「3%」。則殺死狗頭人的玩家，則把Boss殺了。
			KillID(TargetID(),Boss)
		end
	end
end
--↑↑↑↑↑↑↑↑↑↑-------------------------------------------------		

function AP_Zone134_cancelbuff_507618()  ----將這個副本中每個人都清除這個Buff
	local roomid = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local PPL = SetSearchAllPlayer(roomid)---search 這一整個Zone所有玩家的數量
	local Table_PC_1 = {}--第一次搜尋玩家的Table
	for i = 1 , PPL , 1 do 
		Table_PC_1[i] = GetSearchResult() ---回傳執行SetSearchAllPlayer之後所搜尋到的所有物件（用FOR迴圈逐一取出）
		CancelBuff( Table_PC_1[i], 507618 ) ---枯骨之殞
		CancelBuff( Table_PC_1[i], 507619 ) -----化石術
		CancelBuff( Table_PC_1[i], 506967 ) -----汙穢靈
		CancelBuff( Table_PC_1[i], 507863 ) -----簡易版汙穢靈
	end
end