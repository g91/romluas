function Yuyu_GuildWarBuliding_4_01() -- 公會戰時，【加工廠、兵工廠】功能

	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )

	if (ZoneID == 402) or (ZoneID == 31)  then
		local BuildingOrgID_1 = {113151,113152,113153,113154,113155,113156,113157,113158,113159,113160}  --【加工廠】 10階級之OrgID---------------------------------------------/*變數↓
		local BuildingOrgID_2 = {112934,112935,112936,112937,112938,112939,112940,112941,112942,112943} --【兵工廠】10階級之OrgID

		local BuildingOrgID = { BuildingOrgID_1 , BuildingOrgID_2  }--------------------------------------------------------------------/*變數↑
		local TargetOrgID = ReadRoleValue( OwnerID() ,EM_RoleValue_OrgID ) --目前建築物之OrgID


		for i= 1 , 10 do

			if TargetOrgID == BuildingOrgID[1][i] then ------------------------------------------------------------------------------------------------------------------------------------------/*變數↓
				WriteRoleValue( OwnerID()  , EM_RoleValue_Register+5 ,  1  ) --記錄改建築物屬於：加工廠
				SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor  );
				SetShop( OwnerID() , 600177 , "Test_Shop_Close" );--加工廠賣建築
				SetCursorType( OwnerID() , eCursor_Shop ); --游標變成 齒輪
				SetPlot( OwnerID() , "touch" , "Yuyu_GuildWarBuliding_4_01_2" , 125 )	--公會城戰時
				SetPlot(  OwnerID(), "dead","Lua_GUILDWAR_BuildDScript_1",0 )     --加工廠死亡劇情

			elseif TargetOrgID == BuildingOrgID[2][i] then 
				WriteRoleValue( OwnerID()  , EM_RoleValue_Register+5 ,  2  ) --記錄改建築物屬於：兵工廠
				SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon  );
				SetShop( OwnerID() , 600180 , "Test_Shop_Close" );--兵工廠賣載具
				SetCursorType( OwnerID() , eCursor_Shop ); --游標變成 齒輪
				SetPlot( OwnerID() , "touch" , "Yuyu_GuildWarBuliding_4_01_2" , 125 )	--公會城戰時
				SetPlot(  OwnerID(), "dead","Lua_GUILDWAR_BuildDScript_1",0 )     --兵工廠死亡劇情

			end
		end

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
	
		AddBuff( OwnerID() , 505516 , 99, -1 )	--100%	--被NPC攻擊傷害增加 法術等級 0 = 1%
		AddBuff( OwnerID() , 505921 , 89 , -1 )	--90%	--被玩家攻擊傷害折扣 法術等級 0 = 1%	
		AddBuff( OwnerID() ,502707 ,1 ,-1 ); --非戰鬥中不回血的buff (ownerID,buff,LV,Time)
		WriteRoleValue( OwnerID()  , EM_RoleValue_Register+1 ,  38  )--紀錄為大型建築物---***
	end

end

function Yuyu_GuildWarBuliding_4_01_2()

	if ReadRoleValue( OwnerID() , EM_RoleValue_PID) == 1 then
		ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_AUCTION_WAIT_NEXT]",0)	--忙碌中，請稍候再試。
		return
	end

	local VOC = ReadRoleValue( OwnerID() , EM_RoleValue_VOC )--職業
	local PassCard =  CountBodyItem( OwnerID() , 206769 ) --是否具有通行證 = GM測試
	local RoomID = ReadRoleValue( TargetID(), EM_RoleValue_RoomID )
	local PlayerGuildID = ReadRoleValue( OwnerID() ,   EM_RoleValue_GuildID ) 
	local BuildingGuildID = ReadRoleValue( TargetID() ,   EM_RoleValue_GuildID ) 
	local Kind = ReadRoleValue( TargetID() , EM_RoleValue_Register+5 ) --判斷建築物屬於加工廠or兵工廠

	local Record = 50 --研究所需戰績
	local Energy = 50 --研究所需能量

	local Now_E = GetGuildWarEnergy(OwnerID()) --目前能量
	local Now_R =  CountBodyItem( OwnerID() , 206685 ) --目前戰績

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

	if SetA>-1 then
		Record = Record*(1-((SetA+1)*0.05))
		Record = math.ceil(Record)--小數點以下均捨去

	end
	if SetB>-1 then
		Energy = Energy*(1-((SetB+1)*0.05))
		Energy = math.ceil(Energy)--小數點以下均捨去

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

		local PlayerID = OwnerID()
		local CheckTime = 1
		local RunTime = 1
		local DialogStatus = 0
		local TransferSelect = {}
		if CheckBuff( OwnerID() , 501570) == false then
			if Kind == 1 then	--建築物屬於：加工廠
				TransferSelect[0] = { "[SC_YU_GUILDWAR_W5_01]" }
				TransferSelect[1] = { "[SC_YU_GUILDWAR_W5_02]" }
				TransferSelect[2] = { "[SO_EXIT]" }				-- 離開對話

				DialogCreate( OwnerID() , EM_LuaDialogType_Select , "[SC_YU_GUILDWAR_W5_00][$SETVAR1="..Energy.."][$SETVAR2="..Record.."]" )
				AddBuff(OwnerID() , 501570,0,-1);
				for i = 0, table.getn( TransferSelect ) do
					DialogSelectStr( OwnerID() , TransferSelect[i][1] )
				end
				if( DialogSendOpen( OwnerID() ) == false ) then 
					ScriptMessage( OwnerID() , OwnerID() , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 )	--資料送出有問題
					return 0
				end
				while true do
					Sleep(5)
					RunTime = RunTime + 1
					if RunTime  > 100 then -- 防無窮迴圈，600 = 一分鐘
						DebugMsg( 0, RoomID ,"Exit the MENU because IDLE a long Time !!")
						CancelBuff( OwnerID(), 501570 );--DialogClose( PlayerID )
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
					DialogStatus = DialogGetResult( PlayerID )
					--Say( PlayerID , DialogStatus )

					if DialogStatus == -2 then
						-- DO nothing
					elseif DialogStatus == 2 or DialogStatus == -1 then
						CancelBuff( OwnerID(), 501570 );--DialogClose( PlayerID )
						break
					elseif DialogStatus == 0 then

						Beginplot( TargetID() ,"Yuyu_GuildWarBuliding_4_01_5", 0 ) --申請建築材料包
						CancelBuff( OwnerID(), 501570 );--DialogClose( PlayerID )
						break
					elseif DialogStatus == 1 then

						Beginplot( TargetID() ,"Yuyu_GuildWarBuliding_4_01_3", 0 ) -- 加工廠之技術研究
						CancelBuff( OwnerID(), 501570 );--DialogClose( PlayerID )
						break
					end
				end

			elseif Kind == 2 then	--建築物屬於：兵工廠

				TransferSelect[0] = { "[SC_YU_GUILDWAR_W9_01]" }
				TransferSelect[1] = { "[SC_YU_GUILDWAR_W5_02]" }
				TransferSelect[2] = { "[SC_YU_GUILDWAR_W9_03]" }
				TransferSelect[3] = { "[SO_EXIT]" }				-- 離開對話

				DialogCreate( OwnerID() , EM_LuaDialogType_Select , "[SC_YU_GUILDWAR_W9_00][$SETVAR1="..Energy.."][$SETVAR2="..Record.."]" )
				AddBuff(OwnerID() , 501570,0,-1);
				for i = 0, table.getn( TransferSelect ) do
					DialogSelectStr( OwnerID() , TransferSelect[i][1] )
				end
				if( DialogSendOpen( OwnerID() ) == false ) then 
					ScriptMessage( OwnerID() , OwnerID() , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 )	--資料送出有問題
					return 0
				end
				while true do
					Sleep(2)
					RunTime = RunTime + 1
					if RunTime  > 100 then -- 防無窮迴圈，600 = 一分鐘
						DebugMsg( 0, RoomID ,"Exit the MENU because IDLE a long Time !!")
						CancelBuff( OwnerID(), 501570 );--DialogClose( PlayerID )
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
					DialogStatus = DialogGetResult( PlayerID )
					--Say( PlayerID , DialogStatus )

					if DialogStatus == -2 then
						-- DO nothing
					elseif DialogStatus == 3 or DialogStatus == -1 then
						CancelBuff( OwnerID(), 501570 );--DialogClose( PlayerID )
						break
					elseif DialogStatus == 0 then

						Beginplot( TargetID() ,"Yuyu_GuildWarBuliding_4_01_5", 0 ) --申請建築材料包
						CancelBuff( OwnerID(), 501570 );--DialogClose( PlayerID )
						break
					elseif DialogStatus == 1 then

						Beginplot( TargetID() ,"Yuyu_GuildWarBuliding_4_01_3", 0 ) -- 加工廠之技術研究
						CancelBuff( OwnerID(), 501570 );--DialogClose( PlayerID )
						break

					elseif DialogStatus == 2 then

						Beginplot( TargetID() ,"Yuyu_GuildWarBuliding_4_01_7", 0 ) -- 生產項目升級
						CancelBuff( OwnerID(), 501570 );--DialogClose( PlayerID )
						break
					end
				end
			end
		
		else--假如沒有buff 501570
			ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );--視窗已經打開了
		end
	end

end

function Yuyu_GuildWarBuliding_4_01_5() --轉換TargetID、OwnerID用--申請建築材料包
	Beginplot( TargetID() ,"Yuyu_GuildWarBuliding_4_02_1_shop", 0 )
end

function Yuyu_GuildWarBuliding_4_02_1_shop() --【加工廠、兵工廠】開啟商店

	OpenShop()

end

function Yuyu_GuildWarBuliding_4_01_6()--轉換TargetID、OwnerID用
	Beginplot( TargetID() ,"Yuyu_GuildWarBuliding_4_01_2", 0 )
end

function Yuyu_GuildWarBuliding_4_01_7() --轉換TargetID、OwnerID用-- 生產項目升級
	Beginplot( TargetID() ,"Yuyu_GuildWarBuliding_4_01_8", 0 )
end

function Yuyu_GuildWarBuliding_4_01_8() --轉換TargetID、OwnerID用-- 生產項目升級
--TargetID建築物

	if CheckBuff( TargetID() , 505937 ) == true then -- 有三階的生產BUFF

		ScriptMessage( OwnerID(),OwnerID(),1,"[SC_YU_GUILDWAR_BUILD_33]",0)	--目前可生產之項目已是最高等級！
		ScriptMessage( OwnerID(),OwnerID(),0,"[SC_YU_GUILDWAR_BUILD_33]",0)	--

	else
		if CheckBuff( OwnerID() , 501570) == false then 
			local Record = 200 --研究所需戰績
			local Energy = 200 --研究所需能量
		--	local Now_E = GetGuildWarEnergy(OwnerID()) --目前能量
		--	local Now_R =  CountBodyItem( OwnerID() , 206685 ) --目前戰績

			local PlayerID = OwnerID()
			local CheckTime = 1
			local RunTime = 1
			local DialogStatus = 0
			local TransferSelect = {}
			local RoomID = ReadRoleValue( PlayerID ,EM_RoleValue_RoomID) 
			TransferSelect[0] = { "[SC_OKAY]" }
			TransferSelect[1] = { "[SC_CANCEL]" }				-- 離開對話
			
			
			DialogCreate( OwnerID() , EM_LuaDialogType_Select , "[SC_YU_GUILDWAR_W9_04][$SETVAR1="..Energy.."][$SETVAR2="..Record.."]" )--升級兵工廠生產攻城器具的製造項目。
			AddBuff(OwnerID() , 501570,0,-1);
			for i = 0, table.getn( TransferSelect ) do
				DialogSelectStr( OwnerID() , TransferSelect[i][1] )
			end
			if( DialogSendOpen( OwnerID() ) == false ) then 
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 )	--資料送出有問題
				return 0
			end
			while true do
				Sleep(2)
				RunTime = RunTime + 1
				if RunTime  > 100 then -- 防無窮迴圈，600 = 一分鐘
					DebugMsg( 0, RoomID ,"Exit the MENU because IDLE a long Time !!")
					CancelBuff( OwnerID(), 501570 );--DialogClose( PlayerID )
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
				elseif DialogStatus == 1 or DialogStatus == -1 then
					CancelBuff( OwnerID(), 501570 );--DialogClose( PlayerID )
					break
				elseif DialogStatus == 0 then

					if (Now_R >= Record) and (Now_E >= Energy) then

						if ReadRoleValue( TargetID() , EM_RoleValue_Register) == 1 then
							ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_AUCTION_WAIT_NEXT]",0)	--忙碌中，請稍候再試。
							CancelBuff( OwnerID(), 501570 );--DialogClose( PlayerID )
							return
						else
							Beginplot( TargetID() ,"Yuyu_GuildWarBuliding_4_01_9", 0 ) --生產項目升級
							CancelBuff( OwnerID(), 501570 );--DialogClose( PlayerID )
							break
						end

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

				end
			end
		
		else--假如沒有buff 501570
			ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );--視窗已經打開了
		end
	end
end

function Yuyu_GuildWarBuliding_4_01_9() -- 公會戰時，【學院、加工廠、校場、圖書館、馬廄】
--	Say( OwnerID() ,"OwnerID") --建築物
--	Say( TargetID() ,"TargetID") -- 玩家
	Beginplot( TargetID() ,"Yuyu_GuildWarBuliding_4_01_10", 0 )

end

function Yuyu_GuildWarBuliding_4_01_10() -- 公會戰時，-- 生產項目升級
	
	local Player = OwnerID()
	local Energy = 200--能量
	local Record = 200--戰績

	local str = "[SC_YU_GUILDWAR_BUILD_28][$SETVAR1="..Energy.."][$SETVAR2="..Record.."]"
	local back = "[SC_YU_GUILDWAR_BUILD_29][$SETVAR1="..Energy.."][$SETVAR2="..Record.."]"
--	ScriptMessage( OwnerID(),OwnerID(),1,str,C_SYSTEM)	--研發開始，預先提存所需資源：能量50、戰績50
--	ScriptMessage( OwnerID(),OwnerID(),0,str,C_SYSTEM)	
--	AddGuildWarEnergy( OwnerID() , -Energy ) --扣除能量50
--	DelBodyItem( OwnerID() , 206685 , Record ) --扣除戰績50
	-- 2013.08.27 阿浩:研發時消耗的能量與戰績，由預先扣除調整為建造完成時扣除。
	ScriptMessage( Player , Player , 1 , "[SC_GUILDWAR_DEVELOPING_STARTED]" , C_SYSTEM )	--研發開始
	ScriptMessage( Player , Player , 0 , "[SC_GUILDWAR_DEVELOPING_STARTED]" , C_SYSTEM )
	--
	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )
	local truecast = 90			--/*科技研發所需時間
	local BookMagicID = 505308		--/*持書motion


	if (ReadRoleValue( OwnerID() , EM_RoleValue_Register) ~= 0) or (ReadRoleValue( TargetID() , EM_RoleValue_Register) == 1) then
		ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_AUCTION_WAIT_NEXT]",0)	--忙碌中，請稍候再試。
		return
	end
	WriteRoleValue( OwnerID() , EM_RoleValue_Register, TargetID() ) --研發鎖定中
	WriteRoleValue( TargetID() , EM_RoleValue_Register, 1 ) --研發鎖定中
	WriteRoleValue( OwnerID() , EM_RoleValue_PID, 1 ) --研發鎖定中
	WriteRoleValue( TargetID() , EM_RoleValue_PID, 1 ) --研發鎖定中


	if BeginCastBar( OwnerID(), "[SC_YU_GUILDWAR_W9_03]" , truecast , ruFUSION_ACTORSTATE_READING_BEGIN , ruFUSION_ACTORSTATE_READING_END , 0 ) == 1 then	--/*開始施法

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

				if CheckBuff( TargetID() , 505936 ) == true then -- 有二階的生產BUFF
					AddBuff( TargetID() , 505937 , 0 , -1 )		--給三階BUFF
					CancelBuff( TargetID() , 505936 )
					SetMinimapIcon ( TargetID(), EM_MapIconType_Weapon  );
					SetShop( TargetID() , 600182 , "Test_Shop_Close" );--兵工廠賣載具
					local PlayerGuildID = GetRoleCampID( OwnerID() )--玩家的陣營

					if PlayerGuildID == 7 then --藍色陣營
						local Playername = "|cff00ffff"..GetName( OwnerID() ).."|r"
						local str = "[SC_YU_GUILDWAR_BUILD_06][$SETVAR1="..Playername.."]"

						ScriptMessage( OwnerID(),-1,2,Str.."|cff00ffff".."[SC_YU_GUILDWAR_W9_03]".."|r".."[SC_YU_GUILDWAR_BUILD_07]",C_SYSTEM)
						ScriptMessage( OwnerID(),-1,0,Str.."|cff00ffff".."[SC_YU_GUILDWAR_W9_03]".."|r".."[SC_YU_GUILDWAR_BUILD_07]",C_SYSTEM)

					elseif PlayerGuildID == 8 then --紅色陣營
						local Playername = "|cffff3232"..GetName( OwnerID() ).."|r"
						local str = "[SC_YU_GUILDWAR_BUILD_06][$SETVAR1="..Playername.."]"

						ScriptMessage( TargetID(),-1,2,Str.."|cffff3232".."[SC_YU_GUILDWAR_W9_03]".."|r".."[SC_YU_GUILDWAR_BUILD_07]",C_SYSTEM)
						ScriptMessage( TargetID(),-1,0,Str.."|cffff3232".."[SC_YU_GUILDWAR_W9_03]".."|r".."[SC_YU_GUILDWAR_BUILD_07]",C_SYSTEM)

					end
				else
					AddBuff( TargetID() , 505936 , 0 , -1 )		--給二階BUFF

					SetMinimapIcon ( TargetID(), EM_MapIconType_Weapon  );
					SetShop( TargetID() , 600181 , "Test_Shop_Close" );--兵工廠賣載具
					local PlayerGuildID = GetRoleCampID( OwnerID() )--玩家的陣營

					if PlayerGuildID == 7 then --藍色陣營
						local Playername = "|cff00ffff"..GetName( OwnerID() ).."|r"
						local str = "[SC_YU_GUILDWAR_BUILD_06][$SETVAR1="..Playername.."]"

						ScriptMessage( TargetID(),-1,2,Str.."|cff00ffff".."[SC_YU_GUILDWAR_W9_03]".."|r".."[SC_YU_GUILDWAR_BUILD_07]",C_SYSTEM)
						ScriptMessage( TargetID(),-1,0,Str.."|cff00ffff".."[SC_YU_GUILDWAR_W9_03]".."|r".."[SC_YU_GUILDWAR_BUILD_07]",C_SYSTEM)
					elseif PlayerGuildID == 8 then --紅色陣營

						local Playername = "|cffff3232"..GetName( OwnerID() ).."|r"
						local str = "[SC_YU_GUILDWAR_BUILD_06][$SETVAR1="..Playername.."]"

						ScriptMessage( TargetID(),-1,2,Str.."|cffff3232".."[SC_YU_GUILDWAR_W9_03]".."|r".."[SC_YU_GUILDWAR_BUILD_07]",C_SYSTEM)
						ScriptMessage( TargetID(),-1,0,Str.."|cffff3232".."[SC_YU_GUILDWAR_W9_03]".."|r".."[SC_YU_GUILDWAR_BUILD_07]",C_SYSTEM)
					end

				end

				WriteRoleValue( TargetID() , EM_RoleValue_Register, 0 ) --解除鎖定可再次研發
				WriteRoleValue( TargetID() , EM_RoleValue_PID, 0 ) --解除鎖定可再次研發
			end
			WriteRoleValue( OwnerID() , EM_RoleValue_Register, 0 ) --解除鎖定可再次研發
			WriteRoleValue( OwnerID() , EM_RoleValue_PID, 0 ) --解除鎖定可再次研發
			WriteRoleValue( OwnerID()  , EM_RoleValue_Register+8 , 0  ) --清空要研發的技術等級
			WriteRoleValue( OwnerID()  , EM_RoleValue_Register+9 , 0  ) --清空要研發的技術

		elseif ( result == "DAME" ) then	
			WriteRoleValue( OwnerID() , EM_RoleValue_Register, 0 ) --解除鎖定可再次研發
			WriteRoleValue( TargetID() , EM_RoleValue_Register, 0 ) --解除鎖定可再次研發
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

function Yuyu_GuildWarBuliding_5_build_00()--【加工廠、兵工廠--使用(檢查)】

	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )
	local VOC = ReadRoleValue( OwnerID() , EM_RoleValue_VOC )--職業
	local PassCard =  CountBodyItem( OwnerID() , 206769 ) --是否具有通行證 = GM測試
	local PlayerIsSit =  CheckFlag( OwnerID()  , 543769 )--玩家是否在載具上

	if (ZoneID == 402) or (ZoneID == 951) or (PassCard > 0) then

		if ReadRoleValue( OwnerID() , EM_RoleValue_PID) == 1 then
			ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_AUCTION_WAIT_NEXT]",0)	--忙碌中，請稍候再試。
			return false

		elseif (PlayerIsSit == true) then --玩家在載具上
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

end

-->*===============================================================================================*<--

function Yuyu_GuildWarBuliding_4_01_3() --轉換TargetID、OwnerID用
	Beginplot( TargetID() ,"Yuyu_GuildWarBuliding_4_02_2", 0 )
end

function Yuyu_GuildWarBuliding_4_01_4()--轉換TargetID、OwnerID用
	Beginplot( TargetID() ,"Yuyu_GuildWarBuliding_4_01_2", 0 )
end

function Yuyu_GuildWarBuliding_4_02_2() -- 公會戰時，【加工廠、兵工廠】技術
--	Say( TargetID() ,"TargetID"..3 ) --建築物
--	Say( OwnerID() ,"OwnerID"..3 ) --玩家
	local VOC = ReadRoleValue( OwnerID() , EM_RoleValue_VOC )--職業
	local PassCard =  CountBodyItem( OwnerID() , 206769 ) --是否具有通行證 = GM測試
	local RoomID = ReadRoleValue( TargetID(), EM_RoleValue_RoomID )
	local PlayerGuildID = ReadRoleValue( OwnerID() ,   EM_RoleValue_GuildID ) 
	local BuildingGuildID = ReadRoleValue( TargetID() ,   EM_RoleValue_GuildID ) 

	local Record = 50 --研究所需戰績
	local Energy = 50 --研究所需能量

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

	if SetA>-1 then
		Record = Record*(1-((SetA+1)*0.05))
		Record = math.ceil(Record)--小數點以下均捨去

	end
	if SetB>-1 then
		Energy = Energy*(1-((SetB+1)*0.05))
		Energy = math.ceil(Energy)--小數點以下均捨去

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

		local BuildingOrgID_1 = {113151,113152,113153,113154,113155,113156,113157,113158,113159,113160}  --【加工廠】 10階級之OrgID---------------------------------------------/*變數↓
		local BuildingOrgID_2 = {112934,112935,112936,112937,112938,112939,112940,112941,112942,112943} --【兵工廠】10階級之OrgID

		local BuildingOrgID = { BuildingOrgID_1 , BuildingOrgID_2  }--------------------------------------------------------------------/*變數↑
		local BuildingNum = 0

		local BuildStr = {
				  "[SC_YU_GUILDWAR_W5_00][$SETVAR1="..Energy.."][$SETVAR2="..Record.."]",--加工廠

			                  "[SC_YU_GUILDWAR_W9_00][$SETVAR1="..Energy.."][$SETVAR2="..Record.."]"--兵工廠
											  }--科技說明文
		local BStr_A = 0

		local StrBuild = {
				  "[SC_YU_GUILDWAR_W5_04]",	--加工廠

			                  "[SC_YU_GUILDWAR_W9_02]"	--兵工廠
											  }--科技說明文
		local StrB_X = 0

		local TargetOrgID = ReadRoleValue( TargetID() ,EM_RoleValue_OrgID ) --目前建築物之OrgID

		local BuildingLV = 0 --建築物等級

		--*/

		for i= 1 , 10 do------------------------------------------------------------------------------------------------------------------------------------------/*變數↓

			if TargetOrgID == BuildingOrgID[1][i] then		--加工廠
				BuildingLV = i  --建築物等級
				BuildingNum = 1
				BStr_A = BuildStr[1]
				StrB_X = StrBuild[1]
			elseif TargetOrgID == BuildingOrgID[2][i] then 	--兵工廠
				BuildingLV = i  --建築物等級
				BuildingNum = 2
				BStr_A = BuildStr[2]
				StrB_X = StrBuild[2]
			end
		end

		--*\此段判斷建築物等級

		local Technology = {  } --該建築物可學之Buff技能號碼清單

		if  BuildingNum == 1 then
			Technology = {  505314  } --【加工廠】可學之Buff技能號碼清單

		elseif  BuildingNum == 2 then
			Technology = {  505316 } --【兵工廠】可學之Buff技能號碼清單

		end-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------/*變數↑

		local NowBuff_A_LV = 0 --該玩家目前習得之BUFF_A_技能等級
		local NowBuff_B_LV = 0	--該玩家目前習得之BUFF_B_技能等級

		--*/
		local BuffType = 0
		local Count = BuffCount ( OwnerID())

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

				local BuffID = BuffInfo ( OwnerID() , j , EM_BuffInfoType_BuffID )  -- 基本法術ID
				local BuffLv = BuffInfo( OwnerID() , j , EM_BuffInfoType_Power )  --該玩家第 j 個BUFF的等級

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
		local Techa = Technology[1]
		local Techb = Technology[2]

		local PlayerID = OwnerID()
		local RoomID = ReadRoleValue( PlayerID ,EM_RoleValue_RoomID) 
		local CheckTime = 1
		local RunTime = 1
		local DialogStatus = 0
		local TransferSelect = {}
		local CountMagic = table.getn(Technology)--總共可學的科技數量

		if CheckBuff( OwnerID() , 501570) == false then
			if CountMagic == 1 and (BuildingLV >= NowBuff_A_LV+1) then

				TransferSelect[0] = { "[SC_YU_GUILDWAR_BUILD_01]".."["..Techa.."]".." [U_LV]"..(NowBuff_A_LV+1) } --研發科技-科技名稱LV1
				TransferSelect[1] = { "[SC_111352_2]" }				--回上一頁
				TransferSelect[2] = { "[SO_EXIT]" }				-- 離開對話

				DialogCreate( OwnerID() , EM_LuaDialogType_Select , StrB_X )
				AddBuff(OwnerID() , 501570,0,-1);
				for i = 0, table.getn( TransferSelect ) do
					DialogSelectStr( OwnerID() , TransferSelect[i][1] )
				end
			elseif CountMagic == 1 and (BuildingLV < NowBuff_A_LV+1) then

				TransferSelect[0] = { "[SC_YU_GUILDWAR_BUILD_01]".."["..Techa.."]".."(".."[SC_YU_GUILDWAR_BUILD_02]"..")" } --研發科技-科技名稱(研發完畢)
				TransferSelect[1] = { "[SC_111352_2]" }
				TransferSelect[2] = { "[SO_EXIT]" }

				DialogCreate( OwnerID() , EM_LuaDialogType_Select , BStr_A )
				AddBuff(OwnerID() , 501570,0,-1);
				for i = 0, table.getn( TransferSelect ) do
					DialogSelectStr( OwnerID() , TransferSelect[i][1] )
				end	
			elseif CountMagic == 2 and (BuildingLV >= NowBuff_A_LV+1) and (BuildingLV >= NowBuff_B_LV+1) then

				TransferSelect[0] = { "[SC_YU_GUILDWAR_BUILD_01]".."["..Techa.."]".." [U_LV]"..(NowBuff_A_LV+1) }
				TransferSelect[1] = { "[SC_YU_GUILDWAR_BUILD_01]".."["..Techb.."]".." [U_LV]"..(NowBuff_B_LV+1) }
				TransferSelect[2] = { "[SC_111352_2]" }
				TransferSelect[3] = { "[SO_EXIT]" }				-- 離開對話

				DialogCreate( OwnerID() , EM_LuaDialogType_Select , BStr_A )
				AddBuff(OwnerID() , 501570,0,-1);
				for i = 0, table.getn( TransferSelect ) do
					DialogSelectStr( OwnerID() , TransferSelect[i][1] )
				end
			elseif CountMagic == 2 and (BuildingLV < NowBuff_A_LV+1) and (BuildingLV >= NowBuff_B_LV+1) then

				TransferSelect[0] = { "[SC_YU_GUILDWAR_BUILD_01]".."["..Techa.."]".."(".."[SC_YU_GUILDWAR_BUILD_02]"..")" } --研發科技-科技名稱(研發完畢)
				TransferSelect[1] = { "[SC_YU_GUILDWAR_BUILD_01]".."["..Techb.."]".." [U_LV]"..(NowBuff_B_LV+1) }
				TransferSelect[2] = { "[SC_111352_2]" }
				TransferSelect[3] = { "[SO_EXIT]" }				-- 離開對話

				DialogCreate( OwnerID() , EM_LuaDialogType_Select , BStr_A )
				AddBuff(OwnerID() , 501570,0,-1);
				for i = 0, table.getn( TransferSelect ) do
					DialogSelectStr( OwnerID() , TransferSelect[i][1] )
				end
			elseif CountMagic == 2 and (BuildingLV >= NowBuff_A_LV+1) and (BuildingLV < NowBuff_B_LV+1) then

				TransferSelect[0] = { "[SC_YU_GUILDWAR_BUILD_01]".."["..Techa.."]".." [U_LV]"..(NowBuff_A_LV+1) }
				TransferSelect[1] = { "[SC_YU_GUILDWAR_BUILD_01]".."["..Techb.."]".."(".."[SC_YU_GUILDWAR_BUILD_02]"..")" } --研發科技-科技名稱(研發完畢)
				TransferSelect[2] = { "[SC_111352_2]" }
				TransferSelect[3] = { "[SO_EXIT]" }				-- 離開對話

				DialogCreate( OwnerID() , EM_LuaDialogType_Select , BStr_A )
				AddBuff(OwnerID() , 501570,0,-1);
				for i = 0, table.getn( TransferSelect ) do
					DialogSelectStr( OwnerID() , TransferSelect[i][1] )
				end
			elseif CountMagic == 2 and (BuildingLV < NowBuff_A_LV+1) and (BuildingLV < NowBuff_B_LV+1) then

				TransferSelect[0] = { "[SC_YU_GUILDWAR_BUILD_01]".."["..Techa.."]".."(".."[SC_YU_GUILDWAR_BUILD_02]"..")" } --研發科技-科技名稱(研發完畢)
				TransferSelect[1] = { "[SC_YU_GUILDWAR_BUILD_01]".."["..Techb.."]".."(".."[SC_YU_GUILDWAR_BUILD_02]"..")" } --研發科技-科技名稱(研發完畢)
				TransferSelect[2] = { "[SC_111352_2]" }
				TransferSelect[3] = { "[SO_EXIT]" }				-- 離開對話

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
				Sleep(2)
				RunTime = RunTime + 1
				if RunTime  > 100 then -- 防無窮迴圈，600 = 一分鐘
					DebugMsg( 0, RoomID ,"Exit the MENU because IDLE a long Time !!")
					CancelBuff( OwnerID(), 501570 );--DialogClose( PlayerID )
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
				DialogStatus = DialogGetResult( PlayerID )
				--Say( PlayerID , DialogStatus )

				if DialogStatus == -2 then
					-- DO nothing
				elseif CountMagic == 1 and DialogStatus == 2 then --離開
					CancelBuff( OwnerID(), 501570 );--DialogClose( PlayerID )
					break
				elseif CountMagic == 2 and DialogStatus == 3 then --離開
					CancelBuff( OwnerID(), 501570 );--DialogClose( PlayerID )
					break

				elseif CountMagic == 1 and DialogStatus == 1 then --回上一頁
					Beginplot( TargetID() ,"Yuyu_GuildWarBuliding_4_01_4", 0 ) 
					CancelBuff( OwnerID(), 501570 );--DialogClose( PlayerID )
					break
				elseif CountMagic == 2 and DialogStatus == 2 then --回上一頁
					Beginplot( TargetID() ,"Yuyu_GuildWarBuliding_4_01_4", 0 ) 
					CancelBuff( OwnerID(), 501570 );--DialogClose( PlayerID )
					break
				elseif DialogStatus == -1 then
					CancelBuff( OwnerID(), 501570 );--DialogClose( PlayerID )
					break
				elseif CountMagic == 1 and (BuildingLV < NowBuff_A_LV+1) and DialogStatus == 0 then
					ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_YU_GUILDWAR_BUILD_03]" , C_SYSTEM )  --學習等級達上限
					ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_YU_GUILDWAR_BUILD_03]" , C_SYSTEM )  --
					CancelBuff( OwnerID(), 501570 );--DialogClose( PlayerID )
					break
				elseif CountMagic == 2 and (BuildingLV < NowBuff_A_LV+1) and (BuildingLV >= NowBuff_B_LV+1) and DialogStatus == 0 then
					ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_YU_GUILDWAR_BUILD_03]" , C_SYSTEM )  --
					ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_YU_GUILDWAR_BUILD_03]" , C_SYSTEM )  --
					CancelBuff( OwnerID(), 501570 );--DialogClose( PlayerID )
					break
				elseif CountMagic == 2 and (BuildingLV >= NowBuff_A_LV+1) and (BuildingLV < NowBuff_B_LV+1) and DialogStatus == 1 then
					ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_YU_GUILDWAR_BUILD_03]" , C_SYSTEM )  --
					ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_YU_GUILDWAR_BUILD_03]" , C_SYSTEM )  --
					CancelBuff( OwnerID(), 501570 );--DialogClose( PlayerID )
					break
				elseif CountMagic == 2 and (BuildingLV < NowBuff_A_LV+1) and (BuildingLV < NowBuff_B_LV+1) and DialogStatus == 0 then
					ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_YU_GUILDWAR_BUILD_03]" , C_SYSTEM )  --
					ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_YU_GUILDWAR_BUILD_03]" , C_SYSTEM )  --
					CancelBuff( OwnerID(), 501570 );--DialogClose( PlayerID )
					break
				elseif CountMagic == 2 and (BuildingLV < NowBuff_A_LV+1) and (BuildingLV < NowBuff_B_LV+1) and DialogStatus == 1 then
					ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_YU_GUILDWAR_BUILD_03]" , C_SYSTEM )  --
					ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_YU_GUILDWAR_BUILD_03]" , C_SYSTEM )  --
					CancelBuff( OwnerID(), 501570 );--DialogClose( PlayerID )
					break
				elseif DialogStatus == 0 then
					if (Now_R >= Record) and (Now_E >= Energy) then
						WriteRoleValue( OwnerID()  , EM_RoleValue_Register+8 ,  NowBuff_A_LV  ) --記錄所要研發的技術等級
						WriteRoleValue( OwnerID()  , EM_RoleValue_Register+9 ,  Technology[1]  ) --記錄所要研發的技術
						Beginplot( TargetID() ,"Yuyu_GuildWarBuliding_4_03", 0 )
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
				elseif CountMagic == 2 and DialogStatus == 1 then

					if (Now_R >= Record) and (Now_E >= Energy) then
						WriteRoleValue( OwnerID()  , EM_RoleValue_Register+8 ,  NowBuff_B_LV  ) --記錄所要研發的技術等級
						WriteRoleValue( OwnerID()  , EM_RoleValue_Register+9 ,  Technology[2]  ) --記錄所要研發的技術
						Beginplot( TargetID() ,"Yuyu_GuildWarBuliding_4_03", 0 )
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
				end
			end
		
		else--假如沒有玩家buff 501570
			ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );--視窗已經打開了
		end

	end --要判斷是否為公會成員時解除此end

end

function Yuyu_GuildWarBuliding_4_03() -- 公會戰時，【加工廠】
--	Say( OwnerID() ,"OwnerID") --建築物
--	Say( TargetID() ,"TargetID") -- 玩家
	Beginplot( TargetID() ,"Yuyu_GuildWarBuliding_4_04", 0 )

end

function Yuyu_GuildWarBuliding_4_04() -- 公會戰時，【加工廠】

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
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )--該建築第 j 個BUFF的等級

			SetA = BuffLv

		elseif BuffID == 505312 then--節能學
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )

			SetB = BuffLv

		end
	end

	if SetA>-1 then
		Record = Record*(1-((SetA+1)*0.05))
		Record = math.ceil(Record)--小數點以下均捨去

	end
	if SetB>-1 then
		Energy = Energy*(1-((SetB+1)*0.05))
		Energy = math.ceil(Energy)--小數點以下均捨去

	end

---*---↑

	local str = "[SC_YU_GUILDWAR_BUILD_28][$SETVAR1="..Energy.."][$SETVAR2="..Record.."]"
	local back = "[SC_YU_GUILDWAR_BUILD_29][$SETVAR1="..Energy.."][$SETVAR2="..Record.."]"
--	ScriptMessage( OwnerID(),OwnerID(),1,str,C_SYSTEM)	--研發開始，預先提存所需資源：能量50、戰績50
--	ScriptMessage( OwnerID(),OwnerID(),0,str,C_SYSTEM)	
--	AddGuildWarEnergy( OwnerID() , -Energy ) --扣除能量50
--	DelBodyItem( OwnerID() , 206685 , Record ) --扣除戰績50
	-- 2013.08.27 阿浩:研發時消耗的能量與戰績，由預先扣除調整為建造完成時扣除。
	ScriptMessage( Player , Player , 1 , "[SC_GUILDWAR_DEVELOPING_STARTED]" , C_SYSTEM )	--研發開始
	ScriptMessage( Player , Player , 0 , "[SC_GUILDWAR_DEVELOPING_STARTED]" , C_SYSTEM )
	--
	local TechLV = ReadRoleValue( OwnerID()  ,EM_RoleValue_Register+8 ) --所要研發的技術等級
	local Technology = ReadRoleValue( OwnerID()  ,EM_RoleValue_Register+9 ) --所要研發的技術
	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )
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
			sleep( 2 );
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
			-- 2013.10.23 阿浩:研發時消耗的能量與戰績，由預先扣除調整為建造完成時扣除。
			elseif (CheckID( TargetID() ) == false) or Now_E < Energy or Now_R < Record then
				result = "DAME"
				EndCastBar( OwnerID() , CastBarStatus )
				break;
			--
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