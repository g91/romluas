--==============================
--	跟光龍對話的劇情 包含開戰選項
--==============================
function Z26Instance_Boss3_TalkMain()
	local NPC = TargetID()
	local Player = OwnerID()
	
--	if ReadRoleValue( NPC, EM_RoleValue_Register+2 ) == 0 then
--		SetSpeakDetail(Player,"Fight?")
--		AddSpeakOption(Player,NPC,"YES","Z26Instance_Boss3_Talk_Yes",0)
--		AddSpeakOption(Player,NPC,"NO","Z26Instance_Boss3_Talk_No",0)
--	elseif ReadRoleValue( NPC, EM_RoleValue_Register+2 ) == 1 then
		SetSpeakDetail( Player, "[SC_BELLATIA_DUOLICATION_PANGKORRAMS_15]")
		AddSpeakOption( Player, NPC, "[SC_BELLATIA_DUOLICATION_PANGKORRAMS_16]", "Z26Instance_Boss3_Talk_teleport", 0 )
--	end
end

--function Z26Instance_Boss3_Talk_Yes()			--準備好開戰
--	local NPC = TargetID()
--	local Player = OwnerID()
--	local RoomID = ReadRoleValue( NPC, EM_RoleValue_RoomID )
--
--	Lua_BellatiaDuplication_change_status(RoomID, "boss")				--通知副本進度中控
--	WriteRoleValue( NPC, EM_RoleValue_Register+1, 1 )
--	CloseSpeak( Player )
--end

--function Z26Instance_Boss3_Talk_No()			--還沒準備好
--	CloseSpeak( Player )
--	return
--end

function Z26Instance_Boss3_Talk_teleport()
	local Player = OwnerID()
	CancelBuff( Player, 624292 )
	local x,y,z,dir	=DW_Location(781282, 5)
	x,y,z,dir	=DW_NewLocation(0, 50, x,y,z,dir);
	SetPos(Player, x,y,z,dir-180);
end

function Z26Instance_Boss3_RangePlot()
	local Player = OwnerID()
	local RangePloter = TargetID()
	local Dark=ReadRoleValue( RangePloter, EM_RoleValue_Register+2);
	local RoomID = ReadRoleValue( RangePloter, EM_RoleValue_RoomID )
	DebugMsg(0,0,"Boss3_RangePlot")
	if(ReadRoleValue(Player,EM_RoleValue_IsDead)==0)and(ReadRoleValue(Player,EM_RoleValue_VOC)~=0)and(CheckRelation(Dark,Player,EM_CheckRelationType_Attackable)==true)then--活著;非GM;可被幽龍打
		WriteRoleValue( RangePloter, EM_RoleValue_Register+1, 1 )
		Lua_BellatiaDuplication_change_status(RoomID, "boss")			--通知副本進度中控
		SetPlot( RangePloter, "range", "", 0 )					--關掉範圍劇情
	end
end

--==============================
--	ControlCenter
--	EM_RoleValue_Register+1	紀錄戰鬥狀態	0表示沒開戰	1表示戰鬥中	2表示玩家失敗	3表示玩家獲勝
--	EM_RoleValue_Register+2	紀錄光龍ID
--	EM_RoleValue_Register+3	紀錄暗龍ID
--	EM_RoleValue_Register+4	紀錄後門
--	EM_RoleValue_Register+5	紀錄前門

--	旗標 780765
--	1	光龍位置
--	2	幽龍位置
--	3	範圍劇情觸發器
--	4	前門
--	5	戰鬥結束後寶箱的位置

--	幽龍
--	EM_RoleValue_Register+1	紀錄中控器

--	LightAvatar光龍人形
--	EM_RoleValue_Register+1	紀錄玩家跟他對話說已經準備好，讓中控器判斷要開戰了
--	EM_RoleValue_Register+2	判斷玩家跟他對話時，是否已經擊敗幽龍

--	RangePloter範圍劇情控制器
--	EM_RoleValue_Register+1	偵測到玩家靠近寫為1，讓中控器判斷要開戰了
--==============================

function Z26Instance_Boss3_initialize( ControlCenter, RangePloter, RoomID )
	local org={hard=102567;normal=107985;easy=108048;}; 
	local LightDragon = CreateObjByFlag( org[Global_BellatiaDuplication.type], 780765, 1, 1 )
	local org={hard=102992;normal=107986;easy=108049;};
	local DarkDragon = CreateObjByFlag( org[Global_BellatiaDuplication.type], 780765, 2, 1 )
	SetModeEx( LightDragon, EM_SetModeType_Mark, false )		--取消光龍的標記，以免擋到玩家Target幽龍
	SetModeEx( DarkDragon, EM_SetModeType_Mark, false )		--取消幽龍的標記，等到玩家可以對幽龍造成傷害的時候再打開
	AddToPartition( LightDragon, RoomID )
	AddToPartition( DarkDragon, RoomID )
	SetAttack( LightDragon , DarkDragon)
	SetAttack( DarkDragon , LightDragon)
	FN_SuperTaunt( DarkDragon, LightDragon )
	FN_SuperTaunt( LightDragon, DarkDragon )
	--
	local RangePloter = CreateObjByFlag( 115634, 780765, 3, 1 )
	AddToPartition( RangePloter, RoomID )
	SetModeEx( RangePloter, EM_SetModeType_Show, false )
	SetModeEx( RangePloter, EM_SetModeType_Mark, false )
	--
	WriteRoleValue( RangePloter, EM_RoleValue_Register+1, 0 )
	WriteRoleValue( RangePloter, EM_RoleValue_Register+2, DarkDragon )
	SetPlot( RangePloter, "range", "Z26Instance_Boss3_RangePlot", 300 )
	--
	return LightDragon, DarkDragon, RangePloter
end

function Z26Instance_Boss3_ControlCenter()
	local ControlCenter = OwnerID()
	local RoomID = ReadRoleValue( ControlCenter, EM_RoleValue_RoomID )
	Hide(ControlCenter)
	--
	local LightAvatar = CreateObjByFlag( 121806, 780765, 1, 1 )
	local DarkAvatar = CreateObjByFlag( 102835, 780765, 2, 1 )
	AddToPartition( LightAvatar, RoomID )
	AddToPartition( DarkAvatar, RoomID )
	Hide( LightAvatar )
	Hide( DarkAvatar )
	--初始化
	local LightDragon, DarkDragon, RangePloter = Z26Instance_Boss3_initialize( ControlCenter, RangePloter, RoomID )
	local DarkMaxHp = ReadRoleValue( DarkDragon, EM_RoleValue_MaxHP )
	local LightMaxHp = ReadRoleValue( LightDragon, EM_RoleValue_MaxHP )
	
--	while Lua_BellatiaDuplication_check_status( RoomID, "boss" ) do
	while true do
		local FightCheck = ReadRoleValue( ControlCenter, EM_RoleValue_Register+1 )
		--
		if CheckID( RangePloter ) == true and ReadRoleValue( RangePloter, EM_RoleValue_Register+1 ) == 1 then						--表示玩家靠近，開啟戰鬥
			DelObj( RangePloter )
			CallPlot( ControlCenter, "Z26Instance_Boss3_Main", LightDragon, DarkDragon )
			WriteRoleValue( ControlCenter, EM_RoleValue_Register+1, 4 )
		end
		if FightCheck == 0 then						--戰鬥沒觸發，兩龍繼續假打
			WriteRoleValue( LightDragon, EM_RoleValue_HP, LightMaxHp )
			WriteRoleValue( DarkDragon, EM_RoleValue_HP, DarkMaxHp )		
		elseif FightCheck == 1 then						--表示玩家要戰鬥
			
		elseif FightCheck == 2 then						--表示玩家失敗
			Lua_BellatiaDuplication_change_status(RoomID, "fail")		--通知副本進度中控
			Lua_BellatiaDuplication_fail()					--重製玩家劇情進度到儲存點
--			Sleep(600)							--60秒後再度出現
			LightDragon, DarkDragon, RangePloter = Z26Instance_Boss3_initialize( ControlCenter, RangePloter, RoomID )
			WriteRoleValue( ControlCenter, EM_RoleValue_Register+1, 0 )
		elseif FightCheck == 3 then						--表示玩家獲勝 Boss被擊敗
			local FrontDoor = ReadRoleValue( ControlCenter, EM_RoleValue_Register+5 )
			DelObj( FrontDoor )
			--創造寶箱
			local org={hard=107822;normal=107991;easy=108054;}
			local Loot = CreateObjByFlag( org[Global_BellatiaDuplication.type], 780765, 5, 1 )
			SetModeEx( Loot, EM_SetModeType_ShowRoleHead, false )
			SetModeEx( Loot, EM_SetModeType_Move, false )
			AddToPartition( Loot, RoomID )
			--創造外面的人型光龍
			local bancremz = lua_26in_npcGUID();
			BeginPlot(bancremz, "lua_26in_foreboss4_GoPosition", 0);
			--以下是表演
			Z26Instance_Boss3_EndStage( ControlCenter, LightAvatar, DarkAvatar, RoomID )
			--
			Lua_BellatiaDuplication_change_status(RoomID, "success")	--通知副本進度中控
			return
		end
		--

--		蝌蚪低八哥用
--		if Global_BellatiaDuplication[RoomID].save_point == 6 and Lua_BellatiaDuplication_check_status(RoomID, "boss") then
--			Global_BellatiaDuplication:debug("pankerrams hp : " .. ReadRoleValue( LightDragon, EM_RoleValue_HP))
--			Global_BellatiaDuplication:debug("status : " .. ReadRoleValue( ControlCenter, EM_RoleValue_Register+1 ))
--		end

		Sleep(10)
	end
end

function Z26Instance_Boss3_EndStage( ControlCenter, LightAvatar, DarkAvatar, RoomID )	--玩家擊敗Boss的表演
	local Light = ReadRoleValue( ControlCenter, EM_RoleValue_Register+2 )
	local Dark = ReadRoleValue( ControlCenter, EM_RoleValue_Register+3 )
	DebugMsg(0,0,"EndStage")
	SetModeEx( Light, EM_SetModeType_Move, false )
	SetModeEx( Dark, EM_SetModeType_Move, false )
	SetStopAttack( Light )
	SetStopAttack( Dark )
	FaceObj( Light, Dark )
	FaceObj( Dark, Light )
	Sleep(10)
	--PlayMotion( Light, ruFUSION_ACTORSTATE_ATTACK_UNARMED  )	--撥放光龍攻擊幽龍
	CastSpell( Light, Dark, 850864 )					--制裁幽龍的特效
	Sleep(20)
	PlayMotion( Dark, ruFUSION_ACTORSTATE_DYING  )			--幽龍倒下
	Sleep(50)
	local Dx, Dy, Dz, Ddir = DW_Location( Dark )
	local Lx, Ly, Lz, Ldir = DW_Location( Light )
	DelObj( Dark )
	DelObj( Light )
	SetPos( DarkAvatar, Dx, Dy, Dz, Ddir )					--光龍消失
	SetPos( LightAvatar, Lx, Ly, Lz, Ldir )					--幽龍消失
	PlayMotionEX( DarkAvatar , ruFUSION_ACTORSTATE_SIT_BEGIN , ruFUSION_ACTORSTATE_SIT_LOOP )	--幽龍人型撥放倒地動作
	SetModeEx( DarkAvatar, EM_SetModeType_Move, false )
	SetModeEx( LightAvatar, EM_SetModeType_Move, false )
	AddBuff( DarkAvatar, 624290, 0, -1 )					--氣勢用特效
	AddBuff( LightAvatar, 624289, 0, -1 )					--氣勢用特效
	Show( LightAvatar, RoomID )						--光龍還為人型
	Show( DarkAvatar, RoomID )						--幽龍還為人型
	Sleep(20)
	CastSpell( LightAvatar, DarkAvatar, 850864 )				--制裁幽龍
	--PlayMotion( LightAvatar, ruFUSION_ACTORSTATE_CAST_SP01  )	--撥放光龍攻擊幽龍
	Sleep(10)
	CancelBuff( DarkAvatar, 624290 )					--幽龍就沒氣勢了的特效
	--
	for i = 1, 3 do
		local Angle = 120*i
		local Nx,Ny,Nz,Ndir = DW_NewLocation(Angle, 50, Dx, Dy, Dz, Ddir)

		local Unit = CreateObj( 119604, Nx, Ny, Nz, Ndir, 1 )
		SetModeEx( Unit, EM_SetModeType_Mark, false )		--標記
		SetModeEx( Unit, EM_SetModeType_ShowRoleHead, false )	--頭像框
		SetModeEx( Unit, EM_SetModeType_Move, false )		--移動
		SetModeEx( Unit, EM_SetModeType_HideName, true )	--血條
		AddToPartition( Unit, RoomID )

		local Hitunit = CreateObj( 119604, Dx, Dy, Dz, Ddir, 1 )
		SetModeEx( Hitunit, EM_SetModeType_Mark, false )	--標記
		SetModeEx( Unit, EM_SetModeType_ShowRoleHead, false )	--頭像框
		SetModeEx( Hitunit, EM_SetModeType_Move, false )	--移動
		SetModeEx( Hitunit, EM_SetModeType_HideName, true )	--血條
		AddToPartition( Hitunit, RoomID )

		CastSpell( Hitunit, Unit , 850863 )
	end

	WriteRoleValue( LightAvatar, EM_RoleValue_Register+2, 1 )
	Lua_BroadCast_RoomStingTypeColor(RoomID, "[SC_26IN_AFTERBOSS3_A]", 2, C_LightBlue)
	sleep(30);
	Lua_BroadCast_RoomStingTypeColor(RoomID, "[SC_26IN_AFTERBOSS3_B]", 2, C_YELLOW)
	sleep(40);
	Lua_BroadCast_RoomStingTypeColor(RoomID, "[SC_26IN_AFTERBOSS3_C]", 2, C_YELLOW)
	sleep(40);
	Lua_BroadCast_RoomStingTypeColor(RoomID, "[SC_26IN_AFTERBOSS3_D]", 2, C_YELLOW)
	sleep(30);
	Lua_BroadCast_RoomStingTypeColor(RoomID, "[SC_26IN_AFTERBOSS3_E]", 2, C_LightBlue)
	sleep(35);
	Lua_BroadCast_RoomStingTypeColor(RoomID, "[SC_26IN_AFTERBOSS3_F]", 2, C_LightBlue)
	sleep(35);
	Lua_BroadCast_RoomStingTypeColor(RoomID, "[SC_26IN_AFTERBOSS3_G]", 2, C_LightBlue)
	sleep(35);
	Lua_BroadCast_RoomStingTypeColor(RoomID, "[SC_26IN_AFTERBOSS3_H]", 2, C_YELLOW)
	sleep(25);
	Yell(LightAvatar,"[SC_26IN_AFTERBOSS3_I]",3);
end
--=======================
--		Boss AI
--=======================
function Z26Instance_Boss3_Main( LightDragon, DarkDragon )	--Boss創造跟設定
	local ControlCenter = OwnerID()
	local RoomID = ReadRoleValue( ControlCenter, EM_RoleValue_RoomID )
	DebugMsg(0,0,"Z26Instance_Boss3_Main")
	--
--	local LightDragon = CreateObjByFlag( 102996, 780765, 1, 1 )
--	local DarkDragon = CreateObjByFlag( 102992, 780765, 2, 1 )
--	AddToPartition( LightDragon, RoomID )
--	AddToPartition( DarkDragon, RoomID )
	--
	local FrontDoor = CreateObjByFlag( 103044, 780765, 4, 1 )
	AddToPartition( FrontDoor, RoomID )
	SetModeEx( FrontDoor, EM_SetModeType_Obstruct, true )	--阻擋
	SetModeEx( FrontDoor, EM_SetModeType_Mark, false )		--標記
	--
	WriteRoleValue( ControlCenter, EM_RoleValue_Register+2, LightDragon )
	WriteRoleValue( ControlCenter, EM_RoleValue_Register+3, DarkDragon )
	WriteRoleValue( ControlCenter, EM_RoleValue_Register+5, FrontDoor )
	--
	AddBuff( DarkDragon, 624329, 0, -1 )
	CallPlot( DarkDragon, "Z26Instance_Boss3_AI", ControlCenter )
	WriteRoleValue( DarkDragon, EM_RoleValue_Register+1, ControlCenter )
	LockHP( DarkDragon, 1, "Z26Instance_Boss3_Die" )
end

function Z26Instance_Boss3_AI(ControlCenter)
	local Dark = OwnerID()
	local Light = ReadRoleValue( ControlCenter, EM_RoleValue_Register+2 )
	local ZoneID = ReadRoleValue( ControlCenter, EM_RoleValue_ZoneID )
	local RoomID = ReadRoleValue( ControlCenter, EM_RoleValue_RoomID )
	local BossTime = 0

	local SkillA_T =	7			--鋒利爪殺
	local SkillB_T =	7			--地塵泯滅
	local SkillC_T =	13			--血煉
	local SkillD_T = 25			--變異潛息

	local SkillA_C = 850851		--鋒利爪殺
	local SkillB_C = 850852		--地塵泯滅
--	local SkillC_C =			--血煉	召喚小怪劇情
	local SkillD_C = 624330		--變異潛息

	local MinionTable = {}
	local MinionLimit = { [154] = 6; [155] = 4; [156] = 4 }

	local OriStringTable = {"[SC_26IN_BOSS3_11]";
				"[SC_26IN_BOSS3_12]";
				"[SC_26IN_BOSS3_13]";
				"[SC_26IN_BOSS3_14]";
				"[SC_26IN_BOSS3_15]";
				"[SC_26IN_BOSS3_16]";
				"[SC_26IN_BOSS3_17]";
				"[SC_26IN_BOSS3_18]";
				"[SC_26IN_BOSS3_19]"; };
	local UseStringTable = FN_CopyTable(OriStringTable)
	local OriColorTable = {
				C_LightBlue;
				C_LightBlue;
				C_LightBlue;
				C_LightBlue;
				C_LightBlue;
				C_LightBlue;
				C_LightBlue;
				C_LightBlue;
				C_LightBlue;
						};
	local UseColorTable = FN_CopyTable(OriColorTable)

	--開戰台詞
	Lua_BroadCast_RoomStingTypeColor(RoomID, "[SC_26IN_BOSS3_01]", 2, C_LightBlue);
	Lua_BroadCast_RoomStingTypeColor(RoomID, "[SC_26IN_BOSS3_01]", 0, C_LightBlue);

	while true do
		Sleep(10)
		Lua_BellatiaDuplication_update_players(RoomID);
		BossTime = BossTime + 1
		--	偵測血量剩下10% 取消吸傷盾
		if Lua_PercentHP( Dark ) <= 11 and CheckBuff( Dark, 624329 ) == true then
			SetModeEx( Dark, EM_SetModeType_Mark, true )		--打開幽龍的標記，玩家現在可以對幽龍造成傷害
			CancelBuff_NoEvent( Dark, 624329 )
			--爆盾台詞
			Lua_BroadCast_RoomStingTypeColor(RoomID, "[SC_26IN_BOSS3_AUTOFIRE]", 2, C_YELLOW);
			Lua_BroadCast_RoomStingTypeColor(RoomID, "[SC_26IN_BOSS3_AUTOFIRE]", 0, C_YELLOW);
		end
		--	偵測戰鬥是否該結束 = 光龍死亡
		if ReadRoleValue( Light , EM_RoleValue_IsDead ) == 1 then
			Z26Instance_Boss3_DefeatPlayer( ControlCenter, Dark, Light, MinionTable )
			return
		end
		--	偵測戰鬥是否該結束 = 玩家死光
		local PlayerTable = FN_CountPlayer( Dark )
		for i = 1, #PlayerTable+1 do
			if i == #PlayerTable+1 then	--檢查迴圈跑到底表示沒有玩家活著
				Z26Instance_Boss3_DefeatPlayer( ControlCenter, Dark, Light, MinionTable )
				return
			elseif ReadRoleValue( PlayerTable[i] , EM_RoleValue_IsDead ) == 0 then
				-- 只要有玩家活著就跳出這個檢查for迴圈
				break
			end
		end
		--偵測幽龍是否被擊敗
		local FightCheck = ReadRoleValue( ControlCenter, EM_RoleValue_Register+1 )
		if FightCheck == 3 then
			return
		end
		--==============
		--AI 戰鬥過程
		--==============
		SysCastSpellLv( Dark, Light, 496266, 0 )
		SysCastSpellLv( Light, Dark, 496266, 0 )
--		FN_SuperTaunt( Dark, Light )
--		FN_SuperTaunt( Light, Dark )
		--時間到放招
		if BossTime % SkillA_T == 0 then
			SysCastSpellLv( Dark, Light, SkillA_C, 0 )
		end
		if BossTime % SkillB_T == 0 then
			SysCastSpellLv( Dark, Dark, SkillB_C, 0 )
		end
		if BossTime % SkillC_T == 0 then
			if #UseStringTable == 0 then
				UseStringTable = FN_CopyTable(OriStringTable)
				UseColorTable = FN_CopyTable(OriColorTable)
			end
			local StringNum = DW_Rand( #UseStringTable );
			Lua_BroadCast_RoomStingTypeColor(RoomID,UseStringTable[StringNum],2,UseColorTable[StringNum]);
			table.remove( UseStringTable, StringNum )
			table.remove( UseColorTable, StringNum )
			--上面這段是台詞
			for m = #MinionTable, 1, -1 do
				if ReadRoleValue( MinionTable[m], EM_RoleValue_IsDead ) == 1 or CheckID( MinionTable[m] ) == false then
					table.remove( MinionTable, m )
				end
			end
			--
			if #MinionTable < MinionLimit[ZoneID] then
				local TempMinion = Z26Instance_Boss3_MinionCreat( Dark, RoomID, MinionTable )
				for m = 1, #TempMinion do
					table.insert( MinionTable, TempMinion[m] )
				end
			end
		end
		if BossTime % SkillD_T == 0 then
			AddBuff( Dark, SkillD_C, 0, -1 )
		end
	end
end

function Z26Instance_Boss3_DefeatPlayer( ControlCenter, Dark, Light, MinionTable )	--玩家失敗
	local FrontDoor = ReadRoleValue( ControlCenter, EM_RoleValue_Register+5 )

	for i = 1, #MinionTable do
		DelObj( MinionTable[i] )		
	end
	DelObj( FrontDoor )
	DelObj( Light )
	--
	WriteRoleValue( ControlCenter, EM_RoleValue_Register+1, 2 )			--寫為2告訴中控器玩家失敗了
	--
	DelObj( Dark )
end

function Z26Instance_Boss3_Die()							--幽龍鎖血觸發劇情
	local Dark = OwnerID()
	local ControlCenter = ReadRoleValue( Dark, EM_RoleValue_Register+1 )

	WriteRoleValue( ControlCenter, EM_RoleValue_Register+1, 3 )
	SetModeEx( Dark  , EM_SetModeType_Fight , false )	--可砍殺
	SetModeEx( Dark  , EM_SetModeType_Strikback, false )	--反擊
	SetModeEx( Dark  , EM_SetModeType_Searchenemy, false )	--索敵
	FN_DelDel()
end
--=======================
--	血煉	召喚小怪劇情 & AI
--=======================

function Z26Instance_Boss3_MinionCreat( Dark, RoomID, MinionList )				--血煉	召喚小怪劇情
	local ZoneID = ReadRoleValue( Dark, EM_RoleValue_ZoneID )
	local PlayerTable = FN_CountPlayer( Dark )
	local Dx, Dy, Dz, Ddir = DW_Location( Dark )
	
	local Org={};
	Org[1]={hard=107817;normal=107987;easy=108050;};
	Org[2]={hard=107818;normal=107988;easy=108051;};
	Org[3]={hard=107819;normal=107989;easy=108052;};
	Org[4]={hard=107820;normal=107990;easy=108053;};
	local MinionType = {};
	
	if(ZoneID==154)then
		--困難模式才有這兩隻
		MinionType={ Org[1][Global_BellatiaDuplication.type], Org[2][Global_BellatiaDuplication.type], Org[3][Global_BellatiaDuplication.type], Org[4][Global_BellatiaDuplication.type], Org[2][Global_BellatiaDuplication.type], Org[3][Global_BellatiaDuplication.type]};
	else
		MinionType={ Org[1][Global_BellatiaDuplication.type], Org[2][Global_BellatiaDuplication.type], Org[3][Global_BellatiaDuplication.type], Org[4][Global_BellatiaDuplication.type] };
	end
	local MinionAnalysis={};
	local MinionMark={};
	for kind=1,#MinionType,1 do
		local Mtype=MinionType[kind];
		for pos=1,#MinionList,1 do
			local Minion=MinionList[pos];
			if(MinionMark[pos]==nil)and(Mtype==ReadRoleValue(Minion,EM_RoleValue_OrgID))then
				MinionAnalysis[kind]="alive";
				MinionMark[pos]="marked";
				break;
			end
		end
	end
	local MinionTable = {}
	
	for i = 1, 6 do
		if ZoneID ~= 154 and i == 5 then
			--如果不是困難模式 那就不召喚第5跟第6隻小怪
			break
		elseif(MinionAnalysis[i]~="alive")then
			--已不存在(或死亡)才補上
			local Temp = DW_Rand( #PlayerTable )
			local x,y,z,dir = DW_Location( PlayerTable[Temp] );
			x,y,z=DW_Relative(Dark,x,y,z,150);

			local Minion = CreateObj( MinionType[i], x,y,z,dir-180, 1 )
			AddToPartition( Minion, RoomID )
			local x,y,z,dir=DW_Location(PlayerTable[Temp]);
			Move(Minion,x,y,z);
			SetFollow( Minion, PlayerTable[Temp] );
			SysCastSpellLv(PlayerTable[Temp],Minion,499110,0);
			SetPlot( Minion, "dead", "Z26Instance_Boss3_MinionDie", 0 )
			WriteRoleValue( Minion, EM_RoleValue_Register+1, Dark );
			table.insert(MinionTable,Minion);
		end
	end

	return MinionTable
end

function Z26Instance_Boss3_MinionDie()	--小怪死亡 Boss扣血
	local Minion = OwnerID()
	local Dark = ReadRoleValue( Minion, EM_RoleValue_Register+1 )
	local MaxHp = ReadRoleValue( Dark, EM_RoleValue_MaxHP )
	local NowHp = ReadRoleValue( Dark, EM_RoleValue_HP )
	local NewHp= NowHp-(MaxHp*0.04)
	--local NewHp= NowHp-(MaxHp*0.45)
	if NowHp <= MaxHp*0.1 then		--Boss血量降到10%以下就不再因為小怪死亡而扣血
		return
	end
	if NewHp <= MaxHp*0.1 then
		WriteRoleValue( Dark, EM_RoleValue_HP, MaxHp*0.1 )
	else
		WriteRoleValue( Dark, EM_RoleValue_HP, NewHp )
	end
	--					--小怪 悔暗 的額外處理，死亡時消除鎖定玩家身上的DEBUFF
	if ReadRoleValue( Minion, EM_RoleValue_OrgID ) == 107818 then
		local Player = ReadRoleValue( Minion, EM_RoleValue_Register+2 )
		CancelBuff( Player, 624335 )
	end
end

function Z26Instance_Boss3_MinionAI_1()		--幽暗 小怪AI
	local Minion = OwnerID()
	local RoomID = ReadRoleValue( Minion, EM_RoleValue_RoomID )
	local MinionTime = 0

	local PlayerTable
	local P1, P2
	local AttachID = 0
	local Spell,Buff
	local Target=0;
	local LightOrgID=FN_Fake("LightDragon");

	while true do
		Target=ReadRoleValue(Target,EM_RoleValue_AttackTargetID);
		if(ReadRoleValue(Target,EM_RoleValue_OrgID)==LightOrgID)then
			local pos=DW_HatePosInfo(Minion,Target);
			SetHateListPoint(Minion,pos,1);
		end
		if MinionTime % 11 == 0 then				--放招冷卻
			if CheckID( AttachID ) == true then
				CancelBuff_NoEvent(P1,Buff);CancelBuff_NoEvent(P2,Buff);
				DelObj( AttachID )
			end
			--過濾可用玩家
			PlayerTable = FN_CountPlayer( Minion )
			local _tempTable={};
			local _Atable={};
			local _Btable={};
			--分類
			for i=#PlayerTable,1,-1 do
				if(ReadRoleValue(PlayerTable[i],EM_RoleValue_IsDead)==0)then
					table.insert(_tempTable,PlayerTable[i]);
					if(CheckBuff(PlayerTable[i],624340)==false)then table.insert(_Atable,PlayerTable[i]);end
					if(CheckBuff(PlayerTable[i],624342)==false)then table.insert(_Btable,PlayerTable[i]);end
				end
			end
			--DebugMsg(0,RoomID,"Atable="..#_Atable..", Btable="..#_Btable);
			local r=Rand(2);
			Spell = 850858 + r;
			local playerNumEnough=false;
			--從正確類別中選出兩人
			if(r==0)and(#_Atable>=2)then
				playerNumEnough=true;
				P1=table.remove(_Atable,DW_Rand(#_Atable));
				P2=table.remove(_Atable,DW_Rand(#_Atable));
			elseif (r==1)and(#_Btable>=2)then
				playerNumEnough=true;
				P1=table.remove(_Btable,DW_Rand(#_Btable));
				P2=table.remove(_Btable,DW_Rand(#_Btable));
			end
			if(playerNumEnough==true)then
				--創建Attach隱形球並黏到P2上
				local Ax, Ay, Az, Adir = DW_Location( Minion )
	--			AttachID = CreateObj( 107071, Ax, Ay, Az, Adir, 1 )
				AttachID = CreateObj( 103376, Ax, Ay, Az, Adir, 1 )
				SetModeEx( AttachID, EM_SetModeType_Mark, false )
				SetModeEx( AttachID, EM_SetModeType_HideName, true )
				SetModeEx( AttachID, EM_SetModeType_Strikback , false )
				SetModeEx( AttachID, EM_SetModeType_Searchenemy , false )
				SetModeEx( AttachID, EM_SetModeType_Show , false )
				AddToPartition( AttachID, RoomID )
				AttachObj( AttachID, P2, 4, "p_down", "p_hit_point01" );
				--施展連結特效法術
				Sleep(10)
				WriteRoleValue(AttachID,EM_RoleValue_LiveTime,10);--確保無殘影
				SysCastSpellLv( P1, AttachID, Spell, 0 )
				if(r==0)then Buff=624340;else Buff=624342;end
				AddBuff(P1,Buff,0,10);--確保無殘影
				AddBuff(P2,Buff,0,10);--確保無殘影
			end
		end
		if(P1~=nil)and(P2~=nil)then
			if ReadRoleValue( P1, EM_RoleValue_IsDead ) == 0 and ReadRoleValue( P2, EM_RoleValue_IsDead ) == 0 and P1 ~= P2 then
				if Spell == 850858 then			--兩人必須遠離對方
					if GetDistance( P1, P2 ) <= 100 then
						SysCastSpellLv( Minion, P1, 850860, 0 )
						SysCastSpellLv( Minion, P2, 850860, 0 )
						DebugMsg(P1,RoomID,"Gray did dmg to you, from:"..P2);
						DebugMsg(P2,RoomID,"Gray did dmg to you, from:"..P1);
					end
				elseif(spell==850859)then						--兩人必須靠近對方
					if GetDistance( P1, P2 ) >= 10 then
						SysCastSpellLv( Minion, P1, 850860, 0 )
						SysCastSpellLv( Minion, P2, 850860, 0 )
						DebugMsg(P1,RoomID,"Black did dmg to you, from:"..P2);
						DebugMsg(P2,RoomID,"Black did dmg to you, from:"..P1);
					end	
				end
			elseif CheckID( AttachID ) == true then
				CancelBuff_NoEvent(P1,Buff);CancelBuff_NoEvent(P2,Buff);
				DelObj( AttachID )
			end
		end
		--
		Sleep(10)
		MinionTime = MinionTime +1
	end	
end

function Z26Instance_Boss3_MinionAI_2_3_4()		--悔暗 異怪 異徒 小怪AI
	local Minion = OwnerID()
	local RoomID = ReadRoleValue( Minion, EM_RoleValue_RoomID )
	local ZoneID = ReadRoleValue( Minion, EM_RoleValue_ZoneID )
	local OrgID = ReadRoleValue( Minion, EM_RoleValue_OrgID )	--幽暗 107817, 悔暗 107818, 異怪 107819, 異徒 107820

	local MinionTime = 0
	local Target=0;
	local LightOrgID=FN_Fake("LightDragon");
	
	

	while true do
		Target=ReadRoleValue(Target,EM_RoleValue_AttackTargetID);
		if(ReadRoleValue(Target,EM_RoleValue_OrgID)==LightOrgID)then
			local pos=DW_HatePosInfo(Minion,Target);
			SetHateListPoint(Minion,pos,1);
		end
		
		if OrgID == 107818 then						--悔暗 107818
			local PlayerTable = FN_CountPlayer( Minion )
			local TargetPlayer = PlayerTable[ DW_Rand(#PlayerTable) ]
			if ReadRoleValue( TargetPlayer, EM_RoleValue_IsDead ) == 1 or ReadRoleValue( TargetPlayer, EM_RoleValue_ZoneID ) ~= ZoneID then
				PlayerTable = FN_CountPlayer( Minion )
				TargetPlayer = PlayerTable[ DW_Rand(#PlayerTable) ]
			end
			FN_SuperTaunt( Minion, TargetPlayer )
			WriteRoleValue( Minion, EM_RoleValue_Register+2, TargetPlayer )	--把鎖定的玩家記錄在身上
			if GetDistance( Minion, TargetPlayer ) <= 50 then
				AddBuff( TargetPlayer, 624335, 0, -1 )
			end
		elseif OrgID == 107819 and MinionTime%6 == 0 then			--異怪 107819
			local PlayerTable = FN_CountPlayer( Minion )
			local TargetPlayer = PlayerTable[ DW_Rand(#PlayerTable) ]
			CastSpell( Minion, TargetPlayer, 850854 )
		elseif OrgID == 107820 and MinionTime%7 == 0 then			--異徒 107820
			local RandNum = DW_Rand(3)
			if RandNum <= 2 then			--驚嚇 魂綁
				local PlayerTable = FN_CountPlayer( Minion )
				local P1, P2 = FN_Rand2Player( PlayerTable )
				-- 上面是隨機挑出2名玩家
				local Spell = { 850855, 850856 }
				SysCastSpellLv( Minion, P1, Spell[RandNum], 0 )
				SysCastSpellLv( Minion, P2, Spell[RandNum], 0 )
			else					--回生
				CastSpell( Minion, Minion, 850857 )
			end
		end
		--
		Sleep( 10 )
		MinionTime = MinionTime + 1
	end
end

--=======================
--		其他函式
--=======================
function FN_SuperTaunt( TarID, ListID )
	local MaxHate, HateListPos = cl_ReadTarget_hatelist_Up( TarID , ListID )	--得出 最大仇恨、仇恨表位置
	SetHateListPoint( TarID , HateListPos , MaxHate*9999 )
	SetAttack( TarID , HateListPos)
end

function FN_CountPlayer(NPC)
	local PlayerTable = {}
	local room=ReadRoleValue(NPC,EM_RoleValue_RoomID);
	for i=1,#Global_BellatiaDuplication[room].players,1 do
		local _player=Global_BellatiaDuplication[room].players[i].guid;
		if(CheckBuff(_player,624292)==true)and(GetDistance(NPC,_player)<800)then
			table.insert( PlayerTable, _player );
		end
	end
	--DebugMSG(0,0,"PlayerNum="..#PlayerTable)
	return PlayerTable
end

function FN_Rand2Player( Group )						--專門挑2個倒楣鬼出來
	if #Group == 1 then
		return Group[1], Group[1]
	elseif #Group >= 2 then
		local Player1
		local Player2
		while true do
			local Temp = DW_Rand( #Group )
			if Player1 == nil then
				Player1 = Group[Temp]
			elseif Group[Temp] ~= Player1 then
				Player2 = Group[Temp]
				break
			end
		end
		return Player1, Player2
	end
end

function FN_DelDel()
	Lua_DavisDelObj( 107817 )
	Lua_DavisDelObj( 107818 )
	Lua_DavisDelObj( 107819 )
	Lua_DavisDelObj( 107820 )
	Lua_DavisDelObj( 107987 )
	Lua_DavisDelObj( 107988 )
	Lua_DavisDelObj( 107989 )
	Lua_DavisDelObj( 107990 )
	Lua_DavisDelObj( 108050 )
	Lua_DavisDelObj( 108051 )
	Lua_DavisDelObj( 108052 )
	Lua_DavisDelObj( 108053 )
	Lua_DavisDelObj( 103044 )
	Lua_DavisDelObj( 107071 )
end

function FN_Nothing()
	return
end

function FN_CopyTable(OriTable)
	local NewTable = {}

	for i = 1, #OriTable do
		table.insert( NewTable, OriTable[i] )
	end

	return NewTable
end
function FN_Fake(who)--回傳正確的資料
	local light={hard=102567;normal=107985;easy=108048;}; 
	local dark={hard=102992;normal=107986;easy=108049;};
	if(who=="LightDragon")then
		return light[Global_BellatiaDuplication.type];
	else
		return dark[Global_BellatiaDuplication.type];
	end	
end