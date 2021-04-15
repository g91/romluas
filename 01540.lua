function Lua_bk_wd_102623()--------------------------水龍之靈AI
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local alltime=0-----全部
	local time1=0------大絕招計算時間
	local time2=0------小招式計算時間
	local time3=0
	local time4=0
	local time5=0
	local boss=OwnerID()
	local CombatBegin = 0
	local he=0 ----------困難跟簡單系統
	local skill_Rand={}--------------使用招式
	local ma_TargetID=0
	local Play_Chose={}---------------------------------------------------  隊伍所有人的位置
	local PPL = SetSearchAllPlayer(RoomID )
	local kp=0
	local skill={494253,494254}------1.冰凍術 2. 拍擊 
	local skilllv1={0,1}------------------------------簡單模式
	local skilllv2={1,5}-------------------------------中等模式
	local skilllv3={2,2}-------------------------------困難模式
	local MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )	--讀取血量
	local ma = ReadRoleValue( boss , EM_RoleValue_Register2 )----------------------讀取王使用次數
----	local ma=0
	local magic={}
	local mm0 =0
	local bossmagic={}
	local s1=0
	local s2=0
	local Luck=0
	local X=0
	local Y=0
	local Z=0
	local Dir=0
	local door=0
	local ball
	local sb=0
	local st=0------------------難度轉換次數
	local bbb={}
	local walk=0
	----local wb=0
	while 1 do 
		sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )   ------ 找尋目前的攻擊目標
		local BossTarget=AttackTarget
		if Ver_Zone118_WaterDragon[ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)] == 2 then 
			-------------say(boss,"1111111111111111111111111111")
			BeginPlot( boss ,"Lua_bk_wd_dead_102623",0)--------------------------------------------寶相!!!!
			break
		end
		if HateListCount( boss ) ~= 0 then	---- 確定他現在有打人

			if CombatBegin == 0 then							---------------只有開場放一次
				CombatBegin = 1
				door = CreateObjByFlag(102462,780440,6,1)-----------------------在旗標2上面丟入阻擋門
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
				WriteRoleValue(boss, EM_RoleValue_Register3,door)	
				---------WriteRoleValue(timecount , EM_RoleValue_Register1,CombatBegin) 
				--------------	say(boss,"CombatBegin"..CombatBegin)
			end	
			local NowHP = ReadRoleValue(  OwnerID() , EM_RoleValue_HP )
			local HPPercent = NowHP / MaxHP	--血量百分比
			local partymember = LuaFunc_PartyData(AttackTarget)	
			he = ReadRoleValue( boss , EM_RoleValue_Register1 )---------讀取he的值
			if HPPercent <0.95 then
				if s1==0 then 
					if he ==1 then 
					end
					if he ==0 then 
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_102623_1]" , 1 )----------------- 每秒讀取血量  當血量低於95 %喊話
					--------[102623]已經提高戒備，接下來只能靠你們自己了......
					s1=1
					end
				end
				if s1 ==1 then 
				end
			end
			if HPPercent <=0.45 then 
				AddBuff(boss,504805,1,600)
			end
			if HPPercent < 0.5 then 
				if s2==0 then 
				ScriptMessage( OwnerID() , -1 , 2 , "[SC_102623_0]" , 1 )
				s2=1
				end
			end
			
			alltime = alltime + 1
			time1=time1+1--------------------------------------基本招式	
			time2=time2+1---------------------------------------大三彈
			time3=time3+1------------------------------------水桶時間
			time4=time4+1----------------------------------恐懼
			time5=time5+1-----------------------大水旦
		---	say(boss,"he=="..he)
			if he ==1 then ------------- 我們是腦殘我要簡單打   這裡是簡單打模式歐輸出請注意
				if st==0 then 
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_102623_12]" , 1 )
					st=3
				end
				if time3==4 then --------------每4秒產生一個
					ball=DW_Rand(20)
					local wb=CreateObjByFlag(113594,780426,ball,1)---------------------------在水龍的場上產生物品
					SetModeEx( wb , EM_SetModeType_Show, true)
					SetModeEx( wb , EM_SetModeType_Fight , false )
					AddToPartition( wb , RoomID )
					SetPlot( wb , "touch" , "Lua_bk_wb_113594" , 30 )-----產生一個物件讓玩家去撿取物品
					BeginPlot( wb , "Lua_bk_wd_dd_206005",300)------------------------------------刪除劇情----10秒
					time3=0
				end
				if time2>=7 then
					Luck=DW_Rand(100)
					---say(boss,"Luck"..Luck)
					-----------if (Luck >= 0 and Luck < 34) then --- or (Luck >= 50 and Luck < 75) then
					if (Luck >= 0 and Luck < 25) or (Luck >= 50 and Luck < 75) then
						SkillIndex = 2-------------------------------------------單體打王傷害
						BossTarget = AttackTarget
						CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , skilllv1[SkillIndex] )
						ScriptMessage( OwnerID() , -1 , 2 , "[SC_102623_10]" , 1 )
						sleep(20)
					---------elseif (Luck >= 34 and Luck < 66) then ----or (Luck >= 75 and Luck < 100) then	
					elseif (Luck >= 25 and Luck < 50) or (Luck >= 75 and Luck < 101) then	
						SkillIndex = 1-------------------------------------------單體打王傷害
						Play_Chose=DW_HateRemain(1)----------仇恨表去掉主坦
						kp=DW_Rand(table.getn(Play_Chose))
						if kp==0 then 
						end
						if kp~=0 then 
						BossTarget = Play_Chose[kp]		
						CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , skilllv1[SkillIndex] )
						ScriptMessage( OwnerID() , -1 , 2 , "[SC_102623_11]" , 1 )
						sleep(20)
						end
					---elseif (Luck >= 66 and Luck < 101) then 
					----	SkillIndex = 3-------------------------------------------單體打王傷害
					---	BossTarget = AttackTarget
					---	CastSpellLV( OwnerID() , boss , Skill[SkillIndex] , skilllv1[SkillIndex] )
					end
					time2=0
				end
				while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID ) ~= 0   do
						sleep(10)
				end
				if time4>=15 then----------------15秒一次
					Play_Chose=DW_HateRemain(1)----------仇恨表去掉主坦
					kp=DW_Rand(table.getn(Play_Chose))
					if kp==0 then 
					end
					if kp~=0 then 
					BossTarget = Play_Chose[kp]		
					CastSpellLV( OwnerID() , Play_Chose[kp] , 494298 , 0 )---------隨機孔一個
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_102623_9]" , 1 )
					sleep(20)
					end
					time4=0
				end
				while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID ) ~= 0   do
						sleep(10)
				end
				if time1>=20 then ------------20秒一次
					if sb==0 then 
						BossTarget = AttackTarget
						CastSpellLV( OwnerID() , BossTarget , 494276 , 0 )
						ScriptMessage( OwnerID() , -1 , 2 , "[SC_102623_8]" , 1 )
						sleep(30)
						sb=1
					elseif sb==1 then 
					end
				end
				while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID ) ~= 0   do
						sleep(10)
				end
				if time1>=30 then 
					local dt = CreateObjByFlag(102461,780440,2,1)------------創立一個隱形的物件
					SetModeEx( dt , EM_SetModeType_HideName, false)
					SetModeEx( dt , EM_SetModeType_ShowRoleHead, false)---------點及是否顯示頭像框
					SetModeEx( dt , EM_SetModeType_NotShowHPMP, false)
					SetModeEx( dt , EM_SetModeType_Mark, false)  -----可否點選
					SetModeEx( dt , EM_SetModeType_Strikback, false) ---反擊
					SetModeEx( dt , EM_SetModeType_Move, false) ---移動	
					SetModeEx( dt , EM_SetModeType_Fight, false) ---可砍殺
					AddToPartition(dt , RoomID )----------------物件放入房間
					sysCastSpellLV( OwnerID() , OwnerID() , 494144 , 0 )
					PlayMotion ( OwnerID(),ruFUSION_ACTORSTATE_CRAFTING_BEGIN )
					ScriptMessage( OwnerID(), -1 , 2 , "[SC_102623_7]" , 2 )---------------以雷特費提之名，毀滅ㄧ切吧！
					say(boss,"[SC_102623_7]")
					SetModeEx( OwnerID() , EM_SetModeType_Fight, false) ---可砍殺
					SetModeEx( OwnerID() , EM_SetModeType_Move, false) ---移動	
					sleep(30)
					SetIdleMotion( OwnerID() ,ruFUSION_ACTORSTATE_CRAFTING_LOOP)-----------------------保持飛天的狀態
					CastSpellLV( OwnerID() , dt , 494145 , 0 )
					sleep(50)
					while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID ) ~= 0   do
						sleep(2)
					end
					Play_Chose=DW_HateRemain(0)
					kp=table.getn (Play_Chose)-----------------------------取出table的數量
					------------------------------------say(boss,"kp="..kp)
					for i=1 , kp , 1 do 
						if CheckBuff( Play_Chose[i] , 504613) == false  then --------------------檢查是否存在有一個水鎮的buff
						SysCastSpellLV( boss ,Play_Chose[i] , 494250 , 0 )-------------最爛的
						end
					end
					SetIdleMotion( OwnerID() ,ruFUSION_ACTORSTATE_CRAFTING_LOOP)-----------------------保持飛天的狀態
					sleep(20)
					PlayMotion ( OwnerID(), ruFUSION_ACTORSTATE_CRAFTING_END )---------------------播放下來
					SetModeEx( OwnerID() , EM_SetModeType_Fight, true) ---可砍殺
					SetModeEx( OwnerID() , EM_SetModeType_Move, true) ---移動	
					SetIdleMotion( OwnerID() ,  ruFUSION_ACTORSTATE_NORMAL)--------保持地下模式
				---------------------	Debugmsg(0,0,"4")
					DelObj(dt)
					time1=0
					sb=0
				end
			--	if alltime>=40 then ---------------------刪除法陣
			--		mm0=0
			--		alltime=0
			--	end	
			elseif he ==0 then ------------- 我們是高手我要正常打  
			-------------------------------------------------------------------------------------------------------------------------------正常技能使用
				ma = ReadRoleValue( boss , EM_RoleValue_Register2 )
			-----	say(boss,"ma=="..ma)
				if ma == 4 then 
					if st==0 then 
					ScriptMessage( OwnerID(), -1 , 2 , "[SC_102623_13]" , 2 )---------------以雷特費提之名，毀滅ㄧ切吧！
					st=1
					end
				end
		---		if ma == 7 then 
			---		if st==1 then 
			--		ScriptMessage( OwnerID(), -1 , 2 , "[SC_102623_14]" , 2 )---------------以雷特費提之名，毀滅ㄧ切吧！
			--		st=2
		--			end
		--		end
				if time3==4 then --------------每4秒產生一個
					if ma >= 0 and ma < 4 then 
						ball=DW_Rand(20)
						local wb=CreateObjByFlag(113594,780426,ball,1)---------------------------在水龍的場上產生物品
						SetModeEx( wb , EM_SetModeType_Show, true)
						SetModeEx( wb , EM_SetModeType_Fight , false )
						AddToPartition(wb,RoomID)
						SetPlot( wb , "touch" , "Lua_bk_wb_113594" , 30 )-----產生一個物件讓玩家去撿取物品
						BeginPlot( wb , "Lua_bk_wd_dd_206005",100 )------------------------------------刪除劇情----10秒
						time3=0
					elseif ma >= 4 and  ma < 7 then
						ball=DW_Rand(20)
						local wb=CreateObjByFlag(113594,780426,ball,1)---------------------------在水龍的場上產生物品
						SetModeEx( wb , EM_SetModeType_Show, true)
						SetModeEx( wb , EM_SetModeType_Fight , false )
						AddToPartition(wb,RoomID)
						SetPlot( wb , "touch" , "Lua_bk_wb_113594" , 30 )-----產生一個物件讓玩家去撿取物品
						BeginPlot( wb , "Lua_bk_wd_dd_206005",300 )------------------------------------刪除劇情----10秒
						time3=0
					end
				end
				if time2>=7 then
					ma = ReadRoleValue( boss , EM_RoleValue_Register2 )--------------------讀取現在需要使用法術等級
					if ma >= 0 and  ma < 4 then --------------------判斷身上的buff
					    Luck=DW_Rand(100)
						---if (Luck >= 0 and Luck < 34) then 
						if (Luck >= 0 and Luck < 25) or (Luck >= 50 and Luck < 75) then
							SkillIndex = 2------------------------------------------單體打王傷害
							BossTarget = AttackTarget
							CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv3[SkillIndex] )
							ScriptMessage( OwnerID() , -1 , 2 , "[SC_102623_10]" , 1 )
							sleep(20)
						---elseif (Luck >= 34 and Luck < 67) then 
						elseif (Luck >= 25 and Luck < 50) or (Luck >= 75 and Luck < 101) then	
							SkillIndex = 1-------------------------------------------單體打王傷害
							Play_Chose=DW_HateRemain(1)----------仇恨表去掉主坦
							kp=DW_Rand(table.getn(Play_Chose))
							if kp==0 then 
							end
							if kp~=0 then 
							BossTarget = Play_Chose[kp]															
							CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv3[SkillIndex] )
							ScriptMessage( OwnerID() , -1 , 2 , "[SC_102623_11]" , 1 )
							sleep(20)
							end
						---elseif (Luck >= 67 and Luck < 101) then  
						--	SkillIndex = 3-------------------------------------------單體打王傷害
						---	BossTarget = AttackTarget
						--	CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv3[SkillIndex] )	
						end
					end
				
					if ma >= 4 and  ma < 7 then
						Luck=DW_Rand(100)
						---if (Luck >= 0 and Luck < 34) then 
						if (Luck >= 0 and Luck < 25) or (Luck >= 50 and Luck < 75) then
							SkillIndex = 2-------------------------------------------單體打王傷害
							BossTarget = AttackTarget
							CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv2[SkillIndex] )
							ScriptMessage( OwnerID() , -1 , 2 , "[SC_102623_10]" , 1 )
							sleep(20)
						----elseif (Luck >= 34 and Luck < 67) then 	
						elseif (Luck >= 25 and Luck < 50) or (Luck >= 75 and Luck < 101) then	
							SkillIndex = 1-------------------------------------------單體打王傷害
							Play_Chose=DW_HateRemain(1)----------仇恨表去掉主坦
							kp=DW_Rand(table.getn(Play_Chose))
							if kp==0 then 
							end
							if kp~=0 then 
							BossTarget = Play_Chose[kp]		
							CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv2[SkillIndex] )
							ScriptMessage( OwnerID() , -1 , 2 , "[SC_102623_11]" , 1 )
							sleep(20)
							end
					---	elseif (Luck >= 67 and Luck < 101) then  	
						---	SkillIndex = 3-------------------------------------------單體打王傷害
						--	BossTarget = AttackTarget
						--	CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv2[SkillIndex] )
						end		
					end
					
					time2=0
				end
				while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID ) ~= 0   do
						sleep(10)
				end
				-------------------------------------------------------------------------------------------------------------------------------連續技能
				if time4>=15 then----------------15秒一次
					SkillIndex = 3
					if ma >= 0 and  ma < 4 then---------------------------最高等級
						Play_Chose=DW_HateRemain(1)----------仇恨表去掉主坦
						kp=DW_Rand(table.getn(Play_Chose))
						if kp==0 then 
						end
						if kp~=0 then 
							BossTarget = Play_Chose[kp]		
							CastSpellLV( OwnerID() , Play_Chose[kp] , 494297 , 0 )---------隨機孔一個
							ScriptMessage( OwnerID() , -1 , 2 , "[SC_102623_9]" , 1 )	
							sleep(20)
						end
					end
					if ma >= 4 and  ma < 7 then---------------------------最中等級
						Play_Chose=DW_HateRemain(1)----------仇恨表去掉主坦
						kp=DW_Rand(table.getn(Play_Chose))
						if kp==0 then 
						end
						if kp~=0 then 
							BossTarget = Play_Chose[kp]		
							CastSpellLV( OwnerID() , Play_Chose[kp] , 494298 , 0 )---------隨機孔一個
							ScriptMessage( OwnerID() , -1 , 2 , "[SC_102623_9]" , 1 )	
							sleep(20)
						end
					end
					time4=0
				end
				while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID ) ~= 0   do
						sleep(10)
				end
				if time1 >= 20 then -----------------時間到了我要使用技能囉
					if sb==0 then 
						ma = ReadRoleValue( boss , EM_RoleValue_Register2 )--------------------讀取現在需要使用法術等級
						Play_Chose=DW_HateRemain(0)-------------------------------讀取仇恨表所有人
						if ma >= 0 and  ma < 4 then---------------------------最高等級
							BossTarget = AttackTarget
							CastSpellLV( OwnerID() , BossTarget , 494256 , 0 )
							ScriptMessage( OwnerID() , -1 , 2 , "[SC_102623_8]" , 1 )	
							sleep(30)
					-----------------------------	----
						end
						if ma >= 4 and  ma < 7 then---------------------------最中等級
							BossTarget = AttackTarget
							CastSpellLV( OwnerID() , BossTarget , 494276 , 0 )
							ScriptMessage( OwnerID() , -1 , 2 , "[SC_102623_8]" , 1 )	
							sleep(30)
						end
						sb=1
					elseif sb==1 then 
					end
					-----time1=0
				end
				while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID ) ~= 0   do
						sleep(10)
				end
				if time1>=30 then 
					WriteRoleValue(boss , EM_RoleValue_Register4,0)
					local dt = CreateObjByFlag(102461,780440,2,1)------------創立一個隱形的物件
					-----local dt = CreateObjByFlag(100469,780440,2,1)------------創立一個隱形的物件
					SetModeEx( dt , EM_SetModeType_HideName, false)
					SetModeEx( dt , EM_SetModeType_ShowRoleHead, false)---------點及是否顯示頭像框
					SetModeEx( dt , EM_SetModeType_NotShowHPMP, false)
					SetModeEx( dt , EM_SetModeType_Mark, false)  -----可否點選
					SetModeEx( dt , EM_SetModeType_Strikback, false) ---反擊
					SetModeEx( dt , EM_SetModeType_Move, false) ---移動	
					SetModeEx( dt , EM_SetModeType_Fight, false) ---可砍殺
					AddToPartition(dt , RoomID )----------------物件放入房間
					sysCastSpellLV( OwnerID() , OwnerID() , 494144 , 0 )
					PlayMotion ( OwnerID(),ruFUSION_ACTORSTATE_CRAFTING_BEGIN )
					ScriptMessage( OwnerID(), -1 , 2 , "[SC_102623_7]" , 2 )---------------以雷特費提之名，毀滅ㄧ切吧！
					say(boss,"[SC_102623_7]")
					SetModeEx( OwnerID() , EM_SetModeType_Fight, false) ---可砍殺
					SetModeEx( OwnerID() , EM_SetModeType_Move, false) ---移動	
					sleep(30)
					SetIdleMotion( OwnerID() ,ruFUSION_ACTORSTATE_CRAFTING_LOOP)-----------------------保持飛天的狀態
					CastSpellLV( OwnerID() , dt , 494145 , 0 )
					sleep(50)
					while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID ) ~= 0   do
					sleep(2)
					end
					Play_Chose=star_HateListSort(boss)
					kp=table.getn (Play_Chose)-----------------------------取出table的數量
					---say(boss,"kp="..kp)
					if ma >= 0 and  ma < 4 then---------------------------最高等級
						for i=1 , kp , 1 do 
							if CheckBuff( Play_Chose[i] , 504613) == false  then --------------------檢查是否存在有一個水鎮的buff
						---	say(boss,"kp="..Play_Chose[i])
							SysCastSpellLV( boss ,Play_Chose[i] , 494249 , 0 )-------------最難的
							end
						end
					end
					if ma >= 4 and  ma < 7 then---------------------------最中等級
						for i=1 , kp , 1 do 
							if CheckBuff( Play_Chose[i] , 504613) == false  then --------------------檢查是否存在有一個水鎮的buff
							SysCastSpellLV( boss ,Play_Chose[i] , 494250 , 0 )-------------中等
							end
						end
					end
					PlayMotion ( OwnerID(), ruFUSION_ACTORSTATE_CRAFTING_END )---------------------播放下來
					SetModeEx( OwnerID() , EM_SetModeType_Move, true)
					SetModeEx( OwnerID() , EM_SetModeType_Fight, true) ---可砍殺
					SetIdleMotion( OwnerID() ,  ruFUSION_ACTORSTATE_NORMAL)--------保持地下模式
					DelObj(dt)
					time1=0
					sb=0
					for i = 1 , partymember[0] , 1 do
						if ReadRoleValue( partymember[i] , EM_RoleValue_IsDead ) == 0 or CheckBuff( partymember[i] , 504689) == false or CheckBuff( partymember[i] , 504806) == false  then 						
							local bbbTemp = lua_star_CreateNPC( partymember[i] , 0 , 102649 , 10 , RoomID )	--------生出自爆蟲
							SetModeEx( bbbTemp , EM_SetModeType_Fight , false )--可砍殺攻擊
							SetModeEx( bbbTemp , EM_SetModeType_Strikback, false )--反擊
							SetModeEx( bbbTemp , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
							SetModeEx( bbbTemp , EM_SetModeType_Mark, false )--標記
							SetModeEx( bbbTemp , EM_SetModeType_Move, true )--移動
							SetModeEx( bbbTemp , EM_SetModeType_Searchenemy, false )--索敵
							SetModeEx( bbbTemp , EM_SetModeType_ShowRoleHead, false )--頭像框
							SetModeEx( bbbTemp , EM_SetModeType_HideName, false )--名稱
							SetModeEx( bbbTemp , EM_SetModeType_Show, true )--名稱
							DelFromPartition( bbbTemp )
							AddToPartition( bbbTemp ,RoomID)	
							AddBuff(bbbTemp,504752,1,600)-----我就幫你上buff
							bbb[table.getn( bbb )+1] = bbbTemp	
							WriteRoleValue(bbbTemp , EM_RoleValue_Register1,partymember[i])-------------------------
							BeginPlot(bbbTemp , "Lua_bk_bb_102649_5",20) -----追秒開始
							
						---	Setplot( bbbTemp , "range" , "Lua_bk_bb_102649_2" , 40)-------------丟入範圍劇情讓她去找人撞撞樂
						---	BeginPlot(bbbTemp , "Lua_bk_bb_102649_4",100)
						---	SetAttack( bbbTemp , partymember[i] )
						end
					end
				end
			end
		elseif HateListCount( boss ) == 0 then----------------離開戰鬥 所有值都該回歸
			if CombatBegin==1 then-------------------------------------------生出ㄧ之王
				sleep(50)
				DelObj(door)
				time1=0
				time2=0
				time3=0
				time4=0
				time5=0
				alltime=0
				st=0
				CombatBegin=0
				if Ver_Zone118_WaterDragon[ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)] == 0 then 
					local bk=CreateObjByFlag(102623,780440,3,1)-----------------------------------王開 始旗標
					AddToPartition(bk , RoomID )----------------物件放入房間
					Delobj(boss)
					BeginPlot( bk ,"Lua_bk_wd_102623",0)
				end
			end
		--	if walk==0 then 
		--		LuaFunc_MoveToFlag( boss, 780440 , 4 , 10)-------大水晶球移動到第二個旗標
		--		PlayMotion ( OwnerID(), ruFUSION_ACTORSTATE_CAST_SP01 )
		---		sleep(20)
		--		walk=1
		--	elseif walk==1 then 
		---		LuaFunc_MoveToFlag( boss, 780440 , 5 , 10)-------大水晶球移動到第二個旗標
		----		PlayMotion ( OwnerID(), ruFUSION_ACTORSTATE_CAST_SP01 )
		--		sleep(20)
		---		walk=2
		--	elseif walk==2 then 
		---		LuaFunc_MoveToFlag( boss, 780440 , 3 , 10)-------大水晶球移動到第二個旗標
		--		PlayMotion ( OwnerID(), ruFUSION_ACTORSTATE_CAST_SP01 )
		--		sleep(20)
		--		walk=0
		--	end
		end
	end
end 
function Lua_bk_wd_ma1a_102649()
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local magic=OwnerID()
	SysCastSpellLV( magic , magic , 494146 , 5 )
	---AddBuff(magic,504770,1,600)
	BeginPlot(magic , "Lua_bk_wd_mg_dd_102649",350)
	while 1 do 
		sleep(20)
		SysCastSpellLV( magic , magic , 494295 , 5 )
	end
end
function Lua_bk_wd_ma1_102649()------------------------------------------------------------困難
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local boss=OwnerID()
	local magic =LuaFunc_CreateObjByObj ( 102461 , TargetID() )
	SetModeEx( magic , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( magic , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( magic , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( magic , EM_SetModeType_Mark, false )--標記
	SetModeEx( magic , EM_SetModeType_Move, false )--移動
	SetModeEx( magic , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( magic , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( magic , EM_SetModeType_HideName, false )--名稱
	SetModeEx( magic , EM_SetModeType_Show, true )--名稱
	DelFromPartition( magic )
	AddToPartition( magic ,RoomID )	
---	WriteRoleValue(magic , EM_RoleValue_PID,boss)
	AddBuff(magic,504750,1,600)
	BeginPlot(magic,"Lua_bk_wd_ma1a_102649",10)
	local magicm=ReadRoleValue(boss,EM_RoleValue_Register4)--------------讀取EM_RoleValue_Register4的值
	if magicm < 3 then 
		AddBuff(magic,504770,1,600)-----我就幫你上buff
		magicm=magicm+1
		WriteRoleValue(boss , EM_RoleValue_Register4,magicm)
	end
	---	SysCastSpellLV( magic , magic , 494146 , 0 )
---	BeginPlot(magic , "Lua_bk_wd_mg_dd_102649",200)
    
	
end
function Lua_bk_wd_ma2_102649()------------------------------------------------------------中等
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local boss=OwnerID()
	local magic =LuaFunc_CreateObjByObj ( 102461 , TargetID() )
	SetModeEx( magic , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( magic , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( magic , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( magic , EM_SetModeType_Mark, false )--標記
	SetModeEx( magic , EM_SetModeType_Move, false )--移動
	SetModeEx( magic , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( magic , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( magic , EM_SetModeType_HideName, false )--名稱
	SetModeEx( magic , EM_SetModeType_Show, true )--名稱
	DelFromPartition( magic )
	AddToPartition( magic ,RoomID )	
---	SysCastSpellLV( magic , magic , 494147 , 0 )
	AddBuff(magic,504750,1,600)
	AddBuff(magic,504770,1,600)
----	BeginPlot(magic , "Lua_bk_wd_mg_dd_102649",200)
	BeginPlot(magic,"Lua_bk_wd_ma2a_102649",10)
	
end
function Lua_bk_wd_ma2a_102649()
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local magic=OwnerID()
-----	local boss =ReadRoleValue(m1count ,EM_RoleValue_PID)
	SysCastSpellLV( magic , magic , 494147 , 5 )
----	AddBuff(magic,504770,1,600)
	BeginPlot(magic , "Lua_bk_wd_mg_dd_102649",350)
	while 1 do 
		sleep(20)
		SysCastSpellLV( magic , magic , 494296 , 5 )
	end
end
function Lua_bk_wd_dead_102623()---------------------------------------王死掉之後寶箱選擇器
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local boss=OwnerID()
	local ma = ReadRoleValue( boss , EM_RoleValue_Register2 )----------------讀取使用了幾次
	local he = ReadRoleValue( boss , EM_RoleValue_Register1 )
	local door =ReadRoleValue( boss , EM_RoleValue_Register3 )
	local bg=0-----------------bg=寶相
	Delobj(door)
	LuaS_118toZone1_4()
	sleep(20)
	ScriptMessage( OwnerID() , -1 , 2 , "[SC_102623_15]" , 1 )
	if he == 0 then  ----------------------------------------正常模式按照使用次數來判定寶相等級
		if ma == 0 then 
			bg = CreateObjByFlag( 102564,780440,1,1)
			SetModeEx( bg , EM_SetModeType_Fight , false )--可砍殺攻擊
			AddToPartition(bg , RoomID )
		end
		if ma >=1 then 
			bg = CreateObjByFlag( 102565,780440,1,1)
			SetModeEx( bg , EM_SetModeType_Fight , false )--可砍殺攻擊
			AddToPartition(bg , RoomID )
		end
	elseif he == 1 then ---------------------------進入簡單模式寶相就是低階的
			bg = CreateObjByFlag( 102565,780440,1,1)
			SetModeEx( bg , EM_SetModeType_Fight , false )--可砍殺攻擊
			AddToPartition(bg , RoomID )
	end
	
end
function Lua_bk_wd_mg_dd_102649()
local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local magic=OwnerID()
	DelObj(magic)
end
function Lua_bk_wb_206005()------------------------------在地上產生一個冰柱點及可以得到物品
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	GiveBodyItem ( TargetID(), 206005, 1 )
	Hide(OwnerID())
	DelObj(OwnerID())
end
function Lua_bk_wd_dd_206005()
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local wb=OwnerID()
	DelObj(wb)
end
function Lua_bk_wbmg_206005()--------------對玩家使用結束恐懼的buff
	CancelBuff(TargetID() , 504689 )----------------------------------結束玩家身上buff
	CancelBuff(TargetID() , 504806 )----------------------------------結束玩家身上buff
end
function Lua_bk_wbmgch_206005()
	if ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 102623 then
		ScriptMessage( OwnerID() , -1 , 1 , "[SC_102623_16]" , 1 )-------------------------------------只能對玩家使用
		return false
	else
		if OwnerID()==TargetID() then
			return false
		else
			if GetDistance( OwnerID(), TargetID()) < 301 then
				return true
			else
				ScriptMessage( OwnerID() , -1 , 1 , "[SC_102623_17]" , 1 )-------------------------------------距離過遠
				return false
			end
		end
	end
end
function Lua_bk_wb_113594()
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	SetPlot( TargetID()  ,"touch", "" ,0 )
	BeginPlot( TargetID() , "Lua_bk_wb_206005",0 )
end
function Lua_bk_bb_102649_2()		------------自爆蟲劇情
	BeginPlot( TargetID(), "Lua_bk_bb_102649_3", 1 )	
end

function Lua_bk_bb_102649_3()		------------水牢劇情
	Setplot( OwnerID() , "range" , "" , 0)		-------避免重複觸發
	local bkball = 494299		--------水牢
	CastSpell( OwnerID() , OwnerID() , bkball)	
	sleep(30)
	DelObj(OwnerID())
end
function Lua_bk_bb_102649_4()
	DelObj(OwnerID())---------------------------------刪掉自己
end
function Lua_bk_bb_102649_5()
local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local play=ReadRoleValue(OwnerID(),EM_RoleValue_Register1)------球出目標
local bbbTemp=OwnerID()
	Setplot( bbbTemp , "range" , "Lua_bk_bb_102649_2" , 40)-------------丟入範圍劇情讓她去找人撞撞樂
	BeginPlot(bbbTemp , "Lua_bk_bb_102649_4",150)
	SetAttack( bbbTemp , play )
	
end
