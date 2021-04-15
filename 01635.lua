function Yuyu_GuildWarBuliding_1_01() -- 公會戰時，【學院、校場、圖書館、馬廄】功能

	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )

	if (ZoneID == 402) or (ZoneID == 47)  then

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
		WriteRoleValue( OwnerID()  , EM_RoleValue_Register+1 ,  38  )--紀錄為大型建築物---***
		SetPlot(  TargetID(), "dead","Lua_GUILDWAR_BuildDScript_2",0 )     --圖書館死亡劇情
		SetCursorType( OwnerID() , eCursor_Interact ); --游標變成 齒輪
		SetPlot( OwnerID() , "touch" , "Yuyu_GuildWarBuliding_1_02" , 125 )	--公會城戰時
	end
end

function Yuyu_GuildWarBuliding_1_02() -- 公會戰時，【學院、校場、圖書館、馬廄】

--	Say( TargetID() ,"TargetID"..3 ) --建築物
--	Say( OwnerID() ,"OwnerID"..3 ) --玩家

	if ReadRoleValue( OwnerID() , EM_RoleValue_PID) == 1 then
		ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_AUCTION_WAIT_NEXT]",0)	--忙碌中，請稍候再試。
		return
	end

	local VOC = ReadRoleValue( OwnerID() , EM_RoleValue_VOC )--職業
	local RoomID = ReadRoleValue( TargetID(), EM_RoleValue_RoomID )
	local PlayerGuildID = ReadRoleValue( OwnerID() ,   EM_RoleValue_GuildID ) 
	local BuildingGuildID = ReadRoleValue( TargetID() ,   EM_RoleValue_GuildID ) 
	local PassCard =  CountBodyItem( OwnerID() , 206769 ) --是否具有通行證 = GM測試

	local Record = 50 --研究所需戰績
	local Energy = 50 --研究所需能量

--	local Now_E = GetGuildWarEnergy(OwnerID()) --目前能量
--	local Now_R =  CountBodyItem( OwnerID() , 206685 ) --目前戰績

--	Say(  OwnerID() ,"Now_R ="..Now_R )
--	Say(  OwnerID() ,"Now_E ="..Now_E )

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

		local BuildingOrgID_1 = {112916,112917,112918,112919,112920,112921,112922,112923,112924,112925} --【學院】 10階級之OrgID---------------------------------------------/*變數↓
		local BuildingOrgID_2 = {112896,112897,112898,112899,112900,112901,112902,112903,112904,112905} --【校場】10階級之OrgID
		local BuildingOrgID_3 = {112688,112689,112690,112691,112692,112693,112694,112695,112696,112697} --【圖書館】10階級之OrgID
		local BuildingOrgID_4 = {112467,112468,112469,112470,112471,112472,112473,112474,112475,112476} --【馬廄】10階級之OrgID
		local BuildingOrgID = { BuildingOrgID_1 , BuildingOrgID_2 , BuildingOrgID_3, BuildingOrgID_4  }--------------------------------------------------------------------/*變數↑
		local BuildingNum = 0


		local BuildStr = {
				  "[SC_YU_GUILDWAR_W1_00][$SETVAR1="..Energy.."][$SETVAR2="..Record.."]",--學院

			                  "[SC_YU_GUILDWAR_W2_00][$SETVAR1="..Energy.."][$SETVAR2="..Record.."]",--校場

			                  "[SC_YU_GUILDWAR_W3_00][$SETVAR1="..Energy.."][$SETVAR2="..Record.."]",--圖書館

			                  "[SC_YU_GUILDWAR_W4_02][$SETVAR1="..Energy.."][$SETVAR2="..Record.."]" --馬廄
											  }--科技說明文

		local BStr_A = 0	

		local TargetOrgID = ReadRoleValue( TargetID() ,EM_RoleValue_OrgID ) --目前建築物之OrgID

--Say( OwnerID() ,"TargetOrgID="..TargetOrgID )

		local BuildingLV = 0 --建築物等級

		--*/

		for i= 1 , 10 do

			if TargetOrgID == BuildingOrgID[1][i] then ------------------------------------------------------------------------------------------------------------------------------------------/*變數↓
				BuildingLV = i  --建築物等級
				BuildingNum = 1
				BStr_A = BuildStr[1]
				SetPlot(  TargetID(), "dead","Lua_GUILDWAR_BuildDScript_2",0 )     --學院死亡劇情

			elseif TargetOrgID == BuildingOrgID[2][i] then 
				BuildingLV = i  --建築物等級
				BuildingNum = 2
				BStr_A = BuildStr[2]
				SetPlot(  TargetID(), "dead","Lua_GUILDWAR_BuildDScript_1",0 )     --校場死亡劇情

			elseif TargetOrgID == BuildingOrgID[3][i] then 
				BuildingLV = i  --建築物等級
				BuildingNum = 3
				BStr_A = BuildStr[3]
				SetPlot(  TargetID(), "dead","Lua_GUILDWAR_BuildDScript_2",0 )     --圖書館死亡劇情

			elseif TargetOrgID == BuildingOrgID[4][i] then 
				BuildingLV = i  --建築物等級
				BuildingNum = 4
				BStr_A = BuildStr[4]
				SetPlot(  TargetID(), "dead","Lua_GUILDWAR_BuildDScript_1",0 )     --馬廄死亡劇情
			end
		end
--Say( OwnerID() ,"BuildingLV="..BuildingLV )

		--*\此段判斷建築物等級

		local Technology = {  } --該建築物可學之Buff技能號碼清單

		if  BuildingNum == 1 then
			Technology = {  505309 , 505310  } --【學院】可學之Buff技能號碼清單

		elseif  BuildingNum == 2 then
			Technology = {  505317 , 505318  } --【校場】可學之Buff技能號碼清單

		elseif  BuildingNum == 3 then
			Technology = {  505312 , 505313  } --【圖書館】可學之Buff技能號碼清單

		elseif  BuildingNum == 4 then
			Technology = {  505315 } --【馬廄】可學之Buff技能號碼清單

		end-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------/*變數↑


		local NowBuff_A_LV = 0 --該玩家目前習得之BUFF_A_技能等級
		local NowBuff_B_LV = 0	--該玩家目前習得之BUFF_B_技能等級

		--*/

--Say( OwnerID() ,"NowBuff_A_LV_1="..NowBuff_A_LV )
--Say( OwnerID() ,"NowBuff_B_LV_1="..NowBuff_B_LV )

		local BuffType = 0
		local Count = BuffCount ( OwnerID())

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

				local BuffID = BuffInfo ( OwnerID() , j , EM_BuffInfoType_BuffID )  -- 基本法術ID
				local BuffLv = BuffInfo( OwnerID() , j , EM_BuffInfoType_Power )  --該玩家第 j 個BUFF的等級

--Say( OwnerID() ,"j="..j )
--Say( OwnerID() ,"BuffID="..BuffID )
--Say( OwnerID() ,"Technology[CountMagic]="..Technology[1] )
--Say( OwnerID() ,"Technology[CountMagic]="..Technology[2] )
--Say( OwnerID() ,"BuffLv="..BuffLv )


				if CountMagic == 1 then

					if (BuffID == Technology[1]) then

						NowBuff_A_LV = BuffLv+1 --該玩家目前習得之BUFF_A_技能等級
		
					elseif (BuffID == Technology[2]) then

						NowBuff_B_LV = BuffLv+1 --該玩家目前習得之BUFF_B_技能等級

					end

				elseif  CountMagic == 2 then

					if (BuffID == Technology[1]) then

						NowBuff_A_LV = BuffLv+1 --該玩家目前習得之BUFF_A_技能等級
		
					elseif (BuffID == Technology[2]) then

						NowBuff_B_LV = BuffLv+1 --該玩家目前習得之BUFF_B_技能等級

					end
			
				end

			end

		else

			NowBuff_A_LV = 0
			NowBuff_B_LV = 0


		end
		--*\此段判斷玩家目前身上的科技等級

		--************************************************************ 備註
		--BuildingLV --建築物等級
		--NowBuff_A_LV = BuffLv--該玩家目前習得之BUFF_A_技能等級
		--NowBuff_B_LV = BuffLv--該玩家目前習得之BUFF_B_技能等級
		--Technology[1]--可研發科技1
		--Technology[2]--可研發科技2
		--************************************************************	

		local Techa = Technology[1]
		local Techb = Technology[2]
--		BuildingLV = BuildingLV-1

--Say( OwnerID() ,"BuildingLV="..BuildingLV )
--Say( OwnerID() ,"NowBuff_A_LV_2="..NowBuff_A_LV )
--Say( OwnerID() ,"NowBuff_B_LV_2="..NowBuff_B_LV )
--Say( OwnerID() ,"["..Techa.."]".."="..Techa )
--Say( OwnerID() ,"["..Techb.."]".."="..Techb )

		local PlayerID = OwnerID()
		local CheckTime = 1
		local RunTime = 1
		local DialogStatus = 0
		local TransferSelect = {}
		local CountMagic = table.getn(Technology)--總共可學的科技數量

--Say( OwnerID() ,"CountMagic="..CountMagic )
		if CheckBuff( OwnerID() , 501570) == false then
			if CountMagic == 1 and (BuildingLV >= NowBuff_A_LV+1) then

				--Say( OwnerID() ,"D="..1 )		

				TransferSelect[0] = { "[SC_YU_GUILDWAR_BUILD_01]".."["..Techa.."]".." [U_LV]"..(NowBuff_A_LV+1) } --研發科技-科技名稱LV1
				TransferSelect[1] = { "[SO_EXIT]" }				-- 離開對話

				DialogCreate( OwnerID() , EM_LuaDialogType_Select , BStr_A )
				AddBuff(OwnerID() , 501570,0,-1);
				for i = 0, table.getn( TransferSelect ) do
					DialogSelectStr( OwnerID() , TransferSelect[i][1] )
				end

			elseif CountMagic == 1 and (BuildingLV < NowBuff_A_LV+1) then
				--Say( OwnerID() ,"D="..2 )

				TransferSelect[0] = { "[SC_YU_GUILDWAR_BUILD_01]".."["..Techa.."]".."(".."[SC_YU_GUILDWAR_BUILD_02]"..")" } --研發科技-科技名稱(研發完畢)
				TransferSelect[1] = { "[SO_EXIT]" }

				DialogCreate( OwnerID() , EM_LuaDialogType_Select , BStr_A )
				AddBuff(OwnerID() , 501570,0,-1);
				for i = 0, table.getn( TransferSelect ) do
					DialogSelectStr( OwnerID() , TransferSelect[i][1] )
				end	

			elseif CountMagic == 2 and (BuildingLV >= NowBuff_A_LV+1) and (BuildingLV >= NowBuff_B_LV+1) then
				--Say( OwnerID() ,"D="..3 )

				TransferSelect[0] = { "[SC_YU_GUILDWAR_BUILD_01]".."["..Techa.."]".." [U_LV]"..(NowBuff_A_LV+1) }
				TransferSelect[1] = { "[SC_YU_GUILDWAR_BUILD_01]".."["..Techb.."]".." [U_LV]"..(NowBuff_B_LV+1) }
				TransferSelect[2] = { "[SO_EXIT]" }				-- 離開對話

				DialogCreate( OwnerID() , EM_LuaDialogType_Select , BStr_A )
				AddBuff(OwnerID() , 501570,0,-1);
				for i = 0, table.getn( TransferSelect ) do
					DialogSelectStr( OwnerID() , TransferSelect[i][1] )
				end

			elseif CountMagic == 2 and (BuildingLV < NowBuff_A_LV+1) and (BuildingLV >= NowBuff_B_LV+1) then
				--Say( OwnerID() ,"D="..4 )

				TransferSelect[0] = { "[SC_YU_GUILDWAR_BUILD_01]".."["..Techa.."]".."(".."[SC_YU_GUILDWAR_BUILD_02]"..")" } --研發科技-科技名稱(研發完畢)
				TransferSelect[1] = { "[SC_YU_GUILDWAR_BUILD_01]".."["..Techb.."]".." [U_LV]"..(NowBuff_B_LV+1) }
				TransferSelect[2] = { "[SO_EXIT]" }				-- 離開對話

				DialogCreate( OwnerID() , EM_LuaDialogType_Select , BStr_A )
				AddBuff(OwnerID() , 501570,0,-1);
				for i = 0, table.getn( TransferSelect ) do
					DialogSelectStr( OwnerID() , TransferSelect[i][1] )
				end

			elseif CountMagic == 2 and (BuildingLV >= NowBuff_A_LV+1) and (BuildingLV < NowBuff_B_LV+1) then
				--Say( OwnerID() ,"D="..5 )
				TransferSelect[0] = { "[SC_YU_GUILDWAR_BUILD_01]".."["..Techa.."]".." [U_LV]"..(NowBuff_A_LV+1) }
				TransferSelect[1] = { "[SC_YU_GUILDWAR_BUILD_01]".."["..Techb.."]".."(".."[SC_YU_GUILDWAR_BUILD_02]"..")" } --研發科技-科技名稱(研發完畢)
				TransferSelect[2] = { "[SO_EXIT]" }				-- 離開對話

				DialogCreate( OwnerID() , EM_LuaDialogType_Select , BStr_A )
				AddBuff(OwnerID() , 501570,0,-1);
				for i = 0, table.getn( TransferSelect ) do
					DialogSelectStr( OwnerID() , TransferSelect[i][1] )
				end

			elseif CountMagic == 2 and (BuildingLV < NowBuff_A_LV+1) and (BuildingLV < NowBuff_B_LV+1) then
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
				CancelBuff( OwnerID(), 501570 );--
				return 0
			end

			while true do
				Sleep(2)
				RunTime = RunTime + 1
				if RunTime  > 100 then -- 防無窮迴圈，600 = 一分鐘
					DebugMsg( 0, RoomID ,"Exit the MENU because IDLE a long Time !!")
					CancelBuff( OwnerID(), 501570 );--
					DialogClose( PlayerID )
					break
				end
				-- 2013.08.27 阿浩:加入距離檢測，過遠時自動關閉視窗
				local Distance = GetDistance( PlayerID , TargetID() )	-- 查詢玩家與塔之間的距離
				if Distance >= 125 then
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
				--Say( PlayerID , DialogStatus )

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

				elseif CountMagic == 1 and (BuildingLV < NowBuff_A_LV+1) and DialogStatus == 0 then
					ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_YU_GUILDWAR_BUILD_03]" , C_SYSTEM )  --學習等級達上限
					ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_YU_GUILDWAR_BUILD_03]" , C_SYSTEM )  --
					CancelBuff( OwnerID(), 501570 );--
					DialogClose( PlayerID )
					break
				elseif CountMagic == 2 and (BuildingLV < NowBuff_A_LV+1) and (BuildingLV >= NowBuff_B_LV+1) and DialogStatus == 0 then
					ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_YU_GUILDWAR_BUILD_03]" , C_SYSTEM )  --
					ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_YU_GUILDWAR_BUILD_03]" , C_SYSTEM )  --
					CancelBuff( OwnerID(), 501570 );--
					DialogClose( PlayerID )
					break
				elseif CountMagic == 2 and (BuildingLV >= NowBuff_A_LV+1) and (BuildingLV < NowBuff_B_LV+1) and DialogStatus == 1 then
					ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_YU_GUILDWAR_BUILD_03]" , C_SYSTEM )  --
					ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_YU_GUILDWAR_BUILD_03]" , C_SYSTEM )  --
					CancelBuff( OwnerID(), 501570 );--
					DialogClose( PlayerID )
					break
				elseif CountMagic == 2 and (BuildingLV < NowBuff_A_LV+1) and (BuildingLV < NowBuff_B_LV+1) and DialogStatus == 0 then
					ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_YU_GUILDWAR_BUILD_03]" , C_SYSTEM )  --
					ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_YU_GUILDWAR_BUILD_03]" , C_SYSTEM )  --
					CancelBuff( OwnerID(), 501570 );--
					DialogClose( PlayerID )
					break
				elseif CountMagic == 2 and (BuildingLV < NowBuff_A_LV+1) and (BuildingLV < NowBuff_B_LV+1) and DialogStatus == 1 then
					ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_YU_GUILDWAR_BUILD_03]" , C_SYSTEM )  --
					ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_YU_GUILDWAR_BUILD_03]" , C_SYSTEM )  --
					CancelBuff( OwnerID(), 501570 );--
					DialogClose( PlayerID )
					break


				elseif DialogStatus == 0 then

					if (Now_R >= Record) and (Now_E >= Energy) then
						WriteRoleValue( OwnerID()  , EM_RoleValue_Register+8 ,  NowBuff_A_LV  ) --記錄所要研發的技術等級
						WriteRoleValue( OwnerID()  , EM_RoleValue_Register+9 ,  Technology[1]  ) --記錄所要研發的技術
						Beginplot( TargetID() ,"Yuyu_GuildWarBuliding_1_03", 0 )
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

						WriteRoleValue( OwnerID()  , EM_RoleValue_Register+8 ,  NowBuff_B_LV  ) --記錄所要研發的技術等級
						WriteRoleValue( OwnerID()  , EM_RoleValue_Register+9 ,  Technology[2]  ) --記錄所要研發的技術
						Beginplot( TargetID() ,"Yuyu_GuildWarBuliding_1_03", 0 )
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
			end
		
		else--假如沒有buff 501570
			ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );--視窗已經打開了
		end

	end --要判斷是否為公會成員時解除此end

end

function Yuyu_GuildWarBuliding_1_03() -- 公會戰時，【學院、加工廠、校場、圖書館、馬廄】

	Beginplot( TargetID() ,"Yuyu_GuildWarBuliding_1_04", 0 )

end

function Yuyu_GuildWarBuliding_1_04() -- 公會戰時，【學院、加工廠、校場、圖書館、馬廄】

	local Player = OwnerID()
	local Energy = 50--能量
	local Record = 50--戰績

---*---以下判斷玩家是否有學習折扣技術
	local SetA = -1
	local SetB = -1			
	local Count = BuffCount ( OwnerID())
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID ) -- 基本法術ID
		if BuffID == 505313 then--績效學
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )--該玩家第 j 個BUFF的等級

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
--	Say( TargetID() ,"TargetID" )
--	Say( OwnerID() ,"OwnerID" )
--	Say( OwnerID() ,"TechLV="..TechLV )
--	Say( OwnerID() ,"Technology="..Technology )
	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )
--	Say(OwnerID() , "ZoneID = "..ZoneID )
--	local Torch =  CountBodyItem( OwnerID() , 203025 )    
	local truecast = 60			--/*科技研發所需時間
	local BookMagicID = 505308		--/*持書motion

	if (ReadRoleValue( OwnerID() , EM_RoleValue_PID) == 1) then
		ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_AUCTION_WAIT_NEXT]",0)	--忙碌中，請稍候再試。
		return
	end
	WriteRoleValue( OwnerID() , EM_RoleValue_PID, 1 ) --研發鎖定中
	WriteRoleValue( TargetID() , EM_RoleValue_PID, 1 ) --研發鎖定中

	if BeginCastBar( OwnerID(), "["..Technology.."]".." [U_LV]"..TechLV+1 , truecast , ruFUSION_ACTORSTATE_READING_BEGIN , ruFUSION_ACTORSTATE_READING_END , 0 ) == 1 then	--/*開始施法

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
			-- 2013.08.27 阿浩:研發時消耗的能量與戰績，由預先扣除調整為建造完成時扣除。				
			elseif (CheckID( TargetID() ) == false) or Now_E < Energy or Now_R < Record then
				result = "DAME"
				EndCastBar( OwnerID() , CastBarStatus )
				break
			--
			else
				AddBuff( OwnerID() , BookMagicID , 0 , -1 )		--使用書
			end
		end

		if ( result == "OKOK" ) then
--			Say( TargetID() ,"TechLV="..TechLV )
--			Say( OwnerID() ,"Technology="..Technology )
			if CheckID( TargetID() ) == true then
				-- 2013.08.27 阿浩:研發時消耗的能量與戰績，由預先扣除調整為建造完成時扣除。
				AddGuildWarEnergy( Player , -Energy )	--扣除能量
				DelBodyItem( Player , 206685 , Record )	--扣除戰績
				ScriptMessage( Player , Player , 1 , "[SC_GUILDWAR_DEVELOPING_COMPLETED][$SETVAR1="..Energy.."][$SETVAR2="..Record.."]" , C_SYSTEM )	--研發完成：消耗能量[$VAR1]、戰績[$VAR2]
				ScriptMessage( Player , Player , 0 , "[SC_GUILDWAR_DEVELOPING_COMPLETED][$SETVAR1="..Energy.."][$SETVAR2="..Record.."]" , C_SYSTEM )
				--
				CastSpell( OwnerID(), OwnerID() ,491010) -- 研發完畢共用特效
				CancelBuff( OwnerID() , BookMagicID )
				CancelBuff( OwnerID() , Technology )
				AddBuff( OwnerID() , Technology , TechLV , -1 )	--本次研發之科技	
				local TechNAME = "|cffffff00".."["..Technology.."]".."[U_LV]"..(TechLV+1).."|r"
				--Say(OwnerID(),TechNAME)
				local str = "[SC_YU_GUILDWAR_BUILD_04][$SETVAR1=".."]"--[$VAR1] 已成功的研發完畢。
				--Say(OwnerID(),str)
				ScriptMessage( OwnerID(),OwnerID(),1,TechNAME..str,0)	--研發完畢
				ScriptMessage( OwnerID(),OwnerID(),0,TechNAME..str,0)	--研發完畢
				WriteRoleValue( TargetID() , EM_RoleValue_PID, 0 ) --解除鎖定可再次研發
			end
			WriteRoleValue( OwnerID() , EM_RoleValue_PID, 0 ) --解除鎖定可再次研發
			WriteRoleValue( OwnerID()  , EM_RoleValue_Register+8 , 0  ) --清空要研發的技術等級
			WriteRoleValue( OwnerID()  , EM_RoleValue_Register+9 , 0  ) --清空要研發的技術
		elseif ( result == "DAME" ) then
			WriteRoleValue( OwnerID() , EM_RoleValue_PID, 0 ) --解除鎖定可再次研發
			WriteRoleValue( TargetID() , EM_RoleValue_PID, 0 ) --解除鎖定可再次研發
			WriteRoleValue( OwnerID()  , EM_RoleValue_Register+8 ,  0  ) --清空要研發的技術等級
			WriteRoleValue( OwnerID()  , EM_RoleValue_Register+9 ,  0  ) --清空要研發的技術
			CancelBuff( OwnerID() , BookMagicID )
			-- 2013.08.27 阿浩:研發時消耗的能量與戰績，由預先扣除調整為建造完成時扣除。
			ScriptMessage( Player , Player , 1 , "[SC_GUILDWAR_DEVELOPING_FAILED]" , C_RED )	--研發失敗
			ScriptMessage( Player , Player , 0 , "[SC_GUILDWAR_DEVELOPING_FAILED]" , C_RED )
			--
		--	ScriptMessage( OwnerID(),OwnerID(),1,back,C_SYSTEM)	--研發中斷，歸還預存資源：能量50、戰績50
		--	ScriptMessage( OwnerID(),OwnerID(),0,back,C_SYSTEM)
		--	GiveBodyItem( OwnerID() , 206685 , Record ) --返還戰績50
		--	AddGuildWarEnergy( OwnerID() , Energy ) --返還能量50
		end

	end
end


-->*===============================================================================================*<--

function Yuyu_GuildWarBuliding_Sampol() -- 公會戰時，【共用參考NPC】

	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )

	ScriptMessage( OwnerID() , -1 , 0 , "Npc StartPlot" , C_RED )	-- 測試訊息

	if (ZoneID == 402) or (ZoneID == 951)  then

		SetModeEx( OwnerID()  , EM_SetModeType_Move, false )--移動
		SetModeEx( OwnerID() , EM_SetModeType_DisableRotate, true )--轉向
		SetModeEx( OwnerID() , EM_SetModeType_NotShowHPMP, true )--不顯示血條

	end

end


function Yuyu_GuildWarBuliding_TowerX() -- 公會戰時，【榮譽水晶守護塔】

	SetModeEx( OwnerID()  , EM_SetModeType_Move, false )--移動
	SetModeEx( OwnerID() , EM_SetModeType_DisableRotate, true )--轉向

	AddBuff( OwnerID() , 505921 , 49, -1 )		--50%	--被玩家攻擊傷害折扣 法術等級 0 = 1%	
	AddBuff( OwnerID() , 505517 , 49, -1 )		--50%	--被NPC攻擊傷害折扣 法術等級 0 = 1%
	AddBuff( OwnerID() , 505923 , 299, -1 )	--300%--攻擊NPC傷害增加 法術等級 0 = 1%

end

function Yuyu_GB_Sampol_NPC() -- 公會戰時，【共用參考NPC-大絕招類】

	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )

	if (ZoneID == 402) or (ZoneID == 31)  then
		SetModeEx( OwnerID() , EM_SetModeType_NotShowHPMP, true )--不顯示血條
		AddBuff( OwnerID() , 505513 , 79, -1 )	--80%--攻擊NPC傷害減弱 法術等級 0 = 1%
	end

end

function Yuyu_GB_Sampol_NPC_01() -- 公會戰時，【據點守護者(王級精英)】

	AddBuff( OwnerID() , 505517 , 94, -1 )		--95%	--被NPC攻擊傷害折扣 法術等級 0 = 1%
	AddBuff( OwnerID() , 505923 , 599, -1 )	--600%--攻擊NPC傷害增加 法術等級 0 = 1%

end

function Yuyu_GB_Sampol_NPC_02() -- 公會戰時，【據點守護者(精英)】

	AddBuff( OwnerID() , 505517 , 89, -1 )		--90%	--被NPC攻擊傷害折扣 法術等級 0 = 1%
	AddBuff( OwnerID() , 505923 , 499, -1 )	--500%--攻擊NPC傷害增加 法術等級 0 = 1%

end