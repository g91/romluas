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
							Say( OwnerID() , GetString("SC_100998_1") )	----�N�J���S�X�޲����L��
							sleep(20)
							CastSpell( OwnerID() , partymember[i] , 491308) 	 -----�k�O�y��						
							sleep(10)							
						end
					end
					ScriptMessage( OwnerID() , -1 , 2 , GetString("SC_100998_2") , 1 )
					Say( OwnerID() , GetString("SC_100998_2") )  ----�N���A��!!
					sleep(10)
					CastSpell( OwnerID() , TargetID() , 490643)			  ----���K�z���N
					sleep(10)
					counter1 = 0
				end
				if counter2 == 8 then 
					ScriptMessage( OwnerID() , -1 , 2 , GetString("SC_100998_3") , 1 )
					Say( OwnerID() , GetString("SC_100998_3") )   ----�A�̨S���ӧQ�����|!!
					sleep(20)
					CastSpell( OwnerID() , OwnerID() , 491129) 	--������
					counter2 = 0
					sleep(10)					
				end	
				if counter3 == 23 then 
				    ScriptMessage( OwnerID() , -1 , 2 , GetString("SC_100998_4") , 1 )
					Say( OwnerID() , GetString("SC_100998_4") )   ----���㪺���K!!
					sleep(20)
					CastSpell( OwnerID() , OwnerID() ,  492016) --���B
					SetFightMode ( OwnerID(),1, 0, 0,1 )
					counter3 = 0
					sleep(30)	
					SetFightMode ( OwnerID(),1, 1, 1,1 )				
				end	
				if HPPercent <= 50 and ReadRoleValue( OwnerID() , EM_RoleValue_PID  ) == 0  then                   ----�I��L�Ĩg��								
					WriteRoleValue( OwnerID() , EM_RoleValue_PID , 1 )
					ScriptMessage( OwnerID() , -1 , 2 , GetString("SC_100998_5") , 1 )
					Say( OwnerID() , GetString("SC_100998_5") )            ----�N�J���o�X��q!!					
					--CastSpell(OwnerID() , OwnerID() , 491306)    	----�L��
					--sleep(20)
					AddBuff(OwnerID(), 502092 , 0 , 20 )
					CastSpell(OwnerID() , OwnerID() , 491123) 	-----�w�Y��V
					sleep(20)
					local NowHP1 = ReadRoleValue( OwnerID() , EM_RoleValue_HP )
					ScriptMessage( OwnerID() , -1 , 2 , GetString("SC_100998_6") , 1 )
					Say( OwnerID() , GetString("SC_100998_6") )   ----�A�̪���O�u���o��?�u�O�ڥ����!
					sleep(20)
					ScriptMessage( OwnerID() , -1 , 2 , GetString("SC_100998_7") , 1 )
					Say( OwnerID() , GetString("SC_100998_7") )   ----�Q�~�ꥢ�Ѫ����d�N�յۧ��ڧa�A������!
					CastSpell( OwnerID() , OwnerID() , 491305)
					sleep(40)
					local RoomNumber = Rand(98)
					local modeNumber = Rand(98)
					--local modeNumber = 70	-----������				
					local artifact = 0
					local man = 0	
					local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
					if RoomNumber < 33 and RoomNumber >= 0 then                                          ----Room 1							
						--artifact = lua_star_Create(OwnerID() , NowHP , 111396 , 0)										
						SetPos( OwnerID(), 2638.8,16.5,2194.4, 235 )                                     ----�O�h��
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
						SetPos( OwnerID(), 2350.3,16.1,1872.5, 235 )                                      ----�t���̩�
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
						SetPos( OwnerID(), 316.6,16.1,2243.5, 235 )                                        ----���~�v��
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
	Yell( OwnerID() , GetString("SC_111401_1") , 5)	                    ----�A�̬O���F�_�æӨӶܡH
	sleep(50)		
	Yell( OwnerID() , GetString("SC_111401_2") , 5)	                    ----�ڷ��]�O���F�o�ӥت��ӬD���N�J���A���N�p�A�{�b�ݨ쪺�A�ڥ��ѤF
	sleep(50)
	Yell( OwnerID() , GetString("SC_111401_3") , 5)	                    ----�A�̭n�p�ߥL���i�Ȫ����K�k�N�A��..........�����A�ڷP�즳�ѤO�q�b����
	sleep(20)			
	local boss = CreateObj(100998, BaseX  , BaseY, BaseZ, BaseDir -180, 1 )
	AddToPartition( boss , roomid3 )		
	WriteRoleValue( boss , EM_RoleValue_PID , 1 )
	BeginPlot( boss , "luaI_starboss1" , 0 )
	WriteRoleValue( boss , EM_RoleValue_HP , pid )
	SetAttack( boss , player_talk )
	SetPlot( boss ,"dead","lua_star_bossdead",500 )
	ScriptMessage( boss , -1 , 2 , GetString("SC_100998_8") , 1 )
	Yell( boss, GetString("SC_100998_8") , 5)	                      ----�M�����H�̡A�N�J���O�S������z�I���I
	sleep(30)
	ScriptMessage( boss , -1 , 2 , GetString("SC_100998_9") , 1 )
	Yell( boss, GetString("SC_100998_9") , 5)	                      ----���ڮĤO�a�I[���j�G�y] An' Sola  Vie' Ta  
	CastSpell( boss , boss, 491305)                   --------�o�g
	sleep(50)
	Yell( OwnerID() , GetString("SC_111401_4") , 5)                  	----��㤣��A��ڰ��F����H
	sleep(10)			
	local angry = LuaFunc_CreateObjByObj(100649 , OwnerID())
	SetAttack( angry , TargetID() )		
	SetPlot( angry ,"dead","lua_star_bossdead3",500 )  
	Delobj( OwnerID() )	
end