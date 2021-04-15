
-- 採集事件
-- 每次採集施法條讀取完會觸發的事件
function gather_rewardevent_01()
	local Player = OwnerID()    -- 玩家
	local GatherObj = TargetID()  -- 採集目標物
	local GatherBuffID = 624075  -- 採集累積次數 BUFF
	local GatherBuffTime = 600
	local LimitLv = 100  -- bufflv上限值

	if CheckBuff(Player, 624076) == false then   -- 沒有黃金時間buff
		AddBuff(Player, GatherBuffID, 0 , GatherBuffTime )  -- 給buff

		local GatherBuffLV = FN_CountBuffLevel(Player,GatherBuffID )  -- buff lv 
		local RealBuffLv = GatherBuffLV+1
	--	say(Player, "GatherBuffLV = "..GatherBuffLV..", RealBuffLv = "..RealBuffLv  )

		if RealBuffLv == LimitLv then  -- 黃金時間buff
			Beginplot(Player, "gather_rewardevent_04", 0 )  -- 黃金time buff
		else  
			if RealBuffLv%10 == 0 then  -- 每X1級觸發事件
				Beginplot(Player, "gather_rewardevent_02", 0 )
			end

			if RealBuffLv%20 == 0 then   -- 每X2級觸發事件
				if RealBuffLv >= 60 then
					Beginplot(Player, "gather_rewardevent_03_lv3", 0 )
				--	say(Player, "each LV10 Event - lv3 , bufflv = "..RealBuffLv )
				elseif RealBuffLv == 40  then
					Beginplot(Player, "gather_rewardevent_03_lv2", 0 )
				--	say(Player, "each LV10 Event - lv2 , bufflv = "..RealBuffLv )
				elseif RealBuffLv == 20  then
					Beginplot(Player, "gather_rewardevent_03_lv1", 0 )
				--	say(Player, "each LV10 Event - lv1 , bufflv = "..RealBuffLv )
				end
			end
		end
	end
end

-- 黃金時間 事件
function gather_rewardevent_04()
	local Player = OwnerID()    -- 玩家
	local BuffID = 624076  -- 採集黃金時間buff
	local BuffTime = 180
	local magicid = {850668, 850669, 850670 }  -- RUSH , 事件2, 事件1
	local Cancelbufflist = {624075,624078, 624079, 624080, 624081, 624082, 624083 }

	SysCastSpellLV( Player , Player , magicid[1] , 0  ) ---- 法術特效 - 極速
	for i = 1, #Cancelbufflist do
		CancelBuff(Player, Cancelbufflist[i] )
	end

	AddBuff(Player, BuffID, 0 , BuffTime )  -- 給buff
	ScriptMessage( Player , Player , 1 , "[SC_GATHEREVENT_06]" , C_System ) --  經過持續不斷地採集，秘藏在你體內的採集潛能被激發了！
	ScriptMessage( Player , Player , 0 , "[SC_GATHEREVENT_06]" , C_System ) 
end

-- LVX1 事件
function gather_rewardevent_02()
	local Player = OwnerID()    -- 玩家
	local BuffID = 624077  -- 採集速度BUFF
	local BuffTime = 300
	local magicid = {850668, 850669, 850670 }  -- RUSH , 事件2, 事件1
	local SpeedBuffLV = FN_CountBuffLevel(Player,BuffID )  -- buff lv 
	local RealBuffLv = SpeedBuffLV+1

	if  RealBuffLv <9 then
		SysCastSpellLV( Player , Player , magicid[3] , 0  ) ---- 法術特效 - 事件1
		AddBuff(Player, BuffID, 0 , BuffTime )  -- 給buff
	end
end

-- LVX2 事件
function gather_rewardevent_03_lv1()
	local Player = OwnerID()    -- 玩家

	local RR = Rand(100)+1
	-- lv1事件 -- 
	if RR >= 31 then   --  70%   事件2
		Callplot(Player, "gather_rewardevent_03_ev2", 1 )  
	else   --30 % 事件1 
		Callplot(Player, "gather_rewardevent_03_ev1", 1 )
	end
end

function gather_rewardevent_03_lv2()
	local Player = OwnerID()    -- 玩家

	-- lv2事件 -- 
	local RR = Rand(100)+1
	-- EventTypeRate_lv2 -- 30, 80, 92, 97 , 100
	if RR >= 97+1 then   --   事件[3] 獲得效果-豐盈採收(採集收穫物增加)   X3 
		Callplot(Player, "gather_rewardevent_03_ev3" , 3 )

	elseif RR >= 92+1 and RR <= 97 then  --  事件[3] 獲得效果-豐盈採收(採集收穫物增加) X2
		Callplot(Player, "gather_rewardevent_03_ev3" , 2 )

	elseif RR >=80+1 and RR <= 92 then  --  事件[3] 獲得效果-豐盈採收(採集收穫物增加)  X1 
		Callplot(Player, "gather_rewardevent_03_ev3" , 1 )

	elseif RR >=30+1 and RR <= 80 then  ---  事件[2] 獲得主職經驗職與技能點數 
		Callplot(Player, "gather_rewardevent_03_ev2", 2 )  

	elseif RR <= 30 then    --   事件[1] 獲得效果-靈活採收(採集經驗值增加) LEVE 2
		Callplot(Player, "gather_rewardevent_03_ev1",  2 )
	end

end

function gather_rewardevent_03_lv3()
	local Player = OwnerID()    -- 玩家

	-- lv3事件 -- 
	local RR = Rand(100)+1
	-- EventTypeRate_lv3  30 80 90 95 98 100 
	if RR >= 98+1 then   --  
		Callplot(Player, "gather_rewardevent_03_ev4", 0 )

	elseif RR >= 95+1 and RR <= 98 then  -- 事件[3] 獲得效果-豐盈採收(採集收穫物增加)
		Callplot(Player, "gather_rewardevent_03_ev3" , 3 )

	elseif RR >= 90+1 and RR <= 95 then   -- 事件[3] 獲得效果-豐盈採收(採集收穫物增加)
		Callplot(Player, "gather_rewardevent_03_ev3" , 2 )

	elseif RR >=80+1 and RR <= 90 then  -- 事件[3] 獲得效果-豐盈採收(採集收穫物增加)
		Callplot(Player, "gather_rewardevent_03_ev3" , 1 )

	elseif RR >=30+1 and RR <= 80 then     -- 事件[2] 獲得主職經驗職與技能點數
		Callplot(Player, "gather_rewardevent_03_ev2", 3 )  

	elseif RR <= 30 then    --   事件[1] 獲得效果-靈活採收(採集經驗值增加) 
		Callplot(Player, "gather_rewardevent_03_ev1" , 3 )

	end

end

------------------------------------------------------------------------------------------------------------ 
-- 事件[1] 獲得效果-靈活採收 (採集經驗值增加)
function gather_rewardevent_03_ev1(BuffLevel)
	local Player = OwnerID()    -- 玩家
	local GatherExpBuffID = { 624078, 624079, 624080  } -- exp 20  30 50
	local GatherCountBuffID = { 624081, 624082, 624083 }  -- 採集收成物+1 2  3
	local BuffTime = 30
	local magicid = {850668, 850669, 850670 }  -- RUSH , 事件2, 事件1

	SysCastSpellLV( Player , Player , magicid[2] , 0  ) ---- 法術特效 - 事件2

	for i = 1, #GatherCountBuffID do	
		CancelBuff(Player, GatherCountBuffID[i] )
	end
	for k  = 1, #GatherExpBuffID do
		CancelBuff(Player, GatherExpBuffID[k] )
	end
	AddBuff(Player, GatherExpBuffID[BuffLevel], 0, BuffTime )  -- 採集exp up buff lv1
	ScriptMessage( Player , Player , 1 , "[SC_GATHEREVENT_02]" , C_System ) --  [SC_GAHTEREVENT_01]，獲得了[624078]的效果。
	ScriptMessage( Player , Player , 0 , "[SC_GATHEREVENT_02]" , C_System ) 
end

-- 事件[2] 獲得主職經驗職與技能點數
function gather_rewardevent_03_ev2( ExpLevel )
	local Player = OwnerID()    -- 玩家
	local PlayerJobLv = ReadRoleValue(Player, EM_RoleValue_LV )  -- 玩家主職等級 
	local magicid = {850668, 850669, 850670 }  -- RUSH , 事件2, 事件1

	SysCastSpellLV( Player , Player , magicid[2] , 0  ) ---- 法術特效 - 事件2
	-- 1 ~ 100級任務經驗值表
	local QuestExpTable = {
		24, 50, 77, 106, 124, 150, 177, 228, 283, 390, 
		504, 590, 637, 740, 860, 976, 1067, 1257, 1469, 2003, 
		2613, 3009, 3522, 4123, 4626,5151, 5767, 6521, 7079, 7922, 
		8423, 9555, 10731, 13566, 16186, 18904,21373, 24622, 28689, 33331, 
		35777, 38260, 40772, 45248, 51754, 55851, 58943, 61998, 66527, 106443, 
		113894, 121866, 130396, 133003, 135663, 138376, 141143, 163725, 170339, 177220, 
		184379, 191827, 199576, 207638, 216026, 224753, 233833, 243279, 253107, 263332, 
		273970, 285038, 296553, 308533, 320997, 333965, 347457, 361494, 376098, 391292, 
		407100, 423546, 440657, 458459, 476980, 496249, 516297, 537155, 558856, 581433, 
		604922, 629360, 654786, 681239, 708761, 737394, 767184, 798178, 830424, 863973
		}

	local RewardExpRate = {10, 20, 30 }  -- 給予任務經驗值的比例
	local OrginalExp = QuestExpTable[PlayerJobLv]  -- 玩家角色主值對應的任務經驗值
	local Exp = Math.floor(OrginalExp*(RewardExpRate[ExpLevel]/100))  -- 給予exp值
	local Tp = Math.floor(Exp*0.1)  -- 給予的tp值
		if Tp == 0 then
			Tp = 1
		end

	AddRoleValue(Player, EM_RoleValue_EXP, Exp )
	AddRoleValue(Player, EM_RoleValue_TPEXP, Tp )
--	Say(Player, "get lv1 exptp ")
	ScriptMessage( Player , Player , 1 , "[SC_GATHEREVENT_04][$SETVAR1="..Exp.."][$SETVAR2="..Tp.."]" , C_System ) --  你在採集中發想到新的戰鬥技巧，獲得經驗值[$VAR1]點與技能點數[$VAR2]點。
	ScriptMessage( Player , Player , 0 , "[SC_GATHEREVENT_04][$SETVAR1="..Exp.."][$SETVAR2="..Tp.."]" , C_System ) 
end

-- 事件[3] 獲得效果-豐盈採收(採集收穫物增加) 
function gather_rewardevent_03_ev3(BuffLevel)
	local Player = OwnerID()    -- 玩家
	local GatherExpBuffID = { 624078, 624079, 624080  } -- exp 20  30 50
	local GatherCountBuffID = { 624081, 624082, 624083 }  -- 採集收成物+1 2  3
	local BuffTime = 30
	local magicid = {850668, 850669, 850670 }  -- RUSH , 事件2, 事件1

	SysCastSpellLV( Player , Player , magicid[2] , 0  ) ---- 法術特效 - 事件2

	for i = 1, #GatherCountBuffID do	
		CancelBuff(Player, GatherCountBuffID[i] )
	end
	for k  = 1, #GatherExpBuffID do
		CancelBuff(Player, GatherExpBuffID[k] )
	end

	AddBuff(Player, GatherCountBuffID[BuffLevel], 0, BuffTime)  -- 採集收穫
	ScriptMessage( Player , Player , 1 , "[SC_GATHEREVENT_03]" , C_System ) --  [SC_GAHTEREVENT_01]，獲得了[624081]的效果。
	ScriptMessage( Player , Player , 0 , "[SC_GATHEREVENT_03]" , C_System ) 

end

-- 事件[4]  獲得物品 -生產特殊材料(任一種)
function gather_rewardevent_03_ev4()
	local Player = OwnerID()    -- 玩家
	GiveBodyItem(Player, 726944, 1 )  -- 生產特殊材料
	ScriptMessage( Player , Player , 1 , "[SC_GATHEREVENT_05]" , C_System ) --  你在採集中意外發現了稀有的製造材料。
	ScriptMessage( Player , Player , 0 , "[SC_GATHEREVENT_05]" , C_System ) 
end

-- 測試指令 - 設定特定的持續採集效果等級
function gather_rewardevent_test_01(GatherBuffLV)
	local Player = OwnerID()    -- 玩家
	local GatherBuffID = 624075  -- 採集累積次數 BUFF
	local GatherBuffTime = 600
	local SpeedBuffID = 624077  -- 採集速度BUFF
	local SpeedBuffTime = 300

--	CancelBuff(Player, 624076)  ---  刪除 極速採收buff
	CancelBuff(Player, GatherBuffID)  ---  刪除 採集累積次數 BUFF
	CancelBuff(Player, SpeedBuffID)  ---  刪除 採集速度BUFF

	local RealBuffLv = GatherBuffLV-1
	AddBuff(Player, GatherBuffID, RealBuffLv , GatherBuffTime )  -- 給buff

	if RealBuffLv >= 5 then
		local speedlv = math.floor((RealBuffLv+1)/10) 
		AddBuff(Player, SpeedBuffID, speedlv-1 , SpeedBuffTime )  -- 給buff
	end

end