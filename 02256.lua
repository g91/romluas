--[[進入戰鬥：
(中央黃字)
[105384]的禁錮法術被打斷，壓制[105382]的力量減弱了！
離開戰鬥：
(實驗體的看守者白頻說話)
所有試圖打斷禁錮儀式者，都將後悔莫及！
範圍劇情：
你看到前面有個詭異的生物被禁錮在法術之中，周圍有四個身影正在施展法術，看來施展禁錮法術的就是他們......]]--
function cl_374ai_script() ----控制器的SCRIPT
	local AI = OwnerID() ----我叫做AI
	local RoomID = ReadRoleValue( AI , EM_RoleValue_RoomID ) ----紀錄讀取到的層數
	local research_number = 0
	local research_table = {}
	local door_open = 0
	local ThesePlayer = {}
	local attackflag = 0
	local No_374_ON = 0
	local open_door1 = 0
	local open_door2 = 0
	local cl0se_door1 = 0
	local hide_door_2 = 0
	local ScriptMessage_1 = 0
	local ScriptMessage_2 = 0
	local carzy_time = 0
	local No_374 = CreateObjByFlag( 105382 , 780889 , 0 , 1 ) ------------誰是boss要在哪裡產生
	SetModeEx ( No_374 , EM_SetModeType_Obstruct, false) 		---阻擋(是) -----這裡要改寫BOSS身上的狀態~一開始有表演所以不讓玩家攻擊
	SetModeEx( No_374 , EM_SetModeType_Move, false) ---移動	(否)
	SetModeEx( No_374 , EM_SetModeType_Searchenemy, false)--索敵(否)
	SetModeEx( No_374 , EM_SetModeType_Fight, false) ---可砍殺(是)
	AddToPartition ( No_374 , RoomID ) ----物件加入場景,例行公事
	WriteRoleValue ( No_374 , EM_RoleValue_PID , AI ) ---
	BeginPlot( No_374,"cl_136_No_374fight", 0 ) ---塞入BOSS的戰鬥給他
	addbuff ( No_374 , 509063 , 0 , -1 ) ----給BOSS一個假的表演BUFF(光罩)
	for i = 1 , 4 , 1 do  ----四個表演用研究員
		local research = CreateObjByFlag( 105384 , 780889 , i+4 , 1 ) ------------for迴圈產生四個研究員
		SetModeEx ( research , EM_SetModeType_Obstruct, false) 		---阻擋(是)
		SetModeEx( research, EM_SetModeType_Strikback, true) ---反擊(否)
		SetModeEx( research , EM_SetModeType_Move, true) ---移動	(否)
		SetModeEx( research , EM_SetModeType_Searchenemy, true)--索敵(否)
		SetModeEx( research , EM_SetModeType_Mark, true)			---可點選(是)
		SetModeEx( research , EM_SetModeType_ShowRoleHead, true) 		---頭像框(是)
		SetModeEx( research , EM_SetModeType_Fight, true ) ---可砍殺(是)
		AddToPartition ( research , RoomID ) ----物件加入場景,例行公事
		WriteRoleValue ( research , EM_RoleValue_PID , AI )
		WriteRoleValue ( research , EM_RoleValue_Register1 , No_374 )
		BeginPlot( research,"cl_136_research", 0 ) -----表演固定動作用劇情
		table.insert ( research_table , research ) ----丟到table裡面待會要刪除掉的
		sleep ( 1 )
	end
	local door = CreateObjByFlag( 105664 , 780889 , 9 , 1 ) ------------產生後門
	SetModeEx ( door , EM_SetModeType_Obstruct, true) 		---阻擋(是)
	SetModeEx( door , EM_SetModeType_Strikback, false) ---反擊(否)
	SetModeEx( door , EM_SetModeType_Move, false) ---移動	(否)
	SetModeEx( door , EM_SetModeType_Searchenemy, false)--索敵(否)
	SetModeEx( door , EM_SetModeType_Mark, false)			---可點選(是)
	SetModeEx( door , EM_SetModeType_ShowRoleHead, false) 		---頭像框(是)
	SetModeEx( door , EM_SetModeType_Fight, false) ---可砍殺(是)
	SetModeEx( door , EM_SetModeType_NotShowHPMP , false) ----不顯示寫條
	AddToPartition ( door,RoomID ) ----物件加入場景,例行公事
	SetIdleMotion( door ,ruFUSION_MIME_IDLE_STAND)----------------------維持動作
	local door1 = CreateObjByFlag( 105386 , 780889 , 10 , 1 ) ------------產生後門
	SetModeEx ( door1 , EM_SetModeType_Obstruct, false) 		---阻擋(是)
	SetModeEx( door1 , EM_SetModeType_Strikback, false) ---反擊(否)
	SetModeEx( door1 , EM_SetModeType_Move, false) ---移動	(否)
	SetModeEx( door1 , EM_SetModeType_Searchenemy, false)--索敵(否)
	SetModeEx( door1 , EM_SetModeType_Mark, false)			---可點選(是)
	SetModeEx( door1 , EM_SetModeType_ShowRoleHead, false) 		---頭像框(是)
	SetModeEx( door1 , EM_SetModeType_Fight, false) ---可砍殺(是)
	SetModeEx( door1 , EM_SetModeType_NotShowHPMP , false) ----不顯示寫條
	AddToPartition ( door1,RoomID ) ----物件加入場景,例行公事
	SetIdleMotion( door1 ,ruFUSION_ACTORSTATE_ACTIVATE_LOOP	)
	local door2 = CreateObjByFlag( 105664 , 780889 , 11 , 1 ) ------------產生後門
	SetModeEx ( door2 , EM_SetModeType_Obstruct, false) 		---阻擋(是)
	SetModeEx( door2 , EM_SetModeType_Strikback, false) ---反擊(否)
	SetModeEx( door2 , EM_SetModeType_Move, false) ---移動	(否)
	SetModeEx( door2 , EM_SetModeType_Searchenemy, false)--索敵(否)
	SetModeEx( door2 , EM_SetModeType_Mark, false)			---可點選(是)
	SetModeEx( door2 , EM_SetModeType_ShowRoleHead, false) 		---頭像框(是)
	SetModeEx( door2 , EM_SetModeType_Fight, false) ---可砍殺(是)
	SetModeEx( door2 , EM_SetModeType_NotShowHPMP , false) ----不顯示寫條
	AddToPartition ( door2,RoomID ) ----物件加入場景,例行公事
	SetIdleMotion( door2 ,ruFUSION_ACTORSTATE_ACTIVATE_LOOP	)
	local CrystalAI = CreateObjByFlag( 105383 , 780889 , 0 , 1 ) ------------水晶的主要控制器
	SetModeEx ( CrystalAI , EM_SetModeType_Obstruct, false) 		---阻擋(是)
	SetModeEx( CrystalAI, EM_SetModeType_Strikback, false) ---反擊(否)
	SetModeEx( CrystalAI, EM_SetModeType_Move, false) ---移動	(否)
	SetModeEx( CrystalAI , EM_SetModeType_Searchenemy, false)--索敵(否)
	SetModeEx( CrystalAI , EM_SetModeType_Mark, false)			---可點選(是)
	SetModeEx( CrystalAI , EM_SetModeType_ShowRoleHead, false) 		---頭像框(是)
	SetModeEx( CrystalAI , EM_SetModeType_Fight, false) ---可砍殺(是)
	SetModeEx( CrystalAI , EM_SetModeType_NotShowHPMP , false) ----不顯示寫條
	AddToPartition ( CrystalAI , RoomID ) ----物件加入場景,例行公事
	WriteRoleValue ( CrystalAI , EM_RoleValue_PID , AI )
	WriteRoleValue ( CrystalAI , EM_RoleValue_Register2 , No_374 )
	BeginPlot( CrystalAI,"cl_No_374_Crystalfight", 0 )
	local hide_door = CreateObjByFlag( 103126 , 780889 , 13 , 1 ) ------------產生後門
	SetModeEx ( hide_door , EM_SetModeType_Obstruct, true) 		---阻擋(是)
	SetModeEx( hide_door , EM_SetModeType_Strikback, false) ---反擊(否)
	SetModeEx( hide_door , EM_SetModeType_Move, false) ---移動	(否)
	SetModeEx( hide_door , EM_SetModeType_Searchenemy, false)--索敵(否)
	SetModeEx( hide_door , EM_SetModeType_Mark, false)			---可點選(是)
	SetModeEx( hide_door , EM_SetModeType_ShowRoleHead, false) 		---頭像框(是)
	SetModeEx( hide_door , EM_SetModeType_Fight, false) ---可砍殺(是)
	SetModeEx( hide_door , EM_SetModeType_NotShowHPMP , false) ----不顯示寫條  
	SetModeEx( hide_door , EM_SetModeType_Show , false) ----秀出
	AddToPartition ( hide_door,RoomID ) ----物件加入場景,例行公事
	while 1 do
		sleep ( 10 )
		if No_374_ON == 0 then
			local attack_open = ReadRoleValue ( AI , EM_RoleValue_Register2 )  ----讀取研究言是否進入戰鬥,由研究員傳回值來
			if attack_open >= 1 then
				if open_door1 == 0 then
					ScriptMessage( No_374 , -1 , 2 ,"[SC_NO374_12]" , 2 )----實驗體374號的禁錮光環開始產生裂隙...
					SetIdleMotion( door1 ,ruFUSION_ACTORSTATE_ACTIVATE_END	)----------------------維持動作
					SetModeEx (door1 , EM_SetModeType_Obstruct, true) 		---阻擋(是)
					sleep ( 10 )
					SetIdleMotion( door1 ,ruFUSION_MIME_IDLE_STAND	)----------------------維持動作
					cl0se_door1 = 1
					open_door1 = 1
				end
			elseif attack_open == 0 then
				if open_door1 == 1 then
					SetIdleMotion( door1 ,ruFUSION_ACTORSTATE_ACTIVATE_BEGIN	)----------------------維持動作
					SetModeEx (door1 , EM_SetModeType_Obstruct, false) 		---阻擋(是)
					sleep ( 10 )
					SetIdleMotion( door1 ,ruFUSION_ACTORSTATE_ACTIVATE_LOOP	)----------------------維持動作
					cl0se_door1 = 0
					open_door1 = 0
				end
			end
			if attack_open >= 4 then ----當研究員超過四個都在進入戰鬥
				attackflag = attackflag + 1 ----就開始讀秒
				if ScriptMessage_2 == 0 then
					ScriptMessage( No_374 , -1 , 2 ,"[SC_NO374_08]" , 2 )----禁錮符文水晶的能量開始減少...
					ScriptMessage_2 = 1
				end
				if ScriptMessage_1 == 0 then
					if attackflag >= 5 then
						ScriptMessage( No_374 , -1 , 2 ,"[SC_NO374_09]" , 2 )----實驗體374號的禁錮光環開始產生裂隙...
						ScriptMessage_1 = 1
					end
				end
				if attackflag >= 10 then
					ScriptMessage( No_374 , -1 , 2 ,"[SC_NO374_10]" , 2 )----糟了...實驗體[374號]掙脫了禁錮光環!
					SetModeEx( No_374 , EM_SetModeType_Searchenemy, true)--打開BOSS索敵(否)
					No_374_ON = 1
				end
			elseif attack_open < 4 then  ----如果有其中一個研究員離開戰鬥,或者死亡,研究員會傳回-1的值
				if attackflag >= 1 then  ----將秒數歸0
					attackflag = 0
					if ScriptMessage_1 == 1 then
						ScriptMessage( No_374 , -1 , 2 ,"[SC_NO374_11]" , 2 )----禁錮符文水晶的能量暫時獲得補充
						ScriptMessage_1 = 0
						ScriptMessage_2 = 1
					end
				end
			end
		end
		local stage = ReadRoleValue ( AI , EM_RoleValue_Register1 )  ----stage=1 戰鬥開始 stage=2 BOSS死亡 stage=3 BOSS離開戰鬥重置
		if stage == 1 then
			carzy_time = carzy_time + 1
			if carzy_time >= 480 then
				Addbuff ( No_374 , 620042 , 0 ,-1 ) ---
				carzy_time = 0
			end
			if cl0se_door1 == 1 then
				if open_door1 == 1 then
					SetIdleMotion( door1 ,ruFUSION_ACTORSTATE_ACTIVATE_END	)----------------------維持動作
					SetModeEx (door1 , EM_SetModeType_Obstruct, true) 		---阻擋(是)
					hide_door_2 = CreateObjByFlag( 103126 , 780889 , 12 , 1 ) ------------產生後門
					SetModeEx ( hide_door_2 , EM_SetModeType_Obstruct, true) 		---阻擋(是)
					SetModeEx( hide_door_2 , EM_SetModeType_Strikback, false) ---反擊(否)
					SetModeEx( hide_door_2 , EM_SetModeType_Move, false) ---移動	(否)
					SetModeEx( hide_door_2 , EM_SetModeType_Searchenemy, false)--索敵(否)
					SetModeEx( hide_door_2 , EM_SetModeType_Mark, false)			---可點選(是)
					SetModeEx( hide_door_2 , EM_SetModeType_ShowRoleHead, false) 		---頭像框(是)
					SetModeEx( hide_door_2 , EM_SetModeType_Fight, false) ---可砍殺(是)
					SetModeEx( hide_door_2 , EM_SetModeType_NotShowHPMP , false) ----不顯示寫條  
					SetModeEx( hide_door_2 , EM_SetModeType_Show , false) ----秀出
					AddToPartition ( hide_door_2,RoomID ) ----物件加入場景,例行公事
					sleep ( 10 )
					SetIdleMotion( door1 ,ruFUSION_MIME_IDLE_STAND	)----------------------維持動作
					open_door1 = 0
				end
				cl0se_door1 = 0
			end
			if open_door2 == 0 then
				SetIdleMotion( door2 ,ruFUSION_ACTORSTATE_ACTIVATE_END	)----------------------維持動作
				SetModeEx ( door2 , EM_SetModeType_Obstruct, true) 		---阻擋(是)
				sleep ( 10 )
				SetIdleMotion( door2 , ruFUSION_MIME_IDLE_STAND)
				open_door2 = 1
			end
			if HateListCount( No_374 ) == 0 then
				WriteRoleValue ( AI , EM_RoleValue_Register1 , 3 )
			end
		elseif stage == 2 then
			--if door_open == 0 then
				SetIdleMotion( door ,ruFUSION_ACTORSTATE_ACTIVATE_BEGIN	)----------------------維持動作
				SetModeEx (door , EM_SetModeType_Obstruct, false) 		---阻擋(是)
				sleep ( 15 )
				SetIdleMotion( door ,  ruFUSION_ACTORSTATE_ACTIVATE_LOOP)
				door_open = 2
			--end
			--if open_door1 == 0 then
				SetIdleMotion( door1 ,ruFUSION_ACTORSTATE_ACTIVATE_BEGIN	)----------------------維持動作
				SetModeEx (door1 , EM_SetModeType_Obstruct, false) 		---阻擋(是)
				delobj ( hide_door )
				sleep ( 10 )
				SetIdleMotion( door1 ,ruFUSION_ACTORSTATE_ACTIVATE_LOOP	)----------------------維持動作
				open_door1 = 1
			--end
			--if open_door2 == 1 then
				SetIdleMotion( door2 ,ruFUSION_ACTORSTATE_ACTIVATE_BEGIN	)----------------------維持動作
				delobj ( hide_door_2 )
				SetModeEx ( door2 , EM_SetModeType_Obstruct, false) 		---阻擋(是)
				sleep ( 10 )
				SetIdleMotion( door2 , ruFUSION_ACTORSTATE_ACTIVATE_LOOP)
				open_door2 = 0
			--end
			local TempPlayer = SetSearchAllPlayer(RoomID)----找區域所有玩家
			for i=1,TempPlayer do ---TempPlayer等於數量代表for迴圈要做幾次
				ThesePlayer[i] = GetSearchResult() --將找到的玩家GID暫時存到這個值內
				if CheckID( ThesePlayer[i] )  == true and  ---檢查GID
					ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) ==  0 and 
					ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) ==  1 then--檢查玩家是不是還在；檢查是否死亡
					if CheckBuff( ThesePlayer[i] , 509148 ) == true then
						CancelBuff(ThesePlayer[i], 509148 )
					end
				end
			end
			carzy_time = 0
			WriteRoleValue ( AI , EM_RoleValue_Register1 , 0 )
		elseif stage == 3 then
			delobj ( No_374 )
			carzy_time = 0
			if open_door1 == 0 then
				SetIdleMotion( door1 ,ruFUSION_ACTORSTATE_ACTIVATE_BEGIN	)----------------------維持動作
				SetModeEx (door1 , EM_SetModeType_Obstruct, false) 		---阻擋(是)
				sleep ( 10 )
				SetIdleMotion( door1 ,ruFUSION_ACTORSTATE_ACTIVATE_LOOP	)----------------------維持動作
				open_door1 = 1
			end
			if open_door2 == 1 then
				SetIdleMotion( door2 ,ruFUSION_ACTORSTATE_ACTIVATE_BEGIN	)----------------------維持動作
				delobj ( hide_door_2 )
				SetModeEx ( door2 , EM_SetModeType_Obstruct, false) 		---阻擋(是)
				sleep ( 10 )
				SetIdleMotion( door2 , ruFUSION_ACTORSTATE_ACTIVATE_LOOP)
				cl0se_door1 = 1
				open_door2 = 0
			end
			local TempPlayer = SetSearchAllPlayer(RoomID)----找區域所有玩家
			for i=1,TempPlayer do ---TempPlayer等於數量代表for迴圈要做幾次
				ThesePlayer[i] = GetSearchResult() --將找到的玩家GID暫時存到這個值內
				if CheckID( ThesePlayer[i] )  == true and  ---檢查GID
					ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) ==  0 and 
					ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) ==  1 then--檢查玩家是不是還在；檢查是否死亡
					if CheckBuff( ThesePlayer[i] , 509148 ) == true then
						CancelBuff(ThesePlayer[i], 509148 )
					end
				end
			end
			delobj ( CrystalAI )
			research_number = table.getn(research_table)
			for i = 1 , research_number , 1 do
				if CheckID(research_table[research_number]) == true then
					delobj ( research_table[research_number] )
				end
			end
			sleep ( 50 )
			CrystalAI = CreateObjByFlag( 105383 , 780889 , 0 , 1 ) ------------for迴圈產生四次水晶
			SetModeEx ( CrystalAI , EM_SetModeType_Obstruct, false) 		---阻擋(是)
			SetModeEx( CrystalAI, EM_SetModeType_Strikback, false) ---反擊(否)
			SetModeEx( CrystalAI, EM_SetModeType_Move, false) ---移動	(否)
			SetModeEx( CrystalAI , EM_SetModeType_Searchenemy, false)--索敵(否)
			SetModeEx( CrystalAI , EM_SetModeType_Mark, false)			---可點選(是)
			SetModeEx( CrystalAI , EM_SetModeType_ShowRoleHead, false) 		---頭像框(是)
			SetModeEx( CrystalAI , EM_SetModeType_Fight, false) ---可砍殺(是)
			SetModeEx( CrystalAI , EM_SetModeType_NotShowHPMP , false) ----不顯示寫條
			AddToPartition ( CrystalAI , RoomID ) ----物件加入場景,例行公事
			WriteRoleValue ( CrystalAI , EM_RoleValue_PID , AI )
			BeginPlot( CrystalAI,"cl_No_374_Crystalfight", 0 )
			No_374 = CreateObjByFlag( 105382 , 780889 , 0 , 1 ) ------------誰是boss要在哪裡產生
			AddToPartition ( No_374 , RoomID ) ----物件加入場景,例行公事
			WriteRoleValue ( No_374 , EM_RoleValue_PID , AI )
			BeginPlot( No_374,"cl_136_No_374fight", 0 )
			WriteRoleValue ( CrystalAI , EM_RoleValue_Register2 , No_374 )
			WriteRoleValue ( AI , EM_RoleValue_Register1 , 0 )
		end
	end
end
function cl_136_research()
	local research = OwnerID()
	local RoomID = ReadRoleValue( research , EM_RoleValue_RoomID ) ----這是AI讀取到的地圖
	local AI = ReadRoleValue ( research , EM_RoleValue_PID )
	local No_374 = ReadRoleValue ( research , EM_RoleValue_Register1 )
	local CombatBegin = 0
	local attackflag = 0
	local attack_num = 0
	local attack_open = ReadRoleValue ( AI , EM_RoleValue_Register2 )
	local attack_fight = ReadRoleValue ( research , EM_RoleValue_Register3 )
	SetPlot( research, "dead","cl_136_research_dead", 0 ) ------PlotType 觸發類型 (分為"touch"觸碰、"range"範圍、"dead"死亡、"collision"碰撞四種)
	--addbuff ( research , 620147 , 0 , -1 )
	addbuff ( research , 509064 , 0 , -1 )
	callPlot( research,"LuaP_Casting", 0 )
	while 1 do
		sleep ( 10 )
		local AttackTarget = ReadRoleValue( research , EM_RoleValue_AttackTargetID )-----AttackTarget=當前攻擊目標
		if HateListCount( research ) ~= 0 then ---如果王的仇恨表內有人就繼續戰鬥
			if CombatBegin == 0 then   -----如果王的仇恨表內有人~就將這個值改變			
				CancelBuff( research, 509064 )
				say ( research , "[SC_NO374_15]")
				CombatBegin = 1
			end
			if CombatBegin == 1 then
				if attack_num == 0 then
					WriteRoleValue ( research , EM_RoleValue_Register3 , 1 )
					attack_open = ReadRoleValue ( AI , EM_RoleValue_Register2 )
					WriteRoleValue ( AI , EM_RoleValue_Register2 , attack_open+1 )
					attack_num = 1
				end
			end
		elseif HateListCount ( research ) == 0 then ---如果王的仇恨表內沒有人就要傳回給中控器
			if CombatBegin == 1 then  ----如果王仇恨表內沒有人了~就將這個值改變
				say ( research , "[SC_NO374_13]")
				--addbuff ( research , 620147 , 0 , -1 )
				addbuff ( research , 509064 , 0 , -1 )
				callPlot( research,"LuaP_Casting", 0 )
				attack_open = ReadRoleValue ( AI , EM_RoleValue_Register2 )
				WriteRoleValue ( AI , EM_RoleValue_Register2 , attack_open-1 )
				WriteRoleValue ( research , EM_RoleValue_Register3 , 0 )
				attack_num = 0
				CombatBegin = 0
			end
		end
	end
end
function cl_136_research_dead()
	local research = OwnerID()
	local RoomID = ReadRoleValue( research , EM_RoleValue_RoomID ) ----這是AI讀取到的地圖
	local AI = ReadRoleValue ( research , EM_RoleValue_PID )
	local No_374 = ReadRoleValue ( research , EM_RoleValue_Register1 )
	local attack_fight = ReadRoleValue ( research , EM_RoleValue_Register3 )
	local attack_open = ReadRoleValue ( AI , EM_RoleValue_Register2 )
	if attack_fight ~= 1 then
		attack_open = ReadRoleValue ( AI , EM_RoleValue_Register2 )
		WriteRoleValue ( AI , EM_RoleValue_Register2 , attack_open+1 )
	end
end
function cl_kill_105384() ----開場前AE判斷是不是打到實驗看守員~不是的話就不會產生傷害
	if ReadRoleValue ( TargetID() , EM_RoleValue_OrgID ) == 105384 or
		ReadRoleValue ( TargetID() , EM_RoleValue_OrgID ) == 105865 then
		return true
	elseif ReadRoleValue ( TargetID() , EM_RoleValue_OrgID ) ~= 105384 or
		ReadRoleValue ( TargetID() , EM_RoleValue_OrgID ) ~= 105865 then
		return false
	end
end
function cl_136_No_374fight() ---BOSS放招式的function
	local No_374 = OwnerID()
	local RoomID = ReadRoleValue( No_374 , EM_RoleValue_RoomID ) ----這是AI讀取到的地圖
	local AI = ReadRoleValue ( No_374 , EM_RoleValue_PID )
	local skill = 8  ---497261
	local Crystal_time = 0 ---生水晶的值
	local hptime = 0
	local CombatBegin = 0
	local rand_buff = 0
	local rand_skill = 0
	local buff_time = 29
	local buff_table = { 497263 , 497264 , 497265 }
	local skill_table = {}
	local numder_table = { 1 , 2 , 3 }
	local numder = 0
	local fire_Table = {}
	local fire_number = 0
	local skill_7 =  0  ----龍爪&掃尾兩招隨機一招出
	local skill_13 = 0  ---冰晶吐息&冰凍玩家
	local skill_23 = 0 ---飛上天吐出大光束追玩家
	local fire_rand = 0
	local test_Table = {}
	local test = 0
	local runTarget = 0
	PlayMotion ( No_374,ruFUSION_ACTORSTATE_SLEEP_BEGIN	 )---------------第1ㄍ動作
	SetIdleMotion( No_374 ,ruFUSION_ACTORSTATE_SLEEP_LOOP	)----------------------維持動作
	SetPlot( No_374, "dead","cl_No_374_dead", 0 ) ------PlotType 觸發類型 (分為"touch"觸碰、"range"範圍、"dead"死亡、"collision"碰撞四種)
	while 1 do
		sleep ( 10 )
		local AttackTarget = ReadRoleValue( No_374 , EM_RoleValue_AttackTargetID )-----AttackTarget=當前攻擊目標
		if HateListCount( No_374 ) ~= 0 then ---如果王的仇恨表內有人就繼續戰鬥
			if CombatBegin == 0 then   -----如果王的仇恨表內有人~就將這個值改變
				WriteRoleValue ( AI , EM_RoleValue_Register1 , 1 )
				PlayMotion ( No_374, ruFUSION_ACTORSTATE_SLEEP_END )---------------------結束動作
				sleep ( 20 )
				SetIdleMotion( No_374 ,  ruFUSION_ACTORSTATE_NORMAL)--------保持地下模式
				sleep ( 10 )
				CancelBuff_NoEvent( No_374 , 509063 ) ---清除BUFF
				CastSpelllv ( No_374 , No_374 , 497258 , 0 )
				ScriptMessage( No_374 , -1 , 2 ,"[SC_NO374_01]" , 2 )----SeashnaPoiraeithnaKirneraroazgteiBaqDanfe(聽不懂得龍語)
				sleep ( 20 )
				SetModeEx( No_374 , EM_SetModeType_Fight, true) ---可砍殺(是)
				SetModeEx( No_374 , EM_SetModeType_Move, true) ---移動	(否)
				CombatBegin = 1       ------將王的戰鬥開始狀態值改成1~意思就是王進入戰鬥了
			end
			if CombatBegin == 1 then
				skill = skill + 1
				skill_7 = skill_7 + 1
				skill_13 = skill_13 + 1
				skill_23 = skill_23 + 1
				if skill_7 >= 4 then
					rand_skill = DW_Rand(100)  ----->有100個亂數去隨機一個值出來
					if ( rand_skill >= 1 and rand_skill <= 10) or( rand_skill >=21 and rand_skill <= 30 ) or
					   ( rand_skill >= 41 and rand_skill <= 50 ) or ( rand_skill >= 61 and rand_skill <= 70 ) or
					   ( rand_skill >= 81 and rand_skill <= 90 ) then      ------------>當隨機出來的值等於以上的亂數就施放第一招
					   CastSpelllv ( No_374 , AttackTarget , 497327 , 80 )----對當前目標釋放一個巨大傷害
					   sleep ( 20 )   --------->放玩法術後整個迴圈停兩秒
					elseif ( rand_skill >= 11 and rand_skill <= 20 ) or( rand_skill >= 31 and rand_skill <= 40 ) or
					   ( rand_skill >= 51 and rand_skill <= 60 ) or( rand_skill >= 70 and rand_skill <= 80 ) or
					   ( rand_skill >= 91 and rand_skill <= 100 ) then   ------------>當隨機出來的值等於以上的亂數就施放第二招
					   CastSpelllv ( No_374 , No_374 , 497326 , 10 )----前方扇形
					   sleep ( 20 )
					end
					skill_7 = 0
				end
				if skill_13 >= 7 then
					rand_skill = DW_Rand(100)  ----->有100個亂數去隨機一個值出來
					if ( rand_skill >= 1 and rand_skill <= 10) or( rand_skill >=21 and rand_skill <= 30 ) or
					   ( rand_skill >= 41 and rand_skill <= 50 ) or ( rand_skill >= 61 and rand_skill <= 70 ) or
					   ( rand_skill >= 81 and rand_skill <= 90 ) then      ------------>當隨機出來的值等於以上的亂數就施放第一招
					   CastSpelllv ( No_374 , No_374 , 497325 , 8 ) --冰晶吐息
					   sleep ( 20 )   --------->放玩法術後整個迴圈停兩秒
					elseif ( rand_skill >= 11 and rand_skill <= 20 ) or( rand_skill >= 31 and rand_skill <= 40 ) or
					   ( rand_skill >= 51 and rand_skill <= 60 ) or( rand_skill >= 70 and rand_skill <= 80 ) or
					   ( rand_skill >= 91 and rand_skill <= 100 ) then   ------------>當隨機出來的值等於以上的亂數就施放第二招
					   fire_Table = DW_HateRemain(0)
					   fire_rand = table.getn(fire_Table)
					   fire_number = DW_Rand(fire_rand)
					   CastSpelllv ( No_374 , fire_Table[fire_number] , 497328 , 20 )----噴火
					   sleep ( 20 )
					end
					sleep ( 20 )
					skill_13 = 0
				end
				local skill_stop = ReadRoleValue ( No_374 , EM_RoleValue_Register5 )
				if skill_23 >= 13 then  ---施放追到死光束
					if skill_stop == 0 then
						WriteRoleValue ( No_374 , EM_RoleValue_Register5 , 1 )
						ScriptMessage( No_374 , -1 , 2 ,"[SC_NO374_04]" , 2 )----vaistain'vaistain'vaistain(聽不懂得龍語)
						local number = 0
						local rand_num = 0
						local play_table = {}
						local play = 0
						play_table = DW_HateRemain(0)
						number = table.getn(play_table)
						if number == 1 then
							runTarget = AttackTarget
						elseif number >= 2 then
							play_table = DW_HateRemain(1)
							number = table.getn(play_table)
							rand_num = DW_Rand (number)
							runTarget = play_table[rand_num]
						end
						Addbuff (  No_374 , 509067 , 0 ,-1 ) ---
						SetModeEx( No_374 , EM_SetModeType_Fight, false) ---可砍殺
						SetModeEx( No_374 , EM_SetModeType_Move, false) ---移動
						--SetModeEx( No_374 , EM_SetModeType_Strikback, false) ---反擊(否)
						sleep ( 10 )
						PlayMotionex ( No_374 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_LOOP )---------------第1ㄍ動作
						sleep ( 10 )
						SetIdleMotion( No_374 ,ruFUSION_ACTORSTATE_CRAFTING_LOOP )----------------------維持動作
						local xx1 = ReadRoleValue ( runTarget, EM_RoleValue_X)
						local yy2 = ReadRoleValue ( runTarget, EM_RoleValue_Y)
						local zz3 = ReadRoleValue ( runTarget, EM_RoleValue_Z)   ---------這裡是捉出Attackplayer裡面的那個人的座標
						local ball = CreateObj( 105422 , xx1, yy2 , zz3 , 0 , 1 )  ------------生出魔術帽
						SetModeEx( ball , EM_SetModeType_Strikback, false) ---反擊(否)
						SetModeEx( ball , EM_SetModeType_Mark, false)---可點選(是)
						SetModeEx( ball , EM_SetModeType_Searchenemy, false)--索敵(否)
						SetModeEx( ball , EM_SetModeType_ShowRoleHead, false) 		---頭像框(是)
						SetModeEx( ball , EM_SetModeType_Fight, false) ---可砍殺(是)
						SetModeEx( ball , EM_SetModeType_NotShowHPMP , false ) ----不顯示寫條
						AddToPartition( ball,RoomID )
						BeginPlot( ball,"cl_run_ball", 0 )
						WriteRoleValue( ball , EM_RoleValue_Livetime, 6 )  --存活時間
						WriteRoleValue ( ball , EM_RoleValue_PID , No_374 )
						CastSpelllv ( No_374 , ball , 497266 , 0 ) --請AI2隊帽子裡面的所有玩家施放-80%傷害的AE
						sleep ( 50 )
						PlayMotion ( No_374 , ruFUSION_ACTORSTATE_CRAFTING_END )
						sleep ( 10 )
						SetIdleMotion( No_374 ,  ruFUSION_ACTORSTATE_NORMAL)--------保持地下模式
						SetModeEx( No_374 , EM_SetModeType_Fight, true) ---可砍殺
						SetModeEx( No_374 , EM_SetModeType_Move, true) ---移動	
						--SetModeEx( No_374 , EM_SetModeType_Strikback, true) ---反擊(否)
						CancelBuff_NoEvent( No_374 , 509067 ) ---清除BUFF
						skill_23 = 0
						WriteRoleValue ( No_374 , EM_RoleValue_Register5 , 0 )
					end
				end
				if skill >= 16 then
					if skill_stop == 0 then
						WriteRoleValue ( No_374 , EM_RoleValue_Register5 , 1 )
						ScriptMessage( No_374 , -1 , 2 ,"[SC_NO374_03]" , 2 )----Gauteikriistain'naCashtei(龍吼聲迴盪在整個房間內)
						Addbuff ( No_374 , 509067 , 0 ,-1 ) ---
						SetModeEx( No_374 , EM_SetModeType_Fight, false) ---可砍殺
						SetModeEx( No_374 , EM_SetModeType_Move, false) ---移動
						--SetModeEx( No_374 , EM_SetModeType_Strikback, false) ---反擊(否)
						--sleep ( 10 )
						PlayMotionex ( No_374 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_LOOP )---------------第1ㄍ動作
						sleep ( 20 )
						SetIdleMotion( No_374 ,ruFUSION_ACTORSTATE_CRAFTING_LOOP )----------------------維持動作
						local xx1 = ReadRoleValue ( AttackTarget, EM_RoleValue_X)
						local yy2 = ReadRoleValue ( AttackTarget, EM_RoleValue_Y)
						local zz3 = ReadRoleValue ( AttackTarget, EM_RoleValue_Z)   ---------這裡是捉出Attackplayer裡面的那個人的座標
						local ball = CreateObj( 105422 , xx1, yy2 , zz3 , 0 , 1 )  ------------生出魔術帽
						SetModeEx( ball , EM_SetModeType_Strikback, false) ---反擊(否)
						SetModeEx( ball , EM_SetModeType_Move, false) ---移動	(否)
						SetModeEx( ball , EM_SetModeType_Searchenemy, false)--索敵(否)
						SetModeEx( ball , EM_SetModeType_Mark, false)			---可點選(是)
						SetModeEx( ball , EM_SetModeType_ShowRoleHead, false) 		---頭像框(是)
						SetModeEx( ball , EM_SetModeType_Fight, false) ---可砍殺(是)
						SetModeEx( ball , EM_SetModeType_NotShowHPMP , false ) ----不顯示寫條
						AddToPartition( ball,RoomID )
						WriteRoleValue( ball , EM_RoleValue_Livetime, 10 )  --存活時間
						CastSpelllv ( No_374 , ball , 497261 , 0 ) --請AI2隊帽子裡面的所有玩家施放-80%傷害的AE
						sleep ( 50 )
						sysCastSpelllv ( ball , ball , 497262 , 12 ) --請AI2隊帽子裡面的所有玩家施放-80%傷害的AE
						PlayMotion ( No_374 , ruFUSION_ACTORSTATE_CRAFTING_END )
						sleep ( 10 )
						SetIdleMotion( No_374 ,  ruFUSION_ACTORSTATE_NORMAL)--------保持地下模式
						SetModeEx( No_374 , EM_SetModeType_Fight, true) ---可砍殺
						SetModeEx( No_374 , EM_SetModeType_Move, true) ---移動	
						--SetModeEx( No_374 , EM_SetModeType_Strikback, true) ---反擊(否)
						CancelBuff_NoEvent( No_374 , 509067 ) ---清除BUFF
						skill = 0
						WriteRoleValue ( No_374 , EM_RoleValue_Register5 , 0 )
					end
				end
			end
		elseif HateListCount ( No_374 ) == 0 then ---如果王的仇恨表內沒有人就要傳回給中控器
			if CombatBegin == 1 then  ----如果王仇恨表內沒有人了~就將這個值改變
				WriteRoleValue ( AI , EM_RoleValue_Register1 , 3 )
				ScriptMessage( No_374 , -1 , 2 ,"[SC_NO374_05]" , 2 )----SeauteiBaqKarfe(聽不懂得龍語)	
				skill = 0
				skill_23 = 0
				skill_13 = 0
				skill_7 = 0
				CombatBegin = 0
			end
		end
	end
end
function cl_No_374_Crystalfight() ---水晶控制器
	local CrystalAI = OwnerID()  ----
	local RoomID = ReadRoleValue( CrystalAI , EM_RoleValue_RoomID ) ----這是AI讀取到的地圖
	local AI = ReadRoleValue ( CrystalAI , EM_RoleValue_PID )
	local No_374 = ReadRoleValue ( CrystalAI , EM_RoleValue_Register2 )
	local Crystal_time = 0 ---生水晶的值
	local buff_time = 20 ---每20秒切換BUFF的時間
	local hptime = 0
	local Crystal_table = {} ----放水晶的TABLE
	local fix_Crystal_open = 0
	cl_136_No_374_105387()  -----執行產生小水晶控制器
	while 1 do
		sleep ( 10 )
		local Crystal = ReadRoleValue ( CrystalAI , EM_RoleValue_Register1 )  ----每一秒讀取我的R1直,
		if Crystal == 1 then --當Crystal變成1的時候代表真水晶以經點擊.假水晶必須產生並且開始計時30秒
			Crystal_time = Crystal_time + 1
			if fix_Crystal_open == 0 then
				for i = 1 , 4 , 1 do
					local fix_Crystal = CreateObjByFlag( 117739 , 780889 , i , 1 ) ------------for迴圈產生四次水晶
					SetModeEx ( fix_Crystal , EM_SetModeType_Obstruct, false) 		---阻擋(是)
					SetModeEx( fix_Crystal, EM_SetModeType_Strikback, false) ---反擊(否)
					SetModeEx( fix_Crystal, EM_SetModeType_Move, false) ---移動	(否)
					SetModeEx( fix_Crystal , EM_SetModeType_Searchenemy, false)--索敵(否)
					SetModeEx( fix_Crystal , EM_SetModeType_Mark, true)			---可點選(是)
					SetModeEx( fix_Crystal , EM_SetModeType_ShowRoleHead, true) 		---頭像框(是)
					SetModeEx( fix_Crystal , EM_SetModeType_Fight, false) ---可砍殺(是)
					SetModeEx( fix_Crystal , EM_SetModeType_NotShowHPMP , true) ----不顯示寫條
					AddToPartition ( fix_Crystal , RoomID ) ----物件加入場景,例行公事	
					WriteRoleValue ( fix_Crystal , EM_RoleValue_Register2 , AI )
					table.insert( Crystal_Table , fix_Crystal )
					BeginPlot( fix_Crystal,"cl_fix_CrystalAI", 0 )
				end
				fix_Crystal_open = 1
			end
			if Crystal_time == 30 then
				cl_136_No_374_105387()
				if fix_Crystal_open == 1 then
					for i = 1 , 4 , 1 do
						delobj ( Crystal_table[i] )
						fix_Crystal_open = 0
					end		
					Crystal_table = {}
				end
				WriteRoleValue ( CrystalAI , EM_RoleValue_Register1 , 0 )
				Crystal_time = 0
			end
		end
		local stage = ReadRoleValue ( AI , EM_RoleValue_Register1 )
		local skill_stop = ReadRoleValue ( No_374 , EM_RoleValue_Register5 )
		if stage == 1 then
			buff_time = buff_time + 1
			if buff_time >= 30 then  ---BUFF隨機三選二
				if skill_stop == 0 then
					WriteRoleValue ( No_374 , EM_RoleValue_Register5 , 1 )
					while 	ReadRoleValue( No_374 , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
						sleep(2)
					end
					cl_randbuff()
					sleep ( 20 )
					buff_time = 0
					WriteRoleValue ( No_374 , EM_RoleValue_Register5 , 0 )
				end
			end
		else
			buff_time = 20
		end
	end
end
function cl_fix_CrystalAI()
	local fix_Crystal = OwnerID()
	local RoomID = ReadRoleValue( fix_Crystal , EM_RoleValue_RoomID ) ----這是AI讀取到的地圖
	local AI = ReadRoleValue ( fix_Crystal , EM_RoleValue_Register2 )
	CastSpelllv ( fix_Crystal , fix_Crystal , 497330 , 0 )
	while 1 do
		sleep ( 10 )
		local stage = ReadRoleValue ( AI , EM_RoleValue_Register1 )
		if stage == 3 then
			sleep ( 50 )
			delobj ( fix_Crystal )
		end
	end
end
function cl_136_No_374_105387() ---boss本身產水晶用
	local CrystalAI = OwnerID()
	local RoomID = ReadRoleValue( CrystalAI , EM_RoleValue_RoomID ) ----這是AI讀取到的地圖
	local AI = ReadRoleValue ( CrystalAI , EM_RoleValue_PID )
	local No_374 = ReadRoleValue ( CrystalAI , EM_RoleValue_Register2 )
	local CrystalAII = CreateObjByFlag( 105387 , 780889 , 0 , 1 ) ------------for迴圈產生四次水晶
	SetModeEx ( CrystalAII , EM_SetModeType_Obstruct, false) 		---阻擋(是)
	SetModeEx( CrystalAII, EM_SetModeType_Strikback, false) ---反擊(否)
	SetModeEx( CrystalAII, EM_SetModeType_Move, false) ---移動	(否)
	SetModeEx( CrystalAII , EM_SetModeType_Searchenemy, false)--索敵(否)
	SetModeEx( CrystalAII , EM_SetModeType_Mark, false)			---可點選(是)
	SetModeEx( CrystalAII , EM_SetModeType_ShowRoleHead, false) 		---頭像框(是)
	SetModeEx( CrystalAII , EM_SetModeType_Fight, false) ---可砍殺(是)
	SetModeEx( CrystalAII , EM_SetModeType_NotShowHPMP , false) ----不顯示寫條
	AddToPartition ( CrystalAII , RoomID ) ----物件加入場景,例行公事
	WriteRoleValue ( CrystalAII , EM_RoleValue_PID , CrystalAI )
	WriteRoleValue ( CrystalAII , EM_RoleValue_Register1 , AI )
	WriteRoleValue ( CrystalAII , EM_RoleValue_Register2 , No_374 )
	BeginPlot( CrystalAII,"cl_136_No_374_CrystalAI", 0 )
end
function cl_136_No_374_CrystalAI() ---這一段是產生水晶AI產水晶用
	local CrystalAI = OwnerID()
	local RoomID = ReadRoleValue( CrystalAI , EM_RoleValue_RoomID ) ----這是AI讀取到的地圖
	local CrystalAIII = ReadRoleValue( CrystalAI , EM_RoleValue_PID )
	local AI = ReadRoleValue ( CrystalAI , EM_RoleValue_Register1 )
	local No_374 = ReadRoleValue ( CrystalAI , EM_RoleValue_Register2 )
	local skill = 0
	local No_Crystal_Table = {117736,117737,117738,117739}
	local flag_table = {1,2,3,4}
	local Crystal_Table = {}
	local Crystal_number = 0
	local flag_number = 0
	local Rand_flag = 0
	for i = 1 , 4 , 1 do
		flag_number = table.getn(flag_table)
		Rand_flag = DW_Rand(flag_number)
		local Crystal = CreateObjByFlag( No_Crystal_Table[i] , 780889 , flag_table[Rand_flag] , 1 ) ------------for迴圈產生四次水晶
		SetModeEx ( Crystal , EM_SetModeType_Obstruct, false) 		---阻擋(是)
		SetModeEx( Crystal, EM_SetModeType_Strikback, false) ---反擊(否)
		SetModeEx( Crystal, EM_SetModeType_Move, false) ---移動	(否)
		SetModeEx( Crystal , EM_SetModeType_Searchenemy, false)--索敵(否)
		SetModeEx( Crystal , EM_SetModeType_Mark, true)			---可點選(是)
		SetModeEx( Crystal , EM_SetModeType_ShowRoleHead, true) 		---頭像框(是)
		SetModeEx( Crystal , EM_SetModeType_Fight, false) ---可砍殺(是)
		SetModeEx( Crystal , EM_SetModeType_NotShowHPMP , true) ----不顯示寫條
		AddToPartition ( Crystal , RoomID ) ----物件加入場景,例行公事
		WriteRoleValue ( Crystal , EM_RoleValue_PID , CrystalAI )
		WriteRoleValue ( Crystal , EM_RoleValue_Register1 , i )
		WriteRoleValue ( Crystal , EM_RoleValue_Register3 , CrystalAIII )
		WriteRoleValue ( Crystal , EM_RoleValue_Register4 , No_374 )
		WriteRoleValue ( Crystal , EM_RoleValue_Register5 , AI )
		table.insert( Crystal_Table , Crystal )
		BeginPlot( Crystal,"cl_Crystal_touch", 0 )
		table.remove ( flag_table , Rand_flag )
		flag_number = table.getn(flag_table)
		sleep ( 1 )
	end
	while 1 do
		sleep ( 10 )
		local stage = ReadRoleValue ( AI , EM_RoleValue_Register1 )
		if stage == 2 then
		elseif stage == 3 then			
			Crystal_number = table.getn(Crystal_Table)
			for i = 1 , Crystal_number , 1 do
				delobj ( Crystal_Table[i] )
			end
			delobj ( CrystalAI )
			break
		end
		local delCrystal = ReadRoleValue ( CrystalAI , EM_RoleValue_Register2 )
		Crystal_number = table.getn(Crystal_Table)
		for i = 1 , Crystal_number , 1 do
			local Crystaloff = ReadRoleValue ( Crystal_Table[i] , EM_RoleValue_Register2 )
			if Crystaloff == 1 then
				WriteRoleValue ( CrystalAI , EM_RoleValue_Register2 , 1 )
			end
		end
		if delCrystal == 1 then
			skill = skill + 1
			if skill >= 2 then
				for i = 1 , Crystal_number , 1 do
					delobj ( Crystal_Table[i] )
				end
				WriteRoleValue ( CrystalAIII , EM_RoleValue_Register1 , 1 )
				delobj ( CrystalAI )
			end
		end
	end
end
function cl_Crystal_touch()
	local Crystal = OwnerID()
	local AI = ReadRoleValue ( Crystal , EM_RoleValue_Register5 )
	addbuff ( Crystal , 509700 , 0 , -1 )
	SetPlot( Crystal, "touch","cl_Crystal_Cast", 50 ) ------PlotType 觸發類型 (分為"touch"觸碰、"range"範圍、"dead"死亡、"collision"碰撞四種)
end
function cl_Crystal_Cast()
	local play = OwnerID()
	local Crystal = TargetID()
	if CheckBuff( play , 509148 ) == false then
		if	BeginCastBarEvent( play ,Crystal , "[SC_NO374_07]" , 20 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_END,0 , "cl_Crystal_touch_OK") ~=1	then
			ScriptMessage( play, play, 1,"[SAY_NPC_BUSY]", 0 );		--目標忙碌中
		end
	end
end
function cl_Crystal_touch_OK(Executer,Result) ---檢查目標有沒有木棒~有的畫給予火把
	local Crystal = TargetID()
	local number = ReadRoleValue(Crystal , EM_RoleValue_Register1 )
	local function_table = {"cl_Crystal_red" , "cl_Crystal_green" , "cl_Crystal_bule" , "cl_Crystal_whiter"}
	if	Result > 0 then --成功狀態
		EndCastBar(Executer,Result)--清除施法條
		BeginPlot( Crystal , function_table[number] , 0)
	else
		EndCastBar(Executer,Result)--清除施法條
	end
end
function cl_Crystal_green()
	--say ( OwnerID() , "green")
	local Crystal = OwnerID()
	local tagplay = TargetID()
	local delCrystal = ReadRoleValue ( Crystal , EM_RoleValue_Register2 )
	local CrystalAI = ReadRoleValue ( Crystal , EM_RoleValue_Register3 )
	local No_374 = ReadRoleValue ( Crystal , EM_RoleValue_Register4 )
	if CheckBuff( No_374 , 509068 ) == true then
		CancelBuff_NoEvent( No_374 , 509068 ) ---清除BUFF
	end
	addbuff ( tagplay , 509227 , 0 , 30 )
	if delCrystal ~= 1 then
		WriteRoleValue ( Crystal , EM_RoleValue_Register2 , 1 )
	end
end
function cl_Crystal_red()
	--say ( OwnerID() , "red")
	local Crystal = OwnerID()
	local tagplay = TargetID()
	local delCrystal = ReadRoleValue ( Crystal , EM_RoleValue_Register2 )
	local CrystalAI = ReadRoleValue ( Crystal , EM_RoleValue_Register3 )
	local No_374 = ReadRoleValue ( Crystal , EM_RoleValue_Register4 )
	if CheckBuff( No_374 , 509070 ) == true then
		CancelBuff_NoEvent( No_374 , 509070 ) ---清除BUFF
	end
	if CheckBuff ( No_374 , 509067) == true then
		--say ( No_374 , "fly")
		SetModeEx( No_374 , EM_SetModeType_Fight, true) ---可砍殺
		sysCastSpelllv ( tagplay , No_374 , 497329 , 0 ) --請AI2隊帽子裡面的所有玩家施放-80%傷害的AE
		sleep ( 10 )
		SetModeEx( No_374 , EM_SetModeType_Fight, false) ---可砍殺
		addbuff ( tagplay , 509231 , 0 , 10 )
	elseif CheckBuff ( No_374 , 509067) == false then
		--say ( No_374 , "Not's fly")
		sysCastSpelllv ( tagplay , No_374 , 497329 , 0 ) --請AI2隊帽子裡面的所有玩家施放-80%傷害的AE
		addbuff ( tagplay , 509231 , 0 , 10 )
	end
	if delCrystal ~= 1 then
		WriteRoleValue ( Crystal , EM_RoleValue_Register2 , 1 )
	end
end
function cl_Crystal_bule()
	--say ( OwnerID() , "bule")
	local Crystal = OwnerID()
	local tagplay = TargetID()
	local delCrystal = ReadRoleValue ( Crystal , EM_RoleValue_Register2 )
	local CrystalAI = ReadRoleValue ( Crystal , EM_RoleValue_Register3 )
	local No_374 = ReadRoleValue ( Crystal , EM_RoleValue_Register4 )
	if CheckBuff( No_374 , 509069 ) == true then
		CancelBuff_NoEvent( No_374 , 509069 ) ---清除BUFF	
	end
	addbuff ( tagplay , 509228 , 0 , 30 )
	if delCrystal ~= 1 then
		WriteRoleValue ( Crystal , EM_RoleValue_Register2 , 1 )
	end
end
function cl_Crystal_whiter()
	--say ( OwnerID() , "whiter")
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ----這是AI讀取到的地圖
	local Crystal = OwnerID()
	local tagplay = TargetID()
	local ThesePlayer = {}
	local delCrystal = ReadRoleValue ( Crystal , EM_RoleValue_Register2 )
	local CrystalAI = ReadRoleValue ( Crystal , EM_RoleValue_Register3 )
	local No_374 = ReadRoleValue ( Crystal , EM_RoleValue_Register4 )
	--sysCastSpelllv ( Crystal , Crystal , 497260 , 0 ) --請AI2隊帽子裡面的所有玩家施放-80%傷害的AE
	Addbuff (  No_374 , 509152 , 0 ,-1 ) ---
	addbuff ( tagplay , 509229 , 0 , 10 )
	local TempPlayer = SetSearchAllPlayer(RoomID)----找區域所有玩家
	for i=1,TempPlayer do ---TempPlayer等於數量代表for迴圈要做幾次
		ThesePlayer[i] = GetSearchResult() --將找到的玩家GID暫時存到這個值內
		if CheckID( ThesePlayer[i] )  == true and  ---檢查GID
			ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) ==  0 and 
			ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) ==  1 then--檢查玩家是不是還在；檢查是否死亡
			if CheckBuff( ThesePlayer[i] , 509071 ) == false then
				Addbuff( ThesePlayer[i], 509071 , 0 ,-1 )
			end
		end
	end
	if delCrystal ~= 1 then
		WriteRoleValue ( Crystal , EM_RoleValue_Register2 , 1 )
	end
end
function cl_checkbuff_509071()
	if CheckBuff( TargetID() , 509071 ) == false then
		--addbuff ( TargetID() , 509262 , 0 , 3 )
		--say ( TargetID() , "NOBUFF")
		return true
	elseif CheckBuff( TargetID() , 509071 ) == true then
		return false
	end
end
function cl_checkNobuff_509071()
	if CheckBuff( TargetID() , 509071 ) == true then
		--addbuff ( TargetID() , 509263 , 0 , 3 )
		--say ( TargetID() , "YESBUFF")
		return true
	elseif CheckBuff( TargetID() , 509071 ) == false then
		return false
	end
end
function cl_fry_No374()
	local No_374 = OwnerID()
	local RoomID = ReadRoleValue( No_374 , EM_RoleValue_RoomID ) ----這是AI讀取到的地圖
	local AttackTarget = ReadRoleValue( No_374 , EM_RoleValue_AttackTargetID )-----每一秒都尋找王的攻擊目標
	Addbuff (  No_374 , 509067 , 0 ,-1 ) ---
	SetModeEx( No_374 , EM_SetModeType_Fight, false) ---可砍殺
	SetModeEx( No_374 , EM_SetModeType_Move, false) ---移動
	--SetModeEx( No_374 , EM_SetModeType_Strikback, false) ---反擊(否)
	sleep ( 10 )
	PlayMotionex ( No_374 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_LOOP )---------------第1ㄍ動作
	sleep ( 10 )
	SetIdleMotion( No_374 ,ruFUSION_ACTORSTATE_CRAFTING_LOOP )----------------------維持動作
	local xx1 = ReadRoleValue ( AttackTarget, EM_RoleValue_X)
	local yy2 = ReadRoleValue ( AttackTarget, EM_RoleValue_Y)
	local zz3 = ReadRoleValue ( AttackTarget, EM_RoleValue_Z)   ---------這裡是捉出Attackplayer裡面的那個人的座標
	local ball = CreateObj( 105422 , xx1, yy2 , zz3 , 0 , 1 )  ------------生出魔術帽
	SetModeEx( ball , EM_SetModeType_Strikback, false) ---反擊(否)
	SetModeEx( ball , EM_SetModeType_Move, false) ---移動	(否)
	SetModeEx( ball , EM_SetModeType_Searchenemy, false)--索敵(否)
	SetModeEx( ball , EM_SetModeType_Mark, false)			---可點選(是)
	SetModeEx( ball , EM_SetModeType_ShowRoleHead, false) 		---頭像框(是)
	SetModeEx( ball , EM_SetModeType_Fight, false) ---可砍殺(是)
	SetModeEx( ball , EM_SetModeType_NotShowHPMP , false ) ----不顯示寫條
	AddToPartition( ball,RoomID )
	WriteRoleValue( ball , EM_RoleValue_Livetime, 5 )  --存活時間
	CastSpelllv ( No_374 , ball , 497261 , 0 ) --請AI2隊帽子裡面的所有玩家施放-80%傷害的AE
	sleep ( 50 )
	sysCastSpelllv ( ball , ball , 497262 , 12 ) --請AI2隊帽子裡面的所有玩家施放-80%傷害的AE
	PlayMotion ( No_374 , ruFUSION_ACTORSTATE_CRAFTING_END )
	sleep ( 10 )
	SetIdleMotion( No_374 ,  ruFUSION_ACTORSTATE_NORMAL)--------保持地下模式
	SetModeEx( No_374 , EM_SetModeType_Fight, true) ---可砍殺
	SetModeEx( No_374 , EM_SetModeType_Move, true) ---移動	
	--SetModeEx( No_374 , EM_SetModeType_Strikback, true) ---反擊(否)
	CancelBuff_NoEvent( No_374 , 509067 ) ---清除BUFF
end
function cl_No_374_dead() ---BOSS死亡劇情
	local AI = ReadRoleValue ( OwnerID() , EM_RoleValue_PID )
	WriteRoleValue ( AI , EM_RoleValue_Register1 , 2 )
	ScriptMessage( OwnerID() , -1 , 2 ,"[SC_NO374_06]" , 2 )----wor si lr(龍的淒厲哀吼聲)
end
function cl_randbuff()
	local AI = OwnerID()
	local No_374 = ReadRoleValue ( AI , EM_RoleValue_Register2 )
	ScriptMessage( No_374 , -1 , 2 ,"[SC_NO374_02]" , 2 )----SoiaqnaeLarfeBanfe(龍族咒語)
	local rand_buff = 0
	local buff_time = 27
	local buff_table = { 497263 , 497264 , 497265 }
	local addbuff_table = { 509068 , 509069 , 509070 }
	local numder_table = { 1 , 2 , 3 }
	local numder = 0
	rand_buff = DW_Rand (3)
	CastSpelllv ( No_374 , No_374 , buff_table[rand_buff] , 5 ) --
end
function cl_run_ball()
	local No_374 = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local number = 0
	local rand_num = 0
	--Addbuff (  OwnerID() , 509151 , 0 , 7 ) ---
	local play_table = {}
	local play = 0
	play_table = star_HateListSort(No_374)
	number = table.getn(play_table)
	if number >= 1 then
		rand_num = DW_Rand (number)
		play = play_table[rand_num]
		SetFollow( OwnerID(), play )
		WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,1)
	end
	while 1 do
		sleep ( 10 )
		sysCastSpelllv ( OwnerID() , OwnerID() , 497267 , 6 ) --請AI2隊帽子裡面的所有玩家施放-80%傷害的AE
		if ReadRoleValue ( play , EM_RoleValue_IsDead ) ==  1 then
			play_table = star_HateListSort(No_374)
			number = table.getn(play_table)
			if number > 0 then
				rand_num = DW_Rand (number)
				play = play_table[rand_num]
				SetFollow( OwnerID(), play )
			elseif number == 0 then
				delobj ( OwnerID() )
			end
		end
	end
end
function cl_139_NO374() --------------路上兔子表演用-----------
	SetPlot( OwnerID(), "range","cl_139_NO374_range", 50 )
end
function cl_139_NO374_range()
	if ReadRoleValue ( OwnerID() , EM_RoleValue_VOC ) ~=  0 then
		ScriptMessage( TargetID() , -1 , 2 ,"[SC_NO374_14]" , 2 )
		delobj ( TargetID() )
	end
end