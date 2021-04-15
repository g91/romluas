----	旗標與物件	----
--781365	旗標
--106952	破碎的物體
--108329	中控器


--108276	Raid_阿度爾
--108277	Raid_血牙
--108290	Raid_瘋眼
--106791	特效透明球_吃跟boss相同素質

--103386	N_阿度爾_特效透明球
--103387	N_阿度爾
--103388	N_血牙
--103389	N_瘋眼

--103390	EZ_阿度爾_特效透明球
--103391	EZ_阿度爾
--103392	EZ_血牙
--103393	EZ_瘋眼

--106876	門(啤酒桶)
	--0	Boss出生點
	--1	血牙出生點
	--2	瘋眼出生點
	--3	後門出生點
	--4	前門出生點

----	基本法術與法術集合	----

local Z29_bico_Boss1_Fight_Click = {}
local Z29_bico_Boss1_Bloodtaste_Table = {}

function bico_Z29_Boss1_Ctrl()
local Ctrl = OwnerID()
local BossNPC = { 108276,103387,103391 }	--Raid,N,EZ
local Mob_BloodNPC = { 108277,103388,103392 }	--Raid,N,EZ
local Mob_CrazyNPC = { 108290,103389,103393}	--Raid,N,EZ
local ViolentTime = { 480, 360 }
local ZoneID = ReadRoleValue( Ctrl, EM_RoleValue_ZoneID )
local RoomID = ReadRoleValue( Ctrl, EM_RoleValue_RoomID )
local zone
	if ZoneID == 163 then		--hard
		zone =1
	elseif ZoneID == 164 then	--normal
		zone = 2
	elseif ZoneID == 165 then	--easy
		zone = 3
	elseif ZoneID == 938 then	--測試區
		zone =1	
	end
local Time
	if ZoneID == 163 then		--hard	8分鐘狂暴
		Time =1
	elseif ZoneID == 164 then	--normal   6分鐘狂暴
		Time = 2
	elseif ZoneID == 938 then	--測試區
		Time =1
	end
local ViolentTiming = 0
local Door_Front
local Door_Front_Click = 0	--前門開關, 開=0, 關=1
Z29_bico_Boss1_Fight_Click[RoomID] = 0		--戰鬥開關, 非戰鬥=0, 戰鬥=1
Z29_bico_Boss1_Bloodtaste_Table[RoomID] = {}

--初始狀態--
	local x, y, z, dir = DW_Location( 781365, 0 )			--根據旗子位置產生 [Boss]
	local Boss = CreateObj( BossNPC[zone], x, y, z, dir, 1 )
--	SetModeEx( Boss, EM_SetModeType_Move, false)		--移動(不可)	--測試用
	AddToPartition( Boss, RoomID )					
	
	local  x, y, z, dir = DW_Location( 781365, 1 )			--根據旗子位置產生 [血牙]
	local Mob_Blood = CreateObj( Mob_BloodNPC[zone], x, y, z, dir, 1 )
	AddToPartition( Mob_Blood, RoomID )	
	WriteRoleValue( Boss, EM_RoleValue_Register1, Mob_Blood )
	WriteRoleValue( Mob_Blood, EM_RoleValue_PID, Boss )	
	AddBuff(Mob_Blood,625092,0,-1)
	
	local  x, y, z, dir = DW_Location( 781365, 2 )			--根據旗子位置產生 [瘋眼]
	local Mob_Crazy = CreateObj( Mob_CrazyNPC[zone], x, y, z, dir, 1 )
	AddToPartition( Mob_Crazy, RoomID )
	WriteRoleValue( Boss, EM_RoleValue_Register2, Mob_Crazy )	
	WriteRoleValue( Mob_Crazy, EM_RoleValue_PID, Boss )
	WriteRoleValue( Mob_Crazy, EM_RoleValue_Register1, Mob_Blood )
	AddBuff(Mob_Crazy,625092,0,-1)	
	AddBuff(Mob_Crazy,625093,0,-1)		
	
	local  x, y, z, dir = DW_Location( 781365, 3 )			--根據旗子位置 [產生後門]
	local Door_Back = CreateObj( 106876, x, y, z, dir, 1 )
	SetModeEx( Door_Back, EM_SetModeType_Mark, false)		--標記(不可)
	SetModeEx( Door_Back, EM_SetModeType_HideName, false)	--名字(隱藏)
	SetModeEx( Door_Back, EM_SetModeType_NotShowHPMP, false)	--血條(不秀)
	SetModeEx( Door_Back, EM_SetModeType_Strikback, false)	--反擊(不可)
	SetModeEx( Door_Back, EM_SetModeType_Move, false)		--移動(不可)
	SetModeEx( Door_Back, EM_SetModeType_Fight, false)		--砍殺(不可)
	SetModeEx( Door_Back, EM_SetModeType_Searchenemy, false)	--索敵(不可)
	SetModeEx( Door_Back, EM_SetModeType_Obstruct, true)		--阻擋(可)
	AddToPartition( Door_Back, RoomID )
	
	local gg=DW_Ran(36);
	for i=1 ,2,1 do	
		local R = DW_Ran(8)
		local x,y,z,dir = DW_Location(Ctrl)	
		local Nx,Ny,Nz,Ndir = DW_NewLocation(gg()*10,DW_Rand(6)*15,x,y,z,dir)
		local stone = CreateObj( 106952, Nx, Ny, Nz, Ndir, 1 )
			SetModeEx( stone, EM_SetModeType_Fight, false )
			SetModeEx( stone, EM_SetModeType_Move, false )
			SetModeEx( stone, EM_SetModeType_NotShowHPMP, false )
			SetModeEx( stone, EM_SetModeType_Strikback, false)	--反擊(不可)
			SetModeEx( stone, EM_SetModeType_Move, false)		--移動(不可)
			SetModeEx( stone, EM_SetModeType_Fight, false)		--砍殺(不可)
			SetModeEx( stone, EM_SetModeType_Searchenemy, false)	--索敵(不可)
	--		SetModeEx( stone, EM_SetModeType_Obstruct, false)		--阻擋(可)
			SetModeEX( stone, EM_SetModeType_Gravity, true)	--重力
			SetPlot(stone,"collision","bico_Z29_106952_collision",0)
		AddToPartition( stone, RoomID )
	end

--循環AI區--
	while 1 do
		sleep(10)

		--Boss死亡--
		if (ReadRoleValue( Boss, EM_RoleValue_IsDead ) == 1 )then--and  ReadRoleValue( Mob_Blood, EM_RoleValue_IsDead ) == 1 and ReadRoleValue( Mob_Crazy, EM_RoleValue_IsDead ) == 1) or ( CheckID( Boss ) == false ) then 
			DebugMsg( 0 , 0 , "Boss is dead !!" );
			ScriptMessage( Boss, -1, 2, "[SC_108276_03]", 0 )	--BOSS死亡字串
			DelObj( Mob_Blood );
			DelObj( Mob_Crazy );
			Lua_DavisDelObj( 106952 );--清除破碎的物體
			DelObj( Door_Back )	--開啟後門
			DelObj( Door_Front )	--開啟前門	
			Z29_bico_Boss1_Fight_Click[RoomID] = nil
			Z29_bico_Boss1_Bloodtaste_Table[RoomID] = nil
			Lua_DavisDelObj( 106952 ) 
			break
		end	


		--Boss仇恨表非0, 表示開戰--
		if HateListCount( Boss ) ~= 0 then						--Boss仇恨表內有人(戰鬥開始)d
			--開戰--
			if Z29_bico_Boss1_Fight_Click[RoomID] == 0 then							--初始戰鬥開關如果為0
				BeginPlot( Boss, "bico_Z29_Boss1_Ai", 0 )				--執行BossAiScript
				BeginPlot( Mob_Blood, "bico_Z29_Boss1_Blood_Ai", 0 )		--執行血牙AiScript
				BeginPlot( Mob_Crazy, "bico_Z29_Boss1_Crazy_Ai", 0 )		--執行瘋眼AiScript
									
				if Door_Front_Click == 0 then					--前門開關如果為0
					local  x, y, z, dir = DW_Location( 781365, 4 )		--根據旗子位置 [產生前門]
					Door_Front = CreateObj( 106876, x, y, z, dir, 1 )
					SetModeEx( Door_Front, EM_SetModeType_Mark, false )			--標記(不可)
					SetModeEx( Door_Front, EM_SetModeType_HideName, false )		--名字(隱藏)
					SetModeEx( Door_Front, EM_SetModeType_NotShowHPMP, false )	--血條(不秀)
					SetModeEx( Door_Front, EM_SetModeType_Strikback, false )		--反擊(不可)
					SetModeEx( Door_Front, EM_SetModeType_Move, false )			--移動(不可)
					SetModeEx( Door_Front, EM_SetModeType_Fight, false )			--砍殺(不可)
					SetModeEx( Door_Front, EM_SetModeType_Searchenemy, false )		--索敵(不可)
					SetModeEx( Door_Front, EM_SetModeType_Obstruct, true )		--阻擋(可)
					AddToPartition( Door_Front, RoomID )	
					Door_Front_Click = 1						--前門開關進入戰鬥後, 設定為1
				end

				Z29_bico_Boss1_Fight_Click[RoomID] = 1								--戰鬥開關ON
			end

			--狂暴機制
			ViolentTiming = ViolentTiming + 1
			if ViolentTiming == ViolentTime[Time] then
				ScriptMessage( Boss, -1, 2, "[SC_108276_04]", 0 )	--狂暴字串
				AddBuff(Boss, 625097,0,-1)
			end
		end
		--Boss仇恨表為0, 1: 滅團; 2: Boss死亡--
		if HateListCount( Boss ) == 0 then						--Boss仇恨表內無人(滅團)
			--滅團--
			if ReadRoleValue( Boss, EM_RoleValue_IsDead ) == 0 and CheckID( Boss ) == true then		--Boss沒有死亡的狀況下
				if Door_Front_Click == 1 then
					DebugMsg( 0 , 0 , "Players are dead !!" );
					ScriptMessage( Boss, -1, 2, "[SC_108276_02]", 0 )	--滅團字串
	--				DelObj(Door_Back)	--刪除後門 (測試方便用)	
					Lua_DavisDelObj( 106952 );--清除破碎的物體
					DelObj(Door_Front)	--刪除前門	
					Door_Front_Click = 0	--重製前門開關狀態為0
				end
				if Z29_bico_Boss1_Fight_Click[RoomID] == 1 then
					DelObj( Boss )
					DelObj( Mob_Blood )
					DelObj( Mob_Crazy )
					Lua_DavisDelObj( 106952 ) 
					local x, y, z, dir = DW_Location( 781365, 0 )			--根據旗子位置產生 [Boss]
					Boss = CreateObj( BossNPC[zone], x, y, z, dir, 1 )
	--				SetModeEx( Boss, EM_SetModeType_Move, false)			--移動(不可)	--測試用
					AddToPartition( Boss, RoomID )	
					local  x, y, z, dir = DW_Location( 781365, 1 )			--根據旗子位置產生 [血牙]
					Mob_Blood = CreateObj( Mob_BloodNPC[zone], x, y, z, dir, 1 )
					AddToPartition( Mob_Blood, RoomID )	
					WriteRoleValue( Boss, EM_RoleValue_Register1, Mob_Blood )
					WriteRoleValue( Mob_Blood, EM_RoleValue_PID, Boss )	
					AddBuff(Mob_Blood,625092,0,-1)		
					local  x, y, z, dir = DW_Location( 781365, 2 )			--根據旗子位置產生 [瘋眼]
					Mob_Crazy = CreateObj( Mob_CrazyNPC[zone], x, y, z, dir, 1 )
					AddToPartition( Mob_Crazy, RoomID )
					WriteRoleValue( Boss, EM_RoleValue_Register2, Mob_Crazy )	
					WriteRoleValue( Mob_Crazy, EM_RoleValue_PID, Boss )
					WriteRoleValue( Mob_Crazy, EM_RoleValue_Register1, Mob_Blood )	
					AddBuff(Mob_Crazy,625092,0,-1)	
					AddBuff(Mob_Crazy,625093,0,-1)	
		
					local gg=DW_Ran(36);
					for i=1 ,2,1 do	
						local R = DW_Ran(8)
						local x,y,z,dir = DW_Location(Ctrl)	
						local Nx,Ny,Nz,Ndir = DW_NewLocation(gg()*10,DW_Rand(6)*15,x,y,z,dir)
						local stone = CreateObj( 106952, Nx, Ny, Nz, Ndir, 1 )
							SetModeEx( stone, EM_SetModeType_Fight, false )
							SetModeEx( stone, EM_SetModeType_Move, false )
							SetModeEx( stone, EM_SetModeType_NotShowHPMP, false )
							SetModeEx( stone, EM_SetModeType_Strikback, false)	--反擊(不可)
							SetModeEx( stone, EM_SetModeType_Move, false)		--移動(不可)
							SetModeEx( stone, EM_SetModeType_Fight, false)		--砍殺(不可)
							SetModeEx( stone, EM_SetModeType_Searchenemy, false)	--索敵(不可)
						--	SetModeEx( stone, EM_SetModeType_Obstruct, false)		--阻擋(可)
							SetModeEX( stone, EM_SetModeType_Gravity, true)	--重力
							SetPlot(stone,"collision","bico_Z29_106952_collision",0)
						AddToPartition( stone, RoomID )
					end				
				Z29_bico_Boss1_Fight_Click[RoomID] = 0	
				Z29_bico_Boss1_Bloodtaste_Table[RoomID] = {}	
				end
			end
			--[[
			--Boss死亡--搬到前面去
			if (ReadRoleValue( Boss, EM_RoleValue_IsDead ) == 1 and  ReadRoleValue( Mob_Blood, EM_RoleValue_IsDead ) == 1 and ReadRoleValue( Mob_Crazy, EM_RoleValue_IsDead ) == 1) or ( CheckID( Boss ) == false ) then 
				DebugMsg( 0 , 0 , "Boss is dead !!" );
				ScriptMessage( Boss, -1, 2, "[SC_108276_03]", 0 )	--BOSS死亡字串
				Lua_DavisDelObj( 106952 );--清除破碎的物體
				DelObj( Door_Back )	--開啟後門
				DelObj( Door_Front )	--開啟前門	
				Z29_bico_Boss1_Fight_Click[RoomID] = nil
				Z29_bico_Boss1_Bloodtaste_Table[RoomID] = nil
				Lua_DavisDelObj( 106952 ) 
				break
			end	
			]]--		
		end
	end
end

function bico_Z29_Boss1_Ai()
	local Boss = OwnerID()
	local RoomID = ReadRoleValue( Boss, EM_RoleValue_RoomID )
	local SkillTime = 0		--技能計時器
	local BossFightTime = 0		--狂暴計時器
	local SkillTable = {	851348,
				851349;	};
	local Hate_table = KS_GetHateList( Boss, 1 )
	local Mob_Blood = ReadRoleValue( Boss, EM_RoleValue_Register1 )
	local Mob_Crazy = ReadRoleValue( Boss, EM_RoleValue_Register2 )
	local TarGID
	local WolfNum = 2
	ScriptMessage( Boss, -1, 2, "[SC_108276_01]", 0 )	--開場字串
	DebugMsg( 0 , 0 , "Let's Party !!" );
	while 1 do
		sleep(10)
		if Z29_bico_Boss1_Fight_Click[RoomID] == 1 then
				SkillTime = SkillTime + 1
	---------------狼錘投擲
				if SkillTime % 9 == 0 then			--狼鎚投擲
					while ReadRoleValue( Boss, EM_RoleValue_SpellMagicID ) ~= 0 do --檢查還有沒有在施法
					sleep(2)
					end
					Hate_table = KS_GetHateList( Boss, 1 )
					RandPlayer = Rand( #Hate_table )
					TarGID = HateListInfo( Boss, RandPlayer, EM_HateListInfoType_GItemID )	--仇恨表內隨機目標
					ScriptMessage( Boss, -1, 2, "[SC_108276_06]".."|cffff0000" ..GetName(TarGID).. "|r" , 0 )	--[狼錘投擲]的目標為
					sleep(30)
					CastSpellLV( Boss, TarGID, SkillTable[1], 0 )	
				end
	----------------碎地擊
				if SkillTime % 11 == 0 then			--碎地擊
					while ReadRoleValue( Boss, EM_RoleValue_SpellMagicID ) ~= 0 do --檢查還有沒有在施法
					sleep(2)
					end
					CastSpellLV( Boss, Boss, SkillTable[2], 0 )
					local x, y, z, dir = DW_Location( Boss )
					local Stone = CreateObj( 106952, x, y, z, dir, 1 )
					SetModeEx( Stone, EM_SetModeType_Fight, false )
					SetModeEx( Stone, EM_SetModeType_Move, false )
					SetModeEx( Stone, EM_SetModeType_NotShowHPMP, false )
					SetModeEx( Stone, EM_SetModeType_Strikback, false)	--反擊(不可)
					SetModeEx( Stone, EM_SetModeType_Move, false)		--移動(不可)
					SetModeEx( Stone, EM_SetModeType_Fight, false)		--砍殺(不可)
					SetModeEx( Stone, EM_SetModeType_Searchenemy, false)	--索敵(不可)
			--		SetModeEx( Stone, EM_SetModeType_Obstruct, false)		--阻擋(可)
					SetModeEX( Stone, EM_SetModeType_Gravity, true)	--重力
					AddToPartition( Stone, RoomID )
					
				end
	----------------野蠻血性機制(狼死了永久疊加)
				local Blood_Boss_Dis = CheckDistance( Mob_Blood, Boss, 100 )	--血牙距離Boss100碼內，給予Boss一層野蠻血性
				local Crazy_Blood_Dis = CheckDistance( Mob_Crazy, Boss, 100)	--瘋眼距離Boss100碼內，給予Boss一層野蠻血性
				if ReadRoleValue( Mob_Blood, EM_RoleValue_IsDead ) == 1 and ReadRoleValue( Mob_Crazy, EM_RoleValue_IsDead ) == 0 then
					WolfNum = 1
				end
				if ReadRoleValue( Mob_Blood, EM_RoleValue_IsDead ) == 0 and ReadRoleValue( Mob_Crazy, EM_RoleValue_IsDead ) == 1 then
					WolfNum = 1
				end
				if ReadRoleValue( Mob_Blood, EM_RoleValue_IsDead ) == 1 and ReadRoleValue( Mob_Crazy, EM_RoleValue_IsDead ) == 1 then
					WolfNum = 0
				end
				if WolfNum == 2 then
					if Blood_Boss_Dis == True and Crazy_Blood_Dis == true then
						AddBuff( Boss, 625083, 1, -1 )
					elseif Blood_Boss_Dis == True and Crazy_Blood_Dis == FALSE then
						AddBuff( Boss, 625083, 0, -1 )
					elseif Blood_Boss_Dis == FALSE and Crazy_Blood_Dis == true then		
						AddBuff( Boss, 625083, 0, -1 )
					elseif Blood_Boss_Dis == FALSE and Crazy_Blood_Dis == FALSE then
						CancelBuff( Boss, 625083 )
					end		
				end
				if WolfNum == 1 then
					if Blood_Boss_Dis == True and Crazy_Blood_Dis == FALSE then
						AddBuff( Boss, 625083, 1, -1 )
					elseif Blood_Boss_Dis == FALSE and Crazy_Blood_Dis == true then		
						AddBuff( Boss, 625083, 1, -1 )
					elseif Blood_Boss_Dis == FALSE and Crazy_Blood_Dis == FALSE then
						AddBuff( Boss, 625083, 0, -1 )
					end
				end
				if WolfNum == 0 then
					AddBuff( Boss, 625083, 1, -1 )
				end

				local _hpUnder5Percent = ReadRoleValue( Boss , EM_RoleValue_HP )/ReadRoleValue( Boss , EM_RoleValue_MaxHP ) < 0.05;
				local _summonBlood= CheckDistance( Mob_Blood, Boss, 300 ) or _hpUnder5Percent;--血牙超過Boss300碼，或低於5%血 招回身邊
				local _summonCrazy = CheckDistance( Mob_Crazy, Boss, 300) or _hpUnder5Percent;--瘋眼超過Boss300碼，或低於5%血 招回身邊

				if ( _summonBlood ) then
					local x,y,z,dir = DW_Location( Boss );
					Move( Mob_Blood , x,y,z );	
				end

				if ( _summonCrazy ) then
					local x,y,z,dir = DW_Location( Boss );
					Move( Mob_Crazy , x,y,z );
				end

		else
			DebugMsg( 0 , 0 , "Loop break !!" );
			break;
		end
	end
	DebugMsg( 0 , 0 , "Out of loop !!" );
end

function bico_Z29_Boss1_Blood_Ai()
	local Bloodwolf = OwnerID()
	local SkillTable = { 851350, 851351 }	--開放性撕咬, 恐懼嚎叫
	local SkillTime = 0
	local Boss = ReadRoleValue( Bloodwolf, EM_RoleValue_PID )
	local Blood_Boss_Dis = CheckDistance( Bloodwolf, Boss, 100 )
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )
	while 1 do
		sleep(10)
		if Z29_bico_Boss1_Fight_Click[RoomID] == 1 then
			SkillTime = SkillTime + 1
			local Hate_table = KS_GetHateList( Bloodwolf, 1 )
	---------------開放性撕咬的施放
			if SkillTime % 7 == 0 then	--施放開放性撕咬
				while ReadRoleValue( Boss, EM_RoleValue_SpellMagicID ) ~= 0 do --檢查還有沒有在施法
				sleep(2)
				end
				Hate_table = KS_GetHateList( Bloodwolf, 1 )
				if #Hate_table ==1 then
					CastSpell( Bloodwolf, Hate_table[1], 851350)	
				else
					if #Hate_table > 1 then
						local r = DW_Rand(#Hate_table)
						CastSpell( Bloodwolf, Hate_table[r], 851350)				
					end
				end	
			end 
	----------------恐懼嚎叫的施放
			if SkillTime % 13 == 0 then	--施放恐懼嚎叫
				while ReadRoleValue( Boss, EM_RoleValue_SpellMagicID ) ~= 0 do --檢查還有沒有在施法
				sleep(2)
				end
				local Hate_table = KS_GetHateList( Bloodwolf, 1 )
				local r = DW_Rand(#Hate_table)
				CastSpellLV( Bloodwolf,Hate_table[r] , 851351, 0 )	
			end
		end
	end
end

function bico_Z29_Boss1_Crazy_Ai()
	local Crazywolf = OwnerID()
	local Bloodwolf = ReadRoleValue( Crazywolf, EM_RoleValue_Register1 )
	local SkillTime = 0
	local Boss = ReadRoleValue( Crazywolf, EM_RoleValue_PID )
	local DisTable = { 100, 150 }
	local Crazy_Boss_Dis = CheckDistance( Crazywolf, Boss, DisTable[1] )
	local Crazy_Blood_Dis = CheckDistance( Crazywolf, Bloodwolf, DisTable[2] )
	local BuffLv = FN_CountBuffLevel( Boss, 625083 )
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )

	while 1 do
	sleep(10)
	-----------------血腥味的目標判斷
		if #Z29_bico_Boss1_Bloodtaste_Table[RoomID] ~= 0 then
			if CheckBuff( Crazywolf,508172 ) == false then
				AddBuff(Crazywolf,508172,0,-1)		--上強制目標的buff
				SetAttack( Crazywolf, Z29_bico_Boss1_Bloodtaste_Table[RoomID][1] )
				ScriptMessage( Boss, -1, 2, "[SC_108276_05]".."|cffff0000" ..GetName(Z29_bico_Boss1_Bloodtaste_Table[RoomID][1]).. "|r" , 0 )	--瘋眼的目標轉為
			end
			if CheckBuff(Z29_bico_Boss1_Bloodtaste_Table[RoomID][1], 625091) == false then--當目標不血腥了 則另尋目標
				table.remove(Z29_bico_Boss1_Bloodtaste_Table[RoomID], 1)
				CancelBuff(Crazywolf,508172)--放手~~放手~~不要再執著了~~
			end
		else
			if CheckBuff(Crazywolf,508172) == true then
				CancelBuff(Crazywolf,508172)
			end
		end
	----------------恐懼嚎叫的施放
		SkillTime = SkillTime + 1
		if SkillTime % 13 == 0 then	--施放恐懼嚎叫
			while ReadRoleValue( Boss, EM_RoleValue_SpellMagicID ) ~= 0 do --檢查還有沒有在施法
				sleep(2)
			end
			if CheckBuff( Crazywolf, 508172 ) == true then
				CastSpellLV( Crazywolf,Z29_bico_Boss1_Bloodtaste_Table[RoomID][1] , 851351, 0 )
			else
				local Hate_table = KS_GetHateList( Boss, 1 )
				local r = DW_Rand(#Hate_table)
				CastSpellLV( Crazywolf,Hate_table[r] , 851351, 0 )			
			end
		end
	-----------------雙狼共鳴機制	
		Crazy_Blood_Dis = CheckDistance( Crazywolf, Bloodwolf, DisTable[2] )	--與血牙距離200，施放雙狼共鳴
		if Crazy_Blood_Dis == True  then
			AddBuff( Crazywolf, 625087, 0, -1 )
			AddBuff( Bloodwolf, 625087, 0, -1 )
		else
			if  Crazy_Blood_Dis == FALSE then
				CancelBuff( Crazywolf, 625087 )
				CancelBuff( Bloodwolf, 625087 )
			end
		end
	----------------------------------
	end
end


function bico_Z29_625081_Syscast()	--從玩家系統施放暈眩
	SysCastSpellLv(TargetID(),TargetID(),851354,0)
end


function bico_Z29_625081_CancelBuff_625088()	--檢查目標是否為瘋眼，移除瘋狂猛擊
	CancelBuff( TargetID() , 625088 )
end

function bico_Z29_625086_Friendunder2()	--檢查周邊隊友小於2，自己施放恐懼
	
	local ZoneID = ReadRoleValue( OwnerID(), EM_RoleValue_ZoneID )
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )
	local boss_faketable = {106791,103386,103390}
	local zone = 1;
		if ZoneID == 163 then		--hard
			zone =1
		elseif ZoneID == 164 then	--normal
			zone = 2
		elseif ZoneID == 165 then	--easy
			zone = 3
		elseif ZoneID == 938 then	--測試區
			zone =1	
		end
	local x,y,z,dir=DW_Location(TargetID())
	local boss_fake = CreateObj( boss_faketable[zone], x, y, z, dir, 1 )	--108276透明特效球
	SetModeEx( boss_fake, EM_SetModeType_Mark, false)		--標記(不可)
	SetModeEx( boss_fake, EM_SetModeType_HideName, false)	--名字(隱藏)
	SetModeEx( boss_fake, EM_SetModeType_NotShowHPMP, false)	--血條(不秀)
	SetModeEx( boss_fake, EM_SetModeType_Strikback, false)		--反擊(不可)
	SetModeEx( boss_fake, EM_SetModeType_Move, false)		--移動(不可)
	SetModeEx( boss_fake, EM_SetModeType_Fight, false)		--砍殺(不可)
	SetModeEx( boss_fake, EM_SetModeType_Searchenemy, false)	--索敵(不可)
	AddToPartition( boss_fake, RoomID )
	WriteRoleValue( boss_fake, EM_RoleValue_LiveTime, 3)	--存在3秒
	local Player_Table = SearchRangePlayer( boss_fake , 50 )
	SysCastSpellLv(boss_fake,boss_fake,851355,0)
	--CastSpell( boss_fake,boss_fake,851355 );
	if #Player_Table < 3 then
		for i = 0, 1, 1 do			
			AddBuff( Player_Table[i] , 625086, 0, 4 )
		end		
	end	
end

function bico_Z29_106952_collision()
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )
	if Z29_bico_Boss1_Fight_Click[RoomID] == 1 then
		if CheckBuff( OwnerID(), 625091) == false then
			AddBuff(OwnerID(), 625091,0,-1);
			table.insert(Z29_bico_Boss1_Bloodtaste_Table[RoomID], OwnerID())
		end
	end
	AddBuff(OwnerID(), 625091,0,-1);
end

function bico_Z29_106952_attackCancelBuff()
	if CheckBuff(TargetID(),625091) == true then
	CancelBuff( TargetID(),625091)
	end
end



function bico_Z29_106952_PleaseBeGoodOK()--破碎物體產生劇情
	local stone = OwnerID();
	SetModeEx( stone, EM_SetModeType_Fight, false )
	SetModeEx( stone, EM_SetModeType_Move, false )
	SetModeEx( stone, EM_SetModeType_NotShowHPMP, false )
	SetModeEx( stone, EM_SetModeType_Strikback, false)	--反擊(不可)
	SetModeEx( stone, EM_SetModeType_Move, false)		--移動(不可)
	SetModeEx( stone, EM_SetModeType_Fight, false)		--砍殺(不可)
	SetModeEx( stone, EM_SetModeType_Searchenemy, false)	--索敵(不可)
--	SetModeEx( stone, EM_SetModeType_Obstruct, false)		--阻擋(可)
	SetModeEX( stone, EM_SetModeType_Gravity, true)	--重力
	SetPlot(stone,"collision","bico_Z29_106952_collision",0)
end