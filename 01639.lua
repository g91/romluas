function Yuyu_GuildWarBuliding_5_00()--【農產中心】

	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )


	if (ZoneID == 402) or (ZoneID == 31)  then

		local BuildingOrgID = {112906,112907,112908,112909,112910,112911,112912,112913,112914,112915}  --【農產中心】 10階級之OrgID
		local OwnerIDOrgID = ReadRoleValue( OwnerID() ,EM_RoleValue_OrgID ) --目前建築物之OrgID

		for i= 1 , 10 do

			if OwnerIDOrgID == BuildingOrgID[i] then ------------------------------------------------------------------------------------------------------------------------------------------/*變數↓

				if i == 1 then
					SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop );
					SetShop( OwnerID() , 600167 , "Test_Shop_Close" );

				elseif i == 2 then
					SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop );
					SetShop( OwnerID() , 600168 , "Test_Shop_Close" );

				elseif i == 3 then
					SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop );
					SetShop( OwnerID() , 600169 , "Test_Shop_Close" );

				elseif i == 4 then
					SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop );
					SetShop( OwnerID() , 600170 , "Test_Shop_Close" );

				elseif i == 5 then
					SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop );
					SetShop( OwnerID() , 600171 , "Test_Shop_Close" );

				elseif i == 6 then
					SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop );
					SetShop( OwnerID() , 600172 , "Test_Shop_Close" );

				elseif i == 7 then
					SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop );
					SetShop( OwnerID() , 600173 , "Test_Shop_Close" );

				elseif i == 8 then
					SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop );
					SetShop( OwnerID() , 600174 , "Test_Shop_Close" );

				elseif i == 9 then
					SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop );
					SetShop( OwnerID() , 600175 , "Test_Shop_Close" );

				elseif i == 10 then
					SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop );
					SetShop( OwnerID() , 600176 , "Test_Shop_Close" );
				end

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
		
		AddBuff( OwnerID() , 505921 , 89 , -1 )	--90%	--被玩家攻擊傷害折扣 法術等級 0 = 1%	
		AddBuff( OwnerID() , 505516 , 99, -1 )	--100%	--被NPC攻擊傷害增加 法術等級 0 = 1%
		AddBuff( OwnerID() ,502707 ,1 ,-1 ); --非戰鬥中不回血的buff (ownerID,buff,LV,Time)
		WriteRoleValue( OwnerID()  , EM_RoleValue_Register+1 ,  38  )--紀錄為大型建築物---***
		SetCursorType( OwnerID() , eCursor_Shop ); --游標變成 齒輪
		SetPlot( OwnerID() , "touch" , "Yuyu_GuildWarBuliding_5_01" , 125 )	--公會城戰時
		SetPlot(  OwnerID(), "dead","Lua_GUILDWAR_BuildDScript_1",0 )     --加工廠死亡劇情
	end
end


function Yuyu_GuildWarBuliding_5_01()--【農產中心】

		local VOC = ReadRoleValue( OwnerID() , EM_RoleValue_VOC )--職業
		local PassCard =  CountBodyItem( OwnerID() , 206769 ) --是否具有通行證 = GM測試
		local RoomID = ReadRoleValue( TargetID(), EM_RoleValue_RoomID )
		local PlayerGuildID = ReadRoleValue( OwnerID() ,   EM_RoleValue_GuildID ) 
		local BuildingGuildID = ReadRoleValue( TargetID() ,   EM_RoleValue_GuildID ) 

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
			OpenShop()
		end

end

function Yuyu_GuildWarBuliding_5_water_00(ItemMagic)--【農產中心--藥水(檢查)】

	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )
	local ZoneID = Zone-1000*math.floor( Zone/1000 )
	local VOC = ReadRoleValue( OwnerID() , EM_RoleValue_VOC )--職業
	local PassCard =  CountBodyItem( OwnerID() , 206769 ) --是否具有通行證 = GM測試

	local Type = Davis_CheckUse(OwnerID(),ItemMagic) --  傳回 0 代表冷卻結束可使用

	if (ZoneID == 402) or (ZoneID == 31) or (PassCard > 0) then
--		Say(OwnerID() ,Type)
		if Type  == 0 then --非冷卻中
			UseItemDestroy()--刪除使用中的物品
			return true
		else
			return false
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_DAN_111700_37]", C_SYSTEM ) --你無法在此區域使用該物品！
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_DAN_111700_37]", C_SYSTEM ) 
			return false
	end

end

--=============================================================================================================*****

function Yuyu_GuildWarBuliding_BigSP_00()--【大據點】

	SetMinimapIcon ( OwnerID(), EM_MapIconType_GuildMan );
	SetShop( OwnerID() , 600179 , "Test_Shop_Close" );

	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )


	if (ZoneID == 402) or (ZoneID == 31)  then
		SetCursorType( OwnerID() , eCursor_Shop ); --游標變成 齒輪
		SetPlot( OwnerID() , "touch" , "Yuyu_GuildWarBuliding_BigSP_01" , 60 )	--公會城戰時
	end

end

function Yuyu_GuildWarBuliding_BigSP_01()--【大據點】

		local VOC = ReadRoleValue( OwnerID() , EM_RoleValue_VOC )--職業
		local RoomID = ReadRoleValue( TargetID(), EM_RoleValue_RoomID )
		local PassCard =  CountBodyItem( OwnerID() , 206769 ) --是否具有通行證 = GM測試

		local PlayerGuildID = GetRoleCampID( OwnerID() )--玩家的陣營
		local BuildingGuildID = GetRoleCampID( TargetID() )--目標陣營

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
			OpenShop()
		end

end

function Yuyu_GuildWarBuliding_BigSP2_00()--【小據點】

	SetMinimapIcon ( OwnerID(), EM_MapIconType_GuildMan );
	SetShop( OwnerID() , 600178 , "Test_Shop_Close" );

	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )


	if (ZoneID == 402) or (ZoneID == 31)  then
		SetCursorType( OwnerID() , eCursor_Shop ); --游標變成 齒輪
		SetPlot( OwnerID() , "touch" , "Yuyu_GuildWarBuliding_BigSP2_01" , 60 )	--公會城戰時
	end

end

function Yuyu_GuildWarBuliding_BigSP2_01()--【小據點】

		local VOC = ReadRoleValue( OwnerID() , EM_RoleValue_VOC )--職業
		local RoomID = ReadRoleValue( TargetID(), EM_RoleValue_RoomID )
		local PassCard =  CountBodyItem( OwnerID() , 206769 ) --是否具有通行證 = GM測試

		local PlayerGuildID = GetRoleCampID( OwnerID() )--玩家的陣營
		local BuildingGuildID = GetRoleCampID( TargetID() )--目標陣營

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
			OpenShop()
		end

end

--=============================================================================================================*****


function Yuyu_GuildWarBuliding_3_02() -- 公會戰時，【功能塔】

--	Say( TargetID() ,"TargetID"..1 )--塔
--	Say( OwnerID() ,"OwnerID"..1 )--玩家

	if ReadRoleValue( TargetID() , EM_RoleValue_Register) == 1 then
		ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_AUCTION_WAIT_NEXT]",0)	--忙碌中，請稍候再試。
		return
	end

	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )
	local VOC = ReadRoleValue( OwnerID() , EM_RoleValue_VOC )--職業
	local PassCard =  CountBodyItem( OwnerID() , 206769 ) --是否具有通行證 = GM測試
	local RoomID = ReadRoleValue( TargetID(), EM_RoleValue_RoomID )
	local PlayerGuildID = GetRoleCampID( OwnerID() )--玩家的陣營
	local BuildingGuildID = GetRoleCampID( TargetID() )--目標陣營
	local judge = 0 --判斷是否是GM 或 同公會 ...等
	local judge_2 = 0 --判斷是否是為可作用之建築物	

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

	
--判斷0　是否為可作用區域
	if (ZoneID == 402) or (ZoneID == 31) or ZoneID == 951 then

--判斷1　是否為同陣營
		if (PassCard > 0) then
			judge = 1

		elseif PlayerGuildID == BuildingGuildID then

			judge = 1

		else
			ScriptMessage( TargetID() , OwnerID() , 1 , "[GUILD_REMINDER]", C_SYSTEM ) --你不是此公會的成員
			ScriptMessage( TargetID() , OwnerID() , 0 , "[GUILD_REMINDER]", C_SYSTEM ) 
			judge = 0
		end

--判斷3　是否為閒置之建築物
		if (judge == 1) then


			local BuildingOrgID_1 = {102481} --【汲能塔】之OrgID----------------------------------------------------------------------------------------------------------------------/*變數↓
			local BuildingOrgID_2 = {102482} --【視覺幻鏡】之OrgID
			local BuildingOrgID_3 = {102483} --【榮譽之心】之OrgID
			local BuildingOrgID_4 = {102484} --【聖光樹】之OrgID
			local BuildingOrgID_5 = {102485} --【魔燄塔】之OrgID
			local BuildingOrgID_6 = {102486} --【電能塔】之OrgID
			local BuildingOrgID = { BuildingOrgID_1 , BuildingOrgID_2 , BuildingOrgID_3 , BuildingOrgID_4 , BuildingOrgID_5 , BuildingOrgID_6 }-------------------------------/*變數↑
			local BuildingNum = 0


			local BuildStr = {
				                  "[SC_YU_GUILDWAR_WT05_00][$SETVAR1="..Energy.."][$SETVAR2="..Record.."]", --汲能塔
				                  "[SC_YU_GUILDWAR_WT06_00][$SETVAR1="..Energy.."][$SETVAR2="..Record.."]", --視覺幻鏡
				                  "[SC_YU_GUILDWAR_WT04_00][$SETVAR1="..Energy.."][$SETVAR2="..Record.."]", --榮譽之心
				                  "[SC_YU_GUILDWAR_WT03_00][$SETVAR1="..Energy.."][$SETVAR2="..Record.."]", --聖光樹
					  "[SC_YU_GUILDWAR_WT01_00][$SETVAR1="..Energy.."][$SETVAR2="..Record.."]",--魔燄塔
				                  "[SC_YU_GUILDWAR_WT02_00][$SETVAR1="..Energy.."][$SETVAR2="..Record.."]"--電能塔
												  }--科技說明文

			local BStr_A = 0

			local TargetOrgID = ReadRoleValue( TargetID() ,EM_RoleValue_OrgID ) --目前建築物之OrgID



			local BuildingLV = 0 --建築物等級

			--*/

			for i= 1 , 1 do

				if TargetOrgID == BuildingOrgID[1][i] then ------------------------------------------------------------------------------------------------------------------------------------------/*變數↓

					BuildingLV = i  --建築物等級
					BuildingNum = 1
					BStr_A = BuildStr[1]

				elseif TargetOrgID == BuildingOrgID[2][i] then 

					BuildingLV = i  --建築物等級
					BuildingNum = 2
					BStr_A = BuildStr[2]

				elseif TargetOrgID == BuildingOrgID[3][i] then 

					BuildingLV = i  --建築物等級
					BuildingNum = 3
					BStr_A = BuildStr[3]

				elseif TargetOrgID == BuildingOrgID[4][i] then 

					BuildingLV = i  --建築物等級
					BuildingNum = 4
					BStr_A = BuildStr[4]

				elseif TargetOrgID == BuildingOrgID[5][i] then 

					BuildingLV = i  --建築物等級
					BuildingNum = 5
					BStr_A = BuildStr[5]

				elseif TargetOrgID == BuildingOrgID[6][i] then 

					BuildingLV = i  --建築物等級
					BuildingNum = 6
					BStr_A = BuildStr[6]

				end
			end
	--Say( OwnerID() ,"BuildingLV="..BuildingLV )

			--*\此段判斷建築物等級

			local Technology = {  } --該建築物可學之Buff技能號碼清單

			if  BuildingNum == 1 then
				Technology = {  505251 } --【汲能塔】可學之Buff技能號碼清單

			elseif  BuildingNum == 2 then
				Technology = {  505251 } --【視覺幻鏡】可學之Buff技能號碼清單

			elseif  BuildingNum == 3 then
				Technology = {  505251  } --【榮譽之心】可學之Buff技能號碼清單

			elseif  BuildingNum == 4 then
				Technology = {  505255 , 505251 } --【聖光樹】可學之Buff技能號碼清單

			elseif  BuildingNum == 5 then
				Technology = {  505249 , 505786  } --【魔燄塔】可學之Buff技能號碼清單

			elseif  BuildingNum == 6 then
				Technology = {  505253 , 505787 } --【電能塔】可學之Buff技能號碼清單

			end-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------/*變數↑


			local NowBuff_A_LV = 0 --該玩家目前習得之BUFF_A_技能等級
			local NowBuff_B_LV = 0	--該玩家目前習得之BUFF_B_技能等級

			--*/

	--Say( OwnerID() ,"NowBuff_A_LV_1="..NowBuff_A_LV )
	--Say( OwnerID() ,"NowBuff_B_LV_1="..NowBuff_B_LV )

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

			if CheckBuff( OwnerID() , 501570) == false then  
				if CountMagic == 1 and (BuildingLV >= NowBuff_A_LV+1) then

					TransferSelect[0] = { "[SC_YU_GUILDWAR_BUILD_01]".."["..Techa.."]" } --研發科技-科技名稱LV1
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

					TransferSelect[0] = { "[SC_YU_GUILDWAR_BUILD_01]".."["..Techa.."]" }
					TransferSelect[1] = { "[SC_YU_GUILDWAR_BUILD_01]".."["..Techb.."]" }
					TransferSelect[2] = { "[SO_EXIT]" }				-- 離開對話

					DialogCreate( OwnerID() , EM_LuaDialogType_Select , BStr_A )
					AddBuff(OwnerID() , 501570,0,-1);
					for i = 0, table.getn( TransferSelect ) do
						DialogSelectStr( OwnerID() , TransferSelect[i][1] )
					end

				elseif CountMagic == 2 and (BuildingLV < NowBuff_A_LV+1) and (BuildingLV >= NowBuff_B_LV+1) then
		--Say( OwnerID() ,"D="..4 )

					TransferSelect[0] = { "[SC_YU_GUILDWAR_BUILD_01]".."["..Techa.."]".."(".."[SC_YU_GUILDWAR_BUILD_02]"..")" } --研發科技-科技名稱(研發完畢)
					TransferSelect[1] = { "[SC_YU_GUILDWAR_BUILD_01]".."["..Techb.."]" }
					TransferSelect[2] = { "[SO_EXIT]" }				-- 離開對話

					DialogCreate( OwnerID() , EM_LuaDialogType_Select , BStr_A )
					AddBuff(OwnerID() , 501570,0,-1);
					for i = 0, table.getn( TransferSelect ) do
						DialogSelectStr( OwnerID() , TransferSelect[i][1] )
					end

				elseif CountMagic == 2 and (BuildingLV >= NowBuff_A_LV+1) and (BuildingLV < NowBuff_B_LV+1) then
		--Say( OwnerID() ,"D="..5 )
					TransferSelect[0] = { "[SC_YU_GUILDWAR_BUILD_01]".."["..Techa.."]" }
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
					return 0
				end
				while true do
					Sleep(2)
					RunTime = RunTime + 1
					if RunTime > 60 then -- 閒置超過30秒,自動關閉視窗。
						ScriptMessage( PlayerID , PlayerID , 0 , "[SC_BK_BUFFNPC_08]", 0 )
						CancelBuff( OwnerID(), 501570 );--
						DialogClose( PlayerID )
						break
					end
					--2013.07.19 阿浩：將檢查能量與戰績由迴圈外變更為迴圈內，修正玩家點擊時，在能量或戰績不足的情況下，依然能夠選擇建築，導致能量為負值的問題。
					local Now_E = GetGuildWarEnergy(OwnerID()) --目前能量
					local Now_R =  CountBodyItem( OwnerID() , 206685 ) --目前戰績				
					--					
					-- 2013.06.28 阿浩:加入距離檢測，過遠時自動關閉視窗
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
							Beginplot( TargetID() ,"Yuyu_GuildWarBuliding_3_03", 0 )
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
							Beginplot( TargetID() ,"Yuyu_GuildWarBuliding_3_03", 0 )
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
			
			else--假如沒有玩家buff 501570
				ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );--視窗已經打開了
			end

		end --要判斷是否為公會成員時解除此end
	end
end

function Yuyu_GuildWarBuliding_3_03() -- 公會戰時，【功能塔】
--	Say( OwnerID() ,"OwnerID") --建築物
--	Say( TargetID() ,"TargetID") -- 玩家

	Beginplot( TargetID() ,"Yuyu_GuildWarBuliding_3_04", 0 )

end

function Yuyu_GuildWarBuliding_3_04() -- 公會戰時，【功能塔】

--	Say( OwnerID() ,"OwnerID") -- 玩家
--	Say( TargetID() ,"TargetID") --建築物
	----- 2011.11.11 修正開啟對話視窗後，碰觸據點的能量之源，施法條存在的同時，按下研發技術後，
	--造成該建築物無法再開啟對話視窗的問題，以及研發技術沒有升級，且扣除的能量與公會戰戰績不會歸還的問題。現在已被修正。
	local Player = OwnerID()
	local Tower = TargetID()
	local Step = 0
	-----
	local Energy = 50--能量
	local Record = 50--戰績

---*---以下判斷玩家是否有學習折扣技術
	local SetA = -1
	local SetB = -1			
	local Count = BuffCount ( Player)
	for i = 0 , Count do
		local BuffID = BuffInfo ( Player , i , EM_BuffInfoType_BuffID ) -- 基本法術ID
		if BuffID == 505313 then--績效學
			local BuffLv = BuffInfo ( Player , i , EM_BuffInfoType_Power )--該建築第 j 個BUFF的等級
			SetA = BuffLv
		elseif BuffID == 505312 then--節能學
			local BuffLv = BuffInfo ( Player , i , EM_BuffInfoType_Power )
			SetB = BuffLv
		end
	end

--	Say(  Tower ,"SetA  BuffLv ="..SetA )
--	Say(  Tower ,"SetB  BuffLv ="..SetB )

	if SetA>-1 then

		Record = Record*(1-((SetA+1)*0.05))
--		Say(  Tower ,"Record ="..Record )
		Record = math.ceil(Record)--小數點以下均捨去
--		Say(  Tower ,"math.ceil(Record) ="..Record )
	end
	if SetB>-1 then

		Energy = Energy*(1-((SetB+1)*0.05))
--		Say(  Tower ,"Energy ="..Energy )
		Energy = math.ceil(Energy)--小數點以下均捨去
--		Say(  Tower ,"math.ceil(Energy) ="..Energy )
	end

---*---↑
	local str = "[SC_YU_GUILDWAR_BUILD_28][$SETVAR1="..Energy.."][$SETVAR2="..Record.."]"
	local back = "[SC_YU_GUILDWAR_BUILD_29][$SETVAR1="..Energy.."][$SETVAR2="..Record.."]"
--	ScriptMessage( Player,Player,1,str,C_SYSTEM)	--研發開始，預先提存所需資源：能量50、戰績50
--	ScriptMessage( Player,Player,0,str,C_SYSTEM)	
--	AddGuildWarEnergy( Player , -Energy ) --扣除能量50
--	DelBodyItem( Player , 206685 , Record ) --扣除戰績50
	-- 2013.08.27 阿浩:研發時消耗的能量與戰績，由預先扣除調整為建造完成時扣除。
	ScriptMessage( Player , Player , 1 , "[SC_GUILDWAR_DEVELOPING_STARTED]" , C_SYSTEM )	--研發開始
	ScriptMessage( Player , Player , 0 , "[SC_GUILDWAR_DEVELOPING_STARTED]" , C_SYSTEM )
	--
	local TechLV = ReadRoleValue( Player  ,EM_RoleValue_Register+8 ) --所要研發的技術等級
	local Technology = ReadRoleValue( Player  ,EM_RoleValue_Register+9 ) --所要研發的技術

	local Zone = ReadRoleValue( Player , EM_RoleValue_ZoneID ) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )

	local truecast = 60			--/*科技研發所需時間
	local BookMagicID = 505308		--/*持書motion

	if (ReadRoleValue( Player , EM_RoleValue_Register ) ~= 0) or (ReadRoleValue( Tower , EM_RoleValue_Register ) == 1) then
		ScriptMessage( Player,Player,1,"[SYS_AUCTION_WAIT_NEXT]",0)	--忙碌中，請稍候再試。
		return
	end

	WriteRoleValue( Player , EM_RoleValue_Register, Tower ) --研發鎖定中
	WriteRoleValue( Tower , EM_RoleValue_Register, 1 ) --研發鎖定中
	WriteRoleValue( Player , EM_RoleValue_PID, 1 ) --研發鎖定中
	WriteRoleValue( Tower , EM_RoleValue_PID, 1 ) --研發鎖定中
	
	if BeginCastBar( Player, "["..Technology.."]" , truecast , ruFUSION_ACTORSTATE_READING_BEGIN , ruFUSION_ACTORSTATE_READING_END , 0 ) == 1 then	--/*開始施法

		AddBuff( Player , BookMagicID , 0 , -1 )		--使用書		
			
			while true do		
				sleep( 2 );		
				local CastBarStatus = CheckCastBar( Player );
				-- 2013.08.27 阿浩:研發時消耗的能量與戰績，由預先扣除調整為建造完成時扣除。
				local Now_E = GetGuildWarEnergy( Player ) --目前能量
				local Now_R = CountBodyItem( Player , 206685 ) --目前戰績
				--					
				if ( CastBarStatus ~= 0 ) then 		
					if ( CastBarStatus > 0) then -- 成功		
						result = "OKOK"		
						EndCastBar( Player , CastBarStatus )		
						break;		
					elseif ( CastBarStatus < 0 ) then -- 失敗		
						result = "DAME"		
						EndCastBar( Player , CastBarStatus )		
						break;		
					end
				-- 2013.08.27 阿浩:研發時消耗的能量與戰績，由預先扣除調整為建造完成時扣除。
				elseif (CheckID( Tower ) == false) or Now_E < Energy or Now_R < Record then		
					result = "DAME"		
					EndCastBar( Player , CastBarStatus )		
					break;		
				else		
					AddBuff( Player , BookMagicID , 0 , -1 )		--使用書		
				end		
			end	
				
			if ( result == "OKOK" ) then		
				if CheckID( Tower ) == true then
					-- 2013.08.27 阿浩:研發時消耗的能量與戰績，由預先扣除調整為建造完成時扣除。
					AddGuildWarEnergy( Player , -Energy )	--扣除能量
					DelBodyItem( Player , 206685 , Record )	--扣除戰績
					ScriptMessage( Player , Player , 1 , "[SC_GUILDWAR_DEVELOPING_COMPLETED][$SETVAR1="..Energy.."][$SETVAR2="..Record.."]" , C_SYSTEM )	--研發完成：消耗能量[$VAR1]、戰績[$VAR2]
					ScriptMessage( Player , Player , 0 , "[SC_GUILDWAR_DEVELOPING_COMPLETED][$SETVAR1="..Energy.."][$SETVAR2="..Record.."]" , C_SYSTEM )
					--	
					CastSpell( Player, Player ,491010) -- 研發完畢共用特效		
					CancelBuff( Player , BookMagicID )		
					CancelBuff( Tower , Technology )		
					AddBuff( Tower , Technology , TechLV , -1 )	--本次研發之科技		

					local TechNAME = "|cffffff00".."["..Technology.."]".."[U_LV]"..(TechLV+1).."|r"		
					--Say(Player,TechNAME)		
					local str = "[SC_YU_GUILDWAR_BUILD_04][$SETVAR1=".."]"--[$VAR1] 已成功的研發完畢。		
					--Say(Player,str)		
					ScriptMessage( Player,Player,1,TechNAME..str,0)	--研發完畢		
					ScriptMessage( Player,Player,0,TechNAME..str,0)	--研發完畢		
					WriteRoleValue( Tower , EM_RoleValue_Register, 0 ) --解除鎖定可再次研發		
					WriteRoleValue( Tower , EM_RoleValue_PID, 0 ) --解除鎖定可再次研發		
				end		
				WriteRoleValue( Player , EM_RoleValue_Register, 0 ) --解除鎖定可再次研發		
				WriteRoleValue( Player , EM_RoleValue_PID, 0 ) --解除鎖定可再次研發		
				WriteRoleValue( Player  , EM_RoleValue_Register+8 , 0  ) --清空要研發的技術等級		
				WriteRoleValue( Player  , EM_RoleValue_Register+9 , 0  ) --清空要研發的技術		

			elseif ( result == "DAME" ) then
				Step = 1
			end		
	--	end	-- 2011.11.11 遮蔽
	else	-- 2011.11.11
		Step = 2
	end
	
	if Step >= 1 then
		WriteRoleValue( Player , EM_RoleValue_Register, 0 ) --解除鎖定可再次研發		
		WriteRoleValue( Tower , EM_RoleValue_Register, 0 ) --解除鎖定可再次研發		
		WriteRoleValue( Player , EM_RoleValue_PID, 0 ) --解除鎖定可再次研發		
		WriteRoleValue( Tower , EM_RoleValue_PID, 0 ) --解除鎖定可再次研發		
		WriteRoleValue( Tower , EM_RoleValue_Register+8 ,  0  ) --清空要研發的技術等級		
		WriteRoleValue( Player , EM_RoleValue_Register+9 ,  0  ) --清空要研發的技術		
		CancelBuff( Player , BookMagicID )
		-- 2013.08.27 阿浩:研發時消耗的能量與戰績，由預先扣除調整為建造完成時扣除。
		ScriptMessage( Player , Player , 1 , "[SC_GUILDWAR_DEVELOPING_FAILED]" , C_RED )	--研發失敗
		ScriptMessage( Player , Player , 0 , "[SC_GUILDWAR_DEVELOPING_FAILED]" , C_RED )
		--						
	--	ScriptMessage( Player,Player,1,back,C_SYSTEM)	--研發中斷，歸還預存資源：能量50、戰績50		
	--	ScriptMessage( Player,Player,0,back,C_SYSTEM)		
	--	GiveBodyItem( Player , 206685 , Record ) --返還戰績50	
	--	AddGuildWarEnergy( Player , Energy ) --返還能量50
	--	if Step > 1 then
	--		ScriptMessage( Player , Player , 1 , "[SC_BEER_2011_FN09]" , 0 )	-- 你無法這樣做
	--		ScriptMessage( Player , Player , 0 , "[SC_BEER_2011_FN09]" , 0 )	-- 你無法這樣做
	--	end
	end
end

--==================================================================================================================

-- 2012.0711 新增王座id ( 5.0.2 )
function Yuyu_GuildWarBuliding_king_01() -- 公會戰時，【王座】功能

	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )
	
--	local objid = { 111780 }   -- lv1  lv2 , lv3
--	local mallid =  { 120879, 121242  , 121247,  121252}  -- mall01 , mall02 , mall03, mall04
		
	if ZoneID == 402 then
		local TargetOrgID = ReadRoleValue( OwnerID() ,EM_RoleValue_OrgID ) --目前建築物之OrgID
		-- 2013.10.24 阿浩:修正6.0.3後新增的城堡外觀，在公會城戰開始後，點擊王座時不會出現商店的問題
		-- 王座
		local Throne = {
				111780 ,	-- 一二三階
				120879 ,	-- 商城外觀1
				121242 ,	-- 商城外觀2
				121247 ,	-- 商城外觀3
				121252 ,	-- 商城外觀4
				122264 ,	-- 商城外觀5
				122269 ,	-- 商城外觀6
				122274		-- 商城外觀7
						}

		for i = 1 , #Throne , 1 do
			if TargetOrgID == Throne[i] then
	--	if TargetOrgID == objid[1]  or  TargetOrgID == mallid[1]  or  TargetOrgID == mallid[2] or  TargetOrgID == mallid[3] or  TargetOrgID == mallid[4] then ---------------------------------------------------------------------/*變數↓
	  			SetMinimapIcon ( OwnerID(), EM_MapIconType_GuildMan );
				SetShop( OwnerID() , 600179 , "Test_Shop_Close" );--王座shop
				SetCursorType( OwnerID() , eCursor_Shop ); --游標變成 齒輪
				SetPlot( OwnerID() , "touch" , "Yuyu_GuildWarBuliding_king_02" , 100 )	--公會城戰時
				SetModeEx( OwnerID() , EM_SetModeType_Mark, true )--標記
				SetModeEx( OwnerID() , EM_SetModeType_HideName, false )--名稱
				SetModeEx( OwnerID() , EM_SetModeType_ShowRoleHead, true )--頭像框
				SetModeEx( OwnerID() , EM_SetModeType_Fight , true )--可砍殺攻擊
				SetModeEx( OwnerID() , EM_SetModeType_Move, false )--移動
				SetModeEx( OwnerID() , EM_SetModeType_Obstruct, true )--阻擋
				SetModeEx( OwnerID() , EM_SetModeType_Strikback, false )--反擊
				SetModeEx( OwnerID() , EM_SetModeType_DisableRotate, true )--轉向
				SetModeEx( OwnerID() , EM_SetModeType_Searchenemy, false )--索敵
				SetModeEx( OwnerID() , EM_SetModeType_NotShowHPMP, true )--不顯示血條
				AddBuff( OwnerID() , 505921 , 89 , -1 )	--90%	--被玩家攻擊傷害折扣 法術等級 0 = 1%	
				AddBuff( OwnerID() , 502707 , 1 , -1 ) --非戰鬥中不回血的buff (ownerID,buff,LV,Time)
				WriteRoleValue( OwnerID()  , EM_RoleValue_Register+1 ,  38  )--紀錄為大型建築物---***
				break
			end
		end
	end
end
function Yuyu_GuildWarBuliding_king_02() -- 公會戰時，【王座】功能
	local VOC = ReadRoleValue( OwnerID() , EM_RoleValue_VOC )--職業
	local PassCard =  CountBodyItem( OwnerID() , 206769 ) --是否具有通行證 = GM測試
	local RoomID = ReadRoleValue( TargetID(), EM_RoleValue_RoomID )
	local PlayerGuildID = ReadRoleValue( OwnerID() ,   EM_RoleValue_GuildID ) 
	local BuildingGuildID = ReadRoleValue( TargetID() ,   EM_RoleValue_GuildID ) 

	if PlayerGuildID ~= BuildingGuildID then
		ScriptMessage( TargetID() , OwnerID() , 1 , "[GUILD_REMINDER]", C_SYSTEM ) --你不是此公會的成員
		ScriptMessage( TargetID() , OwnerID() , 0 , "[GUILD_REMINDER]", C_SYSTEM ) 
	else
		OpenShop()
	end
end