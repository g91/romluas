function Event_GuildWarEnd( RoomID , IsAssignment) --���|�Ե������y�@��
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
	--�p���`�H��TACount�BTBCount
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
	--�ˬd�O�_�����w��ԡA�Y�O�h�������y�~���y�{�������L
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
			--�@���ˬd�@�Ӭq��
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
				--�o�X���y�M��
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
			--�@���ˬd�@�Ӭq��
			if	Total>TypeNM[Lv]	then
				Num = TypeNM[Lv]
			else
				Num = Total
			end
			for SN=1,Num do
			--	DebugMsg(0,RoomID,TeamID.."   Lv:"..Lv.."   SN="..SN)
				local ID = SortList_Get();
				if IfWin == 0 then
					CallPlot( ID , "YOYO_GetTokenValue" , 1 , WinnerGifeCount[1][Lv][SN] ) -- 2013.03.22 ���E�G6.0.0 �f����X�վ�				
				--	GiveBodyItem( ID , 206686 , WinnerGifeCount[1][Lv][SN] )	-- �շ�����
					Lua_AddHonor( ID , WinnerGifeCount[2][Lv][SN] )
					GiveBodyItem( ID , 206770 , WinnerGifeCount[3][Lv][SN] )	-- ���׾ԪG�ɵ��~
				else
					CallPlot( ID , "YOYO_GetTokenValue" , 1 , LoseGifeCount[1][Lv][SN] ) -- 2013.03.22 ���E�G6.0.0 �f����X�վ�
				--	GiveBodyItem( ID , 206686 , LoseGifeCount[1][Lv][SN] )	-- �շ�����
					Lua_AddHonor( ID , LoseGifeCount[2][Lv][SN] )
					GiveBodyItem( ID , 206771 , LoseGifeCount[3][Lv][SN] )	-- �A���A�F�ɵ��~
				end
				table.remove(TeamTable , ID)
				local IDScore = GetGuildWarPlayerValue( ID ,4 )
				--�o�X���y�M��
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
				CallPlot( RemainPlayer , "YOYO_GetTokenValue" , 1 , WinnerGifeCount[1][Consolation] ) -- 2013.03.22 ���E�G6.0.0 �f����X�վ�
			--	GiveBodyItem( RemainPlayer , 206686 , WinnerGifeCount[1][Consolation] );	-- �շ�����
				Lua_AddHonor( RemainPlayer , WinnerGifeCount[2][Consolation] );
				GiveBodyItem( RemainPlayer , 206770 , WinnerGifeCount[3][Consolation] );	-- ���׾ԪG�ɵ��~
			else
				CallPlot( RemainPlayer , "YOYO_GetTokenValue" , 1 , LoseGifeCount[1][Consolation] ) -- 2013.03.22 ���E�G6.0.0 �f����X�վ�
			--	GiveBodyItem( RemainPlayer , 206686 , LoseGifeCount[1][Consolation] );	-- �շ�����
				Lua_AddHonor( RemainPlayer , LoseGifeCount[2][Consolation] );
				GiveBodyItem( RemainPlayer , 206771 , LoseGifeCount[3][Consolation] );	-- �A���A�F�ɵ��~
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
--�p���I����@��
function Lua_GUILDWAR_StealCrystal()
	local	ObjCampID	= GetRoleCampID( TargetID() );
	local 	ObjID  		= 0;
	local 	CastResult	= 0;
	local	RoomID	= ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ); 
	local	LandMarkID	= ReadRoleValue( TargetID(), EM_RoleValue_PID );
	local	Register	= ReadRoleValue( TargetID(), EM_RoleValue_Register1 );
	local	RegisterO = ReadRoleValue( OwnerID(), EM_RoleValue_Register1 );
	local	PlayerCampID	= GetRoleCampID( OwnerID() );
	local E_Count = GuildWarSetting[RoomID]["building"][2] --�෽�V���q
	local E_Time = GuildWarSetting[RoomID]["building"][1] --�෽�V���ɶ�
	local RE_Count = GuildWarSetting[RoomID]["building"][3]	--�i�V���෽�j��o���Z�ƶq
	---*---�H�U�P�_���a�O�_���ǲߧ޳N
	local SetA = -1
	local SetB = -1	
	local SetC = -1			
	local Count = BuffCount ( OwnerID())

	for i = 0 , Count do

		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID ) -- �򥻪k�NID
		if BuffID == 505309 then--�Ѩ��޳N�G�෽�V���q�[�j
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )--�ӫؿv�� j ��BUFF������
			SetA = BuffLv

		elseif BuffID == 505310 then--���ҧ޳N�G�෽�V���t�ץ[�j
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )
			SetB = BuffLv

		elseif BuffID == 505318 then--�ԳN���ѡG�V���෽����o�����Z�q
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )
			SetC = BuffLv
		end
	end
	if SetA>-1 then -- ��ܦ��׷Ҧ��ޯ�
		E_Count = E_Count+(SetA+1)
	end
	if SetB>-1 then -- ��ܦ��׷Ҧ��ޯ�
		E_Time = E_Time-((SetB+1)*10)
	end
	if SetC>-1 then -- ��ܦ��׷Ҧ��ޯ�
		RE_Count = RE_Count+((SetC+1)*2)
	end
	if ObjCampID == PlayerCampID then	--�P�}�� �V����q�@��
		if GuildWarSetting[RoomID]["energy"][LandMarkID] > 0 then
			ScriptMessage( OwnerID(), OwnerID(), 0, GuildWarSetting[RoomID]["energy"][LandMarkID].." / 5000 " , 0 );
			if BeginCastBarEvent( OwnerID(), OwnerID(),"[SC_YU_GUILDWAR_BUILD_37]", E_Time, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "Lua_GUILDWAR_CraftCastCheck" ) ~= 1 then
				ScriptMessage( OwnerID(), OwnerID(), 0,"[SAY_NPC_BUSY]", 0 );--�ؼЦ��L��
				return
			else
				WriteRoleValue(OwnerID(), EM_RoleValue_Register5, 1 )--�ର�I�k�����A
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
					AddGuildWarPlayerValue( OwnerID(), 5 , E_Count )	--�O���෽���o
					local Raa = Rand(100)
					if Raa > 39 then
						local RARR = Rand(2)+1
						RE_Count = RE_Count + RARR
						AddGuildWarPlayerValue( OwnerID() ,4 , RE_Count )--�O�����Z���o
						GiveBodyItem( OwnerID() , 206685 , RE_Count )
					else
						AddGuildWarPlayerValue( OwnerID() ,4 , RE_Count )--�O�����Z���o
						GiveBodyItem( OwnerID() , 206685 , RE_Count )						
					end
					local GGEnergy = GetGuildWarEnergy(OwnerID())
					local FullKey 		= "[SC_YU_GUILDWAR_BUILD_57]"
					ScriptMessage( OwnerID(), OwnerID(), 0, FullKey , 0 );
					ScriptMessage( OwnerID(), OwnerID(), 1, FullKey , 0 );
					BeginPlot( TargetID() , "Lua_GUILDWAR_StealCrystal_CONN" , 0)	--���ƨV����q
				end
			end
		else
			ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_YU_GUILDWAR_BUILD_55]" , 0 );
		end
	elseif  ObjCampID ~= PlayerCampID then	--���P�}�� �m�ܼ@��
		if Register == 0 and RegisterO == 0 then
			WriteRoleValue(TargetID(), EM_RoleValue_Register1,1 )
			WriteRoleValue(OwnerID(), EM_RoleValue_Register1,TargetID() )
			if BeginCastBarEvent( OwnerID(), TargetID(),"[SC_YU_GUILDWAR_BUILD_38]", 150, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "Lua_GUILDWAR_StealCastCheck" ) ~= 1 then
				ScriptMessage( OwnerID(), OwnerID(), 0,"[SAY_NPC_BUSY]", 0 );--�ؼЦ��L��
				return
			else
				WriteRoleValue(OwnerID(), EM_RoleValue_Register5, 1 )--�ର�I�k�����A
				-- 2012.06.11 ���E�G�ץ����a�e��Ĥ��q����(114335�B114336)�ɡA�b�C�������`���������p�U�A�|�ɭP�Ӿ��I�ä[�L�k����A����ܥؼХ��b���L�������D�C
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
							-- TEAM 2, ����
							SetRoleCampID( TargetID(), PlayerCampID );
							ChangeObjID( TargetID(), 114335 );	-- TEAM 1 RED
						else
							-- TEAM 1, �x��
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
							local NearPlayer = SearchRangePlayer(OwnerID(),200)	--�j�M�P�򪱮a
							local PeopleCount =  table.getn(NearPlayer)
							for i = 0 , table.getn(NearPlayer)-1 do
								if GetRoleCampID( OwnerID() ) ~= GetRoleCampID( NearPlayer[i] ) then
									PeopleCount = PeopleCount - 1
								end
							end
							Score = math.ceil(Score/PeopleCount)
							for i=0,table.getn(NearPlayer)-1 do
								if GetRoleCampID( OwnerID() ) == GetRoleCampID( NearPlayer[i] ) then
									AddGuildWarPlayerValue( NearPlayer[i] ,4 , Score )--�O�����Z���o
									GiveBodyItem( NearPlayer[i] , 206685 , Score )--�������Z
								end
							end
							AddGuildWarPlayerValue( OwnerID(), 6 , 1 )	--�O��������I
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
							local NearPlayer = SearchRangePlayer(OwnerID(),200)	--�j�M�P�򪱮a
							local PeopleCount =  table.getn(NearPlayer)
							for i = 0 , table.getn(NearPlayer)-1 do
								if GetRoleCampID( OwnerID() ) ~= GetRoleCampID( NearPlayer[i] ) then
									PeopleCount = PeopleCount - 1
								end
							end
							Score = math.ceil(Score/PeopleCount)
							for i=0,table.getn(NearPlayer)-1 do
								if GetRoleCampID( OwnerID() ) == GetRoleCampID( NearPlayer[i] ) then
									AddGuildWarPlayerValue( NearPlayer[i] ,4 , Score )--�O�����Z���o
									GiveBodyItem( NearPlayer[i] , 206685 , Score )--�������Z
								end
							end
							AddGuildWarPlayerValue( OwnerID(), 6 , 1 )	--�O��������I
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
-- 2012.06.11 ���E�G�ץ����a�e��Ĥ��q����(114335�B114336)�B�Ĥ褽�|�a�A����(113696�B113697)�ɡA�b�C�������`���������p�U�A�|�ɭP�Ӿ��I�ä[�L�k����A����ܥؼХ��b���L�������D�C
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

function Lua_GUILDWAR_CraftCastCheck(ObjID, CheckStatus)   -- �P�}��I�k�˴�
	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			-- ���\
			WriteRoleValue(OwnerID(), EM_RoleValue_Register5, 2 )--���\�v�k���A
			WriteRoleValue(TargetID(), EM_RoleValue_Register1,0 )
			EndCastBar( OwnerID(), CheckStatus );
		else
			-- ����
			WriteRoleValue(OwnerID(), EM_RoleValue_Register5, 0 )--�M���I�k���A
			WriteRoleValue(TargetID(), EM_RoleValue_Register1,0 )
			EndCastBar( OwnerID(), CheckStatus );
		end
	end
end
function Lua_GUILDWAR_StealCastCheck(ObjID, CheckStatus)   -- �p���I�I�k�˴�
	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			-- ���\
			WriteRoleValue(OwnerID(), EM_RoleValue_Register5, 2 )--���\�v�k���A
			WriteRoleValue(TargetID(), EM_RoleValue_Register1,0 )
			WriteRoleValue(OwnerID(), EM_RoleValue_Register1,0 )
			EndCastBar( OwnerID(), CheckStatus );
		else
			-- ����
			WriteRoleValue(OwnerID(), EM_RoleValue_Register5, 0 )--�M���I�k���A
			WriteRoleValue(TargetID(), EM_RoleValue_Register1,0 )
			WriteRoleValue(OwnerID(), EM_RoleValue_Register1,0 )
			EndCastBar( OwnerID(), CheckStatus );
		end
	end
end
--�j���I�m�ܼ@��
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
	if  ObjCampID == PlayerCampID then	--�P�}�� �s��
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_YU_GUILDWAR_BUILD_53]" , 0 );
	elseif  ObjCampID ~= PlayerCampID then	--���P�}�� �m�ܼ@��
		if Register == 0 and RegisterO == 0 then
			WriteRoleValue(TargetID(), EM_RoleValue_Register1,1 )
			WriteRoleValue(OwnerID(), EM_RoleValue_Register1,TargetID() )
			if BeginCastBarEvent( OwnerID(), TargetID(),"[SC_YU_GUILDWAR_BUILD_38]", 150, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "Lua_GUILDWAR_StealMainCastCheck" ) ~= 1 then
				ScriptMessage( OwnerID(), OwnerID(), 0,"[SAY_NPC_BUSY]", 0 );--�ؼЦ��L��
				return
			else
				WriteRoleValue(OwnerID(), EM_RoleValue_Register5, 1 )--�ର�I�k�����A
				-- 2012.06.11 ���E�G�ץ����a�e��Ĥ褽�|�a�A����(113696�B113697)�ɡA�b�C�������`���������p�U�A�|�ɭP�Ӿ��I�ä[�L�k����A����ܥؼХ��b���L�������D�C
				CallPlot( TargetID() , "Lua_Hao_GUILDWAR_CheckPlayer" , OwnerID() )
				--
				for i = 1 , 5 do
					if( ReadRoleValue(OwnerID(),EM_RoleValue_Register5) == 1 ) then 
						if( PlayerCampID == 8 ) then
							local  EnemyGuildName =  "|cffff3232"..GetGuildName_ByID( RoomID , ((CrystalOwn[RoomID][LandMarkID]+1)%2+1)%2 ).."|r"
							local  GuildName =  "|cff00ffff"..GetGuildName_ByID( RoomID , CrystalOwn[RoomID][LandMarkID]-1 ).."|r"
							local PlayerName 	= "|cff00ffff"..GetName( TargetID() ).."|r"--���a
							local FullKey 		= "[SC_YU_GUILDWAR_BUILD_76]" .. "[$SETVAR1="..GuildName.."][$SETVAR2="..PlayerName.."][$SETVAR3=" .. EnemyGuildName .. "]"
							ScriptMessage( OwnerID(), -1, 0, FullKey , 0 );
							ScriptMessage( OwnerID(), -1, 2, FullKey , 0 );
						else
							local  EnemyGuildName =  "|cff00ffff"..GetGuildName_ByID( RoomID , ((CrystalOwn[RoomID][LandMarkID]+1)%2+1)%2 ).."|r"
							local  GuildName =  "|cffff3232"..GetGuildName_ByID( RoomID , CrystalOwn[RoomID][LandMarkID]-1 ).."|r"
							local PlayerName 	= "|cff00ffff"..GetName( TargetID() ).."|r"--���a
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
					local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --�|Ū��u�ꪺ���y�ϰ�
					if( PlayerCampID == 8 ) then 
						EnemyGuildName =  "|cffff3232"..GetGuildName_ByID( RoomID , ((CrystalOwn[RoomID][LandMarkID]+1)%2+1)%2 ).."|r"
						local orgid = ReadRoleValue( TargetID(),EM_RoleValue_OrgID)
						PlayerName 	= "|cff00ffff".."["..orgid.."]".."|r"
						GuildName  =  "|cff00ffff"..GetGuildName_ByID( RoomID , CrystalOwn[RoomID][LandMarkID]-1 ).."|r"
						FullKey 		= "[SC_YU_GUILDWAR_BUILD_49]" .. "[$SETVAR1="..GuildName.."][$SETVAR2="..PlayerName.."][$SETVAR3=" .. EnemyGuildName .. "]"
						-- TEAM 2, ����
						SetRoleCampID( TargetID(), PlayerCampID );
						ChangeObjID( TargetID(), 113696 );	-- TEAM 1 RED
						local GuildID = ReadRoleValue(OwnerID(),EM_RoleValue_GuildID)
						WriteRoleValue(GuildWarSetting[RoomID]["MainObj"][1] , EM_RoleValue_GuildID,GuildID)
						if GuildWarSetting[RoomID]["MainObj"][4] ~= 0 and ReadRoleValue( TargetID(), EM_RoleValue_Register9 ) == 2 then
							DelObj(GuildWarSetting[RoomID]["MainObj"][4])
							GuildWarSetting[RoomID]["MainObj"][4] = 0
							--�ܦ^���\
							if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
								RunningMsg( OwnerID() , 3 , "[SC_YU_GUILDWAR_BUILD_85][$SETVAR1="..EnemyGuildName.."][$SETVAR2="..PlayerName.."]" ) --�ܦ^
							end
							BeginPlot( TargetID() , "Lua_GUILDWAR_WinnerClockStop" , 0)	--�����p��
						else
							BeginPlot( TargetID() , "Lua_GUILDWAR_WinnerClock" , 0)	--�Ұʥ@�ɩ_�[
						end
					else
						EnemyGuildName =  "|cff00ffff"..GetGuildName_ByID( RoomID , ((CrystalOwn[RoomID][LandMarkID]+1)%2+1)%2 ).."|r"
						local orgid = ReadRoleValue( TargetID(),EM_RoleValue_OrgID)
						PlayerName 	= "|cffff3232".."["..orgid.."]".."|r"
						GuildName  =  "|cffff3232"..GetGuildName_ByID( RoomID , CrystalOwn[RoomID][LandMarkID]-1 ).."|r"
						FullKey 		= "[SC_YU_GUILDWAR_BUILD_49]" .. "[$SETVAR1="..GuildName.."][$SETVAR2="..PlayerName.."][$SETVAR3=" .. EnemyGuildName .. "]"
						-- TEAM 1, �x��
						SetRoleCampID( TargetID(), PlayerCampID );
						ChangeObjID( TargetID(), 113697 );	-- TEAM 2 BLUE
						local GuildID = ReadRoleValue(OwnerID(),EM_RoleValue_GuildID)
						WriteRoleValue(GuildWarSetting[RoomID]["MainObj"][2] , EM_RoleValue_GuildID,GuildID)
						if GuildWarSetting[RoomID]["MainObj"][3] ~= 0 and ReadRoleValue( TargetID(), EM_RoleValue_Register9 ) == 1 then
							DelObj(GuildWarSetting[RoomID]["MainObj"][3])
							GuildWarSetting[RoomID]["MainObj"][3] = 0
							--�ܦ^���\
							if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
								RunningMsg( OwnerID() , 3 , "[SC_YU_GUILDWAR_BUILD_85][$SETVAR1="..EnemyGuildName.."][$SETVAR2="..PlayerName.."]" ) --�ܦ^
							end
							BeginPlot( TargetID() , "Lua_GUILDWAR_WinnerClockStop" , 0)	--�����p��
						else
							BeginPlot( TargetID() , "Lua_GUILDWAR_WinnerClock" , 0)	--�Ұʥ@�ɩ_�[
						end
					end
					ScriptMessage( OwnerID(), -1, 0, FullKey , 0 );
					ScriptMessage( OwnerID(), -1, 2, FullKey , 0 );
					local Score = GuildWarSetting[RoomID]["Kill"][4]
					local NearPlayer = SearchRangePlayer(OwnerID(),200)	--�j�M�P�򪱮a
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
							AddGuildWarPlayerValue( NearPlayer[i] ,4 , Score )--�O�����Z���o
							GiveBodyItem( NearPlayer[i] , 206685 , Score )--�������Z
						end
					end
					AddGuildWarPlayerValue( OwnerID(), 6 , 1 )	--�O��������I
					AddGuildWarScore( OwnerID() , 2000 )
					if( PlayerCampID == 8 ) then
						SetMapMark ( RoomID , LandMarkID-1 , pX , pY , pZ , pName , 58 )
						CrystalOwn[RoomID][LandMarkID] = 2
					else
						SetMapMark ( RoomID , LandMarkID-1 , pX , pY , pZ , pName , 59 )
						CrystalOwn[RoomID][LandMarkID] = 1
					end
					WriteRoleValue(OwnerID(), EM_RoleValue_Register5, 0 )--�M���I�k���A
				end
			end
		else
			ScriptMessage( OwnerID(), OwnerID(), 0, "[SAY_NPC_BUSY]" , 0 );
		end
	end
end

function Lua_GUILDWAR_CrystalRange()	--�p���I�d��@��
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

function Lua_GUILDWAR_MainCrystalRange()	--�j���I�d��@��
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
function Lua_GUILDWAR_StealCrystal_CONN()	--���ƨV����q
	BeginPlot( TargetID() , "Lua_GUILDWAR_StealCrystal" , 0)
end

function Lua_GUILDWAR_GuardDead()	--�u�æ��`�@��
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
		local NearPlayer = SearchRangePlayer(TargetID(),200)	--�j�M�P�򪱮a
		local PeopleCount =  table.getn(NearPlayer)
		for i = 0 , table.getn(NearPlayer)-1 do
			if GetRoleCampID( TargetID() ) ~= GetRoleCampID( NearPlayer[i] ) then
				PeopleCount = PeopleCount - 1
			end
		end
		Score = math.ceil(Score/PeopleCount)
		for i=0,table.getn(NearPlayer)-1 do
			if GetRoleCampID( TargetID() ) == GetRoleCampID( NearPlayer[i] ) then
				---*---�H�U�P�_���a�O�_���ǲߧ޳N
				local SetA = -1
				local Count = BuffCount ( NearPlayer[i])
				for j = 0 , Count do
					local BuffID = BuffInfo ( NearPlayer[i] , j , EM_BuffInfoType_BuffID ) -- �򥻪k�NID
					if BuffID == 505317 then--�a�A�N�ӡG���Z��o�q�[�j
						local BuffLv = BuffInfo ( NearPlayer[i] , j , EM_BuffInfoType_Power )--�ӫؿv�� j ��BUFF������
						SetA = BuffLv
					end
				end
				if SetA>-1 then -- ��ܦ��׷Ҧ��ޯ�
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
		local NearPlayer = SearchRangePlayer(TargetID(),200)	--�j�M�P�򪱮a
		local PeopleCount =  table.getn(NearPlayer)
		for i = 0 , table.getn(NearPlayer)-1 do
			if GetRoleCampID( TargetID() ) ~= GetRoleCampID( NearPlayer[i] ) then
				PeopleCount = PeopleCount - 1
			end
		end
		Score = math.ceil(Score/PeopleCount)
		for i=0,table.getn(NearPlayer)-1 do
			if GetRoleCampID( TargetID() ) == GetRoleCampID( NearPlayer[i] ) then
			---*---�H�U�P�_���a�O�_���ǲߧ޳N
				local SetA = -1
				local Count = BuffCount ( NearPlayer[i])
				for j = 0 , Count do
					local BuffID = BuffInfo ( NearPlayer[i] , j , EM_BuffInfoType_BuffID ) -- �򥻪k�NID
					if BuffID == 505317 then--�a�A�N�ӡG���Z��o�q�[�j
						local BuffLv = BuffInfo ( NearPlayer[i] , j , EM_BuffInfoType_Power )--�ӫؿv�� j ��BUFF������
						SetA = BuffLv
					end
				end
				if SetA>-1 then -- ��ܦ��׷Ҧ��ޯ�
					Score = Score+(SetA+1)
				end
				AddGuildWarPlayerValue( NearPlayer[i] ,4 , Score )
				GiveBodyItem( NearPlayer[i] , 206685 , Score )
			end
		end
	end	
end

function Lua_GUILDWAR_StealMainCastCheck(ObjID, CheckStatus)   -- �j���I�I�k�˴�
	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			-- ���\
			WriteRoleValue(OwnerID(), EM_RoleValue_Register5, 2 )--���\�v�k���A
			WriteRoleValue(TargetID(), EM_RoleValue_Register1,0 )
			WriteRoleValue(OwnerID(), EM_RoleValue_Register1,0 )
			EndCastBar( OwnerID(), CheckStatus );
		else
			-- ����
			WriteRoleValue(OwnerID(), EM_RoleValue_Register5, 0 )--�M���I�k���A
			WriteRoleValue(TargetID(), EM_RoleValue_Register1,0 )
			WriteRoleValue(OwnerID(), EM_RoleValue_Register1,0 )
			EndCastBar( OwnerID(), CheckStatus );
		end
	end
end