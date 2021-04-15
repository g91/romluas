--公會教場-10. 狼來了


------------------------------------------------------------------
--丟石頭 劇情
-- 玩家的部份 ( 扣buff 次數)
-- 狼的部份 ( 扣生命值) 減少狼身上R+1值

function lua_mika_wolfcome_stone_go()  --減少次數(玩家)
--	Say(OwnerID(), "O")  -- Owner  = 玩家
--	Say(TargetID(), "T")  --  Target  = 狼

	local BuffType = 0
	local Count = BuffCount ( TargetID())
	local SetA = -1

	Playmotion(TargetID(), 18 ) -- 狼播放動作 受傷 (18 or 19 )

	for i = 0 , Count do
		local BuffID = BuffInfo ( TargetID() , i , EM_BuffInfoType_BuffID )
		if BuffID == 507701 then
			local BuffLv = BuffInfo ( TargetID() , i , EM_BuffInfoType_Power )
			SetA = BuffLv

			if BuffLv > 1 then  -- 狼血 > 1
				local random = rand(100)+1   
			--	Say(OwnerID(), "R ="..random )

				if random >=1 and random <= 45 then   -- 0 -45 (45)

			--		Say(TargetID(), "life -1 " )
					CancelBuff(TargetID(), 507701 )
					AddBuff(TargetID(), 507701, SetA-1 , -1 )
					local life =  FN_CountBuffLevel(TargetID(), 507701 )  
			--		Say(TargetID(), "life is "..life )

				elseif random >=46 and random <= 80 then   -- 46 -80 (35)

					if BuffLv > 2 then  -- 狼血 > 3
			--			Say(TargetID(), "life -2 " )
						CancelBuff(TargetID(), 507701 )
						AddBuff(TargetID(), 507701, SetA-2 , -1 )
						local life =  FN_CountBuffLevel(TargetID(), 507701 )  
			--			Say(TargetID(), "life is "..life )
					elseif BuffLv > 1 then  -- 狼血 > 1
			--			Say(TargetID(), "life -1 " )
						CancelBuff(TargetID(), 507701 )
						AddBuff(TargetID(), 507701, SetA-1 , -1 )
						local life =  FN_CountBuffLevel(TargetID(), 507701 )  
			--			Say(TargetID(), "life is "..life )
					end
				else  -- 81 - 100 (20)

					if BuffLv > 3 then  -- 狼血 > 3
			--			Say(TargetID(), "life -3 " )
						CancelBuff(TargetID(), 507701 )
						AddBuff(TargetID(), 507701, SetA-3 , -1 )
						local life =  FN_CountBuffLevel(TargetID(), 507701 )  
			--			Say(TargetID(), "life is "..life )
					elseif BuffLv > 2 then  -- 狼血 > 2
			--			Say(TargetID(), "life -2 " )
						CancelBuff(TargetID(), 507701 )
						AddBuff(TargetID(), 507701, SetA-2 , -1 )
						local life =  FN_CountBuffLevel(TargetID(), 507701 )  
			--			Say(TargetID(), "life is "..life )
					elseif BuffLv > 1 then  -- 狼血 > 1
			--			Say(TargetID(), "life -1 " )
						CancelBuff(TargetID(), 507701 )
						AddBuff(TargetID(), 507701, SetA-1 , -1 )
						local life =  FN_CountBuffLevel(TargetID(), 507701 )  
			--			Say(TargetID(), "life is "..life )
					end
				end
	
			else
				CancelBuff(TargetID(),BuffID)
			--	Say(TargetID(), "I will die" ) 
				WriteRoleValue( TargetID(), EM_RoleValue_Register3, 1 )  -- 寫入此狼已死flag
				local wolfdead =  ReadRoleValue( TargetID(), EM_RoleValue_Register3 )  -- 狼已死  r3 = 1 狼死了 , r3 = 0 狼活著
			--	Say(OwnerID(), "wolfdead = "..wolfdead )
				Beginplot(TargetID(), "lua_mika_wolfcome_npcdie", 10 )  -- 播放死亡連續動作, 約3秒
			end
			break
		end
	end
end

Function lua_mika_wolfcome_npcdie()
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_DYING,ruFUSION_ACTORSTATE_DEAD)
	sleep(30)
	Delobj(OwnerID())  --  自殺
end

-------------------------------------
--技能- 驅趕羊   讓目標羊往前走

function lua_mika_wolfcome_skill()
--	say(OwnerID(), "OwnerID")  --player
--	say(TargetID(), "TargetID" )  --sheep

	local dis = Rand( 65 )+1    --移動距離50-65
	if dis < 50 then
		dis = 50
	end
--	Say(TargetID(), "Move="..dis )
	AdjustFaceDir(TargetID(), OwnerID() , 180 ) --面向 背對
	WriteRoleValue( TargetID()  ,EM_RoleValue_IsWalk , 0  )--用跑的
	sleep(10)
	Lua_MoveLine( TargetID() , Dis ) --參考物件，向前移動到Dis距離的位置 (Dis 填 負數 為 向後移動)

end

-- 技能 驅趕羊 法術檢查
function lua_mika_wolfcome_skill_check()
--	say(OwnerID(), "OwnerID")  --player
--	say(TargetID(), "TargetID" )  --sheep
	
	if CheckBuff(TargetID(), 507702 ) == true then  -- 恐懼buff
		ScriptMessage( OwnerID(),  -1, 1, "[SC_TRAIN10_MSG_08]" , 0 )  -- [105023]似乎因恐懼而聽不到你的指揮…
		ScriptMessage( OwnerID(),  -1, 0, "[SC_TRAIN10_MSG_08]" , 0 )  
		return false
	else
		return true
	end

end