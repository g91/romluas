function cl_Z21_05_06_NO2_EZ() --5~6.7王中間巡邏
	local dis = 20
	local count = 5 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣列。
	local checktime = 10 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
	local ReviveTime = 600000  --當陣列中的物件全部消失時，進行陣列重置的動作，如果填 -1 ，就會按照 OwnerID() 設定的重生時間重置
	local circle = 6000  --多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local SkillRND =  Rand( 100 )+1	-- 產生亂數
	if SkillRND <= 100 and SkillRND > 80 then
		checktime =	checktime + 1
	elseif SkillRND <= 80 and SkillRND > 60 then
		checktime = checktime + 2		
	elseif SkillRND <= 60 and SkillRND > 40 then
		checktime = checktime + 3
	elseif SkillRND <= 40 and SkillRND > 20 then
		checktime = checktime + 4
	elseif SkillRND <= 20 and SkillRND > 0 then
		checktime = checktime + 5
	end	
	local ObjMatrix ={}
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(106353,Matrix,1,-1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(106353,Matrix,1,1)
	--ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(106085,Matrix,2,-1)
	--ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(106088,Matrix,3,0)
	--ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(106086,Matrix,3,-1)
	--ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(106087,Matrix,3,1)
	--ObjMatrix[7] = LuaFunc_CreateNPCByMatrix(106080,Matrix,4,-1)
	--ObjMatrix[8] = LuaFunc_CreateNPCByMatrix(106080,Matrix,4,1)
	--ObjMatrix[9] = LuaFunc_CreateNPCByMatrix(106080,Matrix,4,0)
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "cl_z21_wark05_06_NO2_EZ" , 0 )
end
function cl_z21_wark05_06_NO2_EZ()
	sleep( 10 )
	BeginPlot( OwnerID() , "cl_Z21_05_06_NO2_EZ" , 0 )
end
function cl_Z21_04_05_NO2_EZ() --5~6.7王中間巡邏
	local dis = 20
	local count = 5 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣列。
	local checktime = 10 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
	local ReviveTime = 600000  --當陣列中的物件全部消失時，進行陣列重置的動作，如果填 -1 ，就會按照 OwnerID() 設定的重生時間重置
	local circle = 6000  --多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local SkillRND =  Rand( 100 )+1	-- 產生亂數
	if SkillRND <= 100 and SkillRND > 80 then
		checktime =	checktime + 1
	elseif SkillRND <= 80 and SkillRND > 60 then
		checktime = checktime + 2		
	elseif SkillRND <= 60 and SkillRND > 40 then
		checktime = checktime + 3
	elseif SkillRND <= 40 and SkillRND > 20 then
		checktime = checktime + 4
	elseif SkillRND <= 20 and SkillRND > 0 then
		checktime = checktime + 5
	end	
	local ObjMatrix ={}
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(106350,Matrix,1,-1)
	BeginPlot( ObjMatrix[1] , "LuaS_Discowood_NowToHide" , 0 )
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(106350,Matrix,1,1)
	BeginPlot( ObjMatrix[2] , "LuaS_Discowood_NowToHide" , 0 )
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "cl_z21_wark04_05_NO2_EZ" , 0 )
end
function cl_z21_wark04_05_NO2_EZ()
	sleep( 10 )
	BeginPlot( OwnerID() , "cl_Z21_04_05_NO2_EZ" , 0 )
end
function cl_21_106086Archer_EZ() ---不死夏多爾弓箭手AI
	local me = OwnerID()
	local RoomID = ReadRoleValue ( me , EM_RoleValue_RoomID )
	local skill_time1 = 0 ---->噬魂血箭
	local skill_time2 = 0 ---->目標鎖定+狙擊
	--local skill_time3 = 0
	local CombatBegin = 0
	while 1 do
		sleep ( 10 )
		local AttackTarget = ReadRoleValue( me , EM_RoleValue_AttackTargetID )-----AttackTarget=當前攻擊目標
		if HateListCount( me ) ~= 0 then ---如果王的仇恨表內有人就繼續戰鬥
			if CombatBegin == 0 then   -----如果王的仇恨表內有人~就將這個值改變
				CombatBegin = 1       ------將王的戰鬥開始狀態值改成1~意思就是王進入戰鬥了
			end
			if CombatBegin == 1 then
				skill_time1 = skill_time1 + 1
				skill_time2 = skill_time2 + 1
			--	skill_time3 = skill_time3 + 1
				if skill_time1 >= 1 then
					while 	ReadRoleValue( me , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
						sleep(10)
					end
					CastSpelllv ( me , AttackTarget , 497591 , 70 ) ---請帽子對自己施放一個AE命中的特效沒有任何傷害
					sleep(10)
					skill_time1 = 0
				end
				if skill_time2 >= 5 then
					while 	ReadRoleValue( me , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
						sleep(10)
					end
					local hate_Table = DW_HateRemain(0)  ----將仇恨表內的玩家依照仇恨高低排列並且排除主坦
					local hate=table.getn(hate_Table) ----取出仇恨表內的數量
					if hate >= 1 then
						local Rand_Num = DW_Rand(hate)  ----隨機選一個值代表TABLE裡的位置
						if ReadRoleValue( hate_Table[Rand_Num] , EM_RoleValue_IsDead ) ~= 1 then
							CastSpelllv ( me , hate_Table[Rand_Num] , 497589 , 5 ) ---請帽子對自己施放一個AE命中的特效沒有任何傷害
							sleep ( 10 )
							skill_time2 = 0
						end
					end
				end
				--[[if skill_time3 >= 9 then
					while 	ReadRoleValue( me , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
						sleep(10)
					end
					local hate_Table_2 = DW_HateRemain(0)  ----將仇恨表內的玩家依照仇恨高低排列並且排除主坦
					local hate_2=table.getn(hate_Table_2) ----取出仇恨表內的數量
					if hate_2 >= 1 then
						local Rand_Num_2 = DW_Rand(hate_2)  ----隨機選一個值代表TABLE裡的位置
						if ReadRoleValue( hate_Table_2[Rand_Num_2] , EM_RoleValue_IsDead ) ~= 1 then
							WriteRoleValue (  me , EM_RoleValue_Register2 , hate_Table_2[Rand_Num_2] )
							addbuff ( hate_Table_2[Rand_Num_2] , 620810 , 0 , 60 )
							CastSpelllv ( me , me , 498480 , 0 ) ---請帽子對自己施放一個AE命中的特效沒有任何傷害
							sleep ( 50 )
							skill_time3 = 0
						end
					end
				end]]--
			end
		elseif HateListCount ( me ) == 0 then ---如果王的仇恨表內沒有人就要傳回給中控器
			if CombatBegin == 1 then  ----如果王仇恨表內沒有人了~就將這個值改變
				CombatBegin = 0
				skill_time1 = 0
				skill_time2 = 0
				--skill_time3 = 0
			end
		end
	end
end
function cl_21_106089Fatal_EZ() ---不死安格爾致命者
	local me = OwnerID()
	local RoomID = ReadRoleValue ( me , EM_RoleValue_RoomID )
	local skill_time1 = 0 ---->噬魂血箭
	local skill_time2 = 0 ---->目標鎖定+狙擊
	local skill_time3 = 0
	local CombatBegin = 0
	while 1 do
		sleep ( 10 )
		local AttackTarget = ReadRoleValue( me , EM_RoleValue_AttackTargetID )-----AttackTarget=當前攻擊目標
		if HateListCount( me ) ~= 0 then ---如果王的仇恨表內有人就繼續戰鬥
			if CombatBegin == 0 then   -----如果王的仇恨表內有人~就將這個值改變
				CombatBegin = 1       ------將王的戰鬥開始狀態值改成1~意思就是王進入戰鬥了
			end
			if CombatBegin == 1 then
				skill_time1 = skill_time1 + 1
				skill_time2 = skill_time2 + 1
				--skill_time3 = skill_time3 + 1
				if CheckBuff( me , 502717 ) == true then
					CastSpelllv ( me , me , 498260 , 0 ) ---請帽子對自己施放一個AE命中的特效沒有任何傷害
					sleep (15)
					CastSpelllv ( me , me , 498259 , 0 ) ---請帽子對自己施放一個AE命中的特效沒有任何傷害
					sleep ( 30 )
				end
				if skill_time2 >= 3 then
					while 	ReadRoleValue( me , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
						sleep(10)
					end
					CastSpelllv ( me , AttackTarget , 497405 , 100 ) ---請帽子對自己施放一個AE命中的特效沒有任何傷害
					sleep(30)
					skill_time2 = 0
				end
				if skill_time1 >= 13 then
					while 	ReadRoleValue( me , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
						sleep(10)
					end
					CastSpelllv ( me , me , 498259 , 100 ) ---請帽子對自己施放一個AE命中的特效沒有任何傷害
					sleep(30)
					skill_time1 = 0
				end
			end
		elseif HateListCount ( me ) == 0 then ---如果王的仇恨表內沒有人就要傳回給中控器
			if CombatBegin == 1 then  ----如果王仇恨表內沒有人了~就將這個值改變
				CombatBegin = 0
				skill_time1 = 0
				skill_time2 = 0
				skill_time3 = 0
			end
		end
	end
end