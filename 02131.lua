----------------------------------------------------------BOSS巫茲拉
function lua_Dy_Z190_WWBOSSAI()
	--while 1 do 
		--sleep(10)
		local counter1 = 0 ----------一般技能計時器
		local fight = 0 --開戰字串開關
		--local counter2 = 0 ---------AE計時器
		local skill = {496401 , 496402 , 496403 , 496400 } ------------單體傷害 150AE 遠距離AE100 15S四連擊
		local skillspeak = {0 , 0 , 0 , "[SC_104903_01"}
		local skillLV = { 0 , 0 , 0 , 0 }
		local skilluse = 0
		local Luck
		local CH1 = ReadRoleValue( OwnerID() , EM_RoleValue_PID )  --讀出控制器的ID
		--local CH1T = 0 --- 階段
		local roomid = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) --讀出物件在哪一層
		local CombatBegin = 0 --BOSS的戰鬥開關變數
		--AddBuff ( OwnerID() , 507951, 0 , -1 )
		while 1 do 
			sleep(10) 
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID ) --讀正在攻擊的目標
			if  ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then	
				CancelBuff( OwnerID(),  507951 )
				--CH1T = ReadRoleValue( OwnerID() , EM_RoleValue_Register1 ) --讀出第一個暫存器的值
				counter1 = counter1 + 1
				if fight == 0 then
					ScriptMessage( OwnerID(), -1 , 2 , "[SC_104903_02] " , 2 )
					fight = 1 
				elseif fight ~= 0 then
					
				end
				--counter2 = counter2 + 1
				--say (OwnerID(), "counter1 = "..counter1)
				--say (OwnerID(), "counter2 = "..counter2)
				CombatBegin = 1 --表示正在戰鬥中
				WriteRoleValue( CH1, EM_RoleValue_Register2, 1)
				if counter1 == 7 then
					Luck = Rand( 100 ) --招式亂數
						
					if (Luck >=0 and Luck <40) then 
						skilluse = 1
						BOSSTarget = AttackTarget
						CastSpellLV( OwnerID() , BOSSTarget , skill[skilluse] , skillLV[skilluse] )
						--say(OwnerID(),"01")
					elseif (Luck >=40 and Luck <=70) then
						skilluse = 2
						BOSSTarget = AttackTarget
						CastSpellLV( OwnerID() , BOSSTarget , skill[skilluse] , skillLV[skilluse] )
						--say(OwnerID(),"02")
					elseif (Luck >=70 and Luck <=100) then  --random range : 150~300
						local Play_Chose = {}               --newhatelistcount
						local Play_Chose2 = {}              --boss's hatelistcount 
						local Play_Chose1 = {}    -->150
						local Play_Chose1_2 = {}  --<150
						Play_Chose2 = DW_HateRemain(0)
						Play_Chose =KS_RegroupArray( Play_Chose2, num )
						if table.getn(Play_Chose)<7 then    --if boss's hatelistcount <7
							--say(OwnerID(),"player<6")
							for i=1 , table.getn(Play_Chose) do --get table(Play_Chose)'s number
								sysCastSpelllv(OWnerID(),Play_Chose[i],496403,0)
							end
						else
							for i=1 , table.getn(Play_Chose) , 1 do
									if CheckID(Play_Chose[i]) == true and
									ReadRoleValue( Play_Chose[i] ,EM_RoleValue_IsDead) == 0 and
									ReadRoleValue( Play_Chose[i] , EM_RoleValue_VOC ) > 0 and
									GetDistance( OwnerID(), Play_Chose[i])>150 and
									GetDistance( OwnerID(), Play_Chose[i])<500 then
										table.insert(Play_Chose1, Play_Chose[i])
									end
									if CheckID(Play_Chose[i]) == true and
									ReadRoleValue( Play_Chose[i] ,EM_RoleValue_IsDead) == 0 and
									ReadRoleValue( Play_Chose[i] , EM_RoleValue_VOC ) > 0 and
									GetDistance( OwnerID(), Play_Chose[i])<150 then
										table.insert(Play_Chose1_2, Play_Chose[i])
									end
							end
							if table.getn(Play_Chose1)>5 then
								for i=1 , table.getn(Play_Chose1) do --get table(Play_Chose)'s number
									sysCastSpelllv(OWnerID(),Play_Chose1[i],496403,0)
								end
							else
								for i=1 ,table.getn(Play_Chose1_2) do
									table.insert(Play_Chose1, Play_Chose1_2[i])
								end
								for i=1 , table.getn(Play_Chose1) do --get table(Play_Chose)'s number
									sysCastSpelllv(OWnerID(),Play_Chose1[i],496403,0)
								end
							end	
							
							--[[if table.getn(Play_Chose)<6 then    --if boss's hatelistcount <6
							--say(OwnerID(),"player<6")
							for i=1 , table.getn(Play_Chose) do --get table(Play_Chose)'s number
								sysCastSpelllv(OWnerID(),Play_Chose[i],496403,0)
							end
						else 
							say(OwnerID(),"player>6")
							for i=1 , table.getn(Play_Chose) do --get table(Play_Chose)'s number
								if table.getn(Play_Chose1)<6 then                        --不滿六人繼續抓
									if CheckID(Play_Chose[i]) == true and
									ReadRoleValue( Play_Chose[i] ,EM_RoleValue_IsDead) == 0 and
									ReadRoleValue( Play_Chose[i] , EM_RoleValue_VOC ) > 0 and
									GetDistance( OwnerID(), Play_Chose[i])>150 then
										table.insert(Play_Chose1, Play_Chose[i])         --範圍內丟進table.Play_Chose1
										
										--table.remove(Play_Chose,i)                       --丟進table.Play_Chose1的移除仇恨table
									end
									--say(Play_Chose1[i],"playerout = "..i)
								end
							end
							--say(OwnerID(),"playernum = "..table.getn(Play_Chose1))
							if table.getn(Play_Chose1)<6 then                            --抓完150以外的在判斷是否已經有六人
								for i=table.getn(Play_Chose1) , table.getn(Play_Chose) do
									if table.getn(Play_Chose1)<6 then
										table.insert(Play_Chose1, Play_Chose[i])
										--say(Play_Chose1[i],"playerin = "..i)
									end
								end
							end
							for i=1 , table.getn(Play_Chose1) do --get table(Play_Chose)'s number
								sysCastSpelllv(OWnerID(),Play_Chose1[i],496403,0)
							end
						end--]]
						
						end	
						
					end	
				elseif counter1 == 14 then
					Luck = Rand( 100 ) --招式亂數
					
					if (Luck >=0 and Luck <40) then 
						skilluse = 1
						BOSSTarget = AttackTarget
						CastSpellLV( OwnerID() , BOSSTarget , skill[skilluse] , skillLV[skilluse] )
						--say(OwnerID(),"01")
					elseif (Luck >=40 and Luck <=70) then
						skilluse = 2
						BOSSTarget = AttackTarget
						CastSpellLV( OwnerID() , BOSSTarget , skill[skilluse] , skillLV[skilluse] )
						--say(OwnerID(),"02")
					elseif (Luck >=70 and Luck <=100) then 
						local Play_Chose = {}               --newhatelistcount
						local Play_Chose2 = {}              --boss's hatelistcount 
						local Play_Chose1 = {}    -->150
						local Play_Chose1_2 = {}  --<150
						Play_Chose2 = DW_HateRemain(0)
						Play_Chose =KS_RegroupArray( Play_Chose2, num )
						if table.getn(Play_Chose)<7 then    --if boss's hatelistcount <7
							--say(OwnerID(),"player<6")
							for i=1 , table.getn(Play_Chose) do --get table(Play_Chose)'s number
								sysCastSpelllv(OWnerID(),Play_Chose[i],496403,0)
							end
						else
							for i=1 , table.getn(Play_Chose) , 1 do
									if CheckID(Play_Chose[i]) == true and
									ReadRoleValue( Play_Chose[i] ,EM_RoleValue_IsDead) == 0 and
									ReadRoleValue( Play_Chose[i] , EM_RoleValue_VOC ) > 0 and
									GetDistance( OwnerID(), Play_Chose[i])>150 and
									GetDistance( OwnerID(), Play_Chose[i])<500 then
										table.insert(Play_Chose1, Play_Chose[i])
									end
									if CheckID(Play_Chose[i]) == true and
									ReadRoleValue( Play_Chose[i] ,EM_RoleValue_IsDead) == 0 and
									ReadRoleValue( Play_Chose[i] , EM_RoleValue_VOC ) > 0 and
									GetDistance( OwnerID(), Play_Chose[i])<150 then
										table.insert(Play_Chose1_2, Play_Chose[i])
									end
							end
							if table.getn(Play_Chose1)>5 then
								for i=1 , table.getn(Play_Chose1) do --get table(Play_Chose)'s number
									sysCastSpelllv(OWnerID(),Play_Chose1[i],496403,0)
								end
							else
								for i=1 ,table.getn(Play_Chose1_2) do
									table.insert(Play_Chose1, Play_Chose1_2[i])
								end
								for i=1 , table.getn(Play_Chose1) do --get table(Play_Chose)'s number
									sysCastSpelllv(OWnerID(),Play_Chose1[i],496403,0)
								end
							end	
						end	
						
					end
				elseif counter1 >= 15 then --放出四連擊
					while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
					sleep(2)
					end			
			    	--say(OwnerID(),"7")
					ScriptMessage( OwnerID(), -1 , 2 , "[SC_104903_01]" , 2 )---------------沒有人可以在貓族憤怒下生存。---大絕用
					sleep(20)
					PlayMotion ( OwnerID(),ruFUSION_ACTORSTATE_SLEEP_BEGIN	 )---------------第1ㄍ動作
					---say(OwnerID(),"[SC_104108_02]")
					SetModeEx( OwnerID() , EM_SetModeType_Fight, false) ---不可砍殺
					SetModeEx( OwnerID() , EM_SetModeType_Move, false) ---移動	
					sleep(5)
					SetIdleMotion( OwnerID() ,ruFUSION_ACTORSTATE_SLEEP_LOOP	)-----------------------攻擊動作
					CastSpellLV( OwnerID() , OwnerID()  , 496400 , 0 )
					sleep(30)
					while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
						sleep(2)
					end			
					PlayMotion ( OwnerID(), ruFUSION_ACTORSTATE_SLEEP_END )---------------------播放下來
					SetModeEx( OwnerID() , EM_SetModeType_Fight, true) ---可砍殺
					SetModeEx( OwnerID() , EM_SetModeType_Move, true) ---移動	
					SetIdleMotion( OwnerID() ,  ruFUSION_ACTORSTATE_NORMAL)--------保持地下模式
					counter1 = 0
				end
			else
				if CombatBegin == 1 then --當BOSS還存在時 玩家滅團---重新產生BOSS
					fight = 0 
					WriteRoleValue( CH1, EM_RoleValue_Register2, 2)
				end
			end		
		end			
	    
end

-------------------------------------------BOSS死亡劇情
function lua_Dy_Z190_WWBOSSAI_DIE()----BOSS死亡劇情
	local CH1 = ReadRoleValue( OwnerID() , EM_RoleValue_PID )  --讀出控制器的ID
	ScriptMessage( OwnerID(), -1 , 2 , "[SC_104903_03] " , 2 )
	WriteRoleValue( CH1, EM_RoleValue_Register2, 3)
	WriteRoleValue( CH1, EM_RoleValue_Register3, 1) -- 回傳死亡的訊息給世界1中控器
end
----------------------------------------------------------BOSS巫茲拉控制器
function lua_Dy_Z190_WWBOSSAIC()----控制器
	local roomid = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) --讀出物件在哪一層
	local Boss = CreateObjByFlag( 104903 , 780696 , 1 , 1 ) ---生出Boss (BOSS編號  ,旗標編號 第N隻旗標 生出幾個怪)
	local BossRange = CreateObjByFlag( 105071 , 780696 , 1 , 1 ) --生出量與BOSS距離的透明球
		SetModeEx( BossRange , EM_SetModeType_Show, true) ----秀出
		SetModeEx( BossRange , EM_SetModeType_Mark, false) ----標記
		SetModeEx( BossRange , EM_SetModeType_Strikback, false) ---反擊
		SetModeEx( BossRange , EM_SetModeType_Move, false) ---移動	
		SetModeEx( BossRange , EM_SetModeType_Fight, false) ---可砍殺
		SetModeEx( BossRange , EM_SetModeType_SearchenemyIgnore, true) ---物件不會被搜尋
		SetModeEx( BossRange , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
		SetModeEx( BossRange , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
		SetModeEx( BossRange , EM_SetModeType_Searchenemy, false)  ---索敵
		SetModeEx( BossRange  , EM_SetModeType_Obstruct, false )--阻擋
	local timeup --讀取小黑回傳的REGEST3
	local Far 
	WriteRoleValue( Boss, EM_RoleValue_PID, OwnerID())
	WriteRoleValue( OwnerID(), EM_RoleValue_Register1, Boss)
	WriteRoleValue( Boss, EM_RoleValue_Register9, BossRange)
	AddToPartition( Boss,roomid )
	WriteRoleValue( BossRange, EM_RoleValue_PID, OwnerID())
	WriteRoleValue( OwnerID(), EM_RoleValue_Register4, BossRange)
	WriteRoleValue( BossRange, EM_RoleValue_Register9, Boss)
	AddToPartition( BossRange,roomid )
	AddBuff ( Boss, 507951, 0 , -1 )
	setplot( Boss , "dead" , "lua_Dy_Z190_WWBOSSAI_DIE", 0)
	BeginPlot( Boss, "lua_Dy_Z190_WWBOSSAI", 10) ---Boss的戰鬥Function (  BOSS BOSS的LUA_AI  秒\每10=1秒)
	BeginPlot( BossRange, "lua_Dy_Z190_WWBOSSCheck", 10) --球的量距離AI
	--say(OwnerID(),"123")
	while 1 do
	--say(OwnerID(),"456")
		sleep(10)
		Far = ReadRoleValue( OwnerID() , EM_RoleValue_Register5 ) --讀取距離的暫存值
		timeup =  ReadRoleValue( OwnerID() , EM_RoleValue_Register3 )
		if timeup ==2 then --2 = 世界戰場戰鬥時間結束
			delobj(Boss)
			delobj(BossRange)
			delobj(OwnerID())
		end
		local BOSSDO = ReadRoleValue( OwnerID(), EM_RoleValue_Register2)
		
		if BOSSDO == 1 then--BOSS戰鬥中
			if Far < 500 then			
			elseif Far > 500 then
				--say(Boss , "Far "..Far)
				local BossIsDead = ReadRoleValue( OwnerID() , EM_RoleValue_register1 )
				if BossIsDead ~= 1 then
					if Boss ~= nil then
						DelObj( Boss )
						DelObj( BossRange )
					end			
				sleep(50)
				Boss = CreateObjByFlag( 104903 , 780696 , 1 , 1 )
				BossRange = CreateObjByFlag( 105071 , 780696 , 1 , 1 )
				
				SetModeEx( BossRange , EM_SetModeType_HideName, true )			--名稱
				SetModeEx( BossRange , EM_SetModeType_ShowRoleHead, false )		--不秀頭像框
				SetModeEx( BossRange , EM_SetModeType_Mark, false )				--標記
				SetModeEx( BossRange , EM_SetModeType_Move , false )				--不移動
				SetModeEx( BossRange , EM_SetModeType_Searchenemy , false )		--不索敵
				SetModeEx( BossRange , EM_SetModeType_Fight , false )			--可砍殺攻擊
				SetModeEx( BossRange , EM_SetModeType_Strikback, false )			--反擊
				SetModeEx( BossRange , EM_SetModeType_NotShowHPMP , false )		--不show血條
				
				AddToPartition( Boss , roomid )
				AddToPartition( BossRange , roomid )
				AddBuff ( Boss, 507951, 0 , -1 )
				WriteRoleValue( Boss, EM_RoleValue_PID, OwnerID())
				WriteRoleValue( OwnerID(), EM_RoleValue_Register1, Boss)
				WriteRoleValue( Boss , EM_RoleValue_Register9, BossRange )
				WriteRoleValue( BossRange, EM_RoleValue_PID, OwnerID())
				WriteRoleValue( OwnerID(), EM_RoleValue_Register4, BossRange)
				WriteRoleValue( BossRange, EM_RoleValue_Register9, Boss)

				setplot( Boss , "dead" , "lua_Dy_Z190_WWBOSSAI_DIE", 0)
				BeginPlot( Boss, "lua_Dy_Z190_WWBOSSAI", 10) ---Boss的戰鬥Function (  BOSS BOSS的LUA_AI  秒\每10=1秒)
				BeginPlot( BossRange, "lua_Dy_Z190_WWBOSSCheck", 10) --球的量距離AI
				
			elseif BossIsDead == 1 then	
				WriteRoleValue( OwnerID() , EM_RoleValue_register2 , 3 )
				--DelObj( BossRange )
				return
			end
			BOSSDO = 0
			WriteRoleValue( OwnerID() , EM_RoleValue_register2 , BOSSDO )
		end
		elseif BOSSDO == 2 then --王離開戰鬥
			delobj (Boss)
			delobj (BossRange)
			sleep(50)
			Boss = CreateObjByFlag( 104903 , 780696 , 1 , 1 )
			BossRange = CreateObjByFlag( 105071 , 780696 , 1 , 1 )
			
			SetModeEx( BossRange , EM_SetModeType_HideName, true )			--名稱
			SetModeEx( BossRange , EM_SetModeType_ShowRoleHead, false )		--不秀頭像框
			SetModeEx( BossRange , EM_SetModeType_Mark, false )				--標記
			SetModeEx( BossRange , EM_SetModeType_Move , false )				--不移動
			SetModeEx( BossRange , EM_SetModeType_Searchenemy , false )		--不索敵
			SetModeEx( BossRange , EM_SetModeType_Fight , false )			--可砍殺攻擊
			SetModeEx( BossRange , EM_SetModeType_Strikback, false )			--反擊
			SetModeEx( BossRange , EM_SetModeType_NotShowHPMP , false )		--不show血條
				
			AddToPartition( Boss , roomid )
			AddToPartition( BossRange , roomid )
			AddBuff ( Boss, 507951, 0 , -1 )
			WriteRoleValue( Boss, EM_RoleValue_PID, OwnerID())
			WriteRoleValue( OwnerID(), EM_RoleValue_Register1, Boss)
			WriteRoleValue( Boss , EM_RoleValue_Register9, BossRange )
			WriteRoleValue( BossRange, EM_RoleValue_PID, OwnerID())
			WriteRoleValue( OwnerID(), EM_RoleValue_Register4, BossRange)
			WriteRoleValue( BossRange, EM_RoleValue_Register9, Boss)

			setplot( Boss , "dead" , "lua_Dy_Z190_WWBOSSAI_DIE", 0)
			BeginPlot( Boss, "lua_Dy_Z190_WWBOSSAI", 10) ---Boss的戰鬥Function (  BOSS BOSS的LUA_AI  秒\每10=1秒)
			BeginPlot( BossRange, "lua_Dy_Z190_WWBOSSCheck", 10) --球的量距離AI
			BOSSDO = 0
			WriteRoleValue( OwnerID(), EM_RoleValue_Register2, BOSSDO)
		elseif BOSSDO == 3 then --BOSS死亡
			delobj (BossRange)
			--delobj (OwnerID())
		end
		
	end
end	
function lua_Dy_Z190_WWBOSSCheck()
	local roomid = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local CH1 = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local Boss = ReadRoleValue( OwnerID() , EM_RoleValue_Register9 )
	local Far = GetDistance( OwnerID(), Boss )
	while 1 do
		Far= GetDistance( OwnerID(), boss )

		sleep (10)
		WriteRoleValue ( CH1 , EM_RoleValue_Register5 , Far )		
	end
end