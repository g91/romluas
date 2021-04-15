-------夢境王的死亡劇情---------------------
function Lua_apon_Zone120_DK_dead()
	local Boss = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
	local JK = ReadRoleValue(OwnerID(),EM_RoleValue_PID) 
	WriteRoleValue( Boss, EM_RoleValue_Register9, 1) ---讓下一隻夢境王登場用
	
	local DK_all_1 = 0
	DK_all_1 = ReadRoleValue(Boss,EM_RoleValue_Register6)-----累計生出夢境Boss的數量  
	WriteRoleValue( Boss, EM_RoleValue_Register6, DK_all_1 - 1)
	
	SetFightMode( JK , 0 , 0 , 0 , 0 )
	PlayMotionEX(JK, ruFUSION_ACTORSTATE_DYING , ruFUSION_ACTORSTATE_DEAD)
	ScriptMessage(OwnerID() , -1 , 2 , "[SC_102683_16]" , 1 )----原本在牢房內的氣息，瞬間消失了
end


-----夢境Boss---嘎巴-----------------------------------------------
-----保留的技能有1. 發怒。2.陀螺。3.原地龍卷風。
function Lua_apon_102856_dreamking()
	SetPlot(OwnerID(),"dead","Lua_apon_Zone120_DK_dead",10 )
	local ID = {}
	local Boss = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
	local pos = 1 
	Move( OwnerID() , 2525 , 874 , 4443 )
	local PPLX = 0
	local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local PPL = SetSearchAllPlayer(roomid1 )
	local Check_ID = 0
	for i = 1 , PPL , 1 do 
		ID[i] = GetSearchResult()
		if ReadRoleValue( ID[i] , EM_RoleValue_IsDead ) ~= 1 and ReadRoleValue( ID[i], EM_RoleValue_VOC) ~= 0  and ReadRoleValue( ID[i] , EM_RoleValue_RoomID  ) == roomid1 and GetDistance( OwnerID(), ID[i]) <=1300 then
			SetAttack( OwnerID() , ID[i] )
		end
		Check_ID = table.getn(ID)
	end
	
	local Check_life = 0
	while 1 do
		local counter1 = 0
		local counter2 = 0
		local counter3 = 0
		local counter4 = 0
		local counter5 = 0
		local pid = 0
		sleep(10)
		while 1 do
		PPLX = 0
			sleep(10)
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
			--if ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then	
			if HateListCount( OwnerID() ) ~= 0 then
				local partymember = LuaFunc_PartyData( AttackTarget)				
				sleep(10)
				--counter1 = counter1 + 1 
				--counter2 = counter2 + 1
				counter3 = counter3 + 1
				counter4 = counter4 + 1
				counter5 = counter5 + 1
				Check_life = 1
				if counter3 >= 15 then
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_102063_3]", 1 )    --字串要新增
					Say( OwnerID() , "[SC_102063_3]" )	----吼 ！ 忽然感覺到一陣天搖地動 ！！
					CastSpell( OwnerID() , OwnerID() , 493188) 	 ----音波震吼					
					sleep(10)	
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_102063_5]", 1 )    --字串要新增
					Say( OwnerID() , "[SC_102063_5]" )	----惹嘎巴生氣的人 ！都該死 ！ [ 獅魚人語 ]
					sleep(10)
					CastSpell( OwnerID() , OwnerID() , 493187) 	 ----嘎巴之怒
					SetFightMode ( OwnerID(),1, 0, 0,1 )	-----0617小鑫新增，不讓他邊跑邊放
					sleep(10)
					SetFightMode ( OwnerID(),1, 1, 1,1 )
					counter3 = 0
								
				elseif counter4 >= 10 then
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_102063_4]", 1 )    --字串要新增
					Say( OwnerID() , "[SC_102063_4]" )	----  嘗嘗大海最強大的破壞力吧 ！！[ 獅魚人語 ]
					sleep(20)
					CastSpellLV( OwnerID() , OwnerID() , 493221 , 40) 	 ----漩渦迴擊--陀螺					
					counter4 = 0
								
				elseif counter5 >= 5 then
					local anyone = Rand(partymember[0]-1)+1    --因為partymember 是 從 0 開始
					CastSpell( OwnerID() , partymember[anyone] , 493499) 	 ----嘎巴漩渦---叫出漩渦					
					sleep(10)							
					counter5 = 0
				end
			elseif HateListCount( OwnerID() ) == 0 then
				--SetPosByFlag( OwnerID(), 780388 , 1 )----將 DK 傳到場中間
				local ID = {}
				local ID_2 = {}
				local ID_2_all = 0
				--local Boss = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
				--local AttackTarget = ReadRoleValue( Boss , EM_RoleValue_AttackTargetID )
				--if  ( AttackTarget ~= 0 ) then
					--SetAttack(OwnerID(),AttackTarget)
				--end
				
				if Check_life == 1 then
					local PPL = SetSearchAllPlayer(roomid1)
					--sleep(10)
					--DeBugMsg(0,0,"PPL = "..PPL)
					if PPL==0 then-----------------------------檢查裡面是否 有沒有人
						--DeBugMsg(0,0,"MOB_1  ")
						WriteRoleValue( Boss, EM_RoleValue_PID, 1)
						sleep(30)
						Delobj(OwnerID())
					
					elseif PPL ~= 0 then  -----------------------------有人但是可能有gm或者死人
						for i = 1 , PPL , 1 do 
							ID[i] = GetSearchResult()
							if ReadRoleValue( ID[i] , EM_RoleValue_IsDead ) == 1 or  ------去檢查裡面的人是否是死人或者gm
								ReadRoleValue( ID[i], EM_RoleValue_VOC) == 0 or
								GetDistance( OwnerID(), ID[i]) >=1300 then 
								PPLX=PPLX+1
								--DeBugMsg(0,0,"ID ="..ID[i])
								--DeBugMsg(0,0,"PPLX = "..PPLX)
							else
								table.insert( ID_2 , ID[i] ) 
							end
							Check_ID = table.getn(ID)	
							--say(OwnerID(),"Check_ID_2 =="..Check_ID)
						end
						
						if PPL<=PPLX then ---------都相等  等於裡面都是死人或者gm  所以重置
							--DeBugMsg(0,0,"MOB_2 ")
							WriteRoleValue( Boss, EM_RoleValue_PID, 1) ----要是相等的話回報主體，進行重置
							sleep(30)
							Delobj(OwnerID())
							break
						elseif PPL > PPLX then ----代表場上還有活人，繼續戰鬥
							ID_2_all = table.getn(ID_2)
							for i = 1 , ID_2_all , 1 do
							--for i = 1 , PPL , 1 do 
								--ID[i] = GetSearchResult()
								--if ReadRoleValue( ID[i] , EM_RoleValue_IsDead ) ~= 1 and 
									--ReadRoleValue( ID[i], EM_RoleValue_VOC) ~= 0 and 
									--ReadRoleValue( ID[i] , EM_RoleValue_RoomID  ) == roomid1 then
									SetAttack( OwnerID() , ID_2[i] )
									PPLX = 0
									PPL = 0
									--pos = 1
								--end
							end
						end
					end
				end	
			end
		end
	end
end

------------------------------------------------------------------------------------------------------
------夢境Boss-----風車阿醜--------------
-----保留技能----

function Lua_apon_102855_dreamking()
	SetPlot(OwnerID(),"dead","Lua_apon_Zone120_DK_dead",10 )
	local ID = {}
	local Boss = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
	Move( OwnerID() , 2525 , 874 , 4443 )
	local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local PPL = SetSearchAllPlayer(roomid1 )
	local PPLX = 0
	for i = 1 , PPL , 1 do 
		ID[i] = GetSearchResult()
		if ReadRoleValue( ID[i] , EM_RoleValue_IsDead ) ~= 1 and ReadRoleValue( ID[i], EM_RoleValue_VOC) ~= 0  and ReadRoleValue( ID[i] , EM_RoleValue_RoomID  ) == roomid1 and GetDistance( OwnerID(), ID[i]) <=1300 then
			SetAttack( OwnerID() , ID[i] )
		end
	end
	local Check_life = 0
	while 1 do		
		local counter1 = 0
		local counter2 = 0
		local counter3 = 0
		sleep(10)
		while 1 do	
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
			--if  ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then	
			if HateListCount( OwnerID() ) ~= 0 then
				local partymember = LuaFunc_PartyData( AttackTarget)				
				sleep(10)
				counter1 = counter1 + 1
				counter2 = counter2 + 1
				counter3 = counter3 + 1
				Check_life = 1		
				if counter1 >= 10 then
					for i = 1 , partymember[0] , 1 do
						if ReadRoleValue( partymember[i] , EM_RoleValue_VOC ) == 5 and ReadRoleValue( partymember[i] , EM_RoleValue_IsDead ) ~= 1  then       							
							ScriptMessage( OwnerID() , -1 , 2 , "[SC_100998_1]" , 1 )
							--Say( OwnerID() , "[SC_100998_1]")	----霍克洛露出詭異的微笑
							sleep(20)
							CastSpell( OwnerID() , partymember[i] , 491308) 	 -----法力流失						
							sleep(10)							
						end
					end
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_100998_2]", 1 )
					--Say( OwnerID() , "[SC_100998_2]")  ----燒死你們!!
					sleep(10)
					CastSpell( OwnerID() , TargetID() , 494723)			  ----火焰爆裂術
					sleep(10)
					counter1 = 0
				end
				if counter2 >= 6 then 
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_100998_3]", 1 )
					Yell( OwnerID() , "[SC_100998_3]" , 5)----你們沒有勝利的機會!!
					sleep(20)
					CastSpell( OwnerID() , OwnerID() , 494715) 	--炫風斬
					counter2 = 0
					sleep(10)					
				end	
				if counter3 >= 18 then 
				    ScriptMessage( OwnerID() , -1 , 2 , "[SC_100998_4]" , 1 )
					Yell( OwnerID() , "[SC_100998_4]" , 5) ----憤怒的火焰!!
					sleep(20)
					CastSpell( OwnerID() , OwnerID() ,  492016) --火雨
					SetFightMode ( OwnerID(),1, 0, 0,1 )
					counter3 = 0
					sleep(30)	
					SetFightMode ( OwnerID(),1, 1, 1,1 )				
				end	
			elseif HateListCount( OwnerID() ) == 0 then
				--SetPosByFlag( OwnerID(), 780388 , 1 )----將 DK 傳到場中間
				local ID = {}
				local ID_2 = {}
				local ID_2_all = 0
				--local Boss = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
				--local AttackTarget = ReadRoleValue( Boss , EM_RoleValue_AttackTargetID )
				--if  ( AttackTarget ~= 0 ) then
					--SetAttack(OwnerID(),AttackTarget)
				--end
				
				if Check_life == 1 then
					local PPL = SetSearchAllPlayer(roomid1)
					--sleep(10)
					--DeBugMsg(0,0,"PPL = "..PPL)
					if PPL==0 then-----------------------------檢查裡面是否 有沒有人
						--DeBugMsg(0,0,"MOB_1  ")
						WriteRoleValue( Boss, EM_RoleValue_PID, 1)
						sleep(30)
						Delobj(OwnerID())
					
					elseif PPL ~= 0 then  -----------------------------有人但是可能有gm或者死人
						for i = 1 , PPL , 1 do 
							ID[i] = GetSearchResult()
							if ReadRoleValue( ID[i] , EM_RoleValue_IsDead ) == 1 or  ------去檢查裡面的人是否是死人或者gm
								ReadRoleValue( ID[i], EM_RoleValue_VOC) == 0 or
								GetDistance( OwnerID(), ID[i]) >=1300 then 
								PPLX=PPLX+1
								--DeBugMsg(0,0,"ID ="..ID[i])
								--DeBugMsg(0,0,"PPLX = "..PPLX)
							else
								table.insert( ID_2 , ID[i] ) 
							end
							Check_ID = table.getn(ID)	
						end
						
						if PPL<=PPLX then ---------都相等  等於裡面都是死人或者gm  所以重置
							--DeBugMsg(0,0,"MOB_2 ")
							WriteRoleValue( Boss, EM_RoleValue_PID, 1) ----要是相等的話回報主體，進行重置
							sleep(30)
							Delobj(OwnerID())
							break
						elseif PPL > PPLX then ----代表場上還有活人，繼續戰鬥
							ID_2_all = table.getn(ID_2)
							for i = 1 , ID_2_all , 1 do
							--for i = 1 , PPL , 1 do 
								--ID[i] = GetSearchResult()
								--if ReadRoleValue( ID[i] , EM_RoleValue_IsDead ) ~= 1 and 
									--ReadRoleValue( ID[i], EM_RoleValue_VOC) ~= 0 and 
									--ReadRoleValue( ID[i] , EM_RoleValue_RoomID  ) == roomid1 then
									SetAttack( OwnerID() , ID_2[i] )
									PPLX = 0
									PPL = 0
									--pos = 1
								--end
							end
						end
					end
				end	
			end
		end
	end
end

------------------------------------------------------------------------------------------------------
------夢境Boss-----修道院的安卡阿姨--------------
-----保留技能----
function Lua_apon_102854_dreamking()
	SetPlot(OwnerID(),"dead","Lua_apon_Zone120_DK_dead",10 )
	local ID = {}
	local Boss = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
	local Check_life = 0
	Move( OwnerID() , 2525 , 874 , 4443 )
	local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local PPLX = 0
	local PPL = SetSearchAllPlayer(roomid1 )
	for i = 1 , PPL , 1 do 
		ID[i] = GetSearchResult()
		if ReadRoleValue( ID[i] , EM_RoleValue_IsDead ) ~= 1 and ReadRoleValue( ID[i], EM_RoleValue_VOC) ~= 0  and ReadRoleValue( ID[i] , EM_RoleValue_RoomID  ) == roomid1 and GetDistance( OwnerID(), ID[i]) <=1300 then
			SetAttack( OwnerID() , ID[i] )
		end
	end
	local MonsterID = 102869	-- 屍妖
	local MonsterNumber1 = 2
	local MonsterNumber2 = 2
	local MonsterNumber3 = 2
	local HPMonsterNumber = 2
	local HPMonsterID = 102807	-- 傀儡法師
	local FirstMagicID = 490636	-- 群體補抓
	local BuffID = 501014 	-- 群體補抓Buff
	local SecondMagicID = 494174	-- 火球術
	local SecondMagicLV = 2000
	local thirdMagicID = 494175		-- 大爆炸
	local thirdMagicLV = 50

	local HPMagicID = 493997	-- 小王專用50%恢復術（血剩50%, 25%時使用）
	local MaxHP = ReadRoleValue(  OwnerID() , EM_RoleValue_MaxHP )

	local CheckTime = 10	-- 一秒檢查一次
	local FTM = "NoCall"	-- 戰鬥狀態
	local F2M = "NoCall"	-- 戰鬥狀態
	local F4M = "NoCall"	-- 戰鬥狀態
	local HPM2 = "NoCall"	-- 回血狀態
	local HPM4 = "NoCall"	-- 回血狀態
	local Monster1 = {}
	local Monster2 = {}
	local Monster3 = {}


	while true do
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
		--if (  AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- 檢查是否離開戰鬥
		if HateListCount( OwnerID() ) ~= 0 then
			--Say( OwnerID(), "Fighting! AttackTarget = "..AttackTarget.." n = "..n )
			Check_life = 1
			if ( CheckBuff( AttackTarget , BuffID ) == true ) then
				CastSpellLV( OwnerID(), AttackTarget, SecondMagicID , SecondMagicLV ) 
			else
				local RND =  Rand( 99 ) + 1	-- 產生 1~100 的亂數
				    if ( RND >  0 and RND <= 45 ) then
					CastSpell( OwnerID(), AttackTarget, FirstMagicID )
				elseif ( RND > 60 and RND <= 85 ) then
					if ( CastSpellLV( OwnerID(), AttackTarget, thirdMagicID , thirdMagicLV ) ) then
					Say( OwnerID(), GetString("MT_ANKARIA4") )
						Say( OwnerID(), GetString("MT_ANKARIA5") )
						Sleep( 100 )
					end
				end
			end

			local NowHP = ReadRoleValue(  OwnerID() , EM_RoleValue_HP )
			local HPPercent = NowHP / MaxHP

			-- 戰鬥開始叫怪
			if (FTM == "NoCall" ) then	FTM, Monster1 = CallMonsterAtFightStart( OwnerID() , AttackTarget , MonsterID , MonsterNumber1 , GetString("MT_ANKARIA1") )	end
			-- 血 1/2 叫怪
			if ( HPPercent <= 0.5 ) and (F2M == "NoCall" ) then	F2M, Monster2 = CallMonsterAtFightStart( OwnerID() , AttackTarget , MonsterID , MonsterNumber2 , GetString("MT_ANKARIA1") )	end
			-- 血 1/4 叫怪
			if ( HPPercent <= 0.25 ) and (F4M == "NoCall" ) then	F4M, Monster3 = CallMonsterAtFightStart( OwnerID() , AttackTarget , MonsterID , MonsterNumber3 , GetString("MT_ANKARIA1") )	end

			-- 血 1/2 叫怪補血
			if (HPM2 == "NoCall" ) then	HPM2 = CallMonsterForRecovery( OwnerID() , 0.5 , 102807, 493997 , "Yes" , GetString("MT_ANKARIA2") , HPMonsterNumber , GetString("MT_ANKARIA3") )	end
			-- 血 1/4 叫怪補血
			if (HPM4 == "NoCall" ) then	HPM4 = CallMonsterForRecovery( OwnerID() , 0.25 , 102807, 493997 , "Yes" , GetString("MT_ANKARIA2") , HPMonsterNumber , GetString("MT_ANKARIA3")  )	end
		elseif HateListCount( OwnerID() ) == 0 then
			--SetPosByFlag( OwnerID(), 780388 , 1 )----將 DK 傳到場中間
			local ID = {}
			local ID_2 = {}
			local ID_2_all = 0
			--local Boss = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
			--local AttackTarget = ReadRoleValue( Boss , EM_RoleValue_AttackTargetID )
			--if  ( AttackTarget ~= 0 ) then
				--SetAttack(OwnerID(),AttackTarget)
			--end
			
			if Check_life == 1 then
				local PPL = SetSearchAllPlayer(roomid1)
				--sleep(10)
				--DeBugMsg(0,0,"PPL = "..PPL)
				if PPL==0 then-----------------------------檢查裡面是否 有沒有人
					--DeBugMsg(0,0,"MOB_1  ")
					WriteRoleValue( Boss, EM_RoleValue_PID, 1)
					sleep(30)
					Delobj(OwnerID())
				
				elseif PPL ~= 0 then  -----------------------------有人但是可能有gm或者死人
					for i = 1 , PPL , 1 do 
						ID[i] = GetSearchResult()
						if ReadRoleValue( ID[i] , EM_RoleValue_IsDead ) == 1 or  ------去檢查裡面的人是否是死人或者gm
							ReadRoleValue( ID[i], EM_RoleValue_VOC) == 0 or
							GetDistance( OwnerID(), ID[i]) >=1300 then 
							PPLX=PPLX+1
							--DeBugMsg(0,0,"ID ="..ID[i])
							--DeBugMsg(0,0,"PPLX = "..PPLX)
						else
							table.insert( ID_2 , ID[i] ) 
						end
						Check_ID = table.getn(ID)	
						--say(OwnerID(),"Check_ID_2 =="..Check_ID)
					end
					
					if PPL<=PPLX then ---------都相等  等於裡面都是死人或者gm  所以重置
						--DeBugMsg(0,0,"MOB_2 ")
						WriteRoleValue( Boss, EM_RoleValue_PID, 1) ----要是相等的話回報主體，進行重置
						sleep(30)
						Delobj(OwnerID())
						break
					elseif PPL > PPLX then ----代表場上還有活人，繼續戰鬥
						ID_2_all = table.getn(ID_2)
						for i = 1 , ID_2_all , 1 do
						--for i = 1 , PPL , 1 do 
							--ID[i] = GetSearchResult()
							--if ReadRoleValue( ID[i] , EM_RoleValue_IsDead ) ~= 1 and 
								--ReadRoleValue( ID[i], EM_RoleValue_VOC) ~= 0 and 
								--ReadRoleValue( ID[i] , EM_RoleValue_RoomID  ) == roomid1 then
								SetAttack( OwnerID() , ID_2[i] )
								PPLX = 0
								PPL = 0
								--pos = 1
							--end
						end
					end
				end
			end	
		else
			--Say( OwnerID(), "NoFight n = "..n )

			FTM = "NoCall"		-- 非戰鬥，歸零記號
			F2M = "NoCall"		-- 非戰鬥，歸零記號
			F4M = "NoCall"		-- 非戰鬥，歸零記號
			HPM2 = "NoCall"		-- 非戰鬥，歸零記號
			HPM4 = "NoCall"		-- 非戰鬥，歸零記號


			for i = 1, table.getn( Monster1 ) do	-- 離開戰鬥時，刪除進入戰鬥時叫出來的屍妖
				if ( ( Monster1[i] ~= nil ) and ( CheckID( Monster1[i] ) == true ) ) then		DelObj( Monster1[i] )	end
			end
			for i = 1, table.getn( Monster2 ) do	-- 離開戰鬥時，刪除進入戰鬥時叫出來的屍妖
				if ( ( Monster2[i] ~= nil ) and ( CheckID( Monster2[i] ) == true ) ) then		DelObj( Monster2[i] )	end
			end
			for i = 1, table.getn( Monster3 ) do	-- 離開戰鬥時，刪除進入戰鬥時叫出來的屍妖
				if ( ( Monster3[i] ~= nil ) and ( CheckID( Monster3[i] ) == true ) ) then		DelObj( Monster3[i] )	end
			end

			if ( Monster1 ~= nil ) then	Monster1 = {}	end
			if ( Monster2 ~= nil ) then	Monster2 = {}	end
			if ( Monster3 ~= nil ) then	Monster3 = {}	end

		end

	Sleep( CheckTime )
	end
end


------------------------------------------------------------
------夢境Boss-----藏寶女王--------------
-----保留技能----拉回、女王炸彈 

function Lua_apon_102852_dreamking()
	SetPlot(OwnerID(),"dead","Lua_apon_Zone120_DK_dead",10 )
	local ID = {}
	local Boss = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
	local Check_life = 0
	Move( OwnerID() , 2525 , 874 , 4443 )
	local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local PPLX = 0
	local PPL = SetSearchAllPlayer(roomid1 )
	for i = 1 , PPL , 1 do 
		ID[i] = GetSearchResult()
		if ReadRoleValue( ID[i] , EM_RoleValue_IsDead ) ~= 1 and ReadRoleValue( ID[i], EM_RoleValue_VOC) ~= 0  and ReadRoleValue( ID[i] , EM_RoleValue_RoomID  ) == roomid1 and GetDistance( OwnerID(), ID[i]) <=1300 then
			SetAttack( OwnerID() , ID[i] )
		end
	end
	while 1 do
		sleep(10)
		local skill_1 = 494309 ---女王召令
		local skill_2 = 494308 --- 雪波之舞
		local skill_3 = 494310 --- 撕裂傷口
		
		local counter1 = 0
		local counter2 = 0
		local counter3 = 0
		local counter4 = 0
		local counter5 = 0
		sleep(10)
		while 1 do
			sleep(10)
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
			local BossTarget = AttackTarget
			--if ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then
			if HateListCount( OwnerID() ) ~= 0 then
				local partymember = LuaFunc_PartyData( AttackTarget)				
				sleep(10)
				counter1 = counter1 + 1		
				counter2 = counter2 + 1
				counter3 = counter3 + 1
				--counter4 = counter4 + 1
				--counter5 = counter5 + 1
				Check_life = 1
				if counter1 >= 8 then
					CastSpellLV( OwnerID() , OwnerID() , skill_2 , 29 ) ---雪波之舞
					SetFightMode ( OwnerID(),1, 0, 0,1 ) --目的不讓他邊跑邊放
					sleep(10)
					SetFightMode ( OwnerID(),1, 1, 1,1 )
					sleep(10)
					counter1 = 0
							
				elseif counter2 >= 12 then
					CastSpellLV( OwnerID() , OwnerID() , skill_1 , 70 ) --女王召令
					sleep(50)
					counter2 = 0
				
				elseif counter3 >= 10 then
					for i = 1 , 3 , 1 do 
						--say(OwnerID(),i)
						BossTarget = HateTargetID() ---打仇恨表隨機一個目標
						CastSpellLV( OwnerID() , BossTarget , skill_3 , 49 )
						sleep(10)
					end
					sleep(10)
					counter3 = 0
				end
			elseif HateListCount( OwnerID() ) == 0 then
				--SetPosByFlag( OwnerID(), 780388 , 1 )----將 DK 傳到場中間
				local ID = {}
				local ID_2 = {}
				local ID_2_all = 0
				--local Boss = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
				--local AttackTarget = ReadRoleValue( Boss , EM_RoleValue_AttackTargetID )
				--if  ( AttackTarget ~= 0 ) then
					--SetAttack(OwnerID(),AttackTarget)
				--end
				
				if Check_life == 1 then
					local PPL = SetSearchAllPlayer(roomid1)
					--sleep(10)
					--DeBugMsg(0,0,"PPL = "..PPL)
					if PPL==0 then-----------------------------檢查裡面是否 有沒有人
						--DeBugMsg(0,0,"MOB_1  ")
						WriteRoleValue( Boss, EM_RoleValue_PID, 1)
						sleep(30)
						Delobj(OwnerID())
					
					elseif PPL ~= 0 then  -----------------------------有人但是可能有gm或者死人
						for i = 1 , PPL , 1 do 
							ID[i] = GetSearchResult()
							if ReadRoleValue( ID[i] , EM_RoleValue_IsDead ) == 1 or  ------去檢查裡面的人是否是死人或者gm
								ReadRoleValue( ID[i], EM_RoleValue_VOC) == 0 or
								GetDistance( OwnerID(), ID[i]) >=1300 then 
								PPLX=PPLX+1
								--DeBugMsg(0,0,"ID ="..ID[i])
								--DeBugMsg(0,0,"PPLX = "..PPLX)
							else
								table.insert( ID_2 , ID[i] ) 
							end
							Check_ID = table.getn(ID)	
							--say(OwnerID(),"Check_ID_2 =="..Check_ID)
						end
						
						if PPL<=PPLX then ---------都相等  等於裡面都是死人或者gm  所以重置
							--DeBugMsg(0,0,"MOB_2 ")
							WriteRoleValue( Boss, EM_RoleValue_PID, 1) ----要是相等的話回報主體，進行重置
							sleep(30)
							Delobj(OwnerID())
							break
						elseif PPL > PPLX then ----代表場上還有活人，繼續戰鬥
							ID_2_all = table.getn(ID_2)
							for i = 1 , ID_2_all , 1 do
							--for i = 1 , PPL , 1 do 
								--ID[i] = GetSearchResult()
								--if ReadRoleValue( ID[i] , EM_RoleValue_IsDead ) ~= 1 and 
									--ReadRoleValue( ID[i], EM_RoleValue_VOC) ~= 0 and 
									--ReadRoleValue( ID[i] , EM_RoleValue_RoomID  ) == roomid1 then
									SetAttack( OwnerID() , ID_2[i] )
									PPLX = 0
									PPL = 0
									--pos = 1
								--end
							end
						end
					end
				end	
			end
		end
	end
end				
	

------------------------------------------------------------
------夢境Boss-----冰矮火王--------------
-----保留技能----變身 	

function Lua_apon_102851_dreamking()
	SetPlot(OwnerID(),"dead","Lua_apon_Zone120_DK_dead",10 )
	local ID = {}
	local Boss = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
	local Check_life = 0
	Move( OwnerID() , 2525 , 874 , 4443 )
	local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local PPLX = 0
	local PPL = SetSearchAllPlayer(roomid1 )
	for i = 1 , PPL , 1 do 
		ID[i] = GetSearchResult()
		if ReadRoleValue( ID[i] , EM_RoleValue_IsDead ) ~= 1 and ReadRoleValue( ID[i], EM_RoleValue_VOC) ~= 0  and ReadRoleValue( ID[i] , EM_RoleValue_RoomID  ) == roomid1 and GetDistance( OwnerID(), ID[i]) <=1300 then
			SetAttack( OwnerID() , ID[i] )
		end
	end
	AddBuff( OwnerID() , 503399 , 1 , -1 )
	--SetModeEX( OwnerID() , EM_SetModeType_Move , false )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Count = 0
	local Timer = 0
	local Pos = {}
	local Orb = {}
	local NowTarget
	local BurnOut = 0
	local Reset = 0
	while 1 do
		Count = HateListCount( OwnerID() )
		if Count > 0 then
			Check_life = 1
			
			if Reset == 0 then
				Reset = 1 
			end 
			NowTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
			
			if ( Timer == 8 or Timer == 18 or Timer == 28 or Timer == 38 or Timer == 48 ) then
				
				local Target = {}
				
				for i = 0 , Count - 1 , 1 do
					local Player = HateListInfo(OwnerID() ,i , EM_HateListInfoType_GItemID )
					if ReadRoleValue( Player , EM_RoleValue_IsDead ) == 0 and CheckBuff( Player , 503103 ) == false then
						table.insert(Target, Player)
					end
				end
				
				local n = DW_Rand( table.getn(Target) )
				if Target[n] ~= nil and  CheckID( Target[n] ) == true  then
					CastSpellLV( OwnerID() , Target[n] , 492848 , 200 ) --火靈騷動
				end
				
				Timer = Timer + 2
			else
				if DW_Rand( 1000 ) > 150 and BurnOut ~= 1 then
					CastSpellLV( OwnerID() , OwnerID() , 492847 , 1300 ) --遠古之火將原本200修改成1300 
				end
			end
			Timer = Timer + 1
			if Timer > 60 then
				Timer = 1
			end
		elseif HateListCount( OwnerID() ) == 0 then
			--SetPosByFlag( OwnerID(), 780388 , 1 )----將 DK 傳到場中間
			local ID = {}
			local ID_2 = {}
			local ID_2_all = 0
			--local Boss = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
			--local AttackTarget = ReadRoleValue( Boss , EM_RoleValue_AttackTargetID )
			--if  ( AttackTarget ~= 0 ) then
				--SetAttack(OwnerID(),AttackTarget)
			--end
			
			if Check_life == 1 then
				local PPL = SetSearchAllPlayer(roomid1)
				--sleep(10)
				--DeBugMsg(0,0,"PPL = "..PPL)
				if PPL==0 then-----------------------------檢查裡面是否 有沒有人
					--DeBugMsg(0,0,"MOB_1  ")
					WriteRoleValue( Boss, EM_RoleValue_PID, 1)
					sleep(30)
					Delobj(OwnerID())
				
				elseif PPL ~= 0 then  -----------------------------有人但是可能有gm或者死人
					for i = 1 , PPL , 1 do 
						ID[i] = GetSearchResult()
						if ReadRoleValue( ID[i] , EM_RoleValue_IsDead ) == 1 or  ------去檢查裡面的人是否是死人或者gm
							ReadRoleValue( ID[i], EM_RoleValue_VOC) == 0 or
							GetDistance( OwnerID(), ID[i]) >=1300 then 
							PPLX=PPLX+1
							DeBugMsg(0,0,"ID ="..ID[i])
							DeBugMsg(0,0,"PPLX = "..PPLX)
						else
							table.insert( ID_2 , ID[i] ) 
						end
						Check_ID = table.getn(ID)	
						--say(OwnerID(),"Check_ID_2 =="..Check_ID)
					end
					
					if PPL<=PPLX then ---------都相等  等於裡面都是死人或者gm  所以重置
						--DeBugMsg(0,0,"MOB_2 ")
						WriteRoleValue( Boss, EM_RoleValue_PID, 1) ----要是相等的話回報主體，進行重置
						sleep(30)
						Delobj(OwnerID())
						break
					elseif PPL > PPLX then ----代表場上還有活人，繼續戰鬥
						ID_2_all = table.getn(ID_2)
						for i = 1 , ID_2_all , 1 do
						--for i = 1 , PPL , 1 do 
							--ID[i] = GetSearchResult()
							--if ReadRoleValue( ID[i] , EM_RoleValue_IsDead ) ~= 1 and 
								--ReadRoleValue( ID[i], EM_RoleValue_VOC) ~= 0 and 
								--ReadRoleValue( ID[i] , EM_RoleValue_RoomID  ) == roomid1 then
								SetAttack( OwnerID() , ID_2[i] )
								PPLX = 0
								PPL = 0
								--pos = 1
							--end
						end
					end
				end
			end	
		else
			if Reset == 1 then
				Timer = 0
				BurnOut = 0
				Lua_CancelAllBuff( OwnerID() ) 
				Reset  = 0
				AddBuff( OwnerID() , 503399 , 1 , -1 )
			end
		end
		sleep( 10 )
	end
end