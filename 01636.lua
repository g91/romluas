function Yuyu_GuildWarBuliding_2_01() -- 公會戰時，【冶煉廠、農田、伐木廠】功能  --------------------------------------全軍獲得型

	local Zone = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )

	if (ZoneID == 402) or (ZoneID == 31)  then
		SetModeEx( OwnerID()   , EM_SetModeType_Mark, true )--標記
		SetModeEx( OwnerID()  , EM_SetModeType_HideName, true )--名稱
		SetModeEx( OwnerID() , EM_SetModeType_ShowRoleHead, true )--頭像框
		SetModeEx( OwnerID() , EM_SetModeType_Fight , true )--可砍殺攻擊
		SetModeEx( OwnerID()  , EM_SetModeType_Move, false )--移動
		SetModeEx( OwnerID() , EM_SetModeType_Obstruct, true )--阻擋
		SetModeEx( OwnerID()  , EM_SetModeType_Strikback, false )--反擊
		SetModeEx( OwnerID() , EM_SetModeType_DisableRotate, true )--轉向
		SetModeEx( OwnerID() , EM_SetModeType_Searchenemy, false )--索敵
		SetModeEx( OwnerID() , EM_SetModeType_NotShowHPMP, true )--不顯示血條
	
		AddBuff( OwnerID() , 505921 , 89 , -1 )	--90%	--被玩家攻擊傷害折扣 法術等級 0 = 1%	
		AddBuff( OwnerID() , 505516 , 99, -1 )	--100%	--被NPC攻擊傷害增加 法術等級 0 = 1%
		AddBuff( OwnerID() ,502707 ,1 ,-1 ); --非戰鬥中不回血的buff (ownerID,buff,LV,Time)

		SetCursorType( OwnerID() , eCursor_Interact ); --游標變成 齒輪
		SetPlot( TargetID() , "touch" , "Yuyu_GuildWarBuliding_2_02" , 100 )	--公會城戰時
	end
end

function Yuyu_GuildWarBuliding_2_02() -- 公會戰時，【冶煉廠、農田、伐木廠】

--	Say( TargetID() ,"TargetID"..1 )--建築物
--	Say( OwnerID() ,"OwnerID"..1 )--玩家

	if ReadRoleValue( TargetID() , EM_RoleValue_Register) == 1 then
		ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_AUCTION_WAIT_NEXT]",0)	--忙碌中，請稍候再試。
		return	
	end
-- 2011.11.23 偵測距離，距離外，視窗自動關閉 -- 發生 Target busy
--	local Buffed = CheckBuff( OwnerID() , 621751 )
--	SysCastSpellLv( TargetID() , OwnerID() , 496587 , 0 )
--	if Buffed== false then
--		CallPlot( OwnerID() , "Lua_GuildWar_Ranger" , 50 )  --檢查NPC與玩家的距離
--	end
---------------------------------------------------------------------------
	local VOC = ReadRoleValue( OwnerID() , EM_RoleValue_VOC )--職業
	local PassCard =  CountBodyItem( OwnerID() , 206769 ) --是否具有通行證 = GM測試
	local RoomID = ReadRoleValue( TargetID(), EM_RoleValue_RoomID )
	local PlayerGuildID = ReadRoleValue( OwnerID() ,   EM_RoleValue_GuildID ) 
	local BuildingGuildID = ReadRoleValue( TargetID() ,   EM_RoleValue_GuildID ) 

	local Record = 500 --研究所需戰績
	local Energy = 500 --研究所需能量

--	local Now_E = GetGuildWarEnergy(OwnerID()) --目前能量
--	local Now_R =  CountBodyItem( OwnerID() , 206685 ) --目前戰績

---*---以下判斷玩家是否有學習折扣技術
	local SetA = -1
	local SetB = -1			
	local Count = BuffCount ( OwnerID())
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID ) -- 基本法術ID
		if BuffID == 505313 then--績效學
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )--該建築第 j 個BUFF的等級

			SetA = BuffLv

		elseif BuffID == 505312 then--節能學
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )

			SetB = BuffLv

		end
	end

--	Say(  OwnerID() ,"SetA  BuffLv ="..SetA )
--	Say(  OwnerID() ,"SetB  BuffLv ="..SetB )

	if SetA>-1 then

		Record = Record*(1-((SetA+1)*0.05))
--		Say(  OwnerID() ,"Record ="..Record )
		Record = math.ceil(Record)--小數點以下均捨去
--		Say(  OwnerID() ,"math.ceil(Record) ="..Record )
	end
	if SetB>-1 then

		Energy = Energy*(1-((SetB+1)*0.05))
--		Say(  OwnerID() ,"Energy ="..Energy )
		Energy = math.ceil(Energy)--小數點以下均捨去
--		Say(  OwnerID() ,"math.ceil(Energy) ="..Energy )
	end

---*---↑

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

		local BuildingOrgID_1 = {112703,112704,112705,112706,112707,112708,112709,112710,112711,112712} --【冶煉廠】 10階級之OrgID---------------------------------------------/*變數↓
		local BuildingOrgID_2 = {112810,112811,112812,112813,112814,112815,112816,112817,112818,112819} --【農田】10階級之OrgID
		local BuildingOrgID_3 = {113141,113142,113143,113144,113145,113146,113147,113148,113149,113150} --【伐木廠】10階級之OrgID
		local BuildingOrgID = { BuildingOrgID_1 , BuildingOrgID_2 , BuildingOrgID_3 }---------------------------------------------------------------------------------------/*變數↑
		local BuildingNum = 0

		local BuildStr = {
				  "[SC_YU_GUILDWAR_W6_00][$SETVAR1="..Energy.."][$SETVAR2="..Record.."]",--冶煉廠

			                  "[SC_YU_GUILDWAR_W7_00][$SETVAR1="..Energy.."][$SETVAR2="..Record.."]",--農田

			                  "[SC_YU_GUILDWAR_W8_00][$SETVAR1="..Energy.."][$SETVAR2="..Record.."]" --伐木廠
											  }--科技說明文

		local BStr_A = 0	

		local TargetOrgID = ReadRoleValue( TargetID() ,EM_RoleValue_OrgID ) --目前建築物之OrgID

--Say( OwnerID() ,"TargetOrgID="..TargetOrgID )

		local BuildingLV = 0 --建築物等級
		--*/

-- 2011.11.21 應廠商要求，複數同建築Buff不可堆疊，取決於該建築最高等級 --
	--	已移至 Server Script 701642 243行的地圖開場劇情中
	--	if Z402_AreaBuff == nil then	-- 冶煉廠、農田、罰木場
	--		Z402_AreaBuff = {}
	--	end
	--	if Z402_AreaBuff[RoomID] == nil then				-- 宣告該 Room 
	--		Z402_AreaBuff[RoomID] = {}
	--	end
		if Z402_AreaBuff[RoomID][BuildingGuildID] == nil then		-- 宣告該陣營
			Z402_AreaBuff[RoomID][BuildingGuildID] = {}
		end	
		if Z402_AreaBuff[RoomID][BuildingGuildID][505420] == nil then	-- 冶煉廠 鋼鐵精鍊
			Z402_AreaBuff[RoomID][BuildingGuildID][505420] = 0
		end
		if Z402_AreaBuff[RoomID][BuildingGuildID][505421] == nil then	-- 冶煉廠 強化防具
			Z402_AreaBuff[RoomID][BuildingGuildID][505421] = 0
		end
		if Z402_AreaBuff[RoomID][BuildingGuildID][505418] == nil then	-- 農田 奇蹟之花
			Z402_AreaBuff[RoomID][BuildingGuildID][505418] = 0 			
		end
		if Z402_AreaBuff[RoomID][BuildingGuildID][505419] == nil then	-- 農田 腐蝕之花
			Z402_AreaBuff[RoomID][BuildingGuildID][505419] = 0
		end
		if Z402_AreaBuff[RoomID][BuildingGuildID][505422] == nil then	-- 伐木場 強化防具
			Z402_AreaBuff[RoomID][BuildingGuildID][505422] = 0
		end
		if Z402_AreaBuff[RoomID][BuildingGuildID][505423] == nil then	-- 伐木場 魔法護甲
			Z402_AreaBuff[RoomID][BuildingGuildID][505423] = 0
		end
--
		for i= 1 , 10 do

			if TargetOrgID == BuildingOrgID[1][i] then ------------------------------------------------------------------------------------------------------------------------------------------/*變數↓
				BuildingLV = i  --建築物等級
				BuildingNum = 1
				BStr_A = BuildStr[1]
				SetPlot(  TargetID(), "dead","Lua_GUILDWAR_BuildDScript_0",0 )     --冶煉廠 死亡劇情

			elseif TargetOrgID == BuildingOrgID[2][i] then 
				BuildingLV = i  --建築物等級
				BuildingNum = 2
				BStr_A = BuildStr[2]
				SetPlot(  TargetID(), "dead","Lua_GUILDWAR_BuildDScript_0",0 )     --農田 死亡劇情

			elseif TargetOrgID == BuildingOrgID[3][i] then 
				BuildingLV = i  --建築物等級
				BuildingNum = 3
				BStr_A = BuildStr[3]
				SetPlot(  TargetID(), "dead","Lua_GUILDWAR_BuildDScript_0",0 )     --伐木廠 死亡劇情

			end
		end
--Say( OwnerID() ,"BuildingLV="..BuildingLV )

		--*\此段判斷建築物等級

		local Technology = {  } --該建築物可學之Buff技能號碼清單
		-- 2011.11.21  新增，簡化全域變數名稱 -- 
		local UpdataLv = {}
		--
		if  BuildingNum == 1 then
			Technology = {  505420 , 505421  } --【冶煉廠】可學之Buff技能號碼清單
			UpdataLv = { Z402_AreaBuff[RoomID][BuildingGuildID][Technology[1]] , Z402_AreaBuff[RoomID][BuildingGuildID][Technology[2]] }
		elseif  BuildingNum == 2 then
			Technology = {  505418 , 505419 } --【農田】可學之Buff技能號碼清單
			UpdataLv = { Z402_AreaBuff[RoomID][BuildingGuildID][Technology[1]] , Z402_AreaBuff[RoomID][BuildingGuildID][Technology[2]] }
		elseif  BuildingNum == 3 then
			Technology = {  505422 , 505423  } --【伐木廠】可學之Buff技能號碼清單
			UpdataLv = { Z402_AreaBuff[RoomID][BuildingGuildID][Technology[1]] , Z402_AreaBuff[RoomID][BuildingGuildID][Technology[2]] }
		end-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------/*變數↑

		local NowBuff_A_LV = 0	--該玩家目前習得之BUFF_A_技能等級
		local NowBuff_B_LV = 0	--該玩家目前習得之BUFF_B_技能等級

		local BuffType = 0
		local Count = BuffCount ( TargetID())---------------------------------------------------------****此處BUFF掛在建築物身上(全軍獲得型)

--Say( OwnerID() ,"Count="..Count )
		if Count ~= 0 then

			for j = 0 , Count do

				local CountMagic = table.getn(Technology)--總共可學的科技數量

				--*/
				if j+1 == 1 then
					CountMagic = 1
				elseif j+1 >= 2 and CountMagic == 2 then
					CountMagic = 2
				else
					CountMagic = 1
				end
				--*\此段判斷科技之陣列欄位

--Say( OwnerID() ,"CountMagic="..CountMagic )

				local BuffID = BuffInfo ( TargetID() , j , EM_BuffInfoType_BuffID )  -- 基本法術ID
				local BuffLv = BuffInfo( TargetID() , j , EM_BuffInfoType_Power )  --該建築第 j 個BUFF的等級

				if CountMagic == 1 then

					if (BuffID == Technology[1]) then

						NowBuff_A_LV = BuffLv+1 --該建築目前習得之BUFF_A_技能等級
		
					elseif (BuffID == Technology[2]) then

						NowBuff_B_LV = BuffLv+1 --該建築目前習得之BUFF_B_技能等級

					end

				elseif  CountMagic == 2 then

					if (BuffID == Technology[1]) then

						NowBuff_A_LV = BuffLv+1 --該建築目前習得之BUFF_A_技能等級
		
					elseif (BuffID == Technology[2]) then

						NowBuff_B_LV = BuffLv+1 --該建築目前習得之BUFF_B_技能等級

					end
			
				end

			end

		else
			NowBuff_A_LV = 0
			NowBuff_B_LV = 0
		end

		local Techa = Technology[1]
		local Techb = Technology[2]

		local PlayerID = OwnerID()
		local CheckTime = 1
		local RunTime = 1
		local DialogStatus = 0
		local TransferSelect = {}
		local CountMagic = table.getn(Technology)--總共可學的科技數量
		-- 2011.11.21  新增，簡化全域變數名稱 -- 
		local Title = {} 
			Title[1] = UpdataLv[1]+1
			Title[2] = UpdataLv[2]+1			
		--
--Say( OwnerID() ,"CountMagic="..CountMagic )
		if CheckBuff( OwnerID() , 501570) == false then
		--	if CountMagic == 1 and (BuildingLV >= NowBuff_A_LV+1) then
			if CountMagic == 1 and (BuildingLV >= UpdataLv[1]+1 ) then
--Say( OwnerID() ,"D="..1 )		
				TransferSelect[0] = { "[SC_YU_GUILDWAR_BUILD_01]".."["..Techa.."]".." [U_LV]"..(Title[1]) } --研發科技-科技名稱LV1
				TransferSelect[1] = { "[SO_EXIT]" }				-- 離開對話

				DialogCreate( OwnerID() , EM_LuaDialogType_Select , BStr_A )
				AddBuff(OwnerID() , 501570,0,-1);
				for i = 0, table.getn( TransferSelect ) do
					DialogSelectStr( OwnerID() , TransferSelect[i][1] )
				end
		--	elseif CountMagic == 1 and (BuildingLV < NowBuff_A_LV+1) then
			elseif CountMagic == 1 and (BuildingLV < Title[1]) then
--Say( OwnerID() ,"D="..2 )
				TransferSelect[0] = { "[SC_YU_GUILDWAR_BUILD_01]".."["..Techa.."]".."(".."[SC_YU_GUILDWAR_BUILD_02]"..")" } --研發科技-科技名稱(研發完畢)
				TransferSelect[1] = { "[SO_EXIT]" }

				DialogCreate( OwnerID() , EM_LuaDialogType_Select , BStr_A )
				AddBuff(OwnerID() , 501570,0,-1);
				for i = 0, table.getn( TransferSelect ) do
					DialogSelectStr( OwnerID() , TransferSelect[i][1] )
				end	
		--	elseif CountMagic == 2 and (BuildingLV >= NowBuff_A_LV+1) and (BuildingLV >= NowBuff_B_LV+1) then
			elseif CountMagic == 2 and (BuildingLV >= Title[1]) and (BuildingLV >= Title[2]) then
--Say( OwnerID() ,"D="..3 )
				TransferSelect[0] = { "[SC_YU_GUILDWAR_BUILD_01]".."["..Techa.."]".." [U_LV]"..(Title[1]) }	-- 研發技術： LV 
				TransferSelect[1] = { "[SC_YU_GUILDWAR_BUILD_01]".."["..Techb.."]".." [U_LV]"..(Title[2]) }
				TransferSelect[2] = { "[SO_EXIT]" }				-- 離開對話

				DialogCreate( OwnerID() , EM_LuaDialogType_Select , BStr_A )
				AddBuff(OwnerID() , 501570,0,-1);
				for i = 0, table.getn( TransferSelect ) do
					DialogSelectStr( OwnerID() , TransferSelect[i][1] )
				end
		--	elseif CountMagic == 2 and (BuildingLV < NowBuff_A_LV+1) and (BuildingLV >= NowBuff_B_LV+1) then
			elseif CountMagic == 2 and (BuildingLV < Title[1]) and (BuildingLV >= Title[2]) then
--Say( OwnerID() ,"D="..4 )

				TransferSelect[0] = { "[SC_YU_GUILDWAR_BUILD_01]".."["..Techa.."]".."(".."[SC_YU_GUILDWAR_BUILD_02]"..")" } --研發科技-科技名稱(研發完畢)
				TransferSelect[1] = { "[SC_YU_GUILDWAR_BUILD_01]".."["..Techb.."]".." [U_LV]"..(Title[2]) }
				TransferSelect[2] = { "[SO_EXIT]" }				-- 離開對話

				DialogCreate( OwnerID() , EM_LuaDialogType_Select , BStr_A )
				AddBuff(OwnerID() , 501570,0,-1);
				for i = 0, table.getn( TransferSelect ) do
					DialogSelectStr( OwnerID() , TransferSelect[i][1] )
				end
		--	elseif CountMagic == 2 and (BuildingLV >= NowBuff_A_LV+1) and (BuildingLV < NowBuff_B_LV+1) then
			elseif CountMagic == 2 and (BuildingLV >= Title[1]) and (BuildingLV < Title[2]) then
--Say( OwnerID() ,"D="..5 )
				TransferSelect[0] = { "[SC_YU_GUILDWAR_BUILD_01]".."["..Techa.."]".." [U_LV]"..Title[1] }
				TransferSelect[1] = { "[SC_YU_GUILDWAR_BUILD_01]".."["..Techb.."]".."(".."[SC_YU_GUILDWAR_BUILD_02]"..")" } --研發科技-科技名稱(研發完畢)
				TransferSelect[2] = { "[SO_EXIT]" }				-- 離開對話

				DialogCreate( OwnerID() , EM_LuaDialogType_Select , BStr_A )
				AddBuff(OwnerID() , 501570,0,-1);
				for i = 0, table.getn( TransferSelect ) do
					DialogSelectStr( OwnerID() , TransferSelect[i][1] )
				end
		--	elseif CountMagic == 2 and (BuildingLV < NowBuff_A_LV+1) and (BuildingLV < NowBuff_B_LV+1) then
			elseif CountMagic == 2 and (BuildingLV < Title[1]) and (BuildingLV < Title[2]) then
--Say( OwnerID() ,"D="..6 )

				TransferSelect[0] = { "[SC_YU_GUILDWAR_BUILD_01]".."["..Techa.."]".."(".."[SC_YU_GUILDWAR_BUILD_02]"..")" } --研發科技-科技名稱(研發完畢)
				TransferSelect[1] = { "[SC_YU_GUILDWAR_BUILD_01]".."["..Techb.."]".."(".."[SC_YU_GUILDWAR_BUILD_02]"..")" } --研發科技-科技名稱(研發完畢)
				TransferSelect[2] = { "[SO_EXIT]" }				-- 離開對話

				DialogCreate( OwnerID() , EM_LuaDialogType_Select , BStr_A )
				AddBuff(OwnerID() , 501570,0,-1);
				for i = 0, table.getn( TransferSelect ) do
					DialogSelectStr( OwnerID() , TransferSelect[i][1] )
				end
			end

			if( DialogSendOpen( OwnerID() ) == false ) then 
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 )	--資料送出有問題
				return 0
			end

			while true do
				RunTime = RunTime + 1
				if RunTime  > 300 then -- 防無窮迴圈，600 = 一分鐘
					DebugMsg( 0 , RoomID ,"Exit the MENU because IDLE a long Time !!")
					CancelBuff( OwnerID(), 501570 );--
					DialogClose( PlayerID )
					break
				end
				-- 2013.08.27 阿浩:加入距離檢測，過遠時自動關閉視窗
				local Distance = GetDistance( PlayerID , TargetID() )	-- 查詢玩家與塔之間的距離
				if Distance >= 50 then
					CancelBuff( PlayerID , 501570 )
					DialogClose( PlayerID )
					break
				end
				--
				--2013.07.19 阿浩：將檢查能量與戰績由迴圈外變更為迴圈內，修正玩家點擊時，在能量或戰績不足的情況下，依然能夠選擇建築，導致能量為負值的問題。
				local Now_E = GetGuildWarEnergy(OwnerID()) --目前能量
				local Now_R =  CountBodyItem( OwnerID() , 206685 ) --目前戰績				
				--

				DialogStatus = DialogGetResult( PlayerID )
			--	Say( PlayerID , DialogStatus )
				if DialogStatus == -2 then
					-- DO nothing
				elseif CountMagic == 1 and DialogStatus == 1 then
					CancelBuff( OwnerID(), 501570 );--
					DialogClose( PlayerID )
					break
				elseif CountMagic == 2 and DialogStatus == 2 then
					CancelBuff( OwnerID(), 501570 );--
					DialogClose( PlayerID )
					break
				elseif DialogStatus == -1 then
					CancelBuff( OwnerID(), 501570 );--
					DialogClose( PlayerID )
					break
			--	elseif CountMagic == 1 and (BuildingLV < NowBuff_A_LV+1) and DialogStatus == 0 then
				elseif CountMagic == 1 and (BuildingLV < Title[1]) and DialogStatus == 0 then
					ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_YU_GUILDWAR_BUILD_03]" , C_SYSTEM )  --學習等級達上限
					ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_YU_GUILDWAR_BUILD_03]" , C_SYSTEM )  --
					CancelBuff( OwnerID(), 501570 );--
					DialogClose( PlayerID )
					break
			--	elseif CountMagic == 2 and (BuildingLV < NowBuff_A_LV+1) and (BuildingLV >= NowBuff_B_LV+1) and DialogStatus == 0 then
				elseif CountMagic == 2 and (BuildingLV < Title[1]) and (BuildingLV >= Title[2]) and DialogStatus == 0 then
					ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_YU_GUILDWAR_BUILD_03]" , C_SYSTEM )  --
					ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_YU_GUILDWAR_BUILD_03]" , C_SYSTEM )  --
					CancelBuff( OwnerID(), 501570 );--
					DialogClose( PlayerID )
					break
			--	elseif CountMagic == 2 and (BuildingLV >= NowBuff_A_LV+1) and (BuildingLV < NowBuff_B_LV+1) and DialogStatus == 1 then
				elseif CountMagic == 2 and (BuildingLV >= Title[1]) and (BuildingLV < Title[2]) and DialogStatus == 1 then
					ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_YU_GUILDWAR_BUILD_03]" , C_SYSTEM )  --
					ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_YU_GUILDWAR_BUILD_03]" , C_SYSTEM )  --
					CancelBuff( OwnerID(), 501570 );--
					DialogClose( PlayerID )
					break
			--	elseif CountMagic == 2 and (BuildingLV < NowBuff_A_LV+1) and (BuildingLV < NowBuff_B_LV+1) and DialogStatus == 0 then
				elseif CountMagic == 2 and (BuildingLV < Title[1]) and (BuildingLV < Title[2]) and DialogStatus == 0 then
					ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_YU_GUILDWAR_BUILD_03]" , C_SYSTEM )  --
					ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_YU_GUILDWAR_BUILD_03]" , C_SYSTEM )  --
					CancelBuff( OwnerID(), 501570 );--
					DialogClose( PlayerID )
					break
			--	elseif CountMagic == 2 and (BuildingLV < NowBuff_A_LV+1) and (BuildingLV < NowBuff_B_LV+1) and DialogStatus == 1 then
				elseif CountMagic == 2 and (BuildingLV < Title[1]) and (BuildingLV < Title[2]) and DialogStatus == 1 then
					ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_YU_GUILDWAR_BUILD_03]" , C_SYSTEM )  --
					ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_YU_GUILDWAR_BUILD_03]" , C_SYSTEM )  --
					CancelBuff( OwnerID(), 501570 );--
					DialogClose( PlayerID )
					break
				elseif DialogStatus == 0 then
					if (Now_R >= Record) and (Now_E >= Energy) then
					--	WriteRoleValue( OwnerID()  , EM_RoleValue_Register+8 ,  NowBuff_A_LV  ) --記錄所要研發的技術等級
						WriteRoleValue( OwnerID()  , EM_RoleValue_Register+7 ,  BuildingNum  ) --2011.11.24 記錄所要研發的建築物	
						WriteRoleValue( OwnerID()  , EM_RoleValue_Register+8 ,  Title[1]  ) --記錄所要研發的技術等級
						WriteRoleValue( OwnerID()  , EM_RoleValue_Register+9 ,  Technology[1]  ) --記錄所要研發的技術
						Beginplot( TargetID() ,"Yuyu_GuildWarBuliding_2_03", 0 )
						CancelBuff( OwnerID(), 501570 );--
						DialogClose( PlayerID )
						break

					elseif (Now_R < Record) and (Now_E < Energy) then
						ScriptMessage( OwnerID(),OwnerID(),1,"[SC_YU_GUILDWAR_BUILD_27]",0)	--研發所需之能量、戰績不足
						ScriptMessage( OwnerID(),OwnerID(),0,"[SC_YU_GUILDWAR_BUILD_27]",0)	--研發所需之能量、戰績不足
						CancelBuff( OwnerID(), 501570 );--
						DialogClose( PlayerID )
						break

					elseif (Now_R >= Record) and (Now_E < Energy) then
						ScriptMessage( OwnerID(),OwnerID(),1,"[SC_YU_GUILDWAR_BUILD_31]",0)	--研發所需之能量不足
						ScriptMessage( OwnerID(),OwnerID(),0,"[SC_YU_GUILDWAR_BUILD_31]",0)	--
						CancelBuff( OwnerID(), 501570 );--
						DialogClose( PlayerID )
						break

					elseif (Now_R < Record) and (Now_E >= Energy) then
						ScriptMessage( OwnerID(),OwnerID(),1,"[SC_YU_GUILDWAR_BUILD_32]",0)	--研發所需之戰績不足
						ScriptMessage( OwnerID(),OwnerID(),0,"[SC_YU_GUILDWAR_BUILD_32]",0)	--研發所需之戰績不足
						CancelBuff( OwnerID(), 501570 );--
						DialogClose( PlayerID )
						break
					end

				elseif CountMagic == 2 and DialogStatus == 1 then
					if (Now_R >= Record) and (Now_E >= Energy) then
					--	WriteRoleValue( OwnerID()  , EM_RoleValue_Register+8 ,  NowBuff_B_LV  ) --記錄所要研發的技術等級
						WriteRoleValue( OwnerID()  , EM_RoleValue_Register+7 ,  BuildingNum  ) --2011.11.24 記錄所要研發的建築物	
						WriteRoleValue( OwnerID()  , EM_RoleValue_Register+8 ,  Title[2]  ) --記錄所要研發的技術等級
						WriteRoleValue( OwnerID()  , EM_RoleValue_Register+9 ,  Technology[2]  ) --記錄所要研發的技術
						Beginplot( TargetID() ,"Yuyu_GuildWarBuliding_2_03", 0 )
						CancelBuff( OwnerID(), 501570 );--
						DialogClose( PlayerID )
						break

					elseif (Now_R < Record) and (Now_E < Energy) then
						ScriptMessage( OwnerID(),OwnerID(),1,"[SC_YU_GUILDWAR_BUILD_27]",0)	--研發所需之能量、戰績不足
						ScriptMessage( OwnerID(),OwnerID(),0,"[SC_YU_GUILDWAR_BUILD_27]",0)	--研發所需之能量、戰績不足
						CancelBuff( OwnerID(), 501570 );--
						DialogClose( PlayerID )
						break

					elseif (Now_R >= Record) and (Now_E < Energy) then
						ScriptMessage( OwnerID(),OwnerID(),1,"[SC_YU_GUILDWAR_BUILD_31]",0)	--研發所需之能量不足
						ScriptMessage( OwnerID(),OwnerID(),0,"[SC_YU_GUILDWAR_BUILD_31]",0)	--
						CancelBuff( OwnerID(), 501570 );--
						DialogClose( PlayerID )
						break

					elseif (Now_R < Record) and (Now_E >= Energy) then
						ScriptMessage( OwnerID(),OwnerID(),1,"[SC_YU_GUILDWAR_BUILD_32]",0)	--研發所需之戰績不足
						ScriptMessage( OwnerID(),OwnerID(),0,"[SC_YU_GUILDWAR_BUILD_32]",0)	--研發所需之戰績不足
						CancelBuff( OwnerID(), 501570 );--
						DialogClose( PlayerID )
						break
					end
				end
				Sleep(1)
			end
		
		else--假如沒有buff 501570
			ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );--視窗已經打開了
		end

	end --要判斷是否為公會成員時解除此end

end

function Yuyu_GuildWarBuliding_2_03() -- 公會戰時，【冶煉廠、農田、伐木廠】
--	Say( OwnerID() ,"OwnerID") --建築物
--	Say( TargetID() ,"TargetID") -- 玩家
	Beginplot( TargetID() ,"Yuyu_GuildWarBuliding_2_04", 0 )

end

function Yuyu_GuildWarBuliding_2_04() -- 公會戰時，【冶煉廠、農田、伐木廠】

--	Say( OwnerID() ,"OwnerID") --玩家
--	Say( TargetID() ,"TargetID") -- 建築物
	local Player = OwnerID()
	local Energy = 500--能量
	local Record = 500--戰績

---*---以下判斷玩家是否有學習折扣技術
	local SetA = -1
	local SetB = -1			
	local Count = BuffCount ( OwnerID())
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID ) -- 基本法術ID
		if BuffID == 505313 then--績效學 
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )--該建築第 j 個BUFF的等級

			SetA = BuffLv

		elseif BuffID == 505312 then--節能學
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )

			SetB = BuffLv

		end
	end

--	Say(  TargetID() ,"SetA  BuffLv ="..SetA )
--	Say(  TargetID() ,"SetB  BuffLv ="..SetB )

	if SetA>-1 then

		Record = Record*(1-((SetA+1)*0.05))
--		Say(  TargetID() ,"Record ="..Record )
		Record = math.ceil(Record)--小數點以下均捨去
--		Say(  TargetID() ,"math.ceil(Record) ="..Record )
	end
	if SetB>-1 then

		Energy = Energy*(1-((SetB+1)*0.05))
--		Say(  TargetID() ,"Energy ="..Energy )
		Energy = math.ceil(Energy)--小數點以下均捨去
--		Say(  TargetID() ,"math.ceil(Energy) ="..Energy )
	end

---*---↑
	local str = "[SC_YU_GUILDWAR_BUILD_28][$SETVAR1="..Energy.."][$SETVAR2="..Record.."]"
	local back = "[SC_YU_GUILDWAR_BUILD_29][$SETVAR1="..Energy.."][$SETVAR2="..Record.."]"
--	ScriptMessage( OwnerID(),OwnerID(),1,str,C_SYSTEM)	--研發開始，預先提存所需資源：能量50、戰績50
--	ScriptMessage( OwnerID(),OwnerID(),0,str,C_SYSTEM)	
--	AddGuildWarEnergy( OwnerID() , -Energy ) --扣除能量50
--	DelBodyItem( OwnerID() , 206685 , Record ) --扣除戰績50
	local TechLV = ReadRoleValue( OwnerID()  ,EM_RoleValue_Register+8 ) --所要研發的技術等級
	local Technology = ReadRoleValue( OwnerID()  ,EM_RoleValue_Register+9 ) --所要研發的技術
	-- 2013.08.27 阿浩:研發時消耗的能量與戰績，由預先扣除調整為建造完成時扣除。
	ScriptMessage( Player , Player , 1 , "[SC_GUILDWAR_DEVELOPING_STARTED]" , C_SYSTEM )	--研發開始
	ScriptMessage( Player , Player , 0 , "[SC_GUILDWAR_DEVELOPING_STARTED]" , C_SYSTEM )
	--
	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )
--	Say(OwnerID() , "ZoneID = "..ZoneID )

	local truecast = 60			--/*科技研發所需時間
	local BookMagicID = 505308		--/*持書motion

	if (ReadRoleValue( OwnerID() , EM_RoleValue_Register) ~= 0) or (ReadRoleValue( TargetID() , EM_RoleValue_Register) == 1) then
		ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_AUCTION_WAIT_NEXT]",0)	--忙碌中，請稍候再試。
		return
	end
	WriteRoleValue( OwnerID() , EM_RoleValue_Register, TargetID() ) --研發鎖定中
	WriteRoleValue( TargetID() , EM_RoleValue_Register, 1 ) --研發鎖定中
	WriteRoleValue( OwnerID() , EM_RoleValue_PID, 1 ) --研發鎖定中
	WriteRoleValue( TargetID() , EM_RoleValue_PID, 1 ) --研發鎖定中

	if BeginCastBar( OwnerID(), "["..Technology.."]".." [U_LV]"..TechLV , truecast , ruFUSION_ACTORSTATE_READING_BEGIN , ruFUSION_ACTORSTATE_READING_END , 0 ) == 1 then	--/*開始施法
--	if BeginCastBar( OwnerID(), "["..Technology.."]".." [U_LV]"..TechLV+1 , truecast , ruFUSION_ACTORSTATE_READING_BEGIN , ruFUSION_ACTORSTATE_READING_END , 0 ) == 1 then	--/*開始施法

	AddBuff( OwnerID() , BookMagicID , 0 , -1 )		--使用書

		while true do
			sleep(2)
			local CastBarStatus = CheckCastBar( OwnerID() );
			-- 2013.08.27 阿浩:研發時消耗的能量與戰績，由預先扣除調整為建造完成時扣除。
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
			elseif (CheckID( TargetID() ) == false) or Now_E < Energy or Now_R < Record then
				result = "DAME"
				EndCastBar( OwnerID() , CastBarStatus )
				break;
			else
				AddBuff( OwnerID() , BookMagicID , 0 , -1 )		--使用書
			end
		end

		if ( result == "OKOK" ) then
			if CheckID( TargetID() ) == true then
				-- 2013.08.27 阿浩:研發時消耗的能量與戰績，由預先扣除調整為建造完成時扣除。
				AddGuildWarEnergy( Player , -Energy )	--扣除能量
				DelBodyItem( Player , 206685 , Record )	--扣除戰績
				ScriptMessage( Player , Player , 1 , "[SC_GUILDWAR_DEVELOPING_COMPLETED][$SETVAR1="..Energy.."][$SETVAR2="..Record.."]" , C_SYSTEM )	--研發完成：消耗能量[$VAR1]、戰績[$VAR2]
				ScriptMessage( Player , Player , 0 , "[SC_GUILDWAR_DEVELOPING_COMPLETED][$SETVAR1="..Energy.."][$SETVAR2="..Record.."]" , C_SYSTEM )
				--
				CastSpell( OwnerID(), OwnerID() ,491010) -- 研發完畢共用特效	
				CancelBuff( OwnerID() , BookMagicID )
	--			CancelBuff( OwnerID() , Technology )
	--			CallPlot( OwnerID() , "Lua_GUILDWAR_ShareBuff_Tech" , Technology , 0)--本次研發之科技，可疊加無須移除前一項
				Lua_GUILDWAR_ShareBuff(Technology , -1 , 1)
				local BUOrgID = ReadRoleValue( TargetID() ,EM_RoleValue_OrgID ) --目前建築物之OrgID
				local BU = LuaFunc_SearchRoomNPCbyOrgID( TargetID() , BUOrgID , 1 )--搜尋全區NPC
				local PlayerGuildID = GetRoleCampID( OwnerID() )--玩家的陣營
				-- 2011.11.24 建築物上 Buff
				local BuildingNum = ReadRoleValue( OwnerID() , EM_RoleValue_Register+7 )
				local BuildGuildID
				local BuildingOrgID = {}
				local ALLBUOrgID
					if BuildingNum == 1 then
						BuildingOrgID = {112703,112704,112705,112706,112707,112708,112709,112710,112711,112712} --【冶煉廠】 10階級之OrgID
					elseif BuildingNum == 2 then
						BuildingOrgID = {112810,112811,112812,112813,112814,112815,112816,112817,112818,112819} --【農田】10階級之OrgID
					elseif BuildingNum == 3 then
						BuildingOrgID = {113141,113142,113143,113144,113145,113146,113147,113148,113149,113150} --【伐木廠】10階級之OrgID
					end
				local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
				local NPCCount = SetSearchAllNPC(RoomID) -- 搜索區域內的所有NPC ，回傳值為其數量
				local NPCObj
				local NPC = { ObjID }
				local Max = 0
				local FeedBack
		
				if NPCCount ~= 0 then
					for i = 1 , NPCCount , 1 do
						FeedBack = GetSearchResult() -- 回傳執行 SetSearchAllNPC 後所搜尋到的所有物件
						NPCObj=Role:New(FeedBack)
						if NPCObj:IsNPC() == true then
							BuildGuildID = GetRoleCampID(FeedBack)--建築物的陣營
							if PlayerGuildID == BuildGuildID then
								ALLBUOrgID = ReadRoleValue( FeedBack , EM_RoleValue_OrgID )
								for j = 1 , table.getn(BuildingOrgID) , 1 do
									if ALLBUOrgID == BuildingOrgID[j] then
									--	Say( FeedBack , "["..Technology.."]"..TechLV )
									--	Say( OwnerID() , "ObjID = "..ALLBUOrgID.."Reg+7 = "..BuildingNum )
										if j >= TechLV then
											CancelBuff( FeedBack , Technology )
											AddBuff( FeedBack , Technology , TechLV-1 , -1 )	--本次研發之科技
											Max = Max + 1
											break
										end
									end
								end
							end
						end
					end
				--	Say( OwnerID() , "Max = "..Max )
				end
				
				--GuildItem 作為範圍標準的角色ID
				--NPCOrgID 要搜尋的NPC樣板ID
				--Type 填 0 只找一個，沒找到回傳 -1
				--     1 找全部範圍內的矩陣
				--     可不填， 預設為0
				--	for i=0,table.getn(BU)-1 do	
				--		local BuildGuildID = GetRoleCampID(BU[i])--建築物的陣營
				--		if PlayerGuildID == BuildGuildID then
				--			AddBuff( BU[i] , Technology , 0 , -1)	--本次研發之科技
				--		end
				--	end


				if PlayerGuildID == 7 then --藍色陣營
					local Playername = "|cff00ffff"..GetName( OwnerID() ).."|r"
					local str = "[SC_YU_GUILDWAR_BUILD_06][$SETVAR1="..Playername.."]"

					ScriptMessage( OwnerID(),-1,2,Str.."|cff00ffff".."["..Technology.."]".."[U_LV]"..(TechLV).."|r".."[SC_YU_GUILDWAR_BUILD_07]",C_SYSTEM)
					ScriptMessage( OwnerID(),-1,0,Str.."|cff00ffff".."["..Technology.."]".."[U_LV]"..(TechLV).."|r".."[SC_YU_GUILDWAR_BUILD_07]",C_SYSTEM)

				elseif PlayerGuildID == 8 then --紅色陣營
					local Playername = "|cffff3232"..GetName( OwnerID() ).."|r"
					local str = "[SC_YU_GUILDWAR_BUILD_06][$SETVAR1="..Playername.."]"

					ScriptMessage( OwnerID(),-1,2,Str.."|cffff3232".."["..Technology.."]".."[U_LV]"..(TechLV).."|r".."[SC_YU_GUILDWAR_BUILD_07]",C_SYSTEM)
					ScriptMessage( OwnerID(),-1,0,Str.."|cffff3232".."["..Technology.."]".."[U_LV]"..(TechLV).."|r".."[SC_YU_GUILDWAR_BUILD_07]",C_SYSTEM)

				end

				WriteRoleValue( TargetID() , EM_RoleValue_Register, 0 ) --解除鎖定可再次研發
				WriteRoleValue( TargetID() , EM_RoleValue_PID, 0 ) --解除鎖定可再次研發
			end

			WriteRoleValue( OwnerID() , EM_RoleValue_Register, 0 ) --解除鎖定可再次研發
			WriteRoleValue( OwnerID() , EM_RoleValue_PID, 0 ) --解除鎖定可再次研發
			WriteRoleValue( OwnerID()  , EM_RoleValue_Register+7 , 0  ) --2011.11.24 清空所要研發的建築物
			WriteRoleValue( OwnerID()  , EM_RoleValue_Register+8 , 0  ) --清空要研發的技術等級
			WriteRoleValue( OwnerID()  , EM_RoleValue_Register+9 , 0  ) --清空要研發的技術

		elseif ( result == "DAME" ) then	
			WriteRoleValue( OwnerID() , EM_RoleValue_Register, 0 ) --解除鎖定可再次研發
			WriteRoleValue( TargetID() , EM_RoleValue_Register, 0 ) --解除鎖定可再次研發
			WriteRoleValue( OwnerID() , EM_RoleValue_PID, 0 ) --解除鎖定可再次研發
			WriteRoleValue( TargetID() , EM_RoleValue_PID, 0 ) --解除鎖定可再次研發
			WriteRoleValue( OwnerID()  , EM_RoleValue_Register+7 , 0  ) --2011.11.24 清空所要研發的建築物
			WriteRoleValue( OwnerID()  , EM_RoleValue_Register+8 , 0  ) --清空要研發的技術等級
			WriteRoleValue( OwnerID()  , EM_RoleValue_Register+9 , 0  ) --清空要研發的技術
			CancelBuff( OwnerID() , BookMagicID )
			-- 2013.08.27 阿浩:研發時消耗的能量與戰績，由預先扣除調整為建造完成時扣除。
			ScriptMessage( Player , Player , 1 , "[SC_GUILDWAR_DEVELOPING_FAILED]" , C_RED )	--研發失敗
			ScriptMessage( Player , Player , 0 , "[SC_GUILDWAR_DEVELOPING_FAILED]" , C_RED )
			--
		--	ScriptMessage( OwnerID(),OwnerID(),1,back,C_SYSTEM)	--研發中斷，歸還預存資源：能量250、戰績500
		--	ScriptMessage( OwnerID(),OwnerID(),0,back,C_SYSTEM)
		--	GiveBodyItem( OwnerID() , 206685 , Record ) --返還戰績50
		--	AddGuildWarEnergy( OwnerID() , Energy ) --返還能量50
		end

	end
end

function Lua_GuildWar_Recall_BuildLv( Select , EnterZone )	-- 2011.11.22 新增測試指令，回報冶煉廠、農田、伐木場研究法術升級狀態
								-- 2011.11.23 新增進入公會城戰時，直接給予玩家，冶煉廠、農田、伐木場當前科技升級的 Buff。
	local Player = OwnerID()
	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local BuildingGuildID = ReadRoleValue( Player , EM_RoleValue_GuildID )
	local Buff = { 505420 , 505421 , 505418 , 505419 , 505422 , 505423 }
	
	if Select == nil then
		Select = 0
	end

	if Z402_AreaBuff[RoomID][BuildingGuildID] ~= nil then	-- 冶煉廠、農田、伐木場
		if Select ~= 0 then
			if Z402_AreaBuff[RoomID][BuildingGuildID][Select] ~= nil then
				Say( Player , "["..Select.."]".." Lv = "..Z402_AreaBuff[RoomID][BuildingGuildID][Select] )
			end
		else
	    		for i = 1 , table.getn(Buff) , 1 do
	    			if Z402_AreaBuff[RoomID][BuildingGuildID][Buff[i]] ~= nil then
	    				Say( Player , "["..Buff[i].."]".." Lv = "..Z402_AreaBuff[RoomID][BuildingGuildID][Buff[i]] )
	    			end
	    			if EnterZone ~= nil and Z402_AreaBuff[RoomID][BuildingGuildID][Buff[i]] > 0 then
					AddBuff( Player , Buff[i] , Z402_AreaBuff[RoomID][BuildingGuildID][Buff[i]]-1 , -1 )
				end
	    		end
	    	end
	else
		DebugMsg( Player , RoomID , "Nothing Happens" )
	--	Say( Player , "Nothing Happens" )
	end
end

function Lua_GuildWar_Get_Energy(num)	-- 2011.11.22 新增測試指令 取得能量

	local Player = OwnerID()
	if num <= 10000 then
		AddGuildWarEnergy( Player , Num )
	end
end

function Lua_GuildWar_Get_Merit(num)	-- 2011.11.22 新增測試指令 取得公會戰績

	local Player = OwnerID()
	local Maximum = 1000
	local Count = math.ceil( num / Maximum )	-- 無條件進位
	local Integer = math.floor( num / Maximum )	-- 整數
	local Remainder = num % Maximum		-- 餘數

	if num <= 10000 then
		if Count > 1 then
			for i = 1 , Count , 1 do
				if i == Count and Remainder ~= 0 then
					GiveBodyItem( Player , 206685 , Remainder )
				else
					GiveBodyItem( Player , 206685 , Maximum )
				end
			end
		else
			GiveBodyItem( Player , 206685 , num )
		end
	end
end

function Lua_GuildWar_Ranger( dis )	--  2011.11.22 新增測試指令 距離超過即關閉對話視窗

	local Player = OwnerID()
	local BuffID = 621751
	local BuffIDPos , NpcGuid
	while true do
		BuffIDPos = Lua_BuffPosSearch( Player , BuffID )			-- 取 Buff 的位置
		NpcGuid = BuffInfo( Player , BuffIDPos , EM_BuffInfoType_OwnerID )	-- 取 Buff 施展者
	--	Say( NpcGuid , "Pos = "..BuffIDPos.." Npc = "..NpcGuid.." Dis = "..dis )
		if GetDistance( Player , NpcGuid )  >= dis then
			CancelBuff_NoEvent( Player , 501570 )
			DialogClose( Player )
			WriteRoleValue( NpcGuid , EM_RoleValue_Register+2 , 1 ) --解除鎖定可再次研發
		--	WriteRoleValue( NpcGuid , EM_RoleValue_Register , 0 ) --解除鎖定可再次研發
		--	WriteRoleValue( NpcGuid , EM_RoleValue_PID , 0 ) --解除鎖定可再次研發
			break
		end
		sleep(1)
	end
	CancelBuff_NoEvent( Player , BuffID )
end