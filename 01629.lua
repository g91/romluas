function Lua_bk_spid_102706()
local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------開始的房間
local start = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
local boss=OwnerID()
local door
local CombatBegin=0
local m0t1=0-------隨機抓取玩家讀取身上資料
local m0tw=0
local m1t1=0
local m1t2=0
local time1=0
local time2=0
local Play_Chose={}
local Play_1ch={}
local Play_2ch={}
local Play_3ch={}
local mam -------------建造怪物
local gg=0
local kp=0
local voc=0
local bklig
local bklight=0
local pm=0
local Luck
local skill={494585,494586}
local SkillIndex
local amonster
local bmonster
local cmonster
local m2be=0
local lighttar
local X0
local Y0
local Z0
local Dir0
local mob=0
local bk={1,2,3,4,5,6,7,8}
local alltime=0
	local ba1 = CreateObj(102843,2300.2,1100.5,2525.8,75.5,1)
		SetModeEx( ba1 , EM_SetModeType_Gravity, false) ---重力
		SetModeEx( ba1 , EM_SetModeType_Mark, false)
		SetModeEx( ba1 , EM_SetModeType_HideName, false)
		SetModeEx( ba1 , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( ba1 , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( ba1 , EM_SetModeType_Obstruct, true)   -----重力
		SetModeEx( ba1 , EM_SetModeType_Strikback, false) ---反擊
		SetModeEx( ba1 , EM_SetModeType_Move, false) ---移動	
		SetModeEx( ba1 , EM_SetModeType_Fight, false) ---可砍殺
		SetModeEx( ba1 , EM_SetModeType_SearchenemyIgnore, false) 
		SetModeEx( ba1 , EM_SetModeType_Searchenemy, false)
		SetModeEx( ba1 , EM_SetModeType_Show, true)
		AddToPartition(ba1 , RoomID )
	local bam1 = CreateObj(102844,2300.2,1200.5,2525.8,75.5,1)
		SetModeEx( bam1 , EM_SetModeType_Gravity, false) ---重力
		SetModeEx( bam1 , EM_SetModeType_Mark, false)
		SetModeEx( bam1 , EM_SetModeType_HideName, false)
		SetModeEx( bam1 , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( bam1 , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( bam1 , EM_SetModeType_Obstruct, true)   -----重力
		SetModeEx( bam1 , EM_SetModeType_Strikback, false) ---反擊
		SetModeEx( bam1 , EM_SetModeType_Move, false) ---移動	
		SetModeEx( bam1 , EM_SetModeType_Fight, false) ---可砍殺
		SetModeEx( bam1 , EM_SetModeType_SearchenemyIgnore, false) 
		SetModeEx( bam1 , EM_SetModeType_Searchenemy, false)
		SetModeEx( bam1 , EM_SetModeType_Show, true)
		AddToPartition(bam1 , RoomID )
	local ba2 = CreateObj(102843 ,2300.2,1100.5,2354.0, 75.5 , 1)
		SetModeEx( ba2 , EM_SetModeType_Gravity, false) ---重力
		SetModeEx( ba2 , EM_SetModeType_Mark, false)
		SetModeEx( ba2 , EM_SetModeType_HideName, false)
		SetModeEx( ba2 , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( ba2 , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( ba2 , EM_SetModeType_Obstruct, true)   -----重力
		SetModeEx( ba2 , EM_SetModeType_Strikback, false) ---反擊
		SetModeEx( ba2 , EM_SetModeType_Move, false) ---移動	
		SetModeEx( ba2 , EM_SetModeType_Fight, false) ---可砍殺
		SetModeEx( ba2 , EM_SetModeType_SearchenemyIgnore, false) 
		SetModeEx( ba2 , EM_SetModeType_Searchenemy, false)
		SetModeEx( ba2 , EM_SetModeType_Show, true)
		AddToPartition(ba2 , RoomID )
	local bam2 = CreateObj( 102844 ,2300.2,1200.5,2354.0, 75.5 , 1)
		SetModeEx( bam2 , EM_SetModeType_Gravity, false) ---重力
		SetModeEx( bam2 , EM_SetModeType_Mark, false)
		SetModeEx( bam2 , EM_SetModeType_HideName, false)
		SetModeEx( bam2 , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( bam2 , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( bam2 , EM_SetModeType_Obstruct, true)   -----重力
		SetModeEx( bam2 , EM_SetModeType_Strikback, false) ---反擊
		SetModeEx( bam2 , EM_SetModeType_Move, false) ---移動	
		SetModeEx( bam2 , EM_SetModeType_Fight, false) ---可砍殺
		SetModeEx( bam2 , EM_SetModeType_SearchenemyIgnore, false) 
		SetModeEx( bam2 , EM_SetModeType_Searchenemy, false)
		SetModeEx( bam2 , EM_SetModeType_Show, true)
		AddToPartition(bam2 , RoomID )
	local ba3 = CreateObj( 102843 ,2300.2,1100.5,2183.4, 75.5 , 1)
		SetModeEx( ba3 , EM_SetModeType_Gravity, false) ---重力
		SetModeEx( ba3 , EM_SetModeType_Mark, false)
		SetModeEx( ba3 , EM_SetModeType_HideName, false)
		SetModeEx( ba3 , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( ba3 , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( ba3 , EM_SetModeType_Obstruct, true)   -----重力
		SetModeEx( ba3 , EM_SetModeType_Strikback, false) ---反擊
		SetModeEx( ba3 , EM_SetModeType_Move, false) ---移動	
		SetModeEx( ba3 , EM_SetModeType_Fight, false) ---可砍殺
		SetModeEx( ba3 , EM_SetModeType_SearchenemyIgnore, false) 
		SetModeEx( ba3 , EM_SetModeType_Searchenemy, false)
		SetModeEx( ba3 , EM_SetModeType_Show, true)
		AddToPartition(ba3 , RoomID )
	local bam3 = CreateObj( 102844 ,2300.2,1200,2183.4, 75.5 , 1)
		SetModeEx( bam3 , EM_SetModeType_Gravity, false) ---重力
		SetModeEx( bam3 , EM_SetModeType_Mark, false)
		SetModeEx( bam3 , EM_SetModeType_HideName, false)
		SetModeEx( bam3 , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( bam3 , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( bam3 , EM_SetModeType_Obstruct, true)   -----重力
		SetModeEx( bam3 , EM_SetModeType_Strikback, false) ---反擊
		SetModeEx( bam3 , EM_SetModeType_Move, false) ---移動	
		SetModeEx( bam3 , EM_SetModeType_Fight, false) ---可砍殺
		SetModeEx( bam3 , EM_SetModeType_SearchenemyIgnore, false) 
		SetModeEx( bam3 , EM_SetModeType_Searchenemy, false)
		SetModeEx( bam3 , EM_SetModeType_Show, true)
		AddToPartition(bam3 , RoomID )
	local ba4 = CreateObj( 102843 ,2300.2,1100.5,2011.7, 75.5 , 1)
		SetModeEx( ba4 , EM_SetModeType_Gravity, false) ---重力
		SetModeEx( ba4 , EM_SetModeType_Mark, false)
		SetModeEx( ba4 , EM_SetModeType_HideName, false)
		SetModeEx( ba4 , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( ba4 , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( ba4 , EM_SetModeType_Obstruct, true)   -----重力
		SetModeEx( ba4 , EM_SetModeType_Strikback, false) ---反擊
		SetModeEx( ba4 , EM_SetModeType_Move, false) ---移動	
		SetModeEx( ba4 , EM_SetModeType_Fight, false) ---可砍殺
		SetModeEx( ba4 , EM_SetModeType_SearchenemyIgnore, false) 
		SetModeEx( ba4 , EM_SetModeType_Searchenemy, false)
		SetModeEx( ba4 , EM_SetModeType_Show, true)
		AddToPartition(ba4 , RoomID )
	local bam4 = CreateObj( 102844 ,2300.2,1200.5,2011.7, 75.5 , 1)
		SetModeEx( bam4 , EM_SetModeType_Gravity, false) ---重力
		SetModeEx( bam4 , EM_SetModeType_Mark, false)
		SetModeEx( bam4 , EM_SetModeType_HideName, false)
		SetModeEx( bam4 , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( bam4 , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( bam4 , EM_SetModeType_Obstruct, true)   -----重力
		SetModeEx( bam4 , EM_SetModeType_Strikback, false) ---反擊
		SetModeEx( bam4 , EM_SetModeType_Move, false) ---移動	
		SetModeEx( bam4 , EM_SetModeType_Fight, false) ---可砍殺
		SetModeEx( bam4 , EM_SetModeType_SearchenemyIgnore, false) 
		SetModeEx( bam4 , EM_SetModeType_Searchenemy, false)
		SetModeEx( bam4 , EM_SetModeType_Show, true)
		AddToPartition(bam4 , RoomID )
	local ba5 = CreateObj( 102843 ,2465.5,1170.4,2525.8, 75.5 , 1)
		SetModeEx( ba5 , EM_SetModeType_Gravity, false) ---重力
		SetModeEx( ba5 , EM_SetModeType_Mark, false)
		SetModeEx( ba5 , EM_SetModeType_HideName, false)
		SetModeEx( ba5 , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( ba5 , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( ba5 , EM_SetModeType_Obstruct, true)   -----重力
		SetModeEx( ba5 , EM_SetModeType_Strikback, false) ---反擊
		SetModeEx( ba5 , EM_SetModeType_Move, false) ---移動	
		SetModeEx( ba5 , EM_SetModeType_Fight, false) ---可砍殺
		SetModeEx( ba5 , EM_SetModeType_SearchenemyIgnore, false) 
		SetModeEx( ba5 , EM_SetModeType_Searchenemy, false)
		SetModeEx( ba5 , EM_SetModeType_Show, true)
		AddToPartition(ba5 , RoomID )
	local bam5 = CreateObj( 102844 ,2465.5,1270.4,2525.8, 75.5 , 1)
		SetModeEx( bam5 , EM_SetModeType_Gravity, false) ---重力
		SetModeEx( bam5 , EM_SetModeType_Mark, false)
		SetModeEx( bam5 , EM_SetModeType_HideName, false)
		SetModeEx( bam5 , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( bam5 , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( bam5 , EM_SetModeType_Obstruct, true)   -----重力
		SetModeEx( bam5 , EM_SetModeType_Strikback, false) ---反擊
		SetModeEx( bam5 , EM_SetModeType_Move, false) ---移動	
		SetModeEx( bam5 , EM_SetModeType_Fight, false) ---可砍殺
		SetModeEx( bam5 , EM_SetModeType_SearchenemyIgnore, false) 
		SetModeEx( bam5 , EM_SetModeType_Searchenemy, false)
		SetModeEx( bam5 , EM_SetModeType_Show, true)
		AddToPartition(bam5 , RoomID )
	local ba6 = CreateObj( 102843 ,2465.5,1170.4,2354.8, 75.5 , 1)
		SetModeEx( ba6 , EM_SetModeType_Gravity, false) ---重力
		SetModeEx( ba6 , EM_SetModeType_Mark, false)
		SetModeEx( ba6 , EM_SetModeType_HideName, false)
		SetModeEx( ba6 , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( ba6 , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( ba6 , EM_SetModeType_Obstruct, true)   -----重力
		SetModeEx( ba6 , EM_SetModeType_Strikback, false) ---反擊
		SetModeEx( ba6 , EM_SetModeType_Move, false) ---移動	
		SetModeEx( ba6 , EM_SetModeType_Fight, false) ---可砍殺
		SetModeEx( ba6 , EM_SetModeType_SearchenemyIgnore, false) 
		SetModeEx( ba6 , EM_SetModeType_Searchenemy, false)
		SetModeEx( ba6 , EM_SetModeType_Show, true)
		AddToPartition(ba6 , RoomID )
	local bam6 = CreateObj( 102844 ,2465.5,1270.4,2354.8, 75.5 , 1)
		SetModeEx( bam6 , EM_SetModeType_Gravity, false) ---重力
		SetModeEx( bam6 , EM_SetModeType_Mark, false)
		SetModeEx( bam6 , EM_SetModeType_HideName, false)
		SetModeEx( bam6 , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( bam6 , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( bam6 , EM_SetModeType_Obstruct, true)   -----重力
		SetModeEx( bam6 , EM_SetModeType_Strikback, false) ---反擊
		SetModeEx( bam6 , EM_SetModeType_Move, false) ---移動	
		SetModeEx( bam6 , EM_SetModeType_Fight, false) ---可砍殺
		SetModeEx( bam6 , EM_SetModeType_SearchenemyIgnore, false) 
		SetModeEx( bam6 , EM_SetModeType_Searchenemy, false)
		SetModeEx( bam6 , EM_SetModeType_Show, true)
		AddToPartition(bam6 , RoomID )
	local ba7 = CreateObj( 102843 ,2465.5,1170.4,2183.4, 75.5 , 1)
		SetModeEx( ba7 , EM_SetModeType_Gravity, false) ---重力
		SetModeEx( ba7 , EM_SetModeType_Mark, false)
		SetModeEx( ba7 , EM_SetModeType_HideName, false)
		SetModeEx( ba7 , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( ba7 , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( ba7 , EM_SetModeType_Obstruct, true)   -----重力
		SetModeEx( ba7 , EM_SetModeType_Strikback, false) ---反擊
		SetModeEx( ba7 , EM_SetModeType_Move, false) ---移動	
		SetModeEx( ba7 , EM_SetModeType_Fight, false) ---可砍殺
		SetModeEx( ba7 , EM_SetModeType_SearchenemyIgnore, false) 
		SetModeEx( ba7 , EM_SetModeType_Searchenemy, false)
		SetModeEx( ba7 , EM_SetModeType_Show, true)
		AddToPartition(ba7 , RoomID )
	local bam7 = CreateObj( 102844 ,2465.5,1270.4,2183.4, 75.5 , 1)
		SetModeEx( bam7 , EM_SetModeType_Gravity, false) ---重力
		SetModeEx( bam7 , EM_SetModeType_Mark, false)
		SetModeEx( bam7 , EM_SetModeType_HideName, false)
		SetModeEx( bam7 , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( bam7 , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( bam7 , EM_SetModeType_Obstruct, true)   -----重力
		SetModeEx( bam7 , EM_SetModeType_Strikback, false) ---反擊
		SetModeEx( bam7 , EM_SetModeType_Move, false) ---移動	
		SetModeEx( bam7 , EM_SetModeType_Fight, false) ---可砍殺
		SetModeEx( bam7 , EM_SetModeType_SearchenemyIgnore, false) 
		SetModeEx( bam7 , EM_SetModeType_Searchenemy, false)
		SetModeEx( bam7 , EM_SetModeType_Show, true)
		AddToPartition(bam7 , RoomID )
	local ba8 = CreateObj( 102843 ,2465.5,1170.4,2011.7, 75.5 , 1)
		SetModeEx( ba8 , EM_SetModeType_Gravity, false) ---重力
		SetModeEx( ba8 , EM_SetModeType_Mark, false)
		SetModeEx( ba8 , EM_SetModeType_HideName, false)
		SetModeEx( ba8 , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( ba8 , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( ba8 , EM_SetModeType_Obstruct, true)   -----重力
		SetModeEx( ba8 , EM_SetModeType_Strikback, false) ---反擊
		SetModeEx( ba8 , EM_SetModeType_Move, false) ---移動	
		SetModeEx( ba8 , EM_SetModeType_Fight, false) ---可砍殺
		SetModeEx( ba8 , EM_SetModeType_SearchenemyIgnore, false) 
		SetModeEx( ba8 , EM_SetModeType_Searchenemy, false)
		SetModeEx( ba8 , EM_SetModeType_Show, true)
		AddToPartition(ba8 , RoomID )
	local bam8 = CreateObj( 102844 ,2465.5,1270.4,2011.7, 75.5 , 1)
		SetModeEx( bam8 , EM_SetModeType_Gravity, false) ---重力
		SetModeEx( bam8 , EM_SetModeType_Mark, false)
		SetModeEx( bam8 , EM_SetModeType_HideName, false)
		SetModeEx( bam8 , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( bam8 , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( bam8 , EM_SetModeType_Obstruct, true)   -----重力
		SetModeEx( bam8 , EM_SetModeType_Strikback, false) ---反擊
		SetModeEx( bam8 , EM_SetModeType_Move, false) ---移動	
		SetModeEx( bam8 , EM_SetModeType_Fight, false) ---可砍殺
		SetModeEx( bam8 , EM_SetModeType_SearchenemyIgnore, false) 
		SetModeEx( bam8 , EM_SetModeType_Searchenemy, false)
		SetModeEx( bam8 , EM_SetModeType_Show, true)
		AddToPartition(bam8 , RoomID )
	while 1 do 
	sleep(10)
	local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )   ------ 找尋目前的攻擊目標
	local BossTarget=AttackTarget
		if HateListCount( boss ) ~= 0 then	---- 確定他現在有打人
			if CombatBegin == 0 then							---------------只有開場放一次
				ScriptMessage( OwnerID() , -1 , 2 , "[SC_102706_00]" , 1 )
				CombatBegin = 1
				door = CreateObjByFlag(102925,780449,3,1)-----------------------在旗標2上面丟入阻擋門
				SetModeEx( door , EM_SetModeType_Gravity, false) ---重力
				SetModeEx( door , EM_SetModeType_Mark, false)
				SetModeEx( door , EM_SetModeType_HideName, false)
				SetModeEx( door , EM_SetModeType_ShowRoleHead, false)
				SetModeEx( door , EM_SetModeType_NotShowHPMP, false)
				SetModeEx( door , EM_SetModeType_Obstruct, true)   -----會阻擋(阻擋其他的物件)
				SetModeEx( door , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( door , EM_SetModeType_Move, false) ---移動	
				SetModeEx( door , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( door , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( door , EM_SetModeType_Searchenemy, false)
				SetModeEx( door , EM_SetModeType_Show, true)
				AddToPartition( door , RoomID )
				WriteRoleValue(boss, EM_RoleValue_Register1,door)	
			--	bklig = CreateObj(102935,1954.5,1350,2306.0,75.5,1)----------------眼精的地方
				------bklig = CreateObj(102935,-595.3,0,-204.3,75.5,1)----------------測試區
			--	SetModeEx( bklig , EM_SetModeType_Gravity, false) ---重力
			--	SetModeEx( bklig , EM_SetModeType_Mark, false)
			---	SetModeEx( bklig , EM_SetModeType_HideName, false)
			---	SetModeEx( bklig , EM_SetModeType_ShowRoleHead, false)
			---	SetModeEx( bklig , EM_SetModeType_NotShowHPMP, false)
			---	SetModeEx( bklig , EM_SetModeType_Obstruct, true)   -----重力
			---	SetModeEx( bklig , EM_SetModeType_Strikback, false) ---反擊
			---	SetModeEx( bklig , EM_SetModeType_Move, false) ---移動	
			----	SetModeEx( bklig , EM_SetModeType_Fight, false) ---可砍殺
			---	SetModeEx( bklig , EM_SetModeType_SearchenemyIgnore, false) 
			---	SetModeEx( bklig , EM_SetModeType_Searchenemy, false)
			---	SetModeEx( bklig , EM_SetModeType_Show, true)
			---	AddToPartition( bklig , RoomID )
			---	WriteRoleValue(bklig, EM_RoleValue_Register2,bklig)	
			end	
			if mob == 0 then 
			m0t1=m0t1+1
			time1=time1+1
				if m0t1>=40 then 				
					m0tw=m0tw+1
					if m0tw==1 then 
						ScriptMessage( OwnerID() , -1 , 2 , "[SC_102706_01]" , 1 )
						CastSpellLV( OwnerID() , OwnerID(), 494507 , 0 )
						sleep(20)
						bkluck=DW_Rand(table.getn(bk))
						if bk[bkluck]==1 then 
							SetIdleMotion( ba1 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam1)
						end
						if bk[bkluck]==2 then 
							SetIdleMotion( ba2 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam2)
						end
						if bk[bkluck]==3 then 
							SetIdleMotion( ba3 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam3)
						end
						if bk[bkluck]==4 then  
							SetIdleMotion( ba4 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam4)
						end
						if bk[bkluck]==5 then 
							SetIdleMotion( ba5 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam5)
						end
						if bk[bkluck]==6 then 
							SetIdleMotion( ba6 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam6)
						end
						if bk[bkluck]==7 then 
							SetIdleMotion( ba7 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam7)
						end
						if bk[bkluck]==8 then 
							SetIdleMotion( ba8 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam8)
						end
						table.remove (bk, bkluck)
						BeginPlot( boss,"Lua_bk_spid_voc_102706",0)
						m0t1=0
					end
					if m0tw==2 then 
						ScriptMessage( OwnerID() , -1 , 2 , "[SC_102706_01]" , 1 )
						CastSpellLV( OwnerID() , OwnerID(), 494507 , 0 )
						sleep(20)
						bkluck=DW_Rand(table.getn(bk))
						if bk[bkluck]==1 then 
							SetIdleMotion( ba1 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam1)
						end
						if bk[bkluck]==2 then 
							SetIdleMotion( ba2 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam2)
						end
						if bk[bkluck]==3 then 
							SetIdleMotion( ba3 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam3)
						end
						if bk[bkluck]==4 then  
							SetIdleMotion( ba4 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam4)
						end
						if bk[bkluck]==5 then 
							SetIdleMotion( ba5 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam5)
						end
						if bk[bkluck]==6 then 
							SetIdleMotion( ba6 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam6)
						end
						if bk[bkluck]==7 then 
							SetIdleMotion( ba7 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam7)
						end
						if bk[bkluck]==8 then 
							SetIdleMotion( ba8 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam8)
						end
						table.remove (bk, bkluck)
						BeginPlot( boss,"Lua_bk_spid_voc_102706",0)
						m0t1=0
					end
					if m0tw==3 then 
						ScriptMessage( OwnerID() , -1 , 2 , "[SC_102706_01]" , 1 )
						CastSpellLV( OwnerID() , OwnerID(), 494507 , 0 )
						sleep(20)
						bkluck=DW_Rand(table.getn(bk))
						if bk[bkluck]==1 then 
							SetIdleMotion( ba1 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam1)
						end
						if bk[bkluck]==2 then 
							SetIdleMotion( ba2 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam2)
						end
						if bk[bkluck]==3 then 
							SetIdleMotion( ba3 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam3)
						end
						if bk[bkluck]==4 then  
							SetIdleMotion( ba4 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam4)
						end
						if bk[bkluck]==5 then 
							SetIdleMotion( ba5 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam5)
						end
						if bk[bkluck]==6 then 
							SetIdleMotion( ba6 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam6)
						end
						if bk[bkluck]==7 then 
							SetIdleMotion( ba7 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam7)
						end
						if bk[bkluck]==8 then 
							SetIdleMotion( ba8 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam8)
						end
						table.remove (bk, bkluck)
						BeginPlot( boss,"Lua_bk_spid_voc_102706",0)
						m0t1=0
					end
					if m0tw==4 then 
						ScriptMessage( OwnerID() , -1 , 2 , "[SC_102706_01]" , 1 )
						CastSpellLV( OwnerID() , OwnerID(), 494507 , 0 )
						sleep(20)
						bkluck=DW_Rand(table.getn(bk))
						if bk[bkluck]==1 then 
							SetIdleMotion( ba1 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam1)
						end
						if bk[bkluck]==2 then 
							SetIdleMotion( ba2 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam2)
						end
						if bk[bkluck]==3 then 
							SetIdleMotion( ba3 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam3)
						end
						if bk[bkluck]==4 then  
							SetIdleMotion( ba4 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam4)
						end
						if bk[bkluck]==5 then 
							SetIdleMotion( ba5 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam5)
						end
						if bk[bkluck]==6 then 
							SetIdleMotion( ba6 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam6)
						end
						if bk[bkluck]==7 then 
							SetIdleMotion( ba7 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam7)
						end
						if bk[bkluck]==8 then 
							SetIdleMotion( ba8 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam8)
						end
						table.remove (bk, bkluck)
						BeginPlot( boss,"Lua_bk_spid_voc_102706",0)
						m0t1=0
					end
					if m0tw==5 then 
						ScriptMessage( OwnerID() , -1 , 2 , "[SC_102706_01]" , 1 )
						CastSpellLV( OwnerID() , OwnerID(), 494507 , 0 )
						sleep(20)
						bkluck=DW_Rand(table.getn(bk))
						if bk[bkluck]==1 then 
							SetIdleMotion( ba1 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam1)
						end
						if bk[bkluck]==2 then 
							SetIdleMotion( ba2 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam2)
						end
						if bk[bkluck]==3 then 
							SetIdleMotion( ba3 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam3)
						end
						if bk[bkluck]==4 then  
							SetIdleMotion( ba4 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam4)
						end
						if bk[bkluck]==5 then 
							SetIdleMotion( ba5 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam5)
						end
						if bk[bkluck]==6 then 
							SetIdleMotion( ba6 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam6)
						end
						if bk[bkluck]==7 then 
							SetIdleMotion( ba7 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam7)
						end
						if bk[bkluck]==8 then 
							SetIdleMotion( ba8 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam8)
						end
						table.remove (bk, bkluck)
						BeginPlot( boss,"Lua_bk_spid_voc_102706",0)
						m0t1=0
					end					
					if m0tw== 6 then 
						mob=1
						time1=0
					end
				end
				if time1>=8 then
				    Luck=DW_Rand(100)
					if (Luck >= 0 and Luck < 25) or (Luck >= 50 and Luck < 75) then
						SkillIndex = 2------------------------------------------單體打王傷害
						BossTarget = AttackTarget
						CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , 1 )
					elseif (Luck >= 25 and Luck < 50) or (Luck >= 75 and Luck < 101) then	
						SkillIndex = 1-------------------------------------------單體打王傷害
						Play_Chose=DW_HateRemain(1)----------仇恨表去掉主坦
						kp=DW_Rand(table.getn(Play_Chose))
						if kp==0 then 
						end
						if kp~=0 then 
							BossTarget = Play_Chose[kp]															
							CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , 0 )
							sleep(20)
						end
					end
					time1=0
				end
			end
			if mob == 1 then 
			m1t1=m1t1+1
			m1t2=m1t2+1
			time1=time1+1
			alltime=alltime+1
				if time1>=8 then
				    Luck=DW_Rand(100)
					if (Luck >= 0 and Luck < 25) or (Luck >= 50 and Luck < 75) then
						SkillIndex = 2------------------------------------------單體打王傷害
						BossTarget = AttackTarget
						CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , 1 )
					sleep(20)
					elseif (Luck >= 25 and Luck < 50) or (Luck >= 75 and Luck < 101) then	
						SkillIndex = 1-------------------------------------------單體打王傷害
						Play_Chose=DW_HateRemain(1)----------仇恨表去掉主坦
						kp=DW_Rand(table.getn(Play_Chose))
						if kp==0 then 
						end
						if kp~=0 then 
							BossTarget = Play_Chose[kp]															
							CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , 0 )
							sleep(20)
						end
					end
					time1=0
				end
				if m1t1>=25 then
					if bklight==0 then 
						Play_Chose=DW_HateRemain(0)---------
						pm=table.getn(Play_Chose)
						for i=1 ,pm do
							Play_1ch[i] = Play_Chose[i]
						end
						for i=1,pm do 				
							if CheckBuff(Play_Chose[i],505037) == true then
								for x=1,table.getn(Play_1ch) do 
									if Play_1ch[x]==Play_Chose[i] then
									table.remove (Play_1ch,x)
									end
								end
							end
						end
						kp=DW_Rand(table.getn(Play_1ch))
						if kp==0 then 
						end
						if kp~=0 then 
							CastSpellLV( OwnerID() , Play_1ch[kp] , 494509 , 0 )------------------------------綁住敵人
							sleep(20)
						end
						bklight=1
					end
				end
				if m1t1 >=35 then 
					if bklight==1 then 
						ScriptMessage( OwnerID() , -1 , 2 , "[SC_102706_03]" , 1 )
						Play_2ch=DW_HateRemain(0)----------
						pm=table.getn(Play_2ch)
						Play_3ch={}
						for i=1 ,pm do
							Play_3ch[i] = Play_2ch[i]
						end			
						for j=1,table.getn(Play_2ch),1 do 
							if CheckBuff(Play_2ch[j],505037) == true then
								for x=1,table.getn(Play_3ch) do 
									if Play_3ch[x]==Play_2ch[j] then
									table.remove (Play_3ch,x)
									end
								end
							end
						end
						kp=DW_Rand(table.getn(Play_3ch))
						if kp==0 then 
						end
						if kp~=0 then 
						bklig = star_CreateObj_NoAdd(Play_3ch[kp],102935,0,300,0,0,RoomID)----------------眼精的地方
						SetModeEx( bklig , EM_SetModeType_Gravity, false) ---重力
						SetModeEx( bklig , EM_SetModeType_Mark, false)
						SetModeEx( bklig , EM_SetModeType_HideName, false)
						SetModeEx( bklig , EM_SetModeType_ShowRoleHead, false)
						SetModeEx( bklig , EM_SetModeType_NotShowHPMP, false)
						SetModeEx( bklig , EM_SetModeType_Obstruct, true)   -----重力
						SetModeEx( bklig , EM_SetModeType_Strikback, false) ---反擊
						SetModeEx( bklig , EM_SetModeType_Move, false) ---移動	
						SetModeEx( bklig , EM_SetModeType_Fight, false) ---可砍殺
						SetModeEx( bklig , EM_SetModeType_SearchenemyIgnore, false) 
						SetModeEx( bklig , EM_SetModeType_Searchenemy, false)
						SetModeEx( bklig , EM_SetModeType_Show, true)
						AddToPartition( bklig , RoomID )
						WriteRoleValue(bklig, EM_RoleValue_Livetime,5)
						
						X0=ReadRoleValue(Play_3ch[kp],EM_RoleValue_X)
						Y0=ReadRoleValue(Play_3ch[kp],EM_RoleValue_Y)
						Z0=ReadRoleValue(Play_3ch[kp],EM_RoleValue_Z)
						Dir0=ReadRoleValue(Play_3ch[kp],EM_RoleValue_Dir)
						lighttar=CreateObj(102935,X0,Y0,Z0,Dir0,1)------------------考慮上個標記
						SetModeEx( lighttar , EM_SetModeType_Gravity, false) ---重力
						SetModeEx( lighttar , EM_SetModeType_Mark, false)
						SetModeEx( lighttar , EM_SetModeType_HideName, false)
						SetModeEx( lighttar , EM_SetModeType_ShowRoleHead, false)
						SetModeEx( lighttar , EM_SetModeType_NotShowHPMP, false)
						SetModeEx( lighttar , EM_SetModeType_Obstruct, false)   -----重力
						SetModeEx( lighttar , EM_SetModeType_Strikback, false) ---反擊
						SetModeEx( lighttar , EM_SetModeType_Move, false) ---移動	
						SetModeEx( lighttar , EM_SetModeType_Fight, false) ---可砍殺
						SetModeEx( lighttar , EM_SetModeType_SearchenemyIgnore, false) 
						SetModeEx( lighttar , EM_SetModeType_Searchenemy, false)
						SetModeEx( lighttar , EM_SetModeType_Show, true)
						AddToPartition(lighttar , RoomID )
						AddBuff(lighttar,505299,0,-1)-------------------法術特效
						WriteRoleValue(lighttar, EM_RoleValue_Livetime,3)
						CastSpellLV( bklig , lighttar , 494582 , 0 )------------------------------綁住敵人
						sleep(20)
						bklight=0
						end
					end
					m1t1=0
				end
				if m1t2>=1 then ----------建立三支巨獸
					if m2be==0 then 	
						ScriptMessage( OwnerID() , -1 , 2 , "[SC_102706_02]" , 1 )
						say(boss,"[SC_102706_02]" )
						CastSpellLV( OwnerID() , OwnerID(), 494507 , 0 )
						sleep(20)
						amonster=CreateObjByFlag(102840,780449,1,1)----------------------跑速中等60不可控場攻擊力極高
						AddToPartition(amonster , RoomID )
						SetAttack( amonster , BossTarget) 
						WriteRoleValue(amonster, EM_RoleValue_PID,boss)
						SetPlot( amonster,"dead","Lua_bk_swsm_dead01_102706",10 )
						BeginPlot( amonster ,"Lua_bk_fd_sm_102760",100)
						bkluck=DW_Rand(table.getn(bk))
						if bk[bkluck]==1 then 
							SetIdleMotion( ba1 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam1)
						end
						if bk[bkluck]==2 then 
							SetIdleMotion( ba2 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam2)
						end
						if bk[bkluck]==3 then 
							SetIdleMotion( ba3 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam3)
						end
						if bk[bkluck]==4 then  
							SetIdleMotion( ba4 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam4)
						end
						if bk[bkluck]==5 then 
							SetIdleMotion( ba5 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam5)
						end
						if bk[bkluck]==6 then 
							SetIdleMotion( ba6 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam6)
						end
						if bk[bkluck]==7 then 
							SetIdleMotion( ba7 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam7)
						end
						if bk[bkluck]==8 then 
							SetIdleMotion( ba8 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam8)
						end
						table.remove (bk, bkluck)	------------------------
						bmonster=CreateObjByFlag(102842,780449,1,1)----------------------物理免疫+清buff
						AddToPartition( bmonster , RoomID )
						SetAttack( bmonster , BossTarget)
						WriteRoleValue( bmonster, EM_RoleValue_PID,boss)
						AddBuff(bmonster,505108,0,-1)--------------物理免疫
						BeginPlot( bmonster , "Lua_bk_sw_102842",20)
						BeginPlot( bmonster ,"Lua_bk_fd_sm_102760",100)
						SetPlot( bmonster,"dead","Lua_bk_swsm_dead01_102706",10 )
						bkluck=DW_Rand(table.getn(bk))
						if bk[bkluck]==1 then 
							SetIdleMotion( ba1 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam1)
						end
						if bk[bkluck]==2 then 
							SetIdleMotion( ba2 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam2)
						end
						if bk[bkluck]==3 then 
							SetIdleMotion( ba3 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam3)
						end
						if bk[bkluck]==4 then  
							SetIdleMotion( ba4 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam4)
						end
						if bk[bkluck]==5 then 
							SetIdleMotion( ba5 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam5)
						end
						if bk[bkluck]==6 then 
							SetIdleMotion( ba6 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam6)
						end
						if bk[bkluck]==7 then 
							SetIdleMotion( ba7 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam7)
						end
						if bk[bkluck]==8 then 
							SetIdleMotion( ba8 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam8)
						end
						table.remove (bk, bkluck)--------------------------------------					
						cmonster=CreateObjByFlag(102841,780449,1,1)----------------------法術免疫+清buff
						AddToPartition( cmonster , RoomID )
						SetAttack( cmonster , BossTarget)
						WriteRoleValue( cmonster, EM_RoleValue_PID,boss)
						AddBuff(cmonster,505109,0,-1)--------------法術免疫
						BeginPlot( cmonster , "Lua_bk_sw_102841",20)
						BeginPlot( cmonster ,"Lua_bk_fd_sm_102760",100)
						SetPlot( cmonster,"dead","Lua_bk_swsm_dead01_102706",10 )
						bkluck=DW_Rand(table.getn(bk))
						if bk[bkluck]==1 then 
							SetIdleMotion( ba1 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam1)
						end
						if bk[bkluck]==2 then 
							SetIdleMotion( ba2 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam2)
						end
						if bk[bkluck]==3 then 
							SetIdleMotion( ba3 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam3)
						end
						if bk[bkluck]==4 then  
							SetIdleMotion( ba4 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam4)
						end
						if bk[bkluck]==5 then 
							SetIdleMotion( ba5 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam5)
						end
						if bk[bkluck]==6 then 
							SetIdleMotion( ba6 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam6)
						end
						if bk[bkluck]==7 then 
							SetIdleMotion( ba7 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam7)
						end
						if bk[bkluck]==8 then 
							SetIdleMotion( ba8 ,  ruFUSION_ACTORSTATE_ACTIVATE_begin)
							DelObj(bam8)
						end
						table.remove (bk, bkluck)	------------------------
						m2be=1
					end
				end
				if alltime>= 280 then 
					if gg==0 then 
						ScriptMessage( OwnerID() , -1 , 2 , "[SC_102706_04]" , 1 )
						AddBuff(boss,505224,0,-1)-------------------狂暴	
						gg=1
					end
				end
			end			
		elseif HateListCount( boss ) == 0 then----------------離開戰鬥 所有值都該回歸
			if CombatBegin == 1 then
				sleep(30)
				DelObj(door)
				DelObj(ba1)
				DelObj(ba2)
				DelObj(ba3)
				DelObj(ba4)
				DelObj(ba5)
				DelObj(ba6)
				DelObj(ba7)
				DelObj(ba8)
				DelObj(bam1)
				DelObj(bam2)
				DelObj(bam3)
				DelObj(bam4)
				DelObj(bam5)
				DelObj(bam6)
				DelObj(bam7)
				DelObj(bam8)
				local PPL = SetSearchAllPlayer(RoomID)
				for i = 1 , PPL , 1 do ---把玩家抓入房間用 
					local ID = GetSearchResult()
					if ReadRoleValue( ID , EM_RoleValue_IsDead ) ~= 1 and ReadRoleValue( ID, EM_RoleValue_VOC) ~= 0  and ReadRoleValue( ID , EM_RoleValue_RoomID  ) == RoomID then
						CancelBuff( ID , 505037 )
					end
				end
				WriteRoleValue(start, EM_RoleValue_Register1,1)	
				sleep(20)
				DelObj(boss)
				CombatBegin=0
			end
		end
	end
end
function Lua_bk_spid_voc_102706()
local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local boss=OwnerID()
local Play_Chose={}
local kp=0
local BossTarget
local voc
local war
local sco 
local rog
local mag
local pri
local kni
local warden
local dru
	Play_Chose=DW_HateRemain(0)
	kp=DW_Rand(table.getn(Play_Chose))
	if kp==0 then 
	end
	if kp~=0 then 	
		AddBuff(boss,505121,0,-1)-------------------吸取能量盾
		CastSpellLV( OwnerID() , Play_Chose[kp]	 , 494508 , 1 )---------------------對於ㄧ個人去做抓取的動作
		AddBuff(Play_Chose[kp],505036,0,-1)-------------------在玩家身上放ㄧ個招式
		voc = ReadRoleValue( Play_Chose[kp] , EM_RoleValue_VOC ) 
		if voc == 1 then ------------------戰士
			war=CreateObjByFlag(102882,780449,1,1)----------------在培養槽旁邊產生怪物
			SetModeEx( war , EM_SetModeType_Strikback, false) ---反擊
			SetModeEx( war , EM_SetModeType_Move, false) ---移動	
			SetModeEx( war , EM_SetModeType_Fight, false) ---可砍殺
			SetModeEx( war , EM_SetModeType_Searchenemy, false )--索敵
			AddToPartition( war , RoomID )
			WriteRoleValue( war, EM_RoleValue_PID,Play_Chose[kp])
			WriteRoleValue( war, EM_RoleValue_Register1,boss)
			BeginPlot( war,"Lua_bk_mam1_102882",0)
			SetPlot( war,"dead","Lua_bk_swsm_dead00_102706",10 )
		end
		if voc == 2 then ------------------遊俠
			sco=CreateObjByFlag(102883,780449,1,1)----------------在培養槽旁邊產生怪物
			SetModeEx( sco , EM_SetModeType_Strikback, false) ---反擊
			SetModeEx( sco , EM_SetModeType_Move, false) ---移動	
			SetModeEx( sco , EM_SetModeType_Fight, false) ---可砍殺
			SetModeEx(  sco , EM_SetModeType_Searchenemy, false )--索敵
			AddToPartition( sco , RoomID )
			WriteRoleValue( sco, EM_RoleValue_PID,Play_Chose[kp])
			WriteRoleValue( sco, EM_RoleValue_Register1,boss)
			BeginPlot( sco,"Lua_bk_mam2_102883",0)
			SetPlot( sco,"dead","Lua_bk_swsm_dead00_102706",10 )
		end
		if voc == 3 then ------------------影者
			rog=CreateObjByFlag(102884,780449,1,1)----------------在培養槽旁邊產生怪物
			SetModeEx( rog , EM_SetModeType_Strikback, false) ---反擊
			SetModeEx( rog , EM_SetModeType_Move, false) ---移動	
			SetModeEx( rog , EM_SetModeType_Fight, false) ---可砍殺
			SetModeEx(  rog , EM_SetModeType_Searchenemy, false )--索敵
			AddToPartition( rog , RoomID )
			WriteRoleValue( rog, EM_RoleValue_PID,Play_Chose[kp])
			WriteRoleValue( rog, EM_RoleValue_Register1,boss)
			BeginPlot( rog,"Lua_bk_mam3_102884",0)		
			SetPlot( rog,"dead","Lua_bk_swsm_dead00_102706",10 )								
		end
		if voc == 4 then ------------------法師
			mag=CreateObjByFlag(102885,780449,1,1)----------------在培養槽旁邊產生怪物
			SetModeEx( mag , EM_SetModeType_Strikback, false) ---反擊
			SetModeEx( mag , EM_SetModeType_Move, false) ---移動	
			SetModeEx( mag , EM_SetModeType_Fight, false) ---可砍殺
			SetModeEx(  mag , EM_SetModeType_Searchenemy, false )--索敵
			AddToPartition( mag , RoomID )
			WriteRoleValue( mag, EM_RoleValue_PID,Play_Chose[kp])
			WriteRoleValue(  mag, EM_RoleValue_Register1,boss)
			BeginPlot( mag,"Lua_bk_mam4_102885",0)		
			SetPlot( mag,"dead","Lua_bk_swsm_dead00_102706",10 )									
		end
		if voc == 5 then ------------------祭師
			pri=CreateObjByFlag(102886,780449,1,1)----------------在培養槽旁邊產生怪物
			SetModeEx( pri , EM_SetModeType_Strikback, false) ---反擊
			SetModeEx( pri , EM_SetModeType_Move, false) ---移動	
			SetModeEx( pri , EM_SetModeType_Fight, false) ---可砍殺
			SetModeEx(  pri , EM_SetModeType_Searchenemy, false )--索敵
			AddToPartition( pri , RoomID )
			WriteRoleValue( pri, EM_RoleValue_PID,Play_Chose[kp])
			WriteRoleValue( pri, EM_RoleValue_Register1,boss)
			BeginPlot( pri,"Lua_bk_mam5_102886",0)	
			SetPlot( pri,"dead","Lua_bk_swsm_dead00_102706",10 )
		end
		if voc == 6 then ------------------騎士
			kni=CreateObjByFlag(102887,780449,1,1)----------------在培養槽旁邊產生怪物
			SetModeEx( kni , EM_SetModeType_Strikback, false) ---反擊
			SetModeEx( kni , EM_SetModeType_Move, false) ---移動	
			SetModeEx( kni , EM_SetModeType_Fight, false) ---可砍殺
			SetModeEx(  kni , EM_SetModeType_Searchenemy, false )--索敵
			AddToPartition( kni , RoomID )
			WriteRoleValue( kni, EM_RoleValue_PID,Play_Chose[kp])
			WriteRoleValue( kni, EM_RoleValue_Register1,boss)
			BeginPlot( kni,"Lua_bk_mam6_102887",0)	
			SetPlot( kni,"dead","Lua_bk_swsm_dead00_102706",10 )
		end
		if voc == 7 then ------------------牧者
			warden=CreateObjByFlag(102888,780449,1,1)----------------在培養槽旁邊產生怪物
			SetModeEx( warden , EM_SetModeType_Strikback, false) ---反擊
			SetModeEx( warden , EM_SetModeType_Move, false) ---移動	
			SetModeEx( warden , EM_SetModeType_Fight, false) ---可砍殺
			SetModeEx(  warden , EM_SetModeType_Searchenemy, false )--索敵
			AddToPartition( warden , RoomID )
			WriteRoleValue( warden, EM_RoleValue_PID,Play_Chose[kp])
			WriteRoleValue( warden, EM_RoleValue_Register1,boss)
			BeginPlot( warden,"Lua_bk_mam7_102888",0)	
			SetPlot( warden,"dead","Lua_bk_swsm_dead00_102706",10 )
		end
		if voc == 8 then ------------------神官
			dru=CreateObjByFlag(102889,780449,1,1)----------------在培養槽旁邊產生怪物
			SetModeEx( dru , EM_SetModeType_Strikback, false) ---反擊
			SetModeEx( dru , EM_SetModeType_Move, false) ---移動	
			SetModeEx( dru , EM_SetModeType_Fight, false) ---可砍殺
			SetModeEx(  dru , EM_SetModeType_Searchenemy, false )--索敵
			AddToPartition( dru , RoomID )
			WriteRoleValue( dru, EM_RoleValue_PID,Play_Chose[kp])
			WriteRoleValue( dru, EM_RoleValue_Register1,boss)
			BeginPlot( dru,"Lua_bk_mam8_102889",0)		
			SetPlot( dru,"dead","Lua_bk_swsm_dead00_102706",10 )
		end
	sleep(20)
	end
end

