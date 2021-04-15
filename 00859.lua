function luaI_starboss1()	
	while 1 do		
		local counter1 = 0
		local counter2 = 0
		local counter3 = 0
		local counter4 = 0
		--WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 ) 
		local pid = 0
		--Say( OwnerID(),  AttackTarget ) 
		sleep(10)
		for i = 0 , 12000  do	
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
			if  ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then					
				local MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )
				local NowHP = ReadRoleValue( OwnerID() , EM_RoleValue_HP )
				local HPPercent =( NowHP / MaxHP)*100
				local partymember = LuaFunc_PartyData( AttackTarget)				
				sleep(10)
				counter1 = counter1 + 1
				counter2 = counter2 + 1
				counter3 = counter3 + 1
				counter4 = counter4 + 1
						
				if counter1 == 13 then
					for i = 1 , partymember[0] , 1 do
						if ReadRoleValue( partymember[i] , EM_RoleValue_VOC ) == 5 and ReadRoleValue( partymember[i] , EM_RoleValue_IsDead ) ~= 1  then       							
							ScriptMessage( OwnerID() , -1 , 2 , GetString("SC_100998_1") , 1 )
							Say( OwnerID() , GetString("SC_100998_1") )	----霍克洛露出詭異的微笑
							sleep(20)
							CastSpell( OwnerID() , partymember[i] , 491308) 	 -----法力流失						
							sleep(10)							
						end
					end
					ScriptMessage( OwnerID() , -1 , 2 , GetString("SC_100998_2") , 1 )
					Say( OwnerID() , GetString("SC_100998_2") )  ----燒死你們!!
					sleep(10)
					CastSpell( OwnerID() , TargetID() , 490643)			  ----火焰爆裂術
					sleep(10)
					counter1 = 0
				end
				if counter2 == 8 then 
					ScriptMessage( OwnerID() , -1 , 2 , GetString("SC_100998_3") , 1 )
					Say( OwnerID() , GetString("SC_100998_3") )   ----你們沒有勝利的機會!!
					sleep(20)
					CastSpell( OwnerID() , OwnerID() , 491129) 	--炫風斬
					counter2 = 0
					sleep(10)					
				end	
				if counter3 == 23 then 
				    ScriptMessage( OwnerID() , -1 , 2 , GetString("SC_100998_4") , 1 )
					Say( OwnerID() , GetString("SC_100998_4") )   ----憤怒的火焰!!
					sleep(20)
					CastSpell( OwnerID() , OwnerID() ,  492016) --火雨
					SetFightMode ( OwnerID(),1, 0, 0,1 )
					counter3 = 0
					sleep(30)	
					SetFightMode ( OwnerID(),1, 1, 1,1 )				
				end	
				if HPPercent <= 50 and ReadRoleValue( OwnerID() , EM_RoleValue_PID  ) == 0  then                   ----施放無敵狂暴								
					WriteRoleValue( OwnerID() , EM_RoleValue_PID , 1 )
					ScriptMessage( OwnerID() , -1 , 2 , GetString("SC_100998_5") , 1 )
					Say( OwnerID() , GetString("SC_100998_5") )            ----霍克洛發出怒吼!!					
					--CastSpell(OwnerID() , OwnerID() , 491306)    	----無情
					--sleep(20)
					AddBuff(OwnerID(), 502092 , 0 , 20 )
					CastSpell(OwnerID() , OwnerID() , 491123) 	-----暈頭轉向
					sleep(20)
					local NowHP1 = ReadRoleValue( OwnerID() , EM_RoleValue_HP )
					ScriptMessage( OwnerID() , -1 , 2 , GetString("SC_100998_6") , 1 )
					Say( OwnerID() , GetString("SC_100998_6") )   ----你們的能力只有這樣?真令我失望啊!
					sleep(20)
					ScriptMessage( OwnerID() , -1 , 2 , GetString("SC_100998_7") , 1 )
					Say( OwnerID() , GetString("SC_100998_7") )   ----想洗刷失敗的恥辱就試著找到我吧，哈哈哈!
					CastSpell( OwnerID() , OwnerID() , 491305)
					sleep(40)
					local RoomNumber = Rand(98)
					local modeNumber = Rand(98)
					--local modeNumber = 70	-----除錯用				
					local artifact = 0
					local man = 0	
					local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
					if RoomNumber < 33 and RoomNumber >= 0 then                                          ----Room 1							
						--artifact = lua_star_Create(OwnerID() , NowHP , 111396 , 0)										
						SetPos( OwnerID(), 2638.8,16.5,2194.4, 235 )                                     ----力士房
						man = lua_star_Create(OwnerID() , NowHP1 , 111401 , 0 , roomid1)
						if modeNumber < 33 and modeNumber >= 0 then
							SetCursorType( man , 1)
							SetPlot( man ,"touch","lua_star_Room1",40 )
						elseif modeNumber < 66 and modeNumber >= 33 then
							SetCursorType( man , 1)
							SetPlot( man ,"touch","lua_star_Room2",40 )
						elseif modeNumber < 99 and modeNumber >= 66 then
							SetCursorType( man , 1)
							SetPlot( man ,"touch","lua_star_Room3",40 )	
						end	
					elseif 	RoomNumber < 66 and RoomNumber >= 33 then                                     ----Room 2							
						--artifact = lua_star_Create(OwnerID() , NowHP , 111396 , 0)
						SetPos( OwnerID(), 2350.3,16.1,1872.5, 235 )                                      ----暗殺者房
						man = lua_star_Create(OwnerID() , NowHP1 , 111401 , 0 , roomid1)
						if modeNumber < 33 and modeNumber >= 0 then
							SetCursorType( man , 1)
							SetPlot( man ,"touch","lua_star_Room1",40 )
						elseif modeNumber < 66 and modeNumber >= 33 then
							SetCursorType( man , 1)
							SetPlot( man ,"touch","lua_star_Room2",40 )
						elseif modeNumber < 99 and modeNumber >= 66 then
							SetCursorType( man , 1)
							SetPlot( man ,"touch","lua_star_Room3",40 )	
						end
					elseif 	RoomNumber < 99 and RoomNumber >= 66 then                                      ----Room 3						
						--artifact = lua_star_Create(OwnerID() , NowHP , 111396 , 0)
						SetPos( OwnerID(), 316.6,16.1,2243.5, 235 )                                        ----馴獸師房
						man = lua_star_Create(OwnerID() , NowHP1 , 111401 , 0 , roomid1)
						if modeNumber < 33 and modeNumber >= 0 then
							SetCursorType( man , 1)
							SetPlot( man ,"touch","lua_star_Room1",40 )
						elseif modeNumber < 66 and modeNumber >= 33 then
							SetCursorType( man , 1)
							SetPlot( man ,"touch","lua_star_Room2",40 )
						elseif modeNumber < 99 and modeNumber >= 66 then
							SetCursorType( man , 1)
							SetPlot( man ,"touch","lua_star_Room3",40 )	
						end					
					end
									
					break			
				end
			else
				CancelBuff( OwnerID(), 501470 )
				break			  
			end
		end
	end
end
				
function lua_star_Room1()
	WriteRoleValue( TargetID() , EM_RoleValue_Register1 , OwnerID() )
	BeginPlot( TargetID(), "lua_star_Room1_1", 1 )
end

function lua_star_Room2()
	WriteRoleValue( TargetID() , EM_RoleValue_Register1 , OwnerID() )
	BeginPlot( TargetID(), "lua_star_Room2_1", 1 )
end

function lua_star_Room3()
	WriteRoleValue( TargetID() , EM_RoleValue_Register1 , OwnerID() )
	BeginPlot( TargetID(), "lua_star_Room3_1", 1 )
end
				
function lua_star_Room1_1()
	--local temp_man = TargetID()
	SetPlot( OwnerID()  ,"touch", "" ,0 )
	local roomid3 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	--local temp_man = LuaFunc_CreateObjByObj( 101002 , OwnerID() )
	local pid = ReadRoleValue( OwnerID() , EM_RoleValue_PID  )
	local player_talk = ReadRoleValue( OwnerID() , EM_RoleValue_Register1 )
	local Obj = Role:new( OwnerID() ) 
	local BaseX = Obj :X()
	local BaseY = Obj :Y()
	local BaseZ = Obj :Z()
	local BaseDir = Obj:Dir()
	--Delobj( OwnerID() )
	Yell( OwnerID() , GetString("SC_111401_1") , 5)	                    ----你們是為了寶藏而來嗎？
	sleep(50)		
	Yell( OwnerID() , GetString("SC_111401_2") , 5)	                    ----我當初也是為了這個目的來挑戰霍克洛，但就如你現在看到的，我失敗了
	sleep(50)
	Yell( OwnerID() , GetString("SC_111401_3") , 5)	                    ----你們要小心他那可怕的火焰法術，並..........等等，我感到有股力量在接近
	sleep(20)			
	local boss = CreateObj(100998, BaseX  , BaseY, BaseZ, BaseDir -180, 1 )
	AddToPartition( boss , roomid3 )		
	WriteRoleValue( boss , EM_RoleValue_PID , 1 )
	BeginPlot( boss , "luaI_starboss1" , 0 )
	WriteRoleValue( boss , EM_RoleValue_HP , pid )
	SetAttack( boss , player_talk )
	SetPlot( boss ,"dead","lua_star_bossdead",500 )
	ScriptMessage( boss , -1 , 2 , GetString("SC_100998_8") , 1 )
	Yell( boss, GetString("SC_100998_8") , 5)	                      ----愚蠢的人們，霍克洛是沒有任何弱點的！
	sleep(30)
	ScriptMessage( boss , -1 , 2 , GetString("SC_100998_9") , 1 )
	Yell( boss, GetString("SC_100998_9") , 5)	                      ----為我效力吧！[遠古咒語] An' Sola  Vie' Ta  
	CastSpell( boss , boss, 491305)                   --------發狂
	sleep(50)
	Yell( OwnerID() , GetString("SC_111401_4") , 5)                  	----喔～不～你對我做了什麼？
	sleep(10)			
	local angry = LuaFunc_CreateObjByObj(100649 , OwnerID())
	SetAttack( angry , TargetID() )		
	SetPlot( angry ,"dead","lua_star_bossdead3",500 )  
	Delobj( OwnerID() )	
end