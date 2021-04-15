function event_module(Type) 
--Type類型 
--EM_Event_Module_Type_LevelUp 		= 0	( 0 為玩家升級 ）
--EM_Event_Module_Type_PlayerDead 		= 1	( 1 為玩家死亡 ）
--EM_Event_Module_Type_ChangeZone	= 2	( 2 為換區 ）
--EM_Event_Module_Type_Login		= 3	( 3 為login in ）
--EM_Event_Module_Type_NPCDead		= 4	( 4 為NPC死亡 ）
--EM_Event_Module_Type_RoleLogin		= 5	( 5 為角色登入 ）

	local Language = GetServerDataLanguage() 		           --抓取目前server的語系
	local PlayerLV = ReadRoleValue( TargetID() , EM_RoleValue_LV ) --讀取玩家的主職等級
	local Race = ReadRoleValue( TargetID()  , EM_RoleValue_RACE )
	local TargetLanguage = {	none="",			--判斷該語系是否為指定營運商，依不同需求，跑不同的副程式
						eneu="Germany_1year_FrogPet_give",		-- 歐系英文 -- 德國六語系
						enus ="Germany_1year_FrogPet_give",		-- 美洲英文 -- 德國六語系
						fr="Germany_1year_FrogPet_give",		-- 法國 -- 德國六語系
						pl="Germany_1year_FrogPet_give",		-- 波蘭 -- 德國六語系
						de ="Germany_1year_FrogPet_give",		-- 德國 -- 德國六語系
						es ="Germany_1year_FrogPet_give",		-- 西班牙 -- 德國六語系
						ru ="Germany_1year_FrogPet_give",		-- 俄羅斯
						kr="Levelup_event","Lua_KR_HelpNewbie_lv30",	-- 韓國
						tw="Lua_Hao_TW_Phirius_Login",		-- 台灣	-- 2012.09.27 必爾汀代幣兌換商人
						tr="Lua_turkeyLvup_event",			-- 土耳其
						th="Lua_turkeyLvup_event",			-- 泰國
						ae="Lua_turkeyLvup_event",			-- 中東
						jp ="Lua_JP_1year_anniversary" ,			-- 日本
						ph ="Lua_PH_NewBie_event" ,			-- 菲律賓	
						rw="Germany_1year_FrogPet_give"}		-- Dev1 測試	-- 2012.09.27 必爾汀代幣兌換商人
	if TargetLanguage[Language] == nil then		          --當server語系都不是TargetLanguage裡內所指定的語系時，就會指定為 none值
		Language = "none"
	end

	
	--Type = 0 , 玩家升級
	if Type == 0 then
		Apon_Suitskill_size_1_levelup();	--套裝技能介面開放需求劇情
		Lua_ThridJob_Check(); 	--第三職業提示
		lua_skill_keyitem_organize();	--2013.08.05 排除生產技能資格重要物品和升階任務並存的狀況
	end
	
	--Type = 1 , 玩家死亡
	if Type == 1 then
		CallPlot(OwnerID(),"event_module_dead",Type) 	--玩家死亡副程式
	end
	
	--Type = 2 , 角色換區
	if Type == 2 then
		local Player = OwnerID()
		
		--檢查背景音樂運行狀況
		if ReadRoleValue(Player,EM_LuaValueFlag_IsStopBGM)==1 then
			ClientEvent_Range(Player,0,"playmusic");
			WriteRoleValue(Player,EM_LuaValueFlag_IsStopBGM,0);
		end
		
		--進入zone 154, 155, 156切換音樂 by 蝌蚪
		local _player = AddyPlayer:new(OwnerID())
		if _player.zone_id == 154 or _player.zone_id == 155 or _player.zone_id == 156 then
			_player:beginPlot("BellatiaDuplication_player_register")
		end
		
		-- 2013.08.01 阿浩:換區時，刪除角色持有Key(哥布林礦坑開啟寶箱資格)
		if _player.zone_id ~= 352 and CheckFlag( Player , 542743 ) == true then
			SetFlag( Player , 542743 , 0 )	-- 領取寶箱資格
			SetFlag( Player , 542875 , 0 )	-- ACT3 風區寶箱Key		
			SetFlag( Player , 542876 , 0 )	-- ACT3 火區寶箱Key
			SetFlag( Player , 542877 , 0 )	-- ACT3 土區寶箱Key
			SetFlag( Player , 542878 , 0 )	-- ACT3 水區寶箱Key				
		end
		
		lua_skill_keyitem_organize();	--2013.08.05 排除生產技能資格重要物品和升階任務並存的狀況
	end
	
	--Type = 3 , login in
	if Type == 3 then
		Apon_Suitskill_size_1_login();
		Hsiang_GuildPetProc_PlayerLogin();	--新手寵物 角色登入處理劇情
		Vip_Member_Check();
	end
	
	--Type = 4 , NPC死亡
	if Type == 4 then
		CallPlot( OwnerID() , "event_module_NPC_dead" , Type ) --寵物系統，怪物NPC死亡機率出現帕奇鼠
	end
	
	--Type = 5 , 角色登入
	if Type == 5 then
		DW_SetOccupationFlag();	--根據主職給予指定職業的旗標
		lua_WrongQuestReset();
		Z32_Q427124MSG_00();	--顯示ScriptMessage，提醒玩家前往接取任務427124。
		Lua_ThridJob_Check();	--第三職業提示
		LV60_ES_SendLetter();	--Lv60菁英技能任務，系統發信
		Z23_425217_flagive();	--為了拯救看不見吉兒的人們
		--YoYo_Phantom_Remind();	--幻靈系統引導提示，6.5.2開啟
		lua_skill_keyitem_organize();	--2013.08.05 排除生產技能資格重要物品和升階任務並存的狀況
	end

	CallPlot( OwnerID() , TargetLanguage[Language] , PlayerLV , Type , Race ) --未來可追加死亡副程式、換區判斷（傳兩個值過去副程式）
end

function event_module_dead(Type)	--玩家死亡副程式
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
	local ZoneID =  ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID ) 
	local Zone = ZoneID -1000*math.floor( ZoneID / 1000 )
--	if Zone == 402 or Zone == 31 then	--公會城戰死亡劇情
	if Zone == 402 then			--公會城戰死亡劇情 2012.03.16 移除 Zone 31 影鑄矮人新手區
		EndCastBar( OwnerID() , 0 )	--關閉玩家施法條
		WriteRoleValue( OwnerID() , EM_RoleValue_PID, 0 ) --解除鎖定可再次研發YUYU需求
		local	RegisterO = ReadRoleValue( OwnerID(), EM_RoleValue_Register1 );
		DebugMsg( 0, RoomID ,"RegisterO = "..RegisterO.." NO 0.")
		if RegisterO ~= 0 then
			WriteRoleValue( RegisterO , EM_RoleValue_Register1, 0 ) --解除鎖定榮譽水晶
			WriteRoleValue( OwnerID() , EM_RoleValue_Register1, 0 )
		end
		local Angel = 0
		local Count = BuffCount ( OwnerID())
		for i = 0 , Count do
			local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID ) -- 基本法術ID
			if BuffID == 501387 then--大天使....
				CancelBuff_NoEvent(OwnerID(),505918)
				CancelBuff_NoEvent(OwnerID(),505919)
				CancelBuff_NoEvent(OwnerID(),505518)
				CancelBuff_NoEvent(OwnerID(),505920)
				CancelBuff_NoEvent(OwnerID(),506136)
				Angel = 1
				break
			end
		end
		if Angel == 0 then
			local AdB = 0
			for i = 0 , Count do
				local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID ) -- 基本法術ID
				if BuffID == 505918 then--輕傷狀態....
					CancelBuff_NoEvent(OwnerID(),505918)
					AddBuff(OwnerID(),505919,0,600)
					AdB = AdB + 1
					break
				elseif BuffID == 505919 then--重傷狀態....
					CancelBuff_NoEvent(OwnerID(),505919)
					AddBuff(OwnerID(),505518,0,180)
					AdB = AdB + 1
					break
				elseif BuffID == 505518 then--迴光返照....
					CancelBuff_NoEvent(OwnerID(),506136)
					CancelBuff_NoEvent(OwnerID(),505518)
					AddBuff(OwnerID(),505920,0,600)
					AdB = AdB + 1
					break
				elseif BuffID == 505920 then--奄奄一息....
					AdB = AdB + 1
					break
				end
			end
			if AdB == 0 then
				AddBuff(OwnerID(),505918,0,600)
			end
		end
	end
	if Zone == 446 then	--泰爾文戰場戰死亡劇情
		EndCastBar( OwnerID() , 0 )	--關閉玩家施法條
		WriteRoleValue( OwnerID() , EM_RoleValue_PID, 0 ) --解除鎖定可再次研發YUYU需求
		local	RegisterO = ReadRoleValue( OwnerID(), EM_RoleValue_Register1 );
		DebugMsg( 0, RoomID ,"RegisterO = "..RegisterO.." NO 0.")
		if RegisterO ~= 0 then
			WriteRoleValue( RegisterO , EM_RoleValue_Register1, 0 ) --解除鎖定榮譽水晶
			WriteRoleValue( OwnerID() , EM_RoleValue_Register1, 0 )
		end
	end
--****"↓寵物系統，主人死亡，正在召喚中的寵物忠誠度下降，飽食度下降"****--

	if Zone < 400 then	-- 2010/10/07 修正招喚寵物後，在跨伺服器戰場，主人死亡時，寵物的忠誠度及飽食度會扣除的問題。
		local Mode = -1
		local ModePet = -1
	
		local Loyal = 3		--忠誠度
		local Hunger = 30	--飽食度
	
		for i = 0,5 do
			Mode = ReadPetValue( OwnerID(), i ,EM_CultivatePetStructValueType_EventType ) --寵物狀態(正被召喚(2)、正在旅行(4)、正在生產(8)...etc)
			if Mode == 2 then
				ModePet = i	--寫入i為正在召喚出來的寵物欄位序號
			end
		end
		if (ModePet ~= -1) then
			local NowHunger = ReadPetValue( OwnerID(), ModePet ,EM_CultivatePetStructValueType_Hunger )--目前飽食度
			local NowLoyal = ReadPetValue( OwnerID(), ModePet ,EM_CultivatePetStructValueType_Loyal )--目前忠誠度
	
			if (NowHunger-Hunger) < 0 then
				WritePetValue( OwnerID() , ModePet , EM_CultivatePetStructValueType_Hunger , 0 )  
			else
				AddPetValue( OwnerID() , ModePet , EM_CultivatePetStructValueType_Hunger , -Hunger )  --死亡減少飽食度
			end
	
			if (NowLoyal-Loyal) < 0 then
				WritePetValue( OwnerID() , ModePet , EM_CultivatePetStructValueType_Loyal , 0 )  
			else
				AddPetValue( OwnerID() , ModePet , EM_CultivatePetStructValueType_Loyal , -Loyal )  --死亡減少忠誠度
			end
	
			local Str = "[SC_PETSYS_01][$SETVAR1="..Loyal.."][$SETVAR2="..Hunger.."]"
			ScriptMessage( OwnerID(), OwnerID(), 0 , Str , "0xff00ff00" )
		end
	end
--****"↑寵物系統 ****--
end

--寵物系統，怪物NPC死亡機率出現帕奇鼠

function event_module_NPC_dead(Type)	--NPC死亡副程式 701584
	local O_ID = OwnerID() 		--NPC
	local T_ID = TargetID()  	--NPC

	local RoomID = ReadRoleValue(O_ID,EM_RoleValue_RoomID) 
	local Zone = ReadRoleValue(O_ID,EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )
	local Npc_SEX = ReadRoleValue( O_ID , EM_RoleValue_SEX  )   --NPC的性別,0男、1女、2精英、3王級菁英、4世界王級菁英
	local Npc_Camp = ReadRoleValue( O_ID , EM_RoleValue_CampID  )   --NPC的陣營,需特別判斷，排除技能型寵物(EX：森林牧者的)    3為Monster
	local IsPet = ReadRoleValue(O_ID,EM_RoleValue_Register+6) --若值為1010，則該NPC為寵物不可出帕奇鼠
	local NoMouse = CheckFlag(O_ID,544801) --若為true，則該NPC為劇情用不可出帕奇鼠之NPC
	-- 2013.03.11 阿浩：更新 Zone 條件為 1 ~ 34 --
	local PlayerID = ReadRoleValue( O_ID , EM_RoleValue_AttackTargetID )	--玩家
--	if ReadRoleValue( PlayerID , EM_RoleValue_IsPlayer ) == 1 then
--		if (ZoneID <= 34) and (Npc_SEX < 3) and (IsPet ~= 1010) and (Npc_Camp==3) and (NoMouse == false) then
--			DebugMsg( PlayerID , RoomID ,"O" )
--		else
--			DebugMsg( PlayerID , RoomID ,"X" )
--		end
--	end
	
	if (ZoneID <= 34) and (Npc_SEX < 3) and (IsPet ~= 1010) and (Npc_Camp==3) and (NoMouse == false) then--玩家處於大區域、且該怪物為王級精英以下
		local OrgID = ReadRoleValue(O_ID, EM_RoleValue_OrgID  ) 			--該怪在資料庫的統一ID
	--	local PlayerID = ReadRoleValue( O_ID , EM_RoleValue_AttackTargetID )	--玩家
		local PlayerLV = ReadRoleValue(PlayerID , EM_RoleValue_LV  ) 		--玩家LV
		local MonsterLV = ReadRoleValue(O_ID , EM_RoleValue_LV  )			--怪物LV
		local GMtest =  CountBodyItem( PlayerID , 204512 ) 				--帕奇帕奇KEY
		local GMtestSP =  CountBodyItem( PlayerID , 203477 ) 				--特殊劇情觸發鑰匙
		local Rate = 150								--出現帕奇鼠的機率
--		DebugMsg( 0, RoomID ,"AttackTarget="..AttackTarget)				
--		DebugMsg( 0, RoomID ,"AttackTargetPlayerLV="..PlayerLV)				
--		DebugMsg( 0, RoomID ,"MonsterLV="..MonsterLV)	

		if MonsterLV > PlayerLV then							--若怪物等級大於玩家等級，則出現帕奇鼠機率增加
			local PlayerX = PlayerLV+5
			local PlayerXX = PlayerLV+10
			if (MonsterLV - PlayerXX) >0 then
				Rate = Rate-50
			elseif (MonsterLV - PlayerX) >0 then
				Rate = Rate-25
			end
		else										--若怪物等級小於玩家等級10級，則不會出現帕奇鼠
			local MonsterX = MonsterLV+5
			local MonsterXX = MonsterLV+10
			if (PlayerLV - MonsterXX) >0 then
				Rate = 1000
			end
		end			

		if GMtest >0 then
			Rate = 5
		end

		local PaChiMouse = Rand(Rate)							--帕奇鼠出現的機率

		if (PaChiMouse > 0 and PaChiMouse < 5) or GMtest > 0 or GMtestSP > 0 then	-- 2013.03.14 調整 gm 持有觸發劇情Key時，出現帕奇鼠的機率
			if Rate == 5 then							--如果是因為有了GM鑰匙，才百發百中，則秀訊息。
				ScriptMessage(PlayerID, PlayerID , 1 , "You are GM,You Have The Key - ".."[204512]".."!" , 0) 
				ScriptMessage(PlayerID, PlayerID , 0 , "You are GM,You Have The Key - ".."[204512]".."!" , 0) 	
			end

			local Mouse = 103566
			local Chance = Rand(100)

			if Chance > 10 and Chance < 15 then					--5%機率出現 黃金帕奇鼠
				Mouse = 103567
			end

			if GMtestSP >0 then							--如果是因為有了GM鑰匙，才出現黃金帕奇鼠，則秀訊息。
				Mouse = 103567
				ScriptMessage(PlayerID, PlayerID , 1 , "You are GM,You Have The Key - ".."[203477]".."!" , 0) 
				ScriptMessage(PlayerID, PlayerID , 0 , "You are GM,You Have The Key - ".."[203477]".."!" , 0) 
			end

			local Str = "[SC_PETSYS_28][$SETVAR1=".."["..OrgID.."]".."]"
			--發現了一隻寄生在OrgID身上的帕奇鼠！[103567]
			ScriptMessage(PlayerID, 0 , 1 , Str , "0xff00ff00") 
			ScriptMessage(PlayerID, 0 , 0 , Str, "0xff00ff00") 

			ScriptMessage(PlayerID, 0 , 2 , "[SC_PETSYS_32]" , "0xff00ff00") 	--趕緊設置[103565]吧！
			ScriptMessage(PlayerID, 0 , 0 , "[SC_PETSYS_32]", "0xff00ff00") 

			local OwnerX = ReadRoleValue( O_ID , EM_RoleValue_X ) 
			local OwnerY = ReadRoleValue( O_ID , EM_RoleValue_Y ) 
			local OwnerZ = ReadRoleValue( O_ID , EM_RoleValue_Z ) 
			local OwnerDIR = ReadRoleValue( O_ID , EM_RoleValue_Dir ) 

			local StageNpc = CreateObj( Mouse , OwnerX , OwnerY , OwnerZ , OwnerDIR , 1) --帕奇鼠
			AddToPartition( StageNpc , RoomID )  

			AddBuff( StageNpc ,503589 ,1 ,-1 )--亮晶晶
			AddBuff( StageNpc ,502363 ,1 ,-1 )--亮晶晶


			SetModeEx( StageNpc , EM_SetModeType_Fight , false )--可砍殺攻擊
			SetModeEx( StageNpc , EM_SetModeType_Strikback, false )--反擊
			SetModeEx( StageNpc , EM_SetModeType_Searchenemy, false )--索敵
			SetModeEx( StageNpc , EM_SetModeType_NotShowHPMP, true )--不顯示血條
			Beginplot( StageNpc ,"event_module_NPC_dead_00", 0 )

		end
	end
end
function event_module_NPC_dead_00()	--5分鐘後，帕奇鼠消失
	sleep(3000)
	ScriptMessage(OwnerID(), 0 , 2 , "[SC_PETSYS_67]", 0) 	--離開宿主過久，[103566]虛弱的隱匿起來了。
	ScriptMessage(OwnerID(), 0 , 0 , "[SC_PETSYS_67]", 0) 
	sleep(10)
	Delobj(OwnerID())
end
-------- 德國 ENEU --------
function Germany_1year_FrogPet_give(PlayerLV, Type, Race)
	local Language = GetServerDataLanguage() 		           --抓取目前server的語系
	local month = GetSystime(3)+1
	local day = GetSystime(4)
	local hour = GetSystime(1)
	local min = GetSystime(2)
	local Owner = OwnerID()
	local Target = TargetID()
	local bag = 205036
	local Items = { }
	local DateM = 3   --<< UPDATE改這個 月份
	local DateD = 19  --<<UPDATE改這個 首日日期
	local Gift = {	
		{ DateD , bag , 1 , 549365, DateM } ,     --日期/物品編號/數量/重要物品/月份 ，不動
		{ DateD+1 , bag , 1 , 549366, DateM } ,
		{ DateD+2 , bag , 1 , 549367, DateM } ,
		{ DateD+3 , bag , 1 , 549368, DateM } ,
		{ DateD+4 , bag , 1 , 549369, DateM } ,
		{ DateD+5 , bag , 1 , 549370, DateM } ,
		{ DateD+6 , bag , 1 , 549371, DateM }   }--<<如果跨月分，最後一天用下一行，若為區間再同月份，可使用此行。 (奈奈)
	--	{ 1 , bag , 1 , 549105, 4 } 	}  -- 跨月分專用

	local SpecialDayKey = 549364 --指定日期額外贈品用KEYITEM

	if type == EM_Event_Module_Type_Login then
--		if Language == "ru" or Language == "rw" then  -- 測試用
		Items = { { 19 , 242187 , 1, 3 } }  -- << UPDATE改這個 2015/3/19當日登入可額外獲得 ( 日期/物品編號/數量/重要物品/月份 )
		DebugMsg(Owner , Owner , month.."/"..day.." "..hour..":"..min)
	--	活動二　登入送蛙蛋
		for i = 1,table.getn(Items) do
			if Items[i][4] == month then  -- (RU版)月份
				if Items[i][1] == day then
					if ( hour >=00 and min >=0 ) then
						if CheckFlag( Owner , SpecialDayKey ) ~= true then	-- 2015.03.19 當天登入後領取物品							
							Givebodyitem( Owner , Items[i][2] , Items[i][3] )	-- 跳跳花寶寶寵物禮盒
							SetFlag( Owner , SpecialDayKey , 1 )			-- 2015領取物品的旗標								
						end
					end
				end
			end
		end
--	end --變更語系測試用的end
	--	活動三	登入送3週年慶的賀禮轉蛋
--		if Language == "ru" or Language == "rw" then  -- 測試用
	 	for i = 1, #Gift do
			if Gift[i][5] == month then  -- 月份
	 			if Gift[i][1] == day then  -- 日期
	 				if PlayerLV >= 20 then
						if Gift[i][1] == day and hour == 0 and min == 0 then	-- 00:00時還不會給，要等到01分
							return false
						else
							BeginPlot( Owner , "Lua_Hao_eneu_2year_login" , 0 )		-- 德國 登入事件1
							if CheckFlag( Owner , Gift[i][4] ) ~= true then
								Givebodyitem( Owner , Gift[i][2] , Gift[i][3] )
								SetFlag( Owner , Gift[i][4] , 1 )
							end
						end
	 				end
	 			end
	 		end
	 	end
--	end --變更語系測試用的end
	elseif type == 0 then				--升級時判斷，當玩家升到LV20時，便可獲得禮包
		local TargetLV = 20						--指定哪一個等級升級後，會執行什麼樣的劇情
		local CurrentLV =PlayerLV
--		DebugMsg(OwnerID(),OwnerID(),month.."/"..day )
--		Say( OwnerID() , CurrentLV )
--		if Language == "ru" or Language == "rw" then  -- 測試用
		for i = 1, #Gift do
			if Gift[i][5] == month then
				if Gift[i][1] == day then
					if CheckFlag( Owner , Gift[i][4] ) == true then
						break
					else
						if Type == EM_Event_Module_Type_LevelUp and  PlayerLV >= TargetLV then --升級後，如玩家符合指定等級則執行下列劇情
							ScriptMessage( Target , Owner, 1 , "[EVENT_MODULE_0][$SETVAR1="..CurrentLV.."][$SETVAR2=".."["..bag.."]".."]", "0xFFFFF266" )
							ScriptMessage( Target , Owner, 0 , "[EVENT_MODULE_0][$SETVAR1="..CurrentLV.."][$SETVAR2=".."["..bag.."]".."]", "0xFFFFF266" )
							GiveBodyItem( Owner, bag , 1 )	
							setflag( Owner , Gift[i][4] , 1 )
						end
					end
				end
			end
		end
--	end --變更語系測試用的end
	end
end
-------- 韓國 KR -------- 
function  Levelup_event(PlayerLV, Type, Race) --For Korea OB

--	if type == EM_Event_Module_Type_Login then
--		local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
--		local Race = ReadRoleValue(OwnerID(),EM_RoleValue_RACE)
--		DebugMsg( 0, RoomID ,"Race = "..Race)
--		if Race == 1 then
--			local TargetLV = {1} 				           --指定哪一個等級升級後，會執行什麼樣的劇情
--			local CurrentLV = PlayerLV
--
--			local Bag = {	206630	} 
--
--			local Flag = {	543600	}
--			for i = 1 , table.getn(TargetLV) do
--				if  CheckFlag( OwnerID(), Flag[i]) == true or  PlayerLV ~= TargetLV[i] then
--					break
--				elseif Type == EM_Event_Module_Type_Login and  PlayerLV == TargetLV[i] then --登入後，如玩家符合條件則執行下列劇情
--					ScriptMessage( TargetID(), OwnerID(), 1 , "[EVENT_MODULE_KR_0][$SETVAR1=".."["..Bag[i].."]".."]", "0xFFFFF266" )
--					ScriptMessage( TargetID(), OwnerID(), 0 , "[EVENT_MODULE_KR_0][$SETVAR1=".."["..Bag[i].."]".."]", "0xFFFFF266" )
--					GiveBodyItem( OwnerID() , Bag[i] , 1)	
--					SetFlag(OwnerID(), Flag[i], 1)
--				end
--			end
--		end
--	end

--	if type == EM_Event_Module_Type_Login then
--		local Buffs = {	{ 10 , 505885 } ,
--				{ 11 , 505885 } ,
--				{ 12 , 505885 } ,
--				{ 17 , 505885 } ,
--				{ 18 , 505885 } ,
--				{ 19 , 505885 }	}
--		
--		local month = GetSystime(3)+1
--		local day = GetSystime(4)
--		local hour = GetSystime(1)
--		local min = GetSystime(2)
		
--		DebugMsg(OwnerID(),OwnerID(),month.."/"..day.." "..hour..":"..min)
		
--		if month == 3 then
--			for i = 1,table.getn(Buffs) do
--				if Buffs[i][1] == day then
--					if ( hour >=23 and hour <24 and min >=0 ) then
--							AddBuff( OwnerID() , Buffs[i][2] , 0 , -1 )
--					end
--				end
--			end
--		end
--	end

--	if type == 3 then -- 韓國 token Bonus 2010 / 05 / 03
--
--		AddBuff( OwnerID() , 506604 , 0 , 3600 )
--
--	end

	if type == 0 then	--韓國常駐劇情............勿刪
		local TargetLV = {10, 15, 20, 25, 40} 				           --指定哪一個等級升級後，會執行什麼樣的劇情
		local CurrentLV =PlayerLV

		local Bag = {	206226, --Lv10
			      	206231,  --Lv 15
			           	206244, --Lv20
			           	206245, --Lv25
				208933	--Lv40
				}

		local Flag = {	543458,
				543459,
				543460,
				543461,
				544713}

		for i = 1 , 5 , 1 do

			--local PFlag = CheckFlag(OwnerID()  , Flag[i]) 
			if  CheckFlag( OwnerID(), Flag[i]) == true and  PlayerLV == TargetLV[i] then
				break
			else
				if Type == EM_Event_Module_Type_LevelUp and  PlayerLV == TargetLV[i] then --升級後，如玩家符合指定等級則執行下列劇情
					ScriptMessage( TargetID(), OwnerID(), 1 , "[EVENT_MODULE_0][$SETVAR1="..CurrentLV.."][$SETVAR2=".."["..Bag[i].."]".."]", "0xFFFFF266" ) --
					ScriptMessage( TargetID(), OwnerID(), 0 , "[EVENT_MODULE_0][$SETVAR1="..CurrentLV.."][$SETVAR2=".."["..Bag[i].."]".."]", "0xFFFFF266" ) --
					GiveBodyItem( OwnerID() , Bag[i] , 1)	
					setflag(OwnerID(), Flag[i], 1)
				end
			end
		end
	end
end

function Lua_KR_HelpNewbie_lv30(PlayerLV, Type)
	if Type == EM_Event_Module_Type_LevelUp and  PlayerLV == 30 then
		GiveBodyItem(OwnerID(),207754,1)
	end
end

--------  台灣 TW -------- 
--橘子升級禮包活動 2010.4
function Lua_TW_2010lvup_package(PlayerLV, Type) 
	local TargetLV = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 20, 25, 30, 35, 40, 45, 50 } 				           --指定哪一個等級升級後，會執行什麼樣的劇情
	local CurrentLV =PlayerLV
	--local Player_Race = Race
	local Bag = {       207231, --lv1
			207232, --lv2
			207233, --lv3
			207234, --lv4
			207235, --lv5 
			207236, --lv6
			207237, --lv7
			207238, --lv8
			207239, --lv9
			207240, --lv10
			207241, --lv11
			207242, --lv12
			207243, --lv13
			207244, --lv14
			207245,  --lv15
			207246, --lv20
			207247, --lv25
			207248, --lv30 
			207249, --lv35
			207250, --lv40
			207251, --lv45
			207252 }  --lv50

	local Flag = {     543811,  --lv1
			543812, --lv2
			543813, --lv3
			543814, --lv4
			543815, --lv5
			543816, --lv6
			543817, --lv7
			543818, --lv8
			543819, --lv9
			543820, --lv10
			543821, --lv11
			543822, --lv12
			543823, --lv13
			543824, --lv14
			543825, --lv15
			543826, --lv20
			543827, --lv25
			543828, --lv30
			543829, --lv35
			543830, --lv40
			543831, --lv45
			543832 } --lv50

	local Number = { 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 }

	--if Player_Race == 1 then			
		for i = 1 , 22 , 1 do -- 22次
			--local PFlag = CheckFlag(OwnerID()  , Flag[i]) 
			if  CheckFlag( OwnerID(), Flag[i]) == true and  PlayerLV == TargetLV[i] then
				break
			else
				if ( Type == EM_Event_Module_Type_LevelUp or Type == EM_Event_Module_Type_Login) and  PlayerLV == TargetLV[i] then --升級後，如玩家符合指定等級則執行下列劇情
					ScriptMessage( TargetID(), OwnerID(), 1 , "[EVENT_MODULE_0][$SETVAR1="..CurrentLV.."][$SETVAR2=".."["..Bag[i].."]".."]", "0xFFFFF266" ) --
					ScriptMessage( TargetID(), OwnerID(), 0 , "[EVENT_MODULE_0][$SETVAR1="..CurrentLV.."][$SETVAR2=".."["..Bag[i].."]".."]", "0xFFFFF266" ) --
					GiveBodyItem( OwnerID() , Bag[i] , Number[i])	
					setflag(OwnerID(), Flag[i], 1)
				
				end
			end
		end
	--end
end

function Lua_Dan_TW_ElfRace_packages(PlayerLV, Type) --For 橘子 精靈新手包

	local TargetLV = {1, 3, 5, 10, 15} 				           --指定哪一個等級升級後，會執行什麼樣的劇情
	local CurrentLV =PlayerLV
	--local Player_Race = Race
	local Bag = {	201139, --Lv10
		           	201134,  --Lv 15
		           	201610, --Lv20
		           	203324,
		           	203040	} --Lv25

	local Flag = {       543407,
			543408,
			543409,
			543410,
			543562	}

	local Number = {1,3,3,1,5}

	--if Player_Race == 1 then			

		for i = 1 , 5 , 1 do

			--local PFlag = CheckFlag(OwnerID()  , Flag[i]) 

			if  CheckFlag( OwnerID(), Flag[i]) == true and  PlayerLV == TargetLV[i] then
				break
			else
				if ( Type == EM_Event_Module_Type_LevelUp or Type == EM_Event_Module_Type_Login) and  PlayerLV == TargetLV[i] then --升級後，如玩家符合指定等級則執行下列劇情
					ScriptMessage( TargetID(), OwnerID(), 1 , "[EVENT_MODULE_0][$SETVAR1="..CurrentLV.."][$SETVAR2=".."["..Bag[i].."]".."]", "0xFFFFF266" ) --
					ScriptMessage( TargetID(), OwnerID(), 0 , "[EVENT_MODULE_0][$SETVAR1="..CurrentLV.."][$SETVAR2=".."["..Bag[i].."]".."]", "0xFFFFF266" ) --
					GiveBodyItem( OwnerID() , Bag[i] , Number[i])	
					setflag(OwnerID(), Flag[i], 1)
				end
			end
		end
	--end
end
-- 2010 迎新春
function Lua_TW_newyear_package(PlayerLV, Type) 

	local TargetLV = {1, 3, 5, 7, 9, 10, 12, 14, 15} 				           --指定哪一個等級升級後，會執行什麼樣的劇情
	local CurrentLV =PlayerLV
	--local Player_Race = Race
	local Bag = {   202458, --Lv1
		          201139, --Lv3
		          202903, --Lv5
		          201609, --Lv7
		          201617, --Lv9
	        	          202322, --Lv10
		          206741, --Lv12  --
		          201097, --Lv14
		          201095 } --Lv15

	local Flag = {       543624,
                                           543625,
                                           543626,
                                           543627,
                                           543628,
                                           543629,
                                           543630,
                                           543631,
			 543632 }

	local Number = {1, 2, 30, 2, 2, 2, 1, 20 ,10}

	--if Player_Race == 1 then			

		for i = 1 , 9 , 1 do -- 9次

			--local PFlag = CheckFlag(OwnerID()  , Flag[i]) 

			if  CheckFlag( OwnerID(), Flag[i]) == true and  PlayerLV == TargetLV[i] then

				break

			else
				if ( Type == EM_Event_Module_Type_LevelUp or Type == EM_Event_Module_Type_Login) and  PlayerLV == TargetLV[i] then --升級後，如玩家符合指定等級則執行下列劇情

					ScriptMessage( TargetID(), OwnerID(), 1 , "[EVENT_MODULE_0][$SETVAR1="..CurrentLV.."][$SETVAR2=".."["..Bag[i].."]".."]", "0xFFFFF266" ) --
					ScriptMessage( TargetID(), OwnerID(), 0 , "[EVENT_MODULE_0][$SETVAR1="..CurrentLV.."][$SETVAR2=".."["..Bag[i].."]".."]", "0xFFFFF266" ) --
					GiveBodyItem( OwnerID() , Bag[i] , Number[i])	
					setflag(OwnerID(), Flag[i], 1)
				
				end
			end
		end
	--end
end
-------- 土耳其 TR -------- 
function Lua_turkeyLvup_event(PlayerLV, Type) --For 土耳其、泰國

	local TargetLV = {1, 3, 5, 10, 15, 18 ,20} 				           --指定哪一個等級升級後，會執行什麼樣的劇情
	local CurrentLV = PlayerLV
	--local Player_Race = Race
	local Bag = {   201139,
		           201134,
		           201610,
		           202450,
		           203040,
		           201095,
		           201097} 

	local Flag = {       543590,
   			543591,
   			543592,
   			543593,
   			543594,
   			543595,
   			543596 }

	local Number = {1, 3, 3, 1, 5, 5, 5}

	--if Player_Race == 1 then			

		for i = 1 , 7 , 1 do

			--local PFlag = CheckFlag(OwnerID()  , Flag[i]) 

			if  CheckFlag( OwnerID(), Flag[i]) == true and  PlayerLV == TargetLV[i] then

				break

			else
				if ( Type == EM_Event_Module_Type_LevelUp or Type == EM_Event_Module_Type_Login) and  PlayerLV == TargetLV[i] then --升級後，如玩家符合指定等級則執行下列劇情
					ScriptMessage( TargetID(), OwnerID(), 1 , "[EVENT_MODULE_0][$SETVAR1="..CurrentLV.."][$SETVAR2=".."["..Bag[i].."]".."]", "0xFFFFF266" ) --
					ScriptMessage( TargetID(), OwnerID(), 0 , "[EVENT_MODULE_0][$SETVAR1="..CurrentLV.."][$SETVAR2=".."["..Bag[i].."]".."]", "0xFFFFF266" ) --
					GiveBodyItem( OwnerID() , Bag[i] , Number[i])	
					setflag(OwnerID(), Flag[i], 1)
				
				end
			end
		end
	--end

-------- 2010.08.19 --------- 新增泰國新手獎勵
	if CheckFlag( OwnerID() , 544408 ) == false and PlayerLV == 1 then
		BeginPlot( OwnerID() , "Lua_Hao_TH_Newevent" , 0 )
	end
end

function Lua_Hao_TH_Newevent()

	local Language = GetServerDataLanguage()				--抓取目前server的語系
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) 
	local Bag2 = 208183
	local Keyitem = CheckFlag( OwnerID() , 544408 )
	local Step = 0

	local Job = { }
		Job[1] = ReadRoleValue( OwnerID() , EM_RoleValue_VOCLV_Warrior )
		Job[2] = ReadRoleValue( OwnerID() , EM_RoleValue_VOCLV_Ranger )	
		Job[3] = ReadRoleValue( OwnerID() , EM_RoleValue_VOCLV_Rogue )
		Job[4] = ReadRoleValue( OwnerID() , EM_RoleValue_VOCLV_Wizard )
		Job[5] = ReadRoleValue( OwnerID() , EM_RoleValue_VOCLV_Priest )
		Job[6] = ReadRoleValue( OwnerID() , EM_RoleValue_VOCLV_Knight )
		Job[7] = ReadRoleValue( OwnerID() , EM_RoleValue_VOCLV_RuneDancer )
		Job[8] = ReadRoleValue( OwnerID() , EM_RoleValue_VOCLV_Druid )

--	Debuglog( 2 , "TH_Event RoomID = "..RoomID )
--	Debuglog( 2 , "TH_Event Language = "..Language )

	if Language == "th" or Language == "rw" then
		for i = 1 , table.getn( Job ) , 1 do
			DebugMsg( 0 , RoomID ,"JobLV ="..Job[i] )
			if Job[i] > 1 then
				Step = 1
			end
		end
		if Step == 0 then
			GiveBodyItem( OwnerID() , Bag2 , 1 )
			SetFlag( OwnerID() , 544408 , 1 )
		elseif Step == 1 then
			DebugMsg( 0 , RoomID , "Player level too high " )
		end
	end
end
--------------------------
-------- 泰國 TH  -------- 
function  TH_cbevent(PlayerLV, Type) --For TH (泰國)

	local TargetLV = {1} 				           --指定哪一個等級升級後，會執行什麼樣的劇情
	local CurrentLV = PlayerLV

	local Bag = {	206740	} 

	local Flag = {	543601	}
	for i = 1 , table.getn(TargetLV) do

		if  CheckFlag( OwnerID(), Flag[i]) == true or  PlayerLV ~= TargetLV[i] then
			break
		elseif Type == EM_Event_Module_Type_Login and  PlayerLV == TargetLV[i] then --登入後，如玩家符合條件則執行下列劇情
			ScriptMessage( TargetID(), OwnerID(), 1 , "[EVENT_MODULE_KR_0][$SETVAR1=".."["..Bag[i].."]".."]", "0xFFFFF266" )
			ScriptMessage( TargetID(), OwnerID(), 0 , "[EVENT_MODULE_KR_0][$SETVAR1=".."["..Bag[i].."]".."]", "0xFFFFF266" )
			GiveBodyItem( OwnerID() , Bag[i] , 1)	
			setflag(OwnerID(), Flag[i], 1)
		end
	end
	
end
--------日本 JP --------
function Lua_JP_1year_anniversary(PlayerLV, Type, Race)

	local month = GetSystime(3)+1
	local day = GetSystime(4)
	local hour = GetSystime(1)
	local min = GetSystime(2)
	local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )			--取得玩家等級

	if Type == 3 then	-- 登入時判斷
		local Items = {	{ 19 , 207010 , 1 }	}	-- 活動二　神秘幸運蛙蛋

		local Gift = {	{ 16 , 206997 , 1 , 543643 } ,		-- 活動三　1周年慶的賀禮
				{ 17 , 206997 , 1 , 543792 } ,
				{ 18 , 206997 , 1 , 543793 } ,
				{ 19 , 206997 , 1 , 543794 } ,
				{ 20 , 206997 , 1 , 543795 }	}

--		DebugMsg(OwnerID(),OwnerID(),month.."/"..day.." "..hour..":"..min)
		
		if month == 9 then	-- 活動二
			for i = 1,table.getn(Items) do
				if Items[i][1] == day then
					if ( hour >=00 and min >=0 ) then
						if CheckFlag( OwnerID()  , 543642 ) ~= true then
							givebodyitem( OwnerID() , Items[i][2] , Items[i][3] )
							givebodyitem( OwnerID() ,203294,10)
							SetFlag( OwnerID() , 543642 , 1 )
						end
					end
				end
			end
		end

		if month == 9 then	-- 活動三
			for i = 1,table.getn(Gift) do
				if Gift[i][1] == day then
					if PlayerLV >= 20 then
						if ( hour >=00 and min >=0 ) then
							if CheckFlag( OwnerID()  , Gift[i][4] ) ~= true then
								givebodyitem( OwnerID() , Gift[i][2] , Gift[i][3] )
								SetFlag( OwnerID() , Gift[i][4] , 1 )
							end
						end
					end
				end
			end
		end			
	end

	if Type == 0 then	--升級時判斷

		local days = {	{ 16 , 543643 } ,		--活動三
				{ 17 , 543792 } ,
				{ 18 , 543793 } ,
				{ 19 , 543794 } ,
				{ 20 , 543795 }		}
		local TargetLV = 20						--指定哪一個等級升級後，會執行什麼樣的劇情
		local CurrentLV =PlayerLV
		local Bag = 206997						--一週年慶的賀禮

--		DebugMsg(OwnerID(),OwnerID(),month.."/"..day )
--		Say( OwnerID() , CurrentLV )

		if month == 9 then
			for i = 1,table.getn(days) do
				if days[i][1] == day then
					if CheckFlag( OwnerID() , days[i][2] ) == true then
						break
					else
						if PlayerLV >= TargetLV then --升級後，如玩家符合指定等級則執行下列劇情
							ScriptMessage( TargetID(), OwnerID(), 1 , "[EVENT_MODULE_0][$SETVAR1="..CurrentLV.."][$SETVAR2=".."["..Bag.."]".."]", "0xFFFFF266" )
							ScriptMessage( TargetID(), OwnerID(), 0 , "[EVENT_MODULE_0][$SETVAR1="..CurrentLV.."][$SETVAR2=".."["..Bag.."]".."]", "0xFFFFF266" )
							-- 尊敬的冒險者！恭喜你成功到達[$VAR1]級[EVENT_MODULE_1][$VAR2]。 
							GiveBodyItem( OwnerID() , Bag , 1 )	
							setflag(OwnerID() , days[i][2] , 1 )
						end
					end
				end
			end
		end
	end
end

--------菲律賓 PH --------
function Lua_PH_NewBie_event( PlayerLV , Type )

	local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )

	if Type == 3 then
		if CheckFlag( OwnerID() , 542194 ) == false and PlayerLV == 1 then
			BeginPlot( OwnerID() , "Lua_Hao_PH_NewBie_event" , 0 )
		end
	end
end

function Lua_Hao_PH_NewBie_event()

	local Language = GetServerDataLanguage()				--抓取目前server的語系
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) 
	local Bag = 208316
	local Keyitem = 542194
	local Step = 0

	local Job = { }
		Job[1] = ReadRoleValue( OwnerID() , EM_RoleValue_VOCLV_Warrior )
		Job[2] = ReadRoleValue( OwnerID() , EM_RoleValue_VOCLV_Ranger )	
		Job[3] = ReadRoleValue( OwnerID() , EM_RoleValue_VOCLV_Rogue )
		Job[4] = ReadRoleValue( OwnerID() , EM_RoleValue_VOCLV_Wizard )
		Job[5] = ReadRoleValue( OwnerID() , EM_RoleValue_VOCLV_Priest )
		Job[6] = ReadRoleValue( OwnerID() , EM_RoleValue_VOCLV_Knight )
		Job[7] = ReadRoleValue( OwnerID() , EM_RoleValue_VOCLV_RuneDancer )
		Job[8] = ReadRoleValue( OwnerID() , EM_RoleValue_VOCLV_Druid )

--	Debuglog( 2 , "TH_Event RoomID = "..RoomID )
--	Debuglog( 2 , "TH_Event Language = "..Language )

	if Language == "ph" or Language == "rw" then
		for i = 1 , table.getn( Job ) , 1 do
			DebugMsg( 0 , RoomID ,"JobLV ="..Job[i] )
			if Job[i] > 1 then
				Step = 1
			end
		end
		if Step == 0 then
			GiveBodyItem( OwnerID() , Bag , 1 )
			SetFlag( OwnerID() , Keyitem , 1 )
		elseif Step == 1 then
			DebugMsg( 0 , RoomID , "Player level too high " )
		end
	end
end