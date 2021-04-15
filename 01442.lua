-------------------------------------------------------------------------------------------------------
--圖書館清除TP及死亡懲罰
-------------------------------------------------------------------------------------------------------
function GuildLibraryForExpTp0Lv1()

	-- 2013.04.08 修正公會城堡單一層數因副本規則在無人的5分鐘後消失時，每當同層又被開啟，圖書館的使用人數有機率繼承到舊有圖書館累積人數的問題。 -- 
	local Library = OwnerID()
	local Zone = ReadRoleValue( Library , EM_RoleValue_ZoneID )
	local ZoneID = Zone-1000*math.floor( Zone/1000 )
	local RoomID = ReadRoleValue( Library , EM_RoleValue_RoomID )
--	if GuildLibraryID == nil then
--		GuildLibraryID = {}
--	end
--	GuildLibraryID[RoomID] = Library	
--	if GuildLibraryID[RoomID] == nil then
--		GuildLibraryID[RoomID] = OwnerID()	--用全域變數記下圖書館的ID
--	end
--	if GuildLibraryID[RoomID] ~= OwnerID() then
--		GuildLibraryID[RoomID] = OwnerID()	--用全域變數記下圖書館的ID
--	end
	DebugMsg( 0 , 0 , "--GuildLibraryForExpTp0Lv1--  "..ZoneID);
	if (ZoneID == 402) or ( ZoneID == 951 ) then
		SetModeEx( Library , EM_SetModeType_Mark , true )	--標記
		SetModeEx( Library , EM_SetModeType_HideName , true )	--名稱
		SetModeEx( Library , EM_SetModeType_ShowRoleHead , true )	--頭像框
		SetModeEx( Library , EM_SetModeType_Fight , true )	--可砍殺攻擊
		SetModeEx( Library , EM_SetModeType_Move , false )	--移動
		SetModeEx( Library , EM_SetModeType_Obstruct , true )	--阻擋
		SetModeEx( Library , EM_SetModeType_Strikback , false )	--反擊
		SetModeEx( Library , EM_SetModeType_DisableRotate , true )	--轉向
		SetModeEx( Library , EM_SetModeType_Searchenemy , false )	--索敵
		SetModeEx( Library , EM_SetModeType_NotShowHPMP , true )	--不顯示血條
		AddBuff( Library , 505921 , 89 , -1 )	--90%		--被玩家攻擊傷害折扣 法術等級 0 = 1%	
		AddBuff( Library , 505516 , 99 , -1 )	--100%	--被NPC攻擊傷害增加 法術等級 0 = 1%	
		AddBuff( Library , 502707 , 1 , -1 )	--非戰鬥中不回血的buff (ownerID,buff,LV,Time)
		WriteRoleValue( Library  , EM_RoleValue_Register+1 ,  38  )	--紀錄為大型建築物---***
		SetCursorType( Library , eCursor_Interact ) --游標變成 齒輪
		SetPlot( Library , "touch" , "Yuyu_GuildWarBuliding_1_02" , 125 )	--公會城戰時
		SetPlot( TargetID() , "dead" , "Lua_GUILDWAR_BuildDScript_2" , 0 )	--圖書館死亡劇情
	else
		SetPlot( Library , "touch" , "GuildLibraryForExpTp1" , 125 )
	end
end
-------------------------------------------------------------------------------------------------------
function Guildreminder()	
	ScriptMessage( TargetID() , OwnerID() , 1 , "[GUILD_REMINDER]", C_SYSTEM ) --你不是這個公會的成員喔！
	ScriptMessage( TargetID() , OwnerID() , 0 , "[GUILD_REMINDER]", C_SYSTEM ) 
end
-------------------------------------------------------------------------------------------------------
function GuildLibraryForExpTp1End()
	ScriptMessage( TargetID() , OwnerID() , 1 , "[GUILD_LIBRARY05]", C_SYSTEM ) --目前圖書館正在忙碌中
	ScriptMessage( TargetID() , OwnerID() , 0 , "[GUILD_LIBRARY05]", C_SYSTEM ) 
end
-------------------------------------------------------------------------------------------------------
function GuildLibraryForExpTp1( Library )	--讀書回exp負債-給圖書館begin --記得加公會檢查段
--	DebugMsg( 0 , 0 , "--touch--  ".."TargetID="..TargetID());
	local Player = OwnerID()						-- 玩家固定為 Player
	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID )
--	local Library = GuildLibraryID[RoomID]	
	Library = ( Library == nil ) and TargetID() or Library;
--	DebugMsg( 0, RoomID ,"Library="..Library )			-- 圖書館
	local LibraryUser = ReadRoleValue( Library , EM_RoleValue_PID  )		--取出圖書館的PID
	local PlayerGuildID = ReadRoleValue( Player , EM_RoleValue_GuildID )	--取出玩家的公會ID
	local BuildingGuildID = ReadRoleValue( Library , EM_RoleValue_GuildID ) 	-- 取出圖書館的公會ID
--	BuildingGuildID = PlayerGuildID;
--	DebugMsg( 0 , RoomID , "PlayerGUID = "..PlayerGuildID.." , ".."BuildingGuildID = "..BuildingGuildID )
	local Job = ReadRoleValue( Player , EM_RoleValue_VOC )
	
	if PlayerGuildID ~= BuildingGuildID and Job ~= 0 then
		ScriptMessage( Player , Player , 1 , "[GUILD_REMINDER]", C_SYSTEM )
		ScriptMessage( Player , Player , 0 , "[GUILD_REMINDER]", C_SYSTEM )
	else
		if LibraryUser >= 30  then	-- 同時點擊人數上限為 30 人
			ScriptMessage( Player , Player , 1 , "[GUILD_LIBRARY05]" , C_SYSTEM )	--目前圖書館正在忙碌中
			ScriptMessage( Player , Player , 0 , "[GUILD_LIBRARY05]" , C_SYSTEM ) 
		--	DebugMsg( 0 , RoomID , "Full = "..LibraryUser )
		elseif  LibraryUser < 30  then
			WriteRoleValue( Library , EM_RoleValue_PID , LibraryUser+1 )	 --把使用人數記錄到PID
			DebugMsg( 0 , RoomID , "Users = "..ReadRoleValue( Library , EM_RoleValue_PID ) )
			local LibraryLv = {}
			if Job ~= 0 then
				LibraryLv = {	[112688] = 1200 , 
						[112689] = 1100 , 
						[112690] = 1000 , 
						[112691] = 900 , 
						[112692] = 800 , 
						[112693] = 700 , 
						[112694] = 600 , 
						[112695] = 500 , 
						[112696] = 400 , 
						[112697] = 300
									}
			else
				LibraryLv = {	[112688] = 20 , 
						[112689] = 20 , 
						[112690] = 20 , 
						[112691] = 20 , 
						[112692] = 20 , 
						[112693] = 20 , 
						[112694] = 20 , 
						[112695] = 20 , 
						[112696] = 20 , 
						[112697] = 20
									}
			end
			local Time = ReadRoleValue( Library , EM_RoleValue_OrgID )
		--	local Casting = { 1200 , 1100 , 1000 , 900 , 800 , 700 , 600 , 500 , 400 , 300 }	-- Casting bar讀取時間
		--	local TempOBJ = { 112688 , 112689 , 112690 , 112691 , 112692 , 112693 , 112694 , 112695 , 112696 , 112697 } --圖書館任務npcID
		--	local Time = 0
		--
		--	for i = 1 , #TempOBJ , 1 do
		--		if ReadRoleValue( Library , EM_RoleValue_OrgID ) == TempOBJ[i] then --每一級圖書館時間不同
		--			Time = Casting[i]	--設定Time為相對應時間
		--			break
		--		end
		--	end
			--
			AddBuff( Player , 506163 , 0 ,Time )
			WriteRoleValue( Player ,  EM_RoleValue_Register + 1 , Library );
			if BeginCastBarEvent( Player, Player , "[GUILD_LIBRARY01]" , LibraryLv[Time] , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_NORMAL , 0 , "GuildLibraryForExpTp2" ) ~= 1 then
				LibraryUser = ReadRoleValue( Library , EM_RoleValue_PID )      --取出圖書館的PID
				WriteRoleValue( Library , EM_RoleValue_PID , LibraryUser-1 ) --回寫圖書館的PID值
				CancelBuff( Player, 506163 )	--CastingBar失敗，把研讀中的狀態取消
			--	DebugMsg( 0 , RoomID , "Non Casting = "..ReadRoleValue( Library , EM_RoleValue_PID ) )
			end
		end
	end
end
-------------------------------------------------------------------------------------------------------
function GuildLibraryForExpTp2( Player , CheckStatus )
--	DebugMsg( 0 , 0 , "--touch222222--  ".."OwnerID="..OwnerID().."  ".."TargetID="..TargetID());
--	DebugMsg(0,0,"Player="..Player.."  ".."CheckStatus="..CheckStatus)
	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID )
--	local Library = GuildLibraryID[RoomID]	-- 圖書館
--	local Library = TargetID();
	local Library = ReadRoleValue( Player ,  EM_RoleValue_Register + 1 );
--	DebugMsg(0,RoomID,"Library="..Library)
	local LibraryUser = ReadRoleValue( Library , EM_RoleValue_PID )	--取出圖書館的PID	

	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then	-- 成功
			EndCastBar( Player , CheckStatus )
		--	DebugMsg( 0 , RoomID , "Casting Done = "..ReadRoleValue( Library , EM_RoleValue_PID ) )
			local DebEXP = ReadRoleValue( Player , EM_RoleValue_DebtExp )	--負債EXP，得出來會是負值
			local DebTP = ReadRoleValue( Player , EM_RoleValue_DebtTP )	--負債TP，得出來會是負值
			local ThisLVExp = ReadRoleValue( Player , EM_RoleValue_ThisLVExp )	--該等級所需Exp
			local EXP= math.floor(10+(ThisLVExp/20*0.005))
			local TP= math.floor(EXP*0.1)
			local NEWEXP = DebEXP+EXP	--將負債加上Exp
			local NEWTP = DebTP+TP
			if DebEXP == 0 then
				ScriptMessage( Player , Player , 1 , "[GUILD_LIBRARY02]" , C_SYSTEM )	--您目前已經沒有死亡懲罰
				ScriptMessage( Player , Player , 0 , "[GUILD_LIBRARY02]" , C_SYSTEM )
			--	DebugMsg( 0 , RoomID , "No Debt = "..ReadRoleValue( GuildLibraryID[RoomID] ,   EM_RoleValue_PID ) )
			else
				if (DebEXP*(-1)) < EXP then
					WriteRoleValue( Player , EM_RoleValue_DebtExp , 0 )
					WriteRoleValue( Player , EM_RoleValue_DebtTP , 0 )	
					ScriptMessage( Player , Player , 1 , "[GUILD_LIBRARY03]" , C_SYSTEM )	--您的死亡懲罰已經清除完畢
					ScriptMessage( Player , Player , 0 , "[GUILD_LIBRARY03]" , C_SYSTEM )	--您的死亡懲罰已經清除完畢
				--	DebugMsg( 0 , RoomID , "All Clear = "..ReadRoleValue( GuildLibraryID[RoomID] ,   EM_RoleValue_PID ) )
				else
					WriteRoleValue( Player , EM_RoleValue_DebtExp , NEWEXP )	--回寫玩家身上負債
					WriteRoleValue( Player , EM_RoleValue_DebtTP , NEWTP )
					ScriptMessage( Player , Player , 1 , "[GUILD_LIBRARY04]".. " EXP " .. EXP .. " / " .. "TP " .. TP , C_SYSTEM )	--經過了虔誠的研讀，你清除了經驗負債
					ScriptMessage( Player , Player , 0 , "[GUILD_LIBRARY04]".. " EXP " .. EXP .. " / " .. "TP " .. TP , C_SYSTEM )	--經過了虔誠的研讀，你清除了經驗負債										
				--	BeginPlot( Player , "GuildLibraryForExpTp1" , 0 )	--反覆掛網
				--	DebugMsg(0,RoomID,"Library="..ReadRoleValue( Player ,  EM_RoleValue_Register + 1 ))
					CallPlot( Player , "GuildLibraryForExpTp1" , Library );
				--	DebugMsg( 0 , RoomID , "Repeat = "..ReadRoleValue( GuildLibraryID[RoomID] ,   EM_RoleValue_PID ) )
				end
			end
		else	-- 失敗
			CancelBuff( Player , 506163 )
			EndCastBar( Player , CheckStatus )
		--	DebugMsg( 0 , RoomID , "Casting Fail = "..ReadRoleValue( Library , EM_RoleValue_PID ) )
		end
--		DebugMsg(0,RoomID,"Library="..Library)
		WriteRoleValue( Library , EM_RoleValue_PID , LibraryUser-1 )	--回寫圖書館的PID值		
	end
end
--
function Hao_Guild_Library_Set_Users(Set)	-- 2013.01.03新增 調整圖書館使用人數

	local Player = OwnerID()
	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID )
	
	if Set == 9527 then
		DebugMsg( Player , RoomID , "Library Users = "..ReadRoleValue( GuildLibraryID[RoomID] , EM_RoleValue_PID ) )
	else
		WriteRoleValue( GuildLibraryID[RoomID] , EM_RoleValue_PID , Set )	
		DebugMsg( Player , RoomID , "Library Users = "..ReadRoleValue( GuildLibraryID[RoomID] , EM_RoleValue_PID ) )
	end
end