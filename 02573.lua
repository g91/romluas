function cl_Ac1_Blackwater_P3Ai() 
	--中控R1存階段
	--中控R2存副本大門
	Var_AC1_NpcGlobal_PH3[1] = OwnerID()
	local MainCtrl = OwnerID()
	local RoomID = ReadRoleValue ( MainCtrl , EM_RoleValue_RoomID )
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
	local Door_Time = 0
	local Door_Open = GetWorldVar( "SC_BLACKWATER_P3_OPENDOOR" )
	local String_Table = {}
		String_Table["START"] = "[SC_BLACKWATER_P3_START_01]"	--一個空間裂縫產生了…
		String_Table["30M"] = "[SC_BLACKWATER_P3_START_30M]"	--黑暗壟罩著整個凡瑞娜絲城，…
		String_Table["10M"] = "[SC_BLACKWATER_P3_START_10M]"	--空間裂縫被成功穩定下來了，…
		String_Table["OpenDoor"] = "[SC_BLACKWATER_P3_START_DOOR]"	--空間裂縫與亂渦之地的連結通道已經完全穩定…
		String_Table["ReadyDoor"] = "[SC_BLACKWATER_P3_READYDOOR]"	--黑石晶片的共震產生不穩定的能量…
		String_Table["CloseDoor"] = "[SC_BLACKWATER_P3_CLOSEDOOR]"	--連結空間裂縫的黑水晶已經被大幅的削弱…
		--開燈、關燈判定
		if Door_Open == 0 then
			Cl_Change_Light_Off( "0x001E00C8" )		--關燈用
		else
			Cl_Change_Light_On()
		end

		if lua_ACuseRealZoneID( OwnerID() ) then	--只做一次廣播
			if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
				RunningMsgEx( MainCtrl , 2 , 3 , String_Table["START"]  )
			end
		end
	--local Access_Control_Time = 3600
	local Access_Control_Time = 805
	--local AC_Time_Table = {}
	--AC_Time_Table[1] = 1800
	--AC_Time_Table[2] = 900
	--AC_Time_Table[3] = 300
	--AC_Time_Table[4] = 3300

	--boss倒數時間，
	local Door_Time_Table = {}
		Door_Time_Table[1] = 900
		Door_Time_Table[2] = 300
		Door_Time_Table[3] = 2100
		Door_Time_Table[4] = 1860
		Door_Time_Table[5] = 1800

	local AC_Time_Table = {}
		AC_Time_Table[1] = 600
		AC_Time_Table[2] = 300
		AC_Time_Table[3] = 200
		AC_Time_Table[4] = 800

	local RunMsg_flag = 0
	local Flag_Table = {}
		Flag_Table[1] = 781060
	local Open_Flag = 0
	local CrackID = 120189  	----亂渦之地裂縫
	local Crystal_Black = 120207	--黑紫晶
	local Show_Itme = 106239	--黑紫色150%

		Var_AC1_NpcGlobal_PH3[2] = Cl_CreateObjByFlag( CrackID , Flag_Table[1] , 10 , RoomID )		----亂渦之地裂縫
		WriteRoleValue ( MainCtrl , EM_RoleValue_Register2 , Var_AC1_NpcGlobal_PH3[2] ) 	---中控R2，存副本門口ID
		Var_AC1_NpcGlobal_PH3[3] = Cl_CreateObjByFlag( Show_Itme , Flag_Table[1] , 11 , RoomID )	--黑牆
		Var_AC1_NpcGlobal_PH3[4] = Cl_CreateObjByFlag( Show_Itme , Flag_Table[1] , 12 , RoomID )	--黑牆
		CrackID = Var_AC1_NpcGlobal_PH3[2]
	

		if lua_ACuseRealZoneID( OwnerID() ) then
			SetWorldVar( "SC_BLACKWATER_P3_MONSTERTIME" , 0 )	-- 字串、值
		end

	local Times = 259200	--3天 60*60*24*3 = 259200
	local ShowT = 0
	local Old_Magic_Npc
	--DebugMsg ( 0 , RoomID , "ACWB P-3 GO" )
	while 1 do
		sleep ( 10 )
		Door_Open = GetWorldVar( "SC_BLACKWATER_P3_OPENDOOR" )	-- 世界變數1
		Door_Time = GetWorldVar( "SC_BLACKWATER_P3_TIME" )	-- 世界變數1
		--表演開始
		if Door_Open == 0 then

			Access_Control_Time = Access_Control_Time - 1
			if Access_Control_Time == AC_Time_Table[4] then 
				WriteRoleValue ( MainCtrl,EM_RoleValue_Register1,1)
				cl_Call_Show_Npc()
			elseif Access_Control_Time == AC_Time_Table[1] then   ----賢者之眼法師聚集
				WriteRoleValue ( MainCtrl,EM_RoleValue_Register1,2)
				if lua_ACuseRealZoneID( OwnerID() ) then
					if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
						RunningMsgEx( MainCtrl , 2 , 3 , String_Table["30M"]  )
					end
				end
			elseif Access_Control_Time == AC_Time_Table[2] then 
				local Npc_X = ReadRoleValue ( CrackID , EM_RoleValue_X )
				local Npc_Y = ReadRoleValue ( CrackID , EM_RoleValue_Y )
				local Npc_Z = ReadRoleValue ( CrackID , EM_RoleValue_Z )
				local Npc_Dir = ReadRoleValue ( CrackID , EM_RoleValue_Dir )
				WriteRoleValue ( MainCtrl,EM_RoleValue_Register1,3)
				--黑紫晶加入場景
				Var_AC1_NpcGlobal_PH3[5] = CreateObj( Crystal_Black , Npc_X , Npc_Y+100 , Npc_Z , Npc_Dir , 1 )
				Crystal_Black = Var_AC1_NpcGlobal_PH3[5]
					SetModeEx ( Crystal_Black , EM_SetModeType_Obstruct, false) 	
					SetModeEx( Crystal_Black , EM_SetModeType_Strikback, false)	
					SetModeEx( Crystal_Black , EM_SetModeType_Move, false) 	
					SetModeEx( Crystal_Black , EM_SetModeType_Searchenemy, false)
					SetModeEx( Crystal_Black , EM_SetModeType_Mark, false)
					SetModeEx( Crystal_Black , EM_SetModeType_ShowRoleHead, false) 
					SetModeEx( Crystal_Black , EM_SetModeType_Gravity, false) 	
					SetModeEx( Crystal_Black , EM_SetModeType_Fight, false) 	    
					SetModeEx( Crystal_Black , EM_SetModeType_NotShowHPMP , false) 
				AddToPartition ( Crystal_Black , RoomID )
				if lua_ACuseRealZoneID( OwnerID() ) then
					if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
						RunningMsgEx( MainCtrl , 2 , 3 , String_Table["10M"]  )
					end
				end
			elseif Access_Control_Time == AC_Time_Table[3] then
				WriteRoleValue ( MainCtrl,EM_RoleValue_Register1,4)
				if lua_ACuseRealZoneID( OwnerID() ) then
					SetWorldVar( "SC_BLACKWATER_P3_OPENDOOR" , 1 )	--切換階段
					if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
						RunningMsgEx( MainCtrl , 2 , 3 , String_Table["OpenDoor"]  )
					end
				end
				Cl_Change_Light_On()
				Access_Control_Time = 0
			end
		--正式開門
		elseif Door_Open == 1 then
			ShowT = ShowT +1
			if lua_ACuseRealZoneID( OwnerID() ) then
				SetWorldVar( "SC_BLACKWATER_P3_TIME" , Door_Time-1 )
			end
			if Open_Flag == 0 then
				SetPlot( CrackID , "collision" , "cl_AC1_WB_InDoor" , 30 )
				Var_AC1_NpcGlobal_PH3[6] = cl_ObjShowNpc( 120201 , 781060 , 60 )	--莫門
				Old_Magic_Npc =Var_AC1_NpcGlobal_PH3[6]
				CastSpelllv ( Old_Magic_Npc , Old_Magic_Npc , 498925 , 0 )
				Open_Flag = 1
			end
			if ShowT%3 == 0 then
				CastSpelllv ( Old_Magic_Npc , Old_Magic_Npc , 498925 , 0 )
				ShowT = 0
			end
			if Door_Time == Door_Time_Table[1] then
				if lua_ACuseRealZoneID( OwnerID() ) then
					if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
						RunningMsgEx( MainCtrl , 2 , 3 , String_Table["ReadyDoor"]  )
					end
				end
			elseif Door_Time == Door_Time_Table[2] then
				if lua_ACuseRealZoneID( OwnerID() ) then
					if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
						RunningMsgEx( MainCtrl , 2 , 3 , String_Table["CloseDoor"]  )
					end
					SetWorldVar( "SC_BLACKWATER_P3_OPENDOOR" , 2 )	-- 字串、值
				end
			end
		elseif Door_Open == 2 then
			SetPlot( CrackID , "collision" , "" , 0 )
			WriteRoleValue ( MainCtrl , EM_RoleValue_Register1 , 5 ) 
			sleep ( 50 )
			Cl_Change_Light_On()
			if lua_ACuseRealZoneID( OwnerID() ) then
				Times = Times + Door_Time --3天+剩餘時間
				Lua_Zone2_WorldPE_SetEnd( Times )
			end
			for ObjNum , ObjID in pairs( Var_AC1_NpcGlobal_PH3 ) do
				delobj ( ObjID )
			end
		elseif Door_Open == 3 then
			if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
				RunningMsgEx( MainCtrl , 2 , 3 , "[SC_ACWB_BOSS4_DEAD]"  )	--亂渦之地的通道也即將崩毀
			end
			if lua_ACuseRealZoneID( OwnerID() ) then
				SetWorldVar( "SC_BLACKWATER_P3_OPENDOOR" , 2 )	-- 字串、值
			end
			--Lua_Zone2_WorldPE_SetEnd( 60*5 )--設定世界結束倒數(秒)
			--if lua_ACuseRealZoneID( OwnerID() ) then
			--	SetWorldVar( "SC_BLACKWATER_P3_TIME" , Door_Time-1 )	-- 字串、值
			--end
			--say ( MainCtrl , "Door_Time="..Door_Time)
			--if Door_Time == Door_Time_Table[3] then
			--	if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
			--		RunningMsgEx( MainCtrl , 2 , 3 , String_Table["ReadyDoor"]  )
			--	end
			--elseif Door_Time == Door_Time_Table[4] then
			--	if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
			--		RunningMsgEx( MainCtrl , 2 , 3 , String_Table["CloseDoor"]  )
			--	end
			--elseif Door_Time == Door_Time_Table[5] then
			--	if lua_ACuseRealZoneID( OwnerID() ) then
			--		SetWorldVar( "SC_BLACKWATER_P3_OPENDOOR" , 0 )	-- 字串、值
			--		SetWorldVar( "SC_BLACKWATER_P3_TIME" , 0 )	-- 字串、值
			--	end
			--	WriteRoleValue ( MainCtrl , EM_RoleValue_Register1 , 5 ) ---
			--	sleep ( 50 )
			--	Cl_Change_Light_On()
			--	Lua_Zone2_WorldPE_SetEnd( Times )
			--	for ObjNum , ObjID in pairs(DelNpc_Table) do
			--		delobj ( DelNpc_Table[ObjNum] )
			--	end
			--end
		end
	end
end

--進副本194
function cl_AC1_WB_InDoor()
	local Own = OwnerID()
	local PlayerLV = 0
	local PlayerSUBLV = 0
	local ZoneID = 194
	local XX =  267
	local YY = -150 
	local ZZ = -77
	local Dir = 86
	if GetWorldVar( "Zone2_WorldPE_Phase") == 3 then
		if CheckBuff( Own , 622121 ) == false then
			if GetPartyID( Own , -1 ) == 0 then		-----判斷有沒有隊伍
				if ChangeZone( Own , ZoneID , -1 , XX , YY , ZZ , Dir ) then ---飛進去副本的座標
					PlayerLV = ReadRoleValue( Own , EM_RoleValue_LV )					-- 取得玩家等級
					PlayerSUBLV = ReadRoleValue( Own , EM_RoleValue_LV_SUB )				-- 取得玩家副職等級
					DesignLog( Own , ZoneID , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )		-- 紀錄進入人次
				else
					ScriptMessage( Own , Own , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
				end
			elseif GetPartyID( Own , -1 ) ~= 0 then
				if ChangeZone( Own , ZoneID , -1 , XX , YY , ZZ , Dir ) then ---飛進去副本的座標
					PlayerLV = ReadRoleValue( Own , EM_RoleValue_LV )					-- 取得玩家等級
					PlayerSUBLV = ReadRoleValue( Own , EM_RoleValue_LV_SUB )				-- 取得玩家副職等級
					DesignLog( Own , ZoneID , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )		-- 紀錄進入人次
				else
					ScriptMessage( Own , Own , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
				end
			end	
		elseif CheckBuff( Own , 622121 ) == true then
			ScriptMessage( Own , Own , 3 , "[SC_BLACKWATER_BUFF]" , 0 )
		end
	else
		ScriptMessage( Own , Own , 3 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
	end
end

--出副本194
function cl_AC1_WB_OutDoor()
	local Own = OwnerID()
	local ZoneID = 2
	local XX = 2235
	local YY = 59
	local ZZ = 1849
	local Dir = 69
	if ChangeZone( Own, ZoneID , 0 , XX , YY , ZZ , Dir ) then			--出副本後的座標點
	else
		ScriptMessage( Own , Own , 3 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
	end
end
--gm測試用指令，帶入參數0,1,2,3
function Cl_GM_ResetCtarl(ResetCtarl)
	local Own = OwnerID()
	if ResetCtarl < 4 then
		SetWorldVar( "SC_BLACKWATER_P3_OPENDOOR" , ResetCtarl )	-- 字串、值
	else
		say ( Own , "Not" )
	end
end
--gm測試用指令，調整時間用
function Cl_GM_TimeCtarl(Time)
	local Own = OwnerID()
	local Door_Open = GetWorldVar( "SC_BLACKWATER_P3_OPENDOOR" )	-- 世界變數1
	if Door_Open == 0 then
		SetWorldVar( "SC_BLACKWATER_P3_OPENDOOR" , 1 )	-- 字串、值
		SetWorldVar( "SC_BLACKWATER_P3_TIME" , Time )	-- 字串、值
	elseif Door_Open >= 1 then
		SetWorldVar( "SC_BLACKWATER_P3_TIME" , Time )	-- 字串、值	
	end
	local Door_Time = GetWorldVar( "SC_BLACKWATER_P3_TIME" )	-- 世界變數1
	--say ( OwnerID , "Door_Time="..Door_Time )
end
--Call另一個表演
function cl_Call_Show_Npc()
	local ctarlAI = OwnerID()
	local RoomID = ReadRoleValue ( ctarlAI , EM_RoleValue_RoomID )
	local NpcID = {}
	NpcID = { 40 , "Cl_Show_Stage" }
	local Show_ctarlAI = CreateObjByFlag( 105305 , 781060 , NpcID[1] , 1 ) 	--產生魔菇人控制器
		SetModeEx ( Show_ctarlAI , EM_SetModeType_Obstruct, false) 	
		SetModeEx( Show_ctarlAI , EM_SetModeType_Strikback, false)	
		SetModeEx( Show_ctarlAI , EM_SetModeType_Move, false) 	
		SetModeEx( Show_ctarlAI , EM_SetModeType_Searchenemy, false)
		SetModeEx( Show_ctarlAI , EM_SetModeType_Mark, false)		
		SetModeEx( Show_ctarlAI , EM_SetModeType_ShowRoleHead, false) 
		SetModeEx( Show_ctarlAI , EM_SetModeType_Fight, false) 	
		SetModeEx( Show_ctarlAI , EM_SetModeType_NotShowHPMP , false) 
	AddToPartition ( Show_ctarlAI , RoomID ) 				----物件加入場景,例行公事
	WriteRoleValue ( Show_ctarlAI , EM_RoleValue_PID , ctarlAI ) 		---把大中控器記錄到PID中
	BeginPlot( Show_ctarlAI , NpcID[2] , 0 ) ---執行劇情
end
--產生objid在旗子
function cl_ObjShowNpc(ObjID,FlagObjID,FlagID)
	local Own = OwnerID()
	local RoomID = ReadRoleValue ( Own , EM_RoleValue_RoomID )
	local NpcID = CreateObjByFlag( ObjID , FlagObjID , FlagID , 1 ) 
		SetModeEx( NpcID , EM_SetModeType_Searchenemy, false)
		SetModeEx( NpcID , EM_SetModeType_Strikback, false) 
		SetModeEx( NpcID , EM_SetModeType_Fight, false) 
		SetModeEx( NpcID , EM_SetModeType_Mark, false)
		SetModeEx( NpcID , EM_SetModeType_NotShowHPMP , true) 
		SetModeEx( NpcID , EM_SetModeType_HideName , true ) 
	AddToPartition ( NpcID , RoomID ) ----物件加入場景,例行公事
	return NpcID
end
--讓物件移動
function Cl_MoveToFlag( NpcID , FlagObjID , FlagID , ruang , WandR )
	local Own = OwnerID()
	local RoomID = ReadRoleValue ( Own , EM_RoleValue_RoomID )
		MoveToFlagEnabled( NpcID , false ) ---系統內建的路徑關掉
		WriteRoleValue(  NpcID , EM_RoleValue_IsWalk , WandR )
		Hide( NpcID )
		Show( NpcID , RoomID )
		LuaFunc_MoveToFlag( NpcID , FlagObjID , FlagID , ruang )
end
--重置是否跑步
function Cl_MoveToFlag_for(FlagID) 
	local Own = OwnerID()
	local RoomID = ReadRoleValue ( Own , EM_RoleValue_RoomID )
		MoveToFlagEnabled( Own , false ) ---系統內建的路徑關掉
	if ReadRoleValue ( Own , EM_RoleValue_OrgID ) == 120101 then
		WriteRoleValue(  Own , EM_RoleValue_IsWalk , 1 )
	elseif ReadRoleValue ( Own , EM_RoleValue_OrgID ) == 120186 then
		WriteRoleValue(  Own , EM_RoleValue_IsWalk , 0 )
	end
	Hide( Own )
	Show( Own , RoomID )
	LuaFunc_MoveToFlag( Own , 781060 , FlagID , 5 )
end
--劇情表演
function Cl_Police_Npc_Expelled(FlagObjID,FlagID,Police_Npc)
	local ctarlAI = OwnerID()
	local RoomID = ReadRoleValue ( ctarlAI , EM_RoleValue_RoomID )
	local Rand = DW_Rand(4)  ---取隨機TABLE的位置
	local String_Table = {}
		String_Table[1] = "[SC_WBP3_SHOWNPC_POLICE_01]" --抱歉，現在這裡暫時封鎖
		String_Table[2] = "[SC_WBP3_SHOWNPC_POLICE_02]" --很抱歉，現在這裡很危險，請先離開，請你配合
		String_Table[3] = "[SC_WBP3_SHOWNPC_POLICE_03]" --這裡發生了甚麼事情?
		String_Table[4] = "[SC_WBP3_SHOWNPC_POLICE_04]" --到底發生什麼事情了
		String_Table[5] = "[SC_WBP3_SHOWNPC_POLICE_05]" --好像很危險...還是離遠一點...
		String_Table[6] = "[SC_WBP3_SHOWNPC_POLICE_06]" --難怪今天到處都有警備隊的人出沒
		String_Table[7] = "[SC_WBP3_SHOWNPC_POLICE_07]" --真掃興，本來想來許願，希望今年能豐收
		String_Table[8] = "[SC_WBP3_SHOWNPC_POLICE_08]" --離開就離開，有什麼了不起的
	local Flag_Table = {}
		Flag_Table[1] = { 91 , 92 }
		Flag_Table[2] = { 93 , 94 }
		Flag_Table[3] = { 95 , 96 }
		Flag_Table[4] = { 97 , 98 }
	local ObjID = { 120151 , 120193 , 120194 , 120195 }
	local NpcID =  cl_ObjShowNpc( ObjID[Rand] , FlagObjID , Flag_Table[FlagID][1] )
		Cl_MoveToFlag( NpcID , FlagObjID , Flag_Table[FlagID][2] , 0 , 1 )
		PlayMotion ( Police_Npc , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
		say ( Police_Npc , String_Table[1] )
		sleep ( 20 )
		PlayMotion ( NpcID , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
		say ( NpcID , String_Table[3] )
		sleep(20)
		PlayMotion ( Police_Npc , ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )
		say ( Police_Npc , String_Table[2] )
		sleep ( 20 )
		Rand = DW_Rand(5)  ---取隨機TABLE的位置
		PlayMotion ( NpcID , ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )
		say ( NpcID , String_Table[Rand+3] )
		Cl_MoveToFlag( NpcID , FlagObjID , Flag_Table[FlagID][1] , 0 , 1 )
		delobj( NpcID )
end
--產生於旗子
function Cl_CreateObjByFlag(OrgID,FlagOrgID,FlagID,RoomID) ---表演物件用
	local ObjID = CreateObjByFlag( OrgID , FlagOrgID , FlagID , 1 ) 
		SetModeEx ( ObjID , EM_SetModeType_Obstruct, false) 
		SetModeEx( ObjID , EM_SetModeType_Strikback, false) 
		SetModeEx( ObjID , EM_SetModeType_Move, false) 
		SetModeEx( ObjID , EM_SetModeType_Searchenemy, false)
		SetModeEx( ObjID , EM_SetModeType_Mark, false)
		SetModeEx( ObjID , EM_SetModeType_ShowRoleHead, false) 
		SetModeEx( ObjID , EM_SetModeType_Fight, false) 
		SetModeEx( ObjID , EM_SetModeType_NotShowHPMP , false)
	AddToPartition ( ObjID , RoomID ) ----物件加入場景,例行公事
	return ObjID
end
--關閉時鐘
function Cl_ACWB_Clockclose()
	local ZoneID= ReadRoleValue(OwnerID(),EM_RoleValue_ZoneID)-----------------
	if ZoneID ~= 194 then 
		ClockClose( OwnerID())
	end
end
function Cl_ACWB_NotTime()
	ClockClose( OwnerID())
end
--四倍阻擋箱的碰撞劇情
function cl_Open_Clock()
	SetPlot( OwnerID() , "collision" , "Cl_ACWB_ClockOpen" , 30 )
end
function Cl_ACWB_ClockOpen()
	--這邊的ownereid是玩家…可是不知道為啥要pid
	local player = OwnerID()
	local Door_Time = GetWorldVar( "SC_BLACKWATER_P3_TIME" )
	local Door_Open = GetWorldVar( "SC_BLACKWATER_P3_OPENDOOR" )
	--local ctarlAI = ReadRoleValue ( player , EM_RoleValue_PID )
	--local Time_Over = 0
	--if ReadRoleValue ( ctarlAI , EM_RoleValue_Register9 ) ~= 1 or
	if Door_Open == 1 then	-- OpenDoor=1,開門
		ScriptMessage ( player , player , 3 , "[SC_WBP3_SHOWNPC_79]" , 0 )
		--ClockOpen( OwnerID , EM_ClockCheckValue_25 , Door_Time , Door_Time , Time_Over , "Cl_ACWB_Clockclose" , "Cl_ACWB_NotTime" )
		--elseif ReadRoleValue ( ctarlAI , EM_RoleValue_Register9 ) == 1 or
	elseif Door_Open > 1 then	-- OpenDoor=1,開門
		local ZoneID = 2
		local XX = 2235
		local YY = 59
		local ZZ = 1849
		local Dir = 69
		if ChangeZone( player, ZoneID , 0 , XX , YY , ZZ , Dir ) then	--出副本後的座標點		
		else
			ScriptMessage( player , player , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
		end
	end
end
--初始劇情
function cl_Ac1_Blackwater_P3Start()
	local Own = OwnerID() ----我叫做AI
	local RoomID = ReadRoleValue( Own , EM_RoleValue_RoomID ) ----紀錄讀取到的層數
	--DebugMsg( 0 , RoomID , "p-3????" )
	local ObjID = CreateObjByFlag( 120541 , 781060 , 10 , 1 ) ------------產生AC-P3階段控制器
		SetModeEx ( ObjID , EM_SetModeType_Show, false) 
		SetModeEx ( ObjID , EM_SetModeType_Obstruct, false) 
		SetModeEx( ObjID , EM_SetModeType_Strikback, false) 
		SetModeEx( ObjID , EM_SetModeType_Move, false) 
		SetModeEx( ObjID , EM_SetModeType_Searchenemy, false)
		SetModeEx( ObjID , EM_SetModeType_Mark, false)
		SetModeEx( ObjID , EM_SetModeType_ShowRoleHead, false) 
		SetModeEx( ObjID , EM_SetModeType_Fight, false) 
		SetModeEx( ObjID , EM_SetModeType_NotShowHPMP , false) 
	AddToPartition ( ObjID , RoomID ) 
	BeginPlot( ObjID , "cl_Ac1_Blackwater_P3Ai" , 0 ) 
	DebugMsg( 0,0,"AC1,CreatP3Obj,120541")
end
--亂渦之地裂縫
function Cl_ACWB_P2_SHOWItem()
	local Own = OwnerID() ----我叫做AI
	local RoomID = ReadRoleValue( Own , EM_RoleValue_RoomID ) ----紀錄讀取到的層數
	local ObjID = CreateObjByFlag( 120189 , 781060 , 10 , 1 ) ------------產生亂渦之地裂縫
		SetModeEx ( ObjID , EM_SetModeType_Obstruct, false) 	
		SetModeEx( ObjID , EM_SetModeType_Strikback, false) 
		SetModeEx( ObjID , EM_SetModeType_Move, false) 
		SetModeEx( ObjID , EM_SetModeType_Searchenemy, false)
		SetModeEx( ObjID , EM_SetModeType_Mark, false)
		SetModeEx( ObjID , EM_SetModeType_ShowRoleHead, false) 
		SetModeEx( ObjID , EM_SetModeType_Fight, false) 
		SetModeEx( ObjID , EM_SetModeType_NotShowHPMP , false) 
		AddToPartition ( ObjID , RoomID ) ----物件加入場景,例行公事
	BeginPlot( ObjID , "Cl_ACWB_Readword" , 0 ) ---備，如果不是第三階段就刪掉自己
	DebugMsg( 0,0,"AC1,CreatP3Obj,120189")
	return ObjID
end
function Cl_ACWB_Readword()
	local Own = OwnerID() ----我叫做AI
	local wordID = GetWorldVar( "Zone2_WorldPE_Phase" )
	while 1 do
		sleep ( 10 )
		wordID = GetWorldVar( "Zone2_WorldPE_Phase" )
		if wordID == 3 then
			DebugMsg( 0,0,"AC1,DelP3Obj_120189")
			delobj ( Own )
		end
	end
end