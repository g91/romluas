function cl_21_105464AI() ---中控器
	local AI = OwnerID() ----AI=控制器
	local RoomID = ReadRoleValue( AI , EM_RoleValue_RoomID ) ----控制器讀取地圖
	local Xin_Te = CreateObjByFlag( 105452 , 780975 , 0 , 1 ) ------------boss產生位置
	SetModeEx( Xin_Te , EM_SetModeType_Strikback, false) ---反擊(否)
	SetModeEx( Xin_Te , EM_SetModeType_Move, false) ---移動	(否)
	AddToPartition ( Xin_Te , RoomID ) ----物件加入場景,例行公事
	WriteRoleValue ( Xin_Te , EM_RoleValue_PID , AI )--BOSS PID紀錄控制器名稱
	BeginPlot( Xin_Te,"cl_21_Xin_Te_Performance", 0 )---執行戰鬥劇情
	WriteRoleValue ( AI , EM_RoleValue_Register2 , 0 )--BOSS PID紀錄控制器名稱
	local door = CreateObjByFlag( 105386 , 780912 , 0 , 1 ) ------------產生後門
	SetModeEx ( door , EM_SetModeType_Obstruct, true) 		---阻擋(是)
	SetModeEx( door , EM_SetModeType_Strikback, false) ---反擊(否)
	SetModeEx( door , EM_SetModeType_Move, false) ---移動	(否)
	SetModeEx( door , EM_SetModeType_Searchenemy, false)--索敵(否)
	SetModeEx( door , EM_SetModeType_Mark, false)			---可點選(是)
	SetModeEx( door , EM_SetModeType_ShowRoleHead, false) 		---頭像框(是)
	SetModeEx( door , EM_SetModeType_Fight, false) ---可砍殺(是)
	SetModeEx( door , EM_SetModeType_NotShowHPMP , false) ----不顯示寫條
	AddToPartition ( door,RoomID ) ----物件加入場景,例行公事
	while 1 do---迴圈檢查戰鬥狀態
		sleep ( 10 )
		local stage = ReadRoleValue ( AI , EM_RoleValue_Register1 )  ----stage=1 戰鬥開始 stage=2 BOSS死亡 stage=3 BOSS離開戰鬥重置
		if stage == 1 then
		elseif stage == 2 then---BOSS死亡狀態
		elseif stage == 3 then---BOSS離開戰鬥狀態
			delobj ( Xin_Te )
			sleep ( 50 )
			Xin_Te = CreateObjByFlag( 105452 , 780912 , 1 , 1 ) ------------誰是boss要在哪裡產生
			AddToPartition ( Xin_Te , RoomID ) ----物件加入場景,例行公事
			WriteRoleValue ( Xin_Te , EM_RoleValue_PID , AI )
			BeginPlot( Xin_Te,"cl_21_Xin_Te_Performance", 0 )
			WriteRoleValue ( AI , EM_RoleValue_Register1 , 0 )
		end
	end
end
function cl_21_Xin_Te_Performance()  ---BOSS的開場表演
	local Xin_Te = OwnerID() ----我叫做AI
	local RoomID = ReadRoleValue( Xin_Te , EM_RoleValue_RoomID ) ----控制器讀取地圖
	local AI = ReadRoleValue ( Xin_Te , EM_RoleValue_PID )
	local CombatBegin = 0
	while 1 do
		sleep ( 10 )
		local AttackTarget = ReadRoleValue( Xin_Te , EM_RoleValue_AttackTargetID )-----AttackTarget=當前攻擊目標
		if HateListCount( Xin_Te ) ~= 0 then ---如果王的仇恨表內有人就繼續戰鬥
			if CombatBegin == 0 then   -----如果王的仇恨表內有人~就將這個值改變
				local Performance = ReadRoleValue ( AI , EM_RoleValue_Register2 ) ---讀取是否已經跑過表演
				if Performance == 0 then
					local PPL = SetSearchAllPlayer(RoomID )
					for i = 1 , PPL , 1 do ---把玩家抓入房間用 
						local ID = GetSearchResult()
						if ReadRoleValue( ID , EM_RoleValue_IsDead ) ~= 1 and 
							ReadRoleValue( ID, EM_RoleValue_VOC) ~= 0  and 
							ReadRoleValue( ID , EM_RoleValue_RoomID  ) == RoomID then
						end
					end
					for i = 1 , 6 , 1 do
						say ( Xin_Te , "i="..i)
						SetPosByFlag( Xin_Te , 780975 , Flag )
						Flag = Flag + 1
						sleep ( 10 )
						if i == 6 then
							SetModeEx( Xin_Te , EM_SetModeType_Strikback, true) ---反擊(否)
							SetModeEx( Xin_Te , EM_SetModeType_Move, true) ---移動	(否)
						end
					end	
					WriteRoleValue ( AI , EM_RoleValue_Register2 , 1 )
				end
				CombatBegin = 1
				WriteRoleValue ( AI , EM_RoleValue_Register1 , 1 )	
			end
			if CombatBegin == 1 then
				
			end
		elseif HateListCount ( Xin_Te ) == 0 then ---如果王的仇恨表內沒有人就要傳回給中控器
			if CombatBegin == 1 then  ----如果王仇恨表內沒有人了~就將這個值改變
				CombatBegin = 0
				WriteRoleValue ( AI , EM_RoleValue_Register1 , 3 )
			end
		end
	end
end
function cl_21_Performance()
	local Xin_Te = OwnerID() ----我叫做AI
	say ( Xin_Te , "1111")
	local RoomID = ReadRoleValue( Xin_Te , EM_RoleValue_RoomID ) ----控制器讀取地圖
	local AI = ReadRoleValue ( Xin_Te , EM_RoleValue_PID )
	local Flag = 1
end
function cl_attackbuff()
	local Xin_Te = OwnerID()
	local AttackTarget = ReadRoleValue( Xin_Te , EM_RoleValue_AttackTargetID )-----AttackTarget=當前攻擊目標
	local buff_table = {509336,509337,509338}
	local buff_No = 0
	buff_No = DW_Rand (100)
	if ( buff_No >= 1 and buff_No <= 10) or
		( buff_No >= 41 and buff_No <= 50 ) or
		( buff_No >= 81 and buff_No <= 90 ) or
		( buff_No >= 91 and buff_No <= 100 ) then
		return
	elseif ( buff_No >= 11 and buff_No <= 20 ) or
		( buff_No>= 51 and buff_No <= 60 ) then
		addbuff ( AttackTarget , 509336 , 0 , 120 )
	elseif ( buff_No >=21 and buff_No <= 30 ) or 
		( buff_No >= 61 and buff_No <= 70 ) then
		addbuff ( AttackTarget , 509337 , 0 , 120 )
	elseif ( buff_No >= 31 and buff_No <= 40 ) or 
		( buff_No >= 71 and buff_No <= 80 ) then
		addbuff ( AttackTarget , 509338 , 0 , 120 )
	end
end