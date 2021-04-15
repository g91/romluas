--中控器	107853
--副本門	108489
--旗標		781386
--透明球	103408
--Boss		108601
--MobA_鯊卡汀	103421
--MobB_鯊魯曼	103422
--MobC_鯊酷拉	103423
--MobD_鯊鯊寶	103424

local Z32_bico_Boss6_MobTab = {}
local Z32_bico_Boss6_MobTab_DEAD = {}
local Z32_bico_Boss6_Mob_byBoss = {}

function lua_bico_169_Boss6_Ctrl()	--中控器的部分
	local ZoneID = ReadRoleValue( OwnerID(), EM_RoleValue_ZoneID )
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )
	local zone
	local skilltime = 0
	local MobFunTab = { "lua_bico_169_MobA_Ai", "lua_bico_169_MobB_Ai", "lua_bico_169_MobC_Ai", "lua_bico_169_MobD_Ai" }
	local Boss = ReadRoleValue( OwnerID(), EM_RoleValue_PID )
	if ZoneID == 169 or ZoneID == 938 then
		zone = 1 
	elseif ZoneID == 170 then
		zone = 2
	elseif ZoneID == 171 then
		zone = 3
	end	
	if zone == 1 then
		local Z32_bico_Boss6_Raid_MobID = { 103424, 103422, 103421, 103423 }	--Raid的小怪編號
		local R = DW_Ran(4)
		Z32_bico_Boss6_MobTab[ RoomID ] = {}
		for i=1, 4, 1 do
			local k = R()
			local x, y, z, dir = DW_Location( 781386, k )
			local Mob = CreateObj( Z32_bico_Boss6_Raid_MobID[i], x, y, z, dir, 1 )
			AddToPartition( Mob, RoomID )	
			table.insert( Z32_bico_Boss6_MobTab[ RoomID ], Mob )
			WriteRoleValue( Mob, EM_RoleValue_PID, i )
--			CallPlot( Mob, MobFunTab[i], 0 )
		end	
	elseif zone == 2 then
		local Z32_bico_Boss6_Normal_MobID = {  }				--Normal的小怪編號
		local R = DW_Ran(4)	
		Z32_bico_Boss6_MobTab[ RoomID ] = {}		
		for i=1, 4, 1 do
			local k = R()
			local x, y, z, dir = DW_Location( 781386, k )
			local Mob = CreateObj( Z32_bico_Boss6_Normal_MobID[i], x, y, z, dir, 1 )
			AddToPartition( Mob, RoomID )	
			table.insert( Z32_bico_Boss6_MobTab[ RoomID ], Mob )
			WriteRoleValue( Mob, EM_RoleValue_PID, i )
--			CallPlot( Mob, MobFunTab[i], 0 )
		end
	elseif zone == 3 then
		local Z32_bico_Boss6_Easy_MobID = {  }					--Easy的小怪編號
		local R = DW_Ran(4)	
		Z32_bico_Boss6_MobTab[ RoomID ] = {}			
		for i=1, 4, 1 do
			local k = R()
			local x, y, z, dir = DW_Location( 781386, k )
			local Mob = CreateObj( Z32_bico_Boss6_Easy_MobID[i], x, y, z, dir, 1 )
			AddToPartition( Mob, RoomID )
			table.insert( Z32_bico_Boss6_MobTab[ RoomID ], Mob )
			WriteRoleValue( Mob, EM_RoleValue_PID, i )
--			CallPlot( Mob, MobFunTab[i], 0 )	
		end
	end
	local Step = 1
--	local Mob_Buff = { 500275, 500276, 500277, 500278 }		
	Z32_bico_Boss6_MobTab_DEAD[ RoomID ] = { 0, 0, 0, 0 }
	Z32_bico_Boss6_Mob_byBoss[ RoomID ] = { 0, 0, 0, 0 }	
while true do	
	Sleep(10)
	if ( ReadRoleValue( Boss , EM_RoleValue_IsDead ) == 1 ) then
			local _backdoorID = ReadRoleValue( OwnerID() , EM_RoleValue_Register2 )
			local _frontdoorID = ReadRoleValue( OwnerID() , EM_RoleValue_Register1 )
			lua_bico_169_delSkillBall()
			for i=1 , 4 , 1 do
				DelObj( Z32_bico_Boss6_MobTab[ RoomID ][i] )
			end
			Z32_bico_Boss6_MobTab[ RoomID ] = {}

			DelObj( _frontdoorID );
			DelObj( _backdoorID );
			DelObj( OwnerID() );

			break;

	end

	skilltime = skilltime +1
	DebugMsg(0,0,"skilltime= "..skilltime )	
	if 
	Z32_bico_Boss6_MobTab_DEAD[ RoomID ][1] + 
	Z32_bico_Boss6_MobTab_DEAD[ RoomID ][2] + 
	Z32_bico_Boss6_MobTab_DEAD[ RoomID ][3] + 
	Z32_bico_Boss6_MobTab_DEAD[ RoomID ][4] >= 2 and Step == 1 then
		Step = 2
	elseif
	Z32_bico_Boss6_Mob_byBoss[ RoomID ][1] +
	Z32_bico_Boss6_Mob_byBoss[ RoomID ][2] + 
	Z32_bico_Boss6_Mob_byBoss[ RoomID ][3] +
	Z32_bico_Boss6_Mob_byBoss[ RoomID ][4] >= 4 and Step == 1 then
		Step = 2	
	end	
--	if Z32_bico_Boss6_MobTab_DEAD[ RoomID ][1] + Z32_bico_Boss6_MobTab_DEAD[ RoomID ][2] + Z32_bico_Boss6_MobTab_DEAD[ RoomID ][3] + Z32_bico_Boss6_MobTab_DEAD[ RoomID ][4] < 4 then	--如果小怪都死光了，就不跑這一段
--		for i = 1, 4, 1 do
--			if Z32_bico_Boss6_Mob_byBoss[ RoomID ][i] == 1 then
--				if CheckBuff( OwnerID(), Mob_Buff[i] ) then
--					AddBuff( OwnerID(), Mob_Buff[i], 0, -1 )
--				end
--			end
--		end
--	end		
	if Step == 1 then
		if skilltime % 17 == 0 then--礁岩束縛
			local Hate_table = KS_GetHateList( Boss, 1 )
			local R = DW_Ran(#Hate_table)	
			local k = R()
			AddBuff( Hate_table[k], 500325, 0, -1 )	--無法移動的buff
			sleep(5)
			local x, y, z, dir = DW_Location(Hate_table[k])
			local StonePoint = CreateObj( 103419, x, y, z, dir, 1 )
				SetModeEx( StonePoint , EM_SetModeType_Mark, true)
				SetModeEx( StonePoint , EM_SetModeType_HideName, true)
				SetModeEx( StonePoint , EM_SetModeType_NotShowHPMP, true)
				SetModeEx( StonePoint , EM_SetModeType_Obstruct, false)   	--阻擋
				SetModeEx( StonePoint , EM_SetModeType_Strikback, false) 	--反擊
				SetModeEx( StonePoint , EM_SetModeType_Move, false)	 	--移動	
				SetModeEx( StonePoint , EM_SetModeType_Fight, true) 		--可砍殺
				SetModeEx( StonePoint , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( StonePoint , EM_SetModeType_Searchenemy, false)
				SetModeEx( StonePoint , EM_SetModeType_Show, true)
				AddToPartition( StonePoint, RoomID )
				WriteRoleValue( StonePoint, EM_RoleValue_PID, Hate_table[k] )	--把玩家計在石頭上
				CallPlot( StonePoint, "lua_bico_169_Boss6_Stone", 0 )
				AddBuff( StonePoint, 500547, 0, -1 )	--特效buff
		end	
	end	
	if Step == 2 then
		if skilltime % 11 == 0 then--噴射水流
			local WaterDump = {}
			local WaterDump = Lua_CreateObjToRandownPos( OwnerID(), 103408, 3, 300, true)
				for i=1, #WaterDump, 1 do
					WriteRoleValue( WaterDump[i], EM_RoleValue_LiveTime, 7 )
					SetModeEx( WaterDump[i] , EM_SetModeType_Mark, false)
					SetModeEx( WaterDump[i] , EM_SetModeType_HideName, false)
					SetModeEx( WaterDump[i] , EM_SetModeType_ShowRoleHead, false)
					SetModeEx( WaterDump[i] , EM_SetModeType_NotShowHPMP, false)
					SetModeEx( WaterDump[i] , EM_SetModeType_Obstruct, false)   	--阻擋
					SetModeEx( WaterDump[i] , EM_SetModeType_Strikback, false) 	--反擊
					SetModeEx( WaterDump[i] , EM_SetModeType_Move, false)	 	--移動	
					SetModeEx( WaterDump[i] , EM_SetModeType_Fight, false) 		--可砍殺
					SetModeEx( WaterDump[i] , EM_SetModeType_SearchenemyIgnore, false) 
					SetModeEx( WaterDump[i] , EM_SetModeType_Searchenemy, false)
					SetModeEx( WaterDump[i] , EM_SetModeType_Show, true)
					CastSpell( WaterDump[i], WaterDump[i], 851627 )			--對透明物件噴射水流彈飛玩家
				end
		end
		if skilltime % 19 == 0 then--礁岩束縛
			local Hate_table = KS_GetHateList( Boss, 1 )
			local R = DW_Ran(#Hate_table)	
			local k = R()
			AddBuff( Hate_table[k], 500325, 0, -1 )	--無法移動的buff
			sleep(5)
			local x, y, z, dir = DW_Location(Hate_table[k])
			local StonePoint = CreateObj( 103419, x, y, z, dir, 1 )
				SetModeEx( StonePoint , EM_SetModeType_Mark, true)
				SetModeEx( StonePoint , EM_SetModeType_HideName, true)
				SetModeEx( StonePoint , EM_SetModeType_NotShowHPMP, true)
				SetModeEx( StonePoint , EM_SetModeType_Obstruct, false)   	--阻擋
				SetModeEx( StonePoint , EM_SetModeType_Strikback, false) 	--反擊
				SetModeEx( StonePoint , EM_SetModeType_Move, false)	 	--移動	
				SetModeEx( StonePoint , EM_SetModeType_Fight, true) 		--可砍殺
				SetModeEx( StonePoint , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( StonePoint , EM_SetModeType_Searchenemy, false)
				SetModeEx( StonePoint , EM_SetModeType_Show, true)
				AddToPartition( StonePoint, RoomID )
				WriteRoleValue( StonePoint, EM_RoleValue_PID, Hate_table[k] )	--把玩家計在石頭上
				CallPlot( StonePoint, "lua_bico_169_Boss6_Stone", 0 )
				AddBuff( StonePoint, 500547, 0, -1 )	--特效buff
		end
		if skilltime % 25 == 0 then--激浪滔滾
				CallPlot( OwnerID(), "lua_bico_169_waterwave", 0 )	
		end
	end
end
end

function lua_bico_169_Boss6_Stone()	--礁岩牢籠
	local NowHP = ReadRoleValue( OwnerID(), EM_RoleValue_HP )
	local MaxHP = ReadRoleValue( OwnerID(), EM_RoleValue_MaxHP )
	local PercentHP = (NowHP / MaxHP) * 100
	local StoneClip_click = 0
	while true do
		NowHP = ReadRoleValue( OwnerID(), EM_RoleValue_HP )
		PercentHP = (NowHP / MaxHP) * 100
		if PercentHP <= 60  and StoneClip_click == 0 then
			local StoneClip = Lua_CreateObjToRandownPos( OwnerID(), 103730, 2, 75, true)
			for i=1, #StoneClip, 1 do
				SetModeEx( StoneClip[i] , EM_SetModeType_NotShowHPMP, false)
				SetModeEx( StoneClip[i] , EM_SetModeType_Strikback, false) 	--反擊
				SetModeEx( StoneClip[i] , EM_SetModeType_Move, false)	 	--移動	
				SetModeEx( StoneClip[i] , EM_SetModeType_Fight, false) 		--可砍殺
				SetModeEx( StoneClip[i] , EM_SetModeType_Searchenemy, false)
				SetModeEx( StoneClip[i] , EM_SetModeType_Show, true)		
				SetPlot( StoneClip[i], "touch", "lua_bico_169_Boss6_Stone2", 20 )	
				SetCursorType( StoneClip[i] , eCursor_Pickup )
			end
			StoneClip_click = 1
			StoneClip = {}
		end
		sleep(10)
	end
end

function lua_bico_169_Boss6_Stone2()	--石頭的點擊獲取技能
	AddBuff( OwnerID(), 501542, 0, -1 )
	DelObj( TargetID() )
end

function lua_bico_169_Boss6_Ai()	--BossAI
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )
	local skilltime = 0
	local Step = 1
	local zone
	local ZoneID = ReadRoleValue( OwnerID(), EM_RoleValue_ZoneID )
	if ZoneID == 169 or ZoneID == 938 then
		zone = 1
	elseif ZoneID == 170 or ZoneID == 171 then
		zone = 2
	end
	local step2_MobSkillofBoss = { 1, 2, 3, 4 }
	local MobskillofBossTab = {}
	local TagCount = { 6, 3 }	--困難6人, 普通簡易3人
	local Fight_Click = 0
	local x, y, z, dir = DW_Location( 781386, 6 )
	local ObjTab = {}
	local Mob_Buff = { 500275, 500276, 500277, 500278 }

	local x, y, z, dir = DW_Location( 781386, 6 )
	local BackDoor = CreateObj( 108489, x, y, z, dir, 1 )
		SetModeEx( BackDoor , EM_SetModeType_Mark, false)
		SetModeEx( BackDoor , EM_SetModeType_HideName, false)
		SetModeEx( BackDoor , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( BackDoor , EM_SetModeType_Obstruct, true)   	--阻擋
		SetModeEx( BackDoor , EM_SetModeType_Strikback, false) 	--反擊
		SetModeEx( BackDoor , EM_SetModeType_Move, false)	 	--移動	
		SetModeEx( BackDoor , EM_SetModeType_Fight, false) 		--可砍殺
		SetModeEx( BackDoor , EM_SetModeType_SearchenemyIgnore, false) 
		SetModeEx( BackDoor , EM_SetModeType_Searchenemy, false)
		SetModeEx( BackDoor , EM_SetModeType_Show, true)
		AddToPartition( BackDoor, RoomID )	
		--table.insert( ObjTab, BackDoor )
		ObjTab._backdoorID = BackDoor;
	while true do
		sleep(10)
		--if ReadRoleValue( OwnerID(), EM_RoleValue_IsDead ) == 1 and Fight_Click == 1 then
		if ReadRoleValue( OwnerID(), EM_RoleValue_IsDead ) == 1 then
		--	CastSpell( OwnerID(), OwnerID(), 851630 )	--對自己施放隱形
			DelObj( ObjTab._frontdoorID )	--預設前門
			DelObj( ObjTab._ctrl )	--預設中控
			DelObj( ObjTab._backdoorID )	--預設後門
			lua_bico_169_delSkillBall()
			for i=1 , 4 , 1 do
				DelObj( Z32_bico_Boss6_MobTab[ RoomID ][i] )
			end
			Z32_bico_Boss6_MobTab[ RoomID ] = {}
			ObjTab	= {}
			Fight_Click = 0	
			skilltime = 0		
		end
		if HateListCount( OwnerID() ) ~= 0 then
			if Fight_Click == 0 then	
				local x, y, z, dir = DW_Location( OwnerID() )	--產生中控器
				local ctrl =  CreateObj( 107853, x, y, z, dir, 1 )
				SetModeEx( ctrl , EM_SetModeType_Mark, false)
				SetModeEx( ctrl , EM_SetModeType_HideName, false)
				SetModeEx( ctrl , EM_SetModeType_NotShowHPMP, false)
				SetModeEx( ctrl , EM_SetModeType_Obstruct, false)   	--阻擋
				SetModeEx( ctrl , EM_SetModeType_Strikback, false) 	--反擊
				SetModeEx( ctrl , EM_SetModeType_Move, false)	 	--移動	
				SetModeEx( ctrl , EM_SetModeType_Fight, false) 		--可砍殺
				SetModeEx( ctrl , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( ctrl , EM_SetModeType_Searchenemy, false)
				SetModeEx( ctrl , EM_SetModeType_Show, false)
				AddToPartition( ctrl, RoomID )
				--table.insert( ObjTab, ctrl )
				ObjTab._ctrl = ctrl;
				WriteRoleValue( ctrl, EM_RoleValue_PID, OwnerID() )
				BeginPlot( ctrl, "lua_bico_169_Boss6_Ctrl", 0 )
				WriteRoleValue( ctrl, EM_RoleValue_Register2 , BackDoor );	
				ScriptMessage( OwnerID() , -1 , 2 , "[SC_108601_01]" , 1 )
				local x, y, z, dir = DW_Location( 781386, 5 )	--產生前門
				local FrontDoor = CreateObj( 108489, x, y, z, dir, 1 )
				SetModeEx( FrontDoor , EM_SetModeType_Mark, false)
				SetModeEx( FrontDoor , EM_SetModeType_HideName, false)
				SetModeEx( FrontDoor , EM_SetModeType_NotShowHPMP, false)
				SetModeEx( FrontDoor , EM_SetModeType_Obstruct, true)   	--阻擋
				SetModeEx( FrontDoor , EM_SetModeType_Strikback, false) 	--反擊
				SetModeEx( FrontDoor , EM_SetModeType_Move, false)	 	--移動	
				SetModeEx( FrontDoor , EM_SetModeType_Fight, false) 		--可砍殺
				SetModeEx( FrontDoor , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( FrontDoor , EM_SetModeType_Searchenemy, false)
				SetModeEx( FrontDoor , EM_SetModeType_Show, true)
				AddToPartition( FrontDoor, RoomID )
				--table.insert( ObjTab, FrontDoor )
				ObjTab._frontdoorID = FrontDoor;
				WriteRoleValue( ctrl, EM_RoleValue_Register1, FrontDoor )
	--			CastSpell( OwnerID(), OwnerID(), 851630 )	--對自己施放隱形
				Fight_Click = 1
			end
		skilltime = skilltime + 1
			if Step == 1 then
				if skilltime % 7 == 0 and CheckBuff( OwnerID(), 620416 ) == true then
					CastSpell( OwnerID(), OwnerID(), 851630 )	--對自己施放隱形		
				end
				if skilltime % 45 == 0 then
					local Mob_LiveTab = {}
					for i=1, 4, 1 do	--把未死的小怪放進選擇區
						if ReadRoleValue( Z32_bico_Boss6_MobTab[ RoomID ][i], EM_RoleValue_IsDead ) == 0 then
							table.insert( Mob_LiveTab, Z32_bico_Boss6_MobTab[ RoomID ][i] )	
						end
					end
					local R_Mob = DW_Ran( #Mob_LiveTab )	--從選擇區找尋要被吞食的小怪
					local k = R_Mob()
					local num = ReadRoleValue( Mob_LiveTab[k],  EM_RoleValue_PID ) 
						AddBuff( Mob_LiveTab[k], 500325, 0, -1 )
						CastSpell( OwnerID(), Mob_LiveTab[k] ,851628 )
						sleep(5)
						KillID( OwnerID(), Mob_LiveTab[k] )
	--					Z32_bico_Boss6_MobTab_DEAD[ RoomID ][k] = 1	--表示被Boss吞食的小怪	
						AddBuff( OwnerID(), Mob_Buff[num], 0, -1 )	
				end
			end
			if Step == 2 then
				--say( OwnerID(), "Step2" )
				if skilltime % 9 == 0 then						--千瘡百孔
					local Hate_table = KS_GetHateList( OwnerID(), 1 )
					local R = DW_Ran(#Hate_table)	
					local T = R()
					CastSpell( OwnerID(), Hate_table[T], 851631 )
				end
				if skilltime % 30 == 0 then	--嗜血狂鯊
					yell(OwnerID(),"shark")
					local AllPlayerTab = SearchRangePlayer( OwnerID(), 400 )
					local BloodMakePlayerTab = {}
					for i = 0, #AllPlayerTab, 1 do
						if CheckBuff( AllPlayerTab[i], 500318 ) == true then	--血淋淋buff
						table.insert( BloodMakePlayerTab, AllPlayerTab[i] )
						end
					end
					local R = DW_Ran( #BloodMakePlayerTab )
					local T = R()
					CastSpell( OwnerID(), BloodMakePlayerTab[T], 851638 )		--嗜血狂鯊吞咬
					BloodMakePlayerTab = {}
					AllPlayerTab = {}		
				end
				if skilltime % 21 == 0 then
					for i = 1, 4, 1 do
						if CheckBuff( OwnerID(), Mob_Buff[i] ) == true then
						table.insert( MobskillofBossTab, step2_MobSkillofBoss[i] ) 
						end
					end
					local r = DW_Rand(#MobskillofBossTab)
					if MobskillofBossTab[r] == 1 then
						local a = DW_Rand(2)
						if a == 1 then
							CastSpell( OwnerID(), OwnerID(), 490853, 0 )
						else
							CastSpell( OwnerID(), OwnerID(), 490852, 0 )
						end
					elseif MobskillofBossTab[r] == 2 then
						local b = DW_Rand(2)	
						if b == 1 then
							local Hate_table = KS_GetHateList( OwnerID(), 1 )
							local R = DW_Ran(#Hate_table)	
							local Br = R()
							CastSpell( OwnerID(), Hate_table[Br], 490854 )
						else
						 	local Hate_table = KS_GetHateList( OwnerID(), 1 )
							local R = DW_Ran(#Hate_table)	
							local Br = R()
							local x, y, z, dir = DW_Location(Hate_table[Br])
							SetPos( OwnerID(), x, y, z, dir )
							CastSpell( OwnerID(), OwnerID(), 490855 )
						end			
					elseif MobskillofBossTab[r] == 3 then
						local c = DW_Rand(2)	
						local Hate_table = KS_GetHateList( OwnerID(), 1 )
						if c == 1 then
							CastSpell( OwnerID(), Hate_table[1], 851641 )
						else
							CastSpell( OwnerID(), Hate_table[1], 490857 )
						end				
					elseif MobskillofBossTab[r] == 4 then	
						local d = DW_Rand(2)	
						if d == 1 then
							CastSpell( OwnerID(), OwnerID(), 490859 )
						else
							local x, y, z, dir = DW_Location( OwnerID() )
							local rangePlayTab = KS_GetHateList( OwnerID(), 2 )
							for i = 1, #rangePlayTab, 1 do
								if CheckBuff( rangePlayTab[i], 500325 ) == true then	--把礁岩束縛的玩家移出最遠距離的table
								table.remove( rangePlayTab, rangePlayTab[i] )
								end
							end
							if #rangePlayTab > 1 then
							SetPos( rangePlayTab[1], x, y, z, dir )
							CastSpell( OwnerID(), rangePlayTab[1], 490858 )
							end
						end											
					end		
				end
				if skilltime % 30 == 0 then	--潮汐狂怒
					CastSpell( OwnerID(), OwnerID(), 490861 )
				end
				if skilltime % 480 == 0 then	--狂爆
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_108601_02]" , 1 )
					AddBuff( OwnerID() , 625441 , 0 , -1 )
				end
			end
		else
			if Fight_Click == 1  then
			--	CastSpell( OwnerID(), OwnerID(), 851630 )	--對自己施放隱形
				DelObj( ObjTab._frontdoorID )	--預設前門
				DelObj( ObjTab._ctrl )	--預設中控
				--DelObj( ObjTab._backdoorID )	--預設後門
				lua_bico_169_delSkillBall()
				for i=1 , 4 , 1 do
					DelObj( Z32_bico_Boss6_MobTab[ RoomID ][i] )
				end
				Z32_bico_Boss6_MobTab[ RoomID ] = {}
				ObjTab	= {}
				Fight_Click = 0	
				skilltime = 0
				Step = 1;
			end
		end
	end
end

function lua_bico_169_MobA_Ai()	--鯊鯊寶
local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )
local skilltime = 0
	while true do
		sleep(10)
		if HateListCount( OwnerID() ) ~= 0 then
			skilltime = skilltime + 1
			if skilltime % 11 == 0 then
				CastSpell( OwnerID(), OwnerID(), 490853 )
			end
			if skilltime % 18 == 0 then
				local r = DW_Ran( #Z32_bico_Boss6_MobTab[ RoomID ] )
				local k = r()		
				CastSpell( OwnerID(), Z32_bico_Boss6_MobTab[ RoomID ][k],  490852)
			end
		else
			skilltime = 0
		end	
	end
end

function lua_bico_169_MobB_Ai()	--鯊魯曼
local zone
local ZoneID = ReadRoleValue( OwnerID(), EM_RoleValue_ZoneID )
	if ZoneID == 169 or ZoneID == 938 then
		zone = 1
	elseif ZoneID == 170 or ZoneID == 171 then
		zone = 2
	end
local TagCount = { 6, 3 }	--困難6人, 普通簡易3人
local skilltime = 0
	while true do
		sleep(10)
		if HateListCount( OwnerID() ) ~= 0 then
			skilltime = skilltime + 1
			if skilltime % 12 == 0 then
				for i = 1, TagCount[zone], 1 do
					local Hate_table = KS_GetHateList( OwnerID(), 1 )
					local R = DW_Ran(#Hate_table)
					local k = R()
					CastSpell( OwnerID(), Hate_table[k], 490854 )
				end
			end
			if skilltime % 17 == 0 then
				 	local Hate_table = KS_GetHateList( OwnerID(), 1 )
					local R = DW_Ran(#Hate_table)	
					local k = R()
					local x, y, z, dir = DW_Location(Hate_table[k])
					SetPos( OwnerID(), x, y, z, dir )
					CastSpell( OwnerID(), OwnerID(), 490855 )
			end
		else
			skilltime = 0
		end
	end
end

function lua_bico_169_MobC_Ai()	--鯊卡汀
local skilltime = 0
local Hate_table = KS_GetHateList( OwnerID(), 1 )
	while true do
		sleep(10)
		if HateListCount( OwnerID() ) ~= 0 then
			skilltime = skilltime + 1			
			if skilltime % 8 == 0 then
			Hate_table = KS_GetHateList( OwnerID(), 1 )
				CastSpell( OwnerID(), Hate_table[1], 851641 )
			end
			if skilltime % 21 == 0 then
				CastSpell( OwnerID(), OwnerID(), 490857 )
			end	
		else
			skilltime = 0
		end		
	end
end

function lua_bico_169_MobD_Ai()	--鯊酷拉
local skilltime = 0
	while true do
		sleep(10)
		if HateListCount( OwnerID() ) ~= 0 then
			skilltime = skilltime + 1
			if skilltime %  7 == 0 then
				CastSpell( OwnerID(), OwnerID(), 490859 )
			end
			if skilltime % 10 == 0 then
				local x, y, z, dir = DW_Location( OwnerID() )
				local rangePlayTab = KS_GetHateList( OwnerID(), 2 )
				for i = 1, #rangePlayTab, 1 do
					if CheckBuff( rangePlayTab[i], 500325 ) == true then	--把礁岩束縛的玩家移出最遠距離的table
					table.remove( rangePlayTab, rangePlayTab[i] )
					end
				end 
				local Hate_table = KS_GetHateList( OwnerID(), 1 )
				for i = 1, #Hate_table, 1 do
					if CheckBuff( Hate_table[i], 500325 ) == true then		--把礁岩束縛的玩家移出最遠距離的table
					table.remove( Hate_table, Hate_table[i] )
					end
				end 
				if #rangePlayTab > 1 then
				AddBuff( rangePlayTab[1], 500336, 0, 1 )
				sleep(5)
				SetPos( rangePlayTab[1], x, y, z, dir )
				CastSpell( OwnerID(), rangePlayTab[1], 490858 )
				else
				AddBuff( Hate_table[1], 500336, 0, 1 )
				sleep(5)
				SetPos( Hate_table[1], x, y, z, dir )
				CastSpell( OwnerID(), Hate_table[1], 490858 )
				end
			end
		else
			skilltime = 0			
		end
	end
end

function lua_bico_169_Boss6_CancelBuff()
	If CheckBuff( OwnerID(), 501541 ) == true then
		CancelBuff( OwnerID(), 501541 )
	end
	CancelBuff( TargetID(), 501542 )
end

function lua_bico_169_waterwave()	--海浪的AI
     local LeftWater = {} 
     local RightWater = {} 
     local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID ) 
     local LeftWater = { 7, 9, 11 } 
     local RightWater = { 8, 10, 12 } 
     local Side_Ran = DW_Rand( 2 )       
     if Side_Ran == 1 then     --1: 左邊 ; 2: 右邊
     	local Left_Ran = DW_Ran( #LeftWater )
          	for i=0, 1, 1 do  
	               local k =Left_Ran() 
	               local water = CreateObjByFlag( 104530, 781386, LeftWater[k], 1 ) 
	               SetModeEx( water , EM_SetModeType_NotShowHPMP, false) 
	               SetModeEx( water , EM_SetModeType_Strikback, false)           --反擊 
	               SetModeEx( water , EM_SetModeType_Move, true)           --移動      
	               SetModeEx( water , EM_SetModeType_Fight, true)           --可砍殺 
	               SetModeEx( water , EM_SetModeType_Searchenemy, false) 
	               SetModeEx( water , EM_SetModeType_Show, true) 
	               AddToPartition( water, RoomID )           
	               WriteRoleValue( water, EM_RoleValue_LiveTime, 10 ) 
	               AddBuff( water, 501544, 0, -1 ) 
	               local end_Num = LeftWater[k] + 1 
	               CallPlot( water,"lua_bico_169_watermove",end_Num) 
          	end 
     else
	local Right_Ran = DW_Ran( #RightWater ) 
     	for i=0, 2, 1 do
	              local k =Right_Ran() 
              	local water = CreateObjByFlag( 104530, 781386, RightWater[k], 1 ) 
	              SetModeEx( water , EM_SetModeType_NotShowHPMP, false) 
	              SetModeEx( water , EM_SetModeType_Strikback, false)           --反擊 
	              SetModeEx( water , EM_SetModeType_Move, true)           --移動      
	              SetModeEx( water , EM_SetModeType_Fight, true)           --可砍殺 
	              SetModeEx( water , EM_SetModeType_Searchenemy, false) 
	              SetModeEx( water , EM_SetModeType_Show, true) 
              	AddToPartition( water, RoomID )           
              	WriteRoleValue( water, EM_RoleValue_LiveTime, 10 ) 
              	AddBuff( water, 501544, 0, -1 ) 
             	local end_Num = RightWater[k] - 1 
		CallPlot( water,"lua_bico_169_watermove",end_Num) 
	end 
     end 
end 

function lua_bico_169_watermove(end_Num)	--水流移動
     LuaFunc_MoveToFlag( OwnerID(), 781386, end_Num, 0 ) 
end

function lua_bico_169_delSkillBall()
	Lua_DavisDelObj( 103408 )
	Lua_DavisDelObj( 103419 )
	Lua_DavisDelObj( 104530 )
	Lua_DavisDelObj( 103730 )
	Lua_DavisDelObj( 104542 )
end

function lua_bico_169_Mob_DeadEvent()	--死亡
	local ZoneID = ReadRoleValue( OwnerID(), EM_RoleValue_ZoneID )
	local zone
	local BossIDTab = { 108601 }	--Raid, Normal, Easy
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )
	if ZoneID == 169 or ZoneID == 938 then
		zone = 1 
	elseif ZoneID == 170 then
		zone = 2
	elseif ZoneID == 171 then
		zone = 3
	end
	local PID = ReadRoleValue( OwnerID(), EM_RoleValue_PID )
	if ReadRoleValue( OwnerID(), EM_RoleValue_LastAttackTargetID ) == BossIDTab[zone] then
		ScriptMessage( OwnerID() , -1 , 2 , "[SC_108601_03]" , 1 )
		Z32_bico_Boss6_Mob_byBoss[ RoomID ][PID] = 1
		--say( OwnerID(), "I am killed by boss" )
	else
		Z32_bico_Boss6_Mob_byBoss[ RoomID ][PID] = 0
		Z32_bico_Boss6_MobTab_DEAD[ RoomID ][PID] =1
		ScriptMessage( OwnerID() , -1 , 2 , "[SC_108601_04]" , 1 )
		--say( OwnerID(), "I am killed by Player" )
	end
--	if Z32_bico_Boss6_MobTab_DEAD[ RoomID ][PID] ~= 1 then
--		Z32_bico_Boss6_MobTab_DEAD[ RoomID ][PID] =1
--	end
end

function lua_bico_169_851637()
	local x, y, z, dir = DW_Location( TargetID() )
	SysCastSpellLv_Pos( OwnerID(), x, y, z, 851637, 0 )
end

function lua_bico_169_stoneCancelBuff()
	local TarPlayer = ReadRoleValue( OwnerID(), EM_RoleValue_PID )
	CancelBuff( TarPlayer, 500325 )
end

function lua_bico_169_851630_CancelBuff()
	if CheckBuff( OwnerID(), 851630 ) == true then
		CancelBuff( OwnerID(), 851630 )
	end
end

function lua_bico_169_500539_AddBuff()
	AddBuff( OwnerID(), 500337, 0, -1 )
end

function lua_bico_169_delete104542()
		Lua_DavisDelObj( 104542 )
end