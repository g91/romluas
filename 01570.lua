---------------------------st EM_RoleValue_Register1  紀錄開始小怪的死亡劇情,當死亡之後就會開始湧入劇情
---------------------------fo  EM_RoleValue_Register2紀錄光塔起用劇情要是成功壓制龍的力量
---------------------------fm  EM_RoleValue_Register3紀錄光塔起用劇情要是成功壓制龍的力量
--------------------------- EM_RoleValue_Register4紀錄王離開戰鬥
--------------------------- EM_RoleValue_Register5紀錄王離開死掉
--------------------------- EM_RoleValue_Register6
--------------------------- EM_RoleValue_Register7
--------------------------- EM_RoleValue_Register8
--------------------------- EM_RoleValue_Register9
function Lua_bk_fd00_102670()-----------------------生小怪階段
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------開始的房間
	local st=OwnerID()-------------------------------------------------------開始控制器
	local sd=0--------------記錄開始的產生劇情
	local fm=0-------關起燈的次數
	local fo=0-------開門燈記數
	local gg=0 ------王離開戰鬥
	local dr0
	local dr1
	local dr2
	local door0
	local door1
	local nf1=0
	local nf2=0
	local nf3=0
	local nf4=0
	local cf1=0
	local cf2=0
	local cf3=0
	local cf4=0
	local bsm1=0
	local bsm2=0
	local bsm3=0
	local bsm4=0
	local m1count=0
	local m1door=0
	local m2count=0
	local fobe=0
	local ggboss=0
	local dead
	local sm1=CreateObjByFlag(102778,780470,14,1)-----------------------產生兩支定點魔法小兵
	WriteRoleValue(sm1,EM_RoleValue_PID,st)
	AddToPartition( sm1 , RoomID )
	SetPlot( sm1 , "dead" , "Lua_bk_fd01_01_102670" , 10 )-----------------------------------死亡記數
	local boss=CreateObjByFlag(102670,780470,9,1)----------------在旗標處生出火龍被困住的不可砍殺
	SetModeEx( boss , EM_SetModeType_Strikback, false) ---反擊
	SetModeEx( boss , EM_SetModeType_Move, false) ---移動	
	SetModeEx( boss , EM_SetModeType_Fight, false) ---可砍殺
	SetModeEx( boss , EM_SetModeType_Show, true)
	SetModeEx(  boss , EM_SetModeType_Searchenemy, false )--索敵
	PlayMotion ( boss, ruFUSION_ACTORSTATE_BUFF_SP03 )-----------------------播放倒地動作
	SetDefIdleMotion( boss,ruFUSION_MIME_IDLE_STAND_02)---播放倒在地上動作-------------掙扎的動作 
	AddToPartition( boss , RoomID )
	WriteRoleValue(boss,EM_RoleValue_PID,st)
	SetPlot( boss ,"dead", "Lua_bk_dead_fd_102670" ,50)----------------------------------------放入死亡劇情
	local f1=CreateObjByFlag(113648,780470,5,1)----------------生出控制塔--------------------------------開場發光
	SetModeEx(  f1 , EM_SetModeType_ShowRoleHead, false )----------頭像框
	AddToPartition( f1 , RoomID )
	SetPlot( f1 , "touch" , "Lua_bk_fd_113648" , 50 )------------------撿取物品
	AddBuff(boss, 504995 , 1 , -1 )				
	local f2=CreateObjByFlag(113648,780470,6,1)----------------生出控制塔--------------------------------開場發光
	SetModeEx(  f2 , EM_SetModeType_ShowRoleHead, false )----------頭像框
	AddToPartition( f2 , RoomID )
	SetPlot( f2 , "touch" , "Lua_bk_fd_113648" , 50 )------------------撿取物品
	AddBuff(boss, 504851 , 1 , -1 )			
	local f3=CreateObjByFlag(113648,780470,7,1)----------------生出控制塔--------------------------------開場發光
	SetModeEx(  f3 , EM_SetModeType_ShowRoleHead, false )----------頭像框
	AddToPartition( f3 , RoomID )
	SetPlot( f3 , "touch" , "Lua_bk_fd_113648" , 50 )------------------撿取物品
	AddBuff(boss, 504997 , 1 , -1 )			
	local f4=CreateObjByFlag(113648,780470,8,1)----------------生出控制塔--------------------------------開場發光
	SetModeEx(  f4 , EM_SetModeType_ShowRoleHead, false)----------頭像框
	AddToPartition( f4 , RoomID )
	SetPlot( f4 , "touch" , "Lua_bk_fd_113648" , 50 )------------------撿取物品
	AddBuff(boss, 504996 , 1 , -1 )			
	while 1 do --------------------每秒去檢查Register1看開始的小兵存不存在
	sleep(10)
		sd=ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
		if sd==2 then 
		ScriptMessage( sm1 , -1 , 2 , "[SC_102670_00]" , 1 )---------------------敵人入侵了！快通知赤蛇將軍！！
		Say(sm1,"[SC_102670_00]")
		dr0 = CreateObjByFlag(102462,780470,12,1)-----------------------在旗標2上面丟入阻擋門  -----5放阻擋門
		SetModeEx( dr0 , EM_SetModeType_Gravity, false) ---重力
		SetModeEx( dr0 , EM_SetModeType_Mark, false)
		SetModeEx( dr0 , EM_SetModeType_HideName, false)
		SetModeEx( dr0 , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( dr0 , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( dr0 , EM_SetModeType_Obstruct, true)   -----重力
		SetModeEx( dr0 , EM_SetModeType_Move, false) ---移動	
		SetModeEx( dr0 , EM_SetModeType_Fight, false) ---可砍殺
		SetModeEx( dr0 , EM_SetModeType_SearchenemyIgnore, false) 
		SetModeEx( dr0 , EM_SetModeType_Searchenemy, false)
		SetModeEx( dr0 , EM_SetModeType_Show, true)
		AddToPartition( dr0 , RoomID )
		
		dr1 = CreateObjByFlag(102462,780470,16,1)-----------------------在旗標2上面丟入阻擋門  -----5放阻擋門
		SetModeEx( dr1 , EM_SetModeType_Gravity, false) ---重力
		SetModeEx( dr1 , EM_SetModeType_Mark, false)
		SetModeEx( dr1 , EM_SetModeType_HideName, false)
		SetModeEx( dr1 , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( dr1 , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( dr1 , EM_SetModeType_Obstruct, true)   -----重力
		SetModeEx( dr1 , EM_SetModeType_Strikback, false) ---反擊
		SetModeEx( dr1 , EM_SetModeType_Move, false) ---移動	
		SetModeEx( dr1 , EM_SetModeType_Fight, false) ---可砍殺
		SetModeEx( dr1 , EM_SetModeType_SearchenemyIgnore, false) 
		SetModeEx( dr1 , EM_SetModeType_Searchenemy, false)
		SetModeEx( dr1 , EM_SetModeType_Show, true)
		AddToPartition( dr1 , RoomID )
		dr2 = CreateObjByFlag(102462,780470,17,1)-----------------------在旗標2上面丟入阻擋門  -----5放阻擋門
		SetModeEx( dr2 , EM_SetModeType_Gravity, false) ---重力
		SetModeEx( dr2 , EM_SetModeType_Mark, false)
		SetModeEx( dr2 , EM_SetModeType_HideName, false)
		SetModeEx( dr2 , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( dr2 , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( dr2 , EM_SetModeType_Obstruct, true)   -----重力
		SetModeEx( dr2 , EM_SetModeType_Strikback, false) ---反擊
		SetModeEx( dr2 , EM_SetModeType_Move, false) ---移動	
		SetModeEx( dr2 , EM_SetModeType_Fight, false) ---可砍殺
		SetModeEx( dr2 , EM_SetModeType_SearchenemyIgnore, false) 
		SetModeEx( dr2 , EM_SetModeType_Searchenemy, false)
		SetModeEx( dr2 , EM_SetModeType_Show, true)
		AddToPartition( dr2 , RoomID )	
		m1count= CreateObjByFlag(102782,780470,9,1)---------------生出第一階段控制器
		SetModeEx( m1count , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( m1count , EM_SetModeType_Strikback, false) ---反擊
		SetModeEx( m1count , EM_SetModeType_Move, false) ---移動	
		SetModeEx( m1count , EM_SetModeType_Fight, false) ---可砍殺
		SetModeEx(  m1count , EM_SetModeType_Searchenemy, false )--索敵
		SetModeEx( m1count , EM_SetModeType_Show, false)
		SetModeEx(  m1count , EM_SetModeType_ShowRoleHead, false)----------頭像框
		WriteRoleValue(m1count,EM_RoleValue_PID,st)
		AddToPartition( m1count , RoomID )
		BeginPlot( m1count , "Lua_bk_fd02_102670",20)---------------------------------第一階段打任務物品打開牢籠
		BeginPlot( m1count , "Lua_bk_fd_m1_102670",100)---------------------------------判斷離開戰鬥
		WriteRoleValue(OwnerID(),EM_RoleValue_Register1,0)
		m1door=CreateObjByFlag(102736,780470,12,1)----------------生出第一階段控制器
		SetModeEx( m1door , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( m1door , EM_SetModeType_Strikback, false) ---反擊
		SetModeEx( m1door , EM_SetModeType_Move, false) ---移動	
		SetModeEx( m1door , EM_SetModeType_Fight, false) ---可砍殺
		SetModeEx(  m1door , EM_SetModeType_Searchenemy, false )--索敵
		SetModeEx(  m1door , EM_SetModeType_ShowRoleHead, false)----------頭像框
		SetModeEx( m1door , EM_SetModeType_Show, false)
		WriteRoleValue(m1door,EM_RoleValue_PID,st)
		AddToPartition( m1door , RoomID )---------	AddBuff(m1door, 505056 , 1 , -1 )			
		end	
		if CheckBuff( f1, 504848) then   ---------------------解開之後光塔會消失光線
			nf1 =LuaFunc_CreateObjByObj ( 102801 , f1 )--------------控制器不發光
			SetModeEx( nf1 , EM_SetModeType_ShowRoleHead, false )----------頭像框
			SetModeEx( nf1 , EM_SetModeType_Mark, true )----------標記	
			SetModeEx( nf1 , EM_SetModeType_Strikback, false) ---反擊
			SetModeEx( nf1 , EM_SetModeType_Move, false) ---移動	
			SetModeEx( nf1 , EM_SetModeType_Fight, false) ---可砍殺
			AddToPartition( nf1 , RoomID )
			DelObj(f1)
			fo=fo+1
			CancelBuff(boss , 504996 )----------------------------------結束玩家身上buff
		end
		if CheckBuff( f2, 504848) then 
			nf2 =LuaFunc_CreateObjByObj ( 102801 , f2 )--------------控制器不發光.
			SetModeEx( nf2 , EM_SetModeType_ShowRoleHead, false )----------頭像框
			SetModeEx( nf2 , EM_SetModeType_Mark, true )----------標記	
			SetModeEx( nf2 , EM_SetModeType_Strikback, false) ---反擊
			SetModeEx( nf2 , EM_SetModeType_Move, false) ---移動	
			SetModeEx( nf2 , EM_SetModeType_Fight, false) ---可砍殺
			AddToPartition( nf2 , RoomID )
			DelObj(f2)
			fo=fo+1
			CancelBuff(boss , 504851 )----------------------------------結束玩家身上buff
		end
		if CheckBuff( f3, 504848) then 
			nf3 =LuaFunc_CreateObjByObj ( 102801 , f3 )--------------控制器不發光
			SetModeEx( nf3 , EM_SetModeType_ShowRoleHead, false )----------頭像框
			SetModeEx( nf3 , EM_SetModeType_Mark, true )----------標記	
			SetModeEx( nf3 , EM_SetModeType_Strikback, false) ---反擊
			SetModeEx( nf3 , EM_SetModeType_Move, false) ---移動	
			SetModeEx( nf3 , EM_SetModeType_Fight, false) ---可砍殺
			AddToPartition( nf3 , RoomID )
			DelObj(f3)
			fo=fo+1
			CancelBuff(boss , 504997 )----------------------------------結束玩家身上buff
		end
		if CheckBuff( f4, 504848) then 
			nf4 =LuaFunc_CreateObjByObj ( 102801 , f4 )--------------控制器不發光
			SetModeEx( nf4 , EM_SetModeType_ShowRoleHead, false )----------頭像框
			SetModeEx( nf4 , EM_SetModeType_Mark, true )----------標記	
			SetModeEx( nf4 , EM_SetModeType_Strikback, false) ---反擊
			SetModeEx( nf4 , EM_SetModeType_Move, false) ---移動	
			SetModeEx( nf4 , EM_SetModeType_Fight, false) ---可砍殺
			AddToPartition( nf4 , RoomID )
			DelObj(f4)
			fo=fo+1
			CancelBuff(boss , 504995 )----------------------------------結束玩家身上buff
		end
		if fo == 4 then ------------解開牢籠
			if fobe==0 then
			ScriptMessage( boss , -1 , 2 , "[SC_102670_01]" , 1 ) ---------. 吼 ～ 熾熱的氣流瞬間爆發整個空間！無數的火舌向四周爆射！！
			sleep(10)
			sysCastSpellLV( boss , boss , 494277 , 0 )-----------全體減10%血量
			sleep(20)
			ScriptMessage( boss , -1 , 2 , "[SC_102670_02]" , 1 )
			say(boss,"[SC_102670_02]")
			sleep(10)
			Delobj(m1count)
			Delobj(m1door)
			SetModeEx(  boss , EM_SetModeType_Searchenemy, true )--索敵
			SetModeEx( boss , EM_SetModeType_Strikback, true) ---反擊
			SetModeEx( boss , EM_SetModeType_Move, true) ---移動	
			SetModeEx( boss , EM_SetModeType_Fight, true) ---可砍殺
			PlayMotion ( boss, ruFUSION_ACTORSTATE_BUFF_SP02 )-----------------------播放掙脫的動作
			ScriptMessage( boss , -1 , 2 , "[SC_102670_03]" , 1 )
			say(boss,"[SC_102670_03]")
			Hide(boss)
			Show(boss,RoomID)
			WriteRoleValue(boss,EM_RoleValue_PID,st)
			BeginPlot( boss ,"Lua_bk_fd_boss_102670",20)--------------------------------------------放入王的ai
			m2count =CreateObjByFlag(102782,780470,15,1)-------建立一個控制器控制王的時間
			SetModeEx( m2count , EM_SetModeType_Gravity, false) ---重力
			SetModeEx( m2count , EM_SetModeType_Mark, false)
			SetModeEx( m2count , EM_SetModeType_HideName, false)
			SetModeEx( m2count , EM_SetModeType_ShowRoleHead, false)
			SetModeEx( m2count , EM_SetModeType_NotShowHPMP, false)
			SetModeEx( m2count , EM_SetModeType_Obstruct, true)   -----阻擋
			SetModeEx( m2count , EM_SetModeType_Strikback, false) ---反擊
			SetModeEx( m2count , EM_SetModeType_Move, false) ---移動	
			SetModeEx( m2count , EM_SetModeType_Fight, false) ---可砍殺
			SetModeEx( m2count , EM_SetModeType_SearchenemyIgnore, false) 
			SetModeEx( m2count , EM_SetModeType_Searchenemy, false)
			SetModeEx( m2count , EM_SetModeType_Show, false)
			AddToPartition( m2count , RoomID )
			WriteRoleValue(m2count,EM_RoleValue_PID,st)
			WriteRoleValue(m2count,EM_RoleValue_Register1,boss)		
			BeginPlot( m2count ,"Lua_bk_df_m2count_102670",0)			
			door0=CreateObjByFlag(102782,780470,9,1)------建立2個門   780470   1 和2
			SetModeEx( door0 , EM_SetModeType_Gravity, false) ---重力
			SetModeEx( door0 , EM_SetModeType_Mark, false)
			SetModeEx( door0 , EM_SetModeType_HideName, false)
			SetModeEx( door0 , EM_SetModeType_ShowRoleHead, false)
			SetModeEx( door0 , EM_SetModeType_NotShowHPMP, false)
			SetModeEx( door0 , EM_SetModeType_Obstruct,false)   -----阻擋
			SetModeEx( door0 , EM_SetModeType_Strikback, false) ---反擊
			SetModeEx( door0 , EM_SetModeType_Move, false) ---移動	
			SetModeEx( door0 , EM_SetModeType_Fight, false) ---可砍殺
			SetModeEx( door0 , EM_SetModeType_SearchenemyIgnore, false) 
			SetModeEx( door0 , EM_SetModeType_Searchenemy, false)
			SetModeEx( door0 , EM_SetModeType_Show, false)
			AddToPartition( door0 , RoomID )
			AddBuff(door0, 505056 , 1 , -1 )	
			WriteRoleValue(door0,EM_RoleValue_Register5,boss)
			WriteRoleValue(door0,EM_RoleValue_PID,st)
			WriteRoleValue(door0,EM_RoleValue_Register6,nf1)
			WriteRoleValue(door0,EM_RoleValue_Register7,nf2)
			WriteRoleValue(door0,EM_RoleValue_Register8,nf3)
			WriteRoleValue(door0,EM_RoleValue_Register9,nf4)
			BeginPlot( door0 ,"Lua_bk_fd_fdoor_102736",20)--------------------------------------------放入4個門的劇情
			----------------------------door1=CreateObjByFlag(102782,780470,11,1)-------建立2個門   780470   1 和2
			door1= CreateObjByFlag(102782,780470,9,1)-------建立2個門   780470   1 和2
			SetModeEx( door1 , EM_SetModeType_Gravity, false) ---重力
			SetModeEx( door1 , EM_SetModeType_Mark, false)
			SetModeEx( door1 , EM_SetModeType_HideName, false)
			SetModeEx( door1 , EM_SetModeType_ShowRoleHead, false)
			SetModeEx( door1 , EM_SetModeType_NotShowHPMP, false)
			SetModeEx( door1 , EM_SetModeType_Obstruct, false)   -----阻擋
			SetModeEx( door1 , EM_SetModeType_Strikback, false) ---反擊
			SetModeEx( door1 , EM_SetModeType_Move, false) ---移動	
			SetModeEx( door1 , EM_SetModeType_Fight, false) ---可砍殺
			SetModeEx( door1 , EM_SetModeType_SearchenemyIgnore, false) 
			SetModeEx( door1 , EM_SetModeType_Searchenemy, false)
			SetModeEx( door1 , EM_SetModeType_Show, false)
			AddToPartition( door1 , RoomID )
			AddBuff(door1, 505056 , 1 , -1 )	
			WriteRoleValue(door1,EM_RoleValue_PID,st)
			WriteRoleValue(door1,EM_RoleValue_Register5,boss)
			WriteRoleValue(door1,EM_RoleValue_Register6,nf1)
			WriteRoleValue(door1,EM_RoleValue_Register7,nf2)
			WriteRoleValue(door1,EM_RoleValue_Register8,nf3)
			WriteRoleValue(door1,EM_RoleValue_Register9,nf4)
			BeginPlot( door1 ,"Lua_bk_fd_fdoor1_102736",20)--------------------------------------------放入4個門的劇情
			fobe=1
			end
		end	--------------------------每秒去讀取504757 這個buff的位置,然後開始去讀取他的威力,當威力達到10之後就會開始去執行劇情
		bs1=Lua_BuffPosSearch( nf1 , 504757 )---------------------對物件去檢查她的目標buff----buff命名為修復
		bs2=Lua_BuffPosSearch( nf2 , 504757 )---------------------對物件去檢查她的目標buff----buff命名為修復
		bs3=Lua_BuffPosSearch( nf3 , 504757 )---------------------對物件去檢查她的目標buff----buff命名為修復
		bs4=Lua_BuffPosSearch( nf4 , 504757 )---------------------對物件去檢查她的目標buff----buff命名為修復
		-----------------------------------------------
		if bs1>=0 then
			bp1=BuffInfo( nf1 , bs1 , EM_BuffInfoType_Power )
			if bp1>=20 then 
				if bsm1==0 then 
				WriteRoleValue(nf1,EM_RoleValue_Register9,1)
				sleep(20)
				cf1=LuaFunc_CreateObjByObj (  113648 , nf1 )----------------生出控制塔--------------------------------發光
				AddToPartition( cf1 , RoomID )
				sleep(30)
				DelObj(nf1)
				fm=fm+1
				WriteRoleValue(st, EM_RoleValue_Register6,nf1)
				bsm1=1
				end
			end
		end
		if bs2>=0 then 
			bp2=BuffInfo( nf2 , bs2 , EM_BuffInfoType_Power )
			if bp2>=20 then 
				if bsm2==0 then 
				WriteRoleValue(nf2,EM_RoleValue_Register9,1)
				sleep(20)
				cf2=LuaFunc_CreateObjByObj (  113648 , nf2 )----------------生出控制塔--------------------------------發光
				AddToPartition( cf2 , RoomID )
				sleep(30)
				DelObj(nf2)
				fm=fm+1
				WriteRoleValue(st, EM_RoleValue_Register7,nf2)
				bsm2=1
				end
			end
		end
		if bs3>=0 then 
			bp3=BuffInfo( nf3 , bs3 , EM_BuffInfoType_Power )
			if bp3>=20 then 
				if bsm3==0 then 
				WriteRoleValue(nf3,EM_RoleValue_Register9,1)
				sleep(20)
				cf3=LuaFunc_CreateObjByObj (  113648 , nf3 )----------------生出控制塔--------------------------------發光
				AddToPartition( cf3 , RoomID )
				sleep(30)
				DelObj(nf3)
				fm=fm+1
				WriteRoleValue(st, EM_RoleValue_Register8,nf3)
				bsm3=1
				end
			end
		end
		if bs4>=0 then 
			bp4=BuffInfo( nf4 , bs4 , EM_BuffInfoType_Power )
			if bp4>=20 then 
				if bsm4==0 then 
				WriteRoleValue(nf4,EM_RoleValue_Register9,1)
				sleep(20)
				cf4=LuaFunc_CreateObjByObj (  113648 , nf4 )----------------生出控制塔--------------------------------發光
				AddToPartition( cf4 , RoomID )
				sleep(30)
				DelObj(nf4)
				fm=fm+1
				WriteRoleValue(st, EM_RoleValue_Register9,nf4)
				bsm4=1
				end
			end
		end		
		dead=ReadRoleValue(OwnerID(),EM_RoleValue_Register5)
		if dead==1 then 
			Delobj(ggboss)
			Delobj(dr0)
			Delobj(dr1)
			Delobj(dr2)
			Delobj(f1)
			Delobj(f2)
			Delobj(f3)
			Delobj(f4)
			Delobj(cf1)
			Delobj(cf2)
			Delobj(cf3)
			Delobj(cf4)
			Delobj(nf1)
			Delobj(nf2)
			Delobj(nf3)
			Delobj(nf4)
			Delobj(m1count)
			Delobj(m2count)
			Delobj(m1door)
			sleep(50)
			Delobj(st)
		end
		gg=ReadRoleValue(OwnerID(),EM_RoleValue_Register4)
		if gg==1 then 
		ggboss=ReadRoleValue(boss,EM_RoleValue_Register9)
		ScriptMessage( ggboss , -1 , 2 , "[SC_102670_11]" , 1 )
		Yell( ggboss ,  "[SC_102670_11]" , 5)
		sleep(20)
		PlayMotion ( boss, ruFUSION_ACTORSTATE_BUFF_SP03 )-----------------------播放倒地動作
		SetDefIdleMotion( boss,ruFUSION_MIME_IDLE_STAND_02)---播放倒在地上動作-------------掙扎的動作 
		SetModeEx( boss , EM_SetModeType_Strikback, false) ---反擊
		SetModeEx( boss , EM_SetModeType_Fight, false) ---可砍殺
		SetModeEx( boss , EM_SetModeType_SearchenemyIgnore, false) 
		SetModeEx( boss , EM_SetModeType_Searchenemy, false)----------------------------這裡寫重置機制...全部該砍的都砍掉應該就可以重置了 
		ScriptMessage(boss, -1 , 2 , "[SC_102670_12]" , 1 )
		sleep(50)
		local nst=CreateObjByFlag(113660,780470,15,1)--------------這邊生出一開始的控制器
		SetModeEx( nst , EM_SetModeType_Gravity, false) ---重力
		SetModeEx( nst , EM_SetModeType_Mark, false)
		SetModeEx( nst , EM_SetModeType_HideName, false)
		SetModeEx( nst , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( nst , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( nst , EM_SetModeType_Obstruct, false)   -----阻擋
		SetModeEx( nst , EM_SetModeType_Strikback, false) ---反擊
		SetModeEx( nst , EM_SetModeType_Move, false) ---移動	
		SetModeEx( nst , EM_SetModeType_Fight, false) ---可砍殺
		SetModeEx( nst , EM_SetModeType_SearchenemyIgnore, false) 
		SetModeEx( nst , EM_SetModeType_Searchenemy, false)
		SetModeEx( nst , EM_SetModeType_Show, false)
		AddToPartition( nst , RoomID )
		BeginPlot( nst , "Lua_bk_fd00_102670",50)---------------------------------判斷離開戰鬥
		Delobj(ggboss)
		Delobj(dr0)
		Delobj(dr1)
		Delobj(dr2)
		Delobj(f1)
		Delobj(f2)
		Delobj(f3)
		Delobj(f4)
		Delobj(cf1)
		Delobj(cf2)
		Delobj(cf3)
		Delobj(cf4)
		Delobj(nf1)
		Delobj(nf2)
		Delobj(nf3)
		Delobj(nf4)
		Delobj(m1count)
		Delobj(m2count)
		Delobj(m1door)
		sleep(50)
		Delobj(boss)
		Delobj(st)
		break
		end
		if fm == 4 then
		WriteRoleValue(boss,EM_RoleValue_Register2,3)
		end
	end
end
function Lua_bk_fd_113648()
	SetPlot( TargetID()  ,"touch", "" ,0 )
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	BeginPlot( TargetID() , "Lua_bk_fd_ch_206138",0 )
end
function Lua_bk_fd_ch_206138()------------------------------物品判斷
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local x=CountBodyItem ( TargetID(), 206138 )
	if x== 0 then
		ScriptMessage( TargetID() , TargetID() , 1 , "[SC_102670_08]" , 1 )------------------------------------妳沒有鑰匙
		SetPlot( OwnerID() , "touch" , "Lua_bk_fd_113648" , 50 )------------------撿取物品
	elseif x>0 then 
		DelBodyItem ( TargetID(), 206138, 1 )
		AddBuff(OwnerID() , 504848,1,-1 )
		SetPlot( OwnerID()  ,"touch", "" ,0 )
	end
end
function Lua_bk_fd01_01_102670()-----------------------小兵死亡劇情
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------開始的房間
	local st=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local sd=ReadRoleValue(st,EM_RoleValue_Register1)--------------------紀錄死亡
	sd=2
	WriteRoleValue(st,EM_RoleValue_Register1,sd)
end
function Lua_bk_fd_m1_102670()
local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------開始的房間
local st=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
local m1count=OwnerID()
local CombatBegin=0
local voc
	while 1 do 
		sleep(50)
		local pm=SearchRangePlayer(m1count,400)
		local playx=0
		local px=table.getn(pm)-----取出來的是數量
		if px==0 then 
			WriteRoleValue(st,EM_RoleValue_Register4,1)
		end
		if px~=0 then 
			for i=0,px-1,1 do
				if ReadRoleValue( pm[i] , EM_RoleValue_VOC ) == 0  then
				playx=playx+1
				end
			end
			if px==playx then
				WriteRoleValue(st,EM_RoleValue_Register4,1)
			end
		end
	end
end
function Lua_bk_fd02_102670()------------------------產生物件湧入劇情   ----20秒生一次怪物----------第一階段小怪近來劇情
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------開始的房間
	local m1count=OwnerID()
	local time1=0
	local s1={}----------------------怪物
	local s2=0
	local ma={}-----------------------------------------第一階段小兵
	local ma_num
	while 1 do 
	local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
	local BossTarget=AttackTarget
	sleep(10)
	time1=time1+1		
		if time1==15 then ------------------ 生出3之怪物
			for i = 1 , table.getn(ma), 1 do
				if ma[i] ~= nil and ReadRoleValue( ma[i] , EM_RoleValue_IsDead) == 1 then
					table.remove ( ma , i)
				end	
			end
			ma_num = table.getn(ma)		
			if ma_num<=20 then 
				for i=1,2,1 do --------------這裡小怪設定鎖敵1000碼
					s1[i]=CreateObjByFlag(102779,780470,12,1)
					SetModeEx( s1[i] , EM_SetModeType_Searchenemy, true)
					SetModeEx( s1[i] , EM_SetModeType_Fight, true)
					AddToPartition( s1[i] , RoomID )
					BeginPlot( s1[i] ,"Lua_bk_fd_sm_102760",100)--------
					SetAttack( s1[i] , BossTarget)
					table.insert( ma , s1[i] )
				------------------ 自己身上弄一個劇情連續發現自己離開戰鬥就消失
				end
			s2=CreateObjByFlag(102738,780470,12,1)
			SetModeEx( s2 , EM_SetModeType_Searchenemy, true)
			SetModeEx( s2 , EM_SetModeType_Fight, true)
			AddToPartition( s2 , RoomID )
			BeginPlot( s2 ,"Lua_bk_fd_sm_102760",100)--------標
			SetAttack( s2 , BossTarget)
			table.insert( ma , s2 )
			end
			time1=0
		end
	end
end
function Lua_bk_fd02_01_102670()
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------開始的房間
	local s1=OwnerID()
	MoveToFlagEnabled ( s1,  false )
	LuaFunc_MoveToFlag( s1, 780470 , 12 , 10)-------移動到門內
	SetModeEx( s1 , EM_SetModeType_Searchenemy, true)
	SetModeEx( s1 , EM_SetModeType_Fight, true)
	MoveToFlagEnabled ( s1,  true)
	BeginPlot( s1 ,"Lua_bk_fd_sm_102760",100)--------小怪離開戰鬥就消失
end
function Lua_bk_fd_sm_102760()-------------小怪消失劇情
	while 1 do 
	sleep(30)
		if HateListCount( OwnerID() ) ~= 0 then 	
		elseif HateListCount( OwnerID() ) == 0 then 
			DelObj(OwnerID())
		end
	end
end
----------------------------fm     st    EM_RoleValue_Register3對塔的buff去計數量
----------------boss  EM_RoleValue_Register1阻擋門id 
----------------mob EM_RoleValue_Register2 紀錄階段模式
----------------------------EM_RoleValue_Register6
--------------------------- EM_RoleValue_Register7
--------------------------- EM_RoleValue_Register8 紀錄
function Lua_bk_fd_boss_102670()
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------開始的房間
	local st=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local sf=0--------------------------------------------------使用火追人的東西
	local gg=0
	local boss=OwnerID()
	local mob=0-------階段
	local skill={494459,494429}------1.冰凍術 2. 拍擊 
	local skilllv={0,1}------------------------------簡單模式
	local seat_chose={1,2,3,4}
	local time1=0
	local time2=0
	local time3=0
	local fwtime=0
	local t4=0
	local t3=0
	local fdpp=0---------------屁屁打人的物件
	local pptime=0--------------屁股打人時間
	local alltime=0
	local bossx=0
	local bossy=0
	local bossz=0
	local bossdir=0
	local sball={}
	local Luck=0----------------出招隨機
	local ftime=0----------------------------------------------------------------火追人時間
	local bs1=0------------------------buff的位置
	local bs2=0------------------------buff的位置
	local bs3=0------------------------buff的位置
	local bs4=0------------------------buff的位置
	local bp1=0
	local bp2=0
	local bp3=0
	local bp4=0
--	local door
	--local dr1
	---local dr2
	local firew=0
	local fm =0
	local Play_Chose={}
	local CombatBegin=0
	local baocount=0
	local bf=0
	local ggmob=0
	local ggboss=0
	local comob
	while 1 do 
	sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )   ------ 找尋目前的攻擊目標
		local BossTarget=AttackTarget
		WriteRoleValue(boss, EM_RoleValue_Register5,BossTarget)
		if HateListCount( boss ) ~= 0 then	---- 確定他現在有打人
			pptime=pptime+1
			if CombatBegin == 0 then							---------------只有開場放一次
				CombatBegin = 1
				mob=0
		--		door = CreateObjByFlag(102462,780470,12,1)-----------------------在旗標2上面丟入阻擋門  -----5放阻擋門
		---		SetModeEx( door , EM_SetModeType_Gravity, false) ---重力
		--		SetModeEx( door , EM_SetModeType_Mark, false)
		--		SetModeEx( door , EM_SetModeType_HideName, false)
		---		SetModeEx( door , EM_SetModeType_ShowRoleHead, false)
		--		SetModeEx( door , EM_SetModeType_NotShowHPMP, false)
		--		SetModeEx( door , EM_SetModeType_Obstruct, true)   -----重力
		--		SetModeEx( door , EM_SetModeType_Strikback, false) ---反擊
		--		SetModeEx( door , EM_SetModeType_Move, false) ---移動	
		--		SetModeEx( door , EM_SetModeType_Fight, false) ---可砍殺
		--		SetModeEx( door , EM_SetModeType_SearchenemyIgnore, false) 
		--		SetModeEx( door , EM_SetModeType_Searchenemy, false)
		--		SetModeEx( door , EM_SetModeType_Show, true)
		--		AddToPartition( door , RoomID )
		--		WriteRoleValue(boss, EM_RoleValue_Register1,door)	---------------Register1   再看要存哪邊	
		--		dr1 = CreateObjByFlag(102462,780470,16,1)-----------------------在旗標2上面丟入阻擋門  -----5放阻擋門
		--		SetModeEx( dr1 , EM_SetModeType_Gravity, false) ---重力
		--		SetModeEx( dr1 , EM_SetModeType_Mark, false)
		--		SetModeEx( dr1 , EM_SetModeType_HideName, false)
		--		SetModeEx( dr1 , EM_SetModeType_ShowRoleHead, false)
		--		SetModeEx( dr1 , EM_SetModeType_NotShowHPMP, false)
		--		SetModeEx( dr1 , EM_SetModeType_Obstruct, true)   -----重力
		--		SetModeEx( dr1 , EM_SetModeType_Strikback, false) ---反擊
		--		SetModeEx( dr1 , EM_SetModeType_Move, false) ---移動	
		--		SetModeEx( dr1 , EM_SetModeType_Fight, false) ---可砍殺
		--		SetModeEx( dr1 , EM_SetModeType_SearchenemyIgnore, false) 
		--		SetModeEx( dr1 , EM_SetModeType_Searchenemy, false)
		--		SetModeEx( dr1 , EM_SetModeType_Show, true)
		--		AddToPartition( dr1 , RoomID )
		--		WriteRoleValue(boss, EM_RoleValue_Register6,dr1)	---------------Register3   再看要存哪邊	
		--		dr2 = CreateObjByFlag(102462,780470,17,1)-----------------------在旗標2上面丟入阻擋門  -----5放阻擋門
		--		SetModeEx( dr2 , EM_SetModeType_Gravity, false) ---重力
		--		SetModeEx( dr2 , EM_SetModeType_Mark, false)
		--		SetModeEx( dr2 , EM_SetModeType_HideName, false)
		--		SetModeEx( dr2 , EM_SetModeType_ShowRoleHead, false)
		--		SetModeEx( dr2 , EM_SetModeType_NotShowHPMP, false)
		--		SetModeEx( dr2 , EM_SetModeType_Obstruct, true)   -----重力
		----		SetModeEx( dr2 , EM_SetModeType_Strikback, false) ---反擊
		--		SetModeEx( dr2 , EM_SetModeType_Move, false) ---移動	
		--		SetModeEx( dr2 , EM_SetModeType_Fight, false) ---可砍殺
		--		SetModeEx( dr2 , EM_SetModeType_SearchenemyIgnore, false) 
		--		SetModeEx( dr2 , EM_SetModeType_Searchenemy, false)
		--		SetModeEx( dr2 , EM_SetModeType_Show, true)
		--		AddToPartition( dr2 , RoomID )
		--		WriteRoleValue(boss, EM_RoleValue_Register7,dr2)	---------------Register3   再看要存哪邊				
				sf =CreateObj( 102780 ,3809.4, 800 , 4326.8, 168.5 , 1)--------------------駐利空中
				SetModeEx( sf , EM_SetModeType_Show, true) ----秀出
				SetModeEx( sf , EM_SetModeType_Mark, false) ----標記
				SetModeEx( sf , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( sf , EM_SetModeType_Move, false) ---移動	
				SetModeEx( sf , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( sf , EM_SetModeType_SearchenemyIgnore, false) ---物件不會被搜尋
				SetModeEx( sf , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
				SetModeEx( sf , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
				SetModeEx( sf , EM_SetModeType_Searchenemy, false)  ---鎖敵
				SetModeEx( sf , EM_SetModeType_Gravity, false) 
				SetModeEx( sf , EM_SetModeType_AlignToSurface, false) 
				WriteRoleValue(sf,EM_RoleValue_PID,boss)
				AddToPartition(sf , RoomID )
				mocount=CreateObjByFlag(100469,780470,15,1)
				SetModeEx( mocount , EM_SetModeType_Show, false) ----秀出
				SetModeEx( mocount , EM_SetModeType_Mark, false) ----標記
				SetModeEx( mocount , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( mocount , EM_SetModeType_Move, false) ---移動	
				SetModeEx( mocount , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( mocount , EM_SetModeType_SearchenemyIgnore, false) ---物件不會被搜尋
				SetModeEx( mocount , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
				SetModeEx( mocount , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
				SetModeEx( mocount , EM_SetModeType_Searchenemy, false)  ---鎖敵
				WriteRoleValue(mocount,EM_RoleValue_PID,boss)
				AddToPartition(mocount , RoomID )
				BeginPlot( mocount ,"Lua_fd_bao_113647",10)-------防護罩		
			end
			if CheckBuff(boss,505047) == true then 
				comob=1
				WriteRoleValue(boss,EM_RoleValue_Register8 ,comob)
			end 
			mob=ReadRoleValue(boss ,EM_RoleValue_Register2)
			if mob==0 then --------------------------第一階段     守衛戰   生出發光的防護罩
				time1=time1+1
			---	time2=time2+1
				if time1>=8 then -------------------------------基本招式
				Luck=DW_Rand(100)
					if (Luck >= 0 and Luck < 25) or (Luck >= 50 and Luck < 75) then
						SkillIndex = 2------------------------------------------單體打王傷害
						BossTarget = AttackTarget
						CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )
						sleep(20)
					elseif (Luck >= 25 and Luck < 50) or (Luck >= 75 and Luck < 101) then	
						SkillIndex = 1-------------------------------------------單體打王傷害
						Play_Chose=DW_HateRemain(1)----------仇恨表去掉主坦
						kp=DW_Rand(table.getn(Play_Chose))
						if kp==0 then 
						end
						if kp~=0 then 
						BossTarget = Play_Chose[kp]															
						CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )
						sleep(20)
						end
					end
					time1=0
				end
			-------	if time2>=25 then 
			----		CastSpellLV( OwnerID() , OwnerID() , 494458 , 0 )---------全體範圍恐懼
			---		ScriptMessage( OwnerID() , -1 , 2 , "[SC_102623_9]" , 1 )	
				---	sleep(20)
			--		time2=0
			---	end	       
			end
			if mob==1 then --------------------------第二階段     火追人+火炫風   -------砍掉防護罩生出新的
				t4=0
				time3=0
				time1=time1+1
				time2=time2+1
				ftime=ftime+1------------------------火追人
				fwtime=fwtime+1---------------------火柱
				if ftime>=5 then 
					if t3==0 then 
					fm=ReadRoleValue(OwnerID(),EM_RoleValue_Register3)
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_102670_05]" , 1 )	
					BeginPlot( sf ,"Lua_bk_smfire_102780",10)-------------------------------------------放入火追人劇情
					t3=1
					end
				end 
				if ftime>=20 then 
					if t3==1 then 
					fm=ReadRoleValue(OwnerID(),EM_RoleValue_Register3)
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_102670_05]" , 1 )	
					BeginPlot( sf ,"Lua_bk_smfire_102780",10)-------------------------------------------放入火追人劇情
					end
				end
				if time1>=8 then  -------------------------------基本招式
				Luck=DW_Rand(100)
					if (Luck >= 0 and Luck < 25) or (Luck >= 50 and Luck < 75) then
						SkillIndex = 2------------------------------------------單體打王傷害
						BossTarget = AttackTarget
						CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )
						ScriptMessage( OwnerID() , -1 , 2 , "[SC_102623_03]" , 1 )
						sleep(20)
					elseif (Luck >= 25 and Luck < 50) or (Luck >= 75 and Luck < 101) then	
						SkillIndex = 1-------------------------------------------單體打王傷害
						Play_Chose=DW_HateRemain(1)----------仇恨表去掉主坦
						kp=DW_Rand(table.getn(Play_Chose))
						if kp==0 then 
						end
						if kp~=0 then 
						BossTarget = Play_Chose[kp]															
						CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )
						sleep(20)
						end
					end
					time1=0
				end
			--	if time2>=25 then 
				---	CastSpellLV( OwnerID() , OwnerID() , 494458 , 0 )---------全體範圍恐懼
			---		ScriptMessage( OwnerID() , -1 , 2 , "[SC_102623_9]" , 1 )	
			---		sleep(20)
			---		time2=0
			---	end
			end
			if mob==2 then --------------------------第三階段  火牆
				t3=0
				ftime=0
				time1=time1+1
				time3=time3+1
				if time1>=8 then  -------------------------------基本招式
				Luck=DW_Rand(100)
					if (Luck >= 0 and Luck < 25) or (Luck >= 50 and Luck < 75) then
						SkillIndex = 2------------------------------------------單體打王傷害
						BossTarget = AttackTarget
						CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )
						sleep(20)
					elseif (Luck >= 25 and Luck < 50) or (Luck >= 75 and Luck < 101) then	
						SkillIndex = 1-------------------------------------------單體打王傷害
						Play_Chose=DW_HateRemain(1)----------仇恨表去掉主坦
						kp=DW_Rand(table.getn(Play_Chose))
						if kp==0 then 
						end
						if kp~=0 then 
						BossTarget = Play_Chose[kp]															
						CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )
						sleep(20)
						end
					end
					time1=0
				end
				if time3>= 3 then ----------------取位置
					if t4 ==0 then 
						ScriptMessage( boss , -1 , 2 , "[SC_102670_04]" , "#FF00CC" )
						sleep(50)
						local bbf=CreateObj( 102781 ,3809.4, 1000 , 4326.8, 168.5 , 1)--------------------駐利空中--------------在空中出現一個特效球
						SetModeEx( bbf , EM_SetModeType_Gravity, false) 
						SetModeEx( bbf , EM_SetModeType_AlignToSurface, false) 
						AddToPartition( bbf , RoomID )
						WriteRoleValue(bbf, EM_RoleValue_Livetime,15)	---------------存在時間livetime
						CastSpellLV( boss , bbf , 494461 , 0 )-------------施放龍之隕石
						-----ScriptMessage( boss , -1 , 2 , "[SC_102670_04]" , 1 )
						AddBuff(bbf, 504994 , 1 , -1 )
						local seat =DW_Rand(table.getn(seat_chose))
						---------say(OwnerID(),"seat"..seat)
						if seat==1 then
							bf=CreateObjByFlag(102781,780470,seat_chose[seat],1)
							SetModeEx( bf , EM_SetModeType_Gravity, false) ---重力
							SetModeEx( bf , EM_SetModeType_Mark, false)
							SetModeEx( bf , EM_SetModeType_HideName, false)
							SetModeEx( bf , EM_SetModeType_ShowRoleHead, false)
							SetModeEx( bf , EM_SetModeType_NotShowHPMP, false)
							SetModeEx( bf , EM_SetModeType_Obstruct, true)   -----阻擋
							SetModeEx( bf , EM_SetModeType_Strikback, false) ---反擊
							SetModeEx( bf , EM_SetModeType_Move, false) ---移動	
							SetModeEx( bf , EM_SetModeType_Fight, false) ---可砍殺
							SetModeEx( bf , EM_SetModeType_SearchenemyIgnore, false) 
							SetModeEx( bf , EM_SetModeType_Searchenemy, false)
							SetModeEx( bf , EM_SetModeType_Show, true)
							AddToPartition( bf , RoomID )
							WriteRoleValue(bf, EM_RoleValue_Livetime,12)	---------------存在時間livetime
							BeginPlot( bf ,"Lua_bk_bfAB_102670",10)
						end
						if seat==2 then
							bf=CreateObjByFlag(102781,780470,seat_chose[seat],1)
							SetModeEx( bf , EM_SetModeType_Gravity, false) ---重力
							SetModeEx( bf , EM_SetModeType_Mark, false)
							SetModeEx( bf , EM_SetModeType_HideName, false)
							SetModeEx( bf , EM_SetModeType_ShowRoleHead, false)
							SetModeEx( bf , EM_SetModeType_NotShowHPMP, false)
							SetModeEx( bf , EM_SetModeType_Obstruct, true)   -----阻擋
							SetModeEx( bf , EM_SetModeType_Strikback, false) ---反擊
							SetModeEx( bf , EM_SetModeType_Move, false) ---移動	
							SetModeEx( bf , EM_SetModeType_Fight, false) ---可砍殺
							SetModeEx( bf , EM_SetModeType_SearchenemyIgnore, false) 
							SetModeEx( bf , EM_SetModeType_Searchenemy, false)
							SetModeEx( bf , EM_SetModeType_Show, true)
							AddToPartition( bf , RoomID )
							WriteRoleValue(bf, EM_RoleValue_Livetime,12)	---------------存在時間livetime
							BeginPlot( bf ,"Lua_bk_bfBA_102670",10)
						end
						if seat==3 then
							bf=CreateObjByFlag(102781,780470,seat_chose[seat],1)
							SetModeEx( bf , EM_SetModeType_Gravity, false) ---重力
							SetModeEx( bf , EM_SetModeType_Mark, false)
							SetModeEx( bf , EM_SetModeType_HideName, false)
							SetModeEx( bf , EM_SetModeType_ShowRoleHead, false)
							SetModeEx( bf , EM_SetModeType_NotShowHPMP, false)
							SetModeEx( bf , EM_SetModeType_Obstruct, true)   -----阻擋
							SetModeEx( bf , EM_SetModeType_Strikback, false) ---反擊
							SetModeEx( bf , EM_SetModeType_Move, false) ---移動	
							SetModeEx( bf , EM_SetModeType_Fight, false) ---可砍殺
							SetModeEx( bf , EM_SetModeType_SearchenemyIgnore, false) 
							SetModeEx( bf , EM_SetModeType_Searchenemy, false)
							SetModeEx( bf , EM_SetModeType_Show, true)
							AddToPartition( bf , RoomID )
							WriteRoleValue(bf, EM_RoleValue_Livetime,12)	---------------存在時間livetime
							BeginPlot( bf ,"Lua_bk_bfCD_102670",10)
						end
						if seat==4 then
							bf=CreateObjByFlag(102781,780470,seat_chose[seat],1)
							SetModeEx( bf , EM_SetModeType_Gravity, false) ---重力
							SetModeEx( bf , EM_SetModeType_Mark, false)
							SetModeEx( bf , EM_SetModeType_HideName, false)
							SetModeEx( bf , EM_SetModeType_ShowRoleHead, false)
							SetModeEx( bf , EM_SetModeType_NotShowHPMP, false)
							SetModeEx( bf , EM_SetModeType_Obstruct, true)   -----阻擋
							SetModeEx( bf , EM_SetModeType_Strikback, false) ---反擊
							SetModeEx( bf , EM_SetModeType_Move, false) ---移動	
							SetModeEx( bf , EM_SetModeType_Fight, false) ---可砍殺
							SetModeEx( bf , EM_SetModeType_SearchenemyIgnore, false) 
							SetModeEx( bf , EM_SetModeType_Searchenemy, false)
							SetModeEx( bf , EM_SetModeType_Show, true)
							AddToPartition( bf , RoomID )
							WriteRoleValue(bf, EM_RoleValue_Livetime,12)	---------------存在時間livetime
							BeginPlot( bf ,"Lua_bk_bfDC_102670",10)
						end
					-----	CastSpellLV( bbf , bf , 494462 , 1 )-------------施放龍之隕石
					----	table.remove (seat_chose, seat)
					----	table.getn (seat_chose)
						t4=1
					end
				end
			---	if time3>=20 then
			---		if t4==1 then 
			---			ScriptMessage( boss , -1 , 2 , "[SC_102670_04]" , "#FF00CC" )
			---			local bbf=CreateObj( 102781 ,3809.4, 1000 , 4326.8, 168.5 , 1)--------------------駐利空中--------------在空中出現一個特效球
			---			SetModeEx( bbf , EM_SetModeType_Gravity, false) 
			---			SetModeEx( bbf , EM_SetModeType_AlignToSurface, false) 
			--			AddToPartition( bbf , RoomID )
			---			WriteRoleValue(bbf, EM_RoleValue_Livetime,15)	---------------存在時間livetime
			--			CastSpellLV( boss , bbf , 494461 , 0 )-------------施放龍之隕石
						---ScriptMessage( boss , -1 , 2 , "[SC_102670_04]" , 1 )
			----			AddBuff(bbf, 504994 , 1 , -1 )					
			--			local seat =DW_Rand(table.getn(seat_chose))
			---			-----------------say(OwnerID(),"seat"..seat)
			---			if seat==1 then
			---			bf=CreateObjByFlag(102781,780470,seat_chose[seat],1)
			---			SetModeEx( bf , EM_SetModeType_Gravity, false) ---重力
			---			SetModeEx( bf , EM_SetModeType_Mark, false)
			---			SetModeEx( bf , EM_SetModeType_HideName, false)
			---			SetModeEx( bf , EM_SetModeType_ShowRoleHead, false)
			---			SetModeEx( bf , EM_SetModeType_NotShowHPMP, false)
			---			SetModeEx( bf , EM_SetModeType_Obstruct, true)   -----阻擋
			---			SetModeEx( bf , EM_SetModeType_Strikback, false) ---反擊
			---			SetModeEx( bf , EM_SetModeType_Move, false) ---移動	
			---			SetModeEx( bf , EM_SetModeType_Fight, false) ---可砍殺
			---			SetModeEx( bf , EM_SetModeType_SearchenemyIgnore, false) 
			---			SetModeEx( bf , EM_SetModeType_Searchenemy, false)
			---			SetModeEx( bf , EM_SetModeType_Show, true)
			---			AddToPartition( bf , RoomID )
			---			WriteRoleValue(bf, EM_RoleValue_Livetime,12)	---------------存在時間livetime
			---			BeginPlot( bf ,"Lua_bk_bfAB_102670",10)
			---			end
			---			if seat==2 then
			---			bf=CreateObjByFlag(102781,780470,seat_chose[seat],1)
			---			SetModeEx( bf , EM_SetModeType_Gravity, false) ---重力
			---			SetModeEx( bf , EM_SetModeType_Mark, false)
			---			SetModeEx( bf , EM_SetModeType_HideName, false)
			---			SetModeEx( bf , EM_SetModeType_ShowRoleHead, false)
			---			SetModeEx( bf , EM_SetModeType_NotShowHPMP, false)
			---			SetModeEx( bf , EM_SetModeType_Obstruct, true)   -----阻擋
			---			SetModeEx( bf , EM_SetModeType_Strikback, false) ---反擊
			---			SetModeEx( bf , EM_SetModeType_Move, false) ---移動	
			---			SetModeEx( bf , EM_SetModeType_Fight, false) ---可砍殺
			---			SetModeEx( bf , EM_SetModeType_SearchenemyIgnore, false) 
			---			SetModeEx( bf , EM_SetModeType_Searchenemy, false)
			---			SetModeEx( bf , EM_SetModeType_Show, true)
			---			AddToPartition( bf , RoomID )
			---			WriteRoleValue(bf, EM_RoleValue_Livetime,12)	---------------存在時間livetime
			---			BeginPlot( bf ,"Lua_bk_bfBA_102670",10)
			---			end
			---			if seat==3 then
			---			bf=CreateObjByFlag(102781,780470,seat_chose[seat],1)
			---			SetModeEx( bf , EM_SetModeType_Gravity, false) ---重力
			---			SetModeEx( bf , EM_SetModeType_Mark, false)
			---			SetModeEx( bf , EM_SetModeType_ShowRoleHead, false)
			---			SetModeEx( bf , EM_SetModeType_NotShowHPMP, false)
			---			SetModeEx( bf , EM_SetModeType_Obstruct, true)   -----阻擋
			---			SetModeEx( bf , EM_SetModeType_Strikback, false) ---反擊
			---			SetModeEx( bf , EM_SetModeType_Move, false) ---移動	
			---			SetModeEx( bf , EM_SetModeType_Fight, false) ---可砍殺
			---			SetModeEx( bf , EM_SetModeType_SearchenemyIgnore, false) 
			---			SetModeEx( bf , EM_SetModeType_Searchenemy, false)
			---			SetModeEx( bf , EM_SetModeType_Show, true)
			---			AddToPartition( bf , RoomID )
			---			WriteRoleValue(bf, EM_RoleValue_Livetime,12)	---------------存在時間livetime
			---			BeginPlot( bf ,"Lua_bk_bfCD_102670",10)
			---			end
			---			if seat==4 then
			---			bf=CreateObjByFlag(102781,780470,seat_chose[seat],1)
			---			SetModeEx( bf , EM_SetModeType_Gravity, false) ---重力
			---			SetModeEx( bf , EM_SetModeType_Mark, false)
			---			SetModeEx( bf , EM_SetModeType_HideName, false)
			---			SetModeEx( bf , EM_SetModeType_ShowRoleHead, false)
			---			SetModeEx( bf , EM_SetModeType_NotShowHPMP, false)
			---			SetModeEx( bf , EM_SetModeType_Obstruct, true)   -----阻擋
			---			SetModeEx( bf , EM_SetModeType_Strikback, false) ---反擊
			---			SetModeEx( bf , EM_SetModeType_Move, false) ---移動	
			---			SetModeEx( bf , EM_SetModeType_Fight, false) ---可砍殺
			---			SetModeEx( bf , EM_SetModeType_SearchenemyIgnore, false) 
			---			SetModeEx( bf , EM_SetModeType_Searchenemy, false)
			---			SetModeEx( bf , EM_SetModeType_Show, true)
			---			AddToPartition( bf , RoomID )
			---			WriteRoleValue(bf, EM_RoleValue_Livetime,12)	---------------存在時間livetime
			---			end
			------		-------	CastSpellLV( bbf , bf , 494462 , 0 )-------------施放龍之隕石
			---			seat_chose={1,2,3,4}
			---			table.getn (seat_chose)
			---			time3=0
			---			t4=2
					----end
				------end
			end
			if mob ==3 then --------------------------------招換翼蛇將軍!!!
				if ggmob==0 then
					ggboss=CreateObjByFlag(102802,780470,12,1)-----------------------產生翼蛇將軍----------在6點
					AddToPartition( ggboss , RoomID )
					SetAttack( ggboss , BossTarget)
					sleep(10)
					ScriptMessage( ggboss , -1 , 2 , "[SC_102670_06]" , 1 )
					Yell( ggboss ,  "[SC_102670_06]" , 5)
					sleep(20)
					ScriptMessage( ggboss , -1 , 2 , "[SC_102670_09]" , 1 )
					Yell( ggboss ,  "[SC_102670_09]" , 5)
					sleep(20)	
					BeginPlot(ggboss,"Lua_bk_ggboss_102802",20)
					BeginPlot( ggboss ,"Lua_bk_fd_gb_102802",100)
					ScriptMessage( ggboss , -1 , 2 , "[SC_102670_10]" , 1 )
					Yell( ggboss ,  "[SC_102670_10]" , 5)
					ggmob=1
				end
				time1=time1+1
				if time1>=8 then -------------------------------基本招式
				Luck=DW_Rand(100)
					if (Luck >= 0 and Luck < 25) or (Luck >= 50 and Luck < 75) then
						SkillIndex = 2------------------------------------------單體打王傷害
						BossTarget = AttackTarget
						CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )
						sleep(20)
					elseif (Luck >= 25 and Luck < 50) or (Luck >= 75 and Luck < 101) then	
						SkillIndex = 1-------------------------------------------單體打王傷害
						Play_Chose=DW_HateRemain(1)----------仇恨表去掉主坦
						kp=DW_Rand(table.getn(Play_Chose))
						if kp==0 then 
						end
						if kp~=0 then 
						BossTarget = Play_Chose[kp]															
						CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )
						sleep(20)
						end
					end
					time1=0
				end
			end
		elseif HateListCount( boss ) == 0 then----------------離開戰鬥 所有值都該回歸
			if CombatBegin==1 then-------------------------------------------生出ㄧ之王
				sleep(50)
				SetModeEx( boss , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( boss , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( boss , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( boss , EM_SetModeType_Searchenemy, false)----------------------------這裡寫重置
				time1=0
				time2=0
				time3=0
				time4=0
				time5=0
				alltime=0
				CombatBegin=0
				gg=1 
				DelObj(sf)
				mob=4
				WriteRoleValue(boss, EM_RoleValue_Register2,mob)
				WriteRoleValue(boss, EM_RoleValue_Register4,1)
				WriteRoleValue(st, EM_RoleValue_Register4,1)------王離開戰鬥囉
				WriteRoleValue(boss, EM_RoleValue_Register9,ggboss)
			end
		end
	end
end
