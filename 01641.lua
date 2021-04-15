function Yuyu_GWar_Leader_00()  --軍團長

	local O_ID = OwnerID()
	local PlayerGuildID = GetRoleCampID( O_ID )--玩家的陣營
	local B_MID = 502971   --藍色陣營 標誌
	local R_MID = 502970   --紅色陣營 標誌

	if PlayerGuildID == 7 then
		AddBuff( O_ID , B_MID , 0 , -1 )		--藍色陣營
	elseif PlayerGuildID == 8 then
		AddBuff( O_ID , R_MID , 0 , -1 )		--紅色陣營
	end
end

function Yuyu_GWar_Leader_01()-- 告知可成為軍團長的條件
	-- 水晶已儲存值
	-- PID(陣營)、Reg+4(取得征戰先鋒玩家的DBID)、Reg+5(是否已領取1000點的能量)、Reg+6(玩家的GUID)、Reg+7(是否已取得征戰先鋒)、Reg+8(陣營?)
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );

	SetPlot( OwnerID(),"range", "Yuyu_GWar_Leader_02" , 100 )                                      --設定劇情
                while 1 do
		Debuglog(2 , "%%%%CheckING....")
		local GuildID = ReadRoleValue(OwnerID(),EM_RoleValue_GuildID)
		local CampID = GetRoleCampID( OwnerID() )
		Debuglog(2 , "%%%%CheckING....GuildID = "..GuildID.." CampID = "..CampID)
		if GuildID ~= 0 then
			if CampID == 7 then
				AddGuildWarEnergy( OwnerID() , GuildWarSetting[RoomID]["energy"][2] )
				Debuglog(2 , "%%%%GETENERY....GuildID = "..GuildID.." CampID = "..CampID)
			elseif  CampID == 8 then
				AddGuildWarEnergy( OwnerID() , GuildWarSetting[RoomID]["energy"][1] )
				Debuglog(2 , "%%%%GETENERY....GuildID = "..GuildID.." CampID = "..CampID)
			end
		end
--2011.04.19 修改征戰先鋒領取問題 ---------------------------------------------------------------------------------------------
		local Reg
	--	local DBID = ReadRoleValue( TargetID() , EM_RoleValue_DBID )	--2011.06.23 應廠商需求，修改征戰先鋒領取條件
		local PID = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
		--	Say( OwnerID() , "PID ="..PID )
		--	Say( OwnerID() , "DBID ="..DBID )
		for i = 1 , 9 , 1 do
			Reg =  ReadRoleValue( OwnerID() , EM_RoleValue_Register+i )
		--	Say( OwnerID() , "Reg".."+"..i.." = "..Reg )
		end
		Sleep(100)
	end
end

function Yuyu_GWar_Leader_test()

	local GNAME = ReadRoleValue( OwnerID() , EM_RoleValue_GuildID)
	Say(OwnerID() , GNAME)
	local GPlayername = "|cff00ffff"..GetName(GNAME).."|r"

	Say(OwnerID() , GPlayername)

end

function Yuyu_GWar_Leader_02()
--Say(OwnerID(),"OwnerID") --玩家
--Say(TargetID(),"TargetID") --水晶

	local XX = ReadRoleValue( TargetID() , EM_RoleValue_Register+7 )
	local PayKey = ReadRoleValue( TargetID() , EM_RoleValue_Register+5 )	-- 2011.04.19 修改征戰先鋒領取問題 
	local TellHer =  CheckFlag( OwnerID()  , 543561 )--是否已告訴玩家 成為軍團長的資訊
	local PlayerGuildID = GetRoleCampID( OwnerID() )
	local PID = ReadRoleValue( TargetID() , EM_RoleValue_PID  )			--將水晶編號記錄在pid
--2011.06.23 應廠商需求，修改征戰先鋒領取條件 -------------------------------------------------------------------------------
	local DBID = ReadRoleValue( OwnerID() , EM_RoleValue_DBID )
	local SaveDBID = ReadRoleValue( TargetID() , EM_RoleValue_Register+4 )	-- 記錄取得征戰先鋒玩家的DBID
----------------------------------------------------------------------------------------------------------------------------------
	local BuildingGuildID = PID+6
	local Now_R =  CountBodyItem( OwnerID() , 206685 ) --目前戰績
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local  GuildName = 0
	local PlayerGuild = ReadRoleValue(OwnerID(),EM_RoleValue_GuildID )
	local str
	if ReadRoleValue(TargetID(),EM_RoleValue_GuildID) == 0 then
		WriteRoleValue(TargetID(),EM_RoleValue_GuildID,PlayerGuild)
		Debuglog(2 , "%%%%WriteGUID...."..PlayerGuild)
	end
	if (XX ~= 666) then --還沒有軍團長
		if PlayerGuildID == BuildingGuildID then
			if ( Now_R >= 1000 and SaveDBID == 0 ) or ( DBID == SaveDBID ) then	--2011.06.23 應廠商需求，修改征戰先鋒領取條件
				WriteRoleValue( TargetID() , EM_RoleValue_Register+7 , 666 )
--2011.06.23 應廠商需求，修改征戰先鋒領取條件 -------------------------------------------------------------------------------
				if SaveDBID == 0 then
					WriteRoleValue( TargetID() , EM_RoleValue_Register+4 , DBID )
				end
----------------------------------------------------------------------------------------------------------------------------------
				if PlayerGuildID == 7 then --藍色陣營
					local Playername = "|cff00ffff"..GetName( OwnerID() ).."|r"
					GuildName =  "|cff00ffff"..GetGuildName_ByID( RoomID , 0).."|r"
					if PayKey ~= 1 then
						str = "[SC_YU_GUILDWAR_BUILD_54][$SETVAR1="..GuildName.."][$SETVAR2="..Playername.."]"
					else
						str = "[SC_YU_GUILDWAR_BUILD_89][$SETVAR1="..GuildName.."][$SETVAR2="..Playername.."]"
					end
					local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
					local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
					if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
						RunningMsg( OwnerID() , 3 ,  Str )
					end
				elseif PlayerGuildID == 8 then --紅色陣營
					local Playername = "|cffff3232"..GetName( OwnerID() ).."|r"
					GuildName =  "|cffff3232"..GetGuildName_ByID( RoomID , 1).."|r"
					if PayKey ~= 1 then
						str = "[SC_YU_GUILDWAR_BUILD_54][$SETVAR1="..GuildName.."][$SETVAR2="..Playername.."]"
					else
						str = "[SC_YU_GUILDWAR_BUILD_89][$SETVAR1="..GuildName.."][$SETVAR2="..Playername.."]"
					end
					local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
					local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
					if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
						RunningMsg( OwnerID() , 3 ,  Str )
					end
				end
--2011.04.19 修改征戰先鋒領取問題 ---------------------------------------------------------------------------------------------
				if PayKey ~= 1 then
					WriteRoleValue( TargetID() , EM_RoleValue_Register+5 , 1 )
					AddGuildWarEnergy( OwnerID() , 1000 )  --增減能量
				end
				WriteRoleValue( TargetID() , EM_RoleValue_Register+6 , OwnerID() ) -- 將此玩家寫入水晶的 Reg+9 中
				local NPC = CreateObjByObj( 113105 , TargetID() ) --在目標座標 X.Y.Z.Dir 身上準備創立物件
				SetModeEx( NPC , EM_SetModeType_Strikback , false )--反擊
				SetModeEx( NPC , EM_SetModeType_SearchenemyIgnore , false )--被搜尋
				SetModeEx( NPC , EM_SetModeType_Obstruct , false )--阻擋
				SetModeEx( NPC , EM_SetModeType_Mark , false )--標記
				SetModeEx( NPC , EM_SetModeType_Move , false )--移動
				SetModeEx( NPC , EM_SetModeType_Searchenemy , false )--索敵
				SetModeEx( NPC , EM_SetModeType_HideName , false )--名稱
				SetModeEx( NPC , EM_SetModeType_ShowRoleHead , false )--頭像框
				SetModeEx( NPC , EM_SetModeType_Fight , false )--可砍殺攻擊
				SetModeEx( NPC , EM_SetModeType_Drag , false )--阻力
				SetModeEx( NPC , EM_SetModeType_Show , false )--顯示
				AddToPartition( NPC , RoomID ) -- 建立物件
				WriteRoleValue( NPC , EM_RoleValue_Register+1 , TargetID() ) -- 將水晶寫入隱藏物件的 Reg+1 中
				BeginPlot( NPC , "Lua_Hao_GWar_ReCall_ID" , 0 )
------------------------------------------------------------------------------------------------------------------------------------
				BeginPlot( OwnerID() , "Yuyu_GWar_Leader_00" , 0 )         --成為軍團長
			else
				if (TellHer == FALSE) then --尚未告知玩家
					ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_YU_GUILDWAR_BUILD_53]", 1 ) 
					ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_YU_GUILDWAR_BUILD_53]", 1 ) 
					
					SetFlag( OwnerID()  , 543561 , 1 )
				end
			end
		end
	else
		SetPlot( OwnerID(),"range", "" , 0 )                                      --設定劇情
	end

--	BeginPlot( TargetID() , "LuaI_101022_2" , 0 )                                                   --命令指定角色呼叫 Script
end

function Yuyu_GWar_Leader_skill_00()  --鐵血戰魂
	local PlayerGuildID = GetRoleCampID( OwnerID() )--玩家的陣營
	local buffside = 0 --大絕招種類

	if PlayerGuildID == 7 then --藍色陣營
		buffside = 505931

	elseif PlayerGuildID == 8 then --紅色陣營
		buffside = 505929

	end

	CallPlot( OwnerID() , "Lua_GUILDWAR_ShareBuff" , buffside , 15)

end

function Yuyu_GWar_Leader_skill_01()  --無畏無懼
	local PlayerGuildID = GetRoleCampID( OwnerID() )--玩家的陣營
	local buffside = 0
	local playbuff = 0 --表演性質的buff

	if PlayerGuildID == 7 then --藍色陣營
		buffside = 505932
		playbuff = 502972
	elseif PlayerGuildID == 8 then --紅色陣營
		buffside = 505925
		playbuff = 502973
	end

	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_KAMEHAMEHA )
	AddBuff( OwnerID() ,playbuff,0, 3); --表演buff
--	sleep(30)	
	CallPlot( OwnerID() , "Lua_GUILDWAR_ShareBuff" , buffside , 15)

end

function Yuyu_GWar_Leader_skill_02()  --力挽狂瀾
	local PlayerGuildID = GetRoleCampID( OwnerID() )--玩家的陣營
	local buffside = 0

	if PlayerGuildID == 7 then --藍色陣營
		buffside = 505927
	elseif PlayerGuildID == 8 then --紅色陣營
		buffside = 505933
	end

	CallPlot( OwnerID() , "Lua_GUILDWAR_ShareBuff" , buffside , 5)

end

function Yuyu_GWar_Leader_skill_03()  --輕敵的洗禮  檢查
	local OID = OwnerID()
	local TID = TargetID()	
	local OwnerLV = ReadRoleValue( OwnerID() ,EM_RoleValue_LV) 
	local TargetLV = ReadRoleValue( TargetID() ,EM_RoleValue_LV) 

	if ( OwnerLV > TargetLV ) then

		ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_YU_GUILDWAR_BUILD_30]" , C_SYSTEM )  --此物品只能對等級高於自己的對象使用！
		ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_YU_GUILDWAR_BUILD_30]" , C_SYSTEM )  --此物品只能對等級高於自己的對象使用！

		return false

	elseif ReadRoleValue(TargetID(),EM_RoleValue_IsPlayer)~=1 then --目標非玩家
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_YU_GUILDWAR_BUILD_72]", 0 ) -- 只能對玩家使用
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_YU_GUILDWAR_BUILD_72]", 0 ) 
		return false

	else
		return true
	end
end

function Yuyu_GWar_Leader_skill_03_1()  --輕敵的洗禮

	WriteRoleValue( OwnerID() , EM_RoleValue_Register+4, TargetID() )

	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
	local OwnerX = ReadRoleValue( OwnerID() , EM_RoleValue_X ) 
	local OwnerY = ReadRoleValue( OwnerID() , EM_RoleValue_Y ) 
	local OwnerZ = ReadRoleValue( OwnerID() , EM_RoleValue_Z ) 
	local OwnerDIR = ReadRoleValue( OwnerID() , EM_RoleValue_Dir ) 
	local PlayerGuildID = GetRoleCampID( OwnerID() )--玩家的陣營

	local StageNpc = CreateObj( 113105 , OwnerX , OwnerY , OwnerZ , OwnerDIR , 1)
	SetModeEx( StageNpc, EM_SetModeType_Show, false )--顯示
	SetModeEx( StageNpc   , EM_SetModeType_Mark, false )--標記
	SetModeEx( StageNpc  , EM_SetModeType_HideName, true )--名稱
	SetModeEx( StageNpc , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( StageNpc , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( StageNpc  , EM_SetModeType_Move, false )--移動
	SetModeEx( StageNpc , EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( StageNpc  , EM_SetModeType_Strikback, false )--反擊

	AddToPartition( StageNpc , RoomID )  

	SetRoleCampID( StageNpc, PlayerGuildID )--寫入陣營
	WriteRoleValue( StageNpc , EM_RoleValue_PID, OwnerID() )
	BeginPlot( StageNpc , "Yuyu_GWar_Leader_skill_03_2" , 0 )  
		
end

function Yuyu_GWar_Leader_skill_03_2()  --輕敵的洗禮
	sleep(5)
--	Say(OwnerID(),"123")
	local O_ID = ReadRoleValue( OwnerID() ,EM_RoleValue_PID) --施法者
	local T_ID = ReadRoleValue( O_ID ,EM_RoleValue_Register+4) --被施法者

	local OwnerLV = ReadRoleValue( O_ID ,EM_RoleValue_LV) 
	local TargetLV = ReadRoleValue( T_ID,EM_RoleValue_LV) 

	local SkillLV = 0

	SkillLV = (TargetLV - OwnerLV)-1

--	AddBuff( TargetID() ,505776,SkillLV, 5); 

	CastSpelllv( O_ID , T_ID , 495101 , SkillLV )
	sleep(5)
	Delobj(OwnerID())
end


function Yuyu_GWar_Leader_skill_04()  --榮譽援軍
	local OID = OwnerID()
	local TID = TargetID()	

	local R_BASE = LuaFunc_SearchNPCbyOrgID( OID , 114335, 150 , 1)--紅色 能量之源
	local B_BASE = LuaFunc_SearchNPCbyOrgID( OID , 114336, 150 , 1)--藍色 能量之源
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 

	local OwnerX = ReadRoleValue( OwnerID() , EM_RoleValue_X ) 
	local OwnerY = ReadRoleValue( OwnerID() , EM_RoleValue_Y ) 
	local OwnerZ = ReadRoleValue( OwnerID() , EM_RoleValue_Z ) 
	local OwnerDIR = ReadRoleValue( OwnerID() , EM_RoleValue_Dir ) 
	local PlayerGuildID = GetRoleCampID( OwnerID() )--玩家的陣營
	local GuildName = 0
	-- 2013.08.09 征戰先鋒施放榮譽援軍召喚的「公會榮譽守護者」等級，現在將與玩家角色的等級上限同步。
	local ServerMaxLv = GetIniValueSetting("MaxRoleLevel")	-- 讀取伺服器設定的等級上限
	--
	if ( CheckID(R_BASE[0]) == true ) or ( CheckID(B_BASE[0]) == true ) or ReadRoleValue( OID , EM_RoleValue_VOC ) == 0 then
		local StageNpc = 0

		if PlayerGuildID == 7 or ReadRoleValue( OID , EM_RoleValue_VOC ) == 0 then--藍色陣營
		--	StageNpc = CreateObj( 103142 , OwnerX , OwnerY , OwnerZ , OwnerDIR , 1 )		
			-- 2013.08.09 征戰先鋒施放榮譽援軍召喚的「公會榮譽守護者」等級，現在將與玩家角色的等級上限同步。
			-- 2013.08.09 修改「公會榮譽守護者」的追逐距離，由 600 縮短至，避免「公會榮譽守護者」能夠直接攻擊城門或城門內建築的問題。
			local FollowRange = GameObjInfo_Int( 103142 ,"FollowRange" ) -- 讀取資料庫中指定物件設定的追逐距離
		--	Say( OwnerID() , "FollowRange = "..FollowRange )
		--	if FollowRange ~= 250 then
		--		WriteGameObjInfo_Double( 103142 , "FollowRange" , 250 )
		--		local FollowRange = GameObjInfo_Int( 103142 ,"FollowRange" ) -- 讀取資料庫中指定物件設定的追逐距離
			--	Say( OwnerID() , "SetFollowRange : "..FollowRange )
		--	end
			StageNpc = CreateObj( 103142 , OwnerX , OwnerY , OwnerZ , OwnerDIR , 1 )
			WriteRoleValue( StageNpc , EM_RoleValue_LV , ServerMaxLv )--等級會隨伺服器等級開放的上限而成長
		--	CallPlot( StageNpc , "Hao_GuildWar_Calculating_Distance" , StageNpc , OwnerX , OwnerY , OwnerZ , OwnerDIR )			
			--
			AddToPartition( StageNpc , RoomID )  
			SetRoleCampID( StageNpc, PlayerGuildID )--寫入陣營

			local Playername = "|cff00ffff"..GetName( OwnerID() ).."|r"
			GuildName =  "|cff00ffff"..GetGuildName_ByID( RoomID , 0).."|r"
			local str = "[SC_YU_GUILDWAR_BUILD_71][$SETVAR1="..GuildName.."][$SETVAR2="..Playername.."]"--成功召喚了榮譽守護者
			ScriptMessage(OwnerID(), OwnerID() , 1 , Str , C_SYSTEM )  
			ScriptMessage(OwnerID(), OwnerID() , 0 , Str , C_SYSTEM )  

			SetModeEx( StageNpc  , EM_SetModeType_Searchenemy, false )--索敵
			local sloco = "[SC_YU_GUILDWAR_BUILD_74][$SETVAR1="..GuildName.."]" --一起奮戰吧
			Say(StageNpc,sloco)
			sleep(5)
			PlayMotion( StageNpc , 101) 
			sleep(10)
			SetModeEx( StageNpc  , EM_SetModeType_Searchenemy, true )--索敵
		elseif PlayerGuildID == 8 or ReadRoleValue( OID , EM_RoleValue_VOC ) == 0 then--紅色陣營
		--	StageNpc = CreateObj( 103141 , OwnerX , OwnerY , OwnerZ , OwnerDIR , 1 )
			-- 2013.08.09 征戰先鋒施放榮譽援軍召喚的「公會榮譽守護者」等級，現在將與玩家角色的等級上限同步。
			-- 2013.08.09 修改「公會榮譽守護者」的追逐距離，由 600 縮短至 ，避免「公會榮譽守護者」能夠直接攻擊城門或城門內建築的問題。
		--	local FollowRange = GameObjInfo_Int( 103141 ,"FollowRange" ) -- 讀取資料庫中指定物件設定的追逐距離
		--	Say( OwnerID() , "FollowRange = "..FollowRange )
		--	if FollowRange ~= 250 then
		--		WriteGameObjInfo_Double( 103142 , "FollowRange" , 250 )
		--		local FollowRange = GameObjInfo_Int( 103142 ,"FollowRange" ) -- 讀取資料庫中指定物件設定的追逐距離
			--	Say( OwnerID() , "SetFollowRange : "..FollowRange )
		--	end
			StageNpc = CreateObj( 103141 , OwnerX , OwnerY , OwnerZ , OwnerDIR , 1 )			
			WriteRoleValue( StageNpc , EM_RoleValue_LV , ServerMaxLv )--等級會隨伺服器等級開放的上限而成長
		--	CallPlot( StageNpc , "Hao_GuildWar_Calculating_Distance" , StageNpc , OwnerX , OwnerY , OwnerZ , OwnerDIR )
			--
			AddToPartition( StageNpc , RoomID ) 
 			SetRoleCampID( StageNpc, PlayerGuildID )--寫入陣營

			local Playername = "|cffff3232"..GetName( OwnerID() ).."|r"
			GuildName =  "|cffff3232"..GetGuildName_ByID( RoomID , 1).."|r"
			local str = "[SC_YU_GUILDWAR_BUILD_71][$SETVAR1="..GuildName.."][$SETVAR2="..Playername.."]"--成功召喚了榮譽守護者
			ScriptMessage(OwnerID(), OwnerID() , 1 , Str , C_SYSTEM )  
			ScriptMessage(OwnerID(), OwnerID() , 0 , Str , C_SYSTEM )  

			SetModeEx( StageNpc  , EM_SetModeType_Searchenemy, false )--索敵
			local sloco = "[SC_YU_GUILDWAR_BUILD_74][$SETVAR1="..GuildName.."]" --一起奮戰吧
			Say(StageNpc,sloco)
			sleep(5)
			PlayMotion( StageNpc , 101) 
			sleep(10)
			SetModeEx( StageNpc  , EM_SetModeType_Searchenemy, true )--索敵
		end

		AddBuff( StageNpc , 505921 , 29, -1 )	--30%	--被玩家攻擊傷害折扣 法術等級 0 = 1%	
		AddBuff( StageNpc , 505923 , 989, -1 )	--990%	--攻擊NPC傷害增加 法術等級 0 = 1%	
		AddBuff( StageNpc , 505517 , 98, -1 )	--99%	--被NPC攻擊傷害折扣 法術等級 0 = 1%	
		AddBuff( StageNpc ,502707 ,1 ,-1 ); --非戰鬥中不回血的buff (ownerID,buff,LV,Time)
		BeginPlot( StageNpc , "Yuyu_GWar_Leader_skill_04_01" , 0 )  

	else
		ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_YU_GUILDWAR_BUILD_73]" , 0 )  --必須在能量之源附近才能進行召喚
		ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_YU_GUILDWAR_BUILD_73]" , 0 )  

	end


end
-- 2013.08.09 修改「公會榮譽守護者」的追逐距離，由 600 縮短至 350，避免「公會榮譽守護者」能夠直接攻擊城門或城門內建築的問題。
function Hao_GuildWar_Calculating_Distance(Obj,X,Y,Z,Dir)	-- 兩點求距離

	local Pos = {}
	local Distance
	
	while true do
		Pos["X"] , Pos["Y"] , Pos["Z"] , Pos["Dir"]  = Lua_Hao_Return_Coordinate(Obj) -- 取得Obj所在座標
		Distance = DW_XYZCheckDis(X,Y,Z,Pos["X"],Pos["Y"],Pos["Z"])	-- 兩點求距離
		if Distance > 450 then
			SetStopAttack( Obj )
			SetPos( Obj , X , Y , Z , Dir )
		end
		Sleep(10)
	end
end
--
function Yuyu_GWar_Leader_skill_04_01()  --榮譽援軍
	sleep(6000)
	SetStopAttack( OwnerID() )

	SetModeEx( OwnerID()  , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( OwnerID()  , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( OwnerID() , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( OwnerID() , EM_SetModeType_Move, false )--移動
	PlayMotion( OwnerID(), 101) 
	sleep(30)
	Say(OwnerID(),"[SC_YU_GUILDWAR_BUILD_75]")--我能給予的支援就到這裡...夥伴們，願榮譽與你們同在。
	PlayMotion( OwnerID(), 125) 
	sleep(50)
	Delobj(OwnerID())
end

function Yuyu_GWar_Leader_skill_04_02()  --榮譽援軍  檢查
	local OID = OwnerID()
	local TID = TargetID()	
	local R_BASE = LuaFunc_SearchNPCbyOrgID( OID , 114335, 150 , 1)--紅色 能量之源
	local B_BASE = LuaFunc_SearchNPCbyOrgID( OID , 114336, 150 , 1)--藍色 能量之源

	if ( CheckID(R_BASE[0]) == true ) or ( CheckID(B_BASE[0]) == true ) or ReadRoleValue( OID , EM_RoleValue_VOC ) == 0 then
		return true
	else
		ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_YU_GUILDWAR_BUILD_73]" , 0 )  --必須在能量之源附近才能進行召喚
		ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_YU_GUILDWAR_BUILD_73]" , 0 )  
		return false
	end
end

--====================================================================================================================

function Yuyu_GW_BigSkill_0_000( ) --【大絕招】惡燄豪箭雨插杖

	local OID = OwnerID()
	local TID = TargetID()	

	SetModeEx( OwnerID() , EM_SetModeType_Fight , false )--可砍殺攻擊

	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
	local OwnerX = ReadRoleValue( OwnerID() , EM_RoleValue_X ) 
	local OwnerY = ReadRoleValue( OwnerID() , EM_RoleValue_Y ) 
	local OwnerZ = ReadRoleValue( OwnerID() , EM_RoleValue_Z ) 
	local OwnerDIR = ReadRoleValue( OwnerID() , EM_RoleValue_Dir ) 
	local PlayerGuildID = GetRoleCampID( TargetID() )--玩家的陣營

	local VOC = ReadRoleValue( TID , EM_RoleValue_VOC )--玩家職業
	local P_Str = ReadRoleValue( TID , EM_RoleValue_FinStr ) 
	local P_Int = ReadRoleValue( TID , EM_RoleValue_FinInt ) 
	local P_Agi = ReadRoleValue( TID , EM_RoleValue_FinAgi ) --玩家當前敏捷

--Say(OwnerID(),"OwnerID")--插杖物件
--Say(TargetID(),"TargetID")--玩家

	local StageNpc = CreateObj( 103136 , OwnerX , OwnerY , OwnerZ , OwnerDIR , 1)

	AddToPartition( StageNpc , RoomID )  

	local N_Agi = ReadRoleValue( StageNpc , EM_RoleValue_FinAgi ) --怪當前敏捷

	if VOC == 2 then --遊俠
		P_Agi = (P_Agi*1)+N_Agi
	elseif VOC == 3 then --影行者
		P_Agi = (P_Agi*0.7)+N_Agi
	else
		P_Agi = (P_Agi*0.3)+N_Agi
	end

	WriteRoleValue( StageNpc , EM_RoleValue_AGI , P_Agi ) --寫入增傷
--Say(StageNpc , "StageNpc")--新物件
	SetRoleCampID( StageNpc, PlayerGuildID )--寫入陣營

	SetModeEx( StageNpc   , EM_SetModeType_Mark, false )--標記
	SetModeEx( StageNpc  , EM_SetModeType_HideName, true )--名稱
	SetModeEx( StageNpc , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( StageNpc , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( StageNpc  , EM_SetModeType_Move, false )--移動
	SetModeEx( StageNpc , EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( StageNpc , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( StageNpc , EM_SetModeType_NotShowHPMP, true )--不顯示血條

	CastSpelllv( StageNpc , StageNpc , 492695 , 0 )
	BeginPlot( StageNpc , "Yuyu_GW_BigSkill_0_00" , 0 )  
	BeginPlot( StageNpc , "Yuyu_GW_BigSkill_0_03" , 0 )  
end

function Yuyu_GW_BigSkill_0_00( ) --【大絕招】惡燄豪箭雨 附加功能 惡火肆虐

--Say(OwnerID(),"OwnerID")--新物件
--Say(TargetID(),"TargetID")--新物件
	sleep(10)
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 

	local OwnerX = ReadRoleValue( OwnerID() , EM_RoleValue_X ) 
	local OwnerY = ReadRoleValue( OwnerID() , EM_RoleValue_Y ) 
	local OwnerZ = ReadRoleValue( OwnerID() , EM_RoleValue_Z ) 
	local OwnerDIR = ReadRoleValue( OwnerID() , EM_RoleValue_Dir ) 
	local PlayerGuildID = GetRoleCampID( OwnerID() )--玩家的陣營

--	local StageNpc = CreateObj( 113693 , OwnerX , OwnerY , OwnerZ , OwnerDIR , 1)
	local Npc_1 = Lua_Davis_BornByMultilateral( 103136 , 3 , 20 ) --(物件ID,生出幾個,半徑)

	for j=1 , table.getn(Npc_1) do	

		SetModeEx( Npc_1[j] , EM_SetModeType_Strikback, false )--反擊
		SetModeEx( Npc_1[j] , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
		SetModeEx( Npc_1[j] , EM_SetModeType_Obstruct, false )--阻擋
		SetModeEx( Npc_1[j] , EM_SetModeType_Mark, false )--標記
		SetModeEx( Npc_1[j] , EM_SetModeType_Move, false )--移動
		SetModeEx( Npc_1[j] , EM_SetModeType_Searchenemy, false )--索敵
		SetModeEx( Npc_1[j] , EM_SetModeType_HideName, true )--名稱
		SetModeEx( Npc_1[j] , EM_SetModeType_ShowRoleHead, false )--頭像框
		SetModeEx( Npc_1[j] , EM_SetModeType_Fight , false )--可砍殺攻擊
		SetModeEx( Npc_1[j] , EM_SetModeType_DisableRotate, false )--轉向
		SetModeEx( Npc_1[j]  , EM_SetModeType_NotShowHPMP, true )--不顯示血條
		SetRoleCampID( Npc_1[j], PlayerGuildID )--寫入陣營
		CastSpelllv( Npc_1[j] , Npc_1[j] , 492694 , 0 )
		BeginPlot( Npc_1[j] , "Yuyu_GW_BigSkill_0_01" , 0 )  
		AddBuff( Npc_1[j] , 506161 , 0 , -1 )	--火海特效

	end
	sleep(50)

	local Npc_2 = Lua_Davis_BornByMultilateral( 103136 , 9 , 60 ) --(物件ID,生出幾個,半徑)

	for j=1 , table.getn(Npc_2) do	

		SetModeEx( Npc_2[j] , EM_SetModeType_Strikback, false )--反擊
		SetModeEx( Npc_2[j] , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
		SetModeEx( Npc_2[j] , EM_SetModeType_Obstruct, false )--阻擋
		SetModeEx( Npc_2[j] , EM_SetModeType_Mark, false )--標記
		SetModeEx( Npc_2[j] , EM_SetModeType_Move, false )--移動
		SetModeEx( Npc_2[j] , EM_SetModeType_Searchenemy, false )--索敵
		SetModeEx( Npc_2[j] , EM_SetModeType_HideName, true )--名稱
		SetModeEx( Npc_2[j] , EM_SetModeType_ShowRoleHead, false )--頭像框
		SetModeEx( Npc_2[j] , EM_SetModeType_Fight , false )--可砍殺攻擊
		SetModeEx( Npc_2[j] , EM_SetModeType_DisableRotate, true )--轉向
		SetModeEx( Npc_2[j]  , EM_SetModeType_NotShowHPMP, true )--不顯示血條
		SetRoleCampID( Npc_2[j], PlayerGuildID )--寫入陣營
		CastSpelllv( Npc_2[j] , Npc_2[j] , 492694 , 0 )
		BeginPlot( Npc_2[j] , "Yuyu_GW_BigSkill_0_01_2" , 0 )  
		AddBuff( Npc_2[j] , 506161 , 0 , -1 )	--火海特效
	end

end

function Yuyu_GW_BigSkill_0_01( ) --【大絕招】惡火肆虐 生存時間
	sleep(200)
	BeginPlot( OwnerID() , "Yuyu_GW_BigSkill_0_02" , 0 )  
end

function Yuyu_GW_BigSkill_0_01_2( ) --【大絕招】惡火肆虐 生存時間
	sleep(150)
	BeginPlot( OwnerID() , "Yuyu_GW_BigSkill_0_02" , 0 )  
end

function Yuyu_GW_BigSkill_0_02( ) --【大絕招】惡火肆虐 生存時間

	DelObj( OwnerID() )
end

function Yuyu_GW_BigSkill_0_03( ) --【大絕招】惡火肆虐 生存時間
	sleep(300)
	BeginPlot( OwnerID() , "Yuyu_GW_BigSkill_0_02" , 0 )  
end

--====================================================================================================================

function Yuyu_GW_BigSkill_1_00( ) --【大絕招】隕石流星雨

	local OID = OwnerID()
	local TID = TargetID()	

	SetModeEx( OID , EM_SetModeType_Show , false )--顯示
	SetModeEx( OID , EM_SetModeType_Fight , false )--可砍殺攻擊

	local RoomID = ReadRoleValue( OID ,EM_RoleValue_RoomID) 
	local OwnerX = ReadRoleValue( OID , EM_RoleValue_X ) 
	local OwnerY = ReadRoleValue( OID , EM_RoleValue_Y ) 
	local OwnerZ = ReadRoleValue( OID , EM_RoleValue_Z ) 
	local OwnerDIR = ReadRoleValue( OID , EM_RoleValue_Dir ) 
	local PlayerGuildID = GetRoleCampID( TID )--玩家的陣營

	local VOC = ReadRoleValue( TID , EM_RoleValue_VOC )--玩家職業
	local O_Int = ReadRoleValue( OID , EM_RoleValue_FinStr ) --插杖者當前智力
	local P_Int = ReadRoleValue( TID , EM_RoleValue_FinInt ) --玩家當前的智力

	local N_Int = 0

	if VOC == 4 then --法師
		P_Int = (P_Int*1)+O_Int
	elseif (VOC == 5) or (VOC == 8) then --祭司 or 自然神官
		P_Int = (P_Int*0.7)+O_Int
	else
		P_Int = (P_Int*0.3)+O_Int
	end
	WriteRoleValue( OID , EM_RoleValue_INT, P_Int ) --寫入增傷
	CastSpelllv( OID , OID , 492693 , 0 )	
--	WriteRoleValue( O_Int, EM_RoleValue_INT, P_Int ) --寫入增傷
--	CastSpelllv( O_Int , O_Int , 492693 , 0 )
	sleep(25)

--Say(OwnerID(),"OwnerID")--插杖物件
--Say(TargetID(),"TargetID")--玩家
--Say(StageNpc , "StageNpc")--新物件
	local Npc_1 = Lua_Davis_BornByMultilateral( 103135 , 3 , 50 ) --(物件ID,生出幾個,半徑)

	for j=1 , table.getn(Npc_1) do
		SetModeEx( Npc_1[j]  , EM_SetModeType_NotShowHPMP, true )--不顯示血條
		SetModeEx( Npc_1[j] , EM_SetModeType_Strikback, false )--反擊
		SetModeEx( Npc_1[j] , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
		SetModeEx( Npc_1[j] , EM_SetModeType_Obstruct, false )--阻擋
		SetModeEx( Npc_1[j] , EM_SetModeType_Mark, false )--標記
		SetModeEx( Npc_1[j] , EM_SetModeType_Move, false )--移動
		SetModeEx( Npc_1[j] , EM_SetModeType_Searchenemy, false )--索敵
		SetModeEx( Npc_1[j] , EM_SetModeType_HideName, true )--名稱
		SetModeEx( Npc_1[j] , EM_SetModeType_ShowRoleHead, false )--頭像框
		SetModeEx( Npc_1[j] , EM_SetModeType_Fight , false )--可砍殺攻擊
		SetModeEx( Npc_1[j] , EM_SetModeType_DisableRotate, true )--轉向
		SetRoleCampID( Npc_1[j], PlayerGuildID )--寫入陣營

		N_Int = ReadRoleValue( Npc_1[j]  , EM_RoleValue_FinInt ) --怪當前智力

		if VOC == 4 then --法師
			P_Int = (P_Int*1)+N_Int
		elseif (VOC == 5) or (VOC == 8) then --祭司 or 自然神官
			P_Int = (P_Int*0.7)+N_Int
		else
			P_Int = (P_Int*0.3)+N_Int
		end	
		WriteRoleValue( Npc_1[j] , EM_RoleValue_INT, P_Int ) --寫入增傷
	end

	for j=1 , table.getn(Npc_1) do
		CastSpelllv( Npc_1[j] , Npc_1[j] , 492693 , 0 )
		sleep(25)
		BeginPlot( Npc_1[j] , "Yuyu_GW_BigSkill_1_03" , 0 )  --【大絕招】隕石流星雨 生存時間
	end

end

function Yuyu_GW_BigSkill_1_01( ) --【大絕招】隕石流星雨 

	local P = 10
	local PP = Rand( P )      

	local OID = OwnerID()
	while true do
--		AddBuff( OID , 502585 , 0 , -1 )
		CastSpelllv( OID , OID , 492693 , 0 )
		sleep(60)
	end

end

function Yuyu_GW_BigSkill_1_02( ) --【大絕招】隕石流星雨 生存時間
	sleep(200)
	BeginPlot( OwnerID() , "Yuyu_GW_BigSkill_1_03" , 0 )  
end

function Yuyu_GW_BigSkill_1_03( ) --【大絕招】隕石流星雨 生存時間

	DelObj( OwnerID() )
end


--====================================================================================================================


function Yuyu_GWB_Skill_tro_01() --龍捲風

	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )
	local VOC = ReadRoleValue( OwnerID() , EM_RoleValue_VOC )--職業
	local PassCard =  CountBodyItem( OwnerID() , 206769 ) --是否具有通行證 = GM測試

	if (ZoneID == 402) or (ZoneID == 31) or (PassCard > 0) then

		BeginPlot( OwnerID()  , "Yuyu_GWB_Skill_tro_02_0" , 0 )  

	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_DAN_111700_37]", C_SYSTEM ) --你無法在此區域使用該物品！
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_DAN_111700_37]", C_SYSTEM ) 

	end



end

function Yuyu_GWB_Skill_tro_02_0() --【插杖法術】龍捲風

		BeginPlot( OwnerID()  , "Yuyu_GWB_Skill_tro_02_1" , 0 )  

end

function Yuyu_GWB_Skill_tro_02_1() --【插杖法術】龍捲風

		if BeginCastBar( OwnerID(), "[502978]", 20 , ruFUSION_ACTORSTATE_EMOTE_HANDSTAND , ruFUSION_ACTORSTATE_REVIVING , 0 ) == 1 then

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
				end
			end

			if ( result == "OKOK" ) then
				BeginPlot( OwnerID() , "Yuyu_GWB_Skill_tro_02_2" , 0 )  				
			end
		end
end

function Yuyu_GWB_Skill_tro_02_2() --【插杖法術】龍捲風
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 

	local OwnerX = ReadRoleValue( OwnerID() , EM_RoleValue_X ) 
	local OwnerY = ReadRoleValue( OwnerID() , EM_RoleValue_Y ) 
	local OwnerZ = ReadRoleValue( OwnerID() , EM_RoleValue_Z ) 
	local OwnerDIR = ReadRoleValue( OwnerID() , EM_RoleValue_Dir ) 
	local PlayerGuildID = GetRoleCampID( OwnerID() )--玩家的陣營

	local StageNpc = CreateObj( 113693 , OwnerX , OwnerY , OwnerZ , OwnerDIR , 1)

	SetModeEx( StageNpc, EM_SetModeType_Show, false )--顯示

	AddToPartition( StageNpc , RoomID )  
	MoveToflagEnabled( StageNpc , false )
	SetRoleCampID( StageNpc, PlayerGuildID )--寫入陣營

	SetModeEx( StageNpc   , EM_SetModeType_Mark, false )--標記
	SetModeEx( StageNpc  , EM_SetModeType_HideName, true )--名稱
	SetModeEx( StageNpc , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( StageNpc , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( StageNpc  , EM_SetModeType_Move, true )--移動
	SetModeEx( StageNpc , EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( StageNpc , EM_SetModeType_NotShowHPMP, true )--不顯示血條
	SetModeEx( StageNpc, EM_SetModeType_Show, true )--顯示	


	BeginPlot( StageNpc , "Yuyu_GWB_Skill_tro_03" , 0 )  
end

function Yuyu_GWB_Skill_tro_03() 

	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 

	local OID = OwnerID()
	local stime = 10

--	sleep(20)
	BeginPlot( OID , "Yuyu_GWB_Skill_tro_06" , 0 ) 
	BeginPlot( OID , "Yuyu_GWB_Skill_tro_04" , 0 ) 
	sleep(250)
	BeginPlot( OID , "Yuyu_GWB_Skill_tro_05" , 0 )  --刪除物件 

end


function Yuyu_GWB_Skill_tro_04()  --施放龍捲風 

	local P = 10
	local PP = Rand( P )      

	local OID = OwnerID()
	while true do
--		AddBuff( OID , 502585 , 0 , -1 )
		CastSpelllv( OID , OID , 494828 , 0 )
		sleep(1)
	end

end

function Yuyu_GWB_Skill_tro_05()  --刪除物件 
	DelObj(OwnerID())
end

function Yuyu_GWB_Skill_tro_06()  --移動路線
	local ID = OwnerID()
	local stime = 10

	local OldX = ReadRoleValue(  ID , EM_RoleValue_X )
	local OldY = ReadRoleValue(  ID , EM_RoleValue_Y )
	local OldZ = ReadRoleValue(  ID , EM_RoleValue_Z )
	local OldDir = ReadRoleValue(  ID , EM_RoleValue_Dir )
	local RoomID = ReadRoleValue( ID , EM_RoleValue_RoomID)
	local Cal = (math.pi/180)*(OldDir) 
	--Say(OwnerID(),"OldDir="..OldDir.." cal="..Cal.." cos="..math.cos(Cal).." sin="..math.sin(Cal))
	local dis = 300
	MoveDirect( ID, OldX+ dis*math.cos(Cal),OldY+5 ,OldZ -dis*math.sin(Cal) )

--	local Dis = 250	
--	Lua_MoveLine( ID , Dis ) --參考物件，向前移動到Dis距離的位置 (Dis 填 負數 為 向後移動)

end


function Yuyu_GW_witchgood_delitem_05()  --使用後刪除物品 
	DelBodyItem( OwnerID() , 206685 , 1 )
end
--2011.04.19 修改征戰先鋒領取問題 ---------------------------------------------------------------------------------------------
function Lua_Hao_GWar_ReCall_ID()

	local Crystal = ReadRoleValue( OwnerID() , EM_RoleValue_Register+1 )	-- 讀取水晶

	while true do
		local Leader = ReadRoleValue( Crystal , EM_RoleValue_Register+6 )	-- 讀取玩家
	--	Say( OwnerID() , "Leader = "..Leader )
		if CheckID( Leader ) == false then
		--	DebugMsg( 0 , 0 , "Miss Zone Leader" )
		--	Say( OwnerID() , "Miss Zone Leader" )
			WriteRoleValue( Crystal , EM_RoleValue_Register+6 , 0 )
			WriteRoleValue( Crystal , EM_RoleValue_Register+7 , 0 )
			Delobj( OwnerID() )
			break
		else
		--	DebugMsg( 0 , 0 , "Get Zone Leader" )
		--	Say( OwnerID() , "Get Zone Leader" )
		end
		Sleep(10)
	end
end
------------------------------------------------------------------------------------------------------------------------------------
--2013.06.11 新版召喚術：惡焰豪箭雨的判斷 --------------------------------------------------------------------------------
function YOYO_GWar_Volley()
	local Target = TargetID()
	if ReadRoleValue( Target , EM_RoleValue_IsPlayer ) == 1 then
		return true
	else
		return false	
	end
end
------------------------------------------------------------------------------------------------------------------------------------