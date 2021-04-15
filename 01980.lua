--公會教場10 狼來了  -狼劇情


--狼出生第一段劇情 (由中控器判斷狀況產出 ) 
function lua_mika_wolfcome_wolf_born1()
	local npcid = 105024
	local flagid = 780824
	local wolf = CreateObjByFlag( npcid , flagid , 0  , 1 )
	local RoomID = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID )

	WriteRoleValue(OwnerID(),  EM_RoleValue_Register2 , 1 )   -- r1  = 狼產生當中 不能再跑下面 
	local check = ReadRoleValue(OwnerID(), EM_RoleValue_Register2 )   -- 狼出生開關  0 = 可以生狼 1 不行  防止script 重複run
--	DebugMsg( 0 , 0 , "CHECK 1  = "..check )	

	SetFightMode( wolf , 0 , 1 , 0 , 0 )
	WriteRoleValue( wolf ,EM_RoleValue_IsWalk , 0 ) --命令該角色用跑的
--	MoveToFlagEnabled( wolf, false )
	AddToPartition( wolf , RoomID )

--	say(wolf, "Born")
	local W =  ReadRoleValue( wolf, EM_RoleValue_IsWalk )
--	say(OwnerID(), W )

	for i = 1 , 3, 1 do 
--		say(wolf, "run"..i )

		-- 棋子的XYZ
		local X = GetMoveFlagValue( flagid, i, EM_RoleValue_X )
		local Y = GetMoveFlagValue( flagid, i, EM_RoleValue_Y)
		local Z = GetMoveFlagValue( flagid, i, EM_RoleValue_Z )

		-- 當NPC走到i點才前進下一個點
		if i == 3 then
			CastSpell(wolf,  wolf, 496585 )  -- 狼嚎叫motion
			Beginplot(wolf, "lua_mika_wolfcome_wolf_born3" , 10 )
			sleep(30)
		end
		DW_MoveToFlag( wolf , 780824, i, 20, 1 )

	end

	--狼跑到定點後 開始做找羊動作
	CallPlot( wolf, "Lua_Zone354_WolfMove", 0 )
--	Say( wolf, "wolf run ok" ) 

	WriteRoleValue(OwnerID(),  EM_RoleValue_Register2 , 0 )   -- r1  = 狼可以跑囉
	local check = ReadRoleValue(OwnerID(), EM_RoleValue_Register2 )   -- 狼出生開關  0 = 可以生狼 1 不行  防止script 重複run
--	DebugMsg( 0 , 0 , "CHECK 2 = "..check )	

end

-------------------------------------
--狼  掛物件產生劇情
function lua_mika_wolfcome_wolf_born2()

	-- 狼出生時給予判斷是狼的buff
	AddBuff(OwnerID(), 507701 , 4 , -1 ) 
--	WriteRoleValue( OwnerID(), EM_RoleValue_Register3 , 5 )--生命值
	local bufflv = FN_CountBuffLevel(OwnerID(), 507701 )  
--	Say( OwnerID(), bufflv )

end

-------------------------------------
function lua_mika_wolfcome_wolf_born3()
	PlaySound( OwnerID() , "sound/sound_new/train/wolf.mp3", false )--播放音效
end


-------------------------------------
function Lua_Zone354_WolfMove()--狼移動
	local Wolf = OwnerID()
	local SheepTable = Zone354_GlobalSheep

	while true do
		Sleep(50)
--		say(wolf, "check" )

		local sheep = Lua_Hao_NPC_Closest_Search( wolf , 105023  , 180 )-- 以Owner為中心做范圍搜尋，回傳最接近的物件

		if sheep == 0 then -- 如果沒羊
		--	Say(wolf, "search sheep.")
			local X = ReadRoleValue( wolf, EM_RoleValue_X )
			local Y = ReadRoleValue( wolf, EM_RoleValue_Y )
			local Z = ReadRoleValue( wolf, EM_RoleValue_Z )
			local Range = 35 --亂數移動範圍
			MoveDirect( wolf, X+math.random(-Range,Range), Y, Z+math.random(-Range,Range) )
		
		else
		--	Say(wolf, "find sheep !!")

			local dis = GetDistance(wolf, sheep )
			AdjustFaceDir(Wolf, sheep, 0 ) --面向
			local wolfdead =  ReadRoleValue( Wolf, EM_RoleValue_Register3 )  -- 狼已死  r3 = 1 狼死了 , r3 = 0 狼活著
			if  wolfdead == 0 and dis < 50 then 
				CastSpell( Wolf, Sheep, 490579 )  -- 狼 吃 羊	
			else
		--		say(wolf, "dis = "..dis )
		--		KS_Move( Wolf, dis-20, Sheep ) --對象(RoleID)移動到指定位置
				KS_Move( Wolf, 20, Sheep ) --對象(RoleID)移動到指定位置

			end

		--	Say(wolf, "bite ok")
		end
	end
end


--狼 咬羊,  490579 執行結果
function Lua_Zone354_WolfSheep() --咬羊
--	Say(OwnerID(), "OwnerID") -- 狼
--	Say(TargetID(), "TargetID")   -- 羊

	-- 羊血量
	local BuffType = 0
	local Count = BuffCount ( TargetID())
	local SetA = -1

--	Say(OwnerID(),  "bite the sheep ")
	PlayMotion( OwnerID(), 37 )  -- 狼 播放 攻擊 動作
	Playmotion(TargetID(), 18 ) -- 播放動作 受傷 (18 or 19 )

	for i = 0 , Count do
		local BuffID = BuffInfo ( TargetID() , i , EM_BuffInfoType_BuffID )
		if BuffID == 506292 then
			local BuffLv = BuffInfo ( TargetID() , i , EM_BuffInfoType_Power )
			SetA = BuffLv

			if BuffLv > 0 then  -- 血 > 1

		--		Say(TargetID(), "life -1 " )
				CancelBuff(TargetID(), 506292 )
				AddBuff(TargetID(), 506292, SetA-1 , -1 )
				local life =  FN_CountBuffLevel(TargetID(), 506292 )  
		--		Say(TargetID(), "life is "..life )

			else
				CancelBuff(TargetID(),BuffID)
		--		Say(TargetID(), "I will die" ) 
				Beginplot(TargetID(), "lua_mika_wolfcome_sheepdie", 10 )  -- 播放死亡連續動作, 約3秒
			end
			break
		end
	end
end

-- 羊死亡劇情
Function lua_mika_wolfcome_sheepdie()
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_DYING,ruFUSION_ACTORSTATE_DEAD)
	sleep(30)
	Lua_Zone354_Reset( OwnerID() )--產生位置清空
end