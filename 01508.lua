function Yu_Guild_War_Builging_Bron_00()

	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )

	if (ZoneID == 402) or (ZoneID == 47)  then

		SetModeEx( OwnerID()   , EM_SetModeType_Mark, true )--標記
		SetModeEx( OwnerID()  , EM_SetModeType_HideName, false )--名稱
		SetModeEx( OwnerID() , EM_SetModeType_ShowRoleHead, true )--頭像框
		SetModeEx( OwnerID() , EM_SetModeType_Fight , true )--可砍殺攻擊
		SetModeEx( OwnerID()  , EM_SetModeType_Move, false )--移動
		SetModeEx( OwnerID() , EM_SetModeType_Obstruct, true )--阻擋
		SetModeEx( OwnerID()  , EM_SetModeType_Strikback, false )--反擊
		SetModeEx( OwnerID() , EM_SetModeType_DisableRotate, false )--轉向
		SetModeEx( OwnerID() , EM_SetModeType_Searchenemy, false )--索敵
		SetModeEx( OwnerID() , EM_SetModeType_NotShowHPMP, false )--顯示血條
		AddBuff( OwnerID() , 505921 , 69, -1 )	--70%	--被玩家攻擊傷害折扣 法術等級 0 = 1%	
		AddBuff( OwnerID() ,502707 ,1 ,-1 ); --非戰鬥中不回血的buff (ownerID,buff,LV,Time)

	end

end

function BuffTower_Invincible_Attack()-- 無敵強攻塔 all
	local PlayerGuildID = ReadRoleValue( OwnerID() ,   EM_RoleValue_GuildID  ) 
	local BuildingGuildID = ReadRoleValue( TargetID() ,   EM_RoleValue_GuildID  ) 
	local ClickObj = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	local RoomID = ReadRoleValue( TargetID(), EM_RoleValue_RoomID )
	local Situation = ReadGuildBuilding( TargetID()  , EM_GuildBuildValueType_IsActive)
	--local Situation1 = ReadGuildBuilding( TargetID()  , EM_GuildBuildValueType_BuildingDBID)
	--local Situation2 = ReadGuildBuilding( TargetID()  , EM_GuildBuildValueType_Value1)
	--local Situation3 = ReadGuildBuilding( TargetID()  , EM_GuildBuildValueType_Value2)
	--local Situation4 = ReadGuildBuilding( TargetID()  , EM_GuildBuildValueType_Value3)
	local TowerID =  {111631,
			    111641,
			    111651,
			    111661,
			    111671,
			    111681,
			    111691,
			    111701,
			    111711,
			    111721}
	if Situation == 1 then 
		--Addbuff( TargetID() , 504340 , 1 , -1 )
--Say(TargetID(), "1:" .. Situation1)
--Say(TargetID(), "2")
--Say(TargetID(), "2:" .. Situation)
--Say(TargetID(), "3:" .. Situation2)
--Say(TargetID(), "4:" .. Situation3)
--Say(TargetID(), "5:" .. Situation4)	
		if PlayerGuildID ~= BuildingGuildID then
			SetSpeakDetail(OwnerID(), "[GUILD_REMINDER]" )
		else
			for i = 1, 10, 1 do 			
				if ClickObj  == TowerID[i] then
					LoadQuestOption( OwnerID() )	--載入任務模板
					AddSpeakOption( OwnerID() , TargetID() , "[SC_BUFFTOWER_01]" , "BuffTower_Invincible_Attack_GetBuff" , 0 )--選項，領取「無敵強攻」的增益狀態
				end
			end
		end
	elseif Situation == 0 then
	--	CancelBuff( TargetID() ,504340 )
--Say(TargetID(), "1:" .. Situation1)
--Say(TargetID(), "2")
--Say(TargetID(), "2:" .. Situation)
--Say(TargetID(), "3:" .. Situation2)
--Say(TargetID(), "4:" .. Situation3)
--Say(TargetID(), "5:" .. Situation4)
--Say(OwnerID(), "1")
--Say(TargetID(), "2")		
		SetSpeakDetail( OwnerID(), "[GUILD_REMINDER2]" )

	end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function BuffTower_Invincible_Attack_GetBuff()--領取「無敵強攻」的增益狀態
--Say(OwnerID(),"5") --player
--Say(TargetID(),"6") --tower
	local ClickObj = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	local RoomID = ReadRoleValue( TargetID(), EM_RoleValue_RoomID)

	local TowerID =  {111631, --Lv1
			    111641, --Lv2
			    111651, --Lv3
			    111661, --Lv4
			    111671, --Lv5
			    111681, --Lv6
			    111691, --Lv7
			    111701, --Lv8
			    111711, --Lv9
			    111721} --Lv10

	local BuffID =      {492051, --Lv1
			    492061, --Lv2
			    492071, --Lv3
			    492081, --Lv4
			    492091, --Lv5
			    492101, --Lv6
			    492111, --Lv7
			    492121, --Lv8
			    492131, --Lv9
			    492141} --Lv10

	local Buff2ID =   {502251, --Lv1
			    502261, --Lv2
			    502271, --Lv3
			    502281, --Lv4
			    502291, --Lv5
			    502301, --Lv6
			    502311, --Lv7
			    502321, --Lv8
			    502331, --Lv9
			    502341} --Lv10	
	
		for i = 1, 10, 1 do 
			if ClickObj  == TowerID[i] then
				--2015/05/26 改為領取Buff時不判斷現有狀態
				--if CheckBuff( OwnerID() ,Buff2ID[i] ) == false then
					CloseSpeak( OwnerID() )	--關閉對話視窗
					CastSpell( OwnerID() , OwnerID() , 491032)			
					CastSpell( TargetID() , OwnerID() , BuffID[i] )
				--elseif CheckBuff( OwnerID() ,Buff2ID[i] ) == true then
					--CloseSpeak( OwnerID() )	--關閉對話視窗
					--ScriptMessage( OwnerID(),OwnerID(),1,"[SC_BUFFTOWER_07]",0)	
				--end
			end
		end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function BuffTower_Perfect_Defense()-- 絕對防壁塔all
	local PlayerGuildID = ReadRoleValue( OwnerID() ,   EM_RoleValue_GuildID  ) 
	local BuildingGuildID = ReadRoleValue( TargetID() ,   EM_RoleValue_GuildID  ) 
	local ClickObj = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	local Situation = ReadGuildBuilding( TargetID()  , EM_GuildBuildValueType_IsActive)
	local RoomID = ReadRoleValue( TargetID(), EM_RoleValue_RoomID )
	local TowerID =  {111632, --Lv1
			    111642, --Lv2
			    111652, --Lv3
			    111662, --Lv4
			    111672, --Lv5
			    111682, --Lv6
			    111692, --Lv7
			    111702, --Lv8
			    111712, --Lv9
			    111722} --Lv10
	if Situation == 1 then 
	--	Addbuff( TargetID() , 504340 , 1 , -1 )
	
		if PlayerGuildID ~= BuildingGuildID then
			SetSpeakDetail(OwnerID(), "[GUILD_REMINDER]" )
		else
			for i = 1, 10, 1 do 
				if ClickObj  == TowerID[i] then
					LoadQuestOption( OwnerID() )	--載入任務模板
					AddSpeakOption( OwnerID() , TargetID() , "[SC_BUFFTOWER_02]" , "BuffTower_Perfect_Defense_GetBuff" , 0 )--選項，領取「絕對防壁」的增益狀態
				end
			end
		end
	elseif Situation == 0 then
--Say(OwnerID(), "1")
--Say(TargetID(), "2")
	--	CancelBuff( TargetID() ,504340 )		
		SetSpeakDetail( OwnerID(), "[GUILD_REMINDER2]" )

	end
	
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function BuffTower_Perfect_Defense_GetBuff()--領取「絕對防壁」的增益狀態
	local ClickObj = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	local RoomID = ReadRoleValue( TargetID(), EM_RoleValue_RoomID)

	local TowerID =  {111632, --Lv1
			    111642, --Lv2
			    111652, --Lv3
			    111662, --Lv4
			    111672, --Lv5
			    111682, --Lv6
			    111692, --Lv7
			    111702, --Lv8
			    111712, --Lv9
			    111722} --Lv10

	local BuffID =      {492052, --Lv1
			    492062, --Lv2
			    492072, --Lv3
			    492082, --Lv4
			    492092, --Lv5
			    492102, --Lv6
			    492112, --Lv7
			    492122, --Lv8
			    492132, --Lv9
			    492142} --Lv10

	local Buff2ID =   {502252, --Lv1
			    502262, --Lv2
			    502272, --Lv3
			    502282, --Lv4
			    502292, --Lv5
			    502302, --Lv6
			    502312, --Lv7
			    502322, --Lv8
			    502332, --Lv9
			    502342} --Lv10	
	
		for i = 1, 10, 1 do 
			if ClickObj  == TowerID[i] then
				--2015/05/26 改為領取Buff時不判斷現有狀態
				--if CheckBuff( OwnerID() ,Buff2ID[i] ) == false then
					CloseSpeak( OwnerID() )	--關閉對話視窗
					CastSpell( OwnerID() , OwnerID() , 491032)			
					CastSpell( TargetID() , OwnerID() , BuffID[i] )
				--elseif CheckBuff( OwnerID() ,Buff2ID[i] ) == true then
					--CloseSpeak( OwnerID() )	--關閉對話視窗
					--ScriptMessage( OwnerID(),OwnerID(),1,"[SC_BUFFTOWER_07]",0)	
				--end
			end
		end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function BuffTower_Magic_Protection()-- 魔幻護體all
	local PlayerGuildID = ReadRoleValue( OwnerID() ,   EM_RoleValue_GuildID  ) 
	local BuildingGuildID = ReadRoleValue( TargetID() ,   EM_RoleValue_GuildID  ) 
	local ClickObj = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	local Situation = ReadGuildBuilding( TargetID()  , EM_GuildBuildValueType_IsActive)
	local RoomID = ReadRoleValue( TargetID(), EM_RoleValue_RoomID )
	local TowerID =  {111633, --Lv1
			    111643, --Lv2
			    111653, --Lv3
			    111663, --Lv4
			    111673, --Lv5
			    111683, --Lv6
			    111693, --Lv7
			    111703, --Lv8
			    111713, --Lv9
			    111723} --Lv10
	if Situation == 1 then 	
	--	Addbuff( TargetID() , 504340 , 1 , -1 )

		if PlayerGuildID ~= BuildingGuildID then
			SetSpeakDetail(OwnerID(), "[GUILD_REMINDER]" )
		else
			for i = 1, 10, 1 do 
				if ClickObj  == TowerID[i] then
					LoadQuestOption( OwnerID() )	--載入任務模板
					AddSpeakOption( OwnerID() , TargetID() , "[SC_BUFFTOWER_03]" , "BuffTower_Magic_Protection_GetBuff" , 0 )--選項，領取「絕對防壁」的增益狀態
				end
			end
		end
	elseif Situation == 0 then
--Say(OwnerID(), "1")
--Say(TargetID(), "2")
	--	CancelBuff( TargetID() ,504340 )		
		SetSpeakDetail( OwnerID(), "[GUILD_REMINDER2]" )

	end
	
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function BuffTower_Magic_Protection_GetBuff()--領取「魔幻護體」的增益狀態
	local ClickObj = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	local RoomID = ReadRoleValue( TargetID(), EM_RoleValue_RoomID)

	local TowerID =  {111633, --Lv1
			    111643, --Lv2
			    111653, --Lv3
			    111663, --Lv4
			    111673, --Lv5
			    111683, --Lv6
			    111693, --Lv7
			    111703, --Lv8
			    111713, --Lv9
			    111723} --Lv10

	local BuffID =      {492053, --Lv1
			    492063, --Lv2
			    492073, --Lv3
			    492083, --Lv4
			    492093, --Lv5
			    492103, --Lv6
			    492113, --Lv7
			    492123, --Lv8
			    492133, --Lv9
			    492143} --Lv10
	
	local Buff2ID =   {502253, --Lv1
			    502263, --Lv2
			    502273, --Lv3
			    502283, --Lv4
			    502293, --Lv5
			    502303, --Lv6
			    502313, --Lv7
			    502323, --Lv8
			    502333, --Lv9
			    502343} --Lv10	
	
		for i = 1, 10, 1 do 
			if ClickObj  == TowerID[i] then
				--2015/05/26 改為領取Buff時不判斷現有狀態
				--if CheckBuff( OwnerID() ,Buff2ID[i] ) == false then
					CloseSpeak( OwnerID() )	--關閉對話視窗
					CastSpell( OwnerID() , OwnerID() , 491032)			
					CastSpell( TargetID() , OwnerID() , BuffID[i] )
				--elseif CheckBuff( OwnerID() ,Buff2ID[i] ) == true then
					--CloseSpeak( OwnerID() )	--關閉對話視窗
					--ScriptMessage( OwnerID(),OwnerID(),1,"[SC_BUFFTOWER_07]",0)	
				--end
			end
		end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function BuffTower_Speed_Growth()--飛快成長all
	local PlayerGuildID = ReadRoleValue( OwnerID() ,   EM_RoleValue_GuildID  ) 
	local BuildingGuildID = ReadRoleValue( TargetID() ,   EM_RoleValue_GuildID  ) 
	local ClickObj = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	local Situation = ReadGuildBuilding( TargetID()  , EM_GuildBuildValueType_IsActive)

	local RoomID = ReadRoleValue( TargetID(), EM_RoleValue_RoomID )
	local TowerID =  {111634, --Lv1
			    111644, --Lv2
			    111654, --Lv3
			    111664, --Lv4
			    111674, --Lv5
			    111684, --Lv6
			    111694, --Lv7
			    111704, --Lv8
			    111714, --Lv9
			    111724} --Lv10
	if Situation == 1 then 	
		--Addbuff( TargetID() , 504340 , 1 , -1 )

		if PlayerGuildID ~= BuildingGuildID then
			SetSpeakDetail(OwnerID(), "[GUILD_REMINDER]" )
		else
			for i = 1, 10, 1 do 
				if ClickObj  == TowerID[i] then
					LoadQuestOption( OwnerID() )	--載入任務模板
					AddSpeakOption( OwnerID() , TargetID() , "[SC_BUFFTOWER_04]" , "BuffTower_Speed_Growth_GetBuff" , 0 )--選項，領取「絕對防壁」的增益狀態
				end
			end
		end
	elseif Situation == 0 then
--Say(OwnerID(), "1")
--Say(TargetID(), "2")
	--	CancelBuff( TargetID() ,504340 )		
		SetSpeakDetail( OwnerID(), "[GUILD_REMINDER2]" )

	end
	
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function BuffTower_Speed_Growth_GetBuff()--領取「飛快成長」的增益狀態
	local ClickObj = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	local RoomID = ReadRoleValue( TargetID(), EM_RoleValue_RoomID)

	local TowerID =  {111634, --Lv1
			    111644, --Lv2
			    111654, --Lv3
			    111664, --Lv4
			    111674, --Lv5
			    111684, --Lv6
			    111694, --Lv7
			    111704, --Lv8
			    111714, --Lv9
			    111724} --Lv10

	local BuffID =      {492054, --Lv1
			    492064, --Lv2
			    492074, --Lv3
			    492084, --Lv4
			    492094, --Lv5
			    492104, --Lv6
			    492114, --Lv7
			    492124, --Lv8
			    492134, --Lv9
			    492144} --Lv10
	
	local Buff2ID =   {502254, --Lv1
			    502264, --Lv2
			    502274, --Lv3
			    502284, --Lv4
			    502294, --Lv5
			    502304, --Lv6
			    502314, --Lv7
			    502324, --Lv8
			    502334, --Lv9
			    502344} --Lv10	
	
		for i = 1, 10, 1 do 
			if ClickObj  == TowerID[i] then
				--2015/05/26 改為領取Buff時不判斷現有狀態
				--if CheckBuff( OwnerID() ,Buff2ID[i] ) == false then
					CloseSpeak( OwnerID() )	--關閉對話視窗
					CastSpell( OwnerID() , OwnerID() , 491032)			
					CastSpell( TargetID() , OwnerID() , BuffID[i] )
				--elseif CheckBuff( OwnerID() ,Buff2ID[i] ) == true then
					--CloseSpeak( OwnerID() )	--關閉對話視窗
					--ScriptMessage( OwnerID(),OwnerID(),1,"[SC_BUFFTOWER_07]",0)	
				--end
			end
		end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function BuffTower_Increased_Learning()--高速學習all
	local PlayerGuildID = ReadRoleValue( OwnerID() ,   EM_RoleValue_GuildID  ) 
	local BuildingGuildID = ReadRoleValue( TargetID() ,   EM_RoleValue_GuildID  ) 
	local ClickObj = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	local Situation = ReadGuildBuilding( TargetID()  , EM_GuildBuildValueType_IsActive)

	local RoomID = ReadRoleValue( TargetID(), EM_RoleValue_RoomID )
	local TowerID =  {111635, --Lv1
			    111645, --Lv2
			    111655, --Lv3
			    111665, --Lv4
			    111675, --Lv5
			    111685, --Lv6
			    111695, --Lv7
			    111705, --Lv8
			    111715, --Lv9
			    111725} --Lv10
	if Situation == 1 then 	
	--	Addbuff( TargetID() , 504340 , 1 , -1 )

		if PlayerGuildID ~= BuildingGuildID then
			SetSpeakDetail(OwnerID(), "[GUILD_REMINDER]" )
		else
			for i = 1, 10, 1 do 
				if ClickObj  == TowerID[i] then
					LoadQuestOption( OwnerID() )	--載入任務模板
					AddSpeakOption( OwnerID() , TargetID() , "[SC_BUFFTOWER_05]" , "BuffTower_Increased_Learning_GetBuff" , 0 )--選項，領取「絕對防壁」的增益狀態
				end
			end
		end
	elseif Situation == 0 then
--Say(OwnerID(), "1")
--Say(TargetID(), "2")
		--CancelBuff( TargetID() ,504340 )		
		SetSpeakDetail( OwnerID(), "[GUILD_REMINDER2]" )

	end
	
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function BuffTower_Increased_Learning_GetBuff()--領取「高速學習」的增益狀態
	local ClickObj = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	local RoomID = ReadRoleValue( TargetID(), EM_RoleValue_RoomID)

	local TowerID =  {111635, --Lv1
			    111645, --Lv2
			    111655, --Lv3
			    111665, --Lv4
			    111675, --Lv5
			    111685, --Lv6
			    111695, --Lv7
			    111705, --Lv8
			    111715, --Lv9
			    111725} --Lv10

	local BuffID =      {492055, --Lv1
			    492065, --Lv2
			    492075, --Lv3
			    492085, --Lv4
			    492095, --Lv5
			    492105, --Lv6
			    492115, --Lv7
			    492125, --Lv8
			    492135, --Lv9
			    492145} --Lv10
	
	local Buff2ID =   {502255, --Lv1
			    502265, --Lv2
			    502275, --Lv3
			    502285, --Lv4
			    502295, --Lv5
			    502305, --Lv6
			    502315, --Lv7
			    502325, --Lv8
			    502335, --Lv9
			    502345} --Lv10	
	
		for i = 1, 10, 1 do 
			if ClickObj  == TowerID[i] then
				--2015/05/26 改為領取Buff時不判斷現有狀態
				--if CheckBuff( OwnerID() ,Buff2ID[i] ) == false then
					CloseSpeak( OwnerID() )	--關閉對話視窗
					CastSpell( OwnerID() , OwnerID() , 491032)			
					CastSpell( TargetID() , OwnerID() , BuffID[i] )
				--elseif CheckBuff( OwnerID() ,Buff2ID[i] ) == true then
					--CloseSpeak( OwnerID() )	--關閉對話視窗
					--ScriptMessage( OwnerID(),OwnerID(),1,"[SC_BUFFTOWER_07]",0)	
				--end
			end
		end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function BuffTower_Mystic_Fortune()--神奇運勢all
	local PlayerGuildID = ReadRoleValue( OwnerID() ,   EM_RoleValue_GuildID  ) 
	local BuildingGuildID = ReadRoleValue( TargetID() ,   EM_RoleValue_GuildID  ) 
	local ClickObj = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	local Situation = ReadGuildBuilding( TargetID()  , EM_GuildBuildValueType_IsActive)

	local RoomID = ReadRoleValue( TargetID(), EM_RoleValue_RoomID )
	local TowerID =  {111636, --Lv1
			    111646, --Lv2
			    111656, --Lv3
			    111666, --Lv4
			    111676, --Lv5
			    111686, --Lv6
			    111696, --Lv7
			    111706, --Lv8
			    111716, --Lv9
			    111726} --Lv10
	if Situation == 1 then 	
	--	Addbuff( TargetID() , 504340 , 1 , -1 )

		if PlayerGuildID ~= BuildingGuildID then
			SetSpeakDetail(OwnerID(), "[GUILD_REMINDER]" )
		else
			for i = 1, 10, 1 do 
				if ClickObj  == TowerID[i] then
					LoadQuestOption( OwnerID() )	--載入任務模板
					AddSpeakOption( OwnerID() , TargetID() , "[SC_BUFFTOWER_06]" , "BuffTower_Mystic_Fortune_GetBuff" , 0 )--選項，領取「絕對防壁」的增益狀態
				end
			end
		end
	elseif Situation == 0 then
--Say(OwnerID(), "1")
--Say(TargetID(), "2")
	--	CancelBuff( TargetID() ,504340 )		
		SetSpeakDetail( OwnerID(), "[GUILD_REMINDER2]" )

	end
	
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function BuffTower_Mystic_Fortune_GetBuff()--領取「神奇運勢」的增益狀態
	local ClickObj = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	local RoomID = ReadRoleValue( TargetID(), EM_RoleValue_RoomID)

	local TowerID =  {111636, --Lv1
			    111646, --Lv2
			    111656, --Lv3
			    111666, --Lv4
			    111676, --Lv5
			    111686, --Lv6
			    111696, --Lv7
			    111706, --Lv8
			    111716, --Lv9
			    111726} --Lv10

	local BuffID =      {492056, --Lv1
			    492066, --Lv2
			    492076, --Lv3
			    492086, --Lv4
			    492096, --Lv5
			    492106, --Lv6
			    492116, --Lv7
			    492126, --Lv8
			    492136, --Lv9
			    492146} --Lv10

	local Buff2ID =   {502256, --Lv1
			    502266, --Lv2
			    502276, --Lv3
			    502286, --Lv4
			    502296, --Lv5
			    502306, --Lv6
			    502316, --Lv7
			    502326, --Lv8
			    502336, --Lv9
			    502346} --Lv10	
	
		for i = 1, 10, 1 do 
			if ClickObj  == TowerID[i] then
				--2015/05/26 改為領取Buff時不判斷現有狀態
				--if CheckBuff( OwnerID() ,Buff2ID[i] ) == false then
					CloseSpeak( OwnerID() )	--關閉對話視窗
					CastSpell( OwnerID() , OwnerID() , 491032)			
					CastSpell( TargetID() , OwnerID() , BuffID[i] )
				--elseif CheckBuff( OwnerID() ,Buff2ID[i] ) == true then
					--CloseSpeak( OwnerID() )	--關閉對話視窗
					--ScriptMessage( OwnerID(),OwnerID(),1,"[SC_BUFFTOWER_07]",0)	
				--end
			end
		end
end