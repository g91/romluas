function Lua_bk_raid04_103266_easy()
	local alltime = 0
	local time1 = 1
	local time2 = 1
	local atk =0
	local ModeCheck = 504095
	local Mode1= 504085
	local Mode2= 504086
	local ma = {}
	local ball0 ={}
	local ball1 ={}
	local m0 =0
	local m1 =0
	local m2 =0
	local m3 =0
	local boss = OwnerID()
	local CombatBegin =0
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )	
	local smallball = 0
---	local sbs={}
	local door = CreateObjByFlag(103578,780425,3,1)
		SetModeEx( door , EM_SetModeType_SearchenemyIgnore, false) ---物件不會被搜尋
		SetModeEx( door , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
		SetModeEx( door , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
		SetModeEx( door , EM_SetModeType_Searchenemy, false)
		SetModeEx( door , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( door , EM_SetModeType_Mark, false)
		SetModeEx( door , EM_SetModeType_Obstruct, true)
		SetModeEx( door , EM_SetModeType_Gravity, false)
		SetModeEx( door ,EM_SetModeType_Strikback, false) ---反擊
		SetModeEx( door , EM_SetModeType_Move, false) ---移動	
		SetModeEx( door , EM_SetModeType_Fight, false) ---可砍殺
		SetModeEx( door , EM_SetModeType_Show, true) ----秀出
		AddToPartition(door , RoomID )
		WriteRoleValue(boss , EM_RoleValue_Register1,door)	
		SetPlot( OwnerID(),"dead","Lua_bk_rd04_dead_102563",50 )
	local door1 = CreateObj(102419, -1289.3,1266.2,928.4,357.4,1)
		SetModeEx( door1 , EM_SetModeType_SearchenemyIgnore, false) ---物件不會被搜尋
		SetModeEx( door1 , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
		SetModeEx( door1 , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
		SetModeEx( door1 , EM_SetModeType_Searchenemy, false)
		SetModeEx( door1 , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( door1 , EM_SetModeType_Mark, false)
		SetModeEx( door1 , EM_SetModeType_Obstruct, true)
		SetModeEx( door1 , EM_SetModeType_Gravity, false)
		SetModeEx( door1 , EM_SetModeType_Strikback, false) ---反擊
		SetModeEx( door1 , EM_SetModeType_Move, false) ---移動	
		SetModeEx( door1 , EM_SetModeType_Fight, false) ---可砍殺
		SetModeEx( door1 , EM_SetModeType_Show, true) ----秀出
		AddToPartition(door1 , RoomID )
		WriteRoleValue(boss , EM_RoleValue_Register4,door1)	
		BeginPlot( OwnerID(),"Lua_bk_rd04_op_door_103266",0 )
	local timecount = CreateObjByFlag(103272,780425,2,1)  -----在特定點生出時間計時器 ,時間計時10秒
		SetModeEx( timecount , EM_SetModeType_Show, false) ----秀出
		SetModeEx( timecount , EM_SetModeType_Mark, false) ----標記
		SetModeEx( timecount , EM_SetModeType_Strikback, false) ---反擊
		SetModeEx( timecount , EM_SetModeType_Move, false) ---移動	
		SetModeEx( timecount , EM_SetModeType_Fight, false) ---可砍殺
		SetModeEx( timecount , EM_SetModeType_SearchenemyIgnore, false) ---物件不會被搜尋
		SetModeEx( timecount , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
		SetModeEx( timecount , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
		SetModeEx( timecount , EM_SetModeType_Searchenemy, false)  ---鎖敵
		AddToPartition(timecount , RoomID )
		BeginPlot( timecount ,"Lua_black_raid04_alltime_103266",0)
		WriteRoleValue(timecount , EM_RoleValue_PID,boss)---- 再大球身上丟入王的pid  
		WriteRoleValue(boss , EM_RoleValue_Register2,timecount)	
	while 1 do 
		---PlayMotion ( OwnerID(), ruFUSION_ACTORSTATE_CAST_SP01 )
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )   ------ 找尋目前的攻擊目標
		local BossTarget=AttackTarget
		---local aaaa=HateListCount( boss )
		if HateListCount( boss ) ~= 0 then	---- 確定他現在有打人
			if CombatBegin == 0 then							---------------只有開場放一次
				CombatBegin = 1
				WriteRoleValue(timecount , EM_RoleValue_Register1,CombatBegin)
				BeginPlot( OwnerID(),"Lua_bk_rd04_cl_door_102419",0 )
			end	
			--Say(OwnerID(),"alltime"..alltime.."%%##time1="..time1.."%%time2="..time2)
			alltime =alltime +1		
			local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )			
			if CheckBuff(OwnerID() , Mode2) == true then   ----當這是第二階段的時候	
				time2=time2+1
			--	if time2== 1 or time2 ==16 or time2 ==31 or time2 ==46 then ----10秒生一次小球
			--		m1=m1+1
			--		smallball=DW_Rand(11)
			--		ball1[m1]= CreateObjByFlag(103268,780426,smallball,12)
			--		SetModeEx( ball1[m1] , EM_SetModeType_Move, false) ---移動
			--		AddToPartition(ball1[m1] , RoomID )	
			--		AddBuff( ball1[m1] , 504025 , 1 , -1 )
			--		SetPlot( ball1[m1] , "dead" , "Lua_black_ball_dead_103266" , 0 )
			--		WriteRoleValue(ball1[m1] , EM_RoleValue_Register3,boss)
			--		BeginPlot(ball1[m1],"Lua_bk_rd04_bossdead_103266",10)
			--	end
				if time2==10 then ----傳送特效
					ScriptMessage( OwnerID(), -1 , 2 , "[SC_102395_04]" , 1 )
					CastSpell( boss , boss , 493995 )
					SetModeEx( boss   , EM_SetModeType_Move , false )
				end
				if time2 == 13 then    ---15秒來一顆大球
					SetPos( boss, -1383.0, 1296.3 , 825.9 , 180.6 )---將王傳到一個地方去
					------SetPos( boss, -1020.8, -0.0 , -29.2, 180.6 )---將王傳到一個地方去
					--SetModeEx( boss   , EM_SetModeType_Move , false )-----不能移動
					---PlayMotion ( boss, ruFUSION_ACTORSTATE_CHANNEL_BEGIN )-- 播放吸取動作
					local bigball = CreateObjByFlag(103267,780425,1,1)  -----在特定點生大球 ,時間計時10秒
					SetModeEx( bigball , EM_SetModeType_SearchenemyIgnore, true) ---物件不會被搜尋
					SetModeEx(bigball , EM_SetModeType_HideName, true)  ---物件頭上是否顯示名稱
					SetModeEx( bigball , EM_SetModeType_HideMinimap, true)  ---物件是否在小地圖上顯示
					SetModeEx( bigball , EM_SetModeType_Searchenemy, false)
					SetModeEx( bigball , EM_SetModeType_NotShowHPMP, true)
					SetModeEx( bigball , EM_SetModeType_Mark, true)
					SetModeEx( bigball , EM_SetModeType_Fight, true)
					SetModeEx( bigball , EM_SetModeType_ShowRoleHead, true)
					SetModeEx( bigball , EM_SetModeType_Strikback, false)
					AddToPartition(bigball , RoomID )
					SetPlot( bigball , "dead" , "Lua_bk_rd04_bigball_dead_103266" , 10 )
					BeginPlot( bigball , "Lua_black_raid04_bigball_103266" , 0 )
					AddBuff(boss,504334,0,50) --檢查頓在不在
					AddBuff(bigball,504504,0,50) --------水晶反彈盾
					WriteRoleValue(boss , EM_RoleValue_Register5,bigball)------
					WriteRoleValue(bigball , EM_RoleValue_PID,boss)---- 再大球身上丟入王的pid  
					WriteRoleValue(bigball , EM_RoleValue_Register3,boss)
					BeginPlot(bigball,"Lua_bk_rd04_bossdead_103266",10)					
				end
				if time2==40 then ----傳送特效
					ScriptMessage( OwnerID(), -1 , 2 , "[SC_102395_04]" , 1 )
					CastSpell( boss , boss , 493995 )
					SetModeEx( boss   , EM_SetModeType_Move , false )
				end
				if time2 == 43 then     ---15秒來一顆大球
					SetPos( boss,-1383.0, 1296.3 , 825.9 , 180.6 )---將王傳到一個地方去
					---SetPos( boss, -1020.8, -0.0 , -29.2, 180.6 )---將王傳到一個地方去
					--SetModeEx( boss   , EM_SetModeType_Move , false )-----不能移動
					---PlayMotion ( boss, ruFUSION_ACTORSTATE_CHANNEL_BEGIN )-- 播放吸取動作
					local bigball = CreateObjByFlag(103267,780425,1,1)  -----在特定點生大球 ,時間計時10秒
					SetModeEx( bigball , EM_SetModeType_SearchenemyIgnore, true) ---物件不會被搜尋
					SetModeEx(bigball , EM_SetModeType_HideName, true)  ---物件頭上是否顯示名稱
					SetModeEx( bigball , EM_SetModeType_HideMinimap, true)  ---物件是否在小地圖上顯示
					SetModeEx( bigball , EM_SetModeType_Searchenemy, false)   
					SetModeEx( bigball , EM_SetModeType_NotShowHPMP, true)
					SetModeEx( bigball , EM_SetModeType_Mark, true)
					SetModeEx( bigball , EM_SetModeType_Fight, true)
					SetModeEx( bigball , EM_SetModeType_ShowRoleHead, true)
					SetModeEx( bigball , EM_SetModeType_Strikback, false)
					AddToPartition(bigball , RoomID )
				---	BeginPlot( bigball , "Lua_bk_rd04_move_102395" , 0 )
					SetPlot( bigball , "dead" , "Lua_bk_rd04_bigball_dead_103266" , 10 )
					BeginPlot( bigball , "Lua_black_raid04_bigball_103266" , 0 )
					AddBuff(boss,504334,0,50) --檢查頓在不在
					AddBuff(bigball,504504,0,50)--------水晶反彈盾
					WriteRoleValue(boss , EM_RoleValue_Register5,bigball)
					WriteRoleValue(bigball , EM_RoleValue_PID,boss)---- 再大球身上丟入王的pid  
					WriteRoleValue(bigball , EM_RoleValue_Register3,boss)
					BeginPlot(bigball,"Lua_bk_rd04_bossdead_103266",10)
				end
				if time2 == 60 then   ---剩下最後3秒時候來個大絕招打地板
					ScriptMessage( OwnerID(), -1 , 2 , "[SC_102395_05]" , 1 )
					Say(boss,"[SC_102395_05]" )
					CastSpell( OwnerID() , OwnerID() , 494736 )
					for i = 1 , table.getn(ball1), 1 do				---去找小球   還剩多少殺掉他們
						if ball1[i] ~= nil and CheckID(ball1[i] ) == true  then
							KillID(ball1[i] , ball1[i] )  ---殺掉npc指令
							Delobj(ball1[i])
						end		
					end
						time2 = 1
						alltime =0
						m1=0
					end
				end
		---------------------------------------------------第二階段開始	結束	
			if CheckBuff(OwnerID() , Mode1) == true then---第一階段判定
				BossTarget=AttackTarget
				time1=time1+1
				local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )		
				if time1==8 or time1==16 or time1==24 or time1==32 or time1==40 or time1==48 or time1==56 then
					ScriptMessage( OwnerID(), -1 , 2 , "[SC_102395_02]" , 1 )  
					CastSpell( OwnerID() , BossTarget , 493791 )----對當前目標釋放一個巨大傷害
				end
				if time1==18 or time1==36 or time1==54 then
					ScriptMessage( OwnerID(), -1 , 2 , "[SC_102395_03]" , 1 ) 
					CastSpell( OwnerID() , BossTarget , 495024 )----使用全體禁言術
				end
				if time1==5 or time1==12 or time1==19 or time1==26 or time1==33 or time1==40 or time1==47 or time1==54 then    ---每5秒生一顆小球吧
					m0=m0 +1
					smallball=DW_Rand(12)
					---sbs[m0]=smallball-----------------------------
					ball0[m0]= CreateObjByFlag(103268,780426,smallball,12)
					AddToPartition(ball0[m0] , RoomID )
					SetModeEx( ball0[m0] , EM_SetModeType_Move, false) ---移動
					AddBuff(ball0[m0], 504025 , 1 , -1 )
					SetPlot( ball0[m0] , "dead" , "Lua_black_ball_dead_103266" , 10 )
					WriteRoleValue(ball0[m0] , EM_RoleValue_Register3,boss)
					BeginPlot(ball0[m0],"Lua_bk_rd04_bossdead_103266",10)
				end
				if time1==5 or time1==10 or time1==15 or time1==20 then  ----前面20秒內,每5秒生一個法
					m2 = m2+1
					ma[m2] =LuaFunc_CreateObjByObj ( 103271 , boss )
					DelFromPartition( ma[m2] )
					SetModeEx( ma[m2] , EM_SetModeType_SearchenemyIgnore, false) ---物件不會被搜尋
					SetModeEx( ma[m2] , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
					SetModeEx( ma[m2] , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
					SetModeEx( ma[m2] , EM_SetModeType_Searchenemy, false)
					SetModeEx( ma[m2] , EM_SetModeType_NotShowHPMP, false)
					SetModeEx( ma[m2] , EM_SetModeType_Mark, false)
					SetModeEx( ma[m2] , EM_SetModeType_Move, false)
					SetModeEx( ma[m2] , EM_SetModeType_Fight, false) ---可砍殺
					---SetModeEx( ma[m2] , EM_SetModeType_Show, false)
					AddToPartition(ma[m2] , RoomID )
					---CastSpell( ma[m2] , ma[m2] , 493923 )
					BeginPlot(  ma[m2] ,"Lua_bk_raid04_magic_103271",0)
					WriteRoleValue(ma[m2] , EM_RoleValue_Register3,boss)
					BeginPlot(ma[m2],"Lua_bk_rd04_bossdead_103266",10)
				end
				if time1== 60 then -----轉換點   發飆吧無敵打地板
					ScriptMessage( OwnerID(), -1 , 2 , "[SC_102395_05]" , 1 ) 
					Say(boss,"[SC_102395_05]" )
					CastSpell( OwnerID() , OwnerID() , 494736 )
					for i = 1 , table.getn(ball0), 1 do				
						if ball0[i] ~= nil and CheckID(ball0[i] ) == true  then
							KillID(ball0[i] , ball0[i] )
							Delobj(ball0[i])
						end		
					end
					for i = 1 , table.getn(ma), 1 do				
						if ma[i] ~= nil and CheckID(ma[i] ) == true  then
							DelObj(ma[i])
						end		
					end
					time1=1
					m0=0
					m2=0
				end
			end
		elseif HateListCount( boss )  == 0 then		-------當王打到一半離開戰鬥
			PlayMotion ( OwnerID(), ruFUSION_ACTORSTATE_CAST_SP01 )
			---BeginPlot( OwnerID(),"Lua_bk_rd04_op_door_103266",0 )
			sleep(30)
			if CombatBegin==1 then
				for i = 1 , table.getn(ball1), 1 do				------刪除第一街段的球
					if ball1[i] ~= nil and CheckID(ball1[i] ) == true  then
						Delobj(ball1[i])
					end		
				end
				for i = 1 , table.getn(ball0), 1 do				-------刪除第二階段的球
					if ball0[i] ~= nil and CheckID(ball0[i] ) == true  then
						Delobj(ball0[i])
					end		
				end
				for i = 1 , table.getn(ma), 1 do				------刪除第一階段的法
					if ma[i] ~= nil and CheckID(ma[i] ) == true  then
						DelObj(ma[i])
					end		
				end
				time1=1
				time2=1
				alltime =0
				CombatBegin = 0
				WriteRoleValue(timecount , EM_RoleValue_Register1,CombatBegin)
				m0=0
				m1=0
				Hide(door1)
				local bking = CreateObjByFlag(103266,780425,4,1)---------------把王生在4的位置
				AddToPartition(bking , RoomID )
				SetModeEx( bking   , EM_SetModeType_Move , true)----可以移動
				-------------BeginPlot( OwnerID(),"Lua_bk_rd04_op_door_103266",0 )
				BeginPlot( bking,"Lua_bk_raid04_103266_easy",0 )
				Delobj(timecount)
				Delobj(door)
				Delobj(door1)
				Delobj(boss)
			end
		end 
		sleep(10)
	end
end
--------------------------------------------------------------------------------------------------------------------------------
function Lua_black_ball_dead_103266()  ----電球死亡劇情
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )	
	local ball=OwnerID()
	local bmball = Lua_DW_CreateObj("obj",102420,ball,0)
	--local bmball = LuaFunc_CreateObjByObj ( 102420, ball )
	--DelFromPartition( bmball )-------------------------------阻止他進入場景
	SetModeEx( bmball , EM_SetModeType_Show, true) ----秀出
	SetModeEx( bmball , EM_SetModeType_Mark, false) ----標記
	SetModeEx( bmball , EM_SetModeType_Strikback, false) ---反擊
	SetModeEx( bmball , EM_SetModeType_Move, false) ---移動	
	SetModeEx( bmball , EM_SetModeType_Fight, false) ---可砍殺
	SetModeEx( bmball , EM_SetModeType_SearchenemyIgnore, false) ---物件不會被搜尋
	SetModeEx( bmball , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
	SetModeEx( bmball , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
	SetModeEx( bmball , EM_SetModeType_Searchenemy, false)  ---鎖敵
	AddToPartition(bmball , RoomID )
	--------say(bmball,"xxxx")
	CastSpellLv(bmball,bmball,494738,1)
	BeginPlot( bmball ,"Lua_bk_raid04_bmball_easy",10)----把劇情丟到身上去
	DelObj(ball)
end
--------------------------------------------------------------------------------------------------------------------------------
function Lua_bk_rd04_bigball_dead_103266()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )	
	local bigball = OwnerID()
	local boss= ReadRoleValue(bigball ,EM_RoleValue_PID)
	CancelBuff( boss , 504334 )
	----------Delobj(bigball)
end
--------------------------------------------------------------------------------------------------------------------------------碰到王之後狂暴劇情 把大球消失掉
function Lua_black_raid04_bigball_103266()  -------當球碰到王處發增加傷害劇情
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )	
	local bigball = OwnerID()
	local boss= ReadRoleValue(bigball ,EM_RoleValue_PID)
	---CastSpell( boss , bigball , 493921 )
	--for i=1 ,10 ,1 do
	---say(OwnerID(),"YYYYYYYY")
	CastSpell( boss , bigball , 493921 )-------播放動作
	MoveToFlagEnabled ( bigball,  false )
	
	LuaFunc_MoveToFlag( bigball, 780425 , 2 , 10)-------大水晶球移動到第二個旗標
--	sleep(50)
	----sleep(100)
	--	if CheckBuff(boss ,504504 ) == false then
	--		SetModeEx( boss   , EM_SetModeType_Move , true)----可以移動
	--		Delobj(bigball)
	--	end
	--end
	--SetModeEx( boss   , EM_SetModeType_Move , true)----可以移動
	AddBuff( boss ,504088,0,-1 )
	---say(OwnerID(),"xxxxx")
	CancelBuff( boss , 504334 )------
	---KillID(bigball , bigball )
	---Delobj(bigball)
end
--function Lua_black_rd04_504504()---------法術去判定時時間結束後讓王正常移動
---	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )	
---	local boss = OwnerID()
---	local bigball= ReadRoleValue(boss ,EM_RoleValue_Register5)
---	SetModeEx( boss   , EM_SetModeType_Move , true)----可以移動
---	Delobj(bigball)
------end
function Lua_black_raid04_alltime_103266()------------------------時間計時器  時間到會狂暴
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )	
	local boss = ReadRoleValue( OwnerID() , EM_RoleValue_PID )	
	local timecount = OwnerID()
	local alltime = 1
	while true do	
	local CombatBegin = ReadRoleValue( OwnerID() , EM_RoleValue_Register1 )	
		if CombatBegin==1 then 
			if 	alltime ==  1  or
				alltime == 121 or 
				alltime == 241 or 
				alltime == 361 or
				alltime == 481 then  
				CancelBuff(boss,504086)
				AddBuff(boss,504085,1,600)
			end
			if 	alltime ==  61 or 
				alltime == 181 or 
				alltime == 301 or 
				alltime == 421 or
				alltime == 541 then
				CancelBuff(boss,504085)
				AddBuff(boss,504086,1,600)
			end
			if alltime ==601 then
				alltime=0
			----	ScriptMessage( boss, -1 , 2 , "[SC_102395_01]" , 1 )
			---	Say(boss,"[SC_102395_01]")
			---	AddBuff (boss,504269,1,600)	----狂暴!
			end
				alltime = alltime +1 
		end
		if CombatBegin == 0 then
			alltime =1
		end
		sleep(10)
	end	
end
function Lua_bk_raid04_magic_103271()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local magic = OwnerID()
	while 1 do 
		sleep(10)
	local npcpl = SearchRangeNPC (magic , 30)
	local y=table.getn(npcpl)-----取出來的是數量
		for i=0 , y ,1 do 
			if ReadRoleValue( npcpl[i] , EM_RoleValue_OrgID ) == 103266 then
				AddBuff( npcpl[i] , 504024 , 1 , 1)
			end
		end
	local PPL = SearchRangePlayer ( magic , 30 )	
	local x=table.getn(PPL)-----取出來的是數量
		if x == 0 then
		end
		if x ~= 0 then 
			AddBuff( PPL[0] , 504024 , 1 , 1)
		end
	end
end
function Lua_bk_raid04_bmball_easy()----------小顆水晶球死亡之後產生爆炸劇情
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local bmball = OwnerID()
	sleep(20)
	DelObj(bmball)
end
function Lua_bk_rd04_move_103266()---------水晶球出 朝王目標移動施放水晶吸取術
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local bigball = OwnerID()
	local boss= ReadRoleValue(bigball ,EM_RoleValue_PID)
	CastSpell( boss , bigball , 493921 )
	MoveToFlagEnabled ( bigball,  false )
	LuaFunc_MoveToFlag( bigball, 780425 , 2 , 10)-------大水晶球移動到第二個旗標
end
---function Lua_bk_rd04_dead_102563()------王死後門開啟
	--local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
---	local boss = OwnerID()
----	local door = ReadRoleValue( boss , EM_RoleValue_Register1 )
	--PlayMotionEX( door ,  ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP  )
	--SetModeEX( door , EM_SetModeType_Obstruct , false )
--	Hide( door )
--	Show( door , RoomID )
---	DelObj(door)
---	local timecount = ReadRoleValue( boss , EM_RoleValue_Register2 )
---	DelObj(timecount)
---end
function Lua_bk_rd04_op_door_103266()--------open
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local boss = OwnerID()
	local door = ReadRoleValue( boss , EM_RoleValue_Register4 )	
	SetIdleMotion( door , ruFUSION_ACTORSTATE_ACTIVATE_LOOP  )
	SetModeEX( door , EM_SetModeType_Obstruct , false )
	--Hide( door )
--	Show( door , RoomID )
end
function Lua_bk_rd04_cl_door_103266()----------close
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local boss = OwnerID()
	local door = ReadRoleValue( boss , EM_RoleValue_Register4 )	
	SetIdleMotion( door ,  ruFUSION_ACTORSTATE_ACTIVATE_END)
	SetModeEX( door , EM_SetModeType_Obstruct , true )
--	Hide( door )
--	Show( door , RoomID )
end
function Lua_bk_rd04_bossdead_103266()-------BOSS死亡之後去刪除其他物件
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local boss= ReadRoleValue(OwnerID() ,EM_RoleValue_Register3)
	while 1 do
	sleep(10)
		if ReadRoleValue( boss , EM_RoleValue_IsDead) == 1 and
			ReadRoleValue( boss , EM_RoleValue_IsPlayer) == 0 then
			BeginPlot( boss,"Lua_bk_rd04_op_door_103266",0 )
			DelObj(OwnerID())
		end
	end
end