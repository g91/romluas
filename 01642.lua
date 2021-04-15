--====================================================================================================================

function Yuyu_GW_Siege_eq_1_00(Option,ObjID,ItemID) --【插杖法術】攻城器具

	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )
	local VOC = ReadRoleValue( OwnerID() , EM_RoleValue_VOC )--職業
	local PassCard =  CountBodyItem( OwnerID() , 206769 ) --是否具有通行證 = GM測試
	local PlayerGuildID = GetRoleCampID( OwnerID() )
	local BuildingGuildID = GetRoleCampID( TargetID() )
	local PlayerIsSit =  CheckFlag( OwnerID()  , 543769 )--玩家是否在載具上
--	Say(OwnerID(),"PlayerGuildID="..PlayerGuildID)


	local Arsenal = {112934,112935,112936,112937,112938,112939,112940,112941,112942,112943} --【兵工廠】10階級之OrgID

	local Control = 0

	for i=1 , table.getn(Arsenal) do	
		local Arsenal_X = LuaFunc_SearchNPCbyOrgID( OwnerID() , Arsenal[i], 150 , 1)

		if CheckID(Arsenal_X[0]) == true then

			BuildingGuildID = GetRoleCampID( Arsenal_X[0] )


--	Say(OwnerID(),"BuildingGuildID="..BuildingGuildID)

			if PlayerGuildID == BuildingGuildID then
				Control = 1
			end
		end
	end	

	if Control == 1 then
		if ( Option == "CHECK" ) then
			if (ZoneID == 402) or (ZoneID == 31) or (PassCard > 0) then
				if (PlayerIsSit == true) then --玩家在載具上
					ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_YU_GUILDWAR_BUILD_86]", 0 ) -- 載具上無法使用
					ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_YU_GUILDWAR_BUILD_86]", 0 ) 
					return false
				else
					return true
				end
			else
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_DAN_111700_37]", C_SYSTEM ) --你無法在此區域使用該物品！
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_DAN_111700_37]", C_SYSTEM ) 
					return false
			end

		elseif ( Option == "USE" ) then
			BeginPlot( OwnerID()  , "Yuyu_GW_Siege_eq_1_01" , 0 )  
			WriteRoleValue( OwnerID()  , EM_RoleValue_Register+6 ,  ObjID  ) --記錄要生產的項目
			WriteRoleValue( OwnerID()  , EM_RoleValue_Register+7 ,  ItemID  ) --記錄要生產的物品包ID
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_YU_GUILDWAR_BUILD_34]", 0 ) --需在兵工廠附近才能使用
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_YU_GUILDWAR_BUILD_34]", 0 ) 
		return false

	end

end

function Yuyu_GW_Siege_eq_1_01() --【插杖法術】攻城器具製造

	local Kind = ReadRoleValue( OwnerID() , EM_RoleValue_Register+6 ) 
	local Item = ReadRoleValue( OwnerID() , EM_RoleValue_Register+7 ) 

--	if ReadRoleValue( OwnerID() , EM_RoleValue_Register+7) == 1 then
--		ScriptMessage( TargetID(),TargetID(),1,"[SYS_AUCTION_WAIT_NEXT]",0)	--忙碌中，請稍候再試。
--		return
--	end
--	WriteRoleValue( OwnerID() , EM_RoleValue_Register+7, 1 ) --研發鎖定中

		if BeginCastBar( OwnerID(),"["..Kind.."]", 150 , ruFUSION_ACTORSTATE_CRAFTING_LOOP , ruFUSION_ACTORSTATE_CRAFTING_END , 0 ) == 1 then
		sleep( 4 ) 
			while true do
			sleep( 1 )
				local CastBarStatus = CheckCastBar( OwnerID() )
				if ( CastBarStatus ~= 0 ) then 
					if ( CastBarStatus > 0) then -- 成功
						result = "OKOK"
						EndCastBar( OwnerID() , CastBarStatus )
						break;
					elseif ( CastBarStatus < 0 ) then -- 失敗
						result = "DAME"
						EndCastBar( OwnerID() , CastBarStatus )
						break;
					end
				end
			end

			if ( result == "OKOK" ) then
				
				WriteRoleValue( OwnerID()  , EM_RoleValue_Register+6 ,  0  ) --清空要生產的項目
--				WriteRoleValue( OwnerID() , EM_RoleValue_Register+7, 0 )--記錄要生產的物品包ID
--				WriteRoleValue( OwnerID() , EM_RoleValue_Register+7, 0 ) --解除鎖定可再次研發

				local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 

				local OwnerX = ReadRoleValue( OwnerID() , EM_RoleValue_X ) 
				local OwnerY = ReadRoleValue( OwnerID() , EM_RoleValue_Y ) 
				local OwnerZ = ReadRoleValue( OwnerID() , EM_RoleValue_Z ) 
				local OwnerDIR = ReadRoleValue( OwnerID() , EM_RoleValue_Dir ) 
				local PlayerGuildID = GetRoleCampID( OwnerID() )--玩家的陣營

				local StageNpc = CreateObj( Kind , OwnerX , OwnerY , OwnerZ , OwnerDIR , 1)
				
				-- 2013.06.14 載具等級會隨玩家角色等級開放的上限而成長
				local ServerMaxLv = ReadRoleValue( OwnerID() , EM_RoleValue_MaxLv )	-- 讀取伺服器設定的玩家等級上限
				WriteRoleValue( StageNpc , EM_RoleValue_LV , ServerMaxLv )

				AddBuff( StageNpc ,505013 ,1 ,1 ); --縮小 
				SetModeEx( StageNpc, EM_SetModeType_Show, false )--顯示
				AddToPartition( StageNpc , RoomID )  
				SetModeEx( StageNpc , EM_SetModeType_Strikback, false )--反擊
				SetModeEx( StageNpc , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
				SetModeEx( StageNpc , EM_SetModeType_Searchenemy, false )--索敵
				AddBuff( StageNpc ,502707 ,1 ,-1 ); --非戰鬥中不回血的buff (ownerID,buff,LV,Time)
				SetRoleCampID( StageNpc, PlayerGuildID )--寫入陣營


			---*---以下判斷玩家是否有學習裝甲技術、輪軸技術之科技
				local SetA = -1
				local SetB = -1		
				local Count = BuffCount ( OwnerID())
				for i = 0 , Count do
					local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID ) -- 基本法術ID
					if BuffID == 505316 then--裝甲技術
						local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )--該建築第 j 個BUFF的等級
						SetA = BuffLv
					elseif BuffID == 505315 then--輪軸技術
						local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )--該建築第 j 個BUFF的等級
						SetB = BuffLv
					end
				end

				if SetA>-1 then
					AddBuff( StageNpc , 505935 , SetA , -1 )--裝甲技術
				end

				if SetB>-1 then
					SetB=SetB+1
					AddBuff( StageNpc , 506149 , SetB , -1 )--輪軸技術
				end

				BeginPlot( OwnerID() , "Yuyu_GW_Siege_eq_1_02" , 0 )  --刪除物品
				sleep(8)
				SetModeEx( StageNpc, EM_SetModeType_Show, true )--顯示

			elseif ( result == "DAME" ) then	

				WriteRoleValue( OwnerID()  , EM_RoleValue_Register+6 ,  0  ) --清空要生產的項目
				WriteRoleValue( OwnerID() , EM_RoleValue_Register+7, 0 )--記錄要生產的物品包ID
--				WriteRoleValue( OwnerID() , EM_RoleValue_Register+7, 0 ) --解除鎖定可再次研發
			end
		end
end

function Yuyu_GW_Siege_eq_1_02() --【插杖法術】刪除物品

	local Item = ReadRoleValue( OwnerID() , EM_RoleValue_Register+7 ) --記錄要生產的物品包ID

	DelBodyItem(OwnerID() ,Item,1)

	WriteRoleValue( OwnerID() , EM_RoleValue_Register+7, 0 )--記錄要生產的物品包ID
end

--====================================================================================================================

function Yuyu_GW_Siege_eq_2_note( Option ) --【攻城器具】-- 投石台、弩砲台的製作 胡亂直接使用時

	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )
	local VOC = ReadRoleValue( OwnerID() , EM_RoleValue_VOC )--職業
	local PassCard =  CountBodyItem( OwnerID() , 206769 ) --是否具有通行證 = GM測試

	if ( Option == "CHECK" ) then
		if (ZoneID == 402) or (ZoneID == 31) or (PassCard > 0) then

				return true
		else
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_DAN_111700_37]", C_SYSTEM ) --你無法在此區域使用該物品！
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_DAN_111700_37]", C_SYSTEM ) 
				return false
		end

	elseif ( Option == "USE" ) then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_YU_GUILDWAR_BUILD_59]", C_SYSTEM ) --不能直接組合
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_YU_GUILDWAR_BUILD_59]", C_SYSTEM ) 
	end

end



function Yuyu_GW_Siege_eq_2_00() --【攻城器具】-- 投石台、弩砲台的製作

	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )

	if (ZoneID == 402) or (ZoneID == 951 )  then
		SetModeEx( OwnerID()   , EM_SetModeType_Mark, true )--標記
		SetModeEx( OwnerID()  , EM_SetModeType_HideName, false )--名稱
		SetModeEx( OwnerID() , EM_SetModeType_ShowRoleHead, true )--頭像框
		SetModeEx( OwnerID() , EM_SetModeType_Fight , false )--可砍殺攻擊
		SetModeEx( OwnerID()  , EM_SetModeType_Move, false )--移動
		SetModeEx( OwnerID() , EM_SetModeType_Obstruct, false )--阻擋
		SetModeEx( OwnerID(), EM_SetModeType_Show, true )--顯示
		SetModeEx( OwnerID() , EM_SetModeType_NotShowHPMP, true )--不顯示血條

		SetCursorType( OwnerID() , eCursor_Interact ); --游標變成 齒輪
		SetPlot( OwnerID() , "touch" , "Yuyu_GW_Siege_eq_2_01" , 60 )	--公會城戰時
		-- 2013.06.28 阿浩：追加死亡劇情，查詢誰殺死發石台建築點(113695)，追蹤發石台建築點無故死亡的問題，並將死亡劇情 return false
		SetPlot( OwnerID() , "dead" , "Hao_GuildWar_CatapultPoint_Dead" , 0 )	--死亡劇情
		--		
	end
end
-- 2013.06.28 阿浩：追加死亡劇情
function Hao_GuildWar_CatapultPoint_Dead()	-- 發石台建築點死亡劇情

	local CatapultPoint = OwnerID()
	local Count = HateListCount(CatapultPoint)	-- 讀取仇恨列表

	for i = 1 , Count , 1 do	-- 逐一拆解仇恨列表名單
			local Killer = HateListInfo( CatapultPoint , i-1 , EM_HateListInfoType_GItemID )
			local OrgID = ReadRoleValue( Killer , EM_RoleValue_OrgID )
			DesignLog( Killer , 113695 , "Killer = "..OrgID )	-- 讓兇手回傳自己的OrgID到Designlog中
	end
	local MaxHP = ReadRoleValue( CatapultPoint , EM_RoleValue_MaxHP )	-- 將城門建築點血量補滿
	WriteRoleValue( CatapultPoint , EM_RoleValue_HP , MaxHP )
	return false
end

function Yuyu_GW_Siege_eq_2_01() --【攻城器具】-- 投石台、弩砲台的製作

	local PlayerID = OwnerID()
	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )
	local PassCard =  CountBodyItem( OwnerID() , 206769 ) --是否具有通行證 = GM測試

	local RoomID = ReadRoleValue( TargetID(), EM_RoleValue_RoomID )
	local PlayerGuildID = GetRoleCampID( OwnerID() )
	local BuildingGuildID = GetRoleCampID( TargetID() )

	local TargetOrgID = ReadRoleValue( TargetID() ,EM_RoleValue_OrgID ) --目前建築物之OrgID

	local Record = 0 --生產所需戰績
	local Energy = 0 --生產所需能量

	local PackBag =  0

	if ReadRoleValue( TargetID() , EM_RoleValue_Register) == 1 then
		ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_AUCTION_WAIT_NEXT]",0)	--忙碌中，請稍候再試。
		return
	end

	local judge = 0 --判斷是否是GM 或 同公會 ...等

	if (PassCard > 0) then
		judge = 1
	elseif PlayerGuildID ~= BuildingGuildID then
		ScriptMessage( TargetID() , OwnerID() , 1 , "[GUILD_REMINDER]", C_SYSTEM ) --你不是此公會的成員
		ScriptMessage( TargetID() , OwnerID() , 0 , "[GUILD_REMINDER]", C_SYSTEM ) 
		judge = 0
	else
		judge = 1
	end

	if judge == 1 then
		if CheckBuff( OwnerID() , 501570) == true then 
			ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );--視窗已經打開了
			return
		end
		if TargetOrgID == 113694 then   --弩砲台建築點
			PackBag =  CountBodyItem( OwnerID() , 206760 ) --弩砲台(組合包)
			Record = 30 --生產所需戰績
			Energy = 100 --生產所需能量
			ItemID = 102756 --生產內容：弩砲台
			PageItemID = 206760 --弩砲台組合包
		elseif TargetOrgID == 113695 then   --發石台建築點
			PackBag =  CountBodyItem( OwnerID() , 206766 ) --弩砲台(組合包)
			Record = 50 --生產所需戰績
			Energy = 150 --生產所需能量
			ItemID = 102762 --生產內容：發石台
			PageItemID = 206766 --發石台組合包
		end

		local CheckTime = 1
		local RunTime = 1
		local DialogStatus = 0
		local TransferSelect = {}
		TransferSelect[0] = { "[SC_OKAY]" }
		TransferSelect[1] = { "[SC_CANCEL]" }				-- 離開對話

		if PackBag == 0 then
			DialogCreate( OwnerID() , EM_LuaDialogType_Select , "[SC_YU_GUILDWAR_BUILD_35][$SETVAR1=".."["..ItemID.."]".."][$SETVAR2="..Energy.."][$SETVAR3="..Record.."]" )
			AddBuff(OwnerID() , 501570,0,-1);
		else
			DialogCreate( OwnerID() , EM_LuaDialogType_Select , "[SC_YU_GUILDWAR_BUILD_36][$SETVAR1=".."["..ItemID.."]".."][$SETVAR2=".."["..PageItemID.."]".."]" )
			AddBuff(OwnerID() , 501570,0,-1);
		end

		for i = 0, table.getn( TransferSelect ) do
			DialogSelectStr( OwnerID() , TransferSelect[i][1] )
		end
		if( DialogSendOpen( OwnerID() ) == false ) then 
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 )	--資料送出有問題
			return 0
		end
		while true do
			Sleep( 5 )
			RunTime = RunTime + 1
			if RunTime  > 60 then
				ScriptMessage( PlayerID , PlayerID , 0 , "[SC_BK_BUFFNPC_08]", 0 )	-- 閒置超過30秒,自動關閉視窗。
				CancelBuff( OwnerID(), 501570 )
				DialogClose( PlayerID )				
				break
			end
			-- 2013.07.19 阿浩：將檢查能量與戰績由迴圈外變更為迴圈內，修正玩家點擊弩砲台建築點(113694)或發石台建築點(113695)時，在能量或戰績不足的情況下，依然能夠選擇建築，導致能量為負值的問題。
			local Player = OwnerID()
			local Now_E = GetGuildWarEnergy( Player ) --目前能量
			local Now_R =  CountBodyItem( Player , 206685 ) --目前戰績
			--
			-- 2013.06.28 阿浩:加入距離檢測，過遠時自動關閉視窗
			local Distance = GetDistance( PlayerID , TargetID() )	-- 查詢玩家與塔之間的距離
			if Distance >= 50 then
				CancelBuff( PlayerID , 501570 )
				DialogClose( PlayerID )
				break
			end
			--			
			DialogStatus = DialogGetResult( PlayerID )
			--Say( PlayerID , DialogStatus )

			if DialogStatus == -2 then
				-- DO nothing
			elseif DialogStatus == 1 or DialogStatus == -1 then
				CancelBuff( OwnerID(), 501570 );--DialogClose( PlayerID )
				break
			elseif DialogStatus == 0 then
				if PackBag == 0 then
					if (Now_R >= Record) and (Now_E >= Energy) then
						Beginplot( TargetID() ,"Yuyu_GW_Siege_eq_2_02_0", 0 ) --生產物品
						WriteRoleValue( OwnerID()  , EM_RoleValue_Register+3 ,  Energy  ) --記錄該建築物之花費
						CancelBuff( OwnerID(), 501570 );--DialogClose( PlayerID )
						break

					elseif (Now_R < Record) and (Now_E < Energy) then
						ScriptMessage( OwnerID(),OwnerID(),1,"[SC_YU_GUILDWAR_BUILD_27]",0)	--研發所需之能量、戰績不足
						ScriptMessage( OwnerID(),OwnerID(),0,"[SC_YU_GUILDWAR_BUILD_27]",0)	--研發所需之能量、戰績不足
						CancelBuff( OwnerID(), 501570 );--DialogClose( PlayerID )
						break

					elseif (Now_R >= Record) and (Now_E < Energy) then
						ScriptMessage( OwnerID(),OwnerID(),1,"[SC_YU_GUILDWAR_BUILD_31]",0)	--研發所需之能量不足
						ScriptMessage( OwnerID(),OwnerID(),0,"[SC_YU_GUILDWAR_BUILD_31]",0)	--
						CancelBuff( OwnerID(), 501570 );--DialogClose( PlayerID )
						break

					elseif (Now_R < Record) and (Now_E >= Energy) then
						ScriptMessage( OwnerID(),OwnerID(),1,"[SC_YU_GUILDWAR_BUILD_32]",0)	--研發所需之戰績不足
						ScriptMessage( OwnerID(),OwnerID(),0,"[SC_YU_GUILDWAR_BUILD_32]",0)	--研發所需之戰績不足
						CancelBuff( OwnerID(), 501570 );--DialogClose( PlayerID )
						break
					end
				else
					Beginplot( TargetID() ,"Yuyu_GW_Siege_eq_2_03_0", 0 ) --生產物品
					WriteRoleValue( OwnerID()  , EM_RoleValue_Register+3 ,  Energy  ) --記錄該建築物之花費
					CancelBuff( OwnerID(), 501570 );--DialogClose( PlayerID )
					break
			
				end
			end
		end
	end
end

function Yuyu_GW_Siege_eq_2_02_0() --【攻城器具】-- 消費資源生產物品
	Beginplot( TargetID() ,"Yuyu_GW_Siege_eq_2_02", 0 ) --生產物品
end

function Yuyu_GW_Siege_eq_2_02() --【攻城器具】-- 消費資源生產物品
--OwnerID 玩家
--TargetID 建築
	-- 2013.08.26 阿浩，建築時消耗的能量與戰績，由預先扣除調整為建造完成時扣除。
	local Player = OwnerID()
	local Npc = TargetID()
	--
	local Energy = ReadRoleValue( OwnerID() , EM_RoleValue_Register+3 ) --能量
	local Record = Energy--戰績
	
	local Kind = 0
	local item = 0
	if Energy == 100 then
		Kind = 113694--弩砲台
		item =102756
		Record = 30
	elseif Energy == 150 then
		Kind = 113695--發石台
		item =102762
		Record = 50
	end

	local str = "[SC_YU_GUILDWAR_BUILD_28][$SETVAR1="..Energy.."][$SETVAR2="..Record.."]"
	local back = "[SC_YU_GUILDWAR_BUILD_29][$SETVAR1="..Energy.."][$SETVAR2="..Record.."]"
	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID )
	local ZoneID = Zone-1000*math.floor( Zone/1000 )
	local truecast = 150			--/*科技研發所需時間

	if (ReadRoleValue( OwnerID() , EM_RoleValue_Register) ~= 0) or (ReadRoleValue( TargetID() , EM_RoleValue_Register) == 1) then
		ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_AUCTION_WAIT_NEXT]",0)	--忙碌中，請稍候再試。
		return
	end
	WriteRoleValue( OwnerID() , EM_RoleValue_Register, TargetID() ) --研發鎖定中
	WriteRoleValue( TargetID() , EM_RoleValue_Register, 1 ) --研發鎖定中
	WriteRoleValue( OwnerID() , EM_RoleValue_PID, 1 ) --研發鎖定中
	WriteRoleValue( TargetID() , EM_RoleValue_PID, 1 ) --研發鎖定中
	-- 2013.08.26 阿浩，建築時消耗的能量與戰績，由預先扣除調整為建造完成時扣除。
	ScriptMessage( Player , Player , 1 , "[SC_GUILDWAR_BUILDING_START]" , C_SYSTEM )	-- 開始建築
	ScriptMessage( Player , Player , 0 , "[SC_GUILDWAR_BUILDING_START]" , C_SYSTEM )
	--
	if BeginCastBar( OwnerID(),"["..item.."]", truecast , ruFUSION_ACTORSTATE_CRAFTING_LOOP , ruFUSION_ACTORSTATE_CRAFTING_END , 0 ) == 1 then
		sleep( 4 ) 
		while true do
			sleep( 1 );
			local CastBarStatus = CheckCastBar( OwnerID() );
			-- 2013.08.26 阿浩，建築時消耗的能量與戰績，由預先扣除調整為建造完成時扣除。
			local Now_E = GetGuildWarEnergy( Player ) --目前能量
			local Now_R = CountBodyItem( Player , 206685 ) --目前戰績
			--
			if ( CastBarStatus ~= 0 ) then 
				if ( CastBarStatus > 0) then -- 成功
					result = "OKOK"
					EndCastBar( OwnerID() , CastBarStatus )
					break;
				elseif ( CastBarStatus < 0 ) then -- 失敗
					result = "DAME"
					EndCastBar( OwnerID() , CastBarStatus )
					break;
				end
			elseif (CheckID( TargetID() ) == false) then
				result = "DAME"
				EndCastBar( OwnerID() , CastBarStatus )
				break
			-- 2013.08.26 阿浩，建築時消耗的能量與戰績，由預先扣除調整為建造完成時扣除。
			elseif Now_E < Energy or Now_R < Record then
				result = "DAME"
				EndCastBar( Player , CastBarStatus )
				break
				--						
			end
		end

		if ( result == "OKOK" ) then
			AddGuildWarEnergy( Player , -Energy )	--扣除能量
			DelBodyItem( Player , 206685 , Record )	--扣除戰績
			-- 2013.08.26 阿浩，建築時消耗的能量與戰績，由預先扣除調整為建造完成時扣除。			
			ScriptMessage( Player , Player , 1 , "[SC_GUILDWAR_BUILDING_COMPLETED][$SETVAR1="..Energy.."][$SETVAR2="..Record.."]" , C_SYSTEM )	-- 建築完成，消耗能量[$VAR1]、戰績[$VAR2]
			ScriptMessage( Player , Player , 0 , "[SC_GUILDWAR_BUILDING_COMPLETED][$SETVAR1="..Energy.."][$SETVAR2="..Record.."]" , C_SYSTEM )
			--
			local RoomID = ReadRoleValue( TargetID() ,EM_RoleValue_RoomID) 
			local OwnerX = ReadRoleValue( TargetID() , EM_RoleValue_X ) 
			local OwnerY = ReadRoleValue( TargetID() , EM_RoleValue_Y ) 
			local OwnerZ = ReadRoleValue( TargetID() , EM_RoleValue_Z ) 
			local OwnerDIR = ReadRoleValue( TargetID() , EM_RoleValue_Dir ) 
			local PlayerGuildID = GetRoleCampID( TargetID() )--玩家的陣營

			local StageNpc = CreateObj( item , OwnerX , OwnerY , OwnerZ , OwnerDIR , 1)
			
			-- 2013.06.14 載具等級會隨玩家角色等級開放的上限而成長
			local ServerMaxLv = ReadRoleValue( OwnerID() , EM_RoleValue_MaxLv )	-- 讀取伺服器設定的玩家等級上限
			WriteRoleValue( StageNpc , EM_RoleValue_LV , ServerMaxLv )
			AddBuff( StageNpc ,505013 ,1 ,1 ); --縮小 
			SetModeEx( StageNpc, EM_SetModeType_Show, false )--顯示
			AddToPartition( StageNpc , RoomID )  
			SetModeEx( StageNpc , EM_SetModeType_Strikback, false )--反擊
			SetModeEx( StageNpc , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
			SetModeEx( StageNpc , EM_SetModeType_Searchenemy, false )--索敵
			AddBuff( StageNpc ,502707 ,1 ,-1 ); --非戰鬥中不回血的buff (ownerID,buff,LV,Time)
			SetRoleCampID( StageNpc, PlayerGuildID )--寫入陣營

		---*---以下判斷玩家是否有學習裝甲技術、輪軸技術之科技
			local SetA = -1
			local SetB = -1		
			local Count = BuffCount ( OwnerID())
			for i = 0 , Count do
				local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID ) -- 基本法術ID
				if BuffID == 505316 then--裝甲技術
					local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )--該建築第 j 個BUFF的等級
					SetA = BuffLv
				elseif BuffID == 505315 then--輪軸技術
					local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )--該建築第 j 個BUFF的等級
					SetB = BuffLv
				end
			end

			if SetA>-1 then
				AddBuff( StageNpc , 505935 , SetA , -1 )--裝甲技術
			end

			if SetB>-1 then
				AddBuff( StageNpc , 506149 , SetB+1 , -1 )--輪軸技術
			end

			WriteRoleValue( StageNpc , EM_RoleValue_Register, TargetID() ) --記住建築基地號碼
			SetPlot(  StageNpc, "dead","Yuyu_GW_Siege_eq_2_05",0 )     

			sleep(8)
			--↓隱藏基地
			SetModeEx( TargetID()   , EM_SetModeType_Mark, false )--標記
			SetModeEx( TargetID()  , EM_SetModeType_HideName, true )--名稱
			SetModeEx( TargetID() , EM_SetModeType_ShowRoleHead, false )--頭像框
			SetModeEx( TargetID() , EM_SetModeType_Fight , false )--可砍殺攻擊
			SetModeEx( TargetID()  , EM_SetModeType_Move, false )--移動
			SetModeEx( TargetID() , EM_SetModeType_Obstruct, false )--阻擋
			SetModeEx( TargetID(), EM_SetModeType_Show, false )--顯示
			SetPlot( TargetID() , "touch" , "" , 0 )	--公會城戰時
			--↑隱藏基地
			SetModeEx( StageNpc, EM_SetModeType_Show, true )--顯示	


			WriteRoleValue( OwnerID() , EM_RoleValue_Register, 0 ) --解除鎖定可再次研發
			WriteRoleValue( TargetID() , EM_RoleValue_Register, 0 ) --解除鎖定可再次研發
			WriteRoleValue( OwnerID() , EM_RoleValue_PID, 0 ) --解除鎖定可再次研發
			WriteRoleValue( TargetID() , EM_RoleValue_PID, 0 ) --解除鎖定可再次研發

			if Energy == 100 then--弩砲台
				Delobj(TargetID())
			end

		elseif ( result == "DAME" ) then
			-- 2013.08.26 阿浩，建築時消耗的能量與戰績，由預先扣除調整為建造完成時扣除。		
			ScriptMessage( Player , Player , 1 , "[SC_GUILDWAR_BUILDING_FAILED]" , C_RED )	-- 建築失敗
			ScriptMessage( Player , Player , 0 , "[SC_GUILDWAR_BUILDING_FAILED]" , C_RED )
			--
			WriteRoleValue( OwnerID() , EM_RoleValue_Register, 0 ) --解除鎖定可再次研發
			WriteRoleValue( TargetID() , EM_RoleValue_Register, 0 ) --解除鎖定可再次研發
			WriteRoleValue( OwnerID() , EM_RoleValue_PID, 0 ) --解除鎖定可再次研發
			WriteRoleValue( TargetID() , EM_RoleValue_PID, 0 ) --解除鎖定可再次研發
			WriteRoleValue( OwnerID()  , EM_RoleValue_Register+3 ,  0  ) --清空要研發的技術等級
		end

	end
end

function Yuyu_GW_Siege_eq_2_03_0() --【攻城器具】-- 消費資源生產物品
	Beginplot( TargetID() ,"Yuyu_GW_Siege_eq_2_03", 0 ) --生產物品
end

function Yuyu_GW_Siege_eq_2_03() --【攻城器具】-- 消耗生產物品
--OwnerID玩家
--TargetID建築
	-- 2013.08.26 阿浩，建築時消耗的能量與戰績，由預先扣除調整為建造完成時扣除。
	local Player = OwnerID()
	local Npc = TargetID()
	local ItemID
	--
	local Energy = ReadRoleValue( OwnerID() , EM_RoleValue_Register+3 ) --能量
	local Record = Energy --戰績
	
	local Kind = 0
	local item = 0
	if Energy == 100 then
		Kind = 113694--弩砲台
		item =102756
		Record = 30
		ItemID = 206760	-- 弩砲台(組合包)
	elseif Energy == 150 then
		Kind = 113695--發石台
		item =102762
		Record = 50
		ItemID = 206766	-- 發石台(組合包)
	end

	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )
	local truecast = 150			--/*科技研發所需時間

	if (ReadRoleValue( OwnerID() , EM_RoleValue_Register) ~= 0) or (ReadRoleValue( TargetID() , EM_RoleValue_Register) == 1) then
		ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_AUCTION_WAIT_NEXT]",0)	--忙碌中，請稍候再試。
		return
	end
	WriteRoleValue( OwnerID() , EM_RoleValue_Register, TargetID() ) --研發鎖定中
	WriteRoleValue( TargetID() , EM_RoleValue_Register, 1 ) --研發鎖定中
	WriteRoleValue( OwnerID() , EM_RoleValue_PID, 1 ) --研發鎖定中
	WriteRoleValue( TargetID() , EM_RoleValue_PID, 1 ) --研發鎖定中
	-- 2013.08.26 阿浩，建築時消耗的能量與戰績，由預先扣除調整為建造完成時扣除。
	ScriptMessage( Player , Player , 1 , "[SC_GUILDWAR_BUILDING_START]" , C_SYSTEM )	-- 開始建築
	ScriptMessage( Player , Player , 0 , "[SC_GUILDWAR_BUILDING_START]" , C_SYSTEM )
	--
	if BeginCastBar( OwnerID(),"["..item.."]", truecast , ruFUSION_ACTORSTATE_CRAFTING_LOOP , ruFUSION_ACTORSTATE_CRAFTING_END , 0 ) == 1 then
		sleep( 4 ) 
		while true do
			sleep( 1 );
			local CastBarStatus = CheckCastBar( OwnerID() );
			if ( CastBarStatus ~= 0 ) then 
				if ( CastBarStatus > 0) then -- 成功
					result = "OKOK"
					EndCastBar( OwnerID() , CastBarStatus )
					break
				elseif ( CastBarStatus < 0 ) then -- 失敗
					result = "DAME"
					EndCastBar( OwnerID() , CastBarStatus )
					break
				end
			elseif (CheckID( TargetID() ) == false) then
				result = "DAME"
				EndCastBar( OwnerID() , CastBarStatus )
				break;
			-- 2013.08.26 阿浩，修正玩家使用弩砲台(組合包)(206760)、發石台(組合包)(206766)建築弩砲台(發石台)後，當建築的讀取條結束時，在該物品不存在的情況下，依然可以成功建築的問題。					
			elseif CountBodyItem( Player , ItemID ) < 1 then
				result = "DAME"
				EndCastBar( Player , CastBarStatus )
				break
			--
			end
		end

		if ( result == "OKOK" ) then

			local RoomID = ReadRoleValue( TargetID() ,EM_RoleValue_RoomID) 
			local OwnerX = ReadRoleValue( TargetID() , EM_RoleValue_X ) 
			local OwnerY = ReadRoleValue( TargetID() , EM_RoleValue_Y ) 
			local OwnerZ = ReadRoleValue( TargetID() , EM_RoleValue_Z ) 
			local OwnerDIR = ReadRoleValue( TargetID() , EM_RoleValue_Dir ) 
			local PlayerGuildID = GetRoleCampID( TargetID() )--玩家的陣營

			local StageNpc = CreateObj( item , OwnerX , OwnerY , OwnerZ , OwnerDIR , 1)
			
			-- 2013.06.14 載具等級會隨玩家角色等級開放的上限而成長
			local ServerMaxLv = ReadRoleValue( OwnerID() , EM_RoleValue_MaxLv )	-- 讀取伺服器設定的玩家等級上限
			WriteRoleValue( StageNpc , EM_RoleValue_LV , ServerMaxLv )

			AddBuff( StageNpc ,505013 ,1 ,1 ); --縮小 
			SetModeEx( StageNpc, EM_SetModeType_Show, false )--顯示
			AddToPartition( StageNpc , RoomID )  

		---*---以下判斷玩家是否有學習裝甲技術、輪軸技術之科技
			local SetA = -1
			local SetB = -1		
			local Count = BuffCount ( OwnerID())
			for i = 0 , Count do
				local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID ) -- 基本法術ID
				if BuffID == 505316 then--裝甲技術
					local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )--該建築第 j 個BUFF的等級
					SetA = BuffLv
				elseif BuffID == 505315 then--輪軸技術
					local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )--該建築第 j 個BUFF的等級
					SetB = BuffLv
				end
			end

			if SetA>-1 then
				AddBuff( StageNpc , 505935 , SetA , -1 )--裝甲技術
			end

			if SetB>-1 then
				AddBuff( StageNpc , 506149 , SetB+1 , -1 )--輪軸技術
			end

			SetModeEx( StageNpc , EM_SetModeType_Strikback, false )--反擊
			SetModeEx( StageNpc , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
			SetModeEx( StageNpc , EM_SetModeType_Searchenemy, false )--索敵
			AddBuff( StageNpc ,502707 ,1 ,-1 ); --非戰鬥中不回血的buff (ownerID,buff,LV,Time)
			SetRoleCampID( StageNpc, PlayerGuildID )--寫入陣營

			Beginplot( OwnerID() ,"Yuyu_GW_Siege_eq_2_04", 0 ) --刪除物品
			WriteRoleValue( StageNpc , EM_RoleValue_Register, TargetID() ) --記住建築基地號碼
			SetPlot(  StageNpc, "dead","Yuyu_GW_Siege_eq_2_05",0 )     

			sleep(8)
			--↓隱藏基地
			SetModeEx( TargetID()   , EM_SetModeType_Mark, false )--標記
			SetModeEx( TargetID()  , EM_SetModeType_HideName, true )--名稱
			SetModeEx( TargetID() , EM_SetModeType_ShowRoleHead, false )--頭像框
			SetModeEx( TargetID() , EM_SetModeType_Fight , false )--可砍殺攻擊
			SetModeEx( TargetID()  , EM_SetModeType_Move, false )--移動
			SetModeEx( TargetID() , EM_SetModeType_Obstruct, false )--阻擋
			SetModeEx( TargetID(), EM_SetModeType_Show, false )--顯示
			SetPlot( TargetID() , "touch" , "" , 0 )	--公會城戰時
			--↑隱藏基地
			SetModeEx( StageNpc, EM_SetModeType_Show, true )--顯示	

			WriteRoleValue( OwnerID() , EM_RoleValue_Register, 0 ) --解除鎖定可再次研發
			WriteRoleValue( TargetID() , EM_RoleValue_Register, 0 ) --解除鎖定可再次研發
			WriteRoleValue( OwnerID() , EM_RoleValue_PID, 0 ) --解除鎖定可再次研發
			WriteRoleValue( TargetID() , EM_RoleValue_PID, 0 ) --解除鎖定可再次研發

		elseif ( result == "DAME" ) then
			-- 2013.08.26 阿浩，建築時消耗的能量與戰績，由預先扣除調整為建造完成時扣除。		
			ScriptMessage( Player , Player , 1 , "[SC_GUILDWAR_BUILDING_FAILED]" , C_RED )	-- 建築失敗
			ScriptMessage( Player , Player , 0 , "[SC_GUILDWAR_BUILDING_FAILED]" , C_RED )
			--		
			WriteRoleValue( OwnerID() , EM_RoleValue_Register, 0 ) --解除鎖定可再次研發
			WriteRoleValue( TargetID() , EM_RoleValue_Register, 0 ) --解除鎖定可再次研發
			WriteRoleValue( OwnerID() , EM_RoleValue_PID, 0 ) --解除鎖定可再次研發
			WriteRoleValue( TargetID() , EM_RoleValue_PID, 0 ) --解除鎖定可再次研發
			WriteRoleValue( OwnerID()  , EM_RoleValue_Register+3 ,  0  ) --清空要研發的技術等級
		end

	end
end

function Yuyu_GW_Siege_eq_2_04() --【攻城器具】-- 消耗生產物品

	local Energy = ReadRoleValue( TargetID() , EM_RoleValue_Register+3 ) --能量
	local item = 0
	if Energy == 100 then
		item =206760
	elseif Energy == 150 then
		item =206766
	end

	DelBodyItem( OwnerID() , item , 1 )

end

function Yuyu_GW_Siege_eq_2_05() --【守備建築物死亡劇情】
	local Base = ReadRoleValue( OwnerID() , EM_RoleValue_Register) --基地號碼
	Beginplot( Base ,"Yuyu_GW_Siege_eq_2_06", 0 ) 
end

function Yuyu_GW_Siege_eq_2_06() --【建築基地重生】
	sleep(30)
	Beginplot( OwnerID() ,"Yuyu_GW_Siege_eq_2_00", 0 ) 
end


--==============================================================================



function Yu_GWSBDDD(NA,AA,ND,BB,PA,CC,PD,DD) --【載具攻防加點初始劇情】
Say(OwnerID() ,"111")
	if NA == 0 then 				--攻擊NPC加減% 
		AddBuff( OwnerID() ,505513 ,AA ,-1 );
	elseif NA == 1 then
		AddBuff( OwnerID() ,505923 ,AA ,-1 );
	end

	if ND == 0 then				--被NPC攻擊加減% 
		AddBuff( OwnerID() ,505516 ,BB ,-1 );  
	elseif ND == 1 then
		AddBuff( OwnerID() ,505517 ,BB ,-1 );  
	end

	if PA == 0 then					--攻擊玩家加減%
		AddBuff( OwnerID() ,505514 ,CC ,-1 ); 
	elseif PA == 1 then
		AddBuff( OwnerID() ,505515 ,CC ,-1 );  
	end

	if PD == 0 then
		AddBuff( OwnerID() ,505921 ,DD ,-1 ); --被玩家攻擊加減% 
	elseif PD == 1 then
		AddBuff( OwnerID() ,505512 ,DD ,-1 ); --被玩家攻擊加減% 
	end

end

function Yuyu_GW_Siege_Born() --【載具攻防加點初始劇情】
--用 OrgID判斷 不要用PCALL

	local OwnerIDOrgID = ReadRoleValue( OwnerID() ,EM_RoleValue_OrgID ) --目前載具之OrgID
	local Siege = {102756,--弩砲台
			 102757,--連弩車
			 102758,--驅逐弩砲車
			 102759,--衝門鎚
			 102760,--鐵環衝車
			 102761,--無畏雄獅鎚
			 102762,--發石台
			 102763,--投石車
			 102764}--烈焰雙砲車

	local BuffKind = 0 

	for i = 1,9 do

		if Siege[i]==OwnerIDOrgID then
			BuffKind = i
		end
	end

	local SiegeA={505513,80,505516,300,505514,100,505512,25}--弩砲台 		攻NPC衰弱、增防NPC、攻玩家增傷、被玩家攻衰弱
	local SiegeB={505513,75,505516,300,505514,100,505512,25}--連弩車
	local SiegeC={505513,70,505516,300,505514,100,505512,25}--驅除弩砲車 
	--{ 攻NPC傷減、被NPC攻加、攻玩家傷加、被玩家攻加 }
	local SiegeD={505923,160,505516,300,505515,70,505921,5}--衝門鎚
	local SiegeE={505923,180,505516,300,505515,65,505921,5}--鐵環衝車
	local SiegeF={505923,200,505516,300,505515,60,505921,5}--無畏雄獅鎚 
	--{ 攻NPC傷加、被NPC攻加、攻玩家傷減、被玩家攻減 }
	local SiegeG={505923,160,505516,300,505514,80,505512,25}--發石台
	local SiegeH={505923,160,505516,300,505514,80,505512,25}--投石車 
	local SiegeI={505923,180,505516,300,505514,80,505512,25}--烈焰雙砲車
	--{ 攻NPC傷加、被NPC攻加、攻玩家傷加、被玩家攻加 }
	local Buff ={SiegeA,SiegeB,SiegeC,SiegeD,SiegeE,SiegeF,SiegeG,SiegeH,SiegeI}

	AddBuff( OwnerID() ,Buff[BuffKind][1] ,Buff[BuffKind][2] ,-1 );  
	AddBuff( OwnerID() ,Buff[BuffKind][3] ,Buff[BuffKind][4] ,-1 );  
	AddBuff( OwnerID() ,Buff[BuffKind][5] ,Buff[BuffKind][6] ,-1 );  
	AddBuff( OwnerID() ,Buff[BuffKind][7] ,Buff[BuffKind][8] ,-1 );  
	AddBuff( OwnerID() ,502707 ,1 ,-1 ); --非戰鬥中不回血的buff (ownerID,buff,LV,Time)
	if BuffKind == 1 then
		local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 

		local OwnerX = ReadRoleValue( OwnerID() , EM_RoleValue_X ) 
		local OwnerY = ReadRoleValue( OwnerID() , EM_RoleValue_Y ) 
		local OwnerZ = ReadRoleValue( OwnerID() , EM_RoleValue_Z ) 
		local OwnerDIR = ReadRoleValue( OwnerID() , EM_RoleValue_Dir ) 
		local PlayerGuildID = GetRoleCampID( OwnerID() )--玩家的陣營

		local StageNpc = CreateObj( 113694 , OwnerX , OwnerY , OwnerZ , OwnerDIR , 1)--弩砲台建築點
		AddToPartition( StageNpc , RoomID )  
		SetRoleCampID( StageNpc, PlayerGuildID )--寫入陣營

		sleep(5)
		SetModeEx( StageNpc   , EM_SetModeType_Mark, false )--標記
		SetModeEx( StageNpc  , EM_SetModeType_HideName, true )--名稱
		SetModeEx( StageNpc , EM_SetModeType_ShowRoleHead, false )--頭像框
		SetModeEx( StageNpc , EM_SetModeType_Fight , false )--可砍殺攻擊
		SetModeEx( StageNpc  , EM_SetModeType_Move, false )--移動
		SetModeEx( StageNpc , EM_SetModeType_Obstruct, false )--阻擋
		SetModeEx( StageNpc, EM_SetModeType_Show, false )--顯示
		SetPlot( StageNpc , "touch" , "" , 0 )	--公會城戰時
		WriteRoleValue( OwnerID() , EM_RoleValue_Register, StageNpc ) --記住建築基地號碼
		SetPlot(  OwnerID(), "dead","Yuyu_GW_Siege_eq_2_05",0 )     
	end
end