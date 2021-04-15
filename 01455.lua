function Event_GuildWarEnd( RoomID , IsAssignment) --公會戰結束獎勵劇情
--	DebugMsg(0,RoomID,"Assignment = "..IsAssignment)
	local Obj
	local Count = SetSearchAllPlayer(RoomID)
	local TeamA = {}
	local TeamB = {}
	local TACount = 1
	local TBCount = 1
	local Winner = 0
	local T1Score = GetGuildWarScore_ByID(RoomID,0) 
	local T2Score = GetGuildWarScore_ByID(RoomID,1)
	if  T1Score > T2Score then
	--	Debuglog(2 , "T1Score = "..T1Score.." T2Score = "..T2Score.." T1 Win.")
		--DebugMsg( 0, RoomID ,"T1Score = "..T1Score.." T2Score = "..T2Score.." T1 Win.")
		Winner = 0
	elseif T2Score > T1Score then
	--	Debuglog(2 , "T1Score = "..T1Score.." T2Score = "..T2Score.." T2 Win.")
		--DebugMsg( 0, RoomID ,"T1Score = "..T1Score.." T2Score = "..T2Score.." T2 Win.")
		Winner = 1
	else
	--	Debuglog(2 , "T1Score = "..T1Score.." T2Score = "..T2Score.." No One Win.")
		--DebugMsg( 0, RoomID ,"T1Score = "..T1Score.." T2Score = "..T2Score.." No One Win.")
		Winner = -1
	end
	local WinnerGifeCount = { }
	local LoseGifeCount = { }
	WinnerGifeCount[1] = {}
	WinnerGifeCount[2] = {}
	WinnerGifeCount[3] = {}

	WinnerGifeCount[1][1] = { 13, 13, 13, 13, 13, 13, 13, 13, 13, 13}
	WinnerGifeCount[1][2] = { 8, 8, 8, 8, 8, 8, 8, 8, 8, 8}
	WinnerGifeCount[1][3] = { 5, 5, 5, 5, 5, 5, 5, 5, 5, 5}
	WinnerGifeCount[1][4] = 2
	WinnerGifeCount[1][5] = 2

	WinnerGifeCount[2][1] = { 1300, 1300, 1300, 1300, 1300, 1300, 1300, 1300, 1300, 1300}
	WinnerGifeCount[2][2] = { 800, 800, 800, 800, 800, 800, 800, 800, 800, 800}
	WinnerGifeCount[2][3] = { 500, 500, 500, 500, 500, 500, 500, 500, 500, 500}
	WinnerGifeCount[2][4] = 200
	WinnerGifeCount[2][5] = 200

	WinnerGifeCount[3][1] = { 5, 5, 5, 5, 5, 5, 5, 5, 5, 5}
	WinnerGifeCount[3][2] = { 3, 3, 3, 3, 3, 3, 3, 3, 3, 3}
	WinnerGifeCount[3][3] = { 2, 2, 2, 2, 2, 2, 2, 2, 2, 2}
	WinnerGifeCount[3][4] = 1
	WinnerGifeCount[3][5] = 1

	LoseGifeCount[1] = {}
	LoseGifeCount[2] = {}
	LoseGifeCount[3] = {}

	LoseGifeCount[1][1] = { 5, 5, 5, 5, 5, 5, 5, 5, 5, 5}
	LoseGifeCount[1][2] = { 3, 3, 3, 3, 3, 3, 3, 3, 3, 3}
	LoseGifeCount[1][3] = { 2, 2, 2, 2, 2, 2, 2, 2, 2, 2}
	LoseGifeCount[1][4] = 1
	LoseGifeCount[1][5] = 1

	LoseGifeCount[2][1] = { 500, 500, 500, 500, 500, 500, 500, 500, 500, 500}
	LoseGifeCount[2][2] = { 300, 300, 300, 300, 300, 300, 300, 300, 300, 300}
	LoseGifeCount[2][3] = { 200, 200, 200, 200, 200, 200, 200, 200, 200, 200}
	LoseGifeCount[2][4] = 100
	LoseGifeCount[2][5] = 100

	LoseGifeCount[3][1] = { 3, 3, 3, 3, 3, 3, 3, 3, 3, 3}
	LoseGifeCount[3][2] = { 2, 2, 2, 2, 2, 2, 2, 2, 2, 2}
	LoseGifeCount[3][3] = { 2, 2, 2, 2, 2, 2, 2, 2, 2, 2}
	LoseGifeCount[3][4] = 1
	LoseGifeCount[3][5] = 1
	--計算總人數TACount、TBCount
	if Count ~= 0 then
		for i = 1 , Count , 1 do
			local ID = GetSearchResult()
			Obj = Role:New( ID )
			if Obj:IsPlayer() == true then
				if GetRoleCampID( ID ) == 7 then
				--	Debuglog(2 , "RoomID = "..RoomID.." TACount = "..TACount.." ID = "..ID)
					TeamA[ID] = ID
					TACount = TACount + 1
				elseif GetRoleCampID( ID ) == 8 then
				--	Debuglog(2 , "RoomID = "..RoomID.." TBCount = "..TBCount.." ID = "..ID)
					TeamB[ID] = ID
					TBCount = TBCount + 1
				end
			end
		end
	end
	if GuildWarSetting[RoomID]["MainObj"][3] ~= 0 then
		DelObj(GuildWarSetting[RoomID]["MainObj"][3])
	end
	if GuildWarSetting[RoomID]["MainObj"][4] ~= 0 then
		DelObj(GuildWarSetting[RoomID]["MainObj"][4])
	end
	--檢查是否為指定對戰，若是則給予獎勵品的流程直接跳過
	--[[
	local TypeNM ={10,10,10};
	local GuildWar_AssignmentBattle=function(TypeNM,TeamTable,WinnerGifeCount,LoseGifeCount,RoomID,TeamID,IfWin)
	--	DebugMsg(0,RoomID,"GuildWar_AssignmentBattle");
		local Total = 0
		SortList_Reset();
		for SN,ID in pairs(TeamTable) do
			Temp = ID;
			local SortValue = GetGuildWarPlayerValue( ID ,4 )*1000
			SortList_Push( ID , SortValue )
			Total = Total + 1
		end
		if	Total<=0	then
			return;
		end
		SortList_Sort();
		for Lv=1,table.getn(TypeNM) do
			local Num
			--一次檢查一個段落
			if	Total>TypeNM[Lv]	then
				Num = TypeNM[Lv]
			else
				Num = Total
			end
			for SN=1,Num do
				local ID = SortList_Get();
				table.remove(TeamTable , ID)
				local IDScore = GetGuildWarPlayerValue( ID ,4 )
			--	DebugMsg(0,RoomID,ID..":"..IDScore)
				--發出獎勵清單
				SendGuildWarFinalScore ( RoomID , ReadRoleValue(ID,EM_RoleValue_DBID) , EM_GuildWar_ScoreType1 , IDScore , (  (Lv-1)*TypeNM[Lv]  )+SN )
			end
			Total = Total - Num;
			if	Total==0	then
			--	DebugMsg(0,RoomID,"SortList_Reset");
				SortList_Reset();
				return;
			end
		end
		local Consolation = table.getn(TypeNM)+1;
		local RemainPlayer;
		for SN=1,Total,1 do
			RemainPlayer=SortList_Get();
			local IDScore = GetGuildWarPlayerValue( RemainPlayer ,4 )
			SendGuildWarFinalScore ( RoomID , ReadRoleValue(RemainPlayer,EM_RoleValue_DBID) , EM_GuildWar_ScoreType1 , IDScore , ( (Consolation-1) * TypeNM[#TypeNM] ) +SN )
		end
	--	DebugMsg(0,RoomID,"SortList_Reset");
		SortList_Reset();
	end
	--]]
	if IsAssignment == 1 then
		--[[
		if	Winner==0	then
			GuildWar_AssignmentBattle(TypeNM,TeamA,WinnerGifeCount,LoseGifeCount,RoomID,"TeamA",0);
			GuildWar_AssignmentBattle(TypeNM,TeamB,WinnerGifeCount,LoseGifeCount,RoomID,"TeamB",1);
		elseif	Winner==1	then
			GuildWar_AssignmentBattle(TypeNM,TeamA,WinnerGifeCount,LoseGifeCount,RoomID,"TeamA",1);
			GuildWar_AssignmentBattle(TypeNM,TeamB,WinnerGifeCount,LoseGifeCount,RoomID,"TeamB",0);
		else
			GuildWar_AssignmentBattle(TypeNM,TeamA,WinnerGifeCount,LoseGifeCount,RoomID,"TeamA",0);
			GuildWar_AssignmentBattle(TypeNM,TeamB,WinnerGifeCount,LoseGifeCount,RoomID,"TeamB",0);
		end
		--]]
		return;
	end
	local TypeNM ={10,10,10};
	local GuildWar_Distribution_Benifit = function (TypeNM,TeamTable,WinnerGifeCount,LoseGifeCount,RoomID,TeamID,IfWin)
	--	DebugMsg(0,RoomID,TeamID)
		local Total = 0
		SortList_Reset();
		for SN,ID in pairs(TeamTable) do
			Temp = ID;
		--	Debuglog(2 , "type1 RoomID = "..RoomID.."  "..TeamID.."  = "..ID)
			local SortValue = GetGuildWarPlayerValue( ID ,4 )*1000
		--	Debuglog(2 , "type1 RoomID = "..RoomID.."  "..TeamID.." = "..ID.." SortValue = "..SortValue)
			SortList_Push( ID , SortValue )
			Total = Total + 1
		end
		if	Total<=0	then
			return;
		end
		SortList_Sort();
		for Lv=1,table.getn(TypeNM) do
			local Num
			--一次檢查一個段落
			if	Total>TypeNM[Lv]	then
				Num = TypeNM[Lv]
			else
				Num = Total
			end
			for SN=1,Num do
			--	DebugMsg(0,RoomID,TeamID.."   Lv:"..Lv.."   SN="..SN)
				local ID = SortList_Get();
				if IfWin == 0 then
					CallPlot( ID , "YOYO_GetTokenValue" , 1 , WinnerGifeCount[1][Lv][SN] ) -- 2013.03.22 阿浩：6.0.0 貨幣整合調整				
				--	GiveBodyItem( ID , 206686 , WinnerGifeCount[1][Lv][SN] )	-- 試煉徽章
					Lua_AddHonor( ID , WinnerGifeCount[2][Lv][SN] )
					GiveBodyItem( ID , 206770 , WinnerGifeCount[3][Lv][SN] )	-- 輝煌戰果補給品
				else
					CallPlot( ID , "YOYO_GetTokenValue" , 1 , LoseGifeCount[1][Lv][SN] ) -- 2013.03.22 阿浩：6.0.0 貨幣整合調整
				--	GiveBodyItem( ID , 206686 , LoseGifeCount[1][Lv][SN] )	-- 試煉徽章
					Lua_AddHonor( ID , LoseGifeCount[2][Lv][SN] )
					GiveBodyItem( ID , 206771 , LoseGifeCount[3][Lv][SN] )	-- 再接再厲補給品
				end
				table.remove(TeamTable , ID)
				local IDScore = GetGuildWarPlayerValue( ID ,4 )
				--發出獎勵清單
				SendGuildWarFinalScore ( RoomID , ReadRoleValue(ID,EM_RoleValue_DBID) , EM_GuildWar_ScoreType1 , IDScore , (  (Lv-1)*TypeNM[Lv]  )+SN )
			--	Debuglog(2,"SortList_Get: ID = "..ID.."  SN = "..(  (Lv-1)*TypeNM[Lv]  )+SN.."IDScore: Type"..Lv.."="..IDScore);
			end
			Total = Total - Num;
		--	Debuglog(2 , " TACount = "..Total.." i = "..Lv.." Next One #### ")
			if	Total==0	then
				SortList_Reset();
				return;
			end
		end
		local Consolation = table.getn(TypeNM)+1;
		local RemainPlayer;
	--	DebugMsg(0,RoomID,"Total Remain Num="..Total)
		for SN=1,Total,1 do
		--	DebugMsg(0,RoomID,TeamID.."'s Remain SN="..SN)
			RemainPlayer=SortList_Get();
		--	DebugMsg(0,RoomID,"RemainPlayer="..RemainPlayer)
			if IfWin == 0 then
				CallPlot( RemainPlayer , "YOYO_GetTokenValue" , 1 , WinnerGifeCount[1][Consolation] ) -- 2013.03.22 阿浩：6.0.0 貨幣整合調整
			--	GiveBodyItem( RemainPlayer , 206686 , WinnerGifeCount[1][Consolation] );	-- 試煉徽章
				Lua_AddHonor( RemainPlayer , WinnerGifeCount[2][Consolation] );
				GiveBodyItem( RemainPlayer , 206770 , WinnerGifeCount[3][Consolation] );	-- 輝煌戰果補給品
			else
				CallPlot( RemainPlayer , "YOYO_GetTokenValue" , 1 , LoseGifeCount[1][Consolation] ) -- 2013.03.22 阿浩：6.0.0 貨幣整合調整
			--	GiveBodyItem( RemainPlayer , 206686 , LoseGifeCount[1][Consolation] );	-- 試煉徽章
				Lua_AddHonor( RemainPlayer , LoseGifeCount[2][Consolation] );
				GiveBodyItem( RemainPlayer , 206771 , LoseGifeCount[3][Consolation] );	-- 再接再厲補給品
			end
			local IDScore = GetGuildWarPlayerValue( RemainPlayer ,4 )
			SendGuildWarFinalScore ( RoomID , ReadRoleValue(RemainPlayer,EM_RoleValue_DBID) , EM_GuildWar_ScoreType1 , IDScore , ( (Consolation-1) * TypeNM[#TypeNM] ) +SN )
		end
		SortList_Reset();
	end
	if	Winner==0	then
		GuildWar_Distribution_Benifit(TypeNM,TeamA,WinnerGifeCount,LoseGifeCount,RoomID,"TeamA",0);
		GuildWar_Distribution_Benifit(TypeNM,TeamB,WinnerGifeCount,LoseGifeCount,RoomID,"TeamB",1);
	elseif	Winner==1	then
		GuildWar_Distribution_Benifit(TypeNM,TeamA,WinnerGifeCount,LoseGifeCount,RoomID,"TeamA",1);
		GuildWar_Distribution_Benifit(TypeNM,TeamB,WinnerGifeCount,LoseGifeCount,RoomID,"TeamB",0);
	else
		GuildWar_Distribution_Benifit(TypeNM,TeamA,WinnerGifeCount,LoseGifeCount,RoomID,"TeamA",0);
		GuildWar_Distribution_Benifit(TypeNM,TeamB,WinnerGifeCount,LoseGifeCount,RoomID,"TeamB",0);
	end
end
--小據點佔領劇情
function Lua_GUILDWAR_StealCrystal()
	local	ObjCampID	= GetRoleCampID( TargetID() );
	local 	ObjID  		= 0;
	local 	CastResult	= 0;
	local	RoomID	= ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ); 
	local	LandMarkID	= ReadRoleValue( TargetID(), EM_RoleValue_PID );
	local	Register	= ReadRoleValue( TargetID(), EM_RoleValue_Register1 );
	local	RegisterO = ReadRoleValue( OwnerID(), EM_RoleValue_Register1 );
	local	PlayerCampID	= GetRoleCampID( OwnerID() );
	local E_Count = GuildWarSetting[RoomID]["building"][2] --能源汲取量
	local E_Time = GuildWarSetting[RoomID]["building"][1] --能源汲取時間
	local RE_Count = GuildWarSetting[RoomID]["building"][3]	--【汲取能源】獲得戰績數量
	---*---以下判斷玩家是否有學習技術
	local SetA = -1
	local SetB = -1	
	local SetC = -1			
	local Count = BuffCount ( OwnerID())

	for i = 0 , Count do

		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID ) -- 基本法術ID
		if BuffID == 505309 then--萃取技術：能源汲取量加強
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )--該建築第 j 個BUFF的等級
			SetA = BuffLv

		elseif BuffID == 505310 then--提煉技術：能源汲取速度加強
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )
			SetB = BuffLv

		elseif BuffID == 505318 then--戰術知識：汲取能源時獲得之戰績量
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )
			SetC = BuffLv
		end
	end
	if SetA>-1 then -- 表示有修煉此技能
		E_Count = E_Count+(SetA+1)
	end
	if SetB>-1 then -- 表示有修煉此技能
		E_Time = E_Time-((SetB+1)*10)
	end
	if SetC>-1 then -- 表示有修煉此技能
		RE_Count = RE_Count+((SetC+1)*2)
	end
	if ObjCampID == PlayerCampID then	--同陣營 汲取能量劇情
		if GuildWarSetting[RoomID]["energy"][LandMarkID] > 0 then
			ScriptMessage( OwnerID(), OwnerID(), 0, GuildWarSetting[RoomID]["energy"][LandMarkID].." / 5000 " , 0 );
			if BeginCastBarEvent( OwnerID(), OwnerID(),"[SC_YU_GUILDWAR_BUILD_37]", E_Time, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "Lua_GUILDWAR_CraftCastCheck" ) ~= 1 then
				ScriptMessage( OwnerID(), OwnerID(), 0,"[SAY_NPC_BUSY]", 0 );--目標忙碌中
				return
			else
				WriteRoleValue(OwnerID(), EM_RoleValue_Register5, 1 )--轉為施法中狀態
				for i = 1 , (E_Time / 10) do
					if ReadRoleValue(OwnerID(),EM_RoleValue_Register5) ~=1 then
						break
					end
					Sleep(10)
				end
				Sleep(5)
				if ReadRoleValue(OwnerID(),EM_RoleValue_Register5) == 2 then
					GuildWarSetting[RoomID]["energy"][LandMarkID] = GuildWarSetting[RoomID]["energy"][LandMarkID] - E_Count
					AddGuildWarEnergy( OwnerID() , E_Count )
					AddGuildWarPlayerValue( OwnerID(), 5 , E_Count )	--記錄能源取得
					local Raa = Rand(100)
					if Raa > 39 then
						local RARR = Rand(2)+1
						RE_Count = RE_Count + RARR
						AddGuildWarPlayerValue( OwnerID() ,4 , RE_Count )--記錄戰績取得
						GiveBodyItem( OwnerID() , 206685 , RE_Count )
					else
						AddGuildWarPlayerValue( OwnerID() ,4 , RE_Count )--記錄戰績取得
						GiveBodyItem( OwnerID() , 206685 , RE_Count )						
					end
					local GGEnergy = GetGuildWarEnergy(OwnerID())
					local FullKey 		= "[SC_YU_GUILDWAR_BUILD_57]"
					ScriptMessage( OwnerID(), OwnerID(), 0, FullKey , 0 );
					ScriptMessage( OwnerID(), OwnerID(), 1, FullKey , 0 );
					BeginPlot( TargetID() , "Lua_GUILDWAR_StealCrystal_CONN" , 0)	--重複汲取能量
				end
			end
		else
			ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_YU_GUILDWAR_BUILD_55]" , 0 );
		end
	elseif  ObjCampID ~= PlayerCampID then	--不同陣營 搶奪劇情
		if Register == 0 and RegisterO == 0 then
			WriteRoleValue(TargetID(), EM_RoleValue_Register1,1 )
			WriteRoleValue(OwnerID(), EM_RoleValue_Register1,TargetID() )
			if BeginCastBarEvent( OwnerID(), TargetID(),"[SC_YU_GUILDWAR_BUILD_38]", 150, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "Lua_GUILDWAR_StealCastCheck" ) ~= 1 then
				ScriptMessage( OwnerID(), OwnerID(), 0,"[SAY_NPC_BUSY]", 0 );--目標忙碌中
				return
			else
				WriteRoleValue(OwnerID(), EM_RoleValue_Register5, 1 )--轉為施法中狀態
				-- 2012.06.11 阿浩：修正玩家占領敵方能量之源(114335、114336)時，在遊戲不正常關閉的情況下，會導致該據點永久無法佔領，並顯示目標正在忙碌中的問題。
				CallPlot( TargetID() , "Lua_Hao_GUILDWAR_CheckPlayer" , OwnerID() )
				--	
				for i = 1 , 5 do
					if( ReadRoleValue(OwnerID(),EM_RoleValue_Register5) == 1 ) then 
						if( PlayerCampID == 8 ) then
							local  EnemyGuildName =  "|cffff3232"..GetGuildName_ByID( RoomID , ((CrystalOwn[RoomID][LandMarkID]+1)%2+1)%2 ).."|r"
							local PlayerName 	= "|cffff3232"..GetName( OwnerID() ).."|r"
							local FullKey 		= "[SC_YU_GUILDWAR_BUILD_47]" .. "[$SETVAR1=[GUILDWAR_LANDMARK_NAME_" .. LandMarkID .. "] ][$SETVAR2="..EnemyGuildName.."][$SETVAR3=" .. PlayerName .. "]"
							ScriptMessage( OwnerID(), -1, 0, FullKey , 0 );
							ScriptMessage( OwnerID(), -1, 2, FullKey , 0 );
						else
							local  EnemyGuildName =  "|cff00ffff"..GetGuildName_ByID( RoomID , ((CrystalOwn[RoomID][LandMarkID]+1)%2+1)%2 ).."|r"
							local PlayerName 	= "|cff00ffff"..GetName( OwnerID() ).."|r"
							local FullKey 		= "[SC_YU_GUILDWAR_BUILD_47]" .. "[$SETVAR1=[GUILDWAR_LANDMARK_NAME_" .. LandMarkID .. "] ][$SETVAR2="..EnemyGuildName.."][$SETVAR3=" .. PlayerName .. "]"
							ScriptMessage( OwnerID(), -1, 0, FullKey , 0 );
							ScriptMessage( OwnerID(), -1, 2, FullKey , 0 );
						end
						Sleep(30)
					else
						break
					end
				end
				Sleep(5)
				if( ReadRoleValue(OwnerID(),EM_RoleValue_Register5) == 2 ) then 
					local 	CampID		= GetRoleCampID( TargetID() );
					local 	TeamID 		= GetTeamID( OwnerID() );
					local 	OrgID 		= ReadRoleValue( TargetID(), EM_RoleValue_OrgID );
						if( PlayerCampID == 8 ) then 
							-- TEAM 2, 紅隊
							SetRoleCampID( TargetID(), PlayerCampID );
							ChangeObjID( TargetID(), 114335 );	-- TEAM 1 RED
						else
							-- TEAM 1, 籃隊
							SetRoleCampID( TargetID(), PlayerCampID );
							ChangeObjID( TargetID(), 114336 );	-- TEAM 2 BLUE
						end
						local pX = ReadRoleValueFloat(TargetID(),EM_RoleValue_X)
						local pY = ReadRoleValueFloat(TargetID(),EM_RoleValue_Y)
						local pZ = ReadRoleValueFloat(TargetID(),EM_RoleValue_Z)
						local pName = "GUILDWAR_LANDMARK_NAME_" ..LandMarkID
						if( PlayerCampID == 8 ) then
							local  EnemyGuildName =  "|cffff3232"..GetGuildName_ByID( RoomID , ((CrystalOwn[RoomID][LandMarkID]+1)%2+1)%2 ).."|r"
							local PlayerName 	= "|cffff3232"..GetName( OwnerID() ).."|r"
							local FullKey 		= "[SC_YU_GUILDWAR_BUILD_48]" .. "[$SETVAR1=[GUILDWAR_LANDMARK_NAME_" .. LandMarkID .. "] ][$SETVAR2="..EnemyGuildName.."][$SETVAR3=" .. PlayerName .. "]"
							
							ScriptMessage( OwnerID(), -1, 0, FullKey , 0 );
							ScriptMessage( OwnerID(), -1, 2, FullKey , 0 );
							local Score = GuildWarSetting[RoomID]["Kill"][3]
							local NearPlayer = SearchRangePlayer(OwnerID(),200)	--搜尋周圍玩家
							local PeopleCount =  table.getn(NearPlayer)
							for i = 0 , table.getn(NearPlayer)-1 do
								if GetRoleCampID( OwnerID() ) ~= GetRoleCampID( NearPlayer[i] ) then
									PeopleCount = PeopleCount - 1
								end
							end
							Score = math.ceil(Score/PeopleCount)
							for i=0,table.getn(NearPlayer)-1 do
								if GetRoleCampID( OwnerID() ) == GetRoleCampID( NearPlayer[i] ) then
									AddGuildWarPlayerValue( NearPlayer[i] ,4 , Score )--記錄戰績取得
									GiveBodyItem( NearPlayer[i] , 206685 , Score )--給予戰績
								end
							end
							AddGuildWarPlayerValue( OwnerID(), 6 , 1 )	--記錄佔領據點
							AddGuildWarScore( OwnerID() , 1000 )
							CrystalOwn[RoomID][LandMarkID] = 2
							SetMapMark ( RoomID , LandMarkID-1 , pX , pY , pZ , pName , 58 )
							DelObj(GuildWarSetting[RoomID]["FlagID"][LandMarkID][1])
							DelObj(GuildWarSetting[RoomID]["FlagID"][LandMarkID][2])
							DelObj(GuildWarSetting[RoomID]["Guard"][LandMarkID][1])
							DelObj(GuildWarSetting[RoomID]["Guard"][LandMarkID][2])
							DelObj(GuildWarSetting[RoomID]["Guard"][LandMarkID][3])
						else
							local  EnemyGuildName =  "|cff00ffff"..GetGuildName_ByID( RoomID , ((CrystalOwn[RoomID][LandMarkID]+1)%2+1)%2 ).."|r"
							local PlayerName 	= "|cff00ffff"..GetName( OwnerID() ).."|r"
							local FullKey 		= "[SC_YU_GUILDWAR_BUILD_48]" .. "[$SETVAR1=[GUILDWAR_LANDMARK_NAME_" .. LandMarkID .. "] ][$SETVAR2="..EnemyGuildName.."][$SETVAR3=" .. PlayerName .. "]"
							ScriptMessage( OwnerID(), -1, 0, FullKey , 0 );
							ScriptMessage( OwnerID(), -1, 2, FullKey , 0 );
							local Score = GuildWarSetting[RoomID]["Kill"][3]
							local NearPlayer = SearchRangePlayer(OwnerID(),200)	--搜尋周圍玩家
							local PeopleCount =  table.getn(NearPlayer)
							for i = 0 , table.getn(NearPlayer)-1 do
								if GetRoleCampID( OwnerID() ) ~= GetRoleCampID( NearPlayer[i] ) then
									PeopleCount = PeopleCount - 1
								end
							end
							Score = math.ceil(Score/PeopleCount)
							for i=0,table.getn(NearPlayer)-1 do
								if GetRoleCampID( OwnerID() ) == GetRoleCampID( NearPlayer[i] ) then
									AddGuildWarPlayerValue( NearPlayer[i] ,4 , Score )--記錄戰績取得
									GiveBodyItem( NearPlayer[i] , 206685 , Score )--給予戰績
								end
							end
							AddGuildWarPlayerValue( OwnerID(), 6 , 1 )	--記錄佔領據點
							AddGuildWarScore( OwnerID() , 1000 )
							CrystalOwn[RoomID][LandMarkID] = 1
							SetMapMark ( RoomID , LandMarkID-1 , pX , pY , pZ , pName , 59 )
							DelObj(GuildWarSetting[RoomID]["FlagID"][LandMarkID][1])
							DelObj(GuildWarSetting[RoomID]["FlagID"][LandMarkID][2])
							DelObj(GuildWarSetting[RoomID]["Guard"][LandMarkID][1])
							DelObj(GuildWarSetting[RoomID]["Guard"][LandMarkID][2])
							DelObj(GuildWarSetting[RoomID]["Guard"][LandMarkID][3])
						end
					BeginPlot( TargetID() , "LuaZone_GUILDWAR_BuildFlag" , 0)
				end
			end
		else
			ScriptMessage( OwnerID(), OwnerID(), 0, "[SAY_NPC_BUSY]" , 0 );
		end
	end
end
-- 2012.06.11 阿浩：修正玩家占領敵方能量之源(114335、114336)、敵方公會榮譽水晶(113696、113697)時，在遊戲不正常關閉的情況下，會導致該據點永久無法佔領，並顯示目標正在忙碌中的問題。
function Lua_Hao_GUILDWAR_CheckPlayer( Player )

	local Time = 0
	local Npc = OwnerID()
	local Status
	
	while Time < 30 do
		Status = ReadRoleValue( Player , EM_RoleValue_Register5 )
		if CheckID( Player ) == false or Status ~= 1 then
			WriteRoleValue( Npc , EM_RoleValue_Register1 , 0 )
			break
		end
		Time = Time + 1
		sleep(5)
	end
end

function Lua_GUILDWAR_CraftCastCheck(ObjID, CheckStatus)   -- 同陣營施法檢測
	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			-- 成功
			WriteRoleValue(OwnerID(), EM_RoleValue_Register5, 2 )--成功師法狀態
			WriteRoleValue(TargetID(), EM_RoleValue_Register1,0 )
			EndCastBar( OwnerID(), CheckStatus );
		else
			-- 失敗
			WriteRoleValue(OwnerID(), EM_RoleValue_Register5, 0 )--清除施法狀態
			WriteRoleValue(TargetID(), EM_RoleValue_Register1,0 )
			EndCastBar( OwnerID(), CheckStatus );
		end
	end
end
function Lua_GUILDWAR_StealCastCheck(ObjID, CheckStatus)   -- 小據點施法檢測
	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			-- 成功
			WriteRoleValue(OwnerID(), EM_RoleValue_Register5, 2 )--成功師法狀態
			WriteRoleValue(TargetID(), EM_RoleValue_Register1,0 )
			WriteRoleValue(OwnerID(), EM_RoleValue_Register1,0 )
			EndCastBar( OwnerID(), CheckStatus );
		else
			-- 失敗
			WriteRoleValue(OwnerID(), EM_RoleValue_Register5, 0 )--清除施法狀態
			WriteRoleValue(TargetID(), EM_RoleValue_Register1,0 )
			WriteRoleValue(OwnerID(), EM_RoleValue_Register1,0 )
			EndCastBar( OwnerID(), CheckStatus );
		end
	end
end
--大據點搶奪劇情
function Lua_GUILDWAR_StealMainCrystal()
	local	RoomID	= ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local	LandMarkID	= ReadRoleValue( TargetID(), EM_RoleValue_PID );
	local	PlayerCampID	= GetRoleCampID( OwnerID() );
	local	ObjCampID	= GetRoleCampID( TargetID() );
	local 	OrgID 		= ReadRoleValue( TargetID(), EM_RoleValue_OrgID );
	local	Register	= ReadRoleValue( TargetID(), EM_RoleValue_Register1 );
	local	RegisterO = ReadRoleValue( OwnerID(), EM_RoleValue_Register1 );
	local pX = ReadRoleValueFloat(TargetID(),EM_RoleValue_X)
	local pY = ReadRoleValueFloat(TargetID(),EM_RoleValue_Y)
	local pZ = ReadRoleValueFloat(TargetID(),EM_RoleValue_Z)
	local pName =	"SC_YU_GUILDWAR_BUILD_50"
	if  ObjCampID == PlayerCampID then	--同陣營 廣播
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_YU_GUILDWAR_BUILD_53]" , 0 );
	elseif  ObjCampID ~= PlayerCampID then	--不同陣營 搶奪劇情
		if Register == 0 and RegisterO == 0 then
			WriteRoleValue(TargetID(), EM_RoleValue_Register1,1 )
			WriteRoleValue(OwnerID(), EM_RoleValue_Register1,TargetID() )
			if BeginCastBarEvent( OwnerID(), TargetID(),"[SC_YU_GUILDWAR_BUILD_38]", 150, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "Lua_GUILDWAR_StealMainCastCheck" ) ~= 1 then
				ScriptMessage( OwnerID(), OwnerID(), 0,"[SAY_NPC_BUSY]", 0 );--目標忙碌中
				return
			else
				WriteRoleValue(OwnerID(), EM_RoleValue_Register5, 1 )--轉為施法中狀態
				-- 2012.06.11 阿浩：修正玩家占領敵方公會榮譽水晶(113696、113697)時，在遊戲不正常關閉的情況下，會導致該據點永久無法佔領，並顯示目標正在忙碌中的問題。
				CallPlot( TargetID() , "Lua_Hao_GUILDWAR_CheckPlayer" , OwnerID() )
				--
				for i = 1 , 5 do
					if( ReadRoleValue(OwnerID(),EM_RoleValue_Register5) == 1 ) then 
						if( PlayerCampID == 8 ) then
							local  EnemyGuildName =  "|cffff3232"..GetGuildName_ByID( RoomID , ((CrystalOwn[RoomID][LandMarkID]+1)%2+1)%2 ).."|r"
							local  GuildName =  "|cff00ffff"..GetGuildName_ByID( RoomID , CrystalOwn[RoomID][LandMarkID]-1 ).."|r"
							local PlayerName 	= "|cff00ffff"..GetName( TargetID() ).."|r"--玩家
							local FullKey 		= "[SC_YU_GUILDWAR_BUILD_76]" .. "[$SETVAR1="..GuildName.."][$SETVAR2="..PlayerName.."][$SETVAR3=" .. EnemyGuildName .. "]"
							ScriptMessage( OwnerID(), -1, 0, FullKey , 0 );
							ScriptMessage( OwnerID(), -1, 2, FullKey , 0 );
						else
							local  EnemyGuildName =  "|cff00ffff"..GetGuildName_ByID( RoomID , ((CrystalOwn[RoomID][LandMarkID]+1)%2+1)%2 ).."|r"
							local  GuildName =  "|cffff3232"..GetGuildName_ByID( RoomID , CrystalOwn[RoomID][LandMarkID]-1 ).."|r"
							local PlayerName 	= "|cff00ffff"..GetName( TargetID() ).."|r"--玩家
							local FullKey 		= "[SC_YU_GUILDWAR_BUILD_76]" .. "[$SETVAR1="..GuildName.."][$SETVAR2="..PlayerName.."][$SETVAR3=" .. EnemyGuildName .. "]"
							ScriptMessage( OwnerID(), -1, 0, FullKey , 0 );
							ScriptMessage( OwnerID(), -1, 2, FullKey , 0 );
						end
						Sleep(30)
					else
						break
					end
				end
				Sleep(5)
				if ReadRoleValue(OwnerID(),EM_RoleValue_Register5) == 2 then
					local pX = ReadRoleValueFloat(TargetID(),EM_RoleValue_X)
					local pY = ReadRoleValueFloat(TargetID(),EM_RoleValue_Y)
					local pZ = ReadRoleValueFloat(TargetID(),EM_RoleValue_Z)
					local pName = "SC_YU_GUILDWAR_BUILD_50"
					local EnemyGuildName
					local GuildName
					local PlayerName 
					local FullKey
					local CampID		= GetRoleCampID( TargetID() );
					local TeamID 		= GetTeamID( OwnerID() );
					local OrgID 		= ReadRoleValue( TargetID(), EM_RoleValue_OrgID );
					local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
					local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
					if( PlayerCampID == 8 ) then 
						EnemyGuildName =  "|cffff3232"..GetGuildName_ByID( RoomID , ((CrystalOwn[RoomID][LandMarkID]+1)%2+1)%2 ).."|r"
						local orgid = ReadRoleValue( TargetID(),EM_RoleValue_OrgID)
						PlayerName 	= "|cff00ffff".."["..orgid.."]".."|r"
						GuildName  =  "|cff00ffff"..GetGuildName_ByID( RoomID , CrystalOwn[RoomID][LandMarkID]-1 ).."|r"
						FullKey 		= "[SC_YU_GUILDWAR_BUILD_49]" .. "[$SETVAR1="..GuildName.."][$SETVAR2="..PlayerName.."][$SETVAR3=" .. EnemyGuildName .. "]"
						-- TEAM 2, 紅隊
						SetRoleCampID( TargetID(), PlayerCampID );
						ChangeObjID( TargetID(), 113696 );	-- TEAM 1 RED
						local GuildID = ReadRoleValue(OwnerID(),EM_RoleValue_GuildID)
						WriteRoleValue(GuildWarSetting[RoomID]["MainObj"][1] , EM_RoleValue_GuildID,GuildID)
						if GuildWarSetting[RoomID]["MainObj"][4] ~= 0 and ReadRoleValue( TargetID(), EM_RoleValue_Register9 ) == 2 then
							DelObj(GuildWarSetting[RoomID]["MainObj"][4])
							GuildWarSetting[RoomID]["MainObj"][4] = 0
							--奪回成功
							if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
								RunningMsg( OwnerID() , 3 , "[SC_YU_GUILDWAR_BUILD_85][$SETVAR1="..EnemyGuildName.."][$SETVAR2="..PlayerName.."]" ) --奪回
							end
							BeginPlot( TargetID() , "Lua_GUILDWAR_WinnerClockStop" , 0)	--關閉計時
						else
							BeginPlot( TargetID() , "Lua_GUILDWAR_WinnerClock" , 0)	--啟動世界奇觀
						end
					else
						EnemyGuildName =  "|cff00ffff"..GetGuildName_ByID( RoomID , ((CrystalOwn[RoomID][LandMarkID]+1)%2+1)%2 ).."|r"
						local orgid = ReadRoleValue( TargetID(),EM_RoleValue_OrgID)
						PlayerName 	= "|cffff3232".."["..orgid.."]".."|r"
						GuildName  =  "|cffff3232"..GetGuildName_ByID( RoomID , CrystalOwn[RoomID][LandMarkID]-1 ).."|r"
						FullKey 		= "[SC_YU_GUILDWAR_BUILD_49]" .. "[$SETVAR1="..GuildName.."][$SETVAR2="..PlayerName.."][$SETVAR3=" .. EnemyGuildName .. "]"
						-- TEAM 1, 籃隊
						SetRoleCampID( TargetID(), PlayerCampID );
						ChangeObjID( TargetID(), 113697 );	-- TEAM 2 BLUE
						local GuildID = ReadRoleValue(OwnerID(),EM_RoleValue_GuildID)
						WriteRoleValue(GuildWarSetting[RoomID]["MainObj"][2] , EM_RoleValue_GuildID,GuildID)
						if GuildWarSetting[RoomID]["MainObj"][3] ~= 0 and ReadRoleValue( TargetID(), EM_RoleValue_Register9 ) == 1 then
							DelObj(GuildWarSetting[RoomID]["MainObj"][3])
							GuildWarSetting[RoomID]["MainObj"][3] = 0
							--奪回成功
							if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
								RunningMsg( OwnerID() , 3 , "[SC_YU_GUILDWAR_BUILD_85][$SETVAR1="..EnemyGuildName.."][$SETVAR2="..PlayerName.."]" ) --奪回
							end
							BeginPlot( TargetID() , "Lua_GUILDWAR_WinnerClockStop" , 0)	--關閉計時
						else
							BeginPlot( TargetID() , "Lua_GUILDWAR_WinnerClock" , 0)	--啟動世界奇觀
						end
					end
					ScriptMessage( OwnerID(), -1, 0, FullKey , 0 );
					ScriptMessage( OwnerID(), -1, 2, FullKey , 0 );
					local Score = GuildWarSetting[RoomID]["Kill"][4]
					local NearPlayer = SearchRangePlayer(OwnerID(),200)	--搜尋周圍玩家
					local PeopleCount =  table.getn(NearPlayer)
					for i = 0 , table.getn(NearPlayer)-1 do
						if GetRoleCampID( OwnerID() ) ~= GetRoleCampID( NearPlayer[i] ) then
							PeopleCount = PeopleCount - 1
						end
					end
					Score = math.ceil(Score/PeopleCount)
					--DebugMsg( 0, RoomID ,"PeopleCount = "..PeopleCount.." Same Camp.")
					for i=0,table.getn(NearPlayer)-1 do
						if GetRoleCampID( OwnerID() ) == GetRoleCampID( NearPlayer[i] ) then
							AddGuildWarPlayerValue( NearPlayer[i] ,4 , Score )--記錄戰績取得
							GiveBodyItem( NearPlayer[i] , 206685 , Score )--給予戰績
						end
					end
					AddGuildWarPlayerValue( OwnerID(), 6 , 1 )	--記錄佔領據點
					AddGuildWarScore( OwnerID() , 2000 )
					if( PlayerCampID == 8 ) then
						SetMapMark ( RoomID , LandMarkID-1 , pX , pY , pZ , pName , 58 )
						CrystalOwn[RoomID][LandMarkID] = 2
					else
						SetMapMark ( RoomID , LandMarkID-1 , pX , pY , pZ , pName , 59 )
						CrystalOwn[RoomID][LandMarkID] = 1
					end
					WriteRoleValue(OwnerID(), EM_RoleValue_Register5, 0 )--清除施法狀態
				end
			end
		else
			ScriptMessage( OwnerID(), OwnerID(), 0, "[SAY_NPC_BUSY]" , 0 );
		end
	end
end

function Lua_GUILDWAR_CrystalRange()	--小據點範圍劇情
	local LandMarkID = ReadRoleValue( TargetID(), EM_RoleValue_PID );
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
--	DebugMsg( 0, RoomID ,"-[GUILDWAR_LANDMARK_NAME_" .. LandMarkID .. "]-".." LandMarkID = "..LandMarkID)
	if CrystalOwn[RoomID][LandMarkID] == 1 then
		ScriptMessage( OwnerID(), OwnerID(), 2, ":+:  [GUILDWAR_LANDMARK_NAME_" .. LandMarkID .. "]  :+:" , "0xff00c3ff" );
	elseif CrystalOwn[RoomID][LandMarkID] == 2 then
		ScriptMessage( OwnerID(), OwnerID(), 2, ":+:  [GUILDWAR_LANDMARK_NAME_" .. LandMarkID .. "]  :+:" , "0xffff3232" );
	else
		ScriptMessage( OwnerID(), OwnerID(), 2, ":+:  [GUILDWAR_LANDMARK_NAME_" .. LandMarkID .. "]  :+:" , "0xffffffff" );
	end
end

function Lua_GUILDWAR_MainCrystalRange()	--大據點範圍劇情
	local LandMarkID = ReadRoleValue( TargetID(), EM_RoleValue_PID );
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local GuildName = GetGuildName_ByID( RoomID , CrystalOwn[RoomID][LandMarkID]-1 )
--	DebugMsg( 0, RoomID ,"-[GUILDWAR_LANDMARK_NAME_" .. LandMarkID .. "]-".." LandMarkID = "..LandMarkID)
	if CrystalOwn[RoomID][LandMarkID] == 1 then
		ScriptMessage( OwnerID(), OwnerID(), 2, ":+:  "..GuildName.."  :+:" , "0xff00c3ff" );
	elseif CrystalOwn[RoomID][LandMarkID] == 2 then
		ScriptMessage( OwnerID(), OwnerID(), 2, ":+: "..GuildName.."  :+:" , "0xffff3232" );
	else
		ScriptMessage( OwnerID(), OwnerID(), 2, ":+:  "..GuildName.."  :+:" , "0xffffffff" );
	end
end
function Lua_GUILDWAR_StealCrystal_CONN()	--重複汲取能量
	BeginPlot( TargetID() , "Lua_GUILDWAR_StealCrystal" , 0)
end

function Lua_GUILDWAR_GuardDead()	--守衛死亡劇情
	local	RoomID	= ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local	LandMarkID	= ReadRoleValue( OwnerID(), EM_RoleValue_PID );
	local	PlayerCampID	= GetRoleCampID( TargetID() );
	local 	OrgID 		= ReadRoleValue( OwnerID(), EM_RoleValue_OrgID );
	local	Score		= GuildWarSetting[RoomID]["Kill"][5]
	local  EnemyGuildName = GetGuildName_ByID( RoomID , ((CrystalOwn[RoomID][LandMarkID]+1)%2+1)%2 )
	if OrgID == 103314 or OrgID == 103313 then
		Score = GuildWarSetting[RoomID]["Kill"][6]
	end
	if( PlayerCampID == 8 ) then
		local PlayerName 	= "|cffff3232"..GetName( TargetID() ).."|r"
		local FullKey 		= "[SC_YU_GUILDWAR_BUILD_47]" .. "[$SETVAR1=[GUILDWAR_LANDMARK_NAME_" .. LandMarkID .. "]][$SETVAR2="..EnemyGuildName.."][$SETVAR3=" .. PlayerName .. "]"
		ScriptMessage( OwnerID(), -1, 0, FullKey , 0 );
		ScriptMessage( OwnerID(), -1, 2, FullKey , 0 );
		local NearPlayer = SearchRangePlayer(TargetID(),200)	--搜尋周圍玩家
		local PeopleCount =  table.getn(NearPlayer)
		for i = 0 , table.getn(NearPlayer)-1 do
			if GetRoleCampID( TargetID() ) ~= GetRoleCampID( NearPlayer[i] ) then
				PeopleCount = PeopleCount - 1
			end
		end
		Score = math.ceil(Score/PeopleCount)
		for i=0,table.getn(NearPlayer)-1 do
			if GetRoleCampID( TargetID() ) == GetRoleCampID( NearPlayer[i] ) then
				---*---以下判斷玩家是否有學習技術
				local SetA = -1
				local Count = BuffCount ( NearPlayer[i])
				for j = 0 , Count do
					local BuffID = BuffInfo ( NearPlayer[i] , j , EM_BuffInfoType_BuffID ) -- 基本法術ID
					if BuffID == 505317 then--榮譽意志：戰績獲得量加強
						local BuffLv = BuffInfo ( NearPlayer[i] , j , EM_BuffInfoType_Power )--該建築第 j 個BUFF的等級
						SetA = BuffLv
					end
				end
				if SetA>-1 then -- 表示有修煉此技能
					Score = Score+(SetA+1)
				end
				AddGuildWarPlayerValue( NearPlayer[i] ,4 , Score )
				GiveBodyItem( NearPlayer[i] , 206685 , Score )
			end
		end
	elseif ( PlayerCampID == 7 ) then
		local PlayerName 	= "|cff00ffff"..GetName( TargetID() ).."|r"
		local FullKey 		= "[SC_YU_GUILDWAR_BUILD_47]" .. "[$SETVAR1=[GUILDWAR_LANDMARK_NAME_" .. LandMarkID .. "]][$SETVAR2="..EnemyGuildName.."][$SETVAR3=" .. PlayerName .. "]"

		ScriptMessage( OwnerID(), -1, 0, FullKey , 0 );
		ScriptMessage( OwnerID(), -1, 2, FullKey , 0 );
		local NearPlayer = SearchRangePlayer(TargetID(),200)	--搜尋周圍玩家
		local PeopleCount =  table.getn(NearPlayer)
		for i = 0 , table.getn(NearPlayer)-1 do
			if GetRoleCampID( TargetID() ) ~= GetRoleCampID( NearPlayer[i] ) then
				PeopleCount = PeopleCount - 1
			end
		end
		Score = math.ceil(Score/PeopleCount)
		for i=0,table.getn(NearPlayer)-1 do
			if GetRoleCampID( TargetID() ) == GetRoleCampID( NearPlayer[i] ) then
			---*---以下判斷玩家是否有學習技術
				local SetA = -1
				local Count = BuffCount ( NearPlayer[i])
				for j = 0 , Count do
					local BuffID = BuffInfo ( NearPlayer[i] , j , EM_BuffInfoType_BuffID ) -- 基本法術ID
					if BuffID == 505317 then--榮譽意志：戰績獲得量加強
						local BuffLv = BuffInfo ( NearPlayer[i] , j , EM_BuffInfoType_Power )--該建築第 j 個BUFF的等級
						SetA = BuffLv
					end
				end
				if SetA>-1 then -- 表示有修煉此技能
					Score = Score+(SetA+1)
				end
				AddGuildWarPlayerValue( NearPlayer[i] ,4 , Score )
				GiveBodyItem( NearPlayer[i] , 206685 , Score )
			end
		end
	end	
end

function Lua_GUILDWAR_StealMainCastCheck(ObjID, CheckStatus)   -- 大據點施法檢測
	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			-- 成功
			WriteRoleValue(OwnerID(), EM_RoleValue_Register5, 2 )--成功師法狀態
			WriteRoleValue(TargetID(), EM_RoleValue_Register1,0 )
			WriteRoleValue(OwnerID(), EM_RoleValue_Register1,0 )
			EndCastBar( OwnerID(), CheckStatus );
		else
			-- 失敗
			WriteRoleValue(OwnerID(), EM_RoleValue_Register5, 0 )--清除施法狀態
			WriteRoleValue(TargetID(), EM_RoleValue_Register1,0 )
			WriteRoleValue(OwnerID(), EM_RoleValue_Register1,0 )
			EndCastBar( OwnerID(), CheckStatus );
		end
	end
end