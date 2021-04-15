function Lua_bk_122_start_102707()------------------終端控制器
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local start = OwnerID()
	local mob=0
	local model=0
	local magictime=0
	local ggtime=0
	local gg=0
	local skillpower=0
	local skillseact=0
	local powerbuff=505599
	local magicball={}
	local door=0
	local power=0
	local bosspower=0
	local CombatBegin=0
	local bufftime=0
	local x=0
	local boss=0
	local afdoor = CreateObjByFlag(102930,780427,2,1)
	SetModeEx( afdoor , EM_SetModeType_Gravity, false) ---重力
	SetModeEx( afdoor , EM_SetModeType_Mark, false)
	SetModeEx( afdoor , EM_SetModeType_HideName, false)
	SetModeEx( afdoor , EM_SetModeType_ShowRoleHead, false)
	SetModeEx( afdoor , EM_SetModeType_NotShowHPMP, false)
	SetModeEx( afdoor , EM_SetModeType_Obstruct, true)   -----重力
	SetModeEx( afdoor , EM_SetModeType_Strikback, false) ---反擊
	SetModeEx( afdoor , EM_SetModeType_Move, false) ---移動	
	SetModeEx( afdoor , EM_SetModeType_Fight, false) ---可砍殺
	SetModeEx( afdoor , EM_SetModeType_SearchenemyIgnore, false) 
	SetModeEx( afdoor , EM_SetModeType_Searchenemy, false)
	SetModeEx( afdoor , EM_SetModeType_Show, true)
	AddToPartition( afdoor , RoomID )
	local afdoor1 = CreateObjByFlag(103086,780427,4,1)
	SetModeEx( afdoor1 , EM_SetModeType_Gravity, false) ---重力
	SetModeEx( afdoor1 , EM_SetModeType_Mark, false)
	SetModeEx( afdoor1 , EM_SetModeType_HideName, false)
	SetModeEx( afdoor1 , EM_SetModeType_ShowRoleHead, false)
	SetModeEx( afdoor1 , EM_SetModeType_NotShowHPMP, false)
	SetModeEx( afdoor1 , EM_SetModeType_Obstruct, true)   -----重力
	SetModeEx( afdoor1, EM_SetModeType_Strikback, false) ---反擊
	SetModeEx( afdoor1 , EM_SetModeType_Move, false) ---移動	
	SetModeEx( afdoor1 , EM_SetModeType_Fight, false) ---可砍殺
	SetModeEx( afdoor1, EM_SetModeType_SearchenemyIgnore, false) 
	SetModeEx( afdoor1 , EM_SetModeType_Searchenemy, false)
	SetModeEx( afdoor1 , EM_SetModeType_Show, true)
	AddToPartition( afdoor1 , RoomID )
	BeginPlot( afdoor1 ,"Lua_bk_door_102707",0)
	local afdoor2 = CreateObjByFlag(103086,780427,5,1)
	SetModeEx( afdoor2 , EM_SetModeType_Gravity, false) ---重力
	SetModeEx( afdoor2 , EM_SetModeType_Mark, false)
	SetModeEx( afdoor2 , EM_SetModeType_HideName, false)
	SetModeEx( afdoor2 , EM_SetModeType_ShowRoleHead, false)
	SetModeEx( afdoor2 , EM_SetModeType_NotShowHPMP, false)
	SetModeEx( afdoor2 , EM_SetModeType_Obstruct, true)   -----重力
	SetModeEx( afdoor2, EM_SetModeType_Strikback, false) ---反擊
	SetModeEx( afdoor2 , EM_SetModeType_Move, false) ---移動	
	SetModeEx( afdoor2 , EM_SetModeType_Fight, false) ---可砍殺
	SetModeEx( afdoor2, EM_SetModeType_SearchenemyIgnore, false) 
	SetModeEx( afdoor2 , EM_SetModeType_Searchenemy, false)
	SetModeEx( afdoor2 , EM_SetModeType_Show, true)
	AddToPartition( afdoor2 , RoomID )
	BeginPlot( afdoor2 ,"Lua_bk_door_102707",0)
	boss = CreateObjByFlag(102707,780427,1,1)
	AddToPartition( boss , RoomID )
	WriteRoleValue( boss, EM_RoleValue_PID,start)
	BeginPlot( boss ,"Lua_bk_122_boss0_102707",0)---------------------------------王劇情模式
	SetPlot( boss , "dead" , "Lua_bk_122_dead_102707" , 10 )
	local x=0
	while 1 do 
	sleep(10)
		x=ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
		if x==1 then
			sleep(50)
			boss = CreateObjByFlag(102707,780427,1,1)
			AddToPartition( boss , RoomID )
			WriteRoleValue( boss, EM_RoleValue_PID,start)
			BeginPlot( boss ,"Lua_bk_122_boss0_102707",0)---------------------------------王劇情模式
			SetPlot( boss , "dead" , "Lua_bk_122_dead_102707" , 10 )
			x=0
			sleep(10)
			DelObj(door)
			WriteRoleValue(start, EM_RoleValue_Register1,0)
			WriteRoleValue(start, EM_RoleValue_Register2,0)
			gg=0
			ggtime=0
			model=0
			mob=0
			magictime=0
			CombatBegin=0
			bufftime=0
		end
		if x==2 then 	------進入戰鬥
			if CombatBegin==0 then
				door = CreateObjByFlag(102930,780427,3,1)-----------------------在旗標2上面丟入阻擋門
				SetModeEx( door , EM_SetModeType_Gravity, false) ---重力
				SetModeEx( door , EM_SetModeType_Mark, false)
				SetModeEx( door , EM_SetModeType_HideName, false)
				SetModeEx( door , EM_SetModeType_ShowRoleHead, false)
				SetModeEx( door , EM_SetModeType_NotShowHPMP, false)
				SetModeEx( door , EM_SetModeType_Obstruct, true)   -----重力
				SetModeEx( door , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( door , EM_SetModeType_Move, false) ---移動	
				SetModeEx( door , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( door , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( door , EM_SetModeType_Searchenemy, false)
				SetModeEx( door , EM_SetModeType_Show, true)
				AddToPartition( door , RoomID )
				CombatBegin=1
			end
			power=ReadRoleValue(OwnerID(),EM_RoleValue_Register2)--------------------記錄使用次數
			ggtime=ggtime+1
			if ggtime<=600 then 
				magictime=magictime+1
				bufftime=bufftime+1
				if magictime>=30 then -----------------------------設定 東西
					while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID ) ~= 0   do------------檢查是否再放這個招式的時候 還有其他招式產生
							sleep(5)
					end
					for i = 1 , 6 , 1 do
						magic1=DW_Rand(50)
						magicball[i]= CreateObjByFlag(114313,780426,magic1,1)
						AddToPartition(magicball[i] , RoomID )
						WriteRoleValue( magicball[i], EM_RoleValue_PID,start)
						AddBuff(magicball[i], 505620 , 1 , -1 )
						BeginPlot(magicball[i],"Lua_bk_122_move_114313",10)
						SetPlot( magicball[i] , "touch" , "Lua_bk_122_boss_114313" , 60 )-----產生一個物件讓玩家去撿取物品
					end
					magictime=0-------
				end
				if bufftime>=20 then 
					local PPL = SetSearchAllPlayer(RoomID)
					for i = 1 , PPL , 1 do 
						local ID = GetSearchResult()
						AddBuff(ID,505597,0,-1)----無法使用物品
					end	
					bufftime=0
				end
				if mob==0 then 
					model =model+1 
					bosspower=ReadRoleValue(boss,EM_RoleValue_Register2)--------------------記錄使用次數
					if power~=bossbower then 
						bosspower=power
						WriteRoleValue(boss, EM_RoleValue_Register2,power)
						CancelBuff( boss ,  powerbuff )
						for i=1,power do 
							AddBuff( boss , powerbuff , 0 , -1 )
						end	
					end
					skillseact=Lua_BuffPosSearch( boss ,  powerbuff )---------------------對物件去檢查她的目標buff
					if skillseact>=0 then   
						skillpower=BuffInfo( boss , skillseact , EM_BuffInfoType_Power )
						if skillpower>=9 then 
							while 	ReadRoleValue(boss , EM_RoleValue_SpellMagicID ) ~= 0   do------------檢查是否再放這個招式的時候 還有其他招式產生
								sleep(5)
							end
							CancelBuff( boss ,  powerbuff )
							for i=1,skillpower-10 do 
								AddBuff( boss , powerbuff , 0 , -1 )
							end
							ScriptMessage( boss , -1 , 2 , "[SC_102707_04]" , 1 )
							say( boss,"[SC_102707_04]")
							WriteRoleValue(boss, EM_RoleValue_Register2,skillpower-10)
							WriteRoleValue(start, EM_RoleValue_Register2,skillpower-10)
							CastSpellLV( boss , boss , 494880 , 1 )------------------大絕招
							sleep(50)
						end
					end
					if model>=45 then ------------第一階段
						----ScriptMessage( boss , -1 , 2 , "[SC_102707_08]" , 1 )
						local AttackTarget = ReadRoleValue( boss , EM_RoleValue_AttackTargetID )
						mob=1
						model=0
						boss_nowhp=ReadRoleValue( boss, EM_RoleValue_HP)----讀取boss現在的血量
						boss1=LuaFunc_CreateObjByObj(103041,boss)
						AddBuff(boss1, 505637 , 1 , -1 )------------------------------離開戰鬥不能回血
						ScriptMessage( boss1 , -1 , 2 , "[SC_102707_08]" , 1 )
						SetAttack( boss1 , AttackTarget)
						--say(OwnerID(),"boss1"..boss1)
						--say(OwnerID(),"boss"..boss)
						WriteRoleValue( boss1, EM_RoleValue_PID,start)
						WriteRoleValue( boss1, EM_RoleValue_HP,boss_nowhp)
						Delobj(boss)
						BeginPlot(boss1,"Lua_bk_122_boss2_102707",50)
						CastSpellLV( boss1 , boss1 , 494883 , 1 )---------播放一個停頓的法術.
						SetPlot( boss1 , "dead" , "Lua_bk_122_dead_102707" , 10 )
					end
				end
				if mob==1 then 
					model =model+1 
					---say(OwnerID(),"model"..model)
					bosspower=ReadRoleValue(boss1,EM_RoleValue_Register2)--------------------記錄使用次數
					if power~=bossbower then 
						bosspower=power
						WriteRoleValue(boss1, EM_RoleValue_Register2,power)
						CancelBuff( boss1 ,  powerbuff )
						for i=1,power do 
							AddBuff( boss1 , powerbuff , 0 , -1 )
						end	
					end
					skillseact=Lua_BuffPosSearch( boss1 ,  powerbuff )---------------------對物件去檢查她的目標buff
					if skillseact>=0 then   --------------給予無法使用物品之buff
						skillpower=BuffInfo( boss1 , skillseact , EM_BuffInfoType_Power )
						if skillpower>=9 then 
							while 	ReadRoleValue(boss1 , EM_RoleValue_SpellMagicID ) ~= 0   do------------檢查是否再放這個招式的時候 還有其他招式產生
								sleep(5)
							end
							CancelBuff( boss1 ,  powerbuff )
							for i=1,skillpower-10 do 
								AddBuff( boss1 , powerbuff , 0 , -1 )
							end
							ScriptMessage( boss1 , -1 , 2 , "[SC_102707_04]" , 1 )
							say( boss1,"[SC_102707_04]")
							WriteRoleValue(boss1, EM_RoleValue_Register2,skillpower-10)
							WriteRoleValue(start, EM_RoleValue_Register2,skillpower-10)
							CastSpellLV( boss1 , boss1 , 494880 , 1 )------------------大絕招
							sleep(50)
						end
					end
					if model>=45 then ------------第二階段
						ScriptMessage( boss1 , -1 , 2 , "[SC_102707_08]" , 1 )
						local AttackTarget = ReadRoleValue( boss , EM_RoleValue_AttackTargetID )
						mob=0
						model=0
						boss_nowhp=ReadRoleValue( boss1, EM_RoleValue_HP)----讀取boss現在的血量
						boss=LuaFunc_CreateObjByObj(103079,boss1)
						AddBuff(boss, 505637 , 1 , -1 )------------------------------離開戰鬥不能回血
						ScriptMessage( boss , -1 , 2 , "[SC_102707_08]" , 1 )
						SetAttack( boss , AttackTarget)
						WriteRoleValue( boss, EM_RoleValue_PID,start)
						WriteRoleValue( boss, EM_RoleValue_HP,boss_nowhp)
						Delobj(boss1)
						BeginPlot(boss , "Lua_bk_122_boss1_102707",50)
						CastSpellLV( boss , boss , 494883 , 1 )---------播放一個停頓的法術
						SetPlot( boss , "dead" , "Lua_bk_122_dead_102707" , 10 )
					end	
				end
			elseif ggtime>600 then
				if gg==0 then 
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_102707_07]" , 1 )
					gg=1
				end
					AddBuff(boss, 505224 , 1 , -1 )--------------
					AddBuff(boss1, 505224 , 1 , -1 )--------------
			end
		end	
		if x==3 then 	----------離開戰鬥
			CombatBegin=0
			local PPL = SetSearchAllPlayer(RoomID)
			for i = 1 , PPL , 1 do 
				local ID = GetSearchResult()
				if ReadRoleValue( ID, EM_RoleValue_VOC) ~= 0 and ReadRoleValue( ID , EM_RoleValue_RoomID  ) == RoomID then 
					CancelBuff(ID , 505597 )-------清除不能使用物品的buff
					SetFlag( ID, 543622, 1 )
				end
			end	
			Lua_bk_122_boss_530426()
			Delobj(afdoor)
			Delobj(afdoor1)
			Delobj(afdoor2)
			DelObj(door)
			WriteRoleValue(start, EM_RoleValue_Register1,3)	
			WriteRoleValue(start, EM_RoleValue_Register2,0)
			gg=0
			ggtime=0
			model=0
			mob=0
			magictime=0
		end	
		
	end
end
function Lua_bk_122_boss0_102707()
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------開始的房間
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local boss=OwnerID()
	local magicball={}
	local CombatBegin = 0
	local skill1={494878,494885}------1.冰凍術 2. 火雨
	local SkillIndex=0
	local skilllv={0,1}----招式威力
	local ctime1=0
	local ctime2=0 
	local btime=0------buff時間
	local magictime=0--------生出magicball的時間
	local powerbuff=504374
	local skillpower=0
	local nowskillpower=0
	local skillseact=0
	local Luck=0
	local Play_Chose={}
	local kp=0
	local magic1=0
	local magic2=0
	local lp=0
	local x=0
	while 1 do 
		sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )   ------ 找尋目前的攻擊目標
		local BossTarget=AttackTarget
		if HateListCount( boss ) ~= 0 then	---- 確定他現在有打人
			ctime1=ctime1+1
			btime=btime+1 
			if CombatBegin == 0 then							---------------只有開場放一次
				CombatBegin = 1
				ScriptMessage( OwnerID() , -1 , 2 , "[SC_102707_01]" , 1 )
				local PPL = SetSearchAllPlayer(RoomID)
				for i = 1 , PPL , 1 do 
					local ID = GetSearchResult()
					if ReadRoleValue( ID, EM_RoleValue_VOC) ~= 0 then 
						AddBuff(ID,505597,0,-1)----無法使用物品
					end
				end	
				--door = CreateObjByFlag(102462,780440,6,1)-----------------------在旗標2上面丟入阻擋門
			--	SetModeEx( door , EM_SetModeType_Gravity, false) ---重力
			--	SetModeEx( door , EM_SetModeType_Mark, false)
			--	SetModeEx( door , EM_SetModeType_HideName, false)
			--	SetModeEx( door , EM_SetModeType_ShowRoleHead, false)
			--	SetModeEx( door , EM_SetModeType_NotShowHPMP, false)
			--	SetModeEx( door , EM_SetModeType_Obstruct, true)   -----重力
			--	SetModeEx( door , EM_SetModeType_Strikback, false) ---反擊
			--	SetModeEx( door , EM_SetModeType_Move, false) ---移動	
			--	SetModeEx( door , EM_SetModeType_Fight, false) ---可砍殺
			--	SetModeEx( door , EM_SetModeType_SearchenemyIgnore, false) 
			--	SetModeEx( door , EM_SetModeType_Searchenemy, false)
			--	SetModeEx( door , EM_SetModeType_Show, true)
			--	AddToPartition( door , RoomID )
			--	WriteRoleValue(boss, EM_RoleValue_Register1,door)	
				WriteRoleValue(start, EM_RoleValue_Register1,2)	
			end		
			if btime>= 3 then 
				if x==0 then 
				SkillIndex = 1------------------------------------------單體打王傷害
				BossTarget = AttackTarget
				ScriptMessage( OwnerID() , -1 , 2 , "[SC_102707_06]" , 1 )
				---say( OwnerID(),"[SC_102707_06]")
				CastSpellLV( OwnerID() , BossTarget , Skill1[SkillIndex] , 1 )
				x=1
				end
			end	
			if ctime1>=15 then 
				Luck=DW_Rand(100)
				if (Luck >= 0 and Luck < 25) or (Luck >= 50 and Luck < 75) then
					SkillIndex = 1------------------------------------------單體打王傷害
					BossTarget = AttackTarget
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_102707_05]" , 1 )
				--	say( OwnerID(),"[SC_102707_05]")
					CastSpellLV( OwnerID() , BossTarget , Skill1[SkillIndex] , 1 )
					sleep(20)
				elseif (Luck >= 25 and Luck < 50) or (Luck >= 75 and Luck < 101) then	
					SkillIndex = 2-------------------------------------------單體打王傷害
					Play_Chose=DW_HateRemain(0)---------
					kp=DW_Rand(table.getn(Play_Chose))
					if kp==0 then 
					end
					if kp~=0 then 
					BossTarget = Play_Chose[kp]	
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_102707_02]" , 1 )	
					say( OwnerID(),"[SC_102707_02]")					
					local caball = Lua_DW_CreateObj("obj",102420,BossTarget,0)
					SetModeEx( caball , EM_SetModeType_Show, true) ----秀出
					SetModeEx( caball , EM_SetModeType_Mark, false) ----標記
					SetModeEx( caball , EM_SetModeType_Strikback, false) ---反擊
					SetModeEx( caball , EM_SetModeType_Move, false) ---移動	
					SetModeEx( caball , EM_SetModeType_Fight, false) ---可砍殺
					SetModeEx( caball , EM_SetModeType_SearchenemyIgnore, false) ---物件不會被搜尋
					SetModeEx( caball , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
					SetModeEx( caball , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
					SetModeEx( caball , EM_SetModeType_Searchenemy, false)  ---鎖敵
					AddToPartition(caball , RoomID )
					CastSpellLv(caball,caball,494885,1)
					WriteRoleValue(caball, EM_RoleValue_Livetime,10)	---------------存在時間livetime
					sleep(20)
					end
				end
				ctime1=0
			end
		elseif HateListCount( boss ) == 0 then----------------離開戰鬥 所有值都該回歸
			if CombatBegin == 1 then
			--	say(OwnerID(),"gg")
				sleep(30)
				lp=0
				local PPL = SetSearchAllPlayer(RoomID)
				if PPL>=1 then ------------攻擊他
					for i = 1 , PPL , 1 do ---把玩家抓入房間用 
						local ID = GetSearchResult()
						if ReadRoleValue( ID , EM_RoleValue_IsDead ) ~= 1 and 
						ReadRoleValue( ID, EM_RoleValue_VOC) ~= 0  and 
						ReadRoleValue( ID , EM_RoleValue_RoomID  ) == RoomID and 
						GetDistance( ID , boss ) < 800 then
							SetAttack( boss , ID)
							break
						elseif ReadRoleValue( ID , EM_RoleValue_IsDead ) == 1 or ReadRoleValue( ID, EM_RoleValue_VOC) == 0  then 
							lp=lp+1
						end
					end
					if PPL==lp then 
						WriteRoleValue(start, EM_RoleValue_Register1,1)	
						sleep(50)
						DelObj(boss)
						CombatBegin=0
						lp=0
					end
				elseif PPL==0 then 
					WriteRoleValue(start, EM_RoleValue_Register1,1)	
					sleep(50)
					DelObj(boss)
					CombatBegin=0
				end
			end
		end
	end
end
function Lua_bk_122_boss1_102707()
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------開始的房間
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local boss=OwnerID()
	local magicball={}
	local CombatBegin = 0
	local skill1={494878,494885}------1.冰凍術 2. 拍擊 
	local SkillIndex=0
	local skilllv={0,1}----招式威力
	local ctime1=0
	local ctime2=0 
	local btime=0------buff時間
	local magictime=0--------生出magicball的時間
	local powerbuff=504374
	local skillpower=0
	local nowskillpower=0
	local skillseact=0
	local Luck=0
	local Play_Chose={}
	local kp=0
	local magic1=0
	local magic2=0
	local lp=0
	local x=0
	while 1 do 
		sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )   ------ 找尋目前的攻擊目標
		local BossTarget=AttackTarget
		if HateListCount( boss ) ~= 0 then	---- 確定他現在有打人
			magictime=magictime+1
			ctime1=ctime1+1
			btime=btime+1 
			if btime>= 3 then 
				if x==0 then 
				SkillIndex = 1------------------------------------------單體打王傷害
				BossTarget = AttackTarget
				ScriptMessage( OwnerID() , -1 , 2 , "[SC_102707_06]" , 1 )
				---say( OwnerID(),"[SC_102707_06]")
				CastSpellLV( OwnerID() , BossTarget , Skill1[SkillIndex] , 1 )
				x=1
				end
			end	
	--		if CombatBegin == 0 then							---------------只有開場放一次
		---		CombatBegin = 1
		---		door = CreateObjByFlag(102462,780440,6,1)-----------------------在旗標2上面丟入阻擋門
		---		SetModeEx( door , EM_SetModeType_Gravity, false) ---重力
		--		SetModeEx( door , EM_SetModeType_Mark, false)
		---		SetModeEx( door , EM_SetModeType_HideName, false)
		--		SetModeEx( door , EM_SetModeType_ShowRoleHead, false)
		----		SetModeEx( door , EM_SetModeType_NotShowHPMP, false)
		---		SetModeEx( door , EM_SetModeType_Obstruct, true)   -----重力
		---		SetModeEx( door , EM_SetModeType_Strikback, false) ---反擊
		---		SetModeEx( door , EM_SetModeType_Move, false) ---移動	
		----		SetModeEx( door , EM_SetModeType_Fight, false) ---可砍殺
		---		SetModeEx( door , EM_SetModeType_SearchenemyIgnore, false) 
		---		SetModeEx( door , EM_SetModeType_Searchenemy, false)
		---		SetModeEx( door , EM_SetModeType_Show, true)
		---		AddToPartition( door , RoomID )
		---		WriteRoleValue(boss, EM_RoleValue_Register1,door)	
				WriteRoleValue(start, EM_RoleValue_Register1,2)	
		--	end	
			if ctime1>=15 then 
				Luck=DW_Rand(100)
				if (Luck >= 0 and Luck < 25) or (Luck >= 50 and Luck < 75) then
					SkillIndex = 1------------------------------------------單體打王傷害
					BossTarget = AttackTarget
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_102707_05]" , 1 )
					---say( OwnerID(),"[SC_102707_05]")
					CastSpellLV( OwnerID() , BossTarget , Skill1[SkillIndex] , 1 )
					sleep(20)
				elseif (Luck >= 25 and Luck < 50) or (Luck >= 75 and Luck < 101) then	
					SkillIndex = 2-------------------------------------------單體打王傷害
					Play_Chose=DW_HateRemain(0)---------
					kp=DW_Rand(table.getn(Play_Chose))
					if kp==0 then 
					end
					if kp~=0 then 
					BossTarget = Play_Chose[kp]		
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_102707_02]" , 1 )
					say( OwnerID(),"[SC_102707_02]")
					local caball = Lua_DW_CreateObj("obj",102420,BossTarget,0)
					SetModeEx( caball , EM_SetModeType_Show, true) ----秀出
					SetModeEx( caball , EM_SetModeType_Mark, false) ----標記
					SetModeEx( caball , EM_SetModeType_Strikback, false) ---反擊
					SetModeEx( caball , EM_SetModeType_Move, false) ---移動	
					SetModeEx( caball , EM_SetModeType_Fight, false) ---可砍殺
					SetModeEx( caball , EM_SetModeType_SearchenemyIgnore, false) ---物件不會被搜尋
					SetModeEx( caball , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
					SetModeEx( caball , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
					SetModeEx( caball , EM_SetModeType_Searchenemy, false)  ---鎖敵
					AddToPartition(caball , RoomID )
					CastSpellLv(caball,caball,494885,1)
					WriteRoleValue(caball, EM_RoleValue_Livetime,10)	---------------存在時間livetime
					sleep(20)
					end
				end
				ctime1=0
			end			
		elseif HateListCount( boss ) == 0 then----------------離開戰鬥 所有值都該回歸
		--	if CombatBegin == 1 then
			--say(OwnerID(),"gg")
				sleep(30)
				lp=0
				local PPL = SetSearchAllPlayer(RoomID)
				if PPL>=1 then ------------攻擊他
					for i = 1 , PPL , 1 do ---把玩家抓入房間用 
						local ID = GetSearchResult()
						if ReadRoleValue( ID , EM_RoleValue_IsDead ) ~= 1 and ReadRoleValue( ID, EM_RoleValue_VOC) ~= 0  and ReadRoleValue( ID , EM_RoleValue_RoomID  ) == RoomID then
							SetAttack( boss , ID)
							break
						elseif ReadRoleValue( ID , EM_RoleValue_IsDead ) == 1 or ReadRoleValue( ID, EM_RoleValue_VOC) == 0  then 
							lp=lp+1
						end
					end
					if PPL==lp then 
						WriteRoleValue(start, EM_RoleValue_Register1,1)	
						sleep(50)
						DelObj(boss)
						CombatBegin=0
						lp=0
					end
				elseif PPL==0 then 
					WriteRoleValue(start, EM_RoleValue_Register1,1)	
					sleep(50)
					DelObj(boss)
				end
		---	end
		end
	end
end
function Lua_bk_122_boss2_102707()
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------開始的房間
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local boss=OwnerID()
	local magicball={}
	local CombatBegin = 0
	local skill1={494879,494886}------1.冰凍術 2. 拍擊 
	local SkillIndex=0
	local skilllv={0,1}----招式威力
	local ctime1=0
	local ctime2=0 
	local btime=0------buff時間
	local magictime=0--------生出magicball的時間
	local powerbuff=504374
	local skillpower=0
	local nowskillpower=0
	local skillseact=0
	local Luck=0
	local Play_Chose={}
	local kp=0
	local magic1=0
	local magic2=0
	local lp=0
	local x=0
	while 1 do 
		sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )   ------ 找尋目前的攻擊目標
		local BossTarget=AttackTarget
		if HateListCount( boss ) ~= 0 then	---- 確定他現在有打人
			magictime=magictime+1
			ctime1=ctime1+1
			btime=btime+1 
			if btime>= 3 then 
				if x==0 then 
				SkillIndex = 1------------------------------------------單體打王傷害
				BossTarget = AttackTarget
				ScriptMessage( OwnerID() , -1 , 2 , "[SC_102707_06]" , 1 )
				---say( OwnerID(),"[SC_102707_06]")
				CastSpellLV( OwnerID() , BossTarget , Skill1[SkillIndex] , 1 )
				x=1
				end
			end		
	--		if CombatBegin == 0 then							---------------只有開場放一次
		---		CombatBegin = 1
		---		door = CreateObjByFlag(102462,780440,6,1)-----------------------在旗標2上面丟入阻擋門
		---		SetModeEx( door , EM_SetModeType_Gravity, false) ---重力
		--		SetModeEx( door , EM_SetModeType_Mark, false)
		---		SetModeEx( door , EM_SetModeType_HideName, false)
		--		SetModeEx( door , EM_SetModeType_ShowRoleHead, false)
		----		SetModeEx( door , EM_SetModeType_NotShowHPMP, false)
		---		SetModeEx( door , EM_SetModeType_Obstruct, true)   -----重力
		---		SetModeEx( door , EM_SetModeType_Strikback, false) ---反擊
		---		SetModeEx( door , EM_SetModeType_Move, false) ---移動	
		----		SetModeEx( door , EM_SetModeType_Fight, false) ---可砍殺
		---		SetModeEx( door , EM_SetModeType_SearchenemyIgnore, false) 
		---		SetModeEx( door , EM_SetModeType_Searchenemy, false)
		---		SetModeEx( door , EM_SetModeType_Show, true)
		---		AddToPartition( door , RoomID )
		---		WriteRoleValue(boss, EM_RoleValue_Register1,door)	
				WriteRoleValue(start, EM_RoleValue_Register1,2)	
		--	end	
			if ctime1>=15 then 
				Luck=DW_Rand(100)
				if (Luck >= 0 and Luck < 25) or (Luck >= 50 and Luck < 75) then
					SkillIndex = 1------------------------------------------單體打王傷害
					BossTarget = AttackTarget
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_102707_06]" , 1 )
				---	say( OwnerID(),"[SC_102707_06]")
					CastSpellLV( OwnerID() , BossTarget , Skill1[SkillIndex] , 1 )
					sleep(20)
				elseif (Luck >= 25 and Luck < 50) or (Luck >= 75 and Luck < 101) then	
					SkillIndex = 2-------------------------------------------單體打王傷害
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_102707_03]" , 1 )
				---	say( OwnerID(),"[SC_102707_03]")
					CastSpellLV( OwnerID() , OwnerID() , Skill1[SkillIndex] , 1 )
					sleep(10)
				end
				ctime1=0
			end			
		elseif HateListCount( boss ) == 0 then----------------離開戰鬥 所有值都該回歸
			--say(OwnerID(),"gg")
		--	if CombatBegin == 1 then
				sleep(30)
				lp=0
				local PPL = SetSearchAllPlayer(RoomID)
				if PPL>=1 then ------------攻擊他
					for i = 1 , PPL , 1 do ---把玩家抓入房間用 
						local ID = GetSearchResult()
						if ReadRoleValue( ID , EM_RoleValue_IsDead ) ~= 1 and ReadRoleValue( ID, EM_RoleValue_VOC) ~= 0  and ReadRoleValue( ID , EM_RoleValue_RoomID  ) == RoomID then
							SetAttack( boss , ID)
							break
						elseif ReadRoleValue( ID , EM_RoleValue_IsDead ) == 1 or ReadRoleValue( ID, EM_RoleValue_VOC) == 0  then 
							lp=lp+1
						end
					end
					if PPL==lp then 
						WriteRoleValue(start, EM_RoleValue_Register1,1)	
						sleep(50)
						DelObj(boss)
						CombatBegin=0
						lp=0
					end
				elseif PPL==0 then 
					WriteRoleValue(start, EM_RoleValue_Register1,1)	
					sleep(50)
					DelObj(boss)
				end
		---	end
		end
	end
end
function Lua_bk_122_dead_102707()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local boss=OwnerID()
--	local door=ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
	WriteRoleValue(start, EM_RoleValue_Register1,3)	
end
function Lua_bk_122_boss_114313()
	local RoomID = ReadRoleValue( TargetID() , EM_RoleValue_RoomID )	
	local magicball = TargetID()
	local power=0--------設定為王身上之buff
	local start = ReadRoleValue(TargetID(),EM_RoleValue_PID)
	SetPlot( TargetID()  ,"touch", "" ,0 )
	AddBuff( OwnerID() , 505598, 0 , -1 )----回魔力的BUFF
	power=ReadRoleValue(start,EM_RoleValue_Register2)--------------Register2都是紀錄威力的.
	power=power+1
	WriteRoleValue(start, EM_RoleValue_Register2,power)	
	AddBuff( start , 505599, power , -1 )----ㄧ次累計一個
	sleep(10)
	CastSpellLv(TargetID(),TargetID(),494884,1)-----------播放ㄧ個破裂的法術
	sleep(10)
	Delobj(TargetID())
end
function Lua_bk_122_move_114313()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )	
	local magicball = OwnerID()
	local magic2=0 
	magic2=DW_Rand(50)
	MoveToFlagEnabled ( magicball,  false )
	LuaFunc_MoveToFlag( magicball, 780425 , magic2 , 10)-------移動到我想到的地方去
	sleep(20)
	DelObj(magicball)
end
function Lua_bk_check_505617()
	if CheckBuff(OwnerID() , 505601) == true then	--檢查火buff
		AddBuff( OwnerID() , 505605, 0 , -1 )
		---SysCastSpellLV( OwnerID() , OwnerID() , 494881 ,1)	--		
	end
end
function Lua_bk_door_102707()
	SetDefIdleMotion(OwnerID(),ruFUSION_MIME_ACTIVATE_LOOP)
end
