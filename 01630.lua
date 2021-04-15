-----------EM_RoleValue_Register1   存放阻擋門
--------------------------使用ㄧ個法術去判定讀取多久超過10秒玩家死亡每多讀1秒去增加玩家的能力
-----1次40秒使用5次記算一下到底需要多少的量
------第二階段空中特效球使用光線砲攻擊地上的人群必須集中來讓光線砲打中
function Lua_bk_spid_start_102706()-------------------終端控制器
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local start = OwnerID()
	local afdoor = CreateObjByFlag(102914,780449,2,1)
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
	local boss = CreateObjByFlag(102706,780449,1,1)
	AddToPartition( boss , RoomID )
	WriteRoleValue( boss, EM_RoleValue_PID,start)
	BeginPlot( boss ,"Lua_bk_spid_102706",0)---------------------------------王劇情模式
	SetPlot( boss , "dead" , "Lua_bk_spid_dead_102706" , 10 )
	local x=0
	while 1 do 
	sleep(10)
		local x=ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
		if x==1 then
			local boss = CreateObjByFlag(102706,780449,1,1)
			AddToPartition( boss , RoomID )
			WriteRoleValue( boss, EM_RoleValue_PID,start)
			BeginPlot( boss ,"Lua_bk_spid_102706",0)---------------------------------王劇情模式
			SetPlot( boss , "dead" , "Lua_bk_spid_dead_102706" , 10 )
			WriteRoleValue(start, EM_RoleValue_Register1,0)	
			x=0
			sleep(50)
		end
		if x==2 then 	
			local PPL = SetSearchAllPlayer(RoomID)
			for i = 1 , PPL , 1 do 
				local ID = GetSearchResult()
				CancelBuff(ID , 505037 )
			end	
			Delobj(afdoor)
			WriteRoleValue(start, EM_RoleValue_Register1,3)	
		end	
	end
end
function Lua_bk_spid_dead_102706()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local boss=OwnerID()
	local door=ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
	WriteRoleValue(start, EM_RoleValue_Register1,2)	
	DelObj(door)
end

function Lua_bk_mam1_102882()------------------戰士-----ㄧ開始讓她找仇恨表
local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------開始的房間
local war=OwnerID()
local boss=ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
local bt=ReadRoleValue(OwnerID(),EM_RoleValue_PID)------------------被綁的人
local time1=0
local power=0
local skill={494510,494511}-----------1.全體恐懼 2.劍氣縱橫
local SkillIndex
local Play_Chose={}
local kp=0
local Luck=0
	AddBuff(war,505100,0,-1)
	while 1 do
	sleep(10)
		if ReadRoleValue( bt , EM_RoleValue_IsPlayer) == 1 and 
			CheckBuff( boss,505121) == true then ---------------------確定綁人buff的存在
			AddBuff(war,505038,0,-1)----------------加強一個buff
			power=power+1
		elseif ReadRoleValue( bt , EM_RoleValue_IsPlayer) == 0 or 
				CheckBuff( boss,505121) == false then 
				CancelBuff(bt,505036)
				AddBuff(bt,505042,0,10)----------------衰弱
			   break
		end
	end
	SetModeEx( war , EM_SetModeType_Strikback, true) ---反擊
	SetModeEx( war , EM_SetModeType_Move, true) ---移動	
	SetModeEx( war , EM_SetModeType_Fight, true) ---可砍殺
	SetModeEx(  war , EM_SetModeType_Searchenemy, true )--索敵
	SetAttack( OwnerID() , bt)
	sleep(50)
	while 1 do 
	sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )   ------ 找尋目前的攻擊目標
		local BossTarget=AttackTarget
		if HateListCount( war ) ~= 0 then	---- 確定他現在有打人
			time1=time1+1-------------------------時間
			if time1>= 10 then ----------------爆烈炫風
			Luck=DW_Rand(100)
				if (Luck >= 0 and Luck < 25) or (Luck >= 50 and Luck < 75) then
					SkillIndex = 2-------------------------------------------單體打王傷害
					Play_Chose=DW_HateRemain(0)
					kp=DW_Rand(table.getn(Play_Chose))
					if kp==0 then 
					end
					if kp~=0 then 
					CastSpellLV( OwnerID() , Play_Chose[kp] , 494511, 0 )
					sleep(20)
					end
				elseif (Luck >= 25 and Luck < 50) or (Luck >= 75 and Luck < 101) then	
					SkillIndex = 1-------------------------------------------單體打王傷害
					CastSpellLV( OwnerID() , OwnerID() , Skill[SkillIndex] , power )
				end
				
			end
		elseif HateListCount( war ) == 0 then
		sleep(20)
		DelObj(war)
		end
	end
end
function Lua_bk_mam2_102883()-------------------遊俠
local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------開始的房間
local boss=ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
local bt=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
local sco=OwnerID()
local time1=0
local power=0
local Play_Chose={}
local m=0
local range=0
local htemp
local x
local kp
local Luck
	AddBuff(sco,505101,0,-1)
	while 1 do
	sleep(10)
		if ReadRoleValue( bt , EM_RoleValue_IsPlayer) == 1 and 
			CheckBuff( boss,505121) == true then ---------------------確定綁人buff的存在
			AddBuff(sco,505038,0,-1)----------------加強一個buff
			power=power+1
		elseif ReadRoleValue( bt , EM_RoleValue_IsPlayer) == 0 or 
				CheckBuff( boss,505121) == false then 
				CancelBuff(bt,505036)
				AddBuff(bt,505042,0,10)----------------衰弱
			   break
		end
	end
	SetModeEx( sco , EM_SetModeType_Strikback, true) ---反擊
	SetModeEx( sco , EM_SetModeType_Move, true) ---移動	
	SetModeEx( sco , EM_SetModeType_Fight, true) ---可砍殺
	SetModeEx( sco , EM_SetModeType_Searchenemy, true )--索敵
	SetAttack( OwnerID() , bt)
	sleep(50)
	while 1 do 
	sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )   ------ 找尋目前的攻擊目標
		local BossTarget=AttackTarget
		if HateListCount( sco ) ~= 0 then	---- 確定他現在有打人
		time1=time1+1-------------------------時間
			if time1>= 10 then ----------------爆烈炫風
				Luck=DW_Rand(100)
				if (Luck >= 0 and Luck < 25) or (Luck >= 50 and Luck < 75) then
					Play_Chose=DW_HateRemain(0)
					m=table.getn(Play_Chose)-----------先找出
					if m==0 then 
						
					elseif m==1 then 
						CastSpellLV( sco , Play_Chose[1] , 494512 , 0 )
					elseif m>=2 then
						for i=1,m do
							sleep(5)
							---say(ownerid(),"m="..m)
							x=GetDistance(sco,Play_Chose[i])
							if range > x then
								
							elseif range < x then
								range=x
								htemp=Play_Chose[i]
							end
						end
						CastSpellLV( sco , htemp , 494512 , 0 )
					end
				elseif (Luck >= 25 and Luck < 50) or (Luck >= 75 and Luck < 101) then	
					Play_Chose=DW_HateRemain(0)
					kp=DW_Rand(table.getn(Play_Chose))
					if kp==0 then 
					end
					if kp~=0 then 
					CastSpellLV( OwnerID() , Play_Chose[kp] , 494513 , 0 )
					sleep(20)
					end
				end
				time1=0
			end
		elseif HateListCount( sco ) == 0 then
		sleep(20)
		DelObj(sco)
		end
	end
end
function Lua_bk_mam3_102884()-------------------影者
local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------開始的房間
local boss=ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
local rog=OwnerID()
local bt=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
local time1=0
local power=0
local skill={494510,494530}-----------1.陷阱2.劇毒擴散
local SkillIndex
local Play_Chose={}
local kp
local Luck
	AddBuff(rog,505102,0,-1)
	while 1 do
	sleep(10)
		if ReadRoleValue( bt , EM_RoleValue_IsPlayer) == 1 and 
			CheckBuff( boss,505121) == true then ---------------------確定綁人buff的存在
			AddBuff(rog,505038,0,-1)----------------加強一個buff
			power=power+1
		elseif ReadRoleValue( bt , EM_RoleValue_IsPlayer) == 0 or 
				CheckBuff( boss,505121) == false then 
				CancelBuff(bt,505036)
				AddBuff(bt,505042,0,10)----------------衰弱
			   break
		end
	end
	SetModeEx( rog , EM_SetModeType_Strikback, true) ---反擊
	SetModeEx( rog , EM_SetModeType_Move, true) ---移動	
	SetModeEx( rog , EM_SetModeType_Fight, true) ---可砍殺
	SetModeEx(  rog , EM_SetModeType_Searchenemy, true )--索敵
	SetAttack( OwnerID() , bt)
	sleep(50)
	while 1 do 
	sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )   ------ 找尋目前的攻擊目標
		local BossTarget=AttackTarget
		if HateListCount( rog ) ~= 0 then	---- 確定他現在有打人
		time1=time1+1-------------------------時間
			if time1>= 10 then ----------------劇毒擴散
				Luck=DW_Rand(100)
				if (Luck >= 0 and Luck < 25) or (Luck >= 50 and Luck < 75) then
					SkillIndex = 2-------------------------------------------單體打王傷害
					BossTarget = AttackTarget
					CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , power )
					sleep(20)
				elseif (Luck >= 25 and Luck < 50) or (Luck >= 75 and Luck < 101) then	
					SkillIndex = 1 ----旗標放陷阱
					Play_Chose=DW_HateRemain(0)
					kp=DW_Rand(table.getn(Play_Chose))
					if kp==0 then 
					end
					if kp~=0 then 
					CastSpellLV( OwnerID() , Play_Chose[kp] , 494544 , 0 )
					sleep(10)
					end
					local Temp=Lua_Davis_BornByMultilateral( 102910 , 10 , 50 )	----出現10個陷阱
					SetModeEx( Temp[1] , EM_SetModeType_Mark, false) ----標記
					SetModeEx( Temp[1] , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
					SetModeEx( Temp[1] , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
					SetModeEx( Temp[1] , EM_SetModeType_Strikback, false) ---反擊
					SetModeEx( Temp[1] , EM_SetModeType_Move, false) ---移動	
					SetModeEx( Temp[1] , EM_SetModeType_Fight, false) ---可砍殺
					SetModeEx(  Temp[1] , EM_SetModeType_Searchenemy, false )--索敵
					SetModeEx( Temp[1] , EM_SetModeType_Show, false)
					WriteRoleValue(Temp[1], EM_RoleValue_Livetime,3)	---------------存在時間livetime
					BeginPlot( Temp[1] , "Lua_bk_rog_102884_1",0)---------------------------------施放法術劇情
					SetModeEx( Temp[2] , EM_SetModeType_Mark, false) ----標記
					SetModeEx( Temp[2] , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
					SetModeEx( Temp[2] , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
					SetModeEx( Temp[2] , EM_SetModeType_Strikback, false) ---反擊
					SetModeEx( Temp[2] , EM_SetModeType_Move, false) ---移動	
					SetModeEx( Temp[2] , EM_SetModeType_Fight, false) ---可砍殺
					SetModeEx(  Temp[2] , EM_SetModeType_Searchenemy, false )--索敵
					SetModeEx( Temp[2] , EM_SetModeType_Show, false)
					WriteRoleValue(Temp[2], EM_RoleValue_Livetime,3)	---------------存在時間livetime
					BeginPlot( Temp[2] , "Lua_bk_rog_102884_2",0)---------------------------------施放法術劇情
					SetModeEx( Temp[3] , EM_SetModeType_Mark, false) ----標記
					SetModeEx( Temp[3] , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
					SetModeEx( Temp[3] , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
					SetModeEx( Temp[3] , EM_SetModeType_Strikback, false) ---反擊
					SetModeEx( Temp[3] , EM_SetModeType_Move, false) ---移動	
					SetModeEx( Temp[3] , EM_SetModeType_Fight, false) ---可砍殺
					SetModeEx(  Temp[3] , EM_SetModeType_Searchenemy, false )--索敵
					SetModeEx( Temp[3] , EM_SetModeType_Show, false)
					WriteRoleValue(Temp[3], EM_RoleValue_Livetime,3)	---------------存在時間livetime
					BeginPlot( Temp[3] , "Lua_bk_rog_102884_1",0)---------------------------------施放法術劇情
					SetModeEx( Temp[4] , EM_SetModeType_Mark, false) ----標記
					SetModeEx( Temp[4] , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
					SetModeEx( Temp[4] , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
					SetModeEx( Temp[4] , EM_SetModeType_Strikback, false) ---反擊
					SetModeEx( Temp[4] , EM_SetModeType_Move, false) ---移動	
					SetModeEx( Temp[4] , EM_SetModeType_Fight, false) ---可砍殺
					SetModeEx(  Temp[4] , EM_SetModeType_Searchenemy, false )--索敵
					SetModeEx( Temp[4] , EM_SetModeType_Show, false)
					WriteRoleValue(Temp[4], EM_RoleValue_Livetime,3)	---------------存在時間livetime
					BeginPlot( Temp[4] , "Lua_bk_rog_102884_2",0)---------------------------------施放法術劇情
					SetModeEx( Temp[5] , EM_SetModeType_Mark, false) ----標記
					SetModeEx( Temp[5] , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
					SetModeEx( Temp[5] , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
					SetModeEx( Temp[5] , EM_SetModeType_Strikback, false) ---反擊
					SetModeEx( Temp[5] , EM_SetModeType_Move, false) ---移動	
					SetModeEx( Temp[5] , EM_SetModeType_Fight, false) ---可砍殺
					SetModeEx(  Temp[5] , EM_SetModeType_Searchenemy, false )--索敵
					SetModeEx( Temp[5] , EM_SetModeType_Show, false)
					WriteRoleValue(Temp[5], EM_RoleValue_Livetime,3)	---------------存在時間livetime
					BeginPlot( Temp[5] , "Lua_bk_rog_102884_1",0)---------------------------------施放法術劇情
					SetModeEx( Temp[6] , EM_SetModeType_Mark, false) ----標記
					SetModeEx( Temp[6] , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
					SetModeEx( Temp[6] , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
					SetModeEx( Temp[6] , EM_SetModeType_Strikback, false) ---反擊
					SetModeEx( Temp[6] , EM_SetModeType_Move, false) ---移動	
					SetModeEx( Temp[6] , EM_SetModeType_Fight, false) ---可砍殺
					SetModeEx(  Temp[6] , EM_SetModeType_Searchenemy, false )--索敵
					SetModeEx( Temp[6] , EM_SetModeType_Show, false)
					WriteRoleValue(Temp[6], EM_RoleValue_Livetime,3)	---------------存在時間livetime
					BeginPlot( Temp[6] , "Lua_bk_rog_102884_2",0)---------------------------------施放法術劇情
					SetModeEx( Temp[7] , EM_SetModeType_Mark, false) ----標記
					SetModeEx( Temp[7] , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
					SetModeEx( Temp[7] , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
					SetModeEx( Temp[7] , EM_SetModeType_Strikback, false) ---反擊
					SetModeEx( Temp[7] , EM_SetModeType_Move, false) ---移動	
					SetModeEx( Temp[7] , EM_SetModeType_Fight, false) ---可砍殺
					SetModeEx(  Temp[7] , EM_SetModeType_Searchenemy, false )--索敵
					SetModeEx( Temp[7] , EM_SetModeType_Show, false)
					WriteRoleValue(Temp[7], EM_RoleValue_Livetime,3)	---------------存在時間livetime
					BeginPlot( Temp[7] , "Lua_bk_rog_102884_1",0)---------------------------------施放法術劇情
					SetModeEx( Temp[8] , EM_SetModeType_Mark, false) ----標記
					SetModeEx( Temp[8] , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
					SetModeEx( Temp[8] , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
					SetModeEx( Temp[8] , EM_SetModeType_Strikback, false) ---反擊
					SetModeEx( Temp[8] , EM_SetModeType_Move, false) ---移動	
					SetModeEx( Temp[8] , EM_SetModeType_Fight, false) ---可砍殺
					SetModeEx(  Temp[8] , EM_SetModeType_Searchenemy, false )--索敵
					SetModeEx( Temp[8] , EM_SetModeType_Show, false)
					WriteRoleValue(Temp[8], EM_RoleValue_Livetime,3)	---------------存在時間livetime
					BeginPlot( Temp[8] , "Lua_bk_rog_102884_2",0)---------------------------------施放法術劇情
					SetModeEx( Temp[9] , EM_SetModeType_Mark, false) ----標記
					SetModeEx( Temp[9] , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
					SetModeEx( Temp[9] , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
					SetModeEx( Temp[9] , EM_SetModeType_Strikback, false) ---反擊
					SetModeEx( Temp[9] , EM_SetModeType_Move, false) ---移動	
					SetModeEx( Temp[9] , EM_SetModeType_Fight, false) ---可砍殺
					SetModeEx(  Temp[9] , EM_SetModeType_Searchenemy, false )--索敵
					SetModeEx( Temp[9] , EM_SetModeType_Show, false)
					WriteRoleValue(Temp[9], EM_RoleValue_Livetime,3)	---------------存在時間livetime
					BeginPlot( Temp[9] , "Lua_bk_rog_102884_1",0)---------------------------------施放法術劇情
					SetModeEx( Temp[10] , EM_SetModeType_Mark, false) ----標記
					SetModeEx( Temp[10] , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
					SetModeEx( Temp[10] , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
					SetModeEx( Temp[10] , EM_SetModeType_Strikback, false) ---反擊
					SetModeEx( Temp[10] , EM_SetModeType_Move, false) ---移動	
					SetModeEx( Temp[10] , EM_SetModeType_Fight, false) ---可砍殺
					SetModeEx(  Temp[10] , EM_SetModeType_Searchenemy, false )--索敵
					SetModeEx( Temp[10] , EM_SetModeType_Show, false)
					WriteRoleValue(Temp[10], EM_RoleValue_Livetime,3)	---------------存在時間livetime
					BeginPlot( Temp[10] , "Lua_bk_rog_102884_2",0)---------------------------------施放法術劇情
				end
				time1=0
			end
			
		elseif HateListCount( rog ) == 0 then
	
		sleep(20)
		DelObj(rog)
		end
	end
end
function Lua_bk_mam4_102885()-------------------法師
local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------開始的房間
local boss=ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
local mag=OwnerID()
local bt=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
local time1=0
local time2=0
local power=0
local skill={494531,494532,494543}-----------1.傳送術2.鳳凰3.電?術
local SkillIndex
local Luck
	AddBuff(mag,505103,0,-1)
	while 1 do
	sleep(10)
		if ReadRoleValue( bt , EM_RoleValue_IsPlayer) == 1 and 
			CheckBuff( boss,505121) == true then ---------------------確定綁人buff的存在
			AddBuff(mag,505038,0,-1)----------------加強一個buff
			power=power+1
		elseif ReadRoleValue( bt , EM_RoleValue_IsPlayer) == 0 or 
				CheckBuff( boss,505121) == false then 
				CancelBuff(bt,505036)
				AddBuff(bt,505042,0,10)----------------衰弱
			   break
		end
	end
	SetModeEx( mag , EM_SetModeType_Strikback, true) ---反擊
	SetModeEx( mag , EM_SetModeType_Move, true) ---移動	
	SetModeEx( mag , EM_SetModeType_Fight, true) ---可砍殺
	SetModeEx(  mag , EM_SetModeType_Searchenemy, true )--索敵
	SetAttack( OwnerID() , bt)
	sleep(50)
	while 1 do 
	sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )   ------ 找尋目前的攻擊目標
		local BossTarget=AttackTarget
		if HateListCount( mag ) ~= 0 then	---- 確定他現在有打人
		time1=time1+1-------------------------時間
		time2=time2+1
			if time2>12 then 
				SkillIndex = 1 ----電?術
				CastSpellLV( OwnerID() , OwnerID() , Skill[SkillIndex] , 0 )
				time2=0
			end
			if time1>= 7 then
				Luck=DW_Rand(100)
				if (Luck >= 0 and Luck < 25) or (Luck >= 50 and Luck < 75) then
					SkillIndex = 2 ---------------------鳳凰
					BossTarget = AttackTarget
					CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , power )
					sleep(20)
				elseif (Luck >= 25 and Luck < 50) or (Luck >= 75 and Luck < 101) then	
					SkillIndex = 3 ----電?術
					CastSpellLV( OwnerID() , OwnerID() , Skill[SkillIndex] , power )
				end
				time1=0
			end
		elseif HateListCount( mag ) == 0 then
		sleep(20)
		DelObj(mag)
		end
	end
end
function Lua_bk_mam5_102886()-------------------祭司
local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------開始的房間
local boss=ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
local pri=OwnerID()
local bt=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
local time1=0
local power=0
local skill={494533,494534}-----------1恐怖詛咒2.惡魔哀歌
local SkillIndex
local Play_Chose={}
local kp=0
local Luck
	AddBuff(pri,505104,0,-1)
	while 1 do
	sleep(10)
		if ReadRoleValue( bt , EM_RoleValue_IsPlayer) == 1 and 
			CheckBuff( boss,505121) == true then ---------------------確定綁人buff的存在
			AddBuff(pri,505038,0,-1)----------------加強一個buff
			power=power+1
		elseif ReadRoleValue( bt , EM_RoleValue_IsPlayer) == 0 or 
				CheckBuff( boss,505121) == false then 
				CancelBuff(bt,505036)
				AddBuff(bt,505042,0,10)----------------衰弱
			   break
		end
	end
	SetModeEx( pri , EM_SetModeType_Strikback, true) ---反擊
	SetModeEx( pri , EM_SetModeType_Move, true) ---移動	
	SetModeEx( pri , EM_SetModeType_Fight, true) ---可砍殺
	SetModeEx(  pri , EM_SetModeType_Searchenemy, true )--索敵
	SetAttack( OwnerID() , bt)
	sleep(50)
	while 1 do 
	sleep(10)
	local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )   ------ 找尋目前的攻擊目標
	local BossTarget=AttackTarget
		if HateListCount( pri ) ~= 0 then	---- 確定他現在有打人
		time1=time1+1-------------------------時間
			if time1>= 10 then
				Luck=DW_Rand(100)
				if (Luck >= 0 and Luck < 25) or (Luck >= 50 and Luck < 75) then
					SkillIndex = 1 ---------------------恐怖詛咒
					Play_Chose=DW_HateRemain(0)
					kp=DW_Rand(table.getn(Play_Chose))
					if kp==0 then 
					end
					if kp~=0 then 
					CastSpellLV( OwnerID() , Play_Chose[kp] , Skill[SkillIndex] , power )
					sleep(20)
					end
				elseif (Luck >= 25 and Luck < 50) or (Luck >= 75 and Luck < 101) then	
					SkillIndex = 2 ----.惡魔哀歌
					CastSpellLV( OwnerID() , OwnerID() , Skill[SkillIndex] , power )
				end
				time1=0
			end
		elseif HateListCount( pri ) == 0 then
		sleep(20)
		DelObj(pri)
		end
	end
end
function Lua_bk_mam6_102887()-------------------騎士
local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------開始的房間
local boss=ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
local kni=OwnerID()
local bt=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
local time1=0
local power=0
local skill={494535,494536}-----------1衝鋒2.仇恨打擊
local SkillIndex
local Play_Chose={}
local kp=0
local Luck
	AddBuff(kni,505105,0,-1)
	while 1 do
	sleep(10)
		if ReadRoleValue( bt , EM_RoleValue_IsPlayer) == 1 and 
			CheckBuff( boss,505121) == true then ---------------------確定綁人buff的存在
			AddBuff(kni,505038,0,-1)----------------加強一個buff
			power=power+1
		elseif ReadRoleValue( bt , EM_RoleValue_IsPlayer) == 0 or 
				CheckBuff( boss,505121) == false then 
				CancelBuff(bt,505036)
				AddBuff(bt,505042,0,10)----------------衰弱
			   break
		end
	end
	SetModeEx( kni , EM_SetModeType_Strikback, true) ---反擊
	SetModeEx( kni , EM_SetModeType_Move, true) ---移動	
	SetModeEx( kni , EM_SetModeType_Fight, true) ---可砍殺
	SetModeEx(  kni , EM_SetModeType_Searchenemy, true )--索敵
	SetAttack( OwnerID() , bt)
	sleep(50)
	while 1 do 
	sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )   ------ 找尋目前的攻擊目標
		local BossTarget=AttackTarget
		if HateListCount( kni ) ~= 0 then	---- 確定他現在有打人
		time1=time1+1-------------------------時間
			if time1>= 10 then
				Luck=DW_Rand(100)
				if (Luck >= 0 and Luck < 25) or (Luck >= 50 and Luck < 75) then
					SkillIndex = 1 ---------------------衝鋒
					Play_Chose=DW_HateRemain(1)----------仇恨表去掉主坦
					kp=DW_Rand(table.getn(Play_Chose))
					if kp==0 then 
					end
					if kp~=0 then 
					CastSpellLV( OwnerID() , Play_Chose[kp] , Skill[SkillIndex] , power )
					sleep(20)
					end
				elseif (Luck >= 25 and Luck < 50) or (Luck >= 75 and Luck < 101) then	
					SkillIndex = 2 ----.仇恨打擊
					Play_Chose=DW_HateRemain(1)----------仇恨表去掉主坦
					kp=DW_Rand(table.getn(Play_Chose))
					if kp==0 then 
					end
					if kp~=0 then 
					CastSpellLV( OwnerID() , Play_Chose[kp] , Skill[SkillIndex] , power )
					sleep(20)
					end
				end
				time1=0
			end
		elseif HateListCount( kni ) == 0 then
		sleep(20)
		DelObj(kni)
		end
	end
end
function Lua_bk_mam7_102888()------------------牧者--招招樂
local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------開始的房間
local boss=ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
local warden=OwnerID()
local bt=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
local time1=0
local power=0
local skill={494537,494538}-----------1召喚自然晶體2.流放
local SkillIndex
local Play_Chose={}
local kp=0
local Luck
local petnu
local pet ----------寵物代碼
	AddBuff(warden,505106,0,-1)
	while 1 do
	sleep(10)
		if ReadRoleValue( bt , EM_RoleValue_IsPlayer) == 1 and 
			CheckBuff( boss,505121) == true then ---------------------確定綁人buff的存在
			AddBuff(warden,505038,0,-1)----------------加強一個buff
			power=power+1
		elseif ReadRoleValue( bt , EM_RoleValue_IsPlayer) == 0 or 
				CheckBuff( boss,505121) == false then 
				CancelBuff(bt,505036)
				AddBuff(bt,505042,0,10)----------------衰弱
			   break
		end
	end
	SetModeEx( warden , EM_SetModeType_Strikback, true) ---反擊
	SetModeEx( warden , EM_SetModeType_Move, true) ---移動	
	SetModeEx( warden , EM_SetModeType_Fight, true) ---可砍殺
	SetModeEx( warden , EM_SetModeType_Searchenemy, true )--索敵
	SetAttack( OwnerID() , bt)
	sleep(50)
	while 1 do 
	sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )   ------ 找尋目前的攻擊目標
		local BossTarget=AttackTarget
		if HateListCount( warden ) ~= 0 then	---- 確定他現在有打人
		time1=time1+1-------------------------時間
			if time1>= 15 then
				Luck=DW_Rand(100)
				if (Luck >= 0 and Luck < 25) or (Luck >= 50 and Luck < 75) then
					SkillIndex = 1 ---------------------召喚自然晶體
					CastSpellLV( OwnerID() , OwnerID() , Skill[SkillIndex] , 0 )------使用招喚術  
					petnu=DW_Rand(3)
					if petnu==1 then 
					local pet =LuaFunc_CreateObjByObj (  102911 , OwnerID() )------------男樹人,物防高,魔防低
					BeginPlot( pet ,"Lua_bk_fd_sm_102760",50)
					end
					if petnu==2 then 
					local pet =LuaFunc_CreateObjByObj (  102912 , OwnerID() )------------女樹人,物防低,魔防高
					BeginPlot( pet ,"Lua_bk_fd_sm_102760",50)
					end
					if petnu==3 then 
					local pet =LuaFunc_CreateObjByObj (  102913 , OwnerID() )------------自然晶體血量一定時間到爆炸
					BeginPlot( pet ,"Lua_bk_fd_sm_102760",50)
					end
				elseif (Luck >= 25 and Luck < 50) or (Luck >= 75 and Luck < 101) then	
					SkillIndex = 2 ----.流放
					Play_Chose=DW_HateRemain(0)
					kp=DW_Rand(table.getn(Play_Chose))
					if kp==0 then 
					end
					if kp~=0 then 
					CastSpellLV( OwnerID() , Play_Chose[kp] , Skill[SkillIndex] , 0 )
					sleep(20)
					end
				end
				time1=0
			end
		elseif HateListCount( warden ) == 0 then
		sleep(20)
		DelObj(warden)
		end
	end
end
function Lua_bk_mam8_102889()------------------神官
local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------開始的房間
local boss=ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
local dru=OwnerID()
local bt=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
local time1=0
local power=0
local skill={494539,494540}-----------1沙塵招喚2.束縛靜默
local SkillIndex
local Play_Chose={}
local kp=0
local Luck
local x0
local y0
local z0 
local dir0

	AddBuff(dru,505107,0,-1)
	while 1 do
	sleep(10)
		if ReadRoleValue( bt , EM_RoleValue_IsPlayer) == 1 and 
			CheckBuff( boss,505121) == true then ---------------------確定綁人buff的存在
			AddBuff(dru,505038,0,-1)----------------加強一個buff
			power=power+1
		elseif ReadRoleValue( bt , EM_RoleValue_IsPlayer) == 0 or 
				CheckBuff( boss,505121) == false then 
				CancelBuff(bt,505036)
				AddBuff(bt,505042,0,10)----------------衰弱
			   break
		end
	end
	SetModeEx( dru , EM_SetModeType_Strikback, true) ---反擊
	SetModeEx( dru , EM_SetModeType_Move, true) ---移動	
	SetModeEx( dru , EM_SetModeType_Fight, true) ---可砍殺
	SetModeEx( dru , EM_SetModeType_Searchenemy, true )--索敵
	SetAttack( OwnerID() , bt)
	sleep(50)
	while 1 do 
	sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )   ------ 找尋目前的攻擊目標
		local BossTarget=AttackTarget
		if HateListCount( dru ) ~= 0 then	---- 確定他現在有打人
		time1=time1+1-------------------------時間
			if time1>= 10 then
				Luck=DW_Rand(100)
				if (Luck >= 0 and Luck < 25) or (Luck >= 50 and Luck < 75) then
					SkillIndex = 1 ---------------------沙塵招喚
					Play_Chose=DW_HateRemain(0)
					kp=DW_Rand(table.getn(Play_Chose))
					if kp==0 then 
					end
					if kp~=0 then 
					BossTarget = Play_Chose[kp]		
					-------------------------------------
					x0=ReadRoleValue(Play_Chose[kp],EM_RoleValue_X)
					y0=ReadRoleValue(Play_Chose[kp],EM_RoleValue_Y)
					z0=ReadRoleValue(Play_Chose[kp],EM_RoleValue_Z)
					dir0=ReadRoleValue(Play_Chose[kp],EM_RoleValue_Dir)
					local cst=CreateObj(102910,x0,y0,z0,dir0,1)------------------考慮上個標記
					SetModeEx( cst , EM_SetModeType_Gravity, false) ---重力
					SetModeEx( cst , EM_SetModeType_Mark, false)
					SetModeEx( cst , EM_SetModeType_HideName, false)
					SetModeEx( cst , EM_SetModeType_ShowRoleHead, false)
					SetModeEx( cst , EM_SetModeType_NotShowHPMP, false)
					SetModeEx( cst , EM_SetModeType_Obstruct, true)   -----重力
					SetModeEx( cst , EM_SetModeType_Strikback, false) ---反擊
					SetModeEx( cst , EM_SetModeType_Move, false) ---移動	
					SetModeEx( cst , EM_SetModeType_Fight, false) ---可砍殺
					SetModeEx( cst , EM_SetModeType_SearchenemyIgnore, false) 
					SetModeEx( cst , EM_SetModeType_Searchenemy, false)
					SetModeEx( cst , EM_SetModeType_Show, true)
					AddToPartition(cst , RoomID )
					WriteRoleValue(cst, EM_RoleValue_Livetime,10)	---------------存在時間livetime
					CastSpellLV( cst , cst , 494539 , power )
					end
				elseif (Luck >= 25 and Luck < 50) or (Luck >= 75 and Luck < 101) then	
					SkillIndex = 2 ----.束縛靜默
					Play_Chose=DW_HateRemain(0)
					kp=DW_Rand(table.getn(Play_Chose))
					if kp==0 then 
					end
					if kp~=0 then 
					CastSpellLV( OwnerID() , Play_Chose[kp] , Skill[SkillIndex] , 0 )
					sleep(20)
					end
				end
				time1=0
			end
		elseif HateListCount( dru ) == 0 then
		sleep(20)
		DelObj(dru)
		end
	end
end
function Lua_bk_rog_102884_1()
	CastSpellLV( OwnerID() , OwnerID() , 494541 , 0 )-----------麻痺陷阱
end
function Lua_bk_rog_102884_2()
	CastSpellLV( OwnerID() , OwnerID() , 494587 , 0 )-----------劇毒陷阱
end
function Lua_bk_pet_100000()
local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------開始的房間
local pet=OwnerID()
local time1=0
	while 1 do 
	sleep(10)
	time1=time1+1
		if time1>=10 then 
		CastSpellLV( OwnerID() , OwnerID() , Skill[SkillIndex] , 0 )----------施放自暴法術
		DelObj(pet)
		end
	end
end
function Lua_bk_sw_102840()
local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------開始的房間
local boss=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
local hate={}
local time1=0
local time2=0
local kp 
local m
	while 1 do
		sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )   ------ 找尋目前的攻擊目標
		local BossTarget=AttackTarget
		time1=time1+1
		if time1>= 15 then 
			hate=star_HateListSort(boss)------------讀取仇恨
			m=table.getn(hate)
			if m==0 then
				sleep(20)
				DelObj(OwnerID())
			elseif m==1 then 
				SetAttack( OwnerID() , hate[1]) 
				AddBuff(hate[1],505218,0,15)
				sysCastSpellLV(hate[1] ,OwnerID() , 494589 , 0 )-------------嘲諷
			elseif m>=2 then 
				table.remove (hate, 1)
				kp=DW_Rand(table.getn(hate))
				SetAttack( OwnerID() , hate[kp]) 
				AddBuff(hate[kp],505218,0,15)
				sysCastSpellLV(hate[kp] ,OwnerID() , 494589 , 0 )-------------嘲諷
			end
			time1=0
		end
		
	end
end

function Lua_bk_sw_102841()-----------法術免疫
local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------開始的房間
local boss=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
local hate={}
local time1=0
local time2=0
local kp 
local m
	while 1 do 
		sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )   ------ 找尋目前的攻擊目標
		local BossTarget=AttackTarget
		time1=time1+1
		if time1>= 15 then 
			hate=star_HateListSort(boss)------------讀取仇恨
			m=table.getn(hate)
			if m==0 then
				sleep(20)
				DelObj(OwnerID())
			elseif m==1 then 
				SetAttack( OwnerID() , hate[1]) 
				AddBuff(hate[1],505218,0,15)
				sysCastSpellLV(hate[1] ,OwnerID() , 494589 , 0 )-------------嘲諷
			elseif m>=2 then 
				table.remove (hate, 1)
				kp=DW_Rand(table.getn(hate))
				SetAttack( OwnerID() , hate[kp]) 
				AddBuff(hate[kp],505218,0,15)
				sysCastSpellLV(hate[kp] ,OwnerID() , 494589 , 0 )-------------嘲諷
			end
			time1=0
		end
		if time2 >= 8 then 
			CastSpellLV( OwnerID() ,OwnerID() , 494549 , 0 )
			time2=0
		end
	end
end
function Lua_bk_sw_102842()-----------物理免疫
local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------開始的房間
local boss=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
local hate={}
local time1=0
local time2=0
local kp 
local m
	while 1 do 
		sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )   ------ 找尋目前的攻擊目標
		local BossTarget=AttackTarget
		time1=time1+1
		time2=time2+1
		if time1>= 15 then 
			hate=star_HateListSort(boss)------------讀取仇恨
			m=table.getn(hate)
			if m==0 then
				sleep(20)
				DelObj(OwnerID())
			elseif m==1 then 
				SetAttack( OwnerID() , hate[1]) 
				AddBuff(hate[1],505218,0,15)
				sysCastSpellLV(hate[1] ,OwnerID() , 494589 , 0 )-------------嘲諷
			elseif m>=2 then 
				table.remove (hate, 1)
				kp=DW_Rand(table.getn(hate))
				SetAttack( OwnerID() , hate[kp]) 
				AddBuff(hate[kp],505218,0,15)
				sysCastSpellLV(hate[kp] ,OwnerID() , 494589 , 0 )-------------嘲諷
			end
			time1=0
		end
		if time2 >= 8 then 
			CastSpellLV( OwnerID() ,OwnerID() , 494549 , 0 )
			time2=0
		end
		
	end
end
function Lua_bk_swsm_dead00_102706()
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------開始的房間
	local boss=ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
	local bossMaxHP = ReadRoleValue(boss , EM_RoleValue_MaxHP)
	local bossHP=ReadRoleValue(boss,EM_RoleValue_HP)
	local x=0
	x=bosshp/bossMaxHP
	if  x>0.05 then 
	WriteRoleValue( boss, EM_RoleValue_HP,bossHP-bossMaxHP*0.05)
	elseif x<=0.05 then 
	KillID(TargetID() , boss)
	end
end
function Lua_bk_swsm_dead01_102706()
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------開始的房間
	local boss=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local bossMaxHP = ReadRoleValue(boss , EM_RoleValue_MaxHP)
	local bossHP=ReadRoleValue(boss,EM_RoleValue_HP)
	local x=0
	x=bosshp/bossMaxHP
	if  x>0.05 then 
	WriteRoleValue( boss, EM_RoleValue_HP,bossHP-bossMaxHP*0.05)
	elseif x<=0.05 then 
	KillID(TargetID() , boss)
	end
	---WriteRoleValue( boss, EM_RoleValue_HP,bossHP-bossMaxHP*0.05)
end
function Lua_bk_lig_505044()---------------死魚眼光線射擊判定
	if CheckBuff( TargetID(), 505037) == true then 
		CancelBuff(TargetID() , 505037 )
		return false
	else
		return true
	end
end 
function Lua_bk_swip_buff_102706() ----判斷是否有MP
	local Job = ReadRoleValue( TargetID() , EM_RoleValue_VOC )
	local Job_sub = ReadRoleValue( TargetID() , EM_RoleValue_VOC_SUB )
	if Job == 1 or Job_sub == 1 then
		AddBuff (TargetID() , 505239 , 0 , 3)--扣戰士SP
	end
	
	if Job == 2 or Job_sub == 2 then 
		AddBuff (TargetID() , 505240 , 0 , 3)--扣遊俠SP
	end
	
	if Job == 3 or Job_sub == 3 then 
		AddBuff (TargetID() , 505241 , 0 , 3)--扣影行者SP
	end
	
	if Job == 4 or Job == 5 or Job == 6 or Job == 7 or Job == 8	
	or Job_sub == 4 or Job_sub == 5 or Job_sub == 6 or Job_sub == 7 or Job_sub == 8 then
		AddBuff (TargetID() , 505238 , 0 , 3)--扣MP
	end
end