-------------------------------------------------------------------------------------------------------

--農場掛產物

-------------------------------------------------------------------------------------------------------
function NewGuildFarmForProduct()	--農場掛產物
	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID)
	local RoomID = ReadRoleValue( TargetID(), EM_RoleValue_RoomID )
	local ZoneID = Zone-1000*math.floor( Zone/1000 )
	local ClickObj = ReadRoleValue(OwnerID(),EM_RoleValue_OrgID)
	local TempX

	if GuildCheckTimer == nil then
		GuildCheckTimer = {}
	end
	if GuildCheckTimer[RoomID] == nil then
		GuildCheckTimer[RoomID] = CreateObjbyObj(113693,OwnerID())	--隱形物件來掛檢查用的共用事件
		SetModeEx( GuildCheckTimer[RoomID], EM_SetModeType_HideName, false )
		SetModeEx( GuildCheckTimer[RoomID], EM_SetModeType_Mark, false )
		BeginPlot( GuildCheckTimer[RoomID], "GuildProductBuildingCheck", 0 )  --啟動共用事件
	end

	if (ZoneID == 402) or (ZoneID == 47)  then
		SetModeEx( OwnerID()   , EM_SetModeType_Mark, true )--標記
		SetModeEx( OwnerID()  , EM_SetModeType_HideName, false )--名稱
		SetModeEx( OwnerID() , EM_SetModeType_ShowRoleHead, true )--頭像框
		SetModeEx( OwnerID() , EM_SetModeType_Fight , true )--可砍殺攻擊
		SetModeEx( OwnerID()  , EM_SetModeType_Move, false )--移動
		SetModeEx( OwnerID() , EM_SetModeType_Obstruct, true )--阻擋
		SetModeEx( OwnerID()  , EM_SetModeType_Strikback, false )--反擊
		SetModeEx( OwnerID() , EM_SetModeType_DisableRotate, true )--轉向
		SetModeEx( OwnerID() , EM_SetModeType_Searchenemy, false )--索敵
		SetModeEx( OwnerID() , EM_SetModeType_NotShowHPMP, true )--不顯示血條
		AddBuff( OwnerID() , 505921 , 69, -1 )	--70%	--被玩家攻擊傷害折扣 法術等級 0 = 1%	
		AddBuff( OwnerID() , 505516 , 99, -1 )	--100%	--被NPC攻擊傷害增加 法術等級 0 = 1%	
		AddBuff( OwnerID() ,502707 ,1 ,-1 ); --非戰鬥中不回血的buff (ownerID,buff,LV,Time)
		WriteRoleValue( OwnerID()  , EM_RoleValue_Register+1 ,  38  )--紀錄為大型建築物---***
		SetPlot( OwnerID() , "touch" , "Yuyu_GuildWarBuliding_2_02" , 100 )	--公會城戰時		
		SetCursorType( OwnerID() , eCursor_Interact ); --游標變成 齒輪
		SetPlot(  OwnerID(), "dead","Lua_GUILDWAR_BuildDScript_0",0 )     --死亡劇情
	else
		if ClickObj  == 112810 then	--1"0"~1"9"對應建築物等級1~10
			TempX = 10
		elseif ClickObj  == 112811 then
			TempX = 11
		elseif ClickObj  == 112812 then
			TempX = 12
		elseif ClickObj  == 112813 then
			TempX = 13	
		elseif ClickObj  == 112814 then
			TempX = 14		
		elseif ClickObj  == 112815 then
			TempX = 15
		elseif ClickObj  == 112816 then
			TempX = 16
		elseif ClickObj  == 112817 then
			TempX = 17		
		elseif ClickObj  == 112818 then
			TempX = 18	
		elseif ClickObj  == 112819 then
			TempX = 19		
		end
		SetPlot( OwnerID() , "touch" , "NewGuildFarmForProduct1" , 100 )		
		WriteRoleValue( OwnerID()  , EM_RoleValue_Register10 , TempX ) --TempX 寫為1X表示農田，寫為2X表示伐木場，寫為3X表示冶煉廠
	end
end
-------------------------------------------------------------------------------------------------------
function NewGuildFarmForProduct1()	---給農場的觸碰事件
	local RoomID = ReadRoleValue( TargetID(), EM_RoleValue_RoomID )
	local PlayerGuildID = ReadRoleValue( OwnerID() ,   EM_RoleValue_GuildID ) 
	local BuildingGuildID = ReadRoleValue( TargetID() ,   EM_RoleValue_GuildID ) 
	local TempInt = ReadRoleValue( TargetID() , EM_RoleValue_Register10)
	local Count = 0
	
	if PlayerGuildID ~= BuildingGuildID then	--判斷是不是同公會
		ScriptMessage( TargetID() , OwnerID() , 1 , "[GUILD_REMINDER]", C_SYSTEM ) 
		ScriptMessage( TargetID() , OwnerID() , 0 , "[GUILD_REMINDER]", C_SYSTEM ) 
	else
		if GuildFarmer[RoomID][2] >= GuildFarmer[RoomID][1]  then --[1]是上限，[2]是使用人數
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[GUILD_FARM3]", C_SYSTEM ) 
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[GUILD_FARM3]", C_SYSTEM ) 

		elseif  GuildFarmer[RoomID][2] < GuildFarmer[RoomID][1]  then
			local PlayerLV=ReadRoleValue( OwnerID() , EM_RoleValue_LV)
			local Itemget =  CheckFlag( OwnerID()  , 540025 ) --今天領取過 農耕工具
			local Tools =  CountBodyItem( OwnerID() , 204831 )  --農耕器具
			local SS = 0	--計算所需時間

			--以下為玩家等級與工作耗時
			--基礎360秒，每5級減少30秒sww
			--如果玩家等級超過51會導致計算結果會低於60秒，則直接設為60秒
			if PlayerLV >= 51 then
				SS = 600
			else
				SS = math.floor(PlayerLV/5)
				SS = (360-(SS*30))*10
			end
			--檢查是否領取每日工作工具，並檢查工具是否耗盡。
			if Itemget == false then
				GiveBodyItem( OwnerID() ,  204831  , 99 ) --給農耕器具
				SetFlag( OwnerID()  , 540025 , 1 ) -- 今天已領取旗標
				BeginPlot( OwnerID() , "NewGuildFarmForProduct1" , 0 )
				return
			end
			if Itemget == TRUE and Tools ~= 0 then
				AddBuff(OwnerID() ,502308,TempInt-10,SS) 
				WriteRoleValue(OwnerID()  , EM_RoleValue_Register10 , TempInt)	--把建築物的 Register 寫到玩家身上，避免接下來用 BeginPlot 的時候出問題
				if BeginCastBarEvent( OwnerID(), OwnerID() , "[GUILD_FARM1]", SS, ruFUSION_ACTORSTATE_MINING_BEGIN, ruFUSION_ACTORSTATE_MINING_END , 0 , "NewGuildFarmForProduct2") ~= 1 then
					CancelBuff( OwnerID(),  502308)
				else
					AttachCastMotionTool( OwnerID(), 210508 ); --CastingBar觸發成功，置換武器為圓鍬
				end
			else
				ScriptMessage( OwnerID(), OwnerID(), 1, "[GUILD_FACTORY4]" , C_SYSTEM )--你已辛勤的運用完所有的生產器具，<CB>明天</CB>將獲得新的配額。
				ScriptMessage( OwnerID(), OwnerID(), 0, "[GUILD_FACTORY4]" , C_SYSTEM )--你已辛勤的運用完所有的生產器具，<CB>明天</CB>將獲得新的配額。
			end
		end
	end
end
-------------------------------------------------------------------------------------------------------
function NewGuildFarmForProduct2( ObjID, CheckStatus )	--農場掛產物 ---要rand很多種產物
	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			-- 成功
			EndCastBar( OwnerID(), CheckStatus );
			local PlayerID = TargetID()
			local NeedSpace = 1
			local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
			local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )
			local Item = {204784,
				         204827,
				         204828,
				         205216,
				         205217,
				         205218,
				         205219,
				         205220,
				         205221,
				         205222}
			--
			local BuildLV = FN_CountBuffLevel(PlayerID,502308)	 --計算玩家Buff等級來決定要給予什麼
			BuildLV = BuildLV+1
			--
			if ( NeedSpaceStatus  == true ) then
				GiveBodyItem( PlayerID , Item[BuildLV] , 1 )	 
				DelBodyItem( PlayerID , 204831 , 1 )--減少一個農耕工具
				ScriptMessage( PlayerID, PlayerID, 1, "[GUILD_FARM2]" , C_SYSTEM )--經過了辛勤地耕種，你獲得了藥草。
				CancelBuff( PlayerID,  502308)
				GuildFarmer[RoomID][2] = GuildFarmer[RoomID][2] - 1
				BeginPlot( PlayerID , "NewGuildFarmForProduct1" , 0 )
			else
				ScriptMessage( PlayerID, PlayerID, 1, "[SC_DAN_111700_22]" , C_SYSTEM )
			end
		else
			-- 失敗
			WriteRoleValue(OwnerID()  , EM_RoleValue_Register10 , 0)
			CancelBuff( OwnerID(),  502308)
			EndCastBar( OwnerID(), CheckStatus )
		end
	end


end