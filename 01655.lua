
function Lua_cang_banalloz_skill_M1() --第一階段技能
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local Opener = ReadRoleValue(OwnerID() , EM_RoleValue_PID )
	local Buff01 = 505081
	local Buff02 = 505082	
	local Buff03 = 505083
	local Fire = {}
	local NowX, NowY, NowZ, NowDir
	local countfire = 0
	local PPL = {}
	local countcharge = 0
	local count1 = 0
	local count2 = 0
	local count_fire = 0
	
	while true do
	sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
		if (  AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- 檢查是否離開戰鬥
			countcharge = countcharge + 1
			count1 = count1 + 1
			if CheckBuff (OwnerID() , Buff01 ) == true then
				if count1 == 7 then
					CastSpellLV( OwnerID(), AttackTarget, 494481, 1)
					count1 = 0
				end	
				--氣功波
				--光束炮 直線傷害無法承受
			elseif CheckBuff (OwnerID() , Buff02 ) == true then
				if count2 == 0 then
					AddBuff(OwnerID(), 505090, 1 , -1)
					local TempPlayer = SetSearchAllPlayer(ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)) --取現在該區內的所有玩家
					local ThesePlayer = {}
					local OT = {}
					for i=1,TempPlayer do
						ThesePlayer[i] = GetSearchResult() -- 接暫存值			
						if CheckID( ThesePlayer[i] ) == true and ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 then--檢查玩家是不是還在；檢查是否死亡
							if	ReadRoleValue( ThesePlayer[i] , EM_RoleValue_VOC ) ~= 1 and
								ReadRoleValue( ThesePlayer[i] , EM_RoleValue_VOC ) ~= 3 and
								ReadRoleValue( ThesePlayer[i] , EM_RoleValue_VOC ) ~= 6 and
								ReadRoleValue( ThesePlayer[i] , EM_RoleValue_VOC ) ~= 2 and
								ReadRoleValue( ThesePlayer[i] , EM_RoleValue_VOC ) ~= 7 then
								local voc = ReadRoleValue( ThesePlayer[i] , EM_RoleValue_VOC )
								OT[table.getn(OT)+1] = ThesePlayer[i]	
							end--放入Useful裡面
						end					
					end
					for i = 1, table.getn(OT) do
						Addbuff(OT[i] , 505092, 0 , 15)
					end
					count2 = 1
				end
				--反彈
				--增加仇恨
			elseif CheckBuff (OwnerID() , Buff03 ) == true then
				if countcharge >= 5 then
					local TempPlayer = SetSearchAllPlayer(ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)) --取現在該區內的所有玩家
					local ThesePlayer = {}
					local sway = {}
					for i=1,TempPlayer do
						ThesePlayer[i] = GetSearchResult() -- 接暫存值			
						if CheckID( ThesePlayer[i] ) == true and ReadRoleValue( ThesePlayer[i] , EM_RoleValue_VOC ) ~= 0 and ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then--檢查玩家是不是還在；檢查是否死亡
							if  ThesePlayer[i] ~= AttackTarget then
								sway[table.getn(sway)+1] = ThesePlayer[i]	
							end--放入Useful裡面
						end					
					end	
					if table.getn(sway) ~= 0 then	
						local anyone = Rand(table.getn(sway))+1	--rand
						CastSpellLV( OwnerID(), sway[anyone], 494485, 1)
					elseif table.getn(sway) == 0 then
						CastSpellLV( OwnerID(), AttackTarget, 494485, 1)
					end
					countcharge = 0
				end
				if count_fire == 0 then
					BeginPlot(OwnerID(), "Lua_cang_banalloz_fire", 10)
					count_fire = 1
				end
				--衝撞
				--周身有火
				--經過的路上也有火 火維持10秒
			end
		elseif (  AttackTarget == 0 ) and ( CheckID( OwnerID() ) == true ) then  -- 檢查是否離開戰鬥
			WriteRoleValue( Opener, EM_RoleValue_Register4, 1)			
		end	
	end
end

function Lua_cang_banalloz_skill_M3() --第三階段技能
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local Opener = ReadRoleValue(OwnerID() , EM_RoleValue_PID )
	local Castime = 0
	local Skillball
	local Mode1 = 504827
	local Mode2 = 504828
	local Mode3 = 504829
	local Tornado 
	local SkillID = {494652, 494653, 494654, 494655, 494656}
	local SkillLV = {0,3,0,0,3}
	local SkillDelay = {10,20,10,20,20}
	local SkillShow = 0
	local count = 0
	local count1 = 0
	local SkillRND = 0
	local BossTarget
	local count2 = 0
	
 	
	while true do
	sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
		if (  AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- 檢查是否離開戰鬥
			Castime = Castime + 1
			count = count + 1 
			Tornado = ReadRoleValue(OwnerID(), EM_RoleValue_Register2)
			if Castime >= 15 then
				Skillball = star_CreateObj_NoAdd(OwnerID() , 102881,0,200,0, RoomID , 180)
				SetModeEX( Skillball   , EM_SetModeType_Gravity , false )--重力
				SetModeEx( Skillball   , EM_SetModeType_Fight , false )--可砍殺攻擊
				SetModeEx( Skillball   , EM_SetModeType_Strikback, false )--反擊
				SetModeEx( Skillball   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
				SetModeEx( Skillball   , EM_SetModeType_Mark, false )--標記
				SetModeEx( Skillball   , EM_SetModeType_Move, false )--移動
				SetModeEx( Skillball   , EM_SetModeType_Searchenemy, false )--索敵
				SetModeEx( Skillball   , EM_SetModeType_ShowRoleHead, false )--頭像框
				SetModeEx( Skillball   , EM_SetModeType_HideName, false )--名稱
				AddToPartition(Skillball , RoomID )				
				WriteRoleValue(Skillball, EM_RoleValue_Livetime,15)
				ScriptMessage(OwnerID() , -1 , 2 ,  "[SC_102721_7]", 1 )
				while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID ) ~= 0   do
					sleep(3)
				end				
				CastSpellLV(OwnerID(), OwnerID(), 494657, 1)
				CastSpellLV(Skillball, OwnerID(), 494320, 1)				
				BeginPlot( Tornado,"Lua_cang_banalloz_Tornado" ,0)
				sleep(50)
				Castime = 0
			end
			if CheckBuff (OwnerID() , Mode1 ) == true then 
				if count == 7 then
					CastSpellLV( OwnerID() , OwnerID() , SkillID[5] , SkillLV[5] )
					Sleep( SkillDelay[5])
					count = 0					
				end
			elseif CheckBuff (OwnerID() , Mode2 ) == true then	
				if count2 == 5 then 
					local TempPlayer = SetSearchAllPlayer(ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)) --取現在該區內的所有玩家
					local ThesePlayer = {}
					local sway = {}
					for i=1,TempPlayer do
						ThesePlayer[i] = GetSearchResult() -- 接暫存值
						if CheckID( ThesePlayer[i] ) == true and ReadRoleValue( ThesePlayer[i] , EM_RoleValue_VOC ) ~= 0 and ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then--檢查玩家是不是還在；檢查是否死亡
							sway[table.getn(sway)+1] = ThesePlayer[i]	--放入Useful裡面 
						end					
						if table.getn(sway) ~= 0 then
							anyone = Rand(table.getn(sway))+1
							CastSpellLV( OwnerID() , sway[anyone] , SkillID[1] , SkillLV[1] )
							Sleep( SkillDelay[1])
						end
					end
					count2 = 0
				end	
				if count == 7 then
					CastSpellLV( OwnerID() , OwnerID() , SkillID[2] , SkillLV[2] )
					Sleep( SkillDelay[2])								
					count = 0
				end							
			elseif CheckBuff (OwnerID() , Mode3 ) == true then	
				if count == 7 then
					SkillRND = Rand( 100 )+1	-- 產生亂數					
					if SkillRND <= 100 and SkillRND > 50 then
						CastSpellLV( OwnerID() , AttackTarget , SkillID[3] , SkillLV[3] )
						Sleep( SkillDelay[3])
					elseif SkillRND <= 50 and SkillRND > 0 then
						CastSpellLV( OwnerID() , OwnerID() , SkillID[4] , SkillLV[4] )
						Sleep( SkillDelay[4])
					end
					count = 0					
				end
			end	
		elseif (  AttackTarget == 0 ) and ( CheckID( OwnerID() ) == true ) then  -- 檢查是否離開戰鬥
			WriteRoleValue( Opener, EM_RoleValue_Register4, 1)			
		end	
		count1 = 0
	end
end

function Lua_cang_banalloz_W1() --劍
	local count = 0
	local count1 = 0
	while true do
		sleep(10)	
		local Boss = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
		local BossTarget = ReadRoleValue( Boss , EM_RoleValue_AttackTargetID )
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
		if (  BossTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- 檢查是否離開戰鬥
			count = count + 1
			count1 = count1 + 1
			if count == 5 then
				CastSpellLV(OwnerID(), OwnerID(), 494315, 1)
				Sleep(20)
				count = 0
			end
			--if count1 == 7 then 
			--	CastSpellLV(OwnerID(), AttackTarget, 494651, 1)
			--	count1 = 0
			--end
		elseif (  AttackTarget == 0 ) and ( CheckID( OwnerID() ) == true ) then
			local TempPlayer = SetSearchAllPlayer(ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)) --取現在該區內的所有玩家
			local ThesePlayer = {}
			local sway = {}
			for i=1,TempPlayer do
				ThesePlayer[i] = GetSearchResult() -- 接暫存值
				if CheckID( ThesePlayer[i] ) == true and ReadRoleValue( ThesePlayer[i] , EM_RoleValue_VOC ) ~= 0 and ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then--檢查玩家是不是還在；檢查是否死亡
					sway[table.getn(sway)+1] = ThesePlayer[i]	--放入Useful裡面 
				end					
			end
			if table.getn(sway) ~= 0 then
				anyone = Rand(table.getn(sway))+1
				SetAttack(OwnerID(), sway[anyone] )
			elseif table.getn(sway) == 0 then
				DelObj(OwnerID())
			end
		end	
	end	
end

function Lua_cang_banalloz_W2() --槌
	local count = 0
	while true do
		sleep(10)	
		local Boss = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
		local BossTarget = ReadRoleValue( Boss , EM_RoleValue_AttackTargetID )	--抓目標值
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )		
		if (  BossTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- 檢查是否離開戰鬥
			count = count + 1
			if count == 5 then
				CastSpellLV(OwnerID(), OwnerID(), 494314, 1)
				Sleep(20)
				count = 0
			end				
		elseif (  AttackTarget == 0 ) and ( CheckID( OwnerID() ) == true ) then
			local TempPlayer = SetSearchAllPlayer(ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)) --取現在該區內的所有玩家
			local ThesePlayer = {}
			local sway = {}
			for i=1,TempPlayer do
				ThesePlayer[i] = GetSearchResult() -- 接暫存值
				if CheckID( ThesePlayer[i] ) == true and ReadRoleValue( ThesePlayer[i] , EM_RoleValue_VOC ) ~= 0 and ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then--檢查玩家是不是還在；檢查是否死亡
					sway[table.getn(sway)+1] = ThesePlayer[i]	--放入Useful裡面 
				end					
			end	
			if table.getn(sway) ~= 0 then
				anyone = Rand(table.getn(sway))+1
				SetAttack(OwnerID(), sway[anyone] )
			elseif table.getn(sway) == 0 then
				DelObj(OwnerID())
			end
		end	
	end	
end

function Lua_cang_banalloz_W3()	--斧
	local count = 0
	while true do
		sleep(10)	
		local Boss = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
		local BossTarget = ReadRoleValue( Boss , EM_RoleValue_AttackTargetID )	--抓目標值
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )	
		if (  BossTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- 檢查是否離開戰鬥
			count = count + 1
			if count == 5 then
				CastSpellLV(OwnerID(), OwnerID(), 494313, 1)
				Sleep(20)
				count = 0
			end	
		elseif (  AttackTarget == 0 ) and ( CheckID( OwnerID() ) == true ) then
			local TempPlayer = SetSearchAllPlayer(ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)) --取現在該區內的所有玩家
			local ThesePlayer = {}
			local sway = {}
			for i=1,TempPlayer do
				ThesePlayer[i] = GetSearchResult() -- 接暫存值
				if CheckID( ThesePlayer[i] ) == true and ReadRoleValue( ThesePlayer[i] , EM_RoleValue_VOC ) ~= 0 and ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then--檢查玩家是不是還在；檢查是否死亡
					sway[table.getn(sway)+1] = ThesePlayer[i]	--放入Useful裡面 
				end					
			end	
			if table.getn(sway) ~= 0 then
				anyone = Rand(table.getn(sway))+1
				SetAttack(OwnerID(), sway[anyone] )
			elseif table.getn(sway) == 0 then
				DelObj(OwnerID())
			end
		end	
	end	
end

function Lua_cang_banalloz_fire() --mode火焰
	local countfire = 0
	local NowX, NowY, NowZ, NowDir
	local Fire = {}
	local RoomID = ReadRoleValue(OwnerID() ,EM_RoleValue_RoomID)
	while 1 do 
		sleep(5)
		countfire = countfire + 1
		NowX=ReadRoleValue(OwnerID() ,EM_RoleValue_X)
		NowY=ReadRoleValue(OwnerID() ,EM_RoleValue_Y)
		NowZ=ReadRoleValue(OwnerID() ,EM_RoleValue_Z)
		NowDir=ReadRoleValue(OwnerID() ,EM_RoleValue_Dir)
		Fire[countfire]=CreateObj(102737,NowX,NowY,NowZ,NowDir,1)--每ㄧ秒多一個火球
		SetModeEx( Fire[countfire] , EM_SetModeType_Show, true)--秀出
		SetModeEx( Fire[countfire] , EM_SetModeType_Mark, false)--標記
		SetModeEx( Fire[countfire] , EM_SetModeType_Strikback, false)--反擊
		SetModeEx( Fire[countfire] , EM_SetModeType_Move, false)--移動	
		SetModeEx( Fire[countfire] , EM_SetModeType_Fight, false)--可砍殺
		SetModeEx( Fire[countfire] , EM_SetModeType_SearchenemyIgnore, false)--物件不會被搜尋
		SetModeEx( Fire[countfire] , EM_SetModeType_HideName, false)		--物件頭上是否顯示名稱
		SetModeEx( Fire[countfire] , EM_SetModeType_HideMinimap, false)	--物件是否在小地圖上顯示
		SetModeEx( Fire[countfire] , EM_SetModeType_Searchenemy, false)	--鎖敵
		AddToPartition( Fire[countfire] , RoomID )
		AddBuff(Fire[countfire],504853,1,600)--------------原地放火
		WriteRoleValue(Fire[countfire], EM_RoleValue_Livetime,5)	--存在時間livetime
		if countfire == 25 then
			return
		end	
	end
end	

function Lua_cang_banalloz_door_open()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local Door1 = CreateObjByFlag( 102808 , 780485 , 7 , 1 )	
	SetModeEX( Door1  , EM_SetModeType_Gravity , false )--重力
	SetModeEx( Door1  , EM_SetModeType_ShowRoleHead, false )--不秀頭像框
	SetModeEx( Door1  , EM_SetModeType_Obstruct, true )--阻擋
	SetModeEx( Door1  , EM_SetModeType_Mark, false )--標記
	SetModeEx( Door1  , EM_SetModeType_Move, false )--移動
	SetModeEx( Door1  , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( Door1   , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( Door1   , EM_SetModeType_Strikback, false )--反擊	
	AddToPartition( Door1 , RoomID )--加進舞台
	WriteRoleValue( OwnerID() ,EM_RoleValue_Register1, Door1)
	local Door2 = CreateObjByFlag( 102808 , 780485 , 8 , 1 )
	SetModeEX( Door2  , EM_SetModeType_Gravity , false )--重力
	SetModeEx( Door2  , EM_SetModeType_ShowRoleHead, false )--不秀頭像框
	SetModeEx( Door2  , EM_SetModeType_Obstruct, true )--阻擋
	SetModeEx( Door2  , EM_SetModeType_Mark, false )--標記
	SetModeEx( Door2  , EM_SetModeType_Move, false )--移動
	SetModeEx( Door2  , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( Door2  , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( Door2  , EM_SetModeType_Strikback, false )--反擊	
	AddToPartition( Door2 , RoomID )--加進舞台	
	WriteRoleValue( OwnerID() ,EM_RoleValue_Register2, Door2)
	SetDefIdleMotion( Door1,ruFUSION_MIME_ACTIVATE_LOOP)------起來
	SetDefIdleMotion( Door2,ruFUSION_MIME_ACTIVATE_LOOP)------起來
end

function Lua_cang_banalloz_door_close()
	local Door1 =ReadRoleValue(OwnerID() ,EM_RoleValue_Register1)
	local Door2 =ReadRoleValue(OwnerID() ,EM_RoleValue_Register2)
	DelObj(Door1)
	DelObj(Door2)
end	


function Lua_cang_banalloz_restart()	--產生計數器
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)--王座上的王	
	local Start	= 0
	local Dead = 0
	local CountDead = 0
	local loot
	local count_door = 0
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
	SetModeEx( Door   , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( Door   , EM_SetModeType_Strikback, false )--反擊	
	AddToPartition( Door , RoomID )	--加進舞台
	WriteRoleValue( OwnerID() ,EM_RoleValue_Register3, Door)
	
	local Boss = CreateObjByFlag( 102704, 780485, 4, 1)	--招換	
	AddToPartition( Boss , RoomID )	--加進舞台	
	WriteRoleValue( OwnerID() ,EM_RoleValue_Register1, Boss )--暫存一為BOSS
	WriteRoleValue( Boss ,EM_RoleValue_PID, OwnerID() )--暫存一為BOSS	
	WriteRoleValue( OwnerID() ,EM_RoleValue_Register2, 2)	

	while true do
		sleep(10)
		Start = ReadRoleValue( OwnerID() , EM_RoleValue_Register2 )
		Dead = ReadRoleValue( OwnerID() , EM_RoleValue_Register5 )
		if Start == 1 then
			ScriptMessage( Boss , -1 , 2 ,  "[SC_102721_6]", 1 )
			--local show = CreateObjByFlag( 102881, 780485, 4, 1)			
			--SetModeEX( show  , EM_SetModeType_Gravity , false )--重力
			--SetModeEx( show  , EM_SetModeType_ShowRoleHead, false )--不秀頭像框
			--SetModeEx( show  , EM_SetModeType_Obstruct, true )--阻擋
			--SetModeEx( show  , EM_SetModeType_Mark, false )--標記
			--SetModeEx( show  , EM_SetModeType_Move, false )--移動
			--SetModeEx( show  , EM_SetModeType_Searchenemy, false )--索敵
			--SetModeEx( show  , EM_SetModeType_Fight , false )--可砍殺攻擊
			--SetModeEx( show  , EM_SetModeType_Strikback, false )--反擊				
			--AddToPartition( show , RoomID )			
			local show1 = CreateObjByFlag( 102881, 780485, 9, 1)			
			SetModeEX( show1  , EM_SetModeType_Gravity , false )--重力
			SetModeEx( show1  , EM_SetModeType_ShowRoleHead, false )--不秀頭像框
			SetModeEx( show1  , EM_SetModeType_ShowRoleHead, false )--不秀頭像框
			SetModeEx( show1  , EM_SetModeType_Obstruct, true )--阻擋
			SetModeEx( show1  , EM_SetModeType_Mark, false )--標記
			SetModeEx( show1  , EM_SetModeType_Move, false )--移動
			SetModeEx( show1  , EM_SetModeType_Searchenemy, false )--索敵
			SetModeEx( show1  , EM_SetModeType_Fight , false )--可砍殺攻擊
			SetModeEx( show1  , EM_SetModeType_Strikback, false )--反擊				
			AddToPartition( show1 , RoomID )			
			--CastSpellLV(show, show, 494319 , 1 )
			CastSpellLV(show1, show1, 494319 , 1 )		
			if count_door == 0 then
				BeginPlot(Door , "Lua_cang_banalloz_door_open", 0)				
				count_door = 1
			end				
			local PPL = SetSearchAllPlayer(RoomID)					
			local ID = {}
			for i = 1 , PPL , 1 do ---把玩家抓入房間用 
				ID[i] = GetSearchResult() -- 接暫存值
				if ReadRoleValue( ID[i] , EM_RoleValue_IsDead ) ~= 1 and GetDistance( ID[i] , Boss ) > 10 and GetDistance( ID[i] , Boss ) < 1000 
					and ReadRoleValue( ID[i], EM_RoleValue_VOC) ~= 0  and ReadRoleValue( ID[i] , EM_RoleValue_RoomID  ) == RoomID then
					SetPosByFlag( ID[i] , 780485 , 9 ) --拉到旗標位子
				end
			end		
			Sleep(30)			
			BeginPlot( OwnerID(), "Lua_cang_banalloz_time" , 0)
			BeginPlot( OwnerID(), "Lua_cang_banalloz" , 20)
			SetPlot( Boss,"dead", "Lua_cang_banalloz_Boss_dead" ,0 )			
			--DelObj(show)
			DelObj(show1)
			WriteRoleValue( OwnerID() ,EM_RoleValue_Register2, 2)	
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
