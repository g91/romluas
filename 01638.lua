function Yuyu_GWB_Callout01() --魔燄塔建設
--	Say( OwnerID() ,"OwnerID" ) --龍捲風
--	Say( TargetID() ,"TargetID") --龍捲風

	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
	local OwnerX = ReadRoleValue( OwnerID() , EM_RoleValue_X ) 
	local OwnerY = ReadRoleValue( OwnerID() , EM_RoleValue_Y ) 
	local OwnerZ = ReadRoleValue( OwnerID() , EM_RoleValue_Z ) 
	local OwnerDIR = ReadRoleValue( OwnerID() , EM_RoleValue_Dir ) 
	local PlayerGuildID = GetRoleCampID( OwnerID() )--玩家的陣營

	local StageNpc = CreateObj( 102485 , OwnerX , OwnerY , OwnerZ , OwnerDIR , 1)
	local ServerMaxLv = ReadRoleValue( OwnerID() , EM_RoleValue_MaxLv )	-- 伺服器開放玩家等級上限
	-- 2013.01.11 調整召喚榮譽建築時，建築等級會隨玩家角色等級開放的上限而成長。	
	local Player = ReadRoleValue( OwnerID() , EM_RoleValue_Register+7 )	-- 讓龍捲風記起使用玩家
	Hao_GuildWar_Set_Lv( Player , StageNpc )
	--
	AddToPartition( StageNpc , RoomID ) 

	SetRoleCampID( StageNpc, PlayerGuildID )--寫入陣營

	SetPlot( StageNpc  , "dead","Yuyu_GWB_Tower_dead",0 )                              --死亡劇情

	SetModeEx( StageNpc   , EM_SetModeType_Mark, true )--標記
	SetModeEx( StageNpc  , EM_SetModeType_HideName, true )--名稱
	SetModeEx( StageNpc , EM_SetModeType_ShowRoleHead, true )--頭像框
	SetModeEx( StageNpc , EM_SetModeType_Fight , true )--可砍殺攻擊
	SetModeEx( StageNpc  , EM_SetModeType_Move, false )--移動
	SetModeEx( StageNpc , EM_SetModeType_Obstruct, false )--阻擋

	AddBuff( StageNpc , 505921 , 84, -1 )	--85%	--被玩家攻擊傷害折扣 法術等級 0 = 1%	
	AddBuff( StageNpc ,502707 ,1 ,-1 ); --非戰鬥中不回血的buff (ownerID,buff,LV,Time)
	WriteRoleValue( StageNpc  , EM_RoleValue_Register+1 ,  38  )--紀錄為大型建築物---***
---*---以下判斷玩家是否有學習防禦工程之科技
	local SetA = -1		
	local Count = BuffCount ( OwnerID())
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID ) -- 基本法術ID
		if BuffID == 505314 then--防禦工程
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )--該建築第 j 個BUFF的等級
			SetA = BuffLv
		end
	end

	if SetA>-1 then
		AddBuff( StageNpc , 505511 , SetA , -1 )--防禦工程
	end

end

function Yuyu_GWB_Callout01_Buff() --魔燄塔Buff取消
	CancelBuff( OwnerID() , 505424  ) 
end

function Yuyu_GWB_Callout02() --電能塔建設

	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 

	local OwnerX = ReadRoleValue( OwnerID() , EM_RoleValue_X ) 
	local OwnerY = ReadRoleValue( OwnerID() , EM_RoleValue_Y ) 
	local OwnerZ = ReadRoleValue( OwnerID() , EM_RoleValue_Z ) 
	local OwnerDIR = ReadRoleValue( OwnerID() , EM_RoleValue_Dir ) 
	local PlayerGuildID = GetRoleCampID( OwnerID() )--玩家的陣營

	local StageNpc = CreateObj( 102486 , OwnerX , OwnerY , OwnerZ , OwnerDIR , 1)
	-- 2013.01.11 調整召喚榮譽建築時，建築等級會隨玩家角色等級開放的上限而成長。	
	local Player = ReadRoleValue( OwnerID() , EM_RoleValue_Register+7 )	-- 讓龍捲風記起使用玩家
	Hao_GuildWar_Set_Lv( Player , StageNpc )
	--	
	AddToPartition( StageNpc , RoomID )  

	SetRoleCampID( StageNpc, PlayerGuildID )--寫入陣營

	SetPlot( StageNpc  , "dead","Yuyu_GWB_Tower_dead",0 )                              --死亡劇情

	SetModeEx( StageNpc   , EM_SetModeType_Mark, true )--標記
	SetModeEx( StageNpc  , EM_SetModeType_HideName, true )--名稱
	SetModeEx( StageNpc , EM_SetModeType_ShowRoleHead, true )--頭像框
	SetModeEx( StageNpc , EM_SetModeType_Fight , true )--可砍殺攻擊
	SetModeEx( StageNpc  , EM_SetModeType_Move, false )--移動
	SetModeEx( StageNpc , EM_SetModeType_Obstruct, false )--阻擋

	AddBuff( StageNpc , 505921 , 84, -1 )	--85%	--被玩家攻擊傷害折扣 法術等級 0 = 1%	
	AddBuff( StageNpc ,502707 ,1 ,-1 ); --非戰鬥中不回血的buff (ownerID,buff,LV,Time)
	WriteRoleValue( StageNpc  , EM_RoleValue_Register+1 ,  38  )--紀錄為大型建築物---***
---*---以下判斷玩家是否有學習防禦工程之科技
	local SetA = -1		
	local Count = BuffCount ( OwnerID())
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID ) -- 基本法術ID
		if BuffID == 505314 then--防禦工程
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )--該建築第 j 個BUFF的等級
			SetA = BuffLv
		end
	end

	if SetA>-1 then
		AddBuff( StageNpc , 505511 , SetA , -1 )--防禦工程
	end

end

function Yuyu_GWB_Callout02_Buff() --電能塔Buff取消
	CancelBuff( OwnerID() , 505425  ) 
end

function Yuyu_GWB_Callout03() --聖光樹建設

	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 

	local OwnerX = ReadRoleValue( OwnerID() , EM_RoleValue_X ) 
	local OwnerY = ReadRoleValue( OwnerID() , EM_RoleValue_Y ) 
	local OwnerZ = ReadRoleValue( OwnerID() , EM_RoleValue_Z ) 
	local OwnerDIR = ReadRoleValue( OwnerID() , EM_RoleValue_Dir ) 
	local PlayerGuildID = GetRoleCampID( OwnerID() )--玩家的陣營

	local StageNpc = CreateObj( 102484 , OwnerX , OwnerY , OwnerZ , OwnerDIR , 1)
	-- 2013.01.11 調整召喚榮譽建築時，建築等級會隨玩家角色等級開放的上限而成長。	
	local Player = ReadRoleValue( OwnerID() , EM_RoleValue_Register+7 )	-- 讓龍捲風記起使用玩家
	Hao_GuildWar_Set_Lv( Player , StageNpc )
	--	
	AddToPartition( StageNpc , RoomID )  
	SetRoleCampID( StageNpc, PlayerGuildID )--寫入陣營

	SetPlot( StageNpc  , "dead","Yuyu_GWB_Tower_dead",0 )                              --死亡劇情

	SetModeEx( StageNpc   , EM_SetModeType_Mark, true )--標記
	SetModeEx( StageNpc  , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( StageNpc  , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( StageNpc  , EM_SetModeType_HideName, true )--名稱
	SetModeEx( StageNpc , EM_SetModeType_ShowRoleHead, true )--頭像框
	SetModeEx( StageNpc , EM_SetModeType_Fight , true )--可砍殺攻擊
	SetModeEx( StageNpc  , EM_SetModeType_Move, false )--移動
	SetModeEx( StageNpc , EM_SetModeType_Obstruct, false )--阻擋

	AddBuff( StageNpc , 505921 , 79, -1 )	--80%	--被玩家攻擊傷害折扣 法術等級 0 = 1%	
	AddBuff( StageNpc ,502707 ,1 ,-1 ); --非戰鬥中不回血的buff (ownerID,buff,LV,Time)
	WriteRoleValue( StageNpc  , EM_RoleValue_Register+1 ,  38  )--紀錄為大型建築物---***
---*---以下判斷玩家是否有學習防禦工程之科技
	local SetA = -1		
	local Count = BuffCount ( OwnerID())
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID ) -- 基本法術ID
		if BuffID == 505314 then--防禦工程
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )--該建築第 j 個BUFF的等級
			SetA = BuffLv
		end
	end

	if SetA>-1 then
		AddBuff( StageNpc , 505511 , SetA , -1 )--防禦工程
	end

end

function Yuyu_GWB_Callout03_Buff() --聖光樹Buff取消
	CancelBuff( OwnerID() , 505426  ) 
end

function Yuyu_GWB_Callout04() --榮譽之心建設

	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 

	local OwnerX = ReadRoleValue( OwnerID() , EM_RoleValue_X ) 
	local OwnerY = ReadRoleValue( OwnerID() , EM_RoleValue_Y ) 
	local OwnerZ = ReadRoleValue( OwnerID() , EM_RoleValue_Z ) 
	local OwnerDIR = ReadRoleValue( OwnerID() , EM_RoleValue_Dir ) 
	local PlayerGuildID = GetRoleCampID( OwnerID() )--玩家的陣營

	local StageNpc = CreateObj( 102483 , OwnerX , OwnerY , OwnerZ , OwnerDIR , 1)
	-- 2013.01.11 調整召喚榮譽建築時，建築等級會隨玩家角色等級開放的上限而成長。	
	local Player = ReadRoleValue( OwnerID() , EM_RoleValue_Register+7 )	-- 讓龍捲風記起使用玩家
	Hao_GuildWar_Set_Lv( Player , StageNpc )
	--	
	AddToPartition( StageNpc , RoomID )  

	SetRoleCampID( StageNpc, PlayerGuildID )--寫入陣營

	SetPlot( StageNpc  , "dead","Yuyu_GWB_Tower_dead",0 )                              --死亡劇情

	SetModeEx( StageNpc   , EM_SetModeType_Mark, true )--標記
	SetModeEx( StageNpc  , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( StageNpc  , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( StageNpc  , EM_SetModeType_HideName, true )--名稱
	SetModeEx( StageNpc , EM_SetModeType_ShowRoleHead, true )--頭像框
	SetModeEx( StageNpc , EM_SetModeType_Fight , true )--可砍殺攻擊
	SetModeEx( StageNpc  , EM_SetModeType_Move, false )--移動
	SetModeEx( StageNpc , EM_SetModeType_Obstruct, false )--阻擋

	AddBuff( StageNpc , 505921 , 79, -1 )	--80%	--被玩家攻擊傷害折扣 法術等級 0 = 1%	
	AddBuff( StageNpc ,502707 ,1 ,-1 ); --非戰鬥中不回血的buff (ownerID,buff,LV,Time)
	WriteRoleValue( StageNpc  , EM_RoleValue_Register+1 ,  38  )--紀錄為大型建築物---***
---*---以下判斷玩家是否有學習防禦工程之科技
	local SetA = -1		
	local Count = BuffCount ( OwnerID())
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID ) -- 基本法術ID
		if BuffID == 505314 then--防禦工程
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )--該建築第 j 個BUFF的等級
			SetA = BuffLv
		end
	end

	if SetA>-1 then
		AddBuff( StageNpc , 505511 , SetA , -1 )--防禦工程
	end

end

function Yuyu_GWB_Callout04_Buff() --榮譽之心Buff取消
	CancelBuff( OwnerID() , 505427  ) 
end

function Yuyu_GWB_Callout05() --汲能塔建設

	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 

	local OwnerX = ReadRoleValue( OwnerID() , EM_RoleValue_X ) 
	local OwnerY = ReadRoleValue( OwnerID() , EM_RoleValue_Y ) 
	local OwnerZ = ReadRoleValue( OwnerID() , EM_RoleValue_Z ) 
	local OwnerDIR = ReadRoleValue( OwnerID() , EM_RoleValue_Dir ) 
	local PlayerGuildID = GetRoleCampID( OwnerID() )--玩家的陣營
--	Say(OwnerID(),"PlayerGuildID = "..PlayerGuildID)
	local StageNpc = CreateObj( 102481 , OwnerX , OwnerY , OwnerZ , OwnerDIR , 1)
	-- 2013.01.11 調整召喚榮譽建築時，建築等級會隨玩家角色等級開放的上限而成長。	
	local Player = ReadRoleValue( OwnerID() , EM_RoleValue_Register+7 )	-- 讓龍捲風記起使用玩家
	Hao_GuildWar_Set_Lv( Player , StageNpc )
	--	
	AddToPartition( StageNpc , RoomID )  
--	Say(OwnerID(),"OwnerID")
--	Say(TargetID(),"TargetID")
	SetRoleCampID( StageNpc, PlayerGuildID )--寫入陣營
	local PlayerGuild
	local NearPlayer = SearchRangePlayer(StageNpc,200)	--搜尋周圍玩家
--	Say(OwnerID(),"NearPlayerCount = "..table.getn(NearPlayer))
	for i = 0 , table.getn(NearPlayer)-1 do
--		Say(NearPlayer[i],"NearPlayerCount = "..table.getn(NearPlayer))
		if PlayerGuildID == GetRoleCampID( NearPlayer[i] ) then
			PlayerGuild = ReadRoleValue(NearPlayer[i],EM_RoleValue_GuildID)
			break
		end
	end
--	DebugMsg( 0, RoomID ,"PlayerGuild = "..PlayerGuild.." StageNpcGuild = "..ReadRoleValue(StageNpc,EM_RoleValue_GuildID))
	if ReadRoleValue(StageNpc,EM_RoleValue_GuildID) == 0 then
		WriteRoleValue(StageNpc,EM_RoleValue_GuildID,PlayerGuild)
--		DebugMsg( 0, RoomID ,"StageNpcGuild = "..ReadRoleValue(StageNpc,EM_RoleValue_GuildID))
	end
	SetPlot( StageNpc  , "dead","Yuyu_GWB_Tower_dead",0 )                              --死亡劇情

	SetModeEx( StageNpc   , EM_SetModeType_Mark, true )--標記
	SetModeEx( StageNpc  , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( StageNpc  , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( StageNpc  , EM_SetModeType_HideName, true )--名稱
	SetModeEx( StageNpc , EM_SetModeType_ShowRoleHead, true )--頭像框
	SetModeEx( StageNpc , EM_SetModeType_Fight , true )--可砍殺攻擊
	SetModeEx( StageNpc  , EM_SetModeType_Move, false )--移動
	SetModeEx( StageNpc , EM_SetModeType_Obstruct, false )--阻擋

	AddBuff( StageNpc , 505921 , 79, -1 )	--80%	--被玩家攻擊傷害折扣 法術等級 0 = 1%	
	AddBuff( StageNpc ,502707 ,1 ,-1 ); --非戰鬥中不回血的buff (ownerID,buff,LV,Time)
	WriteRoleValue( StageNpc  , EM_RoleValue_Register+1 ,  38  )--紀錄為大型建築物---***
---*---以下判斷玩家是否有學習防禦工程之科技
	local SetA = -1		
	local Count = BuffCount ( OwnerID())
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID ) -- 基本法術ID
		if BuffID == 505314 then--防禦工程
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )--該建築第 j 個BUFF的等級
			SetA = BuffLv
		end
	end

	if SetA>-1 then
		AddBuff( StageNpc , 505511 , SetA , -1 )--防禦工程
	end

end

function Yuyu_GWB_Callout05_Buff() --汲能塔Buff取消
	CancelBuff( OwnerID() , 505428  ) 
end

function Yuyu_GWB_Callout06() --視覺幻鏡建設

	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 

	local OwnerX = ReadRoleValue( OwnerID() , EM_RoleValue_X ) 
	local OwnerY = ReadRoleValue( OwnerID() , EM_RoleValue_Y ) 
	local OwnerZ = ReadRoleValue( OwnerID() , EM_RoleValue_Z ) 
	local OwnerDIR = ReadRoleValue( OwnerID() , EM_RoleValue_Dir ) 
	local PlayerGuildID = GetRoleCampID( OwnerID() )--玩家的陣營

	local StageNpc = CreateObj( 102482 , OwnerX , OwnerY , OwnerZ , OwnerDIR , 1)
	-- 2013.01.11 調整召喚榮譽建築時，建築等級會隨玩家角色等級開放的上限而成長。	
	local Player = ReadRoleValue( OwnerID() , EM_RoleValue_Register+7 )	-- 讓龍捲風記起使用玩家
	Hao_GuildWar_Set_Lv( Player , StageNpc )
	--	
	AddToPartition( StageNpc , RoomID )  

	SetRoleCampID( StageNpc, PlayerGuildID )--寫入陣營

	SetPlot( StageNpc  , "dead","Yuyu_GWB_Tower_dead",0 )                              --死亡劇情

	SetModeEx( StageNpc   , EM_SetModeType_Mark, true )--標記
	SetModeEx( StageNpc  , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( StageNpc  , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( StageNpc  , EM_SetModeType_HideName, true )--名稱
	SetModeEx( StageNpc , EM_SetModeType_ShowRoleHead, true )--頭像框
	SetModeEx( StageNpc , EM_SetModeType_Fight , true )--可砍殺攻擊
	SetModeEx( StageNpc  , EM_SetModeType_Move, false )--移動
	SetModeEx( StageNpc , EM_SetModeType_Obstruct, false )--阻擋

	AddBuff( StageNpc , 505921 , 79, -1 )	--80%	--被玩家攻擊傷害折扣 法術等級 0 = 1%	
	AddBuff( StageNpc ,502707 ,1 ,-1 ); --非戰鬥中不回血的buff (ownerID,buff,LV,Time)
	WriteRoleValue( StageNpc  , EM_RoleValue_Register+1 ,  38  )--紀錄為大型建築物---***
---*---以下判斷玩家是否有學習防禦工程之科技
	local SetA = -1		
	local Count = BuffCount ( OwnerID())
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID ) -- 基本法術ID
		if BuffID == 505314 then--防禦工程
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )--該建築第 j 個BUFF的等級
			SetA = BuffLv
		end
	end

	if SetA>-1 then
		AddBuff( StageNpc , 505511 , SetA , -1 )--防禦工程
	end

end

function Yuyu_GWB_Callout06_Buff() --視覺幻鏡Buff取消
	CancelBuff( OwnerID() , 505429  ) 
end


function Yuyu_GWB_Callout_skill_01() --建築物法術：滲透策反

--Say(OwnerID(),"OwnerID")
--Say(TargetID(),"TargetID")

	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )
	local VOC = ReadRoleValue( OwnerID() , EM_RoleValue_VOC )--職業
	local PassCard =  CountBodyItem( OwnerID() , 206769 ) --是否具有通行證 = GM測試
	local RoomID = ReadRoleValue( TargetID(), EM_RoleValue_RoomID )
	local PlayerGuildID = GetRoleCampID( OwnerID() )--玩家的陣營
	local BuildingGuildID = GetRoleCampID( TargetID() )--目標陣營
	local judge = 0 --判斷是否是GM 或 同公會 ...等
	local BuildingOrgID_1 = {102366,102367,102370,102481,102482,102483,102484,102485,102486} --【滲透策反】 所有建築之OrgID---------------------------------------------/*變數↓
	local TargetOrgID = ReadRoleValue( TargetID() ,EM_RoleValue_OrgID ) --目前建築物之OrgID
	local judge_2 = 0 --判斷是否是為可作用之建築物	
	
--	if ( Option == "CHECK" ) then

--判斷0　是否為可作用區域
		if (ZoneID == 402) or (ZoneID == 31)  then

--判斷1　是否為同陣營
			if (PassCard > 0) then
				judge = 1

			elseif PlayerGuildID ~= BuildingGuildID then

				judge = 1

			else
				ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_YU_GUILDWAR_BUILD_19]", 0 ) --無法策反同陣營之建築物
				ScriptMessage( TargetID() , OwnerID() , 0 , "[SC_YU_GUILDWAR_BUILD_19]", 0 ) 
				judge = 0
			end

--判斷2　是否為可滲透之建築物
			for i= 1 , 9 do

--Say(OwnerID(),TargetOrgID)
--Say(TargetID(),BuildingOrgID_1[i])

				if TargetOrgID == BuildingOrgID_1[i] then
					judge_2 = 1
					break
				else
					judge_2 = 0 		
				end
			end

			if judge_2 == 0 then
					ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_YU_GUILDWAR_BUILD_20]", 0 ) --無法滲透該目標！
					ScriptMessage( TargetID() , OwnerID() , 0 , "[SC_YU_GUILDWAR_BUILD_20]", 0 )
			end

--判斷3　是否為閒置之建築物
			if (judge == 1) and (judge_2 == 1) then

				if ReadRoleValue( TargetID() , EM_RoleValue_Register+2 ) == 555 then--正被滲透中
					ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_YU_GUILDWAR_BUILD_21]", 0 ) --目標正被滲透中！
					ScriptMessage( TargetID() , OwnerID() , 0 , "[SC_YU_GUILDWAR_BUILD_21]", 0 )
					return false
				else
					WriteRoleValue( TargetID()  , EM_RoleValue_Register+2 ,  555  ) --註記滲透中
					BeginPlot( TargetID()  , "Yuyu_GWB_Callout_skill_02" , 0 )

					local TargetIDName = "|cffffff20"..GetName( TargetID() ).."|r"
					local str = "[SC_YU_GUILDWAR_BUILD_25][$SETVAR1="..TargetIDName.."]"

					ScriptMessage( TargetID() , 0 , 1 , str, 0 ) --警告！XXX正被策反中！
					ScriptMessage( TargetID() , 0 , 0 , str, 0 ) 

					return true
				end
			end
		else
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_DAN_111700_37]", C_SYSTEM ) --你無法在此區域使用該物品！
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_DAN_111700_37]", C_SYSTEM ) 
				return false
		end

---	elseif ( Option == "USE" ) then
--		BeginPlot( OwnerID()  , "Yuyu_GWB_Callout_skill_02" , 0 )  
--	end

end

function Yuyu_GWB_Callout_skill_02() -- 建築物法術：滲透策反

	BeginPlot( TargetID()  , "Yuyu_GWB_Callout_skill_03" , 0 )  

end

function Yuyu_GWB_Callout_skill_03() -- 建築物法術：滲透策反
		local BookMagicID = 505308		--/*持書motion
		local ChangeMagicID = 504340		--/*目標被滲透中
		local Count =  ReadRoleValue( OwnerID() , EM_RoleValue_Register+3 ) + 1
		local PlayerGuildID = GetRoleCampID( OwnerID() )--玩家的陣營

--Say(OwnerID(),"OwnerID=2")
--Say(TargetID(),"TargetID=2")

		if BeginCastBar( OwnerID(), "[SC_YU_GUILDWAR_BUILD_22]"..Count.."/5", 25 , ruFUSION_ACTORSTATE_EMOTE_PLAY_SAXOPHONE , ruFUSION_ACTORSTATE_EMOTE_VICTORY , 0 ) == 1 then
		
			AddBuff( OwnerID() , BookMagicID , 0 , -1 )		--使用書
			AddBuff( TargetID() , ChangeMagicID , 0 , -1 )		--光照中


			while true do
			sleep( 2 )
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
				elseif (CheckID( TargetID() ) == false) then
					result = "DAME"
					EndCastBar( OwnerID() , CastBarStatus )
					break;
				end
			end

			if ( result == "OKOK" ) then
				if CheckID( TargetID() ) == true then
					if ReadRoleValue( OwnerID() , EM_RoleValue_Register+3 ) == 4 then--表示已朗讀4遍
						local TargetIDName = "|cffffff20"..GetName( TargetID() ).."|r"

						WriteRoleValue( OwnerID()  , EM_RoleValue_Register+3 ,  0  ) --清除朗讀次數


						local str = "[SC_YU_GUILDWAR_BUILD_23][$SETVAR1="..TargetIDName.."]"

						ScriptMessage( OwnerID() , OwnerID() , 1 , str, 0 ) --策反成功！XXX已歸化為我方陣營！
						ScriptMessage( OwnerID() , OwnerID() , 0 , str, 0 ) 
						SetRoleCampID( TargetID() , PlayerGuildID )--寫入陣營

						local B_MID = 505789   --藍色陣營 標誌
						local R_MID = 505790   --紅色陣營 標誌
						if PlayerGuildID == 7 then
							CancelBuff( OwnerID() , R_MID )
							AddBuff( TargetID() , B_MID , 0 , -1 )		--藍色陣營
						elseif PlayerGuildID == 8 then
							CancelBuff( OwnerID() , B_MID )
							AddBuff( TargetID() , R_MID , 0 , -1 )		--紅色陣營
						end

						CancelBuff( OwnerID() , BookMagicID )
						CancelBuff( TargetID() , ChangeMagicID )
						WriteRoleValue( TargetID()  , EM_RoleValue_Register+2 ,  0  ) --註記非感化中
						BeginPlot( OwnerID()  , "Yuyu_GW_witchgood_delitem_04" , 0 )  --刪除物品：策反典籍

					else
						AddRoleValue( OwnerID()  , EM_RoleValue_Register+3 ,  1  ) --增加朗讀次數
						BeginPlot( TargetID()  , "Yuyu_GWB_Callout_skill_02" , 0 )  
					end
				end

			elseif ( result == "DAME" ) then	
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_YU_GUILDWAR_BUILD_24]", 0 ) --策反工作已中斷！
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_YU_GUILDWAR_BUILD_24]", 0 ) 

				WriteRoleValue( OwnerID()  , EM_RoleValue_Register+3 ,  0  ) --清除朗讀次數
				CancelBuff( OwnerID() , BookMagicID )
				CancelBuff( TargetID() , ChangeMagicID )
				WriteRoleValue( TargetID()  , EM_RoleValue_Register+2 ,  0  ) --註記非感化中

	
			end
		end
end


function Yuyu_GWB_Tower_dead()  --機關死亡劇情

	-- 2013.08.14 阿浩：修正Npc攻擊塔類物件時，會因為死亡劇情被 return false 而讓追逐距離遠超過資料庫中設定值的問題。
	DelObj( OwnerID() )
	--
--	SetStopAttack( OwnerID() )
--	SetModeEx( OwnerID()   , EM_SetModeType_Mark, false )--標記
--	SetModeEx( OwnerID()  , EM_SetModeType_HideName, true )--名稱
--	SetModeEx( OwnerID() , EM_SetModeType_ShowRoleHead, false )--頭像框
--	SetModeEx( OwnerID() , EM_SetModeType_DisableRotate, true )--轉向
--	SetModeEx( OwnerID()  , EM_SetModeType_Searchenemy, false )--索敵
--	SetModeEx( OwnerID()  , EM_SetModeType_Strikback, false )--反擊
--	SetModeEx( OwnerID() , EM_SetModeType_Fight , false )--可砍殺攻擊
--	BeginPlot( OwnerID() , "Yuyu_GWB_Tower_dead01" , 0 )
--	return false
end

--function Yuyu_GWB_Tower_dead01()  --機關死亡劇情
--
--	AddBuff( OwnerID() , 503605 , 0 , -1 )		--起火燃燒
----	sleep(20)
--	AddBuff( OwnerID() , 506150 , 0 , -1 )		--坍塌冒煙
----	sleep(5)
--	DelObj(OwnerID())
--end

function Hao_GuildWar_Set_Lv( Player , ObjID )	-- 2013.01.11 調整召喚榮譽建築時，建築等級會隨玩家角色等級開放的上限而成長。	

	local ServerMaxLv = ReadRoleValue( Player , EM_RoleValue_MaxLv )	-- 伺服器開放玩家等級上限
	WriteRoleValue( ObjID , EM_RoleValue_LV , ServerMaxLv )
	WriteRoleValue( ObjID , EM_RoleValue_Register+7 , 0 )	
end

function Hao_GuildWar_Tower()	-- 2013.01.11 調整召喚榮譽建築時，建築等級會隨玩家角色等級開放的上限而成長。	

	WriteRoleValue( OwnerID() , EM_RoleValue_Register+7 , TargetID() )	-- 將使用物品的玩家寫入至龍捲風的 Reg+7 中
	--龍捲風已使用值
	--EM_RoleValue_Register
	--EM_RoleValue_PID
	--EM_RoleValue_Register+8
	--EM_RoleValue_Register+9
end