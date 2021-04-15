------BOSS1  ==人馬無雙    BUFF1
------BOSS2 ==馬一之        
------BOSS3 ==人一之
------BOSS4 ==光天使一之       BUFF   10秒存在
------BOSS5 ==暗天使一之       BUFF   20秒存在
------所以控制器的第一個EM_RoleValue_Register1       辦別王是否還在戰鬥中   
-----戰鬥系統beginstart
---------------------------------------------------------------------------------------------------觸碰系統開場你們給我乖乖的去碰牠吧
function Lua_bk_r05_touchcount_103200()----------------------------------------------------------------------------------------------------  BOSS 1   ==   人馬無雙
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local count = OwnerID ()
	local to = CreateObjByFlag( 113417,780427,1,1)---建立觸碰式開關
	AddtoPartition(to , RoomID ) 
    WriteRoleValue(to, EM_RoleValue_PID,count)   
	SetPlot( to , "touch" , "Lua_bk_r05_touch_113417_ea" , 50 )----寫開關劇情
	local door = CreateObj( 102563, 1456.4,1513.2,-1733.4,273,1)
	---SetFightMode( door , 0 , 0 , 0 , 0 )
 	SetModeEx( door , EM_SetModeType_Gravity, false) 
	-----SetModeEx( door , EM_SetModeType_AlignToSurface, false) 
	SetModeEx( door , EM_SetModeType_Mark, false)
	SetModeEx( door , EM_SetModeType_HideName, false)
	SetModeEx( door , EM_SetModeType_ShowRoleHead, false)
	SetModeEx( door , EM_SetModeType_NotShowHPMP, false)
	SetModeEx( door , EM_SetModeType_Obstruct, true)
	SetModeEx( door , EM_SetModeType_Strikback, false) ---反擊
	SetModeEx( door , EM_SetModeType_Move, false) ---移動	
	SetModeEx( door , EM_SetModeType_Fight, false) ---可砍殺
	SetModeEx( door , EM_SetModeType_SearchenemyIgnore, false) 
	SetModeEx( door , EM_SetModeType_Searchenemy, false)
	SetModeEx( door , EM_SetModeType_Show, true)
	AddtoPartition( door , RoomID )
	WriteRoleValue(to, EM_RoleValue_Register1,door)	
	
end
function Lua_bk_r05_touch_113417_ea()----------拉霸!
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local to = TargetID()
	local door=ReadRoleValue(to,EM_RoleValue_Register1)
	SetPlot( TargetID()  ,"touch", "" ,40 ) 
	local count = ReadRoleValue(to,EM_RoleValue_PID)
	ScriptMessage( count, -1 , 2 , "[SC_102444_01]" , 2 ) ----是誰打擾偉大的曼特瑞克！！！
	PlayMotionEX( to ,  ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP  )
	---sleep(10)
	DelObj(count)
	local start = CreateObjByFlag( 103203,780427,1,1)-----------------開場控制者
		SetModeEx( start , EM_SetModeType_Show, false) 
		SetModeEx( start , EM_SetModeType_Mark, false)
		SetModeEx( start , EM_SetModeType_Strikback, false) 
		SetModeEx( start , EM_SetModeType_Move, false) 
		SetModeEx( start , EM_SetModeType_Fight, false) 
		SetModeEx( start , EM_SetModeType_SearchenemyIgnore, false) 
		SetModeEx( start , EM_SetModeType_HideName, false) 
		SetModeEx( start , EM_SetModeType_HideMinimap, false)
		SetModeEx( start , EM_SetModeType_Searchenemy, false)
		AddtoPartition(start , RoomID )
		WriteRoleValue( start, EM_RoleValue_Register3,door)
		BeginPlot( start,"Lua_bk_r05_start_103203",0 )
end
function Lua_bk_r05_start_103203()--------------------------判斷程式
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local start = OwnerID()  ------開始
	local door=ReadRoleValue(start,EM_RoleValue_Register3)-----------------讀取門id
	local m1count = CreateObjByFlag( 103195,780427,1,1)---建立第一階段控制器
	SetModeEx( m1count , EM_SetModeType_Show, false) 
	SetModeEx( m1count , EM_SetModeType_Mark, false)
	SetModeEx( m1count , EM_SetModeType_Strikback, false) 
	SetModeEx( m1count , EM_SetModeType_Move, false) 
	SetModeEx( m1count , EM_SetModeType_Fight, false) 
	SetModeEx( m1count , EM_SetModeType_SearchenemyIgnore, false) 
	SetModeEx( m1count , EM_SetModeType_HideName, false) 
	SetModeEx( m1count , EM_SetModeType_HideMinimap, false)
	SetModeEx( m1count , EM_SetModeType_Searchenemy, false)
	AddtoPartition(m1count , RoomID )
	WriteRoleValue(start, EM_RoleValue_PID,m1count)  ----產生的物件寫下m1 的gid
	WriteRoleValue(m1count, EM_RoleValue_PID,start)   
	BeginPlot( m1count,"Lua_bk_r05_mode1_time_103195",0 )---把mode1  控制器產生出來	
	while 1 do 
	sleep(10)
		local x = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)-------start EM_RoleValue_Register1 資料放入是否要重置的資料
		if x==1 then 
			local m1count = CreateObjByFlag( 103195,780427,1,1)---建立第一階段控制器
			SetModeEx( m1count , EM_SetModeType_Show, false) 
			SetModeEx( m1count , EM_SetModeType_Mark, false)
			SetModeEx( m1count , EM_SetModeType_Strikback, false) 
			SetModeEx( m1count , EM_SetModeType_Move, false) 
			SetModeEx( m1count , EM_SetModeType_Fight, false) 
			SetModeEx( m1count , EM_SetModeType_SearchenemyIgnore, false) 
			SetModeEx( m1count , EM_SetModeType_HideName, false) 
			SetModeEx( m1count , EM_SetModeType_HideMinimap, false)
			SetModeEx( m1count , EM_SetModeType_Searchenemy, false)
			AddtoPartition(m1count , RoomID )
			WriteRoleValue(start, EM_RoleValue_PID,m1count)  ----產生的物件寫下m1 的gid
			WriteRoleValue(m1count, EM_RoleValue_PID,start)   
			BeginPlot( m1count, "Lua_bk_r05_mode1_time_103195",0 )---把mode1  控制器產生出來	
			x=0
			WriteRoleValue( start, EM_RoleValue_Register1,0)
		end
	end
end

function Lua_bk_r05_mode1_time_103195()    -------人馬時間控制器 
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)	
	local m1count = OwnerID()	
	local start = ReadRoleValue(m1count ,EM_RoleValue_PID) -------得到start
	local beginstart1 = 0--ReadRoleValue(mode1count ,EM_RoleValue_Register1) -------------判斷戰鬥系統beginstart
	local beginstart2 = 0
	local time1=0
	local be=0
	local X=0
	local Y=0 
	local Z=0
	local Dir=0
	local X0=0
	local Y0=0 
	local Z0=0
	local Dir0=0
	local boss2 = CreateObjByFlag(103197,780427,2,1)----------------------------------------------開場囉建立馬
	WriteRoleValue( boss2, EM_RoleValue_PID,m1count)-----------在馬之中紀錄控制器的GID
	AddtoPartition(boss2 , RoomID )
	-----ScriptMessage( boss2, -1 , 1 , "[SC_102444_01]" , 2 ) ----是誰打擾偉大的曼特瑞克！！！
	ScriptMessage( boss2, -1 , 2 , "[SC_102444_02]" , 2 ) ----菲恩洛斯！給予他們制裁！
	local boss3 = CreateObjByFlag(103196,780427,2,1)----------------------------------------------開場囉建立人
	WriteRoleValue( boss3, EM_RoleValue_PID,m1count)-----------在人之中紀錄控制器的GID
	SetModeEx( boss3 , EM_SetModeType_Searchenemy, false)
	SetModeEx( boss3 , EM_SetModeType_Move, false)
	SetModeEx( boss3 , EM_SetModeType_Strikback, false)
	SetModeEx( boss3 , EM_SetModeType_Fight, false)
	AttachObj( boss3 , boss2 ,0 , "p_link" , "p_link" )
	AddtoPartition(boss3 , RoomID )
---	AttachObj( boss3 , boss2 ,0 , "p_link" , "p_link" )
	WriteRoleValue( boss2, EM_RoleValue_Register1,boss3)-------在馬身上寫上人的資料
	WriteRoleValue( boss3, EM_RoleValue_Register1,boss2)-------在馬身上寫上人的資料
	BeginPlot(boss2 , "Lua_bk_r05_boss2_103197",0 )--------------------------------------執行第一階段馬
	SetPlot(boss2, "dead" ,"Lua_bk_r05_horse_dead_103197",0)------------------------死亡劇情
	BeginPlot(boss3 , "Lua_bk_r05_boss3_1_103196",0 )--------------------------------------執行第一階段人
	sleep(20)
	while 1 do 
	sleep(10)
		beginstart1 = ReadRoleValue(m1count ,EM_RoleValue_Register2) ----------------------------------判斷馬離開戰鬥
		beginstart2 = ReadRoleValue(m1count ,EM_RoleValue_Register3)
		if beginstart1==1 then --------------------------------------------------------------------------------------------當他進入戰鬥的時候
			be=1
			time1=time1+1
			if time1==1 then --------------------合體放在旗標3
				ScriptMessage( boss3, -1 , 2 , "[SC_102444_03]" , 2 )------------來吧！菲恩洛斯！讓他嘗試看看我們的厲害
				SysCastSpellLv( boss3 , boss3 , 494165,0)-----------------------------人在身上放傳送------
				SysCastSpellLv( boss2 , boss2 , 494165,0)-----------------------------馬在身上放傳送------先播放法術
				sleep(20)--------------------------------------------------------------------------------這個動作是要先讓馬進入戰鬥
				SetPosByFlag( boss2, 780427 , 3 )-------------全部傳到旗標3的位置
				SetPosByFlag( boss3, 780427 , 3 )-------------全部傳到旗標3的位置
				DelObj(boss3)
				boss3 = LuaFunc_CreateObjByObj ( 103196 , boss2 )----------------------------------------------開場囉建立人
				WriteRoleValue( boss3, EM_RoleValue_PID,m1count)-----------在人之中紀錄控制器的GID
				WriteRoleValue( boss2, EM_RoleValue_Register1,boss3)-------在馬身上寫上人的資料
				WriteRoleValue( boss3, EM_RoleValue_Register1,boss2)-------在馬身上寫上人的資料
				BeginPlot(boss3 , "Lua_bk_r05_boss3_1_103196",0 )--------------------------------------執行第一階段人
				SetModeEx( boss3 , EM_SetModeType_Searchenemy, false)
				SetModeEx( boss3 , EM_SetModeType_Move, false)
				SetModeEx( boss3 , EM_SetModeType_Strikback, false)
				SetModeEx( boss3 , EM_SetModeType_Fight, false)
				CancelBuff(boss2,504272)
				CancelBuff(boss3,504271)
				AddBuff(boss2,504271,0,-1)
				AddBuff(boss3,504271,0,-1)
			---	X0=ReadRoleValue(boss3 ,EM_RoleValue_X)
			---	Y0=ReadRoleValue(boss3 ,EM_RoleValue_Y)
			---	Z0=ReadRoleValue(boss3 ,EM_RoleValue_Z)
			---	Dir0=ReadRoleValue(boss3 ,EM_RoleValue_Dir)
		---		CastSpellLV( boss2 , boss3 , 493910, 0 )
				---SetModeEx( boss3 , EM_SetModeType_Move, false)
				--SetModeEx( boss3 , EM_SetModeType_DisableRotate, true)
				----ScriptMessage( TargetID(), -1 , 1 , "[SC_102295_01]" , 2 ) 回來吧!馬名讓他們看看我們合體的能力
				AttachObj( boss3 , boss2 ,0 , "p_link" , "p_link" )
			end
			if time1==31 then   --------------------------------------分開吧寶貝   分開放在4.5
				ScriptMessage( boss3, -1 , 2 , "[SC_102444_04]" , 2 )------------菲恩洛斯！雙面夾擊這些廢物！
				DetachObj(boss3)
				DetachObj(boss2)
				SysCastSpellLv( boss3 , boss3 , 494165,0)-----------------------------人在身上放傳送
				SysCastSpellLv( boss2 , boss2 , 494165,0)-----------------------------馬在身上放傳送
				sleep(20)
				SetPosByFlag( boss2, 780427 , 4 )-------------傳送到某個旗標
				SetPosByFlag( boss3, 780427 , 5 )-------------傳送到某個旗標
				DelObj(boss3)
				local AttackTarget = ReadRoleValue( boss2 , EM_RoleValue_AttackTargetID )
				boss3 = CreateObjByFlag(103196,780427,5,1)
			---	boss3 = LuaFunc_CreateObjByObj ( 103196 , boss3 )----------------------------------------------開場囉建立人
				WriteRoleValue( boss3, EM_RoleValue_PID,m1count)-----------在人之中紀錄控制器的GID
				WriteRoleValue( boss2, EM_RoleValue_Register1,boss3)-------在馬身上寫上人的資料
				WriteRoleValue( boss3, EM_RoleValue_Register1,boss2)-------在馬身上寫上人的資料
				BeginPlot(boss3 , "Lua_bk_r05_boss3_2_103196",0 )--------------------------------------執行第一階段人
				SetModeEx( boss3 , EM_SetModeType_Searchenemy, true)
				SetModeEx( boss3 , EM_SetModeType_Move, true)
				SetModeEx( boss3 , EM_SetModeType_Strikback, true)
				SetModeEx( boss3 , EM_SetModeType_Fight, true)
				AddtoPartition(boss3 , RoomID )
				SetAttack( boss3 , AttackTarget)
				CancelBuff(boss2,504271)
				CancelBuff(boss3,504271)
				AddBuff(boss2,504272,0,-1)
				AddBuff(boss3,504272,0,-1)
			--X=ReadRoleValue(boss2 ,EM_RoleValue_X)
			---Y=ReadRoleValue(boss2 ,EM_RoleValue_Y)
			--Z=ReadRoleValue(boss2 ,EM_RoleValue_Z)
			--Dir=ReadRoleValue(boss2 ,EM_RoleValue_Dir)
			---SetModeEx( boss3 , EM_SetModeType_Move, true)
			--SetModeEx( boss3 , EM_SetModeType_DisableRotate, false)
			--DetachObj(boss3)
			--DetachObj(boss2)
			--SetPos( boss3, X, Y , Z , Dir )------------------- 分解			
			end		
			if time1==60 then 
				time1=0
			end
		end
		if beginstart1 == 0  then -------------------------------------------------------------------------------------------- 當他離開戰鬥的時候
			sleep(10)
			if be == 1 then			
				CancelBuff(boss2,504271)
				CancelBuff(boss3,504271)
				CancelBuff(boss2,504272)
				CancelBuff(boss3,504272)
				time1=0
				---beginstart1=0
				WriteRoleValue( start, EM_RoleValue_Register1,1)
				DelObj(boss2)
				DelObj(boss3)
				DelObj(m1count)
			end
			if be==0 then 
			end
		end
	end	
end
---------------------------------------------------------------------------------------------------光暗天使控制器---------------------------------------------------------------------------------------------------
function Lua_bk_r05_mode2_time_103202()    -------光暗天使控制器
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )	
	local m2count = OwnerID()
	local start = ReadRoleValue(m2count,EM_RoleValue_PID)
	local door=ReadRoleValue(start,EM_RoleValue_Register3)-------------讀取門的id
	local boss3 = ReadRoleValue(m2count,EM_RoleValue_Register3)
	local beginstart3 = 0
	local beginstart4 = 0
	local time2 =0
	local black =0 
	local CombatBegin=0
	local be=0
	local gaov=0
	local alltime=0
		  Hide(boss3)	
	local fire0 =CreateObjByFlag(103201,780428,1,1)
		  AddToPartition(fire0 , RoomID )
		  SetModeEx( fire0 , EM_SetModeType_Show, false) 
		  WriteRoleValue( fire0, EM_RoleValue_PID,m2count)
		  WriteRoleValue( m2count, EM_RoleValue_Register4,fire0)
		  BeginPlot(fire0 ,"Lua_bk_r05_fire_check_103201",0 )
	--local boss4 = CreateObjByFlag(103199,780427,2,1)------開場先把光天使加入
	local boss4 = LuaFunc_CreateObjByObj ( 103199 , boss3 )
		  DelObj(boss3)
		  ScriptMessage( boss4, -1 , 2 , "[SC_102444_05]" , 2 )-----菲恩洛斯的死！你們將付出極大的代價
	      WriteRoleValue( boss4, EM_RoleValue_PID,m2count)-----------在光天使之中紀錄控制器的GID
	     --- AddToPartition(boss4 , RoomID )
		sleep(20)
	      BeginPlot(boss4 ,"Lua_bk_r05_boss4_103199",0 )--------------------------------------執行光天使劇情
	local boss5 = CreateObjByFlag(103198,780427,3,1)------開場先把暗天使加入
	local boss5_nowhp=ReadRoleValue( boss5, EM_RoleValue_HP)----讀取現在的血量
		  
          AddToPartition(boss5 , RoomID )
		  Hide( boss5 )
          sleep(10)
		  DelObj(boss5)
	while true do 
	      sleep(10)	  
		  alltime = alltime +1
	      beginstart3 = ReadRoleValue(m2count ,EM_RoleValue_Register1) ----------------------------------判斷馬離開戰鬥
          beginstart4 = ReadRoleValue(m2count ,EM_RoleValue_Register2)
		if beginstart3==1 or beginstart4==1 then 
		----	be=1----    戰鬥宣示
			alltime = alltime +1
		---	if alltime >=0 then 
				if beginstart3==1 then --------------------------------------------------------------------------------------------當他進入戰鬥的時候
				---be=1
				black = ReadRoleValue(m2count ,EM_RoleValue_Register9)
					if black==0 then ---------剛開場光天使出來囉----
						time2=time2+1
						---Say(OwnerID(),time2)
						if time2 ==3 then 	
							ScriptMessage( boss4, -1 , 2 , "[SC_102444_10]" , 1 )-----是誰打擾偉大的曼特瑞克！！！
							BeginPlot(fire0 , "Lua_bk_fire_rand_103201",0 )
						end
						if time2==21 then
						local fire1 = ReadRoleValue(fire0,EM_RoleValue_Register6)
						local fire2 = ReadRoleValue(fire0,EM_RoleValue_Register7)
						local fire3 = ReadRoleValue(fire0,EM_RoleValue_Register8)
						local fire4 = ReadRoleValue(fire0,EM_RoleValue_Register9)
						DelObj(fire1)
						DelObj(fire2)
						DelObj(fire3)
						DelObj(fire4)
						---DelObj(fire0)-------刪除光塔
						end
						if time2==22 then 
							time2=0
						end
					end
					if black==1 then 
						---boss5 = CreateObjByFlag(103198,780427,3,1)
						local AttackTarget = ReadRoleValue( boss4 , EM_RoleValue_AttackTargetID )
						boss5 = LuaFunc_CreateObjByObj(103198,boss4)-------出現在BOOS4所在的位置
						ScriptMessage( boss5, -1 , 2 , "[SC_102444_07]" , 1 )----你們這些不堪一擊的生物，竟敢來挑戰我！齊歐菲！
						SetAttack( boss5 , AttackTarget)
						AddBuff( boss5 ,502707, 1 , 600)
						WriteRoleValue( boss5,EM_RoleValue_PID,m2count)-----------在暗天使之中紀錄控制器的GID
						WriteRoleValue( boss5, EM_RoleValue_HP,boss5_nowhp)
						WriteRoleValue( boss5,EM_RoleValue_Register1,door)
						---AddtoPartition(boss5 , RoomID )-------出現吧暗天使
						SetPlot( boss5 ,"dead", "Lua_bk_r05_door_103200" ,50)
						BeginPlot(boss5 , "Lua_bk_r05_boss5_103198",50 )
						beginstart4=1
						beginstart3=0
						WriteRoleValue( m2count, EM_RoleValue_Register9,0)
						DelObj(boss4)
						sleep(20)
						local fire1 = ReadRoleValue(fire0,EM_RoleValue_Register6)
						local fire2 = ReadRoleValue(fire0,EM_RoleValue_Register7)
						local fire3 = ReadRoleValue(fire0,EM_RoleValue_Register8)
						local fire4 = ReadRoleValue(fire0,EM_RoleValue_Register9)
						DelObj(fire1)
						DelObj(fire2)
						DelObj(fire3)
						DelObj(fire4)
					end
				end	
				if beginstart4==1 then ---------------------------------------------------黑天使出現時間!!!!
					sleep(300)--------出現時間40秒
					boss5_nowhp=ReadRoleValue( boss5, EM_RoleValue_HP)----讀取現在的血量
					local AttackTarget = ReadRoleValue( boss4 , EM_RoleValue_AttackTargetID )
					boss4 = LuaFunc_CreateObjByObj(103199,boss5)
					SetAttack( boss4 , AttackTarget)
					--boss4 = CreateObjByFlag(103199,780427,2,1)----- 再次建立光天使
					WriteRoleValue( boss4, EM_RoleValue_PID,m2count)-----------在光天使之中紀錄控制器的GID
					DelObj(boss5)
					sleep(20)
					--AddtoPartition(boss4 , RoomID )
					BeginPlot(boss4 , "Lua_bk_r05_boss4_103199",0)--------------------------------------執行光天使劇情
					beginstart3=1
					-----DelObj(boss5)
					WriteRoleValue( m2count, EM_RoleValue_Register1,1)
					WriteRoleValue( m2count, EM_RoleValue_Register2,0)
					alltime = alltime +40
					time2=0
				end
		--	elseif alltime >= 361 then ---------------給予狂暴buff 
		--	sleep(20)
		--		if gaov==0 then 
			---	ScriptMessage( boss5, -1 , 2 , "[SC_102444_11]" , 1 )
			---	Say(boss5,"[SC_102444_11]")
			---	ScriptMessage( boss4, -1 , 2 , "[SC_102444_11]" , 1 )
			---	Say(boss4,"[SC_102444_11]")
				gaov=1
			--	end 
			---AddBuff( boss5 , 504269 , 1 , 600)
		----	AddBuff( boss4 , 504269 , 1 , 600)
			end
	---	end
		if beginstart3==0 and beginstart4==0 then
			----if be==1 then			
				DelObj(boss4)
				DelObj(boss5)
				WriteRoleValue( start, EM_RoleValue_Register1,1)
				local fire1 = ReadRoleValue(fire0,EM_RoleValue_Register6)
				local fire2 = ReadRoleValue(fire0,EM_RoleValue_Register7)
				local fire3 = ReadRoleValue(fire0,EM_RoleValue_Register8)
				local fire4 = ReadRoleValue(fire0,EM_RoleValue_Register9)
				DelObj(fire1)
				DelObj(fire2)
				DelObj(fire3)
				DelObj(fire4)
				DelObj(fire0)-------刪除光塔
				--CombatBegin = 0
				--WriteRoleValue( m2count, EM_RoleValue_Register1,CombatBegin)
				--WriteRoleValue( m2count, EM_RoleValue_Register2,CombatBegin)
				DelObj(m2count)
				alltime=0
			---end
		----	if be==0 then 
		---	end
		end	
	end	
end		
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_bk_fire_rand_103201()		-------4個塔去做位置rand     ----轉吧轉吧七彩霓虹燈---隨機的去 rand光塔放了四種光塔劇情
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )	
	local fire0 = OwnerID()
	local m2count=ReadRoleValue(fire0,EM_RoleValue_PID)
	local fire=0
	local seat_chose={2,3,4,5}
	for i=1 , 4 ,1 do
		local seat =DW_Rand(table.getn(seat_chose))
		fire=fire+1
		if fire==1 then 
			local fire1 = CreateObjByFlag(113405,780428,seat_chose[seat],1)
			AddToPartition(fire1 , RoomID )
			SetPlot( fire1 , "touch" , "Lua_bk_r_range1_102461_easy" , 40 )----寫入光塔1劇情
			WriteRoleValue( fire1, EM_RoleValue_PID,fire0)
			WriteRoleValue( fire0, EM_RoleValue_Register6,fire1)
		elseif fire==2 then
			local fire2 = CreateObjByFlag(113406,780428,seat_chose[seat],1)
			AddToPartition( fire2, RoomID )
			SetPlot( fire2 , "touch" , "Lua_bk_r_range2_102462_easy" , 40 )----寫入光塔2劇情
			WriteRoleValue( fire2, EM_RoleValue_PID,fire0)
			WriteRoleValue( fire0, EM_RoleValue_Register7,fire2)
		elseif fire==3 then
			local fire3	= CreateObjByFlag(113407,780428,seat_chose[seat],1)
			AddToPartition(fire3 , RoomID )
			SetPlot( fire3 , "touch" , "Lua_bk_r_range3_102463_easy" , 40 )----寫入光塔3劇情				
			WriteRoleValue( fire3, EM_RoleValue_PID,fire0)
			WriteRoleValue( fire0, EM_RoleValue_Register8,fire3)
		elseif fire==4 then
			local fire4 = CreateObjByFlag(113408,780428,seat_chose[seat],1)
			AddToPartition(fire4 , RoomID )
			SetPlot( fire4 , "touch" , "Lua_bk_r_range4_102464_easy" , 40 )----寫入光塔4劇情
			WriteRoleValue( fire4, EM_RoleValue_PID,fire0)
			WriteRoleValue( fire0, EM_RoleValue_Register9,fire4)
		end
		table.remove (seat_chose, seat)
		table.getn (seat_chose)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------4種不同的光塔放入4種checkbuff的劇情
function Lua_bk_r_range1_102461_easy()--------------------光塔一
	local RoomID = ReadRoleValue( TargetID() , EM_RoleValue_RoomID )	
	local fire1 = TargetID()
	local fire0 = ReadRoleValue(TargetID(),EM_RoleValue_PID)
	SetPlot( TargetID()  ,"touch", "" ,10 )
	if CheckBuff( OwnerID() , 504230) == true then
		AddBuff( fire0 , 504234, 1 , 15 )
		CastSpellLV( OwnerID() , TargetID() , 493924, 1 )
	end
end
function Lua_bk_r_range2_102462_easy()--------------------光塔二	
	local RoomID = ReadRoleValue( TargetID() , EM_RoleValue_RoomID )					
	local fire0 = ReadRoleValue(TargetID(),EM_RoleValue_PID)
	SetPlot( TargetID()  ,"touch", "" ,10 )
	if CheckBuff( OwnerID() , 504231) == true then
		AddBuff( fire0 , 504235, 1 , 15)
		CastSpellLV( OwnerID() , TargetID() , 493924, 1 )
	end
end
function Lua_bk_r_range3_102463_easy()--------------------光塔三
	local RoomID = ReadRoleValue( TargetID() , EM_RoleValue_RoomID )	
	local fire0 = ReadRoleValue(TargetID(),EM_RoleValue_PID)
	SetPlot( TargetID()  ,"touch", "" ,10 )
	if CheckBuff( OwnerID() ,504232) == true then
		AddBuff( fire0 , 504236, 1 , 15)
		CastSpellLV( OwnerID() , TargetID() , 493924, 1 )
	end
end
function Lua_bk_r_range4_102464_easy()--------------------光塔四
	local RoomID = ReadRoleValue( TargetID() , EM_RoleValue_RoomID )	
	local fire0 = ReadRoleValue(TargetID(),EM_RoleValue_PID)
	SetPlot( TargetID()  ,"touch", "" ,10 )
	if CheckBuff(OwnerID() , 504233) == true then
		AddBuff( fire0 , 504237, 1 , 15)
		CastSpellLV( OwnerID() , TargetID() , 493924, 1 )
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------第一階段馬階段---------------------------------------------------------------------------------------------------
function Lua_bk_r05_boss2_103197()--------------第一階段馬型狀態
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local boss2 = OwnerID()
	local TempPlayer = SetSearchAllPlayer(ReadRoleValue(OwnerID(),EM_RoleValue_RoomID))
	local ThesePlayer = {}
	local time1=0 --------------整個時間30秒
	local time2=0 --------------ㄧ般招式丟的時間8秒一次
	local time3=0
	local time4=0
	local mode1=504271
	local mode2=504272
	local skill={493907,493908,495349}-----1.踐踏 2.頭撞 3.全體擊倒
	local SkillLv = {0 , 0 , 0} 
	local skill1_Rand={}--------------第一階段招式
	local skill2_Rand={}--------------第三階段招式
	local play={}
	local m1count =  ReadRoleValue(boss2, EM_RoleValue_PID)
	local CombatBegin = 0 
	local boss3 = ReadRoleValue(boss2,EM_RoleValue_Register1)
		--for i=1, TempPlayer ,1 do--------------------------------------------------------------哈哈馬出來打人囉笨蛋全部的人給我進去仇恨列表吧寶貝   
		--	ThesePlayer[i]= GetSearchResult() -- 接暫存值
		--	SetAttack( boss2 , ThesePlayer[i]) -- 全部送進仇恨
		--end
		while true do
			sleep(10)
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
			local BossTarget = AttackTarget
			local Luck = Rand( 100 )
			if HateListCount( boss2 )  ~= 0 then-----------------------------------仇恨表裡面有人馬打人打啊 
				if CombatBegin == 0 then							---------------只有開場放一次
					CombatBegin = 1
					WriteRoleValue(m1count , EM_RoleValue_Register2,CombatBegin)
				end	
				if CheckBuff(OwnerID() , Mode1) == true then---第一階段判定
					time3=0
					time4=0
					time1 = time1 +1    -------------整段時間30秒
					time2 = time2 +1    -------------丟招式8秒一次
					
					if time2 >= 8 and time1<= 28 then
						if (Luck >= 0 and Luck < 25) or (Luck >= 50 and Luck < 75) then
							SkillIndex = 1
							BossTarget = AttackTarget
							CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )
						elseif (Luck >= 25 and Luck < 50) or (Luck >= 75 and Luck < 100) then	
							SkillIndex = 2
							BossTarget = AttackTarget
							CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )							
						end	
						time2=0
					end
					if time1 == 15 then 
						SkillIndex=3
						BossTarget = AttackTarget
						CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )
					end
				end
				if CheckBuff(OwnerID() , Mode2) == true then   ----當這是第二階段的時候	
					time1=0
					time2=0
					time3 = time3 +1    -------------整段時間30秒
					time4 = time4 +1    -------------丟招式8秒一次
					local BossTarget = AttackTarget
					if time4 >= 8 and time3<= 28 then
						if (Luck >= 0 and Luck < 25) or (Luck >= 50 and Luck < 75) then
							SkillIndex = 1
							BossTarget = AttackTarget
							CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )
						elseif (Luck >= 25 and Luck < 50) or (Luck >= 75 and Luck < 100) then	
							SkillIndex = 2
							BossTarget = AttackTarget
							CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )
						end	
						time4=0
					end
				end
			end
			if HateListCount( boss2 )  == 0 then----------------------------------仇恨表裡面沒人了!!!!!!!!!!大家都死光囉歐寶貝
				CombatBegin = 0
				WriteRoleValue( m1count, EM_RoleValue_Register2,0)
				time1 =0
				time2 =0
				time3 =0
				time4 =0
			end
		end	
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------		
function Lua_bk_r05_boss3_1_103196()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local boss3= OwnerID()
	local time1=0
	local time2=0
	local time3=0
	local time4=0
	local mode1=504271
	local mode2=504272
	local skill={495348,493906,493905,493909}------1.直線型傷害  2. 閃電  目標一個 3.扇形AE 4.馬兒招喚
	local SkillLv = {0 , 0 , 0 , 0 } 
	local skilltarget={}
	local skill1_Rand={}--------------第一階段招式
	local skill2_Rand={}--------------第二階段招式
	local TempPlayer = SetSearchAllPlayer(ReadRoleValue(OwnerID(),EM_RoleValue_RoomID))
	local ThesePlayer = {}
	local m1count =  ReadRoleValue(boss3, EM_RoleValue_PID)
	local boss2 = ReadRoleValue(boss3,EM_RoleValue_Register1)
	local CombatBegin = 0
	local Hate_rand={}
	local kp=0   ----------哪一個人
	local AttackTarget = 0	
	local BossTarget = 0
		AddBuff(boss3,504238,1,-1)
		while true do
			sleep(10)
			AttackTarget = ReadRoleValue( boss2 , EM_RoleValue_AttackTargetID )
			BossTarget = AttackTarget
			---AttackTarget = ReadRoleValue( boss2 , EM_RoleValue_AttackTargetID )
		---	BossTarget = AttackTarget
		---	local Luck = Rand( 100 )
			if HateListCount( boss2 )  ~= 0 then-----------------------------------仇恨表裡面有人,馬天使打人打啊 	
				---if CheckBuff(OwnerID() , Mode1) == true then---第一階段判定
				time3 = 0
				time4 = 0
				time1 = time1 +1    -------------整段時間30秒
				time2 = time2 +1    -------------丟招式8秒一次	
			----	say(boss3,Luck)
				if time2 >= 8 and  time1<= 28 then
					local Luck = Rand( 100 )
					----say(boss3,Luck)
					if (Luck >= 0 and Luck < 25) or (Luck >= 50 and Luck < 75) then
						SkillIndex = 1
						Hate_rand=star_HateListSort(boss2)
						kp=DW_Rand(table.getn(Hate_rand))
		
						if kp==0 or kp==1 then 
						end
						if kp~=0 and kp~=1 then 
						BossTarget = Hate_rand[kp]
						CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )
						sleep(20)
						
						CastSpellLv( boss3 , boss2 , 494164 , 0 )
						---SysCastSpellLv( boss3 , boss2 , 494164 , 0 )	
						end
					elseif (Luck >= 25 and Luck < 50) or (Luck >= 75 and Luck < 100) then	
						SkillIndex = 2
						Hate_rand=star_HateListSort(boss2)----------仇恨表去掉主坦
						for i=1 ,3 ,1 do 
							kp=DW_Rand(table.getn(Hate_rand))
							---say(boss3,"kp="..kp)
							if kp==0 or kp==1 then 
							end
							if kp~=0 and kp~=1 then 
							---say(boss3,"skill="..kp)
							BossTarget = Hate_rand[kp]
							SysCastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )	
							sleep(20)
							CastSpellLv( boss3 , boss2 , 494164 , 0 )
						---	SysCastSpellLv( boss3 , boss2 , 494164 , 0 )
							end
							table.remove (Hate_rand, kp)
							table.getn (Hate_rand)
						end
					end
					time2=0
				end
			end
		end
end
---------------------------------------------------------------------------------------------------第一階段人行階段---------------------------------------------------------------------------------------------------
function Lua_bk_r05_boss3_2_103196()--------------第一階段人行階段
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local boss3= OwnerID()
	local time1=0
	local time2=0
	local time3=0
	local time4=0
	local mode1=504271
	local mode2=504272
	local skill={495348,493906,493905,493909}------1.直線型傷害  2. 閃電  目標一個 3.扇形AE 4.馬兒招喚
	local SkillLv = {0 , 0 , 0 , 0 } 
	local skilltarget={}
	local skill1_Rand={}--------------第一階段招式
	local skill2_Rand={}--------------第二階段招式
	local TempPlayer = SetSearchAllPlayer(ReadRoleValue(OwnerID(),EM_RoleValue_RoomID))
	local ThesePlayer = {}
	local m1count =  ReadRoleValue(boss3, EM_RoleValue_PID)
	local boss2 = ReadRoleValue(boss3,EM_RoleValue_Register1)
	local CombatBegin = 0
	local Hate_rand={}
	local kp=0   ----------哪一個人
	local AttackTarget = 0	
	local BossTarget = 0
		AddBuff(boss3,504238,1,-1)
		while true do
			sleep(10)
			AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
			BossTarget = AttackTarget
			---local Luck = Rand( 100 )
			if HateListCount( boss2 )  ~= 0 then-----------------------------------仇恨表裡面有人,馬天使打人打啊 	
				if CheckBuff(OwnerID() , Mode2) == true then   ----當這是第二階段的時候	
					time1=0
					time2=0
					time3 = time3 +1    -------------整段時間30秒
					time4 = time4 +1    -------------丟招式8秒一次
					if time4 >= 8 and time3<= 28 then
						local Luck = Rand( 100 )
						if (Luck >= 0 and Luck < 25) or (Luck >= 50 and Luck < 75) then
							SkillIndex = 1
							Hate_rand=DW_HateRemain(1)----------仇恨表去掉主坦
							kp=DW_Rand(table.getn(Hate_rand))
							if kp==0 then 
							end
							if kp~=0 then 
							BossTarget = Hate_rand[kp]
							CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )
							end
						elseif (Luck >= 25 and Luck < 50) or (Luck >= 75 and Luck < 100) then	
							SkillIndex = 2
							Hate_rand=DW_HateRemain(1)----------仇恨表去掉主坦
							for i=1 ,3 ,1 do 
								kp=DW_Rand(table.getn(Hate_rand))
								if kp==0 then 
								end
								if kp~=0 then 
								BossTarget = Hate_rand[kp]
								SysCastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )	
								end
								table.remove (Hate_rand, kp)
								table.getn (Hate_rand)
							end					
						end	
						time4=0
					end
					if time3 == 15 then 
						SkillIndex=3
						BossTarget = AttackTarget	
						CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )
					end
					--if time4 == 30 then ----------------------------招喚馬兒
					--	SkillIndex=4
				--	CastSpellLV( OwnerID() , OwnerID() , Skill[SkillIndex] , SkillLv[SkillIndex] )
					--end
				end
			end
			if HateListCount( boss3 )  == 0 then----------------------------------仇恨表裡面沒人了!!!!!!!!!!大家都死光囉歐寶貝
				CombatBegin = 0
				WriteRoleValue( m1count, EM_RoleValue_Register3,0)
				time1 =0
				time2 =0
				time3 =0
				time4 =0
			end
		end	
end	
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------第二階段人型狀態----光天使模式---------------------------------------------------------------------------------------------------
function Lua_bk_r05_boss4_103199()--------------第二階段人型狀態----光天使模式
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local boss4 = OwnerID()---------我就是打不死的光天使!!!!!!!!!!!!!!!
	local TempPlayer = SetSearchAllPlayer(RoomID)
	local ThesePlayer = {}
	local skill={495348,493906,493905}------1.直線型傷害  2. 閃電  目標一個 3.扇形AE
	local SkillLv = {0 , 0 , 0 } 
	local time1=0
	local time2=0
	local time3=0
	local time4=0
	local skill_Rand={}--------------光天使招式
	local m2count=ReadRoleValue(boss4,EM_RoleValue_PID)--------讀取第二階段的控制器
	local PPL = SetSearchAllPlayer(RoomID)
	local playerchose={}
	local CombatBegin = 0
	local Hate_rand={}
	local kp=0   ----------哪一個人
	local buff1=0
	local BossTarget=0
		---for i=1, TempPlayer ,1 do--------------------------------------------------------------哈哈暗天使出來打人囉笨蛋全部的人給我進去仇恨列表吧寶貝   
		--	ThesePlayer[i]= GetSearchResult() -- 接暫存值
		--	---SetAttack( boss4 , ThesePlayer[i]) -- 全部送進仇恨
		--end		
		
		local PPL = SetSearchAllPlayer(RoomID)
		while true do
			sleep(10)
			----say(OwnerID(),"XXXX="..HateListCount)
			time1 = time1 +1    -------------整段時間30秒
			time2 = time2 +1    -------------丟招式8秒一次
			--Say(OwnerID(),time1)
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
			local Luck = Rand( 100 )
			if HateListCount( boss4 )  ~= 0 then-----------------------------------仇恨表裡面有人,光天使打人打啊 	
				if CombatBegin == 0 then							---------------只有開場放一次
					CombatBegin = 1
					WriteRoleValue(m2count , EM_RoleValue_Register1,CombatBegin)
					AddBuff(boss4,504238,1,-1)
				end
				if time1==3 then
					local PPL = SetSearchAllPlayer(RoomID)
					for i=1 ,PPL,1 	do
						playerchose[i]=GetSearchResult()
						---SetAttack( boss4 , ThesePlayer[i]) -- 全部送進仇恨
					end
					for i = 1 , PPL , 1 do 	
						local play=DW_Rand(table.getn(playerchose))
						if  ReadRoleValue(playerchose[play], EM_RoleValue_IsDead) == 0 and 
							ReadRoleValue(playerchose[play], EM_RoleValue_IsPlayer) == 1 and 
							ReadRoleValue(playerchose[play] , EM_RoleValue_VOC) ~= 0 and             --判斷是不是gm 
							playerchose[play]~= ReadRoleValue( boss4 , EM_RoleValue_AttackTargetID )  then   
							buff1=buff1+1
							if buff1 == 1 then 
								AddBuff( playerchose[play] , 504230 , 1 , 15 )
							elseif buff1 == 2 then 
								AddBuff( playerchose[play] , 504231 , 1 , 15 )
							elseif buff1 == 3 then 
								AddBuff( playerchose[play] , 504232 , 1 , 15 )
							elseif buff1 == 4 then 
								AddBuff( playerchose[play] , 504233 , 1 , 15 )
							end
						end
						table.remove (playerchose, play)
						table.getn (playerchose)
					end
				end
				if time1 ==22 then 
					time1=0
					buff1=0
				end					
				local BossTarget = AttackTarget	
				if time2 >= 4 and time1<= 28 then
					if (Luck >= 0 and Luck < 33) then
						SkillIndex = 1
						Hate_rand=DW_HateRemain(1)----------仇恨表去掉主坦
						kp=DW_Rand(table.getn(Hate_rand))
						if kp==0 then 
						end
						if kp~=0 then 
						BossTarget = Hate_rand[kp]
						CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )
						end
					elseif (Luck >= 33 and Luck < 66) then	
						SkillIndex = 2                                  -----------2. 閃電  ㄧ次電三個
						
						Hate_rand=DW_HateRemain(1)----------仇恨表去掉主坦
					---	for i=1 ,3 ,1 do 
							kp=DW_Rand(table.getn(Hate_rand))
							if kp==0 then 
							end
							if kp~=0 then 
							BossTarget = Hate_rand[kp]
							SysCastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )	
							end
					--		table.remove (Hate_rand, kp)
					--		table.getn (Hate_rand)
					---	end
					elseif (Luck >= 66 and Luck < 101) then
						SkillIndex = 3
						BossTarget = AttackTarget
						CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )	
					end	
					time2=0
				end
			elseif HateListCount( boss4 )  == 0 then----------------------------------仇恨表裡面沒人了!!!!!!!!!!大家都死光囉歐寶貝
			sleep(30)
				CombatBegin = 0
				WriteRoleValue( m2count, EM_RoleValue_Register1,CombatBegin)
				WriteRoleValue( m2count, EM_RoleValue_Register2,CombatBegin)
				time1 =0
				time2 =0
			end
		end	
	
end
---------------------------------------------------------------------------------------------------第二階段人型狀態---暗天使---------------------------------------------------------------------------------------------------
function Lua_bk_r05_boss5_103198()--------------第二階段人型狀態----暗天使模式	
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local boss5=OwnerID()
	local m2count=ReadRoleValue(boss5,EM_RoleValue_PID)--------讀取第二階段的控制器
	local TempPlayer = SetSearchAllPlayer(RoomID)
	local ThesePlayer = {}
	local skill={495348,493903,493905,495350}------1.直線型傷害(隨機) 2.車子穿刺  3.扇形AE  4.SP 技能
	local SkillLv = {0 , 0 , 0 , 0 }  ---技能等級
	local skill_Rand={}--------------暗天使招式
	local btime=0
	local CombatBegin = 0
	local time1=0
	local time2=0
	local Hate_rand={}
	local kp=0
	local bd=0
	local BossTarget=0
	---	for i=1, TempPlayer ,1 do--------------------------------------------------------------哈哈暗天使出來打人囉笨蛋全部的人給我進去仇恨列表吧寶貝   
	---		ThesePlayer[i]= GetSearchResult() -- 接暫存值
			---SetAttack( boss5 , ThesePlayer[i]) -- 全部送進仇恨
	--	end		
		while true	do 
			sleep(10)
			local Luck = Rand( 100 )
			if CombatBegin == 0 then							---------------只有開場放一次
				CombatBegin = 1
				WriteRoleValue(m2count , EM_RoleValue_Register2,CombatBegin)
			end	
			if HateListCount( boss5 )  ~= 0 then-----------------------------------仇恨表裡面有人,暗天使打人打啊 
				local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
					time1 = time1 +1    -------------整段時間30秒
					time2 = time2 +1    -------------丟招式8秒一次
					--say(boss5,"time1"..time1.."---".."time2"..time2)
				if time2 >= 4 and time1<= 28 then---------直線隨機打人
					if (Luck >= 0 and Luck < 33) then
						SkillIndex = 1
						Hate_rand=DW_HateRemain(1)----------仇恨表去掉主坦
						kp=DW_Rand(table.getn(Hate_rand))
						if kp==0 then 
						end
						if kp~=0 then 
						BossTarget = Hate_rand[kp]
						CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )
						end
					elseif (Luck >= 33 and Luck < 66)  then	---------車子穿刺攻擊
						SkillIndex = 2
						BossTarget = AttackTarget
												CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )	
					elseif (Luck >= 66 and Luck < 101) then        -------------扇形ae
						SkillIndex = 3
						BossTarget = AttackTarget
						CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )	
					end	
					time2=0
				end
				
				if time1 == 14 then            ---------------------sp技能
					SkillIndex=4
--					BossTarget = AttackTarget	
					ScriptMessage( boss5, -1 , 2 , "[SC_102444_09]" , 1 )-------齊歐菲！將讓你們永生難忘！死亡降臨！
					Say(boss5,"[SC_102444_09]")
					CastSpellLV( OwnerID() , boss5 , Skill[SkillIndex] , SkillLv[SkillIndex] )
				end
				if time1== 30 then 
				time1=0
				end
			end
			if HateListCount( boss5 )  == 0 then----------------------------------仇恨表裡面沒人了!!!!!!!!!!大家都死光囉歐寶貝
			sleep(30)
			    bd=ReadRoleValue( boss5, EM_RoleValue_Register9)
				if bd==0 then 
				CombatBegin = 0
				WriteRoleValue( m2count, EM_RoleValue_Register1,CombatBegin)
				WriteRoleValue( m2count, EM_RoleValue_Register2,CombatBegin)
				time1 =0
				time2 =0
				elseif bd ==1 then
				end
			end	
		end
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	
---------------------------------------------------------------------------------------------------馬死掉之後---------------------------------------------------------------------------------------------------
function Lua_bk_r05_horse_dead_103197()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local m1count = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local start = ReadRoleValue(m1count,EM_RoleValue_PID)
	local boss2=OwnerID()

	local boss3 = ReadRoleValue(boss2,EM_RoleValue_Register1)
	---DelObj(boss3)
	DelObj(boss2)
	Delobj(m1count)------------刪除第一階段所有的東西
	----ScriptMessage( TargetID(), -1 , 1 , "[SC_102295_01]" , 2 ) 不!馬名!你竟然殺了馬名!我會讓你受到神的制裁的!
	local m2count=CreateObjByFlag(103202,780427,3,1)
		SetModeEx( m2count , EM_SetModeType_Show, false) 
		SetModeEx( m2count , EM_SetModeType_Mark, false)
		SetModeEx( m2count , EM_SetModeType_Strikback, false) 
		SetModeEx( m2count , EM_SetModeType_Move, false) 
		SetModeEx( m2count , EM_SetModeType_Fight, false) 
		SetModeEx( m2count , EM_SetModeType_SearchenemyIgnore, false) 
		SetModeEx( m2count , EM_SetModeType_HideName, false) 
		SetModeEx( m2count , EM_SetModeType_HideMinimap, false) 
		SetModeEx( m2count , EM_SetModeType_Searchenemy, false)
		AddToPartition(m2count , RoomID )
		BeginPlot(m2count , "Lua_bk_r05_mode2_time_103202",0 )		
		WriteRoleValue( m2count, EM_RoleValue_PID,start)------- 
		WriteRoleValue( m2count, EM_RoleValue_Register3,boss3)---
		
end
function Lua_bk_r05_fire_check_103201()----------判斷身上是否得到狀態
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local fire0 = OwnerID()
	local m2count = ReadRoleValue(fire0,EM_RoleValue_PID)
	local black = 0
	while true do 
		sleep(10)
		if black==0 then 
			if CheckBuff( OwnerID() , 504234) == true and
			CheckBuff( OwnerID() , 504235) == true and
			CheckBuff( OwnerID() , 504236) == true and
			CheckBuff( OwnerID() , 504237) == true then
			WriteRoleValue( m2count, EM_RoleValue_Register9,1)----------------完成buff系統   可以開始呼叫黑天使	
			ScriptMessage( OwnerID(), -1 , 2 , "[SC_102444_06]" , 2 )----邪惡能量充斥著這裡。
			sleep(10)
			black=1
			end
		end
		if black ==1 then 
			sleep(300)
			CancelBuff( fire0 ,504234 )
			WriteRoleValue( m2count, EM_RoleValue_Register9,0)
			black=0
		end
	end
end
function Lua_bk_r05_door_103200()-------------------------把刪除去殺掉
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local boss5 = OwnerID()
	local door = ReadRoleValue(boss5,EM_RoleValue_Register1)
	local m2count = ReadRoleValue(boss5,EM_RoleValue_PID)---------------------讀取m2
	local start = ReadRoleValue(m2count,EM_RoleValue_PID)---------------------讀取值start
	local fire0 = ReadRoleValue(m2count,EM_RoleValue_Register4)
	DelObj(fire0)
	DelObj(m2count)
	DelObj(start)
	WriteRoleValue( boss5, EM_RoleValue_Register9,1)
	ScriptMessage( TargetID(), -1 , 1 , "[SC_102444_08]" , 2 ) -----不！我怎會敗在你們手上！不～～～
	PlayMotionEX( door ,  ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP  )
	SetModeEX( door , EM_SetModeType_Obstruct , false )
	Hide( door )
	Show( door , RoomID )
end